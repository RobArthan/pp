=IGN
********************************************************************************
spc003.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
=TEX
% TQtemplate.tex
% \documentstyle[hol1,11pt,TQa4]{article}
\documentclass[a4paper,11pt]{article}
\usepackage{A4}
\usepackage{ProofPower}
\usepackage{fleqn}

\ftlinepenalty=9999
\def\Hide#1{}
\def\Bool{``$\it{:}bool\,$''}
\makeindex
\title{{\bf HOL Formalised: \\ Deductive System}}  %% Mandatory field
\author{R.D. Arthan \\ Lemma 1 Ltd. \\ rda@lemma-one.com}
\date{25 October 1993 \\ Revised \FormatDate{\VCDate}}

\begin{document}
\begin{titlepage}
\maketitle
\begin{abstract}
This is part of a suite of documents giving a formal
specification of the HOL logic. It defines the primitive
inference rules, including conservative extension mechanisms.
Related notions such as derivability are also defined.

The treatment of the HOL deductive system formally defined here is closely based on the semi-formal treatment in the documentation for the Cambridge HOL system.

An index to the formal material is provided at the end of the document.
\end{abstract}
\vfill
\begin{centering}

\bf Copyright \copyright\ : Lemma 1 Ltd \number\year \\
Reference: DS/FMU/IED/SPC001; Git revision: {\VCVersion}


\end{centering}
\thispagestyle{empty}
\end{titlepage}

\section{DOCUMENT CONTROL}
\subsection{Contents list}
\tableofcontents
\subsection{Document cross references}
\bibliographystyle{fmu}
\bibliography{fmu}

%\subsection{Changes forecast}
%When a little extra proof support is available for
%reasoning with strings, the consistency proof for the definition
%of the type $THM$ may be included here.
%
%It may be desirable to improve the readability of the
%definitions of the object language constructs in
%section \ref{DEFINITIONS} by a trick using antiquotation
%and the HOL parser to enter the necessary terms.

\newpage
\section{GENERAL}
\subsection{Scope}
This document specifies the HOL deductive system.
Some high level aspects of the implementation
of the proof development system are also discussed.
It is part of a suite of documents specifying the HOL
logic, an overview of which may be found in \cite{DS/FMU/IED/SPC001}.

\subsection{Introduction}

In  \cite{DS/FMU/IED/SPC001} a brief theoretical
discussion of the definition of deductive systems is
given. In this document we fill in the details for HOL.

The first task is to define the rules of inference.
HOL has five rules
of inference: $ABS$, $DISCH$, $INST\_TYPE$, $MP$, $SUBST$
(defined in section \ref{RULESOFINFERENCE} below)
and three axiom schemata: $ASSUME$, $BETA\_CONV$ and $REFL$
(defined in section \ref{AXIOMSCHEMATA}).
We follow \cite{SRI89a} in treating the axiom schemata
just like unary rules of inference.
Such rules are a convenient home
for infinite families of axioms that we wish to have in every theory.

With the rules of inference
in hand, we define derivability in section
\ref{DERIVABILITY}.
We then define the type of theorems of HOL as those pairs
$(s, T)$ where $T$ is a theory and $s$ is a sequent in the
language of $T$ derivable from the axioms of $T$.

Section \ref{CONSISTENCY},
defines the type of all theorems and
specifies the notions of consistency and conservative
extension.

Mechanisms for extending theories by
making definitions are of great practical
importance, particularly those which preserve consistency.
Section \ref{DEFINITIONS} discusses
the means by which theories may be extended in the HOL
system. Of particular importance are certain mechanisms
for introducing new constants and types.

In section \ref{INIT} we define the individual axioms
of the HOL logic.
The resulting theory is of special
interest, as are what we call its definitional extensions,
which we define in section \ref{DEFINITIONALEXTENSIONS}:
they are all consistent and have
a common standard set-theoretic model;
their theorems comprise what are normally taken to
be the theorems of HOL by those who shun axiomatic
extensions.




\section{PREAMBLE}

\Hide{
extend_theory"spc003";
}
We introduce the new theory. Its parent is
the theory $spc001$ which contains definitions concerned
with the HOL language.
=SML
open_theory"spc001";
new_theory⦏"spc003"⦎;
=TEX
=TEX
\section{THE RULES OF INFERENCE} \label{RULESOFINFERENCE}

In this section we treat the syntax manipulating
functions required to define the various rules of
inference. We consider each inference rule in turn.
In the HOL system the inference rules are functions
which take theorems (and other things) as arguments
and return theorems. Since we cannot define
the type of theorems until we have defined the inference
rules we define the rules as functions taking
sequents (and other things) as arguments and returning
sequents.

\subsection{Free Variables}

{\it freevars\_list} returns the free variables of a term
listed in order of first appearance (from left to
right in the usual concrete syntax).

ⓈHOLCONST
	⦏freevars_list⦎: TERM → ((STRING × TYPE)LIST)
├
	∀s : STRING; ty : TYPE; tm f a vty b : TERM ⦁
	freevars_list (mk_var(s, ty)) = [(s, ty)]
	∧
	freevars_list (mk_const(s, ty)) = []
	∧
	(has_mk_comb(f, a) tm ⇒ freevars_list tm = freevars_list f ⁀ freevars_list a)
	∧
	((has_mk_abs(vty, b) tm ∧ mk_var(s, ty) = vty) ⇒
		freevars_list tm = freevars_list b ↾ ~{(s, ty)})
■
=TEX
{\it freevars\_set} returns the set of free variables
of a term.
We use it in cases where the order of appearance
of the free variables in the term is immaterial.

ⓈHOLCONST
	⦏freevars_set⦎: TERM → (STRING × TYPE) SET
├
	∀tm : TERM⦁freevars_set tm = Elems(freevars_list tm)
■
=TEX


\subsection{Object Language Constructs}

To define the rules of inference we need to form
certain object language types and terms.
We have already defined the function space type
constructor.
The other definitions needed are given in this
section.


We need to form instances of the polymorphic constant
``='':

ⓈHOLCONST
	⦏Equality⦎ : TYPE → TERM
├
	∀ ty ⦁ Equality ty = mk_const("=", Fun ty (Fun ty Bool))
■
=TEX

The following is our analogue of the derived
constructor function for equations in the HOL system.

ⓈHOLCONST
	⦏has_mk_eq⦎ : (TERM × TERM) → TERM → BOOL
├
	∀ lhs rhs tm ⦁ has_mk_eq(lhs, rhs) tm ⇔
	∃ tm2 ⦁
		has_mk_comb(Equality(type_of_term lhs), lhs) tm2
	∧	has_mk_comb(tm2, rhs) tm
■
=TEX

We also need to form implications. The following functions
are analogous to those treating equality above.
ⓈHOLCONST
	⦏Implication⦎ : TERM
├
	Implication = mk_const("⇒", Fun Bool (Fun Bool Bool))
■
=TEX

ⓈHOLCONST
	⦏has_mk_imp⦎ : (TERM × TERM) → TERM → BOOL
├
	∀ lhs rhs tm ⦁ has_mk_imp(lhs, rhs) tm ⇔
	∃ tm2 ⦁
		has_mk_comb(Implication, lhs) tm2
	∧	has_mk_comb(tm2, rhs) tm
■
=TEX


\subsection{Substitution of Equals}

In this section we define the inference rule {\it SUBST}.

In essence, {\it SUBST} says that given a
theorem whose conclusion is an equation, ${\cal A} = {\cal B}$, where
$\cal A$ and $\cal B$ are arbitrary terms of the same
type, and given any other theorem with conclusion
$\cal C$, we may obtain a new theorem by substituting
$\cal B$ for
any subterm of $\cal C$ which is identical with $\cal A$. This is subject to the proviso that no variable
capture problems arise, i.e. no
free variables of $\cal B$ should become bound in the
conclusion of the new theorem. (The assumption set of the
consequent theorem is the union of the assumption sets of
the antecedent theorems.)

The inference rule is, in fact, slightly more
general. It allows one to use a whole set of theorems
whose conclusions are equations to perform (simultaneous)
substitutions for many subterms of $\cal C$. Moreover,
it is implemented as a functional relation, effectively by
renaming any bound variables of $\cal C$ which would
give rise to the capture problem.

The inference rule is parametrised by a template term
and a set of some of its free variables, one for each equation.
The actual statement of the rule is, essentially, that,
if the result of substituting the left hand sides
of the equations for the corresponding variables
in the template term
is equal to $\cal C$ ({\it modulo} renaming bound
variables), then we may infer the result of substituting
the right hand sides of the equations for the
corresponding template variables in the template term
(providing we rename bound variables to avoid the capture
problem).


The notions we must formalise are therefore:
(i) substituting terms for
free variables in a term according to a given mapping
of variables to terms renaming bound variables
as necessary to avoid variable capture;
(ii) testing equivalence of
terms {\it modulo} renaming of bound variables (aka.
$\alpha$-conversion).

\subsubsection{Substitution}

We will need to choose new names for variables.
More precisely,
given a variable and a set of same we will
wish to rename the variable, when necessary,
to ensure that the result
does not lie in the set.
In practice in an implementation we would insist that the new name
be derived from the old one in a specified way.

ⓈHOLCONST
	⦏variant⦎ : ((STRING × TYPE) SET) → (STRING × TYPE) → STRING
├
	∀ vs v ty ⦁
		if ¬(v, ty) ∈ vs
		then variant vs (v, ty) = v
		else ¬(variant vs (v, ty), ty) ∈ vs
■
=TEX


Now we can define $subst$. Given a function $R$
associating free variables with terms,
$subst\,R\,t1$ is the
term resulting from replacing every free variable
$mk\_var(s, t)$
in {\it t1} by $\it R(mk\_var(s, t))$ with bound
variables renamed as necessary to avoid capture.
Variables which are not to be changed correspond
to pairs $(s, t)$ with $R (s, t) =  mk\_var (s, t)$.

Note $R$ here is intended to respect types, in the
sense that
$∀s ty⦁type\_of\_term(R(s,ty)) = ty$, but this is not
checked here (since it is convenient for $subst$ to be
a total function). This property should be checked whenever
$subst$ is used.

The only difficult case in $subst$ is when the
second argument is an abstraction. In this case we
calculate the variables which must not get captured (this
is the value $new\_frees$ below) and use $variant$ to
give an alternative name for the bound variable if necessary.
We then perform the substitution on the body using
a function, $RR$, which is $R$ modified to send the
old bound variable to the new one.

ⓈHOLCONST
	⦏subst⦎ : ((STRING × TYPE) → TERM) → TERM → TERM
├
	∀ R :(STRING × TYPE) → TERM; tm : TERM;
	s : STRING; ty : TYPE; vty : TERM;
	f : TERM; a : TERM; b : TERM
	⦁
	subst R (mk_var(s, ty)) = R(s,ty)
	∧
	subst R (mk_const(s, ty)) = mk_const(s, ty)
	∧
	(has_mk_comb(f, a) tm ⇒
	(subst R tm = εt⦁has_mk_comb(subst R f, subst R a)t))
	∧
	((has_mk_abs(vty, b) tm ∧ mk_var(s, ty) = vty) ⇒
	(subst R tm =
		let new_frees = ⋃(Graph (freevars_set o R) Image
					(freevars_set b \ {(s, ty)}))
		in  let s' = variant new_frees (s, ty)
		in let RR x = if x = (s, ty) then mk_var (s', ty) else R x
		in
			εt⦁
			has_mk_abs
			(mk_var(s', ty), subst RR b)t
	))
■
=TEX

The special case of substitution
where we simply wish to rename a variable
is needed in the definition of our $\alpha$-conversion
test and elsewhere.
The following function $rename$ is used for this purpose.
$rename (v, ty) w\, e$ is the result of changing
the name in every free occurrence of the
variable with name $v$, and type $ty$, in the
term $e$, to $w$, renaming any bound variables
as necessary.

ⓈHOLCONST
	⦏rename⦎ : (STRING × TYPE) → STRING → TERM → TERM
├
	∀ v : STRING; ty : TYPE; w: STRING
	⦁
	rename (v, ty) w =
	subst (λx⦁if x = (v, ty) then mk_var(w, ty) else mk_var x)
■
=TEX


\subsubsection{$\alpha$-conversion}
Our $\alpha$-conversion test is as follows:
ⓈHOLCONST
	⦏aconv⦎ : TERM → TERM → BOOL
├
	∀t1 t2 : TERM⦁
	aconv t1 t2 ⇔
		(t1 = t2)
	∨	(∃t1f t1a t2f t2a⦁
			has_mk_comb(t1f, t1a)t1
		∧	has_mk_comb(t2f, t2a)t2
		∧	aconv t1f t2f ∧ aconv t1a t2a)
	∨	(∃v1 v2 ty v1ty v2ty b1 b2⦁
			has_mk_abs(v1ty, b1)t1	∧	has_mk_abs(v2ty, b2)t2
		∧	mk_var(v1, ty) = v1ty	∧	mk_var(v2, ty) = v2ty
		∧	aconv b1 (rename (v2, ty) v1 b2)
		∧	((v1 = v2) ∨ (¬(v1, ty) ∈ freevars_set b2)))
■
=TEX

\subsubsection{The Inference Rule $SUBST$}
We can now define the inference rule.
Its first argument gives the correspondence between the
template variables and equation theorems.
We could take this argument to
behave as {\it REFL\_axiom o mk\_var} on variables which
are not template variables .
Note that, to allow implementation as a partial function,
we test up to $\alpha$-convertibility on the first
sequent argument only.
Note also that the way that the first argument to $subst$
is constructed by dismantling equations ensures that
it respects types.
ⓈHOLCONST
	⦏SUBST_rule⦎ : ((STRING × TYPE) → SEQ) →
			TERM → SEQ → SEQ → BOOL
├
	∀ eqs tm old_asms old_conc new_asms  new_conc⦁
	SUBST_rule eqs tm (old_asms, old_conc) (new_asms, new_conc) ⇔
	(∀v ty ⦁
		∃lhs rhs⦁
		has_mk_eq(lhs, rhs)(concl(eqs(v, ty))) ∧
		(type_of_term lhs = ty))
	∧
	(aconv old_conc (subst(λ(v,ty)⦁εlhs⦁∃rhs⦁has_mk_eq(lhs, rhs)(concl(eqs(v,ty))))tm))
	∧
	(new_conc = subst (λ(v,ty)⦁εrhs⦁∃lhs⦁has_mk_eq(lhs, rhs)(concl(eqs(v,ty))))tm)
	∧
	(new_asms = old_asms ∪ ⋃ {asms | ∃vty⦁asms = (hyp (eqs vty))})
■
=TEX

\subsection{Abstraction: ABS}

Again {\it ABS} is a partial function which we
specify as a relation:

ⓈHOLCONST
	⦏ABS_rule⦎ : (STRING × TYPE) → SEQ → SEQ → BOOL
├
	∀ vty old_asms old_conc new_asms new_conc ⦁
	ABS_rule vty (old_asms, old_conc) (new_asms, new_conc) ⇔
	(∃ old_lhs old_rhs new_lhs new_rhs v⦁
		has_mk_eq(old_lhs, old_rhs)old_conc ∧
		has_mk_eq(new_lhs, new_rhs)new_conc ∧
		mk_var vty = v ∧
		has_mk_abs(v, old_lhs) new_lhs ∧
		has_mk_abs(v, old_rhs) new_rhs)
	∧
	(¬vty ∈ ⋃(Graph freevars_set Image old_asms))
	∧
	(new_asms = old_asms)
■
=TEX



\subsection{Type Instantiation}

The ability to prove and use general (polymorphic)
theorems  is one of the great strengths of the HOL
system. The feature in the inference system which
gives this strength is the inference rule {\it INST\_TYPE}
which allows us to instantiate the type variables
in the conclusion of a polymorphic theorem.

In essence, the inference rule says that, given a theorem
with conclusion, $\cal A$, say, we may infer the theorem
which has the same assumption set and whose conclusion
results from instantiating every type in $\cal A$
according to a given mapping of type variables to types.
This is subject to two provisos: (i) no type variable may
be changed which appears in the assumption set for the
theorem; (ii) no two variables in the assumptions or
conclusion of the antecedent theorem, which are
different, by virtue of their type,  should become
identified in the consequent theorem as a result of
the transformation.

The first proviso is, we believe, only enforced to preserve
a convention of natural deduction systems,
whereby inference rules
involve only simple set operations on the assumption
sets. It would seem to be quite in order for the first
proviso to be dropped provided we insisted that the
type instantiation be applied to every term in the sequent
(we have, of course, not done this).

The second proviso cannot be avoided. Consider for
example: $λ(x:**)⦁λ(x:*)⦁(x:**)$. If the types in this were
instantiated according to $\{:** ↦ :*, :* ↦ :*\}$,
then from:
$$⊢ ∀(y:**)(z:*)⦁(λ(x:**)⦁λ(x:*)⦁(x:**))y z = y$$
we could infer that:
$$⊢ ∀(y:*)(z:*)⦁(λ(x:*)⦁λ(x:*)⦁(x:*))y z = y$$
whence, by $\beta$-conversions:
$$⊢ ∀(y:*)(z:*)⦁z = y.$$
This leads to a contradiction whenever $:*$ is instantiated
to a type with more than one inhabitant.

To permit an implementation which is convenient to use,
the inference rule is actually formulated without the
second proviso. Instead, variables (both free and bound,
in general) in the conclusion of the consequent theorem,
which would violate the rule are renamed to
avoid the problem. It is valid to rename free variables
in these circumstances, given the first proviso, since
the variables in question cannot occur free in the
assumption set. Note that it would be invalid to
rename free variables in $\cal A$
which are not changed by the type instantiation
(since these may appear free in the assumption set).

Formalising these notions is a little tricky. We present
here a highly unconstructive specification, reminiscent
of $\alpha$-conversion.
The notion to be formalised is the predicate on
pairs of terms which says whether one is a type instance
of another according to a given mapping of type
variables to types and with respect to a set of
variables with which clashes must not occur (this
will be the set of free variables of the assumptions
in practice).

It is entertaining and instructive to consider
algorithms meeting these specifications.

\subsubsection{Instantiation of Terms}

Instantiation of terms is a little tricky.
The following two functions should be viewed as
local to the function {\it inst}.
{\it inst\_loc1} is very similar to an
$\alpha$-convertibility test. Indeed {\it aconv} could
have been defined as $\it inst\_loc1\,I$.
The first {\it TERM} argument of {\it inst\_loc1}
and {\it inst\_loc2}
gives the terms whose types are being instantiated (i.e.
it is the ``more polymorphic'' term).

$inst\_loc1$ checks that one term, $tm2$, is a type
instance of $tm1$, according to a mapping from
type variable names to types given by $tysubs$,
under the assumption that the free variable names
agree, i.e. that the first occurrence of each variable which
may need renaming will be its binding occurrence in
a $λ-abstraction$.
ⓈHOLCONST
	⦏inst_loc1⦎ : (STRING → TYPE) → TERM → TERM → BOOL
├
	∀
	tysubs : STRING → TYPE;
	tm1 tm2 : TERM⦁
	inst_loc1 tysubs tm1 tm2 ⇔
		(∃s ty1 ty2 mk_X⦁
			((mk_X = mk_var) ∨ (mk_X = mk_const))
		∧	mk_X(s, ty1) = tm1 ∧ mk_X(s, ty2) = tm2
		∧	(ty2 = inst_type tysubs ty1))
	∨	(∃tm1f tm1a tm2f tm2a⦁
			has_mk_comb(tm1f, tm1a)tm1 ∧ has_mk_comb(tm2f, tm2a)tm2
		∧	inst_loc1 tysubs tm1f tm2f ∧ inst_loc1 tysubs tm1a tm2a)
	∨	(∃v1 v2 ty1 ty2 b1 b2 v1ty1 v2ty2 ⦁
			mk_var(v1, ty1) = v1ty1 ∧ has_mk_abs(v1ty1, b1)tm1
		∧	mk_var(v2, ty2) = v2ty2 ∧ has_mk_abs(v2ty2, b2)tm2
		∧	inst_loc1 tysubs (rename (v1, ty1) v2 b1) b2
		∧	(ty2 = inst_type tysubs ty1)
		∧	¬(∃ ty3 v2ty3 ⦁
				mk_var(v2, ty3) = v2ty3
			∧	((v2, ty3) ∈ freevars_set b1)
			∧	(ty2 = inst_type tysubs ty3)
			∧	(¬v2ty3 = v1ty1) ))
■
=TEX

$inst\_loc2$ uses $inst\_loc1$ to check that a term $tm2$
is a type instance of the result of renaming free
variables of a term $tm2$ according to a mapping
given by a list of pairs. It also checks that
the type of the second variable in each pair in the list
is a type instance of the type of the first variable
in the pair,
and that the second variable in each pair
is not in the set, $avoid$, unless both names and types
agree for that pair.
In the application of $inst\_loc2$ in $inst$ the list
of pairs is obtained by combining the free variable lists
of the two terms side by side.
The set $avoid$ is a set of variables (coming from
the assumptions of a sequent) whose free occurrences
must not change as a result of the type instantiation.
ⓈHOLCONST
	⦏inst_loc2⦎ : ((STRING × TYPE) SET) →
		(STRING → TYPE) →
		(((STRING × TYPE) × (STRING × TYPE)) LIST) →
		TERM → TERM → BOOL
├
	∀avoid : (STRING × TYPE) SET;
	tysubs :STRING → TYPE;
	v1 : STRING; ty1 : TYPE;
	v2 : STRING; ty2 : TYPE;
	rest : ((STRING × TYPE) × (STRING × TYPE)) LIST;
	tm1 tm2 : TERM⦁
	(inst_loc2 avoid tysubs [] tm1 tm2 ⇔
		inst_loc1 tysubs tm1 tm2)
	∧
	(inst_loc2 avoid tysubs (Cons ((v1, ty1),(v2, ty2)) rest) tm1 tm2 ⇔
		(((v2, ty2) ∈ avoid) ⇒ ((v1, ty1) = (v2, ty2)))
	∧	(ty2 = inst_type tysubs ty1)
	∧	inst_loc2 avoid tysubs rest
		(rename (v1, ty1) v2 tm1) tm2)
■
=TEX


With the above preliminaries we can now define {\it inst}.
Note that the condition that the free variable lists of
the two terms have the same length is required to ensure
that $inst\_loc2$ examines each free variable of each
term.

ⓈHOLCONST
	⦏inst⦎ : ((STRING × TYPE) SET) →
		(STRING → TYPE) → TERM → TERM
├
	∀avoid : (STRING × TYPE) SET;
	tysubs :STRING → TYPE; tm1 : TERM⦁
	let tm2 = inst avoid tysubs tm1
	in let fl1 = freevars_list tm1
	in let fl2 = freevars_list tm2
	in
		((Length fl1 = Length fl2)
	∧	inst_loc2 avoid tysubs (Combine fl1 fl2) tm1 tm2)
■
=TEX

\subsubsection{The Inference Rule $INST\_TYPE$}

Given $inst$, we need a few simple auxiliaries before
we can define the inference rule $INST\_TYPE$.

We need to detect the type variables in a term.
We use some auxiliary functions to
do this: $type\_tyvars$ detects the type variables in
a type.

ⓈHOLCONST
	⦏type_tyvars⦎ :  TYPE → (STRING SET)
├
		(∀s⦁  type_tyvars (mk_var_type s) = {s})
	∧	(∀s tl⦁ type_tyvars (mk_type(s, tl)) =
			⋃ (Elems (Map type_tyvars tl)))
■
=TEX
$term\_types$ detects the types in a term.
ⓈHOLCONST
	⦏term_types⦎ :  TERM → (TYPE SET)
├
	∀ tm : TERM; s: STRING; ty : TYPE;
	f : TERM; a : TERM; v: TERM; b: TERM⦁
	term_types (mk_var(s, ty)) = {ty}
	∧
	term_types (mk_const(s, ty)) = {ty}
	∧
	(has_mk_comb(f, a) tm ⇒ (term_types tm = term_types f ∪ term_types a))
	∧
	(has_mk_abs(v, b) tm ⇒ (term_types tm = term_types v ∪ term_types b))
■
=TEX
$term\_tyvars$ detects all the type variables
in a term using the previous two functions.
ⓈHOLCONST
	⦏term_tyvars⦎ :  TERM → (STRING SET)
├
	∀tm ⦁ term_tyvars tm = ⋃(Graph type_tyvars Image (term_types tm))
■
=TEX
$INST\_TYPE\_rule$ is now readily defined:
ⓈHOLCONST
	⦏INST_TYPE_rule⦎ : (STRING → TYPE) → SEQ → SEQ → BOOL
├
	∀ tysubs old_asms old_conc new_seq⦁
	INST_TYPE_rule tysubs (old_asms, old_conc) new_seq ⇔
	(∀ tyv ⦁
		(tyv ∈ ⋃ (Graph term_tyvars Image old_asms)) ⇒
		(tysubs tyv = mk_var_type tyv))
	∧
	let asms_frees = ⋃ (Graph freevars_set Image old_asms)
	in
		new_seq = (old_asms, inst asms_frees tysubs old_conc)
■
=TEX


\subsection{Discharging an Assumption: DISCH}

{\it DISCH} is, in essence,
the usual rule of natural deduction
which allows one to infer from a proof of $\cal B$
on the assumption $\cal A$, that
${\cal A} ⇒ \cal B$ on no assumption.
The actual rule is suitably generalised to cover
sequents and their assumption sets. It is not
required that $\cal A$ be in the assumption set,
and the logic would probably not be complete
otherwise.

ⓈHOLCONST
	⦏DISCH_rule⦎ : TERM → SEQ → SEQ → BOOL
├
	∀ tm old_asms old_conc new_seq ⦁
	DISCH_rule tm (old_asms, old_conc) new_seq ⇔
	(type_of_term tm = Bool) ∧
	(new_seq = ((old_asms \ {tm}), εt⦁has_mk_imp(tm, old_conc)t))
■
=TEX

\subsection{Modus Ponens: MP}

This is the usual rule: from ${\cal A} ⇒ {\cal B}$
and ${\cal A}$, infer ${\cal B}$.
This generalises to sequents by taking the union
of the assumption sets.

ⓈHOLCONST
	⦏MP_rule⦎ : SEQ → SEQ → SEQ → BOOL
├
	∀ imp_asms imp_conc ant_asms ant_conc new_asms new_conc ⦁
	MP_rule (imp_asms, imp_conc) (ant_asms, ant_conc) (new_asms, new_conc) ⇔
	(has_mk_imp(ant_conc, new_conc)imp_conc) ∧
	(new_asms = imp_asms ∪ ant_asms)
■
=TEX


\section{THE AXIOM SCHEMATA} \label{AXIOMSCHEMATA}


\subsection{The Axiom Schema ASSUME}

{\it ASSUME} allows us to infer
for any boolean term $\cal A$, that $\cal A$
holds on the assumptions $\{{\cal A}\}$.
This is straightforward to formalise. We must check
that the term being assumed is of the right type.
ⓈHOLCONST
	⦏ASSUME_axiom⦎ : TERM → SEQ → BOOL
├
	∀ tm seq ⦁ ASSUME_axiom tm seq ⇔
	(type_of_term tm = Bool) ∧
	(seq = ({tm}, tm))
■
=TEX

\subsection{The Axiom Schema REFL}
{\it REFL} says that for any term $\cal A$,
we may infer that ${\cal A} = {\cal A}$ without
assumptions.

ⓈHOLCONST
	⦏REFL_axiom⦎ : TERM → SEQ
├
	∀ tm ⦁ REFL_axiom tm = ({}, εt⦁has_mk_eq(tm, tm)t)
■
=TEX

\subsection{The Axiom Schema BETA\_CONV}

{\it BETA\_CONV} says that, without any assumptions,
any $\beta$-redex is
equal to its $\beta$-reduction.
This is straightforward
to define, given the apparatus we used to define
{\it SUBST}.
Note that the way we construct the first argument to
$subst$ by dismantling a combination ensures that it
respects types.
ⓈHOLCONST
	⦏BETA_CONV_axiom⦎ : TERM → SEQ → BOOL
├
	∀ tm new_seq⦁
	BETA_CONV_axiom tm new_seq ⇔
	∃ v ty vty b abs a ⦁
	mk_var(v, ty) = vty ∧
	has_mk_abs(vty, b)abs ∧
	has_mk_comb(abs, a)tm ∧
	(new_seq =
	let subs: ((STRING × TYPE) → TERM) =
		(λ(vx, tyx)⦁if vx = v ∧ tyx = ty then a else mk_var(vx, tyx))
	in
		({}, (εt⦁has_mk_eq(tm, subst subs b)t)))
■
=TEX


\section{DERIVABILITY} \label{DERIVABILITY}


In this section we will define derivability.
This is a relation between sets of sequents
and sequents. As usual, we first define direct
derivability.
We include instances of the axiom schemata as valid
direct derivations from no premisses. This is merely
for convenience, we could equally well include all
instances of the axiom schemata as axioms in every theory
when theories are defined.

ⓈHOLCONST
	⦏directly_derivable_from⦎ : SEQ → (SEQ SET) → BOOL
├
	∀ seq seqs ⦁
	directly_derivable_from seq seqs ⇔
	(∃ eqs tm old_seq ⦁
	Ran (Graph eqs) ⊆ seqs ∧ old_seq ∈ seqs ∧ SUBST_rule eqs tm old_seq seq)
	∨
	(∃ vty old_seq ⦁ old_seq ∈ seqs ∧ ABS_rule vty old_seq seq)
	∨
	(∃ tysubs old_seq ⦁ old_seq ∈ seqs ∧ INST_TYPE_rule tysubs old_seq seq)
	∨
	(∃ tm old_seq ⦁ old_seq ∈ seqs ∧ DISCH_rule tm old_seq seq)
	∨
	(∃ imp_seq ant_seq ⦁
	imp_seq ∈ seqs ∧ ant_seq ∈ seqs ∧ MP_rule imp_seq ant_seq seq)
	∨
	(∃ tm ⦁ ASSUME_axiom tm seq)
	∨
	(∃ tm ⦁ seq = REFL_axiom tm)
	∨
	(∃ tm ⦁ BETA_CONV_axiom tm seq)
■
=TEX

Proofs will just be lists of sequents. Any non-empty
list is a valid proof (of the sequent at its
head) on the premisses given by those elements
of the list which are not directly derivable
from elements later in the list.
There is little point in making the relevant type
definition for a syntactic class of proofs in this sense,
since they contain so little information.
We simply define the function which extracts the set
of premisses.

ⓈHOLCONST
	⦏premisses⦎ :  (SEQ LIST) → (SEQ SET)
├
	∀ seq rest ⦁
	premisses [] = {}
	∧
	premisses (Cons seq rest) =
	if directly_derivable_from seq (Elems rest)
	then premisses rest
	else {seq} ∪ premisses rest
■
=TEX


ⓈHOLCONST
	⦏derivable_from⦎ : SEQ → (SEQ SET) → BOOL
├
	∀ seq seqs ⦁
	derivable_from seq seqs =
	∃ seql ⦁ premisses (Cons seq seql) ⊆ seqs
■
=TEX

\section{NORMAL THEORIES} \label{THEORIES}
In \cite{DS/FMU/IED/SPC001} a type $THEORY$ is defined
to represent the idea of a theory comprising signatures
governing the formation of types and terms and a set
of axioms. However the type $THEORY$ is too general
for our present purposes, since
we have formulated rules of inference on the assumption
that the nullary type ``${:}bool$'' and the
constants ``$=$'' and ``$⇒$'' are available.
In this section we define a predicate $normal\_theory$
which selects the theories in which the inference
rules are intended to be valid.
(The normal theories correspond to those whose type
structures and signatures are standard in the terminology
of \cite{SRI89a}. Unfortunately the term {\it standard
theory} is used for a stronger notion in \cite{SRI89a}.)

\subsection{Object Language Constructs}
To define the type of all well-formed HOL theories
we need two further object language constructs: the
choice function ``$ε$'' and the type of individuals``$:ind$''.
These are required since we
will follow \cite{SRI89a} in insisting
on the presence of the equality, implication and
choice functions in each theory.
It is noteworthy however that neither the rules of inference
nor the standard
conservative extension mechanisms require
choice or the individuals; they are only used in the
axioms given in section \ref{INIT}.

ⓈHOLCONST
	⦏Star⦎ : TYPE
├
	Star = mk_var_type "*"
■
=TEX

ⓈHOLCONST
	⦏Choice⦎ : TERM
├
	Choice = mk_const(("ε", Fun (Fun Star Bool) Star))
■
=TEX

ⓈHOLCONST
	⦏Ind⦎ : TYPE
├
	Ind = mk_type("ind", [])
■
=TEX

\subsection{Normal Thoeries}
We now wish to define the predicate $normal\_theory$. It is natural
to say that the normal theories are those which extend the minimal
normal theory which contains only ``${:}bool$'', ``$=$'' etc.
Thus we must define this minimal normal theory and also the notion
of extension of theories.

$MIN$ is the minimal normal theory. It is represented
by the triple $MIN\_REP$:
ⓈHOLCONST
	⦏MIN_REP⦎ : TY_ENV × CON_ENV × SEQS
├
	MIN_REP = (
		{("bool", 0); ("→",  2 ); ("ind", 0 )},
	 	{("=", Fun Star (Fun Star Bool));
		 ("⇒", Fun Bool (Fun Bool Bool));
		 ("ε", Fun (Fun Star Bool) Star)},
	 	{}
	)
■
=TEX
ⓈHOLCONST
	⦏MIN⦎ : THEORY
├
	MIN = abs_theory MIN_REP
■
=TEX

Extension for objects of type {\it THEORY} is
the following binary relation:

=SML
declare_infix(200, "extends");
ⓈHOLCONST
	$⦏extends⦎ : THEORY → THEORY → BOOL
├
	∀ thy1 thy2⦁
	thy1 extends thy2 ⇔
	(types thy2 ⊆ types thy1) ∧
	(constants thy2 ⊆ constants thy1) ∧
	(axioms thy2 ⊆ axioms thy1)
■
The normal theories are those which extend the
minimal theory {\it MIN}. Note that we do not
exclude inconsistent theories here. (This corresponds
to the possibility of introducing inconsistent axioms
in the HOL system).

ⓈHOLCONST
	⦏is_normal_theory⦎ : THEORY SET
├
	∀thy⦁thy ∈ is_normal_theory = thy extends MIN
■
=TEX




\section{THEOREMS}
\label{THEOREMS}

We can, at last, define the type of all HOL theorems.
A theorem will consist of a sequent and a theory.
The type is the subtype of the type of all such  pairs
in which the sequent is well-formed with respect to the
type and constant environments of the theory and in which
the sequent may be derived from the axioms of the theory.

ⓈHOLCONST
	⦏is_thm⦎	: (SEQ × THEORY) SET
├────────────
	∀seq thy⦁
	(seq, thy) ∈ is_thm ⇔
	thy ∈ is_normal_theory
	∧
	seq ∈ sequents thy
	∧
	derivable_from seq (axioms thy)
■
=TEX

Note that if $(seq, thy)$ is a theorem in this sense,
the derivation of $seq$ from the axioms of $thy$ may
involve sequents which are not well-formed with respect
to $thy$ (i.e. which contain type operators or constants
which are not in $thy$). This is allowed since it simplifies
the definition of derivability and makes no difference
to the set of theorems in a given theory (this is essentially
the fact that the extension mechanisms $new\_type$ and
$new\_constant$ are conservative).

Proving that $∃thm⦁thm ∈ is\_thm$ involves rather more
work than has been involved in previous type definitions.
(A witness is easy to supply, e.g. $(REFL\_axiom\,(mk\_var(`x, Star)), MIN)$ would do. However, to show that it is a witness
we need to compute $sequents\,MIN$ and to do this we
must show that $MIN\_REP$ is indeed the representative
of a theory and checking the conditions on the two
environments is rather long-winded).
For the time being we therefore defer this proof task
and use $type\_spec$ to define the type, $THM$,
of theorems.

=SML
type_spec {rep_fun="rep_thm", def_tm = ⌜
	⦏THM⦎ ≃ ⦏mk_thm⦎ Of is_thm
⌝
};
=TEX
The components of a theorem are extracted using
the following functions:
ⓈHOLCONST
	⦏thm_seq⦎ : THM → SEQ
├
	∀ thm ⦁
	thm_seq thm = Fst(rep_thm thm)
■
=TEX
ⓈHOLCONST
	⦏thm_thy⦎ : THM → THEORY
├
	∀ thm ⦁
	thm_thy thm = Snd(rep_thm thm)
■
=TEX
\section{CONSISTENCY AND CONSERVATIVE EXTENSION}
\label{CONSISTENCY}
A theory is consistent if not every sequent which
is well-formed in it can be derived from the axioms:

ⓈHOLCONST
	⦏consistent_theory⦎ : THEORY SET
├
	∀ thy ⦁
	thy ∈ consistent_theory  ⇔
	∃ seq ⦁
	(seq ∈ sequents thy)
	∧
	¬(derivable_from seq (axioms thy))
■
=TEX

An extension of a theory is conservative if no sequent
of the smaller theory is provable in the larger but not
in the smaller.
=SML
declare_infix(200, "conservatively_extends");
ⓈHOLCONST
	$⦏conservatively_extends⦎ : THEORY → THEORY → BOOL
├
	∀ thy1 thy2⦁
	thy1 conservatively_extends thy2 ⇔
	(thy1 extends thy2) ∧
	(∀ seq ⦁
	(seq ∈ sequents thy2) ⇒
	(derivable_from seq (axioms thy1)) ⇒
	(derivable_from seq (axioms thy2)))
■


\section{DEFINITIONAL EXTENSIONS} \label{DEFINITIONS}

\subsection{Object Language Constructs}

A theory {\it LOG}
in which more of the standard logical apparatus is
available will be needed to define some of the definitional
extension mechanisms.
For example, {\it new\_type\_definition}
works with a theorem whose conclusion must be an
existentially quantified term of a particular form.
To define {\it LOG} we need some more object language
types and terms and these are defined in this section.
(It is convenient to leave the definition of {\it LOG}
itself until we have defined {\it new\_definition}.)

The formulation of the various logical connectives
follows the HOL manual, \cite{SRI89a}.

It is helpful now to
have the following term constructor functions.
Note that we are now using total functions to
approximate partial ones; we must, therefore, be
careful only to apply them to appropriate arguments.

ⓈHOLCONST
	⦏mk_comb⦎ : (TERM × TERM) → TERM
├
	mk_comb = $ε o has_mk_comb
■
=TEX
ⓈHOLCONST
	⦏mk_abs⦎ : (TERM × TERM) → TERM
├
	mk_abs = $ε o has_mk_abs
■
=TEX
ⓈHOLCONST
	⦏mk_eq⦎ : (TERM × TERM) → TERM
├
	mk_eq = $ε o has_mk_eq
■
=TEX
ⓈHOLCONST
	⦏mk_imp⦎ : (TERM × TERM) → TERM
├
	mk_imp = $ε o has_mk_imp
■
=TEX

We can now define the object language constructs needed.
(These could be defined via our explicit representations
of types and terms using strings. This has not been done
since the explicit concrete
syntax used is very  hard to read.)
\subsubsection{Truth}
The constant $T : bool$ is defined by the following equation:
$$T = ((λ(x:bool) ⦁ x) = (λ(x:bool) ⦁ x))$$

ⓈHOLCONST
	⦏Truth⦎ : TERM
├
	Truth = mk_const("T", Bool)
■
=TEX
ⓈHOLCONST
	⦏Truth_def⦎ : TERM
├
	Truth_def =
	let x = mk_var("x", Bool)
	in
	mk_eq(mk_abs(x, x), mk_abs(x, x))
■
=TEX
\subsubsection{Universal Quantification}
The constant $∀ : (* → bool) → bool$ is defined by
the following equation:
$$\$∀ = (λ(P : * → bool) ⦁ P = (λ(x:*) ⦁ T)$$

ⓈHOLCONST
	⦏Forall⦎ : TYPE → TERM
├
	∀ ty⦁Forall ty = mk_const("∀", Fun (Fun ty Bool) Bool)
■
=TEX
ⓈHOLCONST
	⦏Forall_def⦎ : TERM
├
	Forall_def =
	let P = mk_var("P", Fun Star Bool)
	in let x = mk_var("x", Star)
	in
	mk_abs(P, mk_eq(P, mk_abs(x,  Truth)))
■
=TEX
ⓈHOLCONST
	⦏mk_forall⦎ : (TERM × TERM) → TERM
├
	∀ tm1 tm2⦁mk_forall(tm1, tm2) =
			mk_comb(Forall (type_of_term tm1), mk_abs(tm1, tm2))
■
=TEX
\subsubsection{Existential Quantification}
The constant $∃ : (* → bool) → bool$ is defined
by the following equation, which defines $∃$ in terms
of the choice function $ε: (* → bool) →*$:
$$\$∃ = λ(P : * → bool) ⦁ P(εP)$$
(This may be a little perplexing at first sight.
In the intended interpretations, given a predicate
$P : * → bool$, if there is some $x : *$ for which $P$
is true (i.e. for which $P x = T$), then $ε P$ is such
an $x$. I.e. taking as known the intuitive notion of
``whether or not something with a given property exists'',
$ε$ chooses
something with a given property if such a thing exists.
The above definition can be viewed as taking as known
the informal notion of ``choosing something with a given
property'' and defining $∃$ to determine
whether or not something with a given property exists
by attempting to choose something with the given property and checking whether the attempt succeeded.)
ⓈHOLCONST
	⦏Exists⦎ : TYPE → TERM
├
	∀ ty ⦁ Exists ty = mk_const("∃", Fun (Fun ty Bool) Bool)
■
=TEX

ⓈHOLCONST
	⦏Exists_def⦎ : TERM
├
	Exists_def =
	let P = mk_var("P", Fun Star Bool)
	in let PchoiceP = mk_comb(P,mk_comb(Choice, P))
	in
	mk_abs(P, PchoiceP)
■
=TEX
ⓈHOLCONST
	⦏has_mk_exists⦎ : (TERM × TERM) → TERM → BOOL
├
	∀ tm1 tm2 tm3 ⦁
	has_mk_exists(tm1, tm2) tm3 =
	has_mk_comb(Exists (type_of_term tm1), mk_abs(tm1, tm2))tm3
■
=TEX
ⓈHOLCONST
	⦏mk_exists⦎ : (TERM × TERM) → TERM
├
	∀ tm1 tm2⦁mk_exists(tm1, tm2) =
			mk_comb(Exists (type_of_term tm1), mk_abs(tm1, tm2))
■
=TEX
\subsubsection{Falsity}
The constant $F:bool$ is defined by the following equation:
$$F = ∀(x:bool) ⦁ x$$
(Again this may seem perplexing. The type $bool$
is intended to contain the truth values. The above definition
says that false is the truth value of the proposition that
every truth value is true!)
ⓈHOLCONST
	⦏Falsity⦎ : TERM
├
	Falsity = mk_const("F", Bool)
■
=TEX
ⓈHOLCONST
	⦏Falsity_def⦎ : TERM
├
	Falsity_def =
	let x = mk_var("x", Bool)
	in
	mk_forall(x, x)
■
=TEX
\subsubsection{Negation}
The constant $¬:bool → bool$ is defined by the following
equation:
$$\$¬ = λ(b:bool)⦁b ⇒ F$$
ⓈHOLCONST
	⦏Negation⦎ : TERM
├
	Negation = mk_const("¬", Fun Bool Bool)
■
=TEX
ⓈHOLCONST
	⦏Negation_def⦎ : TERM
├
	Negation_def =
	let b = mk_var("b", Bool)
	in
	mk_abs(b, mk_imp(b, Falsity))
■
=TEX
\subsubsection{Conjunction}
The constant $∧: bool → bool → bool$
is defined by the following equation:
$$\$∧ = λb1⦁λb2⦁∀b⦁(b1 ⇒ (b2 ⇒ b)) ⇒ b$$
(I assume, but do not know, that the above formulation
has some practical advantage in the present
context over the more obvious definition
in terms of $¬$ and $⇒$.)

The name of the constant is a slash, $/$, followed by a
backslash, $\backslash$. The backslash character
must be escaped by another backslash character within
an HOL string.
ⓈHOLCONST
	⦏Conjunction⦎ : TERM
├
	Conjunction = mk_const("/\\", Fun Bool (Fun Bool Bool))
■
=TEX
ⓈHOLCONST
	⦏Conjunction_def⦎ : TERM
├
	Conjunction_def =
	let b = mk_var("b", Bool)
	in let b1 = mk_var("b1", Bool)
	in let b2 = mk_var("b2", Bool)
	in
	mk_abs(b1, mk_abs(b2, mk_forall(b, mk_imp(mk_imp(b1, mk_imp(b2, b)), b))))
■
=TEX
A derived constructor function for conjunctions is
useful.
ⓈHOLCONST
	⦏mk_conj⦎ : (TERM × TERM) → TERM
├
	∀ tm1 tm2⦁
	mk_conj(tm1, tm2) = mk_comb(mk_comb(Conjunction, tm1),tm2)
■
=TEX

\subsubsection{Disjunction}
The constant $∨: bool → bool → bool$
is defined by the following equation:
$$\$∨ = λb1⦁λb2⦁∀b⦁((b1 ⇒ b) ⇒ (b2 ⇒ b)) ⇒ b$$
(As for conjunction I assume this has some advantage
over a definition from the propositional calculus.)

The name of the constant is a
backslash, $\backslash$, followed by a slash, $/$.
The backslash character
must be escaped by another backslash character within
an HOL string.

ⓈHOLCONST
	⦏Disjunction⦎ : TERM
├
	Disjunction = mk_const("\\/", Fun Bool (Fun Bool Bool))
■
=TEX
ⓈHOLCONST
	⦏Disjunction_def⦎ : TERM
├
	Disjunction_def =
	let b = mk_var("b", Bool)
	in let b1 = mk_var("b1", Bool)
	in let b2 = mk_var("b2", Bool)
	in
	mk_abs(b1, mk_abs(b2, mk_forall(b, mk_imp(mk_imp(b1, b),
				mk_imp(mk_imp(b2, b), b)))))
■
=TEX
A derived constructor function for disjunctions is
useful later.
ⓈHOLCONST
	⦏mk_disj⦎ : (TERM × TERM) → TERM
├
	∀ tm1 tm2⦁
	mk_disj(tm1, tm2) = mk_comb(mk_comb(Disjunction, tm1),tm2)
■
=TEX

\subsubsection{ONE\_ONE}
The definition of $Type\_Definition$ below requires the notion of
a one-to-one function. The constant $ONE\_ONE$
is defined by the following equation:
$$ONE\_ONE = λ(f:* → **)⦁∀(x1:*)⦁∀(x2:*)⦁(f\,x1 = f\,x2) ⇒ (x1 = x2)$$
ⓈHOLCONST
	⦏StarStar⦎ : TYPE
├
	StarStar = mk_var_type "**"
■
=TEX
ⓈHOLCONST
	⦏One_One⦎ : TERM
├
	One_One = mk_const("ONE_ONE", Fun(Fun Star StarStar)Bool)
■
=TEX
ⓈHOLCONST
	⦏One_One_def⦎ : TERM
├
	One_One_def =
	let f = mk_var("f",Fun Star StarStar)
	in let x1 = mk_var("x1",Star)
	in let x2 = mk_var("x2",Star) in
	mk_abs(f, mk_forall(x1, mk_forall(x2,
		mk_imp(mk_eq(mk_comb(f, x1), mk_comb(f, x2)),
			mk_eq(x1, x2)))))
■
=TEX
\subsubsection{ONTO}
The axiom of infinity requires the notion of
an onto function. The constant $ONTO$
is defined by the following equation:
$$ONTO = λ(f:* → **)⦁∀(y:**)⦁∃(x:*)⦁y = f\,x$$
ⓈHOLCONST
	⦏ONTO⦎ : TERM
├
	ONTO = mk_const("ONTO", Fun(Fun Star StarStar)Bool)
■
The name is all upper case to avoid conflict with the actual constant
$Onto$ used in the metalanguage system.
=TEX
ⓈHOLCONST
	⦏ONTO_def⦎ : TERM
├
	ONTO_def =
	let f = mk_var("f",Fun Star StarStar)
	in let x = mk_var("x",Star)
	in let y = mk_var("y",StarStar) in
	mk_abs(f, mk_forall(y, mk_exists(x, mk_eq(y, mk_comb(f, x)))))
■
=TEX
\subsubsection{Type\_Definition}

{\it Type\_Definition} may be new to some readers.
It is a term asserting that a function  represents
one type as a subtype of another. It is used
in defining {\it new\_type\_definition}.
It has type $(**→bool)→(*→**)→bool$ and
is defined by the following equation:
=GFT
Type_Definition = λ(P:**→bool)⦁(rep:*→**)⦁ONE_ONE rep
	∧ ∀(x:**)⦁P x = ∃(y:*)⦁x = rep y
=TEX
It is useful later to have a version of {\it Type\_Definition}
parameterised over the types involved.
ⓈHOLCONST
	⦏Type_Definition⦎ : TYPE → TYPE → TERM
├
	∀ ty1 ty2 ⦁
	Type_Definition ty1 ty2 =
		mk_const("Type_Definition", (Fun (Fun ty2 Bool) (Fun(Fun ty1 ty2)Bool)))
■
=TEX
ⓈHOLCONST
	⦏Type_Definition_def⦎ : TERM
├
	Type_Definition_def =
	let P = mk_var("P",Fun StarStar Bool)
	in let rep = mk_var("rep",Fun Star StarStar)
	in let x = mk_var("x",StarStar)
	in let y = mk_var("y",Star) in
	mk_abs(P, mk_abs(rep,
		mk_conj(mk_comb(One_One, rep),
			mk_forall(x, mk_eq(mk_comb(P, x), mk_exists(y,
				mk_eq(x, mk_comb(rep, y))))))))
■
=TEX

\subsection{{\it new\_type} and {\it new\_constant}}

The first two definitional extension mechanisms,
{\it new\_type} and {\it new\_constant} are
conservative, but not very powerful.

{\it new\_type}  is used to declare a name to be used
as a type constructor. No axioms about the type are
introduced so that only instances of polymorphic
functions may be applied to it.
The only constraint is that the name should not
be a type constructor in the theory to be extended.

To see, syntactically, that $new\_type$ is conservative
observe that, given a proof in which the new type does
not appear in the conclusion, distinct applications of
the new type operator could be replaced by distinct
type variables not used elsewhere in the proof. The result
would be a proof in the unextended theory with the same
conclusion as the original proof.

ⓈHOLCONST
	⦏new_type⦎ : ℕ → STRING → THEORY → THEORY → BOOL
├
	∀ arity name thy1 thy2 ⦁
	new_type arity name thy1 thy2 ⇔
	¬ name ∈ Dom(types thy1) ∧
	types thy2  = types thy1 ∪ {(name, arity)} ∧
	constants thy2 = constants thy1 ∧
	axioms thy2 = axioms thy1
■
=TEX
{\it new\_constant}  is used to declare a name to be used
as a constant of a given type.
No axioms about the constant are
introduced so that it behaves as a value
which we cannot determine.
The only constraint is that the name should not
be a constant in the theory to be extended and that the type of the constant
should be well-formed.

ⓈHOLCONST
	⦏new_constant⦎ : STRING → TYPE → THEORY → THEORY → BOOL
├
	∀ name type thy1 thy2 ⦁
	new_constant name type thy1 thy2 ⇔
	¬ name ∈ Dom(constants thy1) ∧
	type ∈ wf_type (types thy1) ∧
	constants thy2  = constants thy1 ∪ {(name, type)} ∧
	types thy2 = types thy1 ∧
	axioms thy2 = axioms thy1
■
=TEX

Again it is easy to see syntactically that this is conservative.
Simply replace distinct instances of the new constant
in a proof by distinct variables not used elsewhere
in the proof to obtain a proof in the unextended theory.

\subsection{{\it new\_axiom}}

{\it new\_axiom} is both powerful and dangerous!
It allows a sequent with no hypotheses and a
given conclusion to be taken as an axiom.
The only constraint is that the sequent be well-formed
with respect to the environments of the theory being
extended.

It is convenient, for technical reasons, in \cite{DS/FMU/IED/SPC004} to
have the more general operation of adding a set of
new axioms. We therefore define $new\_axiom$ in terms
of the more general $new\_axioms$.

ⓈHOLCONST
	⦏new_axioms⦎ : (TERM SET) → THEORY → THEORY → BOOL
├
	∀ tms thy1 thy2 ⦁
	new_axioms tms thy1 thy2 =
	let seqs = {(x, tm) | x = {} ∧ tm ∈ tms}
	in
	seqs ⊆ sequents thy1∧
	types thy2 = types thy1 ∧
	constants thy2 = constants thy1 ∧
	axioms thy2 = axioms thy1 ∪ seqs
■
=TEX

ⓈHOLCONST
	⦏new_axiom⦎ : TERM → THEORY → THEORY → BOOL
├
	∀ tm thy1 thy2 ⦁
	new_axiom tm thy1 thy2 = new_axioms {tm} thy1 thy2
■
=TEX
\subsection{{\it new\_definition}}
{\it new\_definition} is useful and conservative.
It allows the simultaneous introduction of a new constant
and an axiom asserting that the new constant is equal
to a given term.
The constraints imposed are {\it (a)} the name must satisfy the
check made in {\it new\_constant}, {\it (b)} the term
must be closed and {\it (c)} the term must contain
no bound variables whose types contain type variables
which do not appear in the type of the new constant.
Condition {\it (c)} ensures that different type instances
of the term result in different instances of the
constant; this avoids a possible inconsistency (see \cite{DS/FMU/IED/SPC004} for an example which arises in the course
of this specification).
ⓈHOLCONST
	⦏new_definition⦎ : STRING → TERM → THEORY → THEORY → BOOL
├
	∀ name tm thy1 thy2 ⦁
	new_definition name tm thy1 thy2 ⇔
	let ty = type_of_term tm
	in
	∃ thy1a ⦁
	new_constant name ty thy1 thy1a ∧
	freevars_set tm = {} ∧
	term_tyvars tm ⊆ type_tyvars ty ∧
	new_axiom (mk_eq(mk_const(name, ty), tm)) thy1a thy2
■
=TEX


\subsection{{\it new\_specification}}

{\it new\_specification} allows the simultaneous
introduction of a set of new constants satisfying a
given predicate provided that a theorem asserting
the existence of some set of values satisfying the
constants is given. An axiom asserting the predicate
for the new constants is introduced.
Like {\it new\_definition}, {\it new\_specification}
is useful and conservative.

The constraints imposed are analogous to those imposed
in {\it new\_definition}: {\it (a)} the constant
names must be pairwise distinct and different from
any constant name in the theory being extended,
{\it (b)} the predicate must have
no free variables apart from those corresponding
to the new constants, {\it (c)} any type variable
contained in a bound variable of the predicate must
appear as a type variable of each of the new constants.
Also, of course, the theorem must have the right form.

Since we now need to work with existential quantifiers
it is necessary to introduce the theory {\it LOG}.
We impose the restriction that {\it new\_specification}
may only be used  to extend theories which extend {\it LOG}.
ⓈHOLCONST
	⦏LOG⦎ : THEORY
├
	∃ thy1 thy2 thy3 thy4 thy5 thy6 thy7 thy8 thy9⦁
	let Name = λcon⦁εs⦁∃ty⦁mk_const(s, ty) = con
	in
	(new_definition (Name Truth) Truth_def MIN thy1
∧	new_definition (Name (Forall Star)) Forall_def thy1 thy2
∧	new_definition (Name (Exists Star)) Exists_def thy2 thy3
∧	new_definition (Name Falsity) Falsity_def thy3 thy4
∧	new_definition (Name Negation) Negation_def thy4 thy5
∧	new_definition (Name Conjunction) Conjunction_def thy5 thy6
∧	new_definition (Name Disjunction) Disjunction_def thy6 thy7
∧	new_definition (Name One_One) One_One_def thy7 thy8
∧	new_definition (Name ONTO) ONTO_def thy8 thy9
∧	new_definition (Name (Type_Definition Star StarStar)) Type_Definition_def thy9 LOG)
■
=TEX

To define {\it new\_specification} we need  the relation
{\it has\_list\_mk\_exists}, and the relation {\it new\_constants}
which is like {\it new\_constant} but handles a
set of new constants.

ⓈHOLCONST
	⦏has_list_mk_exists⦎ : (TERM LIST) → TERM → TERM → BOOL
├
	(∀tm1 tm2⦁ has_list_mk_exists [] tm1 tm2 ⇔ tm1 = tm2)
	∧
	(∀ v rest tm1 tm2 ⦁
	has_list_mk_exists (Cons v rest) tm1 tm2 ⇔
	∃ rem ⦁ has_mk_exists(v, rem) tm2 ∧
		has_list_mk_exists rest rem tm1)
	
■
=TEX

ⓈHOLCONST
	⦏new_constants⦎ : ((STRING × TYPE) SET) → THEORY → THEORY → BOOL
├
	∀ cons thy1 thy2 ⦁
	new_constants cons thy1 thy2 ⇔
	Dom cons ∩ Dom (constants thy1) = {} ∧
	Ran cons ⊆ wf_type(types thy1) ∧
	constants thy2 = constants thy1 ∪ cons ∧
	types thy2 = types thy1 ∧
	axioms thy2 = axioms thy1
■
=TEX

We can now define {\it new\_specification}.
ⓈHOLCONST
	⦏new_specification⦎ : ((STRING × (STRING × TYPE)) LIST) →
	TERM → THM → THEORY → THEORY → BOOL
├
	∀ pairs tm thm thy1 thy2 ⦁
	new_specification pairs tm thm thy1 thy2 =
	let conl = Fst(Split pairs)
	in let varl = Map mk_var (Snd(Split pairs))
	in let tyl = Map Snd (Snd(Split pairs))
	in let subs = λ(s, ty) ⦁
		if	∃ c ⦁ (c, (s, ty)) ∈ Elems pairs
		then	mk_const((εc⦁(c, (s, ty)) ∈ Elems pairs), ty)
		else 	mk_var(s, ty)
	in let axiom = subst subs tm
	in (∃ conc⦁
	has_list_mk_exists varl tm conc
	∧ thy1 extends LOG
	∧ (freevars_set conc = {})
	∧ conl ∈ Distinct
	∧ varl ∈ Distinct
	∧ thm_seq thm = ({}, conc)
	∧ thy1 extends thm_thy thm
	∧ (∀ ty⦁ ty ∈ Elems tyl ⇒ term_tyvars conc ⊆ type_tyvars ty)
	∧ (∃ thy1a ⦁
		new_constants (Elems (Combine conl tyl)) thy1 thy1a ∧
		new_axiom axiom thy1a thy2) )
■
=TEX

\subsection{{\it new\_type\_definition}}
{\it new\_type\_definition} allows the introduction
of a new type in one-to-one correspondence with
the subset of an existing type satisfying a given
predicate, given a theorem asserting that the subset
is not empty. A new axiom asserting the existence
of a representation function for the new type is introduced.
Like {\it new\_definition}, {\it new\_type\_definition}
is useful and conservative.

For simplicity, we have made the list of type variable
names to be used as the parameters of the type being
defined, a parameter to {\it new\_type}.
The constraints imposed are {\it (a)} that the list
of type parameter names contain
no repeats, {\it (b)} the theorem must have the right form
and {\it (c)} all type variables contained in the
predicate must be contained in the list of type parameters
names.
Condition {\it (c)} ensures that different type instances
of the new axiom involve different type instances of
the new type.

ⓈHOLCONST
	⦏new_type_definition⦎ :
	STRING → (STRING LIST) → THM → THEORY → THEORY → BOOL
├
	∀ name typars thm thy1 thy2 ⦁
	new_type_definition name typars thm thy1 thy2 ⇔
	∃ p xty x ty px thy1a axiom ⦁
	let newty = mk_type(name, Map mk_var_type typars)
	in let f = mk_var("f", Fun newty ty)
	in 	thy1 extends LOG
	∧	hyp (thm_seq thm) = {}
	∧	has_mk_exists (xty, px) (concl (thm_seq thm))
	∧	mk_var (x, ty) = xty
	∧	has_mk_comb (p, xty) px
	∧	freevars_set p = {}
	∧	term_tyvars p ⊆ Elems typars
	∧	typars ∈ Distinct
	∧	has_mk_exists(f, mk_comb(mk_comb(Type_Definition newty ty, p), f)) axiom
	∧	new_type (# typars) name thy1 thy1a
	∧	new_axiom axiom thy1a thy2
■
=TEX
\section{THE THEORY INIT}
\label{INIT}
By extending the theory $LOG$ with five axioms
we will arrive at the theory $INIT$. In a typical
HOL proof development system all theories will be
extensions of this theory.


\subsection{The Axioms}
\subsubsection{BOOL\_CASES\_AX}
This is the law of the excluded middle:
=GFT
BOOL_CASES\_AX ⊢ ∀(b:bool)⦁(b = T) ∨ (b = F)
=TEX
ⓈHOLCONST
	⦏BOOL_CASES_AX⦎ : TERM
├
	BOOL_CASES_AX =
	let b = mk_var("b", Bool)
	in mk_forall(b, mk_disj(mk_eq(b, Truth), mk_eq(b, Falsity)))
■
=TEX

\subsubsection{IMP\_ANTISYM\_AX}

This says that implication is an antisymmetric
relation:
=GFT
IMP_ANTISYM_AX ⊢ ∀(b1:bool)⦁∀(b2:bool)⦁(b1 ⇒ b2) ⇒ (b2 ⇒ b1) ⇒ (b1=b2)
=TEX
ⓈHOLCONST
	⦏IMP_ANTISYM_AX⦎ : TERM
├
	IMP_ANTISYM_AX =
	let b1 = mk_var("b1", Bool)
	in let b2 = mk_var("b2", Bool)
	in mk_forall(b1, mk_forall(b2,
		mk_imp(mk_imp(mk_imp(b1, b2), mk_imp(b2, b1)), mk_eq(b1, b2))))
■
=TEX

\subsubsection{ETA\_AX}
This says that an $\eta$-redex is equal to
its $\eta$-reduction.
=GFT
ETA_AX ⊢ ∀(f:* → **)⦁(λ(x:*)⦁f x) = f
=TEX
ⓈHOLCONST
	⦏ETA_AX⦎ : TERM
├
	ETA_AX =
	let f = mk_var("f1", Fun Star StarStar)
	in let x = mk_var("x", Star)
	in mk_forall(f, mk_eq(mk_abs(x, mk_comb(f, x)), f))
■
=TEX
\subsubsection{SELECT\_AX}
This is the defining property of the choice function $ε$.
=GFT
SELECT_AX ⊢ ∀(P:*→bool)⦁∀(x:*)⦁P x  ⇒  P(ε P)
=TEX
ⓈHOLCONST
	⦏SELECT_AX⦎ : TERM
├
	SELECT_AX =
	let P = mk_var("P", Fun Star Bool)
	in let x = mk_var("x", Star)
	in mk_forall(P,mk_forall(x,
			mk_imp(mk_comb(P, x), mk_comb(P, mk_comb(Choice, P)))))
■
=TEX
\subsubsection{INFINITY\_AX}
This is the axiom of infinity. It asserts that the
type $ind$ is in one-to-one correspondence with
a proper subset of itself:
=GFT
INFINITY_AX ⊢ ∃(f:ind→ind)⦁ONE_ONE f  ∧  ¬ONTO f
=TEX
ⓈHOLCONST
	⦏INFINITY_AX⦎ : TERM
├
	INFINITY_AX =
	let f = mk_var("f", Fun Ind Ind)
	in mk_conj(mk_comb(One_One, f), mk_comb(Negation, mk_comb(ONTO, f)))
■
=TEX

\subsection{The Theory}
ⓈHOLCONST
	⦏INIT⦎ : THEORY
├
	∃ thy1 thy2 thy3 thy4 thy5 thy6 ⦁
	new_axiom BOOL_CASES_AX LOG thy1
∧	new_axiom IMP_ANTISYM_AX thy1 thy2
∧	new_axiom ETA_AX thy2 thy3
∧	new_axiom SELECT_AX thy4 thy5
∧	new_type 0 (Fst(dest_type Ind)) thy5 thy6
∧	new_axiom INFINITY_AX thy6 INIT
■
=TEX



\subsection{DEFINITIONAL EXTENSIONS}\label{DEFINITIONALEXTENSIONS}

We will say that a theory $thy1$ is a $definitional$ extension
of a theory $thy2$ if one may go from $thy2$ to $thy1$ by
some sequence of
extensions by the functions
$new\_type$, $new\_constant$, $new\_definition$,
$new\_specification$ and $new\_type\_definition$.
It is stressed that definitional extensions in this sense
comprise significantly more than just extension by adjoining a defining
equation for a new constant.

ⓈHOLCONST
	⦏definitional_extension⦎ : THEORY → THEORY SET
├
	∀thy⦁definitional_extension thy = ⋂{thyset |
		thy ∈ thyset
	∧ (	∀thy1 thy2 arity name⦁
		thy1 ∈ thyset ∧
		new_type arity name thy1 thy2 ⇒ thy2 ∈ thyset
	) ∧ (
	∀thy1 thy2 name type⦁
		thy1 ∈ thyset ∧
		new_constant name type thy1 thy2 ⇒ thy2 ∈ thyset
	) ∧ (
	∀thy1 thy2 name tm⦁
		thy1 ∈ thyset ∧
		new_definition name tm thy1 thy2 ⇒ thy2 ∈ thyset
	) ∧ (
	∀thy1 thy2 pairs tm thm⦁
		thy1 ∈ thyset ∧
		new_specification pairs tm thm thy1 thy2 ⇒ thy2 ∈ thyset
	) ∧ (
	∀thy1 thy2 name typars thm⦁
		thy1 ∈ thyset ∧
		new_type_definition name typars thm thy1 thy2 ⇒ thy2 ∈ thyset
	)}
■
=TEX

Of particular importance are theories which
may be obtained from $INIT$ by definitional
extension.
These theories are of interest since, we
assert, they form a sound formalism
in which much of the practical machine-checked
proof work one might wish to do can be carried out.

=IGN
\pagebreak
\input{\jobname.thy.tex}
=TEX
\twocolumn
{\twocolumn[\section{INDEX OF DEFINED TERMS}]
\printindex}
\end{document}


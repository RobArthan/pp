=IGN
********************************************************************************
spc002.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
=TEX
%
%	hol_list -d play spc002 >spc002.thy.doc
%	doctex spc002.thy.doc
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
\title{{\bf HOL Formalised: \\ Semantics}}  %% Mandatory field
\author{R.D. Arthan \\ Lemma 1 Ltd. \\ rda@lemma-one.com}
\date{25th October 1993 \\ Revised \FormatDate{\VCDate}}

\begin{document}
\thispagestyle{empty}
\begin{titlepage}
\maketitle
\begin{abstract}
This is part of a suite of documents giving a formal
specification of the HOL logic. It gives the semantics of the
HOL language by defining the notion of a model of an HOL theory.

The semantics is given by first formalising the notion of what we call a ''universe'', i.e., a model of set theory within HOL.
Such a universe is a type provided with a binary relation which obeys the axioms expected of the set-theoretic membership operation.
Polymorphism is used to present the notion of a model conservatively, rather than axiomatically.
The definition of a model of an HOL theory within some universe is then given in the usual denotational style.
The document concludes with a brief and informal discussion of the consistency and independence of the postulates for set theory as defined here.

An index to the formal material is provided at the end of the document.
\end{abstract}
\vfill
\begin{centering}

\bf Copyright \copyright\ : Lemma 1 Ltd \number\year \\
Reference: DS/FMU/IED/SPC001; Git revision: {\VCVersion}


\end{centering}
\thispagestyle{empty}
\end{titlepage}
\newpage
\section{DOCUMENT CONTROL}
\subsection{Contents list}
\tableofcontents
\subsection{Document cross references}
\bibliographystyle{fmu}
\bibliography{fmu}

% \subsection{Changes forecast}
\newpage
\section{GENERAL}
\subsection{Scope}
This document specifies the semantics of the HOL language.
It is part of a suite of documents constituting
a formal specification of the HOL logic, an  overview of
which may be found in \cite{DS/FMU/IED/SPC001}.
\subsection{Introduction}
A set-theoretic semantics devised by A. Pitts for HOL is
given in \cite{SRI89a}. The treatment given is
not fully formal; however, it is ``possible in
principle to give a completely formal version within
{\tt ZFC} set theory''.
We wish to formalise the semantics in HOL.


A number of approaches have been considered to
specifying the semantics of HOL within HOL itself.
At one extreme, analogues of the axioms of {\tt ZFC} can
be introduced to give a theory in which we could hope to
construct a model of HOL and use it to prove
the consistency of all HOL theories which do not use
axiomatic extensions. At the other extreme we might try
a category-theoretic approach (see \cite{Lambek86}
or \cite{Hatcher82}), say by using definitional extensions
to define the notion of an interpretation of a
typed λ-calculus in a cartesian closed category and
to specify how this notion applies to HOL.
The main decisions to be made are:

\begin{itemize}
\item How general a class of structures do we wish to
consider as models for HOL?
\item Should we use axiomatic extensions?
\end{itemize}

Our present approach tries to be no more general than
it needs to be. Since we have no immediate interest in completeness
results or comparisons with other type theories, extra generality would probably only
be an obstacle to assessing the correctness of our
treatment and might well make it more difficult to
prove the soundness of the inference rules. Thus we have
opted for a set-theoretic treatment.

We do not wish to use axiomatic extensions.
To avoid them we formulate the semantics as a specification
of what a model should be, rather than as construction
of a particular model. This makes little difference
to the utility of the semantics since all it amounts to
is that we make explicit our assumption of the existence of an appropriate universe
of sets in which terms take their values.

\subsection{Initialisation}
=SML
open_theory"spc001";
new_theory⦏"spc002"⦎;
=TEX
\pagebreak
\section{MODELS FOR SET THEORY IN HOL}

\subsection{Postulates for Elementary Set Theory}

We wish to define a notion of a model for set theory
within HOL. We will formulate this as a property
of a membership relation, $mem:'U → 'U → bool$.
The type $'U$ over which $mem$ is defined corresponds
to the universe in the treatment in \cite{SRI89a}.

In the following sections we define predicates which
assist in defining our postulates for a set theory.

\subsubsection{Extensionality}
The predicate for extensionality is straightforward:
ⓈHOLCONST
	⦏extensional⦎ : ('U → 'U → BOOL) → BOOL
├
	∀mem⦁extensional mem ⇔
		∀x y:'U⦁x = y ⇔ ∀a:'U⦁mem a x ⇔ mem a y
■
=TEX
Note that we use the ordinary metalanguage equality as the
equality relation in $'U$. Since the extensionality
property implies that equality for sets is an equivalence
relation, this imposes no loss of generality (since we
could always work with the equivalence classes).
\subsubsection{Separation}
For us the postulate of separation will assert the existence
of a subset operator assigning to each set $x$ and
each property $P$ the subset of $x$ in which $P$ holds.
Note that, since $P$ is not constrained to be a property
which can be expressed in first-order set theory, this
postulate is, in general, stronger than that usual in
first-order treatments of set theory.

ⓈHOLCONST
	⦏is_separation⦎ : ('U → 'U → BOOL) → ('U → ('U → BOOL) → 'U) → BOOL
├
	∀mem sub⦁is_separation mem sub ⇔
		∀x P⦁∀a⦁mem a (sub x P) ⇔ mem a x ∧ P a
■
=TEX

Note that our universe is necessarily non-empty (since
metalanguage types are non-empty), so
extensionality and the
existence of a subset operator
with the above property will imply the existence of
a unique set with no elements (namely $sub\,x\,(λa.F)$
where $x$ is any term of type $'U$).

\subsubsection{Power Sets}
This postulate will assert the existence of an operator
assigning to each set the set of all its subsets.
ⓈHOLCONST
	⦏is_power⦎ : ('U → 'U → BOOL) → ('U → 'U) → BOOL
├
	∀mem power⦁is_power mem power ⇔
		∀x⦁∀a⦁mem a (power x) ⇔ ∀b⦁mem b a ⇒ mem b x
■
=TEX

If $x$ is an element of $'U$ let us write $extent\,mem\,x$
for the metalanguage predicate $λa⦁mem\,a\,x$ and
assume $mem$ satisfies the postulates of separation and
power sets, then, viewing metalanguage predicates
as sets, $extent\,mem\,(power\,x)$ will be in
1-1 correspondence with $λP⦁P\,⊆\,extent\,mem\,x$.
This will mean later that our semantics uses
only the so-called standard models, in which both object
language and metalanguage agree about the cardinality
of object language function spaces.

\subsubsection{Union Sets}
This postulate asserts the existence of an operator
assigning to each set the union of all its elements.
ⓈHOLCONST
	⦏is_union⦎ : ('U → 'U → BOOL) → ('U → 'U) → BOOL
├
	∀mem union⦁is_union mem union ⇔
		∀x⦁∀a⦁mem a (union x) ⇔ ∃b⦁mem a b ∧ mem b x
■
=TEX
\subsubsection{Unordered Pairs}
This postulate asserts the existence of an operator
assigning to any two sets a set whose elements are precisely
those sets.
ⓈHOLCONST
	⦏is_pair⦎ : ('U → 'U → BOOL) → ('U → 'U → 'U) → BOOL
├
	∀mem pair⦁is_pair mem pair ⇔
		∀x y⦁∀a⦁mem a (pair x y) ⇔ a = x ∨ a = y
■
=TEX
\subsection{Set Theories} \label{SetTheories}
We will say that a relation, $mem$, is a set theory if
it admits
a subset operator, a power set operator
etc. satisfying the properties defined in the previous section.
ⓈHOLCONST
	⦏is_set_theory⦎ : ('U → 'U → BOOL) → BOOL
├
	∀mem⦁	is_set_theory mem ⇔
		extensional mem
	∧	(∃sub⦁is_separation mem sub)
	∧	(∃power⦁is_power mem power)
	∧	(∃union⦁is_union mem union)
	∧	(∃pair⦁is_pair mem pair)
■
=TEX

This notion of a set theory is quite a weak one. An example
could be constructed without using axiomatic extensions
by using a countably infinite type to model the set of
hereditarily
finite sets in a classical set theory (see appendix \ref{Consistency}
below).

I would conjecture that
one would only need to assert axiomatically the existence
of a set theory (in the above sense)
together with an axiom of infinity to give
an extension of the HOL system
strong enough to prove the consistency of the theory $INIT$ and
its definitional extensions.

\subsection{Operations on Set Theories}

It is pleasant in the sequel to use notations similar to
the usual set-theoretic ones, at the very least by making
membership an infix operator.
Towards this end, we define polymorphic constants which will act
as membership relation and subset, power set, union and
pair operators in
any type which permits a set theory.
The names of these constants are given a subscript to
distinguish them from constants used in the metalanguage.

\subsubsection{Primitive Operations}
First we fix a choice of membership relation, then we
define the other operators with respect to that choice.

=SML
declare_infix(1000, "∈⋎s");

ⓈHOLCONST
	$⦏∈⋎s⦎:'U → 'U → BOOL
├
	(∃mem:'U → 'U → BOOL⦁is_set_theory mem) ⇒
		is_set_theory ($∈⋎s:'U → 'U → BOOL)
■
=TEX

ⓈHOLCONST
	⦏Sub⋎s⦎	: 'U → ('U → BOOL) → 'U
├
	(∃mem:'U → 'U → BOOL⦁is_set_theory mem) ⇒
		is_separation ($∈⋎s) (Sub⋎s:'U → ('U → BOOL) → 'U)
■
=TEX

ⓈHOLCONST
	⦏ℙ⋎s⦎	: 'U → 'U
├
	(∃mem:'U → 'U → BOOL⦁is_set_theory mem) ⇒
		is_power ($∈⋎s) (ℙ⋎s:'U → 'U)
■
=TEX

ⓈHOLCONST
	⦏⋃⋎s⦎	: 'U → 'U
├
	(∃mem:'U → 'U → BOOL⦁is_set_theory mem) ⇒
		is_union ($∈⋎s) (⋃⋎s:'U → 'U)
■
=TEX

We will use the symbol $⊕⋎s$ for the infix operator which
makes an unordered pair out of its operands:
=SML
declare_infix(1000, "⊕⋎s");

ⓈHOLCONST
	$⦏⊕⋎s⦎	: 'U → 'U → 'U
├
	(∃mem:'U → 'U → BOOL⦁is_set_theory mem) ⇒
		is_pair ($∈⋎s) ($⊕⋎s:'U → 'U → 'U)
■
=TEX

\subsubsection{Derived Operations}
As already mentioned, since the type $'U$ cannot be empty
we may construct an empty
set using the subset operator. This set will be denoted
$∅⋎s$:
ⓈHOLCONST
	⦏∅⋎s⦎	: 'U
├
	∅⋎s = Sub⋎s (εx⦁T) (λa⦁F)
■
=TEX
$Unit⋎s\,x$ will denote the singleton set $\{x\}$:
ⓈHOLCONST
	⦏Unit⋎s⦎	: 'U → 'U
├
	∀x:'U⦁ Unit⋎s x = x ⊕⋎s x
■
=TEX
$1⋎s$ denotes the set $\{∅⋎s\}$:
ⓈHOLCONST
	⦏1⋎s⦎	: 'U
├
	1⋎s = Unit⋎s ∅⋎s
■
=TEX
$2⋎s$ denotes the set $\{∅⋎s, 1⋎s\}$:
ⓈHOLCONST
	⦏2⋎s⦎	: 'U
├
	2⋎s = ∅⋎s ⊕⋎s 1⋎s
■
=TEX

$x\,↦⋎s\,y$ will denote the ordered pair with first component $x$
and second component $y$, that is to say $\{\{x\},\{x,y\}\}$:
=SML
declare_infix(1000, "↦⋎s");
ⓈHOLCONST
	$⦏↦⋎s⦎	: 'U → 'U → 'U
├
	∀x y:'U⦁ x ↦⋎s y = Unit⋎s x ⊕⋎s (x ⊕⋎s y)
■
=TEX
$∪⋎s$ will be the infix binary union operator:
=SML
declare_infix(1000, "∪⋎s");
ⓈHOLCONST
	$⦏∪⋎s⦎	: 'U → 'U → 'U
├
	∀x y:'U⦁ x ∪⋎s y = ⋃⋎s(x ⊕⋎s y)
■
=TEX
$×⋎s$ will be the infix binary product operator.
Since $\{\{x\},\{x,y\}\}\;⊆\;ℙ(ℙ(x\,∪\,y))$, this may be defined
using the subset operator as follows.
=SML
declare_infix(1000, "×⋎s");
ⓈHOLCONST
	$⦏×⋎s⦎	: 'U → 'U → 'U
├
	∀x y:'U⦁ x ×⋎s y = Sub⋎s (ℙ⋎s(ℙ⋎s(x ∪⋎s y))) (λa⦁∃b c⦁b ∈⋎s x ∧ c ∈⋎s y ∧ a = b ↦⋎s c)
■
=TEX
For the infix relation-space operator we use the name $↔⋎s$):
=SML
declare_infix(1000, "↔⋎s");
ⓈHOLCONST
	$⦏↔⋎s⦎	: 'U → 'U → 'U
├
	∀x y:'U⦁ x ↔⋎s y = ℙ⋎s (x ×⋎s y)
■
=TEX
$→⋎s$ will be the infix total function-space operator:
=SML
declare_infix(1000, "→⋎s");
ⓈHOLCONST
	$⦏→⋎s⦎	: 'U → 'U → 'U
├
	∀x y:'U⦁ x →⋎s y = Sub⋎s (x ↔⋎s y) (λf⦁∀a⦁(a ∈⋎s x) ⇒ ∃⋎1b⦁(a ↦⋎s b) ∈⋎s f)
■
=TEX
The infix operator $@⋎s$ is used to denote application of a function
to an argument. (Note that $x$ here may not be a function and,
even if it is, $y$ may not be in its domain. These properties
will have to be proved as necessary.)
=SML
declare_infix(1000, "@⋎s");
ⓈHOLCONST
	$⦏@⋎s⦎	: 'U → 'U → 'U
├
	∀x y:'U⦁ x @⋎s y = εa⦁ (y ↦⋎s a) ∈⋎s x
■
=TEX
The following function is used to define the semantics of the
boolean type constructor.
$Bool⋎s$ is a function taking the empty list to $2⋎s$ and
any other list to the empty set.
ⓈHOLCONST
	⦏Bool⋎s⦎	: 'U LIST → 'U
├
		(Bool⋎s [] = 2⋎s)
	∧	(∀x t⦁ Bool⋎s (Cons x t) = ∅⋎s)
■
=TEX
The following function is used to define the semantics of the
function space type constructor. $Fun⋎s$ is a function which takes
a two element list, $[dom, rng]$, of non-empty elements of $'U$
to the set of functions from $Dom$ to $rng$ and
which takes any other list to the empty set.
ⓈHOLCONST
	⦏Fun⋎s⦎	: 'U LIST → 'U
├
	∀args⦁Fun⋎s args =
		let dom = Hd args
		in let rng = Hd (Tl args)
		in	if args = [dom; rng] ∧ ¬dom = ∅⋎s ∧ ¬rng = ∅⋎s
			then dom →⋎s rng
			else ∅⋎s
■
=TEX
The following function is used to define the semantics
of $λ$-abstraction. Note that there
is no guarantee that the result is a total function and
this will have to be proved where necessary.
ⓈHOLCONST
	⦏Abs⋎s⦎	: ('U → 'U) → 'U → 'U → 'U
├
	∀f dom rng⦁Abs⋎s f dom rng = Sub⋎s (dom ×⋎s rng) (λx⦁∃a⦁x = a ↦⋎s f a)
■
=TEX
The following function will represent the polymorphic
equality of HOL:
ⓈHOLCONST
	⦏EqRel⋎s⦎	: 'U → 'U
├
	∀x:'U⦁EqRel⋎s x = Sub⋎s (x ×⋎s x ×⋎s 2⋎s)
			(λa⦁∃b c⦁a = (b ↦⋎s c ↦⋎s if b = c then 1⋎s else ∅⋎s))
■
=TEX
The following set will represent
the graph of the implication function:
ⓈHOLCONST
	⦏ImpRel⋎s⦎	: 'U
├
	ImpRel⋎s =
		Unit⋎s(1⋎s ↦⋎s 1⋎s ↦⋎s 1⋎s)
	∪⋎s	Unit⋎s(1⋎s ↦⋎s ∅⋎s ↦⋎s ∅⋎s)
	∪⋎s	Unit⋎s(∅⋎s ↦⋎s 1⋎s ↦⋎s 1⋎s)
	∪⋎s	Unit⋎s(∅⋎s ↦⋎s ∅⋎s ↦⋎s 1⋎s)
■
=TEX
\pagebreak
\section{SEMANTICS FOR HOL}
In this section we give the semantics of HOL with respect
to some universe $'U$ by specifying the notion of
a model of a theory. The main work in doing this is
defining the value of a term with respect to a function
assigning values to the variables and constants in it (and
similarly for types).

Because of our use of HOL rather than set theory as a metalanguage,
the approach and hence the terminology used here is rather
different from that used in the HOL manual, \cite{SRI89a}. An approximate
translation is given in the following table:

\begin{tabular}{|p{3in}|p{3in}|}\hline
This Document & HOL Manual\\ \hline
(Well-formed) type constant assignment & (Standard) model of a type structure \\ \hline
Type variable assignment & Element of ${\cal U}^n$ \\ \hline
Polymorphic value & Function from ${\cal U}\sp{n}$ to ${\cal U}$ \\ \hline
(Well-formed) constant assignment & Second component of a (standard) model of a signature \\ \hline
(Well-formed) interpretation & (Standard) model of a signature \\ \hline
Variable  assignment & Element of ${\cal U}^n$ \\ \hline
\end{tabular}

\subsection{Semantics of Types}
\subsubsection{Type Constant Assignment}
The value we assign to a type constant is in effect a function from
$n$-tuples of non-empty elements of the universe $'U$ to
non-empty elements of $'U$, where
$n$ is the arity of the type constant. Since we do not have
dependent types we represent such a thing as a function
of type $('U\,list → {*}U)$ which sends a list of length other
than $n$ to the empty set.
We make the following type abbreviation\footnote{%
{\ProductHOL} does not provide special syntax for type abbreviations.
To introduce a type abbreviation one uses the ML function $declare\_type\_abbrev$ with parameters indicating the name, formal parameters and definition of the type abbreviation.%
} to facilitate this:
=SML
declare_type_abbrev("TY_CON_ASSIGNMENT", ["'U"], ⌜:STRING → ('U LIST → 'U)⌝);
=TEX

We say that a type constant assignment is well-formed with respect to a
type environment if the arities of the values assigned to
the type constant names agree with those in the type environment
and if the boolean and function space types are assigned appropriately.
ⓈHOLCONST
	⦏is_wf_ty_con_assignment⦎: TY_ENV → 'U TY_CON_ASSIGNMENT → BOOL
├
	∀tyenv tyconass⦁ is_wf_ty_con_assignment tyenv tyconass ⇔
		(∀tycon args⦁
			(¬tyconass tycon args = ∅⋎s)
		⇔	(tycon ↦ Length args ∈ tyenv ∧ ∀a⦁a ∈ Elems args ⇒ ¬a = ∅⋎s))
	∧	tyconass "bool" = Bool⋎s
	∧	tyconass "→" = Fun⋎s
■
=TEX

\subsubsection{Type Variable Assignments}
A type variable assignment is just a total function from type
variables to the universe, $'U$. We make the following
type abbreviation for this notion.
=SML
declare_type_abbrev("TY_VAR_ASSIGNMENT", ["'U"], ⌜:STRING → 'U⌝);
=TEX
A type variable assignment will be well-formed if
all the values in its range are non-empty
ⓈHOLCONST
	is_wf_ty_var_assignment : 'U TY_VAR_ASSIGNMENT → BOOL
├
	∀tyvarass⦁is_wf_ty_var_assignment tyvarass ⇔ ∀tyv⦁¬tyvarass tyv = ∅⋎s
■
=TEX
\subsubsection{Polymorphic Values}
Types and terms have polymorphic values. We
represent these as functions from type variable assignments
to $'U$. This corresponds to the use of certain
dependent products in the treatment in \cite{SRI89a}.
=SML
declare_type_abbrev("POLY_VALUE", ["'U"], ⌜:'U TY_VAR_ASSIGNMENT → 'U⌝);
=TEX

A set $X$ of type variables supports a polymorphic value $v$ if $v$ is independent
of the values assigned to type variables not in $X$.
=SML
declare_infix(1000, "supports");
ⓈHOLCONST
	$⦏supports⦎: STRING SET → 'U POLY_VALUE → BOOL
├
∀X v⦁	X supports v ⇔ (∀a1 a2⦁ (∀x⦁ x ∈ X ⇒ a1 x = a2 x) ⇒ v a1 = v a2)
■

\subsubsection{Semantics of Types}
The value of a type with respect to a type constant assignment is a function
mapping type variable assignments onto polymorphic values:
ⓈHOLCONST
	⦏type_value⦎	:      'U TY_CON_ASSIGNMENT → TYPE → 'U POLY_VALUE
├
	∀tyconass s tyl⦁
		type_value tyconass (mk_var_type s)  = (λtyvarass⦁tyvarass s)
	∧	type_value tyconass (mk_type(s, tyl)) =
		(λtyvarass⦁tyconass s (Map(λty⦁type_value tyconass ty tyvarass) tyl))
■
=TEX
\subsection{Semantics of Terms}
\subsubsection{Constant Assignments}
A constant assignment
is a function
assigning to each constant name a polymorphic value.

=SML
declare_type_abbrev("CON_ASSIGNMENT", ["'U"], ⌜:(STRING → 'U POLY_VALUE)⌝);
=TEX


We call a constant assignment well-formed with respect to a constant environment if
it sends implication and equality to appropriate
polymorphic values and if the set of type variables in the type associated with
each constant in the environment supports the polymorphic value associated
with the constant.
ⓈHOLCONST
	⦏is_wf_con_assignment⦎: CON_ENV → 'U CON_ASSIGNMENT → BOOL
├
	∀conenv conass⦁ is_wf_con_assignment conenv conass ⇔
		(∀tyvarass⦁
			conass "=" tyvarass = EqRel⋎s (tyvarass "*")
		∧	conass "⇒" tyvarass = ImpRel⋎s)
	∧	(∀con ty⦁ con ↦ ty ∈ conenv ⇒ type_ty_vars ty supports (conass con))
■
=TEX

Here we rely on the fact that in the theory $MIN$ equality
is defined to have type $*→*→bool$.
\subsubsection{Interpretations}

An interpretation is a pair consisting of a
type constant assignment and a constant assignment:
=SML
declare_type_abbrev("INTERPRETATION", ["'U"],
		⌜:'U TY_CON_ASSIGNMENT × 'U CON_ASSIGNMENT⌝);
=TEX

An interpretation is
considered to be well-formed with respect to a theory if the
type constant assignment is well-formed with respect to the type environment
of the theory and if the constant assignment is well-formed
and respects the type constant assignment
in an appropriate sense:
ⓈHOLCONST
	⦏is_wf_interpretation⦎	: THEORY → 'U INTERPRETATION → BOOL
├
	∀thy tyconass conass⦁
		is_wf_interpretation thy (tyconass, conass)
	⇔ (	is_wf_ty_con_assignment (types thy) tyconass
	  ∧	is_wf_con_assignment (constants thy) conass
	  ∧	∀s ty⦁ s ↦ ty ∈ constants thy ⇒
			∀tyvarass⦁is_wf_ty_var_assignment tyvarass ⇒
				conass s tyvarass ∈⋎s type_value tyconass ty tyvarass)
■
=TEX
(Here $constants\,thy\,s\,ty$ is the assertion that a constant
named $s$ with type $ty$ has been defined in the theory $thy$.)
\subsubsection{Variable Assignments}
A variable assignment is a function sending name-type pairs
to polymorphic values.
=SML
declare_type_abbrev("VAR_ASSIGNMENT", ["'U"],
		⌜:(STRING × TYPE) → 'U POLY_VALUE⌝);
=TEX

A variable assignment is considered to be well-formed
with respect to a type constant assignment if the following
condition holds:
ⓈHOLCONST
	⦏is_wf_var_assignment⦎ : 'U TY_CON_ASSIGNMENT →
					'U VAR_ASSIGNMENT → BOOL
├
	∀tyconass varass⦁
		is_wf_var_assignment tyconass varass
	⇔ 	∀s ty tyvarass⦁is_wf_ty_var_assignment tyvarass ⇒
			varass (s, ty) tyvarass ∈⋎s type_value tyconass ty tyvarass
■
\subsubsection{Instantiation of Polymorphic Values}
Given a theory, the name of a constant and the type of an instance of a constant,
the declared type may be matched with the instance type and the result used
to instantiate the polymorphic value assigned to the constant appropriately.
The function $instance$ that does this is only used in contexts where the constant has an assigned value and the instance type is an instance of the declared type.
ⓈHOLCONST
	⦏instance⦎ : THEORY → 'U INTERPRETATION →
				STRING × TYPE →'U POLY_VALUE
├
	∀thy tyconass conass s instty f declty⦁
		is_wf_con_assignment (constants thy) conass ⇒
		s ↦ declty ∈ constants thy ∧ inst_type f declty = instty ⇒
			instance thy (tyconass, conass) (s, instty)
		=	(λtyvarass⦁ conass s (λtyvar⦁ type_value tyconass (f tyvar) tyvarass))
■

I am indebted to Ramana Kumar for pointing out that instantiation of polymorphic values was not addressed in earlier versions of this document and for commenting on the solution to that shortcoming.
=TEX
\subsubsection{Semantics of Terms}
The value of a term with respect to a type assignment
and a constant assignment is a function
mapping variable assignments to polymorphic values.
If the term is a variable then its value is given by the variable assignment.
If the term is a constant then the value is given by instantiating the value give
by the constant assignment as determined by its declared type and the type of this instance.
If it is a combination, $f\,a$, then the application operator
$@⋎s$ is used to apply the value of $f$ to that of $a$.
If the term is an abstraction, $λv⦁b$, then
we form
a metalanguage $λ$-abstraction which sends an element, $x$,
of the universe to the value taken by $b$ when $v$ takes
the polymorphic value which is identically $x$. We then
use $Abs⋎s$ to construct a set in $'U$ from this metalanguage
$λ$-abstraction.
ⓈHOLCONST
	⦏term_value⦎	: THEORY → 'U INTERPRETATION  →
			TERM → 'U VAR_ASSIGNMENT → 'U POLY_VALUE
├
	∀thy tyconass conass tm varass sty f a v b⦁
		(term_value thy (tyconass, conass) (mk_var sty) varass
		=	(λtyvarass⦁varass sty tyvarass))
	∧	(term_value thy (tyconass, conass)(mk_const sty) varass
		=	instance thy (tyconass, conass) sty)
	∧	(has_mk_comb(f, a)tm ⇒
			term_value thy (tyconass, conass) tm varass
		=	let vf = term_value thy (tyconass, conass) f
			in let va = term_value thy (tyconass, conass) a
			in (λtyvarass⦁vf varass tyvarass @⋎s va varass tyvarass))
	∧	(has_mk_abs(v, b)tm ∧ mk_var sty = v ⇒
			term_value thy (tyconass, conass) tm varass
		=	λtyvarass⦁
			let dom = type_value tyconass (type_of_term v) tyvarass
			in let rng = type_value tyconass (type_of_term b) tyvarass
			in let fnc = (λx:'U⦁
				term_value thy
				(tyconass, conass) b
				(λsty'⦁if sty' = sty then λtyvarass'⦁x else varass sty')
				tyvarass)
			in Abs⋎s fnc dom rng)
■
=TEX
\subsection{Models of Theories}
\subsubsection{Satisfaction}
Using $term\_value$ and interpreting boolean
terms which evaluate to $λx⦁1⋎s$ as true,
we can define the notion of
a sequence being satisfied by
an interpretation.
We define this notion as an infix relation between
interpretations and sequents.
=SML
declare_infix(1000, "satisfies");
ⓈHOLCONST
	$⦏satisfies⦎	: THEORY × 'U INTERPRETATION → SEQ → BOOL
├
	∀thy int seq⦁ (thy, int) satisfies seq ⇔
		∀varass tyvarass⦁
		let val_of = λtm⦁term_value thy int tm varass tyvarass
		and (tyconass, _) = int
		in	is_wf_ty_var_assignment tyvarass
		∧	is_wf_var_assignment tyconass varass
		∧	(∀asm⦁asm ∈ hyp seq ⇒ val_of asm = 1⋎s)
		⇒	val_of (concl seq) = 1⋎s
■
=TEX
\subsubsection{Models}
A model for a theory is an interpretation which is
well-formed with respect to the theory and which satisfies
all of its axioms:
ⓈHOLCONST
	⦏is_model⦎	: THEORY → 'U INTERPRETATION SET
├
	∀thy int⦁
		int ∈ is_model thy ⇔
		(is_wf_interpretation thy int ∧
		∀seq⦁seq ∈ axioms thy ⇒ (thy, int) satisfies seq)
■
\subsubsection{Validity}
A sequent is valid with respect to a theory
if it is satisfied by any model of that theory. Because of
the restriction that any type variable in the defining property
of a constant must also appear in the type of the constant, we
have to give $valid$ an additional apparently unused parameter.
(The reasons for this are further discussed in the description
of $new\_specification$ in \cite{DS/FMU/IED/SPC003}.)
ⓈHOLCONST
	⦏valid⦎	: 'U → THEORY → SEQ SET
├
	∀v thy seq⦁
		seq ∈ valid v thy ⇔
		∀int:'U INTERPRETATION⦁int ∈ is_model thy ⇒ (thy, int) satisfies seq
■

=TEX
\pagebreak
=IGN
\input{\jobname.thy.tex}
\pagebreak
=TEX
\appendix
\section{CONSISTENCY AND INDEPENDENCE} \label{Consistency}
In this appendix we briefly discuss the consistency and mutual independence of the
postulates for a set theory given in section~\ref{SetTheories} above.
We make use of informal set-theoretic notions.

My original arguments for the independence of union and pairing were incorrect.
I am much indebted to Prof. Robert M. Solovay for pointing this out and supplying
the arguments given below.

\subsection{Consistency}
Since we have not included an axiom of infinity, a model
for the postulates may be constructed using a model of the
hereditarily finite sets\footnote{%
A set, A, is hereditarily finite if its transitive closure
is finite. Here the transitive closure
$tr\_cl\,A$, of $A$ is defined by
$tr\_cl\,A = A\,∪\,(⋃A)\,∪\,(⋃(⋃A))\,∪\,(⋃(⋃(⋃A)))\,∪\,\ldots$.
Less formally, a set is hereditarily finite if it is finite, all
its elements are finite, all their elements are finite and so on.}
in classical set theory.

It is easy to see that the hereditarily finite sets would supply
a model for our postulates if we could represent them as an HOL
type and define the membership relation for them in terms of
that representation. This is straightforward: e.g. take the type, ℕ,
of natural numbers under the relation, $mem$, informally described by:
=GFT Informal Discussion
	mem i j ⇔ the i-th coefficient in the binary expansion of j is 1
=TEX

Thus our definition of set theory is consistent in the sense
that some instance of the predicate $is\_set\_theory$ is
satisfiable.

Note that if one wishes to introduce an axiom of infinity
and attempt to construct a model for HOL on that basis,
then one can presumably construct a model just
using the separation and power set axioms.
This should follow from the fact that
the cumulative hierarchy in {\tt ZF} is constructed using
only the power set and union operators, since a model
for HOL only requires sets formed before stage $\omega + \omega$ and
the axiom of infinity gets one beyond stage $\omega$ immediately.


\subsection{Independence}
The 5 postulates section~\ref{SetTheories} are independent.
For example, we can construct a model that satisfies all the postulates except extensionality,
so that extensionality is not a logical consequence of the other postulates.
The following paragraphs sketch such a construction for each postulate in turn:

\paragraph{Extensionality}
To see that extensionality is independent of the other postulates,
we adjoin a new empty individual, $X$ say,
to a model of all the postulates.
Of course, this actually introduces an infinite family of sets
constructed using $X$ and the various set forming operations.
The resulting system of sets satisfies all of the postulates
except extensionality.

\paragraph{Separation}
The identity relation on a one-element set supplies a model
of all of the postulates apart from separation.

\paragraph{Power Sets}
The hereditarily countable sets supply a model of all of the
postulates apart from the existence of power sets (see \cite{Kunen80} for more information).

\paragraph{Union Sets}
In ZFC, if $\kappa = |X|$ is the cardinal of a set $X$, we write, as usual, $2^{\kappa}$ for the cardinal of the powerset of $X$.
Define $\beta_x$ for $x \in \omega \cup \{\omega\}$,
by
\begin{eqnarray*}
	\beta_0		&=& |\omega| \\
	\beta_{n+1}	&=& 2^{\beta_{n}}, n \in \omega\\
	\beta_{\omega} 	&=& \mbox{\sf sup}_{n \in \omega}|\beta_n|\\
\end{eqnarray*}

One may verify that the set $M$ of all sets which are hereditarily of cardinality less than $\beta_{\omega}$ satisfies all the postulates except the existence of unions.
If one takes $U = \{\beta_n | n \in \omega\}$, then certainly $U \in M$, but $|\bigcup U| = \beta_{\omega} \not\in M$, so $M$ is not closed under unions.

\paragraph{Pairs}
To see the independence of the pairing postulate, consider a model of the system
of axioms derived from ZFC by replacing the axiom of foundation by an axiom asserting
the existence of two sets $A$ and $B$ satisfying $\{a\} = a$ and $\{b\}=b$ and such
that any descending chain with respect to the membership relation stabilises at either $a$ or $b$.
I.e., if $x_1, x_2, \ldots$ is such that $x_{i+1} \in x_i$ for all $i$, then there is a $j$ such that either $\forall i > j \bullet x_i = a$ or $\forall i > j \bullet x_i = b$

Now define  take $M$ to comprise all sets $X$ such that at least one of $a$ and $b$ does not belong to the transitive closure of $X$.
One may check that $M$ satisfies all the postulates except pairing.
However, both $a$ and $b$ are in $M$, but the pair $\{a, b\}$ is not, so $M$ is not closed under formation of pairs.

=IGN
\subsection{Some Theorems}
let
	fun thm_tac thm = (
		REWRITE_TAC[thm] THEN EVERY[
		ASM_CASES_TAC⌜∃ mem:'U→'U→bool⦁is_set_theory mem⌝ THEN ASM_REWRITE_TAC[],
		IMP_RES_TAC(specification"-""∈⋎s") THEN
		DEF_RES_TAC(specification"-""is_set_theory")]
	);
in
	set_goal([], ⌜∃ x1:'U→'U→bool⦁SPEC_∈⋎s x1⌝);
	e(thm_tac(definition"-""∈⋎s_DEF"));
	show(save_top_thm"EXISTS_∈⋎s_THM");

	set_goal([], ⌜∃ x1:'U→('U→bool)→'U⦁SPEC_Sub⋎s x1⌝);
	e(thm_tac(definition"-""Sub⋎s_DEF"));
	show(save_top_thm"EXISTS_Sub⋎s_THM");

	set_goal([], ⌜∃ x1:'U→'U⦁SPEC_ℙ⋎s x1⌝);
	e(thm_tac(definition"-""ℙ⋎s_DEF"));
	show(save_top_thm"EXISTS_ℙ⋎s_THM");

	set_goal([], ⌜∃ x1:'U→'U⦁SPEC_⋃⋎s x1⌝);
	e(thm_tac(definition"-""⋃⋎s_DEF"));
	show(save_top_thm"EXISTS_⋃⋎s_THM");

	set_goal([], ⌜∃ x1:'U→'U→'U⦁SPEC_⊕⋎s x1⌝);
	e(thm_tac(definition"-""⊕⋎s_DEF"));
	show(save_top_thm"EXISTS_⊕⋎s_THM"); ()
end;

set_goal([⌜∃mem:'U→'U→bool⦁is_set_theory mem⌝],⌜∀x:'U⦁¬(x ∈⋎s ∅⋎s)⌝);
e(REWRITE_TAC[specification"-""∅⋎s"]);
e(IMP_RES_THEN (REWRITE1_TAC o show o REWRITE_RULE[specification"-""is_separation"])(specification"-""Sub⋎s") );
val thm1 = show(top_thm());

set_goal([⌜∃mem:'U→'U→bool⦁is_set_theory mem⌝], ⌜∀x y:'U⦁x ∈⋎s x ⊕⋎s y ∧ y ∈⋎s x ⊕⋎s y⌝);
e(IMP_RES_THEN (REWRITE1_TAC o REWRITE_RULE[specification"-""is_pair"])(specification"-""⊕⋎s") );
val thm2 = show(top_thm());


set_goal([⌜∃mem:'U→'U→bool⦁is_set_theory mem⌝], ⌜∅⋎s:'U ≠ 1⋎s⌝);
e(ASM_CASES_TAC⌜∅⋎s:'U = 1⋎s⌝ THEN ASM_REWRITE_TAC[specification"SPC001_SUPPORT""≠"]);
e(SUBGOAL_THEN⌜∃x:'U⦁x ∈⋎s ∅⋎s⌝ (ACCEPT_TAC o REWRITE_RULE[thm1]));
e(ONCE_ASM_REWRITE_TAC[] THEN REWRITE_TAC[specification"-""1⋎s", specification"-""Unit⋎s"]);
e(EXISTS_TAC⌜∅⋎s:'U⌝ THEN REWRITE_TAC[thm2]);
val thm3 = show(top_thm());

=IGN
\input{\jobname.thy.tex}
=TEX
\twocolumn[\section{INDEX OF DEFINED TERMS}]
\printindex
\end{document}





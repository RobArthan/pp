=IGN
********************************************************************************
spc001.doc: this file is part of the PPTex system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
=TEX
%
%	hol_list -d play spc001 >spc001.thy.doc
%	doctex spc001.thy
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
\title{{\bf HOL Formalised: \\ Language and Overview}}  %% Mandatory field
\author{R.D. Arthan \\ Lemma 1 Ltd. \\ rda@lemma-one.com}
\date{25 October 1993 \\ Revised \FormatDate{\VCDate}}

\begin{document}
\begin{titlepage}
\maketitle
\begin{abstract}
This document is the first in a suite of documents
which give a formal specification of HOL. It acts as an overview
to the formal treatment and includes the detailed treatment
of the HOL language.

The overview of the specification discusses the theoretical background and some of the decisions which have been taken in approaching the specification task.
It also describes briefly the {\ProductHOL} specification facilities which are used.

The description of the HOL language defines the syntax of types, terms sequents and theories.
Some supporting functions, such as a function to carry out type instantiation, are also defined.

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
\newpage
\subsection{Document cross references}
\bibliographystyle{fmu}
\bibliography{fmu}

% \subsection{Changes forecast}
% If the necessary support for recursive types is provided
% then it will probably be used instead of the constructions
% currently made here to define the types of types and terms.
\newpage
\section{GENERAL}
\subsection{Scope}
This document is part of a formal specification of the
HOL logic.
The formal specification is a formal treatment
of the description of the HOL logic and proof development
system given in chapters 9 and 10 of \cite{SRI89a}.

This document contains a brief overview of the specification
and also defines the syntax of the HOL language
as used throughout the specification.

\section{OVERVIEW OF THE SPECIFICATION}\label{OVERVIEW}
\subsection{Theoretical Background}\label{TheoreticalBackground}
It may be helpful to discuss some generalities about
the definition of logics, in order to set in context the
specific constructions we will make to specify the HOL
deductive system.
Readers who know what to expect are invited to skip this
section.
If we apply Occam's Razor fairly viciously to the
sort of definition found in, e.g., Mendelson's
textbook on logic \cite{mendelson87},
one finds that
a deductive system\footnote{
Mendelson calls it a {\it formal theory}. The term
{\it formal system} and others are also used.}
is
given by a set, $S$, whose elements we will call sentences
in this section, and a subset
$I$ of $\bigcup_{n=1}^{\infty}S^n$.
One says that $x \in S$ is {\em directly derivable} from
$X \subseteq S$ if for some $n$,
$(X^{n-1} \times \{x\}) \cap I \not= ∅$. One then says that
$x \in S$ is {\em derivable} from $X \subseteq S$,
if for some sequence $x_1,x_2, \ldots, x_k$ of elements
of $S$, $x_k = x$ and, for each $i$, $x_i$ is
either in $X$ or is directly derivable from
$\{x_1,x_2, \ldots, x_{i-1}\}$.
One says that $x \in S$ is a {\em theorem} if it
is derivable from $∅$.

In practice, $S$ is usually defined by a decidable
``well-formedness'' predicate on the free algebra, $F(\Omega)$,
over some signature, $\Omega$, and
$I$ is given as the union of a set of decidable
$n$-ary relations (the rules of inference).

The above ideas, while of theoretical value, are not
sufficient for a practical proof development system like
HOL, since, in such a system, the user can introduce
new constructs into the language $S$ by modifying
the signature $\Omega$, and can assert that certain
sentences in the extended language,
$S(\Omega)$, are axioms. For example, when a new constant
is defined in HOL, the language is extended to include
the new constant and an axiom that the constant
is equal to the value given in its definition is asserted.

Let us assume that the well-formedness predicates
and inference rules are defined so as to apply to
sentences over any signature the user can define.
This may be achieved by restricting the signatures
to be subsignatures of a signature $\Sigma_{max}$.
A predicate over $F(\Sigma_{max})$
then restricts to a predicate over $F(\Omega)$ for
any subsignature, $\Omega$, of $\Sigma_{max}$, and,
similarly, any set of rules of inference over
$L(\Sigma_{max})$ restricts to a set of rules of inference
over $S(\Sigma_{max})$.
Let us assume that a well-formedness predicate and
a set of rules of inference have been defined for
some signature $\Sigma_{max}$.

Let us define a  {\it theory} to be a
pair $(\Omega, X)$, where $\Omega$ is a subsignature
of $\Sigma_{max}$ as above,
and $X \subseteq S(\Omega)$. X is the set of axioms
of the theory.
A {\it theorem} in a theory, $(\Omega, X)$, is a
sentence in $S(\Omega)$ which is derivable from $X$
(with respect to the rules of inference restricted
to $S(\Omega)$).
Thus the axioms, $X$, act as additional unary rules of
inference.
Theories form a partially ordered set with respect to
inclusion. We will actually use {\it extension}: the relation
inverse to inclusion.

(The signature part of a theory can in many cases of
interest be omitted. For example, treatments of first-order
logic commonly offer an infinite supply of constant
letters and predicate letters for use in constructing
sentences. This corresponds to insisting
that each signature $\Omega$ is equal to $\Sigma_{max}$
in the above formulation. The more general
treatment discussed here seems more appropriate to HOL.)


The rules of inference over $S(\Sigma_{max})$
induce rules of inference on the sentences in the
language, $L(T)$, of a given theory $T$. The theorems of the theory
$(\Omega, X)$ are then precisely the sentences in
$S(\Omega)$ which are derivable from $X$ using the
induced inference rules.

A theory is {\em consistent} if
not every sentence in its language is a theorem.
Of particular interest in a practical proof development
system are mechanisms for extending a theory which
preserve consistency.
A theory $T_1$ is a {\it conservative
extension} of a theory $T$ if $T_1$ extends $T$
and all sentences in $L(T)$ which are theorems
in $T_1$ are also theorems in $T$. Clearly conservative
extensions preserve consistency.

A {\it semantics} for a theory $(\Omega, X)$ gives meaning
to the sentences of the language $S(\Omega)$ by assigning values
to them. This is most readily done by selecting
on the basis of intuitive or theoretical considerations, some
$\Omega$-algebra, $V$ and considering the restriction to
$S(\Omega)$ of the mapping from $F(\Omega)$ given by
the universal property of a free algebra.
Such a mapping is called an $interpretation$ of the theory.
If $V$ has sufficient structure for us to view
the sentences of $S(\Omega)$ as propositions, we may
use an interpretation to reason about the rules of inference
and the axioms $X$. In particular, given a {\it a model} ---
an interpretation which maps the axioms to true propositions  ---
we may ask whether the inference rules are {\it valid}, i.e.
whether they preserve truth.

\subsection{Structure of the Specification}
The previous section identifies three main topics we
have to consider for HOL: its language, its deductive
system and its semantics.
We also wish to specify, at an abstract level, the critical
properties of a program purporting to support the development
of proofs in the logic.
We devote a document to each of these four topics
\cite{DS/FMU/IED/SPC001,DS/FMU/IED/SPC002,DS/FMU/IED/SPC003,DS/FMU/IED/SPC004}.
Each document in the specification contributes an HOL theory.
The theories are briefly described in the following table:

\begin{center}
\begin{tabular}{|c|c|p{4in}|}\hline
Name&Parents & Description\\\hline
spc001&fin\_set\footnotemark
& This contains our definition of the
HOL language. The main definitions are types
$TYPE$, $TERM$ and $THEORY$ representing the
types, terms and theories described in \cite{SRI89a}.
\\\hline
spc002&spc001&
This specifies the semantics of the HOL language.
The main definitions are of a predicate $is\_set\_theory$
which specifies the sorts of universe
in which the semantics can be given and a predicate
$is\_model$ which specifies what it means to be a model
of a $THEORY$ in some such universe.
\\\hline
spc003&spc001&
This specifies the HOL deductive system. That is to say
it defines the notion of derivability (with respect
to a formalisation of the primitive inference rules
of HOL as described in \cite{SRI89a}).
\\\hline
spc004&\begin{tabular}{c}spc002\\spc003\end{tabular}&
This gives an abstract model of an HOL proof development
system and gives semantic and syntactic formulations
of the critical properties of such a system.
\\\hline
\end{tabular}


\footnotetext{%
This is a library theory making available operations on sets,
lists, strings etc.}%

\end{center}

\subsection{Approach}
Initially we had hoped to present something which
could specify
both the deductive system
(i.e. the formal theory
in the sense of a mathematical structure with sentences,
inference rules etc.) and the
system (i.e. the program which enable one
to calculate theorems).
However, in defining the deductive system
we frequently  found that attempts to
make the specification ``constructive'' tended to
obscure some issues.
We have consequently erred on the
side of abstraction in most cases. For example, many
of the functions we need are partial functions: we
represent these as binary relations, rather than
approximate them with total functions.
This approach was felt to lead to a clearer
specification than would be obtained by using approximating
total functions together with checks on the arguments
supplied in each application.

In formalising the system we have, on occasion, felt
that certain changes would be desirable for one reason
or another. We have resisted all such urges ---
what is presented here is meant to be a rigorous
formulation of the logic as described in \cite{SRI89a}.
Where \cite{SRI89a} has proved a little too loose for our
purposes (e.g. in the details of type instantiation),
we have tried to follow the spirit of the HOL system.

There are occasionally differences in terminology
between our usage and \cite{SRI89a}. We have attempted
to indicate these as they arise.
This is most evident in the semantics since our treatment
is in HOL rather than ZF set theory as used in \cite{SRI89a}.

\subsection{Notation}
The documents which make up the specification are
{\em literate scripts} containing a mixture of narrative
text and input for the {\Product} system. The theory listings
in the documents are obtained by
loading the HOL input from the documents into the
HOL system and the listing the theories produced.

The specification makes much use
of the Z-like specification features {\Product} provides.
These features are briefly explained here.

Constants are intoduced using constant definition
boxes which have the form:
=SML
(*
ⓈHOLCONST
	c1 : ty1,
	c2 : ty2,
	...
├
	P
■
=SML
*)
=TEX
The intention of this is to introduce new constants, $c1$, $c2$, \ldots, satisfying the property $P$, using
$new\_specification$,
and, if the consistency proposition required
by $new\_specification$ can be proved automatically
by one of a range of heuristics, then the effect is
exactly that. If the consistency proposition cannot be
proved automatically the constants are still introduced
but with a defining property which is consistent and which
is equivalent to $P$ if $P$ is consistent.
A metalanguage function ``$specification$'', analagous
to ``$definition$'' may be used to extract the defining
property from the theory database.

Some use is made of an experimental metalanguage function $type\_spec$ which
is an analogue of the constant definition box for defining
types and deferring any proof obligations. It is supported by object language constants $\simeq$ and $Of$. A definition such as:

=GFT
type_spec {rep_fun="rep_three", def_tm =
	⌜THREE ≃ mk_three Of (λi:ℕ⦁ i < 3)⌝
};
=TEX
introduces a new type $THREE$, with representation function
$rep\_three$ and abstraction function $mk\_three$, which is in one-to-one correspondence with the set of natural numbers less than $3$.

In cases where the proof obligations for introducing
a new type are proved, an experimental metalanguage function called $abs\_rep\_spec$
is used as a convenient way of introducing abstraction and representation
functions for the new type.
This takes as parameters a metalanguage labelled record including components which name the type and the two functions to be introduced.

Other significant differences from Cambridge HOL are: object
language terms are quoted using Strachey brackets,
``⌜'' and ``⌝''; type variables are distinguished using a prime rather than an asterisk, e.g. $'a$ rather than $*$; and type abbreviations with arguments
are supported (any type variables in the definition
of the abbreviation become arguments).

Largely for historical reasons, the object language described in this formal treatment uses the Cambridge HOL conventions in those places where it is necessary to give concrete syntax.
\pagebreak
\section{PREAMBLE}
\Hide{
extend_theory"SPC001";
}
We introduce the new theory. Its parent is a
library theory containing various definitions we need.
=SML
open_theory"fin_set";
new_theory⦏"spc001"⦎;
push_pc"hol";
=TEX
\Hide{%
% ##########################################################################
% The following should go elsewhere:
=SML
fun ⦏abs_rep_spec⦎ {
	type_def_name : string,
	rep_fun : string,
	abs_fun : string,
	def_conv : CONV OPT} : THM = (
	let	val thm1 = (get_defn "-" type_def_name)
			handle ex => reraise ex "abs_rep_spec";
		val thm2 = ⇒_match_mp_rule type_lemmas_thm thm1
			handle ex => thm_fail "abs_rep_spec" 999 [thm1];
		val conv = RAND_C(SIMPLE_λ_C(RAND_C(simple_α_conv rep_fun)))
				THEN_C RAND_C(simple_α_conv abs_fun)
				THEN_C (case def_conv of
					Nil => id_conv
				|	Value c => c);
		val thm3 = (conv_rule conv thm2)
			handle ex => thm_fail "abs_rep_spec" 998 [thm2];
	in	new_spec([abs_fun, rep_fun], 2, thm3)
		handle ex => reraise ex "abs_rep_spec"
	end
);
=TEX
}\Hide{%
ⓈHOLCONST
	MakeNonEmpty : 'a SET → 'a SET
├
	∀a⦁(∃x⦁x ∈ MakeNonEmpty a) ∧ ((∃x⦁x ∈ a) ⇒ MakeNonEmpty a = a)
■
}\Hide{%
=SML
push_consistency_goal⌜MakeNonEmpty⌝;
a(prove_∃_tac THEN strip_tac);
a(CASES_T ⌜∃ x⦁ x ∈ a'⌝ (fn th => rewrite_tac[th] THEN strip_asm_tac th));
(* *** Goal "1" *** *)
a(∃_tac ⌜a'⌝ THEN rewrite_tac[] THEN ∃_tac⌜x⌝ THEN strip_tac);
(* *** Goal "2" *** *)
a(∃_tac ⌜{x|T}⌝ THEN rewrite_tac[]);
save_consistency_thm⌜MakeNonEmpty⌝(pop_thm());
=TEX
}\Hide{%
=SML
val type_spec_thm = (
	push_goal([], ⌜∀a⦁∃x⦁(λx⦁x ∈ MakeNonEmpty a) x⌝);
	a(rewrite_tac[get_spec⌜MakeNonEmpty⌝]);
	pop_thm()
);
=TEX
}\Hide{%
=SML
declare_infix(200, "≃");
declare_infix(300, "Of");
declare_alias("Of", ⌜$Image⌝);
=TEX
}\Hide{%
ⓈHOLCONST
	$≃ : 'a SET → 'b SET → BOOL
├
	∀a b⦁a ≃ b ⇔ ∃f⦁ f ∈ a ↣ b
■
}\Hide{%
=SML
fun ⦏type_spec⦎ {rep_fun : string, def_tm : TERM} : THM = (
	let	open Sort;
		val (lhs, rhs) = dest_bin_op "type_spec" 99999 "≃" def_tm;
		val (tyn, _) = dest_var lhs;
		val (con, set) = dest_bin_op "type_spec" 99999 "Image" rhs;
		val ty_thm = ∀_elim set type_spec_thm;
		val ty_pars = sort string_order (term_tyvars set);
		val type_def_name = tyn^" 2";
		val ty_def = new_type_defn([type_def_name], tyn, ty_pars, ty_thm);
		val abs_fun = fst (dest_var con);
	in	abs_rep_spec{
			abs_fun = abs_fun,
			rep_fun = rep_fun,
			def_conv = Value(ONCE_MAP_C β_conv),
			type_def_name = type_def_name}
	end
);
=TEX
}
% ##########################################################################
=TEX
\section{THE SYNTAX OF TYPES AND TERMS} \label{TYPESANDTERMS}

We now embark on defining the language of HOL. The treatment
will follow the lines discussed in section \ref{TheoreticalBackground} above.
However, since we are only interested in a particular
language we do not do any general universal
algebra.
Thus, apart from a minor complication
dealt with in section \ref{SEQUENTS} below, defining our
version of
$F(\Sigma_{max})$ and $L(\Sigma_{max})$
amounts
to specifying the language of HOL types and terms.

The language is defined informally in \cite{SRI89a}
by a grammar essentially the same as the following
(in which the terminal symbols, $tyvar$,
$tyop$ etc., stand for names of various sorts of
objects).


=GFT BNF
	type	=	tyvar					(* Type Variable *)
		|	`(`, type, {`,`, type}, `)`, tyop;		(* Compound Type *)

	term	=	var, `:`, type				(* Variable *)
		|	con, `:`, type				(* Constant *)
		|	term, term				(* Application *)
		|	`λ`, var, `:`, type, `⦁`, term;		(* λ-abstraction *)
=TEX

Here the atomic types and function
types of \cite{SRI89a} are subsumed by the compound types
(an atomic type being a compound type with no parameters
and a function type being one with exactly two parameters
and with the type operator `$→$').


The type and term languages are subject to
well-formedness rules of two sorts:
context-sensitive rules governing
conformance of the type of a
constant or the arity of a type
with a definition of the constant or type contained
in a theory;
and the ``local'' rule that the operator of
a combination be of an appropriate type to apply
to its operand.
To avoid a mutual recursion between the types
$TYPE$, $TERM$ and $THEORY$ which we are going to define,
we will not impose the context-sensitive rules as part
of the definitions of $TYPE$ and $TERM$. Instead, when
we define the type $THEORY$, we insist that any types
or terms which appear in a theory satisfy appropriate
conditions.
In the following subsections we therefore only consider
the local well-typing rule.

If machinery were available to define the recursive
types we need automatically, we would probably use it
(to define the free algebra of types and a free algebra
which would have the type of terms as a subset).
Unfortunately, the type $TYPE$ involves a recursion
through the $list$ type constructor and this is not
currently supported by T. Melham's system for defining
recursive types (and no suitable analogue is currently available
for {\Product}). Consequently we work here with an
explicit concrete
representation of types and terms using strings.

\subsection{Names}
We could, in priniciple, take the names which appear
in types and terms from some arbitrary type. However the
extra generality would add complexity and does not seem to
offer any benefit over
the natural representation of names as strings.

It is, however, technically convenient to allow arbitrary strings
to be used as names (since this lets us formulate and
use the constructor functions for types and terms in a natural way).
To enable this we use
an encoding of names in the concrete representation which
allows an arbitrary string to be viewed as a name.
To do this we use an escape character to
protect any occurrences of the characters which act
as delimiters in the concrete representation of types
or terms.

We use `$\$$' as the escape character (in fact any
character other than `(', `)', `,', `:', `λ' or `⦁' would
do).
The encoding is then given by the following function:
ⓈHOLCONST
	⦏encode⦎ : STRING → STRING
├
∀ch : CHAR; s : STRING ⦁
		encode "" = ""
	∧	encode (Cons ch s) =
		if	ch ∈ {`$`; `(`; `)`; `,`; `:`; `λ`; `⦁`}
		then	Cons `$` (Cons ch (encode s))
		else	Cons ch (encode s)
■
=TEX

The range of the function $encodeencode$ will comprise the
strings produced by the following grammar:
=GFT BNF
	name	=	""
		|	(char - ("$" | "(" | ")" | "," | ":" | "λ" | "⦁")), name
		|	"$", char, name;
=TEX
\subsection{Types}
Our concrete representations for types are the strings which
satisfy a predicate, $is\_type,$ defined below.
This is satisfied only by the strings produced
by the following grammar:
=GFT BNF
	type	=	name
		|	"(`, [type, {`,`, type}], `)`, name;
=TEX

The following utility function is used to construct
the argument lists of compound types.
ⓈHOLCONST
	⦏comma_list⦎ : STRING LIST → STRING
├
	comma_list [] = ""
∧	∀x t ⦁ 		comma_list (Cons x t)
		=	if	t = []
			then	x
			else	x @ (Cons `,` (comma_list t))
■
=TEX
The operations on strings which will
represent the constructor functions of the type $TYPE$
are the following:
ⓈHOLCONST
	⦏mk_var_type_rep⦎: STRING → STRING

├
	∀s⦁mk_var_type_rep s = encode s
■
=TEX
ⓈHOLCONST
	⦏mk_type_rep⦎: STRING × STRING LIST  → STRING
├
	∀s tl⦁mk_type_rep(s, tl) = "(" @ comma_list tl @ ")" @ encode s
■
=TEX
We may now define $is\_type$ as the smallest set
which is closed under the constructors $type\_rep$
and $mk\_type\_rep$.
ⓈHOLCONST
	⦏is_type⦎ : STRING SET
├
	is_type = ⋂{X:STRING SET |
	(∀s⦁ mk_var_type_rep s ∈ X)
∧	(∀pars tycon⦁
		Elems pars ⊆ X
	⇒	mk_type_rep(tycon, pars) ∈ X)}
■
=TEX
We prove that $is\_type$ is non-empty and use
the result to define a new type, $TYPE$.
=SML
val ⦏thm1⦎ = save_thm(⦏"thm1"⦎, (
	set_goal([], ⌜∃ty⦁ty ∈ is_type⌝);
	a(∃_tac⌜encode s⌝);
	a(rewrite_tac (map get_spec[⌜is_type⌝, ⌜⋂⌝, ⌜mk_var_type_rep⌝]));
	a(REPEAT strip_tac THEN asm_rewrite_tac[]);
	pop_thm()
));
=TEX
The definition of the new type follows the usual pattern:
=SML
val type_def = new_type_defn (["TYPE"], "TYPE", [],
	(tac_proof( ([], ⌜∃ty⦁(λty⦁ty ∈ is_type) ty⌝),
		rewrite_tac[thm1])));
=SML
val abs_type_rep_type_def = abs_rep_spec
	{type_def_name = "TYPE",
	 abs_fun = "abs_type",
	 rep_fun = "rep_type",
	 def_conv = Value (rewrite_conv[])};
=TEX
The constructor functions for the new type are:
ⓈHOLCONST
	⦏mk_var_type⦎: STRING → TYPE

├
	∀s⦁mk_var_type s = abs_type (mk_var_type_rep s)
■
=TEX
\ldots and:
ⓈHOLCONST
	⦏mk_type⦎: STRING × TYPE LIST  → TYPE
├
	∀s tl⦁mk_type(s, tl) = abs_type(mk_type_rep(s, Map rep_type tl))
■
=TEX
We will also need a destructor function for
types:
ⓈHOLCONST
	⦏dest_type⦎: TYPE → STRING × (TYPE LIST)
├
	∀s tyl⦁dest_type(mk_type(s, tyl)) = (s, tyl)
■
=TEX
\ldots and the constant type \Bool:
ⓈHOLCONST
	⦏Bool⦎ : TYPE
├
	Bool = mk_type("BOOL", [])
■
\ldots and a function to extract the set of type variables of a type:
ⓈHOLCONST
	⦏type_ty_vars⦎: TYPE → STRING SET
├
	(∀x s⦁ x ∈ type_ty_vars (mk_var_type s) ⇔ x = s)
∧	(∀x s tyl⦁
		x ∈ type_ty_vars (mk_type (s, tyl))
	⇔	∃ty⦁ ty ∈ Elems tyl ∧ x ∈ type_ty_vars ty)
■

=TEX
\subsection{Terms}
The representation type for the well-formed terms will
be $string×TYPE$. The $string$ component gives the
concrete representation of the term according to
the following grammar:
=GFT BNF
	term	=	`V`, name, `:`, type
		|	`C`, name, `:`, type
		|	`(`, term, `)(`, term, `)`
		|	`λV`, name, `:`, type, `⦁`, term;
=TEX
The $TYPE$ component gives the type
of the term.  This representation is analogous to the terms
subscripted with their types one finds in \cite{SRI89a}.
(Note that the types which appear in the $string$ components
are not redundant. Without them it would not in general
be possible to recover the types of the constituents of
a combination, so that the constructor, $mk\_comb$,
for combinations would not be injective.)

The constructor functions for the type of terms will be
represented by the following operations on strings.

ⓈHOLCONST
	⦏mk_var_rep⦎ : STRING × TYPE → STRING
├
	∀s ty ⦁ mk_var_rep (s, ty) = "V" @ encode s @ ":" @ rep_type ty
■
=TEX
ⓈHOLCONST
	⦏mk_const_rep⦎ : STRING × TYPE → STRING
├
		∀s ty ⦁ mk_const_rep (s, ty) = "C" @ encode s @ ":" @ rep_type ty
■
=TEX
ⓈHOLCONST
	⦏mk_comb_rep⦎ : STRING × STRING → STRING
├
	∀tm1 tm2 ⦁ mk_comb_rep (tm1, tm2) = "(" @ tm1 @ ")(" @ tm2 @ ")"
■
=TEX
ⓈHOLCONST
	⦏mk_abs_rep⦎ : STRING × TYPE × STRING → STRING
├
	∀s ty tm ⦁ mk_abs_rep (s, ty, tm) = "λV" @ s @ ":" @ rep_type ty @ "⦁" @ tm
■
=TEX
The following utility for forming function types is useful:
ⓈHOLCONST
	⦏Fun⦎ : TYPE → TYPE → TYPE
├
	∀ ty1 ty2⦁Fun ty1 ty2 = mk_type("→", [ty1; ty2])
■
=TEX
The following predicate picks out the well-formed
terms, by imposing the appropriate typing rules.
ⓈHOLCONST
	⦏is_wf_term⦎ : (STRING × TYPE) SET
├
	is_wf_term = ⋂{X:(STRING × TYPE) SET |
	(∀s ty⦁(mk_var_rep(s, ty), ty) ∈ X)
∧	(∀s ty⦁(mk_const_rep(s, ty), ty) ∈ X)
∧	(∀f a tya ty⦁((f, Fun tya ty) ∈ X ∧ (a, tya) ∈ X) ⇒ (mk_comb_rep(f, a), ty) ∈ X)
∧	(∀s b tys tyb⦁ (b, tyb) ∈ X ⇒ (mk_abs_rep(s, tys, b), Fun tys tyb) ∈ X)}
■
=TEX
We prove that well-formed terms exist according
to the above condition using a variable as a witness:

=SML
val ⦏thm2⦎ = save_thm(⦏"thm2"⦎, (
	set_goal([], ⌜∃tm⦁tm ∈ is_wf_term⌝);
	a(∃_tac ⌜(mk_var_rep(s, ty), ty)⌝);
	a(rewrite_tac (map get_spec[⌜is_wf_term⌝, ⌜⋂⌝]));
	a(REPEAT strip_tac THEN asm_rewrite_tac[]);
	pop_thm()
));
=TEX
The definition of the new type follows the usual pattern:
=SML
val term_def = new_type_defn (["TERM"], "TERM", [],
	(tac_proof( ([], ⌜∃tm⦁(λtm⦁tm ∈ is_wf_term) tm⌝),
		rewrite_tac[thm2])));
=SML
val abs_term_rep_term_def = abs_rep_spec
	{type_def_name = "TERM",
	 abs_fun = ⦏"abs_term"⦎,
	 rep_fun = ⦏"rep_term"⦎,
	 def_conv = Value (rewrite_conv[])};
=TEX
We can now define a function which assigns to any term
its type:
ⓈHOLCONST
	⦏type_of_term⦎ : TERM → TYPE
├
	∀ tm ⦁  type_of_term tm = Snd(rep_term tm)
■
=TEX
The constructor functions for the type $TERM$, namely
$mk\_var$, $mk\_const$, $mk\_comb$ and $mk\_abs$,
could be defined as composites of
$mk\_cand\_var$ etc. and
the abstraction and representation functions for $TERM$.
Unfortunately the resulting functions
$mk\_comb$ and $mk\_abs$ are not total functions\footnote{%
$mk\_abs$ could be reparameterised to be total quite simply,
but we prefer to follow the treatment of \cite{SRI89a}.
$mk\_comb$, however, is of necessity partial.}.
Attempts to use an approximating total function turn out
to lead to difficulties when we wish to define functions
on terms by cases.
Thus we must use relations to represent these constructors.
Implementations exploit the fact
that the relations corresponds to a partial function.

In our informal discussions below we will often use the
name $mk\_comb$ and $mk\_abs$
to refer to these relations viewed as partial functions
(i.e. with applicative notation).

The names chosen for the relations are intended to be
suggestive of phrases like: {\it(`x:num', ``1'') has mk\_abs
``λx:num⦁1''}.
ⓈHOLCONST
	⦏mk_var⦎ : (STRING × TYPE) → TERM
├
	∀ s ty ⦁ mk_var (s, ty) = abs_term (mk_var_rep(s, ty), ty)
■
=TEX
ⓈHOLCONST
	⦏mk_const⦎ : (STRING × TYPE) → TERM
├
	∀ s ty⦁ mk_const (s, ty) = abs_term (mk_const_rep(s, ty), ty)
■
=TEX
ⓈHOLCONST
	⦏has_mk_comb⦎ : (TERM × TERM) → TERM → BOOL
├
	∀ f a tm ⦁
	has_mk_comb (f, a) tm ⇔
	∃ty⦁	rep_term tm = (mk_comb_rep(Fst(rep_term f), Fst(rep_term a)), ty)
	∧	type_of_term f = Fun (type_of_term a) ty
■
=TEX
ⓈHOLCONST
	⦏has_mk_abs⦎ : (TERM × TERM) → TERM → BOOL
├
	∀v b tm ⦁ has_mk_abs (v, b) tm ⇔
	(∃ s tys⦁ mk_var(s, tys) = v
	∧	rep_term tm =
		(mk_abs_rep(s, tys, Fst(rep_term b)), Fun tys (type_of_term b)))
■
=TEX

\subsection{Instantiation of Types}
When we define the type of HOL theories
we will need the following
function to formulate some of context-sensitive conditions
that we will wish to impose.
ⓈHOLCONST
	⦏inst_type⦎ : (STRING → TYPE) → TYPE → TYPE
├
	∀(f: STRING → TYPE) ⦁
		(∀s⦁  inst_type f (mk_var_type s) = f s)
	∧	(∀s tl⦁inst_type f (mk_type(s, tl)) =
			mk_type(s, Map (inst_type f) tl))
■
=TEX


\section{SYNTAX OF SEQUENTS} \label{SEQUENTS}
The minor complication mentioned in the previous
section is that HOL is defined as a sequent calculus.
It is the sequents which make up our $L(\Sigma_{max})$.

A sequent is simply a set of assumptions
and a conclusion. Assumptions
and conclusion alike are just terms.
The following definition allows infinite
assumption sets, since they are easier for us to define.
However the axioms with which we shall work all have
finite sets of assumptions and the inference rules
will preserve this property.
Another pleasant property of sequents is for their
constituent terms to have type \Bool. This property,
too, holds of our axioms and is preserved by our inference
rules and when we define theories we insist that the
sequents in them have it.

=SML
declare_type_abbrev(⦏"SEQ"⦎, [], ⓣ(TERM SET) × TERM⌝);
=TEX

The following functions on sequents are useful for reasons
of clarity. Their names are as in the HOL system.
ⓈHOLCONST
	⦏concl⦎ : SEQ → TERM
├
	concl = Snd
■
=TEX

ⓈHOLCONST
	⦏hyp⦎ : SEQ → (TERM SET)
├
	hyp = Fst
■
=TEX


\section{THEORIES} \label{THEORIES}
In this section we define a type $THEORY$ whose
elements are what we shall think
of as the well-formed HOL theories.
In our case, the signature part of a theory amounts to
two ``environments'', one giving the arity of the type
constructors in the theory and the other giving
the types of the constants\footnote{
These correspond to the {\it type structures} and
{\it signatures} respectively in \cite{SRI89a}.}.


The following type abbreviations help us to
formalise the context-sensitive aspects of the
well-formedness of terms, which we have avoided until
now. Once this is done we can define the type of all
well-formed HOL theories.

=SML
declare_type_abbrev(⦏"TY_ENV"⦎, [], ⓣSTRING ↔ ℕ⌝);

declare_type_abbrev(⦏"CON_ENV"⦎, [], ⓣSTRING ↔ TYPE⌝);

declare_type_abbrev(⦏"SEQS"⦎, [], ⓣSEQ SET⌝);
=TEX


We can now define the well-formedness of types and terms with
respect to a type environment. We assume that
the names for type variables and type constructors
are in distinct lexical classes, and so all we
check is the arity of constructors.
(HOL implementations may impose additional lexical
constraints on the names.)

ⓈHOLCONST
	⦏wf_type⦎ : TY_ENV → TYPE SET
├
	∀ tyenv ⦁
	wf_type tyenv = ⋂{tyset|
		(∀s ⦁ mk_var_type s ∈ tyset)
		∧
		∀s tyl ⦁	s ↦ Length tyl ∈ tyenv ∧ (∀ t ⦁ t ∈ Elems tyl ⇒ t ∈ tyset)
		⇒	mk_type(s, tyl) ∈ tyset}
■
=TEX
For terms we place no restrictions on the names of
variables. (The HOL system tries to prevent constant
names being used as variable names but does not
always succeed, e.g, if the constant is declared after
a theorem using a variable with the same name has been
saved on a theory).
The polymorphic nature of constants in HOL becomes
apparent here in that we may instantiate type variables
appearing in the constant environment.

ⓈHOLCONST
	⦏wf_term⦎: TY_ENV → CON_ENV → TERM SET
├
	∀ tyenv conenv ⦁
	wf_term tyenv conenv = ⋂{tmset|
		(∀s ty⦁ty ∈ wf_type tyenv ⇒ mk_var(s, ty) ∈ tmset)
	∧
	(∀s ty⦁	(ty ∈ wf_type tyenv ∧ ∃ty' tysubs⦁ s ↦ ty' ∈ conenv ∧ inst_type tysubs ty' = ty)
		⇒ mk_const(s, ty) ∈ tmset)
	∧
	(∀f a tm⦁(has_mk_comb(f, a) tm ∧ f ∈ tmset ∧ a ∈ tmset) ⇒ tm ∈ tmset)
	∧
	(∀v b tm⦁(has_mk_abs(v, b) tm ∧ v ∈ tmset ∧ b ∈ tmset) ⇒ tm ∈ tmset)}
■
=TEX
The well-formedness of terms extends straightforwardly
to sequents and to sets thereof. We impose an
additional constraint for sequents: they must be
made up from terms of type \Bool.

ⓈHOLCONST
	⦏wf_seq⦎: TY_ENV → CON_ENV → SEQ SET
├
	∀ seq tyenv conenv⦁
	seq ∈ wf_seq tyenv conenv ⇔
	let	ok = {tm | tm ∈ wf_term tyenv conenv ∧ type_of_term tm = Bool}
	in 	concl seq ∈ ok ∧ ∀tm⦁ tm ∈ hyp seq ⇒ tm ∈ ok
■
=TEX
The $SEQS$ component of a theory is well formed if it is a subset of
the set of sequents which are well-formed with respect to the type and
constant environments:

ⓈHOLCONST
	⦏wf_seqs⦎: TY_ENV → CON_ENV → SEQS SET
├
	∀tyenv conenv⦁
	wf_seqs tyenv conenv = ℙ (wf_seq tyenv conenv)
■
=TEX

For the constant environments, we insist that the
type associated with each name be well-formed and
that at most one type is associated with each name (i.e. the environment
must be a functional relation).
Overloaded constant names could, in principle, be allowed,
as an extension to the system. This function would then be
modified to impose some weaker condition.

ⓈHOLCONST
	⦏wf_con_env⦎: TY_ENV → CON_ENV SET
├
	∀ conenv tyenv⦁
		conenv ∈ wf_con_env tyenv
	⇔	conenv ∈ Functional
		∧	∀ con ty⦁ con ↦ ty ∈ conenv ⇒ ty ∈ wf_type tyenv
■
=TEX

We insist that at most one arity be associated with
each name in a well-formed type environment (i.e. that the environment is
a functional relation) :

ⓈHOLCONST
	⦏wf_ty_env⦎: TY_ENV SET
├
	wf_ty_env = Functional
■
=TEX

We will consider a triple consisting of a type
environment, a constant environment and a set of
sequents to be a well-formed theory if each constituent
is well-formed with respect to its predecessors:
ⓈHOLCONST
	⦏is_theory⦎: (TY_ENV × CON_ENV × SEQS) SET
├
	∀ty_env con_env axioms⦁
		(ty_env, con_env, axioms) ∈ is_theory ⇔
		ty_env ∈ wf_ty_env ∧
		con_env ∈ wf_con_env ty_env ∧
		axioms ∈ wf_seqs ty_env con_env
■
=TEX

Note that a theory can contain infinitely many
types, constants, or axioms. This possibility
occurs in practice, at least for constants and axioms.
The theory ℕ of natural numbers is an example, since
it contains an axiom defining the decimal representation
of each positive number.

=SML
val ⦏thm3⦎ = save_thm(⦏"thm3"⦎, (
	set_goal([], ⌜∃thy⦁thy ∈ is_theory⌝);
	a(∃_tac ⌜({}:TY_ENV, {}:CON_ENV, {}:SEQS)⌝);
	a(rewrite_tac (map get_spec[⌜is_theory⌝, ⌜wf_ty_env⌝,
		⌜wf_con_env⌝, ⌜wf_seqs⌝,
		⌜Dom⌝, ⌜$At⌝, ⌜$⇸⌝, ⌜$↔⌝, ⌜Functional⌝]));
	pop_thm()
));
=TEX
=SML
val theory_def = new_type_defn (["THEORY"], "THEORY", [],
	(tac_proof( ([], ⌜∃thy⦁(λthy⦁thy ∈ is_theory) thy⌝),
		rewrite_tac[thm3])));
=SML
val abs_theory_rep_theory_def = abs_rep_spec
	{type_def_name = "THEORY",
	 abs_fun = "abs_theory",
	 rep_fun = "rep_theory",
	 def_conv = Value (rewrite_conv[])};
=TEX
We will use the following functions to extract the components
of theories:
ⓈHOLCONST
	⦏axioms⦎ : THEORY → SEQS
├
	∀ thy ⦁ axioms thy = Snd(Snd(rep_theory thy))
■
=TEX
ⓈHOLCONST
	⦏types⦎ : THEORY → TY_ENV
├
	∀ thy ⦁ types thy = Fst(rep_theory thy)
■
=TEX
ⓈHOLCONST
	⦏constants⦎ : THEORY → CON_ENV
├
	∀ thy ⦁ constants thy = Fst(Snd(rep_theory thy))
■
=TEX
The following function which returns the set of sequents
which are in the language associated with a theory
is also useful:
ⓈHOLCONST
	⦏sequents⦎ : THEORY → SEQS
├
	∀ seq thy ⦁
		seq ∈ sequents thy ⇔
		seq ∈ wf_seq (types thy) (constants thy)
■
=TEX

\pagebreak
=IGN
\input{\jobname.thy.tex}
=TEX
\twocolumn[\section{INDEX OF DEFINED TERMS}]
\printindex
\end{document}


=IGN
********************************************************************************
dtd116.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
=TEX
\documentclass[a4paper,12pt]{article}

%%%%% YOU CAN ADD OTHER PACKAGES AS NEEDED BELOW:
\usepackage{A4}
\usepackage{Lemma1}
\usepackage{ProofPower}
\usepackage{epsf}
\makeindex

\def\Title{ Detailed Design: Theory of Real Numbers }

\def\Abstract{\begin{center}
{\bf Abstract}\par\parbox{0.7\hsize}
{\small This document gives the detailed design for the theory
of real numbers in \ProductHOL.}
\end{center}}

\def\Reference{LEMMA1/HOL/DTD116}

\def\Author{R.D. Arthan}

\def\EMail{{\tt rda@lemma-one.com}}

\def\Phone{+44 118 958 4409}

\def\Fax{+44 118 956 1920}

%%%%% YOU MAY WANT TO CHANGE THE FOLLOWING TO GET A NICE FRONT PAGE:
\def\FrontPageTitle{ {\huge \Title } }
\def\FrontPageHeader{\raisebox{16ex}{\begin{tabular}[t]{c}
\bf Copyright \copyright\ : Lemma 1 Ltd \number\year\\\strut\\
\end{tabular}}}
\begin{centering}



\end{centering}

%%%%% THE FOLLOWING DEFAULTS WILL GENERALLY BE RIGHT:

\def\Version{\VCVersion}
\def\Date{\FormatDate{\VCDate}}

%%%%% NOW BEGIN THE DOCUMENT AND MAKE THE FRONT PAGE

\begin{document}
\headsep=0mm
\FrontPage
\headsep=10mm

%%%%% STANDARD RED-TAPE SECTIONS (MAY WANT TO INTERLEAVE SOME \newpage COMMANDS IN THESE)

%%%%% CONTENTS:

\subsection{Contents}

\tableofcontents

%%%%% REFERENCES:

\newpage
\subsection{References}

\bibliographystyle{fmu}

%%%%% CHANGE THE FOLLOWING AS NECESSARY (E.G., TO PICK UP daz.bib):
{\raggedright
\bibliography{fmu}
}
%%%%% CHANGES HISTORY:
\subsection{Changes History}
\begin{description}
\item[Issues 1.1 (2000/12/05)--1.6 (2000/12/09)] Initial development drafts.
\item[Issue 1.7 (2000/12/10)] Added linear arithmetic decision procedure.
\item[Issue 1.8 (2000/12/10)] Added documentation for proof contexts.
\item[Issue 1.9 (2000/12/12)] Corrections after integration testing.
\item[Issue 1.10 (2001/06/28)] Added more documentation on normal forms for literals.
\item[Issue 1.11 (2001/06/29)] Added new evaluation conversion and regrouped the documentation boxes.
\item[Issue 1.12 (2001/11/12)] Added missing ML bindings for definitions of absolute value
and exponentiation.
\item[Issue 1.13 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.14 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.15 (2003/04/28)] Allowed for rationalisation of names in the theory {\it orders};
made sure that no theorems have free variables.
\item[Issue 1.16 (2005/05/07)] HOL now supports left-associative operators.
\item[Issue 1.17 (2005/06/01)] Defined the embedding of the integers.
\item[Issue 1.18 (2006/04/19)] Added exponentiation with integer coefficients.
\item[Issue 1.19 (2006/05/08)] Added normalisation of literal fractions into the proof context.
\item[Issues 1.20 (2006/12/02), 1.21 (2006/12/09)] Added support for floating point literals.
\item[Issues 1.22 (2007/03/03)] Added functions to give maxima and minima of lists.
\item[Issue 1.23 (2007/03/04)] Division by zero is now defined to give zero.
\item[Issue 1.24 (2007/03/04)] Update to reflect concrete syntax enhancements (allowing, e.g.,
=INLINEFT
ℕℝ 1
=TEX
\ to be written as $1.$).
\item[Issue 1.25 (2007/05/16)] Commented out change to division by zero pending outcome of discussion with QinetiQ.
\item[Issue 1.26 (2007/08/31)] Added quantifier elimination procedure for linear real arithmetic.
\item[Issues 1.27 (2007/09/08), 1.28 (2007/09/09)] Redesign of the term ordering functions.
\item[Issue 1.29 (2012/05/08)] Fixed documentation for conversions for maxima, minima and floating point.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.
\item[2015/04/15]
Now uses new date and version macros from doctex
%%%% END OF CHANGES HISTORY %%%%
\end{description}

%%%%%  CHANGES FORECAST:

\subsection{Changes Forecast}

None.

%%%%% DISTRIBUTION LIST

\subsection{Distribution}

Lemma 1 build system.

\newpage

\section{Introduction}
\subsection{Scope}
This document provides the detailed design of the theory of real numbers in \ProductHOL.


\subsection{Purpose and Background}
See \cite{DS/FMU/IED/HLD011}.


\section{PREAMBLE}
=SML
force_delete_theory"ℝ" handle Fail _ => ();
open_theory"dyadic";
set_merge_pcs["basic_hol", "'ℤ", "'sets_alg"];
new_theory"ℝ";
new_parent"orders";
=THDOC
req_name ⦏"ℝ"⦎ (Value "dyadic");
req_parent "orders";
set_flag("tc_thms_only",true);
=DESCRIBE
The theory $reals$ contains a theory of real numbers for HOL.
=ENDDOC

=TEX
\section {DEFINITION OF FIXITY}
=SML
declare_infix(210, "<⋎R");
declare_infix(210, "≤⋎R");
declare_infix(210, ">⋎R");
declare_infix(210, "≥⋎R");
declare_infix(300, "+⋎R");
declare_left_infix(305, "-⋎R");
declare_infix(310, "*⋎R");
declare_left_infix(315, "/");
declare_left_infix(315, "/⋎R");
declare_left_infix(315, "/⋎N");
declare_infix(320, "^⋎N");
declare_infix(320, "^⋎Z");
=TEX
\section{DEFINITIONS}
\subsection{The New Type}

ⓈHOLCONST
│	Is_ℝ_Rep : DYADIC SET → BOOL
├
│	∀a⦁ Is_ℝ_Rep a ⇔ a ∈ Cuts(Universe, $dy_less)
■
=TEX
We now show that the above definition is consistent.
The only tiny difficulty is using the balance theorems to show
that the universe of dyadics is bounded neither above nor below.
In particular, the latter property lets us apply the result from the theory of orders that
says when a downset is a cut:
=SML
local
open Dyadic;
in
val _ = (
set_goal([], ⌜
	StrictLinearOrder (Universe, $dy_less) ∧
	UnboundedBelow (Universe, $dy_less) ∧
	UnboundedAbove (Universe, $dy_less) ∧
	Universe DenseIn (Universe, $dy_less)⌝);
a(rewrite_tac(dy_less_dense_thm::dy_less_irrefl_thm::
	dy_less_antisym_thm::dy_less_trans_thm::dy_less_trich_thm::
	(map get_spec[⌜Irrefl⌝, ⌜Antisym⌝, ⌜Trans⌝, ⌜Trich⌝,
		⌜StrictPartialOrder⌝, ⌜StrictLinearOrder⌝, ⌜UnboundedBelow⌝,
	⌜UnboundedAbove⌝, ⌜$DenseIn⌝])));
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(strip_asm_tac(∀_elim⌜x:DYADIC⌝ dy_balance_thm2));
a(all_fc_tac[∀_elim⌜b⌝dy_times_mono_thm]);
a(SPEC_NTH_ASM_T 1 ⌜b⌝ ante_tac THEN rewrite_tac[dy_times_unit_clauses]);
a(contr_tac THEN all_asm_fc_tac[]);
(* *** Goal "2" *** *)
a(strip_asm_tac(∀_elim⌜x:DYADIC⌝ dy_balance_thm1));
a(all_fc_tac[∀_elim⌜b⌝dy_times_mono_thm]);
a(SPEC_NTH_ASM_T 1 ⌜b⌝ ante_tac THEN rewrite_tac[dy_times_unit_clauses]);
a(contr_tac THEN all_asm_fc_tac[]);
save_thm("dy_less_order_lemmas_thm", pop_thm())
);
=TEX
=SML
val _ = (
set_goal([], ⌜∃a⦁Is_ℝ_Rep a⌝);
a(lemma_tac⌜
	Trans (Universe, $dy_less) ∧
	UnboundedBelow (Universe, $dy_less) ∧
	Universe DenseIn (Universe, $dy_less)⌝);
(* *** Goal "1" *** *)
a(strip_asm_tac (get_thm"-""dy_less_order_lemmas_thm") THEN REPEAT strip_tac);
a(GET_NTH_ASM_T 4 ante_tac
	THEN rewrite_tac[get_spec⌜StrictLinearOrder⌝, get_spec⌜StrictPartialOrder⌝]
	THEN REPEAT strip_tac);
(* *** Goal "2" *** *)
a(LEMMA_T ⌜dy_one ∈ Universe⌝ asm_tac THEN1 rewrite_tac[]);
a(all_fc_tac[downset_cut_thm]);
a(∃_tac⌜DownSet (Universe, $dy_less, dy_one)⌝
	THEN asm_rewrite_tac[get_spec⌜Is_ℝ_Rep⌝]);
save_thm("is_ℝ_rep_consistent_thm", pop_thm())
);
end;
=TEX
Now we can define the new type:
=SML
val _ = new_type_defn(["ℝ", "ℝ_def"], "ℝ", [],
	get_thm"-""is_ℝ_rep_consistent_thm");
=TEX
\subsection{Constants}
We now define the ordering relation. Its characterising property is
that it its a complete linear order which admits an inyection
of the dyadic rationals as a dense subset.
ⓈHOLCONST
│	$⦏<⋎R⦎: ℝ → ℝ → BOOL
├─────────────────────────────
│	StrictLinearOrder(Universe, $<⋎R)
│∧	UnboundedBelow(Universe, $<⋎R)
│∧	UnboundedAbove(Universe, $<⋎R)
│∧	Complete(Universe, $<⋎R)
│
│∧ 	∃ι : DYADIC → ℝ⦁
│		(∀a b⦁ ι a <⋎R ι b ⇔ a dy_less b)
│	∧	{x | ∃a⦁ι a = x} DenseIn (Universe, $<⋎R)
■
=SML
declare_alias("<", ⌜$<⋎R⌝);
=TEX
The other relational operators are then defined in terms of less-than.

ⓈHOLCONST
│	$⦏≤⋎R⦎: ℝ → ℝ → BOOL
├─────────────────────────────
│	∀x y⦁ x ≤⋎R y ⇔ x < y ∨ x = y
■
=SML
declare_alias("≤", ⌜$≤⋎R⌝);
ⓈHOLCONST
│	$⦏>⋎R⦎: ℝ → ℝ → BOOL
├─────────────────────────────
│	∀x y⦁ x >⋎R y ⇔ y < x
■
=SML
declare_alias(">", ⌜$>⋎R⌝);
ⓈHOLCONST
│	$⦏≥⋎R⦎: ℝ → ℝ → BOOL
├─────────────────────────────
│	∀x y⦁ x ≥⋎R y ⇔ y ≤ x
■
=SML
declare_alias("≥", ⌜$≥⋎R⌝);
=TEX

ⓈHOLCONST
│	⦏Sup⦎: ℝ SET → ℝ
├─────────────────────────────
│∀A⦁	¬A = {} ∧  (∃b⦁ ∀x⦁ x ∈ A ⇒ x ≤ b)
│⇒	 (∀x⦁x ∈ A ⇒ x ≤ Sup A) ∧ (∀b⦁ (∀x⦁x ∈ A ⇒ x ≤ b) ⇒ Sup A ≤ b)
■

Addition is then characterised by the ordered group axioms together with the
existence of a positive element in the group.

ⓈHOLCONST
│	$⦏+⋎R⦎: ℝ → ℝ → ℝ;
│	⦏0⋎R⦎ ⦏1⋎R⦎: ℝ
├─────────────────────────────
│	(∀x y z⦁ (x +⋎R y) +⋎R z = x +⋎R (y +⋎R z))
│
│∧	(∀x y⦁ x +⋎R y = y +⋎R x)
│
│∧	(∀x⦁ x +⋎R 0⋎R = x)
│
│∧	(∀x⦁ ∃y⦁ x +⋎R y = 0⋎R)
│
│∧	(∀x y z⦁ y <⋎R z ⇒ x +⋎R y <⋎R x +⋎R z)
│
│∧	0⋎R <⋎R 1⋎R
■
=SML
declare_alias("+", ⌜$+⋎R⌝);
=TEX
Negation:

ⓈHOLCONST
│	$⦏~⋎R⦎: ℝ → ℝ
├─────────────────────────────
│	∀x⦁ x + ~⋎R x = 0⋎R
■
=SML
declare_alias("~", ⌜~⋎R⌝);
=TEX
Subtraction:

ⓈHOLCONST
│	$⦏-⋎R⦎: ℝ → ℝ → ℝ
├─────────────────────────────
│	∀x y⦁ x -⋎R y = x + ~y
■
=SML
declare_alias("-", ⌜$-⋎R⌝);
=TEX
Embedding of the natural numbers:

ⓈHOLCONST
│	⦏ℕℝ⦎: ℕ → ℝ
├─────────────────────────────
│	ℕℝ 0 = 0⋎R
│∧	(∀m⦁ ℕℝ (m + 1) = ℕℝ m +  1⋎R)
■
=TEX
Absolute value:

ⓈHOLCONST
│	⦏Abs⋎R⦎: ℝ → ℝ
├─────────────────────────────
│∀x⦁	Abs⋎R x = if ℕℝ 0 ≤ x then x else ~ x
■
=SML
declare_alias("Abs", ⌜Abs⋎R⌝);
=TEX
Multiplication:

ⓈHOLCONST
│	$⦏*⋎R⦎: ℝ → ℝ → ℝ
├─────────────────────────────
│	(∀x y z⦁ (x *⋎R y) *⋎R z = x *⋎R (y *⋎R z))
│
│∧	(∀x⦁x *⋎R ℕℝ 1 = x)
│
│∧	(∀x y z⦁ x *⋎R (y + z) = x *⋎R y + x *⋎R z)
│
│∧	(∀x y⦁ x *⋎R y = y *⋎R x)
│
│∧	(∀x y⦁ ℕℝ 0 < x ∧ ℕℝ 0 < y ⇒ ℕℝ 0 < x *⋎R y)
■
=SML
declare_alias("*", ⌜$*⋎R⌝);
=TEX
Division:

ⓈHOLCONST
│	$⦏/⋎R⦎: ℝ → ℝ → ℝ
├─────────────────────────────
│	(∀y z⦁ ¬z = ℕℝ 0 ⇒ (y * z) /⋎R z = y)
│∧	(∀x y z⦁ ¬z = ℕℝ 0 ⇒ (x * y) /⋎R z = x * (y /⋎R z))
│(* ∧	(∀x⦁ x /⋎R ℕℝ 0 = ℕℝ 0) *)
■
=SML
declare_alias("/", ⌜$/⋎R⌝);
=TEX
Division of one natural number by another

ⓈHOLCONST
│	$⦏/⋎N⦎: ℕ → ℕ → ℝ
├─────────────────────────────
│	(∀m n⦁ m /⋎N n = ℕℝ m / ℕℝ n)
■
=SML
declare_alias("/", ⌜$/⋎N⌝);
=SML
declare_postfix(320, "⋏-⋏1");

=TEX
Reciprocal:

ⓈHOLCONST
│	$⦏⋏-⋏1⦎: ℝ → ℝ
├─────────────────────────────
│∀x⦁	x ⋏-⋏1 = ℕℝ 1/x
■
=TEX
Exponentiation (with natural number exponents):

ⓈHOLCONST
│	$⦏^⋎N⦎: ℝ → ℕ → ℝ
├─────────────────────────────
│	(∀x⦁ x ^⋎N 0 = ℕℝ 1)
│∧	(∀x m⦁ x ^⋎N (m + 1) = x * x ^⋎N m)
■
=SML
declare_alias("^", ⌜$^⋎N⌝);
=TEX
Embedding of the integers:

ⓈHOLCONST
│ ⦏ℤℝ⦎ :  ℤ → ℝ
├──────
│ 	ℤℝ (ℕℤ 0) = ℕℝ 0
│ ∧	ℤℝ (ℕℤ 1) = ℕℝ 1
│ ∧	∀ i j⦁ ℤℝ(i + j) = ℤℝ i + ℤℝ j
■
=TEX
Exponentiation (with integer exponents):

ⓈHOLCONST
│	$⦏^⋎Z⦎: ℝ → ℤ → ℝ
├─────────────────────────────
│ ∀x m⦁
│	x ^⋎Z (ℕℤ m) = x ^⋎N m
│ ∧	x ^⋎Z ~(ℕℤ(m+1)) = (x ^⋎N (m+1)) ⋏-⋏1
■
=SML
declare_alias("^", ⌜$^⋎Z⌝);
=TEX
Floating point literals:

ⓈHOLCONST
│	⦏Float⦎ : ℕ → ℤ → ℤ → ℝ
├───────────────────────────────
│∀ m p e⦁ Float m p e = ℕℝ m * ℕℝ 10 ^ (e + ~p)
■

Maximum of a list:

ⓈHOLCONST
│ ⦏Max⋎R⦎ : ℝ LIST → ℝ
├────────────────
│ 	(∀x⦁ Max⋎R [x] = x)
│ ∧	(∀x y L ⦁
│		Max⋎R (Cons x (Cons y L)) =
│		if	x < Max⋎R (Cons y L)
│		then	Max⋎R (Cons y L)
│		else	x)
■

Minimum of a list:

ⓈHOLCONST
│ ⦏Min⋎R⦎ : ℝ LIST → ℝ
├────────────────
│ 	(∀x⦁ Min⋎R [x] = x)
│ ∧	(∀x y L ⦁
│		Min⋎R (Cons x (Cons y L)) =
│		if	x > Min⋎R (Cons y L)
│		then	Min⋎R (Cons y L)
│		else	x)
■

=TEX
=TEX
\section{THEOREMS}
=THDOC
req_thm("dy_less_order_lemmas_thm",
		([], ⌜ StrictLinearOrder (Universe, $dy_less)
		    ∧ UnboundedBelow (Universe, $dy_less)
		    ∧ UnboundedAbove (Universe, $dy_less)
		    ∧ Universe DenseIn (Universe, $dy_less)⌝));
req_thm("is_ℝ_rep_consistent_thm",
		([], ⌜ ∃ a⦁ Is_ℝ_Rep a⌝));
req_consistency_thm⌜ $<⋎R ⌝;
=DESCRIBE
=ENDDOC
=THDOC
req_thm("ℝ_unbounded_below_thm",
		([], ⌜ ∀ x: ℝ⦁ ∃ y⦁ y < x⌝));
req_thm("ℝ_unbounded_above_thm",
		([], ⌜ ∀ x: ℝ⦁ ∃ y⦁ x < y⌝));
req_thm("ℝ_less_irrefl_thm",
		([], ⌜ ∀ x: ℝ⦁ ¬ x < x⌝));
req_thm("ℝ_less_antisym_thm",
		([], ⌜ ∀ x y: ℝ⦁ ¬ (x < y ∧ y < x)⌝));
req_thm("ℝ_less_trans_thm",
		([], ⌜ ∀ x y z: ℝ⦁ x < y ∧ y < z ⇒ x < z⌝));
req_thm("ℝ_less_cases_thm",
		([], ⌜ ∀ x y: ℝ⦁ x < y ∨ x = y ∨ y < x⌝));
req_thm("ℝ_≤_cases_thm",([], ⌜ ∀ x y: ℝ⦁ x ≤ y ∨ y ≤ x ⌝));
req_thm("ℝ_≤_less_cases_thm",
		([], ⌜ ∀ x y: ℝ⦁ x ≤ y ∨ y < x⌝));
req_thm("ℝ_eq_≤_thm",([], ⌜ ∀ x y: ℝ⦁ x = y ⇔ x ≤ y ∧ y ≤ x ⌝));
req_thm("ℝ_less_≤_trans_thm",
		([], ⌜ ∀ x y z: ℝ⦁ x < y ∧ y ≤ z ⇒ x < z⌝));
req_thm("ℝ_≤_less_trans_thm",
		([], ⌜ ∀ x y z: ℝ⦁ x ≤ y ∧ y < z ⇒ x < z⌝));
req_thm("ℝ_≤_refl_thm",([], ⌜ ∀ x: ℝ⦁ x ≤ x ⌝));
req_thm("ℝ_≤_antisym_thm",([], ⌜ ∀ x y: ℝ⦁ x ≤ y ∧ y ≤ x ⇒ x = y⌝));
req_thm("ℝ_≤_trans_thm",([], ⌜ ∀ x y z: ℝ⦁ x ≤ y ∧ y ≤ z ⇒ x ≤ z ⌝));
req_thm("ℝ_≤_¬_less_thm",([], ⌜ ∀ x y: ℝ⦁ x ≤ y ⇔ ¬ y < x ⌝));
req_thm("ℝ_¬_≤_less_thm",([], ⌜ ∀ x y: ℝ⦁ ¬ x ≤ y ⇔ y < x ⌝));
req_thm("ℝ_less_¬_eq_thm",([], ⌜ ∀ x y: ℝ⦁ x < y ⇒ ¬ x = y ⌝));
req_thm("ℝ_less_dense_thm",
		([], ⌜ ∀ x y: ℝ⦁ x < y ⇒ (∃ z: ℝ⦁ x < z ∧ z < y)⌝));
req_thm("ℝ_complete_thm",([], ⌜
∀ A ⦁ ¬ A = {} ∧ (∃ b⦁ ∀ x⦁ x ∈ A ⇒ x ≤ b) ⇒
	(∃ s: ℝ⦁ (∀ x⦁ x ∈ A ⇒ x ≤ s) ∧
	(∀ b⦁ (∀ x⦁ x ∈ A ⇒ x ≤ b) ⇒ s ≤ b))⌝));
=DESCRIBE
=ENDDOC
=THDOC
req_consistency_thm⌜ Sup ⌝;
req_thm("ℝ_sup_thm",([], ⌜ ∀ A a
		  ⦁ ¬ A = {} ∧ (∀ x: ℝ⦁ x ∈ A ⇒ x ≤ a)
		      ⇒ (∀ x⦁ x ∈ A ⇒ x ≤ Sup A)
		        ∧ (∀ b⦁ (∀ x⦁ x ∈ A ⇒ x ≤ b) ⇒ Sup A ≤ b)⌝));
req_thm("ℝ_less_sup_thm",([], ⌜ ∀ A
		  ⦁ ¬ A = {} ∧ (∃ a: ℝ⦁ ∀ x⦁ x ∈ A ⇒ x ≤ a)
		      ⇒ (∀ x: ℝ⦁ x < Sup A ⇔ (∃ y⦁ y ∈ A ∧ x < y))⌝));
=DESCRIBE
=ENDDOC
=THDOC
req_thm("ℝ_less_sup_bc_thm",
		([], ⌜
∀A x⦁	¬ A = {} ∧
	(∃ a: ℝ⦁ ∀ x⦁ x ∈ A ⇒ x ≤ a) ∧
	(∃ y⦁ y ∈ A ∧ x < y) ⇒ x < Sup A⌝));
req_thm("ℝ_≤_sup_thm",([], ⌜
∀A a⦁	¬ A = {} ∧
	(∃ a: ℝ⦁ ∀ x⦁ x ∈ A ⇒ x ≤ a) ⇒
	(∀ x⦁ x ≤ Sup A ⇔ (∀ y⦁ (∀ z⦁ z ∈ A ⇒ z ≤ y) ⇒ x ≤ y))⌝));
req_thm("ℝ_≤_sup_bc_thm",([], ⌜
∀A a x⦁	¬ A = {} ∧ (∃ a: ℝ⦁ ∀ x⦁ x ∈ A ⇒ x ≤ a) ∧
	(∀ y⦁ (∀ z⦁ z ∈ A ⇒ z ≤ y) ⇒ x ≤ y) ⇒ x ≤ Sup A⌝));
req_thm("ℝ_∈_≤_sup_bc_thm",
	([], ⌜ ∀ A x⦁ x ∈ A ∧ (∃ a: ℝ⦁ ∀ x⦁ x ∈ A ⇒ x ≤ a) ⇒ x ≤ Sup A⌝));
req_thm("ℝ_⊆_sup_thm",([], ⌜
∀A B⦁	¬ A = {} ∧
	(∃ a: ℝ⦁ ∀ x⦁ x ∈ A ⇒ x ≤ a) ∧
	¬ B = {} ∧ (∃ b⦁ ∀ y⦁ y ∈ B ⇒ y ≤ b) ∧ A ⊆ B ⇒
	Sup A ≤ Sup B⌝));
req_thm("ℝ_sup_≤_bc_thm",([], ⌜
∀A a x⦁	¬ A = {} ∧
	(∃ a: ℝ⦁ ∀ x⦁ x ∈ A ⇒ x ≤ a) ∧
	(∀ y⦁ y ∈ A ⇒ y ≤ x) ⇒ Sup A ≤ x⌝));
req_thm("ℝ_sup_less_bc_thm",
		([], ⌜
∀A x z⦁	¬ A = {} ∧ (∃ a: ℝ⦁ ∀ x⦁ x ∈ A ⇒ x ≤ a) ∧
	(∀ y⦁ y ∈ A ⇒ y ≤ x) ∧ x < z ⇒ Sup A < z⌝));
req_thm("ℝ_sup_eq_bc_thm",([], ⌜
∀A a s⦁ ¬ A = {} ∧ (∀ x: ℝ⦁ x ∈ A ⇒ x ≤ s) ∧
	(∀ x⦁ (∀ y⦁ y ∈ A ⇒ y ≤ x) ⇒ s ≤ x) ⇒
	Sup A = s⌝));
req_thm("ℝ_eq_sup_bc_thm",([], ⌜
∀A a s⦁	¬ A = {} ∧ (∀ x: ℝ⦁ x ∈ A ⇒ x ≤ s) ∧
	(∀ x⦁ (∀ y⦁ y ∈ A ⇒ y ≤ x) ⇒ s ≤ x) ⇒
	s = Sup A⌝));
req_thm("ℝ_less_sup_∈_thm",
		([], ⌜
∀ A a⦁	¬ A = {} ∧ (∀ x: ℝ⦁ x ∈ A ⇒ x ≤ a) ∧ ¬ Sup A ∈ A ⇒
	(∀ x⦁ x < Sup A ⇒ (∃ y⦁ x < y ∧ y < Sup A ∧ y ∈ A))⌝));
=DESCRIBE
=ENDDOC
=THDOC
req_consistency_thm⌜$+⋎R⌝;
req_consistency_thm⌜0⋎R⌝;
req_consistency_thm⌜1⋎R⌝;
req_consistency_thm⌜~⋎R⌝;
=DESCRIBE
=ENDDOC
=THDOC
req_thm("ℝ_plus_assoc_thm",
		([], ⌜ ∀ x y z: ℝ⦁ (x + y) + z = x + y + z⌝));
req_thm("ℝ_plus_comm_thm",([], ⌜ ∀ x y: ℝ⦁ x + y = y + x ⌝));
req_thm("ℝ_plus_unit_thm",([], ⌜ ∀ x: ℝ⦁ x + 0⋎R = x ⌝));
req_thm("ℝ_plus_mono_thm",([], ⌜ ∀ x y z: ℝ⦁ y < z ⇒ x + y < x + z ⌝));
req_thm("ℝ_plus_assoc_thm1",
		([], ⌜ ∀ x y z: ℝ⦁ x + y + z = (x + y) + z⌝));
req_thm("ℝ_plus_mono_thm1",
		([], ⌜ ∀ x y z: ℝ⦁ y < z ⇒ y + x < z + x⌝));
req_thm("ℝ_plus_mono_thm2",
		([], ⌜ ∀ x y s t: ℝ⦁ x < y ∧ s < t ⇒ x + s < y + t⌝));
req_thm("ℝ_plus_0_thm",([], ⌜ ∀ x: ℝ⦁ x + ℕℝ 0 = x ∧ ℕℝ 0 + x = x ⌝));
req_thm("ℝ_0_1_thm",([], ⌜ 0⋎R = ℕℝ 0 ∧ 1⋎R = ℕℝ 1 ⌝));
req_thm("ℝ_plus_order_thm",
		([], ⌜ ∀ x y z: ℝ⦁ y + x = x + y
		      ∧ (x + y) + z = x + y + z
		      ∧ y + x + z = x + y + z⌝));
req_thm("ℝ_plus_minus_thm",
		([], ⌜ ∀ x: ℝ⦁ x + ~ x = ℕℝ 0 ∧ ~ x + x = ℕℝ 0⌝));
req_thm("ℝ_eq_thm",([], ⌜ ∀ x y: ℝ⦁ x = y ⇔ x + ~ y = ℕℝ 0 ⌝));
req_thm("ℕℝ_plus_homomorphism_thm",
		([], ⌜ ∀ m n⦁ ℕℝ (m + n) = ℕℝ m + ℕℝ n⌝));
req_thm("ℝ_minus_clauses",([], ⌜ ∀ x y
		  ⦁ ~ (~ x) = x
		      ∧ x + ~ x = ℕℝ 0
		      ∧ ~ x + x = ℕℝ 0
		      ∧ ~ (x + y) = ~ x + ~ y
		      ∧ ~ (ℕℝ 0) = ℕℝ 0⌝));
req_thm("ℝ_minus_eq_thm",([], ⌜ ∀ x y: ℝ⦁ ~ x = ~ y ⇔ x = y ⌝));
req_thm("ℕℝ_0_less_thm",([], ⌜ ∀ m⦁ ℕℝ 0 < ℕℝ (m + 1) ⌝));
req_thm("ℕℝ_one_one_thm",([], ⌜ ∀ m n⦁ ℕℝ m = ℕℝ n ⇔ m = n ⌝));
=DESCRIBE
=ENDDOC
=THDOC
req_thm("ℝ_plus_clauses",([], ⌜ ∀ x y z : ℝ⦁
		         (x + z = y + z ⇔ x = y)
		      ∧ (z + x = y + z ⇔ x = y)
		      ∧ (x + z = z + y ⇔ x = y)
		      ∧ (z + x = z + y ⇔ x = y)
		      ∧ (x + z = z ⇔ x = ℕℝ 0)
		      ∧ (z + x = z ⇔ x = ℕℝ 0)
		      ∧ (z = z + y ⇔ y = ℕℝ 0)
		      ∧ (z = y + z ⇔ y = ℕℝ 0)
		      ∧ x + ℕℝ 0 = x
		      ∧ ℕℝ 0 + x = x
		      ∧ ¬ ℕℝ 1 = ℕℝ 0
		      ∧ ¬ ℕℝ 0 = ℕℝ 1⌝));
=DESCRIBE
=ENDDOC
=THDOC
req_thm("ℝ_less_less_0_thm",
		([], ⌜ ∀ x y⦁ x < y ⇔ x + ~ y < ℕℝ 0⌝));
req_thm("ℝ_less_clauses",([], ⌜ ∀ x y z : ℝ⦁
		        (x + z < y + z ⇔ x < y)
		      ∧ (z + x < y + z ⇔ x < y)
		      ∧ (x + z < z + y ⇔ x < y)
		      ∧ (z + x < z + y ⇔ x < y)
		      ∧ (x + z < z ⇔ x < ℕℝ 0)
		      ∧ (z + x < z ⇔ x < ℕℝ 0)
		      ∧ (x < z + x ⇔ ℕℝ 0 < z)
		      ∧ (x < x + z ⇔ ℕℝ 0 < z)
		      ∧ ¬ x < x
		      ∧ ℕℝ 0 < ℕℝ 1
		      ∧ ¬ ℕℝ 1 < ℕℝ 0⌝));
req_thm("ℝ_less_0_less_thm",
		([], ⌜ ∀ x y⦁ x < y ⇔ ℕℝ 0 < y + ~ x⌝));
=DESCRIBE
=ENDDOC
=THDOC
req_thm("ℝ_≤_clauses",([], ⌜ ∀ x y z: ℝ⦁
		        (x + z ≤ y + z ⇔ x ≤ y)
		      ∧ (z + x ≤ y + z ⇔ x ≤ y)
		      ∧ (x + z ≤ z + y ⇔ x ≤ y)
		      ∧ (z + x ≤ z + y ⇔ x ≤ y)
		      ∧ (x + z ≤ z ⇔ x ≤ ℕℝ 0)
		      ∧ (z + x ≤ z ⇔ x ≤ ℕℝ 0)
		      ∧ (x ≤ z + x ⇔ ℕℝ 0 ≤ z)
		      ∧ (x ≤ x + z ⇔ ℕℝ 0 ≤ z)
		      ∧ x ≤ x
		      ∧ ℕℝ 0 ≤ ℕℝ 1
		      ∧ ¬ ℕℝ 1 ≤ ℕℝ 0⌝));
=DESCRIBE
=ENDDOC
=THDOC
req_thm("ℝ_≤_≤_0_thm",([], ⌜ ∀ x y⦁ x ≤ y ⇔ x + ~ y ≤ ℕℝ 0 ⌝));
req_thm("ℝ_≤_0_≤_thm",([], ⌜ ∀ x y⦁ x ≤ y ⇔ ℕℝ 0 ≤ y + ~ x ⌝));
req_thm("ℕℝ_less_thm",([], ⌜ ∀ m n⦁ ℕℝ m < ℕℝ n ⇔ m < n ⌝));
req_thm("ℝ_less_strong_dense_thm",
		([], ⌜ ∀ x y⦁ x < y ⇒ (∃ d⦁ ℕℝ 0 < d ∧ x + d < y)⌝));
req_thm("ℕℝ_≤_thm",([], ⌜ ∀ m n⦁ ℕℝ m ≤ ℕℝ n ⇔ m ≤ n ⌝));
req_thm("ℝ_sup_plus_thm",([], ⌜∀ A a x⦁
	¬ A = {} ∧ (∀ x⦁ x ∈ A ⇒ x ≤ a)
⇒	Sup A + x = Sup {t|∃ a⦁ a ∈ A ∧ t < a + x}⌝));
req_thm("ℝ_sup_plus_sup_thm",
		([], ⌜∀ A a B b⦁
	¬ A = {} ∧ (∀ x⦁ x ∈ A ⇒ x ≤ a)
∧	¬ B = {} ∧ (∀ y⦁ y ∈ B ⇒ y ≤ b)
⇒	Sup A + Sup B = Sup {t|∃ a b⦁ a ∈ A ∧ b ∈ B ∧ t < a + b}⌝));
=DESCRIBE
=ENDDOC
=THDOC
req_thm("ℝ_delta_induction_thm",
		([], ⌜ ∀ x p
		  ⦁ (∃ d
		      ⦁ ℕℝ 0 < d
		          ∧ (∃ e⦁ d < e ∧ (∀ t⦁ x < t ∧ t < x + e ⇒ p t))
		          ∧ (∀ s⦁ x < s ∧ p s ⇒ p (s + d)))
		      ⇒ (∀ y⦁ x < y ⇒ p y)⌝));
=DESCRIBE
=ENDDOC
=THDOC
req_thm("ℝ_ord_pres_strict_thm",
		([], ⌜ ∀ f : ℝ → ℝ⦁
	(∀ x y⦁ x < y ⇒ f x < f y) ⇒ (∀ x y⦁ f x < f y ⇒ x < y)⌝));
req_thm("ℝ_add_hom_0_thm",([], ⌜ ∀ f : ℝ → ℝ⦁
	(∀ x y⦁ f (x + y) = f x + f y) ⇒ (∀ x⦁ f (ℕℝ 0) = ℕℝ 0) ⌝));
req_thm("ℝ_add_hom_minus_thm",
		([], ⌜ ∀ f : ℝ → ℝ⦁
	(∀ x y⦁ f (x + y) = f x + f y) ⇒ (∀ x⦁ f (~ x) = ~ (f x))⌝));
req_thm("ℝ_add_hom_extension_thm",
		([], ⌜
∀ f : ℝ → ℝ⦁
	(∀ x y⦁ ℕℝ 0 ≤ x ∧ ℕℝ 0 ≤ y ⇒ f (x + y) = f x + f y)
∧	(∀ x⦁ ℕℝ 0 ≤ x ⇒ f (~ x) = ~ (f x))
⇒	(∀ x y⦁ f (x + y) = f x + f y)⌝));
=DESCRIBE
=ENDDOC
=THDOC
req_thm("ℝ_monoid_delta_dense_thm",
		([], ⌜ ∀ G d
		  ⦁ ℕℝ 0 ∈ G
		        ∧ (∀ g h⦁ g ∈ G ∧ h ∈ G ⇒ g + h ∈ G)
		        ∧ d ∈ G
		        ∧ ℕℝ 0 < d
		      ⇒ (∀ x⦁ ℕℝ 0 < x ⇒ (∃ g⦁ g ∈ G ∧ g ≤ x ∧ x < g + d))⌝));
req_thm("ℝ_monoid_dense_thm",
		([], ⌜∀G⦁
	ℕℝ 0 ∈ G
∧	(∀ g h⦁ g ∈ G ∧ h ∈ G ⇒ g + h ∈ G)
∧	(∀ x⦁ ℕℝ 0 < x ⇒ (∃ g⦁ g ∈ G ∧ ℕℝ 0 < g ∧ g < x))
⇒	(∀ x y⦁ ℕℝ 0 < x ∧ x < y ⇒ (∃ g⦁ g ∈ G ∧ x < g ∧ g < y))⌝));
req_thm("ℝ_subgroup_dense_thm",
		([], ⌜ ∀G⦁
	ℕℝ 0 ∈ G
∧	(∀ g h⦁ g ∈ G ∧ h ∈ G ⇒ g + h ∈ G)
∧	(∀ g⦁ g ∈ G ⇒ ~ g ∈ G)
∧	(∀ x⦁ ℕℝ 0 < x ⇒ (∃ g⦁ g ∈ G ∧ ℕℝ 0 < g ∧ g < x))
⇒	(∀ x y⦁ x < y ⇒ (∃ g⦁ g ∈ G ∧ x < g ∧ g < y))⌝));
req_thm("ℝ_semigroup_dense_thm",
		([], ⌜ ∀ G⦁
	(∀ g h⦁ g ∈ G ∧ h ∈ G ⇒ g + h ∈ G)
∧	(∀ x⦁ ℕℝ 0 < x ⇒ (∃ g⦁ g ∈ G ∧ ℕℝ 0 < g ∧ g < x))
⇒	(∀ x y⦁ ℕℝ 0 < x ∧ x < y ⇒ (∃ g⦁ g ∈ G ∧ x < g ∧ g < y))⌝));
req_thm("ℝ_add_hom_image_group_thm",
		([], ⌜ ∀ f : ℝ → ℝ; I⦁
	(∀ x y⦁ f (x + y) = f x + f y)
∧	I = {b|∃ a⦁ b = f a}
⇒	ℕℝ 0 ∈ I
∧	(∀ g h⦁ g ∈ I ∧ h ∈ I ⇒ g + h ∈ I)
∧	(∀ g⦁ g ∈ I ⇒ ~ g ∈ I)⌝));
req_thm("ℝ_add_hom_kernel_group_thm",
		([], ⌜ ∀ f K⦁
	(∀ x y⦁ f (x + y) = f x + f y)
∧	K = {a|f a = ℕℝ 0}
⇒	ℕℝ 0 ∈ K
∧	(∀ g h⦁ g ∈ K ∧ h ∈ K ⇒ g + h ∈ K)
∧	(∀ g⦁ g ∈ K ⇒ ~ g ∈ K)⌝));
=DESCRIBE
=ENDDOC
=THDOC
req_thm("ℝ_opah_thm",([], ⌜ ∀ f : ℝ → ℝ⦁ (∀ x y⦁ f (x + y) = f x + f y)
		        ∧ (∀ x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < f x)
		      ⇒ (∀ x y⦁ x < y ⇒ f x < f y)⌝));
req_thm("ℝ_opah_strict_thm",
		([], ⌜ ∀ f : ℝ → ℝ⦁ (∀ x y⦁ f (x + y) = f x + f y)
		        ∧ (∀ x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < f x)
		      ⇒ (∀ x y⦁ f x < f y ⇒ x < y)⌝));
req_thm("ℝ_opah_one_one_thm",
		([], ⌜ ∀ f : ℝ → ℝ⦁ (∀ x y⦁ f (x + y) = f x + f y)
		        ∧ (∀ x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < f x)
		      ⇒ OneOne f⌝));
req_thm("ℝ_opah_dense_image_thm",
		([], ⌜ ∀ f : ℝ → ℝ; e⦁ (∀ x y⦁ f (x + y) = f x + f y)
		        ∧ (∀ x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < f x)
		        ∧ ℕℝ 0 < e
		      ⇒ (∃ d⦁ ℕℝ 0 < d ∧ f d < e)⌝));
req_thm("ℝ_opah_onto_thm",([], ⌜ ∀ f  : ℝ → ℝ⦁ (∀ x y⦁ f (x + y) = f x + f y)
		        ∧ (∀ x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < f x)
		      ⇒ Onto f⌝));
req_thm("ℝ_opah_inverse_add_hom_thm",
		([], ⌜ ∀ f g : ℝ → ℝ⦁ (∀ x y⦁ f (x + y) = f x + f y)
		        ∧ (∀ x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < f x)
		        ∧ (∀ x⦁ g (f x) = x)
		        ∧ (∀ x⦁ f (g x) = x)
		      ⇒ (∀ x y⦁ g (x + y) = g x + g y)
		        ∧ (∀ x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < g x)⌝));
req_thm("ℝ_opah_inverse_thm",
		([], ⌜ ∀ f : ℝ → ℝ⦁ (∀ x y⦁ f (x + y) = f x + f y)
		        ∧ (∀ x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < f x)
		      ⇒ (∃ g: ℝ → ℝ⦁
			   (∀ x⦁ g (f x) = x)
		          ∧ (∀ x⦁ f (g x) = x)
		          ∧ (∀ x y⦁ g (x + y) = g x + g y)
		          ∧ (∀ x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < g x))⌝));
=DESCRIBE
=ENDDOC
=THDOC
req_thm("ℝ_copah_id_thm",([], ⌜ ∃ ι
		  ⦁ (∀ x⦁ ι x = x)
		      ∧ (∀ x y⦁ ι (x + y) = ι x + ι y)
		      ∧ (∀ x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < ι x)
		      ∧ (∀ f
		      ⦁ (∀ x y⦁ f (x + y) = f x + f y)
		          ⇒ (∀ x⦁ ι (f x) = f (ι x)))⌝));
req_thm("ℝ_copah_double_thm",
		([], ⌜ ∃ α
		  ⦁ (∀ x⦁ α x = x + x)
		      ∧ (∀ x y⦁ α (x + y) = α x + α y)
		      ∧ (∀ x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < α x)
		      ∧ (∀ x⦁ ℕℝ 0 < x ⇒ x < α x)
		      ∧ (∀ f
		      ⦁ (∀ x y⦁ f (x + y) = f x + f y)
		          ⇒ (∀ x⦁ α (f x) = f (α x)))⌝));
req_thm("ℝ_copah_halve_thm",
		([], ⌜ ∃ β
		  ⦁ (∀ x⦁ β x + β x = x)
		      ∧ (∀ x y⦁ β (x + y) = β x + β y)
		      ∧ (∀ x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < β x)
		      ∧ (∀ x⦁ ℕℝ 0 < x ⇒ β x < x)
		      ∧ (∀ f
		      ⦁ (∀ x y⦁ f (x + y) = f x + f y)
		          ⇒ (∀ x⦁ β (f x) = f (β x)))⌝));
=DESCRIBE
=ENDDOC
=THDOC
req_thm("ℝ_copah_comp_thm",
		([], ⌜ ∀ α β
		  ⦁ (∀ x y⦁ α (x + y) = α x + α y)
		        ∧ (∀ x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < α x)
		        ∧ (∀ f
		        ⦁ (∀ x y⦁ f (x + y) = f x + f y)
		            ⇒ (∀ x⦁ α (f x) = f (α x)))
		        ∧ (∀ x y⦁ β (x + y) = β x + β y)
		        ∧ (∀ x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < β x)
		        ∧ (∀ f
		        ⦁ (∀ x y⦁ f (x + y) = f x + f y)
		            ⇒ (∀ x⦁ β (f x) = f (β x)))
		      ⇒ (∃ γ
		      ⦁ (∀ x⦁ γ x = α (β x))
		          ∧ (∀ x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < γ x)
		          ∧ (∀ x y⦁ γ (x + y) = γ x + γ y)
		          ∧ (∀ f
		          ⦁ (∀ x y⦁ f (x + y) = f x + f y)
		              ⇒ (∀ x⦁ γ (f x) = f (γ x))))⌝));
=DESCRIBE
=ENDDOC
=THDOC
req_thm("ℝ_copah_sum_thm",([], ⌜ ∀ α β
		  ⦁ (∀ x y⦁ α (x + y) = α x + α y)
		        ∧ (∀ x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < α x)
		        ∧ (∀ f
		        ⦁ (∀ x y⦁ f (x + y) = f x + f y)
		            ⇒ (∀ x⦁ α (f x) = f (α x)))
		        ∧ (∀ x y⦁ β (x + y) = β x + β y)
		        ∧ (∀ x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < β x)
		        ∧ (∀ f
		        ⦁ (∀ x y⦁ f (x + y) = f x + f y)
		            ⇒ (∀ x⦁ β (f x) = f (β x)))
		      ⇒ (∃ γ
		      ⦁ (∀ x⦁ γ x = α x + β x)
		          ∧ (∀ x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < γ x)
		          ∧ (∀ x y⦁ γ (x + y) = γ x + γ y)
		          ∧ (∀ f
		          ⦁ (∀ x y⦁ f (x + y) = f x + f y)
		              ⇒ (∀ x⦁ γ (f x) = f (γ x))))⌝));
=DESCRIBE
=ENDDOC
=THDOC
req_thm("ℝ_halve_closed_dense_thm",
		([], ⌜ ∀ A e
		  ⦁ ℕℝ 0 < e ∧ e ∈ A ∧ (∀ y⦁ y ∈ A ⇒ (∃ z⦁ z ∈ A ∧ z + z = y))
		      ⇒ (∀ d⦁ ℕℝ 0 < d ⇒ (∃ a⦁ a ∈ A ∧ ℕℝ 0 < a ∧ a < d))⌝));
req_thm("ℝ_copah_dense_thm",
		([], ⌜ ∀ d x y
		  ⦁ ℕℝ 0 < d ∧ ℕℝ 0 < x ∧ x < y
		      ⇒ (∃ γ
		      ⦁ (∀ x y⦁ γ (x + y) = γ x + γ y)
		          ∧ (∀ x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < γ x)
		          ∧ (∀ f
		          ⦁ (∀ x y⦁ f (x + y) = f x + f y)
		              ⇒ (∀ x⦁ γ (f x) = f (γ x)))
		          ∧ x < γ d
		          ∧ γ d < y)⌝));
=DESCRIBE
=ENDDOC
=THDOC
req_thm("ℝ_opah_extension_thm1",
		([], ⌜ ∀ f
		  ⦁ (∀ x y⦁ ℕℝ 0 < x ∧ ℕℝ 0 < y ⇒ f (x + y) = f x + f y)
		        ∧ (∀ x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < f x)
		      ⇒ (∃ φ
		      ⦁ φ (ℕℝ 0) = ℕℝ 0
		          ∧ (∀ x⦁ ℕℝ 0 < x ⇒ φ x = f x)
		          ∧ (∀ x y
		          ⦁ ℕℝ 0 ≤ x ∧ ℕℝ 0 ≤ y ⇒ φ (x + y) = φ x + φ y))⌝));
req_thm("ℝ_opah_extension_thm2",
		([], ⌜ ∀ f
		  ⦁ f (ℕℝ 0) = ℕℝ 0
		        ∧ (∀ x y⦁ ℕℝ 0 ≤ x ∧ ℕℝ 0 ≤ y ⇒ f (x + y) = f x + f y)
		      ⇒ (∃ ψ
		      ⦁ (∀ x⦁ ℕℝ 0 ≤ x ⇒ ψ x = f x)
		          ∧ (∀ x y⦁ ψ (x + y) = ψ x + ψ y))⌝));
req_thm("ℝ_opah_extension_thm",
		([], ⌜ ∀ f
		  ⦁ (∀ x y⦁ ℕℝ 0 < x ∧ ℕℝ 0 < y ⇒ f (x + y) = f x + f y)
		        ∧ (∀ x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < f x)
		      ⇒ (∃ φ
		      ⦁ (∀ x⦁ ℕℝ 0 < x ⇒ φ x = f x)
		          ∧ (∀ x y⦁ φ (x + y) = φ x + φ y)
		          ∧ (∀ x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < φ x))⌝));
=DESCRIBE
=ENDDOC
=THDOC
req_thm("ℝ_opah_order_thm",
		([], ⌜ ∀ f g d
		  ⦁ (∀ x y⦁ f (x + y) = f x + f y)
		        ∧ (∀ x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < f x)
		        ∧ (∀ x y⦁ g (x + y) = g x + g y)
		        ∧ (∀ x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < g x)
		        ∧ ℕℝ 0 < d
		        ∧ f d < g d
		      ⇒ (∀ x⦁ ℕℝ 0 < x ⇒ f x < g x)⌝));
req_thm("ℝ_opah_eq_thm",([], ⌜ ∀ f g d
		  ⦁ (∀ x y⦁ f (x + y) = f x + f y)
		        ∧ (∀ x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < f x)
		        ∧ (∀ x y⦁ g (x + y) = g x + g y)
		        ∧ (∀ x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < g x)
		        ∧ ℕℝ 0 < d
		        ∧ f d = g d
		      ⇒ f = g⌝));
req_thm("ℝ_opah_complete_thm",
		([], ⌜ ∀ d e
		  ⦁ ℕℝ 0 < d ∧ ℕℝ 0 < e
		      ⇒ (∃ f
		      ⦁ (∀ x y⦁ f (x + y) = f x + f y)
		          ∧ (∀ x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < f x)
		          ∧ f d = e)⌝));
=DESCRIBE
=ENDDOC
=THDOC
req_consistency_thm⌜ $*⋎R ⌝;
=DESCRIBE
=ENDDOC
=THDOC
req_thm("ℝ_times_assoc_thm",
		([], ⌜ ∀ x y z: ℝ⦁ (x * y) * z = x * y * z⌝));
req_thm("ℝ_times_comm_thm",
		([], ⌜ ∀ x y: ℝ⦁ x * y = y * x⌝));
req_thm("ℝ_times_unit_thm",
		([], ⌜ ∀ x⦁ x * ℕℝ 1 = x⌝));
req_thm("ℝ_0_less_0_less_times_thm",
		([], ⌜ ∀ x y⦁ ℕℝ 0 < x ∧ ℕℝ 0 < y ⇒ ℕℝ 0 < x * y⌝));
req_thm("ℝ_times_assoc_thm1",
		([], ⌜ ∀ x y z: ℝ⦁ x * y * z = (x * y) * z⌝));
req_thm("ℝ_times_plus_distrib_thm",
		([], ⌜ ∀ x y z: ℝ⦁
	x * (y + z) = x * y + x * z ∧ (x + y) * z = x * z + y * z⌝));
req_thm("ℝ_times_order_thm",
		([], ⌜ ∀ x y z: ℝ⦁ y * x = x * y
		      ∧ (x * y) * z = x * y * z
		      ∧ y * x * z = x * y * z⌝));
req_thm("ℝ_times_0_thm",([], ⌜ ∀ x⦁ x * ℕℝ 0 = ℕℝ 0 ∧ ℕℝ 0 * x = ℕℝ 0 ⌝));
req_thm("ℝ_times_1_thm",([], ⌜ ∀ x⦁ x * ℕℝ 1 = x ∧ ℕℝ 1 * x = x ⌝));
req_thm("ℕℝ_times_homomorphism_thm",
		([], ⌜ ∀ m n⦁ ℕℝ (m * n) = ℕℝ m * ℕℝ n⌝));
=DESCRIBE
=ENDDOC
=THDOC
req_consistency_thm⌜ $/⋎R ⌝;
=DESCRIBE
=ENDDOC
=THDOC
req_thm("ℝ_over_times_recip_thm", ([],
	⌜ ∀ z⦁ ¬ z = ℕℝ 0 ⇒ (∀ x⦁ x / z = x * z ⋏-⋏1)⌝));
req_thm("ℝ_times_recip_thm", ([],
	⌜ ∀ z⦁ ¬ z = ℕℝ 0 ⇒ z * z ⋏-⋏1 = ℕℝ 1⌝));
req_thm("ℝ_eq_recip_thm",([],
	⌜ ∀ z⦁ ¬ z = ℕℝ 0 ⇒ (∀ y⦁ y = z ⇔ y * z ⋏-⋏1 = ℕℝ 1) ⌝));
req_thm("ℝ_times_cancel_thm", ([],
	⌜ ∀ x y z⦁ ¬ z = ℕℝ 0 ⇒ (x * z = y * z ⇔ x = y)⌝));
req_thm("ℝ_times_eq_0_thm", ([],
	⌜ ∀ x y⦁ x * y = ℕℝ 0 ⇔ x = ℕℝ 0 ∨ y = ℕℝ 0⌝));
req_thm("ℝ_times_minus_thm", ([],
	⌜ ∀ x y : ℝ⦁
		~ x * y = ~ (x * y)
	∧	x * ~ y = ~ (x * y)
	∧	~ x * ~ y = x * y⌝));
=DESCRIBE
=ENDDOC
=THDOC
req_thm("ℝ_times_clauses",([], ⌜ ∀ x
		  ⦁ ℕℝ 0 * x = ℕℝ 0
		      ∧ x * ℕℝ 0 = ℕℝ 0
		      ∧ x * ℕℝ 1 = x
		      ∧ ℕℝ 1 * x = x⌝));
req_thm("ℝ_times_mono_⇔_thm",
		([], ⌜ ∀ x⦁ ℕℝ 0 < x ⇒ (∀ y z⦁ y < z ⇔ x * y < x * z)⌝));
req_thm("ℝ_times_mono_thm",
		([], ⌜ ∀ x y z⦁ ℕℝ 0 < x ∧ y < z ⇒ x * y < x * z⌝));
req_thm("ℝ_0_≤_0_≤_times_thm",
		([], ⌜ ∀ x y⦁ ℕℝ 0 ≤ x ∧ ℕℝ 0 ≤ y ⇒ ℕℝ 0 ≤ x * y⌝));
=DESCRIBE
=ENDDOC
=THDOC
req_thm("ℝ_¬_recip_0_thm",([], ⌜ ∀ z⦁ ¬ z = ℕℝ 0 ⇒ ¬ z ⋏-⋏1 = ℕℝ 0 ⌝));
req_thm("ℝ_recip_clauses",([], ⌜ (ℕℝ 1 ⋏-⋏1 = ℕℝ 1
		      ∧ (∀ w
		      ⦁ ¬ w = ℕℝ 0
		          ⇒ w ⋏-⋏1 ⋏-⋏1 = w
		            ∧ w * w ⋏-⋏1 = ℕℝ 1
		            ∧ w ⋏-⋏1 * w = ℕℝ 1))
		    ∧ (∀ w z
		    ⦁ ¬ w = ℕℝ 0 ∧ ¬ z = ℕℝ 0 ⇒ (w * z) ⋏-⋏1 = w ⋏-⋏1 * z ⋏-⋏1)⌝));
req_thm("ℝ_cross_mult_eq_thm",
		([], ⌜ ∀ w z
		  ⦁ ¬ w = ℕℝ 0 ∧ ¬ z = ℕℝ 0
		      ⇒ (∀ x y⦁ x / w = y / z ⇔ x * z = w * y)⌝));
req_thm("ℝ_less_¬_eq_0_thm",
		([], ⌜ ∀ z⦁ ℕℝ 0 < z ⇒ ¬ z = ℕℝ 0⌝));
req_thm("ℝ_0_less_0_less_recip_thm",
		([], ⌜ ∀ z⦁ ℕℝ 0 < z ⇒ ℕℝ 0 < z ⋏-⋏1⌝));
req_thm("ℝ_cross_mult_less_thm",
		([], ⌜
∀w z⦁	ℕℝ 0 < w ∧ ℕℝ 0 < z
⇒	(∀ x y⦁ x / w < y / z ⇔ x * z < w * y)⌝));
req_thm("ℝ_over_cancel_eq_thm",
		([], ⌜
∀w z⦁	¬ w = ℕℝ 0 ∧ ¬ z = ℕℝ 0
⇒	(∀ x⦁ (x * z) / (w * z) = x / w)⌝));
req_thm("ℝ_over_plus_over_thm",
		([], ⌜ ∀ x y u v
		  ⦁ ¬ u = ℕℝ 0 ∧ ¬ v = ℕℝ 0
		      ⇒ x / u + y / v = (x * v + y * u) / (u * v)⌝));
req_thm("ℝ_0_over_thm",([], ⌜ ∀ z⦁ ¬ z = ℕℝ 0 ⇒ ℕℝ 0 / z = ℕℝ 0 ⌝));
req_thm("ℝ_over_1_thm",([], ⌜ ∀ x⦁ x / ℕℝ 1 = x ⌝));
=DESCRIBE
=ENDDOC
=THDOC
req_thm("ℕℝ_plus_homomorphism_thm1",
		([], ⌜ ∀ m n⦁ ℕℝ m + ℕℝ n = ℕℝ (m + n)⌝));
req_thm("ℕℝ_times_homomorphism_thm1",
		([], ⌜ ∀ m n⦁ ℕℝ m * ℕℝ n = ℕℝ (m * n)⌝));
=DESCRIBE
=ENDDOC
=THDOC
req_thm("ℝ_frac_cross_mult_eq_thm",
		([], ⌜ ∀ m n i j
		  ⦁ i / (m + 1) = j / (n + 1) ⇔ i * (n + 1) = j * (m + 1)⌝));
req_thm("ℝ_frac_cancel_eq_thm",
		([], ⌜ ∀ i m n⦁ (i * (n + 1)) / ((m + 1) * (n + 1)) = i / (m + 1)⌝));
req_thm("ℝ_frac_0_thm",([], ⌜ ∀ m⦁ 0 / (m + 1) = ℕℝ 0 ⌝));
req_thm("ℝ_frac_ℕ_thm",([], ⌜ ∀ i⦁ i / 1 = ℕℝ i ⌝));
req_thm("ℝ_frac_plus_frac_thm",
		([], ⌜ ∀ i j k m n
		  ⦁ i / (m + 1) + j / (n + 1)
		      = (i * (n + 1) + j * (m + 1)) / ((m + 1) * (n + 1))⌝));
req_thm("ℝ_frac_minus_frac_thm",
		([], ⌜ ∀ i j k m n
		  ⦁ j * (m + 1) ≤ i * (n + 1)
		      ⇒ i / (m + 1) + ~ (j / (n + 1))
		        = (i * (n + 1) - j * (m + 1)) / ((m + 1) * (n + 1))⌝));
req_thm("ℝ_frac_minus_frac_thm1",
		([], ⌜ ∀ i j m n
		  ⦁ i * (n + 1) ≤ j * (m + 1)
		      ⇒ i / (m + 1) + ~ (j / (n + 1))
		        = ~ ((j * (m + 1) - i * (n + 1)) / ((m + 1) * (n + 1)))⌝));
=DESCRIBE
=ENDDOC
=THDOC
req_thm("ℝ_over_times_over_thm",
		([], ⌜ ∀ x y u v⦁
	¬ u = ℕℝ 0 ∧ ¬ v = ℕℝ 0
⇒	x / u * y / v = (x * y) / (u * v)⌝));
req_thm("ℝ_frac_times_frac_thm",
		([], ⌜ ∀ i j m n
		  ⦁ i / (m + 1) * j / (n + 1) = (i * j) / ((m + 1) * (n + 1))⌝));
req_thm("ℝ_over_recip_thm",
		([], ⌜ ∀ u v⦁ ¬ u = ℕℝ 0 ∧ ¬ v = ℕℝ 0 ⇒ (u / v) ⋏-⋏1 = v / u⌝));
req_thm("ℝ_frac_recip_thm",
		([], ⌜ ∀ m n⦁ ((m + 1) / (n + 1)) ⋏-⋏1 = (n + 1) / (m + 1)⌝));
req_thm("ℝ_minus_recip_thm",
		([], ⌜ ∀ z⦁ ¬ z = ℕℝ 0 ⇒ ~ z ⋏-⋏1 = ~ (z ⋏-⋏1)⌝));
req_thm("ℝ_over_eq_0_thm",([], ⌜
	∀ u v⦁ ¬ u = ℕℝ 0 ∧ ¬ v = ℕℝ 0 ⇒ ¬ u / v = ℕℝ 0 ⌝));
req_thm("ℝ_over_over_over_thm",
		([], ⌜ ∀ x y u v
		  ⦁ ¬ u = ℕℝ 0 ∧ ¬ v = ℕℝ 0 ∧ ¬ y = ℕℝ 0
		      ⇒ (x / u) / (y / v) = (x * v) / (u * y)⌝));
req_thm("ℝ_frac_less_frac_thm",
		([], ⌜ ∀ i j m n
		  ⦁ i / (m + 1) < j / (n + 1) ⇔ i * (n + 1) < j * (m + 1)⌝));
req_thm("ℝ_minus_frac_less_frac_thm",
		([], ⌜ ∀ i j m n⦁ ~ (i / (m + 1)) < j / (n + 1) ⇔ 0 < i + j⌝));
req_thm("ℝ_frac_less_minus_frac_thm",
		([], ⌜ ∀ i j m n⦁ ¬ i / (m + 1) < ~ (j / (n + 1))⌝));
req_thm("ℝ_0_≤_frac_thm",
		([], ⌜∀i m⦁ ℕℝ 0 ≤ i/(m+1)⌝));
req_thm("ℝ_abs_frac_thm",
		([], ⌜∀i m⦁ Abs(i/(m+1)) = i/(m+1)⌝));
req_thm("ℝ_abs_minus_thm",
		([], ⌜∀ x : ℝ ⦁ Abs (~x) = Abs x⌝));
=DESCRIBE
=ENDDOC
=THDOC
req_consistency_thm⌜ ℤℝ ⌝;
req_thm("ℤℝ_plus_homomorphism_thm",
		([], ⌜ ∀ i j⦁ ℤℝ (i + j) = ℤℝ i + ℤℝ j⌝));
req_thm("ℤℝ_minus_thm",
		([], ⌜ ∀i⦁ℤℝ(~i) = ~(ℤℝ i) ⌝));
req_thm("ℤℝ_ℕℤ_thm",
		([], ⌜
	∀m⦁	ℤℝ(ℕℤ m) = ℕℝ m
	∧	ℤℝ(~(ℕℤ m)) = ~(ℕℝ m) ⌝));
req_thm("ℤℝ_times_homomorphism_thm",
		([], ⌜ ∀ i j⦁ ℤℝ (i * j) = ℤℝ i * ℤℝ j⌝));
req_consistency_thm⌜ $^⋎Z ⌝;
=DESCRIBE
=ENDDOC

=THDOC
req_consistency_thm⌜ Max⋎R ⌝;
req_thm("ℝ_max_cons_thm", ([],
	⌜ ∀x L⦁
	Max⋎R (Cons x L) =
	if	L = []
	then	x
	else if	x < Max⋎R L
	then	Max⋎R L
	else	x⌝));
req_thm("ℝ_max_conv_thm", ([],
	⌜ ∀x y L⦁
	Max⋎R (Cons x (Cons y L)) =
	if x < y then Max⋎R (Cons y L) else Max⋎R(Cons x L)⌝));
=DESCRIBE
=ENDDOC
=THDOC
req_consistency_thm⌜ Min⋎R ⌝;
req_thm("ℝ_min_cons_thm", ([],
	⌜ ∀x L⦁
	Min⋎R (Cons x L) =
	if	L = []
	then	x
	else if	Min⋎R L < x
	then	Min⋎R L
	else	x⌝));
req_thm("ℝ_min_conv_thm", ([],
	⌜ ∀x y L⦁
	Min⋎R (Cons x (Cons y L)) =
	if x < y then Min⋎R (Cons x L) else Min⋎R(Cons y L)⌝));
=DESCRIBE
=ENDDOC
=TEX
\section{SIGNATURE}
=SML
signature ⦏ℝ⦎ = sig
=TEX

\subsection{Syntax Functions}
=DOC
val ⦏dest_ℝ_less⦎ : TERM -> TERM * TERM;	(* <⋎R *)
val ⦏dest_ℝ_≤⦎ : TERM -> TERM * TERM		(* ≤⋎R *);
val ⦏dest_ℝ_greater⦎ : TERM -> TERM * TERM	(* >⋎R *);
val ⦏dest_ℝ_≥⦎ : TERM -> TERM * TERM		(* ≥⋎R *);
val ⦏dest_ℝ_plus⦎ : TERM -> TERM * TERM	(* +⋎R *);
val ⦏dest_ℝ_subtract⦎ : TERM -> TERM * TERM	(* -⋎R *);
val ⦏dest_ℝ_times⦎ : TERM -> TERM * TERM	(* *⋎R *);
val ⦏dest_ℝ_over⦎ : TERM -> TERM * TERM	(* /⋎R *);
val ⦏dest_ℝ_frac⦎ : TERM -> TERM * TERM	(* /⋎N *);
val ⦏dest_ℝ_minus⦎ : TERM -> TERM		(* ~⋎R *);
val ⦏dest_ℝ_abs⦎ : TERM -> TERM			(* Abs⋎R *);
val ⦏dest_ℝ_recip⦎ : TERM -> TERM			(* ⋏-⋏1 *);
val ⦏dest_ℝ_ℕ_exp⦎ : TERM -> TERM * TERM;	(* ^⋎N *)
val ⦏dest_ℝ_ℤ_exp⦎ : TERM -> TERM * TERM;	(* ^⋎Z *)
val ⦏dest_ℕℝ⦎ : TERM -> TERM;		(* ℕℝ *)
val ⦏dest_ℝ_max⦎ : TERM -> TERM			(* Max⋎R *);
val ⦏dest_ℝ_min⦎ : TERM -> TERM			(* Min⋎R *);
=DESCRIBE
These are the derived destructor functions for the basic
arithmetic operators on the real numbers.
=FAILURE
116101	?0 is not of the form ⌜x <⋎R y⌝
116102	?0 is not of the form ⌜x ≤⋎R y⌝
116103	?0 is not of the form ⌜x >⋎R y⌝
116104	?0 is not of the form ⌜x ≤⋎R y⌝
116105	?0 is not of the form ⌜x +⋎R y⌝
116106	?0 is not of the form ⌜x -⋎R y⌝
116107	?0 is not of the form ⌜x *⋎R y⌝
116108	?0 is not of the form ⌜x /⋎R y⌝
116109	?0 is not of the form ⌜x /⋎N y⌝
116111	?0 is not of the form ⌜~⋎R y⌝
116112	?0 is not of the form ⌜Abs⋎R x⌝
116113	?0 is not of the form ⌜x ⋏-⋏1⌝
116114	?0 is not of the form ⌜x ^⋎N m⌝
116115	?0 is not of the form ⌜ℕℝ m⌝
116116	?0 is not of the form ⌜x ^⋎Z i⌝
116117	?0 is not of the form ⌜Max⋎R L⌝
116118	?0 is not of the form ⌜Min⋎R L⌝
=ENDDOC
=DOC
val ⦏is_ℝ_less⦎ : TERM -> bool		(* <⋎R *);
val ⦏is_ℝ_≤⦎ : TERM -> bool		(* ≤⋎R *);
val ⦏is_ℝ_greater⦎ : TERM -> bool	(* >⋎R *);
val ⦏is_ℝ_≥⦎ : TERM -> bool		(* ≥⋎R *);
val ⦏is_ℝ_plus⦎ : TERM -> bool		(* +⋎R *);
val ⦏is_ℝ_subtract⦎ : TERM -> bool	(* -⋎R *);
val ⦏is_ℝ_times⦎ : TERM -> bool		(* *⋎R *);
val ⦏is_ℝ_over⦎ : TERM -> bool		(* /⋎R *);
val ⦏is_ℝ_frac⦎ : TERM -> bool	(* /⋎N *);
val ⦏is_ℝ_minus⦎ : TERM -> bool	(* ~⋎R *);
val ⦏is_ℝ_abs⦎ : TERM -> bool		(* Abs⋎R *);
val ⦏is_ℝ_recip⦎ : TERM -> bool	(* ⋏-⋏1 *);
val ⦏is_ℝ_ℕ_exp⦎ : TERM -> bool	(* ^⋎N *);
val ⦏is_ℝ_ℤ_exp⦎ : TERM -> bool	(* ^⋎Z *);
val ⦏is_ℕℝ⦎ : TERM -> bool		(* ℕℝ *);
val ⦏is_ℝ_max⦎ : TERM -> bool		(* Max⋎R *);
val ⦏is_ℝ_min⦎ : TERM -> bool		(* Min⋎R *);
=DESCRIBE
These are the derived discriminator functions for the basic
arithmetic operators on the real numbers. The ML comments
above give the name of the corresponding operators.
These names all have aliases without the subscript.
=ENDDOC

=DOC
val ⦏mk_ℝ_less⦎ : TERM * TERM -> TERM;	(* <⋎R *)
val ⦏mk_ℝ_≤⦎ : TERM * TERM -> TERM		(* ≤⋎R *);
val ⦏mk_ℝ_greater⦎ : TERM * TERM -> TERM	(* >⋎R *);
val ⦏mk_ℝ_≥⦎ : TERM * TERM -> TERM	(* ≥⋎R *);
val ⦏mk_ℝ_plus⦎ : TERM * TERM -> TERM	(* +⋎R *);
val ⦏mk_ℝ_subtract⦎ : TERM * TERM -> TERM	(* -⋎R *);
val ⦏mk_ℝ_times⦎ : TERM * TERM -> TERM	(* *⋎R *);
val ⦏mk_ℝ_over⦎ : TERM * TERM -> TERM	(* /⋎R *);
val ⦏mk_ℝ_frac⦎ : TERM * TERM -> TERM	(* /⋎N *);
val ⦏mk_ℝ_minus⦎ : TERM -> TERM			(* ~⋎R *);
val ⦏mk_ℝ_abs⦎ : TERM -> TERM			(* Abs⋎R *);
val ⦏mk_ℝ_recip⦎ : TERM -> TERM			(* ⋏-⋏1 *);
val ⦏mk_ℝ_ℕ_exp⦎ : TERM * TERM -> TERM;	(* ^⋎N *)
val ⦏mk_ℝ_ℤ_exp⦎ : TERM * TERM -> TERM;	(* ^⋎Z *)
val ⦏mk_ℕℝ⦎ : TERM -> TERM;			(* ℕℝ*)
val ⦏mk_ℝ_max⦎ : TERM -> TERM			(* Max⋎R *);
val ⦏mk_ℝ_min⦎ : TERM -> TERM			(* Min⋎R *);
=DESCRIBE
These are the derived constructor functions for the basic
arithmetic operators on the real numbers. The ML comments
above give the name of the corresponding operators.
These names all have aliases without the subscript.

Both operands of
=INLINEFT
mk_ℝ_frac
=TEX
and the second operand of
=INLINEFT
mk_ℝ_ℕ_exp
=TEX
\ must be of type ℕ.
All the other operands of type ℝ.
All other operands must have type ℝ.

=FAILURE
116201	?0 does not have type ⓣℝ⌝
116202	?0 does not have type ⓣℕ⌝
116203	?0 does not have type ⓣℝ LIST⌝
=ENDDOC
\subsection{Definitions}
=DOC
val ⦏ℝ_plus_def⦎ : THM;		val ⦏ℝ_subtract_def⦎ : THM;
val ⦏ℝ_≤_def⦎ : THM;		val ⦏ℝ_less_def⦎ : THM;
val ⦏ℝ_greater_def⦎ : THM;	val ⦏ℝ_≥_def⦎ : THM;
val ⦏ℝ_minus_def⦎ : THM;	val ⦏ℝ_times_def⦎ : THM;
val ⦏ℝ_over_def⦎ : THM;		val ⦏ℝ_frac_def⦎ : THM;
val ⦏ℕℝ_def⦎ : THM;		val ⦏ℝ_ℕ_exp_def⦎ : THM;
val ⦏ℝ_abs_def⦎ : THM;		val ⦏ℤℝ_def⦎ : THM;
val ⦏ℝ_ℤ_exp_def⦎ : THM;		val ⦏float_def⦎ : THM;
val ⦏ℝ_max_def⦎ : THM;		val ⦏ℝ_min_def⦎ : THM;
=DESCRIBE
These are the ML bindings for the definitions in the theory ℝ.
=ENDDOC
\subsection{Theorems}
=DOC
val ⦏ℝ_unbounded_below_thm⦎ : THM;
val ⦏ℝ_unbounded_above_thm⦎ : THM;
val ⦏ℝ_less_irrefl_thm⦎ : THM;	val ⦏ℝ_less_antisym_thm⦎ : THM;
val ⦏ℝ_less_trans_thm⦎ : THM;	val ⦏ℝ_less_cases_thm⦎ : THM;
val ⦏ℝ_≤_cases_thm⦎ : THM;	val ⦏ℝ_≤_less_cases_thm⦎ : THM;
val ⦏ℝ_eq_≤_thm⦎ : THM;		val ⦏ℝ_less_≤_trans_thm⦎ : THM;
val ⦏ℝ_≤_less_trans_thm⦎ : THM;val ⦏ℝ_≤_refl_thm⦎ : THM;
val ⦏ℝ_≤_antisym_thm⦎ : THM;	val ⦏ℝ_≤_trans_thm⦎ : THM;	
val ⦏ℝ_≤_¬_less_thm⦎ : THM;	val ⦏ℝ_¬_≤_less_thm⦎ : THM;
val ⦏ℝ_less_¬_eq_thm⦎ : THM;	val ⦏ℝ_¬_less_≤_thm⦎ : THM;
val ⦏ℝ_less_dense_thm⦎ : THM;	val ⦏ℝ_complete_thm⦎ : THM;
=DESCRIBE
These are the ML bindings for theorems in the theory ℝ concerned with basic properties
of the ordering relations. Note that $>$ and ≥ are defined in terms of $<$ and ≤
and the latter are the preferred form in all theorems in this theory.
=ENDDOC
=DOC
val ⦏ℝ_sup_thm⦎ : THM;		val ⦏ℝ_less_sup_thm⦎ : THM;
val ⦏ℝ_less_sup_bc_thm⦎ : THM;	val ⦏ℝ_≤_sup_thm⦎ : THM;
val ⦏ℝ_≤_sup_bc_thm⦎ : THM;	val ⦏ℝ_∈_≤_sup_bc_thm⦎ : THM;
val ⦏ℝ_⊆_sup_thm⦎ : THM;	val ⦏ℝ_sup_≤_bc_thm⦎ : THM;
val ⦏ℝ_sup_less_bc_thm⦎ : THM;	val ⦏ℝ_sup_eq_bc_thm⦎ : THM;
val ⦏ℝ_eq_sup_bc_thm⦎ : THM;	val ⦏ℝ_less_sup_∈_thm⦎ : THM;
=DESCRIBE
These are the ML bindings for theorems in the theory ℝ to assist with
reasoning about the values of the supremum function.
=ENDDOC
=DOC
val ⦏ℝ_plus_assoc_thm⦎ : THM;		val ⦏ℝ_plus_comm_thm⦎ : THM;
val ⦏ℝ_plus_unit_thm⦎ : THM;	val ⦏ℝ_plus_mono_thm⦎ : THM;
val ⦏ℝ_plus_assoc_thm1⦎ : THM;	val ⦏ℝ_plus_mono_thm1⦎ : THM;
val ⦏ℝ_plus_mono_thm2⦎ : THM;		val ⦏ℝ_plus_0_thm⦎ : THM;
val ⦏ℝ_0_1_thm⦎ : THM;			val ⦏ℝ_plus_order_thm⦎ : THM;
val ⦏ℝ_plus_minus_thm⦎ : THM;	val ⦏ℝ_eq_thm⦎ : THM;
val ⦏ℝ_plus_clauses⦎ : THM;		val ⦏ℝ_minus_clauses⦎ : THM;
val ⦏ℝ_less_clauses⦎ : THM;		val ⦏ℝ_≤_clauses⦎ : THM;
val ⦏ℕℝ_plus_homomorphism_thm⦎ : THM;
val ⦏ℕℝ_plus_homomorphism_thm1⦎ : THM;
val ⦏ℝ_minus_eq_thm⦎ : THM;		val ⦏ℕℝ_0_less_thm⦎ : THM;
val ⦏ℕℝ_one_one_thm⦎ : THM;		val ⦏ℝ_less_less_0_thm⦎ : THM;
val ⦏ℝ_less_0_less_thm⦎ : THM;		val ⦏ℝ_≤_≤_0_thm⦎ : THM;
val ⦏ℝ_≤_0_≤_thm⦎ : THM;		val ⦏ℕℝ_less_thm⦎ : THM;
val ⦏ℝ_less_strong_dense_thm⦎ : THM;val ⦏ℕℝ_≤_thm⦎ : THM;
val ⦏ℝ_sup_plus_thm⦎ : THM;		val ⦏ℝ_sup_plus_sup_thm⦎ : THM;
val ⦏ℝ_less_¬_eq_0_thm⦎ : THM;
=DESCRIBE
These are the ML bindings for basic theorems about the additive structure
of the real numbers and its relationship with the ordering relations
and the supremum function.
=ENDDOC
=DOC
val ⦏ℝ_delta_induction_thm⦎ : THM;		
=DESCRIBE
This is the theorem that supports
=INLINEFT
ℝ_delta_induction_tac
=TEX
\ (q.v.).
=ENDDOC
=DOC
val ⦏ℝ_ord_pres_strict_thm⦎ : THM;
val ⦏ℝ_add_hom_0_thm⦎ : THM;
val ⦏ℝ_add_hom_minus_thm⦎ : THM;
val ⦏ℝ_add_hom_extension_thm⦎ : THM;
=DESCRIBE
These are ML bindings for theorems
about order-preserving functions and additive endomorphisms from ℝ to ℝ.
=ENDDOC
=DOC
val ⦏ℝ_monoid_delta_dense_thm⦎ : THM;
val ⦏ℝ_monoid_dense_thm⦎ : THM;
val ⦏ℝ_subgroup_dense_thm⦎ : THM;
val ⦏ℝ_semigroup_dense_thm⦎ : THM;
val ⦏ℝ_add_hom_image_group_thm⦎ : THM;
val ⦏ℝ_add_hom_kernel_group_thm⦎ : THM;
=DESCRIBE
These are the ML bindings for theorems giving
various properties of substructures of the additive group ℝ and of
(additive) homomorphisms from ℝ to ℝ.
=ENDDOC
=DOC
val ⦏ℝ_opah_thm⦎ : THM;		val ⦏ℝ_opah_strict_thm⦎ : THM;
val ⦏ℝ_opah_one_one_thm⦎ : THM;	val ⦏ℝ_opah_dense_image_thm⦎ : THM;
val ⦏ℝ_opah_onto_thm⦎ : THM;	val ⦏ℝ_opah_inverse_add_hom_thm⦎ : THM;
val ⦏ℝ_opah_inverse_thm⦎ : THM;	val ⦏ℝ_opah_extension_thm1⦎ : THM;
val ⦏ℝ_opah_extension_thm2⦎ : THM;	val ⦏ℝ_opah_extension_thm⦎ : THM;
val ⦏ℝ_opah_order_thm⦎ : THM;	val ⦏ℝ_opah_eq_thm⦎ : THM;
val ⦏ℝ_opah_complete_thm⦎ : THM;
=DESCRIBE
These are the ML bindings for theorems giving
various properties of order-preserving additive
homomorphisms from ℝ to ℝ.
=ENDDOC
=DOC
val ⦏ℝ_copah_id_thm⦎ : THM;	val ⦏ℝ_copah_double_thm⦎ : THM;
val ⦏ℝ_copah_halve_thm⦎ : THM;	val ⦏ℝ_copah_comp_thm⦎ : THM;
val ⦏ℝ_copah_sum_thm⦎ : THM;	val ⦏ℝ_halve_closed_dense_thm⦎ : THM;
val ⦏ℝ_copah_dense_thm⦎ : THM;
=DESCRIBE
An order-preserving additive homomorphism from ℝ to ℝ is said to be ``central''
if it commutes with any homomorphism from ℝ to ℝ.
These are the ML bindings for theorems giving
various properties of central order-preserving additive from ℝ to ℝ.
=ENDDOC

=DOC
val ⦏ℝ_times_assoc_thm⦎ : THM;		val ⦏ℝ_times_unit_thm⦎ : THM;
val ⦏ℝ_times_comm_thm⦎ : THM;		val ⦏ℝ_times_assoc_thm1⦎ : THM;
val ⦏ℝ_times_plus_distrib_thm⦎ : THM;
val ⦏ℝ_0_less_0_less_times_thm⦎ : THM;	val ⦏ℝ_times_order_thm⦎ : THM;
val ⦏ℝ_times_clauses⦎ : THM;
val ⦏ℝ_times_0_thm⦎ : THM;			val ⦏ℝ_times_1_thm⦎ : THM;
val ⦏ℝ_times_cancel_thm⦎ : THM;		val ⦏ℝ_times_eq_0_thm⦎ : THM;
val ⦏ℝ_times_minus_thm⦎ : THM;
val ⦏ℕℝ_times_homomorphism_thm⦎ : THM;
val ⦏ℕℝ_times_homomorphism_thm1⦎ : THM;
val ⦏ℝ_times_mono_⇔_thm⦎ : THM;		val ⦏ℝ_times_mono_thm⦎ : THM;
val ⦏ℝ_0_≤_0_≤_times_thm⦎ : THM;		val ⦏ℝ_cross_mult_less_thm⦎ : THM;
val ⦏ℝ_cross_mult_eq_thm⦎ : THM;
=DESCRIBE
These are the ML bindings for some basic theorems about the multiplicative structure
of the real numbers and its relationship with the additive and order structure.
=ENDDOC

=DOC
val ⦏ℝ_over_times_recip_thm⦎ : THM;		val ⦏ℝ_times_recip_thm⦎ : THM;
val ⦏ℝ_eq_recip_thm⦎ : THM;		val ⦏ℝ_recip_clauses⦎ : THM;
val ⦏ℝ_0_less_0_less_recip_thm⦎ : THM;	val ⦏ℝ_over_cancel_thm⦎ : THM;
val ⦏ℝ_over_plus_over_thm⦎ : THM;		val ⦏ℝ_0_over_thm⦎ : THM;
val ⦏ℝ_over_1_thm⦎ : THM;			val ⦏ℝ_¬_recip_0_thm⦎ : THM;
=DESCRIBE
These are the ML bindings for some basic theorems about reciprocals (multiplicative
inverses) in the real numbers and their relationship with the other structure.
=ENDDOC

=DOC
val ⦏ℝ_frac_cross_mult_eq_thm⦎ : THM;
val ⦏ℝ_frac_cancel_thm⦎ : THM;
val ⦏ℝ_frac_0_thm⦎ : THM;
val ⦏ℝ_frac_ℕ_thm⦎ : THM;
val ⦏ℝ_frac_plus_frac_thm⦎ : THM;
val ⦏ℝ_frac_minus_frac_thm⦎ : THM;
val ⦏ℝ_frac_minus_frac_thm1⦎ : THM;
val ⦏ℝ_over_times_over_thm⦎ : THM;
val ⦏ℝ_frac_times_frac_thm⦎ : THM;
val ⦏ℝ_over_recip_thm⦎ : THM;
val ⦏ℝ_frac_recip_thm⦎ : THM;
val ⦏ℝ_minus_recip_thm⦎ : THM;
val ⦏ℝ_over_eq_0_thm⦎ : THM;
val ⦏ℝ_over_over_over_thm⦎ : THM;
val ⦏ℝ_frac_less_frac_thm⦎ : THM;
val ⦏ℝ_minus_frac_less_frac_thm⦎ : THM;
val ⦏ℝ_frac_less_minus_frac_thm⦎ : THM;
val ⦏ℝ_0_≤_frac_thm⦎ : THM;
val ⦏ℝ_abs_frac_thm⦎ : THM;
val ⦏ℝ_abs_minus_thm⦎ : THM;
=DESCRIBE
These are the ML bindings for some theorems about rational numbers (in ℝ) expressed as
fractions with natural number numerators and denominators.

The very last theorem is a general fact about absolute values.
=ENDDOC
=DOC
val ⦏ℤℝ_plus_homomorphism_thm⦎ : THM;
val ⦏ℤℝ_minus_thm⦎ : THM;
val ⦏ℤℝ_ℕℤ_thm⦎ : THM;
val ⦏ℤℝ_times_homomorphism_thm⦎ : THM;
=DESCRIBE
These are the ML bindings for theorems in the theory ℝ to assist with
reasoning about the embedding of the integers in the reals.
=ENDDOC
=DOC
val ⦏ℝ_max_cons_thm⦎ : THM;
val ⦏ℝ_max_conv_thm⦎ : THM;
val ⦏ℝ_min_cons_thm⦎ : THM;
val ⦏ℝ_min_conv_thm⦎ : THM;
=DESCRIBE
These are the ML bindings for theorems in the theory ℝ about maxima and minima of lists.
=ENDDOC
\subsection{Tactics}

=DOC
val ⦏ℝ_delta_induction_tac⦎  : TERM -> TACTIC;
=DESCRIBE
This is an induction-like tactic that can be used to prove that a property
holds in a half-open interval of the real numbers: to prove that
=INLINEFT
t[y]
=TEX
holds whenever $x < y$, it suffices to exhibit a positive number $d$ suc
that {\em(i)} $t[u/y]$ holds
for each $u$ with $x < u < x + e$ where $d < e$ and
{\em(ii)} $t[s+d/y]$ holds if $t[s/y]$ holds, for any $s$ with $x < s$.


The term argument $y$ must be a variable that appears free in the conclusion of the goal.
The variable must also appear free once, and only once, in the assumptions, in an
assumption of the form $x < y$.
=FRULE 2 Tactic
ℝ_delta_induction_tac ⌜y⌝
├
{ Γ; x < y } t [y/y]
├
{ Γ } ∃d⦁0. < d
∧ (∃e⦁d < e ∧
    (∀u⦁x < u ∧ u < x + e ⇒
	t[u/y]))
∧ (∀s⦁x < s ∧ p s ⇒
	t[s + d/y]))
=TEX
=FAILURE
116001	?0 is not a variable of type ⓣℝ⌝
116002	A term of the form ⓩx < y⌝ where y is the induction variable
	could not be found in the assumptions
116003	?0 does not appear free in the conclusions of the goal
116004	?0 appears free in more than one assumption of the goal
=ENDDOC


\subsection{Computational Conversions}
The computational conversions deal with real literals which have the
one of the forms:
=GFT
	ℕℝ m
	m / n
=TEX
where $m$ and $n$ are natural number literals with $n \neq 0$. A literal of the
second form is said to be in normal form when $m$ and $n$ are
coprime and $n \neq 1$.
=DOC
val ⦏ℝ_frac_norm_conv⦎ : CONV;	val ⦏ℝ_frac_plus_frac_conv⦎ : CONV;
=DESCRIBE
=INLINEFT
ℝ_frac_norm_conv
=TEX
\ proves theorems giving a normal form for real literals expressed as numeric
fractions. The theorems have the form:
=GFT
⊢ m /⋎N n = ℕℝ m'
⊢ m /⋎N n = m' /⋎N n'
=TEX
\ where $m$, $n$, $m'$ and $n'$ are natural number literals and, in the second case,
$m'$ and $n'$ are coprime and $n' > 1$.

=INLINEFT
ℝ_frac_plus_frac_conv
=TEX
\ proves theorems of the forms:

=GFT
⊢ m /⋎N n +  m' /⋎N n' = t
=TEX
\ where $m$, $n$, $m'$ and $n'$ are natural number literals and $t$ is in the same
kind of normal form as produced by
=INLINEFT
ℝ_frac_norm_conv
=TEX
.
=FAILURE
116301	?0 is not of the form ⌜m /⋎N n⌝ or ⌜ℕℝ m⌝
116302	cannot simplify ?0 because it denominator is 0.
116303	?0 is already in normal form
116304	?0 is not of the form ⌜(i /⋎N m) +⋎R (j /⋎N n)⌝
=ENDDOC

=DOC
val ⦏ℝ_plus_conv⦎ : CONV;		val ⦏ℝ_times_conv⦎ : CONV;
val ⦏ℝ_less_conv⦎ : CONV;
val ⦏ℝ_≤_conv⦎ : CONV;			val ⦏ℝ_eq_conv⦎ : CONV;
val ⦏ℝ_over_conv⦎ : CONV;		val ⦏ℝ_ℕ_exp_conv⦎ : CONV;
=DESCRIBE
These conversions compute theorems of the form
=GFT
⊢ x op y = z
=TEX
\ where $x$ and $y$ are rational literals and $op$ is the operation indicated by
the name of the conversion.
A rational literal is taken to be an optionally signed expression made
up from natural number literals using
=INLINEFT
ℕℝ
=TEX
\ or
=INLINEFT
/⋎N
=TEX
.
(Note that
=INLINEFT
ℕℝ
=TEX
\ applied to a natural number literal is pretty-printed and may be entered as the natural number followed by a decimal point.
The term $z$ is a truth value or an optionally signed rational literal in normal form (see
=INLINEFT
ℝ_frac_norm_conv
=TEX
\ as appropriate.

=FAILURE
116305	?0 is not of the form ⌜x +⋎R y⌝ where ⌜x⌝ and ⌜y⌝ are rational literals
116306	?0 is not of the form ⌜x *⋎R y⌝ where ⌜x⌝ and ⌜y⌝ are rational literals
116309	?0 is not of the form ⌜x < y⌝ where ⌜x⌝ and ⌜y⌝ are rational literals
116310	?0 is not of the form ⌜x ≤ y⌝ where ⌜x⌝ and ⌜y⌝ are rational literals
116311	?0 is not of the form ⌜x = y⌝ where ⌜x⌝ and ⌜y⌝ are rational literals
116312	?0 is not of the form ⌜x / y⌝ where ⌜y⌝ is a rational literal
116317	?0 is not of the form ⌜x ^⋎N m⌝ where ⌜x⌝ is a rational number literal
	and ⌜m⌝ is a natural number literal
=ENDDOC
=DOC
val ⦏ℝ_ℤ_exp_conv⦎ : CONV;
=DESCRIBE
This conversions computes theorems of the form and
=GFT
⊢ x ^⋎Z ℕℤ m = x ^⋎N m
⊢ x ^⋎Z ~(ℕℤ m) = (x ^⋎N m)⋏-⋏1
=TEX

=FAILURE
116321	?0 is not of the form ⌜x ^⋎Z m⌝
=ENDDOC
=DOC
val ⦏ℝ_abs_conv⦎ : CONV;	val ⦏ℝ_recip_conv⦎ : CONV;	
=DESCRIBE
These conversions compute theorems of the form:
=GFT
⊢ Abs x = z
⊢ x ⋏-⋏1 = z
=TEX
where $x$ and $z$ are rational literals (see%
=INLINEFT
ℝ_plus_conv
=TEX
.
=FAILURE
116307	cannot take the reciprocal of ?0 because its denominator
	or numerator is 0
116308	?0 is not of the form ⌜x ⋏-⋏1⌝ where ⌜x⌝ is
	a rational literal
116316	?0 is not of the form ⌜Abs (i/m)⌝
	where ⌜m⌝ is a natural number literal
=ENDDOC
=DOC
val ⦏ℝ_minus_conv⦎ : CONV;
=DESCRIBE
This conversion simplifies expressions involving real negation.
It returns theorems of the form:
=GFT
⊢ ~(~ x ) = x
⊢ ~(0/1) = 0.
⊢ ~0. = 0.
=TEX

=FAILURE
116319	?0 is not of the form ⌜~ (~ x)⌝, ⌜~(0/1)⌝, or ⌜~0.⌝
=ENDDOC
=DOC
val ⦏ℝ_greater_conv⦎ : CONV;	val ⦏ℝ_≥_conv⦎ : CONV;
val ⦏ℝ_subtract_conv⦎ : CONV;
=DESCRIBE
These conversions prove theorems of the following forms:
=GFT
⊢ x > y ⇔ y < x
⊢ x ≥ y ⇔ y ≤ x
⊢ x - y ⇔ y + ~x
=TEX
=FAILURE
116313	?0 is not of the form ⌜x > y⌝ where ⌜x⌝ and ⌜y⌝ have type ⓣℝ⌝
116314	?0 is not of the form ⌜x ≥ y⌝ where ⌜x⌝ and ⌜y⌝ have type ⓣℝ⌝
116315	?0 is not of the form ⌜x - y⌝ where ⌜x⌝ and ⌜y⌝ have type ⓣℝ⌝
=ENDDOC
=DOC
val ⦏ℝ_max_conv⦎ : CONV;
val ⦏ℝ_min_conv⦎ : CONV;
=DESCRIBE
These conversions compute theorems of the form:
=GFT
⊢ Max⋎R x = y
⊢ Min⋎R x = y
=TEX
where $x$ is a list display whose elements are rational literals.
If $x$ is a singleton list, $y$ is its element.
If $x$ is a list of more than one element, $y$ is obtained from $x$ by
replacing the first two elements by their minimum or maximum as appropriate
(So repeatedly applying the conversions will calculate maxima and minima.)
E.g.,
=GFT
⊢ Max⋎R [4 / 3; 3 / 4 ; 2 / 3] = Max⋎R [4 / 3; 2 / 3]
⊢ Max⋎R [4 / 3] = 4 / 3
=TEX
=FAILURE
116331	Could not simplify ?0
=ENDDOC
=DOC
val ⦏float_conv⦎ : CONV;
=DESCRIBE
This conversion converts a floating point literal into a rational literal.
E.g., it proves the following theorems:
=GFT
⊢ 0.5 = 1 / 2
⊢ 25.0e~2 = 1 / 4
⊢ 0.314159e1 = 314159 / 100000
=TEX
=FAILURE
116331	Could not simplify ?0
=ENDDOC
=DOC
val ⦏ℝ_eval_conv⦎ : CONV;	val ⦏ℝ_EVAL_C⦎ : CONV -> CONV;
=DESCRIBE
=INLINEFT
ℝ_eval_conv
=TEX
\ computes theorems of the form
=INLINEFT
⊢ t1 = t2
=TEX
\ where $t1$ is an expression made up from rational literals (see
=INLINEFT
ℝ_plus_conv
=TEX
) and/or floating point literals using real addition, subtraction, multiplication, division, reciprocal,
absolute value and unary negation.
$t2$ will be an optionally signed rational literal in normal form.
The conversion fails if the expression cannot be evaluated (e.g., because
it contains variables).

=INLINEFT
ℝ_EVAL_C conv
=TEX
\ is similar to
=INLINEFT
ℝ_eval_conv
=TEX
\ but it also applies
=INLINEFT
conv
=TEX
\ to any subterm that cannot be evaluated using the conversions for the
arithmetic operations listed above.
E.g.,
=INLINEFT
ℝ_EVAL_C ℝ_ℕ_exp_conv
=TEX
\ will evaluate expressions involving the usual arithmetic operations and
also exponentiation of rational literals by natural number literals.
=FAILURE
116320	?0 cannot be evaluated
=ENDDOC

=DOC
	val ⦏ℝ_term_order⦎ : TERM ORDER;
	val ⦏ℝ_term_order1⦎ : {graded : bool, inverse: bool} -> TERM ORDER;
=DESCRIBE
=INLINEFT
ℝ_term_order
=TEX
\ gives an ordering relation on HOL terms analogous to that given by $term\_order$, q.v., but which takes special arrangements for certain terms of type ℝ.
Terms of the form
=INLINEFT
t⋎1 * ... t⋎l
=TEX
\ are called monomials and are ordered lexicographically using an ordering on the
=INLINEFT
t⋎i
=TEX
\ first ignoring signs, exponents, and reciprocals applied to the
=INLINEFT
t⋎i
=TEX
\ and only taking signs, exponents and reciprocals into account if necessary.
So for example, in this ordering:
=GFT
x * y < ~x * y < x⋏-⋏1 * y < x * y^2 < x * y * z
=TEX
Rational literals, i.e., terms formed using ℕℝ or natural number
division with natural number literal operands are ordered numerically.

Each monomial is grouped next to the
the same monomial with coefficients and signs or reciprocals (where a coefficient is a rational literal appearing in a monomial as the term
=INLINEFT
t⋎1
=TEX
. Thus:

=GFT
	a*b < ~a * b < 2. * a * b < ~(2/1)⋏-⋏1 * a * b < ....
=TEX

Note that
=INLINEFT
ℝ_term_order
=TEX
\ takes the lexicographic order in the sense appropriate to a sparse representation of monomials.
This means that $xy$ precedes $xz$ (whereas in a dense representation, $xz = x^1y^0z^1$ precedes $xy = x^1y^1z^0$).
This is intuitive, but is not the same as any of the usual admissible orders in the sense of Gr\"{o}bner basis theory.

=INLINEFT
ℝ_term_order1
=TEX
\ provides the usual admissible lexicographic orderings used in Gr\"{o}bner basis theory (following section 5.1 of T. Becker and V. Weispfenning, {\it Gr\"{o}bner Bases}, Springer, 1993).
For example,
=INLINEFT
ℝ_term_order1{graded = true, inverse = true}
=TEX
\ gives the graded inverse lexicographic order.

\raggedright
=SEEALSO
=INLINEFT
ℝ_term_order_comb
=TEX
,
=INLINEFT
graded_ℝ_term_order_comb
=ENDDOC

=DOC
	val ⦏ℝ_term_order_comb⦎ : TERM ORDER -> TERM ORDER;
	val ⦏ℝ_term_order_comb1⦎ :
		{graded : bool, inverse: bool} ->
		TERM ORDER -> TERM ORDER;
=DESCRIBE
\raggedright
These are the term order combinators used as arguments to
=INLINEFT
make_term_order
=TEX
\ to implement
=INLINEFT
ℝ_term_order
=TEX
\ and
=INLINEFT
ℝ_term_order1
=TEX
, q.v.
=ENDDOC
=DOC
val ⦏ℝ_ANF_C⦎ : CONV -> CONV;
val ⦏ℝ_anf_conv⦎ : CONV;
=DESCRIBE
=INLINEFT
ℝ_anf_conv
=TEX
\ is a conversion which proves theorems of the form
=INLINEFT
⊢ t1 = t2
=TEX
\ where $t1$ is a term formed from atoms of type ℝ and
$t2$ is in what we may call additive normal form, i.e. it has the form:
=INLINEFT
t⋎1 + t⋎2 + ...
=TEX
, where the
=INLINEFT
t⋎i
=TEX
\ have the form
=INLINEFT
s⋎1 * s⋎2 * ...
=TEX
where the
=INLINEFT
s⋎i
=TEX
\ are atoms.
Here, by atom
we mean a term which is not of the form
=INLINEFT
t⋎1 + t⋎2 + ...
=TEX
or
=INLINEFT
s⋎1 * s⋎2 * ...
=TEX
.

The summands
=INLINEFT
t⋎i
=TEX
\ and,
within them,
the factors
=INLINEFT
s⋎j
=TEX
\ are given in increasing order with respect to the ordering
on terms given by the function
=INLINEFT
ℝ_term_order
=TEX
, q.v. Arithmetic computation is carried out on atoms to ensure
that at most one of the summands is a rational literal and that, within
each summand, at most one factor is a rational literal. Any literal appears
at the beginning of its factor or summand and addition of $0$
or multiplication by $1$ is simplified out.
Floating point literals are converted into rational literals.

=INLINEFT
ℝ_ANF_C conv
=TEX
\ is a conversion which acts like
=INLINEFT
ℝ_anf_conv
=TEX
\ but which applies
=INLINEFT
conv
=TEX
\ to each atom as it is encountered (and normalises the result recursively).
The argument conversion  may signal that it does not
wish to change a subterm, $t$ say, either by failing or by returning $t = t$,
the former approach is more efficient.

The conversions fail with error number 116318 if there are no changes to be
made to the term.

=FAILURE
116318	?0 is not of type ⓣℝ⌝ or is already in additive normal form
=ENDDOC
=DOC
	val ⦏ℝ_eq_cancel_conv⦎ : CONV
	val ⦏ℝ_≤_cancel_conv⦎ : CONV
	val ⦏ℝ_less_cancel_conv⦎ : CONV
=DESCRIBE
=INLINEFT
ℝ_eq_cancel_conv
=TEX
\ (resp.
=INLINEFT
ℝ_≤_cancel_conv
=TEX
, resp.
=INLINEFT
ℝ_less_cancel_conv
=TEX
) puts arithmetic equations (resp. inequalities formed with $≤$) in
a normal form in which the right-hand side is a signed literal and
the left-hand side is in additive normal form, in the
sense of
=INLINEFT
ℝ_anf_conv
=TEX
, q.v.

For example, the calls:
=GFT ProofPower Input
ℝ_eq_cancel_conv⌜x + 2. * y + 3. = 1. + 6.*y⌝;
ℝ_≤_cancel_conv⌜x + 2. * y + x + . 3 ≤ y + 2. + 2.*x + y⌝;
ℝ_less_cancel_conv⌜x + 2. * y + x + . 3 < y + 2. + 2.*x + y⌝;
=TEX
produce the following output
=GFT ProofPower Output
val it = ⊢ x + 2. * y + 3. = 1. + 6. * y
	⇔ x + ~ (4.) * y = ~ (2.) : THM
val it = ⊢ x + 2. * y + x + 3. ≤ y + 2. + 2. * x + y
	⇔ 1. ≤ 0. : THM
val it = ⊢ x + 2. * y + x + 3. ≤ y + 2. + 2. * x + y
	⇔ 1. < 0. : THM
=TEX

Note that if the left-hand side reduces to $0$ the truth value is not evaluated.
However,
=INLINEFT
ℝ_eq_conv
=TEX
,
=INLINEFT
ℝ_≤_conv
=TEX
\ or
=INLINEFT
ℝ_less_conv
=TEX
\ may be used to perform the evaluation, where required.

=USES
The conversions are intended for use in tactic and conversion programming.
The normal interactive interface is via rewriting or stripping in the proof context
=INLINEFT
ℝ_lin_arith
=TEX
, which performs other useful simplifications.
=FAILURE
116520	?0 is not of the form (t1:ℝ) = t2 or is already in normal form
116521	?0 is not of the form (t1:ℝ) ≤ t2 or is already in normal form
116522	?0 is not of the form (t1:ℝ) < t2 or is already in normal form
=SEEALSO
=INLINEFT
ℝ_lin_arith (proof context)
=TEX
=ENDDOC




=DOC
	val ⦏ℝ_lin_arith_rule⦎ : TERM list -> THM;
	val ⦏ℝ_lin_arith_tac⦎ : TACTIC;
	val ⦏ℝ_lin_arith_prove_tac⦎ : THM list -> TACTIC;
=DESCRIBE
Given a system,
=INLINEFT
Γ = [r⋎1, r⋎2, ...]
=TEX
, of numeric constraints,
=INLINEFT
r⋎i
=TEX
, of the form
=INLINEFT
(s⋎i:ℝ) = c⋎i
=TEX
or
=INLINEFT
s⋎i ≤ c⋎i
=TEX
, where the
=INLINEFT
c⋎i
=TEX
\ are rational literals,
the rule attempts to prove a theorem of the form
=INLINEFT
Γ ⊢ F
=TEX
. Terms in Γ which are not of either of these forms are ignored and
do not appear in the assumptions of the result theorem.


The tactics use the rule in much the same way as the integer linear
arithmetics use
=INLINEFT
ℤ_lin_arith_rule
=TEX
\ (see
=INLINEFT
ℤ_lin_arith_tac
=TEX
).
The usual interface to these functions is via the decision procedures in the
proof context $ℝ\_lin\_arith$, q.v., e.g. as invoked by
=INLINEFT
PC_T1"ℝ_lin_arith"prove_tac[]
=TEX

The algorithm for the decision procedure is very similar to the one used in $lin\_arith\_rule$, q.v.

=FAILURE
116341	The linear arithmetic proof procedure cannot prove this conjecture
=ENDDOC

=DOC
	val ⦏ℝ_lin_qep_conv⦎ : CONV;
=DESCRIBE
This conversion implements the Hodes-Fourier-Motzkin quantifier elimination procedure for linear arithmetic with real coefficients.
=ENDDOC

=SML
end (* of signature ℝ *);
=TEX


\section{PROOF CONTEXTS}
=DOC
(* Proof Context: ⦏'ℝ⦎ *)
=DESCRIBE
A component proof context for handling the basic arithmetic operations
for real numbers in HOL.

Expressions and predicates treated by this proof context are constructs formed from:
=GFT
+, *, -, Abs⋎R, /⋎R, ≤, <, ≥, >, =
=TEX

\paragraph{Contents}\

Rewriting:
=GFT
ℝ_plus_conv, ℝ_times_conv, ℝ_subtract_minus_conv
ℝ_abs_conv, ℝ_over_conv, ℝ_recip_conv, ℝ_ℕ_exp_conv, ℝ_ℤ_exp_conv,
ℝ_eq_conv, ℝ_≤_conv, ℝ_less_conv
ℝ_≥_conv, ℝ_greater_conv,
ℝ_plus_clauses, ℝ_minus_clauses, ℝ_≤_clauses
ℝ_less_clauses, ℝ_frac_norm_conv, float_conv
=TEX
Here {\em float\_conv} is only applied to floating point literals with a zero exponent.

Stripping theorems:
=GFT
ℝ_eq_conv, ℝ_≤_conv, ℝ_less_conv
ℝ_≥_conv, ℝ_greater_conv,
ℝ_plus_clauses, ℝ_minus_clauses, ℝ_≤_clauses
ℝ_less_clauses,
and all the above pushed through ¬
=TEX

Stripping conclusions: as for stripping theorems.

Rewriting canonicalisation: blank.

=TEX
Automatic proof procedures:
=INLINEFT
basic_prove_tac
=TEX
,
=INLINEFT
basic_prove_conv
=TEX
.

Automatic existence prover: blank.
=ENDDOC


=DOC
(* Proof Context: ⦏ℝ_lin_arith⦎ *)
=DESCRIBE
This is a proof context whose main purpose is to supply a decision procedure
for problems in linear arithmetic over the HOL integers.
\paragraph{Contents}
The rewriting, theorem stripping and conclusion stripping components are
as for the proof context $predicates$, q.v., each augmented with conversions
effecting the following transformations, where $a$ and $b$ stand for
numeric literals.
=GFT
a = b	→	ℝ_eq_conv⌜a = b⌝
a ≤ b	→	ℝ_≤_conv⌜a ≤ b⌝
t1 = t2		→	ℝ_eq_cancel_conv⌜t1 = t2⌝
t1 ≤ t2		→	ℝ_≤_cancel_conv⌜t1 ≤ t2⌝
¬ t1 = t2	→	t1 < t2 ∨ t2 < t1
¬ t1 ≤ t2	→	t2 < t1
t1 < t2	→	t1 + 1 ≤ t2
t1 ≥ t2	→	t2 ≤ t1
t1 > t2	→	t2 < t
¬ t1 < t2	→	t2 ≤ t1
¬ t1 ≥ t2	→	¬ t2 ≤ t1
¬ t1 > t2	→	t1 ≤ t2
t1 = t2	→	t1 = t2
t1 ≤ t2	→	t1 ≤ t2
=TEX
(where all variables are of type ℝ).

The automatic proof tactic works by {\em(i)} restripping all the
assumptions of the goal, {\em(ii)} adding the argument theorems
to the stock of assumptions using $strip\_asm\_tac$, {\em(iii)} applying
$contr\_tac$, and {\em(iv)} searching for a linear combination of
the assumptions which will reduce, by multiplying out and cancelling like terms,
to a contradiction of the form $a = b$ or
$a ≤ b$ with $a$ and $b$ numeric literals.
The automatic proof conversion just tries to prove its argument, $t$ say, using
the automatic proof tactic and returns $t = T$ if it succeeds.

Other components of the proof context are as for $predicates$.

For example,
=INLINEFT
PC_T1"ℝ_lin_arith"prove_tac[]
=TEX
\ will prove any of the following goals:
=GFT
	([], ⌜∀a b c:ℝ⦁a ≤ b ∧ (a + b < c + a) ⇒ a < c⌝)
	([], ⌜∀a b c:ℝ⦁a ≥ b ∧ ¬ b < c ⇒ (1/2) * a ≥(1/2) * c⌝)
	([], ⌜∀a b c:ℝ⦁a + 2.*b < 2.*a ⇒ b + b < a⌝)
	([], ⌜∀ x y:ℝ⦁ ¬ (2.*x + y = 1/3 ∧ 4.*x + 2.*y = 2/5)⌝)
=TEX
=SEEALSO
=INLINEFT
'ℝ_lin_arith
=ENDDOC
=DOC
(* Proof Context: ⦏'ℝ_lin_arith⦎ *)
=DESCRIBE
This is a component
proof context whose main purpose is to supply a decision procedure
for problems in linear arithmetic for the HOL integers.
\paragraph{Contents}
The rewriting, theorem stripping and conclusion stripping components
are as for the proof context $ℝ\_lin\_arith$ but without any of the
material from the proof context $predicates$.
The automatic proof components are as for $lin\_arith$.
Other components are blank.

A typical use of the proof context would be to solve problems containing
a mixture of linear real number arithmetic and set theory.
=ENDDOC


\section{TEST POLICY}
The module tests for this module are to follow the guidelines
laid down in the quality plan~\cite{DS/FMU/IED/PLN007}.
The various conversions, tactics etc. need to be tested in addition to the
check of the theory design.


\twocolumn[\section{INDEX}]
\small
\printindex

\end{document}









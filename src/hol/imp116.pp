=IGN
********************************************************************************
imp116.doc: this file is part of the PPHol system

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

\def\Title{ Implementation: Theory of Reals }

\def\Abstract{\begin{center}
{\bf Abstract}\par\parbox{0.7\hsize}
{\small This document gives the implementation of the theory of real numbers in \ProductHOL.}
\end{center}}

\def\Reference{LEMMA1/HOL/IMP116}

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
\item[Issues 1.1 (2000/12/05)-1.5 (2000/12/10)] First development drafts.
\item[Issues 1.6 (2001/06/28)-1.8 (2001/07/02)] Improvements to the computational and normalisation conversions.
\item[Issue 1.9 (2001/07/27)] Fixed bug in {\it add\_simp\_conv}.
\item[Issue 1.10 (2001/11/12)] Added missing ML binding for definition of absolute value function.
\item[Issue 1.11 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.12 (2002/10/17)] PPHol-specific updates for open source release
\item[Issues 1.13 (2003/04/09), 1.14 (2003/04/09)] Accomodate revised definition of antisymmetry in the theory {\it orders}.
\item[Issue 1.15 (2003/04/28)] Allowed for rationalisation of names in the theory {\it orders};
made sure that no theorems have free variables.
\item[Issue 1.16 (2005/06/01)] Fixed problems with ℝ\_anf\_conv.
\item[Issue 1.17 (2005/06/01)] Introduced embedding of the integers.
\item[Issue 1.18 (2006/04/19)] Added exponentiation with integer coefficients.
\item[Issue 1.19 (2006/05/08)] Added normalisation of literal fractions to the proof context.
\item[Issues 1.20 (2006/12/02), 1.21 (2006/12/09)] Added support for floating point literals.
\item[Issues 1.22 (2007/03/03)] Added functions to give maxima and minima of lists.
\item[Issue 1.23 (2007/03/04)] Division by zero is now defined to give zero.
\item[Issue 1.24 (2007/03/04)] Fixed wrong error message in {\em float\_conv}.
\item[Issue 1.25 (2007/05/16)] Commented out change to division by zero pending outcome of discussion with QinetiQ.
\item[Issue 1.26 (2007/08/15)] Fixed
=INLINEFT
ℝ_term_order
=TEX
.
\item[Issue 1.27 (2007/08/31)] Added quantifier elimination procedure for linear real arithmetic.
\item[Issues 1.28 (2007/09/08), 1.29 (2007/09/09)] Redesign of the term ordering functions using the new term order combinators.
\item[Issue 1.30 (2012/02/02)] Fixes for SML/NJ.
\item[Issues 1.31 (2012/05/08)--1.35 (2012/05/10)] Arithmetic normal form now uses natural number powers and the real number term ordering has been adjusted to match.
\item[Issue 1.36 (2013/04/27)] Fixed problems in the arithmetic normal form conversion when the input involves natural number powers.
\item[Issue 1.37 (2013/07/28)] More bug fixes relating to the new arithemetic normal form.
\item[Issue 1.38 (2014/03/03)] SML/NJ compatibility fixes.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.
\item[2015/04/15]
Now uses new date and version macros from doctex
\item[2016/05/22]
Fixed bug in handling of floating point literals in
=INLINEFT
ℝ_anf_conv
=TEX
.
%%%% END OF CHANGES HISTORY %%%%
\end{description}

%%%%%  CHANGES FORECAST:

\subsection{Changes Forecast}

Some of the material in this document might more usefully be shipped into a separate
document extending the facilities for natural numbers.

%%%%% DISTRIBUTION LIST

\subsection{Distribution}

Lemma 1 build system.

\newpage

\section{Introduction}
\subsection{Scope}
The real numbers are constructed in HOL using the positive dyadic rational numbers
under multiplication to provide an ordered algebraic system whose completion
provides the reals.
This construction is carried out in \cite{LEMMA1/HOL/DTD116}.
This module provides the necessary algebraic and order-theoretic facts about
this system of numbers.


\subsection{Purpose and Background}
See \cite{DS/FMU/IED/HLD011}.


\section{PROLOGUE}\label{PROLOGUE}
=TEX
The structure takes rather a long time to compile if done in one piece.
We break it up into smaller structures each one of which includes the previous one.
The signature constraint is applied to the final structure.
=SML
structure ⦏ℝ⦎ (* : ℝ *) = struct
val _ = open_theory"ℝ";
val _ = push_merge_pcs["basic_hol", "'ℤ", "'sets_alg"];
open Dyadic;
=TEX
\section{CONSISTENCY OF THE ORDERING RELATION}
In this section we prove that the definition of
=INLINEFT
$<⋎R
=TEX
\ is consistent.
This is essentially just a straightforward transfer of facts about the representation
type for the reals (as the completion of the ordered set of positive dyadic
rational) up to the abstract type of reals.
=SML
val _ = declare_infix(210, "lt");
=TEX
=SML
val ⦏left_inv_one_one_thm⦎ = (
set_goal([], ⌜∀f g⦁(∀x⦁g(f x) = x) ⇒ OneOne f⌝);
a(rewrite_tac[one_one_def] THEN REPEAT strip_tac);
a(LEMMA_T ⌜g(f x1) = g(f x2)⌝ ante_tac THEN1 POP_ASM_T rewrite_thm_tac);
a(POP_ASM_T discard_tac THEN asm_rewrite_tac[]);
pop_thm()
);
=TEX
=SML
val ⦏ℝ_order_exists_thm⦎ = (
set_goal([], ⌜∃$lt:ℝ → ℝ → BOOL; iota : DYADIC → ℝ⦁
		StrictLinearOrder(Universe, $lt)
	∧	Complete(Universe, $lt)
	∧	UnboundedAbove(Universe, $lt)
	∧	UnboundedBelow(Universe, $lt)
	∧	(∀a b⦁ iota a lt iota b ⇔ a dy_less b)
	∧	{x | ∃a⦁iota a = x} DenseIn (Universe, $lt)
⌝);
a (strip_asm_tac (rewrite_rule[get_spec⌜Is_ℝ_Rep⌝]
	(simple_⇒_match_mp_rule type_lemmas_thm (get_defn"-""ℝ"))));
a(lemma_tac⌜∀x⦁rep x ∈ Cuts (Universe, $dy_less)⌝ THEN1 asm_rewrite_tac[]);
a(all_fc_tac[left_inv_one_one_thm]);
a(∃_tac⌜λx y⦁rep x ⊂ rep y⌝);
a(∃_tac⌜λa⦁abs (DownSet(Universe, $dy_less, a))⌝);
a(strip_asm_tac(get_thm"-""dy_less_order_lemmas_thm"));
a(lemma_tac⌜Trans(Universe, $dy_less)⌝
	THEN1 rewrite_tac[get_spec⌜Trans⌝, dy_less_trans_thm]);
a(rewrite_tac[] THEN REPEAT ∧_tac);
(* *** Goal "1" *** *)
a(bc_thm_tac induced_strict_linear_order_thm);
a(∃_tac⌜Cuts (Universe, $dy_less)⌝ THEN asm_rewrite_tac[]);
a(all_fc_tac[cuts_strict_linear_order_thm]);
(* *** Goal "2" *** *)
a(bc_thm_tac induced_order_complete_thm);
a(∃_tac⌜Cuts (Universe, $dy_less)⌝ THEN asm_rewrite_tac[cuts_complete_thm]);
a(REPEAT strip_tac);
a(∃_tac⌜abs x⌝ THEN asm_rewrite_tac[]);
(* *** Goal "3" *** *)
a(bc_thm_tac induced_order_unbounded_above_thm);
a(∃_tac⌜Cuts (Universe, $dy_less)⌝ THEN asm_rewrite_tac[]);
a(REPEAT strip_tac);
(* *** Goal "3.1" *** *)
a(∃_tac⌜abs x⌝ THEN asm_rewrite_tac[]);
(* *** Goal "3.2" *** *)
a(bc_thm_tac cuts_unbounded_above_thm THEN asm_rewrite_tac[get_spec⌜Irrefl⌝, dy_less_irrefl_thm]);
(* *** Goal "4" *** *)
a(bc_thm_tac induced_order_unbounded_below_thm);
a(∃_tac⌜Cuts (Universe, $dy_less)⌝ THEN asm_rewrite_tac[]);
a(REPEAT strip_tac);
(* *** Goal "4.1" *** *)
a(∃_tac⌜abs x⌝ THEN asm_rewrite_tac[]);
(* *** Goal "4.2" *** *)
a(bc_thm_tac cuts_unbounded_below_thm THEN asm_rewrite_tac[get_spec⌜Irrefl⌝, dy_less_irrefl_thm]);
(* *** Goal "5" *** *)
a(REPEAT ∀_tac);
a(LEMMA_T⌜DownSet (Universe, $dy_less, a) ∈ Cuts (Universe, $dy_less)⌝ ante_tac
	THEN1 (bc_thm_tac downset_cut_thm THEN REPEAT strip_tac));
a(LEMMA_T⌜DownSet (Universe, $dy_less, b) ∈ Cuts (Universe, $dy_less)⌝ ante_tac
	THEN1 (bc_thm_tac downset_cut_thm THEN REPEAT strip_tac));
a(asm_rewrite_tac[] THEN REPEAT (⇒_T rewrite_thm_tac));
a(bc_thm_tac down_sets_less_thm);
a(REPEAT strip_tac);
(* *** Goal "6" *** *)
a(bc_thm_tac induced_order_dense_thm);
a(∃_tac⌜Cuts (Universe, $dy_less)⌝ THEN asm_rewrite_tac[]);
a(REPEAT strip_tac THEN1 (∃_tac⌜abs x⌝ THEN asm_rewrite_tac[]));
a(LEMMA_T⌜{x|∃a⦁ (∃ a'⦁ abs (DownSet (Universe, $dy_less, a')) = a) ∧ x = rep a} =
	DownSets (Universe, $dy_less, Universe)⌝ rewrite_thm_tac);
(* *** Goal "6.1" *** *)
a(PC_T "sets_ext1" strip_tac);
a(rewrite_tac[get_spec⌜DownSets⌝] THEN REPEAT strip_tac);
(* *** Goal "6.1.1" *** *)
a(LEMMA_T⌜DownSet (Universe, $dy_less, a') ∈ Cuts (Universe, $dy_less)⌝ ante_tac
	THEN1 (bc_thm_tac downset_cut_thm THEN REPEAT strip_tac));
a(asm_rewrite_tac[] THEN REPEAT strip_tac);
a(contr_tac THEN all_asm_fc_tac[]);
(* *** Goal "6.1.2" *** *)
a(LEMMA_T⌜DownSet (Universe, $dy_less, x') ∈ Cuts (Universe, $dy_less)⌝ ante_tac
	THEN1 (bc_thm_tac downset_cut_thm THEN REPEAT strip_tac));
a(asm_rewrite_tac[] THEN REPEAT strip_tac);
a(∃_tac⌜abs (DownSet (Universe, $dy_less, x'))⌝ THEN asm_rewrite_tac[]);
a(∃_tac⌜x'⌝ THEN REPEAT strip_tac);
(* *** Goal "6.2" *** *)
a(bc_thm_tac down_sets_dense_thm THEN REPEAT strip_tac);
pop_thm()
);
=TEX
=SML
val _ = (
push_consistency_goal⌜$<⋎R⌝;
a(strip_asm_tac ℝ_order_exists_thm);
a(∃_tac⌜$lt⌝ THEN REPEAT strip_tac);
a(∃_tac⌜$iota⌝ THEN asm_rewrite_tac[] THEN REPEAT strip_tac);
save_consistency_thm⌜$<⋎R⌝(pop_thm())
);
=TEX
=SML
val _ = declare_nonfix("lt");
=TEX
\section{THEOREMS ABOUT THE ORDERING}
\ftlinepenalty=9999

In this section we prove basic facts about the less-than relation on the reals.

=SML
end (* of structure ℝ part 1 *);
structure ⦏ℝ⦎ (* : ℝ *) = struct
open ℝ;
=SML
val ⦏ℝ_unbounded_below_thm⦎ = (
set_goal([], ⌜∀x: ℝ⦁ ∃y⦁ y < x⌝);
a(LEMMA_T ⌜UnboundedBelow(Universe, $<⋎R)⌝ ante_tac THEN1 rewrite_tac[get_spec⌜$<⋎R⌝]);
a(rewrite_tac[get_spec⌜UnboundedBelow⌝] THEN REPEAT strip_tac);
save_pop_thm "ℝ_unbounded_below_thm"
);
=TEX
=SML
val ⦏ℝ_unbounded_above_thm⦎ = (
set_goal([], ⌜∀x: ℝ⦁ ∃y⦁ x < y⌝);
a(LEMMA_T ⌜UnboundedAbove(Universe, $<⋎R)⌝ ante_tac THEN1 rewrite_tac[get_spec⌜$<⋎R⌝]);
a(rewrite_tac[get_spec⌜UnboundedAbove⌝] THEN REPEAT strip_tac);
save_pop_thm "ℝ_unbounded_above_thm"
);
=TEX
=SML
val ⦏ℝ_less_irrefl_thm⦎ = (
set_goal([], ⌜∀x: ℝ⦁ ¬x < x⌝);
a(LEMMA_T ⌜StrictLinearOrder(Universe, $<⋎R)⌝ ante_tac THEN1 rewrite_tac[get_spec⌜$<⋎R⌝]);
a(rewrite_tac(map get_spec[⌜StrictLinearOrder⌝, ⌜StrictPartialOrder⌝, ⌜Irrefl⌝]) THEN REPEAT strip_tac);
save_pop_thm "ℝ_less_irrefl_thm"
);
=TEX
=SML
val ⦏ℝ_less_antisym_thm⦎ = (
set_goal([], ⌜∀x y: ℝ⦁ ¬(x < y ∧ y < x)⌝);
a(LEMMA_T ⌜StrictLinearOrder(Universe, $<⋎R)⌝ ante_tac THEN1 rewrite_tac[get_spec⌜$<⋎R⌝]);
a(rewrite_tac(map get_spec[⌜StrictLinearOrder⌝, ⌜StrictPartialOrder⌝, ⌜Antisym⌝, ⌜Irrefl⌝]) THEN REPEAT strip_tac);
a(contr_tac THEN cases_tac⌜x = y⌝ THEN1 all_var_elim_asm_tac THEN asm_prove_tac[]);
save_pop_thm "ℝ_less_antisym_thm"
);
=TEX
=SML
val ⦏ℝ_less_trans_thm⦎ = (
set_goal([], ⌜∀x y z: ℝ⦁ x < y ∧ y < z ⇒ x < z⌝);
a(LEMMA_T ⌜StrictLinearOrder(Universe, $<⋎R)⌝ ante_tac THEN1 rewrite_tac[get_spec⌜$<⋎R⌝]);
a(rewrite_tac(map get_spec[⌜StrictLinearOrder⌝, ⌜StrictPartialOrder⌝, ⌜Trans⌝]) THEN REPEAT strip_tac);
save_pop_thm "ℝ_less_trans_thm"
);
=TEX
=SML
val ⦏ℝ_less_cases_thm⦎ = (
set_goal([], ⌜∀x y: ℝ⦁ x < y ∨ x = y ∨ y < x⌝);
a(LEMMA_T ⌜StrictLinearOrder(Universe, $<⋎R)⌝ ante_tac THEN1 rewrite_tac[get_spec⌜$<⋎R⌝]);
a(rewrite_tac(map get_spec[⌜StrictLinearOrder⌝, ⌜Trich⌝]) THEN REPEAT strip_tac);
a(all_asm_fc_tac[]);
save_pop_thm "ℝ_less_cases_thm"
);
=TEX
=SML
val ⦏ℝ_≤_cases_thm⦎ = (
set_goal([], ⌜∀x y: ℝ⦁ x ≤ y ∨ y ≤ x⌝);
a(rewrite_tac[get_spec⌜$≤⋎R⌝]);
a(REPEAT strip_tac THEN all_fc_tac[ℝ_less_cases_thm]);
save_pop_thm "ℝ_≤_cases_thm"
);
=TEX
=SML
val ⦏ℝ_≤_less_cases_thm⦎ = (
set_goal([], ⌜∀x y: ℝ⦁ x ≤ y ∨ y < x⌝);
a(rewrite_tac[get_spec⌜$≤⋎R⌝]);
a(REPEAT strip_tac THEN all_fc_tac[ℝ_less_cases_thm]);
save_pop_thm "ℝ_≤_less_cases_thm"
);
=TEX
=SML
val ⦏ℝ_eq_≤_thm⦎ = (
set_goal([], ⌜∀x y: ℝ⦁ x = y ⇔ x ≤ y ∧ y ≤ x⌝);
a(rewrite_tac[get_spec⌜$≤⋎R⌝] THEN REPEAT strip_tac THEN_TRY asm_rewrite_tac[]);
a(all_fc_tac[ℝ_less_antisym_thm]);
save_pop_thm "ℝ_eq_≤_thm"
);
=TEX
=SML
val ⦏ℝ_≤_antisym_thm⦎ = (
set_goal([], ⌜∀x y: ℝ⦁ x ≤ y ∧ y ≤ x  ⇒ x = y⌝);
a(rewrite_tac[ℝ_eq_≤_thm]);
save_pop_thm "ℝ_≤_antisym_thm"
);
=TEX
=SML
val ⦏ℝ_less_≤_trans_thm⦎ = (
set_goal([], ⌜∀x y z: ℝ⦁ x < y ∧ y ≤ z ⇒ x < z⌝);
a(rewrite_tac[get_spec⌜$≤⋎R⌝]);
a(REPEAT strip_tac THEN1 all_fc_tac[ℝ_less_trans_thm]);
a(all_var_elim_asm_tac1);
save_pop_thm "ℝ_less_≤_trans_thm"
);
=TEX
=SML
val ⦏ℝ_≤_less_trans_thm⦎ = (
set_goal([], ⌜∀x y z: ℝ⦁ x ≤ y ∧ y < z ⇒ x < z⌝);
a(rewrite_tac[get_spec⌜$≤⋎R⌝]);
a(REPEAT strip_tac THEN1 all_fc_tac[ℝ_less_trans_thm]);
a(all_var_elim_asm_tac1);
save_pop_thm "ℝ_≤_less_trans_thm"
);
=TEX
=SML
val ⦏ℝ_≤_refl_thm⦎ = (
set_goal([], ⌜∀x: ℝ⦁ x ≤ x⌝);
a(rewrite_tac[get_spec⌜$≤⋎R⌝]);
save_pop_thm "ℝ_≤_refl_thm"
);
=TEX
=SML
val ⦏ℝ_≤_trans_thm⦎ = (
set_goal([], ⌜∀x y z: ℝ⦁ x ≤ y ∧ y ≤ z ⇒ x ≤ z⌝);
a(rewrite_tac[get_spec⌜$≤⋎R⌝]);
a(REPEAT strip_tac THEN_TRY all_var_elim_asm_tac1 THEN REPEAT strip_tac);
a(all_fc_tac[ℝ_less_trans_thm]);
save_pop_thm "ℝ_≤_trans_thm"
);
=TEX
=SML
val ⦏ℝ_≤_¬_less_thm⦎ = (
set_goal([], ⌜∀x y: ℝ⦁ x ≤ y ⇔ ¬y < x⌝);
a(rewrite_tac[get_spec⌜$≤⋎R⌝] THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(contr_tac THEN all_fc_tac[ℝ_less_antisym_thm]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[ℝ_less_irrefl_thm]);
a(contr_tac THEN all_fc_tac[ℝ_less_cases_thm]);
save_pop_thm "ℝ_≤_¬_less_thm"
);
=TEX
=SML
val ⦏ℝ_¬_≤_less_thm⦎ = (
set_goal([], ⌜∀x y: ℝ⦁ ¬x ≤ y ⇔ y < x⌝);
a(rewrite_tac[ℝ_≤_¬_less_thm]);
save_pop_thm "ℝ_¬_≤_less_thm"
);
=TEX
=SML
val ⦏ℝ_less_¬_eq_thm⦎ = (
set_goal([], ⌜∀x y: ℝ⦁ x < y ⇒ ¬x = y⌝);
a(contr_tac THEN all_var_elim_asm_tac THEN all_fc_tac[ℝ_less_irrefl_thm]);
save_pop_thm "ℝ_less_¬_eq_thm"
);
=TEX
=SML
val ⦏ℝ_¬_less_≤_thm⦎ = conv_rule (ONCE_MAP_C eq_sym_conv) ℝ_≤_¬_less_thm;
=TEX
=SML
val ⦏ℝ_less_dense_thm⦎ = (
set_goal([], ⌜∀x y: ℝ⦁ x < y ⇒ ∃z⦁ x < z ∧ z < y⌝);
a(strip_asm_tac (get_spec⌜$<⋎R⌝));
a(POP_ASM_T (strip_asm_tac o rewrite_rule(map get_spec[⌜$DenseIn⌝])));
a(REPEAT strip_tac THEN all_asm_fc_tac[]);
a(∃_tac⌜a⌝ THEN REPEAT strip_tac);
save_pop_thm "ℝ_less_dense_thm"
);
=TEX
=SML
val ⦏ℝ_complete_thm⦎ = (
set_goal([], ⌜∀A : ℝ SET⦁
	¬A = {} ∧ (∃b⦁∀ x⦁ x ∈ A ⇒ x ≤ b) ⇒
	∃s⦁  (∀ x⦁ x ∈ A ⇒ x ≤ s)
∧	(∀ b⦁ (∀ x⦁ x ∈ A ⇒ x ≤ b) ⇒ s ≤ b)
⌝);
push_pc"sets_ext1";
a(REPEAT strip_tac);
a(LEMMA_T ⌜Complete(Universe, $<⋎R)⌝ ante_tac THEN1 prove_tac[get_spec⌜$<⋎R⌝]);
a(rewrite_tac(map get_spec[⌜Complete⌝, ⌜UnboundedAbove⌝, ⌜UpperBound⌝, ⌜$HasSupremum⌝]));
a(STRIP_T (strip_asm_tac o list_∀_elim[⌜{s|∃r⦁r ∈ A ∧ s < r}⌝, ⌜b⌝]));
(* *** Goal "1" *** *)
a(strip_asm_tac(∀_elim⌜x⌝ℝ_unbounded_below_thm));
a(spec_nth_asm_tac 2 ⌜y⌝ THEN all_asm_fc_tac[]);
(* *** Goal "2" *** *)
a(all_fc_tac[ℝ_less_dense_thm]);
a(spec_nth_asm_tac 3 ⌜z⌝ THEN all_asm_fc_tac[]);
(* *** Goal "3" *** *)
a(all_asm_fc_tac[]);
a(all_fc_tac[ℝ_less_≤_trans_thm]);
(* *** Goal "4" *** *)
a(POP_ASM_T ante_tac THEN rewrite_tac[ℝ_¬_less_≤_thm]);
a(REPEAT strip_tac THEN ∃_tac⌜y⌝ THEN REPEAT strip_tac);
(* *** Goal "4.1" *** *)
a(contr_tac THEN all_fc_tac[ℝ_≤_less_cases_thm]);
a(spec_nth_asm_tac 5 ⌜y⌝ THEN all_asm_fc_tac[ℝ_less_irrefl_thm]);
(* *** Goal "4.2" *** *)
a(GET_NTH_ASM_T 2 bc_thm_tac THEN REPEAT strip_tac);
a(all_asm_fc_tac[] THEN all_fc_tac[ℝ_less_≤_trans_thm]);
pop_pc();
save_pop_thm "ℝ_complete_thm"
);
=TEX
=SML
val _ = (
push_consistency_goal⌜Sup⌝;
a(prove_∃_tac THEN REPEAT strip_tac);
a(cases_tac⌜A' = {}⌝ THEN1 asm_rewrite_tac[]);
a(CASES_T2⌜¬(∃ b⦁ ∀ x⦁ x ∈ A' ⇒ x ≤ b)⌝ rewrite_thm_tac strip_asm_tac);
a(all_fc_tac[ℝ_complete_thm]);
a(∃_tac⌜s⌝ THEN REPEAT strip_tac THEN all_asm_fc_tac[]);
save_consistency_thm⌜Sup⌝ (pop_thm())
);
=TEX
=SML
val ⦏ℝ_sup_thm⦎ = (
set_goal([], ⌜∀A a⦁ ¬A = {} ∧ (∀x⦁x ∈ A ⇒ x ≤ a) ⇒
	(∀ x⦁ x ∈ A ⇒ x ≤ Sup A) ∧ (∀ b⦁ (∀ x⦁ x ∈ A ⇒ x ≤ b) ⇒ Sup A ≤ b)⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(strip_asm_tac (∀_elim⌜A⌝ (get_spec⌜Sup⌝)));
(* *** Goal "1.1" *** *)
a(spec_nth_asm_tac 1 ⌜a⌝ THEN all_asm_fc_tac[]);
(* *** Goal "1.2" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "2" *** *)
a(strip_asm_tac (∀_elim⌜A⌝ (get_spec⌜Sup⌝)));
(* *** Goal "2.1" *** *)
a(spec_nth_asm_tac 1 ⌜a⌝ THEN all_asm_fc_tac[]);
(* *** Goal "2.2" *** *)
a(all_asm_fc_tac[]);
save_pop_thm "ℝ_sup_thm"
);
=TEX
=SML
val ⦏ℝ_less_sup_thm⦎ = (
set_goal([], ⌜∀A⦁ ¬A = {} ∧ (∃a⦁∀x⦁x ∈ A ⇒ x ≤ a) ⇒
	(∀x⦁ x < Sup A ⇔ (∃y⦁y ∈ A ∧ x < y))⌝);
a(REPEAT ∀_tac THEN strip_tac);
a(strip_asm_tac (list_∀_elim[⌜A⌝, ⌜a⌝] ℝ_sup_thm) THEN1 all_asm_fc_tac[]);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(swap_nth_asm_concl_tac 1 THEN rewrite_tac[ℝ_¬_less_≤_thm]);
a(GET_NTH_ASM_T 2 bc_thm_tac THEN rewrite_tac[ℝ_≤_¬_less_thm]);
a(REPEAT strip_tac);
a(spec_nth_asm_tac 2 ⌜x'⌝);
(* *** Goal "2" *** *)
a(spec_nth_asm_tac 4 ⌜y⌝ THEN all_fc_tac[ℝ_less_≤_trans_thm]);
save_pop_thm "ℝ_less_sup_thm"
);
=TEX
=SML
val ⦏ℝ_less_sup_bc_thm⦎ = (
set_goal([], ⌜∀A x⦁ ¬A = {} ∧ (∃a⦁∀x⦁x ∈ A ⇒ x ≤ a) ∧ (∃y⦁y ∈ A ∧ x < y) ⇒ x < Sup A⌝);
a(REPEAT strip_tac);
a(strip_asm_tac (list_∀_elim[⌜A⌝] ℝ_less_sup_thm));
(* *** Goal "1" *** *)
a(spec_nth_asm_tac 1 ⌜a⌝ THEN all_asm_fc_tac[]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[]);
a(contr_tac THEN all_asm_fc_tac[]);
save_pop_thm "ℝ_less_sup_bc_thm"
);
=TEX
=SML
val ⦏ℝ_≤_sup_thm⦎ = (
set_goal([], ⌜∀A a⦁ ¬A = {} ∧ (∃a⦁∀x⦁x ∈ A ⇒ x ≤ a) ⇒
	(∀x⦁ x ≤ Sup A ⇔ (∀y⦁(∀z⦁z ∈ A ⇒ z ≤ y) ⇒ x ≤ y))⌝);
a(REPEAT ∀_tac THEN strip_tac);
a(strip_asm_tac (list_∀_elim[⌜A⌝, ⌜a⌝] ℝ_sup_thm) THEN1 all_asm_fc_tac[]);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(spec_nth_asm_tac 3 ⌜y⌝ THEN1 all_asm_fc_tac[]);
a(all_fc_tac[ℝ_≤_trans_thm]);
(* *** Goal "2" *** *)
a(spec_nth_asm_tac 1 ⌜Sup A⌝ THEN1 all_asm_fc_tac[]);
save_pop_thm "ℝ_≤_sup_thm"
);
=TEX
=SML
val ⦏ℝ_≤_sup_bc_thm⦎ = (
set_goal([], ⌜∀A a x⦁ ¬A = {} ∧ (∃a⦁∀x⦁x ∈ A ⇒ x ≤ a) ∧ (∀y⦁(∀z⦁z ∈ A ⇒ z ≤ y) ⇒ x ≤ y) ⇒
	x ≤ Sup A⌝);
a(REPEAT strip_tac);
a(strip_asm_tac (list_∀_elim[⌜A⌝, ⌜a⌝] ℝ_≤_sup_thm));
(* *** Goal "1" *** *)
a(spec_nth_asm_tac 1 ⌜a⌝ THEN1 all_asm_fc_tac[]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[]);
save_pop_thm "ℝ_≤_sup_bc_thm"
);
=TEX
=SML
val ⦏ℝ_∈_≤_sup_bc_thm⦎ = (
set_goal([], ⌜∀A x⦁ x ∈ A ∧ (∃a⦁∀x⦁x ∈ A ⇒ x ≤ a)  ⇒ x ≤ Sup A⌝);
a(REPEAT strip_tac);
a(lemma_tac⌜¬A = {}⌝ THEN1 PC_T1 "sets_ext" asm_prove_tac[]);
a(strip_asm_tac (list_∀_elim[⌜A⌝, ⌜a⌝] ℝ_≤_sup_thm));
(* *** Goal "1" *** *)
a(spec_nth_asm_tac 1 ⌜a⌝ THEN1 all_asm_fc_tac[]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[] THEN REPEAT strip_tac THEN all_asm_fc_tac[]);
save_pop_thm "ℝ_∈_≤_sup_bc_thm"
);
=TEX
=SML
val ⦏ℝ_⊆_sup_thm⦎ = (
set_goal([], ⌜∀A B⦁
	¬A = {} ∧ (∃a⦁∀x⦁x ∈ A ⇒ x ≤ a) ∧
	¬B = {} ∧ (∃b⦁∀y⦁y ∈ B ⇒ y ≤ b) ∧
	A ⊆ B ⇒	Sup A ≤ Sup B⌝);
a(REPEAT strip_tac);
a(strip_asm_tac (list_∀_elim[⌜A⌝, ⌜a⌝] ℝ_sup_thm) THEN1 all_asm_fc_tac[]);
a(strip_asm_tac (list_∀_elim[⌜B⌝, ⌜b⌝] ℝ_sup_thm) THEN1 all_asm_fc_tac[]);
a(DROP_NTH_ASM_T 5 (PC_T1 "sets_ext1" strip_asm_tac));
a(spec_nth_asm_tac 4 ⌜Sup B⌝);
a(all_asm_fc_tac [] THEN all_asm_fc_tac[]);
save_pop_thm "ℝ_⊆_sup_thm"
);
=TEX
=SML
val ⦏ℝ_sup_≤_bc_thm⦎ = (
set_goal([], ⌜∀A a x⦁ ¬A = {} ∧ (∃a⦁∀x⦁x ∈ A ⇒ x ≤ a) ∧ (∀y⦁y ∈ A ⇒ y ≤ x) ⇒
	Sup A ≤ x⌝);
a(REPEAT strip_tac);
a(strip_asm_tac (list_∀_elim[⌜A⌝, ⌜a⌝] ℝ_sup_thm) THEN all_asm_fc_tac[]);
save_pop_thm "ℝ_sup_≤_bc_thm"
);
=TEX
=SML
val ⦏ℝ_sup_less_bc_thm⦎ = (
set_goal([], ⌜∀A x z⦁ ¬A = {} ∧ (∃a⦁∀x⦁x ∈ A ⇒ x ≤ a) ∧ (∀y⦁y ∈ A ⇒ y ≤ x) ∧ x < z ⇒
	Sup A < z⌝);
a(REPEAT strip_tac);
a(lemma_tac⌜Sup A ≤ x⌝);
(* *** Goal "1" *** *)
a(bc_thm_tac ℝ_sup_≤_bc_thm);
a(REPEAT strip_tac THEN all_asm_fc_tac[]);
a(∃_tac⌜a⌝ THEN asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(all_asm_fc_tac[ℝ_≤_less_trans_thm]);
save_pop_thm "ℝ_sup_less_bc_thm"
);
=TEX
=SML
val ⦏ℝ_sup_eq_bc_thm⦎ = (
set_goal([], ⌜∀A a s⦁ ¬A = {} ∧ (∀x⦁x ∈ A ⇒ x ≤ s) ∧ (∀x⦁(∀y⦁y ∈ A ⇒ y ≤ x) ⇒ s ≤ x) ⇒
	Sup A = s⌝);
a(REPEAT strip_tac);
a(rewrite_tac[ℝ_eq_≤_thm] THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(bc_thm_tac ℝ_sup_≤_bc_thm THEN asm_rewrite_tac[]);
a(∃_tac⌜s⌝ THEN REPEAT strip_tac THEN all_asm_fc_tac[]);
(* *** Goal "2" *** *)
a(bc_thm_tac ℝ_≤_sup_bc_thm THEN asm_rewrite_tac[]);
a(∃_tac⌜s⌝ THEN REPEAT strip_tac THEN all_asm_fc_tac[]);
save_pop_thm "ℝ_sup_eq_bc_thm"
);
=TEX
=SML
val ⦏ℝ_eq_sup_bc_thm⦎ = (
set_goal([], ⌜∀A a s⦁ ¬A = {} ∧ (∀x⦁x ∈ A ⇒ x ≤ s) ∧ (∀x⦁(∀y⦁y ∈ A ⇒ y ≤ x) ⇒ s ≤ x) ⇒
	s = Sup A⌝);
a(REPEAT strip_tac THEN conv_tac eq_sym_conv);
a(bc_thm_tac ℝ_sup_eq_bc_thm THEN all_asm_ante_tac THEN taut_tac);
save_pop_thm "ℝ_eq_sup_bc_thm"
);
=TEX
The following principle about suprema will be useful:
=SML
val ⦏ℝ_less_sup_∈_thm⦎ = (
set_goal([], ⌜∀A a⦁ ¬A = {} ∧ (∀x⦁x ∈ A ⇒ x ≤ a) ∧ ¬Sup A ∈ A ⇒
	(∀x⦁ x < Sup A ⇒ ∃y⦁ x < y ∧ y < Sup A ∧ y ∈ A)⌝);
a(REPEAT ∀_tac THEN strip_tac);
a(strip_asm_tac (list_∀_elim[⌜A⌝, ⌜a⌝] ℝ_sup_thm) THEN1 all_asm_fc_tac[]);
a(contr_tac THEN lemma_tac⌜Sup A ≤ x⌝);
(* *** Goal "1" *** *)
a(GET_NTH_ASM_T 3 bc_thm_tac THEN REPEAT strip_tac);
a(contr_tac THEN POP_ASM_T (strip_asm_tac o rewrite_rule[ℝ_¬_≤_less_thm]));
a(spec_nth_asm_tac 3 ⌜x'⌝);
a(POP_ASM_T (strip_asm_tac o rewrite_rule[ℝ_¬_less_≤_thm]));
a(spec_nth_asm_tac 7 ⌜x'⌝);
a(lemma_tac⌜x' = Sup A⌝ THEN1 (rewrite_tac[ℝ_eq_≤_thm] THEN REPEAT strip_tac));
a(all_var_elim_asm_tac1);
(* *** Goal "2" *** *)
a(all_fc_tac[ℝ_less_≤_trans_thm] THEN all_fc_tac[ℝ_less_irrefl_thm]);
save_pop_thm "ℝ_less_sup_∈_thm"
);
=TEX
\section{CONSISTENCY OF ADDITION}
In this section we prove that the definition of
=INLINEFT
$+⋎R
=TEX
\ is consistent.
The proof is long. We begin with a series of lemmas (after the following
red tape).

=SML
end (* of structure ℝ part 2 *);
structure ⦏ℝ⦎ (* : ℝ *) = struct
open ℝ;
=TEX

\subsection{Miscellaneous Lemmas}
The first lemma is just a convenience.
=SML
val ⦏plus_exists_lemma1⦎ = (
set_goal([], ⌜∀x y⦁ y dy_less x ⇒ ∃z⦁ x dy_times z dy_less y ∧ z dy_less dy_one⌝);
a(REPEAT strip_tac);
a(strip_asm_tac (∀_elim ⌜y⌝ dy_balance_thm1));
a(strip_asm_tac (∀_elim ⌜x dy_times y'⌝ dy_balance_thm2));
a(lemma_tac⌜x dy_times y'' dy_less y⌝);
(* *** Goal "1" *** *)
a(ALL_FC_T (MAP_EVERY ante_tac) [dy_less_trans_thm]);
a(rewrite_tac[list_∀_elim[⌜x⌝, ⌜y'⌝]dy_times_comm_thm, list_∀_elim[⌜y⌝, ⌜y'⌝]dy_times_comm_thm]);
a(rewrite_tac[dy_times_assoc_thm, dy_times_mono_⇔_thm]);
(* *** Goal "2" *** *)
a(∃_tac ⌜y''⌝ THEN REPEAT strip_tac);
a(strip_asm_tac (list_∀_elim[⌜y''⌝, ⌜dy_one⌝]dy_less_trich_thm));
(* *** Goal "2.1" *** *)
a(all_var_elim_asm_tac1);
a(POP_ASM_T (strip_asm_tac o rewrite_rule[dy_times_unit_thm]));
a(all_fc_tac[dy_less_antisym_thm]);
(* *** Goal "2.2" *** *)
a(lemma_tac⌜x dy_less y⌝ THEN_LIST
	[bc_thm_tac dy_less_trans_thm, all_fc_tac[dy_less_antisym_thm]]);
a(∃_tac⌜x dy_times y''⌝ THEN REPEAT strip_tac);
a(strip_asm_tac(list_∀_elim[⌜x⌝, ⌜dy_one⌝, ⌜y''⌝] dy_times_mono_thm1));
a(once_rewrite_tac[dy_times_comm_thm]);
a(POP_ASM_T ante_tac THEN rewrite_tac[once_rewrite_rule[dy_times_comm_thm] dy_times_unit_thm]);
pop_thm()
);
=TEX
The second lemma is a simple consequence of
=INLINEFT
minimum_¬_thm
=TEX
.
=SML
val ⦏plus_exists_lemma2⦎ = (
set_goal([], ⌜∀p m⦁ p 0 ∧ ¬p m ⇒ ∃n⦁p n ∧ ¬p (n+1)⌝);
a(REPEAT strip_tac);
a(all_fc_tac[minimum_¬_thm]);
a(spec_nth_asm_tac 2 ⌜m'⌝);
a(contr_tac THEN all_asm_fc_tac[]);
pop_thm()
);
=TEX
The next lemma is the analogue for the dyadic
rationals of the less/less-or-equal transitivity theorems.
=SML
val ⦏plus_exists_lemma3⦎ = (
set_goal([], ⌜∀a b c⦁ a dy_less b ∧ ¬c dy_less b ⇒ a dy_less c⌝);
a(REPEAT strip_tac);
a(cases_tac⌜b = c⌝ THEN1 (all_var_elim_asm_tac THEN all_fc_tac[dy_less_irrefl_thm]));
a(fc_tac[dy_less_trich_thm]);
a(all_fc_tac[dy_less_trans_thm]);
pop_thm()
);
=TEX
Similarly next lemma is the analogue for the dyadic
rationals of the less-or-equal/less transitivity theorems.
=SML
val ⦏plus_exists_lemma4⦎ = (
set_goal([], ⌜∀a b c⦁ ¬b dy_less a ∧ b dy_less c ⇒ a dy_less c⌝);
a(REPEAT strip_tac);
a(cases_tac⌜a = b⌝ THEN1 (all_var_elim_asm_tac THEN all_fc_tac[dy_less_irrefl_thm]));
a(fc_tac[dy_less_trich_thm]);
a(all_fc_tac[dy_less_trans_thm]);
pop_thm()
);
=TEX
The next lemma builds on the right balance theorem a little.
(Commented out - no plans to use at the moment.)
=SML
(*
val ⦏plus_exists_lemmaX⦎ = (
set_goal([], ⌜∀a⦁ ∃b⦁ dy_one dy_less a dy_times b ∧ dy_one dy_less b⌝);
a(REPEAT strip_tac);
a(strip_asm_tac(∀_elim⌜a⌝ dy_balance_thm1));
a(cases_tac⌜dy_one dy_less y⌝);
(* *** Goal "1" *** *)
a(∃_tac⌜y⌝ THEN REPEAT strip_tac);
(* *** Goal "2" *** *)
a(strip_asm_tac (rewrite_rule[dy_times_unit_clauses](∀_elim⌜dy_one⌝ dy_balance_thm1)));
a(∃_tac⌜y'⌝ THEN REPEAT strip_tac);
a(all_fc_tac[plus_exists_lemma4]);
a(bc_thm_tac dy_less_trans_thm THEN ∃_tac ⌜a dy_times y⌝ THEN REPEAT strip_tac);
a(bc_thm_tac dy_times_mono_thm THEN REPEAT strip_tac);
pop_thm()
);
*)
=TEX
More on balance:
=SML
val ⦏plus_exists_lemma5⦎ = (
set_goal([], ⌜∀a b⦁ ∃c⦁ b dy_less a dy_times c⌝);
a(REPEAT strip_tac);
a(strip_asm_tac(∀_elim⌜a⌝ dy_balance_thm1));
a(∃_tac⌜y dy_times b⌝);
a(LEMMA_T⌜dy_one dy_times b dy_less (a dy_times y) dy_times b⌝ ante_tac
	THEN_LIST [bc_thm_tac dy_times_mono_thm1 THEN REPEAT strip_tac,
		rewrite_tac[dy_times_assoc_thm, dy_times_unit_clauses]]);
pop_thm()
);
=TEX
The next lemma helps with our use of the archimedean property.
=SML
val ⦏plus_exists_lemma6⦎ = (
set_goal([], ⌜∀a b d⦁ a dy_less b ∧ dy_one dy_less d ⇒
	∃m⦁	 a dy_times d dy_exp m dy_less b ∧
		¬a dy_times d dy_exp (m+1) dy_less b⌝);
a(REPEAT strip_tac);
a(bc_thm_tac (rewrite_rule[](∀_elim ⌜
	λm⦁a dy_times d dy_exp m dy_less b⌝ plus_exists_lemma2)));
a(asm_rewrite_tac[dy_exp_clauses, dy_times_unit_thm]);
a(strip_asm_tac(list_∀_elim[⌜a⌝, ⌜b⌝] plus_exists_lemma5));
a(strip_asm_tac (list_∀_elim[⌜d⌝, ⌜c⌝]dy_arch_thm));
a(∃_tac⌜t⌝ THEN contr_tac);
a(LEMMA_T⌜a dy_times d dy_exp t dy_less a dy_times d dy_exp t⌝
	(strip_asm_tac o rewrite_rule[dy_less_irrefl_thm]));
a(bc_thm_tac dy_less_trans_thm THEN ∃_tac⌜b⌝ THEN REPEAT strip_tac);
a(bc_thm_tac dy_less_trans_thm THEN ∃_tac⌜a dy_times c⌝ THEN REPEAT strip_tac);
a(bc_thm_tac dy_times_mono_thm THEN REPEAT strip_tac);
pop_thm()
);
=TEX
Yet more to do with the archimedean property:
=SML
val ⦏plus_exists_lemma7⦎ = (
set_goal([], ⌜∀a b d⦁ a dy_less b ∧ dy_one dy_less d ⇒
	∃m⦁	 b dy_less a dy_times d dy_exp m⌝);
a(REPEAT strip_tac);
a(all_fc_tac[plus_exists_lemma6]);
a(∃_tac⌜(m'+1) + 1⌝ THEN once_rewrite_tac[dy_exp_clauses]);
a(bc_thm_tac plus_exists_lemma4 THEN ∃_tac⌜a dy_times d dy_exp (m' + 1)⌝ THEN REPEAT strip_tac);
a(rewrite_tac[dy_exp_clauses] );
a(LEMMA_T ⌜ a dy_times (d dy_exp m') dy_times d dy_times dy_one
	   dy_less a dy_times ((d dy_exp m') dy_times d) dy_times d⌝ ante_tac THEN_LIST
	[bc_thm_tac dy_times_mono_thm THEN REPEAT strip_tac,
	 rewrite_tac[dy_times_unit_clauses]]);
a(rewrite_tac[conv_rule (ONCE_MAP_C eq_sym_conv) dy_times_assoc_thm]);
a(bc_thm_tac dy_times_mono_thm THEN REPEAT strip_tac);
pop_thm()
);
=TEX
The following is used in the proof of the existence of additive inverses
to show that the set whose supremum is the inverse is non-empty.
Unsurprisingly, this is a point at which the second balance theorem makes
a crucial appearance:
=SML
val ⦏plus_exists_lemma8⦎ = (
set_goal([], ⌜∀c⦁∃b⦁∀a⦁ a dy_less c ⇒ a dy_times b dy_less dy_one⌝);
a(REPEAT strip_tac);
a(strip_asm_tac(∀_elim⌜c⌝dy_balance_thm2));
a(∃_tac⌜y⌝ THEN REPEAT strip_tac);
a(bc_thm_tac dy_less_trans_thm THEN ∃_tac ⌜c dy_times y⌝ THEN REPEAT strip_tac);
a(bc_thm_tac dy_times_mono_thm1 THEN REPEAT strip_tac);
pop_thm()
);
=TEX
=TEX
The following is used to show that the set whose limit is the additive
inverse of a real number is bounded above.
=SML
val ⦏plus_exists_lemma8⦎ = (
set_goal([], ⌜∀c⦁∃b⦁∀a⦁ a dy_less c ⇒ a dy_times b dy_less dy_one⌝);
a(REPEAT strip_tac);
a(strip_asm_tac(∀_elim⌜c⌝dy_balance_thm2));
a(∃_tac⌜y⌝ THEN REPEAT strip_tac);
a(bc_thm_tac dy_less_trans_thm THEN ∃_tac ⌜c dy_times y⌝ THEN REPEAT strip_tac);
a(bc_thm_tac dy_times_mono_thm1 THEN REPEAT strip_tac);
pop_thm()
);
=TEX
The following makes the right density theorem a bit easier to use (by throwing in the
fact that the addend it gives is positive):
=SML
val ⦏plus_exists_lemma9⦎ = (
set_goal([], ⌜∀a b⦁ a dy_less b ⇒ ∃c⦁
	dy_one dy_less c ∧ a dy_less a dy_times c ∧ a dy_times c dy_less b⌝);
a(REPEAT strip_tac);
a(all_fc_tac[dy_right_dense_thm]);
a(∃_tac⌜z⌝ THEN REPEAT strip_tac);
a(LEMMA_T⌜a dy_times dy_one dy_less a dy_times z⌝ ante_tac THEN_LIST
	[asm_rewrite_tac[dy_times_unit_thm],
	 rewrite_tac[dy_times_mono_⇔_thm]]);
pop_thm()
);
=TEX
The following is another convenience (and could have been put to good use
in several earlier proofs).
=SML
val ⦏plus_exists_lemma10⦎ = (
set_goal([], ⌜∀a b⦁ dy_one dy_less a ⇒ b dy_less b dy_times a⌝);
a(REPEAT strip_tac);
a(LEMMA_T⌜b dy_times dy_one dy_less b dy_times a⌝ ante_tac THEN_LIST
	[asm_rewrite_tac[dy_times_mono_⇔_thm],
	 rewrite_tac[dy_times_unit_thm]]);
pop_thm()
);
=TEX
The following is used in proving the existence of additive inverses.
(The context being where $a$ and $b$ are within $c$ of two limits
and we want to argue that $a + b$ is within $2\times c$ of the sum of the limits).
=SML
val ⦏plus_exists_lemma11⦎ = (
set_goal([], ⌜∀a b⦁ a dy_less b ⇒ ∃c⦁
	dy_one dy_less c ∧
	a dy_less a dy_times c dy_times c ∧
	a dy_times c dy_times c dy_less b⌝);
a(REPEAT strip_tac);
a(all_fc_tac[plus_exists_lemma9]);
a(all_fc_tac[∀_elim⌜a dy_times c⌝plus_exists_lemma9]);
a(cases_tac⌜c dy_less c'⌝);
(* *** Goal "1" *** *)
a(∃_tac ⌜c⌝ THEN REPEAT strip_tac);
(* *** Goal "1.1" *** *)
a(bc_thm_tac dy_less_trans_thm THEN ∃_tac ⌜a dy_times c⌝ THEN REPEAT strip_tac);
a(asm_rewrite_tac[∀_elim⌜c⌝dy_times_order_thm, dy_times_mono_⇔_thm]);
a(ALL_FC_T rewrite_tac [plus_exists_lemma10]);
(* *** Goal "1.2" *** *)
a(bc_thm_tac dy_less_trans_thm THEN ∃_tac ⌜(a dy_times c) dy_times c'⌝ THEN REPEAT strip_tac);
a(asm_rewrite_tac[dy_times_assoc_thm, dy_times_mono_⇔_thm]);
(* *** Goal "2" *** *)
a(∃_tac ⌜c'⌝ THEN REPEAT strip_tac);
(* *** Goal "2.1" *** *)
a(bc_thm_tac dy_less_trans_thm THEN ∃_tac ⌜a dy_times c'⌝ THEN REPEAT strip_tac);
(* *** Goal "2.1.1" *** *)
a(ALL_FC_T rewrite_tac [plus_exists_lemma10]);
(* *** Goal "2.1.2" *** *)
a(rewrite_tac[conv_rule(ONCE_MAP_C eq_sym_conv) dy_times_assoc_thm]);
a(ALL_FC_T rewrite_tac [plus_exists_lemma10]);
(* *** Goal "2.2" *** *)
a(bc_thm_tac plus_exists_lemma4 THEN ∃_tac ⌜(a dy_times c) dy_times c'⌝ THEN REPEAT strip_tac);
a(rewrite_tac[dy_times_assoc_thm, dy_times_mono_⇔_thm]);
a(once_rewrite_tac[dy_times_comm_thm]);
a(asm_rewrite_tac[dy_times_mono_⇔_thm]);
pop_thm()
);
=TEX
\subsection{Statement of the Theorem}

Now we embark on the main consistency proof.
=SML
val ⦏ℝ_plus_exists_thm⦎ = (
declare_infix(300, "pl");
declare_infix(300, "pld");
set_goal([], ⌜∃$pl:ℝ → ℝ → ℝ; zero : ℝ⦁
	(∀x y z⦁ (x pl y) pl z = x pl (y pl z))
∧	(∀x y⦁ x pl y = y pl x)
∧	(∀x⦁ x pl zero = x)
∧	(∃one⦁zero < one)
∧	(∀x⦁ ∃y⦁ x pl y = zero)
∧	(∀x y z⦁ y < z ⇒ x pl y < x pl z)
⌝);
(*
=TEX
\subsection{Getting Started}
We warm up by introducing names for various items we will need.
The function $i$ sends a real number $x$ to the cut in the dyadic
rationals that has $x$ as its supremum.
The function $s$ is the right inverse of $i$.
The infix operator $pld$ is the operator on cuts that will induce the
addition on the reals. Finally the operator $pl$ is the addition
operator we seek.
=SML
*)
a(strip_asm_tac (get_spec⌜$<⋎R⌝));
a(LIST_DROP_NTH_ASM_T [3, 4, 5, 6] discard_tac);
a(POP_ASM_T (strip_asm_tac o rewrite_rule[get_spec⌜$DenseIn⌝]));
a(lemma_tac⌜∃i⦁ ∀x⦁ i x = {a | ι a < x}⌝ THEN1 prove_∃_tac);
a(lemma_tac⌜∃s⦁ ∀A⦁ s A = Sup{y | ∃a⦁a ∈ A ∧ y < ι a}⌝ THEN1 prove_∃_tac);
a(lemma_tac⌜∃$pld⦁
	∀A B⦁ A pld B = {c | ∃a b⦁ a ∈ A ∧ b ∈ B ∧ c dy_less a dy_times b}⌝
	THEN1 prove_∃_tac);
a(lemma_tac⌜∃$pl⦁ ∀x y⦁ x pl y = s( i x pld i y )⌝ THEN1 prove_∃_tac);
(*
=TEX
\subsection{A lemma about $s$ and $i$}

Subgoal 1: our first job is to show that $s$ is a left-inverse for $i$:
=SML
*)
a(lemma_tac⌜∀x⦁s(i x) = x⌝);
(* *** Goal "1" *** *)
a(LIST_DROP_NTH_ASM_T [1, 2, 3, 4] rewrite_tac THEN REPEAT strip_tac);
a(bc_thm_tac ℝ_sup_eq_bc_thm);
a(PC_T1 "sets_ext1" REPEAT strip_tac);
(* *** Goal "1.1" *** *)
a(strip_asm_tac(∀_elim⌜x⌝ℝ_unbounded_below_thm));
a(list_spec_nth_asm_tac 2 [⌜y⌝, ⌜x⌝] THEN all_var_elim_asm_tac1);
a(∃_tac⌜y⌝ THEN rewrite_tac[]);
a(∃_tac⌜a'⌝ THEN REPEAT strip_tac);
(* *** Goal "1.2" *** *)
a(asm_rewrite_tac[get_spec⌜$≤⋎R⌝] THEN all_fc_tac[ℝ_less_trans_thm] THEN REPEAT strip_tac);
(* *** Goal "1.3" *** *)
a(rewrite_tac[ℝ_≤_¬_less_thm] THEN contr_tac);
a(list_spec_nth_asm_tac 3 [⌜x'⌝, ⌜x⌝] THEN all_var_elim_asm_tac1);
a(list_spec_nth_asm_tac 5 [⌜x'⌝, ⌜ι a'⌝] THEN all_var_elim_asm_tac1);
a(spec_nth_asm_tac 6 ⌜ι a''⌝);
(* *** Goal "1.3.1" *** *)
a(spec_nth_asm_tac 1 ⌜a'⌝);
(* *** Goal "1.3.2" *** *)
a(all_asm_fc_tac[ℝ_≤_less_trans_thm] THEN all_asm_fc_tac[ℝ_less_irrefl_thm]);
(*
=TEX
\subsection{A lemma about $s$, $i$ and $pld$}

Subgoal 2: next we show that $i$ is a left inverse for $s$ when restricted $s$
to representatives of numbers of the form $x + y$.
This fact gives a rewrite rule that streamlines the proof of associativity.
=SML
*)
(* *** Goal "2" *** *)
a(lemma_tac⌜∀x y⦁ i(s(i x pld i y)) = i x pld i y⌝ THEN1 REPEAT strip_tac);
(* *** Goal "2.1" *** *)
a(LIST_DROP_NTH_ASM_T [1, 2, 3, 4, 5] rewrite_tac);
a(PC_T1 "sets_ext" REPEAT strip_tac);
(* *** Goal "2.1.1" *** *)
a(lemma_tac⌜¬{y'|∃ a ⦁ (∃ a' b⦁ ι a' < x ∧ ι b < y ∧ a dy_less a' dy_times b) ∧ y' < ι a} = {}⌝);
(* *** Goal "2.1.1.1" *** *)
a(PC_T1 "sets_ext" REPEAT strip_tac);
a(strip_asm_tac(∀_elim⌜x⌝ℝ_unbounded_below_thm));
a(list_spec_nth_asm_tac 3 [⌜y'⌝, ⌜x⌝] THEN all_var_elim_asm_tac1);
a(strip_asm_tac(∀_elim⌜y⌝ℝ_unbounded_below_thm));
a(list_spec_nth_asm_tac 6 [⌜y''⌝, ⌜y⌝] THEN all_var_elim_asm_tac1);
a(list_spec_nth_asm_tac 8 [⌜y'⌝, ⌜ι a'⌝] THEN all_var_elim_asm_tac1);
a(list_spec_nth_asm_tac 10 [⌜y''⌝, ⌜ι a''⌝] THEN all_var_elim_asm_tac1);
a(strip_asm_tac(∀_elim⌜ι (a''' dy_times a'''')⌝ℝ_unbounded_below_thm));
a(∃_tac⌜y'''⌝ THEN rewrite_tac[]);
a(∃_tac⌜a''' dy_times a''''⌝ THEN REPEAT strip_tac);
(* *** Goal "2.1.1.1.1" *** *)
a(∃_tac⌜a'⌝ THEN ∃_tac⌜a''⌝ THEN REPEAT strip_tac);
a(bc_thm_tac dy_times_mono_thm2);
a(LIST_DROP_NTH_ASM_T [2, 4] (MAP_EVERY ante_tac) THEN asm_rewrite_tac[] THEN taut_tac);
(* *** Goal "2.1.1.2" *** *)
a(LEMMA_T⌜∃d⦁∀w⦁
	w ∈ {y'|∃ a ⦁ (∃ a' b⦁ ι a' < x ∧ ι b < y ∧ a dy_less a' dy_times b) ∧ y' < ι a}
	⇒ w ≤ d⌝ asm_tac);
(* *** Goal "2.1.1.2.1" *** *)
a(strip_asm_tac(∀_elim⌜x⌝ℝ_unbounded_above_thm));
a(list_spec_nth_asm_tac 4 [⌜x⌝, ⌜y'⌝] THEN all_var_elim_asm_tac1);
a(strip_asm_tac(∀_elim⌜y⌝ℝ_unbounded_above_thm));
a(list_spec_nth_asm_tac 7 [⌜y⌝, ⌜y''⌝] THEN all_var_elim_asm_tac1);
a(∃_tac⌜ι (a' dy_times a'')⌝ THEN REPEAT strip_tac);
a(lemma_tac ⌜ι a < ι (a''' dy_times b)⌝ THEN1 asm_rewrite_tac[]);
a(lemma_tac ⌜w < ι (a''' dy_times b)⌝ THEN1 all_fc_tac[ℝ_less_trans_thm]);
a(lemma_tac ⌜ι (a''' dy_times b) <  ι (a' dy_times a'')⌝);
(* *** Goal "2.1.1.2.1.1" *** *)
a(asm_rewrite_tac[] THEN bc_thm_tac dy_times_mono_thm2);
a(lemma_tac ⌜ι a''' < ι a' ∧ ι b < ι a''⌝ THEN1
	(REPEAT strip_tac THEN all_fc_tac[ℝ_less_trans_thm]));
a(LIST_DROP_NTH_ASM_T [1, 2] (MAP_EVERY ante_tac) THEN asm_rewrite_tac[] THEN taut_tac);
(* *** Goal "2.1.1.2.1.2" *** *)
a(rewrite_tac[get_spec⌜$≤⋎R⌝] THEN all_fc_tac[ℝ_less_trans_thm] THEN REPEAT strip_tac);
(* *** Goal "2.1.1.2.2" *** *)
a(ante_tac (∀_elim⌜{y'|∃ a ⦁ (∃ a' b⦁ ι a' < x ∧ ι b < y ∧ a dy_less a' dy_times b) ∧ y' < ι a}⌝
	 ℝ_less_sup_thm));
a(LIST_DROP_NTH_ASM_T [1,2] rewrite_tac);
a(STRIP_T (fn th => all_fc_tac[th]));
a(∃_tac ⌜a'⌝ THEN ∃_tac⌜b⌝ THEN REPEAT strip_tac);
a(all_fc_tac[ℝ_less_trans_thm]);
a(POP_ASM_T ante_tac THEN asm_rewrite_tac[]);
a(REPEAT strip_tac THEN all_fc_tac[dy_less_trans_thm]);
(* *** Goal "2.1.2" *** *)
a(bc_thm_tac ℝ_less_sup_bc_thm);
a(REPEAT strip_tac);
(* *** Goal "2.1.2.1" *** *)
a(PC_T1 "sets_ext1" REPEAT strip_tac);
a(∃_tac ⌜ι x'⌝ THEN rewrite_tac[]);
a(all_fc_tac[dy_less_dense_thm]);
a(∃_tac ⌜z⌝ THEN REPEAT strip_tac);
(* *** Goal "2.1.2.1.1" *** *)
a(∃_tac ⌜a⌝ THEN ∃_tac ⌜b⌝ THEN REPEAT strip_tac);
(* *** Goal "2.1.2.1.2" *** *)
a(DROP_NTH_ASM_T 2 ante_tac THEN asm_rewrite_tac[]);
(* *** Goal "2.1.2.2" *** *)
a(strip_asm_tac(∀_elim⌜x⌝ℝ_unbounded_above_thm));
a(list_spec_nth_asm_tac 5 [⌜x⌝, ⌜y'⌝] THEN all_var_elim_asm_tac1);
a(strip_asm_tac(∀_elim⌜y⌝ℝ_unbounded_above_thm));
a(list_spec_nth_asm_tac 8 [⌜y⌝, ⌜y''⌝] THEN all_var_elim_asm_tac1);
a(∃_tac⌜ι(a'' dy_times a''')⌝ THEN REPEAT strip_tac);
a(rewrite_tac[get_spec⌜$≤⋎R⌝] THEN ∨_left_tac);
a(lemma_tac ⌜ι a' < ι (a'''' dy_times b')⌝ THEN1 asm_rewrite_tac[]);
a(lemma_tac ⌜x'' < ι (a'''' dy_times b')⌝ THEN1 all_fc_tac[ℝ_less_trans_thm]);
a(lemma_tac ⌜ι (a'''' dy_times b') <  ι (a'' dy_times a''')⌝);
(* *** Goal "2.1.2.2.1" *** *)
a(asm_rewrite_tac[] THEN bc_thm_tac dy_times_mono_thm2);
a(LEMMA_T⌜ι a''''  < ι a'' ∧ ι b' < ι a'''⌝ ante_tac THEN1
	(REPEAT strip_tac THEN all_fc_tac[ℝ_less_trans_thm]));
a(asm_rewrite_tac[] THEN taut_tac);
(* *** Goal "2.1.2.2.2" *** *)
a(all_fc_tac[ℝ_less_trans_thm]);
(* *** Goal "2.1.2.3" *** *)
a(all_fc_tac[dy_less_dense_thm]);
a(∃_tac ⌜ι z⌝ THEN REPEAT strip_tac THEN asm_rewrite_tac[]);
a(all_fc_tac[∀_elim ⌜z⌝dy_less_dense_thm]);
a(∃_tac ⌜z'⌝ THEN REPEAT strip_tac);
a(∃_tac ⌜a⌝ THEN ∃_tac ⌜b⌝ THEN REPEAT strip_tac);
(*
=TEX
\subsection{The Witnesses}

Subgoal 2.2: we now introduce the witnesses and strip off the first four properties
to be proved.
The proofs of the existence of inverses and of the ordering property share a lemma
so we don't strip them apart at this stage.
(which is why we contrived in the statement of the theorem to put them together at
the end).

=SML
*)
(* *** Goal "2.2" *** *)
a(∃_tac⌜$pl⌝ THEN ∃_tac ⌜ι dy_one⌝ THEN REPEAT_N 4 strip_tac);
(*
=TEX
\subsection{Associativity}

Subgoal 2.2.1: associativity: the operator $pld$ is associative. However,
inferring the associativity of $pl$ from this fact requires us to reason
about suprema. The rewrite rule that we have just finished proving
lets us rewrite the goal in the form $s(a) = s(b)$ where $a$ and $b$ do not
involve $s$. We then prove $a = b$ and so avoid further reasoning about suprema.
=SML
*)
(* *** Goal "2.2.1" *** *)
a(LIST_GET_NTH_ASM_T[1, 3] rewrite_tac);
a(LEMMA_T ⌜∀ x y z⦁ (i x pld i y) pld i z = i x pld (i y pld i z)⌝ rewrite_thm_tac);
a(REPEAT strip_tac THEN asm_rewrite_tac[]);
a(rename_tac[] THEN PC_T1 "sets_ext" REPEAT strip_tac);
(* *** Goal "2.2.1.1" *** *)
a(∃_tac ⌜a'⌝ THEN ∃_tac ⌜b' dy_times b⌝ THEN REPEAT strip_tac);
(* *** Goal "2.2.1.1.1" *** *)
a(list_spec_nth_asm_tac 12 [⌜ι b'⌝, ⌜y⌝] THEN all_var_elim_asm_tac1);
a(∃_tac ⌜a'''⌝ THEN ∃_tac ⌜b⌝ THEN REPEAT strip_tac);
a(bc_thm_tac dy_times_mono_thm1);
a(DROP_NTH_ASM_T 2 ante_tac THEN asm_rewrite_tac[]);
(* *** Goal "2.2.1.1.2" *** *)
a(bc_thm_tac dy_less_trans_thm THEN ∃_tac⌜a dy_times b⌝ THEN REPEAT strip_tac);
a(rewrite_tac[conv_rule (ONCE_MAP_C eq_sym_conv) dy_times_assoc_thm]);
a(bc_thm_tac dy_times_mono_thm1 THEN REPEAT strip_tac);
(* *** Goal "2.2.1.2" *** *)
a(∃_tac ⌜a dy_times a'⌝ THEN ∃_tac ⌜b'⌝ THEN REPEAT strip_tac);
(* *** Goal "2.2.1.2.1" *** *)
a(list_spec_nth_asm_tac 12 [⌜ι a⌝, ⌜x⌝] THEN all_var_elim_asm_tac1);
a(∃_tac ⌜a'''⌝ THEN ∃_tac ⌜a'⌝ THEN REPEAT strip_tac);
a(bc_thm_tac dy_times_mono_thm1);
a(DROP_NTH_ASM_T 2 ante_tac THEN asm_rewrite_tac[]);
(* *** Goal "2.2.1.2.2" *** *)
a(bc_thm_tac dy_less_trans_thm THEN ∃_tac⌜a dy_times b⌝ THEN REPEAT strip_tac);
a(rewrite_tac[dy_times_assoc_thm]);
a(bc_thm_tac dy_times_mono_thm THEN REPEAT strip_tac);
(*
=TEX
\subsection{Commutativity}

Subgoal 2.2.2: commutativity: the operator $pld$ is commutative and this immediately
implies that $pl$ is commutative.
=SML
*)
(* *** Goal "2.2.2" *** *)
a(GET_NTH_ASM_T 3 rewrite_thm_tac);
a(LEMMA_T ⌜∀ A B⦁ A pld B = B pld A⌝ (rewrite_thm_tac o ∀_elim ⌜i x⌝));
a(asm_rewrite_tac[] THEN PC_T1 "sets_ext" REPEAT strip_tac);
(* *** Goal "2.2.2.1" (and (2.2.2.2")) *** *)
a(∃_tac⌜b⌝ THEN ∃_tac⌜a⌝ THEN once_rewrite_tac[dy_times_comm_thm] THEN REPEAT strip_tac);
(*
=TEX
\subsection{Unit Property}

Subgoal 2.2.3: unit property: the operator $pld$ will not in general have a unit.
However, the unit exists ``up to a supremum'' for the sets that represent real numbers.
=SML
*)
(* *** Goal "2.2.3" *** *)
a(LIST_GET_NTH_ASM_T[1, 3] rewrite_tac);
a(LEMMA_T ⌜∀ x⦁ i x pld i(ι dy_one) = i x⌝ rewrite_thm_tac
	THEN_LIST[id_tac, GET_NTH_ASM_T 2 rewrite_thm_tac]);
a(asm_rewrite_tac[] THEN PC_T1 "sets_ext" REPEAT strip_tac);
(* *** Goal "2.2.3.1" *** *)
a(bc_thm_tac ℝ_less_trans_thm THEN ∃_tac⌜ι a⌝ THEN REPEAT strip_tac);
a(asm_rewrite_tac[] THEN bc_thm_tac dy_less_trans_thm THEN
	∃_tac⌜a dy_times b⌝ THEN REPEAT strip_tac);
a(LEMMA_T ⌜a dy_times b dy_less a dy_times dy_one⌝ ante_tac
	THEN_LIST[id_tac, rewrite_tac[dy_times_unit_thm]]);
a(bc_thm_tac dy_times_mono_thm THEN REPEAT strip_tac);
(* *** Goal "2.2.3.2" *** *)
a(list_spec_nth_asm_tac 8 [⌜ι x'⌝, ⌜x⌝] THEN all_var_elim_asm_tac1);
a(DROP_NTH_ASM_T 2 ante_tac THEN asm_rewrite_tac[] THEN strip_tac);
a(all_fc_tac[dy_left_dense_thm]);
a(∃_tac⌜a'⌝ THEN ∃_tac⌜z⌝ THEN REPEAT strip_tac);
a(LEMMA_T⌜a' dy_times z dy_less a' dy_times dy_one⌝ ante_tac THEN1
	(asm_rewrite_tac[dy_times_unit_thm]));
a(rewrite_tac[dy_times_mono_⇔_thm]);
(*
=TEX
\subsection{Existence of $one$}

Subgoal 2.2.4: existence of $one$.
=SML
*)
(* *** Goal "2.2.4" *** *)
a(strip_asm_tac(∀_elim⌜dy_one⌝dy_balance_thm1));
a(∃_tac⌜ι(dy_one dy_times y)⌝ THEN asm_rewrite_tac[]);
(*
=TEX
\subsection{Lemma for Inverses and Ordering}


Subgoal 2.2.5: inverses and ordering: these will share a lemma.
The lemma says that given any real $x$ and any positive dyadic rational $d$
we can trap $x$ between two dyadic rationals that differ by $d$.
This is where the archimedean property comes into action.
=SML
*)
(* *** Goal "2.2.5" *** *)
a(lemma_tac⌜ ∀x:ℝ; d : DYADIC⦁
	dy_one dy_less d ⇒ ∃a⦁ ι a < x ∧ x < ι(a dy_times d)⌝ THEN REPEAT strip_tac);
(* *** Goal "2.2.5.1" *** *)
a(lemma_tac⌜∃c⦁ι c < x⌝);
(* *** Goal "2.2.5.1.1" *** *)
a(strip_asm_tac(∀_elim⌜x⌝ℝ_unbounded_below_thm));
a(list_spec_nth_asm_tac 9 [⌜y⌝, ⌜x⌝] THEN all_var_elim_asm_tac1);
a(contr_tac THEN all_asm_fc_tac[]);
(* *** Goal "2.2.5.1.2" *** *)
a(lemma_tac⌜∃e⦁x < ι e⌝);
(* *** Goal "2.2.5.1.2.1" *** *)
a(strip_asm_tac(∀_elim⌜x⌝ℝ_unbounded_above_thm));
a(list_spec_nth_asm_tac 10 [⌜x⌝, ⌜y⌝] THEN all_var_elim_asm_tac1);
a(contr_tac THEN all_asm_fc_tac[]);
(* *** Goal "2.2.5.1.2.2" *** *)
a(lemma_tac ⌜∃m⦁
	ι(c dy_times d dy_exp m) < x ∧
	¬ ι(c dy_times d dy_exp (m+1)) < x⌝);
(* *** Goal "2.2.5.1.2.2.1" *** *)
a(bc_thm_tac (rewrite_rule[](∀_elim ⌜
	λm⦁ι(c dy_times d dy_exp m) < x⌝ plus_exists_lemma2)));
a(asm_rewrite_tac[dy_exp_clauses, dy_times_unit_thm]);
a(lemma_tac ⌜∃m⦁ ι e < ι(c dy_times d dy_exp m)⌝ THEN1 asm_rewrite_tac[]);
(* *** Goal "2.2.5.1.2.2.1.1" *** *)
a(ALL_FC_T (MAP_EVERY ante_tac) [ℝ_less_trans_thm]);
a(asm_rewrite_tac[] THEN REPEAT strip_tac);
a(all_fc_tac[plus_exists_lemma7]);
a(∃_tac⌜m⌝ THEN REPEAT strip_tac);
(* *** Goal "2.2.5.1.2.2.1.2" *** *)
a(∃_tac⌜m⌝ THEN contr_tac);
a(LEMMA_T ⌜x < x⌝ (strip_asm_tac o rewrite_rule[ℝ_less_irrefl_thm]));
a(all_fc_tac[ℝ_less_trans_thm] THEN all_fc_tac[ℝ_less_trans_thm]);
(* *** Goal "2.2.5.1.2.2.2" *** *)
a(lemma_tac⌜ ∃b⦁ ι b < x ∧ x ≤ ι(b dy_times d)⌝);
(* *** Goal "2.2.5.1.2.2.2.1" *** *)
a(∃_tac⌜c dy_times d dy_exp m⌝ THEN REPEAT strip_tac);
a(POP_ASM_T ante_tac);
a(rewrite_tac[ℝ_≤_¬_less_thm, dy_exp_clauses, dy_times_assoc_thm]);
(* *** Goal "2.2.5.1.2.2.2.2" *** *)
a(list_spec_nth_asm_tac 14 [⌜ι b⌝, ⌜x⌝] THEN all_var_elim_asm_tac1);
a(DROP_NTH_ASM_T 2 ante_tac THEN asm_rewrite_tac[] THEN strip_tac);
a(∃_tac⌜a'⌝ THEN REPEAT strip_tac);
a(lemma_tac⌜ι (b dy_times d) < ι (a' dy_times d)⌝ THEN1
	(asm_rewrite_tac[∀_elim⌜d⌝dy_times_order_thm, dy_times_mono_⇔_thm]));
a(all_fc_tac[ℝ_≤_less_trans_thm]);
(*
=TEX
\subsection{Inverses}

Subgoal 2.2.5.2: inverses: we haven't much choice here but to construct
the inverse as a supremum of an appropriate set.
=SML
*)
(* *** Goal "2.2.5.2" *** *)
a(lemma_tac⌜∃Y⦁Y = {z | ∃b⦁ (∀a⦁ι a < x ⇒ a dy_times b dy_less dy_one) ∧ z ≤ ι b}⌝
	THEN1 prove_∃_tac);
a(lemma_tac⌜¬Y = {}⌝);
(* *** Goal "2.2.5.2.1" *** *)
a(POP_ASM_T rewrite_thm_tac THEN PC_T1 "sets_ext" REPEAT strip_tac);
a(lemma_tac⌜∃c⦁ x < ι c⌝);
(* *** Goal "2.2.5.2.1.1" *** *)
a(strip_asm_tac(∀_elim⌜x⌝ℝ_unbounded_above_thm));
a(list_spec_nth_asm_tac 9 [⌜x⌝, ⌜y⌝] THEN all_var_elim_asm_tac1);
a(contr_tac THEN all_asm_fc_tac[]);
(* *** Goal "2.2.5.2.1.2" *** *)
a(strip_asm_tac(∀_elim⌜c⌝plus_exists_lemma8));
a(∃_tac⌜ι b⌝ THEN rewrite_tac[]);
a(∃_tac⌜b⌝ THEN rewrite_tac[get_spec⌜$≤⋎R⌝]);
a(REPEAT strip_tac);
a(ALL_FC_T (MAP_EVERY ante_tac) [ℝ_less_trans_thm]);
a(asm_rewrite_tac[]);
(* *** Goal "2.2.5.2.2" *** *)
a(LEMMA_T⌜∃r⦁∀t⦁ t ∈ Y ⇒ t ≤ r⌝ asm_tac);
(* *** Goal "2.2.5.2.2.1" *** *)
a(lemma_tac⌜∃c⦁ι c < x⌝);
(* *** Goal "2.2.5.2.2.1.1" *** *)
a(strip_asm_tac(∀_elim⌜x⌝ℝ_unbounded_below_thm));
a(list_spec_nth_asm_tac 11 [⌜y⌝, ⌜x⌝] THEN all_var_elim_asm_tac1);
a(contr_tac THEN all_asm_fc_tac[]);
(* *** Goal "2.2.5.2.2.1.2" *** *)
a(lemma_tac⌜∃d⦁dy_one dy_less c dy_times d⌝ THEN1
	(strip_asm_tac(∀_elim⌜c⌝ dy_balance_thm1) THEN contr_tac THEN all_asm_fc_tac[]));
a(asm_rewrite_tac[] THEN ∃_tac⌜ι d⌝ THEN REPEAT strip_tac);
a(rewrite_tac[ℝ_≤_¬_less_thm] THEN contr_tac);
a(LIST_GET_NTH_ASM_T [3] all_fc_tac);
a(ALL_FC_T (MAP_EVERY ante_tac)[ℝ_less_≤_trans_thm]);
a(asm_rewrite_tac[]);
a(ALL_FC_T (MAP_EVERY ante_tac)[dy_less_trans_thm]);
a(rewrite_tac[dy_times_mono_⇔_thm]);
a(strip_tac THEN all_fc_tac[dy_less_antisym_thm]);
(* *** Goal "2.2.5.2.2.2" *** *)
a(∃_tac⌜Sup Y⌝ THEN LEMMA_T⌜∀a⦁ι a = s {c | c dy_less a}⌝ rewrite_thm_tac);
(* *** Goal "2.2.5.2.2.2.1" *** *)
a(strip_tac THEN lemma_tac ⌜{c|c dy_less a} = i(ι a)⌝ THEN1 asm_rewrite_tac[]);
a(LIST_GET_NTH_ASM_T[1, 7] rewrite_tac);
(* *** Goal "2.2.5.2.2.2.2" *** *)
a(GET_NTH_ASM_T 7 rewrite_thm_tac);
a(LEMMA_T ⌜i x pld i (Sup Y) = {c|c dy_less dy_one}⌝ rewrite_thm_tac);
a(LIST_GET_NTH_ASM_T [10, 8] rewrite_tac THEN PC_T1 "sets_ext" REPEAT strip_tac);
(* *** Goal "2.2.5.2.2.2.2.1" *** *)
a(ante_tac (∀_elim⌜Y⌝ ℝ_less_sup_thm) THEN asm_rewrite_tac[]);
a(STRIP_T (fn th => fc_tac[th]));
a(DROP_NTH_ASM_T 2 ante_tac THEN GET_NTH_ASM_T 7 rewrite_thm_tac THEN REPEAT strip_tac);
a(spec_nth_asm_tac 2 ⌜a⌝);
a(bc_thm_tac dy_less_trans_thm THEN ∃_tac ⌜a dy_times b⌝ THEN REPEAT strip_tac);
a(bc_thm_tac dy_less_trans_thm THEN ∃_tac ⌜a dy_times b'⌝ THEN REPEAT strip_tac);
a(ALL_FC_T (MAP_EVERY ante_tac) [ℝ_less_≤_trans_thm]);
a(asm_rewrite_tac[] THEN strip_tac THEN asm_rewrite_tac[dy_times_mono_⇔_thm]);
(* *** Goal "2.2.5.2.2.2.2.2" *** *)
a(strip_asm_tac (list_∀_elim [⌜x'⌝, ⌜dy_one⌝] plus_exists_lemma11));
a(list_spec_nth_asm_tac 8 [⌜x⌝, ⌜c⌝]);
a(list_spec_nth_asm_tac 10 [⌜Sup Y⌝, ⌜c⌝]);
a(cases_tac⌜dy_one dy_less a dy_times a' dy_times c dy_times c⌝);
(* *** Goal "2.2.5.2.2.2.2.2.1" *** *)
a(∃_tac⌜a⌝ THEN ∃_tac ⌜a'⌝ THEN REPEAT strip_tac);
a(LEMMA_T⌜x' dy_times c dy_times c dy_less a dy_times a' dy_times c dy_times c⌝ ante_tac
	THEN1 all_fc_tac [dy_less_trans_thm]);
a(rewrite_tac[∀_elim⌜c⌝dy_times_order_thm, dy_times_mono_⇔_thm]);
(* *** Goal "2.2.5.2.2.2.2.2.2" *** *)
a(i_contr_tac THEN lemma_tac⌜ι (a' dy_times c) ∈ Y⌝);
(* *** Goal "2.2.5.2.2.2.2.2.2.1" *** *)
a(asm_rewrite_tac[]);
a(∃_tac⌜(a' dy_times c)⌝ THEN rewrite_tac[get_spec⌜$≤⋎R⌝]);
a(REPEAT strip_tac);
a(LEMMA_T⌜ι a'' < ι (a dy_times c)⌝ ante_tac THEN1 all_fc_tac[ℝ_less_trans_thm]);
a(asm_rewrite_tac[] THEN strip_tac);
a(lemma_tac⌜a'' dy_times a' dy_less a dy_times a' dy_times c⌝ THEN1
	asm_rewrite_tac[∀_elim⌜a'⌝dy_times_order_thm, dy_times_mono_⇔_thm]);
a(swap_nth_asm_concl_tac 4);
a(bc_thm_tac plus_exists_lemma4 THEN ∃_tac⌜a'' dy_times a' dy_times c⌝
	THEN REPEAT strip_tac);
a(DROP_NTH_ASM_T 2 ante_tac THEN rewrite_tac[∀_elim⌜c⌝dy_times_order_thm, dy_times_mono_⇔_thm]);
(* *** Goal "2.2.5.2.2.2.2.2.2.2" *** *)
a(DROP_NTH_ASM_T 11 strip_asm_tac);
a(strip_asm_tac (list_∀_elim[⌜Y⌝, ⌜r⌝]ℝ_sup_thm) THEN1 all_asm_fc_tac[]);
a(LIST_GET_NTH_ASM_T [2] (ALL_FC_T (MAP_EVERY ante_tac)));
a(asm_rewrite_tac[ℝ_≤_¬_less_thm]);
(*
=TEX
\subsection{Ordering Property}

Subgoal 2.2.5.3: ordering property: we first prove that the less-than relation on
the reals corresponds to the subset relation on the cuts:

=SML
*)
(* *** Goal "2.2.5.3" *** *)
a(LEMMA_T ⌜∀x y⦁ x < y ⇔ i x ⊂ i y⌝ rewrite_thm_tac);
(* *** Goal "2.2.5.3.1" *** *)
a(asm_rewrite_tac[] THEN PC_T1 "sets_ext" REPEAT strip_tac);
(* *** Goal "2.2.5.3.1.1" *** *)
a(all_fc_tac[ℝ_less_trans_thm]);
(* *** Goal "2.2.5.3.1.2" *** *)
a(list_spec_nth_asm_tac 10 [⌜x⌝, ⌜y'⌝] THEN all_var_elim_asm_tac1);
a(∃_tac⌜a'⌝ THEN REPEAT strip_tac);
a(contr_tac THEN all_fc_tac[ℝ_less_antisym_thm]);
(* *** Goal "2.2.5.3.1.3" *** *)
a(lemma_tac⌜x ≤ ι x'⌝ THEN1 asm_rewrite_tac[ℝ_≤_¬_less_thm]);
a(all_fc_tac[ℝ_≤_less_trans_thm]);
(* *** Goal "2.2.5.3.2" *** *)
a(LIST_GET_NTH_ASM_T [2, 3, 5] rewrite_tac);
a(PC_T1 "sets_ext" asm_rewrite_tac[] THEN REPEAT strip_tac);
(* *** Goal "2.2.5.3.2.1" *** *)
a(∃_tac⌜a⌝ THEN ∃_tac⌜b⌝ THEN REPEAT strip_tac THEN all_fc_tac[ℝ_less_trans_thm]);
(* *** Goal "2.2.5.3.2.2" *** *)
a(lemma_tac⌜∃c d⦁dy_one dy_less d ∧ y < ι c ∧ ι(c dy_times d) < z⌝);
(* *** Goal "2.2.5.3.2.1.1" *** *)
a(list_spec_nth_asm_tac 9 [⌜y⌝, ⌜z⌝] THEN all_var_elim_asm_tac1);
a(list_spec_nth_asm_tac 11 [⌜ι a'⌝, ⌜z⌝] THEN all_var_elim_asm_tac1);
a(GET_NTH_ASM_T 2 ante_tac THEN GET_NTH_ASM_T 14 rewrite_thm_tac THEN strip_tac);
a(all_fc_tac[plus_exists_lemma9]);
a(∃_tac⌜a'⌝ THEN ∃_tac⌜c⌝ THEN asm_rewrite_tac[]);
a(bc_thm_tac ℝ_less_trans_thm THEN ∃_tac⌜ι a''⌝ THEN asm_rewrite_tac[]);
(* *** Goal "2.2.5.3.2.2.2" *** *)
a(list_spec_nth_asm_tac 5 [⌜x⌝, ⌜d⌝]);
a(∃_tac⌜a dy_times c dy_times d⌝ THEN REPEAT strip_tac);
(* *** Goal "2.2.5.3.2.2.2.1" *** *)
a(contr_tac THEN lemma_tac⌜ι a' < ι(a dy_times d)⌝ THEN1 all_fc_tac[ℝ_less_trans_thm]);
a(POP_ASM_T ante_tac THEN asm_rewrite_tac[] THEN contr_tac);
a(LEMMA_T  ⌜a dy_times c dy_times d dy_less a dy_times c dy_times d⌝
	(strip_asm_tac o rewrite_rule[dy_less_irrefl_thm]));
a(bc_thm_tac dy_less_trans_thm THEN ∃_tac⌜a' dy_times b⌝ THEN REPEAT strip_tac);
a(LEMMA_T⌜a' dy_times b dy_less (a dy_times d) dy_times b⌝
	(strip_asm_tac o rewrite_rule[dy_times_assoc_thm]) THEN1
	(once_rewrite_tac[dy_times_comm_thm] THEN asm_rewrite_tac[dy_times_mono_⇔_thm]));
a(bc_thm_tac dy_less_trans_thm THEN ∃_tac⌜a dy_times d dy_times b⌝ THEN REPEAT strip_tac);
a(rewrite_tac[dy_times_mono_⇔_thm]);
a(rewrite_tac[∀_elim⌜d⌝dy_times_order_thm, dy_times_mono_⇔_thm]);
a(LEMMA_T⌜ι b < ι c⌝ ante_tac THEN_LIST[all_fc_tac[ℝ_less_trans_thm], asm_rewrite_tac[]]);
(* *** Goal "2.2.5.3.2.2.2.2" *** *)
a(list_spec_nth_asm_tac 14 [⌜ι (c dy_times d)⌝, ⌜z⌝] THEN all_var_elim_asm_tac1);
a(∃_tac⌜a⌝ THEN ∃_tac⌜a''⌝ THEN REPEAT strip_tac);
a(rewrite_tac[dy_times_mono_⇔_thm]);
a(DROP_NTH_ASM_T 2 ante_tac THEN asm_rewrite_tac[]);
declare_nonfix"pl";
declare_nonfix"pld";
pop_thm()
);
=TEX
=SML
val _ = (
push_consistency_goal⌜$+⋎R⌝;
a(strip_asm_tac ℝ_plus_exists_thm);
a(∃_tac⌜(pl, zero, one)⌝ THEN all_asm_ante_tac THEN taut_tac);
save_consistency_thm⌜$+⋎R⌝ (pop_thm())
);
=TEX
=SML
val ⦏ℝ_plus_def⦎ = get_spec⌜$+⋎R⌝;
=TEX
=SML
val ⦏ℝ_subtract_def⦎ = get_spec⌜$-⋎R⌝;
=TEX
=SML
val ⦏ℕℝ_def⦎ = get_spec⌜ℕℝ⌝;
=TEX
=SML
val ⦏ℝ_less_def⦎ = get_spec⌜$<⋎R⌝;
=TEX
=SML
val ⦏ℝ_≤_def⦎ = get_spec⌜$≤⋎R⌝;
=TEX
=SML
val ⦏ℝ_less_def⦎ = get_spec⌜$<⋎R⌝;
=TEX
=SML
val ⦏ℝ_greater_def⦎ = get_spec⌜$>⋎R⌝;
=TEX
=SML
val ⦏ℝ_≥_def⦎ = get_spec⌜$≥⋎R⌝;
=TEX
=SML
val _ = (
push_consistency_goal⌜$~⋎R⌝;
a(strip_asm_tac ℝ_plus_def);
a(prove_∃_tac);
save_consistency_thm⌜$~⋎R⌝ (pop_thm())
);
=TEX
=SML
val ⦏ℝ_minus_def⦎ = get_spec⌜~⋎R⌝;
=TEX
\section{SYNTAX FUNCTIONS}

=SML
end (* of structure ℝ part 3 *);
structure ⦏ℝ⦎ (* : ℝ *) = struct
open ℝ;
=TEX


=SML
val ⦏ℝminus⦎ = (fst o dest_app) ⌜~ (ℕℝ 42)⌝;
val ⦏ℝminusn⦎ = (fst o dest_const) ℝminus;
val ⦏ℝabs⦎ = (fst o dest_app) ⌜Abs (ℕℝ 42)⌝;
val ⦏ℝabsn⦎ = (fst o dest_const) ℝabs;
val ⦏ℝmax⦎ = (fst o dest_app) ⌜Max⋎R []⌝;
val ⦏ℝmaxn⦎ = (fst o dest_const) ℝmax;
val ⦏ℝmin⦎ = (fst o dest_app) ⌜Min⋎R []⌝;
val ⦏ℝminn⦎ = (fst o dest_const) ℝmin;
val ⦏ℝrecip⦎ = (fst o dest_app) ⌜(ℕℝ 42)⋏-⋏1⌝;
val ⦏ℝrecipn⦎ = (fst o dest_const) ℝrecip;
val ⦏ℕℝ⦎ = (fst o dest_app) ⌜ℕℝ 42⌝;
val ⦏ℕℝn⦎ = (fst o dest_const) ℕℝ;
=TEX
=TEX
=SML
val ⦏dest_ℝ_less⦎ = dest_bin_op "dest_ℝ_less" 116101 (fst(dest_const ⌜$<⋎R⌝));
val ⦏dest_ℝ_≤⦎ = dest_bin_op "dest_ℝ_≤" 116102 (fst(dest_const ⌜$≤⋎R⌝));
val ⦏dest_ℝ_greater⦎ = dest_bin_op "dest_ℝ_greater" 116103 (fst(dest_const ⌜$>⋎R⌝));
val ⦏dest_ℝ_≥⦎ = dest_bin_op "dest_ℝ_≥" 116104 (fst(dest_const ⌜$≥⋎R⌝));
val ⦏dest_ℝ_plus⦎ = dest_bin_op "dest_ℝ_plus" 116105 (fst(dest_const ⌜$+⋎R⌝));
val ⦏dest_ℝ_subtract⦎ = dest_bin_op "dest_ℝ_subtract" 116106 (fst(dest_const ⌜$-⋎R⌝));
val ⦏dest_ℝ_times⦎ = dest_bin_op "dest_ℝ_times" 116107 (fst(dest_const ⌜$*⋎R⌝));
val ⦏dest_ℝ_over⦎ = dest_bin_op "dest_ℝ_over" 116108 (fst(dest_const ⌜$/⋎R⌝));
val ⦏dest_ℝ_frac⦎ = dest_bin_op "dest_ℝ_frac" 116109 (fst(dest_const ⌜$/⋎N⌝));
val ⦏dest_ℝ_ℕ_exp⦎ = dest_bin_op "dest_ℝ_ℕ_exp" 116114 (fst(dest_const ⌜$^⋎N⌝));
val ⦏dest_ℝ_ℤ_exp⦎ = dest_bin_op "dest_ℝ_ℤ_exp" 116116 (fst(dest_const ⌜$^⋎Z⌝));
=TEX
=SML
fun ⦏simple_dest⦎
	(caller : string) (const_name : string) (err_num : int)
	: TERM -> TERM = (fn tm =>
	let	val (sgn, a) = dest_app tm;
		val (s, _) = dest_const sgn;
	in	if s = const_name then a
			else term_fail caller err_num [tm]
	end	handle Fail _ => term_fail caller err_num [tm]
);
=TEX
=SML
val ⦏dest_ℝ_minus⦎ : TERM -> TERM = simple_dest "dest_ℝ_minus" ℝminusn 116111;
val ⦏dest_ℝ_abs⦎  : TERM -> TERM = simple_dest "dest_ℝ_abs" ℝabsn 116112;
val ⦏dest_ℝ_recip⦎  : TERM -> TERM = simple_dest "dest_ℝ_recip" ℝrecipn 116113;
val ⦏dest_ℕℝ⦎  : TERM -> TERM = simple_dest "dest_ℕℝ" ℕℝn 116115;
val ⦏dest_ℝ_max⦎  : TERM -> TERM = simple_dest "dest_ℝ_max" ℝmaxn 116117;
val ⦏dest_ℝ_min⦎  : TERM -> TERM = simple_dest "dest_ℝ_min" ℝminn 116118;
=TEX
=SML
val ⦏is_ℝ_≤⦎ = is_bin_op (fst(dest_const ⌜$≤⋎R⌝));
val ⦏is_ℝ_≥⦎ = is_bin_op (fst(dest_const ⌜$≥⋎R⌝));
val ⦏is_ℝ_less⦎ = is_bin_op (fst(dest_const ⌜$<⋎R⌝));
val ⦏is_ℝ_greater⦎ = is_bin_op (fst(dest_const ⌜$>⋎R⌝));
val ⦏is_ℝ_plus⦎ = is_bin_op (fst(dest_const ⌜$+⋎R⌝));
val ⦏is_ℝ_subtract⦎ = is_bin_op (fst(dest_const ⌜$-⋎R⌝));
val ⦏is_ℝ_times⦎ = is_bin_op (fst(dest_const ⌜$*⋎R⌝));
val ⦏is_ℝ_over⦎ = is_bin_op (fst(dest_const ⌜$/⋎R⌝));
val ⦏is_ℝ_frac⦎ = is_bin_op (fst(dest_const ⌜$/⋎N⌝));
val ⦏is_ℝ_ℕ_exp⦎ = is_bin_op (fst(dest_const ⌜$^⋎N⌝));
val ⦏is_ℝ_ℤ_exp⦎ = is_bin_op (fst(dest_const ⌜$^⋎Z⌝));
=TEX
=SML
fun ⦏is_ℝ_minus⦎ (tm : TERM) : bool = (
	(dest_ℝ_minus tm; true) handle Fail _ => false
);
=TEX
=SML
fun ⦏is_ℝ_abs⦎ (tm : TERM) : bool = (
	(dest_ℝ_abs tm; true) handle Fail _ => false
);
=TEX
=SML
fun ⦏is_ℝ_recip⦎ (tm : TERM) : bool = (
	(dest_ℝ_recip tm; true) handle Fail _ => false
);
=TEX
=SML
fun ⦏is_ℕℝ⦎ (tm : TERM) : bool = (
	(dest_ℕℝ tm; true) handle Fail _ => false
);
=TEX
=SML
fun ⦏is_ℝ_max⦎ (tm : TERM) : bool = (
	(dest_ℝ_max tm; true) handle Fail _ => false
);
=TEX
=SML
fun ⦏is_ℝ_min⦎ (tm : TERM) : bool = (
	(dest_ℝ_min tm; true) handle Fail _ => false
);
=TEX

=SML
fun ⦏mk_ℝ_simple_bin_op⦎ (tm : TERM) : TERM * TERM -> TERM = (fn (a1, a2) =>
	mk_app(mk_app(tm, a1), a2)
);
=TEX
=SML
val ℝ_ty = ⓣℝ⌝;
fun ⦏mk_ℝ_bin_op⦎ (area : string) (tm : TERM) : (TERM * TERM) -> TERM = (
	let val f = mk_ℝ_simple_bin_op tm;
	in (fn tt as (t1, t2) => (
		if	type_of t1 =: ℝ_ty
		then 	if	type_of t2 =: ℝ_ty
			then	f tt
			else term_fail area 116201 [t2]
		else	term_fail area 116201 [t1]
	))
	end
);
=TEX
=SML
val ⦏mk_ℝ_≤⦎ = mk_ℝ_bin_op "mk_ℝ_≤" ⌜$≤⋎R⌝;
val ⦏mk_ℝ_≥⦎ = mk_ℝ_bin_op "mk_ℝ_≥" ⌜$≥⋎R⌝;
val ⦏mk_ℝ_less⦎ = mk_ℝ_bin_op "mk_ℝ_less" ⌜$<⋎R⌝;
val ⦏mk_ℝ_greater⦎ = mk_ℝ_bin_op "mk_ℝ_greater" ⌜$>⋎R⌝;
val ⦏mk_ℝ_plus⦎ = mk_ℝ_bin_op "mk_ℝ_plus" ⌜$+⋎R⌝;
val ⦏mk_ℝ_subtract⦎ = mk_ℝ_bin_op "mk_ℝ_subtract" ⌜$-⋎R⌝;
val ⦏mk_ℝ_times⦎ = mk_ℝ_bin_op "mk_ℝ_times" ⌜$*⋎R⌝;
val ⦏mk_ℝ_over⦎ = mk_ℝ_bin_op "mk_ℝ_over" ⌜$/⋎R⌝;
val ⦏mk_ℝ_frac⦎ = mk_ℝ_bin_op "mk_ℝ_frac" ⌜$/⋎N⌝;

=TEX
=SML
val ℕ_ty = ⓣℕ⌝;
fun ⦏mk_ℕ_bin_op⦎ (area : string) (tm : TERM) : (TERM * TERM) -> TERM = (
	let val f = mk_ℝ_simple_bin_op tm;
	in (fn tt as (t1, t2) => (
		if	type_of t1 =: ℕ_ty
		then 	if	type_of t2 =: ℕ_ty
			then	f tt
			else term_fail area 116202 [t2]
		else	term_fail area 116202 [t1]
	))
	end
);
val ⦏mk_ℝ_frac⦎ = mk_ℕ_bin_op "mk_ℝ_frac" ⌜$/⋎N⌝;
=TEX
=SML
fun ⦏mk_ℝ_ℕ_bin_op⦎ (area : string) (tm : TERM) : (TERM * TERM) -> TERM = (
	let val f = mk_ℝ_simple_bin_op tm;
	in (fn tt as (t1, t2) => (
		if	type_of t1 =: ℝ_ty
		then 	if	type_of t2 =: ℕ_ty
			then	f tt
			else term_fail area 116202 [t2]
		else	term_fail area 116201 [t1]
	))
	end
);
=TEX
=SML
val ⦏mk_ℝ_ℕ_exp⦎ = mk_ℝ_ℕ_bin_op "mk_ℝ_ℕ_exp" ⌜$^⋎N⌝;
=TEX
=SML
val ℤ_ty = ⓣℤ⌝;
fun ⦏mk_ℝ_ℤ_bin_op⦎ (area : string) (tm : TERM) : (TERM * TERM) -> TERM = (
	let val f = mk_ℝ_simple_bin_op tm;
	in (fn tt as (t1, t2) => (
		if	type_of t1 =: ℝ_ty
		then 	if	type_of t2 =: ℤ_ty
			then	f tt
			else term_fail area 116203 [t2]
		else	term_fail area 116201 [t1]
	))
	end
);
=TEX
=SML
val ⦏mk_ℝ_ℤ_exp⦎ = mk_ℝ_ℤ_bin_op "mk_ℝ_ℤ_exp" ⌜$^⋎Z⌝;
=TEX
=SML
fun ⦏simple_mk⦎
	(caller : string) (c : TERM) (err_num : int)
	: TERM -> TERM = (fn tm =>
	mk_app (c, tm)
	handle Fail _ => term_fail caller err_num [tm]
);
=TEX
=SML
val ⦏mk_ℝ_minus⦎ : TERM -> TERM = simple_mk "mk_ℝ_minus" ℝminus 116201;
val ⦏mk_ℝ_abs⦎ : TERM -> TERM = simple_mk "mk_ℝ_abs" ℝabs 116201;
val ⦏mk_ℝ_recip⦎ : TERM -> TERM = simple_mk "mk_ℝ_recip" ℝrecip 116201;
val ⦏mk_ℕℝ⦎ : TERM -> TERM = simple_mk "mk_ℕℝ" ℕℝ 116202;
val ⦏mk_ℝ_max⦎ : TERM -> TERM = simple_mk "mk_ℝ_max" ℝmax 116203;
val ⦏mk_ℝ_min⦎ : TERM -> TERM = simple_mk "mk_ℝ_min" ℝmin 116203;
=TEX
\section{THEOREMS ABOUT ADDITION AND ORDER}
In this section we prove theorems of general utility about the addition and
ordering of the real numbers.
=SML
end (* of structure ℝ part 4 *);
structure ⦏ℝ⦎ (* : ℝ *) = struct
open ℝ;
=TEX
=TEX
=SML
val [	⦏ℝ_plus_assoc_thm⦎,
	⦏ℝ_plus_comm_thm⦎,
	⦏ℝ_plus_unit_thm⦎,
	_,
	⦏ℝ_plus_mono_thm⦎,
	_ ] = strip_∧_rule ℝ_plus_def;
val ⦏ℝ_plus_assoc_thm1⦎ = conv_rule (ONCE_MAP_C eq_sym_conv) ℝ_plus_assoc_thm;
val ⦏ℝ_plus_mono_thm1⦎ = once_rewrite_rule[ℝ_plus_comm_thm] ℝ_plus_mono_thm;
val _ = save_thm("ℝ_plus_assoc_thm", ℝ_plus_assoc_thm);
val _ = save_thm("ℝ_plus_comm_thm", ℝ_plus_comm_thm);
val _ = save_thm("ℝ_plus_unit_thm", ℝ_plus_unit_thm);
val _ = save_thm("ℝ_plus_mono_thm", ℝ_plus_mono_thm);
val _ = save_thm("ℝ_plus_assoc_thm1", ℝ_plus_assoc_thm1);
val _ = save_thm("ℝ_plus_mono_thm1", ℝ_plus_mono_thm1);

=TEX
=SML
val ⦏ℝ_plus_mono_thm2⦎ = (
set_goal([], ⌜∀x y s t:ℝ⦁ x < y ∧ s < t ⇒ x + s < y + t⌝);
a(REPEAT strip_tac THEN bc_thm_tac ℝ_less_trans_thm);
a(∃_tac ⌜x + t⌝ THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(bc_thm_tac ℝ_plus_mono_thm THEN REPEAT strip_tac);
(* *** Goal "2" *** *)
a(bc_thm_tac ℝ_plus_mono_thm1 THEN REPEAT strip_tac);
save_pop_thm"ℝ_plus_mono_thm2"
);
=TEX
=SML
val ⦏ℝ_plus_0_thm⦎ = (
set_goal([], ⌜∀x:ℝ⦁ x + ℕℝ 0 = x ∧ ℕℝ 0 + x = x⌝);
a(rewrite_tac[get_spec⌜ℕℝ⌝, ℝ_plus_unit_thm, ∀_elim⌜0⋎R⌝ ℝ_plus_comm_thm]);
save_pop_thm"ℝ_plus_0_thm"
);
=TEX
=SML
val ⦏ℝ_0_1_thm⦎ = (
set_goal([], ⌜0⋎R = ℕℝ 0 ∧ 1⋎R = ℕℝ 1⌝);
a(pure_once_rewrite_tac[prove_rule [] ⌜1 = 0 + 1⌝]);
a(pure_rewrite_tac[get_spec⌜ℕℝ⌝]);
a(rewrite_tac[∀_elim⌜0⋎R⌝ ℝ_plus_comm_thm, ℝ_plus_unit_thm]);
save_pop_thm"ℝ_0_1_thm"
);
=TEX
=SML
val ⦏ℝ_plus_order_thm⦎ = (
set_goal([], ⌜∀x y z:ℝ⦁
	y + x = x + y
∧	(x + y) + z = x + y + z
∧	y + x + z = x + y + z	⌝);
a(REPEAT ∀_tac THEN rewrite_tac[ℝ_plus_assoc_thm]);
a(rewrite_tac[∀_elim⌜y⌝ ℝ_plus_comm_thm, ℝ_plus_assoc_thm]);
save_pop_thm"ℝ_plus_order_thm"
);
=TEX
=SML
val ⦏ℝ_plus_minus_thm⦎ = (
set_goal([], ⌜∀ x : ℝ ⦁ x + ~ x = ℕℝ 0 ∧ ~x + x = ℕℝ 0⌝);
a(∀_tac);
a(rewrite_tac[∀_elim⌜x⌝ ℝ_plus_order_thm]);
a(rewrite_tac[ℕℝ_def, ℝ_minus_def]);
save_pop_thm"ℝ_plus_minus_thm"
);
=TEX
=SML
val ⦏ℝ_eq_thm⦎ = (
set_goal([], ⌜∀ x y : ℝ ⦁ x = y ⇔ x + ~y = ℕℝ 0⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(asm_rewrite_tac[ℝ_plus_minus_thm]);
(* *** Goal "2" *** *)
a(LEMMA_T ⌜(x + ~ y) + y = ℕℝ 0 + y⌝ ante_tac THEN1 asm_rewrite_tac[]);
a(rewrite_tac[ℝ_plus_assoc_thm, ℝ_plus_minus_thm, ℝ_plus_0_thm]);
save_pop_thm"ℝ_eq_thm"
);
=TEX
=SML
val ⦏ℕℝ_plus_homomorphism_thm⦎ = (
set_goal([], ⌜∀ m n : ℕ ⦁ ℕℝ(m + n) = ℕℝ m + ℕℝ n⌝);
a(REPEAT strip_tac THEN induction_tac⌜n:ℕ⌝);
(* *** Goal "1" *** *)
a(rewrite_tac[ℕℝ_def, ℝ_0_1_thm, ℝ_plus_0_thm]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[plus_assoc_thm1, ℕℝ_def, ℝ_plus_assoc_thm]);
save_pop_thm"ℕℝ_plus_homomorphism_thm"
);
=TEX
=SML
val ⦏ℝ_minus_clauses⦎ = (
set_goal([], ⌜∀x y : ℝ⦁
		~ (~ x) = x
	∧	x + ~ x = ℕℝ 0
	∧	~ x + x = ℕℝ 0
	∧	~ (x + y) = ~ x + ~ y
	∧ 	~(ℕℝ 0) = (ℕℝ 0)⌝);
a(REPEAT ∀_tac);
a(rewrite_tac[ℝ_plus_minus_thm]);
a(lemma_tac⌜∀x:ℝ⦁~(~ x) = x⌝);
(* *** Goal "1" *** *)
a(strip_tac THEN once_rewrite_tac[ℝ_eq_thm]);
a(once_rewrite_tac[ℝ_plus_comm_thm]);
a(rewrite_tac[ℝ_plus_minus_thm]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[] THEN strip_tac);
(* *** Goal "2.1" *** *)
a(conv_tac eq_sym_conv THEN once_rewrite_tac[ℝ_eq_thm]);
a(asm_rewrite_tac[∀_elim⌜~ y⌝ℝ_plus_order_thm]);
a(rewrite_tac[∀_elim⌜y⌝ℝ_plus_order_thm, ℝ_plus_minus_thm, ℝ_plus_0_thm]);
(* *** Goal "2.2" *** *)
a(conv_tac eq_sym_conv THEN once_rewrite_tac[ℝ_eq_thm]);
a(asm_rewrite_tac[ℝ_plus_0_thm]);
save_pop_thm"ℝ_minus_clauses"
);
=TEX
=SML
val ⦏ℝ_minus_eq_thm⦎ = (
set_goal([], ⌜∀x y : ℝ⦁~x = ~y ⇔ x = y⌝);
a(REPEAT ∀_tac);
a(conv_tac(LEFT_C eq_sym_conv));
a(once_rewrite_tac[ℝ_eq_thm]);
a(rewrite_tac[ℝ_minus_clauses, ∀_elim⌜x⌝ℝ_plus_order_thm]);
save_pop_thm"ℝ_minus_eq_thm"
);
=TEX
=SML
val ⦏ℕℝ_0_less_thm⦎ = (
set_goal([], ⌜∀m:ℕ⦁ ℕℝ 0  <  ℕℝ (m+1) ⌝);
a(REPEAT strip_tac THEN lemma_tac⌜ℕℝ 0 < ℕℝ 1⌝);
(* *** Goal "1" *** *)
a(rewrite_tac[conv_rule(ONCE_MAP_C eq_sym_conv) ℝ_0_1_thm, ℝ_plus_def]);
(* *** Goal "2" *** *)
a(induction_tac⌜m:ℕ⌝ THEN1 asm_rewrite_tac[]);
a(bc_thm_tac ℝ_less_trans_thm THEN ∃_tac⌜ℕℝ (m+1)⌝ THEN REPEAT strip_tac);
a(rewrite_tac[ℕℝ_plus_homomorphism_thm, ℝ_plus_assoc_thm]);
a(bc_thm_tac ℝ_plus_mono_thm);
a(LEMMA_T ⌜ℕℝ 1 + ℕℝ 0 < ℕℝ 1 + ℕℝ 1⌝ (accept_tac o rewrite_rule[ℝ_plus_0_thm]));
a(bc_thm_tac ℝ_plus_mono_thm THEN REPEAT strip_tac);
save_pop_thm"ℕℝ_0_less_thm"
);
=TEX
=SML
val ⦏ℕℝ_one_one_thm⦎ = (
set_goal([], ⌜∀m n:ℕ⦁ ℕℝ m = ℕℝ n ⇔ m = n⌝);
a(REPEAT strip_tac THEN_LIST [id_tac, asm_rewrite_tac[]]);
a(strip_asm_tac (rewrite_rule[less_def, ≤_def](list_∀_elim[⌜m⌝, ⌜n⌝]less_cases_thm))
	THEN all_var_elim_asm_tac1 THEN all_asm_ante_tac);
(* *** Goal "1" *** *)
a(rewrite_tac[ℕℝ_plus_homomorphism_thm, plus_assoc_thm, ℝ_plus_assoc_thm, plus_clauses]);
a(conv_tac (ONCE_MAP_C eq_sym_conv) THEN once_rewrite_tac[ℝ_eq_thm]);
a(rewrite_tac[∀_elim⌜~(ℕℝ m)⌝ ℝ_plus_order_thm]);
a(rewrite_tac[ℝ_plus_assoc_thm1, ℝ_minus_clauses]);
a(rewrite_tac[ℝ_plus_0_thm]);
a(once_rewrite_tac[ℝ_plus_comm_thm]);
a(conv_tac (ONCE_MAP_C eq_sym_conv) THEN contr_tac THEN ante_tac (∀_elim ⌜i⌝ ℕℝ_0_less_thm));
a(asm_rewrite_tac[ℕℝ_plus_homomorphism_thm, ℝ_less_irrefl_thm]);
(* *** Goal "2" *** *)
a(rewrite_tac[ℕℝ_plus_homomorphism_thm, plus_assoc_thm, ℝ_plus_assoc_thm, plus_clauses]);
a(once_rewrite_tac[ℝ_eq_thm]);
a(rewrite_tac[ℝ_minus_clauses, ∀_elim⌜~(ℕℝ n)⌝ ℝ_plus_order_thm]);
a(rewrite_tac[ℝ_plus_assoc_thm1, ℝ_minus_clauses]);
a(rewrite_tac[ℝ_plus_0_thm]);
a(once_rewrite_tac[ℝ_plus_comm_thm]);
a(conv_tac (ONCE_MAP_C eq_sym_conv) THEN contr_tac THEN ante_tac (∀_elim ⌜i⌝ ℕℝ_0_less_thm));
a(asm_rewrite_tac[ℕℝ_plus_homomorphism_thm, ℝ_less_irrefl_thm]);
save_pop_thm"ℕℝ_one_one_thm"
);
=TEX
=SML
val ⦏ℝ_plus_clauses⦎ = (
set_goal([], ⌜
	∀ x y z⦁
	(x + z = y + z ⇔ x = y)
∧	(z + x = y + z ⇔ x = y)
∧	(x + z = z + y ⇔ x = y)
∧	(z + x = z + y ⇔ x = y)
∧	(x + z = z ⇔ x = ℕℝ 0)
∧	(z + x = z ⇔ x = ℕℝ 0)
∧	(z = z + y ⇔ y = ℕℝ 0)
∧	(z = y + z ⇔ y = ℕℝ 0)
∧	x + ℕℝ 0 = x
∧	ℕℝ 0 + x = x
∧	¬ ℕℝ 1 = ℕℝ 0
∧	¬ ℕℝ 0 = ℕℝ 1
⌝);
a(REPEAT ∀_tac);
a(rewrite_tac[ℝ_plus_0_thm, ℕℝ_one_one_thm, plus_clauses,
	∀_elim⌜z⌝ ℝ_plus_order_thm]);
a(once_rewrite_tac[∀_elim⌜z + x⌝ ℝ_eq_thm]);
a(once_rewrite_tac[∀_elim⌜z⌝ ℝ_eq_thm]);
a(rewrite_tac[ℝ_minus_clauses, ∀_elim⌜~ z⌝ ℝ_plus_order_thm]);
a(rewrite_tac[ℝ_plus_assoc_thm1, ℝ_minus_clauses, ℝ_plus_0_thm]);
a(once_rewrite_tac[∀_elim⌜x⌝ ℝ_eq_thm]);
a(rewrite_tac[]);
a(conv_tac(LEFT_C eq_sym_conv));
a(once_rewrite_tac[∀_elim⌜ℕℝ 0⌝ ℝ_eq_thm]);
a(rewrite_tac[ℝ_minus_clauses, ℝ_plus_0_thm]);
save_pop_thm"ℝ_plus_clauses"
);
=TEX
=SML
val ⦏ℝ_less_less_0_thm⦎ = (
set_goal([], ⌜∀ x y : ℝ ⦁ x < y ⇔ x + ~y < ℕℝ 0⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(LEMMA_T ⌜x + ~y < y + ~y⌝ (accept_tac o rewrite_rule[ℝ_minus_clauses]));
a(bc_thm_tac ℝ_plus_mono_thm1 THEN REPEAT strip_tac);
(* *** Goal "2" *** *)
a(LEMMA_T ⌜x + ~y + y < y + ~y + y⌝ (accept_tac o rewrite_rule[ℝ_minus_clauses, ℝ_plus_0_thm]));
a(rewrite_tac[ℝ_plus_assoc_thm1]);
a(bc_thm_tac ℝ_plus_mono_thm1 THEN asm_rewrite_tac[ℝ_minus_clauses]);
save_pop_thm"ℝ_less_less_0_thm"
);
=TEX
=SML
val ⦏ℝ_less_clauses⦎ = (
set_goal([], ⌜
	∀ x y z : ℝ ⦁
	(x + z < y + z ⇔ x < y)
∧	(z + x < y + z ⇔ x < y)
∧	(x + z < z + y ⇔ x < y)
∧	(z + x < z + y ⇔ x < y)
∧	(x + z < z ⇔ x < ℕℝ 0)
∧	(z + x < z ⇔ x < ℕℝ 0)
∧	(x < z + x ⇔ ℕℝ 0 < z)
∧	(x < x + z ⇔ ℕℝ 0 < z)
∧	¬ x < x
∧	ℕℝ 0 < ℕℝ 1
∧	¬ ℕℝ 1 < ℕℝ 0
⌝);
a(REPEAT ∀_tac);
a(strip_asm_tac (rewrite_rule[](∀_elim⌜0⌝ℕℝ_0_less_thm)));
a(all_fc_tac[ℝ_less_antisym_thm]);
a(asm_rewrite_tac[ℝ_less_irrefl_thm, ∀_elim⌜z⌝ ℝ_plus_order_thm]);
a(once_rewrite_tac[∀_elim⌜z + x⌝ ℝ_less_less_0_thm]);
a(once_rewrite_tac[∀_elim⌜x⌝ ℝ_less_less_0_thm]);
a(once_rewrite_tac[∀_elim⌜ℕℝ 0⌝ ℝ_less_less_0_thm]);
a(rewrite_tac[ℝ_minus_clauses, ∀_elim⌜~ z⌝ ℝ_plus_order_thm]);
a(rewrite_tac[ℝ_plus_assoc_thm1, ℝ_minus_clauses, ℝ_plus_0_thm]);
save_pop_thm "ℝ_less_clauses"
);
=TEX
=SML
val ⦏ℝ_less_0_less_thm⦎ = (
set_goal([], ⌜∀ x y : ℝ ⦁ x < y ⇔ ℕℝ 0 < y + ~x⌝);
a(REPEAT ∀_tac THEN once_rewrite_tac[ℝ_less_less_0_thm]);
a(rewrite_tac[ℝ_plus_clauses, ℝ_minus_clauses, ∀_elim⌜~y:ℝ⌝ℝ_plus_order_thm]);
save_pop_thm"ℝ_less_0_less_thm"
);
=TEX
=SML
val ⦏ℝ_≤_clauses⦎ = (
set_goal([], ⌜
	∀ x y z : ℝ ⦁
	(x + z ≤ y + z ⇔ x ≤ y)
∧	(z + x ≤ y + z ⇔ x ≤ y)
∧	(x + z ≤ z + y ⇔ x ≤ y)
∧	(z + x ≤ z + y ⇔ x ≤ y)
∧	(x + z ≤ z ⇔ x ≤ ℕℝ 0)
∧	(z + x ≤ z ⇔ x ≤ ℕℝ 0)
∧	(x ≤ z + x ⇔ ℕℝ 0 ≤ z)
∧	(x ≤ x + z ⇔ ℕℝ 0 ≤ z)
∧	x ≤ x
∧	ℕℝ 0 ≤ ℕℝ 1
∧	¬ ℕℝ 1 ≤ ℕℝ 0
⌝);
a(REPEAT ∀_tac);
a(rewrite_tac[ℝ_≤_¬_less_thm, ℝ_less_clauses]);
save_pop_thm "ℝ_≤_clauses"
);
=TEX
=SML
val ⦏ℝ_≤_≤_0_thm⦎ = (
set_goal([], ⌜∀ x y : ℝ ⦁ x ≤ y ⇔ x + ~y ≤ ℕℝ 0⌝);
a(REPEAT ∀_tac);
a(rewrite_tac[ℝ_≤_¬_less_thm]);
a(once_rewrite_tac[ℝ_less_less_0_thm]);
a(rewrite_tac[ℝ_minus_clauses, ℝ_plus_0_thm]);
a(rewrite_tac[∀_elim⌜y⌝ℝ_plus_order_thm]);
save_pop_thm"ℝ_≤_≤_0_thm"
);
=TEX
=SML
val ⦏ℝ_≤_0_≤_thm⦎ = (
set_goal([], ⌜∀ x y : ℝ ⦁ x ≤ y ⇔ ℕℝ 0 ≤ y + ~x⌝);
a(REPEAT ∀_tac THEN once_rewrite_tac[ℝ_≤_≤_0_thm]);
a(rewrite_tac[ℝ_plus_clauses, ℝ_minus_clauses, ∀_elim⌜~y:ℝ⌝ℝ_plus_order_thm]);
save_pop_thm"ℝ_≤_0_≤_thm"
);
=TEX
=SML
val ⦏ℕℝ_less_thm⦎ = (
set_goal([], ⌜∀ m n: ℕ ⦁ ℕℝ m < ℕℝ n ⇔ m < n⌝);
a(lemma_tac⌜∀ m n: ℕ ⦁ m < n ⇒ ℕℝ m < ℕℝ n⌝);
a(REPEAT ∀_tac THEN rewrite_tac[less_def, ≤_def] THEN REPEAT strip_tac);
a(all_var_elim_asm_tac1 THEN rewrite_tac[ℕℝ_plus_homomorphism_thm]);
a(rewrite_tac[ℝ_plus_assoc_thm, ℝ_less_clauses]);
a(ante_tac(∀_elim⌜i⌝ ℕℝ_0_less_thm) THEN rewrite_tac[ℕℝ_plus_homomorphism_thm]);
a(REPEAT strip_tac THEN once_rewrite_tac[ℝ_plus_comm_thm] THEN strip_tac);
(* *** Goal "2" *** *)
a(REPEAT strip_tac THEN_LIST [id_tac, all_asm_fc_tac[]]);
a(contr_tac THEN lemma_tac⌜m = n ∨ n < m⌝ THEN1 PC_T1 "lin_arith" asm_prove_tac[]);
(* *** Goal "2.1" *** *)
a(all_var_elim_asm_tac1 THEN all_fc_tac[ℝ_less_irrefl_thm]);
(* *** Goal "2.2" *** *)
a(all_asm_fc_tac[] THEN all_fc_tac[ℝ_less_antisym_thm]);
save_pop_thm"ℕℝ_less_thm"
);
=TEX
=SML
val ⦏ℝ_less_strong_dense_thm⦎ = (
set_goal([], ⌜∀x y : ℝ ⦁ x < y ⇒ ∃d⦁ ℕℝ 0 < d ∧ x + d < y⌝);
a(REPEAT strip_tac THEN all_fc_tac[ℝ_less_dense_thm]);
a(∃_tac⌜z + ~x⌝ THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(GET_NTH_ASM_T 2 (strip_asm_tac o once_rewrite_rule[ℝ_less_0_less_thm]));
(* *** Goal "2" *** *)
a(asm_rewrite_tac[∀_elim⌜z⌝ ℝ_plus_order_thm, ℝ_minus_clauses, ℝ_plus_0_thm]);
save_pop_thm"ℝ_less_strong_dense_thm"
);
=TEX
=SML
val ⦏ℕℝ_≤_thm⦎ = (
set_goal([], ⌜∀ m n: ℕ ⦁ ℕℝ m ≤ ℕℝ n ⇔ m ≤ n⌝);
a(rewrite_tac[ℝ_≤_¬_less_thm,
	pc_rule1"lin_arith"prove_rule[]⌜∀a b:ℕ⦁ a ≤ b ⇔ ¬b < a⌝, ℕℝ_less_thm]);
save_pop_thm"ℕℝ_≤_thm"
);
=TEX
\section{THEOREMS ABOUT SUPREMA AND ADDITION}
=SML
end (* of structure ℝ part 5 *);
structure ⦏ℝ⦎ (* : ℝ *) = struct
open ℝ;
=TEX
=SML
val ⦏ℝ_sup_plus_thm⦎ = (
set_goal([], ⌜∀A a x⦁
	¬A = {} ∧ (∀x⦁x ∈ A ⇒ x ≤ a) ⇒ Sup A + x = Sup {t | ∃a⦁a ∈ A ∧ t < a + x}⌝);
a(REPEAT strip_tac THEN bc_thm_tac ℝ_eq_sup_bc_thm THEN
	PC_T1 "sets_ext" REPEAT strip_tac);
(* *** Goal "1" *** *)
a(GET_NTH_ASM_T 2 (PC_T1 "sets_ext" strip_asm_tac));
a(strip_asm_tac(∀_elim⌜x' + x⌝ℝ_unbounded_below_thm));
a(∃_tac⌜y⌝ THEN asm_prove_tac[]);
(* *** Goal "2" *** *)
a(LEMMA_T⌜x' + ~x ≤ (Sup A + x) + ~x⌝ ante_tac THEN_LIST
	[rewrite_tac[ℝ_plus_assoc_thm, ℝ_plus_clauses, ℝ_minus_clauses],
	 rewrite_tac[ℝ_≤_clauses]]);
a(bc_thm_tac ℝ_≤_sup_bc_thm);
a(LEMMA_T ⌜∃ a⦁ ∀ x⦁ x ∈ A ⇒ x ≤ a⌝ asm_rewrite_thm_tac
	THEN1 (∃_tac⌜a⌝ THEN asm_rewrite_tac[]));
a(REPEAT strip_tac);
a(LEMMA_T⌜x' + ~x ≤ (a' + x) + ~x⌝ ante_tac THEN1
	(rewrite_tac[ℝ_≤_clauses] THEN asm_rewrite_tac[ℝ_≤_def]));
a(rewrite_tac[ℝ_plus_assoc_thm, ℝ_plus_clauses, ℝ_minus_clauses]);
a(strip_tac THEN bc_thm_tac ℝ_≤_trans_thm THEN ∃_tac⌜a'⌝ THEN REPEAT strip_tac);
a(all_asm_fc_tac[]);
(* *** Goal "3" *** *)
a(LEMMA_T⌜(Sup A + x) + ~x ≤ x' + ~x⌝ ante_tac THEN_LIST
	[rewrite_tac[ℝ_plus_assoc_thm, ℝ_plus_clauses, ℝ_minus_clauses],
	 rewrite_tac[ℝ_≤_clauses]]);
a(bc_thm_tac ℝ_sup_≤_bc_thm);
a(LEMMA_T ⌜∃ a⦁ ∀ x⦁ x ∈ A ⇒ x ≤ a⌝ asm_rewrite_thm_tac
	THEN1 (∃_tac⌜a⌝ THEN asm_rewrite_tac[]));
a(REPEAT strip_tac);
a(LEMMA_T⌜(y + x) + ~x ≤ x' + ~x⌝ ante_tac THEN_LIST
	[rewrite_tac[ℝ_≤_clauses],
	 rewrite_tac[ℝ_plus_assoc_thm, ℝ_plus_clauses, ℝ_minus_clauses]]);
a(contr_tac THEN POP_ASM_T (strip_asm_tac o rewrite_rule[ℝ_¬_≤_less_thm]));
a(strip_asm_tac(list_∀_elim[⌜x'⌝, ⌜y + x⌝]ℝ_less_dense_thm));
a(spec_nth_asm_tac 5 ⌜z⌝ THEN1 all_asm_fc_tac[]);
a(swap_nth_asm_concl_tac 3 THEN asm_rewrite_tac[ℝ_¬_less_≤_thm]);
save_pop_thm"ℝ_sup_plus_thm"
);
=TEX
=SML
val ⦏ℝ_sup_plus_sup_thm⦎ = (
set_goal([], ⌜∀A a B b⦁
	¬A = {} ∧ (∀x⦁x ∈ A ⇒ x ≤ a) ∧
	¬B = {} ∧ (∀y⦁y ∈ B ⇒ y ≤ b)
⇒	Sup A + Sup B = Sup {t | ∃a b⦁a ∈ A ∧ b ∈ B ∧ t < a + b}⌝);
a(REPEAT strip_tac);
a(ALL_FC_T rewrite_tac[ℝ_sup_plus_thm]);
a(LEMMA_T ⌜	{v|∃ a⦁ a ∈ A ∧ v < a + Sup B}
	=	{t|∃ a b⦁ a ∈ A ∧ b ∈ B ∧ t < a + b}⌝ rewrite_thm_tac);
a(PC_T1 "sets_ext" REPEAT strip_tac);
(* *** Goal "1" *** *)
a(LEMMA_T⌜~a' + x < ~a' + (a' + Sup B)⌝ ante_tac THEN_LIST
	[asm_rewrite_tac[ℝ_less_clauses],
	rewrite_tac[ℝ_plus_assoc_thm1, ℝ_plus_clauses, ℝ_minus_clauses]] THEN strip_tac);
a(all_fc_tac[ℝ_less_sup_thm]);
a(∃_tac⌜a'⌝ THEN ∃_tac⌜y⌝ THEN REPEAT strip_tac);
a(POP_ASM_T ante_tac THEN once_rewrite_tac[ℝ_less_0_less_thm]);
a(rewrite_tac[ℝ_minus_clauses, ∀_elim⌜y⌝ ℝ_plus_order_thm]);
(* *** Goal "2" *** *)
a(∃_tac⌜a'⌝ THEN REPEAT strip_tac);
a(lemma_tac⌜b' ≤ Sup B⌝);
(* *** Goal "2.1" *** *)
a(bc_thm_tac ℝ_≤_sup_bc_thm);
a(LEMMA_T ⌜∃ b⦁ ∀ y⦁ y ∈ B ⇒ y ≤ b⌝ asm_rewrite_thm_tac
	THEN1 (∃_tac⌜b⌝ THEN asm_rewrite_tac[]));
a(REPEAT strip_tac THEN all_asm_fc_tac[]);
(* *** Goal "2.2" *** *)
a(bc_thm_tac ℝ_less_≤_trans_thm THEN ∃_tac⌜a' + b'⌝ THEN REPEAT strip_tac);
a(asm_rewrite_tac[ℝ_≤_clauses]);
save_pop_thm"ℝ_sup_plus_sup_thm"
);
=TEX
\section{SOME INDUCTION-LIKE PRINCIPLES}
In preparation for developing the theory of multiplication, we now develop two
induction-like principles.
The first says that if
{\em(i)} a property, $p$, holds in an open interval $(x, \epsilon)$
and {\em(ii)} $0 < \delta < \epsilon$
and {\em(iii)} if $p$ holds at $s +\delta$ whenever it holds at $s$, for$x < s$,
then $p$ holds for every $y > x$.

=SML
end (* of structure ℝ part 6 *);
structure ⦏ℝ⦎ (* : ℝ *) = struct
open ℝ;
=TEX

=SML
val ⦏ℝ_delta_induction_thm⦎ = (
set_goal([], ⌜∀x p⦁
	(∃d⦁ℕℝ 0 < d
	∧	(∃e⦁d < e ∧ (∀t⦁x < t ∧ t < x + e ⇒ p t))
	∧	(∀s⦁x < s ∧ p s ⇒ p (s + d)))
	⇒ (∀y⦁x < y ⇒ p y)
⌝);
a(REPEAT strip_tac);
a(lemma_tac⌜∃P⦁ P = {y | x < y ∧ ∀t⦁x < t ∧ t ≤ y ⇒ p t}⌝ THEN1 prove_∃_tac);
a(lemma_tac⌜∃c⦁ d < c ∧ x + c ∈ P⌝ THEN1 (POP_ASM_T rewrite_thm_tac THEN REPEAT strip_tac));
(* *** Goal "1" *** *)
a(lemma_tac⌜∃c⦁d < c ∧ c < e⌝ THEN1
	(contr_tac THEN all_fc_tac[ℝ_less_dense_thm] THEN all_asm_fc_tac[]));
a(∃_tac⌜c⌝ THEN asm_rewrite_tac[ℝ_less_clauses] THEN ALL_FC_T rewrite_tac[ℝ_less_trans_thm]);
a(REPEAT strip_tac);
a(lemma_tac⌜t < x + e⌝ THEN_LIST [id_tac, all_asm_fc_tac[]]);
a(bc_thm_tac ℝ_≤_less_trans_thm THEN ∃_tac ⌜x + c⌝ THEN REPEAT strip_tac);
a(asm_rewrite_tac[ℝ_less_clauses]);
(* *** Goal "2" *** *)
a(lemma_tac⌜¬ P = {}⌝ THEN1
	(PC_T1 "sets_ext" REPEAT strip_tac THEN ∃_tac ⌜x + c⌝ THEN REPEAT strip_tac));
a(cases_tac⌜∃a⦁∀ x⦁ x ∈ P ⇒ x ≤ a⌝);
(* *** Goal "2.1" *** *)
a(lemma_tac⌜Sup P + ~d < Sup P⌝ THEN1
	(rewrite_tac[ℝ_less_clauses] THEN
	 once_rewrite_tac[ℝ_less_0_less_thm] THEN asm_rewrite_tac[ℝ_plus_0_thm, ℝ_minus_clauses]));
a(lemma_tac ⌜∃v⦁ v ∈ P ∧ Sup P + ~d < v⌝ THEN1
	(contr_tac THEN all_fc_tac[ℝ_less_sup_thm] THEN all_asm_fc_tac[]));
a(lemma_tac⌜v + d ∈ P⌝);
(* *** Goal "2.1.1" *** *)
a(GET_ASM_T ⌜v ∈ P⌝ ante_tac THEN GET_NTH_ASM_T 8 rewrite_thm_tac THEN REPEAT strip_tac);
(* *** Goal "2.1.1.1" *** *)
a(bc_thm_tac ℝ_less_trans_thm THEN ∃_tac⌜v⌝ THEN REPEAT strip_tac
	THEN asm_rewrite_tac[ℝ_less_clauses]);
(* *** Goal "2.1.1.2" *** *)
a(cases_tac⌜t < Sup P⌝);
(* *** Goal "2.1.1.2.1" *** *)
a(LEMMA_T⌜∃u⦁ t < u ∧ u ∈ P⌝ ante_tac THEN1
	(contr_tac THEN all_fc_tac[ℝ_less_sup_thm] THEN all_asm_fc_tac[]));
a(GET_NTH_ASM_T 13 rewrite_thm_tac THEN rewrite_tac[ℝ_≤_def] THEN
	REPEAT strip_tac THEN all_asm_fc_tac[]);
(* *** Goal "2.1.1.2.2" *** *)
a(POP_ASM_T (strip_asm_tac o rewrite_rule[ℝ_¬_less_≤_thm]));
a(lemma_tac⌜x < t + ~d⌝);
(* *** Goal "2.1.1.2.2.1" *** *)
a(all_fc_tac[ℝ_∈_≤_sup_bc_thm]);
a(LEMMA_T⌜x + d < (t + ~d) + d⌝ (fn th => ante_tac th THEN rewrite_tac[ℝ_less_clauses]));
a(rewrite_tac[ℝ_plus_assoc_thm, ℝ_minus_clauses, ℝ_plus_0_thm]);
a(bc_thm_tac ℝ_less_≤_trans_thm THEN ∃_tac ⌜Sup P⌝ THEN REPEAT strip_tac);
a(bc_thm_tac ℝ_less_≤_trans_thm THEN ∃_tac ⌜x + c⌝ THEN REPEAT strip_tac);
a(asm_rewrite_tac[ℝ_less_clauses]);
(* *** Goal "2.1.1.2.2.2" *** *)
a(lemma_tac⌜p (t + ~ d)⌝);
(* *** Goal "2.1.1.2.2.2.1" *** *)
a(LEMMA_T⌜t + ~d ≤ (v + d) + ~d⌝ ante_tac THEN1 asm_rewrite_tac[ℝ_≤_clauses]);
a(rewrite_tac[ℝ_plus_assoc_thm, ℝ_minus_clauses, ℝ_plus_0_thm] THEN strip_tac);
a(all_asm_fc_tac[]);
(* *** Goal "2.1.1.2.2.2.2" *** *)
a(LEMMA_T⌜p ((t + ~d) + d)⌝ ante_tac THEN1 all_asm_fc_tac[]);
a(rewrite_tac[ℝ_plus_assoc_thm, ℝ_minus_clauses, ℝ_plus_0_thm]);
(* *** Goal "2.1.2" *** *)
a(LEMMA_T ⌜(Sup P + ~d) + d < v + d⌝ ante_tac THEN1 asm_rewrite_tac[ℝ_less_clauses]);
a(rewrite_tac[ℝ_plus_assoc_thm, ℝ_minus_clauses, ℝ_plus_0_thm] THEN strip_tac);
a(lemma_tac ⌜v + d ≤ Sup P⌝ THEN1 all_fc_tac[ℝ_∈_≤_sup_bc_thm]);
a(all_fc_tac[ℝ_≤_less_trans_thm] THEN all_fc_tac[ℝ_less_irrefl_thm]);
(* *** Goal "2.2" *** *)
a(spec_nth_asm_tac 1 ⌜y⌝);
a(POP_ASM_T ante_tac THEN rewrite_tac[ℝ_¬_≤_less_thm] THEN strip_tac);
a(DROP_NTH_ASM_T 2 ante_tac THEN asm_rewrite_tac[] THEN REPEAT strip_tac);
a(lemma_tac ⌜y ≤ x'⌝ THEN1 asm_rewrite_tac[ℝ_≤_def]);
a(all_asm_fc_tac[]);
save_pop_thm"ℝ_delta_induction_thm"
);
=TEX
=SML
fun ⦏ℝ_delta_induction_tac⦎ (tm : TERM) : TACTIC = (
	if not (is_var tm andalso type_of tm =: ℝ_ty)
	then term_fail "ℝ_delta_induction_tac" 116001 [tm]
	else ( fn(asms, conc) =>
	let	val asm = find asms (fn t => is_ℝ_less t andalso snd(dest_ℝ_less t) =$ tm)
			handle Fail _ => fail "ℝ_delta_induction_tac" 116002 [];
		val thm = ∀_elim (fst(dest_ℝ_less asm)) ℝ_delta_induction_thm;
	in	if not (is_free_in tm conc)
			then term_fail "ℝ_delta_induction_tac" 116003 [tm]
		else if any (asms drop (fn t => t =$ asm)) (is_free_in tm)
			then term_fail "ℝ_delta_induction_tac" 116004 [tm]
		else	(asm_ante_tac asm THEN gen_induction_tac1 thm) (asms, conc)
	end
	)
);
(*
=TEX
Not used --- commented out for the present.

The second induction-like principle is ``proof by continuity'':
if a property, $p$, holds on a dense subset of the reals and if
for every $y$, whenever $x < y$, there is a $z$ between $x$ and $y$
for which $p$ holds then $p$ holds everywhere.
=SML
val ⦏ℝ_dense_induction_thm⦎ = (
set_goal([], ⌜∀p : ℝ → BOOL⦁
		(∀x y⦁x < y ⇒ ∃z⦁ x < z ∧ z < y ∧ p z)
	∧	(∀y⦁(∀x⦁x < y ⇒ ∃z⦁ x < z ∧ z < y ∧ p z) ⇒ p y)
	⇒	(∀x⦁p x)
⌝);
a(REPEAT strip_tac);
a(POP_ASM_T bc_thm_tac THEN contr_tac THEN all_asm_fc_tac[] THEN all_asm_fc_tac[]);
save_pop_thm"ℝ_dense_induction_thm"
);
=SML
val ⦏ℝ_dense_induction_tac⦎ = gen_induction_tac ℝ_dense_induction_thm;
*)
=TEX
\section{MULTIPLICATION}
Our approach to multiplication is based on order-preserving homomorphisms.
We need a number of lemmas of various degress of difficulty.

\subsection{Order Preserving Mappings}

We show that an order-preserving mapping is strictly order-preserving
in a suitable sense:
=SML
end (* of structure ℝ part 7 *);
structure ⦏ℝ⦎ (* : ℝ *) = struct
open ℝ;
=TEX

=SML
val ⦏ℝ_ord_pres_strict_thm⦎ = (
set_goal([], ⌜∀f : ℝ → ℝ⦁
		(∀x y⦁x < y ⇒ f x < f y)
	⇒	(∀x y⦁f x < f y ⇒ x < y)
⌝);
a(REPEAT strip_tac);
a(strip_asm_tac(list_∀_elim[⌜x⌝, ⌜y⌝]ℝ_less_cases_thm));
(* *** Goal "1" *** *)
a(all_var_elim_asm_tac THEN all_fc_tac[ℝ_less_irrefl_thm]);
(* *** Goal "2" *** *)
a(all_asm_fc_tac[] THEN all_fc_tac[ℝ_less_antisym_thm]);
save_pop_thm"ℝ_ord_pres_strict_thm"
);
=TEX
\subsection{Additive Homomorphisms}
Now we show some elementary properties of homomorphisms
of the additive structure:

A homomorphism maps the unit to itself:

=SML
val ⦏ℝ_add_hom_0_thm⦎ = (
set_goal([], ⌜∀f : ℝ → ℝ⦁
		(∀x y⦁f (x + y) = f x + f y)
	⇒	(∀x⦁ f (ℕℝ 0) = ℕℝ 0)
⌝);
a(REPEAT strip_tac);
a(LEMMA_T ⌜f (x + ℕℝ 0) = f x⌝ ante_tac THEN1 rewrite_tac[ℝ_plus_clauses]);
a(asm_rewrite_tac[] THEN rewrite_tac[ℝ_plus_clauses]);
save_pop_thm"ℝ_add_hom_0_thm"
);
=TEX
Homomorphisms commute with the inverse operator:

=SML
val ⦏ℝ_add_hom_minus_thm⦎ = (
set_goal([], ⌜∀f : ℝ → ℝ⦁
		(∀x y⦁f (x + y) = f x + f y)
	⇒	(∀x⦁ f (~x) = ~ (f x))
⌝);
a(REPEAT strip_tac);
a(LEMMA_T⌜f(~x + x) = f (ℕℝ 0)⌝ ante_tac THEN1 rewrite_tac[ℝ_minus_clauses]);
a(ALL_FC_T rewrite_tac[ℝ_add_hom_0_thm]);
a(asm_rewrite_tac[] THEN strip_tac);
a(once_rewrite_tac[ℝ_eq_thm]);
a(asm_rewrite_tac[ℝ_minus_clauses]);
save_pop_thm"ℝ_add_hom_minus_thm"
);
=TEX
The following theorem is a labour-saver in proving that a homomorphism defined
by extending a homomorphism of the monoid of non-negative elements is
itself a group homomorphism:
=SML
val ⦏ℝ_add_hom_extension_thm⦎ = (
set_goal([], ⌜∀f : ℝ → ℝ⦁
		(∀x y⦁ℕℝ 0 ≤ x ∧ ℕℝ 0 ≤ y ⇒ f (x + y) = f x + f y)
	∧	(∀x⦁ ℕℝ 0 ≤ x ⇒ f (~x) = ~(f x))
	⇒	(∀x y⦁f (x + y) = f x + f y)
⌝);
a(REPEAT strip_tac);
a(lemma_tac⌜∀v⦁f (~v) = ~(f v)⌝);
(* *** Goal "1" *** *)
a(REPEAT strip_tac);
a(strip_asm_tac(list_∀_elim[⌜ℕℝ 0⌝, ⌜v⌝] ℝ_≤_cases_thm) THEN1 ALL_ASM_FC_T rewrite_tac[]);
a(POP_ASM_T (strip_asm_tac o
	rewrite_rule[ℝ_plus_clauses] o once_rewrite_rule[ℝ_≤_0_≤_thm]));
a(spec_nth_asm_tac 2 ⌜~v⌝ THEN POP_ASM_T ante_tac THEN once_rewrite_tac[ℝ_eq_thm]);
a(rewrite_tac[ℝ_minus_clauses, ∀_elim⌜f v⌝ ℝ_plus_order_thm]);
(* *** Goal "2" *** *)
a(DROP_NTH_ASM_T 2 discard_tac);
a(lemma_tac⌜∀v w⦁ℕℝ 0 ≤ w ⇒ f (v + w) = f v + f w⌝);
(* *** Goal "2.1" *** *)
a(REPEAT strip_tac);
a(strip_asm_tac(list_∀_elim[⌜ℕℝ 0⌝, ⌜v⌝] ℝ_≤_cases_thm) THEN1 ALL_ASM_FC_T rewrite_tac[]);
a(POP_ASM_T (strip_asm_tac o
	rewrite_rule[ℝ_plus_clauses] o once_rewrite_rule[ℝ_≤_0_≤_thm]));
a(strip_asm_tac(list_∀_elim[⌜ℕℝ 0⌝, ⌜v + w⌝] ℝ_≤_cases_thm));
(* *** Goal "2.1.1" *** *)
a(LEMMA_T⌜f(~v) + f(v + w) = f(~v + (v + w))⌝ ante_tac THEN1 ALL_ASM_FC_T rewrite_tac[]);
a(once_rewrite_tac[ℝ_eq_thm]);
a(asm_rewrite_tac[∀_elim⌜w⌝ ℝ_plus_order_thm, ∀_elim⌜f (v + w)⌝ ℝ_plus_order_thm,
	ℝ_plus_clauses, ℝ_minus_clauses, ℝ_plus_assoc_thm]);
(* *** Goal "2.1.2" *** *)
a(POP_ASM_T (strip_asm_tac o
	rewrite_rule[ℝ_plus_clauses] o once_rewrite_rule[ℝ_≤_0_≤_thm]));
a(LEMMA_T⌜f(w + ~(v + w)) = f w + f(~(v + w))⌝ ante_tac THEN1 ALL_ASM_FC_T rewrite_tac[]);
a(once_rewrite_tac[ℝ_eq_thm]);
a(asm_rewrite_tac[∀_elim⌜~v⌝ ℝ_plus_order_thm, ∀_elim⌜f (v + w)⌝ ℝ_plus_order_thm,
	ℝ_plus_clauses, ℝ_minus_clauses, ℝ_plus_assoc_thm]);
(* *** Goal "2.2" *** *)
a(strip_asm_tac(list_∀_elim[⌜ℕℝ 0⌝, ⌜y⌝] ℝ_≤_cases_thm) THEN1 ALL_ASM_FC_T rewrite_tac[]);
a(strip_asm_tac(list_∀_elim[⌜ℕℝ 0⌝, ⌜x + y⌝] ℝ_≤_cases_thm));
(* *** Goal "2.2.1" *** *)
a(LEMMA_T⌜f (~y) + f(x + y) = f(~y + x + y)⌝ ante_tac THEN1 ALL_ASM_FC_T rewrite_tac[]);
a(once_rewrite_tac[ℝ_eq_thm]);
a(asm_rewrite_tac[∀_elim⌜x⌝ ℝ_plus_order_thm, ∀_elim⌜f (x + y)⌝ ℝ_plus_order_thm,
	ℝ_plus_clauses, ℝ_minus_clauses, ℝ_plus_assoc_thm]);
a(rewrite_tac[∀_elim⌜~(f y)⌝ ℝ_plus_order_thm]);
(* *** Goal "2.2.2" *** *)
a(DROP_NTH_ASM_T 2 (strip_asm_tac o
	rewrite_rule[ℝ_plus_clauses] o once_rewrite_rule[ℝ_≤_0_≤_thm]));
a(DROP_NTH_ASM_T 2 (strip_asm_tac o
	rewrite_rule[ℝ_plus_clauses] o once_rewrite_rule[ℝ_≤_0_≤_thm]));
a(LEMMA_T ⌜x + y = ~(~x + ~y)⌝ asm_rewrite_thm_tac THEN1 rewrite_tac[ℝ_minus_clauses]);
a(LEMMA_T⌜f(~x + ~y) = f(~x) + f (~y)⌝ asm_rewrite_thm_tac THEN1 ALL_ASM_FC_T rewrite_tac[]);
a(rewrite_tac[ℝ_minus_clauses]);
save_pop_thm"ℝ_add_hom_extension_thm"
);
=TEX
\subsection{Subgroups, Submonoids and Subsemigroups}

Now using the $\delta$-induction principle, we show that if a submonoid, $G$,
of the reals contains a positive element, then $G$ meets every interval of
positive numbers of width $\delta$.
=SML
val ⦏ℝ_monoid_delta_dense_thm⦎ = (
set_goal([], ⌜∀G d⦁
		(ℕℝ 0 ∈ G)
	∧	(∀g h⦁ g ∈ G ∧ h ∈ G ⇒ g + h ∈ G)
	∧	d ∈ G
	∧	ℕℝ 0 < d
	⇒	(∀x⦁ ℕℝ 0 < x ⇒ ∃g⦁g ∈ G ∧ g ≤ x ∧ x < g + d)
⌝);
a(REPEAT strip_tac);
a(ℝ_delta_induction_tac ⌜x⌝);
a(∃_tac⌜d⌝ THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(all_fc_tac[ℝ_less_dense_thm]);
a(∃_tac⌜d + z⌝ THEN REPEAT strip_tac THEN1 asm_rewrite_tac[ℝ_less_clauses]);
a(POP_ASM_T ante_tac THEN  asm_rewrite_tac[ℝ_plus_clauses] THEN strip_tac);
a(cases_tac⌜t < d⌝);
(* *** Goal "1.1" *** *)
a(∃_tac⌜ℕℝ 0⌝ THEN asm_rewrite_tac[ℝ_less_clauses, ℝ_plus_clauses, ℝ_≤_def]);
(* *** Goal "1.2" *** *)
a(POP_ASM_T ante_tac THEN  asm_rewrite_tac[ℝ_¬_less_≤_thm] THEN strip_tac);
a(∃_tac⌜d⌝ THEN asm_rewrite_tac[]);
a(bc_thm_tac ℝ_less_trans_thm THEN ∃_tac⌜d + z⌝ THEN asm_rewrite_tac[ℝ_less_clauses]);
(* *** Goal "2" *** *)
a(lemma_tac⌜g + d ∈ G⌝ THEN1 all_asm_fc_tac[]);
a(∃_tac⌜g + d⌝ THEN asm_rewrite_tac[ℝ_less_clauses, ℝ_≤_clauses]);
save_pop_thm"ℝ_monoid_delta_dense_thm"
);
=TEX
Now we show that a monoid which contains arbitrarily small positive elements
is dense in the set of positive elements:
=SML
val ⦏ℝ_monoid_dense_thm⦎ = (
set_goal([], ⌜∀G⦁
		(ℕℝ 0 ∈ G)
	∧	(∀g h⦁ g ∈ G ∧ h ∈ G ⇒ g + h ∈ G)
	∧	(∀x⦁ℕℝ 0 < x ⇒ ∃g⦁ g ∈ G ∧ ℕℝ 0 < g ∧ g < x)
	⇒	(∀x y⦁ℕℝ 0 < x ∧ x < y ⇒ ∃g⦁g ∈ G ∧ x < g ∧ g < y)
⌝);
a(REPEAT strip_tac);
a(lemma_tac ⌜ℕℝ 0 < y + ~x⌝ THEN1
	(POP_ASM_T ante_tac THEN once_rewrite_tac[ℝ_less_0_less_thm]
	THEN rewrite_tac[ℝ_plus_clauses, ℝ_minus_clauses]));
a(spec_nth_asm_tac 4 ⌜y + ~x⌝);
a(strip_asm_tac(list_∀_elim[⌜G⌝, ⌜g⌝]ℝ_monoid_delta_dense_thm)
	THEN1 all_asm_fc_tac[]);
a(POP_ASM_T (strip_asm_tac o ∀_elim⌜x⌝));
a(lemma_tac ⌜g' + g ∈ G⌝ THEN1 (GET_NTH_ASM_T 11 bc_thm_tac THEN REPEAT strip_tac));
a(∃_tac⌜g' + g⌝ THEN REPEAT strip_tac);
a(bc_thm_tac ℝ_≤_less_trans_thm THEN ∃_tac⌜x + g⌝ THEN1 asm_rewrite_tac[ℝ_≤_clauses]);
a(LEMMA_T ⌜x + g < x + (y + ~x)⌝ ante_tac THEN1 asm_rewrite_tac[ℝ_less_clauses]);
a(rewrite_tac[∀_elim⌜y⌝ℝ_plus_order_thm, ℝ_minus_clauses, ℝ_plus_0_thm]);
save_pop_thm"ℝ_monoid_dense_thm"
);
=TEX
The analogous result for subgroups:
=SML
val ⦏ℝ_subgroup_dense_thm⦎ = (
set_goal([], ⌜∀G⦁
		(ℕℝ 0 ∈ G)
	∧	(∀g h⦁ g ∈ G ∧ h ∈ G ⇒ g + h ∈ G)
	∧	(∀g⦁ g ∈ G ⇒ ~g ∈ G)
	∧	(∀x⦁ℕℝ 0 < x ⇒ ∃g⦁ g ∈ G ∧ ℕℝ 0 < g ∧ g < x)
	⇒	(∀x y⦁x < y ⇒ ∃g⦁g ∈ G ∧ x < g ∧ g < y)
⌝);
a(REPEAT strip_tac);
a(strip_asm_tac(∀_elim⌜G⌝ ℝ_monoid_dense_thm) THEN1 all_asm_fc_tac[]);
(* *** Goal "1" *** *)
a(all_asm_fc_tac[] THEN all_asm_fc_tac[]);
(* *** Goal "2" *** *)
a(strip_asm_tac(list_∀_elim[⌜ℕℝ 0⌝, ⌜x⌝] ℝ_less_cases_thm));
(* *** Goal "2.1" *** *)
a(GET_NTH_ASM_T 2 bc_thm_tac THEN REPEAT strip_tac);
(* *** Goal "2.2" *** *)
a(all_var_elim_asm_tac1 THEN GET_NTH_ASM_T 3 bc_thm_tac THEN REPEAT strip_tac);
(* *** Goal "2.3" *** *)
a(strip_asm_tac(list_∀_elim[⌜y⌝, ⌜ℕℝ 0⌝] ℝ_less_cases_thm));
(* *** Goal "2.3.1" *** *)
a(LIST_DROP_NTH_ASM_T [1, 2, 4] (MAP_EVERY
	(strip_asm_tac o
	 conv_rule (TRY_C (rewrite_conv[ℝ_plus_clauses])) o
	 once_rewrite_rule[ℝ_less_0_less_thm])));
a(lemma_tac⌜~y < ~x⌝);
(* *** Goal "2.3.1.1" *** *)
a(once_rewrite_tac[ℝ_less_0_less_thm] THEN once_rewrite_tac[ℝ_plus_comm_thm]);
a(asm_rewrite_tac[ℝ_minus_clauses]);
(* *** Goal "2.3.1.2" *** *)
a(list_spec_nth_asm_tac 5 [⌜~y⌝, ⌜~x⌝]);
a(∃_tac ⌜~g⌝ THEN ALL_ASM_FC_T rewrite_tac[]);
a(LIST_GET_NTH_ASM_T [1, 2] (MAP_EVERY ante_tac));
a(once_rewrite_tac[ℝ_less_0_less_thm]);
a(rewrite_tac[ℝ_minus_clauses,  ∀_elim⌜g⌝ℝ_plus_order_thm, ∀_elim⌜~g⌝ℝ_plus_order_thm]
	THEN taut_tac);
(* *** Goal "2.3.2" *** *)
a(all_var_elim_asm_tac1);
a(DROP_NTH_ASM_T	2 (strip_asm_tac o rewrite_rule[ℝ_plus_clauses] o
	 once_rewrite_rule[ℝ_less_0_less_thm]));
a(spec_nth_asm_tac 3 ⌜~x⌝);
a(∃_tac ⌜~g⌝ THEN ALL_ASM_FC_T rewrite_tac[]);
a(LIST_GET_NTH_ASM_T [1, 2] (MAP_EVERY ante_tac));
a(once_rewrite_tac[ℝ_less_0_less_thm]);
a(rewrite_tac[ℝ_minus_clauses,  ∀_elim⌜g⌝ℝ_plus_order_thm, ∀_elim⌜~g⌝ℝ_plus_order_thm]
	THEN taut_tac);
(* *** Goal "2.3.3" *** *)
a(∃_tac ⌜ℕℝ 0⌝ THEN REPEAT strip_tac);
save_pop_thm"ℝ_subgroup_dense_thm"
);
=TEX
\ldots and for subsemigroups:
=SML
val ⦏ℝ_semigroup_dense_thm⦎ = (
set_goal([], ⌜∀G⦁
		(∀g h⦁ g ∈ G ∧ h ∈ G ⇒ g + h ∈ G)
	∧	(∀x⦁ℕℝ 0 < x ⇒ ∃g⦁ g ∈ G ∧ ℕℝ 0 < g ∧ g < x)
	⇒	(∀x y⦁ℕℝ 0 < x ∧ x < y ⇒ ∃g⦁g ∈ G ∧ x < g ∧ g < y)
⌝);
a(REPEAT strip_tac);
a(lemma_tac⌜∃M⦁ M = {t | t ∈ G ∨ t = ℕℝ 0}⌝ THEN1 prove_∃_tac);
a(lemma_tac⌜	ℕℝ 0 ∈ M
	∧	(∀g h⦁ g ∈ M ∧ h ∈ M ⇒ g + h ∈ M)
	∧	(∀x⦁ℕℝ 0 < x ⇒ ∃g⦁ g ∈ M ∧ ℕℝ 0 < g ∧ g < x)⌝THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(POP_ASM_T ante_tac THEN POP_ASM_T ante_tac THEN asm_rewrite_tac[]);
a(REPEAT strip_tac);
(* *** Goal "2.1" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "2.2" *** *)
a(swap_nth_asm_concl_tac 1 THEN asm_rewrite_tac[ℝ_plus_clauses]);
(* *** Goal "2.3" *** *)
a(swap_nth_asm_concl_tac 1 THEN asm_rewrite_tac[ℝ_plus_clauses]);
(* *** Goal "2.4" *** *)
a(asm_rewrite_tac[ℝ_plus_clauses]);
(* *** Goal "3" *** *)
a(spec_nth_asm_tac 5 ⌜x'⌝);
a(∃_tac⌜g⌝ THEN asm_rewrite_tac[]);
(* *** Goal "4" *** *)
a(all_fc_tac[ℝ_monoid_dense_thm]);
a(∃_tac⌜g⌝ THEN asm_rewrite_tac[]);
a(DROP_NTH_ASM_T 3 ante_tac THEN asm_rewrite_tac[]);
a(lemma_tac⌜ℕℝ 0 < g⌝ THEN1 all_fc_tac[ℝ_less_trans_thm]);
a(LEMMA_T⌜¬g = ℕℝ 0⌝ rewrite_thm_tac THEN1
	(contr_tac THEN all_var_elim_asm_tac1 THEN all_fc_tac[ℝ_less_irrefl_thm]));
save_pop_thm"ℝ_semigroup_dense_thm"
);
=TEX
Now back to generalities: the image of a homomorphism is a group:
=SML
val ⦏ℝ_add_hom_image_group_thm⦎ = (
set_goal([], ⌜∀f : ℝ → ℝ; I⦁
		(∀x y⦁f (x + y) = f x + f y)
	∧	(I = {b | ∃ a⦁ b = f a })
	⇒	ℕℝ 0 ∈ I
	∧	(∀g h⦁ g ∈ I ∧ h ∈ I ⇒ g + h ∈ I)
	∧	(∀g⦁ g ∈ I ⇒ ~g ∈ I)
⌝);
a(REPEAT strip_tac THEN all_var_elim_asm_tac1);
(* *** Goal "1" *** *)
a(PC_T1 "sets_ext" REPEAT strip_tac THEN ∃_tac⌜ℕℝ 0⌝);
a(ALL_FC_T asm_rewrite_tac[ℝ_add_hom_0_thm]);
(* *** Goal "2" *** *)
a(PC_T1 "sets_ext" REPEAT strip_tac THEN ∃_tac⌜a + a'⌝ THEN asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(PC_T1 "sets_ext" REPEAT strip_tac THEN ∃_tac⌜~a⌝);
a(ALL_FC_T asm_rewrite_tac[ℝ_add_hom_minus_thm]);
save_pop_thm"ℝ_add_hom_image_group_thm"
);
=TEX
\ldots and, for completeness (we don't seem to need it here) we show
that the kernel of a homomorphism is a group:
=SML
val ⦏ℝ_add_hom_kernel_group_thm⦎ = (
set_goal([], ⌜∀f : ℝ → ℝ; K⦁
		(∀x y⦁f (x + y) = f x + f y)
	∧	(K = {a | f a = ℕℝ 0 })
	⇒	ℕℝ 0 ∈ K
	∧	(∀g h⦁ g ∈ K ∧ h ∈ K ⇒ g + h ∈ K)
	∧	(∀g⦁ g ∈ K ⇒ ~g ∈ K)
⌝);
a(REPEAT strip_tac THEN all_var_elim_asm_tac1);
(* *** Goal "1" *** *)
a(PC_T1 "sets_ext" REPEAT strip_tac THEN ALL_FC_T rewrite_tac[ℝ_add_hom_0_thm]);
(* *** Goal "2" *** *)
a(PC_T1 "sets_ext" REPEAT strip_tac THEN asm_rewrite_tac[ℝ_plus_clauses]);
(* *** Goal "3" *** *)
a(PC_T1 "sets_ext" REPEAT strip_tac THEN ALL_FC_T asm_rewrite_tac[ℝ_add_hom_minus_thm]);
a(rewrite_tac[ℝ_minus_clauses]);
save_pop_thm"ℝ_add_hom_kernel_group_thm"
);
=TEX
\subsection{Order-preserving Additive Homomorphisms}

For brevity, we characterise order-preserving homomorphisms as those that
send positive numbers to positive numbers.
First we show that such homomorphisms do indeed preserve the ordering:
=SML
val ⦏ℝ_opah_thm⦎ = (
set_goal([], ⌜∀f : ℝ → ℝ⦁
		(∀x y⦁f (x + y) = f x + f y)
	∧	(∀x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < f x)
	⇒	(∀x y⦁x < y ⇒ f x < f y)
⌝);
a(REPEAT strip_tac);
a(POP_ASM_T ante_tac THEN once_rewrite_tac[ℝ_less_0_less_thm] THEN REPEAT strip_tac);
a(ALL_ASM_FC_T (MAP_EVERY ante_tac)[]);
a(asm_rewrite_tac[]);
a(ALL_FC_T rewrite_tac[ℝ_add_hom_minus_thm]);
save_pop_thm"ℝ_opah_thm"
);
=TEX
Next we show that the implication in the previous theorem can be reversed:
=SML
val ⦏ℝ_opah_strict_thm⦎ = (
set_goal([], ⌜∀f : ℝ → ℝ⦁
		(∀x y⦁f (x + y) = f x + f y)
	∧	(∀x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < f x)
	⇒	(∀x y⦁f x < f y ⇒ x < y)
⌝);
a(REPEAT strip_tac);
a(lemma_tac ⌜∀x y⦁x < y ⇒ f x < f y⌝);
(* *** Goal "1" *** *)
a(REPEAT strip_tac THEN all_fc_tac[ℝ_opah_thm]);
(* *** Goal "2" *** *)
a(all_fc_tac[ℝ_ord_pres_strict_thm]);
save_pop_thm"ℝ_opah_strict_thm"
);
=TEX
Now we can show that order-preserving homomorphisms are injective functions:
=SML
val ⦏ℝ_opah_one_one_thm⦎ = (
set_goal([], ⌜∀f : ℝ → ℝ⦁
		(∀x y⦁f (x + y) = f x + f y)
	∧	(∀x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < f x)
	⇒	OneOne f
⌝);
a(rewrite_tac[one_one_def] THEN REPEAT strip_tac);
a(POP_ASM_T ante_tac THEN once_rewrite_tac[ℝ_eq_thm] THEN strip_tac);
a(strip_asm_tac(list_∀_elim[⌜x1 + ~x2⌝, ⌜ℕℝ 0⌝]ℝ_less_cases_thm));
(* *** Goal "1" *** *)
a(POP_ASM_T ante_tac THEN once_rewrite_tac[ℝ_less_0_less_thm]);
a(rewrite_tac[ℝ_minus_clauses, ℝ_plus_0_thm]);
a(strip_tac THEN ALL_ASM_FC_T (MAP_EVERY ante_tac)[]);
a(asm_rewrite_tac[]);
a(once_rewrite_tac[ℝ_less_less_0_thm]);
a(rewrite_tac[ℝ_minus_clauses, ℝ_plus_0_thm]);
a(ALL_FC_T rewrite_tac[ℝ_add_hom_minus_thm]);
a(asm_rewrite_tac[ℝ_minus_clauses, ℝ_less_irrefl_thm]);
(* *** Goal "2" *** *)
a(ALL_ASM_FC_T (MAP_EVERY ante_tac)[]);
a(asm_rewrite_tac[] THEN ALL_FC_T rewrite_tac[ℝ_add_hom_minus_thm]);
a(asm_rewrite_tac[ℝ_less_irrefl_thm]);
save_pop_thm"ℝ_opah_one_one_thm"
);
=TEX
Next we show that the image of an order-preserving homomorphism
contains positive numbers arbitrarily close to $0$:
=SML
val ⦏ℝ_opah_dense_image_thm⦎ = (
set_goal([], ⌜∀f e⦁
		(∀x y⦁f (x + y) = f x + f y)
	∧	(∀x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < f x)
	∧	ℕℝ 0 < e
	⇒	∃d⦁ ℕℝ 0 < d ∧ f d < e
⌝);
a(contr_tac);
a(lemma_tac⌜∃N⦁ N = {r | ∃t⦁ t < ℕℝ 0 ∧ r = f t}⌝ THEN1 prove_∃_tac);
(* *** Goal "1" *** *)
a(lemma_tac⌜f(~(ℕℝ 1)) ∈ N⌝ THEN1 POP_ASM_T rewrite_thm_tac);
a(∃_tac⌜~(ℕℝ 1)⌝	THEN rewrite_tac[]);
a(once_rewrite_tac[ℝ_less_0_less_thm] THEN rewrite_tac[ℝ_minus_clauses, ℝ_less_clauses]);
(* *** Goal "2" *** *)
a(lemma_tac⌜¬N = {}⌝ THEN1 PC_T1 "sets_ext" asm_prove_tac[]);
a(lemma_tac⌜∀x⦁ x ∈ N ⇒ x ≤ ℕℝ 0⌝);
(* *** Goal "2.1" *** *)
a(asm_rewrite_tac[] THEN REPEAT strip_tac);
a(all_var_elim_asm_tac1);
a(rewrite_tac[ℝ_≤_¬_less_thm] THEN contr_tac);
a(lemma_tac ⌜f t < f(ℕℝ 0)⌝ THEN1 all_fc_tac[ℝ_opah_thm]);
a(POP_ASM_T ante_tac THEN ALL_FC_T rewrite_tac[ℝ_add_hom_0_thm] THEN contr_tac);
a(all_fc_tac[ℝ_less_trans_thm] THEN all_fc_tac[ℝ_less_irrefl_thm]);
(* *** Goal "2.2" *** *)
a(cases_tac⌜¬Sup N ∈ N⌝);
(* *** Goal "2.2.1" *** *)
a(LEMMA_T⌜(Sup N + ~e) < (Sup N + ~e) + e⌝ ante_tac THEN1 asm_rewrite_tac[ℝ_less_clauses]);
a(rewrite_tac[ℝ_plus_assoc_thm, ℝ_minus_clauses, ℝ_plus_0_thm] THEN contr_tac);
a(lemma_tac⌜∃a⦁a ∈ N ∧ Sup N + ~e < a ∧ a < Sup N⌝);
(* *** Goal "2.2.1.1" *** *)
a(all_fc_tac[ℝ_less_sup_∈_thm]);
a(∃_tac⌜y⌝ THEN REPEAT strip_tac);
(* *** Goal "2.2.1.2" *** *)
a(lemma_tac⌜∃b⦁b ∈ N ∧ a < b ∧ b < Sup N⌝);
(* *** Goal "2.2.1.2.1" *** *)
a(DROP_NTH_ASM_T 4 discard_tac THEN all_fc_tac[ℝ_less_sup_∈_thm]);
a(∃_tac⌜y⌝ THEN REPEAT strip_tac);
(* *** Goal "2.2.1.2.2" *** *)
a(lemma_tac⌜b + ~a < e⌝);
(* *** Goal "2.2.1.2.2.1" *** *)
a(LEMMA_T ⌜(b + ~a) + a < e + a⌝ ante_tac THEN_LIST
	[id_tac, rewrite_tac[ℝ_less_clauses]]);
a(rewrite_tac[ℝ_plus_assoc_thm, ℝ_minus_clauses, ℝ_plus_clauses]);
a(bc_thm_tac ℝ_less_trans_thm THEN ∃_tac⌜Sup N⌝ THEN REPEAT strip_tac);
a(LEMMA_T ⌜~e + Sup N < ~e + (e + a)⌝ ante_tac THEN_LIST
	[id_tac, rewrite_tac[ℝ_less_clauses]]);
a(rewrite_tac[ℝ_plus_assoc_thm1, ℝ_minus_clauses, ℝ_plus_clauses]);
a(once_rewrite_tac[ℝ_plus_comm_thm] THEN REPEAT strip_tac);
a(GET_ASM_T ⌜a ∈ N⌝ ante_tac THEN GET_ASM_T ⌜b ∈ N⌝ ante_tac);
a(LIST_GET_NTH_ASM_T [13] rewrite_tac THEN REPEAT strip_tac);
a(var_elim_asm_tac ⌜a = f t'⌝ THEN var_elim_asm_tac ⌜b = f t⌝);
a(lemma_tac⌜t' < t⌝ THEN1 all_fc_tac[ℝ_opah_strict_thm]);
a(POP_ASM_T (strip_asm_tac o once_rewrite_rule[ℝ_less_0_less_thm]));
a(lemma_tac⌜f(t + ~t') < e⌝ THEN1
	(asm_rewrite_tac[] THEN ALL_FC_T asm_rewrite_tac[ℝ_add_hom_minus_thm]));
a(spec_nth_asm_tac 17 ⌜t + ~t'⌝);
(* *** Goal "2.2.2" *** *)
a(lemma_tac⌜∃s⦁s = Sup N⌝ THEN1 prove_∃_tac);
a(LEMMA_T ⌜s ∈ N⌝ ante_tac THEN1 var_elim_asm_tac⌜s = Sup N⌝);
a(rewrite_tac[] THEN once_asm_rewrite_tac[]);
a(POP_ASM_T discard_tac THEN contr_tac);
a(all_fc_tac[∀_elim⌜t⌝ℝ_less_dense_thm]);
a(lemma_tac⌜f t < f z⌝ THEN1 all_fc_tac[ℝ_opah_thm]);
a(lemma_tac⌜f z ∈ N⌝ THEN1 (asm_rewrite_tac[] THEN REPEAT strip_tac));
(* *** Goal "2.2.2.1" *** *)
a(∃_tac ⌜z⌝ THEN REPEAT strip_tac);
(* *** Goal "2.2.2.2" *** *)
a(lemma_tac⌜f z ≤ Sup N⌝ THEN1 all_fc_tac[ℝ_sup_thm]);
a(lemma_tac⌜Sup N < f z⌝ THEN1 LIST_GET_NTH_ASM_T [3, 6] rewrite_tac);
a(strip_asm_tac(list_∀_elim[⌜f z⌝, ⌜Sup N⌝]ℝ_≤_less_trans_thm));
a(all_asm_fc_tac[] THEN all_fc_tac[ℝ_less_irrefl_thm]);
save_pop_thm"ℝ_opah_dense_image_thm"
);
=TEX
As a consequence of the previous theorem
we can no show that order-preserving homomorphisms are surjective.
The reasoning is that the image of such a homomorphism is dense (by the above
results) and complete (because it is order-isomorphic to the reals).
By a general result on orderings, we infer that the image is the set of all reals.
=SML
val ⦏ℝ_opah_onto_thm⦎ = (
set_goal([], ⌜∀f : ℝ → ℝ⦁
		(∀x y⦁f (x + y) = f x + f y)
	∧	(∀x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < f x)
	⇒	Onto f
⌝);
a(rewrite_tac[onto_def] THEN REPEAT strip_tac);
a(lemma_tac ⌜∃I⦁ I = {b | ∃ a⦁ b = f a}⌝ THEN1 prove_∃_tac);
a(lemma_tac⌜I DenseIn(Universe, $<) ∧ Complete(I, $<)⌝);
a(rewrite_tac[dense_in_def, complete_def, unbounded_above_def,
	has_supremum_def, upper_bound_def] THEN REPEAT strip_tac);
(* *** Goal "1.1" *** *)
a(strip_asm_tac (list_∀_elim[⌜f⌝, ⌜I⌝]ℝ_add_hom_image_group_thm) THEN1 all_asm_fc_tac[]);
a(lemma_tac ⌜∀ x⦁ ℕℝ 0 < x ⇒ ∃ g⦁ g ∈ I ∧ ℕℝ 0 < g ∧ g < x⌝);
(* *** Goal "1.1.1" *** *)
a(REPEAT strip_tac THEN all_fc_tac[ℝ_opah_dense_image_thm]);
a(LEMMA_T ⌜f(ℕℝ 0) < f d⌝ ante_tac THEN1 all_fc_tac[ℝ_opah_thm]);
a(ALL_FC_T rewrite_tac[ℝ_add_hom_0_thm] THEN strip_tac);
a(lemma_tac ⌜f d ∈ I⌝ THEN1 (asm_rewrite_tac[] THEN ∃_tac⌜d⌝ THEN REPEAT strip_tac));
a(∃_tac⌜f d⌝ THEN REPEAT strip_tac);
(* *** Goal "1.1.2" *** *)
a(all_fc_tac[ℝ_subgroup_dense_thm] THEN contr_tac THEN all_asm_fc_tac[]);
(* *** Goal "1.2" *** *)
a(lemma_tac⌜∃D⦁D = {a | f a ∈ A}⌝ THEN1 prove_∃_tac);
a(lemma_tac⌜¬D = {}⌝);
(* *** Goal "1.2.1" *** *)
a(GET_NTH_ASM_T 6 (PC_T1 "sets_ext" strip_asm_tac));
a(lemma_tac⌜x' ∈ I⌝ THEN1
	(LIST_GET_NTH_ASM_T [1, 6] (MAP_EVERY ante_tac) THEN PC_T1 "sets_ext" prove_tac[]));
a(POP_ASM_T ante_tac THEN LIST_GET_NTH_ASM_T [2, 8] rewrite_tac THEN REPEAT strip_tac);
a(var_elim_asm_tac ⌜x' = f a⌝ THEN PC_T1 "sets_ext" REPEAT strip_tac);
a(∃_tac⌜a⌝ THEN REPEAT strip_tac);
(* *** Goal "1.2.2" *** *)
a(lemma_tac⌜∃b⦁∀x⦁x ∈ D ⇒ x ≤ b⌝ THEN1 swap_nth_asm_concl_tac 3 THEN REPEAT strip_tac);
(* *** Goal "1.2.2.1" *** *)
a(strip_asm_tac (list_∀_elim[⌜f⌝, ⌜I⌝]ℝ_add_hom_image_group_thm) THEN1 all_asm_fc_tac[]);
a(cases_tac⌜ℕℝ 0 < x⌝);
(* *** Goal "1.2.2.1.1" *** *)
a(lemma_tac⌜∃y⦁y ∈ I ∧ x < y⌝ THEN1 all_fc_tac[ℝ_monoid_delta_dense_thm]);
(* *** Goal "1.2.2.1.1.1" *** *)
a(lemma_tac ⌜g + x ∈ I⌝ THEN1 (GET_NTH_ASM_T 6 bc_thm_tac THEN REPEAT strip_tac));
a(∃_tac⌜g + x⌝ THEN REPEAT strip_tac);
(* *** Goal "1.2.2.1.1.2" *** *)
a(GET_NTH_ASM_T 2 ante_tac THEN GET_NTH_ASM_T 14 rewrite_thm_tac THEN REPEAT strip_tac);
a(var_elim_asm_tac ⌜y = f a⌝);
a(spec_nth_asm_tac 7 ⌜a⌝);
a(GET_NTH_ASM_T 2 ante_tac THEN GET_NTH_ASM_T 11 rewrite_thm_tac THEN REPEAT strip_tac);
a(∃_tac⌜f x'⌝ THEN REPEAT strip_tac);
a(GET_NTH_ASM_T 2 (strip_asm_tac o rewrite_rule[ℝ_¬_≤_less_thm]));
a(lemma_tac⌜f a < f x'⌝ THEN1 all_fc_tac[ℝ_opah_thm]);
a(contr_tac THEN LEMMA_T ⌜f x' < f x'⌝ (strip_asm_tac o rewrite_rule[ℝ_less_irrefl_thm]));
a(bc_thm_tac ℝ_less_trans_thm THEN ∃_tac ⌜x⌝ THEN REPEAT strip_tac);
a(bc_thm_tac ℝ_less_trans_thm THEN ∃_tac ⌜f a⌝ THEN REPEAT strip_tac);
(* *** Goal "1.2.2.1.2" *** *)
a(POP_ASM_T (strip_asm_tac o rewrite_rule[ℝ_¬_less_≤_thm]));
a(spec_nth_asm_tac 5 ⌜ℕℝ 0⌝);
a(GET_NTH_ASM_T 2 ante_tac THEN GET_NTH_ASM_T 9 rewrite_thm_tac THEN REPEAT strip_tac);
a(∃_tac⌜f x'⌝ THEN REPEAT strip_tac);
a(GET_NTH_ASM_T 2 (strip_asm_tac o rewrite_rule[ℝ_¬_≤_less_thm]));
a(LEMMA_T⌜f (ℕℝ 0) < f x'⌝ ante_tac THEN1 all_fc_tac[ℝ_opah_thm]);
a(ALL_FC_T rewrite_tac[ℝ_add_hom_0_thm] THEN REPEAT strip_tac);
a(contr_tac THEN LEMMA_T ⌜f x' < f x'⌝ (strip_asm_tac o rewrite_rule[ℝ_less_irrefl_thm]));
a(bc_thm_tac ℝ_less_trans_thm THEN ∃_tac ⌜x⌝ THEN REPEAT strip_tac);
a(bc_thm_tac ℝ_≤_less_trans_thm THEN ∃_tac ⌜ℕℝ 0⌝ THEN REPEAT strip_tac);
(* *** Goal "1.2.2.2" *** *)
a(∃_tac⌜f(Sup D)⌝ THEN REPEAT strip_tac);
(* *** Goal "1.2.2.2.1" *** *)
a(GET_NTH_ASM_T 9 rewrite_thm_tac THEN ∃_tac ⌜Sup D⌝ THEN REPEAT strip_tac);
(* *** Goal "1.2.2.2.2" *** *)
a(lemma_tac ⌜a ∈ I⌝ THEN1
	(LIST_GET_NTH_ASM_T [1, 8] (MAP_EVERY ante_tac) THEN PC_T1 "sets_ext" prove_tac[]));
a(POP_ASM_T ante_tac THEN GET_NTH_ASM_T 10 rewrite_thm_tac THEN strip_tac);
a(var_elim_asm_tac ⌜a = f a'⌝);
a(lemma_tac⌜a' < Sup D⌝ THEN_LIST [id_tac, all_fc_tac[ℝ_opah_thm]]);
a(bc_thm_tac ℝ_less_sup_bc_thm THEN REPEAT strip_tac);
(* *** Goal "1.2.2.2.2.1" *** *)
a(∃_tac⌜b⌝ THEN asm_rewrite_tac[]);
(* *** Goal "1.2.2.2.2.2" *** *)
a(GET_NTH_ASM_T 6 ante_tac THEN GET_NTH_ASM_T 10 rewrite_thm_tac THEN strip_tac);
a(var_elim_asm_tac ⌜x = f a⌝);
a(LIST_GET_NTH_ASM_T [7]all_fc_tac);
a(lemma_tac ⌜c ∈ I⌝ THEN1
	(LIST_GET_NTH_ASM_T [2, 10] (MAP_EVERY ante_tac) THEN PC_T1 "sets_ext" prove_tac[]));
a(POP_ASM_T ante_tac THEN GET_NTH_ASM_T 12 rewrite_thm_tac THEN strip_tac);
a(var_elim_asm_tac ⌜c = f a''⌝);
a(∃_tac⌜a''⌝ THEN asm_rewrite_tac[]);
a(all_fc_tac[ℝ_opah_strict_thm]);
(* *** Goal "1.2.2.2.3" *** *)
a(GET_NTH_ASM_T 2 ante_tac THEN GET_NTH_ASM_T 11 rewrite_thm_tac THEN strip_tac);
a(var_elim_asm_tac ⌜y' = f a⌝);
a(lemma_tac⌜¬a < Sup D⌝ THEN_LIST
	[id_tac, contr_tac THEN all_fc_tac[ℝ_opah_strict_thm]]);
a(rewrite_tac[ℝ_¬_less_≤_thm] THEN bc_thm_tac ℝ_sup_≤_bc_thm);
a(REPEAT strip_tac);
(* *** Goal "1.2.2.2.3.1" *** *)
a(∃_tac⌜b⌝ THEN asm_rewrite_tac[]);
(* *** Goal "1.2.2.2.3.2" *** *)
a(POP_ASM_T ante_tac THEN asm_rewrite_tac[] THEN strip_tac);
a(LIST_GET_NTH_ASM_T [2] all_fc_tac);
a(all_fc_tac[ℝ_opah_strict_thm]);
a(asm_rewrite_tac[ℝ_≤_def]);
(* *** Goal "2" *** *)
a(strip_asm_tac ℝ_less_def THEN LIST_DROP_NTH_ASM_T [1, 2] discard_tac);
a(LEMMA_T⌜I ⊆ Universe⌝ asm_tac THEN1 PC_T1 "sets_ext" prove_tac[]);
a(all_fc_tac[dense_complete_subset_thm]);
a(POP_ASM_T ante_tac THEN  PC_T1 "sets_ext" asm_rewrite_tac[]);
a(REPEAT strip_tac THEN asm_rewrite_tac[]);
save_pop_thm"ℝ_opah_onto_thm"
);
=TEX
\subsection{Inverse of Order-preserving Additive Homomorphisms}
Now we know that order-preserving additive homomorphisms are one-to-one and
onto, we can exhibit their inverses.

We prove a general lemma on function inverses first:

=SML
val ⦏inverse_lemma⦎ = (
set_goal([], ⌜∀f ⦁ OneOne f ∧ Onto f ⇒ ∃g⦁(∀x⦁g(f x) = x) ∧ (∀x⦁f(g x) = x)⌝);
a(rewrite_tac[one_one_def, onto_def] THEN REPEAT strip_tac);
a(lemma_tac⌜∃g⦁∀x⦁f(g x) = x⌝ THEN1 prove_∃_tac);
(* *** Goal "1" *** *)
a(conv_tac(ONCE_MAP_C eq_sym_conv) THEN asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(∃_tac⌜g⌝ THEN asm_rewrite_tac[] THEN REPEAT strip_tac);
a(lemma_tac⌜f(g (f x)) = f x⌝ THEN1 asm_rewrite_tac[]);
a(all_asm_fc_tac[]);
pop_thm()
);
=TEX
Now, we show that if an order-preserving additive homomorphism has
an inverse then the inverse is order-preserving and an additive homomorphism.
=SML
val ⦏ℝ_opah_inverse_add_hom_thm⦎ = (
set_goal([], ⌜∀f : ℝ → ℝ; g⦁
		(∀x y⦁f (x + y) = f x + f y)
	∧	(∀x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < f x)
	∧	(∀x⦁g(f x) = x)
	∧	(∀x⦁f(g x) = x)
	⇒	(∀x y⦁g (x + y) = g x + g y)
	∧	(∀x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < g x)
⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(LEMMA_T⌜x + y = f(g x + g y)⌝rewrite_thm_tac THEN1 asm_rewrite_tac[]);
a(GET_NTH_ASM_T 2 rewrite_thm_tac);
(* *** Goal "2" *** *)
a(lemma_tac⌜f(ℕℝ 0) < f (g x)⌝ THEN1 ALL_FC_T asm_rewrite_tac[ℝ_add_hom_0_thm]);
a(all_fc_tac[ℝ_opah_strict_thm]);
save_pop_thm"ℝ_opah_inverse_add_hom_thm"
);
=TEX
=SML
val ⦏ℝ_opah_inverse_thm⦎ = (
set_goal([], ⌜∀f : ℝ → ℝ⦁
		(∀x y⦁f (x + y) = f x + f y)
	∧	(∀x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < f x)
	⇒	∃g : ℝ → ℝ⦁
		(∀x⦁g(f x) = x)
	∧	(∀x⦁f(g x) = x)
	∧	(∀x y⦁g (x + y) = g x + g y)
	∧	(∀x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < g x)
⌝);
a(REPEAT strip_tac);
a(all_fc_tac[ℝ_opah_one_one_thm, ℝ_opah_onto_thm]);
a(all_fc_tac[inverse_lemma]);
a(ante_tac (list_∀_elim[⌜f⌝, ⌜g⌝] ℝ_opah_inverse_add_hom_thm));
a(asm_rewrite_tac[] THEN strip_tac);
a(∃_tac⌜g⌝ THEN REPEAT strip_tac THEN_TRY (SOLVED_T (asm_rewrite_tac[])));
a(all_asm_fc_tac[]);
save_pop_thm"ℝ_opah_inverse_thm"
);
=TEX
\subsection{Existence of Central Order-preserving Additive Homomorphisms}
We now want to show that the real numbers come with a very
adequate supply of OPAHs that lie in the centre of the automorphism group, we call these COPAHs.

Firstly and most trivially, the identity function is a COPAH
=SML
val ⦏ℝ_copah_id_thm⦎ = (
set_goal([], ⌜∃ι : ℝ → ℝ⦁
		(∀x⦁ ι x = x)
	∧	(∀x y⦁ι (x + y) = ι x + ι y)
	∧	(∀x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < ι x)
	∧	(∀f⦁ (∀x y⦁f (x + y) = f x + f y) ⇒ ∀x⦁ι(f x) = f(ι x))
⌝);
a(∃_tac⌜λx:ℝ ⦁ x⌝ THEN rewrite_tac[]);
save_pop_thm"ℝ_copah_id_thm"
);
=TEX
Next, there is a COPAH that increases any positive number:
=SML
val ⦏ℝ_copah_double_thm⦎ = (
set_goal([], ⌜∃α : ℝ → ℝ⦁
		(∀x⦁ α x = x + x)
	∧	(∀x y⦁α (x + y) = α x + α y)
	∧	(∀x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < α x)
	∧	(∀x⦁ ℕℝ 0 < x ⇒ x < α x)
	∧	(∀f⦁ (∀x y⦁f (x + y) = f x + f y) ⇒ ∀x⦁α(f x) = f(α x))
⌝);
a(∃_tac⌜λx:ℝ ⦁ x + x⌝ THEN rewrite_tac[] THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(rewrite_tac[∀_elim⌜x⌝ ℝ_plus_order_thm]);
(* *** Goal "2" *** *)
a(bc_thm_tac ℝ_less_trans_thm THEN ∃_tac ⌜x⌝ THEN asm_rewrite_tac[ℝ_less_clauses]);
(* *** Goal "3" *** *)
a(asm_rewrite_tac[ℝ_less_clauses]);
(* *** Goal "4" *** *)
a(asm_rewrite_tac[]);
save_pop_thm"ℝ_copah_double_thm"
);
=TEX
\ldots and there is a COPAH that decreases any positive number:
=SML
val ⦏ℝ_copah_halve_thm⦎ = (
set_goal([], ⌜∃β : ℝ → ℝ⦁
		(∀x⦁ β x + β x = x)
	∧	(∀x y⦁β (x + y) = β x + β y)
	∧	(∀x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < β x)
	∧	(∀x⦁ ℕℝ 0 < x ⇒ β x < x)
	∧	(∀f⦁ (∀x y⦁f (x + y) = f x + f y) ⇒ ∀x⦁β(f x) = f(β x))
⌝);
a(strip_asm_tac ℝ_copah_double_thm);
a(all_fc_tac[ℝ_opah_inverse_thm]);
a(lemma_tac⌜∀x⦁ g x + g x = x⌝ THEN1 strip_tac);
(* *** Goal "1" *** *)
a(LEMMA_T⌜g x + g x = α (g x)⌝ ante_tac THEN1 GET_NTH_ASM_T 9 rewrite_thm_tac);
a(GET_NTH_ASM_T 3 rewrite_thm_tac);
(* *** Goal "2" *** *)
a(∃_tac⌜g⌝ THEN REPEAT strip_tac);
(* *** Goal "2.1" *** *)
a(asm_rewrite_tac[]);
(* *** Goal "2.2" *** *)
a(asm_rewrite_tac[]);
(* *** Goal "2.3" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "2.4" *** *)
a(lemma_tac⌜x < α x⌝ THEN1 all_asm_fc_tac[]);
a(LEMMA_T⌜g x < g (α x)⌝ ante_tac THEN1 all_fc_tac[ℝ_opah_thm]);
a(asm_rewrite_tac[]);
(* *** Goal "2.5" *** *)
a(LEMMA_T ⌜g(g(f x) + g(f x)) = g(f(g x + g x))⌝ ante_tac THEN1 GET_NTH_ASM_T 2 rewrite_thm_tac);
a(GET_NTH_ASM_T 1 rewrite_thm_tac);
a(GET_NTH_ASM_T 2 rewrite_thm_tac);
a(GET_NTH_ASM_T 4 rewrite_thm_tac);
a(LEMMA_T ⌜g (f (g x)) + g (f (g x)) = α(g(f(g x)) )⌝ rewrite_thm_tac THEN1
		GET_NTH_ASM_T 11 rewrite_thm_tac);
a(GET_NTH_ASM_T 5 rewrite_thm_tac);
save_pop_thm"ℝ_copah_halve_thm"
);
=TEX
\ldots and the composite of two COPAHs is a COPAH:
=SML
val ⦏ℝ_copah_comp_thm⦎ = (
set_goal([], ⌜∀α β⦁
		(∀x y⦁α (x + y) = α x + α y)
	∧	(∀x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < α x)
	∧	(∀f⦁ (∀x y⦁f (x + y) = f x + f y) ⇒ ∀x⦁α(f x) = f(α x))
	∧	(∀x y⦁β (x + y) = β x + β y)
	∧	(∀x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < β x)
	∧	(∀f⦁ (∀x y⦁f (x + y) = f x + f y) ⇒ ∀x⦁β(f x) = f(β x))
	⇒	∃γ⦁
		(∀x⦁ γ x = α(β x))
	∧	(∀x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < γ x)
	∧	(∀x y⦁γ (x + y) = γ x + γ y)
	∧	(∀f⦁ (∀x y⦁f (x + y) = f x + f y) ⇒ ∀x⦁γ(f x) = f(γ x))
⌝);
a(REPEAT strip_tac);
a(∃_tac⌜λx⦁α(β x)⌝ THEN asm_rewrite_tac[] THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(GET_NTH_ASM_T 6 bc_thm_tac THEN GET_NTH_ASM_T 3 bc_thm_tac THEN REPEAT strip_tac);
(* *** Goal "2" *** *)
a(LEMMA_T⌜∀x⦁β(f x) = f(β x)⌝ rewrite_thm_tac THEN1
	(GET_NTH_ASM_T 2 bc_thm_tac THEN asm_rewrite_tac[]));
a(LEMMA_T⌜∀x⦁α(f x) = f(α x)⌝ rewrite_thm_tac THEN1
	(GET_NTH_ASM_T 5 bc_thm_tac THEN asm_rewrite_tac[]));
save_pop_thm"ℝ_copah_comp_thm"
);
=TEX
\ldots and the sum of two COPAHs is a COPAH:
=SML
val ⦏ℝ_copah_sum_thm⦎ = (
set_goal([], ⌜∀α β⦁
		(∀x y⦁α (x + y) = α x + α y)
	∧	(∀x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < α x)
	∧	(∀f⦁ (∀x y⦁f (x + y) = f x + f y) ⇒ ∀x⦁α(f x) = f(α x))
	∧	(∀x y⦁β (x + y) = β x + β y)
	∧	(∀x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < β x)
	∧	(∀f⦁ (∀x y⦁f (x + y) = f x + f y) ⇒ ∀x⦁β(f x) = f(β x))
	⇒	∃γ⦁
		(∀x⦁ γ x = α x + β x)
	∧	(∀x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < γ x)
	∧	(∀x y⦁γ (x + y) = γ x + γ y)
	∧	(∀f⦁ (∀x y⦁f (x + y) = f x + f y) ⇒ ∀x⦁γ(f x) = f(γ x))
⌝);
a(REPEAT strip_tac);
a(∃_tac⌜λx⦁α x + β x⌝ THEN asm_rewrite_tac[] THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(bc_thm_tac ℝ_less_trans_thm THEN ∃_tac⌜α x⌝ THEN REPEAT strip_tac THEN1 all_asm_fc_tac[]);
a(rewrite_tac[ℝ_less_clauses] THEN all_asm_fc_tac[]);
(* *** Goal "2" *** *)
a(rewrite_tac[ℝ_plus_assoc_thm]);
a(rewrite_tac[∀_elim⌜α y⌝ℝ_plus_order_thm]);
(* *** Goal "3" *** *)
a(LEMMA_T⌜∀x⦁β(f x) = f(β x)⌝ rewrite_thm_tac THEN1
	(GET_NTH_ASM_T 2 bc_thm_tac THEN asm_rewrite_tac[]));
a(LEMMA_T⌜∀x⦁α(f x) = f(α x)⌝ rewrite_thm_tac THEN1
	(GET_NTH_ASM_T 5 bc_thm_tac THEN asm_rewrite_tac[]));
a(asm_rewrite_tac[]);
save_pop_thm"ℝ_copah_sum_thm"
);
=TEX
We now want to show that certain sets define in terms of COPAHs are dense.
The following lemma is vital: it says that if a set $A$ contains a positive
element, $\epsilon$ and is closed under division by $2$ then $A$ contains
elements arbitrarily close to $0$.
=SML
val ⦏ℝ_halve_closed_dense_thm⦎ = (
set_goal([], ⌜∀A e⦁
		ℕℝ 0 < e
	∧	e ∈ A
	∧	(∀y⦁y ∈ A ⇒ ∃z⦁z ∈ A ∧ z + z = y)
	⇒	(∀d⦁ ℕℝ 0 < d ⇒ ∃a⦁a ∈ A ∧ ℕℝ 0 < a ∧ a < d)
⌝);
a contr_tac;
a(lemma_tac⌜∃B⦁B = {c | ℕℝ 0 < c ∧ ∀a⦁a ∈ A ∧ ℕℝ 0 < a ⇒ ¬a < c}⌝ THEN1 prove_∃_tac);
a(lemma_tac⌜¬B = {}⌝ THEN1
	(PC_T1 "sets_ext" REPEAT strip_tac THEN ∃_tac⌜d⌝ THEN asm_rewrite_tac[]));
(* *** Goal "1" *** *)
a(contr_tac THEN all_asm_fc_tac[]);
(* *** Goal "2" *** *)
a(lemma_tac⌜∃b⦁∀ x⦁ x ∈ B ⇒ x ≤ b⌝);
(* *** Goal "2.1" *** *)
a(∃_tac ⌜e⌝ THEN REPEAT strip_tac);
a(POP_ASM_T ante_tac THEN asm_rewrite_tac[] THEN REPEAT strip_tac);
a(contr_tac THEN POP_ASM_T (strip_asm_tac o rewrite_rule[ℝ_≤_¬_less_thm]));
a(all_asm_fc_tac[]);
(* *** Goal "2.2" *** *)
a(lemma_tac⌜d ≤ Sup B⌝ THEN1 bc_thm_tac ℝ_≤_sup_bc_thm);
(* *** Goal "2.2.1" *** *)
a(REPEAT strip_tac THEN1 (∃_tac⌜b⌝ THEN contr_tac THEN all_asm_fc_tac[]));
a(lemma_tac⌜d ∈ B⌝ THEN1 (asm_rewrite_tac[] THEN contr_tac THEN all_asm_fc_tac[]));
a(all_asm_fc_tac[]);
(* *** Goal "2.2.2" *** *)
a(lemma_tac⌜∀v⦁ℕℝ 0 < v ∧ Sup B < v ⇒ ∃c⦁ c ∈ A ∧ ℕℝ 0 < c ∧ c < v⌝ THEN1 contr_tac);
(* *** Goal "2.2.2.1" *** *)
a(swap_nth_asm_concl_tac 2);
a(rewrite_tac[ℝ_¬_less_≤_thm] THEN bc_thm_tac ℝ_≤_sup_bc_thm);
a(REPEAT strip_tac THEN1 (∃_tac⌜b⌝ THEN contr_tac THEN all_asm_fc_tac[]));
a(TOP_ASM_T bc_thm_tac THEN asm_rewrite_tac[] THEN REPEAT strip_tac);
a(contr_tac THEN all_asm_fc_tac[]);
(* *** Goal "2.2.2.2" *** *)
a(lemma_tac⌜ℕℝ 0 < Sup B⌝ THEN1 all_fc_tac[ℝ_less_≤_trans_thm]);
a(lemma_tac⌜ℕℝ 0 < Sup B + d⌝);
(* *** Goal "2.2.2.2.1" *** *)
a(bc_thm_tac ℝ_less_trans_thm THEN ∃_tac ⌜Sup B⌝ THEN REPEAT strip_tac);
a(asm_rewrite_tac[ℝ_less_clauses]);
(* *** Goal "2.2.2.2.2" *** *)
a(SPEC_NTH_ASM_T 3 ⌜Sup B + d⌝ ante_tac);
a(rewrite_tac[ℝ_less_clauses] THEN REPEAT strip_tac);
a(contr_tac THEN spec_nth_asm_tac 13 ⌜c⌝);
a(lemma_tac⌜z < Sup B⌝ THEN1 contr_tac);
(* *** Goal "2.2.2.2.2.1" *** *)
a(var_elim_asm_tac⌜z + z = c⌝);
a(POP_ASM_T (strip_asm_tac o rewrite_rule[ℝ_¬_less_≤_thm]));
a(lemma_tac ⌜Sup B + d ≤ z + z⌝ THEN1 bc_thm_tac ℝ_≤_trans_thm);
(* *** Goal "2.2.2.2.2.1.1" *** *)
a(∃_tac ⌜Sup B + Sup B⌝ THEN rewrite_tac[ℝ_≤_clauses] THEN REPEAT strip_tac);
a(bc_thm_tac ℝ_≤_trans_thm THEN ∃_tac ⌜Sup B + z⌝ THEN rewrite_tac[ℝ_≤_clauses] THEN strip_tac);
(* *** Goal "2.2.2.2.2.1.2" *** *)
a(LEMMA_T ⌜z + z < z + z⌝ (strip_asm_tac o rewrite_rule[ℝ_less_irrefl_thm]));
a(bc_thm_tac ℝ_less_≤_trans_thm THEN ∃_tac ⌜Sup B + d⌝ THEN REPEAT strip_tac);
(* *** Goal "2.2.2.2.2.2" *** *)
a(lemma_tac⌜¬Sup B ∈ B⌝);
(* *** Goal "2.2.2.2.2.2.1" *** *)
a(lemma_tac⌜∃s⦁s = Sup B⌝ THEN1 prove_∃_tac);
a(LEMMA_T⌜¬s ∈ B⌝ ante_tac THEN_LIST
	[GET_NTH_ASM_T 14 rewrite_thm_tac, TOP_ASM_T rewrite_thm_tac]);
a(var_elim_asm_tac ⌜s = Sup B⌝ THEN contr_tac);
a(lemma_tac⌜ℕℝ 0 < z⌝ THEN1 contr_tac);
(* *** Goal "2.2.2.2.2.2.1.1" *** *)
a(POP_ASM_T (strip_asm_tac o rewrite_rule[ℝ_¬_less_≤_thm]));
a(lemma_tac⌜z + z ≤ ℕℝ 0⌝ THEN1
	(bc_thm_tac ℝ_≤_trans_thm THEN ∃_tac⌜z⌝ THEN
	rewrite_tac[ℝ_≤_clauses] THEN REPEAT strip_tac));
a(LEMMA_T ⌜z + z < z + z⌝ (strip_asm_tac o rewrite_rule[ℝ_less_irrefl_thm]));
a(var_elim_asm_tac⌜z + z = c⌝);
a(bc_thm_tac ℝ_≤_less_trans_thm THEN ∃_tac ⌜ℕℝ 0⌝ THEN REPEAT strip_tac);
(* *** Goal "2.2.2.2.2.2.1.2" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "2.2.2.2.2.2.2" *** *)
a(DROP_NTH_ASM_T 9 discard_tac THEN all_fc_tac[ℝ_less_sup_∈_thm]);
a(POP_ASM_T ante_tac THEN asm_rewrite_tac[]);
a(lemma_tac⌜ℕℝ 0 < z⌝ THEN1 contr_tac);
(* *** Goal "2.2.2.2.2.2.2.1" *** *)
a(POP_ASM_T (strip_asm_tac o rewrite_rule[ℝ_¬_less_≤_thm]));
a(lemma_tac⌜z + z ≤ ℕℝ 0⌝ THEN1
	(bc_thm_tac ℝ_≤_trans_thm THEN ∃_tac⌜z⌝ THEN
	rewrite_tac[ℝ_≤_clauses] THEN REPEAT strip_tac));
a(LEMMA_T ⌜z + z < z + z⌝ (strip_asm_tac o rewrite_rule[ℝ_less_irrefl_thm]));
a(var_elim_asm_tac⌜z + z = c⌝);
a(bc_thm_tac ℝ_≤_less_trans_thm THEN ∃_tac ⌜ℕℝ 0⌝ THEN REPEAT strip_tac);
a(lemma_tac⌜ℕℝ 0 < y⌝ THEN1
	(bc_thm_tac ℝ_less_trans_thm THEN ∃_tac ⌜z⌝ THEN REPEAT strip_tac));
a(TOP_ASM_T rewrite_thm_tac THEN REPEAT strip_tac);
a(∃_tac⌜z⌝ THEN REPEAT strip_tac);
save_pop_thm"ℝ_halve_closed_dense_thm"
);
=TEX
Now we can show, that for any $\delta > 0$, the images of $\epsilon$ under
the COPAHs are a dense in the positive reals:
=SML
val ⦏ℝ_copah_dense_thm⦎ = (
set_goal([], ⌜∀d x y⦁
		ℕℝ 0 < d ∧ ℕℝ 0 < x ∧ x < y
	⇒	∃γ⦁
		(∀x y⦁γ (x + y) = γ x + γ y)
	∧	(∀x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < γ x)
	∧	(∀f⦁ (∀x y⦁f (x + y) = f x + f y) ⇒ ∀x⦁γ(f x) = f(γ x))
	∧	x < γ d ∧ γ d < y
⌝);
a(REPEAT strip_tac);
a(lemma_tac⌜∃A⦁
	A = { t | ∃q⦁
		(∀x y⦁q (x + y) = q x + q y)
	∧	(∀x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < q x)
	∧	(∀f⦁ (∀x y⦁f (x + y) = f x + f y) ⇒ ∀x⦁q(f x) = f(q x))
	∧	t = q d } ⌝ THEN1 prove_∃_tac);
a(lemma_tac⌜d ∈ A⌝);
(* *** Goal "1" *** *)
a(strip_asm_tac ℝ_copah_id_thm);
a(asm_rewrite_tac[]);
a(∃_tac ⌜ι⌝ THEN asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(lemma_tac ⌜∀d⦁ ℕℝ 0 < d ⇒ ∃a⦁a ∈ A ∧ ℕℝ 0 < a ∧ a < d⌝ THEN1
	bc_thm_tac ℝ_halve_closed_dense_thm);
(* *** Goal "2.1" *** *)
a(∃_tac⌜d⌝ THEN REPEAT strip_tac);
a(POP_ASM_T ante_tac THEN asm_rewrite_tac[] THEN REPEAT strip_tac);
a(strip_asm_tac ℝ_copah_halve_thm);
a(∃_tac⌜β y'⌝ THEN asm_rewrite_tac[]);
a(ante_tac(list_∀_elim[⌜β⌝, ⌜q⌝]ℝ_copah_comp_thm));
a(asm_rewrite_tac[] THEN strip_tac);
a(∃_tac⌜γ⌝ THEN asm_rewrite_tac[]);
(* *** Goal "2.2" *** *)
a(lemma_tac⌜∀g h⦁ g ∈ A ∧ h ∈ A ⇒ g + h ∈ A⌝);
(* *** Goal "2.2.1" *** *)
a(asm_rewrite_tac[] THEN REPEAT strip_tac);
a(ante_tac(list_∀_elim[⌜q⌝, ⌜q'⌝]ℝ_copah_sum_thm));
a(asm_rewrite_tac[] THEN strip_tac);
a(∃_tac⌜γ⌝ THEN asm_rewrite_tac[]);
(* *** Goal "2.2.2" *** *)
a(all_fc_tac[ℝ_semigroup_dense_thm]);
a(DROP_NTH_ASM_T 3 ante_tac THEN asm_rewrite_tac[] THEN strip_tac);
a(var_elim_asm_tac ⌜g = q d⌝ THEN ∃_tac⌜q⌝ THEN asm_rewrite_tac[]);
save_pop_thm"ℝ_copah_dense_thm"
);
=TEX
\subsection{Extensions of Partial Homomorphisms}

In this section we show that to define an OPAH it is sufficient to define
its behaviour on the positive elements. I.e., if a function $f$ is
an order-preserving homomorphism of the additive semigroup of positive elements,
its positive side can be extended to an order-preserving homomorphism $\phi$ of the whole additive group.

To reduce the number of cases that have to be considered, we sneak up on this slowly.
We first show that the semigroup homomorphism can be extended to
homomorphism of the non-negative monoid
(by defining $\phi(0) = 0$). The following portmanteau lemma
helps to eliminate the various cases in this.

=SML
val ⦏eq_order_thm⦎ = prove_rule[]⌜∀y x⦁x = y ⇔ y = x⌝;
val ⦏ℝ_opah_extension_lemmas1⦎ = (
push_goal([], ⌜∀v w⦁
	(v < w ⇒ ¬w < v ∧ ¬v = w ∧ ¬w = v)
∧ 	(ℕℝ 0 < v ∧ ℕℝ 0 < w ⇒ ¬v + w = ℕℝ 0 ∧ ¬ℕℝ 0 = v + w)
⌝);
a(REPEAT ∀_tac);
a(rewrite_tac[∀_elim⌜ℕℝ 0⌝eq_order_thm, ∀_elim⌜v⌝eq_order_thm] THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(contr_tac THEN all_fc_tac[ℝ_less_antisym_thm]);
(* *** Goal "2" *** *)
a(all_fc_tac[ℝ_less_¬_eq_thm]);
(* *** Goal "3" *** *)
a(LEMMA_T ⌜ℕℝ 0 + ℕℝ 0 < v + w⌝ ante_tac THEN1
	(bc_thm_tac ℝ_plus_mono_thm2 THEN REPEAT strip_tac));
a(rewrite_tac[ℝ_plus_clauses] THEN REPEAT strip_tac THEN all_fc_tac[ℝ_less_¬_eq_thm]);
pop_thm()
);
=TEX
Now here is the extension to the non-negative monoid.
=SML
val ⦏ℝ_opah_extension_thm1⦎ = (
set_goal([], ⌜∀f⦁
		(∀x y⦁ℕℝ 0 < x ∧ ℕℝ 0 < y ⇒ f (x + y) = f x + f y)
	∧	(∀x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < f x)
	⇒	∃φ⦁
		(φ (ℕℝ 0) = ℕℝ 0)
	∧	(∀x⦁ ℕℝ 0 < x ⇒ φ x = f x)
	∧	(∀x y⦁ℕℝ 0 ≤ x ∧ ℕℝ 0 ≤ y ⇒ φ (x + y) = φ x + φ y)
⌝);
a(REPEAT strip_tac);
a(∃_tac⌜λx⦁if x = ℕℝ 0 then ℕℝ 0 else f x⌝
	THEN rewrite_tac[] THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(all_fc_tac[ℝ_opah_extension_lemmas1] THEN asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(POP_ASM_T ante_tac THEN POP_ASM_T ante_tac THEN rewrite_tac[ℝ_≤_def]
	THEN REPEAT strip_tac THEN
	TRY all_var_elim_asm_tac1 THEN
	all_asm_fc_tac[] THEN
	all_fc_tac[ℝ_opah_extension_lemmas1] THEN
	asm_rewrite_tac[ℝ_plus_clauses]);
save_pop_thm"ℝ_opah_extension_thm1"
);
=TEX
=SML
val ⦏ℝ_opah_extension_thm2⦎ = (
set_goal([], ⌜∀f⦁
		(f (ℕℝ 0) = ℕℝ 0)
	∧	(∀x y⦁ℕℝ 0 ≤ x ∧ ℕℝ 0 ≤ y ⇒ f (x + y) = f x + f y)
	⇒	∃ψ⦁
		(∀x⦁ ℕℝ 0 ≤ x ⇒ ψ x = f x)
	∧	(∀x y⦁ψ (x + y) = ψ x + ψ y)
⌝);
a(REPEAT strip_tac);
a(lemma_tac⌜∃φ⦁∀x⦁ φ x = if ℕℝ 0 ≤ x then f x else ~(f (~x))⌝ THEN1 prove_∃_tac);
a(∃_tac⌜φ⌝ THEN ∧_tac);
(* *** Goal "1" *** *)
a(REPEAT strip_tac THEN asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(bc_thm_tac ℝ_add_hom_extension_thm THEN REPEAT strip_tac);
(* *** Goal "2.1" *** *)
a(lemma_tac⌜ℕℝ 0 ≤ x + y⌝ THEN1
	(bc_thm_tac ℝ_≤_trans_thm THEN ∃_tac⌜x⌝ THEN asm_rewrite_tac[ℝ_≤_clauses]));
a(asm_rewrite_tac[]);
a(ALL_ASM_FC_T rewrite_tac[]);
(* *** Goal "2.2" *** *)
a(asm_rewrite_tac[ℝ_minus_clauses]);
a(cases_tac⌜ℕℝ 0 ≤ ~ x⌝ THEN asm_rewrite_tac[]);
a(POP_ASM_T (strip_asm_tac o
	rewrite_rule[ℝ_plus_clauses, ℝ_minus_clauses] o once_rewrite_rule[ℝ_≤_≤_0_thm]));
a(lemma_tac ⌜x = ℕℝ 0⌝ THEN1 asm_rewrite_tac[ℝ_eq_≤_thm] THEN asm_rewrite_tac[ℝ_minus_clauses]);
save_pop_thm"ℝ_opah_extension_thm2"
);
=TEX
Now here is the extension to the whole group, in which, for convenience in using
the theorem, we explicitly include the fact that the result is order-presereving
as part of the conclusion.
=SML
val ⦏ℝ_opah_extension_thm⦎ = (
set_goal([], ⌜∀f⦁
		(∀x y⦁ℕℝ 0 < x ∧ ℕℝ 0 < y ⇒ f (x + y) = f x + f y)
	∧	(∀x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < f x)
	⇒	∃φ⦁
		(∀x⦁ ℕℝ 0 < x ⇒ φ x = f x)
	∧	(∀x y⦁φ (x + y) = φ x + φ y)
	∧	(∀x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < φ x)
⌝);
a(REPEAT strip_tac);
a(once_rewrite_tac[taut_rule⌜∀p1 p2 p3⦁ p1 ∧ p2 ∧ p3 ⇔ p1 ∧ p2 ∧ (p1 ⇒ p3)⌝]);
a(all_fc_tac[ℝ_opah_extension_thm1]);
a(all_fc_tac[ℝ_opah_extension_thm2]);
a(∃_tac⌜ψ⌝ THEN asm_rewrite_tac[]);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(lemma_tac⌜ℕℝ 0 ≤ x⌝ THEN1 asm_rewrite_tac[ℝ_≤_def]);
a(ALL_ASM_FC_T rewrite_tac[]);
(* *** Goal "2" *** *)
a(ALL_ASM_FC_T rewrite_tac[]);
save_pop_thm"ℝ_opah_extension_thm"
);
=TEX
\subsection{Ordering of the Order-preserving Additive Homomorphisms}
The abundance of central order-preserving homomorphisms now lets
us show that if $f$ and $g$ are OPAHs and $f(d) < g(d)$ for some positive $d$,
then $f(x) < g(x)$ for every positive $x$.

=SML
val ⦏ℝ_opah_order_thm⦎ = (
set_goal([], ⌜∀f g d⦁
		(∀x y⦁f (x + y) = f x + f y)
	∧	(∀x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < f x)
	∧	(∀x y⦁g (x + y) = g x + g y)
	∧	(∀x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < g x)
	∧	ℕℝ 0 < d
	∧	f d < g d
	⇒	(∀x⦁ℕℝ 0 < x ⇒ f x < g x)
⌝);
a(REPEAT ∀_tac THEN REPEAT_UNTIL is_∀ strip_tac);
a(lemma_tac⌜∀x⦁ℕℝ 0 < x ⇒ f x ≤ g x⌝ THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(contr_tac THEN POP_ASM_T (strip_asm_tac o rewrite_rule[ℝ_¬_≤_less_thm]));
a(lemma_tac⌜ℕℝ 0 < g x ∧ ℕℝ 0 < g d⌝ THEN1 ALL_ASM_FC_T rewrite_tac[]);
a(strip_asm_tac(list_∀_elim[⌜g d⌝, ⌜g x⌝, ⌜f x⌝]ℝ_copah_dense_thm));
a(lemma_tac⌜∀x⦁ γ (f x) = f (γ x)⌝ THEN1
	(GET_NTH_ASM_T 3 bc_thm_tac THEN asm_rewrite_tac[]));
a(lemma_tac⌜∀x⦁ γ (g x) = g (γ x)⌝ THEN1
	(GET_NTH_ASM_T 4 bc_thm_tac THEN asm_rewrite_tac[]));
a(GET_NTH_ASM_T 4 ante_tac THEN TOP_ASM_T rewrite_thm_tac THEN contr_tac);
a(all_fc_tac[ℝ_opah_strict_thm]);
a(lemma_tac⌜f x < γ(f d)⌝ THEN1 (ALL_FC_T asm_rewrite_tac[ℝ_opah_thm]));
a(LEMMA_T⌜f x < f x⌝ (strip_asm_tac o rewrite_rule[ℝ_less_irrefl_thm]));
a(bc_thm_tac ℝ_less_trans_thm THEN ∃_tac ⌜γ(f d)⌝ THEN REPEAT strip_tac);
a(bc_thm_tac ℝ_less_trans_thm THEN ∃_tac ⌜γ(g d)⌝ THEN REPEAT strip_tac);
a(all_fc_tac[ℝ_opah_thm]);
(* *** Goal "2" *** *)
a(contr_tac THEN POP_ASM_T (strip_asm_tac o rewrite_rule[ℝ_¬_less_≤_thm]));
a(spec_nth_asm_tac 3 ⌜x⌝);
a(lemma_tac⌜f x = g x⌝ THEN1 asm_rewrite_tac[ℝ_eq_≤_thm]);
a(strip_asm_tac (∀_elim⌜f d⌝ ℝ_unbounded_above_thm));
a(lemma_tac⌜ℕℝ 0 < f x ∧ ℕℝ 0 < f d⌝ THEN1 ALL_ASM_FC_T rewrite_tac[]);
a(strip_asm_tac(list_∀_elim[⌜f x⌝, ⌜f d⌝, ⌜y⌝]ℝ_copah_dense_thm));
a(lemma_tac⌜∀x⦁ γ (f x) = f (γ x)⌝ THEN1
	(DROP_ASM_T ⌜f x = g x⌝ discard_tac THEN GET_NTH_ASM_T 3 bc_thm_tac
		THEN asm_rewrite_tac[]));
a(lemma_tac⌜∀x⦁ γ (g x) = g (γ x)⌝ THEN1
	(DROP_ASM_T ⌜f x = g x⌝ discard_tac THEN GET_NTH_ASM_T 4 bc_thm_tac
		THEN asm_rewrite_tac[]));
a(LEMMA_T⌜γ (f x) = γ(g x)⌝ ante_tac THEN1 GET_NTH_ASM_T 11 rewrite_thm_tac);
a(DROP_NTH_ASM_T 4 ante_tac THEN asm_rewrite_tac[]);
a(contr_tac THEN lemma_tac⌜d < γ x⌝ THEN1 all_fc_tac[ℝ_opah_strict_thm]);
a(POP_ASM_T (strip_asm_tac o once_rewrite_rule[ℝ_less_0_less_thm]));
a(lemma_tac ⌜g(γ x + ~ d) < f(γ x + ~d)⌝);
(* *** Goal "2.1" *** *)
a(asm_rewrite_tac[ℝ_less_clauses]);
a(GET_ASM_T ⌜f d < g d⌝ ante_tac);
a(ALL_FC_T rewrite_tac[ℝ_add_hom_minus_thm]);
a(once_rewrite_tac[ℝ_less_0_less_thm]);
a(rewrite_tac[ℝ_minus_clauses, ∀_elim⌜~(f d)⌝ ℝ_plus_order_thm]);
a(spec_nth_asm_tac 18 ⌜γ x + ~ d⌝);
a(all_fc_tac[ℝ_less_≤_trans_thm] THEN all_fc_tac[ℝ_less_irrefl_thm]);
save_pop_thm"ℝ_opah_order_thm"
);
=TEX
It is an easy consequence of the above that if two OPAHs agree at any positive value
then they agree everywhere and so are equal:

=SML
val ⦏ℝ_opah_eq_thm⦎ = (
set_goal([], ⌜∀f g d⦁
		(∀x y⦁f (x + y) = f x + f y)
	∧	(∀x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < f x)
	∧	(∀x y⦁g (x + y) = g x + g y)
	∧	(∀x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < g x)
	∧	ℕℝ 0 < d
	∧	f d = g d
	⇒	f = g
⌝);
a(REPEAT strip_tac);
a(lemma_tac⌜(∀y⦁ℕℝ 0 < y ⇒ f y = g y) ⇒ f = g⌝);
(* *** Goal "1" *** *)
a(rewrite_tac[ext_thm] THEN REPEAT strip_tac);
a(strip_asm_tac (list_∀_elim[⌜ℕℝ 0⌝, ⌜x⌝] ℝ_less_cases_thm));
(* *** Goal "1.1" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "1.2" *** *)
a(all_var_elim_asm_tac1 THEN ALL_FC_T rewrite_tac[ℝ_add_hom_0_thm]);
(* *** Goal "1.3" *** *)
a(POP_ASM_T (strip_asm_tac o
	rewrite_rule[ℝ_plus_clauses] o once_rewrite_rule[ℝ_less_0_less_thm]));
a(spec_nth_asm_tac 2 ⌜~x⌝ THEN POP_ASM_T ante_tac);
a(ALL_FC_T rewrite_tac[ℝ_add_hom_minus_thm]);
a(conv_tac (LEFT_C eq_sym_conv));
a(once_rewrite_tac[ℝ_eq_thm]);
a(rewrite_tac[ℝ_minus_clauses, ∀_elim⌜f x⌝ ℝ_plus_order_thm]);
(* *** Goal "2" *** *)
a(strip_asm_tac (list_∀_elim[⌜f y⌝, ⌜g y⌝] ℝ_less_cases_thm));
(* *** Goal "2.1" *** *)
a(all_fc_tac[ℝ_opah_order_thm]);
a(POP_ASM_T ante_tac THEN asm_rewrite_tac[ℝ_less_irrefl_thm]);
(* *** Goal "2.2" *** *)
a(rename_tac[(⌜g⌝, "gg"), (⌜f⌝, "ff")] THEN all_fc_tac[ℝ_opah_order_thm]);
a(POP_ASM_T ante_tac THEN asm_rewrite_tac[ℝ_less_irrefl_thm]);
save_pop_thm"ℝ_opah_eq_thm"
);
=TEX
\subsection{Completeness of the Order-preserving Homomorphisms}
We have shown that the images of any given positive number under
a (central) order-preserving additive homomorphism are dense in
the set of real numbers. We now show that this image is complete.
The main lemma is that all the above is true if we restrict
our attention entirely to the semigroup of positive reals:
=SML
val ⦏ℝ_opah_complete_lemma⦎ = (
set_goal([], ⌜∀d e⦁
		ℕℝ 0 < d
	∧	ℕℝ 0 < e
	⇒	∃f⦁
		(∀x y⦁ℕℝ 0 < x ∧ ℕℝ 0 < y ⇒ f (x + y) = f x + f y)
	∧	(∀x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < f x)
	∧	f d = e
⌝);
a(REPEAT strip_tac);
a(lemma_tac ⌜∃τ⦁∀v⦁
	τ v =	{t | ∃g⦁	(∀x y⦁g (x + y) = g x + g y)
		∧	(∀x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < g x)
		∧	g d < e
		∧	t < g v}
⌝ THEN1 prove_∃_tac);
a(lemma_tac⌜∀v⦁¬τ v = {}⌝);
(* *** Goal "1" *** *)
a(asm_rewrite_tac[] THEN PC_T1 "sets_ext" REPEAT strip_tac);
a(strip_asm_tac(list_∀_elim[⌜ℕℝ 0⌝, ⌜e⌝]ℝ_less_dense_thm));
a(strip_asm_tac(list_∀_elim[⌜d⌝, ⌜z⌝, ⌜e⌝]ℝ_copah_dense_thm));
a(strip_asm_tac(∀_elim⌜γ v⌝ℝ_unbounded_below_thm));
a(∃_tac⌜y⌝ THEN rewrite_tac[]);
a(∃_tac⌜γ⌝ THEN asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(lemma_tac⌜∀v⦁ℕℝ 0 < v ⇒ ∃b⦁∀s⦁s ∈ τ v ⇒ s ≤ b⌝);
(* *** Goal "2.1" *** *)
a(REPEAT strip_tac);
a(strip_asm_tac(∀_elim⌜e⌝ℝ_unbounded_above_thm));
a(strip_asm_tac(list_∀_elim[⌜d⌝, ⌜e⌝, ⌜y⌝]ℝ_copah_dense_thm));
a(∃_tac⌜γ v⌝ THEN asm_rewrite_tac[] THEN REPEAT strip_tac);
a(rewrite_tac[ℝ_≤_def] THEN ∨_left_tac);
a(bc_thm_tac ℝ_less_trans_thm THEN ∃_tac ⌜g v⌝ THEN REPEAT strip_tac);
a(lemma_tac ⌜g d < γ d⌝ THEN1 all_fc_tac[ℝ_less_trans_thm]);
a(ante_tac(list_∀_elim[⌜g⌝, ⌜γ⌝, ⌜d⌝]ℝ_opah_order_thm));
a(asm_rewrite_tac[] THEN REPEAT strip_tac);
a(spec_nth_asm_tac 1 ⌜v⌝);
(* *** Goal "2.2" *** *)
a(∃_tac⌜λz⦁ Sup (τ z)⌝ THEN rewrite_tac[] THEN REPEAT strip_tac);
(* *** Goal "2.2.1" *** *)
a(lemma_tac⌜∃ xb⦁ ∀ s⦁ s ∈ τ x ⇒ s ≤ xb⌝ THEN1
	(spec_nth_asm_tac 3 ⌜x⌝ THEN ∃_tac⌜b:ℝ⌝ THEN asm_rewrite_tac[]));
a(lemma_tac⌜∃ yb⦁ ∀ s⦁ s ∈ τ y ⇒ s ≤ yb⌝ THEN1
	(spec_nth_asm_tac 4 ⌜y⌝ THEN ∃_tac⌜b:ℝ⌝ THEN asm_rewrite_tac[]));
a(ante_tac(list_∀_elim[⌜τ x⌝, ⌜xb⌝, ⌜τ y⌝, ⌜yb⌝]ℝ_sup_plus_sup_thm));
a(LIST_GET_NTH_ASM_T [1, 2, 6] rewrite_tac);
a(STRIP_T rewrite_thm_tac);
a(LEMMA_T ⌜τ (x + y) = {t|∃ a b⦁ a ∈ τ x ∧ b ∈ τ y ∧ t < a + b}⌝ rewrite_thm_tac);
a(PC_T1 "sets_ext" asm_rewrite_tac[] THEN REPEAT strip_tac);
(* *** Goal "2.2.1.1" *** *)
a(∃_tac ⌜g x⌝ THEN ∃_tac ⌜g y⌝ THEN REPEAT strip_tac);
(* *** Goal "2.2.1.1.1" *** *)
a(spec_nth_asm_tac 3 ⌜d⌝);
a(strip_asm_tac(list_∀_elim[⌜d⌝, ⌜g d⌝, ⌜e⌝]ℝ_copah_dense_thm));
a(∃_tac⌜γ⌝ THEN asm_rewrite_tac[]);
a(ante_tac(list_∀_elim[⌜g⌝, ⌜γ⌝, ⌜d⌝]ℝ_opah_order_thm) THEN asm_rewrite_tac[]);
a(STRIP_T (fn th => all_fc_tac[th]));
(* *** Goal "2.2.1.1.2" *** *)
a(spec_nth_asm_tac 3 ⌜d⌝);
a(strip_asm_tac(list_∀_elim[⌜d⌝, ⌜g d⌝, ⌜e⌝]ℝ_copah_dense_thm));
a(∃_tac⌜γ⌝ THEN asm_rewrite_tac[]);
a(ante_tac(list_∀_elim[⌜g⌝, ⌜γ⌝, ⌜d⌝]ℝ_opah_order_thm) THEN asm_rewrite_tac[]);
a(STRIP_T (fn th => all_fc_tac[th]));
(* *** Goal "2.2.1.1.3" *** *)
a(POP_ASM_T ante_tac THEN asm_rewrite_tac[]);
(* *** Goal "2.2.1.2" *** *)
a(strip_asm_tac(list_∀_elim[⌜g d⌝, ⌜g' d⌝]ℝ_less_cases_thm));
(* *** Goal "2.2.1.2.1" *** *)
a(∃_tac⌜g'⌝ THEN asm_rewrite_tac[]);
a(bc_thm_tac ℝ_less_trans_thm THEN ∃_tac⌜a + b⌝ THEN REPEAT strip_tac);
a(bc_thm_tac ℝ_plus_mono_thm2 THEN REPEAT strip_tac);
a(bc_thm_tac ℝ_less_trans_thm THEN ∃_tac⌜g x⌝ THEN REPEAT strip_tac);
a(ante_tac(list_∀_elim[⌜g⌝, ⌜g'⌝, ⌜d⌝]ℝ_opah_order_thm));
a(asm_rewrite_tac[] THEN STRIP_T (fn th => all_fc_tac[th]));
(* *** Goal "2.2.1.2.2" *** *)
a(ante_tac(list_∀_elim[⌜g⌝, ⌜g'⌝, ⌜d⌝]ℝ_opah_eq_thm));
a(asm_rewrite_tac[] THEN REPEAT strip_tac);
a(var_elim_asm_tac ⌜g = g'⌝);
a(∃_tac⌜g'⌝ THEN asm_rewrite_tac[]);
a(bc_thm_tac ℝ_less_trans_thm THEN ∃_tac⌜a + b⌝ THEN REPEAT strip_tac);
a(bc_thm_tac ℝ_plus_mono_thm2 THEN REPEAT strip_tac);
(* *** Goal "2.2.1.2.3" *** *)
a(∃_tac⌜g⌝ THEN asm_rewrite_tac[]);
a(bc_thm_tac ℝ_less_trans_thm THEN ∃_tac⌜a + b⌝ THEN REPEAT strip_tac);
a(bc_thm_tac ℝ_plus_mono_thm2 THEN REPEAT strip_tac);
a(bc_thm_tac ℝ_less_trans_thm THEN ∃_tac⌜g' y⌝ THEN REPEAT strip_tac);
a(ante_tac(list_∀_elim[⌜g'⌝, ⌜g⌝, ⌜d⌝]ℝ_opah_order_thm));
a(asm_rewrite_tac[] THEN STRIP_T (fn th => all_fc_tac[th]));
(* *** Goal "2.2.2" *** *)
a(bc_thm_tac ℝ_less_sup_bc_thm THEN REPEAT strip_tac THEN1 asm_rewrite_tac[]);
(* *** Goal "2.2.2.1" *** *)
a(SPEC_NTH_ASM_T 2 ⌜x⌝ ante_tac THEN TOP_ASM_T rewrite_thm_tac);
(* *** Goal "2.2.2.2" *** *)
a(asm_rewrite_tac[] THEN PC_T1 "sets_ext" REPEAT strip_tac);
a(strip_asm_tac(list_∀_elim[⌜ℕℝ 0⌝, ⌜e⌝]ℝ_less_dense_thm));
a(strip_asm_tac(list_∀_elim[⌜d⌝, ⌜z⌝, ⌜e⌝]ℝ_copah_dense_thm));
a(spec_nth_asm_tac 4 ⌜x⌝);
a(strip_asm_tac(list_∀_elim[⌜ℕℝ 0⌝, ⌜γ x⌝]ℝ_less_dense_thm));
a(∃_tac ⌜z'⌝ THEN REPEAT strip_tac);
a(∃_tac ⌜γ⌝ THEN asm_rewrite_tac[]);
(* *** Goal "2.2.3" *** *)
a(bc_thm_tac ℝ_sup_eq_bc_thm THEN asm_rewrite_tac[] THEN REPEAT strip_tac);
(* *** Goal "2.2.3.1" *** *)
a(rewrite_tac[ℝ_≤_def] THEN ALL_FC_T rewrite_tac[ℝ_less_trans_thm]);
(* *** Goal "2.2.3.2" *** *)
a(contr_tac THEN POP_ASM_T (strip_asm_tac o rewrite_rule[ℝ_¬_≤_less_thm]));
a(lemma_tac⌜∃w⦁ x < w ∧ ℕℝ 0 < w ∧ w < e⌝);
(* *** Goal "2.2.3.2.1" *** *)
a(cases_tac⌜ℕℝ 0 < x⌝);
(* *** Goal "2.2.3.2.1.1" *** *)
a(strip_asm_tac(list_∀_elim[⌜x⌝, ⌜e⌝]ℝ_less_dense_thm));
a(∃_tac ⌜z⌝ THEN REPEAT strip_tac THEN all_fc_tac[ℝ_less_trans_thm]);
(* *** Goal "2.2.3.2.1.2" *** *)
a(POP_ASM_T (strip_asm_tac o rewrite_rule[ℝ_¬_less_≤_thm]));
a(strip_asm_tac(list_∀_elim[⌜ℕℝ 0⌝, ⌜e⌝]ℝ_less_dense_thm));
a(∃_tac ⌜z⌝ THEN REPEAT strip_tac THEN all_fc_tac[ℝ_≤_less_trans_thm]);
(* *** Goal "2.2.3.2.2" *** *)
a(strip_asm_tac(list_∀_elim[⌜d⌝, ⌜w⌝, ⌜e⌝]ℝ_copah_dense_thm));
a(swap_nth_asm_concl_tac 10 THEN REPEAT strip_tac);
a(∃_tac⌜w⌝ THEN REPEAT strip_tac);
(* *** Goal "2.2.3.2.2.1" *** *)
a(∃_tac⌜γ⌝ THEN asm_rewrite_tac[]);
(* *** Goal "2.2.3.2.2.2" *** *)
a(asm_rewrite_tac[ℝ_¬_≤_less_thm]);
pop_thm()
);
=TEX
The lemma and earlier results on extending homomorphisms gives us the desired
result:
=SML
val ⦏ℝ_opah_complete_thm⦎ = (
set_goal([], ⌜∀d e⦁
		ℕℝ 0 < d
	∧	ℕℝ 0 < e
	⇒	∃f⦁
		(∀x y⦁f (x + y) = f x + f y)
	∧	(∀x⦁ ℕℝ 0 < x ⇒ ℕℝ 0 < f x)
	∧	f d = e
⌝);
a(REPEAT strip_tac);
a(strip_asm_tac(list_∀_elim[⌜d⌝, ⌜e⌝]ℝ_opah_complete_lemma));
a(all_fc_tac[ℝ_opah_extension_thm]);
a(∃_tac⌜φ⌝ THEN asm_rewrite_tac[]);
a(spec_nth_asm_tac 3 ⌜d⌝ THEN asm_rewrite_tac[]);
save_pop_thm"ℝ_opah_complete_thm"
);
=TEX
\subsection{Consistency of Multiplication}
We can now prove the consistency of multiplication.
As so often, we need to sneak up on this slowly.
What follows is essentially the argument of sections 3.5 and 4.2 of Behrend's paper
``A contribution to the theory of magnitudes and the foundations
of analysis''.
=SML
val ⦏ℝ_times_consistent_lemma1⦎ = (
set_goal([], ⌜∃ χ⦁
		(∀ x v w⦁ ℕℝ 0 < x ⇒ χ x (v + w) = χ x v + χ x w)
	∧	(∀ x v⦁ ℕℝ 0 < x ∧ ℕℝ 0 < v ⇒ ℕℝ 0 < χ x v)
	∧	(∀ x⦁ ℕℝ 0 < x ⇒ χ x (ℕℝ 1) = x)
⌝);
a(prove_∃_tac);
a(lemma_tac ⌜ℕℝ 0 < ℕℝ 1⌝ THEN1 rewrite_tac[ℝ_less_clauses] THEN strip_tac);
a(cases_tac⌜¬ℕℝ 0 < x'⌝ THEN1 asm_rewrite_tac[]);
a(strip_asm_tac(list_∀_elim[⌜ℕℝ 1⌝, ⌜x'⌝]ℝ_opah_complete_thm) THEN1 asm_rewrite_tac[]);
a(∃_tac⌜f⌝ THEN asm_rewrite_tac[]);
pop_thm()
);
=TEX
=SML
val ⦏ℝ_times_consistent_lemma2⦎ = (
set_goal([], ⌜∃ ν⦁
		(∀ x v w⦁ ℕℝ 0 < x ⇒ ν x (v + w) = ν x v + ν x w)
	∧	(∀ x y v⦁ ℕℝ 0 < x ∧ ℕℝ 0 < y ⇒ ν (x + y) v = ν x v + ν y v)
	∧	(∀ x v⦁ ℕℝ 0 < x ∧ ℕℝ 0 < v ⇒ ℕℝ 0 < ν x v)
	∧	(∀ x⦁ ℕℝ 0 < x ⇒ ν x (ℕℝ 1) = x)
	∧	(∀ v⦁ ν (ℕℝ 1) v = v)
⌝);
a(strip_asm_tac ℝ_times_consistent_lemma1);
a(∃_tac⌜χ⌝ THEN asm_rewrite_tac[] THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(lemma_tac⌜ℕℝ 0 < x + y⌝ THEN1
	(bc_thm_tac ℝ_less_trans_thm THEN ∃_tac⌜x⌝ THEN asm_rewrite_tac[ℝ_less_clauses]));
a(SPEC_NTH_ASM_T 6 ⌜x+y⌝ ante_tac THEN TOP_ASM_T rewrite_thm_tac THEN strip_tac);
a(SPEC_NTH_ASM_T 6 ⌜x+y⌝ ante_tac THEN GET_NTH_ASM_T 2 rewrite_thm_tac THEN strip_tac);
a(SPEC_NTH_ASM_T 8 ⌜x⌝ ante_tac THEN GET_NTH_ASM_T 5 rewrite_thm_tac THEN strip_tac);
a(SPEC_NTH_ASM_T 8 ⌜x⌝ ante_tac THEN GET_NTH_ASM_T 6 rewrite_thm_tac THEN strip_tac);
a(SPEC_NTH_ASM_T 10 ⌜y⌝ ante_tac THEN GET_NTH_ASM_T 6 rewrite_thm_tac THEN strip_tac);
a(SPEC_NTH_ASM_T 10 ⌜y⌝ ante_tac THEN GET_NTH_ASM_T 7 rewrite_thm_tac THEN strip_tac);
a(lemma_tac⌜∃ξ⦁∀a⦁ξ a = χ x a + χ y a⌝ THEN1 prove_∃_tac);
a(lemma_tac⌜∀a b⦁ξ (a + b) = ξ a + ξ b⌝ THEN1 asm_rewrite_tac[]);
(* *** Goal "1.1" *** *)
a(REPEAT strip_tac);
a(rewrite_tac[∀_elim⌜χ y a⌝ℝ_plus_order_thm]);
a(rewrite_tac[ℝ_plus_assoc_thm]);
(* *** Goal "1.2" *** *)
a(lemma_tac⌜∀a⦁ℕℝ 0 < a ⇒ ℕℝ 0 < ξ a⌝ THEN1 (REPEAT strip_tac THEN asm_rewrite_tac[]));
(* *** Goal "1.2.1" *** *)
a(spec_nth_asm_tac 6 ⌜a⌝ THEN spec_nth_asm_tac 5 ⌜a⌝);
a(bc_thm_tac ℝ_less_trans_thm THEN ∃_tac ⌜χ x a⌝ THEN asm_rewrite_tac[ℝ_less_clauses]);
(* *** Goal "1.2.2" *** *)
a(spec_nth_asm_tac 13 ⌜x+y⌝ THEN spec_nth_asm_tac 14 ⌜x⌝ THEN spec_nth_asm_tac 15 ⌜y⌝);
a(lemma_tac⌜ξ (ℕℝ 1) = χ (x + y) (ℕℝ 1)⌝ THEN1 asm_rewrite_tac[]);
a(lemma_tac ⌜ℕℝ 0 < ℕℝ 1⌝ THEN1 rewrite_tac[ℝ_less_clauses]);
a(all_fc_tac[ℝ_opah_eq_thm]);
a(all_var_elim_asm_tac1 THEN asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(lemma_tac ⌜ℕℝ 0 < ℕℝ 1⌝ THEN1 rewrite_tac[ℝ_less_clauses]);
a(SPEC_NTH_ASM_T 4 ⌜ℕℝ 1⌝ ante_tac THEN GET_NTH_ASM_T 1 rewrite_thm_tac THEN strip_tac);
a(SPEC_NTH_ASM_T 4 ⌜ℕℝ 1⌝ ante_tac THEN GET_NTH_ASM_T 2 rewrite_thm_tac THEN strip_tac);
a(spec_nth_asm_tac 4 ⌜ℕℝ 1⌝);
a(strip_asm_tac ℝ_copah_id_thm);
a(lemma_tac⌜ι (ℕℝ 1) = χ (ℕℝ 1) (ℕℝ 1)⌝ THEN1 asm_rewrite_tac[]);
a(all_fc_tac[ℝ_opah_eq_thm]);
a(all_var_elim_asm_tac1 THEN asm_rewrite_tac[]);
pop_thm()
);
=TEX
=SML
val ⦏ℝ_times_consistent_lemma3⦎ = (
set_goal([], ⌜∃ π⦁
		(∀ x v w⦁ ℕℝ 0 ≤ x ⇒ π x (v + w) = π x v + π x w)
	∧	(∀ x y v⦁ ℕℝ 0 ≤ x ∧ ℕℝ 0 ≤ y ⇒ π (x + y) v = π x v + π y v)
	∧	(∀ x v⦁ ℕℝ 0 < x ∧ ℕℝ 0 < v ⇒ ℕℝ 0 < π x v)
	∧	(∀ x⦁ ℕℝ 0 ≤ x ⇒ π x (ℕℝ 1) = x)
	∧	(∀ v⦁ π (ℕℝ 1) v = v)
	∧	(∀ v⦁ π (ℕℝ 0) v = ℕℝ 0)
⌝);
a(strip_asm_tac ℝ_times_consistent_lemma2);
a(∃_tac⌜λx v⦁if x = ℕℝ 0 then ℕℝ 0 else ν x v⌝
	THEN rewrite_tac[] THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(cases_tac ⌜x = ℕℝ 0⌝ THEN asm_rewrite_tac[ℝ_plus_clauses]);
a(POP_ASM_T (strip_asm_tac o conv_rule (ONCE_MAP_C eq_sym_conv)));
a(DROP_NTH_ASM_T 2 ante_tac THEN asm_rewrite_tac[ℝ_≤_def] THEN REPEAT strip_tac);
(* *** Goal "2" *** *)
a(cases_tac ⌜x = ℕℝ 0⌝ THEN asm_rewrite_tac[ℝ_plus_clauses]);
a(cases_tac ⌜y = ℕℝ 0⌝ THEN asm_rewrite_tac[ℝ_plus_clauses]);
a(DROP_NTH_ASM_T 2 (strip_asm_tac o conv_rule (ONCE_MAP_C eq_sym_conv)));
a(DROP_NTH_ASM_T 2 (strip_asm_tac o conv_rule (ONCE_MAP_C eq_sym_conv)));
a(DROP_NTH_ASM_T 4 ante_tac THEN asm_rewrite_tac[ℝ_≤_def] THEN REPEAT strip_tac);
a(DROP_NTH_ASM_T 4 ante_tac THEN asm_rewrite_tac[ℝ_≤_def] THEN REPEAT strip_tac);
a(lemma_tac⌜ℕℝ 0 < x + y⌝ THEN1
	(bc_thm_tac ℝ_less_trans_thm THEN ∃_tac⌜x⌝ THEN asm_rewrite_tac[ℝ_less_clauses]));
a(LEMMA_T⌜¬x + y = ℕℝ 0⌝ rewrite_thm_tac THEN1
	(swap_nth_asm_concl_tac 1 THEN asm_rewrite_tac[ℝ_less_clauses]));
a(ALL_ASM_FC_T rewrite_tac[]);
(* *** Goal "3" *** *)
a(LEMMA_T⌜¬x = ℕℝ 0⌝ rewrite_thm_tac THEN1
	(swap_nth_asm_concl_tac 2 THEN asm_rewrite_tac[ℝ_less_clauses]));
a(all_asm_fc_tac[]);
(* *** Goal "4" *** *)
a(cases_tac ⌜x = ℕℝ 0⌝ THEN asm_rewrite_tac[]);
a(POP_ASM_T (strip_asm_tac o conv_rule (ONCE_MAP_C eq_sym_conv)));
a(DROP_NTH_ASM_T 2 ante_tac THEN asm_rewrite_tac[ℝ_≤_def]);
(* *** Goal "5" *** *)
a(asm_rewrite_tac[ℝ_plus_clauses]);
pop_thm()
);
=TEX
=SML
val ⦏ℝ_times_consistent_lemma4⦎ = (
set_goal([], ⌜∃ ω⦁
		(∀ x v w⦁ ω x (v + w) = ω x v + ω x w)
	∧	(∀ x y v⦁ ω (x + y) v = ω x v + ω y v)
	∧	(∀ x v⦁ ℕℝ 0 < x ∧ ℕℝ 0 < v ⇒ ℕℝ 0 < ω x v)
	∧	(∀ x⦁ ω x (ℕℝ 1) = x)
	∧	(∀ v⦁ ω (ℕℝ 1) v = v)
⌝);
a(strip_asm_tac ℝ_times_consistent_lemma3);
a(lemma_tac⌜∃φ⦁∀x v⦁φ v x = if ℕℝ 0 ≤ x then π x v else ~(π (~x) v)⌝ THEN1 prove_∃_tac);
a(∃_tac⌜λx v⦁φ v x⌝ THEN rewrite_tac[] THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(POP_ASM_T rewrite_thm_tac);
a(cases_tac⌜ℕℝ 0 ≤ x⌝ THEN ALL_ASM_FC_T asm_rewrite_tac[]);
a(all_fc_tac[ℝ_≤_cases_thm]);
a(POP_ASM_T (strip_asm_tac o
	rewrite_rule[ℝ_plus_clauses] o once_rewrite_rule[ℝ_≤_0_≤_thm]));
a(ALL_ASM_FC_T rewrite_tac[]);
a(rewrite_tac[ℝ_minus_clauses]);
(* *** Goal "2" *** *)
a(lemma_tac⌜(∀x y⦁ℕℝ 0 ≤ x ∧ ℕℝ 0 ≤ y ⇒ φ v (x + y) = φ v x + φ v y)
	∧	(∀ x⦁ ℕℝ 0 ≤ x ⇒ φ v (~ x) = ~ (φ v x))	⌝);
(* *** Goal "2.1" *** *)
a(asm_rewrite_tac[] THEN REPEAT strip_tac);
(* *** Goal "2.1.1" *** *)
a(lemma_tac⌜ℕℝ 0 ≤ x + y⌝ THEN1
	(bc_thm_tac ℝ_≤_trans_thm THEN ∃_tac⌜x⌝ THEN asm_rewrite_tac[ℝ_≤_clauses]));
a(ALL_ASM_FC_T asm_rewrite_tac[]);
(* *** Goal "2.1.2" *** *)
a(cases_tac ⌜ℕℝ 0 ≤ ~x⌝ THEN
	ALL_ASM_FC_T asm_rewrite_tac[] THEN_TRY rewrite_tac[ℝ_minus_clauses]);
a(POP_ASM_T (strip_asm_tac o
	rewrite_rule[ℝ_plus_clauses, ℝ_minus_clauses] o once_rewrite_rule[ℝ_≤_≤_0_thm]));
a(lemma_tac⌜x = ℕℝ 0⌝ THEN1 asm_rewrite_tac[ℝ_eq_≤_thm]);
a(all_var_elim_asm_tac1);
a(asm_rewrite_tac[ℝ_minus_clauses]);
(* *** Goal "2.2" *** *)
a(ALL_FC_T rewrite_tac[ℝ_add_hom_extension_thm]);
(* *** Goal "3" *** *)
a(DROP_NTH_ASM_T 3 rewrite_thm_tac);
a(LEMMA_T ⌜ℕℝ 0 ≤ x⌝ rewrite_thm_tac THEN1 asm_rewrite_tac[ℝ_≤_def]);
a(all_asm_fc_tac[]);
(* *** Goal "4" *** *)
a(POP_ASM_T rewrite_thm_tac);
a(cases_tac⌜ℕℝ 0 ≤ x⌝ THEN ALL_ASM_FC_T asm_rewrite_tac[]);
a(all_fc_tac[ℝ_≤_cases_thm]);
a(POP_ASM_T (strip_asm_tac o
	rewrite_rule[ℝ_plus_clauses] o once_rewrite_rule[ℝ_≤_0_≤_thm]));
a(ALL_ASM_FC_T rewrite_tac[]);
a(rewrite_tac[ℝ_minus_clauses]);
(* *** Goal "5" *** *)
a(POP_ASM_T rewrite_thm_tac);
a(asm_rewrite_tac[ℝ_≤_clauses]);
pop_thm()
);
=TEX
=SML
val ⦏ℝ_times_consistent_lemma5⦎ = (
set_goal([], ⌜∃ ω⦁
		(∀ x v w⦁ ω x (v + w) = ω x v + ω x w)
	∧	(∀ x y v⦁ ω (x + y) v = ω x v + ω y v)
	∧	(∀ x v⦁ ℕℝ 0 < x ∧ ℕℝ 0 < v ⇒ ℕℝ 0 < ω x v)
	∧	(∀ x⦁ ω x (ℕℝ 1) = x)
	∧	(∀ v⦁ ω (ℕℝ 1) v = v)
	∧	(∀ x⦁ ω x (ℕℝ 0) = ℕℝ 0 ∧ ω (ℕℝ 0) x = ℕℝ 0)
	∧	(∀ x y⦁ ω x (~y) = ~(ω x y) ∧ ω (~x) y = ~(ω x y))
⌝);
a(strip_asm_tac ℝ_times_consistent_lemma4);
a(∃_tac⌜ω⌝ THEN asm_rewrite_tac[] THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(spec_nth_asm_tac 5 ⌜x⌝ THEN all_fc_tac[ℝ_add_hom_0_thm]);
(* *** Goal "2" *** *)
a(lemma_tac⌜∃φ⦁∀v⦁φ v = ω v x⌝ THEN1 prove_∃_tac);
a(lemma_tac⌜∀ v w⦁ φ (v + w) = φ v + φ w⌝ THEN1 asm_rewrite_tac[]);
a(all_fc_tac[ℝ_add_hom_0_thm]);
a(POP_ASM_T ante_tac THEN asm_rewrite_tac[]);
(* *** Goal "3" *** *)
a(lemma_tac⌜∃φ⦁∀v⦁φ v = ω x v⌝ THEN1 prove_∃_tac);
a(lemma_tac⌜∀ v w⦁ φ (v + w) = φ v + φ w⌝ THEN1 asm_rewrite_tac[]);
a(all_fc_tac[ℝ_add_hom_minus_thm]);
a(rename_tac[] THEN POP_ASM_T ante_tac THEN asm_rewrite_tac[]
	THEN REPEAT strip_tac THEN asm_rewrite_tac[]);
(* *** Goal "4" *** *)
a(lemma_tac⌜∃φ⦁∀v⦁φ v = ω v y⌝ THEN1 prove_∃_tac);
a(lemma_tac⌜∀ v w⦁ φ (v + w) = φ v + φ w⌝ THEN1 asm_rewrite_tac[]);
a(all_fc_tac[ℝ_add_hom_minus_thm]);
a(rename_tac[] THEN POP_ASM_T ante_tac THEN asm_rewrite_tac[]
	THEN REPEAT strip_tac THEN asm_rewrite_tac[]);
pop_thm()
);
=TEX
=SML
val ⦏ℝ_times_consistent_lemma6⦎ = (
set_goal([], ⌜∃ ω⦁
		(∀ x v w⦁ ω x (v + w) = ω x v + ω x w)
	∧	(∀ x y v⦁ ω (x + y) v = ω x v + ω y v)
	∧	(∀ x v⦁ ℕℝ 0 < x ∧ ℕℝ 0 < v ⇒ ℕℝ 0 < ω x v)
	∧	(∀ x⦁ ω x (ℕℝ 1) = x)
	∧	(∀ v⦁ ω (ℕℝ 1) v = v)
	∧	(∀ x⦁ ω x (ℕℝ 0) = ℕℝ 0 ∧ ω (ℕℝ 0) x = ℕℝ 0)
	∧	(∀ x y⦁ ω x (~y) = ~(ω x y) ∧ ω (~x) y = ~(ω x y))
	∧	(∀ x y z⦁ ω (ω x y) z = ω x (ω y z))
⌝);
a(strip_asm_tac ℝ_times_consistent_lemma5);
a(∃_tac⌜ω⌝ THEN asm_rewrite_tac[] THEN REPEAT strip_tac);
a(cases_tac⌜x = ℕℝ 0 ∨ z = ℕℝ 0⌝ THEN_TRY asm_rewrite_tac[]);
a(lemma_tac⌜∀v w⦁ ℕℝ 0 < v ∧ ℕℝ 0 < w ⇒ω (ω v y) w = ω v (ω y w) ⌝ THEN1 REPEAT strip_tac);
(* *** Goal "1" *** *)
a(lemma_tac⌜∃ξ⦁∀a⦁ξ a = ω (ω v a) w⌝ THEN1 prove_∃_tac);
a(lemma_tac⌜∀a b⦁ξ (a + b) = ξ a + ξ b⌝ THEN1 asm_rewrite_tac[]);
a(lemma_tac⌜∀a⦁ℕℝ 0 < a ⇒ ℕℝ 0 < ξ a⌝ THEN1 (REPEAT strip_tac THEN asm_rewrite_tac[]));
(* *** Goal "1.1" *** *)
a(GET_NTH_ASM_T 12 bc_thm_tac THEN REPEAT strip_tac);
a(GET_NTH_ASM_T 12 bc_thm_tac THEN REPEAT strip_tac);
(* *** Goal "1.2" *** *)
a(lemma_tac⌜∃η⦁∀a⦁η a = ω v (ω a w)⌝ THEN1 prove_∃_tac);
a(lemma_tac⌜∀a b⦁η (a + b) = η a + η b⌝ THEN1 asm_rewrite_tac[]);
a(lemma_tac⌜∀a⦁ℕℝ 0 < a ⇒ ℕℝ 0 < η a⌝ THEN1 (REPEAT strip_tac THEN asm_rewrite_tac[]));
(* *** Goal "1.2.1" *** *)
a(GET_NTH_ASM_T 15 bc_thm_tac THEN REPEAT strip_tac);
a(GET_NTH_ASM_T 15 bc_thm_tac THEN REPEAT strip_tac);
(* *** Goal "1.2.2" *** *)
a(lemma_tac ⌜ℕℝ 0 < ℕℝ 1⌝ THEN1 rewrite_tac[ℝ_less_clauses]);
a(lemma_tac⌜ξ (ℕℝ 1) = η (ℕℝ 1)⌝ THEN1 asm_rewrite_tac[]);
a(all_fc_tac[ℝ_opah_eq_thm]);
a(LEMMA_T⌜ξ y = η y⌝ ante_tac THEN1 TOP_ASM_T rewrite_thm_tac);
a(LIST_GET_NTH_ASM_T [6, 9] rewrite_tac);
(* *** Goal "2" *** *)
a(strip_asm_tac (list_∀_elim[⌜x⌝, ⌜ℕℝ 0⌝]ℝ_less_cases_thm) THEN
	strip_asm_tac (list_∀_elim[⌜z⌝, ⌜ℕℝ 0⌝]ℝ_less_cases_thm) THEN
	POP_ASM_T ante_tac THEN POP_ASM_T ante_tac THEN
	once_rewrite_tac[ℝ_less_0_less_thm] THEN
	rewrite_tac[ℝ_plus_clauses, ℝ_minus_clauses] THEN
	REPEAT strip_tac THEN
	LIST_GET_NTH_ASM_T [3] (ALL_FC_T (MAP_EVERY ante_tac)) THEN_TRY
	asm_rewrite_tac[ℝ_minus_clauses, ℝ_minus_eq_thm] THEN
	taut_tac);
pop_thm()
);
=TEX
=SML
val ⦏ℝ_times_consistent_lemma7⦎ = (
set_goal([], ⌜∃ ω⦁
		(∀ x v w⦁ ω x (v + w) = ω x v + ω x w)
	∧	(∀ x y v⦁ ω (x + y) v = ω x v + ω y v)
	∧	(∀ x v⦁ ℕℝ 0 < x ∧ ℕℝ 0 < v ⇒ ℕℝ 0 < ω x v)
	∧	(∀ x⦁ ω x (ℕℝ 1) = x)
	∧	(∀ v⦁ ω (ℕℝ 1) v = v)
	∧	(∀ x⦁ ω x (ℕℝ 0) = ℕℝ 0 ∧ ω (ℕℝ 0) x = ℕℝ 0)
	∧	(∀ x y⦁ ω x (~y) = ~(ω x y) ∧ ω (~x) y = ~(ω x y))
	∧	(∀ x y z⦁ ω (ω x y) z = ω x (ω y z))
	∧	(∀ x y⦁ ω x y = ω y x)
⌝);
a(strip_asm_tac ℝ_times_consistent_lemma6);
a(∃_tac⌜ω⌝ THEN asm_rewrite_tac[] THEN REPEAT strip_tac);
a(cases_tac⌜y = ℕℝ 0⌝ THEN1 asm_rewrite_tac[]);
a(lemma_tac⌜∀v w⦁ ℕℝ 0 < w ⇒ ω v w = ω w v ⌝ THEN1 REPEAT strip_tac);
(* *** Goal "1" *** *)
a(lemma_tac⌜∃ξ⦁∀a⦁ξ a = ω a w⌝ THEN1 prove_∃_tac);
a(lemma_tac⌜∀a b⦁ξ (a + b) = ξ a + ξ b⌝ THEN1 asm_rewrite_tac[]);
a(lemma_tac⌜∀a⦁ℕℝ 0 < a ⇒ ℕℝ 0 < ξ a⌝ THEN1
	(REPEAT strip_tac THEN asm_rewrite_tac[] THEN all_asm_fc_tac[]));
a(lemma_tac⌜∃η⦁∀a⦁η a = ω w a⌝ THEN1 prove_∃_tac);
a(lemma_tac⌜∀a b⦁η (a + b) = η a + η b⌝ THEN1 asm_rewrite_tac[]);
a(lemma_tac⌜∀a⦁ℕℝ 0 < a ⇒ ℕℝ 0 < η a⌝ THEN1
	(REPEAT strip_tac THEN asm_rewrite_tac[] THEN all_asm_fc_tac[]));
a(lemma_tac ⌜ℕℝ 0 < ℕℝ 1⌝ THEN1 rewrite_tac[ℝ_less_clauses]);
a(lemma_tac⌜ξ (ℕℝ 1) = η (ℕℝ 1)⌝ THEN1 asm_rewrite_tac[]);
a(all_fc_tac[ℝ_opah_eq_thm]);
a(LEMMA_T⌜ξ v = η v⌝ ante_tac THEN1 TOP_ASM_T rewrite_thm_tac);
a(LIST_GET_NTH_ASM_T [6, 9] rewrite_tac);
(* *** Goal "2" *** *)
a(strip_asm_tac (list_∀_elim[⌜y⌝, ⌜ℕℝ 0⌝]ℝ_less_cases_thm) THEN
	POP_ASM_T ante_tac THEN
	once_rewrite_tac[ℝ_less_0_less_thm] THEN
	rewrite_tac[ℝ_plus_clauses, ℝ_minus_clauses] THEN
	REPEAT strip_tac THEN
	LIST_GET_NTH_ASM_T [2] (ALL_FC_T (MAP_EVERY ante_tac)) THEN_TRY
	asm_rewrite_tac[ℝ_minus_clauses, ℝ_minus_eq_thm] THEN
	STRIP_T rewrite_thm_tac);
pop_thm()
);
=TEX
We are now ready to prove the consistency of the definition of multiplication.
The only tiny difficulty is to avoid a looping rewrite from the commutative law.

=SML
val _ = (
push_consistency_goal⌜$*⋎R⌝;
a(strip_asm_tac ℝ_times_consistent_lemma7);
a(∃_tac⌜ω⌝ THEN POP_ASM_T
	(fn th => asm_rewrite_tac[] THEN strip_asm_tac th));
save_consistency_thm⌜$*⋎R⌝(pop_thm())
);
=TEX
We now prove a handful of theorems about multiplication.
More will follow when we have division available.
=SML
end (* of structure ℝ part 8 *);
structure ⦏ℝ⦎ (* : ℝ *) = struct
open ℝ;
=TEX
=SML
val ⦏ℝ_times_def⦎ = get_spec⌜$*⋎R⌝;
val [	⦏ℝ_times_assoc_thm⦎,
	⦏ℝ_times_unit_thm⦎,
	⦏ℝ_times_distrib_lemma⦎,
	⦏ℝ_times_comm_thm⦎,
	⦏ℝ_0_less_0_less_times_thm⦎ ] = strip_∧_rule ℝ_times_def;
val ⦏ℝ_times_assoc_thm1⦎ = conv_rule (ONCE_MAP_C eq_sym_conv) ℝ_times_assoc_thm;
val _ = save_thm("ℝ_times_assoc_thm", ℝ_times_assoc_thm);
val _ = save_thm("ℝ_times_comm_thm", ℝ_times_comm_thm);
val _ = save_thm("ℝ_times_unit_thm", ℝ_times_unit_thm);
val _ = save_thm("ℝ_0_less_0_less_times_thm", ℝ_0_less_0_less_times_thm);
val _ = save_thm("ℝ_times_assoc_thm1", ℝ_times_assoc_thm1);
=TEX
=SML
val ⦏ℝ_times_plus_distrib_thm⦎ = (
set_goal([], ⌜∀ x y z:ℝ⦁ x * (y + z) = x * y + x * z ∧ (x + y) * z = x * z + y * z ⌝);
a(rewrite_tac [ℝ_times_distrib_lemma] THEN REPEAT strip_tac);
a(once_rewrite_tac[ℝ_times_comm_thm] THEN rewrite_tac [ℝ_times_distrib_lemma]);
save_pop_thm"ℝ_times_plus_distrib_thm"
);
=TEX
=SML
val ⦏ℝ_times_order_thm⦎ = (
set_goal([], ⌜∀ x : ℝ ⦁ ∀ y z ⦁
		y * x = x * y
	∧	(x * y) * z = x * y * z
	∧	y * x * z = x * y * z⌝);
a (REPEAT strip_tac);
(* *** Goal "1" *** *)
a (rewrite_tac [list_∀_elim [⌜y⌝,⌜x⌝] ℝ_times_comm_thm]);
(* *** Goal "2" *** *)
a (rewrite_tac [all_∀_elim ℝ_times_assoc_thm]);
(* *** Goal "3" *** *)
a (rewrite_tac [list_∀_elim [⌜y⌝,⌜x⌝,⌜z⌝] ℝ_times_assoc_thm1]);
a (once_rewrite_tac [list_∀_elim [⌜y⌝,⌜x⌝] ℝ_times_comm_thm]);
a (rewrite_tac [ℝ_times_assoc_thm]);
save_pop_thm "ℝ_times_order_thm"
);
=TEX
=SML
val ⦏ℝ_times_0_thm1⦎ = (
set_goal([], ⌜∀x:ℝ⦁ x * ℕℝ 0 = ℕℝ 0⌝);
a(accept_tac(
	all_∀_intro
	(rewrite_rule[ℝ_plus_clauses, ℝ_plus_0_thm](prove_rule[ℝ_times_plus_distrib_thm]
	⌜x*(ℕℝ 0 + ℕℝ 0) = x * ℕℝ 0 + x * ℕℝ 0⌝))));
pop_thm()
);
=TEX
=SML
val ⦏ℝ_times_0_thm⦎ = (
set_goal([], ⌜∀x:ℝ⦁ x * ℕℝ 0 = ℕℝ 0 ∧ ℕℝ 0 * x = ℕℝ 0⌝);
a(rewrite_tac[∀_elim⌜x:ℝ⌝ℝ_times_order_thm, ℝ_times_0_thm1]);
save_pop_thm "ℝ_times_0_thm"
);
=TEX
=SML
val ⦏ℝ_times_1_thm⦎ = (
set_goal([], ⌜∀x:ℝ⦁ x * ℕℝ 1 = x ∧ ℕℝ 1 * x = x⌝);
a(rewrite_tac[∀_elim⌜x:ℝ⌝ℝ_times_order_thm, ℝ_times_unit_thm]);
save_pop_thm "ℝ_times_1_thm"
);
=TEX
=SML
val ⦏ℕℝ_times_homomorphism_thm⦎ = (
set_goal([], ⌜∀ m n : ℕ ⦁ ℕℝ(m * n) = ℕℝ m * ℕℝ n⌝);
a(REPEAT strip_tac);
a(induction_tac⌜n⌝);
(* *** Goal "1" *** *)
a(rewrite_tac[times_clauses, ℝ_times_0_thm]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[times_plus_distrib_thm, ℝ_times_1_thm,
	ℝ_times_plus_distrib_thm, ℕℝ_plus_homomorphism_thm]);
save_pop_thm"ℕℝ_times_homomorphism_thm"
);
=TEX
=SML
val ⦏ℕℝ_times_homomorphism_thm1⦎ = conv_rule (ONCE_MAP_C eq_sym_conv) ℕℝ_times_homomorphism_thm;
=TEX
=SML
val ⦏ℝ_times_minus_thm1⦎ = (
set_goal([], ⌜∀x y:ℝ⦁ x * ~ y = ~(x * y)⌝);
a(REPEAT strip_tac);
a(lemma_tac ⌜x * ~ y+ x * y = ℕℝ 0⌝);
(* *** Goal "1" *** *)
a(LEMMA_T ⌜x * ~ y + x * y = x * (~y + y)⌝ rewrite_thm_tac
	THEN1 rewrite_tac[ℝ_times_plus_distrib_thm]);
a(rewrite_tac[ℝ_minus_clauses, ℝ_times_0_thm1]);
(* *** Goal "2" *** *)
a(once_rewrite_tac[ℝ_eq_thm]);
a(asm_rewrite_tac[ℝ_minus_clauses]);
pop_thm()
);
=TEX
=SML
val ⦏ℝ_times_minus_thm⦎ = (
set_goal([], ⌜∀x y:ℝ⦁ ~x * y = ~(x * y) ∧ x * ~ y = ~(x * y) ∧ ~x * ~y = x * y⌝);
a(REPEAT ∀_tac);
a(rewrite_tac[∀_elim⌜y⌝ℝ_times_order_thm]);
a(rewrite_tac[ℝ_times_minus_thm1]);
a(rewrite_tac[∀_elim⌜y⌝ℝ_times_order_thm]);
a(rewrite_tac[ℝ_times_minus_thm1, ℝ_minus_clauses]);
save_pop_thm"ℝ_times_minus_thm"
);
=TEX
\subsection{Consistency of Division}
We can now prove the consistency of the definition of division.
=SML
val ⦏ℝ_over_consistent_lemma1⦎ = (
set_goal([], ⌜∀z⦁ ¬z = ℕℝ 0 ⇒ ∃r⦁z * r = ℕℝ 1⌝);
a(REPEAT ∀_tac);
a(lemma_tac⌜∀z⦁ ℕℝ 0 < z ⇒ ∃r⦁z * r = ℕℝ 1⌝ THEN REPEAT strip_tac);
a(lemma_tac⌜∃ξ⦁∀a⦁ξ a = z * a⌝ THEN1 prove_∃_tac);
a(lemma_tac⌜∀a b⦁ξ (a + b) = ξ a + ξ b⌝ THEN1 asm_rewrite_tac[ℝ_times_plus_distrib_thm]);
a(lemma_tac⌜∀a⦁ℕℝ 0 < a ⇒ ℕℝ 0 < ξ a⌝ THEN1 (REPEAT strip_tac THEN asm_rewrite_tac[])
	THEN1 (once_rewrite_tac[ℝ_times_comm_thm] THEN all_fc_tac[ℝ_0_less_0_less_times_thm]));
a(all_fc_tac[ℝ_opah_onto_thm]);
a(POP_ASM_T ante_tac THEN rewrite_tac[onto_def] THEN REPEAT strip_tac);
a(SPEC_NTH_ASM_T 1 ⌜ℕℝ 1⌝ ante_tac THEN GET_NTH_ASM_T 4 rewrite_thm_tac THEN strip_tac);
a(∃_tac⌜x⌝ THEN asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(cases_tac ⌜ℕℝ 0 < z⌝);
(* *** Goal "2.1" *** *)
a(all_asm_fc_tac[]);
a(∃_tac⌜r⌝ THEN asm_rewrite_tac[]);
(* *** Goal "2.2" *** *)
a(POP_ASM_T (strip_asm_tac o rewrite_rule[ℝ_≤_def, ℝ_¬_less_≤_thm]));
a(POP_ASM_T (strip_asm_tac o
	rewrite_rule[ℝ_plus_clauses] o once_rewrite_rule[ℝ_less_0_less_thm]));
a(all_asm_fc_tac[]);
a(POP_ASM_T ante_tac THEN rewrite_tac[ℝ_times_minus_thm] THEN strip_tac);
a(∃_tac⌜~r⌝ THEN asm_rewrite_tac[ℝ_times_minus_thm, ℝ_minus_eq_thm]);
pop_thm()
);
=SML
val _ = (
push_consistency_goal⌜$/⋎R⌝;
a(lemma_tac⌜∃f⦁ ∀ z⦁
	(¬ z = ℕℝ 0 ⇒ z * f z = ℕℝ 1)
(* ∧	(z = ℕℝ 0 ⇒ f z = ℕℝ 0) *)
⌝);
(* *** Goal "1" *** *)
a(prove_∃_tac THEN REPEAT strip_tac);
a(cases_tac ⌜z' = ℕℝ 0⌝ THEN asm_rewrite_tac[]
	THEN1 TRY prove_∃_tac);
a(bc_thm_tac ℝ_over_consistent_lemma1 THEN REPEAT strip_tac);
(* *** Goal "2" *** *)
a(∃_tac⌜λv w⦁v * f w⌝ THEN asm_rewrite_tac[]);
a(REPEAT strip_tac);
(* *** Goal "2.1" *** *)
a(rewrite_tac[ℝ_times_assoc_thm] THEN ALL_ASM_FC_T rewrite_tac[]);
a(rewrite_tac[ℝ_times_1_thm]);
(* *** Goal "2.2" *** *)
a(rewrite_tac[ℝ_times_assoc_thm]);
(*
(* *** Goal "2.3" *** *)
a(SPEC_NTH_ASM_T 1 ⌜ℕℝ 0⌝ ante_tac THEN rewrite_tac[]);
a(strip_tac THEN asm_rewrite_tac[ℝ_times_0_thm]);
*)
save_consistency_thm⌜$/⋎R⌝(pop_thm())
);
=SML
val ⦏ℝ_over_def⦎ = get_spec⌜$/⋎R⌝;
=TEX
=SML
end (* of structure ℝ part 9 *);
structure ⦏ℝ⦎ (* : ℝ *) = struct
open ℝ;
=TEX
=TEX
=SML
val ⦏ℝ_over_times_recip_thm⦎ = (
set_goal ([], ⌜∀z⦁¬ z = ℕℝ 0 ⇒ ∀x⦁x / z = x * z ⋏-⋏1⌝);
a(rewrite_tac[get_spec⌜$⋏-⋏1⌝]);
a(REPEAT strip_tac THEN fc_tac[ℝ_over_def]);
(* *** Goal "1" *** *)
a(LEMMA_T⌜x / z = (x * ℕℝ 1)/z⌝ rewrite_thm_tac THEN1 rewrite_tac[ℝ_times_1_thm]);
a(asm_rewrite_tac[]);
save_pop_thm "ℝ_over_times_recip_thm"
);
=TEX
=SML
val ⦏ℝ_times_recip_thm⦎ = (
set_goal ([], ⌜∀z⦁¬ z = ℕℝ 0 ⇒ z * z ⋏-⋏1 = ℕℝ 1⌝);
a(rewrite_tac[get_spec⌜$⋏-⋏1⌝]);
a(REPEAT strip_tac THEN fc_tac[ℝ_over_def]);
(* *** Goal "1" *** *)
a(LEMMA_T⌜z * ℕℝ 1 / z = (ℕℝ 1 * z) / z⌝ rewrite_thm_tac THEN1
	(rewrite_tac[∀_elim⌜z⌝ℝ_times_order_thm] THEN GET_NTH_ASM_T 2 rewrite_thm_tac));
a(TOP_ASM_T rewrite_thm_tac);
save_pop_thm "ℝ_times_recip_thm"
);
=TEX
=SML
val ⦏ℝ_eq_recip_thm⦎ = (
set_goal ([], ⌜∀z⦁¬ z = ℕℝ 0 ⇒ (∀y⦁ y = z ⇔ y * z ⋏-⋏1 = ℕℝ 1)⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(var_elim_asm_tac ⌜y = z⌝);
a(all_fc_tac[ℝ_times_recip_thm]);
(* *** Goal "2" *** *)
a(LEMMA_T ⌜z * (y * z ⋏-⋏1) = z * ℕℝ 1⌝ ante_tac THEN1 asm_rewrite_tac[]);
a(rewrite_tac[ℝ_times_1_thm, ∀_elim⌜y⌝ℝ_times_order_thm]);
a(ALL_FC_T rewrite_tac[ℝ_times_recip_thm]);
a(rewrite_tac[ℝ_times_1_thm]);
save_pop_thm "ℝ_eq_recip_thm"
);
=TEX
=SML
val ⦏ℝ_times_cancel_thm⦎ = (
set_goal ([], ⌜∀ x y z⦁ ¬ z = ℕℝ 0 ⇒ (x*z = y*z ⇔ x = y)⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(LEMMA_T ⌜(x*z) * z ⋏-⋏1 = (y*z) * z ⋏-⋏1⌝ ante_tac THEN1 asm_rewrite_tac[]);
a(rewrite_tac[ℝ_times_assoc_thm]);
a(ALL_FC_T rewrite_tac[ℝ_times_recip_thm]);
a(rewrite_tac[ℝ_times_1_thm]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[]);
save_pop_thm "ℝ_times_cancel_thm"
);
=TEX
=SML
val ⦏ℝ_times_eq_0_thm⦎ = (
set_goal ([], ⌜∀ x y : ℝ ⦁ x * y = ℕℝ 0 ⇔ x = ℕℝ 0 ∨ y = ℕℝ 0⌝);
a(conv_tac (ONCE_MAP_C eq_sym_conv));
a(REPEAT strip_tac THEN_LIST
	[asm_rewrite_tac[ℝ_times_0_thm], asm_rewrite_tac[ℝ_times_0_thm], id_tac]);
a(contr_tac THEN LEMMA_T ⌜ℕℝ 1 = ℕℝ 0⌝ (strip_asm_tac o rewrite_rule[ℝ_plus_clauses]));
a(LEMMA_T⌜x * y * y ⋏-⋏1 * x ⋏-⋏1 = ℕℝ 0⌝ ante_tac);
(* *** Goal "1" *** *)
a(asm_rewrite_tac[ℝ_times_assoc_thm1, ℝ_times_0_thm]);
(* *** Goal "2" *** *)
a(rewrite_tac[∀_elim⌜x ⋏-⋏1⌝ ℝ_times_order_thm]);
a(rewrite_tac[∀_elim⌜x⌝ ℝ_times_order_thm]);
a(ALL_FC_T rewrite_tac[ℝ_times_recip_thm]);
a(rewrite_tac[ℝ_times_1_thm]);
a(ALL_FC_T rewrite_tac[ℝ_times_recip_thm]);
save_pop_thm "ℝ_times_eq_0_thm"
);
=TEX
=SML
val ⦏ℝ_times_clauses⦎ = (
set_goal ([], ⌜∀ x ⦁ ℕℝ 0 * x = ℕℝ 0 ∧ x * ℕℝ 0 = ℕℝ 0 ∧ x * ℕℝ 1 = x ∧ ℕℝ 1 * x = x⌝);
a(rewrite_tac[ℝ_times_0_thm, ℝ_times_1_thm]);
save_pop_thm "ℝ_times_clauses"
);
=TEX
=SML
val ⦏ℝ_times_mono_⇔_thm⦎ = (
set_goal ([], ⌜∀ x⦁ ℕℝ 0 < x ⇒ (∀ y z⦁ y < z ⇔ x * y < x * z)⌝);
a(REPEAT_N 2 strip_tac);
a(lemma_tac⌜∃f⦁∀v⦁f v = x*v⌝ THEN1 prove_∃_tac);
a(lemma_tac⌜∀v w⦁f (v + w) = f v + f w⌝ THEN1
	asm_rewrite_tac[ℝ_times_plus_distrib_thm]);
a(lemma_tac⌜∀v⦁ℕℝ 0 < v ⇒ ℕℝ 0 < f v⌝ THEN1
	(asm_rewrite_tac[] THEN REPEAT strip_tac
	THEN all_fc_tac[ℝ_0_less_0_less_times_thm]));
a(GET_NTH_ASM_T 3 (rewrite_thm_tac o conv_rule (ONCE_MAP_C eq_sym_conv)));
a(REPEAT strip_tac THEN all_fc_tac[ℝ_opah_thm, ℝ_opah_strict_thm]);
save_pop_thm "ℝ_times_mono_⇔_thm"
);
=TEX
=SML
val ⦏ℝ_times_mono_thm⦎ = (
set_goal ([], ⌜∀ x y z⦁ ℕℝ 0 < x ∧ y < z ⇒ x * y < x * z⌝);
a(REPEAT strip_tac THEN all_fc_tac[ℝ_times_mono_⇔_thm]);
save_pop_thm "ℝ_times_mono_thm"
);
=TEX
=SML
val ⦏ℝ_0_≤_0_≤_times_thm⦎ = (
set_goal ([], ⌜∀ x y ⦁ ℕℝ 0 ≤ x ∧ ℕℝ 0 ≤ y ⇒ ℕℝ 0 ≤ x*y⌝);
a(rewrite_tac[ℝ_≤_def] THEN REPEAT strip_tac THEN
	(SOLVED_T (all_fc_tac[ℝ_0_less_0_less_times_thm]) ORELSE
	 all_var_elim_asm_tac1 THEN_TRY rewrite_tac[ℝ_times_clauses]));
save_pop_thm "ℝ_0_≤_0_≤_times_thm"
);
=TEX
=SML
val ⦏ℝ_¬_recip_0_thm⦎ = (
set_goal ([], ⌜∀z⦁¬ z = ℕℝ 0 ⇒ ¬z ⋏-⋏1 = ℕℝ 0⌝);
a(contr_tac);
a(all_fc_tac[ℝ_times_recip_thm]);
a(POP_ASM_T ante_tac THEN asm_rewrite_tac[ℝ_times_clauses, ℝ_plus_clauses]);
save_pop_thm "ℝ_¬_recip_0_thm"
);
=TEX
Our general strategy for expressions involving
multiplication and division is analogous to that
used for addition and subtraction, where we replace
subtraction by addition of the inverse element and push
unary minus signs into sums.
=TEX
=SML
val ⦏ℝ_recip_clauses1⦎ = (
set_goal ([], ⌜
	(ℕℝ 1) ⋏-⋏1  = ℕℝ 1
∧	(∀ w ⦁ ¬w = ℕℝ 0 ⇒ (
	w ⋏-⋏1 ⋏-⋏1  = w
∧	w * w ⋏-⋏1 = ℕℝ 1
∧	w ⋏-⋏1 * w = ℕℝ 1
))⌝);
a(strip_tac THEN1 REPEAT strip_tac);
(* *** Goal "1" *** *)
a(lemma_tac⌜¬ℕℝ 1 = ℕℝ 0⌝ THEN1 rewrite_tac[ℝ_plus_clauses]);
a(rewrite_tac[get_spec⌜$⋏-⋏1⌝]);
a(ALL_FC_T once_rewrite_tac[ℝ_over_times_recip_thm]);
a(ALL_FC_T(MAP_EVERY ante_tac)[ ℝ_times_recip_thm ]);
a(REPEAT strip_tac);
(* *** Goal "2" *** *)
a(∀_tac THEN ⇒_tac);
(* *** Goal "2.1" *** *)
a(rewrite_tac[∀_elim⌜w⌝ℝ_times_order_thm]);
a(ALL_FC_T rewrite_tac[ℝ_times_recip_thm]);
a(FC_T1 fc_⇔_canon rewrite_tac[ℝ_eq_recip_thm]);
a(all_fc_tac[ℝ_¬_recip_0_thm]);
a(once_rewrite_tac[ℝ_times_comm_thm]);
a(ALL_FC_T rewrite_tac[ℝ_times_recip_thm]);
pop_thm ()
);
=TEX
=SML
val ⦏ℝ_recip_clauses2⦎ = (
set_goal ([], ⌜
	(∀w z ⦁ ¬w = ℕℝ 0 ∧ ¬z = ℕℝ 0 ⇒
	(w * z)⋏-⋏1 = w ⋏-⋏1 * z ⋏-⋏1
)⌝);
a(REPEAT strip_tac THEN conv_tac eq_sym_conv);
a(lemma_tac⌜¬w * z = ℕℝ 0⌝ THEN1 asm_rewrite_tac[ℝ_times_eq_0_thm]);
a(all_fc_tac[ℝ_¬_recip_0_thm]);
a(ALL_FC_T1 fc_⇔_canon rewrite_tac[ℝ_eq_recip_thm]);
a(ALL_FC_T rewrite_tac[ℝ_recip_clauses1]);
a(rewrite_tac[∀_elim⌜z⌝ℝ_times_order_thm]);
a(rewrite_tac[∀_elim⌜w ⋏-⋏1⌝ℝ_times_order_thm]);
a(rewrite_tac[∀_elim⌜w⌝ℝ_times_order_thm]);
a(all_fc_tac[ℝ_times_recip_thm] THEN asm_rewrite_tac[ℝ_times_clauses]);
pop_thm()
);
=TEX
=SML
val ⦏ℝ_recip_clauses⦎ = save_thm ("ℝ_recip_clauses",
	(∧_intro ℝ_recip_clauses1 ℝ_recip_clauses2));
=TEX
=SML
val ⦏ℝ_cross_mult_eq_thm⦎ = (
set_goal ([], ⌜
	(∀w z ⦁ ¬w = ℕℝ 0 ∧ ¬z = ℕℝ 0 ⇒
	(∀x y ⦁ x / w = y / z ⇔ x * z = w * y)
)⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(LEMMA_T ⌜(x / w) * w * z = (y / z) * w * z⌝ ante_tac THEN1 asm_rewrite_tac[]);
a(ALL_FC_T rewrite_tac[ℝ_over_times_recip_thm]);
a(rewrite_tac[∀_elim⌜x⌝ℝ_times_order_thm]);
a(rewrite_tac[∀_elim⌜z⌝ℝ_times_order_thm]);
a(all_fc_tac[ℝ_recip_clauses]);
a(asm_rewrite_tac[ℝ_times_clauses]);
a(rewrite_tac[∀_elim⌜y⌝ℝ_times_order_thm]);
a(rewrite_tac[∀_elim⌜w⌝ℝ_times_order_thm]);
a(asm_rewrite_tac[ℝ_times_clauses]);
(* *** Goal "2" *** *)
a(LEMMA_T ⌜(x * z)/(w * z) = (w * y)/(w * z)⌝ ante_tac THEN1 asm_rewrite_tac[]);
a(lemma_tac⌜¬w * z = ℕℝ 0⌝ THEN1 asm_rewrite_tac[ℝ_times_eq_0_thm]);
a(ALL_FC_T rewrite_tac[ℝ_over_times_recip_thm, ℝ_recip_clauses ]);
a(all_fc_tac[ℝ_recip_clauses]);
a(rewrite_tac[∀_elim⌜w ⋏-⋏1⌝ℝ_times_order_thm]);
a(asm_rewrite_tac[ℝ_times_assoc_thm, ℝ_times_clauses]);
a(asm_rewrite_tac[ℝ_times_assoc_thm1, ℝ_times_clauses]);
save_pop_thm "ℝ_cross_mult_eq_thm"
);
=TEX
=SML
val ⦏ℝ_less_¬_eq_0_thm⦎ = (
set_goal ([], ⌜∀z ⦁ ℕℝ 0 < z ⇒ ¬z = ℕℝ 0⌝);
a(contr_tac THEN all_var_elim_asm_tac1 THEN all_fc_tac[ℝ_less_irrefl_thm]);
save_pop_thm "ℝ_less_¬_eq_0_thm"
);
=TEX
=SML
val ⦏ℝ_0_less_0_less_recip_thm⦎ = (
set_goal ([], ⌜∀z ⦁ ℕℝ 0 < z ⇒ ℕℝ 0 < z ⋏-⋏1⌝);
a(REPEAT strip_tac THEN
	strip_asm_tac(list_∀_elim[⌜z ⋏-⋏1⌝, ⌜ℕℝ 0⌝] ℝ_less_cases_thm));
(* *** Goal "1" *** *)
a(POP_ASM_T (asm_tac o
	rewrite_rule[ℝ_plus_clauses] o once_rewrite_rule[ℝ_less_0_less_thm]));
a(LEMMA_T⌜ℕℝ 0 < z * ~ (z ⋏-⋏1)⌝ ante_tac THEN1
	all_fc_tac[ℝ_0_less_0_less_times_thm]);
a(once_rewrite_tac[ℝ_less_less_0_thm]);
a(rewrite_tac[ℝ_plus_clauses, ℝ_times_minus_thm, ℝ_minus_clauses]);
a(all_fc_tac[ℝ_less_¬_eq_0_thm]);
a(lemma_tac ⌜z * z ⋏-⋏1 = ℕℝ 1⌝ THEN1
	ALL_FC_T rewrite_tac[ℝ_times_recip_thm]);
a(asm_rewrite_tac[ℝ_less_clauses]);
(* *** Goal "2" *** *)
a(all_fc_tac[ℝ_less_¬_eq_0_thm]);
a(LEMMA_T ⌜z * z ⋏-⋏1 = ℕℝ 1⌝ ante_tac THEN1
	ALL_FC_T rewrite_tac[ℝ_times_recip_thm]);
a(asm_rewrite_tac[ℝ_times_clauses, ℝ_plus_clauses]);
save_pop_thm "ℝ_0_less_0_less_recip_thm"
);
=TEX
=SML
val ⦏ℝ_cross_mult_less_thm⦎ = (
set_goal ([], ⌜
	(∀w z ⦁ ℕℝ 0 < w ∧ ℕℝ 0 < z ⇒
	(∀x y ⦁ x / w < y / z ⇔ x * z < w * y)
)⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(LEMMA_T ⌜w*z*(x / w) < w*z*(y / z)⌝ ante_tac THEN1
	REPEAT (bc_thm_tac ℝ_times_mono_thm THEN REPEAT strip_tac));
a(all_fc_tac[ℝ_less_¬_eq_0_thm]);
a(ALL_FC_T rewrite_tac[ℝ_over_times_recip_thm]);
a(rewrite_tac[∀_elim⌜x⌝ℝ_times_order_thm]);
a(rewrite_tac[∀_elim⌜z⌝ℝ_times_order_thm]);
a(all_fc_tac[ℝ_recip_clauses]);
a(asm_rewrite_tac[ℝ_times_clauses]);
a(rewrite_tac[∀_elim⌜y⌝ℝ_times_order_thm]);
a(rewrite_tac[∀_elim⌜w⌝ℝ_times_order_thm]);
a(asm_rewrite_tac[ℝ_times_clauses]);
(* *** Goal "2" *** *)
a(all_fc_tac[ℝ_less_¬_eq_0_thm]);
a(ALL_FC_T rewrite_tac[ℝ_over_times_recip_thm]);
a(all_fc_tac[ℝ_0_less_0_less_recip_thm]);
a(LEMMA_T ⌜w ⋏-⋏1 *z ⋏-⋏1 * (x * z) < w ⋏-⋏1 * z ⋏-⋏1 * (w * y)⌝ ante_tac THEN1
	REPEAT (bc_thm_tac ℝ_times_mono_thm THEN REPEAT strip_tac));
a(all_fc_tac[ℝ_recip_clauses]);
a(rewrite_tac[∀_elim⌜w ⋏-⋏1⌝ℝ_times_order_thm]);
a(rewrite_tac[∀_elim⌜x⌝ℝ_times_order_thm]);
a(asm_rewrite_tac[ℝ_times_assoc_thm, ℝ_times_clauses]);
a(rewrite_tac[∀_elim⌜z ⋏-⋏1⌝ℝ_times_order_thm]);
a(rewrite_tac[∀_elim⌜y⌝ℝ_times_order_thm]);
a(asm_rewrite_tac[ℝ_times_assoc_thm, ℝ_times_clauses]);
save_pop_thm "ℝ_cross_mult_less_thm"
);
=TEX
=SML
val ⦏ℝ_over_cancel_thm⦎ = (
set_goal ([], ⌜
	(∀w z ⦁ ¬w = ℕℝ 0 ∧ ¬z = ℕℝ 0 ⇒
	(∀x ⦁ (x * z) / (w * z) = x / w))
⌝);
a(REPEAT strip_tac);
a(lemma_tac ⌜¬ w * z = ℕℝ 0⌝ THEN1 asm_rewrite_tac[ℝ_times_eq_0_thm]);
a(ALL_FC_T rewrite_tac[ℝ_over_times_recip_thm, ℝ_recip_clauses]);
a(rewrite_tac[∀_elim⌜w ⋏-⋏1⌝ℝ_times_order_thm]);
a(rewrite_tac[∀_elim⌜x⌝ℝ_times_order_thm]);
a(ALL_FC_T rewrite_tac[ℝ_recip_clauses]);
a(rewrite_tac[ℝ_times_clauses]);
save_pop_thm "ℝ_over_cancel_eq_thm"
);
=TEX
\section{THEOREMS TO SUPPORT CALCULATIONS}
=SML
end (* of structure ℝ part 10 *);
structure ⦏ℝ⦎ : ℝ = struct
open ℝ;
=TEX
\subsection{Addition}
=SML
val ⦏ℝ_over_plus_over_thm⦎ = (
set_goal ([], ⌜∀x y u v ⦁
	¬u = ℕℝ 0 ∧ ¬v = ℕℝ 0 ⇒
	x/u + y/v = (x * v + y * u) / (u*v)
⌝);
a(REPEAT strip_tac);
a(lemma_tac⌜¬u*v = ℕℝ 0⌝ THEN1 asm_rewrite_tac[ℝ_times_eq_0_thm]);
a(ALL_FC_T rewrite_tac[ℝ_over_times_recip_thm, ℝ_recip_clauses]);
a(rewrite_tac[ℝ_times_plus_distrib_thm]);
a(rewrite_tac[∀_elim⌜u ⋏-⋏1⌝ℝ_times_order_thm]);
a(rewrite_tac[∀_elim⌜x⌝ℝ_times_order_thm]);
a(ALL_FC_T rewrite_tac[ℝ_recip_clauses]);
a(rewrite_tac[∀_elim⌜v ⋏-⋏1⌝ℝ_times_order_thm]);
a(rewrite_tac[∀_elim⌜y⌝ℝ_times_order_thm]);
a(ALL_FC_T rewrite_tac[ℝ_recip_clauses]);
a(rewrite_tac[ℝ_times_clauses]);
save_pop_thm "ℝ_over_plus_over_thm"
);
=TEX
=SML
val ⦏ℝ_0_over_thm⦎ = (
set_goal ([], ⌜
	∀z ⦁ ¬z = ℕℝ 0 ⇒ ℕℝ 0 / z = ℕℝ 0
⌝);
a(REPEAT strip_tac);
a(ALL_FC_T rewrite_tac[ℝ_over_times_recip_thm]);
a(rewrite_tac[ℝ_times_clauses]);
save_pop_thm "ℝ_0_over_thm"
);
=TEX
=SML
val ⦏ℝ_over_1_thm⦎ = (
set_goal ([], ⌜∀x ⦁ x / ℕℝ 1 = x⌝);
a(lemma_tac⌜¬ℕℝ 1 = ℕℝ 0⌝ THEN1 rewrite_tac[ℕℝ_one_one_thm]);
a(ALL_FC_T rewrite_tac[ℝ_over_times_recip_thm, ℝ_recip_clauses]);
a(rewrite_tac[ℝ_recip_clauses, ℝ_times_clauses]);
save_pop_thm "ℝ_over_1_thm"
);
=TEX
=SML
val ⦏ℝ_frac_def⦎ = get_spec⌜$/⋎N⌝;
=TEX
=SML
val ⦏ℕℝ_plus_homomorphism_thm1⦎ = save_thm("ℕℝ_plus_homomorphism_thm1",
	conv_rule (ONCE_MAP_C eq_sym_conv) ℕℝ_plus_homomorphism_thm);
val ⦏ℕℝ_times_homomorphism_thm1⦎ = save_thm("ℕℝ_times_homomorphism_thm1",
	conv_rule (ONCE_MAP_C eq_sym_conv) ℕℝ_times_homomorphism_thm);
=SML
val ⦏ℝ_frac_cross_mult_eq_thm⦎ = (
set_goal ([], ⌜
	∀m n i j ⦁ i / (m + 1) = j / (n + 1) ⇔ i*(n + 1) = j*(m + 1)
⌝);
a(REPEAT ∀_tac);
a(rewrite_tac[ℝ_frac_def]);
a(LEMMA_T ⌜¬m + 1 = 0 ⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⌜¬n + 1 = 0 ⌝ asm_tac THEN1 prove_tac[]);
a(lemma_tac ⌜¬ℕℝ(m + 1) = ℕℝ 0 ∧ ¬ℕℝ(n + 1) = ℕℝ 0 ⌝
	THEN1 asm_rewrite_tac[ℕℝ_one_one_thm]);
a(ALL_FC_T1 fc_⇔_canon rewrite_tac[ℝ_cross_mult_eq_thm]);
a(rewrite_tac[∀_elim⌜ℕℝ j⌝ ℝ_times_order_thm]);
a(rewrite_tac[ℕℝ_times_homomorphism_thm1, ℕℝ_one_one_thm]);
save_pop_thm "ℝ_frac_cross_mult_eq_thm"
);
=TEX
=SML
val ⦏ℝ_frac_cancel_thm⦎ = (
set_goal ([], ⌜
	∀i m n ⦁ (i * (n + 1)) / ((m + 1) * (n + 1)) = i / (m + 1)
⌝);
a(REPEAT strip_tac);
a(rewrite_tac[ℝ_frac_def]);
a(LEMMA_T ⌜¬m + 1 = 0 ⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⌜¬n + 1 = 0 ⌝ asm_tac THEN1 prove_tac[]);
a(lemma_tac ⌜¬ℕℝ(m + 1) = ℕℝ 0 ∧ ¬ℕℝ(n + 1) = ℕℝ 0 ⌝
	THEN1 asm_rewrite_tac[ℕℝ_one_one_thm]);
a(rewrite_tac[ℕℝ_times_homomorphism_thm]);
a(ALL_FC_T rewrite_tac[ℝ_over_cancel_thm]);
save_pop_thm "ℝ_frac_cancel_eq_thm"
);
=TEX
=SML
val ⦏ℝ_frac_0_thm⦎ = (
set_goal ([], ⌜∀m ⦁ 0 / (m + 1) = ℕℝ 0⌝);
a(REPEAT strip_tac);
a(rewrite_tac[ℝ_frac_def]);
a(LEMMA_T ⌜¬m + 1 = 0 ⌝ asm_tac THEN1 prove_tac[]);
a(lemma_tac ⌜¬ℕℝ(m + 1) = ℕℝ 0 ⌝
	THEN1 asm_rewrite_tac[ℕℝ_one_one_thm]);
a(ALL_FC_T rewrite_tac[ℝ_0_over_thm]);
save_pop_thm "ℝ_frac_0_thm"
);
=TEX
=SML
val ⦏ℝ_frac_ℕ_thm⦎ = (
set_goal ([], ⌜∀i ⦁ i / 1 = ℕℝ i⌝);
a(rewrite_tac[ℝ_frac_def, ℝ_over_1_thm]);
save_pop_thm "ℝ_frac_ℕ_thm"
);
=TEX
=SML
val ⦏ℝ_frac_plus_frac_thm⦎ = (
set_goal ([], ⌜
	∀i j k m n⦁
	i/(m+1) + j/(n+1) = (i*(n+1) + j*(m+1))/ ((m+1) * (n+1))
⌝);
a(REPEAT strip_tac);
a(rewrite_tac[ℝ_frac_def]);
a(LEMMA_T ⌜¬m + 1 = 0 ⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⌜¬n + 1 = 0 ⌝ asm_tac THEN1 prove_tac[]);
a(lemma_tac ⌜¬ℕℝ(m + 1) = ℕℝ 0 ∧ ¬ℕℝ(n + 1) = ℕℝ 0 ⌝
	THEN1 asm_rewrite_tac[ℕℝ_one_one_thm]);
a(ALL_FC_T rewrite_tac[ℝ_over_plus_over_thm]);
a(rewrite_tac[ℕℝ_times_homomorphism_thm1, ℕℝ_plus_homomorphism_thm1]);
save_pop_thm "ℝ_frac_plus_frac_thm"
);
=TEX
=SML
val ⦏ℝ_frac_minus_frac_lemma1⦎ = (
set_goal ([], ⌜
	∀m n⦁ m ≤ n ⇒ ℕℝ (n - m) = ℕℝ n - ℕℝ m
⌝);
a(rewrite_tac[≤_def] THEN REPEAT strip_tac THEN all_var_elim_asm_tac1);
a(once_rewrite_tac[plus_comm_thm] THEN rewrite_tac[minus_def,
	ℕℝ_plus_homomorphism_thm, ℝ_plus_assoc_thm,
	ℝ_subtract_def, ℝ_minus_clauses, ℝ_plus_clauses]);
pop_thm()
);
=TEX
=SML
val ⦏ℝ_frac_minus_frac_thm⦎ = (
set_goal ([], ⌜
	∀i j k m n⦁
	j*(m+1) ≤ i*(n+1) ⇒
	i/(m+1) + ~(j/(n+1)) = (i*(n+1) - j*(m+1))/ ((m+1) * (n+1))
⌝);
a(REPEAT strip_tac);
a(rewrite_tac[ℝ_frac_def]);
a(LEMMA_T ⌜¬m + 1 = 0 ⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⌜¬n + 1 = 0 ⌝ asm_tac THEN1 prove_tac[]);
a(lemma_tac ⌜¬ℕℝ(m + 1) = ℕℝ 0 ∧ ¬ℕℝ(n + 1) = ℕℝ 0 ⌝
	THEN1 asm_rewrite_tac[ℕℝ_one_one_thm]);
a(LEMMA_T ⌜~ (ℕℝ j / ℕℝ (n + 1)) = ~(ℕℝ j)/ ℕℝ(n + 1)⌝ rewrite_thm_tac THEN1
	(ALL_FC_T rewrite_tac[ℝ_over_times_recip_thm] THEN
	rewrite_tac[ℝ_times_minus_thm]));
a(ALL_FC_T rewrite_tac[ℝ_frac_minus_frac_lemma1]);
a(rewrite_tac[ℝ_subtract_def]);
a(ALL_FC_T rewrite_tac[ℝ_over_plus_over_thm]);
a(rewrite_tac[ℕℝ_times_homomorphism_thm, ℕℝ_plus_homomorphism_thm,
	ℝ_times_minus_thm]);
save_pop_thm "ℝ_frac_minus_frac_thm"
);
=TEX
=SML
val ⦏ℝ_frac_minus_frac_thm1⦎ = (
set_goal ([], ⌜
	∀i j m n⦁
	i*(n+1) ≤ j*(m+1) ⇒
	i/(m+1) + ~(j/(n+1)) = ~((j*(m+1) - i*(n+1))/ ((m+1) * (n+1)))
⌝);
a(REPEAT strip_tac);
a(LEMMA_T ⌜∀a b:ℝ⦁ a + ~b = ~(b + ~a)⌝ once_rewrite_thm_tac
	THEN1 rewrite_tac[ℝ_minus_clauses, ℝ_plus_clauses]);
a(ALL_FC_T rewrite_tac[ℝ_frac_minus_frac_thm]);
a(rewrite_tac[∀_elim⌜m+1⌝times_comm_thm]);
save_pop_thm "ℝ_frac_minus_frac_thm1"
);
=TEX
\subsection{Multiplication}
=SML
val ⦏ℝ_over_times_over_thm⦎ = (
set_goal ([], ⌜∀x y u v ⦁
	¬u = ℕℝ 0 ∧ ¬v = ℕℝ 0 ⇒
	(x/u) * (y/v) = (x * y)/(u * v)
⌝);
a(REPEAT strip_tac);
a(lemma_tac⌜¬u*v = ℕℝ 0⌝ THEN1 asm_rewrite_tac[ℝ_times_eq_0_thm]);
a(ALL_FC_T rewrite_tac[ℝ_over_times_recip_thm, ℝ_recip_clauses]);
a(rewrite_tac[∀_elim⌜y⌝ℝ_times_order_thm]);
a(rewrite_tac[ℝ_times_assoc_thm]);
save_pop_thm "ℝ_over_times_over_thm"
);
=TEX
=SML
val ⦏ℝ_frac_times_frac_thm⦎ = (
set_goal ([], ⌜∀i j m n ⦁
	(i/(m+1))*(j/(n+1)) = (i*j)/((m+1)*(n+1))
⌝);
a(REPEAT strip_tac THEN rewrite_tac[ℝ_frac_def]);
a(LEMMA_T ⌜¬m + 1 = 0 ⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⌜¬n + 1 = 0 ⌝ asm_tac THEN1 prove_tac[]);
a(lemma_tac ⌜¬ℕℝ(m + 1) = ℕℝ 0 ∧ ¬ℕℝ(n + 1) = ℕℝ 0 ⌝
	THEN1 asm_rewrite_tac[ℕℝ_one_one_thm]);
a(ALL_FC_T rewrite_tac[ℝ_over_times_over_thm]);
a(rewrite_tac[ℕℝ_times_homomorphism_thm1]);
save_pop_thm "ℝ_frac_times_frac_thm"
);
=TEX
\subsection{Reciprocals and Division}
=SML
val ⦏ℝ_over_recip_thm⦎ = (
set_goal ([], ⌜∀u v⦁
	¬u = ℕℝ 0 ∧ ¬v = ℕℝ 0 ⇒ (u/v) ⋏-⋏1 = v/u
⌝);
a(REPEAT strip_tac);
a(all_asm_fc_tac[ℝ_¬_recip_0_thm]);
a(ALL_FC_T rewrite_tac[ℝ_over_times_recip_thm, ℝ_recip_clauses]);
a(rewrite_tac[∀_elim⌜v⌝ℝ_times_order_thm]);
save_pop_thm "ℝ_over_recip_thm"
);
=TEX
=SML
val ⦏ℝ_frac_recip_thm⦎ = (
set_goal ([], ⌜∀m n⦁
	((m+1)/(n+1)) ⋏-⋏1 = (n+1)/(m+1)
⌝);
a(REPEAT strip_tac THEN rewrite_tac[ℝ_frac_def]);
a(LEMMA_T ⌜¬m + 1 = 0 ⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⌜¬n + 1 = 0 ⌝ asm_tac THEN1 prove_tac[]);
a(lemma_tac ⌜¬ℕℝ(m + 1) = ℕℝ 0 ∧ ¬ℕℝ(n + 1) = ℕℝ 0 ⌝
	THEN1 asm_rewrite_tac[ℕℝ_one_one_thm]);
a(ALL_FC_T rewrite_tac[ℝ_over_recip_thm]);
save_pop_thm "ℝ_frac_recip_thm"
);
=TEX
=SML
val ⦏ℝ_minus_recip_thm⦎ = (
set_goal ([], ⌜∀z⦁
	¬z = ℕℝ 0 ⇒ (~z) ⋏-⋏1 = ~(z ⋏-⋏1)
⌝);
a(REPEAT strip_tac);
a(TOP_ASM_T (strip_asm_tac o
	rewrite_rule[ℝ_plus_clauses, ℝ_minus_clauses] o
	once_rewrite_rule[ℝ_eq_thm] o
	conv_rule (RAND_C eq_sym_conv)));
a(conv_tac eq_sym_conv);
a(all_asm_fc_tac[ℝ_¬_recip_0_thm]);
a(ALL_FC_T1 fc_⇔_canon rewrite_tac[ℝ_eq_recip_thm]);
a(ALL_FC_T rewrite_tac[ℝ_recip_clauses]);
a(rewrite_tac[ℝ_times_minus_thm]);
a(ALL_FC_T rewrite_tac[ℝ_recip_clauses]);
save_pop_thm "ℝ_minus_recip_thm"
);
=TEX
=SML
val ⦏ℝ_over_eq_0_thm⦎ = (
set_goal ([], ⌜∀u v⦁
	¬u = ℕℝ 0 ∧ ¬v = ℕℝ 0 ⇒ ¬ u/v = ℕℝ 0
⌝);
a(REPEAT strip_tac);
a(all_asm_fc_tac[ℝ_¬_recip_0_thm]);
a(ALL_FC_T rewrite_tac[ℝ_over_times_recip_thm]);
a(asm_rewrite_tac[ℝ_times_eq_0_thm]);
save_pop_thm "ℝ_over_eq_0_thm"
);
=TEX
=SML
val ⦏ℝ_over_over_over_thm⦎ = (
set_goal ([], ⌜∀x y u v ⦁
	¬u = ℕℝ 0 ∧ ¬v = ℕℝ 0 ∧ ¬y = ℕℝ 0  ⇒
	(x/u) / (y/v) = (x * v)/(u * y)
⌝);
a(REPEAT strip_tac);
a(lemma_tac⌜¬y/v = ℕℝ 0⌝ THEN1 all_fc_tac[ℝ_over_eq_0_thm]);
a(ALL_FC_T once_rewrite_tac[ℝ_over_times_recip_thm]);
a(ALL_FC_T once_rewrite_tac[ℝ_over_recip_thm]);
a(bc_thm_tac ℝ_over_times_over_thm THEN REPEAT strip_tac);
save_pop_thm "ℝ_over_over_over_thm"
);
=TEX
\section{Less-than}
=TEX
=SML
val ⦏ℝ_frac_less_frac_thm⦎ = (
set_goal ([], ⌜
	∀i j m n⦁
	i/(m+1) < j/(n+1) ⇔ i*(n+1) < j*(m+1)
⌝);
a(REPEAT ∀_tac THEN rewrite_tac[ℝ_frac_def]);
a(LEMMA_T ⌜0 < m + 1 ⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⌜0 < n + 1⌝ asm_tac THEN1 prove_tac[]);
a(lemma_tac ⌜ℕℝ 0 < ℕℝ (m + 1) ∧ ℕℝ 0 < ℕℝ (n + 1)⌝
	THEN1 asm_rewrite_tac[ℕℝ_less_thm]);
a(strip_asm_tac(list_∀_elim[⌜ℕℝ(m+1)⌝, ⌜ℕℝ(n+1)⌝]ℝ_cross_mult_less_thm));
a(asm_rewrite_tac[ℕℝ_times_homomorphism_thm, ℕℝ_plus_homomorphism_thm]);
a(rewrite_tac[∀_elim⌜ℕℝ j⌝ ℝ_times_order_thm]);
a(asm_rewrite_tac[ℕℝ_times_homomorphism_thm1, ℕℝ_plus_homomorphism_thm1,
	ℕℝ_less_thm]);
save_pop_thm "ℝ_frac_less_frac_thm"
);
=TEX
=SML
val ⦏ℝ_minus_frac_less_frac_thm⦎ = (
set_goal ([], ⌜
	∀i j m n⦁
	~(i/(m+1)) < j/(n+1) ⇔ 0 < i + j
⌝);
a(REPEAT_UNTIL is_⇒ strip_tac);
(* *** Goal "1" *** *)
a(once_rewrite_tac[ℝ_less_0_less_thm]);
a(rewrite_tac[ℝ_minus_clauses, ℝ_frac_plus_frac_thm]);
a(contr_tac THEN lemma_tac⌜i = 0 ∧ j = 0⌝ THEN1
	PC_T1 "lin_arith" asm_prove_tac[]);
a(all_var_elim_asm_tac1);
a(POP_ASM_T ante_tac THEN rewrite_tac [times_plus_distrib_thm]);
a(rewrite_tac[plus_assoc_thm1, ℝ_frac_0_thm, ℝ_less_irrefl_thm]);
(* *** Goal "2" *** *)
a(once_rewrite_tac[ℝ_less_0_less_thm]);
a(rewrite_tac[ℝ_minus_clauses, ℝ_frac_plus_frac_thm, times_plus_distrib_thm]);
a(rewrite_tac[plus_assoc_thm1]);
a(pure_rewrite_tac[eq_sym_rule(∀_elim⌜0⌝ℝ_frac_0_thm),
	ℝ_frac_less_frac_thm]);
a(PC_T1 "lin_arith" prove_tac[]);
save_pop_thm "ℝ_minus_frac_less_frac_thm"
);
=TEX
=SML
val ⦏ℝ_frac_less_minus_frac_thm⦎ = (
set_goal ([], ⌜
	∀i j m n⦁
	¬i/(m+1) < ~(j/(n+1))
⌝);
a(REPEAT strip_tac);
a(pure_once_rewrite_tac[ℝ_less_less_0_thm]);
a(rewrite_tac[ℝ_minus_clauses, ℝ_frac_plus_frac_thm, times_plus_distrib_thm]);
a(rewrite_tac[plus_assoc_thm1]);
a(pure_rewrite_tac[eq_sym_rule(∀_elim⌜0⌝ℝ_frac_0_thm),
	ℝ_frac_less_frac_thm]);
a(rewrite_tac[]);
save_pop_thm "ℝ_frac_less_minus_frac_thm"
);
=TEX
\subsection{Absolute Value}
=TEX
=SML
val ⦏ℝ_abs_def⦎ = get_spec⌜Abs⋎R⌝;
=SML
val ⦏ℝ_0_≤_frac_thm⦎ = (
set_goal ([], ⌜∀i m⦁ ℕℝ 0 ≤ i/(m+1)⌝);
a(contr_tac THEN POP_ASM_T ante_tac);
a(pure_rewrite_tac[ℝ_¬_≤_less_thm, eq_sym_rule(∀_elim⌜0⌝ℝ_frac_0_thm),
	ℝ_frac_less_frac_thm]);
a(PC_T1 "lin_arith" prove_tac[]);
save_pop_thm"ℝ_0_≤_frac_thm"
);
=TEX
=SML
val ⦏ℝ_abs_frac_thm⦎ = (
set_goal ([], ⌜∀i m⦁ Abs(i/(m+1)) = i/(m+1)⌝);
a(REPEAT strip_tac THEN rewrite_tac[get_spec⌜Abs⋎R⌝, ℝ_0_≤_frac_thm]);
save_pop_thm"ℝ_abs_frac_thm"
);
=TEX
=SML
val ⦏ℝ_abs_minus_thm⦎ = (
set_goal([], ⌜∀ x : ℝ ⦁ Abs (~x) = Abs x⌝);
a(REPEAT strip_tac THEN rewrite_tac[get_spec⌜Abs⋎R⌝]);
a(strip_asm_tac (list_∀_elim [⌜ℕℝ 0⌝, ⌜x⌝] ℝ_less_cases_thm));
(* *** Goal "1" *** *)
a(LEMMA_T ⌜ℕℝ 0 ≤ x⌝ rewrite_thm_tac THEN1 asm_rewrite_tac[ℝ_≤_def]);
a(once_rewrite_tac[ℝ_≤_≤_0_thm] THEN
	rewrite_tac[ℝ_plus_clauses, ℝ_minus_clauses]);
a(LEMMA_T ⌜¬x ≤ ℕℝ 0⌝ rewrite_thm_tac);
a(contr_tac THEN all_fc_tac[ℝ_≤_less_trans_thm]);
a(all_fc_tac[ℝ_less_irrefl_thm]);
(* *** Goal "2" *** *)
a(all_var_elim_asm_tac1 THEN rewrite_tac[ℝ_minus_clauses, ℝ_≤_clauses]);
(* *** Goal "3" *** *)
a(once_rewrite_tac[ℝ_≤_≤_0_thm] THEN
	rewrite_tac[ℝ_plus_clauses, ℝ_minus_clauses]);
a(LEMMA_T ⌜x ≤ ℕℝ 0⌝ rewrite_thm_tac THEN1 asm_rewrite_tac[ℝ_≤_def]);
a(LEMMA_T ⌜¬ ~x ≤ ℕℝ 0⌝ rewrite_thm_tac);
a(once_rewrite_tac[ℝ_≤_0_≤_thm] THEN
	rewrite_tac[ℝ_plus_clauses, ℝ_minus_clauses]);
a(contr_tac THEN all_fc_tac[ℝ_≤_less_trans_thm]);
a(all_fc_tac[ℝ_less_irrefl_thm]);
save_pop_thm "ℝ_abs_minus_thm"
);
=TEX
\subsection{Maxima and Minima}
=TEX
=SML
val _ = (
push_consistency_goal ⌜Max⋎R⌝;
a(lemma_tac⌜∃max⦁
		max [] = 0.0
	∧	∀x L⦁max (Cons x L) =
		if	L  = []
		then	x
		else if	x < max L
		then	max L
		else	x⌝
	THEN1 prove_∃_tac);
a(∃_tac⌜max⌝ THEN asm_rewrite_tac[]);
save_consistency_thm ⌜Max⋎R⌝ (pop_thm())
);
=TEX
=SML
val ⦏ℝ_max_def⦎ = get_spec⌜Max⋎R⌝;
=TEX
=SML
val _ = (
push_consistency_goal ⌜Min⋎R⌝;
a(lemma_tac⌜∃min⦁
		min [] = 0.0
	∧	∀x L⦁min (Cons x L) =
		if	L  = []
		then	x
		else if	x > min L
		then	min L
		else	x⌝
	THEN1 prove_∃_tac);
a(∃_tac⌜min⌝ THEN asm_rewrite_tac[]);
save_consistency_thm ⌜Min⋎R⌝ (pop_thm())
);
=TEX
=SML
val ⦏ℝ_min_def⦎ = get_spec⌜Min⋎R⌝;
=TEX
=SML
val ⦏ℝ_max_cons_thm⦎ = (
set_goal([], ⌜ ∀x L⦁
	Max⋎R (Cons x L) =
	if	L = []
	then	x
	else if	x < Max⋎R L
	then	Max⋎R L
	else	x
⌝);
a(REPEAT strip_tac);
a(strip_asm_tac(∀_elim⌜L⌝ list_cases_thm) THEN all_var_elim_asm_tac1
	THEN rewrite_tac[ℝ_max_def]);
save_pop_thm "ℝ_max_cons_thm");
(*
=TEX
=SML
*)
val ⦏ℝ_less_lemma1⦎ = (
set_goal([], ⌜ ∀x y:ℝ⦁ x < y ⇒ ¬y < x⌝);
a(asm_tac ℝ_less_trans_thm THEN asm_tac ℝ_less_irrefl_thm
	THEN asm_prove_tac[]);
pop_thm());
(*
=TEX
=SML
*)
val ⦏ℝ_less_lemma2⦎ = (
set_goal([], ⌜ ∀a b c:ℝ⦁ a < b ∧ ¬c < b ⇒ a < c⌝);
a(rewrite_tac[ℝ_¬_less_≤_thm, ℝ_≤_def]);
a(REPEAT strip_tac THEN_TRY all_var_elim_asm_tac);
a(all_fc_tac[ℝ_less_trans_thm]);
pop_thm());
(*
=TEX
=SML
*)
val ⦏ℝ_max_swap_thm⦎ = (
set_goal([], ⌜ ∀x y L⦁
	Max⋎R (Cons x (Cons y L)) = Max⋎R (Cons y (Cons x L))
⌝);
a(REPEAT strip_tac THEN rewrite_tac[ℝ_max_cons_thm]);
a(cases_tac⌜L = []⌝ THEN asm_rewrite_tac[]);
(* *** Goal "1" *** *)
a(strip_asm_tac(list_∀_elim[⌜x⌝, ⌜y⌝] ℝ_less_cases_thm) THEN asm_rewrite_tac[]
	THEN_TRY ALL_FC_T rewrite_tac[ℝ_less_lemma1]);
(* *** Goal "2" *** *)
a(cases_tac⌜x < Max⋎R L⌝ THEN cases_tac⌜y < Max⋎R L⌝ THEN asm_rewrite_tac[]);
(* *** Goal "2.1" *** *)
a(ALL_FC_T rewrite_tac[ℝ_less_lemma2]);
(* *** Goal "2.2" *** *)
a(ALL_FC_T rewrite_tac[ℝ_less_lemma2]);
(* *** Goal "2.3" *** *)
a(strip_asm_tac(list_∀_elim[⌜x⌝, ⌜y⌝] ℝ_less_cases_thm) THEN asm_rewrite_tac[]
	THEN_TRY ALL_FC_T rewrite_tac[ℝ_less_lemma1]);
pop_thm ());
(*
=TEX
=SML
*)
val ⦏ℝ_max_conv_thm⦎ = (
set_goal([], ⌜ ∀x y L⦁
	Max⋎R (Cons x (Cons y L)) =
	if x < y then Max⋎R (Cons y L) else Max⋎R(Cons x L)
⌝);
a(REPEAT strip_tac);
a(cases_tac⌜x < y⌝ THEN asm_rewrite_tac[]);
(* *** Goal "1" *** *)
a(conv_tac(LEFT_C (once_rewrite_conv[ℝ_max_def])));
a(LEMMA_T⌜x < Max⋎R (Cons y L)⌝ rewrite_thm_tac);
a(rewrite_tac[ℝ_max_cons_thm]);
a(cases_tac⌜L = []⌝ THEN asm_rewrite_tac[]);
a(cases_tac⌜y < Max⋎R L⌝ THEN asm_rewrite_tac[]);
a(all_fc_tac[ℝ_less_trans_thm]);
(* *** Goal "2" *** *)
a(once_rewrite_tac[ℝ_max_swap_thm]);
a(conv_tac(LEFT_C (once_rewrite_conv[ℝ_max_def])));
a(cases_tac⌜y = Max⋎R (Cons x L)⌝ THEN1 asm_rewrite_tac[ℝ_less_irrefl_thm]);
a(LEMMA_T⌜y < Max⋎R (Cons x L)⌝ rewrite_thm_tac);
a(strip_asm_tac(list_∀_elim[⌜y⌝, ⌜Max⋎R (Cons x L)⌝] ℝ_less_cases_thm));
a(swap_nth_asm_concl_tac 1 THEN rewrite_tac[ℝ_max_cons_thm]);
a(cases_tac⌜L = []⌝ THEN asm_rewrite_tac[]);
a(cases_tac⌜x < Max⋎R L⌝ THEN asm_rewrite_tac[]);
a(contr_tac THEN all_fc_tac[ℝ_less_trans_thm]);
save_pop_thm "ℝ_max_conv_thm");
(*
=TEX
=SML
*)
val ⦏ℝ_min_cons_thm⦎ = (
set_goal([], ⌜ ∀x L⦁
	Min⋎R (Cons x L) =
	if	L = []
	then	x
	else if	Min⋎R L < x
	then	Min⋎R L
	else	x
⌝);
a(REPEAT strip_tac);
a(strip_asm_tac(∀_elim⌜L⌝ list_cases_thm) THEN all_var_elim_asm_tac1
	THEN rewrite_tac[ℝ_min_def, ℝ_greater_def]);
save_pop_thm "ℝ_min_cons_thm");
(*
=TEX
=SML
*)
val ⦏ℝ_less_lemma3⦎ = (
set_goal([], ⌜ ∀a b c:ℝ⦁ ¬a < b ∧ a < c ⇒ b < c⌝);
a(rewrite_tac[ℝ_¬_less_≤_thm, ℝ_≤_def]);
a(REPEAT strip_tac THEN_TRY all_var_elim_asm_tac);
a(all_fc_tac[ℝ_less_trans_thm]);
pop_thm());
(*
=TEX
=SML
*)
val ⦏ℝ_min_swap_thm⦎ = (
set_goal([], ⌜ ∀x y L⦁
	Min⋎R (Cons x (Cons y L)) = Min⋎R (Cons y (Cons x L))
⌝);
a(REPEAT strip_tac THEN rewrite_tac[ℝ_min_cons_thm]);
a(cases_tac⌜L = []⌝ THEN asm_rewrite_tac[]);
(* *** Goal "1" *** *)
a(strip_asm_tac(list_∀_elim[⌜x⌝, ⌜y⌝] ℝ_less_cases_thm) THEN asm_rewrite_tac[]
	THEN_TRY ALL_FC_T rewrite_tac[ℝ_less_lemma1]);
(* *** Goal "2" *** *)
a(cases_tac⌜Min⋎R L < x⌝ THEN cases_tac⌜Min⋎R L < y⌝ THEN asm_rewrite_tac[]);
(* *** Goal "2.1" *** *)
a(ALL_FC_T rewrite_tac[ℝ_less_lemma3]);
(* *** Goal "2.2" *** *)
a(ALL_FC_T rewrite_tac[ℝ_less_lemma3]);
(* *** Goal "2.3" *** *)
a(strip_asm_tac(list_∀_elim[⌜x⌝, ⌜y⌝] ℝ_less_cases_thm) THEN asm_rewrite_tac[]
	THEN_TRY ALL_FC_T rewrite_tac[ℝ_less_lemma1]);
pop_thm());
(*
=TEX
=SML
*)
val ⦏ℝ_min_conv_thm⦎ = (
set_goal([], ⌜ ∀x y L⦁
	Min⋎R (Cons x (Cons y L)) =
	if x < y then Min⋎R (Cons x L) else Min⋎R(Cons y L)
⌝);
a(REPEAT strip_tac);
a(cases_tac⌜x < y⌝ THEN asm_rewrite_tac[]);
(* *** Goal "1" *** *)
a(once_rewrite_tac[ℝ_min_swap_thm]);
a(conv_tac(LEFT_C (once_rewrite_conv[ℝ_min_def])));
a(rewrite_tac[ℝ_greater_def]);
a(cases_tac⌜Min⋎R (Cons x L) = y⌝ THEN1 asm_rewrite_tac[ℝ_less_irrefl_thm]);
a(LEMMA_T⌜Min⋎R (Cons x L) < y⌝ rewrite_thm_tac);
a(strip_asm_tac(list_∀_elim[⌜Min⋎R (Cons x L)⌝, ⌜y⌝] ℝ_less_cases_thm));
a(swap_nth_asm_concl_tac 1 THEN rewrite_tac[ℝ_min_cons_thm]);
a(all_fc_tac[ℝ_less_lemma1]);
a(cases_tac⌜L = []⌝ THEN asm_rewrite_tac[]);
a(cases_tac⌜Min⋎R L < x⌝ THEN asm_rewrite_tac[]);
a(contr_tac THEN all_fc_tac[ℝ_less_trans_thm]);
(* *** Goal "2" *** *)
a(conv_tac(LEFT_C (once_rewrite_conv[ℝ_min_def])));
a(rewrite_tac[ℝ_greater_def]);
a(cases_tac⌜Min⋎R(Cons y L) < x⌝ THEN asm_rewrite_tac[]);
a(POP_ASM_T (ante_tac o rewrite_rule[ℝ_¬_less_≤_thm, ℝ_≤_def])
	THEN REPEAT strip_tac);
a(swap_nth_asm_concl_tac 1 THEN rewrite_tac[ℝ_min_cons_thm]);
a(cases_tac⌜L = []⌝ THEN asm_rewrite_tac[]);
a(cases_tac⌜Min⋎R L < y⌝ THEN asm_rewrite_tac[]);
a(contr_tac THEN all_fc_tac[ℝ_less_trans_thm]);
save_pop_thm "ℝ_min_conv_thm");
(*
=TEX
=SML
*)
=TEX
\section{COMPUTATIONAL CONVERSIONS}\label{COMP}
=TEX
\subsection{Normalisation and Denormalisation}
We denormalise terms of the form
=INLINEFT
ℕℝ i
=TEX
\ or
=INLINEFT
i/m
=TEX
, where $i$, and $m$ are natural number literals and $m$ is non-zero,
into the form
=INLINEFT
j/(n+1)
=TEX
, where $j$ and $n$ are natural number literals.
Denormalisation lets the theorems on fractions  ``bite''.

Normalisation is the reverse process and gives either
=INLINEFT
ℕℝ i
=TEX
\ or
=INLINEFT
i/m
=TEX
, where $i$ and $m$ are natural number literals, $m > 1$.

We need a metalanguage function to compute greatest common divisors:

=SML
fun ⦏gcd⦎ (m : INTEGER) (n : INTEGER) = (
	if	m @<= zero
	then	n
	else if	m @< n
	then	gcd (n imod m) m
	else if	m = n
	then	m
	else	gcd (m imod n) n
);
=TEX
Now we can define the normalising conversion:
=SML
val ⦏one_tm⦎ = ⌜1⌝;

val ⦏ℝ_frac_norm_conv⦎ : CONV = (
	simple_eq_match_conv ℝ_frac_0_thm
ORELSE_C
	simple_eq_match_conv ℝ_frac_ℕ_thm
ORELSE_C
	(fn tm =>
	let	val (a_tm, b_tm) = dest_ℝ_frac tm
			handle Fail _ =>
			term_fail "ℝ_frac_norm_conv" 116301 [tm];
		val (a, b) = (dest_ℕ a_tm, dest_ℕ b_tm)
			handle Fail _ =>
			term_fail "ℝ_frac_norm_conv" 116301 [tm];
	in	if	b = zero
		then	term_fail "ℝ_frac_norm_conv" 116302 [tm]
		else
		let	val np1 = gcd a b;
		in
		if	np1 = one
		then	term_fail "ℝ_frac_norm_conv" 116303 [tm]
		else	
		let	val i_tm = mk_ℕ(a idiv np1);
			val m_tm = mk_ℕ((b idiv np1) @- one);
			val mp1_tm = mk_plus(m_tm, one_tm);
			val n_tm = mk_ℕ (np1 @- one);
			val np1_tm = mk_plus(n_tm, one_tm);
			val inp1_tm = mk_times(i_tm, np1_tm);
			val mnp1_tm = mk_times(mp1_tm, np1_tm);
			val frac = mk_ℝ_frac(inp1_tm, mnp1_tm);
			val conv1 = RIGHT_C plus_conv THEN_C times_conv;
			val conv2 = RANDS_C plus_conv THEN_C times_conv;
			val thm1 = eq_sym_rule
				((LEFT_C conv1 THEN_C RIGHT_C conv2)frac);
			val conv2 = simple_eq_match_conv ℝ_frac_cancel_thm
				THEN_C
				RIGHT_C plus_conv
				THEN_C
				TRY_C (simple_eq_match_conv ℝ_frac_ℕ_thm);
			val thm2 = conv2 frac;
		in	eq_trans_rule thm1 thm2
		end
		end
	end)
);
=TEX
\ldots and the denormalising conversion:
=SML
val ⦏ℝ_frac_denorm_0_thm⦎ = conv_rule(ONCE_MAP_C eq_sym_conv)
	(conv_rule (ONCE_MAP_C plus_conv) (∀_elim⌜0⌝ℝ_frac_0_thm));
val ⦏ℝ_frac_denorm_ℕ_thm⦎ = conv_rule(ONCE_MAP_C eq_sym_conv) ℝ_frac_ℕ_thm;
val ⦏ℝ_frac_denorm_conv⦎ : CONV =
	TRY_C (simple_eq_match_conv ℝ_frac_denorm_0_thm ORELSE_C
		simple_eq_match_conv ℝ_frac_denorm_ℕ_thm)
THEN_C	(fn tm =>
	let	val (a_tm, b_tm) = dest_ℝ_frac tm
		handle Fail _ =>
		term_fail "ℝ_frac_denorm_conv" 116301 [tm];
		val b = dest_ℕ b_tm
			handle Fail _ =>
			term_fail "ℝ_frac_norm_conv" 116301 [tm];
	in	if	b = zero
		then	term_fail "ℝ_frac_norm_conv" 116302 [tm]
		else	let	val bl1_tm = mk_ℕ (b @- one);
				val bl1p1_tm = mk_plus(bl1_tm, one_tm);
				val res_tm = mk_ℝ_frac(a_tm, bl1p1_tm);
			in	eq_sym_rule (RIGHT_C plus_conv(res_tm))
			end
	end	
);
=TEX
\subsection{Addition}
=SML
val ⦏ℝ_frac_plus_frac_conv⦎ : CONV = (fn tm =>
	(simple_eq_match_conv ℝ_frac_plus_frac_thm THEN_C
	RIGHT_C (RANDS_C plus_conv THEN_C times_conv) THEN_C
	LEFT_C (RANDS_C (RIGHT_C plus_conv THEN_C times_conv)
		THEN_C plus_conv)
	THEN_TRY_C ℝ_frac_norm_conv) tm
	handle Fail _ => term_fail "ℝ_frac_plus_frac_conv" 116304 [tm]
);
=TEX
=SML
val ⦏ℝ_frac_minus_frac_lemma2⦎ = (
set_goal ([], ⌜
	∀i j k m n⦁
	(j*(m+1) ≤ i*(n+1) ⇔ F) ⇒
	i/(m+1) + ~(j/(n+1)) = ~((j*(m+1) - i*(n+1))/ ((m+1) * (n+1)))
⌝);
a(REPEAT strip_tac);
a(lemma_tac⌜i*(n+1) ≤ j*(m+1)⌝ THEN1 PC_T1 "lin_arith" asm_prove_tac[]);
a(ALL_FC_T rewrite_tac[ℝ_frac_minus_frac_thm1]);
pop_thm()
);

=SML
val ⦏ℝ_frac_minus_frac_conv⦎ : CONV = (fn tm =>
	let	val (l_tm, r_tm) = dest_ℝ_plus tm;
		val rop_tm = dest_ℝ_minus r_tm;
		val (i_tm, mp1_tm) = dest_ℝ_frac l_tm;
		val (j_tm, np1_tm) = dest_ℝ_frac rop_tm;
		val inp1_tm = mk_times(i_tm, np1_tm);
		val jmp1_tm = mk_times(j_tm, mp1_tm);
		val test_tm = mk_≤(jmp1_tm, inp1_tm);
		val conv1 = RIGHT_C plus_conv THEN_C times_conv;
		val conv2 = RANDS_C conv1 THEN_C ≤_conv;
		val thm1 = conv2 test_tm;
		val numer_conv = RANDS_C conv1 THEN_C minus_conv;
		val denom_conv = RANDS_C plus_conv THEN_C times_conv;
		val frac_conv = LEFT_C numer_conv THEN_C RIGHT_C denom_conv
			THEN_C TRY_C ℝ_frac_norm_conv;
	in	((fn tm =>
		simple_⇒_match_mp_rule ℝ_frac_minus_frac_thm (⇔_t_elim thm1))
		THEN_C frac_conv) tm
		handle Fail _ =>
		((fn tm =>
		simple_⇒_match_mp_rule ℝ_frac_minus_frac_lemma2 thm1)
		THEN_C RAND_C frac_conv) tm
	end
);
=SML
=TEX
=SML
val ⦏ℝ_plus_conv_lemma1⦎ = (
set_goal ([], ⌜
	∀x y:ℝ⦁ ~x + ~y = ~(x + y)
⌝);
a(rewrite_tac[ℝ_minus_clauses]);
pop_thm()
);
val ⦏ℝ_plus_conv_lemma2⦎ = (
set_goal ([], ⌜
	∀x y:ℝ⦁ ~x + y = y + ~x
⌝);
a(rewrite_tac[ℝ_plus_clauses]);
pop_thm()
);
val ⦏ℝ_plus_conv_lemma3⦎ = (
set_goal ([], ⌜~(ℕℝ 0) = ℕℝ 0⌝);
a(rewrite_tac[ℝ_minus_clauses]);
pop_thm()
);

=TEX
Now these pieces may be fitted together to give the conversion
for real plus:
=SML
val ⦏ℝ_plus_conv⦎ : CONV = (fn tm =>
	(RANDS_C (ℝ_frac_denorm_conv ORELSE_C RAND_C ℝ_frac_denorm_conv)
	 THEN_C FIRST_C [
		ℝ_frac_plus_frac_conv,
		simple_eq_match_conv ℝ_plus_conv_lemma2 THEN_C
			ℝ_frac_minus_frac_conv,
		ℝ_frac_minus_frac_conv,
		simple_eq_match_conv ℝ_plus_conv_lemma1 THEN_C
			 RAND_C ℝ_frac_plus_frac_conv THEN_C
			TRY_C (simple_eq_match_conv ℝ_plus_conv_lemma3)
 	]) tm
	handle ex => term_fail "ℝ_plus_conv" 116305 [tm]
);
=TEX
\subsection{Multiplication}
=SML
val ⦏ℝ_frac_times_frac_conv⦎ : CONV = (fn tm =>
	(simple_eq_match_conv ℝ_frac_times_frac_thm THEN_C
	RIGHT_C (RANDS_C plus_conv THEN_C times_conv) THEN_C
	LEFT_C times_conv
	THEN_TRY_C ℝ_frac_norm_conv) tm
	handle Fail _ => term_fail "ℝ_frac_times_frac_conv" 116306 [tm]
);
=TEX
=TEX
=SML
val ⦏ℝ_times_conv_lemma1⦎ = (
set_goal ([], ⌜∀x y:ℝ⦁ ~x * ~y = x * y⌝);
a(rewrite_tac[ℝ_times_minus_thm]);
pop_thm()
);
val ⦏ℝ_times_conv_lemma2⦎ = (
set_goal ([], ⌜
	∀x y:ℝ⦁ ~x * y = ~(x * y)
⌝);
a(rewrite_tac[ℝ_times_minus_thm]);
pop_thm()
);
val ⦏ℝ_times_conv_lemma3⦎ = (
set_goal ([], ⌜
	∀x y:ℝ⦁ x * ~y = ~(x * y)
⌝);
a(rewrite_tac[ℝ_times_minus_thm]);
pop_thm()
);
=TEX
=SML
val ⦏ℝ_times_conv⦎ : CONV = (fn tm =>
	(RANDS_C (ℝ_frac_denorm_conv ORELSE_C RAND_C ℝ_frac_denorm_conv)
	 THEN_C FIRST_C [
		ℝ_frac_times_frac_conv,
		simple_eq_match_conv ℝ_times_conv_lemma1 THEN_C
			ℝ_frac_times_frac_conv,
		simple_eq_match_conv ℝ_times_conv_lemma2 THEN_C
			RAND_C ℝ_frac_times_frac_conv THEN_C
			TRY_C (simple_eq_match_conv ℝ_plus_conv_lemma3),
		simple_eq_match_conv ℝ_times_conv_lemma3 THEN_C
			RAND_C ℝ_frac_times_frac_conv THEN_C
			TRY_C (simple_eq_match_conv ℝ_plus_conv_lemma3)
	]) tm
	handle ex => term_fail "ℝ_times_conv" 116306 [tm]
);
=TEX
=TEX
\subsection{Reciprocals}
=SML
val ⦏ℝ_frac_recip_conv⦎ : CONV = (fn tm =>
	let	val (a_tm, b_tm) = dest_ℝ_frac (dest_ℝ_recip tm)
		handle Fail _ =>
		term_fail "ℝ_frac_recip_conv" 116301 [tm];
		val a = dest_ℕ a_tm
			handle Fail _ =>
			term_fail "ℝ_frac_recip_conv" 116308 [tm];
	in	if	a = zero
		then	term_fail "ℝ_frac_recip_conv" 116307 [tm]
		else	let	val al1_tm = mk_ℕ (a @- one);
				val al1p1_tm = mk_plus(al1_tm, one_tm);
				val mid_tm = mk_ℝ_recip(
						mk_ℝ_frac(al1p1_tm, b_tm));
				val thm1 = eq_sym_rule(
					RAND_C(LEFT_C plus_conv) mid_tm);
				val thm2 = conv_rule
					(RIGHT_C(RANDS_C plus_conv))
						(simple_eq_match_conv
						 ℝ_frac_recip_thm mid_tm);
			in	eq_trans_rule thm1 thm2
			end
	end	
);
=TEX
=SML
val ⦏ℝ_recip_conv_thm⦎ = (
set_goal ([], ⌜∀m n⦁
	~(((m+1)/(n+1))) ⋏-⋏1 = ~(((m+1)/(n+1))⋏-⋏1)
⌝);
a(REPEAT strip_tac THEN rewrite_tac[get_spec⌜$/⋎N⌝]);
a(LEMMA_T ⌜¬m + 1 = 0 ⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⌜¬n + 1 = 0 ⌝ asm_tac THEN1 prove_tac[]);
a(lemma_tac ⌜¬ℕℝ(m + 1) = ℕℝ 0 ∧ ¬ℕℝ(n + 1) = ℕℝ 0 ⌝
	THEN1 asm_rewrite_tac[ℕℝ_one_one_thm]);
a(all_fc_tac[ℝ_over_eq_0_thm]);
a(ALL_FC_T rewrite_tac[ℝ_minus_recip_thm]);
pop_thm ()
);
=TEX
The following writes $a/b$ as $(m+1)/(n+1)$ if possible:
=SML
val ⦏ℝ_non_0_denorm_conv⦎ : CONV = (
	let	val numer_conv = (fn tm =>
			let	val im1_tm = mk_ℕ(dest_ℕ tm @- one);
			in	eq_sym_rule(plus_conv(mk_plus(im1_tm, one_tm)))
			end
		);
	in	ℝ_frac_denorm_conv THEN_C LEFT_C numer_conv
	end
);
=TEX
=SML
val ⦏ℝ_recip_conv⦎ : CONV = (fn tm =>
	((		RAND_C ℝ_frac_denorm_conv
	 THEN_C		ℝ_frac_recip_conv
	 THEN_TRY_C	ℝ_frac_norm_conv)
ORELSE_C
	(RAND_C		(RAND_C ℝ_non_0_denorm_conv)
	 THEN_C		simple_eq_match_conv ℝ_recip_conv_thm
	 THEN_C		RAND_C (RAND_C (LEFT_C plus_conv)
				THEN_C ℝ_frac_recip_conv)
	 THEN_TRY_C	RAND_C ℝ_frac_norm_conv
	)) tm
	handle Fail _ => term_fail "ℝ_recip_conv" 116308 [tm]
);
=TEX
\subsection{Ordering Relations}
=SML
=TEX
=SML
val ⦏ℝ_less_conv_lemma1⦎ = (
set_goal ([], ⌜
	∀x y:ℝ⦁ ~x < ~y ⇔ y < x
⌝);
a(REPEAT ∀_tac);
a(once_rewrite_tac[ℝ_less_0_less_thm]);
a(rewrite_tac[ℝ_plus_clauses, ℝ_minus_clauses, ∀_elim⌜x⌝ℝ_plus_order_thm]);
pop_thm()
);
=TEX
=SML
val ⦏ℝ_less_conv_lemma2⦎ = (
set_goal ([], ⌜
	∀ i j m n⦁ i / (m + 1) < ~ (j / (n + 1)) ⇔ F
⌝);
a(rewrite_tac[ℝ_frac_less_minus_frac_thm]);
pop_thm()
);
=TEX
=SML
val ⦏ℝ_frac_less_frac_conv⦎ : CONV = (fn tm =>
	(simple_eq_match_conv ℝ_frac_less_frac_thm THEN_C
	 RANDS_C (RIGHT_C plus_conv THEN_C times_conv) THEN_C
	 less_conv
	) tm
	handle ex => term_fail "ℝ_frac_less_conv" 116309 [tm]
);
=TEX
=SML
val ⦏ℝ_less_conv⦎ : CONV = (fn tm =>
	(RANDS_C (ℝ_frac_denorm_conv ORELSE_C RAND_C ℝ_frac_denorm_conv)
	 THEN_C FIRST_C [
		ℝ_frac_less_frac_conv,
		simple_eq_match_conv ℝ_less_conv_lemma1 THEN_C
			ℝ_frac_less_frac_conv,
		simple_eq_match_conv ℝ_minus_frac_less_frac_thm THEN_C
		RIGHT_C plus_conv THEN_C less_conv,
		simple_eq_match_conv ℝ_less_conv_lemma2
	]) tm
	handle ex => term_fail "ℝ_less_conv" 116309 [tm]
);
=TEX
=SML
val ⦏ℝ_≤_conv_lemma⦎ = (
set_goal([], ⌜∀x y:ℝ⦁x ≤ y ⇔ ¬y < x⌝);
a(rewrite_tac[ℝ_¬_less_≤_thm]);
pop_thm()
);
=TEX
=SML
val ⦏ℝ_≤_conv⦎ : CONV = (fn tm =>
	(simple_eq_match_conv ℝ_≤_conv_lemma THEN_C
	 RAND_C ℝ_less_conv THEN_C
	 (simple_eq_match_conv ¬_t_thm ORELSE_C simple_eq_match_conv ¬_f_thm)
	) tm
	handle ex => term_fail "ℝ_≤_conv" 116310 [tm]
);
=TEX
=SML
val ⦏ℝ_eq_conv_lemma1⦎ = ℝ_minus_eq_thm;
=TEX
=SML
val ⦏ℝ_eq_conv_lemma2⦎ = (
set_goal ([], ⌜
	∀ i j m n⦁ i / (m + 1) = ~(j / (n + 1)) ⇔ 0 = i + j
⌝);
a(REPEAT ∀_tac THEN rewrite_tac[ℝ_eq_≤_thm, ℝ_≤_conv_lemma]);
a(rewrite_tac[ℝ_minus_frac_less_frac_thm, ℝ_frac_less_minus_frac_thm]);
a(PC_T1 "lin_arith"  prove_tac[]);
pop_thm()
);
=TEX
=SML
val ⦏ℝ_frac_eq_frac_conv⦎ : CONV = (fn tm =>
	(simple_eq_match_conv ℝ_frac_cross_mult_eq_thm THEN_C
	 RANDS_C (RIGHT_C plus_conv THEN_C times_conv) THEN_C
	 ℕ_eq_conv
	) tm
	handle ex => term_fail "ℝ_frac_less_conv" 116309 [tm]
);
=TEX
=SML
val ⦏ℝ_eq_conv⦎ : CONV = (fn tm =>
	(RANDS_C (ℝ_frac_denorm_conv ORELSE_C RAND_C ℝ_frac_denorm_conv)
	 THEN_C FIRST_C [
		ℝ_frac_eq_frac_conv,
		simple_eq_match_conv ℝ_eq_conv_lemma1 THEN_C
			ℝ_frac_eq_frac_conv,
		simple_eq_match_conv ℝ_eq_conv_lemma2 THEN_C
		RIGHT_C plus_conv THEN_C ℕ_eq_conv,
		eq_sym_conv THEN_C
		simple_eq_match_conv ℝ_eq_conv_lemma2 THEN_C
		RIGHT_C plus_conv THEN_C ℕ_eq_conv
	]) tm
	handle ex => term_fail "ℝ_eq_conv" 116311 [tm]
);
=TEX
\subsection{Subtraction}
=SML
val ⦏ℝ_subtract_conv⦎ =  (fn tm =>
	simple_eq_match_conv ℝ_subtract_def tm
	handle ex => term_fail "ℝ_subtract_conv" 116315 [tm]
);
=TEX
\subsection{Division}
=SML
val ⦏ℝ_over_conv_lemma1⦎ = (
set_goal([], ⌜
	∀x m n⦁ x / ((m+1)/(n+1)) = x * ((n+1)/(m+1))
⌝);
a(REPEAT strip_tac THEN
	conv_tac(RIGHT_C(once_rewrite_conv
		[conv_rule(ONCE_MAP_C eq_sym_conv)ℝ_frac_recip_thm])));
a(rewrite_tac[get_spec⌜$/⋎N⌝]);
a(LEMMA_T ⌜¬m + 1 = 0 ⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⌜¬n + 1 = 0 ⌝ asm_tac THEN1 prove_tac[]);
a(lemma_tac ⌜¬ℕℝ(m + 1) = ℕℝ 0 ∧ ¬ℕℝ(n + 1) = ℕℝ 0 ⌝
	THEN1 asm_rewrite_tac[ℕℝ_one_one_thm]);
a(lemma_tac⌜¬ ℕℝ (m + 1) / ℕℝ (n + 1) = ℕℝ 0⌝ THEN1
	all_fc_tac[ℝ_over_eq_0_thm]);
a(ALL_FC_T rewrite_tac[ℝ_over_times_recip_thm]);
pop_thm()
);
=TEX
=SML
val ⦏ℝ_over_conv_lemma2⦎ = (
set_goal([], ⌜
	∀x m n⦁ ~x / ((m+1)/(n+1)) = (x * ~((n+1)/(m+1)))
⌝);
a(rewrite_tac[ℝ_over_conv_lemma1, ℝ_times_minus_thm]);
pop_thm()
);
=TEX
=SML
val ⦏ℝ_over_conv_lemma3⦎ = (
set_goal([], ⌜
	∀x m n⦁ x / ~((m+1)/(n+1)) = (x * ~((n+1)/(m+1)))
⌝);
a(REPEAT strip_tac THEN rewrite_tac[ℝ_times_minus_thm] THEN
	conv_tac(RIGHT_C(once_rewrite_conv
		[conv_rule(ONCE_MAP_C eq_sym_conv)ℝ_frac_recip_thm])));
a(rewrite_tac[get_spec⌜$/⋎N⌝]);
a(LEMMA_T ⌜¬m + 1 = 0 ⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⌜¬n + 1 = 0 ⌝ asm_tac THEN1 prove_tac[]);
a(lemma_tac ⌜¬ℕℝ(m + 1) = ℕℝ 0 ∧ ¬ℕℝ(n + 1) = ℕℝ 0 ⌝
	THEN1 asm_rewrite_tac[ℕℝ_one_one_thm]);
a(lemma_tac⌜¬ ℕℝ (m + 1) / ℕℝ (n + 1) = ℕℝ 0⌝ THEN1
	all_fc_tac[ℝ_over_eq_0_thm]);
a(TOP_ASM_T (strip_asm_tac	o rewrite_rule[ℝ_minus_clauses, ℝ_plus_clauses] o
	once_rewrite_rule[ℝ_eq_thm] o conv_rule (ONCE_MAP_C eq_sym_conv)));
a(ALL_FC_T (fn ths => conv_tac (LEFT_C (once_rewrite_conv ths)))
	[ℝ_over_times_recip_thm]);
a(ALL_FC_T once_rewrite_tac[ℝ_minus_recip_thm]);
a(rewrite_tac[ℝ_times_minus_thm]);
pop_thm()
);
=TEX
=SML
val ⦏ℝ_over_conv_lemma4⦎ = (
set_goal([], ⌜
	∀x m n⦁ ~x / ~((m+1)/(n+1)) = (x * ((n+1)/(m+1)))
⌝);
a(rewrite_tac[ℝ_over_conv_lemma3, ℝ_times_minus_thm]);
pop_thm()
);
=TEX
=SML
val OPT_MINUS_C : CONV -> CONV = (fn c =>
 	c ORELSE_C (fn t => (dest_ℝ_minus t; RAND_C c t))
);
=TEX
=SML
val ⦏ℝ_over_conv⦎ : CONV = (fn tm =>
	let
		val conv1 = RIGHT_C (OPT_MINUS_C ℝ_non_0_denorm_conv);
		val conv2 = (FIRST_C o map simple_eq_match_conv) [
			ℝ_over_conv_lemma4,
			ℝ_over_conv_lemma3,
			ℝ_over_conv_lemma2,
			ℝ_over_conv_lemma1];
		val conv3 =
		RIGHT_C (OPT_MINUS_C (RANDS_C plus_conv THEN_TRY_C ℝ_frac_norm_conv))
		THEN_TRY_C ℝ_times_conv;
	in	(conv1 THEN_C conv2 THEN_C conv3) tm
	end	handle Fail _ => term_fail "ℝ_over_conv" 116312 [tm]
);
=TEX
\subsection{Greater-than and Greater-than-or-equal}
=SML
val ⦏ℝ_greater_conv⦎ : CONV = (fn tm =>
	simple_eq_match_conv ℝ_greater_def tm
	handle ex => term_fail "ℝ_greater_conv" 116313 [tm]
);
=TEX
=SML
val ⦏ℝ_≥_conv⦎ : CONV = (fn tm =>
	simple_eq_match_conv ℝ_≥_def tm
	handle ex => term_fail "ℝ_≥_conv" 116314 [tm]
);
=TEX
\subsection{Absolute Value}
=SML
val ⦏ℝ_abs_conv_lemma⦎ = (
set_goal([], ⌜∀i m⦁ Abs(~(i/(m+1))) = i/(m+1)⌝);
a(rewrite_tac[ℝ_abs_minus_thm, ℝ_abs_frac_thm]);
pop_thm()
);
=SML
val ⦏ℝ_abs_conv⦎ =  (fn tm =>
	((RAND_C ℝ_frac_denorm_conv THEN_C
	 simple_eq_match_conv ℝ_abs_frac_thm THEN_C
	RIGHT_C plus_conv THEN_TRY_C ℝ_frac_norm_conv)
ORELSE_C (RAND_C(RAND_C ℝ_frac_denorm_conv) THEN_C
	 simple_eq_match_conv ℝ_abs_conv_lemma THEN_C
	RIGHT_C plus_conv THEN_TRY_C ℝ_frac_norm_conv)) tm
	handle ex => term_fail "ℝ_abs_conv" 116316 [tm]
);
=TEX
\subsection{Negation}
=TEX
=SML
val ⦏ℝ_minus_minus_thm⦎ =tac_proof(([],
	⌜∀x:ℝ⦁ ~(~ x) = x ⌝),
	rewrite_tac[ℝ_minus_clauses]);
=TEX
=SML
val ⦏ℝ_minus_0_thm⦎ =tac_proof(([],
	⌜∀x:ℝ⦁ ~(ℕℝ 0) = ℕℝ 0 ⌝),
	rewrite_tac[ℝ_minus_clauses]);
=TEX
=SML
val ⦏ℝ_minus_conv⦎ : CONV = (fn tm =>
	(dest_ℝ_minus tm handle Fail _ => term_fail "ℝ_abs_conv" 116319 [tm]);
	REPEAT_C1 (simple_eq_match_conv ℝ_minus_minus_thm) AND_OR_C
	(ℝ_frac_norm_conv ORELSE_C RAND_C ℝ_frac_norm_conv) AND_OR_C
	simple_eq_match_conv ℝ_minus_0_thm
);
=TEX
\subsection{Exponentiation}
=SML
val ⦏ℝ_ℕ_exp_def⦎ = get_spec⌜$^⋎N⌝;
=TEX
=SML
val ⦏ℝ_ℕ_exp_conv_lemma1⦎ = (
set_goal([], ⌜∀x:ℝ; m:ℕ⦁ x ^ (m + m) = x ^ m * x ^ m⌝);
a(REPEAT strip_tac THEN induction_tac ⌜m:ℕ⌝);
(* *** Goal "1" *** *)
a(rewrite_tac[ℝ_ℕ_exp_def, ℝ_times_clauses]);
(* *** Goal "2" *** *)
a(rewrite_tac[plus_assoc_thm1, ℝ_ℕ_exp_def]);
a(rewrite_tac[∀_elim⌜m⌝ plus_order_thm]);
a(asm_rewrite_tac[plus_assoc_thm1, ℝ_ℕ_exp_def]);
a(rewrite_tac[∀_elim⌜x⌝ ℝ_times_order_thm]);
pop_thm()
);
=TEX
=SML
val ⦏ℝ_ℕ_exp_conv_lemma2⦎ = (
set_goal([], ⌜∀x:ℝ; m:ℕ⦁ x ^ (m + m + 1) = (x ^ m * x ^ m) * x⌝);
a(REPEAT strip_tac);
a(rewrite_tac[plus_assoc_thm1, ℝ_ℕ_exp_def, ℝ_ℕ_exp_conv_lemma1]);
a(rewrite_tac[∀_elim⌜x⌝ ℝ_times_order_thm]);
pop_thm()
);
=TEX
=SML
val ⦏ℝ_ℕ_exp_conv_lemma3⦎ = (
set_goal([], ⌜∀x:ℝ⦁ x ^ 0 = ℕℝ 1⌝);
a(rewrite_tac[ℝ_ℕ_exp_def]);
pop_thm()
);
=TEX
Note that the following theorem might produce an unnormalised answer, so the
conversion must take care.
=SML
val ⦏ℝ_ℕ_exp_conv_lemma4⦎ = (
set_goal([], ⌜∀x:ℝ; m:ℕ⦁ x ^ 1 = x⌝);
a(REPEAT strip_tac);
a(LEMMA_T ⌜x ^ 1 = x ^ (0 + 1)⌝ pure_rewrite_thm_tac THEN1 rewrite_tac[]);
a(pure_rewrite_tac[ℝ_ℕ_exp_def]);
a(rewrite_tac[ℝ_times_clauses]);
pop_thm()
);
=TEX
=SML
val ⦏two⦎ = @@"2";
val ⦏three⦎ = @@"3";
val rec ⦏ℝ_ℕ_exp_conv⦎ =  (fn tm =>
	simple_eq_match_conv ℝ_ℕ_exp_conv_lemma3 tm
	handle Fail _ =>
	(simple_eq_match_conv ℝ_ℕ_exp_conv_lemma4 THEN_TRY_C ℝ_minus_conv) tm
	handle Fail _ =>
	let	val (x_tm, m_tm) = dest_ℝ_ℕ_exp tm;
		fun check t = (
			(dest_ℝ_frac t; mk_t) handle Fail _ => dest_ℕℝ t
		);
		val _ = check x_tm
			handle Fail _ => check(dest_ℝ_minus x_tm);
		val m = dest_ℕ m_tm;
		val mb2 = m idiv two;
		val mb2_tm = mk_ℕ mb2;
		fun even_conv t = (
			eq_sym_rule (plus_conv (mk_plus(mb2_tm, mb2_tm)))
		);
		fun odd_conv t = (
			eq_sym_rule ((RIGHT_C plus_conv THEN_C plus_conv)
				(mk_plus(mb2_tm, mk_plus(mb2_tm, one_tm))))
		);
		val recur = ℝ_ℕ_exp_conv (mk_ℝ_ℕ_exp(x_tm, mb2_tm));
		fun either_conv t = recur;
	in	(if	m = mb2 @+ mb2
		then	RIGHT_C even_conv THEN_C
			simple_eq_match_conv ℝ_ℕ_exp_conv_lemma1 THEN_C
			RANDS_C either_conv THEN_C ℝ_times_conv
		else	RIGHT_C odd_conv THEN_C
			simple_eq_match_conv ℝ_ℕ_exp_conv_lemma2
			THEN_C LEFT_C (RANDS_C either_conv THEN_C ℝ_times_conv)
			THEN_C ℝ_times_conv) tm
	end	handle Fail _ => term_fail "ℝ_ℕ_exp_conv" 116317 [tm]
);
=TEX
=SML
val _ = (
push_consistency_goal⌜$^⋎Z⌝;
a(∃_tac⌜λx i⦁if ℕℤ 0 ≤ i then x ^⋎N (εm⦁i = ℕℤ m) else  (x ^⋎N (εm⦁i = ~(ℕℤ m))) ⋏-⋏1⌝
	THEN rewrite_tac[] THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(rewrite_tac[ℕℤ_≤_thm, ℕℤ_one_one_thm] THEN all_ε_tac
	THEN1 prove_∃_tac);
a(POP_ASM_T(fn th => conv_tac(RIGHT_C (once_rewrite_conv[th])))
	THEN REPEAT strip_tac);
(* *** Goal "2" *** *)
a(rewrite_tac[pc_rule1"ℤ_lin_arith" prove_rule[]
	⌜∀i j⦁ (ℕℤ 0 ≤ ~i ⇔ i ≤ ℕℤ 0) ∧ (~i = ~j ⇔ i = j)⌝,
	ℕℤ_≤_thm, ℕℤ_one_one_thm]
	THEN all_ε_tac THEN1 prove_∃_tac);
a(POP_ASM_T(fn th => conv_tac(RIGHT_C (once_rewrite_conv[th])))
	THEN REPEAT strip_tac);
save_consistency_thm ⌜$^⋎Z⌝ (pop_thm())
);
=TEX
=SML
val ⦏ℝ_ℤ_exp_def⦎ = get_spec⌜$^⋎Z⌝;
=TEX
=SML
val ⦏ℝ_ℤ_exp_conv_lemma1⦎ = (
set_goal([], ⌜∀x:ℝ; m:ℕ⦁ x ^ ℕℤ m = x ^ m⌝);
a(rewrite_tac[ℝ_ℤ_exp_def]);
pop_thm()
);
=TEX
=SML
val ⦏ℝ_ℤ_exp_conv_lemma2⦎ = (
set_goal([], ⌜∀x:ℝ; m:ℕ⦁ x ^ ~(ℕℤ m) = (x ^ m)⋏-⋏1⌝);
a(REPEAT strip_tac THEN strip_asm_tac(∀_elim⌜m:ℕ⌝ℕ_cases_thm)
	THEN all_var_elim_asm_tac1);
(* *** Goal "1" *** *)
a(conv_tac (ONCE_MAP_C ℤ_anf_conv) THEN rewrite_tac[ℝ_ℤ_exp_def, ℝ_ℕ_exp_def]);
a(conv_tac(ONCE_MAP_C ℝ_recip_conv) THEN REPEAT strip_tac);
(* *** Goal "2" *** *)
a(rewrite_tac[ℝ_ℤ_exp_def]);
pop_thm()
);
=TEX
=SML
val ⦏ℝ_ℤ_exp_conv⦎ : CONV = (fn tm =>
	(simple_eq_match_conv ℝ_ℤ_exp_conv_lemma1 ORELSE_C
	simple_eq_match_conv ℝ_ℤ_exp_conv_lemma2) tm
	handle Fail _ => term_fail "ℝ_ℤ_exp_conv" 116321 [tm]
);
=TEX
\subsection{Floating Point Literals}
=SML
val ⦏float_def⦎ = get_spec ⌜Float⌝;
=TEX
=SML
val ⦏ℤ_minus_minus_conv⦎ = simple_eq_match_conv
	(prove_rule[]⌜∀x : ℤ ⦁~(~x) = x⌝);
=TEX
=SML
val ⦏float_conv⦎ : CONV = (fn tm =>
	(simple_eq_match_conv float_def THEN_C
	RIGHT_C(RIGHT_C(
		RIGHT_C (TRY_C ℤ_minus_minus_conv)
			THEN_C ℤ_plus_conv)) THEN_C
	RIGHT_C ℝ_ℤ_exp_conv THEN_C
	RIGHT_C(ℝ_ℕ_exp_conv ORELSE_C
		(RAND_C ℝ_ℕ_exp_conv THEN_C ℝ_recip_conv)) THEN_C
	ℝ_times_conv) tm
	handle Fail _ => term_fail "float_conv" 116331 [tm]
);
=TEX
\subsection{Maxima and Minima}
=SML
val ⦏ℝ_max_singleton_thm⦎ : THM = ⇔_t_elim(rewrite_conv[ℝ_max_def]
		⌜∀x⦁ Max⋎R [x] = x⌝);
val ⦏ℝ_min_singleton_thm⦎ : THM = ⇔_t_elim(rewrite_conv[ℝ_min_def]
		⌜∀x⦁ Min⋎R [x] = x⌝);
val ⦏if_t_thm⦎ : THM = ⇔_t_elim(rewrite_conv[]
		⌜∀x y⦁ (if T then x else y) = x⌝);
val ⦏if_f_thm⦎ : THM = ⇔_t_elim(rewrite_conv[]
		⌜∀x y⦁ (if F then x else y) = y⌝);
=TEX
=SML
val ⦏ℝ_max_conv⦎ : CONV = (fn tm => (
	(dest_ℝ_max tm handle ex as (Fail _) => reraise ex "ℝ_max_conv");
	(simple_eq_match_conv ℝ_max_singleton_thm ORELSE_C
	(simple_eq_match_conv ℝ_max_conv_thm THEN_C
		(RATOR_C (RATOR_C(RAND_C ℝ_less_conv))) THEN_C
		(simple_eq_match_conv if_t_thm ORELSE_C
			simple_eq_match_conv if_f_thm))) tm
	handle Fail _ => term_fail  "ℝ_max_conv" 116331 [tm]
));
=TEX
=SML
val ⦏ℝ_min_conv⦎ : CONV = (fn tm => (
	(dest_ℝ_min tm handle ex as (Fail _) => reraise ex "ℝ_min_conv");
	(simple_eq_match_conv ℝ_min_singleton_thm ORELSE_C
	(simple_eq_match_conv ℝ_min_conv_thm THEN_C
		(RATOR_C (RATOR_C(RAND_C ℝ_less_conv))) THEN_C
		(simple_eq_match_conv if_t_thm ORELSE_C
			simple_eq_match_conv if_f_thm))) tm
	handle Fail _ => term_fail  "ℝ_min_conv" 116331 [tm]
));
=TEX
\subsection{General Arithmetic Evaluation}
=SML
val ⦏eval_net⦎ = switch list_net_enter empty_net
[
	(⌜x +⋎R y⌝, ℝ_plus_conv),
	(⌜x -⋎R y⌝, ℝ_subtract_conv THEN_C RIGHT_C (TRY_C ℝ_minus_conv) THEN_C ℝ_plus_conv),
	(⌜x *⋎R y⌝, ℝ_times_conv),
	(⌜x /⋎R y⌝, ℝ_over_conv THEN_C COND_C is_ℝ_times fail_conv id_conv),
	(⌜x ⋏-⋏1⌝, ℝ_recip_conv),
	(⌜Abs⋎R x⌝, ℝ_abs_conv),
	(⌜(x:ℝ) ^ (n:ℕ)⌝, TRY_C (RIGHT_C anf_conv) THEN_C ℝ_ℕ_exp_conv),
	(⌜~⋎R x⌝, TRY_C ℝ_minus_conv),
	(⌜Float x p e⌝, TRY_C float_conv)
];
=TEX
=SML
val rec ⦏ℝ_EVAL_C⦎ : CONV -> CONV = (fn user_conv => fn tm =>
	let	fun chk tm = (
			let	val tm2 = dest_ℝ_minus tm handle Fail _=> tm;
			in	let	val (a, b) = dest_ℝ_frac tm2;
					val (_, bi) = (dest_ℕ a, dest_ℕ b);
				in	bi <> zero
				end	handle Fail _ =>
				let	val m = dest_ℕℝ tm2;
				in	is_ℕ m
				end	handle Fail _ => false
			end
		);
	in	case net_lookup eval_net tm of
			[conv] => RANDS_C (TRY_C(ℝ_EVAL_C user_conv)) THEN_C conv
		|	_ => (user_conv AND_OR_C (OPT_MINUS_C ℝ_frac_norm_conv))
				THEN_C COND_C chk id_conv fail_conv
	end	tm
	handle	Fail _ => term_fail "ℝ_EVAL_C" 116320 [tm]
);
=TEX
=SML
val ⦏ℝ_eval_conv⦎ : CONV = (fn tm =>
	ℝ_EVAL_C fail_conv tm handle ex as (Fail _) => reraise ex "ℝ_eval_conv"
);
=TEX
\section{PROOF CONTEXT}
=SML
fun ⦏thms_to_eqn_cxt⦎ (thms:THM list) : EQN_CXT = (
	flat(map (cthm_eqn_cxt (current_ad_rw_canon())) thms)
);
=TEX
=SML
val _ = delete_pc "'ℝ" handle Fail _ => ();
val _ = new_pc "'ℝ";
val _ = set_rw_eqn_cxt
		[	(⌜x +⋎R y⌝, ℝ_plus_conv),
			(⌜x *⋎R y⌝, ℝ_times_conv),
			(⌜x -⋎R y⌝, ℝ_subtract_conv),
			(⌜Abs⋎R x⌝, ℝ_abs_conv),
			(⌜x /⋎R y⌝, ℝ_over_conv),
			(⌜x ⋏-⋏1⌝, ℝ_recip_conv),
			(⌜x ^⋎N m⌝, ℝ_ℕ_exp_conv),
			(⌜x ^⋎Z i⌝, ℝ_ℤ_exp_conv),
			(⌜(x:ℝ) = y⌝, ℝ_eq_conv),
			(⌜x ≤⋎R y⌝, ℝ_≤_conv),
			(⌜x <⋎R y⌝, ℝ_less_conv),
			(⌜x ≥⋎R y⌝, ℝ_≥_conv),
			(⌜x >⋎R y⌝, ℝ_greater_conv),
			(⌜m /⋎N m⌝, ℝ_frac_norm_conv),
			(⌜Float x p (ℕℤ 0)⌝, float_conv),
			(⌜Max⋎R [x]⌝, ℝ_max_conv),
			(⌜Max⋎R (Cons x (Cons y z))⌝, ℝ_max_conv),
			(⌜Min⋎R [x]⌝, ℝ_min_conv),
			(⌜Min⋎R (Cons x (Cons y z))⌝, ℝ_min_conv)
		] "'ℝ";
val _ = add_rw_thms [ℝ_plus_clauses, ℝ_minus_clauses, ℝ_≤_clauses,
			ℝ_less_clauses, ℝ_times_clauses]
	"'ℝ";
val ⦏pos⦎ = (thms_to_eqn_cxt [ℝ_minus_clauses, ℝ_≤_clauses, ℝ_less_clauses]) @
		[	(⌜(x:ℝ) = y⌝, ℝ_eq_conv),
			(⌜x ≥⋎R y⌝, ℝ_≥_conv),
			(⌜x >⋎R y⌝, ℝ_greater_conv)];
val ⦏neg⦎ = mapfilter (mk_¬ ** RAND_C) pos;
val ⦏neutral⦎ = [(⌜x ≤⋎R y⌝, ℝ_≤_conv), (⌜x <⋎R y⌝, ℝ_less_conv)];
val ⦏strip_eqn_cxt⦎ = neutral @ pos @ neg;
val _ = set_st_eqn_cxt strip_eqn_cxt "'ℝ";
val _ = set_sc_eqn_cxt strip_eqn_cxt "'ℝ";
val _ = set_pr_tac basic_prove_tac "'ℝ";
val _ = set_pr_conv basic_prove_conv "'ℝ";
val _ = commit_pc "'ℝ";
=TEX
\section{TERM ORDERING FOR ℝ}
The ordering must bring together signed literals and like monomials.
We arrange things so that a monomial with a sign comes immediately after the monomial, and with a literal multiplier immediately after that, e.g.:

=GFT
	a*b < ~a * b < 0 * a * b < ~1 * a * b < 1 * a * b < ....
=TEX
=SML
fun ⦏dest_lit⦎ (tm : TERM) : INTEGER * INTEGER OPT = (
	(dest_ℕ(dest_ℕℝ tm), Nil)
	handle Fail _ => (dest_ℕ ** (Value o dest_ℕ)) (dest_ℝ_frac tm)
);
=TEX
=SML
fun ⦏dest_signed_lit⦎ (tm : TERM) : INTEGER * INTEGER OPT = (
	dest_lit tm (* ⌜ℕℝ nnn⌝ ⌜nnn/ddd⌝ *)
	handle Fail _ =>
	let	val tm2 = dest_ℝ_minus tm;
		val (nnn, ddd) = dest_lit tm2;
	in	(@~ nnn, ddd) (* ⌜~(ℕℝ nnn)⌝ ⌜~(nnn/ddd)⌝ *)
	end
);
=TEX
The following function compares two rational numbers represented as a numerator and an optional denominator.
This is surprisingly complicated!
We have to be careful not to return 0 unless the two representations are identical and we have to deal with zero denominators.
The order chosen is this: if either denominator is zero, the ordering is by numerator, then by denominator.
If a denominator is omitted it is treated as one, and the representation with the omitted denominator comes first if the two representations compare equal numerically.
=SML
fun ⦏rat_order⦎
	(num1 : INTEGER, Nil : INTEGER OPT)
	(num2 : INTEGER, Nil : INTEGER OPT) : int = (
	integer_order num1 num2
) | rat_order (rat1 as (num1, Value den1)) (rat2 as (num2, Value den2)) = (
	if	den1 = zero
	then	let	val x = integer_order num1 num2;
			in	if	x = 0
				then	if	num2 = zero
					then	0
					else	~1
				else	x
			end
	else	if	den2 = zero
		then	~(rat_order rat2 rat1)
		else	let	val x = integer_order (num1 @* den2) (num2 @* den1);
			in	if	x = 0
				then	integer_order num1 num2
				else	x
			end
) | rat_order (num1, Nil) (rat2 as (_, Value _)) = (
	let	val x = rat_order (num1, Value one) rat2;
	in	if	x = 0
		then	~1
		else	x
	end
) | rat_order rat1 rat2 = (
	~(rat_order rat2 rat1)
);
=TEX
=SML
val ⦏strip_ℝ_times⦎ = strip_bin_op "*⋎R";
=TEX
We need to line $x$ up just before
=INLINEFT
~x
=TEX
\ and
=INLINEFT
x⋏-⋏1
=TEX
.
The following function encodes the sequence of negations and reciprocals as a binary number:
=SML
fun ⦏dest_signed_or_recip⦎ (tm : TERM)
	: TERM * INTEGER = (
	let	fun aux acc t = (
			let	val t1 = dest_ℝ_minus t;
			in	aux (two @* acc) t1
			end	handle Fail _ =>
			let	val t1 = dest_ℝ_recip t;
			in	aux (two @* acc @+ one) t1
			end	handle Fail _ => (t, acc)
		);
	in	aux one tm
	end
);
=TEX
=SML
type ⦏MONOMIAL⦎ = (TERM * TERM OPT) list;
=TEX
=SML
fun ⦏dest_monomial_and_signs⦎ (tm : TERM) : MONOMIAL * INTEGER list = (
	let	fun dest1 t = (
			let	val (xe, s) = dest_signed_or_recip t;
			in	let	val (x, e) = dest_ℝ_ℕ_exp xe;
				in	((x, Value e), s)
				end	handle Fail _ => ((xe, Nil), s)
			end
		);
		val tess = map dest1 (strip_ℝ_times tm);
	in	split tess
	end
);
=TEX
=SML
fun ⦏dest_coeff_monomial⦎ (tm : TERM)
	: MONOMIAL * ((INTEGER * INTEGER OPT) OPT * INTEGER list) = (
	let	val (c, t) = dest_ℝ_times tm;
		val (m, ss) = dest_monomial_and_signs t;
	in	(m, (Value (dest_signed_lit c), ss))
	end	handle Fail _  =>
		let	val (m, ss) = dest_monomial_and_signs tm;
		in	(m, (Nil, ss))
		end
);
=TEX
=SML
fun ⦏dest_lit_or_signed_coeff_monomial⦎ (tm : TERM)
	: MONOMIAL * ((INTEGER * INTEGER OPT) OPT * INTEGER list) = (
	([], (Value (dest_signed_lit tm), []))
	handle Fail _ => (dest_coeff_monomial tm)
);
=TEX
=SML
fun ⦏order_inducer⦎ (tm : TERM)
	: (MONOMIAL * ((INTEGER * INTEGER OPT) OPT * INTEGER list)) * INTEGER = (
	let	val (tm1, ss) = dest_signed_or_recip tm;
	in	(dest_lit_or_signed_coeff_monomial tm1, ss)
	end
);
=TEX
=SML
fun ⦏degree⦎ (m : MONOMIAL) : INTEGER OPT * TERM = (
	let	fun int_folder((_, Nil), d) = d @+ one
		|   int_folder((_, Value e), d) = d @+ dest_ℕ e;
		fun term_folder((_, Nil), d) = mk_plus(d, mk_ℕ one)
		|   term_folder((_, Value e), d) = mk_plus(e, d);
	in	(Value(fold int_folder m zero), mk_t)
		handle Fail _ => (Nil, fold term_folder m (mk_ℕ zero))
	end
);
=TEX
The following gives an ordering appropriate for exponents, insert an omitted exponent in between 0 and 1.
We force the supplied term order to treat natural number literals in numeric order.
=SML
fun ⦏exponent_order⦎ (r : TERM ORDER) : TERM OPT ORDER = (
	let	fun inducer Nil = mk_ℕ one
		|   inducer (Value tm) = (
			let	val n = dest_ℕ tm;
			in	if	n = zero
				then	tm
				else	mk_ℕ(n @+ one)
			end	handle Fail _ => tm
		);
	in	induced_order(inducer, r)
	end
);
=TEX
=SML
val ⦏nat_order⦎ : TERM ORDER = (fn tm1 => fn tm2 =>
	let	val n1 = dest_ℕ tm1;
		val n2 = dest_ℕ tm2;
	in	if n1 @> n2 then 1 else if n1 = n2 then 0 else ~1
	end	handle Fail _ => term_order tm1 tm2
);
=TEX
The following gives the lexicographic ordering of monomials over the reals.
Here ``lexicographic'' is used in the sense appropriate to a sparse representation of monomials, so that $xy$ precedes $xz$ (whereas in a dense representation, $xz = x^1y^0z^1$ precedes $xy = x^1y^1z^1$).
This is intuitive but not admissible in the sense of the  Gr\"{o}bner basis theory.
=SML
fun ⦏ℝ_term_order_comb⦎
	(r : TERM -> TERM -> int)
	: TERM -> TERM -> int = (
	let	fun monomial_order m1 m2 =
			pair_order(list_order nat_order) (list_order (exponent_order nat_order))
			(split m1) (split m2);
		val coeff_order =
			pair_order
			(opt_order1 rat_order)
			(list_order integer_order);
		val coeff_monomial_order =
			pair_order monomial_order coeff_order;
		val inducing_order =
			pair_order coeff_monomial_order integer_order;
	in
	induced_order
	(order_inducer, inducing_order)
	end
);
=TEX
The version that produces the admissible orderings:
=SML
fun ⦏ℝ_term_order_comb1⦎
	{graded : bool, inverse : bool}
	(r : TERM ORDER) : TERM ORDER = (
	let	val e_order = exponent_order nat_order;
		val m_order =
		if	inverse
		then	inv_list_order(pair_order nat_order e_order)
		else	list_order(pair_order (rev_order nat_order) e_order);
		val coeff_order =
			pair_order
			(opt_order1 rat_order)
			(list_order integer_order);
		val d_order =
		if	graded
		then	induced_order(degree, pair_order (opt_order integer_order) nat_order)
		else	no_order;
		val monomial_order =
			d_order THEN_O m_order;
		val coeff_monomial_order =
			pair_order monomial_order coeff_order;
		val inducing_order =
			pair_order coeff_monomial_order integer_order;
	in
	induced_order
	(order_inducer, inducing_order)
	end
);
=TEX
=SML
val ⦏ℝ_term_order⦎ : TERM ORDER = make_term_order [ℝ_term_order_comb];
fun ⦏ℝ_term_order1⦎
	(gi as {graded : bool, inverse : bool}) : TERM ORDER = (
	make_term_order [ℝ_term_order_comb1 gi]
);
=IGN
=TEX
\section{ANF FOR ℝ}
We need conversions and supporting theorems which do collection of
like terms.
First of all we need to provide conversions which, given a (sorted) sum,
=INLINEFT
m⋎1 + m⋎2
=TEX
\ of two normalised monomials will do all applicable simplifications which can reduce the sum to a single monomial.
We find the following cases, in which $c$d and $d$ denote literals, and where, on the right hand-side of the equations, literal arithmetic expressions are intended to have been evaluated:
=GFT
1.	c*m +d*m 	=	(c + d)*m
2.	m +d*m 		=	(1 + d)*m
3.	0 + m		=	m
4.	c + d		=	c + d
5.	m + m 		=	2*m
6.	m + ~m 		=	0
7.	m*n + ~m*n	=	0
8.	~m + d*m		=	(~1 + d)*m	
9.	~m*n + d*m*n	=	(~1 + d)*m*n
10.	m + 0		=	m
=TEX
Here case 4 is directly supported by $ℝ\_plus\_conv$ (note that the order
here is important since case 4 overlaps case 5).
Note that case 5 may introduce a monadic minus in the wrong place.
The others will not do this unless their input has the same flaw.
Note also that cases 1, 2, 8 and 9 may introduce multiplication
by $1$,
=INLINEFT
~1
=TEX
, or $0$ which must be simplified away.
Case 10 only arises when cancellation during the polynomial normalisation has caused a sub-polynomial to become $0$.
=SML
val _ = push_merge_pcs ["'ℝ", "'ℕ", "predicates"];
val ⦏case1_thm⦎ = tac_proof(([], ⌜∀c d m:ℝ⦁c*m + d*m = (c + d)*m⌝),
	rewrite_tac[ℝ_times_plus_distrib_thm]);
val ⦏case2_thm⦎ = tac_proof(([], ⌜∀d m:ℝ⦁m + d*m = (ℕℝ 1 + d)*m⌝),
	rewrite_tac[ℝ_times_plus_distrib_thm, ℝ_plus_assoc_thm]);
val ⦏case3a_thm⦎ = tac_proof(([], ⌜∀m⦁ℕℝ 0 + m = m⌝),
	rewrite_tac[]);
val ⦏case3b_thm⦎ = tac_proof(([], ⌜∀m⦁~(ℕℝ 0) + m = m⌝),
	rewrite_tac[]);
val ⦏case5_thm⦎ = tac_proof(([], ⌜∀m:ℝ⦁m + m = ℕℝ 2*m⌝),
	pure_rewrite_tac[prove_rule[]⌜ℕℝ 2 = ℕℝ 1 + ℕℝ 1⌝,
		 ℝ_times_plus_distrib_thm]
	THEN rewrite_tac[]);
val ⦏case5a_thm⦎ = tac_proof(([], ⌜∀m n:ℝ⦁m * ~ n= ~m * n⌝),
	rewrite_tac[ℝ_times_minus_thm]);
val ⦏case5b_thm⦎ = tac_proof(([], ⌜∀m n p:ℝ⦁m * ~ n * p = ~m * n *p⌝),
	rewrite_tac[ℝ_times_minus_thm]);
val ⦏case6_thm⦎ = tac_proof(([], ⌜∀m:ℝ⦁m + ~m = ℕℝ 0⌝),
	rewrite_tac[ℝ_minus_clauses]);
val ⦏case7_thm⦎ = tac_proof(([], ⌜∀m n:ℝ⦁m*n + ~m*n = ℕℝ 0⌝),
	rewrite_tac[ℝ_minus_clauses, ℝ_times_minus_thm]);
val ⦏case8_thm⦎ = tac_proof(([], ⌜∀m:ℝ⦁~m + d*m = (~(ℕℝ 1) + d)*m⌝),
	rewrite_tac[ℝ_times_minus_thm,
		ℝ_times_clauses, ℝ_times_plus_distrib_thm]);
val ⦏case9_thm⦎ = tac_proof(([], ⌜∀m n:ℝ⦁~m*n + d*m*n = (~(ℕℝ 1) + d)*m*n⌝),
	rewrite_tac[ℝ_times_minus_thm,
		ℝ_times_clauses, ℝ_times_plus_distrib_thm]);
val ⦏case10a_thm⦎ = tac_proof(([], ⌜∀m:ℝ⦁m + ℕℝ 0 = m⌝),
	rewrite_tac[ℝ_plus_0_thm]);
val ⦏case10b_thm⦎ = tac_proof(([], ⌜∀m:ℝ⦁m + ~(ℕℝ 0) = m⌝),
	rewrite_tac[ℝ_plus_0_thm]);
val ⦏case1289a_thm⦎ = tac_proof(([], ⌜∀m:ℝ⦁ℕℝ 1 *m = m⌝),
	rewrite_tac[ℝ_times_clauses]);
val ⦏case1289b_thm⦎ = tac_proof(([], ⌜∀m:ℝ⦁~(ℕℝ 1) * m = ~m⌝),
	rewrite_tac[ℝ_times_clauses, ℝ_times_minus_thm]);
val ⦏case1289c_thm⦎ = tac_proof(([], ⌜∀m:ℝ⦁(ℕℝ 0) * m = ℕℝ 0⌝),
	rewrite_tac[ℝ_times_clauses]);
=TEX
Now we provide the conversions to support the cases:
=SML
val ⦏case1289_conv⦎ : CONV = (
	(simple_eq_match_conv case1289a_thm ORELSE_C
		simple_eq_match_conv case1289b_thm ORELSE_C
		simple_eq_match_conv case1289c_thm)
);
val ⦏case1_conv⦎ : CONV = (fn tm => (
	(((dest_signed_lit o fst o dest_ℝ_times) **
		(dest_signed_lit o fst o dest_ℝ_times))
		o dest_ℝ_plus) tm;
	(simple_eq_match_conv case1_thm THEN_C LEFT_C ℝ_plus_conv
		THEN_TRY_C case1289_conv) tm
));
val ⦏case2_conv⦎ : CONV = (fn tm => (
	(dest_signed_lit o fst o dest_ℝ_times o snd o dest_ℝ_plus) tm;
	(simple_eq_match_conv case2_thm THEN_C LEFT_C ℝ_plus_conv
		THEN_TRY_C case1289_conv) tm
));
val ⦏case3_conv⦎ : CONV = (fn tm =>
	if (fst o dest_signed_lit o fst o dest_ℝ_plus) tm = zero
	then (TRY_C (LEFT_C ℝ_frac_norm_conv) THEN_C
		simple_eq_match_conv case3a_thm) tm
		handle Fail _ =>
		(TRY_C (RAND_C (LEFT_C ℝ_frac_norm_conv)) THEN_C
		simple_eq_match_conv case3b_thm) tm
	else fail_conv tm
);
val ⦏case4_conv⦎ = ℝ_plus_conv;
val ⦏case5_conv⦎ =
	simple_eq_match_conv case5_thm
	THEN_TRY_C (simple_eq_match_conv case5a_thm ORELSE_C
			simple_eq_match_conv case5b_thm);
val ⦏case6_conv⦎ = simple_eq_match_conv case6_thm;
val ⦏case7_conv⦎ = simple_eq_match_conv case7_thm;
val ⦏case8_conv⦎ : CONV = (fn tm => (
	(dest_signed_lit o fst o dest_ℝ_times o snd o dest_ℝ_plus) tm;
	(simple_eq_match_conv case8_thm THEN_C LEFT_C ℝ_plus_conv
		THEN_TRY_C case1289_conv) tm
));
val ⦏case9_conv⦎ : CONV = (fn tm => (
	(dest_signed_lit o fst o dest_ℝ_times o snd o dest_ℝ_plus) tm;
	(simple_eq_match_conv case9_thm THEN_C LEFT_C ℝ_plus_conv
		THEN_TRY_C case1289_conv) tm
));
val ⦏case10_conv⦎ = FIRST_C
	[simple_eq_match_conv case10a_thm,
	 RIGHT_C (TRY_C ℝ_frac_norm_conv)
		THEN_C simple_eq_match_conv case10a_thm,
	 RIGHT_C (RAND_C (TRY_C ℝ_frac_norm_conv))
		THEN_C  simple_eq_match_conv case10b_thm
];
=TEX
=SML
=TEX
The following conversional converts a conversion acting on $x + y$, say,
to one which will also act on $x + y + z$ (by rewriting it as $(x + y) + z$
and then applying the conversion to the subterm $x + y$).
=SML
val ⦏ℝ_plus⦎ = ⌜$+⋎R⌝;
fun ⦏A_C⦎ (c : CONV) : CONV = (fn tm =>
	let	val (ltm, rtm) = dest_ℝ_plus tm;
		val (rtm1, rtm2) = dest_ℝ_plus rtm;
		val thm = c (mk_ℝ_plus(ltm, rtm1));
	in	eq_trans_rule
		(list_∀_elim[ltm, rtm1, rtm2] ℝ_plus_assoc_thm1)
		(app_arg_rule rtm2 (app_fun_rule ℝ_plus thm))
	end 	handle Fail _ => c tm
);
=TEX
We want to simplify multiplication according to the following scheme, where $x$ and $y$ denotes atoms, $m$ and $n$ are natural number indices, other variables are as in the list of simplifications for addition and
=INLINEFT
[~]
=TEX
\ stands for an optional unary minus:
=GFT
1.	c*d		= c*d
2.	0*x		= 0
3.	1*x		= x
4.	~1*~x		= x
5.	~1*x		= ~x
6.	~x*~y		= x*y
7.	x*~y		= ~x*y
8.	[~]x*x^n	= [~]x^(n+1)
9. 	[~]x^m*x	= [~]x^(m+1)
10. 	[~]x^m*x^n	= [~]x^(m+n)
11.	[~]x*x		= [~]x^2
12.	[~]x^1		= [~]x
13.	[~]x^0		= [~]1
=TEX
The exponent is converted to natural number arithmetic normal form and if case 13 applies we simplify again.
=SML
val ⦏times234567_thm⦎ = tac_proof(([],
	⌜∀x y:ℝ⦁
		ℕℝ 0 * x = ℕℝ 0
	∧	~(ℕℝ 0) * x = ℕℝ 0
	∧	ℕℝ 1 * x = x
	∧	~(ℕℝ 1) * ~x = x
	∧	~(ℕℝ 1) * x = ~x
	∧	~x * ~y = x*y
	∧	x * ~y = ~x*y ⌝),
	rewrite_tac[ℝ_times_clauses, ℝ_minus_clauses, ℝ_times_minus_thm]);
=TEX
=SML
val ⦏times1234567_conv⦎ : CONV = (
		FIRST_C (
			ℝ_times_conv ::
			map simple_eq_match_conv
			(current_ad_rw_canon() times234567_thm))
);
=TEX
$M\_C$ is analogous to $A\_C$ but for multiplication rather than addition.
There are additional cases to worry about.
=SML
val ⦏times0_thm⦎ = tac_proof(([],
	⌜∀x:ℝ⦁ℕℝ 0 * x = ℕℝ 0⌝),
		rewrite_tac[ℝ_times_clauses]);

val ⦏times_minus0_thm⦎ = tac_proof(([],
	⌜∀x:ℝ⦁~(ℕℝ 0) * x = ℕℝ 0⌝),
		rewrite_tac[ℝ_times_clauses, ℝ_minus_clauses]);
=TEX
=SML
val ⦏times_8_thm⦎ = tac_proof(([],
	 ⌜∀x : ℝ; n: ℕ⦁ x * x^n = x^(n+1)⌝),
	rewrite_tac[ℝ_ℕ_exp_def]);
val ⦏times_9_thm⦎ = tac_proof(([],
	 ⌜∀x : ℝ; m: ℕ⦁ x^m * x = x^(m+1)⌝),
	once_rewrite_tac[ℝ_times_comm_thm] THEN
	rewrite_tac[times_8_thm]);
val ⦏times_10_thm⦎ = tac_proof(([],
	⌜∀x : ℝ; m n : ℕ⦁ x^m * x^n = x^(m+n)⌝),
		REPEAT strip_tac THEN induction_tac⌜n:ℕ⌝ THEN
		asm_rewrite_tac[ℝ_ℕ_exp_def, plus_assoc_thm1,
			∀_elim⌜x:ℝ⌝ ℝ_times_order_thm]);
val ⦏times_11_thm⦎ = tac_proof(([],
	 ⌜∀x : ℝ⦁ x * x = x^2⌝),
	pure_rewrite_tac[pc_rule1 "lin_arith"prove_rule[]⌜2 = (0+1)+1⌝,
		 ℝ_ℕ_exp_def] THEN
	rewrite_tac[]);
val ⦏times_12_thm⦎ = tac_proof(([],
	 ⌜∀x : ℝ⦁ x^1 = x⌝),
	pure_once_rewrite_tac[pc_rule1 "lin_arith"prove_rule[]⌜1 = 0+1⌝] THEN
	rewrite_tac[ℝ_ℕ_exp_def]);
val ⦏times_13_thm⦎ = tac_proof(([],
	 ⌜∀x : ℝ⦁ x^0 = 1.⌝),
	rewrite_tac[ℝ_ℕ_exp_def]);

val [	⦏times_8_thm1⦎, ⦏times_9_thm1⦎,
	⦏times_10_thm1⦎, ⦏times_11_thm1⦎] = map
	(pure_once_rewrite_rule[
		conv_rule(ONCE_MAP_C eq_sym_conv) ℝ_times_minus_thm] o
	pure_once_rewrite_rule[
		conv_rule(ONCE_MAP_C eq_sym_conv) ℝ_minus_eq_thm])
	[	times_8_thm, times_9_thm,
		times_10_thm, times_11_thm];

val [	⦏times_12_thm1⦎, ⦏times_13_thm1⦎] = map
	(pure_once_rewrite_rule[
		conv_rule(ONCE_MAP_C eq_sym_conv) ℝ_minus_eq_thm])
	[times_12_thm, times_13_thm];
=TEX
=SML
val ⦏times_89_10_11_conv⦎ = (
	(FIRST_C (map simple_eq_match_conv [
		times_8_thm,
		times_9_thm,
		times_10_thm,
		times_11_thm]) THEN_TRY_C RAND_C anf_conv) ORELSE_C
	(FIRST_C (map simple_eq_match_conv [
		times_8_thm1,
		times_9_thm1,
		times_10_thm1,
		times_11_thm1]) THEN_TRY_C RAND_C (RAND_C anf_conv))
);
=TEX
=SML
val ⦏times_12_13_conv⦎ = (
	FIRST_C (map simple_eq_match_conv [
		times_12_thm,
		times_13_thm])
);
=TEX
=SML
val ⦏ℝ_times⦎ = ⌜$*⋎R⌝;
fun ⦏M_C1⦎ (c : CONV) : CONV = (fn tm =>
	let	val (ltm, rtm) = dest_ℝ_times tm;
		val (rtm1, rtm2) = dest_ℝ_times rtm;
		val thm = c (mk_ℝ_times(ltm, rtm1));
	in	eq_trans_rule
		(list_∀_elim[ltm, rtm1, rtm2] ℝ_times_assoc_thm1)
		(app_arg_rule rtm2 (app_fun_rule ℝ_times thm))
	end	handle Fail _ => c tm
);
=TEX
Note that the conversion $c$ passed to $M\_C1$ may have resulted in a monomial whose first term is $\pm 0$ or a product.
=SML
fun ⦏M_C⦎ (c : CONV) : CONV =
	(M_C1 c THEN_TRY_C
	FIRST_C (map simple_eq_match_conv
			[times0_thm, times_minus0_thm, ℝ_times_assoc_thm]));
=TEX
Finally, we need to sort out reciprocals, unary minus and unnormalised literal fractions:
=SML
val rec ⦏ℝ_signed_lit_conv⦎ = (fn tm =>
	(dest_ℝ_minus tm;
		RAND_C (ℝ_frac_norm_conv ORELSE_C ℝ_signed_lit_conv ORELSE_C float_conv) THEN_TRY_C
		simple_eq_match_conv ℝ_minus_minus_thm) tm
	handle Fail _ =>
	(dest_ℝ_recip tm;
		RAND_C (TRY_C ℝ_signed_lit_conv) THEN_C ℝ_recip_conv) tm
	handle Fail _ =>
	(dest_ℝ_frac tm;
		ℝ_frac_norm_conv) tm
);
=TEX
Pulling these bits together we get the following:.
=SML
val ⦏add_simp_conv⦎ =
	FIRST_C(map A_C[
		case1_conv, case2_conv, case3_conv, case4_conv,
		case5_conv, case6_conv, case7_conv, case8_conv,
		case9_conv, case10_conv]) THEN_C TRY_C case3_conv;
val ⦏times_simp_conv⦎ =
	REPEAT_C1
	(M_C (FIRST_C[
		CHANGED_C(RANDS_C (TRY_C ℝ_signed_lit_conv)),
		times1234567_conv,
		times_89_10_11_conv,
		times_12_13_conv,
		RAND_C times_12_13_conv,
		ℝ_signed_lit_conv]));
=TEX
Unlike the natural number case, we have some  non-trivial work to
do trying to make non-atoms from what $poly\_conv$ will see as
atoms if we don't push monadic and dyadic minus around.
The transformation is done according to the following schema:
=GFT
1. ~ (~ m)		= m			(repeatedly)
2. ~(m + n)		= ~m + ~n
3. ~(m * n)		= ~m * n
4. (m - n)		= m + ~n
5. ~(m - n)		= ~m + n
6. ~0			= 0
=TEX
Note that the first of these must be performed repeatedly, since $poly\_conv$
will only apply it once, and, if there are more than four monadic minuses
this may be insufficient to reveal a non-atom for $poly\_conv$ to attack.
=SML
val ⦏minus23456_thm⦎ = tac_proof(([],
	⌜∀m:ℝ⦁~(m + n) =~m + ~n
	∧	~(m * n) = ~m * n
	∧	m - n = m + ~n
	∧	~(m - n) = ~m + n
	∧	~(ℕℝ 0) = ℕℝ 0⌝),
	rewrite_tac[ℝ_minus_clauses, ℝ_times_minus_thm, get_spec⌜$-⋎R⌝]);
=TEX
=SML
val ⦏minus1_conv⦎ : CONV = REPEAT_C1 (simple_eq_match_conv ℝ_minus_minus_thm);
val ⦏minus23456_convs⦎ : CONV list
	= map simple_eq_match_conv (current_ad_rw_canon()minus23456_thm);
val ⦏minus_simp_conv⦎ : CONV = minus1_conv AND_OR_C FIRST_C minus23456_convs;
=TEX
We also need to replace division by literals by multiplication by the reciprocal.
to handle cases such as $x / (m + n)$. We use the evaluation conversion rather
than full normalisation to do this for efficiency. The slight loss in functionality
can be worked around (the user can explicitly apply the normalisation to the
denominator if necessary). The conversion used is passed as the parameter to
the following conversional.
=SML
val rec ⦏OVER_SIMP_C⦎ : CONV -> CONV = (fn conv => fn tm => (
	(dest_ℝ_over tm;
	(TRY_C (RIGHT_C conv) THEN_C ℝ_over_conv) tm)
	handle Fail _ =>
	(dest_ℝ_minus tm; RAND_C (OVER_SIMP_C conv) tm)
));
=TEX
We need the following theorem:
=SML
val ⦏ℝ_left_times_plus_distrib_thm⦎ =
	all_∀_intro(∧_left_elim(all_∀_elim ℝ_times_plus_distrib_thm));
=TEX
We need to preprocess terms of the form $t^e$ that
{\em poly\_conv} would otherwise consider to be atomic.
We attempt to put $e$ in the ANF for natural numbers (hoping to obtain a
numeric literal so that the result can be combined with other powers of $t$).
If we find $e = 0$, we replace $t^e$ with $t$ and we are done.
If we find $e = n$, where $n$ is a non-zero numeric literal and
the principle connective of $t$ is one of the real arithmetic operators, we
$t^n$ by $t \cdot t^{(n-1)}$, allowing {\em poly\_conv} to make further simplifications.
=SML
val ⦏is_ℝ_term⦎ : TERM -> bool =
	is_ℝ_plus fun_or is_ℝ_subtract fun_or is_ℝ_minus fun_or is_ℝ_times;
local
val ⦏ℝ_ℕ_exp_0_thm⦎ = ∧_left_elim ℝ_ℕ_exp_def;
val ⦏ℝ_ℕ_exp_plus_1_thm⦎ = ∧_right_elim ℝ_ℕ_exp_def;
val ⦏ℕ_eq_plus_1_conv⦎ : CONV = (fn tm =>
	eq_sym_rule(plus_conv(mk_plus(mk_ℕ(dest_ℕ tm @- one), one_tm)))
);
val ⦏ℝ_ℕ_exp_atom_conv⦎ : CONV = (fn tm =>
	let	val (x, _) = dest_ℝ_ℕ_exp tm;
		val base_c = RIGHT_C anf_conv AND_OR_C simple_eq_match_conv ℝ_ℕ_exp_0_thm;
	in	if	not (is_ℝ_term x)
		then	base_c
		else	base_c AND_OR_C
			(RIGHT_C ℕ_eq_plus_1_conv THEN_C
				simple_eq_match_conv ℝ_ℕ_exp_plus_1_thm)
	end	tm
);
in
val ⦏ℝ_ℕ_exp_signed_atom_conv⦎ = ℝ_ℕ_exp_atom_conv ORELSE_C COND_C is_ℝ_minus (RAND_C ℝ_ℕ_exp_atom_conv) fail_conv;
end;
=TEX
Now we can define the external interfaces:
=SML
local
val  ⦏ℝ_ANF_C_AUX⦎ : CONV -> CONV = (
	poly_conv
	ℝ_term_order
	ℝ_plus_comm_thm
	ℝ_plus_assoc_thm
	ℝ_times_comm_thm
	ℝ_times_assoc_thm
	ℝ_left_times_plus_distrib_thm
	(add_simp_conv)
	(times_simp_conv)
);
val ⦏anf_frac_conv⦎ =
	COND_C
	((not o is_ℕ o fst) fun_and (is_ℕ o snd) o dest_ℝ_frac)
	(simple_eq_match_conv ℝ_frac_def)
	fail_conv;
in
fun  ⦏ℝ_ANF_C⦎ (conv : CONV) : CONV = (fn tm =>
	(ℝ_ANF_C_AUX (
		conv AND_OR_C
		ℝ_ℕ_exp_signed_atom_conv AND_OR_C
		ℝ_signed_lit_conv AND_OR_C
		minus_simp_conv AND_OR_C
		anf_frac_conv AND_OR_C
		float_conv AND_OR_C
		OVER_SIMP_C (ℝ_EVAL_C conv)) tm)
	handle Fail _ => term_fail "ℝ_ANF_C" 116318 [tm]
);
val ⦏ℝ_anf_conv⦎ : CONV = (fn tm =>
	(ℝ_ANF_C fail_conv tm)
		handle ex => (
			if area_of ex = "ℝ_ANF_C"
			then reraise ex "ℝ_anf_conv"
			else raise ex
	)
);
end;
=TEX
\section{LINEAR ARITHMETIC DECISION PROCEDURE}
The material in this section implements the linear
arithmetic decision procedure for the reals.
\section{Preliminaries}
=SML
open LinearArithmeticTools;
=TEX
\subsection{Theorems and Rules}
We need the ability to multiply an equation or inequality appearing as the
conclusion of a theorem by a (positive integer literal);
the following two theorems are used to justify this (note that there is no
arithmetic content in the theorem about equalities).
=SML
val ⦏scale_eq_thm⦎  = tac_proof(
	([], ⌜∀k:ℝ; i j:ℝ⦁i = j ⇒ k * i = k * j⌝),
	REPEAT strip_tac THEN asm_rewrite_tac[]);
val ⦏pos_scale_≤_thm⦎ = tac_proof(
	([], ⌜∀m:ℕ; i j:ℝ⦁i ≤ j ⇒ ℕℝ m * i ≤ ℕℝ m * j⌝),
	rewrite_tac[ℝ_≤_def] THEN REPEAT strip_tac THEN_TRY all_var_elim_asm_tac1 THEN
	REPEAT strip_tac THEN
	strip_asm_tac (∀_elim⌜m:ℕ⌝ℕ_cases_thm) THEN all_var_elim_asm_tac1
	THEN1 rewrite_tac[] THEN
	i_contr_tac THEN swap_nth_asm_concl_tac 1 THEN
	strip_asm_tac(∀_elim⌜i':ℕ⌝ℕℝ_0_less_thm) THEN all_fc_tac[ℝ_times_mono_thm]);
val ⦏pos_scale_less_thm⦎ = tac_proof(([], ⌜∀m:ℕ; i j:ℝ⦁i < j ⇒ ℕℝ (m+1) * i < ℕℝ (m+1) * j⌝),
	REPEAT strip_tac THEN bc_thm_tac ℝ_times_mono_thm THEN REPEAT strip_tac
	THEN rewrite_tac[ℕℝ_0_less_thm]);
=TEX
The next set of theorems justify adding equalities and inequalities:
=SML
val ⦏add_eq_eq_thm⦎ = tac_proof(([],
	⌜∀m n i j:ℝ⦁m = n ∧ i = j ⇒ m + i = n + j⌝),
	REPEAT strip_tac THEN asm_rewrite_tac[]);
val ⦏add_eq_≤_thm⦎ = tac_proof(([],
	⌜∀m n i j:ℝ⦁m = n ∧ i ≤ j ⇒ m + i ≤ n + j⌝),
	REPEAT strip_tac THEN asm_rewrite_tac[]);
val ⦏add_≤_≤_thm⦎ = tac_proof(
	([], ⌜∀m n i j:ℝ⦁m ≤ n ∧ i ≤ j ⇒ m + i ≤ n + j⌝),
	rewrite_tac[ℝ_≤_def] THEN REPEAT strip_tac THEN_TRY
	(all_var_elim_asm_tac1 THEN asm_rewrite_tac[])
	THEN all_fc_tac[ℝ_plus_mono_thm2]);
val ⦏add_eq_less_thm⦎ = tac_proof(([],
	⌜∀m n i j:ℝ⦁m = n ∧ i < j ⇒ m + i < n + j⌝),
	REPEAT strip_tac THEN asm_rewrite_tac[]);
val ⦏add_less_less_thm⦎ = tac_proof(([],
	⌜∀m n i j:ℝ⦁m < n ∧ i < j ⇒ m + i < n + j⌝),
	accept_tac ℝ_plus_mono_thm2);
val ⦏add_less_≤_thm⦎ = tac_proof(([],
	⌜∀m n i j:ℝ⦁m < n ∧ i ≤ j ⇒ m + i < n + j⌝),
	rewrite_tac[ℝ_≤_def] THEN REPEAT strip_tac THEN_LIST [
		all_asm_fc_tac[ℝ_plus_mono_thm2],
		asm_rewrite_tac[]]);
=TEX
Note: notwithstanding the rather complex coding of the version of these functions
for the natural numbers, Hodes' algorithm as implemented in \cite{DS/FMU/IED/IMP082} produces a polynomial in which the only negative coefficients correspond to equations in the original input.
The following function does not therefore need a case for negating an inequality.

If performance dictates, a more customised conversion than
=INLINEFT
ℝ_anf_conv
=TEX
\ could be used here to exploit the fact that the input theorem will already have its
conclusion in ANF in our application here.
=SML
fun ⦏lit_scale_rule⦎ (b : INTEGER) (th : THM) : THM = (
	let	val (scale_th, conv) =  (
			case (fst o dest_const o fst o strip_app o concl) th of
				"≤⋎R" => (
				(simple_∀_elim (mk_ℕ b) pos_scale_≤_thm, id_conv)
			) |	"<⋎R" => (
				(simple_∀_elim (mk_ℕ (b @- one)) pos_scale_less_thm,
				 LEFT_C (RAND_C plus_conv))
			) |	_ => (
				(simple_∀_elim (
					if	b @>= zero
					then	mk_ℕℝ (mk_ℕ b)
					else	mk_ℝ_minus(mk_ℕℝ (mk_ℕ (@~ b))))
					scale_eq_thm, id_conv)
			)
		);
	in	(conv_rule (RANDS_C (conv THEN_C TRY_C ℝ_anf_conv))
			o ⇒_match_mp_rule scale_th) th
	end
);
=IGN
val th1 = asm_rule⌜a + b ≤ ℕℝ 0⌝;
val th2 = asm_rule⌜~(3/2)*a ≤ ~(1/2)⌝;
val th3 = asm_rule⌜~b  + (4/52)*a ≤ ~(ℕℝ 1)⌝;
val th4 = asm_rule⌜~b  + (4/5)*a = ~(ℕℝ 1)⌝;
val th5 = asm_rule⌜a = ~(ℕℝ 1)⌝;
val th6 = asm_rule⌜~b  + (4/5)*a < ~(ℕℝ 1)⌝;
lit_scale_rule (@@"1") th1;
lit_scale_rule (@@"4") th1;
lit_scale_rule (@@"3") th2;
lit_scale_rule (@@"5") th3;
lit_scale_rule (@@"5") th4;
lit_scale_rule (@@"-6") th4;
lit_scale_rule (@@"-2") th5;
lit_scale_rule (@@"2") th6;
=TEX
=SML
fun ⦏sum2_rule⦎ (th1 : THM) (th2: THM) : THM = (
	let	val rator1 = (fst o dest_const o fst o strip_app o concl) th1;
		val rator2 = (fst o dest_const o fst o strip_app o concl) th2;
		val (add_th, conj_th) = (
			case (rator1, rator2) of
				("=", "=") => (add_eq_eq_thm, ∧_intro th1 th2)
			|	("=", "≤⋎R") => (add_eq_≤_thm, ∧_intro th1 th2)
			|	("=", "<⋎R") => (add_eq_less_thm, ∧_intro th1 th2)
			|	("≤⋎R", "=") => (add_eq_≤_thm, ∧_intro th2 th1)
			|	("≤⋎R", "≤⋎R") => (add_≤_≤_thm, ∧_intro th1 th2)
			|	("≤⋎R", "<⋎R") => (add_less_≤_thm, ∧_intro th2 th1)
			|	("<⋎R", "=") => (add_eq_less_thm, ∧_intro th2 th1)
			|	("<⋎R", "≤⋎R") => (add_less_≤_thm, ∧_intro th1 th2)
			|	("<⋎R", "<⋎R") => (add_less_less_thm, ∧_intro th1 th2)
			|	_ => thm_fail "sum2_rule" 999 [th1, th2]
		);
	in	(conv_rule (RAND_C ℝ_plus_conv) o ⇒_match_mp_rule add_th)
		conj_th
	end
	handle Fail _ => thm_fail "sum2_rule" 999 [th1, th2]
(* ?0 and ?1 are not both of the form ⊢ a = b, ⊢ a < b, ⊢ a ≤ b ⊢ a > b or ⊢a ≥ b *)
);
=IGN
sum2_rule (asm_rule⌜x = ℕℝ 2⌝) (asm_rule⌜y = ℕℝ 3⌝);
sum2_rule (asm_rule⌜x ≤ ℕℝ 2⌝) (asm_rule⌜y = ℕℝ 3⌝);
sum2_rule (asm_rule⌜x < ℕℝ 2⌝) (asm_rule⌜y = ℕℝ 3⌝);
sum2_rule (asm_rule⌜x = ℕℝ 2⌝) (asm_rule⌜y ≤ ℕℝ 3⌝);
sum2_rule (asm_rule⌜x ≤ ℕℝ 2⌝) (asm_rule⌜y ≤ ℕℝ 3⌝);
sum2_rule (asm_rule⌜x < ℕℝ 2⌝) (asm_rule⌜y ≤ ℕℝ 3⌝);
sum2_rule (asm_rule⌜x = ℕℝ 2⌝) (asm_rule⌜y < ℕℝ 3⌝);
sum2_rule (asm_rule⌜x ≤ ℕℝ 2⌝) (asm_rule⌜y < ℕℝ 3⌝);
sum2_rule (asm_rule⌜x < ℕℝ 2⌝) (asm_rule⌜y < ℕℝ 3⌝);
=TEX
=SML
fun ⦏scale_and_sum2_rule⦎ (a1 : INTEGER) (th1 : THM) (th2: THM) : THM = (
	sum2_rule (lit_scale_rule a1 th1) th2
);
=TEX
=SML
fun ⦏scaled_sum_rule⦎ (aths : (INTEGER * THM) list) : THM = (
	let 	fun r aths = (
			case aths of
				[] => fail "sum2_rule" 9089 []
			|	[(a, th)] =>
					lit_scale_rule a th
			|	(a, th) :: more =>
					scale_and_sum2_rule a th (r more)
		);
	in	conv_rule (TRY_C (LEFT_C ℝ_anf_conv)
			THEN_C TRY_C (ℝ_≤_conv ORELSE_C ℝ_less_conv ORELSE_C ℝ_eq_conv)) (r aths)
	end
);
=IGN
scaled_sum_rule (map (Combinators.I ** asm_rule) [
	(one,	⌜a ≤ ℕℝ 0⌝),
	(one,	⌜~a ≤ ~(ℕℝ 1)⌝)
]);
scaled_sum_rule (map (Combinators.I ** asm_rule) [
	(one,	⌜a + b = ℕℝ 0⌝),
	(one,	⌜~a ≤ ~(ℕℝ 1)⌝),
	(one,	⌜~b ≤ ~(ℕℝ 1)⌝)
]);
scaled_sum_rule (map (Combinators.I ** asm_rule) [
	(one,	⌜a + b = ℕℝ 0⌝),
	(minus_one,	⌜a = ℕℝ 1⌝),
	(minus_one,	⌜b = ℕℝ 1⌝)
]);
scaled_sum_rule (map (Combinators.I ** asm_rule) [
	(@@"2",		⌜a + b = ℕℝ 0⌝),
	(minus_one,	⌜ℕℝ 2*a = ℕℝ 1⌝),
	(minus_one,	⌜ℕℝ 2*b = ℕℝ 1⌝)
]);
scaled_sum_rule (map (Combinators.I ** asm_rule) [
	(@@"2",		⌜~a + ~b = ℕℝ 0⌝),
	(one,	⌜ℕℝ 2*a < ~(ℕℝ 1)⌝),
	(one,	⌜ℕℝ 2*b < ℕℝ 1⌝)
]);
=TEX
\subsection{Creating the input for the decision procedure}
We need to be able to compute least common multiples to produce a good
reduction of a normal form with rational coefficients into one with integer
coefficients:
=SML
fun ⦏list_lcm⦎ ([i] : INTEGER list) : INTEGER = i
|   list_lcm (i :: more) = (
	let	val recur = list_lcm more;
		val g = gcd i recur;
	in	(i idiv g) @* recur
	end
) | list_lcm [] = one;
=TEX
The following splits a rational literal into a (signed) numerator and a denominator.
=SML
fun ⦏dest_coefficient⦎ (tm : TERM) : INTEGER * INTEGER = (
	let	val (tm1, neg) = (dest_ℝ_minus tm, true)
			handle Fail _ => (tm, false);
		val (numer, denom) = (dest_ℕ (dest_ℕℝ tm1), one)
			handle Fail _ => (dest_ℕ ** dest_ℕ)(dest_ℝ_frac tm1);
	in	if	not (denom = zero)
		then	(if neg then @~ numer else numer, denom)
		else	term_fail "dest_coefficient" 116307 [tm]
	end
);
=IGN
dest_coefficient⌜ℕℝ 0⌝;
dest_coefficient⌜ℕℝ 1⌝;
dest_coefficient⌜ℕℝ 10000⌝;
dest_coefficient⌜~(ℕℝ 0)⌝;
dest_coefficient⌜~(ℕℝ 1)⌝;
dest_coefficient⌜~(ℕℝ 10000)⌝;
dest_coefficient⌜0/1⌝;
dest_coefficient⌜1/1⌝;
dest_coefficient⌜1/3⌝;
dest_coefficient⌜1001/3⌝;
dest_coefficient⌜~(0/1)⌝;
dest_coefficient⌜~(1/1)⌝;
dest_coefficient⌜~(1/3)⌝;
dest_coefficient⌜~(1001/3)⌝;

ℝ_anf_conv⌜a * ~b * ℕℝ 4 * (2/3)⌝;
ℝ_anf_conv⌜(a:ℝ) * ~b⌝;

=TEX
The following gets the coefficient from a monomial:
=SML
val ⦏minus_one⦎ = @@"-1";
fun ⦏get_coefficient⦎ (tm : TERM) : (INTEGER * INTEGER) = (
	let	val (x, _) = (dest_ℝ_times tm);
	in	(dest_coefficient x)
		handle Fail _ => (dest_ℝ_minus x; (minus_one, one))
	end	handle Fail _ => (one, one)
);
=IGN
get_coefficient⌜ℕℝ 0 * a * b⌝;
get_coefficient⌜ℕℝ 1 * a * b⌝;
get_coefficient⌜ℕℝ 100 * a * b⌝;
get_coefficient⌜(3/4) * a * b⌝;
get_coefficient⌜~(ℕℝ 0) * a * b⌝;
get_coefficient⌜~(ℕℝ 1) * a * b⌝;
get_coefficient⌜~(ℕℝ 100) * a * b⌝;
get_coefficient⌜~(3/4) * a * b⌝;
get_coefficient⌜~a * b:ℝ⌝;
get_coefficient⌜a * b:ℝ⌝;
=TEX
The following function breaks up a sum of 1 or more terms:
=SML
fun ⦏strip_ℝ_plus⦎ (tm : TERM) : TERM list = (
	((op :: o (Combinators.I ** strip_ℝ_plus) o dest_ℝ_plus) tm)
	handle Fail _ => [tm]
);
=IGN
strip_ℝ_plus⌜x:ℝ⌝;
strip_ℝ_plus⌜x:ℝ + y + ℕℝ 42 * v + q⌝;
strip_ℝ_plus⌜x:ℝ + y + ℕℝ 42 * v + q + 157/59 + ~(43/5)*z⌝;
=TEX
The following rule takes a theorem of
one of the forms: $t = c$, $t < c$ or $ t \le c$ where $t$ is in ANF and $c$ is a
rational literal,
and scales it so that all coefficients are integers.
=SML
fun ⦏to_ℤ_rule⦎ (thm : THM) : THM = (
	let	val tm = concl thm;
		val (t, c) = dest_eq tm
			handle Fail _ => dest_ℝ_≤ tm
			handle Fail _ => dest_ℝ_less tm;
		val (_, c_denom) = dest_coefficient c;
		val t_denoms = map (snd o get_coefficient) (strip_ℝ_plus t);
		val factor = list_lcm (c_denom::t_denoms);
	in	if	factor <> one
		then	lit_scale_rule factor thm
		else	thm
	end
);
=IGN
val th6 = asm_rule⌜(1001/4)*b  + (1/13)*a ≤ ~(6/7)⌝;
val th7 = asm_rule⌜~(1001/4)*b  + (1/13)*a ≤ ~(6/7)⌝;
val th8 = asm_rule⌜~(1001/4)*b  + (1/13)*a = ~(6/7)⌝;
val th9 = asm_rule⌜~(1001/4)*b  + (1/13)*a < ~(6/7)⌝;
to_ℤ_rule th1;
to_ℤ_rule th2;
to_ℤ_rule th3;
to_ℤ_rule th4;
to_ℤ_rule th5;
to_ℤ_rule th6;
to_ℤ_rule th7;
to_ℤ_rule th8;
to_ℤ_rule th9;
=TEX
We now need to build a mapping of variable numbers to monomials as
needed to construct polynomials as used in the linear arithmetic decision
procedure. Some utilities come first:
=TEX
=SML
type ⦏VAR_MAP⦎ = {next : int, table : (int * TERM) list};
=TEX
=SML
fun ⦏term_rassoc⦎
	((i, t) :: more : ('a * TERM) list)
	(tm : TERM) : 'a = (
	if t ~=$ tm then i else term_rassoc more tm
) | ⦏term_rassoc⦎ [] _ = (
	fail "term_rassoc" 9090 []
);
=TEX
=SML
fun ⦏establish⦎ (tm : TERM) (vm as {next, table}: VAR_MAP) : (int * VAR_MAP) = (
	(term_rassoc table tm, vm)
	handle Fail _ =>
	(next, {next = next + 1, table = (next, tm) :: table})	
);
=TEX
=IGN
val vm0 : VAR_MAP = {next = 1, table = []};
val (i1, vm1) = establish ⌜a*b:ℝ⌝ vm0;
val (i2, vm2) = establish ⌜a*c:ℝ⌝ vm1;
val (i3, vm3) = establish ⌜a*b:ℝ⌝ vm2;
=TEX
The following breaks out an integer coefficient and a monomial from a summand on
the left-hand side of an equality or inequality:
=SML
fun ⦏dest_monomial⦎ (tm : TERM) : (INTEGER * TERM) = (
	let	val (x, y) = (dest_ℝ_times tm);
	in	(dest_ℕ(dest_ℕℝ x), y)
		handle Fail _ =>
		let	val x' = dest_ℝ_minus x;
		in	(@~(dest_ℕ(dest_ℕℝ x')), y)
			handle Fail _ => (minus_one, mk_ℝ_times(x', y))
		end
	end	handle Fail _ =>
		let	val tm' = dest_ℝ_minus tm;
		in	(minus_one, tm')
		end
	handle Fail _ => (one, tm)
);
=IGN
dest_monomial⌜ℕℝ 0 * a * b⌝;
dest_monomial⌜ℕℝ 1 * a * b⌝;
dest_monomial⌜ℕℝ 100 * a * b⌝;
dest_monomial⌜~(ℕℝ 0) * a * b⌝;
dest_monomial⌜~(ℕℝ 1) * a * b⌝;
dest_monomial⌜~(ℕℝ 100) * a * b⌝;
dest_monomial⌜~a * b:ℝ⌝;
dest_monomial⌜a * b:ℝ⌝;
dest_monomial⌜~b:ℝ⌝;
dest_monomial⌜b:ℝ⌝;
=TEX
Given a partial mapping of variable numbers to HOL terms and
a term comprising a sum of scaled monomials, the following
function computes the corresponding polynomial for $lin\_arith\_contr$
together with an updated mapping (for feeding into later sums).
=SML
fun ⦏make_poly⦎ (vm : VAR_MAP) (tm : TERM) : VAR_MAP * POLY = (
	let	val summands = map dest_monomial (strip_ℝ_plus tm);
		fun aux res [] = res
		|   aux (vm, p) ((c, t)::more) = (
			let	val (i, vm') = establish t vm;
			in	aux (vm', (c, i)::p) more
			end
		);
	in	aux (vm, []) summands
	end
);
=IGN
val vm = vm0;
val tm10 = ⌜x*y + ℕℝ 1*a + ~(ℕℝ 3)*b⌝;
val tm11 = ⌜ℕℝ 9 * x*y + ℕℝ 6*a + ~(ℕℝ 7)*b⌝;
val (vm1, p) = make_poly vm tm10;
val (vm2, p) = make_poly vm1 tm11;
=TEX
The following function makes a constraint for $lin\_arith\_contr$,
from a term and an index value.
A dummy constraint is produced if the term is not
in the appropriate form.

=SML
fun ⦏make_constraint⦎ (vm : VAR_MAP) (ind : int) (tm : TERM) : VAR_MAP * CONSTRAINT = (
	let	val ((rel, lhs), rhs) =
			((dest_app ** Combinators.I) o dest_app)tm;
		val tipe = (
			case fst(dest_const rel) of
				"=" => Eq
			|	"≤⋎R" => LessEq
			|	"<⋎R" => Less
			|	_ => fail "make_constraint" 0 []
		);
		val (vm', p) = make_poly vm lhs;
		val (r, _) = dest_coefficient rhs;
	in	(vm', (p, tipe,  r, [(one, ind)]))
	end	handle Fail _ =>
		(vm, ([], Eq, zero, []))
);
=TEX
The following function makes the constraints for $lin\_arith\_contr$,
from a list of terms. The labels on the polynomials are the indices
into the list starting from 0 (i.e., in the sense of {\tt nth}).
=SML
fun ⦏make_constraints⦎ (tms : TERM list) : CONSTRAINT list = (
	let	val acc0 : int * VAR_MAP * CONSTRAINT list = (0, {next = 1, table = []}, []);
		fun aux (_, _, res) [] = res
		|   aux (i, vm, cs) (tm::more) = (
			let	val (vm', c) = make_constraint vm i tm;
			in	aux (i+1, vm', c::cs) more
			end
		);
	in	aux acc0 tms
	end
);
=IGN
make_constraints [
	⌜a + b ≤ ℕℝ 0⌝,
	⌜~(ℕℝ 4)*a ≤ ℕℝ 99⌝,
	⌜~b  + (ℕℝ 52)*a = ~(ℕℝ 1)⌝
];
=TEX
\subsection{Putting the results together}
=SML
fun ⦏make_actual_thm⦎ (p : POLY) (thl : THM list) : THM = (
	let	fun aux acc [] = acc
		|   aux acc ((c, ind)::more) = aux ((c, nth ind thl)::acc) more;
		val aths = aux [] p;
	in	scaled_sum_rule aths
	end
);
=TEX
\subsection{The Linear Arithmetic Rule}
The following auxiliary function may raise various exceptions that
its caller must catch:
=SML
fun ⦏ℝ_lin_arith_rule_aux⦎ (thl : THM list) : THM = (
	let	val tml = map concl thl;
		val constraints = make_constraints tml drop
			(fn ([], _, _, _) => true | _ => false);
		val p =	(lin_arith_contr constraints);
	in	make_actual_thm p thl
	end
);
=IGN
val tms1 = [
	⌜a ≤ ℕℝ 0⌝,
	⌜~a ≤ ~(ℕℝ 1)⌝,
	⌜T⌝
];
ℝ_lin_arith_rule_aux (map asm_rule tms1);
val tms2 = [
	⌜a + b = ℕℝ 0⌝,
	⌜ℕℝ 2*a = ℕℝ 1⌝,
	⌜ℕℝ 2*b = ℕℝ 1⌝
];
ℝ_lin_arith_rule_aux (map asm_rule tms2);
=TEX
=SML
fun ⦏ℝ_lin_arith_rule⦎ (tml : TERM list) : THM = (
	let	val thl = map asm_rule tml;
		fun aux acc [] = acc
		|   aux acc (th :: more) = (
			aux (to_ℤ_rule th::acc) more
			handle Fail _ => aux acc more
		);
	in	ℝ_lin_arith_rule_aux (aux [] thl)
	end	handle Fail _ => fail "ℝ_lin_arith_rule" 116341 []
);
=IGN
=IGN
val tms3 = [
	⌜a ≤ ℕℝ 0⌝,
	⌜~b ≤ ~(ℕℝ 1)⌝,
	⌜T⌝,
	⌜~a + b ≤ ~(ℕℝ 2)⌝,
	⌜T⌝
];
val tms4 = [
	⌜(1/2)*a ≤ ℕℝ 0⌝,
	⌜~(4/5)*a ≤ ~(5/6)⌝,
	⌜T⌝
];
val tms5 = [
	⌜(1/2)*a = ℕℝ 1⌝,
	⌜~(2/5)*b ≤ ~(7/6)⌝,
	⌜~a + b ≤ (1/100)⌝,
	⌜T⌝
];
val tms6 = [⌜a ≤ 1 / 2⌝,⌜~ a ≤ ~ (3 / 4)⌝,⌜T⌝];
val tms7 = [
	⌜a + ~b ≤ ~(ℕℝ 1)⌝,
	⌜(1/2)*b + ~ (1/2)*c ≤ ℕℝ 0⌝,
	⌜(7/6)*c + ~ (7/6)*d ≤ ℕℝ 0⌝,
	⌜d + ~ a ≤ ℕℝ 0⌝,
	⌜T⌝
];
val tms7 = [
	⌜a + ~b < ~(ℕℝ 1)⌝,
	⌜(1/2)*b + ~ (1/2)*c ≤ ℕℝ 0⌝,
	⌜(7/6)*c + ~ (7/6)*d ≤ ℕℝ 0⌝,
	⌜d + ~ a ≤ ℕℝ 0⌝,
	⌜T⌝
];
val tms8 = [
	⌜a + ~b < ~(ℕℝ 1)⌝,
	⌜(1/2)*b + ~ (1/2)*c ≤ ℕℝ 0⌝,
	⌜(7/6)*c + ~ (7/6)*d = ℕℝ 0⌝,
	⌜(ℕℝ 99)*d + ~ (ℕℝ 99)*e < ℕℝ 0⌝,
	⌜e + ~ a = ℕℝ 0⌝,
	⌜T⌝
];
val tms9 = [
	⌜~ a * a ≤ ℕℝ 0⌝,
	⌜~ b * b ≤ ℕℝ 0⌝,
	⌜a * a + b * b < ℕℝ 0⌝,
	⌜T⌝
];
ℝ_lin_arith_rule tms1;
ℝ_lin_arith_rule tms2;
ℝ_lin_arith_rule tms3;
ℝ_lin_arith_rule tms4;
ℝ_lin_arith_rule tms5;
ℝ_lin_arith_rule tms6;
ℝ_lin_arith_rule tms7;
ℝ_lin_arith_rule tms8;
ℝ_lin_arith_rule tms9;
=TEX
=SML
val ⦏ℝ_lin_arith_tac⦎ : TACTIC = (fn gl =>
	(GET_ASMS_T (f_thm_tac o ℝ_lin_arith_rule o map concl) gl)
	handle ex => reraise ex "ℝ_lin_arith_tac"
);
=TEX
Now the tactic which is the automatic proof tactic.
(Note error message number 82200 is generic enough for us to use here).
=SML
val ⦏ℝ_lin_arith_prove_tac⦎ : THM list -> TACTIC = (fn thl => fn gl =>
	((	DROP_ASMS_T (MAP_EVERY strip_asm_tac)
	THEN	MAP_EVERY  strip_asm_tac thl
	THEN	contr_tac
	THEN	ℝ_lin_arith_tac) gl)
	handle	Fail msg => fail "ℝ_lin_arith_prove_tac" 82200
			[(fn () =>get_message msg),
			 (fn () => string_of_term (snd gl))]
);
=TEX
and the associated conversion:
=SML
val ⦏ℝ_lin_arith_prove_conv⦎ : THM list -> CONV = (fn thl => fn tm =>
	let	val th = tac_proof(([], tm), ℝ_lin_arith_prove_tac thl);
	in	⇔_t_intro  th
	end	handle ex => reraise ex "ℝ_lin_arith_prove_conv"
);
=IGN

=TEX
\section{OTHER RULES}
=TEX
=SML
val ⦏ℝ_eq_cancel_conv_lemma⦎ = (
set_goal([], ⌜∀c x:ℝ⦁ c + x = ℕℝ 0 ⇔ x = ~c⌝);
a(REPEAT ∀_tac);
a(conv_tac (RIGHT_C (once_rewrite_conv[ℝ_eq_thm])));
a(asm_rewrite_tac[ℝ_minus_clauses, ∀_elim⌜x⌝ℝ_plus_order_thm]);
pop_thm()
);
=TEX
=SML
fun ⦏check_lhs⦎ (dest : TERM -> TERM * TERM) (tm : TERM) = (
	let	val c = fst(dest_ℝ_plus(fst(dest tm)));
	in	(dest_coefficient c; true) handle Fail _ =>  false
	end	handle Fail _ => false
);
val ⦏ℝ_eq_cancel_conv_aux⦎ = (
	simple_eq_match_conv ℝ_eq_thm THEN_TRY_C
	LEFT_C ℝ_anf_conv THEN_C
	COND_C	(check_lhs dest_eq)
		(simple_eq_match_conv ℝ_eq_cancel_conv_lemma THEN_TRY_C RIGHT_C ℝ_anf_conv)
		id_conv	
);
val ⦏ℝ_eq_cancel_conv⦎ = (fn tm =>
	CHANGED_C ℝ_eq_cancel_conv_aux tm
	handle Fail _ => term_fail "ℝ_eq_cancel_conv" 116520 [tm]
);
=IGN
ℝ_eq_cancel_conv⌜x + 1/2 = y⌝;
ℝ_eq_cancel_conv⌜1/2 = y⌝;
ℝ_eq_cancel_conv⌜1/2 = 1/2⌝;
ℝ_eq_cancel_conv⌜1/2 = ℕℝ 0⌝;
ℝ_eq_cancel_conv⌜ℕℝ 0 = ℕℝ 0⌝;
=TEX
=SML
val ⦏ℝ_≤_cancel_conv_lemma⦎ = (
set_goal([], ⌜∀c x:ℝ⦁ c + x ≤ ℕℝ 0 ⇔ x ≤ ~c⌝);
a(REPEAT ∀_tac);
a(conv_tac (RIGHT_C (once_rewrite_conv[ℝ_≤_≤_0_thm])));
a(asm_rewrite_tac[ℝ_minus_clauses, ∀_elim⌜x⌝ℝ_plus_order_thm]);
pop_thm()
);
=TEX
=SML
val ⦏ℝ_≤_cancel_conv_aux⦎ = (
	simple_eq_match_conv ℝ_≤_≤_0_thm THEN_TRY_C
	LEFT_C ℝ_anf_conv THEN_C
	COND_C	(check_lhs dest_ℝ_≤)
		(simple_eq_match_conv ℝ_≤_cancel_conv_lemma THEN_TRY_C RIGHT_C ℝ_anf_conv)
		id_conv	
);
val ⦏ℝ_≤_cancel_conv⦎ = (fn tm =>
	CHANGED_C ℝ_≤_cancel_conv_aux tm
	handle Fail _ => term_fail "ℝ_≤_cancel_conv" 116521 [tm]
);
=IGN
ℝ_≤_cancel_conv⌜x + 1/2 ≤ y⌝;
ℝ_≤_cancel_conv⌜1/2 ≤ y⌝;
ℝ_≤_cancel_conv⌜1/2 ≤ 1/2⌝;
ℝ_≤_cancel_conv⌜1/2 ≤ ℕℝ 0⌝;
ℝ_≤_cancel_conv⌜ℕℝ 0 ≤ ℕℝ 0⌝;
=TEX
=SML
val ⦏ℝ_less_cancel_conv_lemma⦎ = (
set_goal([], ⌜∀c x:ℝ⦁ c + x < ℕℝ 0 ⇔ x < ~c⌝);
a(REPEAT ∀_tac);
a(conv_tac (RIGHT_C (once_rewrite_conv[ℝ_less_less_0_thm])));
a(asm_rewrite_tac[ℝ_minus_clauses, ∀_elim⌜x⌝ℝ_plus_order_thm]);
pop_thm()
);
=TEX
=SML
val ⦏ℝ_less_cancel_conv_aux⦎ = (
	simple_eq_match_conv ℝ_less_less_0_thm THEN_TRY_C
	LEFT_C ℝ_anf_conv THEN_C
	COND_C	(check_lhs dest_ℝ_less)
		(simple_eq_match_conv ℝ_less_cancel_conv_lemma THEN_TRY_C RIGHT_C ℝ_anf_conv)
		id_conv	
);
val ⦏ℝ_less_cancel_conv⦎ = (fn tm =>
	CHANGED_C ℝ_less_cancel_conv_aux tm
	handle Fail _ => term_fail "ℝ_less_cancel_conv" 116522 [tm]
);
=IGN
ℝ_less_cancel_conv⌜x + 1/2 < y⌝;
ℝ_less_cancel_conv⌜1/2 < y⌝;
ℝ_less_cancel_conv⌜1/2 < 1/2⌝;
ℝ_less_cancel_conv⌜1/2 < ℕℝ 0⌝;
ℝ_less_cancel_conv⌜ℕℝ 0 < ℕℝ 0⌝;
=TEX
\subsection{Linear Arithmetic Proof Context}
The equational contexts required are the same for stripping goals and stripping
theorems. We take numeric $=$, $<$ and $≤$ as the atomic
predicates which we will deal with. The possibilities are:
{\em(i)} put the a ground atomic predicate into normal form with the appropriate canncellation conversion;
{\em(ii)} convert a negated atomic predicate into an atomic one;
{\em(iii)} convert a predicate formed with $<$, $≥$ or $>$ into an atomic one;
{\em(iv)} convert the negation of a predicate formed with $<$, $≥$ or $>$ into an atomic one;
and
{\em(v)} attempt to evaluate ground inequalities.
=SML
val ⦏ℝ_¬_eq_thm⦎ = (
set_goal([], ⌜∀x y:ℝ⦁ ¬x = y ⇔ x < y ∨ y < x⌝);
a(REPEAT ∀_tac);
a(rewrite_tac[ℝ_eq_≤_thm, taut_rule⌜∀p q⦁¬(p ∧ q) ⇔ ¬p ∨ ¬ q⌝, ℝ_¬_≤_less_thm]);
a(REPEAT strip_tac);
pop_thm()
);
=TEX
The following is a little bit more leisurely than the natural numbers versions;
it does the conversion into atomic predicates in easy stages.
=SML
val strip_cxt = [

	(⌜(x:ℝ) = y⌝, ℝ_eq_conv),
	(⌜(x:ℝ) ≤ y⌝, ℝ_≤_conv),
	(⌜(x:ℝ) < y⌝, ℝ_less_conv),

	(⌜¬(x:ℝ) = y⌝, simple_eq_match_conv ℝ_¬_eq_thm),
	(⌜¬(x:ℝ) ≤ y⌝, simple_eq_match_conv ℝ_¬_≤_less_thm),
	(⌜¬(x:ℝ) < y⌝, simple_eq_match_conv ℝ_¬_less_≤_thm),

	(⌜(x:ℝ) ≥ y⌝, ℝ_≥_conv),
	(⌜(x:ℝ) > y⌝, ℝ_greater_conv),
	(⌜¬ (x:ℝ) ≥ y⌝, RAND_C ℝ_≥_conv),
	(⌜¬ (x:ℝ) > y⌝, RAND_C ℝ_greater_conv),

	(⌜(x:ℝ) = y⌝, ℝ_eq_cancel_conv),
	(⌜(x:ℝ) ≤ y⌝, ℝ_≤_cancel_conv),
	(⌜(x:ℝ) < y⌝, ℝ_less_cancel_conv)
];
=IGN
map (fn (t, c) => TRY_C c t) strip_cxt;
=TEX
=SML
val _ = delete_pc "'ℝ_lin_arith" handle Fail _ => ();
val _ = new_pc ⦏"'ℝ_lin_arith"⦎;
val _ = set_rw_eqn_cxt strip_cxt "'ℝ_lin_arith";
val _ = set_st_eqn_cxt strip_cxt "'ℝ_lin_arith";
val _ = set_sc_eqn_cxt strip_cxt "'ℝ_lin_arith";
val _ = set_pr_tac ℝ_lin_arith_prove_tac "'ℝ_lin_arith";
val _ = set_pr_conv ℝ_lin_arith_prove_conv "'ℝ_lin_arith";
val _ = commit_pc "'ℝ_lin_arith";
=TEX
=SML
val _ = delete_pc "ℝ_lin_arith" handle Fail _ => ();
val _ = new_pc ⦏"ℝ_lin_arith"⦎;
val _ = merge_pcs ["predicates","'ℝ_lin_arith"] "ℝ_lin_arith";
val _ = commit_pc "ℝ_lin_arith";
=TEX
=IGN
map (PC_C1 "ℝ_lin_arith" rewrite_conv[]) [
	⌜ℕℝ 1 = ℕℝ 2⌝, ⌜ℕℝ 3 ≤ ℕℝ 2⌝, ⌜ℕℝ 2 = ℕℝ 2⌝, ⌜ℕℝ 1 ≤ ℕℝ 2⌝
,	⌜a + b = b + a + ℕℝ 1⌝, ⌜a + ℕℝ 20 + b = (a+ ℕℝ 10)+(b+ ℕℝ 10)⌝
,	⌜a + b ≤ b + a - ℕℝ 1⌝, ⌜a + ℕℝ 20 + b ≤ (a+ ℕℝ 14)+(b+ ℕℝ 10)⌝
,	⌜¬ℕℝ 10 = ℕℝ 20⌝, ⌜¬(a:ℝ) + b = b + a⌝
,	⌜¬ℕℝ 10 ≤ ℕℝ 20⌝, ⌜¬(a:ℝ) + b ≤ b + a⌝
,	⌜ℕℝ 10 < ℕℝ 20⌝, ⌜(a:ℝ) + b ≥ b + a⌝, ⌜(a:ℝ) + b > b + a⌝
,	⌜¬ℕℝ 10 < ℕℝ 20⌝, ⌜¬(a:ℝ) + b ≥ b + a⌝, ⌜¬(a:ℝ) + b > b + a⌝
,	⌜(a:ℝ +b)*(a-b) = a*a - b*b⌝, ⌜(a:ℝ +b)*(a-b) = a*a - b*b ⌝
,	⌜¬10/1001 < 9/900⌝, ⌜¬(3/4)*(a + b) ≥ b + a⌝, ⌜¬(a:ℝ) + b > 1/2 + a⌝
];
map (PC_C1 "ℝ_lin_arith" prove_rule[]) [
	⌜a*a ≥ ℕℝ 0 ∧ b*b ≥ ℕℝ 0 ⇒ (a+b)*(a+b) ≥ ℕℝ 2 * a * b⌝
];
map (PC_C1 "ℝ_lin_arith" prove_rule[]) [
	⌜a*a ≥ ℕℝ 0 ∧ b*b ≥ ℕℝ 0 ⇒ (1/2)*(a+b)*(a+b) ≥ a * b⌝
];
=TEX
\subsection{Quantifier Elimination Procedure for Linear Arithmetic}
=TEX
=TEX
We implement the quantifier elimination algorithm of Hodes-Fourier-Motzkin.

In the Fourier-Motzkin step, it is convenient to collect together the upper and lower bounds for the bound variable we are eliminating using the max and min functions for lists of reals.
Then the variable can be eliminated using a single theorem and the remaining inequality betwwen max and min values can be recast as a list of inequalities.
Our first step is to prove the lemmas that justify the conversion to and from the form with max an d nmin.
=SML
val ⦏ℝ_max_less_thm⦎ = (* save_thm *) snd ("ℝ_max_less_thm", (
set_goal([], ⌜
	(∀x y z⦁ y < x ∧ z < x ⇔ Max⋎R[y; z] < x)
∧	(∀x y z L⦁ y < x ∧ Max⋎R (Cons z L) < x ⇔ Max⋎R (Cons y (Cons z L)) < x)⌝);
a(rewrite_tac[ℝ_max_def] THEN ∧_tac THEN REPEAT ∀_tac);
a(cases_tac⌜y < z⌝ THEN asm_rewrite_tac[] THEN PC_T1 "ℝ_lin_arith" asm_prove_tac[]);
(* *** Goal "2" *** *)
a(cases_tac⌜y < Max⋎R (Cons z L)⌝ THEN asm_rewrite_tac[] THEN PC_T1 "ℝ_lin_arith" asm_prove_tac[]);
pop_thm()
));
(*
=TEX
=SML
*)
val ⦏ℝ_max_less_thm1⦎ = (* save_thm *) snd("ℝ_max_less_thm1",
	conv_rule(ONCE_MAP_C eq_sym_conv) ℝ_max_less_thm);
(*
=TEX
=SML
*)
val ⦏ℝ_less_min_thm⦎ = (* save_thm *) snd("ℝ_less_min_thm", (
set_goal([], ⌜
	(∀x y z⦁ x < y ∧ x < z ⇔ x < Min⋎R[y; z])
∧	(∀x y z L⦁ x < y ∧ x < Min⋎R (Cons z L) ⇔ x < Min⋎R (Cons y (Cons z L)))⌝);
a(rewrite_tac[ℝ_min_def] THEN ∧_tac THEN REPEAT ∀_tac);
a(cases_tac⌜y > z⌝ THEN asm_rewrite_tac[] THEN PC_T1 "ℝ_lin_arith" asm_prove_tac[]);
(* *** Goal "2" *** *)
a(cases_tac⌜y > Min⋎R (Cons z L)⌝ THEN asm_rewrite_tac[] THEN PC_T1 "ℝ_lin_arith" asm_prove_tac[]);
pop_thm()
));
(*
=TEX
=SML
*)
val ⦏ℝ_less_min_thm1⦎ = (* save_thm *) snd("ℝ_less_min_thm1",
	conv_rule(ONCE_MAP_C eq_sym_conv) ℝ_less_min_thm);
(*
=TEX
Now the theorem that justifies eliminating the bound variable: in action $y$ and $z$ will be the maximum (resp. minimum) of the list of lower (resp. upper) bounds for $x$.
=SML
*)
val ⦏ℝ_∃_elim_thm⦎ = (* save_thm *) snd ("ℝ_∃_elim_thm", (
set_goal([], ⌜ ∀y z:ℝ⦁ (∃x⦁ y < x ∧ x < z) ⇔ y < z ⌝);
a(REPEAT strip_tac THEN1 PC_T1 "ℝ_lin_arith" asm_prove_tac[]);
a(∃_tac⌜(1/2)*(y + z)⌝ THEN PC_T1 "ℝ_lin_arith" asm_prove_tac[]);
pop_thm()
));
(*
=TEX
=SML
*)
(*
=TEX
Given a real sum,
$a + b + c + d$
, the following conversion finds an operand with a given property, e.g., $c$
and ripples it up to the top:
$c + a + b + d$.
Takes care to fail if nothing to do.
N.b., if say $c + d$ satisfies the property, then the result will be $(c + d) + a + b$, so it is caller's responsibility to supply a property that rejects $c+ d$ if that is not the behaviour wanted.
=SML
*)
val ⦏ℝ_find_in_sum_conv⦎ : (TERM -> bool) -> CONV =
let	val comm_thm = pc_rule1 "ℝ_lin_arith" prove_rule[]
		 ⌜∀x y:ℝ ⦁ x + y = y + x⌝;
	val bubble_thm = pc_rule1 "ℝ_lin_arith" prove_rule[]
		 ⌜∀x y z:ℝ⦁ x + y + z = y + x + z⌝;
	val comm_conv = simple_eq_match_conv comm_thm;
	val bubble_conv = simple_eq_match_conv bubble_thm;
	fun aux_conv first test tm = (
		let	val (a, b) = dest_ℝ_plus tm;
		in	if	test a
			then	if	first
				then	fail_conv tm
				else	refl_conv tm
			else if	test b
			then	comm_conv tm
			else	(RIGHT_C (aux_conv false test) THEN_C bubble_conv) tm
		end
	);
in	aux_conv true
end;
(*
=TEX
Given a term of type ℝ, the following converts into the form
$c*y$ or $c*y+z$ where $c$ is a real literal if it does not already have that form.
It does not fail if there is nothing to do.
=SML
*)
val ⦏mk_ℝ_times_conv⦎ : CONV =
let	val rw = simple_eq_match_conv o
		pc_rule1 "ℝ_lin_arith" prove_rule [];
	fun non_prod t = (
		not (is_ℝ_times t)andalso
		(not (is_ℝ_times(fst(dest_ℝ_plus t))))
		handle Fail _ => true
	);
	val convs = map rw [
		⌜∀x y:ℝ⦁ ~x + y = ~(ℕℝ 1) * x + y⌝,
		⌜∀x y:ℝ⦁ x + y = (ℕℝ 1) * x + y⌝,
		⌜∀x:ℝ⦁ ~x = ~(ℕℝ 1) * x⌝,
		⌜∀x:ℝ⦁ x = ℕℝ 1 * x⌝];
in	 COND_C non_prod (FIRST_C convs) id_conv
end;
(*
=TEX
If we have an equation rather than a bound for the variable we use it as a definition making use o f the following lemma to multiply up by the reciprocal of the coefficient.
=SML
*)
val ⦏ℝ_mk_defn_thm⦎ : THM = (
set_goal([],⌜
	∀x⦁(x = ℕℝ 0 ⇔ F) ⇒
	∀y z⦁y = z ⇔ x ⋏-⋏1 * y = x ⋏-⋏1 * z⌝);
a(REPEAT strip_tac THEN1 asm_rewrite_tac[]);
a(LEMMA_T ⌜x * x ⋏-⋏1 * y = x * x ⋏-⋏1 * z⌝ ante_tac THEN1
		asm_rewrite_tac[]);
a(rewrite_tac[ℝ_times_assoc_thm1] THEN
		ALL_FC_T asm_rewrite_tac[ℝ_recip_clauses]);
pop_thm()
);
(*
=TEX
The following conversion is given an equation involving the variable, $x$, say, that we are trying to eliminate, and, returns a theorem of the form saying the equation is equivalent to one of the form $x = t$.
=SML
*)
val ⦏ℝ_mk_defn_conv⦎ : TERM -> CONV =
let	val rw = simple_eq_match_conv o
		pc_rule1 "ℝ_lin_arith" prove_rule [];
	val to_rhs_conv = FIRST_C [
		rw ⌜∀x y z:ℝ⦁ x + y = z ⇔ x = ~y + z⌝,
		id_conv];
	val ℝ_0 = ⌜ℕℝ 0⌝;
in	fn x => fn tm =>
	let	val test = (not o is_ℝ_plus) fun_and is_free_in x;
		val thm1 = (TRY_C (LEFT_C (ℝ_find_in_sum_conv test))
			THEN_C LEFT_C mk_ℝ_times_conv
			THEN_C to_rhs_conv) tm;
		val (lhs, rhs) = dest_eq(snd(dest_eq(concl thm1)));
		val (c, v) = dest_ℝ_times lhs;
		val thm2 = ∀_elim c ℝ_mk_defn_thm;
		val eq = fst(dest_eq(fst(dest_⇒(concl thm2))));
		val thm3 = ℝ_eq_conv eq;
		val thm4 = ⇒_mp_rule thm2 thm3;
		val thm5 = list_∀_elim[lhs, rhs] thm4;
		val thm6 = conv_rule (RIGHT_C (RANDS_C (TRY_C ℝ_anf_conv))) thm5;
		val thm7 = eq_trans_rule thm1 thm6;
	in	if	v = x
		then	thm7
		else	fail_conv tm
	end
end;
(*
=TEX
The following two theorems justify scaling an inequality.
=SML
*)
val ⦏ℝ_mk_bound_thm1⦎ : THM = (
set_goal([], ⌜∀x⦁(ℕℝ 0 < x ⇔ T) ⇒
	∀y z⦁y < z ⇔ x ⋏-⋏1 * y < x ⋏-⋏1 * z⌝);
a(REPEAT ∀_tac THEN strip_tac);
a(lemma_tac⌜¬x = ℕℝ 0⌝ THEN1 PC_T1 "ℝ_lin_arith" asm_prove_tac[]);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(bc_thm_tac ℝ_times_mono_thm THEN REPEAT strip_tac);
a(bc_thm_tac ℝ_0_less_0_less_recip_thm THEN REPEAT strip_tac);
(* *** Goal "2" *** *)
a(LEMMA_T ⌜x * x ⋏-⋏1 * y < x * x ⋏-⋏1 * z⌝ ante_tac THEN1
	(bc_thm_tac ℝ_times_mono_thm THEN REPEAT strip_tac));
a(rewrite_tac[ℝ_times_assoc_thm1] THEN
		ALL_FC_T asm_rewrite_tac[ℝ_recip_clauses]);
pop_thm()
);
(*
=TEX
=SML
*)
val ⦏ℝ_mk_bound_thm2⦎ : THM = (
set_goal([], ⌜∀x⦁(ℕℝ 0 < ~x ⇔ T) ⇒
	∀y z⦁y < z ⇔ x ⋏-⋏1 * z < x ⋏-⋏1 * y⌝);
a(REPEAT ∀_tac THEN strip_tac);
a(lemma_tac⌜¬x = ℕℝ 0⌝ THEN1 PC_T1 "ℝ_lin_arith" asm_prove_tac[]);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(ALL_FC_T1 fc_⇔_canon once_rewrite_tac[ℝ_times_mono_⇔_thm]);
a(rewrite_tac[ℝ_times_assoc_thm1]
	THEN rewrite_tac[ℝ_times_minus_thm]);
a((ALL_FC_T rewrite_tac[ℝ_recip_clauses] THEN
		PC_T1 "ℝ_lin_arith" asm_prove_tac[]));
(* *** Goal "2" *** *)
a(LEMMA_T ⌜~x * x ⋏-⋏1 * z < ~x * x ⋏-⋏1 * y⌝ ante_tac THEN1
	(bc_thm_tac ℝ_times_mono_thm THEN REPEAT strip_tac));
a(rewrite_tac[ℝ_times_assoc_thm1]
	THEN rewrite_tac[ℝ_times_minus_thm]);
a(ALL_FC_T asm_rewrite_tac[ℝ_recip_clauses]);
a(PC_T1 "ℝ_lin_arith" prove_tac[]);
pop_thm()
);
(*
=TEX
The following conversion is given an inequality and scales and rearranges it to give an equivalent inequality with the variable specified on its own on one side.
=SML
*)
val ⦏ℝ_mk_bound_conv⦎ : TERM -> CONV =
let	val rw = simple_eq_match_conv o
			pc_rule1 "ℝ_lin_arith" prove_rule [];
	val to_rhs_conv = FIRST_C [
		rw ⌜∀x y z:ℝ⦁ x + y < z ⇔ x < ~y + z⌝,
		id_conv];
	val ℝ_0 = ⌜ℕℝ 0⌝;
in	fn x => fn tm =>
	let	val test = (not o is_ℝ_plus) fun_and is_free_in x;
		val thm1 = (TRY_C (LEFT_C (ℝ_find_in_sum_conv test))
			THEN_C LEFT_C mk_ℝ_times_conv
			THEN_C to_rhs_conv) tm;
		val (lhs, rhs) = dest_ℝ_less(snd(dest_eq(concl thm1)));
		val (c, v) = dest_ℝ_times lhs;
		val (ℝ_mk_bound_thm, conv) =
			if	is_ℝ_minus c
			then	(ℝ_mk_bound_thm2, ℝ_anf_conv)
			else (ℝ_mk_bound_thm1, id_conv);
		val thm2 = ∀_elim c ℝ_mk_bound_thm;
		val ineq = fst(dest_eq(fst(dest_⇒(concl thm2))));
		val thm3 = (RIGHT_C conv THEN_C ℝ_less_conv) ineq;
		val thm4 = ⇒_mp_rule thm2 thm3;
		val thm5 = list_∀_elim[lhs, rhs] thm4;
		val thm6 = conv_rule (RIGHT_C (RANDS_C (TRY_C ℝ_anf_conv))) thm5;
		val thm7 = eq_trans_rule thm1 thm6;
	in	if	v = x
		then	thm7
		else	fail_conv tm
	end
end;
(*
=TEX
=SML
*)
(*
=TEX
The following conversion does the quantifier elimination in the  case where the list of constraints contains an equation.
=SML
*)
val ⦏ℝ_one_point_qep_conv⦎ : CONV = (fn tm =>
	let	val (x, _) = dest_simple_∃ tm;
	in	QUANT_C (
		(find_in_∧_conv is_eq AND_OR_C LEFT_C (ℝ_mk_defn_conv x))
		ORELSE_C ℝ_mk_defn_conv x)
		THEN_C simple_one_point_conv
	end	tm
);
(*
=TEX
=SML
*)
val ⦏max_intro_thm1⦎ : THM = ∧_left_elim ℝ_max_less_thm;
val ⦏max_intro_thm2⦎ : THM = ∧_right_elim ℝ_max_less_thm;
val ⦏min_intro_thm1⦎ : THM = ∧_left_elim ℝ_less_min_thm;
val ⦏min_intro_thm2⦎ : THM = ∧_right_elim ℝ_less_min_thm;
val ⦏max_elim_thm1⦎ : THM = ∧_left_elim ℝ_max_less_thm1;
val ⦏max_elim_thm2⦎ : THM = ∧_right_elim ℝ_max_less_thm1;
val ⦏min_elim_thm1⦎ : THM = ∧_left_elim ℝ_less_min_thm1;
val ⦏min_elim_thm2⦎ : THM = ∧_right_elim ℝ_less_min_thm1;
val ⦏∃_elim_thm1⦎ = prove_rule[ℝ_unbounded_below_thm]⌜ ∀y:ℝ⦁ (∃x⦁ x < y) ⇔ T⌝;
val ⦏∃_elim_thm2⦎ = prove_rule[ℝ_unbounded_above_thm]⌜ ∀y:ℝ⦁ (∃x⦁ y < x) ⇔ T⌝;
(*
=TEX
Now the conversion that does the Fourier-Motzkin step in the case where there are no equations constraining the bound variable, i.e., it is constrained by a set of upper and/or lower bounds.

The logic of the local function {\em max\_min\_intro\_conv} proved a bit tricky to get right.
The problem is that you to deal with all combinations of 0, 1 or many lower bounds and 0, 1 or many upper bounds.
=SML
*)
val ⦏ℝ_fourier_motzkin_conv⦎ : CONV = (fn tm =>
let	val (x, _) = dest_simple_∃ tm;
	fun is_lwb t = (
		snd(dest_ℝ_less t) = x handle Fail _ => false
	);
	fun gen_intro_conv thm1 thm2 : CONV = (fn tm =>
		let	val (_, b) = dest_∧ tm;
		in	if	is_∧ b
			then	(RIGHT_C (gen_intro_conv thm1 thm2)
				THEN_C simple_eq_match_conv thm2) tm
			else	simple_eq_match_conv thm1 tm
		end	handle	Fail _ => id_conv tm
	);
	val max_intro_conv : CONV =
		gen_intro_conv
		max_intro_thm1
		max_intro_thm2;
	val min_intro_conv : CONV =
		gen_intro_conv
		min_intro_thm1
		min_intro_thm2;
	val max_min_intro_conv : CONV = (fn tm =>
		let	val (ls, rs) = dest_∧ tm;
			val l1 = fst(dest_∧ ls) handle Fail _ => ls;
			val r1 = fst(dest_∧ rs) handle Fail _ => rs;
		in	if	is_lwb r1
			then	max_intro_conv
			else if	not(is_lwb l1)
			then	min_intro_conv
			else	LEFT_C max_intro_conv
				THEN_C RIGHT_C min_intro_conv
		end	tm
	);
	val ∃_elim_conv = FIRST_C (map simple_eq_match_conv [
		ℝ_∃_elim_thm,
		∃_elim_thm1,
		∃_elim_thm2]);
	val rec max_min_elim_conv : CONV = (fn tm =>
		(FIRST_C (ℝ_less_conv::
			map simple_eq_match_conv [
			max_elim_thm1, max_elim_thm2,
			min_elim_thm1, min_elim_thm2]) THEN_TRY_C
			PROP_ATOM_C max_min_elim_conv) tm
	);
in	(QUANT_C (
		PROP_ATOM_C (ℝ_mk_bound_conv x) AND_OR_C
		split_∧_conv is_lwb THEN_TRY_C
		max_min_intro_conv) THEN_C
	∃_elim_conv THEN_TRY_C
	max_min_elim_conv THEN_TRY_C
	prop_simp_conv) tm
end);
(*
=TEX
The following function puts literals in the first-order language of the reals in a normal form involving only $=$ and $<$ with the left-hand operands in arithmetic normal form with no constant term and the right-hand operands constant.
=SML
*)
val ⦏ℝ_normalise_lit_conv⦎ : CONV = CHANGED_C(
	FIRST_THEN_C
	(map ((simple_eq_match_conv o
		pc_rule1 "ℝ_lin_arith" prove_rule[]) ** (fn x=>x)) [
	(⌜∀x y:ℝ⦁ x ≤ y ⇔ x < y ∨ x = y⌝, RANDS_C),
	(⌜∀x y:ℝ⦁ x ≥ y ⇔ y < x ∨ x = y⌝, RANDS_C),
	(⌜∀x y:ℝ⦁ x > y ⇔ y < x⌝, ID_C),
	(⌜∀x y:ℝ⦁ ¬x ≤ y ⇔ y < x⌝, ID_C),
	(⌜∀x y:ℝ⦁ ¬x ≥ y ⇔ x < y⌝, ID_C),
	(⌜∀x y:ℝ⦁ ¬x > y ⇔ x < y ∨ x = y⌝, RANDS_C),
	(⌜∀x y:ℝ⦁ ¬x < y ⇔ y < x ∨ x = y⌝, RANDS_C),
	(⌜∀x y:ℝ⦁ ¬x = y ⇔ y < x ∨ x < y⌝, RANDS_C)] @
	[(ℝ_eq_cancel_conv, ID_C), (ℝ_less_cancel_conv, ID_C)] @
	map ((simple_eq_match_conv o
		pc_rule1 "ℝ_lin_arith" prove_rule[]) ** (fn x=>x)) [
	(⌜∀x y:ℝ⦁ ~x = ~y ⇔ x = y⌝, ID_C),
	(⌜∀x y:ℝ⦁ ~x < ~y ⇔ y < x⌝, ID_C)])
);
(*
=TEX
The following eliminates one innermost quantifier.
=SML
*)

val ⦏ℝ_lin_qep_step_conv⦎ = (FIRST_THEN_C [
	(∃⋎1_conv, (fn c => QUANT_C(PROP_ATOM_C (QUANTS_C c)) THEN_C c)),
	(∃_uncurry_conv, QUANTS_C),
	(∀_uncurry_conv, QUANTS_C),
	(simple_∀_¬_∃_¬_conv, RAND_C),
	(MAP_C pair_eq_conv, ID_C),
	(QUANT_C (PROP_LIT_C ℝ_normalise_lit_conv), ID_C),
	(QUANT_C (dnf_conv AND_OR_C prop_simp_conv), ID_C),
	(simple_∃_∨_conv, PROP_ATOM_C),
	(simple_∃_∧_conv, PROP_ATOM_C),
	(simple_∃_const_elim_conv, PROP_ATOM_C),
	(ℝ_one_point_qep_conv, ID_C),
	(ℝ_fourier_motzkin_conv, ID_C),
	(PROP_LIT_C ℝ_normalise_lit_conv, ID_C)]);
(*
=TEX
Finally, the following is the general quantifier elimination procedure.
It iterates the above conversion on innermost quantifiers until there are none left.
It then cleans up the result, evaluating any constraints it can and applying the propositional simplifer to the result.
=SML
*)
val ⦏ℝ_lin_qep_conv⦎ =
	QUANT_MAP_C ℝ_lin_qep_step_conv THEN_TRY_C
	(PROP_LIT_C ℝ_normalise_lit_conv AND_OR_C
	 PROP_ATOM_C (ℝ_less_conv ORELSE_C ℝ_eq_conv) AND_OR_C
	 cnf_conv AND_OR_C
	 prop_simp_conv);
=TEX
\section{EMBEDDING OF THE INTEGERS}
=SML
val _ = set_merge_pcs["basic_hol", "'ℤ", "'sets_alg", "'ℝ"];
=TEX
=SML
val _ = (
push_consistency_goal⌜ℤℝ⌝;
a(ante_tac (list_∀_elim[⌜λx⦁x + ℕℝ 1⌝, ⌜λx⦁x - ℕℝ 1⌝, ⌜ℕℝ 0⌝]ℤ_fun_∃_thm));
a(rewrite_tac[ℝ_plus_assoc_thm] THEN REPEAT strip_tac);
a(POP_ASM_T discard_tac THEN
	∃_tac⌜h⌝ THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(SPEC_NTH_ASM_T 2 ⌜ℕℤ 0⌝ ante_tac THEN rewrite_tac[]);
a(DROP_NTH_ASM_T 3 rewrite_thm_tac);
(* *** Goal "2" *** *)
a(strip_asm_tac (∀_elim⌜j⌝ℤ_cases_thm) THEN all_var_elim_asm_tac1);
(* *** Goal "2.1" *** *)
a(induction_tac⌜m⌝ THEN1 asm_rewrite_tac[]);
a(asm_rewrite_tac[ℕℤ_plus_homomorphism_thm, ℤ_plus_assoc_thm1]);
a(rewrite_tac[ℝ_plus_assoc_thm]);
(* *** Goal "2.2" *** *)
a(induction_tac⌜m⌝ THEN1 asm_rewrite_tac[]);
a(asm_rewrite_tac[ℕℤ_plus_homomorphism_thm, ℤ_plus_assoc_thm1]);
a(rewrite_tac[ℝ_plus_assoc_thm]);
save_consistency_thm ⌜ℤℝ⌝ (pop_thm())
);
=SML
val ⦏ℤℝ_def⦎ = get_spec⌜ℤℝ⌝;
=SML
val ⦏ℤℝ_plus_homomorphism_thm⦎ = save_thm ("ℤℝ_plus_homomorphism_thm", (
set_goal([], ⌜
	∀ i j⦁ ℤℝ (i + j) = ℤℝ i + ℤℝ j
⌝);
a(rewrite_tac[ℤℝ_def]);
pop_thm()
));
=TEX
=SML
val ⦏ℤℝ_minus_thm⦎ = save_thm ("ℤℝ_minus_thm", (
set_goal([], ⌜
	∀i⦁ℤℝ(~i) = ~(ℤℝ i)
⌝);
a(REPEAT strip_tac);
a(LEMMA_T⌜ℤℝ(~i) + ℤℝ i = ℤℝ(~i + i)⌝ ante_tac THEN1 rewrite_tac[ℤℝ_def]);
a(LEMMA_T⌜~i + i = ℕℤ 0⌝ pure_rewrite_thm_tac THEN1 rewrite_tac[]);
a(PC_T1 "ℝ_lin_arith" prove_tac[ℤℝ_def]);
pop_thm()
));
=TEX
=SML
val ⦏ℤℝ_ℕℤ_thm⦎ = save_thm ("ℤℝ_ℕℤ_thm", (
set_goal([], ⌜
∀m⦁	ℤℝ(ℕℤ m) = ℕℝ m
∧	ℤℝ(~(ℕℤ m)) = ~(ℕℝ m)
⌝);
a(rewrite_tac[ℤℝ_minus_thm]);
a(once_rewrite_tac[prove_rule[]⌜∀p1 p2⦁
	p1 ∧ p2 ⇔
	p1 ∧ (p1 ⇒ p2)⌝]
	THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(induction_tac⌜m:ℕ⌝ THEN
	asm_rewrite_tac[ℤℝ_def, ℕℤ_plus_homomorphism_thm, ℕℝ_plus_homomorphism_thm]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[]);
pop_thm()
));
=TEX
=SML
val ⦏ℤℝ_times_homomorphism_thm⦎ = save_thm ("ℤℝ_times_homomorphism_thm", (
set_goal([], ⌜
	∀ i j⦁ ℤℝ (i * j) = ℤℝ i * ℤℝ j
⌝);
a(REPEAT strip_tac);
a(ℤ_induction_tac⌜i⌝ THEN rewrite_tac[ℤℝ_def, ℤℝ_minus_thm]);
(* *** Goal "1" *** *)
a(asm_rewrite_tac[pc_rule1 "ℤ_lin_arith" prove_rule[]⌜~ i * j = ~(i * j)⌝,
	ℤℝ_minus_thm ]);
a(PC_T1"ℝ_lin_arith" prove_tac[]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[ℤℝ_def, ℤ_times_plus_distrib_thm,
	ℤℝ_plus_homomorphism_thm ]);
a(PC_T1"ℝ_lin_arith" prove_tac[]);
pop_thm()
));
=TEX
\section{EPILOGUE}
=TEX
=SML
val _ = (pop_pc(); pop_pc());
end (* of structure ℝ *);
open ℝ;

=TEX
\twocolumn[\section{INDEX}]
\small
\printindex

\end{document}







=IGN
********************************************************************************
imp117.doc: this file is part of the PPZed system

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

\def\Title{ Implementation of the Z Library Real Numbers }

\def\Abstract{\begin{center}
{\bf Abstract}\par\parbox{0.7\hsize}
{\small This document gives the implementation for the theory
of real numbers in \ProductZ.}
\end{center}}

\def\Reference{LEMMA1/HOL/IMP117}

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
\item[Issues 1.1 (2000/12/10)-1.4 (2000/12/13)] Initial development drafts.
\item[Issues 1.5 (2001/05/28)-1.8 (2001/07/05)] Corrected errors in theorems about associativity and multiplication and
some improvements to the treatment of unary negation in the proof contexts.
\item[Issue 1.9 (2001/08/29)] Corrections to conversion for exponentiation; tidy-up of
error-handling.
\item[Issue 1.10 (2001/11/12), 1.11 (2002/01/23)] Fixed botched bindings for theorems relating to division.
\item[Issue 1.12 (2002/10/17)] More on the ML bindings for the two theorems about division.
\item[Issue 1.12 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.13 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.14 (2004/01/19)] The Z universal set is now called 𝕌.
\item[Issue 1.15 (2005/02/26)] Precedences and associativity of toolkit operators now follow \cite{ISO02}.
\item[Issue 1.16 (2005/08/01)] Allowed for new associativity of division in statement of
=INLINEFT
z_ℝ_over_clauses
=TEX
.
\item[Issue 1.17 (2006/04/20)] Added support for floating point literals
\item[Issue 1.18 (2006/05/08)] The proof context now normalises literal fractions.
\item[Issue 1.19 (2007/11/22)] Added lower bounds, greatest lower, upper bounds and least upper bounds.
\item[Issue 1.20 (2008/02/10)] Allowed for changes to lexical rules for underscores.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

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
This document contains the implementation
of the Z Library theory of real numbers and their proof support.
The high level design for this material is given in \cite{DS/FMU/IED/HLD017}.


\subsection{Purpose and Background}
See \cite{DS/FMU/IED/HLD011}.


\section{PREAMBLE}

=SML
structure ⦏ZReals⦎ : ZReals = struct
=SML
val _ = open_theory"z_reals";
=TEX
\section{DEFINITIONS}
=SML
val ⦏z_ℝ_def⦎ = z_get_specⓩℝ⌝;
val ⦏z_ℝ_less_def⦎ = z_get_specⓩ(_ <⋎R _)⌝;
val ⦏z_ℝ_≤_def⦎ = z_ℝ_less_def;
val ⦏z_ℝ_minus_def⦎ = z_ℝ_less_def;
val ⦏z_ℝ_plus_def⦎ = z_ℝ_less_def;
val ⦏z_ℝ_times_def⦎ = z_ℝ_less_def;
val ⦏z_ℝ_over_def⦎ = z_ℝ_less_def;
val ⦏z_ℝ_abs_def⦎ = z_ℝ_less_def;

val ⦏z_ℝ_greater_def⦎ = z_get_specⓩ(_ >⋎R _)⌝;
val ⦏z_ℝ_≥_def⦎ = z_ℝ_greater_def;
val ⦏z_ℝ_subtract_def⦎ = z_ℝ_greater_def;

val ⦏z_ℝ_real_def⦎ = z_get_specⓩreal⌝;
val ⦏z_ℝ_frac_def⦎ = z_get_specⓩ(_ /⋎Z _)⌝;
val ⦏z_ℝ_ℤ_exp_def⦎ = z_get_specⓩ(_ ^⋎Z _)⌝;
val ⦏z_ℝ_dot_dot_def⦎ = z_get_specⓩ(_ ..⋎R _)⌝;

val ⦏z_ℝ_lb_def⦎ = z_get_specⓩ(_ lb⋎R _)⌝;
val ⦏z_ℝ_glb_def⦎ = z_get_specⓩglb⋎R⌝;
val ⦏z_ℝ_ub_def⦎ = z_get_specⓩ(_ lb⋎R _)⌝;
val ⦏z_ℝ_lub_def⦎ = z_get_specⓩlub⋎R⌝;
=TEX
\section{THEOREMS}
\subsection{Preamble}
=SML
val _ = set_merge_pcs["z_predicates", "'z_numbers", "'ℝ"];
val  ⦏main_defs⦎ = list_∧_intro[
	z_ℝ_def,
	rewrite_rule[z_get_specⓩℝ⌝] z_ℝ_less_def,
	rewrite_rule[z_get_specⓩℝ⌝] z_ℝ_minus_def,
	rewrite_rule[z_get_specⓩℤ⌝] z_ℝ_real_def,
	rewrite_rule[z_get_specⓩℤ⌝] z_ℝ_frac_def,
	rewrite_rule[z_get_specⓩℤ⌝, z_get_specⓩℝ⌝] z_ℝ_ℤ_exp_def,
	rewrite_rule[z_get_specⓩℝ⌝] z_ℝ_dot_dot_def
];
=TEX
\subsection{Order Structure}
In this section we prove basic facts about the less-than relation on the reals:
=SML
val ⦏z_ℝ_unbounded_below_thm⦎ = (
set_goal([], ⓩ∀x: ℝ⦁ ∃y:ℝ⦁ y <⋎R x⌝);
a(rewrite_tac[main_defs] THEN REPEAT strip_tac);
a(strip_asm_tac (∀_elim⌜x⌝ℝ_unbounded_below_thm));
a(contr_tac THEN all_asm_fc_tac[]);
save_pop_thm "z_ℝ_unbounded_below_thm"
);
=TEX
=SML
val ⦏z_ℝ_unbounded_above_thm⦎ = (
set_goal([], ⓩ∀x: ℝ⦁ ∃y : ℝ⦁ x <⋎R y⌝);
a(rewrite_tac[main_defs] THEN REPEAT strip_tac);
a(strip_asm_tac (∀_elim⌜x⌝ℝ_unbounded_above_thm));
a(contr_tac THEN all_asm_fc_tac[]);
save_pop_thm "z_ℝ_unbounded_above_thm"
);
=TEX
=SML
val ⦏z_ℝ_less_irrefl_thm⦎ = (
set_goal([], ⓩ∀x: ℝ⦁ ¬x <⋎R x⌝);
a(rewrite_tac[main_defs] THEN REPEAT strip_tac);
save_pop_thm "z_ℝ_less_irrefl_thm"
);
=TEX
=SML
val ⦏z_ℝ_less_antisym_thm⦎ = (
set_goal([], ⓩ∀x, y: ℝ⦁ ¬(x <⋎R y ∧ y <⋎R x)⌝);
a(rewrite_tac[main_defs] THEN REPEAT strip_tac);
a(all_fc_tac[ℝ_less_antisym_thm]);
save_pop_thm "z_ℝ_less_antisym_thm"
);
=TEX
=SML
val ⦏z_ℝ_less_trans_thm⦎ = (
set_goal([], ⓩ∀x, y, z: ℝ⦁ x <⋎R y ∧ y <⋎R z ⇒ x <⋎R z⌝);
a(rewrite_tac[main_defs] THEN REPEAT strip_tac);
a(all_fc_tac[ℝ_less_trans_thm]);
save_pop_thm "z_ℝ_less_trans_thm"
);
=TEX
=SML
val ⦏z_ℝ_less_cases_thm⦎ = (
set_goal([], ⓩ∀x, y: ℝ⦁ x <⋎R y ∨ x = y ∨ y <⋎R x⌝);
a(rewrite_tac[main_defs, ℝ_less_cases_thm]);
save_pop_thm "z_ℝ_less_cases_thm"
);
=TEX
=SML
val ⦏z_ℝ_≤_cases_thm⦎ = (
set_goal([], ⓩ∀x, y: ℝ⦁ x ≤⋎R y ∨ y ≤⋎R x⌝);
a(rewrite_tac[main_defs, ℝ_≤_cases_thm]);
save_pop_thm "z_ℝ_≤_cases_thm"
);
=TEX
=SML
val ⦏z_ℝ_≤_less_cases_thm⦎ = (
set_goal([], ⓩ∀x, y: ℝ⦁ x ≤⋎R y ∨ y <⋎R x⌝);
a(rewrite_tac[main_defs, ℝ_≤_less_cases_thm]);
save_pop_thm "z_ℝ_≤_less_cases_thm"
);
=TEX
=SML
val ⦏z_ℝ_eq_≤_thm⦎ = (
set_goal([], ⓩ∀x, y: ℝ⦁ x = y ⇔ x ≤⋎R y ∧ y ≤⋎R x⌝);
a(rewrite_tac[main_defs, ℝ_eq_≤_thm]);
save_pop_thm "z_ℝ_eq_≤_thm"
);
=TEX
=SML
val ⦏z_ℝ_≤_antisym_thm⦎ = (
set_goal([], ⓩ∀x, y: ℝ⦁ x ≤⋎R y ∧ y ≤⋎R x  ⇒ x = y⌝);
a(rewrite_tac[main_defs, ℝ_eq_≤_thm]);
save_pop_thm "z_ℝ_≤_antisym_thm"
);
=TEX
=SML
val ⦏z_ℝ_less_≤_trans_thm⦎ = (
set_goal([], ⓩ∀x, y, z: ℝ⦁ x <⋎R y ∧ y ≤⋎R z ⇒ x <⋎R z⌝);
a(rewrite_tac[main_defs, ℝ_less_≤_trans_thm]);
save_pop_thm "z_ℝ_less_≤_trans_thm"
);
=TEX
=SML
val ⦏z_ℝ_≤_less_trans_thm⦎ = (
set_goal([], ⓩ∀x, y, z: ℝ⦁ x ≤⋎R y ∧ y <⋎R z ⇒ x <⋎R z⌝);
a(rewrite_tac[main_defs, ℝ_≤_less_trans_thm]);
save_pop_thm "z_ℝ_≤_less_trans_thm"
);
=TEX
=SML
val ⦏z_ℝ_≤_refl_thm⦎ = (
set_goal([], ⓩ∀x: ℝ⦁ x ≤⋎R x⌝);
a(rewrite_tac[main_defs, ℝ_≤_refl_thm]);
save_pop_thm "z_ℝ_≤_refl_thm"
);
=TEX
=SML
val ⦏z_ℝ_≤_trans_thm⦎ = (
set_goal([], ⓩ∀x, y, z: ℝ⦁ x ≤⋎R y ∧ y ≤⋎R z ⇒ x ≤⋎R z⌝);
a(rewrite_tac[main_defs, ℝ_≤_trans_thm]);
save_pop_thm "z_ℝ_≤_trans_thm"
);
=TEX
=SML
val ⦏z_ℝ_≤_¬_less_thm⦎ = (
set_goal([], ⓩ∀x, y: ℝ⦁ x ≤⋎R y ⇔ ¬y <⋎R x⌝);
a(rewrite_tac[main_defs, ℝ_≤_¬_less_thm]);
save_pop_thm "z_ℝ_≤_¬_less_thm"
);
=TEX
=SML
val ⦏z_ℝ_¬_≤_less_thm⦎ = (
set_goal([], ⓩ∀x, y: ℝ⦁ ¬x ≤⋎R y ⇔ y <⋎R x⌝);
a(rewrite_tac[main_defs, ℝ_¬_≤_less_thm]);
save_pop_thm "z_ℝ_¬_≤_less_thm"
);
=TEX
=SML
val ⦏z_ℝ_less_¬_eq_thm⦎ = (
set_goal([], ⓩ∀x, y: ℝ⦁ x <⋎R y ⇒ ¬x = y⌝);
a(rewrite_tac[main_defs, ℝ_less_¬_eq_thm]);
save_pop_thm "z_ℝ_less_¬_eq_thm"
);
=TEX
=SML
val ⦏z_ℝ_¬_less_≤_thm⦎ = conv_rule (ONCE_MAP_C eq_sym_conv) z_ℝ_≤_¬_less_thm;
=TEX
=SML
val ⦏z_ℝ_less_dense_thm⦎ = (
set_goal([], ⓩ∀x, y: ℝ⦁ x <⋎R y ⇒ (∃z:ℝ⦁ x <⋎R z ∧ z <⋎R y)⌝);
a(rewrite_tac[main_defs] THEN REPEAT strip_tac);
a(all_fc_tac[ℝ_less_dense_thm]);
a(z_∃_tacⓩz⌝ THEN REPEAT strip_tac);
save_pop_thm "z_ℝ_less_dense_thm"
);
=TEX
=SML
val ⦏z_ℝ_complete_thm⦎ = (
set_goal([], ⓩ∀A : ℙ ℝ⦁
	¬A = {} ∧ (∃b:ℝ⦁∀ x:ℝ⦁ x ∈ A ⇒ x ≤⋎R b) ⇒
	(∃s:ℝ⦁  (∀ x:ℝ⦁ x ∈ A ⇒ x ≤⋎R s)
∧	(∀ b:ℝ⦁ (∀ x:ℝ⦁ x ∈ A ⇒ x ≤⋎R b) ⇒ s ≤⋎R b))
⌝);
a(rewrite_tac[main_defs] THEN REPEAT strip_tac);
a(strip_asm_tac(∀_elim⌜A⌝ℝ_complete_thm));
(* *** Goal "1" *** *)
a(i_contr_tac THEN swap_nth_asm_concl_tac 3 THEN asm_rewrite_tac[get_specⓩ{}⌝]);
(* *** Goal "2" *** *)
a(i_contr_tac THEN swap_nth_asm_concl_tac 1);
a(∃_tac⌜b⌝ THEN asm_rewrite_tac[]);
(* *** Goal "3" *** *)
a(z_∃_tac⌜s⌝ THEN asm_rewrite_tac[] THEN REPEAT strip_tac);
a(GET_NTH_ASM_T 2 bc_thm_tac THEN asm_rewrite_tac[]);
save_pop_thm"z_ℝ_complete_thm"
);
=TEX
\subsection{Additive Structure}
=SML
val ⦏z_ℝ_plus_assoc_thm⦎ = (
set_goal([], ⓩ ∀x, y, z: ℝ⦁ (x +⋎R y) +⋎R z = x +⋎R (y +⋎R z)⌝);
a(REPEAT strip_tac THEN rewrite_tac[main_defs, ℝ_plus_assoc_thm]);
save_pop_thm"z_ℝ_plus_assoc_thm"
);
=TEX
=SML
val ⦏z_ℝ_plus_assoc_thm1⦎ = (
set_goal([], ⓩ ∀x, y, z: ℝ⦁ x +⋎R (y +⋎R z) = (x +⋎R y) +⋎R z⌝);
a(rewrite_tac[rewrite_rule[z_get_specⓩℝ⌝]z_ℝ_plus_assoc_thm]);
save_pop_thm"z_ℝ_plus_assoc_thm1"
);
=TEX
=SML
val ⦏z_ℝ_plus_comm_thm⦎ = (
set_goal([], ⓩ ∀x, y: ℝ⦁ x +⋎R y = y +⋎R x ⌝);
a(REPEAT strip_tac THEN rewrite_tac[main_defs, ∀_elim⌜x:ℝ⌝ℝ_plus_order_thm]);
save_pop_thm"z_ℝ_plus_comm_thm"
);
=TEX
=SML
val ⦏z_ℝ_real_0_thm⦎ = (
set_goal([], ⓩ real 0 = ⌜ℕℝ 0⌝ ⌝);
a(LEMMA_T ⓩreal 0 = real (0 + ~0)⌝ pure_rewrite_thm_tac THEN1 rewrite_tac[]);
a(pure_rewrite_tac[main_defs]);
a(rewrite_tac[ℝ_minus_clauses]);
pop_thm()
);
=TEX
=SML
val ⦏z_ℝ_real_ℕℝ_thm⦎ = (
set_goal([], ⌜ ∀m:ℕ⦁ ⓩreal ⌜(Z'Int m)⌝⌝ = ℕℝ m ⌝);
a(REPEAT strip_tac THEN induction_tac ⌜m:ℕ⌝);
(* *** Goal "1" *** *)
a(rewrite_tac[z_ℝ_real_0_thm]);
(* *** Goal "2" *** *)
a(rewrite_tac[z_int_homomorphism_thm, ℕℝ_plus_homomorphism_thm]);
a(asm_rewrite_tac[main_defs]);
pop_thm()
);
=TEX
=SML
val ⦏z_ℝ_plus_unit_thm⦎ = (
set_goal([], ⓩ ∀x: ℝ⦁ x +⋎R real 0 = x ⌝);
a(rewrite_tac[main_defs, z_ℝ_real_0_thm, ℝ_plus_clauses]);
save_pop_thm "z_ℝ_plus_unit_thm"
);
=TEX
=SML
val ⦏z_ℝ_plus_mono_thm⦎ = (
set_goal([], ⓩ ∀x, y, z: ℝ⦁ y <⋎R z ⇒ x +⋎R y <⋎R x +⋎R z ⌝);
a(rewrite_tac [main_defs] THEN REPEAT strip_tac);
save_pop_thm "z_ℝ_plus_mono_thm"
);
=TEX
=SML
val ⦏z_ℝ_plus_mono_thm1⦎ = (
set_goal([], ⓩ ∀x, y, z: ℝ⦁ y <⋎R z ⇒ y +⋎R x <⋎R z +⋎R x⌝);
a(once_rewrite_tac[rewrite_rule[z_get_specⓩℝ⌝]z_ℝ_plus_comm_thm]);
a(rewrite_tac[rewrite_rule[z_get_specⓩℝ⌝]z_ℝ_plus_mono_thm]);
save_pop_thm"z_ℝ_plus_mono_thm1"
);
=TEX
=SML
val ⦏z_ℝ_plus_mono_thm2⦎ = (
set_goal([], ⓩ ∀x, y, s, t: ℝ⦁ x <⋎R y ∧ s <⋎R t ⇒ x +⋎R s <⋎R y +⋎R t⌝);
a(rewrite_tac [main_defs] THEN REPEAT strip_tac);
a(bc_thm_tac ℝ_less_trans_thm THEN ∃_tac⌜y +⋎R s⌝ THEN asm_rewrite_tac[]);
save_pop_thm"z_ℝ_plus_mono_thm2"
);
=TEX
=SML
val ⦏z_ℝ_plus_0_thm⦎ = (
set_goal([], ⓩ ∀x: ℝ⦁ x +⋎R real 0 = x ∧ real 0 +⋎R x = x ⌝);
a(rewrite_tac[rewrite_rule[z_get_specⓩℝ⌝]z_ℝ_plus_unit_thm]);
a(once_rewrite_tac[rewrite_rule[z_get_specⓩℝ⌝]z_ℝ_plus_comm_thm]);
a(rewrite_tac[rewrite_rule[z_get_specⓩℝ⌝]z_ℝ_plus_unit_thm]);
save_pop_thm"z_ℝ_plus_0_thm"
);
=TEX
=SML
val ⦏z_ℝ_plus_order_thm⦎ = (
set_goal([], ⓩ ∀x, y, z: ℝ⦁ y +⋎R x = x +⋎R y
		      ∧ (x +⋎R y) +⋎R z = x +⋎R (y +⋎R z)
		      ∧ y +⋎R (x +⋎R z) = x +⋎R (y +⋎R z)⌝);
a(rewrite_tac[rewrite_rule[z_get_specⓩℝ⌝]z_ℝ_plus_assoc_thm]);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(conv_tac (LEFT_C (once_rewrite_conv
	[rewrite_rule[z_get_specⓩℝ⌝]z_ℝ_plus_comm_thm]))
	THEN REPEAT strip_tac);
(* *** Goal "2" *** *)
a(rewrite_tac[rewrite_rule[z_get_specⓩℝ⌝]z_ℝ_plus_assoc_thm1]);
a(conv_tac (RAND_C (ONCE_MAP_C(LEFT_C(once_rewrite_conv
	[rewrite_rule[z_get_specⓩℝ⌝]z_ℝ_plus_comm_thm]))))
	THEN REPEAT strip_tac);
save_pop_thm"z_ℝ_plus_order_thm"
);
=TEX
=SML
val ⦏z_ℝ_plus_minus_thm⦎ = (
set_goal([], ⓩ ∀x: ℝ⦁ x +⋎R ~⋎R x = real 0 ∧ ~⋎R x +⋎R x = real 0⌝);
a(z_∀_tac THEN strip_tac);
a(conv_tac (RIGHT_C
	(once_rewrite_conv[rewrite_rule[z_get_specⓩℝ⌝]z_ℝ_plus_comm_thm])));
a(rewrite_tac[main_defs, ℝ_minus_clauses, z_ℝ_real_0_thm]);
save_pop_thm"z_ℝ_plus_minus_thm"
);
=TEX
=SML
val ⦏z_ℝ_eq_thm⦎ = (
set_goal([], ⓩ ∀x, y: ℝ⦁ x = y ⇔ x +⋎R ~⋎R y = real 0 ⌝);
a(z_∀_tac THEN strip_tac);
a(rewrite_tac[main_defs, z_ℝ_real_0_thm]);
a(conv_tac (LEFT_C (once_rewrite_conv[ℝ_eq_thm])));
a(rewrite_tac[]);
save_pop_thm"z_ℝ_eq_thm"
);
=TEX
=SML
val ⦏z_ℝ_minus_clauses⦎ = (
set_goal([], ⓩ ∀x, y : ℝ⦁
	~⋎R (~⋎R x) = x
∧	x +⋎R ~⋎R x = real 0
∧	~⋎R x +⋎R x = real 0
∧	 ~⋎R (x +⋎R y) = ~⋎R x +⋎R ~⋎R y
∧	~⋎R (real 0) = real 0⌝);
a(z_∀_tac THEN strip_tac);
a(rewrite_tac[main_defs, z_ℝ_real_0_thm]);
save_pop_thm"z_ℝ_minus_clauses"
);
=TEX
=SML
val ⦏z_ℝ_minus_eq_thm⦎ = (
set_goal([], ⓩ ∀x, y: ℝ⦁ ~⋎R x = ~⋎R y ⇔ x = y ⌝);
a(z_∀_tac THEN strip_tac);
a(rewrite_tac[main_defs, ℝ_minus_eq_thm]);
save_pop_thm"z_ℝ_minus_eq_thm"
);
=TEX
=SML
val ⦏z_ℝ_plus_clauses⦎ = (
set_goal([], ⓩ ∀ x, y, z : ℝ⦁
		         (x +⋎R z = y +⋎R z ⇔ x = y)
		      ∧ (z +⋎R x = y +⋎R z ⇔ x = y)
		      ∧ (x +⋎R z = z +⋎R y ⇔ x = y)
		      ∧ (z +⋎R x = z +⋎R y ⇔ x = y)
		      ∧ (x +⋎R z = z ⇔ x = real 0)
		      ∧ (z +⋎R x = z ⇔ x = real 0)
		      ∧ (z = z +⋎R y ⇔ y = real 0)
		      ∧ (z = y +⋎R z ⇔ y = real 0)
		      ∧ x +⋎R real 0 = x
		      ∧ real 0 +⋎R x = x
		      ∧ ¬ real 1 = real 0
		      ∧ ¬ real 0 = real 1⌝);
a(rewrite_tac[main_defs, z_ℝ_real_ℕℝ_thm, ℝ_plus_clauses]);
save_pop_thm"z_ℝ_plus_clauses"
);
=TEX
=SML
val ⦏z_ℝ_less_clauses⦎ = (
set_goal([], ⓩ ∀ x, y, z : ℝ⦁
		         (x +⋎R z <⋎R y +⋎R z ⇔ x <⋎R y)
		      ∧ (z +⋎R x <⋎R y +⋎R z ⇔ x <⋎R y)
		      ∧ (x +⋎R z <⋎R z +⋎R y ⇔ x <⋎R y)
		      ∧ (z +⋎R x <⋎R z +⋎R y ⇔ x <⋎R y)
		      ∧ (x +⋎R z <⋎R z ⇔ x <⋎R real 0)
		      ∧ (z +⋎R x <⋎R z ⇔ x <⋎R real 0)
		      ∧ (x <⋎R z +⋎R x ⇔ real 0 <⋎R z)
		      ∧ (x <⋎R x +⋎R z ⇔ real 0 <⋎R z)
		      ∧ ¬x <⋎R x
		      ∧ real 0 <⋎R real 1
		      ∧ ¬ real 1 <⋎R real 0
⌝);
a(rewrite_tac[main_defs, z_ℝ_real_ℕℝ_thm, ℝ_less_clauses]);
save_pop_thm"z_ℝ_less_clauses"
);
=TEX
=SML
val ⦏z_ℝ_≤_clauses⦎ = (
set_goal([], ⓩ ∀ x, y, z : ℝ⦁
		         (x +⋎R z ≤⋎R y +⋎R z ⇔ x ≤⋎R y)
		      ∧ (z +⋎R x ≤⋎R y +⋎R z ⇔ x ≤⋎R y)
		      ∧ (x +⋎R z ≤⋎R z +⋎R y ⇔ x ≤⋎R y)
		      ∧ (z +⋎R x ≤⋎R z +⋎R y ⇔ x ≤⋎R y)
		      ∧ (x +⋎R z ≤⋎R z ⇔ x ≤⋎R real 0)
		      ∧ (z +⋎R x ≤⋎R z ⇔ x ≤⋎R real 0)
		      ∧ (x ≤⋎R z +⋎R x ⇔ real 0 ≤⋎R z)
		      ∧ (x ≤⋎R x +⋎R z ⇔ real 0 ≤⋎R z)
		      ∧ x ≤⋎R x
		      ∧ real 0 ≤⋎R real 1
		      ∧ ¬ real 1 ≤⋎R real 0
⌝);
a(rewrite_tac[main_defs, z_ℝ_real_ℕℝ_thm, ℝ_≤_clauses]);
save_pop_thm"z_ℝ_≤_clauses"
);
=TEX
\subsection{Multipicative Structure}
=SML
val ⦏z_ℝ_times_assoc_thm⦎ = (
set_goal([], ⓩ ∀ x, y, z: ℝ⦁ (x *⋎R y) *⋎R z = x *⋎R (y *⋎R z)⌝);
a(rewrite_tac[main_defs, ℝ_times_assoc_thm]);
save_pop_thm"z_ℝ_times_assoc_thm"
);
=TEX
=SML
val ⦏z_ℝ_times_comm_thm⦎ = (
set_goal([], ⓩ ∀ x, y: ℝ⦁ x *⋎R y = y *⋎R x⌝);
a(REPEAT strip_tac THEN rewrite_tac[main_defs, ∀_elim⌜x:ℝ⌝ ℝ_times_order_thm]);
save_pop_thm"z_ℝ_times_comm_thm"
);
=TEX
=SML
val ⦏z_ℝ_times_unit_thm⦎ = (
set_goal([], ⓩ ∀ x:ℝ⦁ x *⋎R real 1 = x⌝);
a(rewrite_tac[main_defs, z_ℝ_real_ℕℝ_thm]);
save_pop_thm"z_ℝ_times_unit_thm"
);
=TEX
=SML
val ⦏z_ℝ_0_less_0_less_times_thm⦎ = (
set_goal([], ⓩ ∀ x, y:ℝ⦁ real 0 <⋎R x ∧ real 0 <⋎R y ⇒ real 0 <⋎R x *⋎R y⌝);
a(rewrite_tac[main_defs, z_ℝ_real_ℕℝ_thm, ℝ_0_less_0_less_times_thm]);
save_pop_thm"z_ℝ_0_less_0_less_times_thm"
);
=TEX
=SML
val ⦏z_ℝ_times_assoc_thm1⦎ = save_thm("z_ℝ_times_assoc_thm1",
	conv_rule (ONCE_MAP_C eq_sym_conv) z_ℝ_times_assoc_thm);
=TEX
=SML
val ⦏z_ℝ_times_plus_distrib_thm⦎ = (
set_goal([], ⓩ ∀ x, y, z: ℝ⦁
	x *⋎R (y +⋎R z) = x *⋎R y +⋎R x *⋎R z ∧ (x +⋎R y) *⋎R z = x *⋎R z +⋎R y *⋎R z⌝);
a(rewrite_tac[main_defs, ℝ_times_plus_distrib_thm]);
save_pop_thm"z_ℝ_times_plus_distrib_thm"
);
=TEX
=SML
val ⦏z_ℝ_times_order_thm⦎ = (
set_goal([], ⓩ ∀ x, y, z: ℝ⦁ y *⋎R x = x *⋎R y
		      ∧ (x *⋎R y) *⋎R z = x *⋎R (y *⋎R z)
		      ∧ y *⋎R (x *⋎R z) = x *⋎R (y *⋎R z)⌝);
a(z_∀_tac THEN strip_tac THEN rewrite_tac[main_defs]);
a(rewrite_tac[∀_elim⌜y⌝ℝ_times_order_thm]);
save_pop_thm"z_ℝ_times_order_thm"
);
=TEX
=SML
val ⦏z_ℝ_times_clauses⦎ = (
set_goal([], ⓩ ∀ x :ℝ ⦁
	real 0 *⋎R x = real 0
∧	x *⋎R real 0 = real 0
∧	x *⋎R real 1 = x
∧	real 1 *⋎R x = x⌝);
a(z_∀_tac THEN strip_tac THEN rewrite_tac[main_defs]);
a(rewrite_tac[ℝ_times_clauses, z_ℝ_real_0_thm]);
save_pop_thm"z_ℝ_times_clauses"
);
=TEX
=SML
val ⦏z_ℝ_over_clauses⦎ = (
set_goal([], ⓩ
	(∀ y, z : ℝ⦁ ¬ z = real 0 ⇒ (y *⋎R z) /⋎R z = y)
∧	(∀ x, y, z:ℝ⦁ ¬ z = real 0 ⇒ (x *⋎R y) /⋎R z = x *⋎R (y /⋎R z))⌝);
a(rewrite_tac[main_defs, z_ℝ_real_0_thm, get_spec⌜$/⋎R⌝]);
save_pop_thm "z_ℝ_over_clauses"
);
=TEX
\subsection{Floating Point Literals}
=SML
val ⦏z_float_thm⦎ = (
set_goal([], ⓩ ∀ m, p, e : ℤ⦁ ⌜Z'Float m p e⌝ = real m *⋎R (real 10 ^⋎Z (e + ~p))⌝);
a(rewrite_tac[get_spec⌜Z'Float⌝]);
save_pop_thm "z_float_thm"
);
=TEX
\section{SYNTAX FUNCTIONS}
=SML
val ⦏ℝ⦎ = ⓣℝ⌝;
val ⦏ℤ⦎ = ⓣℤ⌝;
val ⦏minus⦎ = (fst o dest_z_app) ⓩ~⋎R x⌝;
val ⦏minusn⦎ = (fst o dest_const) minus;
val ⦏zabs⦎ = (fst o dest_z_app) ⓩabs⋎R x⌝;
val ⦏zabsn⦎ = (fst o dest_const) zabs;
val ⦏zreal⦎ = (fst o dest_z_app) ⓩreal x⌝;
val ⦏zrealn⦎ = (fst o dest_const) zreal;
=TEX
=SML
fun ⦏dest_z_ℝ_minus⦎ (tm : TERM) : TERM = (
	let	val (sgn, a) = dest_z_app tm;
		val (s, _) = dest_const sgn;
	in	if s = minusn
		then a
		else term_fail "dest_z_ℝ_minus" 117107 [tm]
	end	handle Fail _ => term_fail "dest_z_ℝ_minus" 117107 [tm]
);
=TEX
=SML
fun ⦏is_z_ℝ_minus⦎ (tm : TERM) : bool = (
	(dest_z_ℝ_minus tm; true) handle Fail _ => false
);
=TEX
=SML
fun ⦏mk_z_ℝ_minus⦎ (tm : TERM) : TERM = (
	if	type_of tm =: ℝ
	then	mk_z_app (minus, tm)
	else	term_fail "mk_z_ℝ_minus"  117201 [tm]
);
=TEX
=SML
fun ⦏dest_z_ℝ_abs⦎ (tm : TERM) : TERM = (
	let	val (sgn, a) = dest_z_app tm;
		val (s, _) = dest_const sgn;
	in	if s = zabsn
		then a
		else term_fail "dest_z_ℝ_abs" 117103 [tm]
	end	handle Fail _ => term_fail "dest_z_ℝ_abs" 117103 [tm]
);
=TEX
=SML
fun ⦏is_z_ℝ_abs⦎ (tm : TERM) : bool = (
	(dest_z_ℝ_abs tm; true) handle Fail _ => false
);
=TEX
=SML
fun ⦏mk_z_ℝ_abs⦎ (tm : TERM) : TERM = (
	if	type_of tm =: ℝ
	then	mk_z_app (zabs, tm)
	else	term_fail "mk_z_ℝ_abs"  117201 [tm]
);
=TEX
=SML
fun ⦏dest_z_real⦎ (tm : TERM) : TERM = (
	let	val (sgn, a) = dest_z_app tm;
		val (s, _) = dest_const sgn;
	in	if s = zrealn
		then a
		else term_fail "dest_z_real" 117113 [tm]
	end	handle Fail _ => term_fail "dest_z_real" 117113 [tm]
);
=TEX
=SML
fun ⦏is_z_real⦎ (tm : TERM) : bool = (
	(dest_z_real tm; true) handle Fail _ => false
);
=TEX
=SML
fun ⦏mk_z_real⦎ (tm : TERM) : TERM = (
	if	type_of tm =: ℤ
	then	mk_z_app (zreal, tm)
	else	term_fail "mk_z_real"  86201 [tm]
);
=TEX
=SML
fun ⦏dest_z_bin_op⦎ (area : string) (msg : int)
	(n : string) : TERM -> TERM * TERM = (fn tm =>
	let	val (f, args) = (dest_z_app tm);
		val (cn, _) = dest_const f;
		val ops = dest_z_tuple args;
	in	if n = cn
		then (hd ops, hd(tl ops))
		else term_fail area msg [tm]
	end	handle Fail _ => term_fail area msg [tm]
);
=TEX
=SML
fun is_z_bin_op (n : string) : TERM -> bool = (
	let	val dest = dest_z_bin_op "is_z_bin_op" 0 n
	in	(fn tm =>
			(dest tm; true) handle Fail _ => false
		)
	end
);
=TEX
=SML
fun mk_z_simple_bin_op (tm : TERM) : TERM * TERM -> TERM = (fn (a1, a2) =>
	mk_z_app(tm, mk_z_tuple [a1, a2])
);
=TEX
=SML
fun ⦏dest_z_bin_rel⦎ (area : string) (msg : int)
	(n : string) : TERM -> TERM * TERM = (fn tm =>
	let	val (args, r) = (dest_z_∈ tm);
		val (cn, _) = dest_const r;
		val ops = dest_z_tuple args;
	in	if n = cn
		then (hd ops, hd(tl ops))
		else term_fail area msg [tm]
	end	handle Fail _ => term_fail area msg [tm]
);
=TEX
=SML
fun is_z_bin_rel (n : string) : TERM -> bool = (
	let	val dest = dest_z_bin_rel "is_z_bin_rel" 0 n
	in	(fn tm =>
			(dest tm; true) handle Fail _ => false
		)
	end
);
=TEX
=SML
fun mk_z_simple_bin_rel (tm : TERM) : TERM * TERM -> TERM = (fn (a1, a2) =>
	mk_z_∈(mk_z_tuple [a1, a2], tm)
);
=TEX
=SML
val ⦏dest_z_ℝ_plus⦎ = dest_z_bin_op "dest_ℝ_plus" 117109 (fst(dest_constⓩ(_ +⋎R _)⌝));
val ⦏dest_z_ℝ_subtract⦎ = dest_z_bin_op "dest_ℝ_subtract" 117111 (fst(dest_constⓩ(_ -⋎R _)⌝));
val ⦏dest_z_ℝ_times⦎ = dest_z_bin_op "dest_z_ℝ_times" 117112 (fst(dest_constⓩ(_ *⋎R _)⌝));
val ⦏dest_z_ℝ_over⦎ = dest_z_bin_op "dest_z_ℝ_over" 117108 (fst(dest_constⓩ(_ /⋎R _)⌝));
val ⦏dest_z_ℝ_frac⦎ = dest_z_bin_op "dest_z_ℝ_frac" 117104 (fst(dest_constⓩ(_ /⋎Z _)⌝));
val ⦏dest_z_ℝ_ℤ_exp⦎ = dest_z_bin_op "dest_z_ℝ_ℤ_exp" 117104 (fst(dest_constⓩ(_ ^⋎Z _)⌝));

val ⦏dest_z_ℝ_less⦎ = dest_z_bin_rel "dest_z_ℝ_less" 117106 (fst(dest_constⓩ(_ <⋎R _)⌝));
val ⦏dest_z_ℝ_≤⦎ = dest_z_bin_rel "dest_z_ℝ_≤" 117101 (fst(dest_constⓩ(_ ≤⋎R _)⌝));
val ⦏dest_z_ℝ_greater⦎ = dest_z_bin_rel "dest_z_ℝ_greater" 117105
	(fst(dest_constⓩ(_ >⋎R _)⌝));
val ⦏dest_z_ℝ_≥⦎ = dest_z_bin_rel "dest_z_ℝ_≥" 117102 (fst(dest_constⓩ(_ ≥⋎R _)⌝));

val ⦏is_z_ℝ_plus⦎ = is_z_bin_op (fst(dest_constⓩ(_ +⋎R _)⌝));
val ⦏is_z_ℝ_subtract⦎ = is_z_bin_op (fst(dest_constⓩ(_ -⋎R _)⌝));
val ⦏is_z_ℝ_times⦎ = is_z_bin_op (fst(dest_constⓩ(_ *⋎R _)⌝));
val ⦏is_z_ℝ_frac⦎ = is_z_bin_op (fst(dest_constⓩ(_ /⋎Z _)⌝));
val ⦏is_z_ℝ_over⦎ = is_z_bin_op (fst(dest_constⓩ(_ /⋎R _)⌝));
val ⦏is_z_ℝ_ℤ_exp⦎ = is_z_bin_op (fst(dest_constⓩ(_ ^⋎Z _)⌝));

val ⦏is_z_ℝ_less⦎ = is_z_bin_rel (fst(dest_constⓩ(_ <⋎R _)⌝));
val ⦏is_z_ℝ_≤⦎ = is_z_bin_rel (fst(dest_constⓩ(_ ≤⋎R _)⌝));
val ⦏is_z_ℝ_greater⦎ = is_z_bin_rel (fst(dest_constⓩ(_ >⋎R _)⌝));
val ⦏is_z_ℝ_≥⦎ = is_z_bin_rel (fst(dest_constⓩ(_ ≥⋎R _)⌝));
=TEX
=SML
fun ⦏mk_ℝ_bin_op⦎ (area : string) (tm : TERM) : (TERM * TERM) -> TERM = (
	let	val f = mk_z_simple_bin_op tm;
	in	(fn tt as (t1, t2) => (
			if	type_of t1 =: ℝ
			then	if	type_of t2 =: ℝ
				then	f tt
				else	term_fail area 117201 [t2]
			else	term_fail area 117201 [t1]
		))
	end
);
=TEX
=SML
val ⦏mk_z_ℝ_plus⦎ = mk_ℝ_bin_op "mk_z_ℝ_plus" ⓩ(_ +⋎R _)⌝;
val ⦏mk_z_ℝ_subtract⦎ = mk_ℝ_bin_op "mk_z_ℝ_subtract" ⓩ(_ -⋎R _)⌝;
val ⦏mk_z_ℝ_times⦎ = mk_ℝ_bin_op	"mk_z_ℝ_times" ⓩ(_ *⋎R _)⌝;
val ⦏mk_z_ℝ_frac⦎ = (fn tt as (t1, t2) =>
	if	type_of t1 =: ℤ
	then	if	type_of t2 =: ℤ
		then	mk_z_simple_bin_op ⓩ(_ /⋎Z _)⌝ tt
		else	term_fail "mk_z_ℝ_frac"  86201 [t2]
	else	term_fail "mk_z_ℝ_frac" 86201 [t1]
);
val ⦏mk_z_ℝ_over⦎ = mk_ℝ_bin_op "mk_z_ℝ_over" ⓩ(_ /⋎R _)⌝;
val ⦏mk_z_ℝ_ℤ_exp⦎ = (fn tt as (t1, t2) =>
	if	type_of t1 =: ℝ
	then	if	type_of t2 =: ℤ
		then	mk_z_simple_bin_op ⓩ(_ ^⋎Z _)⌝ tt
		else	term_fail "mk_z_ℝ_ℤ_exp"  86201 [t2]
	else	term_fail "mk_z_ℝ_ℤ_exp" 117201 [t1]
);
=TEX
=SML
fun ⦏mk_ℤ_bin_rel⦎ (area : string) (tm : TERM) : (TERM * TERM) -> TERM = (
	let	val f = mk_z_simple_bin_rel tm;
	in	(fn tt as (t1, t2) => (
			if	type_of t1 =: ℝ
			then	if	type_of t2 =: ℝ
				then	f tt
				else	term_fail area 117201 [t2]
			else	term_fail area 117201 [t1]
		))
	end
);
=TEX
=SML
val ⦏mk_z_ℝ_less⦎ = mk_ℤ_bin_rel "mk_z_ℝ_less" ⓩ(_ <⋎R _)⌝;
val ⦏mk_z_ℝ_≤⦎ = mk_ℤ_bin_rel "mk_z_ℝ_≤" ⓩ(_ ≤⋎R _)⌝;
val ⦏mk_z_ℝ_greater⦎ = mk_ℤ_bin_rel "mk_z_ℝ_greater" ⓩ(_ >⋎R _)⌝;
val ⦏mk_z_ℝ_≥⦎ = mk_ℤ_bin_rel "mk_z_ℝ_≥" ⓩ(_ ≥⋎R _)⌝;
=TEX

\section{COMPUTATIONAL CONVERSIONS}
=TEX
=SML
val ⦏z_ℝ_lit_lemma1⦎ = (
set_goal([], ⌜∀m n⦁ ⓩ⌜Z'Int m⌝ /⋎Z ⌜Z'Int n⌝⌝ = m/n⌝);
a(rewrite_tac[get_specⓩ(_ /⋎Z _)⌝, z_ℝ_real_ℕℝ_thm, get_spec⌜$/⋎N⌝]);
a(rewrite_tac[main_defs]);
pop_thm()
);
=TEX
=SML
val ⦏z_ℝ_lit_lemma2⦎ = (
set_goal([], ⌜∀m n⦁ ⓩ⌜Z'Int m⌝ /⋎Z ~ ⌜Z'Int (n + 1)⌝⌝ = ~⋎R(m/(n+1))⌝);
a(rewrite_tac[get_specⓩ(_ /⋎Z _)⌝, z_ℝ_real_ℕℝ_thm, get_spec⌜$/⋎N⌝]);
a(rewrite_tac[main_defs, z_ℝ_real_ℕℝ_thm] THEN REPEAT strip_tac);
a(lemma_tac⌜¬ ℕℝ (n + 1) = ℕℝ 0⌝ THEN1
	PC_T1 "basic_hol" rewrite_tac[ℕℝ_one_one_thm]);
a(lemma_tac⌜¬ (~⋎R(ℕℝ (n + 1)) = ℕℝ 0)⌝ THEN1
	(conv_tac (RAND_C eq_sym_conv) THEN once_rewrite_tac[ℝ_eq_thm]
	THEN rewrite_tac[ℝ_minus_clauses] THEN
	PC_T1 "basic_hol" rewrite_tac[ℕℝ_one_one_thm]));
a(LEMMA_T ⌜~⋎R(ℕℝ m / ℕℝ (n + 1)) = ~⋎R(ℕℝ m) / ℕℝ (n+1)⌝ rewrite_thm_tac);
(* *** Goal "1" *** *)
a(ALL_FC_T rewrite_tac[ℝ_over_times_recip_thm]);
a(rewrite_tac[ℝ_times_minus_thm]);
(* *** Goal "2" *** *)
a(ante_tac (list_∀_elim[ ⌜~⋎R(ℕℝ (n + 1))⌝, ⌜ℕℝ (n + 1)⌝]ℝ_cross_mult_eq_thm));
a(asm_rewrite_tac[] THEN REPEAT strip_tac);
a(asm_rewrite_tac[]);
a(rewrite_tac[ℝ_times_minus_thm, ∀_elim⌜ℕℝ m⌝ℝ_times_order_thm]);
pop_thm()
);
=TEX
=SML
val ⦏z_ℝ_lit_lemma3⦎ = (
set_goal([], ⌜∀m n⦁ ⓩ(~ ⌜Z'Int m⌝) /⋎Z ⌜Z'Int (n + 1)⌝⌝ = ~⋎R(m/(n+1))⌝);
a(rewrite_tac[get_specⓩ(_ /⋎Z _)⌝, z_ℝ_real_ℕℝ_thm, get_spec⌜$/⋎N⌝]);
a(rewrite_tac[main_defs, z_ℝ_real_ℕℝ_thm] THEN REPEAT strip_tac);
a(lemma_tac⌜¬ ℕℝ (n + 1) = ℕℝ 0⌝ THEN1
	PC_T1 "basic_hol" rewrite_tac[ℕℝ_one_one_thm]);
a(ALL_FC_T rewrite_tac[ℝ_over_times_recip_thm]);
a(rewrite_tac[ℝ_times_minus_thm]);
pop_thm()
);
=TEX
=SML
val ⦏z_ℝ_lit_lemma4⦎ = (
set_goal([], ⌜∀m n⦁ ⓩ(~⌜Z'Int m⌝) /⋎Z ~ ⌜Z'Int (n + 1)⌝⌝ = m/(n+1)⌝);
a(rewrite_tac[get_specⓩ(_ /⋎Z _)⌝, z_ℝ_real_ℕℝ_thm, get_spec⌜$/⋎N⌝]);
a(rewrite_tac[main_defs, z_ℝ_real_ℕℝ_thm] THEN REPEAT strip_tac);
a(lemma_tac⌜¬ ℕℝ (n + 1) = ℕℝ 0⌝ THEN1
	PC_T1 "basic_hol" rewrite_tac[ℕℝ_one_one_thm]);
a(lemma_tac⌜¬ (~⋎R(ℕℝ (n + 1)) = ℕℝ 0)⌝ THEN1
	(conv_tac (RAND_C eq_sym_conv) THEN once_rewrite_tac[ℝ_eq_thm]
	THEN rewrite_tac[ℝ_minus_clauses] THEN
	PC_T1 "basic_hol" rewrite_tac[ℕℝ_one_one_thm]));
a(ante_tac (list_∀_elim[ ⌜~⋎R(ℕℝ (n + 1))⌝, ⌜ℕℝ (n + 1)⌝]ℝ_cross_mult_eq_thm));
a(asm_rewrite_tac[] THEN REPEAT strip_tac);
a(asm_rewrite_tac[]);
a(rewrite_tac[ℝ_times_minus_thm, ∀_elim⌜ℕℝ m⌝ℝ_times_order_thm]);
pop_thm()
);
=TEX
=SML
val ⦏z_ℝ_lit_lemma5⦎ = z_ℝ_real_ℕℝ_thm;
val ⦏z_ℝ_minus_thm⦎ = tac_proof(
	([], ⌜∀x⦁ⓩ~⋎R x⌝ = ~⋎R x⌝),
	rewrite_tac[main_defs]);
val ⦏ℝ_minus_minus_thm⦎ = tac_proof(
	([], ⌜∀x⦁⌜~⋎R (~⋎R x)⌝ = x⌝),
	rewrite_tac[ℝ_minus_clauses]);
=TEX
=SML
val ⦏z_real_minus_thm⦎ = tac_proof(
	([], ⌜∀i⦁ⓩreal (~i) = ~⋎R (real i)⌝⌝),
	rewrite_tac[main_defs]);
=SML
fun ⦏Z_LEFT_C⦎ (c : CONV) : CONV = RAND_C (LEFT_C c);
fun ⦏Z_RIGHT_C⦎ (c : CONV) : CONV = RAND_C (RIGHT_C c);
fun ⦏Z_RANDS_C⦎ (c : CONV) : CONV = RAND_C (RANDS_C c);
val ⦏Z_RAND_C⦎ : CONV -> CONV = RAND_C;
=IGN
Z_RIGHT_C z_plus_conv ⓩ1 /⋎Z (1+2)⌝;
Z_LEFT_C z_plus_conv ⓩ (2+3) /⋎Z (1+2)⌝;
Z_RANDS_C z_plus_conv ⓩ (2+3) /⋎Z (1+2)⌝;
Z_RAND_C z_plus_conv ⓩ f x (1+2)⌝;
=TEX
=SML
val ⦏ℕ_one⦎ = ⌜1⌝;
val ⦏pos_conv⦎ : CONV = (fn tm =>
	let	val n = dest_ℕ tm;
	in	eq_sym_rule (plus_conv(mk_plus(mk_ℕ(n @- one), ℕ_one)))
	end
);
=TEX
=SML
val rec  ⦏z_ℝ_lit_conv⦎ : CONV = (fn tm =>
	(FIRST_C [
		simple_eq_match_conv z_ℝ_lit_lemma1,
		Z_RIGHT_C (Z_RAND_C(RAND_C pos_conv)) THEN_C
			simple_eq_match_conv z_ℝ_lit_lemma2 THEN_C
			RAND_C (RIGHT_C plus_conv),
		Z_RIGHT_C (RAND_C pos_conv) THEN_C
			simple_eq_match_conv z_ℝ_lit_lemma3 THEN_C
			RAND_C (RIGHT_C plus_conv),
		Z_RIGHT_C (Z_RAND_C(RAND_C pos_conv)) THEN_C
			simple_eq_match_conv z_ℝ_lit_lemma4 THEN_C
			RIGHT_C plus_conv,
		simple_eq_match_conv z_ℝ_lit_lemma5,
		simple_eq_match_conv z_ℝ_minus_thm THEN_TRY_C
			RAND_C z_ℝ_lit_conv THEN_TRY_C
			simple_eq_match_conv ℝ_minus_minus_thm,
		simple_eq_match_conv z_real_minus_thm THEN_TRY_C z_ℝ_lit_conv
	] THEN_TRY_C ℝ_eval_conv) tm
	handle Fail _ => term_fail "z_ℝ_lit_conv" 117001 [tm]
);
=IGN
z_ℝ_lit_convⓩ 1/⋎Z 2⌝;
z_ℝ_lit_convⓩ 1/⋎Z ~2⌝;
z_ℝ_lit_convⓩ ~ 1/⋎Z 2⌝;
z_ℝ_lit_convⓩ ~ 1/⋎Z ~2⌝;
z_ℝ_lit_convⓩ real 42⌝;
z_ℝ_lit_convⓩ ~⋎R real 42⌝;
z_ℝ_lit_convⓩ 0 /⋎Z 42⌝;
z_ℝ_lit_convⓩ~⋎R (1 /⋎Z 6)⌝;
=TEX
=SML
val ⦏z_ℝ_lit_lemma6⦎ = conv_rule (ONCE_MAP_C eq_sym_conv) z_ℝ_lit_lemma1;
val ⦏z_ℝ_lit_lemma7⦎ = conv_rule (ONCE_MAP_C eq_sym_conv) z_ℝ_lit_lemma5;
val ⦏z_ℝ_lit_lemma8⦎ = conv_rule (ONCE_MAP_C eq_sym_conv) z_ℝ_minus_thm;
val ⦏z_ℝ_lit_lemma9⦎ = tac_proof(([], ⓩ~⋎R (real 0) = real 0⌝),
	rewrite_tac[rewrite_rule[z_get_specⓩℝ⌝] z_ℝ_minus_clauses]);

val ⦏z_ℝ_lit_conv1⦎ : CONV = (fn tm =>
	(TRY_C ℝ_eval_conv
	THEN_C FIRST_C [
		simple_eq_match_conv z_ℝ_lit_lemma6,
		simple_eq_match_conv z_ℝ_lit_lemma7,
		RAND_C (simple_eq_match_conv z_ℝ_lit_lemma6) THEN_C
			simple_eq_match_conv z_ℝ_lit_lemma8,
		RAND_C (simple_eq_match_conv z_ℝ_lit_lemma7) THEN_C
			simple_eq_match_conv z_ℝ_lit_lemma8
	] THEN_TRY_C simple_eq_match_conv z_ℝ_lit_lemma9) tm
	handle Fail _ => term_fail "z_ℝ_lit_conv1" 117002 [tm]
);
=SML
val ⦏z_ℝ_lit_norm_conv⦎ = (fn tm =>
	(CHANGED_C (z_ℝ_lit_conv THEN_TRY_C
	(ℝ_frac_norm_conv ORELSE_C RAND_C ℝ_frac_norm_conv)	THEN_C
	z_ℝ_lit_conv1)) tm
	handle Fail _ => term_fail "z_ℝ_lit_norm_conv" 117001 [tm]
);
=IGN
z_ℝ_lit_norm_convⓩ1 /⋎Z 9⌝;
=IGN
z_ℝ_lit_conv1 ⌜1/2⌝;
z_ℝ_lit_conv1 ⌜~⋎R(1/2)⌝;
z_ℝ_lit_conv1 ⌜ℕℝ 87⌝;
z_ℝ_lit_conv1 ⌜~⋎R(ℕℝ 87)⌝;
z_ℝ_lit_norm_conv ⓩ~87 /⋎Z 3⌝;
z_ℝ_lit_norm_conv ⓩ~88 /⋎Z 3⌝;
z_ℝ_lit_norm_conv ⓩ88 /⋎Z ~4⌝;
z_ℝ_lit_norm_conv ⓩ88 /⋎Z 4⌝;
z_ℝ_lit_norm_conv ⓩ0 /⋎Z 4⌝;
z_ℝ_lit_norm_conv ⓩ~0 /⋎Z 4⌝;
z_ℝ_lit_norm_conv ⓩ0 /⋎Z ~4⌝;
z_ℝ_lit_norm_conv ⓩ~0 /⋎Z 4⌝;
z_ℝ_lit_norm_conv ⓩ~⋎R(~0 /⋎Z ~2)⌝;
=TEX

=SML
val z_ℝ_plus_thm = tac_proof(
	([], ⌜∀x y⦁ⓩx +⋎R y⌝ = x +⋎R y⌝),
	rewrite_tac[main_defs]);
val z_ℝ_times_thm = tac_proof(
	([], ⌜∀x y⦁ⓩx *⋎R y⌝ = x *⋎R y⌝),
	rewrite_tac[main_defs]);
val z_ℝ_less_thm = tac_proof(
	([], ⌜∀x y⦁ⓩx <⋎R y⌝ ⇔ x <⋎R y⌝),
	rewrite_tac[main_defs]);
val z_ℝ_≤_thm = tac_proof(
	([], ⌜∀x y:ℝ⦁ⓩx ≤⋎R y⌝ ⇔ x ≤⋎R y⌝),
	rewrite_tac[main_defs]);
val z_ℝ_over_thm = tac_proof(
	([], ⌜∀x y⦁ⓩx /⋎R y⌝ = x /⋎R y⌝),
	rewrite_tac[main_defs]);
val z_ℝ_abs_thm = tac_proof(
	([], ⌜∀x⦁ⓩabs⋎R x⌝ = Abs⋎R x⌝),
	rewrite_tac[main_defs]);
=TEX
=SML
fun ⦏mk_bin_rel_conv⦎ (nm : string) (pat : TERM) (th : THM) (c : CONV) : CONV = (fn tm =>
	(LEFT_C (RANDS_C z_ℝ_lit_conv) THEN_C simple_eq_match_conv th THEN_C c) tm
	handle Fail _ => term_fail nm 117003 [tm, pat]
);
=TEX
=SML
fun ⦏mk_bin_comp_conv⦎ (nm : string) (pat : TERM) (th : THM) (c : CONV) : CONV = (fn tm =>
	(Z_RANDS_C z_ℝ_lit_conv THEN_C simple_eq_match_conv th THEN_C c THEN_C z_ℝ_lit_conv1) tm
	handle Fail _ => term_fail nm 117003 [tm, pat]
);
=TEX
=SML
val ⦏z_ℝ_plus_conv⦎ : CONV = mk_bin_comp_conv "z_ℝ_plus_conv" ⓩx +⋎R y⌝ z_ℝ_plus_thm ℝ_plus_conv;
val ⦏z_ℝ_times_conv⦎ : CONV = mk_bin_comp_conv "z_ℝ_times_conv"ⓩx *⋎R y⌝  z_ℝ_times_thm ℝ_times_conv;

val ⦏z_ℝ_over_conv⦎ : CONV = mk_bin_comp_conv "z_ℝ_over_conv" ⓩx /⋎R y⌝  z_ℝ_over_thm ℝ_over_conv;
val ⦏z_ℝ_less_conv⦎ : CONV = mk_bin_rel_conv "z_ℝ_less_conv" ⓩx <⋎R y⌝  z_ℝ_less_thm ℝ_less_conv;
val ⦏z_ℝ_≤_conv⦎ : CONV = mk_bin_rel_conv "z_ℝ_≤_conv" ⓩx ≤⋎R y⌝ z_ℝ_≤_thm ℝ_≤_conv;
val ⦏z_ℝ_eq_conv⦎ : CONV = (fn tm =>
	(RANDS_C z_ℝ_lit_conv THEN_C ℝ_eq_conv) tm
	handle Fail _ => term_fail "z_ℝ_eq_conv" 117003 [tm, ⓩx = y⌝]
);
=IGN
z_ℝ_plus_convⓩ1 /⋎Z 2 +⋎R 1 /⋎Z 2⌝;
z_ℝ_times_convⓩ(1 /⋎Z 2) *⋎R (1 /⋎Z 2)⌝;
z_ℝ_over_convⓩ(1 /⋎Z 2) /⋎R (1 /⋎Z 2)⌝;
=TEX
=SML
val ⦏z_ℝ_abs_conv⦎ : CONV = (fn tm =>
	(Z_RAND_C z_ℝ_lit_conv THEN_C simple_eq_match_conv z_ℝ_abs_thm
	THEN_C ℝ_abs_conv THEN_C z_ℝ_lit_conv1) tm
	handle Fail _ => term_fail "z_ℝ_abs_conv" 117004 [tm, ⓩabs⋎R x⌝]
);
=IGN
z_ℝ_abs_convⓩabs⋎R (real 42)⌝;
z_ℝ_abs_convⓩabs⋎R ~⋎R (real 42)⌝;
=TEX
=SML
val ⦏z_ℝ_minus_conv_thm1⦎ = (
set_goal([], ⌜∀m n⦁ ⓩ ~ x /⋎Z  ⌜Z'Int (n + 1)⌝ = ~⋎R ( x /⋎Z ⌜Z'Int (n + 1)⌝ ) ⌝ ⌝);
a(rewrite_tac[get_specⓩ(_ /⋎Z _)⌝, get_spec⌜$/⋎N⌝]);
a(rewrite_tac[main_defs] THEN REPEAT strip_tac);
a(rewrite_tac[z_ℝ_real_ℕℝ_thm]);
a(lemma_tac⌜¬ ℕℝ (n + 1) = ℕℝ 0⌝ THEN1
	PC_T1 "basic_hol" rewrite_tac[ℕℝ_one_one_thm]);
a(ALL_FC_T rewrite_tac[ℝ_over_times_recip_thm]);
a(rewrite_tac[ℝ_times_minus_thm]);
pop_thm()
);
=TEX
=SML
val ⦏z_ℝ_minus_conv_thm2⦎ = (
set_goal([], ⌜∀x n⦁ ⓩ x /⋎Z  ~ ⌜Z'Int (n + 1)⌝ = ~⋎R ( x /⋎Z ⌜Z'Int (n + 1)⌝ ) ⌝⌝);
a(rewrite_tac[get_specⓩ(_ /⋎Z _)⌝, get_spec⌜$/⋎N⌝]);
a(rewrite_tac[main_defs, z_ℝ_real_ℕℝ_thm] THEN REPEAT strip_tac);
a(lemma_tac⌜¬ ℕℝ (n + 1) = ℕℝ 0⌝ THEN1
	PC_T1 "basic_hol" rewrite_tac[ℕℝ_one_one_thm]);
a(lemma_tac⌜¬ ~⋎R(ℕℝ (n + 1)) = ℕℝ 0⌝ THEN1
	(conv_tac (RAND_C eq_sym_conv) THEN once_rewrite_tac[ℝ_eq_thm]
	THEN rewrite_tac[ℝ_minus_clauses] THEN
	PC_T1 "basic_hol" rewrite_tac[ℕℝ_one_one_thm]));
a(ALL_FC_T rewrite_tac[ℝ_over_times_recip_thm, ℝ_minus_recip_thm]);
a(rewrite_tac[ℝ_times_minus_thm]);
pop_thm()
);
=TEX
=SML
val ⦏z_ℝ_minus_conv_thm3⦎ = (
set_goal([], ⌜∀x n⦁ ⓩ~x /⋎Z ~ ⌜Z'Int (n + 1)⌝ = x /⋎Z ⌜Z'Int (n + 1)⌝⌝⌝);
a(rewrite_tac[get_specⓩ(_ /⋎Z _)⌝, z_ℝ_real_ℕℝ_thm, get_spec⌜$/⋎N⌝]);
a(rewrite_tac[main_defs, z_ℝ_real_ℕℝ_thm] THEN REPEAT strip_tac);
a(lemma_tac⌜¬ ℕℝ (n + 1) = ℕℝ 0⌝ THEN1
	PC_T1 "basic_hol" rewrite_tac[ℕℝ_one_one_thm]);
a(lemma_tac⌜¬ (~⋎R(ℕℝ (n + 1)) = ℕℝ 0)⌝ THEN1
	(conv_tac (RAND_C eq_sym_conv) THEN once_rewrite_tac[ℝ_eq_thm]
	THEN rewrite_tac[ℝ_minus_clauses] THEN
	PC_T1 "basic_hol" rewrite_tac[ℕℝ_one_one_thm]));
a(ALL_FC_T rewrite_tac[ℝ_over_times_recip_thm, ℝ_minus_recip_thm]);
a(rewrite_tac[ℝ_times_minus_thm]);
pop_thm()
);
=TEX
=SML
val ⦏z_ℝ_minus_conv_thm3⦎ = tac_proof(
	([], ⌜∀x⦁ⓩ~⋎R (~⋎R x) = x⌝⌝),
	rewrite_tac[main_defs, ℝ_minus_clauses]);
=TEX
=SML
val ⦏z_ℝ_minus_conv⦎ : CONV = (fn tm =>
	REPEAT_C1 (FIRST_C [
		simple_eq_match_conv z_real_minus_thm,
		Z_RIGHT_C(RAND_C pos_conv) THEN_C
			simple_eq_match_conv z_ℝ_minus_conv_thm1 THEN_C
			RAND_C(Z_RIGHT_C (RAND_C plus_conv)),
		Z_RIGHT_C (RAND_C (RAND_C pos_conv)) THEN_C
			(
			(simple_eq_match_conv z_ℝ_minus_conv_thm3 THEN_C
				Z_RIGHT_C (RAND_C plus_conv))  ORELSE_C
			(simple_eq_match_conv z_ℝ_minus_conv_thm2 THEN_C
				RAND_C(Z_RIGHT_C (RAND_C plus_conv)))),
		simple_eq_match_conv z_ℝ_minus_conv_thm3
	] THEN_TRY_C z_ℝ_lit_norm_conv) tm
	handle Fail _ => term_fail "z_ℝ_minus_conv" 117107 [tm]
);
=IGN
z_ℝ_minus_convⓩreal (~(42))⌝;
z_ℝ_minus_convⓩ(~3 /⋎Z 7)⌝;
z_ℝ_minus_convⓩ(3 /⋎Z ~7)⌝;
z_ℝ_minus_convⓩ(~3 /⋎Z ~7)⌝;
=TEX
=SML
val ⦏z_ℤ_exp_lemma1⦎ = (
set_goal([], ⌜∀x m⦁ⓩx ^⋎Z ⌜(Z'Int m)⌝⌝ = x ^⋎N m⌝);
a(rewrite_tac[main_defs]);
pop_thm()
);
=TEX
=SML
val ⦏z_ℤ_exp_lemma2⦎ = (
set_goal([], ⌜∀x m⦁ⓩx ^⋎Z ~⌜(Z'Int (m+1))⌝⌝ = ℕℝ 1 /⋎R (x ^⋎N (m+1))⌝);
a(REPEAT strip_tac THEN rewrite_tac[main_defs]);
pop_thm()
);
=TEX
=SML
val ⦏z_ℤ_exp_lemma3⦎ = (
set_goal([], ⌜∀x m⦁ⓩx ^⋎Z ⌜(Z'Int 0)⌝⌝ = ⓩreal 1⌝⌝);
a(REPEAT strip_tac THEN rewrite_tac[main_defs]);
pop_thm()
);
=TEX
=SML
val ⦏z_ℤ_exp_lemma4⦎ = (
set_goal([], ⌜∀x m⦁ⓩx ^⋎Z ~⌜(Z'Int 0)⌝⌝ = ⓩreal 1⌝⌝);
a(REPEAT strip_tac THEN rewrite_tac[main_defs]);
pop_thm()
);
=TEX
=SML
val ⦏z_ℝ_ℤ_exp_conv⦎ : CONV = (fn tm =>
	(FIRST_C [
	(simple_eq_match_conv z_ℤ_exp_lemma3),
	(simple_eq_match_conv z_ℤ_exp_lemma4),
	(simple_eq_match_conv z_ℤ_exp_lemma1 THEN_C
		LEFT_C z_ℝ_lit_conv THEN_C ℝ_ℕ_exp_conv THEN_C z_ℝ_lit_conv1),
	(RIGHT_C(RIGHT_C(RIGHT_C(RAND_C(pos_conv)))) THEN_C
	simple_eq_match_conv z_ℤ_exp_lemma2 THEN_C
		RIGHT_C (RIGHT_C plus_conv THEN_C LEFT_C z_ℝ_lit_conv THEN_C ℝ_ℕ_exp_conv) THEN_C
		ℝ_over_conv THEN_TRY_C
		RIGHT_C (TRY_C(ℝ_recip_conv THEN_C ℝ_times_conv)) THEN_C z_ℝ_lit_conv1)
]	THEN_TRY_C z_ℝ_lit_norm_conv) tm
	handle Fail _ => term_fail "z_ℝ_ℤ_exp_conv" 117005 [tm]
);
=IGN
z_ℝ_ℤ_exp_convⓩreal 5 ^⋎Z 2⌝;
z_ℝ_ℤ_exp_convⓩ(3/⋎Z 7) ^⋎Z 2⌝;
z_ℝ_ℤ_exp_convⓩreal 10 ^⋎Z 3⌝;
z_ℝ_ℤ_exp_convⓩreal 10 ^⋎Z ~3⌝;
z_ℝ_ℤ_exp_convⓩ(real 7) ^⋎Z ~2⌝;
z_ℝ_ℤ_exp_convⓩ(3/⋎Z 7) ^⋎Z ~2⌝;
z_ℝ_ℤ_exp_convⓩ(3/⋎Z 7) ^⋎Z ~1⌝;
z_ℝ_ℤ_exp_convⓩ(3/⋎Z 7) ^⋎Z ~0⌝;
z_ℝ_ℤ_exp_convⓩ(3/⋎Z 7) ^⋎Z 0⌝;
z_ℝ_ℤ_exp_convⓩ(3/⋎Z 7) ^⋎Z 1⌝;
z_ℝ_ℤ_exp_convⓩ(3/⋎Z 7) ^⋎Z 2⌝;
z_ℝ_ℤ_exp_convⓩ(1/⋎Z 7) ^⋎Z ~2⌝;
z_ℝ_ℤ_exp_convⓩ(1/⋎Z 7) ^⋎Z ~1⌝;
z_ℝ_ℤ_exp_convⓩ(1/⋎Z 7) ^⋎Z ~0⌝;
z_ℝ_ℤ_exp_convⓩ(1/⋎Z 7) ^⋎Z 0⌝;
z_ℝ_ℤ_exp_convⓩ(1/⋎Z 7) ^⋎Z 1⌝;
z_ℝ_ℤ_exp_convⓩ(1/⋎Z 7) ^⋎Z 2⌝;
=TEX
=SML
val z_ℝ_≥_thm = tac_proof(
	([], ⌜∀x y:ℝ⦁ⓩx ≥⋎R y ⇔ y ≤⋎R x⌝⌝),
	rewrite_tac[rewrite_rule[main_defs]z_ℝ_≥_def, main_defs]);
val z_ℝ_greater_thm = tac_proof(
	([], ⌜∀x y:ℝ⦁ⓩx >⋎R y ⇔ y <⋎R x⌝⌝),
	rewrite_tac[rewrite_rule[main_defs]z_ℝ_greater_def, main_defs]);
val z_ℝ_subtract_thm = tac_proof(
	([], ⌜∀x y:ℝ⦁ⓩx -⋎R y  = x +⋎R ~⋎R y⌝⌝),
	rewrite_tac[rewrite_rule[main_defs]z_ℝ_subtract_def, main_defs]);
=TEX
=SML
val ⦏z_ℝ_≥_conv⦎ = (fn tm =>
	simple_eq_match_conv z_ℝ_≥_thm tm
	handle Fail _ => term_fail "z_ℝ_≥_conv" 117102 [tm]
);
val ⦏z_ℝ_greater_conv⦎ = (fn tm =>
	simple_eq_match_conv z_ℝ_greater_thm tm
	handle Fail _ => term_fail "z_ℝ_greater_conv" 117105 [tm]
);
val ⦏z_ℝ_subtract_conv⦎ = (fn tm =>
	simple_eq_match_conv z_ℝ_subtract_thm tm
	handle Fail _ => term_fail "z_ℝ_subtract_conv" 117111 [tm]
);
=IGN
z_ℝ_≥_convⓩx ≥⋎R y⌝;
z_ℝ_greater_convⓩx >⋎R y⌝;
z_ℝ_subtract_convⓩx -⋎R y⌝;
=TEX
\subsection{General Evaluation Conversion}
The following are also used in the linear arithmetic proof context.
=SML
val ⦏to_hol_plus_conv⦎ = simple_eq_match_conv z_ℝ_plus_thm;
val ⦏to_hol_minus_conv⦎ = simple_eq_match_conv z_ℝ_minus_thm;
val ⦏to_hol_times_conv⦎ = simple_eq_match_conv z_ℝ_times_thm;
val ⦏to_hol_over_conv⦎ = simple_eq_match_conv z_ℝ_over_thm;
val ⦏to_hol_less_conv⦎ = simple_eq_match_conv z_ℝ_less_thm;
val ⦏to_hol_≤_conv⦎ = simple_eq_match_conv z_ℝ_≤_thm;
val ⦏to_hol_abs_conv⦎ = simple_eq_match_conv z_ℝ_abs_thm;
val ⦏to_hol_lit_conv⦎ = z_ℝ_lit_conv;
val ⦏to_hol_ℤ_exp_conv⦎ =
	simple_eq_match_conv z_ℤ_exp_lemma1 ORELSE_C simple_eq_match_conv z_ℤ_exp_lemma2;
=IGN
to_hol_plus_convⓩx +⋎R y⌝;
to_hol_minus_convⓩ~⋎R y⌝;
to_hol_times_convⓩx *⋎R y⌝;
to_hol_over_convⓩx /⋎R y⌝;
to_hol_less_convⓩx <⋎R y⌝;
to_hol_≤_convⓩreal 9 ≤⋎R y⌝;
to_hol_lit_convⓩreal 99⌝;
to_hol_lit_convⓩ~ 4/⋎Z 5⌝;
to_hol_ℤ_exp_convⓩreal 1 ^⋎Z 9⌝;
to_hol_ℤ_exp_convⓩreal 1 ^⋎Z ~9⌝;
=TEX
=SML
val ⦏z_eval_net⦎ = switch list_net_enter empty_net
[
	(ⓩx +⋎R y⌝, (Z_RANDS_C, z_ℝ_plus_conv)),
	(ⓩx -⋎R y⌝, (Z_RANDS_C, z_ℝ_subtract_conv THEN_C z_ℝ_plus_conv)),
	(ⓩx *⋎R y⌝, (Z_RANDS_C, z_ℝ_times_conv)),
	(ⓩx /⋎R y⌝, (Z_RANDS_C, z_ℝ_over_conv)),
	(ⓩabs⋎R x⌝, (Z_RANDS_C, z_ℝ_abs_conv)),
	(ⓩ~⋎R x⌝, (Z_RAND_C, z_ℝ_minus_conv))
];
=TEX
=SML
val rec ⦏Z_ℝ_EVAL_C⦎ : CONV -> CONV = (fn user_conv => fn tm =>
	let	fun chk tm = (
			let	val tm2 = dest_ℝ_minus tm	handle Fail _=> tm;
			in	let	val (a, b) = dest_z_ℝ_frac tm2;
					val (_, bi) = (dest_z_signed_int a, dest_z_signed_int b);
				in	bi <> zero
				end	handle Fail _ =>
				let	val m = dest_z_real tm2;
				in	is_z_signed_int m
				end	handle Fail _ => false
			end
		);
	in	case net_lookup z_eval_net tm of
			[(C, conv)] => C (TRY_C(Z_ℝ_EVAL_C user_conv)) THEN_C conv
		|	_ => TRY_C (user_conv ORELSE_C z_ℝ_minus_conv)
				THEN_C COND_C chk id_conv fail_conv
	end	tm
	handle	Fail _ => term_fail "Z_ℝ_EVAL_C" 117020 [tm]
);
val ⦏z_ℝ_eval_conv⦎ : CONV = Z_ℝ_EVAL_C fail_conv;
=TEX
=SML
val ⦏z_minus_minus_conv⦎ = simple_eq_match_conv
	(prove_rule[]⌜∀x : ℤ ⦁ⓩ~(~x) = x⌝⌝);
=TEX
=SML
val ⦏z'float_def⦎ = get_spec ⌜Z'Float⌝;
val ⦏z_float_conv⦎ : CONV = (fn tm =>
	(simple_eq_match_conv z'float_def THEN_C
	Z_RIGHT_C(Z_RIGHT_C(
		Z_RIGHT_C (TRY_C z_minus_minus_conv)
			THEN_C z_plus_conv)) THEN_C
	Z_RIGHT_C z_ℝ_ℤ_exp_conv THEN_C
	z_ℝ_times_conv) tm
	handle Fail _ => term_fail "z_float_conv" 117006 [tm]
);
=TEX
\section{PROOF CONTEXTS}
=SML
fun ⦏thms_to_eqn_cxt⦎ (thms:THM list) : EQN_CXT = (
	flat(map (cthm_eqn_cxt(current_ad_rw_canon())) thms)
);
=TEX	
=SML
val _ = delete_pc "'z_reals" handle Fail _ => ();
val _ = new_pc "'z_reals";
val _ = set_rw_eqn_cxt	
		[	(ⓩi +⋎R j⌝, z_ℝ_plus_conv),
			(ⓩi *⋎R j⌝, z_ℝ_times_conv),
			(ⓩi /⋎R j⌝, z_ℝ_over_conv),
			(ⓩi *⋎R j⌝, z_ℝ_times_conv),
			(ⓩi ^⋎Z j⌝, z_ℝ_ℤ_exp_conv),
			(ⓩi -⋎R j⌝, z_ℝ_subtract_conv),
			(ⓩ(i⦂R) = j⌝, z_ℝ_eq_conv),
			(ⓩ~⋎R i⌝, z_ℝ_minus_conv),
			(ⓩreal(~ i)⌝, z_ℝ_minus_conv),
			(ⓩabs⋎R i⌝, z_ℝ_abs_conv),
			(ⓩi ≤⋎R j⌝, z_ℝ_≤_conv),
			(ⓩi <⋎R j⌝, z_ℝ_less_conv),
			(ⓩi ≥⋎R j⌝, z_ℝ_≥_conv),
			(ⓩi >⋎R j⌝, z_ℝ_greater_conv),
			(ⓩ⌜Z'Int m⌝ /⋎Z ⌜Z'Int n⌝⌝, z_ℝ_lit_norm_conv)
		] "'z_reals";
fun ⦏u_simp⦎ (thm : THM) : THM = rewrite_rule[z_ℝ_def] thm;

val _ = add_rw_thms (map u_simp[z_ℝ_plus_clauses, z_ℝ_minus_clauses, z_ℝ_≤_clauses,
	 z_ℝ_less_clauses, z_ℝ_times_clauses])
	"'z_reals";
val pos = (thms_to_eqn_cxt(map u_simp[z_ℝ_minus_clauses,
		z_ℝ_≤_clauses,
		z_ℝ_less_clauses])) @
	[(ⓩ(i⦂ℝ) = j⌝, z_ℝ_eq_conv),
	(ⓩi ≥⋎R j⌝, z_ℝ_≥_conv),
	(ⓩi >⋎R j⌝, z_ℝ_greater_conv)];
val neg = mapfilter (mk_¬ ** RAND_C) pos;
val neutral = [(ⓩi ≤⋎R j⌝, z_≤_conv),
	(ⓩi <⋎R j⌝, z_less_conv)];

val ⦏strip_eqn_cxt⦎ = neutral @ pos @ neg;

val _ = set_st_eqn_cxt strip_eqn_cxt "'z_reals";
val _ = set_sc_eqn_cxt strip_eqn_cxt "'z_reals";
val _ = set_u_simp_eqn_cxt (theory_u_simp_eqn_cxt"z_reals") "'z_reals";
val _ = set_pr_tac z_basic_prove_tac "'z_reals";
val _ = set_pr_conv z_basic_prove_conv "'z_reals";
val _ = commit_pc "'z_reals";
=TEX
=IGN
MERGE_PCS_C1 ["'z_reals", "z_sets_alg"] rewrite_conv[]ⓩx ∈ ℝ⌝;
MERGE_PCS_C1 ["'z_reals", "z_sets_alg"] rewrite_conv[]ⓩ(1 /⋎Z 2) +⋎R (1 /⋎Z 2)⌝;
MERGE_PCS_C1 ["'z_reals", "z_sets_alg"] rewrite_conv[]ⓩ(1 /⋎Z 2) <⋎R (1 /⋎Z 2)⌝;
MERGE_PCS_C1 ["'z_reals", "z_sets_alg"] rewrite_conv[]ⓩ(1 /⋎Z 2) *⋎R (1 /⋎Z 2)⌝;
MERGE_PCS_C1 ["'z_reals", "z_sets_alg"] rewrite_conv[]ⓩ(1 /⋎Z 2) /⋎R (1 /⋎Z 2)⌝;
MERGE_PCS_C1 ["'z_reals", "z_sets_alg"] rewrite_conv[]ⓩ(1 /⋎Z 2) ^⋎Z 3⌝;
MERGE_PCS_C1 ["'z_reals", "z_sets_alg"] rewrite_conv[]ⓩ(1 /⋎Z 2) -⋎Z real 3⌝;

MERGE_PCS_C1 ["'z_reals", "z_sets_alg"] rewrite_conv[]ⓩ(1 /⋎Z 2) >⋎R (1 /⋎Z 2)⌝;
MERGE_PCS_C1 ["'z_reals", "z_sets_alg"] rewrite_conv[]ⓩ(1 /⋎Z 2) <⋎R (1 /⋎Z 2)⌝;
MERGE_PCS_C1 ["'z_reals", "z_sets_alg"] rewrite_conv[]ⓩ(1 /⋎Z 2) ≤⋎R (1 /⋎Z 2)⌝;
MERGE_PCS_C1 ["'z_reals", "z_sets_alg"] rewrite_conv[]ⓩ(1 /⋎Z 2) ≥⋎R (1 /⋎Z 2)⌝;
=TEX
=TEX	
=SML
val _ = delete_pc "z_ℝ_lin_arith" handle Fail _ => ();
val _ = new_pc "z_ℝ_lin_arith";
val _ = set_rw_eqn_cxt	
		[	(ⓩi +⋎R j⌝, to_hol_plus_conv),
			(ⓩi *⋎R j⌝, to_hol_times_conv),
			(ⓩi /⋎R j⌝, to_hol_over_conv),
			(ⓩi *⋎R j⌝, to_hol_times_conv),
			(ⓩi ^⋎Z j⌝, to_hol_ℤ_exp_conv),
			(ⓩi *⋎R j⌝, to_hol_times_conv),
			(ⓩi -⋎R j⌝, z_ℝ_subtract_conv),
			(ⓩ~⋎R i⌝, to_hol_minus_conv),
			(ⓩi ≤⋎R j⌝, to_hol_≤_conv),
			(ⓩi <⋎R j⌝, to_hol_less_conv),
			(ⓩi ≥⋎R j⌝, z_ℝ_≥_conv),
			(ⓩi >⋎R j⌝, z_ℝ_greater_conv),
			(ⓩreal m⌝, to_hol_lit_conv),
			(ⓩabs⋎R m⌝, to_hol_abs_conv),
			(ⓩ⌜Z'Int m⌝ /⋎Z ⌜Z'Int n⌝⌝, to_hol_lit_conv),
			(⌜Z'Float x p e⌝, z_float_conv)
		] "z_ℝ_lin_arith";
=TEX
Now the tactic which is the automatic proof tactic.
=SML
val ⦏z_ℝ_lin_arith_prove_tac⦎ : THM list -> TACTIC = (fn thl => fn gl =>
	((	DROP_ASMS_T (MAP_EVERY ante_tac)
	THEN_TRY	rewrite_tac thl
	THEN	PC_T1 "ℝ_lin_arith" prove_tac[]) gl)
	handle ex => reraise ex "z_ℝ_lin_arith_prove_conv"
);
=TEX
and the associated conversion:
=SML
val ⦏z_ℝ_lin_arith_prove_conv⦎ : THM list -> CONV = (fn thl => fn tm =>
	let	val th = tac_proof(([], tm), z_ℝ_lin_arith_prove_tac thl);
	in	⇔_t_intro  th
	end	handle ex => reraise ex "z_ℝ_lin_arith_prove_conv"
);
=TEX
=SML
val _ = set_u_simp_eqn_cxt (theory_u_simp_eqn_cxt"z_reals") "z_ℝ_lin_arith";
val _ = set_pr_tac z_ℝ_lin_arith_prove_tac "z_ℝ_lin_arith";
val _ = set_pr_conv z_ℝ_lin_arith_prove_conv "z_ℝ_lin_arith";
val _ = commit_pc "z_ℝ_lin_arith";
=IGN
PC_C1 "z_ℝ_lin_arith" rewrite_conv[]ⓩx +⋎R y *⋎R real 42 +⋎R 9 /⋎Z 10⌝;
PC_C1 "z_ℝ_lin_arith" prove_conv[]	ⓩx <⋎R y <⋎R z ⇒ x <⋎R z⌝;
PC_C1 "z_ℝ_lin_arith" rewrite_conv[]	ⓩ
	(real 2 ^⋎Z 5) *⋎R x <⋎R y <⋎R z ⇒ x <⋎R z /⋎R real 31⌝;

val gl : GOAL = ([], ⓩx <⋎R y <⋎R z ⇒ x <⋎R z⌝);
tac_proof(gl, PC_T1 "z_ℝ_lin_arith" prove_tac[]);

=TEX
\section{EPILOGUE}
=SML
end (* of structure ZReals *);
open ZReals;
=TEX
\twocolumn[\section{INDEX}]
\small
\printindex

\end{document}








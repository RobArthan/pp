=IGN
********************************************************************************
imp114.doc: this file is part of the PPHol system

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

\def\Title{ Implementation: Theory of Dyadic Rationals }

\def\Abstract{\begin{center}
{\bf Abstract}\par\parbox{0.7\hsize}
{\small This document gives the implementation for the (multiplicative) theory
of dyadic rational numbers that is used in constructing the representation
type for the real numbers in \ProductHOL.}
\end{center}}

\def\Reference{LEMMA1/HOL/IMP114}

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
\item[Issues 1.1 (2000/12/04)] First draft.
\item[Issue 1.3 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.4 (2002/10/17)] PPHol-specific updates for open source release
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.
\item[2015/04/15]
Now uses new date and version macros from doctex
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


\section{PROLOGUE}
=SML
structure ⦏Dyadic⦎ : Dyadic = struct
val _ = open_theory"dyadic";
val _ = set_merge_pcs["basic_hol", "'ℤ"];
=TEX
Change the following as per the comment to save all the intermediate lemmas:
=SML
fun ⦏pop_lemma⦎ (name : string) = pop_thm()
(* or save_pop_thm name to save the lemmas *);
=TEX
\section{A USEFUL TACTIC}
This tactic could be made generally available at a later date:
=SML
local
val fst_tm = ⌜Fst : 'a × 'b → 'a⌝;
val snd_tm = ⌜Snd : 'a × 'b → 'b⌝;
val a_ty = ⓣ'a⌝;
val b_ty = ⓣ'b⌝;
val def_thm = get_spec fst_tm;
in
fun ⦏pair_tac⦎ (tm : TERM) : TACTIC = (
	let	val (x, ab) = dest_eq tm;
		val (a, b) = dest_pair ab;
		val lemma = list_mk_∃ ([a, b], tm);
		val type_map = [(type_of a, a_ty), (type_of b, b_ty)];
		val fst_witness = mk_app(inst [] type_map fst_tm, x);
		val snd_witness = mk_app(inst [] type_map snd_tm, x);
	in	PC_T1 "basic_hol" lemma_tac lemma THEN_LIST
		[	∃_tac fst_witness THEN
			∃_tac snd_witness THEN DROP_ASMS_T discard_tac THEN
			pure_rewrite_tac[def_thm] THEN REPEAT strip_tac,
			var_elim_asm_tac tm]
	end
);
end;
=TEX
\section{VARIOUS SUPPORTING THEOREMS}
\subsection{ML Bindings for the Definition}
=SML
val ⦏exp_def⦎	= get_spec ⌜$^:ℕ → ℕ→ ℕ⌝;
=TEX
\subsection{Miscellany on the Natural Numbers}
=TEX
=TEX
=SML
val ⦏times_order_thm⦎ = (
set_goal([], ⌜∀i m n:ℕ⦁ m*i = i*m ∧ (i*m)*n = i*m*n ∧ m*i*n = i*m*n⌝);
a(PC_T1 "lin_arith" asm_prove_tac[]);
pop_lemma"times_order_thm"
);
=TEX
=SML
val ⦏pos_times_pos_thm⦎ = (
set_goal([], ⌜∀m n⦁ 0 < m ∧ 0 < n ⇒ 0 < m * n⌝);
a(strip_tac);
a(induction_tac ⌜m⌝ THEN REPEAT strip_tac);
a(PC_T1 "lin_arith" asm_prove_tac[]);
pop_lemma"pos_times_pos_thm"
);
=TEX
=SML
val ⦏pos_times_less_thm⦎ = (
set_goal([], ⌜∀m n r⦁ 0 < m ∧ n < r ⇒ m * n < m * r⌝);
a(strip_tac);
a(induction_tac ⌜m⌝ THEN REPEAT strip_tac);
a(cases_tac⌜0 < m⌝);
(* *** Goal "1" *** *)
a(all_asm_fc_tac[] THEN PC_T1 "lin_arith" asm_prove_tac[]);
(* *** Goal "2" *** *)
a(LEMMA_T ⌜m = 0⌝ asm_rewrite_thm_tac THEN PC_T1 "lin_arith" asm_prove_tac[]);
pop_lemma"pos_times_less_thm"
);
=TEX
=SML
val ⦏times_less_mono_thm⦎ = (
set_goal([], ⌜∀m n r:ℕ⦁ m * n < m * r ⇒ n < r⌝);
a(strip_tac);
a(induction_tac ⌜m⌝ THEN contr_tac);
(* *** Goal "1" *** *)
a(PC_T1 "lin_arith" asm_prove_tac[]);
(* *** Goal "2" *** *)
a(lemma_tac⌜m * n < m * r⌝ THEN1 PC_T1 "lin_arith" asm_prove_tac[]);
a(all_asm_fc_tac[]);
pop_lemma"times_less_mono_thm"
);
=TEX
=SML
val ⦏times_eq_mono_thm⦎ = (
set_goal([], ⌜∀m n r⦁0 < m ⇒ (m*n = m*r ⇒ n = r)⌝);
a(REPEAT strip_tac);
a(strip_asm_tac(list_∀_elim[⌜n⌝, ⌜r⌝]less_cases_thm));
(* *** Goal "1" *** *)
a(strip_asm_tac(list_∀_elim[⌜m⌝, ⌜n⌝, ⌜r⌝]pos_times_less_thm));
a(PC_T1 "lin_arith" asm_prove_tac[]);
(* *** Goal "2" *** *)
a(strip_asm_tac(list_∀_elim[⌜m⌝, ⌜r⌝, ⌜n⌝]pos_times_less_thm));
a(PC_T1 "lin_arith" asm_prove_tac[]);
pop_lemma"times_eq_mono_thm"
);
=TEX
=SML
val ⦏less_plus_thm⦎ = (
set_goal([], ⌜∀m n:ℕ⦁ m < n ⇒ ∃r⦁n = m + r⌝);
a(strip_tac THEN strip_tac);
a(induction_tac ⌜n⌝ THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(lemma_tac ⌜m = n⌝ THEN1 PC_T1 "lin_arith" asm_prove_tac[]);
a(∃_tac⌜1⌝ THEN PC_T1 "lin_arith" asm_prove_tac[]);
(* *** Goal "2" *** *)
a(∃_tac⌜r + 1⌝ THEN PC_T1 "lin_arith" asm_prove_tac[]);
pop_lemma"less_plus_thm"
);
=TEX
=SML
val ⦏not_odd_eq_even_thm⦎ = (
set_goal([], ⌜∀m n⦁ ¬2*m+1 = 2*n⌝);
a(strip_tac THEN induction_tac⌜m:ℕ⌝);
(* *** Goal "1" *** *)
a(strip_tac THEN induction_tac⌜n:ℕ⌝ THEN PC_T1 "lin_arith" asm_prove_tac[]);
(* *** Goal "2" *** *)
a(contr_tac);
a(lemma_tac⌜1 < n⌝ THEN1 PC_T1 "lin_arith" asm_prove_tac[]);
a(all_asm_fc_tac[less_plus_thm] THEN all_var_elim_asm_tac1);
a(spec_nth_asm_tac 3 ⌜r⌝ THEN PC_T1 "lin_arith" asm_prove_tac[]);
pop_lemma "not_odd_eq_even_thm"
);
=TEX
\subsection{Exponentiation}

We will need the elementary properties of exponentiation:
For each $i$, exponentiation
provides a homomorphism of the additive structure of the natural numbers
into the multiplicative structure of the integers:
=SML
val ⦏exp_homomorphism_thm⦎ = (
set_goal([], ⌜∀i m n⦁  i ^ (m + n) = i^m * i^n⌝);
a(REPEAT strip_tac);
a(induction_tac ⌜n⌝);
(* *** Goal "1" *** *)
a(rewrite_tac[exp_def]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[plus_assoc_thm1, exp_def]);
a(PC_T1 "lin_arith" prove_tac[]);
pop_lemma "exp_homomorphism_thm"
);
=TEX
=SML
val ⦏exp_clauses⦎ = (
set_goal([], ⌜∀i m n⦁  i ^ (m + n) = i^m * i^n ∧ i ^ 0 = 1 ∧ i ^ 1 = i ∧ i^2 = i*i ∧ i^3 = i*i*i⌝);
a(rewrite_tac[exp_homomorphism_thm, exp_def]);
a(pure_once_rewrite_tac[pc_rule1 "lin_arith" prove_rule[]
	⌜1 = 0 + 1 ∧ 2 = (0+1)+1 ∧ 3 = ((0+1)+1)+1⌝]);
a(pure_rewrite_tac[exp_def] THEN rewrite_tac[]);
pop_lemma "exp_clauses"
);
=TEX
=SML
val ⦏exp_0_less_thm⦎ = (
set_goal([], ⌜∀i m⦁ 0 < i ⇒ 0 < i^m⌝);
a(REPEAT strip_tac);
a(induction_tac ⌜m⌝);
(* *** Goal "1" *** *)
a(rewrite_tac[exp_def]);
(* *** Goal "2" *** *)
a(rewrite_tac[exp_def]);
a(all_fc_tac[pos_times_pos_thm]);
pop_lemma "exp_0_less_thm"
);
=TEX
=SML
val ⦏exp_less_mono_thm⦎ = (
set_goal([], ⌜∀i m n⦁ 1 < i ∧ m < n ⇒ i^m < i^n⌝);
a(REPEAT strip_tac);
a(POP_ASM_T ante_tac THEN induction_tac ⌜n⌝);
(* *** Goal "1" *** *)
a(rewrite_tac[]);
(* *** Goal "2" *** *)
a(rewrite_tac[exp_def] THEN REPEAT strip_tac);
a(lemma_tac⌜m = n⌝ THEN1 PC_T1 "lin_arith" asm_prove_tac[]);
a(all_var_elim_asm_tac1);
a(lemma_tac⌜0 < i⌝ THEN1 PC_T1 "lin_arith" asm_prove_tac[]);
a(all_fc_tac[exp_0_less_thm]);
a(spec_nth_asm_tac 1 ⌜n⌝);
a(strip_asm_tac(list_∀_elim[⌜i^n⌝, ⌜1⌝, ⌜i⌝] pos_times_less_thm));
a(POP_ASM_T ante_tac THEN PC_T1 "lin_arith" prove_tac[]);
(* *** Goal "3" *** *)
a(rewrite_tac[exp_def] THEN REPEAT strip_tac);
a(lemma_tac⌜0 < i⌝ THEN1 PC_T1 "lin_arith" asm_prove_tac[]);
a(all_fc_tac[exp_0_less_thm]);
a(spec_nth_asm_tac 1 ⌜n⌝);
a(strip_asm_tac(list_∀_elim[⌜i^n⌝, ⌜1⌝, ⌜i⌝] pos_times_less_thm));
a(GET_NTH_ASM_T 6 ante_tac);
a(POP_ASM_T ante_tac THEN PC_T1 "lin_arith" prove_tac[]);
pop_lemma "exp_less_mono_thm"
);
=TEX
=SML
val ⦏strict_mono_fun_thm⦎ = (
set_goal([], ⌜∀f⦁ 0 < f 0 ∧ (∀m n⦁m < n ⇒ f m < f n) ⇒ (∀m⦁m < f m)⌝);
a(REPEAT strip_tac THEN induction_tac⌜m:ℕ⌝ THEN1 asm_rewrite_tac[]);
a(list_spec_nth_asm_tac 2[⌜m⌝, ⌜m+1⌝]);
a(PC_T1 "lin_arith" asm_prove_tac[]);
pop_lemma "strict_mono_fun_thm"
);
=TEX
=SML
val ⦏exp_strict_mono_thm⦎ = (
set_goal([], ⌜∀i m⦁ 1 < i ⇒ m < i^m⌝);
a(REPEAT strip_tac);
a(ante_tac (∀_elim⌜λm⦁i^m⌝strict_mono_fun_thm) THEN rewrite_tac[]);
a(lemma_tac ⌜0 < i⌝ THEN1 PC_T1 "lin_arith" asm_prove_tac[]);
a(ALL_FC_T rewrite_tac[exp_0_less_thm]);
a(REPEAT strip_tac THEN_TRY asm_rewrite_tac[]);
a(POP_ASM_T ante_tac THEN ALL_FC_T rewrite_tac[exp_less_mono_thm]);
pop_lemma "exp_strict_mono_thm"
);
=TEX
=SML
val ⦏exp_2_less_mono_thm⦎ = (
set_goal([], ⌜∀m n⦁ m < n ⇒ 2^m < 2^n⌝);
a(REPEAT strip_tac);
a(bc_thm_tac exp_less_mono_thm);
a(PC_T1 "lin_arith" asm_prove_tac[]);
pop_lemma "exp_2_less_mono_thm"
);
=TEX
=SML
val ⦏exp_2_pos_thm⦎ = (
set_goal([], ⌜∀m⦁ 0 < 2^m⌝);
a(REPEAT strip_tac);
a(strip_asm_tac(list_∀_elim[⌜2⌝, ⌜m⌝]exp_0_less_thm));
a(PC_T1 "lin_arith" asm_prove_tac[]);
pop_lemma "exp_2_pos_thm"
);
=TEX
=SML
val ⦏exp_2_strict_mono_thm⦎ = (
set_goal([], ⌜∀m⦁ m < 2^m⌝);
a(REPEAT strip_tac);
a(ante_tac (∀_elim⌜2⌝exp_strict_mono_thm) THEN
	rewrite_tac[pc_rule1"lin_arith" prove_rule[]⌜1 < 2⌝]);
a(REPEAT strip_tac THEN asm_rewrite_tac[]);
pop_lemma "exp_2_strict_mono_thm"
);
=TEX
=SML
val ⦏exp_2_mono_lemma⦎ = (
set_goal([], ⌜∀a b m n⦁ 2^a*(2*m+1) = 2^b*(2*n+1) ⇒ a = b⌝);
a(strip_tac);
a(induction_tac⌜a⌝);
(* *** Goal "1" *** *)
a(rewrite_tac[exp_def] THEN strip_tac);
a(induction_tac⌜b⌝);
(* *** Goal "1.1" *** *)
a(rewrite_tac[]);
(* *** Goal "1.2" *** *)
a(rewrite_tac[exp_def] THEN REPEAT strip_tac);
a(rewrite_tac[∀_elim⌜2⌝times_order_thm, not_odd_eq_even_thm]);
(* *** Goal "2" *** *)
a(rewrite_tac[exp_def] THEN strip_tac);
a(induction_tac⌜b⌝);
(* *** Goal "2.1" *** *)
a(rewrite_tac[exp_def] THEN REPEAT strip_tac);
a(rewrite_tac[∀_elim⌜2⌝times_order_thm]);
a(conv_tac (ONCE_MAP_C eq_sym_conv));
a(rewrite_tac[∀_elim⌜2⌝times_order_thm, not_odd_eq_even_thm]);
(* *** Goal "2.2" *** *)
a(rewrite_tac[∀_elim⌜2⌝times_order_thm, exp_def] THEN REPEAT strip_tac);
a(lemma_tac⌜2^a*(2*m'+1) = 2^b*(2*n+1)⌝ THEN1 PC_T1 "lin_arith" asm_prove_tac[]);
a(all_asm_fc_tac[]);
pop_lemma "exp_2_mono_lemma"
);
=TEX
=SML
val ⦏exp_2_mono_thm⦎ = (
set_goal([], ⌜∀a b m n⦁ 2^a*(2*m+1) = 2^b*(2*n+1) ⇒ a = b ∧ m = n⌝);
a(REPEAT strip_tac THEN all_fc_tac[exp_2_mono_lemma]);
a(all_var_elim_asm_tac);
a(strip_asm_tac(∀_elim ⌜b⌝ exp_2_pos_thm));
a(all_asm_fc_tac[times_eq_mono_thm]);
a(PC_T1 "lin_arith" asm_prove_tac[]);
pop_lemma "exp_2_mono_thm"
);
=TEX
\subsection{Miscellany on the Integers}

=SML
val ⦏ℕℤ_≤_ℕ_thm⦎ = (
set_goal([], ⌜∀i:ℤ⦁ ℕℤ 0 ≤ i ⇒ ∃a:ℕ⦁ℕℤ a = i⌝);
a(REPEAT strip_tac);
a(ℤ_≤_induction_tac⌜i⌝);
(* *** Goal "1" *** *)
a(∃_tac⌜0⌝ THEN REPEAT strip_tac);
(* *** Goal "2" *** *)
a(∃_tac⌜a + 1⌝ THEN asm_rewrite_tac[ℕℤ_plus_homomorphism_thm]);
pop_lemma"ℕℤ_≤_ℕ_thm"
);
=TEX
=SML
val ⦏ℤ_≤_ℕℤ_plus_thm⦎ = (
set_goal([], ⌜∀i j:ℤ⦁ i ≤ j ⇒ ∃a:ℕ⦁j = ℕℤ a + i⌝);
a(REPEAT strip_tac);
a(lemma_tac⌜ℕℤ 0 ≤ j - i⌝ THEN1 PC_T1 "ℤ_lin_arith" asm_prove_tac[]);
a(all_fc_tac[ℕℤ_≤_ℕ_thm]);
a(∃_tac⌜a⌝ THEN1 PC_T1 "ℤ_lin_arith" asm_prove_tac[]);
pop_lemma"ℤ_≤_ℕℤ_plus_thm"
);
=TEX
=SML
val ⦏ℕℤ_0_less_plus_thm⦎ = (
set_goal([], ⌜∀i:ℤ⦁ ∃a:ℕ⦁ℕℤ 0 < ℕℤ a + i⌝);
a(REPEAT strip_tac);
a(strip_asm_tac (∀_elim⌜i⌝ ℤ_cases_thm) THEN all_var_elim_asm_tac1);
(* *** Goal "1" *** *)
a(∃_tac⌜1⌝ THEN rewrite_tac[ℕℤ_plus_homomorphism_thm1, ℕℤ_less_thm]);
(* *** Goal "2" *** *)
a(∃_tac⌜m+1⌝ THEN rewrite_tac[ℕℤ_plus_homomorphism_thm]);
a(PC_T1 "ℤ_lin_arith" prove_tac[]);
pop_lemma"ℕℤ_0_less_plus_thm"
);
=TEX
=SML
val ⦏ℕℤ_plus_thm⦎ = (
set_goal([], ⌜∀i j:ℤ⦁ ∃ a b:ℕ⦁ℕℤ a + i = ℕℤ b + j⌝);
a(lemma_tac⌜∀i j:ℤ⦁ i ≤ j ⇒ ∃ a b:ℕ⦁ℕℤ a + i = ℕℤ b + j⌝);
a(REPEAT strip_tac);
a(ℤ_≤_induction_tac ⌜j⌝);
(* *** Goal "1.1" *** *)
a(∃_tac⌜0⌝ THEN ∃_tac⌜0⌝ THEN REPEAT strip_tac);
(* *** Goal "1.2" *** *)
a(∃_tac⌜a + 1⌝ THEN ∃_tac⌜b⌝);
a(rewrite_tac[ℕℤ_plus_homomorphism_thm] THEN PC_T1 "ℤ_lin_arith" asm_prove_tac[]);
(* *** Goal "2" *** *)
a(REPEAT strip_tac);
a(strip_asm_tac(list_∀_elim[⌜i⌝, ⌜j⌝] ℤ_≤_cases_thm));
(* *** Goal "2.1" *** *)
a(all_asm_fc_tac[]);
a(∃_tac⌜a⌝ THEN ∃_tac⌜b⌝ THEN asm_rewrite_tac[]);
(* *** Goal "2.1" *** *)
a(all_asm_fc_tac[]);
a(∃_tac⌜b⌝ THEN ∃_tac⌜a⌝ THEN asm_rewrite_tac[]);
pop_lemma"ℕℤ_plus_thm"
);
=TEX
\section{THE MULTIPLICATIVE MONOID OF DYADIC RATIONALS}
\subsection{Temporary Aliases}
To make the theorems and proofs more readable as they are developed we
introduce temporary aliases for the operators on the positive dyadic
rationals:
=SML
val _ = declare_alias("*", ⌜$dy_times⌝);
val _ = declare_alias("^", ⌜$dy_exp⌝);
val _ = declare_alias("<", ⌜$dy_less⌝);
=TEX

\section{PROPERTIES OF THE ORDERING}
\subsection{ML Bindings for the Definitions}
=SML
val ⦏dy_times_def⦎	= get_spec ⌜$dy_times⌝;
val ⦏dy_one_def⦎		= get_spec ⌜dy_one⌝;
val ⦏dy_exp_def⦎		= get_spec ⌜$dy_exp⌝;
val ⦏dy_less_def⦎		= get_spec ⌜$dy_less⌝;
=TEX
\subsection{A Useful Alternative Characterisation}
The following result shows that existential property in the
definition of the ordering implies a universal property.
This is useful in subsequent proofs.

=SML
val ⦏dy_less_thm⦎ = (
set_goal([], ⌜∀(m, i) (n, j)⦁
	(m, i) < (n, j) ⇒
	∀a b⦁ ℕℤ a + i = ℕℤ b + j ⇒ 2^a * (2*m+1) < 2^b * (2*n+1)⌝);
a(rewrite_tac[dy_less_def] THEN REPEAT strip_tac);
a(strip_asm_tac(list_∀_elim[⌜a⌝, ⌜a'⌝]less_cases_thm));
(* *** Goal "1" *** *)
a(strip_asm_tac(list_∀_elim[⌜a⌝, ⌜a'⌝]less_plus_thm)
	THEN all_var_elim_asm_tac1);
a(DROP_NTH_ASM_T 2 ante_tac);
a(rewrite_tac[ℕℤ_plus_homomorphism_thm]);
a(REPEAT strip_tac);
a(lemma_tac⌜ℕℤ b' = ℕℤ (b + r)⌝ THEN1
	(rewrite_tac[ℕℤ_plus_homomorphism_thm]
		THEN PC_T1 "ℤ_lin_arith" asm_prove_tac[]));
a(all_fc_tac[ℕℤ_one_one_thm] THEN all_var_elim_asm_tac1);
a(rewrite_tac[exp_homomorphism_thm, ∀_elim⌜2^r⌝ times_order_thm]);
a(strip_asm_tac(∀_elim⌜r⌝ exp_2_pos_thm));
a(bc_thm_tac pos_times_less_thm THEN REPEAT strip_tac);
(* *** Goal "2" *** *)
a(all_var_elim_asm_tac);
a(lemma_tac⌜ℕℤ b' = ℕℤ b⌝ THEN1 PC_T1 "ℤ_lin_arith" asm_prove_tac[]);
a(all_fc_tac [ℕℤ_one_one_thm] THEN all_var_elim_asm_tac);
(* *** Goal "3" *** *)
a(strip_asm_tac(list_∀_elim[⌜a'⌝, ⌜a⌝]less_plus_thm)
	THEN all_var_elim_asm_tac1);
a(DROP_NTH_ASM_T 4 ante_tac);
a(rewrite_tac[ℕℤ_plus_homomorphism_thm]);
a(REPEAT strip_tac);
a(lemma_tac⌜ℕℤ b = ℕℤ (b' + r)⌝ THEN1
	(rewrite_tac[ℕℤ_plus_homomorphism_thm]
		THEN PC_T1 "ℤ_lin_arith" asm_prove_tac[]));
a(all_fc_tac[ℕℤ_one_one_thm] THEN all_var_elim_asm_tac1);
a(DROP_NTH_ASM_T 4 ante_tac);
a(rewrite_tac[exp_homomorphism_thm, ∀_elim⌜2 ^ r⌝ times_order_thm]);
a(strip_tac THEN all_fc_tac[times_less_mono_thm]);
pop_lemma "dy_less_thm"
);
=TEX
Furthermore, we show that the universal property of the previous
theorem implies the order property as we have defined it.

=SML
val ⦏dy_less_thm1⦎ = (
set_goal([], ⌜∀(m, i) (n, j)⦁
	(∀a b⦁ ℕℤ a + i = ℕℤ b + j ⇒ 2^a * (2*m+1) < 2^b * (2*n+1)) ⇒
	(m, i) < (n, j)⌝);
a(rewrite_tac[dy_less_def] THEN REPEAT strip_tac);
a(strip_asm_tac (list_∀_elim[⌜i⌝, ⌜j⌝]ℕℤ_plus_thm));
a(all_asm_fc_tac[]);
a(∃_tac⌜a⌝ THEN ∃_tac⌜b⌝ THEN REPEAT strip_tac);
pop_lemma "dy_less_thm1"
);
=TEX
\subsection{Irreflexivity}

=SML
val ⦏dy_less_irrefl_thm⦎ = (
set_goal([], ⌜∀x : DYADIC⦁ ¬ x < x⌝);
a(REPEAT ∀_tac);
a(pair_tac⌜x = (m, i)⌝);
a(rewrite_tac[dy_less_def] THEN contr_tac);
a(all_fc_tac [ℕℤ_one_one_thm] THEN all_var_elim_asm_tac);
save_pop_thm "dy_less_irrefl_thm"
);
=TEX
\subsection{Antisymmetry}

=SML
val ⦏dy_less_antisym_thm⦎ = (
set_goal([], ⌜∀x y:DYADIC⦁ ¬ (x < y ∧ y < x)⌝);
a(REPEAT ∀_tac);
a(pair_tac⌜x = (m, i)⌝ THEN pair_tac⌜y = (n, j)⌝);
a(REPEAT strip_tac THEN FC_T(MAP_EVERY ante_tac)[dy_less_thm]);
a(rewrite_tac[dy_less_def] THEN contr_tac);
a(DROP_NTH_ASM_T 2 (asm_tac o eq_sym_rule));
a(all_asm_fc_tac[]);
a(PC_T1 "lin_arith" asm_prove_tac[]);
save_pop_thm "dy_less_antisym_thm"
);
=TEX
\subsection{Transitivity}

=SML
val ⦏dy_less_trans_thm⦎ = (
set_goal([], ⌜∀x y z: DYADIC⦁ x < y ∧ y < z ⇒ x < z⌝);
a(REPEAT ∀_tac);
a(pair_tac⌜x = (m, i)⌝ THEN pair_tac⌜y = (n, j)⌝ THEN pair_tac ⌜z = (r, k)⌝);
a(REPEAT strip_tac THEN FC_T(MAP_EVERY ante_tac)[dy_less_thm]);
a(REPEAT (POP_ASM_T ante_tac));
a(rewrite_tac[dy_less_def] THEN REPEAT strip_tac);
a(strip_asm_tac(list_∀_elim[⌜a'⌝, ⌜b⌝]less_cases_thm));
(* *** Goal "1" *** *)
a(strip_asm_tac(list_∀_elim[⌜a'⌝, ⌜b⌝]less_plus_thm)
	THEN all_var_elim_asm_tac1);
a(∃_tac⌜a⌝ THEN ∃_tac⌜b' + r'⌝);
a(DROP_NTH_ASM_T 7 ante_tac THEN rewrite_tac[ℕℤ_plus_homomorphism_thm]);
a(REPEAT strip_tac THEN1 PC_T1 "ℤ_lin_arith" asm_prove_tac[]);
a(lemma_tac⌜ℕℤ (a' + r') + j = ℕℤ (b' + r') + k⌝ THEN1
	(rewrite_tac[ℕℤ_plus_homomorphism_thm] THEN
		PC_T1 "ℤ_lin_arith" asm_prove_tac[]));
a(all_asm_fc_tac[]);
a(strip_asm_tac(list_∀_elim[
	⌜2^a*(2*m+1)⌝,
	⌜2^(a'+r')*(2*n+1)⌝,
	⌜2^(b'+r')*(2*r+1)⌝]less_trans_thm));
(* *** Goal "2" *** *)
a(all_var_elim_asm_tac);
a(∃_tac⌜a⌝ THEN ∃_tac⌜b'⌝ THEN asm_rewrite_tac[]);
a(strip_asm_tac(list_∀_elim[
	⌜2^a*(2*m+1)⌝,
	⌜2^b*(2*n+1)⌝,
	⌜2^b'*(2*r+1)⌝]less_trans_thm));
(* *** Goal "3" *** *)
a(strip_asm_tac(list_∀_elim[⌜b⌝, ⌜a'⌝]less_plus_thm)
	THEN all_var_elim_asm_tac1);
a(∃_tac⌜a+r'⌝ THEN ∃_tac⌜b'⌝);
a(DROP_NTH_ASM_T 5 ante_tac THEN rewrite_tac[ℕℤ_plus_homomorphism_thm]);
a(REPEAT strip_tac THEN1 PC_T1 "ℤ_lin_arith" asm_prove_tac[]);
a(lemma_tac⌜ℕℤ (a + r') + i = ℕℤ (b + r') + j⌝ THEN1
	(rewrite_tac[ℕℤ_plus_homomorphism_thm] THEN
		PC_T1 "ℤ_lin_arith" asm_prove_tac[]));
a(all_asm_fc_tac[]);
a(strip_asm_tac(list_∀_elim[
	⌜2^(a+r')*(2*m+1)⌝,
	⌜2^(b+r')*(2*n+1)⌝,
	⌜2^b'*(2*r+1)⌝]less_trans_thm));
save_pop_thm "dy_less_trans_thm"
);
=TEX
\subsection{Trichotomy}

=SML
val ⦏dy_less_trich_thm⦎ = (
set_goal([], ⌜∀x y : DYADIC⦁ ¬x = y ⇒ x < y ∨ y < x⌝);
a(REPEAT ∀_tac);
a(pair_tac⌜x = (m, i)⌝ THEN pair_tac⌜y = (n, j)⌝);
a(contr_tac THEN POP_ASM_T ante_tac THEN rewrite_tac[]);
a(all_fc_tac[once_rewrite_rule[
		taut_rule⌜∀p q⦁(p ⇒ q) ⇔ (¬q ⇒ ¬p)⌝]dy_less_thm1]);
a(cases_tac⌜2^b*(2*n+1) < 2^a*(2*m+1)⌝);
(* *** Goal "1" *** *)
a(rewrite_tac[dy_less_def]);
a(∃_tac⌜b⌝ THEN ∃_tac⌜a⌝ THEN asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(lemma_tac⌜2^a*(2*m+1) = 2^b*(2*n+1)⌝ THEN1 PC_T1 "lin_arith" asm_prove_tac[]);
a(all_asm_fc_tac[exp_2_mono_thm]);
a(all_var_elim_asm_tac);
a(lemma_tac⌜i = j⌝ THEN1 PC_T1 "ℤ_lin_arith" asm_prove_tac[]);
a(all_var_elim_asm_tac);
save_pop_thm "dy_less_trich_thm"
);
=TEX
\section{PROPERTIES OF MULTIPLICATION}
\subsection{Commutativity}

=SML
val ⦏dy_times_comm_thm⦎ = (
set_goal([], ⌜∀x y:DYADIC⦁ x * y = y * x⌝);
a(REPEAT strip_tac);
a(pair_tac⌜x = (r, k)⌝ THEN pair_tac⌜y = (m, i)⌝ );
a(rewrite_tac[dy_times_def] THEN REPEAT strip_tac);
a(PC_T1 "lin_arith" prove_tac[]);
save_pop_thm "dy_times_comm_thm"
);
=TEX
\subsection{Associativity}

=SML
val ⦏dy_times_assoc_thm⦎ = (
set_goal([], ⌜∀x y z: DYADIC⦁ (x * y) * z = x * (y * z)⌝);
a(REPEAT strip_tac);
a(pair_tac⌜x = (r, k)⌝ THEN pair_tac⌜y = (m, i)⌝ THEN pair_tac⌜z = (n, j)⌝ );
a(rewrite_tac[dy_times_def] THEN REPEAT strip_tac THEN_LIST[
	PC_T1 "lin_arith" prove_tac[],
	PC_T1 "ℤ_lin_arith" prove_tac[]]);
save_pop_thm "dy_times_assoc_thm"
);
=TEX
=SML
val ⦏dy_times_order_thm⦎ = (
set_goal([], ⌜∀u x y:DYADIC⦁ x*u = u*x ∧ (u*x)*y = u*x*y ∧ x*u*y = u*x*y⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(strip_asm_tac (list_∀_elim[⌜x⌝, ⌜u⌝]dy_times_comm_thm));
(* *** Goal "2" *** *)
a(rewrite_tac[dy_times_assoc_thm]);
(* *** Goal "3" *** *)
a(rewrite_thm_tac (list_∀_elim[⌜u⌝]dy_times_comm_thm));
a(rewrite_tac[dy_times_assoc_thm]);
save_pop_thm"dy_times_order_thm"
);
=TEX
\subsection{Unit Property}

=SML
val ⦏dy_times_unit_thm⦎ = (
set_goal([], ⌜∀x ⦁ x * dy_one = x ⌝);
a(REPEAT strip_tac);
a(pair_tac⌜x = (m, i)⌝ );
a(rewrite_tac[dy_times_def, dy_one_def] THEN REPEAT strip_tac);
save_pop_thm "dy_times_unit_thm"
);
=TEX
=SML
val ⦏dy_times_unit_clauses⦎ = (
set_goal([], ⌜∀x ⦁ x * dy_one = x ∧ dy_one * x = x⌝);
a(rewrite_tac[dy_times_unit_thm]);
a(once_rewrite_tac[dy_times_comm_thm]);
a(rewrite_tac[dy_times_unit_thm]);
save_pop_thm "dy_times_unit_clauses"
);
=TEX
=TEX
\subsection{Exponentiation}
=SML
val ⦏dy_exp_homomorphism_thm⦎ = (
set_goal([], ⌜∀x : DYADIC; m n ⦁ x ^ (m+n) = x^m * x ^ n⌝);
a(REPEAT strip_tac);
a(induction_tac ⌜n⌝);
(* *** Goal "1" *** *)
a(rewrite_tac[dy_exp_def, dy_times_unit_thm]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[plus_assoc_thm1, dy_exp_def]);
a(rewrite_thm_tac(∀_elim⌜x^m⌝dy_times_order_thm));
pop_lemma "dy_exp_homomorphism_thm"
);
=SML
val ⦏dy_exp_clauses⦎ = (
set_goal([], ⌜∀x : DYADIC; m n ⦁
		x ^ (m+n) = x^m * x ^ n
	∧	x ^ 0 = dy_one
	∧	x ^ 1 = x
	∧	x ^ 2 = x * x
	∧	x ^ 3 = x * x * x⌝);
a(rewrite_tac[dy_exp_homomorphism_thm, dy_exp_def]);
a(pure_once_rewrite_tac[pc_rule1 "lin_arith" prove_rule[]
	⌜1 = 0 + 1 ∧ 2 = (0+1)+1 ∧ 3 = ((0+1)+1)+1⌝]);
a(pure_rewrite_tac[dy_exp_def] THEN rewrite_tac[dy_times_unit_thm]);
save_pop_thm "dy_exp_clauses"
);
=TEX
=SML
val ⦏dy_exp_exp_thm⦎ = (
set_goal([], ⌜∀x : DYADIC; m n ⦁ (x^m)^n = x^(m*n)⌝);
a(REPEAT strip_tac THEN induction_tac⌜n:ℕ⌝);
(* *** Goal "1" *** *)
a(rewrite_tac[dy_exp_clauses]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[times_plus_distrib_thm, dy_exp_clauses]);
pop_lemma "dy_exp_exp_thm"
);
=TEX
\section{INTERACTIONS BETWEEN MULTIPLICATION AND ORDERING}
The first thing to prove now is that multiplication is monotonic
with respect to the less-than ordering.

=SML
val ⦏dy_times_mono_thm⦎ = (
set_goal([], ⌜∀x y z : DYADIC ⦁ y < z ⇒ x * y < x * z⌝);
a(REPEAT ∀_tac);
a(pair_tac⌜x = (r, k)⌝ THEN pair_tac⌜y = (m, i)⌝ THEN pair_tac⌜z = (n, j)⌝ );
a(rewrite_tac[dy_times_def, dy_less_def] THEN REPEAT strip_tac);
a(∃_tac⌜a⌝ THEN ∃_tac⌜b⌝ THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(PC_T1 "ℤ_lin_arith" asm_prove_tac[]);
(* *** Goal "2" *** *)
a(induction_tac⌜r⌝ THEN PC_T1 "lin_arith" asm_prove_tac[]);
save_pop_thm "dy_times_mono_thm"
);
=TEX

=SML
val ⦏dy_times_mono_thm1⦎ = (
set_goal([], ⌜∀x y z : DYADIC ⦁ y < z ⇒ y * x < z * x ⌝);
a(once_rewrite_tac[dy_times_comm_thm] THEN rewrite_tac[dy_times_mono_thm]);
save_pop_thm "dy_times_mono_thm1"
);
=SML
val ⦏dy_times_mono_thm2⦎ = (
set_goal([], ⌜∀x y v w : DYADIC ⦁ x < y ∧ v < w ⇒ x * v < y * w⌝);
a(REPEAT strip_tac);
a(bc_thm_tac dy_less_trans_thm);
a(∃_tac⌜y*v⌝ THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(bc_thm_tac dy_times_mono_thm1 THEN REPEAT strip_tac);
(* *** Goal "2" *** *)
a(bc_thm_tac dy_times_mono_thm THEN REPEAT strip_tac);
save_pop_thm "dy_times_mono_thm2"
);
=TEX
The implication in the monotonicity theorem can be reversed:
=SML
val ⦏dy_times_mono_⇔_thm⦎ = (
set_goal([], ⌜∀x y z : DYADIC ⦁ x * y < x * z ⇔ y < z ⌝);
a(REPEAT strip_tac THEN_LIST [id_tac, ALL_FC_T rewrite_tac[dy_times_mono_thm]]);
a(strip_asm_tac(list_∀_elim[⌜y⌝, ⌜z⌝]dy_less_trich_thm));
(* *** Goal "1" *** *)
a(all_var_elim_asm_tac1 THEN POP_ASM_T ante_tac THEN rewrite_tac[dy_less_irrefl_thm]);
(* *** Goal "2" *** *)
a(strip_asm_tac(list_∀_elim[⌜x⌝, ⌜z⌝, ⌜y⌝]dy_times_mono_thm));
a(all_fc_tac[dy_less_antisym_thm]);
save_pop_thm "dy_times_mono_⇔_thm"
);
=TEX
=TEX
The exponential version of monotonicity will also be needed.
=SML
val ⦏dy_exp_mono_thm⦎ = (
set_goal([], ⌜∀r; x y:DYADIC⦁ x < y ⇒ x^(r+1) < y^(r+1)⌝);
a(∀_tac THEN induction_tac⌜r:ℕ⌝);
a(REPEAT strip_tac THEN
	asm_rewrite_tac[dy_exp_def, dy_times_def, dy_times_unit_thm]);
(* *** Goal "2" *** *)
a(REPEAT strip_tac THEN once_rewrite_tac[dy_exp_def]);
a(all_asm_fc_tac[]);
a(bc_thm_tac dy_times_mono_thm2 THEN REPEAT strip_tac);
pop_lemma"dy_exp_mono_thm"
);
=TEX

=SML
val ⦏dy_exp_mono_thm1⦎ = (
set_goal([], ⌜∀r s; x:DYADIC⦁ dy_one < x ∧ r < s ⇒ x^r < x^s⌝);
a(REPEAT strip_tac);
a(all_fc_tac[less_plus_thm] THEN all_var_elim_asm_tac1);
a(POP_ASM_T ante_tac THEN induction_tac⌜r'⌝);
(* *** Goal "1" *** *)
a(REPEAT strip_tac);
(* *** Goal "2" *** *)
a(REPEAT strip_tac);
a(lemma_tac⌜r' = 0⌝ THEN1 PC_T1 "lin_arith" asm_prove_tac[] THEN asm_rewrite_tac[]);
a(rewrite_tac[dy_exp_clauses]);
a(all_fc_tac[∀_elim⌜x^r⌝dy_times_mono_thm]);
a(POP_ASM_T ante_tac THEN rewrite_tac[dy_times_unit_clauses]);
a(STRIP_T rewrite_thm_tac);
(* *** Goal "3" *** *)
a(REPEAT strip_tac);
a(rewrite_tac[plus_assoc_thm1, dy_exp_def]);
a(all_fc_tac[dy_times_mono_thm2]);
a(GET_NTH_ASM_T 3 ante_tac THEN rewrite_tac[dy_times_unit_clauses]);
pop_lemma"dy_exp_mono_thm1"
);
=TEX
We now want to demonstrate the archimedean property in its multiplicative form.
I.e., we want to show that if $1 < x$, where $x$ is a dyadic rational and
if $y$ is any dyadic rational then $y < x^t$ for some natural number $t$.

We develop the proof in a series of lemmas which reduce the problem to one
where $x$ and $y$ have a simple form, namely, $x = 1+1/2^r$ and $y = 2^s$
with $r, s \ge 0$.

The first lemma says that $1 =(2\times0+1)/2^0)< 1+1/2^{r+1} = (2\times2^r+1)/2^{r+1}$:
=TEX
=SML
val ⦏dy_arch_lemma1⦎ = (
set_goal([], ⌜∀r ⦁ dy_one < (2^r, ℕℤ r + ℕℤ 1)⌝);
a(rewrite_tac[dy_less_def, dy_one_def] THEN REPEAT strip_tac);
a(∃_tac⌜r+1⌝ THEN ∃_tac⌜0⌝ THEN REPEAT strip_tac THEN1
	(rewrite_tac[ℕℤ_plus_homomorphism_thm] THEN PC_T1 "ℤ_lin_arith" asm_prove_tac[]));
a(rewrite_tac[exp_clauses] THEN PC_T1 "lin_arith" prove_tac[]);
pop_lemma"dy_arch_lemma1"
);
=TEX
The next lemma says that and $y$ is bounded above by $2^s = (2\times0+1)/s^{-s}$ for
some $s ≥ 0$.
=SML
val ⦏dy_arch_lemma2⦎ = (
set_goal([], ⌜∀ y⦁ ∃ s:ℕ⦁ y < (0, ~(ℕℤ s))⌝);
a(REPEAT strip_tac);
a(pair_tac⌜y = (m, i)⌝ THEN REPEAT strip_tac);
a(rewrite_tac[dy_less_def] THEN REPEAT strip_tac);
a(strip_asm_tac (∀_elim⌜i⌝ℕℤ_0_less_plus_thm));
a(∃_tac⌜(2*m+1)+a⌝ THEN REPEAT strip_tac);
a(lemma_tac⌜ℕℤ 0 ≤ ℕℤ a + i⌝ THEN1 PC_T1 "ℤ_lin_arith" asm_prove_tac[]);
a(all_fc_tac[ℕℤ_≤_ℕ_thm]);
a(∃_tac⌜0⌝ THEN ∃_tac⌜(2*m+1) + a'⌝ THEN REPEAT strip_tac THEN1
	(rewrite_tac[ℕℤ_plus_homomorphism_thm] THEN PC_T1 "ℤ_lin_arith" asm_prove_tac[]));
a(once_rewrite_tac[exp_clauses]);
a(bc_thm_tac less_trans_thm);
a(∃_tac ⌜2^(2*m+1)⌝ THEN rewrite_tac[exp_2_strict_mono_thm]);
a(lemma_tac⌜ℕℤ 0 < ℕℤ a'⌝ THEN1 asm_rewrite_tac[]);
a(POP_ASM_T (strip_asm_tac o rewrite_rule[ℕℤ_less_thm]));
a(all_fc_tac[exp_2_less_mono_thm]);
a(POP_ASM_T (strip_asm_tac o rewrite_rule[exp_clauses]));
a(strip_asm_tac(∀_elim⌜(2 * m + 1)⌝exp_2_pos_thm));
a(ALL_FC_T(MAP_EVERY (TRY o accept_tac o rewrite_rule[]))[pos_times_less_thm]);
pop_lemma"dy_arch_lemma2"
);
=TEX
The next lemma says that for natural numbers $r$ and $s$, with $r < s$,
$2^s$ is at least twice $2^r$.
=SML
val ⦏dy_arch_lemma3⦎ = (
set_goal([], ⌜∀r s :ℕ⦁ r < s ⇒ 2*2^r ≤ 2^s⌝);
a(REPEAT strip_tac THEN all_fc_tac[less_plus_thm] THEN all_var_elim_asm_tac1);
a(lemma_tac⌜1 ≤ r'⌝ THEN1 PC_T1 "lin_arith" asm_prove_tac[]);
a(all_fc_tac[≤_def] THEN all_var_elim_asm_tac1);
a(rewrite_tac[exp_clauses]);
a(strip_asm_tac(∀_elim⌜i⌝exp_2_pos_thm));
a(lemma_tac⌜1 ≤ 2^i⌝ THEN1 PC_T1 "lin_arith" asm_prove_tac[]);
a(all_fc_tac[≤_def] THEN POP_ASM_T (rewrite_thm_tac o eq_sym_rule));
a(PC_T1 "lin_arith" asm_prove_tac[]);
pop_lemma"dy_arch_lemma3"
);
=TEX
Using the previous lemma, we can now prove that, if $1 = (2\times0+1)/2^0 < x$, then
there is a natural number $r$ such that $1 + 1/2^(r+1) = (2\times2^r+1)/2^{r+1} < x$.
Before doing this, we record the following useful little fact:
=SML
val ⦏twice_plus_1_lemma⦎ =
	pc_rule1 "lin_arith" prove_rule[]⌜∀a b⦁ a < b ⇒ 2*a + 1 < 2*b⌝;
=SML
val ⦏dy_arch_lemma4⦎ = (
set_goal([], ⌜∀x ⦁ dy_one < x ⇒ ∃r:ℕ⦁(2^r, ℕℤ r + ℕℤ 1) < x⌝);
a(∀_tac);
a(pair_tac⌜x = (m, i)⌝);
a(rewrite_tac[dy_less_def, dy_one_def] THEN REPEAT strip_tac);
a(cases_tac ⌜ℕℤ 0 ≤ i⌝);
(* *** Goal "1" *** *)
a(all_fc_tac[ℕℤ_≤_ℕ_thm]);
a(∃_tac⌜a'⌝ THEN REPEAT strip_tac);
a(all_var_elim_asm_tac1);
a(LEMMA_T⌜ℕℤ a = ℕℤ (b + a')⌝ (strip_asm_tac o rewrite_rule[ℕℤ_one_one_thm])
	THEN1 asm_rewrite_tac[ℕℤ_plus_homomorphism_thm]);
a(all_var_elim_asm_tac1);
a(∃_tac⌜0⌝ THEN ∃_tac⌜1⌝ THEN REPEAT strip_tac THEN1 PC_T1 "ℤ_lin_arith" asm_prove_tac[]);
a(DROP_NTH_ASM_T 2 ante_tac THEN rewrite_tac[exp_clauses, times_assoc_thm] THEN REPEAT strip_tac);
a(all_fc_tac[times_less_mono_thm]);
a(all_fc_tac[∀_elim⌜2^a'⌝ twice_plus_1_lemma]);
(* *** Goal "2" *** *)
a(∃_tac⌜0⌝ THEN ∃_tac⌜a⌝ THEN ∃_tac⌜b+1⌝ THEN REPEAT strip_tac THEN1
	(rewrite_tac[ℕℤ_plus_homomorphism_thm] THEN PC_T1 "ℤ_lin_arith" asm_prove_tac[]));
a(rewrite_tac[exp_clauses]);
a(LEMMA_T⌜ℕℤ a < ℕℤ b⌝ (strip_asm_tac o rewrite_rule[ℕℤ_less_thm])
	THEN1 PC_T1 "ℤ_lin_arith" asm_prove_tac[]);
a(POP_ASM_T ante_tac THEN DROP_ASMS_T discard_tac THEN REPEAT strip_tac);
a(all_fc_tac[dy_arch_lemma3]);
a(strip_asm_tac(∀_elim⌜a⌝ exp_2_pos_thm));
a(strip_asm_tac(∀_elim⌜b⌝ exp_2_pos_thm));
a(PC_T1 "lin_arith" asm_prove_tac[]);
pop_lemma"dy_arch_lemma4"
);
=TEX
We now want to show that the powers of any number of the form $1+1/2^{r+1}$  grow
without bound. To do this we first show that $1+1/2^{r+1} < (1+1/2^{r+2})^2$:
=SML
val ⦏dy_arch_lemma5⦎ = (
set_goal([], ⌜∀r⦁ (2^r, ℕℤ r + ℕℤ 1) < (2^(r+1), ℕℤ (r+1) + ℕℤ 1)^2⌝);
a(rewrite_tac[dy_exp_clauses, dy_times_def, dy_less_def]);
a(REPEAT strip_tac);
a(∃_tac⌜r+3⌝ THEN ∃_tac⌜0⌝ THEN REPEAT strip_tac THEN1
	(rewrite_tac[ℕℤ_plus_homomorphism_thm] THEN PC_T1 "ℤ_lin_arith" asm_prove_tac[]));
a(rewrite_tac[exp_clauses]);
a(strip_asm_tac(∀_elim⌜r⌝ exp_2_pos_thm));
a(PC_T1 "lin_arith" asm_prove_tac[]);
pop_lemma"dy_arch_lemma5"
);
=TEX
Using the previous lemma, we now want to show by induction, that
$3/2 = (2\times1+1)/2^1 < (1+1/2^{r+2})^(2^{r+1})$.
To do this we need the following fact about exponentiation:
=TEX
=SML
val ⦏dy_arch_lemma6⦎ = (
set_goal([], ⌜∀r; x y:DYADIC⦁ x < y^2 ⇒ x^(2^r) < y^(2^(r+1))⌝);
a(REPEAT strip_tac THEN induction_tac⌜r:ℕ⌝);
(* *** Goal "1" *** *)
a(POP_ASM_T ante_tac THEN rewrite_tac[dy_exp_clauses, exp_clauses]);
(* *** Goal "2" *** *)
a(POP_ASM_T ante_tac THEN rewrite_tac[exp_clauses]);
a(rewrite_tac[pc_rule1"lin_arith" prove_rule[]⌜∀m⦁m*2 = m+m⌝]);
a(rewrite_tac[dy_exp_clauses]);
a(REPEAT strip_tac);
a(bc_thm_tac dy_times_mono_thm2 THEN REPEAT strip_tac);
pop_lemma"dy_arch_lemma6"
);
=TEX
Now we can show that $3/2 = (2\times1+1)/2^1 < (1+1/2^{r+2})^(2^{r+1})$:
=SML
val ⦏dy_arch_lemma7⦎ = (
set_goal([], ⌜∀r⦁ (1, ℕℤ 1) < (2^(r+1), ℕℤ (r+1) + ℕℤ 1)^2^(r+1)⌝);
a(REPEAT strip_tac THEN induction_tac⌜r:ℕ⌝);
(* *** Goal "1" *** *)
a(ante_tac(∀_elim⌜0⌝ dy_arch_lemma5) THEN rewrite_tac[exp_clauses]);
(* *** Goal "2" *** *)
a(bc_thm_tac dy_less_trans_thm);
a(∃_tac⌜(2 ^ (r + 1), ℕℤ (r + 1) + ℕℤ 1) ^ 2 ^ (r + 1)⌝ THEN REPEAT strip_tac);
a(POP_ASM_T discard_tac THEN strip_asm_tac (∀_elim⌜r+1⌝ dy_arch_lemma5));
a(all_asm_fc_tac[∀_elim⌜r+1⌝ dy_arch_lemma6]);
pop_lemma"dy_arch_lemma7"
);
=TEX
The following consequence of the previous lemma is more convenient later on:
=SML
val ⦏dy_arch_lemma8⦎ = (
set_goal([], ⌜∀r⦁ ∃t⦁ (1, ℕℤ 1) < (2^r, ℕℤ r + ℕℤ 1)^(t+1)⌝);
a(REPEAT strip_tac THEN strip_asm_tac(∀_elim⌜r:ℕ⌝ℕ_cases_thm) THEN all_var_elim_asm_tac1);
(* *** Goal "1" *** *)
a(∃_tac⌜1⌝ THEN rewrite_tac[dy_exp_clauses, dy_times_def, dy_less_def]);
a(∃_tac⌜1⌝ THEN ∃_tac⌜0⌝ THEN REPEAT strip_tac THEN1 PC_T1 "ℤ_lin_arith" asm_prove_tac[]);
a(rewrite_tac[exp_clauses] THEN PC_T1 "lin_arith" prove_tac[]);
(* *** Goal "2" *** *)
a(strip_asm_tac(∀_elim⌜i+1⌝exp_2_pos_thm));
a(LEMMA_T⌜1 ≤ 2^(i+1)⌝ (strip_asm_tac o rewrite_rule[≤_def])
	THEN1 PC_T1 "lin_arith" asm_prove_tac[]);
a(lemma_tac ⌜i' + 1 = 2 ^ (i + 1)⌝ THEN1 PC_T1 "lin_arith" asm_prove_tac[]);
a(∃_tac⌜i'⌝ THEN asm_rewrite_tac[dy_arch_lemma7]);
pop_lemma"dy_arch_lemma8"
);
=TEX
=SML
val ⦏dy_arch_lemma9⦎ = (
set_goal([], ⌜∀r⦁ (0, ~(ℕℤ 1))^r = (0, ~(ℕℤ r))⌝);
a(REPEAT strip_tac THEN induction_tac⌜r:ℕ⌝);
(* *** Goal "1" *** *)
a(rewrite_tac[dy_exp_clauses, dy_one_def]);
(* *** Goal "1.1" *** *)
a(asm_rewrite_tac[dy_exp_clauses, dy_times_def, ℕℤ_plus_homomorphism_thm]);
pop_lemma"dy_arch_lemma9"
);
=TEX
=SML
val ⦏dy_arch_lemma10⦎ = (
set_goal([], ⌜(0, ~(ℕℤ 1)) < (1, ℕℤ 1)^2⌝);
a(rewrite_tac[dy_exp_clauses, dy_times_def, dy_less_def]);
a(∃_tac⌜3⌝ THEN ∃_tac⌜0⌝ THEN strip_tac THEN1 PC_T1 "ℤ_lin_arith" prove_tac[]);
a(rewrite_tac[exp_clauses] THEN PC_T1 "lin_arith" prove_tac[]);
pop_lemma"dy_arch_lemma10"
);
=TEX
The final piece we need says that the powers of $1+1/2$ grow without bound:
=TEX
=SML
val ⦏dy_arch_lemma11⦎ = (
set_goal([], ⌜∀x⦁ ∃s⦁ x < (1, ℕℤ 1)^(s+1)⌝);
a(strip_tac THEN lemma_tac⌜∃s⦁ x < (1, ℕℤ 1)^s⌝);
(* *** Goal "1" *** *)
a(strip_asm_tac(∀_elim⌜x⌝dy_arch_lemma2));
a(strip_asm_tac dy_arch_lemma10);
a(ante_tac (list_∀_elim[⌜s⌝, ⌜(0, ~ (ℕℤ 1))⌝, ⌜(1, ℕℤ 1)⌝]dy_arch_lemma6));
a(REPEAT strip_tac);
a(lemma_tac ⌜x < (0, ~ (ℕℤ 1))^s⌝ THEN1 asm_rewrite_tac[dy_arch_lemma9]);
a(lemma_tac⌜dy_one < (0, ~ (ℕℤ 1))⌝);
(* *** Goal "1.1" *** *)
a(rewrite_tac[dy_less_def, dy_one_def] THEN REPEAT strip_tac);
a(∃_tac⌜0⌝ THEN ∃_tac⌜1⌝ THEN strip_tac THEN1 PC_T1 "ℤ_lin_arith" prove_tac[]);
a(rewrite_tac[exp_clauses] THEN PC_T1 "lin_arith" prove_tac[]);
(* *** Goal "1.2" *** *)
a(strip_asm_tac(∀_elim⌜s⌝exp_2_strict_mono_thm));
a(all_fc_tac[dy_exp_mono_thm1]);
a(∃_tac⌜2^(s+1)⌝ THEN bc_thm_tac dy_less_trans_thm);
a(∃_tac⌜(0, ~ (ℕℤ 1))^s⌝ THEN REPEAT strip_tac THEN bc_thm_tac dy_less_trans_thm);
a(∃_tac⌜(0, ~ (ℕℤ 1))^2^s⌝ THEN REPEAT strip_tac);
(* *** Goal "2" *** *)
a(∃_tac⌜s⌝ THEN bc_thm_tac dy_less_trans_thm);
a(∃_tac⌜(1, ℕℤ 1)^s⌝ THEN REPEAT strip_tac);
a(lemma_tac⌜dy_one < (1, ℕℤ 1)⌝);
(* *** Goal "2.1" *** *)
a(rewrite_tac[dy_less_def, dy_one_def] THEN REPEAT strip_tac);
a(∃_tac⌜1⌝ THEN ∃_tac⌜0⌝ THEN rewrite_tac[exp_clauses] THEN PC_T1 "lin_arith" prove_tac[]);
(* *** Goal "2.2" *** *)
a(LEMMA_T ⌜s < s + 1⌝ asm_tac THEN1 rewrite_tac[]);
a(all_fc_tac[dy_exp_mono_thm1]);
pop_lemma"dy_arch_lemma11"
);
=TEX
We now have all the pieces in place to prove the archimedean property.
=TEX
=SML
val ⦏dy_arch_thm⦎ = (
set_goal([], ⌜∀x y⦁ dy_one < x ⇒ ∃t⦁ y < x^t⌝);
a(REPEAT strip_tac);
a(lemma_tac⌜∃t⦁(1, ℕℤ 1) < x^t⌝);
(* *** Goal "1" *** *)
a(strip_asm_tac(∀_elim⌜x⌝dy_arch_lemma4));
a(strip_asm_tac(∀_elim⌜r⌝dy_arch_lemma8));
a(∃_tac⌜t+1⌝ THEN bc_thm_tac dy_less_trans_thm);
a(∃_tac ⌜(2^r, ℕℤ r + ℕℤ 1)^(t+1)⌝ THEN REPEAT strip_tac);
a(bc_thm_tac dy_exp_mono_thm THEN REPEAT strip_tac);
(* *** Goal "2" *** *)
a(strip_asm_tac(∀_elim⌜y⌝dy_arch_lemma11));
a(∃_tac⌜t*(s+1)⌝);
a(rewrite_tac[conv_rule (ONCE_MAP_C eq_sym_conv) dy_exp_exp_thm]);
a(bc_thm_tac dy_less_trans_thm);
a(∃_tac⌜(1, ℕℤ 1) ^ (s + 1)⌝ THEN REPEAT strip_tac);
a(bc_thm_tac dy_exp_mono_thm THEN REPEAT strip_tac);
save_pop_thm"dy_arch_thm"
);
=TEX
Next, the ``balance'' properties:
=SML
val ⦏dy_balance_thm1⦎ = (
set_goal([], ⌜∀x⦁ ∃y⦁ dy_one < x * y⌝);
a(REPEAT strip_tac);
a(pair_tac⌜x = (m, i)⌝);
a(cases_tac⌜ℕℤ 0 ≤ i⌝);
(* *** Goal "1" *** *)
a(all_fc_tac[ℕℤ_≤_ℕ_thm]);
a(∃_tac⌜(0, ~(ℕℤ ((2*m+1)+a)))⌝ THEN rewrite_tac[dy_less_def, dy_times_def, dy_one_def]
	THEN REPEAT strip_tac);
a(∃_tac⌜a⌝ THEN ∃_tac⌜(2*m+1)+a⌝ THEN REPEAT strip_tac THEN1
	(asm_rewrite_tac[ℕℤ_plus_homomorphism_thm] THEN PC_T1 "ℤ_lin_arith" prove_tac[]));
a(induction_tac⌜m⌝);
(* *** Goal "1.1" *** *)
a(rewrite_tac[exp_clauses]);
a(strip_asm_tac(∀_elim⌜a⌝exp_2_pos_thm) THEN PC_T1 "lin_arith" asm_prove_tac[]);
(* *** Goal "1.2" *** *)
a(strip_asm_tac(list_∀_elim[⌜a⌝, ⌜(2 * (m + 1) + 1) + a⌝] exp_2_less_mono_thm));
a(bc_thm_tac less_trans_thm);
a(∃_tac⌜2 ^ ((2 * (m + 1) + 1) + a)⌝ THEN REPEAT strip_tac);
a(strip_asm_tac(∀_elim⌜(2 * (m + 1) + 1) + a⌝exp_2_pos_thm)
	THEN PC_T1 "lin_arith" asm_prove_tac[]);
(* *** Goal "2" *** *)
a(∃_tac⌜(0, ~(ℕℤ 1))⌝ THEN rewrite_tac[dy_less_def, dy_times_def, dy_one_def]
	THEN REPEAT strip_tac);
a(lemma_tac⌜ℕℤ 0 ≤ ~i⌝ THEN1 PC_T1 "ℤ_lin_arith" asm_prove_tac[]);
a(all_fc_tac[ℕℤ_≤_ℕ_thm]);
a(∃_tac⌜0⌝ THEN ∃_tac⌜a+1⌝ THEN REPEAT strip_tac THEN1
	(asm_rewrite_tac[ℕℤ_plus_homomorphism_thm] THEN PC_T1 "ℤ_lin_arith" prove_tac[]));
a(rewrite_tac[exp_clauses]);
a(strip_asm_tac(∀_elim⌜a⌝exp_2_pos_thm) THEN PC_T1 "lin_arith" asm_prove_tac[]);
save_pop_thm"dy_balance_thm1"
);
=TEX
=SML
val ⦏dy_balance_thm2⦎ = (
set_goal([], ⌜∀x⦁ ∃y⦁ x * y < dy_one⌝);
a(REPEAT strip_tac);
a(pair_tac⌜x = (m, i)⌝);
a(cases_tac⌜ℕℤ 0 ≤ i⌝);
(* *** Goal "1" *** *)
a(∃_tac⌜(0, ℕℤ (2*m+1))⌝ THEN rewrite_tac[dy_less_def, dy_times_def, dy_one_def]
	THEN REPEAT strip_tac);
a(all_fc_tac[ℕℤ_≤_ℕ_thm]);
a(∃_tac⌜0⌝ THEN ∃_tac⌜a+2*m+1⌝ THEN REPEAT strip_tac THEN1
	(asm_rewrite_tac[ℕℤ_plus_homomorphism_thm] THEN PC_T1 "ℤ_lin_arith" prove_tac[]));
a(induction_tac⌜m⌝);
(* *** Goal "1.1" *** *)
a(rewrite_tac[exp_clauses]);
a(strip_asm_tac(∀_elim⌜a⌝exp_2_pos_thm) THEN PC_T1 "lin_arith" asm_prove_tac[]);
(* *** Goal "1.2" *** *)
a(POP_ASM_T ante_tac THEN rewrite_tac[times_plus_distrib_thm, exp_clauses]);
a(PC_T1 "lin_arith" prove_tac[]);
(* *** Goal "2" *** *)
a(lemma_tac⌜ℕℤ 0 ≤ ~i⌝ THEN1 PC_T1 "ℤ_lin_arith" asm_prove_tac[]);
a(all_fc_tac[ℕℤ_≤_ℕ_thm]);
a(∃_tac⌜(0, ℕℤ (2*m+a+1))⌝ THEN rewrite_tac[dy_less_def, dy_times_def, dy_one_def]
	THEN REPEAT strip_tac);
a(∃_tac⌜a⌝ THEN ∃_tac⌜2*m+a+1⌝ THEN REPEAT strip_tac THEN1
	(asm_rewrite_tac[ℕℤ_plus_homomorphism_thm] THEN PC_T1 "ℤ_lin_arith" prove_tac[]));
a(induction_tac⌜m⌝);
(* *** Goal "1.1" *** *)
a(rewrite_tac[exp_clauses]);
a(strip_asm_tac(∀_elim⌜a⌝exp_2_pos_thm) THEN PC_T1 "lin_arith" asm_prove_tac[]);
(* *** Goal "2.2" *** *)
a(POP_ASM_T ante_tac THEN rewrite_tac[times_plus_distrib_thm, exp_clauses]);
a(PC_T1 "lin_arith" prove_tac[]);
save_pop_thm"dy_balance_thm2"
);
=TEX
\subsection{Density}
In the following, the problem is as follows:
we are given $m$, $i$, $n$ and $j$ such that $(2m+1)/2^i < (2n+1)/2^j$.
We want $r$ and $k$ such that
$((2m+1)/2^i)(1+(1/2^(r+1))) = ((2m+1)/2^i)((2\times 2^r +1))/2^(r+1))$
lies between $(2m+1)/2^i$ and $(2n+1)/2^j$.
We sneak up on the problem slowly.
First of all we prove a lemma that will later let us assume that one
of $i$ or $j$ is equal to $0$:
=TEX
=SML
val ⦏dy_dense_lemma1⦎ = (
set_goal([], ⌜∀(k:ℤ) (m, i) (n, j)⦁ (m, i) < (n, j) ⇔ (m, i + k) < (n, j + k)⌝);
a(LEMMA_T ⌜∀(a, s) t⦁ (a, s + t) = (a, s) * (0, t)⌝ rewrite_thm_tac
	THEN1 (rewrite_tac[dy_times_def] THEN REPEAT strip_tac));
a(once_rewrite_tac[dy_times_comm_thm] THEN rewrite_tac[dy_times_mono_⇔_thm]
	THEN REPEAT strip_tac);
pop_lemma"dy_dense_lemma1"
);
=TEX
Next we consider the case where $i = a \ge 0$ and $j = 0$ and
show that in that case $(2m+1)/2^a + 1/2^{a+1}$ lies
between $(2m+1)/2^i$ and $(2n+1)/2^j$.
=SML
val ⦏dy_dense_lemma2⦎ = (
set_goal([], ⌜∀m n a⦁ (m, ℕℤ a)  < (n, ℕℤ 0) ⇒
	(2*m + 1, ℕℤ a + ℕℤ 1) < (n, ℕℤ 0)⌝);
a(rewrite_tac[dy_less_def] THEN REPEAT strip_tac);
a(∃_tac⌜a'⌝ THEN ∃_tac⌜b+1⌝ THEN REPEAT strip_tac THEN1
	(rewrite_tac[ℕℤ_plus_homomorphism_thm] THEN PC_T1 "ℤ_lin_arith" asm_prove_tac[]));
a(lemma_tac ⌜a' + a = b⌝ THEN1
	(bc_thm_tac ℕℤ_one_one_thm THEN asm_rewrite_tac[ℕℤ_plus_homomorphism_thm]));
a(lemma_tac⌜a' ≤ b⌝ THEN1 PC_T1 "lin_arith" asm_prove_tac[]);
a(all_fc_tac[≤_def] THEN all_var_elim_asm_tac1);
a(DROP_NTH_ASM_T 2 ante_tac THEN rewrite_tac[exp_clauses, times_assoc_thm] THEN REPEAT strip_tac);
a(all_fc_tac[times_less_mono_thm]);
a(all_fc_tac[∀_elim⌜2*m+1⌝ twice_plus_1_lemma]);
a(strip_asm_tac(∀_elim⌜a'⌝ exp_2_pos_thm));
a(all_fc_tac[list_∀_elim[⌜2^a'⌝, ⌜2 * (2 * m + 1) + 1⌝]pos_times_less_thm]);
a(PC_T1 "lin_arith" asm_prove_tac[]);
pop_lemma"dy_dense_lemma2"
);
=TEX
In the case where $i = 0$ and $j = b \ge 0$ , we
show that i $(2m+1)/2^a + 1/2^{b+1}$ lies
between $(2m+1)/2^i$ and $(2n+1)/2^j$.
=SML
val ⦏dy_dense_lemma3⦎ = (
set_goal([], ⌜∀m n b⦁ (m, ℕℤ 0) < (n, ℕℤ b) ⇒
	(2^(b+1)*m + 2^b, ℕℤ b + ℕℤ 1) < (n, ℕℤ b)⌝);
a(rewrite_tac[dy_less_def] THEN REPEAT strip_tac);
a(∃_tac⌜b'⌝ THEN ∃_tac⌜b'+1⌝ THEN REPEAT strip_tac THEN1
	(rewrite_tac[ℕℤ_plus_homomorphism_thm] THEN PC_T1 "ℤ_lin_arith" asm_prove_tac[]));
a(lemma_tac ⌜b' + b = a⌝ THEN1
	(bc_thm_tac ℕℤ_one_one_thm THEN asm_rewrite_tac[ℕℤ_plus_homomorphism_thm]));
a(lemma_tac⌜b' ≤ a⌝ THEN1 PC_T1 "lin_arith" asm_prove_tac[]);
a(all_fc_tac[≤_def] THEN all_var_elim_asm_tac1 THEN all_var_elim_asm_tac1);
a(POP_ASM_T ante_tac THEN rewrite_tac[exp_clauses, times_assoc_thm] THEN REPEAT strip_tac);
a(all_fc_tac[times_less_mono_thm]);
a(bc_thm_tac pos_times_less_thm THEN rewrite_tac[exp_2_pos_thm]);
a(bc_thm_tac twice_plus_1_lemma);
a(PC_T1 "lin_arith" asm_prove_tac[]);
pop_lemma"dy_dense_lemma3"
);
=TEX
Now we show that, for sufficiently large $r$, $(2m+1)/2^j * (1+1/2^(r+1)) < \alpha$,
where $\alpha$ is the intermediate value given by
the appropriate one of the previous two lemmas
(according as $i = 0$ or $j = 0$).
For $i = a \ge 0$, $j = 0$ we have:
=SML
val ⦏dy_dense_lemma4⦎ = (
set_goal([], ⌜∀m a⦁  (m, ℕℤ a) * (2^(m+a+1), ℕℤ (m+a+1) + ℕℤ 1) < (2*m + 1, ℕℤ a + ℕℤ 1) ⌝);
a(rewrite_tac[dy_times_def, dy_less_def] THEN REPEAT strip_tac);
a(∃_tac⌜0⌝ THEN ∃_tac⌜m+a+1⌝ THEN REPEAT strip_tac THEN1
	(rewrite_tac[ℕℤ_plus_homomorphism_thm] THEN PC_T1 "ℤ_lin_arith" asm_prove_tac[]));
a(rewrite_tac[exp_clauses, times_assoc_thm, ∀_elim⌜2⌝times_order_thm]);
a(bc_thm_tac twice_plus_1_lemma);
a(conv_tac (ONCE_MAP_C anf_conv));
a(rewrite_tac[pc_rule1 "lin_arith" prove_rule[]⌜∀a b c⦁ a + b +2*c < b + 3*c ⇔ a < c⌝]);
a(strip_asm_tac(∀_elim⌜a⌝exp_2_pos_thm));
a(LEMMA_T ⌜ 1 ≤ 2^a⌝ (strip_asm_tac o rewrite_rule[≤_def])
	THEN1 PC_T1 "lin_arith" asm_prove_tac[]);
a(POP_ASM_T (rewrite_thm_tac o eq_sym_rule));
a(strip_asm_tac(∀_elim⌜m⌝exp_2_strict_mono_thm));
a(PC_T1 "lin_arith" asm_prove_tac[]);
pop_lemma"dy_dense_lemma4"
);
=TEX
For $i = 0$, $j = a \ge 0$, we have:
=SML
val ⦏dy_dense_lemma5⦎ = (
set_goal([], ⌜∀m b⦁
	(m, ℕℤ 0) * (2^(m+b+1), ℕℤ (m+b+1) + ℕℤ 1) < (2^(b+1)*m + 2^b, ℕℤ b + ℕℤ 1) ⌝);
a(rewrite_tac[dy_times_def, dy_less_def] THEN REPEAT strip_tac);
a(∃_tac⌜0⌝ THEN ∃_tac⌜m+1⌝ THEN REPEAT strip_tac THEN1
	(rewrite_tac[ℕℤ_plus_homomorphism_thm] THEN PC_T1 "ℤ_lin_arith" asm_prove_tac[]));
a(rewrite_tac[exp_clauses, times_assoc_thm, ∀_elim⌜2⌝times_order_thm]);
a(bc_thm_tac twice_plus_1_lemma);
a(conv_tac (ONCE_MAP_C anf_conv));
a(rewrite_tac[pc_rule1 "lin_arith" prove_rule[]⌜∀a b c d:ℕ⦁ a + b + c < b + c + d ⇔ a < d⌝]);
a(rewrite_tac[exp_2_strict_mono_thm]);
pop_lemma"dy_dense_lemma5"
);
=TEX
Now we can start to fit the pieces together to give the desired strong density theorem:
=SML
val ⦏dy_dense_lemma6⦎ = (
set_goal([], ⌜∀(m, i) (n, j):DYADIC⦁ (m, i) < (n, j) ⇒
	∃k z⦁ dy_one < z ∧ (m, i+k) * z < (n, j+k)⌝);
a(REPEAT strip_tac THEN cases_tac ⌜(i:ℤ) ≤ j⌝);
(* *** Goal "1" *** *)
a(∃_tac⌜~i⌝ THEN DROP_NTH_ASM_T 2 ante_tac THEN rewrite_tac[]);
a(lemma_tac⌜ℕℤ 0 ≤ j + ~i⌝ THEN1 PC_T1 "ℤ_lin_arith" asm_prove_tac[]);
a(once_rewrite_tac[∀_elim ⌜~i⌝ dy_dense_lemma1]);
a(all_fc_tac[ℕℤ_≤_ℕ_thm] THEN TOP_ASM_T (rewrite_thm_tac o eq_sym_rule));
a(REPEAT strip_tac THEN ∃_tac⌜(2^(m+a+1), ℕℤ (m+a+1) + ℕℤ 1)⌝ THEN REPEAT strip_tac
	THEN1 rewrite_tac[dy_arch_lemma1]);
a(bc_thm_tac dy_less_trans_thm THEN ∃_tac⌜(2^(a+1)*m + 2^a, ℕℤ a + ℕℤ 1)⌝);
a(rewrite_tac[dy_dense_lemma5] THEN all_fc_tac[dy_dense_lemma3]);
(* *** Goal "2" *** *)
a(∃_tac⌜~j⌝ THEN DROP_NTH_ASM_T 2 ante_tac THEN rewrite_tac[]);
a(lemma_tac⌜ℕℤ 0 ≤ i + ~j⌝ THEN1 PC_T1 "ℤ_lin_arith" asm_prove_tac[]);
a(once_rewrite_tac[∀_elim ⌜~j⌝ dy_dense_lemma1]);
a(all_fc_tac[ℕℤ_≤_ℕ_thm] THEN TOP_ASM_T (rewrite_thm_tac o eq_sym_rule));
a(REPEAT strip_tac THEN ∃_tac⌜(2^(m+a+1), ℕℤ (m+a+1) + ℕℤ 1)⌝ THEN REPEAT strip_tac
	THEN1 rewrite_tac[dy_arch_lemma1]);
a(bc_thm_tac dy_less_trans_thm THEN ∃_tac⌜(2*m + 1, ℕℤ a + ℕℤ 1)⌝);
a(rewrite_tac[dy_dense_lemma4] THEN all_fc_tac[dy_dense_lemma2]);
pop_lemma"dy_dense_lemma6"
);
=TEX
=SML
val ⦏dy_dense_lemma7⦎ = (
set_goal([], ⌜∀(m, i) (n, j):DYADIC; k⦁ (m, i+k) * z < (n, j+k) ⇒ (m, i) * z < (n, j)⌝);
a(REPEAT ∀_tac THEN pair_tac⌜(z:DYADIC) = (r, l)⌝ THEN
	rewrite_tac[dy_times_def, dy_less_def]);
a(REPEAT strip_tac);
a(∃_tac⌜a⌝ THEN ∃_tac⌜b⌝ THEN REPEAT strip_tac THEN1 PC_T1 "ℤ_lin_arith" asm_prove_tac[]);
pop_lemma"dy_dense_lemma7"
);
=TEX
Now we can prove the right-hand density theorem:
=SML
val ⦏dy_right_dense_thm⦎ = (
set_goal([], ⌜∀x y:DYADIC⦁ x < y ⇒ ∃z⦁ x < x * z ∧ x * z < y⌝);
a(REPEAT ∀_tac);
a(pair_tac⌜x = (m, i)⌝ THEN pair_tac⌜y = (n, j)⌝ );
a(REPEAT strip_tac THEN all_fc_tac [dy_dense_lemma6] THEN all_fc_tac[dy_dense_lemma7]);
a(∃_tac⌜z⌝ THEN REPEAT strip_tac);
a(GET_NTH_ASM_T 3 ante_tac THEN DROP_ASMS_T discard_tac THEN strip_tac);
a(all_fc_tac[∀_elim⌜(m, i)⌝dy_times_mono_thm] THEN POP_ASM_T ante_tac);
a(rewrite_tac[dy_times_unit_thm] THEN REPEAT strip_tac THEN asm_rewrite_tac[]);
save_pop_thm "dy_right_dense_thm"
);
=TEX
The purely order-theoretic density theorem is a trivial consequence of
the stronger (algebraic) density theorem, but is very useful
as a theorem in its own right in later proofs:
=SML
val ⦏dy_less_dense_thm⦎ = (
set_goal([], ⌜∀x y : DYADIC⦁ x < y ⇒ ∃z⦁ x < z ∧ z < y⌝);
a(REPEAT strip_tac THEN all_fc_tac[dy_right_dense_thm]);
a(∃_tac⌜x*z⌝ THEN REPEAT strip_tac);
save_pop_thm "dy_less_dense_thm"
);
=TEX
Now we do the left-hand density theorem:
=INLINEFT
∀x y⦁ x < y ⇒ ∃z⦁ x < y*z < y
=TEX
. In fact, this can be derived from the
weak density property and the archimedean property; for historical
reasons we prove it from first principles. We
make use of the right-hand density theorem and
of some of the lemmas that lead up to the archimedean property
to simplify the arithmetic. In particular, the right-hand density theorem
lets us reduce to the case $x = 0$ and the fourth lemma used
to prove the archimedean property lets us then reduce to the case
where $y$ has the form $1+1/2^{r+1}$.

We now need to work with numbers of the form
$1-1/2^{r+1} = (2 \times 2^r -1)/ 2^{r+1}$.
We need to do a little preparation to help the linear arithmetic
decision procedure for the natural numbers with numbers of
the form $2 \times 2^r -1$.
Our next lemma verifies a pair of recursion equations for these numbers:
=SML
val ⦏dy_dense_lemma8⦎ = (
set_goal([], ⌜2^0 - 1 = 0 ∧ ∀r⦁ 2^(r+1) - 1 = 2 * (2^r - 1) + 1 ⌝);
a(rewrite_tac[exp_clauses] THEN REPEAT strip_tac THEN induction_tac ⌜r:ℕ⌝);
(* *** Goal "1" *** *)
a(rewrite_tac[exp_clauses] THEN conv_tac(MAP_C minus_conv) THEN strip_tac);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[exp_clauses]);
a(strip_asm_tac(∀_elim⌜r⌝exp_2_pos_thm));
a(POP_ASM_T(strip_asm_tac o rewrite_rule[less_def, ≤_def]));
a(POP_ASM_T (rewrite_thm_tac o eq_sym_rule));
a(conv_tac (ONCE_MAP_C anf_conv));
a(rewrite_tac[pc_rule1 "lin_arith" prove_rule[] ⌜4 + 4 * i = (4*i + 3) + 1⌝, minus_def]);
pop_lemma "dy_dense_lemma8"
);
=TEX
In the next few lemmas, we quantifier over a function $f$ which is assumed
to satisfy the recursion equations of the previous lemma.
The following lemma gives the relationship between $f(r)$ and $w^{r+1}$.

=SML
val ⦏dy_dense_lemma9⦎ = (
set_goal([], ⌜∀f⦁
	f 0 = 0 ∧ (∀i⦁f(i+1) = 2*f i + 1) ⇒ ∀r⦁ 2^r = f r + 1⌝);
a(REPEAT strip_tac THEN induction_tac ⌜r:ℕ⌝);
(* *** Goal "1" *** *)
a(asm_rewrite_tac[exp_clauses]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[exp_clauses] THEN PC_T1 "lin_arith" asm_prove_tac[]);
pop_lemma "dy_dense_lemma9"
);
=TEX
The next lemma says that
$1 < (1+3/2^{r+1})\times(1-1/2^{r+1})$.
=SML
val ⦏dy_dense_lemma10⦎ = (
set_goal([], ⌜∀f r⦁
	f 0 = 0 ∧ (∀i⦁f(i+1) = 2*f i + 1) ⇒
	dy_one < (2^r+2, ℕℤ r + ℕℤ 1) * (f r,  ℕℤ r + ℕℤ 1) ⌝);
a(REPEAT strip_tac THEN rewrite_tac[dy_times_def, dy_less_def, dy_one_def]);
a(∃_tac⌜r+r+2⌝ THEN ∃_tac⌜0⌝ THEN REPEAT strip_tac THEN1
	(asm_rewrite_tac[ℕℤ_plus_homomorphism_thm] THEN PC_T1 "ℤ_lin_arith" prove_tac[]));
a(rewrite_tac[exp_clauses]);
a(ALL_FC_T rewrite_tac[dy_dense_lemma9]);
a(PC_T1 "lin_arith" prove_tac[]);
pop_lemma "dy_dense_lemma10"
);
=TEX
We now show that
$1 - 1/2^{r+1} < 1$.
=SML
val ⦏dy_dense_lemma11⦎ = (
set_goal([], ⌜∀f r⦁
	f 0 = 0 ∧ (∀i⦁f(i+1) = 2*f i + 1) ⇒
	(f r,  ℕℤ r + ℕℤ 1) < dy_one⌝);
a(REPEAT strip_tac THEN rewrite_tac[dy_times_def, dy_less_def, dy_one_def]);
a(∃_tac⌜0⌝ THEN ∃_tac⌜r+1⌝ THEN REPEAT strip_tac THEN1
	(asm_rewrite_tac[ℕℤ_plus_homomorphism_thm] THEN PC_T1 "ℤ_lin_arith" prove_tac[]));
a(rewrite_tac[exp_clauses]);
a(ALL_FC_T rewrite_tac[dy_dense_lemma9]);
a(PC_T1 "lin_arith" prove_tac[]);
pop_lemma "dy_dense_lemma11"
);
=TEX
Now we can prove the negative version of the density property in the special
case where the lower bound is $1$:
=SML
val ⦏dy_dense_lemma12⦎ = (
set_goal([], ⌜∀x:DYADIC⦁ dy_one < x ⇒ ∃y⦁ dy_one < x * y ∧ x * y < x⌝);
a(REPEAT strip_tac);
a(lemma_tac ⌜∃r⦁(2^r+2, ℕℤ r + ℕℤ 1) < x⌝);
(* *** Goal "1" *** *)
a(all_fc_tac[dy_arch_lemma4]);
a(∃_tac ⌜r+3⌝ THEN bc_thm_tac dy_less_trans_thm);
a(∃_tac⌜(2 ^ r, ℕℤ r + ℕℤ 1)⌝ THEN REPEAT strip_tac);
a(rewrite_tac[dy_times_def, dy_less_def]);
a(∃_tac⌜0⌝ THEN ∃_tac⌜3⌝ THEN REPEAT strip_tac THEN1
	(asm_rewrite_tac[ℕℤ_plus_homomorphism_thm] THEN PC_T1 "ℤ_lin_arith" prove_tac[]));
a(rewrite_tac[exp_clauses] THEN PC_T1 "lin_arith" prove_tac[]);
(* *** Goal "2" *** *)
a(lemma_tac⌜∃f⦁ f 0 = 0 ∧ (∀i⦁f(i+1) = 2*f i + 1)⌝
	THEN1 (∃_tac⌜λi⦁2^i-1⌝ THEN rewrite_tac[dy_dense_lemma8]));
a(∃_tac⌜(f r, ℕℤ r + ℕℤ 1)⌝ THEN REPEAT strip_tac);
(* *** Goal "2.1" *** *)
a(all_fc_tac[dy_dense_lemma10] THEN POP_ASM_T (strip_asm_tac o ∀_elim⌜r⌝));
a(bc_thm_tac dy_less_trans_thm THEN ∃_tac⌜(2 ^ r + 2, ℕℤ r + ℕℤ 1) * (f r, ℕℤ r + ℕℤ 1)⌝);
a(REPEAT strip_tac);
a(bc_thm_tac dy_times_mono_thm1 THEN REPEAT strip_tac);
(* *** Goal "2.2" *** *)
a(all_fc_tac[dy_dense_lemma11] THEN POP_ASM_T (strip_asm_tac o ∀_elim⌜r⌝));
a(ante_tac(list_∀_elim[⌜x⌝, ⌜(f r, ℕℤ r + ℕℤ 1)⌝, ⌜dy_one⌝]dy_times_mono_thm));
a(asm_rewrite_tac[dy_times_unit_thm]);
pop_lemma "dy_dense_lemma12"
);
=TEX
=SML
val ⦏dy_left_dense_thm⦎ = (
set_goal([], ⌜∀x y:DYADIC⦁ x < y ⇒ ∃z⦁ x < y * z ∧ y * z < y⌝);
a(REPEAT strip_tac);
a(all_fc_tac[dy_right_dense_thm]);
a(lemma_tac ⌜dy_one < z⌝);
(* *** Goal "1" *** *)
a(LEMMA_T⌜x * dy_one < x * z⌝ ante_tac THEN1 asm_rewrite_tac[dy_times_unit_thm]);
a(rewrite_tac[dy_times_mono_⇔_thm]);
(* *** Goal "2" *** *)
a(all_fc_tac [dy_dense_lemma12]);
a(∃_tac⌜y'⌝ THEN REPEAT strip_tac);
(* *** Goal "2.1" *** *)
a(bc_thm_tac dy_less_trans_thm THEN ∃_tac ⌜x * z * y'⌝);
a(REPEAT strip_tac);
(* *** Goal "2.1.1" *** *)
a(LEMMA_T⌜x * dy_one < x * z * y'⌝ ante_tac THEN1
	(rewrite_tac[dy_times_mono_⇔_thm] THEN asm_rewrite_tac[dy_times_unit_thm]));
a(rewrite_tac[dy_times_unit_thm]);
(* *** Goal "2.1.2" *** *)
a(rewrite_tac[conv_rule (ONCE_MAP_C eq_sym_conv) dy_times_assoc_thm]);
a(once_rewrite_tac[dy_times_comm_thm]);
a(asm_rewrite_tac[dy_times_mono_⇔_thm]);
(* *** Goal "2.2" *** *)
a(lemma_tac⌜y' < dy_one⌝);
(* *** Goal "2.2.1" *** *)
a(strip_asm_tac(list_∀_elim[⌜dy_one⌝, ⌜y'⌝] dy_less_trich_thm));
(* *** Goal "2.2.1.1" *** *)
a(all_var_elim_asm_tac1 THEN POP_ASM_T ante_tac
	THEN rewrite_tac[dy_less_irrefl_thm, dy_times_unit_thm]);
(* *** Goal "2.2.1.2" *** *)
a(LEMMA_T⌜z * dy_one < z * y'⌝ ante_tac THEN1
	(rewrite_tac[dy_times_mono_⇔_thm] THEN asm_rewrite_tac[dy_times_unit_thm]));
a(rewrite_tac[dy_times_unit_thm] THEN contr_tac THEN all_fc_tac[dy_less_antisym_thm]);
(* *** Goal "2.2.2" *** *)
a(LEMMA_T⌜y * y' < y * dy_one⌝ ante_tac THEN1
	(rewrite_tac[dy_times_mono_⇔_thm] THEN asm_rewrite_tac[dy_times_unit_thm]));
a(rewrite_tac[dy_times_unit_thm]);
save_pop_thm "dy_left_dense_thm"
);
=TEX
\section{EPILOGUE}
=SML
val _ = undeclare_alias("*", ⌜$dy_times⌝);
val _ = undeclare_alias("<", ⌜$dy_less⌝);
val _ = undeclare_alias("^", ⌜$dy_exp⌝);
end (* of structure Dyadic *);
=TEX
\twocolumn[\section{INDEX}]
\small
\printindex

\end{document}








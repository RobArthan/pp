=IGN
********************************************************************************
imp106.doc: this file is part of the PPZed system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
=TEX
%%%%% YOU MAY WANT TO CHANGE POINT SIZE IN THE FOLLOWING:
\documentclass[a4paper,11pt]{article}

%%%%% YOU CAN ADD OTHER PACKAGES AS NEEDED BELOW:
\usepackage{A4}
\usepackage{Lemma1}
\usepackage{ProofPower}
\usepackage{latexsym}
\usepackage{epsf}
\makeindex

%%%%% YOU WILL WANT TO CHANGE THE FOLLOWING TO SUIT YOU AND YOUR DOCUMENT:

\def\Title{Implementation of Arithmetic Proof Procedures for Z}

\def\AbstractText{This document contains the implementation of proof procedures for the integers in Z. These include arithmetic normalisation and a linear arithmetic prover.}

\def\Reference{DS/FMU/IED/IMP106}

\def\Author{R.D. Arthan}


\def\EMail{C/O {\tt rda@lemma-one.com}}

\def\Phone{C/O +44 7497 030682}

\def\Abstract{\begin{center}{\bf Abstract}\par\parbox{0.7\hsize}
{\small \AbstractText}
\end{center}}

%%%%% YOU MAY WANT TO CHANGE THE FOLLOWING TO GET A NICE FRONT PAGE:
\def\FrontPageTitle{ {\huge \Title } }
\def\FrontPageHeader{\raisebox{16ex}{\begin{tabular}[t]{c}
\bf Copyright \copyright\ : Lemma 1 Ltd \number\year\\\strut\\
\end{tabular}}}

%%%%% THE FOLLOWING DEFAULTS WILL GENERALLY BE RIGHT:

\def\Version{\VCVersion}
\def\Date{\FormatDate{\VCDate}}

%% LaTeX2e port: =TEX
%% LaTeX2e port: \documentstyle[hol1,11pt,TQ]{article}
%% LaTeX2e port: \ftlinepenalty=9999
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{FST PROJECT}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \def\TPPheadtitle{ Arithmetic Proof Procedures for Z}
%% LaTeX2e port: \TPPtitle{Implementation of Arithmetic Proof Procedures for Z}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP106}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.7 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2004/01/19 12:44:00 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{R.D.~Arthan & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.B.~Jones & FMU Manager}
%% LaTeX2e port: \TPPabstract{This document contains the implementation of proof
%% LaTeX2e port: procedures for the integers in Z.
%% LaTeX2e port: These include arithmetic normalisation and a linear arithmetic prover.}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	    Library
%% LaTeX2e port: }}
%% LaTeX2e port: \begin{document}
%% LaTeX2e port: \makeTPPfrontpage
%% LaTeX2e port: \vfill
%% LaTeX2e port: \begin{centering}
%% LaTeX2e port: \bf Copyright \copyright\ : Lemma 1 Ltd. \number\year
%% LaTeX2e port: \end{centering}

\begin{document}

\headsep=0mm
\FrontPage
\headsep=10mm

\setcounter{section}{-1}
\pagebreak
\section{Document control}
\subsection{Contents list}
\tableofcontents
\subsection{Document cross references}
\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes history}
\begin{description}
\item[Issues .1, 1.2 (1994/12/21)] First drafts.
\item[Issue 1.3 (1996/03/07)]
Added $z\_lin\_arith1$.
\item[Issue 1.4 (2002/03/09)]
Stopped it undeclaring the HOL aliases in the theory of HOL integers.
\item[Issue 1.5 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.6 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.7 (2004/01/19)] The Z universal set is now called 𝕌.
\item[Issue 1.8 (2006/04/20)] Added support for floating point literals
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported PPZed to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes forecast}
As determined by comment and review.
\section{GENERAL}
\subsection{Scope}
This document contains the implementation of part of the \ProductZ\ system.
The document responds to \cite{DS/FMU/IED/DTD106}.
\subsection{Introduction}
\subsubsection{Purpose and Background}
See \cite{DS/FMU/IED/DTD106}.
\subsubsection{Dependencies}
This document depends on the theory $z\_numbers$ defined in
\cite{DS/FMU/IED/DTD086} and on the conversions and tactics in
\cite{DS/FMU/IED/DTD105}.
\subsubsection{Algorithms}
Once the right theorems are proved the code is very straightforward.
All the difficulty, such as it is, is captured in the rewrite schemes in the detailed design.
\subsubsection{Known Deficiencies}
None.
\subsubsection{Possible Enhancements}
See \cite{DS/FMU/IED/DTD106}.
\section{PREAMBLE}
=TEX
=SML
structure ⦏ZArithmeticTools⦎ : ZArithmeticTools = struct
=TEX
=SML
val _ = set_merge_pcs["'ℤ", "hol"];
=TEX
\section{CONSISTENCY PROOF}
=SML
val ⦏z_plus1_hol_plus1_thm⦎ = (
set_goal([], ⌜∀m : ℕ⦁ ⓩ ⌜ℕℤ m⌝ + ⌜ℕℤ 1⌝⌝ = ℕℤ m + ℕℤ 1 ⌝);
a(strip_tac);
a(LEMMA_T ⌜ⓩ⌜ℕℤ m⌝ + ⌜ℕℤ 1⌝⌝ = ⌜ℕℤ(m + 1)⌝
	∧ ℕℤ m + ℕℤ 1 = ℕℤ(m + 1)⌝ rewrite_thm_tac THEN strip_tac);
(* *** Goal "1" *** *)
a(rewrite_tac[rewrite_rule[get_spec⌜Z'Int⌝]z'int_def]);
(* *** Goal "2" *** *)
a(rewrite_tac[ℕℤ_plus_homomorphism_thm]);
(fn _ => pop_thm()) "z_plus1_hol_plus1_thm"
);
val ⦏z_plus1_hol_plus1_thm1⦎ = (
push_goal([], ⌜∀m : ℕ⦁ ℕℤ m + ℕℤ 1 = ⓩ ⌜ℕℤ m⌝ + ⌜ℕℤ 1⌝⌝ ⌝);
a(rewrite_tac[z_plus1_hol_plus1_thm]);
(fn _ => pop_thm()) "z_plus1_hol_plus1_thm1"
);
=TEX
=SML
val ⦏z_plus_hol_plus_thm⦎ = (
set_goal([], ⌜∀m n : ℕ⦁ ⓩ ⌜ℕℤ m⌝ + ⌜ℕℤ n⌝⌝ = ℕℤ m + ℕℤ n ⌝);
a(REPEAT strip_tac);
a(induction_tac⌜n⌝);
(* *** Goal "1" *** *)
a(rewrite_tac[] THEN PC_T1 "z_predicates" rewrite_tac[z_plus_clauses]
	THEN rewrite_tac[get_spec⌜Z'Int⌝]);
(* *** Goal "2" *** *)
a(rewrite_tac[ℕℤ_plus_homomorphism_thm, ℤ_plus_assoc_thm1]);
a(LEMMA_T ⌜(ℕℤ m + ℕℤ n) = ℕℤ (m + n)⌝ rewrite_thm_tac
	THEN1 rewrite_tac[ℕℤ_plus_homomorphism_thm]);
a(rewrite_tac[z_plus1_hol_plus1_thm1]);
a(PC_T1 "z_predicates" asm_rewrite_tac[z_plus_assoc_thm1]);
a(rewrite_tac[ℕℤ_plus_homomorphism_thm]);
(fn _ => pop_thm()) "z_plus_hol_plus_thm"
);
=TEX
=SML
val ⦏z_ℕℤ_cases_thm⦎ = (
set_goal([], ⌜∀i : ℤ⦁ ∃m : ℕ⦁ i = ℕℤ m ∨ i = ⓩ~⌜ℕℤ m⌝⌝⌝);
a(REPEAT strip_tac);
a(lemma_tac⌜∀i⦁i ∈ ⓩℕ⌝ ⇒ ∃m⦁i = ℕℤ m⌝);
(* *** Goal "1" *** *)
a(strip_tac THEN z_ℕ_induction_tac);
(* *** Goal "1.1" *** *)
a(∃_tac⌜0⌝ THEN rewrite_tac[get_spec⌜Z'Int⌝]);
(* *** Goal "1.2" *** *)
a(all_var_elim_asm_tac1);
a(rewrite_tac[get_spec⌜Z'Int⌝, z_plus1_hol_plus1_thm]);
a(∃_tac⌜i' + 1⌝ THEN rewrite_tac[ℕℤ_plus_homomorphism_thm]);
a(PC_T1 "z_predicates" strip_asm_tac(pc_rule1 "z_predicates"
	rewrite_rule[](z_∀_elim⌜i⌝ z_ℤ_cases_thm))
	THEN all_var_elim_asm_tac1);
(* *** Goal "2.1" *** *)
a(all_asm_fc_tac[]);
a(∃_tac ⌜m⌝ THEN REPEAT strip_tac);
(* *** Goal "2.2" *** *)
a(all_asm_fc_tac[] THEN all_var_elim_asm_tac1);
a(∃_tac ⌜m⌝ THEN REPEAT strip_tac);
(fn _ => pop_thm()) "z_ℕℤ_cases_thm"
);
=TEX
=SML
val ⦏z_ℤ_iso_lemma1⦎ = (
set_goal([], ⌜∃f: ℤ → ℤ⦁
		f (ℕℤ 1) = ⓩ1⌝
	∧	∀i⦁f(i + ℕℤ 1) = ⓩ⌜f i⌝ + 1⌝
⌝);
a(∃_tac⌜λx:ℤ⦁if ℕℤ 0 ≤ x then x else ⓩ~⌜~(x:ℤ)⌝⌝⌝ THEN	
		rewrite_tac[get_spec⌜Z'Int⌝] THEN
			REPEAT strip_tac);
a(strip_asm_tac(∀_elim⌜i⌝ℤ_cases_thm1) THEN asm_rewrite_tac[ℕℤ_≤_thm]);
(* *** Goal "1" *** *)
a(LEMMA_T⌜ℕℤ m + ℕℤ 1 = ℕℤ(m + 1)⌝ rewrite_thm_tac
	THEN1 rewrite_tac[ℕℤ_plus_homomorphism_thm]);
a(rewrite_tac[ℕℤ_≤_thm]);
a(rewrite_tac[ℕℤ_plus_homomorphism_thm, z_plus1_hol_plus1_thm]);
(* *** Goal "2" *** *)
a(rewrite_tac[ℕℤ_plus_homomorphism_thm, ℤ_minus_clauses,
		ℤ_plus_assoc_thm, ℤ_plus_clauses]);
a(LEMMA_T⌜ ¬ ℕℤ 0 ≤ ~ (ℕℤ m) + ~ (ℕℤ 1)⌝ rewrite_thm_tac);
(* *** Goal "2.1" *** *)
a(rewrite_tac[get_spec⌜$<⋎Z⌝, ℤ_plus_assoc_thm]);
a(pure_once_rewrite_tac[ℤ_≤_≤_0_thm1]);
a(rewrite_tac[ℕℤ_≤_thm]);
(* *** Goal "2.2" *** *)
a(strip_asm_tac(∀_elim⌜m⌝ ℕ_cases_thm) THEN asm_rewrite_tac[]);
(* *** Goal "2.2.1" *** *)
a(PC_T1 "z_predicates" rewrite_tac[z_minus_thm, get_spec⌜Z'Int⌝]);
(* *** Goal "2.2.2" *** *)
a(LEMMA_T⌜ ¬ ℕℤ 0 ≤ ~ (ℕℤ(i' + 1))⌝ rewrite_thm_tac);
(* *** Goal "2.2.2.1" *** *)
a(rewrite_tac[ℕℤ_plus_homomorphism_thm, get_spec⌜$<⋎Z⌝, ℤ_plus_assoc_thm]);
a(pure_once_rewrite_tac[ℤ_≤_≤_0_thm1]);
a(rewrite_tac[ℕℤ_≤_thm]);
(* *** Goal "2.2.2.2" *** *)
a(rewrite_tac[z_plus1_hol_plus1_thm1]);
a(PC_T1 "z_predicates" rewrite_tac[z_minus_thm,
		z_plus_assoc_thm, z_plus_clauses]);
(fn _ => pop_thm()) "z_ℤ_iso_lemma1"
);
=TEX
=SML
val ⦏z_ℤ_iso_lemma2⦎ = (
set_goal([], ⌜∀f: ℤ → ℤ⦁
		f (ℕℤ 1) = ⓩ1⌝
	∧	(∀i ⦁ f (i + ℕℤ 1) = ⓩ⌜f i⌝ + 1⌝)
	⇒	f (ℕℤ 0) = ⓩ0⌝
⌝);
a(REPEAT strip_tac);
a(lemma_tac⌜f (ℕℤ 1) = ⓩ⌜f(ℕℤ 0)⌝ + ⌜f(ℕℤ 1)⌝⌝⌝);
(* *** Goal "1" *** *)
a(LEMMA_T⌜ⓩ⌜f (ℕℤ 0)⌝ + ⌜f (ℕℤ 1)⌝⌝ = f(ℕℤ 0 + ℕℤ 1) ⌝
	pure_rewrite_thm_tac THEN1 asm_rewrite_tac[]);
a(rewrite_tac[ℤ_plus_clauses]);
(* *** Goal "2" *** *)
a(swap_nth_asm_concl_tac 1);
a(conv_tac(RAND_C eq_sym_conv));
a(PC_T1 "z_predicates" once_rewrite_tac[z_ℤ_eq_thm]);
a(PC_T1 "z_predicates" rewrite_tac
	[z_∀_elimⓩ~⌜f (ℕℤ 0)⌝⌝ z_plus_order_thm,
		z_plus_clauses, z_plus_assoc_thm, z_minus_thm]);
a(REPEAT strip_tac);
(fn _ => pop_thm()) "z_ℤ_iso_lemma2"
);
=TEX
=SML
val ⦏z_ℤ_iso_lemma3⦎ = (
set_goal([], ⌜∀f: ℤ → ℤ⦁
		f (ℕℤ 1) = ⓩ1⌝
	∧	(∀i ⦁ f (i + ℕℤ 1) = ⓩ⌜f i⌝ + 1⌝)
	⇒	∀i ⦁ ℕℤ 0 ≤ i ⇒ f(~i) = ⓩ~⌜f i⌝⌝
⌝);
a(REPEAT_N 3 strip_tac);
a(ℤ_ℕ_induction_tac);
(* *** Goal "1" *** *)
a(ALL_FC_T rewrite_tac[z_ℤ_iso_lemma2]);
a(PC_T1 "z_predicates" rewrite_tac[z_minus_clauses]);
(* *** Goal "2" *** *)
a(LEMMA_T ⓩ⌜f (~ (i + ℕℤ 1) + ℕℤ 1)⌝ = ~ ⌜f i⌝⌝ ante_tac);
(* *** Goal "2.1" *** *)
a(rewrite_tac[ℤ_minus_thm, ℤ_plus_assoc_thm, ℤ_plus_clauses]);
a(asm_rewrite_tac[]);
(* *** Goal "2.2" *** *)
a(PC_T1 "z_predicates" asm_rewrite_tac[z_minus_thm]);
a(PC_T1 "z_predicates" once_rewrite_tac[z_ℤ_eq_thm]);
a(PC_T1 "z_predicates" rewrite_tac
	[z_∀_elim⌜f i⌝ z_plus_order_thm,
		z_plus_clauses, z_plus_assoc_thm, z_minus_thm]);
(fn _ => pop_thm()) "z_ℤ_iso_lemma3"
);
=TEX
=SML
val ⦏z_ℤ_iso_lemma4⦎ = (
set_goal([], ⌜∀f: ℤ → ℤ⦁
		f (ℕℤ 1) = ⓩ1⌝
	∧	(∀i ⦁ f (i + ℕℤ 1) = ⓩ⌜f i⌝ + 1⌝)
	⇒	∀i ⦁ f(~i) = ⓩ~⌜f i⌝⌝
⌝);
a(REPEAT strip_tac);
a(strip_asm_tac (∀_elim ⌜i⌝ ℤ_cases_thm));
(* *** Goal "1" *** *)
a(lemma_tac ⌜ℕℤ 0 ≤ ℕℤ m⌝  THEN1 rewrite_tac[ℕℤ_≤_thm]);
a(all_fc_tac[z_ℤ_iso_lemma3]);
a(asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(lemma_tac ⌜ℕℤ 0 ≤ ℕℤ m⌝  THEN1 rewrite_tac[ℕℤ_≤_thm]);
a(all_fc_tac[z_ℤ_iso_lemma3]);
a(asm_rewrite_tac[]);
a(PC_T1 "z_predicates" asm_rewrite_tac[z_minus_thm]);
(fn _ => pop_thm()) "z_ℤ_iso_lemma4"
);
=TEX
=SML
val ⦏z_ℤ_iso_lemma5⦎ = (
set_goal([], ⌜∀f: ℤ → ℤ⦁
		f (ℕℤ 1) = ⓩ1⌝
	∧	(∀i ⦁ f (i + ℕℤ 1) = ⓩ⌜f i⌝ + 1⌝)
	⇒	∀i j⦁ f(i + j) = ⓩ⌜f i⌝ + ⌜f j⌝⌝
⌝);
a(REPEAT_N 3 strip_tac);
a(ℤ_induction_tac⌜i⌝);
(* *** Goal "1" *** *)
a(PC_T1 "z_predicates" once_rewrite_tac[z_plus_comm_thm]);
a(once_rewrite_tac[ℤ_plus_comm_thm]);
a(asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(REPEAT strip_tac);
a(LEMMA_T ⌜~ i + j = ~(i + ~j)⌝ pure_rewrite_thm_tac
		THEN1 rewrite_tac[ℤ_minus_thm]);
a(ALL_FC_T pure_rewrite_tac[z_ℤ_iso_lemma4]);
a(asm_rewrite_tac[]);
a(PC_T1 "z_predicates" rewrite_tac[z_minus_thm]);
a(ALL_FC_T pure_rewrite_tac[z_ℤ_iso_lemma4]);
a(PC_T1 "z_predicates" rewrite_tac[z_minus_thm]);
(* *** Goal "3" *** *)
a(REPEAT strip_tac);
a(LEMMA_T ⌜(i + j) + j' = j + i + j'⌝ rewrite_thm_tac
		THEN1 rewrite_tac[ℤ_plus_assoc_thm, ∀_elim⌜i⌝ℤ_plus_order_thm]);
a(asm_rewrite_tac[]);
a(PC_T1 "z_predicates"
	rewrite_tac[z_plus_assoc_thm, z_∀_elim⌜f i⌝z_plus_order_thm]);
(fn _ => pop_thm()) "z_ℤ_iso_lemma5"
);
=TEX
=SML
val ⦏z_ℤ_iso_lemma6⦎ = (
set_goal([], ⌜∀f: ℤ → ℤ⦁
		f (ℕℤ 1) = ⓩ1⌝
	∧	(∀i ⦁ f (i + ℕℤ 1) = ⓩ⌜f i⌝ + 1⌝)
	⇒	(∀m⦁ f (ℕℤ m)  = ℕℤ m)
⌝);
a(REPEAT strip_tac);
a(induction_tac⌜m⌝);
(* *** Goal "1" *** *)
a(ALL_FC_T rewrite_tac[z_ℤ_iso_lemma2]);
a(rewrite_tac[get_spec⌜Z'Int⌝]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac
	[get_spec⌜Z'Int⌝, ℕℤ_plus_homomorphism_thm, z_plus1_hol_plus1_thm]);
(fn _ => pop_thm()) "z_ℤ_iso_lemma6"
);
=TEX
=SML
val ⦏z_ℤ_iso_lemma7⦎ = (
set_goal([], ⌜∀f: ℤ → ℤ⦁
		f (ℕℤ 1) = ⓩ1⌝
	∧	(∀i ⦁ f (i + ℕℤ 1) = ⓩ⌜f i⌝ + 1⌝)
	⇒	(f i  = ℕℤ 0 ⇒ i = ℕℤ 0)
⌝);
a(REPEAT strip_tac);
a(strip_asm_tac (∀_elim ⌜i⌝ ℤ_cases_thm) THEN all_var_elim_asm_tac1);
(* *** Goal "1" *** *)
a(POP_ASM_T ante_tac THEN ALL_FC_T rewrite_tac[z_ℤ_iso_lemma6]);
(* *** Goal "2" *** *)
a(POP_ASM_T ante_tac THEN ALL_FC_T rewrite_tac[z_ℤ_iso_lemma6, z_ℤ_iso_lemma4]);
a(conv_tac (
	LEFT_C(eq_sym_conv THEN_C
			PC_C1 "z_predicates" once_rewrite_conv[z_ℤ_eq_thm])
		THEN_C
	RIGHT_C(eq_sym_conv THEN_C (once_rewrite_conv[ℤ_eq_thm]))));
a(rewrite_tac[]);
a(PC_T1"z_predicates" rewrite_tac[z_minus_thm, get_spec⌜Z'Int⌝,
	rewrite_rule[get_spec⌜Z'Int⌝] z_plus_clauses]);
(fn _ => pop_thm()) "z_ℤ_iso_lemma7"
);
=TEX
=SML
val ⦏z_ℤ_iso_lemma8⦎ = (
set_goal([], ⌜∀f: ℤ → ℤ⦁
		f (ℕℤ 1) = ⓩ1⌝
	∧	(∀i ⦁ f (i + ℕℤ 1) = ⓩ⌜f i⌝ + 1⌝)
	⇒	OneOne f
	∧	Onto f
⌝);
a(rewrite_tac[one_one_def, onto_def] THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(all_fc_tac[z_ℤ_iso_lemma5, z_ℤ_iso_lemma4]);
a(lemma_tac⌜f(x1 + ~ x2) = ℕℤ 0⌝ THEN1
	(asm_rewrite_tac[] THEN
		PC_T1"z_predicates" rewrite_tac[z_minus_thm, get_spec⌜Z'Int⌝]));
a(all_fc_tac[z_ℤ_iso_lemma7]);
a(once_rewrite_tac[ℤ_eq_thm] THEN REPEAT strip_tac);
(* *** Goal "2" *** *)
a(all_fc_tac[z_ℤ_iso_lemma6]);
a(strip_asm_tac (∀_elim ⌜y⌝ z_ℕℤ_cases_thm) THEN all_var_elim_asm_tac1);
(* *** Goal "2.1" *** *)
a(∃_tac⌜ℕℤ m⌝ THEN asm_rewrite_tac[]);
(* *** Goal "2.2" *** *)
a(∃_tac⌜~(ℕℤ m)⌝);
a(ALL_FC_T asm_rewrite_tac[z_ℤ_iso_lemma4]);
(fn _ => pop_thm()) "z_ℤ_iso_lemma8"
);
=TEX
=SML
val ⦏z_ℤ_iso_lemma9⦎ = (
set_goal([], ⌜∀f⦁
		OneOne f
	∧	Onto f
	⇒	∃g⦁ (∀x⦁ g(f x) = x) ∧ (∀y⦁ f(g y) = y)
⌝);
a(rewrite_tac[one_one_def, onto_def] THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(∃_tac⌜λ y⦁ ε x ⦁ f x = y⌝ THEN rewrite_tac[]);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(ε_tac ⌜ε x'⦁ f x' = f x⌝ );
(* *** Goal "1.1" *** *)
a(prove_tac[]);
(* *** Goal "1.2" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "2" *** *)
a(ε_tac ⌜ε x⦁ f x = y⌝ );
a(conv_tac (BINDER_C eq_sym_conv) THEN asm_rewrite_tac[]);
(fn _ => pop_thm()) "z_ℤ_iso_lemma9"
);
=TEX
=SML
val ⦏z_ℤ_iso_lemma10⦎ = (
set_goal([], ⌜∃f g: ℤ → ℤ⦁
	f (ℕℤ 1) = ⓩ1⌝
∧	g ⓩ1⌝ = ℕℤ 1
∧	(∀ i j⦁ f (i + j) = ⓩ⌜f i⌝ + ⌜f j⌝⌝)
∧	(∀ i⦁ f (~ i) = ⓩ~⌜f i⌝⌝)
∧	(∀ i j⦁ g ⓩi + j⌝ = g i + g j)
∧	(∀ i⦁ g ⓩ~ i⌝ = ~(g i))
∧	(∀x⦁ g(f x) = x) ∧ (∀y⦁ f(g y) = y)
⌝);
a(strip_asm_tac z_ℤ_iso_lemma1);
a(all_fc_tac[z_ℤ_iso_lemma4, z_ℤ_iso_lemma5, z_ℤ_iso_lemma8]);
a(∃_tac⌜f⌝ THEN asm_rewrite_tac[]);
a(all_fc_tac[z_ℤ_iso_lemma9]);
a(∃_tac⌜g⌝ THEN asm_rewrite_tac[]);
a(LEMMA_T⌜g(f (ℕℤ 1)) = g ⓩ1⌝⌝
	ante_tac THEN1 GET_NTH_ASM_T 8 rewrite_thm_tac);
a(asm_rewrite_tac[] THEN STRIP_T rewrite_thm_tac);
a(LEMMA_T⌜∀ i j⦁ g(f (g (i) + g (j))) = gⓩ⌜f (g (i))⌝ + ⌜f (g (j))⌝⌝⌝
	ante_tac THEN1 (GET_NTH_ASM_T 5 rewrite_thm_tac
			THEN LIST_GET_NTH_ASM_T [1, 2] rewrite_tac));
a(asm_rewrite_tac[] THEN STRIP_T rewrite_thm_tac);
a(LEMMA_T⌜∀ i⦁ g(f (~ i)) = gⓩ~ ⌜f i⌝⌝⌝
	ante_tac THEN1 (GET_NTH_ASM_T 6 rewrite_thm_tac
			THEN LIST_GET_NTH_ASM_T [1, 2] rewrite_tac));
a(asm_rewrite_tac[] THEN STRIP_T asm_rewrite_thm_tac);
(fn _ => pop_thm()) "z_ℤ_iso_lemma10"
);
=TEX
=SML
val ⦏z_ℤ_consistent_thm⦎ = (
push_consistency_goal ⌜z_ℤ⌝;
a(strip_asm_tac z_ℤ_iso_lemma10);
a(∃_tac ⌜(g, f)⌝);
a(asm_rewrite_tac[]);
save_consistency_thm ⌜z_ℤ⌝ (pop_thm())
);
=TEX
\section{HOMOMORPHISM THEOREMS}
=SML
val ⦏z_ℤ_def⦎ = get_spec⌜z_ℤ⌝;
val ⦏ℤ_z_def⦎ = z_ℤ_def;
=TEX
=SML
val ⦏z_ℤ_plus_thm⦎ = (
set_goal([], ⌜∀i j:ℤ⦁z_ℤⓩi + j⌝ = ⌜z_ℤ i + z_ℤ  j⌝⌝);
a(rewrite_tac[ℤ_z_def]);
save_pop_thm "z_ℤ_plus_thm"
);
=TEX
=SML
val z_ℤ_times_thm = (
set_goal([], ⌜∀i j:ℤ⦁z_ℤⓩi * j⌝ = ⌜z_ℤ i * z_ℤ  j⌝⌝);
a(strip_tac THEN z_ℤ_induction_tac⌜i:ℤ⌝);
(* *** Goal "1" *** *)
a(rewrite_tac[z_ℤ_def]);
a(PC_T1 "z_predicates" rewrite_tac[z_times_clauses]);
(* *** Goal "2" *** *)
a(rewrite_tac[z_ℤ_def] THEN strip_tac);
a(LEMMA_T ⌜~ ⓩ⌜z_ℤ i⌝⌝ * ⓩ⌜z_ℤ j⌝⌝ = ~ (ⓩ⌜z_ℤ i⌝⌝ * ⓩ⌜z_ℤ j⌝⌝)⌝
	rewrite_thm_tac THEN1 rewrite_tac[ℤ_times_minus_thm]);
a(LEMMA_T ⓩ~ i * j = ~(i*j)⌝ rewrite_thm_tac
	THEN1 PC_T1 "z_predicates" rewrite_tac[z_minus_times_thm]);
a(asm_rewrite_tac[z_ℤ_def]);
(* *** Goal "3" *** *)
a(PC_T1 "z_predicates" asm_rewrite_tac
	[z_ℤ_def, ℤ_times_plus_distrib_thm, z_times_plus_distrib_thm]);
save_pop_thm "z_ℤ_times_thm"
);
=TEX
=SML
val ⦏z_ℤ_subtract_thm⦎ = (
set_goal([], ⌜∀i j:ℤ⦁z_ℤⓩi - j⌝ = ⌜z_ℤ i - z_ℤ  j⌝⌝);
a(rewrite_tac[] THEN MERGE_PCS_T1 ["'z_numbers", "z_predicates"] rewrite_tac[]);
a(rewrite_tac[ℤ_z_def]);
save_pop_thm "z_ℤ_subtract_thm"
);
=TEX
=SML
val ⦏z_ℤ_minus_thm⦎ = (
set_goal([], ⌜∀i:ℤ⦁z_ℤⓩ~i⌝ = ⌜~(z_ℤ i)⌝⌝);
a(rewrite_tac[ℤ_z_def]);
save_pop_thm "z_ℤ_minus_thm"
);
=TEX
=SML
val ⦏ℤ_z_ℕℤ_thm⦎ = (
set_goal([], ⌜∀m⦁ ℤ_z(ℕℤ m) = ℕℤ m⌝);
a(strip_asm_tac z_ℤ_def);
a(lemma_tac ⌜∀ i⦁ ℤ_z (i + ℕℤ 1) = ⓩ⌜ℤ_z i⌝ + 1⌝⌝
	THEN1 asm_rewrite_tac[get_spec⌜Z'Int⌝]);
a(ALL_FC_T rewrite_tac [z_ℤ_iso_lemma6]);
(fn _ => pop_thm()) "ℤ_z_ℕℤ_thm"
);
=TEX
=SML
val ⦏z_ℤ_ℕℤ_thm⦎ = (
set_goal([], ⌜∀m⦁ z_ℤ(ℕℤ m) = ℕℤ m⌝);
a(strip_tac);
a(LEMMA_T ⌜z_ℤ(ℕℤ m) = z_ℤ(ℤ_z(ℕℤ m))⌝ ante_tac THEN1 rewrite_tac[ℤ_z_ℕℤ_thm]);
a(rewrite_tac[z_ℤ_def]);
(fn _ => pop_thm()) "z_ℤ_ℕℤ_thm"
);
=TEX
=SML
val ⦏z_ℤ_z_int_thm⦎ = (
set_goal([], ⌜∀m⦁ z_ℤ(Z'Int m) = ℕℤ m⌝);
a(rewrite_tac [get_spec⌜Z'Int⌝, z_ℤ_ℕℤ_thm]);
(fn _ => pop_thm()) "z_ℤ_z_int_thm"
);
=TEX
=SML
val ⦏z_ℤ_ℤ_z_thm⦎ = (
set_goal([], ⌜∀i:ℤ⦁z_ℤ(ℤ_z i) = i⌝);
a(rewrite_tac[z_ℤ_def]);
(fn _ => pop_thm()) "z_ℤ_ℤ_z_thm"
);
=TEX
=SML
val ⦏ℤ_z_z_ℤ_thm⦎ = (
set_goal([], ⌜∀i:ℤ⦁ℤ_z(z_ℤ i) = i⌝);
a(rewrite_tac[z_ℤ_def]);
(fn _ => pop_thm()) "ℤ_z_z_ℤ_thm"
);
=TEX
=SML
val ⦏z_ℤ_eq_eq_ℤ_z_thm⦎ = (
set_goal([], ⌜∀i j:ℤ⦁z_ℤ i  = j ⇔ i = ℤ_z j⌝);
a(REPEAT strip_tac THEN all_var_elim_asm_tac1 THEN rewrite_tac[z_ℤ_def]);
(fn _ => pop_thm()) "z_ℤ_eq_eq_ℤ_z_thm"
);
=TEX
=SML
val ⦏ℤ_z_eq_eq_z_ℤ_thm⦎ = (
set_goal([], ⌜∀i j:ℤ⦁ℤ_z i  = j ⇔ i = z_ℤ j⌝);
a(REPEAT strip_tac THEN all_var_elim_asm_tac1 THEN rewrite_tac[z_ℤ_def]);
(fn _ => pop_thm()) "ℤ_z_eq_eq_z_ℤ_thm"
);
=TEX
=SML
val ⦏ℤ_z_plus_thm⦎ = (
set_goal([], ⌜∀i j:ℤ⦁ℤ_z(i + j) = ⓩ⌜ℤ_z i⌝ + ⌜ℤ_z j⌝⌝⌝);
a(rewrite_tac[z_ℤ_plus_thm, z_ℤ_def]);
save_pop_thm "ℤ_z_plus_thm"
);
=TEX
=SML
val ⦏ℤ_z_times_thm⦎ = (
set_goal([], ⌜∀i j:ℤ⦁ℤ_z(i * j) = ⓩ⌜ℤ_z i⌝ * ⌜ℤ_z j⌝⌝⌝);
a(rewrite_tac[ℤ_z_eq_eq_z_ℤ_thm, z_ℤ_times_thm, z_ℤ_def]);
save_pop_thm "ℤ_z_times_thm"
);
=TEX
=SML
val ⦏ℤ_z_subtract_thm⦎ = (
set_goal([], ⌜∀i j:ℤ⦁ℤ_z(i - j) = ⓩ⌜ℤ_z i⌝ - ⌜ℤ_z j⌝⌝⌝);
a(rewrite_tac[ℤ_z_eq_eq_z_ℤ_thm, z_ℤ_subtract_thm, z_ℤ_def]);
save_pop_thm "ℤ_z_subtract_thm"
);
=TEX
=SML
val ⦏ℤ_z_minus_thm⦎ = (
set_goal([], ⌜∀ i⦁ ℤ_z(~ i) = ⓩ~⌜ℤ_z i⌝⌝⌝);
a(rewrite_tac[z_ℤ_minus_thm, z_ℤ_def]);
save_pop_thm "ℤ_z_minus_thm"
);
=TEX
=SML
val ⦏ℤ_z_ℕℤ_z_int_thm⦎ = (
set_goal([], ⌜∀m⦁ ℤ_z(ℕℤ m) = (Z'Int m)⌝);
a(rewrite_tac [get_spec⌜Z'Int⌝, ℤ_z_ℕℤ_thm]);
(fn _ => pop_thm()) "ℤ_z_ℕℤ_z_int_thm"
);
=TEX
\section{HOMOMORHPISM CONVERSIONS}
=SML
val rec ⦏z_ℤ_conv⦎ : CONV =  (fn tm =>
	let	val (_, t) = dest_app tm;
		fun aux1 dest thm = (
			dest t;
			(simple_eq_match_conv thm THEN_TRY_C RAND_C z_ℤ_conv) tm
		);
		fun aux2 dest thm = (
			dest t;
			(simple_eq_match_conv thm THEN_TRY_C
			(LEFT_C z_ℤ_conv AND_OR_C RIGHT_C z_ℤ_conv)) tm
		);
	in	aux1 dest_z_minus z_ℤ_minus_thm handle Fail _ =>
		aux1 dest_z_signed_int z_ℤ_z_int_thm handle Fail _ =>
		aux2 dest_z_plus z_ℤ_plus_thm handle Fail _ =>
		aux2 dest_z_times z_ℤ_times_thm handle Fail _ =>
		aux2 dest_z_subtract z_ℤ_subtract_thm handle Fail _ =>
		simple_eq_match_conv z_ℤ_ℤ_z_thm tm
	end	handle Fail _ => term_fail "z_ℤ_conv" 106001 [tm]
);
=TEX
=SML
val rec ⦏ℤ_z_conv⦎ : CONV =  (fn tm =>
	let	val (_, t) = dest_app tm;
		fun aux1 dest thm = (
			dest t;
			(simple_eq_match_conv thm THEN_TRY_C Z_RAND_C ℤ_z_conv) tm
		);
		fun aux2 dest thm = (
			dest t;
			(simple_eq_match_conv thm THEN_TRY_C
			(Z_LEFT_C ℤ_z_conv AND_OR_C Z_RIGHT_C ℤ_z_conv)) tm
		);
	in	aux1 dest_ℤ_minus ℤ_z_minus_thm handle Fail _ =>
		aux1 dest_ℤ_signed_int ℤ_z_ℕℤ_z_int_thm handle Fail _ =>
		aux2 dest_ℤ_plus ℤ_z_plus_thm handle Fail _ =>
		aux2 dest_ℤ_times ℤ_z_times_thm handle Fail _ =>
		aux2 dest_ℤ_subtract ℤ_z_subtract_thm handle Fail _ =>
		simple_eq_match_conv ℤ_z_z_ℤ_thm tm
	end	handle Fail _ => term_fail "ℤ_z_conv" 106002 [tm]
);
=IGN
ℤ_z_conv⌜ℤ_z⌜(a + b:ℤ)⌝⌝;
ℤ_z_conv⌜ℤ_z⌜(a - b:ℤ)⌝⌝;
ℤ_z_conv⌜ℤ_z⌜(a * ℕℤ 1)⌝⌝;
ℤ_z_conv⌜ℤ_z⌜~(a + b:ℤ)⌝⌝;
ℤ_z_conv⌜ℤ_z⌜~(a + ℕℤ 2)*(b - d)+(a + ℕℤ  1)⌝⌝;
ℤ_z_conv⌜ℤ_z⌜~(a + ℕℤ 2)*(z_ℤ b - d)+(a + ℕℤ  1)⌝⌝;
ℤ_z_conv⌜ℤ_z⌜x⦂ℤ⌝⌝;
=TEX
\section{NORMALISATION}
=SML
val ⦏z_ℤ_one_one_thm⦎ = (
set_goal([], ⌜∀i j⦁ z_ℤ i = z_ℤ j ⇔ i = j⌝);
a(REPEAT strip_tac THEN_TRY asm_rewrite_tac[]);
a(LEMMA_T ⌜ℤ_z(z_ℤ i) = ℤ_z(z_ℤ j)⌝ ante_tac THEN1 asm_rewrite_tac[]);
a(rewrite_tac[z_ℤ_def]);
save_pop_thm "z_ℤ_one_one_thm"
);
=TEX
=SML
val ⦏ℤ_z_one_one_thm⦎ = (
set_goal([], ⌜∀i j⦁ ℤ_z i = ℤ_z j ⇔ i = j⌝);
a(REPEAT strip_tac THEN_TRY asm_rewrite_tac[]);
a(LEMMA_T ⌜z_ℤ(ℤ_z i) = z_ℤ(ℤ_z j)⌝ ante_tac THEN1 asm_rewrite_tac[]);
a(rewrite_tac[z_ℤ_def]);
save_pop_thm "ℤ_z_one_one_thm"
);
=SML
val ⦏z_ℤ⦎ = ⌜z_ℤ⌝;
val ⦏z_anf_conv1⦎ = (fn tm =>
	(conv_rule
	(simple_eq_match_conv z_ℤ_eq_eq_ℤ_z_thm)
	((z_ℤ_conv THEN_C ℤ_anf_conv) (mk_app(z_ℤ, tm))))
	handle Fail _ => term_fail "z_anf_conv1" 106010  [tm]
);
val ⦏z_anf_conv⦎:CONV = (fn tm =>
	(z_anf_conv1 THEN_C ℤ_z_conv) tm handle ex => reraise ex "z_anf_conv"
);
=IGN
z_anf_conv1ⓩ1 + 2 + 3⌝;
z_anf_conv1ⓩ(1 + x)*(1 + x)⌝;
z_anf_conv1ⓩ(1 + x)*(1 - x)⌝;
z_anf_convⓩ1 + 2 + 3⌝;
z_anf_convⓩ(1 + x)*(1 + x)⌝;
z_anf_convⓩ(1 + x)*(1 - x)⌝;
=TEX
=SML
val ⦏z_≤_ℤ_≤_thm⦎ = (
set_goal([], ⌜∀i j:ℤ⦁ⓩi ≤ j⌝ ⇔ z_ℤ i ≤ z_ℤ j⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(z_≤_induction_tacⓩj⌝ THEN rewrite_tac[z_ℤ_def, ℤ_≤_clauses]);
a(LEMMA_T ⌜ⓩ⌜z_ℤ i'⌝⌝ ≤ ⓩ⌜z_ℤ i'⌝⌝ + ℕℤ 1⌝ asm_tac THEN1 rewrite_tac[]);
a(all_fc_tac[ℤ_≤_trans_thm]);
(* *** Goal "2" *** *)
a(POP_ASM_T ante_tac THEN rewrite_tac[get_spec⌜$≤⋎Z⌝] THEN strip_tac);
a(LEMMA_T ⌜ℤ_z(z_ℤ i + ℕℤ m) = ℤ_z(z_ℤ j)⌝
		ante_tac THEN1 asm_rewrite_tac[]);
a(rewrite_tac[z_ℤ_def] THEN REPEAT strip_tac THEN all_var_elim_asm_tac1);
a(PC_T1 "z_predicates" rewrite_tac [z_≤_clauses]);
a(POP_ASM_T discard_tac THEN induction_tac ⌜m⌝);
(* *** Goal "2.1" *** *)
a(rewrite_tac[ℤ_z_ℕℤ_thm] THEN rewrite_tac[eq_sym_rule(get_spec⌜Z'Int⌝)]);
a(PC_T1 "z_predicates" rewrite_tac [z_≤_clauses]);
(* *** Goal "2.2" *** *)
a(rewrite_tac[ℕℤ_plus_homomorphism_thm, z_ℤ_def]);
a(LEMMA_T ⓩ⌜ℤ_z (ℕℤ m)⌝ ≤ ⌜ℤ_z (ℕℤ m)⌝ + 1⌝ asm_tac THEN1
	PC_T1 "z_predicates" rewrite_tac [z_≤_clauses]);
a(PC_T1 "z_predicates" all_fc_tac[z_≤_trans_thm]);
save_pop_thm "z_≤_ℤ_≤_thm"
);
=TEX
=SML
val ⦏z_less_ℤ_less_thm⦎ = (
set_goal([], ⌜∀i j:ℤ⦁ⓩi < j⌝ ⇔ z_ℤ i < z_ℤ j⌝);
a(once_rewrite_tac[taut_rule⌜∀p q⦁(p ⇔ q) ⇔ (¬p ⇔ ¬q)⌝]);
a(PC_T1 "z_predicates" rewrite_tac
	[z_¬_less_thm, ℤ_¬_less_thm, z_≤_ℤ_≤_thm]);
save_pop_thm "z_less_ℤ_less_thm"
);
=TEX
=SML
val ⦏z_eq_≤_≤_thm⦎ = (
set_goal([], ⌜∀i j:ℤ⦁ i = j ⇔ ⓩi ≤ j ∧ j ≤ i⌝⌝);
a(REPEAT strip_tac THEN_TRY
	MERGE_PCS_T1 ["'z_numbers", "z_predicates"] asm_rewrite_tac[]);
a(PC_T1 "z_predicates" all_fc_tac[z_≤_antisym_thm]);
(fn _ => pop_thm()) "z_eq_≤_≤_thm"
);
=TEX
=SML
val ⦏z_eq_ℤ_conv⦎ = simple_eq_match_conv z_eq_≤_≤_thm;
=IGN
z_eq_ℤ_conv ⓩx⦂ℤ = y⌝;
z_eq_ℤ_conv ⓩx = 1⌝;
z_eq_ℤ_conv ⓩx + y = 1⌝;
z_eq_ℤ_conv ⓩx + y = z⌝;
z_eq_ℤ_conv ⓩy = x + z⌝;

z_eq_ℤ_conv ⓩx = 1⌝;
z_eq_ℤ_conv ⓩx - 1 = y +1⌝;
=TEX
=SML
val ⦏z_≤_ℤ_conv⦎ : CONV = (fn tm =>
	let	val (t1, t2) = dest_z_≤ tm;
	in	 simple_eq_match_conv z_≤_ℤ_≤_thm THEN_C RANDS_C (TRY_C z_ℤ_conv)
	end	tm
);
=IGN
z_≤_ℤ_conv ⓩx + y ≤ 1⌝;
z_≤_ℤ_conv ⓩx ≤ 1⌝;
z_≤_ℤ_conv ⓩx ≤ y⌝;
z_≤_ℤ_conv ⓩx + 1 ≤ y + 1⌝;
z_≤_ℤ_conv ⓩx - 1 ≤ y + 1⌝;
=TEX
=SML
val ⦏z_less_ℤ_conv⦎ : CONV = (fn tm =>
	let	val (t1, t2) = dest_z_less tm;
	in	simple_eq_match_conv z_less_ℤ_less_thm THEN_C RANDS_C (TRY_C z_ℤ_conv)
	end	tm
);
=TEX
\section{THE PROOF CONTEXT}
=IGN
z_less_ℤ_conv ⓩx + y < 1⌝;
z_less_ℤ_conv ⓩx < 1⌝;
z_less_ℤ_conv ⓩx < y⌝;
z_less_ℤ_conv ⓩx + 1 < y + 1⌝;
z_less_ℤ_conv ⓩx - 1 < y + 1⌝;
=SML
val ⦏strip_cxt⦎ = [
	(ⓩ(x⦂ℤ) = y⌝, z_eq_ℤ_conv),
	(ⓩ(x⦂ℤ) ≤ y⌝, z_≤_ℤ_conv),
	(ⓩ(x⦂ℤ) < y⌝, z_less_ℤ_conv),
	(ⓩx ∈ ℕ⌝, z_∈_ℕ_conv),

	(ⓩ¬(x⦂ℤ) = y⌝, RAND_C z_eq_ℤ_conv),
	(ⓩ¬(x⦂ℤ) ≤ y⌝, RAND_C z_≤_ℤ_conv),
	(ⓩ¬(x⦂ℤ) < y⌝, RAND_C z_less_ℤ_conv),
	(ⓩ¬x ∈ ℕ⌝, RAND_C z_∈_ℕ_conv)
];
=TEX
=SML
val ⦏z_lin_arith_prove_tac⦎ : THM list -> TACTIC = (fn thl => fn gl =>
	((	MAP_EVERY ante_tac thl
	THEN	all_asm_ante_tac
	THEN	contr_tac
	THEN	all_asm_ante_tac
	THEN	PC_T "ℤ_lin_arith" contr_tac THEN ℤ_lin_arith_tac) gl)
	handle	Fail msg => fail "z_lin_arith_prove_tac" 82200
			[(fn () =>get_message msg),
			 (fn () => string_of_term (snd gl))]
);
=TEX
and the associated conversion:
=SML
val ⦏z_lin_arith_prove_conv⦎ : THM list -> CONV = (fn thl => fn tm =>
	let	val th = tac_proof(([], tm), z_lin_arith_prove_tac thl);
	in	⇔_t_intro  th
	end	handle ex => reraise ex "z_lin_arith_prove_conv"
);
=TEX
=SML
val _ = delete_pc "'z_lin_arith" handle Fail _ => ();
val _ = new_pc ⦏"'z_lin_arith"⦎;
val _ = set_rw_eqn_cxt strip_cxt "'z_lin_arith";
val _ = set_st_eqn_cxt strip_cxt "'z_lin_arith";
val _ = set_sc_eqn_cxt strip_cxt "'z_lin_arith";
val _ = merge_pcs ["'z_numbers"] "'z_lin_arith";
val _ = set_pr_tac z_lin_arith_prove_tac "'z_lin_arith";
val _ = set_pr_conv z_lin_arith_prove_conv "'z_lin_arith";
val _ = commit_pc "'z_lin_arith";
=TEX
=SML
val _ = delete_pc "z_lin_arith" handle Fail _ => ();
val _ = new_pc ⦏"z_lin_arith"⦎;
val _ = merge_pcs ["z_predicates", "'z_lin_arith"] "z_lin_arith";
val _ = commit_pc "z_lin_arith";
=TEX
=SML
val _ = delete_pc "'z_lin_arith1" handle Fail _ => ();
val _ = new_pc ⦏"'z_lin_arith1"⦎;
val _ = set_rw_eqn_cxt strip_cxt "'z_lin_arith1";
val _ = set_st_eqn_cxt strip_cxt "'z_lin_arith1";
val _ = set_sc_eqn_cxt strip_cxt "'z_lin_arith1";
val _ = merge_pcs ["'z_numbers1"] "'z_lin_arith1";
val _ = set_pr_tac z_lin_arith_prove_tac "'z_lin_arith1";
val _ = set_pr_conv z_lin_arith_prove_conv "'z_lin_arith1";
val _ = commit_pc "'z_lin_arith1";
=TEX
=SML
val _ = delete_pc "z_lin_arith1" handle Fail _ => ();
val _ = new_pc ⦏"z_lin_arith1"⦎;
val _ = merge_pcs ["z_predicates", "'z_lin_arith1"] "z_lin_arith1";
val _ = commit_pc "z_lin_arith1";
=TEX
\section{EPILOGUE}
=TEX
=SML
end (* of structure ZArithmeticTools *);
open ZArithmeticTools;
=TEX
=IGN
PC_C1 "'z_lin_arith" rewrite_conv[]ⓩ1 + 2 = 2 + 1⌝;
pc_rule1 "z_lin_arith" prove_rule[]ⓩx < y ∧ y < z ⇒ x < z⌝;
pc_rule1 "z_lin_arith" prove_rule[]ⓩ¬(1 ≤ x ∧ x + y = z ∧ y = z)⌝;
pc_rule1 "z_lin_arith" prove_rule[]ⓩx + y ≤ y ⇒ x ≤ 0⌝;
pc_rule1 "z_lin_arith" prove_rule[]ⓩ¬(∃x, y:ℤ⦁x > 0 ∧ x + a + b + y < b + y + a)⌝;

=TEX
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}
=IGN
open_theory"z_library";
new_theory"temp";
new_parent"z_arithmetic_tools";
val eg_thm1 = (
set_goal([], ⓩ∀b:ℕ⦁(b + 1)*(b + 1) > 0⌝);
a(PC_T1 "z_library" REPEAT strip_tac);
a( z_≤_induction_tacⓩb⌝ THEN PC_T1 "z_lin_arith" asm_prove_tac[]);
pop_thm()
);
val eg_thm2 = (
set_goal([], ⓩ∀a, b, c:ℤ⦁a ≤ b ∧ (a + b < c + a) ⇒ a < c⌝);
a(PC_T1 "z_lin_arith" prove_tac[]);
pop_thm()
);
val eg_thm2 = (
set_goal([], ⓩ∀a, b, c:ℤ⦁a ≥ b ∧ ¬ b < c ⇒ a ≥ c⌝);
a(PC_T1 "z_lin_arith" prove_tac[]);
pop_thm()
);
val eg_thm2 = (
set_goal([], ⓩ∀a, b, c:ℤ⦁a + 2*b < 2*a ⇒ b + b < a⌝);
a(PC_T1 "z_lin_arith" prove_tac[]);
pop_thm()
);
val eg_thm3 = (
set_goal([], ⓩ∀ x, y:ℤ⦁ ¬ (2*x + y = 4 ∧ 4*x + 2*y = 7)⌝);
a(PC_T1 "z_lin_arith" prove_tac[]);
pop_thm()
);
val eg_thm4 = (
set_goal([], ⓩ∀m:ℤ⦁ {i:ℤ | m ≤ i ∧ i < m+3} = {m, m+1, m+2}⌝);
a(MERGE_PCS_T1["z_sets_ext", "'z_lin_arith"]prove_tac[]);
pop_thm()
);
val eg_thm5 = (
set_goal([], ⓩ{i, j : ℤ | 30*i = 105*j} = {i, j : ℤ | 2*i = 7*j}⌝);
a(MERGE_PCS_T1["z_sets_ext", "'z_lin_arith"]prove_tac[]);
pop_thm()
);
val eg_thm6 = (
set_goal([], ⓩ{i : ℤ | 5*i = 6*i} = {0}⌝);
a(MERGE_PCS_T1["z_sets_ext", "'z_lin_arith"]prove_tac[]);
pop_thm()
);
[eg_thm1, eg_thm2, eg_thm3, eg_thm4, eg_thm5, eg_thm6];


=IGN
********************************************************************************
imp073.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  $Id: imp073.doc,v 1.12 2005/12/16 16:52:52 rda Exp rda $ ℤ
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

\def\Title{Implementation for the Theory of Finite Sets}

\def\AbstractText{This document creates the theory of finite sets.}

\def\Reference{DS/FMU/IED/IMP072}

\def\Author{R.B.Jones}


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
%% LaTeX2e port: \TPPtitle{Implementation for the Theory of Finite Sets}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Implementation for the Theory \cr
%% LaTeX2e port: of Functional Relations}
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP072}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.12 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2005/12/16 16:52:52 $ %
%% LaTeX2e port: }}  %% Mandatory field
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{R.B.Jones & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document creates the theory of finite sets.}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	    Project Library
%% LaTeX2e port: }}
%% LaTeX2e port: %\TPPclass{CLASSIFICATION}
%% LaTeX2e port: %\def\TPPheadlhs{}
%% LaTeX2e port: %\def\TPPheadcentre{}
%% LaTeX2e port: %def\TPPheadrhs{}
%% LaTeX2e port: %\def\TPPfootlhs{}
%% LaTeX2e port: %\def\TPPfootcentre{}
%% LaTeX2e port: %\def\TPPfootrhs{}
%% LaTeX2e port: \begin{document}
%% LaTeX2e port: \makeTPPfrontpage
%% LaTeX2e port: \vfill
%% LaTeX2e port: \begin{centering}
%% LaTeX2e port: 
%% LaTeX2e port: \bf Copyright \copyright\ : Lemma 1 Ltd. \number\year
%% LaTeX2e port: 
%% LaTeX2e port: \end{centering}

\begin{document}

\headsep=0mm
\FrontPage
\headsep=10mm

\setcounter{section}{-1}
\pagebreak
\section{DOCUMENT CONTROL}
\subsection{Contents List}
\tableofcontents
\subsection{Document Cross References}
\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes History}
\begin{description}
\item[Issues 1.1 (1992/05/11)--1.5 (1992/06/17)]
First drafts.
\item[Issue 1.6 (2000/06/30)]
Proved consistency of {\it Max} and {\it Min}.

This is the first draft of the document.

\item[Issue 1.7 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.8 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.9 (2003/09/30)] Added finite set induction (theorem and tactic) and some basic theorems about finiteness.
\item[Issue 1.10 (2004/01/16)] Added theorems on sizes of finite sets.
\item[Issue 1.11 (2004/11/02)] Fixed bug in use of assumptions by finite set induction tactic.
\item[Issues 1.12 (2005/12/16)] Added in more theorems from the maths case studies.
\item[Issue 1.13 (2006/12/10)] Removed dead code.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}

\section{GENERAL}
\subsection{Scope}
This document contains an implementation of the theory of finite sets similar to that presented in section 4.4. of \cite{spivey88}.
The design is in \cite{DS/FMU/IED/DTD073}.

\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains an implementation of the theory of finite sets.
\subsubsection{Dependencies}
This document takes its signature from \cite{DS/FMU/IED/DTD073}.
\subsubsection{Deficiencies}
None known.
\subsubsection{Possible Enhancements}
None known.
\section{THE THEORY ``finset''}
=SML
structure ⦏FinSetTheory⦎ : FinSetTheory = struct
val _ = open_theory "fin_set";
val ⦏ℕ_def⦎ = get_defn"-""ℕ";
val ⦏finite_def⦎ = get_defn"-""Finite";
val ⦏𝔽_def⦎ = get_defn"-""𝔽";
val ⦏𝔽⋎1_def⦎ = get_defn"-""𝔽⋎1";
val ⦏min_def⦎ = get_defn"-""Min";
val ⦏max_def⦎ = get_defn"-""Max";
val ⦏size_def⦎ = get_defn"-""Size";
val ⦏iter_def⦎ = get_defn"-""Iter";
val ⦏⇻_def⦎ = get_defn"-""⇻";
val ⦏⤕_def⦎ = get_defn"-""⤕";
=TEX
See \cite{spivey89} section 4.4.
\subsection{Theorems and Tactics}
%%%%
%%%%

=SML
val _ = (
	push_consistency_goal⌜Min⌝;
	a prove_∃_tac;
	a(REPEAT strip_tac);
	a(cases_tac⌜a' = {}⌝ THEN1 asm_rewrite_tac[]);
	a(POP_ASM_T (PC_T1 "hol2" strip_asm_tac));
	a(POP_ASM_T ante_tac THEN cov_induction_tac ⌜x⌝);
	a(cases_tac⌜∃y⦁y < x ∧ y ∈ a'⌝);
	(* *** Goal "1" *** *)
	a(all_asm_fc_tac[]);
	a(REPEAT strip_tac THEN ∃_tac⌜Min''⌝ THEN REPEAT strip_tac);
	a(all_asm_fc_tac[]);
	(* *** Goal "2" *** *)
	a(REPEAT strip_tac THEN ∃_tac⌜x⌝ THEN REPEAT strip_tac);
	a(all_asm_fc_tac[]);
	a(PC_T1"lin_arith" asm_prove_tac[]);
	save_consistency_thm⌜Min⌝(pop_thm());
	()
);
=TEX
%%%%
%%%%

=SML
val _ = (
	push_consistency_goal⌜Max⌝;
	a prove_∃_tac;
	a(REPEAT strip_tac);
	a(cases_tac⌜∃y⦁∀j⦁j ∈ a' ⇒ j ≤ y⌝ THEN_TRY asm_rewrite_tac[]);
	a(POP_ASM_T ante_tac THEN cov_induction_tac⌜y⌝ THEN REPEAT strip_tac);
	a(cases_tac⌜∃z⦁z < y ∧ (∀ j⦁ j ∈ a' ⇒ j ≤ z)⌝);
	(* *** Goal "1" *** *)
	a(all_asm_fc_tac[]);
	a(REPEAT strip_tac THEN ∃_tac⌜Max''⌝ THEN REPEAT strip_tac);
	a(all_asm_fc_tac[]);
	(* *** Goal "2" *** *)
	a(∃_tac⌜y⌝ THEN REPEAT strip_tac);
	a(all_asm_fc_tac[]);
	a(PC_T1"lin_arith" asm_prove_tac[]);
	save_consistency_thm⌜Max⌝(pop_thm());
	()
);
=TEX
%%%%
%%%%

=SML
val ⦏finite_induction_thm⦎ = save_thm("finite_induction_thm", (
push_goal([], ⌜
		∀p⦁	p {} ∧ (∀a x⦁a ∈ Finite ∧ p a ∧ ¬x ∈ a ⇒ p({x} ∪ a))
		⇒ 	∀a⦁a ∈ Finite ⇒ p a
⌝);
a(REPEAT strip_tac);
a(asm_ante_tac⌜a ∈ Finite⌝);
a(rewrite_tac[get_spec⌜Finite⌝]);
a(REPEAT strip_tac);
a(spec_nth_asm_tac 1 ⌜{b | b ∈ Finite ∧ p b}⌝);
(* *** Goal "1" *** *)
a(swap_asm_concl_tac ⌜¬ {} ∈ Finite⌝);
a(rewrite_tac[get_spec⌜Finite⌝]);
a(PC_T "hol1" (REPEAT strip_tac));
(* *** Goal "2" *** *)
a(swap_asm_concl_tac ⌜a' ∈ Finite⌝);
a(asm_ante_tac ⌜¬ {x} ∪ a' ∈ Finite⌝);
a(rewrite_tac[get_spec⌜Finite⌝]);
a(PC_T "hol1" (contr_tac));
a(spec_nth_asm_tac 1 ⌜s⌝);
(* *** Goal "2.1" *** *)
a(list_spec_nth_asm_tac 5 [⌜a''⌝, ⌜x'⌝]);
(* *** Goal "2.2" *** *)
a(list_spec_nth_asm_tac 4 [⌜a'⌝, ⌜x⌝]);
(* *** Goal "3" *** *)
a(swap_asm_concl_tac ⌜¬ p ({x} ∪ a')⌝);
a(cases_tac⌜x ∈ a'⌝);
(* *** Goal "3.1" *** *)
a(LEMMA_T⌜{x} ∪ a' = a'⌝ asm_rewrite_thm_tac);
a(PC_T "hol1" (REPEAT strip_tac));
a(asm_rewrite_tac[]);
(* *** Goal "3.2" *** *)
a(list_spec_nth_asm_tac 6 [⌜a'⌝, ⌜x⌝]);
pop_thm()
));
=TEX
%%%%
%%%%

=SML
local
val ⦏a_∈_finite⦎ = ⌜a ∈ Finite⌝;
val ⦏f_i_tac⦎ = gen_induction_tac1 finite_induction_thm;
in
fun ⦏finite_induction_tac⦎ (tm : TERM) : TACTIC = (
	if not (is_var tm)
	then term_fail "finite_induction_tac" 73001 [tm]
	else ( fn(asms, conc) =>
	let	val asm = find asms
			(fn t => ((term_match t a_∈_finite; true) handle Fail _ => false)
				andalso hd(snd(strip_app t)) ~=$ tm)
			handle Fail _ => fail "finite_induction_tac" 73002 [];
	in	if not (is_free_in tm conc)
			then term_fail "finite_induction_tac" 73003 [tm]
		else if any (asms drop (fn t => t =$ asm)) (is_free_in tm)
			then term_fail "finite_induction_tac" 73004 [tm]
		else	(asm_ante_tac asm THEN f_i_tac) (asms, conc)
	end
	)
);
end;
=TEX
%%%%
%%%%

=SML
val ⦏empty_finite_thm⦎ = save_thm("empty_finite_thm", (
push_goal([], ⌜{} ∈ Finite⌝);
a(rewrite_tac[get_spec⌜Finite⌝]);
a(PC_T "hol1" (REPEAT strip_tac));
pop_thm()
));
=TEX
%%%%
%%%%

=SML
val ⦏singleton_∪_finite_thm⦎ = save_thm("singleton_∪_finite_thm", (
push_goal([], ⌜∀ a x⦁ a ∈ Finite ⇒ ({x} ∪ a) ∈ Finite⌝);
a(rewrite_tac[get_spec⌜Finite⌝] THEN (PC_T "hol1" (REPEAT strip_tac)));
a(spec_nth_asm_tac 3 ⌜s⌝);
(* *** Goal "1" *** *)
a(list_spec_nth_asm_tac 3 [⌜a'⌝, ⌜x'⌝]);
(* *** Goal "2" *** *)
a(list_spec_nth_asm_tac 2 [⌜a⌝, ⌜x⌝]);
pop_thm()
));
=TEX
%%%%
%%%%

=SML
val ⦏⊆_finite_thm⦎ = save_thm("⊆_finite_thm", (
push_goal([], ⌜∀a b⦁ a ∈ Finite ∧ b ⊆ a
	⇒		b ∈ Finite⌝);
a(REPEAT strip_tac);
a(POP_ASM_T ante_tac THEN intro_∀_tac(⌜b⌝, ⌜b⌝));
a(finite_induction_tac ⌜a⌝ THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a((lemma_tac⌜b = {}⌝ THEN1 PC_T1 "sets_ext" asm_prove_tac[]) THEN all_var_elim_asm_tac1);
a(rewrite_tac[empty_finite_thm]);
(* *** Goal "2" *** *)
a(cases_tac⌜b ⊆ a⌝ THEN1 all_asm_fc_tac[]);
a(lemma_tac⌜b = {x} ∪ (b \ {x})⌝ THEN1
	(PC_T1 "sets_ext" asm_prove_tac[] THEN asm_fc_tac[] THEN all_var_elim_asm_tac));
a(POP_ASM_T once_rewrite_thm_tac THEN bc_thm_tac singleton_∪_finite_thm);
a(GET_NTH_ASM_T 4 bc_thm_tac);
a(PC_T1 "sets_ext" asm_prove_tac[]);
pop_thm()
));
=TEX
%%%%
%%%%

=SML
val ⦏∪_finite_thm⦎ = save_thm ("∪_finite_thm", (
set_goal([], ⌜∀a b⦁
	 (a ∪ b) ∈ Finite ⇔ a ∈ Finite ∧ b ∈ Finite
⌝);
a(rename_tac[(⌜a:'a SET⌝, "A"),
	(⌜b : 'a SET⌝, "B")] THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(lemma_tac ⌜A ⊆ A ∪ B⌝ THEN1 PC_T1 "sets_ext1" asm_prove_tac[]);
a(all_fc_tac[⊆_finite_thm]);
(* *** Goal "2" *** *)
a(lemma_tac ⌜B ⊆ A ∪ B⌝ THEN1 PC_T1 "sets_ext1" asm_prove_tac[]);
a(all_fc_tac[⊆_finite_thm]);
(* *** Goal "3" *** *)
a(POP_ASM_T ante_tac THEN intro_∀_tac(⌜B⌝, ⌜B⌝));
a(finite_induction_tac ⌜A⌝ THEN1 asm_rewrite_tac[]);
a(REPEAT strip_tac);
a(LEMMA_T⌜({x} ∪ A) ∪ B = {x} ∪ A ∪ B⌝
	rewrite_thm_tac
	THEN1 PC_T1 "sets_ext1" asm_prove_tac[]);
a(bc_thm_tac singleton_∪_finite_thm THEN REPEAT strip_tac);
a(all_asm_fc_tac[]);
pop_thm()
));
=TEX
%%%%
%%%%

=SML
val ⦏∩_finite_thm⦎  = save_thm ("∩_finite_thm",  (
set_goal([], ⌜∀a b ⦁ a ∈ Finite ∨ b ∈ Finite ⇒ a ∩ b ∈ Finite⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(bc_thm_tac ⊆_finite_thm THEN ∃_tac⌜a⌝ THEN REPEAT strip_tac);
a(PC_T1 "sets_ext1" prove_tac[]);
(* *** Goal "2" *** *)
a(bc_thm_tac ⊆_finite_thm THEN ∃_tac⌜b⌝ THEN REPEAT strip_tac);
a(PC_T1 "sets_ext1" prove_tac[]);
pop_thm()
));
=TEX
%%%%
%%%%

=SML
val ⦏finite_distinct_elems_thm⦎  = save_thm ("finite_distinct_elems_thm",  (
set_goal([], ⌜∀a⦁a ∈ Finite ⇒ ∃list⦁list ∈ Distinct ∧ Elems list = a⌝);
a(REPEAT strip_tac);
a(finite_induction_tac ⌜a⌝ THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(∃_tac⌜[]⌝ THEN asm_rewrite_tac[elems_def, distinct_def] THEN PC_T1 "sets_ext1" prove_tac[]);
(* *** Goal "2" *** *)
a(∃_tac⌜Cons x list⌝ THEN all_var_elim_asm_tac1 THEN asm_rewrite_tac[elems_def, distinct_def]);
pop_thm()
));
=TEX
%%%%
%%%%
=SML
val ⦏length_↾_≤_thm⦎  = save_thm ("length_↾_≤_thm",  (
set_goal([], ⌜∀list a⦁Length( list ↾ a) ≤ Length list⌝);
a(REPEAT strip_tac);
a(list_induction_tac ⌜list⌝ THEN rewrite_tac[length_def, ↾_def]);
a(REPEAT strip_tac THEN cases_tac⌜x ∈ a⌝ THEN asm_rewrite_tac[length_def]);
a(PC_T1 "lin_arith" asm_prove_tac[]);
pop_thm()
));
=TEX
%%%%
%%%%
=SML
val ⦏length_↾_less_thm⦎  = save_thm ("length_↾_less_thm",  (
set_goal([], ⌜∀list a⦁¬Elems list \ a = {} ⇒ #(list ↾ a) < # list⌝);
a(∀_tac);
a(lemma_tac⌜∃n ⦁n = #list⌝ THEN1 prove_∃_tac);
a(POP_ASM_T ante_tac THEN   intro_∀_tac(⌜list⌝, ⌜list⌝));
a(induction_tac ⌜n⌝);
(* *** Goal "1" *** *)
a(strip_tac);
a(strip_asm_tac(∀_elim⌜list⌝ list_cases_thm) THEN all_var_elim_asm_tac1
	THEN rewrite_tac[length_def, elems_def]);
(* *** Goal "2" *** *)
a(strip_tac);
a(strip_asm_tac(∀_elim⌜list⌝ list_cases_thm) THEN all_var_elim_asm_tac1
	THEN rewrite_tac[length_def]);
a(REPEAT strip_tac);
a(POP_ASM_T ante_tac THEN rewrite_tac[elems_def]
	THEN PC_T1 "sets_ext1"  REPEAT strip_tac);
(* *** Goal "2.1" *** *)
a(all_var_elim_asm_tac1 THEN asm_rewrite_tac[length_def, ↾_def]);
a(LEMMA_T ⌜#(list2 ↾ a) ≤ #list2⌝ ante_tac THEN1 rewrite_tac[length_↾_≤_thm]);
a(PC_T1 "lin_arith" prove_tac[]);
(* *** Goal "2.2" *** *)
a(cases_tac⌜x ∈ a⌝ THEN asm_rewrite_tac[length_def, ↾_def]);
(* *** Goal "2.2.1" *** *)
a(lemma_tac⌜¬Elems list2 \ a = {}⌝ THEN1 PC_T1 "sets_ext1" asm_prove_tac[]);
a(all_asm_fc_tac[]);
(* *** Goal "2.2.2" *** *)
a(lemma_tac⌜¬Elems list2 \ a = {}⌝ THEN1 PC_T1 "sets_ext1" asm_prove_tac[]);
a(all_asm_fc_tac[]);
a(PC_T1 "lin_arith" asm_prove_tac[]);
pop_thm()
));
=TEX
%%%%
%%%%
=SML
val ⦏elems_↾_thm⦎  = save_thm ("elems_↾_thm",  (
set_goal([], ⌜∀list a⦁Elems( list ↾ a) = Elems list ∩ a⌝);
a(REPEAT strip_tac);
a(list_induction_tac ⌜list⌝ THEN rewrite_tac[elems_def, ↾_def]);
a(REPEAT strip_tac THEN cases_tac⌜x ∈ a⌝ THEN asm_rewrite_tac[elems_def]
	THEN PC_T1 "sets_ext1" asm_prove_tac[]);
pop_thm()
));
=TEX
=TEX
%%%%
%%%%

=SML
val ⦏distinct_length_≤_thm⦎  = save_thm ("distinct_length_≤_thm",  (
set_goal([], ⌜∀list1 list2 ⦁list1 ∈ Distinct ∧ Elems list1 = Elems list2 ⇒ #list1 ≤ #list2⌝);
a(REPEAT ∀_tac);
a(lemma_tac⌜∃n ⦁n = #list1⌝ THEN1 prove_∃_tac);
a(POP_ASM_T ante_tac THEN
	rewrite_tac[taut_rule⌜∀p1 p2 p3 ⦁(p1 ⇒ p2 ⇒ p3) ⇔ (p1 ∧ p2 ⇒ p3)⌝]);
a( intro_∀_tac(⌜list2⌝, ⌜list2⌝) THEN   intro_∀_tac(⌜list1⌝, ⌜list1⌝));
a(induction_tac ⌜n⌝);
(* *** Goal "1" *** *)
a(strip_tac);
a(strip_asm_tac(∀_elim⌜list1⌝ list_cases_thm) THEN all_var_elim_asm_tac1
	THEN rewrite_tac[length_def, elems_def]);
(* *** Goal "2" *** *)
a(REPEAT ∀_tac);
a(strip_asm_tac(∀_elim⌜list1⌝ list_cases_thm) THEN all_var_elim_asm_tac1
	THEN rewrite_tac[length_def, elems_def, distinct_def]);
a(REPEAT strip_tac);
a(lemma_tac⌜Elems list2' = Elems(list2 ↾ ~ {x})⌝);
(* *** Goal "2.1" *** *)
a(rewrite_tac[elems_↾_thm] THEN POP_ASM_T ante_tac);
a(PC_T1 "sets_ext1" rewrite_tac[complement_def]);
a(prove_tac[]);
a(contr_tac THEN all_var_elim_asm_tac);
(* *** Goal "2.2" *** *)
a(lemma_tac⌜# list2' ≤ #(list2 ↾ ~ {x})⌝ THEN1
	DROP_NTH_ASM_T 6 bc_thm_tac THEN REPEAT strip_tac);
a(POP_ASM_T ante_tac THEN LEMMA_T ⌜#(list2 ↾ ~{x}) < #list2⌝ ante_tac THEN_LIST
	[bc_thm_tac length_↾_less_thm, PC_T1 "lin_arith" prove_tac[]]);
a(PC_T1 "sets_ext1" rewrite_tac[complement_def]);
a(REPEAT strip_tac THEN rewrite_tac[]);
a(∃_tac⌜x⌝ THEN1 DROP_NTH_ASM_T 2 (rewrite_thm_tac o eq_sym_rule));
a(PC_T1 "sets_ext1" prove_tac[]);
pop_thm()
));
=TEX
%%%%
%%%%

=SML
val ⦏distinct_size_length_thm⦎  = save_thm ("distinct_size_length_thm",  (
set_goal([], ⌜∀list a ⦁list ∈ Distinct ∧ Elems list = a ⇒ #a = #list⌝);
a(REPEAT strip_tac);
a(rewrite_tac[size_def]);
a(bc_thm_tac (get_spec ⌜Min⌝) THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(∃_tac⌜list⌝ THEN REPEAT strip_tac);
(* *** Goal "2" *** *)
a(all_var_elim_asm_tac1);
a(bc_thm_tac distinct_length_≤_thm);
a(asm_rewrite_tac[]);
pop_thm()
));
=TEX
%%%%
%%%%

=SML
val ⦏size_empty_thm⦎  = save_thm ("size_empty_thm",  (
set_goal([], ⌜#{} = 0⌝);
a(rewrite_tac[size_def]);
a(bc_thm_tac (get_spec ⌜Min⌝) THEN REPEAT strip_tac);
a(∃_tac⌜[]⌝ THEN rewrite_tac[elems_def, length_def]);
pop_thm()
));
=TEX
%%%%
%%%%

=SML
val ⦏size_singleton_∪_thm⦎  = save_thm ("size_singleton_∪_thm",  (
set_goal([], ⌜∀x a ⦁ a ∈ Finite ∧ ¬x ∈ a ⇒ #({x} ∪ a) = #a + 1⌝);
a(REPEAT strip_tac THEN all_fc_tac [finite_distinct_elems_thm]);
a(ALL_FC_T rewrite_tac[distinct_size_length_thm]);
a(lemma_tac⌜Cons x list ∈ Distinct⌝ THEN1
	(all_var_elim_asm_tac1 THEN asm_rewrite_tac[distinct_def]));
a(lemma_tac⌜Elems(Cons x list) = {x} ∪ a⌝ THEN1 asm_rewrite_tac[elems_def]);
a(ALL_FC_T rewrite_tac[distinct_size_length_thm]);
a(rewrite_tac[length_def]);
pop_thm()
));
=TEX
%%%%
%%%%

=SML
val ⦏size_singleton_thm⦎  = save_thm ("size_singleton_thm",  (
set_goal([], ⌜∀x ⦁ #{x} = 1⌝);
a(REPEAT strip_tac);
a(LEMMA_T ⌜#{x} = #[x]⌝ rewrite_thm_tac  THEN_LIST
	[id_tac, rewrite_tac[length_def]]);
a(bc_thm_tac distinct_size_length_thm);
a(rewrite_tac[elems_def, distinct_def]);
pop_thm()
));
=TEX
%%%%
%%%%

=SML
val ⦏size_∪_thm⦎  = save_thm ("size_∪_thm",  (
set_goal([], ⌜∀a b ⦁ a ∈ Finite ∧ b ∈ Finite ⇒ #(a ∪ b) + #(a ∩ b) = #a + #b⌝);
a(REPEAT strip_tac);
a(finite_induction_tac⌜a⌝ THEN1 rewrite_tac[size_empty_thm]);
a(lemma_tac⌜a ∪ b ∈ Finite⌝ THEN1 asm_rewrite_tac[∪_finite_thm]);
a(cases_tac⌜¬x ∈ b⌝);
(* *** Goal "1" *** *)
a(LEMMA_T ⌜¬x ∈ a ∪ b⌝ asm_tac THEN1 PC_T1 "sets_ext1" asm_prove_tac[]);
a(rewrite_tac[pc_rule1 "sets_ext1" prove_rule[]⌜∀A B C⦁(A ∪ B) ∪ C = A ∪ B ∪ C⌝]);
a(ALL_FC_T rewrite_tac[size_singleton_∪_thm]);
a(rewrite_tac[pc_rule1"lin_arith" prove_rule[]⌜∀i j⦁(i + 1) + j = 1 + i + j⌝]);
a(LEMMA_T⌜({x} ∪ a) ∩ b = a ∩ b⌝ asm_rewrite_thm_tac);
a(POP_ASM_T ante_tac THEN PC_T1 "sets_ext1" prove_tac[]);
(* *** Goal "2" *** *)
a(LEMMA_T⌜({x} ∪ a) ∪ b = a ∪ b ∧ ({x} ∪ a) ∩ b = {x} ∪ a ∩ b⌝ asm_rewrite_thm_tac
	THEN1 PC_T1 "sets_ext1" asm_prove_tac[]);
a(lemma_tac⌜a ∩ b ∈ Finite⌝ THEN1 ALL_FC_T rewrite_tac[∩_finite_thm]);
a(LEMMA_T ⌜¬x ∈ a ∩ b⌝ asm_tac THEN1 PC_T1 "sets_ext1" asm_prove_tac[]);
a(ALL_FC_T rewrite_tac[size_singleton_∪_thm]);
a(rewrite_tac[pc_rule1"lin_arith" prove_rule[]⌜∀i j⦁(i + 1) + j = 1 + i + j ∧ i + j + 1 = 1 + i + j⌝]);
a(REPEAT strip_tac);
pop_thm()
));
=TEX
%%%%
%%%%

=SML
val ⦏size_0_thm⦎  = save_thm ("size_0_thm",  (
set_goal([], ⌜∀a ⦁ a ∈ Finite ⇒ (#a = 0 ⇔ a = {})⌝);
a(REPEAT strip_tac THEN_TRY (all_var_elim_asm_tac THEN rewrite_tac[size_empty_thm]));
a(POP_ASM_T ante_tac THEN finite_induction_tac ⌜a⌝ THEN
	ALL_FC_T rewrite_tac[size_singleton_∪_thm]);
pop_thm()
));
=TEX
%%%%
%%%%

=SML
val ⦏size_1_thm⦎  = save_thm ("size_1_thm",  (
set_goal([], ⌜∀a ⦁ a ∈ Finite ⇒ (#a = 1 ⇔ ∃x⦁a = {x})⌝);
a(REPEAT strip_tac THEN_TRY (all_var_elim_asm_tac1 THEN rewrite_tac[size_singleton_thm]));
a(POP_ASM_T ante_tac THEN finite_induction_tac ⌜a⌝);
(* *** Goal "1" *** *)
a(rewrite_tac[size_empty_thm]);
(* *** Goal "2" *** *)
a(ALL_FC_T rewrite_tac[size_singleton_∪_thm]);
a(ALL_FC_T1 fc_⇔_canon  rewrite_tac[size_0_thm] THEN REPEAT strip_tac THEN all_var_elim_asm_tac1);
a(∃_tac⌜x⌝ THEN rewrite_tac[]);
(* *** Goal "3" *** *)
a(ALL_FC_T rewrite_tac[size_singleton_∪_thm]);
a(asm_rewrite_tac[size_singleton_thm]);
pop_thm()
));
=TEX
%%%%
%%%%

=SML
val ⦏⋃_finite_thm⦎  = save_thm ("⋃_finite_thm",  (
set_goal([], ⌜∀u ⦁
	u ∈ Finite
∧	u ⊆ Finite
⇒	⋃u ∈ Finite⌝);
a(REPEAT strip_tac THEN POP_ASM_T (ante_tac o pc_rule1"sets_ext1" rewrite_rule[]));
a(finite_induction_tac⌜u⌝);
(* *** Goal "1" *** *)
a(rewrite_tac[empty_finite_thm]);
(* *** Goal "2" *** *)
a(REPEAT strip_tac);
a(spec_nth_asm_tac 1 ⌜x'⌝);
(* *** Goal "3" *** *)
a(REPEAT strip_tac);
a(spec_nth_asm_tac 1 ⌜x⌝);
a(rewrite_tac[pc_rule1"sets_ext1" prove_rule[]⌜∀a b⦁⋃(a ∪ b) = ⋃a ∪ ⋃ b⌝]);
a(LEMMA_T⌜⋃{x} =x⌝ rewrite_thm_tac THEN1 PC_T1 "sets_ext1" prove_tac[]);
(* *** Goal "3.1" *** *)
a(∃_tac⌜x⌝ THEN REPEAT strip_tac);
(* *** Goal "3.2" *** *)
a(asm_rewrite_tac[∪_finite_thm]);
pop_thm()
));
=TEX
%%%%
%%%%

=SML
val ⦏pigeon_hole_thm1⦎  = snd ("pigeon_hole_thm1",  (
set_goal([], ⌜∀u ⦁
	u ∈ Finite
∧	(∀a⦁a ∈ u ⇒ a ∈ Finite ∧ #a ≤ 1)
⇒	#(⋃u) ≤ #u⌝);
a(REPEAT strip_tac THEN POP_ASM_T ante_tac);
a(finite_induction_tac⌜u⌝);
(* *** Goal "1" *** *)
a(rewrite_tac[size_empty_thm]);
(* *** Goal "2" *** *)
a(REPEAT strip_tac);
a(spec_nth_asm_tac 1 ⌜u'⌝);
(* *** Goal "3" *** *)
a(REPEAT strip_tac);
a(spec_nth_asm_tac 1 ⌜u'⌝);
(* *** Goal "4" *** *)
a(rename_tac[(⌜x⌝, "a")] THEN REPEAT strip_tac);
a(rewrite_tac[pc_rule1"sets_ext1" prove_rule[]⌜∀a b⦁⋃(a ∪ b) = ⋃a ∪ ⋃ b⌝]);
a(LEMMA_T⌜⋃{a} =a⌝ rewrite_thm_tac THEN1 PC_T1 "sets_ext1" prove_tac[]);
(* *** Goal "4.1" *** *)
a(∃_tac⌜a⌝ THEN REPEAT strip_tac);
(* *** Goal "4.2" *** *)
a(ALL_FC_T rewrite_tac[size_singleton_∪_thm]);
a(lemma_tac ⌜u ⊆ Finite⌝ THEN1
	(PC_T1 "sets_ext1"  REPEAT strip_tac THEN all_asm_fc_tac[]));
a(spec_nth_asm_tac 2 ⌜a⌝);
a(all_fc_tac[⋃_finite_thm]);
a(lemma_tac⌜#a = 0 ∨ #a = 1⌝ THEN1 PC_T1 "lin_arith" asm_prove_tac[]
	THEN POP_ASM_T ante_tac);
(* *** Goal "4.2.1" *** *)
a(ALL_FC_T1 fc_⇔_canon  rewrite_tac[size_0_thm]);
a(REPEAT strip_tac THEN  ALL_FC_T asm_rewrite_tac[size_singleton_∪_thm]);
a(PC_T1 "lin_arith" asm_prove_tac[]);
(* *** Goal "4.2.2" *** *)
a(ALL_FC_T1 fc_⇔_canon  rewrite_tac[size_1_thm]);
a(REPEAT strip_tac THEN cases_tac⌜a ⊆ ⋃u⌝);
(* *** Goal "4.2.2.1" *** *)
a(ALL_FC_T rewrite_tac[pc_rule1"sets_ext1" prove_rule[]⌜∀b⦁a ⊆ b ⇒ a ∪ b = b⌝]);
a(PC_T1 "lin_arith" asm_prove_tac[]);
(* *** Goal "4.2.2.2" *** *)
a(all_var_elim_asm_tac1);
a(ALL_FC_T (MAP_EVERY asm_tac) [pc_rule1"sets_ext1" prove_rule[]⌜∀b⦁¬ {x} ⊆ b ⇒ ¬x ∈ b⌝]);
a(ALL_FC_T asm_rewrite_tac[size_singleton_∪_thm]);
pop_thm()
));
=TEX
%%%%
%%%%

=SML
val ⦏pigeon_hole_thm⦎  = save_thm ("pigeon_hole_thm",  (
set_goal([], ⌜∀u ⦁
	u ∈ Finite
∧	u ⊆ Finite
∧	#u < #(⋃u)
⇒	∃a⦁a ∈ u ∧ #a > 1⌝);
a(PC_T "sets_ext1" contr_tac);
a(lemma_tac⌜∀ a⦁ a ∈ u ⇒ a ∈ Finite ∧ # a ≤ 1⌝ THEN1
	(REPEAT strip_tac THEN1 all_asm_fc_tac[]));
(* *** Goal "1" *** *)
a(spec_nth_asm_tac 2 ⌜a⌝ THEN PC_T1 "lin_arith" asm_prove_tac[]);
(* *** Goal "2" *** *)
a(all_fc_tac[pigeon_hole_thm1] THEN PC_T1 "lin_arith" asm_prove_tac[]);
pop_thm()
));
=TEX
%%%%
%%%%

=SML
val ⦏⊆_size_≤_thm⦎ = save_thm("⊆_size_≤_thm", (
set_goal([], ⌜∀a b⦁ a ∈ Finite ∧ b ⊆ a ⇒ #b ≤ #a⌝);
a(REPEAT strip_tac);
a(POP_ASM_T ante_tac THEN intro_∀_tac(⌜b⌝, ⌜b⌝));
a(finite_induction_tac⌜a⌝ THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(LEMMA_T ⌜b = {}⌝ rewrite_thm_tac);
a(PC_T1"sets_ext1" asm_prove_tac[]);
(* *** Goal "2" *** *)
a(cases_tac⌜x ∈ b⌝);
(* *** Goal "2.1" *** *)
a(PC_T1 "predicates" lemma_tac⌜b \ {x} ⊆ a ∧ ¬x ∈ b \ {x}⌝
	THEN1 PC_T1 "sets_ext1" asm_prove_tac[]);
a(all_fc_tac[⊆_finite_thm]);
a(LEMMA_T⌜b = {x} ∪ (b \ {x})⌝ once_rewrite_thm_tac
	THEN1 PC_T1 "sets_ext1" asm_prove_tac[]);
a(ALL_FC_T rewrite_tac[size_singleton_∪_thm]);
a(all_asm_fc_tac[]);
(* *** Goal "2.2" *** *)
a(lemma_tac⌜b ⊆ a⌝ THEN1 PC_T1 "sets_ext1" asm_prove_tac[]);
(* *** Goal "2.2.1" *** *)
a(asm_fc_tac[] THEN all_var_elim_asm_tac);
(* *** Goal "2.2.2" *** *)
a(ALL_FC_T rewrite_tac[size_singleton_∪_thm]);
a(asm_fc_tac[] THEN PC_T1 "lin_arith" asm_prove_tac[]);
pop_thm()
));
=TEX
%%%%
%%%%

=SML
val ⦏⊆_size_less_thm⦎ = save_thm ("⊆_size_less_thm", (
set_goal([],⌜∀a b⦁ a ∈ Finite ∧ b ⊆ a ∧ ¬b = a ⇒ #b < #a⌝);
a(REPEAT strip_tac);
a(lemma_tac⌜a \ b ⊆ a ∧ ¬a \ b = {}⌝ THEN1
	PC_T1 "sets_ext1" asm_prove_tac[]);
a(REPEAT strip_tac THEN all_fc_tac[⊆_finite_thm]);
a(LEMMA_T ⌜# (b ∪ (a \ b)) + # (b ∩ (a \ b)) = # b + # (a \ b)⌝ ante_tac THEN1
	(bc_thm_tac size_∪_thm THEN REPEAT strip_tac));
a(LEMMA_T ⌜b ∪ (a \ b) = a ∧ b ∩ (a \ b) = {}⌝ rewrite_thm_tac THEN1
	PC_T1 "sets_ext1" asm_prove_tac[]);
a(rewrite_tac[size_empty_thm]);
a(STRIP_T rewrite_thm_tac);
a(lemma_tac ⌜¬ #(a \ b) = 0⌝ THEN_LIST
	[id_tac, PC_T1 "lin_arith" asm_prove_tac[]]);
a(ALL_FC_T1 fc_⇔_canon asm_rewrite_tac[size_0_thm]);
pop_thm()
));
=TEX
%%%%
%%%%

=SML
val ⦏min_∈_thm⦎ = save_thm("min_∈_thm", (
set_goal([], ⌜∀n a⦁ n ∈ a ⇒ Min a ∈ a⌝);
a(∀_tac THEN cov_induction_tac ⌜n:ℕ⌝ THEN REPEAT strip_tac);
a(cases_tac⌜∃m⦁ m < n ∧ m ∈ a⌝);
(* *** Goal "1" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "2" *** *)
a(LEMMA_T ⌜Min a = n⌝ asm_rewrite_thm_tac);
a(bc_thm_tac(get_spec⌜Min⌝) THEN REPEAT strip_tac);
a(spec_nth_asm_tac 2 ⌜i⌝);
a(PC_T1 "lin_arith" asm_prove_tac[]);
pop_thm()
));
=TEX
%%%%
%%%%

=SML
val ⦏min_≤_thm⦎ = save_thm( "min_≤_thm", (
set_goal([], ⌜∀n a⦁ n ∈ a ⇒ Min a ≤ n⌝);
a(∀_tac THEN cov_induction_tac ⌜n:ℕ⌝ THEN REPEAT strip_tac);
a(cases_tac⌜∃m⦁ m < n ∧ m ∈ a⌝);
(* *** Goal "1" *** *)
a(all_asm_fc_tac[]);
a(PC_T1 "lin_arith" asm_prove_tac[]);
(* *** Goal "2" *** *)
a(LEMMA_T ⌜Min a = n⌝ rewrite_thm_tac);
a(bc_thm_tac(get_spec⌜Min⌝) THEN REPEAT strip_tac);
a(spec_nth_asm_tac 2 ⌜i⌝);
a(PC_T1 "lin_arith" asm_prove_tac[]);
pop_thm()
));
=TEX
%%%%
%%%%
=SML
val ⦏max_∈_thm⦎ = save_thm("max_∈_thm", (
set_goal([], ⌜∀m n a⦁ (∀i⦁i ∈ a ⇒ i ≤ m) ∧ n ∈ a ⇒ Max a ∈ a⌝);
a(∀_tac THEN induction_tac ⌜m:ℕ⌝ THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(all_asm_fc_tac[] THEN all_var_elim_asm_tac1);
a(all_fc_tac[get_spec⌜Max⌝] THEN asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(cases_tac⌜m + 1 ∈ a⌝
	THEN1 (all_fc_tac[get_spec⌜Max⌝] THEN asm_rewrite_tac[]));
a(DROP_NTH_ASM_T 4 bc_thm_tac THEN ∃_tac⌜n⌝
	THEN REPEAT strip_tac);
a(LIST_DROP_NTH_ASM_T [4] all_fc_tac);
a(cases_tac⌜i = m + 1⌝ THEN1 all_var_elim_asm_tac1);
a(PC_T1 "lin_arith" asm_prove_tac[]);
pop_thm()
));
=TEX
%%%%
%%%%

=SML
val ⦏≤_max_thm⦎ = save_thm("≤_max_thm", (
set_goal([], ⌜∀m n a⦁ (∀i⦁i ∈ a ⇒ i ≤ m) ∧ n ∈ a ⇒ n ≤ Max a⌝);
a(∀_tac THEN induction_tac ⌜m:ℕ⌝ THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(all_asm_fc_tac[] THEN all_var_elim_asm_tac1);
a(all_fc_tac[get_spec⌜Max⌝] THEN asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(cases_tac⌜m + 1 ∈ a⌝
	THEN1 (all_fc_tac[get_spec⌜Max⌝] THEN asm_rewrite_tac[]
		THEN all_asm_fc_tac[]));
a(DROP_NTH_ASM_T 4 bc_thm_tac THEN REPEAT strip_tac);
a(LIST_DROP_NTH_ASM_T [4] all_fc_tac);
a(cases_tac⌜i = m + 1⌝ THEN1 all_var_elim_asm_tac1);
a(PC_T1 "lin_arith" asm_prove_tac[]);
pop_thm()
));
=TEX
%%%%
%%%%

=SML
val ⦏finite_⊆_well_founded_thm⦎ = save_thm("finite_⊆_well_founded_thm", (
set_goal([],⌜∀p a⦁
	a ∈ Finite
∧	p a
⇒	∃b⦁
	b ⊆ a
∧	p b
∧	∀c⦁c ⊆ b ∧ p c ⇒ c = b⌝);
a(REPEAT strip_tac);
a(PC_T1 "predicates" lemma_tac ⌜#a ∈ {n | ∃t⦁ t ⊆ a ∧ p t ∧ n = #t}⌝);
(* *** Goal "1" *** *)
a(REPEAT strip_tac);
a(∃_tac⌜a⌝ THEN REPEAT strip_tac);
(* *** Goal "2" *** *)
a(all_fc_tac[min_∈_thm]);
a(∃_tac⌜t⌝ THEN REPEAT strip_tac);
a(contr_tac THEN all_fc_tac[⊆_finite_thm]);
a(all_fc_tac[⊆_size_less_thm]);
a(DROP_NTH_ASM_T 9 discard_tac);
a(PC_T1 "predicates" lemma_tac ⌜#c ∈ {n | ∃t⦁ t ⊆ a ∧ p t ∧ n = #t}⌝);
(* *** Goal "2.1" *** *)
a(REPEAT strip_tac);
a(∃_tac⌜c⌝ THEN REPEAT strip_tac);
a(PC_T1 "sets_ext1" asm_prove_tac[]);
(* *** Goal "2.2" *** *)
a(all_fc_tac[min_≤_thm]);
a(PC_T1 "lin_arith" asm_prove_tac[]);
pop_thm()
));
=TEX
\subsection{Derived Definitions}
\subsection{End of Theory ``finset''}
\section{CONVERSIONS}
=TEX
=SML
end; (* of structure FinSetTheory *)
open FinSetTheory;
=TEX
\newpage
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}




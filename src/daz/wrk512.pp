=IGN
********************************************************************************
wrk512.doc: this file is part of the PPDaz system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% ℤ $Date: 2002/10/17 16:04:45 $ $Revision: 1.9 $ $RCSfile: wrk512.doc,v $
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

\def\Title{SHOLIS VCs Proof Scripts}

\def\AbstractText{}

\def\Reference{ISS/HAT/DAZ/WRK512}

\def\Author{G.M. Prout, R.D. Arthan}


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
\def\Hide#1{}
\def\Bool{``$\it{:}bool\,$''}
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{DAZ PROJECT}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{SHOLIS VCs Proof Scripts}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{SHOLIS VCs Proof Scripts}
%% LaTeX2e port: \TPPref{ISS/HAT/DAZ/WRK512}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.9 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2002/10/17 16:04:45 $%
%% LaTeX2e port: }}  %% Mandatory field (with sensible default)
%% LaTeX2e port: \TPPstatus{Informal}
%% LaTeX2e port: %\TPPstatus{Informal}
%% LaTeX2e port: \TPPtype{Technical}
%% LaTeX2e port: %\TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{G.M.~Prout & HAT Team\\R.D.~Arthan & HAT Team}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & WIN01}
%% LaTeX2e port: \TPPabstract{% Proof Scripts for the SHOLIS VCs identified in strand 1 of Proof Work Phase 1 (see ISS/HAT/DAZ/PLN010).
%% LaTeX2e port: }
%% LaTeX2e port: %\TPPabstractB{}
%% LaTeX2e port: %\TPPabstractC{}
%% LaTeX2e port: %\TPPabstractD{}
%% LaTeX2e port: %\TPPabstractE{}
%% LaTeX2e port: %\TPPabstractF{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port:       Library}}
%% LaTeX2e port: 
%% LaTeX2e port: %\TPPclass{CLASSIFICATION}
%% LaTeX2e port: \def\TPPheadlhs{Lemma 1 Ltd.}
%% LaTeX2e port: %\def\TPPheadlhs{}
%% LaTeX2e port: %\def\TPPheadcentre{}
%% LaTeX2e port: %def\TPPheadrhs{}
%% LaTeX2e port: %\def\TPPfootlhs{}
%% LaTeX2e port: %\def\TPPfootcentre{}
%% LaTeX2e port: %\def\TPPfootrhs{}
%% LaTeX2e port: 
%% LaTeX2e port: \begin{document}
%% LaTeX2e port: \TPPsetsizes
%% LaTeX2e port: \makeTPPfrontpage
%% LaTeX2e port: 
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

\newpage
\section{DOCUMENT CONTROL}
\subsection{Contents List}
\tableofcontents
\pagebreak
\subsection{Document Cross References}
\bibliographystyle{fmu}
\bibliography{fmu,daz}

\subsection{Changes History}  % to get section number `0.3'
\begin{description}
\item[Issues 1.1 (1996/01/24) - 1.4
] Initial Drafts.
\item[Issue 1.5 (1996/04/03)] VC proofs completed.
\item[Issue 1.6 (2002/08/23)] Removed use of ICL logo font.
\item[Issue 1.7 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.8 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.9 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.10 (2004/01/19)] The Z universal set is now called 𝕌.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported daz source documents onto the Lemma 1 document template
%%%% END OF CHANGES HISTORY %%%%
\end{description}

\subsection{Changes Forecast}

\pagebreak
\section{GENERAL}

\subsection{Scope}
This document   provides proofs of the  SHOLIS VCs called for in \cite{ISS/HAT/DAZ/PLN010,ISS/HAT/DAZ/PLN012}.

\subsection{Introduction}
As part of the requirements analysis for proof tools for the Compliance Notation, an attempt has been made at proving the VCs arising from one package from the SHOLIS development.

In fact, proofs of all of the VCs have been achieved, subject to minor changes to $vc702\_2$ and $vc902\_2$. The changes required are documented in
 \cite{ISS/HAT/DAZ/WRK511}. A third change, to VC $vc120704\_2$, was also thought
to be required, but on further investigation this was found not to
be the case. The Z document supplied with the ITT \cite{CSM/025} has been
updated with these two small changes. The proofs of the 62 VCs have been completely reworked using the additional Compliance Tool
support that is documented in \cite{ISS/HAT/DAZ/USR503}.


The following unix commands should suffice to recreate the VC proofs:
=GFT
pp_make_database -p pp_daz sholis
docsml sholisvcs wrk512
pp -f sholisvcs,wrk512 -d sholis
=TEX
\newpage
\section{THE PROOF SCRIPTS}


\subsection{Getting Started}

Create a new theory $sholis\_support$ to contain the support theorems:
=SML
new_theory"sholis_support";
val sholis_thms = all_cn_make_script_support "sholis";
=TEX
Create a new theory $sholis\_vcs$ for the VC proofs:
=SML
new_theory"sholis_vcs";
=TEX
\subsection{General Purpose Lemmas}
\subsubsection{Override}
=SML
set_pc"z_library1";
val ⦏⊕_lemma1⦎ = prove_rule[z_⊕_↦_app_thm]
	ⓩ∀f : 𝕌;x:𝕌;y:𝕌;z:𝕌⦁(f ⊕ {x ↦ f x ⊕ {y ↦ z}})x y= z⌝;
=TEX
=SML
set_goal([], ⓩ[X, Y, Z](∀f : X → Y → Z; x:X;y2:Y;y1:𝕌;z:𝕌| ¬y2=y1⦁
	(f ⊕ {x ↦ f x ⊕ {y1 ↦ z}})x y2= f x y2)⌝);
a(REPEAT strip_tac);
a(rewrite_tac[z_⊕_↦_app_thm]);
a(all_asm_fc_tac[z_fun_∈_clauses]);
a(ALL_ASM_FC_T rewrite_tac[z_⊕_↦_app_thm1]);
val ⦏⊕_lemma2⦎ = pop_thm();
=TEX
=SML
set_goal([], ⓩ[X, Y, Z](∀f : X → Y → Z; x:X;y:Y;z:Z⦁
	(f ⊕ {x ↦ f x ⊕ {y ↦ z}}) ∈ X → Y → Z )⌝);
a(REPEAT strip_tac);
a(all_asm_fc_tac[z_fun_∈_clauses]);
a(all_asm_fc_tac[z_⊕_↦_∈_→_thm]);
a(all_asm_fc_tac[z_⊕_↦_∈_→_thm]);
val ⦏⊕_lemma3⦎ = pop_thm();
=TEX
=SML
set_goal([], ⌜∀X Y Z V⦁ⓩV = X → Y → Z ⇒(∀f : V; x:X;y:Y;z:Z⦁
	(f ⊕ {x ↦ f x ⊕ {y ↦ z}}) ∈ V)⌝⌝);
a(REPEAT strip_tac);
a(all_var_elim_asm_tac1 THEN all_asm_fc_tac[⊕_lemma3]);
val ⦏⊕_lemma4⦎ = pop_thm();
=TEX
\subsubsection{Not true and Not false}
=SML
set_pc"cn1";
set_goal([],ⓩ∀ X : BOOLEAN ⦁ not X = Boolean true ⇒ X = Boolean false⌝);
a(z_∀_tac THEN ⇒_tac);
a(ALL_ASM_FC_T rewrite_tac[cn_boolean_clauses1]);
a(POP_ASM_T (ante_tac o rewrite_rule[cn_boolean_thm]));
a(REPEAT strip_tac);
val ⦏bool_lemma1⦎ = pop_thm();
=TEX
=SML
set_pc"cn1";
set_goal([],ⓩ∀ X : BOOLEAN ⦁ not X = Boolean false ⇒ X = Boolean true⌝);
a(z_∀_tac THEN ⇒_tac);
a(ALL_ASM_FC_T rewrite_tac[cn_boolean_clauses1]);
val ⦏bool_lemma2⦎ = pop_thm();
=TEX
\subsubsection{Intmod}
=SML
set_pc"cn1";
set_goal([],ⓩ∀ i : ℕ; j : ℕ ⦁ j > i ⇒ i intmod j = i⌝);
a(REPEAT strip_tac);
a(lemma_tacⓩ¬ j = 0⌝THEN1 PC_T1"z_lin_arith"asm_prove_tac[]);
a(ALL_FC_T1 fc_⇔_canon rewrite_tac[cn_intmod_thm]);
a(z_∃_tacⓩ0⌝);
a(ALL_ASM_FC_T asm_rewrite_tac[z_abs_thm]);
val ⦏intmod_lemma1⦎ = pop_thm();
=TEX
=SML
set_pc"cn1";
set_goal([],ⓩ∀ i : ℤ; j : ℕ ⦁ i < 0 ∧ j > ~ i ⇒ i intmod j = j + i ⌝);
a(REPEAT strip_tac);
a(lemma_tacⓩ¬ j = 0⌝THEN1 PC_T1"z_lin_arith"asm_prove_tac[]);
a(ALL_FC_T1 fc_⇔_canon rewrite_tac[cn_intmod_thm]);
a(z_∃_tacⓩ~ 1⌝);
a(LEMMA_Tⓩi = ~ 1 * j + j + i⌝(rewrite_thm_tac o eq_sym_rule)
	THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(LEMMA_Tⓩ~ i < j ⇒ 0 < j + i⌝ante_tac THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(DROP_NTH_ASM_T 2 rewrite_thm_tac THEN ⇒_tac);
a(ALL_ASM_FC_T asm_rewrite_tac[z_abs_thm,z_abs_pos_thm]);
a(asm_rewrite_tac[z_≤_less_eq_thm]);
val ⦏intmod_lemma2⦎ = pop_thm();
=TEX
\subsubsection{Cartesian Product with Singleton Sets}
=SML
set_pc"cn1";
set_goal([], ⓩ∀x:ℙ⋎1 𝕌; y:𝕌; z:𝕌 ⦁ x × {y} ∈ x → z ⇔ y ∈ z⌝);
a(PC_T1"z_library1_ext" prove_tac[]);
val ⦏×_singleton_fun_lemma⦎ = pop_thm();
=TEX
=SML
set_goal([], ⓩ∀x: 𝕌; y:𝕌; z:𝕌 ⦁ {x} × {y} ∈ {x} → z ⇔ y ∈ z⌝);
a(PC_T1"z_library1_ext" prove_tac[]);
val ⦏singleton_×_fun_lemma⦎ = pop_thm();
=TEX
=SML
set_goal([], ⓩ∀x:𝕌; y:𝕌; z:𝕌 | z ∈ x ⦁ (x × {y}) z = y⌝);
a(REPEAT strip_tac THEN z_app_eq_tac);
a(PC_T1"z_library1_ext" asm_prove_tac[]);
val ⦏×_singleton_app_lemma⦎ = pop_thm();
=TEX
=SML
set_goal([], ⓩ∀x: 𝕌; y:𝕌 ⦁ ({x} × {y}) x = y⌝);
a(REPEAT strip_tac THEN z_app_eq_tac);
a(PC_T1"z_library1_ext" prove_tac[]);
val ⦏singleton_×_app_lemma⦎ = pop_thm();
=TEX
\pagebreak
\subsection{Specification Specific Lemmas}\label{SPEC}
=SML
set_pc"cn1";
set_goal([], ⓩ∀ s:ALARMSTATE; d:BASICTYPESoDISPLAYPOSITION; a:ALARMTYPE⦁
	(s d a).RAISED ∈ BOOLEAN⌝);
a(REPEAT strip_tac);
a(PC_T1"sholis"cn_∈_type_tac[]);
val ⦏vc501_lemma⦎ = pop_thm();
=TEX
=SML
set_pc"cn1";
set_goal([], ⓩ∀ t:TIMERSTATE; d:BASICTYPESoDISPLAYPOSITION; a:ALARMTYPE⦁
		(t d a).ACTIVE ∈ BOOLEAN⌝);
a(REPEAT strip_tac);
a(PC_T1"sholis"cn_∈_type_tac[]);
val ⦏vc702_lemma1⦎ = pop_thm();
=TEX
=SML
push_pc"sholis";
set_goal([], ⓩ(LEVEL ≜ AUDIOVISUALFLASH,RAISED ≜ Boolean true,
	REOCCURS ≜ NORESET) ∈  ALARMDATA⌝);
a(cn_∈_type_tac[]);
pop_pc();
val ⦏vc807_lemma1⦎ = pop_thm();
=TEX
=SML
push_pc"sholis";
set_goal([], ⓩ(LEVEL ≜ VISUALFLASH,RAISED ≜ Boolean true,
	REOCCURS ≜ NORESET) ∈  ALARMDATA⌝);
a(cn_∈_type_tac[]);
pop_pc();
val ⦏vc807_lemma2⦎ = pop_thm();
=TEX
=SML
set_pc"cn1";
set_goal([], ⓩ∀ s:ALARMSTATE; d:BASICTYPESoDISPLAYPOSITION; a:ALARMTYPE⦁
	(s d a).LEVEL ∈ ALARMLEVEL⌝);
a(REPEAT strip_tac);
a(PC_T1"sholis"cn_∈_type_tac[]);
val ⦏vc807_lemma3⦎ = pop_thm();
=TEX
=SML
set_pc"cn1";
set_goal([], ⓩ∀ t:TIMERSTATE; d:BASICTYPESoDISPLAYPOSITION; a:ALARMTYPE⦁
		(t d a).TIMEOUT ∈ BASICTYPESoTIME⌝);
a(REPEAT strip_tac);
a(PC_T1"sholis"cn_∈_type_tac[]);
val ⦏vc901_lemma⦎ = pop_thm();
=TEX
=SML
set_pc"cn1";
set_goal([], ⓩ∀ s:ALARMSTATE ; d:BASICTYPESoDISPLAYPOSITION; a:ALARMTYPE⦁
	(LEVEL ≜ (s d a).LEVEL,RAISED ≜ (s d a).RAISED,
	REOCCURS ≜ RESET) ∈  ALARMDATA⌝);
a(REPEAT strip_tac);
a(PC_T1"sholis"cn_∈_type_tac[]);
val ⦏vc902_lemma1⦎ = pop_thm();
=TEX
=SML
set_pc"cn1";
set_goal([], ⓩ∀ t:TIMERSTATE; d:BASICTYPESoDISPLAYPOSITION; a:ALARMTYPE⦁
		(ACTIVE ≜ Boolean false,TIMEOUT ≜ (t d a).TIMEOUT) ∈ TIMERDATA⌝);
a(REPEAT strip_tac);
a(PC_T1"sholis"cn_∈_type_tac[]);
val ⦏vc902_lemma2⦎ = pop_thm();
=TEX
=SML
set_pc"cn1";
set_goal([], ⓩ∀y:𝕌; z:𝕌 ⦁ 0 .. 2 × {y} ∈ 0 .. 2 → z ⇔ y ∈ z⌝);
a(lemma_tacⓩ0 .. 2 ∈ ℙ⋎1 𝕌⌝ THEN1
	(PC_T1 "z_library1_ext" rewrite_tac []
	THEN REPEAT strip_tac THEN z_∃_tacⓩ0⌝ THEN rewrite_tac[]));
a(REPEAT strip_tac THEN ALL_FC_T1 fc_canon1
	(MAP_EVERY strip_asm_tac)[×_singleton_fun_lemma]);
val ⦏vc1001_lemma⦎ = pop_thm();
=TEX
=SML
set_pc"cn1";
set_goal([], ⓩ∀ s:ALARMSTATE ; d:BASICTYPESoDISPLAYPOSITION; a:ALARMTYPE⦁
	(LEVEL ≜ (s d a).LEVEL,RAISED ≜ Boolean false,
	REOCCURS ≜ (s d a).REOCCURS) ∈  ALARMDATA⌝);
a(REPEAT strip_tac);
a(PC_T1"sholis"cn_∈_type_tac[]);
val ⦏vc1101_lemma⦎ = pop_thm();
=TEX
=SML
set_pc"cn1";
set_goal([], ⓩ∀ s:ALARMSTATE ; d:BASICTYPESoDISPLAYPOSITION; a:ALARMTYPE⦁
	(LEVEL ≜ VISUALINVERSE,RAISED ≜ (s d a).RAISED,
	REOCCURS ≜ (s d a).REOCCURS) ∈  ALARMDATA⌝);
a(REPEAT strip_tac);
a(PC_T1"sholis"cn_∈_type_tac[]);
val ⦏vc120705_lemma⦎ = pop_thm();
=TEX
\subsection{Conjecture Proofs}
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body""vc501_1");
a(cn_vc_simp_tac[] THEN REPEAT strip_tac);
a(all_asm_fc_tac[vc501_lemma]);
a(all_asm_fc_tac[bool_lemma1]);
a(all_asm_fc_tac [rewrite_rule[]cn_DisplayAttribute_thm]);
a(asm_rewrite_tac[]);
val ⦏vc501_1⦎ = save_pop_thm"vc501_1";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body""vc501_2");
a(cn_vc_simp_tac[] THEN REPEAT strip_tac);
a(all_asm_fc_tac[vc501_lemma]);
a(all_asm_fc_tac[bool_lemma2]);
a(all_asm_fc_tac [rewrite_rule[] cn_DisplayAttribute_thm]);
a(asm_rewrite_tac[]);
val ⦏vc501_2⦎ = save_pop_thm"vc501_2";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body""vc501_3");
a(cn_vc_simp_tac[] THEN REPEAT strip_tac);
a(all_asm_fc_tac[vc501_lemma]);
a(all_asm_fc_tac[bool_lemma2]);
a(all_asm_fc_tac [rewrite_rule[] cn_DisplayAttribute_thm]);
a(asm_rewrite_tac[]);
val ⦏vc501_3⦎ = save_pop_thm"vc501_3";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body""vc701_1");
a(cn_vc_simp_tac[] THEN REPEAT strip_tac);
a(PC_T1 "z_lin_arith" asm_prove_tac[]);
val ⦏vc701_1⦎ = save_pop_thm"vc701_1";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body""vc701_2");
a(cn_vc_simp_tac[] THEN PC_T1"sholis"rewrite_tac[]);
val ⦏vc701_2⦎ = save_pop_thm"vc701_2";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body""vc701_3");
a(cn_vc_simp_tac[]);
val ⦏vc701_3⦎ = save_pop_thm"vc701_3";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body""vc701_4");
a(cn_vc_simp_tac[]);
a(⇒_T (REPEAT_TTCL ∧_THEN asm_tac));
a(POP_ASM_T (rewrite_thm_tac o eq_sym_rule));
a(PC_T1"sholis"rewrite_tac[]);
val ⦏vc701_4⦎ = save_pop_thm"vc701_4";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body""vc702_1");
a(cn_vc_simp_tac[]);
a(⇒_T (REPEAT_TTCL ∧_THEN asm_tac));
a(z_∃_tacⓩATYPE⌝);
a(GET_NTH_ASM_T 4 ante_tac THEN PC_T1"sholis"rewrite_tac[]);
a(REPEAT strip_tac);
a(all_asm_fc_tac[vc501_lemma,vc702_lemma1]);
a(DROP_NTH_ASM_T 6 ante_tac THEN
	ALL_ASM_FC_T rewrite_tac[cn_boolean_clauses2]);
a(ALL_FC_T1 fc_⇔_canon rewrite_tac[cn_AudioVisualFlashAlarms_thm]);
a(POP_ASM_T (ante_tac o rewrite_rule[cn_TimerInvariant_thm]));
a(POP_ASM_T (ante_tac o rewrite_rule[cn_boolean_thm]));
a(REPEAT strip_tac);
val ⦏vc702_1⦎ = save_pop_thm"vc702_1";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body""vc702_2");
a(cn_vc_simp_tac[]);
a(⇒_T (REPEAT_TTCL ∧_THEN asm_tac));
a(DROP_NTH_ASM_T 2 ante_tac);
a(cases_tacⓩAUDIOVFEXISTS = Boolean true⌝THEN asm_rewrite_tac[]);
(* *** Goal "1" *** *)
a(REPEAT strip_tac);
a(z_∃_tacⓩI⌝THEN asm_rewrite_tac[]);
a(PC_T1 "z_lin_arith" asm_prove_tac[]);
(* *** Goal "2" *** *)
a(REPEAT strip_tac);
a(z_spec_nth_asm_tac 3 ⓩI⌝);
a(lemma_tacⓩI = ATYPE⌝THEN1 PC_T1"z_lin_arith"asm_prove_tac[]);
a(all_var_elim_asm_tac1);
a(ALL_FC_T1 fc_⇔_canon rewrite_tac[z_get_specⓩAudioVisualFlashAlarms⌝]);
a(all_asm_fc_tac[vc501_lemma,vc702_lemma1]);
a(DROP_NTH_ASM_T 7 ante_tac THEN
	ALL_ASM_FC_T rewrite_tac[cn_boolean_clauses2]);
a(POP_ASM_T (ante_tac o rewrite_rule[cn_TimerInvariant_thm]));
a(POP_ASM_T (ante_tac o rewrite_rule[cn_boolean_thm]));
a(REPEAT strip_tac);
val ⦏vc702_2⦎ = save_pop_thm"vc702_2";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body""vc807_1");
a(cn_vc_simp_tac[]THEN REPEAT strip_tac);
a(all_asm_fc_tac[vc501_lemma]);
a(all_asm_fc_tac[bool_lemma1]);
a(asm_tac vc807_lemma1);
a(asm_tac (rewrite_rule[cn_ALARMSTATE1_thm]cn_ALARMSTATE_thm));
a(all_asm_fc_tac[⊕_lemma4]);
a(DROP_NTH_ASM_T 2 discard_tac);
a(asm_rewrite_tac[cn_RaiseAlarm_thm,cn_AlarmChange_thm,
	cn_RaiseNewAlarm_thm,cn_RaiseWithinTimeoutAlarm_thm,
	cn_RaiseAudioVisualFlashAlarm_thm,cn_RaiseTimedOutAlarm_thm]);
a(REPEAT ∧_tac);
(* *** Goal "1" *** *)
a(ALL_FC_T1 fc_⇔_canon rewrite_tac[cn_AudioVisualFlashAlarms_thm]);
a(rewrite_tac[⊕_lemma1]THEN ⇒_tac);
a(DROP_NTH_ASM_T 7 (ante_tac o rewrite_rule[cn_TimerInvariant_thm]));
a(asm_rewrite_tac[]);
a(all_asm_fc_tac[vc702_lemma1]);
a(POP_ASM_T (ante_tac o rewrite_rule[cn_boolean_thm]));
a(REPEAT strip_tac);
(* *** Goal "2" *** *)
a(ALL_FC_T1 fc_⇔_canon rewrite_tac[cn_WithinTimeoutAlarms_thm]);
a(asm_rewrite_tac[]);
(* *** Goal "3" *** *)
a(ALL_FC_T1 fc_⇔_canon rewrite_tac[cn_AudioVisualFlashAlarms_thm]);
a(asm_rewrite_tac[]);
(* *** Goal "4" *** *)
a(ALL_FC_T1 fc_⇔_canon rewrite_tac[cn_TimedOutAlarms_thm]);
a(asm_rewrite_tac[]);
val ⦏vc807_1⦎ = save_pop_thm"vc807_1";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body""vc807_2");
a(cn_vc_simp_tac[]THEN REPEAT strip_tac);
a(all_asm_fc_tac[vc501_lemma]);
a(all_asm_fc_tac[bool_lemma2]);
a(asm_tac vc807_lemma1);
a(asm_tac (rewrite_rule[cn_ALARMSTATE1_thm]cn_ALARMSTATE_thm));
a(all_asm_fc_tac[⊕_lemma4]);
a(DROP_NTH_ASM_T 2 discard_tac);
a(asm_rewrite_tac[cn_RaiseAlarm_thm,cn_AlarmChange_thm,
	cn_RaiseNewAlarm_thm,cn_RaiseWithinTimeoutAlarm_thm,
	cn_RaiseAudioVisualFlashAlarm_thm,cn_RaiseTimedOutAlarm_thm]);
a(REPEAT ∧_tac);
(* *** Goal "1" *** *)
a(ALL_FC_T1 fc_⇔_canon rewrite_tac[cn_InactiveAlarms_thm]);
a(asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(ALL_FC_T1 fc_⇔_canon rewrite_tac[cn_WithinTimeoutAlarms_thm]);
a(DROP_NTH_ASM_T 7 (ante_tac o rewrite_rule[cn_TimerInvariant_thm]));
a(asm_rewrite_tac[cn_RESET_thm,cn_NORESET_thm]);
a(⇒_T rewrite_thm_tac);
(* *** Goal "3" *** *)
a(ALL_FC_T1 fc_⇔_canon rewrite_tac[cn_AudioVisualFlashAlarms_thm]);
a(asm_rewrite_tac[⊕_lemma1]);
a(REPEAT strip_tac);
(* *** Goal "4" *** *)
a(ALL_FC_T1 fc_⇔_canon rewrite_tac[cn_TimedOutAlarms_thm,
	cn_AudioVisualFlashAlarms_thm]);
a(asm_rewrite_tac[⊕_lemma1]);
val ⦏vc807_2⦎ = save_pop_thm"vc807_2";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body""vc807_3");
a(cn_vc_simp_tac[]THEN REPEAT strip_tac);
a(all_asm_fc_tac[vc501_lemma]);
a(all_asm_fc_tac[bool_lemma2]);
a(asm_tac vc807_lemma2);
a(asm_tac (rewrite_rule[cn_ALARMSTATE1_thm]cn_ALARMSTATE_thm));
a(all_asm_fc_tac[⊕_lemma4]);
a(DROP_NTH_ASM_T 2 discard_tac);
a(asm_rewrite_tac[cn_RaiseAlarm_thm,cn_AlarmChange_thm,
	cn_RaiseNewAlarm_thm,cn_RaiseWithinTimeoutAlarm_thm,
	cn_RaiseAudioVisualFlashAlarm_thm,cn_RaiseTimedOutAlarm_thm]);
a(REPEAT ∧_tac);
(* *** Goal "1" *** *)
a(ALL_FC_T1 fc_⇔_canon rewrite_tac[cn_InactiveAlarms_thm]);
a(asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(ALL_FC_T1 fc_⇔_canon rewrite_tac[cn_WithinTimeoutAlarms_thm,
	cn_VisualFlashAlarms_thm]);
a(asm_rewrite_tac[⊕_lemma1,cn_VISUALINVERSE_thm,cn_AUDIOVISUALFLASH_thm]);
(* *** Goal "3" *** *)
a(ALL_FC_T1 fc_⇔_canon rewrite_tac[cn_AudioVisualFlashAlarms_thm]);
a(asm_rewrite_tac[⊕_lemma1]);
a(asm_rewrite_tac[z_get_specⓩVISUALINVERSE⌝,z_get_specⓩAUDIOVISUALFLASH⌝]);
(* *** Goal "4" *** *)
a(ALL_FC_T1 fc_⇔_canon rewrite_tac[cn_TimedOutAlarms_thm]);
a(asm_rewrite_tac[]);	
val ⦏vc807_3⦎ = save_pop_thm"vc807_3";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body""vc807_4");
a(cn_vc_simp_tac[]THEN REPEAT strip_tac);
a(all_asm_fc_tac[vc501_lemma]);
a(all_asm_fc_tac[bool_lemma2]);
a(asm_rewrite_tac[cn_RaiseAlarm_thm,cn_AlarmChange_thm,
	cn_RaiseNewAlarm_thm,cn_RaiseWithinTimeoutAlarm_thm,
	cn_RaiseAudioVisualFlashAlarm_thm,cn_RaiseTimedOutAlarm_thm]);
a(REPEAT ∧_tac);
(* *** Goal "1" *** *)
a(ALL_FC_T1 fc_⇔_canon rewrite_tac[cn_InactiveAlarms_thm]);
a(asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(ALL_FC_T1 fc_⇔_canon rewrite_tac[cn_WithinTimeoutAlarms_thm,
	cn_VisualFlashAlarms_thm]);
a(REPEAT strip_tac);
a(DROP_NTH_ASM_T 7 (ante_tac o rewrite_rule[cn_TimerInvariant_thm]));
a(asm_rewrite_tac[]);
a(all_asm_fc_tac[vc807_lemma3]);
a(LIST_DROP_NTH_ASM_T [1,5](MAP_EVERY ante_tac));
a(PC_T1"sholis"rewrite_tac[]);
a(PC_T1"z_lin_arith"prove_tac[]);
(* *** Goal "3" *** *)
a(ALL_FC_T1 fc_⇔_canon rewrite_tac[cn_TimedOutAlarms_thm]);
a(asm_rewrite_tac[]);
val ⦏vc807_4⦎ = save_pop_thm"vc807_4";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body""vc901_1");
a(cn_vc_simp_tac[]);
val ⦏vc901_1⦎ = save_pop_thm"vc901_1";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body""vc901_2");
a(cn_vc_simp_tac[]);
a(PC_T1 "z_library_ext"rewrite_tac[cn_TimeoutAlarm_thm,cn_AlarmChange_thm]);
a(⇒_T (REPEAT_TTCL ∧_THEN asm_tac));
a(REPEAT strip_tac);
a(DROP_NTH_ASM_T 3 ante_tac THEN asm_rewrite_tac[]);
a(cases_tacⓩ0 ≤ CURRENTTIME + ~ (TIMERS⋎0 DISPLAY ATYPE).TIMEOUT⌝);
(* *** Goal "1" *** *)
a(asm_rewrite_tac[]);
a(lemma_tacⓩ(BASICTYPESoTIMEvLAST + 1) >
	(CURRENTTIME + ~ (TIMERS⋎0 DISPLAY ATYPE).TIMEOUT) ∧
	0 ≤ BASICTYPESoTIMEvLAST + 1 ⌝);
(* *** Goal "1.1" *** *)
a(all_asm_fc_tac[vc901_lemma]);
a(POP_ASM_T discard_tac);
a(LIST_DROP_NTH_ASM_T[1,2,5](MAP_EVERY ante_tac)
	THEN PC_T1"sholis"rewrite_tac[]);
a(PC_T1"z_lin_arith"prove_tac[]);
(* *** Goal "1.2" *** *)
a(all_asm_fc_tac[intmod_lemma1]);
a(DROP_NTH_ASM_T 5 ante_tac THEN POP_ASM_T rewrite_thm_tac);
a(⇒_T rewrite_thm_tac);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[]);
a(lemma_tacⓩ(BASICTYPESoTIMEvLAST + 1) >
	~(CURRENTTIME + ~ (TIMERS⋎0 DISPLAY ATYPE).TIMEOUT) ∧
	0 ≤ BASICTYPESoTIMEvLAST + 1 ⌝);
(* *** Goal "2.1" *** *)
a(all_asm_fc_tac[vc901_lemma]);
a(POP_ASM_T discard_tac);
a(LIST_DROP_NTH_ASM_T[1,2,5](MAP_EVERY ante_tac)
	THEN PC_T1"sholis"rewrite_tac[]);
a(PC_T1"z_lin_arith"prove_tac[]);
(* *** Goal "2.2" *** *)
a(all_asm_fc_tac[intmod_lemma2]);
a(DROP_NTH_ASM_T 5 ante_tac THEN POP_ASM_T rewrite_thm_tac);
a(PC_T1"z_lin_arith"prove_tac[]);
val ⦏vc901_2⦎ = save_pop_thm"vc901_2";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body""vc902_1");
a(cn_vc_simp_tac[]);
a(⇒_T (REPEAT_TTCL ∧_THEN asm_tac));
a(asm_tac (rewrite_rule[cn_ALARMSTATE1_thm]cn_ALARMSTATE_thm));
a(asm_tac (rewrite_rule[cn_TIMERSTATE1_thm]cn_TIMERSTATE_thm));
a(all_asm_fc_tac[vc902_lemma1,vc902_lemma2]);
a(all_asm_fc_tac[⊕_lemma4]);
a(ALL_FC_T1 fc_⇔_canon rewrite_tac[cn_TimedOutAlarms_thm]);
a(asm_rewrite_tac[⊕_lemma1]);
a(ALL_FC_T1 fc_⇔_canon rewrite_tac[cn_WithinTimeoutAlarms_thm]);
a(REPEAT strip_tac);
val ⦏vc902_1⦎ = save_pop_thm"vc902_1";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body""vc902_2");
a(cn_vc_simp_tac[]);
a(⇒_T (REPEAT_TTCL ∧_THEN asm_tac));
a(ALL_FC_T1 fc_⇔_canon rewrite_tac[cn_WithinTimeoutAlarms_thm]);
a(⇒_T (REPEAT_TTCL ∧_THEN asm_tac));
a(all_asm_fc_tac[vc702_lemma1]);
a(swap_nth_asm_concl_tac 5);
a(DROP_NTH_ASM_T 2 (ante_tac o rewrite_rule[cn_boolean_thm])
	THEN asm_rewrite_tac[]);
a(all_asm_fc_tac[vc901_lemma]);
a(LIST_DROP_NTH_ASM_T [1,3,6] (MAP_EVERY ante_tac)
	THEN PC_T1"sholis"rewrite_tac[]);
a(PC_T1"z_lin_arith"prove_tac[]);
val ⦏vc902_2⦎ = save_pop_thm"vc902_2";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body" "vc1001_1");
a(cn_vc_simp_tac[] THEN REPEAT strip_tac);
a(lemma_tacⓩALARMSTATEvRANGE
                     × {ALARMSTATE1vRANGE
                         × {(LEVEL ≜ ALARMLEVELvFIRST, RAISED ≜ Boolean false,
                               REOCCURS ≜ ALARMRESETvFIRST)}} ∈ ALARMSTATE ∧
                   TIMERSTATEvRANGE
                     × {TIMERSTATE1vRANGE
                         × {(ACTIVE ≜ Boolean false,
					TIMEOUT ≜ BASICTYPESoTIMEvLAST)}}
				∈ TIMERSTATE⌝);
(* *** Goal "1" *** *)
a(PC_T1"sholis"rewrite_tac[singleton_×_fun_lemma,vc1001_lemma]);
(* *** Goal "2" *** *)
a(ALL_FC_T1 fc_⇔_canon rewrite_tac[cn_InactiveAlarms_thm]);
a(all_asm_ante_tac THEN PC_T1"sholis"rewrite_tac[]);
a(REPEAT strip_tac THEN all_var_elim_asm_tac1);
a(rewrite_tac[singleton_×_app_lemma]);
a(ALL_FC_T rewrite_tac
	[z_∀_elim ⓩ(x≜ 0..2, z≜ ATYPE,
			y≜ (LEVEL ≜ 0, RAISED ≜ Boolean false,
			REOCCURS ≜ 0))⌝ ×_singleton_app_lemma]);
val ⦏vc1001_1⦎ = save_pop_thm"vc1001_1";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body" "vc11_1");
a(cn_vc_simp_tac[]THEN REPEAT strip_tac);
a(PC_T1 "z_lin_arith" asm_prove_tac[]);
val ⦏vc11_1⦎ = save_pop_thm"vc11_1";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body" "vc11_2");
a(cn_vc_simp_tac[]THEN PC_T1 "sholis"rewrite_tac[]);
val ⦏vc11_2⦎ = save_pop_thm"vc11_2";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body" "vc11_3");
a(cn_vc_simp_tac[]);
val ⦏vc11_3⦎ = save_pop_thm"vc11_3";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body" "vc11_4");
a(cn_vc_simp_tac[]);
a(⇒_T (REPEAT_TTCL ∧_THEN asm_tac));
a(POP_ASM_T ante_tac THEN PC_T1"sholis"prove_tac[]);
val ⦏vc11_4⦎ = save_pop_thm"vc11_4";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body""vc1101_1");
a(cn_vc_simp_tac[] THEN REPEAT strip_tac);
a(asm_tac (rewrite_rule[cn_ALARMSTATE1_thm]cn_ALARMSTATE_thm));
a(asm_tac (rewrite_rule[cn_TIMERSTATE1_thm]cn_TIMERSTATE_thm));
a(all_asm_fc_tac[vc902_lemma2,vc1101_lemma]);
a(all_asm_fc_tac[⊕_lemma4]);
a(lemma_tacⓩI = ATYPE ∨ I ∈ ALARMTYPEvFIRST .. ATYPE + ~ 1⌝);
(* *** Goal "1" *** *)
a(PC_T1"z_lin_arith"asm_prove_tac[]);
(* *** Goal "2" *** *)
a(all_var_elim_asm_tac1);
a(ALL_FC_T1 fc_⇔_canon rewrite_tac[cn_InactiveAlarms_thm]);
a(rewrite_tac[⊕_lemma1]);
(* *** Goal "3" *** *)
a(lemma_tacⓩI ∈ ALARMTYPE⌝);
(* *** Goal "3.1" *** *)
a(DROP_ASMS_T (MAP_EVERY ante_tac));
a(rewrite_tac[cn_ALARMTYPE_thm,cn_ALARMTYPEvFIRST_thm]);
a(REPEAT strip_tac THEN all_asm_fc_tac[z_≤_trans_thm]);
(* *** Goal "3.2" *** *)
a(lemma_tacⓩ¬I = ATYPE⌝THEN1 PC_T1"z_lin_arith"asm_prove_tac[]);
a(all_asm_fc_tac[]);
a(POP_ASM_T ante_tac);
a(ALL_FC_T1 fc_⇔_canon rewrite_tac[cn_InactiveAlarms_thm]);
a(ante_tac(z_∀_elimⓩ(STATE ≜STATE
                 ⊕ {DISPLAY
                       ↦ STATE DISPLAY
                           ⊕ {ATYPE
                                 ↦ (LEVEL ≜ (STATE DISPLAY ATYPE).LEVEL,
                                     RAISED ≜ Boolean false,
                                     REOCCURS ≜ (STATE DISPLAY ATYPE).REOCCURS)}},
TIMERS ≜ TIMERS
                 ⊕ {DISPLAY
                       ↦ TIMERS DISPLAY
                           ⊕ {ATYPE
                                 ↦ (ACTIVE ≜ Boolean false,
                                     TIMEOUT ≜ (TIMERS DISPLAY ATYPE).TIMEOUT)}},
DISPLAY ≜ DISPLAY,ATYPE ≜I)⌝cn_InactiveAlarms_thm));
a(asm_rewrite_tac[]);
a(⇒_T rewrite_thm_tac);
a(DROP_NTH_ASM_T 15 ante_tac THEN asm_rewrite_tac[] THEN ⇒_tac);
a(ALL_ASM_FC_T rewrite_tac[⊕_lemma2]);
val ⦏vc1101_1⦎ = save_pop_thm"vc1101_1";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body""vc1202_1");
a(cn_vc_simp_tac[]);
val ⦏vc1202_1⦎ = save_pop_thm"vc1202_1";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body""vc1202_2");
a(cn_vc_simp_tac[] THEN prove_tac[]);
val ⦏vc1202_2⦎ = save_pop_thm"vc1202_2";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body""vc1203_1");
a(cn_vc_simp_tac[]);
val ⦏vc1203_1⦎ = save_pop_thm"vc1203_1";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body""vc1203_2");
a(cn_vc_simp_tac[] THEN prove_tac[]);
val ⦏vc1203_2⦎ = save_pop_thm"vc1203_2";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body""vc1204_1");
a(cn_vc_simp_tac[]);
val ⦏vc1204_1⦎ = save_pop_thm"vc1204_1";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body""vc1204_2");
a(cn_vc_simp_tac[] THEN prove_tac[]);
val ⦏vc1204_2⦎ = save_pop_thm"vc1204_2";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body""vc1204_3");
a(cn_vc_simp_tac[]);
val ⦏vc1204_3⦎ = save_pop_thm"vc1204_3";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body""vc1205_1");
a(cn_vc_simp_tac[]THEN PC_T1"z_lin_arith"prove_tac[]);
val ⦏vc1205_1⦎ = save_pop_thm"vc1205_1";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body""vc1205_2");
a(cn_vc_simp_tac[]THEN PC_T1"sholis"prove_tac[]);
val ⦏vc1205_2⦎ = save_pop_thm"vc1205_2";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body""vc1205_3");
a(cn_vc_simp_tac[]);
val ⦏vc1205_3⦎ = save_pop_thm"vc1205_3";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body""vc1205_4");
a(cn_vc_simp_tac[]);
a(⇒_T (REPEAT_TTCL ∧_THEN asm_tac));
a(POP_ASM_T (rewrite_thm_tac o eq_sym_rule));
a(PC_T1"sholis"rewrite_tac[]);
val ⦏vc1205_4⦎ = save_pop_thm"vc1205_4";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body""vc120501_1");
a(cn_vc_simp_tac[]);
a(⇒_T (REPEAT_TTCL ∧_THEN asm_tac));
a(z_∃_tac⌜ATYPE⌝);
a(GET_NTH_ASM_T 3 ante_tac THEN PC_T1"sholis"prove_tac[]);
a(ALL_FC_T1 fc_⇔_canon rewrite_tac[cn_NonAcceptedAlarms_thm]);
a(POP_ASM_T ante_tac);
a(all_asm_fc_tac[vc501_lemma]);
a(ALL_ASM_FC_T rewrite_tac[cn_boolean_clauses2]);
val ⦏vc120501_1⦎ = save_pop_thm"vc120501_1";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body""vc120501_2");
a(cn_vc_simp_tac[]);
a(⇒_T (REPEAT_TTCL ∧_THEN asm_tac));
a(DROP_NTH_ASM_T 2 ante_tac);
a(cases_tacⓩNONVIEXISTS = Boolean true⌝THEN asm_rewrite_tac[]);
(* *** Goal "1" *** *)
a(REPEAT strip_tac);
a(z_∃_tacⓩI⌝THEN asm_rewrite_tac[]);
a(PC_T1 "z_lin_arith" asm_prove_tac[]);
(* *** Goal "2" *** *)
a(REPEAT strip_tac);
a(z_spec_nth_asm_tac 3 ⓩI⌝);
a(lemma_tacⓩI = ATYPE⌝ THEN1 PC_T1 "z_lin_arith" asm_prove_tac[]);
a(all_var_elim_asm_tac1);
a(ALL_FC_T1 fc_⇔_canon rewrite_tac[cn_NonAcceptedAlarms_thm]);
a(DROP_NTH_ASM_T 4 ante_tac);
a(all_asm_fc_tac[vc501_lemma]);
a(ALL_ASM_FC_T rewrite_tac[cn_boolean_clauses2]);
val ⦏vc120501_2⦎ = save_pop_thm"vc120501_2";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body" "vc1206_1");
a(cn_vc_simp_tac[]THEN prove_tac[]);
val ⦏vc1206_1⦎ = save_pop_thm"vc1206_1";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body""vc1206_2");
a(cn_vc_simp_tac[]);
a(⇒_T (REPEAT_TTCL ∧_THEN asm_tac));
a(DROP_NTH_ASM_T 2 ante_tac THEN asm_rewrite_tac[]);
val ⦏vc1206_2⦎ = save_pop_thm"vc1206_2";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body" "vc1206_3");
a(cn_vc_simp_tac[]);
val ⦏vc1206_3⦎ = save_pop_thm"vc1206_3";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body" "vc1206_4");
a(cn_vc_simp_tac[]);
val ⦏vc1206_4⦎ = save_pop_thm"vc1206_4";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body" "vc1207_1");
a(cn_vc_simp_tac[]);
val ⦏vc1207_1⦎ = save_pop_thm"vc1207_1";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body""vc1207_2");
a(cn_vc_simp_tac[]);
a(⇒_T (REPEAT_TTCL ∧_THEN asm_tac));
a(LIST_DROP_NTH_ASM_T [6,7](MAP_EVERY ante_tac) THEN REPEAT strip_tac);
a(rewrite_tac[cn_AcceptAlarm_thm]);
a(all_var_elim_asm_tac1);
a(all_asm_fc_tac[] THEN
	 asm_rewrite_tac[cn_SecondAcceptance_thm,cn_AlarmChange_thm]);
a(REPEAT strip_tac);
a(z_spec_nth_asm_tac 2 ⓩATYPE1⌝);
val ⦏vc1207_2⦎ = save_pop_thm"vc1207_2";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body" "vc120701_1");
a(cn_vc_simp_tac[]);
val ⦏vc120701_1⦎ = save_pop_thm"vc120701_1";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body" "vc120701_2");
a(cn_vc_simp_tac[]);
val ⦏vc120701_2⦎ = save_pop_thm"vc120701_2";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body" "vc120701_3");
a(cn_vc_simp_tac[]);
val ⦏vc120701_3⦎ = save_pop_thm"vc120701_3";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body" "vc120702_1");
a(cn_vc_simp_tac[]);
val ⦏vc120702_1⦎ = save_pop_thm"vc120702_1";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body" "vc120702_2");
a(cn_vc_simp_tac[]);
val ⦏vc120702_2⦎ = save_pop_thm"vc120702_2";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body""vc120703_1");
a(cn_vc_simp_tac[]);
a(⇒_T (REPEAT_TTCL ∧_THEN asm_tac));
a(asm_rewrite_tac[]);
a(PC_T1"z_lin_arith" prove_tac[]);
val ⦏vc120703_1⦎ = save_pop_thm"vc120703_1";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body" "vc120703_2");
a(cn_vc_simp_tac[]);
a(⇒_T (REPEAT_TTCL ∧_THEN asm_tac));
a(i_contr_tac THEN POP_ASM_T ante_tac);
a(PC_T1"sholis" rewrite_tac[]);
val ⦏vc120703_2⦎ = save_pop_thm"vc120703_2";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body" "vc120703_3");
a(cn_vc_simp_tac[]);
val ⦏vc120703_3⦎ = save_pop_thm"vc120703_3";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body" "vc120703_4");
a(cn_vc_simp_tac[]);
a(⇒_T (REPEAT_TTCL ∧_THEN asm_tac));
a(POP_ASM_T ante_tac THEN rewrite_tac[cn_ALARMTYPE_thm,
	cn_ALARMTYPEvFIRST_thm,cn_ALARMTYPEvLAST_thm]);
val ⦏vc120703_4⦎ = save_pop_thm"vc120703_4";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body""vc120704_1");
a(cn_vc_simp_tac[]);
a(⇒_T (REPEAT_TTCL ∧_THEN asm_tac));
a(LIST_DROP_NTH_ASM_T[1,2](MAP_EVERY discard_tac));
a(LEMMA_TⓩATYPE ∈ ATYPE .. ALARMTYPEvLAST⌝asm_tac);
(* *** Goal "1" *** *)
a(DROP_NTH_ASM_T 2 ante_tac);
a(PC_T1"sholis"prove_tac[]);
(* *** Goal "2" *** *)
a(PC_T1"z_predicates"all_asm_fc_tac[]);
a(asm_rewrite_tac[]);
val ⦏vc120704_1⦎ = save_pop_thm"vc120704_1";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body""vc120704_2");
a(cn_vc_simp_tac[]);
a(REPEAT ⇒_tac THEN ∧_tac);
(* *** Goal "1" *** *)
a(z_∀_tac THEN ⇒_T strip_asm_tac);
a(LEMMA_TⓩI ∈ ATYPE .. ALARMTYPEvLAST⌝asm_tac);
(* *** Goal "1.1" *** *)
a(PC_T1"z_lin_arith"asm_prove_tac[]);
(* *** Goal "1.2" *** *)
a(PC_T1"z_predicates"all_asm_fc_tac[]);
a(DROP_NTH_ASM_T 9(ante_tac o z_∀_elimⓩ(I ≜ I)⌝));
a(asm_rewrite_tac[]);
a(LEMMA_TⓩI ∈ ALARMTYPE ∧ ¬ I = ATYPE⌝rewrite_thm_tac);
a(LIST_DROP_NTH_ASM_T[3,5,13](MAP_EVERY ante_tac));
a(rewrite_tac[cn_ALARMTYPE_thm,cn_ALARMTYPEvLAST_thm]);
a(PC_T1"z_lin_arith"prove_tac[]);
(* *** Goal "2" *** *)
a(z_∀_tac THEN ⇒_T (REPEAT_TTCL ∧_THEN asm_tac));
a(POP_ASM_T discard_tac);
a(LEMMA_TⓩI = ATYPE ∨ I ∈ ALARMTYPEvFIRST .. ATYPE + ~ 1⌝asm_tac);
(* *** Goal "2.1" *** *)
a(PC_T1"z_lin_arith"asm_prove_tac[]);
(* *** Goal "2.2" *** *)
a(POP_ASM_T (∨_THEN asm_tac));
(* *** Goal "2.2.1" *** *)
a(all_var_elim_asm_tac1);
a(asm_rewrite_tac[]);
(* *** Goal "2.2.2" *** *)
a(PC_T1"z_predicates"all_asm_fc_tac[]);
a(DROP_NTH_ASM_T 10 discard_tac);
a(lemma_tacⓩI ∈ ALARMTYPE ∧ ¬ I = ATYPE⌝);
(* *** Goal "2.2.2.1" *** *)
a(LIST_DROP_NTH_ASM_T[4,13](MAP_EVERY ante_tac));
a(rewrite_tac[cn_ALARMTYPE_thm,cn_ALARMTYPEvFIRST_thm]);
a(PC_T1"z_lin_arith"prove_tac[]);
(* *** Goal "2.2.2.2" *** *)
a(PC_T1"z_predicates"all_asm_fc_tac[]);
a(DROP_NTH_ASM_T 13 discard_tac);
a(REPEAT strip_tac);
(* *** Goal "2.2.2.2.1" *** *)
a(LIST_DROP_NTH_ASM_T[5,6](MAP_EVERY discard_tac));
a(DROP_NTH_ASM_T 5 ante_tac THEN
	 asm_rewrite_tac[cn_FirstAcceptance_thm,cn_AlarmChange_thm]);
a(ALL_FC_T1 fc_⇔_canon asm_rewrite_tac[cn_NonAcceptedAlarms_thm,
	cn_AcceptedAlarms_thm,cn_AudioVisualFlashAlarms_thm,
	cn_WithinTimeoutAlarms_thm]);
(* *** Goal "2.2.2.2.2" *** *)
a(LIST_DROP_NTH_ASM_T[5,7](MAP_EVERY discard_tac));
a(DROP_NTH_ASM_T 5 ante_tac THEN
	 asm_rewrite_tac[cn_NoAcceptance_thm,cn_AlarmChange_thm]);
a(ALL_FC_T1 fc_⇔_canon asm_rewrite_tac[cn_NonAcceptedAlarms_thm,
	cn_AcceptedAlarms_thm]);
(* *** Goal "2.2.2.2.3" *** *)
a(LIST_DROP_NTH_ASM_T[6,7](MAP_EVERY discard_tac));
a(DROP_NTH_ASM_T 5 ante_tac
	THEN asm_rewrite_tac[cn_InactiveAcceptance_thm,
	cn_AlarmChange_thm]);
a(ALL_FC_T1 fc_⇔_canon asm_rewrite_tac[cn_InactiveAlarms_thm,
	cn_AcceptedAlarms_thm,cn_AudioVisualFlashAlarms_thm,
	cn_WithinTimeoutAlarms_thm]);
val ⦏vc120704_2⦎ = save_pop_thm"vc120704_2";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body""vc120705_1");
a(cn_vc_simp_tac[]);
a(⇒_T (REPEAT_TTCL ∧_THEN asm_tac));
a(asm_tac (rewrite_rule[cn_ALARMSTATE1_thm]cn_ALARMSTATE_thm));
a(asm_tac (rewrite_rule[cn_TIMERSTATE1_thm]cn_TIMERSTATE_thm));
a(all_asm_fc_tac[vc120705_lemma]);
a(POP_ASM_T discard_tac);
a(lemma_tacⓩ(ACTIVE ≜ Boolean true, TIMEOUT ≜ TIMEOUT) ∈ TIMERDATA⌝
	THEN1 asm_rewrite_tac[cn_TIMERDATA_thm]);
a ∧_tac;
(* *** Goal "1" *** *)
a(z_∀_tac THEN ⇒_T strip_asm_tac);
a(LIST_DROP_NTH_ASM_T [14,15] (MAP_EVERY ante_tac) THEN asm_rewrite_tac[]
	THEN REPEAT ⇒_tac);
a(ALL_ASM_FC_T rewrite_tac[⊕_lemma2]);
(* *** Goal "2" *** *)
a(all_asm_fc_tac[⊕_lemma4]);
a(LIST_DROP_NTH_ASM_T[1,3,7,8](MAP_EVERY discard_tac));
a(POP_ASM_T ante_tac THEN asm_rewrite_tac[] THEN ⇒_tac);
a(asm_rewrite_tac[cn_AlarmChange_thm,cn_InactiveAcceptance_thm,
	cn_NoAcceptance_thm,cn_FirstAcceptance_thm]);
a(ALL_FC_T1 fc_⇔_canon asm_rewrite_tac[cn_NonAcceptedAlarms_thm,
	 cn_AcceptedAlarms_thm, cn_AudioVisualFlashAlarms_thm,
	cn_WithinTimeoutAlarms_thm,cn_InactiveAlarms_thm]);
a(rewrite_tac[⊕_lemma1]);
a(REPEAT strip_tac);
val ⦏vc120705_1⦎ = save_pop_thm"vc120705_1";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body""vc120705_2");
a(cn_vc_simp_tac[]);
a(⇒_T (REPEAT_TTCL ∧_THEN asm_tac));
a(asm_tac (rewrite_rule[cn_TIMERSTATE1_thm]cn_TIMERSTATE_thm));
a(lemma_tacⓩ(ACTIVE ≜ Boolean true, TIMEOUT ≜ TIMEOUT) ∈ TIMERDATA⌝
	THEN1 asm_rewrite_tac[cn_TIMERDATA_thm]);
a ∧_tac;
(* *** Goal "1" *** *)
a(z_∀_tac THEN ⇒_T strip_asm_tac);
a(DROP_NTH_ASM_T 13 ante_tac THEN asm_rewrite_tac[] THEN ⇒_tac);
a(ALL_ASM_FC_T rewrite_tac[⊕_lemma2]);
(* *** Goal "2" *** *)
a(all_asm_fc_tac[⊕_lemma4]);
a(LIST_DROP_NTH_ASM_T[1,4](MAP_EVERY discard_tac));
a(asm_rewrite_tac[cn_AlarmChange_thm,cn_InactiveAcceptance_thm,
	cn_NoAcceptance_thm,cn_FirstAcceptance_thm]);
a(ALL_FC_T1 fc_⇔_canon asm_rewrite_tac[cn_NonAcceptedAlarms_thm,
	 cn_AcceptedAlarms_thm, cn_AudioVisualFlashAlarms_thm,
	cn_WithinTimeoutAlarms_thm,cn_InactiveAlarms_thm]);
a(rewrite_tac[⊕_lemma1]);
a(REPEAT strip_tac);
val ⦏vc120705_2⦎ = save_pop_thm"vc120705_2";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body""vc120705_3");
a(cn_vc_simp_tac[]);
a(⇒_T (REPEAT_TTCL ∧_THEN asm_tac));
a(asm_tac (rewrite_rule[cn_ALARMSTATE1_thm]cn_ALARMSTATE_thm));
a(all_asm_fc_tac[vc120705_lemma]);
a(POP_ASM_T discard_tac);
a ∧_tac;
(* *** Goal "1" *** *)
a(z_∀_tac THEN ⇒_T strip_asm_tac);
a(DROP_NTH_ASM_T 12  ante_tac THEN asm_rewrite_tac[] THEN ⇒_tac);
a(ALL_ASM_FC_T rewrite_tac[⊕_lemma2]);
(* *** Goal "2" *** *)
a(all_asm_fc_tac[⊕_lemma4]);
a(LIST_DROP_NTH_ASM_T[1,4](MAP_EVERY discard_tac));
a(POP_ASM_T ante_tac	THEN asm_rewrite_tac[] THEN ⇒_tac);
a(asm_rewrite_tac[cn_AlarmChange_thm,cn_InactiveAcceptance_thm,
	cn_NoAcceptance_thm,cn_FirstAcceptance_thm]);
a(ALL_FC_T1 fc_⇔_canon asm_rewrite_tac[cn_NonAcceptedAlarms_thm,
	 cn_AcceptedAlarms_thm, cn_AudioVisualFlashAlarms_thm,
	cn_WithinTimeoutAlarms_thm,cn_InactiveAlarms_thm]);
a(rewrite_tac[⊕_lemma1]);
a(DROP_NTH_ASM_T 4 ante_tac THEN asm_rewrite_tac[]);
a(REPEAT strip_tac);
val ⦏vc120705_3⦎ = save_pop_thm"vc120705_3";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body""vc120705_4");
a(cn_vc_simp_tac[]);
a(⇒_T (REPEAT_TTCL ∧_THEN asm_tac));
a(asm_rewrite_tac[cn_AlarmChange_thm,cn_InactiveAcceptance_thm,
	cn_NoAcceptance_thm,cn_FirstAcceptance_thm]);
a(ALL_FC_T1 fc_⇔_canon rewrite_tac[cn_NonAcceptedAlarms_thm,
	 cn_AcceptedAlarms_thm, cn_AudioVisualFlashAlarms_thm,
	cn_WithinTimeoutAlarms_thm,cn_InactiveAlarms_thm]);
a(POP_ASM_T ante_tac THEN POP_ASM_T ante_tac);
a(asm_rewrite_tac[] THEN REPEAT strip_tac);
val ⦏vc120705_4⦎ = save_pop_thm"vc120705_4";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body" "vc1208_1");
a(cn_vc_simp_tac[]);
val ⦏vc1208_1⦎ = save_pop_thm"vc1208_1";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body" "vc1208_2");
a(cn_vc_simp_tac[] THEN REPEAT strip_tac);
a(all_var_elim_asm_tac1);
a(rewrite_tac[cn_AcceptAlarm_thm]);
a(lemma_tacⓩΠ(AlarmChange)⌝ THEN1
	(rewrite_tac[cn_AlarmChange_thm] THEN REPEAT strip_tac));
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(asm_rewrite_tac[cn_FirstAcceptance_thm]);
a(ASM_FC_T rewrite_tac[]);
a(ASM_FC_T (MAP_EVERY ante_tac) []);
a(asm_rewrite_tac[cn_SecondAcceptance_thm,cn_InactiveAcceptance_thm]);
a(conv_tac (MAP_C z_¬_∃_conv));
a(PC_T1 "hol" asm_rewrite_tac[]);
a(ALL_FC_T1 fc_⇔_canon rewrite_tac
	[cn_AcceptedAlarms_thm, cn_NonAcceptedAlarms_thm, cn_InactiveAlarms_thm,
	cn_AudioVisualFlashAlarms_thm, cn_WithinTimeoutAlarms_thm]);
a(PC_T1"sholis"rewrite_tac[]);
a(cases_tacⓩ(STATE⋎0 DISPLAY ATYPE).LEVEL = 2⌝ THEN asm_rewrite_tac[]);
a(cases_tacⓩ(STATE⋎0 DISPLAY ATYPE).RAISED = Boolean false⌝
		THEN asm_rewrite_tac[]);
a(REPEAT strip_tac);
(* *** Goal "2" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "3" *** *)
a(asm_rewrite_tac[cn_NoAcceptance_thm]);
a(REPEAT strip_tac);
a(all_asm_fc_tac[]);
(* *** Goal "4" *** *)
a(all_asm_fc_tac[]);
val ⦏vc1208_2⦎ = save_pop_thm"vc1208_2";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body" "vc120801_1");
a(cn_vc_simp_tac[]);
val ⦏vc120801_1⦎ = save_pop_thm"vc120801_1";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body" "vc120801_2");
a(cn_vc_simp_tac[] THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(all_var_elim_asm_tac1);
a(rewrite_tac[cn_SecondAcceptance_thm]);
a(ASM_FC_T rewrite_tac[]);
a(rewrite_tac[cn_AlarmChange_thm]);
a(REPEAT strip_tac);
(* *** Goal "2" *** *)
a(all_var_elim_asm_tac1);
a(rewrite_tac[cn_InactiveAcceptance_thm]);
a(ASM_FC_T rewrite_tac[]);
a(rewrite_tac[cn_AlarmChange_thm]);
a(REPEAT strip_tac);
val ⦏vc120801_2⦎ = save_pop_thm"vc120801_2";
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"Alarm_body" "vc1501_1");
a(accept_tac(get_thm"-""vc1001_1"));
val ⦏vc1501_1⦎ = save_pop_thm"vc1501_1";
=TEX
\twocolumn[\section{INDEX}]
\printindex


\end{document}

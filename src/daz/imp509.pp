=IGN
********************************************************************************
imp509.doc: this file is part of the PPDaz system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% imp509.doc   ℤ $Date: 2008/02/10 15:59:51 $ $Revision: 1.21 $ $RCSfile: imp509.doc,v $
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

\def\Title{Implementation: Z Toolkit Extensions}

\def\AbstractText{This document contains the implementation for the CN parser.}

\def\Reference{ISS/HAT/DAZ/IMP509}

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
\def\Hide#1{}
\def\Bool{``$\it{:}bool\,$''}
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{DAZ PROJECT}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Implementation: Z Toolkit Extensions}  %% Mandatory field
%% LaTeX2e port: \TPPref{ISS/HAT/DAZ/IMP509}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.21 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2008/02/10 15:59:51 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{R.D.~Arthanlocation 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{D.J.~King & DAZ Team Leader}
%% LaTeX2e port: \TPPabstract{
%% LaTeX2e port: This document contains the implementation for the CN
%% LaTeX2e port: parser.}
%% LaTeX2e port: %\TPPabstractB{}
%% LaTeX2e port: %\TPPabstractC{}
%% LaTeX2e port: %\TPPabstractD{}
%% LaTeX2e port: %\TPPabstractE{}
%% LaTeX2e port: %\TPPabstractF{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	Library}}
%% LaTeX2e port: 
%% LaTeX2e port: %\TPPclass{CLASSIFICATION}
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
\subsection{Document Cross References}
\bibliographystyle{fmu}
\bibliography{fmu,daz}

\subsection{Changes History}  % to get section number `0.3'
\begin{description}

\item[Issues 1.1 (1994/12/22) - 1.3 (1994/12/22)] Initial Versions.
\item[Issue 1.4 (1996/02/22)] $intmod$, $intdiv$ and $rem$ theorems added.
\item[Issue 1.5 (1996/03/07)]
Added cn1 proof context.
\item[Issue 1.6 (1996/03/12)]
Added $cn\_boolean\_clauses1$ and $cn\_boolean\_clauses2$.
\item[Issue 1.7 (1996/03/21)]
Renaming and making public of $cn\_boolean\_\in\_boolean\_thm$
and removed $cn1$ proof context which is now to be defined in \cite{ISS/HAT/DAZ/IMP518}.
\item[Issue 1.8 (1996/03/21)]
Added $z\_succ↗n↕\_⨾\_thm$.
\item[Issue 1.9 (1999/03/07)]
Update for new INTEGER type.
\item[Issues 1.10 (2000/12/13), 1.11 (2000/12/14)]
Updates for real numbers.
\item[Issue 1.12 (2001/11/08)] R0021: new treatment of AND THEN and OR ELSE.
\item[Issue 1.13 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.14 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.15 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.16 (2004/01/19)] The Z universal set is now called 𝕌
\item[Issue 1.17 (2005/02/26)] Allowed for ISO Z precedences and associativities that {\Product} now uses.
\item[Issue 1.18 (2005/09/09)] Allowed for introduction of 𝔹 and 𝕊.
\item[Issue 1.19 (2006/04/20)] Ada real literals are now translated into Z floating point literals.
\item[Issue 1.20 (2007/08/04)] {\em z\_dots\_conv} has been renamed as {\em zz\_dot\_dot\_conv}.
\item[Issue 1.64] Allowed for change to lexical rules for underscores in Z.
\item[Issue 1.65] Modular types.
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
This document contains the implementation for the theory `cn'.
The detailed design for this material is in \cite{ISS/HAT/DAZ/DTD509}.

\subsection{Introduction}

\subsection{Purpose and Background}

\subsection{Algorithms}

\subsection{Dependencies}

\subsection{Known Deficencies}

\subsection{Possible Enhancements}
\section{PROLOGUE}
=SML
structure ⦏CNToolkitExtensions⦎ : CNToolkitExtensions = struct
=TEX
\section{THEOREMS}



=SML
val _ = set_merge_pcs["z_library", "'z_reals"];
val ⦏old_sgpq_flag⦎ = set_flag("subgoal_package_quiet", true);
=TEX
=SML
val ⦏cn_boolean_thm⦎ = (
set_goal([], ⓩBOOLEAN = {FALSE, TRUE}⌝);
a(rewrite_tac[z_get_specⓩBOOLEAN⌝,z_get_specⓩTRUE⌝,z_get_specⓩFALSE⌝]);
a(conv_tac (LEFT_C z_dot_dot_conv) THEN REPEAT strip_tac);
save_pop_thm"cn_boolean_thm"
);
=TEX
=SML
val cn_succ_thm = (
set_goal([],ⓩ∀ i, j : 𝕌 ⦁ (i,j) ∈ succ ⇒ j = i + 1⌝);
a(REPEAT strip_tac);
a(strip_asm_tac (z_get_specⓩsucc⌝));
a(all_fc_tac [z_fun_app_clauses]);
a(all_var_elim_asm_tac1);
a(lemma_tacⓩi ∈ ℕ⌝);
(* *** Goal "1" *** *)
a(PC_T1 "z_fun_ext" asm_prove_tac []);
(* *** Goal "2" *** *)
a(all_asm_fc_tac[]);
(fn _ => pop_thm()) "cn_succ_thm"
);
=TEX
=SML
val cn_succ_0_thm = (
set_goal([],ⓩsucc 0 = 1⌝);
a(asm_tac z_0_ℕ_thm);
a(strip_asm_tac (z_get_specⓩsucc⌝));
a(z_spec_asm_tac ⓩ∀ n : ℕ ⦁ succ n = n + 1⌝ ⓩ0⌝);
a(asm_rewrite_tac[]);
(fn _ => pop_thm())"cn_succ_0_thm"
);
=TEX
=SML
val cn_boolean_succ_thm = (
set_goal([], ⓩBOOLEANvSUCC = {FALSE ↦ TRUE}⌝);
a(rewrite_tac[z_get_specⓩBOOLEANvSUCC⌝]);
a(rewrite_tac[cn_boolean_thm, z_get_specⓩBOOLEANvLAST⌝]);
a(rewrite_tac[z_get_specⓩTRUE⌝,z_get_specⓩFALSE⌝]);
a(PC_T1 "z_library_ext" prove_tac[]);
(* *** Goal "1" *** *)
a(strip_asm_tac cn_succ_thm);
a(all_asm_fc_tac[]);
a(asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[]);
(* *** Goal "3" *** *)
a(all_var_elim_asm_tac1);
a(strip_asm_tac cn_succ_0_thm);
a(strip_asm_tac (z_get_specⓩsucc⌝));
a(asm_tac z_0_ℕ_thm);
a(all_asm_fc_tac[z_→_app_eq_⇔_∈_rel_thm]);
save_pop_thm"cn_boolean_succ_thm"
);
=TEX
=SML
val cn_boolean_pred_thm = (
set_goal([], ⓩBOOLEANvPRED = {TRUE ↦ FALSE}⌝);
a(rewrite_tac[z_get_specⓩBOOLEANvPRED⌝]);
a(rewrite_tac[z_get_specⓩBOOLEANvSUCC⌝]);
a(rewrite_tac[cn_boolean_thm, z_get_specⓩBOOLEANvLAST⌝]);
a(rewrite_tac[z_get_specⓩTRUE⌝,z_get_specⓩFALSE⌝]);
a(PC_T1 "z_library_ext" prove_tac[]);
(* *** Goal "1" *** *)
a(strip_asm_tac cn_succ_thm);
a(all_asm_fc_tac[]);
a(asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[]);
(* *** Goal "3" *** *)
a(all_var_elim_asm_tac1);
a(strip_asm_tac cn_succ_0_thm);
a(strip_asm_tac (z_get_specⓩsucc⌝));
a(asm_tac z_0_ℕ_thm);
a(all_asm_fc_tac[z_→_app_eq_⇔_∈_rel_thm]);
save_pop_thm"cn_boolean_pred_thm"
);
=TEX
=SML
val cn_boolean_pos_thm = (
set_goal([],ⓩBOOLEANvPOS = id BOOLEAN⌝);
a(rewrite_tac[z_get_specⓩBOOLEANvPOS⌝]);
save_pop_thm"cn_boolean_pos_thm"
);
=TEX
=SML
val cn_boolean_val_thm = (
set_goal([], ⓩBOOLEANvVAL = id BOOLEAN⌝);
a(rewrite_tac[z_get_specⓩBOOLEANvVAL⌝]);
a(rewrite_tac[cn_boolean_pos_thm]);
a(rewrite_tac[cn_boolean_thm,z_get_specⓩTRUE⌝,z_get_specⓩFALSE⌝]);
a(PC_T1 "z_library_ext" prove_tac[]);
save_pop_thm"cn_boolean_val_thm"
);
=TEX
=SML
val ⦏cn_¬_true_eq_false_thm⦎ = (
set_goal([], ⓩ¬TRUE = FALSE⌝);
a(rewrite_tac[z_get_specⓩTRUE⌝, z_get_specⓩFALSE⌝]);
save_pop_thm"cn_¬_true_eq_false_thm"
);
=TEX
=SML
val ⦏cn_boolean_cases_thm⦎ = (
set_goal([], ⓩ∀x:BOOLEAN⦁ x = TRUE ∨ x = FALSE⌝);
a(rewrite_tac[z_get_specⓩTRUE⌝, z_get_specⓩFALSE⌝, z_get_specⓩBOOLEAN⌝]);
a(REPEAT strip_tac);
a(strip_asm_tac (z_∀_elimⓩx⌝z_ℕ_cases_thm));
(* *** Goal "1" *** *)
a(all_fc_tac[z_≤_less_trans_thm]);
(* *** Goal "2" *** *)
a(all_var_elim_asm_tac1);
a(all_fc_tac[z_≤_antisym_thm]);
a(all_var_elim_asm_tac1);
a(POP_ASM_T ante_tac THEN rewrite_tac[]);
save_pop_thm"cn_boolean_cases_thm"
);
=TEX
=SML
val ⦏cn_false_true_boolean_thm⦎ = (
set_goal([], ⓩFALSE ∈ BOOLEAN ∧ TRUE ∈ BOOLEAN⌝);
a(rewrite_tac[z_get_specⓩTRUE⌝, z_get_specⓩFALSE⌝, z_get_specⓩBOOLEAN⌝]);
pop_thm()
);
=TEX
=SML
val ⦏cn_boolean_not_thm⦎ = (
set_goal([], ⓩ∀ p : 𝕌 ⦁ not Boolean p = Boolean (Π(¬p))⌝);
a(REPEAT strip_tac THEN strip_asm_tac cn_false_true_boolean_thm);
a(cases_tac ⓩp⌝ THEN asm_rewrite_tac[z_get_specⓩBoolean⌝]);
(* *** Goal "1" *** *)
a(ALL_FC_T rewrite_tac[z_get_specⓩ(not _)⌝]);
(* *** Goal "2" *** *)
a(ALL_FC_T rewrite_tac[z_get_specⓩ(not _)⌝]);
(fn _ => pop_thm())"cn_boolean_not_thm"
);
=TEX
=SML
val cn_boolean_and_thm = (
set_goal([],ⓩ∀ p, q : 𝕌 ⦁ Boolean p and Boolean q = Boolean (Π(p ∧ q))⌝);
a(REPEAT strip_tac THEN strip_asm_tac cn_false_true_boolean_thm);
a(cases_tac ⓩp⌝
    THEN cases_tac ⓩq⌝
    THEN asm_rewrite_tac[z_get_specⓩBoolean⌝]
    THEN strip_asm_tac (z_get_specⓩ(_ and _)⌝)
    THEN all_asm_fc_tac[]);
(fn _ => pop_thm())"cn_boolean_and_thm"
);
=TEX
=SML
val cn_boolean_or_thm = (
set_goal([],ⓩ∀ p, q : 𝕌 ⦁ Boolean p or Boolean q = Boolean (Π(p ∨ q))⌝);
a(REPEAT strip_tac THEN strip_asm_tac cn_false_true_boolean_thm);
a(cases_tac ⓩp⌝
    THEN cases_tac ⓩq⌝
    THEN asm_rewrite_tac[z_get_specⓩBoolean⌝]
    THEN strip_asm_tac (z_get_specⓩ(_ or _)⌝)
    THEN all_asm_fc_tac[]);
(fn _ => pop_thm())"cn_boolean_or_thm"
);
=TEX
=SML
val cn_boolean_xor_thm = (
set_goal([],ⓩ∀ p, q : 𝕌 ⦁ Boolean p xor Boolean q = Boolean (Π(¬(p ⇔ q)))⌝);
a(REPEAT strip_tac THEN strip_asm_tac cn_false_true_boolean_thm);
a(cases_tac ⓩp⌝
    THEN cases_tac ⓩq⌝
    THEN asm_rewrite_tac[z_get_specⓩBoolean⌝]
    THEN strip_asm_tac (z_get_specⓩ(_ xor _)⌝)
    THEN all_asm_fc_tac[]);
(* *** Goal "1" *** *)
a(asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[]);
(fn _ => pop_thm())"cn_boolean_xor_thm"
);
=TEX
=SML
val cn_boolean_eq_thm = (
set_goal([],ⓩ∀ p, q : 𝕌 ⦁ Boolean p = Boolean q ⇔ (p ⇔ q)⌝);
a(REPEAT_N 4 strip_tac);
a(cases_tac ⓩp⌝ THEN cases_tac ⓩq⌝);
(* *** Goal "1" *** *)
a(asm_rewrite_tac[z_get_specⓩBoolean⌝]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[z_get_specⓩBoolean⌝,cn_¬_true_eq_false_thm]);
(* *** Goal "3" *** *)
a(asm_rewrite_tac[z_get_specⓩBoolean⌝,z_get_specⓩTRUE⌝,z_get_specⓩFALSE⌝]);
(* *** Goal "4" *** *)
a(asm_rewrite_tac[z_get_specⓩBoolean⌝]);
(fn _ => pop_thm())"cn_boolean_eq_thm"
);
=TEX
=SML
val cn_boolean_clauses = (
set_goal([], ⓩTRUE = Boolean true
    ∧ FALSE = Boolean false
    ∧ (∀ p : 𝕌 ⦁ not Boolean p = Boolean (Π(¬p)))
    ∧ (∀ p, q : 𝕌 ⦁ Boolean p and Boolean q = Boolean (Π(p ∧ q)))
    ∧ (∀ p, q : 𝕌 ⦁ Boolean p or Boolean q = Boolean (Π(p ∨ q)))
    ∧ (∀ p, q : 𝕌 ⦁ Boolean p xor Boolean q = Boolean (Π(¬(p ⇔ q))))
    ∧ (∀ p, q : 𝕌 ⦁ Boolean p = Boolean q ⇔ (p ⇔ q))⌝);
a(rewrite_tac[cn_boolean_not_thm,cn_boolean_and_thm]);
a(rewrite_tac[cn_boolean_or_thm,cn_boolean_xor_thm]);
a(rewrite_tac[z_get_specⓩBoolean⌝,cn_boolean_eq_thm]);
save_pop_thm "cn_boolean_clauses"
);
=TEX
=SML
val ⦏cn_and_then_or_else_clauses⦎ = (
set_goal ([], ⓩ
	∀x, y:𝕌⦁	(x and_then y) = (x and y) ∧ (x or_else y) = (x or y)⌝);
a(rewrite_tac[z_get_specⓩ(_ and_then _)⌝]);
save_pop_thm "cn_and_then_or_else_clauses"
);
=TEX
=SML
val cn_boolean_∈_boolean_thm = (
set_goal([],ⓩ∀ x : 𝕌 ⦁ Boolean x ∈ BOOLEAN⌝);
a(REPEAT strip_tac);
a(strip_asm_tac(rewrite_rule[z_get_specⓩ𝔹⌝](z_get_specⓩBoolean⌝)));
a(LEMMA_T ⓩx ∈ 𝕌⌝ asm_tac);
(* *** Goal "1" *** *)
a(prove_tac[]);
(* *** Goal "2" *** *)
a(all_asm_fc_tac[z_fun_dom_clauses]);
a(all_asm_fc_tac[z_fun_∈_clauses]);
save_pop_thm "cn_boolean_∈_boolean_thm"
);
=TEX
=SML
val cn_mem_def_thm = (
set_goal([],ⓩ∀ x : 𝕌; S : ℙ 𝕌 ⦁ x mem S = TRUE ⇔ x ∈ S⌝);
a(lemma_tacⓩTRUE ∈ BOOLEAN⌝);
(* *** Goal "1" *** *)
a(rewrite_tac[cn_false_true_boolean_thm]);
(* *** Goal "2" *** *)
a(strip_asm_tac (z_gen_pred_elim[ⓩ𝕌⌝](z_get_specⓩ(_ mem _)⌝)));
a(REPEAT strip_tac);
(* *** Goal "2.1" *** *)
a(LEMMA_T ⓩx ∈ 𝕌⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⓩy ∈ 𝕌⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⓩS ∈ ℙ 𝕌⌝ asm_tac THEN1 prove_tac[]);
a(eq_sym_asm_tacⓩx mem S = TRUE⌝);
a(z_spec_nth_asm_tac 5 ⓩ(x≜x,y≜y,S≜S,b≜TRUE)⌝);
(* *** Goal "2.2" *** *)
a(LEMMA_T ⓩx ∈ 𝕌⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⓩy ∈ 𝕌⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⓩS ∈ ℙ 𝕌⌝ asm_tac THEN1 prove_tac[]);
a(swap_nth_asm_concl_tac 1);
a(eq_sym_asm_tacⓩ¬ x mem S = TRUE⌝);
a(swap_nth_asm_concl_tac 1);
a(z_spec_nth_asm_tac 4 ⓩ(x≜x,y≜y,S≜S,b≜TRUE)⌝);
(fn _ => pop_thm()) "cn_mem_def_thm"
);
=TEX
=SML
val cn_mem_boolean_thm = (
set_goal([],ⓩ∀ x : 𝕌; S : 𝕌 ⦁ x mem S = Boolean (x ∈ S)⌝);
a(REPEAT strip_tac);
a(cases_tac ⓩx ∈ S⌝);
(* *** Goal "1" *** *)
a(asm_rewrite_tac[z_get_specⓩBoolean⌝]);
a(strip_asm_tac cn_mem_def_thm);
a(z_spec_nth_asm_tac 1 ⓩ(x≜x,S≜S)⌝);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[z_get_specⓩBoolean⌝]);
a(strip_asm_tac cn_mem_def_thm);
a(swap_nth_asm_concl_tac 2);
a(z_spec_nth_asm_tac 2 ⓩ(x≜x,S≜S)⌝);
a(lemma_tacⓩx mem S ∈ BOOLEAN⌝);
(* *** Goal "2.1" *** *)
a(DROP_ASMS_T discard_tac);
a(strip_asm_tac (z_gen_pred_elim[ⓩ𝕌⌝](z_get_specⓩ(_ mem _)⌝)));
a(LIST_DROP_NTH_ASM_T [1,2,3,4] discard_tac);
a(LEMMA_T ⓩx ∈ 𝕌⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⓩS ∈ ℙ 𝕌⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⓩ(x,S) ∈ 𝕌 × ℙ 𝕌⌝ asm_tac THEN1 prove_tac[]);
a(all_asm_fc_tac[z_→_app_thm]);
(* *** Goal "2.2" *** *)
a(strip_asm_tac(z_∀_elimⓩx mem S⌝cn_boolean_cases_thm));
(fn _ => pop_thm()) "cn_mem_boolean_thm"
);
=TEX
=SML
val cn_notmem_def_thm = (
set_goal([],ⓩ∀ x : 𝕌; S : ℙ 𝕌 ⦁ x notmem S = TRUE ⇔ x ∉ S⌝);
a(lemma_tacⓩTRUE ∈ BOOLEAN⌝);
(* *** Goal "1" *** *)
a(rewrite_tac[cn_false_true_boolean_thm]);
(* *** Goal "2" *** *)
a(strip_asm_tac (z_gen_pred_elim[ⓩ𝕌⌝](z_get_specⓩ(_ notmem _)⌝)));
a(REPEAT_N 7 strip_tac);
(* *** Goal "2.1" *** *)
a(LEMMA_T ⓩx ∈ 𝕌⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⓩy ∈ 𝕌⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⓩS ∈ ℙ 𝕌⌝ asm_tac THEN1 prove_tac[]);
a(eq_sym_asm_tacⓩx notmem S = TRUE⌝);
a(z_spec_nth_asm_tac 5 ⓩ(x≜x,y≜y,S≜S,b≜TRUE)⌝
    THEN asm_rewrite_tac[]);
(* *** Goal "2.2" *** *)
a(LEMMA_T ⓩx ∈ 𝕌⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⓩy ∈ 𝕌⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⓩS ∈ ℙ 𝕌⌝ asm_tac THEN1 prove_tac[]);
a(swap_nth_asm_concl_tac 1);
a(eq_sym_asm_tacⓩ¬ x notmem S = TRUE⌝);
a(swap_nth_asm_concl_tac 1);
a(z_spec_nth_asm_tac 4 ⓩ(x≜x,y≜y,S≜S,b≜TRUE)⌝);
(fn _ => pop_thm()) "cn_notmem_def_thm"
);
=TEX
=SML
val cn_notmem_boolean_thm = (
set_goal([],ⓩ∀ x : 𝕌; S : 𝕌 ⦁ x notmem S = Boolean (Π(¬x ∈ S))⌝);
a(REPEAT strip_tac);
a(cases_tac ⓩ¬x ∈ S⌝);
(* *** Goal "1" *** *)
a(asm_rewrite_tac[z_get_specⓩBoolean⌝]);
a(strip_asm_tac cn_notmem_def_thm);
a(z_spec_nth_asm_tac 1 ⓩ(x≜x,S≜S)⌝);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[z_get_specⓩBoolean⌝]);
a(strip_asm_tac cn_notmem_def_thm);
a(swap_nth_asm_concl_tac 2);
a(z_spec_nth_asm_tac 2 ⓩ(x≜x,S≜S)⌝);
a(lemma_tacⓩx notmem S ∈ BOOLEAN⌝);
(* *** Goal "2.1" *** *)
a(DROP_ASMS_T discard_tac);
a(strip_asm_tac (z_gen_pred_elim[ⓩ𝕌⌝](z_get_specⓩ(_ mem _)⌝)));
a(LIST_DROP_NTH_ASM_T [1,2,3,5] discard_tac);
a(LEMMA_T ⓩx ∈ 𝕌⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⓩS ∈ ℙ 𝕌⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⓩ(x,S) ∈ 𝕌 × ℙ 𝕌⌝ asm_tac THEN1 prove_tac[]);
a(all_asm_fc_tac[z_→_app_thm]);
(* *** Goal "2.2" *** *)
a(strip_asm_tac(z_∀_elimⓩx notmem S⌝cn_boolean_cases_thm));
(fn _ => pop_thm()) "cn_notmem_boolean_thm"
);
=TEX
=SML
val cn_eq_def_thm = (
set_goal([],ⓩ∀ x : 𝕌; y : 𝕌 ⦁ x eq y = TRUE ⇔ x = y⌝);
a(lemma_tacⓩTRUE ∈ BOOLEAN⌝
    THEN1 asm_rewrite_tac[cn_false_true_boolean_thm]);
a(strip_asm_tac (z_gen_pred_elim[ⓩ𝕌⌝](z_get_specⓩ(_ eq _)⌝)));
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(LEMMA_T ⓩx ∈ 𝕌⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⓩy ∈ 𝕌⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⓩS ∈ ℙ 𝕌⌝ asm_tac THEN1 prove_tac[]);
a(eq_sym_asm_tacⓩx eq y = TRUE⌝);
a(z_spec_nth_asm_tac 5 ⓩ(x≜x,y≜y,S≜S,b≜TRUE)⌝);
(* *** Goal "2" *** *)
a(swap_nth_asm_concl_tac 1);
a(eq_sym_asm_tacⓩ¬ x eq y = TRUE⌝);
a(swap_nth_asm_concl_tac 1);
a(LEMMA_T ⓩx ∈ 𝕌⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⓩy ∈ 𝕌⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⓩS ∈ ℙ 𝕌⌝ asm_tac THEN1 prove_tac[]);
a(z_spec_nth_asm_tac 5 ⓩ(x≜x,y≜y,S≜S,b≜TRUE)⌝);
(fn _ => pop_thm()) "cn_eq_def_thm"
);
=TEX
=SML
val cn_eq_boolean_thm = (
set_goal([],ⓩ∀ x, y : 𝕌 ⦁ x eq y = Boolean (x = y)⌝);
a(REPEAT strip_tac);
a(cases_tac ⓩx = y⌝);
(* *** Goal "1" *** *)
a(asm_rewrite_tac[z_get_specⓩBoolean⌝]);
a(strip_asm_tac cn_eq_def_thm);
a(z_spec_nth_asm_tac 1 ⓩ(x≜x,y≜y)⌝);
a(asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[z_get_specⓩBoolean⌝]);
a(strip_asm_tac cn_eq_def_thm);
a(swap_nth_asm_concl_tac 2);
a(z_spec_nth_asm_tac 2 ⓩ(x≜x,y≜y)⌝);
a(lemma_tacⓩx eq y ∈ BOOLEAN⌝);
(* *** Goal "2.1" *** *)
a(DROP_ASMS_T discard_tac);
a(strip_asm_tac (z_gen_pred_elim[ⓩ𝕌⌝](z_get_specⓩ(_ eq _)⌝)));
a(LIST_DROP_NTH_ASM_T [1,2,4,5] discard_tac);
a(LEMMA_T ⓩx ∈ 𝕌⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⓩy ∈ 𝕌⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⓩ(x,y) ∈ 𝕌 × 𝕌⌝ asm_tac THEN1 prove_tac[]);
a(all_asm_fc_tac[z_→_app_thm]);
(* *** Goal "2.2" *** *)
a(strip_asm_tac(z_∀_elimⓩx eq y⌝cn_boolean_cases_thm));
(fn _ => pop_thm()) "cn_eq_boolean_thm"
);
=TEX
=SML
val cn_noteq_def_thm = (
set_goal([],ⓩ∀ x : 𝕌; y : 𝕌 ⦁ x noteq y = TRUE ⇔ x ≠ y⌝);
a(lemma_tacⓩTRUE ∈ BOOLEAN⌝
    THEN rewrite_tac[cn_false_true_boolean_thm]);
a(strip_asm_tac (z_gen_pred_elim[ⓩ𝕌⌝](z_get_specⓩ(_ noteq _)⌝)));
a(REPEAT_N 7 strip_tac);
(* *** Goal "1" *** *)
a(LEMMA_T ⓩx ∈ 𝕌⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⓩy ∈ 𝕌⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⓩS ∈ ℙ 𝕌⌝ asm_tac THEN1 prove_tac[]);
a(eq_sym_asm_tacⓩx noteq y = TRUE⌝);
a(z_spec_nth_asm_tac 5 ⓩ(x≜x,y≜y,S≜S,b≜TRUE)⌝
    THEN asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(swap_nth_asm_concl_tac 1);
a(eq_sym_asm_tacⓩ¬ x noteq y = TRUE⌝);
a(swap_nth_asm_concl_tac 1);
a(LEMMA_T ⓩx ∈ 𝕌⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⓩy ∈ 𝕌⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⓩS ∈ ℙ 𝕌⌝ asm_tac THEN1 prove_tac[]);
a(z_spec_nth_asm_tac 5 ⓩ(x≜x,y≜y,S≜S,b≜TRUE)⌝);
(fn _ => pop_thm()) "cn_noteq_def_thm"
);
=TEX
=SML
val cn_noteq_boolean_thm = (
set_goal([],ⓩ∀ x, y : 𝕌 ⦁ x noteq y = Boolean (Π(¬x = y))⌝);
a(REPEAT strip_tac);
a(cases_tac ⓩ¬x = y⌝);
(* *** Goal "1" *** *)
a(asm_rewrite_tac[z_get_specⓩBoolean⌝]);
a(strip_asm_tac cn_noteq_def_thm);
a(z_spec_nth_asm_tac 1 ⓩ(x≜x,y≜y)⌝);
(* *** Goal "2" *** *)
a(all_var_elim_asm_tac1);
a(asm_rewrite_tac[z_get_specⓩBoolean⌝]);
a(strip_asm_tac cn_noteq_def_thm);
a(z_spec_nth_asm_tac 1 ⓩ(x≜y,y≜y)⌝);
a(contr_tac);
a(lemma_tacⓩy noteq y ∈ BOOLEAN⌝);
(* *** Goal "2.1" *** *)
a(DROP_ASMS_T discard_tac);
a(strip_asm_tac (z_gen_pred_elim[ⓩ𝕌⌝](z_get_specⓩ(_ noteq _)⌝)));
a(LIST_DROP_NTH_ASM_T [1,3,4,5] discard_tac);
a(LEMMA_T ⓩy ∈ 𝕌⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⓩ(y,y) ∈ 𝕌 × 𝕌⌝ asm_tac THEN1 prove_tac[]);
a(all_asm_fc_tac[z_→_app_thm]);
(* *** Goal "2.2" *** *)
a(strip_asm_tac(z_∀_elimⓩy noteq y⌝cn_boolean_cases_thm));
(fn _ => pop_thm()) "cn_noteq_boolean_thm"
);
=TEX
=SML
val cn_less_def_thm = (
set_goal([],ⓩ∀ x : ℤ; y : ℤ ⦁ x less y = TRUE ⇔ x < y⌝);
a(lemma_tacⓩTRUE ∈ BOOLEAN⌝
    THEN1 rewrite_tac[cn_false_true_boolean_thm]);
a(strip_asm_tac(z_get_specⓩ(_ less _)⌝));
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(eq_sym_asm_tacⓩx less y = TRUE⌝);
a(z_spec_nth_asm_tac 2 ⓩ(x≜x,y≜y,b≜TRUE)⌝);
(* *** Goal "2" *** *)
a(swap_nth_asm_concl_tac 1);
a(eq_sym_asm_tacⓩ¬ x less y = TRUE⌝);
a(swap_nth_asm_concl_tac 1);
a(DROP_NTH_ASM_T 2 (ante_tac o z_∀_elim ⓩ(x≜x,y≜y,b≜TRUE)⌝));
a(asm_rewrite_tac[]);
a(taut_tac);
(fn _ => pop_thm()) "cn_less_def_thm"
);
=TEX
=SML
val cn_less_eq_def_thm = (
set_goal([],ⓩ∀ x : ℤ; y : ℤ ⦁ x less_eq y = TRUE ⇔ x ≤ y⌝);
a(lemma_tacⓩTRUE ∈ BOOLEAN⌝
    THEN1 rewrite_tac[cn_false_true_boolean_thm]);
a(strip_asm_tac(z_get_specⓩ(_ less_eq _)⌝));
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(eq_sym_asm_tacⓩx less_eq y = TRUE⌝);
a(z_spec_nth_asm_tac 2 ⓩ(x≜x,y≜y,b≜TRUE)⌝);
(* *** Goal "2" *** *)
a(swap_nth_asm_concl_tac 1);
a(eq_sym_asm_tacⓩ¬ x less_eq y = TRUE⌝);
a(swap_nth_asm_concl_tac 1);
a(DROP_NTH_ASM_T 2 (ante_tac o z_∀_elim ⓩ(x≜x,y≜y,b≜TRUE)⌝));
a(asm_rewrite_tac[]);
a(taut_tac);
(fn _ => pop_thm()) "cn_less_eq_def_thm"
);
=TEX
=SML
val cn_greater_def_thm = (
set_goal([],ⓩ∀ x : ℤ; y : ℤ ⦁ x greater y = TRUE ⇔ x > y⌝);
a(lemma_tacⓩTRUE ∈ BOOLEAN⌝
    THEN1 rewrite_tac[cn_false_true_boolean_thm]);
a(strip_asm_tac(z_get_specⓩ(_ greater _)⌝));
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(eq_sym_asm_tacⓩx greater y = TRUE⌝);
a(z_spec_nth_asm_tac 2 ⓩ(x≜x,y≜y,b≜TRUE)⌝);
(* *** Goal "2" *** *)
a(swap_nth_asm_concl_tac 1);
a(eq_sym_asm_tacⓩ¬ x greater y = TRUE⌝);
a(swap_nth_asm_concl_tac 1);
a(DROP_NTH_ASM_T 2 (ante_tac o z_∀_elim ⓩ(x≜x,y≜y,b≜TRUE)⌝));
a(asm_rewrite_tac[]);
a(taut_tac);
(fn _ => pop_thm()) "cn_greater_def_thm"
);
=TEX
=SML
val cn_greater_eq_def_thm = (
set_goal([],ⓩ∀ x : ℤ; y : ℤ ⦁ x greater_eq y = TRUE ⇔ x ≥ y⌝);
a(lemma_tacⓩTRUE ∈ BOOLEAN⌝
    THEN1 rewrite_tac[cn_false_true_boolean_thm]);
a(strip_asm_tac(z_get_specⓩ(_ greater_eq _)⌝));
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(eq_sym_asm_tacⓩx greater_eq y = TRUE⌝);
a(z_spec_nth_asm_tac 2 ⓩ(x≜x,y≜y,b≜TRUE)⌝);
(* *** Goal "2" *** *)
a(swap_nth_asm_concl_tac 1);
a(eq_sym_asm_tacⓩ¬ x greater_eq y = TRUE⌝);
a(swap_nth_asm_concl_tac 1);
a(DROP_NTH_ASM_T 2 (ante_tac o z_∀_elim ⓩ(x≜x,y≜y,b≜TRUE)⌝));
a(asm_rewrite_tac[]);
a(taut_tac);
(fn _ => pop_thm()) "cn_greater_eq_def_thm"
);
=TEX
=SML
val cn_real_less_def_thm = (
set_goal([],ⓩ∀ x : 𝕌; y : 𝕌 ⦁ x real_less y = TRUE ⇔ x <⋎R y⌝);
a(lemma_tacⓩTRUE ∈ BOOLEAN⌝
    THEN1 rewrite_tac[cn_false_true_boolean_thm]);
a(strip_asm_tac(z_get_specⓩ(_ real_less _)⌝));
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(eq_sym_asm_tacⓩx real_less y = TRUE⌝);
a(z_spec_nth_asm_tac 2 ⓩ(x≜x,y≜y,b≜TRUE)⌝);
(* *** Goal "2" *** *)
a(swap_nth_asm_concl_tac 1);
a(eq_sym_asm_tacⓩ¬ x real_less y = TRUE⌝);
a(swap_nth_asm_concl_tac 1);
a(DROP_NTH_ASM_T 2 (ante_tac o z_∀_elim ⓩ(x≜x,y≜y,b≜TRUE)⌝));
a(asm_rewrite_tac[]);
a(taut_tac);
(fn _ => pop_thm()) "cn_real_less_def_thm"
);
=TEX
=SML
val cn_real_less_eq_def_thm = (
set_goal([],ⓩ∀ x : 𝕌; y : 𝕌 ⦁ x real_less_eq y = TRUE ⇔ x ≤⋎R y⌝);
a(lemma_tacⓩTRUE ∈ BOOLEAN⌝
    THEN1 rewrite_tac[cn_false_true_boolean_thm]);
a(strip_asm_tac(z_get_specⓩ(_ real_less_eq _)⌝));
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(eq_sym_asm_tacⓩx real_less_eq y = TRUE⌝);
a(z_spec_nth_asm_tac 2 ⓩ(x≜x,y≜y,b≜TRUE)⌝);
(* *** Goal "2" *** *)
a(swap_nth_asm_concl_tac 1);
a(eq_sym_asm_tacⓩ¬ x real_less_eq y = TRUE⌝);
a(swap_nth_asm_concl_tac 1);
a(DROP_NTH_ASM_T 2 (ante_tac o z_∀_elim ⓩ(x≜x,y≜y,b≜TRUE)⌝));
a(asm_rewrite_tac[]);
a(taut_tac);
(fn _ => pop_thm()) "cn_real_less_eq_def_thm"
);
=TEX
=SML
val cn_real_greater_def_thm = (
set_goal([],ⓩ∀ x : 𝕌; y : 𝕌 ⦁ x real_greater y = TRUE ⇔ x >⋎R y⌝);
a(lemma_tacⓩTRUE ∈ BOOLEAN⌝
    THEN1 rewrite_tac[cn_false_true_boolean_thm]);
a(strip_asm_tac(z_get_specⓩ(_ real_greater _)⌝));
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(eq_sym_asm_tacⓩx real_greater y = TRUE⌝);
a(z_spec_nth_asm_tac 2 ⓩ(x≜x,y≜y,b≜TRUE)⌝);
(* *** Goal "2" *** *)
a(swap_nth_asm_concl_tac 1);
a(eq_sym_asm_tacⓩ¬ x real_greater y = TRUE⌝);
a(swap_nth_asm_concl_tac 1);
a(DROP_NTH_ASM_T 2 (ante_tac o z_∀_elim ⓩ(x≜x,y≜y,b≜TRUE)⌝));
a(asm_rewrite_tac[]);
a(taut_tac);
(fn _ => pop_thm()) "cn_real_greater_def_thm"
);
=TEX
=SML
val cn_real_greater_eq_def_thm = (
set_goal([],ⓩ∀ x : 𝕌; y : 𝕌 ⦁ x real_greater_eq y = TRUE ⇔ x ≥⋎R y⌝);
a(lemma_tacⓩTRUE ∈ BOOLEAN⌝
    THEN1 rewrite_tac[cn_false_true_boolean_thm]);
a(strip_asm_tac(z_get_specⓩ(_ real_greater_eq _)⌝));
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(eq_sym_asm_tacⓩx real_greater_eq y = TRUE⌝);
a(z_spec_nth_asm_tac 2 ⓩ(x≜x,y≜y,b≜TRUE)⌝);
(* *** Goal "2" *** *)
a(swap_nth_asm_concl_tac 1);
a(eq_sym_asm_tacⓩ¬ x real_greater_eq y = TRUE⌝);
a(swap_nth_asm_concl_tac 1);
a(DROP_NTH_ASM_T 2 (ante_tac o z_∀_elim ⓩ(x≜x,y≜y,b≜TRUE)⌝));
a(asm_rewrite_tac[]);
a(taut_tac);
(fn _ => pop_thm()) "cn_real_greater_eq_def_thm"
);
=TEX
=SML
val cn_less_boolean_thm = (
set_goal([],ⓩ∀ x, y : 𝕌 ⦁ x less y = Boolean (x < y)⌝);
a(REPEAT strip_tac);
a(PC_T1 "z_predicates" cases_tac ⓩx < y⌝);
(* *** Goal "1" *** *)
a(asm_rewrite_tac[z_get_specⓩBoolean⌝]);
a(strip_asm_tac cn_less_def_thm);
a(DROP_NTH_ASM_T 1 (ante_tac o z_∀_elim ⓩ(x≜x,y≜y)⌝));
a(asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[z_get_specⓩBoolean⌝]);
a(strip_asm_tac cn_less_def_thm);
a(swap_nth_asm_concl_tac 2);
a(z_spec_nth_asm_tac 2 ⓩ(x≜x,y≜y)⌝);
a(lemma_tacⓩx less y ∈ BOOLEAN⌝);
(* *** Goal "2.1" *** *)
a(DROP_ASMS_T discard_tac);
a(strip_asm_tac (z_get_specⓩ(_ less _)⌝));
a(LIST_DROP_NTH_ASM_T [1,2,3,4] discard_tac);
a(LEMMA_T ⓩx ∈ ℤ⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⓩy ∈ ℤ⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⓩ(x,y)∈ ℤ × ℤ⌝ asm_tac THEN1 prove_tac[]);
a(all_asm_fc_tac[z_→_app_thm]);
(* *** Goal "2.2" *** *)
a(strip_asm_tac(z_∀_elimⓩx less y⌝cn_boolean_cases_thm));
(fn _ => pop_thm()) "cn_less_boolean_thm"
);
=TEX
=SML
val cn_less_eq_boolean_thm = (
set_goal([],ⓩ∀ x, y : 𝕌 ⦁ x less_eq y = Boolean (x ≤ y)⌝);
a(REPEAT strip_tac);
a(PC_T1 "z_predicates" cases_tac ⓩx ≤ y⌝);
(* *** Goal "1" *** *)
a(asm_rewrite_tac[z_get_specⓩBoolean⌝]);
a(strip_asm_tac cn_less_eq_def_thm);
a(DROP_NTH_ASM_T 1 (ante_tac o z_∀_elim ⓩ(x≜x,y≜y)⌝));
a(asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[z_get_specⓩBoolean⌝]);
a(strip_asm_tac cn_less_eq_def_thm);
a(swap_nth_asm_concl_tac 2);
a(z_spec_nth_asm_tac 2 ⓩ(x≜x,y≜y)⌝);
a(lemma_tacⓩx less_eq y ∈ BOOLEAN⌝);
(* *** Goal "2.1" *** *)
a(DROP_ASMS_T discard_tac);
a(strip_asm_tac (z_get_specⓩ(_ less_eq _)⌝));
a(LIST_DROP_NTH_ASM_T [1,2,3,5] discard_tac);
a(LEMMA_T ⓩx ∈ ℤ⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⓩy ∈ ℤ⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⓩ(x,y)∈ ℤ × ℤ⌝ asm_tac THEN1 prove_tac[]);
a(all_asm_fc_tac[z_→_app_thm]);
(* *** Goal "2.2" *** *)
a(strip_asm_tac(z_∀_elimⓩx less_eq y⌝cn_boolean_cases_thm));
(fn _ => pop_thm()) "cn_less_eq_boolean_thm"
);
=TEX
=SML
val cn_greater_boolean_thm = (
set_goal([],ⓩ∀ x, y : 𝕌 ⦁ x greater y = Boolean (x > y)⌝);
a(REPEAT strip_tac);
a(PC_T1 "z_predicates" cases_tac ⓩx > y⌝);
(* *** Goal "1" *** *)
a(asm_rewrite_tac[z_get_specⓩBoolean⌝]);
a(strip_asm_tac cn_greater_def_thm);
a(DROP_NTH_ASM_T 1 (ante_tac o z_∀_elim ⓩ(x≜x,y≜y)⌝));
a(asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[z_get_specⓩBoolean⌝]);
a(strip_asm_tac cn_greater_def_thm);
a(swap_nth_asm_concl_tac 2);
a(DROP_NTH_ASM_T 2 (ante_tac o z_∀_elim ⓩ(x≜x,y≜y)⌝));
a(asm_rewrite_tac[]);
a(REPEAT strip_tac);
a(lemma_tacⓩx greater y ∈ BOOLEAN⌝);
(* *** Goal "2.1" *** *)
a(DROP_ASMS_T discard_tac);
a(strip_asm_tac (z_get_specⓩ(_ greater _)⌝));
a(LIST_DROP_NTH_ASM_T [1,2,4,5] discard_tac);
a(LEMMA_T ⓩx ∈ ℤ⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⓩy ∈ ℤ⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⓩ(x,y)∈ ℤ × ℤ⌝ asm_tac THEN1 prove_tac[]);
a(all_asm_fc_tac[z_→_app_thm]);
(* *** Goal "2.2" *** *)
a(strip_asm_tac(z_∀_elimⓩx greater y⌝cn_boolean_cases_thm));
(fn _ => pop_thm()) "cn_greater_boolean_thm"
);
=TEX
=SML
val cn_greater_eq_boolean_thm = (
set_goal([],ⓩ∀ x, y : 𝕌 ⦁ x greater_eq y = Boolean (x ≥ y)⌝);
a(REPEAT strip_tac);
a(PC_T1 "z_predicates" cases_tac ⓩx ≥ y⌝);
(* *** Goal "1" *** *)
a(asm_rewrite_tac[z_get_specⓩBoolean⌝]);
a(strip_asm_tac cn_greater_eq_def_thm);
a(DROP_NTH_ASM_T 1 (ante_tac o z_∀_elim ⓩ(x≜x,y≜y)⌝));
a(asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[z_get_specⓩBoolean⌝]);
a(strip_asm_tac cn_greater_eq_def_thm);
a(swap_nth_asm_concl_tac 2);
a(DROP_NTH_ASM_T 2 (ante_tac o z_∀_elim ⓩ(x≜x,y≜y)⌝));
a(asm_rewrite_tac[]);
a(REPEAT strip_tac);
a(lemma_tacⓩx greater_eq y ∈ BOOLEAN⌝);
(* *** Goal "2.1" *** *)
a(DROP_ASMS_T discard_tac);
a(strip_asm_tac (z_get_specⓩ(_ greater_eq _)⌝));
a(LIST_DROP_NTH_ASM_T [1,3,4,5] discard_tac);
a(LEMMA_T ⓩx ∈ ℤ⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⓩy ∈ ℤ⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⓩ(x,y)∈ ℤ × ℤ⌝ asm_tac THEN1 prove_tac[]);
a(all_asm_fc_tac[z_→_app_thm]);
(* *** Goal "2.2" *** *)
a(strip_asm_tac(z_∀_elimⓩx greater_eq y⌝cn_boolean_cases_thm));
(fn _ => pop_thm()) "cn_greater_eq_boolean_thm"
);
=TEX
=SML
val cn_relational_clauses = (
set_goal([], ⓩ(∀ x : 𝕌; S : 𝕌 ⦁ x mem S = Boolean (x ∈ S))
    ∧ (∀ x : 𝕌; S : 𝕌 ⦁ x notmem S = Boolean (Π(¬x ∈ S)))
    ∧ (∀ x, y : 𝕌 ⦁ x eq y = Boolean (x = y))
    ∧ (∀ x, y : 𝕌 ⦁ x noteq y = Boolean (Π(¬x = y)))
    ∧ (∀ x, y : 𝕌 ⦁ x less y = Boolean (x < y))
    ∧ (∀ x, y : 𝕌 ⦁ x less_eq y = Boolean (x ≤ y))
    ∧ (∀ x, y : 𝕌 ⦁ x greater y = Boolean (x > y))
    ∧ (∀ x, y : 𝕌 ⦁ x greater_eq y = Boolean (x ≥ y))⌝);
a(REPEAT strip_tac);
a(rewrite_tac[cn_mem_boolean_thm]);
a(rewrite_tac[cn_notmem_boolean_thm]);
a(rewrite_tac[cn_eq_boolean_thm]);
a(rewrite_tac[cn_noteq_boolean_thm]);
a(rewrite_tac[cn_less_boolean_thm]);
a(rewrite_tac[cn_less_eq_boolean_thm]);
a(rewrite_tac[cn_greater_boolean_thm]);
a(rewrite_tac[cn_greater_eq_boolean_thm]);
save_pop_thm"cn_relational_clauses"
);
=TEX
=SML
=TEX
=SML
val cn_real_less_boolean_thm = (
set_goal([],ⓩ∀ x, y : 𝕌 ⦁ x real_less y = Boolean (x <⋎R y)⌝);
a(REPEAT strip_tac);
a(PC_T1 "z_predicates" cases_tac ⓩx <⋎R y⌝);
(* *** Goal "1" *** *)
a(asm_rewrite_tac[z_get_specⓩBoolean⌝]);
a(strip_asm_tac cn_real_less_def_thm);
a(DROP_NTH_ASM_T 1 (ante_tac o z_∀_elim ⓩ(x≜x,y≜y)⌝));
a(asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[z_get_specⓩBoolean⌝]);
a(strip_asm_tac cn_real_less_def_thm);
a(swap_nth_asm_concl_tac 2);
a(z_spec_nth_asm_tac 2 ⓩ(x≜x,y≜y)⌝);
a(lemma_tacⓩx real_less y ∈ BOOLEAN⌝);
(* *** Goal "2.1" *** *)
a(DROP_ASMS_T discard_tac);
a(strip_asm_tac (z_get_specⓩ(_ real_less _)⌝));
a(LIST_DROP_NTH_ASM_T [1,2,3,4] discard_tac);
a(LEMMA_T ⓩx ∈ ℝ⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⓩy ∈ ℝ⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⓩ(x,y)∈ ℝ × ℝ⌝ asm_tac THEN1 prove_tac[]);
a(all_asm_fc_tac[z_→_app_thm]);
(* *** Goal "2.2" *** *)
a(strip_asm_tac(z_∀_elimⓩx real_less y⌝cn_boolean_cases_thm));
(fn _ => pop_thm()) "cn_real_less_boolean_thm"
);
=TEX
=SML
val cn_real_less_eq_boolean_thm = (
set_goal([],ⓩ∀ x, y : 𝕌 ⦁ x real_less_eq y = Boolean (x ≤⋎R y)⌝);
a(REPEAT strip_tac);
a(PC_T1 "z_predicates" cases_tac ⓩx ≤⋎R y⌝);
(* *** Goal "1" *** *)
a(asm_rewrite_tac[z_get_specⓩBoolean⌝]);
a(strip_asm_tac cn_real_less_eq_def_thm);
a(DROP_NTH_ASM_T 1 (ante_tac o z_∀_elim ⓩ(x≜x,y≜y)⌝));
a(asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[z_get_specⓩBoolean⌝]);
a(strip_asm_tac cn_real_less_eq_def_thm);
a(swap_nth_asm_concl_tac 2);
a(z_spec_nth_asm_tac 2 ⓩ(x≜x,y≜y)⌝);
a(lemma_tacⓩx real_less_eq y ∈ BOOLEAN⌝);
(* *** Goal "2.1" *** *)
a(DROP_ASMS_T discard_tac);
a(strip_asm_tac (z_get_specⓩ(_ real_less_eq _)⌝));
a(LIST_DROP_NTH_ASM_T [1,2,3,5] discard_tac);
a(LEMMA_T ⓩx ∈ ℝ⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⓩy ∈ ℝ⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⓩ(x,y)∈ ℝ × ℝ⌝ asm_tac THEN1 prove_tac[]);
a(all_asm_fc_tac[z_→_app_thm]);
(* *** Goal "2.2" *** *)
a(strip_asm_tac(z_∀_elimⓩx real_less_eq y⌝cn_boolean_cases_thm));
(fn _ => pop_thm()) "cn_real_less_eq_boolean_thm"
);
=TEX
=SML
val cn_real_greater_boolean_thm = (
set_goal([],ⓩ∀ x, y : 𝕌 ⦁ x real_greater y = Boolean (x >⋎R y)⌝);
a(REPEAT strip_tac);
a(PC_T1 "z_predicates" cases_tac ⓩx >⋎R y⌝);
(* *** Goal "1" *** *)
a(asm_rewrite_tac[z_get_specⓩBoolean⌝]);
a(strip_asm_tac cn_real_greater_def_thm);
a(DROP_NTH_ASM_T 1 (ante_tac o z_∀_elim ⓩ(x≜x,y≜y)⌝));
a(asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[z_get_specⓩBoolean⌝]);
a(strip_asm_tac cn_real_greater_def_thm);
a(swap_nth_asm_concl_tac 2);
a(DROP_NTH_ASM_T 2 (ante_tac o z_∀_elim ⓩ(x≜x,y≜y)⌝));
a(asm_rewrite_tac[]);
a(REPEAT strip_tac);
a(lemma_tacⓩx real_greater y ∈ BOOLEAN⌝);
(* *** Goal "2.1" *** *)
a(DROP_ASMS_T discard_tac);
a(strip_asm_tac (z_get_specⓩ(_ real_greater _)⌝));
a(LIST_DROP_NTH_ASM_T [1,2,4,5] discard_tac);
a(LEMMA_T ⓩx ∈ ℝ⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⓩy ∈ ℝ⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⓩ(x,y)∈ ℝ × ℝ⌝ asm_tac THEN1 prove_tac[]);
a(all_asm_fc_tac[z_→_app_thm]);
(* *** Goal "2.2" *** *)
a(strip_asm_tac(z_∀_elimⓩx real_greater y⌝cn_boolean_cases_thm));
(fn _ => pop_thm()) "cn_real_greater_boolean_thm"
);
=TEX
=SML
val cn_real_greater_eq_boolean_thm = (
set_goal([],ⓩ∀ x, y : 𝕌 ⦁ x real_greater_eq y = Boolean (x ≥⋎R y)⌝);
a(REPEAT strip_tac);
a(PC_T1 "z_predicates" cases_tac ⓩx ≥⋎R y⌝);
(* *** Goal "1" *** *)
a(asm_rewrite_tac[z_get_specⓩBoolean⌝]);
a(strip_asm_tac cn_real_greater_eq_def_thm);
a(DROP_NTH_ASM_T 1 (ante_tac o z_∀_elim ⓩ(x≜x,y≜y)⌝));
a(asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[z_get_specⓩBoolean⌝]);
a(strip_asm_tac cn_real_greater_eq_def_thm);
a(swap_nth_asm_concl_tac 2);
a(DROP_NTH_ASM_T 2 (ante_tac o z_∀_elim ⓩ(x≜x,y≜y)⌝));
a(asm_rewrite_tac[]);
a(REPEAT strip_tac);
a(lemma_tacⓩx real_greater_eq y ∈ BOOLEAN⌝);
(* *** Goal "2.1" *** *)
a(DROP_ASMS_T discard_tac);
a(strip_asm_tac (z_get_specⓩ(_ real_greater_eq _)⌝));
a(LIST_DROP_NTH_ASM_T [1,3,4,5] discard_tac);
a(LEMMA_T ⓩx ∈ ℝ⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⓩy ∈ ℝ⌝ asm_tac THEN1 prove_tac[]);
a(LEMMA_T ⓩ(x,y)∈ ℝ × ℝ⌝ asm_tac THEN1 prove_tac[]);
a(all_asm_fc_tac[z_→_app_thm]);
(* *** Goal "2.2" *** *)
a(strip_asm_tac(z_∀_elimⓩx real_greater_eq y⌝cn_boolean_cases_thm));
(fn _ => pop_thm()) "cn_real_greater_eq_boolean_thm"
);
=TEX
=SML
val cn_relational_clauses1 = (
set_goal([], ⓩ
	(∀ x, y : 𝕌 ⦁ x real_less y = Boolean (x <⋎R y))
    ∧	(∀ x, y : 𝕌 ⦁ x real_less_eq y = Boolean (x ≤⋎R y))
    ∧	(∀ x, y : 𝕌 ⦁ x real_greater y = Boolean (x >⋎R y))
    ∧	(∀ x, y : 𝕌 ⦁ x real_greater_eq y = Boolean (x ≥⋎R y))⌝);
a(REPEAT strip_tac);
a(rewrite_tac[cn_real_less_boolean_thm]);
a(rewrite_tac[cn_real_less_eq_boolean_thm]);
a(rewrite_tac[cn_real_greater_boolean_thm]);
a(rewrite_tac[cn_real_greater_eq_boolean_thm]);
save_pop_thm"cn_relational_clauses1"
);
=TEX
=SML
val ⦏cn_integer_to_real_thm⦎ = (
set_goal([], ⓩ∀ x : ℤ ⦁ integer_to_real x = real x⌝);
a(rewrite_tac[z_get_specⓩinteger_to_real⌝]);
save_pop_thm "cn_integer_to_real_thm"
);
=TEX
\section{PROOF PROCEDURES}
=TEX
\subsection{Syntax Manipulation}
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
val ⦏ℤ⦎ = ⓣℤ⌝;
fun ⦏mk_ℤ_bin_op⦎ (area : string) (tm : TERM) : (TERM * TERM) -> TERM = (
	let	val f = mk_z_simple_bin_op tm;
	in	(fn tt as (t1, t2) => (
			if	type_of t1 =: ℤ
			then	if	type_of t2 =: ℤ
				then	f tt
				else	term_fail area 509001 [t2]
			else	term_fail area 509001 [t1]
		))
	end
);
=TEX
=SML
val ⦏dest_cn_intdiv⦎ = dest_z_bin_op "dest_cn_intdiv" 509002 (fst(dest_constⓩ(_ intdiv _)⌝));
val ⦏dest_cn_intmod⦎ = dest_z_bin_op "dest_cn_intmod" 509004 (fst(dest_constⓩ(_ intmod _)⌝));
val ⦏dest_cn_rem⦎ = dest_z_bin_op "dest_cn_rem" 509003 (fst(dest_constⓩ(_ rem _)⌝));
val ⦏dest_cn_star_star⦎ = dest_z_bin_op "dest_cn_star_star" 509004 (fst(dest_constⓩ(_ ** _)⌝));

val ⦏is_cn_intdiv⦎ = is_z_bin_op (fst(dest_constⓩ(_ intdiv _)⌝));
val ⦏is_cn_intmod⦎ = is_z_bin_op (fst(dest_constⓩ(_ intmod _)⌝));
val ⦏is_cn_rem⦎ = is_z_bin_op (fst(dest_constⓩ(_ rem _)⌝));
val ⦏is_cn_star_star⦎ = is_z_bin_op (fst(dest_constⓩ(_ ** _)⌝));

val ⦏mk_cn_intdiv⦎ = mk_ℤ_bin_op "mk_cn_intdiv" ⓩ(_ intdiv _)⌝;
val ⦏mk_cn_intmod⦎ = mk_ℤ_bin_op "mk_cn_intmod" ⓩ(_ intmod _)⌝;
val ⦏mk_cn_rem⦎ = mk_ℤ_bin_op "mk_cn_rem" ⓩ(_ rem _)⌝;
val ⦏mk_cn_star_star⦎ = mk_ℤ_bin_op "mk_cn_star_star" ⓩ(_ ** _)⌝;
=TEX
\subsection{Constant Expression Evaluation}
=SML
val ⦏cn_intdiv_thm1⦎ = (
set_goal ([], ⌜∀x y⦁ ⓩ¬y = 0 ⇒
	(0 ≤ x * y ⇒ x intdiv y = abs x div abs y)
        ∧ (x * y < 0 ⇒ x intdiv y = ~ (abs x div abs y))⌝⌝);
a(REPEAT ∀_tac THEN strip_tac);
a(ante_tac (z_∀_elimⓩ(x≜x, y≜y)⌝
		(∧_right_elim (z_get_specⓩ(_ intdiv _)⌝))));
a(asm_rewrite_tac[]);
a taut_tac;
pop_thm()
);
=TEX
=SML
val ⦏cn_rem_thm1⦎ = (
set_goal ([], ⌜∀x y⦁ ⓩ¬y = 0 ⇒
	(x rem y = x - (x intdiv y) * y)⌝⌝);
a(REPEAT ∀_tac THEN strip_tac);
a(ante_tac (z_∀_elimⓩ(x≜x, y≜y)⌝
		(∧_right_elim (z_get_specⓩ(_ intdiv _)⌝))));
a(asm_rewrite_tac[]);
a(taut_tac);
pop_thm()
);
=TEX
=SML
val ⦏cn_intmod_thm1⦎ = (
set_goal ([], ⌜∀x y⦁ ⓩ¬y = 0 ⇒
	((0 ≤ x * y ∨ x rem y = 0 ⇒ x intmod y = x rem y)
        ∧ (x * y < 0 ∧ ¬x rem y = 0 ⇒ x intmod y = x rem y + y))⌝⌝);
a(REPEAT ∀_tac THEN strip_tac);
a(ante_tac (z_∀_elimⓩ(x≜x, y≜y)⌝
		(∧_right_elim (z_get_specⓩ(_ intdiv _)⌝))));
a(asm_rewrite_tac[]);
a(taut_tac);
pop_thm()
);
=TEX
=SML
val ⦏cn_star_star_0_thm⦎ = (
set_goal ([], ⌜∀x⦁ ⓩx ** 0 = 1⌝⌝);
a(REPEAT strip_tac);
a(ante_tac (z_∀_elimⓩ(x≜x, y≜0)⌝(∧_right_elim (z_get_specⓩ(_ ** _)⌝))));
a(REPEAT strip_tac THEN asm_rewrite_tac[]);
pop_thm()
);
=TEX
=SML
val ⦏cn_star_star_plus1_thm⦎ = (
set_goal ([], ⌜∀x y⦁ ⓩ0 ≤ y ⇒ x ** (y + 1) = x * (x ** y)⌝⌝);
a(REPEAT strip_tac);
a(ante_tac (z_∀_elimⓩ(x≜x, y≜y)⌝(∧_right_elim (z_get_specⓩ(_ ** _)⌝))));
a(asm_rewrite_tac[] THEN taut_tac);
pop_thm()
);
=TEX
=SML
val z_zero = ⓩ0⌝;
val misc_thm1 = taut_rule⌜∀p⦁(¬F ⇒ p) ⇒ p⌝;
val misc_thm2 = taut_rule⌜∀p⦁(T ⇒ p) ⇒ p⌝;
val misc_thm3 = pc_rule1"z_library" prove_rule[]⌜∀i j⦁ⓩi - j = i + ~j⌝⌝;
val misc_thm4 = pc_rule1"z_library" prove_rule[]⌜∀i j⦁ⓩi - ~j = i + j⌝⌝;
val misc_thm5 = taut_rule⌜∀p⦁(T ∨ p) ⇔ T⌝;
val misc_thm6 = taut_rule⌜∀p⦁(p ∨ T) ⇔ T⌝;
val misc_thm7 = taut_rule⌜∀p⦁(T ∧ ¬F) ⇔ T⌝;
fun ⦏Z_LEFT_C⦎ (c : CONV) : CONV = RAND_C (LEFT_C c);
fun ⦏Z_RIGHT_C⦎ (c : CONV) : CONV = RAND_C (RIGHT_C c);
fun ⦏Z_RANDS_C⦎ (c : CONV) : CONV = Z_LEFT_C c THEN_C Z_RIGHT_C c;
fun ⦏Z_REL_LEFT_C⦎ (c : CONV) : CONV = LEFT_C (LEFT_C c);
fun ⦏Z_REL_RIGHT_C⦎ (c : CONV) : CONV = LEFT_C (RIGHT_C c);
=TEX
=SML
val ⦏cn_intdiv_conv⦎ = (fn tm =>
	let	val (x, y) = dest_cn_intdiv tm;
		val ix = dest_z_signed_int x;
		val iy = dest_z_signed_int y;
		val thm1 = list_∀_elim [x, y] cn_intdiv_thm1;
		val thm2 = conv_rule (LEFT_C (RAND_C z_ℤ_eq_conv)) thm1;
		val thm3 = simple_⇒_match_mp_rule misc_thm1 thm2;
		val left = ix @* iy @>= zero;
		val thm4 = (if left then ∧_left_elim else ∧_right_elim) thm3;
		val conv1 =
			if left
			then (Z_REL_RIGHT_C z_times_conv THEN_C z_≤_conv)
			else (Z_REL_LEFT_C z_times_conv THEN_C z_less_conv);
		val thm5 = conv_rule (LEFT_C conv1) thm4;
		val thm6 = simple_⇒_match_mp_rule misc_thm2 thm5;
		val conv2 = Z_RANDS_C z_abs_conv  THEN_C z_div_conv;
		val conv3 = if left then conv2 else RIGHT_C conv2;
	in	conv_rule (RIGHT_C conv3) thm6	
	end	handle Fail _ => term_fail "cn_intdiv_conv" 509011 [tm]
);
=TEX
=SML
val ⦏cn_rem_conv⦎ = (fn tm =>
	let	val (x, y) = dest_cn_rem tm;
		val thm1 = list_∀_elim [x, y] cn_rem_thm1;
		val thm2 = conv_rule (LEFT_C (RAND_C z_ℤ_eq_conv)) thm1;
		val thm3 = simple_⇒_match_mp_rule misc_thm1 thm2;
		val subtract_conv = simple_eq_match_conv misc_thm4
				ORELSE_C simple_eq_match_conv misc_thm3;
		val conv = Z_RIGHT_C(Z_LEFT_C cn_intdiv_conv THEN_C z_times_conv)
				THEN_C subtract_conv
				THEN_C z_plus_conv;
	in	conv_rule (RIGHT_C conv) thm3
	end	handle Fail _ => term_fail "cn_rem_conv" 509012 [tm]
);
=TEX
=SML
val ⦏cn_intmod_conv⦎ = (fn tm =>
	let	val (x, y) = dest_cn_intmod tm;
		val ix = dest_z_signed_int x;
		val iy = dest_z_signed_int y;
		val thm1 = list_∀_elim [x, y] cn_intmod_thm1;
		val thm2 = conv_rule (LEFT_C (RAND_C z_ℤ_eq_conv)) thm1;
		val thm3 = simple_⇒_match_mp_rule misc_thm1 thm2;
		val left = ix @* iy @>= zero;
		val right = ix imod iy = zero;
	in	if	left orelse right
		then
	let	val thm4 = ∧_left_elim thm3;
		val conv1 =
			if left
			then LEFT_C (Z_REL_RIGHT_C z_times_conv THEN_C z_≤_conv)
				THEN_C simple_eq_match_conv misc_thm5
			else RIGHT_C(LEFT_C cn_rem_conv THEN_C z_ℤ_eq_conv)
				THEN_C simple_eq_match_conv misc_thm6;
		val thm5 = conv_rule (LEFT_C conv1) thm4;
		val thm6 = simple_⇒_match_mp_rule misc_thm2 thm5;
		val conv2 = RIGHT_C cn_rem_conv;
	in	conv_rule conv2 thm6
	end	else
	let	val thm4 = ∧_right_elim thm3;
		val conv1 =
			LEFT_C (Z_REL_LEFT_C z_times_conv THEN_C z_less_conv)
		THEN_C	RIGHT_C (RAND_C(LEFT_C cn_rem_conv THEN_C z_ℤ_eq_conv))
		THEN_C simple_eq_match_conv misc_thm7;
		val thm5 = conv_rule (LEFT_C conv1) thm4;
		val thm6 = simple_⇒_match_mp_rule misc_thm2 thm5;
		val conv2 = RIGHT_C (Z_LEFT_C cn_rem_conv THEN_C z_plus_conv);
	in	conv_rule conv2 thm6
	end
	end	handle Fail _ => term_fail "cn_intmod_conv" 509013 [tm]
);
=TEX
=SML
val rec ⦏cn_star_star_conv⦎ = (fn tm =>
	let	val (x, y) = dest_cn_star_star tm;
		val ix = dest_z_signed_int x;
		val iy = dest_z_signed_int y;
	in	if	iy = zero
		then	∀_elim x cn_star_star_0_thm
		else
	let	val thm1 = list_∀_elim
			[x, mk_z_signed_int (iy@-one)] cn_star_star_plus1_thm;
		val thm2 = conv_rule (LEFT_C z_≤_conv) thm1;
		val thm3 = simple_⇒_match_mp_rule misc_thm2 thm2;
		val conv1 = LEFT_C (Z_RIGHT_C z_plus_conv);
		val thm4 = conv_rule conv1 thm3;
		val conv2 = Z_RIGHT_C cn_star_star_conv THEN_C z_times_conv;
	in	conv_rule (RIGHT_C conv2) thm4	
	end
	end	handle Fail _ => term_fail "cn_star_star_conv" 509014 [tm]
);
=TEX
Now for the binary bitwise operations.
First group the defining properties nicely:
=SML
val ⦏cn_mod_xor_def1⦎ :: ⦏cn_mod_xor_def0⦎ ::
	⦏cn_mod_or_def1⦎ :: ⦏cn_mod_or_def0⦎ ::
	⦏cn_mod_and_def1⦎ :: ⦏cn_mod_and_def0⦎ :: _ =
		rev(strip_∧_rule (z_get_specⓩ(_ mod_and _)⌝));
val ⦏cn_mod_and_def⦎ = ∧_intro cn_mod_and_def0 cn_mod_and_def1;
val ⦏cn_mod_or_def⦎ = ∧_intro cn_mod_or_def0 cn_mod_or_def1;
val ⦏cn_mod_xor_def⦎ = ∧_intro cn_mod_xor_def0 cn_mod_xor_def1;
=TEX
Now prove theorems giving the defining properties in
a form that is convenient for the computational conversions.
=SML
val [and_thm0, and_thm1,
	or_thm0, or_thm1,
	xor_thm0, xor_thm1] = (
set_goal([], ⌜
	⌜∀i⦁ ⓩ0 ≤ i ⇒ i mod_and 0 = 0⌝⌝ ∧
	⌜∀i j⦁ ⓩ0 ≤ i ⇒ 0 < j ⇒
		i mod_and j = 2 * (i div 2 mod_and j div 2) + i mod 2 * (j mod 2)⌝⌝ ∧
	⌜∀i⦁ ⓩ0 ≤ i ⇒ i mod_or 0 = i⌝⌝ ∧
	⌜∀i j⦁ ⓩ0 ≤ i ⇒ 0 < j ⇒
		i mod_or j = 2 * (i div 2 mod_or j div 2) + max {i mod 2, j mod 2}⌝⌝ ∧
	⌜∀i⦁ ⓩ0 ≤ i ⇒ i mod_xor 0 = i⌝⌝ ∧
	⌜∀i j⦁ ⓩ0 ≤ i ⇒ 0 < j ⇒
		i mod_xor j = 2 * (i div 2 mod_xor j div 2) + (i + j) mod 2⌝⌝
⌝);
a(REPEAT strip_tac THEN
	ALL_FC_T rewrite_tac[
		cn_mod_and_def, cn_mod_or_def,
		cn_mod_xor_def]);
strip_∧_rule (pop_thm())
);
=TEX
Now the conversions:
=SML
val rec ⦏cn_mod_and_conv⦎ : CONV = (fn tm =>
	let	val args = dest_z_tuple (snd (dest_z_app tm));
		val (arg1, arg2) = (hd args, hd(tl args));
	in	if	dest_z_signed_int arg2 = zero
		then let
			val thm1 = simple_∀_elim arg1 and_thm0;
			val thm2 = conv_rule (LEFT_C z_≤_conv) thm1;
			val thm3 = ⇒_mp_rule thm2 t_thm;
		in	thm3
		end else let
			val thm1 = list_simple_∀_elim args and_thm1;
			val thm2 = conv_rule (LEFT_C z_≤_conv) thm1;
			val thm3 = ⇒_mp_rule thm2 t_thm;
			val thm4 = conv_rule (LEFT_C z_less_conv) thm3;
			val thm5 = ⇒_mp_rule thm4 t_thm;
		in	((fn tm => thm5)
			THEN_C	Z_RIGHT_C (Z_RANDS_C z_mod_conv THEN_C z_times_conv)
			THEN_C	Z_LEFT_C(
					Z_RIGHT_C(Z_RANDS_C z_div_conv)
				THEN_C	Z_RIGHT_C cn_mod_and_conv
				THEN_C	z_times_conv)
			THEN_C	z_plus_conv)
			tm
		end
	end	handle Fail _ => term_fail "cn_mod_and_conv" 509021 [tm]
);
=TEX
We need to evaluate the $max$ expression in the definition of $mod\_or$.
=SML
val ⦏z_max_singleton_thm⦎ = (
set_goal([] , ⓩ∀i : ℤ⦁ max {i} = i⌝);
a(rewrite_tac[z_max_def] THEN REPEAT strip_tac);
a(z_app_eq_tac THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(all_var_elim_asm_tac1);
(* *** Goal "2" *** *)
a(z_∃_tacⓩ(S ≜ {i}, m ≜ i)⌝ THEN PC_T1 "z_library_ext" prove_tac[]);
pop_thm()
);
=TEX
=SML
val ⦏z_max_pair_lemma⦎ = (
set_goal([] , ⓩ∀i, j : ℤ| i ≤ j⦁ max {i, j} = j⌝);
a(rewrite_tac[z_max_def] THEN REPEAT strip_tac);
a(z_app_eq_tac THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(REPEAT all_var_elim_asm_tac1);
a(z_spec_nth_asm_tac 1 ⓩj⌝ THEN PC_T1 "z_lin_arith" asm_prove_tac[]);
(* *** Goal "2" *** *)
a(z_∃_tacⓩ(S ≜ {i, j}, m ≜ j)⌝ THEN PC_T1 "z_library_ext" prove_tac[]);
pop_thm ()
);
=TEX
=SML
val ⦏z_max_pair_thm⦎ = (
set_goal([] , ⓩ∀i, j : ℤ⦁ max {i, j} = if i ≤ j then j else i⌝);
a(REPEAT strip_tac);
a(lemma_tacⓩi ≤ j ∨ j ≤ i⌝ THEN1 PC_T1 "z_lin_arith" prove_tac[]);
(* *** Goal "1" *** *)
a(ALL_FC_T asm_rewrite_tac [z_max_pair_lemma]);
(* *** Goal "2" *** *)
a(LEMMA_T ⓩ{i, j} = {j, i}⌝ rewrite_thm_tac THEN1
	(PC_T1 "z_sets_ext" prove_tac[]));
a(ALL_FC_T asm_rewrite_tac[z_max_pair_lemma]);
a(cases_tac ⓩi = j⌝ THEN1 asm_rewrite_tac[]);
a(LEMMA_T ⓩ¬i ≤ j⌝ rewrite_thm_tac THEN1
	(PC_T1 "z_lin_arith" asm_prove_tac[]));
pop_thm()
);
=TEX
=SML
val ⦏z_max_pair_conv⦎ = (
	let	val max_thm = (conv_rule z_∀_elim_conv1 o
			pure_rewrite_rule[z_get_specⓩℤ⌝])
				z_max_pair_thm;
		val if_thms = (map all_∀_intro o
			strip_∧_rule o
			all_∀_elim o
			conv_rule z_∀_elim_conv1)
				z_if_thm;
		val ⦏IF_COND_C⦎ = fn conv =>
			RAND_C (RATOR_C (RATOR_C (RAND_C conv)));
	in	simple_eq_match_conv max_thm
		THEN_C	IF_COND_C z_≤_conv
		THEN_C	FIRST_C (map simple_eq_match_conv if_thms)
	end
);
=TEX
=SML
val rec ⦏cn_mod_or_conv⦎ : CONV = (fn tm =>
	let	val args = dest_z_tuple (snd (dest_z_app tm));
		val (arg1, arg2) = (hd args, hd(tl args));
		val ⦏Z_MAX_PAIR_C⦎ : CONV -> CONV =
		(fn conv =>
			Z_RAND_C(RAND_C(LEFT_C conv
				THEN_C (RIGHT_C (LEFT_C conv))))
);
	in	if	dest_z_signed_int arg2 = zero
		then let
			val thm1 = simple_∀_elim arg1 or_thm0;
			val thm2 = conv_rule (LEFT_C z_≤_conv) thm1;
			val thm3 = ⇒_mp_rule thm2 t_thm;
		in	thm3
		end else let
			val thm1 = list_simple_∀_elim args or_thm1;
			val thm2 = conv_rule (LEFT_C z_≤_conv) thm1;
			val thm3 = ⇒_mp_rule thm2 t_thm;
			val thm4 = conv_rule (LEFT_C z_less_conv) thm3;
			val thm5 = ⇒_mp_rule thm4 t_thm;
		in	((fn tm => thm5)
			THEN_C	Z_RIGHT_C (Z_MAX_PAIR_C z_mod_conv THEN_C z_max_pair_conv)
			THEN_C	Z_LEFT_C(
					Z_RIGHT_C(Z_RANDS_C z_div_conv)
				THEN_C	Z_RIGHT_C cn_mod_or_conv
				THEN_C	z_times_conv)
			THEN_C	z_plus_conv)
			tm
		end
	end	handle Fail _ => term_fail "cn_mod_or_conv" 509022 [tm]
);
=TEX
=SML
val rec ⦏cn_mod_xor_conv⦎ : CONV = (fn tm =>
	let	val args = dest_z_tuple (snd (dest_z_app tm));
		val (arg1, arg2) = (hd args, hd(tl args));
	in	if	dest_z_signed_int arg2 = zero
		then let
			val thm1 = simple_∀_elim arg1 xor_thm0;
			val thm2 = conv_rule (LEFT_C z_≤_conv) thm1;
			val thm3 = ⇒_mp_rule thm2 t_thm;
		in	thm3
		end else let
			val thm1 = list_simple_∀_elim args xor_thm1;
			val thm2 = conv_rule (LEFT_C z_≤_conv) thm1;
			val thm3 = ⇒_mp_rule thm2 t_thm;
			val thm4 = conv_rule (LEFT_C z_less_conv) thm3;
			val thm5 = ⇒_mp_rule thm4 t_thm;
		in	((fn tm => thm5)
			THEN_C	Z_RIGHT_C (Z_LEFT_C z_plus_conv THEN_C z_mod_conv)
			THEN_C	Z_LEFT_C(
					Z_RIGHT_C(Z_RANDS_C z_div_conv)
				THEN_C	Z_RIGHT_C cn_mod_xor_conv
				THEN_C	z_times_conv)
			THEN_C	z_plus_conv)
			tm
		end
	end	handle Fail _ => term_fail "cn_mod_xor_conv" 509023 [tm]
);
=TEX
Now $mod\_not$
=SML
val ⦏cn_mod_not_def⦎ = z_get_specⓩ(mod_not _)⌝;
val ⦏cn_mod_not_thm⦎ =
	conv_rule z_∀_elim_conv1(
	∧_right_elim(rewrite_rule[z_get_specⓩℤ⌝] cn_mod_not_def));
val ⦏z_minus_minus_conv⦎ = simple_eq_match_conv
	(prove_rule[]⌜∀x : ℤ ⦁ⓩ~(~x) = x⌝⌝);
val ⦏cn_mod_not_conv⦎ : CONV = (fn tm =>
		(simple_eq_match_conv cn_mod_not_thm
	THEN_C Z_RIGHT_C (Z_RAND_C z_plus_conv)
	THEN_TRY_C Z_RIGHT_C z_minus_minus_conv
	THEN_C	z_plus_conv) tm
		handle Fail _ => term_fail "cn_mod_not_conv" 509024 [tm]
);
=TEX
\subsection{Proof Contexts}
=SML
val ⦏cn_cxt1⦎ = (flat o map (cthm_eqn_cxt (current_ad_rw_canon()))) [
	cn_boolean_thm,
	cn_boolean_succ_thm,
	cn_boolean_pred_thm,
	cn_boolean_pos_thm,
	cn_boolean_val_thm,
 	cn_boolean_clauses,
	cn_relational_clauses,
	z_get_specⓩBOOLEANvFIRST⌝,
	z_get_specⓩBOOLEANvLAST⌝,
	cn_and_then_or_else_clauses
];
val ⦏cn_cxt2⦎ = [

	(ⓩi intdiv j⌝, cn_intdiv_conv),
	(ⓩi rem j⌝, cn_rem_conv),
	(ⓩi intmod j⌝, cn_intmod_conv),
	(ⓩi ** j⌝, cn_star_star_conv),
	(ⓩi mod_and j⌝, cn_mod_and_conv),
	(ⓩi mod_or j⌝, cn_mod_or_conv),
	(ⓩi mod_xor j⌝, cn_mod_xor_conv),
	(ⓩmod_not j⌝, cn_mod_not_conv)
];
val ⦏cn_cxt⦎ = cn_cxt1 @ cn_cxt2;
val ⦏cn_cxt3⦎ = (flat o map (cthm_eqn_cxt (current_ad_rw_canon()))) [
	cn_integer_to_real_thm,
	cn_relational_clauses1
];
=IGN
map (fn (t, c) => TRY_C c t) cn_cxt3;
=TEX
=SML
val _ = delete_pc "'cn" handle Fail _ => ();
val _ = new_pc ⦏"'cn"⦎;
val _ = set_rw_eqn_cxt cn_cxt "'cn";
val _ = set_st_eqn_cxt cn_cxt "'cn";
val _ = set_sc_eqn_cxt cn_cxt "'cn";
val _ = commit_pc "'cn";
=TEX
=SML
val _ = delete_pc "cn" handle Fail _ => ();
val _ = new_pc ⦏"cn"⦎;
val _ = merge_pcs ["'cn","z_library"] "cn";
val _ = commit_pc "cn";
=TEX
=SML
val _ = delete_pc "cn_ext" handle Fail _ => ();
val _ = new_pc ⦏"cn_ext"⦎;
val _ = merge_pcs ["'cn","z_library_ext"] "cn_ext";
val _ = commit_pc "cn_ext";
=TEX
=SML
val _ = delete_pc "'cn_reals" handle Fail _ => ();
val _ = new_pc ⦏"'cn_reals"⦎;
val _ = set_rw_eqn_cxt cn_cxt3 "'cn_reals";
val _ = set_st_eqn_cxt cn_cxt3 "'cn_reals";
val _ = set_sc_eqn_cxt cn_cxt3 "'cn_reals";
val _ = commit_pc "'cn_reals";
=TEX
\subsection{Boolean Clauses Reprised}
=SML
val _ = push_pc "cn";
=TEX
=SML
val ⦏cn_boolean_clauses1⦎ = (
set_goal([], ⓩ
	(∀ x : BOOLEAN ⦁ (not x = Boolean (Π(¬ x = Boolean true)))) ∧
	(∀ x, y : BOOLEAN ⦁
		(x and y) = Boolean (Π((x = Boolean true) ∧ (y = Boolean true)))) ∧
	(∀ x, y : BOOLEAN ⦁
		(x or y) = Boolean (Π((x = Boolean true) ∨ (y = Boolean true)))) ∧
	(∀ x, y : BOOLEAN ⦁
		(x xor y) = Boolean (Π(¬ (x = Boolean true) ⇔ (y = Boolean true))))
	⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(strip_asm_tac (z_∀_elim ⓩx⌝ cn_boolean_cases_thm) THEN
	all_var_elim_asm_tac1 THEN rewrite_tac[]);
(* *** Goal "2" *** *)
a(strip_asm_tac (z_∀_elim ⓩx⌝ cn_boolean_cases_thm) THEN
	strip_asm_tac (z_∀_elim ⓩy⌝ cn_boolean_cases_thm) THEN
	all_var_elim_asm_tac1 THEN rewrite_tac[]);
(* *** Goal "3" *** *)
a(strip_asm_tac (z_∀_elim ⓩx⌝ cn_boolean_cases_thm) THEN
	strip_asm_tac (z_∀_elim ⓩy⌝ cn_boolean_cases_thm) THEN
	all_var_elim_asm_tac1 THEN rewrite_tac[]);
(* *** Goal "4" *** *)
a(strip_asm_tac (z_∀_elim ⓩx⌝ cn_boolean_cases_thm) THEN
	strip_asm_tac (z_∀_elim ⓩy⌝ cn_boolean_cases_thm) THEN
	all_var_elim_asm_tac1 THEN rewrite_tac[]);
save_pop_thm "cn_boolean_clauses1"
);
=TEX
=SML
val ⦏cn_boolean_clauses2⦎ = (
set_goal([], ⓩ
	(∀ x : BOOLEAN ; p : 𝕌 ⦁
		(x and Boolean p) = Boolean (Π((x = Boolean true) ∧ p))) ∧
	(∀ x : BOOLEAN ; p : 𝕌 ⦁
		(Boolean p and x) = Boolean (Π(p ∧ (x = Boolean true)))) ∧
	(∀ x : BOOLEAN ; p : 𝕌 ⦁
		(x or Boolean p) = Boolean (Π((x = Boolean true) ∨ p))) ∧
	(∀ x : BOOLEAN ; p : 𝕌 ⦁
		(Boolean p or x) = Boolean (Π(p ∨ (x = Boolean true)))) ∧
	(∀ x : BOOLEAN ; p : 𝕌 ⦁
		(x xor Boolean p) = Boolean (Π(¬ (x = Boolean true) ⇔ p))) ∧
	(∀ x : BOOLEAN ; p : 𝕌 ⦁
		(Boolean p xor x) = Boolean (Π(¬ p ⇔ (x = Boolean true))))
	⌝);
a(REPEAT strip_tac THEN
	strip_asm_tac (z_∀_elim ⓩx ⦂ BOOLEAN⌝ cn_boolean_cases_thm) THEN
	all_var_elim_asm_tac1 THEN rewrite_tac[]);
save_pop_thm "cn_boolean_clauses2"
);
=TEX
=SML
val _ = pop_pc();
=TEX
\section{NUMERIC OPERATOR THEOREMS}
These theorems are proved separately using the proof context $cn$.
=SML
val _ = set_pc"cn";
=TEX
=SML
val ⦏cn_intdiv_0_thm⦎ = (
set_goal([],ⓩ∀ j: ℤ | ¬j = 0 ⦁ 0 intdiv j = 0 ∧ 0 rem j = 0 ∧ 0 intmod j = 0⌝);
a(z_∀_tac THEN REPEAT ⇒_tac);
a(ante_tac (z_∀_elimⓩ(x≜0, y≜j)⌝
		(∧_right_elim (z_get_specⓩ(_ intdiv _)⌝))));
a(asm_rewrite_tac[]);
a ⇒_tac;
a(LEMMA_Tⓩ0 div abs j = 0⌝asm_rewrite_thm_tac);
a(LIST_DROP_NTH_ASM_T[1,2,3](MAP_EVERY discard_tac));
a(ante_tac (z_∀_elimⓩ(i ≜ 0,j ≜ abs j,d ≜ 0,r ≜ 0)⌝z_div_mod_unique_thm));
a(rewrite_tac[]);
a(strip_asm_tac (z_∀_elim⌜j⌝z_ℤ_cases_thm)
	THEN all_var_elim_asm_tac1 THEN all_asm_fc_tac[z_abs_thm]);
(* *** Goal "1" *** *)
a(asm_rewrite_tac[]);
a(LIST_DROP_NTH_ASM_T[1,2](MAP_EVERY discard_tac));
a(LEMMA_Tⓩ¬ j' = 0 ∧ 0 ≤ j' ⇒ 0 < j'⌝ante_tac
	THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(asm_rewrite_tac[]THEN ⇒_T rewrite_thm_tac);
a(⇒_tac THEN DROP_NTH_ASM_T 2 (rewrite_thm_tac o eq_sym_rule));
(* *** Goal "2" *** *)
a(asm_rewrite_tac[]);
a(LIST_DROP_NTH_ASM_T[1,2](MAP_EVERY discard_tac));
a(lemma_tacⓩ¬ ~ j' = 0  ⇒ ¬ j' = 0⌝THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(LEMMA_Tⓩ¬ j' = 0 ∧ 0 ≤ j' ⇒ 0 < j'⌝ante_tac
	THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(asm_rewrite_tac[]THEN ⇒_T rewrite_thm_tac);
a(⇒_tac THEN DROP_NTH_ASM_T 2 (rewrite_thm_tac o eq_sym_rule));
save_pop_thm"cn_intdiv_0_thm"
);
=TEX
=SML
val ⦏cn_intdiv_thm⦎ = (
set_goal([],ⓩ∀ i,j,k : ℤ | ¬j = 0 ⦁ (i intdiv j = k) ⇔
	(∃ m : ℤ ⦁ i = k * j + m ∧ abs m < abs j
	∧ ((0 ≤ i ∧ 0 ≤ m ) ∨ (i < 0 ∧ m ≤ 0)) )⌝);
a(z_∀_tac THEN ⇒_T strip_asm_tac);
a(⇔_T asm_tac);
(* *** Goal "1" *** *)
a(cases_tacⓩi=0⌝);
(* *** Goal "1.1" *** *)
a(all_var_elim_asm_tac1 THEN rewrite_tac[]);
a(LEMMA_Tⓩ0 intdiv j = 0⌝rewrite_thm_tac
	THEN1 ALL_ASM_FC_T rewrite_tac[cn_intdiv_0_thm]);
a(z_∃_tacⓩ0⌝ THEN rewrite_tac[]);
a(all_asm_fc_tac[z_abs_0_less_thm]);
(* *** Goal "1.2" *** *)
a(DROP_NTH_ASM_T 2 (rewrite_thm_tac o eq_sym_rule));
a(ante_tac (z_∀_elimⓩ(x≜i, y≜j)⌝
		(∧_right_elim (z_get_specⓩ(_ intdiv _)⌝))));
a(asm_rewrite_tac[]);
a(⇒_T (REPEAT_TTCL ∧_THEN asm_tac));
a(z_∃_tacⓩi rem j⌝);
a(DROP_NTH_ASM_T 3 rewrite_thm_tac);
a(LEMMA_Tⓩ(i intdiv j) * j + (i + ~ ((i intdiv j) * j))=i⌝rewrite_thm_tac
	THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(lemma_tacⓩ0 ≤ i * j ∨ i * j < 0⌝THEN1 prove_tac[]);
(* *** Goal "1.2.1" *** *)
a(all_asm_fc_tac[]);
a(LIST_DROP_NTH_ASM_T[2,4,5,6,7](MAP_EVERY discard_tac));
a(POP_ASM_T rewrite_thm_tac);
a(LEMMA_Tⓩ0 < i * j⌝ante_tac);
(* *** Goal "1.2.1.1" *** *)
a(POP_ASM_T ante_tac THEN rewrite_tac[z_≤_less_eq_thm]
	THEN REPEAT strip_tac);
a(POP_ASM_T (ante_tac o eq_sym_rule));
a(asm_rewrite_tac[z_times_eq_0_thm]);
(* *** Goal "1.2.1.2" *** *)
a(POP_ASM_T discard_tac);
a(asm_rewrite_tac[z_0_less_times_thm]);
a(⇒_T strip_asm_tac);
(* *** Goal "1.2.1.2.1" *** *)
a(all_asm_fc_tac[z_abs_pos_thm]);
a(asm_rewrite_tac[z_≤_less_eq_thm]);
a(ante_tac (z_∀_elim
	ⓩ(i ≜ i,j ≜ j,d ≜ i div j ,r ≜ i mod j)⌝ z_div_mod_unique_thm));
a(asm_rewrite_tac[]);
a(⇒_T strip_asm_tac);
a(lemma_tacⓩi = (i div j) * j + i mod j ⇒ (i div j) * j = i + ~ (i mod j)⌝
	 THEN1 	PC_T1"z_lin_arith"prove_tac[]);
a(DROP_NTH_ASM_T 4 discard_tac);
a(POP_ASM_T rewrite_thm_tac);
a(all_asm_fc_tac[z_abs_thm]);
a(DROP_NTH_ASM_T 4 ante_tac THEN asm_rewrite_tac
	[z_plus_assoc_thm1,z_minus_thm,z_≤_less_eq_thm]);
a(⇒_T rewrite_thm_tac);
(* *** Goal "1.1.2.2.2" *** *)
a(all_asm_fc_tac[z_abs_neg_thm]);
a(asm_rewrite_tac[]);
a(LEMMA_Tⓩ~ ((~ i div ~ j) * j) = (~ i div ~ j) * ~ j⌝
	rewrite_thm_tac THEN1 rewrite_tac[z_minus_times_thm]);
a(ante_tac (z_∀_elim
	ⓩ(i ≜ ~ i,j ≜ ~ j,d ≜ ~ i div ~ j ,r ≜ ~ i mod ~ j)⌝ z_div_mod_unique_thm));
a(lemma_tacⓩ¬ j = 0 ⇒ ¬ ~ j = 0⌝THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(asm_rewrite_tac[]);
a(⇒_T strip_asm_tac);
a(lemma_tacⓩ~ i = (~ i div ~ j) * ~ j + ~ i mod ~ j ⇒
	(~ i div ~ j) * ~ j = ~ i + ~ (~ i mod ~ j)⌝
	 THEN1 	PC_T1"z_lin_arith"prove_tac[]);
a(DROP_NTH_ASM_T 4 discard_tac);
a(POP_ASM_T rewrite_thm_tac);
a(rewrite_tac	[z_plus_assoc_thm1]);
a(LEMMA_Tⓩ 0 ≤ ~ i mod ~ j ⇒ ~ (~ i mod ~ j) ≤ 0⌝ante_tac
	THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(asm_rewrite_tac[] THEN ⇒_tac);
a(all_asm_fc_tac[z_abs_thm]);
a(asm_rewrite_tac[]);
(* *** Goal "1.2.2" *** *)
a(all_asm_fc_tac[]);
a(LIST_DROP_NTH_ASM_T[3,4,5,6](MAP_EVERY discard_tac));
a(POP_ASM_T rewrite_thm_tac);
a(POP_ASM_T (strip_asm_tac o rewrite_rule[z_times_less_0_thm]));
(* *** Goal "1.2.2.1" *** *)
a(all_asm_fc_tac[z_abs_pos_thm,z_abs_neg_thm]);
a(ante_tac (z_∀_elim
	ⓩ(i ≜ i,j ≜ ~ j,d ≜ i div ~ j ,r ≜ i mod ~j)⌝ z_div_mod_unique_thm));
a(lemma_tacⓩ¬ j = 0 ⇒ ¬ ~ j = 0⌝THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(asm_rewrite_tac[]);
a(⇒_T strip_asm_tac);
a(lemma_tacⓩi = (i div ~ j) * ~ j + i mod ~ j ⇒ (i div ~ j) * ~ j = i + ~ (i mod ~ j)⌝
	 THEN1 	PC_T1"z_lin_arith"prove_tac[]);
a(DROP_NTH_ASM_T 4 discard_tac);
a(LEMMA_Tⓩ (~ (i div ~ j) * j) = (i div ~ j) * ~ j⌝
	rewrite_thm_tac THEN1 rewrite_tac[z_minus_times_thm]);
a(POP_ASM_T rewrite_thm_tac);
a(all_asm_fc_tac[z_abs_thm]);
a(asm_rewrite_tac[z_plus_assoc_thm1,z_minus_thm]);
a(asm_rewrite_tac[z_≤_less_eq_thm]);
(* *** Goal "1.2.2.2" *** *)
a(all_asm_fc_tac[z_abs_pos_thm,z_abs_neg_thm]);
a(ante_tac (z_∀_elim
	ⓩ(i ≜ ~ i,j ≜ j,d ≜ ~ i div j ,r ≜ ~ i mod j)⌝ z_div_mod_unique_thm));
a(asm_rewrite_tac[]);
a(⇒_T strip_asm_tac);
a(lemma_tacⓩ~ i = (~ i div j) * j + ~ i mod j ⇒ (~ i div j) * j = ~ i + ~(~ i mod j)⌝
	 THEN1 	PC_T1"z_lin_arith"prove_tac[]);
a(DROP_NTH_ASM_T 4 discard_tac);
a(LEMMA_Tⓩ ~ (~ (~ i div j) * j) = (~ i div j) * j⌝
	rewrite_thm_tac THEN1 rewrite_tac[z_minus_times_thm]);
a(POP_ASM_T rewrite_thm_tac);
a(LEMMA_Tⓩ0 ≤  ~ i mod j ⇒  ~ (~ i mod  j ) ≤ 0 ⌝ante_tac
	THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(asm_rewrite_tac[] THEN ⇒_tac);
a(all_asm_fc_tac[z_abs_thm]);
a(asm_rewrite_tac[z_plus_assoc_thm1,z_minus_thm]);
(* *** Goal "2" *** *)
a(cases_tacⓩi=0⌝);
(* *** Goal "2.1" *** *)
a(all_var_elim_asm_tac1);
a(LEMMA_Tⓩ0 intdiv j = 0⌝rewrite_thm_tac
	THEN1 ALL_ASM_FC_T rewrite_tac[cn_intdiv_0_thm]);
a(LEMMA_Tⓩk * j + m = 0 ⇒ m = ~(k * j)⌝ante_tac
	THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(DROP_NTH_ASM_T 3 (rewrite_thm_tac o eq_sym_rule));
a ⇒_tac;
a contr_tac;
a(POP_ASM_T (asm_tac o ¬_eq_sym_rule));
a(all_var_elim_asm_tac1);
a(DROP_NTH_ASM_T 3 (strip_asm_tac o rewrite_rule[z_abs_minus_thm]));
a(ante_tac(z_∀_elimⓩ(i ≜ k, j ≜ j)⌝z_abs_≤_times_thm));
a(asm_rewrite_tac[]);
(* *** Goal "2.2" *** *)
a(lemma_tacⓩ0 ≤ i * j ∨ i * j < 0⌝THEN1 prove_tac[]);
(* *** Goal "2.2.1" *** *)
a(ante_tac (z_∀_elimⓩ(x≜i, y≜j)⌝
		(∧_right_elim (z_get_specⓩ(_ intdiv _)⌝))));
a(GET_NTH_ASM_T 4 rewrite_thm_tac THEN ⇒_T (REPEAT_TTCL ∧_THEN asm_tac));
a(all_asm_fc_tac[]);
a(LIST_DROP_NTH_ASM_T[2,3,4,5,6,7](MAP_EVERY discard_tac));
a(POP_ASM_T rewrite_thm_tac);
a(LEMMA_Tⓩ0 < i * j⌝ante_tac);
(* *** Goal "2.2.1.1" *** *)
a(POP_ASM_T ante_tac THEN rewrite_tac[z_≤_less_eq_thm]
	THEN REPEAT strip_tac);
a(POP_ASM_T (ante_tac o eq_sym_rule));
a(asm_rewrite_tac[z_times_eq_0_thm]);
(* *** Goal "2.2.1.2" *** *)
a(POP_ASM_T discard_tac);
a(rewrite_tac[z_0_less_times_thm]);
a(DROP_NTH_ASM_T 2 strip_asm_tac);
(* *** Goal "2.2.1.2.1" *** *)
a(lemma_tacⓩabs m = m ∧ abs i = i⌝THEN1 ALL_ASM_FC_T rewrite_tac[z_abs_thm]);
a(DROP_NTH_ASM_T 5 ante_tac THEN POP_ASM_T rewrite_thm_tac
	THEN POP_ASM_T rewrite_thm_tac THEN ⇒_tac);
a(LEMMA_Tⓩ¬ i < 0⌝asm_tac THEN1 PC_T1"z_lin_arith"asm_prove_tac[]);
a(REPEAT strip_tac);
a(DROP_NTH_ASM_T 7 (asm_tac o eq_sym_rule));
a(ante_tac (z_∀_elim
	ⓩ(i ≜ i,j ≜ abs j,d ≜ k ,r ≜ m)⌝ z_div_mod_unique_thm));
a(DROP_NTH_ASM_T 5 ante_tac);
a(lemma_tacⓩabs j = j⌝THEN1 ALL_ASM_FC_T rewrite_tac[z_abs_pos_thm]);
a(asm_rewrite_tac[]);
a(⇒_T rewrite_thm_tac THEN ⇒_T rewrite_thm_tac);
(* *** Goal "2.2.1.2.2" *** *)
a(LEMMA_Tⓩm ≤ 0 ⇒ 0 ≤ ~m⌝ante_tac THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(POP_ASM_T rewrite_thm_tac THEN ⇒_T asm_tac);
a(lemma_tacⓩabs ~ m = ~ m ∧ abs i = ~ i⌝
	THEN1 ALL_ASM_FC_T rewrite_tac[z_abs_thm,z_abs_neg_thm]);
a(POP_ASM_T rewrite_thm_tac);
a(DROP_NTH_ASM_T 4 ante_tac 	THEN POP_ASM_T
	(rewrite_thm_tac o rewrite_rule[z_abs_minus_thm]) THEN ⇒_tac);
a(LEMMA_Tⓩ¬ 0 < i⌝asm_tac THEN1 PC_T1"z_lin_arith"asm_prove_tac[]);
a(REPEAT strip_tac);
a(DROP_NTH_ASM_T 6 (asm_tac o eq_sym_rule));
a(ante_tac (z_∀_elim
	ⓩ(i ≜ ~ i,j ≜ ~ j,d ≜  k ,r ≜ ~ m)⌝ z_div_mod_unique_thm));
a(DROP_NTH_ASM_T 4 ante_tac);
a(lemma_tacⓩabs j = ~ j⌝THEN1 ALL_ASM_FC_T rewrite_tac[z_abs_neg_thm]);
a(asm_rewrite_tac[z_abs_minus_thm]);
a(lemma_tacⓩ¬ j = 0 ⇒ ¬ ~ j = 0⌝THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(⇒_T rewrite_thm_tac THEN POP_ASM_T rewrite_thm_tac);
a(LEMMA_Tⓩ ~i =  k * ~ j + ~ m ⇔ k * j + m = i⌝asm_rewrite_thm_tac
	THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(⇒_T rewrite_thm_tac);
(* *** Goal "2.2.2" *** *)
a(ante_tac (z_∀_elimⓩ(x≜i, y≜j)⌝
		(∧_right_elim (z_get_specⓩ(_ intdiv _)⌝))));
a(GET_NTH_ASM_T 4 rewrite_thm_tac THEN ⇒_T (REPEAT_TTCL ∧_THEN asm_tac));
a(all_asm_fc_tac[]);
a(LIST_DROP_NTH_ASM_T[2,3,4,5,6](MAP_EVERY discard_tac));
a(POP_ASM_T rewrite_thm_tac);
a(POP_ASM_T ante_tac THEN rewrite_tac[z_times_less_0_thm]);
a(DROP_NTH_ASM_T 2 strip_asm_tac);
(* *** Goal "2.2.2.1" *** *)
a(lemma_tacⓩabs m = m ∧ abs i = i⌝THEN1 ALL_ASM_FC_T rewrite_tac[z_abs_thm]);
a(DROP_NTH_ASM_T 5 ante_tac THEN POP_ASM_T rewrite_thm_tac
	THEN POP_ASM_T rewrite_thm_tac THEN ⇒_tac);
a(LEMMA_Tⓩ¬ i < 0⌝asm_tac THEN1 PC_T1"z_lin_arith"asm_prove_tac[]);
a(REPEAT strip_tac);
a(DROP_NTH_ASM_T 7 (asm_tac o eq_sym_rule));
a(ante_tac (z_∀_elim
	ⓩ(i ≜ i,j ≜ abs j,d ≜ ~ k ,r ≜ m)⌝ z_div_mod_unique_thm));
a(DROP_NTH_ASM_T 5 ante_tac);
a(lemma_tacⓩabs j = ~ j⌝THEN1 ALL_ASM_FC_T rewrite_tac[z_abs_neg_thm]);
a(asm_rewrite_tac[z_abs_minus_thm]);
a(lemma_tacⓩ¬ j = 0 ⇒ ¬ ~ j = 0⌝THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(⇒_T rewrite_thm_tac THEN POP_ASM_T rewrite_thm_tac);
a(LEMMA_Tⓩi = ~ k * ~ j + m ⇔ k * j + m = i⌝asm_rewrite_thm_tac
	THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(LEMMA_Tⓩ~ k = i div ~ j ⇔ ~ (i div ~ j) = k⌝rewrite_thm_tac
	THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(⇒_T rewrite_thm_tac);
(* *** Goal "2.2.2.2" *** *)
a(LEMMA_Tⓩm ≤ 0 ⇒ 0 ≤ ~m⌝ante_tac THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(POP_ASM_T rewrite_thm_tac THEN ⇒_T asm_tac);
a(lemma_tacⓩabs ~ m = ~ m ∧ abs i = ~ i⌝
	THEN1 ALL_ASM_FC_T rewrite_tac[z_abs_thm,z_abs_neg_thm]);
a(POP_ASM_T rewrite_thm_tac);
a(DROP_NTH_ASM_T 4 ante_tac 	THEN POP_ASM_T
	(rewrite_thm_tac o rewrite_rule[z_abs_minus_thm]) THEN ⇒_tac);
a(LEMMA_Tⓩ¬ 0 < i⌝asm_tac THEN1 PC_T1"z_lin_arith"asm_prove_tac[]);
a(REPEAT strip_tac);
a(DROP_NTH_ASM_T 6 (asm_tac o eq_sym_rule));
a(ante_tac (z_∀_elim
	ⓩ(i ≜ ~ i,j ≜ j,d ≜ ~ k ,r ≜ ~ m)⌝ z_div_mod_unique_thm));
a(DROP_NTH_ASM_T 4 ante_tac);
a(lemma_tacⓩabs j = j⌝THEN1 ALL_ASM_FC_T rewrite_tac[z_abs_pos_thm]);
a(asm_rewrite_tac[]);
a(⇒_T rewrite_thm_tac);
a(LEMMA_Tⓩ ~i = ~ k * j + ~ m ⇔ k * j + m = i⌝asm_rewrite_thm_tac
	THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(LEMMA_Tⓩ~ k = ~ i div j ⇔ ~ (~ i div j) = k ⌝rewrite_thm_tac
	THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(⇒_T rewrite_thm_tac);
save_pop_thm"cn_intdiv_thm"
);
=TEX
=SML
val ⦏cn_rem_thm⦎ = (
set_goal([],ⓩ∀ i,j,k : ℤ | ¬j = 0 ⦁ (i rem j = k) ⇔
	(∃ d : ℤ ⦁ i = d * j + k ∧ abs k < abs j
	∧ ((0 ≤ i ∧ 0 ≤ k ) ∨ (i < 0 ∧ k ≤ 0)) )⌝);
a(z_∀_tac THEN ⇒_T strip_asm_tac);
a(⇔_T asm_tac);
(* *** Goal "1" *** *)
a(ante_tac (z_∀_elimⓩ(x≜i, y≜j)⌝
		(∧_right_elim (z_get_specⓩ(_ intdiv _)⌝))));
a(asm_rewrite_tac[]);
a(⇒_T (REPEAT_TTCL ∧_THEN asm_tac));
a(ante_tac(z_∀_elimⓩ(i ≜ i,j ≜ j,k ≜ i intdiv j)⌝cn_intdiv_thm));
a(asm_rewrite_tac[]);
a(⇒_tac);
(* *** Goal "1.1" *** *)
a(LIST_DROP_NTH_ASM_T[1,3](MAP_EVERY ante_tac));
a(LEMMA_Tⓩi = (i intdiv j) * j + m ⇒ m = i + ~ ((i intdiv j) * j)⌝
	ante_tac THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(DROP_NTH_ASM_T 2 (rewrite_thm_tac o eq_sym_rule));
a(⇒_T rewrite_thm_tac THEN REPEAT ⇒_tac);
a(z_∃_tacⓩi intdiv j⌝);
a(asm_rewrite_tac[]);
a(PC_T1"z_lin_arith"prove_tac[]);
(* *** Goal "1.2" *** *)
a(LIST_DROP_NTH_ASM_T[1,3](MAP_EVERY ante_tac));
a(LEMMA_Tⓩi = (i intdiv j) * j + m ⇒ m = i + ~ ((i intdiv j) * j)⌝
	ante_tac THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(DROP_NTH_ASM_T 2 (rewrite_thm_tac o eq_sym_rule));
a(⇒_T rewrite_thm_tac THEN REPEAT ⇒_tac);
a(z_∃_tacⓩi intdiv j⌝);
a(asm_rewrite_tac[]);
a(PC_T1"z_lin_arith"prove_tac[]);
(* *** Goal "2" *** *)
a(ante_tac (z_∀_elimⓩ(x≜i, y≜j)⌝
		(∧_right_elim (z_get_specⓩ(_ intdiv _)⌝))));
a(asm_rewrite_tac[]);
a(⇒_T (REPEAT_TTCL ∧_THEN asm_tac));
a(asm_rewrite_tac[]);
a(LIST_DROP_NTH_ASM_T[1,2,3,4,5](MAP_EVERY discard_tac));
a(POP_ASM_T strip_asm_tac);
(* *** Goal "2.1" *** *)
a(ante_tac(z_∀_elimⓩ(i ≜ i,j ≜ j,k ≜ d)⌝cn_intdiv_thm));
a(LEMMA_Tⓩ(∃ m : ℤ
                 ⦁ i = d * j + m
                   ∧ abs m < abs j
                   ∧ (0 ≤ i ∧ 0 ≤ m ∨ i < 0 ∧ m ≤ 0))⌝rewrite_thm_tac);
(* *** Goal "2.1.1" *** *)
a(z_∃_tacⓩk⌝THEN asm_rewrite_tac[]);
(* *** Goal "2.1.2" *** *)
a(DROP_NTH_ASM_T 5 rewrite_thm_tac THEN ⇒_T rewrite_thm_tac);
a(LEMMA_Tⓩd * j + k = i ⇒ i + ~ (d * j) = k⌝ante_tac
	THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(asm_rewrite_tac[]);
(* *** Goal "2.2" *** *)
a(ante_tac(z_∀_elimⓩ(i ≜ i,j ≜ j,k ≜ d)⌝cn_intdiv_thm));
a(LEMMA_Tⓩ(∃ m : ℤ
                 ⦁ i = d * j + m
                   ∧ abs m < abs j
                   ∧ (0 ≤ i ∧ 0 ≤ m ∨ i < 0 ∧ m ≤ 0))⌝rewrite_thm_tac);
(* *** Goal "2.2.1" *** *)
a(z_∃_tacⓩk⌝THEN asm_rewrite_tac[]);
(* *** Goal "2.2.2" *** *)
a(DROP_NTH_ASM_T 5 rewrite_thm_tac THEN ⇒_T rewrite_thm_tac);
a(LEMMA_Tⓩd * j + k = i ⇒ i + ~ (d * j) = k⌝ante_tac
	THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(asm_rewrite_tac[]);
save_pop_thm"cn_rem_thm"
);
=TEX
=SML
val ⦏cn_intmod_thm⦎ = (
set_goal([],ⓩ∀ i,j,k : ℤ | ¬j = 0 ⦁ (i intmod j = k) ⇔
	(∃ d : ℤ ⦁ i = d * j + k ∧ abs k < abs j
	∧ ((0 ≤ j ∧ 0 ≤ k ) ∨ (j < 0 ∧ k ≤ 0)) )⌝);
a(z_∀_tac THEN ⇒_T strip_asm_tac);
a(⇔_T asm_tac);
(* *** Goal "1" *** *)
a(cases_tacⓩi = 0⌝);
(* *** Goal "1.1" *** *)
a(all_var_elim_asm_tac1);
a(all_asm_fc_tac[z_abs_0_less_thm,cn_intdiv_0_thm]);
a(asm_rewrite_tac[]);
a(z_∃_tacⓩ0⌝  THEN rewrite_tac[]);
a(prove_tac[]);
(* *** Goal "1.2" *** *)
a(lemma_tacⓩ0 ≤ i * j ∨ i * j < 0⌝THEN1 prove_tac[]);
(* *** Goal "1.2.1" *** *)
a(z_∃_tacⓩi intdiv j⌝);
a(ante_tac (z_∀_elimⓩ(x≜i, y≜j)⌝
		(∧_right_elim (z_get_specⓩ(_ intdiv _)⌝))));
a(GET_NTH_ASM_T 4 rewrite_thm_tac);
a(⇒_T (REPEAT_TTCL ∧_THEN asm_tac));
a(all_asm_fc_tac[]);
a(LIST_DROP_NTH_ASM_T[1,3,4,6,7](MAP_EVERY discard_tac));
a(DROP_NTH_ASM_T 5 ante_tac THEN asm_rewrite_tac[]);
a(LIST_DROP_NTH_ASM_T[1,2](MAP_EVERY discard_tac));
a(ante_tac(z_∀_elimⓩ(i ≜ i,j ≜ j,k ≜ i intdiv j)⌝cn_intdiv_thm));
a(asm_rewrite_tac[]);
a(LEMMA_Tⓩ0 < i * j⌝ante_tac);
(* *** Goal "1.2.1.1" *** *)
a(POP_ASM_T ante_tac THEN rewrite_tac[z_≤_less_eq_thm]
	THEN REPEAT strip_tac);
a(POP_ASM_T (ante_tac o eq_sym_rule));
a(asm_rewrite_tac[z_times_eq_0_thm]);
(* *** Goal "1.2.1.2" *** *)
a(POP_ASM_T discard_tac);
a(rewrite_tac[z_0_less_times_thm]);
a(⇒_tac);
(* *** Goal "1.2.1.2.1" *** *)
a(LEMMA_Tⓩ¬ i < 0⌝asm_tac THEN1 PC_T1"z_lin_arith"asm_prove_tac[]);
a(⇒_tac THEN ⇒_tac);
a(lemma_tacⓩi + ~ ((i intdiv j) * j) = k ∧ i = (i intdiv j) * j + m ⇒
	(i intdiv j) * j + k = i ∧ k = m⌝THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(DROP_NTH_ASM_T 7 discard_tac THEN asm_rewrite_tac[]);
a(asm_rewrite_tac[z_≤_less_eq_thm]);
(* *** Goal "1.2.1.2.2" *** *)
a(LEMMA_Tⓩ¬ 0 ≤ i⌝asm_tac THEN1 PC_T1"z_lin_arith"asm_prove_tac[]);
a(⇒_tac THEN ⇒_tac);
a(lemma_tacⓩi + ~ ((i intdiv j) * j) = k ∧ i = (i intdiv j) * j + m ⇒
	(i intdiv j) * j + k = i ∧ k = m⌝THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(DROP_NTH_ASM_T 6 discard_tac THEN asm_rewrite_tac[]);
(* *** Goal "1.2.2" *** *)
a(ante_tac (z_∀_elimⓩ(x≜i, y≜j)⌝
		(∧_right_elim (z_get_specⓩ(_ intdiv _)⌝))));
a(GET_NTH_ASM_T 4 rewrite_thm_tac);
a(⇒_T (REPEAT_TTCL ∧_THEN asm_tac));
a(cases_tacⓩi rem j = 0⌝ THEN all_asm_fc_tac[]);
(* *** Goal "1.2.2.1" *** *)
a(POP_ASM_T discard_tac);
a(LIST_DROP_NTH_ASM_T[5,10](MAP_EVERY ante_tac) THEN asm_rewrite_tac[]);
a(LIST_DROP_NTH_ASM_T[1,2,3,4,5,6](MAP_EVERY discard_tac));
a(⇒_T (rewrite_thm_tac o eq_sym_rule));
a(⇒_tac);
a(LEMMA_Tⓩ0 = i + ~ ((i intdiv j) * j) ⇒ ((i intdiv j) * j) = i⌝ante_tac
	THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(POP_ASM_T (rewrite_thm_tac o eq_sym_rule) THEN ⇒_tac);
a(z_∃_tacⓩi intdiv j⌝);
a(all_asm_fc_tac[z_abs_0_less_thm]);
a(asm_rewrite_tac[]);
a(prove_tac[]);
(* *** Goal "1.2.2.2" *** *)
a(POP_ASM_T discard_tac);
a(LIST_DROP_NTH_ASM_T[2,10](MAP_EVERY ante_tac) THEN asm_rewrite_tac[]);
a(LIST_DROP_NTH_ASM_T[1,2,3,4,5,6](MAP_EVERY discard_tac));
a(REPEAT  ⇒_tac);
a(z_∃_tacⓩi intdiv j + ~ 1⌝);
a(LEMMA_Tⓩ(i + ~ ((i intdiv j) * j)) + j = k ⇒ (i intdiv j + ~ 1) * j + k = i⌝
	ante_tac THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(DROP_NTH_ASM_T 2 rewrite_thm_tac THEN ⇒_tac);
a(ante_tac(z_∀_elimⓩ(i ≜ i,j ≜ j,k ≜ i intdiv j)⌝cn_intdiv_thm));
a(asm_rewrite_tac[]);
a(LEMMA_Tⓩ(i intdiv j + ~ 1) * j + k = i ⇒ (i intdiv j) * j = i + (j + ~ k)⌝
	ante_tac THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(asm_rewrite_tac[] THEN REPEAT ⇒_tac);
(* *** Goal "1.2.2.2.1" *** *)
a(lemma_tacⓩ(i intdiv j) * j = i + (j + ~ k) ∧(i = (i intdiv j) * j + m)
	⇒ k = j + m⌝THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(LEMMA_Tⓩ(i = (i intdiv j) * j + m)  ∧ ¬ i + ~ ((i intdiv j) * j) = 0
	∧ 0 ≤ m ⇒ 0 < m⌝ante_tac THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(DROP_NTH_ASM_T 5 (rewrite_thm_tac o eq_sym_rule));
a(LIST_DROP_NTH_ASM_T[5,6](MAP_EVERY discard_tac));
a(LIST_DROP_NTH_ASM_T[1,2,5](MAP_EVERY rewrite_thm_tac));
a(LEMMA_Tⓩ¬ i < 0⌝asm_tac THEN1 PC_T1"z_lin_arith"asm_prove_tac[]);
a(DROP_NTH_ASM_T 4 (strip_asm_tac o rewrite_rule[z_times_less_0_thm]));
a(LEMMA_Tⓩ¬ 0 ≤ j⌝asm_tac THEN1 PC_T1"z_lin_arith"asm_prove_tac[]);
a(⇒_tac);
a(DROP_NTH_ASM_T 7 ante_tac);
a(LEMMA_Tⓩabs m = m ∧ abs j = ~j⌝asm_rewrite_thm_tac
	THEN1 ALL_ASM_FC_T rewrite_tac[z_abs_pos_thm,z_abs_neg_thm]);
a(⇒_tac);
a(LEMMA_Tⓩm < ~ j ⇒ j + m < 0⌝ante_tac THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(POP_ASM_T rewrite_thm_tac THEN ⇒_tac);
a(LEMMA_Tⓩabs (j + m) = ~(j + m)⌝rewrite_thm_tac
	THEN1 ALL_ASM_FC_T rewrite_tac[z_abs_neg_thm]);
a(asm_rewrite_tac[z_≤_less_eq_thm]);
a(DROP_NTH_ASM_T 2 ante_tac THEN PC_T1"z_lin_arith"prove_tac[]);
(* *** Goal "1.2.2.2.2" *** *)
a(lemma_tacⓩ(i intdiv j) * j = i + (j + ~ k) ∧(i = (i intdiv j) * j + m)
	⇒ k = j + m⌝THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(LEMMA_Tⓩ(i = (i intdiv j) * j + m)  ∧ ¬ i + ~ ((i intdiv j) * j) = 0
	∧ m ≤ 0 ⇒ m < 0⌝ante_tac THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(DROP_NTH_ASM_T 5 (rewrite_thm_tac o eq_sym_rule));
a(LIST_DROP_NTH_ASM_T[5,6](MAP_EVERY discard_tac));
a(LIST_DROP_NTH_ASM_T[1,2,5](MAP_EVERY rewrite_thm_tac));
a(LEMMA_Tⓩ¬ 0 < i⌝asm_tac THEN1 PC_T1"z_lin_arith"asm_prove_tac[]);
a(DROP_NTH_ASM_T 4 (strip_asm_tac o rewrite_rule[z_times_less_0_thm]));
a(LEMMA_Tⓩ¬ j < 0⌝asm_tac THEN1 PC_T1"z_lin_arith"asm_prove_tac[]);
a(⇒_tac);
a(DROP_NTH_ASM_T 6 ante_tac);
a(LEMMA_Tⓩabs m = ~ m ∧ abs j = j⌝asm_rewrite_thm_tac
	THEN1 ALL_ASM_FC_T rewrite_tac[z_abs_pos_thm,z_abs_neg_thm]);
a(⇒_tac);
a(LEMMA_Tⓩ~ m <  j ⇒ 0 < j + m⌝ante_tac THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(POP_ASM_T rewrite_thm_tac THEN ⇒_tac);
a(LEMMA_Tⓩabs (j + m) = j + m⌝rewrite_thm_tac
	THEN1 ALL_ASM_FC_T rewrite_tac[z_abs_pos_thm]);
a(asm_rewrite_tac[z_≤_less_eq_thm]);
(* *** Goal "2" *** *)
a(cases_tacⓩi=0⌝);
(* *** Goal "2.1" *** *)
a(all_asm_fc_tac[cn_intdiv_0_thm]);
a(LIST_DROP_NTH_ASM_T[2,3](MAP_EVERY discard_tac));
a(all_var_elim_asm_tac1 THEN POP_ASM_T rewrite_thm_tac);
(* *** Goal "2.1.1" *** *)
a(conv_tac eq_sym_conv);
a(LEMMA_Tⓩ0 = d * j + k ⇒ k = ~ (d * j)⌝ante_tac
	THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(DROP_NTH_ASM_T 4(rewrite_thm_tac o eq_sym_rule));
a(cases_tacⓩd=0⌝THEN_TRY asm_rewrite_tac[]);
a(⇒_tac THEN i_contr_tac);
a(DROP_NTH_ASM_T 5 ante_tac THEN asm_rewrite_tac[z_abs_minus_thm]);
a(all_asm_fc_tac[z_abs_≤_times_thm]);
(* *** Goal "2.1.2" *** *)
a(conv_tac eq_sym_conv);
a(LEMMA_Tⓩ0 = d * j + k ⇒ k = ~ (d * j)⌝ante_tac
	THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(DROP_NTH_ASM_T 4(rewrite_thm_tac o eq_sym_rule));
a(cases_tacⓩd=0⌝THEN_TRY asm_rewrite_tac[]);
a(⇒_tac THEN i_contr_tac);
a(DROP_NTH_ASM_T 5 ante_tac THEN asm_rewrite_tac[z_abs_minus_thm]);
a(all_asm_fc_tac[z_abs_≤_times_thm]);
(* *** Goal "2.2" *** *)
a(lemma_tacⓩ0 ≤ i * j ∨ i * j < 0⌝THEN1 prove_tac[]);
(* *** Goal "2.2.1" *** *)
a(LEMMA_Tⓩ0 < i * j⌝ante_tac);
(* *** Goal "2.2.1.1" *** *)
a(POP_ASM_T ante_tac THEN rewrite_tac[z_≤_less_eq_thm]
	THEN REPEAT strip_tac);
a(POP_ASM_T (ante_tac o eq_sym_rule));
a(asm_rewrite_tac[z_times_eq_0_thm]);
(* *** Goal "2.2.1.2" *** *)
a(ante_tac (z_∀_elimⓩ(x≜i, y≜j)⌝
		(∧_right_elim (z_get_specⓩ(_ intdiv _)⌝))));
a(GET_NTH_ASM_T 4 rewrite_thm_tac);
a(⇒_T (REPEAT_TTCL ∧_THEN asm_tac));
a(all_asm_fc_tac[]);
a(LIST_DROP_NTH_ASM_T[1,3,4,6,7,8](MAP_EVERY discard_tac));
a(POP_ASM_T rewrite_thm_tac THEN POP_ASM_T rewrite_thm_tac);
a(rewrite_tac[z_0_less_times_thm] THEN ⇒_T asm_tac);
a(DROP_NTH_ASM_T 3 strip_asm_tac);
(* *** Goal "2.2.1.2.1" *** *)
a(LEMMA_Tⓩi = d * j + k ⇒ i + ~ (d * j) = k⌝ante_tac
	THEN1 PC_T1"z_lin_arith" prove_tac[]);
a(GET_NTH_ASM_T 4 (rewrite_thm_tac o eq_sym_rule));
a ⇒_tac;
a(LEMMA_Tⓩ¬ j = 0 ∧ 0 ≤ j ⇒ 0 < j⌝ante_tac
	THEN1 PC_T1"z_lin_arith" prove_tac[]);
a(DROP_NTH_ASM_T 3 rewrite_thm_tac);
a ⇒_tac;
a(ante_tac(z_∀_elimⓩ(i ≜ i,j ≜ j,k ≜ d)⌝cn_intdiv_thm));
a(GET_NTH_ASM_T 8 rewrite_thm_tac);
a(LEMMA_Tⓩ∃ m : ℤ
                 ⦁ i = d * j + m
                   ∧ abs m < abs j
                   ∧ (0 ≤ i ∧ 0 ≤ m ∨ i < 0 ∧ m ≤ 0)⌝rewrite_thm_tac);
(* *** Goal "2.2.1.2.1.1" *** *)
a(z_∃_tacⓩk⌝);
a(DROP_NTH_ASM_T 5 (asm_rewrite_thm_tac o eq_sym_rule));
a(LIST_DROP_NTH_ASM_T[2,4](MAP_EVERY discard_tac));
a(LEMMA_Tⓩ¬ j < 0⌝asm_tac THEN1 PC_T1"z_lin_arith"asm_prove_tac[]);
a(DROP_NTH_ASM_T 4 strip_asm_tac);
a(asm_rewrite_tac[z_≤_less_eq_thm]);
(* *** Goal "2.2.1.2.1.2" *** *)
a(⇒_T rewrite_thm_tac);
a(DROP_NTH_ASM_T 2 rewrite_thm_tac);
(* *** Goal "2.2.1.2.2" *** *)
a(LEMMA_Tⓩi = d * j + k ⇒ i + ~ (d * j) = k⌝ante_tac
	THEN1 PC_T1"z_lin_arith" prove_tac[]);
a(GET_NTH_ASM_T 4 (rewrite_thm_tac o eq_sym_rule));
a ⇒_tac;
a(ante_tac(z_∀_elimⓩ(i ≜ i,j ≜ j,k ≜ d)⌝cn_intdiv_thm));
a(GET_NTH_ASM_T 8 rewrite_thm_tac);
a(LEMMA_Tⓩ∃ m : ℤ
                 ⦁ i = d * j + m
                   ∧ abs m < abs j
                   ∧ (0 ≤ i ∧ 0 ≤ m ∨ i < 0 ∧ m ≤ 0)⌝rewrite_thm_tac);
(* *** Goal "2.2.1.2.2.1" *** *)
a(z_∃_tacⓩk⌝);
a(DROP_NTH_ASM_T 5 (asm_rewrite_thm_tac o eq_sym_rule));
a(LIST_DROP_NTH_ASM_T[1,4](MAP_EVERY discard_tac));
a(LEMMA_Tⓩ¬ 0 < j⌝asm_tac THEN1 PC_T1"z_lin_arith"asm_prove_tac[]);
a(DROP_NTH_ASM_T 4 strip_asm_tac);
a(asm_rewrite_tac[]);
(* *** Goal "2.2.1.2.2.2" *** *)
a(⇒_T rewrite_thm_tac);
a(POP_ASM_T rewrite_thm_tac);
(* *** Goal "2.2.2." *** *)
a(ante_tac (z_∀_elimⓩ(x≜i, y≜j)⌝
		(∧_right_elim (z_get_specⓩ(_ intdiv _)⌝))));
a(GET_NTH_ASM_T 4 rewrite_thm_tac);
a(⇒_T (REPEAT_TTCL ∧_THEN asm_tac));
a(cases_tacⓩi rem j = 0⌝ THEN all_asm_fc_tac[]);
(* *** Goal "2.2.2.1" *** *)
a(POP_ASM_T discard_tac);
a(DROP_NTH_ASM_T 5 ante_tac THEN asm_rewrite_tac[]);
a(LIST_DROP_NTH_ASM_T[1,2,3,4,5,6](MAP_EVERY discard_tac));
a(LEMMA_Tⓩ0 = i + ~ ((i intdiv j) * j) ⇔ ((i intdiv j) * j) = i⌝rewrite_thm_tac
	THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(⇒_tac);
a(DROP_NTH_ASM_T 4 strip_asm_tac);
(* *** Goal "2.2.2.1.1" *** *)
a(LIST_DROP_NTH_ASM_T[1,2](MAP_EVERY discard_tac));
set_labelled_goal"2.2.2.1.2";
(* *** Goal "2.2.2.1.2" *** *)
a(LIST_DROP_NTH_ASM_T[1,2](MAP_EVERY discard_tac));
a(conv_tac eq_sym_conv);
a(lemma_tacⓩ(i intdiv j) * j = i ∧ i = d * j + k ⇒ ((i intdiv j) * j = d * j + k
	∧ i + ~ (d * j)=k)⌝
	THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(LIST_DROP_NTH_ASM_T[4,5](MAP_EVERY discard_tac));
a(DROP_NTH_ASM_T 2 ante_tac THEN cases_tacⓩi intdiv j = d⌝
	THEN_TRY asm_rewrite_tac[]);
a(⇒_tac THEN i_contr_tac);
a(lemma_tacⓩ(i intdiv j) * j = d * j + k ⇒ k = ((i intdiv j) + ~ d) * j⌝
	THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(lemma_tacⓩ¬ i intdiv j = d ⇒ ¬ (i intdiv j + ~ d) = 0⌝
	THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(DROP_NTH_ASM_T 6 ante_tac THEN asm_rewrite_tac[]);
a(all_asm_fc_tac[z_abs_≤_times_thm]);
(* *** Goal "2.2.2.2" *** *)
a(POP_ASM_T discard_tac);
a(POP_ASM_T rewrite_thm_tac);
a(LIST_DROP_NTH_ASM_T[2,3,4,5,6](MAP_EVERY discard_tac));
a(cases_tacⓩk=0⌝);
(* *** Goal "2.2.2.2.1" *** *)
a(all_var_elim_asm_tac1);
(* *** Goal "2.2.2.2.1.1" *** *)
a(DROP_NTH_ASM_T 4 discard_tac);
set_labelled_goal"2.2.2.2.1.2";
(* *** Goal "2.2.2.2.1.2" *** *)
a(DROP_NTH_ASM_T 4 discard_tac);
a(i_contr_tac);
a(POP_ASM_T ante_tac THEN ALL_FC_T1 fc_⇔_canon rewrite_tac[cn_rem_thm]);
a(z_∃_tac⌜d⌝);
a(DROP_NTH_ASM_T 4 (rewrite_thm_tac o eq_sym_rule o rewrite_rule[]));
a(DROP_NTH_ASM_T 3 ante_tac THEN rewrite_tac[]);
a(prove_tac[]);
(* *** Goal "2.2.2.2.2" *** *)
a(DROP_NTH_ASM_T 2 discard_tac);
a(DROP_NTH_ASM_T 2 (asm_tac o rewrite_rule[z_times_less_0_thm]));
a(LEMMA_Tⓩi rem j + j = k ⇔ i rem j = k + ~ j⌝rewrite_thm_tac
	THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(ALL_FC_T1 fc_⇔_canon rewrite_tac[cn_rem_thm]);
a(DROP_NTH_ASM_T 4 strip_asm_tac);
(* *** Goal "2.2.2.2.2.1" *** *)
a(z_∃_tacⓩd + 1⌝);
a(LEMMA_Tⓩ(d + 1) * j + (k + ~ j) = d * j + k⌝rewrite_thm_tac
	THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(DROP_NTH_ASM_T 4 (rewrite_thm_tac o eq_sym_rule));
a(LEMMA_Tⓩ¬ j < 0⌝asm_tac THEN1 PC_T1"z_lin_arith"asm_prove_tac[]);
a(DROP_NTH_ASM_T 5 strip_asm_tac);
a(DROP_NTH_ASM_T 6 ante_tac);
a(LEMMA_Tⓩabs k = k ∧ abs j = j⌝rewrite_thm_tac
	THEN1 ALL_ASM_FC_T rewrite_tac[z_abs_thm]);
a(⇒_tac);
a(LEMMA_Tⓩk < j ⇒ k + ~ j < 0⌝ante_tac THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(POP_ASM_T rewrite_thm_tac);
a(⇒_tac);
a(lemma_tacⓩabs (k + ~ j) = ~ (k + ~ j)⌝
	THEN1 ALL_ASM_FC_T rewrite_tac[z_abs_neg_thm]);
a(asm_rewrite_tac[z_minus_thm,z_≤_less_eq_thm]);
a(LIST_DROP_NTH_ASM_T[6,8](MAP_EVERY ante_tac) THEN
	 PC_T1"z_lin_arith"prove_tac[]);
(* *** Goal "2.2.2.2.2.2" *** *)
a(z_∃_tacⓩd + 1⌝);
a(LEMMA_Tⓩ(d + 1) * j + (k + ~ j) = d * j + k⌝rewrite_thm_tac
	THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(DROP_NTH_ASM_T 4 (rewrite_thm_tac o eq_sym_rule));
a(LEMMA_Tⓩ¬ 0 < j⌝asm_tac THEN1 PC_T1"z_lin_arith"asm_prove_tac[]);
a(DROP_NTH_ASM_T 5 strip_asm_tac);
a(DROP_NTH_ASM_T 5 ante_tac);
a(LEMMA_Tⓩ¬ k = 0 ∧ k ≤ 0 ⇒ k < 0⌝ante_tac
	THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(asm_rewrite_tac[]);
a(⇒_tac);
a(LEMMA_Tⓩabs k = ~ k ∧ abs j = ~ j⌝rewrite_thm_tac
	THEN1 ALL_ASM_FC_T rewrite_tac[z_abs_neg_thm]);
a(⇒_tac);
a(LEMMA_Tⓩ~ k < ~ j ⇒ 0 < k + ~ j ⌝ante_tac
	 THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(POP_ASM_T rewrite_thm_tac);
a(⇒_tac);
a(lemma_tacⓩabs (k + ~ j) =  (k + ~ j)⌝
	THEN1 ALL_ASM_FC_T rewrite_tac[z_abs_pos_thm]);
a(asm_rewrite_tac[z_minus_thm,z_≤_less_eq_thm]);
save_pop_thm"cn_intmod_thm"
);
=TEX
=SML
val _ = push_pc "z_library1";
val ⦏z_succ↗n↕_⨾_thm⦎ = (
set_goal([], ⓩ∀ x : 𝕌; y : 𝕌 ⦁
	(succ ↗ x ↕ ⨾ y) =
		{ a : 𝕌; b : 𝕌 |
		((1 ≤ x ∧ 0 ≤ a) ∨ (¬ (0 ≤ x) ∧ ((0 - x) ≤ a)) ∨ (x = 0));
		(a + x, b) ∈ y ⦁
		(a, b)}
	⌝);
a(z_∀_tac THEN strip_tac);
a(lemma_tac ⓩx ≤ ~ 1 ∨ x = 0 ∨ 1 ≤ x⌝ THEN1 PC_T1 "z_lin_arith" prove_tac[]);
(* *** Goal "1" *** *)
a(strip_asm_tac (z_∀_elim ⓩ~ x⌝ z_succ↗minus_n↕_thm));
(* *** Goal "1.1" *** *)
a(PC_T1 "z_lin_arith" asm_prove_tac[]);
(* *** Goal "1.2" *** *)
a(PC_T1 "z_lin_arith" asm_prove_tac[]);
(* *** Goal "1.3" *** *)
a(DROP_NTH_ASM_T 1 (rewrite_thm_tac o rewrite_rule[]));
a(PC_T1 "z_library1_ext" asm_rewrite_tac []);
a(REPEAT strip_tac THEN_TRY PC_T1 "z_lin_arith" asm_prove_tac[]);
(* *** Goal "1.3.1" *** *)
a(all_var_elim_asm_tac1);
a(asm_rewrite_tac[pc_rule1 "z_lin_arith" prove_rule []  ⓩ(y' + ~ x) + x = y'⌝]);
(* *** Goal "1.3.2" *** *)
a(z_∃_tac ⓩx1 + x⌝ THEN REPEAT strip_tac);
a(z_∃_tac ⓩx1 + x⌝ THEN PC_T1 "z_lin_arith" asm_prove_tac[]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac [z_succ↗0↕_thm]);
a(PC_T1 "z_library1_ext" rewrite_tac[]);
a(REPEAT strip_tac THEN_TRY PC_T1 "z_lin_arith" asm_prove_tac[]);
(* *** Goal "2.1" *** *)
a(all_var_elim_asm_tac1);
(* *** Goal "2.2" *** *)
a(z_∃_tac ⓩx1⌝ THEN REPEAT strip_tac);
(* *** Goal "3" *** *)
a(strip_asm_tac (z_∀_elim ⓩx⌝ z_succ↗n↕_thm));
a(DROP_NTH_ASM_T 1 rewrite_thm_tac);
a(PC_T1 "z_library1_ext" asm_rewrite_tac []);
a(REPEAT strip_tac THEN_TRY all_var_elim_asm_tac1);
(* *** Goal "3.1" *** *)
a(z_∃_tac ⓩx1 + x⌝ THEN REPEAT strip_tac);
a(z_∃_tac ⓩx1⌝ THEN REPEAT strip_tac);
(* *** Goal "3.2" *** *)
a(PC_T1 "z_lin_arith" asm_prove_tac[]);
save_pop_thm "z_succ↗n↕_⨾_thm"
);
val _ = pop_pc();
val _ = set_flag("subgoal_package_quiet", old_sgpq_flag);
=TEX
\section{EPILOGUE}
=SML
end (* of structure CNToolkitExtensions *);
open CNToolkitExtensions;
=TEX
\small
\twocolumn[\section{INDEX}]
\printindex
\end{document}

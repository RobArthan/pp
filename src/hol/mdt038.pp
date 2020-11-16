=IGN
********************************************************************************
mdt038.doc: this file is part of the PPHol system

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

\def\Title{Elementary Theory of Arithmetic}

\def\AbstractText{Module tests are given for the functions associated with the elementary theory of arithmetic. This document also checks that the theory design has been met by the theory implementation.}

\def\Reference{DS/FMU/IED/MDT038}

\def\Author{R.D.Arthan}


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
%% LaTeX2e port: \TPPtitle{Elementary Theory of Arithmetic}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/MDT038}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{1.15 %
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{2002/10/17 16:20:01 %
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{ML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{R.D.Arthan & WIN01}  %% Mandatory field
%% LaTeX2e port: \TPPauthorisation{R.B.Jones & HAT Manager}
%% LaTeX2e port: \TPPabstract{Module tests are given for the
%% LaTeX2e port: functions associated with the elementary
%% LaTeX2e port: theory of arithmetic.
%% LaTeX2e port: This document also checks that the theory design has been met by the theory implementation.}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	    Library
%% LaTeX2e port: }}
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
\item [Issue 1.1 (1991/10/09)]
First draft version.
\item [Issue 1.2 (1991/10/31)]
Corrected some fixity precedence problems.

\item[Issue 1.4 (1992/01/20), \FormatDate{92/01/20} ] Updated to use new fonts.
\item [Issue 1.5 (1992/01/28)]
Fixed arithmetic theory names.
\item [Issue 1.6 (1992/03/20)]
Changed to use proof contexts of issue 1.13 of \cite{DS/FMU/IED/DTD051}.
\item [Issue 1.8 (1992/04/09) (9th April 1992)]
Changes required by CR0016.
\item [Issue 1.9 (1992/04/14) (14th April 1992)]
Changes required by CR0017.
\item [Issue 1.10 (1992/05/14) (14th May 1992)]
Tidying up proof contexts.
\item [Issue 1.11 (1992/05/21) (20th May 1992)]
Rearranging build proof contexts.
\item [Issue 1.12 (1992/05/27) (27th May 1992)]
Removed uses of $makestring$.
\item[Issue 1.13 (1992/06/24) (24th June 1992)]
Renamings from issue 1.6 of \cite{DS/FMU/IED/WRK038},
mostly proof context name changes.
\item[Issue 1.14 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.15 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.16 (2005/05/07)] HOL now supports left-associative operators.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
None.
\section{GENERAL}
\subsection{Scope}
This document contains the module testing of the functions (conversions ,etc) associated with the elementary
theory of arithmetic required by \cite{DS/FMU/IED/DTD038} and
implemented in \cite{DS/FMU/IED/IMP038}.

\subsection{Introduction}
\subsubsection{Purpose and Background}
See \cite{DS/FMU/IED/DTD038}.

\subsubsection{Dependencies}
The test material depends on \cite{DS/FMU/IED/DTD013},
\cite{DS/FMU/IED/DTD035} and \cite{DS/FMU/IED/IMP038}.

\subsubsection{Deficiencies}
None known.
\section{INITIALISATION}
Initialise the test package:
=SML
use_file "dtd013.sml";
use_file "imp013.sml";
init_mt_results();
(open_theory "basic_hol" handle Fail _ => open_theory"ℕ");
push_merge_pcs ["'propositions","'simple_abstractions"];
=TEX
\section{TEST CASES}
The tests are grouped according to the function to be tested as follows:
\begin{description}
\item[Group 1]
This group tests correct and failure cases for $plus1\_conv$.
\item[Group 2]
This group tests correct and failure cases for $induction\_tac$.
\item[Group 3]
This group tests correct and failure cases for $INDUCTION\_T$.
\item[Group 4]
This group tests correct and failure cases for $cov\_induction\_tac$.
\item[Group 5]
This group tests correct and failure cases for $COV\_INDUCTION\_T$.
\end{description}
\section{THE TESTS}
\subsection{Group 1}
=SML
store_mt_results (mt_runf (op =#))[
("MDT038.1.1", dest_thm o plus1_conv, ⌜1⌝, ([], ⌜1 = (0 + 1)⌝)),
("MDT038.1.2", dest_thm o plus1_conv, ⌜2⌝, ([], ⌜2 = (1 + 1)⌝)),
("MDT038.1.3", dest_thm o plus1_conv, ⌜100000000⌝, ([], ⌜100000000 = (99999999 + 1)⌝))
];

store_mt_results mt_run_fail[
("MDT038.1.4", plus1_conv, ⌜0⌝, gen_fail_msg "plus1_conv" 7100 [string_of_term⌜0⌝])
];
=TEX
\subsection{Group 2}
=SML
store_mt_results (mt_runf (op =#))[("MDT038.2.1",
	dest_thm o simple_tac_proof,
	(([⌜(∀i⦁f (i + 1) ≤ f i)⌝], ⌜f i ≤ f 0⌝),
	induction_tac⌜i:ℕ⌝ THEN_LIST [
	rewrite_tac[≤_clauses],
	EVERY[
	DROP_ASM_T ⌜(∀i⦁f (i + 1) ≤ f i)⌝ (asm_tac o all_simple_∀_elim),
	strip_asm_tac(list_simple_∀_elim
			[⌜(f:ℕ→ℕ)(i+1)⌝, ⌜(f:ℕ→ℕ)i⌝, ⌜(f:ℕ→ℕ)0⌝]≤_trans_thm)
	]]),
	([⌜(∀i⦁f (i + 1) ≤ f i)⌝], ⌜f i ≤ f 0⌝)
)];
=TEX
=SML
store_mt_results mt_run_fail[
("MDT038.2.2", induction_tac, ⌜x:'a⌝,
	gen_fail_msg "induction_tac" 38001 [string_of_term⌜x:'a⌝])
];
=TEX
=SML
store_mt_results mt_run_fail[
("MDT038.2.3", induction_tac ⌜y:ℕ⌝, ([⌜x=1⌝], ⌜1=x⌝),
	gen_fail_msg "induction_tac" 38002 [string_of_term⌜y:ℕ⌝]),
("MDT038.2.4", induction_tac ⌜x:ℕ⌝, ([⌜x=1⌝], ⌜1=x⌝),
	gen_fail_msg "induction_tac" 38003 [string_of_term⌜x:ℕ⌝])
];
=TEX
\subsection{Group 3}
=SML
store_mt_results (mt_runf (op =#))[("MDT038.3.1",
	dest_thm o simple_tac_proof,
	(([⌜(∀i⦁f (i + 1) ≤ f i)⌝], ⌜f i ≤ f 0⌝),
	INDUCTION_T ⌜i:ℕ⌝ (asm_tac o simple_∀_intro⌜x:'a⌝)THEN_LIST [
	rewrite_tac[≤_clauses],
	EVERY[
	DROP_ASM_T ⌜(∀x⦁ f i ≤ f 0)⌝ (asm_tac o all_simple_∀_elim),
	DROP_ASM_T ⌜(∀i⦁f (i + 1) ≤ f i)⌝ (asm_tac o all_simple_∀_elim),
	strip_asm_tac(list_simple_∀_elim
			[⌜(f:ℕ→ℕ)(i+1)⌝, ⌜(f:ℕ→ℕ)i⌝, ⌜(f:ℕ→ℕ)0⌝]≤_trans_thm)
	]]),
	([⌜(∀i⦁f (i + 1) ≤ f i)⌝], ⌜f i ≤ f 0⌝)
)];
=TEX
=SML
store_mt_results mt_run_fail[
("MDT038.3.2", INDUCTION_T, ⌜x:'a⌝,
	gen_fail_msg "INDUCTION_T" 38001 [string_of_term⌜x:'a⌝])
];
=TEX
=SML
store_mt_results mt_run_fail[
("MDT038.3.3", INDUCTION_T ⌜y:ℕ⌝ asm_tac, ([⌜x=1⌝], ⌜1=x⌝),
	gen_fail_msg "INDUCTION_T" 38002 [string_of_term⌜y:ℕ⌝]),
("MDT038.3.4", INDUCTION_T ⌜x:ℕ⌝ asm_tac, ([⌜x=1⌝], ⌜1=x⌝),
	gen_fail_msg "INDUCTION_T" 38003 [string_of_term⌜x:ℕ⌝])
];
=TEX
\subsection{Group 4}
=SML
store_mt_results (mt_runf (op =#))[("MDT038.4.1",
	dest_thm o simple_tac_proof,
	(([⌜(p:ℕ→BOOL)i⌝], ⌜∃m⦁ p m ∧ ∀i⦁ p i ⇒ ¬i < m⌝),
	asm_ante_tac⌜(p:ℕ→BOOL)i⌝ THEN cov_induction_tac⌜i:ℕ⌝ THEN
	strip_tac THEN cases_tac⌜∃n⦁n < i ∧ p n⌝ THEN_LIST[
		(* *** Goal "1" *** *)
		GET_NTH_ASM_T 4 (strip_asm_tac o simple_∀_elim ⌜n:ℕ⌝) THEN
			simple_∃_tac⌜m:ℕ⌝ THEN asm_rewrite_tac[],
		(* *** Goal "2" *** *)
		simple_∃_tac⌜i:ℕ⌝ THEN REPEAT strip_tac THEN
			GET_NTH_ASM_T 2 (strip_asm_tac o simple_∀_elim ⌜i':ℕ⌝)
	]),
	([⌜(p:ℕ→BOOL)i⌝], ⌜∃m⦁ p m ∧ ∀i⦁ p i ⇒ ¬i < m⌝)
)];
=TEX
=SML
store_mt_results mt_run_fail[
("MDT038.4.2", cov_induction_tac, ⌜x:'a⌝,
	gen_fail_msg "cov_induction_tac" 38001 [string_of_term⌜x:'a⌝])
];
=TEX
=SML
store_mt_results mt_run_fail[
("MDT038.4.3", cov_induction_tac ⌜y:ℕ⌝, ([⌜x=1⌝], ⌜1=x⌝),
	gen_fail_msg "cov_induction_tac" 38002 [string_of_term⌜y:ℕ⌝]),
("MDT038.4.4", cov_induction_tac ⌜x:ℕ⌝, ([⌜x=1⌝], ⌜1=x⌝),
	gen_fail_msg "cov_induction_tac" 38003 [string_of_term⌜x:ℕ⌝])
];
=TEX
\subsection{Group 5}
=SML
store_mt_results (mt_runf (op =#))[("MDT038.5.1",
	dest_thm o simple_tac_proof,
	(([⌜(p:ℕ→BOOL)i⌝], ⌜∃m⦁ p m ∧ ∀i⦁ p i ⇒ ¬i < m⌝),
	asm_ante_tac⌜(p:ℕ→BOOL)i⌝ THEN COV_INDUCTION_T⌜i:ℕ⌝
			(asm_tac o simple_∀_intro⌜X:'a⌝) THEN
	strip_tac THEN cases_tac⌜∃n⦁n < i ∧ p n⌝ THEN_LIST[
		(* *** Goal "1" *** *)
		GET_NTH_ASM_T 4 (strip_asm_tac o simple_∀_elim ⌜n:ℕ⌝
					o simple_∀_elim⌜X:'a⌝) THEN
			simple_∃_tac⌜m:ℕ⌝ THEN asm_rewrite_tac[],
		(* *** Goal "2" *** *)
		simple_∃_tac⌜i:ℕ⌝ THEN REPEAT strip_tac THEN
			GET_NTH_ASM_T 2 (strip_asm_tac o simple_∀_elim ⌜i':ℕ⌝)
	]),
	([⌜(p:ℕ→BOOL)i⌝], ⌜∃m⦁ p m ∧ ∀i⦁ p i ⇒ ¬i < m⌝)
)];
=TEX
=SML
store_mt_results mt_run_fail[
("MDT038.5.2", COV_INDUCTION_T, ⌜x:'a⌝,
	gen_fail_msg "COV_INDUCTION_T" 38001 [string_of_term⌜x:'a⌝])
];
=TEX
=SML
store_mt_results mt_run_fail[
("MDT038.5.3", COV_INDUCTION_T ⌜y:ℕ⌝ asm_tac, ([⌜x=1⌝], ⌜1=x⌝),
	gen_fail_msg "COV_INDUCTION_T" 38002 [string_of_term⌜y:ℕ⌝]),
("MDT038.5.4", COV_INDUCTION_T ⌜x:ℕ⌝ asm_tac, ([⌜x=1⌝], ⌜1=x⌝),
	gen_fail_msg "COV_INDUCTION_T" 38003 [string_of_term⌜x:ℕ⌝])
];
=TEX
\section{CHECK THE THEORY DESIGN}
=SML
use_file "dtd038.tch";
store_mt_results mt_run [("theory design of ℕ",
	theory_check_success,
	(),
	true)];
=TEX
\section{END OF TESTS}
=SML
diag_string(summarize_mt_results());
=TEX
\end{document}




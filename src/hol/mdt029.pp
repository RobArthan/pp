=IGN
********************************************************************************
mdt029.doc: this file is part of the PPHol system

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

\def\Title{Module Tests for Tactics III}

\def\AbstractText{This document gives the module tests for the third group of tactics and tacticals in ICL HOL.}

\def\Reference{DS/FMU/IED/MDT029}

\def\Author{K. Blackburn}


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
%% LaTeX2e port: \TPPtitle{Module Tests for Tactics III}
%% LaTeX2e port: \TPPref{DS/FMU/IED/MDT029}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{1.30 %
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{2002/10/17 16:20:01 %
%% LaTeX2e port: }}  %% Mandatory field
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.~Blackburn & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{R.D.~Arthan & WIN01 \\ K.~Blackburn & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document gives the module tests for the
%% LaTeX2e port: third group of tactics and tacticals in ICL HOL.}
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
\item [Issue 1.1 (1991/11/12)]
First version.
\item [Issue 1.2 (1991/11/18)]
Modified $spec\_asm\_tac$ tests, et al.
\item [Issue 1.3 (1991/11/19)]
Changes to match issue 1.5 of \cite{DS/FMU/IED/DTD029}.

\item[Issue 1.4 (1992/01/20), \FormatDate{92/01/20} ] Updated to use new fonts.
\item [Issue 1.5 (1992/01/21)]
Removed duplicate labels.
\item [Issue 1.6 (1992/01/27)]
Test $sets\_epc$.
\item [Issue 1.7 (1992/02/10)]
Changed working theory
\item [Issue 1.8 (1992/03/18),1.9 (1992/03/19) (11th March 1992)]
Various minor additions and extensions.
\item [Issue 1.10 (1992/03/19)]
Removed percent keywords.
\item [Issue 1.11 (1992/03/26) (26th March 1992)]
Changed to use proof context material of issue 1.13 of \cite{DS/FMU/IED/DTD051}.
\item [Issue 1.12 (1992/03/31) (31st March 1992)]
Added understanding of double negation
to $¬\-\_rewrite\-\_canon$.
\item [Issue 1.13 (1992/04/09) (9th April 1992)]
Changes required by CR0016.
\item [Issue 1.14 (1992/04/14) (14th April 1992)]
Changes required by CR0017.
\item [Issue 1.15 (1992/05/14) (14th May 1992)]
Tidying up proof contexts.
\item [Issue 1.16 (1992/05/18) (20th May 1992)]
Rearranging build proof contexts.
\item [Issue 1.18 (1992/05/27) (27th May 1992)]
Added $all\_β\_tac$.
\item[Issue 1.19 (1992/06/24) (24th June 1992)]
Renamings from issue 1.6 of \cite{DS/FMU/IED/WRK038},
mostly proof context name changes.
\item[Issue 1.20 (1992/07/06) (6th July 1992)]
Added $step\_strip\_tac$ and $THEN1$.
\item[Issue 1.21 (1992/08/03) (3rd August 1992)]
Added chaining and induction tactics.
\item[Issue 1.22 (1992/08/03) (3rd August 1992)]
Added tests for induction tactic error smesages.
\item[Issue 1.23 (1992/08/04) (3rd August 1992)]
Added $ε\_tac$ etc.
\item[Issue 1.24 (1992/10/05) (5th October 1992)]
Added tests for $all\_$ variants of forward chaining.
\item[Issue 1.25 (1992/11/30) (30th November 1992)]
Added tests for the variable renaming in induction.
\item [Issue 1.25 (1992/11/30) (8th December 1992)]
Fixed a use of $pp'ts\_def$.
\item [Issue 1.26 (1992/12/08)-1.27 (1993/02/02) (2nd-3rd February 1993)]
Added variable elimination tactics.
\item[Issue 1.29 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.30 (2002/10/17)] PPHol-specific updates for open source release.
\item[Issue 1.31 (2003/03/05)] Change test for errors 29007 and 29021 so that they have no assumptions.
\item[Issue 1.32 (2005/12/16)] The prefix for private interfaces is now $pp'$ rather than $icl'$.
\item[Issue 1.36] Added tests for
=INLINEFT
list_simple_∃_tac
=TEX
.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
Completion of coverage.
\section{GENERAL}
\subsection{Scope}
This document contains the module tests for the material
whose detailed design is given in \cite{DS/FMU/IED/DTD029}.
\subsection{Introduction}
We are pretty cursory in the following, doing little more than just demonstrating
the tactics presence and error message origin.
\subsubsection{Dependencies}
The tests depend upon \cite{DS/FMU/IED/IMP013}, the test harness.
In addition, testing by the subgoal package
depends on \cite{DS/FMU/IED/IMP030}.

\subsubsection{Deficiencies}
The testing could be more rigorous.
\section{TEST CASES}
We test each function of the signature of \cite{DS/FMU/IED/DTD029}
in turn, where possible in the same order as in the design document.
\section{PREAMBLE}
=SML
open_theory"basic_hol";
use_file "dtd013";
use_file "imp013";
init_mt_results();
val lsubgoal_package_quiet = set_flag("subgoal_package_quiet",true);
repeat drop_main_goal;
push_merge_pcs ["'propositions","'paired_abstractions"];
=TEX
=SML
fun list_eq (eq:'a * 'a -> bool) ((a :: x), (b :: y)) : bool = (
	eq(a,b) andalso list_eq eq (x, y)
) | list_eq eq ([], []) = true
| list_eq _ _ = false;
=TEX
\section{TESTS}
\subsection{Testing Using Subgoal Package}
The following functions apply a tactic to a selected goal
and returns the resulting top goal.
This of course doesn't fully test tactics that return multiple
goals.
The functions differ in that $tac\_res1$ inputs and outputs
both assumptions and conclusion, while $tac\_res$
just assumes an empty assumption list.
=SML
fun ⦏tac_res⦎ tac goal = (push_goal([],goal);
		a tac;
		let val (seqasms,gl) = top_goal()
		in
			(drop_main_goal();
			gl)
		end);
fun ⦏tac_res1⦎ tac (seqasms, goal) = (
		push_goal(seqasms,goal);
		a tac;
		let val (seqasms,gl) = top_goal()
		in
			(drop_main_goal();
			(seqasms,gl))
		end);
=TEX
This function tests that a tactic proves a goal:
=SML
fun ⦏tac_solve⦎ tac (seqasms, goal) = (
	dest_thm (tac_proof ((seqasms,goal),tac))
	=#
	(seqasms, goal)
);
=TEX
This function tests that a tactic fails on a goal:
=SML
fun ⦏tac_fail⦎ tac (seqasms, goal) = (
	push_goal(seqasms,goal);
	a tac
	handle complaint =>
	(drop_main_goal();
	reraise complaint (area_of complaint))
);
=TEX
=SML

=TEX
\section{THE TESTS}
\subsection{Concerning Tautologies}
=SML
store_mt_results mt_run [
	("taut_tac 1",
	tac_solve taut_tac,
	([],⌜T⌝),
	true),
	("taut_tac 2",
	tac_solve taut_tac,
	([],⌜(a ∧ b) ⇔ (b ∧ a)⌝),
	true),
	("taut_tac 3",
	tac_solve taut_tac,
	([],⌜a ∨ ¬ a⌝),
	true),
	("taut_tac 4",
	tac_solve taut_tac,
	([],⌜(if a then p else ¬ p) ⇒ (¬ p ⇒ ¬ a)⌝),
	true),
	("taut_tac 5",
	tac_solve taut_tac,
	([],⌜¬¬¬ F⌝),
	true)
];
store_mt_results mt_run [
	("taut_tac 6",
	tac_solve taut_tac,
	([],⌜∀ x y ⦁ T⌝),
	true),
	("taut_tac 7",
	tac_solve taut_tac,
	([],⌜∀ (a,b) ⦁ (a ∧ b) ⇔ (b ∧ a)⌝),
	true),
	("taut_tac 8",
	tac_solve taut_tac,
	([],⌜∀ c ⦁ a ∨ ¬ a⌝),
	true),
	("taut_tac 9",
	tac_solve taut_tac,
	([],⌜∀ p ⦁ (if a then p else ¬ p) ⇒ (¬ p ⇒ ¬ a)⌝),
	true),
	("taut_tac 10",
	tac_solve taut_tac,
	([],⌜∀ z ⦁ ¬¬¬ F⌝),
	true)
];
store_mt_results mt_run_fail [("taut_tac 29020 1",
	tac_fail taut_tac,
	([],⌜F⌝),
	gen_fail_msg "taut_tac" 29020 []),
	("taut_tac 29020 2",
	tac_fail taut_tac,
	([],⌜1 = 1⌝),
	gen_fail_msg "taut_tac" 29020 [])
	];

store_mt_results mt_run_fail [("taut_tac 29020 3",
	taut_tac,
	([],⌜a:'a⌝),
	gen_fail_msg "taut_tac" 29020 [])];
=TEX
=SML
store_mt_results (mt_runf (op =#)) [("taut_rule",
	dest_thm o taut_rule,
	⌜∀ a e ⦁ (a ∧ b ∧ c ∧ d ⇒ e) ⇔ (a ⇒ b ⇒ c ⇒ d ⇒ e)⌝,
	([],⌜∀ a e ⦁ (a ∧ b ∧ c ∧ d ⇒ e) ⇔ (a ⇒ b ⇒ c ⇒ d ⇒ e)⌝))];
store_mt_results mt_run_fail [("taut_rule 27037",
	taut_rule,
	⌜F⌝,
	gen_fail_msg "taut_rule" 27037 ["⌜F⌝"]),
	("taut_rule 27030",
	taut_rule,
	⌜1⌝,
	gen_fail_msg "taut_rule" 27037 ["⌜1⌝"])];
=TEX
=SML
store_mt_results (mt_runf (op =#)) [("taut_conv",
	dest_thm o taut_conv,
	⌜∀ a e ⦁ (a ∧ b ∧ c ∧ d ⇒ e) ⇔ (a ⇒ b ⇒ c ⇒ d ⇒ e)⌝,
	([],⌜(∀ a e ⦁ (a ∧ b ∧ c ∧ d ⇒ e) ⇔ (a ⇒ b ⇒ c ⇒ d ⇒ e)) ⇔ T⌝))];
store_mt_results mt_run_fail [("taut_conv 27037 a",
	taut_conv,
	⌜F⌝,
	gen_fail_msg "taut_conv" 27037 ["⌜F⌝"]),
	("taut_conv 27037 b",
	taut_conv,
	⌜1⌝,
	gen_fail_msg "taut_conv" 27037 ["⌜1⌝"])];
=TEX
\subsection{Concerning ¬}
=SML
store_mt_results (mt_runf (op =$)) [
	("¬_in_tac 1",
	tac_res ¬_in_tac,
	⌜¬(¬ F)⌝,
	⌜F⌝),
	("¬_in_tac 2",
	tac_res ¬_in_tac,
	⌜¬(a ∧ b)⌝,
	⌜¬ a ∨ ¬ b⌝),
	("¬_in_tac 3",
	tac_res ¬_in_tac,
	⌜¬(a ∨ b)⌝,
	⌜¬ a ∧ ¬ b⌝),
	("¬_in_tac 4",
	tac_res ¬_in_tac,
	⌜¬(a ⇒ b)⌝,
	⌜a ∧ ¬ b⌝),
	("¬_in_tac 5",
	tac_res ¬_in_tac,
	⌜¬(a ⇔ b)⌝,
	⌜(a ∧ ¬b) ∨ (b ∧ ¬a)⌝),
	("¬_in_tac 6",
	tac_res ¬_in_tac,
	⌜¬(∀ x ⦁f x)⌝,
	⌜∃ x ⦁¬ f x⌝),
	("¬_in_tac 7",
	tac_res ¬_in_tac,
	⌜¬(∀ (x,y) ⦁ f x y)⌝,
	⌜∃ (x,y) ⦁ ¬ f x y⌝),
	("¬_in_tac 8",
	tac_res ¬_in_tac,
	⌜¬(∃ x ⦁f x)⌝,
	⌜∀ x ⦁¬ f x⌝),
	("¬_in_tac 9",
	tac_res ¬_in_tac,
	⌜¬(∃ (x,y) ⦁ f x y)⌝,
	⌜∀ (x,y) ⦁ ¬ f x y⌝),
	("¬_in_tac 10",
	tac_res ¬_in_tac,
	⌜¬(∃⋎1 x ⦁f x)⌝,
	⌜∀ x ⦁¬ (f x ∧ ∀ x' ⦁f x' ⇒ x' = x)⌝),
	("¬_in_tac 11",
	tac_res ¬_in_tac,
	⌜¬(∃⋎1 (x,y) ⦁ f x y)⌝,
	⌜∀ (x,y) ⦁ ¬ (f x y ∧ ∀ (x',y') ⦁f x' y' ⇒ (x',y') = (x,y))⌝),
	("¬_in_tac 12",
	tac_res ¬_in_tac,
	⌜¬ T⌝,
	⌜F⌝)];
store_mt_results mt_run [
	("¬_in_tac 13",
	tac_solve ¬_in_tac,
	([],⌜¬F⌝),
	true)];
store_mt_results mt_run_fail [("¬_in_tac 28025",
	tac_fail ¬_in_tac,
	([],⌜T⌝),
	gen_fail_msg "¬_in_tac" 28025 [])];
=TEX
As $¬\_IN\_THEN$ is based on the same conversion as the above,
we just test one case.
=SML
store_mt_results (mt_runf (op =$)) [("¬_IN_THEN",
	tac_res (¬_IN_THEN ante_tac f_thm),
	⌜T⌝,
	⌜T ⇒ T⌝)];
store_mt_results mt_run_fail [("¬_IN_THEN 29010",
	¬_IN_THEN asm_tac,
	t_thm,
	gen_fail_msg "¬_IN_THEN" 29010 ["⊢ T"])];
=TEX
\subsection{Concerning ⇒ and ⇔}
=SML
store_mt_results (mt_runf (op =#))[("⇒_thm_tac 1",
	tac_res1 (⇒_thm_tac (asm_rule ⌜a x ⇒ b x⌝)),
	([⌜a x ⇒ b x⌝],⌜b x:BOOL⌝),
	([⌜a x ⇒ b x⌝],⌜a x:BOOL⌝))
];
store_mt_results mt_run_fail [("⇒_thm_tac 29013 1",
	tac_fail (⇒_thm_tac (asm_rule ⌜a x ⇒ b x⌝)),
	([⌜a x ⇒ b x⌝],⌜a x:BOOL⌝),
	gen_fail_msg "⇒_thm_tac" 29013 [string_of_term⌜b x⌝])
];
=TEX
=SML
store_mt_results (mt_runf (op =#))[("bc_thm_tac 1",
	tac_res1 (bc_thm_tac (asm_rule ⌜∀(x:'a) (y:'b)⦁a x y ⇒ b x⌝)),
	([⌜∀(x:'a) (y:'b)⦁a x y ⇒ b x⌝],⌜b x:BOOL⌝),
	([⌜∀(x:'a) (y:'b)⦁a x y ⇒ b x⌝],⌜∃y⦁a (x:'a) (y:'b):BOOL⌝)),
	("bc_thm_tac 2",
	tac_res1 (bc_thm_tac (asm_rule ⌜∀(x:'a) ⦁a x ⇒ b x⌝)),
	([⌜∀(x:'a)⦁a x ⇒ b x⌝],⌜b x:BOOL⌝),
	([⌜∀(x:'a)⦁a x ⇒ b x⌝],⌜a (x:'a):BOOL⌝)),
	("bc_thm_tac 3",
	tac_res1 (bc_thm_tac (asm_rule ⌜∀(x:'a) ⦁a x ⇔ b x⌝)),
	([⌜∀(x:'a)⦁a x ⇔ b x⌝],⌜b x:BOOL⌝),
	([⌜∀(x:'a)⦁a x ⇔ b x⌝],⌜a (x:'a):BOOL⌝))
];
=TEX
=SML
store_mt_results mt_run_fail [("bc_thm_tac 29011 1",
	tac_fail (bc_thm_tac (asm_rule ⌜a x ⇒ pp'TS x⌝)),
	([⌜a x ⇒ pp'TS x⌝],⌜b (x:BOOL):BOOL⌝),
	gen_fail_msg "bc_thm_tac" 29011 [string_of_term⌜pp'TS x⌝])
];
store_mt_results mt_run_fail [("bc_thm_tac 29011 2",
	bc_thm_tac, bool_cases_axiom,
	gen_fail_msg "bc_thm_tac" 29012 [string_of_thm bool_cases_axiom])
];
=TEX
=SML
store_mt_results (mt_runf (op =#))[("bc_tac 1",
	tac_res1 (bc_tac [asm_rule ⌜∀(x:'a) (y:'b)⦁a x y ⇒ b x⌝]),
	([⌜∀(x:'a) (y:'b)⦁a x y ⇒ b x⌝],⌜b x:BOOL⌝),
	([⌜∀(x:'a) (y:'b)⦁a x y ⇒ b x⌝],⌜∃y⦁a (x:'a) (y:'b):BOOL⌝)),
	("bc_tac 2",
	tac_res1 (bc_tac [asm_rule ⌜1=2⇒3=4⌝,
			asm_rule⌜3=4⇒5=6⌝]),
	([⌜1=2⇒3=4⌝, ⌜3=4⇒5=6⌝],⌜5=6⌝),
	([⌜1=2⇒3=4⌝, ⌜3=4⇒5=6⌝],⌜1=2⌝))
];
=TEX
=SML
store_mt_results mt_run_fail [("bc_tac 29011 1",
	bc_tac, [bool_cases_axiom],
	gen_fail_msg "bc_tac" 29012 [string_of_thm bool_cases_axiom])
];
=TEX
=SML
store_mt_results mt_run [
	("fc_tac 1",
	tac_solve (fc_tac [asm_rule ⌜∀x⦁a x ⇒ b x⌝]),
	([⌜∀x⦁a x ⇒ b x⌝, ⌜a x:BOOL⌝],⌜b x:BOOL⌝),
	true),
	("fc_tac 2",
	tac_solve (asm_fc_tac []),
	([⌜∀x⦁a x ⇒ b x⌝, ⌜a x:BOOL⌝],⌜b x:BOOL⌝),
	true)
];
=TEX
=SML
store_mt_results mt_run [
	("all_fc_tac 1",
	tac_solve (all_fc_tac [asm_rule ⌜∀x⦁a x ⇒ b x ⇒ c x⌝]),
	([⌜∀x⦁a x ⇒ b x ⇒ c x⌝, ⌜a x:BOOL⌝, ⌜b x:BOOL⌝],⌜c x:BOOL⌝),
	true),
	("all_fc_tac 2",
	tac_solve (all_asm_fc_tac []),
	([⌜∀x⦁a x ⇒ b x ⇒ c x⌝, ⌜a x:BOOL⌝,⌜b x:BOOL⌝], ⌜c x:BOOL⌝),
	true)
];
=TEX
=SML
store_mt_results mt_run [
	("FC_T 1",
	tac_solve ((FC_T (MAP_EVERY strip_asm_tac)) [asm_rule ⌜∀x⦁a x ⇒ b x⌝]),
	([⌜∀x⦁a x ⇒ b x⌝, ⌜a x:BOOL⌝],⌜b x:BOOL⌝),
	true),
	("FC_T 2",
	tac_solve ((ASM_FC_T (MAP_EVERY strip_asm_tac)) []),
	([⌜∀x⦁a x ⇒ b x⌝, ⌜a x:BOOL⌝],⌜b x:BOOL⌝),
	true)
];
=TEX
=SML
store_mt_results mt_run [
	("ALL_FC_T 1",
	tac_solve ((ALL_FC_T (MAP_EVERY strip_asm_tac)) [asm_rule ⌜∀x⦁a x ⇒ b x ⇒ c x⌝]),
	([⌜∀x⦁a x ⇒ b x ⇒ c x⌝, ⌜a x:BOOL⌝, ⌜b x:BOOL⌝],⌜c x:BOOL⌝),
	true),
	("ALL_FC_T 2",
	tac_solve ((ALL_ASM_FC_T (MAP_EVERY strip_asm_tac)) []),
	([⌜∀x⦁a x ⇒ b x ⇒ c x⌝, ⌜a x:BOOL⌝,⌜b x:BOOL⌝], ⌜c x:BOOL⌝),
	true)
];
=TEX
=SML
store_mt_results mt_run [
	("FC_T1 1",
	tac_solve ((FC_T1 (fn t=>[t]) (MAP_EVERY strip_asm_tac)) [asm_rule ⌜∀x⦁a x ⇒ b x⌝]),
	([⌜∀x⦁a x ⇒ b x⌝, ⌜a x:BOOL⌝],⌜b x:BOOL⌝),
	true),
	("FC_T1 2",
	tac_solve ((ASM_FC_T1 (fn t=>[t]) (MAP_EVERY strip_asm_tac)) []),
	([⌜∀x⦁a x ⇒ b x⌝, ⌜a x:BOOL⌝],⌜b x:BOOL⌝),
	true)
];
=TEX
=SML
store_mt_results mt_run [
	("ALL_FC_T1 1",
	tac_solve ((ALL_FC_T1 (fn t=>[t]) (MAP_EVERY strip_asm_tac)) [asm_rule ⌜∀x⦁a x ⇒ b x ⇒ c x⌝]),
	([⌜∀x⦁a x ⇒ b x ⇒ c x⌝, ⌜a x:BOOL⌝, ⌜b x:BOOL⌝],⌜c x:BOOL⌝),
	true),
	("ALL_FC_T1 2",
	tac_solve ((ALL_ASM_FC_T1 (fn t=>[t]) (MAP_EVERY strip_asm_tac)) []),
	([⌜∀x⦁a x ⇒ b x ⇒ c x⌝, ⌜a x:BOOL⌝,⌜b x:BOOL⌝], ⌜c x:BOOL⌝),
	true)
];
=TEX

\subsection{Concerning ∀}
=SML
store_mt_results (mt_runf (op =$)) [("∀_tac 1",
	tac_res ∀_tac,
	⌜∀ x ⦁ f x⌝,
	⌜f x : BOOL⌝),
	("∀_tac 2",
	tac_res ∀_tac,
	⌜∀ (x,y,z) ⦁ f x y z⌝,
	⌜f x y z: BOOL⌝)];
store_mt_results mt_run_fail [("∀_tac 29001",
	tac_fail ∀_tac,
	([],⌜T⌝),
	gen_fail_msg "∀_tac" 29001 [])];
=TEX
\subsection{Concerning ∃}
=SML
store_mt_results (mt_runf (op =$)) [("∃_tac 1",
	tac_res (∃_tac ⌜1⌝),
	⌜∃ x ⦁ x = 1⌝,
	⌜1 = 1⌝),
	("∃_tac 2",
	tac_res (∃_tac ⌜(1,2)⌝),
	⌜∃ (x,y):ℕ × ℕ ⦁ ¬(x = y)⌝,
	⌜¬(1 = 2)⌝),
	("∃_tac 3",
	tac_res (∃_tac ⌜x:'a⌝),
	⌜∃  y : ℕ ⦁ y = y⌝,
	⌜(x:ℕ) = x⌝),
	("∃_tac 4",
	tac_res (∃_tac ⌜x:'a⌝),
	⌜∃ (x,y): 'a × 'a ⦁ x = y⌝,
	⌜Fst (x: 'a × 'a) = Snd x⌝)];
store_mt_results mt_run_fail [("∃_tac 29002",
	tac_fail (∃_tac mk_t),
	([],⌜a ∨ b⌝),
	gen_fail_msg "∃_tac" 29002 []),
	("∃_tac 29008",
	tac_fail (∃_tac ⌜(1,2)⌝),
	([],⌜∃ a ⦁ a ∨ b⌝),
	gen_fail_msg "∃_tac" 29008 ["⌜(1, 2)⌝","⌜a⌝"])];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [("list_simple_∃_tac 1",
	tac_res (list_simple_∃_tac [⌜1⌝]),
	⌜∃ x ⦁ x = 1⌝,
	⌜1 = 1⌝),
	("list_simple_∃_tac 2",
	tac_res (list_simple_∃_tac [⌜1⌝, ⌜2⌝]),
	⌜∃ x y⦁ x = 1 ∧ y = 2⌝,
	⌜1 = 1 ∧ 2 = 2⌝),
	("list_simple_∃_tac 3",
	tac_res (list_simple_∃_tac [⌜1⌝, ⌜2⌝]),
	⌜∃ x y z⦁ x = 1 ∧ y = 2⌝,
	⌜∃z⦁1 = 1 ∧ 2 = 2⌝)
];
store_mt_results mt_run_fail [("list_simple_∃_tac 29017",
	tac_fail (list_simple_∃_tac [mk_t]),
	([],⌜a ∨ b⌝),
	gen_fail_msg "list_simple_∃_tac" 29017 []),
	("list_simple_∃_tac 29015",
	tac_fail (list_simple_∃_tac [⌜T⌝, ⌜1⌝]),
	([],⌜∃ a ⦁ a ∨ b⌝),
	gen_fail_msg "list_simple_∃_tac" 29015 ["⌜∃ a⦁ a ∨ b⌝"]),
	("list_simple_∃_tac 29008",
	tac_fail (list_simple_∃_tac [⌜1⌝]),
	([],⌜∃ a ⦁ a ∨ b⌝),
	gen_fail_msg "list_simple_∃_tac" 29008["⌜1⌝", "⌜a⌝"])];
=TEX
=SML
store_mt_results (mt_runf (op =#))[("∃_THEN",
	tac_res1 (∃_THEN ante_tac (asm_rule ⌜∃ (x,y) ⦁ x = y⌝)),
	([],⌜x:BOOL⌝),
	([],⌜(x' = y) ⇒ x⌝))];
store_mt_results mt_run_fail [("∃_THEN 29003",
	∃_THEN ante_tac,
	t_thm,
	gen_fail_msg "∃_THEN" 29003 ["⊢ T"])];
=TEX
\subsection{Concerning ∃$_1$}
=SML
store_mt_results (mt_runf (op =$))[("∃⋎1_tac 1",
	tac_res (∃⋎1_tac ⌜2⌝),
	⌜∃⋎1 x ⦁ x = 1⌝,
	⌜2 = 1 ∧ ∀ x' ⦁ x' = 1 ⇒ x' = 2⌝),
	("∃⋎1_tac 2",
	tac_res (∃⋎1_tac ⌜(1,2)⌝),
	⌜∃⋎1 (x:ℕ,y) ⦁ ¬(x = y)⌝,
	⌜¬(1 = 2) ∧ ∀ (x',y') ⦁ ¬(x' = y') ⇒ (x',y') = (1,2)⌝),
	("∃⋎1_tac 3",
	tac_res (∃⋎1_tac ⌜x:'a⌝),
	⌜∃⋎1 y : ℕ ⦁ y = y⌝,
	⌜((x:ℕ) = x) ∧ ∀ y' ⦁ (y' = y') ⇒ y' = x⌝),
	("∃⋎1_tac 4",
	tac_res (∃⋎1_tac ⌜x:'a⌝),
	⌜∃⋎1 (x,y): 'a × 'a ⦁ x = y⌝,
	⌜Fst (x: 'a × 'a) = Snd x ∧ ∀ (x',y') ⦁ (x' = y') ⇒ (x',y') = (Fst x, Snd x)⌝)];
store_mt_results mt_run_fail [("∃⋎1_tac 29004",
	tac_fail (∃⋎1_tac mk_t),
	([],⌜a ∨ b⌝),
	gen_fail_msg "∃⋎1_tac" 29004 []),
	("∃⋎1_tac 29008",
	tac_fail (∃⋎1_tac ⌜(1,2)⌝),
	([],⌜∃⋎1 a ⦁ a ∨ b⌝),
	gen_fail_msg "∃⋎1_tac" 29008 ["⌜(1, 2)⌝","⌜a⌝"])];
=TEX
=SML
store_mt_results (mt_runf (op =#))[("∃⋎1_THEN",
	tac_res1 (∃⋎1_THEN ante_tac (asm_rule ⌜∃⋎1 (x,y) ⦁ x = y⌝)),
	([],⌜x:BOOL⌝),
	([],⌜((x' = y) ∧
		(∀ (x'',y') ⦁ (x'' = y') ⇒ (x'',y') = (x',y)))⇒ x⌝))];
store_mt_results mt_run_fail [("∃⋎1_THEN 29005",
	∃⋎1_THEN ante_tac,
	t_thm,
	gen_fail_msg "∃⋎1_THEN" 29005 ["⊢ T"])];
=TEX

\subsection{Concerning λ}
=SML
store_mt_results (mt_runf (op =$))[("all_β_tac",
	tac_res all_β_tac,
	⌜(λ x y ⦁ (g:BOOL → BOOL) (x y)) (λ z⦁ h z z) (q:'a)⌝,
	⌜g (h (q:'a) q:BOOL):BOOL⌝)];
=TEX
=SML
store_mt_results mt_run_fail [("all_β_tac 27049",
	tac_fail all_β_tac,
	([],mk_t),
	gen_fail_msg "all_β_tac" 27049 ["⌜T⌝"])];
=TEX
\subsection{Concerning ε}
=SML
store_mt_results (mt_run)[("ε_tac",
	tac_solve (ε_tac ⌜(εx⦁p x)⌝ THEN TOP_ASM_T accept_tac),
	([⌜∃x⦁p x⌝], ⌜p(εx⦁p x)⌝),
	true)];
=TEX
=SML
store_mt_results (mt_run)[("ε_T",
	tac_solve (ε_T ⌜(εx⦁p x)⌝ asm_tac THEN TOP_ASM_T accept_tac),
	([⌜∃x⦁p x⌝], ⌜p(εx⦁p x)⌝),
	true)];
=TEX
=SML
store_mt_results mt_run_fail [("ε_tac 29050",
	ε_tac,
	mk_t,
	gen_fail_msg "ε_tac" 29050 ["⌜T⌝"])];
=TEX
=SML
store_mt_results (mt_run)[("all_ε_tac",
	tac_solve (all_ε_tac THEN TRY_T ∧_tac THEN GET_ASMS_T (MAP_EVERY(TRY_T o accept_tac))),
	([⌜∃x⦁p x⌝, ⌜∃x⦁q x⌝], ⌜p(εx:'a⦁p x) ∧ q(εx:'a⦁q x)⌝),
	true)];
=TEX
=SML
store_mt_results (mt_run)[("ALL_ε_T",
	tac_solve (ALL_ε_T asm_tac THEN TRY_T ∧_tac THEN GET_ASMS_T (MAP_EVERY(TRY_T o accept_tac))),
	([⌜∃x⦁p x⌝, ⌜∃x⦁q x⌝], ⌜p(εx:'a⦁p x) ∧ q(εx:'a⦁q x)⌝),
	true)];
=TEX
\subsection{Concerning Assumptions}
=SML
store_mt_results (mt_runf (op =#))[("spec_asm_tac",
	tac_res1 (spec_asm_tac ⌜∀ x ⦁ x = 1⌝ ⌜0⌝),
	([⌜∀ x ⦁ x = 1⌝],⌜F⌝),
	([⌜0 = 1⌝,⌜∀ x ⦁ x = 1⌝],⌜F⌝))];
store_mt_results (mt_runf (op =#))[("list_spec_asm_tac",
	tac_res1 (list_spec_asm_tac ⌜∀ x y:ℕ ⦁ x = y⌝ [⌜0⌝,⌜1⌝]),
	([⌜∀ x y:ℕ ⦁ x = y⌝],⌜F⌝),
	([⌜0 = 1⌝,⌜∀ x y:ℕ ⦁ x = y⌝],⌜F⌝))];
store_mt_results (mt_runf (op =#))[("spec_nth_asm_tac",
	tac_res1 (spec_nth_asm_tac 1 ⌜0⌝),
	([⌜∀ x ⦁ x = 1⌝],⌜F⌝),
	([⌜0 = 1⌝,⌜∀ x ⦁ x = 1⌝],⌜F⌝))];
store_mt_results (mt_runf (op =#))[("list_spec_nth_asm_tac",
	tac_res1 (list_spec_nth_asm_tac 1 [⌜0⌝,⌜1⌝]),
	([⌜∀ x y :ℕ⦁ x = y⌝],⌜F⌝),
	([⌜0 = 1⌝,⌜∀ x y :ℕ⦁ x = y⌝],⌜F⌝))];
=TEX
We only give one example kind of passed-on error for each function.
=SML
store_mt_results mt_run_fail [("spec_asm_tac 9301",
	tac_fail (spec_asm_tac ⌜∀ x ⦁ x = 1⌝ ⌜0⌝),
	([],⌜F⌝),
	gen_fail_msg "GET_ASM_T" 9301 ["⌜∀ x⦁ x = 1⌝"])];
store_mt_results mt_run_fail [("list_spec_asm_tac 9301",
	tac_fail (list_spec_asm_tac ⌜∀ x y ⦁ x = y⌝ [⌜0⌝,⌜1⌝]),
	([],⌜F⌝),
	gen_fail_msg "GET_ASM_T" 9301 ["⌜∀ x y⦁ x = y⌝"])];
store_mt_results mt_run_fail [("spec_nth_asm_tac 9303",
	tac_fail (spec_nth_asm_tac 2 ⌜0⌝),
	([⌜∀ x ⦁ x = 1⌝],⌜F⌝),
	gen_fail_msg "GET_NTH_ASM_T" 9303 ["2"])];
store_mt_results mt_run_fail [("list_spec_nth_asm_tac 9303",
	tac_fail (list_spec_nth_asm_tac 2 [⌜0⌝,⌜1⌝]),
	([⌜∀ x y ⦁ x = y⌝],⌜F⌝),
	gen_fail_msg "GET_NTH_ASM_T" 9303 ["2"])];
=TEX
=SML
fun ⦏lspec_asm_tac⦎ (asm : TERM) (instance : TERM)  :TACTIC = (
	SPEC_ASM_T asm instance strip_asm_tac
);
fun ⦏llist_spec_asm_tac⦎ (asm : TERM) (instances : TERM list)  :TACTIC = (
	LIST_SPEC_ASM_T asm instances strip_asm_tac
);
fun ⦏lspec_nth_asm_tac⦎ (n : int) (instance : TERM)  :TACTIC = (
	SPEC_NTH_ASM_T n instance strip_asm_tac
);
fun ⦏llist_spec_nth_asm_tac⦎ (n : int) (instances : TERM list)  :TACTIC = (
	LIST_SPEC_NTH_ASM_T n instances strip_asm_tac
);

=TEX
=SML
store_mt_results (mt_runf (op =#))[("lspec_asm_tac",
	tac_res1 (lspec_asm_tac ⌜∀ x ⦁ x = 1⌝ ⌜0⌝),
	([⌜∀ x ⦁ x = 1⌝],⌜F⌝),
	([⌜0 = 1⌝,⌜∀ x ⦁ x = 1⌝],⌜F⌝))];
store_mt_results (mt_runf (op =#))[("llist_spec_asm_tac",
	tac_res1 (llist_spec_asm_tac ⌜∀ x y:ℕ ⦁ x = y⌝ [⌜0⌝,⌜1⌝]),
	([⌜∀ x y:ℕ ⦁ x = y⌝],⌜F⌝),
	([⌜0 = 1⌝,⌜∀ x y:ℕ ⦁ x = y⌝],⌜F⌝))];
store_mt_results (mt_runf (op =#))[("lspec_nth_asm_tac",
	tac_res1 (lspec_nth_asm_tac 1 ⌜0⌝),
	([⌜∀ x ⦁ x = 1⌝],⌜F⌝),
	([⌜0 = 1⌝,⌜∀ x ⦁ x = 1⌝],⌜F⌝))];
store_mt_results (mt_runf (op =#))[("llist_spec_nth_asm_tac",
	tac_res1 (llist_spec_nth_asm_tac 1 [⌜0⌝,⌜1⌝]),
	([⌜∀ x y :ℕ⦁ x = y⌝],⌜F⌝),
	([⌜0 = 1⌝,⌜∀ x y :ℕ⦁ x = y⌝],⌜F⌝))];
=TEX
We only give one example kind of passed-on error for each function.
=SML
store_mt_results mt_run_fail [("lspec_asm_tac 9301",
	tac_fail (spec_asm_tac ⌜∀ x ⦁ x = 1⌝ ⌜0⌝),
	([],⌜F⌝),
	gen_fail_msg "GET_ASM_T" 9301 ["⌜∀ x⦁ x = 1⌝"])];
store_mt_results mt_run_fail [("llist_spec_asm_tac 9301",
	tac_fail (list_spec_asm_tac ⌜∀ x y ⦁ x = y⌝ [⌜0⌝,⌜1⌝]),
	([],⌜F⌝),
	gen_fail_msg "GET_ASM_T" 9301 ["⌜∀ x y⦁ x = y⌝"])];
store_mt_results mt_run_fail [("lspec_nth_asm_tac 9303",
	tac_fail (lspec_nth_asm_tac 2 ⌜0⌝),
	([⌜∀ x ⦁ x = 1⌝],⌜F⌝),
	gen_fail_msg "GET_NTH_ASM_T" 9303 ["2"])];
store_mt_results mt_run_fail [("llist_spec_nth_asm_tac 9303",
	tac_fail (llist_spec_nth_asm_tac 2 [⌜0⌝,⌜1⌝]),
	([⌜∀ x y ⦁ x = y⌝],⌜F⌝),
	gen_fail_msg "GET_NTH_ASM_T" 9303 ["2"])];
=TEX
\section{VARIABLE ELIMINATION}
=SML
store_mt_results (mt_runf (op =#)) [("var_elim_asm_tac a ",
	tac_res1 (var_elim_asm_tac ⌜v = 5⌝),
	([⌜p ∨ q⌝, ⌜v = 2 ∧ ∀ v ⦁ v = 3⌝,⌜v=5⌝,⌜f v = f 6⌝],⌜h v = h 7⌝),
	([⌜p ∨ q⌝, ⌜∀ v ⦁ v = 3⌝, ⌜5 = 2⌝,⌜f 5 = f 6⌝],⌜h 5 = h 7⌝))];
store_mt_results (mt_runf (op =#)) [("var_elim_nth_asm_tac a ",
	tac_res1 (var_elim_nth_asm_tac 3),
	([⌜p ∨ q⌝, ⌜v = 2 ∧ ∀ v ⦁ v = 3⌝,⌜v=5⌝,⌜f v = f 6⌝],⌜h v = h 7⌝),
	([⌜p ∨ q⌝, ⌜∀ v ⦁ v = 3⌝, ⌜5 = 2⌝,⌜f 5 = f 6⌝],⌜h 5 = h 7⌝))];
store_mt_results (mt_runf (op =#)) [("VAR_ELIM_ASM_T a ",
	tac_res1 (VAR_ELIM_ASM_T ⌜v = 5⌝ asm_tac),
	([⌜p ∨ q⌝, ⌜v = 2 ∧ ∀ v ⦁ v = 3⌝,⌜v=5⌝,⌜f v = f 6⌝],⌜h v = h 7⌝),
	([⌜p ∨ q⌝, ⌜5 = 2 ∧ ∀ v ⦁ v = 3⌝,⌜f 5 = f 6⌝],⌜h 5 = h 7⌝))];
store_mt_results (mt_runf (op =#)) [("VAR_ELIM_NTH_ASM_T a ",
	tac_res1 (VAR_ELIM_NTH_ASM_T 3 asm_tac),
	([⌜p ∨ q⌝, ⌜v = 2 ∧ ∀ v ⦁ v = 3⌝,⌜v=5⌝,⌜f v = f 6⌝],⌜h v = h 7⌝),
	([⌜p ∨ q⌝, ⌜5 = 2 ∧ ∀ v ⦁ v = 3⌝,⌜f 5 = f 6⌝],⌜h 5 = h 7⌝))];
store_mt_results (mt_runf (op =#)) [("all_var_elim_asm_tac a ",
	tac_res1 all_var_elim_asm_tac,
	([⌜p ∨ q⌝, ⌜v = 2 ∧ ∀ v ⦁ v = 3⌝,⌜v=5⌝,⌜f v = f 6⌝],⌜h v = h 7⌝),
	([⌜p ∨ q⌝, ⌜∀ v ⦁ v = 3⌝, ⌜5 = 2⌝,⌜f 5 = f 6⌝],⌜h 5 = h 7⌝))];
store_mt_results (mt_runf (op =#)) [("all_var_elim_asm_tac1 a ",
	tac_res1 all_var_elim_asm_tac,
	([⌜p ∨ q⌝, ⌜v = 2 ∧ ∀ v ⦁ v = 3⌝,⌜v=5⌝,⌜f v = f 6⌝],⌜h v = h 7⌝),
	([⌜p ∨ q⌝, ⌜∀ v ⦁ v = 3⌝, ⌜5 = 2⌝,⌜f 5 = f 6⌝],⌜h 5 = h 7⌝))];
store_mt_results (mt_runf (op =#)) [("ALL_VAR_ELIM_ASM_T a ",
	tac_res1 (ALL_VAR_ELIM_ASM_T asm_tac),
	([⌜p ∨ q⌝, ⌜v = 2 ∧ ∀ v ⦁ v = 3⌝,⌜v=5⌝,⌜f v = f 6⌝],⌜h v = h 7⌝),
	([⌜p ∨ q⌝, ⌜5 = 2 ∧ ∀ v ⦁ v = 3⌝,⌜f 5 = f 6⌝],⌜h 5 = h 7⌝))];
store_mt_results (mt_runf (op =#)) [("ALL_VAR_ELIM_ASM_T1 a ",
	tac_res1 (ALL_VAR_ELIM_ASM_T1 asm_tac),
	([⌜p ∨ q⌝, ⌜v = 2 ∧ ∀ v ⦁ v = 3⌝,⌜v=5⌝,⌜f v = f 6⌝],⌜h v = h 7⌝),
	([⌜p ∨ q⌝, ⌜5 = 2 ∧ ∀ v ⦁ v = 3⌝,⌜f 5 = f 6⌝],⌜h 5 = h 7⌝))];
=TEX
=SML
store_mt_results (mt_runf (op =#)) [("var_elim_asm_tac b",
	tac_res1 (var_elim_asm_tac ⌜5 = v⌝),
	([⌜p ∨ q⌝, ⌜v = 2 ∧ ∀ v ⦁ v = 3⌝,⌜5 = v⌝,⌜f v = f 6⌝],⌜h v = h 7⌝),
	([⌜p ∨ q⌝, ⌜∀ v ⦁ v = 3⌝, ⌜5 = 2⌝,⌜f 5 = f 6⌝],⌜h 5 = h 7⌝))];
store_mt_results (mt_runf (op =#)) [("var_elim_nth_asm_tac b",
	tac_res1 (var_elim_nth_asm_tac 3),
	([⌜p ∨ q⌝, ⌜v = 2 ∧ ∀ v ⦁ v = 3⌝,⌜5 = v⌝,⌜f v = f 6⌝],⌜h v = h 7⌝),
	([⌜p ∨ q⌝, ⌜∀ v ⦁ v = 3⌝, ⌜5 = 2⌝,⌜f 5 = f 6⌝],⌜h 5 = h 7⌝))];
store_mt_results (mt_runf (op =#)) [("VAR_ELIM_ASM_T b",
	tac_res1 (VAR_ELIM_ASM_T ⌜5 = v⌝ asm_tac),
	([⌜p ∨ q⌝, ⌜v = 2 ∧ ∀ v ⦁ v = 3⌝,⌜5 = v⌝,⌜f v = f 6⌝],⌜h v = h 7⌝),
	([⌜p ∨ q⌝, ⌜5 = 2 ∧ ∀ v ⦁ v = 3⌝,⌜f 5 = f 6⌝],⌜h 5 = h 7⌝))];
store_mt_results (mt_runf (op =#)) [("VAR_ELIM_NTH_ASM_T b",
	tac_res1 (VAR_ELIM_NTH_ASM_T 3 asm_tac),
	([⌜p ∨ q⌝, ⌜v = 2 ∧ ∀ v ⦁ v = 3⌝,⌜5 = v⌝,⌜f v = f 6⌝],⌜h v = h 7⌝),
	([⌜p ∨ q⌝, ⌜5 = 2 ∧ ∀ v ⦁ v = 3⌝,⌜f 5 = f 6⌝],⌜h 5 = h 7⌝))];
store_mt_results (mt_runf (op =#)) [("all_var_elim_asm_tac b",
	tac_res1 all_var_elim_asm_tac,
	([⌜p ∨ q⌝, ⌜v = 2 ∧ ∀ v ⦁ v = 3⌝,⌜5 = v⌝,⌜f v = f 6⌝],⌜h v = h 7⌝),
	([⌜p ∨ q⌝, ⌜∀ v ⦁ v = 3⌝, ⌜5 = 2⌝,⌜f 5 = f 6⌝],⌜h 5 = h 7⌝))];
store_mt_results (mt_runf (op =#)) [("all_var_elim_asm_tac1 b",
	tac_res1 all_var_elim_asm_tac,
	([⌜p ∨ q⌝, ⌜v = 2 ∧ ∀ v ⦁ v = 3⌝,⌜5 = v⌝,⌜f v = f 6⌝],⌜h v = h 7⌝),
	([⌜p ∨ q⌝, ⌜∀ v ⦁ v = 3⌝, ⌜5 = 2⌝,⌜f 5 = f 6⌝],⌜h 5 = h 7⌝))];
store_mt_results (mt_runf (op =#)) [("ALL_VAR_ELIM_ASM_T b",
	tac_res1 (ALL_VAR_ELIM_ASM_T asm_tac),
	([⌜p ∨ q⌝, ⌜v = 2 ∧ ∀ v ⦁ v = 3⌝,⌜5 = v⌝,⌜f v = f 6⌝],⌜h v = h 7⌝),
	([⌜p ∨ q⌝, ⌜5 = 2 ∧ ∀ v ⦁ v = 3⌝,⌜f 5 = f 6⌝],⌜h 5 = h 7⌝))];
store_mt_results (mt_runf (op =#)) [("ALL_VAR_ELIM_ASM_T1 b",
	tac_res1 (ALL_VAR_ELIM_ASM_T1 asm_tac),
	([⌜p ∨ q⌝, ⌜v = 2 ∧ ∀ v ⦁ v = 3⌝,⌜5 = v⌝,⌜f v = f 6⌝],⌜h v = h 7⌝),
	([⌜p ∨ q⌝, ⌜5 = 2 ∧ ∀ v ⦁ v = 3⌝,⌜f 5 = f 6⌝],⌜h 5 = h 7⌝))];
=TEX
=SML
store_mt_results (mt_runf (op =#)) [("var_elim_asm_tac c",
	tac_res1 (var_elim_asm_tac ⌜(v:ℕ) = v⌝),
	([⌜p ∨ q⌝, ⌜v = 2 ∧ ∀ v ⦁ v = 3⌝,⌜(v:ℕ) = v⌝,⌜f v = f 6⌝],⌜h v = h 7⌝),
	([⌜p ∨ q⌝, ⌜v = 2 ∧ ∀ v ⦁ v = 3⌝,⌜f v = f 6⌝],⌜h v = h 7⌝))];
store_mt_results (mt_runf (op =#)) [("var_elim_nth_asm_tac c",
	tac_res1 (var_elim_nth_asm_tac 3),
	([⌜p ∨ q⌝, ⌜v = 2 ∧ ∀ v ⦁ v = 3⌝,⌜(v:ℕ) = v⌝,⌜f v = f 6⌝],⌜h v = h 7⌝),
	([⌜p ∨ q⌝, ⌜v = 2 ∧ ∀ v ⦁ v = 3⌝,⌜f v = f 6⌝],⌜h v = h 7⌝))];
store_mt_results (mt_runf (op =#)) [("VAR_ELIM_ASM_T c",
	tac_res1 (VAR_ELIM_ASM_T ⌜(v:ℕ) = v⌝ asm_tac),
	([⌜p ∨ q⌝, ⌜v = 2 ∧ ∀ v ⦁ v = 3⌝,⌜(v:ℕ) = v⌝,⌜f v = f 6⌝],⌜h v = h 7⌝),
	([⌜p ∨ q⌝, ⌜v = 2 ∧ ∀ v ⦁ v = 3⌝,⌜f v = f 6⌝],⌜h v = h 7⌝))];
store_mt_results (mt_runf (op =#)) [("VAR_ELIM_NTH_ASM_T c",
	tac_res1 (VAR_ELIM_NTH_ASM_T 3 asm_tac),
	([⌜p ∨ q⌝, ⌜v = 2 ∧ ∀ v ⦁ v = 3⌝,⌜(v:ℕ) = v⌝,⌜f v = f 6⌝],⌜h v = h 7⌝),
	([⌜p ∨ q⌝, ⌜v = 2 ∧ ∀ v ⦁ v = 3⌝,⌜f v = f 6⌝],⌜h v = h 7⌝))];
store_mt_results (mt_runf (op =#)) [("all_var_elim_asm_tac c",
	tac_res1 all_var_elim_asm_tac,
	([⌜p ∨ q⌝, ⌜v = 2 ∧ ∀ v ⦁ v = 3⌝,⌜(v:ℕ) = v⌝,⌜f v = f 6⌝],⌜h v = h 7⌝),
	([⌜p ∨ q⌝, ⌜v = 2 ∧ ∀ v ⦁ v = 3⌝,⌜f v = f 6⌝],⌜h v = h 7⌝))];
store_mt_results (mt_runf (op =#)) [("all_var_elim_asm_tac1 c",
	tac_res1 all_var_elim_asm_tac,
	([⌜p ∨ q⌝, ⌜v = 2 ∧ ∀ v ⦁ v = 3⌝,⌜(v:ℕ) = v⌝,⌜f v = f 6⌝],⌜h v = h 7⌝),
	([⌜p ∨ q⌝, ⌜v = 2 ∧ ∀ v ⦁ v = 3⌝,⌜f v = f 6⌝],⌜h v = h 7⌝))];
store_mt_results (mt_runf (op =#)) [("ALL_VAR_ELIM_ASM_T c",
	tac_res1 (ALL_VAR_ELIM_ASM_T asm_tac),
	([⌜p ∨ q⌝, ⌜v = 2 ∧ ∀ v ⦁ v = 3⌝,⌜(v:ℕ) = v⌝,⌜f v = f 6⌝],⌜h v = h 7⌝),
	([⌜p ∨ q⌝, ⌜v = 2 ∧ ∀ v ⦁ v = 3⌝,⌜f v = f 6⌝],⌜h v = h 7⌝))];
store_mt_results (mt_runf (op =#)) [("ALL_VAR_ELIM_ASM_T1 c",
	tac_res1 (ALL_VAR_ELIM_ASM_T1 asm_tac),
	([⌜p ∨ q⌝, ⌜v = 2 ∧ ∀ v ⦁ v = 3⌝,⌜(v:ℕ) = v⌝,⌜f v = f 6⌝],⌜h v = h 7⌝),
	([⌜p ∨ q⌝, ⌜v = 2 ∧ ∀ v ⦁ v = 3⌝,⌜f v = f 6⌝],⌜h v = h 7⌝))];
=TEX
=SML
store_mt_results (mt_runf (op =#)) [("all_var_elim_asm_tac d",
	tac_res1 all_var_elim_asm_tac,
	([⌜c (h:'b) = (d:'a)⌝,⌜a = b⌝,⌜(b:'a) = c (h:'b)⌝,⌜e = f⌝,⌜d = e⌝],⌜f = a⌝),
	([⌜c h = (f:'a)⌝,⌜(b:'a) = c h⌝],⌜(f:'a) = b⌝))
	];
store_mt_results (mt_runf (op =#)) [("all_var_elim_asm_tac1 d",
	tac_res1 all_var_elim_asm_tac1,
	([⌜c h = (d:'a)⌝,⌜a = b⌝,⌜(b:'a) = c h⌝,⌜e = f⌝,⌜d = e⌝],⌜f = a⌝),
	([],⌜(c h:'a) = c h⌝))];
=TEX
Are names done properly?
=SML
store_mt_results (mt_runf (op =#)) [("name_heuristic 1",
	tac_res1 all_var_elim_asm_tac1,
	([⌜x1234'' = yy123⌝],⌜x1234'' = yy123⌝),
	([],⌜yy123 = yy123⌝)),
	("name_heuristic 2",
	tac_res1 all_var_elim_asm_tac1,
	([⌜yy123 = x1234''⌝],⌜x1234'' = yy123⌝),
	([],⌜yy123 = yy123⌝))];
=TEX
Do we properly check unchanged assumptions?
=SML
store_mt_results mt_run [("var_elim_asm_tac check_asm",
	tac_solve (var_elim_asm_tac ⌜y = 1⌝),
	([⌜f 2 = f 1⌝,⌜y = 1⌝],⌜f 2 = f y⌝),
	true)];
store_mt_results mt_run [("var_elim_nth_asm_tac check_asm",
	tac_solve (var_elim_nth_asm_tac 2),
	([⌜f 2 = f 1⌝,⌜y = 1⌝],⌜f 2 = f y⌝),
	true)];
store_mt_results mt_run [("all_var_elim_asm_tac check_asm",
	tac_solve (all_var_elim_asm_tac),
	([⌜f 2 = f 1⌝,⌜y = 1⌝],⌜f 2 = f y⌝),
	true)];
store_mt_results mt_run [("all_var_elim_asm_tac1 check_asm",
	tac_solve (all_var_elim_asm_tac1),
	([⌜f 2 = f 1⌝,⌜y = 1⌝],⌜f 2 = f y⌝),
	true)];

=TEX
=SML
store_mt_results mt_run_fail [("var_elim_asm_tac 9301",
	tac_fail (var_elim_asm_tac ⌜x = x⌝),
	([],mk_t),
	gen_fail_msg "var_elim_asm_tac" 9301 [string_of_term ⌜x = x⌝]),
	("VAR_ELIM_ASM_T 9301",
	tac_fail (VAR_ELIM_ASM_T ⌜x = x⌝ asm_tac),
	([],mk_t),
	gen_fail_msg "VAR_ELIM_ASM_T" 9301 [string_of_term ⌜x = x⌝])];
=TEX
=SML
store_mt_results mt_run_fail [("var_elim_nth_asm_tac 9303",
	tac_fail (var_elim_nth_asm_tac 1),
	([],mk_t),
	gen_fail_msg "var_elim_nth_asm_tac" 9303 ["1"]),
	("VAR_ELIM_NTH_ASM_T 9303",
	tac_fail (VAR_ELIM_NTH_ASM_T 1 asm_tac),
	([],mk_t),
	gen_fail_msg "VAR_ELIM_NTH_ASM_T" 9303 ["1"])];
=TEX
=SML
store_mt_results mt_run_fail [("var_elim_asm_tac 29027",
	tac_fail (var_elim_asm_tac mk_t),
	([mk_t],mk_t),
	gen_fail_msg "var_elim_asm_tac" 29027 [string_of_term mk_t]),
	("VAR_ELIM_ASM_T 29027",
	tac_fail (VAR_ELIM_ASM_T mk_t asm_tac),
	([mk_t],mk_t),
	gen_fail_msg "VAR_ELIM_ASM_T" 29027 [string_of_term mk_t])];
=TEX
=SML
store_mt_results mt_run_fail [("all_var_elim_asm_tac 29028",
	tac_fail all_var_elim_asm_tac,
	([mk_t],mk_t),
	gen_fail_msg "all_var_elim_asm_tac" 29028 []),
	("all_var_elim_asm_tac1 29028",
	tac_fail all_var_elim_asm_tac1,
	([mk_t],mk_t),
	gen_fail_msg "all_var_elim_asm_tac1" 29028 []),
	("ALL_VAR_ELIM_ASM_T 29028",
	tac_fail (ALL_VAR_ELIM_ASM_T asm_tac),
	([mk_t],mk_t),
	gen_fail_msg "ALL_VAR_ELIM_ASM_T" 29028 []),
	("ALL_VAR_ELIM_ASM_T1 29028",
	tac_fail (ALL_VAR_ELIM_ASM_T1 asm_tac),
	([mk_t],mk_t),
	gen_fail_msg "ALL_VAR_ELIM_ASM_T1" 29028 [])];
=TEX

\section{TACTICALS}
=SML
store_mt_results mt_run [
	("THEN_T1 a",
	tac_solve (strip_tac THEN ∧_tac THEN_T1 ∧_tac
		THEN_LIST [accept_tac (asm_rule ⌜a:BOOL⌝),
		accept_tac (asm_rule ⌜b:BOOL⌝),
		accept_tac (∧_intro(asm_rule ⌜c:BOOL⌝)(asm_rule ⌜d:BOOL⌝))]),
	([],⌜(a ∧ b ∧ c ∧ d) ⇒ (a ∧ b) ∧ (c ∧ d)⌝),
	true),
	("THEN_T1 b",
	tac_solve (strip_tac THEN_T1 ∧_tac
		THEN_LIST [accept_tac (asm_rule ⌜a:BOOL⌝),
		accept_tac (asm_rule ⌜b:BOOL⌝)]),
	([],⌜(a ∧ b ∧ c ∧ d) ⇒ (a ∧ b)⌝),
	true),
	("THEN_T1 c",
	tac_solve (REPEAT strip_tac THEN_T1 ∧_tac),
	([],⌜(a ∧ b ∧ c ∧ d) ⇒ (a ∧ b) ∧ (c ∧ d)⌝),
	true)];
=TEX
=SML
store_mt_results mt_run [
	("THEN1 a",
	tac_solve (strip_tac THEN ∧_tac THEN1 ∧_tac
		THEN_LIST [accept_tac (asm_rule ⌜a:BOOL⌝),
		accept_tac (asm_rule ⌜b:BOOL⌝),
		accept_tac (∧_intro(asm_rule ⌜c:BOOL⌝)(asm_rule ⌜d:BOOL⌝))]),
	([],⌜(a ∧ b ∧ c ∧ d) ⇒ (a ∧ b) ∧ (c ∧ d)⌝),
	true),
	("THEN1 b",
	tac_solve (strip_tac THEN1 ∧_tac
		THEN_LIST [accept_tac (asm_rule ⌜a:BOOL⌝),
		accept_tac (asm_rule ⌜b:BOOL⌝)]),
	([],⌜(a ∧ b ∧ c ∧ d) ⇒ (a ∧ b)⌝),
	true),
	("THEN1 c",
	tac_solve (REPEAT strip_tac THEN1 ∧_tac),
	([],⌜(a ∧ b ∧ c ∧ d) ⇒ (a ∧ b) ∧ (c ∧ d)⌝),
	true)];
=TEX
=SML
store_mt_results mt_run_fail [("THEN_T1 fail 1",
	tac_fail (∀_tac THEN_T1 id_tac),
	([],⌜F⌝),
	gen_fail_msg "∀_tac" 29001 []),
	("THEN_T1 fail 2",
	tac_fail (id_tac THEN_T1 ∀_tac),
	([],⌜F⌝),
	gen_fail_msg "∀_tac" 29001 [])];
store_mt_results mt_run_fail [("THEN1 fail 1",
	tac_fail (∀_tac THEN1 id_tac),
	([],⌜F⌝),
	gen_fail_msg "∀_tac" 29001 []),
	("THEN1 fail 2",
	tac_fail (id_tac THEN1 ∀_tac),
	([],⌜F⌝),
	gen_fail_msg "∀_tac" 29001 [])];
=TEX
\section{CONVERSIONS}
=SML
store_mt_results (mt_runf (op =$))[
	("¬_in_conv 1",
	snd o dest_eq o concl o ¬_in_conv,
	⌜¬¬ T⌝,
	⌜T⌝),
	("¬_in_conv 2",
	snd o dest_eq o concl o ¬_in_conv,
	⌜¬(b ∧ a)⌝,
	⌜¬ b ∨ ¬ a⌝),
	("¬_in_conv 3",
	snd o dest_eq o concl o ¬_in_conv,
	⌜¬(b ∨ a)⌝,
	⌜¬ b ∧ ¬ a⌝),
	("¬_in_conv 4",
	snd o dest_eq o concl o ¬_in_conv,
	⌜¬(a ⇒ b)⌝,
	⌜a ∧ ¬ b⌝),
	("¬_in_conv 5",
	snd o dest_eq o concl o ¬_in_conv,
	⌜¬(c ⇔ b)⌝,
	⌜(c ∧ ¬b) ∨ (b ∧ ¬c)⌝),
	("¬_in_conv 6",
	snd o dest_eq o concl o ¬_in_conv,
	⌜¬(if a then b else d)⌝,
	⌜if a then ¬b else ¬d⌝),
	("¬_in_conv 7",
	snd o dest_eq o concl o ¬_in_conv,
	⌜¬(∀(x,y) ⦁ x ∧ y)⌝,
	⌜∃(x,y) ⦁ ¬(x ∧ y)⌝),
	("¬_in_conv 8",
	snd o dest_eq o concl o ¬_in_conv,
	⌜¬(∃(x,y) ⦁ x ∧ y)⌝,
	⌜∀(x,y) ⦁ ¬(x ∧ y)⌝),
	("¬_in_conv 9",
	snd o dest_eq o concl o ¬_in_conv,
	⌜¬(∃⋎1(x,y) ⦁ x ∧ y)⌝,
	⌜∀(x,y) ⦁ ¬((x ∧ y) ∧ ∀ (x',y')⦁ x' ∧ y' ⇒ (x',y') = (x,y))⌝),
	("¬_in_conv 10",
	snd o dest_eq o concl o ¬_in_conv,
	⌜¬ T⌝,
	⌜F⌝),
	("¬_in_conv 11",
	snd o dest_eq o concl o ¬_in_conv,
	⌜¬ F⌝,
	⌜T⌝)];
=TEX
=SML
store_mt_results mt_run_fail [("¬_in_conv 28131",
	¬_in_conv,
	mk_t,
	gen_fail_msg "¬_in_conv" 28131 ["⌜T⌝"])];
=TEX
\section{CANONICALISATION}
=SML
store_mt_results (mt_runf (op =#))[("¬_rewrite_canon 1",
	dest_thm o hd o ¬_rewrite_canon,
	asm_rule ⌜¬(a ∨ b)⌝,
	( [⌜¬(a ∨ b)⌝],⌜¬ a ∧ ¬ b⌝)),
	("¬_rewrite_canon 2",
	dest_thm o hd o ¬_rewrite_canon,
	asm_rule ⌜¬(∃ (x,y) ⦁x = y)⌝,
	( [⌜¬(∃ (x,y) ⦁x = y)⌝],⌜∀(x,y)⦁¬(x = y)⌝)),
	("¬_rewrite_canon 3",
	dest_thm o hd o ¬_rewrite_canon,
	asm_rule ⌜¬a⌝,
	( [⌜¬a⌝],⌜a ⇔ F⌝)),
	("¬_rewrite_canon 4",
	dest_thm o hd o ¬_rewrite_canon,
	asm_rule ⌜¬¬a⌝,
	( [⌜¬¬a⌝],⌜a:BOOL⌝))];
store_mt_results mt_run_fail [("¬_rewrite_canon 26201",
	¬_rewrite_canon,
	t_thm,
	gen_fail_msg "fail_canon" 26201 [])];
=TEX
=SML
store_mt_results (mt_runf (op =#))[("∀_rewrite_canon 1",
	dest_thm o hd o ∀_rewrite_canon,
	asm_rule ⌜∀ (x,y) ⦁ x = y⌝,
	( [⌜∀ (x,y) ⦁ x = y⌝],⌜x = y⌝))];
store_mt_results mt_run_fail [("∀_rewrite_canon 26201",
	∀_rewrite_canon,
	t_thm,
	gen_fail_msg "fail_canon" 26201 [])];
=TEX
The following does test all four canonicalisations that
make up the compilation, and the composition functions and $REWRITE\_CAN$.
=SML
store_mt_results (mt_runf (op =#))[("pair_rw_canon 1",
	dest_thm o hd o pair_rw_canon,
	asm_rule ⌜¬(a ∨ b)⌝,
	( [⌜¬(a ∨ b)⌝],⌜a ⇔ F⌝)),
	("pair_rw_canon 2",
	dest_thm o hd o pair_rw_canon,
	asm_rule ⌜¬(∃ (x,y) ⦁x = y)⌝,
	( [⌜¬(∃ (x, y)⦁ x = y)⌝],⌜∀ y x ⦁ (x = y) ⇔ F⌝)),
	("pair_rw_canon 3",
	dest_thm o hd o pair_rw_canon,
	asm_rule ⌜¬a⌝,
	( [⌜¬a⌝],⌜a ⇔ F⌝)),
	("pair_rw_canon 4",
	dest_thm o hd o pair_rw_canon,
	asm_rule ⌜∀ (x,y) ⦁ x = y⌝,
	( [⌜∀ (x,y) ⦁ x = y⌝],⌜∀ y x ⦁ x = y⌝)),
	("pair_rw_canon 5",
	dest_thm o hd o pair_rw_canon,
	asm_rule ⌜∀ (x,y) ⦁ x⌝,
	( [⌜∀ (x,y) ⦁ x⌝],⌜∀ x ⦁ x ⇔ T⌝))];
=TEX
\section{PROOF CONTEXTS}
\subsection{Stripping Tactics and Tacticals}
We test those areas enhanced by the proof context $pair$
over $initial\_strip$,
after retesting that initial form.
We don't test much of the moving in of negations, as
the tests for $¬\_in\_conv$ may be considered adequate.
=SML
store_mt_results (mt_runf (op =$))[
	("strip_tac 1",
	tac_res strip_tac,
	⌜∀ x ⦁ x ∧ y⌝,
	⌜x ∧ y⌝),
	("strip_tac 2",
	tac_res strip_tac,
	⌜a ∧ b⌝,
	⌜a : BOOL⌝),
	("strip_tac 3",
	tac_res strip_tac,
	⌜a ∨ ¬ b⌝,
	⌜b ⇒ a⌝),
	("strip_tac 4",
	tac_res strip_tac,
	⌜¬ a ∨ b⌝,
	⌜a ⇒ b⌝),
	("strip_tac 5",
	tac_res strip_tac,
	⌜a ∨ b⌝,
	⌜¬ a ⇒ b⌝),
	("strip_tac 6",
	tac_res strip_tac,
	⌜a ⇔ b⌝,
	⌜(a ⇒ b) ∧ (b ⇒ a)⌝),
	("strip_tac 7",
	tac_res strip_tac,
	⌜if a then (b:BOOL) else c⌝,
	⌜(a ⇒ b) ∧ (¬ a ⇒ c)⌝),
	("strip_tac 8",
	tac_res strip_tac,
	⌜¬ (a ∨ b)⌝,
	⌜¬ a ∧ ¬ b⌝)];
store_mt_results (mt_runf (op =$))[
	("strip_tac p1",
	tac_res strip_tac,
	⌜∀ (x,y) z ⦁ x ∧ y ∧ z⌝,
	⌜∀ x y z ⦁ x ∧ y ∧ z⌝),
	("strip_tac p2",
	tac_res strip_tac,
	⌜∀ (x,y,z) ⦁ x ∧ y ∧ z⌝,
	⌜∀ x y z ⦁ x ∧ y ∧ z⌝)];
store_mt_results (mt_runf (op =#))[
	("strip_tac a1",
	tac_res1 strip_tac,
	([],⌜a ⇒ b⌝),
	([⌜a:BOOL⌝],⌜b:BOOL⌝)),
	("strip_tac a2",
	tac_res1 strip_tac,
	([⌜a:BOOL⌝],⌜a ⇒ b⌝),
	([⌜a:BOOL⌝],⌜b:BOOL⌝)),
	("strip_tac a3",
	tac_res1 strip_tac,
	([],⌜(a ∧ b) ⇒ c⌝),
	([⌜b:BOOL⌝,⌜a:BOOL⌝],⌜c:BOOL⌝)),
	("strip_tac a4",
	tac_res1 strip_tac,
	([],⌜(a ∨ b) ⇒ c⌝),
	([⌜a:BOOL⌝],⌜c:BOOL⌝)),
	("strip_tac a5",
	tac_res1 strip_tac,
	([],⌜(∃ x ⦁ f x) ⇒ a⌝),
	([⌜f x :BOOL⌝],⌜a:BOOL⌝)),
	("strip_tac a6",
	tac_res1 strip_tac,
	([],⌜(a ⇒ b) ⇒ c⌝),
	([⌜¬ a⌝],⌜c:BOOL⌝)),
	("strip_tac a7",
	tac_res1 strip_tac,
	([],⌜(a ⇔ b) ⇒ c⌝),
	([⌜¬ b⌝,⌜¬ a⌝],⌜c : BOOL⌝)),
	("strip_tac a8",
	tac_res1 strip_tac,
	([],⌜(if a then b else c) ⇒ d⌝),
	([⌜c:BOOL⌝,⌜¬ a⌝],⌜d:BOOL⌝)),
	("strip_tac a9",
	tac_res1 strip_tac,
	([],⌜(¬( a ∨ b)) ⇒ c⌝),
	([⌜¬ b⌝,⌜¬ a⌝],⌜c : BOOL⌝)),
	("strip_tac a10",
	tac_res1 strip_tac,
	([],⌜(∃⋎1 x ⦁ f x) ⇒ a⌝),
	([⌜∀ x':'a ⦁ f x' ⇒ x' = x⌝,⌜f x:BOOL⌝],⌜a:BOOL⌝))
];
store_mt_results (mt_runf (op =#))[
	("strip_tac pa1",
	tac_res1 strip_tac,
	([],⌜(∃ (x,y) ⦁ f x y) ⇒ a⌝),
	([⌜f x y:BOOL⌝],⌜a:BOOL⌝)),
	("strip_tac pa2",
	tac_res1 strip_tac,
	([],⌜(∃ (x,y,z) ⦁ f x y z) ⇒ a⌝),
	([⌜f x y z:BOOL⌝],⌜a:BOOL⌝)),
	("strip_tac pa3",
	tac_res1 strip_tac,
	([],⌜(∀ (x,y) ⦁ f x y) ⇒ a⌝),
	([⌜∀ x y ⦁ f x y⌝],⌜a:BOOL⌝)),
	("strip_tac pa4",
	tac_res1 strip_tac,
	([],⌜(∃⋎1 (x,y) ⦁ f x y) ⇒ a⌝),
	([⌜∀ (x':'a) (y':'b) ⦁ f x' y' ⇒ (x',y') = (x,y)⌝,⌜f x y:BOOL⌝],⌜a:BOOL⌝))
];
store_mt_results mt_run [
	("strip_tac tp1",
	tac_solve strip_tac,
	([],⌜T⌝),
	true),
	("strip_tac tp2",
	tac_solve strip_tac,
	([⌜a:BOOL⌝,⌜b:BOOL⌝],⌜a:BOOL⌝),
	true),
	("strip_tac tp3",
	tac_solve strip_tac,
	([],⌜(a ∧ b) ⇒ a⌝),
	true),
	("strip_tac tp4",
	tac_solve strip_tac,
	([⌜¬ a⌝],⌜(a ∧ b) ⇒ c⌝),
	true),
	("strip_tac tp5",
	tac_solve strip_tac,
	([⌜a:BOOL⌝],⌜¬ (a ∨ b) ⇒ c⌝),
	true)
];
store_mt_results mt_run_fail [("strip_tac",
	tac_fail strip_tac,
	([],⌜f x : BOOL⌝),
	gen_fail_msg "strip_tac" 28003 ["⌜f x⌝"])];
=TEX
The change to $strip\_asm\_tac$ has been tested in testing $strip\_tac$,
but for the record:
=SML
store_mt_results (mt_runf (op =#))[("strip_asm_tac 1",
	tac_res1 (strip_asm_tac (asm_rule ⌜a ∧ b⌝)),
	([⌜a ∧ b⌝],⌜c:BOOL⌝),
	([⌜b:BOOL⌝,⌜a:BOOL⌝,⌜a ∧ b⌝],⌜c:BOOL⌝)),
	("strip_asm_tac 2",
	tac_res1 (strip_asm_tac t_thm),
	([],⌜c:BOOL⌝),
	([],⌜c:BOOL⌝))];
=TEX
The change to $check\_asm\_tac$ has been tested in testing $strip\_tac$,
but for the record:
=SML
store_mt_results (mt_runf (op =#))[("check_asm_tac 1",
	tac_res1 (check_asm_tac (∧_left_elim(asm_rule ⌜a ∧ b⌝))),
	([⌜a ∧ b⌝],⌜c:BOOL⌝),
	([⌜a:BOOL⌝,⌜a ∧ b⌝],⌜c:BOOL⌝)),
	("check_asm_tac 2",
	tac_res1 (check_asm_tac t_thm),
	([],⌜c:BOOL⌝),
	([],⌜c:BOOL⌝))];
=TEX
The change to $STRIP\_THM\_THEN$ has been tested in testing $strip\_tac$,
but for the record:
=SML
store_mt_results (mt_runf (op =#))[("STRIP_THM_THEN",
	tac_res1 ((STRIP_THM_THEN strip_asm_tac) (asm_rule ⌜a ∧ b⌝)),
	([⌜a ∧ b⌝],⌜c:BOOL⌝),
	([⌜b:BOOL⌝,⌜a:BOOL⌝,⌜a ∧ b⌝],⌜c:BOOL⌝))];
store_mt_results mt_run_fail [("STRIP_THM_THEN 28003",
	STRIP_THM_THEN strip_asm_tac,
	t_thm,
	gen_fail_msg "STRIP_THM_THEN" 28003 ["⊢ T"])];
=TEX
The change to $STRIP\-\_CONCL\_T$ has been tested in testing $strip\_tac$,
but for the record:
=SML
store_mt_results (mt_runf (op =#))[("STRIP_CONCL_T",
	tac_res1 (STRIP_CONCL_T asm_tac),
	([],⌜(a ∧ b) ⇒ c⌝),
	([⌜a ∧ b⌝],⌜c : BOOL⌝))];
store_mt_results mt_run_fail [("STRIP_CONCL_T 28003",
	tac_fail (STRIP_CONCL_T asm_tac),
	([],⌜f x: BOOL⌝),
	gen_fail_msg "STRIP_CONCL_T" 28003 ["⌜f x⌝"])];
=TEX
\subsection{Concerning Single-Stepping $strip\_tac$}.
We now do much the same again, but single-stepping:
=SML
store_mt_results (mt_runf (op =$))[
	("step_strip_tac 1",
	tac_res step_strip_tac,
	⌜∀ x ⦁ x ∧ y⌝,
	⌜x ∧ y⌝),
	("step_strip_tac 2",
	tac_res step_strip_tac,
	⌜a ∧ b⌝,
	⌜a : BOOL⌝),
	("step_strip_tac 3",
	tac_res step_strip_tac,
	⌜a ∨ ¬ b⌝,
	⌜b ⇒ a⌝),
	("step_strip_tac 4",
	tac_res step_strip_tac,
	⌜¬ a ∨ b⌝,
	⌜a ⇒ b⌝),
	("step_strip_tac 5",
	tac_res step_strip_tac,
	⌜a ∨ b⌝,
	⌜¬ a ⇒ b⌝),
	("step_strip_tac 6",
	tac_res step_strip_tac,
	⌜a ⇔ b⌝,
	⌜(a ⇒ b) ∧ (b ⇒ a)⌝),
	("step_strip_tac 7",
	tac_res step_strip_tac,
	⌜if a then (b:BOOL) else c⌝,
	⌜(a ⇒ b) ∧ (¬ a ⇒ c)⌝),
	("step_strip_tac 8",
	tac_res step_strip_tac,
	⌜¬ (a ∨ b)⌝,
	⌜¬ a ∧ ¬ b⌝)];
store_mt_results (mt_runf (op =$))[
	("step_strip_tac p1",
	tac_res step_strip_tac,
	⌜∀ (x,y) z ⦁ x ∧ y ∧ z⌝,
	⌜∀ x y z ⦁ x ∧ y ∧ z⌝),
	("step_strip_tac p2",
	tac_res step_strip_tac,
	⌜∀ (x,y,z) ⦁ x ∧ y ∧ z⌝,
	⌜∀ x y z ⦁ x ∧ y ∧ z⌝)];
store_mt_results (mt_runf (op =#))[
	("step_strip_tac a1",
	tac_res1 step_strip_tac,
	([],⌜a ⇒ b⌝),
	([⌜a:BOOL⌝],⌜b:BOOL⌝)),
	("step_strip_tac a2",
	tac_res1 step_strip_tac,
	([⌜a:BOOL⌝],⌜a ⇒ b⌝),
	([⌜a:BOOL⌝],⌜b:BOOL⌝)),
	("step_strip_tac a3",
	tac_res1 step_strip_tac,
	([],⌜(a ∧ b) ⇒ c⌝),
	([⌜a:BOOL⌝],⌜b ⇒ c⌝)),
	("step_strip_tac a4",
	tac_res1 step_strip_tac,
	([],⌜(a ∨ b) ⇒ c⌝),
	([],⌜a ⇒ c⌝)),
	("step_strip_tac a5",
	tac_res1 step_strip_tac,
	([],⌜(∃ x ⦁ f x) ⇒ a⌝),
	([],⌜f x ⇒ a⌝)),
	("step_strip_tac a6",
	tac_res1 step_strip_tac,
	([],⌜(a ⇒ b) ⇒ c⌝),
	([],⌜(¬ a ∨ b) ⇒ c⌝)),
	("step_strip_tac a7",
	tac_res1 step_strip_tac,
	([],⌜(a ⇔ b) ⇒ c⌝),
	([],⌜((a ⇒ b) ∧ (b ⇒ a)) ⇒ c⌝)),
	("step_strip_tac a8",
	tac_res1 step_strip_tac,
	([],⌜(if a then b else c) ⇒ d⌝),
	([],⌜((a ⇒ b) ∧ (¬ a ⇒ c)) ⇒ d⌝)),
	("step_strip_tac a9",
	tac_res1 step_strip_tac,
	([],⌜(¬( a ∨ b)) ⇒ c⌝),
	([],⌜(¬ a ∧ ¬ b) ⇒ c⌝)),
	("step_strip_tac a10",
	tac_res1 step_strip_tac,
	([],⌜(∃⋎1 x ⦁ f x) ⇒ a⌝),
	([],⌜(∃ x ⦁ f x ∧ (∀ x':'a ⦁ f x' ⇒ x' = x)) ⇒ a⌝))
];
store_mt_results mt_run [
	("step_strip_tac tp1",
	tac_solve step_strip_tac,
	([],⌜T⌝),
	true),
	("step_strip_tac tp2",
	tac_solve step_strip_tac,
	([⌜a:BOOL⌝,⌜b:BOOL⌝],⌜a:BOOL⌝),
	true),
	("step_strip_tac tp3",
	tac_solve step_strip_tac,
	([],⌜(a ∧ b) ⇒ a⌝),
	true),
	("step_strip_tac tp4",
	tac_solve step_strip_tac,
	([⌜¬ a⌝],⌜(a ∧ b) ⇒ c⌝),
	true)
	];
store_mt_results mt_run_fail [("step_strip_tac",
	tac_fail step_strip_tac,
	([],⌜f x : BOOL⌝),
	gen_fail_msg "step_strip_tac" 28003 ["⌜f x⌝"])];
=TEX
$step\_strip\_asm\_tac$ has been tested in testing $step\-\_strip\-\_tac$,
but for the record:
=SML
store_mt_results (mt_runf (op =#))[("step_strip_asm_tac 1",
	tac_res1 (step_strip_asm_tac (asm_rule ⌜a ∧ b⌝)),
	([⌜a ∧ b⌝],⌜c:BOOL⌝),
	([⌜a:BOOL⌝,⌜a ∧ b⌝],⌜b ⇒ c⌝)),
	("step_strip_asm_tac 2",
	tac_res1 (step_strip_asm_tac t_thm),
	([],⌜c:BOOL⌝),
	([],⌜c:BOOL⌝))];
=TEX
\subsection{Concerning Induction}
=SML
val ind_thm = tac_proof (([], ⌜∀ p⦁ p 0 ∧ (∀ n⦁ p n ⇒ p (n + 1)) ⇒ (∀ n⦁ p n)⌝),
	accept_tac induction_thm);
val ind_thm1 = tac_proof (([], ⌜∀ p⦁ p 0 ∧ (∀ long_name⦁ p long_name ⇒ p (long_name + 1)) ⇒ (∀ long_name⦁ p long_name)⌝),
	accept_tac induction_thm);
=TEX
=SML
store_mt_results mt_run [
	("gen_induction_tac 1",
	tac_solve
		(gen_induction_tac ind_thm ⌜i:ℕ⌝ THEN_LIST
			[TOP_ASM_T accept_tac, asm_fc_tac[]]),
	([⌜q 0:BOOL⌝, ⌜∀i⦁q i ⇒ q(i+1)⌝],⌜q(i:ℕ):BOOL⌝),
	true)
];
=TEX
=SML
store_mt_results (mt_runf (op =#)) [
	("gen_induction_tac 2",
	tac_res1 (gen_induction_tac ind_thm ⌜i:ℕ⌝ THEN_LIST
			[TOP_ASM_T accept_tac, id_tac]),
	([⌜q 0:BOOL⌝, ⌜∀i⦁q i ⇒ q(i+1)⌝],⌜q(i:ℕ):BOOL⌝),
	([⌜q(i:ℕ):BOOL⌝, ⌜q 0:BOOL⌝, ⌜∀i⦁q i ⇒ q(i+1)⌝],⌜q(i+1):BOOL⌝)),
	("gen_induction_tac 3",
	tac_res1 (gen_induction_tac ind_thm ⌜i:ℕ⌝ THEN_LIST
			[TOP_ASM_T accept_tac, id_tac]),
	([⌜qqqq 0:BOOL⌝, ⌜∀i⦁qqqq i ⇒ qqqq(i+1)⌝],⌜qqqq(i:ℕ):BOOL⌝),
	([⌜qqqq(i:ℕ):BOOL⌝, ⌜qqqq 0:BOOL⌝, ⌜∀i⦁qqqq i ⇒ qqqq(i+1)⌝],
		⌜qqqq(i+1):BOOL⌝)),
	("gen_induction_tac 4",
	tac_res1 (gen_induction_tac ind_thm1 ⌜i:ℕ⌝ THEN_LIST
			[TOP_ASM_T accept_tac, id_tac]),
	([⌜q 0:BOOL⌝, ⌜∀i⦁q i ⇒ q(i+1)⌝],⌜q(i:ℕ):BOOL⌝),
	([⌜q(i:ℕ):BOOL⌝, ⌜q 0:BOOL⌝, ⌜∀i⦁q i ⇒ q(i+1)⌝],⌜q(i+1):BOOL⌝)),
	("gen_induction_tac 5",
	tac_res1 (gen_induction_tac ind_thm1 ⌜i:ℕ⌝ THEN_LIST
			[TOP_ASM_T accept_tac, id_tac]),
	([⌜abcdefghijklmnopq 0:BOOL⌝,
		⌜∀i⦁abcdefghijklmnopq i ⇒ abcdefghijklmnopq(i+1)⌝],
			⌜abcdefghijklmnopq(i:ℕ):BOOL⌝),
	([⌜abcdefghijklmnopq(i:ℕ):BOOL⌝,
		⌜abcdefghijklmnopq 0:BOOL⌝,
		⌜∀i⦁abcdefghijklmnopq i ⇒ abcdefghijklmnopq(i+1)⌝],
			⌜abcdefghijklmnopq(i+1):BOOL⌝))
];
=TEX
=SML
val bad_ind_thm = tac_proof (([], ⌜T⌝), strip_tac);
store_mt_results mt_run_fail [
	("gen_induction_tac 29021",
	gen_induction_tac, bad_ind_thm,
	gen_fail_msg "gen_induction_tac" 29021 [string_of_thm bad_ind_thm] )
];
=TEX
=SML
store_mt_results mt_run_fail [
	("gen_induction_tac 29024",
	gen_induction_tac ind_thm, ⌜1⌝,
	gen_fail_msg "gen_induction_tac" 29024 [string_of_term ⌜1⌝] )
];
=TEX
=SML
store_mt_results mt_run_fail [
	("gen_induction_tac 29023",
	gen_induction_tac ind_thm, ⌜x:'a⌝,
	gen_fail_msg "gen_induction_tac" 29023 [string_of_term ⌜x:'a⌝, string_of_typeⓣℕ⌝] )
];
=TEX
=SML
store_mt_results mt_run_fail [
	("gen_induction_tac 29025",
	gen_induction_tac ind_thm ⌜i:ℕ⌝,
	([⌜q(i:ℕ):BOOL⌝],⌜q(i:ℕ):BOOL⌝),
	gen_fail_msg "gen_induction_tac" 29025 [string_of_term ⌜i:ℕ⌝] )
];
=TEX
We make a spot check on the tactical's error messages:
=SML
store_mt_results mt_run_fail [
	("GEN_INDUCTION_T 29026",
	GEN_INDUCTION_T ind_thm strip_asm_tac ⌜j:ℕ⌝,
	([⌜q(a:ℕ):BOOL⌝],⌜q(i:ℕ):BOOL⌝),
	gen_fail_msg "GEN_INDUCTION_T" 29026 [string_of_term ⌜j:ℕ⌝] )
];
=TEX
=SML
store_mt_results mt_run [
	("GEN_INDUCTION_T 1",
	tac_solve
		(GEN_INDUCTION_T ind_thm strip_asm_tac ⌜i:ℕ⌝ THEN_LIST
			[TOP_ASM_T accept_tac, asm_fc_tac[]]),
	([⌜q 0:BOOL⌝, ⌜∀i⦁q i ⇒ q(i+1)⌝],⌜q(i:ℕ):BOOL⌝),
	true)
];
=TEX
=SML
val pp'ts_def = get_defn "misc" "pp'ts_def";
val ind_thm1 = tac_proof (([], ⌜∀ p⦁ p 0 ∧ (∀ n⦁ p n ⇒ p (n + 1)) ⇒
			(∀ n⦁pp'TS (n = n) ⇒ p n)⌝),
	rewrite_tac[pp'ts_def] THEN accept_tac induction_thm);
=TEX
=SML
store_mt_results mt_run [
	("gen_induction_tac1 1",
	tac_solve
		(gen_induction_tac1 ind_thm1 THEN_LIST
			[TOP_ASM_T accept_tac, asm_fc_tac[]]),
	([⌜q 0:BOOL⌝, ⌜∀i⦁q i ⇒ q(i+1)⌝],⌜pp'TS (i = i) ⇒ q(i:ℕ):BOOL⌝),
	true)
];
=TEX
=SML
store_mt_results (mt_runf (op =#)) [
	("gen_induction_tac1 2",
	tac_res1 (gen_induction_tac1 ind_thm1 THEN_LIST
			[TOP_ASM_T accept_tac, id_tac]),
	([⌜q 0:BOOL⌝, ⌜∀i⦁q i ⇒ q(i+1)⌝],⌜pp'TS (i = i) ⇒ q(i:ℕ):BOOL⌝),
	([⌜q(i:ℕ):BOOL⌝, ⌜q 0:BOOL⌝, ⌜∀i⦁q i ⇒ q(i+1)⌝],⌜q(i+1):BOOL⌝))
];
=TEX
=SML
val bad_ind_thm1 = tac_proof (([], ⌜T⌝), strip_tac);
store_mt_results mt_run_fail [
	("gen_induction_tac1 29007",
	gen_induction_tac1, bad_ind_thm1,
	gen_fail_msg "gen_induction_tac1" 29007 [string_of_thm bad_ind_thm1] )
];
=TEX
=SML
store_mt_results mt_run_fail [
	("gen_induction_tac1 29009",
	gen_induction_tac1 ind_thm1,
	([⌜q(a:ℕ):BOOL⌝],⌜q(i:ℕ):BOOL⌝),
	gen_fail_msg "gen_induction_tac1" 29009 [string_of_term
		⌜(λp⦁pp'TS (n = n) ⇒ p n)t⌝] )
];
=TEX
We make a spot check on the tactical's error messages:
=SML
store_mt_results mt_run_fail [
	("GEN_INDUCTION_T1 29014",
	GEN_INDUCTION_T1 ind_thm1 asm_tac,
	([⌜q(a:ℕ):BOOL⌝],⌜pp'TS (42 = 42) ⇒ q 42:BOOL⌝),
	gen_fail_msg "GEN_INDUCTION_T1" 29014 [string_of_term
		⌜42⌝] )
];
=TEX
=SML
store_mt_results mt_run [
	("GEN_INDUCTION_T1 1",
	tac_solve
		(GEN_INDUCTION_T1 ind_thm1 strip_asm_tac THEN_LIST
			[TOP_ASM_T accept_tac, asm_fc_tac[]]),
	([⌜q 0:BOOL⌝, ⌜∀i⦁q i ⇒ q(i+1)⌝],⌜pp'TS (i = i) ⇒ q(i:ℕ):BOOL⌝),
	true)
];
=TEX
\subsection{Canonicalisations in $pair$}
A simple test that the rewriting canonicalisations are in place in $pair$.
=SML
store_mt_results
(mt_runf (op =#))[
	("f_rewrite_canon",
	dest_thm o rewrite_rule[asm_rule mk_f],
	asm_rule ⌜p ∧ q⌝,
	([mk_f,⌜p ∧ q⌝],mk_t)),
	("∧_rewrite_canon",
	dest_thm o pure_rewrite_rule[asm_rule ⌜p ∧ q⌝],
	asm_rule ⌜p ∧ q⌝,
	([⌜p ∧ q⌝],⌜T ∧ T⌝)),
	("¬_rewrite_canon 5",
	dest_thm o pure_rewrite_rule[asm_rule ⌜¬(p ∨ q)⌝],
	asm_rule ⌜p ∧ q⌝,
	([⌜¬(p ∨ q)⌝,⌜p ∧ q⌝],⌜F ∧ F⌝)),
	("¬_rewrite_canon 6",
	dest_thm o pure_rewrite_rule[asm_rule ⌜¬ ∃ (x,y) ⦁ (x ∧ y)⌝],
	asm_rule ⌜(x ∧ y)⌝,
	([⌜⌜¬ ∃ (x,y) ⦁ (x ∧ y)⌝⌝,⌜x ∧ y⌝],⌜F⌝)),
	("¬_rewrite_canon 7",
	dest_thm o pure_rewrite_rule[asm_rule ⌜¬ ¬(x ⇔ y)⌝],
	asm_rule ⌜(x ∧ y)⌝,
	([⌜⌜¬ ¬(x ⇔ y)⌝⌝,⌜x ∧ y⌝],⌜y ∧ y⌝)),
	("∀_rewrite_canon",
	dest_thm o pure_rewrite_rule[asm_rule ⌜∀ (x,y) ⦁ (x = 3) ∧ (y = "55")⌝],
	asm_rule ⌜f 1 ∧ g "11"⌝,
	([⌜∀ (x,y) ⦁ (x = 3) ∧ (y = "55")⌝,⌜f 1 ∧ g "11"⌝],⌜f 3 ∧ g "55"⌝)),
	("⇔_t_rewrite_canon",
	dest_thm o pure_rewrite_rule[asm_rule ⌜x:BOOL⌝],
	asm_rule ⌜x ∧ y⌝,
	([⌜x:BOOL⌝,⌜x ∧ y⌝],⌜T ∧ y⌝))
];

=TEX

\section{END OF TESTS}
=SML
set_flag("subgoal_package_quiet",lsubgoal_package_quiet);
diag_string(summarize_mt_results ());
=TEX
\end{document}
=IGN
***********COPY**************
store_mt_results (mt_runf (op =$))[("",
	tac_res ,
	⌜⌝,
	⌜⌝)];
store_mt_results (mt_runf (op =#))[("",
	tac_res1 ,
	([⌜⌝],⌜⌝),
	([⌜⌝],⌜⌝))];
store_mt_results mt_run [
	("",
	tac_solve ,
	([],⌜⌝),
	true),
];
store_mt_results mt_run_fail [("",
	tac_fail ,
	([],⌜⌝),
	gen_fail_msg ""  [])];

store_mt_results mt_run [("",
	,
	,
	)];
store_mt_results mt_run_fail [("",
	,
	,
	gen_fail_msg ""  [])];



=IGN
********************************************************************************
mdt028.doc: this file is part of the PPHol system

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

\def\Title{Module Tests for Tactics II}

\def\AbstractText{This document gives the module tests for the first group of tactics and tacticals in ICL HOL.}

\def\Reference{DS/FMU/IED/MDT028}

\def\Author{R.D. Arthan,   K. Blackburn}


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
%% LaTeX2e port: \TPPtitle{Module Tests for Tactics II}
%% LaTeX2e port: \TPPref{DS/FMU/IED/MDT028}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.33 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2005/12/12 16:05:28 $ %
%% LaTeX2e port: }}  %% Mandatory field
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: %\TPPauthor{R.D.~Arthan & WIN01}  %% Mandatory field
%% LaTeX2e port: \TPPauthors{R.D.~Arthan & WIN01 \\ K.~Blackburn & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document gives the module tests for the
%% LaTeX2e port: first group of tactics and tacticals in ICL HOL.}
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
%% LaTeX2e port: \bf Copyright \copyright\ : Lemma 1 Ltd. \number\year
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
\item [Issue 1.1 (1991/06/14)]
First version.
\item [Issue 1.3 (1991/10/30)]
Tidying.
\item [Issue 1.4 (1991/10/31)]
Adding new tests.
\item [Issue 1.5 (1991/11/19)]
Reacting to issue 1.5/6 of \cite{DS/FMU/IED/DTD051}.

\item[Issue 1.6 (1992/01/20), \FormatDate{92/01/20} ] Updated to use new fonts.
\item [Issue 1.7 (1992/01/21)]
Removed duplicate labels.
\item [Issue 1.8 (1992/02/05)]
Added $swap\_asm\_concl\_tac$ stuff.
\item [Issue 1.9 (1992/02/10)]
Added in the rest of the tests.
\item [Issue 1.10 (1992/03/18),1.11 (1992/03/19)(11th March 1992)]
Various minor additions and extensions.
\item [Issue 1.12 (1992/03/26) (26th March 1992)]
Changed to use proof context material of issue 1.13 of \cite{DS/FMU/IED/DTD051}.
\item [Issue 1.13 (1992/04/09) (9th April 1992)]
Changes required by CR0016.
\item [Issue 1.14 (1992/04/14) (14th April 1992)]
Changes required by CR0017.
\item [Issue 1.15 (1992/05/14),1.16 (1992/05/18) (14th May 1992)]
Tidying up proof contexts.
\item [Issue 1.12 (1992/03/26) (20th May 1992)]
Rearranging build proof contexts.
\item [Issue 1.13 (1992/04/09),1.14 (1992/04/14),1.15 (1992/05/14) (29th May 1992)]
Gained $prove\_tac$, $prove\_∃\_tac$.
\item [Issue 1.22 (1992/06/02) (2nd June 1992)]
Changed a ``native'' theory.
\item [Issue 1.23 (1992/06/15)]
Added $intro\_∀\_tac$.
\item [Issue 1.24 (1992/06/23) (23rd June 1992)]
Corrected $prove(\_∃)\_tac$.
\item[Issue 1.25 (1992/06/24) (24th June 1992)]
Renamings from issue 1.6 of \cite{DS/FMU/IED/WRK038},
mostly proof context name changes.
\item[Issue 1.26 (1992/07/31) (31st July 1992)]
Added error 28094.
\item[Issue 1.27 (1992/08/05) (5th August 1992)]
Added error 28083.
\item[Issue 1.31 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.32 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.33 (2005/12/12)] Added test for
=INLINEFT
intro_∀_tac1
=TEX
.
\item[Issue 1.34 (2014/02/28)] Added tests
=INLINEFT
IF_CASES_T
=TEX
\ and
=INLINEFT
if_cases_tac
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
None known.
\section{GENERAL}
\subsection{Scope}
This document contains the module tests for the material
whose detailed design is given in \cite{DS/FMU/IED/DTD009}.
\subsection{Introduction}
We are pretty cursory in the following, doing little more than just demonstrating
the tactics presence and error message origin.
\subsubsection{Dependencies}
The tests depend upon \cite{DS/FMU/IED/IMP028} and \cite{DS/FMU/IED/IMP013}.
In addition, testing by the subgoal package (section \ref{subgoalpackage})
depends on \cite{DS/FMU/IED/IMP030}.
\subsubsection{Deficiencies}
The testing could be more rigorous.
The coverage is incomplete, even at the given level of rigour.
\section{TEST CASES}
\begin{description}
\item[Group 1]
This checks the trivial tactics.
\end{description}
\section{PREAMBLE}
=SML
open_theory"basic_hol" handle _ => open_theory "misc";
val ptheory = get_current_theory_name();
delete_theory "tst028" handle _ => ();
new_theory"tst028";
use_file "dtd013";
use_file "imp013";
init_mt_results();
set_flag("subgoal_package_quiet",true);
repeat drop_main_goal;
=TEX
We use the proof contexts
``propositions'' plus ``simple$\-\_$abstractions'',
or failing that, whatever is present,
plus one that sets some default automatic proof procedures.
=SML
new_pc "mdt028_test1";
set_pr_tac (fn x => TRY_T((FIRST o map accept_tac)x)) "mdt028_test1";
set_pr_conv (FIRST_C o map (fn thm => fn x =>
	if x ~=$ fst(dest_eq(concl thm))
	then thm
	else fail_conv x)) "mdt028_test1";
val l_∃_thm = simple_tac_proof(([],⌜∃ x : 'a ⦁ T⌝),
	simple_∃_tac ⌜x:'a⌝ THEN accept_tac t_thm);
set_cs_∃_convs [(fn tm => if tm =$ ⌜∃ x : 'a ⦁ T⌝
	then ⇔_t_intro l_∃_thm
	else fail_conv tm),
	eq_match_conv ∃_rewrite_thm] "mdt028_test1";
commit_pc "mdt028_test1";

=SML
push_merge_pcs ["'propositions","'simple_abstractions","mdt028_test1"];
=TEX

=SML
fun list_eq (eq:'a * 'a -> bool) ((a :: x), (b :: y)) : bool = (
	eq(a,b) andalso list_eq eq (x, y)
) | list_eq eq ([], []) = true
| list_eq _ _ = false;
=TEX
\section{TESTS}
\subsection{Testing by $tac\_proof$}
=SML
val th1 = tac_proof( ([], ⌜T⌝), t_tac );

val th2 = tac_proof( ([⌜A:BOOL⌝], ⌜A ⇔ T⌝), ⇔_t_tac THEN POP_ASM_T accept_tac );
val th3 = tac_proof( ([⌜A:BOOL⌝], ⌜T ⇔ A⌝), ⇔_t_tac THEN POP_ASM_T accept_tac );
val th4 = tac_proof( ([], ⌜T ⇔ T⌝), ⇔_t_tac THEN t_tac);

val th5 = tac_proof( ([⌜F⌝], ⌜A:BOOL⌝), i_contr_tac THEN POP_ASM_T accept_tac );

val th6 = tac_proof( ([], ⌜¬F:BOOL⌝),
	¬_T2 ⌜A:BOOL⌝
		(fn th => asm_tac th THEN accept_tac th5)
		(fn th => asm_tac th THEN accept_tac
		(inst_term_rule[(⌜¬A⌝, ⌜A:BOOL⌝)]th5)) );

val th7 = tac_proof( ([], ⌜¬F:BOOL⌝),
	CONTR_T asm_tac THEN POP_ASM_T (accept_tac o ¬_¬_elim) );
=IGN
Don't work, don't understand it:
val th8 = tac_proof( ([], ⌜¬F⌝),
	¬_T ⌜F⌝ (fn th => asm_tac th THEN accept_tac(asm_rule⌜F⌝)) );
=TEX
=SML
val th9 = tac_proof( ([⌜F⌝, ⌜¬F⌝], ⌜A:BOOL⌝),
	¬_elim_tac ⌜F⌝ THEN
		(accept_tac(asm_rule⌜F⌝) ORELSE accept_tac(asm_rule⌜¬F⌝))  );

val th10 = tac_proof( ([], ⌜T ∧ ¬F⌝),
	∧_tac THEN_LIST[t_tac, accept_tac f_thm]  );

val th11 = tac_proof( ([], ⌜T ∨ F⌝),
	∨_left_tac THEN t_tac  );


val th12 = tac_proof( ([], ⌜F ∨ T⌝),
	∨_right_tac THEN t_tac  );
=TEX
=SML
val th13 = tac_proof( ([], ⌜A ⇒ A⌝),
	⇒_T accept_tac  );

val th14 = tac_proof( ([], ⌜if a then a else ¬a⌝),
	if_tac THEN POP_ASM_T accept_tac  );

val th15 = tac_proof( ([], ⌜∀x:'a⦁∃y:'a⦁x = y⌝),
	strip_tac THEN simple_∃_tac ⌜x⌝ THEN accept_tac(refl_conv ⌜x⌝));

val th16 = tac_proof( ([], ⌜∀x:'a⦁∃⋎1y:'a⦁x = y⌝),
	strip_tac THEN simple_∃⋎1_tac ⌜x⌝
	THEN_LIST
		[accept_tac(refl_conv ⌜x⌝),
		simple_∀_tac THEN ⇒_T (accept_tac o eq_sym_rule)]);
=TEX
\subsection{Testing Using Subgoal Package}
\label{subgoalpackage}
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
		let val (rasms,gl) = top_goal()
		in
			(drop_main_goal();
			(rasms,gl))
		end);
=TEX
Now a function that returns the multiple goals for the case when a tactic causes multiple goals:
=SML
fun ⦏tac_ress⦎ tac n (seqasms, goal) = (
		push_goal(seqasms,goal);
		a tac;
		let val gll = map (top_labelled_goal o string_of_int)
			(interval 1 n)
		in
			(drop_main_goal();
			gll)
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
\subsection{Stripping Tactics and Tacticals}
We don't test much of the moving in of negations, as
the tests for $simple\_¬\_in\_conv$ may be considered adequate.
=SML
store_mt_results (mt_runf (op =$)) [
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
store_mt_results (mt_runf (list_eq(op =#))) [
	("strip_tac m1",
	tac_ress strip_tac 2,
	([],⌜a ∧ b⌝),
	[([],⌜a:BOOL⌝),([],⌜b:BOOL⌝)]),
	("strip_tac m2",
	tac_ress strip_tac 2,
	([],⌜(a ∨ b) ⇒ c⌝),
	[([⌜a:BOOL⌝],⌜c:BOOL⌝),([⌜b:BOOL⌝],⌜c:BOOL⌝)])
	];

store_mt_results (mt_runf (op =#)) [
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
	true),
	("strip_concl_tac tp5",
	tac_solve strip_concl_tac,
	([⌜a:BOOL⌝],⌜¬ (a ∨ b) ⇒ c⌝),
	true)
];
store_mt_results mt_run_fail [("strip_tac",
	tac_fail strip_tac,
	([],⌜f x : BOOL⌝),
	gen_fail_msg "strip_tac" 28003 ["⌜f x⌝"])];
=TEX
$strip\_asm\_tac$ has been tested in testing $strip\_tac$,
but for the record:
=SML
store_mt_results (mt_runf (op =#)) [("strip_asm_tac 1",
	tac_res1 (strip_asm_tac (asm_rule ⌜a ∧ b⌝)),
	([⌜a ∧ b⌝],⌜c:BOOL⌝),
	([⌜b:BOOL⌝,⌜a:BOOL⌝,⌜a ∧ b⌝],⌜c:BOOL⌝)),
	("strip_asm_tac 2",
	tac_res1 (strip_asm_tac t_thm),
	([],⌜c:BOOL⌝),
	([],⌜c:BOOL⌝))];
=TEX
$check\_asm\_tac$ has been tested in testing $strip\_tac$,
but for the record:
=SML
store_mt_results (mt_runf (op =#)) [("check_asm_tac 1",
	tac_res1 (check_asm_tac (∧_left_elim(asm_rule ⌜a ∧ b⌝))),
	([⌜a ∧ b⌝],⌜c:BOOL⌝),
	([⌜a:BOOL⌝,⌜a ∧ b⌝],⌜c:BOOL⌝)),
	("check_asm_tac 2",
	tac_res1 (check_asm_tac t_thm),
	([],⌜c:BOOL⌝),
	([],⌜c:BOOL⌝))];
=TEX
$STRIP\_THM\_THEN$ has been tested in testing $strip\_tac$,
but for the record:
=SML
store_mt_results (mt_runf (op =#)) [("STRIP_THM_THEN",
	tac_res1 ((STRIP_THM_THEN strip_asm_tac) (asm_rule ⌜a ∧ b⌝)),
	([⌜a ∧ b⌝],⌜c:BOOL⌝),
	([⌜b:BOOL⌝,⌜a:BOOL⌝,⌜a ∧ b⌝],⌜c:BOOL⌝))];
store_mt_results mt_run_fail [("STRIP_THM_THEN 28003",
	STRIP_THM_THEN strip_asm_tac,
	t_thm,
	gen_fail_msg "STRIP_THM_THEN" 28003 ["⊢ T"])];
=TEX
$STRIP\-\_CONCL\_T$ has been tested in testing $strip\_tac$,
but for the record:
=SML
store_mt_results (mt_runf (op =#)) [("STRIP_CONCL_T",
	tac_res1 (STRIP_CONCL_T asm_tac),
	([],⌜(a ∧ b) ⇒ c⌝),
	([⌜a ∧ b⌝],⌜c : BOOL⌝))];
store_mt_results (mt_runf (op =#)) [("STRIP_T",
	tac_res1 (STRIP_T asm_tac),
	([],⌜(a ∧ b) ⇒ c⌝),
	([⌜a ∧ b⌝],⌜c : BOOL⌝))];
store_mt_results mt_run_fail [("STRIP_CONCL_T 28003",
	tac_fail (STRIP_CONCL_T asm_tac),
	([],⌜f x: BOOL⌝),
	gen_fail_msg "STRIP_CONCL_T" 28003 ["⌜f x⌝"])];
=TEX
=SML
store_mt_results mt_run [
	("concl_in_asms_tac",
	tac_solve concl_in_asms_tac,
	([⌜a:BOOL⌝,⌜b:BOOL⌝,⌜c:BOOL⌝],⌜b:BOOL⌝),
	true)
];
store_mt_results mt_run_fail [
	("concl_in_asms_tac 28002 a",
	tac_fail concl_in_asms_tac,
	([],⌜a:BOOL⌝),
	gen_fail_msg "concl_in_asms_tac" 28002 []),
	("concl_in_asms_tac 28002 b",
	tac_fail concl_in_asms_tac,
	([⌜b:BOOL⌝,⌜c:BOOL⌝],⌜a:BOOL⌝),
	gen_fail_msg "concl_in_asms_tac" 28002 [])
	];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("strip_concl_conv",
	snd o dest_eq o concl o strip_concl_conv,
	⌜¬ (a ∧ b)⌝,
	⌜¬ a ∨ ¬ b⌝),
	("strip_asm_conv",
	snd o dest_eq o concl o strip_asm_conv,
	⌜¬ (a ∧ b)⌝,
	⌜¬ a ∨ ¬ b⌝)];
=TEX
=SML
store_mt_results mt_run_fail [
	("strip_concl_conv 28003",
	strip_concl_conv,
	mk_t,
	gen_fail_msg "strip_concl_conv" 28003 ["⌜T⌝"]),
	("strip_asm_conv 28003",
	strip_asm_conv,
	mk_t,
	gen_fail_msg "strip_asm_conv" 28003 ["⌜T⌝"])
	];	
=TEX

\subsection{Concerning $T$}
=SML
store_mt_results mt_run [
	("t_tac",
	tac_solve t_tac,
	([⌜a:BOOL⌝,⌜b:BOOL⌝,⌜c:BOOL⌝],⌜T⌝),
	true)
];
store_mt_results mt_run_fail [
	("t_tac 28011",
	tac_fail t_tac,
	([],⌜a:BOOL⌝),
	gen_fail_msg "t_tac" 28011 [])];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [("⇔_t_tac 1",
	tac_res ⇔_t_tac,
	⌜T ⇔ a⌝,
	⌜a:BOOL⌝),
	("⇔_t_tac 2",
	tac_res ⇔_t_tac,
	⌜a ⇔ T⌝,
	⌜a:BOOL⌝)];
store_mt_results mt_run_fail [
	("⇔_t_tac 28012",
	tac_fail ⇔_t_tac,
	([],⌜a:BOOL⌝),
	gen_fail_msg "⇔_t_tac" 28012 [])];
=TEX
\subsection{Concerning $F$}
=SML
store_mt_results (mt_runf (op =#)) [("i_contr_tac",
	tac_res1 i_contr_tac,
	([⌜a:BOOL⌝,⌜¬ a:BOOL⌝],⌜c:BOOL⌝),
	([⌜a:BOOL⌝,⌜¬ a:BOOL⌝],⌜F:BOOL⌝))];
store_mt_results (mt_runf (op =#)) [("f_thm_tac",
	tac_res1 (f_thm_tac (asm_rule mk_f)),
	([],⌜a:BOOL⌝),
	([],⌜F:BOOL⌝))];
store_mt_results mt_run_fail [("f_thm_tac 28021",
	tac_fail (f_thm_tac t_thm),
	([],⌜a:BOOL⌝),
	gen_fail_msg "f_thm_tac" 28021 ["⊢ T"])];
store_mt_results (mt_runf (op =#)) [("contr_tac",
	tac_res1 contr_tac ,
	([],⌜a ∨ b⌝),
	([⌜¬ b⌝,⌜¬ a⌝],⌜F⌝))];
store_mt_results (mt_runf (op =#)) [("CONTR_T",
	tac_res1 (CONTR_T asm_tac) ,
	([],⌜a ∨ b⌝),
	([⌜¬(a ∨ b)⌝],⌜F⌝))];
store_mt_results mt_run_fail [("contr_tac 28027",
	contr_tac,
	([],⌜a:'a⌝),
	gen_fail_msg "contr_tac" 28027 [])];
store_mt_results mt_run_fail [("CONTR_T 28027",
	CONTR_T asm_tac,
	([],⌜a:'a⌝),
	gen_fail_msg "CONTR_T" 28027 [])];
=TEX
\subsection{Concerning ¬}
=SML
store_mt_results (mt_runf (list_eq(op =#))) [("¬_tac",
	tac_ress (¬_tac mk_f) 2,
	([],⌜¬ (a ∧ b)⌝),
	[([⌜b:BOOL⌝,⌜a:BOOL⌝],⌜F⌝),([⌜b:BOOL⌝,⌜a:BOOL⌝],⌜¬ F⌝)])];
store_mt_results mt_run_fail [("¬_tac 28022",
	tac_fail (¬_tac ⌜a:'a⌝),
	([],⌜¬ T⌝),
	gen_fail_msg "¬_tac" 28022 ["⌜a⌝"]),
	("¬_tac 28023",
	tac_fail (¬_tac ⌜a:BOOL⌝),
	([],⌜T⌝),
	gen_fail_msg "¬_tac" 28023 [])];

store_mt_results (mt_runf (op =$)) [
	("simple_¬_in_tac 1",
	tac_res simple_¬_in_tac,
	⌜¬ ¬ a⌝,
	⌜a:BOOL⌝),
	("simple_¬_in_tac 2",
	tac_res simple_¬_in_tac,
	⌜¬ (a ∧ b)⌝,
	⌜(¬ a) ∨ (¬ b)⌝),
	("simple_¬_in_tac 3",
	tac_res simple_¬_in_tac,
	⌜¬ (a ∨ b)⌝,
	⌜(¬ a) ∧ (¬ b)⌝),
	("simple_¬_in_tac 4",
	tac_res simple_¬_in_tac,
	⌜¬ (a ⇒ b)⌝,
	⌜a ∧ ¬ b⌝),
	("simple_¬_in_tac 5",
	tac_res simple_¬_in_tac,
	⌜¬ (a ⇔ b)⌝,
	⌜(a ∧ ¬ b) ∨ (b ∧ ¬ a)⌝),
	("simple_¬_in_tac 6",
	tac_res simple_¬_in_tac,
	⌜¬ (∀ x ⦁ t)⌝,
	⌜∃ x ⦁ ¬ t⌝),
	("simple_¬_in_tac 7",
	tac_res simple_¬_in_tac,
	⌜¬ (∃ x ⦁ t)⌝,
	⌜∀ x ⦁ ¬ t⌝),
	("simple_¬_in_tac 8",
	tac_res simple_¬_in_tac,
	⌜¬ (∃⋎1 x ⦁ f x)⌝,
	⌜∀ x ⦁ ¬(f x ∧ ∀ x' ⦁ f x' ⇒ (x' = x))⌝),
	("simple_¬_in_tac 9",
	tac_res simple_¬_in_tac,
	⌜¬ T⌝,
	⌜F⌝)];
store_mt_results mt_run [
	("simple_¬_in_tac 10",
	tac_solve  simple_¬_in_tac,
	([],⌜¬ F⌝),
	true)];
store_mt_results mt_run_fail [("simple_¬_in_tac 28025",
	tac_fail simple_¬_in_tac,
	([],⌜T⌝),
	gen_fail_msg "simple_¬_in_tac" 28025 [])];
=TEX
$SIMPLE\_¬\_IN\_THEN$ is implemented by $simple\_¬\_in\_conv$,
tested via its use in implementing
$simple\_¬\_in\_tac$, but for the record
=SML
store_mt_results (mt_runf (op =#)) [
	("SIMPLE_¬_IN_THEN",
	tac_res1 (SIMPLE_¬_IN_THEN asm_tac (asm_rule ⌜¬ ¬ a⌝)),
	([⌜¬ ¬ a⌝],⌜F⌝),
	([⌜a:BOOL⌝, ⌜¬ ¬ a⌝],⌜F⌝))];
store_mt_results mt_run_fail [("SIMPLE_¬_IN_THEN 28026",
	SIMPLE_¬_IN_THEN asm_tac,
	t_thm,
	gen_fail_msg "SIMPLE_¬_IN_THEN" 28026 [])];
=TEX
=SML
store_mt_results (mt_runf (list_eq(op =#))) [("¬_T",
	tac_ress (¬_T ⌜a:BOOL⌝ asm_tac) 2,
	([],⌜¬ b⌝),
	[([⌜b:BOOL⌝],⌜a:BOOL⌝),([⌜b:BOOL⌝],⌜¬ a⌝)])];
store_mt_results mt_run_fail [("¬_T 28022",
	tac_fail (¬_T ⌜a:'a⌝ asm_tac),
	([],⌜¬ F⌝),
	gen_fail_msg "¬_T" 28022 ["⌜a⌝"])];
store_mt_results mt_run_fail [("¬_T 28023",
	¬_T ⌜a:BOOL⌝ asm_tac,
	([],⌜a:'a⌝),
	gen_fail_msg "¬_T" 28023 [])];

=TEX
=SML
store_mt_results (mt_runf (list_eq(op =#))) [("¬_T2",
	tac_ress (¬_T2 ⌜a:BOOL⌝ asm_tac asm_tac) 2,
	([],⌜¬ b⌝),
	[([⌜b:BOOL⌝],⌜a:BOOL⌝),([⌜b:BOOL⌝],⌜¬ a⌝)])];
store_mt_results mt_run_fail [("¬_T2 28022",
	tac_fail (¬_T2 ⌜a:'a⌝ asm_tac asm_tac),
	([],⌜¬ F⌝),
	gen_fail_msg "¬_T2" 28022 ["⌜a⌝"])];
store_mt_results mt_run_fail [("¬_T2 28023",
	¬_T2 ⌜a:BOOL⌝ asm_tac asm_tac,
	([],⌜a:'a⌝),
	gen_fail_msg "¬_T2" 28023 [])];

=TEX
=SML
store_mt_results (mt_runf (list_eq(op =#))) [("¬_elim_tac",
	tac_ress (¬_elim_tac ⌜a:BOOL⌝) 2,
	([],⌜b:BOOL⌝),
	[([],⌜a:BOOL⌝),([],⌜¬ a⌝)])];
store_mt_results mt_run_fail [("¬_elim_tac 28022",
	¬_elim_tac,
	 ⌜a:'a⌝,
	gen_fail_msg "¬_elim_tac" 28022 ["⌜a⌝"])];

=TEX
\subsection{Concerning ∧}
=SML
store_mt_results (mt_runf (list_eq(op =#))) [("∧_tac",
	tac_ress ∧_tac 2,
	([],⌜T ∧ F⌝),
	[([],⌜T⌝),([],⌜F⌝)])];
store_mt_results mt_run_fail [("∧_tac 28031",
	tac_fail ∧_tac,
	([],⌜T⌝),
	gen_fail_msg "∧_tac" 28031 [])];
=TEX
=SML
store_mt_results mt_run [
	("∧_THEN",
	tac_solve (∧_THEN accept_tac (asm_rule ⌜a ∧ b⌝)),
	([⌜a ∧ b⌝],⌜a:BOOL⌝),
	true)];
store_mt_results mt_run_fail [("∧_THEN 28032",
	∧_THEN accept_tac,
	t_thm,
	gen_fail_msg "∧_THEN" 28032 ["⊢ T"])];

=TEX
=SML
store_mt_results mt_run [
	("∧_THEN2",
	tac_solve (∧_THEN2 accept_tac accept_tac (asm_rule ⌜a ∧ b⌝)),
	([⌜a ∧ b⌝],⌜a:BOOL⌝),
	true)];
store_mt_results mt_run_fail [("∧_THEN2 28032",
	∧_THEN2 accept_tac accept_tac,
	t_thm,
	gen_fail_msg "∧_THEN2" 28032 ["⊢ T"])];

=TEX
\subsection{Concerning ∨}
=SML
store_mt_results (mt_runf (op =$)) [("∨_left_tac",
	tac_res ∨_left_tac,
	⌜a ∨ b⌝,
	⌜a : BOOL⌝)];
store_mt_results mt_run_fail [("∨_left_tac 28041",
	tac_fail ∨_left_tac,
	([],⌜T⌝),
	gen_fail_msg "∨_left_tac" 28041 [])];

=TEX
=SML
store_mt_results (mt_runf (op =$)) [("∨_right_tac",
	tac_res ∨_right_tac,
	⌜a ∨ b⌝,
	⌜b : BOOL⌝)];
store_mt_results mt_run_fail [("∨_right_tac 28041",
	tac_fail ∨_right_tac,
	([],⌜T⌝),
	gen_fail_msg "∨_right_tac" 28041 [])];

=TEX
=SML
store_mt_results (mt_runf (op =$)) [("swap_∨_tac",
	tac_res swap_∨_tac,
	⌜a ∨ b⌝,
	⌜b ∨ a⌝)];
store_mt_results mt_run_fail [("swap_∨_tac 28041",
	tac_fail swap_∨_tac,
	([],⌜T⌝),
	gen_fail_msg "swap_∨_tac" 28041 [])];
=TEX
=SML
store_mt_results (mt_runf (list_eq(op =#))) [
	("∨_THEN",
	tac_ress (∨_THEN asm_tac (asm_rule ⌜a ∨ b⌝)) 2,
	([⌜a ∨ b⌝],⌜a:BOOL⌝),
	[([⌜a:BOOL⌝,⌜a ∨ b⌝],⌜a:BOOL⌝),([⌜b:BOOL⌝,⌜a ∨ b⌝],⌜a:BOOL⌝)])];
store_mt_results mt_run_fail [("∨_THEN 28042",
	∨_THEN accept_tac,
	t_thm,
	gen_fail_msg "∨_THEN" 28042 ["⊢ T"])];
=TEX
=SML
store_mt_results (mt_runf (list_eq(op =#))) [
	("∨_THEN2",
	tac_ress (∨_THEN2 asm_tac asm_tac (asm_rule ⌜a ∨ b⌝)) 2,
	([⌜a ∨ b⌝],⌜a:BOOL⌝),
	[([⌜a:BOOL⌝,⌜a ∨ b⌝],⌜a:BOOL⌝),([⌜b:BOOL⌝,⌜a ∨ b⌝],⌜a:BOOL⌝)])];
store_mt_results mt_run_fail [("∨_THEN2 28042",
	∨_THEN2 accept_tac accept_tac,
	t_thm,
	gen_fail_msg "∨_THEN2" 28042 ["⊢ T"])];
=TEX
=SML
store_mt_results (mt_runf (op =#)) [("cases_tac",
	tac_res1 (cases_tac ⌜a:BOOL⌝),
	([],⌜a:BOOL⌝),
	([⌜¬ a⌝],⌜a:BOOL⌝))];
store_mt_results mt_run_fail [("cases_tac 28022",
	tac_fail (cases_tac ⌜a:'a⌝),
	([],⌜T⌝),
	gen_fail_msg "cases_tac" 28022 ["⌜a⌝"])];
=TEX
=SML
store_mt_results (mt_runf (op =#)) [("CASES_T",
	tac_res1 (CASES_T  ⌜a:BOOL⌝ strip_asm_tac),
	([],⌜a:BOOL⌝),
	([⌜¬ a⌝],⌜a:BOOL⌝))];
store_mt_results mt_run_fail [("CASES_T 28022",
	tac_fail (CASES_T ⌜a:'a⌝ strip_asm_tac),
	([],⌜T⌝),
	gen_fail_msg "CASES_T" 28022 ["⌜a⌝"])];
=TEX
=SML
store_mt_results (mt_runf (op =#)) [("CASES_T2",
	tac_res1 (CASES_T2  ⌜a:BOOL⌝ strip_asm_tac strip_asm_tac),
	([],⌜a:BOOL⌝),
	([⌜¬ a⌝],⌜a:BOOL⌝))];
store_mt_results mt_run_fail [("CASES_T2 28022",
	tac_fail (CASES_T2 ⌜a:'a⌝ strip_asm_tac strip_asm_tac),
	([],⌜T⌝),
	gen_fail_msg "CASES_T2" 28022 ["⌜a⌝"])];
=TEX
\subsection{Concerning ⇒}
=SML
store_mt_results mt_run [
	("⇒_tac",
	tac_solve ⇒_tac,
	([],⌜a ⇒ a⌝),
	true)];
store_mt_results mt_run_fail [("⇒_tac 28051",
	tac_fail ⇒_tac,
	([],⌜T⌝),
	gen_fail_msg "⇒_tac" 28051 [])];
=TEX
=SML
store_mt_results mt_run [
	("⇒_T",
	tac_solve (⇒_T strip_asm_tac),
	([],⌜a ⇒ a⌝),
	true)];
store_mt_results mt_run_fail [("⇒_T 28051",
	tac_fail (⇒_T strip_asm_tac),
	([],⌜T⌝),
	gen_fail_msg "⇒_T" 28051 [])];
=TEX
=SML
store_mt_results (mt_runf (op =#)) [("⇒_THEN",
	tac_res1 (⇒_THEN asm_tac (asm_rule ⌜a ⇒ b⌝)),
	([⌜a ⇒ b⌝],⌜b:BOOL⌝),
	([⌜¬ a ∨ b⌝,⌜a ⇒ b⌝],⌜b:BOOL⌝))];
store_mt_results mt_run_fail [("⇒_THEN 28054",
	⇒_THEN asm_tac,
	t_thm,
	gen_fail_msg "⇒_THEN" 28054 ["⊢ T"])];

=TEX
=SML
store_mt_results (mt_runf (op =#)) [("asm_ante_tac",
	tac_res1 (asm_ante_tac ⌜a:BOOL⌝),
	([⌜a:BOOL⌝],⌜b:BOOL⌝),
	([],⌜a ⇒ b⌝))];
store_mt_results mt_run_fail [("asm_ante_tac 28052",
	tac_fail (asm_ante_tac ⌜a:BOOL⌝),
	([],⌜b:BOOL⌝),
	gen_fail_msg "asm_ante_tac" 28052 ["⌜a⌝"])];
store_mt_results mt_run_fail [("asm_ante_tac 28055",
	(asm_ante_tac ⌜a:'a⌝),
	([⌜a:'a⌝],⌜b:BOOL⌝),
	gen_fail_msg "asm_ante_tac" 28055 [])];
=TEX
=SML
store_mt_results (mt_runf (list_eq(op =#)))[("list_asm_ante_tac 1",
	fst o list_asm_ante_tac [⌜a:BOOL⌝,⌜a:BOOL⌝,⌜∀ x ⦁ x⌝, ⌜∀ y ⦁ y⌝],
	([⌜a:BOOL⌝,⌜∀ x ⦁ x⌝, ⌜∀ y ⦁ y⌝],⌜b:BOOL⌝),
	[([],⌜a ⇒ (∀ y ⦁ y) ⇒ b⌝)])];
store_mt_results (mt_runf (op =#)) [("list_asm_ante_tac 2",
	tac_res1 (list_asm_ante_tac [⌜a:BOOL⌝]),
	([⌜a:BOOL⌝],⌜b:BOOL⌝),
	([],⌜a ⇒ b⌝))];
store_mt_results mt_run_fail [("list_asm_ante_tac 28052",
	tac_fail (list_asm_ante_tac [⌜a:BOOL⌝]),
	([],⌜b:BOOL⌝),
	gen_fail_msg "list_asm_ante_tac" 28052 ["⌜a⌝"])];
store_mt_results mt_run_fail [("list_asm_ante_tac 28055",
	(list_asm_ante_tac [⌜a:'a⌝]),
	([⌜a:'a⌝],⌜b:BOOL⌝),
	gen_fail_msg "list_asm_ante_tac" 28055 [])];

=TEX
=SML
store_mt_results (mt_runf (list_eq(op =#))) [("all_asm_ante_tac 1",
	fst o all_asm_ante_tac,
	([⌜a:BOOL⌝,⌜a:BOOL⌝,⌜∀ x ⦁ x⌝, ⌜∀ y ⦁ y⌝],⌜b:BOOL⌝),
	[([],⌜(∀ x ⦁ x) ⇒ a ⇒ b⌝)])];
store_mt_results (mt_runf (op =#)) [("all_asm_ante_tac 2",
	tac_res1 all_asm_ante_tac,
	([⌜a:BOOL⌝],⌜b:BOOL⌝),
	([],⌜a ⇒ b⌝))];
store_mt_results mt_run_fail [("all_asm_ante_tac 28055",
	(all_asm_ante_tac),
	([⌜a:'a⌝],⌜b:BOOL⌝),
	gen_fail_msg "all_asm_ante_tac" 28055 [])];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [("ante_tac",
	tac_res (ante_tac t_thm),
	⌜b:BOOL⌝,
	⌜T ⇒ b⌝)];
store_mt_results mt_run_fail [("ante_tac 28027",
	(fst o ante_tac t_thm),
	([],⌜b:'b⌝),
	gen_fail_msg "ante_tac" 28027 [])];
=TEX
\subsection{Concerning ⇔}
=SML
store_mt_results (mt_runf (list_eq(op =#))) [("⇔_tac",
	tac_ress ⇔_tac 2,
	([],⌜(a ∧ b) ⇔ (b ∧ a)⌝),
	[([⌜b:BOOL⌝,⌜a:BOOL⌝],⌜b ∧ a⌝),([⌜a:BOOL⌝,⌜b:BOOL⌝],⌜a ∧ b⌝)])];
store_mt_results mt_run_fail [("⇔_tac 28061",
	tac_fail ⇔_tac,
	([],⌜T⌝),
	gen_fail_msg "⇔_tac" 28061 [])];
store_mt_results (mt_runf (list_eq(op =#))) [("⇔_T",
	tac_ress (⇔_T strip_asm_tac) 2,
	([],⌜(a ∧ b) ⇔ (b ∧ a)⌝),
	[([⌜b:BOOL⌝,⌜a:BOOL⌝],⌜b ∧ a⌝),([⌜a:BOOL⌝,⌜b:BOOL⌝],⌜a ∧ b⌝)])];
store_mt_results mt_run_fail [("⇔_T 28061",
	tac_fail (⇔_T strip_asm_tac),
	([],⌜T⌝),
	gen_fail_msg "⇔_T" 28061 [])];
store_mt_results (mt_runf (list_eq(op =#))) [("⇔_T2",
	tac_ress (⇔_T2 strip_asm_tac strip_asm_tac) 2,
	([],⌜(a ∧ b) ⇔ (b ∧ a)⌝),
	[([⌜b:BOOL⌝,⌜a:BOOL⌝],⌜b ∧ a⌝),([⌜a:BOOL⌝,⌜b:BOOL⌝],⌜a ∧ b⌝)])];
store_mt_results mt_run_fail [("⇔_T2 28061",
	tac_fail (⇔_T2 strip_asm_tac strip_asm_tac),
	([],⌜T⌝),
	gen_fail_msg "⇔_T2" 28061 [])];
store_mt_results (mt_runf (op =#)) [("⇔_THEN",
	tac_res1 (⇔_THEN asm_tac (asm_rule ⌜a ⇔ b⌝)),
	([⌜a ⇔ b⌝],⌜b:BOOL⌝),
	([⌜b ⇒ a⌝,⌜a ⇒ b⌝,⌜a ⇔ b⌝],⌜b:BOOL⌝))];
store_mt_results mt_run_fail [("⇔_THEN 28062",
	⇔_THEN asm_tac,
	t_thm,
	gen_fail_msg "⇔_THEN" 28062 ["⊢ T"])];
store_mt_results (mt_runf (op =#)) [("⇔_THEN2",
	tac_res1 (⇔_THEN2 asm_tac asm_tac (asm_rule ⌜a ⇔ b⌝)),
	([⌜a ⇔ b⌝],⌜b:BOOL⌝),
	([⌜b ⇒ a⌝,⌜a ⇒ b⌝,⌜a ⇔ b⌝],⌜b:BOOL⌝))];
store_mt_results mt_run_fail [("⇔_THEN2 28062",
	⇔_THEN2 asm_tac asm_tac,
	t_thm,
	gen_fail_msg "⇔_THEN2" 28062 ["⊢ T"])];
=TEX
\subsection{Concerning $if\ldots then\ldots else \ldots$}
=SML
store_mt_results (mt_runf (list_eq(op =#))) [("if_tac",
	tac_ress if_tac 2,
	([],⌜if p then q else r:BOOL⌝),
	[([⌜p:BOOL⌝],⌜q:BOOL⌝),([⌜¬ p⌝],⌜r:BOOL⌝)])];
store_mt_results mt_run_fail [("if_tac 28071",
	tac_fail if_tac,
	([],⌜T⌝),
	gen_fail_msg "if_tac" 28071 [])];
store_mt_results (mt_runf (list_eq(op =#))) [("IF_T",
	tac_ress (IF_T asm_tac)2,
	([],⌜if p then q else r:BOOL⌝),
	[([⌜p:BOOL⌝],⌜q:BOOL⌝),([⌜¬ p⌝],⌜r:BOOL⌝)])];
store_mt_results mt_run_fail [("IF_T 28071",
	tac_fail (IF_T asm_tac),
	([],⌜T⌝),
	gen_fail_msg "IF_T" 28071 [])];
store_mt_results (mt_runf (list_eq(op =#))) [("IF_T2",
	tac_ress (IF_T2 asm_tac asm_tac)2,
	([],⌜if p then q else r:BOOL⌝),
	[([⌜p:BOOL⌝],⌜q:BOOL⌝),([⌜¬ p⌝],⌜r:BOOL⌝)])];
store_mt_results mt_run_fail [("IF_T2 28071",
	tac_fail (IF_T2 asm_tac asm_tac),
	([],⌜T⌝),
	gen_fail_msg "IF_T2" 28071 [])];
=TEX
=SML
store_mt_results (mt_runf (op =#)) [("IF_THEN",
	tac_res1 (IF_THEN (ante_tac o undisch_rule) (asm_rule ⌜if p then q else r:BOOL⌝)),
	([⌜if p then q else r:BOOL⌝,⌜p:BOOL⌝,⌜¬ p⌝],⌜b:BOOL⌝),
	([⌜if p then q else r:BOOL⌝,⌜p:BOOL⌝,⌜¬ p⌝],
		⌜r ⇒ q ⇒ b⌝))];
store_mt_results mt_run_fail [("IF_THEN 7012",
	IF_THEN ante_tac,
	t_thm,
	gen_fail_msg "IF_THEN" 7012 ["⊢ T"])];
store_mt_results (mt_runf (op =#)) [("IF_THEN2",
	tac_res1 (IF_THEN2 (ante_tac o undisch_rule) (ante_tac o undisch_rule)
		 (asm_rule ⌜if p then q else r:BOOL⌝)),
	([⌜if p then q else r:BOOL⌝,⌜p:BOOL⌝,⌜¬ p⌝],⌜b:BOOL⌝),
	([⌜if p then q else r:BOOL⌝,⌜p:BOOL⌝,⌜¬ p⌝],
		⌜r ⇒ q ⇒ b⌝))];
store_mt_results mt_run_fail [("IF_THEN2 7012",
	IF_THEN2 ante_tac ante_tac,
	t_thm,
	gen_fail_msg "IF_THEN2" 7012 ["⊢ T"])];
=TEX
=SML
store_mt_results mt_run [("IF_CASES_T 1",
	tac_ress (IF_CASES_T ante_tac) 2,
	([],⌜if x > 0 then T else F⌝),
	[([], ⌜x > 0 ⇒ (if x > 0 then T else F)⌝),
	 ([], ⌜¬ x > 0 ⇒ (if x > 0 then T else F)⌝)])];
=TEX

=SML
store_mt_results mt_run [("IF_CASES_T 2",
	tac_ress (IF_CASES_T ante_tac) 2,
	([],⌜if if x > 0 then T else F then F else T⌝),
	[([], ⌜x > 0 ⇒ (if if x > 0 then T else F then F else T)⌝),
	 ([], ⌜¬ x > 0 ⇒ (if if x > 0 then T else F then F else T)⌝)])];
=TEX
=SML
store_mt_results mt_run [("IF_CASES_T 3",
	tac_ress (IF_CASES_T ante_tac) 4,
	([],⌜if x > 0 then T else if y > 1 then F else T⌝),
	[([], ⌜x > 0 ⇒ y > 1 ⇒ (if x > 0 then T else if y > 1 then F else T)⌝),
	 ([], ⌜¬ x > 0 ⇒ y > 1 ⇒ (if x > 0 then T else if y > 1 then F else T)⌝),
	 ([], ⌜x > 0 ⇒ ¬ y > 1 ⇒ (if x > 0 then T else if y > 1 then F else T)⌝),
	 ([], ⌜¬ x > 0 ⇒ ¬ y > 1 ⇒ (if x > 0 then T else if y > 1 then F else T)⌝)])];
=TEX
=SML
store_mt_results mt_run [("if_cases_tac 1",
	tac_ress if_cases_tac 2,
	([],⌜if x > 0 then T else F⌝),
	[([⌜x > 0⌝], ⌜if x > 0 then T else F⌝),
	 ([⌜¬ x > 0⌝], ⌜if x > 0 then T else F⌝)])];
=TEX
=SML
store_mt_results mt_run_fail [("IF_CASES_T 28072",
	tac_fail (IF_CASES_T ante_tac),
	([],⌜∀x⦁ if x > 0 then T else F⌝),
	gen_fail_msg "IF_CASES_T" 28072 [])];
store_mt_results mt_run_fail [("if_cases_tac 28072",
	tac_fail if_cases_tac,
	([],⌜T⌝),
	gen_fail_msg "if_cases_tac" 28072 [])];
=TEX
\subsection{Concerning ∀}
=SML
store_mt_results (mt_runf (op =$)) [("simple_∀_tac 1",
	tac_res simple_∀_tac,
	⌜∀ x ⦁ f x⌝,
	⌜f x : BOOL⌝)];
store_mt_results (mt_runf (op =#)) [("simple_∀_tac 2",
	tac_res1 simple_∀_tac,
	([⌜x : BOOL⌝],⌜∀ x :BOOL⦁ f x⌝),
	([⌜x : BOOL⌝],⌜f (x':BOOL):BOOL⌝))];
store_mt_results (mt_runf (op =#)) [("intro_∀_tac 1",
	tac_res1 (intro_∀_tac (⌜x:BOOL⌝, ⌜y:BOOL⌝)),
	([⌜x : BOOL⌝],⌜(f:BOOL→BOOL) x⌝),
	([⌜x : BOOL⌝],⌜∀y:BOOL⦁f y⌝))];
store_mt_results mt_run  [("intro_∀_tac 2",
	tac_solve (intro_∀_tac (⌜∃(x:'a)⦁F⌝, ⌜b:BOOL⌝) THEN
			accept_tac bool_cases_axiom),
	([],⌜((∃(x:'a)⦁F) ⇔ T) ∨ ((∃(x:'a)⦁F) ⇔ F)⌝),
	true)];
store_mt_results (mt_runf (op =#)) [("intro_∀_tac1 1",
	tac_res1 (intro_∀_tac1 ⌜x:BOOL⌝),
	([⌜x : BOOL⌝],⌜(f:BOOL→BOOL) x⌝),
	([⌜x : BOOL⌝],⌜∀x:BOOL⦁f x⌝))];
store_mt_results mt_run_fail [("simple_∀_tac 28081",
	tac_fail simple_∀_tac,
	([],⌜T⌝),
	gen_fail_msg "simple_∀_tac" 28081 [])];
store_mt_results mt_run_fail [("intro_∀_tac 28082",
	tac_fail (intro_∀_tac (⌜y:BOOL⌝, ⌜x:BOOL⌝)),
	([],⌜T⌝),
	gen_fail_msg "intro_∀_tac" 28082 [string_of_term ⌜y:BOOL⌝])];
store_mt_results mt_run_fail [("intro_∀_tac 28083",
	tac_fail (intro_∀_tac (⌜b:BOOL⌝,⌜a:BOOL⌝)),
	([],⌜a ∧ b⌝),
	gen_fail_msg "intro_∀_tac" 28083 ["⌜a⌝","⌜b⌝"])];
=TEX
\subsection{Concerning ∃}
=SML
store_mt_results (mt_runf (op =$)) [("simple_∃_tac",
	tac_res (simple_∃_tac ⌜a:'a⌝),
	⌜∃ x :'a ⦁ x = a⌝,
	⌜(a:'a) = a⌝)];
store_mt_results mt_run_fail [("simple_∃_tac 28091",
	tac_fail (simple_∃_tac ⌜a:'a⌝),
	([],⌜T⌝),
	gen_fail_msg "simple_∃_tac" 28091 []),
	("simple_∃_tac 28092",
	tac_fail (simple_∃_tac ⌜a:'a⌝),
	([],⌜∃ x ⦁ x⌝),
	gen_fail_msg "simple_∃_tac" 28092 ["⌜a⌝"])];
=TEX
=SML
store_mt_results (mt_runf (op =#)) [("SIMPLE_∃_THEN 1",
	tac_res1 (SIMPLE_∃_THEN asm_tac (asm_rule ⌜∃ x:'a ⦁ x = x⌝)),
	([⌜∃ x:'a ⦁ x = x⌝],⌜T⌝),
	([⌜(x:'a) = x⌝,⌜∃ x:'a ⦁ x = x⌝],⌜T⌝)),
	("SIMPLE_∃_THEN 2",
	tac_res1 (SIMPLE_∃_THEN asm_tac (asm_rule ⌜∃ x:'a ⦁ x = x⌝)),
	([⌜∃ x:'a ⦁ x = x⌝,⌜f(x:'a):BOOL⌝],⌜T⌝),
	([⌜(x':'a) = x'⌝,⌜∃ x:'a ⦁ x = x⌝,⌜f(x:'a):BOOL⌝],⌜T⌝))];
store_mt_results mt_run_fail [("SIMPLE_∃_THEN 28093",
	SIMPLE_∃_THEN asm_tac,
	t_thm,
	gen_fail_msg "SIMPLE_∃_THEN" 28093 ["⊢ T"])];
store_mt_results mt_run_fail [("SIMPLE_∃_THEN 28094",
	snd (SIMPLE_∃_THEN (fn _ => fn _ => ([],fn _ => refl_conv ⌜x⌝))
		(asm_rule ⌜∃ x:'a ⦁ x = x⌝)
		([],mk_t)),
	[],
	gen_fail_msg "SIMPLE_∃_THEN" 28094 ["⌜x⌝","⊢ x = x","⌜x⌝"])];
=TEX
\subsection{Concerning ∃$_1$}
=SML
store_mt_results (mt_runf (list_eq(op =#))) [("simple_∃⋎1_tac 1",
	tac_ress (simple_∃⋎1_tac ⌜a:'a⌝) 2,
	([],⌜∃⋎1 x :'a ⦁ x = a⌝),
	[([],⌜(a:'a) = a⌝),
	 ([],⌜∀ x ⦁ (x = a) ⇒ (x = a)⌝)]),
	("simple_∃⋎1_tac 2",
	tac_ress (simple_∃⋎1_tac ⌜x:'a⌝) 2,
	([],⌜∃⋎1 x :'a ⦁ x = a⌝),
	[([],⌜(x:'a) = a⌝),
	 ([],⌜∀ x' ⦁ (x' = a) ⇒ (x' = x)⌝)])];
store_mt_results mt_run_fail [("simple_∃⋎1_tac 28101",
	tac_fail (simple_∃⋎1_tac ⌜a:'a⌝),
	([],⌜T⌝),
	gen_fail_msg "simple_∃⋎1_tac" 28101 []),
	("simple_∃⋎1_tac 28092",
	tac_fail (simple_∃⋎1_tac ⌜a:'a⌝),
	([],⌜∃⋎1 x :BOOL ⦁ x⌝),
	gen_fail_msg "simple_∃⋎1_tac" 28092 ["⌜a⌝"])];
=TEX
=SML
store_mt_results (mt_runf (op =#)) [("SIMPLE_∃⋎1_THEN 1",
	tac_res1 (SIMPLE_∃⋎1_THEN asm_tac (asm_rule ⌜∃⋎1 x:'a ⦁ x = x⌝)),
	([⌜∃⋎1 x:'a ⦁ x = x⌝],⌜T⌝),
	([⌜(x = x) ∧ ∀ x':'a ⦁ (x' = x') ⇒ (x' = x)⌝,⌜∃⋎1 x:'a ⦁ x = x⌝],⌜T⌝)),
	("SIMPLE_∃⋎1_THEN 2",
	tac_res1 (SIMPLE_∃⋎1_THEN asm_tac (asm_rule ⌜∃⋎1 x:'a ⦁ x = x⌝)),
	([⌜∃⋎1 x:'a ⦁ x = x⌝,⌜f(x:'a):BOOL⌝],⌜T⌝),
	([⌜(x' = x') ∧ ∀ x'':'a ⦁ (x'' = x'') ⇒ (x'' = x')⌝,
		⌜∃⋎1 x:'a ⦁ x = x⌝,⌜f(x:'a):BOOL⌝],⌜T⌝))];
store_mt_results mt_run_fail [("SIMPLE_∃⋎1_THEN 28102",
	SIMPLE_∃⋎1_THEN asm_tac,
	t_thm,
	gen_fail_msg "SIMPLE_∃⋎1_THEN" 28102 ["⊢ T"])];
=TEX
\subsection{Concerning Assumptions}
=SML
store_mt_results (mt_runf (op =#)) [
	("swap_asm_concl_tac",
	tac_res1 (swap_asm_concl_tac ⌜b ∧ c⌝),
	([⌜a ∧ b⌝, ⌜b ∧ c⌝, ⌜c ∧ d⌝], ⌜a ∧ d⌝),
	([⌜¬ a⌝, ⌜a ∧ b⌝, ⌜c ∧ d⌝], ⌜¬(b ∧ c)⌝))
	];
store_mt_results (mt_runf (op =#)) [
	("swap_nth_asm_concl_tac",
	tac_res1 (swap_nth_asm_concl_tac 2),
	([⌜a ∧ b⌝, ⌜b ∧ c⌝, ⌜c ∧ d⌝], ⌜a ∧ d⌝),
	([⌜¬ a⌝, ⌜a ∧ b⌝, ⌜c ∧ d⌝], ⌜¬(b ∧ c)⌝))
	];
store_mt_results (mt_runf (op =#)) [
	("list_swap_asm_concl_tac",
	tac_res1 (list_swap_asm_concl_tac [⌜b ∧ c⌝,⌜a ∧ b⌝]),
	([⌜a ∧ b⌝, ⌜b ∧ c⌝, ⌜c ∧ d⌝], ⌜a ∧ d⌝),
	([⌜¬ a⌝, ⌜c ∧ d⌝], ⌜¬(b ∧ c) ∨ ¬ (a ∧ b)⌝))
	];
store_mt_results (mt_runf (op =#)) [
	("list_swap_nth_asm_concl_tac",
	tac_res1 (list_swap_nth_asm_concl_tac [2,1]),
	([⌜a ∧ b⌝, ⌜b ∧ c⌝, ⌜c ∧ d⌝], ⌜a ∧ d⌝),
	([⌜¬ a⌝, ⌜c ∧ d⌝], ⌜¬(b ∧ c) ∨ ¬ (a ∧ b)⌝))
	];
=TEX
=SML
store_mt_results (mt_runf (op =#)) [
	("SWAP_ASM_CONCL_T",
	tac_res1 (SWAP_ASM_CONCL_T ⌜b ∧ c⌝ asm_tac),
	([⌜a ∧ b⌝, ⌜b ∧ c⌝, ⌜c ∧ d⌝], ⌜a ∧ d⌝),
	([⌜¬ (a ∧ d)⌝, ⌜a ∧ b⌝, ⌜c ∧ d⌝], ⌜¬(b ∧ c)⌝))
	];
store_mt_results (mt_runf (op =#)) [
	("SWAP_NTH_ASM_CONCL_T",
	tac_res1 (SWAP_NTH_ASM_CONCL_T 2 asm_tac),
	([⌜a ∧ b⌝, ⌜b ∧ c⌝, ⌜c ∧ d⌝], ⌜a ∧ d⌝),
	([⌜¬ (a ∧ d)⌝, ⌜a ∧ b⌝, ⌜c ∧ d⌝], ⌜¬(b ∧ c)⌝))
	];
store_mt_results (mt_runf (op =#)) [
	("LIST_SWAP_ASM_CONCL_T",
	tac_res1 (LIST_SWAP_ASM_CONCL_T [⌜b ∧ c⌝,⌜a ∧ b⌝] asm_tac),
	([⌜a ∧ b⌝, ⌜b ∧ c⌝, ⌜c ∧ d⌝], ⌜a ∧ d⌝),
	([⌜¬ (a ∧ d)⌝, ⌜c ∧ d⌝], ⌜¬(b ∧ c) ∨ ¬ (a ∧ b)⌝))
	];
store_mt_results (mt_runf (op =#)) [
	("LIST_SWAP_NTH_ASM_CONCL_T",
	tac_res1 (LIST_SWAP_NTH_ASM_CONCL_T [2,1] asm_tac),
	([⌜a ∧ b⌝, ⌜b ∧ c⌝, ⌜c ∧ d⌝], ⌜a ∧ d⌝),
	([⌜¬ (a ∧ d)⌝, ⌜c ∧ d⌝], ⌜¬(b ∧ c) ∨ ¬ (a ∧ b)⌝))
	];
=TEX
=SML
store_mt_results mt_run_fail [
	("swap_asm_concl_tac 28052 a",
	tac_fail (swap_asm_concl_tac ⌜a:'a⌝),
	([],mk_t),
	gen_fail_msg "swap_asm_concl_tac" 28052 ["⌜a⌝"]),
	("swap_asm_concl_tac 28052",
	tac_fail (swap_asm_concl_tac mk_t),
	([],mk_t),
	gen_fail_msg "swap_asm_concl_tac" 28052 ["⌜T⌝"])];
store_mt_results mt_run_fail [
	("swap_nth_asm_concl_tac 9303",
	tac_fail (swap_nth_asm_concl_tac 1),
	([],mk_t),
	gen_fail_msg "swap_nth_asm_concl_tac" 9303 ["1"])];
store_mt_results mt_run_fail [
	("list_swap_asm_concl_tac 28052 a",
	tac_fail (list_swap_asm_concl_tac[ ⌜a:'a⌝]),
	([],mk_t),
	gen_fail_msg "list_swap_asm_concl_tac" 28052 ["⌜a⌝"]),
	("list_swap_asm_concl_tac 28052",
	tac_fail (list_swap_asm_concl_tac [mk_t]),
	([],mk_t),
	gen_fail_msg "list_swap_asm_concl_tac" 28052 ["⌜T⌝"])];
store_mt_results mt_run_fail [
	("list_swap_nth_asm_concl_tac 9303",
	tac_fail (list_swap_nth_asm_concl_tac [1]),
	([],mk_t),
	gen_fail_msg "list_swap_nth_asm_concl_tac" 9303 ["1"])];
=TEX
=SML
store_mt_results mt_run_fail [
	("SWAP_ASM_CONCL_T 28052 a",
	tac_fail (SWAP_ASM_CONCL_T ⌜a:'a⌝ asm_tac),
	([],mk_t),
	gen_fail_msg "SWAP_ASM_CONCL_T" 28052 ["⌜a⌝"]),
	("SWAP_ASM_CONCL_T 28052",
	tac_fail (SWAP_ASM_CONCL_T mk_t asm_tac),
	([],mk_t),
	gen_fail_msg "SWAP_ASM_CONCL_T" 28052 ["⌜T⌝"])];
store_mt_results mt_run_fail [
	("SWAP_NTH_ASM_CONCL_T 9303",
	tac_fail (SWAP_NTH_ASM_CONCL_T 1 asm_tac),
	([],mk_t),
	gen_fail_msg "SWAP_NTH_ASM_CONCL_T" 9303 ["1"])];
store_mt_results mt_run_fail [
	("LIST_SWAP_ASM_CONCL_T 28052 a",
	tac_fail (LIST_SWAP_ASM_CONCL_T[ ⌜a:'a⌝] asm_tac),
	([],mk_t),
	gen_fail_msg "LIST_SWAP_ASM_CONCL_T" 28052 ["⌜a⌝"]),
	("LIST_SWAP_ASM_CONCL_T 28052",
	tac_fail (LIST_SWAP_ASM_CONCL_T [mk_t] asm_tac),
	([],mk_t),
	gen_fail_msg "LIST_SWAP_ASM_CONCL_T" 28052 ["⌜T⌝"])];
store_mt_results mt_run_fail [
	("LIST_SWAP_NTH_ASM_CONCL_T 9303",
	tac_fail (LIST_SWAP_NTH_ASM_CONCL_T [1] asm_tac),
	([],mk_t),
	gen_fail_msg "LIST_SWAP_NTH_ASM_CONCL_T" 9303 ["1"])];
=TEX
\subsubsection{Equations in Assumptions}
=SML
val eqn_gl = ([⌜(x:'a) = y ∧ h x = h y⌝, ⌜(x:'a) = y⌝, ⌜ff ((p = (q:'a)) = xx):BOOL⌝,
	⌜∀ x y ⦁ y ⇔ x⌝,⌜f (r:'a) ∧ g (s:'a)⌝],mk_f);
store_mt_results (mt_runf (op =#)) [("eq_sym_asm_tac 1",
	tac_res1 (eq_sym_asm_tac ⌜(x:'a) = y ∧ h x = h y⌝),
	eqn_gl,
	([⌜(h y:'b) = h (x:'a)⌝,⌜(y:'a) = x⌝, ⌜(x:'a)  = y⌝,⌜ff ((p = (q:'a)) = xx):BOOL⌝,
		⌜∀ x y ⦁ y ⇔ x⌝,⌜f (r:'a) ∧ g (s:'a)⌝],mk_f)),
	("eq_sym_asm_tac 2",
	tac_res1 (eq_sym_asm_tac ⌜ff ((p = q) = xx):BOOL⌝),
	eqn_gl,
	([⌜ff (xx = ((p:'a) = q)):BOOL⌝,⌜(x:'a) = y ∧ h x = h y⌝,
		⌜(x:'a) = y⌝,⌜∀ x y ⦁ y ⇔ x⌝,⌜f (r:'a) ∧ g (s:'a)⌝],mk_f))
	];
store_mt_results mt_run_fail [("eq_sym_asm_tac 9301",
	tac_fail (eq_sym_asm_tac mk_t),
	eqn_gl,
	gen_fail_msg "eq_sym_asm_tac" 9301 [string_of_term mk_t]),
	("eq_sym_asm_tac 28053",
	tac_fail (eq_sym_asm_tac ⌜f (r:'a) ∧ g (s:'a)⌝),
	eqn_gl,
	gen_fail_msg "eq_sym_asm_tac" 28053 [string_of_term ⌜f r ∧ g s⌝])
	];
=TEX
=SML
store_mt_results (mt_runf (op =#)) [("eq_sym_nth_asm_tac 1",
	tac_res1 (eq_sym_nth_asm_tac 2),
	eqn_gl,
	([⌜(y:'a) = x⌝,⌜(x:'a) = y ∧ h x = h y⌝, ⌜ff (((p:'a) = q) = xx):BOOL⌝,
		⌜∀ x y ⦁ y ⇔ x⌝,⌜f (r:'a) ∧ g (s:'a)⌝],mk_f)),
("eq_sym_nth_asm_tac 2",
	tac_res1 (eq_sym_nth_asm_tac 4),
	eqn_gl,
	([⌜∀ x y ⦁ x ⇔ y⌝,⌜(x:'a) = y ∧ h x = h y⌝, ⌜(x:'a)  = y⌝,
		⌜ff (((p:'a) = q) = xx):BOOL⌝,⌜f (r:'a) ∧ g (s:'a)⌝],mk_f))
	];
store_mt_results mt_run_fail [("eq_sym_nth_asm_tac 9303",
	tac_fail (eq_sym_nth_asm_tac 6),
	eqn_gl,
	gen_fail_msg "eq_sym_nth_asm_tac" 9303 ["6"]),
	("eq_sym_nth_asm_tac 28053",
	tac_fail (eq_sym_nth_asm_tac 5),
	eqn_gl,
	gen_fail_msg "eq_sym_nth_asm_tac" 28053 [string_of_term ⌜f r ∧ g s⌝])
];
=TEX



\subsection{$lemma\_tac$}
=SML
store_mt_results (mt_runf (list_eq(op =#))) [("lemma_tac",
	tac_ress (lemma_tac ⌜f x : BOOL⌝) 2,
	([],⌜∃ y ⦁ f y⌝),
	[([],⌜f x : BOOL⌝),([⌜f x : BOOL⌝],⌜∃ y ⦁ f y⌝)])];
store_mt_results mt_run_fail [("lemma_tac 9603",
	tac_fail (lemma_tac ⌜a:'a⌝),
	([],⌜T⌝),
	gen_fail_msg "lemma_tac" 9603 ["⌜a⌝"])];

=TEX
\subsection{Tautology Prover}
=SML
store_mt_results mt_run [
	("simple_taut_tac 1",
	tac_solve simple_taut_tac,
	([],⌜T⌝),
	true),
	("simple_taut_tac 2",
	tac_solve simple_taut_tac,
	([],⌜(a ∧ b) ⇔ (b ∧ a)⌝),
	true),
	("simple_taut_tac 3",
	tac_solve simple_taut_tac,
	([],⌜a ∨ ¬ a⌝),
	true),
	("simple_taut_tac 4",
	tac_solve simple_taut_tac,
	([],⌜(if a then p else ¬ p) ⇒ (¬ p ⇒ ¬ a)⌝),
	true),
	("simple_taut_tac 5",
	tac_solve simple_taut_tac,
	([],⌜¬¬¬ F⌝),
	true)
];
store_mt_results mt_run_fail [("simple_taut_tac 28121 1",
	tac_fail simple_taut_tac,
	([],⌜F⌝),
	gen_fail_msg "simple_taut_tac" 28121 []),
	("simple_taut_tac 28121 2",
	tac_fail simple_taut_tac,
	([],⌜1 = 1⌝),
	gen_fail_msg "simple_taut_tac" 28121 []),
	("simple_taut_tac 28121 3",
	tac_fail simple_taut_tac,
	([],⌜∀ x ⦁ T⌝),
	gen_fail_msg "simple_taut_tac" 28121 [])];

store_mt_results mt_run_fail [("simple_taut_tac 28121 4",
	simple_taut_tac,
	([],⌜a:'a⌝),
	gen_fail_msg "simple_taut_tac" 28121 [])];
=TEX
\subsection{Automatic Proof Procedures}
=SML
store_mt_results (mt_runf (op =|-)) [(
	"prove_tac",
	tac_proof,
	(([],⌜¬ F⌝),prove_tac [f_thm]),
	f_thm)];
store_mt_results (mt_runf (op =$)) [(
	"prove_∃_tac",
	concl o tac_proof,
	(([],⌜∃ x: 'a ⦁ T⌝),prove_∃_tac),
	⌜∃ x: 'a ⦁ T⌝)];
=TEX
Now check that they do not rearrange order of assumptions:
=SML
store_mt_results (mt_runf (op =#)) [(
	"prove_tac 2",
	tac_res1 (prove_tac[]),
	([⌜a:BOOL⌝,⌜b:BOOL⌝],⌜c:BOOL⌝),
	([⌜a:BOOL⌝,⌜b:BOOL⌝],⌜c:BOOL⌝))];
store_mt_results (mt_runf (op =#)) [(
	"prove_∃_tac 2",
	tac_res1 (prove_∃_tac),
	([⌜a:BOOL⌝,⌜b:BOOL⌝],⌜∃x ⦁ c:BOOL⌝),
	([⌜a:BOOL⌝,⌜b:BOOL⌝],⌜c:BOOL⌝))];
=TEX
Then check their error cases:
=SML
open_theory"basic_hol" handle _ => open_theory "misc";
store_mt_results mt_run_fail [
	("prove_tac 51021",
	prove_tac,
	[],
	gen_fail_msg "prove_tac" 51021 ["tst028"])];
store_mt_results mt_run_fail [
	("prove_∃_tac 51021",
	prove_∃_tac,
	([],mk_t),
	gen_fail_msg "prove_∃_tac" 51021 ["tst028"])];
open_theory "tst028";
=TEX
\section{CONVERSIONS}
=SML
store_mt_results (mt_runf (op =$)) [
	("simple_¬_in_conv 1",
	snd o dest_eq o concl o simple_¬_in_conv,
	⌜¬¬¬¬ t⌝,
	⌜¬¬ t⌝),
	("simple_¬_in_conv 2",
	snd o dest_eq o concl o simple_¬_in_conv,
	⌜¬(a ∧ b)⌝,
	⌜¬ a ∨ ¬ b⌝),
	("simple_¬_in_conv 3",
	snd o dest_eq o concl o simple_¬_in_conv,
	⌜¬(a ∨ b)⌝,
	⌜¬ a ∧ ¬ b⌝),
	("simple_¬_in_conv 4",
	snd o dest_eq o concl o simple_¬_in_conv,
	⌜¬(a ⇒ b)⌝,
	⌜a ∧ ¬ b⌝),
	("simple_¬_in_conv 5",
	snd o dest_eq o concl o simple_¬_in_conv,
	⌜¬ (a ⇔ b)⌝,
	⌜(a ∧ ¬ b) ∨ (b ∧ ¬ a)⌝),
	("simple_¬_in_conv 6",
	snd o dest_eq o concl o simple_¬_in_conv,
	⌜¬(if a then p else q)⌝,
	⌜if a then ¬ p else ¬ q⌝),
	("simple_¬_in_conv 7",
	snd o dest_eq o concl o simple_¬_in_conv,
	⌜¬ (∀ x ⦁ f x)⌝,
	⌜∃ x ⦁ ¬ f x⌝),
	("simple_¬_in_conv 8",
	snd o dest_eq o concl o simple_¬_in_conv,
	⌜¬ ∃ x ⦁ f x⌝,
	⌜∀ x ⦁ ¬ f x⌝),
	("simple_¬_in_conv 9",
	snd o dest_eq o concl o simple_¬_in_conv,
	⌜¬∃⋎1x⦁f x⌝,
	⌜∀x⦁¬(f x ∧ ∀x'⦁f x' ⇒ x' = x)⌝),
	("simple_¬_in_conv 10",
	snd o dest_eq o concl o simple_¬_in_conv,
	⌜¬ F⌝,
	⌜T⌝),
	("simple_¬_in_conv 11",
	snd o dest_eq o concl o simple_¬_in_conv,
	⌜¬ T⌝,
	⌜F⌝)];
store_mt_results mt_run_fail [("simple_¬_in_conv 28131 a",
	simple_¬_in_conv,
	⌜T⌝,
	gen_fail_msg "simple_¬_in_conv" 28131 ["⌜T⌝"]),
	("simple_¬_in_conv 28131 b",
	simple_¬_in_conv,
	⌜¬ ∀ (x,y) ⦁ T⌝,
	gen_fail_msg "simple_¬_in_conv" 28131 ["⌜¬ (∀ (x, y)⦁ T)⌝"])];
=TEX
=SML
store_mt_results (mt_runf (op =#)) [("simple_∃⋎1_conv",
	dest_thm o simple_∃⋎1_conv,
	⌜∃⋎1 y ⦁ f y⌝,
	([],⌜(∃⋎1 y ⦁ f y) ⇔ (∃y⦁f y ∧ ∀x⦁f x ⇒ x = y)⌝))];
store_mt_results mt_run_fail [("simple_∃⋎1_conv 4019",
	simple_∃⋎1_conv,
	⌜T⌝,
	gen_fail_msg "simple_∃⋎1_conv" 4019 ["⌜T⌝"])];
=TEX
\subsection{END OF TESTS}
=SML
set_flag("subgoal_package_quiet",false);
diag_string(summarize_mt_results ());
=TEX
\end{document}
=IGN
***********COPY**************
store_mt_results mt_run [("",
	tac_res ,
	⌜⌝,
	⌜⌝)];
store_mt_results mt_run [("",
	tac_res1 ,
	([⌜⌝],⌜⌝),
	([⌜⌝],⌜⌝))];
store_mt_results mt_run [("",
	tac_ress  2,
	([⌜⌝],⌜⌝),
	[([⌜⌝],⌜⌝),([⌜⌝],⌜⌝)])];
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


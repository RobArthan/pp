=IGN
********************************************************************************
mdt045.doc: this file is part of the PPHol system

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

\def\Title{Module Tests for the General Purpose Theories}

\def\AbstractText{A set of module tests are given for the functions (conversions ,etc) associated with the general purpose theories. This document also checks that the theory designs have been met by the theory implementations.}

\def\Reference{DS/FMU/IED/MDT045}

\def\Author{K.Blackburn}


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
%% LaTeX2e port: \TPPtitle{Module Tests for the General Purpose Theories}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Module Tests for the \cr General Purpose Theories}
%% LaTeX2e port: \TPPref{DS/FMU/IED/MDT045}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.7 $ %
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2002/10/17 15:10:58 $ %
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{ML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.Blackburn & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{K.Blackburn & WIN01\\D.J.~King & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{A set of module tests are given for the
%% LaTeX2e port: functions (conversions ,etc) associated with the
%% LaTeX2e port: general purpose theories.
%% LaTeX2e port: This document also checks that the theory designs have been met by the theory implementations.}
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
\section{Document Control}
\subsection{Contents List}
\tableofcontents
\subsection{Document Cross References}
\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes History}
\begin{description}
\item [Issue 1.1 (1991/10/07)]
First draft version.

\item[Issue 1.2 (1992/01/20), \FormatDate{92/01/20} ] Updated to use new fonts.
\item [Issue 1.3 (1992/02/07)]
Added theories $hol$ and $hasic\_hol$.
\item [Issue 1.4 (1992/04/14) (14th April 1992)]
Changes required by CR0017.
\item [Issue 1.5 (1992/07/07) (7th July 1992)]
Greater support for reasoning about sum types.
\item [Issue 1.6 (1993/02/24) (24th February 1993)]
Added initial theory.
\item[Issue 1.7 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.8 (2002/10/17)] PPHol-specific updates for open source release
\end{description}
\subsection{Changes Forecast}
Additions, as required by the additions of functions
to \cite{DS/FMU/IED/DTD045}.
\section{GENERAL}
\subsection{Scope}
This document contains the module testing of the functions (conversions ,etc) associated with the
general purpose theories, required by \cite{DS/FMU/IED/DTD045}.
The design is in \cite{DS/FMU/IED/DTD045}
and it is
implemented in \cite{DS/FMU/IED/IMP045}.

\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains the module testing of the function material given a design in \cite{DS/FMU/IED/DTD045},
currently none,
following the test policy given in that document and the general policy given in \cite{DS/FMU/IED/PLN008}.
It then checks the theory implementation meets the theory
design.

\subsubsection{Dependencies}
The testing uses material from \cite{DS/FMU/IED/DTD013}.
This document is derived from the detailed design in \cite{DS/FMU/IED/DTD045},
and is further influenced by the implementation, in  \cite{DS/FMU/IED/IMP045}.
It also requires a theory check file, ``dtd045.tch'', created
by \[doc4thcheck\ dtd045\]
described in
\cite{DS/FMU/IED/DTD035}.

\subsubsection{Deficiencies}
None known.
\section{INITIALISATION}
Initialise the test package:
=SML
use_file "dtd013.sml";
use_file "imp013.sml";
init_mt_results();
open_theory "hol";
=TEX
\subsection{Testing Using Subgoal Package}
A function that tests the return of multiple goals for the case when a tactic causes multiple goals:
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
fun list_eq (eq:'a * 'a -> bool) ((a :: x), (b :: y)) : bool = (
	eq(a,b) andalso list_eq eq (x, y)
) | list_eq eq ([], []) = true
| list_eq _ _ = false;
=TEX

\section{TESTING FUNCTIONS OF THE DESIGN}
\subsection{Functions of Theory "sum"}
=SML
store_mt_results (mt_runf (op =#)) [
	("∀_sum_conv 1",
	dest_thm o ∀_sum_conv,
	⌜∀ y : BOOL + 'a ⦁ p y⌝,
	([],⌜(∀ y : BOOL + 'a ⦁ p y) ⇔
		(∀ y' ⦁ p(InL y')) ∧
		(∀ y'' ⦁ p(InR y''))⌝)),
	("∀_sum_conv 2",
	dest_thm o ∀_sum_conv,
	⌜∀ x : 'a + 'b ⦁ x = x'⌝,
	([],⌜(∀ x : 'a + 'b ⦁ x = x') ⇔
		(∀ x'' ⦁ InL x'' = x') ∧
		(∀ x''' ⦁ InR x''' = x')⌝))];
=TEX
=SML
store_mt_results mt_run_fail [
	("∀_sum_conv 45001",
	∀_sum_conv,
	mk_t,
	gen_fail_msg "∀_sum_conv" 45001 ["⌜T⌝"])];
=TEX
=SML
store_mt_results (mt_runf (list_eq(op =#))) [
	("sum_cases_tac 1",
	tac_ress (∀_tac THEN sum_cases_tac ⌜y:BOOL + 'a⌝) 2,
	([],⌜∀ y : BOOL + 'a ⦁ p y⌝),
	[([],⌜(p:BOOL + 'a → BOOL) (InL (y':BOOL))⌝),
	([],⌜(p:BOOL + 'a → BOOL) (InR (y'':'a))⌝)]),
	("sum_cases_tac 2",
	tac_ress (∀_tac THEN sum_cases_tac ⌜x:'a + 'b⌝) 2,
	([],⌜∀ x : 'a + 'b ⦁ x = x'⌝),
	[([],⌜InL x'' = (x' : 'a + 'b)⌝),
	([],⌜InR x''' = (x' : 'a + 'b)⌝)])
	];
=TEX
=SML
store_mt_results mt_run_fail [
	("sum_cases_tac 45002",
	tac_fail (sum_cases_tac mk_t),
	([],mk_t),
	gen_fail_msg "sum_cases_tac" 45002 ["⌜T⌝"]),
	("sum_cases_tac 38002",
	tac_fail (sum_cases_tac ⌜x:'a + 'b⌝),
	([],mk_t),
	gen_fail_msg "sum_cases_tac" 38002 ["⌜x⌝"]),
	("sum_cases_tac 38003",
	tac_fail (sum_cases_tac ⌜x:'a + 'b⌝),
	([⌜x:'a + 'b = x⌝],⌜x:'a + 'b = x⌝),
	gen_fail_msg "sum_cases_tac" 38003 ["⌜x⌝"])];
=TEX

\section{CHECK THE THEORY DESIGNS}
=SML
use_file "dtd045.tch";
store_mt_results mt_run[("theory design of basic_hol",
	Combinators.K basic_hol_success,
	(),
	true),
	("theory design of sum",
	Combinators.K sum_success,
	(),
	true),
	("theory design of combin",
	Combinators.K combin_success,
	(),
	true),
	("theory design of one",
	Combinators.K one_success,
	(),
	true),
	("theory design of hol",
	Combinators.K hol_success,
	(),
	true)];
=TEX
\section{END OF TESTS}
=SML
diag_string(summarize_mt_results());
=TEX
\end{document}




=IGN
********************************************************************************
mdt057.doc: this file is part of the PPHol system

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

\def\Title{Implementation of Computational Conversions}

\def\AbstractText{This document contains the module tests for the conversions which perform arithmetic computations on literals.}

\def\Reference{DS/FMU/IED/MDT057}

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
%% LaTeX2e port: % TQtemplate.tex
%% LaTeX2e port: \documentstyle[hol1,11pt,TQ]{article}
%% LaTeX2e port: \ftlinepenalty=9999
\def\Hide#1{}
%% LaTeX2e port: \def\Bool{``$\it{:}bool\,$''}
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{FST PROJECT}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Implementation of Computational Conversions}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/MDT057}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.10 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2002/10/17 15:10:58 $%
%% LaTeX2e port: }}  %% Mandatory field (with sensible default)
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{R.D.~Arthan & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.B.Jones & HAT Team Leader}
%% LaTeX2e port: \TPPabstract{This document contains the module tests for the conversions
%% LaTeX2e port: which perform arithmetic computations on literals.}
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
\bibliography{fmu}

\subsection{Changes History}  % to get section number `0.3'
\begin{description}
\item [Issue 1.2 (1992/03/06)\ (\FormatDate{91/10/16%
})]
First drafts.
\item [Issue 1.3 (1992/03/26) (26th March 1992)]
Changed to use proof context material of issue 1.13 of \cite{DS/FMU/IED/DTD051}.
\item [Issue 1.4 (1992/04/09) (9th April 1992)]
Changes required by CR0016.
\item [Issue 1.5 (1992/04/14) (14th April 1992)]
Changes required by CR0017.
\item [Issue 1.6 (1992/05/14) (14th May 1992)]
Tidying up proof contexts.
\item [Issue 1.7 (1992/05/21) (20th May 1992)]
Made proof context "comp" local.
\item [Issue 1.8 (1992/05/22) (22nd May 1992)]
Bug fixing.
\item[Issue 1.9 (1992/06/24) (24th June 1992)]
Renamings from issue 1.6 of \cite{DS/FMU/IED/WRK038},
mostly proof context name changes.
\item[Issue 1.10 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.11 (2002/10/17)] PPHol-specific updates for open source release
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
None.
\pagebreak
\section{GENERAL}
\subsection{Scope}
This document contains module tests for
the material whose detailed design is given in \cite{DS/FMU/IED/DTD057}.
\subsection{Introduction}
\subsubsection{Purpose and Background}
See \cite{DS/FMU/IED/DTD057}.
\subsubsection{Dependencies}
This document depends on the usual module test support defined
in \cite{DS/FMU/IED/DTD013,DS/FMU/IED/IMP013}.
\section{TEST CASES}
\begin{description}
\item[Group 1] This group tests the operation on valid data of
the numeric conversions.
\item[Group 2]  This group tests the operation on invalid data of
the numeric conversions.
\item[Group 3] This group tests the operation on valid data of
the character conversion.
\item[Group 4]  This group tests the operation on invalid data of
the character conversion.
\item[Group 5] This group tests the operation on valid data of
the string conversion.
\item[Group 6]  This group tests the operation on invalid data of
the string conversion.
\item[Group 7]  This group tests the operation of the proof context.
\item[Group 8]  This group tests the derived syntax functions on valid data.
\item[Group 9]  This group tests the derived syntax functions on invalid data.
\end{description}
\section{PROLOGUE}
Standard prologue:
=SML
use_file"dtd013.sml";
use_file"imp013.sml";
init_mt_results();
=TEX
=SML
infix 3 =**$;
fun (a,b) =**$ (c,d) = (a =$ c) andalso (b =$ d);
=TEX
Set up theory:
=SML
val ⦏side_effect⦎ = open_theory"basic_hol";
(push_pc "basic_hol1"
handle _ => (
let
val ⦏arith_eqn_cxt⦎ = [
	(⌜x + y⌝, plus_conv),
	(⌜x * y⌝, times_conv),
	(⌜x - y⌝, minus_conv),
	(⌜x Div y⌝, div_conv),
	(⌜x Mod y⌝, mod_conv),
	(⌜x ≤ y⌝, ≤_conv),
	(⌜x < y⌝, less_conv),
	(⌜x > y⌝, greater_conv),
	(⌜x ≥ y⌝, ≥_conv),
	(⌜x = y⌝, ℕ_eq_conv),
	(⌜x = y⌝, char_eq_conv),
	(⌜x = y⌝, string_eq_conv)];
val dummy = new_pc "comp";
val dummy = set_rw_eqn_cxt arith_eqn_cxt "comp";
val dummy = push_merge_pcs ["comp","'propositions","'simple_abstractions"]
in
()
end));
=TEX
\section{THE TESTS}
\subsection{Group 1}
=SML
store_mt_results
(mt_runf (op =#))[
	("57.1.a.1", dest_thm o ≤_conv, ⌜0 ≤ 0⌝, ([], ⌜0 ≤ 0 ⇔ T⌝)),
	("57.1.a.2", dest_thm o ≤_conv, ⌜10 ≤ 100⌝, ([], ⌜10 ≤ 100 ⇔ T⌝)),
	("57.1.a.3", dest_thm o ≤_conv, ⌜1 ≤ 0⌝, ([], ⌜1 ≤ 0 ⇔ F⌝)),
	("57.1.a.4", dest_thm o ≤_conv, ⌜1001 ≤ 101⌝, ([], ⌜1001 ≤ 101 ⇔ F⌝)),

	("57.1.b.1", dest_thm o ≥_conv, ⌜0 ≥ 0⌝, ([], ⌜0 ≥ 0 ⇔ T⌝)),
	("57.1.b.2", dest_thm o ≥_conv, ⌜10 ≥ 100⌝, ([], ⌜10 ≥ 100 ⇔ F⌝)),
	("57.1.b.3", dest_thm o ≥_conv, ⌜0 ≥ 1⌝, ([], ⌜0 ≥ 1 ⇔ F⌝)),
	("57.1.b.4", dest_thm o ≥_conv, ⌜1001 ≥ 101⌝, ([], ⌜1001 ≥ 101 ⇔ T⌝))
];
=TEX
=SML
store_mt_results
(mt_runf (op =#))[
	("57.1.c.1", dest_thm o less_conv, ⌜0 < 0⌝, ([], ⌜0 < 0 ⇔ F⌝)),
	("57.1.c.2", dest_thm o less_conv, ⌜10 < 100⌝, ([], ⌜10 < 100 ⇔ T⌝)),
	("57.1.c.3", dest_thm o less_conv, ⌜0 < 1⌝, ([], ⌜0 < 1 ⇔ T⌝)),
	("57.1.c.4", dest_thm o less_conv, ⌜1001 < 101⌝, ([], ⌜1001 < 101 ⇔ F⌝)),

	("57.1.d.1", dest_thm o greater_conv, ⌜0 > 0⌝, ([], ⌜0 > 0 ⇔ F⌝)),
	("57.1.d.2", dest_thm o greater_conv, ⌜10 > 100⌝, ([], ⌜10 > 100 ⇔ F⌝)),
	("57.1.d.3", dest_thm o greater_conv, ⌜1 > 0⌝, ([], ⌜1 > 0 ⇔ T⌝)),
	("57.1.d.4", dest_thm o greater_conv, ⌜1001 > 101⌝, ([], ⌜1001 > 101 ⇔ T⌝))
];
=TEX
=SML
store_mt_results
(mt_runf (op =#))[
	("57.1.e.1", dest_thm o plus_conv, ⌜0 + 0⌝, ([], ⌜0 + 0 = 0⌝)),
	("57.1.e.2", dest_thm o plus_conv, ⌜999 + 0⌝, ([], ⌜999 + 0 = 999⌝)),
	("57.1.e.3", dest_thm o plus_conv, ⌜0 + 1⌝, ([], ⌜0 + 1 = 1⌝)),
	("57.1.e.4", dest_thm o plus_conv, ⌜1001 + 101⌝, ([], ⌜1001 + 101 = 1102⌝)),

	("57.1.f.1", dest_thm o minus_conv, ⌜0 - 0⌝, ([], ⌜0 - 0 = 0⌝)),
	("57.1.f.2", dest_thm o minus_conv, ⌜10 - 0⌝, ([], ⌜10 - 0 = 10⌝)),
	("57.1.f.3", dest_thm o minus_conv, ⌜1001 - 100⌝, ([], ⌜1001 - 100 = 901⌝)),
	("57.1.f.4", dest_thm o minus_conv, ⌜1001 - 1001⌝, ([], ⌜1001 - 1001 = 0⌝))
];
=SML
store_mt_results
(mt_runf (op =#))[
	("57.1.g.1", dest_thm o times_conv, ⌜0 * 0⌝, ([], ⌜0 * 0 = 0⌝)),
	("57.1.g.2", dest_thm o times_conv, ⌜999 * 0⌝, ([], ⌜999 * 0 = 0⌝)),
	("57.1.g.3", dest_thm o times_conv, ⌜0 * 1⌝, ([], ⌜0 * 1 = 0⌝)),
	("57.1.g.4", dest_thm o times_conv, ⌜1 * 1⌝, ([], ⌜1 * 1 = 1⌝)),
	("57.1.g.5", dest_thm o times_conv, ⌜1 * 0⌝, ([], ⌜1 * 0 = 0⌝)),
	("57.1.g.6", dest_thm o times_conv, ⌜0 * 77⌝, ([], ⌜0 * 77 = 0⌝)),
	("57.1.g.7", dest_thm o times_conv, ⌜77 * 1⌝, ([], ⌜77 * 1 = 77⌝)),
	("57.1.g.8", dest_thm o times_conv, ⌜1 * 77⌝, ([], ⌜1 * 77 = 77⌝)),
	("57.1.g.9", dest_thm o times_conv, ⌜77 * 0⌝, ([], ⌜77 * 0 = 0⌝)),
	("57.1.g.10", dest_thm o times_conv, ⌜1001 * 77⌝, ([], ⌜1001 * 77 = 77077⌝))
];
=SML
store_mt_results
(mt_runf (op =#))[
	("57.1.h.1", dest_thm o div_conv, ⌜0 Div 1⌝, ([], ⌜0 Div 1 = 0⌝)),
	("57.1.h.2", dest_thm o div_conv, ⌜777 Div 1⌝, ([], ⌜777 Div 1 = 777⌝)),
	("57.1.h.3", dest_thm o div_conv, ⌜777 Div 7⌝, ([], ⌜777 Div 7 = 111⌝)),
	("57.1.h.4", dest_thm o div_conv, ⌜778 Div 7⌝, ([], ⌜778 Div 7 = 111⌝)),
	("57.1.h.5", dest_thm o div_conv, ⌜779 Div 7⌝, ([], ⌜779 Div 7 = 111⌝)),
	("57.1.h.6", dest_thm o div_conv, ⌜780 Div 7⌝, ([], ⌜780 Div 7 = 111⌝)),
	("57.1.h.7", dest_thm o div_conv, ⌜781 Div 7⌝, ([], ⌜781 Div 7 = 111⌝)),
	("57.1.h.8", dest_thm o div_conv, ⌜782 Div 7⌝, ([], ⌜782 Div 7 = 111⌝)),
	("57.1.h.9", dest_thm o div_conv, ⌜783 Div 7⌝, ([], ⌜783 Div 7 = 111⌝)),
	("57.1.h.10", dest_thm o div_conv, ⌜784 Div 7⌝, ([], ⌜784 Div 7 = 112⌝)),

	("57.1.i.1", dest_thm o mod_conv, ⌜0 Mod 1⌝, ([], ⌜0 Mod 1 = 0⌝)),
	("57.1.i.2", dest_thm o mod_conv, ⌜777 Mod 1⌝, ([], ⌜777 Mod 1 = 0⌝)),
	("57.1.i.3", dest_thm o mod_conv, ⌜777 Mod 7⌝, ([], ⌜777 Mod 7 = 0⌝)),
	("57.1.i.4", dest_thm o mod_conv, ⌜778 Mod 7⌝, ([], ⌜778 Mod 7 = 1⌝)),
	("57.1.i.5", dest_thm o mod_conv, ⌜779 Mod 7⌝, ([], ⌜779 Mod 7 = 2⌝)),
	("57.1.i.6", dest_thm o mod_conv, ⌜780 Mod 7⌝, ([], ⌜780 Mod 7 = 3⌝)),
	("57.1.i.7", dest_thm o mod_conv, ⌜781 Mod 7⌝, ([], ⌜781 Mod 7 = 4⌝)),
	("57.1.i.8", dest_thm o mod_conv, ⌜782 Mod 7⌝, ([], ⌜782 Mod 7 = 5⌝)),
	("57.1.i.9", dest_thm o mod_conv, ⌜783 Mod 7⌝, ([], ⌜783 Mod 7 = 6⌝)),
	("57.1.i.10", dest_thm o mod_conv, ⌜784 Mod 7⌝, ([], ⌜784 Mod 7 = 0⌝))
];
=TEX
=SML
store_mt_results
(mt_runf (op =#))[
	("57.1.j.1", dest_thm o ℕ_eq_conv, ⌜0 = 0⌝, ([], ⌜0 = 0 ⇔ T⌝)),
	("57.1.j.2", dest_thm o ℕ_eq_conv, ⌜777 = 0⌝, ([], ⌜777 = 0 ⇔ F⌝)),
	("57.1.j.3", dest_thm o ℕ_eq_conv, ⌜0 = 777⌝, ([], ⌜0 = 777 ⇔ F⌝)),
	("57.1.j.4", dest_thm o ℕ_eq_conv, ⌜777 = 777⌝, ([], ⌜777 = 777 ⇔ T⌝))
];
=TEX
\subsection{Group 2}
It is convenient to have
a function to generate the test cases without having to
type in the term twice:
=SML
fun fail_case (tag : string) (conv : CONV) (area : string) (msg : int) (tm : TERM) = (
	(tag, dest_thm o conv, tm, gen_fail_msg area msg [string_of_term tm])
);
=TEX
=SML
store_mt_results
mt_run_fail [
	fail_case "57.2.a.1" ≤_conv "≤_conv" 57001 ⌜0 ≥ 0⌝,
	fail_case "57.2.a.2" ≤_conv "≤_conv" 57001 ⌜x ≤ 100⌝,

	fail_case "57.2.b.1" ≥_conv "≥_conv" 57002 ⌜0 ≤ 0⌝,
	fail_case "57.2.b.2" ≥_conv "≥_conv" 57002 ⌜x ≥ 100⌝
];
=TEX
=SML
store_mt_results
mt_run_fail [
	fail_case "57.2.c.1" less_conv "less_conv" 57005 ⌜0 > 0⌝,
	fail_case "57.2.c.2" less_conv "less_conv" 57005 ⌜x < 100⌝,

	fail_case "57.2.d.1" greater_conv "greater_conv" 57004 ⌜0 * 0⌝,
	fail_case "57.2.d.2" greater_conv "greater_conv" 57004 ⌜x < 100⌝
];
=TEX
=SML
store_mt_results
mt_run_fail [
	fail_case "57.2.e.1" plus_conv "plus_conv" 6085 ⌜0 * 0⌝,
	fail_case "57.2.e.2" plus_conv "plus_conv" 6085 ⌜x + 100⌝,

	fail_case "57.2.f.1" minus_conv "minus_conv" 57006 ⌜0 Div 0⌝,
	fail_case "57.2.f.2" minus_conv "minus_conv" 57006 ⌜x - 100⌝,
	fail_case "57.2.f.3" minus_conv "minus_conv" 57010 ⌜99 - 100⌝
];
=TEX
=SML
store_mt_results
mt_run_fail [
	fail_case "57.2.g.1" times_conv "times_conv" 57009 ⌜0 < 0⌝,
	fail_case "57.2.g.2" times_conv "times_conv" 57009 ⌜x * 100⌝
];
=TEX
=SML
store_mt_results
mt_run_fail [
	fail_case "57.2.h.1" div_conv "div_conv" 57003 ⌜0 Mod 0⌝,
	fail_case "57.2.h.2" div_conv "div_conv" 57003 ⌜x Div 100⌝,
	fail_case "57.2.h.3" div_conv "div_conv" 57011 ⌜54 Div 0⌝,

	fail_case "57.2.i.1" mod_conv "mod_conv" 57007 ⌜0 * 0⌝,
	fail_case "57.2.i.2" mod_conv "mod_conv" 57007 ⌜x Mod 100⌝,
	fail_case "57.2.i.3" mod_conv "mod_conv" 57012 ⌜54 Mod 0⌝
];
=TEX
=SML
store_mt_results
mt_run_fail [
	fail_case "57.2.j.1" ℕ_eq_conv "ℕ_eq_conv" 57100 ⌜0 < 0⌝,
	fail_case "57.2.j.2" ℕ_eq_conv "ℕ_eq_conv" 57100 ⌜x = 1⌝
];
=TEX
\subsection{Group 3}
=SML
store_mt_results
(mt_runf (op =#))[
	("57.3.a.1", dest_thm o char_eq_conv, ⌜`a` = `a`⌝, ([], ⌜`a` = `a` ⇔ T⌝)),
	("57.3.a.2", dest_thm o char_eq_conv, ⌜`\000` = `\000`⌝, ([], ⌜`\000` = `\000` ⇔ T⌝)),
	("57.3.a.3", dest_thm o char_eq_conv, ⌜`a` = `A`⌝, ([], ⌜`a` = `A` ⇔ F⌝)),
	("57.3.a.4", dest_thm o char_eq_conv, ⌜`\000` = `\255`⌝, ([], ⌜`\000` = `\255` ⇔ F⌝))
];
=TEX
\subsection{Group 4}
=SML
store_mt_results
mt_run_fail [
	fail_case "57.4.a.1" char_eq_conv "char_eq_conv" 57200 ⌜1 = 2⌝,
	fail_case "57.4.a.2" char_eq_conv "char_eq_conv" 57200 ⌜`a` = a⌝
];
=TEX
\subsection{Group 5}
=SML
store_mt_results
(mt_runf (op =#))[
	("57.5.a.1", dest_thm o string_eq_conv, ⌜"" = ""⌝, (
	 [], ⌜"" = "" ⇔ T⌝)),
	("57.5.a.2", dest_thm o string_eq_conv, ⌜"a" = "a"⌝,
	 ([], ⌜"a" = "a" ⇔ T⌝)),
	("57.5.a.3", dest_thm o string_eq_conv, ⌜"abcdef" = "abcdef"⌝,
	 ([], ⌜"abcdef" = "abcdef" ⇔ T⌝)),
	("57.5.a.4", dest_thm o string_eq_conv, ⌜"" = "ab"⌝,
	([], ⌜"" = "ab" ⇔ F⌝)),
	 ("57.5.a.5", dest_thm o string_eq_conv, ⌜"ab" = ""⌝,
	 ([], ⌜"ab" = "" ⇔ F⌝)),
	("57.5.a.6", dest_thm o string_eq_conv, ⌜"a" = "ab"⌝,
	 ([], ⌜"a" = "ab" ⇔ F⌝)),
	("57.5.a.7", dest_thm o string_eq_conv, ⌜"ab" = "a"⌝,
	 ([], ⌜"ab" = "a" ⇔ F⌝))
];
=TEX
\subsection{Group 6}
=SML
store_mt_results
mt_run_fail [
	fail_case "57.6.a.1" string_eq_conv "string_eq_conv" 57300 ⌜`a` = `a`⌝,
	fail_case "57.6.a.2" string_eq_conv "string_eq_conv" 57300 ⌜"a" = a⌝
];
=TEX
\subsection{Group 7}
=SML
store_mt_results
(mt_runf (op =#))[
	("57.7.a.1", dest_thm o rewrite_conv[],
		⌜((((20 + 21) - 22) * 23) Div 24) Mod 25⌝,
		([], ⌜((((20 + 21) - 22) * 23) Div 24) Mod 25 = 18⌝)),
	("57.7.a.2", dest_thm o rewrite_conv[],
		⌜1 < 2 ∧ ¬(3 > 4) ∧ (5 ≤ 6) ∧ ¬(7 ≥ 8)⌝,
		([], ⌜1 < 2 ∧ ¬(3 > 4) ∧ (5 ≤ 6) ∧ ¬(7 ≥ 8) ⇔ T⌝)),
	("57.7.a.3", dest_thm o rewrite_conv[],
		⌜1 + 2 * 3 + 4 = 4 + 3 * 2 + 1⌝,
		([], ⌜1 + 2 * 3 + 4 = 4 + 3 * 2 + 1 ⇔ T⌝))
];
store_mt_results
(mt_runf (op =#))[
	("57.76.a.4", dest_thm o rewrite_conv[],
		⌜"abc" = "def" ⇔ ¬`x` =`x`⌝, ([], ⌜("abc" = "def" ⇔ ¬`x` =`x`) ⇔ T⌝))
];
=TEX
\subsection{Group 8}
=SML
store_mt_results
mt_run [
	("57.8.a.1", is_≤, ⌜1 ≤ 2⌝, true),
	("57.8.a.2", is_≥, ⌜1 ≥ 2⌝, true),
	("57.8.a.3", is_div, ⌜1 Div 2⌝, true),
	("57.8.a.4", is_greater, ⌜1 > 2⌝, true),
	("57.8.a.5", is_less, ⌜1 < 2⌝, true),
	("57.8.a.6", is_minus, ⌜1 - 2⌝, true),
	("57.8.a.7", is_mod, ⌜1 Mod 2⌝, true),
	("57.8.a.8", is_plus, ⌜1 + 2⌝, true),
	("57.8.a.9", is_times, ⌜1 * 2⌝, true),

	("57.8.b.1", is_≤, ⌜1 ≥ 2⌝, false),
	("57.8.b.2", is_≥, ⌜1 ≤ 2⌝, false),
	("57.8.b.3", is_div, ⌜1 Mod 2⌝, false),
	("57.8.b.4", is_greater, ⌜1 + 2⌝, false),
	("57.8.b.5", is_less, ⌜1 - 2⌝, false),
	("57.8.b.6", is_minus, ⌜1 > 2⌝, false),
	("57.8.b.7", is_mod, ⌜1 Div 2⌝, false),
	("57.8.b.8", is_plus, ⌜1 * 2⌝, false),
	("57.8.b.9", is_times, ⌜1 > 2⌝, false)
];
=TEX
=SML
store_mt_results
(mt_runf (op =$))[
	("57.8.c.1", mk_≤, (⌜1⌝, ⌜a:ℕ⌝), ⌜1 ≤ a⌝),
	("57.8.c.2", mk_≥, (⌜a:ℕ⌝, ⌜2⌝), ⌜a ≥ 2⌝),
	("57.8.c.3", mk_div, (⌜1⌝, ⌜a:ℕ⌝), ⌜1 Div a⌝),
	("57.8.c.4", mk_greater, (⌜a:ℕ⌝, ⌜2⌝), ⌜a > 2⌝),
	("57.8.c.5", mk_less, (⌜1⌝, ⌜a:ℕ⌝), ⌜1 < a⌝),
	("57.8.c.6", mk_minus, (⌜a:ℕ⌝, ⌜2⌝), ⌜a - 2⌝),
	("57.8.c.7", mk_mod, (⌜1⌝, ⌜a:ℕ⌝), ⌜1 Mod a⌝),
	("57.8.c.8", mk_plus, (⌜a:ℕ⌝, ⌜2⌝), ⌜a + 2⌝),
	("57.8.c.9", mk_times, (⌜1⌝, ⌜a:ℕ⌝), ⌜1 * a⌝)
];
=TEX
=SML
store_mt_results
(mt_runf (op =**$))[
	("57.8.d.1", dest_≤, ⌜1 ≤ a⌝, (⌜1⌝, ⌜a:ℕ⌝)),
	("57.8.d.2", dest_≥, ⌜a ≥ 2⌝, (⌜a:ℕ⌝, ⌜2⌝)),
	("57.8.d.3", dest_div, ⌜1 Div a⌝, (⌜1⌝, ⌜a:ℕ⌝)),
	("57.8.d.4", dest_greater, ⌜a > 2⌝, (⌜a:ℕ⌝, ⌜2⌝)),
	("57.8.d.5", dest_less, ⌜1 < a⌝, (⌜1⌝, ⌜a:ℕ⌝)),
	("57.8.d.6", dest_minus, ⌜a - 2⌝, (⌜a:ℕ⌝, ⌜2⌝)),
	("57.8.d.7", dest_mod, ⌜1 Mod a⌝, (⌜1⌝, ⌜a:ℕ⌝)),
	("57.8.d.8", dest_plus, ⌜a + 2⌝, (⌜a:ℕ⌝, ⌜2⌝)),
	("57.8.d.9", dest_times, ⌜1 * a⌝, (⌜1⌝, ⌜a:ℕ⌝))
];
=TEX
\subsection{Group 9}
=SML
store_mt_results
mt_run_fail [
	("57.9.a.1", mk_≤, (⌜1⌝, ⌜a⌝), gen_fail_msg "mk_≤"
			57511 [string_of_term⌜a⌝, string_of_term⌜a⌝]),
	("57.9.a.2", mk_≥, (⌜a⌝, ⌜1⌝), gen_fail_msg "mk_≥"
			57510 [string_of_term⌜a⌝, string_of_term⌜a⌝]),
	("57.9.a.3", mk_div, (⌜1⌝, ⌜a⌝), gen_fail_msg "mk_div"
			57511 [string_of_term⌜a⌝, string_of_term⌜a⌝]),
	("57.9.a.4", mk_greater, (⌜a⌝, ⌜1⌝), gen_fail_msg "mk_greater"
			57510 [string_of_term⌜a⌝, string_of_term⌜a⌝]),
	("57.9.a.5", mk_less, (⌜1⌝, ⌜a⌝), gen_fail_msg "mk_less"
			57511 [string_of_term⌜a⌝, string_of_term⌜a⌝]),
	("57.9.a.6", mk_minus, (⌜a⌝, ⌜1⌝), gen_fail_msg "mk_minus"
			57510 [string_of_term⌜a⌝, string_of_term⌜a⌝]),
	("57.9.a.7", mk_mod, (⌜1⌝, ⌜a⌝), gen_fail_msg "mk_mod"
			57511 [string_of_term⌜a⌝, string_of_term⌜a⌝]),
	("57.9.a.8", mk_plus, (⌜a⌝, ⌜1⌝), gen_fail_msg "mk_plus"
			57510 [string_of_term⌜a⌝, string_of_term⌜a⌝]),
	("57.9.a.9", mk_times, (⌜1⌝, ⌜a⌝), gen_fail_msg "mk_times"
			57511 [string_of_term⌜a⌝, string_of_term⌜a⌝])
];
=TEX
=SML
fun dest_fail_case (tag : string) (dest : TERM -> TERM*TERM)
		(area : string) (msg : int) (tm : TERM) = (
	(tag, dest, tm, gen_fail_msg area msg [string_of_term tm])
);
=TEX
=SML
store_mt_results
mt_run_fail [
	dest_fail_case"57.9.b.1" dest_≤ "dest_≤" 57501 ⌜1 ≥ a⌝,
	dest_fail_case"57.9.b.2" dest_≥ "dest_≥" 57502 ⌜a Div 2⌝,
	dest_fail_case"57.9.b.3" dest_div "dest_div" 57503 ⌜1 > a⌝,
	dest_fail_case"57.9.b.4" dest_greater "dest_greater" 57504 ⌜a < 2⌝,
	dest_fail_case"57.9.b.5" dest_less "dest_less" 57505 ⌜1 - a⌝,
	dest_fail_case"57.9.b.6" dest_minus "dest_minus" 57506 ⌜a Mod 2⌝,
	dest_fail_case"57.9.b.7" dest_mod "dest_mod" 57507 ⌜1 + a⌝,
	dest_fail_case"57.9.b.8" dest_plus "dest_plus" 57508 ⌜a * 2⌝,
	dest_fail_case"57.9.b.9" dest_times "dest_times" 57509 ⌜1 ≤ a⌝
];
=TEX
\section{EPILOGUE}
=SML
diag_string(summarize_mt_results());
=TEX
\end{document}



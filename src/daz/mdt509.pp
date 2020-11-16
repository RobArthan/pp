=IGN
********************************************************************************
mdt509.doc: this file is part of the PPDaz system

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

\def\Title{Module Tests for Z Toolkit Extensions}

\def\AbstractText{This document contains tests for the material defined in ISS/HAT/DAZ/DTD105\cite{ISS/HAT/DAZ/DTD509}.}

\def\Reference{ISS/HAT/DAZ/MDT509}

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
%% LaTeX2e port: \TPPtitle{Module Tests for Z Toolkit Extensions}  %% Mandatory field
%% LaTeX2e port: \TPPref{ISS/HAT/DAZ/MDT509}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.10 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2005/09/01 13:27:49 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: %\TPPauthor{R.D.~Arthan & WIN01}  %% Mandatory field
%% LaTeX2e port: \TPPauthor{R.D.~Arthan & WIN01}
%% LaTeX2e port: \TPPauthorisation{D.J.~King & DAZ Manager}
%% LaTeX2e port: \TPPabstract{This document contains tests for the material defined
%% LaTeX2e port: in ISS/HAT/DAZ/DTD105\cite{ISS/HAT/DAZ/DTD509}.}
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
\bibliography{fmu,daz}

\subsection{Changes history}
\begin{description}
\item[Issues 1.1 (1994/12/22)-1.3 (1994/12/22)] Initial drafts.
\item[Issue 1.4 (1996/03/07)]
Added proof context cn1.
\item[Issue 1.4 (1996/03/07)]
Proof context cn1 now defined elsewhere.
\item[Issue 1.6 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.7 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.8 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.9 (2004/01/19)] The Z universal set is now called 𝕌
\item[Issue 1.10 (2005/09/01)] Allowed for corrected precedence of logical negation.
\item[Issue 1.11 (2006/03/28)] Allowed for automated state management.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported daz source documents onto the Lemma 1 document template
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes forecast}
None.
\section{GENERAL}
\subsection{Scope}
This document contains module tests for the module defined
in \cite{ISS/HAT/DAZ/DTD509}.
\subsection{Introduction}
\subsubsection{Background and Purpose}
See \cite{ISS/HAT/DAZ/DTD509}. The tests are intended to meet
the requirements for module tests identified in the quality plan
\cite{ISS/HAT/DAZ/PLN002}.
\subsubsection{Dependencies}
These tests depend on
the test harness as implemented in DS/FMU/IED/IMP013, and
its corresponding detailed design document, DS/FMU/IED/DTD013.
\subsubsection{Possible Enhancements}
None known.
\subsubsection{Deficiencies}
None known.
\section{TEST CASES}
In addition to checking the theory design, we identify the following test cases:

\begin{description}
\item[cec.1]
The conversions for constant expression evaluation (correct operation)
\item[cec.2]
The conversions for constant expression evaluation (error cases)
\item[pc.1]
the proof contexts (successful operation)
\end{description}

(Examination of the code shows that the syntax functions are (a) essentially automatically generated using already tested code and (b) exercised in the conversions. They are therefore not explicitly tested here.)

\section{CHECKING THE THEORY DESIGN}
The theory design:
=SML
use_file "dtd013.sml";
use_file "imp013.sml";
init_mt_results();
use_file "dtd509.tch";
store_mt_results mt_run [("theory design of Z Arithmetic Tools",
	theory_check_success,
	(),
	true)];
=TEX
\section{THE TESTS}
=SML
open_theory"cn";
set_pc"z_predicates";
force_delete_theory "mdt509" handle Fail _ => ();
new_theory"mdt509";
=TEX
\subsection{Group cec.1}
The conversions for constant expression evaluation (correct operation)
=TEX
=SML
store_mt_results_show
(mt_runf (op ~=$ o ((snd o dest_eq o snd o dest_thm) ** Combinators.I))) [
	("cec.1.1.1", cn_intdiv_conv, ⓩ12 intdiv 5⌝, ⓩ2⌝),
	("cec.1.1.2", cn_intdiv_conv, ⓩ12 intdiv ~5⌝, ⓩ~2⌝),
	("cec.1.1.3", cn_intdiv_conv, ⓩ~12 intdiv 5⌝, ⓩ~2⌝),
	("cec.1.1.4", cn_intdiv_conv, ⓩ~12 intdiv ~5⌝, ⓩ2⌝),
	("cec.1.1.5", cn_intdiv_conv, ⓩ10 intdiv 2⌝, ⓩ5⌝),
	("cec.1.1.6", cn_intdiv_conv, ⓩ10 intdiv ~2⌝, ⓩ~5⌝),
	("cec.1.1.7", cn_intdiv_conv, ⓩ~10 intdiv 2⌝, ⓩ~5⌝),
	("cec.1.1.8", cn_intdiv_conv, ⓩ~10 intdiv ~2⌝, ⓩ5⌝)
];
=TEX
=SML
store_mt_results_show
(mt_runf (op ~=$ o ((snd o dest_eq o snd o dest_thm) ** Combinators.I))) [
	("cec.1.2.1", cn_rem_conv, ⓩ14 rem 5⌝, ⓩ4⌝),
	("cec.1.2.2", cn_rem_conv, ⓩ14 rem ~5⌝, ⓩ4⌝),
	("cec.1.2.3", cn_rem_conv, ⓩ~14 rem 5⌝, ⓩ~4⌝),
	("cec.1.2.4", cn_rem_conv, ⓩ~14 rem ~5⌝, ⓩ~4⌝),
	("cec.1.2.5", cn_rem_conv, ⓩ10 rem 2⌝, ⓩ0⌝),
	("cec.1.2.6", cn_rem_conv, ⓩ10 rem ~2⌝, ⓩ0⌝),
	("cec.1.2.7", cn_rem_conv, ⓩ~10 rem 2⌝, ⓩ0⌝),
	("cec.1.2.8", cn_rem_conv, ⓩ~10 rem ~2⌝, ⓩ0⌝)
];
=TEX
=SML
store_mt_results_show
(mt_runf (op ~=$ o ((snd o dest_eq o snd o dest_thm) ** Combinators.I))) [
	("cec.1.3.1", cn_intmod_conv, ⓩ14 intmod 5⌝, ⓩ4⌝),
	("cec.1.3.2", cn_intmod_conv, ⓩ14 intmod ~5⌝, ⓩ~1⌝),
	("cec.1.3.3", cn_intmod_conv, ⓩ~14 intmod 5⌝, ⓩ1⌝),
	("cec.1.3.4", cn_intmod_conv, ⓩ~14 intmod ~5⌝, ⓩ~4⌝),
	("cec.1.3.5", cn_intmod_conv, ⓩ10 intmod 2⌝, ⓩ0⌝),
	("cec.1.3.6", cn_intmod_conv, ⓩ10 intmod ~2⌝, ⓩ0⌝),
	("cec.1.3.7", cn_intmod_conv, ⓩ~10 intmod 2⌝, ⓩ0⌝),
	("cec.1.3.8", cn_intmod_conv, ⓩ~10 intmod ~2⌝, ⓩ0⌝)
];
=TEX
=SML
store_mt_results_show
(mt_runf (op ~=$ o ((snd o dest_eq o snd o dest_thm) ** Combinators.I))) [
	("cec.1.4.1", cn_star_star_conv, ⓩ2 ** 0⌝, ⓩ1⌝),
	("cec.1.4.2", cn_star_star_conv, ⓩ3 ** 0⌝, ⓩ1⌝),
	("cec.1.4.3", cn_star_star_conv, ⓩ4 ** 1⌝, ⓩ4⌝),
	("cec.1.4.4", cn_star_star_conv, ⓩ4 ** 2⌝, ⓩ16⌝),
	("cec.1.4.5", cn_star_star_conv, ⓩ5 ** 3⌝, ⓩ125⌝),
	("cec.1.4.6", cn_star_star_conv, ⓩ6 ** 3⌝, ⓩ216⌝),
	("cec.1.4.7", cn_star_star_conv, ⓩ6 ** 4⌝, ⓩ1296⌝),
	("cec.1.4.8", cn_star_star_conv, ⓩ0 ** 0⌝, ⓩ1⌝),
	("cec.1.4.9", cn_star_star_conv, ⓩ0 ** 1⌝, ⓩ0⌝),
	("cec.1.4.10", cn_star_star_conv, ⓩ0 ** 5⌝, ⓩ0⌝)
];
=TEX
\subsection{Group cec.2}
The conversions for constant expression evaluation (error cases)
=SML
store_mt_results_show
mt_run_fail [
("cec.2.1", cn_intdiv_conv, ⌜x:ℤ⌝,
		gen_fail_msg"cn_intdiv_conv" 509011 [string_of_term ⌜x:ℤ⌝]),
("cec.2.2", cn_rem_conv, ⌜x:ℤ⌝,
		gen_fail_msg"cn_rem_conv" 509012 [string_of_term ⌜x:ℤ⌝]),
("cec.2.3", cn_intmod_conv, ⌜x:ℤ⌝,
		gen_fail_msg"cn_intmod_conv" 509013 [string_of_term ⌜x:ℤ⌝]),
("cec.2.4", cn_star_star_conv, ⌜x:ℤ⌝,
		gen_fail_msg"cn_star_star_conv" 509014 [string_of_term ⌜x:ℤ⌝])
];
=TEX
=TEX
\subsection{pc.1}
the proof contexts (successful operation)
=SML
store_mt_results_show
(mt_runf (op ~=$ o ((snd o dest_eq o snd o dest_thm) ** Combinators.I))) [
	("pc.1.1.1", PC_C1 "'cn" rewrite_conv[], ⓩx mem y⌝, ⓩBoolean (Π(x ∈ y))⌝),
	("pc.1.1.2", PC_C1 "'cn" rewrite_conv[], ⓩx notmem y⌝, ⓩBoolean (Π(¬x ∈ y))⌝),
	("pc.1.1.3", PC_C1 "'cn" rewrite_conv[], ⓩx eq y⌝, ⓩBoolean (Π(x = y))⌝),
	("pc.1.1.4", PC_C1 "'cn" rewrite_conv[], ⓩx noteq y⌝, ⓩBoolean (Π(¬x = y))⌝),
	("pc.1.1.5", PC_C1 "'cn" rewrite_conv[], ⓩx less y⌝, ⓩBoolean (Π(x < y))⌝),
	("pc.1.1.6", PC_C1 "'cn" rewrite_conv[], ⓩx less_eq y⌝, ⓩBoolean (Π(x ≤ y))⌝),
	("pc.1.1.7", PC_C1 "'cn" rewrite_conv[], ⓩx greater y⌝, ⓩBoolean (Π(x > y))⌝),
	("pc.1.1.8", PC_C1 "'cn" rewrite_conv[], ⓩx greater_eq y⌝, ⓩBoolean (Π(x ≥ y))⌝)
];
=TEX
=SML
store_mt_results_show
(mt_runf (op ~=$ o ((snd o dest_eq o snd o dest_thm) ** Combinators.I))) [
	("pc.1.2.1", PC_C1 "'cn" rewrite_conv[], ⓩnot(Boolean p)⌝, ⓩBoolean (Π(¬p))⌝),
	("pc.1.2.2", PC_C1 "'cn" rewrite_conv[], ⓩBoolean p and Boolean q⌝, ⓩBoolean (Π(p ∧ q))⌝),
	("pc.1.2.3", PC_C1 "'cn" rewrite_conv[], ⓩBoolean p or Boolean q⌝, ⓩBoolean (Π(p ∨ q))⌝),
	("pc.1.2.4", PC_C1 "'cn" rewrite_conv[], ⓩBoolean p xor Boolean q⌝, ⓩBoolean (Π(¬(p ⇔ q)))⌝),
	("pc.1.2.5", PC_C1 "'cn" rewrite_conv[], ⓩBoolean p = Boolean q⌝, ⓩ(Π(p ⇔ q))⌝)
];
=TEX
=SML
store_mt_results_show
(mt_runf (op ~=$ o ((snd o dest_eq o snd o dest_thm) ** Combinators.I))) [
	("pc.1.3.1", PC_C1 "cn" rewrite_conv[], ⓩN eq 0 or not (N less 4) = TRUE⌝, ⓩN = 0 ∨ 4 ≤ N⌝),
	("pc.1.3.2", PC_C1 "cn" rewrite_conv[], ⓩFALSE ∈ BOOLEAN⌝, ⓩtrue⌝),
	("pc.1.3.3", PC_C1 "cn" rewrite_conv[], ⓩ(not 1 less 2) or 3 mem {1,2,3}⌝, ⓩBoolean true⌝),
	("pc.1.3.4", PC_C1 "cn" rewrite_conv[], ⓩ(17 div 2 less (90 rem 100))⌝, ⓩBoolean true⌝),
	("pc.1.3.5", PC_C1 "cn" rewrite_conv[], ⓩBOOLEAN⌝, ⓩ{Boolean false, Boolean true}⌝),
	("pc.1.3.6", PC_C1 "cn" rewrite_conv[], ⓩBOOLEANvFIRST⌝, ⓩBoolean false⌝),
	("pc.1.3.7", PC_C1 "cn" rewrite_conv[], ⓩBOOLEANvLAST⌝, ⓩBoolean true⌝),
	("pc.1.3.8", PC_C1 "cn" rewrite_conv[], ⓩBOOLEANvSUCC⌝, ⓩ{Boolean false ↦ Boolean true}⌝),
	("pc.1.3.9", PC_C1 "cn" rewrite_conv[], ⓩBOOLEANvPRED⌝, ⓩ{Boolean true ↦ Boolean false}⌝),
	("pc.1.3.10", PC_C1 "cn" rewrite_conv[], ⓩBOOLEANvPOS⌝, ⓩid {Boolean false, Boolean true}⌝),
	("pc.1.3.11", PC_C1 "cn" rewrite_conv[], ⓩBOOLEANvVAL⌝, ⓩid {Boolean false, Boolean true}⌝)
];
=TEX
=SML
store_mt_results_show
(mt_runf (op ~=$ o ((snd o dest_eq o snd o dest_thm) ** Combinators.I))) [
	("pc.1.4.1", PC_C1 "cn_ext" rewrite_conv[],
		ⓩ{x:ℤ | x intmod 3 = 0} = {x:ℤ ⦁ 3*x}⌝,
		ⓩ∀x1:𝕌⦁x1 intmod 3 = 0 ⇔ (∃x:ℤ⦁3 * x = x1)⌝)
];
=IGN

=TEX
=TEX
\section{SUMMARY OF RESULTS}
=SML
diag_string(summarize_mt_results());
=TEX

\end{document}


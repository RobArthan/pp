=IGN
********************************************************************************
mdt106.doc: this file is part of the PPZed system

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

\def\Title{Module Tests for Integer Arithmetic Proof Procedure}

\def\AbstractText{This document contains tests for the material defined in DS/FMU/IED/DTD105\cite{DS/FMU/IED/DTD106}.}

\def\Reference{DS/FMU/IED/MDT106}

\def\Author{R.D. Arthan, K. Blackburn}


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
%% LaTeX2e port: \TPPtitle{Module Tests for Integer Arithmetic Proof Procedure}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/MDT106}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.6 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2004/01/19 12:44:00 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: %\TPPauthor{R.D.~Arthan & WIN01}  %% Mandatory field
%% LaTeX2e port: \TPPauthors{R.D.~Arthan & WIN01\\K.~Blackburn & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.B.~Jones & FMU Manager}
%% LaTeX2e port: \TPPabstract{This document contains tests for the material defined
%% LaTeX2e port: in DS/FMU/IED/DTD105\cite{DS/FMU/IED/DTD106}.}
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
\item[Issue 1.1 (1994/12/21)]
First draft.
\item[Issue 1.2 (1996/03/07)]
Added $z\_lin\_arith1$.
\item[Issue 1.3 (2002/10/17)]
Fixed {\LaTeX} errors.
\item[Issue 1.4 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.5 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.6 (2004/01/19)] The Z universal set is now called 𝕌.
\item[Issue 1.7 (2005/02/26)] Precedences and associativity of toolkit operators now follow \cite{ISO02}.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported PPZed to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes forecast}
None.
\section{GENERAL}
\subsection{Scope}
This document contains module tests for the module defined
in \cite{DS/FMU/IED/DTD106}.
\subsection{Introduction}
\subsubsection{Background and Purpose}
See \cite{DS/FMU/IED/DTD106}. The tests are intended to meet
the requirements for module tests identified in the quality plan
\cite{DS/FMU/IED/PLN008}.
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
\item[zz.1]
$z\_ℤ\_conv$ and $ℤ\_z\_conv$ (successful operation)
\item[zz.2]
$z\_ℤ\_conv$ and $ℤ\_z\_conv$ (error cases)
\item[za.1]
$z\_anf\_conv$ (successful operation)
\item[za.2]
$z\_anf\_conv$ (error cases)
\item[pc.1]
the proof contexts (successful operation)
\end{description}
\section{CHECKING THE THEORY DESIGN}
The theory design:
=SML
use_file "dtd013.sml";
use_file "imp013.sml";
init_mt_results();
use_file "dtd106.tch";
store_mt_results mt_run [("theory design of Z Arithmetic Tools",
	theory_check_success,
	(),
	true)];
=TEX
\section{THE TESTS}
=SML
open_theory"z_arithmetic_tools";
set_pc"z_predicates";
force_delete_theory "mdt106" handle Fail _ => ();
new_theory"mdt106";
=TEX
\subsection{Group zz.1}
$z\_ℤ\_conv$ and $ℤ\_z\_conv$ (successful operation)
=TEX
=SML
store_mt_results_show
(mt_runf (op ~=$ o ((snd o dest_eq o snd o dest_thm) ** Combinators.I))) [
	("zz.1.1.1", z_ℤ_conv,
		⌜z_ℤⓩ(a + b)⌝⌝,
		⌜ⓩ⌜z_ℤ a⌝⌝ +⋎Z ⓩ⌜z_ℤ b⌝⌝⌝),
	("zz.1.1.2", z_ℤ_conv,
		⌜z_ℤⓩ(a - b)⌝⌝,
		⌜ⓩ⌜z_ℤ a⌝⌝ -⋎Z ⓩ⌜z_ℤ b⌝⌝⌝),
	("zz.1.1.3", z_ℤ_conv,
		⌜z_ℤⓩ(a * b)⌝⌝,
		⌜ⓩ⌜z_ℤ a⌝⌝ *⋎Z ⓩ⌜z_ℤ b⌝⌝⌝),
	("zz.1.1.4", z_ℤ_conv,
		⌜z_ℤⓩ~a⌝⌝,
		⌜~⋎Z(z_ℤ a)⌝),
	("zz.1.1.5", z_ℤ_conv,
		⌜z_ℤⓩ7⌝⌝,
		⌜ℕℤ 7⌝),
	("zz.1.6", z_ℤ_conv,
		⌜z_ℤ⌜ℤ_z x⌝⌝,
		⌜x:ℤ⌝)
];
=TEX
=SML
store_mt_results_show
(mt_runf (op ~=$ o ((snd o dest_eq o snd o dest_thm) ** Combinators.I))) [
	("zz.1.2.1", ℤ_z_conv,
		⌜ℤ_z⌜(a +⋎Z b)⌝⌝,
		ⓩ⌜ℤ_z a⌝ + ⌜ℤ_z b⌝⌝),
	("zz.1.2.2", ℤ_z_conv,
		⌜ℤ_z⌜(a -⋎Z b)⌝⌝,
		ⓩ⌜ℤ_z a⌝ - ⌜ℤ_z b⌝⌝),
	("zz.1.2.3", ℤ_z_conv,
		⌜ℤ_z⌜(a *⋎Z b)⌝⌝,
		ⓩ⌜ℤ_z a⌝ * ⌜ℤ_z b⌝⌝),
	("zz.1.2.4", ℤ_z_conv,
		⌜ℤ_z⌜~⋎Z a⌝⌝,
		ⓩ~⌜ℤ_z a⌝ ⌝),
	("zz.1.2.5", ℤ_z_conv,
		⌜ℤ_z⌜~⋎Z a⌝⌝,
		ⓩ~⌜ℤ_z a⌝ ⌝),
	("zz.1.2.6", ℤ_z_conv,
		⌜ℤ_z⌜ℕℤ 12⌝⌝,
		ⓩ12⌝),
	("zz.1.2.7", ℤ_z_conv,
		⌜ℤ_z⌜z_ℤ x⌝⌝,
		ⓩx⦂ℤ⌝)
];
=TEX
\subsection{Group zz.2}
$z\_ℤ\_conv$ and $ℤ\_z\_conv$ (error cases)
=SML
store_mt_results_show
mt_run_fail [
("zz.2.1", z_ℤ_conv, ⌜x:ℤ⌝,
		gen_fail_msg"z_ℤ_conv" 106001 [string_of_term ⌜x:ℤ⌝]),
("zz.2.2", ℤ_z_conv, ⌜x:ℤ⌝,
		gen_fail_msg"ℤ_z_conv" 106002 [string_of_term ⌜x:ℤ⌝])
];
=TEX
\subsection{za.1}
$z\_anf\_conv$ (successful operation)
=SML
=TEX
=SML
store_mt_results_show
(mt_runf (op ~=$ o ((snd o dest_eq o snd o dest_thm) ** Combinators.I))) [
	("za.1.1", z_anf_conv,
		ⓩ(1 + x)*(1 + x)⌝,
		ⓩ1 + (2*x + x*x)⌝),
	("za.1.2", z_anf_conv,
		ⓩ(1 + x)*(1 - x)⌝,
		ⓩ1 + ~x*x⌝)
];
=TEX
\subsection{za.2}
$z\_anf\_conv$ (error cases)
=SML
store_mt_results_show
mt_run_fail [
("za.2.1", z_anf_conv, ⌜x:ℤ⌝,
		gen_fail_msg"z_anf_conv" 106010 [string_of_term ⌜x:ℤ⌝])
];
=TEX
\subsection{pc.1}
the proof contexts (successful operation)
=SML
store_mt_results_show
(mt_runf (op ~=$ o ((snd o dest_thm) ** Combinators.I))) [
	("pc.1.1", pc_rule1 "z_lin_arith" prove_rule[],
		ⓩx < y ∧ y < z ⇒ x < z⌝,
		ⓩx < y ∧ y < z ⇒ x < z⌝),
	("pc.1.2", pc_rule1 "z_lin_arith" prove_rule[],
		ⓩ¬(∃x, y:ℤ⦁x > 0 ∧ x + a + b + y < b + y + a)⌝,
		ⓩ¬(∃x, y:ℤ⦁x > 0 ∧ x + a + b + y < b + y + a)⌝)
];
store_mt_results_show
(mt_runf (op ~=$ o ((snd o dest_thm) ** Combinators.I))) [
	("pca.1.1", pc_rule1 "z_lin_arith1" prove_rule[],
		ⓩx < y ∧ y < z ⇒ x < z⌝,
		ⓩx < y ∧ y < z ⇒ x < z⌝),
	("pca.1.2", pc_rule1 "z_lin_arith1" prove_rule[],
		ⓩ¬(∃x, y:ℤ⦁x > 0 ∧ x + a + b + y < b + y + a)⌝,
		ⓩ¬(∃x, y:ℤ⦁x > 0 ∧ x + a + b + y < b + y + a)⌝)
];
=TEX
=SML
val eg_thm = (
set_goal([], ⓩ{i, j : ℤ | 30*i = 105*j} = {i, j : ℤ | 2*i = 7*j}⌝);
a(MERGE_PCS_T1["z_sets_ext", "'z_lin_arith"]prove_tac[]);
pop_thm()
);
store_mt_results_show
(mt_runf (op ~=$ o ((snd o dest_thm) ** Combinators.I))) [
	("pc.1.3", Combinators.I,
		eg_thm,
		ⓩ{i, j : ℤ | 30*i = 105*j} = {i, j : ℤ | 2*i = 7*j}⌝)
];
=SML
=TEX
=SML
val eg_thm1 = (
set_goal([], ⓩ{i, j : ℤ | 30*i = 105*j} = {i, j : ℤ | 2*i = 7*j}⌝);
a(MERGE_PCS_T1["z_sets_ext", "'z_lin_arith1"]prove_tac[]);
pop_thm()
);
store_mt_results_show
(mt_runf (op ~=$ o ((snd o dest_thm) ** Combinators.I))) [
	("pca.1.3", Combinators.I,
		eg_thm1,
		ⓩ{i, j : ℤ | 30*i = 105*j} = {i, j : ℤ | 2*i = 7*j}⌝)
];
=TEX
\section{SUMMARY OF RESULTS}
=SML
diag_string(summarize_mt_results());
=TEX

\end{document}


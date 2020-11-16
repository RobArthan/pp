=IGN
********************************************************************************
mdt103.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  ℤ
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

\def\Title{Module Tests for Conjecture Database}

\def\AbstractText{This document contains the implementation for the facilities for managing conjectures.}

\def\Reference{DS/FMU/IED/MDT103}

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
%% LaTeX2e port: \def\Bool{``$\it{:}bool\,$''}
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{FST PROJECT}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Module Tests for Conjecture Database}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/MDT103}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.7 $%%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2006/01/17 17:51:12 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: %\TPPstatus{Approved}
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{R.D.~Arthan & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.B.~Jones & HAT Manager}
%% LaTeX2e port: \TPPabstract{
%% LaTeX2e port: This document contains the implementation for the
%% LaTeX2e port: facilities for managing conjectures.}
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
\item[Issue 1.1 (1994/10/28)]
First drafts.
\item[Issue 1.4 (1996/01/29)]
SCCS keywords reinserted.
\item[Issue 1.5 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.6 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.7 (2006/01/17)] Added tests for the new facilities.
\item[Issue 1.8 (2006/09/18)] {\em is\_proved\_conjecture} etc. now fail if theory is not in scope rather than giving wronng answers.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
\pagebreak
\section{GENERAL}
\subsection{Scope}
This document contains the modules tests for the Conjectures Database module for ICL HOL.
The detailed design for this material is given in \cite{DS/FMU/IED/DTD103}.

\subsection{Introduction}
See \cite{DS/FMU/IED/DTD103}.

\subsection{Purpose and Background}
See \cite{DS/FMU/IED/DTD103}.
\subsection{Dependencies}
The tests use the test harness of \cite{DS/FMU/IED/DTD013}.
\subsection{Deficiencies}
None known.
\section{TEST CASES}
The test cases mainly comprise a straightforward check of the correct operation and error cases of each function.
The behaviour when types/constants are deleted is also checked.


=TEX
\section{SET-UP}
=SML
use_file"dtd013";
use_file"imp013";
init_mt_results();
set_flag("ignore_warnings", true);
open_theory "hol";
new_theory "mdtcnj";
=TEX
=SML
fun list_eq (eq:'a * 'a -> bool) ((a :: x), (b :: y)) : bool = (
	eq(a,b) andalso list_eq eq (x, y)
) | list_eq eq ([], []) = true
| list_eq _ _ = false;
=TEX
\section{THE TESTS}
=SML
store_mt_results mt_run [("new_conjecture 1",
	new_conjecture,
	(["apple", "banana", "cherry"], ⌜apples + pears = stairs⌝),
	()),
	("new_conjecture 2",
	new_conjecture,
	(["date"], ⌜¬apples = bananas⌝),
	()),
	("new_conjecture 3",
	new_conjecture,
	(["elderberry"], ⌜¬1 = bananas⌝),
	())
];

store_mt_results (mt_runf (op =$)) [("get_conjecture 1",
	get_conjecture "mdtcnj",
	"banana",
	⌜apples + pears = stairs⌝),
	("get_conjecture 2",
	get_conjecture "-",
	"date",
	⌜¬apples = bananas⌝),
	("get_conjecture 3",
	get_conjecture "-",
	"elderberry",
	⌜¬1 = bananas⌝)
];

store_mt_results mt_run [("get_conjectures 1",
	map fst o get_conjectures,
	"-",
	[ ["elderberry"], ["date"], ["apple","banana","cherry"] ])
];
=TEX
Now test the failures:
=SML
store_mt_results mt_run_fail [("new_conjecture 3031",
	new_conjecture,
	(["rubbish"],⌜1⌝),
	gen_fail_msg "new_conjecture" 3031 ["⌜1⌝"])
];
=TEX
=SML
store_mt_results mt_run_fail [("new_conjecture 6031",
	new_conjecture,
	([],⌜1 = 2⌝),
	gen_fail_msg "new_conjecture" 6031 [])
];
=TEX
=SML
val mdt103_non_existent_theory =
	"mdt103: there surely isn't a theory called this!";
store_mt_results mt_run_fail [("get_conjectures 20601",
	get_conjectures,
	mdt103_non_existent_theory,
	gen_fail_msg "get_conjectures" 20601 [mdt103_non_existent_theory])
];
=TEX
=SML
store_mt_results mt_run_fail [("new_conjecture 103801",
	new_conjecture,
	(["date"],⌜1 = 1⌝),
	gen_fail_msg "new_conjecture" 103801 ["date"])
];
=TEX
=SML
val mdt103_non_existent_conjecture =
	"mdt103: there surely isn't a conjecture called this!";
store_mt_results mt_run_fail [("get_conjecture 103802",
	get_conjecture "-",
	mdt103_non_existent_conjecture,
	gen_fail_msg "get_conjecture" 103802
		[mdt103_non_existent_conjecture, get_current_theory_name()])
];
=TEX
(The remaining messages are a ``shouldn't happen'' (103804)
and the informative comment from $cull\_conjectures$; these don't need testing.)


Now do some setting up to test out the automated deletion of conjectures.
=SML
new_const("Fig", ⌜:ℕ⌝);
store_mt_results mt_run [("new_conjecture 4",
	new_conjecture,
	(["fig"], ⌜¬1 = Fig⌝),
	()),
	("new_conjecture 5",
	new_conjecture,
	(["gooseberry"], ⌜¬1 = cherry⌝),
	())
];
=TEX
Now do some ``normal'' deletions:
=SML

store_mt_results (mt_runf (op =$)) [("delete_conjecture 1",
	delete_conjecture,
	"apple",
	⌜apples + pears = stairs⌝),
	("delete_conjecture 2",
	delete_conjecture,
	"date",
	⌜¬apples = bananas⌝)
];

store_mt_results mt_run [("get_conjectures 2",
	map fst o get_conjectures,
	"-",
	[ ["gooseberry"], ["fig"],["elderberry"] ])
];

=TEX
Now delete a constant, and check that the correct conjectures are deleted.
=SML
delete_const ⌜Fig⌝;

store_mt_results mt_run [("get_conjectures 3",
	map fst o get_conjectures,
	"-",
	[["gooseberry"],  ["elderberry"] ])
];
=TEX
=SML
new_type("FRUIT", 0);
store_mt_results mt_run [("new_conjecture 6",
	new_conjecture,
	(["FRUIT"], ⌜¬(x:FRUIT) = y⌝),
	()),
	("new_conjecture 7",
	new_conjecture,
	(["huckleberry"], ⌜¬1 = date⌝),
	())
];

=SML
delete_type "FRUIT";

store_mt_results mt_run [("get_conjectures 4",
	map fst o get_conjectures,
	"-",
	[["huckleberry"],  ["gooseberry"],  ["elderberry"] ])
];
=TEX
Check deletion of all conjectures:
=SML
delete_all_conjectures();
store_mt_results mt_run [("get_conjectures 5",
	map fst o get_conjectures,
	"-",
	[])
];
=TEX
Check that {\em new\_conjecture} tests against saved theorems as it should:
=SML
save_thm("my_thm1", t_thm);
store_mt_results
mt_run_fail [("new_conjecture 103102",
	new_conjecture,
	(["my_thm1"] , ⌜F⌝),
	gen_fail_msg "new_conjecture" 103102
		["my_thm1"])
];
=TEX
Check that {\em save\_thm} tests against conjectures as it should:
=SML
new_conjecture(["my_thm2", "my_thm3"], ⌜1 = 1⌝);
store_mt_results
mt_run_fail [("save_thm 103101",
	save_thm,
	("my_thm2" , t_thm),
	gen_fail_msg "save_thm" 103101
		["my_thm2"])
];
save_thm("my_thm2", refl_conv ⌜1⌝);
=TEX
Check {\em is\_proved\_conjecture}: normal operation:
=SML
store_mt_results
mt_run [("is_proved_conjecture 1",
	is_proved_conjecture "-",
	"my_thm2",
	true),
	("is_proved_conjecture 2",
	is_proved_conjecture "-",
	"my_thm3",
	false)
];
=TEX
Check {\em is\_proved\_conjecture}: error cases:
=SML
new_theory "mdtcnj_child";
open_theory "mdtcnj";
store_mt_results
mt_run_fail [("is_proved_conjecture 103802",
	is_proved_conjecture "-",
	"my_thm4",
	gen_fail_msg "is_proved_conjecture" 103802
		["my_thm4", "mdtcnj"]),
	("is_proved_conjecture 103103",
	is_proved_conjecture "mdtcnj_child",
	"my_thm4",
	gen_fail_msg "is_proved_conjecture" 103103
		["mdtcnj_child"])
];
=TEX
Check {\em get\_proved\_conjectures}/{\em get\_unproved\_conjectures}: normal operation:
=SML
store_mt_results
mt_run [("get_proved_conjectures 1",
	get_proved_conjectures,
	"-",
	["my_thm2"]),
	("get_unproved_conjectures 1",
	get_unproved_conjectures,
	"-",
	["my_thm3"])
];
=TEX
Check {\em get\_proved\_conjectures}/{\em get\_unproved\_conjectures}: error cases:
=SML
store_mt_results
mt_run_fail [
	("get_proved_conjectures 103103",
	get_proved_conjectures, "mdtcnj_child",
	gen_fail_msg "get_proved_conjectures" 103103
		["mdtcnj_child"]),
	("get_unproved_conjectures 103103",
	get_unproved_conjectures, "mdtcnj_child",
	gen_fail_msg "get_unproved_conjectures" 103103
		["mdtcnj_child"])
];
=TEX
\section{SUMMARY OF RESULTS}
=TEX
=SML
diag_string(summarize_mt_results());
=TEX
\end{document}




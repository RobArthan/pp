=IGN
********************************************************************************
mdt025.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% mdt025.doc   ℤ $Date: 2006/08/09 16:26:22 $ $Revision: 2.17 $ $RCSfile: mdt025.doc,v $

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

\def\Title{Module Tests for Pretty Printer}

\def\AbstractText{This document contains the module tests for the ICL HOL Pretty Printer.}

\def\Reference{DS/FMU/IED/MDT025}

\def\Author{A.J. Hammon}


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
%% LaTeX2e port: % mdt025.doc   ℤ $Date: 2006/08/09 16:26:22 $ $Revision: 2.17 $ $RCSfile: mdt025.doc,v $
%% LaTeX2e port: \documentstyle[hol1,11pt,TQ]{article}
%% LaTeX2e port: 
%% LaTeX2e port: \TPPtitle{Module Tests for Pretty Printer}
%% LaTeX2e port: \TPPref{DS/FMU/IED/MDT025}
%% LaTeX2e port: \def\SCCSissue{$Revision: 2.17 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSissue}
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2006/08/09 16:26:22 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPproject{FST PROJECT}
%% LaTeX2e port: 
%% LaTeX2e port: =IGN
%% LaTeX2e port: 
%% LaTeX2e port: Commands to process this document in various ways.
%% LaTeX2e port: 
%% LaTeX2e port: docsml mdt025
%% LaTeX2e port: use_file "mdt025.sml";
%% LaTeX2e port: 
%% LaTeX2e port: make -f rel001.mkf mdt025.dvi
%% LaTeX2e port: doctex mdt025
%% LaTeX2e port: texdvi mdt025
%% LaTeX2e port: bibtex mdt025
%% LaTeX2e port: doctex mdt025 ; texdvi mdt025
%% LaTeX2e port: doctex mdt025 ; texdvi mdt025 ; bibtex mdt025
%% LaTeX2e port: dvipage mdt025 &
%% LaTeX2e port: 
%% LaTeX2e port: docsml mdt025
%% LaTeX2e port: use_file "mdt025.sml";
%% LaTeX2e port: 
%% LaTeX2e port: =TEX
%% LaTeX2e port: %\TPPstatus{Approved}
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{A.J. Hammon & WIN01}  %% Mandatory field
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document contains the module tests for the ICL~HOL
%% LaTeX2e port: 	Pretty Printer.}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	Library
%% LaTeX2e port: }}
%% LaTeX2e port: 
%% LaTeX2e port: \ftlinepenalty=9999
%% LaTeX2e port: \makeindex
%% LaTeX2e port: 
%% LaTeX2e port: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LaTeX2e port: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LaTeX2e port: 
\catcode`\_=\active
\def\_{\kern.06em\vbox{\hrule height.1ex width.3em}\hskip0.1em\relax}
%% LaTeX2e port: 
%% LaTeX2e port: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LaTeX2e port: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LaTeX2e port: 
%% LaTeX2e port: \begin{document}
%% LaTeX2e port: \makeTPPfrontpage
%% LaTeX2e port: 
%% LaTeX2e port: \vfill
%% LaTeX2e port: \begin{center}
%% LaTeX2e port: \bf Copyright \copyright\ : Lemma 1 Ltd. \number\year
%% LaTeX2e port: \end{center}

\begin{document}

\headsep=0mm
\FrontPage
\headsep=10mm

\setcounter{section}{-1}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
\section{DOCUMENT CONTROL}

%********************************************************************

\subsection{Contents List}
\tableofcontents
% \listoftables

%********************************************************************

\subsection{Document Cross References}

\bibliographystyle{fmu}
\bibliography{fmu}

%********************************************************************

\subsection{Changes History}

\begin{description}

\item[Issues 1.1 (1991/07/10) to 1.7 (1991/09/11) ] Initial drafts.

\item[\FormatDate{91/09/12}, issue 2.1 ] First approved version.

\item[\FormatDate{91/10/31}, issue 2.2]
Reacted to introduction of "o" as a constant.

\item[Issue 2.3 (1992/01/20), \FormatDate{92/01/20} ] Updated to use new fonts.

\item[Issue 2.4 (1992/01/31), \FormatDate{92/01/31} ]
	Fix label of test {\tt 10_010f}.
	Correct tests {\tt cdg_030} and {\tt cdg_040}.
\item [Issue 2.5 (1992/04/09), 2.6 (1992/04/10), 9 April 1992 ] Changes required by CR0016.
\item [Issue 2.7 (1992/04/14), 14 April 1992 ] Changes required by CR0017.

\item[Issue 2.11 (1992/05/21)]
	Many new tests, fixes to other tests.
\item [Issue 2.12 (1992/12/14) (14th December 1992)]
	Changed to allow tests to be run on a parent database.
\item[Issue 2.14 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 2.15 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 2.16 (2006/01/23)] Allowed for changes to treatment of object language strings.
\item[Issue 2.17 (2006/08/09)] Extended characters are now used in object language strings.
\item[Issue 2.18 (2012/03/17)] Tested the option to use type abbreviations.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}

%********************************************************************

%\subsection{Changes Forecast} \label{ChangesForecast}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newpage
\section{GENERAL}

%********************************************************************

\subsection{Scope}

This document contains the module tests for the pretty printing
routines for Release~1 of the ICL HOL system which are discussed
in~\cite{DS/FMU/IED/IMP025}.  The tests use the module testing system
of~\cite{DS/FMU/IED/DTD013} and~\cite{DS/FMU/IED/IMP013}.

%********************************************************************

\subsection{Introduction}

Each test, or part of a test, is identified by a string of the form
``$\cal N_M$'' or ``$\cal N_MA$'' where: ``$\cal N$'' indicates the
area of the test; ``$\cal M$'' is the test number; and, ``$\cal A$'' is
ancillary labelling for the test.

The first major group of tests are concerned with getting the correct
layout of the brackets and components of the terms, most of these
tests use a very wide line length to ensure that all the output is
on a single line.

Most of the tests are run twice.  Firstly to see if the expected output
is produced.  Secondly (using function $uft$) to ensure that the text
that is produced can be parsed back in as the same term.

%********************************************************************

\subsection{Deficiencies}

Function $pp_init$ is not directly tested by this file.  The function
is called in the implementation document~\cite{DS/FMU/IED/IMP025} when
it installs the printing functions.  The success of this function can
only be determined by the integration tests where if terms, types and
theorems are not printed as top level values then the printing
functions have not been installed.

The theorem printing functions are not tested because there are no
readily available values of suitable type and creating such values with
a non-empty set of assumptions is difficult.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\section{TEST HARNESS INITIALISATION}

=IGN
Get the test harness files
sccs -d ~ied get dtd013.doc imp013.doc
docsml dtd013
docsml imp013

docsml mdt025
use_file "mdt025.sml";

=TEX

Load and initialise the module test system.

=SML
use_file "dtd013.sml";
use_file "imp013.sml";
init_mt_results ();
open_theory "hol";
new_theory "mdt025_test";
=TEX

Use very long lines for the first tests.

=SML
set_line_length 500;
=TEX

Functions $ft$ and $uft$ are used to invoke the tests.  The first just
formats the term into a single string, the second formats the term into
a single string, parses it back as a term and formats the result of
that.

=SML
fun ft (x:TERM) : string list = PrettyPrinter.format_term false x;

val uft_aux : TERM ref = ref ⌜1⌝;

fun uft (x:TERM) : TERM =
let
	val t1 = implode(ft x);
	val side_effect = use_string
		("(uft_aux := ⌜" ^ t1 ^ "⌝; !uft_aux)");
in
	!uft_aux
end;
=TEX

%********************************************************************

\subsection{HOL Operators, Types and Constants}

Some initialisations required in the absence of the proper
declarations for the operators, types and constants about:
	pairing
and
	sets.

=SML
(	declare_infix (100, "×")	handle Fail _ => (),	"infix ×");
(Value	(new_type("×", 2))		handle Fail _ => Nil,	"new_type ×");
(	declare_infix (100, ",")		handle Fail _ => (),	"infix ,");
(Value	(new_const(",", type_of⌜x:'a→'b→('a×'b)⌝))
					handle Fail _ => Nil,	"new_const ,");

(Value	(new_type("SET", 1))		handle Fail _ => Nil,	"new_type SET");
(Value	(new_type("CHAR", 0))		handle Fail _ => Nil,	"new_type SET");
(Value	(new_const("Empty", ⓣ'1 SET⌝))
					handle Fail _ => Nil,	"new_const Empty");
(Value	(new_const("Insert", ⓣ'1 → '1 SET → '1 SET⌝))
					handle Fail _ => Nil,	"new_const Insert");

(Value	(new_const("Uncurry", ⓣ('a → 'b → 'c) → ('a × 'b) → 'c⌝))
					handle Fail _ => Nil,	"new_const Uncurry");
(Value	(new_const("SetComp", ⓣ(('a × 'b) → BOOL) → ('a × 'b) SET⌝))
					handle Fail _ => Nil,	"new_const SetComp");
declare_binder "SetComp";
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\section{THE TESTS}

=SML
"Start of Tests";
=TEX

%********************************************************************

\subsection{Simple Constants and Function Applications}

=SML
let
val t1_010 =	⌜1⌝;
val a1_010 =	["1"];
val t1_020 =	⌜x 1⌝;
val a1_020 =	["x 1"];
val t1_030 =	⌜x y 1⌝;
val a1_030 =	["x y 1"];
val t1_040 =	⌜x y z 1⌝;
val a1_040 =	["x y z 1"];
val t1_050 =	⌜ax bx cx dx ex fx gx hx ix jx kx lx mx
		nx ox px qx rx sx tx ux vx wx xx yx zx⌝;
val a1_050 =	["ax bx cx dx ex fx gx hx ix jx kx lx mx \
		\nx ox px qx rx sx tx ux vx wx xx yx zx"];
val t1_060 =	⌜x∧y⌝;
val a1_060 =	["x ∧ y"];

in

store_mt_results_show mt_run [
("1_010", ft, t1_010, a1_010),
("1_020", ft, t1_020, a1_020),
("1_030", ft, t1_030, a1_030),
("1_040", ft, t1_040, a1_040),
("1_050", ft, t1_050, a1_050),
("1_060", ft, t1_060, a1_060)
];

store_mt_results_show (mt_runf (op =$))[
("1_010f", uft, t1_010, t1_010),
("1_020f", uft, t1_020, t1_020),
("1_030f", uft, t1_030, t1_030),
("1_040f", uft, t1_040, t1_040),
("1_050f", uft, t1_050, t1_050),
("1_060f", uft, t1_060, t1_060)
]

end;
=TEX

Variations on constants and variables.

=SML
let
val ty1 =	ⓣBOOL⌝;
val f1 =	⌜ f1 : BOOL → (BOOL × BOOL)⌝;

val SideEffect = TypeInference.set_ti_context[f1];

val t1_100 =	mk_app(f1, mk_var("Empty", ty1));
val a1_100 =	["f1 ⓜmk_var(\"Empty\", ⓣBOOL⌝)⌝"];
val t1_110 =	mk_app(f1, mk_const("x", ty1));
val a1_110 =	["f1 ⓜmk_const(\"x\", ⓣBOOL⌝)⌝"];
val t1_120 =	mk_app(f1, mk_var("\"Xvar2X", ty1));
val a1_120 =	["f1 ⓜmk_var(\"\\\"Xvar2X\", ⓣBOOL⌝)⌝"];
val t1_130 =	mk_app(f1, mk_const("\"Xcon2X", ty1));
val a1_130 =	["f1 ⓜmk_const(\"\\\"Xcon2X\", ⓣBOOL⌝)⌝"];
val t1_140 =	mk_app(f1, mk_var("`Xvar3X", ty1));
val a1_140 =	["f1 $\"`Xvar3X\""];
val t1_150 =	mk_app(f1, mk_const("`Xcon3X", ty1));
val a1_150 =	["f1 ⓜmk_const(\"`Xcon3X\", ⓣBOOL⌝)⌝"];
val t1_160 =	mk_app(f1, mk_var("X var4 X", ty1));
val a1_160 =	["f1 $\"X var4 X\""];
val t1_170 =	mk_app(f1, mk_const("X con4 X", ty1));
val a1_170 =	["f1 ⓜmk_const(\"X con4 X\", ⓣBOOL⌝)⌝"];

in

store_mt_results_show mt_run [
("1_100", ft, t1_100, a1_100),
("1_110", ft, t1_110, a1_110),
("1_120", ft, t1_120, a1_120),
("1_130", ft, t1_130, a1_130),
("1_140", ft, t1_140, a1_140),
("1_150", ft, t1_150, a1_150),
("1_160", ft, t1_160, a1_160),
("1_170", ft, t1_170, a1_170)
];

store_mt_results_show (mt_runf (op =$))[
("1_100f", uft, t1_100, t1_100),
("1_110f", uft, t1_110, t1_110),
("1_120f", uft, t1_120, t1_120),
("1_130f", uft, t1_130, t1_130),
("1_140f", uft, t1_140, t1_140),
("1_150f", uft, t1_150, t1_150),
("1_160f", uft, t1_160, t1_160),
("1_170f", uft, t1_170, t1_170)
]
end;

TypeInference.set_ti_context nil;
=TEX

%********************************************************************

\subsection{Infix Operators}

=SML
let
val t2_010 =	⌜x∧y∧z⌝;
val a2_010 =	["x ∧ y ∧ z"];
val t2_020 =	⌜(x∧y)∧z⌝;
val a2_020 =	["(x ∧ y) ∧ z"];
val t2_030 =	⌜x∧(y∧z)⌝;
val a2_030 =	["x ∧ y ∧ z"];
val t2_040 =	⌜w∧x∧y∧z⌝;
val a2_040 =	["w ∧ x ∧ y ∧ z"];

in

store_mt_results_show mt_run [
("2_010", ft, t2_010, a2_010),
("2_020", ft, t2_020, a2_020),
("2_030", ft, t2_030, a2_030),
("2_040", ft, t2_040, a2_040)
];

store_mt_results_show (mt_runf (op =$))[
("2_010f", uft, t2_010, t2_010),
("2_020f", uft, t2_020, t2_020),
("2_030f", uft, t2_030, t2_030),
("2_040f", uft, t2_040, t2_040)
]
end;
=TEX

=SML
let
val t2_050 =	⌜(w∧x)∧y∧z⌝;
val a2_050 =	["(w ∧ x) ∧ y ∧ z"];
val t2_060 =	⌜w∧x∧(y∧z)⌝;
val a2_060 =	["w ∧ x ∧ y ∧ z"];
val t2_070 =	⌜(w∧x)∧(y∧z)⌝;
val a2_070 =	["(w ∧ x) ∧ y ∧ z"];
val t2_080 =	⌜w∧(x∧y)∧z⌝;
val a2_080 =	["w ∧ (x ∧ y) ∧ z"];

in

store_mt_results_show mt_run [
("2_050", ft, t2_050, a2_050),
("2_060", ft, t2_060, a2_060),
("2_070", ft, t2_070, a2_070),
("2_080", ft, t2_080, a2_080)
];

store_mt_results_show (mt_runf (op =$))[
("2_050f", uft, t2_050, t2_050),
("2_060f", uft, t2_060, t2_060),
("2_070f", uft, t2_070, t2_070),
("2_080f", uft, t2_080, t2_080)
]
end;
=TEX

=SML
let
val t2_090 =	⌜w∨x∧y∨z⌝;
val a2_090 =	["w ∨ x ∧ y ∨ z"];
val t2_100 =	⌜(w∨x)∧y∨z⌝;
val a2_100 =	["(w ∨ x) ∧ y ∨ z"];
val t2_110 =	⌜w∨(x∧y)∨z⌝;
val a2_110 =	["w ∨ x ∧ y ∨ z"];
val t2_120 =	⌜w∧(x∨y)∧z⌝;
val a2_120 =	["w ∧ (x ∨ y) ∧ z"];
val t2_130 =	⌜w∨x∧(y∨z)⌝;
val a2_130 =	["w ∨ x ∧ (y ∨ z)"];
val t2_140 =	⌜(w∨x)∧(y∨z)⌝;
val a2_140 =	["(w ∨ x) ∧ (y ∨ z)"];

in

store_mt_results_show mt_run [
("2_090", ft, t2_090, a2_090),
("2_100", ft, t2_100, a2_100),
("2_110", ft, t2_110, a2_110),
("2_120", ft, t2_120, a2_120),
("2_130", ft, t2_130, a2_130),
("2_140", ft, t2_140, a2_140)
];

store_mt_results_show (mt_runf (op =$)) [
("2_090f", uft, t2_090, t2_090),
("2_100f", uft, t2_100, t2_100),
("2_110f", uft, t2_110, t2_110),
("2_120f", uft, t2_120, t2_120),
("2_130f", uft, t2_130, t2_130),
("2_140f", uft, t2_140, t2_140)
]
end;
=TEX

=SML
let
val t2_150 =	⌜f w∨g x∧h y∨j z⌝;
val a2_150 =	["f w ∨ g x ∧ h y ∨ j z"];
val t2_160 =	⌜(f w∨g x)∧h y∨j z⌝;
val a2_160 =	["(f w ∨ g x) ∧ h y ∨ j z"];
val t2_170 =	⌜f w∨(g x∧h y)∨j z⌝;
val a2_170 =	["f w ∨ g x ∧ h y ∨ j z"];
val t2_180 =	⌜f w∨g x∧(h y∨j z)⌝;
val a2_180 =	["f w ∨ g x ∧ (h y ∨ j z)"];
val t2_190 =	⌜(f w∨g x)∧(h y∨j z)⌝;
val a2_190 =	["(f w ∨ g x) ∧ (h y ∨ j z)"];

=IGN
val t2_150 =	⌜f w∨g x∧h y∨j z⌝;
val a2_150 =	["(f w) ∨ (g x) ∧ (h y) ∨ (j z)"];
val t2_160 =	⌜(f w∨g x)∧h y∨j z⌝;
val a2_160 =	["((f w) ∨ (g x)) ∧ (h y) ∨ (j z)"];
val t2_170 =	⌜f w∨(g x∧h y)∨j z⌝;
val a2_170 =	["(f w) ∨ (g x) ∧ (h y) ∨ (j z)"];
val t2_180 =	⌜f w∨g x∧(h y∨j z)⌝;
val a2_180 =	["(f w) ∨ (g x) ∧ ((h y) ∨ (j z))"];
val t2_190 =	⌜(f w∨g x)∧(h y∨j z)⌝;
val a2_190 =	["((f w) ∨ (g x)) ∧ ((h y) ∨ (j z))"];
=SML

in

store_mt_results_show mt_run[
("2_150", ft, t2_150, a2_150),
("2_160", ft, t2_160, a2_160),
("2_170", ft, t2_170, a2_170),
("2_180", ft, t2_180, a2_180),
("2_190", ft, t2_190, a2_190)
];

store_mt_results_show (mt_runf (op =$))[
("2_150f", uft, t2_150, t2_150),
("2_160f", uft, t2_160, t2_160),
("2_170f", uft, t2_170, t2_170),
("2_180f", uft, t2_180, t2_180),
("2_190f", uft, t2_190, t2_190)
]
end;
=TEX

=SML
let
val t2_200 =	⌜f (w∨g) (x∧h) (y∨j) z⌝;
val a2_200 =	["f (w ∨ g) (x ∧ h) (y ∨ j) z"];
val t2_210 =	⌜(f (w∨g) x)∧h (y∨j) z⌝;
val a2_210 =	["f (w ∨ g) x ∧ h (y ∨ j) z"];

in

store_mt_results_show mt_run [
("2_200", ft, t2_200, a2_200),
("2_210", ft, t2_210, a2_210)
];

store_mt_results_show (mt_runf (op =$))[
("2_200f", uft, t2_200, t2_200),
("2_210f", uft, t2_210, t2_210)
]
end;
=TEX

Before issue~2.8 of~\cite{DS/FMU/IED/IMP032} the pretty printer added
extra brackets on some outer level terms.  This was due to nonfix
constants and variables being printed as a functional application which
had no arguments being given the wrong precedance for the bracket
insertion checks.

We need a constant for this test.

=SML
(Value	(new_const("T_221", ⓣBOOL → BOOL⌝))
	handle Fail _ => Nil,	"new_const T_221");

let
val t2_220 =	⌜x⌝;
val a2_220 =	["x"];
val a2_220t =	["x : 'a"];
val t2_221 =	⌜T_221⌝;
val a2_221 =	["T_221"];
val a2_221t =	["T_221 : BOOL → BOOL"];
in

set_flag("pp_show_HOL_types", false);

store_mt_results_show mt_run [
("2_220", ft, t2_220, a2_220),
("2_221", ft, t2_221, a2_221)
];

store_mt_results_show (mt_runf (op =$))[
("2_220f", uft, t2_220, t2_220),
("2_221f", uft, t2_221, t2_221)
];

set_flag("pp_show_HOL_types", true);

store_mt_results_show mt_run [
("2_220t", ft, t2_220, a2_220t),
("2_221t", ft, t2_221, a2_221t)
];

store_mt_results_show (mt_runf (op =$))[
("2_220tf", uft, t2_220, t2_220),
("2_221tf", uft, t2_221, t2_221)
];

set_flag("pp_show_HOL_types", false)

end;
=TEX

Prefix and Postfix Operators.

=SML
declare_prefix(300, "pref300");
declare_prefix(400, "pref400");
declare_postfix(300, "post300");
declare_postfix(400, "post400");

let
val t2_410 =	⌜f (pref300 pref300 pref300 x) g⌝;
val a2_410 =	["f (pref300 pref300 pref300 x) g"];
val t2_420 =	⌜f (x post300 post300 post300) g⌝;
val a2_420 =	["f (x post300 post300 post300) g"];

val t2_430 =	⌜f (pref300 pref400 pref300 x) g⌝;
val a2_430 =	["f (pref300 pref400 (pref300 x)) g"];
val t2_440 =	⌜f (x post300 post400 post300) g⌝;
val a2_440 =	["f ((x post300) post400 post300) g"];

in
store_mt_results_show mt_run [
("2_410", ft, t2_410, a2_410),
("2_420", ft, t2_420, a2_420),
("2_430", ft, t2_430, a2_430),
("2_440", ft, t2_440, a2_440)
];

store_mt_results_show (mt_runf (op =$))[
("2_410f", uft, t2_410, t2_410),
("2_420f", uft, t2_420, t2_420),
("2_430f", uft, t2_430, t2_430),
("2_440f", uft, t2_440, t2_440)
]
end;

let
val t2_450 =	⌜f (pref300 pref300 pref300 (x y)) g⌝;
val a2_450 =	["f (pref300 pref300 pref300 x y) g"];
val t2_460 =	⌜f ((x y) post300 post300 post300) g⌝;
val a2_460 =	["f (x y post300 post300 post300) g"];

val t2_470 =	⌜f (pref300 pref400 pref300 (x y)) g⌝;
val a2_470 =	["f (pref300 pref400 (pref300 x y)) g"];
val t2_480 =	⌜f ((x y) post300 post400 post300) g⌝;
val a2_480 =	["f ((x y post300) post400 post300) g"];

in
store_mt_results_show mt_run [
("2_450", ft, t2_450, a2_450),
("2_460", ft, t2_460, a2_460),
("2_470", ft, t2_470, a2_470),
("2_480", ft, t2_480, a2_480)
];

store_mt_results_show (mt_runf (op =$))[
("2_450f", uft, t2_450, t2_450),
("2_460f", uft, t2_460, t2_460),
("2_470f", uft, t2_470, t2_470),
("2_480f", uft, t2_480, t2_480)
]
end;

declare_nonfix "pref300";
declare_nonfix "pref400";
declare_nonfix "post300";
declare_nonfix "post400";
=TEX

Now some mixed fixity terms taken from~\cite{DS/FMU/IED/DEF001}.

=SML
declare_infix(1, "I1");
declare_infix(4, "I4");
declare_prefix(2, "R2");
declare_prefix(5, "R5");
declare_postfix(3, "S3");
declare_postfix(6, "S6");

let
val t2_510 =	⌜(t I4 u) I1 v⌝;
val a2_510 =	["t I4 u I1 v"];

val t2_520 =	⌜t I1 (u I4 v)⌝;
val a2_520 =	["t I1 u I4 v"];

val t2_530 =	⌜(t I4 u) I4 v⌝;
val a2_530 =	["(t I4 u) I4 v"];

val t2_531 =	⌜t I4 (u I4 v)⌝;
val a2_531 =	["t I4 u I4 v"];

val t2_540 =	⌜R2 (R5 t)⌝;
val a2_540 =	["R2 R5 t"];

val t2_550 =	⌜R5 (R2 t)⌝;
val a2_550 =	["R5 (R2 t)"];

val t2_560 =	⌜(t S6) S3⌝;
val a2_560 =	["t S6 S3"];

val t2_570 =	⌜(t S3) S6⌝;
val a2_570 =	["(t S3) S6"];

val t2_580 =	⌜(R5 t) S3⌝;
val a2_580 =	["R5 t S3"];

val t2_581 =	⌜R5 (t S3)⌝;
val a2_581 =	["R5 (t S3)"];

val t2_590 =	⌜R2 (t S6)⌝;
val a2_590 =	["R2 t S6"];

val t2_591 =	⌜(R2 t) S6⌝;
val a2_591 =	["(R2 t) S6"];

val t2_600 =	⌜(R5 t) I1 (u S6)⌝;
val a2_600 =	["R5 t I1 u S6"];

val t2_610 =	⌜R2 ((t I4 u) S3)⌝;
val a2_610 =	["R2 t I4 u S3"];

in

store_mt_results_show mt_run [
("2_510", ft, t2_510, a2_510),
("2_520", ft, t2_520, a2_520),
("2_530", ft, t2_530, a2_530),
("2_531", ft, t2_531, a2_531),
("2_540", ft, t2_540, a2_540),
("2_550", ft, t2_550, a2_550),
("2_560", ft, t2_560, a2_560),
("2_570", ft, t2_570, a2_570),
("2_580", ft, t2_580, a2_580),
("2_590", ft, t2_590, a2_590),
("2_591", ft, t2_591, a2_591),
("2_600", ft, t2_600, a2_600),
("2_610", ft, t2_610, a2_610)
];

store_mt_results_show (mt_runf (op =$))[
("2_510f", uft, t2_510, t2_510),
("2_520f", uft, t2_520, t2_520),
("2_530f", uft, t2_530, t2_530),
("2_540f", uft, t2_540, t2_540),
("2_550f", uft, t2_550, t2_550),
("2_560f", uft, t2_560, t2_560),
("2_570f", uft, t2_570, t2_570),
("2_580f", uft, t2_580, t2_580),
("2_590f", uft, t2_590, t2_590),
("2_591f", uft, t2_591, t2_591),
("2_600f", uft, t2_600, t2_600),
("2_610f", uft, t2_610, t2_610)
]
end;

declare_nonfix "I1";
declare_nonfix "I4";
declare_nonfix "R2";
declare_nonfix "R5";
declare_nonfix "S3";
declare_nonfix "S6";
=TEX

%********************************************************************

\subsection{Conditionals}

=SML
let
val t3_010 =	⌜if x = y then 1 else z⌝;
val a3_010 =	["if x = y then 1 else z"];
val t3_020 =	⌜if x = y then if x = yy then 2 else 3 else z⌝;
val a3_020 =	["if x = y then if x = yy then 2 else 3 else z"];
val t3_030 =	⌜if x = y then 1 else if x = yy then 2 else 3⌝;
val a3_030 =	["if x = y then 1 else if x = yy then 2 else 3"];
val t3_031 =	⌜	if	a1 then a2
			else if	b1 then b2
			else if	c1 then c2
			else if	d1 then d2
			else if	e1 then e2
			else f⌝;
val a3_031 =	["if a1 then a2 else if b1 then b2 else if c1 then c2 \
		\else if d1 then d2 else if e1 then e2 else f"];

in

store_mt_results_show mt_run [
("3_010", ft, t3_010, a3_010),
("3_020", ft, t3_020, a3_020),
("3_030", ft, t3_030, a3_030)
,("3_031", ft, t3_031, a3_031)
];

store_mt_results_show (mt_runf (op =$))[
("3_010f", uft, t3_010, t3_010),
("3_020f", uft, t3_020, t3_020),
("3_030f", uft, t3_030, t3_030)
,("3_031f", uft, t3_031, t3_031)
]
end;
=TEX

Tests $t3_041$ to $t3_045$ are from examples in~\cite{DS/FMU/IED/DTD032}.

=SML
let
val t3_040 =	⌜if x = y then z else w ∧ z⌝;
val a3_040 =	["if x = y then z else w ∧ z"];

val t3_041 =	⌜(if a1 then a2 else a3) ∨ b⌝;
val a3_041 =	["(if a1 then a2 else a3) ∨ b"];
val t3_042 =	⌜a ∨ if b1 then b2 else b3⌝;
val a3_042 =	["a ∨ (if b1 then b2 else b3)"];
val t3_043 =	⌜(if a1 then a2 else a3) ∨ b ∧ c⌝;
val a3_043 =	["(if a1 then a2 else a3) ∨ b ∧ c"];
val t3_044 =	⌜a ∨ (if b1 then b2 else b3) ∧ c⌝;
val a3_044 =	["a ∨ (if b1 then b2 else b3) ∧ c"];
val t3_045 =	⌜ (a ∧ (b ∧ (c ∧ (d ∧ (e ∧ (if f then g else h)))))) ∨ i ⌝;
val a3_045 =	["a ∧ b ∧ c ∧ d ∧ e ∧ (if f then g else h) ∨ i"];

val t3_050 =	⌜if x = y then if x = yy then w ∧ z1 else w ∧ z2 else w ∧ z3⌝;
val a3_050 =	["if x = y then if x = yy then w ∧ z1 else w ∧ z2 else w ∧ z3"];
val t3_060 =	⌜(if x = y then w ∧ z1 else if x = yy then w ∧ z2 else w) ∧ z3⌝;
val a3_060 =	["(if x = y then w ∧ z1 else if x = yy then w ∧ z2 else w) ∧ z3"];
val t3_070 =	⌜(a ∧ if x = y then w ∧ z1 else if x = yy then w ∧ z2 else w) ∧ z3⌝;
val a3_070 =	["(a ∧ (if x = y then w ∧ z1 else if \
		\x = yy then w ∧ z2 else w)) ∧ z3"];
val t3_080 =	⌜a ∧ (if x = y then w ∧ z1 else if x = yy then w ∧ z2 else w) ∧ z3⌝;
val a3_080 =	["a ∧ (if x = y then w ∧ z1 else if x = yy then w ∧ z2 else w) ∧ z3"];
val t3_090 =	⌜(a ∧ (if x = y then w ∧ z1 else if x = yy then w ∧ z2 else w)) ∧ z3⌝;
val a3_090 =	["(a ∧ (if x = y then w ∧ z1 else if \
		\x = yy then w ∧ z2 else w)) ∧ z3"];
val t3_100 =	⌜a ∧ ((if x = y then w ∧ z1 else if x = yy then w ∧ z2 else w) ∧ z3)⌝;
val a3_100 =	["a ∧ (if x = y then w ∧ z1 else if x = yy then w ∧ z2 else w) ∧ z3"];

in

store_mt_results_show mt_run [
("3_040", ft, t3_040, a3_040),
("3_041", ft, t3_041, a3_041),
("3_042", ft, t3_042, a3_042),
("3_043", ft, t3_043, a3_043),
("3_044", ft, t3_044, a3_044),
("3_045", ft, t3_045, a3_045),
("3_050", ft, t3_050, a3_050),
("3_060", ft, t3_060, a3_060),
("3_070", ft, t3_070, a3_070),
("3_080", ft, t3_080, a3_080),
("3_090", ft, t3_090, a3_090),
("3_100", ft, t3_100, a3_100)
];

store_mt_results_show (mt_runf (op =$))[
("3_040f", uft, t3_040, t3_040),
("3_041f", uft, t3_041, t3_041),
("3_042f", uft, t3_042, t3_042),
("3_043f", uft, t3_043, t3_043),
("3_044f", uft, t3_044, t3_044),
("3_045f", uft, t3_045, t3_045),
("3_050f", uft, t3_050, t3_050),
("3_060f", uft, t3_060, t3_060),
("3_070f", uft, t3_070, t3_070),
("3_080f", uft, t3_080, t3_080),
("3_090f", uft, t3_090, t3_090),
("3_100f", uft, t3_100, t3_100)
]
end;
=TEX

=SML
let
val t3_110 =	⌜(if a then b else c d e f)⌝;
val a3_110 =	["if a then b else c d e f"];
val t3_120 =	⌜(if a then b else c) d e f⌝;
val a3_120 =	["(if a then b else c) d e f"];
val t3_130 =	⌜p q r (if a then b else c d e f)⌝;
val a3_130 =	["p q r (if a then b else c d e f)"];
val t3_140 =	⌜p q r (if a then b else c) d e f⌝;
val a3_140 =	["p q r (if a then b else c) d e f"];
val t3_150 =	⌜p q r (if a then b else c) d e f⌝;
val a3_150 =	["p q r (if a then b else c) d e f"];
val t3_160 =	⌜p q r ((if a then b else c) d e f)⌝;
val a3_160 =	["p q r ((if a then b else c) d e f)"];

in

store_mt_results_show mt_run[
("3_110", ft, t3_110, a3_110),
("3_120", ft, t3_120, a3_120),
("3_130", ft, t3_130, a3_130),
("3_140", ft, t3_140, a3_140),
("3_150", ft, t3_150, a3_150),
("3_160", ft, t3_160, a3_160)
];

store_mt_results_show (mt_runf (op =$))[
("3_110f", uft, t3_110, t3_110),
("3_120f", uft, t3_120, t3_120),
("3_130f", uft, t3_130, t3_130),
("3_140f", uft, t3_140, t3_140),
("3_150f", uft, t3_150, t3_150),
("3_160f", uft, t3_160, t3_160)
]
end;
=TEX

%********************************************************************

\subsection{Binder Terms}

=SML
let
val t4_010 =	⌜λ x ⦁ x⌝;
val a4_010 =	["λ x⦁ x"];
val t4_020 =	⌜λ x ⦁ y⌝;
val a4_020 =	["λ x⦁ y"];
val t4_030 =	⌜λ x ⦁ x y⌝;
val a4_030 =	["λ x⦁ x y"];
val t4_040 =	⌜(λ x ⦁ x) y⌝;
val a4_040 =	["(λ x⦁ x) y"];
val t4_050 =	⌜λ x ⦁ (x y)⌝;
val a4_050 =	["λ x⦁ x y"];
val t4_060 =	⌜w λ x ⦁ x y⌝;
val a4_060 =	["w (λ x⦁ x y)"];
val t4_070 =	⌜w (λ x ⦁ x) y⌝;
val a4_070 =	["w (λ x⦁ x) y"];
val t4_080 =	⌜w (λ x ⦁ (x y))⌝;
val a4_080 =	["w (λ x⦁ x y)"];
val t4_090 =	⌜(w (λ x ⦁ x)) y⌝;
val a4_090 =	["w (λ x⦁ x) y"];

in

store_mt_results_show mt_run[
("4_010", ft, t4_010, a4_010),
("4_020", ft, t4_020, a4_020),
("4_030", ft, t4_030, a4_030),
("4_040", ft, t4_040, a4_040),
("4_050", ft, t4_050, a4_050),
("4_060", ft, t4_060, a4_060),
("4_070", ft, t4_070, a4_070),
("4_080", ft, t4_080, a4_080),
("4_090", ft, t4_090, a4_090)
];

store_mt_results_show (mt_runf (op =$))[
("4_010f", uft, t4_010, t4_010),
("4_020f", uft, t4_020, t4_020),
("4_030f", uft, t4_030, t4_030),
("4_040f", uft, t4_040, t4_040),
("4_050f", uft, t4_050, t4_050),
("4_060f", uft, t4_060, t4_060),
("4_070f", uft, t4_070, t4_070),
("4_080f", uft, t4_080, t4_080),
("4_090f", uft, t4_090, t4_090)
]
end;
=TEX

=SML
let
val t4_100 =	⌜∀ x ⦁ x⌝;
val a4_100 =	["∀ x⦁ x"];
val t4_110 =	⌜∀ x ⦁ (x y)⌝;
val a4_110 =	["∀ x⦁ x y"];
val t4_120 =	⌜w ∀ x ⦁ x⌝;
val a4_120 =	["w (∀ x⦁ x)"];
val t4_130 =	⌜w (∀ x ⦁ x)⌝;
val a4_130 =	["w (∀ x⦁ x)"];

in

store_mt_results_show (mt_runf (op =$))[
("4_100f", uft, t4_100, t4_100),
("4_110f", uft, t4_110, t4_110),
("4_120f", uft, t4_120, t4_120),
("4_130f", uft, t4_130, t4_130)
];

store_mt_results_show mt_run[
("4_100", ft, t4_100, a4_100),
("4_110", ft, t4_110, a4_110),
("4_120", ft, t4_120, a4_120),
("4_130", ft, t4_130, a4_130)
]
end;
=TEX

=SML
let
val t4_140 =	⌜(∀ w ⦁ w)∧(∀ x ⦁ x)∧(∀ y ⦁ y)∧(∀ z ⦁ z)⌝;
val a4_140 =	["(∀ w⦁ w) ∧ (∀ x⦁ x) ∧ (∀ y⦁ y) ∧ (∀ z⦁ z)"];
val t4_150 =	⌜((∀ w ⦁ w)∧(∀ x ⦁ x))∧(∀ y ⦁ y)∧(∀ z ⦁ z)⌝;
val a4_150 =	["((∀ w⦁ w) ∧ (∀ x⦁ x)) ∧ (∀ y⦁ y) ∧ (∀ z⦁ z)"];
val t4_160 =	⌜(∀ w ⦁ w)∧(∀ x ⦁ x)∧((∀ y ⦁ y)∧(∀ z ⦁ z))⌝;
val a4_160 =	["(∀ w⦁ w) ∧ (∀ x⦁ x) ∧ (∀ y⦁ y) ∧ (∀ z⦁ z)"];
val t4_170 =	⌜((∀ w ⦁ w)∧(∀ x ⦁ x))∧((∀ y ⦁ y)∧(∀ z ⦁ z))⌝;
val a4_170 =	["((∀ w⦁ w) ∧ (∀ x⦁ x)) ∧ (∀ y⦁ y) ∧ (∀ z⦁ z)"];
val t4_180 =	⌜(∀ w ⦁ w)∧((∀ x ⦁ x)∧(∀ y ⦁ y))∧(∀ z ⦁ z)⌝;
val a4_180 =	["(∀ w⦁ w) ∧ ((∀ x⦁ x) ∧ (∀ y⦁ y)) ∧ (∀ z⦁ z)"];

in

store_mt_results_show mt_run[
("4_140", ft, t4_140, a4_140),
("4_150", ft, t4_150, a4_150),
("4_160", ft, t4_160, a4_160),
("4_170", ft, t4_170, a4_170),
("4_180", ft, t4_180, a4_180)
];

store_mt_results_show (mt_runf (op =$))[
("4_140f", uft, t4_140, t4_140),
("4_150f", uft, t4_150, t4_150),
("4_160f", uft, t4_160, t4_160),
("4_170f", uft, t4_170, t4_170),
("4_180f", uft, t4_180, t4_180)
]
end;
=TEX

=SML
let
val t4_190 =	⌜λ x ⦁ x∧y⌝;
val a4_190 =	["λ x⦁ x ∧ y"];
val t4_200 =	⌜λ x ⦁ if x then y else z⌝;
val a4_200 =	["λ x⦁ if x then y else z"];

in

store_mt_results_show mt_run[
("4_190", ft, t4_190, a4_190),
("4_200", ft, t4_200, a4_200)
];

store_mt_results_show (mt_runf (op =$))[
("4_190f", uft, t4_190, t4_190),
("4_200f", uft, t4_200, t4_200)
]
end;
=TEX

=SML
let
val t4_210 =	⌜∀ x ⦁ y = if x then 1 else 2⌝;
val a4_210 =	["∀ x⦁ y = (if x then 1 else 2)"];
val t4_220 =	⌜(∀ x ⦁ y) = (if x then p else q)⌝;
val a4_220 =	["(∀ x⦁ y) ⇔ (if x then p else q)"];

in

store_mt_results_show mt_run[
("4_210", ft, t4_210, a4_210),
("4_220", ft, t4_220, a4_220)
];

store_mt_results_show (mt_runf (op =$))[
("4_210f", uft, t4_210, t4_210),
("4_220f", uft, t4_220, t4_220)
]
end;
=TEX

=SML
let
val t4_230 =	⌜∀x⦁∀y⦁∀z⦁x∧y∧z⌝;
val a4_230 =	["∀ x y z⦁ x ∧ y ∧ z"];
val t4_240 =	⌜∃x⦁∀y⦁∃z⦁x∧y∧z⌝;
val a4_240 =	["∃ x⦁ ∀ y⦁ ∃ z⦁ x ∧ y ∧ z"];

in

store_mt_results_show mt_run[
("4_230", ft, t4_230, a4_230),
("4_240", ft, t4_240, a4_240)
];

store_mt_results_show (mt_runf (op =$))[
("4_230f", uft, t4_230, t4_230),
("4_240f", uft, t4_240, t4_240)
]
end;
=TEX

=SML
let
val t4_250 =	⌜f = λ x ⦁ λ y ⦁ x∧y⌝;
val a4_250 =	["f = (λ x y⦁ x ∧ y)"];
val t4_260 =	⌜f = λ (x,y) ⦁ x∧y⌝;
val a4_260 =	["f = (λ (x, y)⦁ x ∧ y)"];


in

store_mt_results_show mt_run[
("4_250", ft, t4_250, a4_250),
("4_260", ft, t4_260, a4_260)
];

store_mt_results_show (mt_runf (op =$))[
("4_250f", uft, t4_250, t4_250),
("4_260f", uft, t4_260, t4_260)
]
end;
=TEX

Binders with varstructs.

=SML
let
val t4_265 =	⌜∀ a ⦁ x⌝;
val a4_265 =	["∀ a⦁ x"];
val t4_270 =	⌜λ a ⦁ x⌝;
val a4_270 =	["λ a⦁ x"];

in

store_mt_results_show mt_run[
("4_265", ft, t4_265, a4_265),
("4_270", ft, t4_270, a4_270)
];

store_mt_results_show (mt_runf (op =$))[
("4_265f", uft, t4_265, t4_265),
("4_270f", uft, t4_270, t4_270)
]
end;
=TEX

=SML
let

val t4_280 =	⌜∀ (a,b) ⦁ x⌝;
val a4_280 =	["∀ (a, b)⦁ x"];
val t4_290 =	⌜∀ (a,b,c) ⦁ x⌝;
val a4_290 =	["∀ (a, b, c)⦁ x"];
val t4_300 =	⌜∀ (a,b,c,d) ⦁ x⌝;
val a4_300 =	["∀ (a, b, c, d)⦁ x"];
val t4_310 =	⌜λ (a,b) ⦁ x⌝;
val a4_310 =	["λ (a, b)⦁ x"];
val t4_320 =	⌜λ (a,b,c) ⦁ x⌝;
val a4_320 =	["λ (a, b, c)⦁ x"];
val t4_330 =	⌜λ (a,b,c,d) ⦁ x⌝;
val a4_330 =	["λ (a, b, c, d)⦁ x"];

in

store_mt_results_show mt_run[
("4_280", ft, t4_280, a4_280),
("4_290", ft, t4_290, a4_290),
("4_300", ft, t4_300, a4_300),
("4_310", ft, t4_310, a4_310),
("4_320", ft, t4_320, a4_320),
("4_330", ft, t4_330, a4_330)
];

store_mt_results_show (mt_runf (op =$))[
("4_280f", uft, t4_280, t4_280),
("4_290f", uft, t4_290, t4_290),
("4_300f", uft, t4_300, t4_300),
("4_310f", uft, t4_310, t4_310),
("4_320f", uft, t4_320, t4_320),
("4_330f", uft, t4_330, t4_330)
]
end;
=TEX

=SML
let

val t4_340 =	⌜∀ a b c ⦁ d⌝;
val a4_340 =	["∀ a b c⦁ d"];
val t4_350 =	⌜∀ a ⦁ ∀ b ⦁ ∀ c ⦁ d⌝;
val a4_350 =	["∀ a b c⦁ d"];
val t4_360 =	⌜λ a b c ⦁ d⌝;
val a4_360 =	["λ a b c⦁ d"];
val t4_370 =	⌜λ a ⦁ λ b ⦁ λ c ⦁ d⌝;
val a4_370 =	["λ a b c⦁ d"];

in

store_mt_results_show mt_run[
("4_340", ft, t4_340, a4_340),
("4_350", ft, t4_350, a4_350),
("4_360", ft, t4_360, a4_360),
("4_370", ft, t4_370, a4_370)
];

store_mt_results_show (mt_runf (op =$))[
("4_340f", uft, t4_340, t4_340),
("4_350f", uft, t4_350, t4_350),
("4_360f", uft, t4_360, t4_360),
("4_370f", uft, t4_370, t4_370)
]
end;
=TEX

=SML
let

val t4_380 =	⌜∀ (((a,b),c),d) ⦁ x⌝;
val a4_380 =	["∀ (((a, b), c), d)⦁ x"];
val t4_390 =	⌜∀ ((a,b),(c,d)) ⦁ x⌝;
val a4_390 =	["∀ ((a, b), c, d)⦁ x"];
val t4_400 =	⌜λ (((a,b),c),d) ⦁ x⌝;
val a4_400 =	["λ (((a, b), c), d)⦁ x"];
val t4_410 =	⌜λ ((a,b),(c,d)) ⦁ x⌝;
val a4_410 =	["λ ((a, b), c, d)⦁ x"];

in

store_mt_results_show mt_run[
("4_380", ft, t4_380, a4_380),
("4_390", ft, t4_390, a4_390),
("4_400", ft, t4_400, a4_400),
("4_410", ft, t4_410, a4_410)
];

store_mt_results_show (mt_runf (op =$))[
("4_380f", uft, t4_380, t4_380),
("4_390f", uft, t4_390, t4_390),
("4_400f", uft, t4_400, t4_400),
("4_410f", uft, t4_410, t4_410)
]
end;
=TEX

Note that `$o$' is functional composition, so use `$oo$' here.

=SML
let

val t4_420 =	⌜∀ ((a,((b,(c,(d,((e,f),(g,h)),i,(j,k,l),m),n)),oo)),p) ⦁ x⌝;
val a4_420 =	["∀ ((a, (b, c, (d, ((e, f), g, h), i, (j, k, l), m), n), oo), p)⦁ x"];
val t4_430 =	⌜λ (a,b,(c,(d,e,f),g),((h,i),j),(k,(l,(m,n))),oo,p) ⦁ x⌝;
val a4_430 =	["λ (a, b, (c, (d, e, f), g), ((h, i), j), (k, l, m, n), oo, p)⦁ x"];

in

store_mt_results_show mt_run[
("4_420", ft, t4_420, a4_420),
("4_430", ft, t4_430, a4_430)
];

store_mt_results_show (mt_runf (op =$))[
("4_420f", uft, t4_420, t4_420),
("4_430f", uft, t4_430, t4_430)
]
end;
=TEX

Some binders where types are to be shown.

=SML
let

val t4_440 =	⌜∀ a b c d ⦁ a = b ∧ a = c ∧ a = d⌝;
val a4_440 =	["∀ a b c d⦁ a = b ∧ a = c ∧ a = d"];
val l4_440 =	["∀ a b c d : 'a⦁ a = b ∧ a = c ∧ a = d"];

val t4_450 =	⌜∀ a b c d ⦁ a = b ∧ c = d⌝;
val a4_450 =	["∀ a b c d⦁ a = b ∧ c = d"];
val l4_450 =	["∀ a b : 'a; c d : 'b⦁ a = b ∧ c = d"];

val t4_460 =	⌜λ a b c d ⦁ a = b ∧ a = c ∧ a = d⌝;
val a4_460 =	["λ a b c d⦁ a = b ∧ a = c ∧ a = d"];
val l4_460 =	["λ a b c d : 'a⦁ a = b ∧ a = c ∧ a = d"];

val t4_470 =	⌜λ a b c d ⦁ a = b ∧ c = d⌝;
val a4_470 =	["λ a b c d⦁ a = b ∧ c = d"];
val l4_470 =	["λ a b : 'a; c d : 'b⦁ a = b ∧ c = d"];

val t4_480 =	⌜∀ (a1, a2) (b1, b2) ((c1, c2), c3) ((d1, d2), d3)
		⦁ (a1, a2) = (b1, b2)
		∧ ((c1, c2), c3) = ((d1, d2), d3)⌝;
val a4_480 =	["∀ (a1, a2) (b1, b2) ((c1, c2), c3) ((d1, d2), d3)"
		^"⦁ (a1, a2) = (b1, b2)"
		^" ∧ ((c1, c2), c3) = ((d1, d2), d3)"];
val l4_480 =	["∀ (a1, a2) (b1, b2) : 'a × 'b;"
		^" ((c1, c2), c3) ((d1, d2), d3) : ('c × 'd) × 'e"
		^"⦁ (a1, a2) = (b1, b2)"
		^" ∧ ((c1, c2), c3) = ((d1, d2), d3)"];

val t4_490 =	⌜∀ (a1, (a2, a3)) (b1, (b2, b3)) ((c1, c2), c3) ((d1, d2), d3) ⦁ x⌝;
val a4_490 =	["∀ (a1, a2, a3) (b1, b2, b3) ((c1, c2), c3) ((d1, d2), d3)⦁ x"];
val l4_490 =	["∀ (a1, a2, a3) : 'a × 'b × 'c;"
		^" (b1, b2, b3) : 'd × 'e × 'f;"
		^" ((c1, c2), c3) :"
		^" ('g × 'h) × 'i;"
		^" ((d1, d2), d3) : ('j × 'k) × 'l⦁ x"];

val t4_500 =	⌜∀ (a1, (a2, a3)) (b1, (b2, b3)) ((c1, c2), c3) ((d1, d2), d3)
		⦁ (a1, (a2, a3)) = (b1, (b2, b3))
		∧ ((c1, c2), c3) = ((d1, d2), d3)⌝;
val a4_500 =	["∀ (a1, a2, a3) (b1, b2, b3) ((c1, c2), c3) ((d1, d2), d3)"
		^"⦁ (a1, a2, a3) = (b1, b2, b3)"
		^" ∧ ((c1, c2), c3) = ((d1, d2), d3)"];
val l4_500 =	["∀ (a1, a2, a3) (b1, b2, b3) : 'a × 'b × 'c;"
		^" ((c1, c2), c3) ((d1, d2), d3) :"
		^" ('d × 'e) × 'f"
		^"⦁ (a1, a2, a3) = (b1, b2, b3)"
		^" ∧ ((c1, c2), c3) = ((d1, d2), d3)"];

val t4_510 =	⌜∀ (a1, (a2, a3)) (b1, (b2, b3)) ((c1, c2), c3) ((d1, d2), d3)
		⦁ a1 = b1 ∧ a2 = b2 ∧ a3 = b3
		∧ a1 = c1 ∧ a2 = c2 ∧ a3 = c3
		∧ a1 = d1 ∧ a2 = d2 ∧ a3 = d3⌝;
val a4_510 =	["∀ (a1, a2, a3) (b1, b2, b3) ((c1, c2), c3) ((d1, d2), d3)"
		^"⦁ a1 = b1 ∧ a2 = b2 ∧ a3 = b3"
		^" ∧ a1 = c1 ∧ a2 = c2 ∧ a3 = c3"
		^" ∧ a1 = d1 ∧ a2 = d2 ∧ a3 = d3"];
val l4_510 =	["∀ (a1, a2, a3) (b1, b2, b3) : 'a × 'b × 'c;"
		^" ((c1, c2), c3) ((d1, d2), d3) : ('a × 'b) × 'c"
		^"⦁ a1 = b1 ∧ a2 = b2 ∧ a3 = b3"
		^" ∧ a1 = c1 ∧ a2 = c2 ∧ a3 = c3"
		^" ∧ a1 = d1 ∧ a2 = d2 ∧ a3 = d3"];

val t4_520 =	⌜∀ (a1, (a2, a3)) (b1, (b2, b3)) (c1, (c2, c3)) (d1, (d2, d3))
		⦁ a1 = b1 ∧ a2 = b2 ∧ a3 = b3
		∧ a1 = c1 ∧ a2 = c2 ∧ a3 = c3
		∧ a1 = d1 ∧ a2 = d2 ∧ a3 = d3⌝;
val a4_520 =	["∀ (a1, a2, a3) (b1, b2, b3) (c1, c2, c3) (d1, d2, d3)"
		^"⦁ a1 = b1 ∧ a2 = b2 ∧ a3 = b3"
		^" ∧ a1 = c1 ∧ a2 = c2 ∧ a3 = c3"
		^" ∧ a1 = d1 ∧ a2 = d2 ∧ a3 = d3"];
val l4_520 =	["∀ (a1, a2, a3) (b1, b2, b3)"
		^" (c1, c2, c3) (d1, d2, d3) : 'a × 'b × 'c"
		^"⦁ a1 = b1 ∧ a2 = b2 ∧ a3 = b3"
		^" ∧ a1 = c1 ∧ a2 = c2 ∧ a3 = c3"
		^" ∧ a1 = d1 ∧ a2 = d2 ∧ a3 = d3"];

in

store_mt_results_show mt_run[
("4_440", ft, t4_440, a4_440),
("4_450", ft, t4_450, a4_450),
("4_460", ft, t4_460, a4_460),
("4_470", ft, t4_470, a4_470),
("4_480", ft, t4_480, a4_480),
("4_490", ft, t4_490, a4_490),
("4_500", ft, t4_500, a4_500),
("4_510", ft, t4_510, a4_510),
("4_520", ft, t4_520, a4_520)
];

store_mt_results_show (mt_runf (op =$))[
("4_440f", uft, t4_440, t4_440),
("4_450f", uft, t4_450, t4_450),
("4_460f", uft, t4_460, t4_460),
("4_470f", uft, t4_470, t4_470),
("4_480f", uft, t4_480, t4_480),
("4_490f", uft, t4_490, t4_490),
("4_500f", uft, t4_500, t4_500),
("4_510f", uft, t4_510, t4_510),
("4_520f", uft, t4_520, t4_520)
];

set_flag("pp_types_on_binders", true);

store_mt_results_show mt_run[
("4_440b", ft, t4_440, l4_440),
("4_450b", ft, t4_450, l4_450),
("4_460b", ft, t4_460, l4_460),
("4_470b", ft, t4_470, l4_470),
("4_480b", ft, t4_480, l4_480),
("4_490b", ft, t4_490, l4_490),
("4_500b", ft, t4_500, l4_500),
("4_510b", ft, t4_510, l4_510),
("4_520b", ft, t4_520, l4_520)
];

store_mt_results_show (mt_runf (op =$))[
("4_440fb", uft, t4_440, t4_440),
("4_450fb", uft, t4_450, t4_450),
("4_460fb", uft, t4_460, t4_460),
("4_470fb", uft, t4_470, t4_470),
("4_480fb", uft, t4_480, t4_480),
("4_490fb", uft, t4_490, t4_490),
("4_500fb", uft, t4_500, t4_500),
("4_510fb", uft, t4_510, t4_510),
("4_520fb", uft, t4_520, t4_520)
];

set_flag("pp_types_on_binders", false)

end;
=TEX

%********************************************************************

\subsection{Local Definitions}

There are two forms of output for local definitions, so all of the
tests here occur twice.  Tests with suffix `$l$' denote the showing of
let definitions in their lambda form, without the suffix  denotes the
(default) functional form.  Most of the tests of let terms do not have
any local definitions so the results are the same.

=SML
let
val t5_010 =	⌜let a = 1 in a = 2⌝;
val a5_010 =	["let a = 1 in a = 2"];
val t5_020 =	⌜let a = 1 and b = 2 in a = b⌝;
val a5_020 =	["let a = 1 and b = 2 in a = b"];
val t5_030 =	⌜let a = 1 and b = 2 and c = 3 and d = 4 in a = b ∧ c = d⌝;
val a5_030 =	["let a = 1 and b = 2 and c = 3 and d = 4 in a = b ∧ c = d"];

in

store_mt_results_show mt_run[
("5_010", ft, t5_010, a5_010),
("5_020", ft, t5_020, a5_020),
("5_030", ft, t5_030, a5_030)
];

store_mt_results_show (mt_runf (op =$))[
("5_010f", uft, t5_010, t5_010),
("5_020f", uft, t5_020, t5_020),
("5_030f", uft, t5_030, t5_030)
];

set_flag("pp_let_as_lambda", true);

store_mt_results_show mt_run[
("5_010l", ft, t5_010, a5_010),
("5_020l", ft, t5_020, a5_020),
("5_030l", ft, t5_030, a5_030)
];

store_mt_results_show (mt_runf (op =$))[
("5_010fl", uft, t5_010, t5_010),
("5_020fl", uft, t5_020, t5_020),
("5_030fl", uft, t5_030, t5_030)
];

set_flag("pp_let_as_lambda", false)

end;
=TEX

=SML
let
val t5_040 =	⌜c = let a = 1 in let b = 2 in a = b⌝;
val a5_040 =	["c ⇔ (let a = 1 in let b = 2 in a = b)"];
val t5_050 =	⌜let a = 1 in let b = 2 in a = b ⇔ c⌝;
val a5_050 =	["let a = 1 in let b = 2 in a = b ⇔ c"];
val t5_060 =	⌜(let a = 1 in let b = 2 in a = b) = c⌝;
val a5_060 =	["(let a = 1 in let b = 2 in a = b) ⇔ c"];
val t5_070 =	⌜(let a = 1 in let b = λ x ⦁ x in a = b d) = c⌝;
val a5_070 =	["(let a = 1 in let b x = x in a = b d) ⇔ c"];
val l5_070 =	["(let a = 1 in let b = (λ x⦁ x) in a = b d) ⇔ c"];
val t5_080 =	⌜(let a = 1 in let b = 2 in a = b) ⇔ if x then p else q⌝;
val a5_080 =	["(let a = 1 in let b = 2 in a = b) ⇔ (if x then p else q)"];
val t5_090 =	⌜(let a = if x then 1 else 2 in let b = 2 in a = b) = c⌝;
val a5_090 =	["(let a = (if x then 1 else 2) in let b = 2 in a = b) ⇔ c"];

in

store_mt_results_show mt_run[
("5_040", ft, t5_040, a5_040),
("5_050", ft, t5_050, a5_050),
("5_060", ft, t5_060, a5_060),
("5_070", ft, t5_070, a5_070),
("5_080", ft, t5_080, a5_080),
("5_090", ft, t5_090, a5_090)
];

store_mt_results_show (mt_runf (op =$))[
("5_040f", uft, t5_040, t5_040),
("5_050f", uft, t5_050, t5_050),
("5_060f", uft, t5_060, t5_060),
("5_070f", uft, t5_070, t5_070),
("5_080f", uft, t5_080, t5_080),
("5_090f", uft, t5_090, t5_090)
];

set_flag("pp_let_as_lambda", true);

store_mt_results_show mt_run[
("5_040l", ft, t5_040, a5_040),
("5_050l", ft, t5_050, a5_050),
("5_060l", ft, t5_060, a5_060),
("5_070l", ft, t5_070, l5_070),
("5_080l", ft, t5_080, a5_080),
("5_090l", ft, t5_090, a5_090)
];

store_mt_results_show (mt_runf (op =$))[
("5_040fl", uft, t5_040, t5_040),
("5_050fl", uft, t5_050, t5_050),
("5_060fl", uft, t5_060, t5_060),
("5_070fl", uft, t5_070, t5_070),
("5_080fl", uft, t5_080, t5_080),
("5_090fl", uft, t5_090, t5_090)
];

set_flag("pp_let_as_lambda", false)

end;
=TEX

Let with pairs.

=SML
let
val t5_100 =	⌜let (a,b) = x in a = b⌝;
val a5_100 =	["let (a, b) = x in a = b"];
val t5_110 =	⌜let (a,b,c,d,e) = x in a = b⌝;
val a5_110 =	["let (a, b, c, d, e) = x in a = b"];
val t5_120 =	⌜let ((a,((b,c),d)),e) = x in a = b⌝;
val a5_120 =	["let ((a, (b, c), d), e) = x in a = b"];

in

store_mt_results_show mt_run[
("5_100", ft, t5_100, a5_100),
("5_110", ft, t5_110, a5_110),
("5_120", ft, t5_120, a5_120)
];

store_mt_results_show (mt_runf (op =$))[
("5_100f", uft, t5_100, t5_100),
("5_110f", uft, t5_110, t5_110),
("5_120f", uft, t5_120, t5_120)
];

set_flag("pp_let_as_lambda", true);

store_mt_results_show mt_run[
("5_100l", ft, t5_100, a5_100),
("5_110l", ft, t5_110, a5_110),
("5_120l", ft, t5_120, a5_120)
];

store_mt_results_show (mt_runf (op =$))[
("5_100fl", uft, t5_100, t5_100),
("5_110fl", uft, t5_110, t5_110),
("5_120fl", uft, t5_120, t5_120)
];

set_flag("pp_let_as_lambda", false)

end;
=TEX

Local functions.

=SML
let
val t5_130 =	⌜let f a = x in y⌝;
val a5_130 =	["let f a = x in y"];
val l5_130 =	["let f = (λ a⦁ x) in y"];

val t5_140 =	⌜let f (a,b) = x in y⌝;
val a5_140 =	["let f (a, b) = x in y"];
val l5_140 =	["let f = (λ (a, b)⦁ x) in y"];

val t5_150 =	⌜let f (a,b,c,d,e) = x in y⌝;
val a5_150 =	["let f (a, b, c, d, e) = x in y"];
val l5_150 =	["let f = (λ (a, b, c, d, e)⦁ x) in y"];

val t5_160 =	⌜let f ((a,((b,c),d)),e) = x in y⌝;
val a5_160 =	["let f ((a, (b, c), d), e) = x in y"];
val l5_160 =	["let f = (λ ((a, (b, c), d), e)⦁ x) in y"];

in

store_mt_results_show mt_run[
("5_130", ft, t5_130, a5_130),
("5_140", ft, t5_140, a5_140),
("5_150", ft, t5_150, a5_150),
("5_160", ft, t5_160, a5_160)
];

store_mt_results_show (mt_runf (op =$))[
("5_130f", uft, t5_130, t5_130),
("5_140f", uft, t5_140, t5_140),
("5_150f", uft, t5_150, t5_150),
("5_160f", uft, t5_160, t5_160)
];

set_flag("pp_let_as_lambda", true);

store_mt_results_show mt_run[
("5_130l", ft, t5_130, l5_130),
("5_140l", ft, t5_140, l5_140),
("5_150l", ft, t5_150, l5_150),
("5_160l", ft, t5_160, l5_160)
];

store_mt_results_show (mt_runf (op =$))[
("5_130fl", uft, t5_130, t5_130),
("5_140fl", uft, t5_140, t5_140),
("5_150fl", uft, t5_150, t5_150),
("5_160fl", uft, t5_160, t5_160)
];

set_flag("pp_let_as_lambda", false)

end;
=TEX

=SML
let
val t5_170 =	⌜let f a b c d e = x in y⌝;
val a5_170 =	["let f a b c d e = x in y"];
val l5_170 =	["let f = (λ a b c d e⦁ x) in y"];

val t5_180 =	⌜let f (a1, a2) (b1, b2) (c1, c2) (d1, d2) (e1, e2) = x in y⌝;
val a5_180 =	["let f (a1, a2) (b1, b2) (c1, c2) (d1, d2) (e1, e2) = x in y"];
val l5_180 =	["let f = (λ (a1, a2) (b1, b2) (c1, c2) (d1, d2) (e1, e2)⦁ x) in y"];

in
store_mt_results_show mt_run[
("5_170", ft, t5_170, a5_170),
("5_180", ft, t5_180, a5_180)
];

store_mt_results_show (mt_runf (op =$))[
("5_170f", uft, t5_170, t5_170),
("5_180f", uft, t5_180, t5_180)
];

set_flag("pp_let_as_lambda", true);

store_mt_results_show mt_run[
("5_170l", ft, t5_170, l5_170),
("5_180l", ft, t5_180, l5_180)
];

store_mt_results_show (mt_runf (op =$))[
("5_170fl", uft, t5_170, t5_170),
("5_180fl", uft, t5_180, t5_180)
];

set_flag("pp_let_as_lambda", false)

end;
=TEX

Local operators and binders.
Tests 5_190--5_210 are of well formed uses.
Tests 5_230--5_250 have extra arguments and need brackets.
Tests 5_260--5_290 have insufficient arguments and need dollar signs.

=SML
let
val t5_190 =	⌜let f_pre a = b in f_pre e⌝;
val a5_190 =	["let f_pre a = b in f_pre e"];
val t5_200 =	⌜let f_post a = b in f_post e⌝;
val a5_200 =	["let a f_post = b in e f_post"];
val t5_210 =	⌜let f_inf a b = c in f_inf d e⌝;
val a5_210 =	["let a f_inf b = c in d f_inf e"];

val t5_230 =	⌜let f_pre a c = b in f_pre e f⌝;
val a5_230 =	["let (f_pre a) c = b in (f_pre e) f"];
val t5_240 =	⌜let f_post a c = b in f_post f e⌝;
val a5_240 =	["let (a f_post) c = b in (f f_post) e"];
val t5_250 =	⌜let f_inf a b d = c in f_inf d e g⌝;
val a5_250 =	["let (a f_inf b) d = c in (d f_inf e) g"];

val t5_260 =	⌜let f_pre = b in f_pre e⌝;
val a5_260 =	["let $f_pre = b in f_pre e"];
val t5_270 =	⌜let f_post = b in f_post e⌝;
val a5_270 =	["let $f_post = b in e f_post"];
val t5_280 =	⌜let f_inf a = c in f_inf d e⌝;
val a5_280 =	["let $f_inf a = c in d f_inf e"];
val t5_290 =	⌜let f_inf = c in f_inf d e⌝;
val a5_290 =	["let $f_inf = c in d f_inf e"];

in

declare_prefix(300, "f_pre");
declare_postfix(300, "f_post");
declare_infix(300, "f_inf");

store_mt_results_show mt_run[
("5_190", ft, t5_190, a5_190),
("5_200", ft, t5_200, a5_200),
("5_210", ft, t5_210, a5_210),
("5_230", ft, t5_230, a5_230),
("5_240", ft, t5_240, a5_240),
("5_250", ft, t5_250, a5_250),
("5_260", ft, t5_260, a5_260),
("5_270", ft, t5_270, a5_270),
("5_280", ft, t5_280, a5_280),
("5_290", ft, t5_290, a5_290)
];

store_mt_results_show (mt_runf (op =$))[
("5_190f", uft, t5_190, t5_190),
("5_200f", uft, t5_200, t5_200),
("5_210f", uft, t5_210, t5_210),
("5_230f", uft, t5_230, t5_230),
("5_240f", uft, t5_240, t5_240),
("5_250f", uft, t5_250, t5_250),
("5_260f", uft, t5_260, t5_260),
("5_270f", uft, t5_270, t5_270),
("5_280f", uft, t5_280, t5_280),
("5_290f", uft, t5_290, t5_290)
];

declare_nonfix "f_pre";
declare_nonfix "f_post";
declare_nonfix "f_inf"

end;
=TEX

The local binder cannot be fully tested until the parser
accepts aliases for equality in the definitional part of
a let term.

=SML
let
val t5_220 =	⌜let (f_bind:('a → 'b) → BOOL) a = b in f_bind (λ c ⦁ d)⌝;
val a5_220 =	["let $f_bind a ⇔ b in f_bind c⦁ d"];

in

declare_binder "f_bind";

store_mt_results_show mt_run[
("5_220", ft, t5_220, a5_220)
];

(*
store_mt_results_show (mt_runf (op =$))[
("5_220f", uft, t5_220, t5_220)
];
*)

declare_nonfix "f_bind"

end;
=TEX

%********************************************************************

\subsection{More `if' `let' and Binder Terms}

These cases gave problems at one stage in the development.

=SML
let
val t6_010 =	⌜a∧(∀b⦁b)∧c⌝;
val a6_010 =	["a ∧ (∀ b⦁ b) ∧ c"];
val t6_020 =	⌜(a∧(∀b⦁b))∧c⌝;
val a6_020 =	["(a ∧ (∀ b⦁ b)) ∧ c"];
val t6_030 =	⌜a∧((∀b⦁b)∧c)⌝;
val a6_030 =	["a ∧ (∀ b⦁ b) ∧ c"];
val t6_040 =	⌜a∧b∧c∧d∧e∧f∧g∧h∧i⌝;
val a6_040 =	["a ∧ b ∧ c ∧ d ∧ e ∧ f ∧ g ∧ h ∧ i"];
val t6_050 =	⌜(((((((a∧b)∧c)∧d)∧e)∧f)∧g)∧h)∧i⌝;
val a6_050 =	["(((((((a ∧ b) ∧ c) ∧ d) ∧ e) ∧ f) ∧ g) ∧ h) ∧ i"];
val t6_060 =	⌜a∧(b∧(c∧(d∧(e∧(f∧(g∧(h∧i)))))))⌝;
val a6_060 =	["a ∧ b ∧ c ∧ d ∧ e ∧ f ∧ g ∧ h ∧ i"];
val t6_070 =	⌜(((((((a∧b)∧c)∧(∀ x ⦁ x))∧e)∧f)∧g)∧h)∧i⌝;
val a6_070 =	["(((((((a ∧ b) ∧ c) ∧ (∀ x⦁ x)) ∧ e) ∧ f) ∧ g) ∧ h) ∧ i"];
val t6_080 =	⌜a∧(b∧(c∧((∀ x ⦁ x)∧(e∧(f∧(g∧(h∧i)))))))⌝;
val a6_080 =	["a ∧ b ∧ c ∧ (∀ x⦁ x) ∧ e ∧ f ∧ g ∧ h ∧ i"];
val t6_090 =	⌜((((((((∀a⦁a)∧(∀b⦁b))∧(∀c⦁c))∧(∀d⦁d))∧(∀e⦁e))
			∧(∀f⦁f))∧(∀g⦁g))∧(∀h⦁h))∧(∀i⦁i)⌝;
val a6_090 =	["((((((((∀ a⦁ a) ∧ (∀ b⦁ b)) ∧ (∀ c⦁ c)) ∧ (∀ d⦁ d)) ∧"
		^ " (∀ e⦁ e)) ∧ (∀ f⦁ f)) ∧ (∀ g⦁ g)) ∧ (∀ h⦁ h)) ∧ (∀ i⦁ i)"];
val t6_100 =	⌜(∀a⦁a)∧((∀b⦁b)∧((∀c⦁c)∧((∀d⦁d)∧((∀e⦁e)∧
		((∀f⦁f)∧((∀g⦁g)∧((∀h⦁h)∧(∀i⦁i))))))))⌝;
val a6_100 =	["(∀ a⦁ a) ∧ (∀ b⦁ b) ∧ (∀ c⦁ c) ∧ (∀ d⦁ d) ∧ (∀ e⦁ e) ∧"
		^ " (∀ f⦁ f) ∧ (∀ g⦁ g) ∧ (∀ h⦁ h) ∧ (∀ i⦁ i)"];

in

store_mt_results_show mt_run[
("6_010", ft, t6_010, a6_010),
("6_020", ft, t6_020, a6_020),
("6_030", ft, t6_030, a6_030),
("6_040", ft, t6_040, a6_040),
("6_050", ft, t6_050, a6_050),
("6_060", ft, t6_060, a6_060),
("6_070", ft, t6_070, a6_070),
("6_080", ft, t6_080, a6_080),
("6_090", ft, t6_090, a6_090),
("6_100", ft, t6_100, a6_100)
];

store_mt_results_show (mt_runf (op =$))[
("6_010f", uft, t6_010, t6_010),
("6_020f", uft, t6_020, t6_020),
("6_030f", uft, t6_030, t6_030),
("6_040f", uft, t6_040, t6_040),
("6_050f", uft, t6_050, t6_050),
("6_060f", uft, t6_060, t6_060),
("6_070f", uft, t6_070, t6_070),
("6_080f", uft, t6_080, t6_080),
("6_090f", uft, t6_090, t6_090),
("6_100f", uft, t6_100, t6_100)
]
end;
=TEX

=SML
let
val t6_110 =	⌜ff (if a then b else c)⌝;
val a6_110 =	["ff (if a then b else c)"];
val t6_120 =	⌜ff (if a then b else c) (if d then e else f) (if g then h else i)⌝;
val a6_120 =	["ff (if a then b else c) (if d then e else f) (if g then h else i)"];
val t6_130 =	⌜((ff (if a then b else c)) (if d then e else f)) (if g then h else i)⌝;
val a6_130 =	["ff (if a then b else c) (if d then e else f) (if g then h else i)"];
val t6_140 =	⌜ff ((if a then b else c) ((if d then e else f) (if g then h else i)))⌝;
val a6_140 =	["ff ((if a then b else c) ((if d then e else f) (if g then h else i)))"];

in

store_mt_results_show mt_run[
("6_110", ft, t6_110, a6_110),
("6_120", ft, t6_120, a6_120),
("6_130", ft, t6_130, a6_130),
("6_140", ft, t6_140, a6_140)
];

store_mt_results_show (mt_runf (op =$))[
("6_110f", uft, t6_110, t6_110),
("6_120f", uft, t6_120, t6_120),
("6_130f", uft, t6_130, t6_130),
("6_140f", uft, t6_140, t6_140)
]
end;
=TEX

=SML
let
val t6_150 =	⌜ff (λ a ⦁ b)⌝;
val a6_150 =	["ff (λ a⦁ b)"];
val t6_160 =	⌜ff (λ a ⦁ b) (λ c ⦁ d) (λ e ⦁ f)⌝;
val a6_160 =	["ff (λ a⦁ b) (λ c⦁ d) (λ e⦁ f)"];
val t6_170 =	⌜((ff (λ a ⦁ b)) (λ c ⦁ d)) (λ e ⦁ f)⌝;
val a6_170 =	["ff (λ a⦁ b) (λ c⦁ d) (λ e⦁ f)"];
val t6_180 =	⌜ff ((λ a ⦁ b) ((λ c ⦁ d) (λ e ⦁ f)))⌝;
val a6_180 =	["ff ((λ a⦁ b) ((λ c⦁ d) (λ e⦁ f)))"];

in

store_mt_results_show mt_run[
("6_150", ft, t6_150, a6_150),
("6_160", ft, t6_160, a6_160),
("6_170", ft, t6_170, a6_170),
("6_180", ft, t6_180, a6_180)
];

store_mt_results_show (mt_runf (op =$))[
("6_150f", uft, t6_150, t6_150),
("6_160f", uft, t6_160, t6_160),
("6_170f", uft, t6_170, t6_170),
("6_180f", uft, t6_180, t6_180)
]
end;
=TEX

=SML
let
val t6_190 =	⌜ff (let a = b in c)⌝;
val a6_190 =	["ff (let a = b in c)"];
val t6_200 =	⌜ff (let a = b in c) (let d = e in f) (let g = h in i)⌝;
val a6_200 =	["ff (let a = b in c) (let d = e in f) (let g = h in i)"];
val t6_210 =	⌜((ff (let a = b in c)) (let d = e in f)) (let g = h in i)⌝;
val a6_210 =	["ff (let a = b in c) (let d = e in f) (let g = h in i)"];
val t6_220 =	⌜ff ((let a = b in c) ((let d = e in f) (let g = h in i)))⌝;
val a6_220 =	["ff ((let a = b in c) ((let d = e in f) (let g = h in i)))"];

in

store_mt_results_show mt_run[
("6_190", ft, t6_190, a6_190),
("6_200", ft, t6_200, a6_200),
("6_210", ft, t6_210, a6_210),
("6_220", ft, t6_220, a6_220)
];

store_mt_results_show (mt_runf (op =$))[
("6_190f", uft, t6_190, t6_190),
("6_200f", uft, t6_200, t6_200),
("6_210f", uft, t6_210, t6_210),
("6_220f", uft, t6_220, t6_220)
]
end;
=TEX

`If' `let' and binder terms with pairs.

=SML
let

val t6_400 =	⌜(if a then b else c), d⌝;
val a6_400 =	["((if a then b else c), d)"];
val t6_410 =	⌜if a then b else (c, d)⌝;
val a6_410 =	["if a then b else (c, d)"];

val t6_420 =	⌜(λ a⦁ a), d⌝;
val a6_420 =	["((λ a⦁ a), d)"];
val t6_430 =	⌜λ a⦁ (a, d)⌝;
val a6_430 =	["λ a⦁ (a, d)"];

val t6_440 =	⌜(let a = b in c), d⌝;
val a6_440 =	["((let a = b in c), d)"];
val t6_450 =	⌜let a = b in (c, d)⌝;
val a6_450 =	["let a = b in (c, d)"];

in

store_mt_results_show mt_run[
("6_400", ft, t6_400, a6_400),
("6_410", ft, t6_410, a6_410),
("6_420", ft, t6_420, a6_420),
("6_430", ft, t6_430, a6_430),
("6_440", ft, t6_440, a6_440),
("6_450", ft, t6_450, a6_450)
];

store_mt_results_show (mt_runf (op =$))[
("6_400f", uft, t6_400, t6_400),
("6_410f", uft, t6_410, t6_410),
("6_420f", uft, t6_420, t6_420),
("6_430f", uft, t6_430, t6_430),
("6_440f", uft, t6_440, t6_440),
("6_450f", uft, t6_450, t6_450)
]
end;
=TEX


%********************************************************************

\subsection{Lists and Sets}

Set Comprehension.

=SML
let
val t7_010 =	⌜{a|b}⌝;
val a7_010 =	["{a|b}"];
val t7_020 =	⌜{(a,b,c)|a∧(∀b⦁b)∧c}⌝;
val a7_020 =	["{(a, b, c)|a ∧ (∀ b⦁ b) ∧ c}"];

in

store_mt_results_show mt_run[
("7_010", ft, t7_010, a7_010),
("7_020", ft, t7_020, a7_020)
];

store_mt_results_show (mt_runf (op =$))[
("7_010f", uft, t7_010, t7_010),
("7_020f", uft, t7_020, t7_020)
]
end;
=TEX

=SML
let
val t7_030 =	⌜{}⌝;
val a7_030 =	["{}"];
val t7_040 =	⌜{a; b; c; d; e}⌝;
val a7_040 =	["{a; b; c; d; e}"];
val t7_041 =	⌜{a b}⌝;
val a7_041 =	["{a b}"];
val t7_042 =	⌜{a}⌝;
val a7_042 =	["{a}"];

in

store_mt_results_show mt_run[
("7_030", ft, t7_030, a7_030),
("7_040", ft, t7_040, a7_040),
("7_041", ft, t7_041, a7_041),
("7_042", ft, t7_042, a7_042)
];

store_mt_results_show (mt_runf (op =$))[
("7_030f", uft, t7_030, t7_030),
("7_040f", uft, t7_040, t7_040),
("7_041f", uft, t7_041, t7_041),
("7_042f", uft, t7_042, t7_042)
]
end;
=TEX

=SML
let
val t7_050 =	⌜[]⌝;
val a7_050 =	["[]"];
val t7_060 =	⌜[a; b; c; d; e]⌝;
val a7_060 =	["[a; b; c; d; e]"];
val t7_070 =	⌜[a]⌝;
val a7_070 =	["[a]"];
val t7_080 =	⌜f []⌝;
val a7_080 =	["f []"];
val t7_090 =	⌜g [a]⌝;
val a7_090 =	["g [a]"];

in

store_mt_results_show mt_run[
("7_050", ft, t7_050, a7_050),
("7_060", ft, t7_060, a7_060),
("7_070", ft, t7_070, a7_070),
("7_080", ft, t7_080, a7_080),
("7_090", ft, t7_090, a7_090)
];

store_mt_results_show (mt_runf (op =$))[
("7_050f", uft, t7_050, t7_050),
("7_060f", uft, t7_060, t7_060),
("7_070f", uft, t7_070, t7_070),
("7_080f", uft, t7_080, t7_080),
("7_090f", uft, t7_090, t7_090)
]
end;
=TEX

%********************************************************************

\subsection{Strings and Characters}

We cannot fully test strings with the standard pattern of tests used in
this document.  In particular, newline characters cannot tested via
$uft$ because the text that is generated holds a string containing a
newline, this is then passed to $use\-\_string$ which passes it on to the
compiler.  Thus the compiler reads a string containing a newline
character which is not valid Standard~ML.  Test $8_010$ gives a good
test of various strings, test $8_030$ tests the handling of
back-slashes in strings, including newlines.  Test $8_030$ cannot use
function $uft$.

=SML
let
val t8_010 =	⌜f "" T "a" T
		"a b c d e f g h i j k l m n o p q r s t u v w x y z"
		T⌝;
val a8_010 =	["f \"\" T \"a\" T \"a b c d e f g h i j k \
		\l m n o p q r s t u v w x y z\" T"];
val t8_020 =	⌜`a`⌝;
val a8_020 =	["`a`"];
val t8_030 =	⌜f "\t\n\234" a⌝;
val a8_030a =	["f \"\\t\\n\234\" a"];
val a8_030b =	["f \"\\t\\n\\234\" a"];

val old_uec = set_flag("use_extended_chars", true);

in

store_mt_results_show mt_run[
("8_010", ft, t8_010, a8_010),
("8_020", ft, t8_020, a8_020),
("8_030a", ft, t8_030, a8_030a)
];

set_flag("use_extended_chars", false);

store_mt_results_show mt_run[
("8_030b", ft, t8_030, a8_030b)
];

set_flag("use_extended_chars", old_uec);

store_mt_results_show (mt_runf (op =$))[
("8_010f", uft, t8_010, t8_010),
("8_020f", uft, t8_020, t8_020)
(* No test of 8_030 with $uft$ *)
]
end;
=TEX

%********************************************************************

\subsection{Incomplete Uses of HOL Constants}

Examples of HOL constants used for concrete syntax items but which are
insufficiently parameterised and so must be printed in their function
application form.

=SML
let
val t9_010 =	⌜Uncurry f⌝;
val a9_010 =	["Uncurry f"];
val t9_020 =	⌜Uncurry f a⌝;
val a9_020 =	["Uncurry f a"];
val t9_030 =	⌜Uncurry f a b⌝;
val a9_030 =	["Uncurry f a b"];
val t9_040 =	⌜Uncurry f a b c⌝;
val a9_040 =	["Uncurry f a b c"];
in
store_mt_results_show mt_run[
("9_010", ft, t9_010, a9_010),
("9_020", ft, t9_020, a9_020),
("9_030", ft, t9_030, a9_030),
("9_040", ft, t9_040, a9_040)
];

store_mt_results_show (mt_runf (op =$))[
("9_010f", uft, t9_010, t9_010),
("9_020f", uft, t9_020, t9_020),
("9_030f", uft, t9_030, t9_030),
("9_040f", uft, t9_040, t9_040)
]
end;
=TEX

=SML
let
val App(t9_050, _) = dest_simple_term ⌜if a then b else c⌝;
val a9_050 =	["Cond a b"];
val App(t9_060, _) = dest_simple_term t9_050;
val a9_060 =	["Cond a"];
val App(t9_070, _) = dest_simple_term t9_060;
val a9_070 =	["Cond"];
in
store_mt_results_show mt_run [
("9_050", ft, t9_050, a9_050),
("9_060", ft, t9_060, a9_060),
("9_070", ft, t9_070, a9_070)
];

store_mt_results_show (mt_runf (op =$))[
("9_050f", uft, t9_050, t9_050),
("9_060f", uft, t9_060, t9_060),
("9_070f", uft, t9_070, t9_070)
]
end;
=TEX

=SML
let
val App(t9_080, _) =	dest_simple_term ⌜let a (b, c) = d in e⌝;
val a9_080 =	["Let (λ a⦁ e)"];
val App(t9_090, _) =	dest_simple_term ⌜let a (b, c) = d and (e, f) = g in h⌝;
val a9_090 =	["Let (let a (b, c) = d in λ (e, f)⦁ h)"];
val t9_100 =	⌜Let a b⌝;
val a9_100 =	["Let a b"];
in
store_mt_results_show mt_run [
("9_080", ft, t9_080, a9_080),
("9_090", ft, t9_090, a9_090)
,("9_100", ft, t9_100, a9_100)
];

set_flag("pp_show_HOL_types", true);

store_mt_results_show (mt_runf (op =$))[
("9_080f", uft, t9_080, t9_080),
("9_090f", uft, t9_090, t9_090)
,("9_100f", uft, t9_100, t9_100)
];

set_flag("pp_show_HOL_types", false)

end;
=TEX

Set comprehensions.

=SML
let
val tv1 = mk_vartype "'tv1";
val tv2 = mk_vartype "'tv2";
val v1 = mk_var("v1", tv1);
val v2 = mk_var("v2", tv2);
val t9_110 = mk_app(mk_const("SetComp",mk_→_type(mk_→_type(
			mk_×_type(tv1,tv2),BOOL),
			mk_ctype("SET",[mk_×_type(tv1,tv2)]))),
		mk_var("v",mk_→_type(mk_×_type(tv1,tv2),BOOL)));
val a9_110 = ["$SetComp v"];
in
store_mt_results_show mt_run [
("9_110", ft, t9_110, a9_110)
];

set_flag("pp_show_HOL_types", true);

store_mt_results_show (mt_runf (op =$))[
("9_110f", uft, t9_110, t9_110)
];

set_flag("pp_show_HOL_types", false)

end;
=TEX

Infix operators.

=SML
let
val App(t9_120, _) =	dest_simple_term ⌜a ∧ b⌝;
val a9_120 =	["$∧ a"];
val App(t9_130, _) =	dest_simple_term t9_120;
val a9_130 =	["$∧"];
in
store_mt_results_show mt_run[
("9_120", ft, t9_120, a9_120),
("9_130", ft, t9_130, a9_130)
];

set_flag("pp_show_HOL_types", true);

store_mt_results_show (mt_runf (op =$))[
("9_120f", uft, t9_120, t9_120),
("9_130f", uft, t9_130, t9_130)
];

set_flag("pp_show_HOL_types", false)

end;
=TEX

%********************************************************************

\subsection{Other Formatting Routines}

The preceding tests have exercised the internals of all of the
formatting routines.  This group of tests exercises the various
interfaces.

=SML
let
val t10_tm =	⌜x∧y⌝;
val t10_ty =	ⓣ 'a → 'b⌝;

in

store_mt_results_show mt_run [
("10_010t", PrettyPrinter.format_term true,			t10_tm, ["⌜x ∧ y⌝"]),
("10_010f", PrettyPrinter.format_term false,			t10_tm, ["x ∧ y"]),
("10_020t", PrettyPrinter.format_term1 true		80,	t10_tm, ["⌜x ∧ y⌝"]),
("10_020f", PrettyPrinter.format_term1 false	80,	t10_tm, ["x ∧ y"])];

store_mt_results_show mt_run [
("10_030t", PrettyPrinter.format_type1 true		80,	t10_ty, ["ⓣ'a → 'b⌝"]),
("10_030f", PrettyPrinter.format_type1 false		80,	t10_ty, ["'a → 'b"])
]

end;
=TEX

Test $10_11$ checks that line breaking happens at the corect place
and tests the use of type abbreviations.

=SML
let
val t10_11 =	ⓣ 'a → 'a → 'a → 'a → CHAR LIST → 'a → CHAR LIST → 'a → 'a → 'a → 'a → 'a → 'a → 'a → 'a → 'a → 'a⌝;
val a10_11 =	[	"ⓣ'a",
			"  → 'a",
			"  → 'a",
			"  → 'a",
			"  → CHAR LIST",
			"  → 'a",
			"  → CHAR LIST",
			"  → 'a",
			"  → 'a",
			"  → 'a",
			"  → 'a",
			"  → 'a",
			"  → 'a",
			"  → 'a",
			"  → 'a",
			"  → 'a",
			"  → 'a⌝"];

val b10_11 =	[	"ⓣ'a",
			"  → 'a",
			"  → 'a",
			"  → 'a",
			"  → STRING",
			"  → 'a",
			"  → STRING",
			"  → 'a",
			"  → 'a",
			"  → 'a",
			"  → 'a",
			"  → 'a",
			"  → 'a",
			"  → 'a",
			"  → 'a",
			"  → 'a",
			"  → 'a⌝"];


in

store_mt_results_show mt_run [
("10_11_1", PrettyPrinter.format_type1 true		80,	t10_11, b10_11)
];

set_flag("pp_use_type_abbrev", false);

store_mt_results_show mt_run [
("10_11_2", PrettyPrinter.format_type1 true		80,	t10_11, b10_11)
];

set_flag("pp_use_type_abbrev", true)

end;
=TEX

%********************************************************************

\subsection{Limited Depth}

Integer controls $pp_top_level_depth$ and $pp_format_depth$ are used to
limit how much of a term is printed.  The first controls Standard~ML
top level expressions so all we can do about checking that is by visual
inspection of output.  The second control affects the `$format_\ldots$'
routines, so we can check that.  Just for completeness all tests will
include a $use_string$ so that the top level expressions are printed.

The tests cover most parts of the grammar at various depths starting
from zero, this range of values allow combining tests of various parts
of the grammar and of the nesting of expressions.

=SML
"Depth Tests";

val dp_aux : TERM ref = ref ⌜1⌝;

fun test_it (label:string) (suffix:string) (tm:TERM) (answers : string list list) : unit = (
let
	fun aux (depth:int) (answer::more : string list list) : unit = (
	let
		val lab = label ^ "_" ^ (string_of_int depth) ^ suffix;
	in
		output(std_out, lab ^ "\n");
		set_int_control("pp_top_level_depth", depth);
		set_int_control("pp_format_depth", depth);

		map (fn s => output(std_out, "\"" ^ s ^ "\"\n")) (ft tm);
		use_string "!dp_aux";
		store_mt_results mt_run [ (lab, ft, tm, answer) ];
	
		aux (depth+1) more
	end
	)
	| aux _ nil = ()
	;
in
	dp_aux := tm;
	aux 0 answers
end
);
=TEX

=SML
val ad0_0 =	["... "];

val td010 =	⌜if a1 then a2 else if b1 then b2 else if c1 then c2 else d⌝;
val ad010_1 =	["if ...  then ...  ... "];
val ad010_2 =	["if a1 then a2 else if ...  then ...  ... "];
val ad010_3 =	["if a1 then a2 else if b1 then b2 else if ...  then ...  ... "];
val ad010_4 =	["if a1 then a2 else if b1 then b2 else if c1 then c2 else ... "];
val ad010_5 =	["if a1 then a2 else if b1 then b2 else if c1 then c2 else d"];
val ad010 =	[ad0_0, ad010_1, ad010_2, ad010_3, ad010_4, ad010_5];

val td020 =	⌜[1; 2; 3; 4; 5]⌝;
val ad020_1 =	["[... ... ]"];
val ad020_2 =	["[1; ... ... ]"];
val ad020_3 =	["[1; 2; ... ... ]"];
val ad020_4 =	["[1; 2; 3; ... ... ]"];
val ad020_5 =	["[1; 2; 3; 4; ... ]"];
val ad020_6 =	["[1; 2; 3; 4; 5]"];
val ad020 =	[ad0_0, ad020_1, ad020_2, ad020_3, ad020_4, ad020_5, ad020_6];

val td030 =	⌜{1; 2; 3; 4; 5}⌝;
val ad030_1 =	["{... ... }"];
val ad030_2 =	["{1; ... ... }"];
val ad030_3 =	["{1; 2; ... ... }"];
val ad030_4 =	["{1; 2; 3; ... ... }"];
val ad030_5 =	["{1; 2; 3; 4; ... }"];
val ad030_6 =	["{1; 2; 3; 4; 5}"];
val ad030 =	[ad0_0, ad030_1, ad030_2, ad030_3, ad030_4, ad030_5, ad030_6];

val td040 =	⌜{ a | pa }⌝;
val ad040_1 =	["{... |... }"];
val ad040_2 =	["{a|pa}"];
val ad040 =	[ad0_0, ad040_1, ad040_2];

val td050 =	⌜ff a1 b1 c1 d1⌝;
val ad050_1 =	["ff ... ... "];
val ad050_2 =	["ff a1 ... ... "];
val ad050_3 =	["ff a1 b1 ... ... "];
val ad050_4 =	["ff a1 b1 c1 ... "];
val ad050_5 =	["ff a1 b1 c1 d1"];
val ad050 =	[ad0_0, ad050_1, ad050_2, ad050_3, ad050_4, ad050_5];

val td060 =	⌜∀ a1 b1 c1 d1 e1 f1 g1 h1 i1 j1 : BOOL
		⦁ ∃ a2 b2 c2 d2 e2 : BOOL; f2 g2 h2 i2 j2 : CHAR
		⦁ a3⌝;
val ad060_1a =	["∀ ... ... ⦁ ... "];
val ad060_2a =	["∀ a1 ... ... ⦁ ∃ ... ... ⦁ ... "];
val ad060_3a =	["∀ a1 b1 ... ... ⦁ ∃ a2 ... ... ⦁ a3"];
val ad060_4a =	["∀ a1 b1 c1 ... ... ⦁ ∃ a2 b2 ... ... ⦁ a3"];
val ad060_5a =	["∀ a1 b1 c1 d1 ... ... ⦁ ∃ a2 b2 c2 ... ... ⦁ a3"];
val ad060_6a =	["∀ a1 b1 c1 d1 e1 ... ... ⦁ ∃ a2 b2 c2 d2 ... ... ⦁ a3"];
val ad060_7a =	["∀ a1 b1 c1 d1 e1 f1 ... ... ⦁ ∃ a2 b2 c2 d2 e2 ... ... ⦁ a3"];
val ad060_8a =	["∀ a1 b1 c1 d1 e1 f1 g1 ... ... \
		\⦁ ∃ a2 b2 c2 d2 e2 f2 ... ... ⦁ a3"];
val ad060a =	[ad0_0, ad060_1a, ad060_2a, ad060_3a, ad060_4a,
		ad060_5a, ad060_6a, ad060_7a, ad060_8a];

val ad060_1b =	["∀ ... ...  : BOOL⦁ ... "];
val ad060_2b =	["∀ a1 ... ...  : BOOL⦁ ∃ ... ...  : BOOL... ⦁ ... "];
val ad060_3b =	["∀ a1 b1 ... ...  : BOOL\
		\⦁ ∃ a2 ... ...  : BOOL; ... ...  : CHAR⦁ a3"];
val ad060_4b =	["∀ a1 b1 c1 ... ...  : BOOL\
		\⦁ ∃ a2 b2 ... ...  : BOOL; f2 ... ...  : CHAR⦁ a3"];
val ad060_5b =	["∀ a1 b1 c1 d1 ... ...  : BOOL\
		\⦁ ∃ a2 b2 c2 ... ...  : BOOL; f2 g2 ... ...  : CHAR⦁ a3"];
val ad060_6b =	["∀ a1 b1 c1 d1 e1 ... ...  : BOOL\
		\⦁ ∃ a2 b2 c2 d2 ...  : BOOL; f2 g2 h2 ... ...  : CHAR⦁ a3"];
val ad060_7b =	["∀ a1 b1 c1 d1 e1 f1 ... ...  : BOOL\
		\⦁ ∃ a2 b2 c2 d2 e2 : BOOL; f2 g2 h2 i2 ...  : CHAR⦁ a3"];
val ad060_8b =	["∀ a1 b1 c1 d1 e1 f1 g1 ... ...  : BOOL\
		\⦁ ∃ a2 b2 c2 d2 e2 : BOOL; f2 g2 h2 i2 j2 : CHAR⦁ a3"];
val ad060b =	[ad0_0, ad060_1b, ad060_2b, ad060_3b, ad060_4b,
		ad060_5b, ad060_6b, ad060_7b, ad060_8b];

val td070 = 	⌜∀ a1 ⦁ ∃ a2 ⦁ ∀ a3 ⦁ ∃ a4 ⦁ a5⌝;
val ad070_1 = 	["∀ ... ⦁ ... "];
val ad070_2 = 	["∀ a1⦁ ∃ ... ⦁ ... "];
val ad070_3 = 	["∀ a1⦁ ∃ a2⦁ ∀ ... ⦁ ... "];
val ad070_4 = 	["∀ a1⦁ ∃ a2⦁ ∀ a3⦁ ∃ ... ⦁ ... "];
val ad070_5 = 	["∀ a1⦁ ∃ a2⦁ ∀ a3⦁ ∃ a4⦁ a5"];
val ad070 =	[ad0_0, ad070_1, ad070_2, ad070_3, ad070_4, ad070_5];

val td080 =	⌜let a1 = b1 and c1 = d1 and e1 = f1 in
		let a2 = b2 and c2 = d2 and e2 = f2 in
		let a3 = b3 and c3 = d3 and e3 = f3 in a4⌝;
val ad080_1 =	["let ... ...  in ... ... "];
val ad080_2 =	["let ...  = ...  and ... ...  in \
		\let ... ...  in ... a4"];
val ad080_3 =	["let a1 = b1 and ...  = ...  and ...  in \
		\let ...  = ...  and ... ...  in let ... ...  in a4"];
val ad080_4 =	["let a1 = b1 and c1 = d1 and ...  = ...  in \
		\let a2 = b2 and ...  = ...  and ...  in let ...  = ...  and ... ...  in a4"];
val ad080 =	[ad0_0, ad080_1, ad080_2, ad080_3, ad080_4];

val td090 =	⌜(1, 2, 3, 4, 5)⌝;
val ad090_1 =	["(... ... )"];
val ad090_2 =	["(1, ... ... )"];
val ad090_3 =	["(1, 2, ... ... )"];
val ad090_4 =	["(1, 2, 3, ... ... )"];
val ad090_5 =	["(1, 2, 3, 4, ... )"];
val ad090_6 =	["(1, 2, 3, 4, 5)"];

val ad090 =	[ad0_0, ad090_1, ad090_2, ad090_3, ad090_4, ad090_5, ad090_6];

val td100 =	⌜((((1,2),3),4),5)⌝;
val ad100_1 =	["(... ... )"];
val ad100_2 =	["((... ... ), ... )"];
val ad100_3 =	["(((... ... ), ... ), 5)"];
val ad100_4 =	["((((... ... ), ... ), 4), 5)"];
val ad100_5 =	["((((1, ... ), 3), 4), 5)"];
val ad100_6 =	["((((1, 2), 3), 4), 5)"];
val ad100 =	[ad0_0, ad100_1, ad100_2, ad100_3, ad100_4, ad100_5, ad100_6];

val pp_top_level_depth_init = get_int_control "pp_top_level_depth";
val pp_format_depth_init = get_int_control "pp_format_depth";

test_it "td010" "" td010 ad010;
test_it "td020" "" td020 ad020;
test_it "td030" "" td030 ad030;
test_it "td040" "" td040 ad040;
test_it "td050" "" td050 ad050;
test_it "td060" "a" td060 ad060a;
set_flag("pp_types_on_binders", true);
test_it "td060" "b" td060 ad060b;
set_flag("pp_types_on_binders", false);
test_it "td070" "" td070 ad070;
test_it "td080" "" td080 ad080;
test_it "td090" "" td090 ad090;
test_it "td100" "" td100 ad100;

set_int_control("pp_top_level_depth", pp_top_level_depth_init);
set_int_control("pp_format_depth", pp_format_depth_init);
=TEX

%********************************************************************

\subsection{Coup de Gr\^ace}

An attempt to get all of the productions in the grammar
of~\cite{DS/FMU/IED/DEF001} into one HOL term.

=SML
"Coup de Grace";

open_theory "list" handle _ => ();
open_theory "sets" handle _ => ();
new_theory "mdt025_test2";
Value	(new_type("TRIPLE", 3))				handle Fail _ => Nil;
	declare_postfix (100, "+++")				handle Fail _ => ();

Value	(new_type("XX", 1))				handle Fail _ => Nil;

=TEX

=SML
val t_cdg = ⌜	∃ ka : ( '8 → '9 → '10 ) ⦁ kb
		let ha = ( hb : '4 ) in ( hc : BOOL → '11 )
		∀ (ga : '12, gb : '12) (gc : '12, gd : '12, ge : '12) ; gf gg : '2 → '3 ⦁ gh
		let ia ((ib, ic), (id, ie)) = (ig : ('5, '6, '7) TRIPLE, [ib : '1; ic; id; ie])
			and ja jb jc jd = [fa = ¬ fb; ¬ fc ; (¬ fd) +++ ; jb ; jc ; jd ]
		in { (la, lb) | lc (¬ (la : '14 LIST → BOOL) []) (lb : '15)
			if ma then {} else ( { mb ; mc ; md } : ('1 SET) ) }
	⌝;

val a_cdg = ["∃ ka⦁ kb " ^
		"(let ha = hb in hc " ^
		"(∀ (ga, gb) (gc, gd, ge) gf gg⦁ gh " ^
		"(let ia ((ib, ic), id, ie) = (ig, [ib; ic; id; ie]) " ^
		"and ja jb jc jd = [fa ⇔ ¬ fb; ¬ fc; (¬ fd) +++; jb; jc; jd] " ^
		"in {(la, lb)|lc (¬ la []) lb " ^
		"(if ma then {} else {mb; mc; md})})))"];

val a_cdg_br = ["∃ ka⦁ (kb " ^
	"(let ha = hb in " ^
	"(hc " ^
	"(∀ (ga, gb) (gc, gd, ge) gf gg⦁ " ^
	"(gh " ^
	"(let (ia ((ib, ic), id, ie)) = (ig, [ib; ic; id; ie]) and (ja jb jc jd) = " ^
	"[fa ⇔ (¬ fb); ¬ fc; (¬ fd) +++; jb; jc; jd] in " ^
	"{(la, lb)|lc (¬ (la [])) lb (if ma then {} else {mb; mc; md})})))" ^
	")))"];

val a_cdg_br_ty = ["∃ (ka : '8 → ('9 → '10))⦁ ((kb : '11 → BOOL) " ^
	"(let (ha : '4) = (hb : '4) in " ^
	"((hc : BOOL → '11) " ^
	"(∀ ((ga : '12), (gb : '12)) ((gc : '12), (gd : '12), (ge : '12)) " ^
	"(gf : '2 → '3) (gg : '2 → '3)⦁ " ^
	"((gh : (('14 LIST → BOOL) × '15) SET → BOOL) " ^
	"(let " ^
	"((ia : (('1 × '1) × ('1 × '1)) → (('5, '6, '7) TRIPLE × '1 LIST)) " ^
	"(((ib : '1), (ic : '1)), (id : '1), (ie : '1))) = " ^
	"((ig : ('5, '6, '7) TRIPLE), [ib : '1; ic : '1; id : '1; ie : '1]) and " ^
	"((ja : BOOL → (BOOL → (BOOL → BOOL LIST))) " ^
	"(jb : BOOL) " ^
	"(jc : BOOL) " ^
	"(jd : BOOL)) = " ^
	"[(fa : BOOL) ⇔ (¬ (fb : BOOL)); ¬ (fc : BOOL); (¬ (fd : BOOL)) +++; " ^
	"jb : BOOL; jc : BOOL; jd : BOOL] in " ^
	"{((la : '14 LIST → BOOL), (lb : '15))" ^
	"|(lc : BOOL → ('15 → ('1 SET → BOOL))) " ^
	"(¬ ((la : '14 LIST → BOOL) [])) (lb : '15) " ^
	"(if ma : BOOL " ^
	"then {} " ^
	"else {mb : '1; mc : '1; md : '1}" ^
	")}))))))"];

val a_cdg_ty = ["∃ (ka : '8 → '9 → '10)⦁ (kb : '11 → BOOL) " ^
	"(let (ha : '4) = (hb : '4) in " ^
	"(hc : BOOL → '11) " ^
	"(∀ ((ga : '12), (gb : '12)) ((gc : '12), (gd : '12), (ge : '12)) " ^
	"(gf : '2 → '3) (gg : '2 → '3)⦁ " ^
	"(gh : (('14 LIST → BOOL) × '15) SET → BOOL) " ^
	"(let " ^
	"(ia : ('1 × '1) × '1 × '1 → ('5, '6, '7) TRIPLE × '1 LIST) " ^
	"(((ib : '1), (ic : '1)), (id : '1), (ie : '1)) = " ^
	"((ig : ('5, '6, '7) TRIPLE), [ib : '1; ic : '1; id : '1; ie : '1]) and " ^
	"(ja : BOOL → BOOL → BOOL → BOOL LIST) " ^
	"(jb : BOOL) (jc : BOOL) (jd : BOOL) = " ^
	"[(fa : BOOL) ⇔ ¬ (fb : BOOL); ¬ (fc : BOOL); (¬ (fd : BOOL)) +++; " ^
	"jb : BOOL; jc : BOOL; jd : BOOL] in " ^
	"{((la : '14 LIST → BOOL), (lb : '15))" ^
	"|(lc : BOOL → '15 → '1 SET → BOOL) " ^
	"(¬ (la : '14 LIST → BOOL) []) (lb : '15) " ^
	"(if ma : BOOL then {} else {mb : '1; mc : '1; md : '1})}))" ^
	")"];

set_line_length 5000;
set_flag("pp_add_brackets", false);
set_flag("pp_show_HOL_types", false);
store_mt_results_show mt_run [("cdg_010", ft, t_cdg, a_cdg)];

set_flag("pp_add_brackets", true);
store_mt_results_show mt_run [("cdg_020", ft, t_cdg, a_cdg_br)];

set_flag("pp_show_HOL_types", true);
store_mt_results_show mt_run [("cdg_030", ft, t_cdg, a_cdg_br_ty)];

set_flag("pp_add_brackets", false);
store_mt_results_show mt_run [("cdg_040", ft, t_cdg, a_cdg_ty)];

set_flag("pp_show_HOL_types", false);
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\section{SUMMARY OF RESULTS}

=SML
"Summary Of Results";

set_line_length 80;

diag_string(summarize_mt_results());
=TEX

\end{document}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%********************************************************************
%--------------------------------------------------------------------

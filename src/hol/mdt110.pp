=IGN
********************************************************************************
mdt110.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% mdt005.doc ℤ $Date: 2002/10/17 16:20:01 $ $Revision: 2.18 $ $RCSfile: mdt110.doc,v $

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

\def\Title{Module Tests of the File and Terminal Reader Writer}

\def\AbstractText{This document contains the module tests of the reading and writing functions that form the outermost level of user interface for Release 1 of ICL HOL.}

\def\Reference{DS/FMU/IED/MDT005}

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
%% LaTeX2e port: % mdt005.doc ℤ $Date: 2002/10/17 16:20:01 $ $Revision: 2.18 $ $RCSfile: mdt110.doc,v $
%% LaTeX2e port: \documentstyle[hol1,11pt,TQ]{article}
%% LaTeX2e port: 
%% LaTeX2e port: \TPPtitle{Module Tests of the File and Terminal Reader Writer}
%% LaTeX2e port: \def\TPPheadtitle{Module Tests of the File and\cr Terminal Reader Writer}
%% LaTeX2e port: \TPPref{DS/FMU/IED/MDT005}
%% LaTeX2e port: \def\SCCSissue{$Revision: 2.18 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2002/10/17 16:20:01 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPproject{FST PROJECT}
%% LaTeX2e port: 
%% LaTeX2e port: 
\def\Hide#1{\relax}
%% LaTeX2e port: =IGN
%% LaTeX2e port: 
%% LaTeX2e port: Commands to process this document in various ways.
%% LaTeX2e port: 
%% LaTeX2e port: docsml mdt005
%% LaTeX2e port: use_file "mdt005.sml";
%% LaTeX2e port: 
%% LaTeX2e port: doctex mdt005
%% LaTeX2e port: texdvi mdt005
%% LaTeX2e port: bibtex mdt005
%% LaTeX2e port: doctex mdt005 ; texdvi mdt005
%% LaTeX2e port: doctex mdt005 ; texdvi mdt005 ; bibtex mdt005
%% LaTeX2e port: pstex mdt005
%% LaTeX2e port: 
%% LaTeX2e port: lasp -s mdt005.doc > zz1
%% LaTeX2e port: lasp -s -u mdt005.OKwords mdt005.doc > zz1
%% LaTeX2e port: 
%% LaTeX2e port: =TEX
%% LaTeX2e port: %\TPPstatus{Approved}
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: \TPPissue{\SCCSissue}
%% LaTeX2e port: \TPPauthor{A.J. Hammon & WIN01}  %% Mandatory field
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document contains the module tests of the reading
%% LaTeX2e port: 	and writing functions that form the outermost level of user
%% LaTeX2e port: 	interface for Release~1 of ICL~HOL.}
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
\subsection{Contents List}
\tableofcontents
\subsection{Document Cross References}
\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes history}
\begin{description}

\item[Issues 1.1 (1991/08/15) to 1.2 (1991/09/12) ] Initial drafts.

\item[13 September 1991, issue 2.1 ] First approved issue.

\item[20 January 1992, issue 2.2 ] Updated to use new fonts.

\item [10 February 1992, issue 2.4 ]
Bought $ecd\_2$ and $ecd\_7$ into line with current implementation.

\item [27 March 1992, issue 2.5 ]
	Add some tests of the HOL reading functions.

\item[13 April 1992, issue 2.6 ]
	Add tests for $is_same_symbol$ and $is_white$. {}
	Improve tests of $translate\-_for\-_output$ in cases of
		badly formed keywords.
	Remove the need for type and term equality.

\item[16 April 1992, issue 2.7 ]
	Changes following CR0016.

\item[15 May 1992, issue 2.8 ]
	New processing of `{\tt Q}' in strings.

\item [Issue 2.11 (1996/03/19)]
	Better tests of malformed uses of percent and Q.
\item [Issue 2.12 (1996/03/21)]
	Bug fix.
\item [Issue 2.13 (1996/03/25)]
	Fixed incompatibility with changes required for Poly/ML.
\item[Issue 2.17 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 2.18 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 2.19 (2008/02/26)] Added test for use of ``down'' character to introduce language name.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.
\item[2015/03/21]
First working version.
\item[2015/03/26]
Added tests for Unicode and UTF-8.
\item[2015/04/14]
Fixed corrupted UTF-8 tests
\item[2015/04/15]
Fixed {\LaTeX} errors.
\item[2015/04/17]
Ported to Lemma 1 document template.
\item[2018/08/22]
Remove distributed concatenation (character no longer supported).
%%%% END OF CHANGES HISTORY %%%%
\end{description}

%\subsection{Changes Forecast}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%********************************************************************
%--------------------------------------------------------------------

\newpage

\section{GENERAL}

%********************************************************************

\subsection{Scope}

This document contains a number of tests of the file and terminal
reading and writing functions which are contained in the ``Reader
Writer'' subsystem of Release~1 ICL~HOL.  The design and implementation
of the reader writer are in~\cite{DS/FMU/IED/DTD005}
and~\cite{DS/FMU/IED/IMP005} respectively.

%********************************************************************

\subsection{Introduction}

The `basic reader writer' of the Release~1 ICL~HOL system supports an
extension to Standard~ML that allows `extended characters' to be used
in Standard~ML text.  A second part of the basic reader writer, the
`embedding interface', allows readers for other languages to be
embedded, allowing the (enhanced) Standard~ML to be used as a
metalanguage for supporting work in other languages.

The tests within this document are those identified as ``functional
interfaces'' in the test strategy section of the detailed
design~\cite{DS/FMU/IED/DTD005}.

%--------------------------------------------------------------------

%\subsubsection{Purpose and Background}

%--------------------------------------------------------------------

\subsubsection{Dependencies}

These tests assume that the reader writer
files~\cite{DS/FMU/IED/DTD005} and~\cite{DS/FMU/IED/IMP005} have been
successfully compiled.  The facilities of the Module
Test Harness~\cite{DS/FMU/IED/DTD013} are used.

%--------------------------------------------------------------------

%\subsubsection{Interface}

%--------------------------------------------------------------------

%\subsubsection{Possible Enhancements}

%--------------------------------------------------------------------

%\subsubsection{Deficiencies}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\section{TEST HARNESS INITIALISATION}

=IGN
Get the test harness files
sccs -d ~ied get dtd013.doc imp013.doc
docsml dtd013
docsml imp013

docsml mdt005
use_file "mdt005.sml";

=TEX

Load and initialise the module test system.

=SML
use_file "dtd013.sml";
use_file "imp013.sml";
init_mt_results ();
=TEX

An identity function is required for the `function to apply' in
some of the test cases.

=SML
fun I x = x;
=TEX

Characters and repeated characters.

=SML
val C_sp	: string = chr 32;	(* space *)
val C_dq	: string = chr 34;	(* double quote " *)  (*="=*)
val C_lq	: string = chr 96;	(* left quote ` *)
val C_nl	: string = chr 10;	(* newline \n *)
val C_ast	: string = chr 42;	(* asterisk * *)
val C_orb	: string = chr 40;	(* asterisk ( *)
val C_crb	: string = chr 41;	(* asterisk ) *)
val C_pc	: string = chr 37;	(* percent  *)
val C_Q	: string = chr 81;	(* letter Q *)
val C_2Q	: string = C_Q ^ C_Q;
val C_4Q	: string = C_2Q ^ C_2Q;

val CS_pcQpc	: string = C_pc ^ C_Q ^ C_pc;	(* percent, Q, percent  *)

fun replicate ch num =
let fun aux n = if n <= 0 then nil else ch ::(aux (n-1));
in implode(aux num)
end;
fun stars n = replicate C_ast n;
fun b_stars n = C_orb ^ (stars n) ^ C_crb;
=TEX

Some functions to wrap strings with various characters.

=SML
fun W_pc s = C_pc ^ s ^ C_pc;
fun W_dq s = C_dq ^ s ^ C_dq;
fun W_1Q s = C_Q ^ s ^ C_Q;
fun W_2Q s = C_Q ^ (W_1Q s) ^ C_Q;
fun W_3Q s = C_Q ^ (W_2Q s) ^ C_Q;
fun W_4Q s = C_Q ^ (W_3Q s) ^ C_Q;
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\section{STRING TESTS}

Some tests that Standard~ML comments, strings and various expressions
are treated properly.  Build some strings using Standard~ML.  Strings
are tested first since they are also used for test identification.

=SML
store_mt_results_show mt_run[
("str_01", I, "ab\     \cd", "abcd"),
("str_02", I, "ab\

  \cd", "abcd"),
("str_03", I, "ab\  \  \"", "ab  " ^ C_dq),  (*="=*)
("str_04", I, "abc{\nd", "abc{" ^ C_nl ^ "d"),  (*=}}=*)
("str_05", I, "abc\"def", "abc" ^ C_dq ^ "def"),  (*="=*)
("str_06", I, "abc`def", "abc" ^ C_lq ^ "def"),
("str_07", I, "abc```def", "abc" ^ C_lq ^ C_lq ^ C_lq ^ "def")
];
=TEX

{\NoMoaning
=SMLLITERAL
store_mt_results_show mt_run[

("str_08", I, " ⊆⩥⊎𝕌Δ∘ΦΓ└⋎\
	\ΘΛ∈∉⤖Πⓜ▷Σ\
	\ⓣΥ𝔹ΩΞΨ∅⋏═\
	\╒⤕⇻⊂∩⟩⊖⇔⋂≜⟨⦇⦈↔\
	\⊕⌜→⌝ℝ■∧∨¬\
	\⇒∀∃⦁×Ⓢ⦂⨾≤≠≥𝕊∪α\
	\β⊑δεφγ\
	\ηιθκλμν⤀π\
	\χρστυℂωξψ\
	\ζ⦏│⦎⋃⇸\
	\↣⩤⊥⇐⊃⊇𝔽\
	\↗↘≡↕⁀↿\
	\↦ℕ↠ℙⓩ◁ℚ\
	\⊢⨽⨼├﹣↾ℤ⟦─⟧⤔┌ ",
		" " ^ (implode(map chr (interval 128 138))) ^ (implode(map chr (interval 140 255))) ^ " ")
];
=TEX
}

Check that asterisks are retained in strings so that
the `$us_\ldots$' tests are going to run as expected.

=SML
let
val C_ast_20 = replicate C_ast 20;

in
store_mt_results_show mt_run[
("str_09", I, "********************", C_ast_20),
("str_10", I, "*********************", C_ast_20^C_ast),
("str_11", I, "(********************)", "(" ^ C_ast_20 ^ ")"),
("str_12", I, "(*********************)", "(" ^ C_ast_20 ^ C_ast ^ ")")
]
end;
=TEX

=SML
store_mt_results_show mt_run[
("str_13", I, "", implode nil),
("str_14", I, "\n", C_nl),
("str_15", I, "\n\n", C_nl ^ C_nl),
("str_16", I, "\n\n\n", C_nl ^ C_nl ^ C_nl),
("str_17", I, "\123\077\000\255\127\128", (implode o map chr)
		[123, 077, 000, 255, 127, 128]),
("str_18", I, " \^A\^B\t", (implode o map chr)[ord C_sp, 1, 2, 9])
];
=TEX

There are many tests of the handling of percent ``{\tt\%}'' characters and
percent keywords in section~\ref{TranslatingForOutput} below.

\section{FUNCTION $use_string$ TESTS}

=SML
val us_ans : int ref = ref 0;

fun U x = (use_string x ; !us_ans);
=TEX

=SML
store_mt_results_show mt_run[
("us_01", U, "us_ans := 1", 1),
("us_02", U, "us_ans := 2", 2)
];
=TEX

Had some problems with long strings of asterisks
at one stage in the reader writer's development.

=SML
store_mt_results_show mt_run[
("us_03", U, "us_ans (**):=(***) !(****) us_ans(*****) +(******)1;", 3),
("us_04", U, "us_ans :=" ^ (b_stars 32) ^ " !us_ans+1;", 4),
("us_05", U, "us_ans :=" ^ (b_stars 33) ^ " !us_ans+1", 5),
("us_06", U, "us_ans :=" ^ (b_stars 34) ^ " !us_ans+1", 6),
("us_07", U, "us_ans :=" ^ (b_stars 35) ^ " !us_ans+1;", 7),
("us_08", U, "us_ans :=" ^ (b_stars 36) ^ " !us_ans+1", 8),
("us_09", U, "us_ans :=" ^ (b_stars 92) ^ " !us_ans+1", 9),
("us_10", U, "us_ans :=" ^ (b_stars 93) ^ " !us_ans+1;", 10),
("us_11", U, "us_ans :=" ^ (b_stars 94) ^ " !us_ans+1", 11),
("us_12", U, "us_ans :=" ^ (b_stars 95) ^ " !us_ans+1;", 12),
("us_13", U, "us_ans :=" ^ (b_stars 96) ^ " !us_ans+1", 13),
("us_14", U, "us_ans :=" ^ (b_stars 97) ^ " !us_ans+1", 14),
("us_15", U, "us_ans := !us_ans+1", 15)
];
=TEX

=SML
store_mt_results_show mt_run[
("us_16", U, "us_ans := !us_ans(*******(some text)***************************)+1", 16),
("us_17", U, "us_ans := !us_ans(************(some text)***********************)+1", 17),
("us_18", U, "us_ans := !us_ans(************(some text)************************)+1", 18),
("us_19", U, "us_ans := !us_ans(*(*(*comm(*co(*co(*comment*)ment*)ment\
	\*)nt*)om(*comment*)e(*comment*)t*)*)+1", 19),
("us_20", U, "us_ans := !us_ans (*(*(*comm(*co(*co(*comment*)ment*)men\
	\t*)nt*)om(*comment*)e(*comment*)t*)*) +1", 20)
];
=TEX

=SML
store_mt_results_show mt_run[
("us_21", U, "us_ans := !us_ans(* )))))))))))))))))))))))))))))))))))))))))*)+1", 21),
("us_22", U, "us_ans := !us_ans(*(((((((((((((((((((((((((((((( **)+1", 22),
("us_23", U, "us_ans := !us_ans(*((((((((((((((((((((((((((((((* *)*)+1", 23),
("us_24", U, "us_ans := !us_ans(*((((((((((((((((((((((((((((((**)*)+1", 24),
("us_25", U, "us_ans := !us_ans(*(**)))))))))))))))))))))))))))))))))))))))))*)+1", 25),
("us_26", U, "us_ans := !us_ans(*)))))))))))))))))))))))))))))))))))))))))*)+1", 26),
("us_27", U, "us_ans := !us_ans+1", 27),
("us_28", U, "us_ans := !us_ans+1", 28),
("us_29", U, "us_ans := !us_ans+1", 29)
];
=TEX

=IGN
("us_30", U, "us_ans := !us_ans+1", 30),
("us_31", U, "us_ans := !us_ans+1", 31),
("us_32", U, "us_ans := !us_ans+1", 32),
("us_33", U, "us_ans := !us_ans+1", 33),
("us_34", U, "us_ans := !us_ans+1", 34),
("us_35", U, "us_ans := !us_ans+1", 35),
("us_36", U, "us_ans := !us_ans+1", 36),
("us_37", U, "us_ans := !us_ans+1", 37),
("us_38", U, "us_ans := !us_ans+1", 38),
("us_39", U, "us_ans := !us_ans+1", 39),
];
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\section{TRANSLATING FOR OUTPUT} \label{TranslatingForOutput}

Function $translate_for_output$, a lot of the test cases here are to
ensure that the strings being manipulated have the expected contents.
Remember that percent signs get processed on both input and output,
capital letter `{\tt Q}'s are processed on output, they are also
processed by function $translate_for_output$ which is the focus of
these tests.  Thus we must ensure that the input and output processing
is accommodated here.

=SMLPLAIN
let
val to_1 = "Δ";
val to_2 = "%%Delta%%";
val to_3 = "Δ%calA%";
val to_4 = "%%Delta%%%%calA%%";

val to_5 = W_2Q "Delta";
val to_6 = W_4Q "Delta";
val to_7 = (W_2Q "Delta") ^ (W_2Q "calA");
val to_8 = (W_4Q "Delta") ^ (W_4Q "calA");

val to_9 = C_2Q ^ "Delta";
val to_10 = C_4Q ^ "Delta";
val to_11 = (W_2Q "Delta") ^ C_2Q ^ "calA";
val to_12 = (W_4Q "Delta") ^ C_4Q ^ "calA";

val T = ReaderWriter.translate_for_output;
fun ST s = T(W_dq s);
in
set_flag("use_extended_chars", true);
=TEX

Check that the input strings are built correctly, by length and by content.

=IGN
map size[to_1, to_2, to_3, to_4, to_5, to_6, to_7, to_8];

=SML
store_mt_results_show mt_run[
("to_1a", size, to_1, 1),
("to_2a", size, to_2, 7),
("to_3a", size, to_3, 7),
("to_4a", size, to_4, 13),
("to_5a", size, to_5, 9),
("to_6a", size, to_6, 13),
("to_7a", size, to_7, 17),
("to_8a", size, to_8, 25)
,("to_9a", size, to_9, 7)
,("to_10a", size, to_10, 9)
,("to_11a", size, to_11, 15)
,("to_12a", size, to_12, 21)
];

store_mt_results_show mt_run[
("to_1b", I, to_1, "Δ"),
("to_2b", I, to_2, W_pc "Delta"),
("to_3b", I, to_3, "Δ" ^ (W_pc "calA")),
("to_4b", I, to_4, (W_pc "Delta") ^ (W_pc "calA")),
("to_5b", I, to_5, W_2Q "Delta"),
("to_6b", I, to_6, W_4Q "Delta"),
("to_7b", I, to_7, (W_2Q "Delta") ^ (W_2Q "calA")),
("to_8b", I, to_8, (W_4Q "Delta") ^ (W_4Q "calA"))
,("to_9b",  I, to_9, C_2Q ^ "Delta")
,("to_10b",  I, to_10, C_4Q ^ "Delta")
,("to_11b",  I, to_11, (W_2Q "Delta") ^ C_2Q ^ "calA")
,("to_12b",  I, to_12, (W_4Q "Delta") ^ C_4Q ^ "calA")
];
=TEX

Run the tests.  Function $T$ does a translate, function $ST$ encloses
the text in double quotes, then does a translate.

=SML
store_mt_results_show mt_run[
("to_1c", T, to_1, "Δ"),
("to_2c", T, to_2, "Δ"),
("to_3c", T, to_3, "Δ" ^ (W_pc "calA")),
("to_4c", T, to_4, "Δ" ^ (W_pc "calA")),
("to_5c", T, to_5, "Δ"),
("to_6c", T, to_6, W_1Q "Delta"),
("to_7c", T, to_7, "Δ" ^ (W_pc "calA")),
("to_8c", T, to_8, (W_1Q "Delta") ^ (W_1Q "calA"))
,("to_9c", T, to_9, (W_pc C_Q) ^ (W_pc C_Q) ^ "Delta")
,("to_10c", T, to_10, C_Q ^ "Delta")
,("to_11c", T, to_11, "Δ" ^ (W_pc C_Q) ^ (W_pc C_Q) ^ "calA")
,("to_12c", T, to_12, (W_1Q "Delta") ^ C_Q ^ "calA")
];

store_mt_results_show mt_run[
("to_1d", ST, to_1, W_dq "Δ"),
("to_2d", ST, to_2, W_dq "Δ"),
("to_3d", ST, to_3, W_dq("Δ" ^ (W_pc "calA"))),
("to_4d", ST, to_4, W_dq("Δ" ^ (W_pc "calA"))),
("to_5d", ST, to_5, W_dq(CS_pcQpc ^ CS_pcQpc ^ "Delta" ^ CS_pcQpc ^ CS_pcQpc)),
("to_6d", ST, to_6, W_dq(W_1Q "Delta")),
("to_7d", ST, to_7, W_dq(CS_pcQpc ^ CS_pcQpc ^ "Delta" ^ C_Q ^ "calA"
			^ CS_pcQpc ^ CS_pcQpc)),
("to_8d", ST, to_8, W_dq((W_1Q "Delta") ^ (W_1Q "calA")))
,("to_9d", ST, to_9, W_dq(CS_pcQpc ^ CS_pcQpc ^ "Delta"))
,("to_10d", ST, to_10, W_dq(C_Q ^ "Delta"))
,("to_11d", ST, to_11, W_dq(CS_pcQpc ^ CS_pcQpc ^ "Delta" ^ C_Q ^ "calA"))
,("to_12d", ST, to_12, W_dq(C_Q ^ "Delta" ^ C_Q ^ C_Q ^ "calA"))
];
=TEX
Now try some nasty cases:
=IGN
val T = ReaderWriter.translate_for_output;
=SML
store_mt_results_show mt_run[
("to_nasty_1", T, C_pc, C_pc ^ C_pc),
("to_nasty_2", T, "f" ^ C_pc ^ "g", "f" ^ C_pc ^ C_pc ^ "g"),
("to_nasty_3", T, "f" ^ C_pc ^ "delta", "f" ^ C_pc ^ C_pc ^ "delta"),
("to_nasty_4", T, "f" ^ C_pc ^ "caterpillar" ^ C_pc,
		"f" ^ C_pc ^ C_pc ^ "caterpillar" ^ C_pc ^ C_pc),
("to_nasty_5", T, "f" ^ C_pc ^ "caterpillar" ^ C_pc ^ "g",
		"f" ^ C_pc ^ C_pc ^ "caterpillar" ^ C_pc ^ C_pc ^ "g"),
("to_nasty_6", T, C_pc ^ "caterpillar" ^ C_pc ^ "g",
		C_pc ^ C_pc ^ "caterpillar" ^ C_pc ^ C_pc ^ "g"),
("to_nasty_7", T, "f" ^ C_Q ^ C_Q ^ "g",
	"f"^ CS_pcQpc ^ C_pc ^ C_Q  ^ C_pc ^ "g"),
("to_nasty_8", T, "f" ^ C_Q ^ C_Q ^ "g" ^ C_Q ^ C_Q ^ "h",
	"f"^ CS_pcQpc ^ C_pc ^ C_Q  ^ C_pc ^ "g" ^ C_pc ^ C_Q  ^ C_pc ^ C_pc ^ C_Q  ^ C_pc ^ "h"),
("to_nasty_9", T, "f" ^ C_Q ^ C_Q ^ "delta" ^ C_Q ^ C_Q ^ "h",
	"f"^ "δ" ^ "h"),
("to_nasty_10", T, C_Q, CS_pcQpc),
("to_nasty_11", T, CS_pcQpc, C_pc ^ C_pc ^ CS_pcQpc ^ C_pc ^ C_pc)
];
=TEX
Run some of the tests again without using extended characters.
The test series match as follows:
`$to_*c$' with `$to_*e$' and
`$to_*d$' with `$to_*f$'.

=SML
set_flag("use_extended_chars", false);

store_mt_results_show mt_run[
("to_1e", T, to_1, W_pc "Delta"),
("to_2e", T, to_2, W_pc "Delta"),
("to_3e", T, to_3, (W_pc "Delta") ^ (W_pc "calA")),
("to_4e", T, to_4, (W_pc "Delta") ^ (W_pc "calA")),
("to_5e", T, to_5, W_pc "Delta"),
("to_6e", T, to_6, W_1Q "Delta"),
("to_7e", T, to_7, (W_pc "Delta") ^ (W_pc "calA")),
("to_8e", T, to_8, (W_1Q "Delta") ^ (W_1Q "calA"))
,("to_9e", T, to_9, (W_pc C_Q) ^ (W_pc C_Q) ^ "Delta")
,("to_10e", T, to_10, C_Q ^ "Delta")
,("to_11e", T, to_11, (W_pc "Delta") ^ (W_pc C_Q) ^ (W_pc C_Q) ^ "calA")
,("to_12e", T, to_12, (W_1Q "Delta") ^ C_Q ^ "calA")
];

store_mt_results_show mt_run[
("to_1f", ST, to_1, W_dq((W_pc "Delta"))),
("to_2f", ST, to_2, W_dq((W_pc "Delta"))),
("to_3f", ST, to_3, W_dq((W_pc "Delta") ^ (W_pc "calA"))),
("to_4f", ST, to_4, W_dq((W_pc "Delta") ^ (W_pc "calA"))),
("to_5f", ST, to_5, W_dq(CS_pcQpc ^ CS_pcQpc ^ "Delta" ^ CS_pcQpc ^ CS_pcQpc)),
("to_6f", ST, to_6, W_dq(W_1Q "Delta")),
("to_7f", ST, to_7, W_dq(CS_pcQpc ^ CS_pcQpc ^ "Delta" ^ C_Q ^ "calA"
			^ CS_pcQpc ^ CS_pcQpc)),
("to_8f", ST, to_8, W_dq((W_1Q "Delta") ^ (W_1Q "calA")))
,("to_9f", ST, to_9, W_dq (CS_pcQpc ^ CS_pcQpc ^ "Delta"))
,("to_10f", ST, to_10, W_dq (C_Q ^ "Delta"))
,("to_11f", ST, to_11, W_dq (CS_pcQpc ^ CS_pcQpc ^ "Delta" ^ C_Q ^ "calA"))
,("to_12f", ST, to_12, W_dq(C_Q ^ "Delta" ^ C_Q ^ C_Q ^ "calA"))
];

set_flag("use_extended_chars", true)
end;
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\section{TESTS OF SIMPLE FUNCTIONS}

Functions $local_error$ and $local_warn$ return units but print things out.

=SML
let open ReaderWriterSupport; in
store_mt_results_show mt_run[
("sf_local_error", local_error "aardvark" 5004, [fn () => "aardvark"], ()),
("sf_local_warn", local_warn "aardvark" 5011, nil, ())
] end;
=TEX

=SML
let open ReaderWriterSupport; in
store_mt_results_show mt_run[
("sf_add_error_code", add_error_code, (21, ["zzz"]), [" ERROR__21 ", "zzz"])
] end;
=TEX

=SML
let open ReaderWriterSupport; in
store_mt_results_show mt_run[
("sf_add_error_codes_1", add_error_codes, ([22, 23, 24], ["zzz"]),
	[" ERROR__22 ", " ERROR__23 ", " ERROR__24 ", "zzz"]),
("sf_add_error_codes_2", add_error_codes, (nil, ["zzz"]), ["zzz"])
] end;
=TEX

=SML
let open ReaderWriterSupport; in
store_mt_results_show mt_run[
("sf_is_special_char_1", is_special_char, "!", true),
("sf_is_special_char_2", is_special_char, ":", true),
("sf_is_special_char_3", is_special_char, "@", true),
("sf_is_special_char_4", is_special_char, "*", true),
("sf_is_special_char_5", is_special_char, "", false),
("sf_is_special_char_6", is_special_char, "!!", false),
("sf_is_special_char_7", is_special_char, C_dq, false),
("sf_is_special_char_8", is_special_char, " ", false),
("sf_is_special_char_9", is_special_char, "abc", false),
("sf_is_special_char_10", is_special_char, "A", false),
("sf_is_special_char_11", is_special_char, "b", false)
] end;
=TEX

=SML
let open ReaderWriterSupport; in
store_mt_results_show mt_run[
("sf_string_of_int3_1", string_of_int3, 0, "000"),
("sf_string_of_int3_2", string_of_int3, 1, "001"),
("sf_string_of_int3_3", string_of_int3, 27, "027"),
("sf_string_of_int3_4", string_of_int3, 145, "145"),
("sf_string_of_int3_5", string_of_int3, 367, "367"),
("sf_string_of_int3_6", string_of_int3, 998, "998"),
("sf_string_of_int3_7", string_of_int3, 999, "999")
] end;
=TEX

=SML
let open ReaderWriterSupport; in
store_mt_results_show mt_run[
("sf_to_ML_string_1", to_ML_string, " abcdef(* *)\n", " abcdef(* *)\n"),
("sf_to_ML_string_2", to_ML_string, "\241", "\\241"),
("sf_to_ML_string_3", to_ML_string, "\000\001\002", "\\000\\001\\002"),
("sf_to_ML_string_4", to_ML_string, "\126\127\128\129", "\126\\127\\128\\129"),
("sf_to_ML_string_5", to_ML_string, "\030\031\032\033\034", "\\030\\031\032\033\034"),
("sf_to_ML_string_6", to_ML_string, "\255\254\253", "\\255\\254\\253")
] end;
=TEX

=SML
let open ReaderWriterSupport; in
store_mt_results_show mt_run_fail[
("sf_string_of_int3_8", string_of_int3, 1000, gen_fail_msg "string_of_int3" 5040 ["1000"]),
("sf_string_of_int3_9", string_of_int3, ~1, gen_fail_msg "string_of_int3" 5040 ["-1"]),
("sf_string_of_int3_10", string_of_int3, ~1001,
			gen_fail_msg "string_of_int3" 5040 ["-1001"]),
("sf_string_of_int3_11", string_of_int3, 20051, gen_fail_msg "string_of_int3" 5040 ["20051"])
] end;
=TEX

\subsection{Extended Character Database}

First tests are to see if some expected keywords and characters are
present and absent.

=SMLLITERAL
let
open ReaderWriterSupport.PrettyNames;
open ReaderWriterSupport;

fun	aux1 Simple = "Simple"
|	aux1 Ignore = "Ignore"
|	aux1 Invalid = "Invalid"
|	aux1 (Starting(_, str)) = "Starting" ^ str
|	aux1 (Middle str) = "Middle" ^ str
|	aux1 (Ending str) = "Ending" ^ str;

fun	aux2 Nil = Nil
|	aux2 (Value(a, b, c)) = Value(a, b, aux1 c);

fun N s = aux2(find_name s);
fun C s = aux2(find_char s);

val sep_where = "Middle\", Lex.Separator\"" ^
	to_ML_string "├" ^ "\", Lex.Text\"";

in
=TEX

=SMLLITERAL
store_mt_results_show mt_run[
("ecd_1", N, "<", Value (["<"], Value "⌜", "Starting")),
("ecd_2", N, "BT", Value (["BT"], Value "├", sep_where)),
("ecd_3", N, "lambda", Value (["fn", "lambda"], Value "λ", "Simple")),
("ecd_4", N, "fn", Value (["fn", "lambda"], Value "λ", "Simple")),
("ecd_5", N, "notakeyword", Nil)
];

store_mt_results_show mt_run[
("ecd_6", C, "⌜", Value (["<"], Value "⌜", "Starting")),
("ecd_7", C, "├", Value (["BT"], Value "├", sep_where)),
("ecd_8", C, "λ", Value (["fn", "lambda"], Value "λ", "Simple")),
("ecd_9", C, "X", Nil),
("ecd_10", C, C_Q, Value ([C_Q], Value C_Q, "Simple"))
]
end;
=TEX

These tests all return a value of type unit, they do not fail.
With some future version of the reader writer failure may be
more appropriate.

=SML
val A = ReaderWriterSupport.PrettyNames.add_new_symbols;
val S = ReaderWriterSupport.PrettyNames.Simple;

store_mt_results_show mt_run[
("ans_1_5100", (fn () => true) o A, [
	([	"abc" ^ C_2Q ^ "def"],	Nil,				S),
	([	C_2Q ^ "def"],	Nil,				S),
	([	"abc" ^ C_2Q],	Nil,				S),
	([	C_2Q],		Nil,				S)
], true)
];

store_mt_results_show mt_run_fail[
("ans_2_5103", A, [
	([	C_Q],		Nil,				S)
], gen_fail_msg "add_new_symbols" 5103 [C_Q])
];

store_mt_results_show mt_run_fail[
("ans_3_5104", A, [
	([	"ans_3_5104"],	Value "λ",			S)
], gen_fail_msg "add_new_symbols" 5104 ["λ"])
];

store_mt_results_show mt_run[
("ans_4_5101", (fn () => true) o A, [
	([	],		Nil,				S)
], true)
];

store_mt_results_show mt_run[
("ans_5_5102", (fn () => true) o A, [
	([	],		Value "Ab",			S),
	([	],		Value "",			S)
], true)
];

store_mt_results_show mt_run[
("ans_1_nasty_a", (fn () => true) o A, [
	([	C_Q ^ "ueer"],		Nil,				S)
], true)
];
=TEX
Check thoses Q keywords:
=SML
store_mt_results_show mt_run[
("ans_1_nasty1", translate_for_output, C_pc ^ C_Q ^ "ueer" ^ C_pc,
	C_pc ^ C_Q ^ "ueer" ^ C_pc),
("ans_1_nasty2", translate_for_output, C_dq ^ C_pc ^
	C_Q ^ "ueer" ^ C_pc ^ C_dq, C_dq ^ C_pc ^ C_Q ^ "ueer" ^ C_pc ^ C_dq),
("ans_1_nasty3", translate_for_output, C_pc ^ C_Q ^ "uash" ^ C_pc,
	 C_pc ^ C_pc ^ CS_pcQpc ^ "uash" ^ C_pc ^ C_pc),
("ans_1_nasty4", translate_for_output,
	C_dq ^ C_pc ^ 	C_Q ^ "uote" ^ C_pc ^ C_dq,
	C_dq ^ C_pc ^ C_pc ^ 	CS_pcQpc ^ "uote" ^ C_pc ^ C_pc ^ C_dq)
];
=TEX

\subsection{Reader Functions}

Setting and getting reader functions manipulates values of functional
type, indeed these functions are the access to a database of functional
values.  The module test harness does not allow comparison of
functional values so we only check the non-functional part of the
values returned.

=SML
let
fun GG s = case ReaderWriterSupport.look_up_general_reader s
		of Nil => Nil | Value (_, x) => Value x;
in
store_mt_results_show mt_run[
("rf_1a", GG, ("⌜", "HOL"), Value "Lex.Term"),
("rf_2a", GG, ("⌜", "HOL:"), Value "Lex.Type"),
("rf_6a", GG, ("⌜", "XR"), Nil),
("rf_9a", GG, ("⌜", ""), Value "Lex.Term")
]
end;
=TEX

=SML
let
fun GS s = case ReaderWriterSupport.look_up_specific_reader s
		of Nil => Nil | Value (_, x) => Value x;
in
store_mt_results_show mt_run[
("rf_3a", GS, "HOL", Nil),
("rf_4a", GS, "ⓣ", Value "Lex.Type"),
("rf_5a", GS, "XS", Nil),
("rf_10a", GS, "ⓜ", Value "Lex.Term")
]
end;
=TEX

=SML
let
fun GN s = case ReaderWriterSupport.look_up_named_reader s
		of Nil => Nil | Value (_, x) => Value x;
in
store_mt_results_show mt_run[
("rfn_1a", GN, ("Ⓢ", ""), Nil),
("rfn_2a", GN, ("Ⓢ", "HOLCONST"), Value "NONE"),
("rfn_3a", GN, ("Ⓢ", "XS"), Nil)
]
end;
=TEX

General reader tests.

=SML
let
val add_G = ReaderWriterSupport.add_general_reader;
val look_G = ReaderWriterSupport.look_up_general_reader;

fun GG s = case look_G s of Nil => Nil | Value (_, x) => Value x;

val Value(SML_general_reader, "Lex.Term") = look_G ("⌜", "");
in

store_mt_results_show mt_run[
("rf_add_1", (fn () => true) o add_G, ("⌜", "XG", "rf_gg::rf_gg", SML_general_reader), true)
];

store_mt_results_show mt_run[
("rf_1b", GG, ("⌜", "HOL"), Value "Lex.Term"),
("rf_2b", GG, ("⌜", "HOL:"), Value "Lex.Type"),
("rf_6b", GG, ("⌜", "XS"), Nil),
("rf_8b", GG, ("⌜", "XG"), Value "rf_gg::rf_gg")
];

store_mt_results_show mt_run_fail[
("rf_add_3", add_G, ("⌜", "XG", "rf_gg::rf_gg", SML_general_reader),
	gen_fail_msg "add_general_reader" 5033 ["⌜XG"])
]end;
=TEX

Specific reader tests.

=SML
let
val add_S = ReaderWriterSupport.add_specific_reader;
val look_S = ReaderWriterSupport.look_up_specific_reader;

fun GS s = case look_S s of Nil => Nil | Value (_, x) => Value x;

val Value(SML_specific_reader, "Lex.Term") = look_S "ⓜ";
in

store_mt_results_show mt_run[
("rf_add_2", (fn () => true) o add_S, ("⊎", "rf_ss::rf_ss", SML_specific_reader), true)
];

store_mt_results_show mt_run[
("rf_3b", GS, "HOL", Nil),
("rf_4b", GS, "HOL:", Nil),
("rf_5b", GS, "⊎", Value "rf_ss::rf_ss"),
("rf_7b", GS, "XG", Nil)
];

store_mt_results_show mt_run_fail[
("rf_add_4", add_S, ("⊎", "rf_ss::rf_ss", SML_specific_reader),
	gen_fail_msg "add_specific_reader" 5033 ["⊎"])
]end;
=TEX

Named reader tests.

=SML
let
val add_N = ReaderWriterSupport.add_named_reader;
val look_N = ReaderWriterSupport.look_up_named_reader;

fun GN s = case look_N s of Nil => Nil | Value (_, x) => Value x;

val Value(prod_named_reader, _) = look_N("Ⓢ", "HOLLABPROD");
in

store_mt_results_show mt_run[
("rfn_add_2", (fn () => true) o add_N, ("Ⓢ", "XN", "rfn_ss::rfn_ss",
		prod_named_reader), true)
];

store_mt_results_show mt_run[
("rfn_3b", GN, ("Ⓢ", "HOL"), Nil),
("rfn_4b", GN, ("Ⓢ", "HOL:"), Nil),
("rfn_5b", GN, ("Ⓢ", "XN"), Value "rfn_ss::rfn_ss"),
("rfn_7b", GN, ("Ⓢ", "XG"), Nil)
];

store_mt_results_show mt_run_fail[
("rfn_add_4", add_N, ("Ⓢ", "XN", "rf_ss::rf_ss", prod_named_reader),
	gen_fail_msg "add_named_reader" 5033 ["ⓈXN"])
]end;
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\section{SYMBOL MANIPULATION}

Symbol expansion.

=SML
let
	open ReaderWriterSupport;
	val es = expand_symbol;
	fun get_kw k = force_value(PrettyNames.find_name k);
in
store_mt_results_show mt_run[
("es_ch",	es, SymCharacter	"abc", "abc"),
("es_wh",	es, SymWhite		[" ", " ", "\t", "\n"], "\n\t  "),
("es_knt",	es, SymKnown		("and", true, get_kw "and"), W_pc "and"),
("es_knf",	es, SymKnown		("∧", false, get_kw "and"), "∧"),
("es_ukwt",	es, SymUnknownKw	("abc", true), W_pc "abc"),
("es_ukwf",	es, SymUnknownKw	("abc", false), C_pc ^ "abc"),
("es_uc",	es, SymUnknownChar	"X", "X"),
("es_dp",	es, SymDoublePercent	, C_pc ^ C_pc)
]
end;
=TEX

Symbol comparison.

=SML
let
	val iss = ReaderWriterSupport.PrettyNames.is_same_symbol;
in

store_mt_results_show mt_run[
("iss01",	iss, ("abc", "abc"), true),
("iss02",	iss, ("abc", "abc "), false),
("iss03",	iss, ("", ""), true),
("iss04",	iss, ("", "abc "), false),

("iss11",	iss, ("Π", "Π"), true),
("iss12",	iss, ("Π", "Π"), true),
("iss13",	iss, ("Π", "Π"), true),
("iss14",	iss, ("Π", "Π"), true),

("iss21",	iss, ("%calD%", "%calD%"), true),

("iss31",	iss, ("β", "β"), true),
("iss32",	iss, ("β", "β"), true),
("iss33",	iss, ("β", "β"), true),
("iss34",	iss, ("β", "β"), true),

("iss41",	iss, ("Π", "β"), false),
("iss42",	iss, ("β", "Π"), false),
("iss43",	iss, ("β", "Π"), false),
("iss44",	iss, ("β", "Π"), false)
]
end;
=TEX

=SML
let
	val iw = ReaderWriterSupport.is_white;
in
store_mt_results_show mt_run[
("iw1", iw, " ", true),
("iw2", iw, "\t", true),
("iw3", iw, "\n", true),
("iw4", iw, "\t\t", false),
("iw5", iw, "   ", false),
("iw6", iw, "", false),
("iw7", iw, "a", false),
("iw8", iw, "ℕ", false),
("iw9", iw, "ℙro𝔽essioℕaliℤe", false)
]
end;
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\section{Reading HOL Language}

Some simple tests of the HOL reading functions.  Here we are not
reading real HOL terms, we are not interested in the workings of the
HOL lexical analyser, parser, etc.  Rather we just want to see that
the HOL Reader Writer builds the correct text.

First hide the proper HOL recogniser and get an identity routine.
Later the real recogniser will be replaced.

=SML
val save_HOL_term_recogniser = HOL_term_recogniser;
val HOL_term_recogniser = Combinators.I;
=TEX

=SML
let
	open Lex;

	fun eq_input(args: INPUT * INPUT) : bool = (
		case args
		of (Text l, Text r) => l = r
		| (String l, String r) => l = r
		| (Char l, Char r) => l = r
		| (Separator l, Separator r) => l = r
		| (Error l, Error r) => l = r
		| _ => false
	);
	
	fun eq_input_list(lh::lt, rh::rt) =
		eq_input(lh, rh) andalso eq_input_list(lt, rt)
	| eq_input_list(nil, nil) = true
	| eq_input_list _ = false;

	val iss = ReaderWriterSupport.PrettyNames.is_same_symbol;

	type TT = string * string * INPUT list * string;
	
	fun eq_rec_args((la, lb, lc, ld) : TT, (ra, rb, rc, rd) : TT) = (
			iss		(la, ra)
		andalso	iss		(lb, lb)
		andalso	eq_input_list	(lc, lc)
		andalso	iss		(ld, ld)
	);
in
store_mt_results_show (mt_runf eq_rec_args)[
("rhl_01",	Combinators.I,	⌜a⌝, ("⌜", "", [Text "a"], "⌝")),
("rhl_02",	Combinators.I,	⌜a b⌝, ("⌜", "", [Text "a b"], "⌝")),
("rhl_03",	Combinators.I,	⌜δ⌝, ("⌜", "", [Text "δ"], "⌝")),
("rhl_04",	Combinators.I,	⌜%calA%⌝, ("⌜", "", [Text(W_pc "calA")], "⌝")),
("rhl_05",	Combinators.I,	⌜%calA%%calB%⌝,
			("⌜", "", [Text((W_pc "calA") ^ (W_pc "calB"))], "⌝"))
]
end;
=TEX

Restore the HOL recogniser.

=SML
val HOL_term_recogniser = save_HOL_term_recogniser;
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\section{FAULT HANDLING}

Provoke some reader writer error messages.  Note that there is no way
to provide a handler for these messages.  They are generated by the
reader writer, the calling environment (i.e., $use_terminal$, $use_file$
or $use_string$) then handles them and continues or exits.  These error
messages generate text that is written on standard output.  To allow
the test to run the non-stop-mode option of $use_file$ must be enabled.

Notes on error codes which cannot be tested and error codes which
generate the text for output messages.

\begin{description}

\item[5502 ] holds text that is printed with each of the messages in
	the tests below, it indicates that $use_file$ is continuing
	after an error whilst in non-stop-mode.

\item[5503 ] holds text printed when $use_file$ stops reading a file
	after an error is detected.  It can only be tested during
	integration tests.

\item[5012 {\rm and} 5013 ] relate to function $ask_at_terminal$, code
	5012 is only issued when $use_terminal$ is not active, but it is
	active whilst these tests are running.  Code 5013 is dependent
	upon how the PolyML session was started, it can only be tested
	during integration tests.

\item[5512 ] holds text printed when $use_string$ stops reading a string
	after an error is detected.  It is tested here but its number
	is not printed.

\item[5521 {\rm and} 5522 ] can only be checked during integration
	testing, they hold text printed when function $use_terminal$
	handles an exception returned by PolyML at top level.

\item[5523 ] holds text printed when $use_terminal$ reads an end of file
	and stops the whole session by calling $PolyML.quit$.

\end{description}

=SMLPLAIN
"Setting use_file_non_stop_mode = true";
set_flag("use_file_non_stop_mode", true);

"e_5001";	use_string "(* end of (input) in comment"; (*=)*)
"e_5002";	use_string "\" end of (input) in string";   (*="=*)
"e_5003_a";	use_string "\"unknown keyword %%aardvark%% in string\"";
"e_5003_b";	use_string "unknown keyword %%aardvark%% in ML text";
"e_5003_c";	use_string "%%<%%unknown keyword %%aardvark%% in HOL text%%>%%";
"e_5005_a";	use_string "(168 \168)  (150  \150)";
"e_5005_b";	use_string "%%<%%(168 \168)  (150  \150)%%>%%";
"e_5006_a";	use_string "%%<%%%%dntext%%unknown%%cantext%% (168 \168)  (150  \150)%%>%%";
"e_5006_b";	use_string "%%<%%%%dntext%%unknown (168 \168)  (150  \150)%%>%%";
=TEX
There are no characters of type $Invalid$ at present,
if and when we get some then
do some tests of error 5007.

=IGN
"e_5007_a";	use_string "\214 known character, but invalid";
"e_5007_b";	use_string "%%<%% \214 known character, but invalid%%>%%";
=SMLPLAIN
"e_5008_rb";	use_string "(123]";
"e_5008_rc";	use_string "(123}";
"e_5008_br";	use_string "[123)";
"e_5008_bc";	use_string "[123}";
"e_5008_cb";	use_string "{123]";
"e_5008_cr";	use_string "{123)";
"e_5010_a";	use_string "%%<%%%%dntext%%unknown%%cantext%% skipped text%%>%%";
"e_5010_b";	use_string("%%<%%%%dntext%%unknown%%cantext%% skipped %%<%% skipped" ^
			"HOL text %%>%% text%%>%%");
"e_5010_c";	use_string "%%<%%%%dntext%%unknown skipped text%%>%%";
"e_5010_d";	use_string("%%<%%%%dntext%%unknown skipped %%<%% skipped" ^
			"HOL text %%>%% text%%>%%");
"e_5010_e";	use_string "%%<%%%%dntext%%SML end of (input) in SML quotation";
"e_5014";	use_string "\"abc\ndef\"";
"e_5012";	use_string "let exception aadrvark in raise aadrvark end;";
"e_5030_a";	use_string
"%%<%%%%dntext%%unknown%%cantext%% end of (input) in skipped quotation";
"e_5030_b";	use_string "%%<%%%%dntext%%unknown end of (input) in skipped quotation";
"e_5032_a";	use_string "%%<%%%%dntext%%SML%%cantext%% end of (input) in SML quotation";

set_flag("use_file_non_stop_mode", false);
"Setting use_file_non_stop_mode = false";
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\section{SML RECOGNISER}

=SML
store_mt_results_show mt_run[
("sr_1a", I, ⓜ 27⌝, 27)
];

store_mt_results_show mt_run[
("sr_1b", I, ⌜↘SML↕ 27⌝, 27)
];

store_mt_results_show mt_run[
("sr_1c", I, ⌜↘SML↕ 27⌝, 27)
];

store_mt_results_show mt_run[
("sr_1d", I, ⌜↘SML↕ 27⌝, 27)
];

store_mt_results_show mt_run[
("sr_1e", I, ⌜↘SML↕ 27⌝, 27)
];

store_mt_results_show mt_run[
("sr_1f", I, ⌜↘SML↕ 27⌝, 27)
];

store_mt_results_show mt_run[
("sr_1g", I, ⌜↘SML↕ 27⌝, 27)
];

store_mt_results_show mt_run[
("sr_1h", I, ⌜↘SML↕ 27⌝, 27)
];

store_mt_results_show mt_run[
("sr_1i", I, ⌜↘SML↕ 27⌝, 27)
];

store_mt_results_show mt_run[
("sr_1j", I, ⌜⋎SML 27⌝, 27)
];

store_mt_results_show mt_run[
("sr_2", I, ReaderWriterSupport.SML_recogniser("⌜", "SML", 27, "⌝"), 27)
];

let
	val smlr = ReaderWriterSupport.SML_recogniser;
	val gf = gen_fail_msg "SML_recogniser" 5050;
in
store_mt_results_show mt_run_fail[
("sr_3a", smlr, ("", "SML", 27, "⌝"), gf ["", "SML", "⌝"]),
("sr_3b", smlr, ("⌜", "", 27, "⌝"), gf ["⌜", "", "⌝"]),
("sr_3c", smlr, ("⌜", "SML", 27, ""), gf ["⌜", "SML", ""])
]
end;
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\section{SIMPLE OUTPUT}

The results of these tests must in part be checked by eye,
checking that the line lengths and separation of the output is correct.
$get\_line\_length$ is tested implicitly by ``$set\-\_line\-\_length$ 1''.
Note that tabs are counted as one character wide in $diag\_string$, etc, and thus might give actual line lengths
greater than desired.
=SML
val orig_line_length = get_line_length ();

val teststring = "sdljfv lkirhnf d;fljnq lkwedjfn ldkfjbnwqd;kfjn  " ^
" ;ouinwefw  ;kiweujnbfwqel  iwe;lnfbu   wedjbnfkl; l;dkifcujbn l" ^
"  kwjedb lk jbn  el;i  uew bhnl;kij we bljhweb ,";
val twentytabs =
	"t \tt \tt \tt \tt \t"^
	"t \tt \tt \tt \tt \t"^
	"t \tt \tt \tt \tt \t"^
	"t \tt \tt \tt \tt \tt";
diag_string teststring;
diag_string twentytabs;
store_mt_results mt_run [("set_line_length 1",
	set_line_length,
	20,
	orig_line_length)
	];
store_mt_results mt_run_fail [("set_line_length 1015",
	set_line_length,
	10,
	gen_fail_msg "set_line_length" 1015 [])];
diag_string teststring;
diag_string twentytabs;
store_mt_results mt_run [("set_line_length 2",
	set_line_length,
	orig_line_length,
	20)
	];
diag_string teststring;

list_diag_string ["abc","def","gh ij"];

map diag_line ["one", "two", "three"];
map diag_string ["one", "two", "three"];
=TEX
Now test whether it is indeed doing some translation:
=SML
val test_string2 = "∧∨";
val temp_use_extended_chars = set_flag("use_extended_chars",true);
diag_string test_string2;
list_diag_string [test_string2,test_string2];
diag_line test_string2;
set_flag("use_extended_chars",false);
diag_string test_string2;
list_diag_string [test_string2,test_string2];
diag_line test_string2;
set_flag("use_extended_chars",temp_use_extended_chars);
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\section{PROMPT STRING VALIDATION}

Check that prompt strings are properly validated.

=SMLPLAIN
"Prompt String Validation";

store_mt_results_show mt_run[
("psv01", set_string_control, ("prompt1", "OK"), ":) "),
("psv02", set_string_control, ("prompt1", "   OK again   "), "OK"),
("psv03", set_string_control, ("prompt1", chr 126), "   OK again   "),
("psv04", set_string_control, ("prompt1", ":) "), chr 126)
];

let
	val gf = gen_fail_msg "set_string_control" 2012;
in
store_mt_results_show mt_run_fail[
("psv11", set_string_control, ("prompt1", chr(ord " " - 1)), gf ["prompt1"]),
("psv12", set_string_control, ("prompt1", "%%"), gf ["prompt1"]),
("psv13", set_string_control, ("prompt1", C_Q), gf ["prompt1"]),
("psv14", set_string_control, ("prompt1", "ℕ"), gf ["prompt1"]),
("psv15", set_string_control, ("prompt1", chr 127), gf ["prompt1"])
]
end;
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\section{Unicode and UTF-8}
=TEX
=IGN
set_int_control("RW_diagnostics", 0);
set_int_control("RW_diagnostics", 16);
=SMLPLAIN
(diag_line o unicode_to_utf8 o pp_to_unicode) #"⌝";
set_flag("use_extended_chars", true);
set_flag("input_in_utf8", true);
set_flag("output_in_utf8", true);
=TEX
The UTF-8 in the next line of ML is suppressed from the typeset
document because it contains what are used in the {\Product}
character set as box-drawing characters. 
\Hide{
=SMLPLAIN
store_mt_results_show mt_run[("uu_1a", I, ⊥Σ═ 27 ⊥Λ╒, 27)];
=TEX
}
=SMLPLAIN
store_mt_results_show mt_run[
("uu_2a", translate_for_output, "\181", "\226\136\128")
];
use_utf8_string "val \226\136\128 = 99;";
=TEX
=SML
set_flag("input_in_utf8", false);
set_flag("output_in_utf8", false);
store_mt_results_show mt_run[
("uu_3a", I, ∀, 99)
];
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\section{END OF TEST FILE}
(map ord o explode) all_chars;

=SML
"End of test file";

diag_line(summarize_mt_results());
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%********************************************************************
%--------------------------------------------------------------------

\end{document}

\twocolumn[\section{INDEX}]
\small
\printindex

\end{document}

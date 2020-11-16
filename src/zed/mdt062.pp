=IGN
********************************************************************************
mdt062.doc: this file is part of the PPZed system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  mdt062.doc ℤ $Date: 2011/07/11 10:17:39 $ $Revision: 1.27 $ $RCSfile: mdt062.doc,v $

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

\def\Title{Module Tests for Z Type Inference}

\def\AbstractText{This document comprises test cases and test data for the Z type inferrer.}

\def\Reference{DS/FMU/IED/MDT062}

\def\Author{D.J. King}


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
%% LaTeX2e port: \TPPtitle{Module Tests for Z Type Inference}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/MDT062}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.27 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2011/07/11 10:17:39 $%
%% LaTeX2e port: }}  %% Mandatory field (with sensible default)
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: %\TPPstatus{Approved}
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{HOL, Z}
%% LaTeX2e port: \TPPauthor{D.J.~King & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{
%% LaTeX2e port: This document comprises test cases and test data for
%% LaTeX2e port: the Z type inferrer.}
%% LaTeX2e port: %\TPPabstractB{}
%% LaTeX2e port: %\TPPabstractC{}
%% LaTeX2e port: %\TPPabstractD{}
%% LaTeX2e port: %\TPPabstractE{}
%% LaTeX2e port: %\TPPabstractF{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port:       Library \\ R.D. Arthan\\ D.J. King}}
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

\pagebreak
\section{DOCUMENT CONTROL}
\subsection{Contents List}
\tableofcontents
\subsection{Document Cross References}
\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes History}  % to get section number `0.3'
\begin{description}

\item[Issue 1.1 (1992/07/17) (26 May 1992)]
Initial Draft
\item[Issue 1.7 (1992/10/26) (26th October 1992)]
Corrected a typo preventing loading.
\item[Issue 1.9 (1992/10/28)]
Tests for new treatment of type inference context and nested quotations.
\item[Issues 1.10 (1992/10/30) (29th October 1992)]
Changes to match Z theory reorganisation.
\item[Issues 1.11 (1992/12/02) (2nd December 1992)]
Changes to match new treatment of standard-ness etc.
\item[Issues 1.12 (1993/02/23) (23rd February 1993)]
Changed parent of working theory.
\item[Issues 1.13 (1993/03/01) (1st March 1993)]
Test for fix of but 109.
\item[Issues 1.14 (1993/03/02) (2nd March 1993)]
Removed duplicate test identities.
\item[Issues 1.15 (1993/03/02) (3rd March 1993)]
Test for fix of bug 110.
\item[Issue 1.16 (1996/01/22) (22nd January 1996)]
Made test output compatible with build process.
\item[Issue 1.17 (1997/07/30) (30th July 1997)]
Added test for bug 195.
\item[Issue 1.18 (1999/02/24)]
Update for SML97.
\item[Issue 1.19 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.20 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.21 (2004/01/19)] The Z universal set is now called 𝕌.
\item[Issue 1.22 (2005/08/05)] Liberalised schema quantification.
\item[Issue 1.23 (2005/09/09)] Allowed for correction to let-expression syntax.
\item[Issue 1.24 (2006/01/12)] Added {test for the new \em diag\_free\_vars} hook for the Compliance Tool.
\item[Issue 1.26 (2006/04/20)] Added support for floating point literals
\item[Issue 1.27 (2011/07/11)] Type-checking in predicate contexts
\item[Issue 1.28 (2011/08/04)] Added regression test for problem with characteristic tuples.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported PPZed to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
None.
\pagebreak
\section{GENERAL}
\subsection{Scope}

The module tests provided in this document test the
Z Type inferrer defined in \cite{DS/FMU/IED/DTD062}.


\subsection{Introduction}

\subsubsection{Background and Purpose}

The purpose of this document is to test
the functions in accordance with the test policy in
\cite{DS/FMU/IED/DTD062} and the guidelines laid out in the
quality plan, \cite{DS/FMU/IED/PLN008}.

\subsubsection{Dependencies}

This document depends on the signature $ZTypeInference$ specified
in \cite{DS/FMU/IED/DTD062}, and the structure $ZTypeInference$
specified in \cite{DS/FMU/IED/IMP062}. It makes use of the
module test harness described in \cite{DS/FMU/IED/DTD013} and
\cite{DS/FMU/IED/IMP013}.

\subsubsection{Possible Enhancements}

None.

\subsubsection{Deficiencies}

None Known.

\section{INITIALISATION}

Initialise the test harness.

=SML
use_file "dtd013.sml";
use_file "imp013.sml";
=TEX
=SML
	open Unification ZUserInterfaceSupport ZTypeInference;
=TEX
=SML
map diag_line ["Successful execution of these tests will cause error",
"messages to be generated. You should check visually that",
"the error messages are sensible since the harness itself",
"is incapable of doing this. You can consider that the",
"Module tests have run successfully provided that",
"\ta) you are satisfied with the error messages and",
"\tb) that the report states that all Module tests have",
"\t   passed."];
=TEX
Next, we make the parser and Z type inferrer
directly available to the tests.
=SML
init_mt_results ();
open_theory"z_library";
TypeInference.set_ti_context[];
=TEX
The following is a hack which will be unnecessary, but harmless when
$Π$ is properly in place:
=SML
case get_zfixity_info "Π" of
	Value _ => ()
|	Nil =>
ⓈZ
fun Π _
■
\section{SUPPORTING TEST FUNCTIONS}

The functions introduced in this section are using in testing the Z type
inferrer. Their provision enables the test cases to be implmentated in a concise
(and hopefully readable) form.

=SML
fun ⦏format_z_para_term⦎ (p as (idl, tm, _)
	: (IDENT list * Z_TM * EXTYPE OPT)) : string = (
	(implode o rev o tl o rev o tl o explode)(format_z_para (ZParaTerm p))
);
=TEX
The function $type\_infer$ is a general interface to the type inferrer, taking
a Z term in string form and producing an inferred Z paragraph.

=SML
fun ⦏type_infer⦎ {quot : bool, standard : bool, allow_frees : bool} (s : string) : Z_INFERRED = (
let	val parsed = ZParser.z_parser {is_quot=quot}
			(ZLex.z_lex [Lex.Text s]);
in
	type_check_z_para {standard = standard, allow_frees = allow_frees} parsed
end);
=TEX
The function $formatted\_type\_infer$ produces a formatted form of a type inferred
Z paragraph. The formatted form should be equivalent to the input for paragraphs
which are terms.
=SML
fun ⦏formatted_type_infer⦎ {quot : bool, standard : bool, allow_frees : bool} (s : string) : string = (
	case type_infer {quot=quot, standard = standard, allow_frees = allow_frees} s of
	ZInferred p => (
		case p of
		ZParaTerm ptm => format_z_para_term ptm
		|_ => format_z_para p
		)
	|ZTypeError info => (print_z_error info;"")
);
=TEX
The following functions provide the general interface to the type inferrer for
use in the module tests.
=SML

fun ⦏elim_spaces⦎ (s : string) : string =
	implode ((explode s) drop (fn c => c mem [" ","\t"]));


fun ⦏tc1⦎ (s: string) : string = formatted_type_infer {quot=true, standard=true, allow_frees = false} s;
fun ⦏tc2⦎ (s: string) : string = formatted_type_infer {quot=false, standard=true, allow_frees = false} s;

fun ⦏tq1⦎ s = (elim_spaces s) = (elim_spaces (tc1 s));
fun ⦏tq2⦎ s = (elim_spaces s) = (elim_spaces (tc2 s));

fun ⦏xc1⦎ (s: string) : string = formatted_type_infer {quot=true, standard=false, allow_frees = true} s;
fun ⦏xc2⦎ (s: string) : string = formatted_type_infer {quot=false, standard=true, allow_frees = true} s;

fun ⦏xq1⦎ s = (elim_spaces s) = (elim_spaces (xc1 s));
fun ⦏xq2⦎ s = (elim_spaces s) = (elim_spaces (xc2 s));
fun ⦏xq3⦎ s1 s2 = (elim_spaces s1) = (elim_spaces (xc1 s2));

=TEX
=SML
fun ⦏mt_run_ok⦎ rest =
let	val thing = map (fn (x,y,z) => (x,y,z,true)) rest;
in
	mt_run thing
end;

fun ⦏mt_run_fail'⦎ rest =
let	val msg = gen_fail_msg "Z-Parser" 62000 [];
	val thing = map (fn (x,y,z) => (x,y,z,msg)) rest;
in
	mt_run_fail thing
end;

=TEX

\section{TEST CASES AND TEST DATA}

\subsection{Testing Terms in Extended Z}

\subsubsection{Sequence Display}

=SML
store_mt_results mt_run_ok [
("mdt062.0101", xq1, "⟨⟩"),
("mdt062.0102", xq1, "⟨1⟩"),
("mdt062.0103", xq1, "⟨1,2⟩"),
("mdt062.0104", xq1, "⟨1,x⟩"),
("mdt062.0105", xq1, "⟨([x:ℤ]),([x:ℤ])⟩"),
("mdt062.0106", xq1, "⟨true, false⟩"),
("mdt062.0107", xq1, "⟨ℤ, ℤ⟩")
];
store_mt_results mt_run_fail' [
("mdt062.0101f", xc1, "⟨1, ℤ⟩"),
("mdt062.0102f", xc1, "⟨ℙℤ, ℤ⟩")
];
=TEX
\subsubsection{Set Display}
=SML
store_mt_results mt_run_ok [
("mdt062.0201", xq1, "{1}"),
("mdt062.0202", xq1, "{1}"),
("mdt062.0203", xq1, "{1,2}"),
("mdt062.0204", xq1, "{1,2} ∈ { {1, 2} }"),
("mdt062.0205", xq1, "{ℤ, ℤ}")
];
store_mt_results mt_run_fail' [
("mdt062.0201f", xc1, "{1, ℤ}"),
("mdt062.0202f", xc1, "{ℙℤ, ℤ}")
];
=TEX
\subsubsection{Set Abstraction}
=SML
store_mt_results mt_run_ok [
("mdt062.0301", xq1, "{x : ℤ}"),
("mdt062.0302", xq1, "{x : ℤ | true }"),
("mdt062.0303", xq1, "{x : ℤ ⦁ true }"),
("mdt062.0304", xq1, "{x : ℤ ⦁ x }"),
("mdt062.0305", xq1, "{x : ℤ | true ⦁ true }"),
("mdt062.0306", xq1, "{([x : ℤ]) ⦁ x }"),
("mdt062.0307", xq1, "{([x : ℤ]); y : ℤ | x = y ⦁ x }"),
("mdt062.0308", xq1, "{([x : ℤ]); y :  ℙ ℤ | x ∈ y ⦁ x }"),
("mdt062.0309", xq1, "{y : ℙ ℤ | ({x : ℤ} = y)}"),
("mdt062.0310", xq1, "{y : ℙ ℤ | ({x : ℤ ⦁ x} = y)}"),
("mdt062.0311", xq1, "{y : ℙ ℤ | ({x : ℤ} = y) ⦁ y}"),
("mdt062.0312", xq1, "{y : ℙℙ ℤ | ({ {x : ℤ} } = y)}"),
("mdt062.0313", xq1, "{y : ℙℙ ℤ | ({ {x : ℤ ⦁ x} } = y)}"),
("mdt062.0314", xq1, "{x : ℤ | true }")
];
store_mt_results mt_run_fail' [
("mdt062.0301f", xc1, "{x : X | 0}"),
("mdt062.0302f", xc1, "{x : X | 0 ⦁ true}")
];
=TEX
\subsubsection{Powerset}
=SML
store_mt_results mt_run_ok [
("mdt062.0401", xq1, "ℙ {}"),
("mdt062.0402", xq1, "ℙ ℤ"),
("mdt062.0403", xq1, "ℙ {ℤ}"),
("mdt062.0404", xq1, "ℙ {ℤ} = ℙ {ℤ}"),
("mdt062.0405", xq1, "ℙ {ℤ} ∈ ℙ ℙ {ℤ}"),
("mdt062.0406", xq1, "ℙ { ([x : ℤ]) }"),
("mdt062.0407", xq1, "ℙ { ([x : ℤ]); y : ℙ {x} }"),
("mdt062.0408", xq1, "ℙ ([x : ℤ])"),
("mdt062.0409", xq1, "ℙℙℙℙℙ z = ℙ y"),
("mdt062.0410", xq1, "ℙ { ℙ ℤ } = ℙ ℙℙ ℤ"),
("mdt062.0411", xq1, "ℙ { x : ℙℙ ℤ } = ℙ ℙℙ ℤ")
];
store_mt_results mt_run_fail' [
("mdt062.0401f", xc1, "ℙ 1"),
("mdt062.0402f", xc1, "(x = 1) ∧ (ℙ x)")
];
=TEX
\subsubsection{Tuple Display}

=SML
store_mt_results mt_run_ok [
("mdt062.0501", xq1, "(1,2)"),
("mdt062.0502", xq1, "(ℙ ℤ, ℤ)"),
("mdt062.0503", xq1, "(ℤ, (ℙℤ, ℙℤ))"),
("mdt062.0504", xq1, "(ℤ, ℙℤ) ∈ { (ℤ, ℙℤ) }"),
("mdt062.0505", xq1, "(1,2,3,4,5,6) = (2,3,4,5,6,7)"),
("mdt062.0506", xq1, "(1,2)")
];
store_mt_results mt_run_fail' [
("mdt062.0501f", xc1, "(1,2) = 1"),
("mdt062.0502f", xc1, "(1,2) = (1,2,3)"),
("mdt062.0503f", xc1, "(1,2) = (ℤ,ℤ)"),
("mdt062.0504f", xc1, "(1,2) = (ℙℤ, ℙℤ)"),
("mdt062.0505f", xc1, "(x = (1,2)) ∧ (x = (1,2,3))")
];
=TEX

\subsubsection{Binding Display}
=SML
store_mt_results mt_run_ok [
("mdt062.0601", xq1, "(a≜1, b≜2, c ≜3)"),
("mdt062.0602", xq1, "(a≜(1,2), b≜(1,2))")
];
store_mt_results mt_run_fail' [
("mdt062.0601f", xc1, "(a≜1, b≜2, a ≜3)"),
("mdt062.0602f", xc1, "(a≜(1,2), a≜(1,2))")
];
=TEX

\subsubsection{Product}
=SML
store_mt_results mt_run_ok [
("mdt062.0701", xq1, "ℤ × ℤ"),
("mdt062.0702", xq1, "ℤ × ℙ ℤ × ℙ ℤ "),
("mdt062.0703", xq1, "ℙ ℤ × ℤ × { x : ℤ | true ⦁ x}"),
("mdt062.0704", xq1, "ℙ ℤ × ℤ × (λ x : ℤ ⦁ 0)"),
("mdt062.0705", xq1, "(x ∈ ℙ (ℤ × ℤ × ℤ)); y ∈ x × ℙ (ℤ × ℤ × ℤ)")
];
store_mt_results mt_run_fail' [
("mdt062.0701f", xc1, "1 × 2"),
("mdt062.0702f", xc1, "ℙ ℤ × ℤ × ( μ x : ℤ ⦁ x)")
];
=TEX
\subsubsection{Theta}
=SML
store_mt_results mt_run_ok [
("mdt062.0801", xq1, "θ ([x:X])"),
("mdt062.0802", xq1, "θ ([x:X])'"),
("mdt062.0803", xq1, "θ ([x:X])' = θ [x:X]"),
("mdt062.0804", xq1, "θ ([a,b,c:ℤ])' =(a≜1, b≜2, c≜3)")
];
store_mt_results mt_run_fail' [
("mdt062.0801f", xc1, "θ 1"),
("mdt062.0802f", xc1, "θ (θ ([x:X]))")
];
=TEX
\subsubsection{Tuple Selection}
=SML
store_mt_results mt_run_ok [
("mdt062.0901", xq1, "(1,2,3).1"),
("mdt062.0902", xq1, "(a,b,c).2"),
("mdt062.0903", xq1, "(a,b,c).3"),
("mdt062.0904", xq1, "(a,b).2")
];
store_mt_results mt_run_fail' [
("mdt062.0901f", xc1, "(1,2,3).0"),
("mdt062.0902f", xc1, "true.0"),
("mdt062.0903f", xc1, "(1,2,3).4")
];
=TEX
\subsubsection{Binding Selection}
=SML
store_mt_results mt_run_ok [
("mdt062.1001", xq1, "(θ[a:ℤ]).a"),
("mdt062.1002", xq1, "s=θ[a:ℤ] ∧ s.a = 0"),
("mdt062.1003", xq1, "(θ[a:ℤ;b,c,d:ℙℤ]).d = d")
];
store_mt_results mt_run_fail' [
("mdt062.1001f", xc1, "1.a"),
("mdt062.1002f", xc1, "θ[x:ℤ].a"),
("mdt062.1003f", xc1, "s=θ[a:ℤ] ∧ s.c"),
("mdt062.1004f", xc1, "θ[a,b,c:ℤ].abcde")
];
=TEX
\subsubsection{Application}
=SML
store_mt_results mt_run_ok [
("mdt062.1101", xq1, "f a"),
("mdt062.1102", xq1, "{(0, A),(1, B), (2, C)} 1")
];
store_mt_results mt_run_fail' [
("mdt062.1101f", xc1, "1 1"),
("mdt062.1102f", xc1, "(1,2) 3"),
("mdt062.1103f", xc1, "(λx : ℤ ⦁ true) (1,2)")
];
=TEX
\subsubsection{Lambda Abstraction}
=SML
store_mt_results mt_run_ok [
("mdt062.1201", xq1, "(λx : ℤ ⦁ true)"),
("mdt062.1202", xq1, "(λ ([x,y:ℤ]) | x=y ⦁ (x,y))"),
("mdt062.1203", xq1, "(λx : ℤ | true ⦁ a)")
];
=TEX
\subsubsection{Definite Description}
=SML
store_mt_results mt_run_ok [
("mdt062.1301", xq1, "(μx : ℤ ⦁ true)"),
("mdt062.1302", xq1, "(μ ([x,y:ℤ]) | x=y ⦁ (x,y))"),
("mdt062.1303", xq1, "(μx : ℤ | true ⦁ a)")
];
=TEX
\subsubsection{Truth}
=SML
store_mt_results mt_run_ok [
("mdt062.1401", xq1, "true"),
("mdt062.1402", xq1, "false")
];
=TEX
\subsubsection{Predicate Negation}
=SML
store_mt_results mt_run_ok [
("mdt062.1501", xq1, "¬ true"),
("mdt062.1502", xq1, "¬false"),
("mdt062.1503", xq1, "¬ ¬ false")
];
store_mt_results mt_run_fail' [
("mdt062.1501f", xc1, "¬ 1")
];
=TEX
\subsubsection{Logical Infix Operators for Predicates}
=SML
store_mt_results mt_run_ok [
("mdt062.1601", xq1, "true ∧ true"),
("mdt062.1602", xq1, "true ∨ false"),
("mdt062.1603", xq1, "false ⇒ true"),
("mdt062.1604", xq1, "true ⇔ true"),
("mdt062.1605", xq1, "true; true")
];
store_mt_results mt_run_fail' [
("mdt062.1601f", xc1, "1 ∧ true"),
("mdt062.1602f", xc1, "true ∧ 1"),
("mdt062.1603f", xc1, "true ∨ 1"),
("mdt062.1604f", xc1, "true ⇒ 1"),
("mdt062.1605f", xc1, "true ⇔ 1"),
("mdt062.1606f", xc1, "true ; 1"),
("mdt062.1607f", xc1, "1 ; true")
];
=TEX
\subsubsection{Predicate Quantification}
=SML
store_mt_results mt_run_ok [
("mdt062.1701", xq1, "∀ x, y : ℤ ⦁ x = y"),
("mdt062.1702", xq1, "∃ x:ℤ ⦁ ∀ y : ℤ ⦁ x = y"),
("mdt062.1703", xq1, "∃⋎1 x:{1,2,3} ⦁ x = 2"),
("mdt062.1704", xq1, "∀ ([x:ℤ; y:ℕ]); a,b : ℤ ⦁ ∃ p:ℤ ⦁ p = x ∨ p=y ∨ p=a ∨ p=b"),
("mdt062.1705", xq1, "∃ x:ℤ ⦁ true")
];
store_mt_results mt_run_fail' [
("mdt062.1701f", xc1, "∀ x :ℤ ⦁ x"),
("mdt062.1702f", xc1, "∃ x :ℤ ⦁ x"),
("mdt062.1703f", xc1, "∃⋎1 x :ℤ ⦁ x"),
("mdt062.1704f", xc1, "∀ x:ℤ ⦁∃ y:ℤ ⦁ 0")
];
=TEX
\subsubsection{Schemas as Predicates}
=SML
store_mt_results mt_run_ok [
("mdt062.1801", xq1, "{x:ℤ | true ∧ [y:ℤ] }"),
("mdt062.1802", xq1, "∀ x : ℤ ⦁ ([a,b,c:ℤ])")
];
=TEX
\subsubsection{Horizontal Schemas}
=SML
store_mt_results mt_run_ok [
("mdt062.1901", xq1, "[x:ℤ]"),
("mdt062.1902", xq1, "[x:ℤ | x=0]"),
("mdt062.1903", xq1, "[x,y,z:ℤ] ∧ x=0")
];
store_mt_results mt_run_fail' [
("mdt062.1901f", xc1, "[x,y,z:ℤ] ∧ x=(1,2)")
];
=TEX
\subsubsection{Decoration}
=SML
store_mt_results mt_run_ok [
("mdt062.2001", xq1, "([x:ℤ])'"),
("mdt062.2002", xq1, "([x:ℤ])!"),
("mdt062.2003", xq1, "([x:ℤ])?"),
("mdt062.2004", xq1, "x?")
];
store_mt_results mt_run_fail' [
("mdt062.2001f", xc1, "(a=b)'"),
("mdt062.2002f", xc1, "(f x)!"),
("mdt062.2003f", xc1, "(x)?")
];
=TEX
\subsubsection{Precondition}
=SML
store_mt_results mt_run_ok [
("mdt062.2101", xq1, "pre ([x:ℤ])"),
("mdt062.2102", xq1, "pre (([x:ℤ])!)"),
("mdt062.2103", xq1, "pre [x', y?, z! : ℤ]")
];
store_mt_results mt_run_fail' [
("mdt062.2101f", xc1, "pre 0"),
("mdt062.2102f", xc1, "pre {1,2,3}")
];
=TEX
\subsubsection{Schema Negation}
=SML
store_mt_results mt_run_ok [
("mdt062.2201", xq1, "[(¬ [x:ℤ])]"),
("mdt062.2202", xq1, "[(¬ ¬ ([x:ℤ]))]")
];
=TEX
\subsubsection{Logical Infix Operators for Schemas}
These particular tests require us to use standard mode for z terms
since this is the only way we can ensure that the schemas which occur in
the terms are not interpreted as predicates.
=SML
store_mt_results mt_run_ok [
("mdt062.2301", xq1, "[[x:ℤ] ∧ [y:ℤ]]"),
("mdt062.2302", xq1, "[[x:ℤ] ∨ [y:ℤ]]"),
("mdt062.2303", xq1, "[[x:ℤ] ⇒ [y:ℤ]]"),
("mdt062.2304", xq1, "[[x:ℤ] ⇔ [y:ℤ]]"),
("mdt062.2305", xq1, "[[x:ℤ] ; [y:ℤ]]")
];
store_mt_results mt_run_fail' [
("mdt062.2301f", xc1, "[1 ∧ [y:ℤ]]"),
("mdt062.2302f", xc1, "[[x:ℤ] ∧ 1]"),
("mdt062.2303f", xc1, "[1 ∨ [y:ℤ]]"),
("mdt062.2304f", xc1, "[1 ⇒ [y:ℤ]]"),
("mdt062.2305f", xc1, "[1 ⇔ [y:ℤ]]"),
("mdt062.2306f", xc1, "[1 ; [y:ℤ]]")
];
=TEX
\subsubsection{Schema Projection}
=SML
store_mt_results mt_run_ok [
("mdt062.2401", xq1, "[x,y,z:ℤ] ↾⋎s [x:ℤ]"),
("mdt062.2402", xq1, "[x:ℤ] ↾⋎s [y:ℤ]")
];
store_mt_results mt_run_fail' [
("mdt062.2401f", xc1, "2 ↾⋎s [x:ℤ]"),
("mdt062.2402f", xc1, "[x:ℤ] ↾⋎s 2"),
("mdt062.2403f", xc1, "2 ↾⋎s 2"),
("mdt062.2404f", xc1, "[x:ℤ] ↾⋎s [x: seq ℤ]")
];
=TEX
\subsubsection{Schema Hiding}
=SML
store_mt_results mt_run_ok [
("mdt062.2501", xq1, "[x,y,z:ℤ] \\⋎s  (x,y,z)"),
("mdt062.2502", xq1, "[x:ℤ] \\⋎s  (x)")
];
store_mt_results mt_run_fail' [
("mdt062.2501f", xc1, "1 \\⋎s (a) ")
];
=TEX
\subsubsection{Schema Quantification}
=SML
store_mt_results mt_run_ok [
("mdt062.2601", xq1, "∀ x: ℤ ⦁ [x,y,z : ℤ]"),
("mdt062.2602", xq1, "∃ y : ℤ | y = 5 ⦁ [y, z:ℤ | y = z]"),
("mdt062.2603", xq1, "∃⋎1 y : ℤ | true ⦁ [y:X | true]"),
("mdt062.2604", xq1, "∃⋎1 y : ℤ | [x:X] ⦁ [y:X | true]")
];
store_mt_results mt_run_fail' [
("mdt062.2601f", xc1, "[(∃ x:ℤ ⦁ true) ∧ [y:ℤ]]"),
("mdt062.2602f", xc1, "[(∀ x:ℤ ⦁ [x, y:seq ℤ])]"),
("mdt062.2603f", xc1, "[(∃ x:ℤ ⦁ [y:ℤ; x: ℤ × ℤ]) ∧ [y:ℤ]]")
];
=TEX
\subsubsection{Δ and Ξ}
=SML
store_mt_results mt_run_ok [
("mdt062.2701", xq1, "[Δ[x:ℤ] | x=x']"),
("mdt062.2702", xq1, "Δ[x:ℤ]"),
("mdt062.2703", xq1, "[Ξ[x:ℤ] | x=x']"),
("mdt062.2704", xq1, "Ξ[x:ℤ]")
];
store_mt_results mt_run_fail' [
("mdt062.2701f", xc1, "Δ 1"),
("mdt062.2702f", xc1, "Ξ 1")
];
=TEX
\subsubsection{Set Membership and Equality}
=SML
store_mt_results mt_run_ok [
("mdt062.2801", xq1, "x ∈ {x}"),
("mdt062.2802", xq1, "a ∈ ℙ a"),
("mdt062.2803", xq1, "ℤ ∈ {ℤ,ℤ}"),
("mdt062.2804", xq1, "0=0"),
("mdt062.2805", xq1, "a = 2 ∨ a ∈ ℤ")
];
store_mt_results mt_run_fail' [
("mdt062.2801f", xc1, "1 ∈ 1"),
("mdt062.2802f", xc1, "⟨1,2,3⟩ ∈ {1,2,3}"),
("mdt062.2803f", xc1, "⟨1,2,3⟩ = 1"),
("mdt062.2804f", xc1, "a = 1 ; a ∈ {ℤ}")
];
=TEX
\subsubsection{Schema Composition}
=SML
store_mt_results mt_run_ok [
("mdt062.2901", xq1, "[x,y,z:ℤ] ⨾⋎s [x:ℤ]"),
("mdt062.2902", xq1, "[x:ℤ] ⨾⋎s [y:ℤ]")
];
store_mt_results mt_run_fail' [
("mdt062.2901f", xc1, "2 ⨾⋎s [x:ℤ]"),
("mdt062.2902f", xc1, "[x:ℤ] ⨾⋎s 2"),
("mdt062.2903f", xc1, "2 ⨾⋎s 2"),
("mdt062.2904f", xc1, "[x:ℤ] ⨾⋎s [x: seq ℤ]")
];
=TEX
\subsubsection{Schema Piping}
=SML
store_mt_results mt_run_ok [
("mdt062.3001", xq1, "[x,y,z:ℤ] >> [x:ℤ]"),
("mdt062.3002", xq1, "[x:ℤ] >> [y:ℤ]")
];
store_mt_results mt_run_fail' [
("mdt062.3001f", xc1, "2 >> [x:ℤ]"),
("mdt062.3002f", xc1, "[x:ℤ] >> 2"),
("mdt062.3003f", xc1, "2 >> 2"),
("mdt062.3004f", xc1, "[x:ℤ] >> [x: seq ℤ]")
];
=TEX
\subsubsection{Integers and String Quotation}
String quotations may not appear in strings since they are processed by
reader/writer term recognisers. There is no simple way of testing
string quotation until the recognisers are in place.
=SML
store_mt_results mt_run_ok [
("mdt062.3101", xq1, "0"),
("mdt062.3102", xq1, "99999999")
];
=TEX
\subsubsection{Casts and Predicate Contexts}
The constructor for type constraints is not used, and the ``fat colon''
is now defined as a global variable in the Z library.
=SML
store_mt_results mt_run_ok [
("mdt062.3201", xq3 "var", "var ⦂ X"),
("mdt062.3202", xq3 "bool", "Π bool"),
("mdt062.3203", xq3 "if _? then _! else _![𝕌[Totality]] ([], 1 = 1, [])",
		"if [] then 1 = 1 else []")
];
store_mt_results mt_run_fail' [
("mdt062.3201f", xc2, "1 ⦂ ℤ"),
("mdt062.3202f", xc2, "Π(bool)"),
("mdt062.3203f", xc2, "if 1 = 2 then 3 else 4")
];
=TEX
\subsubsection{Local Variables}
=SML
store_mt_results mt_run_ok [
("mdt062.3301", xq1, "∀ x:ℙℤ ⦁ (∀ x,y : ℤ × ℤ ⦁ x=y) ∧ x={0}"),
("mdt062.3302", xq1, "[x:ℤ | x=0] ∧ x=0"),
("mdt062.3303", xq1, "∀ x:ℙℤ ⦁ (∀ x,y : ℤ × ℤ ⦁ x=y) ∧ x={0}"),
("mdt062.3304", xq1, "[x:ℤ | x=0] ∧ x=0")
];
=TEX
\subsubsection{Global Variables}
The tests for global variables require the Z library to be present.
The tests for the Z library tests these features more thoroughly.
=SML
store_mt_results mt_run [
("mdt062.3401", xc1, "∅", "∅[𝕌[Totality]]"),
("mdt062.3402", xc1, "∅[𝕌]", "∅[𝕌[Totality]]")
];
store_mt_results mt_run_ok [
("mdt062.3403", xq1, "ℕ⋎1")
];
=TEX
\subsubsection{Let Expressions}
=SML
store_mt_results mt_run_ok [
("mdt062.3501", xq1, "let x ≜ 1; y ≜ 2 ⦁ (x,y)"),
("mdt062.3502", xq1, "let a≜[x:ℤ]; b ≜ [y,z:ℤ] ⦁ a ; b")
];
=TEX
\subsubsection{Renaming}
=SML
store_mt_results mt_run_ok [
("mdt062.3601", xq1, "[b,d:ℤ] [a/b, c/d]"),
("mdt062.3602", xq1, "[x:ℤ] [abcdefg/x]")
];
store_mt_results mt_run_fail' [
("mdt062.3601f", xc1, "1 [a/b,c/d]"),
("mdt062.3602f", xc1, "[a:ℤ] [a/b, c/b]"),
("mdt062.3603f", xc1, "[a:ℤ] [a/b, a/c]")
];
=TEX
\subsubsection{Bracketed Terms}
=SML
store_mt_results mt_run_ok [
("mdt062.3701", xq1, "1=(1)"),
("mdt062.3702", xq1, "((((((((1,2,(((((((3))))))))))))))= ((1,2,3)))")
];
=TEX

\subsubsection{Term Quotation}
Term quotations may not appear in strings since they are processed by
reader/writer term recognisers. As stated in the detailed
design there is no simple way of testing correct operation of
term quotation until the term generator is in place.
We can however test the error cases:
=TEX
=SML
fun ⦏tq_formatted_type_infer⦎
	(s1 : string) (tm : TERM) (s2 : string) : string = (
let	val parsed = ZParser.z_parser {is_quot=true}
			(ZLex.z_lex [Lex.Text s1, Lex.Term tm, Lex.Text s2]);
in
	case type_check_z_para {standard = false, allow_frees = true} parsed of
			ZInferred p => (
		case p of
		ZParaTerm ptm => format_z_para_term ptm
		|_ => format_z_para p
		)
	|ZTypeError info => (print_z_error info;"")
end);
fun tfti (s1, tm, s2) = tq_formatted_type_infer s1 tm s2;
val t3703f =
	let val t1 = ⌜x:ℤ→ℤ⌝; val t2 = ⌜x:ℤ⌝
	in	mk_app(t1, t2)
	end;

=SML
store_mt_results mt_run_fail' [
("mdt062.3701f", tfti, ("x=(1,2)∧", ⌜x = 1⌝, "") ),
("mdt062.3702f", tfti, ("x = (1,2) ∧ ", ⌜x = {}⌝, "")),
("mdt062.3703f", tfti, ("", ⓜt3703f⌝, "")),
("mdt062.3704f", tfti, ("x? = (1,2) ∧ ", ⌜$"x?" = {}⌝, ""))
];
=TEX
\subsection{Inferring Types in Z Paragraphs}

It is difficult to test the correctness
of types in Z paragraphs without having the paragraph processor available. The
testing of these this is left to the module tests of the Z paragraph processor.

\subsection{Free Variables}
Free variables are permitted in extended Z but not in standard Z. This
is tested as follows:

=SML
store_mt_results mt_run_ok [
("mdt062.5001", xq1, "x"),
("mdt062.5002", xq1, "⟨a, b, c⟩"),
("mdt062.5003", xq1, "let a ≜ X ⦁ (a,a)")
];
store_mt_results mt_run_fail' [
("mdt062.5001f", tc1, "x"),
("mdt062.5002f", tc1, "⟨a, b, c⟩"),
("mdt062.5003f", tc1, "let a ≜ X ⦁ (a,a)")
];
=TEX

\subsection{Testing the function $make\_chartuple$}

=SML
val ZInferred p1 = type_infer {quot = true, standard = false, allow_frees = true} "[x,y:ℤ]";
val ZParaTerm (_,ZTmHorizSchema sch1, _) = p1;
val ZInferred p2 = type_infer {quot = true, standard = false, allow_frees = true} "[x:ℤ; y:X]";
val ZParaTerm (_,ZTmHorizSchema sch2, _) = p2;
val ZInferred p3 = type_infer {quot = true, standard = false, allow_frees = true} "[x, y : ℤ; a:X]";
val ZParaTerm (_,ZTmHorizSchema sch3, _) = p3;

val do_600i = format_z_tm o fst o make_chartuple;

store_mt_results mt_run [
("mdt062.6001", do_600i, sch1, "(x, y)"),
("mdt062.6002", do_600i, sch2, "(x, y)"),
("mdt062.6003", do_600i, sch3, "(x, y, a)")
];
=TEX

\subsection{Testing the function $type\_of\_z\_extype$}

=SML
store_mt_results (mt_runf ( (op =:))) [
("mdt062.7001", type_of_z_extype, ExType ("BOOL", []), BOOL),
("mdt062.7002", type_of_z_extype, ExVartype (Known "fred"), mk_vartype "fred"),
("mdt062.7003", type_of_z_extype, ExVartype (Unknown 25), mk_vartype "'a")
];
=TEX
\subsection{Testing Integration with Type Context Mechanism}
=SML
val ZInferred (ZParaTerm(_,_, Value ty7_1)) = type_infer {quot = true, standard = false, allow_frees = true} "x";
TypeInference.set_ti_context[⌜x:ℕ⌝, ⌜y':ℕ × ℕ⌝, ⌜$"x?":BOOL⌝];
val ZInferred (ZParaTerm(_,_, Value ty7_2)) = type_infer {quot = true, standard = false, allow_frees = true} "x";
val ZInferred (ZParaTerm(_,_, Value ty7_3)) = type_infer {quot = true, standard = false, allow_frees = true} "y'";
val ZInferred (ZParaTerm(_,_, Value ty7_4)) = type_infer {quot = true, standard = false, allow_frees = true} "x?";

=SML
store_mt_results (mt_runf ( (op =:))) [
("mdt062.8001", type_of_z_extype, ty7_1,  ⓣ'a⌝),
("mdt062.8002", type_of_z_extype, ty7_2,  ⓣℕ⌝),
("mdt062.8003", type_of_z_extype, ty7_3,  ⓣℕ × ℕ⌝),
("mdt062.8004", type_of_z_extype, ty7_4,  ⓣBOOL⌝)
];
=TEX
\subsection{Regression Tests for Bug Fixes}
Cross referenced to bug database.
=SML
val _ = xq1 "1 = 2";
store_mt_results
mt_run[
("mdt062.9001", diag_free_vars, (), [])
];
val _ = xq1 "A = 2";
store_mt_results
mt_run[
("mdt062.9002", diag_free_vars, (), ["A"])
];
val _ = xq1 "A = B = 2";
store_mt_results
mt_run[
("mdt062.9003", Sort.sort Sort.string_order o diag_free_vars, (), ["A", "B"])
];
val _ = xq1 "1 = 2";
store_mt_results
mt_run[
("mdt062.9004", diag_free_vars, (), [])
];
val _ = xq1 "B = A ∧ true.2 = C" handle Fail _ => true;
store_mt_results
mt_run[
("mdt062.9005", Sort.sort Sort.string_order o diag_free_vars, (), ["A", "B"])
];
val _ = tc1 "B = A ∧ 1.2 = C" handle Fail _ => "";
store_mt_results
mt_run[
("mdt062.9006", Sort.sort Sort.string_order o diag_free_vars, (), ["B"])
];
val _ = tc1 "[B:{}] ∧ C = D" handle Fail _ => "";
store_mt_results
mt_run[
("mdt062.9007", Sort.sort Sort.string_order o diag_free_vars, (), ["B"])
];
=TEX
\subsection{Regression Tests for Bug Fixes}
Cross referenced to bug database.
=SML
store_mt_results mt_run_ok [
("mdt062.99001", xq1, "∀x:A⦁∀a:A; b : B; x:A×B⦁x = (a, b)")		(* HAT 109 *)
];
store_mt_results mt_run_fail' [
("mdt062.99002f", xc1, "(θ[a:𝔹], a) = (x, (y, z))")		(* HAT 110 *)
];
store_mt_results mt_run_fail' [		(* HAT 195 *)
("mdt062.99003f", tq1, "θ ([x:X])"),
("mdt062.99004f", tq1, "θ ([x:X])'")
];
store_mt_results mt_run_ok [		(* HAT 195 *)
("mdt062.99005", tq1, "[X](∀a:X⦁θ ([a:X]) = θ ([a:X]))"),
("mdt062.99006", tq1, "[X](∀a':X⦁θ ([a:X])' = θ ([a:X])')")
];
=TEX
=TEX
\subsection{Miscellaneous Regression Tests}
=SML
store_mt_results mt_run_ok [
("mdt062.991001", xq1, "{ {[x:ℤ]; ([x:ℤ])'}}")
];
=TEX


\section{EPILOGUE}

=SML
diag_string (summarize_mt_results());
=TEX
%\newpage
%\twocolumn[\section{INDEX OF DEFINED TERMS}]
%\printindex
\end{document}


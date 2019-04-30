=IGN
********************************************************************************
mdt063.doc: this file is part of the PPZed system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  mdt063.doc ℤ $Date: 2004/08/08 09:57:08 $ $Revision: 1.16 $ $RCSfile: mdt063.doc,v $

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

\def\Title{Module Tests for Z Term Generator}

\def\AbstractText{This document comprises test cases and test data for the Z Term Generator.}

\def\Reference{DS/FMU/IED/MDT063}

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
%% LaTeX2e port: \TPPtitle{Module Tests for Z Term Generator}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/MDT063}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.16 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2004/08/08 09:57:08 $%
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
%% LaTeX2e port: the Z Term Generator.}
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

\item[Issues 1.3 (1992/08/03)-1.8 (1992/10/28) (31th July-28 October 1992)]
Initial Drafts
\item[Issues 1.9 (1992/10/30) (29th October 1992)]
Changes to match Z theory reorganisation.
\item[Issues 1.10 (1992/11/03) (3rd November 1992)]
Capture of free variables by global variables now tested for.
\item[Issues 1.11 (1992/12/09) (9th December 1992)]
Bug fixing.
\item[Issues 1.12 (1993/02/23) (23rd February 1993)]
Modified parent of working theory.
\item[Issue 1.13 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.14 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.15 (2004/01/19)] The Z universal set is now called 𝕌.
\item[Issue 1.16 (2004/08/08)] Added tests for casts (which used to provoke a problem in the term generator).
\item[Issue 1.17 (2005/08/04)] Made it work in child databases.
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
Z Term Generator defined in \cite{DS/FMU/IED/DTD063}.


\subsection{Introduction}

\subsubsection{Background and Purpose}

The purpose of this document is to test
the functions in accordance with the test policy in
\cite{DS/FMU/IED/DTD063} and the guidelines laid out in the
quality plan, \cite{DS/FMU/IED/PLN008}.

\subsubsection{Dependencies}

This document depends on the signature $ZTermGenerator$ specified
in \cite{DS/FMU/IED/DTD063}, and the structure $ZTermGenerator$
specified in \cite{DS/FMU/IED/IMP063}. It makes use of the
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
open	ZTermGenerator;
=TEX

Next, we make the parser and Z type inferrer
directly available to the tests.
=SML
init_mt_results ();
open_theory"z_library";
delete_theory"mdt063" handle _ => ();
new_theory"mdt063";
=TEX

\section{SUPPORTING TEST FUNCTIONS}

The functions introduced in this section are using in testing the Z type
inferrer. Their provision enables the test cases to be implemented in a concise
(and hopefully readable) form.

The function $type\_infer$ is a general interface to the type inferrer, taking
a Z term in string form and producing an inferred Z paragraph.

=SML
open ZTypeInference ZUserInterfaceSupport;
TypeInference.set_ti_context[];

fun ⦏type_infer⦎ {quot : bool, standard : bool} (s : string) : Z_INFERRED = (
let	val parsed = ZParser.z_parser {is_quot=quot}
			(ZLex.z_lex [Lex.Text s]);
in
	type_check_z_para {standard = standard, allow_frees = not standard} parsed
end);

fun ⦏z_tm_of_string⦎  (s : string) : Z_TM = (
	case type_infer {quot=true, standard = false} s of
	ZInferred p => (
		case p of
		ZParaTerm (_, tm, _) => tm
		|_ => fail "" 0 []
		)
	|ZTypeError info => (print_z_error info)
);
=TEX
=SML
val ⦏generate_term⦎ : string -> TERM =
	 term_of_z_tm o z_tm_of_string;
val ⦏generate_theorem⦎ : string -> THM =
	refl_conv o generate_term;
=TEX
The following function provides the general interface to the term generator for
use in the module tests.
=SML
fun ⦏apply_test⦎ (s : string) = (
let	val thm = generate_theorem s;
	val side = (delete_thm s;()) handle _ => ();
in
	thm =|- save_thm (s, thm)
end);
=TEX
=SML
fun ⦏mt_run_ok⦎ rest =
let	val thing = map (fn (x,y,z) => (x,y,z,true)) rest;
in
	mt_run thing
end;

=TEX

\section{TEST CASES AND TEST DATA}

\subsection{Testing Terms in Extended Z}

\subsubsection{Sequence Display}

=SML
store_mt_results mt_run_ok [
("mdt063.0101", apply_test, "⟨⟩"),
("mdt063.0102", apply_test, "⟨1⟩"),
("mdt063.0103", apply_test, "⟨1,2⟩"),
("mdt063.0104", apply_test, "⟨1,x⟩"),
("mdt063.0105", apply_test, "⟨([x:ℤ]),([x:ℤ])⟩"),
("mdt063.0106", apply_test, "⟨true, false⟩"),
("mdt063.0107", apply_test, "⟨ℤ, ℤ⟩")
];
=TEX
\subsubsection{Set Display}
=SML
store_mt_results mt_run_ok [
("mdt063.0201", apply_test, "{1}"),
("mdt063.0202", apply_test, "{1}"),
("mdt063.0203", apply_test, "{1,2}"),
("mdt063.0204", apply_test, "{1,2} ∈ { {1, 2} }"),
("mdt063.0205", apply_test, "{ℤ, ℤ}")
];
=TEX
\subsubsection{Set Abstraction}
=SML
store_mt_results mt_run_ok [
("mdt063.0301", apply_test, "{x : ℤ}"),
("mdt063.0302", apply_test, "{x : ℤ | true }"),
("mdt063.0303", apply_test, "{x : ℤ ⦁ true }"),
("mdt063.0304", apply_test, "{x : ℤ ⦁ x }"),
("mdt063.0305", apply_test, "{x : ℤ | true ⦁ true }"),
("mdt063.0306", apply_test, "{([x : ℤ]) ⦁ x }"),
("mdt063.0307", apply_test, "{([x : ℤ]); y : ℤ | x = y ⦁ x }"),
("mdt063.0308", apply_test, "{([x : ℤ]); y :  ℙ ℤ | x ∈ y ⦁ x }"),
("mdt063.0309", apply_test, "{y : ℙ ℤ | ({x : ℤ} = y)}"),
("mdt063.0310", apply_test, "{y : ℙ ℤ | ({x : ℤ ⦁ x} = y)}"),
("mdt063.0311", apply_test, "{y : ℙ ℤ | ({x : ℤ} = y) ⦁ y}"),
("mdt063.0312", apply_test, "{y : ℙℙ ℤ | ({ {x : ℤ} } = y)}"),
("mdt063.0313", apply_test, "{y : ℙℙ ℤ | ({ {x : ℤ ⦁ x} } = y)}"),
("mdt063.0314", apply_test, "{x : ℤ | true }")
];
=TEX
\subsubsection{Powerset}
=SML
store_mt_results mt_run_ok [
("mdt063.0401", apply_test, "ℙ {}"),
("mdt063.0402", apply_test, "ℙ ℤ"),
("mdt063.0403", apply_test, "ℙ {ℤ}"),
("mdt063.0404", apply_test, "ℙ {ℤ} = ℙ {ℤ}"),
("mdt063.0405", apply_test, "ℙ {ℤ} ∈ ℙ ℙ {ℤ}"),
("mdt063.0406", apply_test, "ℙ { ([x : ℤ]) }"),
("mdt063.0407", apply_test, "ℙ { ([x : ℤ]); y : ℙ {x} }"),
("mdt063.0408", apply_test, "ℙ ([x : ℤ])"),
("mdt063.0409", apply_test, "ℙℙℙℙℙ z = ℙ y"),
("mdt063.0410", apply_test, "ℙ { ℙ ℤ } = ℙ ℙℙ ℤ"),
("mdt063.0411", apply_test, "ℙ { x : ℙℙ ℤ } = ℙ ℙℙ ℤ")
];
=TEX
\subsubsection{Tuple Display}

=SML
store_mt_results mt_run_ok [
("mdt063.0501", apply_test, "(1,2)"),
("mdt063.0502", apply_test, "(ℙ ℤ, ℤ)"),
("mdt063.0503", apply_test, "(ℤ, (ℙℤ, ℙℤ))"),
("mdt063.0504", apply_test, "(ℤ, ℙℤ) ∈ { (ℤ, ℙℤ) }"),
("mdt063.0505", apply_test, "(1,2,3,4,5,6) = (2,3,4,5,6,7)"),
("mdt063.0506", apply_test, "(1,2)")
];
=TEX

\subsubsection{Binding Display}
=SML
store_mt_results mt_run_ok [
("mdt063.0601", apply_test, "(a≜1, b≜2, c ≜3)"),
("mdt063.0602", apply_test, "(a≜(1,2), b≜(1,2))")
];
=TEX

\subsubsection{Product}
=SML
store_mt_results mt_run_ok [
("mdt063.0701", apply_test, "ℤ × ℤ"),
("mdt063.0702", apply_test, "ℤ × ℙ ℤ × ℙ ℤ "),
("mdt063.0703", apply_test, "ℙ ℤ × ℤ × { x : ℤ | true ⦁ x}"),
("mdt063.0704", apply_test, "ℙ ℤ × ℤ × (λ x : ℤ ⦁ 0)"),
("mdt063.0705", apply_test, "(x ∈ ℙ (ℤ × ℤ × ℤ)); y ∈ x × ℙ (ℤ × ℤ × ℤ)")
];
=TEX
\subsubsection{Theta}
=SML
store_mt_results mt_run_ok [
("mdt063.0801", apply_test, "θ ([x:X])"),
("mdt063.0802", apply_test, "θ ([x:X])'"),
("mdt063.0803", apply_test, "θ ([x:X])' = θ [x:X]"),
("mdt063.0804", apply_test, "θ ([a,b,c:ℤ])' =(a≜1, b≜2, c≜3)")
];
=TEX
\subsubsection{Tuple Selection}
=SML
store_mt_results mt_run_ok [
("mdt063.0901", apply_test, "(1,2,3).1"),
("mdt063.0902", apply_test, "(a,b,c).2"),
("mdt063.0903", apply_test, "(a,b,c).3"),
("mdt063.0904", apply_test, "(a,b).2")
];
=TEX
\subsubsection{Binding Selection}
=SML
store_mt_results mt_run_ok [
("mdt063.1001", apply_test, "(θ[a:ℤ]).a"),
("mdt063.1002", apply_test, "s=θ[a:ℤ] ∧ s.a = 0"),
("mdt063.1003", apply_test, "(θ[a:ℤ;b,c,d:ℙℤ]).d = d")
];
=TEX
\subsubsection{Application}
=SML
store_mt_results mt_run_ok [
("mdt063.1101", apply_test, "f a"),
("mdt063.1102", apply_test, "{(0, A),(1, B), (2, C)} 1")
];
=TEX
\subsubsection{Lambda Abstraction}
=SML
store_mt_results mt_run_ok [
("mdt063.1201", apply_test, "(λx : ℤ ⦁ true)"),
("mdt063.1202", apply_test, "(λ ([x,y:ℤ]) | x=y ⦁ (x,y))"),
("mdt063.1203", apply_test, "(λx : ℤ | true ⦁ a)")
];
=TEX
\subsubsection{Definite Description}
=SML
store_mt_results mt_run_ok [
("mdt063.1301", apply_test, "(μx : ℤ ⦁ true)"),
("mdt063.1302", apply_test, "(μ ([x,y:ℤ]) | x=y ⦁ (x,y))"),
("mdt063.1303", apply_test, "(μx : ℤ | true ⦁ a)")
];
=TEX
\subsubsection{Truth}
=SML
store_mt_results mt_run_ok [
("mdt063.1401", apply_test, "true"),
("mdt063.1402", apply_test, "false")
];
=TEX
\subsubsection{Predicate Negation}
=SML
store_mt_results mt_run_ok [
("mdt063.1501", apply_test, "¬ true"),
("mdt063.1502", apply_test, "¬false"),
("mdt063.1503", apply_test, "¬ ¬ false")
];
=TEX
\subsubsection{Logical Infix Operators for Predicates}
=SML
store_mt_results mt_run_ok [
("mdt063.1601", apply_test, "true ∧ true"),
("mdt063.1602", apply_test, "true ∨ false"),
("mdt063.1603", apply_test, "false ⇒ true"),
("mdt063.1604", apply_test, "true ⇔ true"),
("mdt063.1605", apply_test, "true; true")
];
=TEX
\subsubsection{Predicate Quantification}
=SML
store_mt_results mt_run_ok [
("mdt063.1701", apply_test, "∀ x, y : ℤ ⦁ x = y"),
("mdt063.1702", apply_test, "∃ x:ℤ ⦁ ∀ y : ℤ ⦁ x = y"),
("mdt063.1703", apply_test, "∃⋎1 x:{1,2,3} ⦁ x = 2"),
("mdt063.1704", apply_test, "∀ ([x:ℤ; y:ℕ]); a,b : ℤ ⦁ ∃ p:ℤ ⦁ p = x ∨ p=y ∨ p=a ∨ p=b"),
("mdt063.1705", apply_test, "∃ x:ℤ ⦁ true")
];
=TEX
\subsubsection{Schemas as Predicates}
=SML
store_mt_results mt_run_ok [
("mdt063.1801", apply_test, "{x:ℤ ⦁ Π(true ∧ [y:ℤ]) }"),
("mdt063.1802", apply_test, "∀ x : ℤ ⦁ ([a,b,c:ℤ])")
];
=TEX
\subsubsection{Horizontal Schemas}
=SML
store_mt_results mt_run_ok [
("mdt063.1901", apply_test, "[x:ℤ]"),
("mdt063.1902", apply_test, "[x:ℤ | x=0]"),
("mdt063.1903", apply_test, "[x,y,z:ℤ] ∧ x=0")
];
=TEX
\subsubsection{Decoration}
=SML
store_mt_results mt_run_ok [
("mdt063.2001", apply_test, "([x:ℤ])'"),
("mdt063.2002", apply_test, "([x:ℤ])!"),
("mdt063.2003", apply_test, "([x:ℤ])?"),
("mdt063.2004", apply_test, "x?")
];
=TEX
\subsubsection{Precondition}
=SML
store_mt_results mt_run_ok [
("mdt063.2101", apply_test, "pre ([x', y :ℤ])"),
("mdt063.2102", apply_test, "pre ([x', y'', z?:ℤ])"),
("mdt063.2103", apply_test, "pre [x', y?, z! : ℤ]")
];
=TEX
\subsubsection{Schema Negation}
=SML
store_mt_results mt_run_ok [
("mdt063.2201", apply_test, "[(¬ [x:ℤ])]"),
("mdt063.2202", apply_test, "[(¬ ¬ ([x:ℤ]))]")
];
=TEX
\subsubsection{Logical Infix Operators for Schemas}
These particular tests require us to use standard mode for z terms
since this is the only way we can ensure that the schemas which occur in
the terms are not interpreted as predicates.
=SML
store_mt_results mt_run_ok [
("mdt063.2301", apply_test, "[[x:ℤ] ∧ [y:ℤ]]"),
("mdt063.2302", apply_test, "[[x:ℤ] ∨ [y:ℤ]]"),
("mdt063.2303", apply_test, "[[x:ℤ] ⇒ [y:ℤ]]"),
("mdt063.2304", apply_test, "[[x:ℤ] ⇔ [y:ℤ]]"),
("mdt063.2305", apply_test, "[[x:ℤ] ; [y:ℤ]]")
];
=TEX
\subsubsection{Schema Projection}
=SML
store_mt_results mt_run_ok [
("mdt063.2401", apply_test, "[x,y,z:ℤ] ↾⋎s [x:ℤ]"),
("mdt063.2402", apply_test, "[x:ℤ] ↾⋎s [y:ℤ]")
];
=TEX
\subsubsection{Schema Hiding}
=SML
store_mt_results mt_run_ok [
("mdt063.2501", apply_test, "[x,y,z:ℤ] \\⋎s  (x,y)"),
("mdt063.2502", apply_test, "[x,y:ℤ] \\⋎s  (x)")
];
=TEX
\subsubsection{Schema Quantification}
=SML
store_mt_results mt_run_ok [
("mdt063.2601", apply_test, "∀ x: ℤ ⦁ [x,y,z : ℤ]"),
("mdt063.2602", apply_test, "∃ y : ℤ | y = 5 ⦁ [y, z:ℤ | y = z]"),
("mdt063.2603", apply_test, "∃⋎1 y : ℤ | true ⦁ [y,z:X | true]")
];
=TEX
\subsubsection{Δ and Ξ}
=SML
store_mt_results mt_run_ok [
("mdt063.2701", apply_test, "[Δ[x:ℤ] | x=x']"),
("mdt063.2702", apply_test, "Δ[x:ℤ]"),
("mdt063.2703", apply_test, "[Ξ[x:ℤ] | x=x']"),
("mdt063.2704", apply_test, "Ξ[x:ℤ]")
];
=TEX
\subsubsection{Set Membership and Equality}
=SML
store_mt_results mt_run_ok [
("mdt063.2801", apply_test, "x ∈ {x}"),
("mdt063.2802", apply_test, "a ∈ ℙ a"),
("mdt063.2803", apply_test, "ℤ ∈ {ℤ,ℤ}"),
("mdt063.2804", apply_test, "0=0"),
("mdt063.2805", apply_test, "a = 2 ∨ a ∈ ℤ")
];
=TEX
\subsubsection{Schema Composition}
=SML
store_mt_results mt_run_ok [
("mdt063.2901", apply_test, "[x',y,z:ℤ] ⨾⋎s [x:ℤ]"),
("mdt063.2902", apply_test, "[x',y',a,b:ℤ] ⨾⋎s [x,y,a?:ℤ]")
];
=TEX
\subsubsection{Schema Piping}
There is no abstract machine support for schema piping.

\subsubsection{Integers and String Quotation}
String quotations may not appear in strings since they are processed by
reader/writer term recognisers. There is no simple way of testing
string quotation until the recognisers are in place.
=SML
store_mt_results mt_run_ok [
("mdt063.3101", apply_test, "0"),
("mdt063.3102", apply_test, "99999999")
];
=TEX
\subsubsection{Type Constraints}
The constructor for type constraints is not used, and the ``fat colon''
is now defined as a global variable in the Z library.
=TEX
\subsubsection{Local Variables}
=SML
store_mt_results mt_run_ok [
("mdt063.3301", apply_test, "∀ x:ℙℤ ⦁ (∀ x,y : ℤ × ℤ ⦁ x=y) ∧ x={0}"),
("mdt063.3302", apply_test, "[x:ℤ | x=0] ∧ x=0"),
("mdt063.3303", apply_test, "∀ x:ℙℤ ⦁ (∀ x,y : ℤ × ℤ ⦁ x=y) ∧ x={0}"),
("mdt063.3304", apply_test, "[x:ℤ | x=0] ∧ x=0")
];
=TEX
\subsubsection{Global Variables}
The tests for global variables require the Z library to be present.
The tests for the Z library tests these features more thoroughly.
=SML
store_mt_results mt_run_ok [
("mdt063.3401", apply_test, "∅[U] = {0}"),
("mdt063.3402", apply_test, "ℕ⋎1")
];
=TEX
\subsubsection{Let Expressions}

There is no abstract machine support for let expressions.

\subsubsection{Renaming}
=SML
store_mt_results mt_run_ok [
("mdt063.3601", apply_test, "[b,d:ℤ] [a/b, c/d]"),
("mdt063.3602", apply_test, "[x:ℤ] [abcdefg/x]")
];
=TEX
\subsubsection{Bracketed Terms}
=SML
store_mt_results mt_run_ok [
("mdt063.3701", apply_test, "1=(1)"),
("mdt063.3702", apply_test, "((((((((1,2,(((((((3))))))))))))))= ((1,2,3)))")
];
=TEX
\subsubsection{Casts}
=SML
store_mt_results mt_run_ok [
("mdt063.3801", apply_test, "x ⦂ ℤ"),
("mdt063.3802", apply_test, "x ⦂ [hapax_legomenon : ℤ]")
];
=TEX
\subsubsection{Term Quotation}
Term quotations may not appear in strings since they are processed by
reader/writer term recognisers.
=TEX
=SML
fun ⦏tq_z_tm_of_string⦎
	(s1 : string) (tm : TERM) (s2 : string) : Z_TM = (
let	val parsed = ZParser.z_parser {is_quot=true}
			(ZLex.z_lex [Lex.Text s1, Lex.Term tm, Lex.Text s2]);
in
	case type_check_z_para {standard=false, allow_frees = true} parsed of
			ZInferred p => (
		case p of
		ZParaTerm (_, tm, _) => tm
		|_ => fail "" 0 []
		)
	|ZTypeError info => (print_z_error info;fail "" 0 [])
end);
fun tq_tm_of_string (s1:string, tm:TERM, s2:string) : TERM = (
	term_of_z_tm (tq_z_tm_of_string s1 tm s2)
);
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
("mdt063.3501", tq_tm_of_string, ("", ⌜x⌝, " = true"), ⌜x = T⌝ ),
("mdt063.3502", tq_tm_of_string, ("", ⌜1⌝, " = x"), ⌜1 = x⌝ ),
("mdt063.3503", tq_tm_of_string, ("x ⇔ true ∧ ", ⌜x = y⌝, " ⇔ true"), ⌜x ⇔ (T ∧ x = y ⇔ T)⌝ ),
("mdt063.3504", tq_tm_of_string, ("x' ⇔ true ∧ ", ⌜x' = y⌝, " ⇔ true"), ⌜x' ⇔ (T ∧ x' = y ⇔ T)⌝ )
];
=TEX
\subsection{Free Variables}
Free variables are permitted in extended Z but not in standard Z. This
is tested as follows:

=SML
store_mt_results mt_run_ok [
("mdt063.5001", apply_test, "x"),
("mdt063.5002", apply_test, "⟨a, b, c⟩")
];
=TEX
\subsection{Binding of Global Variables}
We need a supply of Z global variables for these. The following is
stolen from \cite{DS/FMU/IED/MDT047}.
=SML
open_theory"hol";
new_theory"mdt047_test";
new_const("z'xyz", ℕ);
new_type("Z'T[1]", 1);
new_type("Z'T[2]", 2);
new_const("Z'Mk_T[1]", ⓣ'X → 'X $"Z'T[1]"⌝);
new_const("Z'Mk_T[2]", ⓣ'X → 'Y → ('X, 'Y) $"Z'T[2]"⌝);
new_const("z'𝕌",  ⓣ('X SET $"Z'T[1]" → 'X SET)⌝);
new_const("Totality",  ⓣ'X SET⌝);
new_const("z'f",  ⓣ('X SET, 'Y SET) $"Z'T[2]" → ('X, 'Y) $"Z'T[2]"⌝);
new_const("z'ℕ",  ⓣℕ SET⌝);
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
("mdt063.6001", generate_term, "xyz", ⌜z'xyz⌝ ),
("mdt063.6002", generate_term, "f[ℕ,ℕ]",
	⌜z'f ($"Z'Mk_T[2]" $"z'ℕ" $"z'ℕ")⌝ )
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


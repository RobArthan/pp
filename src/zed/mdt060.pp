=IGN
********************************************************************************
mdt060.doc: this file is part of the PPZed system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  mdt060.doc  ℤ $Date: 2006/12/02 13:17:10 $ $Revision: 1.22 $ $RCSfile: mdt060.doc,v $
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

\def\Title{Module Tests for Z Lexical Analyser}

\def\AbstractText{This document comprises test cases and test code/data for testing the Z lexical analyser described in the document DS/FMU/IED/DTD060.}

\def\Reference{DS/FMU/IED/MDT060}

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
%% LaTeX2e port: \TPPtitle{Module Tests for Z Lexical Analyser}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/MDT060}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.22 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2006/12/02 13:17:10 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{D.J.~King & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{
%% LaTeX2e port: This document comprises test cases and test code/data for
%% LaTeX2e port: testing the Z lexical analyser described in the document
%% LaTeX2e port: DS/FMU/IED/DTD060.}
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

\item[Issue 1.2 (1992/03/20), \FormatDate{92/03/19} ] Initial Draft.

\item[Issue 1.3 (1992/04/30), \FormatDate{92/04/30} ] Changed punctuation tables
according to new version of \cite{DS/FMU/IED/DEF007}.

\item[Issue 1.4 (1992/06/30), \FormatDate{92/06/30} ] Removed test ZLex3.3.54 which
was incorrect.
\item[Issue 1.6 (1992/07/21)~(\FormatDate{92/07/21
})] Changed names of schema operations.
\item[Issue 1.7 (1992/11/18)] Added test for keywords.
\item[Issue 1.8 (1999/02/24)] Updates for SML97.
\item[Issue 1.9 (2002/01/23)] Support for left associative operators.
\item[Issue 1.10 (2002/03/11)] R0071: multiple underscores now allowed in identifiers.
\item[Issue 1.11 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.12 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.13 (2003/07/29)] Tests for new treatment of subscripts.
\item[Issue 1.14 (2005/09/09)] Tests for new forms of stubs and the new \$-feature.
\item[Issue 1.15 (2005/09/10)] Added test for `,,'.
\item[Issue 1.16 (2005/09/13)] Added tests for
=INLINEFT
∀⋎s
=TEX
\ etc.
\item[Issue 1.17 (2006/01/24), 1.18 (2006/01/25)] Revised tests for \$-feature.
\item[Issue 1.19 (2006/04/28)] Added test for handling of subscript digits.
\item[Issue 1.20 (2006/07/19), 1.21 (2006/07/19)] Added tests for new punctuation characters.
\item[Issue 1.22 (2006/12/02)] Added tests for floating point literals.
\item[Issue 1.23 (2008/02/10)] Allowed for changes to lexical rules for underscores.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported PPZed to Lemma 1 document template.
\item[2018/08/25]
Removed test for distributed concatenation (ZLex.3.3.35).
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}

Correct test for quotation and antiquotation.

\pagebreak
\section{GENERAL}
\subsection{Scope}

This document comprises test cases and test code/data for
testing the Z lexical analyser specified in \cite{DS/FMU/IED/DTD060}.

\subsection{Introduction}

\subsubsection{Background and Purpose}
This document is intended to supply module test for the Z lexical
analyser as defined in \cite{DS/FMU/IED/DTD060} and implemented
in \cite{DS/FMU/IED/IMP060}. The tests are intended to meet
the requirements for tests identified in the quality plan
\cite{DS/FMU/IED/PLN008}.

We have only one function to test, namely $z\_lex$. The detailed design
refers to \cite{DS/FMU/IED/DEF007} for the behaviour of this function.
Therefore it is that document which largely defines the function to be tested.
The detailed design does indicate error conditions which should be
tested.

\subsubsection{Dependencies}

These tests depend on
the test harness as implemented in DS/FMU/IED/IMP013, and
its corresponding detailed design document, DS/FMU/IED/DTD013.

\subsubsection{Possible Enhancements}

None known.

\subsubsection{Deficiencies}

There are no known deficiencies.

\section{TEST HARNESS INITIALISATION}

=SML
use_file "dtd013.sml";
use_file "imp013.sml";
init_mt_results ();
=TEX

\section{TEST CASES}
\begin{description}
\item[ZLex.1]
Check that inputs consisting of a single punctuation character
and reserved words are handled correctly. Also check that
the empty string handles correctly.
\item[ZLex.2]
Check that various forms of white space are handled correctly.
\item[ZLex.3]
Check that inputs comprising of identifiers (alphanumeric,
greek, symbolic and subscripted punctuation) are
handled correctly.
\item[ZLex.4]
Exhibit the reachable errors identified in the detailed design.
\item[ZLex.5]
Check that inputs comprising of numbers
are handled correctly.
\item[ZLex.6]
Check that inputs comprising of decoration
are handled correctly.
\item[ZLex.7]
Check that inputs containing keywords
are handled correctly.
\item[ZLex.8]
Check the \$-feature.
\end{description}
\section{PREAMBLE}
=SML
open ZLex;
init_mt_results();
=TEX
The following function tests for the equality of Z tokens.
=SML
fun tok_eq (tok1, tok2) = (
	case (tok1, tok2) of
	  (ZTAqTm x1, ZTAqTm x2) => x1 =$ x2
	| (ZTChar x1, ZTChar x2) => x1 = x2
	| (ZTDecor x1, ZTDecor x2) => x1 = x2
	| (ZTId x1, ZTId x2) => x1 = x2
	| (ZTNumber x1, ZTNumber x2) => x1 = x2
	| (ZTFloat x1, ZTFloat x2) => x1 = x2
	| (ZTString x1, ZTString x2) => x1 = x2
	| (ZTAmpersand, ZTAmpersand) => true
	| (ZTAx, ZTAx) => true
	| (ZTBSlash, ZTBSlash) => true
	| (ZTBar, ZTBar) => true
	| (ZTColon, ZTColon) => true
	| (ZTComma, ZTComma) => true
	| (ZTConjecture, ZTConjecture) => true
	| (ZTDot, ZTDot) => true
	| (ZTDots, ZTDots) => true
	| (ZTEnd, ZTEnd) => true
	| (ZTEos, ZTEos) => true
	| (ZTFreeTyDef, ZTFreeTyDef) => true
	| (ZTFun, ZTFun) => true
	| (ZTGen, ZTGen) => true
	| (ZTIs, ZTIs) => true
	| (ZTLbrace, ZTLbrace) => true
	| (ZTLbrack, ZTLbrack) => true
	| (ZTLet, ZTLet) => true
	| (ZTLsqbrack, ZTLsqbrack) => true
	| (ZTPipe, ZTPipe) => true
	| (ZTPre, ZTPre) => true
	| (ZTΔ, ZTΔ) => true
	| (ZTΞ, ZTΞ) => true
	| (ZT∧ a, ZT∧ b) => a = b
	| (ZT≜, ZT≜) => true
	| (ZT⇔ a, ZT⇔ b) => a = b
	| (ZT∃ a, ZT∃ b) => a = b
	| (ZT∃⋎1 a, ZT∃⋎1 b) => a = b
	| (ZT⨾, ZT⨾) => true
	| (ZT↾, ZT↾) => true
	| (ZTλ, ZTλ) => true
	| (ZT∀ a, ZT∀ b) => a = b
	| (ZT⇒ a, ZT⇒ b) => a = b
	| (ZT⟨, ZT⟨) => true
	| (ZTμ, ZTμ) => true
	| (ZT¬ a, ZT¬ b) => a = b
	| (ZT∨ a, ZT∨ b) => a = b
	| (ZT⟩, ZT⟩) => true
	| (ZT⦁, ZT⦁) => true
	| (ZTθ, ZTθ) => true
	| (ZT×, ZT×) => true
	| (ZTRbrace, ZTRbrace) => true
	| (ZTRbrack, ZTRbrack) => true
	| (ZTRel, ZTRel) => true
	| (ZTRsqbrack, ZTRsqbrack) => true
	| (ZTSch, ZTSch) => true
	| (ZTSemi, ZTSemi) => true
	| (ZTSlash, ZTSlash) => true
	| (ZTSt, ZTSt) => true
	| (ZTUnderScore, ZTUnderScore) => true
	| (ZTUnderScoreQuery, ZTUnderScoreQuery) => true
	| (ZTUnderScoreExclam, ZTUnderScoreExclam) => true
	| (ZTVert, ZTVert) => true
	| _ => false
);
=TEX
and the following function does lists of tokens:
=SML
fun tok_list_eq ([], []) =
		true
|   tok_list_eq (tok1::more1, tok2::more2) =
		tok_eq(tok1, tok2) andalso tok_list_eq (more1, more2)
|   tok_list_eq (_, _) = false;
=TEX
\section{THE TESTS}
\subsection{Case 1}
=SML
val z_lex_1 = z_lex o (fn s => [Lex.Text s]);
=TEX
=SML
store_mt_results (mt_runf tok_list_eq)
[("ZLex.1.1", z_lex_1, "λ", [ZTλ, ZTEos]),
("ZLex.1.2", z_lex_1, "μ", [ZTμ, ZTEos]),
("ZLex.1.3", z_lex_1, "∀", [ZT∀ false, ZTEos]),
("ZLex.1.4", z_lex_1, "∃", [ZT∃ false, ZTEos]),
("ZLex.1.5", z_lex_1, "∃⋎1", [ZT∃⋎1 false, ZTEos]),
("ZLex.1.6", z_lex_1, "¬", [ZT¬ false, ZTEos]),
("ZLex.1.7", z_lex_1, "pre", [ZTPre, ZTEos]),
("ZLex.1.8", z_lex_1, "Δ", [ZTΔ, ZTEos]),
("ZLex.1.9", z_lex_1, "Ξ", [ZTΞ, ZTEos]),
("ZLex.1.10", z_lex_1, ">>", [ZTPipe, ZTEos])];
=TEX
=SML
store_mt_results (mt_runf tok_list_eq)
[("ZLex.1.11", z_lex_1, "↾⋎s", [ZT↾, ZTEos]),
("ZLex.1.12", z_lex_1, "⨾⋎s", [ZT⨾, ZTEos]),
("ZLex.1.13", z_lex_1, "∧", [ZT∧ false, ZTEos]),
("ZLex.1.14", z_lex_1, "∨", [ZT∨ false, ZTEos]),
("ZLex.1.15", z_lex_1, "⇔", [ZT⇔ false, ZTEos]),
("ZLex.1.16", z_lex_1, "⇒", [ZT⇒ false, ZTEos]),
("ZLex.1.17", z_lex_1, "let", [ZTLet, ZTEos]),
("ZLex.1.18", z_lex_1, "fun", [ZTId "fun", ZTEos]),
("ZLex.1.19", z_lex_1, "gen", [ZTId "gen", ZTEos]),
("ZLex.1.20", z_lex_1, "rel", [ZTId "rel", ZTEos])];
=TEX
=SML
store_mt_results (mt_runf tok_list_eq)
[("ZLex.1.21", z_lex_1, "&", [ZTAmpersand, ZTEos]),
("ZLex.1.23", z_lex_1, "{", [ZTLbrace, ZTEos]),
("ZLex.1.24", z_lex_1, "}", [ZTRbrace, ZTEos]),
("ZLex.1.25", z_lex_1, "(", [ZTLbrack, ZTEos]),
("ZLex.1.26", z_lex_1, ")", [ZTRbrack, ZTEos]),
("ZLex.1.27", z_lex_1, "[", [ZTLsqbrack, ZTEos]),
("ZLex.1.28", z_lex_1, "]", [ZTRsqbrack, ZTEos]),
("ZLex.1.29", z_lex_1, "⟨", [ZT⟨, ZTEos]),
("ZLex.1.30", z_lex_1, "⟩", [ZT⟩, ZTEos])];
=TEX
=SML
store_mt_results (mt_runf tok_list_eq)
[("ZLex.1.31", z_lex_1, ",", [ZTComma, ZTEos]),
("ZLex.1.32", z_lex_1, "...", [ZTDots, ZTEos]),
("ZLex.1.33", z_lex_1, ".", [ZTDot, ZTEos]),
("ZLex.1.34", z_lex_1, "/", [ZTSlash, ZTEos]),
("ZLex.1.35", z_lex_1, "\\⋎s", [ZTBSlash, ZTEos]),
("ZLex.1.36", z_lex_1, "::=", [ZTFreeTyDef, ZTEos]),
("ZLex.1.37", z_lex_1, ":", [ZTColon, ZTEos]),
("ZLex.1.38", z_lex_1, ";", [ZTSemi, ZTEos]),
("ZLex.1.39", z_lex_1, "|", [ZTVert, ZTEos]),
("ZLex.1.40", z_lex_1, "?⊢", [ZTConjecture, ZTEos])];
=TEX
=SML
store_mt_results (mt_runf tok_list_eq)
[("ZLex.1.41", z_lex_1, "≜", [ZT≜, ZTEos]),
("ZLex.1.42", z_lex_1, "⦁", [ZT⦁, ZTEos]),
("ZLex.1.43", z_lex_1, "×", [ZT×, ZTEos]),
("ZLex.1.44", z_lex_1, "θ", [ZTθ, ZTEos]),
("ZLex.1.45", z_lex_1, "", [ZTEos])];
=TEX
=SML
store_mt_results (mt_runf tok_list_eq)
[("ZLex.1.51", z_lex_1, "_", [ZTUnderScore, ZTEos]),
("ZLex.1.52", z_lex_1, "_?", [ZTUnderScoreQuery, ZTEos]),
("ZLex.1.53", z_lex_1, "_!", [ZTUnderScoreExclam, ZTEos]),
("ZLex.1.54", z_lex_1, ",, ,,", [ZTDots, ZTDots, ZTEos])
];
=TEX
=SML
store_mt_results (mt_runf tok_list_eq)
[("ZLex.1.61", z_lex_1, "∧⋎s", [ZT∧ true, ZTEos]),
("ZLex.1.62", z_lex_1, "∨⋎s", [ZT∨ true, ZTEos]),
("ZLex.1.63", z_lex_1, "⇔⋎s", [ZT⇔ true, ZTEos]),
("ZLex.1.64", z_lex_1, "⇒⋎s", [ZT⇒ true, ZTEos]),
("ZLex.1.65", z_lex_1, "∀⋎s", [ZT∀ true, ZTEos]),
("ZLex.1.66", z_lex_1, "∃⋎s", [ZT∃ true, ZTEos]),
("ZLex.1.67", z_lex_1, "∃⋎1⋎s", [ZT∃⋎1 true, ZTEos])];
=TEX
\subsection{Case 2}
=SML
val z_lex_2 = z_lex_1;
=TEX
=SML
store_mt_results (mt_runf tok_list_eq)
[
 ("ZLex.2.1", z_lex_2, "\t A        B\t\n C D E\tF", map ZTId (explode"ABCDEF") @ [ZTEos])
];
=TEX

\subsection{Case 3}
=SML
fun z_lex_3 inp = (
	(case z_lex_1 inp of
	[ZTId inp, ZTEos] => 1
	|other => 2
	)
);
=TEX
\subsubsection{Alphanumeric Identifiers}
=SMLLITERAL
store_mt_results mt_run
[("ZLex.3.1.1", z_lex_3, "a", 1),
 ("ZLex.3.1.2", z_lex_3, "ab", 1),
 ("ZLex.3.1.3", z_lex_3, "abc123", 1),
 ("ZLex.3.1.4", z_lex_3, "a_b", 1),
 ("ZLex.3.1.5", z_lex_3, "a_1", 1),
 ("ZLex.3.1.6", z_lex_3, "abc_123_def", 1),
 ("ZLex.3.1.7", z_lex_3, "a⋎1", 1),
 ("ZLex.3.1.8", z_lex_3, "a⋎1⋎∧", 1),
 ("ZLex.3.1.9", z_lex_3, "abc_123⋎1", 1),
 ("ZLex.3.1.10", z_lex_3, "abc_123⋎1⋎∧", 1),
 ("ZLex.3.1.21", z_lex_3, "abc__123⋎1⋎∧", 1)];
=TEX
=SMLLITERAL
store_mt_results mt_run
[("ZLex.3.1.11a", z_lex_3, "a_", 1),
 ("ZLex.3.1.11b", z_lex_3, "a _", 2),
 ("ZLex.3.1.12a", z_lex_3, "a_b_", 1),
 ("ZLex.3.1.12b", z_lex_3, "a_b _", 2),
 ("ZLex.3.1.13a", z_lex_3, "_abc123", 1),
 ("ZLex.3.1.13b", z_lex_3, "_ abc123", 2),
 ("ZLex.3.1.14", z_lex_3, "a_b c", 2),
 ("ZLex.3.1.15", z_lex_3, "a∧1", 2),
 ("ZLex.3.1.16", z_lex_3, "abc&123_def", 2),
 ("ZLex.3.1.17", z_lex_3, "a⋎1_", 2),
 ("ZLex.3.1.18", z_lex_3, "a_1-a", 2),
 ("ZLex.3.1.19", z_lex_3, "abc'_123a⋎1", 2),
 ("ZLex.3.1.20", z_lex_3, "abc_1231a⋎∧'", 2),
 ("ZLex.3.1.22a", z_lex_3, "abc_1231a_ _", 2),
 ("ZLex.3.1.22b", z_lex_3, "abc_1231a__", 1)];
=TEX
\subsubsection{Greek Identifiers}
=SML
store_mt_results mt_run
[("ZLex.3.2.1", z_lex_3, "α", 1),
 ("ZLex.3.2.2", z_lex_3, "β", 1),
 ("ZLex.3.2.3", z_lex_3, "γ", 1),
 ("ZLex.3.2.4", z_lex_3, "δ", 1),
 ("ZLex.3.2.5", z_lex_3, "ε", 1),
 ("ZLex.3.2.6", z_lex_3, "ζ", 1),
 ("ZLex.3.2.7", z_lex_3, "η", 1),
 ("ZLex.3.2.8", z_lex_3, "θ", 2), (* ZTθ *)
 ("ZLex.3.2.9", z_lex_3, "ι", 1),
 ("ZLex.3.2.10", z_lex_3, "κ", 1)];
=TEX
=SML
store_mt_results mt_run
[("ZLex.3.2.11", z_lex_3, "λ", 2), (* ZTλ *)
 ("ZLex.3.2.12", z_lex_3, "μ", 2), (* ZTμ *)
 ("ZLex.3.2.13", z_lex_3, "ν", 1),
 ("ZLex.3.2.14", z_lex_3, "ξ", 1),
 ("ZLex.3.2.15", z_lex_3, "π", 1),
 ("ZLex.3.2.16", z_lex_3, "ρ", 1),
 ("ZLex.3.2.17", z_lex_3, "σ", 1),
 ("ZLex.3.2.18", z_lex_3, "τ", 1),
 ("ZLex.3.2.19", z_lex_3, "υ", 1),
 ("ZLex.3.2.20", z_lex_3, "φ", 1)];
=TEX
=SML
store_mt_results mt_run
[("ZLex.3.2.21", z_lex_3, "χ", 1),
 ("ZLex.3.2.22", z_lex_3, "ψ", 1),
 ("ZLex.3.2.23", z_lex_3, "ω", 1),
 ("ZLex.3.2.24", z_lex_3, "Γ", 1),
 ("ZLex.3.2.25", z_lex_3, "Δ", 2), (* ZTΔ *)
 ("ZLex.3.2.26", z_lex_3, "Θ", 1),
 ("ZLex.3.2.27", z_lex_3, "Λ", 1),
 ("ZLex.3.2.28", z_lex_3, "Ξ", 2), (* ZTΞ *)
 ("ZLex.3.2.29", z_lex_3, "Π", 1),
 ("ZLex.3.2.30", z_lex_3, "Σ", 1)];
=TEX
=SMLLITERAL
store_mt_results mt_run
[("ZLex.3.2.31", z_lex_3, "Υ", 1),
 ("ZLex.3.2.32", z_lex_3, "Φ", 1),
 ("ZLex.3.2.33", z_lex_3, "Ψ", 1),
 ("ZLex.3.2.34", z_lex_3, "Ω", 1),
 ("ZLex.3.2.35", z_lex_3, "α", 1),
 ("ZLex.3.2.36", z_lex_3, "α⋎1", 1),
 ("ZLex.3.2.37", z_lex_3, "Δ⋎Ξ", 1),
 ("ZLex.3.2.38", z_lex_3, "Ξ⋎Δ", 1),
 ("ZLex.3.2.39", z_lex_3, "Ξ⋎∀", 1),
 ("ZLex.3.2.40", z_lex_3, "Ξ⋎∀", 1)];
=TEX
\subsubsection{Symbolic Identifiers}
=SMLLITERAL
store_mt_results mt_run
[("ZLex.3.3.1", z_lex_3, "↗", 1),
 ("ZLex.3.3.2", z_lex_3, "↕", 1),
 ("ZLex.3.3.3", z_lex_3, "∪", 1),
 ("ZLex.3.3.4", z_lex_3, "∩", 1),
 ("ZLex.3.3.5", z_lex_3, "⋃", 1),
 ("ZLex.3.3.6", z_lex_3, "⋂", 1),
 ("ZLex.3.3.7", z_lex_3, "⊆", 1),
 ("ZLex.3.3.8", z_lex_3, "⊂", 1),
 ("ZLex.3.3.9", z_lex_3, "∅", 1),
 ("ZLex.3.3.10", z_lex_3, "∉", 1)];
=TEX
=SML
store_mt_results mt_run
[("ZLex.3.3.11", z_lex_3, "⦇", 1),
 ("ZLex.3.3.12", z_lex_3, "⦈", 1),
 ("ZLex.3.3.13", z_lex_3, "⩤", 1),
 ("ZLex.3.3.14", z_lex_3, "⩥", 1),
 ("ZLex.3.3.15", z_lex_3, "◁", 1),
 ("ZLex.3.3.16", z_lex_3, "▷", 1),
 ("ZLex.3.3.17", z_lex_3, "⊢", 1),
 ("ZLex.3.3.18", z_lex_3, "⊕", 1),
 ("ZLex.3.3.19", z_lex_3, "⇸", 1)];
=TEX
=SML
store_mt_results mt_run
[("ZLex.3.3.21", z_lex_3, "→", 1),
 ("ZLex.3.3.22", z_lex_3, "⤔", 1),
 ("ZLex.3.3.23", z_lex_3, "↣", 1),
 ("ZLex.3.3.24", z_lex_3, "⤀", 1),
 ("ZLex.3.3.25", z_lex_3, "↠", 1),
 ("ZLex.3.3.26", z_lex_3, "⤖", 1),
 ("ZLex.3.3.27", z_lex_3, "↔", 1),
 ("ZLex.3.3.30", z_lex_3, "≤", 1)];
=TEX
=SML
store_mt_results mt_run
[("ZLex.3.3.31", z_lex_3, "≥", 1),
 ("ZLex.3.3.32", z_lex_3, "<", 1),
 ("ZLex.3.3.33", z_lex_3, ">", 1),
 ("ZLex.3.3.34", z_lex_3, "⁀", 1),
 ("ZLex.3.3.36", z_lex_3, "≠", 1),
 ("ZLex.3.3.37", z_lex_3, "+", 1),
 ("ZLex.3.3.38", z_lex_3, "-", 1),
 ("ZLex.3.3.39", z_lex_3, "*", 1),
 ("ZLex.3.3.40", z_lex_3, "#", 1)];
=TEX
=SML
store_mt_results mt_run
[("ZLex.3.3.41", z_lex_3, ".", 2), (* gives ZTDot *)
 ("ZLex.3.3.42", z_lex_3, "~", 1),
 ("ZLex.3.3.43", z_lex_3, "⊎", 1),
 ("ZLex.3.3.44", z_lex_3, "⟦", 1),
 ("ZLex.3.3.45", z_lex_3, "⟧", 1),
 ("ZLex.3.3.46", z_lex_3, "[", 2),
 ("ZLex.3.3.47", z_lex_3, "]", 2),
 ("ZLex.3.3.48", z_lex_3, "{", 2),
 ("ZLex.3.3.49", z_lex_3, "}", 2),
 ("ZLex.3.3.50", z_lex_3, "⟨", 2)];
=TEX
=SML
store_mt_results mt_run
[("ZLex.3.3.51", z_lex_3, "⟩", 2),
 ("ZLex.3.3.52", z_lex_3, "/", 2),
 ("ZLex.3.3.53", z_lex_3, "\\⋎s", 2),
 ("ZLex.3.3.55", z_lex_3, "∧", 2),
 ("ZLex.3.3.56", z_lex_3, "∨", 2),
 ("ZLex.3.3.57", z_lex_3, "¬", 2),
 ("ZLex.3.3.58", z_lex_3, "⇒", 2),
 ("ZLex.3.3.59", z_lex_3, "⇔", 2),
 ("ZLex.3.3.60", z_lex_3, "=", 1)];
=TEX
=SML
store_mt_results mt_run
[ ("ZLex.3.3.61", z_lex_3, "∈", 1),
 ("ZLex.3.3.62", z_lex_3, "∀", 2),
 ("ZLex.3.3.63", z_lex_3, "∃", 2),
 ("ZLex.3.3.64", z_lex_3, "⦁", 2),
 ("ZLex.3.3.66", z_lex_3, "×", 2),
 ("ZLex.3.3.67", z_lex_3, "≜", 2),
 ("ZLex.3.3.68", z_lex_3, "&", 2),
 ("ZLex.3.3.69", z_lex_3, "⨾⋎s", 2),
 ("ZLex.3.3.70", z_lex_3, "↾⋎s", 2)];
=TEX
=SML
store_mt_results mt_run
[("ZLex.3.3.71", z_lex_3, "::=", 2),
 ("ZLex.3.3.72", z_lex_3, "⊢", 1),
 ("ZLex.3.3.73", z_lex_3, "::=::=", 1),
 ("ZLex.3.3.74", z_lex_3, "|", 2)];
=TEX
=SMLLITERAL
store_mt_results mt_run
[("ZLex.3.3.81", z_lex_3, "↗⋎0", 1),
 ("ZLex.3.3.82", z_lex_3, "↕⋎0", 1),
 ("ZLex.3.3.83", z_lex_3, "∪⋎0", 1),
 ("ZLex.3.3.84", z_lex_3, "∩⋎0", 1),
 ("ZLex.3.3.85", z_lex_3, "⋃⋎0", 1),
 ("ZLex.3.3.86", z_lex_3, "⋂⋂⋎0", 1),
 ("ZLex.3.3.87", z_lex_3, "⊆⊆⋎0", 1),
 ("ZLex.3.3.88", z_lex_3, "⊂⊂⋎0", 1),
 ("ZLex.3.3.89", z_lex_3, "∅∅⋎0", 1),
 ("ZLex.3.3.90", z_lex_3, "∉∉⋎0", 1)];
=TEX
=TEX
\subsubsection{Subscripted Punctuation Identifiers}
=SMLLITERAL
store_mt_results mt_run
[("ZLex.3.4.1", z_lex_3, ",⋎0", 1),
 ("ZLex.3.4.2", z_lex_3, ";⋎0", 1),
 ("ZLex.3.4.3", z_lex_3, ":⋎0", 1),
 ("ZLex.3.4.4", z_lex_3, "(⋎0", 1),
 ("ZLex.3.4.5", z_lex_3, ")⋎0", 1),
 ("ZLex.3.4.6", z_lex_3, "𝔽⋎0", 1),
 ("ZLex.3.4.7", z_lex_3, "ℕ⋎0", 1),
 ("ZLex.3.4.8", z_lex_3, "ℙ⋎0", 1),
 ("ZLex.3.4.9", z_lex_3, "ℤ⋎0", 1)];
=TEX
=SML
store_mt_results mt_run
[ ("ZLex.3.4.10", z_lex_3, "ℙ⋎0⋎0", 1),
 ("ZLex.3.4.11", z_lex_3, "ℙ⋎0⋎0⋎0", 1)];
=TEX
=SML
store_mt_results mt_run
[ ("ZLex.3.4.12", z_lex_3, "ℙ⋎a⋎b", 1),
 ("ZLex.3.4.13", z_lex_3, "ℙ⋎ab", 1),
 ("ZLex.3.4.14", z_lex_3, "ℙ⋎1", 1),
 ("ZLex.3.4.15", z_lex_3, "ℙ⋎123", 1),
 ("ZLex.3.4.16", z_lex_3, "ℙ⋎{", 1),
 ("ZLex.3.4.17", z_lex_3, "ℙ⋎(", 1)];
=TEX
The subscript power set symbol will not typeset so
some of the ML code has been hidden.
\Hide{
=SML
store_mt_results (mt_runf tok_list_eq)
[ ("ZLex.3.4.18", z_lex_1, "ℙ⋎1a", [ZTId "ℙ⋎1", ZTId "a", ZTEos]),
("ZLex.3.4.19", z_lex_1, "ℙ⋎1_", [ZTId "ℙ⋎1", ZTUnderScore, ZTEos]),
("ZLex.3.4.20", z_lex_1, "ℙ⋎123abc", [ZTId "ℙ⋎123", ZTId "abc", ZTEos]),
("ZLex.3.4.21", z_lex_1, "ℙ⋎123_", [ZTId "ℙ⋎123", ZTUnderScore, ZTEos]),
("ZLex.3.4.22a", z_lex_1, "ℙ⋎Abc_123 _", [ZTId "ℙ⋎Abc_123", ZTUnderScore, ZTEos]),
("ZLex.3.4.2b2", z_lex_1, "ℙ⋎Abc_123_", [ZTId "ℙ⋎Abc_123_", ZTEos]),
("ZLex.3.4.23", z_lex_1, "ℙ⋎}_", [ZTId "ℙ⋎}", ZTUnderScore, ZTEos]),
("ZLex.3.4.24", z_lex_1, "ℙ⋎(Abc_123", [ZTId "ℙ⋎(", ZTId "Abc_123", ZTEos]),
("ZLex.3.4.25", z_lex_1, "ℙ⋎ℙAbc_123", [ZTId "ℙ⋎ℙ", ZTId "Abc_123", ZTEos]),
("ZLex.3.4.26", z_lex_1, "ℙ⋎ℙℙ", [ZTId "ℙ⋎ℙ", ZTId "ℙ", ZTEos]),
("ZLex.3.4.27", z_lex_1, "ℙ⋎}_!", [ZTId "ℙ⋎}", ZTUnderScoreExclam, ZTEos]),
("ZLex.3.4.30", z_lex_1, "ℙ⋎1_?", [ZTId "ℙ⋎1", ZTUnderScoreQuery, ZTEos]),
("ZLex.3.4.31", z_lex_1, "𝔽ℙ", [ZTId "𝔽", ZTId "ℙ", ZTEos]),
("ZLex.3.4.32", z_lex_1, "𝔹ℚ", [ZTId "𝔹", ZTId "ℚ", ZTEos]),
("ZLex.3.4.33", z_lex_1, "𝔹ℚ", [ZTId "𝔹", ZTId "ℚ", ZTEos]),
("ZLex.3.4.34", z_lex_1, "ℝℂ", [ZTId "ℝ", ZTId "ℂ", ZTEos]),
("ZLex.3.4.35", z_lex_1, "𝕌≜=", [ZTId "𝕌", ZT≜, ZTId "=", ZTEos])];
=TEX
}
\subsection{Case 4}
=SML
val z_lex_4 = z_lex_1;
=TEX
=SMLLITERAL
store_mt_results mt_run_fail
[("ZLex.4.1.1", z_lex_4, "a⋎↗x↕", gen_fail_msg "Z Lexical Analyser" 60007 []),
 ("ZLex.4.1.2", z_lex_4, "⋎", gen_fail_msg "Z Lexical Analyser" 60008 []),
 ("ZLex.4.1.3", z_lex_4, "⋏", gen_fail_msg "Z Lexical Analyser" 60008 []),
 ("ZLex.4.1.4", z_lex_4, "a⋏2", gen_fail_msg "Z Lexical Analyser" 60008 []),
 ("ZLex.4.1.5", z_lex_4, "⋎", gen_fail_msg "Z Lexical Analyser" 60008 []),
 ("ZLex.4.1.6", z_lex_4, "a↘0↕", gen_fail_msg "Z Lexical Analyser" 60008 [])
];
=TEX

\subsection{Case 5}
=SML
fun z_lex_5 inp = (
	case z_lex_1 inp of
		[ZTNumber _, ZTEos] => 1
	|	[ZTFloat _, ZTEos] => 2
	|	other => 3
);
=TEX
=SML
store_mt_results mt_run
[ ("ZLex.5.1.1", z_lex_5, "0", 1),
 ("ZLex.5.1.2", z_lex_5, "42", 1),
 ("ZLex.5.1.3", z_lex_5, "1234567890", 1),
 ("ZLex.5.1.3", z_lex_5, "12.0", 2),
 ("ZLex.5.1.3", z_lex_5, "0.1e5", 2),
 ("ZLex.5.1.3", z_lex_5, "0.1e~5", 2),
 ("ZLex.5.1.3", z_lex_5, "0.1E5", 2),
 ("ZLex.5.1.3", z_lex_5, "0.1E~5", 2),
 ("ZLex.5.1.4", z_lex_5, "ι", 3),
 ("ZLex.5.1.5", z_lex_5, "l", 3),
 ("ZLex.5.1.6", z_lex_5, "!", 3)];
=TEX

\subsection{Case 6}
=SML
fun z_lex_6 inp = (
	(case z_lex_1 inp of
	[ZTDecor inp, ZTEos] => 1
	|other => 2
	)
);
=TEX
=SML
store_mt_results mt_run
[ ("ZLex.6.1.1", z_lex_6, "'", 1),
 ("ZLex.6.1.2", z_lex_6, "?", 1),
 ("ZLex.6.1.3", z_lex_6, "!", 1),
 ("ZLex.6.1.4", z_lex_6, "'''", 1),
 ("ZLex.6.1.5", z_lex_6, "?'", 1),
 ("ZLex.6.1.6", z_lex_6, "?!'", 1),
 ("ZLex.6.1.7", z_lex_6, "a", 2),
 ("ZLex.6.1.8", z_lex_6, "α", 2),
 ("ZLex.6.1.9", z_lex_6, "∪", 2)];
=TEX

\subsection{Case 7}
=SML
fun z_lex_7 inp = (
	(case z_lex_1 inp of
	[ZTId inp, ZTEos] => 1
	|other => 2
	)
);
=TEX
=SMLPLAIN
store_mt_results mt_run
[ ("ZLex.7.1.1", z_lex_7, "%%bigoplus%%", 1),
 ("ZLex.7.1.2", z_lex_7, "%%Box%%", 1),
 ("ZLex.7.1.3", z_lex_7, "%%wr%%", 1)];
=TEX


\subsection{Case 8}
=SML
val z_lex_8 = z_lex;
=SML
open Lex;
store_mt_results (mt_runf tok_list_eq)
[ ("ZLex.8.1", z_lex_8, [Text "$", String "abc def"], [ZTId "$\"abc def\"", ZTEos]),
 ("ZLex.8.2", z_lex_8, [Text "$ ", String "abc def"], [ZTId "$", ZTString "abc def", ZTEos])
];
=TEX

\subsection{Case 9}
=SML
val z_lex_9 = z_lex;
=SML
open Lex;
store_mt_results (mt_runf tok_list_eq)
[ ("ZLex.9.1", z_lex_9, [Text "x⋎1.2"], [ZTId "x⋎1", ZTDot, ZTNumber 2, ZTEos])
];
=TEX

=TEX
\section{SUMMARY OF RESULTS}

=SML
diag_string(summarize_mt_results());
=TEX

\end{document}



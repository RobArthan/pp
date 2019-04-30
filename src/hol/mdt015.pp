=IGN
********************************************************************************
mdt015.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  mdt015.doc  ℤ $Date: 2005/05/07 12:08:26 $ $Revision: 1.10 $ $RCSfile: mdt015.doc,v $
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

\def\Title{Module Tests for Lexical Analyser}

\def\AbstractText{This document comprises test cases and test code/data for testing the lexically analyser described in the document DS/FMU/IED/DTD015.}

\def\Reference{DS/FMU/IED/MDT015}

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
%% LaTeX2e port: \TPPtitle{Module Tests for Lexical Analyser}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/MDT015}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.10 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2005/05/07 12:08:26 $
%% LaTeX2e port: }}  %% Mandatory field (with sensible default)
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{R.D.~Arthan & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{
%% LaTeX2e port: This document comprises test cases and test code/data for
%% LaTeX2e port: testing the lexically analyser described in the document
%% LaTeX2e port: DS/FMU/IED/DTD015.}
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
\subsection{Contents list}
\tableofcontents
\subsection{Document cross references}
\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes history}  % to get section number `0.3'
\begin{description}
\item[Issue 1.1 (1991/05/01)]
First version, based on DS/FMU/IED/DTD011.
\item[Issue 1.2 (1991/07/11)]
	Added test harness initialisation and summarising.
\item[Issue 1.3 (1991/07/26) 25 July 1991 ]
	New signature for $lex$, uses type $FIXITY$ rather
		than $HOL_TOKEN$ for input clasification.
	Make the tests run to completion.  Note the some tests here, particularly those for antiquotation,
		use the HOL~88 conventions rather than teh ICL~HOL conventions.


\item[Issue 1.5 (1992/01/20), \FormatDate{92/01/20} ] Updated to use new fonts.
\item [Issue 1.6 (1992/04/09) (8th April 1992)]
Changes required by CR0016.
\item [Issue 1.7 (1992/04/14) (14th April 1992)]
Changes required by CR0017.

\item[Issue 1.8 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.9 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.10 (2005/05/07)] HOL now supports left-associative operators.
\subsection{Changes forecast}

Correct test for quotation and antiquotation.
\item[Issue 1.11 (2006/12/02)] Tests for floating point literals.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\pagebreak
\section{GENERAL}
\subsection{Scope}

This document comprises test cases and test code/data for
testing the module test harness specified in \cite{DS/FMU/IED/DTD015}.

\subsection{Introduction}

\subsubsection{Background and Purpose}
This document is intended to supply module test for the HOL lexical
analyser as defined in \cite{DS/FMU/IED/DTD015} and implemented
in \cite{DS/FMU/IED/IMP015}. The tests are intended to meet
the requirements for tests identified in the quality plan
\cite{DS/FMU/IED/PLN008}.

We have only one function to test, namely $lex$. The detailed design
refers to \cite{DS/FMU/IED/DEF001} for the behaviour of this function.
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
\item[Lex.1]
Check that inputs consisting of a single terminal symbol
or an empty string are handled correctly.
\item[Lex.2]
Check that inputs consisting of a single identifier
with all possible combinations of fixity and binder status are handled correctly.
\item[Lex.3]
Check that inputs comprising each combination of two of
alphanumeric identifier, symbolic identifier, terminator,
punctuation and antiquotation given in section 3.3 of \cite{DS/FMU/IED/DEF001},
with and without space or copula separation, are handled correctly.
\item[Lex.4]
Check that terminators embedded in identifiers are handled correctly.
\item[Lex.5]
Check that various forms of white space are handled correctly.
\item[Lex.6]
Check that the terminators list is handled as defined in the detailed design.
\item[Lex.7]
Check escape character mechanism.
\item[Lex.8]
Check special case identifiers (copula only, copula start and/or finish).
\item[Lex.9]
Exhibit the reachable errors identified in the detailed design
\item[Lex.10]
Check on natual number and floating point literals.
\end{description}
\section{PREAMBLE}
=SML
open ModuleTest;
open Lex;
init_mt_results();
=TEX
The following terminator lists and classifier are used for
most of the tests:
=SML
val terms1 = (map explode["∃_1", "=⋎1⋏=", "=1=", "=", "+", "!"]);
val cl1 =
	(fn
		"=" => Infix (Lex.RightAssoc, 10)
	|	"+" => Infix  (Lex.RightAssoc, 100)
	|	"div" => Infix (Lex.LeftAssoc,  110)
	|	"∃_1" => Binder
	|	"not" => Prefix 5
	|	"dash" => Postfix 105
	|	_ => Nonfix);
=IGN
=TEX
=SML
fun list_eq (eq:'a * 'a -> bool) ((a :: x), (b :: y)) : bool = (
	eq(a,b) andalso list_eq eq (x, y)
) | list_eq eq ([], []) = true
| list_eq _ _ = false;
=TEX
=SML
fun ht_eq (HTAnd , HTAnd) = true
| ht_eq (HTAqTm a ,HTAqTm b ) = a =$ b
| ht_eq (HTAqTy a , HTAqTy b) = a =: b
| ht_eq (HTBinder a ,HTBinder b ) = a = b
| ht_eq (HTBlob , HTBlob) = true
| ht_eq (HTChar a , HTChar b) = a = b
| ht_eq (HTColon , HTColon) = true
| ht_eq (HTElse , HTElse) = true
| ht_eq (HTEos , HTEos) = true
| ht_eq (HTIf , HTIf) = true
| ht_eq (HTIn , HTIn) = true
| ht_eq (HTInOp a , HTInOp b) = a = b
| ht_eq (HTLbrace , HTLbrace) = true
| ht_eq (HTLbrack , HTLbrack) = true
| ht_eq (HTLet , HTLet) = true
| ht_eq (HTLsqbrack , HTLsqbrack) = true
| ht_eq (HTName a ,HTName b ) = a = b
| ht_eq (HTNumLit a ,HTNumLit b ) = a = b
| ht_eq (HTPostOp a ,HTPostOp b ) = a= b
| ht_eq (HTPreOp a ,HTPreOp b ) = a = b
| ht_eq (HTRbrace , HTRbrace) = true
| ht_eq (HTRbrack , HTRbrack) = true
| ht_eq (HTRsqbrack , HTRsqbrack) = true
| ht_eq (HTSemi , HTSemi) = true
| ht_eq (HTString a , HTString b) = a = b
| ht_eq (HTThen , HTThen) = true
| ht_eq (HTVert , HTVert) = true
| ht_eq _ = false;

=TEX
\section{THE TESTS}
\subsection{Case 1}
=SML
val lex_1 = lex terms1 cl1 o (fn s => [Lex.Text s]);
=TEX
=SML
store_mt_results_show (mt_runf (list_eq ht_eq))
[("Lex.1.1", lex_1, "and", [HTAnd, HTEos]),
("Lex.1.2", lex_1, "⦁", [HTBlob, HTEos]),
("Lex.1.3", lex_1, ":", [HTColon, HTEos]),
("Lex.1.4", lex_1, "else", [HTElse, HTEos]),
("Lex.1.5", lex_1, "if", [HTIf, HTEos]),
("Lex.1.6", lex_1, "in", [HTIn, HTEos]),
("Lex.1.7", lex_1, "{", [HTLbrace, HTEos]),
("Lex.1.8", lex_1, "(", [HTLbrack, HTEos]),
("Lex.1.9", lex_1, "let", [HTLet, HTEos]),
("Lex.1.10", lex_1, "[", [HTLsqbrack, HTEos]),
("Lex.1.11", lex_1, "}", [HTRbrace, HTEos]),
("Lex.1.12", lex_1, ")", [HTRbrack, HTEos]),
("Lex.1.13", lex_1, "]", [HTRsqbrack, HTEos]),
("Lex.1.14", lex_1, ";", [HTSemi, HTEos]),
("Lex.1.15", lex_1, "then", [HTThen, HTEos]),
("Lex.1.16", lex_1, "|", [HTVert, HTEos]),
("Lex.1.17", lex_1, "", [HTEos])];
=TEX
\subsection{Case 2}
=SML
val lex_2 = lex_1;
=TEX
=SML
store_mt_results_show (mt_runf (list_eq ht_eq))
[("Lex.2.1", lex_2, "+",
	[HTInOp {name="+", is_type_op=true, is_term_op=true, prec=(Lex.RightAssoc, 100)}, HTEos]),
("Lex.2.2", lex_2, "not", [HTPreOp {name="not", prec=5}, HTEos]),
("Lex.2.3", lex_2, "dash", [HTPostOp {name="dash", prec=105}, HTEos]),
("Lex.2.4", lex_2, "∃_1", [HTBinder "∃_1", HTEos])];
=TEX
\subsection{Case 3}
=SML
fun HOL_term_recogniser (_, _, x, _) = x;
val lex_3 = length o lex terms1 cl1;
val ty_3 = mk_vartype"'lex3";
val tm_3 = mk_var("lex3",ty_3);
=TEX
=SML
store_mt_results_show mt_run
[
 ("Lex.3.1.1", lex_3, ⌜A_BC_D⌝, 2),
 ("Lex.3.2.1", lex_3, ⌜A_B|⌝, 3),
 ("Lex.3.3.1", lex_3, ⌜A_B!⌝, 3),
 ("Lex.3.4.1", lex_3, ⌜A_B#⌝, 3),
 ("Lex.3.5.1", lex_3, ⌜A_B^:ty_3⌝, 5),
 ("Lex.3.1.2", lex_3, ⌜@@@@C_D⌝, 3),
 ("Lex.3.2.2", lex_3, ⌜@@@@|⌝, 3),
 ("Lex.3.3.2", lex_3, ⌜@@@@!⌝, 3),
 ("Lex.3.4.2", lex_3, ⌜@@@@#⌝, 2),
 ("Lex.3.5.2", lex_3, ⌜@@@@^tm_3⌝, 3),
 ("Lex.3.1.3", lex_3, ⌜!C_D⌝, 3),
 ("Lex.3.2.3", lex_3, ⌜!|⌝, 3),
 ("Lex.3.3.3", lex_3, ⌜!!⌝, 3),
 ("Lex.3.4.3", lex_3, ⌜!#⌝, 3),
 ("Lex.3.5.3", lex_3, ⌜!^tm_3⌝, 4),
 ("Lex.3.1.4", lex_3, ⌜⦁C_D⌝, 3),
 ("Lex.3.2.4", lex_3, ⌜⦁|⌝, 3),
 ("Lex.3.3.4", lex_3, ⌜⦁!⌝, 3),
 ("Lex.3.4.4", lex_3, ⌜⦁#⌝, 3),
 ("Lex.3.5.4", lex_3, ⌜⦁^tm_3⌝, 4),
 ("Lex.3.1.5", lex_3, ⌜^(tm_3)C_D⌝, 6),
 ("Lex.3.2.5", lex_3, ⌜^(tm_3)|⌝, 6),
 ("Lex.3.3.5", lex_3, ⌜^(tm_3)!⌝, 6),
 ("Lex.3.4.5", lex_3, ⌜^(tm_3)#⌝, 6),
 ("Lex.3.5.5", lex_3, ⌜^(tm_3)^tm_3⌝, 7),
 ("Lex.3.1.6", lex_3, ⌜A_B C_D⌝, 3),
 ("Lex.3.2.6", lex_3, ⌜A_B |⌝, 3),
 ("Lex.3.3.6", lex_3, ⌜A_B !⌝, 3),
 ("Lex.3.4.6", lex_3, ⌜A_B #⌝, 3),
 ("Lex.3.5.6", lex_3, ⌜A_B ^:ty_3⌝, 5),
 ("Lex.3.1.7", lex_3, ⌜@@@@ C_D⌝, 3),
 ("Lex.3.2.7", lex_3, ⌜@@@@ |⌝, 3),
 ("Lex.3.3.7", lex_3, ⌜@@@@ !⌝, 3),
 ("Lex.3.4.7", lex_3, ⌜@@@@ #⌝, 3),
 ("Lex.3.5.7", lex_3, ⌜@@@@ ^tm_3⌝, 4),
 ("Lex.3.1.8", lex_3, ⌜! C_D⌝, 3),
 ("Lex.3.2.8", lex_3, ⌜! |⌝, 3),
 ("Lex.3.3.8", lex_3, ⌜! !⌝, 3),
 ("Lex.3.4.8", lex_3, ⌜! #⌝, 3),
 ("Lex.3.5.8", lex_3, ⌜! ^tm_3⌝, 4),
 ("Lex.3.1.9", lex_3, ⌜⦁ C_D⌝, 3),
 ("Lex.3.2.9", lex_3, ⌜⦁ |⌝, 3),
 ("Lex.3.3.9", lex_3, ⌜⦁ !⌝, 3),
 ("Lex.3.4.9", lex_3, ⌜⦁ #⌝, 3),
 ("Lex.3.5.9", lex_3, ⌜⦁ ^tm_3⌝, 4),
 ("Lex.3.1.10", lex_3, ⌜^(tm_3) C_D⌝, 6),
 ("Lex.3.2.10", lex_3, ⌜^(tm_3) |⌝, 6),
 ("Lex.3.3.10", lex_3, ⌜^(tm_3) !⌝, 6),
 ("Lex.3.4.10", lex_3, ⌜^(tm_3) #⌝, 6),
 ("Lex.3.5.10", lex_3, ⌜^(tm_3) ^tm_3⌝, 7)
];
=TEX
\subsection{Case 4}
=SML
val lex_4 = lex_3;
=TEX
=SML
store_mt_results_show mt_run
[
 ("Lex.4.1", lex_3, ⌜A_!_D⌝, 2),
 ("Lex.4.2", lex_3, ⌜_!!⌝, 3),
 ("Lex.4.3", lex_3, ⌜_!_!⌝, 2),
 ("Lex.4.4", lex_3, ⌜!_!⌝, 2)
];
=TEX
\subsection{Case 5}
=SML
val lex_5 = lex terms1 cl1;
=TEX
=SML
store_mt_results_show (mt_runf (list_eq ht_eq))
[
 ("Lex.5.1", lex_5, ⌜	
			A        B		C
D
E
			F⌝,
	map HTName (explode"ABCDEF") @ [HTEos])
];
=TEX
\subsection{Case 6}
=SML
val terms6 = map explode["##", "#"];
val lex_6 = lex terms6 cl1;
=TEX
=SML
store_mt_results_show (mt_runf (list_eq ht_eq))
[
 ("Lex.6.1", lex_6, ⌜# ## ### ####⌝,
	[HTName "#", HTName "##", HTName "##", HTName "#", HTName "##",
   HTName "##", HTEos])
];
=TEX
\subsection{Case 7}
=SML
val lex_7 = lex terms1 cl1;
=TEX
=SML
store_mt_results_show (mt_runf (list_eq ht_eq))
[
 ("Lex.7.1", lex_7, ⌜$=⌝, [HTName "=", HTEos]),
 ("Lex.7.2", lex_7, ⌜$(* An intervening comment *)=⌝, [HTName "=", HTEos]),
 ("Lex.7.3", lex_7, ⌜$"="⌝, [HTName "=", HTEos]),
 ("Lex.7.4", lex_7, ⌜$`=`⌝, [HTName "=", HTEos]),
 ("Lex.7.5", lex_7, ⌜$"∃_1"⌝, [HTName "∃_1", HTEos]),
 ("Lex.7.6", lex_7, ⌜$" a name with spaces "⌝, [HTName " a name with spaces ", HTEos])
];
=TEX
\subsection{Case 8}
=SML
val lex_8 = lex_7;
=TEX
{\ShowScripts
=SMLPLAIN SML
store_mt_results_show (mt_runf (list_eq ht_eq))
[
 ("Lex.8.1", lex_8, ⌜_⌝, [HTName "_", HTEos]),
 ("Lex.8.2", lex_8, ⌜ ⋎⋏_⌝, [HTName "⋎⋏_", HTEos]),
 ("Lex.8.3", lex_8, ⌜$"_abc_"⌝, [HTName "_abc_", HTEos])
];
=TEX
}
\subsection{Case 9}
=SML
val lex_9 = lex_8;
val ty_9 = mk_ctype("lex_9", []);
=TEX
Only the first two errors identified in \cite{DS/FMU/IED/DTD015} are
reachable

=IGN
Format of anti quotations changed.
 ("Lex.9.1", lex_9, ⌜$^:ty_9⌝, gen_fail_msg "lexical analyser" 15001 []),

=SML
store_mt_results_show mt_run_fail
[
 ("Lex.9.2", lex_9, ⌜^:ty_9 $⌝, gen_fail_msg "lexical analyser" 15002 [])
];
=TEX
\subsection{Case 10}
=SML
val lex_10 = lex terms1 cl1 o (fn s => [Lex.Text s]);
=TEX
=SML
store_mt_results_show (mt_runf (list_eq ht_eq))
[("Lex.10.1", lex_10, "0", [HTNumLit "0", HTEos]),
("Lex.10.2", lex_10, "10", [HTNumLit "10", HTEos]),
("Lex.10.3", lex_10, "1.0123456789", [HTNumLit "1.0123456789", HTEos]),
("Lex.10.4", lex_10, "1.0123456789e99", [HTNumLit "1.0123456789e99", HTEos]),
("Lex.10.5", lex_10, "1.0123456789E99", [HTNumLit "1.0123456789E99", HTEos]),
("Lex.10.6", lex_10, "1.0123456789E99_c", [HTNumLit "1.0123456789E99", HTName "_c", HTEos]),
("Lex.10.7", lex_10, "1.0123456789E99⋎c", [HTNumLit "1.0123456789E99", HTName "⋎c", HTEos]),
("Lex.10.8", lex_10, "1.0123456789E99c", [HTNumLit "1.0123456789E99", HTName "c", HTEos]),
("Lex.10.9", lex_10, "1Tuple", [HTName "1Tuple", HTEos])
];
=TEX

\section{SUMMARY OF RESULTS}

=SML
diag_string(summarize_mt_results());
=TEX

\end{document}


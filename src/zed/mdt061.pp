=IGN
********************************************************************************
mdt061.doc: this file is part of the PPZed system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  mdt061.doc  ℤ $Date: 2011/07/11 11:44:45 $ $Revision: 1.22 $ $RCSfile: mdt061.doc,v $
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

\def\Title{Module Tests for Z Parser}

\def\AbstractText{This document comprises test cases and test code/data for testing the Z parser described in the document DS/FMU/IED/DTD061.}

\def\Reference{DS/FMU/IED/MDT061}

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
%% LaTeX2e port: \TPPtitle{Module Tests for Z Parser}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/MDT061}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.22 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2011/07/11 11:44:45 $
%% LaTeX2e port: }}  %% Mandatory field (with sensible default)
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{R.D.~Arthan & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{
%% LaTeX2e port: This document comprises test cases and test code/data for
%% LaTeX2e port: testing the Z parser described in the document
%% LaTeX2e port: DS/FMU/IED/DTD061.}
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
\item[Issue 1.1 (1992/07/15)-1.4 (1992/07/29)]
First drafts
\item[Issue 1.5 (1992/10/28)]
Checks for various fixes added.
\item[Issue 1.6 (1992/12/01)]
No longer sensitive to extended/standard distinction.
\item[Issue 1.7 (1992/12/02)]
Parser interface changes.
\item[Issue 1.8 (1999/02/24)]
Update for SML97.
\item[Issue 1.9 (1999/03/09)]
Update for new INTEGER type.
\item[Issue 1.10 (2002/01/23)]
Support for left associative operators.
\item[Issue 1.11 (2002/10/16)] Fixed {\LaTeX} errors.
\item[Issue 1.12 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.13 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.14 (2002/11/10)] Fixed test case broken by fixing a {\LaTeX} problem.
\item[Issue 1.15 (2005/08/01)] Added tests for new syntax in fixity paragraphs.
\item[Issue 1.16 (2005/08/03)] Schema projection is now left-associative.
\item[Issue 1.17 (2005/09/09)] Allowed for simpler representation of templates as strings.
\item[Issue 1.18 (2005/09/13)] Added tests for new subscripted forms for schema operators.
\item[Issue 1.19 (2007/08/04)] Added tests for dollar-quoted identifer.
\item[Issue 1.20 (2008/02/10)] Allowed for changes to lexical rules for underscores.
\item[Issue 1.21 (2011/07/10)] λ-expressions with no bullet now give a syntax error.
\item[Issue 1.22 (2011/07/11)] Added tests for empty schemas, including paragraphs.
\item[Issue 1.23 (2011/08/04)] Allowed for fix to bug with decorations in forming characteristic tuples.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported PPZed to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
% \subsection{Changes Forecast}
\pagebreak
\section{GENERAL}
\subsection{Scope}

This document comprises test cases and test code/data for
testing the parser as specified in \cite{DS/FMU/IED/DTD061}.

\subsection{Introduction}

\subsubsection{Background and Purpose}
This document is intended to supply module tests for the Z parser
as defined in \cite{DS/FMU/IED/DTD061} and implemented
in \cite{DS/FMU/IED/IMP061}. The tests are intended to meet
the requirements for tests identified in the quality plan
\cite{DS/FMU/IED/PLN008}.

\subsubsection{Dependencies}

These tests depend on
the test harness as implemented in DS/FMU/IED/IMP013, and
its corresponding detailed design document, DS/FMU/IED/DTD013.

\subsubsection{Possible Enhancements}

None known.

\subsubsection{Deficiencies}

\section{TEST CASES}
\begin{description}
\item[ZParser.1] In this group of tests an instance of each alternative in the
grammar of \cite{DS/FMU/IED/DEF007}
is parsed and the form of the result is checked.
If an alternative contains an optional construct, then a form with and a form
without that construct are checked. Similarly an iterated construct is
checked with 0, 1 and 2 occurrences.
\item[ZParser.2] This group of tests checks that the disambiguation rules
given in sections 4.12, 4.14 and 4.15 of \cite{DS/FMU/IED/DEF007}
are implemented correctly.
It is further subdivided as follows:
\begin{description}
\item[ZParser.2.1] This subgroup tests the relative precedences and
association rules for the schema and logical connectives.
\item[ZParser.2.2] This subgroup tests the relative precedences and
association rules of fancy-fix operators.
\item[ZParser.2.3] This subgroup tests the remaining rules about
expressions.
\item[ZParser.3] This group tests the paragraph processing.
\item[ZParser.4] This group of tests exhibits the reachable error
messages.
\end{description}
Note that some of the rules just say that in such and such a production
such and such a constituent must have some property, the tests
against these rules are in group $ZParser.4$.
\end{description}
\section{PREAMBLE}
=SML
use_file "dtd013.sml";
use_file "imp013.sml";
open_theory "hol" handle (Fail _) => open_theory "misc";
new_theory"test_mdt061";
init_mt_results();
open ZParser ZUserInterfaceSupport ZLex;
=TEX
The following code is a modification of
what appears in the parser interface, see \cite{DS/FMU/IED/IMP022}, and
causes HOL term quotations to evaluate to the corresponding stream
of lexical tokens. N.B. we use the HOL quotation form, not the Z form
so that the tests may be run independently of the Z paragraph processor of
\cite{DS/FMU/IED/DTD064}.
=SML
fun HOL_term_recogniser (_, _, x, _) = ZLex.z_lex  x;
=TEX
The following code sets up some useful values and utilities:
=SML
=TEX
=SML
fun list_eq (eq:'a * 'a -> bool) ((a :: x), (b :: y)) : bool = (
	eq(a,b) andalso list_eq eq (x, y)
) | list_eq eq ([], []) = true
| list_eq _ _ = false;
=TEX
=SML
fun para_eq (p1 : Z_PARA, p2 : Z_PARA) : bool = (
	format_z_para p1 = format_z_para p2
);
=TEX
=SML
fun tm_eq (p1 : Z_TM, p2 : Z_TM) : bool = (
	format_z_tm p1 = format_z_tm p2
);
=TEX
=SML
fun id_of_string s = (template_of_string s, "") : IDENT;
fun z_tm_of_string s = ZTmLVar(id_of_string s, Nil, []);
val a = z_tm_of_string "a";
val b = z_tm_of_string "b";
val c = z_tm_of_string "c";
val p = z_tm_of_string "p";
val P = z_tm_of_string "P";
val Q = z_tm_of_string "Q";
val X = z_tm_of_string "X";
val Y = z_tm_of_string "Y";
fun para_of_string s = ZParaTerm([], z_tm_of_string s, Nil);
val zeq = (template_of_string "_ = _", "") : IDENT;
val zmem = (template_of_string "_ ∈ _", "") : IDENT;
val zneq = (template_of_string "_ ≠ _", "") : IDENT;
val znmem = (template_of_string "_ ∉ _", "") : IDENT;
val zplus = (template_of_string "_ + _", "") : IDENT;
val zif = (template_of_string "if _ then _ else _", "") : IDENT;
val zfun = (template_of_string "_ → _", "") : IDENT;
val zpfun = (template_of_string "_ ⇸ _", "") : IDENT;
val zbag = (template_of_string "⟦ ... ⟧", "") : IDENT;
fun pair (a, b) = ZTmTuple[a, b];
fun triple (a, b, c) = ZTmTuple[a, b, c];
=TEX
=SML
new_error_message{id= ~61001,
	text="unexpected result from Z Parser detected in module tests"};
fun tp x = (
	case z_parser {is_quot = true} x of
		ZParaTerm(_, tm, _) => tm
	|	_	=> fail "mdt061" ~61001 []
);
=TEX
$sp$ parses something as a schema by wrapping it in square brackets
then stripping the square brackets off.
=SML
fun sp x = (
	case z_parser {is_quot = true}
		(ZTLsqbrack :: (rev(tl(rev x))) @ [ZTRsqbrack, ZTEos]) of
		ZParaTerm(_, ZTmHorizSchema([ZDSchemaDec (s, Nil)], Nil, Nil), _) => s
	|	_	=> fail "mdt061" ~61001 []
);

val _ = set_zfixity_info (ZClRel, map template_of_string [ "_ = _", "_ ∈ _"]);
val _ = set_zfixity_info (ZClRel, map template_of_string [ "_ ∉ _", "_ ≠ _"]);
val _ = set_zfixity_info (ZClFun (1, RightAssoc), map template_of_string [ "if _ then _ else _ "]);
val _ = set_zfixity_info (ZClFun (2, RightAssoc), map template_of_string [ "_ + _"]);
val _ = set_zfixity_info (ZClFun (1, RightAssoc), map template_of_string [ "_ ⦂ _"]);
val _ = set_zfixity_info (ZClFun (1, RightAssoc), map template_of_string [ "Π _"]);
val _ = set_zfixity_info (ZClFun (0, RightAssoc), map template_of_string [ "⟦ ... ⟧"]);
val _ = set_zfixity_info (ZClFun (2, LeftAssoc), map template_of_string [ "_ - _"]);
val _ = set_zfixity_info (ZClFun (0, LeftAssoc), map template_of_string [ "_ -- _"]);
val _ = set_zfixity_info (ZClGen (1, RightAssoc), map template_of_string [ "_ → _"]);
val _ = set_zfixity_info (ZClGen (2, RightAssoc), map template_of_string [ "_ ⇸ _"]);
val _ = set_zfixity_info (ZClGen (2, LeftAssoc), map template_of_string [ "_ @ _"]);
val _ = set_zfixity_info (ZClGen (0, LeftAssoc), map template_of_string [ "_ @@ _"]);
=TEX
\section{THE TESTS}
\subsection{Group 1}
The first block of tests in group 1 checks out the alternatives
for predicate:
=SML
store_mt_results_show (mt_runf tm_eq)
[
	("ZParser.1.1.1", tp, ⌜a ; b⌝, ZTmLogInOp⋎F(ZLogInOpSemi, a , b)),
	("ZParser.1.1.2", tp, ⌜∀x:Y|Q x⦁P x ; b⌝,
			ZTmLogInOp⋎F(ZLogInOpSemi, tp ⌜∀x:Y|Q x⦁P x⌝ , b)),
	("ZParser.1.1.3", tp, ⌜∀a⦁b⌝,
			ZTmQuant⋎F(ZQuant∀ false, ([ZDSchemaDec (a, Nil)], Nil, Nil), b)),
	("ZParser.1.1.4", tp, ⌜∃a⦁b⌝,
			ZTmQuant⋎F(ZQuant∃ false, ([ZDSchemaDec (a, Nil)], Nil, Nil), b)),
	("ZParser.1.1.5", tp, ⌜∃⋎1a⦁b⌝,
			ZTmQuant⋎F(ZQuant∃⋎1 false, ([ZDSchemaDec (a, Nil)], Nil, Nil), b)),
	("ZParser.1.1.6", tp, ⌜a ∧ b⌝, ZTmLogInOp⋎F(ZLogInOp∧ false, a , b)),
	("ZParser.1.1.7", tp, ⌜a ∨ b⌝, ZTmLogInOp⋎F(ZLogInOp∨ false, a , b)),
	("ZParser.1.1.8", tp, ⌜a ⇒ b⌝, ZTmLogInOp⋎F(ZLogInOp⇒ false, a , b)),
	("ZParser.1.1.9", tp, ⌜a ⇔ b⌝, ZTmLogInOp⋎F(ZLogInOp⇔ false, a , b)),
	("ZParser.1.1.10", tp, ⌜¬ b⌝, ZTm¬⋎F b)
,
	("ZParser.1.1.11", tp, ⌜a ∈ b⌝, ZTmFancyApp(zmem, pair (a,b)))
,
	("ZParser.1.1.12", tp, ⌜a ∈ b = c⌝,
		ZTmFancyApp(zmem, pair (a,ZTmFancyApp(zeq, pair (b,c))))),
	("ZParser.1.1.13", tp, ⌜a ∈ b ≠ c⌝,
		ZTmFancyApp(zmem, pair (a,ZTmFancyApp(zneq, pair (b,c))))),
	("ZParser.1.1.14", tp, ⌜(a ∈ b)⌝, ZTmBracketed(ZTmFancyApp(zmem, pair (a,b))))
];
=TEX
The second block of tests in group 1 checks out the alternatives
for schema:
=SML
store_mt_results_show (mt_runf tm_eq)
[
	("ZParser.1.2.1", sp, ⌜∀a⦁b⌝,
			ZTmQuant⋎S(ZQuant∀ false, ([ZDSchemaDec (a, Nil)], Nil, Nil), b)),
	("ZParser.1.2.2", sp, ⌜∃a⦁b⌝,
			ZTmQuant⋎S(ZQuant∃ false, ([ZDSchemaDec (a, Nil)], Nil, Nil), b)),
	("ZParser.1.2.3", sp, ⌜∃⋎1a⦁b⌝,
			ZTmQuant⋎S(ZQuant∃⋎1 false, ([ZDSchemaDec (a, Nil)], Nil, Nil), b)),
	("ZParser.1.2.4", sp, ⌜a ∧ b⌝, ZTmLogInOp⋎S(ZLogInOp∧ false, a , b)),
	("ZParser.1.2.5", sp, ⌜a ∨ b⌝, ZTmLogInOp⋎S(ZLogInOp∨ false, a , b)),
	("ZParser.1.2.6", sp, ⌜a ⇒ b⌝, ZTmLogInOp⋎S(ZLogInOp⇒ false, a , b)),
	("ZParser.1.2.7", sp, ⌜a ⇔ b⌝, ZTmLogInOp⋎S(ZLogInOp⇔ false, a , b)),
	("ZParser.1.2.8", sp, ⌜a ↾⋎s b⌝, ZTm↾(a , b)),
	("ZParser.1.2.9", sp, ⌜a ⨾⋎s b⌝, ZTm⨾(a , b)),
	("ZParser.1.2.10", sp, ⌜¬ a⌝, ZTm¬⋎S a),
	("ZParser.1.2.11", sp, ⌜pre a⌝, ZTmPre a),
	("ZParser.1.2.12", sp, ⌜Δa⌝, ZTmΔ a),
	("ZParser.1.2.13", sp, ⌜Ξa⌝, ZTmΞ a),
	("ZParser.1.2.14", sp, ⌜(a)'?!⌝, ZTmDecor(ZTmBracketed a, "'?!", Nil)),
	("ZParser.1.2.15", sp, ⌜a[b/c]⌝,
			ZTmRename(a, [(id_of_string "b",id_of_string "c")])),
	("ZParser.1.2.16", sp, ⌜[b|c]⌝,
		ZTmHorizSchema([ZDSchemaDec(b, Nil)], Value c, Nil)),
	("ZParser.1.2.17", sp, ⌜a\⋎s(b)⌝,
		ZTmHide(a, [id_of_string "b"]))
];
=TEX
The third block of tests in group 1 checks out the four
forms of schema text:
=SML
store_mt_results_show (mt_runf tm_eq)
[
	("ZParser.1.3.1", sp, ⌜[b|c]⌝,
		ZTmHorizSchema([ZDSchemaDec(b, Nil)], Value c, Nil)),
	("ZParser.1.3.2", sp, ⌜[b]⌝,
		ZTmHorizSchema([ZDSchemaDec(b, Nil)], Nil, Nil)),
	("ZParser.1.3.3", sp, ⌜[|c]⌝,
		ZTmHorizSchema([], Value c, Nil)),
	("ZParser.1.3.4", sp, ⌜[]⌝,
		ZTmHorizSchema([], Nil, Nil))
];
=TEX
The fourth block of tests in group 1 checks out the various
forms of expression:
=SML
store_mt_results_show (mt_runf tm_eq)
[
	("ZParser.1.4.1", tp, ⌜(μa)⌝,
		ZTmμ1([ZDSchemaDec(a, Nil)], Nil, Nil)),
	("ZParser.1.4.2", tp, ⌜(μa|b)⌝,
		ZTmμ1([ZDSchemaDec(a, Nil)], Value b, Nil)),
	("ZParser.1.4.3", tp, ⌜μa|b⦁c⌝,
		ZTmμ2(([ZDSchemaDec(a, Nil)], Value b, Nil), c)),
	("ZParser.1.4.4", tp, ⌜μa⦁c⌝,
		ZTmμ2(([ZDSchemaDec(a, Nil)], Nil, Nil), c)),
	("ZParser.1.4.5", tp, ⌜λa|b⦁c⌝,
		ZTmλ(([ZDSchemaDec(a, Nil)], Value b, Nil), c)),
	("ZParser.1.4.6", tp, ⌜λa⦁c⌝,
		ZTmλ(([ZDSchemaDec(a, Nil)], Nil, Nil), c)),
	("ZParser.1.4.7", tp, ⌜a + b⌝,
		ZTmFancyApp(zplus, pair (a,b))),
	("ZParser.1.4.8", tp, ⌜if a then b else c⌝,
		ZTmFancyApp(zif, triple (a,b,c))),
	("ZParser.1.4.9", tp, ⌜⟦ ⟧⌝,
		ZTmFancyApp(zbag, ZTmTuple[ZTm⟨⟩(Nil, [])])),
	("ZParser.1.4.10", tp, ⌜⟦a⟧⌝,
		ZTmFancyApp(zbag, ZTmTuple[ZTm⟨⟩(Nil, [a])])),
	("ZParser.1.4.11", tp, ⌜⟦a,b,c⟧⌝,
		ZTmFancyApp(zbag, ZTmTuple[ZTm⟨⟩(Nil, [a,b,c])])),
	("ZParser.1.4.12", tp, ⌜a × b⌝, ZTm×[a,b]),
	("ZParser.1.4.13", tp, ⌜a × b × c⌝, ZTm×[a,b,c]),
	("ZParser.1.4.14", tp, ⌜ℙ a⌝, ZTmℙ a),
	("ZParser.1.4.15", tp, ⌜a[b]⌝, ZTmLVar(id_of_string "a", Nil, [b])),
	("ZParser.1.4.16", tp, ⌜a[b,c]⌝, ZTmLVar(id_of_string "a", Nil, [b,c])),
	("ZParser.1.4.17.1", tp, ⌜1001⌝, (ZTmℤ o integer_of_int) 1001),
	("ZParser.1.4.17.2", tp, ⌜100110011001100110011001⌝, (ZTmℤ o @@) "100110011001100110011001"),
	("ZParser.1.4.18", tp, [ZTAqTm mk_t, ZTEos], ZTmQuotation (mk_t, Nil)),
	("ZParser.1.4.19", tp, ⌜(a)⌝, ZTmBracketed a),
	("ZParser.1.4.20", tp, ⌜(a,b)⌝, pair (a,b)),
	("ZParser.1.4.21", tp, ⌜(a,b,c)⌝, triple (a,b,c)),
	("ZParser.1.4.22", tp, ⌜[a|b]⌝,
		ZTmHorizSchema([ZDSchemaDec(a, Nil)], Value b, Nil)),
	("ZParser.1.4.23", tp, ⌜(a≜1, b≜2)⌝,
		ZTmBinding[(id_of_string "a",(ZTmℤ o integer_of_int) 1), (id_of_string "b",(ZTmℤ o integer_of_int) 2)]),
	("ZParser.1.4.24", tp, ⌜{}⌝, ZTmSetd(Nil, [])),
	("ZParser.1.4.25", tp, ⌜{a}⌝, ZTmSetd(Nil, [a])),
	("ZParser.1.4.26", tp, ⌜{a,b,c}⌝, ZTmSetd(Nil, [a,b,c])),
	("ZParser.1.4.27", tp, ⌜{a|b}⌝,
		ZTmSeta1([ZDSchemaDec(a, Nil)], Value b, Nil)),
	("ZParser.1.4.28", tp, ⌜{a; b}⌝,
		ZTmSeta1([ZDSchemaDec(a, Nil), ZDSchemaDec(b, Nil)], Nil, Nil)),
	("ZParser.1.4.29", tp, ⌜{a⦁b}⌝,
		ZTmSeta2(([ZDSchemaDec(a, Nil)], Nil, Nil), b)),
	("ZParser.1.4.30", tp, ⌜{a|b⦁c}⌝,
		ZTmSeta2(([ZDSchemaDec(a, Nil)], Value b, Nil), c)),
	("ZParser.1.4.31", tp, ⌜a.b⌝, ZTmSel⋎B(a, id_of_string "b")),
	("ZParser.1.4.32", tp, ⌜a.2⌝, ZTmSel⋎T(a, 2)),
	("ZParser.1.4.33", tp, ⌜$"x\\\" y"⌝, ZTmLVar(id_of_string (mk_dollar_quoted_string"x\\\" y"), Nil, []))
];
=TEX
The fifth block of tests in group 1 checks out the (non-standard) schema operators with subscripts:
=SML
store_mt_results_show (mt_runf tm_eq)
[
	("ZParser.1.5.1", sp, ⌜∀⋎s a⦁b⌝,
			ZTmQuant⋎S(ZQuant∀ true, ([ZDSchemaDec (a, Nil)], Nil, Nil), b)),
	("ZParser.1.5.2", sp, ⌜∃⋎s a⦁b⌝,
			ZTmQuant⋎S(ZQuant∃ true, ([ZDSchemaDec (a, Nil)], Nil, Nil), b)),
	("ZParser.1.5.3", sp, ⌜∃⋎1⋎s a⦁b⌝,
			ZTmQuant⋎S(ZQuant∃⋎1 true, ([ZDSchemaDec (a, Nil)], Nil, Nil), b)),
	("ZParser.1.5.4", sp, ⌜a ∧⋎s b⌝, ZTmLogInOp⋎S(ZLogInOp∧ true, a , b)),
	("ZParser.1.5.5", sp, ⌜a ∨⋎s b⌝, ZTmLogInOp⋎S(ZLogInOp∨ true, a , b)),
	("ZParser.1.5.6", sp, ⌜a ⇒⋎s b⌝, ZTmLogInOp⋎S(ZLogInOp⇒ true, a , b)),
	("ZParser.1.5.7", sp, ⌜a ⇔⋎s b⌝, ZTmLogInOp⋎S(ZLogInOp⇔ true, a , b))];
=TEX
\subsection{Group 2}
This group of tests checks that the disambiguation rules
given in sections 4.12, 4.14 and 4.15 of \cite{DS/FMU/IED/DEF007}
are implemented correctly.
\subsubsection{Subgroup 1}
This subgroup tests the relative precedences and
association rules for the schema and logical connectives.
=SML
fun gp2_chk1 (ZTmLogInOp⋎S(op1, a1, b1), ZTmLogInOp⋎S(op2, a2, b2)) : bool = (
	op1 = op2 andalso gp2_chk1(a1, a2) andalso gp2_chk1(b1, b2)
) | gp2_chk1 (ZTm↾(a1, b1), ZTm↾(a2, b2)) : bool = (
	gp2_chk1(a1, a2) andalso gp2_chk1(b1, b2)
) | gp2_chk1 (ZTm⨾(a1, b1), ZTm⨾(a2, b2)) : bool = (
	gp2_chk1(a1, a2) andalso gp2_chk1(b1, b2)
) | gp2_chk1 (t1, ZTmBracketed t2) = (gp2_chk1 (t1, t2)
) | gp2_chk1 (ZTmBracketed t1, t2) = (gp2_chk1 (t1, t2)
) | gp2_chk1 (t1, t2) = tm_eq (t1, t2);
=TEX
$gp2\_p$ parser something as a schema using ⦂ and then stripping off
the cast.
=SML
fun gp2_p x = (
	case z_parser {is_quot = true}
		(hd ⌜(⌝ :: rev(tl(rev x)) @ ⌜) ⦂ X⌝) of
		ZParaTerm ([],
			ZTmFancyApp((TmplIn (StubUS, ("⦂", Nil), StubUS), ""),
				ZTmTuple[t, _]), Nil)
					=> t
	|	other => fail "mdt061" 0 []
);
=TEX
The first block tests schema conjunction with all others:
=SML
store_mt_results_show (mt_runf gp2_chk1)
[
	("ZParser.2.1.1.1", gp2_p, ⌜a ∧ b ∨ c⌝, gp2_p ⌜(a ∧ b) ∨ c⌝ ),
	("ZParser.2.1.1.2", gp2_p, ⌜a ∧ b ⇒ c⌝, gp2_p ⌜(a ∧ b) ⇒ c⌝ ),
	("ZParser.2.1.1.3", gp2_p, ⌜a ∧ b ⇔ c⌝, gp2_p ⌜(a ∧ b) ⇔ c⌝ ),
	("ZParser.2.1.1.4", gp2_p, ⌜a ∧ b ⨾⋎s c⌝, gp2_p ⌜(a ∧ b) ⨾⋎s c⌝ ),
	("ZParser.2.1.1.5", gp2_p, ⌜a ∧ b ↾⋎s c⌝, gp2_p ⌜(a ∧ b) ↾⋎s c⌝ ),
	("ZParser.2.1.1.6", gp2_p, ⌜b ∨ c ∧ a⌝, gp2_p ⌜b ∨ (c ∧ a)⌝ ),
	("ZParser.2.1.1.7", gp2_p, ⌜b ⇒ c ∧ a⌝, gp2_p ⌜b ⇒ (c ∧ a)⌝ ),
	("ZParser.2.1.1.8", gp2_p, ⌜b ⇔ c ∧ a⌝, gp2_p ⌜b ⇔ (c ∧ a)⌝ ),
	("ZParser.2.1.1.9", gp2_p, ⌜b ⨾⋎s c ∧ a⌝, gp2_p ⌜b ⨾⋎s (c ∧ a)⌝ ),
	("ZParser.2.1.1.10", gp2_p, ⌜b ↾⋎s c ∧ a⌝, gp2_p ⌜b ↾⋎s (c ∧ a)⌝ )
];
=TEX
The second block tests schema disjunction with all others of lower precedence:
=SML
store_mt_results_show (mt_runf gp2_chk1)
[
	("ZParser.2.1.2.1", gp2_p, ⌜a ∨ b ⇒ c⌝, gp2_p ⌜(a ∨ b) ⇒ c⌝ ),
	("ZParser.2.1.2.2", gp2_p, ⌜a ∨ b ⇔ c⌝, gp2_p ⌜(a ∨ b) ⇔ c⌝ ),
	("ZParser.2.1.2.3", gp2_p, ⌜a ∨ b ⨾⋎s c⌝, gp2_p ⌜(a ∨ b) ⨾⋎s c⌝ ),
	("ZParser.2.1.2.4", gp2_p, ⌜a ∨ b ↾⋎s c⌝, gp2_p ⌜(a ∨ b) ↾⋎s c⌝ ),
	("ZParser.2.1.2.5", gp2_p, ⌜b ⇒ c ∨ a⌝, gp2_p ⌜b ⇒ (c ∨ a)⌝ ),
	("ZParser.2.1.2.6", gp2_p, ⌜b ⇔ c ∨ a⌝, gp2_p ⌜b ⇔ (c ∨ a)⌝ ),
	("ZParser.2.1.2.7", gp2_p, ⌜b ⨾⋎s c ∨ a⌝, gp2_p ⌜b ⨾⋎s (c ∨ a)⌝ ),
	("ZParser.2.1.2.8", gp2_p, ⌜b ↾⋎s c ∨ a⌝, gp2_p ⌜b ↾⋎s (c ∨ a)⌝ )
];
=TEX
The third block tests schema implication with all others of lower precedence:
=SML
store_mt_results_show (mt_runf gp2_chk1)
[
	("ZParser.2.1.3.1", gp2_p, ⌜a ⇒ b ⇔ c⌝, gp2_p ⌜(a ⇒ b) ⇔ c⌝ ),
	("ZParser.2.1.3.2", gp2_p, ⌜a ⇒ b ⨾⋎s c⌝, gp2_p ⌜(a ⇒ b) ⨾⋎s c⌝ ),
	("ZParser.2.1.3.3", gp2_p, ⌜a ⇒ b ↾⋎s c⌝, gp2_p ⌜(a ⇒ b) ↾⋎s c⌝ ),
	("ZParser.2.1.3.4", gp2_p, ⌜b ⇔ c ⇒ a⌝, gp2_p ⌜b ⇔ (c ⇒ a)⌝ ),
	("ZParser.2.1.3.5", gp2_p, ⌜b ⨾⋎s c ⇒ a⌝, gp2_p ⌜b ⨾⋎s (c ⇒ a)⌝ ),
	("ZParser.2.1.3.6", gp2_p, ⌜b ↾⋎s c ⇒ a⌝, gp2_p ⌜b ↾⋎s (c ⇒ a)⌝ )
];
=TEX
The fourth block tests schema bi-implication with the two others of lower precedence and the two non-logical schema operators:
=SML
store_mt_results_show (mt_runf gp2_chk1)
[
	("ZParser.2.1.4.1", gp2_p, ⌜a ⇔ b ⨾⋎s c⌝, gp2_p ⌜(a ⇔ b) ⨾⋎s c⌝ ),
	("ZParser.2.1.4.2", gp2_p, ⌜a ⇔ b ↾⋎s c⌝, gp2_p ⌜(a ⇔ b) ↾⋎s c⌝ ),
	("ZParser.2.1.4.3", gp2_p, ⌜b ⨾⋎s c ⇔ a⌝, gp2_p ⌜b ⨾⋎s (c ⇔ a)⌝ ),
	("ZParser.2.1.4.4", gp2_p, ⌜b ↾⋎s c ⇔ a⌝, gp2_p ⌜b ↾⋎s (c ⇔ a)⌝ ),
	("ZParser.2.1.4.5", gp2_p, ⌜a ⨾⋎s b ↾⋎s c⌝, gp2_p ⌜a ⨾⋎s (b ↾⋎s c)⌝ ),
	("ZParser.2.1.4.6", gp2_p, ⌜b ↾⋎s c ⨾⋎s a⌝, gp2_p ⌜(b ↾⋎s c) ⨾⋎s a⌝ )
];
=TEX
The fifth block tests the left/right association rules for schema operators:
=SML
store_mt_results_show (mt_runf gp2_chk1)
[
	("ZParser.2.1.5.1", gp2_p, ⌜a ∧ b ∧ c⌝, gp2_p ⌜a ∧ (b ∧ c)⌝ ),
	("ZParser.2.1.5.2", gp2_p, ⌜a ∨ b ∨ c⌝, gp2_p ⌜a ∨ (b ∨ c)⌝ ),
	("ZParser.2.1.5.3", gp2_p, ⌜a ⇒ b ⇒ c⌝, gp2_p ⌜a ⇒ (b ⇒ c)⌝ ),
	("ZParser.2.1.5.4", gp2_p, ⌜a ⇔ b ⇔ c⌝, gp2_p ⌜a ⇔ (b ⇔ c)⌝ ),
	("ZParser.2.1.5.5", gp2_p, ⌜a ↾⋎s b ↾⋎s c⌝, gp2_p ⌜(a ↾⋎s b) ↾⋎s c⌝ ),
	("ZParser.2.1.5.6", gp2_p, ⌜a ⨾⋎s b ⨾⋎s c⌝, gp2_p ⌜a ⨾⋎s (b ⨾⋎s c)⌝ )
];
=SML
fun gp2_chk2 (ZTmLogInOp⋎F(op1, a1, b1), ZTmLogInOp⋎F(op2, a2, b2)) : bool = (
	op1 = op2 andalso gp2_chk2(a1, a2) andalso gp2_chk2(b1, b2)
) | gp2_chk2 (t1, ZTmBracketed t2) = (gp2_chk2 (t1, t2)
) | gp2_chk2 (ZTmBracketed t1, t2) = (gp2_chk2 (t1, t2)
) | gp2_chk2 (t1, t2) = tm_eq (t1, t2);
=TEX
The sixth block tests logical conjunction with all others:
=SML
store_mt_results_show (mt_runf gp2_chk2)
[
	("ZParser.2.1.6.1", tp, ⌜a ∧ b ∨ c⌝, tp ⌜(a ∧ b) ∨ c⌝ ),
	("ZParser.2.1.6.2", tp, ⌜a ∧ b ⇒ c⌝, tp ⌜(a ∧ b) ⇒ c⌝ ),
	("ZParser.2.1.6.3", tp, ⌜a ∧ b ⇔ c⌝, tp ⌜(a ∧ b) ⇔ c⌝ ),
	("ZParser.2.1.6.6", tp, ⌜b ∨ c ∧ a⌝, tp ⌜b ∨ (c ∧ a)⌝ ),
	("ZParser.2.1.6.7", tp, ⌜b ⇒ c ∧ a⌝, tp ⌜b ⇒ (c ∧ a)⌝ ),
	("ZParser.2.1.6.8", tp, ⌜b ⇔ c ∧ a⌝, tp ⌜b ⇔ (c ∧ a)⌝ )
];
=TEX
The seventh block tests logical disjunction with the othesr of lower precedence:
=SML
store_mt_results_show (mt_runf gp2_chk2)
[
	("ZParser.2.1.7.1", tp, ⌜a ∨ b ⇒ c⌝, tp ⌜(a ∨ b) ⇒ c⌝ ),
	("ZParser.2.1.7.2", tp, ⌜a ∨ b ⇔ c⌝, tp ⌜(a ∨ b) ⇔ c⌝ ),
	("ZParser.2.1.7.3", tp, ⌜b ⇒ c ∨ a⌝, tp ⌜b ⇒ (c ∨ a)⌝ ),
	("ZParser.2.1.7.4", tp, ⌜b ⇔ c ∨ a⌝, tp ⌜b ⇔ (c ∨ a)⌝ )
];
=TEX
The eighth block tests logical implication and bi-implication:
=SML
store_mt_results_show (mt_runf gp2_chk2)
[
	("ZParser.2.1.8.1", tp, ⌜a ⇒ b ⇔ c⌝, tp ⌜(a ⇒ b) ⇔ c⌝ ),
	("ZParser.2.1.8.2", tp, ⌜b ⇔ c ⇒ a⌝, tp ⌜b ⇔ (c ⇒ a)⌝ )
];
=TEX
The ninth block tests the left association rule for logical operators:
=SML
store_mt_results_show (mt_runf gp2_chk2)
[
	("ZParser.2.1.9.1", tp, ⌜a ∧ b ∧ c⌝, tp ⌜a ∧ (b ∧ c)⌝ ),
	("ZParser.2.1.9.2", tp, ⌜a ∨ b ∨ c⌝, tp ⌜a ∨ (b ∨ c)⌝ ),
	("ZParser.2.1.9.3", tp, ⌜a ⇒ b ⇒ c⌝, tp ⌜a ⇒ (b ⇒ c)⌝ ),
	("ZParser.2.1.9.4", tp, ⌜a ⇔ b ⇔ c⌝, tp ⌜a ⇔ (b ⇔ c)⌝ )
];
=TEX
The tenth block tests the unary schema operators against the
binary schema operators.
=SML
fun gp2_chk4 (ZTmLogInOp⋎S(op1, a1, b1), ZTmLogInOp⋎S(op2, a2, b2)) : bool = (
	op1 = op2 andalso gp2_chk4(a1, a2) andalso gp2_chk4(b1, b2)
) | gp2_chk4 (ZTm↾(a1, b1), ZTm↾(a2, b2)) : bool = (
	gp2_chk4(a1, a2) andalso gp2_chk4(b1, b2)
) | gp2_chk4 (ZTm⨾(a1, b1), ZTm⨾(a2, b2)) : bool = (
	gp2_chk4(a1, a2) andalso gp2_chk4(b1, b2)
) | gp2_chk4 (t1, ZTmBracketed t2) = (gp2_chk4 (t1, t2)
) | gp2_chk4 (ZTmBracketed t1, t2) = (gp2_chk4 (t1, t2)
) | gp2_chk4 (ZTm¬⋎S t1, ZTm¬⋎S t2) = (gp2_chk4 (t1, t2)
) | gp2_chk4 (ZTmΔ t1, ZTmΔ t2) = (gp2_chk4 (t1, t2)
) | gp2_chk4 (ZTmΞ t1, ZTmΞ t2) = (gp2_chk4 (t1, t2)
) | gp2_chk4 (ZTmPre t1, ZTmPre t2) = (gp2_chk4 (t1, t2)
) | gp2_chk4 (t1, t2) = tm_eq (t1, t2);
=SML
store_mt_results_show (mt_runf gp2_chk4)
[
	("ZParser.2.1.10.1", gp2_p, ⌜¬ b ∨ c⌝, gp2_p ⌜(¬ b) ∨ c⌝ ),
	("ZParser.2.1.10.2", gp2_p, ⌜¬ b ∨ c⌝, gp2_p ⌜(¬ b) ∨ c⌝ ),
	("ZParser.2.1.10.3", gp2_p, ⌜¬ b ⇒ c⌝, gp2_p ⌜(¬ b) ⇒ c⌝ ),
	("ZParser.2.1.10.4", gp2_p, ⌜¬ b ⇔ c⌝, gp2_p ⌜(¬ b) ⇔ c⌝ ),
	("ZParser.2.1.10.5", gp2_p, ⌜¬ b ⨾⋎s c⌝, gp2_p ⌜(¬ b) ⨾⋎s c⌝ ),
	("ZParser.2.1.10.6", gp2_p, ⌜¬ b ↾⋎s c⌝, gp2_p ⌜(¬ b) ↾⋎s c⌝ ),
	("ZParser.2.1.10.7", gp2_p, ⌜Δ b ∨ c⌝, gp2_p ⌜(Δ b) ∨ c⌝ ),
	("ZParser.2.1.10.8", gp2_p, ⌜Δ b ∨ c⌝, gp2_p ⌜(Δ b) ∨ c⌝ ),
	("ZParser.2.1.10.9", gp2_p, ⌜Δ b ⇒ c⌝, gp2_p ⌜(Δ b) ⇒ c⌝ ),
	("ZParser.2.1.10.10", gp2_p, ⌜Δ b ⇔ c⌝, gp2_p ⌜(Δ b) ⇔ c⌝ ),
	("ZParser.2.1.10.11", gp2_p, ⌜Δ b ⨾⋎s c⌝, gp2_p ⌜(Δ b) ⨾⋎s c⌝ ),
	("ZParser.2.1.10.12", gp2_p, ⌜Δ b ↾⋎s c⌝, gp2_p ⌜(Δ b) ↾⋎s c⌝ ),
	("ZParser.2.1.10.13", gp2_p, ⌜Ξ b ∨ c⌝, gp2_p ⌜(Ξ b) ∨ c⌝ ),
	("ZParser.2.1.10.14", gp2_p, ⌜Ξ b ∨ c⌝, gp2_p ⌜(Ξ b) ∨ c⌝ ),
	("ZParser.2.1.10.15", gp2_p, ⌜Ξ b ⇒ c⌝, gp2_p ⌜(Ξ b) ⇒ c⌝ ),
	("ZParser.2.1.10.16", gp2_p, ⌜Ξ b ⇔ c⌝, gp2_p ⌜(Ξ b) ⇔ c⌝ ),
	("ZParser.2.1.10.17", gp2_p, ⌜Ξ b ⨾⋎s c⌝, gp2_p ⌜(Ξ b) ⨾⋎s c⌝ ),
	("ZParser.2.1.10.18", gp2_p, ⌜Ξ b ↾⋎s c⌝, gp2_p ⌜(Ξ b) ↾⋎s c⌝ ),
	("ZParser.2.1.10.19", gp2_p, ⌜pre b ∨ c⌝, gp2_p ⌜(pre b) ∨ c⌝ ),
	("ZParser.2.1.10.20", gp2_p, ⌜pre b ∨ c⌝, gp2_p ⌜(pre b) ∨ c⌝ ),
	("ZParser.2.1.10.21", gp2_p, ⌜pre b ⇒ c⌝, gp2_p ⌜(pre b) ⇒ c⌝ ),
	("ZParser.2.1.10.22", gp2_p, ⌜pre b ⇔ c⌝, gp2_p ⌜(pre b) ⇔ c⌝ ),
	("ZParser.2.1.10.23", gp2_p, ⌜pre b ⨾⋎s c⌝, gp2_p ⌜(pre b) ⨾⋎s c⌝ ),
	("ZParser.2.1.10.24", gp2_p, ⌜pre b ↾⋎s c⌝, gp2_p ⌜(pre b) ↾⋎s c⌝ )
];
=TEX
\subsubsection{Subgroup 2}
This subgroup tests the relative precedences and
association rules of fancy-fix operators.
=SML
fun ⦏top_connective⦎ (ZTmFancyApp (id, _)) = id
|   top_connective _ = fail "mdt061" ~61001 [];
=TEX
=SML
fun assoc_left (ZTmFancyApp (_, ZTmTuple[ZTmFancyApp _, _])) = true
|   assoc_left _ = false;
=TEX
=SML
fun assoc_right (ZTmFancyApp (_, ZTmTuple[_, ZTmFancyApp _])) = true
|   assoc_right _ = false;
=TEX
=SML
store_mt_results_show mt_run
[
	("ZParser.2.2.1.1", top_connective o tp, ⌜if a then b else 1 + 2⌝, zif),
	("ZParser.2.2.1.2", top_connective o tp, ⌜a → b + c⌝, zfun),
	("ZParser.2.2.1.3", top_connective o tp, ⌜a → b ⇸ c⌝, zfun)
];
=TEX
=SML
store_mt_results_show mt_run
[
	("ZParser.2.2.2.1", assoc_left o tp, ⌜i1 + 2 + 3⌝, false),
	("ZParser.2.2.2.2", assoc_left o tp, ⌜a → b → c⌝, false),
	("ZParser.2.2.2.3", assoc_left o tp, ⌜a ⇸ b ⇸ c⌝, false)
];
=TEX
=SML
store_mt_results_show mt_run
[
	("ZParser.2.2.3.1", assoc_right o tp, ⌜i1 - 2 - 3⌝, false),
	("ZParser.2.2.3.2", assoc_right o tp, ⌜a @@ b @@ c⌝, false),
	("ZParser.2.2.3.3", assoc_right o tp, ⌜a @ b @ c⌝, false)
];
=TEX
=SML
store_mt_results_show mt_run
[
	("ZParser.2.2.4.1", assoc_left o tp, ⌜i1 -- 2 - 3⌝, false),
	("ZParser.2.2.4.2", assoc_left o tp, ⌜a @@ b @ c⌝, false),
	("ZParser.2.2.4.3", assoc_left o tp, ⌜a -- b + c⌝, false)
];
=TEX
\subsubsection{Subgroup 3}
This subgroup tests the remaining rules about
expressions.
=TEX
=SML
fun ⦏is_set_disp⦎ (ZTmSetd _) = true | is_set_disp _ = false;
=TEX
=SML
store_mt_results_show mt_run
[
	("ZParser.2.3.1.1", is_set_disp o tp, ⌜{X}⌝, true)
];
=TEX
=SML
fun ⦏is_var⦎ (ZTmLVar _) = true | is_var _ = false;
=TEX
=SML
store_mt_results_show mt_run
[
	("ZParser.2.3.2.1", is_var o tp, ⌜X[Y]⌝, true)
];
=TEX
=SML
fun ⦏is_pred_op⦎ (ZTmLogInOp⋎F _) = true
|   ⦏is_pred_op⦎ (ZTmQuant⋎F _) = true
|   ⦏is_pred_op⦎ (ZTm¬⋎F _) = true
| is_pred_op _ = false;
=TEX
=SML
store_mt_results_show mt_run
[
	("ZParser.2.3.3.1", is_pred_op o tp, ⌜X ∧ Y⌝, true),
	("ZParser.2.3.3.2", is_pred_op o tp, ⌜X ∨ Y⌝, true),
	("ZParser.2.3.3.3", is_pred_op o tp, ⌜X ⇒ Y⌝, true),
	("ZParser.2.3.3.4", is_pred_op o tp, ⌜X ⇔ Y⌝, true),
	("ZParser.2.3.3.5", is_pred_op o tp, ⌜¬ Y⌝, true),
	("ZParser.2.3.3.6", is_pred_op o tp, ⌜∀X|Y⦁Q⌝, true),
	("ZParser.2.3.3.7", is_pred_op o tp, ⌜∃X|Y⦁Q⌝, true),
	("ZParser.2.3.3.8", is_pred_op o tp, ⌜∃⋎1X|Y⦁Q⌝, true)
];
=TEX
=SML
store_mt_results_show mt_run
[
	("ZParser.2.3.4.1", is_pred_op o sp, ⌜X ∧ Y⌝, false),
	("ZParser.2.3.4.2", is_pred_op o sp, ⌜X ∨ Y⌝, false),
	("ZParser.2.3.4.3", is_pred_op o sp, ⌜X ⇒ Y⌝, false),
	("ZParser.2.3.4.4", is_pred_op o sp, ⌜X ⇔ Y⌝, false),
	("ZParser.2.3.4.5", is_pred_op o sp, ⌜¬ Y⌝, false),
	("ZParser.2.3.4.6", is_pred_op o sp, ⌜∀X|Y⦁Q⌝, false),
	("ZParser.2.3.4.7", is_pred_op o sp, ⌜∃X|Y⦁Q⌝, false),
	("ZParser.2.3.4.8", is_pred_op o sp, ⌜∃⋎1X|Y⦁Q⌝, false)
];
=TEX
=SML
fun chk_2_3_5 (ZTmFancyApp(_, ZTmTuple[ZTmBracketed p,_ ])) = is_pred_op p
|    chk_2_3_5 _ = fail "mdt061.2.3.5 test failed" 16000 [];

store_mt_results_show mt_run
[
	("ZParser.2.3.5.1", chk_2_3_5 o tp, ⌜(∀X|Y⦁Q) ⦂ Z⌝, false)
];
=TEX
\subsection{Group 3}
This group tests the paragraph processing.
The semantics of paragraph processing will be checked out in the
tests for the paragraph processor \cite{DS/FMU/IED/DTD049} so here
we just check that the parser classifies the paragraphs correctly.
=SML
fun pp x = (
	case z_parser {is_quot = false} x of
		ZParaFixity _ => "fixity"
	|	ZParaAbbDef _ => "abbdef"
	|	ZParaSchBox _ => "schbox"
	|	ZParaAxDes _ => "axdes"
	|	ZParaFreeType _ => "freetype"
	|	ZParaGivenSet _ => "givenset"
	|	ZParaConstraint _ => "constraint"
	|	ZParaConjecture _ => "conjecture"
	|	ZParaTerm _ => "term"
);
=TEX
=SML
fun ⦏d⦎ l = rev (tl (rev l));
=TEX
{
\def\PrPH{{\bf ⊢}}
=SML
store_mt_results_show mt_run
[
	("ZParser.3.1", pp, ⌜f a⌝, "constraint"),
	("ZParser.3.2", pp, ⌜[x]⌝, "givenset"),
	("ZParser.3.3", pp, ⌜[x, y, z]⌝, "givenset"),
	("ZParser.3.4", pp, ⌜[x, y, z] & a = b⌝, "givenset"),
	("ZParser.3.5", pp, ⌜x ::= f a | g b⌝, "freetype"),
	("ZParser.3.6", pp, ⌜x ::= f a | g b & y ::= h x⌝, "freetype"),
	("ZParser.3.7.1", pp, ZTAx :: ⌜x : X⌝, "axdes"),
	("ZParser.3.7.2", pp, ZTAx :: ⌜x : X ├ x = x⌝, "axdes"),
	("ZParser.3.7.3", pp, ZTAx :: ⌜ ├ x = x⌝, "axdes"),
	("ZParser.3.7.4", pp, ZTAx :: [], "axdes"),
	("ZParser.3.8.1", pp, ZTAx :: d ⌜[A,B]⌝ @ [ZTBar] @⌜x : X ⌝, "axdes"),
	("ZParser.3.8.2", pp, ZTAx :: d ⌜[A,B]⌝ @ [ZTBar] @⌜x : X ├ x = x⌝, "axdes"),
	("ZParser.3.8.3", pp, ZTAx :: d ⌜[A,B]⌝ @ [ZTBar] @⌜ ├ x = x⌝, "axdes"),
	("ZParser.3.8.4", pp, ZTAx :: d ⌜[A,B]⌝ @ [ZTBar], "axdes"),
	("ZParser.3.9.1", pp, ZTSch :: d ⌜X⌝ @ [ZTIs] @ ⌜x : X ⌝, "schbox"),
	("ZParser.3.9.2", pp, ZTSch :: d ⌜X⌝ @ [ZTIs] @ ⌜x : X ├ x = x⌝, "schbox"),
	("ZParser.3.9.3", pp, ZTSch :: d ⌜X⌝ @ [ZTIs] @ ⌜ ├ x = x⌝, "schbox"),
	("ZParser.3.9.4", pp, ZTSch :: d ⌜X⌝ @ [ZTIs], "schbox"),
	("ZParser.3.10.1", pp, ZTSch :: d ⌜X[A,B,C]⌝ @ [ZTIs] @ ⌜x : X ⌝, "schbox"),
	("ZParser.3.10.2", pp, ZTSch :: d ⌜X[A,B,C]⌝ @ [ZTIs] @ ⌜x : X ├ x = x⌝, "schbox"),
	("ZParser.3.10.3", pp, ZTSch :: d ⌜X[A,B,C]⌝ @ [ZTIs] @ ⌜ ├ x = x⌝, "schbox"),
	("ZParser.3.10.4", pp, ZTSch :: d ⌜X[A,B,C]⌝ @ [ZTIs], "schbox"),
	("ZParser.3.11", pp, ⌜x ≜ y⌝, "abbdef"),
	("ZParser.3.12", pp, ⌜fun _ = _⌝, "fixity"),
	("ZParser.3.13", pp, ⌜fun 99 _ = _, _ x⌝, "fixity"),
	("ZParser.3.14", pp, ⌜gen 99 _ = _, _ x⌝, "fixity"),
	( "ZParser.3.15", pp, ⌜rel _ = _, _ x⌝, "fixity"),
	( "ZParser.3.16", pp, ⌜relation _ = _, _ x⌝, "fixity"),
	( "ZParser.3.17", pp, ⌜rel (_ = _)⌝, "fixity"),
	( "ZParser.3.18", pp, ⌜function 12 (abc ... def), (_ xyz)⌝, "fixity"),
	( "ZParser.3.19", pp, ⌜generic (_ x)⌝, "fixity")
];
=TEX
}
\subsubsection{Group 4}
This group of tests exhibits the reachable error
messages.
=SML
diag_line"*** mdt061 here: expect 7 Z-Parser error reports after this message ***";
store_mt_results_show mt_run_fail
[
	("ZParser.4.1", pp, ⌜f(a⌝, gen_fail_msg "Z-Parser" 61000 []),
	("ZParser.4.2", pp, ⌜f)a⌝, gen_fail_msg "Z-Parser" 61000 []),
	("ZParser.4.3", pp, ⌜[]][⌝, gen_fail_msg "Z-Parser" 61000 []),
	("ZParser.4.4", pp, ⌜a - b + c⌝, gen_fail_msg "Z-Parser" 61000 []),
	("ZParser.4.5", pp, ⌜a + b - c ⌝, gen_fail_msg "Z-Parser" 61000 []),
	("ZParser.4.6", pp, ⌜fun _ $"x" _⌝, gen_fail_msg "Z-Parser" 61000 []),
	("ZParser.4.7", pp, ⌜(λx:X)⌝, gen_fail_msg "Z-Parser" 61000 [])
];
=TEX

=TEX
\section{SUMMARY OF RESULTS}

=SML
diag_string(summarize_mt_results());
=TEX

\end{document}

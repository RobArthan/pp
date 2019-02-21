=IGN
********************************************************************************
mdt064.doc: this file is part of the PPZed system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% mdt064.doc   ℤ 2008/09/05 14:23:03 1.27 mdt064.doc,v

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

\def\AbstractText{This document contains the module tests for the {\ProductZ}\ Pretty Printer.}

\def\Reference{DS/FMU/IED/MDT064}

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
%% LaTeX2e port: % mdt064.doc   ℤ 2008/09/05 14:23:03 1.27 mdt064.doc,v
%% LaTeX2e port: \documentstyle[hol1,11pt,TQ]{article}
%% LaTeX2e port: 
%% LaTeX2e port: \TPPtitle{Module Tests for Pretty Printer}
%% LaTeX2e port: \TPPref{DS/FMU/IED/MDT064}
%% LaTeX2e port: \def\SCCSissue{1.27%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSissue}
%% LaTeX2e port: \TPPdate{\FormatDate{2008/09/05 14:23:03%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPproject{FST PROJECT}
%% LaTeX2e port: 
%% LaTeX2e port: =IGN
%% LaTeX2e port: 
%% LaTeX2e port: Commands to process this document in various ways.
%% LaTeX2e port: 
%% LaTeX2e port: docsml mdt064
%% LaTeX2e port: use_file "mdt064.sml";
%% LaTeX2e port: 
%% LaTeX2e port: make -f rel001.mkf mdt064.dvi
%% LaTeX2e port: doctex mdt064
%% LaTeX2e port: texdvi mdt064
%% LaTeX2e port: bibtex mdt064
%% LaTeX2e port: doctex mdt064 ; texdvi mdt064
%% LaTeX2e port: doctex mdt064 ; texdvi mdt064 ; bibtex mdt064
%% LaTeX2e port: dvipage mdt064 &
%% LaTeX2e port: 
%% LaTeX2e port: docsml mdt064
%% LaTeX2e port: use_file "mdt064.sml";
%% LaTeX2e port: 
%% LaTeX2e port: =TEX
%% LaTeX2e port: %\TPPstatus{Approved}
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{R.D.~Arthan & WIN01}  %% Mandatory field
%% LaTeX2e port: \TPPauthorisation{R.B.~Jones & HAT Manager}
%% LaTeX2e port: \TPPabstract{This document contains the module tests for the \ProductZ\
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


\item[Issue 1.3 (1992/11/02), \FormatDate{92/11/02
} ]
	First draft.
\item[Issue 1.4 (1992/11/30), \FormatDate{92/11/30} ]
	Fixed bracketing of cartesian products.
\item[Issue 1.5 (1992/12/03), \FormatDate{92/12/03} ]
Improved treatment of declarations and generic predicates plus some fixes.
\item[Issue 1.6 (1992/12/09), \FormatDate{92/12/09} ]
Tests for bug fixes of version 1.20 of implementation.
\item[Issue 1. 7 (10th December 1992)]
Global rename from wrk038.doc issue 1.9.
\item[Issue 1.8 (1993/02/18) (18th February 1993)]
Regression test for fix of bug HAT 97.
\item[Issue 1.9 (1993/02/23) (23th February 1993)]
Modified parent of working theory.
\item[Issue 1.10 (1997/05/02) (1st May 1997)]
Module tests fix to bug HAT 64.
\item[Issue 1.11 (2000/06/30) (30th June 2000)]
Extra test for μ added.
\item[Issue 1.12 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.13 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.14 (2004/01/19)] The Z universal set is now called 𝕌.
\item[Issue 1.15 (2005/02/21)] Added test for fixed handling of relations like {\it\_partition\_}.
\item[Issue 1.16 (2005/05/18)] Added tests for binding and tuple selection.
\item[Issue 1.17 (2005/06/17)] Added more tests for bracket-elimination around function application.
\item[Issue 1.18 (2005/08/03)] Schema projection is now left-associative.
\item[Issue 1.19 (2005/09/10)] Added tests for \$-feature.
\item[Issue 1.20 (2005/09/13)] Added test for new subscripted forms of schema operators.
\item[Issue 1.21 (2006/01/24)] Revised tests for \$-feature.
\item[Issue 1.22 (2006/01/25)] Added test for decorated fancyfix identifiers.
\item[Issue 1.23 (2006/06/12)] Added tests for floating point literals.
\item[Issue 1.23 (2006/06/12)] Added more tests for dollar-quoted identifiers.
\item[Issue 1.24 (2007/08/04)] Allowed for changes to lexical rules for underscores.
\item[Issue 1.25 (2008/02/10)] Tested new feature that optionally puts strings in Quine corners.
\item[Issue 1.26 (2008/07/24)] Allowed for changes to feature that optionally puts strings in Quine corners.
\item[Issue 1.27 (2008/09/05)] Added more tests for IdDec involving combinations of decoration and generics.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported PPZed to Lemma 1 document template.
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
routines for the \ProductZ\ system which are discussed
in~\cite{DS/FMU/IED/DTD064}.  The tests use the module testing system
of~\cite{DS/FMU/IED/DTD013} and~\cite{DS/FMU/IED/IMP013}.
The tests depend on the Z library of \cite{DS/FMU/IED/DTD088} etc.

%********************************************************************


\subsection{Deficiencies}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\section{TEST CASES}

We provide several groups of tests as follows:

\begin{description}
\item[Group.1] This covers an instance of each form of Z term (as
given in the grammar of \cite{DS/FMU/IED/DEF007}).
\item[Group.2] This checks bracket elimination in several contexts: (1)
fancy-fix terms; (2) schema calculus; (3) propositional calculus;
(4) around decoration.
\item[Group.3] This checks the handling of the eliding of generic
parameters of the form $𝕌[Totality]$.
\item[Group.4] This checks the elision of characteristic tuples from
set abstractions
\item[Group.5] This checks the handling of generic predicates
\item[Group.6] This checks the handling of declarations
\item[Group.7] Miscellaneous regression tests for various fixes
\end{description}

Results are checked by reparsing where possible,
and, if desired, by visual inspection. Note that not everything prints
exactly as input (e.g. `;' as low priority conjunction prints as ordinary
conjunction).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\section{INITIALISATION}

=IGN
Get the test harness files
sccs -d ~ied get dtd013.doc imp013.doc
docsml dtd013
docsml imp013

docsml mdt064
use_file "mdt064.sml";

=TEX

Load and initialise the module test system.

=SML
use_file "dtd013.sml";
use_file "imp013.sml";
init_mt_results ();
open_theory"z_library";
new_theory "mdt064_test";
┌Schema
	x:ℤ;
	y,z:ℤ×ℤ
├
	(x, x) = y = z
└
┌AnotherSchema
	t:ℤ;
	y,z:ℤ×ℤ
├
	(t, t) = y = z
└
┌A
	x:ℤ
└
┌B[X]
	x:X
└
┌C
	x:ℤ
└
┌C'
	x:ℤ
└
┌D[X]
	x:X
└
┌D'[X]
	x:X
└
ⓈZ
│ generic (E _)
■
┌E X
	x:X
└
┌E' X
	x:X
└



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
		("(uft_aux := ⓩ" ^ t1 ^ "⌝; !uft_aux)");
in
	!uft_aux
end;
fun uft⦂u (x:TERM) : TERM =
let
	val t1 = implode(ft x);
	val side_effect = use_string
		("(uft_aux := ⓩ(" ^ t1 ^ ")⦂𝕌 ⌝; !uft_aux)");
in
	!uft_aux
end;
fun term_of_string (x : string) : TERM = (
let
	val side_effect = use_string
		("(uft_aux := ⓩ" ^ x ^ "⌝; !uft_aux)");
in
	!uft_aux
end
);

fun chk1 (x : TERM) : bool = (
	x =$ uft x
);
fun chk1⦂u (x : TERM) : bool = (
	x =$ uft⦂u x
);
fun chk2 (y : string) (x : TERM) : bool = (
	let	fun is_sp "\n" = true
		|   is_sp " " = true
		|   is_sp _ = false;
		fun cmp s1 s2 = (explode s1 drop is_sp) = (explode s2 drop is_sp);
	in	cmp (implode (ft x)) y
	end
);
fun chk3 (x : string) : bool = (
	let	fun is_sp "\n" = true
		|   is_sp " " = true
		|   is_sp _ = false;
		fun cmp s1 s2 = (explode s1 drop is_sp) = (explode s2 drop is_sp);
	in	cmp (implode (ft(term_of_string x))) x
	end
);
=TEX
Most tests are run with one or other of the following.
$rp1$ is for cases which will reparse; $rp2$ and $rp3$ for ones which won't. $rp2$ is for cases where casts or
whatever mean that the output is not expected to
be the same as the input; $rp3$ is for cases where
only the input needs to be provided (and is currently not used).
=SML
fun rp1 (data: (string * TERM) list) : (string * bool) list = (
	(mt_run o map (fn (s, t) => (s, chk1, t, true))) data
);
fun rp2 (data: (string * TERM * string) list) : (string * bool) list = (
	(mt_run o map (fn (s, t, u) => (s, chk2 u, t, true))) data
);
fun rp3 (data: (string * string) list) : (string * bool) list = (
	(mt_run o map (fn (s, t) => (s, chk3, t, true))) data
);
=TEX
$rp1⦂u$ is for cases which will reparse if we force
an expression context:
=SML
fun rp1⦂u (data: (string * TERM) list) : (string * bool) list = (
	(mt_run o map (fn (s, t) => (s, chk1⦂u, t, true))) data
);

=TEX
%********************************************************************

\section{THE TESTS}
\subsection{Group 1}
These follow the grammar of \cite{DS/FMU/IED/DTD061}.
We label the blocks with the non-terminal names.
=TEX
Block 1: Pred \& Pred1
=SML
store_mt_results rp1 [
("064.1.1.1", ⓩa ; b⌝),
("064.1.1.2", ⓩ∀x:Y|R x⦁P x ; b⌝),
("064.1.1.3", ⓩa ; ∀x:Y|R x⦁P x⌝),
("064.1.1.4", ⓩ∃[x:X]⦁x = x⌝),
("064.1.1.5", ⓩ∃⋎1[x:X]⦁x = x⌝),
("064.1.1.6", ⓩ∀[x,y:X]| y = y⦁x = x⌝)
];
=TEX
Block 2: Pred2
=SML
store_mt_results rp1 [
("064.1.2.1", ⓩa ∧ b⌝),
("064.1.2.2", ⓩa ∨ b⌝),
("064.1.2.3", ⓩa ⇒ b⌝),
("064.1.2.4", ⓩa ⇔ b⌝)
];
=TEX
Block 3: Pred3
=SML
store_mt_results rp1 [
("064.1.3.1", ⓩ¬a ∧ b⌝)
];
=TEX
Block 4: Schema2
=SML
store_mt_results rp2 [
("064.1.4.1", ⓩ([x,y:X] ∧ [y:Y]) ⦂ 𝕌⌝, "[x,y:X] ∧ [y:Y]"),
("064.1.4.2", ⓩ([x,y:X] ∨ [y:Y]) ⦂ 𝕌⌝, "[x,y:X] ∨ [y:Y]"),
("064.1.4.3", ⓩ([x,y:X] ⇔ [y:Y]) ⦂ 𝕌⌝, "[x,y:X] ⇔ [y:Y]"),
("064.1.4.4", ⓩ([x,y:X]  ↾⋎s [y:Y]) ⦂ 𝕌⌝, "[x,y:X]  ↾⋎s [y:Y]"),
("064.1.4.5", ⓩ([x,x':X]  ⨾⋎s [x,x':X]) ⦂ 𝕌⌝, "[x,x':X]  ⨾⋎s [x,x':X]"),
("064.1.4.6", ⓩ(∀x,y:X |x = y⦁[x,y,z:X]) ⦂ 𝕌⌝, "∀x,y:X |x = y⦁[x,y,z:X]"),
("064.1.4.7", ⓩ(∃x,y:X |x = y⦁[x,y,z:X]) ⦂ 𝕌⌝, "∃x,y:X |x = y⦁[x,y,z:X]"),
("064.1.4.8", ⓩ(∃⋎1x,y:X |x = y⦁[x,y,z:X]) ⦂ 𝕌⌝, "∃⋎1x,y:X |x = y⦁[x,y,z:X]"),
("064.1.4.9", ⓩ([x,y:X] ∧⋎s [y:Y]) ⦂ 𝕌⌝, "[x,y:X] ∧ [y:Y]"),
("064.1.4.10", ⓩ([x,y:X] ∨⋎s [y:Y]) ⦂ 𝕌⌝, "[x,y:X] ∨ [y:Y]"),
("064.1.4.11", ⓩ([x,y:X] ⇔⋎s [y:Y]) ⦂ 𝕌⌝, "[x,y:X] ⇔ [y:Y]"),
("064.1.4.12", ⓩ(∀⋎s x,y:X |x = y⦁[x,y,z:X]) ⦂ 𝕌⌝, "∀x,y:X |x = y⦁[x,y,z:X]"),
("064.1.4.13", ⓩ(∃⋎s x,y:X |x = y⦁[x,y,z:X]) ⦂ 𝕌⌝, "∃x,y:X |x = y⦁[x,y,z:X]"),
("064.1.4.14", ⓩ(∃⋎1⋎s x,y:X |x = y⦁[x,y,z:X]) ⦂ 𝕌⌝, "∃⋎1x,y:X |x = y⦁[x,y,z:X]")
];
=TEX
Block 5: Schema3
=SML
store_mt_results rp1 [
("064.1.5.1", ⓩpre[x,x':X|x ≠ x']⌝),
("064.1.5.2", ⓩΞ[x:X|x ≠ x']⌝),
("064.1.5.3", ⓩΔ[x:X|x ≠ x']⌝)
];
=TEX
Block 6: Schema4
=SML
store_mt_results rp1 [
("064.1.6.1", ⓩ[x,y,x':X|x ≠ x']\⋎s(x,y)⌝)
];
=TEX
Block 7: Renames
=SML
store_mt_results rp1 [
("064.1.7.1", ⓩ[x,y,x':X|x ≠ x'][a/x]⌝),
("064.1.7.2", ⓩ[x,y,x':X|x ≠ x'][a/x,b/y]⌝)
];
=TEX
Block 8: Decl
=SML
store_mt_results rp1 [
("064.1.8.1", ⓩ{[x:X]⦁x}⌝),
("064.1.8.2", ⓩ{a,b,c:ABC; d,e,f:DEF⦁x}⌝),
("064.1.8.3", ⓩ{[x:X];[a,b,c:ABC]⦁x}⌝),
("064.1.8.4", ⓩ{[x:X]; a,b,c:ABC;[x:X]; a,b,c:ABC⦁x}⌝)
];
=TEX
Block 9: Expr0
=SML
store_mt_results rp1 [
("064.1.9.1", ⓩ(μx:X)⌝),
("064.1.9.2", ⓩ(λx:X⦁y)⌝),
("064.1.9.3", ⓩ(λx:X|x = x⦁y)⌝),
("064.1.9.4", ⓩ(μ[x:X]|x = x⦁y)⌝),
("064.1.9.5", ⓩ(μ[x:X]|x = x)⌝)
];
=TEX
Block 10: Expr1
=SML
store_mt_results rp1 [
("064.1.10.1", ⓩ1+2*3⌝),
("064.1.10.2", ⓩ1+(2*3)⌝),
("064.1.10.3", ⓩ~1+2⌝),
("064.1.10.4", ⓩ~(1+2)⌝),
("064.1.10.5", ⓩf⦇{1+2}⦈⌝)
];
=TEX
Block 11: Expr2
=SML
store_mt_results rp1 [
("064.1.11.1", ⓩℙ(ℤ × ℤ)⌝),
("064.1.11.2", ⓩℙ ℤ × ℤ⌝),
("064.1.11.3", ⓩI ∪ B × C⌝),
("064.1.11.4", ⓩI ∪ (B × C)⌝),
("064.1.11.5", ⓩseq X  × Y⌝),
("064.1.11.6", ⓩ(seq X) × Y⌝),
("064.1.11.7", ⓩX × Y × Z⌝),
("064.1.11.8", ⓩ(X × Y) × (Z × W)⌝),
("064.1.11.9", ⓩ(X × Y) × (Z ∪ W)⌝)
];
=TEX
Block 12: Expr3
=SML
store_mt_results rp1 [
("064.1.12.1", ⓩf a⌝),
("064.1.12.2", ⓩf a b c⌝),
("064.1.12.3", ⓩθSchema⌝),
("064.1.12.4", ⓩθSchema!⌝),
("064.1.12.5", ⓩθ(Schema!)⌝),
("064.1.12.6", ⓩθ(Schema!)?⌝),
("064.1.12.7", ⓩ(x≜1,y≜(1,2)).y⌝)
];
=TEX
Block 13: Expr4
=SML
store_mt_results rp1 [
("064.1.13.1", ⓩf⌝),
("064.1.13.2", ⓩx = ⌜CombK 1 2⌝⌝),
("064.1.13.3", ⓩ99⌝),
("064.1.13.4", ⓩ"a string"⌝),
("064.1.13.5", ⓩ"(1,2,3,4)"⌝),
("064.1.13.6", ⓩ"{1,2,3,4}"⌝),
("064.1.13.7", ⓩ"{}"⌝),
("064.1.13.8", ⓩ"{1}"⌝),
("064.1.13.9", ⓩ"⟨1,2,3,4⟩"⌝),
("064.1.13.10", ⓩ"{x:X|x=x⦁x}"⌝),
("064.1.13.11", ⓩ"{x:X|x=x}"⌝),
("064.1.13.12", ⓩ"{x:X⦁x}"⌝),
("064.1.13.13", ⓩ"[x:X|x = x]"⌝),
("064.1.13.14", ⓩ"[x:X]"⌝),
("064.1.13.15", ⓩ"([x:X])'!?"⌝),
("064.1.13.16", ⓩ(Schema '?!) ??'⌝)
];
=TEX
Block 14: IdDec
=SML
store_mt_results rp1 [
("064.1.14.1", ⓩf⌝),
("064.1.14.2", ⓩf'?!??'⌝),
("064.1.14.3", ⓩSchema'?!??'⌝),
("064.1.14.4.1", ⓩA⌝),
("064.1.14.4.2", ⓩA'⌝),
("064.1.14.4.4", ⓩ(A)'⌝),
("064.1.14.4.3", ⓩA '⌝),
("064.1.14.4.5", ⓩ(A')'⌝),
("064.1.14.5.1", ⓩB⌝),
("064.1.14.5.2", ⓩB'⌝),
("064.1.14.5.3", ⓩB '⌝),
("064.1.14.5.4", ⓩ(B)'⌝),
("064.1.14.5.5", ⓩ(B')'⌝),
("064.1.14.6.1", ⓩB[X]⌝),
("064.1.14.6.2", ⓩB'[X]⌝),
("064.1.14.6.3", ⓩB '[X]⌝),
("064.1.14.6.4", ⓩ(B[X])'⌝),
("064.1.14.6.5", ⓩ(B'[X])'⌝),
("064.1.14.7.1", ⓩC⌝),
("064.1.14.7.2", ⓩC'⌝),
("064.1.14.7.3", ⓩC '⌝),
("064.1.14.7.4", ⓩ(C)'⌝),
("064.1.14.7.5", ⓩ(C')'⌝),
("064.1.14.7.6", ⓩC''⌝),
("064.1.14.7.7", ⓩC ''⌝),
("064.1.14.7.8", ⓩ(C)''⌝),
("064.1.14.7.9", ⓩ(C')''⌝),
("064.1.14.7.10", ⓩ(C'')'⌝),
("064.1.14.8.1", ⓩD⌝),
("064.1.14.8.2", ⓩD'⌝),
("064.1.14.8.3", ⓩD '⌝),
("064.1.14.8.4", ⓩ(D)'⌝),
("064.1.14.8.5", ⓩ(D')'⌝),
("064.1.14.8.6", ⓩD''⌝),
("064.1.14.8.7", ⓩD ''⌝),
("064.1.14.8.8", ⓩ(D)''⌝),
("064.1.14.8.9", ⓩ(D')''⌝),
("064.1.14.8.10", ⓩ(D'')'⌝),
("064.1.14.9.1", ⓩD[X]⌝),
("064.1.14.9.2", ⓩD'[X]⌝),
("064.1.14.9.3", ⓩD '[X]⌝),
("064.1.14.9.4", ⓩ(D[X])'⌝),
("064.1.14.9.5", ⓩ(D'[X])'⌝),
("064.1.14.9.6", ⓩD''[X]⌝),
("064.1.14.9.7", ⓩD ''[X]⌝),
("064.1.14.9.8", ⓩ(D[X])''⌝),
("064.1.14.9.9", ⓩ(D'[X])''⌝),
("064.1.14.9.10", ⓩ(D''[X])'⌝),
("064.1.14.10.1", ⓩ(E _)⌝),
("064.1.14.10.2", ⓩ(E' _)⌝),
("064.1.14.10.3", ⓩ(E ' _)⌝),
("064.1.14.10.4", ⓩ(E _)'⌝),
("064.1.14.10.5", ⓩ(E' _)'⌝),
("064.1.14.10.6", ⓩ(E'' _)⌝),
("064.1.14.10.7", ⓩ(E '' _)⌝),
("064.1.14.10.8", ⓩ(E _)''⌝),
("064.1.14.10.9", ⓩ(E' _)''⌝),
("064.1.14.10.10", ⓩ(E'' _)'⌝),
("064.1.14.11.1", ⓩE X⌝),
("064.1.14.11.2", ⓩE' X⌝),
("064.1.14.11.3", ⓩE ' X⌝),
("064.1.14.11.4", ⓩ(E X)'⌝),
("064.1.14.11.5", ⓩ(E' X)'⌝),
("064.1.14.11.6", ⓩE'' X⌝),
("064.1.14.11.7", ⓩE '' X⌝),
("064.1.14.11.8", ⓩ(E X)''⌝),
("064.1.14.11.9", ⓩ(E' X)''⌝),
("064.1.14.11.10", ⓩ(E'' X)'⌝)
];
=TEX
Block 15: \$-feature:
=SML
store_mt_results rp1 [
("064.1.15.1", ⓩ$"abc def"⌝),
("064.1.15.2", ⓩ$"_*_"⌝),
("064.1.15.3", ⓩ$"_ * _"⌝),
("064.1.15.4", ⓩ$"aa##"⌝),
("064.1.15.5", ⓩ$"_ *' _"⌝),
("064.1.15.6", ⓩ$""⌝),
("064.1.15.7", ⓩ$"\\\""⌝),
("064.1.15.8", ⓩ$"x\\ \"42\\"⌝)
];
=TEX
Block 15: strings:
=SML
val t1 = string_of_term ⓩ"abc def"⌝;
store_mt_results rp1 [
("064.1.16.1", ⓩ"abc def"⌝)
];
set_flag("pp_quote_z_strings", true);
val t2 = string_of_term ⓩ"\"abc def"⌝;
store_mt_results rp1 [
("064.1.16.2", ⓩ"abc def"⌝)
];
reset_flag("pp_quote_z_strings");
store_mt_results mt_run [
("064.1.16.3", (implode o curry (op to) (explode t1)), 1, "ⓩ\""),
("064.1.16.4", (implode o curry (op to) (explode t2)), 2, "ⓩⓩ\"")
];
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection{Group 2}
 This checks bracket elimination in several contexts: (1)
fancy-fix terms; (2) schema calculus; (3) propositional calculus;
(4) around decoration; (5) equality and membership;
(6) binding and tuple selection;
(7) function application.

In many cases, we just check that things which should reparse do,
leaving the check that there aren't too many brackets to
be done visually.
=TEX
Block 1: bracket elimination for fancy-fix
=SML
store_mt_results rp2 [
("064.2.1.1", ⓩ1+2*3⌝, "1+2*3"),
("064.2.1.2", ⓩ1+(2*3)⌝, "1+2*3"),
("064.2.1.3", ⓩ~1+2⌝, "~1+2"),
("064.2.1.4", ⓩ~(1+2)⌝, "~(1+2)"),
("064.2.1.5", ⓩf⦇{1+2}⦈ ∩ A ∪ B \ C⌝, "f⦇{1+2}⦈ ∩ A ∪ B \\ C"),
("064.2.1.6", ⓩ(1+2)+3⌝, "1+2+3"),
("064.2.1.7", ⓩ1+2+3⌝, "1+2+3"),
("064.2.1.8", ⓩ1+(2+3)⌝, "1+(2+3)")
];
=TEX
Block 2: bracket elimination for schema calculus
=SML
store_mt_results rp2 [
("064.2.2.1", ⓩ([x,x':X] ⨾⋎s [x,x':X] ∧ Schema)⦂𝕌⌝,
	"[x,x':X] ⨾⋎s [x,x':X] ∧ Schema"),
("064.2.2.2", ⓩ(Schema ↾⋎s [x,x':X] ⨾⋎s Schema)⦂𝕌⌝,
	"Schema ↾⋎s [x,x':X] ⨾⋎s Schema"),
("064.2.2.3", ⓩ(Schema ∨ Schema ⇔ Schema)⦂𝕌⌝,
	"Schema ∨ Schema ⇔ Schema"),
("064.2.2.4", ⓩ(Schema ∨ Schema ∧ Schema)⦂𝕌⌝,
	"Schema ∨ Schema ∧ Schema"),
("064.2.2.5", ⓩ(¬Schema ∨ Schema ∧ Schema)⦂𝕌⌝,
	"¬Schema ∨ Schema ∧ Schema"),
("064.2.2.6", ⓩ(¬Schema ⇒ Schema ∧ Schema)⦂𝕌⌝,
	"¬Schema ⇒ Schema ∧ Schema"),
("064.2.2.7", ⓩ(([x,x':X] ⨾⋎s [x,x':X]) ∧ Schema)⦂𝕌⌝,
	"([x,x':X] ⨾⋎s [x,x':X]) ∧ Schema"),
("064.2.2.8", ⓩ(Schema' ↾⋎s ([x,x':X] ⨾⋎s Schema))⦂𝕌⌝,
	"(Schema') ↾⋎s ([x,x':X] ⨾⋎s Schema)"),
("064.2.2.9", ⓩ(Schema ∨ (Schema ⇔ Schema))⦂𝕌⌝,
	"Schema ∨ (Schema ⇔ Schema)"),
("064.2.2.10", ⓩ((Schema ∨ Schema) ∧ Schema)⦂𝕌⌝,
	"(Schema ∨ Schema) ∧ Schema"),
("064.2.2.11", ⓩ(¬(Schema ∨ Schema) ∧ Schema)⦂𝕌⌝,
	"¬(Schema ∨ Schema) ∧ Schema"),
("064.2.2.12", ⓩ(¬(Schema ⇒ Schema) ∧ Schema)⦂𝕌⌝,
	"¬(Schema ⇒ Schema) ∧ Schema"),
("064.2.2.13", ⓩ(Schema ↾⋎s [x, x':ℤ] ↾⋎s Schema)⦂𝕌⌝,
	"Schema ↾⋎s [x, x' : ℤ] ↾⋎s Schema"),
("064.2.2.14", ⓩSchema ↾⋎s ([x, x' : ℤ] ↾⋎s [a:ℤ])⦂𝕌⌝,
	"Schema ↾⋎s ([x, x' : ℤ] ↾⋎s [a:ℤ])")
];
=TEX
Not all the $⦂𝕌$s above are strictly necessary.
=TEX
Block 3: bracket elimination for propositional calculus (part 1)
=SML
store_mt_results rp2 [
("064.2.3.1.1", ⓩA ∧ B ∧ C⌝, "A ∧ B ∧ C"),
("064.2.3.1.2", ⓩA ∧ B ∨ C⌝, "A ∧ B ∨ C"),
("064.2.3.1.3", ⓩA ∧ B ⇒ C⌝, "A ∧ B ⇒ C"),
("064.2.3.1.4", ⓩA ∧ B ⇔ C⌝, "A ∧ B ⇔ C"),
("064.2.3.1.5", ⓩA ∨ B ∧ C⌝, "A ∨ B ∧ C"),
("064.2.3.1.6", ⓩA ∨ B ∨ C⌝, "A ∨ B ∨ C"),
("064.2.3.1.7", ⓩA ∨ B ⇒ C⌝, "A ∨ B ⇒ C"),
("064.2.3.1.8", ⓩA ∨ B ⇔ C⌝, "A ∨ B ⇔ C"),
("064.2.3.1.9", ⓩA ⇒ B ∧ C⌝, "A ⇒ B ∧ C"),
("064.2.3.1.10", ⓩA ⇒ B ∨ C⌝, "A ⇒ B ∨ C"),
("064.2.3.1.11", ⓩA ⇒ B ⇒ C⌝, "A ⇒ B ⇒ C"),
("064.2.3.1.12", ⓩA ⇒ B ⇔ C⌝, "A ⇒ B ⇔ C"),
("064.2.3.1.13", ⓩA ⇔ B ∧ C⌝, "A ⇔ B ∧ C"),
("064.2.3.1.14", ⓩA ⇔ B ∨ C⌝, "A ⇔ B ∨ C"),
("064.2.3.1.15", ⓩA ⇔ B ⇒ C⌝, "A ⇔ B ⇒ C"),
("064.2.3.1.16", ⓩA ⇔ B ⇔ C⌝, "A ⇔ B ⇔ C")
];
=TEX
Block 3: bracket elimination for propositional calculus (part 2)
=SML
store_mt_results rp2 [
("064.2.3.2.1", ⓩ(A ∧ B) ∧ C⌝, "(A ∧ B) ∧ C"),
("064.2.3.2.2", ⓩA ∧ (B ∨ C)⌝, "A ∧ (B ∨ C)"),
("064.2.3.2.3", ⓩA ∧ (B ⇒ C)⌝, "A ∧ (B ⇒ C)"),
("064.2.3.2.4", ⓩA ∧ (B ⇔ C)⌝, "A ∧ (B ⇔ C)"),
("064.2.3.2.5", ⓩ(A ∨ B) ∧ C⌝, "(A ∨ B) ∧ C"),
("064.2.3.2.6", ⓩ(A ∨ B) ∨ C⌝, "(A ∨ B) ∨ C"),
("064.2.3.2.7", ⓩA ∨ (B ⇒ C)⌝, "A ∨ (B ⇒ C)"),
("064.2.3.2.8", ⓩA ∨ (B ⇔ C)⌝, "A ∨ (B ⇔ C)"),
("064.2.3.2.9", ⓩ(A ⇒ B) ∧ C⌝, "(A ⇒ B) ∧ C"),
("064.2.3.2.10", ⓩ(A ⇒ B) ∨ C⌝, "(A ⇒ B) ∨ C"),
("064.2.3.2.11", ⓩ(A ⇒ B) ⇒ C⌝, "(A ⇒ B) ⇒ C"),
("064.2.3.2.12", ⓩ(A ⇒ B) ⇔ C⌝, "A ⇒ B ⇔ C"),
("064.2.3.2.13", ⓩA ⇔ (B ∧ C)⌝, "A ⇔ B ∧ C"),
("064.2.3.2.14", ⓩA ⇔ (B ∨ C)⌝, "A ⇔ B ∨ C"),
("064.2.3.2.15", ⓩA ⇔ (B ⇒ C)⌝, "A ⇔ B ⇒ C"),
("064.2.3.2.16", ⓩA ⇔ (B ⇔ C)⌝, "A ⇔ B ⇔ C")
];
=TEX
Block 4: bracket elimination around decoration
=SML
store_mt_results rp2 [
("064.2.4.1.1", ⓩ∃(B[X])'⦁true⌝, "∃(B[X])'⦁true"),
("064.2.4.1.2", ⓩ∃(A')⦁true⌝, "∃(A')⦁true"),
("064.2.4.1.3", ⓩ∃A; (A?)'; ((B[X])'')?⦁true⌝, "∃A; (A?)'; ((B[X])'')?⦁true")
];
=TEX
Block 5: bracket elimination around equality and membership
=SML
store_mt_results rp2 [
("064.2.5.1.1", ⓩ[A] (x = (λa:A⦁true))⌝, "[A] (x = (λa:A⦁true))"),
("064.2.5.1.2", ⓩ[A] (x ∈ (λa:A⦁true))⌝, "[A] (x ∈ (λa:A⦁true))"),
("064.2.5.1.3", ⓩ[A] ((λa:A⦁true) = F)⌝, "[A] ((λa:A⦁true) = F)"),
("064.2.5.1.4", ⓩ[A] ((λa:A⦁true) ∈ F)⌝, "[A] ((λa:A⦁true) ∈ F)"),
("064.2.5.1.5", ⓩ[A] ((x = A) ∈ F)⌝, "[A] ((x = A) ∈ F)"),
("064.2.5.1.6", ⓩ[A] ((x ∈ A) ∈ F)⌝, "[A] ((x ∈ A) ∈ F)"),
("064.2.5.1.7", ⓩ[A] (x ∈ A ∈ F)⌝, "[A] (x ∈ A ∧ A ∈ F)"),
("064.2.5.1.8", ⓩ[A] (x ∈ A = F)⌝, "[A] (x ∈ A ∧ A = F)"),
("064.2.5.1.9", ⓩ[A] (x = A ∈ F)⌝, "[A] (x = A ∧ A ∈ F)"),
("064.2.5.1.10", ⓩ[A] (x = A = F)⌝, "[A] (x = A ∧ A = F)")
];
=TEX
Block 6: bracket elimination around binding and tuple selection
=SML
store_mt_results rp2 [
("064.2.6.1.1",  ⓩ∀ t : [a, b :[x, y:ℤ]]⦁ t.a.x = t.b.y ∨ f(t.a.x + t.b.y)⌝,
	"∀ t : [a, b :[x, y:ℤ]]⦁ t.a.x = t.b.y ∨ f(t.a.x + t.b.y)"),
("064.2.6.1.2",  ⓩ∀ t : [a, b :[x, y:ℤ]]⦁ 2 + t.a.x = t.b.y + 1 ∨ f(t.a.x + t.b.y)⌝,
	"∀ t : [a, b :[x, y:ℤ]]⦁ 2 + t.a.x = t.b.y + 1 ∨ f(t.a.x + t.b.y)"),
("064.2.6.1.3",  ⓩ∀ t : (ℤ × ℤ) × (ℤ × ℤ)⦁ t.1.2 = t.2.1 ∨ f(t.1.1 + t.2.2)⌝,
	"∀ t : (ℤ × ℤ) × (ℤ × ℤ)⦁ t.1.2 = t.2.1 ∨ f(t.1.1 + t.2.2)"),
("064.2.6.1.4",  ⓩ∀ t : (ℤ × ℤ) × (ℤ × ℤ)⦁ 2 + t.1.2 = t.2.1 + 1 ∨ f(t.1.1 + t.2.2)
⌝,
	"∀ t : (ℤ × ℤ) × (ℤ × ℤ)⦁ 2 + t.1.2 = t.2.1 + 1 ∨ f(t.1.1 + t.2.2)")
];
=TEX
Block 7: bracket elimination around function application
=SML
store_mt_results rp2 [
("064.2.7.1.1",  ⓩf a b⌝,
	"f a b"),
("064.2.7.1.2",  ⓩf (α a) (β b)⌝,
	"f (α a) (β b)"),
("064.2.7.1.3",  ⓩf (θA) x⌝,
	"f (θA) x"),
("064.2.7.1.4",  ⓩθ((λx:ℤ⦁A) 1)⌝,
	"θ((λx:ℤ⦁A) 1)"),
("064.2.7.1.5",  ⓩf(θ((λx:ℤ⦁A) 1)) x⌝,
	"f(θ((λx:ℤ⦁A) 1)) x")
];
=TEX
\subsection{Group 3}
Elision of $𝕌[Totality]$.
=SML
store_mt_results rp2 [
("064.3.1", ⓩ𝕌⌝, "𝕌"),
("064.3.2", ⓩ𝕌[ℤ]⌝, "𝕌[ℤ]")
];
=TEX
\subsection{Group 4}
Elision of characteristic tuple.
=SML
store_mt_results rp1 [
("064.4.1", ⓩ{x:X}⌝),
("064.4.2", ⓩ{x,y:X|x = y}⌝),
("064.4.3", ⓩ{Schema|z = y}⌝)
];
=TEX
\subsection{Group 5}
Generic predicates.
=SML
store_mt_results rp1 [
("064.5.1", ⓩ[X](x ∈ X)⌝),
("064.5.2", ⓩ[Z]z ∈ Z ∨ y ∈ Y⌝),
("064.5.3", ⓩ[X, Y, Z](x ∈ X ∧ z ∈ Z ∧ ⓩ[Z]z ∈ Z ∨ y ∈ Y⌝)⌝),
("064.5.4", ⓩ[X, Y](x ∈ X ∧ ⌜∀y⦁x = y⌝)⌝)
];
=TEX
\subsection{Group 6}
Declarations.
=SML
store_mt_results rp1 [
("064.6.1", fst(dest_z_h_schema ⓩ[x,y,z:ℤ]⌝)),
("064.6.2", fst(dest_z_h_schema ⓩ[Schema]⌝)),
("064.6.3", hd(dest_z_decl(fst(dest_z_h_schema ⓩ[x,y,z:ℤ]⌝)))),
("064.6.4", hd(dest_z_decl(fst(dest_z_h_schema ⓩ[Schema]⌝)))),
("064.6.5", mk_z_dec([ⓩ(x ≜ 1, x' ≜ 2, z ≜ 3).z⌝],ⓩℤ⌝))
];
=TEX
\subsection{Group 7}
Regression tests for bug fixes.
=SML
store_mt_results rp1 [
("064.7.1", ⓩ⌜Z'Dec ([z'x'], XX)⌝⌝)	,	(* HAT 97 *)
("064.7.2", ⓩ{[x : 𝕌] | true}⌝),		(* HAT 64 *)
("064.7.3", ⓩ{[x : 𝕌]}⌝),		(* HAT 64 *)
("064.7.4", ⓩ{A | true}⌝),		(* HAT 64 *)
("064.7.5", ⓩ{A}⌝),			(* HAT 64 *)
("064.7.6", ⓩ{[x : 𝕌] ⦁ (x,x)}⌝),	(* HAT 64 *)
("064.7.7", ⓩ{A ⦁ (x,x)}⌝)		(* HAT 64 *)
];
=TEX
=SML
store_mt_results rp1 [
("064.7.8", ⓩ(_ partition _)[ℤ, ℤ × ℤ]⌝)
];
=TEX
Associativity of schema calculus operations:
┌ AA ───────────
│ a, ab, ac, abc : ℤ
└──────────────
┌ BB ───────────
│ b, ab, bc, abc : ℤ
└──────────────
┌ CC ───────────
│ c, ac, bc, abc : ℤ
└──────────────
=SML
store_mt_results rp1 [
("064.7.9", ⓩAA ∧ (BB ∧ CC)⌝),
("064.7.10", ⓩAA ∨ (BB ∨ CC)⌝),
("064.7.11", ⓩ(AA ∧ BB) ∧ CC⌝),
("064.7.12", ⓩ(AA ∨ BB) ∨ CC⌝),
("064.7.13", ⓩAA ↾⋎s (BB ↾⋎s CC)⌝),
("064.7.14", ⓩ(AA ↾⋎s BB) ↾⋎s CC⌝)
];
=TEX
=SML
set_flag("subscript_z_schema_ops", true);
store_mt_results rp2 [
("064.7.15", ⓩ([x,y:X] ∧⋎s [y:Y]) ⦂ 𝕌⌝, "[x,y:X] ∧⋎s [y:Y]"),
("064.7.16", ⓩ([x,y:X] ∨⋎s [y:Y]) ⦂ 𝕌⌝, "[x,y:X] ∨⋎s [y:Y]"),
("064.7.17", ⓩ([x,y:X] ⇔⋎s [y:Y]) ⦂ 𝕌⌝, "[x,y:X] ⇔⋎s [y:Y]"),
("064.7.18", ⓩ(∀⋎s x,y:X |x = y⦁[x,y,z:X]) ⦂ 𝕌⌝, "∀⋎s x,y:X |x = y⦁[x,y,z:X]"),
("064.7.19", ⓩ(∃⋎s x,y:X |x = y⦁[x,y,z:X]) ⦂ 𝕌⌝, "∃⋎s x,y:X |x = y⦁[x,y,z:X]"),
("064.7.20", ⓩ(∃⋎1⋎s x,y:X |x = y⦁[x,y,z:X]) ⦂ 𝕌⌝, "∃⋎1⋎s x,y:X |x = y⦁[x,y,z:X]")
];
set_flag("subscript_z_schema_ops", false);
=SML
store_mt_results rp1 [
("064.7.21", ⓩ1.2⌝),
("064.7.22", ⓩ1.2e3⌝),
("064.7.23", ⓩ1.2e~3⌝)
];
=TEX
\section{SUMMARY OF RESULTS}

=SML
val _ = set_line_length 80;
val _ = diag_line "Summary Of Results";
val _ = diag_string(summarize_mt_results());
=TEX

\end{document}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%********************************************************************
%--------------------------------------------------------------------

=IGN
********************************************************************************
mdt082.doc: this file is part of the PPHol system

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

\def\Title{Module Tests for Linear Arithmetic Proof Procedure}

\def\AbstractText{This document contains tests for the material defined in DS/FMU/IED/DTD082\cite{DS/FMU/IED/DTD082}.}

\def\Reference{DS/FMU/IED/MDT082}

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
%% LaTeX2e port: \TPPtitle{Module Tests for Linear Arithmetic Proof Procedure}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/MDT082}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.4 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2002/10/17 15:10:58 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: %\TPPauthor{R.D.~Arthan & WIN01}  %% Mandatory field
%% LaTeX2e port: \TPPauthors{R.D.~Arthan & WIN01\\K.~Blackburn & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.B.~Jones & FMU Manager}
%% LaTeX2e port: \TPPabstract{This document contains tests for the material defined
%% LaTeX2e port: in DS/FMU/IED/DTD082\cite{DS/FMU/IED/DTD082}.}
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
\item[1.1]
First issue.
\item[1.2]
Update for new INTEGER type.
\item[1.3]
Fixed {\LaTeX} errors.
\item[Issue 1.4 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.5 (2002/10/17)] PPHol-specific updates for open source release
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes forecast}
None.
\section{GENERAL}
\subsection{Scope}
This document contains module tests for the module defined
in \cite{DS/FMU/IED/DTD082}.
\subsection{Introduction}
\subsubsection{Background and Purpose}
See \cite{DS/FMU/IED/DTD082}. The tests are intended to meet
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
\section{PREAMBLE}
=SML
use_file "dtd013.sml";
use_file "imp013.sml";
open_theory"basic_hol";
push_pc"basic_hol";
new_theory"mdt082";
=TEX
\section{TEST CASES}
There are 8 groups of tests as follows:

\begin{description}
\item[1]
The linear arithmetic tools (successful operation)
\item[2]
The linear arithmetic tools (error cases)
\item[3]
$lin\_arith\_rule$ and $lin\_arith\_rule1$ (successful operation)
\item[4]
$lin\_arith\_rule$ and $lin\_arith\_rule1$ (error cases)
\item[5]
The conversions (successful operation)
\item[6]
The conversions (error cases)
\item[7]
$scale\_rule$ (successful operation)
\item[8]
$scale\_rule$ (error cases)
\item[9]
$lin\_arith\_tac$ and $lin\_arith\_rule1$ (successful operation)
\item[10]
$lin\_arith\_tac$ and $lin\_arith\_tac$ (error cases)
\item[11]
The proof contexts (successful operation) and the scaling tactic
\item[12]
The proof contexts (error cases)
\end{description}

\section{THE TESTS}
=TEX
\subsection{Group 1}
The linear arithmetic tools (successful operation)
It is convenient to set up some apparatus giving a more pleasant syntax

for entering test data for the linear arithmetic tools:

=SML
open LinearArithmeticTools;
infix 3 **;
infix 2 ++;
infix 1 << <<= >> >>= ==;
=TEX
=SML
datatype CP = C of INTEGER | X of int | op ++ of CP * CP | op ** of INTEGER * CP;
=TEX
=SML
datatype CC =
	op << of CP * CP |
	op <<= of CP * CP |
	op >> of CP * CP |
	op >>= of CP * CP |
	op == of CP * CP;
=TEX
=SML
fun compile_p (cp : CP) : POLY * INTEGER = (
	let fun xma i1 (p1, c1) i2 (p2, c2) = (
			(mult_and_add_poly i1 (normalise_poly p1) i2 (normalise_poly p2),
				i1@*c1@+i2@*c2)
	);
	in
		case cp of
			C i => ([], i)
		|	X i => ([(one, i)], zero)
		| p1 ++ p2 => xma one (compile_p p1) one (compile_p p2)
		| i ** p => xma i (compile_p p) zero ([], zero)
	end
);
=TEX
=SML
fun compile_c (i : int, cc : CC) : CONSTRAINT = (
	let
		fun comb ct cp1 cp2 a = (
			let val (p1, c1) = compile_p cp1;
				val (p2, c2) = compile_p cp2;
			in	(mult_and_add_poly one p1 (@~one) p2, ct, c2 @- c1, [(a, i)])
			end
		);
	in
		case cc of
			cp1 << cp2 => comb Less cp1 cp2 one
		| cp1 <<= cp2 => comb LessEq cp1 cp2 one
		| cp1 >> cp2 => comb Less cp2 cp1 (@~one)
		| cp1 >>= cp2 => comb LessEq cp2 cp1 (@~one)
		| cp1 == cp2 => comb Eq cp1 cp2 one
	end
);
=TEX
=SML
fun make_sys (ccs : CC list) = (
	map compile_c (combine (interval 1 (length ccs)) ccs)
);
=TEX
Now go testing. First of all the formatting routines:
=TEX
=SML
store_mt_results_show mt_run [
	("LinArith.1.1.1", format_poly, [], "0"),
	("LinArith.1.1.2", format_poly, [(one,1)], "+X1"),
	("LinArith.1.1.3", format_poly, [((@~one),1)], "-X1"),
	("LinArith.1.1.4", format_poly, [(@@"5",1),(@@"~100",2),(@@"1000",99)],
		"+5X1 -100X2 +1000X99")
];
=TEX
=SML
val sys1_2 = make_sys [
	X 1 <<= X 2,
	X 1 ++ X 2 << C (@@"99"),
	X 1 == X 3
];
store_mt_results_show mt_run [
	("LinArith.1.2.1", format_constraint,
		nth 0 sys1_2, "1: +X1 -X2 ≤ 0"),
	("LinArith.1.2.2", format_constraint,
		nth 1 sys1_2, "2: +X1 +X2 < 99"),
	("LinArith.1.2.3", format_constraint,
		nth 2 sys1_2, "3: +X1 -X3 = 0")
];
=TEX
Now multiplication-and-addition for polynomials
=SML
val ii = integer_of_int;
val poly1 = (fst o compile_p)(ii 2 ** X 1 ++ ii 2 ** X 3 ++ X 5);
val poly2 = (fst o compile_p)(ii(~3) ** X 1 ++ ii 4 ** X 3 ++ ii 2 ** X 4);
val poly3 = (fst o compile_p)(ii(3*2+2*4) ** X 3 ++ ii(2*2) ** X 4 ++ ii 3 ** X 5);
store_mt_results_show mt_run [
	("LinArith.1.3.1", mult_and_add_poly (ii 3) poly1 (ii 2), poly2, poly3)
];
=TEX
Now multiplication-and-addition for constraints
=SML
val sys1_4 = make_sys [
	ii 3 ** X 1 ++ X 3 <<= C (ii 2),
	ii 2 ** X 2  ++ ii (~1) ** X 3 << C (ii 4)
];
val ans1_4 = ([(ii 3, 1), (ii 2, 2)], Less, ii 6, [(ii 1, 1), (ii 1, 2)]);
store_mt_results_show mt_run [
	("LinArith.1.4.1", mult_and_add_constraint one (nth 0 sys1_4) one,
			(nth 1 sys1_4), ans1_4)
];
=TEX
Finally, $lin\_arith\_contr$.
=SML
val sys1_5_1 = make_sys [
	X 1 <<= X 0,
	X 0 <<= X 2,
	X 1 <<= X 2,
	X 0 <<= X 1,
	X 0  ++ C (ii 1) <<= X 1
];
val sys1_5_2 = make_sys [
	X 1 <<= X 0,
	X 0 <<= X 2,
	X 1 <<= X 2,
	X 0 <<= X 1,
	X 1  ++ C (ii 1) <<= X 0
];
val sys1_5_3 = make_sys [
	X 0 == X 1,
	X 1 << X 0
];
fun check1_5 (cts : CONSTRAINT list) : bool = (
	let	fun aux [] = fail "mdt082_check1_5" 82110 []
		|   aux [(i, x)] = (
			mult_and_add_constraint i(nth (x-1) cts) zero ([], Eq, zero, [])
		) | aux ((i, x) :: more) = (
			mult_and_add_constraint i(nth (x-1) cts) one (aux more)
		)
	in	case aux (lin_arith_contr cts) of
			([], Eq, i, _) => not(zero = i)
		|	([], LessEq, i, _) => not(zero @<= i)
		|	([], Less, i, _) => not(zero @< i)
		|	_ => false
	end
);

=TEX
=SML
store_mt_results_show mt_run [
	("LinArith.1.5.1", check1_5, sys1_5_1, true),
	("LinArith.1.5.2", check1_5, sys1_5_2, true),
	("LinArith.1.5.3", check1_5, sys1_5_3, true)
];
=TEX
\subsection{Group 2}
The linear arithmetic tools (error cases)
=SML
val  sys2_1 = make_sys [
	X 0 == X 1,
	X 1 << X 2
];

store_mt_results_show mt_run_fail [
	("LinArith.2.1", lin_arith_contr, sys2_1,
		gen_fail_msg"lin_arith_contr" 82110 [])
];
=TEX
\subsection{Group 3}
$lin\_arith\_rule$ and $lin\_arith\_rule1$ (successful operation)
=SML
fun t (s, f, a) = (s, dest_thm o f, a, (a, mk_f));
store_mt_results_show (mt_runf (op ~=#) o map t) [
	("LinArith.3.1", lin_arith_rule,
		[⌜1 ≤ x⌝, ⌜x + y = z⌝, ⌜z = y:ℕ⌝]),
	("LinArith.3.2", lin_arith_rule1,
		[⌜f(a, b) + g(x, y) + 2 ≤ f(a, b)⌝])
];
=TEX
\subsection{Group 4}
$lin\_arith\_rule$ and $lin\_arith\_rule1$ (error cases).

N.b. these generate message on the standard output as well as just raising
exceptions.
=SML
store_mt_results_show mt_run_fail [
	("LinArith.4.1", lin_arith_rule,
		[⌜f(a, b) + g(x, y) + 2 ≤ f(a, b)⌝],
		gen_fail_msg"lin_arith_rule" 82110 []),
	("LinArith.4.2", lin_arith_rule1,
		[⌜f(a, b) ≤ g(x, y)⌝,  ⌜2 ≤ f(a, b)⌝],
		gen_fail_msg"lin_arith_rule1" 82110 []),
	("LinArith.4.3", lin_arith_rule,
		[],
		gen_fail_msg"lin_arith_rule" 82111 []),
	("LinArith.4.4", lin_arith_rule,
		[⌜f(a, b) + g(x, y)⌝],
		gen_fail_msg"lin_arith_rule" 82112 []),
	("LinArith.4.5", lin_arith_rule1,
		[],
		gen_fail_msg"lin_arith_rule1" 82111 []),
	("LinArith.4.6", lin_arith_rule1,
		[⌜f(a, b) + g(x, y)⌝],
		gen_fail_msg"lin_arith_rule1" 82112 [])
];
=TEX
\subsection{Group 5}
The conversions (successful operation)

We do the cancellation conversions first. There are lots of special cases.
First of all terms with at most one non-literal atom:
=SML
store_mt_results_show (mt_runf (op ~=#)) [
	("LinArith.5.1.1", dest_thm o ℕ_eq_cancel_conv,
		⌜1 = 2⌝, ([], ⌜1 = 2 ⇔ 0 = 1⌝)),
	("LinArith.5.1.2", dest_thm o ≤_cancel_conv,
		⌜1 ≤ 2⌝, ([], ⌜1 ≤ 2 ⇔ 0 ≤ 1⌝)),
	("LinArith.5.1.3", dest_thm o ℕ_eq_cancel_conv,
		⌜142*99 = 457+2⌝, ([], ⌜142*99 = 457+2 ⇔ ⓜ(mk_ℕ o integer_of_int) (142*99-459)⌝ = 0⌝)),
	("LinArith.5.1.4", dest_thm o ≤_cancel_conv,
		⌜142*99 ≤ 457+2⌝, ([], ⌜142*99 ≤ 457+2 ⇔ ⓜ(mk_ℕ o integer_of_int) (142*99-459)⌝ ≤ 0⌝)),
	("LinArith.5.1.5", dest_thm o ℕ_eq_cancel_conv,
		⌜x+1 = 2⌝, ([], ⌜x+1 = 2 ⇔ x = 1⌝)),
	("LinArith.5.1.6", dest_thm o ≤_cancel_conv,
		⌜x+1 ≤ 2⌝, ([], ⌜x+1 ≤ 2 ⇔ x ≤ 1⌝)),
	("LinArith.5.1.7", dest_thm o ℕ_eq_cancel_conv,
		⌜x+1 = 2+x⌝, ([], ⌜x+1 = 2+x ⇔ 0 = 1⌝)),
	("LinArith.5.1.8", dest_thm o ≤_cancel_conv,
		⌜x+1 ≤ 2+x⌝, ([], ⌜x+1 ≤ 2+x ⇔ 0 ≤ 1⌝)),
	("LinArith.5.1.9", dest_thm o ℕ_eq_cancel_conv,
		⌜x+1+x+2+6*x=1+6*x+2⌝, ([], ⌜x+1+x+2+6*x=1+6*x+2 ⇔ 2*x = 0⌝)),
	("LinArith.5.1.10", dest_thm o ≤_cancel_conv,
		⌜x+1+x+2+6*x≤1+6*x+2⌝, ([], ⌜x+1+x+2+6*x≤1+6*x+2 ⇔ 2*x ≤ 0⌝)),
	("LinArith.5.1.11", dest_thm o ℕ_eq_cancel_conv,
		⌜x+1+x+2+6*x=1+99*x+2⌝, ([], ⌜x+1+x+2+6*x=1+99*x+2 ⇔ 0 = 91*x⌝)),
	("LinArith.5.1.12", dest_thm o ≤_cancel_conv,
		⌜x+1+x+2+6*x≤1+99*x+2⌝, ([], ⌜x+1+x+2+6*x≤1+99*x+2 ⇔ 0 ≤ 91*x⌝)),
	("LinArith.5.1.13", dest_thm o ℕ_eq_cancel_conv,
		⌜x+1+x+6*x=1+99*x+2⌝, ([], ⌜x+1+x+6*x=1+99*x+2 ⇔ 0 = 2+91*x⌝)),
	("LinArith.5.1.14", dest_thm o ≤_cancel_conv,
		⌜x+1+x+6*x≤1+99*x+2⌝, ([], ⌜x+1+x+6*x≤1+99*x+2 ⇔ 0 ≤ 2+91*x⌝))
,
	("LinArith.5.1.15", dest_thm o ℕ_eq_cancel_conv,
		⌜x+11+x+6*x=1+99*x+2⌝, ([], ⌜x+11+x+6*x=1+99*x+2 ⇔ 8 = 91*x⌝)),
	("LinArith.5.1.16", dest_thm o ≤_cancel_conv,
		⌜x+11+x+6*x≤1+99*x+2⌝, ([], ⌜x+11+x+6*x≤1+99*x+2 ⇔ 8 ≤ 91*x⌝))
];
=TEX
Now some with lots of variables, no literals and various bracketings:
=SML
store_mt_results_show (mt_runf (op ~=#)) [
	("LinArith.5.2.1", dest_thm o ℕ_eq_cancel_conv,
		⌜(x+y+z)+((y+x)+z)+(z+x+y) = (x+y)+(y+z)+(x+z)⌝,
			([], ⌜(x+y+z)+((y+x)+z)+(z+x+y) = (x+y)+(y+z)+(x+z) ⇔ x+y+z = 0⌝)),
	("LinArith.5.2.2", dest_thm o ≤_cancel_conv,
		⌜(x+y+z)+((y+x)+z)+(z+x+y) ≤ (x+y)+(y+z)+(x+z)⌝,
			([], ⌜(x+y+z)+((y+x)+z)+(z+x+y) ≤ (x+y)+(y+z)+(x+z) ⇔ x+y+z ≤ 0⌝)),
	("LinArith.5.2.3", dest_thm o ℕ_eq_cancel_conv,
		⌜(x+y+z)+((y+x)+z)+(z+x+y) = z + y + x⌝,
			([], ⌜(x+y+z)+((y+x)+z)+(z+x+y) = z + y + x ⇔ 2*x+2*y+2*z = 0⌝)),
	("LinArith.5.2.4", dest_thm o ≤_cancel_conv,
		⌜(x+y+z)+((y+x)+z)+(z+x+y) ≤ z + y + x⌝,
			([], ⌜(x+y+z)+((y+x)+z)+(z+x+y) ≤ z + y + x ⇔ 2*x+2*y+2*z ≤ 0⌝))
];
=TEX
Now a random selection with a bit of everything:
=SML
store_mt_results_show (mt_runf (op ~=#)) [
	("LinArith.5.3.1", dest_thm o ℕ_eq_cancel_conv,
		⌜(x+1)*(x+1) = x*x⌝,
			([], ⌜(x+1)*(x+1) = x*x ⇔ 1+2*x = 0⌝)),
	("LinArith.5.3.2", dest_thm o ≤_cancel_conv,
		⌜(x+1)*(x+1) ≤ x*x⌝,
			([], ⌜(x+1)*(x+1) ≤ x*x ⇔ 1+2*x ≤ 0⌝)),
	("LinArith.5.3.3", dest_thm o ℕ_eq_cancel_conv,
		⌜(x+1)*(x+1) = (x+1)*(x+1)*(x+1)⌝,
			([], ⌜(x+1)*(x+1) = (x+1)*(x+1)*(x+1) ⇔ 0 = x+2*x*x+x*x*x⌝)),
	("LinArith.5.3.4", dest_thm o ≤_cancel_conv,
		⌜(x+1)*(x+1) ≤ (x+1)*(x+1)*(x+1)⌝,
			([], ⌜(x+1)*(x+1) ≤ (x+1)*(x+1)*(x+1) ⇔ 0 ≤ x+2*x*x+x*x*x⌝)),
	("LinArith.5.3.5", dest_thm o ℕ_eq_cancel_conv,
		⌜(x+3)*(2+z) = (x+4)*(z+1)⌝,
			([], ⌜(x+3)*(2+z) = (x+4)*(z+1) ⇔ 2+x = z⌝)),
	("LinArith.5.3.6", dest_thm o ≤_cancel_conv,
		⌜(x+3)*(2+z) ≤ (x+4)*(z+1)⌝,
			([], ⌜(x+3)*(2+z) ≤ (x+4)*(z+1) ⇔ 2+x ≤ z⌝)),
	("LinArith.5.3.7", dest_thm o ℕ_eq_cancel_conv,
		⌜(3*x+3)*(2+z) = (x+4)*(3*z+1)⌝,
			([], ⌜(3*x+3)*(2+z) = (x+4)*(3*z+1) ⇔ 2+5*x = 9*z⌝)),
	("LinArith.5.3.8", dest_thm o ≤_cancel_conv,
		⌜(3*x+3)*(2+z) ≤ (x+4)*(3*z+1)⌝,
			([], ⌜(3*x+3)*(2+z) ≤ (x+4)*(3*z+1) ⇔ 2+5*x ≤ 9*z⌝)),
	("LinArith.5.3.9", dest_thm o ℕ_eq_cancel_conv,
		⌜(3*f(a)+3)*(2+g(c,a)) = (f(a)+4)*(3*g(c,a)+1)⌝,
			([], ⌜(3*f(a)+3)*(2+g(c,a)) = (f(a)+4)*(3*g(c,a)+1) ⇔ 2+5*f(a) = 9*g(c,a)⌝)),
	("LinArith.5.3.10", dest_thm o ≤_cancel_conv,
		⌜(3*f(a)+3)*(2+g(c,a)) ≤ (f(a)+4)*(3*g(c,a)+1)⌝,
			([], ⌜(3*f(a)+3)*(2+g(c,a)) ≤ (f(a)+4)*(3*g(c,a)+1) ⇔ 2+5*f(a) ≤ 9*g(c,a)⌝))
];
=TEX
Now $make\_≤\_conv$. It is fun to have a constant to play with:
ⓈHOLCONST
	t : ℕ → ℕ
├
	∀m⦁ t m = m*m +2*m + 1
■
=SML
fun check5_4 t1 t2 = (
	let	val (l, r) = (dest_⇔ o concl o make_≤_conv) t1;
	in	l =$ t1 andalso r =$ t2
	end
);
=SML
store_mt_results_show mt_run [
("LinArith.5.4.1", check5_4 ⌜t 1 < t 2⌝, ⌜t 1 + 1 ≤ t 2⌝, true),
("LinArith.5.4.2", check5_4 ⌜t 1 ≥ t 2⌝, ⌜t 2 ≤ t 1⌝, true),
("LinArith.5.4.3", check5_4 ⌜t 1 > t 2⌝, ⌜t 2 + 1 ≤ t 1⌝, true),
("LinArith.5.4.4", check5_4 ⌜¬ t 1 = t 2⌝, ⌜t 1 + 1 ≤ t 2 ∨ t 2 + 1 ≤ t 1⌝, true),
("LinArith.5.4.5", check5_4 ⌜¬ t 1 ≤ t 2⌝, ⌜t 2 + 1 ≤ t 1⌝, true),
("LinArith.5.4.6", check5_4 ⌜¬ t 1 < t 2⌝, ⌜t 2 ≤ t 1⌝, true),
("LinArith.5.4.7", check5_4 ⌜¬ t 1 ≥ t 2⌝, ⌜t 1 + 1 ≤ t 2⌝, true),
("LinArith.5.4.8", check5_4 ⌜¬ t 1 > t 2⌝, ⌜t 1 ≤ t 2⌝, true)
];
=TEX
\subsection{Group 6}
The conversions (error cases)

Cancellation conversions:
=SML
store_mt_results_show mt_run_fail [
("LinArith.6.1.1", ℕ_eq_cancel_conv, ⌜x = 1⌝,
		gen_fail_msg"ℕ_eq_cancel_conv" 82120 [string_of_term ⌜x=1⌝]),
("LinArith.6.1.2", ≤_cancel_conv, ⌜x ≤ 1⌝,
		gen_fail_msg"≤_cancel_conv" 82121 [string_of_term ⌜x≤1⌝]),
("LinArith.6.1.3", ℕ_eq_cancel_conv, ⌜x ≤ 1⌝,
		gen_fail_msg"ℕ_eq_cancel_conv" 82120 [string_of_term ⌜x≤1⌝]),
("LinArith.6.1.4", ≤_cancel_conv, ⌜x = 1⌝,
		gen_fail_msg"≤_cancel_conv" 82121 [string_of_term ⌜x=1⌝])
];
=TEX
$make\_≤\_conv$:
=SML
store_mt_results_show mt_run_fail [
("LinArith.6.2.1", make_≤_conv, ⌜¬(a,b) = z⌝,
		gen_fail_msg"make_≤_conv" 82012 [string_of_term ⌜¬(a,b) = z⌝]),
("LinArith.6.2.2", make_≤_conv, ⌜x = 1⌝,
		gen_fail_msg"make_≤_conv" 82012 [string_of_term ⌜x = 1⌝]),
("LinArith.6.2.3", make_≤_conv, ⌜x ≤ 1⌝,
		gen_fail_msg"make_≤_conv" 82012 [string_of_term ⌜x ≤ 1⌝])
];
=TEX
\subsection{Group 7}
$scale\_rule$ (successful operation)
=SML
fun check7 t1 t2 = (
	let	val t = (concl o scale_rule ⌜a+b⌝ o asm_rule) t1;
	in	t=$ t2
	end
);
store_mt_results_show mt_run [
("LinArith.7.1", check7 ⌜t 1 = t 2⌝, ⌜(a + b) * t 1 = (a + b) * t 2⌝, true),
("LinArith.7.2", check7 ⌜t 1 ≤ t 2⌝, ⌜(a + b) * t 1 ≤ (a + b) * t 2⌝, true),
("LinArith.7.3", check7 ⌜t 1 < t 2⌝, ⌜(a + b) * t 1 + (a + b) ≤ (a + b) * t 2⌝, true),
("LinArith.7.4", check7 ⌜t 1 ≥ t 2⌝, ⌜(a + b) * t 2 ≤ (a + b) * t 1⌝, true),
("LinArith.7.5", check7 ⌜t 1 > t 2⌝, ⌜(a + b) * t 2 + (a + b) ≤ (a + b) * t 1⌝, true),
("LinArith.7.6", check7 ⌜¬t 1 = t 2⌝, ⌜(a + b) * t 1 + (a + b) ≤ (a + b) * t 2 ∨ (a + b) * t 2 + (a + b) ≤ (a + b) * t 1⌝, true),
("LinArith.7.7", check7 ⌜¬t 1 ≤ t 2⌝, ⌜(a + b) * t 2 + (a + b) ≤ (a + b) * t 1⌝, true),
("LinArith.7.8", check7 ⌜¬t 1 < t 2⌝, ⌜(a + b) * t 2 ≤ (a + b) * t 1⌝, true),
("LinArith.7.9", check7 ⌜¬t 1 ≥ t 2⌝, ⌜(a + b) * t 1 + (a + b) ≤ (a + b) * t 2⌝, true),
("LinArith.7.10", check7 ⌜¬t 1 > t 2⌝, ⌜(a + b) * t 1 ≤ (a + b) * t 2⌝, true)
];
=TEX
\subsection{Group 8}
$scale\_rule$ (error cases)
=SML
store_mt_results_show mt_run_fail [
("LinArith.8.1", scale_rule ⌜2⌝, asm_rule ⌜¬(a,b) = z⌝,
		gen_fail_msg"scale_rule" 82011 [string_of_thm (asm_rule⌜¬(a,b) = z⌝)])
];
store_mt_results_show mt_run_fail [
("LinArith.8.2", scale_rule, ⌜(a,b)⌝,
		gen_fail_msg"scale_rule" 82010 [string_of_term ⌜(a,b)⌝])
];
=TEX
\subsection{Group 9}
$lin\_arith\_tac$ and $lin\_arith\_rule1$ (successful operation)
=SML
fun check_tac (tac, gl) = (
	set_goal gl;
	a tac;
	(dest_thm o pop_thm) () ~=# gl
);
=TEX
=SML
store_mt_results_show mt_run [
("LinArith.9.1", check_tac,
	(lin_arith_tac, ([⌜x + y ≤ y⌝, ⌜1 ≤ x⌝], mk_f)), true),
("LinArith.9.2", check_tac,
	(lin_arith_tac1, ([⌜1 + x + y ≤ y⌝], mk_f)), true)
];
=TEX
\subsection{Group 10}
$lin\_arith\_tac$ and $lin\_arith\_rule1$ (error cases)
=SML
store_mt_results_show mt_run_fail [
("LinArith.10.1", lin_arith_tac, ([⌜1 + x + y ≤ y⌝], mk_f),
		gen_fail_msg"lin_arith_tac" 82110 []),
("LinArith.10.2", lin_arith_tac1, ([⌜x + y ≤ y⌝, ⌜1 ≤ y⌝], mk_f),
		gen_fail_msg"lin_arith_tac1" 82110 [])
];
=TEX
\subsection{Group 11}
The proof contexts (successful operation)
=SML
store_mt_results_show mt_run [
("LinArith.11.1.1", check_tac,
	(PC_T1"lin_arith"asm_prove_tac[], ([], ⌜x + y ≤ y ⇒ x ≤ 0⌝)), true),
("LinArith.11.1.2", check_tac,
	(PC_T1"lin_arith"asm_prove_tac[], ([], ⌜¬∃x y⦁x + a + b + y < b + y + a⌝)), true)
];
=TEX
Now try the examples from the detailed design:
=SML
store_mt_results_show mt_run [
("LinArith.11.2.1", check_tac, (PC_T1"lin_arith"prove_tac[],
		([], ⌜∀a b c⦁a ≤ b ∧ (a + b < c + a) ⇒ a < c⌝)
			), true),
("LinArith.11.2.2", check_tac, (PC_T1"lin_arith"prove_tac[],
	([], ⌜∀a b c⦁a ≥ b ∧ ¬ b < c ⇒ a ≥ c⌝)
			), true),
("LinArith.11.2.3", check_tac, (PC_T1"lin_arith"prove_tac[],
	([], ⌜∀a b c⦁a + 2*b < 2*a ⇒ b + b < a⌝)
			), true),
("LinArith.11.2.4", check_tac, (PC_T1"lin_arith"prove_tac[],
	([], ⌜∀ x y⦁ ¬ (2*x + y = 4 ∧ 4*x + 2*y = 7)⌝)
			), true)
];
=TEX
=SML
open_theory"sets";
store_mt_results_show mt_run [
("LinArith.11.3.1", check_tac, (MERGE_PCS_T1["sets_ext", "'lin_arith"]prove_tac[],
	([], ⌜∀m⦁ {i | m ≤ i ∧ i < m+3} = {m; m+1; m+2}⌝)
			), true),
("LinArith.11.3.2", check_tac, (MERGE_PCS_T1["sets_ext", "'lin_arith"]prove_tac[],
	([], ⌜{(i, j) | 30*i = 105*j} = {(i, j) | 2*i = 7*j}⌝)
			), true),
("LinArith.11.3.3", check_tac, (MERGE_PCS_T1["sets_ext", "'lin_arith"]prove_tac[],
	([], ⌜{i | 5*i = 6*i} = {0}⌝)
			), true)
];
=TEX
=SML
store_mt_results_show mt_run [
("LinArith.11.4.1", check_tac, (
	contr_tac
	THEN 	list_scale_nth_asm_tac[(⌜d+1⌝, 1), (⌜b+1⌝, 2), (⌜f+1⌝, 3)]
	THEN	PC_T1"lin_arith"asm_prove_tac[],
	([], ⌜a*(d+1) = c*(b+1) ∧ c*(f+1) = e*(d+1) ⇒ a*(f+1) = e*(b+1)⌝)
			), true)
];
=TEX
Now a case to show that the assumptions to the automatic proof tactic are
not ignored.
=SML
open_theory"mdt082";
val thm_x = conv_rule(PC_C1"lin_arith"rewrite_conv[])(∀_elim ⌜x:ℕ⌝ (get_spec⌜t⌝));
store_mt_results_show mt_run [
("LinArith.11.5.1", check_tac, (
	REPEAT strip_tac THEN PC_T1"lin_arith"asm_prove_tac[thm_x],
	([], ⌜∀x⦁t x = x*x ⇒x = 0⌝)
			), true)
];
=TEX
Check the rewriting, using the examples from the detailed design:
=SML
fun check11_6 t1 t2 = (
	let	val (l, r) = (dest_⇔ o concl o PC_C1"lin_arith"rewrite_conv[]) t1;
	in	l =$ t1 andalso r =$ t2
	end
);
=SML
store_mt_results_show mt_run [
("LinArith.11.6.1", check11_6 ⌜¬x + 2*y + x + 3 = y + 2 + 2*x + y⌝, ⌜T⌝, true),
("LinArith.11.6.2", check11_6 ⌜x + 2*y + x + 3 ≤ y + 2 + 2*x + y⌝, ⌜F⌝, true)
];
=TEX
\subsection{Group 12}
The proof contexts (error cases)
=SML
store_mt_results_show mt_run_fail [
("LinArith.12.1", PC_T1"lin_arith"asm_prove_tac[], ([⌜x + y ≤ y⌝, ⌜1 ≤ y⌝], mk_f),
		gen_fail_msg"lin_arith_prove_tac" 82200
			[get_message(fail "lin_arith_tac1" 82110 [] handle Fail msg => msg),
			string_of_term ⌜F⌝])
];
=TEX
=TEX
\section{SUMMARY OF RESULTS}
=SML
diag_string(summarize_mt_results());
=TEX

\end{document}



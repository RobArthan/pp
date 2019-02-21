=IGN
********************************************************************************
mdt086.doc: this file is part of the PPZed system

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

\def\Title{Module Tests for Z Library Numbers and Finiteness}

\def\AbstractText{This document gives the module tests for the Z Library Numbers and Finiteness and their proof support.}

\def\Reference{DS/FMU/IED/MDT086}

\def\Author{D.J. King, K. Blackburn}


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
%% LaTeX2e port: \TPPtitle{Module Tests for Z Library Numbers and Finiteness}
%% LaTeX2e port: \TPPref{DS/FMU/IED/MDT086}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.20 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2007/09/11 11:28:21 $ %
%% LaTeX2e port: }}  %% Mandatory field
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: %\TPPauthor{K.~Blackburn & WIN01}  %% Mandatory field
%% LaTeX2e port: \TPPauthors{D.J.~King & WIN01\\K.~Blackburn & WIN01}
%% LaTeX2e port: %\TPPauthors{R.D.~Arthan & WIN01 \\ K.~Blackburn & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document gives the module tests for the
%% LaTeX2e port: Z Library Numbers and Finiteness and their proof support.}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	    Project Library
%% LaTeX2e port: }}
%% LaTeX2e port: %\TPPclass{CLASSIFICATION}
%% LaTeX2e port: %\def\TPPheadlhs{}
%% LaTeX2e port: %\def\TPPheadcentre{}
%% LaTeX2e port: %def\TPPheadrhs{}
%% LaTeX2e port: %\def\TPPfootlhs{}
%% LaTeX2e port: %\def\TPPfootcentre{}
%% LaTeX2e port: %\def\TPPfootrhs{}
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
\section{DOCUMENT CONTROL}
\subsection{Contents List}
\tableofcontents
\subsection{Document Cross References}
\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes History}
\begin{description}
\item [Issue 1.1 (1992/10/28) (22nd October 1992)]
First version, derived from 078 and 083.
\item [Issue 1.2 (1992/10/30) (30th October 1992)]
Tidying up.
\item [Issues 1.3 (1992/11/16),1.4 (1992/11/16) (16th November 1992)]
Added tests for induction tactics.
\item [Issue 1.5 (1992/12/09) (9th December 1992)]
Added tests for conversions etc.
\item [Issue 1.6 (1993/02/03) (3rd February 1993)]
Typo fixing.
\item[Issue 1.7 (1993/02/10),1.8 (1993/02/11) (10th-11th February 1993)]
Reacting to changes in proof contexts, et al.
\item[Issue 1.9 (1993/02/22) (22nd February 1993)]
Fixed failing tests.
\item[Issue 1.10 (1993/02/23), 1.11 (1993/08/12), 1.12 (1993/08/18) (10th-17 August 1993)]
Addition of new induction theorems and tactics.
\item[Issue 1.13 (1996/03/07)]
Added proof context $z\_numbers1$.
\item[Issue 1.14 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.15 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.16 (2004/01/19)] The Z universal set is now called 𝕌.
\item[Issue 1.17 (2005/02/26)] Precedences and associativity of toolkit operators now follow \cite{ISO02}.
\item[Issue 1.18 (2007/05/28)] Extra tests for interval conversions.
\item[Issue 1.19 (2007/08/04)] The integer range operator is now referred to as {\em dot\_dot} in all cases.
\item[Issue 1.20 (2007/09/11)] Standardised on {\em z\_simple} rather than {\em simple\_z}.
\item[Issue 1.21 (2011/08/07)] Tested the proof contexts that elimnate the ISO Z-like symbol for monadic minus.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported PPZed to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
None known.
\section{GENERAL}
\subsection{Scope}
This document contains the module tests for the material
whose detailed design is given in \cite{DS/FMU/IED/DTD086}.
\subsection{Introduction}
This document contains the module tests for the material
whose detailed design is given in \cite{DS/FMU/IED/DTD086}.
This consists of demonstrating at least the simpler uses of the
functions in question.
\subsubsection{Dependencies}
The tests depend upon \cite{DS/FMU/IED/IMP086} and \cite{DS/FMU/IED/IMP013}.
In addition, testing by the subgoal package (section \ref{subgoalpackage})
depends on \cite{DS/FMU/IED/IMP030}.
\subsubsection{Deficiencies}
Only doing theory testing at present.
\section{TEST CASES}
The functions are tested in their order of presentation in the detailed design.
\section{PREAMBLE}
=SML
open_theory "z_numbers";
push_pc "z_sets_alg";
delete_theory "temp" handle _ => ();
new_theory "temp";
use_file "dtd013";
use_file "imp013";
init_mt_results();
(* set_flag("subgoal_package_quiet",true); *)
repeat drop_main_goal;
set_flag("check_is_z",true);
=TEX

\subsection{Utilities}
=SML
fun ⦏list_eq⦎ (eq:'a * 'a -> bool) ((a :: x), (b :: y)) : bool = (
	eq(a,b) andalso list_eq eq (x, y)
) | list_eq eq ([], []) = true
| list_eq _ _ = false;
=TEX
If two terms types are equal, break them apart until they differ.
=SML
fun ⦏differ_where⦎ itm1 itm2 = (
let	fun aux tm1 tm2 (App(f1,x1)) (App(f2,x2)) = (
		Value(force_value(aux f1 f2 (dest_simple_term f1) (dest_simple_term f2)))
		handle _ =>
		aux x1 x2 (dest_simple_term x1) (dest_simple_term x2))
	| aux tm1 tm2 (Const(nm1,ty1)) (Const(nm2,ty2)) = (
		if nm1 = nm2 andalso ty1 =: ty2
		then Nil
		else Value(tm1,tm2))
	| aux tm1 tm2 (Var(nm1,ty1)) (Var(nm2,ty2)) = (
		if nm1 = nm2 andalso ty1 =: ty2
		then Nil
		else Value(tm1,tm2))
	| aux tm1 tm2 (Simpleλ(x1,b1)) (Simpleλ(x2,b2)) = (
		if x1 =$ x2
		then aux b1 b2 (dest_simple_term b1) (dest_simple_term b2)
		else Value(tm1,tm2))
	| aux tm1 tm2 _ _ = Value(tm1,tm2);
in
	aux itm1 itm2 (dest_simple_term itm1) (dest_simple_term itm2)
end);
=TEX
\subsection{Testing Using Subgoal Package}
\label{subgoalpackage}
The following functions apply a tactic to a selected goal
and returns the resulting top goal.
This of course doesn't fully test tactics that return multiple
goals.
The functions differ in that $tac\_res1$ inputs and outputs
both assumptions and conclusion, while $tac\_res$
just assumes an empty assumption list.
=SML
fun ⦏tac_res⦎ tac goal = (push_goal([],goal);
		a tac;
		let val (seqasms,gl) = top_goal()
		in
			(drop_main_goal();
			gl)
		end);
fun ⦏tac_res⦎ tac goal = (push_goal([],goal);
		a tac;
		let val (seqasms,gl) = top_goal()
		in
			(drop_main_goal();
			gl)
		end);
fun ⦏tac_res1⦎ tac (seqasms, goal) = (
		push_goal(seqasms,goal);
		a tac;
		let val (rasms,gl) = top_goal()
		in
			(drop_main_goal();
			(rasms,gl))
		end);
=TEX
Now a function that returns the multiple goals for the case when a tactic causes multiple goals:
=SML
fun ⦏tac_ress⦎ tac n (seqasms, goal) = (
		push_goal(seqasms,goal);
		a tac;
		let val gll = map (top_labelled_goal o string_of_int)
			(interval 1 n)
		in
			(drop_main_goal();
			gll)
		end);
=TEX
This function tests that a tactic proves a goal:
=SML
fun ⦏tac_solve⦎ tac (seqasms, goal) = (
	dest_thm (tac_proof ((seqasms,goal),tac))
	=#
	(seqasms, goal)
);
=TEX
This function tests that a tactic fails on a goal:
=SML
fun ⦏tac_fail⦎ tac (seqasms, goal) = (
	push_goal(seqasms,goal);
	a tac
	handle complaint =>
	(drop_main_goal();
	reraise complaint (area_of complaint))
);
=TEX
\subsection{Some Useful Values}
┌TEST_SCHEMA─
x:𝕌;
y:𝕌
└
=SML
val aset = ⓩ{a,b:X; c:Y | a ≠ b ⦁ (a,b,c)}⌝;
val (asetd, asetp, asetv) = dest_z_seta aset;
val atuple3 = ⓩ(⌜p:'a⌝,⌜q:'a⌝,⌜r:'b⌝)⌝;
val notz = ⌜∃ x ⦁ x = y⌝;
val trues = string_of_term mk_t;
val notzs = string_of_term notz;
=TEX
\section{TESTS}
=TEX
\section{CHECK THE THEORY DESIGN}
=SML
use_file "dtd086.tch";
store_mt_results mt_run [("theory design of Z Numbers",
	theory_check_success,
	(),
	true)];
=TEX
\section{CHECK THE TACTICS}
=SML
store_mt_results mt_run [
	("z_ℤ_induction_tac.1",
	tac_solve (z_ℤ_induction_tac ⓩi⦂ℤ⌝ THEN_LIST[
	z_∃_tac ⓩ1⌝ THEN REPEAT strip_tac,
	z_∃_tac ⓩ~a⌝ THEN asm_rewrite_tac[],
	z_∃_tac ⓩa+a'⌝ THEN asm_rewrite_tac[]]),
	([],ⓩ∃a:𝕌⦁a = (i⦂ℤ)⌝),
	true),
	("z_ℕ_induction_tac.1",
	tac_solve (z_ℕ_induction_tac THEN_LIST[
	z_∃_tac ⓩ0⌝ THEN REPEAT strip_tac,
	z_∃_tac ⓩa+1⌝ THEN asm_rewrite_tac[]]),
	([],ⓩi ∈ ℕ ⇒ (∃a:𝕌⦁a = (i⦂ℤ))⌝),
	true),
	("z_≤_induction_tac.1",
	tac_solve (REPEAT z_strip_tac
	THEN z_≤_induction_tac ⓩi⦂ℤ⌝
	THEN_LIST [
	z_∃_tac ⓩj⌝ THEN asm_rewrite_tac[],
	z_∃_tac ⓩi+1⌝ THEN asm_rewrite_tac[]]),
	([],ⓩ∀ j:ℤ ⦁ j≤i ⇒ (∃a:𝕌⦁a = (i⦂ℤ))⌝),
	true),
	("z_cov_induction_tac.1",
	tac_solve (REPEAT z_strip_tac
	THEN POP_ASM_T ante_tac
	THEN DROP_ASM_T ⓩi∈ℤ⌝ ante_tac
	THEN z_cov_induction_tac ⓩi⦂ℤ⌝
	THEN REPEAT z_strip_tac
	THEN cases_tacⓩ∃ n:ℤ ⦁ j≤n ∧ n<i ∧ p n⌝
	THEN_LIST[
	GET_NTH_ASM_T 7 (strip_asm_tac o z_∀_elim ⓩn⦂ℤ⌝)
		THEN z_∃_tac ⓩm⦂ℤ⌝ THEN asm_rewrite_tac[]
		THEN REPEAT z_strip_tac
		THEN GET_NTH_ASM_T 4 (strip_asm_tac o z_∀_elim ⓩi'⦂ℤ⌝),
	z_∃_tacⓩi⌝ THEN REPEAT z_strip_tac
		THEN GET_NTH_ASM_T 4 (strip_asm_tac o z_∀_elim ⓩi'⦂ℤ⌝)]),
	([], ⓩ∀ j, i :ℤ ⦁ j≤i ⇒ p i
		⇒ (∃ m:ℤ ⦁ j≤m ∧ (∀ i:ℤ ⦁ j≤i ∧ p i ⇒ ¬i < m))⌝),
	true)
];
=TEX
\section{CHECK THE SYNTAX FUNCTIONS}
=SML
=TEX
\section{CHECK THE CONVERSIONS}
=SML
fun gen_test_cases (id : string) (conv : CONV) (tms : TERM list) = (
	let	fun test_conv_res tm = (
			case dest_thm (conv tm) of
				([], conc) =>
				let val (l, r) = dest_eq conc;
				in	l =$ tm andalso
				(is_z_signed_int r orelse is_t r orelse is_f r)
				end
			|	_ => false
		);
		fun gen1_case (i, tm) = (
			(id ^ "." ^ string_of_int i, test_conv_res, tm, true)
		);
	in	map gen1_case (combine (interval 1 (length tms)) tms)
	end			
);
=TEX
=SML
store_mt_results mt_run
(gen_test_cases "z_plus_conv" z_plus_conv[
	ⓩ7 + 4⌝, ⓩ7 + ~4⌝, ⓩ4 + ~7⌝, ⓩ~4 + 7⌝, ⓩ~7 + 4⌝, ⓩ~7 + ~4⌝,
	ⓩ7 + 0⌝, ⓩ7 + ~0⌝, ⓩ0 + ~7⌝, ⓩ~0 + 7⌝, ⓩ~7 + 0⌝, ⓩ~7 + ~0⌝,
	ⓩ0 + 4⌝, ⓩ0 + ~4⌝, ⓩ4 + ~0⌝, ⓩ~4 + 0⌝, ⓩ~0 + 4⌝, ⓩ~0 + ~4⌝,
	ⓩ0 + 0⌝, ⓩ0 + ~0⌝, ⓩ~0 + 0⌝, ⓩ~0 + ~0⌝
]);
=TEX
=SML
store_mt_results mt_run
(gen_test_cases "z_ℕ_times_conv" z_ℕ_times_conv [
	ⓩ1*1⌝, ⓩ1*0⌝, ⓩ0*1⌝, ⓩ0*0⌝,
	ⓩ1*12⌝, ⓩ12*0⌝, ⓩ0*12⌝, ⓩ12*1⌝,
	ⓩ7*3⌝, ⓩ99*1001⌝
]);

=TEX
=SML
store_mt_results mt_run
(gen_test_cases "z_times_conv" z_times_conv [
	ⓩ1*1⌝, ⓩ1*0⌝, ⓩ0*1⌝, ⓩ0*0⌝,
	ⓩ1*12⌝, ⓩ12*0⌝, ⓩ0*12⌝, ⓩ12*1⌝,
	ⓩ7*3⌝, ⓩ99*1001⌝,
	ⓩ1* ~1⌝, ⓩ1* ~0⌝, ⓩ0* ~1⌝, ⓩ0* ~0⌝,
	ⓩ1* ~12⌝, ⓩ12* ~0⌝, ⓩ0* ~12⌝, ⓩ12* ~1⌝,
	ⓩ7* ~3⌝, ⓩ99* ~1001⌝,
	ⓩ~1*1⌝, ⓩ~1*0⌝, ⓩ~0*1⌝, ⓩ~0*0⌝,
	ⓩ~1*12⌝, ⓩ~12*0⌝, ⓩ~0*12⌝, ⓩ~12*1⌝,
	ⓩ~7*3⌝, ⓩ~99*1001⌝,
	ⓩ~1* ~1⌝, ⓩ~1* ~0⌝, ⓩ~0* ~1⌝, ⓩ~0* ~0⌝,
	ⓩ~1* ~12⌝, ⓩ~12* ~0⌝, ⓩ~0* ~12⌝, ⓩ~12* ~1⌝,
	ⓩ~7* ~3⌝, ⓩ~99* ~1001⌝
]);

=TEX
=SML
store_mt_results mt_run
(gen_test_cases "z_abs_conv" z_abs_conv [ ⓩabs 0⌝, ⓩabs ~0⌝, ⓩabs 1⌝, ⓩabs ~1⌝, ⓩabs 100⌝, ⓩabs ~100⌝ ]);
=TEX
=SML
store_mt_results mt_run
(gen_test_cases "z_≤_conv" z_≤_conv [
	ⓩ0 ≤ 0⌝, ⓩ0 ≤ 1⌝, ⓩ0 ≤ ~1⌝, ⓩ1 ≤ 0⌝, ⓩ~1 ≤ 0⌝,
	ⓩ1 ≤ 1⌝, ⓩ1 ≤ ~1⌝, ⓩ~1 ≤ 1⌝, ⓩ~1 ≤ ~1⌝,
	ⓩ77 ≤ 77⌝, ⓩ77 ≤ ~77⌝, ⓩ~77 ≤ 77⌝, ⓩ~77 ≤ ~77⌝,
	ⓩ77 ≤ 99⌝, ⓩ77 ≤ ~99⌝, ⓩ~77 ≤ 99⌝, ⓩ~77 ≤ ~99⌝,
	ⓩ1001 ≤ 99⌝, ⓩ1001 ≤ ~99⌝, ⓩ~1001 ≤ 99⌝, ⓩ~1001 ≤ ~99⌝]);
=TEX
=SML
store_mt_results mt_run
(gen_test_cases "z_less_conv" z_less_conv [
	ⓩ0 < 0⌝, ⓩ0 < 1⌝, ⓩ0 < ~1⌝, ⓩ1 < 0⌝, ⓩ~1 < 0⌝,
	ⓩ1 < 1⌝, ⓩ1 < ~1⌝, ⓩ~1 < 1⌝, ⓩ~1 < ~1⌝,
	ⓩ77 < 77⌝, ⓩ77 < ~77⌝, ⓩ~77 < 77⌝, ⓩ~77 < ~77⌝,
	ⓩ77 < 99⌝, ⓩ77 < ~99⌝, ⓩ~77 < 99⌝, ⓩ~77 < ~99⌝,
	ⓩ1001 < 99⌝, ⓩ1001 < ~99⌝, ⓩ~1001 < 99⌝, ⓩ~1001 < ~99⌝]);

=TEX
=SML
store_mt_results mt_run
(gen_test_cases "z_div_conv" z_div_conv [
	ⓩ1 div 1⌝, ⓩ1 div ~1⌝, ⓩ~1 div 1⌝, ⓩ~1 div ~1⌝,
	ⓩ0 div 1⌝, ⓩ0 div ~1⌝,
	ⓩ30 div 1⌝, ⓩ30 div ~1⌝, ⓩ~30 div 1⌝, ⓩ~30 div ~1⌝,
	ⓩ30 div 5⌝, ⓩ30 div ~5⌝, ⓩ~30 div 5⌝, ⓩ~30 div ~5⌝,
	ⓩ37 div 7⌝, ⓩ37 div ~7⌝, ⓩ~37 div 7⌝, ⓩ~37 div ~7⌝
]);

=TEX
=SML
store_mt_results mt_run
(gen_test_cases "z_mod_conv" z_mod_conv [
	ⓩ1 mod 1⌝, ⓩ1 mod ~1⌝, ⓩ~1 mod 1⌝, ⓩ~1 mod ~1⌝,
	ⓩ0 mod 1⌝, ⓩ0 mod ~1⌝,
	ⓩ30 mod 1⌝, ⓩ30 mod ~1⌝, ⓩ~30 mod 1⌝, ⓩ~30 mod ~1⌝,
	ⓩ30 mod 5⌝, ⓩ30 mod ~5⌝, ⓩ~30 mod 5⌝, ⓩ~30 mod ~5⌝,
	ⓩ37 mod 7⌝, ⓩ37 mod ~7⌝, ⓩ~37 mod 7⌝, ⓩ~37 mod ~7⌝
]);
=TEX
=SML
store_mt_results mt_run
(gen_test_cases "z_ℤ_eq_conv" z_ℤ_eq_conv [
	ⓩ1 = 1⌝, ⓩ1 = ~1⌝, ⓩ~1 = 1⌝, ⓩ~1 = ~1⌝,
	ⓩ0 = 0⌝, ⓩ0 = ~0⌝, ⓩ~0 = 0⌝, ⓩ~0 = ~0⌝,
	ⓩ~0 = 1⌝, ⓩ1 = ~0⌝,
	ⓩ30 = 7⌝, ⓩ30 = ~7⌝, ⓩ~30 = 7⌝, ⓩ~30 = ~7⌝,
	ⓩ42 = 42⌝, ⓩ~42 = ~42⌝, ⓩ~42 = 42⌝, ⓩ42 = ~42⌝
]);
=TEX
=SML
(gen_test_cases "z_∈_ℕ_conv" z_∈_ℕ_conv [ⓩx ∈ ℕ⌝, ⓩ1 ∈ ℕ⌝]);

=TEX
\section{CHECK THE PROOF CONTEXT}
=SML
set_merge_pcs["z_sets_ext",  "'z_numbers1"];
=TEX
=SML
store_mt_results mt_run
(gen_test_cases "'z_numbers1.1" (rewrite_conv[]) [
	ⓩ1 + 2 = 3⌝,
	ⓩ~1 + 2 ≤ ~(7 div 2)⌝,
	ⓩ~1 + 2 ≥ ~(7 div 2)⌝,
	ⓩ~1 + 2 < ~(7 div 2)⌝,
	ⓩ~1 + 2 > ~(7 div 2)⌝,
	ⓩ1 * 2 * 3 * 4  < 2 * 2 * 2 * 2⌝,
	ⓩ﹣2 + 3⌝,
	ⓩ13 mod 3⌝, ⓩ13 mod ~3⌝, ⓩ~13 mod 3⌝, ⓩ~13 mod ~3⌝,
	ⓩ13 div 3⌝, ⓩ13 div ~3⌝, ⓩ~13 div 3⌝, ⓩ~13 div ~3⌝,
	ⓩabs (999 - 457) ≤ abs(999) + abs(457)⌝,
	ⓩ999 - 457 ∈ ℕ⌝,
	ⓩ¬457 - 999 ∈ ℕ⌝

]);

=TEX
=SML
set_merge_pcs["z_sets_ext",  "'z_numbers"];
=TEX
=SML
store_mt_results mt_run
(gen_test_cases "'z_numbers.1" (rewrite_conv[]) [
	ⓩ1 + 2 = 3⌝,
	ⓩ~1 + 2 ≤ ~(7 div 2)⌝,
	ⓩ~1 + 2 ≥ ~(7 div 2)⌝,
	ⓩ~1 + 2 < ~(7 div 2)⌝,
	ⓩ~1 + 2 > ~(7 div 2)⌝,
	ⓩ1 * 2 * 3 * 4  < 2 * 2 * 2 * 2⌝,
	ⓩ﹣2 + 3⌝,
	ⓩ13 mod 3⌝, ⓩ13 mod ~3⌝, ⓩ~13 mod 3⌝, ⓩ~13 mod ~3⌝,
	ⓩ13 div 3⌝, ⓩ13 div ~3⌝, ⓩ~13 div 3⌝, ⓩ~13 div ~3⌝,
	ⓩabs (999 - 457) ≤ abs(999) + abs(457)⌝,
	ⓩ999 - 457 ∈ ℕ⌝,
	ⓩ¬457 - 999 ∈ ℕ⌝

]);

=TEX
=SML
val th = prove_rule[z_plus_assoc_thm]ⓩ∀ i, j, k : ℤ ⦁ (i + j) + k = i + (j + k)⌝;

store_mt_results mt_run_fail [
("'z_numbers.2.1", (rewrite_conv[]),
	ⓩ(a + b) + (c + d) = (c + a) + b⌝,
	gen_fail_msg "rewrite_conv" 26001 [])
];
store_mt_results mt_run [
("'z_numbers.2.2.1", tac_solve (prove_tac[th]),
	([], ⓩ(a + b) + (c + d) = (a + c) + b ⇔ d = 0 ⌝),
	true),
("'z_numbers.2.2.2", tac_solve (prove_tac[th]),
	([], ⓩ∀ i, j, k : 𝕌 ⦁ i + k ≤ j + k ⇔ i ≤ j ⌝),
	true)
];
=TEX
\subsection{dots}
=SML
store_mt_results (mt_runf (op =$)) [("z_simple_dot_dot_conv a",
	snd o dest_eq o concl o z_simple_dot_dot_conv,
	ⓩ3 .. 1⌝,
	ⓩ{} ⦂ ℙ {1}⌝),
	("z_simple_dot_dot_conv b",
	snd o dest_eq o concl o z_simple_dot_dot_conv,
	ⓩ1 .. 1⌝,
	ⓩ{1}⌝),
	("z_simple_dot_dot_conv c",
	snd o dest_eq o concl o z_simple_dot_dot_conv,
	ⓩ1 .. ~1⌝,
	ⓩ{} ⦂ ℙ {1}⌝)
	];
store_mt_results mt_run_fail [("z_simple_dot_dot_conv 86001",
	z_simple_dot_dot_conv,
	mk_t,
	gen_fail_msg "z_simple_dot_dot_conv" 86001 [trues])
	];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [("z_∈_dot_dot_conv a",
	snd o dest_eq o concl o z_∈_dot_dot_conv,
	ⓩ2 ∈ 3 .. 1⌝,
	ⓩfalse⌝),
	("z_∈_dot_dot_conv b",
	snd o dest_eq o concl o z_∈_dot_dot_conv,
	ⓩ2 ∈ 1 .. 1⌝,
	ⓩ2 = 1⌝),
	("z_∈_dot_dot_conv c",
	snd o dest_eq o concl o z_∈_dot_dot_conv,
	ⓩ2 ∈ 1 .. 3⌝,
	ⓩ1 ≤ 2 ∧ 2 ≤ 3⌝),
	("z_∈_dot_dot_conv d",
	snd o dest_eq o concl o z_∈_dot_dot_conv,
	ⓩ2 ∈ 2 .. ~2⌝,
	ⓩfalse⌝)
	];
store_mt_results mt_run_fail [("z_∈_dot_dot_conv 86002",
	z_∈_dot_dot_conv,
	mk_t,
	gen_fail_msg "z_∈_dot_dot_conv" 86002 [trues])
	];
=TEX
Check all proof contexts are there:
=SML
set_pc "'z_numbers";
pop_pc();
=TEX
=SML
set_pc "'z_numbers1";
pop_pc();
=TEX
\section{END OF TESTS}
=SML
(* set_flag("subgoal_package_quiet",false); *)
diag_string(summarize_mt_results ());
=TEX
\end{document}
=IGN
***********COPY**************
store_mt_results (mt_runf (op =$)) [("",
	tac_res ,
	ⓩ⌝,
	ⓩ⌝)];
store_mt_results (mt_runf (op =$)) [("",
	snd o dest_eq o concl o  ,
	ⓩ⌝,
	ⓩ⌝)];
store_mt_results mt_run_fail [("",
	,
	,
	gen_fail_msg ""  [])];
store_mt_results (mt_runf (op =#)) [("",
	tac_res1 ,
	([ⓩ⌝],ⓩ⌝),
	([ⓩ⌝],ⓩ⌝))];
store_mt_results (mt_runf (list_eq(op =#))) [("",
	tac_ress  2,
	([ⓩ⌝],ⓩ⌝),
	[([ⓩ⌝],ⓩ⌝),([ⓩ⌝],ⓩ⌝)])];
store_mt_results mt_runf [
	("",
	tac_solve ,
	([],ⓩ⌝),
	true),
];
store_mt_results mt_run_fail [("",
	tac_fail ,
	([],ⓩ⌝),
	gen_fail_msg ""  [])];

store_mt_results mt_run [("",
	,
	,
	)];
store_mt_results mt_run_fail [("",
	,
	,
	gen_fail_msg ""  [])];

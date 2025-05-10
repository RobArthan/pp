=IGN
********************************************************************************
mdt107.doc: this file is part of the PPZed system

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

\def\Title{Module Tests: Z Fiiteness and Sequences}

\def\AbstractText{This document gives the module tests for the Z Finiteness and Sequences material.}

\def\Reference{DS/FMU/IED/MDT107}

\def\Author{K. Blackburn}


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
%% LaTeX2e port: \TPPtitle{Module Tests: Z Fiiteness and Sequences}
%% LaTeX2e port: \TPPref{DS/FMU/IED/MDT107}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.12 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2005/08/04 12:05:51 $ %
%% LaTeX2e port: }}  %% Mandatory field
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.~Blackburn & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{R.D.~Arthan & WIN01 \\ K.~Blackburn & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document gives the module tests for the
%% LaTeX2e port: Z Finiteness and Sequences material.}
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
\item [Issue 1.1 (1996/01/16)]
First version.
\item [Issue 1.2 (1996/03/26)--1.4 (1996/06/14)]
Added $z\_size\_dot\_dot\_conv$.
\item [Issue 1.5 (2001/07/05)]
Added material on sequence displays.
\item [Issue 1.6 (2002/07/10)]
Added tests for induction tactics.
\item[Issue 1.7 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.8 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.9 (2003/04/30)] Added tests for conversion for equality of sequence displays.
\item[Issue 1.10 (2004/01/19)] The Z universal set is now called 𝕌.
\item[Issue 1.11 (2005/02/26)] Precedences and associativity of toolkit operators now follow \cite{ISO02}.
\item[Issue 1.12 (2005/08/04)] Made it work in child databases.
\item[Issue 1.13 (2007/05/28)] Added tests for {\em z\_dot\_dot\_conv}.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported PPZed to Lemma 1 document template.
\item[2018/09/18]
Added tests for
=INLINEFT
z_string_conv
=TEX
.

%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}

\section{GENERAL}
\subsection{Scope}
This document contains the module tests for the material
whose detailed design is given in \cite{DS/FMU/IED/DTD107}.
\subsection{Introduction}
This document contains the module tests for the material
whose detailed design is given in \cite{DS/FMU/IED/DTD107}.
\subsubsection{Dependencies}
The tests depend upon \cite{DS/FMU/IED/IMP107} and \cite{DS/FMU/IED/IMP013}.
In addition, testing by the subgoal package (section \ref{subgoalpackage})
depends on \cite{DS/FMU/IED/IMP030}.
\subsubsection{Deficiencies}
Mainly doing just theory testing at present.
\section{TEST CASES}
The functions are tested in their order of presentation in the detailed design.
\section{PREAMBLE ZFunctions1}
=SML
open_theory "z_functions1";
delete_theory "temp" handle _ => ();
new_theory "temp";
set_pc "z_language";
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

\section{TESTS}
\section{CHECK THE THEORY DESIGN}
=SML
use_file "dtd107.tch";
store_mt_results mt_run [("theory design of ZFunctions1",
	(fn _ => z_functions1_success),
	(),
	true)];
store_mt_results mt_run [("theory design of ZNumbers1",
	(fn _ => z_numbers1_success),
	(),
	true)];
store_mt_results mt_run [("theory design of ZSequences1",
	(fn _ => z_sequences1_success),
	(),
	true)];
=TEX
\subsection{Tools}
=SML
store_mt_results (mt_runf (op =$)) [("z_size_dot_dot_conv 1",
	snd o dest_eq o concl o  z_size_dot_dot_conv,
	ⓩ#( 2 .. 6)⌝,
	ⓩ5⌝),
	("z_size_dot_dot_conv 2",
	snd o dest_eq o concl o  z_size_dot_dot_conv,
	ⓩ#( 6 .. 2)⌝,
	ⓩ0⌝),
	("z_size_dot_dot_conv 3",
	snd o dest_eq o concl o  z_size_dot_dot_conv,
	ⓩ#( 6 .. 6)⌝,
	ⓩ1⌝),
	("z_size_dot_dot_conv 34",
	snd o dest_eq o concl o  z_size_dot_dot_conv,
	ⓩ#( ~6 .. ~6)⌝,
	ⓩ1⌝),
	("z_size_dot_dot_conv 5",
	snd o dest_eq o concl o  z_size_dot_dot_conv,
	ⓩ#( ~9 .. ~7)⌝,
	ⓩ3⌝)];
store_mt_results mt_run_fail [("z_size_dot_dot_conv 107001 a",
	z_size_dot_dot_conv,
	ⓩ5⌝,
	gen_fail_msg "z_size_dot_dot_conv" 107001 ["ⓩ5⌝"]),
	("z_size_dot_dot_conv 107001 b",
	z_size_dot_dot_conv,
	ⓩsize (5 .. a)⌝,
	gen_fail_msg "z_size_dot_dot_conv" 107001 ["ⓩsize (5 .. a)⌝"])];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [("z_dot_dot_conv 1",
	snd o dest_eq o concl o  z_dot_dot_conv,
	ⓩ2 .. 6⌝,
	ⓩ{2, 3, 4, 5, 6}⌝),
	("z_dot_dot_conv 2",
	snd o dest_eq o concl o  z_dot_dot_conv,
	ⓩ6 .. 2⌝,
	ⓩ{} ⦂ ℙ{1}⌝),
	("z_dot_dot_conv 3",
	snd o dest_eq o concl o  z_dot_dot_conv,
	ⓩ6 .. 6⌝,
	ⓩ{6}⌝),
	("z_dot_dot_conv 4",
	snd o dest_eq o concl o  z_dot_dot_conv,
	ⓩ~1 .. 1⌝,
	ⓩ{~1, 0, 1}⌝),
	("z_dot_dot_conv 5",
	snd o dest_eq o concl o  z_dot_dot_conv,
	ⓩ~1 .. ~2⌝,
	ⓩ{} ⦂ ℙ{1}⌝)];
store_mt_results mt_run_fail [("z_dot_dot_conv 107001 a",
	z_dot_dot_conv,
	ⓩ5⌝,
	gen_fail_msg "z_dot_dot_conv" 107002 ["ⓩ5⌝"]),
	("z_dot_dot_conv 107002 b",
	z_dot_dot_conv,
	ⓩsize (5 .. a)⌝,
	gen_fail_msg "z_dot_dot_conv" 107002 ["ⓩsize (5 .. a)⌝"])];
=TEX
\section{SEQUENCE DISPLAYS}
=SML
open_theory"z_sequences1";
delete_theory "temp" handle _ => ();
new_theory "temp";
=TEX
=SML
store_mt_results
(mt_runf (fn (thm, tm) => snd(dest_eq(concl thm)) =$ tm))
[
	("2.1.1", rewrite_conv[z_seqd_⁀_rw_thm, z_seqd_⁀_⟨⟩_clauses], ⓩ⟨1, y⟩⌝, ⓩ⟨1⟩ ⁀ ⟨y⟩⌝),
	("2.1.2", rewrite_conv[z_seqd_⁀_rw_thm, z_seqd_⁀_⟨⟩_clauses], ⓩ⟨x, 2, z⟩⌝, ⓩ⟨x⟩ ⁀ (⟨2⟩ ⁀ ⟨z⟩)⌝),
	("2.1.3", rewrite_conv[z_seqd_⁀_rw_thm, z_seqd_⁀_⟨⟩_clauses], ⓩ⟨x, 2, z, w⟩⌝, ⓩ⟨x⟩ ⁀ (⟨2⟩ ⁀ (⟨z⟩ ⁀ ⟨w⟩))⌝)
];
=TEX
=SML
store_mt_results
(mt_runf (fn (thm, tm) => snd(dest_eq(concl thm)) =$ tm))
[
	("2.2.1", z_seqd_app_conv, ⓩ⟨"a"⟩ 1⌝, ⓩ"a"⌝),
	("2.2.2", z_seqd_app_conv, ⓩ⟨"a", "b"⟩ 1⌝, ⓩ"a"⌝),
	("2.2.3", z_seqd_app_conv, ⓩ⟨"a", "b"⟩ 2⌝, ⓩ"b"⌝),
	("2.2.4", z_seqd_app_conv, ⓩ⟨"a", "b", "c", "d"⟩ 4⌝, ⓩ"d"⌝)
];
=TEX
=SML
store_mt_results
mt_run_fail [("2.3.1", z_seqd_app_conv, ⓩ(~4)⌝,
	gen_fail_msg "z_seqd_app_conv" 107011 (map string_of_term[ⓩ~ 4⌝])),
	("2.3.2", z_seqd_app_conv, ⓩ⟨a, b, c, d, x⟩ (~4)⌝,
	gen_fail_msg "z_seqd_app_conv" 107012 (map string_of_term[ⓩ~ 4⌝])),
	("2.3.3", z_seqd_app_conv, ⓩ⟨a, b, c, d, x⟩ (7)⌝,
	gen_fail_msg "z_seqd_app_conv" 107013 (map string_of_term[ⓩ7⌝, ⓩ⟨a, b, c, d, x⟩⌝]))
];
=TEX
=SML
store_mt_results
(mt_runf (fn (thm, tm) => snd(dest_eq(concl thm)) =$ tm))
[
	("2.4.1", z_size_seqd_conv,  ⓩ#⟨⟩⌝, ⓩ0⌝),
	("2.4.2", z_size_seqd_conv, ⓩ#⟨x⟩⌝, ⓩ1⌝),
	("2.4.3", z_size_seqd_conv, ⓩ#⟨x, y, z, a,  b, c⟩⌝, ⓩ6⌝)
];
=TEX
=SML
store_mt_results
mt_run_fail [("2.5.1", z_size_seqd_conv, ⓩ# (tail s)⌝,
	gen_fail_msg "z_size_seqd_conv" 107021 (map string_of_term[ⓩ# (tail s)⌝]))
];
=TEX
=SML
val old_tic = TypeInference.get_ti_context();
TypeInference.set_ti_context[];
TypeInference.set_ti_context[
	⌜x1 : ℤ⌝,
	⌜x2 : ℤ⌝,
	⌜x3 : ℤ ⌝,
	⌜x4 : ℤ ⌝,
	⌜x5 : ℤ ⌝,
	⌜y1 : ℤ ⌝,
	⌜y2 : ℤ ⌝,
	⌜y3 : ℤ ⌝,
	⌜y4 : ℤ ⌝,
	⌜y5 : ℤ ⌝
];
store_mt_results
(mt_runf (fn (thm, tm) => snd(dest_eq(concl thm)) =$ tm))
[
	("2.6.1", z_seqd_eq_conv,  ⓩ⟨⟩ = ⟨⟩⌝, ⓩ true ⌝),
	("2.6.2", z_seqd_eq_conv,  ⓩ⟨x1⟩ = ⟨y1⟩⌝, ⓩ x1 = y1⌝),
	("2.6.3", z_seqd_eq_conv,  ⓩ⟨x1⟩ = ⟨x1⟩⌝, ⓩ true ⌝),
	("2.6.4", z_seqd_eq_conv,  ⓩ⟨x1, x2⟩ = ⟨y1⟩⌝, ⓩ false ⌝),
	("2.6.5", z_seqd_eq_conv,  ⓩ⟨x1, x2, x3, x4⟩ = ⟨y1, y2⟩⌝, ⓩ false ⌝),
	("2.6.6", z_seqd_eq_conv,  ⓩ⟨x1, x2, x3, x4⟩ = ⟨y1, x2, y3, x4⟩⌝, ⓩ x1 = y1 ∧ x3 = y3 ⌝),
	("2.6.7", z_seqd_eq_conv,  ⓩ⟨x1, x2⟩ = ⟨⟩⌝, ⓩ false ⌝),
	("2.6.8", z_seqd_eq_conv,  ⓩ⟨⟩ = ⟨x1, x2⟩⌝, ⓩ false ⌝),
	("2.6.9", z_seqd_eq_conv,  ⓩ⟨x1, x2⟩ = ⟨y1, 2⟩⌝, ⓩ x1 = y1 ∧ x2 = 2 ⌝),
	("2.6.10", z_seqd_eq_conv,  ⓩ⟨x1, x2, x3⟩ = ⟨y1, y2, y3⟩⌝, ⓩ x1 = y1 ∧ x2 = y2 ∧ x3 = y3 ⌝),
	("2.6.11", z_seqd_eq_conv,  ⓩ⟨x1, x2, x3, x4⟩ = ⟨1, y2, y3, y4⟩⌝, ⓩ x1 = 1 ∧ x2 = y2 ∧ x3 = y3 ∧ x4 = y4⌝),
	("2.6.12", (TOP_MAP_C z_seqd_eq_conv),  ⓩ⟨⟨2⟩, ⟨4⟩, ⟨4, 54, 1⟩, ⟨5⟩⟩ = ⟨⟨2⟩, ⟨4⟩, ⟨4, 54, 1⟩, ⟨5⟩⟩⌝, ⓩ true ⌝),

	("2.6.13", z_seqd_eq_conv,  ⓩ⟨x1, x2, x3, x4, x5⟩ = ⟨y1, y2, y3, y4, x5⟩⌝, ⓩ x1 = y1 ∧ x2 = y2 ∧ x3 = y3 ∧ x4 = y4 ⌝),
	("2.6.14", z_seqd_eq_conv,  ⓩ⟨a1, a2⟩ = ⟨"a", "b"⟩⌝, ⓩ a1 = "a" ∧ a2 = "b" ⌝)
];
TypeInference.set_ti_context old_tic;
=TEX
\section{SEQUENCE INDUCTION}
=TEX
Correct operation of the tactics
=INLINEFT
z_𝔽_induction_tac
=TEX
\ and  {\it z\_seq\_induction\_thm} is validated by their use in
proving the theorems in the theory. Here we check correct operation
of {\it z\_seq\_induction\_thm1} and error cases for the other two.
=TEX
=SML
store_mt_results
mt_run [
	("z_seq_induction_tac1.1",
	tac_solve
	(REPEAT strip_tac THEN z_seq_induction_tac ⓩis ⦂ seq ℕ⌝ THEN_LIST [
	DROP_NTH_ASM_T 2 (fn th => ante_tac (z_∀_elim ⓩ(i≜ i ⦂ ℕ, is ≜ ⟨⟩ ⦂ seq ℕ)⌝ th))  THEN
	strip_asm_tac (z_∀_elim ⓩi ⦂ ℕ⌝ z_singleton_seq_thm) THEN
	rewrite_tac[ z_⟨⟩_seq_thm] THEN
	ALL_FC_T rewrite_tac[ z_⟨⟩_seq_thm, z_⟨⟩_⁀_thm, z_⁀_⟨⟩_thm] THEN
	REPEAT strip_tac,
	(lemma_tac ⓩ⟨i⟩ ∈ seq ℕ ∧ ⟨x⟩ ∈ seq ℕ⌝ THEN1
		asm_rewrite_tac[z_singleton_seq_x_thm]) THEN
	all_fc_tac[z_seq_u_thm] THEN
	ALL_FC_T rewrite_tac[z_⁀_assoc_thm1] THEN
	(lemma_tac ⓩ⟨i⟩ ⁀ is ∈ seq ℕ⌝ THEN1
		ALL_FC_T1 fc_⇔_canon asm_rewrite_tac[z_⁀_seq_x_thm]) THEN
	ALL_ASM_FC_T asm_rewrite_tac[] THEN
	PC_T1 "z_lin_arith" prove_tac[]
	]),
	([], ⓩ∀f:𝕌 | f ⟨⟩ = 0 ∧ (∀i:ℕ; is : seq ℕ⦁f(is ⁀ ⟨i⟩)  = i + f is) ⦁
		(∀i:ℕ; is : seq ℕ⦁f(⟨i⟩ ⁀ is)= i + f is)⌝),
	true)
];
=TEX
=SML
store_mt_results
mt_run_fail [
("z_seq_induction_tac.fail.1",
	tac_fail ( z_seq_induction_tac ⓩs ⦂ seq ℤ⌝),
	([],ⓩtrue⌝),
	gen_fail_msg "z_seq_induction_tac"  107031 []),
("z_seq_induction_tac1.fail.1",
	tac_fail ( z_seq_induction_tac1 ⓩs ⦂ seq ℤ⌝),
	([],ⓩtrue⌝),
	gen_fail_msg "z_seq_induction_tac1"  107031 []),
("z_𝔽_induction_tac.fail.1",
	tac_fail ( z_𝔽_induction_tac ⓩa ⦂ ℙ ℤ⌝),
	([],ⓩtrue⌝),
	gen_fail_msg "z_𝔽_induction_tac"  107033 [])
];
=TEX
=SML
store_mt_results
mt_run_fail [
("z_seq_induction_tac.fail.2",
	z_seq_induction_tac,
	ⓩ1⌝,
	gen_fail_msg "z_seq_induction_tac"  107032 ["ⓩ1⌝"]),
("z_seq_induction_tac1.fail.2",
	z_seq_induction_tac1,
	ⓩ1⌝,
	gen_fail_msg "z_seq_induction_tac1"  107032 ["ⓩ1⌝"]),
("z_𝔽_induction_tac.fail.2",
	z_𝔽_induction_tac,
	ⓩ1⌝,
	gen_fail_msg "z_𝔽_induction_tac"  107032 ["ⓩ1⌝"])
];
=TEX
=SML
store_mt_results
mt_run_fail [
("z_seq_induction_tac.fail.3",
	tac_fail ( z_seq_induction_tac ⓩs ⦂ seq ℤ⌝),
	([ⓩs ∈ seq ℕ⌝],ⓩtrue⌝),
	gen_fail_msg "z_seq_induction_tac"  86404 ["ⓩs⌝"]),
("z_seq_induction_tac1.fail.3",
	tac_fail ( z_seq_induction_tac1 ⓩs ⦂ seq ℤ⌝),
	([ⓩs ∈ seq ℕ⌝],ⓩtrue⌝),
	gen_fail_msg "z_seq_induction_tac1"  86404 ["ⓩs⌝"]),
("z_𝔽_induction_tac.fail.3",
	tac_fail ( z_𝔽_induction_tac ⓩa ⦂ ℙ ℤ⌝),
	([ⓩa ∈ 𝔽 ℕ⌝],ⓩtrue⌝),
	gen_fail_msg "z_𝔽_induction_tac"  86404 ["ⓩa⌝"])
];
=TEX
=SML
store_mt_results
mt_run_fail [
("z_seq_induction_tac.fail.4",
	tac_fail ( z_seq_induction_tac ⓩs ⦂ seq ℤ⌝),
	([ⓩs ∈ seq ℕ⌝, ⓩs = ⟨1⟩⌝],ⓩs = ⟨1⟩⌝),
	gen_fail_msg "z_seq_induction_tac"  86403 ["ⓩs⌝"]),
("z_seq_induction_tac1.fail.4",
	tac_fail ( z_seq_induction_tac1 ⓩs ⦂ seq ℤ⌝),
	([ⓩs ∈ seq ℕ⌝, ⓩs = ⟨1⟩⌝],ⓩs = ⟨1⟩⌝),
	gen_fail_msg "z_seq_induction_tac1"  86403 ["ⓩs⌝"]),
("z_𝔽_induction_tac.fail.4",
	tac_fail ( z_𝔽_induction_tac ⓩa ⦂ ℙ ℤ⌝),
	([ⓩa ∈ 𝔽 ℕ⌝, ⓩa = {1}⌝],ⓩa = {1}⌝),
	gen_fail_msg "z_𝔽_induction_tac"  86403 ["ⓩa⌝"])
];
=TEX
\section{STRING EQUALITY}
=SML
fun tzsec tm1 tm2 = (
	let	val thm = z_string_eq_conv tm1;
		val res = mk_eq (tm1, tm2);
	in	asms thm = [] andalso concl thm = res
	end
);

store_mt_results
mt_run
[
	("2.7.1", tzsec ⓩ"" = ""⌝, ⓩtrue⌝, true),
	("2.7.2", tzsec ⓩ"a" = "a"⌝, ⓩtrue⌝, true),
	("2.7.3", tzsec ⓩ"abcd" = "abcd"⌝, ⓩtrue⌝, true),
	("2.7.4", tzsec ⓩ"abcd" = "abce"⌝, ⓩfalse⌝, true),
	("2.7.5", tzsec ⓩ"abcd" = "bbcd"⌝, ⓩfalse⌝, true),
	("2.7.6", tzsec ⓩ"abcd" = "accd"⌝, ⓩfalse⌝, true)
];
=TEX
=SML
store_mt_results
mt_run_fail [
("2.7.7",
	z_string_eq_conv,
	ⓩ(s ⦂ seq 𝕊) = "abc"⌝,
	gen_fail_msg "z_string_eq_conv"  107030 ["ⓩs = \"abc\"⌝"])
];


=TEX
\section{END OF TESTS}
=SML
(* set_flag("subgoal_package_quiet",false); *)
diag_string(summarize_mt_results ());
=TEX
\end{document}
=IGN

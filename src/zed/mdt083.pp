=IGN
********************************************************************************
mdt083.doc: this file is part of the PPZed system

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

\def\Title{Module Tests for Z Library Relations}

\def\AbstractText{This document gives the module tests for the Z Library Proof Support.}

\def\Reference{DS/FMU/IED/MDT083}

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
%% LaTeX2e port: \TPPtitle{Module Tests for Z Library Relations}
%% LaTeX2e port: \TPPref{DS/FMU/IED/MDT083}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.11 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2002/10/17 16:26:32 $ %
%% LaTeX2e port: }}  %% Mandatory field
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.~Blackburn & WIN01}  %% Mandatory field
%% LaTeX2e port: % \TPPauthors{K.~Blackburn & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document gives the module tests for the
%% LaTeX2e port: Z Library Proof Support.}
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
\item [Issue 1.1 (1992/10/21)]
First version.
\item [Issue 1.2 (1992/10/28) (@7th October 1992)]
Changes after comments - reorganisation of material
from 078 and 083.
\item [Issue 1.4 (1992/11/12), 12th November 1992]
Changes as a consequence of changes in dependences.
\item[Issue 1.5 (1992/12/03) (3rd December 1992)]
Improved $𝕌$ simplification.
\item[Issue 1.6 (1992/12/09) (9th December 1992)]
Accomodated changed treatment of generic predicates in UI.
\item[Issue 1.7 (1992/12/11) (11th December 1992)]
Global rename from wrk038.doc issue 1.9.
\item[Issue 1.8 (1993/02/10),1.9 (1993/02/12) (10th-12th February 1993)]
Reacting to changes in proof contexts, et al.
\item[Issue 1.10 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.11 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.12 (2004/01/19)] The Z universal set is now called 𝕌.
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
whose detailed design is given in \cite{DS/FMU/IED/DTD083}.
\subsection{Introduction}
This document contains the module tests for the material
whose detailed design is given in \cite{DS/FMU/IED/DTD083}.
This consists of demonstrating at least the simpler uses of the
functions in question.
\subsubsection{Dependencies}
The tests depend upon \cite{DS/FMU/IED/IMP083} and \cite{DS/FMU/IED/IMP013}.
In addition, testing by the subgoal package (section \ref{subgoalpackage})
depends on \cite{DS/FMU/IED/IMP030}.
\subsubsection{Deficiencies}
Only doing theory testing at present.
\section{TEST CASES}
The functions are tested in their order of presentation in the detailed design.
\section{PREAMBLE}
=SML
open_theory "z_relations";
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
val gen_term_of = snd o dest_pair;
=TEX
\section{TESTS}
=TEX
\section{TUPLES}
=SML
store_mt_results (mt_runf (op =$)) [("z_tuple_eq_conv a",
	snd o dest_eq o concl o z_tuple_eq_conv,
	ⓩ(a,b) = (1,2)⌝,
	ⓩa = 1 ∧ b = 2⌝),
	("z_tuple_eq_conv b",
	snd o dest_eq o concl o z_tuple_eq_conv,
	ⓩ(a ↦ b) = (1 ↦ 2)⌝,
	ⓩa = 1 ∧ b = 2⌝)];
store_mt_results mt_run_fail [("z_tuple_eq_conv 42003",
	z_tuple_eq_conv,
	mk_t,
	gen_fail_msg "z_tuple_eq_conv" 42003 [trues])
	];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [("z_tuple_eq_conv1 a",
	snd o dest_eq o concl o z_tuple_eq_conv1,
	ⓩ(a,b) = (1,2)⌝,
	ⓩa = 1 ∧ b = 2⌝),
	("z_tuple_eq_conv1 b",
	snd o dest_eq o concl o z_tuple_eq_conv1,
	ⓩ(a ↦ b) = (1 ↦ 2)⌝,
	ⓩa = 1 ∧ b = 2⌝),
	("z_tuple_eq_conv1 c",
	snd o dest_eq o concl o z_tuple_eq_conv1,
	ⓩa = (1 ↦ 2)⌝,
	ⓩ(a⦂{(1,2)}).1 = 1 ∧ a.2 = 2⌝)];
store_mt_results mt_run_fail [("z_tuple_eq_conv1 83001",
	z_tuple_eq_conv1,
	mk_t,
	gen_fail_msg "z_tuple_eq_conv1" 83001 [trues])
	];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [("z_sel⋎t_conv a",
	snd o dest_eq o concl o z_sel⋎t_conv,
	ⓩ(1,2,3).2⌝,
	ⓩ2⌝),
	("z_sel⋎t_conv b",
	snd o dest_eq o concl o z_sel⋎t_conv,
	ⓩ(1 ↦ 2).2⌝,
	ⓩ2⌝)];
store_mt_results mt_run_fail [("z_sel⋎t_conv 47185",
	z_sel⋎t_conv,
	mk_t,
	gen_fail_msg "z_sel⋎t_conv" 47185 [trues]),
	("z_sel⋎t_conv 42006",
	z_sel⋎t_conv,
	mk_z_sel⋎t (mk_var("t",type_of ⓩ(1,2,3)⌝),2),
	gen_fail_msg "z_sel⋎t_conv" 42006 [
		string_of_term(mk_z_sel⋎t (mk_var("t",type_of ⓩ(1,2,3)⌝),2))])
	];
=TEX
=SML
let
	val atuple = mk_var("t",type_of ⓩ(1,2)⌝);
in
store_mt_results (mt_runf (op =$)) [
	("z_tuple_intro_conv a",
	snd o dest_eq o concl o z_tuple_intro_conv,
	ⓩ(ⓜatuple⌝.1,ⓜatuple⌝.2)⌝,
	atuple),
	("z_tuple_intro_conv b",
	snd o dest_eq o concl o z_tuple_intro_conv,
	ⓩ(ⓜatuple⌝.1 ↦ ⓜatuple⌝.2)⌝,
	atuple)]
end;
store_mt_results mt_run_fail [("z_tuple_intro_conv 42005 a",
	z_tuple_intro_conv,
	mk_t,
	gen_fail_msg "z_tuple_intro_conv" 42005 [trues]),
	("z_tuple_intro_conv 42005 b",
	z_tuple_intro_conv,
	ⓩ(1,2,3)⌝,
	gen_fail_msg "z_tuple_intro_conv" 42005 [
		string_of_term ⓩ(1,2,3)⌝])
,
	("z_tuple_intro_conv 42005 c",
	z_tuple_intro_conv,
	ⓩ((1,2,3).1,(1,2,3).2)⌝,
	gen_fail_msg "z_tuple_intro_conv" 42005 [
		string_of_term ⓩ((1,2,3).1,(1,2,3).2)⌝])
	];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [("z_binding_eq_conv3",
	snd o dest_eq o concl o z_binding_eq_conv3,
	ⓩθ [x:X] = (x ≜ 1)⌝,
	ⓩ(x = 1)⌝)];
store_mt_results mt_run_fail [("z_binding_eq_conv3 42013",
	z_binding_eq_conv3,
	mk_t,
	gen_fail_msg "z_binding_eq_conv3" 42013 [trues])
	];
=TEX

\section{PROOF CONTEXTS}
The following test requires both new proof contexts:
=SML
val input_term = gen_term_of
⌜(X:'X SET,Y:'Y SET),
	ⓩ(R ∈ X ↔ Y) ⇒ (∀ x : X ⦁ x ∈ dom R ⇔ (∃ y : Y ⦁ (x,y) ∈ R))⌝⌝;
set_merge_pcs["z_sets_ext","'z_∈_rel"];
store_mt_results (mt_runf (op =$)) [("Proof Context Check",
	concl o prove_rule[] ,
	input_term,
	input_term)];
=TEX
=SML
set_pc "z_language";
set_pc "z_language_ext";
ⓈZ
rel	px _,py _, pz _
■
╒[X]
px _ : ℙ X;
py _ : ℙ X;
pz _ : ℙ X
└
┌S[X]─
x:X
├
px x
└
┌R[X]─
y:X
├
py y
└
┌I[X]─
y:X
├
py y
└
┌O[X]─
z:X
├
pz z
└
=SML
push_goal([],ⓩ[X] (∃[[S[X];(S[X])']; I[X];O[X]] | p x x' y z⦁ true) ⇔
	(∃ S[X];(S[X])'; I[X];O[X] | p x x' y z⦁ true)⌝);
a(REPEAT strip_tac);
(* 1 *)
a(z_∃_tac (gen_term_of⌜(X:'X SET), ⓩ(θ[[S[X];(S[X])']; I[X];O[X]])⌝⌝));
a(all_asm_ante_tac THEN rewrite_tac[]);
a(REPEAT z_strip_tac);
(* *** Goal "2" *** *)
a(z_∃_tac (gen_term_of⌜(X:'X SET), ⓩ(θ[[S[X];(S[X])']; I[X];O[X]])⌝⌝));
a(all_asm_ante_tac THEN rewrite_tac[]);
a(REPEAT z_strip_tac);
store_mt_results (mt_runf (op =$)) [("schema_proof_contexts",
	concl o pop_thm,
	(),
	ⓩ[X] (∃[[S[X];(S[X])']; I[X];O[X]] | p x x' y z⦁ true) ⇔
	(∃ S[X];(S[X])'; I[X];O[X] | p x x' y z⦁ true)⌝)
	];
=TEX
Check everything is there:
=SML
push_pc "'z_∈_rel";
set_pc "'z_rel_alg";
set_pc "'z_tuples";
set_pc "'z_elementwise_eq";
set_pc "z_language";
set_pc "z_language_ext";
set_pc "z_sets_ext";
set_pc "z_sets_alg";
set_pc "z_rel_ext";
pop_pc();
=TEX
\section{CHECK THE THEORY DESIGN}
=SML
use_file "dtd083.tch";
store_mt_results mt_run [("theory design of Z Library Relations",
	theory_check_success,
	(),
	true)];
=TEX
=SML
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


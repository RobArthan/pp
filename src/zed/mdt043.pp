=IGN
********************************************************************************
mdt043.doc: this file is part of the PPZed system

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

\def\Title{Module Tests for Z Language Schema Calculus}

\def\AbstractText{This document gives the module tests for the Z Language Schema Calculus and their proof support.}

\def\Reference{DS/FMU/IED/MDT043}

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
%% LaTeX2e port: \TPPtitle{Module Tests for Z Language Schema Calculus}
%% LaTeX2e port: \TPPref{DS/FMU/IED/MDT043}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.27 $ %
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2006/01/25 17:19:11 $ %
%% LaTeX2e port: }}  %% Mandatory field
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.~Blackburn & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{R.D.~Arthan & WIN01 \\ K.~Blackburn & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document gives the module tests for the
%% LaTeX2e port: Z Language Schema Calculus and their proof support.}
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
\item [Issue 1.1 (1992/10/28),1.2 (1992/10/30)]
First version.
\item[Issue 1.3 (1992/11/02) (2nd November 1992)]
Changes due to parser changes for $ⓩ(S[𝕌])'⌝$ in a declaration.
\item [Issue 1.4 (1992/11/12), 11th November 1992]
Changes as a consequence of changes in dependences.
\item [Issue 1.5 (1992/11/30), 20th November 1992]
Completing the Schema Calculus.
\item [Issue 1.6 (1992/12/01), 1st December 1992]
Improving schema quantification.
\item [Issue 1.7 (1992/12/03), 3rd December 1992]
Lost $∈\_C$, and $Z\-\_∈\-\_ELIM\-\_C$.
\item [Issue 1.8 (1992/12/08), 7th December 1992]
Fixing problems from changes to generic formals.
\item[Issue 1.9 (1992/12/09) (8th December 1992)]
Improvements to handling of schemas as predicates,
bindings.
Removed proof context for extensional treatment of schemas.
\item[Issue 1.11 (1992/12/11) (10th December 1992)]
Global rename from wrk038.doc issue 1.9.
\item[Issue 1.12 (1992/12/18) (18th December 1992)]
Changed treatment of $⨾⋎s$.
\item[Issue 1.13 (1993/01/20) (20th January 1993)]
Gained $z\_strip\_tac$.
\item[Issue 1.14 (1993/01/21) (25th January 1993)]
Reacting to improved variable introduction.
\item[Issue 1.16 (1993/02/10) (10th February 1993)]
Reacting to changes in proof contexts, et al.
\item[Issue 1.17 (1993/02/23) (23rd February 1993)]
Properly tested a documented failing of
$z\_∈\_h\_schema\_conv1$, rather than calling it a known bug.
\item[Issue 1.18 (1993/07/07) (7th July 1993)]
Corrected test for
$z\_h\_schema\_pred\_conv$, which previously allowed for a bug in the abstract
machine, which has now been fixed.
\item[Issue 1.18 (1993/07/07) (4th November 1994)]
Tested new conversion for massaging ill-formed schemas-as-declarations back into Z.
\item[Issue 1.20 (1994/11/04)]
Added tests for message 43035.
\item[Issue 1.22 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.23 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.24 (2004/01/19)] The Z universal set is now called 𝕌.
\item[Issue 1.25 (2005/08/05)] Added tests for liberalised schema quantification.
\item[Issue 1.27 (2006/01/25)] The name of the decoration operator is now based on the stem {\em decor} throughout, rather than {\em decor} in some places and {\em dec} in others.
\item[Issue 1.28 (2010/04/01)] Added tests for empty schemas.
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
whose detailed design is given in \cite{DS/FMU/IED/DTD043}.
\subsection{Introduction}
This document contains the module tests for the material
whose detailed design is given in \cite{DS/FMU/IED/DTD043}.
This consists of demonstrating at least the simpler uses of the
functions in question.
\subsubsection{Dependencies}
The tests depend upon \cite{DS/FMU/IED/IMP043} and \cite{DS/FMU/IED/IMP013}.
They also unfortunately rely on the definitions of $⦂$ and $Π$
from \cite{DS/FMU/IED/DTD078}.
In addition, testing by the subgoal package (section \ref{subgoalpackage})
depends on \cite{DS/FMU/IED/IMP030}.
\subsubsection{Deficiencies}
None known.
\section{TEST CASES}
The functions are, where appropriate, tested in their order of presentation in the detailed design.
\section{PREAMBLE}
=SML
open_theory "z_sets";
delete_theory "temp" handle _ => ();
new_theory "temp";
push_pc "z_predicates";
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
┌Q[X]─
z:X
├
pz z
└
┌DS[X]─
x:X;
x':X
├
px x ∧ px x'
└

=SML
val aset = ⓩ{a,b:X; c:Y | ¬(a = b) ⦁ (a,b,c)}⌝;
val (asetd, asetp, asetv) = dest_z_seta aset;
val atuple3 = ⓩ((p ⦂ a),(q ⦂ a),(r ⦂ b))⌝;
val notz = ⌜∃ x ⦁ x = y⌝;
val trues = string_of_term mk_t;
val notzs = string_of_term notz;
val ss=string_of_term ⓩS⌝;
val ∈_ss=string_of_term ⓩ(x ≜ x1) ∈ S⌝;
=TEX
\section{TESTS}
=TEX
\subsection{Stripping}
=SML
store_mt_results (mt_runf (op =$)) [
	("z_strip_tac 1",
	tac_res z_strip_tac,
	(snd(strip_∀ ⓩ[X,Y] (∀ x:X; y,z:Y | p x ⦁ y = z)⌝)),
	(snd(strip_∀ ⓩ[X,Y] (x ∈ X ∧ {y,z} ⊆ Y) ∧ p x ⇒ y = z⌝))
	),
	("z_strip_tac 2",
	tac_res z_strip_tac,
	ⓩtrue ⇒ (a ≜ a, b ≜ b) ∈ [a,b:𝕌]⌝,
	ⓩΠ [a,b:𝕌]⌝
	)
];
store_mt_results mt_run_fail [
	("z_strip_tac 28003",
	z_strip_tac,
	([],mk_f),
	gen_fail_msg "z_strip_tac" 28003 [string_of_term mk_f]
	)
];
=TEX
\subsection{Horizontal Schemas}
=SML
store_mt_results (mt_runf (op =$)) [
	("z_∈_h_schema_conv1 1",
	snd o dest_eq o concl o z_∈_h_schema_conv1,
	(snd(strip_∀ ⓩ[X] y ∈ [z:X; S[X]; (S[X])'| x = z]⌝)),
	(snd(strip_∀ ⓩ[X] (∃ z : X; S[X]; (S[X])' | x = z ⦁
		θ[z : X; S[X]; (S[X])'] = y)⌝))
	),
	("z_∈_h_schema_conv1 2",
	snd o dest_eq o concl o z_∈_h_schema_conv1,
	ⓩy ∈ [ | p]⌝,
	ⓩ(∃ | p ⦁ θ[] = y)⌝
	)
];
let val fail_term = ⓩ(x ≜ x, x' ≜ x', z ≜ z) ∈
	[z : X; (S[X]); (S[X])' | x = z]⌝;
in
store_mt_results mt_run_fail [
	("z_∈_h_schema_conv1 43033",
	snd o dest_eq o concl o z_∈_h_schema_conv1,
	(snd(strip_∀ ⓩ[X] (Π [z:X; S[X]; (S[X])'| x = z])⌝)),
	gen_fail_msg "z_∈_h_schema_conv1" 43033 [string_of_term fail_term]
	)
]
end;
store_mt_results mt_run_fail [
	("z_∈_h_schema_conv1 43003",
	z_∈_h_schema_conv1,
	mk_t,
	gen_fail_msg "z_∈_h_schema_conv1" 43003 [trues]
	)
];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_∈_h_schema_conv 1",
	snd o dest_eq o concl o z_∈_h_schema_conv,
	(snd(strip_∀ ⓩ[X] y ∈ [z:X; S[X]; ((S[X])')| x = z]⌝)),
	(snd(strip_∀ ⓩ[X] ((y⦂[z:X; S[X]; ((S[X])')]).z ∈ X ∧
		(x ≜ y.x) ∈ S[X] ∧
		(x' ≜ y.x') ∈ (S[X])')
	∧ y.x = y.z⌝))
	),
	("z_∈_h_schema_conv 2",
	snd o dest_eq o concl o z_∈_h_schema_conv,
	(snd(strip_∀ ⓩ[X] (Π [z:X; S[X]; ((S[X])')| x = z])⌝)),
	(snd(strip_∀ ⓩ[X] (z ∈ X ∧
		(x ≜ x) ∈ S[X] ∧
		(x' ≜ x') ∈ (S[X])')
	∧ x = z⌝))
	),
	("z_∈_h_schema_conv 3",
	snd o dest_eq o concl o z_∈_h_schema_conv,
	ⓩy ∈ [ | p]⌝,
	ⓩtrue ∧ p⌝
	)
];
store_mt_results mt_run_fail [
	("z_∈_h_schema_conv 43003",
	z_∈_h_schema_conv,
	mk_t,
	gen_fail_msg "z_∈_h_schema_conv" 43003 [trues]
	)
];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_h_schema_conv 1",
	snd o dest_eq o concl o z_h_schema_conv,
	ⓩ[z:X; S[X]; (S[X])'| x = z]⌝,
	ⓩ{z : X; S[X]; (S[X])' | x = z ⦁ θ[z : X; S[X]; (S[X])']}⌝
	),
	("z_h_schema_conv 2",
	snd o dest_eq o concl o z_h_schema_conv,
	ⓩ[ | p]⌝,
	ⓩ{ | p ⦁ θ[]}⌝
	)
];
store_mt_results mt_run_fail [
	("z_h_schema_conv 43004",
	z_h_schema_conv,
	mk_t,
	gen_fail_msg "z_h_schema_conv" 43004 [trues]
	)
];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_norm_h_schema_conv",
	snd o dest_eq o concl o z_norm_h_schema_conv,
	ⓩ[x,y1:X; z: Y; p,q : 𝕌; r : 𝕌; S[X]; ((S[X])') | x1 = x]⌝,
	inst [] [(ⓣ'd⌝,ⓣ'c⌝), (ⓣ'c⌝,ⓣ'b⌝), (ⓣ'c⌝,ⓣ'a⌝),
		(ⓣ'a⌝,ⓣ'd⌝), (ⓣ'b⌝,ⓣ'e⌝)]
	ⓩ[p : 𝕌; q : 𝕌; r : 𝕌; x : 𝕌; x' : 𝕌; y1 : 𝕌; z : 𝕌
      | (({x, y1} ⊆ X) ∧ z ∈ Y ∧ (x ≜ x) ∈ S[X] ∧
		(x' ≜ x') ∈ (S[X])') ∧ x1 = x]⌝
	)
];
store_mt_results mt_run_fail [
	("z_norm_h_schema_conv 43004",
	z_norm_h_schema_conv,
	mk_t,
	gen_fail_msg "z_norm_h_schema_conv" 43004 [trues]
	)
];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_h_schema_pred_conv 1",
	snd o dest_eq o concl o z_h_schema_pred_conv,
	(snd(strip_∀ ⓩ[X] ⓜmk_z_schema_pred( ⓩ[z:X; S[X];
		((S[X])')| x = z]⌝,"")⌝⌝)),
	(snd(strip_∀ ⓩ[X] (z ∈ X
      ∧ (x ≜ x) ∈ S[X]
      ∧ (x' ≜ x') ∈ (S[X])')
      ∧ x = z ⌝))
	),
	("z_h_schema_pred_conv 2",
	snd o dest_eq o concl o z_h_schema_pred_conv,
	(snd(strip_∀ ⓩ[X] ⓜ(mk_z_schema_pred( ⓩ[zz,z:X; S[X];
		((S[X])')| x = z]⌝,"'"))⌝⌝)),
	(snd(strip_∀ ⓩ[X] (({zz', z'} ⊆ X)
      ∧ (x ≜ x') ∈ S[X]
      ∧ (x' ≜ x'') ∈ (S[X])')
      ∧ x'
        = z'⌝))
	),
	("z_h_schema_pred_conv 3",
	snd o dest_eq o concl o z_h_schema_pred_conv,
	(snd(strip_∀ ⓩ[X] ⓜ(mk_z_schema_pred(
		mk_z_decor⋎s(ⓩ[z:X; S[X]; ((S[X])')| x = z]⌝,"'"),""))⌝⌝)),
	(snd(strip_∀ ⓩ[X](z' ∈ X
      ∧ (x ≜ x') ∈ S[X]
      ∧ (x' ≜ x'') ∈ (S[X])')
      ∧ x' = z'⌝))
	),
	("z_h_schema_pred_conv 4",
	snd o dest_eq o concl o z_h_schema_pred_conv,
	mk_z_schema_pred(mk_z_decor⋎s(ⓩ[ | p]⌝,"'"),""),
	ⓩtrue ∧ p⌝
	)
];
store_mt_results mt_run_fail [
	("z_h_schema_pred_conv 43012",
	z_h_schema_pred_conv,
	mk_t,
	gen_fail_msg "z_h_schema_pred_conv" 43012 [trues]
	)
];
=TEX
\subsection{Operators on Schemas}
=SML
store_mt_results (mt_runf (op =$)) [
	("z_θ_∈_schema_conv 1",
	snd o dest_eq o concl o z_θ_∈_schema_conv,
	ⓩθS ∈ S⌝,
	mk_z_schema_dec(ⓩS⌝,"")
	),
	("z_θ_∈_schema_conv 2",
	snd o dest_eq o concl o z_θ_∈_schema_conv,
	ⓩθ[] ∈ []⌝,
	mk_z_schema_dec(ⓩ[]⌝,"")
	)
];
store_mt_results mt_run_fail [
	("z_θ_∈_schema_conv 43002",
	z_θ_∈_schema_conv,
	mk_t,
	gen_fail_msg "z_θ_∈_schema_conv" 43002 [trues]
	)
];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_θ_∈_schema_intro_conv 1",
	snd o dest_eq o concl o z_θ_∈_schema_intro_conv,
	(mk_z_schema_pred( ⓩS⌝,"")),
	ⓩθS ∈ S⌝
	),
	("z_θ_∈_schema_intro_conv 2",
	snd o dest_eq o concl o z_θ_∈_schema_intro_conv,
	(mk_z_schema_pred( ⓩS⌝,"'")),
	ⓩθS' ∈ S⌝
	),
	("z_θ_∈_schema_intro_conv 3",
	snd o dest_eq o concl o z_θ_∈_schema_intro_conv,
	(mk_z_schema_pred( mk_z_decor⋎s((inst []
		[(ⓣ'X⌝,ⓣ'a⌝)] ⓩS[X]⌝),"'"),"")),
	(snd(strip_∀ ⓩ[X] ⓜmk_z_θ(ⓩ(S[X])'⌝,"")⌝ ∈ ((S[X])')⌝))
	),
	("z_θ_∈_schema_intro_conv 4",
	snd o dest_eq o concl o z_θ_∈_schema_intro_conv,
	(mk_z_schema_pred( ⓩ[]⌝,"")),
	ⓩθ[] ∈ []⌝
	)
];
store_mt_results mt_run_fail [
	("z_θ_∈_schema_intro_conv 43014",
	z_θ_∈_schema_intro_conv,
	mk_t,
	gen_fail_msg "z_θ_∈_schema_intro_conv" 43014 [trues]
	)
];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_schema_pred_conv 1",
	snd o dest_eq o concl o z_schema_pred_conv,
	(mk_z_schema_pred( ⓩS⌝,"")),
	ⓩθS ∈ S⌝
	),
	("z_schema_pred_conv 2",
	snd o dest_eq o concl o z_schema_pred_conv,
	(mk_z_schema_pred( ⓩS⌝,"'")),
	ⓩθS' ∈ S⌝
	),
	("z_schema_pred_conv 3",
	snd o dest_eq o concl o z_schema_pred_conv,
	(mk_z_schema_pred( mk_z_decor⋎s(inst [] [(ⓣ'X⌝,ⓣ'a⌝)]
		ⓩS[X]⌝,"'"),"")),
	(snd(strip_∀ ⓩ[X] ⓜmk_z_θ(inst [] [(ⓣ'X⌝,ⓣ'a⌝)]
		ⓩ(S[X])'⌝,"")⌝ ∈ ((S[X])')⌝))
	),
	("z_schema_pred_conv 4",
	snd o dest_eq o concl o z_θ_∈_schema_intro_conv,
	(mk_z_schema_pred( ⓩ[]⌝,"")),
	ⓩθ[] ∈ []⌝
	)
];
store_mt_results mt_run_fail [
	("z_schema_pred_conv 43014",
	z_schema_pred_conv,
	mk_t,
	gen_fail_msg "z_θ_∈_schema_intro_conv" 43014 [trues]
	)
];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_schema_pred_intro_conv 1",
	snd o dest_eq o concl o z_schema_pred_intro_conv,
	(snd(strip_∀ ⓩ[X] (x ≜ x) ∈ S[X]⌝)),
	(snd(strip_∀ ⓩ[X] (ΠS[X])⌝))
	),
	("z_schema_pred_intro_conv 2",
	snd o dest_eq o concl o z_schema_pred_intro_conv,
	ⓩ() ∈ []⌝,
	ⓩΠ[]⌝
	)
];
store_mt_results mt_run_fail [
	("z_schema_pred_intro_conv 43032",
	z_schema_pred_intro_conv,
	mk_t,
	gen_fail_msg "z_schema_pred_intro_conv" 43032 [trues]
	)
];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_θ_conv 1",
	snd o dest_eq o concl o z_θ_conv,
	ⓩθ DS⌝,
	ⓩ(x ≜ (x ⦂ a), x' ≜ (x' ⦂ a))⌝
	),
	("z_θ_conv 2",
	snd o dest_eq o concl o z_θ_conv,
	ⓩθ []⌝,
	ⓩ()⌝
	)
];
store_mt_results mt_run_fail [
	("z_θ_conv 43010",
	z_θ_conv,
	mk_t,
	gen_fail_msg "z_θ_conv" 43010 [trues]
	)
];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_θ_conv1 1",
	snd o dest_eq o concl o z_θ_conv1,
	⌜$"Z'θ" ⓩ(x ≜ 1, y ≜ 2)⌝ ⓩ[x,y:X]⌝⌝,
	ⓩ(x ≜ 1, y ≜ 2)⌝
	)
];
store_mt_results mt_run_fail [
	("z_θ_conv1 43011.1",
	z_θ_conv1,
	ⓩθ DS⌝,
	gen_fail_msg "z_θ_conv1" 43011 [string_of_term ⓩθ DS⌝]
	),
	("z_θ_conv1 43011.2",
	z_θ_conv1,
	ⓩθ []⌝,
	gen_fail_msg "z_θ_conv1" 43011 [string_of_term ⓩθ []⌝]
	)
];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_θ_eq_conv 1",
	snd o dest_eq o concl o z_θ_eq_conv,
	ⓩθ TEST_SCHEMA = θ (TEST_SCHEMA) '⌝,
	ⓩx = x' ∧ y = y'⌝
	),
	("z_θ_eq_conv 2",
	snd o dest_eq o concl o z_θ_eq_conv,
	ⓩ(x ≜ 1, y ≜ 2) = θ (TEST_SCHEMA) '⌝,
	ⓩ1 = x' ∧ 2 = y'⌝
	),
	("z_θ_eq_conv 3",
	snd o dest_eq o concl o z_θ_eq_conv,
	ⓩ() = θ []⌝,
	ⓩtrue⌝
	)
];
store_mt_results mt_run_fail [
	("z_θ_eq_conv 43010",
	z_θ_eq_conv,
	mk_t,
	gen_fail_msg "z_θ_eq_conv" 43034 [trues]
	)
];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_∈_decor⋎s_conv 1",
	snd o dest_eq o concl o z_∈_decor⋎s_conv,
	(snd(strip_∀ ⓩ[X] p ∈ ⓜ(mk_z_decor⋎s(inst []
		[(ⓣ'X⌝,ⓣ'c⌝)] ⓩ[z:X; S[X]; (S[X])'| x = z]⌝,"'"))⌝⌝)),
	(snd(strip_∀ ⓩ[X] (x ≜ (p ⦂ [x',x'':X; z':X]).x',
		x' ≜ p.x'', z ≜ p.z') ∈ [z : X; S[X]; (S[X])' | x = z]⌝))
	),
	("z_∈_decor⋎s_conv 2",
	snd o dest_eq o concl o z_∈_decor⋎s_conv,
	(snd(strip_∀ ⓩ[X] (Π ⓜmk_z_schema_pred(mk_z_decor⋎s
		(inst [] [(ⓣ'X⌝,ⓣ'c⌝)]
		ⓩ[z:X; S[X]; (S[X])'| x = z]⌝,"'"),"")⌝)⌝)),
	(snd(strip_∀ ⓩ[X] (x ≜ x', x' ≜ x'', z ≜ z') ∈
		[z : X; S[X]; (S[X])' | x = z]⌝))
	),
	("z_∈_decor⋎s_conv 3",
	snd o dest_eq o concl o z_∈_decor⋎s_conv,
	ⓩx ∈ ⓜ(mk_z_decor⋎s(ⓩ[([])' | p]⌝,"'"))⌝⌝,
	ⓩ() ∈ [[] | p]⌝
	),
	("z_∈_decor⋎s_conv 4",
	snd o dest_eq o concl o z_∈_decor⋎s_conv,
	ⓩ(Π ⓜmk_z_schema_pred(mk_z_decor⋎s(ⓩ[ | p]⌝,"'"),"")⌝)⌝,
	ⓩ() ∈ [ | p]⌝
	)
];
store_mt_results mt_run_fail [
	("z_∈_decor⋎s_conv 43015",
	z_∈_decor⋎s_conv,
	mk_t,
	gen_fail_msg "z_∈_decor⋎s_conv" 43015 [trues]
	)
];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_decor⋎s_conv 1",
	snd o dest_eq o concl o z_decor⋎s_conv,
	(mk_z_decor⋎s(ⓩ[z:X; S[X]; (S[X])'| x = z]⌝,"'")),
	ⓩ{x1 : 𝕌; x2 : 𝕌; x3 : 𝕌
      | (x ≜ x1, x' ≜ x2, z ≜ x3) ∈ [z : X; (S[X]); (S[X])' | x = z]
      ⦁ (x' ≜ x1, x'' ≜ x2, z' ≜ x3)}⌝
	),
	("z_decor⋎s_conv 2",
	snd o dest_eq o concl o z_decor⋎s_conv,
	mk_z_decor⋎s(ⓩ[ | p]⌝,"'"),
	ⓩ{ | () ∈ [ | p]}⌝
	)
];
store_mt_results mt_run_fail [
	("z_decor⋎s_conv 42027",
	z_decor⋎s_conv,
	mk_t,
	gen_fail_msg "Z_∈_ELIM_C" 42027 [trues]
	),
	("z_decor⋎s_conv 43015",
	z_decor⋎s_conv,
	ⓩS⌝,
	gen_fail_msg "z_∈_decor⋎s_conv" 43015 [∈_ss]
	)
];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_pre⋎s_conv 1",
	snd o dest_eq o concl o z_pre⋎s_conv,
	ⓩ(pre (DS[X]))⌝,
	ⓩ[x:(𝕌 ⦂ ℙ X) | ∃ x' :(𝕌 ⦂ ℙ X) ⦁ DS[X]]⌝
	),
	("z_pre⋎s_conv 2",
	snd o dest_eq o concl o z_pre⋎s_conv,
	ⓩ(pre S[X])⌝,
	ⓩ[x:(𝕌 ⦂ ℙ X) | ∃ ⦁ S[X]]⌝
	),
	("z_pre⋎s_conv 3",
	snd o dest_eq o concl o z_pre⋎s_conv,
	ⓩ(pre (S[X])')⌝,
	ⓩ[ | ∃ x':(𝕌 ⦂ ℙ X) ⦁ (S[X])']⌝
	),
	("z_pre⋎s_conv 4",
	snd o dest_eq o concl o z_pre⋎s_conv,
	ⓩ(pre [])⌝,
	ⓩ[ | ∃ ⦁ []]⌝
	)
];
store_mt_results mt_run_fail [
	("z_pre⋎s_conv 43007",
	z_pre⋎s_conv,
	mk_t,
	gen_fail_msg "z_pre⋎s_conv" 43007 [trues]
	)
];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_∈_pre⋎s_conv 1",
	snd o dest_eq o concl o z_∈_pre⋎s_conv,
	(snd(strip_∀ ⓩ[X]v ∈ (pre [x,x':X | x = x'])⌝)),
	(snd(strip_∀ ⓩ[X]v ∈ [x:(𝕌 ⦂ ℙ X) | ∃ x' :(𝕌 ⦂ ℙ X) ⦁
		 [x,x':X | x = x']]⌝))
	),
	("z_∈_pre⋎s_conv 2",
	snd o dest_eq o concl o z_∈_pre⋎s_conv,
	(snd(strip_∀ ⓩ[X] (Π (pre [x,x':X | x = x']))⌝)),
	(snd(strip_∀ ⓩ[X] (x ≜ x) ∈ [x:(𝕌 ⦂ ℙ X) | ∃ x' :(𝕌 ⦂ ℙ X) ⦁
		 [x,x':X | x = x']]⌝))
	),
	("z_∈_pre⋎s_conv 3",
	snd o dest_eq o concl o z_∈_pre⋎s_conv,
	(snd(strip_∀ ⓩ[X]v ∈ (pre [x:X | x = c])⌝)),
	(snd(strip_∀ ⓩ[X]v ∈ [x:(𝕌 ⦂ ℙ X) | ∃ ⦁ [x:X | x = c]]⌝))
	),
	("z_∈_pre⋎s_conv 4",
	snd o dest_eq o concl o z_∈_pre⋎s_conv,
	(snd(strip_∀ ⓩ[X] (Π (pre [x':X | x' = c]))⌝)),
	(snd(strip_∀ ⓩ[X] () ∈ [ | ∃ x':(𝕌 ⦂ ℙ X) ⦁ [x':X | x' = c]]⌝))
	),
	("z_∈_pre⋎s_conv 5",
	snd o dest_eq o concl o z_∈_pre⋎s_conv,
	ⓩ(Π (pre [ | p]))⌝,
	ⓩ() ∈ [ | ∃ ⦁ [ | p]]⌝
	)
];
store_mt_results mt_run_fail [
	("z_∈_pre⋎s_conv 42028",
	z_∈_pre⋎s_conv,
	mk_t,
	gen_fail_msg "∈_C" 42028 [trues]
	),
	("z_∈_pre⋎s_conv 43007",
	z_∈_pre⋎s_conv,
	ⓩx ∈ S⌝,
	gen_fail_msg "z_pre⋎s_conv" 43007 [ss]
	)
];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_Δ⋎s_conv 1",
	snd o dest_eq o concl o z_Δ⋎s_conv,
	ⓩΔ S[X]⌝,
	ⓩ[S[X];S'[X]]⌝
	),
	("z_Δ⋎s_conv 2",
	snd o dest_eq o concl o z_Δ⋎s_conv,
	ⓩΔ []⌝,
	ⓩ[[]; []]⌝
	)
];
store_mt_results mt_run_fail [
	("z_Δ⋎s_conv 43022",
	z_Δ⋎s_conv,
	mk_t,
	gen_fail_msg "z_Δ⋎s_conv" 43022 [trues]
	)
];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_∈_Δ⋎s_conv 1",
	snd o dest_eq o concl o z_∈_Δ⋎s_conv,
	ⓩp ∈ (Δ S[X])⌝,
	ⓩp ∈ [S[X];S'[X]]⌝
	),
	("z_∈_Δ⋎s_conv 2",
	snd o dest_eq o concl o z_∈_Δ⋎s_conv,
	ⓩΠ (Δ S[X])⌝,
	ⓩ(x ≜ x, x' ≜ x') ∈ [S[X];S'[X]]⌝
	),
	("z_∈_Δ⋎s_conv 3",
	snd o dest_eq o concl o z_∈_Δ⋎s_conv,
	ⓩp ∈ (Δ [])⌝,
	ⓩp ∈ [[]; []]⌝
	),
	("z_∈_Δ⋎s_conv 4",
	snd o dest_eq o concl o z_∈_Δ⋎s_conv,
	ⓩΠ (Δ [])⌝,
	ⓩ() ∈ [[]; []]⌝
	)
];
store_mt_results mt_run_fail [
	("z_∈_Δ⋎s_conv 42028",
	z_∈_Δ⋎s_conv,
	mk_t,
	gen_fail_msg "∈_C" 42028 [trues]
	),
	("z_∈_Δ⋎s_conv 43022",
	z_∈_Δ⋎s_conv,
	ⓩx ∈ S⌝,
	gen_fail_msg "z_Δ⋎s_conv" 43022 [ss]
	)
];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_Ξ⋎s_conv 1",
	snd o dest_eq o concl o z_Ξ⋎s_conv,
	ⓩΞ S[X]⌝,
	ⓩ[(S[X]); (S[X])' | θ(S[X]) = θ(S[X])']⌝
	),
	("z_Ξ⋎s_conv 2",
	snd o dest_eq o concl o z_Ξ⋎s_conv,
	ⓩΞ []⌝,
	ⓩ[[]; [] | θ[] = θ[]]⌝
	)
];
store_mt_results mt_run_fail [
	("z_Ξ⋎s_conv 43023",
	z_Ξ⋎s_conv,
	mk_t,
	gen_fail_msg "z_Ξ⋎s_conv" 43023 [trues]
	)
];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_∈_Ξ⋎s_conv 1",
	snd o dest_eq o concl o z_∈_Ξ⋎s_conv,
	ⓩp ∈ (Ξ S[X])⌝,
	ⓩp ∈ [(S[X]); (S[X])' | θ(S[X]) = θ(S[X])']⌝
	),
	("z_∈_Ξ⋎s_conv 2",
	snd o dest_eq o concl o z_∈_Ξ⋎s_conv,
	ⓩΠ (Ξ S[X])⌝,
	ⓩ(x ≜ x, x' ≜ x') ∈ [(S[X]); (S[X])' | θ(S[X]) = θ(S[X])']⌝
	),
	("z_∈_Ξ⋎s_conv 3",
	snd o dest_eq o concl o z_∈_Ξ⋎s_conv,
	ⓩp ∈ (Ξ [])⌝,
	ⓩp ∈ [[]; [] | θ[] = θ[]]⌝
	),
	("z_∈_Ξ⋎s_conv 4",
	snd o dest_eq o concl o z_∈_Ξ⋎s_conv,
	ⓩΠ (Ξ [])⌝,
	ⓩ() ∈ [[]; [] | θ[] = θ[]]⌝
	)
];
store_mt_results mt_run_fail [
	("z_∈_Ξ⋎s_conv 42028",
	z_∈_Ξ⋎s_conv,
	mk_t,
	gen_fail_msg "∈_C" 42028 [trues]
	),
	("z_∈_Ξ⋎s_conv 43023",
	z_∈_Ξ⋎s_conv,
	ⓩx ∈ S⌝,
	gen_fail_msg "z_Ξ⋎s_conv" 43023 [ss]
	)
];
=TEX

\section{SCHEMA CALCULUS PREDICATES}
=SML
store_mt_results (mt_runf (op =$)) [
	("z_∈_∧⋎s_conv 1",
	snd o dest_eq o concl o z_∈_∧⋎s_conv,
	ⓩp ∈ (([x:𝕌; y:𝕌| f x y] ∧ [y:𝕌;z:𝕌 | g y z])⦂𝕌)⌝,
	ⓩ(x ≜ (p⦂[x:𝕌;y:𝕌;z:𝕌]).x, y ≜ p.y) ∈ [x : 𝕌; y : 𝕌 | f x y]
	 ∧ (y ≜ p.y, z ≜ p.z) ∈ [y : 𝕌; z : 𝕌 | g y z]⌝
	),
	("z_∈_∧⋎s_conv 2",
	snd o dest_eq o concl o z_∈_∧⋎s_conv,
	ⓩΠ (([x:𝕌; y:𝕌| f x y] ∧ [y:𝕌;z:𝕌 | g y z])⦂𝕌)⌝,
	ⓩ(x ≜ x, y ≜ y) ∈ [x : 𝕌; y : 𝕌 | f x y]
	 ∧ (y ≜ y, z ≜ z) ∈ [y : 𝕌; z : 𝕌 | g y z]⌝
	),
	("z_∈_∧⋎s_conv 3",
	snd o dest_eq o concl o z_∈_∧⋎s_conv,
	ⓩp ∈ (([] ∧ [y:𝕌;z:𝕌 | g y z])⦂𝕌)⌝,
	ⓩ() ∈ []
	 ∧ (y ≜ (p⦂[y:𝕌;z:𝕌]).y, z ≜ p.z) ∈ [y : 𝕌; z : 𝕌 | g y z]⌝
	),
	("z_∈_∧⋎s_conv 4",
	snd o dest_eq o concl o z_∈_∧⋎s_conv,
	ⓩΠ (([x:𝕌; y:𝕌| f x y] ∧ [])⦂𝕌)⌝,
	ⓩ(x ≜ x, y ≜ y) ∈ [x : 𝕌; y : 𝕌 | f x y]
	 ∧ () ∈ []⌝
	),
	("z_∈_∧⋎s_conv 5",
	snd o dest_eq o concl o z_∈_∧⋎s_conv,
	ⓩΠ (([ | p] ∧ [ | q])⦂𝕌)⌝,
	ⓩ() ∈ [ | p] ∧ () ∈ [ | q]⌝
	)
];
store_mt_results mt_run_fail [
	("z_∈_∧⋎s_conv 43001",
	z_∈_∧⋎s_conv,
	mk_t,
	gen_fail_msg "z_∈_∧⋎s_conv" 43001 [trues]
	)
];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_∧⋎s_conv 1",
	snd o dest_eq o concl o z_∧⋎s_conv,
	ⓩ(([x:𝕌; y:𝕌| f x y] ∧ [y:𝕌;z:𝕌 | g y z])⦂𝕌)⌝,
	ⓩ{x1 : 𝕌; x2 : 𝕌; x3 : 𝕌
	  | (x ≜ x1, y ≜ x2) ∈ [x : 𝕌; y : 𝕌 | f x y]
	    ∧ (y ≜ x2, z ≜ x3) ∈ [y : 𝕌; z : 𝕌 | g y z]
	  ⦁ (x ≜ x1, y ≜ x2, z ≜ x3)}⌝
	),
	("z_∧⋎s_conv 2",
	snd o dest_eq o concl o z_∧⋎s_conv,
	ⓩ(([x:𝕌; y:𝕌| f x y] ∧ [ | q])⦂𝕌)⌝,
	ⓩ{x1 : 𝕌; x2 : 𝕌
	  | (x ≜ x1, y ≜ x2) ∈ [x : 𝕌; y : 𝕌 | f x y]
	    ∧ () ∈ [ | q]
	  ⦁ (x ≜ x1, y ≜ x2)}⌝
	),
	("z_∧⋎s_conv 3",
	snd o dest_eq o concl o z_∧⋎s_conv,
	ⓩ(([ | p] ∧ [y:𝕌;z:𝕌 | g y z])⦂𝕌)⌝,
	ⓩ{x1 : 𝕌; x2 : 𝕌
	  | () ∈ [ | p]
	    ∧ (y ≜ x1, z ≜ x2) ∈ [y:𝕌;z:𝕌 | g y z]
	  ⦁ (y ≜ x1, z ≜ x2)}⌝
	),
	("z_∧⋎s_conv 4",
	snd o dest_eq o concl o z_∧⋎s_conv,
	ⓩ(([ | p] ∧ [ | q])⦂𝕌)⌝,
	ⓩ{ | () ∈ [ | p] ∧ () ∈ [ | q]}⌝
	)
];
store_mt_results mt_run_fail [
	("z_∧⋎s_conv 42027",
	z_∧⋎s_conv,
	mk_t,
	gen_fail_msg "Z_∈_ELIM_C" 42027 [trues]
	),
	("z_∧⋎s_conv 43001",
	z_∧⋎s_conv,
	ⓩS⌝,
	gen_fail_msg "z_∈_∧⋎s_conv" 43001 [∈_ss]
	)
];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_∈_∨⋎s_conv 1",
	snd o dest_eq o concl o z_∈_∨⋎s_conv,
	ⓩp ∈ (([x:𝕌; y:𝕌| f x y] ∨ [y:𝕌;z:𝕌 | g y z])⦂𝕌)⌝,
	ⓩ(x ≜ (p⦂[x:𝕌;y:𝕌;z:𝕌]).x, y ≜ p.y) ∈ [x : 𝕌; y : 𝕌 | f x y]
	 ∨ (y ≜ p.y, z ≜ p.z) ∈ [y : 𝕌; z : 𝕌 | g y z]⌝
	),
	("z_∈_∨⋎s_conv 2",
	snd o dest_eq o concl o z_∈_∨⋎s_conv,
	ⓩΠ (([x:𝕌; y:𝕌| f x y] ∨ [y:𝕌;z:𝕌 | g y z])⦂𝕌)⌝,
	ⓩ(x ≜ x, y ≜ y) ∈ [x : 𝕌; y : 𝕌 | f x y]
	 ∨ (y ≜ y, z ≜ z) ∈ [y : 𝕌; z : 𝕌 | g y z]⌝
	),
	("z_∈_∨⋎s_conv 3",
	snd o dest_eq o concl o z_∈_∨⋎s_conv,
	ⓩp ∈ (([] ∨ [y:𝕌;z:𝕌 | g y z])⦂𝕌)⌝,
	ⓩ() ∈ []
	 ∨ (y ≜ (p⦂[y:𝕌;z:𝕌]).y, z ≜ p.z) ∈ [y : 𝕌; z : 𝕌 | g y z]⌝
	),
	("z_∈_∨⋎s_conv 4",
	snd o dest_eq o concl o z_∈_∨⋎s_conv,
	ⓩΠ (([x:𝕌; y:𝕌| f x y] ∨ [])⦂𝕌)⌝,
	ⓩ(x ≜ x, y ≜ y) ∈ [x : 𝕌; y : 𝕌 | f x y]
	 ∨ () ∈ []⌝
	),
	("z_∈_∨⋎s_conv 5",
	snd o dest_eq o concl o z_∈_∨⋎s_conv,
	ⓩΠ (([ | p] ∨ [ | q])⦂𝕌)⌝,
	ⓩ() ∈ [ | p] ∨ () ∈ [ | q]⌝
	)
];

store_mt_results mt_run_fail [
	("z_∈_∨⋎s_conv 43005",
	z_∈_∨⋎s_conv,
	mk_t,
	gen_fail_msg "z_∈_∨⋎s_conv" 43005 [trues]
	)
];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_∨⋎s_conv 1",
	snd o dest_eq o concl o z_∨⋎s_conv,
	ⓩ(([x:𝕌; y:𝕌| f x y] ∨ [y:𝕌;z:𝕌 | g y z])⦂𝕌)⌝,
	ⓩ{x1 : 𝕌; x2 : 𝕌; x3 : 𝕌
	  | (x ≜ x1, y ≜ x2) ∈ [x : 𝕌; y : 𝕌 | f x y]
	    ∨ (y ≜ x2, z ≜ x3) ∈ [y : 𝕌; z : 𝕌 | g y z]
	  ⦁ (x ≜ x1, y ≜ x2, z ≜ x3)}⌝
	),
	("z_∨⋎s_conv 2",
	snd o dest_eq o concl o z_∨⋎s_conv,
	ⓩ(([x:𝕌; y:𝕌| f x y] ∨ [ | q])⦂𝕌)⌝,
	ⓩ{x1 : 𝕌; x2 : 𝕌
	  | (x ≜ x1, y ≜ x2) ∈ [x : 𝕌; y : 𝕌 | f x y]
	    ∨ () ∈ [ | q]
	  ⦁ (x ≜ x1, y ≜ x2)}⌝
	),
	("z_∨⋎s_conv 3",
	snd o dest_eq o concl o z_∨⋎s_conv,
	ⓩ(([ | p] ∨ [y:𝕌;z:𝕌 | g y z])⦂𝕌)⌝,
	ⓩ{x1 : 𝕌; x2 : 𝕌
	  | () ∈ [ | p]
	    ∨ (y ≜ x1, z ≜ x2) ∈ [y:𝕌;z:𝕌 | g y z]
	  ⦁ (y ≜ x1, z ≜ x2)}⌝
	),
	("z_∨⋎s_conv 4",
	snd o dest_eq o concl o z_∨⋎s_conv,
	ⓩ(([ | p] ∨ [ | q])⦂𝕌)⌝,
	ⓩ{ | () ∈ [ | p] ∨ () ∈ [ | q]}⌝
	)
];
store_mt_results mt_run_fail [
	("z_∨⋎s_conv 42027",
	z_∨⋎s_conv,
	mk_t,
	gen_fail_msg "Z_∈_ELIM_C" 42027 [trues]
	),
	("z_∨⋎s_conv 43005",
	z_∨⋎s_conv,
	ⓩS⌝,
	gen_fail_msg "z_∈_∨⋎s_conv" 43005 [∈_ss]
	)
];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_∈_⇒⋎s_conv 1",
	snd o dest_eq o concl o z_∈_⇒⋎s_conv,
	ⓩp ∈ (([x:𝕌; y:𝕌| f x y] ⇒ [y:𝕌;z:𝕌 | g y z])⦂𝕌)⌝,
	ⓩ(x ≜ (p⦂[x:𝕌;y:𝕌;z:𝕌]).x, y ≜ p.y) ∈ [x : 𝕌; y : 𝕌 | f x y]
	 ⇒ (y ≜ p.y, z ≜ p.z) ∈ [y : 𝕌; z : 𝕌 | g y z]⌝
	),
	("z_∈_⇒⋎s_conv 2",
	snd o dest_eq o concl o z_∈_⇒⋎s_conv,
	ⓩΠ (([x:𝕌; y:𝕌| f x y] ⇒ [y:𝕌;z:𝕌 | g y z])⦂𝕌)⌝,
	ⓩ(x ≜ x, y ≜ y) ∈ [x : 𝕌; y : 𝕌 | f x y]
	 ⇒ (y ≜ y, z ≜ z) ∈ [y : 𝕌; z : 𝕌 | g y z]⌝
	),
	("z_∈_⇒⋎s_conv 3",
	snd o dest_eq o concl o z_∈_⇒⋎s_conv,
	ⓩp ∈ (([] ⇒ [y:𝕌;z:𝕌 | g y z])⦂𝕌)⌝,
	ⓩ() ∈ []
	 ⇒ (y ≜ (p⦂[y:𝕌;z:𝕌]).y, z ≜ p.z) ∈ [y : 𝕌; z : 𝕌 | g y z]⌝
	),
	("z_∈_⇒⋎s_conv 4",
	snd o dest_eq o concl o z_∈_⇒⋎s_conv,
	ⓩΠ (([x:𝕌; y:𝕌| f x y] ⇒ [])⦂𝕌)⌝,
	ⓩ(x ≜ x, y ≜ y) ∈ [x : 𝕌; y : 𝕌 | f x y]
	 ⇒ () ∈ []⌝
	),
	("z_∈_⇒⋎s_conv 5",
	snd o dest_eq o concl o z_∈_⇒⋎s_conv,
	ⓩΠ (([ | p] ⇒ [ | q])⦂𝕌)⌝,
	ⓩ() ∈ [ | p] ⇒ () ∈ [ | q]⌝
	)
];
store_mt_results mt_run_fail [
	("z_∈_⇒⋎s_conv 43006",
	z_∈_⇒⋎s_conv,
	mk_t,
	gen_fail_msg "z_∈_⇒⋎s_conv" 43006 [trues]
	)
];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_⇒⋎s_conv 1",
	snd o dest_eq o concl o z_⇒⋎s_conv,
	ⓩ(([x:𝕌; y:𝕌| f x y] ⇒ [y:𝕌;z:𝕌 | g y z])⦂𝕌)⌝,
	ⓩ{x1 : 𝕌; x2 : 𝕌; x3 : 𝕌
	  | (x ≜ x1, y ≜ x2) ∈ [x : 𝕌; y : 𝕌 | f x y]
	    ⇒ (y ≜ x2, z ≜ x3) ∈ [y : 𝕌; z : 𝕌 | g y z]
	  ⦁ (x ≜ x1, y ≜ x2, z ≜ x3)}⌝
	),
	("z_⇒⋎s_conv 2",
	snd o dest_eq o concl o z_⇒⋎s_conv,
	ⓩ(([x:𝕌; y:𝕌| f x y] ⇒ [ | q])⦂𝕌)⌝,
	ⓩ{x1 : 𝕌; x2 : 𝕌
	  | (x ≜ x1, y ≜ x2) ∈ [x : 𝕌; y : 𝕌 | f x y]
	    ⇒ () ∈ [ | q]
	  ⦁ (x ≜ x1, y ≜ x2)}⌝
	),
	("z_⇒⋎s_conv 3",
	snd o dest_eq o concl o z_⇒⋎s_conv,
	ⓩ(([ | p] ⇒ [y:𝕌;z:𝕌 | g y z])⦂𝕌)⌝,
	ⓩ{x1 : 𝕌; x2 : 𝕌
	  | () ∈ [ | p]
	    ⇒ (y ≜ x1, z ≜ x2) ∈ [y:𝕌;z:𝕌 | g y z]
	  ⦁ (y ≜ x1, z ≜ x2)}⌝
	),
	("z_⇒⋎s_conv 4",
	snd o dest_eq o concl o z_⇒⋎s_conv,
	ⓩ(([ | p] ⇒ [ | q])⦂𝕌)⌝,
	ⓩ{ | () ∈ [ | p] ⇒ () ∈ [ | q]}⌝
	)
];
store_mt_results mt_run_fail [
	("z_⇒⋎s_conv 42027",
	z_⇒⋎s_conv,
	mk_t,
	gen_fail_msg "Z_∈_ELIM_C" 42027 [trues]
	),
	("z_⇒⋎s_conv 43006",
	z_⇒⋎s_conv,
	ⓩS⌝,
	gen_fail_msg "z_∈_⇒⋎s_conv" 43006 [∈_ss]
	)
];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_∈_⇔⋎s_conv 1",
	snd o dest_eq o concl o z_∈_⇔⋎s_conv,
	ⓩp ∈ (([x:𝕌; y:𝕌| f x y] ⇔ [y:𝕌;z:𝕌 | g y z])⦂𝕌)⌝,
	ⓩ(x ≜ (p⦂[x:𝕌;y:𝕌;z:𝕌]).x, y ≜ p.y) ∈
		[x : 𝕌; y : 𝕌 | f x y]
	 ⇔ (y ≜ p.y, z ≜ p.z) ∈ [y : 𝕌; z : 𝕌 | g y z]⌝
	),
	("z_∈_⇔⋎s_conv 2",
	snd o dest_eq o concl o z_∈_⇔⋎s_conv,
	ⓩΠ (([x:𝕌; y:𝕌| f x y] ⇔ [y:𝕌;z:𝕌 | g y z])⦂𝕌)⌝,
	ⓩ(x ≜ x, y ≜ y) ∈ [x : 𝕌; y : 𝕌 | f x y]
	 ⇔ (y ≜ y, z ≜ z) ∈ [y : 𝕌; z : 𝕌 | g y z]⌝
	),
	("z_∈_⇔⋎s_conv 3",
	snd o dest_eq o concl o z_∈_⇔⋎s_conv,
	ⓩp ∈ (([] ⇔ [y:𝕌;z:𝕌 | g y z])⦂𝕌)⌝,
	ⓩ() ∈ []
	 ⇔ (y ≜ (p⦂[y:𝕌;z:𝕌]).y, z ≜ p.z) ∈ [y : 𝕌; z : 𝕌 | g y z]⌝
	),
	("z_∈_⇔⋎s_conv 4",
	snd o dest_eq o concl o z_∈_⇔⋎s_conv,
	ⓩΠ (([x:𝕌; y:𝕌| f x y] ⇔ [])⦂𝕌)⌝,
	ⓩ(x ≜ x, y ≜ y) ∈ [x : 𝕌; y : 𝕌 | f x y]
	 ⇔ () ∈ []⌝
	),
	("z_∈_⇔⋎s_conv 5",
	snd o dest_eq o concl o z_∈_⇔⋎s_conv,
	ⓩΠ (([ | p] ⇔ [ | q])⦂𝕌)⌝,
	ⓩ() ∈ [ | p] ⇔ () ∈ [ | q]⌝
	)
];
store_mt_results mt_run_fail [
	("z_∈_⇔⋎s_conv 43016",
	z_∈_⇔⋎s_conv,
	mk_t,
	gen_fail_msg "z_∈_⇔⋎s_conv" 43016 [trues]
	)
];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_⇔⋎s_conv 1",
	snd o dest_eq o concl o z_⇔⋎s_conv,
	ⓩ(([x:𝕌; y:𝕌| f x y] ⇔ [y:𝕌;z:𝕌 | g y z])⦂𝕌)⌝,
	ⓩ{x1 : 𝕌; x2 : 𝕌; x3 : 𝕌
	  | (x ≜ x1, y ≜ x2) ∈ [x : 𝕌; y : 𝕌 | f x y]
	    ⇔ (y ≜ x2, z ≜ x3) ∈ [y : 𝕌; z : 𝕌 | g y z]
	  ⦁ (x ≜ x1, y ≜ x2, z ≜ x3)}⌝
	),
	("z_⇔⋎s_conv 2",
	snd o dest_eq o concl o z_⇔⋎s_conv,
	ⓩ(([x:𝕌; y:𝕌| f x y] ⇔ [ | q])⦂𝕌)⌝,
	ⓩ{x1 : 𝕌; x2 : 𝕌
	  | (x ≜ x1, y ≜ x2) ∈ [x : 𝕌; y : 𝕌 | f x y]
	    ⇔ () ∈ [ | q]
	  ⦁ (x ≜ x1, y ≜ x2)}⌝
	),
	("z_⇔⋎s_conv 3",
	snd o dest_eq o concl o z_⇔⋎s_conv,
	ⓩ(([ | p] ⇔ [y:𝕌;z:𝕌 | g y z])⦂𝕌)⌝,
	ⓩ{x1 : 𝕌; x2 : 𝕌
	  | () ∈ [ | p]
	    ⇔ (y ≜ x1, z ≜ x2) ∈ [y:𝕌;z:𝕌 | g y z]
	  ⦁ (y ≜ x1, z ≜ x2)}⌝
	),
	("z_⇔⋎s_conv 4",
	snd o dest_eq o concl o z_⇔⋎s_conv,
	ⓩ(([ | p] ⇔ [ | q])⦂𝕌)⌝,
	ⓩ{ | () ∈ [ | p] ⇔ () ∈ [ | q]}⌝
	)
];
store_mt_results mt_run_fail [
	("z_⇔⋎s_conv 42027",
	z_⇔⋎s_conv,
	mk_t,
	gen_fail_msg "Z_∈_ELIM_C" 42027 [trues]
	),
	("z_⇔⋎s_conv 43016",
	z_⇔⋎s_conv,
	ⓩS⌝,
	gen_fail_msg "z_∈_⇔⋎s_conv" 43016 [∈_ss]
	)
];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_∈_¬⋎s_conv 1",
	snd o dest_eq o concl o z_∈_¬⋎s_conv,
	ⓩp ∈ ((¬ [y:𝕌;z:𝕌 | g y z])⦂𝕌)⌝,
	ⓩ¬ p ∈ [y : 𝕌; z : 𝕌 | g y z]⌝
	),
	("z_∈_¬⋎s_conv 2",
	snd o dest_eq o concl o z_∈_¬⋎s_conv,
	ⓩΠ ((¬ [y:𝕌;z:𝕌 | g y z])⦂𝕌)⌝,
	ⓩ¬ (y ≜ y, z ≜ z) ∈ [y : 𝕌; z : 𝕌 | g y z]⌝
	),
	("z_∈_¬⋎s_conv 3",
	snd o dest_eq o concl o z_∈_¬⋎s_conv,
	ⓩΠ ((¬ [ | p])⦂𝕌)⌝,
	ⓩ¬ () ∈ [ | p]⌝
	)
];
store_mt_results mt_run_fail [
	("z_∈_¬⋎s_conv 43017",
	z_∈_¬⋎s_conv,
	mk_t,
	gen_fail_msg "z_∈_¬⋎s_conv" 43017 [trues]
	)
];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_¬⋎s_conv 1",
	snd o dest_eq o concl o z_¬⋎s_conv,
	ⓩ((¬ [y:𝕌;z:𝕌 | g y z])⦂𝕌)⌝,
	ⓩ{x1 : 𝕌; x2 : 𝕌
	  | ¬ (y ≜ x1, z ≜ x2) ∈ [y : 𝕌; z : 𝕌 | g y z]
	  ⦁ (y ≜ x1, z ≜ x2)}⌝
	),
	("z_¬⋎s_conv 2",
	snd o dest_eq o concl o z_¬⋎s_conv,
	ⓩ((¬ [ | p])⦂𝕌)⌝,
	ⓩ{ | ¬ () ∈ [ | p]}⌝
	)
];
store_mt_results mt_run_fail [
	("z_¬⋎s_conv 42027",
	z_¬⋎s_conv,
	mk_t,
	gen_fail_msg "Z_∈_ELIM_C" 42027 [trues]
	),
	("z_¬⋎s_conv 43017",
	z_¬⋎s_conv,
	ⓩS⌝,
	gen_fail_msg "z_∈_¬⋎s_conv" 43017 [∈_ss]
	)
];
=TEX
\section{SCHEMA QUANTIFICATION}
=SML
store_mt_results (mt_runf (op =$)) [
	("z_∈_∃⋎s_conv 1",
	snd o dest_eq o concl o z_∈_∃⋎s_conv,
	(snd(strip_∀ ⓩ[X,W] p ∈ ((∃ x:X; w:W | q x w ⦁
		[x,y:X;w,z:W | r x y z w])⦂𝕌)⌝)),
	(snd(strip_∀ ⓩ[X,W] (∃ x1 : 𝕌 ⦁
	(((x1⦂[x:X;w:W]).x ∈ X
	∧ x1.w ∈ W)
	∧ q x1.x x1.w)
	∧ (w ≜ x1.w, x ≜ x1.x, y ≜ (p⦂[y:X;z:W]).y, z ≜ p.z)
	  ∈ [x, y : X; w, z : W
	    | r x y z w])⌝))
	),
	("z_∈_∃⋎s_conv 2",
	snd o dest_eq o concl o z_∈_∃⋎s_conv,
	(snd(strip_∀ ⓩ[X,W] (Π((∃ x:X; w:W | q x w ⦁
		 [x,y:X;w,z:W | r x y z w])⦂𝕌))⌝)),
	(snd(strip_∀ ⓩ[X,W] (∃ x1 : 𝕌 ⦁
	(((x1⦂[x:X;w:W]).x ∈ X
	∧ x1.w ∈ W)
	∧ q x1.x x1.w)
	∧ (w ≜ x1.w, x ≜ x1.x, y ≜ y, z ≜ z)
	  ∈ [x, y : X; w, z : W
	    | r x y z w])⌝))
	),
	("z_∈_∃⋎s_conv 3",
	snd o dest_eq o concl o z_∈_∃⋎s_conv,
	(snd(strip_∀ ⓩ[X,W,U] p ∈ ((∃ x:X; w:W; u:U | q x w ⦁
		[x,y:X;w,z:W | r x y z w])⦂𝕌)⌝)),
	(snd(strip_∀ ⓩ[X,W,U] (∃ x1 : 𝕌 ⦁
	(((x1⦂[x:X;w:W;u:U]).x ∈ X
	∧ x1.w ∈ W
	∧ x1.u ∈ U)
	∧ q x1.x x1.w)
	∧ (w ≜ x1.w, x ≜ x1.x, y ≜ (p⦂[y:X;z:W]).y, z ≜ p.z)
	  ∈ [x, y : X; w, z : W
	    | r x y z w])⌝))
	),
	("z_∈_∃⋎s_conv 4",
	snd o dest_eq o concl o z_∈_∃⋎s_conv,
	(snd(strip_∀ ⓩ[X] p ∈ ((∃ S[X] ⦁ DS[X]) ⦂ 𝕌)⌝)),
	(snd(strip_∀ ⓩ[X](∃ x1 : 𝕌
	      ⦁ ((x ≜ (x1⦂[x:X]).x) ∈ S[X]
	        ∧ true)
	        ∧ (x ≜ x1.x, x' ≜ (p⦂[x':X]).x') ∈ DS[X])⌝))
	),
	("z_∈_∃⋎s_conv 5",
	snd o dest_eq o concl o z_∈_∃⋎s_conv,
	(snd(strip_∀ ⓩ[X,W] p ∈ ((∃ | q x w ⦁
		[x,y:X;w,z:W | r x y z w])⦂𝕌)⌝)),
	(snd(strip_∀ ⓩ[X,W] (
	(true
	∧ q x w)
	∧ (w ≜ (p⦂[x,y:X;w,z:W]).w, x ≜ p.x, y ≜ p.y, z ≜ p.z)
	  ∈ [x, y : X; w, z : W
	    | r x y z w])⌝))
	)
];
=TEX
=SML
store_mt_results mt_run_fail [
	("z_∈_∃⋎s_conv 43020",
	z_∈_∃⋎s_conv,
	mk_t,
	gen_fail_msg "z_∈_∃⋎s_conv" 43020 [trues]
	)
];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_∃⋎s_conv 1",
	snd o dest_eq o concl o z_∃⋎s_conv,
	ⓩ((∃ x:X; w:W | q x w ⦁ [x,y:X;w,z:W | r x y z w])⦂𝕌)⌝,
	ⓩ{x1 : 𝕌; x2 : 𝕌
	  | ∃ x3 : 𝕌
	    ⦁ (((x3⦂([x:X;w:W])).x ∈ X
	      ∧ x3.w ∈ W)
	      ∧ q x3.x x3.w)
	      ∧ (w ≜ x3.w, x ≜ x3.x, y ≜ x1, z ≜ x2)
 	       ∈ [x, y : X; w, z : W
	          | r x y z w]
	  ⦁ (y ≜ x1, z ≜ x2)}⌝
	),
	("z_∃⋎s_conv 2",
	snd o dest_eq o concl o z_∃⋎s_conv,
	ⓩ((∃ | q x w ⦁ [x,y:X;w,z:W | r x y z w])⦂𝕌)⌝,
	inst [] [(ⓣ'd⌝, ⓣ'a⌝), (ⓣ'c⌝, ⓣ'b⌝), (ⓣ'b⌝, ⓣ'd⌝), (ⓣ'a⌝, ⓣ'c⌝)]
	ⓩ{x1 : 𝕌; x2 : 𝕌; x3 : 𝕌; x4 : 𝕌
	  | (true
	      ∧ q x w)
	      ∧ (w ≜ x1, x ≜ x2, y ≜ x3, z ≜ x4)
	       ∈ [x, y : X; w, z : W
	          | r x y z w]
	  ⦁ (w ≜ x1, x ≜ x2, y ≜ x3, z ≜ x4)}⌝
	)
];
store_mt_results mt_run_fail [
	("z_∃⋎s_conv 42027",
	z_∃⋎s_conv,
	mk_t,
	gen_fail_msg "Z_∈_ELIM_C" 42027 [trues]
	),
	("z_∃⋎s_conv 43020",
	z_∃⋎s_conv,
	ⓩS⌝,
	gen_fail_msg "z_∈_∃⋎s_conv" 43020 [∈_ss]
	)
];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_∈_∀⋎s_conv 1",
	snd o dest_eq o concl o z_∈_∀⋎s_conv,
	(snd(strip_∀ ⓩ[X,W] p ∈ ((∀ x:X; w:W | q x w ⦁
		 [x,y:X;w,z:W | r x y z w])⦂𝕌)⌝)),
	(snd(strip_∀ ⓩ[X,W] (∀ x1 : 𝕌 ⦁
	(((x1⦂[x:X;w:W]).x ∈ X
	∧ x1.w ∈ W)
	∧ q x1.x x1.w)
	⇒ (w ≜ x1.w, x ≜ x1.x, y ≜ (p⦂[y:X;z:W]).y, z ≜ p.z)
	  ∈ [x, y : X; w, z : W
	    | r x y z w])⌝))
	),
	("z_∈_∀⋎s_conv 2",
	snd o dest_eq o concl o z_∈_∀⋎s_conv,
	(snd(strip_∀ ⓩ[X,W] (Π ((∀ x:X; w:W | q x w ⦁
		[x,y:X;w,z:W | r x y z w])⦂𝕌))⌝)),
	(snd(strip_∀ ⓩ[X,W] (∀ x1 : 𝕌 ⦁
	(((x1⦂[x:X;w:W]).x ∈ X
	∧ x1.w ∈ W)
	∧ q x1.x x1.w)
	⇒ (w ≜ x1.w, x ≜ x1.x, y ≜ y, z ≜ z)
	  ∈ [x, y : X; w, z : W
	    | r x y z w])⌝))
	),
	("z_∈_∀⋎s_conv 3",
	snd o dest_eq o concl o z_∈_∀⋎s_conv,
	(snd(strip_∀ ⓩ[X] p ∈ ((∀ S[X] ⦁ DS[X]) ⦂ 𝕌)⌝)),
	(snd(strip_∀ ⓩ[X](∀ x1 : 𝕌
      ⦁ ((x ≜ (x1⦂[x:𝕌]).x) ∈ S[X]
        ∧ true)
        ⇒ (x ≜ x1.x, x' ≜ (p⦂[x':𝕌]).x') ∈ DS[X])⌝))
	),
	("z_∈_∀⋎s_conv 4",
	(snd o dest_eq o concl o z_∈_∀⋎s_conv),
	(snd(strip_∀ ⓩ[X,W,U] p ∈ ((∀ x:X; w:W; u:U | q x w ⦁
		 [x,y:X;w,z:W | r x y z w])⦂𝕌)⌝)),
	(snd(strip_∀ ⓩ[X,W,U] (∀ x1 : 𝕌 ⦁
	(((x1⦂[x:X;w:W;u:U]).x ∈ X
	∧ x1.w ∈ W
	∧ x1.u ∈ U)
	∧ q x1.x x1.w)
	⇒ (w ≜ x1.w, x ≜ x1.x, y ≜ (p⦂[y:X;z:W]).y, z ≜ p.z)
	  ∈ [x, y : X; w, z : W
	    | r x y z w])⌝))
	),
	("z_∈_∀⋎s_conv 5",
	snd o dest_eq o concl o z_∈_∀⋎s_conv,
	(snd(strip_∀ ⓩ[X,W] p ∈ ((∀ | q x w ⦁
		[x,y:X;w,z:W | r x y z w])⦂𝕌)⌝)),
	(snd(strip_∀ ⓩ[X,W] (
	(true
	∧ q x w)
	⇒ (w ≜ (p⦂[x,y:X;w,z:W]).w, x ≜ p.x, y ≜ p.y, z ≜ p.z)
	  ∈ [x, y : X; w, z : W
	    | r x y z w])⌝))
	)
];
=TEX
=SML
store_mt_results mt_run_fail [
	("z_∈_∀⋎s_conv 43030",
	z_∈_∀⋎s_conv,
	mk_t,
	gen_fail_msg "z_∈_∀⋎s_conv" 43030 [trues]
	)
];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_∀⋎s_conv 1",
	snd o dest_eq o concl o z_∀⋎s_conv,
	ⓩ((∀ x:X; w:W | q x w ⦁ [x,y:X;w,z:W | r x y z w])⦂𝕌)⌝,
	ⓩ{x1 : 𝕌; x2 : 𝕌
	  | ∀ x3 : 𝕌
	    ⦁ (((x3⦂([x:X;w:W])).x ∈ X
	      ∧ x3.w ∈ W)
	      ∧ q x3.x x3.w)
	      ⇒ (w ≜ x3.w, x ≜ x3.x, y ≜ x1, z ≜ x2)
	        ∈ [x, y : X; w, z : W
	          | r x y z w]
	  ⦁ (y ≜ x1, z ≜ x2)}⌝
	),
	("z_∀⋎s_conv 2",
	snd o dest_eq o concl o z_∀⋎s_conv,
	ⓩ((∀ | q x w ⦁ [x,y:X;w,z:W | r x y z w])⦂𝕌)⌝,
	inst [] [(ⓣ'd⌝, ⓣ'a⌝), (ⓣ'c⌝, ⓣ'b⌝), (ⓣ'b⌝, ⓣ'd⌝), (ⓣ'a⌝, ⓣ'c⌝)]
	ⓩ{x1 : 𝕌; x2 : 𝕌; x3 : 𝕌; x4 : 𝕌
	  | (true
	      ∧ q x w)
	      ⇒ (w ≜ x1, x ≜ x2, y ≜ x3, z ≜ x4)
	       ∈ [x, y : X; w, z : W
	          | r x y z w]
	  ⦁ (w ≜ x1, x ≜ x2, y ≜ x3, z ≜ x4)}⌝
	)
];

store_mt_results mt_run_fail [
	("z_∀⋎s_conv 42027",
	z_∀⋎s_conv,
	mk_t,
	gen_fail_msg "Z_∈_ELIM_C" 42027 [trues]
	),
	("z_∀⋎s_conv 43030",
	z_∀⋎s_conv,
	ⓩS⌝,
	gen_fail_msg "z_∈_∀⋎s_conv" 43030 [∈_ss]
	)
];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_∈_∃⋎1⋎s_conv 1",
	snd o dest_eq o concl o z_∈_∃⋎1⋎s_conv,
	(snd(strip_∀ ⓩ[X,W] p ∈ ((∃⋎1 x:X; w:W | q x w ⦁
		[x,y:X;w,z:W | r x y z w])⦂𝕌)⌝)),
	(snd(strip_∀ ⓩ[X,W] (∃⋎1 x1 : 𝕌 ⦁
	(((x1⦂[x:X;w:W]).x ∈ X
	∧ x1.w ∈ W)
	∧ q x1.x x1.w)
	∧ (w ≜ x1.w, x ≜ x1.x, y ≜ (p⦂[y:X;z:W]).y, z ≜ p.z)
	  ∈ [x, y : X; w, z : W
	    | r x y z w])⌝))
	),
	("z_∈_∃⋎1⋎s_conv 2",
	snd o dest_eq o concl o z_∈_∃⋎1⋎s_conv,
	(snd(strip_∀ ⓩ[X,W] (Π ((∃⋎1 x:X; w:W | q x w ⦁
		[x,y:X;w,z:W | r x y z w])⦂𝕌))⌝)),
	(snd(strip_∀ ⓩ[X,W] (∃⋎1 x1 : 𝕌 ⦁
	(((x1⦂[x:X;w:W]).x ∈ X
	∧ x1.w ∈ W)
	∧ q x1.x x1.w)
	∧ (w ≜ x1.w, x ≜ x1.x, y ≜ y, z ≜ z)
	  ∈ [x, y : X; w, z : W
	    | r x y z w])⌝))
	),
	("z_∈_∃⋎1⋎s_conv 3",
	snd o dest_eq o concl o z_∈_∃⋎1⋎s_conv,
	(snd(strip_∀ ⓩ[X] p ∈ ((∃⋎1 S[X] ⦁ DS[X]) ⦂ 𝕌)⌝)),
	(snd(strip_∀ ⓩ[X](∃⋎1 x1 : 𝕌
      ⦁ ((x ≜ (x1⦂[x:𝕌]).x) ∈ S[X]
        ∧ true)
        ∧ (x ≜ x1.x, x' ≜ (p⦂[x':𝕌]).x') ∈ DS[X])⌝))
	),
	("z_∈_∃⋎1⋎s_conv 4",
	snd o dest_eq o concl o z_∈_∃⋎1⋎s_conv,
	(snd(strip_∀ ⓩ[X,W,U] p ∈ ((∃⋎1 x:X; w:W; u:U | q x w ⦁
		[x,y:X;w,z:W | r x y z w])⦂𝕌)⌝)),
	(snd(strip_∀ ⓩ[X,W,U] (∃⋎1 x1 : 𝕌 ⦁
	(((x1⦂[x:X;w:W;u:U]).x ∈ X
	∧ x1.w ∈ W
	∧ x1.u ∈ U)
	∧ q x1.x x1.w)
	∧ (w ≜ x1.w, x ≜ x1.x, y ≜ (p⦂[y:X;z:W]).y, z ≜ p.z)
	  ∈ [x, y : X; w, z : W
	    | r x y z w])⌝))
	),
	("z_∈_∃⋎1⋎s_conv 5",
	snd o dest_eq o concl o z_∈_∃⋎1⋎s_conv,
	(snd(strip_∀ ⓩ[X,W] p ∈ ((∃⋎1 | q x w ⦁
		[x,y:X;w,z:W | r x y z w])⦂𝕌)⌝)),
	(snd(strip_∀ ⓩ[X,W] (
	(true
	∧ q x w)
	∧ (w ≜ (p⦂[x,y:X;w,z:W]).w, x ≜ p.x, y ≜ p.y, z ≜ p.z)
	  ∈ [x, y : X; w, z : W
	    | r x y z w])⌝))
	)
];
=TEX
=SML
store_mt_results mt_run_fail [
	("z_∈_∃⋎1⋎s_conv 43021",
	z_∈_∃⋎1⋎s_conv,
	mk_t,
	gen_fail_msg "z_∈_∃⋎1⋎s_conv" 43021 [trues]
	)
];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_∃⋎1⋎s_conv 1",
	snd o dest_eq o concl o z_∃⋎1⋎s_conv,
	ⓩ((∃⋎1 x:X; w:W | q x w ⦁ [x,y:X;w,z:W | r x y z w])⦂𝕌)⌝,
	ⓩ{x1 : 𝕌; x2 : 𝕌
	  | ∃⋎1 x3 : 𝕌
	    ⦁ (((x3⦂[x:X;w:W]).x ∈ X
	      ∧ x3.w ∈ W)
	      ∧ q x3.x x3.w)
	      ∧ (w ≜ x3.w, x ≜ x3.x, y ≜ x1, z ≜ x2)
	        ∈ [x, y : X; w, z : W
	          | r x y z w]
	  ⦁ (y ≜ x1, z ≜ x2)}⌝
	),
	("z_∃⋎1⋎s_conv 2",
	snd o dest_eq o concl o z_∃⋎1⋎s_conv,
	ⓩ((∃⋎1 | q x w ⦁ [x,y:X;w,z:W | r x y z w])⦂𝕌)⌝,
	inst [] [(ⓣ'd⌝, ⓣ'a⌝), (ⓣ'c⌝, ⓣ'b⌝), (ⓣ'b⌝, ⓣ'd⌝), (ⓣ'a⌝, ⓣ'c⌝)]
	ⓩ{x1 : 𝕌; x2 : 𝕌; x3 : 𝕌; x4 : 𝕌
	  | (true
	      ∧ q x w)
	      ∧ (w ≜ x1, x ≜ x2, y ≜ x3, z ≜ x4)
	       ∈ [x, y : X; w, z : W
	          | r x y z w]
	  ⦁ (w ≜ x1, x ≜ x2, y ≜ x3, z ≜ x4)}⌝
	)
];
store_mt_results mt_run_fail [
	("z_∃⋎1⋎s_conv 42027",
	z_∃⋎1⋎s_conv,
	mk_t,
	gen_fail_msg "Z_∈_ELIM_C" 42027 [trues]
	),
	("z_∃⋎1⋎s_conv 43021",
	z_∃⋎1⋎s_conv,
	ⓩS⌝,
	gen_fail_msg "z_∈_∃⋎1⋎s_conv" 43021 [∈_ss]
	)
];
=TEX
\section{OTHER SCHEMA CALCULUS OPERATORS}
=SML
store_mt_results (mt_runf (op =$)) [
	("z_↾⋎s_conv 1",
	snd o dest_eq o concl o z_↾⋎s_conv,
	ⓩ[x,y,z:X| p x y z] ↾⋎s [y:X]⌝,
	ⓩ([x,y,z:X| p x y z] ∧ [y:X]) \⋎s (x,z)⌝
	),
	("z_↾⋎s_conv 2",
	snd o dest_eq o concl o z_↾⋎s_conv,
	ⓩ[ | p] ↾⋎s [y:X]⌝,
	ⓩ([ | p] ∧ [y:X]) ⦂ 𝕌⌝
	),
	("z_↾⋎s_conv 3",
	snd o dest_eq o concl o z_↾⋎s_conv,
	ⓩ[x,y,z:X| p x y z] ↾⋎s [ | q]⌝,
	ⓩ([x,y,z:X| p x y z] ∧ [ | q]) \⋎s (x,y,z)⌝
	),
	("z_↾⋎s_conv 4",
	snd o dest_eq o concl o z_↾⋎s_conv,
	ⓩ[ | p] ↾⋎s [ | q]⌝,
	ⓩ([ | p] ∧ [ | q]) ⦂ 𝕌⌝
	)
];
store_mt_results mt_run_fail [
	("z_↾⋎s_conv 43019",
	z_↾⋎s_conv,
	mk_t,
	gen_fail_msg "z_↾⋎s_conv" 43019 [trues]
	)
];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_∈_↾⋎s_conv 1",
	snd o dest_eq o concl o z_∈_↾⋎s_conv,
	ⓩp ∈ ([x,y,z:X| r x y z] ↾⋎s [y:X])⌝,
	ⓩp ∈ (([x,y,z:X| r x y z] ∧ [y:X]) \⋎s (x,z))⌝
	),
	("z_∈_↾⋎s_conv 2",
	snd o dest_eq o concl o z_∈_↾⋎s_conv,
	ⓩΠ ([x,y,z:X| r x y z] ↾⋎s [y:X])⌝,
	ⓩ(y ≜ y) ∈ (([x,y,z:X| r x y z] ∧ [y:X]) \⋎s (x,z))⌝
	),
	("z_∈_↾⋎s_conv 3",
	snd o dest_eq o concl o z_∈_↾⋎s_conv,
	ⓩv ∈ ([ | p] ↾⋎s [y:X])⌝,
	ⓩv ∈ (([ | p] ∧ [y:X]) ⦂ 𝕌)⌝
	),
	("z_∈_↾⋎s_conv 4",
	snd o dest_eq o concl o z_∈_↾⋎s_conv,
	ⓩv ∈ ([x,y,z:X| p x y z] ↾⋎s [ | q])⌝,
	ⓩv ∈ (([x,y,z:X| p x y z] ∧ [ | q]) \⋎s (x,y,z))⌝
	),
	("z_∈_↾⋎s_conv 5",
	snd o dest_eq o concl o z_∈_↾⋎s_conv,
	ⓩv ∈ ([ | p] ↾⋎s [ | q])⌝,
	ⓩv ∈ (([ | p] ∧ [ | q]) ⦂ 𝕌)⌝
	)
];
store_mt_results mt_run_fail [
	("z_∈_↾⋎s_conv 42028",
	z_∈_↾⋎s_conv,
	mk_t,
	gen_fail_msg "∈_C" 42028 [trues]
	),
	("z_∈_↾⋎s_conv 43019",
	z_∈_↾⋎s_conv,
	ⓩx ∈ S⌝,
	gen_fail_msg "z_↾⋎s_conv" 43019 [ss]
	)
];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_hide⋎s_conv 1",
	snd o dest_eq o concl o z_hide⋎s_conv,
	ⓩ[x,y,z:X;w:W| p x y z] \⋎s (x,w) ⌝,
	ⓩ[y:(𝕌⦂ℙ X);z:(𝕌⦂ℙ X) | ∃ w:(𝕌⦂ℙ W);x:(𝕌⦂ℙ X) ⦁
		[x,y,z:X;w:W| p x y z]]⌝
	),
	("z_hide⋎s_conv 2",
	snd o dest_eq o concl o z_hide⋎s_conv,
	(#2(dest_eq(snd(strip_∀ ⓩ[W,X] a =
	  ([x,y,z:X;w:W| p x y z] \⋎s (z,y,w,x))⌝)))),
	(#2(dest_eq(snd(strip_∀ ⓩ[W,X] a =
	  ([ | ∃ w:(𝕌⦂ℙ W);x:(𝕌⦂ℙ X);y:(𝕌⦂ℙ X);z:(𝕌⦂ℙ X)
	     ⦁ [x,y,z:X;w:W| p x y z]])⌝))))
	)
];
store_mt_results mt_run_fail [
	("z_hide⋎s_conv 43018",
	z_hide⋎s_conv,
	mk_t,
	gen_fail_msg "z_hide⋎s_conv" 43018 [trues]
	)
];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_∈_hide⋎s_conv 1",
	snd o dest_eq o concl o z_∈_hide⋎s_conv,
	ⓩp ∈ ([x,y,z:X;w:W| r x y z] \⋎s (x,w))⌝,
	ⓩp ∈ ([y:(𝕌⦂ℙ X);z:(𝕌⦂ℙ X) | ∃ w:(𝕌⦂ℙ W);x:(𝕌⦂ℙ X) ⦁
		[x,y,z:X;w:W| r x y z]])⌝
	),
	("z_∈_hide⋎s_conv 2",
	snd o dest_eq o concl o z_∈_hide⋎s_conv,
	ⓩΠ ([x,y,z:X;w:W| r x y z] \⋎s (x,w))⌝,
	ⓩ(y ≜ y, z ≜ z) ∈ ([y:(𝕌⦂ℙ X);z:(𝕌⦂ℙ X) | ∃ w:(𝕌⦂ℙ W);x:(𝕌⦂ℙ X) ⦁
		[x,y,z:X;w:W| r x y z]])⌝
	),
	("z_∈_hide⋎s_conv 3",
	snd o dest_eq o concl o z_∈_hide⋎s_conv,
	(snd(strip_∀ ⓩ[W,X] p ∈ ([x,y,z:X;w:W| r x y z] \⋎s (z,y,w,x))⌝)),
	(snd(strip_∀ ⓩ[W,X] p ∈ ([ | ∃ w:(𝕌⦂ℙ W);x:(𝕌⦂ℙ X);y:(𝕌⦂ℙ X);z:(𝕌⦂ℙ X) ⦁
		[x,y,z:X;w:W| r x y z]])⌝))
	)
];
store_mt_results mt_run_fail [
	("z_∈_hide⋎s_conv 42028",
	z_∈_hide⋎s_conv,
	mk_t,
	gen_fail_msg "∈_C" 42028 [trues]
	),
	("z_∈_hide⋎s_conv 43018",
	z_∈_hide⋎s_conv,
	ⓩx ∈ S⌝,
	gen_fail_msg "z_hide⋎s_conv" 43018 [ss]
	)
];
=TEX
=SML
z_⨾⋎s_conv ⓩ[y,y':X| f y y'] ⨾⋎s [y,y':X | g y y']⌝;
store_mt_results (mt_runf (op =$)) [
	("z_⨾⋎s_conv 1",
	snd o dest_eq o concl o z_⨾⋎s_conv,
	ⓩ[x,y,y':X| f x y y'] ⨾⋎s [z,y,y':X | g z y y']⌝,
	ⓩ[x:𝕌;y:𝕌;y':𝕌;z:𝕌 | ∃ x1:𝕌 ⦁
		(x ≜ x, y ≜ y, y' ≜ x1) ∈ [x,y,y':X| f x y y'] ∧
		(z ≜ z, y ≜ x1, y' ≜ y') ∈ [z,y,y':X | g z y y']]⌝
	),
	("z_⨾⋎s_conv 2",
	snd o dest_eq o concl o z_⨾⋎s_conv,
	ⓩ[] ⨾⋎s [z,y,y':X | g z y y']⌝,
	ⓩ[y:𝕌;y':𝕌;z:𝕌 | ∃ ⦁
		() ∈ [] ∧
		(z ≜ z, y ≜ y, y' ≜ y') ∈ [z,y,y':X | g z y y']]⌝
	),
	("z_⨾⋎s_conv 3",
	snd o dest_eq o concl o z_⨾⋎s_conv,
	ⓩ[x,y,y':X| f x y y'] ⨾⋎s []⌝,
	ⓩ[x:𝕌;y:𝕌;y':𝕌 | ∃ ⦁
		(x ≜ x, y ≜ y, y' ≜ y') ∈ [x,y,y':X| f x y y'] ∧
		() ∈ []]⌝
	),
	("z_⨾⋎s_conv 4",
	snd o dest_eq o concl o z_⨾⋎s_conv,
	ⓩ[] ⨾⋎s []⌝,
	ⓩ[ | ∃ ⦁ () ∈ [] ∧ () ∈ []]⌝
	)
];
store_mt_results mt_run_fail [
	("z_⨾⋎s_conv 43025",
	z_⨾⋎s_conv,
	mk_t,
	gen_fail_msg "z_⨾⋎s_conv" 43025 [trues]
	)
];
=TEX
=SML
z_∈_⨾⋎s_conv ⓩv ∈ ([y,y':X| f y y'] ⨾⋎s [y,y':X | g y y'])⌝;
z_∈_⨾⋎s_conv ⓩΠ ([y,y':X| f y y'] ⨾⋎s [y,y':X | g y y'])⌝;
store_mt_results (mt_runf (op =$)) [
	("z_∈_⨾⋎s_conv 1",
	snd o dest_eq o concl o z_∈_⨾⋎s_conv,
	ⓩv ∈ ([x,y,y':X| f x y y'] ⨾⋎s [z,y,y':X | g z y y'])⌝,
	ⓩv ∈ [x:𝕌;y:𝕌;y':𝕌;z:𝕌 | ∃ x1:𝕌 ⦁
		(x ≜ x, y ≜ y, y' ≜ x1) ∈ [x,y,y':X| f x y y'] ∧
		(z ≜ z, y ≜ x1, y' ≜ y') ∈ [z,y,y':X | g z y y']]⌝
	),
	("z_∈_⨾⋎s_conv 2",
	snd o dest_eq o concl o z_∈_⨾⋎s_conv,
	ⓩΠ ([x,y,y':X| f x y y'] ⨾⋎s [z,y,y':X | g z y y'])⌝,
	ⓩ(x ≜ x, y ≜ y, y' ≜ y', z ≜ z) ∈
	 [x:𝕌;y:𝕌;y':𝕌;z:𝕌 | ∃ x1:𝕌 ⦁
		(x ≜ x, y ≜ y, y' ≜ x1) ∈ [x,y,y':X| f x y y'] ∧
		(z ≜ z, y ≜ x1, y' ≜ y') ∈ [z,y,y':X | g z y y']]⌝
	),
	("z_∈_⨾⋎s_conv 3",
	snd o dest_eq o concl o z_∈_⨾⋎s_conv,
	ⓩv ∈ ([] ⨾⋎s [z,y,y':X | g z y y'])⌝,
	ⓩv ∈ [y:𝕌;y':𝕌;z:𝕌 | ∃ ⦁
		() ∈ [] ∧
		(z ≜ z, y ≜ y, y' ≜ y') ∈ [z,y,y':X | g z y y']]⌝
	),
	("z_∈_⨾⋎s_conv 4",
	snd o dest_eq o concl o z_∈_⨾⋎s_conv,
	ⓩv ∈ ([x,y,y':X| f x y y'] ⨾⋎s [])⌝,
	ⓩv ∈ [x:𝕌;y:𝕌;y':𝕌 | ∃ ⦁
		(x ≜ x, y ≜ y, y' ≜ y') ∈ [x,y,y':X| f x y y'] ∧
		() ∈ []]⌝
	),
	("z_∈_⨾⋎s_conv 5",
	snd o dest_eq o concl o z_∈_⨾⋎s_conv,
	ⓩv ∈ ([] ⨾⋎s [])⌝,
	ⓩv ∈ [ | ∃ ⦁ () ∈ [] ∧ () ∈ []]⌝
	)
];
store_mt_results mt_run_fail [
	("z_∈_⨾⋎s_conv 42028",
	z_∈_⨾⋎s_conv,
	mk_t,
	gen_fail_msg "∈_C" 42028 [trues]
	),
	("z_∈_⨾⋎s_conv 43025",
	z_∈_⨾⋎s_conv,
	ⓩx ∈ S⌝,
	gen_fail_msg "z_⨾⋎s_conv" 43025 [ss]
	)
];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_∈_rename⋎s_conv 1",
	snd o dest_eq o concl o z_∈_rename⋎s_conv,
	(snd(strip_∀ ⓩ[X,W] p ∈ [x,y:X;w,z:W | r x y z w][q/x,s/y,t/v]⌝)),
	(snd(strip_∀ ⓩ[X,W] (x ≜ (p⦂[q,s:X;w,z:W]).q, y ≜ p.s,
		w ≜ p.w, z ≜ p.z) ∈
		[x,y:X;w,z:W | r x y z w]⌝))
	),
	("z_∈_rename⋎s_conv 2",
	snd o dest_eq o concl o z_∈_rename⋎s_conv,
	(snd(strip_∀ ⓩ[X,W] (Π [x,y:X;w,z:W | r x y z w][q/x,s/y,t/v])⌝)),
	(snd(strip_∀ ⓩ[X,W] (x ≜ q, y ≜ s, w ≜ w, z ≜ z) ∈
		[x,y:X;w,z:W | r x y z w]⌝))
	),
	("z_∈_rename⋎s_conv 3",
	snd o dest_eq o concl o z_∈_rename⋎s_conv,
	ⓩv ∈ [ | p][q/x,s/y]⌝,
	ⓩ() ∈ [ | p]⌝
	)
];
store_mt_results mt_run_fail [
	("z_∈_rename⋎s_conv 43031 1",
	z_∈_rename⋎s_conv,
	mk_t,
	gen_fail_msg "z_∈_rename⋎s_conv" 43031 [trues]
	),
	("z_∈_rename⋎s_conv 43031 2",
	z_∈_rename⋎s_conv,
	ⓩx1 ∈ S⌝,
	gen_fail_msg "z_∈_rename⋎s_conv" 43031 [string_of_term ⓩx1 ∈ S⌝]
	)
];
store_mt_results mt_run_fail [
	("z_∈_rename⋎s_conv 43035",
	z_∈_rename⋎s_conv,
	ⓩp ∈ [x,x':X; y,z,w':Y| f w' x x' z y][p/x,y/x',r/s]⌝,
	gen_fail_msg "z_∈_rename⋎s_conv" 43035
		[string_of_term
		ⓩ[x,x':X; y,z,w':Y| f w' x x' z y][p/x,y/x',r/s]⌝]
	)
];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_rename⋎s_conv 1",
	snd o dest_eq o concl o z_rename⋎s_conv,
	ⓩ([x,y:X;w,z:W | r x y z w][q/x,s/y])⌝,
	ⓩ{x1 : 𝕌; x2 : 𝕌; x3 : 𝕌; x4 : 𝕌
	  | (w ≜ x3, x ≜ x1, y ≜ x2, z ≜ x4) ∈ [x, y : X; w, z : W | r x y z w]
	  ⦁ (q ≜ x1, s ≜ x2, w ≜ x3, z ≜ x4)}⌝
	),
	("z_rename⋎s_conv 2",
	snd o dest_eq o concl o z_rename⋎s_conv,
	ⓩ[ | p][q/x,s/y]⌝,
	ⓩ{ | () ∈ [ | p]}⌝
	)
];
store_mt_results mt_run_fail [
	("z_rename⋎s_conv 42027",
	z_rename⋎s_conv,
	mk_t,
	gen_fail_msg "Z_∈_ELIM_C" 42027 [trues]
	),
	("z_rename⋎s_conv 43031",
	z_rename⋎s_conv,
	ⓩS⌝,
	gen_fail_msg "z_∈_rename⋎s_conv" 43031 [∈_ss]
	)
];
store_mt_results mt_run_fail [
	("z_rename⋎s_conv 43035",
	z_rename⋎s_conv,
	ⓩ[x,x':X; y,z,w':Y| f w' x x' z y][p/x,y/x',r/s]⌝,
	gen_fail_msg "z_∈_rename⋎s_conv" 43035
		[string_of_term
		ⓩ[x,x':X; y,z,w':Y| f w' x x' z y][p/x,y/x',r/s]⌝]
	)
];
=TEX
\section{OTHERS}
=TEX
=SML
let
val tm1 = ⓩ{[x, y : 𝔹] | x = z}⌝;
val tm2 = subst[(ⓩx ∨ u⌝, ⓩz ⦂ 𝔹⌝)] tm1;
val tm3 = (hd o dest_z_decl) let val (d, _, _) = dest_z_seta tm2 in d end;
val tm4 = (hd o dest_z_decl) let val (d, _, _) = dest_z_seta tm1 in d end;
in
store_mt_results (mt_runf (op =$)) [
	("z_dec_rename⋎s_conv",
	snd o dest_eq o concl o z_dec_rename⋎s_conv,
	tm3,
	ⓜdec_ofⓩ[([x, y : 𝔹] [x'/x])]⌝⌝
	)
];
store_mt_results mt_run_fail [
	("z_dec_rename⋎s_conv 43060",
	z_dec_rename⋎s_conv,
	tm4,
	gen_fail_msg "z_dec_rename⋎s_conv" 43060
		[string_of_termⓜdec_ofⓩ[[x, y : 𝔹]]⌝⌝]
	)
]
end;
=TEX
\section{PROOF CONTEXTS}
The following is hardly a full test, but is a starting point:
=SML
push_merge_pcs ["z_predicates","'z_∈_set_lang",
	"'z_tuples_lang", "'z_bindings","'z_schemas"];

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
a(z_∃_tac ⓩ(θ[[S[X];(S[X])']; I[X];O[X]])⌝);
a(rewrite_tac[]);
a(REPEAT z_strip_tac);
(* *** Goal "2" *** *)
a(z_∃_tac ⓩ(θ[S[X];(S[X])'; I[X];O[X]])⌝);
a(rewrite_tac[]);
a(REPEAT z_strip_tac);
store_mt_results (mt_runf (op =$)) [
	("schema_proof_contexts",
	concl o pop_thm,
	(),
	ⓩ[X] (∃[[S[X];(S[X])']; I[X];O[X]] | p x x' y z⦁ true) ⇔
	(∃ S[X];(S[X])'; I[X];O[X] | p x x' y z⦁ true)⌝
	)
];
=TEX
=SML
push_merge_pcs ["z_predicates","'z_∈_set_lang","'z_sets_ext_lang",
	"'z_tuples_lang", "'z_bindings","'z_schemas"];

push_goal([],ⓩ ([s,s' :𝕌 | s' ⇔ ¬ s] ⨾⋎s [s,s' :𝕌 | s' ⇔ ¬ s]) = [s,s' : 𝕌 | s ⇔ s']⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(asm_rewrite_tac[]);
a(prove_tac[]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[]);
a(z_∃_tac ⓩfalse⌝);
a(rewrite_tac[]);
store_mt_results (mt_runf (op =$)) [
	("schema_proof_contexts 2",
	concl o pop_thm,
	(),
	ⓩ([s,s' :𝕌 | s' ⇔ ¬ s] ⨾⋎s [s,s' :𝕌 | s' ⇔ ¬ s]) = [s,s' : 𝕌 | s ⇔ s']⌝
	)
];
=TEX
=SML
push_goal([],ⓩ(¬ (∀ [x,y:X| r x y] | p x ⦁ [x,y,z:X | q x y z]) ⦂ 𝕌)
 =
	((∃ [x,y:X| r x y] | p x ⦁ ¬ [x,y,z:X | q x y z]) ⦂ 𝕌)⌝);
a(rewrite_tac[]);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(z_∃_tac ⓩx2⌝ THEN REPEAT strip_tac);
(* *** Goal "2" *** *)
a(z_∃_tac ⓩx2⌝ THEN REPEAT strip_tac);
(* *** Goal "3" *** *)
a(z_∃_tac ⓩx2⌝ THEN REPEAT strip_tac);
(* *** Goal "4" *** *)
a(z_∃_tac ⓩx2⌝ THEN REPEAT strip_tac);

store_mt_results (mt_runf (op =$)) [
	("schema_proof_contexts 3",
	concl o pop_thm,
	(),
	ⓩ(¬ (∀ [x,y:X| r x y] | p x ⦁ [x,y,z:X | q x y z]) ⦂ 𝕌)
 =
	((∃ [x,y:X| r x y] | p x ⦁ ¬ [x,y,z:X | q x y z]) ⦂ 𝕌)⌝
	)
];
=TEX

Check everything is there:
=SML
push_pc "'z_schemas";
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
store_mt_results (mt_runf (op =$)) [
	("",
	tac_res ,
	ⓩ⌝,
	ⓩ⌝
	),
	...
];
store_mt_results (mt_runf (op =$)) [
	("",
	snd o dest_eq o concl o ,
	ⓩ⌝,
	ⓩ⌝
	),
	...
];
store_mt_results mt_run_fail [
	("",
	,
	,
	gen_fail_msg ""  []
	),
	...
];
store_mt_results (mt_runf (op =#)) [
	("",
	tac_res1 ,
	([ⓩ⌝],ⓩ⌝),
	([ⓩ⌝],ⓩ⌝)
	),
	...
];
store_mt_results (mt_runf (list_eq (op =#))) [
	("",
	tac_ress  2,
	([ⓩ⌝],ⓩ⌝),
	[([ⓩ⌝],ⓩ⌝),([ⓩ⌝],ⓩ⌝)]
	),
	...
];
store_mt_results mt_runf [
	("",
	tac_solve ,
	([],ⓩ⌝),
	true
	),
	...
];
store_mt_results mt_run_fail [
	("",
	tac_fail ,
	([],ⓩ⌝),
	gen_fail_msg ""  []
	),
	...
];
store_mt_results mt_run [
	("",
	,
	,
	),
	...
];
store_mt_results mt_run_fail [
	("",
	,
	,
	gen_fail_msg ""  []
	),
	...
];


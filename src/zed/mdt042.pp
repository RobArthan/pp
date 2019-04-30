=IGN
********************************************************************************
mdt042.doc: this file is part of the PPZed system

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

\def\Title{Module Tests for Z Expressions}

\def\AbstractText{This document gives the module tests for the rules and tactics for the Z set theory.}

\def\Reference{DS/FMU/IED/MDT042}

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
%% LaTeX2e port: \TPPtitle{Module Tests for Z Expressions}
%% LaTeX2e port: \TPPref{DS/FMU/IED/MDT042}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.34 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2012/12/27 12:26:31 $ %
%% LaTeX2e port: }}  %% Mandatory field
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.~Blackburn & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{R.D.~Arthan & WIN01 \\ K.~Blackburn & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document gives the module tests for the
%% LaTeX2e port: rules and tactics for the Z set theory.}
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
\item [Issue 1.1 (1992/09/10)]
First version.
\item [Issue 1.2 (1992/09/14) (14th September 1992)]
Added theory check.
\item [Issue 1.3 (1992/09/16) (12th October 1992)]
Split library material into \cite{DS/FMU/IED/MDT083}.
\item [Issue 1.8 (1992/10/30), 1.9 (1992/10/30) (30th October 1992)]
Reorganising Z theory material.
\item [Issue 1.10 (1992/11/12) (13th November)]
Removed duplicated tests.
\item [Issue 1.10 (1992/11/12) (3rd December 1992)]
Parser error corrected.
\item [Issue 1.11 (1992/11/13) (3rd December 1992)]
Gained $∈\_C$, and $Z\-\_∈\-\_ELIM\-\_C$, handling of literals, sequences, and $∈\-\_λ\-\_conv$.
\item [Issue 1.13 (1992/12/08), 7th December 1992]
Fixing problems from changes to generic formals.
\item [Issue 1.14 (1992/12/09), 9th December 1992]
Bug fixing.
\item [Issue 1.15 (1992/12/10), 10th December 1992]
Added string literals.
\item[Issue 1.16 (1992/12/11) (10th December 1992)]
Global rename from wrk038.doc issue 1.9.
\item[Issue 1.17 (1992/12/17) (17th December 1992)]
Enhanced treatment of bindings.
\item[Issue 1.18 (1993/01/21) (21st January 1993)]
Added module tests for extensionality.
\item[Issue 1.20 (1993/02/10) (10th February 1993)]
Reacting to changes in proof contexts, et al.
\item[Issue 1.20 (1993/02/10) (12th February 1993)]
Testing improved $z\_β\_conv$.
\item[Issue 1.23 (1993/12/17) (17th December 1993)]
Added tests for $z\_⟨⟩\_conv$.
\item[Issue 1.24 (1996/03/12)]
Accomodated fixes to bug 184.
\item[Issue 1.25 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.26 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.27 (2004/01/19)] The Z universal set is now called 𝕌.
\item[Issue 1.28 (2005/09/07)] Added test for {\em z\_let\_conv1} and {\em z\_let\_conv}.
\item[Issue 1.29 (2005/09/09)] BOOL and CHAR now renamed as 𝔹 and 𝕊.
\item[Issue 1.30 (2006/01/12)] Allowed for correction to let-expression syntax.
\item[Issue 1.31 (2006/08/28)] More tests for {\em z\_let\_conv}.
\item[Issue 1.32 (2008/04/13)] Added regression test for fix in {\em z\_let\_conv}.
\item[Issue 1.33 (2010/04/05)] Added tests for empty schemas.
\item[Issues 1.34 (2012/12/27), 1.35 (2012/12/30)] Regression tests for improvements/fixes to {\em z\_∈\_seta\_conv1}.
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
whose detailed design is given in \cite{DS/FMU/IED/DTD042}.
\subsection{Introduction}
This document contains the module tests for the material
whose detailed design is given in \cite{DS/FMU/IED/DTD042}.
This consists of demonstrating at least the simpler uses of the
functions in question.
\subsubsection{Dependencies}
The tests depend upon \cite{DS/FMU/IED/IMP042} and \cite{DS/FMU/IED/IMP013}.
In addition, testing by the subgoal package (section \ref{subgoalpackage})
depends on \cite{DS/FMU/IED/IMP030}.
\subsubsection{Deficiencies}
The testing could be more rigorous.
\section{TEST CASES}
The functions are tested in their order of presentation in the detailed design.
$∈\_C$, and $Z\-\_∈\-\_ELIM\-\_C$ are tested by their
use in implementing other functions, especially in
\cite{DS/FMU/IED/MDT043}.
\section{PREAMBLE}
=SML
val _ = (open_theory ⦏"imp042"⦎; new_parent "z_sets")
	handle Fail _ => open_theory "z_sets"; (* to access ⦂ *)
delete_theory "temp" handle _ => ();
new_theory "temp";
use_file "dtd013";
use_file "imp013";
init_mt_results();
(* set_flag("subgoal_package_quiet",true); *)
repeat drop_main_goal;
set_flag("check_is_z",true);
=TEX
=SML
set_flag ("z_type_check_only", false);
set_flag ("z_use_axioms", true);
=TEX
=SML
push_merge_pcs ["z_predicates","'z_∈_set_lang", "'z_tuples_lang"];
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
=SML
val aset = ⓩ{a,b:X; c:Y | ¬(a = b) ⦁ (a,b,c)}⌝;
val (asetd, asetp, asetv) = dest_z_seta aset;
val atuple3 = ⓩ((p ⦂ a),(q ⦂ a),(r ⦂ b))⌝;
val notz = ⌜∃ x ⦁ x = y⌝;
val trues = string_of_term mk_t;
val notzs = string_of_term notz;
=TEX
\section{TESTS}
\subsection{Concerning μ}
=SML
store_mt_results (mt_runf (op =$)) [(
	"z_μ_rule 1",
	concl o z_μ_rule,
	ⓩμ x,y:X;z:Y;p:X | z ⦁ p(x = y)⌝,
	ⓩ∀ x':𝕌 ⦁(∀ x, y : X; z : Y; p : X | z ⦁ p (x = y) = x')
	∧
	(∃ x, y : X; z : Y; p : X | z ⦁ p (x = y) = x')
	⇒
	((μ x, y : X; z : Y; p : X | z ⦁ p (x = y)) = x')⌝),
	("z_μ_rule 2",
	concl o z_μ_rule,
	ⓩμ x:X | f x ⦁ p x⌝,
	(inst[] [(ⓣ'a⌝, ⓣ'b⌝), (ⓣ'b⌝, ⓣ'a⌝)] ⓩ∀ x':𝕌 ⦁
	(∀ x :X | f x ⦁ p x = x')
	∧
	(∃ x:X | f x ⦁ p x = x')
	⇒
	((μ x:X | f x ⦁ p x) = x')⌝)),
	("z_μ_rule 3",
	concl o z_μ_rule,
	ⓩ(μ | f)⌝,
	ⓩ∀ x:𝕌 ⦁
	(∀ | f ⦁ () = x)
	∧
	(∃ | f ⦁ () = x)
	⇒
	((μ | f) = x)⌝),
	("z_μ_rule 4",
	concl o z_μ_rule,
	ⓩμ | f ⦁ p⌝,
	ⓩ∀ x:𝕌 ⦁
	(∀ | f ⦁ p = x)
	∧
	(∃ | f ⦁ p = x)
	⇒
	((μ | f ⦁ p) = x)⌝),
	("z_μ_rule 5",
	concl o z_μ_rule,
	ⓩμ [[]]; [] | f ⦁ p⌝,
	ⓩ∀ x:𝕌 ⦁
	(∀ [[]]; [] | f ⦁ p = x)
	∧
	(∃ [[]]; [] | f ⦁ p = x)
	⇒
	((μ [[]]; [] | f ⦁ p) = x)⌝)
	];
=TEX
=SML
store_mt_results mt_run_fail [
	("z_μ_rule 47210",
	z_μ_rule,
	mk_t,
	gen_fail_msg "z_μ_rule" 47210 [trues])];
=TEX
\subsection{Concerning let-expressions}
=SML
store_mt_results (mt_runf (op =$)) [(
	"z_let_conv1 1",
	concl o z_let_conv1,
	ⓩlet x ≜ 42 ⦁ (x, x)⌝,
	ⓩ(let x ≜ 42 ⦁ (x, x)) = (μ x : {42} ⦁ (x, x))⌝)];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [(
	"z_let_conv 1",
	concl o z_let_conv,
	ⓩlet x ≜ 42 ⦁ (x, x)⌝,
	ⓩ(let x ≜ 42 ⦁ (x, x)) = (42, 42)⌝),
	("z_let_conv 2",
	concl o z_let_conv,
	ⓩlet x ≜ 42; y ≜ (99, 100) ⦁ (x, y.2, y.1)⌝,
	ⓩ(let x ≜ 42; y ≜ (99, 100) ⦁ (x, y.2, y.1)) = (42, (99, 100).2, (99, 100).1) ⌝),
	("z_let_conv 3",
	concl o z_let_conv,
	ⓩlet x ≜ 42; y ≜ (99, 100); x ≜ 42 ⦁ (x, y.2, y.1)⌝,
	ⓩ(let x ≜ 42; y ≜ (99, 100); x ≜ 42 ⦁ (x, y.2, y.1)) = (42, (99, 100).2, (99, 100).1) ⌝)];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [(
	"z_let_conv 4",
	concl o z_let_conv,
	ⓩlet x ≜ 1; y ≜ x; x ≜ y ⦁ (x, 1)⌝,
	ⓩ(let x ≜ 1; y ≜ x; x ≜ y ⦁ (x, 1)) = (1, 1)⌝),
	("z_let_conv 5",
	concl o z_let_conv,
	ⓩlet x ≜ 1; x ≜ y; y ≜ x ⦁ (x, 1)⌝,
	ⓩ(let x ≜ 1; x ≜ y; y ≜ x ⦁ (x, 1)) = (1, 1) ⌝)];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [(
	"z_let_conv 6",
	concl o z_let_conv,
	ⓩlet xx ≜ (a ⦂ ℤ) ⦁ xx⌝,
	ⓩ(let xx ≜ (a ⦂ ℤ) ⦁ xx) = a⌝)];
=TEX
=SML
store_mt_results mt_run_fail [
	("z_let_conv1 47211",
	z_let_conv1,
	mk_t,
	gen_fail_msg "z_let_conv1" 47211 [trues]),
	("z_let_conv 47211",
	z_let_conv,
	mk_t,
	gen_fail_msg "z_let_conv" 47211 [trues]),
	("z_let_conv 42029",
	z_let_conv,
	ⓩlet x ≜ 42; x ≜ 99 ⦁ x⌝,
	gen_fail_msg "z_let_conv" 42029 ["ⓩlet x ≜ 42; x ≜ 99 ⦁ x⌝"])];
=TEX
\subsection{Concerning Function Application}
=SML
store_mt_results (mt_runf (op =$)) [(
	"z_app_conv",
	snd o dest_eq o concl o z_app_conv,
	ⓩp (q⦂a)⌝,
	inst [] [(ⓣ'a⌝,ⓣ'b⌝),(ⓣ'b⌝,ⓣ'a⌝)]
	ⓩ(μ f_a :𝕌 | (q ,f_a) ∈ (p ⦂ ℙ(a × b)) ⦁ f_a)⌝)];
store_mt_results mt_run_fail [
	("z_app_conv 47210",
	z_app_conv,
	mk_t,
	gen_fail_msg "z_app_conv" 47190 [trues])];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_app_eq_tac 1",
	tac_res z_app_eq_tac,
	(snd(strip_∀ ⓩ[a,b](p⦂ ℙ(a × b)) q = r⌝)),
	(snd(strip_∀ ⓩ[a,b] (∀ f_a : 𝕌 | (q, f_a) ∈ (p ⦂ ℙ(a × b)) ⦁ f_a = r) ∧
		(q, r) ∈ p⌝))),
	("z_app_eq_tac 2",
	tac_res z_app_eq_tac,
	ⓩ(r ⦂ {true,false}) ⇔ p (q⦂a)⌝,
	ⓩ (∀ f_a : 𝕌 | ((q⦂a), (f_a⦂ {true,false})) ∈ p ⦁ f_a ⇔ r) ∧
		(q, r) ∈ p⌝),
	("z_app_eq_tac 3",
	tac_res z_app_eq_tac,
	ⓩ⌜p:('a, BOOL) $"Z'T[2]" SET⌝ q⌝,
	ⓩ (∀ f_a : 𝕌 | (q, f_a) ∈ ⌜p:('a, BOOL) $"Z'T[2]" SET⌝ ⦁ f_a = true) ∧
		(q, true) ∈ ⌜p:('a, BOOL) $"Z'T[2]" SET⌝⌝)];
store_mt_results mt_run_fail [
	("z_app_eq_tac 42002",
	tac_fail z_app_eq_tac,
	([],mk_t),
	gen_fail_msg "z_app_eq_tac" 42002 [])];
=TEX
\subsection{Concerning λ}
=SML
store_mt_results (mt_runf (op =$)) [
	("z_λ_conv 1",
	snd o dest_eq o concl o z_λ_conv,
	ⓩλ x,y:X;a:Y | f x ⦁ g y a⌝,
	ⓩ{x, y : X; a : Y | f x ⦁ ((x, y, a), ((g y) a))}⌝),
	("z_λ_conv 1b",
	snd o dest_eq o concl o z_λ_conv,
	ⓩλ x:X | f x ⦁ g x⌝,
	ⓩ{x : X | f x ⦁ (x, g x)}⌝),
	("z_λ_conv 2",
	snd o dest_eq o concl o z_λ_conv,
	ⓩλ [z:Y;x,y : X| x = y] | g x ⦁ f z x⌝,
	ⓩ{[z : Y; x, y : X | x = y]
	| g x
	⦁ ((θ[z : Y; x, y : X | x = y]), ((f z) x))}⌝),
	("z_λ_conv 3",
	snd o dest_eq o concl o z_λ_conv,
	ⓩλ [x,y : X | x = y] | g x ⦁ f x⌝,
	ⓩ{[x, y : X | x = y] | g x ⦁ ((θ[x, y : X | x = y]), (f x))}⌝),
	("z_λ_conv 4",
	snd o dest_eq o concl o z_λ_conv,
	ⓩλ | g ⦁ f⌝,
	ⓩ{ | g ⦁ ((), f)}⌝),
	("z_λ_conv 5",
	snd o dest_eq o concl o z_λ_conv,
	ⓩλ [] | g ⦁ f⌝,
	ⓩ{[] | g ⦁ (θ[], f)}⌝)
	];
store_mt_results mt_run_fail [
	("z_λ_conv 47200",
	z_λ_conv,
	mk_t,
	gen_fail_msg "z_λ_conv" 47200 [trues])];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_∈_λ_conv 1",
	snd o dest_eq o concl o z_∈_λ_conv,
	ⓩv ∈ (λ x,y:X;a:Y | f x ⦁ g y a)⌝,
	ⓩv ∈ {x, y : X; a : Y | f x ⦁ ((x, y, a), ((g y) a))}⌝),
	("z_∈_λ_conv 1b",
	snd o dest_eq o concl o z_∈_λ_conv,
	ⓩv ∈ (λ x:X | f x ⦁ g x)⌝,
	ⓩv ∈ {x : X | f x ⦁ (x, g x)}⌝),
	("z_∈_λ_conv 2",
	snd o dest_eq o concl o z_∈_λ_conv,
	ⓩv ∈ (λ [z:Y;x,y : X| x = y] | g x ⦁ f z x)⌝,
	ⓩv ∈ {[z : Y; x, y : X | x = y]
	| g x
	⦁ ((θ[z : Y; x, y : X | x = y]), ((f z) x))}⌝),
	("z_∈_λ_conv 3",
	snd o dest_eq o concl o z_∈_λ_conv,
	ⓩv ∈ (λ [x,y : X | x = y] | g x ⦁ f x)⌝,
	ⓩv ∈ {[x, y : X | x = y] | g x ⦁ ((θ[x, y : X | x = y]), (f x))}⌝),
	("z_∈_λ_conv 4",
	snd o dest_eq o concl o z_∈_λ_conv,
	ⓩv ∈ (λ | g ⦁ f)⌝,
	ⓩv ∈ { | g ⦁ ((), f)}⌝),
	("z_∈_λ_conv 5",
	snd o dest_eq o concl o z_∈_λ_conv,
	ⓩv ∈ (λ [] | g ⦁ f)⌝,
	ⓩv ∈ {[] | g ⦁ (θ[], f)}⌝)
	];
store_mt_results mt_run_fail [
	("z_∈_λ_conv 42028",
	z_∈_λ_conv,
	mk_t,
	gen_fail_msg "∈_C" 42028 [trues]),
	("z_∈_λ_conv 47200",
	z_∈_λ_conv,
	ⓩx ∈ y⌝,
	gen_fail_msg "z_λ_conv" 47200 [string_of_term ⓩy⌝])
	];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_app_λ_rule 1",
	concl o z_app_λ_rule,
	ⓩ(λ x,y : X; z:Y | x = y ⦁ (f z x ⦂ b)) (1,2,(g⦂a))⌝,
	inst [] [(ⓣ'a⌝,ⓣ'b⌝),(ⓣ'b⌝,ⓣ'a⌝)]
	ⓩ(∀ x':𝕌
	⦁  (∀ f_a : 𝕌 | (∃ x, y : X; z : Y
            | x = y
            ⦁ ((x, y, z) = (1, 2, (g ⦂ a)))
            ∧ ((f z) x = (f_a ⦂ b)))
          ⦁ f_a = x')
        ∧ (∃ x, y : X; z : Y
          | x = y ⦁ ((x, y, z) = (1, 2, g))
          ∧ ((f z) x = x'))
      ⇒ (λ x, y : X; z : Y | x = y ⦁ (f z) x) (1, 2, g) = x')⌝),
	("z_app_λ_rule 2",
	concl o z_app_λ_rule,
	ⓩ(λ z : X | f z ⦁ (g z ⦂ b)) (y ⦂ a)⌝,
	inst [] [(ⓣ'a⌝,ⓣ'b⌝),(ⓣ'b⌝,ⓣ'a⌝)]
	ⓩ(∀ x: 𝕌 ⦁ (∀ f_a : 𝕌
          | (∃ z : X | f z ⦁ (z = (y ⦂ a)) ∧ (g z ⦂ b = f_a))
          ⦁ f_a
          = (x ⦂ b))
        ∧ (∃ z : X | f z ⦁ (z = y) ∧ (g z = x))
      ⇒ (λ z : X | f z ⦁ g z) y = x)⌝),
	("z_app_λ_rule 3",
	concl o z_app_λ_rule,
	ⓩ(λ [x,y : X; z:Y| x = y] | g x ⦁ f z x) (x ≜ 1,y ≜ 2,z ≜ g)⌝,
	ⓩ∀ x':𝕌
	⦁ (∀ f_a : 𝕌
          | (∃ [x, y : X; z : Y | x = y]
            | g x
            ⦁ (θ[x, y : X; z : Y | x = y] = (x ≜ 1, y ≜ 2, z ≜ g))
            ∧ ((f z) x = f_a))
          ⦁ f_a
          = x')
        ∧ (∃ [x, y : X; z : Y | x = y]
          | g x
          ⦁ (θ[x, y : X; z : Y | x = y] = (x ≜ 1, y ≜ 2, z ≜ g))
          ∧ ((f z) x = x'))
      ⇒ (λ [x, y : X; z : Y | x = y] | g x ⦁ (f z) x)
            (x ≜ 1, y ≜ 2, z ≜ g)
        = x'⌝),
	("z_app_λ_rule 4",
	concl o z_app_λ_rule,
	ⓩ(λ | g ⦁ f) ()⌝,
	ⓩ∀ x:𝕌
	⦁ (∀ f_a : 𝕌
          | (∃
            | g
            ⦁ () = ()
            ∧ f = f_a)
          ⦁ f_a
          = x)
        ∧ (∃
          | g
          ⦁ () = ()
          ∧ f = x)
      ⇒ (λ | g ⦁ f)
            ()
        = x⌝),
	("z_app_λ_rule 5",
	concl o z_app_λ_rule,
	ⓩ(λ [[]]; [] | g ⦁ f) (a, b)⌝,
	ⓩ∀ x:𝕌
	⦁ (∀ f_a : 𝕌
          | (∃ [[]]; []
            | g
            ⦁ (θ[[]], θ[]) = (a, b)
            ∧ f = f_a)
          ⦁ f_a
          = x)
        ∧ (∃ [[]]; []
          | g
          ⦁ (θ[[]], θ[]) = (a, b)
          ∧ f = x)
      ⇒ (λ [[]]; [] | g ⦁ f)
            (a, b)
        = x⌝)
	];

store_mt_results mt_run_fail [
	("z_app_λ_rule 42008",
	z_app_λ_rule,
	mk_t,
	gen_fail_msg "z_app_λ_rule" 42008 [trues])];
=TEX
=SML
store_mt_results (mt_runf (op =#)) [
	("z_β_conv 1",
	dest_thm o z_β_conv,
	ⓩ(λ x : X | f (x⦂a) ⦁ g x ⦂ b) y⌝,
	([(snd(strip_∀ ⓩ[a,b] f (y⦂a) ⦂ {true,false}⌝)),
	(snd(strip_∀ ⓩ[a](y⦂a) ∈ X⌝))],
	ⓩ(λ x : X | f (x⦂a) ⦁ g x ⦂ b) y = g y⌝)),
	("z_β_conv 2",
	dest_thm o z_β_conv,
	ⓩ(λ p : 𝕌 | f (p⦂a) ⦁ g p (q⦂b) ⦂ c) y⌝,
	([(snd(strip_∀ ⓩ[a,b] f (y⦂a) ⦂ {true,false}⌝))],
	 ⓩ(λ p : 𝕌 | f (p⦂a) ⦁ g p (q⦂b) ⦂ c) y = (g y) q⌝)),
	("z_β_conv 3",
	dest_thm o z_β_conv,
	ⓩ(λ p : 𝕌 ⦁ g p q) y⌝,
	([],ⓩ(λ p : 𝕌 ⦁ (g p) q) y = (g y) q⌝)),
	("z_β_conv 4",
	dest_thm o z_β_conv,
	ⓩ(λ x : X | f (x⦂a) ⦁ g x ⦂ b) x⌝,
	([(snd(strip_∀ ⓩ[a,b] f (x⦂a) ⦂ {true,false}⌝)),
	ⓩ(x⦂a) ∈ X⌝],
	ⓩ(λ x : X | f (x⦂a) ⦁ g x⦂ b) x = g x⌝)),
	("z_β_conv 5",
	dest_thm o z_β_conv,
	ⓩ(λ p : 𝕌 ⦁ p = y) y⌝,
	([],ⓩ(λ p : 𝕌 ⦁ p = y) y ⇔ (y = y)⌝))
	];
=TEX
=SML
store_mt_results mt_run_fail [
	("z_β_conv 42012",
	z_β_conv,
	mk_t,
	gen_fail_msg "z_β_conv" 42012 [trues])];
=TEX
\subsection{Set Abstraction}
=SML
store_mt_results (mt_runf (op =$)) [("z_∈_seta_conv 1",
	snd o dest_eq o concl o z_∈_seta_conv,
	ⓩt ∈ {x:𝕌}⌝,
	ⓩ∃ x:𝕌 ⦁ x = t⌝),
	("z_∈_seta_conv 2",
	snd o dest_eq o concl o z_∈_seta_conv,
	(snd(strip_∀ ⓩ[X] t ∈ {x:X}⌝)),
	(snd(strip_∀ ⓩ[X] (∃ x:X ⦁ x = t)⌝))),
	("z_∈_seta_conv 3",
	snd o dest_eq o concl o z_∈_seta_conv,
	(snd(strip_∀ ⓩ[X,Y] t ∈ {x,y:X; z:Y| p x y z}⌝)),
	(snd(strip_∀ ⓩ[X,Y] (∃ x,y:X; z:Y| p x y z ⦁ (x,y,z) = t)⌝))),
	("z_∈_seta_conv 4",
	snd o dest_eq o concl o z_∈_seta_conv,
	(snd(strip_∀ ⓩ[X,Y] t ∈ {x,y:X; z:Y| p x y z ⦁ q x y z}⌝)),
	(snd(strip_∀ ⓩ[X,Y] (∃ x,y:X; z:Y | p x y z ⦁ q x y z = t)⌝))),
	("z_∈_seta_conv 5",
	snd o dest_eq o concl o z_∈_seta_conv,
	(snd(strip_∀ ⓩ[X,Y] (a,b,c) ∈ {x,y:X; z:Y| p x y z}⌝)),
	(snd(strip_∀ ⓩ[X,Y] (∃ x,y:X; z:Y | p x y z ⦁ (x,y,z) = (a,b,c))⌝))),
	("z_∈_seta_conv 6",
	snd o dest_eq o concl o z_∈_seta_conv,
	(snd(strip_∀ ⓩ[X,Y] t ∈ {x,y:X; [r,s:Y | r = s]| p x y r s}⌝)),
	(snd(strip_∀ ⓩ[X,Y] (∃ x, y : X; [r, s : Y | r = s]
	 | p x y r s
	  ⦁ (x, y, θ[r, s : Y | r = s]) = t)⌝))),
	("z_∈_seta_conv 7",
	snd o dest_eq o concl o z_∈_seta_conv,
	snd(strip_∀(ⓩ[X,Y] t ∈ {𝕌 ⦂ ℙ [a : X × Y]; [[]] | p a}⌝)),
	snd(strip_∀(ⓩ[X,Y] (∃ 𝕌 ⦂ ℙ [a : X × Y]; [[]] | p a ⦁ (θ(𝕌 ⦂ ℙ [a : X × Y]), θ[[]]) = t)⌝))),
	("z_∈_seta_conv 8",
	snd o dest_eq o concl o z_∈_seta_conv,
	ⓩt ∈ { | p}⌝,
	ⓩ∃ | p ⦁ () = t⌝),
	("z_∈_seta_conv 9",
	snd o dest_eq o concl o z_∈_seta_conv,
	ⓩt ∈ {[] | p}⌝,
	ⓩ∃ [] | p ⦁ θ[] = t⌝),
	("z_∈_seta_conv 10",
	snd o dest_eq o concl o z_∈_seta_conv,
	ⓩt ∈ {[]; [[]] | p}⌝,
	ⓩ∃ []; [[]] | p ⦁ (θ[], θ[[]]) = t⌝),
	("z_∈_seta_conv 11",
	snd o dest_eq o concl o z_∈_seta_conv,
	ⓩt ∈ { | p ⦁ b}⌝,
	ⓩ∃ | p ⦁ b = t⌝)
	];
=TEX
=SML
store_mt_results mt_run_fail [("z_∈_seta_conv 42001 a",
	z_∈_seta_conv,
	mk_t,
	gen_fail_msg "z_∈_seta_conv" 42001 [trues]),
	("z_∈_seta_conv 42001 b",
	z_∈_seta_conv,
	notz,
	gen_fail_msg "z_∈_seta_conv" 42001 [notzs])];
=TEX
=SML
store_mt_results_show (mt_runf (op =$)) [
	("z_∈_seta_conv1 1",
	snd o dest_eq o concl o z_∈_seta_conv1,
	ⓩt ∈ {x:𝕌}⌝,
	ⓩtrue⌝),
	("z_∈_seta_conv1 2",
	snd o dest_eq o concl o z_∈_seta_conv1,
	(snd(strip_∀ ⓩ[X] t ∈ {x:X}⌝)),
	(snd(strip_∀ ⓩ[X] t ∈ X⌝))),
	("z_∈_seta_conv1 3",
	snd o dest_eq o concl o z_∈_seta_conv1,
	(snd(strip_∀ ⓩ[X,Y] t ∈ {x,y:X; z:Y| p x y z}⌝)),
	(snd(strip_∀ ⓩ[X,Y] ({(t ⦂ (X × X × Y)).1, t.2} ⊆ X ∧
		t.3 ∈ Y) ∧ p t.1 t.2 t.3⌝))),
	("z_∈_seta_conv1 4",
	snd o dest_eq o concl o z_∈_seta_conv1,
	(snd(strip_∀ ⓩ[X,Y] t ∈ {x,y:X; z:Y| p x y z ⦁ q x y z}⌝)),
	(snd(strip_∀ ⓩ[X,Y] (∃ x,y:X; z:Y | p x y z ⦁ q x y z = t)⌝))),
	("z_∈_seta_conv1 5",
	snd o dest_eq o concl o z_∈_seta_conv1,
	(snd(strip_∀ ⓩ[X,Y] (a,b,c) ∈ {x,y:X; z:Y| p x y z}⌝)),
	(snd(strip_∀ ⓩ[X,Y] ({a, b} ⊆ X ∧ c ∈ Y) ∧ p a b c ⦂ {true,false}⌝))),
	("z_∈_seta_conv1 6",
	snd o dest_eq o concl o z_∈_seta_conv1,
	(snd(strip_∀ ⓩ[X,Y] (t⦂ (X × X × Y)) ∈ {x,y:𝕌; z:𝕌| p x y z}⌝)),
	(snd(strip_∀ ⓩ[X,Y] p (t ⦂ (X × X × Y)).1 t.2 t.3 ⦂ {true,false}⌝))),
	("z_∈_seta_conv1 7",
	snd o dest_eq o concl o z_∈_seta_conv1,
	(snd(strip_∀ ⓩ[X,Y] t ∈ {x,y:X; [r,s:Y | r = s]| p x y r s}⌝)),
	(snd(strip_∀ ⓩ[X,Y]
	  ({(t ⦂ (X × X × [r,s:Y])).1, t.2} ⊆ X
	   ∧ (r ≜ t.3.r, s ≜ t.3.s) ∈ [r, s : Y | r = s])
	   ∧ p t.1 t.2 t.3.r t.3.s⌝))),
	("z_∈_seta_conv1 8",
	snd o dest_eq o concl o z_∈_seta_conv1,
	(snd(strip_∀ ⓩ[X,Y] (a,b,c) ∈ {x,y:X; [r,s:Y | r = s]| p x y r s}⌝)),
	(snd(strip_∀ ⓩ[X,Y]
	  ({a, b} ⊆ X
	   ∧ (r ≜ (c⦂[r,s:Y]).r, s ≜ c.s) ∈ [r, s : Y | r = s])
	   ∧ p a b c.r c.s⌝))),
	("z_∈_seta_conv1 9",
	snd o dest_eq o concl o z_∈_seta_conv1,
	(snd(strip_∀ ⓩ[X,Y] (a,b,(r ≜ c, s ≜ d)) ∈ {x,y:X; [r,s:Y | r = s]| p x y r s}⌝)),
	(snd(strip_∀ ⓩ[X,Y]
	  ({a, b} ⊆ X
	   ∧ (r ≜ c, s ≜ d) ∈ [r, s : Y | r = s])
	   ∧ p a b c d⌝))),
	("z_∈_seta_conv1 10",
	snd o dest_eq o concl o z_∈_seta_conv1,
	(snd(strip_∀ ⓩ[X,Y] t ∈ {x:X; y:[r,s:Y | r = s]}⌝)),
	(snd(strip_∀ ⓩ[X,Y] (t ⦂ (X × [r,s:Y])).1 ∈ X ∧ t.2 ∈ [r,s:Y | r = s]⌝))),
	("z_∈_seta_conv1 11",
	snd o dest_eq o concl o z_∈_seta_conv1,
	(snd(strip_∀ ⓩ[X,Y] (a,b) ∈ {x:X; y:[r,s:Y | r = s]}⌝)),
	(snd(strip_∀ ⓩ[X,Y] a ∈ X ∧ b ∈ [r,s:Y | r = s]⌝))),
	("z_∈_seta_conv1 12",
	snd o dest_eq o concl o z_∈_seta_conv1,
	snd(strip_∀(ⓩ[X,Y] t ∈ {𝕌 ⦂ ℙ [a : X × Y]; [[]] | p a}⌝)),
	snd(strip_∀(ⓩ[X,Y] p (t ⦂ ([a : X × Y] × [])).1.a⌝))),
	("z_∈_seta_conv1 13",
	snd o dest_eq o concl o z_∈_seta_conv1,
	ⓩt ∈ { | p}⌝,
	ⓩΠ p⌝),
	("z_∈_seta_conv1 14",
	snd o dest_eq o concl o z_∈_seta_conv1,
	ⓩ() ∈ { | p}⌝,
	ⓩΠ p⌝),
	("z_∈_seta_conv1 15",
	snd o dest_eq o concl o z_∈_seta_conv1,
	ⓩt ∈ {[] | p}⌝,
	ⓩΠ p⌝),
	("z_∈_seta_conv1 16",
	snd o dest_eq o concl o z_∈_seta_conv1,
	ⓩ() ∈ {[] | p}⌝,
	ⓩΠ p⌝),
	("z_∈_seta_conv1 17",
	snd o dest_eq o concl o z_∈_seta_conv1,
	ⓩt ∈ {[]; [[]] | p}⌝,
	ⓩΠ p⌝),
	("z_∈_seta_conv1 18",
	snd o dest_eq o concl o z_∈_seta_conv1,
	ⓩ(a, b) ∈ {[]; [[]] | p}⌝,
	ⓩΠ p⌝),
	("z_∈_seta_conv1 19",
	snd o dest_eq o concl o z_∈_seta_conv1,
	ⓩ((), ()) ∈ {[]; [[]] | p}⌝,
	ⓩΠ p⌝),
	("z_∈_seta_conv1 20",
	snd o dest_eq o concl o z_∈_seta_conv1,
	ⓩt ∈ {x : 𝕌 | p ⦁ ⌜f (x : BOOL) : BOOL⌝}⌝,
	ⓩ∃ x : 𝕌 | p ⦁ ⌜f (x : BOOL) : BOOL⌝ = t⌝),
	("z_∈_seta_conv1 21",
	snd o dest_eq o concl o z_∈_seta_conv1,
	ⓩt ∈ {x : 𝕌 ⦁ (a ≜ x, b ≜ 100)}⌝,
	ⓩ100 = (t ⦂ [a : 𝕌; b : 𝕌]).b⌝)
];
=TEX
=SML
store_mt_results mt_run_fail [("z_∈_seta_conv1 42001 a",
	z_∈_seta_conv1,
	mk_t,
	gen_fail_msg "z_∈_seta_conv1" 42001 [trues]),
	("z_∈_seta_conv1 42001 b",
	z_∈_seta_conv1,
	notz,
	gen_fail_msg "z_∈_seta_conv1" 42001 [notzs])];
=TEX
\subsection{Set Display}
Difficult to provoke error 42008.
=SML
store_mt_results (mt_runf (op =$)) [("z_∈_setd_conv1",
	snd o dest_eq o concl o z_∈_setd_conv1,
	mk_z_∈(ⓩ2⌝, ⓩ{1,2,3}⌝),
	ⓩtrue⌝)];
store_mt_results mt_run_fail [("z_∈_setd_conv1 42009 a",
	z_∈_setd_conv1,
	mk_t,
	gen_fail_msg "z_∈_setd_conv1" 42009 [trues]),
	("z_∈_setd_conv1 42009 b",
	z_∈_setd_conv1,
	notz,
	gen_fail_msg "z_∈_setd_conv1" 42009 [notzs]),
	("z_∈_setd_conv1 42009 c",
	z_∈_setd_conv1,
	ⓩx ∈ {1,2}⌝,
	gen_fail_msg "z_∈_setd_conv1" 42009
	   [string_of_term ⓩx ∈ {1,2}⌝])
	];
=TEX
\subsection{Tuples}
=SML
store_mt_results (mt_runf (op =$)) [("z_tuple_lang_eq_conv a",
	snd o dest_eq o concl o z_tuple_lang_eq_conv,
	ⓩ(a,b) = (1,2)⌝,
	ⓩa = 1 ∧ b = 2⌝)];
store_mt_results mt_run_fail [("z_tuple_lang_eq_conv 42003",
	z_tuple_lang_eq_conv,
	mk_t,
	gen_fail_msg "z_tuple_lang_eq_conv" 42003 [trues])
	];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [("z_sel⋎t_lang_conv a",
	snd o dest_eq o concl o z_sel⋎t_lang_conv,
	ⓩ(1,2,3).2⌝,
	ⓩ2⌝)];
store_mt_results mt_run_fail [("z_sel⋎t_lang_conv 47185",
	z_sel⋎t_lang_conv,
	mk_t,
	gen_fail_msg "z_sel⋎t_lang_conv" 47185 [trues]),
	("z_sel⋎t_lang_conv 42006",
	z_sel⋎t_lang_conv,
	mk_z_sel⋎t (mk_var("t",type_of ⓩ(1,2,3)⌝),2),
	gen_fail_msg "z_sel⋎t_lang_conv" 42006 [
		string_of_term(mk_z_sel⋎t (mk_var("t",type_of ⓩ(1,2,3)⌝),2))])
	];
=TEX
=SML
let
	val atuple = mk_var("t",type_of ⓩ(1,2,3)⌝);
in
store_mt_results (mt_runf (op =$)) [
	("z_tuple_lang_intro_conv a",
	snd o dest_eq o concl o z_tuple_lang_intro_conv,
	ⓩ(ⓜatuple⌝.1,ⓜatuple⌝.2,ⓜatuple⌝.3)⌝,
	atuple)]
end;
store_mt_results mt_run_fail [("z_tuple_lang_intro_conv 42005 a",
	z_tuple_lang_intro_conv,
	mk_t,
	gen_fail_msg "z_tuple_lang_intro_conv" 42005 [trues]),
	("z_tuple_lang_intro_conv 42005 b",
	z_tuple_lang_intro_conv,
	ⓩ(1,2,3)⌝,
	gen_fail_msg "z_tuple_lang_intro_conv" 42005 [
		string_of_term ⓩ(1,2,3)⌝])
,
	("z_tuple_lang_intro_conv 42005 c",
	z_tuple_lang_intro_conv,
	ⓩ((1,2,3).1,(1,2,3).2)⌝,
	gen_fail_msg "z_tuple_lang_intro_conv" 42005 [
		string_of_term ⓩ((1,2,3).1,(1,2,3).2)⌝])
	];
=TEX
=SML
let
	val atuple = mk_var("t",type_of ⓩ(1,2,3)⌝);
in
store_mt_results (mt_runf (op =$)) [("z_sel⋎t_intro_conv",
	snd o dest_eq o concl o z_sel⋎t_intro_conv,
	atuple,
	ⓩ(ⓜatuple⌝.1,ⓜatuple⌝.2,ⓜatuple⌝.3)⌝)]
end;
store_mt_results mt_run_fail [("z_sel⋎t_intro_conv 42004",
	z_sel⋎t_intro_conv,
	mk_t,
	gen_fail_msg "z_sel⋎t_intro_conv" 42004 [trues])
	];
=TEX

\section{CARTESIAN PRODUCTS}
=SML
store_mt_results (mt_runf (op =$)) [("z_×_conv",
	snd o dest_eq o concl o z_×_conv,
	ⓩS1 × S2 × ℙ S2 × {t⋎2}⌝,
	ⓩ{t⋎1:S1; t⋎3:S2; t⋎4: ℙ S2; t⋎5 : {t⋎2}⦁(t⋎1,  t⋎3, t⋎4, t⋎5)}⌝)];
store_mt_results mt_run_fail [("z_×_conv 47160",
	z_×_conv,
	mk_t,
	gen_fail_msg "z_×_conv" 47160 [trues])
	];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [("z_∈_×_conv",
	snd o dest_eq o concl o z_∈_×_conv,
	(snd(strip_∀ ⓩ[S1,S2] y ∈ S1 × S2 × ℙ S2⌝)),
	(snd(strip_∀ ⓩ[S1,S2] (y ⦂ (S1 × S2 × ℙ S2)).1 ∈ S1 ∧ y.2 ∈ S2 ∧ y.3 ∈ ℙ S2⌝)))];
store_mt_results mt_run_fail [("z_∈_×_conv 42007",
	z_∈_×_conv,
	mk_t,
	gen_fail_msg "z_∈_×_conv" 42007 [trues])
	];
=TEX
\section{EXTENSIONALITY OF SETS}
=SML
store_mt_results (mt_runf (op =$)) [("z_sets_ext_conv 1",
	snd o dest_eq o concl o z_sets_ext_conv,
	ⓩ{1,x1} = {2,x2}⌝,
	ⓩ∀ x3 : 𝕌 ⦁ x3 ∈ {1,x1} ⇔ x3 ∈ {2,x2}⌝),
	("z_sets_ext_conv 2",
	snd o dest_eq o concl o z_sets_ext_conv,
	ⓩ{(1,x1)} = {(2,x3)}⌝,
	ⓩ∀ x2 : 𝕌; x4 : 𝕌 ⦁ (x2,x4) ∈ {(1,x1)} ⇔ (x2,x4) ∈ {(2,x3)}⌝),
	("z_sets_ext_conv 3",
	snd o dest_eq o concl o z_sets_ext_conv,
	ⓩ(X × [a,b:Y]) = c⌝,
	ⓩ(∀ x1 : 𝕌; x2 : 𝕌; x3 : 𝕌
      ⦁ (x1, (a ≜ x2, b ≜ x3)) ∈ X × [a, b : Y] ⇔ (x1, (a ≜ x2, b ≜ x3)) ∈ c)⌝),
	("z_sets_ext_conv 4",
	snd o dest_eq o concl o z_sets_ext_conv,
	ⓩ[a,b:X;c:X × X] = d⌝,
	ⓩ(∀ x1 : 𝕌; x2 : 𝕌; x3 : 𝕌; x4 : 𝕌
      ⦁ (a ≜ x1, b ≜ x2, c ≜ (x3, x4)) ∈ [a, b : X; c : X × X]
        ⇔ (a ≜ x1, b ≜ x2, c ≜ (x3, x4)) ∈ d)⌝),
	("z_sets_ext_conv 5",
	snd o dest_eq o concl o z_sets_ext_conv,
	ⓩ[] = d⌝,
	ⓩ∀ ⦁ () ∈ [] ⇔ () ∈ d⌝)
	];
store_mt_results mt_run_fail [("z_sets_ext_conv 42010 a",
	z_sets_ext_conv,
	mk_t,
	gen_fail_msg "z_sets_ext_conv" 42010 [trues]),
	("z_sets_ext_conv 42010 b",
	z_sets_ext_conv,
	ⓩtrue ⇔ true⌝,
	gen_fail_msg "z_sets_ext_conv" 42010 [string_of_term ⓩtrue ⇔ true⌝])
	];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [("z_∈_ℙ_conv 1",
	snd o dest_eq o concl o z_∈_ℙ_conv,
	ⓩx ∈ ℙ {1,x1}⌝,
	ⓩ(∀ x2 : 𝕌 ⦁ x2 ∈ x ⇒ x2 ∈ {1, x1})⌝),
	("z_∈_ℙ_conv 2",
	snd o dest_eq o concl o z_∈_ℙ_conv,
	ⓩx ∈ ℙ y⌝,
	ⓩ∀ x1 : 𝕌 ⦁ x1 ∈ x ⇒ x1 ∈ y⌝),
	("z_∈_ℙ_conv 3",
	snd o dest_eq o concl o z_∈_ℙ_conv,
	ⓩx ∈ ℙ (X × [a,b:Y]) ⌝,
	ⓩ∀ x1 : 𝕌; x2 : 𝕌; x3 : 𝕌
      ⦁ (x1, (a ≜ x2, b ≜ x3)) ∈ x ⇒ (x1, (a ≜ x2, b ≜ x3)) ∈ X × [a, b : Y]⌝),
	("z_∈_ℙ_conv 4",
	snd o dest_eq o concl o z_∈_ℙ_conv,
	ⓩy ∈ ℙ [a,b:X;c:X × X]⌝,
	ⓩ(∀ x1 : 𝕌; x2 : 𝕌; x3 : 𝕌; x4 : 𝕌
      ⦁ (a ≜ x1, b ≜ x2, c ≜ (x3, x4)) ∈ y
        ⇒ (a ≜ x1, b ≜ x2, c ≜ (x3, x4)) ∈ [a, b : X; c : X × X])⌝)];
store_mt_results mt_run_fail [("z_∈_ℙ_conv 42016 a",
	z_∈_ℙ_conv,
	mk_t,
	gen_fail_msg "z_∈_ℙ_conv" 42016 [trues]),
	("z_∈_ℙ_conv 42016 b",
	z_∈_ℙ_conv,
	ⓩx ∈ {}⌝,
	gen_fail_msg "z_∈_ℙ_conv" 42016 [string_of_term ⓩx ∈ {}⌝])
	];
=TEX
\section{BINDING DISPLAYS}
=SML
store_mt_results (mt_runf (op =$)) [
	("z_binding_eq_conv 1",
	snd o dest_eq o concl o z_binding_eq_conv,
	ⓩθ S = (x ≜ y)⌝,
	ⓩ((θ S).x = (x ≜ y).x)⌝),
	("z_binding_eq_conv 2",
	snd o dest_eq o concl o z_binding_eq_conv,
	ⓩθ [] = ()⌝,
	ⓩtrue⌝),
	("z_binding_eq_conv 3",
	snd o dest_eq o concl o z_binding_eq_conv,
	ⓩx ⦂ [] = y⌝,
	ⓩtrue⌝)
	];
store_mt_results mt_run_fail [("z_binding_eq_conv 42013conv",
	z_binding_eq_conv,
	mk_t,
	gen_fail_msg "z_binding_eq_conv" 42013 [trues])
	];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_binding_eq_conv1 1",
	snd o dest_eq o concl o z_binding_eq_conv1,
	ⓩθ S = (x ≜ y)⌝,
	ⓩ((θ S).x = y)⌝),
	("z_binding_eq_conv1 2",
	snd o dest_eq o concl o z_binding_eq_conv1,
	ⓩ(x ≜ y) = θ S⌝,
	ⓩ(y = (θ S).x)⌝),
	("z_binding_eq_conv1 3",
	snd o dest_eq o concl o z_binding_eq_conv1,
	ⓩ(x ≜ y) = (x ≜ z)⌝,
	ⓩ(y = z)⌝),
	("z_binding_eq_conv1 4",
	snd o dest_eq o concl o z_binding_eq_conv1,
	ⓩx ⦂ [] = y⌝,
	ⓩtrue⌝)
	];
store_mt_results mt_run_fail [
	("z_binding_eq_conv1 42013",
	z_binding_eq_conv1,
	mk_t,
	gen_fail_msg "z_binding_eq_conv1" 42013 [trues])
	];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_binding_eq_conv2 1",
	snd o dest_eq o concl o z_binding_eq_conv2,
	ⓩ(x ≜ z) = (x ≜ y)⌝,
	ⓩ(z = y)⌝),
	("z_binding_eq_conv2 2",
	snd o dest_eq o concl o z_binding_eq_conv2,
	ⓩ(x ≜ z, p ≜ 1) = (x ≜ y, p ≜ 2)⌝,
	ⓩ(1 = 2 ∧ z = y)⌝),
	("z_binding_eq_conv2 3",
	snd o dest_eq o concl o z_binding_eq_conv2,
	ⓩ() = ()⌝,
	ⓩtrue⌝),
	("z_binding_eq_conv2 4",
	snd o dest_eq o concl o z_binding_eq_conv2,
	ⓩx ⦂ [] = y⌝,
	ⓩtrue⌝)
	];
store_mt_results mt_run_fail [("z_binding_eq_conv2 42021 a",
	z_binding_eq_conv2,
	mk_t,
	gen_fail_msg "z_binding_eq_conv2" 42021 [trues]),
	("z_binding_eq_conv2 42021 b",
	z_binding_eq_conv2,
	ⓩ(x ≜ z) = b⌝,
	gen_fail_msg "z_binding_eq_conv2" 42021 [string_of_term ⓩ(x ≜ z) = b⌝])
	];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [("z_sel⋎s_conv a",
	snd o dest_eq o concl o z_sel⋎s_conv,
	ⓩ(x ≜ y, p ≜ q).x⌝,
	ⓩy⌝),
	("z_sel⋎s_conv b",
	snd o dest_eq o concl o z_sel⋎s_conv,
	ⓩ(x ≜ y, p ≜ q).p⌝,
	⌜q:'b⌝)];
store_mt_results mt_run_fail [("z_sel⋎s_conv 42014",
	z_sel⋎s_conv,
	mk_t,
	gen_fail_msg "z_sel⋎s_conv" 42014 [trues])
	];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_bindingd_intro_conv 1",
	snd o dest_eq o concl o z_bindingd_intro_conv,
	ⓩ(x ≜ y, p ≜ q)⌝,
	ⓩ(x ≜ (x ≜ y, p ≜ q).x, p ≜ (x ≜ y, p ≜ q).p)⌝),
	("z_bindingd_intro_conv 2",
	snd o dest_eq o concl o z_bindingd_intro_conv,
	ⓩx ⦂ []⌝,
	ⓩ()⌝)
	];
store_mt_results mt_run_fail [("z_bindingd_intro_conv 42017",
	z_bindingd_intro_conv,
	mk_t,
	gen_fail_msg "z_bindingd_intro_conv" 42017 [trues])
	];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [("z_bindingd_elim_conv",
	snd o dest_eq o concl o z_bindingd_elim_conv,
	ⓩ(x ≜ (x ≜ y, p ≜ q).x, p ≜ (x ≜ y, p ≜ q).p)⌝,
	ⓩ(x ≜ y, p ≜ q)⌝)];
store_mt_results mt_run_fail [
	("z_bindingd_elim_conv 42018 1",
	z_bindingd_elim_conv,
	mk_t,
	gen_fail_msg "z_bindingd_elim_conv" 42018 [trues]),
	("z_bindingd_elim_conv 42018 2",
	z_bindingd_elim_conv,
	ⓩ(x ≜ (x ≜ y, p ≜ q).x, p ≜ (x ≜ y, p ≜ r).p)⌝,
	gen_fail_msg "z_bindingd_elim_conv" 42018
		[string_of_term ⓩ(x ≜ (x ≜ y, p ≜ q).x, p ≜ (x ≜ y, p ≜ r).p)⌝]),
	("z_bindingd_elim_conv 42018 3",
	z_bindingd_elim_conv,
	ⓩ()⌝,
	gen_fail_msg "z_bindingd_elim_conv" 42018
		[string_of_term ⓩ()⌝])
	];
=TEX
\subsection{String Literals}
=SML
store_mt_results (mt_runf (op =$)) [("z_string_conv a",
	snd o dest_eq o concl o z_string_conv,
	ⓩ"abc"⌝,
	ⓩ⟨⌜`a`⌝,⌜`b`⌝,⌜`c`⌝⟩⌝),
	("z_string_conv b",
	snd o dest_eq o concl o z_string_conv,
	ⓩ"" ⦂ seq 𝕊⌝,
	ⓩ⟨⟩ ⦂ ℙ ""⌝)];
store_mt_results mt_run_fail [("z_string_conv 42015",
	z_string_conv,
	mk_t,
	gen_fail_msg "z_string_conv" 42015 [trues])
	];
store_mt_results (mt_runf (op =$)) [("z_∈_string_conv a",
	snd o dest_eq o concl o z_∈_string_conv,
	ⓩv ∈ "abc"⌝,
	ⓩv ∈ ⟨⌜`a`⌝,⌜`b`⌝,⌜`c`⌝⟩⌝),
	("z_∈_string_conv b",
	snd o dest_eq o concl o z_∈_string_conv,
	ⓩv ∈ ("" ⦂ seq 𝕊)⌝,
	ⓩv ∈ (⟨⟩ ⦂ ℙ "")⌝)];
store_mt_results mt_run_fail [
	("z_∈_string_conv 42028",
	z_∈_string_conv,
	mk_t,
	gen_fail_msg "∈_C" 42028 [trues]),
	("z_∈_string_conv 42015",
	z_∈_string_conv,
	ⓩx ∈ y⌝,
	gen_fail_msg "z_string_conv" 42015 [string_of_term ⓩy⌝])
	];

=TEX
\section{MISCELLANEOUS}
=SML
store_mt_results (mt_runf (op =$)) [
	("z_⟨⟩_conv a", concl o z_⟨⟩_conv, ⓩ⟨⟩⌝, ⓩ⟨⟩ = {}⌝),
	("z_⟨⟩_conv b", concl o z_⟨⟩_conv, ⓩ⟨1⟩⌝, ⓩ⟨1⟩ = {(1, 1)}⌝),
	("z_⟨⟩_conv c", concl o z_⟨⟩_conv, ⓩ⟨"a", "b", "c"⟩⌝,
		ⓩ⟨"a", "b", "c"⟩ = {(1, "a"), (2, "b"), (3, "c")}⌝)];

store_mt_results (mt_runf (op =$)) [
	("z_defn_simp_rule a",
	concl o z_defn_simp_rule,
	(asm_rule ⌜Z'AbbDef ⓩp ∈ ℙ(X × Y) ∧ (∀ q : X × Y ⦁ q ∈ p ⇔ f q = q.1)⌝⌝),
	ⓩ∀ q : 𝕌 ⦁
	q ∈ p ⇔ q ∈ X × Y ∧ f q = q.1⌝),
	("z_defn_simp_rule b",
	concl o z_defn_simp_rule,
	(conv_rule
	(RAND_C(LEFT_C (Z_DECL_INTRO_C z_pred_dec_conv)))
	(asm_rule ⌜Z'AbbDef ⓩp ∈ ℙ(X × Y) ∧ (∀ q : X × Y ⦁ q ∈ p ⇔ f q = q.1)⌝⌝)),
	ⓩ∀ q : 𝕌⦁ q ∈ p ⇔ q ∈ X × Y ∧ f q = q.1⌝)];
=TEX

╒[X,Y]════════════════
│ Test : ℙ (X × Y)
├──────────────────
│ ∀ xy : X × Y ⦁
│	xy ∈ Test ⇔ (xy = xy)
└────────────────────

=SML
store_mt_results (mt_runf (op =$)) [
	("z_defn_simp_rule c",
	concl o z_defn_simp_rule,
	(get_spec ⓩTest⌝),
	ⓩ[X,Y](∀ xy : 𝕌 ⦁ xy ∈ Test[X, Y] ⇔ xy ∈ X × Y ∧ xy = xy)⌝)];
=TEX
=SML
store_mt_results mt_run_fail [("z_defn_simp_rule 42011",
	z_defn_simp_rule,
	t_thm,
	gen_fail_msg "z_defn_simp_rule" 42011 [string_of_thm t_thm])
	];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [("Z_∈_ELIM_C a",
	snd o dest_eq o concl o Z_∈_ELIM_C z_∈_h_schema_conv,
	ⓩ[x1,y1 : X × Y]⌝,
	ⓩ{x2 : 𝕌; x3 : 𝕌; x4 : 𝕌; x5 : 𝕌
      | {(x2, x3), (x4, x5)} ⊆ X × Y ∧ true
      ⦁ (x1 ≜ (x2, x3), y1 ≜ (x4, x5))}⌝),
	("Z_∈_ELIM_C b",
	snd o dest_eq o concl o Z_∈_ELIM_C z_∈_setd_conv,
	ⓩ{}⌝,
	ⓩ{x1 : 𝕌 | false}⌝)
	];
=TEX
=SML
store_mt_results mt_run_fail [("Z_∈_ELIM_C 42027",
	Z_∈_ELIM_C z_∈_h_schema_conv,
	mk_t,
	gen_fail_msg "Z_∈_ELIM_C" 42027 [trues]),
	("Z_∈_ELIM_C other",
	Z_∈_ELIM_C z_∈_h_schema_conv,
	ⓩ{}⌝,
	gen_fail_msg "z_∈_h_schema_conv" 43003 [string_of_term ⓩx1 ∈ {}⌝])
	];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [("z_setd_∈_ℙ_conv a",
	snd o dest_eq o concl o z_setd_∈_ℙ_conv,
	ⓩ{1,2} ∈ ℙ X⌝,
	ⓩ1 ∈ X ∧ 2 ∈ X⌝),
	("z_setd_∈_ℙ_conv b",
	snd o dest_eq o concl o z_setd_∈_ℙ_conv,
	ⓩ{} ∈ ℙ X⌝,
	ⓩtrue⌝)];
store_mt_results mt_run_fail [("z_setd_∈_ℙ_conv 42019",
	z_setd_∈_ℙ_conv,
	mk_t,
	gen_fail_msg "z_setd_∈_ℙ_conv" 42019 [trues])
	];

=TEX

\section{PROOF CONTEXTS}
The following is not an exhaustive test of stripping under
the Z set theory proof contexts, but is a good test
of presence and basic intent.
=SML
let
val example_tm = ⓩ∀ x : 𝕌; y:𝕌 ⦁ {1,2} × {3,4} =
	 {(1,3),(1,4),(2,3),(2,4)}⌝;
fun aux tm = (
push_merge_pcs["z_predicates","'z_∈_set_lang","'z_sets_ext_lang",
	"'z_tuples_lang", "'z_bindings"];
set_goal([],tm);
a(asm_prove_tac[]);
pop_pc();
pop_thm());
in
store_mt_results (mt_runf (op =$)) [("Z set theory stripping",
	concl o aux,
	example_tm,
	example_tm)]
end;
=TEX
A check for $β$ reduction:
=SML
push_merge_pcs["z_predicates","'z_∈_set_lang","'z_sets_ext_lang",
	"'z_tuples_lang", "'z_bindings"];
store_mt_results (mt_runf (op =$)) [("z_∈_set_lang pc β",
	concl o rewrite_conv [],
	ⓩ(λ x : 𝕌 ⦁ f x) (1, 2)⌝,
	ⓩ(λ x : 𝕌 ⦁ f x) (1, 2) = f (1, 2)⌝)];
pop_pc();
=TEX
Check everything is there:
=SML
push_pc "'z_∈_set_lang";
set_pc "'z_sets_ext_lang";
set_pc "'z_tuples_lang";
set_pc "'z_bindings";
pop_pc();
=TEX
=TEX
\section{CHECK THE THEORY DESIGN}
=SML
use_file "dtd042.tch";
store_mt_results mt_run [("theory design of Z set theory",
	theory_check_success,
	(),
	true)];
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


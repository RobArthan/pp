=IGN
********************************************************************************
mdt041.doc: this file is part of the PPZed system

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

\def\Title{Module Tests for Z Predicate Calculus}

\def\AbstractText{This document gives the module tests for the rules and tactics for the Z predicate calculus.}

\def\Reference{DS/FMU/IED/MDT041}

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
%% LaTeX2e port: \TPPtitle{Module Tests for Z Predicate Calculus}
%% LaTeX2e port: \TPPref{DS/FMU/IED/MDT041}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.41 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2010/04/01 17:29:41 $ %
%% LaTeX2e port: }}  %% Mandatory field
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.~Blackburn & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{R.D.~Arthan & WIN01 \\ K.~Blackburn & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document gives the module tests for the
%% LaTeX2e port: rules and tactics for the Z predicate calculus.}
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
\item [Issue 1.1 (1992/08/12) - 1.3 (1992/08/18)]
First versions.
\item [Issue 1.5 (1992/08/20) (20th August 1992)]
Bug fixing.
\item [Issue 1.6 (1992/09/09) (9th September 1992)]
Added $z\_∃\_intro\_conv$ tests.
\item [Issue 1.7 (1992/09/10) (10th September 1992)]
Typo fixed, title corrected.
\item [Issue 1.8 (1992/09/14) (10th September 1992)]
Changes after comments.
\item [Issue 1.11 (1992/10/19),1.12 (1992/10/28) (29th October 1992)]
Changes due to parser changes and theory reorganisation.
\item [Issue 1.14 (1992/11/12) (12th November 1992)]
Changes after comments - proof context changes,
added $z\_∀\_tac$, etc, replaced $z\_defn\_conv$ by $z\_para\_pred\_conv$, etc, added $z\_decl\_pred\_conv$.
\item [Issue 1.16 (1992/11/17) (17th Novemember 1992)]
Added $z\_term\_of\_type$
\item [Issue 1.17 (1992/11/27) (25th Novemember 1992)]
Added $z\_term\_of\_type$.
\item [Issue 1.18 (1992/12/01) (1st December 1992)]
Changed treatment of ill-formed schemas as predicates in $z\-\_dec\-\_pred\-\_conv$.
\item [Issue 1.19 (1992/12/03) (2nd December 1992)]
Improved $𝕌$ simplification.
\item [Issue 1.20 (1992/12/08), 7th December 1992]
Fixing problems from changes to generic formals.
\item [Issue 1.21 (1992/12/09), 9th December 1992]
Bug fixing.
\item[Issue 1.22 (1992/12/10) (10th December 1992)]
Global rename from wrk038.doc issue 1.9.
\item[Issue 1.23 (1992/12/18) (18th December 1992)]
Added $z\_pred\_decl\_conv$.
\item[Issue 1.24 (1993/01/15) (14th January 1993)]
Added treatment of generic predicates.
\item[Issue 1.25 (1993/01/20) (20th January 1993)]
Lost $z\_strip\_tac$.
\item[Issue 1.26 (1993/02/10) (10th February 1993)]
Reacting to changes in proof contexts, et al.
\item[Issue 1.27 (1993/02/16) (15th February 1993)]
Added $z\_push\_consistency\_goal$.
\item[Issue 1.28 (1994/09/28) (28th September 1994)]
Test requires ProofPower have z\_type\_check\_only flag set the false.  This is now set explicitly at the start, and restored at the end.
\item[Issue 1.29 (1994/11/01)] Added new conversion.
\item[Issue 1.30 (1995/01/04)] reverted since new conversion should go in imp043.
\item[Issue 1.32 (1997/04/25)] Changed to address $dest\_z\_term$ increased care w.r.t.
schemas as predicates.
\item[Issue 1.33 (2000/07/01)] Added test for
=INLINEFT
z_gen_pred_elim1
=TEX
.
\item[Issue 1.34 (2002/03/09)] No longer relies on aliases for HOL integer operations being undeclared.
\item[Issue 1.35 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.36 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.37 (2003/07/16)] θ-terms are now checked more thoroughly by the Z term destructors.
\item[Issue 1.38 (2004/01/19)] The Z universal set is now called 𝕌.
\item[Issue 1.39 (2005/09/10)] Added test for {\em z\_gen\_pred\_u\_elim}.
\item[Issue 1.40 (2005/12/16)] Allowed for change HOL error message number.
\item[Issue 1.41 (2010/04/01)] Added tests for empty schemas.
\item[Issue 1.42 (2010/04/05)] Added test for {\em z\_∈\_u\_conv}.
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
whose detailed design is given in \cite{DS/FMU/IED/DTD041}.
\subsection{Introduction}
This document contains the module tests for the material
whose detailed design is given in \cite{DS/FMU/IED/DTD041}.
This consists of demonstrating at least the simpler uses of the
functions in question.
\subsubsection{Dependencies}
The tests depend upon \cite{DS/FMU/IED/IMP041} and \cite{DS/FMU/IED/IMP013}.
In addition, testing by the subgoal package (section \ref{subgoalpackage})
depends on \cite{DS/FMU/IED/IMP030}.
\subsubsection{Deficiencies}
The testing could be more rigorous.
In particular, functions
=GFT
z_basic_prove_tac, z_basic_prove_conv,
z_fc_prove_tac, z_fc_prove_conv
=TEX
and proof context
=GFT
'z_fc
=TEX
are not tested.
Nor do we test error message 41016.
\section{TEST CASES}
The functions are tested in their order of presentation in the detailed design.
\section{PREAMBLE}
Change the {\tt z\_type\_check\_only} flag, and save the old value for later.
=SML
val old_flag = set_flag("z_type_check_only",false);
=TEX
=SML
val use_thy = "z_sets";
open_theory use_thy; (* to access ⦂ *)
delete_theory "temp" handle _ => ();
new_theory "temp";
use_file "dtd013";
use_file "imp013";
init_mt_results();
(* set_flag("subgoal_package_quiet",true); *)
repeat drop_main_goal;
set_flag("check_is_z",true);
=TEX
We use the proof context
``z$\_$predicates''.
=SML
push_pc "z_predicates";
=TEX

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
The following tests $is\_z$, $not\_z\_subterms$,
$dest\-\_z\-\_term1$, $check\-\_is\-\_z\-\_thm$, $check\-\_is\-\_z\-\_goal$,
$check\-\_is\-\_z\-\_term$ together, on a pair of very similar
terms, except that one is Z and one not quite Z,
in a manner $dest\-\_z\-\_term$ doesn't notice.

The following utilities just give rise to lots of information
messages.
=SML
fun ⦏test_check_is_z_thm⦎ tm = (
let	val thm1 = refl_conv tm;
in
	(thm1 =|- check_is_z_thm "test" thm1)
end
handle _ => false);
fun ⦏test_check_is_z_goal⦎ tm = (
let	val gl1 = ([],mk_eq(tm, tm));
in
	(gl1 =# check_is_z_goal "test" gl1)
end
handle _ => false);
fun ⦏test_check_is_z_term⦎ tm = (
	(tm =$ check_is_z_term "test" tm)
handle _ => false);

fun ⦏really_z⦎ name tm1 tm2 =
store_mt_results mt_run [(name ^ " is_z y",
	(fn x => ((is_z x) handle _ => false)),
	tm1,
	true),
	(name ^ " is_z n",
	(fn x => ((is_z x) handle _ => false)),
	tm2,
	false),
	(name ^ " not_z_subterms []",
	(fn x => length x = 0) o not_z_subterms,
	tm1,
	true),
	(name ^ " not_z_subterms [1]",
	(fn x => length x = 1) o not_z_subterms,
	tm2,
	true),
	(name ^ " dest_z_term y",
	(fn x => ((dest_z_term x; true) handle _ => false)),
	tm1,
	true),
	(name ^ " dest_z_term n",
	(fn x => ((dest_z_term x; true) handle _ => false)),
	tm2,
	true),
	(name ^ " dest_z_term1 y",
	(fn x => ((dest_z_term1 x; true) handle _ => false)),
	tm1,
	true),
	(name ^ " dest_z_term1 n",
	(fn x => ((dest_z_term1 x; true) handle _ => false)),
	tm2,
	false),
	(name ^ " test_check_is_z_thm y",
	test_check_is_z_thm,
	tm1,
	true),
	(name ^ " test_check_is_z_thm n",
	test_check_is_z_thm,
	tm2,
	true),
	(name ^ " test_check_is_z_goal y",
	test_check_is_z_goal,
	tm1,
	true),
	(name ^ " test_check_is_z_goal n",
	test_check_is_z_goal,
	tm2,
	true),
	(name ^ " test_check_is_z_term y",
	test_check_is_z_term,
	tm1,
	true),
	(name ^ " test_check_is_z_term n",
	test_check_is_z_term,
	tm2,
	true)];
=TEX
$dest\_z\_term$s behaviour with schemas as predicates and θ-terms has been made to
check for the results not being Z during an upgrade, so in this one case
``it cares''.
=SML
fun ⦏really_z_dest_z_term_cares⦎ name tm1 tm2 =
store_mt_results mt_run [(name ^ " is_z y",
	(fn x => ((is_z x) handle _ => false)),
	tm1,
	true),
	(name ^ " is_z n",
	(fn x => ((is_z x) handle _ => false)),
	tm2,
	false),
	(name ^ " not_z_subterms []",
	(fn x => length x = 0) o not_z_subterms,
	tm1,
	true),
	(name ^ " not_z_subterms [1]",
	(fn x => length x = 1) o not_z_subterms,
	tm2,
	true),
	(name ^ " dest_z_term y",
	(fn x => ((dest_z_term x; true) handle _ => false)),
	tm1,
	true),
	(name ^ " dest_z_term n",
	(fn x => ((dest_z_term x; true) handle _ => false)),
	tm2,
	false),
	(name ^ " dest_z_term1 y",
	(fn x => ((dest_z_term1 x; true) handle _ => false)),
	tm1,
	true),
	(name ^ " dest_z_term1 n",
	(fn x => ((dest_z_term1 x; true) handle _ => false)),
	tm2,
	false),
	(name ^ " test_check_is_z_thm y",
	test_check_is_z_thm,
	tm1,
	true),
	(name ^ " test_check_is_z_thm n",
	test_check_is_z_thm,
	tm2,
	true),
	(name ^ " test_check_is_z_goal y",
	test_check_is_z_goal,
	tm1,
	true),
	(name ^ " test_check_is_z_goal n",
	test_check_is_z_goal,
	tm2,
	true),
	(name ^ " test_check_is_z_term y",
	test_check_is_z_term,
	tm1,
	true),
	(name ^ " test_check_is_z_term n",
	test_check_is_z_term,
	tm2,
	true)];
=TEX
\subsection{Some Useful Examples}
┌TEST_SCHEMA─
x:𝕌;
y:𝕌
└
=SML
val notz = ⌜∃ x ⦁ x = y⌝;
val trues = string_of_term mk_t;
val notzs = string_of_term notz;
val xX = mk_var("x",ⓣ'X⌝);

=TEX
\section{TESTS}
\subsection{Checking For Z}
This is primarily done by $really\_z$.
=SML
val _ = diag_string
	"***There should now be a large number of ``In the result of...'' messages***";
=TEX
Note that short blocks of decoration precedes long ones in the variable sorting.
=SML
let
val tm = mk_z_schema_dec(ⓩ[z:X;x:Y;y:Z]⌝,"'");
val y' = nth 4 (frees tm);
val y'' = variant [y'] y';
val tm' = subst[(y'',y')] tm;
in
really_z "decsexp" tm tm'
end;
let
val tm = ⓩ∀ #!, #? : X ⦁ #! = z⌝;
val z = hd(frees tm);
val x_ins = mk_var("#!",type_of z);
val tm' = subst [(x_ins,z)] tm;
in
really_z "Z∀" tm tm'
end;
let
val tm = ⓩ∃ #!, #? : X ⦁ #! = z⌝;
val z = hd(frees tm);
val x_ins = mk_var("#!",type_of z);
val tm' = subst [(x_ins,z)] tm;
in
really_z "Z∃" tm tm'
end;
let
val tm = ⓩ∃⋎1 #!, #? : X ⦁ #! = z⌝;
val z = hd(frees tm);
val x_ins = mk_var("#!",type_of z);
val tm' = subst [(x_ins,z)] tm;
in
really_z "Z∃⋎1" tm tm'
end;
let
val Z∃(a,b,c) = dest_z_term ⓩ∃ #!, #? : X | #! = z ⦁ [#!,#? : X | true]⌝;
val tm = mk_z_∃⋎s(a,b,ⓩ[#!,#? : X | true]⌝);
val z = hd(frees tm);
val x_ins = mk_var("#!",type_of z);
val tm' = subst [(x_ins,z)] tm;
in
really_z "Z∃⋎s" tm tm'
end;
let
val Z∃(xa,xb,xc) = dest_z_term ⓩ∃ #!, #? : X | #! = z ⦁ [#!,#? : X | true]⌝;
val tm = mk_z_∃⋎1⋎s(xa,xb,ⓩ[#!,#? : X | true]⌝);
val z = hd(frees tm);
val x_ins = mk_var("#!",type_of z);
val tm' = subst [(x_ins,z)] tm;
in
really_z "Z∃⋎1⋎s" tm tm'
end;
let
val Z∃(xa,xb,xc) = dest_z_term ⓩ∃ #!, #? : X | #! = z ⦁ [#!,#? : X | true]⌝;
val tm = mk_z_∀⋎s(xa,xb,ⓩ[#!,#? : X | true]⌝);
val z = hd(frees tm);
val x_ins = mk_var("#!",type_of z);
val tm' = subst [(x_ins,z)] tm;
in
really_z "∀⋎s" tm tm'
end;
let
val tm1 = ⓩ[#!,#?:X | #! = z] ∧ true⌝;
val tm = fst(dest_z_∧ tm1);
val z = hd(frees tm);
val x_ins = mk_var("#!",type_of z);
val x_ins' = mk_var("#!'",type_of z);
val tm' = subst [(x_ins',x_ins)] tm;
in
really_z_dest_z_term_cares "predsexp" tm tm'
end;
let
val tm = ⓩ{#!, #? : X | #! = z}⌝;
val z = hd(frees tm);
val x_ins = mk_var("#!",type_of z);
val tm' = subst [(x_ins,z)] tm;
in
really_z "seta" tm tm'
end;
let
val tm = ⓩθ[#!, #? : X | #! = z]⌝;
val z = hd(frees tm);
val x_ins = mk_var("#!",type_of z);
val x_ins' = mk_var("#!'",type_of z);
val tm' = subst [(x_ins',x_ins)] tm;
in
really_z_dest_z_term_cares "θ" tm tm'
end;
let
val tm = ⓩ λ #!, #? : X ⦁ #! = z⌝;
val z = hd(frees tm);
val x_ins = mk_var("#!",type_of z);
val tm' = subst [(x_ins,z)] tm;
in
really_z "λ" tm tm'
end;
let
val tm = ⓩ μ #!, #? : X ⦁ #! = z⌝;
val z = hd(frees tm);
val x_ins = mk_var("#!",type_of z);
val tm' = subst [(x_ins,z)] tm;
in
really_z "μ" tm tm'
end;
let
val tm = ⓩ [#!,#? : X | #! = z]⌝;
val z = hd(frees tm);
val x_ins = mk_var("#!",type_of z);
val tm' = subst [(x_ins,z)] tm;
in
really_z "decsexp1" tm tm'
end;

=TEX
=SML
val _ = diag_string
	"***The ``In the result of...'' messages should now cease***";
=TEX
But just to check the error messages:
=SML
val not_a_z_term = ⌜λ x ⦁ T⌝;
val not_a_z_term2 = ⌜λ x ⦁ F⌝;
val not_a_z_term_st = string_of_term not_a_z_term;
val not_a_z_type = ⓣ'a LIST⌝;
val not_a_z_type_st = string_of_type not_a_z_type;
store_mt_results mt_run_fail [("dest_z_term1 41002",
	dest_z_term1,
	not_a_z_term,
	gen_fail_msg "dest_z_term1" 41002 [not_a_z_term_st])];
store_mt_results mt_run_fail [("is_z 41002",
	is_z,
	not_a_z_term,
	gen_fail_msg "is_z" 41002 [not_a_z_term_st])];
store_mt_results mt_run_fail [("is_all_z_type 41002",
	is_all_z_type,
	not_a_z_type,
	gen_fail_msg "is_all_z_type" 41003 [not_a_z_type_st])];
store_mt_results (mt_runf (list_eq(op =$)))
	[("not_z_subterms",
	not_z_subterms,
	mk_eq(not_a_z_term,not_a_z_term2),
	[not_a_z_term2, not_a_z_term])];
=TEX
To test the quieting effect of $check\_is\_z$
=SML
val _ = (diag_string "Being Noisy";
	check_is_z_thm "test" (refl_conv not_a_z_term);
	check_is_z_goal "test" ([],mk_eq( not_a_z_term,not_a_z_term2));
	check_is_z_term "test" not_a_z_term;
	diag_string "Going Quiet";
	set_flag("check_is_z",false);
	check_is_z_thm "test" (refl_conv not_a_z_term);
	check_is_z_goal "test" ([],mk_eq(not_a_z_term,not_a_z_term2));
	check_is_z_term "test" not_a_z_term;
	diag_string "Back to Normal";
	set_flag("check_is_z",true)
);
=TEX	
\subsection{Representing HOL Types as Z Terms}
=SML
ⓈZ
[GS1, GS2]
■
=SML
val zt = z_term_of_type o type_of;
store_mt_results (mt_runf (op =$))  [
	("z_term_of_type 1", zt, ⓩGS1⌝, ⓩℙ GS1⌝),
	("z_term_of_type 2", zt, ⓩGS1 × GS2⌝, ⓩGS1 ↔ GS2⌝),
	("z_term_of_type 3", zt, ⓩGS1 × GS2 × GS1⌝, ⓩℙ (GS1 × GS2 × GS1)⌝),
	("z_term_of_type 4", zt, ⓩ[a,b : GS1]⌝, ⓩℙ [a,b : GS1]⌝),
	("z_term_of_type 5", zt, ⌜[1;2]⌝, mk_u ⓣℕ LIST SET⌝)];

val zt = z_type_of;
store_mt_results (mt_runf (op =$))  [
	("z_type_of 1", zt, ⓩGS1⌝, ⓩℙ GS1⌝),
	("z_type_of 2", zt, ⓩGS1 × GS2⌝, ⓩGS1 ↔ GS2⌝),
	("z_type_of 3", zt, ⓩGS1 × GS2 × GS1⌝, ⓩℙ (GS1 × GS2 × GS1)⌝),
	("z_type_of 4", zt, ⓩ[a,b : GS1]⌝, ⓩℙ [a,b : GS1]⌝),
	("z_type_of 5", zt, ⌜[1;2]⌝, mk_u ⓣℕ LIST SET⌝)];

=TEX	
\subsection{Adjustment after α-conversion}
=SML
val _ = diag_string "α_to_z NOT YET IMPLEMENTED";
val _ = diag_string "α_to_z_conv NOT YET IMPLEMENTED";
=TEX
\subsection{Concerning The Universe}
=SML
fun ⦏test_z_∈_u_conv⦎ tm = (
let	val thm = z_∈_u_conv tm;
	val (l,r) = dest_eq (concl thm);
in
	(l =$ tm) andalso (r =$ mk_t)
end);
=TEX
=SML
store_mt_results mt_run [
	("z_∈_u_conv 1",
	test_z_∈_u_conv,
	ⓩx ∈ 𝕌⌝,
	true),
	("z_∈_u_conv 2",
	test_z_∈_u_conv,
	ⓩx ⊆ 𝕌⌝,
	true),
	("z_∈_u_conv 3",
	test_z_∈_u_conv,
	snd(dest_∧ ⓩtrue ∧ [a: 𝕌]⌝),
	true),
	("z_∈_u_conv 4",
	test_z_∈_u_conv,
	ⓩx ∈ ℙ 𝕌⌝,
	true),
	("z_∈_u_conv 5",
	test_z_∈_u_conv,
	ⓩx ∈ ℙ (𝕌 × 𝕌)⌝,
	true),
	("z_∈_u_conv 6",
	test_z_∈_u_conv,
	ⓩx ∈ {x:𝕌; y: 𝕌}⌝,
	true),
	("z_∈_u_conv 7",
	test_z_∈_u_conv,
	ⓩx ∈ {y:𝕌; x: 𝕌}⌝,
	true),
	("z_∈_u_conv 8",
	test_z_∈_u_conv,
	ⓩx ∈ ℙ {x:𝕌; y: 𝕌 × 𝕌}⌝,
	true),
	("z_∈_u_conv 9",
	test_z_∈_u_conv,
	ⓩx ∈ [a ,b : 𝕌; c : 𝕌]⌝,
	true),
	("z_∈_u_conv 10",
	test_z_∈_u_conv,
	ⓩx ∈ ℙ (𝕌 × 𝕌) × [a ,b : 𝕌; c : 𝕌]⌝,
	true),
	("z_∈_u_conv 11",
	test_z_∈_u_conv,
	ⓩ{x,y} ⊆ ℙ (𝕌 × 𝕌) × [a ,b : 𝕌; c : 𝕌]⌝,
	true),
	("z_∈_u_conv 12",
	test_z_∈_u_conv,
	snd(dest_∧(ⓩtrue ∧ [a ,b : 𝕌 × [a ,b : 𝕌; c : 𝕌]; c : ℙ 𝕌]⌝)),
	true),
	("z_∈_u_conv 13",
	test_z_∈_u_conv,
	ⓩx ∈ {y:ℙ 𝕌 | true}⌝,
	true),
	("z_∈_u_conv 14",
	test_z_∈_u_conv,
	ⓩx ∈ {x:ℙ 𝕌 | true}⌝,
	true),
	("z_∈_u_conv 15",
	test_z_∈_u_conv,
	ⓩx ∈ [x:ℙ 𝕌]⌝,
	true),
	("z_∈_u_conv 16",
	test_z_∈_u_conv,
	ⓩx ∈ []⌝,
	true),
	("z_∈_u_conv 17",
	test_z_∈_u_conv,
	ⓩx ∈ [[]; []]⌝,
	true),
	("z_∈_u_conv 18",
	test_z_∈_u_conv,
	ⓩx ∈ {x : ℙ ([] × [])}⌝,
	true)
	];
=TEX
=SML
store_mt_results mt_run_fail [("z_∈_u_conv 41062",
	z_∈_u_conv,
	not_a_z_term,
	gen_fail_msg "z_∈_u_conv" 41062 [not_a_z_term_st]),
	("z_∈_u_conv 41061",
	z_∈_u_conv,
	ⓩy ∈ X⌝,
	gen_fail_msg "z_∈_u_conv" 41061 [string_of_term ⓩy ∈ X⌝])];
=TEX
Test out proof context fields:
=SML
delete_pc "temp" handle (Fail _) => ();
new_pc "temp";
set_u_simp_eqn_cxt (theory_u_simp_eqn_cxt "-") "temp";
store_mt_results mt_run_fail [
	("z_∈_u_conv 41061 a",
	z_∈_u_conv,
	ⓩy ∈ GS1 × ℙ GS2⌝,
	gen_fail_msg "z_∈_u_conv" 41061 [string_of_term ⓩy ∈ GS1 × ℙ GS2⌝])];
push_pc "temp";
store_mt_results mt_run [
	("z_∈_u_conv pc 1",
	test_z_∈_u_conv,
	ⓩy ∈ GS1 × ℙ GS2⌝,
	true)];
pop_pc();
store_mt_results mt_run [
	("get_u_simp_eqn_cxt 1",
	length o fst o hd o get_u_simp_eqn_cxt,
	"temp",
	2)];
delete_pc "temp";
new_pc "temp";
set_u_simp_eqn_cxt (u_simp_eqn_cxt [z_get_spec ⓩGS1⌝, z_get_spec ⓩGS2⌝]) "temp";
push_pc "temp";
store_mt_results mt_run [
	("z_∈_u_conv pc 2",
	test_z_∈_u_conv,
	ⓩy ∈ GS1 × ℙ GS2⌝,
	true)];
store_mt_results mt_run [
	("get_u_simp_eqn_cxt 2",
	length o fst o hd o get_u_simp_eqn_cxt,
	"temp",
	2)];
pop_pc();
=TEX
Just to prove errors are being passed on:
=SML
store_mt_results mt_run_fail [
	("set_u_simp_eqn_cxt 51016",
	set_u_simp_eqn_cxt [],
	"initial",
	gen_fail_msg "set_u_simp_eqn_cxt" 51016 ["initial"])];
store_mt_results mt_run_fail [
	("get_u_simp_eqn_cxt 51010",
	get_u_simp_eqn_cxt,
	"rubbish",
	gen_fail_msg "get_u_simp_eqn_cxt" 51010 ["rubbish"])
	];
store_mt_results mt_run_fail [
	("theory_u_simp_eqn_cxt 12035",
	theory_u_simp_eqn_cxt,
	"rubbish",
	gen_fail_msg "theory_u_simp_eqn_cxt" 12035 ["rubbish"])
	];
=TEX
\subsection{Concerning Z Universal Quantification}
=SML
let
	val θ = ⓩθ TEST_SCHEMA⌝;
in
store_mt_results (mt_runf (op =$)) [
	("z_∀_elim 1",
	concl o z_∀_elim ⓩ(x ≜ (q ⦂ a), y ≜ (r ⦂ b), z ≜ (p ⦂ a))⌝,
	(asm_ruleⓩ∀ x:X; y:Y; z:X | f x ⦁ g y z⌝),
	ⓩ(((q ∈ X) ∧ (r ∈ Y) ∧ (p ∈ X)) ∧ f q) ⇒ (g r) p⌝),
	("z_∀_elim 2",
	concl o z_∀_elim ⓩ(x ≜ (q ⦂ a), y ≜ (r ⦂ b), z ≜ (p ⦂ a))⌝,
	(asm_ruleⓩ∀ x:X; y:Y; z:X | f x ⦁ g  ⌜a + (b:ℕ)⌝ z⌝),
	ⓩ(((q ∈ X) ∧ (r ∈ Y) ∧ (p ∈ X)) ∧ f q) ⇒ (g ⌜a + (b:ℕ)⌝) p⌝),
	("z_∀_elim 3",
	concl o z_∀_elim ⓩSS ⦂ [x:a;y:b;z:a]⌝,
	(asm_ruleⓩ∀ x:X; y:Y; z:X | f x ⦁ g  y z⌝),
	ⓩ((((SS ⦂ [x:a;y:b;z:a]).x ∈ X) ∧ (SS.y ∈ Y) ∧ (SS.z ∈ X)) ∧ f SS.x)
	⇒ (g SS.y) SS.z⌝),
	("z_∀_elim 4",
	concl o z_∀_elim mk_t,
	(asm_ruleⓩ∀ x:BOOL ⦁ x⌝),
	ⓩ(true ∈ BOOL ∧ true) ⇒ true⌝),
	("z_∀_elim 5",
	concl o z_∀_elim ⓩθ (TEST_SCHEMA ⦂ ℙ[x:X;y:Y])⌝,
	(asm_ruleⓩ∀ x:𝕌;y: 𝕌⦁ f x y⌝),
	ⓩ((((θ (TEST_SCHEMA ⦂ ℙ[x:X;y:Y])).x ∈ 𝕌) ∧
		(θ (TEST_SCHEMA ⦂ ℙ[x:X;y:Y])).y ∈ 𝕌) ∧
		 true) ⇒ f (θ (TEST_SCHEMA ⦂ ℙ[x:X;y:Y])).x
		(θ (TEST_SCHEMA ⦂ ℙ[x:X;y:Y])).y⌝),
	("z_∀_elim 6",
	concl o z_∀_elim ⓩ()⌝,
	(asm_ruleⓩ∀ | P ⦁ B⌝),
	ⓩtrue ∧ P ⇒ B⌝)
	]
end;
=TEX
Ignore the single ``not in the Z language'' message from the above.
=SML
val mk_t_st = string_of_term mk_t;
val mk_f_st = string_of_term mk_f;
val (xyz_decl,_,_) = dest_z_∀ ⓩ∀ x:X; y:Y; z:X ⦁ true⌝;
store_mt_results mt_run_fail [
	("z_∀_elim 47310",
	z_∀_elim mk_t,
	t_thm,
	gen_fail_msg  "z_∀_elim" 47310 [mk_t_st]),
	("z_∀_elim 41021 a",
	z_∀_elim ⓩ(x ≜ (q ⦂ a), y ≜ (r ⦂ b))⌝,
	(asm_ruleⓩ∀ x:X; y:Y; z:X | f x ⦁ g  ⌜a + (b:ℕ)⌝ z⌝),
	gen_fail_msg  "z_∀_elim" 41021 [
		string_of_term ⓩ(x ≜ (q ⦂ ℙ a), y ≜ (r ⦂ ℙ b))⌝,
		string_of_term xyz_decl]),
	("z_∀_elim 41021 b",
	z_∀_elim mk_t,
	(asm_ruleⓩ∀ x:X; y:Y; z:X | f x ⦁ g  ⌜a + (b:ℕ)⌝ z⌝),
	gen_fail_msg  "z_∀_elim" 41021 [mk_t_st,
		string_of_term xyz_decl])
	];
=TEX
Notice how second test tests whether $z\_∀\_intro1$ leaks
declaration processing into predicate part.
=SML
let
	val tm1 = ⓩ((x ∈ W ∧ y ∈ X) ∧ ({p,q} ⊆ Y) ∧ (z ∈ Z)) ∧ f x ⇒ g w y z⌝;
	val tm2 = ⓩ((x ∈ W ∧ y ∈ X) ∧ ({p,q} ⊆ Y) ∧ (z ∈ Z))  ⇒ g w y z⌝;
	val tm3 = ⓩ(true ∧ P) ⇒ B⌝;
in
store_mt_results (mt_runf(op =$)) [
	("z_∀_intro1 1",
	concl o z_∀_intro1,
	(all_∀_elim (asm_rule(list_mk_∀(frees tm1, tm1)))),
	ⓩ∀ x:W; y:X; p,q:Y; z:Z | f x ⦁ g w y z⌝),
	("z_∀_intro1 2",
	concl o z_∀_intro1,
	(all_∀_elim (asm_rule(list_mk_∀(frees tm2, tm2)))),
	ⓩ∀ x : W; y : X | {p, q} ⊆ Y ∧ z ∈ Z ⦁ g w y z⌝),
	("z_∀_intro1 3",
	concl o z_∀_intro1,
	(all_∀_elim (asm_rule(list_mk_∀(frees tm3, tm3)))),
	ⓩ∀ | P ⦁ B⌝)
	]
end;
=TEX
=SML
store_mt_results mt_run_fail [
	("z_∀_intro1 41026",
	z_∀_intro1,
	t_thm,
	gen_fail_msg "z_∀_intro1" 41026 [string_of_thm t_thm]),
	("z_∀_intro1 41027",
	z_∀_intro1,
	asm_rule ⓩfalse ∧ true ⇒ true⌝,
	gen_fail_msg "z_∀_intro1" 41027 [mk_f_st]),
	("z_∀_intro1 6005",
	z_∀_intro1,
	asm_rule ⓩx ∈ X ∧ true ⇒ true⌝,
	gen_fail_msg "z_∀_intro1" 6005 [string_of_term ⓩx⌝])
	];
=TEX
=SML
let
	val tm1 = ⓩ((x ∈ W ∧ y ∈ X) ∧ ({p,q} ⊆ Y) ∧ (z ∈ Z)) ∧ f x ⇒ g w y z⌝;
	val tm2 = ⓩ((x ∈ W ∧ y ∈ X) ∧ ({p,q} ⊆ Y) ∧ (z ∈ Z))  ⇒ g w y z⌝;
in
store_mt_results (mt_runf(op =$)) [
	("z_∀_intro 2",
	concl o z_∀_intro [⌜x:'a⌝,⌜y:'b⌝],
	prove_rule[] ⓩ(x = x) ⇒ (y = y)⌝,
	ⓩ∀ x:𝕌; y:𝕌 | x = x ⦁ y = y⌝),
	("z_∀_intro 3",
	concl o z_∀_intro [⌜x:'a⌝,⌜y:'b⌝],
	prove_rule[] ⓩ(x = x) ∧ (y = y)⌝,
	ⓩ∀ x:𝕌; y:𝕌 ⦁ (x = x) ∧ (y = y)⌝),
	("z_∀_intro 4",
	concl o z_∀_intro [],
	prove_rule[] ⓩ(x = x) ⇒ (y = y)⌝,
	ⓩ∀ | x = x ⦁ y = y⌝)
	]
end;
=TEX
=SML
store_mt_results mt_run_fail [
	("z_∀_intro 3007",
	z_∀_intro [mk_t],
	t_thm,
	gen_fail_msg "z_∀_intro" 3007 [mk_t_st]),
	("z_∀_intro 6005",
	z_∀_intro [xX],
	asm_rule (snd(strip_∀ ⓩ[X] x ∈ X ∧ true ⇒ true⌝)),
	gen_fail_msg "z_∀_intro" 6005 [string_of_term ⓩx⌝])
	];
=TEX
=SML
let
	val tm1 = ⓩ∀ x : X; y,z : Y | false ⦁ y = z⌝;
	val tm2 = ⓩ∀ | P ⦁ B⌝;
in
store_mt_results (mt_runf (op =$)) [
	("z_∀_elim_conv2/z_∀_intro_conv1 1",
	snd o dest_eq o concl o conv_rule(RIGHT_C z_∀_intro_conv1) o z_∀_elim_conv2,
	tm1,
	tm1),
	("z_∀_elim_conv2/z_∀_intro_conv1 2",
	snd o dest_eq o concl o conv_rule(RIGHT_C z_∀_intro_conv1) o z_∀_elim_conv2,
	tm2,
	tm2)
	]
end;
=TEX
=SML
let
	val (adecl,_,_) = dest_z_∀ ⓩ∀ x, y:X | false ⦁ true⌝;
in
store_mt_results mt_run_fail [
	("z_∀_elim_conv2 41022",
	z_∀_elim_conv2,
	mk_t,
	gen_fail_msg "z_∀_elim_conv2" 41022 [mk_t_st]),
	("z_∀_intro_conv1 41023",
	z_∀_intro_conv1,
	mk_t,
	gen_fail_msg "z_∀_intro_conv1" 41023 [mk_t_st]),
	("z_∀_intro_conv1 41024",
	z_∀_intro_conv1,
	⌜∀ x ⦁ ⓜadecl⌝ ∧ T ⇒ F⌝,
	gen_fail_msg "z_∀_intro_conv1" 41024 [string_of_term ⌜∀ x ⦁ ⓜadecl⌝ ∧ T ⇒ F⌝])
	]
end;
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_∀_elim_conv 1",
	snd o dest_eq o concl o z_∀_elim_conv,
	ⓩ∀ x, y : X ⦁ x= y⌝,	
	⌜∀ x y:'a ⦁ ⓩ{x,y} ⊆ X ∧ true ⇒ x = y⌝⌝),
	("z_∀_elim_conv 2",
	snd o dest_eq o concl o z_∀_elim_conv,
	ⓩ∀ | P ⦁ B⌝,	
	ⓩtrue ∧ P ⇒ B⌝)
	];
store_mt_results mt_run_fail [
	("z_∀_elim_conv 41022",
	z_∀_elim_conv,
	mk_t,
	gen_fail_msg "z_∀_elim_conv" 41022 [mk_t_st])];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_∃_elim_conv 1",
	snd o dest_eq o concl o z_∃_elim_conv,
	ⓩ∃ x, y : X ⦁ x= y⌝,	
	⌜∃ x y:'a ⦁ ⓩ{x,y} ⊆ X ∧ true ∧ x = y⌝⌝),
	("z_∃_elim_conv 2",
	snd o dest_eq o concl o z_∃_elim_conv,
	ⓩ∃ | P ⦁ B⌝,	
	ⓩtrue ∧ P ∧ B⌝),
	("z_∃_elim_conv 3",
	snd o dest_eq o concl o z_∃_elim_conv,
	ⓩ∃ [] | P ⦁ B⌝,	
	ⓩ[] ∧ P ∧ B⌝)
	];
store_mt_results mt_run_fail [
	("z_∃_elim_conv 41022",
	z_∃_elim_conv,
	mk_t,
	gen_fail_msg "z_∃_elim_conv" 41044 [mk_t_st])];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("all_z_∀_intro 1",
	concl o all_z_∀_intro,
	refl_conv ⓩ{x,y}⌝,
	ⓩ∀ x : 𝕌; y:𝕌 | true ⦁ {x,y} = {x,y}⌝),
	("all_z_∀_intro 2",
	concl o all_z_∀_intro,
	asm_rule ⓩx ∧ y⌝,
	ⓩx ∧ y⌝),
	("all_z_∀_intro 3",
	concl o all_z_∀_intro,
	refl_convⓩx⌝,
	ⓩ∀ x:𝕌 ⦁ x = x⌝)
	];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_∀_elim_conv1 1",
	snd o dest_eq o concl o z_∀_elim_conv1,
	ⓩ∀ x:𝕌; y,z : 𝕌; [a,b:𝕌 × 𝕌] | f ⦁ g⌝,
	⌜∀ a b :('c, 'd) $"Z'T[2]" ⦁ ∀ x:'a⦁ ∀ y z :'b ⦁ f ⇒ g⌝),
	("z_∀_elim_conv1 2",
	snd o dest_eq o concl o z_∀_elim_conv1,
	ⓩ∀ | P ⦁ B⌝,
	⌜P ⇒ B⌝)
	];
store_mt_results mt_run_fail [
	("z_∀_elim_conv1 41022",
	z_∀_elim_conv1,
	mk_t,
	gen_fail_msg "z_∀_elim_conv1" 41022 [mk_t_st]),
	("z_∀_elim_conv1 41071",
	z_∀_elim_conv1,
	ⓩ∀ x : X ⦁ false⌝,
	gen_fail_msg "z_∀_elim_conv1" 41071 [string_of_term ⓩ∀ x : X ⦁ false⌝])];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_∀_inv_conv 1",
	snd o dest_eq o concl o z_∀_inv_conv,
	ⓩ∀ x, y : X | f ⦁ g⌝,
	ⓩf ⇒ (∀ x, y : X | true ⦁ false) ∨ g⌝),
	("z_∀_inv_conv 1b",
	snd o dest_eq o concl o z_∀_inv_conv,
	ⓩ∀ x : X | f ⦁ g⌝,
	ⓩf ⇒ (∀ x : X | true ⦁ false) ∨ g⌝),
	("z_∀_inv_conv 2",
	snd o dest_eq o concl o z_∀_inv_conv,
	ⓩ∀ x, y : X | x > 0 ⦁ z⌝,
	ⓩ(∀ x, y : X | x > 0 ⦁ false) ∨ z⌝),
	("z_∀_inv_conv 3",
	snd o dest_eq o concl o z_∀_inv_conv,
	ⓩ∀ x,y : X | f ⦁ x = y⌝,
	ⓩf ⇒ (∀ x,y : X | true ⦁ x = y)⌝),
	("z_∀_inv_conv 4",
	snd o dest_eq o concl o z_∀_inv_conv,
	ⓩ∀ x,y : X ⦁ g⌝,
	ⓩ(∀ x,y : X ⦁ false) ∨ g⌝),
	("z_∀_inv_conv 5",
	snd o dest_eq o concl o z_∀_inv_conv,
	ⓩ∀ x,y : X | f⦁ false⌝,
	ⓩf ⇒ (∀ x,y : X | true ⦁ false)⌝),
	("z_∀_inv_conv 6",
	snd o dest_eq o concl o z_∀_inv_conv,
	ⓩ∀ | P ⦁ B⌝,
	ⓩP ⇒ (∀ | true ⦁ false) ∨ B⌝)
	];
store_mt_results mt_run_fail [
	("z_∀_inv_conv 47310",
	z_∀_inv_conv,
	mk_t,
	gen_fail_msg "z_∀_inv_conv" 47310 [mk_t_st]),
	("z_∀_inv_conv 41025",
	z_∀_inv_conv,
	ⓩ∀ x :X | f x ⦁ g x⌝,
	gen_fail_msg "z_∀_inv_conv" 41025 [
		string_of_term ⓩ∀ x : X | f x ⦁ g x⌝])];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_intro_∀_tac 1",
	tac_res (z_intro_∀_tac ⓩ(x ≜ 1, y ≜ 2)⌝),
	ⓩ(1,2) = (3,4)⌝,
	ⓩ∀ x:𝕌;y:𝕌 ⦁ (x,y) = (3,4)⌝),
	("z_intro_∀_tac 2",
	tac_res (z_intro_∀_tac ⓩ()⌝),
	ⓩ(1,2) = (3,4)⌝,
	ⓩ∀ ⦁ (1,2) = (3,4)⌝)
	];
store_mt_results mt_run_fail [("z_intro_∀_tac 41029",
	tac_fail (z_intro_∀_tac mk_t),
	([],mk_t),
	gen_fail_msg "z_intro_∀_tac" 41029 [mk_t_st])];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_∀_tac 1",
	tac_res z_∀_tac,
	(snd(strip_∀ ⓩ[X,Y] (∀ x:X; y,z:Y | p x ⦁ y = z)⌝)),
	(snd(strip_∀ ⓩ[X,Y] (x ∈ X ∧ {y,z} ⊆ Y) ∧ p x ⇒ y = z⌝))),
	("z_∀_tac 2",
	tac_res z_∀_tac,
	ⓩ∀ | P ⦁ B⌝,
	ⓩtrue ∧ P ⇒ B⌝)
	];
store_mt_results mt_run_fail [("z_∀_tac 41030",
	z_∀_tac,
	([],mk_t),
	gen_fail_msg "z_∀_tac" 41030 [mk_t_st])];
=TEX
=SML
store_mt_results (mt_runf (op =#)) [
	("z_spec_asm_tac 1",
	tac_res1 (z_spec_asm_tac ⓩ∀ x :𝕌 ⦁ x ∧ y⌝ ⓩtrue⌝),
	([ⓩ∀ x :𝕌 ⦁ x ∧ y⌝],ⓩfalse⌝),
	([⌜y:BOOL⌝, ⓩ∀ x : 𝕌 ⦁ x ∧ y⌝],ⓩfalse⌝)
	),
	("z_spec_asm_tac 2",
	tac_res1 (z_spec_asm_tac ⓩ∀ ⦁ x ∧ y⌝ ⓩ()⌝),
	([ⓩ∀ ⦁ x ∧ y⌝],ⓩfalse⌝),
	([⌜y:BOOL⌝, ⌜x:BOOL⌝, ⓩ∀ ⦁ x ∧ y⌝],ⓩfalse⌝)
	)
];
store_mt_results (mt_runf (op =#)) [
	("z_spec_nth_asm_tac 1",
	tac_res1 (z_spec_nth_asm_tac 1 ⓩtrue⌝),
	([ⓩ∀ x :𝕌 ⦁ x ∧ y⌝],ⓩfalse⌝),
	([⌜y:BOOL⌝, ⓩ∀ x : 𝕌 ⦁ x ∧ y⌝],ⓩfalse⌝)
	),
	("z_spec_nth_asm_tac 2",
	tac_res1 (z_spec_nth_asm_tac 1 ⓩ()⌝),
	([ⓩ∀ ⦁ x ∧ y⌝],ⓩfalse⌝),
	([⌜y:BOOL⌝, ⌜x:BOOL⌝, ⓩ∀ ⦁ x ∧ y⌝],ⓩfalse⌝)
	)
];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_∀_intro_conv",
	snd o dest_eq o concl o z_∀_intro_conv,
	⌜∀ x y ⦁ x = y⌝,
	ⓩ∀ x : 𝕌; y : 𝕌 | true ⦁ x = y⌝)];
store_mt_results mt_run_fail [
	("z_∀_intro_conv 41047",
	z_∀_intro_conv,
	mk_t,
	gen_fail_msg "z_∀_intro_conv" 41047 [mk_t_st])];
=TEX
\subsection{Concerning Z Existential Quantification}
=SML
let
	val tm1 = ⓩ∃ x : X; y,z : Y | false ⦁ y = z⌝;
	val tm2 = ⓩ∃ | P ⦁ B⌝;
	val tm3 = ⓩ∃ (D ⦂ ℙ []) | P ⦁ B⌝;
in
store_mt_results (mt_runf (op =$)) [
	("z_∃_elim_conv2/z_∃_intro_conv1 1",
	snd o dest_eq o concl o conv_rule(RIGHT_C z_∃_intro_conv1) o z_∃_elim_conv2,
	tm1,
	tm1),
	("z_∃_elim_conv2/z_∃_intro_conv1 2",
	snd o dest_eq o concl o conv_rule(RIGHT_C z_∃_intro_conv1) o z_∃_elim_conv2,
	tm2,
	tm2),
	("z_∃_elim_conv2/z_∃_intro_conv1 3",
	snd o dest_eq o concl o conv_rule(RIGHT_C z_∃_intro_conv1) o z_∃_elim_conv2,
	tm3,
	tm3)
	]
end;
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_∃_intro_conv",
	snd o dest_eq o concl o z_∃_intro_conv,
	⌜∃ x y ⦁ x = y⌝,
	ⓩ∃ x : 𝕌; y : 𝕌 | true ⦁ x = y⌝)];
store_mt_results mt_run_fail [
	("z_∃_intro_conv 41046",
	z_∃_intro_conv,
	mk_t,
	gen_fail_msg "z_∃_intro_conv" 41046 [mk_t_st])];
=TEX
=SML
let
	val (adecl,_,_) = dest_z_∃ ⓩ∃ x, y:X | false ⦁ true⌝;
in
store_mt_results mt_run_fail [
	("z_∃_elim_conv2 41044",
	z_∃_elim_conv2,
	mk_t,
	gen_fail_msg "z_∃_elim_conv2" 41044 [mk_t_st]),
	("z_∃_intro_conv1 41045",
	z_∃_intro_conv1,
	mk_t,
	gen_fail_msg "z_∃_intro_conv1" 41045 [mk_t_st]),
	("z_∃_intro_conv1 41041",
	z_∃_intro_conv1,
	⌜∃ x ⦁ ⓜadecl⌝ ∧ T ∧ F⌝,
	gen_fail_msg "z_∃_intro_conv1" 41041 [string_of_term ⌜∃ x ⦁ ⓜadecl⌝ ∧ T ∧ F⌝])
	]
end;
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_∃_elim_conv1 1",
	snd o dest_eq o concl o z_∃_elim_conv1,
	ⓩ∃ x:𝕌; y,z : 𝕌; [a,b:𝕌 × 𝕌] | f ⦁ g⌝,
	⌜ ∃ a b :('c, 'd) $"Z'T[2]" ⦁ ∃ x:'a⦁ ∃ y z :'b ⦁f ∧ g⌝),
	("z_∃_elim_conv1 2",
	snd o dest_eq o concl o z_∃_elim_conv1,
	ⓩ∃ | P ⦁ B⌝,
	ⓩP ∧ B⌝),
	("z_∃_elim_conv1 3",
	snd o dest_eq o concl o z_∃_elim_conv1,
	ⓩ∃ []; [[]] | P ⦁ B⌝,
	ⓩP ∧ B⌝)
	];
store_mt_results mt_run_fail [
	("z_∃_elim_conv1 41042",
	z_∃_elim_conv1,
	mk_t,
	gen_fail_msg "z_∃_elim_conv1" 41042 [mk_t_st]),
	("z_∃_elim_conv1 41043",
	z_∃_elim_conv1,
	ⓩ∃ x : X ⦁ false⌝,
	gen_fail_msg "z_∃_elim_conv1" 41043 [string_of_term ⓩ∃ x : X ⦁ false⌝])];
=TEX
\subsection{Concerning Z Unique Existential Quantification}

=SML
store_mt_results (mt_runf (op =$)) [
	("z_∃⋎1_conv 1",
	snd o dest_eq o concl o z_∃⋎1_conv,
	ⓩ∃⋎1 x : X | x = y ⦁ f x⌝,
	ⓩ∃ x : X | x = y ∧ f x ⦁ ∀ x' : X | x' = y ∧ f x' ⦁ x' = x⌝),
	("z_∃⋎1_conv 2",
	snd o dest_eq o concl o z_∃⋎1_conv,
	ⓩ∃⋎1 x,y : X; z:Y | x = y ⦁ z = f x⌝,
	ⓩ(∃ x, y : X; z : Y
	 | (x = y)
	 ∧ (z = f x)
	 ⦁ ∀ x', y' : X; z' : Y
	| (x' = y') ∧ (z' = f x')
      ⦁ (x' = x) ∧ (y' = y) ∧ (z' = z))⌝),
	("z_∃⋎1_conv 3",
	concl o z_∃⋎1_conv,
	ⓩ∃⋎1 [x,y : X; z:Y] | x = x' y y'' ⦁ z = f x⌝,
	(snd(strip_∀ ⓩ[a,b,c](∃⋎1 [x, y : (X ⦂ℙ a); z : (Y ⦂ ℙ b)] | x = x' y (y''⦂c) ⦁ z = f x)
    ⇔ (∃ [x, y : (X ⦂ℙ a); z : (Y ⦂ ℙ b)]
      | x = x' y (y''⦂c) ∧ z = f x
      ⦁ ⓜmk_z_∀(
		mk_z_decl[mk_z_schema_dec (ⓩ[x, y : (X ⦂ℙ a); z : (Y ⦂ ℙ b)]⌝,"'''")],
		(snd(strip_∀ ⓩ[a,b,c](x'''⦂ a) = x' (y'''⦂a) (y''⦂c) ∧ (z'''⦂b) = f x'''⌝)),
		(snd(strip_∀ ⓩ[a,b,c](x'''⦂ a) = x ∧ (y'''⦂a) = y ∧ (z'''⦂b) = z⌝)))⌝)⌝))),
	("z_∃⋎1_conv 4",
	snd o dest_eq o concl o z_∃⋎1_conv,
	ⓩ∃⋎1 ⦁ z = f x⌝,
	ⓩ∃ | true ∧ (z = f x) ⦁ ∀ | true ∧ (z = f x) ⦁ true⌝),
	("z_∃⋎1_conv 5",
	snd o dest_eq o concl o z_∃⋎1_conv,
	ⓩ∃⋎1 | x = y ⦁ z = f x⌝,
	ⓩ∃ | (x = y) ∧ (z = f x) ⦁ ∀ | (x = y) ∧ (z = f x) ⦁ true⌝),
	("z_∃⋎1_conv 6",
	snd o dest_eq o concl o z_∃⋎1_conv,
	ⓩ∃⋎1 (D ⦂ ℙ []) | x = y ⦁ z = f x⌝,
	ⓩ∃ (D ⦂ ℙ []) | (x = y) ∧ (z = f x) ⦁ ∀ D | (x = y) ∧ (z = f x) ⦁ true⌝)
	];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_∃⋎1_tac 1",
	tac_res (z_∃⋎1_tac ⓩ(x ≜ p, y ≜ q)⦂[x,y:X]⌝),
	(snd(strip_∀ ⓩ[X] (∃⋎1 x,y:X | r x ⦁ y = x)⌝)),
	(snd(strip_∀ ⓩ[X] {p,q} ⊆ X ∧ (r p ∧ q = p) ∧
		(∀ x', y':X | r x' ∧ y' = x' ⦁ (x' = p ∧ y' = q))⌝))),
	("z_∃⋎1_tac 2",
	tac_res (z_∃⋎1_tac ⓩ()⌝),
	ⓩ∃⋎1 | r x ⦁ y = x⌝,
	ⓩtrue ∧ (r x ∧ y = x) ∧ (∀ | r x ∧ y = x ⦁ true)⌝),
	("z_∃⋎1_tac 3",
	tac_res (z_∃⋎1_tac ⓩ()⌝),
	ⓩ∃⋎1 [] | r x ⦁ y = x⌝,
	ⓩ[] ∧ (r x ∧ y = x) ∧ (∀ [] | r x ∧ y = x ⦁ true)⌝)
	];
store_mt_results mt_run_fail [
	("z_∃⋎1_tac 41123",
	tac_fail (z_∃⋎1_tac mk_t),
	([],ⓩtrue⌝),
	gen_fail_msg "z_∃⋎1_tac" 41123 []),
	("z_∃⋎1_tac 41021",
	tac_fail (z_∃⋎1_tac mk_t),
	([],ⓩ∃⋎1 x:X | x = 1 ⦁ true⌝),
	gen_fail_msg "z_∃⋎1_tac" 41021 [mk_t_st,string_of_term (#1(dest_z_∃⋎1 ⓩ∃⋎1 x:X | x = 1 ⦁ true⌝))])];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_∃⋎1_intro_conv",
	snd o dest_eq o concl o z_∃⋎1_intro_conv,
	⌜∃⋎1 x ⦁ x = y⌝,
	ⓩ∃⋎1 x : 𝕌 | true ⦁ x = y⌝)];
store_mt_results mt_run_fail [
	("z_∃⋎1_intro_conv 41048",
	z_∃⋎1_intro_conv,
	mk_t,
	gen_fail_msg "z_∃⋎1_intro_conv" 41048 [mk_t_st])];
=TEX

=SML
store_mt_results (mt_runf (op =$)) [
	("z_∃_tac 1",
	tac_res (z_∃_tac mk_t),
	ⓩ∃ x : 𝕌⦁ x ∧ y⌝,
	ⓩtrue ∈ 𝕌 ∧ true ∧ true ∧ y⌝),
	("z_∃_tac 2",
	tac_res (z_∃_tac ⓩ(x ≜ 1, y ≜ 2)⌝),
	ⓩ∃ x : 𝕌; y : 𝕌⦁ (x,y) = (1,2)⌝,
	ⓩ(1 ∈ 𝕌 ∧ 2 ∈ 𝕌) ∧ true ∧ (1,2) = (1,2)⌝)
	];

let
	val t = (mk_var("t", type_of ⓩ(x ≜ 1, y ≜ 2)⌝));
	val θ = inst[] [(ⓣℤ⌝,ⓣ'a⌝), (ⓣℤ⌝,ⓣ'b⌝)] ⓩθ TEST_SCHEMA⌝;
in
store_mt_results (mt_runf (op =$)) [
	("z_∃_tac 3",
	tac_res (z_∃_tac t),
	ⓩ∃ x : 𝕌; y : 𝕌⦁ (x,y) = (1,2)⌝,
	ⓩ(ⓜt⌝.x ∈ 𝕌 ∧ ⓜt⌝.y ∈ 𝕌) ∧ true ∧ (ⓜt⌝.x, ⓜt⌝.y) = (1,2)⌝),
	("z_∃_tac 4",
	tac_res (z_∃_tac ⓩθ TEST_SCHEMA⌝),
	ⓩ∃ x : 𝕌; y : 𝕌⦁ (x,y) = (1,2)⌝,
	ⓩ(ⓜθ⌝.x ∈ 𝕌 ∧ ⓜθ⌝.y ∈ 𝕌) ∧ true ∧ (ⓜθ⌝.x, ⓜθ⌝.y) = (1,2)⌝)
	]
end;

store_mt_results (mt_runf (op =$)) [
	("z_∃_tac 5",
	tac_res (z_∃_tac ⓩ()⌝),
	ⓩ∃ ⦁ (x,y) = (1,2)⌝,
	ⓩtrue ∧ true ∧ (x,y) = (1,2)⌝),
	("z_∃_tac 6",
	tac_res (z_∃_tac ⓩ()⌝),
	ⓩ∃ [] ⦁ (x,y) = (1,2)⌝,
	ⓩ[] ∧ true ∧ (x,y) = (1,2)⌝)
	];
=TEX
=SML
store_mt_results mt_run_fail [
	("z_∃_tac 47290",
	tac_fail (z_∃_tac mk_t),
	([],ⓩtrue⌝),
	gen_fail_msg "z_∃_tac" 47290 [mk_t_st]),
	("z_∃_tac 41021 a",
	tac_fail (z_∃_tac ⓩ(x ≜ (q ⦂ ℙ a), y ≜ (r ⦂ ℙ b))⌝),
	([],ⓩ∃ x:X; y:Y; z:X | f x ⦁ g  ⌜a + (b:ℕ)⌝ z⌝),
	gen_fail_msg "z_∃_tac" 41021 [
		string_of_term ⓩ(x ≜ (q ⦂ ℙ a), y ≜ (r ⦂ ℙ b))⌝,
		string_of_term xyz_decl]),
	("z_∃_tac 41021 b",
	tac_fail (z_∃_tac mk_t),
	([],ⓩ∃ x:X; y:Y; z:X | f x ⦁ g  ⌜a + (b:ℕ)⌝ z⌝),
	gen_fail_msg "z_∃_tac" 41021 [mk_t_st,
		string_of_term xyz_decl])
	];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_∃_inv_conv 1",
	snd o dest_eq o concl o z_∃_inv_conv,
	ⓩ∃ x, y : X | f ⦁ g⌝,
	ⓩf ∧ (∃ x, y : X | true ⦁ true) ∧ g⌝),
	("z_∃_inv_conv 1b",
	snd o dest_eq o concl o z_∃_inv_conv,
	ⓩ∃ x: X | f ⦁ g⌝,
	ⓩf ∧ (∃ x : X | true ⦁ true) ∧ g⌝),
	("z_∃_inv_conv 2",
	snd o dest_eq o concl o z_∃_inv_conv,
	ⓩ∃ x, y : X | x > 0 ⦁ z⌝,
	ⓩ(∃ x, y : X | x > 0 ⦁ true) ∧ z⌝),
	("z_∃_inv_conv 3",
	snd o dest_eq o concl o z_∃_inv_conv,
	ⓩ∃ x,y : X | f ⦁ x = y⌝,
	ⓩf ∧ (∃ x,y : X | true ⦁ x = y)⌝),
	("z_∃_inv_conv 4",
	snd o dest_eq o concl o z_∃_inv_conv,
	ⓩ∃ x,y : X ⦁ g⌝,
	ⓩ(∃ x,y : X ⦁ true) ∧ g⌝),
	("z_∃_inv_conv 5",
	snd o dest_eq o concl o z_∃_inv_conv,
	ⓩ∃ x,y : X | f⦁ true⌝,
	ⓩf ∧ (∃ x,y : X | true ⦁ true)⌝),
	("z_∃_inv_conv 6",
	snd o dest_eq o concl o z_∃_inv_conv,
	ⓩ∃ | f⦁ g⌝,
	ⓩf ∧ (∃ ⦁ true) ∧ g⌝),
	("z_∃_inv_conv 7",
	snd o dest_eq o concl o z_∃_inv_conv,
	ⓩ∃ [] | f⦁ g⌝,
	ⓩf ∧ (∃ [] ⦁ true) ∧ g⌝)
	];
store_mt_results mt_run_fail [
	("z_∃_inv_conv 47290",
	z_∃_inv_conv,
	mk_t,
	gen_fail_msg "z_∃_inv_conv" 47290 [mk_t_st]),
	("z_∃_inv_conv 41040",
	z_∃_inv_conv,
	ⓩ∃ x : X | f x ⦁ g x⌝,
	gen_fail_msg "z_∃_inv_conv" 41040 [
		string_of_term ⓩ∃ x : X | f x ⦁ g x⌝])];
=TEX
\subsection{Conversions between Z Universal and Existential Quantifications}
The first of the following will fail with HOL version 1.97, but should not fail with later ones.
=SML
store_mt_results (mt_runf (op =$)) [(
	"z_¬_∀_conv 1",
	snd o dest_eq o concl o z_¬_∀_conv,
	ⓩ¬(∀ x:X; y,z:Y; [a,b:𝕌] | y = z ⦁ a = b)⌝,
	ⓩ∃ x:X; y,z:Y; [a,b:𝕌] | y = z ⦁ ¬ a = b⌝),
	("z_¬_∀_conv 2",
	snd o dest_eq o concl o z_¬_∀_conv,
	ⓩ¬(∀ xx:X; y,z:Y; [a,b:𝕌] | y = z ⦁ a = b)⌝,
	ⓩ∃ xx:X; y,z:Y; [a,b:𝕌] | y = z ⦁ ¬ a = b⌝),
	("z_¬_∀_conv 3",
	snd o dest_eq o concl o z_¬_∀_conv,
	ⓩ¬(∀ | y = z ⦁ a = b)⌝,
	ⓩ∃ | y = z ⦁ ¬ a = b⌝),
	("z_¬_∀_conv 4",
	snd o dest_eq o concl o z_¬_∀_conv,
	ⓩ¬(∀ [] | y = z ⦁ a = b)⌝,
	ⓩ∃ [] | y = z ⦁ ¬ a = b⌝)
	];
=TEX
The first of the following will fail with HOL version 1.97, but should not fail with later ones.
=SML
store_mt_results (mt_runf (op =$)) [(
	"z_¬_∃_conv 1",
	snd o dest_eq o concl o z_¬_∃_conv,
	ⓩ¬(∃ x:X; y,z:Y; [a,b:𝕌] | y = z ⦁ a = b)⌝,
	ⓩ∀ x:X; y,z:Y; [a,b:𝕌] | y = z ⦁ ¬ a = b⌝),
	("z_¬_∃_conv 2",
	snd o dest_eq o concl o z_¬_∃_conv,
	ⓩ¬(∃ xx:X; y,z:Y; [a,b:𝕌] | y = z ⦁ a = b)⌝,
	ⓩ∀ xx:X; y,z:Y; [a,b:𝕌] | y = z ⦁ ¬ a = b⌝),
	("z_¬_∃_conv 3",
	snd o dest_eq o concl o z_¬_∃_conv,
	ⓩ¬(∃ | y = z ⦁ a = b)⌝,
	ⓩ∀ | y = z ⦁ ¬ a = b⌝),
	("z_¬_∃_conv 4",
	snd o dest_eq o concl o z_¬_∃_conv,
	ⓩ¬(∃ [] | y = z ⦁ a = b)⌝,
	ⓩ∀ [] | y = z ⦁ ¬ a = b⌝)
	];
store_mt_results mt_run_fail [("z_¬_∀_conv 41050",
	z_¬_∀_conv,
	mk_t,
	gen_fail_msg "z_¬_∀_conv" 41050 [mk_t_st]),
	("z_¬_∃_conv 41051",
	z_¬_∃_conv,
	mk_t,
	gen_fail_msg "z_¬_∃_conv" 41051 [mk_t_st])
	];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_¬_in_conv 1",
	snd o dest_eq o concl o z_¬_in_conv,
	ⓩ¬(¬ (x ∧ y))⌝,
	ⓩ(x ∧ y)⌝),
	("z_¬_in_conv 2",
	snd o dest_eq o concl o z_¬_in_conv,
	ⓩ¬(t1 ∧ t2)⌝,
	ⓩ¬t1 ∨ ¬t2⌝),
	("z_¬_in_conv 3",
	snd o dest_eq o concl o z_¬_in_conv,
	ⓩ¬(t1 ∨ t2)⌝,
	ⓩ¬t1 ∧ ¬t2⌝),
	("z_¬_in_conv 4",
	snd o dest_eq o concl o z_¬_in_conv,
	ⓩ¬(t1 ⇒ t2)⌝,
	ⓩt1 ∧ ¬t2⌝),
	("z_¬_in_conv 5",
	snd o dest_eq o concl o z_¬_in_conv,
	ⓩ¬((x ∧ y) ⇔ t2)⌝,
	ⓩ((x ∧ y) ∧ ¬t2) ∨ (t2 ∧ ¬(x ∧ y))⌝),
	("z_¬_in_conv 6",
	snd o dest_eq o concl o z_¬_in_conv,
	ⓩ¬(t1 = t1)⌝,
	ⓩfalse⌝),
	("z_¬_in_conv 7.1",
	snd o dest_eq o concl o z_¬_in_conv,
	ⓩ¬(∀ x:X | P⦁ V)⌝,
	ⓩ∃ x:X | P⦁ ¬ V⌝),
	("z_¬_in_conv 7.2",
	snd o dest_eq o concl o z_¬_in_conv,
	ⓩ¬(∀ | P⦁ V)⌝,
	ⓩ∃ | P⦁ ¬ V⌝),
	("z_¬_in_conv 7.3",
	snd o dest_eq o concl o z_¬_in_conv,
	ⓩ¬(∀ [] | P⦁ V)⌝,
	ⓩ∃ [] | P⦁ ¬ V⌝),
	("z_¬_in_conv 8.1",
	snd o dest_eq o concl o z_¬_in_conv,
	ⓩ¬( ∃ x:X | P⦁ V)⌝,
	ⓩ∀ x:X | P⦁ ¬ V⌝),
	("z_¬_in_conv 8.2",
	snd o dest_eq o concl o z_¬_in_conv,
	ⓩ¬( ∃ | P⦁ V)⌝,
	ⓩ∀ | P⦁ ¬ V⌝),
	("z_¬_in_conv 8.3",
	snd o dest_eq o concl o z_¬_in_conv,
	ⓩ¬( ∃ [] | P⦁ V)⌝,
	ⓩ∀ [] | P⦁ ¬ V⌝),
	("z_¬_in_conv 9.1",
	snd o dest_eq o concl o z_¬_in_conv,
	ⓩ¬ (∃⋎1 x:X|P⦁ V x)⌝,
	ⓩ∀x:X |P ∧ V x ⦁¬ (∀x':X |P ∧ V x' ⦁ x' = x)⌝),
	("z_¬_in_conv 9.2",
	snd o dest_eq o concl o z_¬_in_conv,
	ⓩ¬ (∃⋎1 |P⦁ V x)⌝,
	ⓩ∀ |P ∧ V x ⦁¬ (∀ |P ∧ V x ⦁ true)⌝),
	("z_¬_in_conv 9.3",
	snd o dest_eq o concl o z_¬_in_conv,
	ⓩ¬ (∃⋎1 [] |P⦁ V x)⌝,
	ⓩ∀ [] |P ∧ V x ⦁¬ (∀ [] |P ∧ V x ⦁ true)⌝),
	("z_¬_in_conv 10",
	snd o dest_eq o concl o z_¬_in_conv,
	ⓩ¬ true⌝,
	ⓩfalse⌝),
	("z_¬_in_conv 11",
	snd o dest_eq o concl o z_¬_in_conv,
	ⓩ¬ false⌝,
	ⓩtrue⌝)
	];
=TEX
=SML
store_mt_results mt_run_fail [(
	"z_¬_in_conv 28131",
	z_¬_in_conv,
	ⓩ¬ x⌝,
	gen_fail_msg "z_¬_in_conv" 28131 [string_of_term ⓩ¬ x⌝]),
	("z_¬_in_conv 47240",
	z_¬_in_conv,
	mk_t,
	gen_fail_msg "z_¬_in_conv" 47240 [mk_t_st])
	];
=TEX
\subsection{Conversions betweens Declarations and Predicates}
=SML
store_mt_results (mt_runf (op =$)) [
	("z_dec_pred_conv 1",
	snd o dest_eq o concl o z_dec_pred_conv,
	mk_z_dec([ⓩx⌝],⌜X : 'a SET⌝),
	ⓩx ∈ X⌝),
	("z_dec_pred_conv 2",
	snd o dest_eq o concl o z_dec_pred_conv,
	mk_z_dec([ⓩx⌝,ⓩy⌝],⌜X : 'a SET⌝),
	ⓩ{x,y} ⊆ X⌝),
	("z_dec_pred_conv 3",
	snd o dest_eq o concl o z_dec_pred_conv,
	mk_z_schema_dec(ⓩ[x,y:X]⌝,""),
	mk_z_schema_pred(ⓩ[x,y:X]⌝,"")),
	("z_dec_pred_conv 4",
	snd o dest_eq o concl o z_dec_pred_conv,
	subst [(⌜x1:'X⌝,⌜x:'X⌝)]
	(mk_z_schema_dec((inst[][(ⓣ'X⌝,ⓣ'a⌝)] ⓩ[x,y:X]⌝),"")),
	(snd(strip_∀ ⓩ[X] (x ≜ x1, y ≜ y) ∈ [x,y:X]⌝)))
	];
store_mt_results mt_run_fail [(
	"z_dec_pred_conv 41010",
	z_dec_pred_conv,
	mk_t,
	gen_fail_msg "z_dec_pred_conv" 41010 [mk_t_st])
	];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_decl_pred_conv 1",
	snd o dest_eq o concl o z_decl_pred_conv,
	mk_z_decl[mk_z_dec([ⓩx⌝],⌜X : 'a SET⌝),
		mk_z_dec([ⓩx⌝,ⓩy⌝],⌜X : 'a SET⌝),
		mk_z_schema_dec(ⓩ[x,y:X]⌝,"")],	
	list_mk_∧[ⓩx ∈ X⌝, ⓩ{x,y} ⊆ X⌝, mk_z_schema_pred(ⓩ[x,y:X]⌝,"")]),
	("z_decl_pred_conv 2",
	snd o dest_eq o concl o z_decl_pred_conv,
	mk_z_decl[],	
	mk_z_true)
	];
store_mt_results mt_run_fail [(
	"z_decl_pred_conv 47912",
	z_decl_pred_conv,
	mk_t,
	gen_fail_msg "z_decl_pred_conv" 47912 [mk_t_st])
	];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_pred_decl_conv 1",
	snd o dest_eq o concl o z_pred_decl_conv,
	list_mk_∧[ⓩx ∈ X⌝, ⓩ{x,y} ⊆ X⌝, mk_z_schema_pred(ⓩ[x,y:X]⌝,"")],	
	mk_z_decl[mk_z_dec([ⓩx⌝],⌜X : 'a SET⌝),
		mk_z_dec([ⓩx⌝,ⓩy⌝],⌜X : 'a SET⌝),
		mk_z_schema_dec(ⓩ[x,y:X]⌝,"")]),
	("z_pred_decl_conv 2",
	snd o dest_eq o concl o z_pred_decl_conv,
	mk_z_true,	
	mk_z_decl[])
	];
store_mt_results mt_run_fail [(
	"z_pred_decl_conv 41011",
	z_pred_decl_conv,
	mk_f,
	gen_fail_msg "z_pred_decl_conv" 41011 [mk_f_st])
	];

=TEX
=SML
let
val (d1,_,_) = dest_z_∀ⓩ∀ x:X; y,z:Y; [a,b:Z] ⦁ true⌝;
val (d2,_,_) = dest_z_∀ⓩ∀ ⦁ true⌝;
in
	store_mt_results (mt_runf (op =$)) [
	("Z_DECL_C 1",
	snd o dest_eq o concl o Z_DECL_C z_dec_pred_conv,
	d1,
	ⓩx ∈ X ∧ {y,z} ⊆ Y ∧ [a,b:Z]⌝),
	("Z_DECL_C 2",
	snd o dest_eq o concl o Z_DECL_C z_dec_pred_conv,
	d2,
	ⓩtrue⌝)
	]
end;
store_mt_results mt_run_fail [(
	"Z_DECL_C 47912",
	Z_DECL_C z_dec_pred_conv,
	mk_t,
	gen_fail_msg "Z_DECL_C" 47912 [mk_t_st]),
	("Z_DECL_C 41012",
	Z_DECL_C z_dec_pred_conv,
	mk_z_decl[mk_t],
	gen_fail_msg "Z_DECL_C" 41012 [string_of_term (mk_z_decl[mk_t])])
	];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_pred_dec_conv 1",
	snd o dest_eq o concl o z_pred_dec_conv,
	ⓩx ∈ X⌝,
	mk_z_dec([ⓩx⌝],⌜X : 'a SET⌝)),
	("z_pred_dec_conv 2",
	snd o dest_eq o concl o z_pred_dec_conv,
	ⓩ{x,y} ⊆ X⌝,
	mk_z_dec([ⓩx⌝,ⓩy⌝],⌜X : 'a SET⌝)),
	("z_pred_dec_conv 3",
	snd o dest_eq o concl o z_pred_dec_conv,
	mk_z_schema_pred(ⓩ[x,y:X]⌝,""),
	mk_z_schema_dec(ⓩ[x,y:X]⌝,"")),
	("z_pred_dec_conv 4",
	snd o dest_eq o concl o z_pred_dec_conv,
	ⓩθ[x, ### : X | x = z] ∈ [x, ### : X | x = z]⌝,
	mk_z_schema_dec(ⓩ[x, ### : X | x = z]⌝,""))];
store_mt_results mt_run_fail [(
	"z_pred_dec_conv 41010",
	z_pred_dec_conv,
	mk_t,
	gen_fail_msg "z_pred_dec_conv" 41011 [mk_t_st]),
	("z_pred_dec_conv 41010 a",
	z_pred_dec_conv,
	ⓩ(x,y) ∈ z⌝,
	gen_fail_msg "z_pred_dec_conv" 41011 [string_of_term ⓩ(x,y) ∈ z⌝]),
	("z_pred_dec_conv 41010 b",
	z_pred_dec_conv,
	ⓩ{a} ⊆ z⌝,
	gen_fail_msg "z_pred_dec_conv" 41011 [string_of_term ⓩ{a} ⊆ z⌝]),
	("z_pred_dec_conv 41010 c",
	z_pred_dec_conv,
	ⓩ{a,1} ⊆ z⌝,
	gen_fail_msg "z_pred_dec_conv" 41011 [string_of_term ⓩ{a,1} ⊆ z⌝])
	];
=TEX
=SML
let
val (d1,_,_) = dest_z_∀ⓩ∀ x:X; y,z:Y; [a,b:Z] ⦁ true⌝;
val (d2,_,_) = dest_z_∀ⓩ∀ ⦁ true⌝;
in
	store_mt_results (mt_runf (op =$)) [
	("Z_DECL_INTRO_C 1",
	snd o dest_eq o concl o Z_DECL_INTRO_C z_pred_dec_conv,
	ⓩx ∈ X ∧ {y,z} ⊆ Y ∧ [a,b:Z]⌝,
	d1),
	("Z_DECL_INTRO_C 2",
	snd o dest_eq o concl o Z_DECL_INTRO_C z_pred_dec_conv,
	ⓩtrue⌝,
	d2)
	]
end;
store_mt_results mt_run_fail [(
	"Z_DECL_INTRO_C 41013",
	Z_DECL_INTRO_C z_dec_pred_conv,
	mk_f,
	gen_fail_msg "Z_DECL_INTRO_C" 41013 [mk_f_st]),
	("Z_DECL_INTRO_C 41014",
	Z_DECL_INTRO_C id_conv,
	mk_f,
	gen_fail_msg "Z_DECL_INTRO_C" 41014 [mk_f_st,mk_f_st])
	];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [("z_∈_setd_conv",
	snd o dest_eq o concl o z_∈_setd_conv,
	mk_z_∈(ⓩ2⌝, ⓩ{1,2,3}⌝),
	ⓩ2 = 1 ∨ 2 = 2 ∨ 2 = 3⌝)];
store_mt_results mt_run_fail [("z_∈_setd_conv 41015 a",
	z_∈_setd_conv,
	mk_t,
	gen_fail_msg "z_∈_setd_conv" 41015 [trues]),
	("z_∈_setd_conv 41015 b",
	z_∈_setd_conv,
	notz,
	gen_fail_msg "z_∈_setd_conv" 41015 [notzs]),
	("z_∈_setd_conv 41015 c",
	z_∈_setd_conv,
	ⓩx ∈  ⌜Z'Setd (Cons h t)⌝⌝,
	gen_fail_msg "z_∈_setd_conv" 41015
	   [string_of_term ⓩx ∈  ⌜Z'Setd (Cons h t)⌝⌝])
	];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_setd_⊆_conv 1",
	snd o dest_eq o concl o z_setd_⊆_conv,
	ⓩ{} ⊆ ℙ X⌝,
	ⓩtrue⌝),
	("z_setd_⊆_conv 2",
	snd o dest_eq o concl o z_setd_⊆_conv,
	ⓩ{x,y,z} ⊆ ℙ X⌝,
	ⓩx ∈ ℙ X ∧ y ∈ ℙ X ∧ z ∈ ℙ X⌝),
	("z_setd_⊆_conv 3",
	snd o dest_eq o concl o z_setd_⊆_conv,
	ⓩ{f(ⓩx = x ⇒ y⌝),y} ⊆ (h(ⓩp = p ⇒ q⌝))⌝,
	ⓩf ⌜y:BOOL⌝ ∈ h ⌜q:BOOL⌝ ∧ ⌜y:BOOL⌝ ∈ h ⌜q:BOOL⌝⌝)
	];
store_mt_results mt_run_fail [("z_setd_⊆_conv 41017",
	z_setd_⊆_conv,
	mk_t,
	gen_fail_msg "z_setd_⊆_conv" 41017 [trues])
	];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_schema_pred_conv1",
	snd o dest_eq o concl o z_schema_pred_conv1,
	⌜Z'SchemaPred ⓩ(x ≜ 1, y ≜ 2)⌝ ⓩ[x,y:X| x =1]⌝⌝,
	ⓩ(x ≜ 1, y ≜ 2) ∈ [x,y:X| x = 1]⌝)
	];
let
	val ok = snd(dest_∧(ⓩtrue ∧ [x,y:X| x =1]⌝));
in
store_mt_results mt_run_fail [("z_schema_pred_conv1 41018 a",
	z_schema_pred_conv1,
	mk_t,
	gen_fail_msg "z_schema_pred_conv1" 41018 [trues]),
	("z_schema_pred_conv1 41018 b",
	z_schema_pred_conv1,
	ok,
	gen_fail_msg "z_schema_pred_conv1" 41018 [string_of_term ok])
	]
end;
=TEX
\subsection{Generic Predicates}
=SML
store_mt_results (mt_runf (op =$)) [("z_¬_gen_pred_conv",
	snd o dest_eq o concl o z_¬_gen_pred_conv,
	mk_¬ ⓩ[X,Y,Z] (∀ a:X;b:Y;c:Z ⦁ f a b c)⌝,
	inst [] [(ⓣ'X⌝,ⓣ'a⌝),(ⓣ'Y⌝,ⓣ'b⌝),(ⓣ'Z⌝,ⓣ'c⌝)]
	ⓩ(∃ X:𝕌[⌜Totality:'X SET⌝];Y:𝕌[⌜Totality:'Y SET⌝];Z:𝕌[⌜Totality:'Z SET⌝] ⦁ ¬(∀ a:X;b:Y;c:Z ⦁ f a b c))⌝)
	];
store_mt_results mt_run_fail [("z_¬_gen_pred_conv 41031",
	z_¬_gen_pred_conv,
	mk_t,
	gen_fail_msg "z_¬_gen_pred_conv" 41031 [trues])
	];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [("z_gen_pred_intro",
	concl o z_gen_pred_intro [ⓩX⌝,ⓩY⌝],
	(refl_conv (snd(strip_∀ⓩ[X,Y] (∀ x:X; y:Y ⦁ f x y)⌝))),
	ⓩ[X,Y] (∀ x:X; y:Y ⦁ f x y) ⇔ (∀ x:X; y:Y ⦁ f x y)⌝)
	];
store_mt_results mt_run_fail [("z_gen_pred_intro 3007",
	z_gen_pred_intro [mk_t],
	t_thm,
	gen_fail_msg "z_gen_pred_intro" 3007 [trues]),
	("z_gen_pred_intro 6005",
	z_gen_pred_intro [ⓩX⌝],
	asm_rule (snd(strip_∀ⓩ[X] X = X⌝)),
	gen_fail_msg "z_gen_pred_intro" 6005 [string_of_term ⓩX⌝])
	];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [("z_gen_pred_elim",
	concl o z_gen_pred_elim [ⓩ{1}⌝,ⓩ{{1}}⌝],
	pc_rule1 "z_predicates" prove_rule []
		ⓩ[X,Y] (∀ x:X; y:Y ⦁ f x y = f x y)⌝,
	ⓩ∀ x:{1};y:{{1}} ⦁ f x y = f x y⌝)
	];
=TEX
=SML
fun cmp_inst (tm1, tm2) = (
	(term_match tm1 tm2;
	term_match tm2 tm1;
	true) handle Fail _ => false
);
=TEX
=SML
store_mt_results (mt_runf cmp_inst) [("z_gen_pred_u_elim",
	concl o z_gen_pred_u_elim,
	pc_rule1 "z_predicates" prove_rule []
		ⓩ[X,Y] (∀ x:X; y:Y ⦁ f x y = f x y)⌝,
	ⓩ∀ x:𝕌;y:𝕌 ⦁ f x y = f x y⌝)
	];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [("z_gen_pred_elim1",
	concl o z_gen_pred_elim1 ⓩ({1}, {{1}})⌝,
	pc_rule1 "z_predicates" prove_rule []
		ⓩ[X,Y] (∀ x:X; y:Y ⦁ f x y = f x y)⌝,
	ⓩ∀ x:{1};y:{{1}} ⦁ f x y = f x y⌝)
	];
=TEX
=SML
store_mt_results mt_run_fail [("z_gen_pred_elim 41033",
	z_gen_pred_elim [mk_t],
	asm_rule ⓩ[X] x = 1⌝,
	gen_fail_msg "z_gen_pred_elim" 41033 [string_of_thm (asm_rule ⓩ[X] x = 1⌝)]),
	("z_gen_pred_elim 41034",
	z_gen_pred_elim [mk_t],
	t_thm,
	gen_fail_msg "z_gen_pred_elim" 41034 [string_of_thm t_thm]),
	("z_gen_pred_elim1 41033",
	z_gen_pred_elim1 mk_t,
	asm_rule ⓩ[X] x = 1⌝,
	gen_fail_msg "z_gen_pred_elim1" 41033 [string_of_thm (asm_rule ⓩ[X] x = 1⌝)]),
	("z_gen_pred_elim1 41034",
	z_gen_pred_elim1 mk_t,
	t_thm,
	gen_fail_msg "z_gen_pred_elim1" 41034 [string_of_thm t_thm])

];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_gen_pred_tac",
	tac_res z_gen_pred_tac,
	ⓩ[X,Y] (∀ x:X; y,z:Y | p x ⦁ y = z)⌝,
	(snd(strip_∀ ⓩ[X,Y] (∀ x:X; y,z:Y | p x ⦁ y = z)⌝)))
	];
store_mt_results mt_run_fail [
	("z_gen_pred_tac 41035",
	z_gen_pred_tac,
	([],mk_f),
	gen_fail_msg "z_gen_pred_tac" 41035 [])];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_intro_gen_pred_tac",
	tac_res (z_intro_gen_pred_tac (map (fn x => (x,x))
		(fst(strip_∀ ⓩ[X,Y] (∀ x:X; y,z:Y | p x ⦁ y = z)⌝)))),
	(snd(strip_∀ ⓩ[X,Y] (∀ x:X; y,z:Y | p x ⦁ y = z)⌝)),
	ⓩ[X,Y] (∀ x:X; y,z:Y | p x ⦁ y = z)⌝)	
	];
store_mt_results mt_run_fail [
	("z_intro_gen_pred_tac 41032",
	z_intro_gen_pred_tac[(⌜p⌝,⌜q⌝)],
	([],mk_f),
	gen_fail_msg "z_intro_gen_pred_tac" 41032 [string_of_term ⌜q⌝]),
	("z_intro_gen_pred_tac 41036",
	z_intro_gen_pred_tac[(⌜T⌝,⌜X:'X SET⌝)],
	([],mk_f),
	gen_fail_msg "z_intro_gen_pred_tac" 41036 [string_of_term ⌜X:'X SET⌝,string_of_term ⌜T⌝]),
	("z_intro_gen_pred_tac 28082",
	z_intro_gen_pred_tac[(⌜X:'X SET⌝,⌜X:'X SET⌝)],
	([],mk_f),
	gen_fail_msg "z_intro_gen_pred_tac" 28082 [string_of_term ⌜X:'X SET⌝]),
	("z_intro_gen_pred_tac 28083",
	z_intro_gen_pred_tac[(⌜Y:'X SET⌝,⌜X:'X SET⌝)],
	([],ⓩ[X] f X ⌜Y:'X SET⌝⌝),
	gen_fail_msg "z_intro_gen_pred_tac" 28082 [string_of_term ⌜Y:'X SET⌝,string_of_term ⌜X:'X SET⌝])
	];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("strip_tac-gf",
	tac_res (PC_T "z_predicates" strip_tac),
	mk_¬ ⓩ[X,Y,Z] (∀ a:X;b:Y;c:Z ⦁ f a b c)⌝,
	inst [] [(ⓣ'X⌝,ⓣ'a⌝),(ⓣ'Y⌝,ⓣ'b⌝),(ⓣ'Z⌝,ⓣ'c⌝)]
	ⓩ(∃ X:𝕌[⌜Totality:'X SET⌝];Y:𝕌[⌜Totality:'Y SET⌝];Z:𝕌[⌜Totality:'Z SET⌝] ⦁ ¬(∀ a:X;b:Y;c:Z ⦁ f a b c))⌝)
	];
=TEX
\section{Z REWRITING}
\subsection{Canonicalisation}
=SML
store_mt_results (mt_runf (op =$)) [("z_para_pred_canon",
	concl o hd o z_para_pred_canon,
	asm_rule ⌜Z'AbbDef(∀ X:'X SET; Y:'Y SET ⦁ ⓜmk_∧(
	mk_z_decl[mk_z_dec([⌜x:'X⌝],⌜X : 'X SET⌝),
		mk_z_dec([⌜z:'X⌝,⌜y:'X⌝],⌜X : 'X SET⌝),
		mk_z_schema_dec((inst[][(ⓣ'Y⌝,ⓣ'a⌝)] ⓩ[p,q:Y]⌝),"")],
	(snd(strip_∀ ⓩ[X,Y] (z⦂X) = y ∧ (p ⦂ Y) = q⌝)))⌝)⌝,
	ⓩ[X,Y] (x ∈ X ∧ {z,y} ⊆ X ∧ [p,q:Y]) ∧ (z = y ∧ p = q)⌝)
];

store_mt_results mt_run_fail [(
	"z_para_pred_canon 41080",
	z_para_pred_canon,
	t_thm,
	gen_fail_msg "z_para_pred_canon" 41080 [string_of_thm t_thm])];
store_mt_results (mt_runf (op =$)) [("z_para_pred_conv",
	snd o dest_eq o concl o z_para_pred_conv,
	⌜Z'AbbDef(∀ X:'X SET; Y:'Y SET ⦁ ⓜmk_∧(
	mk_z_decl[mk_z_dec([⌜x:'X⌝],⌜X : 'X SET⌝),
		mk_z_dec([⌜z:'X⌝,⌜y:'X⌝],⌜X : 'X SET⌝),
		mk_z_schema_dec((inst[][(ⓣ'Y⌝,ⓣ'a⌝)] ⓩ[p,q:Y]⌝),"")],
	(snd(strip_∀ ⓩ[X,Y] (z⦂X) = y ∧ (p ⦂ Y) = q⌝)))⌝)⌝,
	ⓩ[X,Y] (x ∈ X ∧ {z,y} ⊆ X ∧ [p,q:Y]) ∧ (z = y ∧ p = q)⌝)
];
store_mt_results mt_run_fail [(
	"z_para_pred_conv 41082",
	z_para_pred_conv,
	mk_t,
	gen_fail_msg "z_para_pred_conv" 41082 [mk_t_st])];

store_mt_results (mt_runf (op =$)) [
	("z_∀_rewrite_canon 1",
	concl o hd o z_∀_rewrite_canon,
	asm_rule (snd(strip_∀ ⓩ[X] (∀ x,y : 𝕌; z:X| f ⦁ x = y)⌝)),
	⌜∀ x y:'a ⦁ ∀ z:'X ⦁ ⓜ(snd(strip_∀ ⓩ[X]({x,y} ⊆ 𝕌 ∧ z ∈ X) ∧ f ⇒ x = y⌝))⌝⌝),
	("z_∀_rewrite_canon 2",
	concl o hd o z_∀_rewrite_canon,
	asm_rule (snd(strip_∀ ⓩ[X] (∀ | f ⦁ x = y)⌝)),
	⌜ⓜ(snd(strip_∀ ⓩ[X](true ∧ f ⇒ x = y)⌝))⌝⌝),
	("z_∀_rewrite_canon 3",
	concl o hd o z_∀_rewrite_canon,
	asm_rule (snd(strip_∀ ⓩ[X] (∀ [] | f ⦁ x = y)⌝)),
	⌜ⓜ(snd(strip_∀ ⓩ[X]([] ∧ f ⇒ x = y)⌝))⌝⌝)
	];
store_mt_results mt_run_fail [(
	"z_∀_rewrite_canon 41081",
	z_∀_rewrite_canon,
	t_thm,
	gen_fail_msg "z_∀_rewrite_canon" 41081 [string_of_thm t_thm])];
=TEX
=SML
let val combo = (z_∀_rewrite_canon THEN_CAN
	(REPEAT_CAN ∀_rewrite_canon) THEN_CAN
	z_⇒_rewrite_canon);
in
store_mt_results (mt_runf (op =$)) [("z_⇒_rewrite_canon 1",
	concl o hd o combo,
	asm_rule (snd(strip_∀ ⓩ[X] (∀ x,y : 𝕌; z:X| f ⦁ x = y)⌝)),
	(snd(strip_∀ ⓩ[X] z ∈ X ∧ f ⇒ x = y⌝))),
	("z_⇒_rewrite_canon 2",
	concl o hd o combo,
	asm_rule ⓩ∀ x,y :𝕌;z:𝕌 | true ⦁ x = y⌝,
	ⓩx = y⌝),
	("z_⇒_rewrite_canon 3",
	concl o hd o combo,
	asm_rule (snd(strip_∀ ⓩ[X,Y] (∀ x,y :X;z:Y | true ⦁ x = y)⌝)),
	(snd(strip_∀ ⓩ[X,Y] ({x,y} ⊆ X ∧ z ∈ Y) ⇒ x = y⌝))),
	("z_⇒_rewrite_canon 4",
	concl o hd o combo,
	asm_rule (snd(strip_∀ ⓩ[X] (∀ | true ⦁ (x ⦂ X) = y)⌝)),
	(snd(strip_∀ ⓩ[X] ((x ⦂ X) = y)⌝))),
	("z_⇒_rewrite_canon 5",
	concl o hd o combo,
	asm_rule (snd(strip_∀ ⓩ[X] (∀ []; [] | true ⦁ (x ⦂ X) = y)⌝)),
	(snd(strip_∀ ⓩ[X] ((x ⦂ X) = y)⌝)))
	]
end;
store_mt_results mt_run_fail [(
	"z_⇒_rewrite_canon 41081",
	z_⇒_rewrite_canon,
	t_thm,
	gen_fail_msg "z_⇒_rewrite_canon" 41083 [string_of_thm t_thm]),
	(
	"z_⇒_rewrite_canon 41084",
	z_⇒_rewrite_canon,
	asm_rule ⌜F ⇒ F⌝,
	gen_fail_msg "z_⇒_rewrite_canon" 41084 [string_of_thm (asm_rule ⌜F ⇒ F⌝)])];
=TEX
=SML
store_mt_results (mt_runf (op =|-)) [
	("z_¬_rewrite_canon 1",
	hd o z_¬_rewrite_canon,
	asm_rule ⓩ¬(t1 ∨ t2)⌝,
	conv_rule z_¬_in_conv
		 (asm_rule ⓩ¬(t1 ∨ t2)⌝)),
	("z_¬_rewrite_canon 2",
	hd o z_¬_rewrite_canon,
	asm_rule ⓩ¬(∃ x : X | f ⦁ g)⌝,
	conv_rule z_¬_in_conv
		 (asm_rule ⓩ¬(∃ x : X | f ⦁ g)⌝)),
	("z_¬_rewrite_canon 3",
	hd o z_¬_rewrite_canon,
	asm_rule ⓩ¬ (¬ t)⌝,
	conv_rule z_¬_in_conv
		 (asm_rule ⓩ¬ (¬ t)⌝)),
	("z_¬_rewrite_canon 4",
	hd o z_¬_rewrite_canon,
	asm_rule ⓩ¬ t⌝,
	pure_rewrite_rule [taut_rule ⌜∀ x ⦁ ¬ x ⇔ x ⇔ F⌝]
		 (asm_rule ⓩ¬ t⌝))
	];

=SML
set_flag ("z_type_check_only", false);
set_flag ("z_use_axioms", true);
=TEX
=TEX
╒[X,Y]═
│Ex : ℙ(X × Y)
├────
│Ex = {}
└────
=SML
store_mt_results (mt_runf (op =$)) [("z_get_spec 1",
	concl o z_get_spec,
	ⓩEx⌝,
	concl (conv_rule z_para_pred_conv (get_axiom "-" "Ex"))),
	("z_get_spec 2",
	concl o z_get_spec,
	⌜Append⌝,
	concl (get_spec ⌜Append⌝))];
=TEX
=SML
store_mt_results mt_run_fail [
	("z_get_spec 46009",
	z_get_spec,
	⌜rubbish⌝,
	gen_fail_msg "z_get_spec" 46009 [string_of_term ⌜rubbish⌝]),
	("z_get_spec 46005",
	z_get_spec,
	(mk_const ("rubbish",BOOL)),
	gen_fail_msg "z_get_spec" 46005 ["rubbish"]),
	("z_get_spec 46006",
	z_get_spec,
	⌜$⇒⌝,
	gen_fail_msg "z_get_spec" 46006 ["⇒"])
	];
=TEX
\subsection{Consistency Proofs}
=SML
val was_z_type_check_only = set_flag ("z_type_check_only", false);
val was_z_use_axioms = set_flag ("z_use_axioms", false);
push_pc "initial";
╒[X]═
f1: (X → X) → X → X
├
∀ x:X; g:X → X ⦁ f1 g x =  g(g x)
└
╒[X,Y]═
f2: (X ↔ Y);
f3: (X ↔ Y)
├
∀ x:X; y:Y ⦁ (x,y) ∈ f2 ⇔ ¬ (x,y) ∈ f3
└

ⓈZAX
ff: (𝕌 → 𝕌) → 𝕌 → 𝕌
├
∀ x:𝕌; g:𝕌 → 𝕌 ⦁ ff g x =  g(g x)
■

ⓈZAX
ff2: (𝕌 ↔ 𝕌);
ff3: (𝕌 ↔ 𝕌)
├
∀ x:𝕌; y:𝕌 ⦁ (x,y) ∈ ff2 ⇔ ¬ (x,y) ∈ ff3
■

ⓈHOLCONST
h : 'a → BOOL
├
∀ x :'a ⦁ h x = T
■
=SML
pop_pc ();
=TEX
=SML
val was_z_type_check_only = set_flag ("z_type_check_only", was_z_type_check_only);
val was_z_use_axioms = set_flag ("z_use_axioms", was_z_use_axioms);
=TEX
=SML
push_pc "hol";
ⓈHOLCONST
there : ℕ
├
there = 0
■
=SML
pop_pc();
=SML
fun test_pcg tm = (
let val s1 = z_push_consistency_goal tm;
	val (asms,cnc) = (top_goal());
	val tidy = drop_main_goal();
in
	if is_nil asms
	then cnc
	else fail "test_pcg-has asms" 0 []
end);
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("z_push_consistency_goal-no gf,1 const",
	test_pcg,
	ⓩff⌝,
	ⓩ∃ ff' : (𝕌 → 𝕌) → 𝕌 → 𝕌
             ⦁ ∀ x : 𝕌; g : 𝕌 → 𝕌 ⦁ ff' g x = g (g x)⌝),
	("z_push_consistency_goal-no gf,2 consts",
	test_pcg,
	ⓩff2⌝,
	ⓩ∃ ff2' : 𝕌 ↔ 𝕌; ff3' : 𝕌 ↔ 𝕌
             ⦁ ∀ x : 𝕌; y : 𝕌
               ⦁ (x, y) ∈ ff2' ⇔ ¬ (x, y) ∈ ff3'⌝),
	("z_push_consistency_goal-1 gf,1 const",
	test_pcg,
	ⓩf1⌝,
	inst [] [(ⓣ'X⌝,ⓣ'c⌝)]
	ⓩ∃ f1' : 𝕌
             ⦁ ∀ X : 𝕌
               ⦁ ⌜f1' ($"Z'Mk_T[1]" X)⌝ ∈ (X → X) → X → X
                 ∧ (∀ x : X; g : X → X
                   ⦁ ⌜f1' ($"Z'Mk_T[1]" X)⌝ g x = g (g x))⌝),
	("z_push_consistency_goal-2 gf,2 consts",
	test_pcg,
	ⓩf3⌝,
	(inst [] [(ⓣ'Y⌝, ⓣ'e⌝), (ⓣ'X⌝, ⓣ'd⌝)]
	ⓩ∃ f3' : 𝕌; f2' : 𝕌
  	⦁ ∀ X : 𝕌; Y : 𝕌
 	   ⦁ (⌜f2' ⓩ(X, Y)⌝⌝ ∈ X ↔ Y
	      ∧ ⌜f3' ⓩ(X, Y)⌝⌝ ∈ X ↔ Y)
	      ∧ (∀ x : X; y : Y ⦁ (x, y) ∈ ⌜f2' ⓩ(X, Y)⌝⌝ ⇔ ¬ (x, y) ∈ ⌜f3' ⓩ(X, Y)⌝⌝)⌝)),
	("z_push_consistency_goal-hol",
	test_pcg,
	⌜h⌝,
	⌜∃ h''⦁ ∀ x⦁ h'' x ⇔ T⌝)
	];
=TEX
=SML
store_mt_results mt_run_fail [
	("z_push_consistency_goal 46009",
	z_push_consistency_goal,
	⌜rubbish⌝,
	gen_fail_msg "z_push_consistency_goal" 46009 ["ⓩrubbish⌝"]),
	("z_push_consistency_goal 46005",
	z_push_consistency_goal,
	mk_const("rubbish",BOOL),
	gen_fail_msg "z_push_consistency_goal" 46005 ["rubbish"]),
	("z_push_consistency_goal 46006",
	z_push_consistency_goal,
	⌜$⇒⌝,
	gen_fail_msg "z_push_consistency_goal" 46006 ["⇒"]),
	("z_push_consistency_goal 46007",
	z_push_consistency_goal,
	⌜there⌝,
	gen_fail_msg "z_push_consistency_goal" 46007 ["there"])
	];
=TEX


\section{Z STRIPPING AND PROOF CONTEXTS}
Incomplete tests, but certainly strongly hint at
some Z specific stuff:
=SML
repeat drop_main_goal;
push_pc "z_predicates";
store_mt_results (mt_runf (op =$)) [("z_predicates pc 1",
	tac_res (rewrite_tac[]),
	ⓩ(t = true) ∧ ¬ (¬ t1) ∧ (t2 = t2) ∧ true ∧ (false ⇒ t3) ∧
		(x ∈ (𝕌 × 𝕌)) ∧ (∀ x : X ⦁ true) ∧ ¬(∃ y : X ⦁ false) ∨ false⌝,
	ⓩt ∧ t1⌝)];
store_mt_results (mt_runf (op =#)) [("z_predicates pc 2",
	tac_res1 strip_tac,
	([],ⓩ(¬(¬ t) ∧ (∀ x : 𝕌 ⦁ x = x) ∧ (∃ x : 𝕌 ⦁ f x) ∧ z ∈ ℙ 𝕌 ∧
		(∀ p:P | p ⦁ true)) ⇒ false⌝),
	([ⓩ∀ p : P | p ⦁ false⌝,
	  (snd(strip_∀ ⓩ[b](f ⦂ ℙ(b × {true,false})) x⌝)),
	  ⓩ∀ x:𝕌⦁ x = x⌝, ⌜t:BOOL⌝],ⓩfalse⌝))];
store_mt_results (mt_runf (op =#)) [("z_predicates pc 3",
	tac_res1 (REPEAT strip_tac),
	([],ⓩ∀ y : X ⦁ (¬(¬ t) ∧ (∀ x : 𝕌 ⦁ x = x) ∧ x ∈ 𝕌)⌝),
	([ⓩy ∈ X⌝],⌜t:BOOL⌝))];
store_mt_results (mt_runf (op =#)) [("'z_decl pc 1",
	tac_res1 (REPEAT strip_tac),
	([],ⓩ(∃ x,y : X ⦁ x = y) ⇒ false⌝),
	([ⓩx = y⌝,ⓩy ∈ X⌝,ⓩx ∈ X⌝],ⓩfalse⌝))];
=TEX
Check everything is at least present:
=SML
push_pc "'z_predicates";
set_pc "'z_decl";
set_pc "'z_fc";
set_pc "z_predicates";
pop_pc();
=TEX
\section{BIT O'NONSENSE}
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
┌P[X]─
z:X
├
pz z
└
=SML
push_goal([],ⓩ(∃[[S;S']; I;O] | p x x' y z⦁ true) ⇔
	(∃ S;S'; I;O | p x x' y z⦁ true)⌝);
a(REPEAT strip_tac);
a(z_∃_tac ⓩθ[[S;S']; I;O]⌝);
a(REPEAT strip_tac);
repeat drop_main_goal;
=TEX
\section{END OF TESTS}
=SML
(* set_flag("subgoal_package_quiet",false); *)
diag_string(summarize_mt_results ());
=TEX
Restore the {\tt z\_type\_check\_only} flag.
=SML
set_flag("z_type_check_only", old_flag);
=TEX
\end{document}
=IGN

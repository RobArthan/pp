=IGN
********************************************************************************
mdt051.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% mdt051.doc   ℤ $Date: 2011/05/07 12:50:24 $ $Revision: 1.36 $ $RCSfile: mdt051.doc,v $
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

\def\Title{Module Tests for Proof Contexts}

\def\AbstractText{A set of module tests are given for the proof context functions.}

\def\Reference{DS/FMU/IED/MDT051}

\def\Author{K.Blackburn}


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
%% LaTeX2e port: \TPPtitle{Module Tests for Proof Contexts}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Module Tests for Proof Contexts}
%% LaTeX2e port: \TPPref{DS/FMU/IED/MDT051}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.36 $ %
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2011/05/07 12:50:24 $ %
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{ML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.Blackburn & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & Project Manager}
%% LaTeX2e port: \TPPabstract{A set of module tests are given for the
%% LaTeX2e port: proof context functions.}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	    Library
%% LaTeX2e port: }}
%% LaTeX2e port: \begin{document}
%% LaTeX2e port: \makeTPPfrontpage
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

\subsection{Changes History}
\begin{description}
\item [Issue 1.1 (1991/10/25)]
First draft version.
\item [Issue 1.2 (1991/10/30)]
Reacted to $NetTools$ being open.
\item [Issue 1.3 (1991/11/19)]
Proof context becomes an ADT.
\item [Issue 1.4 (1991/11/20)]
Fixed bug in $thm\_eqn\_cxt$ tests.
\item [Issue 1.5 (1991/11/22)]
Added $cs\_∃\_rule$ material.
\item [Issue 1.6 (1991/12/06)]
Added existence prover parameterisation.

\item[Issue 1.7 (1992/01/20), \FormatDate{92/01/20} ] Updated to use new fonts.
\item [Issue 1.8 (1992/01/21)]
Removed duplicate labels.
\item [Issue 1.9 (1992/03/25)]
Changed to reflect changes in issue 1.12 of \cite{DS/FMU/IED/DTD051}.
\item [Issue 1.10 (1992/03/26),1.11 (1992/03/26) (9th April 1992)]
Changes required by CR0016.
\item [Issue 1.14 (1992/04/14) (14th April 1992)]
Changes required by CR0017.
\item [Issue 1.15 (1992/04/15) (15th April 1992)]
Change to $get\_stack\_pcs$, added $delete_pc\_fields$.
\item [Issue 1.16 (1992/04/22) (22 April 1992)]
Fix test $eqn_cxt_conv$ to make it work.
\item [Issue 1.17 (1992/05/07) (7th May 1992)]
To match issue 1.18 of \cite{DS/FMU/IED/DTD051}.
\item [Issue 1.17 (1992/05/07) (7th May 1992)]
To match issue 1.19 of \cite{DS/FMU/IED/DTD051}.
\item [Issue 1.18 (1992/05/08) (12th May 1992)]
Changed some names.
\item [Issue 1.21 (1992/05/22) (22nd May 1992)]
Bug fixing.
\item [Issue 1.22 (1992/05/26) (26th May 1992)]
Renamings from version 1.5 of DS/FMU/IED/WRK038.
\item [Issue 1.23 (1992/05/28) (28th May 1992)]
Added $prove\_∃\_tac$ and $prove\_tac$
\item [Issue 1.24 (1992/05/29) (29th May 1992)]
And removed them!
\item [Issue 1.25 (1992/06/02) (2nd June 1992)]
Changed ``native'' theory.
\item [Issue 1.26 (1992/06/29) (29th June 1992)]
Added $MERGE\_PCS\_T$, etc.
\item [Issue 1.27 (1992/12/01), 1.28 (1992/12/03) (3rd December 1992)]
Added additional discrimination nets.
\item [Issue 1.29 (1992/12/14) (14th December 1992)]
Added $pending\_reset\_pc\_stack/evaluators$.
\item [Issue 1.30 (1993/02/18) (18th February 1993)]
Added tests of $prune\_at\_theory$.
\item [Issue 1.31 (1993/02/22) (22nd February 1993)]
$force\_delete\_theory$.
\item[Issue 1.32 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.33 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.34 (2005/12/16)] The prefix for private interfaces is now $pp'$ rather than $icl'$.
\item[Issue 1.35 (2011/02/19)] Allowed for introduction of $mmp\_rule$ and for
changes to the handling of $pr\_tac$ and $pr\_conv$.
\item[Issue 1.36 (2011/05/07)] Allowed for introduction of equation matcher.
\item[Issue 1.37 (2011/07/11)] Added tests for {\em simple\_ho\_thm\_eqn\_cxt}.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
%\subsection{Changes Forecast}
\section{GENERAL}
\subsection{Scope}
This document contains the module testing of the proof context functions.
The design is in \cite{DS/FMU/IED/DTD051}
and it is
implemented in \cite{DS/FMU/IED/IMP051}.

\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains the module testing of the material given a design in \cite{DS/FMU/IED/DTD051},
following the test policy given in that document and the general policy given in \cite{DS/FMU/IED/PLN008}.

\subsubsection{Dependencies}
This document is derived from the detailed design in \cite{DS/FMU/IED/DTD051},
and is further influenced by the implementation, in  \cite{DS/FMU/IED/IMP051}.
It requires the presence of theory ``$misc$''.
\subsubsection{Deficiencies}
Do not test for different behaviour between, e.g.,
$prove\-\_tac$ and $asm\-\_prove\-\_tac$.
\section{TEST CASES}
All functions and all their error cases are tested, but
the precise order and method of testing is not uniform,
and in particular does not follow the order in \cite{DS/FMU/IED/DTD051}.
\section{TEST HARNESS MATERIAL}
=SML
use_file "dtd013.sml";
use_file "imp013.sml";
init_mt_results ();
open_theory "basic_hol" handle _ => open_theory "misc";
mapfilter delete_theory (get_descendants "mdt051_thy")
	handle (Fail _) => [];
new_theory "mdt051_thy";
=TEX
=SML
fun list_eq (eq:'a * 'a -> bool) ((a :: x), (b :: y)) : bool = (
	eq(a,b) andalso list_eq eq (x, y)
) | list_eq eq ([], []) = true
| list_eq _ _ = false;
=TEX
=SML
infix 3 =**$;
fun (a,b) =**$ (c,d) = (a =$ c) andalso (b =$ d);
=TEX
\section{TEST DATA}
This section contains data used in the test, that
in themselves are not part of the tests.
However, they may fail if the functions tested are ill-formed.
=SML

val tm_a = mk_var("a",BOOL);
val tm_¬_b = mk_¬(mk_var("b",BOOL));
val tm_cc = mk_∧(mk_var("c",BOOL),mk_var("c",BOOL));
val conv1 = (fn tm => if tm =$ tm_a
		then ⇔_t_intro (asm_rule tm_a)
		else fail_conv tm);
val conv2 = (fn tm => if tm =$ tm_¬_b
		then ⇔_t_intro (asm_rule tm_¬_b)
		else fail_conv tm);
val conv3 = (fn tm => if tm =$ tm_cc
		then ⇔_t_intro (asm_rule tm_cc)
		else fail_conv tm);
val rule1 = (fn tm => if tm =$ mk_t then (refl_conv mk_t) else fail "rule1" 0 []);
val rule2 = (fn tm => if tm =$ mk_¬ mk_f then (⇔_t_intro f_thm) else fail "rule2" 0 []);

=TEX
\section{THE TESTS}
\subsection{Equational Contexts}
=SML
push_pc "initial";
store_mt_results (mt_runf (op =**$))[("thm_eqn_cxt",
	(Combinators.I ** (fn f => snd(dest_thm (f ⌜y⌝))))
		o thm_eqn_cxt,
	all_∀_intro (refl_conv ⌜x⌝),
	(⌜x⌝,⌜y = y⌝))];
store_mt_results mt_run_fail [("thm_eqn_cxt 7095",
	thm_eqn_cxt,
	t_thm,
	gen_fail_msg "thm_eqn_cxt" 7095 ["⊢ T"])];
=TEX
=SML
store_mt_results (mt_runf (op =**$))[("simple_ho_thm_eqn_cxt",
	(Combinators.I ** (fn f => snd(dest_thm (f ⌜(∀i⦁i > 1) ∧ j < k⌝))))
		o simple_ho_thm_eqn_cxt,
	asm_rule ⌜∀P Q⦁ (∀x:ℕ⦁P x) ∧ Q ⇔ (∀x⦁P x ∧ Q)⌝,
	(⌜(∀ x:ℕ⦁ P) ∧ Q⌝, ⌜(∀ i⦁ i > 1) ∧ j < k ⇔ (∀ i⦁ i > 1 ∧ j < k)⌝))];
=TEX
=SML
let
	val x = ⌜x:BOOL⌝;
	val xx = mk_∧(x,x);
	val s1 = asm_rule x;
	val s2 = ∧_intro s1 s1;
	val s3 = ⇒_intro x s2;
	val s4 = asm_rule xx;
	val s5 = ∧_left_elim s4;
	val s6 = ⇒_intro xx s5;
	val s7 = ⇔_intro s6 s3;
	val thm = simple_∀_intro x s7;
in
store_mt_results (mt_runf (op =#))[("eqn_cxt_conv",
	dest_thm o eqn_cxt_conv [thm_eqn_cxt thm],
	⌜y ∧ y⌝,
	([],⌜y ∧ y ⇔ y⌝))]
end;
store_mt_results mt_run_fail [("eqn_cxt_conv 51005",
	eqn_cxt_conv [],
	⌜y⌝,
	gen_fail_msg "eqn_cxt_conv" 51005 ["⌜y⌝"])];
=TEX
\subsection{Proof Contexts}
We wish to start with the initial proof context, so
=SML
repeat pop_pc;
mapfilter (delete_pc o fst) (get_pcs ());
=TEX
We wish to start with the original (flawed) evaluation functions:
=SML
pp'set_eval_ad_rw_net make_net;
pp'set_eval_ad_rw_canon (fn cans => (hd cans
	handle _ => (fn thm => [thm])) );
pp'set_eval_ad_st_conv eqn_cxt_conv;
pp'set_eval_ad_sc_conv eqn_cxt_conv;

let
	fun try_all [] tm = fail "current_ad_cs_∃_conv" 51015 []
	| try_all (afun :: x) tm = (
		afun tm
		handle (Fail _) =>
		try_all x tm
	);
in
pp'set_eval_ad_cs_∃_convs try_all
end;
	
pp'set_eval_ad_∃_cd_thms (fn _ => []);
pp'set_eval_ad_∃_vs_thms  Combinators.I;
pp'set_eval_ad_nd_net (fn _ => make_net);
=TEX
We form new proof contexts:
=SML
delete_pc "mdt051_test1" handle _ => ();
new_pc "mdt051_test1";
set_rw_eqn_cxt [(tm_a,conv1)] "mdt051_test1";
set_rw_canons [(fn thm => [thm,thm])] "mdt051_test1";
set_st_eqn_cxt [(tm_a,conv1)] "mdt051_test1";
set_sc_eqn_cxt [(tm_a,conv1)] "mdt051_test1";
set_cs_∃_convs [rule1] "mdt051_test1";
set_∃_cd_thms [t_thm] "mdt051_test1";
set_∃_vs_thms [("T",([mk_t],t_thm))] "mdt051_test1";
set_pr_tac (FIRST o map accept_tac) "mdt051_test1";
set_pr_conv (FIRST_C o map (fn thm => fn x =>
	if x ~=$ fst(dest_eq(concl thm))
	then thm
	else fail_conv x)) "mdt051_test1";
set_nd_entry "Dict1" [(mk_f, fn _ => f_thm)] "mdt051_test1";
set_nd_entry "Dict1" [(mk_t, fn _ => t_thm)] "mdt051_test1";
set_nd_entry "Dict2" [(mk_f, fn _ => f_thm)] "mdt051_test1";
commit_pc "mdt051_test1";
=TEX
We test elsewhere that the second $set\_nd\_entry$
for $Dict1$ overwrites the first.
=SML
delete_pc "mdt051_test2" handle _ => ();
new_pc "mdt051_test2";
set_rw_eqn_cxt [(tm_¬_b,conv2)] "mdt051_test2";
set_rw_canons [(fn thm => if thm =|- t_thm
		then [] else [thm])] "mdt051_test2";
set_st_eqn_cxt [(tm_¬_b,conv2)] "mdt051_test2";
set_sc_eqn_cxt [(tm_¬_b,conv2)] "mdt051_test2";
set_cs_∃_convs [rule2] "mdt051_test2";
set_∃_cd_thms [f_thm] "mdt051_test2";
set_∃_vs_thms [("F",([mk_f],f_thm))] "mdt051_test2";
set_pr_tac (FIRST o map accept_tac) "mdt051_test2";
set_pr_conv (FIRST_C o map (fn thm => fn x =>
	if x ~=$ fst(dest_eq(concl thm))
	then thm
	else fail_conv x)) "mdt051_test2";
set_nd_entry "Dict2" [(mk_t, fn _ => t_thm)] "mdt051_test2";
set_nd_entry "Dict1" [(mk_f, fn _ => f_thm)] "mdt051_test2";
set_nd_entry "Dict3" [(mk_var("x",BOOL), fn _ => f_thm)] "mdt051_test2";
=TEX
=SML
delete_pc "mdt051_test3" handle _ => ();
new_pc "mdt051_test3";
set_rw_eqn_cxt [(tm_¬_b,conv2)] "mdt051_test3";
set_rw_canons [(fn thm => if thm =|- t_thm
		then [] else [thm])] "mdt051_test3";
set_st_eqn_cxt [(tm_¬_b,conv2)] "mdt051_test3";
set_sc_eqn_cxt [(tm_¬_b,conv2)] "mdt051_test3";
set_cs_∃_convs [rule2] "mdt051_test3";
set_∃_cd_thms [f_thm] "mdt051_test3";
set_∃_vs_thms [("F",([mk_f],f_thm))] "mdt051_test3";
set_pr_tac (FIRST o map accept_tac) "mdt051_test3";
set_pr_conv (FIRST_C o map (fn thm => fn x =>
	if x ~=$ fst(dest_eq(concl thm))
	then thm
	else fail_conv x))  "mdt051_test3";
set_nd_entry "Dict1" [(mk_f, fn _ => f_thm)] "mdt051_test3";
commit_pc "mdt051_test3";

=TEX

\subsubsection{Set and Get User Data Functions}
=SML
open Combinators;
store_mt_results (mt_runf (op =#))[
	("get_rw_eqn_cxt",
	dest_thm o (snd(hd(fst(hd (get_rw_eqn_cxt "mdt051_test1"))))),
	tm_a,
	dest_thm (conv1 tm_a))];
store_mt_results (mt_runf (list_eq(op =#))) [
	("get_rw_canons",
	map dest_thm o (hd(fst(hd (get_rw_canons "mdt051_test1")))),
	t_thm,
	map dest_thm [t_thm,t_thm])];
store_mt_results (mt_runf (op =#))[
	("get_st_eqn_cxt",
	dest_thm o (snd(hd(fst(hd (get_st_eqn_cxt "mdt051_test1"))))),
	tm_a,
	dest_thm (conv1 tm_a))];
store_mt_results (mt_runf (op =#))[
	("get_sc_eqn_cxt",
	dest_thm o (snd(hd(fst(hd (get_sc_eqn_cxt "mdt051_test1"))))),
	tm_a,
	dest_thm (conv1 tm_a))];
store_mt_results (mt_runf (op =$))[
	("get_nd_entry a",
	I ,
	fst(hd(fst(hd (get_nd_entry "Dict2" "mdt051_test1")))),
	mk_f)];
store_mt_results (mt_runf (op =$))[
	("get_nd_entry b",
	I ,
	fst(hd(fst(hd (get_nd_entry "Dict1" "mdt051_test1")))),
	mk_t)];
store_mt_results mt_run [
	("get_nd_entry c",
	is_nil ,
	(get_nd_entry "rubbish" "mdt051_test1"),
	true)];
store_mt_results (mt_runf (op =#))[
	("get_cs_∃_convs",
	dest_thm o hd(fst(hd (get_cs_∃_convs "mdt051_test1"))),
	mk_t,
	dest_thm (refl_conv mk_t))];
store_mt_results (mt_runf (op =#))[
	("get_∃_cd_thms",
	dest_thm,
	hd(get_∃_cd_thms "mdt051_test1"),
	dest_thm t_thm)];
let
fun aux ((a,(b,c)),(d,(e,f))) = (a=d) andalso list_eq (op =$) (b,e)
	andalso (c =|- f);
in
store_mt_results (mt_runf aux)[
	("get_∃_vs_thms",
	hd,
	(get_∃_vs_thms "mdt051_test1"),
	("T",([mk_t],t_thm)))]
end;
store_mt_results (mt_runf (op =|-))[
	("get_pr_conv",
	get_pr_conv "mdt051_test1" [refl_conv mk_t],
	mk_t,
	refl_conv mk_t)];
store_mt_results mt_run [
	("get_pr_tac",
	is_nil o fst,
	get_pr_tac "mdt051_test1" [t_thm] ([],mk_t),
	true)];

=TEX
=SML
store_mt_results mt_run_fail [(
	"get_rw_eqn_cxt 51010",
	get_rw_eqn_cxt,
	"rubbish",
	gen_fail_msg "get_rw_eqn_cxt" 51010 ["rubbish"])];
store_mt_results mt_run_fail [(
	"get_rw_canons 51010",
	get_rw_canons,
	"rubbish",
	gen_fail_msg "get_rw_canons" 51010 ["rubbish"])];
store_mt_results mt_run_fail [(
	"get_st_eqn_cxt 51010",
	get_st_eqn_cxt,
	"rubbish",
	gen_fail_msg "get_st_eqn_cxt" 51010 ["rubbish"])];
store_mt_results mt_run_fail [(
	"get_sc_eqn_cxt 51010",
	get_sc_eqn_cxt,
	"rubbish",
	gen_fail_msg "get_sc_eqn_cxt" 51010 ["rubbish"])];
store_mt_results mt_run_fail [(
	"get_nd_entry 51010",
	get_nd_entry "Dict1",
	"rubbish",
	gen_fail_msg "get_nd_entry" 51010 ["rubbish"])];
store_mt_results mt_run_fail [(
	"get_cs_∃_convs 51010",
	get_cs_∃_convs,
	"rubbish",
	gen_fail_msg "get_cs_∃_convs" 51010 ["rubbish"])];
store_mt_results mt_run_fail [(
	"get_∃_cd_thms 51010",
	get_∃_cd_thms,
	"rubbish",
	gen_fail_msg "get_∃_cd_thms" 51010 ["rubbish"])];
store_mt_results mt_run_fail [(
	"get_∃_vs_thms 51010",
	get_∃_vs_thms,
	"rubbish",
	gen_fail_msg "get_∃_vs_thms" 51010 ["rubbish"])];
store_mt_results mt_run_fail [(
	"get_pr_conv 51010",
	get_pr_conv,
	"rubbish",
	gen_fail_msg "get_pr_conv" 51010 ["rubbish"])];
store_mt_results mt_run_fail [(
	"get_pr_tac 51010",
	get_pr_tac,
	"rubbish",
	gen_fail_msg "get_pr_tac" 51010 ["rubbish"])];
=TEX
=SML
store_mt_results mt_run_fail [(
	"set_rw_eqn_cxt 51010",
	set_rw_eqn_cxt [(tm_a,conv1)],
	"rubbish",
	gen_fail_msg "set_rw_eqn_cxt" 51010 ["rubbish"])];
store_mt_results mt_run_fail [(
	"set_rw_canons 51010",
	set_rw_canons [(fn thm => [thm,thm])],
	"rubbish",
	gen_fail_msg "set_rw_canons" 51010 ["rubbish"])];
store_mt_results mt_run_fail [(
	"set_st_eqn_cxt 51010",
	set_st_eqn_cxt [(tm_a,conv1)],
	"rubbish",
	gen_fail_msg "set_st_eqn_cxt" 51010 ["rubbish"])];
store_mt_results mt_run_fail [(
	"set_sc_eqn_cxt 51010",
	set_sc_eqn_cxt [(tm_a,conv1)],
	"rubbish",
	gen_fail_msg "set_sc_eqn_cxt" 51010 ["rubbish"])];
store_mt_results mt_run_fail [(
	"set_nd_entry 51010",
	set_nd_entry "Dict1" [(tm_a,conv1)],
	"rubbish",
	gen_fail_msg "set_nd_entry" 51010 ["rubbish"])];
store_mt_results mt_run_fail [(
	"set_cs_∃_convs 51010",
	set_cs_∃_convs [rule1],
	"rubbish",
	gen_fail_msg "set_cs_∃_convs" 51010 ["rubbish"])];
store_mt_results mt_run_fail [(
	"set_∃_cd_thms 51010",
	set_∃_cd_thms [t_thm],
	"rubbish",
	gen_fail_msg "set_∃_cd_thms" 51010 ["rubbish"])];
store_mt_results mt_run_fail [(
	"set_∃_vs_thms 51010",
	set_∃_vs_thms [("T",([mk_t],t_thm))],
	"rubbish",
	gen_fail_msg "set_∃_vs_thms" 51010 ["rubbish"])];
store_mt_results mt_run_fail [(
	"set_pr_conv 51010",
	set_pr_conv (fn _ => id_conv),
	"rubbish",
	gen_fail_msg "set_pr_conv" 51010 ["rubbish"])];
store_mt_results mt_run_fail [(
	"set_pr_tac 51010",
	set_pr_tac (fn _ => id_tac),
	"rubbish",
	gen_fail_msg "set_pr_tac" 51010 ["rubbish"])];
=TEX
=SML
store_mt_results mt_run_fail [(
	"set_rw_eqn_cxt 51016",
	set_rw_eqn_cxt [(tm_a,conv1)],
	"mdt051_test1",
	gen_fail_msg "set_rw_eqn_cxt" 51016 ["mdt051_test1"])];
store_mt_results mt_run_fail [(
	"set_rw_canons 51016",
	set_rw_canons [(fn thm => [thm,thm])],
	"mdt051_test1",
	gen_fail_msg "set_rw_canons" 51016 ["mdt051_test1"])];
store_mt_results mt_run_fail [(
	"set_st_eqn_cxt 51016",
	set_st_eqn_cxt [(tm_a,conv1)],
	"mdt051_test1",
	gen_fail_msg "set_st_eqn_cxt" 51016 ["mdt051_test1"])];
store_mt_results mt_run_fail [(
	"set_sc_eqn_cxt 51016",
	set_sc_eqn_cxt [(tm_a,conv1)],
	"mdt051_test1",
	gen_fail_msg "set_sc_eqn_cxt" 51016 ["mdt051_test1"])];
store_mt_results mt_run_fail [(
	"set_nd_entry 51016",
	set_nd_entry "Dict1" [(tm_a,conv1)],
	"mdt051_test1",
	gen_fail_msg "set_nd_entry" 51016 ["mdt051_test1"])];
store_mt_results mt_run_fail [(
	"set_cs_∃_convs 51016",
	set_cs_∃_convs [rule1],
	"mdt051_test1",
	gen_fail_msg "set_cs_∃_convs" 51016 ["mdt051_test1"])];
store_mt_results mt_run_fail [(
	"set_∃_cd_thms 51016",
	set_∃_cd_thms [t_thm],
	"mdt051_test1",
	gen_fail_msg "set_∃_cd_thms" 51016 ["mdt051_test1"])];
store_mt_results mt_run_fail [(
	"set_∃_vs_thms 51016",
	set_∃_vs_thms [("T",([mk_t],t_thm))],
	"mdt051_test1",
	gen_fail_msg "set_∃_vs_thms" 51016 ["mdt051_test1"])];
store_mt_results mt_run_fail [(
	"set_pr_conv 51016",
	set_pr_conv (fn _ => id_conv),
	"mdt051_test1",
	gen_fail_msg "set_pr_conv" 51016 ["mdt051_test1"])];
store_mt_results mt_run_fail [(
	"set_pr_tac 51016",
	set_pr_tac (fn _ => id_tac),
	"mdt051_test1",
	gen_fail_msg "set_pr_tac" 51016 ["mdt051_test1"])];
=TEX
Now test the scoping:
=SML
delete_theory "out_of_scope" handle (Fail _) => ();
new_theory "out_of_scope";
delete_pc "pc out of scope" handle _ => ();
new_pc "pc out of scope";
open_theory "mdt051_thy";
=TEX
=SML
store_mt_results mt_run_fail [(
	"get_rw_eqn_cxt 51014",
	get_rw_eqn_cxt,
	"pc out of scope",
	gen_fail_msg "get_rw_eqn_cxt" 51014 ["pc out of scope","out_of_scope"])];
store_mt_results mt_run_fail [(
	"get_rw_canons 51014",
	get_rw_canons,
	"pc out of scope",
	gen_fail_msg "get_rw_canons" 51014 ["pc out of scope","out_of_scope"])];
store_mt_results mt_run_fail [(
	"get_st_eqn_cxt 51014",
	get_st_eqn_cxt,
	"pc out of scope",
	gen_fail_msg "get_st_eqn_cxt" 51014 ["pc out of scope","out_of_scope"])];
store_mt_results mt_run_fail [(
	"get_sc_eqn_cxt 51014",
	get_sc_eqn_cxt,
	"pc out of scope",
	gen_fail_msg "get_sc_eqn_cxt" 51014 ["pc out of scope","out_of_scope"])];
store_mt_results mt_run_fail [(
	"get_nd_entry 51014",
	get_nd_entry "Dict1",
	"pc out of scope",
	gen_fail_msg "get_nd_entry" 51014 ["pc out of scope","out_of_scope"])];
store_mt_results mt_run_fail [(
	"get_cs_∃_convs 51014",
	get_cs_∃_convs,
	"pc out of scope",
	gen_fail_msg "get_cs_∃_convs" 51014 ["pc out of scope","out_of_scope"])];
store_mt_results mt_run_fail [(
	"get_∃_cd_thms 51014",
	get_∃_cd_thms,
	"pc out of scope",
	gen_fail_msg "get_∃_cd_thms" 51014 ["pc out of scope","out_of_scope"])];
store_mt_results mt_run_fail [(
	"get_∃_vs_thms 51014",
	get_∃_vs_thms,
	"pc out of scope",
	gen_fail_msg "get_∃_vs_thms" 51014 ["pc out of scope","out_of_scope"])];
=TEX
=SML
store_mt_results mt_run_fail [(
	"set_rw_eqn_cxt 51014",
	set_rw_eqn_cxt [(tm_a,conv1)],
	"pc out of scope",
	gen_fail_msg "set_rw_eqn_cxt" 51014 ["pc out of scope","out_of_scope"])];
store_mt_results mt_run_fail [(
	"set_rw_canons 51014",
	set_rw_canons [(fn thm => [thm,thm])],
	"pc out of scope",
	gen_fail_msg "set_rw_canons" 51014 ["pc out of scope","out_of_scope"])];
store_mt_results mt_run_fail [(
	"set_st_eqn_cxt 51014",
	set_st_eqn_cxt [(tm_a,conv1)],
	"pc out of scope",
	gen_fail_msg "set_st_eqn_cxt" 51014 ["pc out of scope","out_of_scope"])];
store_mt_results mt_run_fail [(
	"set_sc_eqn_cxt 51014",
	set_sc_eqn_cxt [(tm_a,conv1)],
	"pc out of scope",
	gen_fail_msg "set_sc_eqn_cxt" 51014 ["pc out of scope","out_of_scope"])];
store_mt_results mt_run_fail [(
	"set_nd_entry 51014",
	set_nd_entry "Dict1" [(tm_a,conv1)],
	"pc out of scope",
	gen_fail_msg "set_nd_entry" 51014 ["pc out of scope","out_of_scope"])];
store_mt_results mt_run_fail [(
	"set_cs_∃_convs 51014",
	set_cs_∃_convs [rule1],
	"pc out of scope",
	gen_fail_msg "set_cs_∃_convs" 51014 ["pc out of scope","out_of_scope"])];
store_mt_results mt_run_fail [(
	"set_∃_cd_thms 51014",
	set_∃_cd_thms [t_thm],
	"pc out of scope",
	gen_fail_msg "set_∃_cd_thms" 51014 ["pc out of scope","out_of_scope"])];
store_mt_results mt_run_fail [(
	"set_∃_vs_thms 51014",
	set_∃_vs_thms [("T",([mk_t],t_thm))],
	"pc out of scope",
	gen_fail_msg "set_∃_vs_thms" 51014 ["pc out of scope","out_of_scope"])];
store_mt_results mt_run_fail [(
	"set_pr_conv 51014",
	set_pr_conv (fn _ => id_conv),
	"pc out of scope",
	gen_fail_msg "set_pr_conv" 51014 ["pc out of scope","out_of_scope"])];
store_mt_results mt_run_fail [(
	"set_pr_tac 51014",
	set_pr_tac (fn _ => id_tac),
	"pc out of scope",
	gen_fail_msg "set_pr_tac" 51014 ["pc out of scope","out_of_scope"])];
=TEX
\subsubsection{Adding Functions}
=SML
add_rw_thms [∧_thm] "mdt051_test2";
add_st_thms [∧_thm] "mdt051_test2";
add_sc_thms [∧_thm] "mdt051_test2";
add_∃_cd_thms [∧_thm] "mdt051_test2";
val cc' = ⌜c ∧ c ⇔ (∀ b⦁ (c ⇒ c ⇒ b) ⇒ b)⌝;
=TEX
=SML
store_mt_results (mt_runf (op =$))[
	("get_rw_eqn_cxt a",
	concl o (snd(hd(fst(hd (get_rw_eqn_cxt "mdt051_test2"))))),
	tm_cc,
	cc')];
store_mt_results (mt_runf (op =$))[
	("get_st_eqn_cxt a",
	concl o (snd(hd(fst(hd (get_st_eqn_cxt "mdt051_test2"))))),
	tm_cc,
	cc')];
store_mt_results (mt_runf (op =$))[
	("get_sc_eqn_cxt a",
	concl o (snd(hd(fst(hd (get_sc_eqn_cxt "mdt051_test2"))))),
	tm_cc,
	cc')];
store_mt_results (mt_runf (op =#))[
	("get_∃_cd_thms a",
	dest_thm,
	hd(get_∃_cd_thms "mdt051_test2"),
	dest_thm ∧_thm)];
=TEX
=SML
store_mt_results mt_run_fail [(
	"add_rw_thms 51010",
	add_rw_thms [],
	"rubbish1",
	gen_fail_msg "add_rw_thms" 51010 ["rubbish1"]),
	("add_rw_thms 51014",
	add_rw_thms [],
	"pc out of scope",
	gen_fail_msg "add_rw_thms" 51014 ["pc out of scope","out_of_scope"])];
store_mt_results mt_run_fail [(
	"add_st_thms 51010",
	add_st_thms [],
	"rubbish1",
	gen_fail_msg "add_st_thms" 51010 ["rubbish1"]),
	("add_st_thms 51014",
	add_st_thms [],
	"pc out of scope",
	gen_fail_msg "add_st_thms" 51014 ["pc out of scope","out_of_scope"])];
store_mt_results mt_run_fail [(
	"add_sc_thms 51010",
	add_sc_thms [],
	"rubbish1",
	gen_fail_msg "add_sc_thms" 51010 ["rubbish1"]),
	("add_sc_thms 51014",
	add_sc_thms [],
	"pc out of scope",
	gen_fail_msg "add_sc_thms" 51014 ["pc out of scope","out_of_scope"])];
store_mt_results mt_run_fail [(
	"add_∃_cd_thms 51010",
	add_∃_cd_thms [],
	"rubbish1",
	gen_fail_msg "add_∃_cd_thms" 51010 ["rubbish1"]),
	("add_∃_cd_thms 51014",
	add_∃_cd_thms [],
	"pc out of scope",
	gen_fail_msg "add_∃_cd_thms" 51014 ["pc out of scope","out_of_scope"])];
=TEX
\subsubsection{Current Values}
``mdt051$\_$test1'' has been evaluated by commital, so:
=SML
push_pc "mdt051_test1";
let
val rw_net1 = current_ad_rw_net ();
in
store_mt_results (mt_runf (op =#))[(
	"current_ad_rw_net",
	dest_thm o (hd(net_lookup rw_net1 tm_a)),
	tm_a,
	dest_thm (conv1 tm_a))]
end;
store_mt_results mt_run [(
	"current_ad_rw_canon",
	length,
	(current_ad_rw_canon () t_thm),
	2)];
store_mt_results (mt_runf (op =#))[(
	"current_ad_st_conv",
	dest_thm o current_ad_st_conv (),
	tm_a,
	dest_thm (conv1 tm_a))];
store_mt_results (mt_runf (op =#))[(
	"current_ad_sc_conv",
	dest_thm o current_ad_sc_conv (),
	tm_a,
	dest_thm (conv1 tm_a))];
store_mt_results (mt_runf (op =#))[(
	"current_ad_cs_∃_conv",
	dest_thm o current_ad_cs_∃_conv (),
	mk_t,
	dest_thm (refl_conv mk_t))];
store_mt_results mt_run [
	("current_ad_∃_cd_thms",
	length,
	current_ad_∃_cd_thms (),
	0)];
store_mt_results mt_run [
	("current_ad_∃_vs_thms",
	length,
	current_ad_∃_vs_thms (),
	1)];
store_mt_results (mt_runf (op =#)) [
	("current_ad_pr_conv",
	dest_thm,
	force_value(current_ad_pr_conv ()) [refl_conv mk_t] mk_t,
	dest_thm (refl_conv mk_t))];
store_mt_results mt_run [
	("current_ad_pr_tac",
	is_nil o fst,
	force_value(current_ad_pr_tac ()) [t_thm] ([],mk_t),
	true)];
=TEX
\subsubsection{Merging Proof Contexts}
Notice the crude tests of duplicate removal.
=SML
delete_pc "merge1 & 3" handle _ => ();
new_pc "merge1 & 3";
merge_pcs ["mdt051_test1","mdt051_test1","mdt051_test3"] "merge1 & 3";
store_mt_results mt_run [("merge_pcs 1",
	length,
	get_rw_eqn_cxt "merge1 & 3",
	2)];
store_mt_results mt_run [("merge_pcs 2",
	length,
	get_rw_canons "merge1 & 3",
	2)];
store_mt_results mt_run [("merge_pcs 3",
	length,
	get_st_eqn_cxt "merge1 & 3",
	2)];
store_mt_results mt_run [("merge_pcs 4",
	length,
	get_sc_eqn_cxt "merge1 & 3",
	2)];
store_mt_results mt_run [("merge_pcs 4a",
	length,
	get_nd_entry "Dict1" "merge1 & 3",
	2)];
store_mt_results mt_run [("merge_pcs 5",
	length,
	get_cs_∃_convs "merge1 & 3",
	2)];
store_mt_results mt_run [("merge_pcs 6",
	length,
	get_∃_cd_thms "merge1 & 3",
	2)];
store_mt_results mt_run [("merge_pcs 7",
	length,
	get_∃_vs_thms "merge1 & 3",
	2)];
store_mt_results (mt_runf (op =|-))[
	("merge_pcs 8",
	get_pr_conv "merge1 & 3" [refl_conv mk_t],
	mk_t,
	refl_conv mk_t)];
store_mt_results mt_run [
	("merge_pcs 9",
	is_nil o fst,
	get_pr_tac "merge1 & 3" [t_thm] ([],mk_t),
	true)];

=TEX
Now test the deletion of fields:
=SML
delete_pc_fields ["rw_eqn_cxt","rw_canons","st_eqn_cxt","sc_eqn_cxt","nd_entries"] "merge1 & 3";
=TEX
=SML
store_mt_results mt_run [("delete_pc_fields 1",
	length,
	get_rw_eqn_cxt "merge1 & 3",
	0)];
store_mt_results mt_run [("delete_pc_fields 2",
	length,
	get_rw_canons "merge1 & 3",
	0)];
store_mt_results mt_run [("delete_pc_fields 3",
	length,
	get_st_eqn_cxt "merge1 & 3",
	0)];
store_mt_results mt_run [("delete_pc_fields 4",
	length,
	get_sc_eqn_cxt "merge1 & 3",
	0)];
store_mt_results mt_run [("delete_pc_fields 4a",
	length,
	get_nd_entry "Dict1" "merge1 & 3",
	0)];
store_mt_results mt_run [("delete_pc_fields 5",
	length,
	get_cs_∃_convs "merge1 & 3",
	2)];
store_mt_results mt_run [("delete_pc_fields 6",
	length,
	get_∃_cd_thms "merge1 & 3",
	2)];
store_mt_results mt_run [("delete_pc_fields 7",
	length,
	get_∃_vs_thms "merge1 & 3",
	2)];
store_mt_results (mt_runf (op =|-))[
	("delete_pc_fields 8",
	get_pr_conv "merge1 & 3" [refl_conv mk_t],
	mk_t,
	refl_conv mk_t)];
store_mt_results mt_run [
	("delete_pc_fields 9",
	is_nil o fst,
	get_pr_tac "merge1 & 3" [t_thm] ([],mk_t),
	true)];
=TEX
=SML
delete_pc_fields ["cs_∃_convs","∃_cd_thms","∃_vs_thms","pr_conv","pr_tac"] "merge1 & 3";
=TEX
=SML
store_mt_results mt_run [("delete_pc_fields a1",
	length,
	get_rw_eqn_cxt "merge1 & 3",
	0)];
store_mt_results mt_run [("delete_pc_fields a2",
	length,
	get_rw_canons "merge1 & 3",
	0)];
store_mt_results mt_run [("delete_pc_fields a3",
	length,
	get_st_eqn_cxt "merge1 & 3",
	0)];
store_mt_results mt_run [("delete_pc_fields a4",
	length,
	get_sc_eqn_cxt "merge1 & 3",
	0)];
store_mt_results mt_run [("delete_pc_fields a4a",
	length,
	get_nd_entry "Dict1" "merge1 & 3",
	0)];
store_mt_results mt_run [("delete_pc_fields a5",
	length,
	get_cs_∃_convs "merge1 & 3",
	0)];
store_mt_results mt_run [("delete_pc_fields a6",
	length,
	get_∃_cd_thms "merge1 & 3",
	0)];
store_mt_results mt_run [("delete_pc_fields a7",
	length,
	get_∃_vs_thms "merge1 & 3",
	0)];
store_mt_results mt_run_fail [
	("delete_pc_fields a8",
	get_pr_conv "merge1 & 3" [refl_conv mk_t],
	mk_t,
	gen_fail_msg "fail_conv" 7061 [])];
store_mt_results mt_run_fail [
	("delete_pc_fields a9",
	get_pr_tac "merge1 & 3" [t_thm],
	([],mk_t),
	gen_fail_msg "fail_tac" 9201 [] )];

=TEX
Now delete this empties proof context:
=SML
delete_pc "merge1 & 3";
=TEX
=SML
new_pc "merge1 & 3";
merge_pc_fields [{context = "mdt051_test1",
	fields = ["rw_eqn_cxt","rw_canons","st_eqn_cxt","nd_entries"]},
	{context = "mdt051_test1",
	fields = ["rw_eqn_cxt","rw_canons","st_eqn_cxt","nd_entries"]},
	{context = "mdt051_test3",
	fields = ["sc_eqn_cxt","cs_∃_convs","∃_cd_thms","∃_vs_thms"]}]
	"merge1 & 3";
store_mt_results mt_run [("merge_pcs_fields 1a",
	length,
	get_rw_eqn_cxt "merge1 & 3",
	1)];
store_mt_results mt_run [("merge_pcs_fields 2a",
	length,
	get_rw_canons "merge1 & 3",
	1)];
store_mt_results mt_run [("merge_pcs_fields 3a",
	length,
	get_st_eqn_cxt "merge1 & 3",
	1)];
store_mt_results mt_run [("merge_pcs_fields 4a",
	length,
	get_sc_eqn_cxt "merge1 & 3",
	1)];
store_mt_results mt_run [("merge_pcs_fields a4a",
	length,
	get_nd_entry "Dict1" "merge1 & 3",
	1)];
store_mt_results mt_run [("merge_pcs_fields 5a",
	length,
	get_cs_∃_convs "merge1 & 3",
	1)];
store_mt_results mt_run [("merge_pcs_fields 6a",
	length,
	get_∃_cd_thms "merge1 & 3",
	1)];
store_mt_results mt_run [("merge_pcs_fields 7a",
	length,
	get_∃_vs_thms "merge1 & 3",
	1)];
store_mt_results mt_run_fail [
	("merge_pc_fields a8",
	get_pr_conv "merge1 & 3" [refl_conv mk_t],
	mk_t,
	gen_fail_msg "fail_conv" 7061 [])];
store_mt_results mt_run_fail [
	("merge_pc_fields a9",
	get_pr_tac "merge1 & 3" [t_thm],
	([],mk_t),
	gen_fail_msg "fail_tac" 9201 [] )];


delete_pc "merge1 & 3";
new_pc "merge1 & 3";
store_mt_results mt_run_fail [
	("merge_pcs 51010 a",
	merge_pcs ["rubbish1"],
	"mdt051_test2",
	gen_fail_msg "merge_pcs" 51010 ["rubbish1"]),
	("merge_pcs 51010 b",
	merge_pcs ["mdt051_test1"],
	"rubbish1",
	gen_fail_msg "merge_pcs" 51010 ["rubbish1"]),
	("merge_pcs 51014 a",
	merge_pcs ["pc out of scope"],
	"mdt051_test2",
	gen_fail_msg "merge_pcs" 51014 ["pc out of scope","out_of_scope"]),
	("merge_pcs 51014 b",
	merge_pcs ["mdt051_test1"],
	"pc out of scope",
	gen_fail_msg "merge_pcs" 51014 ["pc out of scope","out_of_scope"]),
	("merge_pcs 51016",
	merge_pcs ["mdt051_test1"],
	"mdt051_test1",
	gen_fail_msg "merge_pcs" 51016 ["mdt051_test1"]),
	("merge_pcs 51017",
	merge_pcs ["mdt051_test2"],
	"mdt051_test2",
	gen_fail_msg "merge_pcs" 51017 ["mdt051_test2"])
	];
=TEX
=SML
store_mt_results mt_run_fail [
	("merge_pc_fields 51010 a",
	merge_pc_fields [{context = "rubbish1",fields = ["rw_eqn_cxt"]}],
	"mdt051_test2",
	gen_fail_msg "merge_pc_fields" 51010 ["rubbish1"]),
	("merge_pc_fields 51010 b",
	merge_pc_fields [{context = "mdt051_test1",fields = ["rw_eqn_cxt"]}],
	"rubbish1",
	gen_fail_msg "merge_pc_fields" 51010 ["rubbish1"]),
	("merge_pc_fields 51014 a",
	merge_pc_fields [{context = "pc out of scope",fields = ["rw_eqn_cxt"]}],
	"mdt051_test2",
	gen_fail_msg "merge_pc_fields" 51014 ["pc out of scope","out_of_scope"]),
	("merge_pc_fields 51014 b",
	merge_pc_fields [{context = "mdt051_test1",fields = ["rw_eqn_cxt"]}],
	"pc out of scope",
	gen_fail_msg "merge_pc_fields" 51014 ["pc out of scope","out_of_scope"]),
	("merge_pc_fields 51016",
	merge_pc_fields [{context = "mdt051_test1",fields = ["rw_eqn_cxt"]}],
	"mdt051_test1",
	gen_fail_msg "merge_pc_fields" 51016 ["mdt051_test1"]),
	("merge_pc_fields 51017",
	merge_pc_fields [{context = "mdt051_test2",fields = ["rw_eqn_cxt"]}],
	"mdt051_test2",
	gen_fail_msg "merge_pc_fields" 51017 ["mdt051_test2"]),
	("merge_pc_fields 51019",
	merge_pc_fields [{context = "mdt051_test1",fields = ["rubbish"]}],
	"mdt051_test2",
	gen_fail_msg "merge_pc_fields" 51019 ["rubbish"])
	];
=TEX
=SML
store_mt_results mt_run_fail [
	("delete_pc_fields 51010",
	delete_pc_fields ["rw_eqn_cxt"],
	"rubbish1",
	gen_fail_msg "delete_pc_fields" 51010 ["rubbish1"]),
	("delete_pc_fields 51014",
	delete_pc_fields ["rw_eqn_cxt"],
	"pc out of scope",
	gen_fail_msg "delete_pc_fields" 51014 ["pc out of scope","out_of_scope"]),
	("delete_pc_fields 51016",
	delete_pc_fields ["rw_eqn_cxt"],
	"mdt051_test1",
	gen_fail_msg "delete_pc_fields" 51016 ["mdt051_test1"]),
	("delete_pc_fields 51019",
	delete_pc_fields ["rubbish"],
	"mdt051_test2",
	gen_fail_msg "delete_pc_fields" 51019 ["rubbish"])
	];
=TEX
\subsubsection{Proof Context Stack Errors}
=SML
store_mt_results mt_run_fail [
	("new_pc 51011",
	new_pc,
	"mdt051_test1",
	gen_fail_msg "new_pc" 51011 ["mdt051_test1"])];
=TEX
=SML
store_mt_results mt_run_fail [(
	"push_pc 51010",
	push_pc,
	"rubbish1",
	gen_fail_msg "push_pc" 51010 ["rubbish1"]),
	("push_pc 51014",
	push_pc,
	"pc out of scope",
	gen_fail_msg "push_pc" 51014 ["pc out of scope","out_of_scope"])];
=TEX
=SML
store_mt_results mt_run_fail [(
	"set_pc 51010",
	set_pc,
	"rubbish1",
	gen_fail_msg "set_pc" 51010 ["rubbish1"]),
	("set_pc 51014",
	set_pc,
	"pc out of scope",
	gen_fail_msg "set_pc" 51014 ["pc out of scope","out_of_scope"])];
=TEX
=SML
store_mt_results mt_run_fail [(
	"push_merge_pcs 51010",
	push_merge_pcs,
	["rubbish1"],
	gen_fail_msg "push_merge_pcs" 51010 ["rubbish1"]),
	("push_merge_pcs 51014",
	push_merge_pcs,
	["pc out of scope"],
	gen_fail_msg "push_merge_pcs" 51014 ["pc out of scope","out_of_scope"]),
	("push_merge_pcs 51020",
	push_merge_pcs,
	[],
	gen_fail_msg "push_merge_pcs" 51020 [])];
=TEX
Pending pushes:
=SML
store_mt_results mt_run_fail [(
	"pending_push_merge_pcs 51010",
	pending_push_merge_pcs,
	["rubbish1"],
	gen_fail_msg "pending_push_merge_pcs" 51010 ["rubbish1"]),
	("pending_push_merge_pcs 51020",
	pending_push_merge_pcs,
	[],
	gen_fail_msg "pending_push_merge_pcs" 51020 [])];
store_mt_results mt_run_fail [
	("pending_push_merge_pcs 51014",
	pending_push_merge_pcs,
	 ["pc out of scope"],
	gen_fail_msg "pending_push_merge_pcs" 51014 ["pc out of scope","out_of_scope"])];
=TEX
(ought really test scope testing on application to ())
=SML
store_mt_results mt_run_fail [(
	"pending_push_pc 51010",
	pending_push_pc,
	"rubbish1",
	gen_fail_msg "pending_push_pc" 51010 ["rubbish1"])];
store_mt_results mt_run_fail [
	("pending_push_pc 51014",
	pending_push_pc,
	 "pc out of scope",
	gen_fail_msg "pending_push_pc" 51014 ["pc out of scope","out_of_scope"])];
=TEX
(ought really test scope testing on application to ())
=SML
store_mt_results mt_run_fail [(
	"set_merge_pcs 51010",
	set_merge_pcs,
	["rubbish1"],
	gen_fail_msg "set_merge_pcs" 51010 ["rubbish1"]),
	("set_merge_pcs 51014",
	set_merge_pcs,
	["pc out of scope"],
	gen_fail_msg "set_merge_pcs" 51014 ["pc out of scope","out_of_scope"]),
	("set_merge_pcs 51020",
	set_merge_pcs,
	[],
	gen_fail_msg "set_merge_pcs" 51020 [])];
=TEX
\subsubsection{Showing the Status}
=SML
delete_theory "mdt051_thy2" handle _ => ();
new_theory "mdt051_thy2";
new_const("delete_me",BOOL);
delete_pc "rubbish2" handle _ => ();
new_pc "rubbish2";
set_pc "rubbish2";
store_mt_results mt_run [("get_current_pc 1",
	get_current_pc,
	(),
	(["rubbish2"],"mdt051_thy2"))];
push_merge_pcs ["mdt051_test1","mdt051_test2"];
set_merge_pcs ["mdt051_test1","mdt051_test2"];
store_mt_results mt_run [("get_current_pc 2",
	get_current_pc,
	(),
	(["mdt051_test1","mdt051_test2"],"mdt051_thy2"))];
val was = set_flag("ignore_warnings",true);
delete_const (mk_const("delete_me",BOOL));
val was = set_flag("ignore_warnings",was);
open_theory "mdt051_thy";
store_mt_results mt_run [("get_current_pc 3",
	get_current_pc,
	(),
	(["mdt051_test1","mdt051_test2"],"mdt051_thy2 (out of scope, deleted, or modified)"))];
"get_current_pc 3";
get_current_pc ();
=TEX
Now test access of current values:
=SML
store_mt_results mt_run_fail [
	("current_ad_rw_net 51021",
	current_ad_rw_net,
	(),
	gen_fail_msg "current_ad_rw_net" 51021 ["mdt051_thy2"])];
store_mt_results mt_run_fail [
	("current_ad_rw_canon 51021",
	current_ad_rw_canon,
	(),
	gen_fail_msg "current_ad_rw_canon" 51021 ["mdt051_thy2"])];
store_mt_results mt_run_fail [
	("current_ad_st_conv 51021",
	current_ad_st_conv,
	(),
	gen_fail_msg "current_ad_st_conv" 51021 ["mdt051_thy2"])];
store_mt_results mt_run_fail [
	("current_ad_nd_net 51021",
	current_ad_nd_net,
	"hello",
	gen_fail_msg "current_ad_nd_net" 51021 ["mdt051_thy2"])];
store_mt_results mt_run_fail [
	("current_ad_sc_conv 51021",
	current_ad_sc_conv,
	(),
	gen_fail_msg "current_ad_sc_conv" 51021 ["mdt051_thy2"])];
store_mt_results mt_run_fail [
	("current_ad_cs_∃_conv 51021",
	current_ad_cs_∃_conv,
	(),
	gen_fail_msg "current_ad_cs_∃_conv" 51021 ["mdt051_thy2"])];
store_mt_results mt_run_fail [
	("current_ad_∃_cd_thms 51021",
	current_ad_∃_cd_thms,
	(),
	gen_fail_msg "current_ad_∃_cd_thms" 51021 ["mdt051_thy2"])];
store_mt_results mt_run_fail [
	("current_ad_∃_vs_thms 51021",
	current_ad_∃_vs_thms,
	(),
	gen_fail_msg "current_ad_∃_vs_thms" 51021 ["mdt051_thy2"])];
store_mt_results mt_run_fail [
	("current_ad_pr_tac 51021",
	current_ad_pr_tac,
	(),
	gen_fail_msg "current_ad_pr_tac" 51021 ["mdt051_thy2"])];
store_mt_results mt_run_fail [
	("current_ad_pr_conv 51021",
	current_ad_pr_conv,
	(),
	gen_fail_msg "current_ad_pr_conv" 51021 ["mdt051_thy2"])];
store_mt_results mt_run_fail [
	("current_ad_mmp_rule 51021",
	current_ad_mmp_rule,
	(),
	gen_fail_msg "current_ad_mmp_rule" 51021 ["mdt051_thy2"])];
store_mt_results mt_run_fail [
	("current_ad_rw_eqm_rule 51021",
	current_ad_rw_eqm_rule,
	(),
	gen_fail_msg "current_ad_rw_eqm_rule" 51021 ["mdt051_thy2"])];
store_mt_results mt_run_fail [
	("asm_prove_tac 51021",
	asm_prove_tac,
	[],
	gen_fail_msg "asm_prove_tac" 51021 ["mdt051_thy2"])];
store_mt_results mt_run_fail [
	("prove_conv 51021",
	prove_conv,
	[],
	gen_fail_msg "prove_conv" 51021 ["mdt051_thy2"])];
store_mt_results mt_run_fail [
	("prove_rule 51021",
	prove_rule,
	[],
	gen_fail_msg "prove_rule" 51021 ["mdt051_thy2"])];
store_mt_results mt_run_fail [
	("asm_prove_∃_tac 51021",
	asm_prove_∃_tac,
	([],mk_t),
	gen_fail_msg "asm_prove_∃_tac" 51021 ["mdt051_thy2"])];
store_mt_results mt_run_fail [
	("prove_∃_conv 51021",
	prove_∃_conv,
	mk_t,
	gen_fail_msg "prove_∃_conv" 51021 ["mdt051_thy2"])];
store_mt_results mt_run_fail [
	("prove_∃_rule 51021",
	prove_∃_rule,
	mk_t,
	gen_fail_msg "prove_∃_rule" 51021 ["mdt051_thy2"])];
=TEX
=SML
push_pc "initial";
val ppc = pending_push_pc "mdt051_test1";
store_mt_results mt_run [("pending_push_pc 1",
	get_current_pc,
	(),
	(["initial"], "min"))];
ppc();
store_mt_results mt_run [("pending_push_pc 2",
	get_current_pc,
	(),
	(["mdt051_test1"], "mdt051_thy"))];
pop_pc();
pop_pc();
=TEX
Test pending pushing of proof contexts:
=SML
push_pc "initial";
val ppc = pending_push_merge_pcs ["mdt051_test1"];
store_mt_results mt_run [("pending_push_merge_pcs 1",
	get_current_pc,
	(),
	(["initial"], "min"))];
ppc();
store_mt_results mt_run [("pending_push_merge_pcs 2",
	get_current_pc,
	(),
	(["mdt051_test1"], "mdt051_thy"))];
pop_pc();
pop_pc();
=TEX
Test pending pushing of merged proof contexts:
=SML
store_mt_results mt_run [("get_pcs",
	get_pcs,
	(),
	[("rubbish2", "mdt051_thy2 (out of scope, deleted, or modified)"),
	("merge1 & 3", "mdt051_thy"),
	("pc out of scope", "out_of_scope (out of scope, deleted, or modified)"),
	("mdt051_test3", "mdt051_thy"), ("mdt051_test2", "mdt051_thy"),
	("mdt051_test1", "mdt051_thy"), ("initial", "min")])];
"get_pcs";
get_pcs ();
=TEX
Test pending setting of proof context database:
=SML
val npcs = length(get_pcs());
val ppcdb = pending_reset_pc_database ();
delete_pc "temporary" handle _ => ();
new_pc "temporary";
store_mt_results mt_run [("pending_reset_pc_database 1",
	length o get_pcs,
	(),
	npcs + 1)];
ppcdb ();
store_mt_results mt_run [("pending_reset_pc_database 2",
	length o get_pcs,
	(),
	npcs)];
=TEX
Test pending setting of proof context stack:
=SML
val npcs = length(get_stack_pcs());
delete_pc "testit" handle _ => ();
new_pc "testit";
push_pc "testit";
delete_pc "temporary" handle _ => ();
new_pc "temporary";
val ppcskt = pending_reset_pc_stack ();
push_pc "temporary";
store_mt_results mt_run [("pending_reset_pc_stack 1a",
	hd o fst o get_current_pc,
	(),
	"temporary")];
store_mt_results mt_run [("pending_reset_pc_stack 1b",
	length o get_stack_pcs,
	(),
	npcs+2)];
ppcskt();
store_mt_results mt_run [("pending_reset_pc_stack 2a",
	hd o fst o get_current_pc,
	(),
	"testit")];
store_mt_results mt_run [("pending_reset_pc_stack 2b",
	length o get_stack_pcs,
	(),
	npcs+1)];
pop_pc();
delete_pc "temporary";
delete_pc "testit";
=TEX
=SML
store_mt_results mt_run [("get_stack_pcs",
	get_stack_pcs,
	(),
	[(["mdt051_test1", "mdt051_test2"],
      "mdt051_thy2 (out of scope, deleted, or modified)"),
   (["rubbish2"], "mdt051_thy2 (out of scope, deleted, or modified)"),
   (["initial"], "min")])];
"get_stack_pcs";
get_stack_pcs();
=TEX
=SML
repeat pop_pc;
store_mt_results mt_run_fail [
	("pop_pc 51001",
	pop_pc,
	(),
	gen_fail_msg "pop_pc" 51001 [])];

push_pc "mdt051_test1";
=TEX
\subsubsection{Commiting Proof Contexts - Failures}
=SML
store_mt_results mt_run_fail [("commit_pc 51010",
	commit_pc,
	"rubbish1",
	gen_fail_msg "commit_pc" 51010 ["rubbish1"]),
	("commit_pc 51016",
	commit_pc,
	"mdt051_test1",
	gen_fail_msg "commit_pc" 51016 ["mdt051_test1"])];
open_theory "basic_hol" handle _ => open_theory "misc";
store_mt_results mt_run_fail [("commit_pc 51014",
	commit_pc,
	"mdt051_test2",
	gen_fail_msg "commit_pc" 51014 ["mdt051_test2","mdt051_thy"])];
open_theory "mdt051_thy";
=TEX
\subsubsection{Deleting Proof Contexts}
=SML
store_mt_results mt_run_fail [(
	"delete_pc",
	add_∃_cd_thms [],
	"rubbish",
	gen_fail_msg "add_∃_cd_thms" 51010 ["rubbish"])];
=TEX
=SML
store_mt_results mt_run_fail [(
	"delete_pc 51010",
	delete_pc,
	"rubbish",
	gen_fail_msg "delete_pc" 51010 ["rubbish"]),
	("delete_pc 51012",
	delete_pc,
	"initial",
	gen_fail_msg "delete_pc" 51012 [])];
=TEX

\subsubsection{Using Proof Contexts}
=SML
push_pc "mdt051_test1";
store_mt_results (mt_runf (op =|-)) [(
	"asm_prove_tac",
	tac_proof,
	(([],⌜¬ F⌝),asm_prove_tac [f_thm]),
	f_thm)];
store_mt_results (mt_runf (op =|-)) [(
	"prove_conv",
	prove_conv [refl_conv mk_t],
	⌜T⌝,
	refl_conv mk_t)];
store_mt_results (mt_runf (op =|-)) [(
	"prove_rule",
	prove_rule [refl_conv mk_t],
	mk_t,
	t_thm)];
store_mt_results (mt_runf (op =|-)) [(
	"asm_prove_∃_tac",
	tac_proof,
	(([],mk_t),asm_prove_∃_tac),
	t_thm)];
store_mt_results (mt_runf (op =|-)) [(
	"prove_∃_conv",
	prove_∃_conv,
	⌜T⌝,
	refl_conv mk_t)];
store_mt_results (mt_runf (op =|-)) [(
	"prove_∃_rule",
	prove_∃_rule,
	mk_t,
	t_thm)];

=TEX
=SML
store_mt_results mt_run_fail [(
	"prove_rule 51022",
	prove_rule [refl_conv mk_f],
	⌜F⌝,
	gen_fail_msg "prove_rule" 51022 ["⌜F⌝","⊢ F ⇔ F"])];
=TEX
=SML
new_pc "temp";
set_cs_∃_convs [conv1] "temp";
push_pc "temp";
store_mt_results mt_run_fail [(
	"prove_∃_rule 51022",
	prove_∃_rule,
	⌜a:BOOL⌝,
	gen_fail_msg "prove_∃_rule" 51022 ["⌜a⌝","a ⊢ a ⇔ T"])];
pop_pc();
=TEX
=SML
store_mt_results (mt_runf (op =|-)) [(
	"PC_T",
	tac_proof,
	(([],⌜¬ F⌝),PC_T "mdt051_test3" asm_prove_∃_tac),
	f_thm)];
store_mt_results (mt_runf (op =|-)) [(
	"PC_C",
	PC_C "mdt051_test3" prove_∃_conv,
	⌜¬ F⌝,
	⇔_t_intro f_thm)];
store_mt_results (mt_runf (op =|-)) [(
	"pc_rule",
	pc_rule "mdt051_test3" prove_∃_rule,
	⌜¬ F⌝,
	f_thm)];
=TEX
=SML
store_mt_results (mt_runf (op =|-)) [(
	"MERGE_PCS_T",
	tac_proof,
	(([],⌜¬ F⌝),MERGE_PCS_T ["mdt051_test3"] asm_prove_∃_tac),
	f_thm)];
store_mt_results (mt_runf (op =|-)) [(
	"MERGE_PCS_C",
	MERGE_PCS_C ["mdt051_test3"] prove_∃_conv,
	⌜¬ F⌝,
	⇔_t_intro f_thm)];
store_mt_results (mt_runf (op =|-)) [(
	"merge_pcs_rule",
	merge_pcs_rule ["mdt051_test3"] prove_∃_rule,
	⌜¬ F⌝,
	f_thm)];
=TEX
Test error handling:
=SML
val nonstack = length (get_stack_pcs());
set_flag("use_file_non_stop_mode",true);
(map diag_line [
"****************************************",
"* Lots of error messages should follow *",
"****************************************"];
());
PC_T "mdt051_test3" fail_tac ([],mk_t);
PC_C "mdt051_test3" fail_conv mk_t;
pc_rule "mdt051_test3" (fn _ => fail "" 0 []) mk_t;
PC_T1 "mdt051_test3" (fn _ => fail_tac) [] ([],mk_t);
PC_C1 "mdt051_test3" (fn _ => fail_conv) [] mk_t;
pc_rule1 "mdt051_test3" (fn _ => fn _ => fail "" 0 []) [] mk_t;
MERGE_PCS_T ["mdt051_test3"] fail_tac ([],mk_t);
MERGE_PCS_C ["mdt051_test3"] fail_conv mk_t;
merge_pcs_rule ["mdt051_test3"] (fn _ => fail "" 0 []) mk_t;
MERGE_PCS_T1 ["mdt051_test3"] (fn _ => fail_tac) [] ([],mk_t);
MERGE_PCS_C1 ["mdt051_test3"] (fn _ => fail_conv) [] mk_t;
merge_pcs_rule1 ["mdt051_test3"] (fn _ => fn _ => fail "" 0 []) [] mk_t;
(map diag_line [
"*********************************************",
"* Lots of error messages should have ceased *",
"*********************************************"];
());
set_flag("use_file_non_stop_mode",false);
store_mt_results mt_run [("PC_T et al failure",
	length,
	get_stack_pcs(),
	nonstack)];
=TEX
Example failure handling:
=SML
store_mt_results mt_run_fail [("MERGE_PCS_T 51020",
	MERGE_PCS_T [] id_tac,
	([],mk_t),
	gen_fail_msg "MERGE_PCS_T" 51020 [])];
store_mt_results mt_run_fail [("MERGE_PCS_T1 51020",
	MERGE_PCS_T1 [] (fn x => id_tac) (),
	([],mk_t),
	gen_fail_msg "MERGE_PCS_T1" 51020 [])];
store_mt_results mt_run_fail [("MERGE_PCS_C 51020",
	MERGE_PCS_C [] id_conv,
	mk_t,
	gen_fail_msg "MERGE_PCS_C" 51020 [])];
store_mt_results mt_run_fail [("MERGE_PCS_C1 51020",
	MERGE_PCS_C1 [] (fn x => id_conv) (),
	mk_t,
	gen_fail_msg "MERGE_PCS_C1" 51020 [])];
store_mt_results mt_run_fail [("merge_pcs_rule 51020",
	merge_pcs_rule [] id_conv,
	mk_t,
	gen_fail_msg "merge_pcs_rule" 51020 [])];
store_mt_results mt_run_fail [("merge_pcs_rule1 51020",
	merge_pcs_rule1 [] (fn x => id_conv) (),
	mk_t,
	gen_fail_msg "merge_pcs_rule1" 51020 [])];
=TEX
=SML
push_pc "initial";
store_mt_results (mt_runf (op =|-)) [(
	"PC_T1",
	tac_proof,
	(([],⌜¬ F⌝),PC_T1 "mdt051_test1" asm_prove_tac [f_thm]),
	f_thm)];
store_mt_results (mt_runf (op =|-)) [(
	"PC_C1",
	PC_C1  "mdt051_test1" prove_conv
		[refl_conv mk_t],
	⌜T⌝,
	refl_conv mk_t)];
store_mt_results (mt_runf (op =|-)) [(
	"pc_rule1",
	pc_rule1 "mdt051_test1" prove_rule [refl_conv mk_t],
	mk_t,
	t_thm)];
=TEX
=SML
push_pc "initial";
store_mt_results (mt_runf (op =|-)) [(
	"MERGE_PCS_T1",
	tac_proof,
	(([],⌜¬ F⌝),MERGE_PCS_T1 ["mdt051_test1"] asm_prove_tac [f_thm]),
	f_thm)];
store_mt_results (mt_runf (op =|-)) [(
	"MERGE_PCS_C1",
	MERGE_PCS_C1  ["mdt051_test1"] prove_conv
		[refl_conv mk_t],
	⌜T⌝,
	refl_conv mk_t)];
store_mt_results (mt_runf (op =|-)) [(
	"merge_pcs_rule1",
	merge_pcs_rule1 ["mdt051_test1"] prove_rule [refl_conv mk_t],
	mk_t,
	t_thm)];
=TEX

\subsubsection{commit$\_$pc Revisited}
=SML
open_theory "mdt051_thy";
push_pc "mdt051_test2";
pop_pc();
delete_theory "mdt051_thy1" handle _ => ();
new_theory "mdt051_thy1";
commit_pc "mdt051_test2";
open_theory "mdt051_thy";
store_mt_results mt_run_fail [("commit_pc scope",
	push_pc,
	"mdt051_test2",
	gen_fail_msg "push_pc" 51014 ["mdt051_test2","mdt051_thy1"])];
=TEX
\subsection{Pruning the Theory Hierarchy}
=SML
val was_thys = theory_names();
val was_pcs = get_pcs();
open_theory "mdt051_thy";
new_theory "temp1";
new_pc "temp1";
open_theory "mdt051_thy";
force_delete_theory "temp1";
store_mt_results mt_run [("force_delete_theory 1",
	theory_names,
	(),
	was_thys)];
store_mt_results mt_run [("force_delete_theory 2",
	get_pcs,
	(),
	was_pcs)];
new_theory "temp1";
new_pc "temp1";
new_theory "temp2";
new_pc "temp2";
new_theory "temp3";
new_pc "temp3";
open_theory "temp1";
new_theory "temp4";
new_pc "temp4";
new_parent "temp2";
open_theory "mdt051_thy";
force_delete_theory "temp1";
store_mt_results mt_run [("force_delete_theory 3",
	theory_names,
	(),
	was_thys)];
store_mt_results mt_run [("force_delete_theory 4",
	get_pcs,
	(),
	was_pcs)];
new_theory "temp1";
new_pc "temp1";
force_delete_theory "-";
store_mt_results mt_run [("force_delete_theory 5",
	get_pcs,
	(),
	was_pcs)];
store_mt_results mt_run [("force_delete_theory 6",
	theory_names,
	(),
	was_thys)];
store_mt_results mt_run [("force_delete_theory 7",
	get_current_theory_name,
	(),
	"mdt051_thy")];
new_theory "temp1";
new_theory "temp2";
lock_theory "temp2";
lock_theory "temp1";

store_mt_results mt_run_fail [("force_delete_theory 51003",
	force_delete_theory,
	"temp1",
	gen_fail_msg "force_delete_theory" 51003 ["temp2, temp1"])];
unlock_theory "temp1";
store_mt_results mt_run_fail [("force_delete_theory 51007",
	force_delete_theory,
	"temp1",
	gen_fail_msg "force_delete_theory" 51007 ["temp2"])];
open_theory "basic_hol";
store_mt_results mt_run_fail [("force_delete_theory 51006",
	force_delete_theory,
	"-",
	gen_fail_msg "force_delete_theory" 51006 ["char","basic_hol"])];
open_theory "mdt051_thy";
unlock_theory "temp2";
force_delete_theory "temp1";
=TEX
\subsection{Setting Evaluation Functions}
Do these last!
=SML
open_theory "mdt051_thy1";
new_pc "mdt051_test4";
merge_pcs ["mdt051_test2"] "mdt051_test4";
set_nd_entry "not there" [(mk_t,(fn _ => t_thm))] "mdt051_test4";
push_pc "mdt051_test4";
store_mt_results mt_run [(
	"current_ad_nd_net pre-eval",
	length o net_lookup (current_ad_nd_net "not there"),
	mk_t,
	1)];
val pppceval = pending_reset_pc_evaluators();
pp'set_eval_ad_rw_net (fn _ => empty_net);
pp'set_eval_ad_rw_canon (fn _ => fn _ => []);
pp'set_eval_ad_st_conv (fn _ => fn _ => t_thm);
pp'set_eval_ad_sc_conv (fn _ => fn _ => t_thm);
pp'set_eval_ad_cs_∃_convs (fn _ => fn _ => t_thm);
pp'set_eval_ad_∃_cd_thms (fn _ => [([],[],BOOL,[],t_thm)]);
pp'set_eval_ad_∃_vs_thms (fn _ => []);
pp'set_eval_ad_nd_net (fn _ => fn _ => empty_net);
set_pc "mdt051_test4";
store_mt_results mt_run [(
	"current_ad_nd_net post-eval",
	length o net_lookup (current_ad_nd_net "not there"),
	mk_t,
	0)];
let
val rw_net1 = current_ad_rw_net ();
in
store_mt_results mt_run [(
	"current_ad_rw_net a",
	is_nil,
	(net_lookup rw_net1 tm_a),
	true)]
end;
store_mt_results mt_run [(
	"current_ad_rw_canon a",
	length,
	(current_ad_rw_canon () t_thm),
	0)];
store_mt_results (mt_runf (op =#))[(
	"current_ad_st_conv a",
	dest_thm o current_ad_st_conv (),
	tm_a,
	dest_thm t_thm)];
store_mt_results (mt_runf (op =#))[(
	"current_ad_sc_conv a",
	dest_thm o current_ad_sc_conv (),
	tm_a,
	dest_thm t_thm)];
store_mt_results (mt_runf (op =#))[(
	"current_ad_cs_∃_conv a",
	dest_thm o current_ad_cs_∃_conv (),
	mk_t,
	dest_thm t_thm)];
store_mt_results mt_run [
	("current_ad_∃_cd_thms a",
	length,
	current_ad_∃_cd_thms (),
	1)];
store_mt_results mt_run [
	("current_ad_∃_vs_thms a",
	length,
	current_ad_∃_vs_thms (),
	0)];
=TEX
Now test that we can pop the stuff again:
=SML
pppceval();
set_pc "mdt051_test4";
store_mt_results mt_run [(
	"current_ad_nd_net pre-eval b",
	length o net_lookup (current_ad_nd_net "not there"),
	mk_t,
	1)];
set_pc "mdt051_test1";

store_mt_results mt_run [(
	"current_ad_rw_canon b",
	length,
	(current_ad_rw_canon () t_thm),
	2)];
store_mt_results (mt_runf (op =#))[(
	"current_ad_st_conv b",
	dest_thm o current_ad_st_conv (),
	tm_a,
	dest_thm (conv1 tm_a))];
store_mt_results (mt_runf (op =#))[(
	"current_ad_sc_conv b",
	dest_thm o current_ad_sc_conv (),
	tm_a,
	dest_thm (conv1 tm_a))];
store_mt_results (mt_runf (op =#))[(
	"current_ad_cs_∃_conv b",
	dest_thm o current_ad_cs_∃_conv (),
	mk_t,
	dest_thm (refl_conv mk_t))];
store_mt_results mt_run [
	("current_ad_∃_cd_thms b",
	length,
	current_ad_∃_cd_thms (),
	0)];
store_mt_results mt_run [
	("current_ad_∃_vs_thms b",
	length,
	current_ad_∃_vs_thms (),
	1)];
store_mt_results (mt_runf (op =#)) [
	("current_ad_pr_conv b",
	dest_thm,
	force_value(current_ad_pr_conv ()) [refl_conv mk_t] mk_t,
	dest_thm (refl_conv mk_t))];
store_mt_results mt_run [
	("current_ad_pr_tac b",
	is_nil o fst,
	force_value(current_ad_pr_tac ()) [t_thm] ([],mk_t),
	true)];
=TEX
\subsection{End of Tests}
=SML
diag_string(summarize_mt_results ());
=TEX
\end{document}

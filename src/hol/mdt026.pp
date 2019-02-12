=IGN
********************************************************************************
mdt026.doc: this file is part of the PPHol system

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

\def\Title{Module Tests for the Rewriting Rules of Inference}

\def\AbstractText{A set of module tests are given for the the rewriting rules of inference.}

\def\Reference{DS/FMU/IED/MDT026}

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
%% LaTeX2e port: \TPPtitle{Module Tests for the Rewriting Rules of Inference}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Module Tests for the Rewriting Rules of Inference}
%% LaTeX2e port: \TPPref{DS/FMU/IED/MDT026}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.26 $ %
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2005/12/16 10:34:27 $ %
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{ML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.Blackburn & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{K.Blackburn & WIN01\\D.J.~King & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & Project Manager}
%% LaTeX2e port: \TPPabstract{A set of module tests are given for the
%% LaTeX2e port: the rewriting rules of inference.}
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
\item [Issue 1.1 (1991/06/19)]
First version.
\item [Issue 1.2 (1991/06/27)]
Reacted to issue 1.3 of \cite{DS/FMU/IED/DTD026}.
\item [Issue 1.3 (1991/06/27)]
Changed $TRAVERSE$ to $MAP$.
\item [Issue 1.4 (1991/08/08)]
Re-implementation to follow ideas of \cite{DS/FMU/IED/DTD051}.
\item [Issue 1.5 (1991/10/30),1.6 (1991/11/19)]
Reacting to issue 1.5 of \cite{DS/FMU/IED/DTD051}.

\item[Issue 1.7 (1991/11/20), \FormatDate{92/01/20} ] Updated to use new fonts.
\item [1.8,1.9,1.10,1.11]
Added $REWRITE\_MAP\_C$ and message 26002 material.
\item [Issue 1.13 (1992/03/18),1.14 (1992/03/19)]
Added $f\_rewrite\_canon$.
\item [Issue 1.15 (1992/03/26),1.16 (1992/03/26) (26th March 1992)]
Changed to use proof context material of issue 1.13 of \cite{DS/FMU/IED/DTD051}.
\item [Issue 1.17 (1992/03/31) (31st March 1992)]
Removed filtered rewrites, added understanding of double negation
to $simple\-\_¬\-\_rewrite\-\_canon$.
\item [Issue 1.18 (1992/04/09) (9th April 1992)]
Changes required by CR0016.
\item [Issue 1.19 (1992/04/14) (14th April 1992)]
Changes required by CR0017.
\item [Issue 1.20 (1992/05/14),1.21 (1992/05/18),1.22 (1992/05/19) (14th May 1992)]
Tidying up proof contexts.

\item[Issue 1.24 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.25 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.26 (2005/12/16)] The prefix for private interfaces is now $pp'$ rather than $icl'$.
\item[Issue 1.27 (2011/05/05)] Allowed for (and tested) new parameter to the primitive
rewriting functions.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
% \subsection{Changes Forecast}
\section{GENERAL}
\subsection{Scope}
This document contains the module testing of the Rewriting Rules of Inference.
The design is in \cite{DS/FMU/IED/DTD026}
and it is
implemented in \cite{DS/FMU/IED/IMP026}.

\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains the module testing of the material given a design in \cite{DS/FMU/IED/DTD026},
following the test policy given in that document and the general policy given in \cite{DS/FMU/IED/PLN008}.

The tests distinguish the behaviour of all the inference rules from each other.
It shows (for the examples given, and hopefully always) that the filtered assumption rules behave as the expected equivalents given filters $(fn\ x\ =>\ true)$ and $(fn\ x\ =>\ false)$.
It also shows that the conversions behave as their rule
equivalents suggest.
\subsubsection{Dependencies}
This document is derived from the detailed design in \cite{DS/FMU/IED/DTD026},
and is further influenced by the implementation, in  \cite{DS/FMU/IED/IMP026}.
\subsubsection{Deficiencies}
None known.
\section{TEST CASES}
We test each function of the signature of \cite{DS/FMU/IED/DTD026}
in turn, though we do not test them to the same level of detail.
In particular, we only test messages 26002 and 26003 for two of
all the possible functions.
\section{INITIALISATION}
Initialise the test package:
=SML
use_file "dtd013.sml";
use_file "imp013.sml";
init_mt_results();
open_theory "basic_hol";
=TEX
=SML
fun list_eq (eq:'a * 'a -> bool) ((a :: x), (b :: y)) : bool = (
	eq(a,b) andalso list_eq eq (x, y)
) | list_eq eq ([], []) = true
| list_eq _ _ = false;
=TEX

\section{VALUE BINDINGS}
=GFT
f_first_thm =  ⊢ (∀ x ⦁ F ∧ x ⇔ F) ∧ (∀ x ⦁ F ∨ x ⇔ x)
=TEX
=SML
local
	val s1 = asm_rule mk_f;
	val s2 = contr_rule ⌜F ∧ x⌝ s1;
	val s3 = all_⇒_intro s2;
	val s4 = asm_rule ⌜F ∧ x⌝;
	val s5 = ∧_left_elim s4;
	val s6 = all_⇒_intro s5;
	val s7 = ⇔_intro s6 s3;
	val s8 = all_∀_intro s7;

	val s9 = asm_rule ⌜x : BOOL⌝;
	val s10 = ∨_left_intro mk_f s9;
	val s11 = all_⇒_intro s10;
	val s12 = asm_rule ⌜F ∨ x⌝;
	val s13 = ∨_cancel_rule s12 f_thm;
	val s14 = all_⇒_intro s13;
	val s15 = ⇔_intro s14 s11;
	val s16 = all_∀_intro s15;
	
	val s17 = ∧_intro  s8 s16;
in
	val f_first_thm = s17;
end;
=TEX
=SML
val sample = ⌜(λ f x y ⦁ (f x ∧ y) ∧ (λ p ⦁ p) q)(λ x ⦁ ¬ x) T ((λ p ⦁ p) q)⌝;
val sample_thm = asm_rule sample;
val fall = (fn x => true);
val fnone = (fn x => false);

val sample2 = ⌜((λ f p q ⦁ (f p ∧ f q))(λ x ⦁ ¬ x) T (¬(¬ F)) ∨ ¬(1 = 1)) ⇔ (F ∨ t)⌝;
val sample2_thm = asm_rule sample2;
val res1 = ⌜F ∧ T ∨ F ⇔ F ∨ t⌝;
val res2 = ⌜((λ p ⦁ λ q ⦁ ((λ x ⦁ ¬ x) p) ∧ ((λ x ⦁ ¬ x) q)) T (¬ T)) ∨ ¬ T ⇔ F ∨ t⌝;
val res3 = ⌜F ∨ t ⇔ F ∨ t⌝;
val res4 = ⌜F ⇔ t⌝;
val res5 = ⌜((λ p ⦁ λ q ⦁ ((λ x ⦁ ¬ x) p) ∧ ((λ x ⦁ ¬ x) q)) T (¬ T)) ∨ ¬ T ⇔ t⌝;
val res6 = ⌜F ∨ t ⇔ t⌝;
val res7 = ⌜((λ f ⦁ λ p ⦁ λ q ⦁ (f p) ∧ (f q)) (λ x ⦁ ¬ x) T (¬ T)) ∨ ¬ (1 = 1) ⇔ F ∨ t⌝;
val res8 = ⌜((λ f ⦁ λ p ⦁ λ q ⦁ (f p) ∧ (f q)) (λ x ⦁ ¬ x) T (¬ T)) ∨ ¬ (1 = 1) ⇔ t⌝;
val res9 = ⌜t ⇔ t⌝;

val thms = [(⇔_t_intro f_thm), f_first_thm];
val thms1 = [¬_t_thm, ⇔_t_intro f_thm];
val sample3 = ⌜¬(¬ T)⌝;
val sample3_thm = asm_rule sample3;
val res31 = ⌜¬ F⌝;
val res32 = mk_t;

val thm41 = asm_rule⌜p ∧ q⌝;
val thm41p = ∧_left_elim thm41;
val thm41q = ∧_right_elim thm41;
val thm41pT = ⇔_t_intro thm41p;
val thm41qT = ⇔_t_intro thm41q;
val thm42 = asm_rule⌜¬(p ∨ q)⌝;
val thm42a = conv_rule simple_¬_in_conv thm42;
val thm43 = asm_rule⌜¬∃x⦁p x⌝;
val thm44 = conv_rule simple_¬_in_conv thm43;
val thm44a = simple_∀_elim⌜x⌝ thm44;
val thm45 = asm_rule⌜x = y⌝;
val thm46 = asm_rule⌜x ⇔ y⌝;
val thm47 = asm_rule⌜p:BOOL⌝;
val thm47T = ⇔_t_intro thm47;
val thm48 = asm_rule⌜p ∧ q ∧ r⌝;
val thm48p = ∧_left_elim thm48;
val thm48q = ∧_left_elim (∧_right_elim thm48);
val thm48r = ∧_right_elim (∧_right_elim thm48);
val thm48r = ∧_right_elim (∧_right_elim thm48);
val thm49 = asm_rule⌜¬p⌝;
val thm49a = tac_proof(([⌜¬p⌝], ⌜p⇔F⌝), all_asm_ante_tac THEN taut_tac);
val thm50c = ⌜∀ p q r ⦁ p ∧ q ∧ r⌝;
val thm50 = simple_∀_elim ⌜p:BOOL⌝ (asm_rule ⌜∀ p q r ⦁ p ∧ q ∧ r⌝);
val thm51 = asm_rule⌜¬¬p⌝;
val thm51a = tac_proof(([⌜¬¬p⌝], ⌜p:BOOL⌝), all_asm_ante_tac THEN taut_tac);

=TEX
A simple canonicalisation:
=SML
val simple_canon = REWRITE_CAN (REPEAT_CAN ∧_rewrite_canon);
=TEX
Some proof contexts (all of them will have $simple\_\beta\_conv$ in their rewriting nets):
=SML
fun thms_to_eqn_cxt canon thms = (
	((⌜(λ x ⦁ y)z⌝, simple_β_conv) ::
	(flat(map (cthm_eqn_cxt canon) thms)))
);
=TEX
Initialising the rewriting context:
=SML
val just_beta_eqn_cxt =
	[(⌜(λ x ⦁ y) z⌝,simple_β_conv)];
pp'set_eval_ad_rw_canon (fn _ => id_canon);
new_pc "empty_rw";
set_rw_eqn_cxt just_beta_eqn_cxt "empty_rw";
push_pc "empty_rw";
=TEX
=SML
new_pc "rw1";
set_rw_eqn_cxt (thms_to_eqn_cxt id_canon [¬_t_thm,
		f_first_thm,
		(⇔_t_intro f_thm),
		all_∀_intro(⇔_t_intro (refl_conv ⌜x:'a⌝))
		]) "rw1";
commit_pc "rw1";
new_pc "rw3";
set_rw_eqn_cxt (thms_to_eqn_cxt id_canon [¬_t_thm,
		all_∀_intro(⇔_t_intro (refl_conv ⌜x:'a⌝))
		]) "rw3";
commit_pc "rw3";

new_pc "rw2";
pp'set_eval_ad_rw_canon (fn _ => simple_canon);
set_rw_eqn_cxt (thms_to_eqn_cxt simple_canon [¬_t_thm,
		f_first_thm,
		(⇔_t_intro f_thm),
		all_∀_intro(⇔_t_intro (refl_conv ⌜x:'a⌝))
		]) "rw2";
commit_pc "rw2";

new_pc "rw4";
set_rw_eqn_cxt (thms_to_eqn_cxt id_canon [¬_t_thm,
		all_∀_intro(⇔_t_intro (refl_conv ⌜x:'a⌝))
		]) "rw4";
commit_pc "rw4";

new_pc "rw5";
set_rw_eqn_cxt just_beta_eqn_cxt "rw5";
commit_pc "rw5";
=TEX
\subsection{Testing the Traversal Functions}
=SML
val tf_sample1 = ⌜(λ f x y ⦁ (f x ∧ y) ∧ (λ p ⦁ p) q)(λ x ⦁ ¬ x) T ((λ p ⦁ p) q)⌝;
=TEX
=SML
store_mt_results (mt_runf (op =#)) [("REWRITE_MAP_C",
	dest_thm o REWRITE_MAP_C "simple_β_conv" simple_β_conv,
	tf_sample1,
	([],mk_eq(tf_sample1,
	⌜((¬ T) ∧ q) ∧ q⌝)))];
=TEX
=SML
store_mt_results mt_run_fail [("REWRITE_MAP_C cnv fails everywhere",
	REWRITE_MAP_C "testing"  (fail_with_conv "testing REWRITE_MAP_C"),
	tf_sample1,
	gen_fail_msg "testing" 26001 [])];
=TEX
=SML
store_mt_results (mt_runf (op =#)) [( "ONCE_MAP_WARN_C",
	dest_thm o ONCE_MAP_WARN_C "simple_β_conv" simple_β_conv,
	tf_sample1,
	([],mk_eq(tf_sample1,
	⌜(λ x y ⦁ ((λ x ⦁ ¬ x) x ∧ y) ∧ (λ p ⦁ p) q) T q⌝)))];
=TEX
=SML
store_mt_results mt_run_fail [( "ONCE_MAP_WARN_C cnv fails everywhere",
 ONCE_MAP_WARN_C "testing" (fail_with_conv "testing ONCE_MAP_WARN_C"),
	tf_sample1,
	gen_fail_msg  "testing" 26001 [])];
=TEX
=SML
val tf_sample2 = ⌜¬ F ∧ ∀ a:'a ⦁ p (b:'a) a ∧ ¬ F⌝;
val tf_sample3 = ⌜∀ a:'a ⦁ p (b:'a) a ∧ ¬ F⌝;
val tf_conv :CONV = (fn tm =>
	if tm =$ ⌜b:'a⌝
	then asm_rule ⌜b:'a = a⌝
	else if tm =$ ⌜¬ F⌝
	then ¬_f_thm
	else fail "tf_conv" 0 []
);

store_mt_results mt_run_fail [
	("REWRITE_MAP_C 26003",
	(REWRITE_MAP_C "tf_conv") tf_conv,
	tf_sample3,
	gen_fail_msg "tf_conv" 26003 ["tf_conv"]),
	("ONCE_MAP_WARN_C 26003",
	(ONCE_MAP_WARN_C "tf_conv") tf_conv,
	tf_sample3,
	gen_fail_msg "tf_conv" 26003 ["tf_conv"])
	];

val temp_ignore_warnings = set_flag("ignore_warnings",false);
val temp_illformed_rewrite_warning = set_flag("illformed_rewrite_warning",true);

store_mt_results mt_run_fail [
	("REWRITE_MAP_C 26002",
	(REWRITE_MAP_C "tf_conv") tf_conv,
	tf_sample2,
	gen_fail_msg "tf_conv" 26002 []),
	("ONCE_MAP_WARN_C 26002",
	(ONCE_MAP_WARN_C "tf_conv") tf_conv,
	tf_sample2,
	gen_fail_msg "tf_conv" 26002 [])
	];

set_flag("ignore_warnings",true);
store_mt_results (mt_runf (op =#)) [
	("REWRITE_MAP_C 26002 a",
	dest_thm o (REWRITE_MAP_C "tf_conv") tf_conv,
	tf_sample2,
	([],mk_eq(tf_sample2,⌜T ∧ ∀ a:'a ⦁ p (b:'a) a ∧ ¬ F⌝))),
	("ONCE_MAP_WARN_C 26002 a",
	dest_thm o (ONCE_MAP_WARN_C "tf_conv") tf_conv,
	tf_sample2,
	([],mk_eq(tf_sample2,⌜T ∧ ∀ a:'a ⦁ p (b:'a) a ∧ ¬ F⌝)))
	];
set_flag("illformed_rewrite_warning",false);
store_mt_results (mt_runf (op =#)) [
	("REWRITE_MAP_C 26002 b",
	dest_thm o (REWRITE_MAP_C "tf_conv") tf_conv,
	tf_sample2,
	([],mk_eq(tf_sample2,⌜T ∧ ∀ a:'a ⦁ p (b:'a) a ∧ ¬ F⌝))),
	("ONCE_MAP_WARN_C 26002 b",
	dest_thm o (ONCE_MAP_WARN_C "tf_conv") tf_conv,
	tf_sample2,
	([],mk_eq(tf_sample2,⌜T ∧ ∀ a:'a ⦁ p (b:'a) a ∧ ¬ F⌝)))
	];

set_flag("ignore_warnings",temp_ignore_warnings);
set_flag("illformed_rewrite_warning",temp_illformed_rewrite_warning);
=TEX

\section{THE TESTS OF REWRITING}
We will test the assorted derived rewrite functions,
and these will serve as the primary test of $prim\_rewrite\_conv$.
\subsection{Testing the Conversions}
First check that having no effect causes a failure:
=SML
store_mt_results mt_run_fail [
	("rewrite_rule 26001 a",
	rewrite_rule [],
	t_thm,
	gen_fail_msg "rewrite_rule" 26001 []),
	("pure_rewrite_rule 26001 a",
	pure_rewrite_rule [],
	t_thm,
	gen_fail_msg "pure_rewrite_rule" 26001 []),
	("once_rewrite_rule 26001 a",
	once_rewrite_rule [],
	t_thm,
	gen_fail_msg "once_rewrite_rule" 26001 []),
	("pure_once_rewrite_rule 26001 a",
	pure_once_rewrite_rule [],
	t_thm,
	gen_fail_msg "pure_once_rewrite_rule" 26001 []),
	("asm_rewrite_rule 26001 a",
	asm_rewrite_rule [],
	t_thm,
	gen_fail_msg "asm_rewrite_rule" 26001 []),
	("pure_asm_rewrite_rule 26001 a",
	pure_asm_rewrite_rule [],
	t_thm,
	gen_fail_msg "pure_asm_rewrite_rule" 26001 []),
	("once_asm_rewrite_rule 26001 a",
	once_asm_rewrite_rule [],
	t_thm,
	gen_fail_msg "once_asm_rewrite_rule" 26001 []),
	("pure_once_asm_rewrite_rule 26001 a",
	pure_once_asm_rewrite_rule [],
	t_thm,
	gen_fail_msg "pure_once_asm_rewrite_rule" 26001 [])
	];

store_mt_results mt_run_fail [
	("rewrite_conv 26001 a",
	rewrite_conv [],
	mk_t,
	gen_fail_msg "rewrite_conv" 26001 []),
	("pure_rewrite_conv 26001 a",
	pure_rewrite_conv [],
	mk_t,
	gen_fail_msg "pure_rewrite_conv" 26001 []),
	("once_rewrite_conv 26001 a",
	once_rewrite_conv [],
	mk_t,
	gen_fail_msg "once_rewrite_conv" 26001 []),
	("pure_once_rewrite_conv 26001 a",
	pure_once_rewrite_conv [],
	mk_t,
	gen_fail_msg "pure_once_rewrite_conv" 26001 [])
	];
=TEX
\subsection{Setting the basic rewrites}
=SML
val _ = push_pc "rw1";
=TEX
=SML
store_mt_results (mt_runf (op =#)) [
	("rewrite_rule 2",
	dest_thm o (rewrite_rule []),
	sample2_thm,
	([sample2],res1)),
	("once_rewrite_rule 2",
	dest_thm o (once_rewrite_rule []),
	sample2_thm,
	([sample2],res2)),
	("asm_rewrite_rule 2",
	dest_thm o (asm_rewrite_rule []),
	sample2_thm,
	([sample2],mk_t)),
	("pure_asm_rewrite_rule 2",
	dest_thm o (pure_asm_rewrite_rule []),
	sample2_thm,
	([sample2],res3)),
	("once_asm_rewrite_rule 2",
	dest_thm o (once_asm_rewrite_rule []),
	sample2_thm,
	([sample2],res3)),
	("pure_once_asm_rewrite_rule 2",
	dest_thm o (pure_once_asm_rewrite_rule []),
	sample2_thm,
	([sample2],res3))
	];
=TEX
=SML
store_mt_results (mt_runf (op =#)) [
	("rewrite_conv 2",
	dest_thm o (rewrite_conv []),
	sample2,
	([],mk_eq(sample2,res1))),
	("once_rewrite_conv 2",
	dest_thm o (once_rewrite_conv []),
	sample2,
	([],mk_eq(sample2,res2)))
	];
=TEX
\subsection{Setting the Canonicalisation}
=SML
val _ = push_pc "rw2";
=TEX
=SML
store_mt_results (mt_runf (op =#)) [
	("rewrite_rule 3",
	dest_thm o (rewrite_rule []),
	sample2_thm,
	([sample2],res4)),
	("once_rewrite_rule 3",
	dest_thm o (once_rewrite_rule []),
	sample2_thm,
	([sample2],res5)),
	("asm_rewrite_rule 3",
	dest_thm o (asm_rewrite_rule []),
	sample2_thm,
	([sample2],mk_t)),
	("pure_asm_rewrite_rule 3",
	dest_thm o (pure_asm_rewrite_rule []),
	sample2_thm,
	([sample2],res3)),
	("once_asm_rewrite_rule 3",
	dest_thm o (once_asm_rewrite_rule []),
	sample2_thm,
	([sample2],res6)),
	("pure_once_asm_rewrite_rule 3",
	dest_thm o (pure_once_asm_rewrite_rule []),
	sample2_thm,
	([sample2],res3))
	];
=TEX
=SML
store_mt_results (mt_runf (op =#)) [
	("rewrite_conv 3",
	dest_thm o (rewrite_conv []),
	sample2,
	([],mk_eq(sample2,res4))),
	("once_rewrite_conv 3",
	dest_thm o (once_rewrite_conv []),
	sample2,
	([],mk_eq(sample2,res5)))
	];
=TEX
\subsection{Rewriting with theorems}
Get parameters right:
=SML
val _ = push_pc "rw3";
=TEX
=SML
store_mt_results (mt_runf (op =#)) [
	("rewrite_rule 4",
	dest_thm o (rewrite_rule thms),
	sample2_thm,
	([sample2],res1)),
	("pure_rewrite_rule 4",
	dest_thm o (pure_rewrite_rule thms),
	sample2_thm,
	([sample2],res7)),
	("once_rewrite_rule 4",
	dest_thm o (once_rewrite_rule thms),
	sample2_thm,
	([sample2],res2)),
	("pure_once_rewrite_rule 4",
	dest_thm o (pure_once_rewrite_rule thms),
	sample2_thm,
	([sample2],res7)),
	("asm_rewrite_rule 4",
	dest_thm o (asm_rewrite_rule thms),
	sample2_thm,
	([sample2],mk_t)),
	("pure_asm_rewrite_rule 4",
	dest_thm o (pure_asm_rewrite_rule thms),
	sample2_thm,
	([sample2],res3)),
	("once_asm_rewrite_rule 4",
	dest_thm o (once_asm_rewrite_rule thms),
	sample2_thm,
	([sample2],res3)),
	("pure_once_asm_rewrite_rule 4",
	dest_thm o (pure_once_asm_rewrite_rule thms),
	sample2_thm,
	([sample2],res3))
	];
=TEX
=SML
store_mt_results (mt_runf (op =#)) [
	("rewrite_conv 4",
	dest_thm o (rewrite_conv thms),
	sample2,
	([],mk_eq(sample2,res1))),
	("pure_rewrite_conv 4",
	dest_thm o (pure_rewrite_conv thms),
	sample2,
	([],mk_eq(sample2,res7))),
	("once_rewrite_conv 4",
	dest_thm o (once_rewrite_conv thms),
	sample2,
	([],mk_eq(sample2,res2))),
	("pure_once_rewrite_conv 4",
	dest_thm o (pure_once_rewrite_conv thms),
	sample2,
	([],mk_eq(sample2,res7)))];
=TEX

\subsection{Rewriting with theorems}
Get parameters right:
=SML
val _ = push_pc "rw4";
=TEX
=SML
store_mt_results (mt_runf (op =#)) [
	("rewrite_rule 5",
	dest_thm o (rewrite_rule thms),
	sample2_thm,
	([sample2],res4)),
	("pure_rewrite_rule 5",
	dest_thm o (pure_rewrite_rule thms),
	sample2_thm,
	([sample2],res8)),
	("once_rewrite_rule 5",
	dest_thm o (once_rewrite_rule thms),
	sample2_thm,
	([sample2],res5)),
	("pure_once_rewrite_rule 5",
	dest_thm o (pure_once_rewrite_rule thms),
	sample2_thm,
	([sample2],res8)),
	("asm_rewrite_rule 5",
	dest_thm o (asm_rewrite_rule thms),
	sample2_thm,
	([sample2],mk_t)),
	("pure_asm_rewrite_rule 5",
	dest_thm o (pure_asm_rewrite_rule thms),
	sample2_thm,
	([sample2],res9)),
	("once_asm_rewrite_rule 5",
	dest_thm o (once_asm_rewrite_rule thms),
	sample2_thm,
	([sample2],res6)),
	("pure_once_asm_rewrite_rule 5",
	dest_thm o (pure_once_asm_rewrite_rule thms),
	sample2_thm,
	([sample2],res6))
	];
=TEX
=SML
store_mt_results (mt_runf (op =#)) [
	("rewrite_conv 5",
	dest_thm o (rewrite_conv thms),
	sample2,
	([],mk_eq(sample2,res4))),
	("pure_rewrite_conv 5",
	dest_thm o (pure_rewrite_conv thms),
	sample2,
	([],mk_eq(sample2,res8))),
	("once_rewrite_conv 5",
	dest_thm o (once_rewrite_conv thms),
	sample2,
	([],mk_eq(sample2,res5))),
	("pure_once_rewrite_conv 5",
	dest_thm o (pure_once_rewrite_conv thms),
	sample2,
	([],mk_eq(sample2,res8)))];
=TEX
\subsubsection{Testing Message 26002}
We only test this message on $asm\_rewrite\_tac$ and $once\-\_asm\-\_rewrite\-\_tac$, though it can occur to all the non-primitive rewriting functions.

During interactive testing, answer ``n'' to whether to continue for the two tests.
=SML
push_goal([⌜f:'a = a⌝],⌜∀ a:'a ⦁ p (f:'a) a ∧ ¬ T⌝);
store_mt_results mt_run_fail [
	("asm_rewrite_tac 26003",
	a,
	asm_rewrite_tac[],
	gen_fail_msg "asm_rewrite_tac" 26003 []),
	("once_asm_rewrite_tac 26003",
	a,
	once_asm_rewrite_tac[],
	gen_fail_msg "once_asm_rewrite_tac" 26003 [])
	];
drop_main_goal();
=SML
push_goal([⌜f:'a = a⌝],⌜¬ T ∧ ∀ a:'a ⦁ p (f:'a) a ∧ ¬ T⌝);
val temp_ignore_warnings = set_flag("ignore_warnings",false);
val temp_illformed_rewrite_warning = set_flag("illformed_rewrite_warning",true);

store_mt_results mt_run_fail [
	("asm_rewrite_tac 26002",
	a,
	asm_rewrite_tac[],
	gen_fail_msg "asm_rewrite_tac" 26002 []),
	("once_asm_rewrite_tac 26002",
	a,
	once_asm_rewrite_tac[],
	gen_fail_msg "once_asm_rewrite_tac" 26002 [])
	];
set_flag("illformed_rewrite_warning",false);
a(asm_rewrite_tac[]);
store_mt_results (mt_runf (op =#)) [
	("asm_rewrite_tac 26002 a",
	top_goal,
	(),
	([⌜f:'a = a⌝],⌜F ∧ ∀ a:'a ⦁ p (f:'a) a ∧ ¬ T⌝))];
undo 1;
a(once_asm_rewrite_tac[]);
store_mt_results (mt_runf (op =#)) [
	("once_asm_rewrite_tac 26002 a",
	top_goal,
	(),
	([⌜f:'a = a⌝],⌜F ∧ ∀ a:'a ⦁ p (f:'a) a ∧ ¬ T⌝))];
undo 1;
set_flag("illformed_rewrite_warning",true);
set_flag("ignore_warnings",true);
a(asm_rewrite_tac[]);
store_mt_results (mt_runf (op =#)) [
	("asm_rewrite_tac 26002 b",
	top_goal,
	(),
	([⌜f:'a = a⌝],⌜F ∧ ∀ a:'a ⦁ p (f:'a) a ∧ ¬ T⌝))];
undo 1;
a(once_asm_rewrite_tac[]);
store_mt_results (mt_runf (op =#)) [
	("once_asm_rewrite_tac 26002 b",
	top_goal,
	(),
	([⌜f:'a = a⌝],⌜F ∧ ∀ a:'a ⦁ p (f:'a) a ∧ ¬ T⌝))];
drop_main_goal();

set_flag("illformed_rewrite_warning",temp_illformed_rewrite_warning);
set_flag("ignore_warnings",temp_ignore_warnings);
=TEX

\subsection{Distinguishing $pure\_$ and $pure\_once\_$}
The above tests don't manage to distinguish the behaviour
of all the functions.
The following ad-hoc test completes the separation of behaviour.
=SML
val _ = push_pc "rw5";
=TEX
=SML
store_mt_results (mt_runf (op =#)) [
	("rewrite_rule 6",
	dest_thm o (rewrite_rule thms1),
	sample3_thm,
	([sample3],res32)),
	("pure_rewrite_rule 6",
	dest_thm o (pure_rewrite_rule thms1),
	sample3_thm,
	([sample3],res32)),
	("once_rewrite_rule 6",
	dest_thm o (once_rewrite_rule thms1),
	sample3_thm,
	([sample3],res31)),
	("pure_once_rewrite_rule 6",
	dest_thm o (pure_once_rewrite_rule thms1),
	sample3_thm,
	([sample3],res31)),
	("asm_rewrite_rule 6",
	dest_thm o (asm_rewrite_rule thms1),
	sample3_thm,
	([sample3],res32)),
	("pure_asm_rewrite_rule 6",
	dest_thm o (pure_asm_rewrite_rule thms1),
	sample3_thm,
	([sample3],res32)),
	("once_asm_rewrite_rule 6",
	dest_thm o (once_asm_rewrite_rule thms1),
	sample3_thm,
	([sample3],res31)),
	("pure_once_asm_rewrite_rule 6",
	dest_thm o (pure_once_asm_rewrite_rule thms1),
	sample3_thm,
	([sample3],res31))
	];
=TEX
=SML
store_mt_results (mt_runf (op =#)) [
	("rewrite_conv 6",
	dest_thm o (rewrite_conv thms1),
	sample3,
	([],mk_eq(sample3,res32))),
	("pure_rewrite_conv 6",
	dest_thm o (pure_rewrite_conv thms1),
	sample3,
	([],mk_eq(sample3,res32))),
	("once_rewrite_conv 6",
	dest_thm o (once_rewrite_conv thms1),
	sample3,
	([],mk_eq(sample3,res31))),
	("pure_once_rewrite_conv 6",
	dest_thm o (pure_once_rewrite_conv thms1),
	sample3,
	([],mk_eq(sample3,res31)))];
=TEX
\subsection{Testing $prim\_rewrite\_rule$}
=SML
store_mt_results (mt_runf (op =#)) [
	("prim_rewrite_rule 1",
	dest_thm o (prim_rewrite_rule
		(make_net just_beta_eqn_cxt)
		id_canon
		Nil
		(REWRITE_MAP_C "testing")
		[(⌜(λ x ⦁ f) y⌝,simple_β_conv)]
		[]),
	sample_thm,
	([sample],⌜((¬ T) ∧ q) ∧ q⌝)),
	("prim_rewrite_rule 2",
	dest_thm o (prim_rewrite_rule
		(make_net just_beta_eqn_cxt)
		id_canon
		Nil
	 	(ONCE_MAP_WARN_C "testing")
		[(⌜(λ x ⦁ f) y⌝,simple_β_conv)]
		[]),
	sample_thm,
	([sample],⌜(λ x y ⦁ ((λ x ⦁ ¬ x) x ∧ y) ∧ (λ p ⦁ p) q) T q⌝)),
	("prim_rewrite_rule 3",
	dest_thm o (prim_rewrite_rule
		((make_net o thms_to_eqn_cxt id_canon)
		[¬_t_thm,
		 f_first_thm,
		 (⇔_t_intro f_thm),
		 all_∀_intro(⇔_t_intro (refl_conv ⌜x:'a⌝))])
		id_canon
		Nil
		(REWRITE_MAP_C "testing")
		[]
		[]),
	sample2_thm,
	([sample2],res1)),
	("prim_rewrite_rule 4",
	dest_thm o (prim_rewrite_rule
		((make_net o thms_to_eqn_cxt
		(∧_rewrite_canon ORELSE_CAN id_canon))
		[¬_t_thm,
		 f_first_thm,
		 (⇔_t_intro f_thm),
		 all_∀_intro(⇔_t_intro (refl_conv ⌜x:'a⌝))])
		(∧_rewrite_canon ORELSE_CAN id_canon)
		Nil
		(REWRITE_MAP_C "testing")
		[]
		[]),
	sample2_thm,
	([sample2],res4)),
	("prim_rewrite_rule 5",
	dest_thm o (prim_rewrite_rule
		((make_net o thms_to_eqn_cxt id_canon)
		[¬_t_thm,
		 f_first_thm,
		 (⇔_t_intro f_thm),
		 all_∀_intro(⇔_t_intro (refl_conv ⌜x:'a⌝))])
		id_canon
		Nil
		(REWRITE_MAP_C "testing")
		[]
		[f_first_thm, (⇔_t_intro f_thm)]),
	sample2_thm,
	([sample2],res1)),
	("prim_rewrite_rule 6",
	dest_thm o (prim_rewrite_rule
		((make_net o thms_to_eqn_cxt
		(∧_rewrite_canon ORELSE_CAN id_canon))
		[¬_t_thm,
		 f_first_thm,
		 (⇔_t_intro f_thm),
		 all_∀_intro(⇔_t_intro (refl_conv ⌜x:'a⌝))])
		(∧_rewrite_canon ORELSE_CAN id_canon)
		Nil
		(REWRITE_MAP_C "testing")
		[]
		[f_first_thm, (⇔_t_intro f_thm)]),
	sample2_thm,
	([sample2],res4))
	];

=TEX
=SML

store_mt_results (mt_runf (op =#)) [
	("prim_rewrite_rule 7",
	dest_thm o (prim_rewrite_rule
		empty_net
		id_canon
		(Value (fn _=> (⌜(λ x ⦁ f) y⌝,simple_β_conv)))
		(REWRITE_MAP_C "testing")
		[]
		[¬_t_thm]),
	sample_thm,
	([sample],⌜((¬ T) ∧ q) ∧ q⌝))	];

=TEX
\subsection{Canons}
=SML
store_mt_results
(mt_runf (list_eq(op =#))) [
	("canons 1",
	map dest_thm o id_canon,
	thm41,	[dest_thm thm41]),
	("canons 2",
	map dest_thm o (∧_rewrite_canon THEN_CAN ⇔_t_rewrite_canon),
	thm41,	[dest_thm thm41pT, dest_thm thm41qT]),
	("canons 3",
	map dest_thm o (∧_rewrite_canon ORELSE_CAN ⇔_t_rewrite_canon),
	thm47,	[dest_thm thm47T]),
	("canons 4",
	map dest_thm o (∧_rewrite_canon ORELSE_CAN ⇔_t_rewrite_canon),
	thm41,	[dest_thm thm41p, dest_thm thm41q])
];
=TEX
=SML
store_mt_results
(mt_runf (list_eq(op =#))) [
	("THEN_LIST_CAN",
	map dest_thm o (∧_rewrite_canon THEN_LIST_CAN [⇔_t_rewrite_canon, id_canon]),
	thm41,	[dest_thm thm41pT, dest_thm thm41q])];

store_mt_results
mt_run_fail [
	("THEN_LIST_CAN 26204",
	(∧_rewrite_canon THEN_LIST_CAN [⇔_t_rewrite_canon]),
	thm41,
	gen_fail_msg "THEN_LIST_CAN" 26204 [])];

=TEX
=SML
store_mt_results
(mt_runf (list_eq(op =#))) [
	("canons 5",
	map dest_thm o EVERY_CAN [],
	thm41,	[dest_thm thm41]),
	("canons 6",
	map dest_thm o EVERY_CAN [∧_rewrite_canon, ⇔_t_rewrite_canon],
	thm41,	[dest_thm thm41pT, dest_thm thm41qT]),
	("canons 7",
	map dest_thm o FIRST_CAN[∧_rewrite_canon, ⇔_t_rewrite_canon],
	thm47,	[dest_thm thm47T]),
	("canons 8",
	map dest_thm o FIRST_CAN[∧_rewrite_canon ORELSE_CAN ⇔_t_rewrite_canon],
	thm41,	[dest_thm thm41p, dest_thm thm41q]),
	("canons 9",
	map dest_thm o REPEAT_CAN ∧_rewrite_canon,
	thm48,	[dest_thm thm48p, dest_thm thm48q, dest_thm thm48r])
];
=TEX
The above tests have already covered $∧\_rewrite\_canon$ and
$⇔\_t\_rewrite\_canon$.
=SML
store_mt_results
(mt_runf (list_eq(op =#))) [
	("canons 10",
	map dest_thm o simple_¬_rewrite_canon ,
	thm42,	[dest_thm thm42a]),
	("canons 11",
	map dest_thm o simple_¬_rewrite_canon ,
	thm43,	[dest_thm thm44]),
	("canons 12",
	map dest_thm o simple_¬_rewrite_canon ,
	thm49,	[dest_thm thm49a]),
	("canons 12a",
	map dest_thm o simple_¬_rewrite_canon ,
	thm51,	[dest_thm thm51a]),
	("canons 13",
	map dest_thm o simple_∀_rewrite_canon ,
	thm44,	[dest_thm thm44a]),
	("canons 19",
	map dest_thm o f_rewrite_canon ,
	asm_rule mk_f,	[([mk_f],⌜∀x ⦁ x⌝)])
];
=TEX
=SML
store_mt_results
mt_run_fail [
	("canons 14",
	⇔_t_rewrite_canon ,
	thm45,	gen_fail_msg "⇔_t_rewrite_canon" 26203 []),
	("canons 15",
	⇔_t_rewrite_canon ,
	thm46,	gen_fail_msg "⇔_t_rewrite_canon" 26203 []),
	("canons 16",
	FIRST_CAN [],
	thm46,	gen_fail_msg "FIRST_CAN" 26202 []),
	("canons 17",
	fail_canon,
	thm46,	gen_fail_msg "fail_canon" 26201 []),
	("canons 18",
	fail_with_canon "fred" 26202 [],
	thm46,	gen_fail_msg "fred" 26202 [])
];
=TEX
=SML
store_mt_results
(mt_runf (list_eq(op =#))) [
	("REWRITE_CAN",
	map dest_thm o REWRITE_CAN  ((REPEAT_CAN(FIRST_CAN [
		simple_∀_rewrite_canon,
		∧_rewrite_canon]))),
	thm50,
	[([thm50c],⌜p:BOOL⌝),([thm50c],⌜∀ q ⦁ q⌝),([thm50c],⌜∀ r ⦁ r⌝)])];
=TEX
\section{TACTICS}
We are pretty cursory in the following, doing little more than just demonstrating
their presence and error message origin.

N.B. the evaluation function for rewriting canonications has been
made non-standard, so should only push single commited proof contexts.
=SML
push_pc "predicates";
=TEX
=SML
set_flag("subgoal_package_quiet",true);
fun tac_res tac goal = (push_goal([],goal);
		a tac;
		let val (seqasms,gl) = top_goal()
		in
			(drop_main_goal();
			gl)
		end);
fun tac_res1 tac seqasms goal = (
		push_goal(seqasms,goal);
		a tac;
		let val (seqasms,gl) = top_goal()
		in
			(drop_main_goal();
			gl)
		end);
val s_thm = asm_rule ⌜s = ¬ T⌝;
=TEX
=SML
store_mt_results
(mt_runf (op =$)) [
	("rewrite_tac",
	tac_res (rewrite_tac[]),
	⌜T ∧ (λ x ⦁ x) p⌝,
	⌜p:BOOL⌝),
	("pure_rewrite_tac",
	tac_res(pure_rewrite_tac[s_thm]),
	⌜s ∧ T⌝,
	⌜¬ T ∧ T⌝),
	("once_rewrite_tac",
	tac_res(once_rewrite_tac[]),
	⌜T ∧ (T ∧ p)⌝,
	⌜(T ∧ p)⌝),
	("pure_once_rewrite_tac",
	tac_res(pure_once_rewrite_tac[∧_thm]),
	⌜t1 ∧ t2⌝,
	⌜∀ b⦁ (t1 ⇒ t2 ⇒ b) ⇒ b⌝),
	("rewrite_thm_tac",
	tac_res(rewrite_thm_tac s_thm),
	⌜p ∧ f (T ∧ s)⌝,
	⌜p ∧ f F⌝),
	("pure_rewrite_thm_tac",
	tac_res(pure_rewrite_thm_tac s_thm),
	⌜s ∧ p⌝,
	⌜¬ T ∧ p⌝),
	("once_rewrite_thm_tac",
	tac_res(once_rewrite_thm_tac s_thm),
	⌜p s ∧ f (T ∧ s)⌝,
	⌜p (¬ T) ∧ f (s:BOOL)⌝),
	("pure_once_rewrite_thm_tac",
	tac_res(pure_once_rewrite_thm_tac s_thm),
	⌜p s ∧ f (T ∧ s)⌝,
	⌜p (¬ T) ∧ f (T ∧ ¬ T)⌝),
	("asm_rewrite_thm_tac",
	tac_res1(asm_rewrite_thm_tac s_thm) [⌜p:BOOL = q⌝],
	⌜p ∧ T⌝,
	⌜q:BOOL⌝),
	("pure_asm_rewrite_thm_tac",
	tac_res1(pure_asm_rewrite_thm_tac s_thm)
		[⌜p:BOOL = q⌝,⌜q:BOOL = r⌝],
	⌜s ∧ p ∧ T⌝,
	⌜¬ T ∧ r ∧ T⌝),
	("once_asm_rewrite_thm_tac",
	tac_res1(once_asm_rewrite_thm_tac s_thm)
		[⌜p:BOOL = q⌝,⌜q:BOOL = r⌝],
	⌜p:BOOL⌝,
	⌜q:BOOL⌝),
	("pure_once_asm_rewrite_thm_tac",
	tac_res1(pure_once_asm_rewrite_thm_tac s_thm)
		[⌜p:BOOL = q⌝,⌜q:BOOL = r⌝],
	⌜T ∧ p⌝,
	⌜T ∧ q⌝)
	];
set_flag("subgoal_package_quiet",false);
=TEX
=SML
push_goal([],⌜F⌝);
store_mt_results
mt_run_fail [
	("rewrite_tac 26001",
	a,
	(rewrite_tac[]),
	gen_fail_msg "rewrite_tac" 26001 []),
	("pure_rewrite_tac 26001",
	a,
	(pure_rewrite_tac[]),
	gen_fail_msg "pure_rewrite_tac" 26001 []),
	("once_rewrite_tac 26001",
	a,
	(once_rewrite_tac[]),
	gen_fail_msg "once_rewrite_tac" 26001 []),
	("pure_once_rewrite_tac 26001",
	a,
	(pure_once_rewrite_tac[]),
	gen_fail_msg "pure_once_rewrite_tac" 26001 []),
	("asm_rewrite_tac 26001",
	a,
	(asm_rewrite_tac[]),
	gen_fail_msg "asm_rewrite_tac" 26001 []),
	("pure_asm_rewrite_tac 26001",
	a,
	(pure_asm_rewrite_tac[]),
	gen_fail_msg "pure_asm_rewrite_tac" 26001 []),
	("once_asm_rewrite_tac 26001",
	a,
	(once_asm_rewrite_tac[]),
	gen_fail_msg "once_asm_rewrite_tac" 26001 []),
	("pure_once_asm_rewrite_tac 26001",
	a,
	(pure_once_asm_rewrite_tac[]),
	gen_fail_msg "pure_once_asm_rewrite_tac" 26001 []),
	("rewrite_thm_tac 26001",
	a,
	(rewrite_thm_tac t_thm),
	gen_fail_msg "rewrite_tac" 26001 []),
	("pure_rewrite_thm_tac 26001",
	a,
	(pure_rewrite_thm_tac t_thm),
	gen_fail_msg "pure_rewrite_tac" 26001 []),
	("once_rewrite_thm_tac 26001",
	a,
	(once_rewrite_thm_tac t_thm),
	gen_fail_msg "once_rewrite_tac" 26001 []),
	("pure_once_rewrite_thm_tac 26001",
	a,
	(pure_once_rewrite_thm_tac t_thm),
	gen_fail_msg "pure_once_rewrite_tac" 26001 []),
	("asm_rewrite_thm_tac 26001",
	a,
	(asm_rewrite_thm_tac t_thm),
	gen_fail_msg "asm_rewrite_tac" 26001 []),
	("pure_asm_rewrite_thm_tac 26001",
	a,
	(pure_asm_rewrite_thm_tac t_thm),
	gen_fail_msg "pure_asm_rewrite_tac" 26001 []),
	("once_asm_rewrite_thm_tac 26001",
	a,
	(once_asm_rewrite_thm_tac t_thm),
	gen_fail_msg "once_asm_rewrite_tac" 26001 []),
	("pure_once_asm_rewrite_thm_tac 26001",
	a,
	(pure_once_asm_rewrite_thm_tac t_thm),
	gen_fail_msg "pure_once_asm_rewrite_tac" 26001 [])];
drop_main_goal();
=TEX
A simple test that the rewriting canonicalisations are in place in $initial\_rw\_canon$.
=SML
store_mt_results
(mt_runf (op =#)) [
	("f_rewrite_canon",
	dest_thm o rewrite_rule[asm_rule mk_f],
	asm_rule ⌜p ∧ q⌝,
	([mk_f,⌜p ∧ q⌝],mk_t)),
	("∧_rewrite_canon",
	dest_thm o pure_rewrite_rule[asm_rule ⌜p ∧ q⌝],
	asm_rule ⌜p ∧ q⌝,
	([⌜p ∧ q⌝],⌜T ∧ T⌝)),
	("simple_¬_rewrite_canon",
	dest_thm o pure_rewrite_rule[asm_rule ⌜¬(p ∨ q)⌝],
	asm_rule ⌜p ∧ q⌝,
	([⌜¬(p ∨ q)⌝,⌜p ∧ q⌝],⌜F ∧ F⌝)),
	("simple_∀_rewrite_canon",
	dest_thm o pure_rewrite_rule[asm_rule ⌜∀ x ⦁ x = 3⌝],
	asm_rule ⌜f 1 ∧ f 2⌝,
	([⌜∀ x ⦁ x = 3⌝,⌜f 1 ∧ f 2⌝],⌜f 3 ∧ f 3⌝)),
	("⇔_t_rewrite_canon",
	dest_thm o pure_rewrite_rule[asm_rule ⌜x:BOOL⌝],
	asm_rule ⌜x ∧ y⌝,
	([⌜x:BOOL⌝,⌜x ∧ y⌝],⌜T ∧ y⌝))
];

=TEX
\section{UNTESTED MATERIAL}
We do not directly test: $initial\_rw\_canon$ (as tested by system build and via $initial\-\_rewrite$), $prim\-\_rewrite\-\_conv$ and $prim\-\_rewrite\-\_tac$ (as tested indirectly).

\section{END OF TESTS}
=SML
diag_string(summarize_mt_results());
=TEX
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}


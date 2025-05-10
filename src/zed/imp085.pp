=IGN
********************************************************************************
imp085.doc: this file is part of the PPZed system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% imp085.doc   ℤ $Date: 2003/07/16 15:20:12 $ $Revision: 1.10 $ $RCSfile: imp085.doc,v $
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

\def\Title{Implementation of the Z Library Functions}

\def\AbstractText{This document contains the implementation of the Z Library Functions and their proof support.}

\def\Reference{DS/FMU/IED/IMP085}

\def\Author{D.J. King}


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
%% LaTeX2e port: % TQtemplate.tex
%% LaTeX2e port: \documentstyle[hol1,11pt,TQ]{article}
%% LaTeX2e port: \ftlinepenalty=9999
\def\Hide#1{}
%% LaTeX2e port: \def\Bool{``$\it{:}bool\,$''}
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{FST PROJECT}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Implementation of the Z Library Functions}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP085}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.10 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2003/07/16 15:20:12 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{D.J.~King & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document contains the implementation of
%% LaTeX2e port: the Z Library Functions and their proof support.}
%% LaTeX2e port: %\TPPabstractB{}
%% LaTeX2e port: %\TPPabstractC{}
%% LaTeX2e port: %\TPPabstractD{}
%% LaTeX2e port: %\TPPabstractE{}
%% LaTeX2e port: %\TPPabstractF{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port:       Library}}
%% LaTeX2e port: 
%% LaTeX2e port: %\TPPclass{CLASSIFICATION}
%% LaTeX2e port: %\def\TPPheadlhs{}
%% LaTeX2e port: %\def\TPPheadcentre{}
%% LaTeX2e port: %def\TPPheadrhs{}
%% LaTeX2e port: %\def\TPPfootlhs{}
%% LaTeX2e port: %\def\TPPfootcentre{}
%% LaTeX2e port: %\def\TPPfootrhs{}
%% LaTeX2e port: 
%% LaTeX2e port: \begin{document}
%% LaTeX2e port: \TPPsetsizes
%% LaTeX2e port: \makeTPPfrontpage
%% LaTeX2e port: 
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

\newpage
\section{DOCUMENT CONTROL}
\subsection{Contents List}
\tableofcontents
\subsection{Document Cross References}
\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes History}  % to get section number `0.3'
\begin{description}
\item [Issue 1.1 (1992/10/28) (22nd October 1992)]
First version, derived from 078 and 083.
\item [Issue 1.2 (1992/11/12), 12th November 1992]
Changes as a consequence of changes in dependences.
\item[Issue 1.4 (1992/12/11) (11th December 1992)]
Global rename from wrk038.doc issue 1.9.
\item[Issue 1.5 (1993/02/10)-1.6 (1993/02/12) (8th-12th February 1993)]
Rearranging proof contexts.
\item[Issue 1.8 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.9 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.10 (2003/07/16)] Cured theorems that used to have free variables.
\item[Issue 1.11 (2004/01/19)] The Z universal set is now called 𝕌.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported PPZed to Lemma 1 document template.

\item[2025/03/05]
Added theorem for pushing function application through a conditional.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
None.
\section{GENERAL}
\subsection{Scope}
This document contains the implementation
of the Z Library functions
given in \cite{DS/FMU/IED/DTD085}.
\subsection{Introduction}
\subsection{Purpose and Background}
See \cite{DS/FMU/IED/DTD085}.
\subsection{Dependencies}
The mathematical toolkit for Z Library functions is introduced within the structure
$ZFunctions$ which is constrained by the signature of the same name, specified
in \cite{DS/FMU/IED/DTD085}.

\subsection{Interface}
The interface for the structure is defined by the signature $ZFunctions$
(see\cite{DS/FMU/IED/DTD085}).

\subsection{Possible Enhancements}
None known.

\subsection{Deficiencies}
None known.

\section{THE STRUCTURE $ZFunctions$}
\section{PREAMBLE}
Structure done in two parts.
=SML
structure ⦏ZFunctions⦎ : ZFunctions = struct
=TEX
=SML
open ZGeneratedConstants;
val lthy = get_current_theory_name();
val _ = open_theory ⦏"z_functions"⦎;
val _ = push_merge_pcs ["z_sets_alg", "'z_tuples","'z_∈_rel"];
val _ = set_flag("z_type_check_only",false);
=TEX
Get the definitions out:

=SML
	val z_→_def = get_spec ⓩ(_ → _)⌝;
	val z_⇸_def = get_spec ⓩ(_ ⇸ _)⌝;
	val z_⤔_def = get_spec ⓩ(_ ⤔ _)⌝;
	val z_↣_def = get_spec ⓩ(_ ↣ _)⌝;
	val z_⤀_def = get_spec ⓩ(_ ⤀ _)⌝;
	val z_↠_def = get_spec ⓩ(_ ↠ _)⌝;
	val z_⤖_def = get_spec ⓩ(_ ⤖ _)⌝;
=TEX
=SML
val ⦏Ua⦎ = ⓩ𝕌⌝; (* type = 'a SET *)
val ⦏Ub⦎ = inst [] [(ⓣ'b⌝,ⓣ'a⌝)] Ua;
=TEX
=SML
val dummy = push_merge_pcs ["z_sets_ext", "'z_tuples"];
local
	val spec = (rewrite_rule[] z_⇸_def);
	val s1 = rewrite_conv [spec] ⓩf ∈ (X ⇸ Y)⌝;
in
val ⦏z_⇸_thm⦎ = save_thm("z_⇸_thm",
 	pure_rewrite_rule[z_↦_thm]
	(all_z_∀_intro s1));
end;
val dummy = pop_pc();
=TEX
=SML
val ⦏z_⇸_thm1⦎ = save_thm("z_⇸_thm1",(
push_goal([],
	ⓩ∀ f : 𝕌; X : 𝕌; Y : 𝕌
          ⦁ f ∈ (X ⇸ Y)
            ⇔ (f ∈ (X ↔ Y)
              ∧ (∀ x : 𝕌; y1, y2 : 𝕌 |
		x ∈ X ∧ y1 ∈ Y ∧ y2 ∈ Y
                ⦁ (x, y1) ∈ f ∧ (x, y2) ∈ f ⇒ y1 = y2))⌝);
push_merge_pcs ["z_sets_ext", "'z_tuples","'z_∈_rel"];
a(rewrite_tac[z_⇸_thm]);
a(REPEAT z_strip_tac);
(* *** Goal "1" *** *)
a(asm_fc_tac[]);
(* *** Goal "2" *** *)
a(asm_fc_tac[]);
(* *** Goal "3" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "4" *** *)
a(asm_fc_tac[]);
(* *** Goal "5" *** *)
a(asm_fc_tac[]);
(* *** Goal "6" *** *)
a(all_asm_fc_tac[]);
pop_pc();
pop_thm()));
=TEX
=SML
local
	val spec = (rewrite_rule[]z_→_def);
	val s1 = rewrite_conv [spec] ⓩf ∈ (X → Y)⌝;
	val s3 = (
push_goal([],ⓩf ∈ (X → Y) ⇔ f ∈ (X ⇸ Y) ∧ dom f = X⌝);
push_merge_pcs ["z_sets_ext", "'z_tuples","'z_∈_rel"];
a(rewrite_tac[z_⇸_thm, s1, z_dom_thm, z_↦_thm]);
a(REPEAT strip_tac THEN_TRY_T(SOLVED_T (all_asm_fc_tac[])));
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 6 ⓩx⌝);
a(z_spec_nth_asm_tac 1 ⓩy1⌝);
a(z_spec_nth_asm_tac 2 ⓩy2⌝);
a(all_var_elim_asm_tac THEN rewrite_tac[]);
(* *** Goal "2" *** *)
a(z_spec_nth_asm_tac 2 ⓩx1⌝);
a(z_∃_tac ⓩy⌝);
a(asm_rewrite_tac[]);
(* *** Goal "3" *** *)
a(z_spec_nth_asm_tac 2 ⓩx⌝);
(* *** Goal "3.1" *** *)
a(asm_fc_tac[]);
(* *** Goal "3.2" *** *)
a(z_∃⋎1_tac ⓩy⌝);
a(z_spec_nth_asm_tac 5 ⓩ(x1 ≜ x, x2 ≜ y)⌝);
a(REPEAT strip_tac);
a(z_spec_nth_asm_tac 7 ⓩ(x ≜ x, y1 ≜ y', y2 ≜ y)⌝);
pop_pc();
pop_thm());
in
val ⦏z_→_thm⦎ = save_thm("z_→_thm", all_z_∀_intro s3);
end;
=TEX
=SML
val _ = push_merge_pcs ["z_sets_alg", "'z_tuples"];
local
	val spec = (rewrite_rule[]z_⤔_def);
	val s1 = rewrite_conv [spec] ⓩf ∈ (X ⤔ Y)⌝;
	val s3 = prove_rule[s1] ⓩ∀ f: 𝕌;
	X: 𝕌; Y: 𝕌⦁
	f ∈ X ⤔ Y
      ⇔ f ∈ X ⇸ Y ∧ (∀ x1, x2 : 𝕌 |
		x1 ∈ dom f ∧ x2 ∈ dom f ⦁ f x1 = f x2 ⇒ x1 = x2)⌝;
in
val ⦏z_⤔_thm⦎ = save_thm("z_⤔_thm", s3);
end;
=TEX
=SML
local
	val spec = (rewrite_rule[]z_↣_def);
	val s1 = rewrite_conv [spec, z_∩_thm, z_⤔_thm] ⓩf ∈ (X ↣ Y)⌝;
	val s2 = (
push_goal([], ⓩf ∈ (X ↣ Y) ⇔ f ∈ (X → Y) ∧
	(∀ x1, x2 :𝕌 |
		x1 ∈ dom f ∧ x2 ∈ dom f ⦁ f x1 = f x2 ⇒ x1 = x2)⌝);
a(rewrite_tac[s1, z_→_thm]);
a(taut_tac);
pop_thm());
in
val ⦏z_↣_thm⦎ = save_thm("z_↣_thm", all_z_∀_intro s2);
end;
=TEX
=SML
local
	val spec = (rewrite_rule[]z_⤀_def);
	val s1 = rewrite_conv [spec] ⓩf ∈ (X ⤀ Y)⌝;
in
val ⦏z_⤀_thm⦎ = save_thm("z_⤀_thm", all_z_∀_intro s1);
end;
=TEX
=SML
local
	val spec = (rewrite_rule[]z_↠_def);
	val s1 = rewrite_conv [spec, z_∩_thm, z_⤀_thm] ⓩf ∈ (X ↠ Y)⌝;
	val s2 = (
push_goal([],
	ⓩf ∈ (X ↠ Y) ⇔ f ∈ (X → Y) ∧ ran f = Y⌝);
a(rewrite_tac[s1, z_→_thm]);
a(taut_tac);
pop_thm());
in
val ⦏z_↠_thm⦎ = save_thm("z_↠_thm", all_z_∀_intro s2);
end;
=TEX
=SML
local
	val spec = (rewrite_rule[]z_⤖_def);
	val s1 = rewrite_conv [spec, z_∩_thm, z_↠_thm, z_↣_thm] ⓩf ∈ (X ⤖ Y)⌝;
	val s2 = (prove_rule[s1]
	ⓩf ∈ (X ⤖ Y) ⇔ f ∈ (X → Y) ∧ ran f = Y ∧
	   (∀ x1, x2 : 𝕌 | x1 ∈ dom f ∧ x2 ∈ dom f ⦁
	    f x1 = f x2 ⇒ x1 = x2)⌝);
in
val ⦏z_⤖_thm⦎ = save_thm("z_⤖_thm", all_z_∀_intro s2);
end;
val _ = pop_pc();
=TEX
\section{PROOF CONTEXTS}
\subsection{Utilities}
The following is in recognition of the problems of
using Z generated constants with discrimination nets.
=SML
local
	val cnv1 = simple_eq_match_conv1 (
		conv_rule z_∀_elim_conv1 z_sets_ext_thm);
in
fun ⦏make_∈_rule⦎ thm = all_∀_intro
	(conv_rule z_∀_elim_conv1
	(conv_rule cnv1
	(all_∀_elim
	(conv_rule(TRY_C z_∀_elim_conv1) thm))));
end;
=TEX
=SML
fun ⦏make_pair_trio_rule⦎ thm = (
let	val s1 = all_∀_intro
		(conv_rule (MAP_C z_sel⋎t_conv)
		(∀_elim ⓩ(p1,p2)⌝
		(all_∀_intro
		(all_∀_elim
		(conv_rule z_∀_elim_conv1 thm)))));
	val s2 = all_∀_intro
		(conv_rule (MAP_C z_sel⋎t_conv)
		(∀_elim ⓩ(p1 ↦ p2)⌝ (all_∀_intro
		(all_∀_elim
		(conv_rule z_∀_elim_conv1 thm)))));
in
	list_∧_intro [thm, s1, s2]
end);
=TEX
=SML
val ⦏∈_operator_clauses2⦎ = [
	z_⤀_thm, z_↠_thm, z_⤖_thm,
	z_⤔_thm, z_↣_thm, z_⇸_thm1, z_→_thm];
=TEX
=SML
fun ⦏thms_to_eqn_cxt⦎ (thms:THM list) : EQN_CXT = (
	flat(map (cthm_eqn_cxt(current_ad_rw_canon())) thms)
);
=TEX
\subsection{Treatment of Membership of Functions}
In designing discrimination net indexes we are careful
to use the knowledge that a tuple must have at least 2 elements.
=SML
val _ = delete_pc "'z_∈_fun" handle Fail _ => ();
val _ = new_pc "'z_∈_fun";
val _ = set_rw_eqn_cxt []"'z_∈_fun";
val _ = add_rw_thms
	([]
	@ ∈_operator_clauses2) "'z_∈_fun";

val pos = (thms_to_eqn_cxt ∈_operator_clauses2)
	@ [];
val neg = map (mk_¬ ** RAND_C) pos;

val _ = set_st_eqn_cxt (pos @ neg) "'z_∈_fun";
val _ = set_sc_eqn_cxt (pos @ neg) "'z_∈_fun";
val _ = set_rw_canons [] "'z_∈_fun";
val _ = set_pr_tac z_basic_prove_tac "'z_∈_fun";
val _ = set_pr_conv z_basic_prove_conv "'z_∈_fun";
val _ = set_cs_∃_convs [] "'z_∈_fun";
val _ = set_∃_vs_thms [] "'z_∈_fun";
val _ = commit_pc "'z_∈_fun";

=TEX
\section{ADDITIONAL WORK}
This material relies on the just created proof contexts.
=SML
val ⦏z_ext_pcs⦎ = ["z_sets_ext", "'z_∈_rel", "'z_∈_fun", "'z_tuples"];
val ⦏z_→_app_thm⦎ = (
push_merge_pcs z_ext_pcs;
set_goal([],ⓩ∀ X:𝕌; Y:𝕌;
	f: 𝕌; x:𝕌⦁
	f ∈ X → Y ∧ x ∈ X ⇒ f x ∈ Y ∧ (x, f x) ∈ f⌝);
a(z_strip_tac THEN z_strip_tac THEN z_strip_tac);
a(z_spec_nth_asm_tac 2 ⓩx⌝);
(* *** Goal "1" *** *)
a(asm_fc_tac[]);
(* *** Goal "2" *** *)
a(lemma_tac ⓩf x = y⌝);
(* *** Goal "2.1" *** *)
a(z_app_eq_tac);
a(REPEAT strip_tac);
a(z_spec_nth_asm_tac 6  ⓩ(x1 ≜ x, x2 ≜ f_a)⌝);
a(z_spec_nth_asm_tac 7  ⓩ(x1 ≜ x, x2 ≜ y)⌝);
a(asm_prove_tac[]);
(* *** Goal "2.2" *** *)
a(asm_rewrite_tac[]);
a(z_spec_nth_asm_tac 6 ⓩ(x1 ≜ x, x2 ≜ y)⌝);
pop_pc();
save_thm ("z_→_app_thm",pop_thm()));
=TEX
=SML
val _ = set_merge_pcs ["z_sets_alg", "'z_∈_rel", "'z_∈_fun", "'z_tuples"];
=TEX
=SML
local
val s1 = conv_rule z_para_pred_conv z_first_def;
val s2 = ∧_left_elim (list_∀_elim[Ua,Ub] s1);
val s3 = s2;
val s4 = z_∀_elim ⓩ(X ≜ ((𝕌 ⦂ ℙ a) × (𝕌 ⦂ ℙ b)),
		Y ≜ (𝕌 ⦂ ℙ a), f ≜ first[(𝕌 ⦂ ℙ a),(𝕌 ⦂ ℙ b)],
		x ≜ (x ⦂ (a × b)))⌝ z_→_app_thm;
val s5 = pure_rewrite_rule [s3] s4;
val s6 = rewrite_rule[]  s5;
val s7 = all_∀_intro s6;
val s8 = z_∀_elim ⓩ(X ≜ ((𝕌 ⦂ ℙ a) × (𝕌 ⦂ ℙ b)),
		Y ≜ (𝕌 ⦂ ℙ b), f ≜ second[(𝕌 ⦂ ℙ a),(𝕌 ⦂ ℙ b)],
		x ≜ (x ⦂ (a × b)))⌝ z_→_app_thm;
val s9 = pure_rewrite_rule [s3] s8;
val s10 = rewrite_rule[]  s9;
val s11 = all_∀_intro s10;
in
val ⦏z_∈_first_thm⦎ = (
set_goal([],ⓩ∀ x : 𝕌 ⦁ x ∈ first ⇔ x.1.1 = x.2⌝);
push_merge_pcs z_ext_pcs;
a(REPEAT z_strip_tac);
(* *** Goal "1" *** *)
a(strip_asm_tac(∧_left_elim s3));
a(DROP_NTH_ASM_T 4 (strip_asm_tac o conv_rule(LEFT_C z_sel⋎t_intro_conv)));
a(strip_asm_tac(∀_elim ⓩx.1⌝ s7));
a(z_spec_nth_asm_tac 4  ⓩ(x ≜ x.1, y1 ≜ x.1.1, y2 ≜ x.2)⌝);
(* *** Goal "2" *** *)
a(conv_tac(LEFT_C (z_sel⋎t_intro_conv)));
a(POP_ASM_T(pure_rewrite_thm_tac o eq_sym_rule));
a(rewrite_tac[s7]);
save_thm("z_∈_first_thm",pop_thm()));

val ⦏z_∈_second_thm⦎ = (
set_goal([],ⓩ∀ x : 𝕌 ⦁ x ∈ second ⇔ x.1.2 = x.2⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(strip_asm_tac(∧_right_elim s3));
a(DROP_NTH_ASM_T 4 (strip_asm_tac o conv_rule(LEFT_C z_sel⋎t_intro_conv)));
a(strip_asm_tac(∀_elim ⓩx.1⌝ s11));
a(z_spec_nth_asm_tac 4  ⓩ(x ≜ x.1, y1 ≜ x.1.2, y2 ≜ x.2)⌝);
(* *** Goal "2" *** *)
a(conv_tac(LEFT_C (z_sel⋎t_intro_conv)));
a(POP_ASM_T(pure_rewrite_thm_tac o eq_sym_rule));
a(rewrite_tac[s11]);
pop_pc();
save_thm("z_∈_second_thm",pop_thm()));
end;
=TEX
=SML
val  ⦏z_→_app_∈_rel_thm⦎ = save_thm("z_→_app_∈_rel_thm", (
push_goal([], ⓩ∀X: 𝕌; Y : 𝕌⦁∀f : X → Y; x : X⦁(x, f x) ∈ f⌝);
a(REPEAT strip_tac);
a(all_fc_tac[z_→_app_thm]);
pop_thm()
));
=TEX
=SML
val  ⦏z_→_app_eq_⇔_∈_rel_thm⦎ = save_thm("z_→_app_eq_⇔_∈_rel_thm", (
push_goal([], ⓩ∀X: 𝕌; Y : 𝕌⦁∀f : X → Y; x : X; z : 𝕌⦁f x = z ⇔ (x, z) ∈ f⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(POP_ASM_T (rewrite_thm_tac o eq_sym_rule));
a(all_fc_tac[z_→_app_∈_rel_thm]);
(* *** Goal "2" *** *)
a(all_asm_ante_tac THEN MERGE_PCS_T1 z_ext_pcs REPEAT strip_tac);
a(z_app_eq_tac);
a(REPEAT strip_tac);
a(MERGE_PCS_T1 z_ext_pcs all_asm_fc_tac[] THEN all_asm_fc_tac[]);
pop_thm()
));
=TEX
=SML
val  ⦏z_→_∈_rel_⇔_app_eq_thm⦎ = save_thm("z_→_∈_rel_⇔_app_eq_thm", (
push_goal([], ⓩ∀X: 𝕌; Y : 𝕌⦁∀f : X → Y; x : X; z : 𝕌⦁(x, z) ∈ f ⇔ f x = z⌝);
a(conv_tac (ONCE_MAP_C eq_sym_conv) THEN accept_tac z_→_app_eq_⇔_∈_rel_thm);
pop_thm()
));
=TEX
\subsection{Simplification}
=SML
val _ = push_merge_pcs ["z_sets_ext", "'z_∈_rel", "'z_∈_fun", "'z_tuples"];

val ⦏z_⇸_clauses⦎ = save_thm("z_⇸_clauses", (
	prove_rule [] ⓩ∀ Y:𝕌 ⦁
	{} ⇸ Y = {{}} ∧
	Y ⇸ {} = {{}}⌝));
=TEX
=SML
val ⦏z_→_clauses⦎ = save_thm("z_→_clauses", (
set_goal( [], ⓩ∀ Y:𝕌 ⦁
	{} → Y = {{}} ∧
	Y → {} = {x: 𝕌 | x = {} ∧ Y = {}}⌝);
a(prove_tac[]);
a(POP_ASM_T ante_tac THEN asm_rewrite_tac[]);
a(⇒_T rewrite_thm_tac);
pop_thm()
));
=TEX
=SML
val ⦏z_⤔_clauses⦎ = save_thm("z_⤔_clauses",
	prove_rule [] ⓩ∀ Y:𝕌 ⦁
	{} ⤔ Y = {{}} ∧
	Y ⤔ {} = {{}}⌝);
=TEX
=SML
val ⦏z_↣_clauses⦎ = save_thm("z_↣_clauses", (
set_goal( [], ⓩ∀ Y:𝕌 ⦁
	{} ↣ Y = {{}} ∧
	Y ↣ {} = {x:𝕌| x = {} ∧ Y = {}}⌝);
a(prove_tac[]);
a(DROP_NTH_ASM_T 2 ante_tac THEN asm_rewrite_tac[]);
a(⇒_T rewrite_thm_tac);
pop_thm()
));

=TEX
=SML
val ⦏z_⤀_clauses⦎ = save_thm("z_⤀_clauses", (
set_goal( [], ⓩ∀ Y:𝕌 ⦁
	{} ⤀ Y = {x:𝕌| x = {} ∧ Y = {}} ∧
	Y ⤀ {} = {{}}⌝);
a(prove_tac[]);
a(POP_ASM_T ante_tac THEN asm_rewrite_tac[]);
a(⇒_T rewrite_thm_tac);
pop_thm()
));

=TEX
=SML
val ⦏z_↠_clauses⦎ = save_thm("z_↠_clauses", (
set_goal( [], ⓩ∀ Y:𝕌 ⦁
	{} ↠ Y = {x:𝕌| x = {} ∧ Y = {}} ∧
	Y ↠ {} = {x:𝕌| x = {} ∧ Y = {}}⌝);
a(prove_tac[]);
(* *** Goal "1" *** *)
a(POP_ASM_T ante_tac THEN asm_rewrite_tac[]);
a(⇒_T rewrite_thm_tac);
(* *** Goal "2" *** *)
a(DROP_NTH_ASM_T 2 ante_tac THEN asm_rewrite_tac[]);
a(⇒_T rewrite_thm_tac);
pop_thm()
));
=TEX
=SML
val ⦏z_⤖_clauses⦎ = save_thm("z_⤖_clauses", (
set_goal( [], ⓩ∀ Y:𝕌 ⦁
	{} ⤖ Y = {x:𝕌| x = {} ∧ Y = {}} ∧
	Y ⤖ {} = {x:𝕌| x = {} ∧ Y = {}}⌝);
a(prove_tac[]);
(* *** Goal "1" *** *)
a(DROP_NTH_ASM_T 2 ante_tac THEN asm_rewrite_tac[]);
a(⇒_T rewrite_thm_tac);
(* *** Goal "2" *** *)
a(DROP_NTH_ASM_T 3 ante_tac THEN asm_rewrite_tac[]);
a(⇒_T rewrite_thm_tac);
pop_thm()
));

val _ = pop_pc();
=TEX
=SML
fun ⦏maybe_strip⦎ (index,cnv) = (
	if type_of index =: BOOL
	then (index,cnv)
	else fail "" 0 []
);
local
	val setty = type_of ⓩ{}⌝;
in
fun ⦏add_∈⦎ ((index,cnv)::rest) = (
	(let val tyms = type_match (type_of index) setty @ [(ⓣ'a⌝,ⓣ'a⌝)];
		val x = variant (frees index) (mk_var("x",fst(hd tyms)));
	in
		((mk_z_∈(x,index), ∈_C cnv) :: (index,cnv) :: add_∈ rest)
	end)
	handle (Fail _) =>
	((index,cnv) :: add_∈ rest)
) | add_∈ [] = [];
end;

val z_fun_alg_eqn_cxt = add_∈(thms_to_eqn_cxt [z_⇸_clauses, z_→_clauses, z_⤔_clauses,
	z_↣_clauses, z_↠_clauses, z_⤀_clauses, z_⤖_clauses]);

val z_fun_alg_eqn_cxt_for_strip = mapfilter maybe_strip z_fun_alg_eqn_cxt;


val _ = delete_pc "'z_fun_alg" handle Fail _ => ();
val _ = new_pc "'z_fun_alg";
val _ = set_rw_eqn_cxt z_fun_alg_eqn_cxt"'z_fun_alg";
val _ = add_rw_thms ([]) "'z_fun_alg";

val pos = z_fun_alg_eqn_cxt_for_strip;
val neg = map (mk_¬ ** RAND_C) pos;

val _ = set_st_eqn_cxt (pos @ neg) "'z_fun_alg";
val _ = set_sc_eqn_cxt (pos @ neg) "'z_fun_alg";
val _ = set_rw_canons [] "'z_fun_alg";
val _ = set_pr_tac z_basic_prove_tac "'z_fun_alg";
val _ = set_pr_conv z_basic_prove_conv "'z_fun_alg";
val _ = set_cs_∃_convs [] "'z_fun_alg";
val _ = set_∃_vs_thms [] "'z_fun_alg";
val _ = commit_pc "'z_fun_alg";

=TEX
=SML
val _ = delete_pc "z_fun_ext" handle Fail _ => ();
val _ = new_pc "z_fun_ext";
val _ = merge_pcs ["z_rel_ext","'z_fun_alg",
	"'z_∈_fun"] "z_fun_ext";
val _ = commit_pc "z_fun_ext";
=TEX
\subsection{Type Inference By Theorems}
=SML
val _ = push_pc "z_fun_ext";
=TEX
We use $z_spec_nth_asm_tac$ for speed, $all\_asm\_fc\_tac$
still works (?).
=SML
val ⦏z_fun_app_clauses⦎ = save_thm("z_fun_app_clauses", (
set_goal([],ⓩ∀ f:𝕌; x:𝕌;y:𝕌; X:𝕌;Y:𝕌 ⦁
	(f ∈ X ⇸ Y ∨ f ∈ X ⤔ Y ∨ f ∈ X ⤀ Y ∨
	 f ∈ X → Y ∨ f ∈ X ↣ Y ∨ f ∈ X ↠ Y ∨ f ∈ X ⤖ Y)
	∧ (x,y) ∈ f
	⇒ f x = y⌝);
a(REPEAT strip_tac THEN all_asm_fc_tac[] THEN z_app_eq_tac
	THEN REPEAT strip_tac THEN all_asm_fc_tac[]);
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 6 ⓩ(x ≜ x, y1 ≜ f_a, y2 ≜ y)⌝);
(* *** Goal "2" *** *)
a(z_spec_nth_asm_tac 7 ⓩ(x ≜ x, y1 ≜ f_a, y2 ≜ y)⌝);
(* *** Goal "3" *** *)
a(z_spec_nth_asm_tac 7 ⓩ(x ≜ x, y1 ≜ f_a, y2 ≜ y)⌝);
(* *** Goal "4" *** *)
a(z_spec_nth_asm_tac 7 ⓩ(x ≜ x, y1 ≜ f_a, y2 ≜ y)⌝);
(* *** Goal "5" *** *)
a(z_spec_nth_asm_tac 8 ⓩ(x ≜ x, y1 ≜ f_a, y2 ≜ y)⌝);
(* *** Goal "6" *** *)
a(z_spec_nth_asm_tac 8 ⓩ(x ≜ x, y1 ≜ f_a, y2 ≜ y)⌝);
(* *** Goal "7" *** *)
a(z_spec_nth_asm_tac 9 ⓩ(x ≜ x, y1 ≜ f_a, y2 ≜ y)⌝);

pop_thm()));
=TEX
=SML
val ⦏z_fun_∈_clauses⦎ = save_thm("z_fun_∈_clauses", (
set_goal([],ⓩ∀ f:𝕌; x:𝕌; X:𝕌;Y:𝕌 ⦁
	((f ∈ X → Y ∨ f ∈ X ↣ Y ∨ f ∈ X ↠ Y ∨ f ∈ X ⤖ Y)
	∧ x ∈ X
	⇒ f x ∈ Y)
	∧
	((f ∈ X ⇸ Y ∨ f ∈ X ⤔ Y ∨ f ∈ X ⤀ Y)
	∧ x ∈ dom f
	⇒ f x ∈ Y)⌝);
a(PC_T1 "z_sets_alg" rewrite_tac[z_dom_thm] THEN
	REPEAT (PC_T "z_sets_alg" strip_tac) THEN
	GET_NTH_ASM_T 2 strip_asm_tac);
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 1 ⓩx⌝);
(* *** Goal "1.1" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "1.2" *** *)
a(all_asm_fc_tac[z_fun_app_clauses]);
a(all_var_elim_asm_tac1);
(* *** Goal "2" *** *)
a(z_spec_nth_asm_tac 2 ⓩx⌝);
(* *** Goal "2.1" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "2.2" *** *)
a(all_asm_fc_tac[z_fun_app_clauses]);
a(all_var_elim_asm_tac1);
(* *** Goal "3" *** *)
a(z_spec_nth_asm_tac 2 ⓩx⌝);
(* *** Goal "3.1" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "3.2" *** *)
a(all_asm_fc_tac[z_fun_app_clauses]);
a(all_var_elim_asm_tac1);
(* *** Goal "4" *** *)
a(z_spec_nth_asm_tac 3 ⓩx⌝);
(* *** Goal "4.1" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "4.2" *** *)
a(all_asm_fc_tac[z_fun_app_clauses]);
a(all_var_elim_asm_tac1);
(* *** Goal "5" *** *)
a(all_asm_fc_tac[]);
a(all_asm_fc_tac[z_fun_app_clauses]);
a(all_var_elim_asm_tac1);
(* *** Goal "6" *** *)
a(all_asm_fc_tac[]);
a(all_asm_fc_tac[z_fun_app_clauses]);
a(all_var_elim_asm_tac1);
(* *** Goal "7" *** *)
a(all_asm_fc_tac[]);
a(all_asm_fc_tac[z_fun_app_clauses]);
a(all_var_elim_asm_tac1);
pop_thm()));
=TEX
=SML
val ⦏z_fun_dom_clauses⦎ = save_thm("z_fun_dom_clauses", (
set_goal([],ⓩ∀ f:𝕌; X:𝕌;Y:𝕌 ⦁
	((f ∈ X ⇸ Y ∨ f ∈ X ⤔ Y ∨ f ∈ X ⤀ Y)
	⇒ dom f ⊆ X)
 	∧
	((f ∈ X → Y ∨ f ∈ X ↣ Y ∨ f ∈ X ↠ Y ∨ f ∈ X ⤖ Y)
	⇒ dom f = X)⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "2" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "3" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "4" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "5" *** *)
a(z_spec_nth_asm_tac 2 ⓩx1⌝);
(* *** Goal "5.1" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "5.2" *** *)
a(contr_tac THEN all_asm_fc_tac[]);
(* *** Goal "6" *** *)
a(z_spec_nth_asm_tac 3 ⓩx1⌝ THEN all_asm_fc_tac[]);
(* *** Goal "7" *** *)
a(z_spec_nth_asm_tac 3 ⓩx1⌝);
(* *** Goal "7.1" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "7.2" *** *)
a(contr_tac THEN all_asm_fc_tac[]);
(* *** Goal "8" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "9" *** *)
a(z_spec_nth_asm_tac 3 ⓩx1⌝);
(* *** Goal "9.1" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "9.2" *** *)
a(contr_tac THEN all_asm_fc_tac[]);
(* *** Goal "10" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "11" *** *)
a(z_spec_nth_asm_tac 4 ⓩx1⌝);
(* *** Goal "11.1" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "11.2" *** *)
a(contr_tac THEN all_asm_fc_tac[]);

pop_thm()));
=TEX
=SML
val ⦏z_fun_ran_clauses⦎ = save_thm("z_fun_ran_clauses", (
set_goal([],ⓩ∀ f:𝕌; X:𝕌;Y:𝕌 ⦁
	((f ∈ X → Y ∨ f ∈ X ⇸ Y ∨ f ∈ X ⤔ Y ∨ f ∈ X ↣ Y)
	⇒ ran f ⊆ Y)
	∧
	((f ∈ X ⤀ Y ∨ f ∈ X ↠ Y ∨ f ∈ X ⤖ Y)
	⇒ ran f = Y)⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "2" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "3" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "4" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "5" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "6" *** *)
a(z_spec_nth_asm_tac 2 ⓩx1⌝);
(* *** Goal "6.1" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "6.2" *** *)
a(contr_tac THEN all_asm_fc_tac[]);
(* *** Goal "7" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "8" *** *)
a(z_spec_nth_asm_tac 2 ⓩx1⌝);
(* *** Goal "8.1" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "8.2" *** *)
a(contr_tac THEN all_asm_fc_tac[]);
(* *** Goal "9" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "10" *** *)
a(z_spec_nth_asm_tac 3 ⓩx1⌝);
(* *** Goal "10.1" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "10.2" *** *)
a(contr_tac THEN all_asm_fc_tac[]);
pop_thm()));
=TEX
=SML
val ⦏z_fun_app_if_thm⦎ : THM = (
set_goal([], ⓩ∀f : 𝕌; c : 𝕌; x, y : 𝕌⦁
	f(if c then x else y) = if c then f x else f y⌝);
a(REPEAT strip_tac);
a(cases_tac ⓩc⌝ THEN asm_rewrite_tac[]);
save_pop_thm "z_fun_app_if_thm"
);
=TEX
=SML
val _ = pop_pc();
=TEX
\section{EPILOG}
=SML
end (* of structure ZFunctions *);
open ZFunctions;
=TEX
\twocolumn[\section{INDEX}]
\small
\printindex

\end{document}


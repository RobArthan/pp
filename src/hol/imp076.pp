=IGN
********************************************************************************
imp076.doc: this file is part of the PPHol system

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

\def\Title{Implementation of the Proof Contexts I}

\def\AbstractText{This document contains the implementation of the proof contexts supplied for theories up to theory ``hol''.}

\def\Reference{DS/FMU/IED/IMP076}

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
%% LaTeX2e port: \TPPtitle{Implementation of the Proof Contexts I}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP076}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.23 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2011/07/11 15:53:06 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.Blackburn & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document contains the implementation
%% LaTeX2e port: of the proof contexts supplied for theories up to theory ``hol''.}
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
\item [Issues 1.1 (1992/05/19)]
First version.
\item [Issues 1.3 (1992/05/26)]
Stopped existence prover duplications.
\item [Issue 1.4 (1992/05/26), 1.5 (1992/05/26) (26th May 1992)]
Renamings from version 1.5 of DS/FMU/IED/WRK038.
\item [Issue 1.6 (1992/05/27),1.7 (1992/05/27) (27th May 1992)]
Added existence prover preprocessors for sets and characters.
\item [Issue 1.8 (1992/06/04) (4th June 1992)]
Changed order of assumption processing in $supplied\-\_prove\-\_tac$.
\item [Issue 1.9 (1992/06/24) (24th June 1992)]
Changes to match issue 1.6 of \cite{DS/FMU/IED/DTD076}.
\item [Issue 1.10 (1992/06/25) (25th June 1992)]
Minor changes to title and text.
\item [Issue 1.11 (1992/06/26) (26th June 1992)]
Added
=INLINEFT
⊢ ∀ x ⦁ x = x
=TEX
into $basic\-\_prove\-\_tac$ resolution.
\item [Issue 1.12 (1992/07/06) (5th July 1992)]
Added support for $IsL$ and $IsR$.
\item [Issue 1.13 (1992/08/11) (11th August 1992)]
Added partial evaluation to $basic\_prove\_conv$.
\item [Issue 1.14 (1993/01/11) (11th January 1993)]
Changes $'ℕ$ to push theorems through $¬$.
\item [Issue 1.15 (1993/01/27) (27th January 1993)]
Added $sets\_ext1$ etc.
\item [Issue 1.16 (1993/02/02) (1st February 1993)]
Added variable elimination to $basic\_prove\_tac$.
\item[Issue 1.18 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.19 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.20 (2006/12/10)] Added support for symmetric difference operator.
\item[Issue 1.21 (2011/02/06)] Added proof contexts to control forward chaining.
\item[Issue 1.22 (2011/02/19)] Allowed for change to proof context interface.
\item[Issue 1.23 (2011/07/11)] Added proof context to enable higher-order rewriting.
\item[Issue 1.24 (2012/03/27)] Extended
=INLINEFT
'pair
=TEX
\ to deal with the new constant
=INLINEFT
Pair
=TEX
.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
None.
\pagebreak
\section{GENERAL}
\subsection{Scope}
Various proof contexts are called for in Appendix A
of \cite{DS/FMU/IED/HLD011},
and are given a detailed design in \cite{DS/FMU/IED/DTD076}.
This document provides a detailed design for these contexts.
\subsection{Introduction}
\subsubsection{Purpose and Background}
The mechanism of proof contexts is discussed in \cite{DS/FMU/IED/HLD009}, and is implemented in \cite{DS/FMU/IED/DTD051}.
There are however many proof contexts provided within
the HOL PDS, implemented in various subsystems.
The sum of these should provide a coherent set,
with some proof contexts being appropriate
to be pushed onto the proof context stack in their
own right, and others allowing detail in creating
proof contexts based in part on existing context material.

This document implements the proof contexts supplied for theories
up to ``hol'',
though some of the work is started in
\cite{DS/FMU/IED/IMP026},\cite{DS/FMU/IED/IMP028}, and \cite{DS/FMU/IED/IMP029}.
\subsubsection{Dependencies}
This document takes its signature from \cite{DS/FMU/IED/DTD076}.
\subsubsection{Deficiencies}
None known.
\subsubsection{Possible Enhancements}
None known.

\section{PREAMBLE}
=SML
structure ⦏ProofContexts1⦎ : ProofContexts1 = struct
=TEX
=SML
val _ = open_theory "basic_hol";
val _ = push_merge_pcs ["'propositions","'simple_abstractions"];
=TEX
\section{TOOLS}
\subsection{A Basic Proof Tactic}

=SML
open Resolution;
val xvar = mk_var("x",mk_vartype "'a");
val eq_refl_thm = simple_∀_intro xvar (refl_conv xvar);

fun ⦏basic_prove_tac⦎ (thms: THM list) : TACTIC = (
	TRY_T all_var_elim_asm_tac THEN
	DROP_ASMS_T (MAP_EVERY (strip_asm_tac o
	(fn thm => rewrite_rule thms thm
		handle (Fail _) => thm)) o rev) THEN
	(TRY_T (rewrite_tac thms)) THEN
	REPEAT strip_tac THEN
	TRY_T all_var_elim_asm_tac THEN_TRY
	(basic_res_tac2 3 [eq_refl_thm]
	 ORELSE_T basic_res_tac3 3 [eq_refl_thm])
);
=TEX
=SML
fun ⦏basic_prove_conv⦎ (thms: THM list) : CONV = (
let val tac = rewrite_tac thms;
in
(fn tm =>
(⇔_t_intro (
tac_proof(([],tm),
	TRY_T tac  THEN
	REPEAT strip_tac THEN
	TRY_T all_var_elim_asm_tac THEN_TRY
	(basic_res_tac2 3 [eq_refl_thm]
	 ORELSE_T basic_res_tac3 3 [eq_refl_thm]))
)
handle complaint =>
divert complaint "tac_proof" "basic_prove_conv" 76001 [fn () => string_of_term tm]))
end);
=TEX
Convert a list of theorems to equation contexts appropriate
to this document.
=SML
fun ⦏thms_to_eqn_cxt⦎ (thms:THM list) : EQN_CXT = (
	flat(map (cthm_eqn_cxt initial_rw_canon) thms)
);
=TEX
\section{THE PROOF CONTEXTS}
\subsection{Inserting the Basic Existence Prover}
This is best done by a dedicated proof context.
=SML
val _ = open_theory "basic_hol";
val _ = new_pc ⦏"'basic_prove_∃_conv"⦎;
val _ = set_cs_∃_convs [basic_prove_∃_conv] "'basic_prove_∃_conv";
val _ = commit_pc "'basic_prove_∃_conv";
=TEX
\subsection{Control of Forward Chaining}
=SML
val _ = open_theory "basic_hol";
val _ = new_pc ⦏"'mmp1"⦎;
val _ = set_mmp_rule ⇒_match_mp_rule1 "'mmp1";
val _ = commit_pc "'mmp1";
=TEX
=SML
val _ = new_pc ⦏"'mmp2"⦎;
val _ = set_mmp_rule ⇒_match_mp_rule1 "'mmp2";
val _ = commit_pc "'mmp2";
=TEX
\subsection{Control of Higher-Order Rewriting}
=SML
val _ = open_theory "basic_hol";
val _ = new_pc ⦏"'sho_rw"⦎;
val _ = set_rw_eqm_rule simple_ho_thm_eqn_cxt "'sho_rw";
val _ = commit_pc "'sho_rw";
=TEX
\subsection{Proof Contexts Built In Theory ``basic$\_$hol''}
=SML
val _ = pop_pc();
val _ = open_theory "basic_hol";
val _ = push_merge_pcs ["'propositions","'paired_abstractions"];
=TEX
The following extends the work started
in \cite{DS/FMU/IED/IMP028} and continued in \cite{DS/FMU/IED/IMP026}.
=SML
val _ = set_pr_tac basic_prove_tac "'simple_abstractions";
val _ = set_pr_conv basic_prove_conv "'simple_abstractions";
val _ = commit_pc ⦏"'simple_abstractions"⦎;
=TEX
The following extends the work started
in \cite{DS/FMU/IED/IMP029} and continued in \cite{DS/FMU/IED/IMP026}.
=SML
val _ = set_pr_tac basic_prove_tac "'paired_abstractions";
val _ = set_pr_conv basic_prove_conv "'paired_abstractions";
val _ = commit_pc ⦏"'paired_abstractions"⦎;
=TEX
The following extends the work started
in \cite{DS/FMU/IED/IMP028} and continued in \cite{DS/FMU/IED/IMP026}.
=SML
val _ = set_pr_tac (fn _ => taut_tac) "'propositions";
val _ = set_pr_conv (fn _ => taut_conv) "'propositions";
val _ = commit_pc ⦏"'propositions"⦎;
=TEX
=SML
val _ = new_pc ⦏"'fun_ext"⦎;
val _ = set_rw_eqn_cxt (thms_to_eqn_cxt[ext_thm]) "'fun_ext";
val _ = set_st_eqn_cxt (thms_to_eqn_cxt[ext_thm]) "'fun_ext";
val _ = set_sc_eqn_cxt (thms_to_eqn_cxt[ext_thm]) "'fun_ext";
val _ = set_pr_tac (fn _ => taut_tac) "'fun_ext";
val _ = set_pr_conv (fn _ => taut_conv) "'fun_ext";
val _ = commit_pc "'fun_ext";
=TEX
=SML
val _ = new_pc ⦏"predicates"⦎;
val _ = merge_pcs ["'basic_prove_∃_conv","'propositions",
	"'paired_abstractions"] "predicates";
val _ = commit_pc "predicates";
=TEX
=SML
val _ = new_pc ⦏"predicates1"⦎;
val _ = merge_pcs ["'basic_prove_∃_conv","'propositions",
	"'fun_ext", "'paired_abstractions"] "predicates1";
val _ = commit_pc "predicates1";
=TEX
=SML
val _ = new_pc ⦏"'pair"⦎;
local
	val aux1 = tac_proof(([],
⌜∀ x y a b p fu fc fg
    ⦁ Fst (x, y) = x
      ∧ Snd (x, y) = y
      ∧ ((a, b) = (x, y) ⇔ a = x ∧ b = y)
      ∧ (Fst p, Snd p) = p
      ∧ Curry fc x y = fc (x, y)
      ∧ Uncurry fu (x, y) = fu x y
      ∧ Uncurry fu p = fu (Fst p) (Snd p)
      ∧ Pair fg x = (Fst fg x, Snd fg x)⌝),
		basic_prove_tac [pair_clauses]);
	val aux2 = tac_proof(([],
⌜∀ a b x y ⦁ ((a, b) = (x, y) ⇔ a = x ∧ b = y)⌝),
		basic_prove_tac [pair_clauses]);
	val aux3 = tac_proof(([],
⌜∀ x y p ⦁
	Fst (x, y) = x ∧
	Snd (x, y) = y ∧
	(Fst p, Snd p) = p⌝),
		basic_prove_tac [pair_clauses]);
in
val _ = set_rw_eqn_cxt (thms_to_eqn_cxt[aux1]) "'pair";
val _ = set_st_eqn_cxt (thms_to_eqn_cxt[aux2]) "'pair";
val _ = set_sc_eqn_cxt (thms_to_eqn_cxt[aux2]) "'pair";
val _ = set_∃_vs_thms [(",",([⌜Fst⌝,⌜Snd⌝],aux3))] "'pair";
end;
val _ = set_pr_tac basic_prove_tac "'pair";
val _ = set_pr_conv basic_prove_conv "'pair";
val _ = commit_pc "'pair";
=TEX
=SML
val _ = new_pc ⦏"'pair1"⦎;
local
	val aux1 = tac_proof(([],
⌜∀ a b p
    ⦁ ((a, b) = p ⇔ a = Fst p ∧ b = Snd p)
      ∧ (p = (a, b) ⇔ Fst p = a ∧ Snd p = b)⌝),
		basic_prove_tac [pair_clauses]);
in
val _ = set_rw_eqn_cxt (thms_to_eqn_cxt[aux1]) "'pair1";
val _ = set_st_eqn_cxt (thms_to_eqn_cxt[aux1]) "'pair1";
val _ = set_sc_eqn_cxt (thms_to_eqn_cxt[aux1]) "'pair1";
end;
val _ = set_pr_tac basic_prove_tac "'pair1";
val _ = set_pr_conv basic_prove_conv "'pair1";
val _ = commit_pc "'pair1";
=TEX
=SML
val _ = new_pc ⦏"'ℕ"⦎;
val _ = set_rw_eqn_cxt (thms_to_eqn_cxt[≥_def, greater_def,
	plus_clauses, times_clauses,
	≤_clauses, less_clauses, minus_clauses]) "'ℕ";
val pos = (thms_to_eqn_cxt[≥_def, greater_def,
	plus_clauses, times_clauses,
	≤_clauses, less_clauses, minus_clauses]);
val neg = mapfilter (mk_¬ ** RAND_C) pos;
val _ = set_st_eqn_cxt (pos @ neg) "'ℕ";
val _ = set_sc_eqn_cxt (pos @ neg) "'ℕ";
val _ = set_∃_cd_thms [prim_rec_thm] "'ℕ";
val _ = set_pr_tac basic_prove_tac "'ℕ";
val _ = set_pr_conv basic_prove_conv "'ℕ";
val _ = commit_pc "'ℕ";
=TEX
=SML
val _ = new_pc ⦏"'ℕ_lit"⦎;
val _ = set_rw_eqn_cxt [
	(⌜x + y⌝, plus_conv),
	(⌜x * y⌝, times_conv),
	(⌜x - y⌝, minus_conv),
	(⌜x Div y⌝, div_conv),
	(⌜x Mod y⌝, mod_conv),
	(⌜x ≤ y⌝, ≤_conv),
	(⌜x < y⌝, less_conv),
	(⌜x > y⌝, greater_conv),
	(⌜x ≥ y⌝, ≥_conv),
	(⌜x = y⌝, ℕ_eq_conv)] "'ℕ_lit";
val _ = set_st_eqn_cxt [
	(⌜x ≤ y⌝, ≤_conv),
	(⌜x < y⌝, less_conv),
	(⌜x > y⌝, greater_conv),
	(⌜x ≥ y⌝, ≥_conv),
	(⌜x = y⌝, ℕ_eq_conv)] "'ℕ_lit";
val _ = set_sc_eqn_cxt [
	(⌜x ≤ y⌝, ≤_conv),
	(⌜x < y⌝, less_conv),
	(⌜x > y⌝, greater_conv),
	(⌜x ≥ y⌝, ≥_conv),
	(⌜x = y⌝, ℕ_eq_conv)] "'ℕ_lit";
val _ = set_pr_tac basic_prove_tac "'ℕ_lit";
val _ = set_pr_conv basic_prove_conv "'ℕ_lit";
val _ = commit_pc "'ℕ_lit";
=TEX
=SML
val _ = new_pc ⦏"'list"⦎;
val _ = set_rw_eqn_cxt (thms_to_eqn_cxt[list_clauses]) "'list";
local
	val aux = tac_proof(([],⌜∀ x1 x2 list1 list2
    ⦁ ¬ Cons x1 list1 = []
      ∧ ¬ [] = Cons x1 list1
      ∧ (Cons x1 list1 = Cons x2 list2 ⇔ x1 = x2 ∧ list1 = list2)⌝),
		basic_prove_tac[list_clauses]);
in
val _ = set_st_eqn_cxt (thms_to_eqn_cxt[aux]) "'list";
val _ = set_sc_eqn_cxt (thms_to_eqn_cxt[aux]) "'list";
end;
val _ = set_∃_cd_thms [list_prim_rec_thm] "'list";
val _ = set_pr_tac basic_prove_tac "'list";
val _ = set_pr_conv basic_prove_conv "'list";
val _ = commit_pc "'list";
=TEX
=SML
val _ = new_pc ⦏"'char"⦎;
val _ = set_rw_eqn_cxt [(⌜x = y⌝, char_eq_conv),
	(⌜x = y⌝, string_eq_conv)] "'char";
val _ = set_st_eqn_cxt [(⌜x = y⌝, char_eq_conv),
	(⌜x = y⌝, string_eq_conv)] "'char";
val _ = set_sc_eqn_cxt [(⌜x = y⌝, char_eq_conv),
	(⌜x = y⌝, string_eq_conv)] "'char";
val _ = set_pr_tac basic_prove_tac "'char";
val _ = set_pr_conv basic_prove_conv "'char";
val _ = set_cs_∃_convs [pure_rewrite_conv [string_conv ⌜""⌝]]
	"'char";
val _ = commit_pc "'char";
=TEX
=SML
val _ = new_pc ⦏"basic_hol"⦎;
val _ = merge_pcs ["predicates","'pair","'ℕ","'list","'char"] "basic_hol";
val _ = commit_pc "basic_hol";
=TEX
=SML
val _ = new_pc ⦏"basic_hol1"⦎;
val _ = merge_pcs ["predicates1","'pair","'pair1","'ℕ","'ℕ_lit",
	"'list","'char"] "basic_hol1";
val _ = commit_pc "basic_hol1";
=TEX
\subsection{Proof Contexts Built In Theory ``combin''}
=SML
val _ = pop_pc();
val _ = open_theory "combin";
val _ = push_pc "predicates";
=TEX
=SML
val _ = new_pc ⦏"'combin"⦎;
val _ = set_rw_eqn_cxt (thms_to_eqn_cxt[comb_i_def, comb_k_def, o_def, o_i_thm]) "'combin";
val _ = set_pr_tac basic_prove_tac "'combin";
val _ = set_pr_conv basic_prove_conv "'combin";
val _ = commit_pc "'combin";
=TEX
\subsection{Proof Contexts Built In Theory ``one''}
=SML
val _ = pop_pc();
val _ = open_theory "one";
val _ = push_pc "predicates";
=TEX
=SML
val _ = new_pc ⦏"'one"⦎;
val _ = set_rw_eqn_cxt (thms_to_eqn_cxt[one_def, one_fns_thm]) "'one";
local
	val aux1 = tac_proof(([],⌜∀ x y : ONE ⦁ (x = y) ⇔ T⌝),
		basic_prove_tac[one_def]);
	val aux2 = tac_proof(([],⌜∀ x y : 'a → ONE ⦁ (x = y) ⇔ T⌝),
		basic_prove_tac[one_fns_thm]);
	val pos = (thms_to_eqn_cxt[aux1,aux2]);
	val neg = map (mk_¬ ** RAND_C) pos;
in
val _ = set_st_eqn_cxt (pos @ neg) "'one";
val _ = set_sc_eqn_cxt (pos @ neg) "'one";
end;
val _ = set_pr_tac basic_prove_tac "'one";
val _ = set_pr_conv basic_prove_conv "'one";
val _ = commit_pc "'one";
=TEX
\subsection{Proof Contexts Built In Theory ``sets''}
=SML
val _ = pop_pc();
val _ = open_theory "sets";
val _ = push_pc "predicates";
=TEX
=SML
val _ = new_pc ⦏"'sets_alg"⦎;
local
val aux1 = tac_proof(([],⌜
	∀ x a b
	⦁ ¬ x ∈ {}
        ∧ x ∈ Universe
        ∧ (a ∈ {b} ⇔ a = b)⌝),
	rewrite_tac[sets_clauses]);
val new_rw =
	(⌜x ∈ $SetComp y⌝, ∈_comp_conv) ::
	(⌜x ∈ $Insert y z⌝, ∈_enum_set_conv) ::
	(flat(map (cthm_eqn_cxt initial_rw_canon)
	[complement_clauses, ∪_clauses, ∩_clauses, set_dif_clauses, ⊖_clauses,
	⊆_clauses, ⊂_clauses, ⋃_clauses, ⋂_clauses, ℙ_clauses,aux1]));
in
val _ = set_rw_eqn_cxt new_rw "'sets_alg";
end;
local
val pos_bits =
	[(⌜x ∈ $SetComp y⌝, ∈_comp_conv),
	(⌜x ∈ $Insert y z⌝, ∈_enum_set_conv)] @
	(thms_to_eqn_cxt [∈_in_clauses, ⊆_clauses, ⊂_clauses]);
val neg_strips = map (mk_¬ ** RAND_C) pos_bits;
val new_strips = pos_bits @ neg_strips;
in
val _ = set_st_eqn_cxt new_strips "'sets_alg";
val _ = set_sc_eqn_cxt new_strips "'sets_alg";
end;
val _ = set_pr_tac basic_prove_tac "'sets_alg";
val _ = set_pr_conv basic_prove_conv "'sets_alg";
val _ = set_cs_∃_convs
	[TOP_MAP_C (all_∃_uncurry_conv AND_OR_C sets_simple_∃_conv)]
	"'sets_alg";
val _ = commit_pc "'sets_alg";
=TEX
=SML
val _ = new_pc ⦏"'sets_ext"⦎;
val _ = set_rw_eqn_cxt ((⌜x ∈ $SetComp y⌝, ∈_comp_conv) ::
	(⌜x ∈ $Insert y z⌝, ∈_enum_set_conv) ::
	(thms_to_eqn_cxt [∈_in_clauses,sets_ext_clauses])) "'sets_ext";
local
val pos_bits =
	[(⌜x ∈ $SetComp y⌝, ∈_comp_conv),
	(⌜x ∈ $Insert y z⌝, ∈_enum_set_conv)] @
	(thms_to_eqn_cxt [∈_in_clauses,sets_ext_clauses]);
val neg_strips = map (mk_¬ ** RAND_C) pos_bits;
val new_strips = pos_bits @ neg_strips;
in
val _ = set_st_eqn_cxt new_strips "'sets_ext";
val _ = set_sc_eqn_cxt new_strips "'sets_ext";
end;
val _ = set_pr_tac basic_prove_tac "'sets_ext";
val _ = set_pr_conv basic_prove_conv "'sets_ext";
val _ = set_cs_∃_convs
	[TOP_MAP_C (all_∃_uncurry_conv AND_OR_C sets_simple_∃_conv)]
	"'sets_ext";
val _ = commit_pc "'sets_ext";
=TEX
=SML
val _ = new_pc ⦏"'sets_ext1"⦎;
val _ = set_rw_eqn_cxt ([(⌜x ∈ $SetComp y⌝, ∈_comp_conv),
	(⌜x ∈ $Insert y z⌝, ∈_enum_set_conv),
	(⌜a = b⌝, sets_eq_conv),
	(⌜a ⊆ b⌝, ⊆_conv),
	(⌜a ⊂ b⌝, ⊂_conv)] @
	(thms_to_eqn_cxt [∈_in_clauses])) "'sets_ext1";
local
val pos_bits =
	[(⌜x ∈ $SetComp y⌝, ∈_comp_conv),
	(⌜x ∈ $Insert y z⌝, ∈_enum_set_conv),
	(⌜a = b⌝, sets_eq_conv),
	(⌜a ⊆ b⌝, ⊆_conv),
	(⌜a ⊂ b⌝, ⊂_conv),
	(⌜x ∈ $Insert y z⌝, ∈_enum_set_conv)] @
	(thms_to_eqn_cxt [∈_in_clauses]);
val neg_strips = map (mk_¬ ** RAND_C) pos_bits;
val new_strips = pos_bits @ neg_strips;
in
val _ = set_st_eqn_cxt new_strips "'sets_ext1";
val _ = set_sc_eqn_cxt new_strips "'sets_ext1";
end;
val _ = set_pr_tac basic_prove_tac "'sets_ext1";
val _ = set_pr_conv basic_prove_conv "'sets_ext1";
val _ = set_cs_∃_convs
	[TOP_MAP_C (all_∃_uncurry_conv AND_OR_C sets_simple_∃_conv)]
	"'sets_ext1";
val _ = commit_pc "'sets_ext1";
=TEX
Now the two complete proof contexts for sets:
=SML
val _ = new_pc ⦏"sets_ext"⦎;
val _ = merge_pcs ["predicates","'sets_ext"] "sets_ext";
val _ = commit_pc "sets_ext";
=TEX
=SML
val _ = new_pc ⦏"sets_ext1"⦎;
val _ = merge_pcs ["predicates","'sets_ext1"] "sets_ext1";
val _ = commit_pc "sets_ext1";
=TEX
\subsection{Proof Contexts Built In Theory ``sum''}
=SML
val _ = pop_pc();
val _ = open_theory "sum";
val _ = push_pc "predicates";
=TEX
=SML
val _ = new_pc ⦏"'sum"⦎;
local
val aux1 = tac_proof(([],⌜∀ x1 x2 y1 y2 z
    ⦁ (InL x1 = InL x2 ⇔ x1 = x2)
      ∧ (InR y1 = InR y2 ⇔ y1 = y2)
      ∧ ¬ InL x1 = InR y1
      ∧ ¬ InR y1 = InL x1
      ∧ OutL (InL x1) = x1
      ∧ OutR (InR y1) = y1
      ∧ IsL(InL x1) ∧ IsR(InR y1)
      ∧ ¬ IsL(InR y1) ∧ ¬ IsR(InL x1)⌝),
	basic_prove_tac[sum_clauses]);
val aux2 = tac_proof(([],⌜∀ x1 x2 y1 y2 z
    ⦁ (InL x1 = InL x2 ⇔ x1 = x2)
      ∧ (InR y1 = InR y2 ⇔ y1 = y2)
      ∧ ¬ InL x1 = InR y1
      ∧ ¬ InR y1 = InL x1
      ∧ IsL(InL x1) ∧ IsR(InR y1)
      ∧ ¬ IsL(InR y1) ∧ ¬ IsR(InL x1)⌝),
	basic_prove_tac[sum_clauses]);
in
val _ = set_rw_eqn_cxt (thms_to_eqn_cxt[aux1]) "'sum";
val _ = set_st_eqn_cxt (thms_to_eqn_cxt[aux2]) "'sum";
val _ = set_sc_eqn_cxt (thms_to_eqn_cxt[aux2]) "'sum";
end;
val _ = set_∃_cd_thms [(rewrite_rule[ext_thm, o_def] sum_fns_thm)]
	"'sum";
val _ = set_pr_tac basic_prove_tac "'sum";
val _ = set_pr_conv basic_prove_conv "'sum";
val _ = commit_pc "'sum";
=TEX
\subsection{Proof Contexts Built In Theory ``hol''}
=SML
val _ = pop_pc();
val _ = open_theory "hol";
val _ = push_pc "predicates";
=TEX
=SML
val _ = new_pc ⦏"hol"⦎;
val _ = merge_pcs ["basic_hol","'sum","'combin","'sets_alg"] "hol";
val _ = commit_pc "hol";
=TEX
=SML
val _ = new_pc ⦏"hol1"⦎;
val _ = merge_pcs ["basic_hol1","'one","'sum","'combin","'sets_ext"] "hol1";
val _ = commit_pc "hol1";
=TEX
=SML
val _ = new_pc ⦏"hol2"⦎;
val _ = merge_pcs ["basic_hol1","'one","'sum","'combin","'sets_ext1"] "hol2";
val _ = commit_pc "hol2";

=TEX
\section{EPILOGUE}
Leave the proof context being ``basic$\_$hol'' and current theory $hol$.
=SML
val _ = open_theory "basic_hol";
val _ = repeat pop_pc;
val _ = set_pc "initial";
val _ = push_pc "basic_hol";
=TEX
=SML
end; (* of structure ProofContexts1 *)
open ProofContexts1;
=TEX
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}



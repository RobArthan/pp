=IGN
********************************************************************************
imp071.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  ℤ $Date: 2002/10/17 15:10:58 $ $Revision: 1.15 $ $RCSfile: imp071.doc,v $
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

\def\Title{Implementation for the Theory of Relations}

\def\AbstractText{This document creates the theory ``relation''.}

\def\Reference{DS/FMU/IED/IMP071}

\def\Author{R.B.Jones}


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
%% LaTeX2e port: \TPPtitle{Implementation for the Theory of Relations}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Implementation for the Theory of Relations}
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP071}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.15 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2002/10/17 15:10:58 $%
%% LaTeX2e port: }}  %% Mandatory field
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{R.B.Jones & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document creates the theory ``relation''.}
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
%% LaTeX2e port: \begin{center}
%% LaTeX2e port: 
%% LaTeX2e port: \bf Copyright \copyright\ : Lemma 1 Ltd. \number\year
%% LaTeX2e port: 
%% LaTeX2e port: \end{center}

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

\item[Issues 1.1 (1992/05/07) to 1.9 (1992/06/16) ]
	First drafts of the document.

\item[Issue 1.10]
	Add proofs of theorems.
	Add proof contexts.
	Reorder clauses in some theorems.

\item[Issue 1.15 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.16 (2002/10/17)] PPHol-specific updates for open source release
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}

\section{GENERAL}
\subsection{Scope}
This document contains an implementation of the theory of relations.
The design is in~\cite{DS/FMU/IED/DTD071}.

\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains an implementation of the theory of relations.
\subsubsection{Dependencies}
This document takes its signature from~\cite{DS/FMU/IED/DTD071}.
\subsubsection{Deficiencies}
None known.
\subsubsection{Possible Enhancements}
=IGN
None known.
=TEX
Provide a proof context for algebraic proof work involving binary relations.
\section{THE THEORY ``bin\_rel''}

=SML
structure ⦏BinRelTheory⦎ : BinRelTheory = struct
=TEX

=SML
val _ = open_theory "bin_rel";
val bin_rel_defs = map snd(get_defns "-");
val _ = push_pc "sets_ext";
=TEX

=SML
val _ = push_goal([],
⌜
∀	a : 'a SET; b : 'b SET;
	x x1 :'a; y : 'b; z : 'c;
	r  r1 r2 : 'a ↔ 'b; s : 'b ↔ 'c; t : 'a ↔ 'c;	q : 'a ↔ 'a;
	f:'a → 'b
⦁
		(x ↦ y ∈ r ⇔ (x, y) ∈ r)
	∧	((x, y) ∈ (a × b) ⇔ x ∈ a ∧ y ∈ b)
	∧	(r ∈ (a ↔ b) ⇔ r ⊆ (a × b))
	∧	(x ∈ Dom r ⇔ ∃y⦁ (x, y) ∈ r)
	∧	(y ∈ Ran r ⇔ ∃x⦁ (x, y) ∈ r)
	∧	((x, x1) ∈ Id a ⇔ x = x1 ∧ x ∈ a)
	∧	((x, y) ∈ Graph f ⇔ y = f x)
	∧	((x, z) ∈ r R_⨾_R s ⇔ ∃y⦁ (x, y) ∈ r ∧ (y, z) ∈ s)
	∧	((x, z) ∈ (s R_o_R r) ⇔ (x, z) ∈ r R_⨾_R s)
	∧	((x, y) ∈ a ◁ r ⇔ x ∈ a ∧ (x, y) ∈ r)
	∧	((x, y) ∈ r ▷ b ⇔ y ∈ b ∧ (x, y) ∈ r)
	∧	((x, y) ∈ a ⩤ r ⇔ ¬x ∈ a ∧ (x, y) ∈ r)
	∧	((x, y) ∈ r ⩥ b ⇔ ¬y ∈ b ∧ (x, y) ∈ r)
	∧	((y, x) ∈ InvRel r ⇔ (x, y) ∈ r)
	∧	(y ∈ r Image a ⇔ ∃x⦁ x ∈ a ∧ (x, y) ∈ r)
	∧	(q ∈ Reflexive ⇔ ∀x⦁(x, x) ∈ q)
	∧	(q ∈ Symmetric ⇔ ∀x1 x2⦁(x1, x2) ∈ q ⇒ (x2, x1) ∈ q)
	∧	(q ∈ Transitive ⇔
			∀x1 x2 x3⦁(x1, x2) ∈ q ∧ (x2, x3) ∈ q ⇒ (x1, x3) ∈ q)
	∧	(r ∈ Injective ⇔ ∀x1 x2 y⦁(x1, y) ∈ r ∧ (x2, y) ∈ r ⇒ x1 = x2)
	∧	(r ∈ Surjective b ⇔ (∀y⦁ y ∈ b ⇔ ∃x⦁(x, y) ∈ r))
	∧	(r ∈ Total a ⇔ (∀x⦁ x ∈ a ⇔ ∃y⦁(x, y) ∈ r))
	∧	(r ∈ Functional ⇔ ∀x y1 y2⦁(x, y1) ∈ r ∧ (x, y2) ∈ r ⇒ y1 = y2)
	∧	((x, y) ∈ r1 ⊕ r2 ⇔ (x, y) ∈ (Dom r2 ⩤ r1) ∪ r2)
	∧	((x, (y, z)) ∈ RelCombine r t ⇔ (x, y) ∈ r ∧ (x, z) ∈ t)
⌝
);
=TEX

=SML
val _ = a(rewrite_tac bin_rel_defs THEN prove_tac nil);

val ⦏rel_∈_in_clauses⦎ = save_thm("rel_∈_in_clauses", pop_thm());
=TEX


=SML
val _ = push_goal([],
⌜
∀	r1 r2 : 'a ↔ 'b
⦁
		((r1 ⊂ r2) ⇔ ((∀ x y ⦁ (x, y) ∈ r1 ⇒ (x, y) ∈ r2)
			∧ (∃ x y ⦁ ¬((x, y) ∈ r1) ∧ ((x, y) ∈ r2))))
	∧	((r1 ⊆ r2) ⇔ ∀ x y ⦁ (x, y) ∈ r1 ⇒ (x, y) ∈ r2)
	∧	((r1 = r2) ⇔ (∀ x y ⦁ (x, y) ∈ r1 ⇔ (x, y) ∈ r2))
⌝
);

val _ = a(prove_tac bin_rel_defs);
(* *** Goal "1" *** *)
val _ = a(∃_tac ⌜Fst x⌝
	THEN ∃_tac ⌜Snd x⌝
	THEN prove_tac [pair_clauses]);
(* *** Goal "2" *** *)
val _ = a(list_spec_nth_asm_tac 4 [⌜Fst x'⌝, ⌜Snd x'⌝]
	THEN swap_nth_asm_concl_tac 1
	THEN prove_tac [pair_clauses]);
(* *** Goal "3" *** *)
val _ = a(list_spec_nth_asm_tac 2 [⌜Fst x⌝, ⌜Snd x⌝]
	THEN swap_nth_asm_concl_tac 1
	THEN prove_tac [pair_clauses]);
(* *** Goal "4" *** *)
val _ = a(list_spec_nth_asm_tac 2 [⌜Fst x⌝, ⌜Snd x⌝]
	THEN swap_nth_asm_concl_tac 2
	THEN prove_tac [pair_clauses]);
(* *** Goal "5" *** *)
val _ = a(list_spec_nth_asm_tac 2 [⌜Fst x⌝, ⌜Snd x⌝]
	THEN swap_nth_asm_concl_tac 1
	THEN prove_tac [pair_clauses]);

val ⦏bin_rel_ext_clauses⦎ = save_thm("bin_rel_ext_clauses", pop_thm());
=TEX


=SML
val inv_rel_thm = save_thm("inv_rel_thm", tac_proof((nil, ⌜ ∀ f a b ⦁
	(	f↗~↕ ∈ Functional ⇔ f ∈ Injective )
	∧ (	f↗~↕ ∈ Injective ⇔ f ∈ Functional )
	∧ (	f↗~↕ ∈ (Surjective a) ⇔ f ∈ (Total a) )
	∧ (	f↗~↕ ∈ (Total b) ⇔ f ∈ (Surjective b) )
⌝),
	prove_tac bin_rel_defs
));
=TEX


=SML
val ⦏bin_rel_∅_universe_thm⦎ = save_thm("bin_rel_∅_universe_thm", (

push_goal([],⌜
∀	f g r0;
	r1;
	a; b
⦁
(	Dom r0 = {} ⇔ r0 = {} 			) ∧ (	Ran r0 = {} ⇔ r0 = {} )
∧ (	Dom {} = {} 					) ∧ (	Ran {} = {} )
∧ (	Dom Universe = Universe 			) ∧ (	Ran Universe = Universe )
∧ (	Id r0 = {} ⇔ r0 = {} )
∧ (	Id {} = {} )
∧ (	(r0 ↗~↕) = {} ⇔ r0 = {} 			) ∧ (	{} ↗~↕ = {} )
∧ (	Universe ↗~↕ = Universe )
∧ (	r0 ⨾ {} = {} 					) ∧ (	{} ⨾ r0 = {} )
∧ (	{} = r0 ⨾ r1 ⇔ Ran r0 ∩ Dom r1 = {} )
∧ (	r0 ⨾ r1 = {} ⇔ Ran r0 ∩ Dom r1 = {} )
∧ (	RelCombine r0 {} = {} 			) ∧ (	RelCombine {} r0 = {} )
∧ (	r0 Image {} = {} 				) ∧ (	{} Image a = {} )
∧ (	f ⊕ {} = f 					) ∧ (	{} ⊕ f = f )
∧ (	f ⊕ g = {} ⇔ (f = {} ∧ g = {}) )
∧ (	(f = {} ∧ g = {}) ⇒ f ⊕ g = {} )
∧ (	f ⊕ g = {} ⇔ (f = {} ∧ g = {}) )
∧ (	f ⊕ Universe = Universe )
∧ (	Universe ⩤ r0 = {} 		) ∧ (	a ⩤ {} = {} 		) ∧ (	{} ⩤ r0 = r0 )
∧ (	Universe ◁ r0 = r0 		) ∧ (	a ◁ {} = {} 		) ∧ (	{} ◁ r0 = {} )
∧ (	r0 ⩥ Universe = {} 		) ∧ (	{} ⩥ b = {} 		) ∧ (	r0 ⩥ {} = r0 )
∧ (	r0 ▷ Universe = r0 		) ∧ (	{} ▷ b = {} 		) ∧ (	r0 ▷ {} = {} )
⌝);

a(REPEAT ∀_tac THEN PC_T1 "hol" rewrite_tac(bin_rel_ext_clauses::bin_rel_defs));
a(prove_tac nil);
(* *** Goal "1" *** *)
a(list_spec_nth_asm_tac 2 [⌜Fst x⌝,⌜Snd x⌝]);
a(swap_nth_asm_concl_tac 1 THEN rewrite_tac [pair_clauses] THEN strip_tac);
(* *** Goal "2" *** *)
a(list_spec_nth_asm_tac 1 [⌜x⌝,⌜y⌝]);
a(list_spec_nth_asm_tac 3 [⌜x⌝,⌜y'⌝]);

pop_thm()));
=TEX


=IGN
val _ = push_goal(nil, ⌜
∀ a:'a SET; b:'b SET; r x xy y
⦁ (	Dom (Insert (x, y) r) = Insert x (Dom r) )
∧ (	Dom (Insert xy r) = Insert (Fst xy) (Dom r) )
∧ (	Ran (Insert (x, y) r) = Insert y (Ran r) )
∧ (	Ran (Insert xy r) = Insert (Snd xy) (Ran r) )
∧ (	Id (Insert x a) = Insert (x, x) (Id a) )
∧ (	Insert (x, y) r Image a = r Image a ∪ (if x ∈ a then {y} else {}) )
∧ (	Insert (x, y) r ⩥ b = (r ⩥ b) ∪ (if ¬ y ∈ b then {(x, y)} else {}) )
∧ (	Insert (x, y) r ▷ b = (r ▷ b) ∪ (if y ∈ b then {(x, y)} else {}) )
∧ (	a ⩤ Insert (x, y) r = (a ⩤ r) ∪ (if ¬ x ∈ a then {(x, y)} else {}) )
∧ (	a ◁ Insert (x, y) r = (a ◁ r) ∪ (if x ∈ a then {(x, y)} else {}) )
⌝);

val _ = a(REPEAT ∀_tac
	THEN cases_tac ⌜(x:'a) ∈ a⌝
	THEN cases_tac ⌜(y:'b) ∈ b⌝
	THEN (PC_T1 "predicates1" asm_rewrite_tac nil)
	THEN asm_prove_tac (bin_rel_ext_clauses::pair_clauses::bin_rel_defs)
	THEN contr_tac
	THEN_TRY (DROP_ASMS_T(MAP_EVERY(fn th =>
			if is_eq(concl th)
			then asm_tac(conv_rule(TRY_C(ASYM_C eq_sym_conv)) th)
			else ante_tac th)))
	THEN_TRY asm_rewrite_tac nil
	THEN REPEAT strip_tac
	THEN_TRY (GET_NTH_ASM_T 3 (rewrite_thm_tac o eq_sym_rule) THEN strip_tac)
);
val _ = a(GET_NTH_ASM_T 3 (rewrite_thm_tac o eq_sym_rule) THEN strip_tac);
val _ = a(GET_NTH_ASM_T 3 (rewrite_thm_tac o eq_sym_rule) THEN strip_tac);
val _ = a(GET_NTH_ASM_T 3 (rewrite_thm_tac o eq_sym_rule) THEN strip_tac);
val _ = a(GET_NTH_ASM_T 3 (rewrite_thm_tac o eq_sym_rule) THEN strip_tac);

val ⦏bin_rel_insert_thm⦎ = save_thm("bin_rel_insert_thm", pop_thm());
=TEX

=SML
val ⦏bin_rel_insert_thm⦎ = save_thm("bin_rel_insert_thm", tac_proof((nil,
⌜ ∀ a:'a SET; b:'b SET; r x xy y
⦁ (	Dom (Insert (x, y) r) = Insert x (Dom r) )
∧ (	Dom (Insert xy r) = Insert (Fst xy) (Dom r) )
∧ (	Ran (Insert (x, y) r) = Insert y (Ran r) )
∧ (	Ran (Insert xy r) = Insert (Snd xy) (Ran r) )
∧ (	Id (Insert x a) = Insert (x, x) (Id a) )
∧ (	Insert (x, y) r Image a = r Image a ∪ (if x ∈ a then {y} else {}) )
∧ (	Insert (x, y) r ⩥ b = (r ⩥ b) ∪ (if ¬ y ∈ b then {(x, y)} else {}) )
∧ (	Insert (x, y) r ▷ b = (r ▷ b) ∪ (if y ∈ b then {(x, y)} else {}) )
∧ (	a ⩤ Insert (x, y) r = (a ⩤ r) ∪ (if ¬ x ∈ a then {(x, y)} else {}) )
∧ (	a ◁ Insert (x, y) r = (a ◁ r) ∪ (if x ∈ a then {(x, y)} else {}) )
∧ (	(Insert (x, y) r) ↗~↕ = Insert (y, x) (r ↗~↕) )
⌝),
	REPEAT ∀_tac
	THEN cases_tac ⌜(x:'a) ∈ a⌝
	THEN cases_tac ⌜(y:'b) ∈ b⌝
	THEN (PC_T1 "predicates1" asm_rewrite_tac nil)
	THEN asm_prove_tac (bin_rel_ext_clauses::pair_clauses::bin_rel_defs)
	THEN contr_tac
	THEN_TRY (DROP_ASMS_T(MAP_EVERY(fn th =>
			if is_eq(concl th)
			then asm_tac(conv_rule(TRY_C(ASYM_C eq_sym_conv)) th)
			else ante_tac th)))
	THEN_TRY asm_rewrite_tac nil
	THEN REPEAT strip_tac
	THEN_TRY (GET_NTH_ASM_T 3 (rewrite_thm_tac o eq_sym_rule) THEN strip_tac)
));
=TEX


=SML
val ⦏↦_def⦎ = get_defn"-""↦";
val ⦏×_def⦎ = get_defn"-""×";
val ⦏↔_def⦎ = get_defn"-""↔";
val ⦏dom_def⦎ = get_defn"-""Dom";
val ⦏ran_def⦎ = get_defn"-""Ran";
val ⦏id_def⦎ = get_defn"-""Id";
val ⦏graph_def⦎ = get_defn"-""Graph";
val ⦏⨾_def⦎ = get_defn"-""⨾";
val ⦏r_⨾_r_def⦎ = get_defn"-""R_⨾_R";
val ⦏r_o_r_def⦎ = get_defn"-""R_o_R";
val ⦏◁_def⦎ = get_defn"-""◁";
val ⦏▷_def⦎ = get_defn"-""▷";
val ⦏⩤_def⦎ = get_defn"-""⩤";
val ⦏⩥_def⦎ = get_defn"-""⩥";
val ⦏inv_rel_def⦎ = get_defn"-""InvRel";
val ⦏image_def⦎ = get_defn"-""Image";
val ⦏reflexive_def⦎ = get_defn"-""Reflexive";
val ⦏symmetric_def⦎ = get_defn"-""Symmetric";
val ⦏transitive_def⦎ = get_defn"-""Transitive";
val ⦏injective_def⦎ = get_defn"-""Injective";
val ⦏surjective_def⦎ = get_defn"-""Surjective";
val ⦏total_def⦎ = get_defn"-""Total";
val ⦏functional_def⦎ = get_defn"-""Functional";
val ⦏⊕_def⦎ = get_defn"-""⊕";
val ⦏tc_def⦎ = get_defn"-""↗+↕";
val ⦏rtc_def⦎ = get_defn"-""↗*↕";
val ⦏rel_combine_def⦎ = get_defn"-""RelCombine";
=TEX
\subsection{Derived Definitions}
\subsection{End of Theory ``relation''}
\section{CONVERSIONS}

\section{From imp076.doc: Implementation of the Proof Contexts I}

=SML
fun ⦏thms_to_eqn_cxt⦎ (thms:THM list) : EQN_CXT = (
	flat(map (cthm_eqn_cxt initial_rw_canon) thms)
);
=TEX

\section{PROOF CONTEXTS}

\subsection{Proof Context: $'bin\_rel\_ext$}

The extensional context is good for proving results involving the
operators introduced in this theory.

=SML
val _ = (delete_pc "'bin_rel"; "Deleted original proof context: 'bin_rel")
	handle _ => "Could not delete original proof context: 'bin_rel";
=TEX

=SML
val _ =
let
	val pos_bits =
		thms_to_eqn_cxt[rel_∈_in_clauses, inv_rel_thm]
	;
	val neg_strips = map (mk_¬ ** RAND_C) pos_bits;
	val new_strips = pos_bits @ neg_strips;
in
	new_pc					⦏"'bin_rel"⦎;
	set_st_eqn_cxt	new_strips		"'bin_rel";
	set_sc_eqn_cxt	new_strips		"'bin_rel";
	set_rw_eqn_cxt	pos_bits		"'bin_rel";
	add_rw_thms	bin_rel_defs		"'bin_rel";
	set_pr_tac	basic_prove_tac		"'bin_rel";
	set_pr_conv	basic_prove_conv	"'bin_rel";
	commit_pc				"'bin_rel";

	()
end;
=TEX

\subsection{Proof Context: $'bin\_rel\_alg$}

The number of formula that are suitable for algebraic reasoning about
binary relations seems large, here we capture a number of them.

The first source is the rules from Spivey's Z~Reference Manual~\cite{Spivey92}.
The second source is found by compiling a matrix of all the
set theory values (from~\cite{DS/FMU/IED/DTD044}) on one dimension plus
all the binary relation values on the other dimension and considering their
interactions.

--- To be provided.

\section{FINALE}

=SML
end; (* of structure BinRelTheory *)
open BinRelTheory;
=TEX

\newpage
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}


%  dtd092.doc  ℤ $Date$ $Revision$ $RCSfile$
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

\def\Title{Further Theorems About Sets}

\def\AbstractText{This document contains the implementation for further theorems about sets.}

\def\Reference{DS/FMU/IED/IMP092}

\def\Author{R.D. Arthan}


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
%% LaTeX2e port: \TPPtitle{Further Theorems About Sets}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP092}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision$%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: %\TPPdate{}  %% Mandatory field (with sensible default)
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{R.D.~Arthan & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.B.Jones & HAT Team Leader}
%% LaTeX2e port: \TPPabstract{
%% LaTeX2e port: This document contains the implementation for further theorems
%% LaTeX2e port: about sets.}
%% LaTeX2e port: %\TPPabstractB{}
%% LaTeX2e port: %\TPPabstractC{}
%% LaTeX2e port: %\TPPabstractD{}
%% LaTeX2e port: %\TPPabstractE{}
%% LaTeX2e port: %\TPPabstractF{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	Library}}
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
%% LaTeX2e port: \bf Copyright \copyright\ : International Computers Ltd \number\year
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
\item [Issues 1.1 (1993/01/24) -- 1.5 (1993/02/19)] Initial drafts.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
Further results could be added (Schroeder-Bernstein?).
\pagebreak
\section{GENERAL}
\subsection{Scope}
This document contains the implementation for further
theorems about sets and relations for \ProductHOL.
The detailed design for this material is given in \cite{DS/FMU/IED/HLD011}.

\subsection{Introduction}
This document develops some more advanced theorems about sets and relations
than those offered in the basic theoriues of
\cite{DS/FMU/IED/DTD044,DS/FMU/IED/DTD044}. The theorems are Zorn's lemma
(in a purely set-theoretic guise and as the more general statement about
partial orderings) and the well-ordering theorem.
\subsubsection{Purpose and Background}
See \cite{DS/FMU/IED/HLD011}.
\subsubsection{Dependencies}
This document depends on the theory design support
tools in \cite{DS/FMU/IED/DTD035} and
on the theory of relations in \cite{DS/FMU/IED/IMP071}
\subsubsection{Possible Enhancements}
None known.
\subsubsection{Deficiencies}
None known.
=TEX
\section{PRELIMINARIES}

=SML
open_theory"set_thms";
set_pc"sets_ext";
=TEX

\section{CONSISTENCY PROOFS}
=SML
set_pc"sets_ext";
push_consistency_goal⌜Choose⌝;
a(prove_∃_tac THEN REPEAT strip_tac);
a(cases_tac⌜a' = {}⌝ THEN asm_prove_tac[]);
save_consistency_thm ⌜Choose⌝ (pop_thm());
=TEX
\section{RED TAPE}
=SML
structure SetThmsTheory : SetThmsTheory = struct
=TEX
\section{ZORN'S LEMMA (SPECIAL CASE)}

This section presents the proof of the difficult part of Zorn's
lemma as given in section 16 of the book ``Naive Set Theory''
by Paul R. Halmos, \cite{Halmos74}.

Recall that the informal statement of Zorn's
lemma is the following:

{\bf Theorem} If $a$ is a partially ordered set such that
every chain in $a$ has an upper bound, then $a$ contains a maximal element.


As stated in the detailed design we adopt the following variable naming
conventions, which differ from those of \cite{Halmos74}:
$x$, $y$, $z$ will be elements, $a$, $b$, $c$, sets, and $t$, $u$ and $v$,
sets of sets. E.g., Halmos's $\cal X$ will be $u$ throughout,
his $A$ will be $a$, and his towers, $\cal T$, will be $t$.


\subsection{Proof Strategy}
What we have to prove is the following conjecture:
=SML
val zorn_⊆_conj = ⌜
	∀u : 'a SET SET⦁
		¬u = {}
	∧	SubsetClosed u
	∧	NestClosed u
	⇒	∃a⦁Maximal⋎⊆ u a⌝;
=TEX
We define in turn the various auxiliary notions used by Halmos.
Note that these are all parameterised in HOL by the set of sets $u$.
$hat$ is the operation written as a grave accent in Halmos.
We will prove various lemmas which have some of these defining equations
as assumptions.
=SML
val ⦏hat_def⦎ = ⌜∀u:'a SET SET; a : 'a SET⦁ hat u a = {x | ¬x ∈ a ∧ a ∪ {x} ∈ u}⌝;
val ⦏g_def⦎ = ⌜∀u:'a SET SET; a : 'a SET⦁
		g u a = if ¬hat u a = {} then	a ∪ {Choose (hat u a)} else a⌝;
val ⦏tower_def⦎ = ⌜∀u:'a SET SET; t : 'a SET SET⦁
		tower u t
	⇔	t ⊆ u
	∧	{} ∈ t
	∧	(∀a⦁ a ∈ t ⇒ g u a ∈ t)
	∧	(∀v⦁ v ⊆ t ∧ Nest v ⇒ ⋃v ∈ t)⌝;
val ⦏t0_def⦎ = ⌜∀u:'a SET SET⦁
		t0 u = ⋂{t : 'a SET SET | tower u t}⌝;
val ⦏comparable_def⦎ = ⌜∀u:'a SET SET; c : 'a SET⦁
		comparable u c ⇔ c ∈ t0 u ∧ ∀a⦁a ∈ t0 u ⇒ a ⊆ c ∨ c ⊆ a⌝;
=TEX
The proof comprises 9 lemmas as follows, $conj\cal N$ being the conclusion
of the theorem in ML variable $lemma\cal N$. The first two lemmas are
required to prove the main lemma which is lemma 3. Lemmas 4 to 7 all
give implications in which the succedent is the same
as the antecedent of the implication in the preceding lemma. The lemmas
all have assumptions which are some or all of the definitions of $g$ etc.
together with the hypotheses on $u$ as required. Lemma 8 concludes that
the antecedent for lemma 7 is true given these assumptions. Chaining
lemmas 3 to 8 together then gives us that the desired maximal set
with assumptions which are the hypotheses of the theorem together
with the definitions of $g$ etc. Since none of $g$, $hat$, $tower$ or
$t0$ appear free in the resulting theorem except in their defining
assumption, the theorem is valid without those assumptions
(and the tactic $local\_def\_tac$ below inverts this valid inference
by introducing such an assumption given the desired defining
universally quantified equation).
=SML
val ⦏conj1⦎ = ([⌜SubsetClosed u⌝, hat_def, g_def],
	⌜∀a: 'a SET⦁a ∈ u ⇒ (Maximal⋎⊆ u a ⇔ (g u a) = a)⌝);
val ⦏conj2⦎ = ([⌜¬(u : 'a SET SET)  = {}⌝, ⌜SubsetClosed u⌝, ⌜NestClosed u⌝,
		hat_def, g_def, tower_def, t0_def],
	⌜tower u ((t0 : 'a SET SET → 'a SET SET) u) : BOOL⌝);
val ⦏conj3⦎ = ([⌜¬(u : 'a SET SET) = {}⌝, ⌜SubsetClosed u⌝, ⌜NestClosed u⌝,
		hat_def, g_def, tower_def, t0_def],
	⌜Nest ((t0 : 'a SET SET → 'a SET SET) u) ⇒ ∃a⦁ Maximal⋎⊆ u a⌝);
val ⦏conj4⦎ = ([comparable_def],
	⌜(∀c : 'a SET⦁ c ∈ t0 u ⇒ comparable u c)
		⇒ Nest ((t0 : 'a SET SET → 'a SET SET) u)⌝);
val ⦏conj5⦎ = ([⌜¬(u : 'a SET SET) = {}⌝, ⌜SubsetClosed u⌝, ⌜NestClosed u⌝,
		hat_def, g_def, tower_def, t0_def, comparable_def],
	⌜tower u {c | comparable u c}
		⇒ (∀c: 'a SET⦁ c ∈ t0 u ⇒ comparable (u : 'a SET SET) c)⌝);
val ⦏conj6⦎ = ([⌜¬(u : 'a SET SET) = {}⌝, ⌜SubsetClosed u⌝, ⌜NestClosed u⌝,
		hat_def, g_def, tower_def, t0_def, comparable_def],
	⌜(∀c:'a SET⦁ comparable (u : 'a SET SET) c ⇒ comparable u (g u c))
		⇒ tower u {c | comparable u c}⌝);
val ⦏conj7⦎ = ([⌜¬(u : 'a SET SET) = {}⌝, ⌜SubsetClosed u⌝, ⌜NestClosed u⌝,
		hat_def, g_def, tower_def, t0_def, comparable_def],
	⌜(∀c:'a SET⦁ comparable (u : 'a SET SET) c ⇒ tower u {a | a ∈ t0 u ∧ (a ⊆ c ∨ g u c ⊆ a)})
		⇒ (∀c⦁ comparable u c ⇒ comparable u (g u c))⌝);
val ⦏conj8⦎ = ([⌜¬(u : 'a SET SET) = {}⌝, ⌜SubsetClosed u⌝, ⌜NestClosed u⌝,
		hat_def, g_def, tower_def, t0_def, comparable_def],
	⌜∀c:'a SET⦁ comparable (u : 'a SET SET) c ⇒ tower u {a | a ∈ t0 u ∧ (a ⊆ c ∨ g u c ⊆ a)}⌝);
=TEX
=SML
fun ⦏loc_def_tac⦎ (defn : TERM) : TACTIC = (
	let	val fnc = (fst o strip_app o fst o dest_eq o snd o strip_∀) defn;
		val exi = mk_∃(fnc, defn);
		val thm = pc_rule"predicates" prove_∃_rule exi;
	in	strip_asm_tac thm
	end
);
=TEX
\subsection{The Proof}
=SML
val _ = (
set_pc"predicates";
set_goal conj1;
a(asm_rewrite_tac[get_spec⌜Maximal⋎⊆⌝] THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(cases_tac ⌜¬ {x|¬x ∈ a ∧ a ∪ {x} ∈ u} = {}⌝ THEN asm_rewrite_tac[]);
a(i_contr_tac THEN POP_ASM_T ante_tac THEN PC_T "sets_ext" strip_tac);
a(lemma_tac ⌜a ⊆ a ∪ {x}⌝ THEN1 PC_T1 "sets_ext" prove_tac[]);
a(all_asm_fc_tac[]);
a(list_asm_ante_tac [⌜¬ x ∈ a⌝, ⌜a ∪ {x} = a⌝] THEN PC_T1 "sets_ext" prove_tac[]);
(* *** Goal "2" *** *)
a(rewrite_tac[pc_rule1"sets_ext" prove_rule[] ⌜b = a ⇔ a ⊆ b ∧ b ⊆ a⌝]
	THEN REPEAT strip_tac);
a(PC_T1 "sets_ext" REPEAT strip_tac);
a(GET_ASM_T ⌜SubsetClosed u⌝ (asm_tac o rewrite_rule[get_spec⌜SubsetClosed⌝]));
a(lemma_tac ⌜a ∪ {x} ⊆ b⌝ THEN1
	(list_asm_ante_tac [⌜a ⊆ b⌝, ⌜x ∈ b⌝] THEN PC_T1"sets_ext"prove_tac[]
		THEN asm_rewrite_tac[]));
a(rename_tac[] THEN all_asm_fc_tac[]);
a(swap_nth_asm_concl_tac 7);
a(lemma_tac⌜¬ {x|¬x ∈ a ∧ a ∪ {x} ∈ u} = {}⌝ THEN1
	(PC_T1"sets_ext" REPEAT strip_tac));
(* *** Goal "2.1" *** *)
a(∃_tac⌜x⌝ THEN PC_T1"sets_ext" REPEAT strip_tac);
(* *** Goal "2.2" *** *)
a(asm_rewrite_tac[] THEN POP_ASM_T ante_tac THEN rewrite_tac[get_spec⌜Choose⌝]);
a(PC_T1"sets_ext" REPEAT strip_tac);
a(∃_tac⌜Choose {x|¬ x ∈ a ∧ a ∪ {x} ∈ u}⌝ THEN PC_T1"sets_ext" REPEAT strip_tac)
);
val ⦏lemma1⦎ = pop_thm ();
=TEX
=SML
val _ = (
set_pc"sets_ext";
set_goal conj2;
a(PC_T1 "predicates" asm_rewrite_tac[] THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(POP_ASM_T (strip_asm_tac o ∀_elim⌜u⌝));
(* *** Goal "1.1" *** *)
a(i_contr_tac THEN REPEAT_N 3 (POP_ASM_T ante_tac));
a(rewrite_tac[get_spec⌜SubsetClosed⌝] THEN REPEAT strip_tac);
a(list_spec_nth_asm_tac 2 [⌜x⌝, ⌜{}⌝]);
(* *** Goal "1.2" *** *)
a(i_contr_tac THEN POP_ASM_T ante_tac THEN rewrite_tac[get_spec⌜Choose⌝]);
a(cases_tac⌜¬ Choose {x|¬ x ∈ a ∧ a ∪ {x} ∈ u} ∈ a
	∧ a ∪ {Choose {x|¬ x ∈ a ∧ a ∪ {x} ∈ u}} ∈ u⌝ THEN asm_rewrite_tac[]);
(* *** Goal "1.3" *** *)
a(LIST_GET_NTH_ASM_T [1,2,3,6] (MAP_EVERY ante_tac));
a(rewrite_tac[get_spec⌜NestClosed⌝] THEN REPEAT strip_tac);
a(all_asm_fc_tac[]);
(* *** Goal "2" *** *)
a(all_asm_fc_tac[] THEN all_asm_fc_tac[]);
(* *** Goal "3" *** *)
a(all_asm_fc_tac[] THEN all_asm_fc_tac[]);
a(lemma_tac⌜v ⊆ s⌝);
(* *** Goal "3.1" *** *)
a(REPEAT strip_tac THEN all_asm_fc_tac[]);
(* *** Goal "3.2" *** *)
a(all_asm_fc_tac[])
);
val ⦏lemma2⦎ = pop_thm ();
=TEX
=SML
val _ = (
set_pc"predicates";
set_goal conj3;
a(ante_tac lemma2 THEN GET_ASM_T tower_def rewrite_thm_tac);
a(REPEAT strip_tac);
a(∃_tac⌜⋃(t0 u)⌝);
a(lemma_tac ⌜⋃(t0 u) ∈ t0 u⌝);
(* *** Goal "1" *** *)
a(DROP_NTH_ASM_T 2 bc_thm_tac);
a(PC_T1"sets_ext" REPEAT strip_tac);
(* *** Goal "2" *** *)
a(lemma_tac ⌜⋃(t0 u) ∈ u⌝ THEN1 PC_T1 "sets_ext" asm_prove_tac[]);
a(ALL_FC_T1 id_canon rewrite_tac [lemma1]);
a(PC_T1"sets_ext" REPEAT strip_tac);
(* *** Goal "2.1" *** *)
a(all_asm_fc_tac[]);
a(LIST_GET_NTH_ASM_T [2,3] (MAP_EVERY ante_tac) THEN PC_T1"sets_ext"prove_tac[]);
(* *** Goal "2.2" *** *)
a(GET_ASM_T g_def rewrite_thm_tac);
a(CASES_T⌜¬ hat u (⋃ (t0 u)) = {}⌝ rewrite_thm_tac
	THEN PC_T"sets_ext" contr_tac THEN all_asm_fc_tac[])
);
val ⦏lemma3⦎ = pop_thm ();
=TEX
=SML
val _ = (
set_pc"predicates";
set_goal conj4;
a(asm_rewrite_tac[get_spec⌜Nest⌝, prove_rule[]⌜∀p q⦁(p ⇒ p ∧ q) ⇔ (p ⇒ q)⌝]);
a(REPEAT strip_tac THEN all_asm_fc_tac[])
);
val ⦏lemma4⦎ = pop_thm ();
=TEX
=SML
val _ = (
set_pc"sets_ext";
set_goal conj5;
a(LIST_GET_ASM_T [tower_def, t0_def] rewrite_tac);
a(REPEAT strip_tac);
a(SPEC_NTH_ASM_T 1 ⌜{c | comparable u c}⌝ (strip_asm_tac o rewrite_rule[])
	THEN all_asm_fc_tac[])
);
val ⦏lemma5⦎ = pop_thm ();
=TEX
=SML
val _ = (
set_pc"sets_ext";
set_goal conj6;
a(LIST_GET_ASM_T [tower_def] rewrite_tac);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(all_asm_fc_tac[]);
a(ante_tac lemma2 THEN LIST_GET_ASM_T [tower_def] rewrite_tac);
a(REPEAT strip_tac THEN asm_fc_tac[]);
(* *** Goal "2" *** *)
a(LIST_GET_ASM_T [comparable_def] rewrite_tac);
a(ante_tac lemma2 THEN LIST_GET_ASM_T [tower_def] rewrite_tac);
a(REPEAT strip_tac);
(* *** Goal "3" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "4" *** *)
a(LIST_GET_ASM_T [comparable_def]rewrite_tac);
a(REPEAT strip_tac);
(* *** Goal "4.1" *** *)
a(ante_tac lemma2 THEN LIST_GET_ASM_T [tower_def] rewrite_tac);
a(strip_tac);
a(POP_ASM_T bc_thm_tac THEN REPEAT strip_tac);
a(all_asm_fc_tac[] THEN all_asm_fc_tac[]);
(* *** Goal "4.2" *** *)
a(spec_nth_asm_tac 7 ⌜s⌝);
a(LIST_GET_NTH_ASM_T [17] fc_tac);
a(list_spec_nth_asm_tac 2 [⌜a⌝, ⌜x⌝, ⌜x'⌝]);
a(spec_nth_asm_tac 7 ⌜s⌝)
);
val ⦏lemma6⦎ = pop_thm ();
=TEX
=SML
val _ = (
set_merge_pcs["predicates", "'sets_alg"];
set_goal conj7;
a(DROP_ASM_T comparable_def rewrite_thm_tac THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(ante_tac lemma2 THEN LIST_GET_ASM_T [tower_def] rewrite_tac);
a(REPEAT strip_tac THEN all_asm_fc_tac[]);
(* *** Goal "2" *** *)
a(spec_nth_asm_tac 5 ⌜c⌝ THEN1 all_asm_fc_tac[]);
a(lemma_tac⌜t0 u ⊆ {a|a ∈ t0 u ∧ (a ⊆ c ∨ g u c ⊆ a)}⌝);
(* *** Goal "2.1" *** *)
a(GET_ASM_T t0_def (fn th => conv_tac (LEFT_C(rewrite_conv[th]))));
a(POP_ASM_T ante_tac THEN
	rewrite_tac[pc_rule1"sets_ext" prove_rule[]⌜∀f a⦁f a ⇒ ⋂{b| f b} ⊆ a⌝]);
(* *** Goal "2.2" *** *)
a(POP_ASM_T (PC_T1 "sets_ext" strip_asm_tac));
a(spec_nth_asm_tac 1 ⌜a⌝);
a(swap_nth_asm_concl_tac 4 THEN GET_ASM_T g_def rewrite_thm_tac);
a(asm_ante_tac ⌜a ⊆ c⌝ THEN CASES_T ⌜¬ hat u c = {}⌝ rewrite_thm_tac
	THEN PC_T1 "sets_ext" prove_tac[])
);
val ⦏lemma7⦎ = pop_thm ();
=TEX
=SML
val _ = (
set_merge_pcs["predicates", "'sets_alg"];
set_goal conj8;
a(LIST_GET_ASM_T[comparable_def, tower_def] rewrite_tac);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(ante_tac lemma2 THEN LIST_GET_ASM_T [tower_def] rewrite_tac THEN strip_tac);
a(asm_ante_tac ⌜t0 u ⊆ u⌝ THEN PC_T1 "sets_ext" prove_tac[]);
(* *** Goal "2" *** *)
a(ante_tac lemma2 THEN LIST_GET_ASM_T [tower_def] rewrite_tac THEN strip_tac);
(* *** Goal "3" *** *)
a(ante_tac lemma2 THEN LIST_GET_ASM_T [tower_def] rewrite_tac THEN strip_tac);
a(all_asm_fc_tac[]);
(* *** Goal "4" *** *)
a(lemma_tac⌜g u a ∈ t0 u⌝);
(* *** Goal "4.1" *** *)
a(ante_tac lemma2 THEN LIST_GET_ASM_T [tower_def] rewrite_tac THEN strip_tac);
a(all_asm_fc_tac[]);
(* *** Goal "4.2" *** *)
a(spec_nth_asm_tac 5 ⌜g u a⌝);
a(cases_tac⌜a = c⌝ THEN1 asm_rewrite_tac[]);
a(i_contr_tac THEN LIST_GET_NTH_ASM_T [1,2,4,5,13] (MAP_EVERY ante_tac));
a(DROP_ASMS_T (fn _ => id_tac) THEN STRIP_T rewrite_thm_tac);
a(CASES_T ⌜¬ hat u a = {}⌝ rewrite_thm_tac THEN PC_T1"sets_ext" prove_tac[]);
a(asm_fc_tac[]);
a(PC_T1 "prop_eq" asm_prove_tac[]);
(* *** Goal "5" *** *)
a(ante_tac lemma2 THEN LIST_GET_ASM_T [tower_def] rewrite_tac THEN strip_tac);
a(all_asm_fc_tac[]);
a(asm_ante_tac⌜g u c ⊆ a⌝ THEN GET_ASM_T g_def rewrite_thm_tac);
a(CASES_T ⌜¬ hat u a = {}⌝ rewrite_thm_tac THEN PC_T1"sets_ext" prove_tac[]);
(* *** Goal "7" *** *)
a(ante_tac lemma2 THEN LIST_GET_ASM_T [tower_def] rewrite_tac THEN strip_tac);
a(POP_ASM_T bc_thm_tac THEN REPEAT strip_tac);
a(asm_ante_tac ⌜v ⊆ {a|a ∈ t0 u ∧ (a ⊆ c ∨ g u c ⊆ a)}⌝
	THEN PC_T1"sets_ext" prove_tac[]);
(* *** Goal "8" *** *)
a(REPEAT_N 3 (POP_ASM_T ante_tac) THEN DROP_ASMS_T (fn _ => id_tac));
a(PC_T "sets_ext" (rewrite_tac[get_spec⌜Nest⌝] THEN REPEAT strip_tac));
a(PC_T1 "sets_ext" (spec_nth_asm_tac 6) ⌜s⌝ THEN
	contr_tac THEN all_asm_fc_tac[]
));
val ⦏lemma8⦎ = pop_thm ();
=TEX
=SML
val _ = (
push_goal([], zorn_⊆_conj);
a(REPEAT strip_tac);
a(MAP_EVERY loc_def_tac [hat_def, g_def, tower_def, t0_def, comparable_def]);
a(MAP_EVERY ante_tac[lemma3, lemma4, lemma5, lemma6, lemma7, lemma8]);
a(taut_tac)
);
val ⦏zorn_thm1⦎ = save_pop_thm "zorn_thm1";
=TEX
\section{RED TAPE 2}
=SML
	val ⦏choose_def⦎ : THM = get_defn "-" "Choose";
	val ⦏nest_def⦎ : THM = get_defn "-" "Nest";
	val ⦏nest_closed_def⦎ : THM = get_defn "-" "NestClosed";
	val ⦏subset_closed_def⦎ : THM = get_defn "-" "SubsetClosed";
	val ⦏maximal⋎⊆_def⦎ : THM = get_defn "-" "Maximal⋎⊆";
end (* of structure SetThmsTheory *);
structure FunRelThmsTheory : FunRelThmsTheory = struct
open SetThmsTheory;
=TEX
\section{ZORN'S LEMMA (GENERAL CASE)}
=SML
val _ = open_theory"fun_rel_thms";
=TEX
=SML
val _ = (
set_pc"hol";
set_goal([], ⌜∀r : ('a ↔ 'a); a : 'a SET⦁
		r ∈ ReflexiveIn a
	∧	r ∈ Transitive
	∧	r ∈ Antisymmetric
	∧	(∀c⦁ c ⊆ a ∧ c ∈ Chains r ⇒ ∃x⦁ x ∈ a ∧ x ∈ UpperBounds r c)
	⇒	∃x⦁ x ∈ MaximalElements r a⌝);
a(REPEAT strip_tac);
a(lemma_tac ⌜∃u⦁ u = {c | c ⊆ a ∧ c ∈ Chains r }⌝ THEN1 prove_∃_tac);
a(lemma_tac⌜¬ u = {} ∧ SubsetClosed u ∧ NestClosed u⌝);
(* *** Goal "1" *** *)
a(REPEAT strip_tac);
(* *** Goal "1.1" *** *)
a(asm_rewrite_tac[] THEN PC_T1 "hol1" REPEAT strip_tac);
a(∃_tac⌜{}⌝ THEN rewrite_tac[get_spec⌜Chains⌝] THEN prove_tac[]);
(* *** Goal "1.2" *** *)
a(rewrite_tac[get_spec⌜SubsetClosed⌝] THEN rename_tac[]
	THEN asm_rewrite_tac[get_spec⌜Chains⌝]);
a(PC_T1 "hol1" REPEAT strip_tac);
(* *** Goal "1.2.1" *** *)
a(asm_prove_tac[]);
(* *** Goal "1.2.2" *** *)
a(lemma_tac⌜x ∈ a' ∧ y ∈ a'⌝ THEN REPEAT strip_tac THEN all_asm_fc_tac[]);
(* *** Goal "1.3" *** *)
a(rewrite_tac[get_spec⌜NestClosed⌝] THEN rename_tac[]
	THEN asm_rewrite_tac[get_spec⌜Chains⌝]);
a(PC_T1 "hol1" REPEAT strip_tac);
(* *** Goal "1.3.1" *** *)
a(PC_T1 "hol1" all_asm_fc_tac[]);
(* *** Goal "1.3.2" *** *)
a(PC_T "hol1"(DROP_ASM_T ⌜Nest v⌝
	(strip_asm_tac o list_∀_elim[⌜s⌝, ⌜s'⌝] o rewrite_rule[get_spec⌜Nest⌝])));
(* *** Goal "1.3.2.1" *** *)
a(PC_T "hol1" (all_asm_fc_tac[] THEN all_asm_fc_tac[]));
(* *** Goal "1.3.2.2" *** *)
a(PC_T "hol1" (asm_fc_tac[] THEN all_asm_fc_tac[]));
(* *** Goal "2" *** *)
a(all_fc_tac[zorn_thm1]);
a(POP_ASM_T ante_tac THEN asm_rewrite_tac[get_spec⌜Maximal⋎⊆⌝]
	THEN REPEAT strip_tac);
a(all_asm_fc_tac[]);
a(∃_tac ⌜x⌝ THEN rewrite_tac[get_spec⌜MaximalElements⌝] THEN REPEAT strip_tac);
a(DROP_NTH_ASM_T 3  ante_tac THEN rewrite_tac[get_spec⌜UpperBounds⌝]
	THEN REPEAT strip_tac);
a(lemma_tac⌜a' ∪ {y} ⊆ a ∧ a' ∪ {y} ∈ Chains r ∧ a' ⊆ a' ∪ {y}⌝);
a(PC_T1 "hol1" REPEAT strip_tac);
(* *** Goal "2.1.1" *** *)
a(PC_T1 "hol1" all_asm_fc_tac[]);
(* *** Goal "2.1.2" *** *)
a(asm_rewrite_tac[]);
(* *** Goal "2.1.3" *** *)
a(asm_ante_tac ⌜a' ∈ Chains r⌝ THEN PC_T1 "hol1" rewrite_tac[get_spec⌜Chains⌝]);
a(REPEAT strip_tac);
(* *** Goal "2.1.3.1" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "2.1.3.2" *** *)
a(POP_ASM_T ante_tac THEN POP_ASM_T rewrite_thm_tac);
a(LEMMA_T ⌜(x', y) ∈ r⌝ rewrite_thm_tac);
a(DROP_ASM_T ⌜r ∈ Transitive⌝ (strip_asm_tac o rewrite_rule[get_spec⌜Transitive⌝]));
a(all_asm_fc_tac[] THEN all_asm_fc_tac[]);
(* *** Goal "2.1.3.3" *** *)
a(POP_ASM_T ante_tac THEN DROP_ASM_T ⌜x' = y⌝ rewrite_thm_tac);
a(LEMMA_T ⌜(y', y) ∈ r⌝ rewrite_thm_tac);
a(DROP_ASM_T ⌜r ∈ Transitive⌝ (strip_asm_tac o rewrite_rule[get_spec⌜Transitive⌝]));
a(all_asm_fc_tac[] THEN all_asm_fc_tac[]);
(* *** Goal "2.1.3.4" *** *)
a(POP_ASM_T ante_tac THEN asm_rewrite_tac[]);
a(DROP_ASM_T ⌜r ∈ ReflexiveIn a⌝
	(strip_asm_tac o rewrite_rule[get_spec⌜ReflexiveIn⌝]));
a(REPEAT strip_tac THEN all_asm_fc_tac[]);
(* *** Goal "2.2" *** *)
a(all_asm_fc_tac[]);
a(asm_ante_tac ⌜a' ∪ {y} = a'⌝ THEN PC_T1 "hol1" REPEAT strip_tac);
a(lemma_tac⌜y ∈ a'⌝ THEN1 spec_nth_asm_tac 1 ⌜y⌝);
a(all_asm_fc_tac[]);
a(DROP_ASM_T ⌜r ∈ Antisymmetric⌝
	(strip_asm_tac o rewrite_rule[get_spec⌜Antisymmetric⌝]));
a(all_asm_fc_tac[])
);
val ⦏zorn_thm⦎ = save_pop_thm "zorn_thm";
=TEX
\section{CONSEQUENCES OF ZORN'S LEMMA}
=SML
val _ = (
set_merge_pcs["'bin_rel", "hol2"];
set_goal([], ⌜∀f; a b; c d⦁
		f ∈ (a ↣ c) ∧ g ∈ (b ↣ d)
	∧	Dom f ∩ Dom g = {}
	∧	Ran f ∩ Ran g = {}
	⇒	f ∪ g ∈ a ∪ b ↣ c ∪ d⌝);
a(rewrite_tac[get_spec⌜$↣⌝] THEN REPEAT strip_tac
	THEN contr_tac THEN all_asm_fc_tac[] THEN all_asm_fc_tac[])
);
val ⦏∪_↣_lemma⦎ = pop_thm();
=TEX
=SML
val _ = (
set_goal([], ⌜∀f; a: 'a SET; b : 'b SET⦁
		(f ↗~↕ ∈ Functional ⇔ f ∈ Injective)
	∧	(f ↗~↕ ∈ Injective ⇔ f ∈ Functional)
	∧	(f ↗~↕ ∈ Total b ⇔ f ∈ Surjective b)
	∧	(f ↗~↕ ∈ Surjective a ⇔ f ∈ Total a)
	∧	(f ↗~↕ ∈ b ↔ a ⇔ f ∈ a ↔ b)
	∧	(f ↗~↕ ↗~↕ = f)⌝);
a(prove_tac[])
);
val ⦏rel_inv_lemma⦎ = pop_thm();
=TEX
Note to maintainers: the proof context management in the following
proof is rather peculiar for historical reasons.
=SML
val _ = (
set_goal([], ⌜∀a : 'a SET; b : 'b SET; f : 'a ↔ 'b ⦁
		Maximal⋎⊆ {h | ∃a1⦁a1 ⊆ a ∧ h ∈ a1 ↣ b} f
	⇒	(∃f⦁ f ∈ a ↣ b) ∨ (∃g⦁ g ∈ b ↣ a)⌝);
push_pc"hol";
a(REPEAT ∀_tac THEN rewrite_tac[get_spec⌜Maximal⋎⊆⌝] THEN strip_tac);
a(cases_tac⌜a = a1⌝ THEN_LIST[
	∨_left_tac THEN ∃_tac ⌜f⌝ THEN asm_rewrite_tac[],
	∨_right_tac]);
a(∃_tac⌜f ↗~↕⌝ THEN asm_ante_tac ⌜f ∈ a1 ↣ b⌝
	THEN PC_T1 "hol2" rewrite_tac(map get_spec[⌜$↣⌝]));
a(rewrite_tac [rel_inv_lemma] THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(list_asm_ante_tac [⌜a1 ⊆ a⌝, ⌜f ∈ a1 ↔ b⌝]
	THEN MERGE_PCS_T1 ["hol2", "'bin_rel"] prove_tac[]);
(* *** Goal "2" *** *)
a(MERGE_PCS_T1 ["hol2", "'bin_rel"]rewrite_tac[get_spec ⌜Surjective⌝]);
a(contr_tac);
(* *** Goal "2.1" *** *)
a(lemma_tac ⌜∃y⦁y ∈ a \ a1⌝ THEN1 (
	list_asm_ante_tac[⌜¬ a = a1⌝, ⌜a1 ⊆ a⌝] THEN PC_T1 "sets_ext" prove_tac[]));
a(lemma_tac ⌜f ∪ {(y', y)} = f⌝);
(* *** Goal "2.1.1" *** *)
a(DROP_NTH_ASM_T 10 bc_thm_tac);
a(conv_tac (RIGHT_C (PC_C1 "sets_ext" prove_conv[])) THEN REPEAT strip_tac);
a(∃_tac⌜a1 ∪ {y'}⌝ THEN REPEAT strip_tac);
(* *** Goal "2.1.1.1" *** *)
a(list_asm_ante_tac[⌜y' ∈ a⌝, ⌜a1 ⊆ a⌝] THEN PC_T1 "sets_ext" REPEAT strip_tac);
(* *** Goal "2.1.1.1.1" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "2.1.1.1.2" *** *)
a(asm_rewrite_tac[]);
(* *** Goal "2.1.1.2" *** *)
a(once_rewrite_tac[pc_rule1"sets_ext" prove_rule[]⌜b = b ∪ b⌝]);
a(bc_tac[∪_↣_lemma]);
(* *** Goal "2.1.1.2.1" *** *)
a(PC_T1 "hol1" asm_rewrite_tac[get_spec⌜$↣⌝]);
(* *** Goal "2.1.1.2.2" *** *)
a(MERGE_PCS_T1 ["hol2", "'bin_rel"] prove_tac[get_spec⌜$↣⌝]
	THEN asm_rewrite_tac[]);
(* *** Goal "2.1.1.2.3" *** *)
a(rewrite_tac[get_spec⌜Dom⌝] THEN PC_T1 "sets_ext" REPEAT strip_tac);
a(swap_asm_concl_tac ⌜(x, y'') ∈ f⌝ THEN asm_rewrite_tac[]);
a(swap_asm_concl_tac ⌜f ∈ a1 ↔ b⌝ THEN PC_T1 "'bin_rel" rewrite_tac[]);
a(PC_T1 "hol1" REPEAT strip_tac);
a(∃_tac⌜(y', y'')⌝ THEN REPEAT strip_tac);
(* *** Goal "2.1.1.2.4" *** *)
a(rewrite_tac[get_spec⌜Ran⌝] THEN PC_T1 "sets_ext" REPEAT strip_tac);
a(swap_asm_concl_tac ⌜(x', x) ∈ f⌝ THEN asm_rewrite_tac[]);
(* *** Goal "2.1.2" *** *)
a(spec_asm_tac⌜∀ x⦁ ¬ (x, y) ∈ f⌝⌜y'⌝);
a(lemma_tac⌜(y', y) ∈ f⌝);
a(GET_NTH_ASM_T 2 (once_rewrite_thm_tac o eq_sym_rule));
a(PC_T1 "sets_ext" prove_tac[]);
(* *** Goal "2.2" *** *)
a(swap_asm_concl_tac ⌜f ∈ a1 ↔ b⌝ THEN PC_T1 "'bin_rel" rewrite_tac[]);
a(PC_T1 "hol1" REPEAT strip_tac);
a(∃_tac⌜(x, y)⌝ THEN REPEAT strip_tac)
);
val ⦏lemma10⦎ = pop_thm();
=TEX
=SML
val _ = (
set_merge_pcs["hol2", "'bin_rel"];
set_goal([], ⌜∀a : 'a SET; b : 'b SET⦁
	(∃f⦁ f ∈ a ↣ b) ∨ (∃g⦁ g ∈ b ↣ a)⌝);
a(REPEAT ∀_tac);
a(bc_tac[lemma10, zorn_thm1]);
(* *** Goal "1" *** *)
a(REPEAT strip_tac);
a(∃_tac⌜{}⌝ THEN rewrite_tac(map get_spec[⌜$↣⌝, ⌜$↔⌝]) THEN REPEAT strip_tac);
a(∃_tac⌜{}⌝ THEN REPEAT strip_tac);
(* *** Goal "2" *** *)
a(rewrite_tac[get_spec⌜SubsetClosed⌝] THEN REPEAT strip_tac);
a(∃_tac⌜Dom b'⌝ THEN REPEAT strip_tac);
(* *** Goal "2.1" *** *)
a(all_asm_fc_tac[]);
a(asm_ante_tac⌜a' ∈ a1 ↣ b⌝ THEN rewrite_tac(map get_spec[⌜$↣⌝, ⌜$↔⌝, ⌜$×⌝])
	THEN REPEAT strip_tac);
a(all_asm_fc_tac[] THEN all_asm_fc_tac[]);
(* *** Goal "2.2" *** *)
a(rewrite_tac(map get_spec[⌜$↣⌝])THEN REPEAT strip_tac);
(* *** Goal "2.2.1" *** *)
a(contr_tac THEN all_asm_fc_tac[]);
(* *** Goal "2.2.2" *** *)
a(all_asm_fc_tac[]);
a(asm_ante_tac⌜a' ∈ a1 ↣ b⌝ THEN rewrite_tac(map get_spec[⌜$↣⌝])
	THEN REPEAT strip_tac);
a(all_asm_fc_tac[]);
(* *** Goal "2.2.3" *** *)
a(asm_ante_tac⌜a' ∈ a1 ↣ b⌝ THEN rewrite_tac(map get_spec[⌜$↣⌝])
	THEN REPEAT strip_tac);
a(all_asm_fc_tac[] THEN all_asm_fc_tac[]);
(* *** Goal "2.2.4" *** *)
a(asm_ante_tac⌜a' ∈ a1 ↣ b⌝ THEN rewrite_tac(map get_spec[⌜$↣⌝])
	THEN REPEAT strip_tac);
a(all_asm_fc_tac[] THEN all_asm_fc_tac[]);
(* *** Goal "3" *** *)
a(rewrite_tac[get_spec⌜NestClosed⌝, get_spec⌜Nest⌝] THEN REPEAT strip_tac);
a(∃_tac⌜Dom (⋃v)⌝ THEN REPEAT strip_tac);
(* *** Goal "3.1" *** *)
a(LIST_GET_NTH_ASM_T [4] all_fc_tac);
a(asm_ante_tac⌜s ∈ a1 ↣ b⌝ THEN rewrite_tac(map get_spec[⌜$↣⌝])
	THEN REPEAT strip_tac);
a(LIST_GET_NTH_ASM_T [4] all_fc_tac);
a(all_asm_fc_tac[] THEN all_asm_fc_tac[]);
(* *** Goal "3.2" *** *)
a(rewrite_tac(map get_spec[⌜$↣⌝]) THEN REPEAT strip_tac);
(* *** Goal "3.2.1" *** *)
a(MAP_EVERY ∃_tac[⌜x2⌝, ⌜s⌝] THEN asm_rewrite_tac[]);
(* *** Goal "3.2.2" *** *)
a(LIST_GET_NTH_ASM_T [4] all_fc_tac);
a(asm_ante_tac⌜s ∈ a1 ↣ b⌝ THEN rewrite_tac(map get_spec[⌜$↣⌝])
	THEN REPEAT strip_tac);
a(LIST_GET_NTH_ASM_T [4] all_fc_tac);
(* *** Goal "3.2.3" *** *)
a(list_spec_nth_asm_tac 5 [⌜s⌝, ⌜s'⌝]);
(* *** Goal "3.2.3.1" *** *)
a(LIST_DROP_NTH_ASM_T [1, 7] all_fc_tac);
a(asm_ante_tac⌜s' ∈ a1 ↣ b⌝ THEN rewrite_tac(map get_spec[⌜$↣⌝])
	THEN REPEAT strip_tac);
a(LIST_GET_NTH_ASM_T [3] all_fc_tac);
(* *** Goal "3.2.3.2" *** *)
a(LIST_DROP_NTH_ASM_T [1, 7] all_fc_tac);
a(asm_ante_tac⌜s ∈ a1' ↣ b⌝ THEN rewrite_tac(map get_spec[⌜$↣⌝])
	THEN REPEAT strip_tac);
a(LIST_GET_NTH_ASM_T [3] all_fc_tac);
(* *** Goal "3.2.4" *** *)
a(list_spec_nth_asm_tac 5 [⌜s⌝, ⌜s'⌝]);
(* *** Goal "3.2.4.1" *** *)
a(LIST_DROP_NTH_ASM_T [1, 7] all_fc_tac);
a(asm_ante_tac⌜s' ∈ a1 ↣ b⌝ THEN rewrite_tac(map get_spec[⌜$↣⌝])
	THEN REPEAT strip_tac);
a(LIST_GET_NTH_ASM_T [2] all_fc_tac);
(* *** Goal "3.2.4.2" *** *)
a(LIST_DROP_NTH_ASM_T [1, 7] all_fc_tac);
a(asm_ante_tac⌜s ∈ a1' ↣ b⌝ THEN rewrite_tac(map get_spec[⌜$↣⌝])
	THEN REPEAT strip_tac);
a(LIST_GET_NTH_ASM_T [2] all_fc_tac)
);
val ⦏comparability_thm⦎ = save_pop_thm"comparability_thm";
=TEX
We first prove the Schroeder-Bernstein theorem in the special case
where one of the two functions is the identify function, i.e. it
is the inclusion of a subset. The informal proof which guides the
HOL proof goes as follows:

Assume that
=INLINEFT
c ⊆ b ⊆ a
=TEX
\ and that $f$ is a 1-1 function from $a$ into $c$.
The Schroeder-Bernstein theorem asserts that under these conditions
there exists a bijection between $a$ and $b$. To see this, first
define a function
$u$ from the natural numbers to the power set of $a$ as follows:

=GFT
	u(0) = a \ b
	u (i+1) = {y | ∃x⦁ (x, y) ∈ f} ( = {y | ∃x⦁f(x) = y}
=TEX
Consider the function $h$ defined for $x$ in $a$ by:
=GFT
	h(x) = if ∃i⦁x ∈ u i then f x else x
=TEX
I claim that $h$ is the desired bijection between $a$ and $b$.
To prove this we must prove that $h$ is 1-1 and that its range
is $b$.

To see that $h$ is 1-1, consider two elements, $x$ and $y$, say,
of $x$, such that $h(x) = h(y)$.  If $x$ and $y$ are both in one of the
$u(i)$, then $f(x) = h(x) = h(y) = f(x)$, and so $x = y$, since $f$ is 1-1.
If neither $x$ nor $y$ is in one of the $u(i)$ then $x = h(x) = h(y) = y$.
If one of the $x$ and $y$, say w.l.o.g $x$, is in $u(i)$ for some $i$
but $y$ is not, then we have $f(x) = h(x) = y$, but then $y$ is in $u(i+1)$
by the definition of $u$, which is a contradiction: $h(x) = h(y)$ cannot
happen under these conditions. Thus $h$ is, indeed, 1-1.

Let $x$ be any element of $a$, if $x$ is not in $b$ then, $x$ is in $u(0)$,
(by the definition of $u$), so $h(x) = f(x)$ which is in $c$, and so
certainly in $a$. If $x$ is in $b$, then both $x$ and $f(x)$ are also
in $b$, so that $h(x)$ is in $b$ regardless of whether $x$ is in some $u(i)$.
This shows that the range of $h$ is contained in $b$.

Now let $y$ be any element of $b$, if $y$ is in $u(i)$ for some $i$, then
$i$ cannot be $0$ (by the definition of $u(0)$), and so $y = h(x)$ for
some $x$ in $u(i-1)$ and $y$ is in the range of $h$, if on the other hand
$y$ is not in any of the $u(i)$ then $h(y) = y$ and again $y$ is in the
range of $b$. Thus the range of $h$ contains $b$. Taking this with
the observation of the last paragraph shows that $h$ has range equal
to $b$ and so is a bijection between $a$ and $b$ as required.

The above proof is somewhat similar to the one in \cite{Halmos74}.
However, proving the special case first makes things much simpler, both
in the formal proof, and conceptually, I believe.
=SML
val _ = (
set_merge_pcs["hol2", "'bin_rel"];
set_goal([], ⌜∀a b c : 'a SET; f : 'a ↔ 'a⦁
	c ⊆ b ∧ b ⊆ a ∧ f ∈ a ↣ c ⇒ ∃h⦁h ∈ a ⤖ b⌝);
a(rewrite_tac(map get_spec[⌜$↣⌝]) THEN REPEAT strip_tac);
a(lemma_tac ⌜∃u⦁
		u 0 = a \ b
	∧	∀ i⦁u (i+1) = {y | ∃x⦁x ∈ u i ∧ (x, y) ∈ f}⌝
	THEN1 prove_∃_tac);
a(∃_tac⌜{(x, y) |
		x ∈ a
	∧	if ∃i⦁x ∈ u i then (x, y) ∈ f else y = x}⌝);
a(asm_rewrite_tac(map get_spec[⌜$⤖⌝]));
a(REPEAT strip_tac THEN_TRY all_var_elim_asm_tac
	THEN_TRY SOLVED_T(contr_tac THEN all_asm_fc_tac[] THEN all_asm_fc_tac[]));
(* *** Goal "1" of 6 but 5 is a duplicate; ⓜREPEAT strip_tac⌝ alone gives 50 *** *)
a(POP_ASM_T (ante_tac o ∀_elim⌜0⌝) THEN asm_rewrite_tac[]);
a(REPEAT strip_tac THEN all_asm_fc_tac[] THEN all_asm_fc_tac[]);
(* *** Goal "2" *** *)
a(lemma_tac⌜x ∈ u(i + 1)⌝);
(* *** Goal "2.1" *** *)
a(GET_NTH_ASM_T 6 rewrite_thm_tac THEN REPEAT strip_tac);
a(contr_tac THEN all_asm_fc_tac[]);
(* *** Goal "2.2" *** *)
a(POP_ASM_T ante_tac THEN asm_rewrite_tac[]);
(* *** Goal "3" *** *)
a(lemma_tac⌜y ∈ u(i + 1)⌝);
(* *** Goal "3.1" *** *)
a(GET_NTH_ASM_T 6 rewrite_thm_tac THEN REPEAT strip_tac);
a(contr_tac THEN all_asm_fc_tac[]);
(* *** Goal "3.2" *** *)
a(POP_ASM_T ante_tac THEN asm_rewrite_tac[]);
(* *** Goal "4" *** *)
a(cases_tac ⌜¬∃i⦁x ∈ u i⌝);
(* *** Goal "4.1" *** *)
a(∃_tac⌜x⌝ THEN REPEAT strip_tac THEN all_asm_fc_tac[]);
a(contr_tac THEN all_asm_fc_tac[] THEN all_asm_fc_tac[]);
(* *** Goal "4.2" *** *)
a(strip_asm_tac (∀_elim⌜i⌝ ℕ_cases_thm) THEN all_var_elim_asm_tac1);
(* *** Goal "4.2.1" *** *)
a(i_contr_tac THEN POP_ASM_T ante_tac THEN asm_rewrite_tac[]);
(* *** Goal "4.2.2" *** *)
a(swap_nth_asm_concl_tac 1 THEN asm_rewrite_tac[]);
a(swap_nth_asm_concl_tac 1);
a(strip_tac THEN ∃_tac⌜x'⌝ THEN REPEAT strip_tac THEN all_asm_fc_tac[]);
a(contr_tac THEN all_asm_fc_tac[]);
(* *** Goal "6" (5 was a duplicate) *** *)
a(LEMMA_T ⌜∃y⦁(x, y) ∈ f⌝ rewrite_thm_tac THEN1
	(contr_tac THEN asm_fc_tac[]));
a(cases_tac ⌜¬∃i⦁x ∈ u i⌝);
(* *** Goal "6.1" *** *)
a(∃_tac⌜x⌝ THEN REPEAT strip_tac THEN all_asm_fc_tac[]);
(* *** Goal "6.2" *** *)
a(LEMMA_T ⌜∃i⦁ x ∈ u i⌝ rewrite_thm_tac THEN
	(contr_tac THEN asm_fc_tac[]))
);
val ⦏schroeder_bernstein_thm1⦎ = save_pop_thm"schroeder_bernstein_thm1";
=TEX
=SML
val _ = (
set_pc "hol";
set_goal([], ⌜∀a  : 'a SET; b : 'b SET; c : 'c SET; f : 'a ↔ 'b; g :'b ↔ 'c⦁
	f ∈ a ↣ b ∧ g ∈ b ↣ c ⇒ (g o f) ∈ a ↣ Ran (g o f)⌝);
a(rewrite_tac[get_spec⌜$↣⌝]);
a(REPEAT strip_tac);
set_merge_pcs ["hol2", "'bin_rel"];
(* *** Goal "1" *** *)
a(list_asm_ante_tac [⌜f ∈ a ↔ b⌝, ⌜g ∈ b ↔ c⌝] THEN prove_tac[]);
(* *** Goal "2" *** *)
a(list_asm_ante_tac [⌜f ∈ Functional⌝, ⌜g ∈ Functional⌝]);
a(DROP_ASMS_T (fn _ => id_tac));
a(contr_tac THEN all_asm_fc_tac[] THEN all_asm_fc_tac[]);
a(all_var_elim_asm_tac THEN all_asm_fc_tac[] THEN all_asm_fc_tac[]);
(* *** Goal "3" *** *)
a(list_asm_ante_tac [⌜f ∈ Injective⌝, ⌜g ∈ Injective⌝]);
a(DROP_ASMS_T (fn _ => id_tac));
a(contr_tac THEN all_asm_fc_tac[] THEN all_asm_fc_tac[]);
a(all_var_elim_asm_tac THEN all_asm_fc_tac[] THEN all_asm_fc_tac[]);
(* *** Goal "4" *** *)
a(list_asm_ante_tac [⌜f ∈ Total a⌝, ⌜f ∈ a ↔ b⌝, ⌜g ∈ Total b⌝]);
a(DROP_ASMS_T (fn _ => id_tac));
a(contr_tac THEN REPEAT_N 4 (all_asm_fc_tac[]))
);
val ↣_o_lemma = pop_thm();
=TEX
=SML
val _ = (
set_pc"hol";
set_goal([], ⌜∀a  : 'a SET; b : 'b SET; f : 'a ↔ 'b; g :'b ↔ 'a⦁
	f ∈ a ↣ b ∧ g ∈ b ↣ a ⇒ ∃h⦁h ∈ a ⤖ b⌝);
a(REPEAT strip_tac);
a(all_fc_tac [∀_elim⌜a⌝ ↣_o_lemma]);
a(strip_asm_tac (merge_pcs_rule1["hol2", "'bin_rel"]prove_rule[get_spec⌜$↣⌝]
	⌜Ran (g o f) ⊆ Ran g ∧ (g ∈ b ↣ a ⇒ Ran g ⊆ a)⌝));
a(all_fc_tac [schroeder_bernstein_thm1]);
a(∃_tac⌜{(u, w) | ∃v⦁ (u, v) ∈ h ∧ (w, v) ∈ g}⌝);
a(list_asm_ante_tac [⌜g ∈ b ↣ a⌝, ⌜h ∈ a ⤖ Ran g⌝]);
set_merge_pcs ["hol2", "'bin_rel"];
a(DROP_ASMS_T (fn _ => id_tac));
a(rewrite_tac(map get_spec[⌜$↣⌝,  ⌜$⤖⌝]) THEN REPEAT strip_tac
	THEN contr_tac THEN (all_asm_fc_tac[] THEN_TRY all_var_elim_asm_tac)
	THEN REPEAT_N 2 (all_asm_fc_tac[]))
);
val ⦏schroeder_bernstein_thm⦎ = save_pop_thm"schroeder_bernstein_thm";
=TEX
\section{RED TAPE 3}
=SML
	val ⦏reflexive_in_def⦎ : THM = get_defn "-" "ReflexiveIn";
	val ⦏antisymmetric_def⦎ : THM = get_defn "-" "Antisymmetric";
	val ⦏chains_def⦎ : THM = get_defn "-" "Chains";
	val ⦏upper_bounds_def⦎ : THM = get_defn "-" "UpperBounds";
	val ⦏maximal_elements_def⦎ : THM = get_defn "-" "MaximalElements";
end (* of structure FunRelThmsTheory *);
open SetThmsTheory;
open FunRelThmsTheory;
=TEX
\small
\twocolumn[\section{INDEX}]
\printindex
\end{document}



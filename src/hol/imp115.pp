=IGN
********************************************************************************
imp115.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
=TEX
\documentclass[a4paper,12pt]{article}

%%%%% YOU CAN ADD OTHER PACKAGES AS NEEDED BELOW:
\usepackage{A4}
\usepackage{Lemma1}
\usepackage{ProofPower}
\usepackage{epsf}
\makeindex

\def\Title{ Implementation: Theory of Orderings }

\def\Abstract{\begin{center}
{\bf Abstract}\par\parbox{0.7\hsize}
{\small This document gives the implementation of a theory
of orderings that is used in constructing the representation
type for the real numbers in \ProductHOL.}
\end{center}}

\def\Reference{LEMMA1/HOL/IMP115}

\def\Author{R.D. Arthan}

\def\EMail{{\tt rda@lemma-one.com}}

\def\Phone{+44 118 958 4409}

\def\Fax{+44 118 956 1920}

%%%%% YOU MAY WANT TO CHANGE THE FOLLOWING TO GET A NICE FRONT PAGE:
\def\FrontPageTitle{ {\huge \Title } }
\def\FrontPageHeader{\raisebox{16ex}{\begin{tabular}[t]{c}
\bf Copyright \copyright\ : Lemma 1 Ltd \number\year\\\strut\\
\end{tabular}}}
\begin{centering}



\end{centering}

%%%%% THE FOLLOWING DEFAULTS WILL GENERALLY BE RIGHT:

\def\Version{\VCVersion}
\def\Date{\FormatDate{\VCDate}}

%%%%% NOW BEGIN THE DOCUMENT AND MAKE THE FRONT PAGE

\begin{document}
\headsep=0mm
\FrontPage
\headsep=10mm

%%%%% STANDARD RED-TAPE SECTIONS (MAY WANT TO INTERLEAVE SOME \newpage COMMANDS IN THESE)

%%%%% CONTENTS:

\subsection{Contents}

\tableofcontents

%%%%% REFERENCES:

\newpage
\subsection{References}

\bibliographystyle{fmu}

%%%%% CHANGE THE FOLLOWING AS NECESSARY (E.G., TO PICK UP daz.bib):
{\raggedright
\bibliography{fmu}
}
%%%%% CHANGES HISTORY:
\subsection{Changes History}
\begin{description}
\item[Issues 1.1 (2000/12/05)] First draft.
\item[Issue 1.2 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.3 (2002/10/17)] PPHol-specific updates for open source release
\item[Issues 1.4 (2003/04/09), 1.5 (2003/04/09)] Reworked definition of antisymmetry so that it no longer entails irreflexivity.
\item[Issue 1.6 (2003/04/28)] Further rationalisation of names (in particular, partial and linear orders are now explicitly strict);
made sure that no theorems have free variables.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.
\item[2015/04/15]
Now uses new date and version macros from doctex
%%%% END OF CHANGES HISTORY %%%%
\end{description}

%%%%%  CHANGES FORECAST:

\subsection{Changes Forecast}

None.

%%%%% DISTRIBUTION LIST

\subsection{Distribution}

Lemma 1 build system.

\newpage

\section{Introduction}
\subsection{Scope}
See \cite{LEMMA1/HOL/DTD115}.

\subsection{Purpose and Background}
See \cite{DS/FMU/IED/HLD011}.
\section{PREAMBLE}
=SML
structure ⦏Orders⦎ : Orders = struct
=TEX
\section{THEOREMS}
We now prove some basic facts about the cuts construction.
The aim is to show that under suitable hypotheses on $X$
and $<<$, the set of cuts in $X$ ordered by strict set
inclusion will be a complete extension of $<<$ on $X$:
the {\em completion} of $<<$ on $X$.
We also want to show that dense subsets of $X$ give
rise to dense subsets of the completion.

The proofs nearly all proceed by expanding all definitions and
set theory notations and then carrying out the underlying
predicate calculus proofs.
=SML
val _ = open_theory"orders";
val ⦏order_defs⦎ = map get_spec(get_consts"-");
=TEX
=SML
val ⦏down_sets_def⦎ = get_spec ⌜DownSets⌝;
val ⦏down_set_def⦎ = get_spec⌜DownSet⌝;
val ⦏cuts_def⦎ = get_spec⌜Cuts⌝;
val ⦏complete_def⦎ = get_spec⌜Complete⌝;
val ⦏unbounded_below_def⦎ = get_spec⌜UnboundedBelow⌝;
val ⦏unbounded_above_def⦎ = get_spec⌜UnboundedAbove⌝;
val ⦏has_supremum_def⦎ = get_spec⌜$HasSupremum⌝;
val ⦏upper_bound_def⦎ = get_spec⌜UpperBound⌝;
val ⦏dense_def⦎ = get_spec⌜Dense⌝;
val ⦏dense_in_def⦎ = get_spec⌜$DenseIn⌝;
val ⦏strict_linear_order_def⦎ = get_spec⌜StrictLinearOrder⌝;
val ⦏trich_def⦎ = get_spec⌜Trich⌝;
val ⦏strict_partial_order_def⦎ = get_spec⌜StrictPartialOrder⌝;
val ⦏trans_def⦎ = get_spec⌜Trans⌝;
val ⦏antisym_def⦎ = get_spec⌜Antisym⌝;
val ⦏irrefl_def⦎ = get_spec⌜Irrefl⌝;
=TEX
The ordering for the set of cuts will be strict
set inclusion. This is irreflexive without any hypotheses:
=SML
val _ = set_pc"sets_ext1";
=TEX
=SML
val ⦏⊂_irrefl_thm⦎ = (
set_goal([], ⌜∀V⦁ Irrefl(V, $⊂)⌝);
a(rewrite_tac order_defs THEN REPEAT strip_tac);
save_pop_thm "⊂_irrefl_thm"
);
=TEX
Similarly strict set inclusion is antisymmetric without
any hypotheses:
=SML
val ⦏⊂_antisym_thm⦎ = (
set_goal([], ⌜∀V⦁
	Antisym(V, $⊂)
⌝);
a(rewrite_tac order_defs THEN contr_tac THEN all_asm_fc_tac[]);
save_pop_thm "⊂_antisym_thm"
);
=TEX
Again transitivity requires no extra hypotheses:
=SML
val ⦏⊂_trans_thm⦎ = (
set_goal([], ⌜∀V⦁ Trans(V, $⊂)⌝);
a(rewrite_tac order_defs THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(all_asm_fc_tac[] THEN all_asm_fc_tac[]);
(* *** Goal "2" *** *)
a(contr_tac THEN all_asm_fc_tac[] THEN all_asm_fc_tac[]);
save_pop_thm "⊂_trans_thm"
);
=TEX
Linearity certainly does not hold in general. We show that if $<<$ is transitive and trichotomous
on $X$, then strict inclusion is trichotomous on the cuts in $X$:

=SML
val ⦏cuts_trich_thm⦎ = (
set_goal([], ⌜∀X $<<⦁
	Trans(X, $<<) ∧ Trich(X, $<<) ⇒ Trich(Cuts(X, $<<), $⊂)⌝);
a(rewrite_tac order_defs THEN REPEAT strip_tac THEN_TRY
	SOLVED_T (contr_tac THEN all_asm_fc_tac[]));
(* *** Goal "1" *** *)
a(cases_tac ⌜x''''''' << x''''''⌝ THEN1 (all_asm_fc_tac[] THEN all_asm_fc_tac[]));
a(cases_tac ⌜x''''''' = x''''''⌝ THEN1 asm_rewrite_tac[]);
a(lemma_tac ⌜x'''''' << x'''''''⌝ THEN1 (all_asm_fc_tac[] THEN all_asm_fc_tac[]));
a(all_asm_fc_tac[] THEN all_asm_fc_tac[]);
(* *** Goal "2" *** *)
a(cases_tac ⌜x''''' = x''''''⌝ THEN1 all_var_elim_asm_tac);
a(lemma_tac ⌜x''''' ∈ X ∧ x'''''' ∈ X⌝ THEN1 (all_asm_fc_tac[] THEN REPEAT strip_tac));
a(list_spec_nth_asm_tac 21 [⌜x'''''⌝, ⌜x''''''⌝] THEN all_asm_fc_tac[]);
save_pop_thm "cuts_trich_thm"
);
=TEX
Now convenience packaging of the above for partial orders and linear orders:
=SML
val ⦏cuts_strict_partial_order_thm⦎ = (
set_goal([], ⌜∀X $<<⦁  StrictPartialOrder(Cuts(X, $<<), $⊂)⌝);
a(pure_rewrite_tac [get_spec⌜StrictPartialOrder⌝] THEN
	rewrite_tac[⊂_irrefl_thm, ⊂_antisym_thm, ⊂_trans_thm]);
save_pop_thm "cuts_strict_partial_order_thm"
);
=TEX
=SML
val ⦏cuts_strict_linear_order_thm⦎ = (
set_goal([], ⌜∀X $<<⦁  StrictLinearOrder(X, $<<) ⇒ StrictLinearOrder(Cuts(X, $<<), $⊂)⌝);
a(pure_rewrite_tac [get_spec⌜StrictLinearOrder⌝] THEN
	rewrite_tac[cuts_strict_partial_order_thm] THEN REPEAT strip_tac);
a(bc_thm_tac cuts_trich_thm THEN REPEAT strip_tac);
a(GET_NTH_ASM_T 2 ante_tac THEN pure_rewrite_tac[get_spec⌜StrictPartialOrder⌝] THEN REPEAT strip_tac);
save_pop_thm "cuts_strict_linear_order_thm"
);
=TEX

Perhaps surprisingly, completeness does hold in general for the cuts in $X$
without any additional hypotheses on the ordering $<<$. (One's first thought
might be that transitivity is required; however, in a sense, our definition of a cut
implicitly forms the transitive closure of $<<$ and so we do not need to assume $<<$
is transitive.)


=SML
val ⦏cuts_complete_thm⦎ = (
set_goal([], ⌜∀X $<<⦁ Complete(Cuts(X, $<<), $⊂)⌝);
a(rewrite_tac order_defs THEN REPEAT strip_tac);
a(∃_tac⌜⋃A⌝ THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "2" *** *)
a(spec_nth_asm_tac 9 ⌜x'⌝);
a(∃_tac⌜x''''⌝ THEN REPEAT strip_tac);
a(∃_tac⌜x'⌝ THEN REPEAT strip_tac);
(* *** Goal "3" *** *)
a(spec_nth_asm_tac 11 ⌜s⌝);
a(spec_nth_asm_tac 4 ⌜b⌝);
a(∃_tac⌜c⌝ THEN REPEAT strip_tac);
a(∃_tac⌜s⌝ THEN REPEAT strip_tac);
(* *** Goal "4" *** *)
a(∃_tac⌜x'''⌝ THEN REPEAT strip_tac);
a(all_asm_fc_tac[] THEN all_asm_fc_tac[]);
(* *** Goal "5" *** *)
a(∃_tac⌜s⌝ THEN REPEAT strip_tac);
a(all_asm_fc_tac[] THEN all_asm_fc_tac[]);
(* *** Goal "6" *** *)
a(∃_tac⌜a⌝ THEN REPEAT strip_tac);
(* *** Goal "7" *** *)
a(spec_nth_asm_tac 9 ⌜a⌝);
a(∃_tac⌜x''''⌝ THEN REPEAT strip_tac);
a(∃_tac⌜c⌝ THEN REPEAT strip_tac);
(* *** Goal "8" *** *)
a(contr_tac THEN all_asm_fc_tac[]);
save_pop_thm "cuts_complete_thm"
);
=TEX
Now we want to show that the down-sets belonging to a subset $A$ of $X$
form a subset of the cuts. For this our hypotheses are that
$<<$ be irreflexive and transitive and that $A$ be unbounded
below and dense in $X$. The hypotheses on $A$ ensure that
the down-sets are not empty and are not bounded above. These hypotheses
on $A$ could perhaps be weakened.
=SML
val ⦏down_sets_cuts_thm⦎ = (
set_goal([], ⌜∀X $<< A⦁
	A ⊆ X ∧ Irrefl(X, $<<) ∧ Trans(X, $<<) ∧ UnboundedBelow (A, $<<) ∧ A DenseIn (X, $<<) ⇒
	DownSets(X, $<<, A) ⊆ Cuts(X, $<<)⌝);
a(rewrite_tac order_defs THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "2" *** *)
a(LIST_GET_NTH_ASM_T [7] all_fc_tac);
a(LIST_GET_NTH_ASM_T [5] all_fc_tac);
a(∃_tac⌜c⌝ THEN asm_rewrite_tac[] THEN all_asm_fc_tac[]);
(* *** Goal "3" *** *)
a(POP_ASM_T ante_tac THEN asm_rewrite_tac[] THEN REPEAT strip_tac);
a(LIST_GET_NTH_ASM_T [9] all_fc_tac);
a(LIST_GET_NTH_ASM_T [6] all_fc_tac);
a(∃_tac⌜a⌝ THEN asm_rewrite_tac[] THEN all_asm_fc_tac[]);
(* *** Goal "4" *** *)
a(LIST_GET_NTH_ASM_T [7] all_fc_tac);
a(∃_tac⌜x'⌝ THEN asm_rewrite_tac[] THEN REPEAT strip_tac);
(* *** Goal "5" *** *)
a(LIST_GET_NTH_ASM_T [10] all_fc_tac);
a(DROP_NTH_ASM_T 4 ante_tac THEN asm_rewrite_tac[]);
a(REPEAT strip_tac THEN all_asm_fc_tac[]);
save_pop_thm "down_sets_cuts_thm"
);
=TEX
Now we show that under suitable hypotheses, the down-sets belonging
to a dense subset $A$ are themselves dense in the completion.
In the proof, the assumptions tend to be rather over-productive if
we use forward chaining, so the specialisations are mostly done
individually.
=SML
val ⦏down_sets_dense_thm⦎ = (
set_goal([], ⌜∀X $<< A⦁
	A ⊆ X ∧ StrictLinearOrder(X, $<<) ∧
	UnboundedBelow (A, $<<) ∧ A DenseIn (X, $<<) ⇒
	DownSets(X, $<<, A) DenseIn (Cuts(X, $<<), $⊂)⌝);
a(rewrite_tac order_defs THEN REPEAT strip_tac);
a(spec_nth_asm_tac 7 ⌜x'''''⌝);
a(spec_nth_asm_tac 11 ⌜x'''''⌝);
a(spec_nth_asm_tac 12 ⌜c⌝);
a(list_spec_nth_asm_tac 20 [⌜x'''''⌝, ⌜c⌝]);
a(∃_tac⌜{v|v ∈ X ∧ v << a}⌝ THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(∃_tac⌜a⌝ THEN REPEAT strip_tac);
(* *** Goal "2" *** *)
a(spec_nth_asm_tac 23 ⌜x''''''⌝);
(* *** Goal "3" *** *)
a(cases_tac⌜x'''''' = a⌝ THEN1 (all_var_elim_asm_tac THEN all_asm_fc_tac[]));
a(spec_nth_asm_tac 31 ⌜a⌝);
a(spec_nth_asm_tac 25 ⌜x''''''⌝);
a(list_spec_nth_asm_tac 29 [⌜x''''''⌝, ⌜a⌝]);
a(list_spec_nth_asm_tac 22 [⌜x''''''⌝, ⌜a⌝]);
a(list_spec_nth_asm_tac 23 [⌜a⌝, ⌜x'''''⌝]);
(* *** Goal "4" *** *)
a(∃_tac⌜x'''''⌝ THEN REPEAT strip_tac);
(* *** Goal "5" *** *)
a(spec_nth_asm_tac 31 ⌜a⌝);
a(list_spec_nth_asm_tac 14 [⌜c⌝, ⌜a⌝]);
a(list_spec_nth_asm_tac 15 [⌜a⌝, ⌜x''''''⌝]);
(* *** Goal "6" *** *)
a(∃_tac⌜c⌝ THEN REPEAT strip_tac);
a(spec_nth_asm_tac 30 ⌜a⌝);
a(list_spec_nth_asm_tac 28 [⌜a⌝, ⌜c⌝, ⌜a⌝]);
a(spec_nth_asm_tac 31 ⌜a⌝);
save_pop_thm "down_sets_dense_thm"
);
=TEX
Now we show that any superset of a dense subset is dense:
=SML
val ⦏dense_superset_thm⦎ = (
set_goal([], ⌜∀X $<<A B ⦁ A ⊆ B ∧ B ⊆ X ∧ A DenseIn (X, $<<) ⇒ B DenseIn (X, $<<)⌝);
a(rewrite_tac order_defs THEN REPEAT strip_tac);
a(all_asm_fc_tac[]);
a(∃_tac⌜a⌝ THEN all_asm_fc_tac[] THEN REPEAT strip_tac);
save_pop_thm "dense_superset_thm"
);
=TEX
As a corollary, if $X$ has a dense subset its ordering is dense:
=SML
val ⦏dense_universe_thm⦎ = (
set_goal([], ⌜∀X $<<A ⦁ A ⊆ X ∧ A DenseIn (X, $<<) ⇒ Dense(X, $<<)⌝);
a(rewrite_tac[get_spec⌜Dense⌝] THEN REPEAT strip_tac);
a(bc_thm_tac dense_superset_thm);
a(∃_tac⌜A⌝ THEN REPEAT strip_tac THEN all_asm_fc_tac[]);
save_pop_thm "dense_universe_thm"
);
=TEX

Now we give a criterion for a downset to be a cut:
=SML
val ⦏downset_cut_thm⦎ = (
set_goal([], ⌜∀X $<< a⦁
	a ∈ X ∧ Trans(X, $<<) ∧
	UnboundedBelow(X, $<<) ∧ X DenseIn(X, $<<) ⇒
		DownSet(X, $<<, a) ∈ Cuts(X, $<<) ⌝);
a(rewrite_tac order_defs THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(LIST_GET_NTH_ASM_T [2] all_fc_tac);
a(contr_tac THEN all_asm_fc_tac[]);
(* *** Goal "2" *** *)
a(LIST_GET_NTH_ASM_T [3] all_fc_tac);
a(contr_tac THEN all_asm_fc_tac[]);
(* *** Goal "3" *** *)
a(∃_tac⌜a⌝ THEN REPEAT strip_tac THEN all_asm_fc_tac[]);
(* *** Goal "4" *** *)
a(all_asm_fc_tac[]);
save_pop_thm "downset_cut_thm"
);



=TEX
Now we give a criterion for one downset to be less than another
in the completion:
=SML
val ⦏down_sets_less_thm⦎ = (
set_goal([], ⌜∀X $<< a b⦁
	a ∈ X ∧ b ∈ X ∧ StrictLinearOrder(X, $<<) ⇒
		(DownSet(X, $<<, a) ⊂ DownSet(X, $<<, b) ⇔ a << b) ⌝);
a(rewrite_tac order_defs THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(cases_tac⌜x = a⌝ THEN1 (all_var_elim_asm_tac THEN all_asm_fc_tac[]));
a(all_asm_fc_tac[] THEN all_asm_fc_tac[]);
(* *** Goal "2" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "3" *** *)
a(∃_tac⌜a⌝ THEN contr_tac THEN all_asm_fc_tac[]);
save_pop_thm "down_sets_less_thm"
);
=TEX
Now we show that the cuts are unbounded (above, resp. below) if
the underlying ordered set is linear and unbounded (above, resp. below):
=SML
val ⦏cuts_unbounded_above_thm⦎ = (
set_goal([], ⌜∀X $<<⦁
	Irrefl(X, $<<) ∧ Trans(X, $<<) ∧
	UnboundedAbove(X, $<<) ∧ X DenseIn(X, $<<) ⇒
		UnboundedAbove(Cuts(X, $<<), $⊂) ⌝);
a(rewrite_tac order_defs THEN REPEAT strip_tac);
a(spec_nth_asm_tac 8 ⌜x'⌝);
a(∃_tac⌜{t| t ∈ X ∧ t << c}⌝ THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(contr_tac THEN all_asm_fc_tac[]);
(* *** Goal "2" *** *)
a(LIST_GET_NTH_ASM_T [11] all_fc_tac);
a(contr_tac THEN all_asm_fc_tac[]);
(* *** Goal "3" *** *)
a(∃_tac⌜c⌝ THEN REPEAT strip_tac);
(* *** Goal "4" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "5" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "6" *** *)
a(all_asm_fc_tac[] THEN all_asm_fc_tac[]);
(* *** Goal "7" *** *)
a(∃_tac⌜x'⌝ THEN REPEAT strip_tac);
a(contr_tac THEN all_asm_fc_tac[]);
save_pop_thm "cuts_unbounded_above_thm"
);
=TEX
=SML
val ⦏cuts_unbounded_below_thm⦎ = (
set_goal([], ⌜∀X $<<⦁
	Irrefl(X, $<<) ∧ Trans(X, $<<) ∧
	UnboundedBelow(X, $<<) ∧ X DenseIn(X, $<<) ⇒
		UnboundedBelow(Cuts(X, $<<), $⊂) ⌝);
a(rewrite_tac order_defs THEN REPEAT strip_tac);
a(spec_nth_asm_tac 6 ⌜x⌝);
a(∃_tac⌜{t| t ∈ X ∧ t << x}⌝ THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(spec_nth_asm_tac 9 ⌜x⌝);
a(∃_tac⌜c⌝ THEN REPEAT strip_tac);
(* *** Goal "2" *** *)
a(LIST_GET_NTH_ASM_T [10] all_fc_tac);
a(∃_tac⌜a⌝ THEN REPEAT strip_tac);
(* *** Goal "3" *** *)
a(∃_tac⌜x⌝ THEN REPEAT strip_tac);
(* *** Goal "4" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "5" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "6" *** *)
a(∃_tac⌜x⌝ THEN REPEAT strip_tac THEN all_asm_fc_tac[]);
save_pop_thm "cuts_unbounded_below_thm"
);
=TEX
Now we show that a dense, complete subset of a unbounded, dense set must be the whole set:
=SML
val ⦏dense_complete_subset_thm⦎ = (
set_goal([], ⌜∀X $<< A ⦁
	StrictLinearOrder(X, $<<) ∧ A ⊆ X ∧ UnboundedAbove(X, $<<) ∧ UnboundedBelow(X, $<<) ∧
	A DenseIn (X, $<<) ∧ Complete(A, $<<) ⇒ A = X⌝);
a(rewrite_tac order_defs THEN REPEAT strip_tac THEN1 all_asm_fc_tac[]);
a(list_spec_nth_asm_tac 5 [⌜x⌝]);
a(list_spec_nth_asm_tac 5 [⌜x⌝, ⌜c⌝]);
a(list_spec_nth_asm_tac 7 [⌜{y | y ∈ A ∧ y << x} ⌝, ⌜a⌝]);
(* *** Goal "1" *** *)
a(list_spec_nth_asm_tac 10 [⌜x⌝]);
a(list_spec_nth_asm_tac 11 [⌜c'⌝, ⌜x⌝]);
a(list_spec_nth_asm_tac 6 [⌜a'⌝]);
(* *** Goal "2" *** *)
a(list_spec_nth_asm_tac 11 [⌜b⌝, ⌜x⌝] THEN all_asm_fc_tac[]);
(* *** Goal "3" *** *)
a(list_spec_nth_asm_tac 16 [⌜a'⌝, ⌜x⌝, ⌜a⌝] THEN all_asm_fc_tac[]);
(* *** Goal "4" *** *)
a(LEMMA_T ⌜x = y⌝ asm_rewrite_thm_tac);
a(list_spec_nth_asm_tac 14 [⌜y⌝]);
a(contr_tac THEN list_spec_nth_asm_tac 17 [⌜x⌝, ⌜y⌝]);
(* *** Goal "4.1" *** *)
a(list_spec_nth_asm_tac 14 [⌜x⌝, ⌜y⌝]);
a(list_spec_nth_asm_tac 7 [⌜a'⌝]);
a(LIST_GET_NTH_ASM_T [23] all_fc_tac);
a(list_spec_nth_asm_tac 28 [⌜a''⌝, ⌜x⌝, ⌜a'⌝]);
(* *** Goal "4.2" *** *)
a(list_spec_nth_asm_tac 14 [⌜y⌝, ⌜x⌝]);
a(list_spec_nth_asm_tac 8 [⌜a'⌝]);
a(list_spec_nth_asm_tac 21 [⌜a'⌝]);
a(list_spec_nth_asm_tac 24 [⌜y⌝, ⌜a'⌝, ⌜y⌝]);
a(list_spec_nth_asm_tac 27 [⌜y⌝]);
save_pop_thm "dense_complete_subset_thm"
);
=TEX
Now we consider orderings induced by a function mapping a type to an ordered set.
The three partial order properties are inherited by the induced orderings:

Irreflexivity:
=SML
val ⦏induced_order_irrefl_thm⦎ = (
set_goal([], ⌜∀X $<< f⦁
	(∀a⦁f a ∈ X) ∧ Irrefl(X, $<<) ⇒
	Irrefl(Universe, (λa b⦁f a << f b))⌝);
a(rewrite_tac order_defs THEN REPEAT strip_tac);
a(POP_ASM_T bc_thm_tac THEN asm_rewrite_tac[]);
save_pop_thm "induced_order_irrefl_thm"
);
=TEX
For our purposes, we prove antisymmetry assuming the ordering to be irreflexive as well:
=SML
val ⦏induced_order_antisym_thm⦎ = (
set_goal([], ⌜∀X $<< f⦁
	(∀a⦁f a ∈ X) ∧  Irrefl(X, $<<) ∧ Antisym(X, $<<) ⇒
	Antisym(Universe, (λa b⦁f a << f b))⌝);
a(rewrite_tac order_defs THEN REPEAT strip_tac);
a(cases_tac⌜f x = f y⌝ THEN1 (asm_rewrite_tac[] THEN asm_prove_tac[]));
a(DROP_NTH_ASM_T 4(ante_tac o list_∀_elim[⌜f x⌝, ⌜f y⌝]) THEN asm_rewrite_tac[]);
save_pop_thm "induced_order_antisym_thm"
);
=TEX
Transitivity:
=SML
val ⦏induced_order_trans_thm⦎ = (
set_goal([], ⌜∀X $<< f⦁
	(∀a⦁f a ∈ X) ∧ Trans(X, $<<) ⇒
	Trans(Universe, (λa b⦁f a << f b))⌝);
a(rewrite_tac order_defs THEN REPEAT strip_tac);
a(GET_NTH_ASM_T 3 bc_thm_tac THEN ∃_tac⌜f y⌝ THEN asm_rewrite_tac[]);
save_pop_thm "induced_order_trans_thm"
);
=TEX
Linearity requires the function to be one-one:
=SML
val ⦏induced_order_trich_thm⦎ = (
set_goal([], ⌜∀X $<< f⦁
	(∀a⦁f a ∈ X) ∧ OneOne f ∧ Trich(X, $<<) ⇒
	Trich(Universe, (λa b⦁f a << f b))⌝);
a(rewrite_tac (one_one_def::order_defs) THEN REPEAT strip_tac);
a(cases_tac⌜f x = f y⌝ THEN1 all_asm_fc_tac[]);
a(DROP_NTH_ASM_T 4 (ante_tac o list_∀_elim[⌜f x⌝, ⌜f y⌝]) THEN asm_rewrite_tac[]);
save_pop_thm "induced_order_trich_thm"
);
=TEX
We put the above pieces together to give convenience theorems for
partial and linear orders:
=SML
val ⦏induced_strict_partial_order_thm⦎ = (
set_goal([], ⌜∀X $<< f⦁
	(∀a⦁f a ∈ X) ∧ StrictPartialOrder(X, $<<) ⇒
	StrictPartialOrder(Universe, (λa b⦁f a << f b))⌝);
a(pure_rewrite_tac [get_spec⌜StrictPartialOrder⌝] THEN REPEAT strip_tac THEN
	all_fc_tac[induced_order_irrefl_thm, induced_order_antisym_thm, induced_order_trans_thm]);
save_pop_thm "induced_strict_partial_order_thm"
);
=TEX
=SML
val ⦏induced_strict_linear_order_thm⦎ = (
set_goal([], ⌜∀X $<< f⦁
	(∀a⦁f a ∈ X) ∧ OneOne f ∧ StrictLinearOrder(X, $<<) ⇒
	StrictLinearOrder(Universe, (λa b⦁f a << f b))⌝);
a(pure_rewrite_tac [get_spec⌜StrictLinearOrder⌝] THEN REPEAT strip_tac THEN
	all_fc_tac[induced_strict_partial_order_thm, induced_order_trich_thm]);
save_pop_thm "induced_strict_linear_order_thm"
);
=TEX
Sufficient conditions for completeness are that the function
be one-one and that it map onto the ordered set:
=SML
val ⦏induced_order_complete_thm⦎ = (
set_goal([], ⌜∀X $<< f⦁
	(∀a⦁f a ∈ X) ∧ OneOne f ∧ (∀x⦁x ∈ X ⇒ ∃a⦁x = f a) ∧ Complete(X, $<<) ⇒
	Complete(Universe, (λa b⦁f a << f b))⌝);
a(rewrite_tac (one_one_def::order_defs) THEN REPEAT strip_tac);
a(DROP_NTH_ASM_T 4
	(ante_tac o list_∀_elim[⌜{s|s ∈ X ∧ ∃c⦁c ∈ A ∧ s = f c}⌝, ⌜f x⌝]) THEN
	asm_rewrite_tac[]);
a(contr_tac);
(* *** Goal "1" *** *)
a(swap_nth_asm_concl_tac 2 THEN REPEAT strip_tac);
a(∃_tac⌜f x'⌝ THEN REPEAT strip_tac THEN1 asm_rewrite_tac[]);
a(∃_tac⌜x'⌝ THEN REPEAT strip_tac);
(* *** Goal "2" *** *)
a(all_var_elim_asm_tac1);
a(swap_nth_asm_concl_tac 2 THEN REPEAT strip_tac);
a(LIST_GET_NTH_ASM_T [5] all_fc_tac);
a(∃_tac⌜f c'⌝ THEN asm_rewrite_tac[]);
a(∃_tac⌜c'⌝ THEN REPEAT strip_tac);
(* *** Goal "3" *** *)
a(all_var_elim_asm_tac1 THEN all_asm_fc_tac[]);
(* *** Goal "4" *** *)
a(swap_nth_asm_concl_tac 1 THEN REPEAT strip_tac THEN rewrite_tac[]);
a(spec_nth_asm_tac 7 ⌜y⌝ THEN all_var_elim_asm_tac1);
a(∃_tac⌜a⌝ THEN REPEAT strip_tac);
(* *** Goal "4.1" *** *)
a(swap_nth_asm_concl_tac 3 THEN REPEAT strip_tac);
a(∃_tac⌜f a'⌝ THEN asm_rewrite_tac[] THEN REPEAT strip_tac);
a(∃_tac⌜a'⌝ THEN REPEAT strip_tac);
(* *** Goal "4.2" *** *)
a(swap_nth_asm_concl_tac 2 THEN REPEAT strip_tac);
a(∃_tac⌜f y'⌝ THEN asm_rewrite_tac[] THEN REPEAT strip_tac);
a(all_var_elim_asm_tac1 THEN all_asm_fc_tac[]);
save_pop_thm "induced_order_complete_thm"
);
=TEX
Sufficient conditions for a subset to be dense are that the function
be one-one and onto and that the subset map onto a dense subset of the ordered set:
=SML
val ⦏induced_order_dense_thm⦎ = (
set_goal([], ⌜∀X $<< f A ⦁
	(∀a⦁f a ∈ X) ∧ OneOne f ∧ (∀x⦁x ∈ X ⇒ ∃a⦁x = f a) ∧
	{x | ∃a⦁ a ∈ A ∧ x = f a} DenseIn(X, $<<) ⇒
	A DenseIn(Universe, (λa b⦁f a << f b))⌝);
a(rewrite_tac (one_one_def::order_defs) THEN REPEAT strip_tac);
a(lemma_tac ⌜f x ∈ X ∧ f y ∈ X⌝ THEN1 asm_rewrite_tac[]);
a(LIST_GET_NTH_ASM_T [4] all_fc_tac THEN all_var_elim_asm_tac1);
a(∃_tac⌜a'⌝ THEN REPEAT strip_tac);
save_pop_thm "induced_order_dense_thm"
);
=TEX
Similarly for unboundedness (above and below):
=SML
val ⦏induced_order_unbounded_above_thm⦎ = (
set_goal([], ⌜∀X $<< f⦁
	(∀a⦁f a ∈ X) ∧ OneOne f ∧ (∀x⦁x ∈ X ⇒ ∃a⦁x = f a) ∧ UnboundedAbove(X, $<<) ⇒
	UnboundedAbove(Universe, (λa b⦁f a << f b))⌝);
a(rewrite_tac (one_one_def::order_defs) THEN REPEAT strip_tac);
a(spec_nth_asm_tac 1 ⌜f b⌝ THEN all_asm_fc_tac[]);
a(∃_tac ⌜a⌝ THEN all_var_elim_asm_tac1);
save_pop_thm "induced_order_unbounded_above_thm"
);
=TEX
=SML
val ⦏induced_order_unbounded_below_thm⦎ = (
set_goal([], ⌜∀X $<< f⦁
	(∀a⦁f a ∈ X) ∧ OneOne f ∧ (∀x⦁x ∈ X ⇒ ∃a⦁x = f a) ∧ UnboundedBelow(X, $<<) ⇒
	UnboundedBelow(Universe, (λa b⦁f a << f b))⌝);
a(rewrite_tac (one_one_def::order_defs) THEN REPEAT strip_tac);
a(spec_nth_asm_tac 1 ⌜f b⌝ THEN all_asm_fc_tac[]);
a(∃_tac ⌜a⌝ THEN all_var_elim_asm_tac1);
save_pop_thm "induced_order_unbounded_below_thm"
);
=TEX
=TEX
\section{EPILOGUE}
=SML
end (* of structure Orders *);
open Orders;
=TEX
\twocolumn[\section{INDEX}]
\small
\printindex

\end{document}









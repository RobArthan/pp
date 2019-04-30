=IGN
********************************************************************************
dtd115.doc: this file is part of the PPHol system

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

\def\Title{ Detailed Design: Theory of Orderings }

\def\Abstract{\begin{center}
{\bf Abstract}\par\parbox{0.7\hsize}
{\small This document gives the detailed design for a theory
of orderings that is used in constructing the representation
type for the real numbers in \ProductHOL.}
\end{center}}

\def\Reference{LEMMA1/HOL/DTD115}

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
\item[Issue 1.1 (2000/12/05)] Initial development draft.
\item[Issue 1.2 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.3 (2002/10/17)] PPHol-specific updates for open source release
\item[Issues 1.4 (2003/04/09), 1.5 (2003/04/09)] Reworked definition of antisymmetry so that it no longer entails irreflexivity.
This also involves removal of {\it down\_sets\_dense\_thm1} (which is now the same as
{\it down\_sets\_dense\_thm} and a change to {\it induced\_order\_antisym\_thm} (which
now needs to assume irreflexivity). Also made spelling of {\it down\_sets}.
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
The real numbers are constructed in HOL by completing
a given dense unbounded linearly ordered set satisfying certain order-theoretic
and algebraic properties.
This construction is carried out in \cite{LEMMA1/HOL/DTD116}.
This module provides some general definitions and theorems about orderings to support this
construction.


\subsection{Purpose and Background}
See \cite{DS/FMU/IED/HLD011}.


\section{PREAMBLE}
=SML
force_delete_theory"orders" handle Fail _ => ();
open_theory"sets";
set_merge_pcs["basic_hol", "'sets_alg"];
new_theory"orders";
=THDOC
req_name ⦏"orders"⦎ (Value "sets");
set_flag("tc_thms_only",true);
=DESCRIBE
The theory orders contains various definitions and theorems relating to ordered
sets.
=ENDDOC
=TEX
\section{DEFINITIONS}
We will use the symbols `$<<$' and `$<<<$' for variables ranging over orderings
in the definitions and the theorems. It is pleasant to use infix notation for these.

=SML
declare_infix(210, "<<");
declare_infix(210, "<<<");
=TEX
ⓈHOLCONST
│ ⦏Irrefl⦎ : ('a SET × ('a → 'a → BOOL)) → BOOL
├──────
│ ∀ X $<<⦁
│	Irrefl(X, $<<)
│ ⇔	∀x⦁ x ∈ X ⇒ ¬x << x
■
ⓈHOLCONST
│ ⦏Antisym⦎ : ('a SET × ('a → 'a → BOOL)) → BOOL
├──────
│ ∀ X $<<⦁
│	Antisym(X, $<<)
│ ⇔	∀x y⦁ x ∈ X ∧ y ∈ X ∧ ¬x = y ⇒ ¬(x << y ∧ y << x)
■
ⓈHOLCONST
│ ⦏Trans⦎ : ('a SET × ('a → 'a → BOOL)) → BOOL
├──────
│ ∀ X $<<⦁
│	Trans(X, $<<)
│⇔	∀x y z⦁ x ∈ X ∧ y ∈ X ∧ z ∈ X ∧ x << y ∧ y << z ⇒ x << z
■
ⓈHOLCONST
│ ⦏StrictPartialOrder⦎ : ('a SET × ('a → 'a → BOOL)) → BOOL
├──────
│ ∀ X $<<⦁
│	StrictPartialOrder(X, $<<)
│ ⇔	Irrefl(X, $<<) ∧ Antisym(X, $<<) ∧ Trans(X, $<<)
■
ⓈHOLCONST
│ ⦏Trich⦎ : ('a SET × ('a → 'a → BOOL)) → BOOL
├──────
│ ∀ X $<<⦁
│	Trich(X, $<<)
│ ⇔	∀x y⦁ x ∈ X ∧ y ∈ X ∧ ¬x = y ⇒ x << y ∨ y << x
■
ⓈHOLCONST
│ ⦏StrictLinearOrder⦎ : ('a SET × ('a → 'a → BOOL)) → BOOL
├──────
│ ∀ X $<<⦁ StrictLinearOrder(X, $<<) ⇔ StrictPartialOrder(X, $<<) ∧ Trich(X, $<<)
■
=SML
declare_infix(210, "DenseIn");
=TEX
ⓈHOLCONST
│ $⦏DenseIn⦎ : 'a SET → ('a SET × ('a → 'a → BOOL)) → BOOL
├──────
│ ∀ A X $<<⦁
│	A DenseIn (X, $<<)
│ ⇔	∀x y⦁ x ∈ X ∧ y ∈ X ∧ x << y ⇒ ∃a⦁a ∈ A ∧ x << a ∧ a << y
■
ⓈHOLCONST
│ ⦏Dense⦎ : ('a SET × ('a → 'a → BOOL)) → BOOL
├──────
│ ∀ X $<<⦁ Dense (X, $<<) ⇔ X DenseIn (X, $<<)
■
ⓈHOLCONST
│ ⦏UpperBound⦎ : ('a SET × ('a → 'a → BOOL) × 'a) → BOOL
├──────
│ ∀ A $<< x⦁ UpperBound(A, $<<, x) ⇔ ∀a⦁ a ∈ A ⇒ a << x
■
=SML
declare_infix(210, "HasSupremum");
ⓈHOLCONST
│ $⦏HasSupremum⦎ : 'a SET → ('a × 'a SET × ('a → 'a → BOOL)) → BOOL
├──────
│ ∀ A $<< x X⦁ A HasSupremum(x, X, $<<) ⇔
│ UpperBound(A, $<<, x) ∧ ∀y⦁ y ∈ X ∧ UpperBound(A, $<<, y) ⇒ ¬y << x
■
ⓈHOLCONST
│ ⦏UnboundedAbove⦎ : ('a SET × ('a → 'a → BOOL)) → BOOL
├──────
│ ∀ A $<<⦁ UnboundedAbove(A, $<<) ⇔ ∀b⦁ b ∈ A ⇒ ∃c⦁ c ∈ A ∧ b << c
■
ⓈHOLCONST
│ ⦏UnboundedBelow⦎ : ('a SET × ('a → 'a → BOOL)) → BOOL
├──────
│ ∀ A $<<⦁ UnboundedBelow(A, $<<) ⇔ ∀b⦁ b ∈ A ⇒ ∃c⦁ c ∈ A ∧ c << b
■
ⓈHOLCONST
│ ⦏Complete⦎ : ('a SET × ('a → 'a → BOOL)) → BOOL
├──────
│ ∀ X $<<⦁
│	Complete(X, $<<)
│⇔	∀A x⦁	¬A = {} ∧ A ⊆ X
│	∧	UnboundedAbove(A, $<<)
│	∧	x ∈ X
│	∧	UpperBound(A, $<<, x)
│	⇒	∃y⦁ y ∈ X ∧ A HasSupremum(y, X, $<<)
■
ⓈHOLCONST
│ ⦏Cuts⦎ : ('a SET × ('a → 'a → BOOL)) → 'a SET SET
├──────
│ ∀ X $<< A⦁
│	A ∈ Cuts(X, $<<)
│ ⇔		A ⊆ X
│	∧	¬A = {}
│	∧	UnboundedAbove(A, $<<)
│	∧	(∃x⦁ x ∈ X ∧ UpperBound(A, $<<, x))
│	∧	(∀a b⦁ a ∈ A ∧ b ∈ X ∧ b << a ⇒ b ∈ A)
■
ⓈHOLCONST
│ ⦏DownSet⦎ : ('a SET × ('a → 'a → BOOL) × 'a) → 'a SET
├──────
│ ∀ X $<< x⦁
│	DownSet(X, $<<, x) = { y | y ∈ X ∧ y << x }
■
ⓈHOLCONST
│ ⦏DownSets⦎ : ('a SET × ('a → 'a → BOOL) × 'a SET) → 'a SET SET
├──────
│ ∀ X $<< A s⦁
│	s ∈ DownSets(X, $<<, A)
│ ⇔	∃x⦁ x ∈ A ∧ s = DownSet(X, $<<, x)
■
=TEX
\section{THEOREMS}
=THDOC
req_thm(⦏"⊂_irrefl_thm"⦎, ([], ⌜
	∀ V⦁ Irrefl (V, $⊂)
⌝));
req_thm(⦏"⊂_antisym_thm"⦎, ([], ⌜
	∀ V⦁ Antisym (V, $⊂)
⌝));
req_thm(⦏"⊂_trans_thm"⦎, ([], ⌜
	∀ V⦁ Trans (V, $⊂)
⌝));
=DESCRIBE
The ordering given by strict inclusion of sets is irreflexive, antisymmetric and
transitive.
=ENDDOC
=THDOC
req_thm(⦏"cuts_trich_thm"⦎, ([], ⌜
	∀ X $<<⦁
	Trans (X, $<<)
∧	Trich (X, $<<)
⇒	Trich (Cuts (X, $<<), $⊂)
⌝));
req_thm(⦏"cuts_strict_partial_order_thm"⦎, ([], ⌜
	∀ X $<<⦁
	StrictPartialOrder (Cuts (X, $<<), $⊂)
⌝));
req_thm(⦏"cuts_strict_linear_order_thm"⦎, ([], ⌜
	∀ X $<<⦁
	StrictLinearOrder (X, $<<)
⇒	StrictLinearOrder (Cuts (X, $<<), $⊂)
⌝));
req_thm(⦏"cuts_complete_thm"⦎, ([], ⌜
	∀ X $<<⦁ 	Complete (Cuts (X, $<<), $⊂)
⌝));
=DESCRIBE
The ordering given by strict inclusion on the cuts (i.e., downwards-closed, unbounded-above
sections) of a trichotomous (resp. partial, resp. linear, resp. complete)
order is itself trichotomous (resp. partial, resp. linear, resp. complete).
=ENDDOC
=THDOC
req_thm(⦏"down_sets_cuts_thm"⦎, ([], ⌜
	∀ X $<< A⦁
	A ⊆ X
∧	Irrefl (X, $<<)
∧	Trans (X, $<<)
∧	UnboundedBelow (A, $<<)
∧	A DenseIn (X, $<<)
⇒	DownSets (X, $<<, A) ⊆ Cuts (X, $<<)
⌝));
req_thm(⦏"down_sets_dense_thm"⦎, ([], ⌜
	∀ X $<< A⦁
	A ⊆ X
∧	StrictLinearOrder (X, $<<)
∧	UnboundedBelow (A, $<<)
∧	A DenseIn (X, $<<)
⇒	DownSets (X, $<<, A) DenseIn (Cuts (X, $<<), $⊂)
⌝));
=DESCRIBE
The down-sets in an order are themselves cuts,
and dense in the cuts in that order under appropriate hypotheses.
(The second theorem gives precise conditions, the third one gives useful ones).
=ENDDOC
=THDOC
req_thm(⦏"dense_superset_thm"⦎, ([], ⌜
	∀ X $<< A B⦁
	A ⊆ B
∧	B ⊆ X
∧	A DenseIn (X, $<<)
⇒	B DenseIn (X, $<<)
⌝));
req_thm(⦏"dense_universe_thm"⦎, ([], ⌜
	∀ X $<< A⦁
	A ⊆ X
∧	A DenseIn (X, $<<)
⇒	Dense (X, $<<)
⌝));
=DESCRIBE
A superset of a dense subset is dense; if an ordered set has a dense subset then it
is itself dense.
=ENDDOC
=THDOC
req_thm(⦏"downset_cut_thm"⦎, ([], ⌜
	∀ X $<< a⦁
	a ∈ X
∧	Trans (X, $<<)
∧	UnboundedBelow (X, $<<)
∧	X DenseIn (X, $<<)
⇒	DownSet (X, $<<, a) ∈ Cuts (X, $<<)
⌝));
req_thm(⦏"down_sets_less_thm"⦎, ([], ⌜
	∀ X $<< a b⦁
	a ∈ X
∧	b ∈ X
∧	StrictLinearOrder (X, $<<)
⇒	(DownSet (X, $<<, a) ⊂ DownSet (X, $<<, b) ⇔ a << b)
⌝));
=DESCRIBE
An individual downset is a cut under suitable hypotheses.
In a linear order, the downset determined by $a$ is a proper subset of determined by $b$
off/ $a$ precedes $b$.
=ENDDOC

=THDOC
req_thm(⦏"cuts_unbounded_above_thm"⦎, ([], ⌜
	∀ X $<<⦁
	Irrefl (X, $<<)
∧	Trans (X, $<<)
∧	UnboundedAbove (X, $<<)
∧	X DenseIn (X, $<<)
⇒	UnboundedAbove (Cuts (X, $<<), $⊂)
⌝));
req_thm(⦏"cuts_unbounded_below_thm"⦎, ([], ⌜
	∀ X $<<⦁
	Irrefl (X, $<<)
∧	Trans (X, $<<)
∧	UnboundedBelow (X, $<<)
∧	X DenseIn (X, $<<)
⇒	UnboundedBelow (Cuts (X, $<<), $⊂)
⌝));
=DESCRIBE
Under suitable hypotheses, the cuts in an ordering are unbounded below and above.
=ENDDOC
=THDOC
req_thm(⦏"dense_complete_subset_thm"⦎, ([], ⌜
	∀ X $<< A⦁
	StrictLinearOrder (X, $<<)
∧	A ⊆ X
∧	UnboundedAbove (X, $<<)
∧	UnboundedBelow (X, $<<)
∧	A DenseIn (X, $<<)
∧	Complete (A, $<<)
⇒	A = X
⌝));
=DESCRIBE
The only possible complete and dense subset of an ordered set is the whole set.
=ENDDOC
=THDOC
req_thm(⦏"induced_order_irrefl_thm"⦎, ([], ⌜
	∀ X $<< f⦁
	(∀ a⦁ f a ∈ X)
∧	Irrefl (X, $<<)
⇒	Irrefl (Universe, (λ a b⦁ f a << f b))
⌝));
req_thm(⦏"induced_order_antisym_thm"⦎, ([], ⌜
	∀ X $<<
	f⦁ (∀ a⦁ f a ∈ X)
∧	Irrefl(X, $<<)
∧	Antisym (X, $<<)
⇒	Antisym (Universe, (λ a b⦁ f a << f b))
⌝));
req_thm(⦏"induced_order_trans_thm"⦎, ([], ⌜
	∀ X $<< f⦁
	(∀ a⦁ f a ∈ X)
∧	Trans (X, $<<)
⇒	Trans (Universe, (λ a b⦁ f a << f b))
⌝));
req_thm(⦏"induced_order_trich_thm"⦎, ([], ⌜
	∀ X $<< f⦁
	(∀ a⦁ f a ∈ X)
∧	OneOne f
∧	Trich (X, $<<)
⇒	Trich (Universe, (λ a b⦁ f a << f b))
⌝));
=DESCRIBE
Orders induced by a function inherit various order properties under appropriate hypotheses.
=ENDDOC
=THDOC
req_thm(⦏"induced_strict_partial_order_thm"⦎, ([], ⌜
	∀ X $<< f⦁
	(∀ a⦁ f a ∈ X)
∧	StrictPartialOrder (X, $<<)
⇒	StrictPartialOrder (Universe, (λ a b⦁ f a << f b))
⌝));
req_thm(⦏"induced_strict_linear_order_thm"⦎, ([], ⌜
	∀ X $<< f⦁
	(∀ a⦁ f a ∈ X)
∧	OneOne f
∧	StrictLinearOrder (X, $<<)
⇒	StrictLinearOrder (Universe, (λ a b⦁ f a << f b))
⌝));
=DESCRIBE
Orders induced by a function inherit further order properties under appropriate hypotheses.
=ENDDOC
=THDOC
req_thm(⦏"induced_order_complete_thm"⦎, ([], ⌜
	∀ X $<< f⦁
	(∀ a⦁ f a ∈ X)
∧	OneOne f
∧	(∀ x⦁ x ∈ X
⇒	(∃ a⦁ x = f a))
∧	Complete (X, $<<)
⇒	Complete (Universe, (λ a b⦁ f a << f b))
⌝));
req_thm(⦏"induced_order_dense_thm"⦎, ([], ⌜
	∀ X $<< f A⦁
	(∀ a⦁ f a ∈ X)
∧	OneOne f
∧	(∀ x⦁ x ∈ X ⇒ (∃ a⦁ x = f a))
∧	{x|∃ a⦁ a ∈ A ∧ x = f a} DenseIn (X, $<<)
⇒	A DenseIn (Universe, (λ a b⦁ f a << f b))
⌝));
req_thm(⦏"induced_order_unbounded_above_thm"⦎, ([], ⌜
	∀ X $<< f⦁
	(∀ a⦁ f a ∈ X)
∧	OneOne f
∧	(∀ x⦁ x ∈ X ⇒ (∃ a⦁ x = f a))
∧	UnboundedAbove (X, $<<)
⇒	UnboundedAbove (Universe, (λ a b⦁ f a << f b))
⌝));
req_thm(⦏"induced_order_unbounded_below_thm"⦎, ([], ⌜
	∀ X $<< f⦁
	(∀ a⦁ f a ∈ X)
∧	OneOne f
∧	(∀ x⦁ x ∈ X ⇒ (∃ a⦁ x = f a))
∧	UnboundedBelow (X, $<<)
⇒	UnboundedBelow (Universe, (λ a b⦁ f a << f b))
⌝));
=DESCRIBE
Orders induced by a function inherit yet more order properties under appropriate hypotheses.
=ENDDOC
\section{SIGNATURE}
=TEX
=DOC
signature ⦏Orders⦎ = sig
val ⦏down_sets_def⦎ : THM;		val ⦏down_set_def⦎ : THM;
val ⦏cuts_def⦎ : THM;			val ⦏complete_def⦎ : THM;
val ⦏unbounded_below_def⦎ : THM;	val ⦏unbounded_above_def⦎ : THM;
val ⦏has_supremum_def⦎ : THM;	val ⦏upper_bound_def⦎ : THM;
val ⦏dense_def⦎ : THM;			val ⦏dense_in_def⦎ : THM;
val ⦏strict_linear_order_def⦎ : THM;		val ⦏trich_def⦎ : THM;
val ⦏strict_partial_order_def⦎ : THM;		val ⦏trans_def⦎ : THM;
val ⦏antisym_def⦎ : THM;		val ⦏irrefl_def⦎ : THM;
val ⦏⊂_irrefl_thm⦎ : THM;		val ⦏⊂_antisym_thm⦎ : THM;
val ⦏⊂_trans_thm⦎ : THM;		val ⦏cuts_trich_thm⦎ : THM;
val ⦏cuts_strict_partial_order_thm⦎ : THM;	val ⦏cuts_strict_linear_order_thm⦎ : THM;
val ⦏cuts_complete_thm⦎ : THM;	val ⦏down_sets_cuts_thm⦎ : THM;
val ⦏down_sets_dense_thm⦎ : THM;
val ⦏dense_superset_thm⦎ : THM;	val ⦏dense_universe_thm⦎ : THM;
val ⦏downset_cut_thm⦎ : THM;		val ⦏down_sets_less_thm⦎ : THM;
val ⦏cuts_unbounded_above_thm⦎ : THM;
val ⦏cuts_unbounded_below_thm⦎ : THM;
val ⦏dense_complete_subset_thm⦎ : THM;
val ⦏induced_order_irrefl_thm⦎ : THM;
val ⦏induced_order_antisym_thm⦎ : THM;
val ⦏induced_order_trans_thm⦎ : THM;
val ⦏induced_order_trich_thm⦎ : THM;
val ⦏induced_strict_partial_order_thm⦎ : THM;
val ⦏induced_strict_linear_order_thm⦎ : THM;
val ⦏induced_order_complete_thm⦎ : THM;
val ⦏induced_order_dense_thm⦎ : THM;
val ⦏induced_order_unbounded_above_thm⦎ : THM;
val ⦏induced_order_unbounded_below_thm⦎ : THM;
end (* of signature Orders *);
=DESCRIBE
This is the signature of a structure giving ML bindings for the definitions and theorems
in the theory {\it orders}.
=ENDDOC
=TEX
\section{TEST POLICY}
The module tests for this module are to follow the guidelines
laid down in the quality plan~\cite{DS/FMU/IED/PLN007}.
These require only a theory contents check, since there are
no functional components in this module.


\twocolumn[\section{INDEX}]
\small
\printindex

\end{document}









=IGN
********************************************************************************
usr013G.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
=TEX
% usr013G.doc $Date: 2002/10/18 15:26:07 $ $Revision: 2.4 $ $RCSfile: usr013G.doc,v $
% COPYRIGHT (c) Lemma 1 Ltd.
\ignore{
=SML
(* usr013G.sml $Date: 2002/10/18 15:26:07 $ $Revision: 2.4 $ $RCSfile: usr013G.doc,v $
   COPYRIGHT (c) Lemma 1 Ltd. *)
=TEX
}

\chapter{PREDICATE CALCULUS}

This chapter considers the three most important facilities in {\Product} for reasoning essentially within the first order predicate calculus with equality, and a number of miscellaneous tactics concerned with the predicate calculus.

The core functionality of each of these facilities is within the predicate calculus, but they all include context sensitive pre- and post-processing which may be set up to incorporate knowledge of broader areas.

The facilities are:

\begin{itemize}
\item
{\it stripping}

The facilities in this group are frequently used, being invoked continually during most proofs, and are almost entirely determined by context.
Stripping is the principal technique for dealing with propositional connectives and for this reason is the source of most of the case splitting which occurs in {\Product} proofs.

\item
{\it forward chaining}

Forward chaining is in most applications the most convenient way of instantiating generalised implications which are among the assumptions of the current goal, or among the theorems previous proven.

\item
{\it rewriting}

The rewriting facilities provide support for using equations to transform {\theorem}s or {\goal}s.

\end{itemize}

\section{Stripping}

The ⦏stripping⦎ facilities, most frequently invoked using ⦏strip_tac⦎, provide systematic ways of simplifying both the conclusion of a goal and assumptions introduced during a proof.

Stripping the conclusion is the primary purpose of {\it strip_tac}, one invocation of which will perform one step of transformation on the conclusion.

New assumptions are commonly created by the stripping of a conclusion which is an implication, but forward inference from the assumptions also results in the creation of new assumptions.
The default action on creating a new assumption is to completely strip the assumption before adding it to the current assumptions.

Most of the effects created when stripping either conclusions or assumptions are achieved by the application of equational transformations to the existing conclusion or the new assumption.
All such changes are configurable, and the set of such transformations in force at any time is determined by the current {\proofcontext}.
The small set of actions of the stripping facilities which are not configurable, are just those effects necessary to make stripping capable of solving propositional tautologies and to do the few completely uncontroversial quantifier rules (essentially `skolemisation' of quantifiers).

To understand the behaviour of the stripping facilities (which is not necessary to use them successfully), you need to understand what the built in actions are, and what conversions are applied in any particular context.
In this section we are concerned only with those configurable actions which are concerned with reasoning in the predicate calculus.
Almost all proof contexts will include these actions as well as further actions relating to the non-predicate calculus reasoning which is to be exploited.

In the following sections we therefore describe the built in actions on stripping conclusions and assumptions, and then the conversions normally in place which relate to the predicate calculus.

\begin{itemize}
\item
``stripping'' facilities incorporate automatic propositional reasoning and enable domain specific knowledge to be invoked automatically during proof.
\item
$strip_tac$ processes the conclusion of the current goal
\item
When new assumptions are created, by $strip_tac$ or otherwise, they are normally stripped before being entered into the assumption list.
\item
Stripping of assumptions is different from stripping of conclusions.
\end{itemize}

\subsection{Stripping Conclusions}

There are three logical constructs whose behaviour is built in, because the required behaviour is more complex than simply transforming the conclusion itself.

\begin{itemize}
\item
conjunctions

are built in because the stripping of a conjunction is required to produce a split into two subgoals.

\item
implications

are built in because stripping an implication causes the left hand side of the implication to be made into a new assumption.

\item
universals

are built in because, though the processing of a universal results in its elimination by skolemisation, this effect is not obtainable by an equational transformation (because the new conclusion is not logically equivalent to the old).

\item
discharge

finally, a number of checks are built in which may result in the discharge of the subgoal
\end{itemize}

The effect of stripping the conclusion of the current goal is therefore as follows:

\begin{enumerate}
\item
apply conclusion stripping conversions from proof context
\item
if no conversion applies then attempt one of the following:
\begin{enumerate}
\item :
=GFT
	.. ?⊢ ∀x⦁ P x ===> .. ?⊢ P x'
=TEX
\item :
=GFT
	.. ?⊢ P1 ∧ P2 ===>
		.. ?⊢ P1 and .. ?⊢ P2 (two subgoals)
=TEX
\item :
=GFT
	.. ?⊢ P1 ⇒ P2 ===>
		strip_asm_tac(P1), .. ?⊢ P2
=TEX
\end{enumerate}
\item
then check if:
\begin{enumerate}
\item conclusion of the goal is ⌜T⌝
\item conclusion is in the assumptions
\end{enumerate}
if so, prove the result
\end{enumerate}

The following transformations on conclusions concerning the predicate calculus, though not built in to the action of the stripping facilities, are present in almost all proof contexts:

\begin{itemize}
\item
equivalence statements are transformed to conjunctions
\item
disjunctions are transformed into implications
\item
negations are pushed in over any logical construct using de-Morgans laws and double negations are cancelled
\end{itemize}

\subsection{Stripping Assumptions}

Like the stripping of conclusions, the stripping of assumptions has a number of actions built in, as well as applying transformations from the current proof context.
Unlike the stripping of conclusions, the norm is to completely strip an assumption prior to adding it into the assumptions, rather than to transform assumptions one step at a time.

In summary the built in effects of assumption stripping are:

\begin{itemize}
\item
conjunctions

are broken in to two parts each of which is treated as a separate assumption

\item
disjunctions

give rise to case splits, each resulting subgoal having just one side of the disjunction stripped into its assumptions

\item
existentials

are eliminated by skolemisation

\item
checks

a set of checks (not the same as the ones used when stripping conclusions) is made which may result in discharge of the subgoal
\end{itemize}

More precisely the algorithm is as follows:

\begin{enumerate}
\item
Repeat the following transformations until no further changes occur:
\begin{enumerate}
\item :
apply assumption stripping conversions from proof context
\item :
=GFT
	∃x⦁ P x ⊢? .. ===> P x' ⊢? ..
=TEX
\item :
=GFT
	P1 ∨ P2 ⊢? .. ===>
		P1 ⊢? .. and P2 ⊢? .. (two subgoals)
=TEX
\item :
=GFT
	P1 ∧ P2 ⊢? .. ===>
		P1, P2 ⊢? .. (two assumptions)
=TEX
\end{enumerate}
\item
then for each resulting assumption, check if:
\begin{enumerate}
\item assumption = ⌜F⌝
\item assumption = concl
\item contradicts an existing assumption
\end{enumerate}
if so, prove the result.
\item
also check if:
\begin{enumerate}
\item assumption = ⌜T⌝
\item is same as an existing assumption
\end{enumerate}
if so, discard the assumption.
\end{enumerate}

Configured transformations for assumptions concerning the predicate caculus are:

\begin{itemize}
\item
equivalence statements are transformed to conjunctions
\item
implications are transformed to disjunctions
\item
negations are pushed in over any logical construct using demorgans laws and double negations are cancelled
\end{itemize}

%\subsection{summary of logical effects of stripping}
You should now be able to attempt the exercises in section \ref{Stripping}.

\section{Rewriting}

A large amount of the power of {\Product} comes from its general purpose ⦏rewriting⦎ facilities.
These are primarily used to transform the conclusion of the current goal using universal equations which are automatically instantiated to values which enable the conclusion to be rewritten (where possible).
The facility is more general and powerful than can be achieved simply by application of a finite set of generalised equations.
Arbitary algorithms which yield equational results can be invoked during the rewriting process, permitting simplifications which would not otherwise have been possible.
For example, in most contexts rewriting peforms beta-reduction automatically whenever an application of a lambda-abstraction is found, even though beta-reduction is a rule which cannot be expressed as a theorem even in higher order logic (other than by stepping up into the metalanguage).

Because the reasoning involved in rewriting is equational it is applicable in several different ways, hence the rewriting facilities are available not only as {\tactic}s but also as {\it conv}ersions and {\it rule}s.
In addition, the facilities provide for two distinct strategies for traversing the {\term} under transformation, (the occurrence of {\it once} in the name of the function indicating a strategy intended to prevent looping).
Finally, the clauses which are used in the rewriting process will normally include a set of defaults determined by the current proof context to be applied, in addition to the clauses derived from theorems supplied as parameters to the function.

$$ [pure_] [once_] [asm_] ⦏rewrite⦎_ \cases{conv \cr rule \cr tac \cr thm_tac} $$
	
$$ :THM\ list -> \cases{conv (= TERM -> THM)\cr THM -> THM\cr TACTIC\cr } \hfill $$

$$ :THM -> TACTIC \hfill$$

rewrites the term, theorem or goal using:


\begin{itemize}
\item
conversions in {\proofcontext} (unless {\it pure})
\item
assumptions (if {\it asm} but not {\it conv}) (after context sensitive pre-processing)
\item
theorems in {\thm}$\ list$ (or {\thm}) parameter (after context sensitive pre-processing)
\end{itemize}

Rewriting continues until no more rewrites are possible (unless {\it once}).

You should now be able to attempt the exercises in sections \ref{RewritingSubgoalPackage} and \ref{ForwardBackwardProof}.

\section{Forward Chaining}

Facilities for ⦏forward\ chaining⦎ consist of a group of tactics for reasoning forward from the assumptions.
These are based on a rule, ⦏fc_rule⦎, which uses a list of implications to generate a list of new theorems from a list of ``seed'' theorems.
The arguments to {\it fc_rule} are two lists:

\begin{itemize}
\item
{\it Implications}

a list of theorems which are implications (possibly universally quantified), e.g.:

=GFT
	[Γ⋎1 ⊢ ∀x1 x2 ...⦁A⋎1 ⇒ B⋎1, ...]
=TEX

\item
{\it Seeds}

a list of theorems to be matched against the antecedents of the implications, e.g:

=GFT
	[Γ⋎1 ⊢ c⋎1, ...]
=TEX
\end{itemize}

For each implication,
=INLINEFT
⊢ ∀x1 x2 ...⦁A ⇒ B
=TEX
\ and for each seed
=INLINEFT
⊢ c
=TEX
, {\it fc_rule} determines whether $A$ can be specialised to give $c$ and if so it includes the corresponding specialisation of $B$ in its result.

For example:
=SML
(fc_rule : THM list -> THM list -> THM list)

	[asm_rule	⌜∀x⦁x > 10 ⇒ P x⌝,
	 asm_rule	⌜∀y⦁y < 10 ⇒ Q y⌝]

	[prove_rule []	⌜101 > 10⌝,
	 prove_rule []	⌜4 < 10⌝];
=GFT ProofPower Output
val it = [∀ y⦁ y < 10 ⇒ Q y ⊢ Q 4,
	∀ x⦁ x > 10 ⇒ P x ⊢ P 101] : THM list
=TEX

In practice, rather than $fc_rule$ one of the forward chaining tactics is more likely to be used.

The forward chaining {\tactic}s are:

$$ [all_] [asm_] ⦏fc_tac⦎ $$
$$ [all_] [asm_] ⦏forward_chain_tac⦎ $$

All these functions have type:
$$ THM\,list\,->\,TACTIC $$

The $asm_$ variants take the implications from their the argument together with the assumptions.
Other variants just use list given as argument as implications.
In all cases the seeds are the assumptions.

The variants without $all_$ take one pass over the seeds for each implication.
Variants with $all_$ add any new implications to the list of implications and loop until no new results can be generated.

New theorems deduced by these tactics are stripped into the assumptions.
The $all_$ variants only strip in theorems which are not themselves implications.

For example:
=GFT SML
set_goal([], ⌜∀a b c d⦁a ≤ b ∧ b ≤ c ∧ c ≤ d ⇒ a ≤ d⌝);
a(REPEAT strip_tac);
=GFT ProofPower Output
(*  3 *)  ⌜a ≤ b⌝
(*  2 *)  ⌜b ≤ c⌝
(*  1 *)  ⌜c ≤ d⌝

(* ?⊢ *)  ⌜a ≤ d⌝
=GFT SML
a(fc_tac[≤_trans_thm]);
=GFT ProofPower Output
(*  6 *)  ⌜a ≤ b⌝
(*  5 *)  ⌜b ≤ c⌝
(*  4 *)  ⌜c ≤ d⌝
(*  3 *)  ⌜∀ n⦁ b ≤ n ⇒ a ≤ n⌝
(*  2 *)  ⌜∀ n⦁ c ≤ n ⇒ b ≤ n⌝
(*  1 *)  ⌜∀ n⦁ d ≤ n ⇒ c ≤ n⌝

(* ?⊢ *)  ⌜a ≤ d⌝
=GFT SML
a(all_asm_fc_tac[] THEN all_asm_fc_tac[]);
=GFT ProofPower Output
Tactic produced 0 subgoals:
Current and main goal achieved
=TEX

Many useful properties are naturally formulated as universally
quantified implications:
=GFT
⦏≤_trans_thm⦎		⊢ ∀ m i n⦁ m ≤ i ∧ i ≤ n ⇒ m ≤ n
⦏less_trans_thm⦎	⊢ ∀ m i n⦁ m < i ∧ i < n ⇒ m < n
⦏mod_less_thm⦎	⊢ ∀ m n⦁ 0 < n ⇒ m Mod n < n
=TEX
Forward chaining saves having to specialise such facts explicitly.

A function, ⦏fc_canon⦎, is used by the forward chaining {\tactic}s to generate implications from the arguments to the forward chaining.

For example the theorems:

=GFT
⊢ (A ∧ B) ∨ C
⊢ ∀ m i n⦁ m ≤ i ∧ i ≤ n ⇒ m ≤ n
=TEX
are treated as:
=GFT
⊢ ¬ B ⇒ ¬ C ⇒ F
⊢ ¬ A ⇒ ¬ C ⇒ F
⊢ ∀ n i m⦁ m ≤ i ⇒ i ≤ n ⇒ ¬ m ≤ n ⇒ F
=TEX

The `$⇒ F$' part produced by {\it fc_canon} is simplified away when the new theorem is stripped into the assumptions.

The new theorems stripped into the assumptions are made as general as possible by universally quantifying them over any free variables which do not appear in the goal.

\section{More Predicate Calculus Tactics}

\subsection{strip_asm_tac}

\begin{itemize}

\item
⦏strip_asm_tac⦎ strips a theorem into the assumptions in the same way that {\it strip_tac} adds new assumptions

=FRULE 2 Tactic
strip_asm_tac
(⊢ c)
├
{ Γ } t
├
{strip c, Γ } t
=TEX

\item
a {\it case split} results if the conclusion of the theorem is a disjunction

\item
names ending in $_cases_thm$ indicate theorems designed for use with $strip_asm_tac$ for case splits:

=GFT
⦏ℕ_cases_thm⦎		⊢ ∀ m⦁ m = 0 ∨ (∃ i⦁ m = i + 1)
⦏less_cases_thm⦎	⊢ ∀ m n⦁ m < n ∨ m = n ∨ n < m
=TEX

\item
use $[list_]∀_elim$ to specialise the $_cases_thm$

\end{itemize}

$strip_asm_tac$: example

=SML
set_goal([], ⌜(if x = 0 then 1 else x) > 0⌝);
=TEX
=SML
∀_elim ⌜x⌝ ℕ_cases_thm;
=TEX
=GFT ProofPower Output
val it = ⊢ x = 0 ∨ (∃ i⦁ x = i + 1) : THM
=TEX
=SML
a(strip_asm_tac(∀_elim ⌜x⌝ ℕ_cases_thm));
=TEX
=GFT ProofPower Output
(* *** Goal "2" *** *)

(*  1 *)  ⌜x = i + 1⌝

(* ?⊢ *)  ⌜(if x = 0 then 1 else x) > 0⌝

(* *** Goal "1" *** *)

(*  1 *)  ⌜x = 0⌝

(* ?⊢ *) ⌜(if x = 0 then 1 else x) > 0⌝
=TEX

\subsection{cases_tac}

\begin{itemize}

\item
⦏cases_tac⦎ ⌜c⌝ lets you reason by cases according to whether a chosen
condition ⌜c⌝ is true or false:

=FRULE 2 Tactic
cases_tac ⌜c:BOOL⌝
├
{ Γ } t
├
{strip c, Γ } t;
{strip ¬c, Γ } t
=TEX

\item

=GFT
		cases_tac ⌜c:BOOL⌝
=TEX

is effectively the same as:
=GFT
strip_asm_tac(∀_elim ⌜c:BOOL⌝ (prove_rule [] ⌜∀b⦁b ∨ ¬b⌝));
=TEX
but it's less to type and quicker.

\end{itemize}

$cases_tac$: example

=SML
set_goal([], ⌜(if x < y + 1 then x else y) < y + 1⌝);
=TEX
=SML
a(cases_tac ⌜x < y + 1⌝);
=TEX
=GFT ProofPower Output
(* *** Goal "2" *** *)

(*  1 *)  ⌜¬ x < y + 1⌝

(* ?⊢ *)  ⌜(if x < y + 1 then x else y) < y + 1⌝

(* *** Goal "1" *** *)

(*  1 *)  ⌜x < y + 1⌝

(* ?⊢ *)  ⌜(if x < y + 1 then x else y) < y + 1⌝
=TEX

\subsection{swap_asm_concl_tac}

\begin{itemize}

\item
⦏swap_asm_concl_tac⦎ lets you interchange (the negations) of
an assumption and a conclusion
=FRULE 2 Tactic
swap_asm_concl_tac
⌜t1⌝
├
{ Γ, t1 } t2
├
{strip ¬t2, Γ } ¬t1
=TEX

\item
Often used to rewrite one assumption with another
\item
Also useful when the conclusion is a negated equation
\end{itemize}

$swap_asm_concl_tac$: example

=SML
set_goal([], ⌜(∀x y⦁x ≤ y ⇒ P(x,y)) ∧ x = y ⇒ P(x,y)⌝);
a(strip_tac);
=TEX
=GFT ProofPower Output
(*  2 *)  ⌜∀ x y⦁ x ≤ y ⇒ P (x, y)⌝
(*  1 *)  ⌜x = y⌝

(* ?⊢ *)  ⌜P (x, y)⌝
=TEX
=GFT ProofPower Output
=SML
a(list_spec_nth_asm_tac 2 [⌜x⌝, ⌜y⌝]);
=TEX
=GFT ProofPower Output
(*  3 *)  ⌜∀ x y⦁ x ≤ y ⇒ P (x, y)⌝
(*  2 *)  ⌜x = y⌝
(*  1 *)  ⌜¬ x ≤ y⌝

(* ?⊢ *)  ⌜P (x, y)⌝
=SML
a(swap_asm_concl_tac ⌜¬ x ≤ y⌝);
=TEX
=GFT ProofPower Output
(*  3 *)  ⌜∀ x y⦁ x ≤ y ⇒ P (x, y)⌝
(*  2 *)  ⌜x = y⌝
(*  1 *)  ⌜¬ P (x, y)⌝

(* ?⊢ *)  ⌜x ≤ y⌝
=TEX

\subsection{lemma_tac}

\begin{itemize}
\item
⦏lemma_tac⦎ lets you state and prove an `in-line' lemma
=FRULE 2 Tactic
lemma_tac
⌜lemma⌝
├
{ Γ } conc
├
{ Γ } lemma;
{strip lemma, Γ } conc
=TEX
\item Gives a more natural feel to many proofs
\item If just one tactic will prove the lemma then ⦏THEN1⦎ is a
convenient way of applying it
\item $tac1\,THEN1\,tac2$ first applies $tac1$
and then applies $tac2$ to the first resulting subgoal
=TEX
=TEX
\end{itemize}

$lemma_tac$: example

=TEX
=SML
set_goal([], ⌜(∀x y⦁x ≤ y ⇒ P(x,y)) ∧ x = y ⇒ P(x,y)⌝);
a(strip_tac);
=TEX
=GFT ProofPower Output
(*  2 *)  ⌜∀ x y⦁ x ≤ y ⇒ P (x, y)⌝
(*  1 *)  ⌜x = y⌝

(* ?⊢ *)  ⌜P (x, y)⌝
=TEX
=SML
a(lemma_tac⌜x ≤ y⌝);
=GFT ProofPower Output
(* *** Goal "2" *** *)
(*  3 *)  ⌜∀ x y⦁ x ≤ y ⇒ P (x, y)⌝
(*  2 *)  ⌜x = y⌝
(*  1 *)  ⌜x ≤ y⌝

(* ?⊢ *)  ⌜P (x, y)⌝

(* *** Goal "1" *** *)
(*  2 *)  ⌜∀ x y⦁ x ≤ y ⇒ P (x, y)⌝
(*  1 *)  ⌜x = y⌝

(* ?⊢ *)  ⌜x ≤ y⌝
=TEX

You should now be able to attempt the exercises in section \ref{StripAsmTac}.


=IGN
********************************************************************************
usr011X.doc: this file is part of the PPZed system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% usr011X.doc   ℤ $Date: 2004/01/19 12:44:00 $ $Revision: 1.19 $ $RCSfile: usr011X.doc,v $
% this should form a Chapter of the document
% Exercises
=TEX

\ftlmargin=0.25in\ftrmargin=0.25in

These exercises are presented in sections which correspond to chapters in the tutorial as follows:

\begin{enumerate}
\item
The Z Predicate Calculus
\begin{itemize}
\item
Forward Propositional Proofs
\item
Goal Oriented Propositional Proofs
\item
Forward Predicate Calculus Proofs
\item
Goal Oriented Predicate Calculus Proofs
\item
Rewriting
\end{itemize}
\item
Expressions and Schema Expressions
\item
Z Paragraphs and Theories
\item
The Z ToolKit
\begin{enumerate}
\item
Sets
\item
Relations
\item
Functions
\item
Numbers and Finiteness
\item
Sequences
\item
Bags
\end{enumerate}
\end{enumerate}

In order to save labour at the keyboard, the student may do the exercises by working with a specially prepared database called `example_zed'.
This database should have been built during the installation of {\Product}, if you have any difficulty in obtaining access to the database consult your systems administrator.
The database is created by loading this tutorial document into {\Product} with the exception only of the material in Chapter \ref{Solutions}.
The formal material used to set up the `exercises' database (and automatically stripped from the source of this document for that purpose) is documented by being marked with a sidebar, thus:

=SML

=TEX

for material in Standard ML.
Z paragraphs are also included in the material processed, except where they are specially presented to show the format of the source for such paragraphs.

A sidebar like this:
=GFT Student

=TEX

marks material which the student is expected to enter, either through the keyboard or by cut-and-paste.


The prepared database contains 4 theories, each with some predefined material:  in particular, lists of goals.  A goal can be conveniently selected by name and set up to be worked on by the subgoal package, by using the function predefined by:
=SML
fun setlg name goallist = set_goal([],lassoc3 goallist name);
=TEX
For example, to work on the goal  which is the first in the list $PM2$ (see \ref{PM2} below), noting that this goal is named `*2.02', execute:
=GFT Student
	setlg "*2.02" PM2;
=TEX

Another useful function attempts to prove a conjecture using $prove_rule$ and store the results in the current theory.  It is predefined by:

=SML
fun prove_and_store (key, term) = save_thm (key, prove_rule[] term);
=TEX

It is important that each exercise be attempted in the correct context. For this reason, at various points in the sequence of exercises,  instructions are given to set up the appropriate context for the group of exercises which follow, up to the next setting of context.  Setting up the context covers clearing the goal-stack, opening the appropriate `exercise' theory, setting the proof-context and flags.


The following lines of ML are for preparing the database:
=SML
repeat drop_main_goal;
open_theory "z_library";
set_pc "z_library";
set_flags [("z_type_check_only", false), ("z_use_axioms", true)];
=TEX

\section{Predicate Calculus Exercises}

The following line of ML is for preparing the database by setting up the first exercise theory:

=SML
new_theory "z_exercises_1";
=TEX

\subsection{Forward Propositional Proofs}\label{PropositionalReasoningExercises}
%   context setting point 1
Set the context by:
=GFT Student
repeat drop_main_goal;
open_theory "z_exercises_1";
set_pc "z_library";
=TEX


and then, using the methods described in \ref{PropositionalReasoning} prove a selection of the following results by use of
=INLINEFT
⇒_elim
=TEX
,
=INLINEFT
asm_rule
=TEX
{} and
=INLINEFT
⇒_intro
=TEX
:

\begin{description}
\item[(a)]
=INLINEFT
b⇒c, a⇒b, a ⊢ c
=TEX
\item[(b)]
=INLINEFT
a⇒b⇒c, a, b ⊢ c
=TEX
\item[(c)]
=INLINEFT
a⇒b⇒c, b ⊢ a⇒c
=TEX
\item[(d)]
=INLINEFT
⊢ (a⇒b⇒c)⇒b⇒(a⇒c)
=TEX
\end{description}

\subsection{Goal Oriented Propositional Proofs}

=IGN
("bits and pieces for use by  cut and paste

a contr_tac;
a z_strip_tac;
a strip_tac;
a step_strip_tac;
prove_rule[]

*)
=TEX
\begin{itemize}
\item
Choose examples from $PM2$ below to set up as a goal.  E.g. to choose as a goal
=INLINEFT
ⓩq ⇒ ( p ⇒ q)⌝
=TEX
, execute
=INLINEFT
setlg "*2.02" PM2;
=TEX
.  Work the example with
\begin{enumerate}
\item
=INLINEFT
a z_strip_tac;
=TEX
\item and/or:
=INLINEFT
a step_strip_tac;
=TEX
\end{enumerate}
\item
Observe the steps taken and try to identify the reasons for discharge of subgoals.
\item
Select the weakest ``proof context'':
=GFT Student
	push_pc "initial";
=TEX
then retry the examples (or previous exercises).
\item
When you have finished restore the original proof context by:
=GFT Student
	pop_pc();
=TEX
\end{itemize}

The following lines of ML are for preparing the `exercises' database. They are taken from Principia Mathematica *2, and are shown together with their reference numbers.

\label{PM2}

=SML
val PM2 =[
("*2.02", ⓩq ⇒ ( p ⇒ q)⌝),
("*2.03", ⓩ(p ⇒ ¬ q) ⇒ (q ⇒ ¬ p)⌝),
("*2.15", ⓩ(¬ p ⇒ q) ⇒ (¬ q ⇒ p)⌝),
("*2.16", ⓩ(p ⇒ q) ⇒ (¬ q ⇒ ¬ p)⌝),
("*2.17", ⓩ(¬ q ⇒ ¬ p) ⇒ (p ⇒ q)⌝),
("*2.04", ⓩ(p ⇒ q ⇒ r) ⇒ (q ⇒ p ⇒ r)⌝),
("*2.05", ⓩ(q ⇒ r) ⇒ (p ⇒ q) ⇒ (p ⇒ r)⌝),
("*2.06", ⓩ(p ⇒ q) ⇒ (q ⇒ r) ⇒ (p ⇒ r)⌝),
("*2.08", ⓩp ⇒ p⌝),
("*2.21", ⓩ¬ p ⇒ (p ⇒ q)⌝)];
=TEX
The following are from Principia Mathematica *3.
=SML
val PM3 =[
("*3.01", ⓩp ∧ q ⇔ ¬(¬ p ∨ ¬ q)⌝),
("*3.2", ⓩp ⇒ q ⇒ p ∧ q⌝),
("*3.26", ⓩp ∧ q ⇒ p⌝),
("*3.27", ⓩp ∧ q ⇒ q⌝),
("*3.3", ⓩ(p ∧ q ⇒ r) ⇒ (p ⇒ q ⇒ r)⌝),
("*3.31", ⓩ(p ⇒ q ⇒ r) ⇒ (p ∧ q ⇒ r)⌝),
("*3.35", ⓩ(p ∧ (p ⇒ q)) ⇒ q⌝),
("*3.43", ⓩ(p ⇒ q) ∧ (p ⇒ r) ⇒ (p ⇒ q ∧ r)⌝),
("*3.45", ⓩ(p ⇒ q) ⇒ (p ∧ r ⇒ q ∧ r)⌝),
("*3.47", ⓩ(p ⇒ r) ∧ (q ⇒ s) ⇒ (p ∧ q ⇒ r ∧ s)⌝)];
=TEX
Results from Principia Mathematica *4
=SML
val PM4 =[
("*4.1", ⓩp ⇒ q ⇔ ¬ q ⇒ ¬ p⌝),
("*4.11", ⓩ(p ⇔ q) ⇔ (¬ p ⇔ ¬ q)⌝),
("*4.13", ⓩp ⇔ ¬ ¬ p⌝),
("*4.2", ⓩp ⇔ p⌝),
("*4.21", ⓩ(p ⇔ q) ⇔ (q ⇔ p)⌝),
("*4.22", ⓩ(p ⇔ q) ∧ (q ⇔ r) ⇒ (p ⇔ r)⌝),
("*4.24", ⓩp ⇔ p ∧ p⌝),
("*4.25", ⓩp ⇔ p ∨ p⌝),
("*4.3", ⓩp ∧ q ⇔ q ∧ p⌝),
("*4.31", ⓩp ∨ q ⇔ q ∨ p⌝),
("*4.33", ⓩ(p ∧ q) ∧ r ⇔ p ∧ (q ∧ r)⌝),
("*4.4", ⓩp ∧ (q ∨ r) ⇔ (p ∧ q) ∨ (p ∧ r)⌝),
("*4.41", ⓩp ∨ (q ∧ r) ⇔ (p ∨ q) ∧ (p ∨ r)⌝),
("*4.71", ⓩ(p ⇒ q) ⇔ (p ⇔ (p ∧ q))⌝),
("*4.73", ⓩq ⇒ (p ⇔ (p ∧ q))⌝)];
=TEX
Results from Principia Mathematica *5
=SML
val PM5 =[
("*5.1", ⓩp ∧ q ⇒ (p ⇔ q)⌝),
("*5.32", ⓩ(p ⇒ (q ⇔ r)) ⇒ ((p ∧ q) ⇔ (p ∧ r))⌝),
("*5.6", ⓩ(p ∧ ¬ q ⇒ r) ⇒ (p ⇒ (q ∨ r))⌝)];
=TEX

%***4***  7.1.3
\subsection{Forward Predicate Calculus Proofs}

The following exercises concern proof in the predicate calculus in Z. Set the context by:

% context setting point 2

=GFT Student
repeat drop_main_goal;
open_theory "z_exercises_1";
set_pc "z_library";
=TEX
{} and then
\begin{enumerate}
\item Using
=INLINEFT
z_∀_elim
=TEX
{} with
=INLINEFT
z_ℕ_¬_plus1_thm
=TEX
{} prove:

\begin{description}
\item[(a)]
=INLINEFT
0 ∈ ℕ ∧ true ⇒ ¬ 0 + 1 = 0
=TEX
\item[(b)]
=INLINEFT
x * x ∈ ℕ ∧ true ⇒ ¬ x * x + 1 = 0
=TEX
\end{description}

\item Using
=INLINEFT
prove_rule
=TEX
{} with
=INLINEFT
z_≤_trans_thm
=TEX
{} prove:
\begin{description}
\item[\ \ \ ]
=INLINEFT
i ≤ j ∧ j ≤ k ⇒ i ≤ k
=TEX
\end{description}

\item Using
=INLINEFT
prove_rule
=TEX
{} and
=INLINEFT
z_ℕ_¬_plus1_thm
=TEX
{} and
=INLINEFT
z_0_ℕ_thm
=TEX
{} prove:
\begin{description}
\item[(a)]
=INLINEFT
¬ 0 + 1 = 0
=TEX
\item[(b)]
=INLINEFT
x * x ∈ ℕ ⇒ ¬ x * x + 1 = 0
=TEX
\end{description}

\item Using
=INLINEFT
prove_rule
=TEX
{} prove:
\begin{description}
\item[(a)]
=INLINEFT
¬ 0 < 1 ⇔ 1 ≤ 0
=TEX
{} (using
=INLINEFT
z_¬_less_thm
=TEX
), and
=TEX
\item[(b)]
=INLINEFT
∀ n:ℤ ⦁ 3 ≤ x * x ∧ x * x ≤ n ⇒ 3 ≤ n
=TEX
{} (using
=INLINEFT
z_≤_trans_thm
=TEX
)
\end{description}

\item Using
=INLINEFT
prove_rule
=TEX
{} with
=INLINEFT
≤_clauses
=TEX
{} prove:
\begin{description}
\item[\ \ \ ]
=INLINEFT
∀ i, m, n: ℤ ⦁ i + m ≤ i + n ⇔ m ≤ n
=TEX
\end{description}
\end{enumerate}
	
%   7.1.4

\subsection{Goal Oriented Predicate Calculus Proofs}

The methods of proof,  described in Chapter \ref{ZPredicateCalculus}, to be illustrated in these exercises are:

\begin{enumerate}
\item
Proof by stripping.
\item
Automatic proof.
\item
Proof by the ``two tactic method''.
\item
Proof using forward chaining.
\end{enumerate}

% context setting point 3  (there is none)

Use the following bits and pieces to try a variety of proofs of the following conjectures (PM9 to PM11b) in the predicate calculus in Z,
=GFT
a contr_tac;
a z_strip_tac;
a strip_tac;
a step_strip_tac;
a (prove_tac[]);
a (asm_prove_tac[]);
a (z_spec_asm_tac ⓩ ⌝ ⓩ ⌝);
a (z_spec_nth_asm_tac 1 ⓩ ⌝);
a (all_asm_fc_tac[]);
=TEX

The following are essentially the same results, taken from Principia Mathematica, as were previously used for exercises in HOL.
However, the results are set generic rather than polymorphic, and quantifiers range over sets rather than types.
The required proofs are similar to those in HOL, but slightly complicated by the set relativisation of the quantification.

The following are from Principia Mathematica *9.

=SML
val PM9 =[
("*9.01", ⓩ[X](¬ (∀x:X⦁ φx)) ⇔ (∃x: X⦁ ¬ φx)⌝),
("*9.02", ⓩ[X](¬ (∃x:X⦁ φx) ⇔ (∀x:X⦁ ¬ φx))⌝),
("*9.03", ⓩ[X](∀x:X⦁ φx ∨ p) ⇔ (∀x:X⦁ φx) ∨ p⌝),
("*9.04", ⓩ[X]p ∨ (∀x:X⦁ φx) ⇔ (∀x:X⦁ p ∨ φx)⌝),
("*9.05", ⓩ[X](∃ x:X⦁true) ⇒ ((∃x:X⦁ φx ∨ p) ⇔ (∃x:X⦁ φx) ∨ p)⌝),
("*9.06", ⓩ[X]p ∨ (∃x:X⦁ φx) ⇔ p ∨ (∃x:X⦁ φx)⌝)];
=TEX

The following are from Principia Mathematica *10.
=SML
val PM10 =[
("*10.01", ⓩ[X](∃x:X⦁ φx) ⇔ ¬ (∀y:X⦁ ¬ φy)⌝),
("*10.1", ⓩ(∀x:𝕌⦁ φx) ⇒ φy⌝),
("*10.21", ⓩ[X](∀x:X⦁ p ⇒ φx) ⇔ p ⇒ (∀y:X⦁ φy)⌝),
("*10.22", ⓩ[X](∀x:X⦁ φx ∧ ψx) ⇔ (∀y:X⦁ φy) ∧ (∀z:X⦁ ψz)⌝),
("*10.24", ⓩ[X](∀x:X⦁ φx ⇒ p) ⇔ (∃y:X⦁ φy) ⇒ p⌝),
("*10.27", ⓩ[X](∀x:X⦁ φx ⇒ ψx) ⇒ ((∀y:X⦁ φy) ⇒ (∀z:X⦁ ψz))⌝),
("*10.28", ⓩ[X](∀x:X⦁ φx ⇒ ψx) ⇒ ((∃y:X⦁ φy) ⇒ (∃z:X⦁ ψz))⌝),
("*10.35", ⓩ[X](∃x:X⦁ p ∧ φx) ⇔ p ∧ (∃y:X⦁ φy)⌝),
("*10.42", ⓩ[X](∃x:X⦁ φx) ∨ (∃y:X⦁ ψy) ⇔ (∃z:X⦁ φz ∨ ψz)⌝),
("*10.5", ⓩ[X](∃x:X⦁ φx ∧ ψx) ⇒ (∃y:X⦁ φy) ∧ (∃z:X⦁ ψz)⌝),
("*10.51", ⓩ[X] (¬ (∃x:X⦁ φx ∧ ψx) ⇒ (∀y:X⦁ φy ⇒ ¬ ψy))⌝)];
=TEX
=SML
val PM10b =[
("*10.271", ⓩ[X](∀x:X⦁ φx ⇔ ψx) ⇒ ((∀y:X⦁ φy) ⇔ (∀z:X⦁ ψz))⌝),
("*10.281", ⓩ[X](∀x:X⦁ φx ⇔ ψx) ⇒ ((∃y:X⦁ φy) ⇔ (∃z:X⦁ ψz))⌝)];

=TEX
The following are from Principia Mathematica *11.
=SML
val PM11 =[
("*11.1", ⓩ(∀x, y:𝕌⦁ φ(x,y)) ⇒ φ(z,w)⌝),
("*11.2", ⓩ[X](∀x, y:X⦁ φ(x,y)) ⇔ (∀y, x:X⦁ φ(x,y))⌝),
("*11.3", ⓩ[Y](p ⇒ (∀x, y:Y⦁ φ(x,y)))
		⇔ (∀x, y:Y⦁ p ⇒ φ(x,y))⌝),
("*11.35", ⓩ[Y](∀x, y:Y⦁ φ(x,y) ⇒ p) ⇔ (∃x, y:Y⦁ φ(x,y)) ⇒ p⌝)
];
=TEX
=SML
val PM11b =[
("*11.32", ⓩ[Y](∀x, y:Y⦁ φ(x,y) ⇒ ψ(x,y))
		⇒ (∀x, y:Y⦁ φ(x,y)) ⇒ (∀x, y:Y⦁ ψ(x,y))⌝),
("*11.45", ⓩ[Y](∃x, y:Y⦁ true) ⇒ ((∃x, y:Y⦁ p ⇒ φ(x,y))
		⇔ (p ⇒ (∃x, y:Y⦁ φ(x,y))))⌝),
("*11.54", ⓩ[Y](∃x, y:Y⦁ φx ∧ ψy) ⇔ (∃x:Y⦁ φx) ∧ (∃y:Y⦁ ψy)⌝),
("*11.55", ⓩ[Y](∃x, y:Y⦁ φx ∧ ψ(x,y))
		⇔ (∃x:Y⦁ φx ∧ (∃y:Y⦁ ψ(x,y)))⌝),
("*11.6", ⓩ[X](∃x:X⦁ (∃y:Y⦁ φ(x,y) ∧ ψy) ∧ χx)
		⇔ (∃y:Y⦁ (∃x:X⦁ φ(x,y) ∧ χx) ∧ ψy)⌝),
("*11.62", ⓩ(∀x:X; y:Y⦁ φx ∧ ψ(x,y) ⇒ χ(x,y))
  		⇔ (∀x:X⦁ φx ⇒ (∀y:Y⦁ ψ(x,y) ⇒ χ(x,y)))⌝)
];
=TEX


% 7.1.5
\subsection{Rewriting}

% ***5***  7.1.5.1
\subsubsection{Rewriting with the Subgoal Package}

% context setting point 4

Set the context with:
=GFT Student
repeat drop_main_goal;
open_theory "z_exercises_1";
set_pc "z_library_ext";
=TEX
{} and then

\begin{enumerate}
\item
choose a goal from set theory, e.g.:
=GFT Student
set_goal([],ⓩ a \ (b ∩ c) = (a \ b) ∪ (a \ c)⌝);
=TEX
\item
rewrite the goal using the current proof context:
=GFT Student
	a (rewrite_tac[]);
=TEX
\item
step back using undo:
=GFT Student
	undo 1;
=TEX
\item
now try rewriting without using the proof context:
=GFT Student
	a (pure_rewrite_tac[]);
=TEX
(this should fail)
\item
try rewriting one layer at a time:
=GFT Student
	a (once_rewrite_tac[]);
=TEX
repeat until it fails.
\item
now try rewriting with specific theorems:
=GFT Student
	set_goal([],ⓩ a \ (b ∩ c) = (a \ b) ∪ (a \ c)⌝);
	a (pure_rewrite_tac[z_sets_ext_clauses]);
	a (pure_rewrite_tac[z_set_dif_thm]);
	a (pure_rewrite_tac[z_∩_thm, z_∪_thm]);
	a (pure_rewrite_tac[z_set_dif_thm]);
=TEX
\item
finish the proof by stripping:
=GFT Student
	a (REPEAT strip_tac);
=TEX
\item
extract the theorem
=GFT Student
	top_thm();
=TEX
\item repeat the above then try repeating:
=GFT Student
	pop_thm();
=TEX
\end{enumerate}

% ***6***  7.1.5.2
\subsubsection{Combining Forward and Backward Proof}

The following exercise illustrates how forward inference may be helpful in specialising results for use in rewriting.  Some hints are given about the method. For each example try the methods suggested for the previous example to see how they fail before following the hint.

% context setting point 5

Set the context with
=GFT Student
repeat drop_main_goal;
open_theory "z_exercises_1";
set_pc "z_library";
=TEX

and then prove the following results by rewriting using the goal package.


\begin{enumerate}
\item :
=GFT Student
set_goal([],ⓩ x + y = y + x⌝);
=TEX
\item :
=GFT Student
set_goal([],ⓩ x + y + z = (x + y) + z⌝);
(* hint : try using z_plus_assoc_thm *)
=TEX
\item :
=GFT Student
set_goal([],ⓩ z + y + x = y + z + x⌝);
(* hint : try using z_plus_assoc_thm1 *)
=TEX
\item :
=GFT Student
set_goal([],ⓩ x + y + z = y + z + x⌝);
(* hint : try using z_∀_elim with z_plus_assoc_thm1 *)
=TEX
\item :
=GFT Student
set_goal([],ⓩ x + y + z + v = y + v + z + x⌝);
(* hint : try using z_∀_elim with z_plus_order_thm *)
=TEX
\end{enumerate}

\subsection{Stripping}
\begin{itemize}
\item
Use the examples from Principia Mathematica and also ZRM, e.g.:
=GFT Student
	set_goal([],ⓩ p ∧ q ⇒ (p ⇔ q)⌝);
=TEX
with
\begin{enumerate}
\item :
=GFT Student
	a z_strip_tac;
=TEX
\item and/or:
=GFT Student
	a step_strip_tac;
=TEX
\end{enumerate}
\item
Observe the steps taken and try to identify the reasons for discharge of subgoals.
\item
Select the weakest ``proof context'':
=GFT Student
	push_pc "initial";
=TEX
then retry the examples (or previous exercises).
\item
When you have finished restore the original proof context by:
=GFT Student
	pop_pc();
=TEX
\end{itemize}

\section{Expressions and Schema Expressions}

The following lines of ML are for preparing the exercise database:
=SML
open_theory "z_library";
new_theory "z_exercises_2";
new_parent "usr011";
=TEX
\subsection{Expressions}

The following examples are provable by $prove_tac$ or $prove_rule$ in proof context $z_library$,  so first set the context by:

% context setting point 6

=GFT Student
repeat drop_main_goal;
open_theory "z_exercises_2";
set_pc "z_library";
=TEX

=SML
val ZE1 = [
("ZE1.1", ⓩ(2,4) ∈ (λx:ℕ ⦁ 2*x)⌝),
("ZE1.2", ⓩ{1,2,3} ∈ ℙ {1,2,3,4}⌝),
("ZE1.3", ⓩℕ ∈ ℙ ℤ⌝),
("ZE1.4", ⓩ"a" ∈ {"a", "b"}⌝),
("ZE1.5", ⓩ¬ 2 ∈ {3,4}⌝),
("ZE1.6", ⓩx ∈ {1,2} ⇒ x ∈ {1,2,3}⌝),
("ZE1.7", ⓩx*x ∈ {y:ℤ | ∃z:ℤ ⦁ y = z*z}⌝),
("ZE1.8", ⓩ(x,y,z) = (v,w,x) ⇒ (y,z) = (w,v)⌝),
("ZE1.9", ⓩ(x ≜ a, y ≜ b) = (x ≜ v, y ≜ w) ⇒ (v ≜ a, w ≜ w) = (w ≜ b, v ≜ v)⌝),
("ZE1.10", ⓩ∀File;File'⦁ θFile = θFile' ⇒ age = age'⌝),
("ZE1.11", ⓩ∀File⦁ (θFile').age = age'⌝),
("ZE1.12", ⓩ∀File;File'⦁(θFile).age = age' ∧ (θFile).people = people'
		⇒ θFile = θFile'⌝)];
=TEX

The next examples are provable by $prove_tac$ or $prove_rule$ in proof context $z_language_ext$, so set the context by:

% context setting point 7

=GFT Student
repeat drop_main_goal;
open_theory "z_exercises_2";
set_pc "z_language_ext" ;
=TEX


=SML
val ZE2 = [
("ZE2.1", ⓩ∀a:𝕌×𝕌⦁(a.1,a.2) = a⌝),
("ZE2.2", ⓩ[X,Y](∀ p: ℙ (X × Y)⦁
			{x:X; y:Y | (x,y) ∈ p}
		=	{z:X × Y | z ∈ p})⌝),
("ZE2.3", ⓩ[x:ℤ | x > 0] = {x:ℤ | x>0 ⦁ (x ≜ x)}⌝)];
=TEX

The following problems are more difficult, typically the proofs involve about four steps each.
=SML
val ZE3 = [
("ZE3.1", ⓩ(λx:ℤ⦁ x+1) 3 = 4⌝),
("ZE3.2", ⓩ{(1,2), (3,4)} 3 = 4⌝),
("ZE3.3", ⓩ(1, ~2) ∈ (abs _) ⇒ abs 1 = ~2⌝),
("ZE3.4", ⓩ∀ i,j:ℤ⦁ (i,j) ∈ (abs _) ⇒ abs i = j⌝),
("ZE3.5", ⓩ∀i:ℤ⦁ abs i ∈ ℕ⌝),
("ZE3.6", ⓩ(μx:ℤ | x=3 ⦁ x*x) = 9⌝),
("ZE3.7", ⓩ25 ∈ {y:ℤ ⦁ y*y}⌝),
("ZE3.8", ⓩ(a × b × c) = (d × e × f) ⇒ (a × b) = (d × e) ∨ (c ∩ f) = ∅⌝),
("ZE3.9", ⓩ[X,Y](∀ p: ℙ (X × Y)⦁
			(∀ x:X; y:Y⦁ (x,y) ∈ p)
		⇔	(∀ z:X × Y⦁ z ∈ p))⌝),
("ZE3.10", ⓩ[File | people = {}] = {File | people = {}}⌝),
("ZE3.11", ⓩ⟨a,b⟩ = ⟨c,d⟩ ⇒ a=c ∧ b=d⌝),
("ZE3.12", ⓩ⟨a,b⟩ = ⟨d,e⟩ ⇒ ⟨b,d⟩ = ⟨e,a⟩⌝)];
=TEX

Hints for group ZE3:
\begin{enumerate}
\item
Use $conv_tac (MAP_C\ z_β_conv)$.
\item
Use $z_app_eq_tac$.
\item
Forward chain ($all_fc_tac$) using $z_→_∈_rel_⇔_app_eq_thm$.
But first you need to get into the assumptions the things it needs to chain on.
\item
Very similar to number 3.
\item
Forward chain using $z_fun_∈_clauses$.
\item
Specialise the result of applying $z_μ_rule$ to the $μ$ expression (using $z_∀_elim$) and strip this into the assumptions.
Then use the ``two tactic'' method (i.e. specialise assumptions as necessary) to derive a contradiction.
The last step requires rewriting an assumption to make the contradiction apparent.
\item
Rewriting gives and existential which can be solved using $z_∃_tac$.
Alternatively a proof by contradiction can be used, but this needs rewriting an assumption at the end to get the contradiction out.
\item
The proof must begin by using extensionality (either use proof context $z_library_ext$ or rewrite with $z_sets_ext_clauses$).
A straightforward proof by contradiction is possible using the ``two tactic method''.
\item
Use of $z_sel⋎t_intro_conv$ is necessary in this proof.
\item
The easiest proof is obtained by a single $z_strip_tac$ in proof context $z_library_ext$ followed by $prove_tac$ in proof context $z_library$ which leaves just one existential subgoal.
\item
Two tactic method in proof context $z_library_ext$ suffices.
\item Similar to the previous example.
\end{enumerate}


\subsection{Propositional Schema Calculus}

We define five schemas with distinct but compatible signatures called Pab, Qac, Rbc, Sabc and Tde and then prove the following goals showing that the schema calculus operators behave in the same way as the ordinary logical connectives.
The names of the schemas are chosen to remind us of the signatures, since this is of significance in the examples. ( The following lines of Z are for preparing the exercises database.)

ⓈZ
Pab ≜ [a,b:ℤ]
■
ⓈZ
Qac ≜ [a,c:ℤ]
■
ⓈZ
Rbc ≜ [b,c:ℤ]
■
ⓈZ
Sabc ≜ [a,b,c:ℤ]
■
ⓈZ
Tde ≜ [d,e:ℤ]
■
=TEX
The following problems are analogous to theorems taken from Principia Mathematica *2, and are shown together with their reference numbers.  Set the context with:

=GFT Student
repeat drop_main_goal;
open_theory "z_exercises_2";
set_pc "z_language";
=TEX


=SML
val SCPM2 = [
("*2.02", ⓩ Π((Qac ⇒ (Pab ⇒ Qac))⦂𝕌)⌝),
("*2.03", ⓩ Π(((Pab ⇒ ¬ Qac) ⇒ (Qac ⇒ ¬ Pab))⦂𝕌)⌝),
("*2.15", ⓩ Π(((¬ Pab ⇒ Qac) ⇒ (¬ Qac ⇒ Pab))⦂𝕌)⌝),
("*2.16", ⓩ Π(((Pab ⇒ Qac) ⇒ (¬ Qac ⇒ ¬ Pab))⦂𝕌)⌝),
("*2.17", ⓩ Π(((¬ Qac ⇒ ¬ Pab) ⇒ (Pab ⇒ Qac))⦂𝕌)⌝),
("*2.04", ⓩ Π(((Pab ⇒ Qac ⇒ Rbc) ⇒ (Qac ⇒ Pab ⇒ Rbc))⦂𝕌)⌝),
("*2.05", ⓩ Π(((Qac ⇒ Rbc) ⇒ (Pab ⇒ Qac) ⇒ (Pab ⇒ Rbc))⦂𝕌)⌝),
("*2.06", ⓩ Π(((Pab ⇒ Qac) ⇒ (Qac ⇒ Rbc) ⇒ (Pab ⇒ Rbc))⦂𝕌)⌝),
("*2.08", ⓩ Π((Pab ⇒ Pab)⦂𝕌)⌝),
("*2.21", ⓩ Π((¬ Pab ⇒ (Pab ⇒ Qac))⦂𝕌)⌝)];
=TEX
The following are analogous to Principia Mathematica *3
=SML
val SCPM3 = [
("*3.01", ⓩ Π((Pab ∧ Qac ⇔ ¬(¬ Pab ∨ ¬ Qac))⦂𝕌)⌝),
("*3.2", ⓩ Π((Pab ⇒ Qac ⇒ Pab ∧ Qac)⦂𝕌)⌝),
("*3.26", ⓩ Π((Pab ∧ Qac ⇒ Pab)⦂𝕌)⌝),
("*3.27", ⓩ Π((Pab ∧ Qac ⇒ Qac)⦂𝕌)⌝),
("*3.3", ⓩ Π(((Pab ∧ Qac ⇒ Rbc) ⇒ (Pab ⇒ Qac ⇒ Rbc))⦂𝕌)⌝),
("*3.31", ⓩ Π(((Pab ⇒ Qac ⇒ Rbc) ⇒ (Pab ∧ Qac ⇒ Rbc))⦂𝕌)⌝),
("*3.35", ⓩ Π(((Pab ∧ (Pab ⇒ Qac)) ⇒ Qac)⦂𝕌)⌝),
("*3.43", ⓩ Π(((Pab ⇒ Qac) ∧ (Pab ⇒ Rbc) ⇒ (Pab ⇒ Qac ∧ Rbc))⦂𝕌)⌝),
("*3.45", ⓩ Π(((Pab ⇒ Qac) ⇒ (Pab ∧ Rbc ⇒ Qac ∧ Rbc))⦂𝕌)⌝),
("*3.47", ⓩ Π(((Pab ⇒ Rbc) ∧ (Qac ⇒ Sabc) ⇒ (Pab ∧ Qac ⇒ Rbc ∧ Sabc))⦂𝕌)⌝)];

=TEX
Problems analogous to results in Principia Mathematica *4.
=SML
val SCPM4 = [
("*4.1", ⓩ Π((Pab ⇒ Qac) ⇔ (¬ Qac ⇒ ¬ Pab)⦂𝕌)⌝),
("*4.11", ⓩ Π((Pab ⇔ Qac) ⇔ (¬ Pab ⇔ ¬ Qac)⦂𝕌)⌝),
("*4.13", ⓩ Π((Pab ⇔ (¬ ¬ Pab))⦂𝕌)⌝),
("*4.2", ⓩ Π((Pab ⇔ Pab)⦂𝕌)⌝),
("*4.21", ⓩ Π((Pab ⇔ Qac) ⇔ (Qac ⇔ Pab)⦂𝕌)⌝),
("*4.22", ⓩ Π(((Pab ⇔ Qac) ∧ (Qac ⇔ Rbc) ⇒ (Pab ⇔ Rbc))⦂𝕌)⌝),
("*4.24", ⓩ Π((Pab ⇔ (Pab ∧ Pab))⦂𝕌)⌝),
("*4.25", ⓩ Π((Pab ⇔ (Pab ∨ Pab))⦂𝕌)⌝),
("*4.3", ⓩ Π((Pab ∧ Qac ⇔ Qac ∧ Pab)⦂𝕌)⌝),
("*4.31", ⓩ Π((Pab ∨ Qac ⇔ Qac ∨ Pab)⦂𝕌)⌝),
("*4.33", ⓩ Π(((Pab ∧ Qac) ∧ Rbc ⇔ Pab ∧ (Qac ∧ Rbc))⦂𝕌)⌝),
("*4.4", ⓩ Π((Pab ∧ (Qac ∨ Rbc) ⇔ (Pab ∧ Qac) ∨ (Pab ∧ Rbc))⦂𝕌)⌝),
("*4.41", ⓩ Π((Pab ∨ (Qac ∧ Rbc) ⇔ (Pab ∨ Qac) ∧ (Pab ∨ Rbc))⦂𝕌)⌝),
("*4.71", ⓩ Π(((Pab ⇒ Qac) ⇔ (Pab ⇔ (Pab ∧ Qac)))⦂𝕌)⌝),
("*4.73", ⓩ Π((Qac ⇒ (Pab ⇔ (Pab ∧ Qac)))⦂𝕌)⌝)];
=TEX
Problems analogous to results in Principia Mathematica *5.
=SML
val SCPM5 = [
("*5.1", ⓩ Π((Pab ∧ Qac ⇒ (Pab ⇔ Qac))⦂𝕌)⌝),
("*5.32", ⓩ Π(((Pab ⇒ (Qac ⇔ Rbc)) ⇒ ((Pab ∧ Qac) ⇔ (Pab ∧ Rbc)))⦂𝕌)⌝),
("*5.6", ⓩ Π(((Pab ∧ ¬ Qac ⇒ Rbc) ⇒ (Pab ⇒ (Qac ∨ Rbc)))⦂𝕌)⌝)];

repeat drop_main_goal;
=TEX
\subsection{Schema Calculus Quantification}

Set the context with:

=GFT Student
open_theory "z_exercises_2";
set_pc "z_library";
=TEX


=SML
val SCPM9 =[
("*9.01", ⓩΠ(((¬ (∀Qac⦁ Sabc)) ⇔ (∃Qac⦁ ¬ Sabc))⦂𝕌)⌝),
("*9.02", ⓩΠ(((¬ (∃Qac⦁ Sabc) ⇔ (∀Qac⦁ ¬ Sabc)))⦂𝕌)⌝)];
=TEX
=SML
val SCPM10 =[
("*10.01", ⓩΠ(((∃Qac⦁ Sabc) ⇔ ¬ (∀Qac⦁ ¬ Sabc))⦂𝕌)⌝),
("*10.21", ⓩΠ(((∀Qac⦁ Tde ⇒ Sabc) ⇔ Tde ⇒ (∀Qac⦁ Sabc))⦂𝕌)⌝),
("*10.22", ⓩΠ(((∀Rbc⦁ Sabc ∧ Rbc) ⇔ (∀Rbc⦁ Sabc) ∧ (∀Rbc⦁ Rbc))⦂𝕌)⌝)];
=TEX

\section{Paragraphs}

=SML
open_theory "z_library";
new_theory "z_exercises_3";
=TEX

\subsection{Axiomatic Descriptions and Generics}

Do the following exercises in axiomatic mode to avoid the consistency proofs which would otherwise be necessary.
(Consistency-proof examples follow.)  Thus set the context as follows:

% context setting point 8

=GFT Student
repeat drop_main_goal;
open_theory "z_exercises_3";
set_pc "z_library";
set_flags [("z_type_check_only", false), ("z_use_axioms", true)];
=TEX

\begin{enumerate}
\item
In this context, using a $fun$ fixity paragraph and a generic axiomatic description define a conditional construct $if$ a $then$ b $else$ c.
(Hints: you will need to use the higher order capabilities of ProofPower HOL for this one.
The first parameter will have type BOOL.)
\item
Using the specification prove the following result:
=GFT
set_goal ([], ⓩif 2>1 then 1 else 0 = 1⌝);
=TEX
\end{enumerate}

\subsection{Consistency Proofs}

% context setting point 9

\begin{enumerate}
\item
Set the  context as follows:

=GFT Student
repeat drop_main_goal;
open_theory "z_exercises_3";
set_pc "z_library";
set_flags [("z_type_check_only", false), ("z_use_axioms", false)];
=TEX

\item
Use an axiomatic description to define a global variable $num$ whose value is a natural number between 4 and 50.
\item
Prove the consistency result for this description and save it.
%(set up the goal with $push_consistency_goal$, rewrite with)
\item
now use the specification to prove that:
=GFT
	?⊢ num ≥ 0
=TEX
and save the result in the theory.
\end{enumerate}

\subsection{Reasoning using Schema Definitions}

% context setting point 10

Set the context as follows:

=GFT Student
repeat drop_main_goal;
open_theory "z_exercises_3";
set_pc "z_library";
set_flags [("z_type_check_only", false), ("z_use_axioms", false)];
=TEX

\subsubsection{Simple Pre-conditions and Refinement}

Using the following definitions (which are predefined in the `exercises' database):

┌STATE─────────────────
│	r : ℤ ↔ ℤ
└────────────────────

┌OP─────────────────
│	STATE; STATE'; i?:ℕ
└────────────────────

┌OP2─────────────────
│	OP
├───────────
│	r' = {i?} ⩤ r
└────────────────────


formulate and prove the following simple conjectures:

\begin{enumerate}
\item
=INLINEFT
?⊢ pre OP ⇔ i? ≥ 0
=TEX
\item
=INLINEFT
?⊢ (pre OP ⇒ pre OP2) ∧ (pre OP ∧ OP2 ⇒ OP)
=TEX
{} that is, $OP2$ is a correct refinement of $OP$
\end{enumerate}

\subsubsection{The Vending Machine}

Write a specification of a vending machine which has a stock of a single variety of commodity (chocolate bar for example), and accepts cash (input), outputs (a number of) goods and an amount of cash in change.

Do this in two stages of which the second is a correct (algorithmic) refinement of the first, and prove that this is the case.

Define the property of such systems that they do not undercharge for the goods they deliver and prove that the specified systems have this property.

\section{The Z ToolKit}

=SML
open_theory "z_library";
new_theory "z_exercises_4";
=TEX

\subsection{Sets}

The following problems are all in the theory of elementary sets as defined in section 4.1 of {\it The Z Notation} \cite{spivey92}.
Following \cite{spivey92} we have used free-variable formulations, though this is not usually recommended, since universally quantified results (over ``𝕌'') are usually needed for rewriting.
Proofs of the results quantified over 𝕌 are very similar.

All the results are provable  using the proof context \verb!z_sets_ext! (which provides for extensional proofs of results in elementary set theory).  Set the context as follows:

% context setting point 11

=GFT Student
repeat drop_main_goal;
open_theory "z_exercises_4";
set_pc "z_sets_ext";
=TEX

\subsubsection{Results Provable by Stripping}

=SML
val Z1 = [
("Z1.1", ⓩ a ∪ a = a ∪ {} = a ∩ a = a \ {} = a⌝),
("Z1.2", ⓩ a ∩ {} = a \ a = {} \ a = {}⌝),
("Z1.3", ⓩ a ∪ b = b ∪ a⌝),
("Z1.4", ⓩ a ∩ b = b ∩ a⌝),
("Z1.5", ⓩ a ∪ (b ∪ c) = (a ∪ b) ∪ c⌝),
("Z1.6", ⓩ a ∩ (b ∩ c) = (a ∩ b) ∩ c⌝),
("Z1.7", ⓩ a ∪ (b ∩ c) = (a ∪ b) ∩ (a ∪ c)⌝),
("Z1.8", ⓩ a ∩ (b ∪ c) = (a ∩ b) ∪ (a ∩ c)⌝),
("Z1.9", ⓩ (a ∩ b) ∪ (a \ b) = a⌝),
("Z1.10", ⓩ ((a \ b) ∩ b) = {}⌝),
("Z1.11", ⓩ a \ (b \ c) = (a \ b) ∪ (a ∩ c)⌝),
("Z1.12", ⓩ (a \ b) \ c = a \ (b ∪ c)⌝),
("Z1.13", ⓩ a ∪ (b \ c) = (a ∪ b) \ (c \ a)⌝),
("Z1.14", ⓩ a ∩ (b \ c) = (a ∩ b) \ c⌝),
("Z1.15", ⓩ (a ∪ b) \ c = (a \ c) ∪ (b \ c)⌝)];
=TEX
\vfill
=SML
val Z2 = [
("Z2.1", ⓩ a \ (b ∩ c) = (a \ b) ∪ (a \ c)⌝),
("Z2.2", ⓩ ¬ x ∈ {}⌝),
("Z2.3", ⓩ a ⊆ a⌝),
("Z2.4", ⓩ ¬ a ⊂ a⌝),
("Z2.5", ⓩ {} ⊆ a⌝),
("Z2.6", ⓩ ⋃ {} = {}⌝),
("Z2.7", ⓩ ⋂ {} = 𝕌⌝)];
=TEX
\vfill

For the following stripping alone will not suffice.
The ``two tactic method'' will solve them all, so will ``prove\_tac''.

\vfill
=SML
val Z3 = [
("Z3.1", ⓩ a ⊆ b ⇔ a ∈ ℙ b⌝),
("Z3.2", ⓩ a ⊆ b ∧ b ⊆ a ⇔ a = b⌝),
("Z3.3", ⓩ ¬ (a ⊂ b ∧ b ⊂ a)⌝),
("Z3.4", ⓩ a ⊆ b ∧ b ⊆ c ⇒ a ⊆ c⌝),
("Z3.5", ⓩ a ⊂ b ∧ b ⊂ c ⇒ a ⊂ c⌝),
("Z3.6", ⓩ {} ⊂ a ⇔ ¬ a = {}⌝),
("Z3.7", ⓩ ⋃ (a ∪ b) = (⋃ a) ∪ (⋃ b)⌝),
("Z3.8", ⓩ ⋂ (a ∪ b) = (⋂ a) ∩ (⋂ b)⌝),
("Z3.9", ⓩ  a ⊆ b ⇒ ⋃ a ⊆ ⋃ b ⌝),
("Z3.10", ⓩ  a ⊆ b ⇒ ⋂ b ⊆ ⋂ a ⌝)];
=TEX
\vfill
=SML
val Z3b = [
("Z3b.1", ⓩ a ⊆ b ∧ b ⊆ a ⇔ a = b⌝),
("Z3b.2", ⓩ a ⊂ b ∧ b ⊂ c ⇒ a ⊂ c⌝),
("Z3b.3", ⓩ {} ⊂ a ⇔ ¬ a = {}⌝)];
=TEX

\vfill

\subsection{Relations}

\vfill


% context setting point 12

Set the context by:

=GFT Student
repeat drop_main_goal;
open_theory "z_exercises_4";
set_pc "z_rel_ext";
=TEX


\vfill


=SML
val Z4 = [
("Z4.1", ⓩ[X,Y] (R ∈ X ↔ Y) ⇒ (∀ x : X ⦁ x ∈ dom R ⇔ (∃ y : Y ⦁ (x,y) ∈ R))⌝),
("Z4.2", ⓩ[X,Y] (R ∈ X ↔ Y) ⇒ (∀ y : Y ⦁ y ∈ ran R ⇔ (∃ x : X ⦁ (x,y) ∈ R))⌝),
("Z4.3", ⓩdom {x1 ↦ y1, x2 ↦ y2} = {x1, x2}⌝),
("Z4.4", ⓩran {x1 ↦ y1, x2 ↦ y2} = {y1, y2}⌝),
("Z4.5", ⓩdom (Q ∪ R) = dom Q ∪ dom R⌝),
("Z4.6", ⓩran (Q ∪ R) = ran Q ∪ ran R⌝),
("Z4.7", ⓩdom (Q ∩ R) ⊆ dom Q ∩ dom R⌝),
("Z4.8", ⓩran (Q ∩ R) ⊆ ran Q ∩ ran R⌝),
("Z4.9", ⓩdom {} = {}⌝),
("Z4.10", ⓩran {} = {}⌝)];
=TEX
\vfill
=SML
val Z5 = [
("Z5.1", ⓩ[X,Y,Z] P ∈ X ↔ Y ∧ Q ∈ Y ↔ Z ⇒
	((x ↦ z) ∈ P ⨾ Q ⇔ (∃ y : Y ⦁ (x,y) ∈ P ∧ (y,z) ∈ Q))⌝),
("Z5.2", ⓩP ⨾ (Q ⨾ R) = (P ⨾ Q) ⨾ R⌝)];
=TEX
\vfill
=SML
val Z5b = [
("Z5b.1", ⓩ[X] (x ↦ x') ∈ id X ⇔ x = x' ∈ X⌝),
("Z5b.2", ⓩ(id X) ⨾ P = X ◁ P⌝),
("Z5b.3", ⓩP ⨾ id Y = P ▷ Y⌝),
("Z5b.4", ⓩ(id V) ⨾ id W = id (V ∩ W)⌝)];
=TEX

\vfill

=SML
val Z5c = [
("Z5c.1", ⓩ[X,Y,Z] (∀x:𝕌;g:𝕌⦁ g ∈ X ⇸ Y ∧ x ∈ dom g ⇒ (x, g x) ∈ g)⌝),
("Z5c.2", ⓩ[X,Y,Z] x ∈ dom g ∧ g x ∈ dom f ∧ g ∈ X ⇸ Y
	∧ f ∈ Y ⇸ Z ⇒ (f ∘ g)(x) = f(g(x))⌝)];
=TEX
\vfill
=SML
val Z6 = [
("Z6.1", ⓩdom (S ◁ R) = S ∩ dom R⌝),
("Z6.2", ⓩran (R ▷ T) = ran R ∩ T⌝),
("Z6.3", ⓩS ◁ R ⊆ R⌝),
("Z6.4", ⓩR ▷ T ⊆ R⌝),
("Z6.5", ⓩ(S ◁ R) ▷ T = S ◁ (R ▷ T)⌝),
("Z6.6", ⓩS ◁ (V ◁ R) = (S ∩ V) ◁ R⌝),
("Z6.7", ⓩ(R ▷ T) ▷ W = R ▷ (T ∩ W)⌝)];
=TEX
\vfill
=SML
val Z6b = [
("Z6b.1", ⓩran R ⊆ Y ⇒ (S ◁ R = (id S) ⨾ R = (S × Y) ∩ R)⌝),
("Z6b.2", ⓩdom R ⊆ X ⇒ (R ▷ T = R ⨾ (id T) = R ∩ (X × T))⌝)];
=TEX
\vfill
=SML
val Z7 = [
("Z7.1", ⓩdom R ⊆ X ⇒ S ⩤ R = (X \ S) ◁ R⌝),
("Z7.2", ⓩran R ⊆ Y ⇒ R ⩥ T = R ▷ (Y \ T)⌝),
("Z7.3", ⓩ(S ◁ R) ∪ (S ⩤ R) = R⌝),
("Z7.4", ⓩ(R ▷ T) ∪ (R ⩥ T) = R⌝)];
=TEX
\vfill
=SML
val Z8 = [
(* ("Z8.1", ⓩ(y ↦ x) ∈ R ↗~↕ ⇔ (x ↦ y) ∈ R⌝), *)
("Z8.2", ⓩ(R ↗~↕) ↗~↕ = R⌝),
("Z8.3", ⓩ(Q ⨾ R) ↗~↕ = R ↗~↕ ⨾ Q ↗~↕⌝),
("Z8.4", ⓩdom(R ↗~↕) = ran R⌝),
("Z8.5", ⓩran(R ↗~↕) = dom R⌝)];
=TEX
\vfill
=SML
val Z8b = [
("Z8b.1", ⓩ(id V) ↗~↕ = id V⌝),
("Z8b.2", ⓩid(dom R) ⊆ R ⨾ (R ↗~↕)⌝),
("Z8b.3", ⓩid(ran R) ⊆ (R ↗~↕) ⨾ R⌝)];
=TEX
\vfill
=SML
val Z9 = [
("Z9.1", ⓩS ⊆ X ⇒ (y ∈ R ⦇ S ⦈ ⇔ (∃ x : X ⦁ x ∈ S ∧ (x,y) ∈ R))⌝),
("Z9.2", ⓩR ⦇ S ⦈ = ran(S ◁ R)⌝),
("Z9.3", ⓩdom(Q ⨾ R) = (Q ↗~↕) ⦇ dom R ⦈⌝),
("Z9.4", ⓩran(Q ⨾ R) = R ⦇ ran Q ⦈⌝),
("Z9.5", ⓩR ⦇ S ∪ T ⦈ = R ⦇ S ⦈ ∪ R ⦇ T ⦈⌝),
("Z9.6", ⓩR ⦇ S ∩ T ⦈ ⊆ R ⦇ S ⦈ ∩ R ⦇ T ⦈⌝),
("Z9.7", ⓩR ⦇ dom R ⦈ = ran R⌝)];
=TEX
\vfill
=SML
val Z9b = [
("Z9b.1", ⓩdom R = first ⦇ R ⦈⌝),
("Z9b.2", ⓩran R = second ⦇ R ⦈⌝)];
=TEX
\vfill
=SML
val Z10 = [
("Z10.1", ⓩR ⊕ R = R⌝),
("Z10.2", ⓩP ⊕ (Q ⊕ R) = (P ⊕ Q) ⊕ R⌝),
("Z10.3", ⓩ∅ ⊕ R = R ⊕ ∅ = R⌝),
("Z10.4", ⓩdom Q ∩ dom R = ∅ ⇒ Q ⊕ R = Q ∪ R⌝),
("Z10.5", ⓩV ◁ (Q ⊕ R) = (V ◁ Q) ⊕ (V ◁ R)⌝),
("Z10.6", ⓩ(Q ⊕ R) ▷ W ⊆ (Q ▷ W) ⊕ (R ▷ W)⌝)];
=TEX
\vfill
=SML
val Z10b = [
("Z10b.1", ⓩdom(Q ⊕ R) = (dom Q) ∪ (dom R)⌝),
("Z10b.2", ⓩf ∈ X ⇸ Y ∧ g ∈ X ⇸ Y ⇒
	x ∈ (dom f) \ (dom g) ⇒ (f ⊕ g) x = f x⌝),
("Z10b.3", ⓩg ∈ X ⇸ Y ∧ x ∈ dom g ⇒ (f ⊕ g) x = g x⌝)];
=TEX
\vfill
=SML
val Z11 = [
("Z11.1", ⓩR ⊆ R ↗+↕⌝),
("Z11.2", ⓩid X ⊆ R ↗*↕⌝),
("Z11.3", ⓩR ⊆ R↗*↕⌝)];
=TEX
\vfill
=SML
val Z11b = [
("Z11b.1", ⓩR ↗+↕ ⨾ (R ↗+↕) ⊆ R ↗+↕⌝),
("Z11b.2", ⓩ(R ↗+↕) ↗+↕ = R ↗+↕⌝),
("Z11b.3", ⓩ(R ↗*↕) ↗*↕ = R ↗*↕⌝),
("Z11b.4", ⓩR ⊆ Q ∧ Q ⨾ Q ⊆ Q ⇒ R ↗+↕ ⊆ Q⌝),
("Z11b.5", ⓩR↗*↕ ⨾ R↗*↕ = R↗*↕⌝),
("Z11b.6", ⓩid X ⊆ Q ∧ R ⊆ Q ∧ Q ⨾ Q ⊆ Q ⇒ R↗*↕ ⊆ Q⌝),
("Z11b.7", ⓩR↗*↕ = R ↗+↕ ∪ id X = (R ∪ id X)↗+↕⌝),
("Z11b.8", ⓩR↗+↕ = R ⨾ R ↗*↕ = R ↗*↕ ⨾ R⌝),
("Z11b.9", ⓩS ⊆ R ↗*↕ ⦇ S ⦈⌝),
("Z11b.10", ⓩS ⊆ T ∧ R ⦇ T ⦈ ⊆ T ⇒ R ↗*↕ ⦇S⦈ ⊆ T⌝),
("Z11b.11", ⓩR ⦇R ↗*↕ ⦇ S ⦈ ⦈ ⊆ R ↗*↕ ⦇S⦈⌝)];
=TEX
\subsection{Functions}

Set the context:

% context setting point 13

=GFT Student
repeat drop_main_goal;
open_theory "z_exercises_4";
set_pc "z_fun_ext";
=TEX

=SML
val Z12 = [
("Z12.1", ⓩ f ∈ X ⇸ Y ∧ (x, y) ∈ f ⇒ f x = y ⌝),
("Z12.2", ⓩ f ∈ X ⤔ Y ∧ (x, y) ∈ f ⇒ f x = y ⌝),
("Z12.3", ⓩ f ∈ X ↣ Y ∧ (x, y) ∈ f ⇒ f x = y ⌝),
("Z12.4", ⓩ f ∈ X ⤔ Y ∧ (x, y) ∈ f ⇒ f x = y ⌝),
("Z12.5", ⓩ f ∈ X ⤖ Y ∧ (x, y) ∈ f ⇒ f x = y ⌝),
("Z12.6", ⓩ f ∈ X ⤀ Y ∧ (x, y) ∈ f ⇒ f x = y ⌝)
];
val Z12a = [
("Z12a.1", ⓩ f ∈ (X ⇸ Y) ∪ (X ⤔ Y) ∪ (X ↣ Y)
		∪ (X ⤔ Y) ∪ (X ⤖ Y) ∪ (X ⤀ Y)
		∧ (x, y) ∈ f ⇒ f x = y ⌝)];
=TEX
\vfill
=SML
val Z12b = [
("Z12b.1", ⓩf ∈ X ↔ Y ⇒ (f ∈ X ⇸ Y ⇔ f ∘ f↗~↕ = id(ran f))⌝),
("Z12b.2", ⓩf ∈ X ⤔ Y ⇔ (f ∈ X ⇸ Y ∧ f ↗~↕ ∈ Y ⇸ X)⌝),
("Z12b.3", ⓩf ∈ X ⤔ Y ⇔ (f ∈ X ⇸ Y ∧ f ↗~↕ ∈ Y ⇸ X)⌝),
("Z12b.4", ⓩf ∈ X ↣ Y ⇔ (f ∈ X → Y ∧ f ↗~↕ ∈ Y ⇸ X)⌝),
("Z12b.5", ⓩf ∈ X ⤔ Y ⇒ f ⦇S ∩ T⦈ = f ⦇S⦈ ∩ f ⦇T⦈⌝),
("Z12b.6", ⓩf ∈ X ⤖ Y ⇔ (f ∈ X → Y ∧ f ↗~↕ ∈ Y → X)⌝),
("Z12b.7", ⓩf ∈ X ⤀ Y ⇒ f ∘ f ↗~↕ = id Y⌝)];
=TEX
\vfill

\subsection{Numbers and Finiteness}


\begin{enumerate}
\item
Set the context to axiomatic mode as follows:

% context setting point 14

=GFT Student
repeat drop_main_goal;
open_theory "z_exercises_4";
set_pc "z_library";
set_flags [("z_type_check_only", false), ("z_use_axioms", true)];
=TEX
{} and then give an inductive definition using a Z axiomatic description of the function $Σ$ which maps the natural number $n$ to the sum of the first $n$ natural numbers.
\item
Using $z_ℕ_induction_tac$ prove that:
=INLINEFT
∀n: ℕ⦁ (Σ n) * 2 = n * (n+1)`
=TEX
\item
Set the context as follows:

% context setting point 15


=GFT Student
repeat drop_main_goal;
open_theory "z_exercises_4";
set_pc "z_library_ext";
set_flags [("z_type_check_only", false), ("z_use_axioms", true)];
=TEX

{} and then, using the specification of
=INLINEFT
(_.._)
=TEX
 (obtained using $z_get_spec$) and forward chaining ($all_fc_tac$) with the theorem $z_≤_trans_thm$ prove that:

=INLINEFT
∀ x, y : ℤ ⦁ x ≤ y ⇒ (0 .. x) ⊆ (0 .. y)
=TEX
\item
Now prove the harder result:
=INLINEFT
∀ x, y : ℤ ⦁ ¬ x ≤ y ⇒ (0 .. y) ⊆ (0 .. (x - 1))
=TEX

Helpful theorems in this case are $z_≤_less_trans_thm$, $z_≤_≤_0_thm$, $z_plus_order_thm$ and $z_minus_thm$.
\end{enumerate}

=SML
val ZNum = [
("ZNum.2", ⓩ∀ x, y : ℤ ⦁ x ≤ y ⇒ (0 .. x) ⊆ (0 .. y)⌝),
("ZNum.3", ⓩ∀ x, y : ℤ ⦁ ¬ x ≤ y ⇒ (0 .. y) ⊆ (0 .. (x - 1))⌝)];
=TEX
(The term for the first goal cannot be entered until the definition of $Σ$ has been processed).

=IGNORE

\subsection{Sequences}


\subsection{Bags}

\section{Case Studies}


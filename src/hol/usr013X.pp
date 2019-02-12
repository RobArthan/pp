=IGN
********************************************************************************
usr013X.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
=TEX
% usr013X.doc $Date: 2002/10/18 15:26:07 $ $Revision: 2.5 $ $RCSfile: usr013X.doc,v $
% COPYRIGHT (c) Lemma 1 Ltd.
\ignore{
=SML
(* usr013X.sml $Date: 2002/10/18 15:26:07 $ $Revision: 2.5 $ $RCSfile: usr013X.doc,v $
   COPYRIGHT (c) Lemma 1 Ltd. *)
=TEX
}

\chapter{EXERCISES}\label{Exercises}

This Chapter contains the exercises set for students on the last short course on {\Product-HOL}, with the exception of the exercise in Section \ref{SupplementaryExercises}.

Solutions to most of these exercises may be found in Chapter \ref{Solutions}.

Unless otherwise stated the exercises should be conducted in proof context `hol2'.

The source of the exercises for use with copy-and-paste may be found in file {\tt usr022_slides.doc} (the tutorial overheads) or {\tt usr013X.doc}.

\section{Easy Proofs}\label{EasyProofs}

Set the theory and the proof context:
=SML
open_theory"hol";
set_pc "hol2";
=TEX
Set the goal (from the examples supplied):
=GFT
set_goal([],⌜conjecture⌝);
=TEX
Then try the following methods of proof:
\begin{itemize}
\item
Two tactic method using:
=GFT
a contr_tac; (* once *)
a (list_spec_asm_tac ⌜asm⌝ [⌜t1⌝, ⌜t2⌝]);
  (* as many as necessary *)
=TEX
\item or
=GFT
a (prove_tac[]); (* once *)
=TEX
\item or
=GFT
a step_strip_tac; (* many times *)
=IGN
drop_main_goal();
repeat drop_main_goal;
=TEX
\end{itemize}

in case of difficulty, revert to the two tactic method.

=IGN bits and pieces
set_goal([],⌜⌝);
a contr_tac;
a strip_tac;
a step_strip_tac;
prove_rule []
;
map (prove_rule [])
;
map (fn t => tac_proof (([],t),(REPEAT step_strip_tac))) ZRM2
;
map (fn t => tac_proof (([],t),prove_tac[])) ZRM3
;
a (list_spec_nth_asm_tac 1 [⌜⌝]);
=TEX
=SML
(* Results from Principia Mathematica *2 *)
val PM2 =[
⌜(* *2.02 *) q ⇒ ( p ⇒ q)⌝,
⌜(* *2.03 *) (p ⇒ ¬ q) ⇒ (q ⇒ ¬ p)⌝,
⌜(* *2.15 *) (¬ p ⇒ q) ⇒ (¬ q ⇒ p)⌝,
⌜(* *2.16 *) (p ⇒ q) ⇒ (¬ q ⇒ ¬ p)⌝,
⌜(* *2.17 *) (¬ q ⇒ ¬ p) ⇒ (p ⇒ q)⌝,
⌜(* *2.04 *) (p ⇒ q ⇒ r) ⇒ (q ⇒ p ⇒ r)⌝,
⌜(* *2.05 *) (q ⇒ r) ⇒ (p ⇒ q) ⇒ (p ⇒ r)⌝,
⌜(* *2.06 *) (p ⇒ q) ⇒ (q ⇒ r) ⇒ (p ⇒ r)⌝,
⌜(* *2.08 *) p ⇒ p⌝,
⌜(* *2.21 *) ¬ p ⇒ (p ⇒ q)⌝];
=TEX
=SML
(* Results from Principia Mathematica *3 *)
val PM3 =[
(* *3.01 *) ⌜p ∧ q ⇔ ¬(¬ p ∨ ¬ q)⌝,
(* *3.2  *) ⌜p ⇒ q ⇒ p ∧ q⌝,
(* *3.26 *) ⌜p ∧ q ⇒ p⌝,
(* *3.27 *) ⌜p ∧ q ⇒ q⌝,
(* *3.3  *) ⌜(p ∧ q ⇒ r) ⇒ (p ⇒ q ⇒ r)⌝,
(* *3.31 *) ⌜(p ⇒ q ⇒ r) ⇒ (p ∧ q ⇒ r)⌝,
(* *3.35 *) ⌜(p ∧ (p ⇒ q)) ⇒ q⌝,
(* *3.43 *) ⌜(p ⇒ q) ∧ (p ⇒ r) ⇒ (p ⇒ q ∧ r)⌝,
(* *3.45 *) ⌜(p ⇒ q) ⇒ (p ∧ r ⇒ q ∧ r)⌝,
(* *3.47 *) ⌜(p ⇒ r) ∧ (q ⇒ s) ⇒ (p ∧ q ⇒ r ∧ s)⌝];
=TEX

=SML
(* Results from Principia Mathematica *4 *)
val PM4 =[
(* *4.1  *) ⌜p ⇒ q ⇔ ¬ q ⇒ ¬ p⌝,
(* *4.11 *) ⌜(p ⇔ q) ⇔ (¬ p ⇔ ¬ q)⌝,
(* *4.13 *) ⌜p ⇔ ¬¬ p⌝,
(* *4.2  *) ⌜p ⇔ p⌝,
(* *4.21 *) ⌜(p ⇔ q) ⇔ (q ⇔ p)⌝,
(* *4.22 *) ⌜(p ⇔ q) ∧ (q ⇔ r) ⇒ (p ⇔ r)⌝,
(* *4.24 *) ⌜p ⇔ p ∧ p⌝,
(* *4.25 *) ⌜p ⇔ p ∨ p⌝,
(* *4.3  *) ⌜p ∧ q ⇔ q ∧ p⌝,
(* *4.31 *) ⌜p ∨ q ⇔ q ∨ p⌝,
(* *4.33 *) ⌜(p ∧ q) ∧ r ⇔ p ∧ (q ∧ r)⌝,
(* *4.4  *) ⌜p ∧ (q ∨ r) ⇔ (p ∧ q) ∨ (p ∧ r)⌝,
(* *4.41 *) ⌜p ∨ (q ∧ r) ⇔ (p ∨ q) ∧ (p ∨ r)⌝,
(* *4.71 *) ⌜(p ⇒ q) ⇔ (p ⇔ (p ∧ q))⌝,
(* *4.73 *) ⌜q ⇒ (p ⇔ (p ∧ q))⌝];
=TEX

=SML
(* Results from Principia Mathematica *5 *)
val PM5 =[
(* *5.1  *) ⌜p ∧ q ⇒ (p ⇔ q)⌝,
(* *5.32 *) ⌜(p ⇒ (q ⇔ r)) ⇒ ((p ∧ q) ⇔ (p ∧ r))⌝,
(* *5.6  *) ⌜(p ∧ ¬ q ⇒ r) ⇒ (p ⇒ (q ∨ r))⌝];
=TEX
=SML
(* Definitions from Principia Mathematica *9 *)
val PM9 =[
(* *9.01 *) ⌜¬ (∀x⦁ φx) ⇔ (∃x⦁ ¬ φx)⌝,
(* *9.02 *) ⌜¬ (∃x⦁ φx) ⇔ (∀x⦁ ¬ φx)⌝,
(* *9.03 *) ⌜(∀x⦁ φx ∨ p) ⇔ (∀x⦁ φx) ∨ p⌝,
(* *9.04 *) ⌜p ∨ (∀x⦁ φx) ⇔ (∀x⦁ p ∨ φx)⌝,
(* *9.05 *) ⌜(∃x⦁ φx ∨ p) ⇔ (∃x⦁ φx) ∨ p⌝,
(* *9.06 *) ⌜p ∨ (∃x⦁ φx) ⇔ p ∨ (∃x⦁ φx)⌝];
val PM9b =[
(* *9.07 *) ⌜(∀x⦁ φx) ∨ (∃y⦁ ψy) ⇔ (∀x⦁∃y⦁ φx ∨ ψy)⌝,
(* *9.08 *) ⌜(∃y⦁ ψy) ∨ (∀x⦁ φx) ⇔ (∀x⦁∃y⦁ ψy ∨ φx)⌝];
=TEX

=SML
(* Results from Principia Mathematica *10 *)
val PM10 =[
(* *10.01  *) ⌜(∃x⦁ φx) ⇔ ¬ (∀y⦁ ¬ φy)⌝,
(* *10.1   *) ⌜(∀x⦁ φx) ⇒ φy⌝,
(* *10.21  *) ⌜(∀x⦁ p ⇒ φx) ⇔ p ⇒ (∀y⦁ φy)⌝,
(* *10.22  *) ⌜(∀x⦁ φx ∧ ψx) ⇔ (∀y⦁ φy) ∧ (∀z⦁ ψz)⌝,
(* *10.24  *) ⌜(∀x⦁ φx ⇒ p) ⇔ (∃y⦁ φy) ⇒ p⌝,
(* *10.27  *) ⌜(∀x⦁ φx ⇒ ψx) ⇒ ((∀y⦁ φy) ⇒ (∀z⦁ ψz))⌝,
(* *10.271 *) ⌜(∀x⦁ φx ⇔ ψx) ⇒ ((∀y⦁ φy) ⇔ (∀z⦁ ψz))⌝,
(* *10.28  *) ⌜(∀x⦁ φx ⇒ ψx) ⇒ ((∃y⦁ φy) ⇒ (∃z⦁ ψz))⌝,
(* *10.281 *) ⌜(∀x⦁ φx ⇔ ψx) ⇒ ((∃y⦁ φy) ⇔ (∃z⦁ ψz))⌝,
(* *10.35  *) ⌜(∃x⦁ p ∧ φx) ⇔ p ∧ (∃y⦁ φy)⌝,
(* *10.42  *) ⌜(∃x⦁ φx) ∨ (∃y⦁ ψy) ⇔ (∃z⦁ φz ∨ ψz)⌝,
(* *10.5   *) ⌜(∃x⦁ φx ∧ ψx) ⇒ (∃y⦁ φy) ∧ (∃z⦁ ψz)⌝,
(* *10.51  *) ⌜¬(∃x⦁ φx ∧ ψx) ⇒ (∀y⦁ φy ⇒ ¬ ψy)⌝];
=TEX

=SML
(* Results from Principia Mathematica *11 *)
val PM11 =[
(* *11.1  *) ⌜(∀x y⦁ φ(x,y)) ⇒ φ(z,w)⌝,
(* *11.2  *) ⌜(∀x y⦁ φ(x,y)) ⇔ ∀y x⦁ φ(x,y)⌝,
(* *11.3  *) ⌜(p ⇒ (∀x y⦁ φ(x,y)))
		⇔ (∀x y⦁ p ⇒ φ(x,y))⌝,
(* *11.32 *) ⌜(∀x y⦁ φ(x,y) ⇒ ψ(x,y))
		⇒ (∀x y⦁ φ(x,y)) ⇒ (∀x y⦁ ψ(x,y))⌝,
(* *11.35 *) ⌜(∀x y⦁ φ(x,y) ⇒ p) ⇔ (∃x y⦁ φ(x,y)) ⇒ p⌝,
(* *11.45 *) ⌜(∃x y⦁ p ⇒ φ(x,y))
		⇔ (p ⇒ (∃x y⦁ φ(x,y)))⌝,
(* *11.54 *) ⌜(∃x y⦁ φx ∧ ψy) ⇔ (∃x⦁ φx) ∧ (∃y⦁ ψy)⌝,
(* *11.55 *) ⌜(∃x y⦁ φx ∧ ψ(x,y))
		⇔ (∃x⦁ φx ∧ (∃y⦁ ψ(x,y)))⌝,
(* *11.6  *) ⌜(∃x⦁ (∃y⦁ φ(x,y) ∧ ψy) ∧ χx)
		⇔ (∃y⦁ (∃x⦁ φ(x,y) ∧ χx) ∧ ψy)⌝,
(* *11.62 *) ⌜(∀x y⦁ φx ∧ ψ(x,y) ⇒ χ(x,y))
  		⇔ (∀x⦁ φx ⇒ (∀y⦁ ψ(x,y) ⇒ χ(x,y)))⌝
];
=TEX

=SML
(* results from ZRM provable by stripping *)
val ZRM1 = [
⌜a ∪ a = a ∪ {}⌝,
⌜a ∪ {} = a ∩ a⌝,
⌜a ∩ a = a \ {}⌝,
⌜a \ {} = a⌝,
⌜a ∩ {} = a \ a⌝,
⌜a \ a = {} \ a⌝,
⌜{} \ a = {}⌝,
⌜a ∪ b = b ∪ a⌝,
⌜a ∩ b = b ∩ a⌝,
⌜a ∪ (b ∪ c) = (a ∪ b) ∪ c⌝,
⌜a ∩ (b ∩ c) = (a ∩ b) ∩ c⌝,
⌜a ∪ (b ∩ c) = (a ∪ b) ∩ (a ∪ c)⌝,
⌜a ∩ (b ∪ c) = (a ∩ b) ∪ (a ∩ c)⌝,
⌜(a ∩ b) ∪ (a \ b) = a⌝,
⌜(a \ b) ∩ b = {}⌝,
⌜a \ (b \ c) = (a \ b) ∪ (a ∩ c)⌝,
⌜(a \ b) \ c = (a \ (b ∪ c))⌝,
⌜a ∪ (b \ c) = (a ∪ b) \ (c \ a)⌝,
⌜a ∩ (b \ c) = (a ∩ b) \ c⌝,
⌜(a ∪ b) \ c = (a \ c) ∪ (b \ c)⌝];
=TEX

=SML
val ZRM2 = [
⌜a \ (b ∩ c) = (a \ b) ∪ (a \ c)⌝,
⌜¬ x ∈ {}⌝,
⌜a ⊆ a⌝,
⌜¬ a ⊂ a⌝,
⌜{} ⊆ a⌝,
⌜⋃ {} = {}⌝,
⌜⋂ {} = Universe⌝];
=TEX
=SML
(* results from ZRM *)
val ZRM3 = [
⌜a ⊆ b ⇔ a ∈ ℙ b⌝,
⌜a ⊆ b ∧ b ⊆ a ⇔ a = b⌝,
⌜¬ (a ⊂ b ∧ b ⊂ a)⌝,
⌜a ⊆ b ∧ b ⊆ c ⇒ a ⊆ c⌝,
⌜a ⊂ b ∧ b ⊂ c ⇒ a ⊂ c⌝,
⌜{} ⊂ a ⇔ ¬ a = {}⌝,
⌜⋃ (a ∪ b) = (⋃ a) ∪ (⋃ b)⌝,
⌜⋂ (a ∪ b) = (⋂ a) ∩ (⋂ b)⌝,
⌜ a ⊆ b ⇒ ⋃ a ⊆ ⋃ b ⌝,
⌜ a ⊆ b ⇒ ⋂ b ⊆ ⋂ a ⌝];
=TEX


\section{HOL Theory Explorations}\label{HOLTheoryExplorations}

\begin{itemize}
\item
Find the names of all the theories:
=SML
get_theory_names();
=TEX
\item
Print selected theories, e.g.:
=SML
open_theory"sets";
print_theory"sets";
=TEX
\item
Get the terms from the definitions in a theory, e.g.:
=SML
open_theory "bin_rel";
(map concl o map snd o get_defns) "bin_rel";
=TEX
\item
Now select interesting terms and take them apart using, e.g.:
=SML
dest_simple_term ⌜∀ r s⦁ r ⊕ s = (Dom s ⩤ r) ∪ s⌝;
=GFT Hol Output
val it = App (⌜$∀⌝, ⌜λ r⦁ ∀ s⦁ r ⊕ s = (Dom s ⩤ r) ∪ s⌝) : DEST_SIMPLE_TERM
=SML
dest_simple_term ⌜{1;2;3}⌝;
=GFT Hol Output
val it = App (⌜Insert 1⌝, ⌜{2; 3}⌝) : DEST_SIMPLE_TERM
=SML
get_spec ⌜Insert⌝;
=GFT Hol Output
val it = ⊢ ∀ x y a
  ⦁ ¬ x ∈ {} ∧ x ∈ Universe ∧ (x ∈ Insert y a ⇔ x = y ∨ x ∈ a) : THM
=TEX
\end{itemize}

\section{Specification}\label{Specification}

\begin{itemize}
\item
Create a new theory, e.g. :
=SML
open_theory "usr013";
new_theory "usr013X";
=TEX
\item
Write a specification in HOL of a function to add the elements of a list of numbers.

{ HINT: if your specification goes in as a ``Constspec'' then the system could not prove it consistent, and its probably either wrong or poorly structured.
Try to make it clearly `primitive recursive'.}
\item
Use it to ``evaluate'' the term $⌜list\_sum [1;2;3;4;5]⌝$.
=GFT
rewrite_conv[get_spec⌜list_sum⌝]
	⌜list_sum [1;2;3;4;5]⌝;
=TEX
\end{itemize}

\section{Forward Proof}\label{ForwardProof}

=IGN
asm_rule
strip_∧_rule
⇒_elim
∀_elim
all_∀_elim
list_∀_elim
all_∀_intro
list_∀_intro
¬_plus1_thm
≤_trans_thm
¬_less_thm
=TEX
\begin{enumerate}
\item
Using $⇒\_elim$ and $asm\_rule$ prove:
\begin{enumerate}
\item
$ b⇒c, a⇒b, a ⊢ c$
\item
$ a⇒b⇒c, a, b ⊢ c$
\end{enumerate}
\item
Using $∀\_elim$ with $¬\_plus1\_thm$ prove:
\begin{enumerate}
\item
$ ⊢ ¬ 0+1=0 $
\item
$ ⊢ ¬ x*x+1=0 $
\end{enumerate}
\item
Using $all\_∀\_elim$ with $≤\_trans\_thm$ prove:
\begin{enumerate}
\item
$⊢ m ≤ i ∧ i ≤ n ⇒ m ≤ n $
\end{enumerate}
\item
Using $list\_∀\_elim$ prove:
\begin{enumerate}
\item (with $¬\_less\_thm$)$⊢ ¬ 0 < 1 ⇔ 1 ≤ 0$
\item (with $≤\_trans\_thm$)⊢ ∀ n⦁ 3 ≤ x * x ∧ x * x ≤ n ⇒ 3 ≤ n
\end{enumerate}
\item
Using $all\_∀\_elim$, $strip\_∧\_rule$, $nth$, $all\_∀\_intro$:
\begin{enumerate}
\item (with $≤\_clauses$)⊢ ∀ i m n⦁ i + m ≤ i + n ⇔ m ≤ n
\item (using $list\_∀\_intro$)⊢ ∀ m i n⦁ i + m ≤ i + n ⇔ m ≤ n
\end{enumerate}
\end{enumerate}

\section{Rewriting with the Subgoal Package}\label{RewritingSubgoalPackage}

\begin{enumerate}
\item
set a goal from the examples on set theory, e.g.:
=SML
set_goal([],⌜a \ (b ∩ c) = (a \ b) ∪ (a \ c)⌝);
=TEX
\item
rewrite the goal using the current proof context:
=SML
a (rewrite_tac[]);
=TEX
\item
step back using undo:
=SML
undo 1;
=TEX
\item
now try rewriting without using the proof context:
=GFT
a (pure_rewrite_tac[]);
=TEX
(this should fail)
\item
try rewriting one layer at a time:
=SML
a (once_rewrite_tac[]);
=TEX
repeat until it fails.
\item
now try rewriting with specific theorems:
=SML
set_goal([],⌜a \ (b ∩ c) = (a \ b) ∪ (a \ c)⌝);
a (pure_rewrite_tac[sets_ext_clauses]);
a (pure_rewrite_tac[set_dif_def]);
a (pure_rewrite_tac[∩_def, ∪_def]);
a (pure_rewrite_tac[set_dif_def]);
=TEX
\item
finish the proof by stripping:
=SML
a (REPEAT strip_tac);
=TEX
\item
extract the theorem
=SML
top_thm();
=TEX
\item repeat the above then try repeating:
=SML
pop_thm();
=TEX
\end{enumerate}

\section{Combining Forward and Backward Proof}\label{ForwardBackwardProof}

Prove the following results by rewriting using the goal package:

(for each example, try the methods which worked on the previous examples first to see how they fail before following the hint)

Prove:

\begin{enumerate}
\item
=SML
set_goal([],⌜x + y = y + x⌝);
=TEX
\item
=SML
set_goal([],⌜x + y + z = (x + y) + z⌝);
=TEX
\item
=SML
set_goal([],⌜z + y + x = y + z + x⌝);
=TEX
\item
=SML
set_goal([],⌜x + y + z = y + z + x⌝);
=TEX
\item
=SML
set_goal([],⌜x + y + z + v = y + v + z + x⌝);
=TEX
\end{enumerate}

Hints:

\begin{enumerate}
\item
try rewriting (with nothing but the default rewrites)
\item
try using plus_assoc_thm
\item
try using plus_assoc_thm1
\item
try using ∀_elim with plus_assoc_thm1
\item
try using ∀_elim with plus_order_thm
\end{enumerate}

\section{Stripping}\label{Stripping}

Use the examples from Principia Mathematica \& ZRM given earlier, e.g.:
=SML
	set_goal([],⌜p ∧ q ⇒ (p ⇔ q)⌝);
=TEX
with
=SML
	a strip_tac;
=TEX
and/or
=SML
	a step_strip_tac;
=TEX
Observe the steps taken and try to identify the reasons for discharge of subgoals.

Now select the weakest ``proof context'':
=SML
	push_pc "initial";
=TEX
and retry the examples (or previous exercises).

When you have finished restore the original proof context by:
=SML
	pop_pc();
=TEX

\section{Induction}\label{Induction}

Prove the following results using the subgoal package.

\begin{enumerate}
\item
Appending the empty list has no effect
=SML
set_goal([], ⌜∀l1 ⦁ l1 @ [] = l1⌝);
=TEX
\item
``Reverse'' distributes over ``@'' (sort of)
=SML
set_goal([], ⌜∀l1 l2 ⦁
  Rev (l1 @ l2) = (Rev l2) @ (Rev l1)⌝);
=TEX
\item
``Map'' distributes over ``@''
=SML
set_goal([], ⌜∀f l1 l2 ⦁
  Map f (l1 @ l2) = (Map f l1) @ (Map f l2)⌝);
=TEX
\item
``Length'' distributes over ``@''
=SML
set_goal([], ⌜∀l1 l2⦁ Length (l1 @ l2)
	= Length l1 + Length l2⌝);
=TEX
\end{enumerate}

Hints:  You will need the result proven in the tutorial text concerning associativity of append ({\it append_assoc_thm}).
The result of the first exercise is also required in the remaining problems.

\section{TACTICALs}\label{Tacticals}

\begin{enumerate}
\item
Write a tactic which does $strip\_tac$ three times.

test it on:
=SML
set_goal([],⌜(a ⇒ b ⇒ c) ⇒ a ⇒ b ⇒ c⌝);
set_goal([],⌜(a ⇒ b) ⇒ a ⇒ c⌝);
=TEX
\item
Write a tactic which does $strip\_tac$ up to 3 times.

Try it on the same examples.
\item
Write a tactic which takes two arguments:
\begin{itemize}
\item
a term which is a variable
\item
a list of theorems
\end{itemize}
and performs an inductive proof of a theorem concerning lists by:
\begin{itemize}
\item
stripping the goal
\item
inducting on the variable
\item
rewriting with the assumptions and the list of theorems
\end{itemize}

Use it to shorten the earlier proofs about lists.
\end{enumerate}

\section{$strip\_asm\_tac$ etc.}\label{StripAsmTac}

\begin{enumerate}

\item Use $strip\_asm\_tac$ (with $∀\_elim$ and $ℕ\_cases\_thm$) or $cases\_tac$
to prove

\begin{enumerate}
\item
=INLINEFT
∀x⦁(if x = 0 then 1 else x) > 0
=TEX
\item
=INLINEFT
∀x y⦁(if x < y + 1 then x else y) < y + 1
=TEX
\item
=INLINEFT
∀a b⦁a ≤ (if a ≤ b then b else a)
=TEX
\item
=INLINEFT
∀a⦁a = 0 ∨ 1 ≤ a
=TEX
\end{enumerate}

\item
Using {\it(i)} $swap\_asm\_concl\_tac$ and {\it(ii)} $lemma\_tac$ give two different
proofs of each of:

\begin{enumerate}
\item
=INLINEFT
(∀x y⦁x ≤ y ⇒  P(x, y)) ⇒ (∀x y⦁x = y ⇒  P(x, y))
=TEX
\item
=INLINEFT
(∀x y⦁f x ≤ f y ⇒  x ≤ y) ⇒ (∀x y⦁f x = f y ⇒ x ≤ y)
=TEX
\end{enumerate}
\end{enumerate}

\section{Forward Chaining}\label{ForwardChaining}

\begin{enumerate}
\item
Experiment with the various $all\_$ and $asm\_$ variants of $fc\_tac$
to prove the following goals:
\begin{enumerate}
\item (using $≤\_trans\_thm$)
=GFT
		∀a b c d⦁a ≤ b ∧ b ≤ c ∧ c ≤ d ⇒ a ≤ d
=TEX
\item (no theorem required)
=GFT
		∀X Y Z⦁X ⊆ Y ∧ Y ⊆ Z ⇒ X ⊆ Z
=TEX
\end{enumerate}

In each case, what is the minimum number of applications of
a forward chaining tactic required and why?

\item
Can you use forward chaining to simplify the proof of the
following example from exercises 10:

=INLINEFT
(∀x y⦁f x ≤ f y ⇒  x ≤ y) ⇒ (∀x y⦁f x = f y ⇒ x ≤ y)
=TEX

\end{enumerate}

\section{Proof Contexts}\label{ProofContexts}

\begin{enumerate}
\item
Using $REPEAT\,strip\_tac$ and $asm\_rewrite\_tac$ prove
\begin{description}
\item[]
=INLINEFT
(∀x y⦁f(x, y) = (y, x)) ⇒ ∀x y⦁f(f (x, y)) = (x, y)
=TEX
\end{description}
Apply the tactics one at a time rather than using $THEN$.
Now set the proof context to ``$predicates$'' using $set\_pc$ and prove
it again. What differences do you observe?

Set the proof context back to ``$hol2$'' when you've finished.
\item
Prove the following
\begin{enumerate}
\item
=INLINEFT
{(x, y) | ¬x = 0 ∧ y = 2*x} ⊆ {(x, y) | x < y}
=TEX
\item
=INLINEFT
{(x, y) | x ≥ 2 ∧ y = 2*x} ⊆ {(x, y) | x + 1 < y}
=TEX
\item
=INLINEFT
A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C)
=TEX
\item
=INLINEFT
∀m⦁{i | m ≤ i ∧ i < m + 3} = {m; m+1; m+2}
=TEX
\item
=INLINEFT
{i | 5*i = 6*i} = {0}
=TEX
\end{enumerate}
\end{enumerate}

\section{Case Study}\label{CaseStudy}

First of all execute the $new\_theory$ command and the 4 paragraphs
of the vending machine specification.
\begin{enumerate}
\item
Execute the definition of $run\_vm$:
=SML
val run_vm = rewrite_conv[get_spec⌜vm⌝, get_spec⌜MkVM_State⌝];
=TEX

Experiment with the model by using $run\_vm$ to
see what it does on various test data. What does the vending machine do
if the price is set to $0$?
\item
Prove that the model of the vending machine satisfies its critical
requirements. I.e., prove:
$$ vm\,∈\,vm\_ok $$
=TEX
Hints:
\begin{enumerate}
\item
Try $REPEAT\,strip\_tac$
\item
Try rewriting with the definitions of any of
$MkVM\_State$, $vm$, $vm\_ok$ or $worth$
which appear in the goal.
\item
$let$-expressions may be eliminated by rewriting with $let\_def$.
\item
Is there an $if$-term in the goal?
Can you use $ℕ\_cases\_thm$ or $less\_cases\_thm$ (together
with $strip\_asm\_tac$ and $∀\_elim$ or $list\_∀\_elim$) to perform
the relevant case analysis?
\item
If you believe the goal is true by dint of arithmetic facts alone
try:
=GFT
		PC_T1 "lin_arith" asm_prove_tac[]
=TEX
\item
If none of the above hints apply, do you have an $if$-term which
could be simplified using an ``obvious'' arithmetic consequence of
your assumptions. If so set the ``obvious'' consequence up as a lemma
with $lemma\_tac$.
\end{enumerate}
\end{enumerate}

\section{Advanced Techniques}\label{AdvancedTechniques}

\ignore{
=SML
set_flag("ignore_warnings", true);
=TEX
}

\begin{description}
\item[1.]
Use $contr\_tac$, and $spec\_asm\_tac$ and rewriting
prove that there is no greatest natural number:
=SML
set_goal([], ⌜∀m⦁∃n⦁ m < n⌝);
=TEX
(Hint: $m < m + 1$).
\item[2.]
Rather than using $contr\_tac$, it is often more natural to prove goals
with existentially quantified conclusions directly. $∃\_tac$ lets you
do this by supplying a term to act as a ``witness''.
Use $∃\_tac$ to give a more natural solution to the previous exercise:
=SML
set_goal([], ⌜∀m⦁∃n⦁ m < n⌝);
=TEX
\item[3.]
Prove that there is no onto function from the natural numbers to the
set of all numeric functions on the natural numbers:
=SML
set_goal([], ⌜∀f : ℕ → (ℕ → ℕ)⦁∃g⦁∀i⦁¬f i = g⌝);
=TEX
(Hints: Note that for $f$ of the above type, $λj⦁(f\,j\,j) + 1$ cannot be
in the range of $f$. Rewriting with $ext\_thm$
is useful for reasoning about equations between functions.)

\item[4.]
It can happen that an equation is the wrong way round for use as
a rewrite rule. The usual means for dealing with this type of
problem is the conversion $eq\_sym\_conv$. Like other conversions
this may be propagated over a term using the conversionals $MAP\_C$
and $ONCE\_MAP\_C$.
Execute the following lines one at a time to see what happens:
=GFT
eq_sym_conv ⌜1 + 1 + 1 = 3⌝;
eq_sym_conv ⌜∀x⦁x + x + x = 3*x⌝;
ONCE_MAP_C eq_sym_conv ⌜∀x⦁x + x + x = 3*x⌝;
=TEX
A conversion may be converted into a tactic using $conv\_tac$.
Use this and the conversion and conversional you have just experimented
with together with the tactics $swap\_asm\_concl\_tac$
and the theorems $ext\_thm$ and $comb\_k\_def$ to prove the following:
=SML
set_goal([], ⌜∀f:'a→'b→'a⦁(∀x y⦁x = f x y) ⇒ f = CombK⌝);
=TEX
(Hint: take care to avoid looping rewrites by using the ``once'' rewriting
tactics while you look for the proof.)
\item[5.]
A common way of using a theorem is to
to strip it into the assumptions. This is done with $strip\_asm\_tac$.
Very often one specialises the theorem with $∀\_elim$ or $list\_∀\_elim$
before stripping it in and sometimes one may wish to use
$rewrite\_rule$ to rewrite it too.
Use the theorem $div\_mod\_unique\_thm$ in this way to prove:
=SML
set_goal([], ⌜∀i j⦁0 < i ⇒ (i * j) Div i = j⌝);
=TEX
(Hints: rewrite the theorem with $times\_comm\_thm$ suitably specialised
to identify subterms of the form $i * j$ and $j * i$ into the same form;
use the technique of the previous exercise to avoid a looping rewrite with
the assumption added by $strip\_asm\_tac$).

\item[6.]
Execute the following paragraph to define a function σ which maps $i$
to the sum of the first $i$ positive integers:
ⓈHOLCONST
│	σ : ℕ → ℕ
├──────────────
│	σ 0 = 0
│ ∧	∀i⦁ σ(i+1) = σ i + (i + 1)
■
The consistency of this paragraph should be proved automatically.
Check this by using $get\_spec$ to get the defining axiom for σ,
which should have no assumptions.
Prove the following theorem:
=SML
set_goal([], ⌜∀i⦁σ i = (i*(i + 1)) Div 2⌝);
=TEX
(Hint: use induction to prove a lemma that
$i*(i + 1) = 2\,*\,σ i$ and then use the result of the previous exercise;
the lemma may be proved by rewriting with assumptions and the definition
of σ and then using the proof context $lin\_arith$.)
\item[7.]
Construct a paragraph defining a function $φ$ such that for positive $i$,
$φ i$ is the $i\sp{th}$ element of the Fibonacci sequence,
$1, 1, 2, 3, 5, \ldots$, where each number is the sum of the previous
two. Does the system automatically prove the consistency of your
definition?

\item[8.]
If you did the previous exercise, delete the function $φ$ you defined (using $delete\_const$).
Enter the following paragraphs which define $φ$ using an auxiliary function $γ$:
ⓈHOLCONST
│	γ : ℕ → (ℕ × ℕ)
├────────────
│	γ 0 = (0, 1)
│ ∧	∀i⦁γ(i+1) = let (a, b) = γ i in (b, a + b)
│	
■
ⓈHOLCONST
│	φ : ℕ → ℕ
├────────────
│ 	∀i⦁φ i = Fst (γ i)
│	
■
These definitions are proved consistent automatically.
Prove that $φ$ does indeed compute the Fibonacci numbers:
=GFT
set_goal([], ⌜
	φ 0 = 0
∧	φ 1 = 1
∧	∀i⦁φ(i+2) = φ(i+1) + φ i
⌝);
=TEX
(Hints: first rewrite with the definition of $φ$; then prove a lemma
or lemmas showing how $γ\,1$ and $γ(i+2)$ may be rewritten so that
the definition of $γ$ may be used to rewrite them.)

\item[9.]

The approach of the previous exercise has the disadvantage that the specification was not as abstract as one might like.
A cleaner approach is to use the obvious definition of $φ$, and then prove that it
is consistent using a function $γ$ which is only introduced as a variable during the course of the proof.
The tactic $prove\_∃\_tac$ gives access to the mechanisms that the system uses in its attempt to prove that paragraphs are consistent.

We demonstrate the above technique in this exercise.

First of all, delete the function $γ$ that you defined in the previous
exercise
(using $delete\_const$, which will also cause $φ$ to be deleted).
=SML
delete_const⌜γ⌝;
=TEX
Enter the following paragraph which gives the natural definition of
$φ$:
ⓈHOLCONST
│	φ : ℕ → ℕ
├────────────
│	φ 0 = 0
│ ∧	φ 1 = 1
│ ∧	∀i⦁φ(i+2) = φ(i+1) + φ i
■
Examine the theorem that $get\_spec$ returns for $φ$, it has
a consistency caveat as an assumption.
Discharge this consistency caveat as follows:

First of all go into the subgoaling package using the following command:
=GFT
push_consistency_goal⌜φ⌝;
=TEX
Now set as a lemma the existence of a $γ$ as in the previous exercise;
the lemma is proved immediately by $prove\_∃\_tac$ and you can
then use $∃\_tac⌜λi⦁Fst(γ\,i)⌝$ followed a proof almost identical with the previous
exercise (hint: $rewrite\_tac$ will eliminate the β-redexes introduced
when you apply $∃\_tac$). Save the consistency theorem using the
following command:
=GFT
save_consistency_thm ⌜φ⌝ (pop_thm());
=TEX
If you now examine the theorem that $get\_spec$ returns for $φ$, you
should see that it no longer has an assumption.

(Note: the variable name `φ$'$', created by decorating `φ' is displayed by the pretty printer as $\$\,$``φ$'$'' since it violates the HOL lexical rules for identifiers.
The parser will accept identifiers violating the normal lexical rules if they are presented in this way.)

\end{description}

\section{Supplementary Exercises}\label{SupplementaryExercises}

\subsection{Linear Arithmetic}

Prove that any amount of money greater than seven cents can be made up from three and five cent coins.

This example came to us from SRI.

Hint:
Conduct the proof in proof context `hol2', invoking `lin_arith' only when needed.
Use proof by induction.
In the step case use a case split on whether there are any five cent coins in the solution assumed for the induction variable ⌜i⌝ and construct your witness for ⌜i+1⌝ accordingly.


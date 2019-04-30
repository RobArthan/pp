=IGN
********************************************************************************
usr011S.doc: this file is part of the PPZed system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% usr011S.doc   ℤ $Date: 2005/09/09 11:24:33 $ $Revision: 1.18 $ $RCSfile: usr011S.doc,v $
% this should form a Chapter of the document
% Solutions to Exercises
=TEX

The section numbers of this chapter correspond to those in the Exercises chapter.

The source script for this chapter is the file usr011S.doc.
This may be converted into an ML script using $docsml$, or alternatively the formal text can be entered interactively by cut-and-paste from the source document into a command tool in which {\Product} is running.


\section{The Z Predicate Calculus}
\subsection{Forward Propositional Proofs}

Solutions to forward proof exercises.

%   context setting point 1

=SML
repeat drop_main_goal;
open_theory "z_exercises_1";
set_pc "z_library";
=TEX



=SML
(* (a) *)
val ex1a_thm1 = asm_rule ⓩ a⇒b⌝;
val ex1a_thm2 = asm_rule ⓩ b⇒c⌝;
val ex1a_thm3 = asm_rule ⓩ Π(a)⌝;
val ex1a_thm4 = ⇒_elim ex1a_thm1 ex1a_thm3;
val ex1a_thm = ⇒_elim ex1a_thm2 ex1a_thm4;

save_thm ("ex1a_thm", ex1a_thm);

(* (b) *)
val ex1b_thm1 =
 ⇒_elim (asm_rule ⓩ a⇒b⇒c⌝)(asm_rule ⓩ Π(a)⌝);
val ex1b_thm =
 ⇒_elim ex1b_thm1 (asm_rule ⓩ Π(b)⌝);

save_thm ("ex1b_thm", ex1b_thm);

(* (c) *)
val ex1c_thm = ⇒_intro ⓩ Π(a)⌝ ex1b_thm;

save_thm ("ex1c_thm", ex1c_thm);

(* (d) *)
val ex1d_thm1 = ⇒_intro ⓩ Π(b)⌝ ex1c_thm;
val ex1d_thm = ⇒_intro ⓩ a ⇒ b ⇒ c⌝ ex1d_thm1;

save_thm ("ex1d_thm", ex1d_thm);

=TEX

\subsection{Goal Oriented Propositional Proofs}

For each of the exercises either:
=GFT SML
a (prove_tac[]);
=TEX
or:
=GFT SML
a (REPEAT z_strip_tac);
=TEX
will complete the proof in one step.

To get an understanding of how this is done the proofs may be obtained in steps by manually repeating:
=GFT SML
a z_strip_tac;
=TEX
or:
=GFT SML
a step_strip_tac;
=TEX

We show here just one example of proof by stripping, you may work through as many other examples as you like.
=SML
setlg "*2.02" PM2;
=TEX

The results may be proven automatically as follows:

=SML
map prove_and_store PM2;
map prove_and_store PM3;
map prove_and_store PM4;
map prove_and_store PM5;
=TEX

Though technically these may be considered forward proofs since they use $prove_rule$, prove rule itself uses $prove_tac$, and so the difference between completely automatic forward and backward proof is insignificant.

%***4***
\subsection{Forward Predicate Calculus Proofs}

Forward proof using elementary rules is less convenient in Z because of the extra complications arising when quantifiers are eliminated or introduced.

% context setting point 2

=SML
repeat drop_main_goal;
open_theory "z_exercises_1";
set_pc "z_library";


(* 1(a) *)
val ex1a_thm1 = z_∀_elim ⓩ 0⌝ z_ℕ_¬_plus1_thm;
(* 1(b) *)
val ex1b_thm = z_∀_elim ⓩ x*x⌝ z_ℕ_¬_plus1_thm;

(* 2 *)
val ex2_thm = prove_rule [z_≤_trans_thm]
	ⓩ i ≤ j ∧ j ≤ k ⇒ i ≤ k⌝ ;
	
(* note that:
z_∀_elim ⓩ(i≜i⦂ℤ, j≜j⦂ℤ, k≜k⦂ℤ)⌝ z_≤_trans_thm;
doesn't do the job.
*)

(* 3(a) *)
val ex3a_thm = prove_rule [z_ℕ_¬_plus1_thm]
	ⓩ¬ 0 + 1 = 0⌝;
(* 3(b) *)
val ex3b_thm = prove_rule [z_ℕ_¬_plus1_thm]
	ⓩ x * x ∈ ℕ ⇒ ¬ x * x + 1 = 0⌝;

(* 4(a) *)
val ex4a_thm = prove_rule[z_¬_less_thm]
	ⓩ¬ 0 < 1 ⇔ 1 ≤ 0⌝;
(* 4(b) *)
val ex4b_thm = prove_rule[z_≤_trans_thm]
	ⓩ∀ n:ℤ ⦁ 3 ≤ x * x ∧ x * x ≤ n ⇒ 3 ≤ n⌝;

(* 5(a) *)
val ex5a_thm = prove_rule[z_≤_clauses]
	ⓩ∀ i, m, n :ℤ⦁ i + m ≤ i + n ⇔ m ≤ n⌝;
(* 5(b) *)
val ex5b_thm = prove_rule[z_≤_clauses]
	ⓩ∀ m, i, n :ℤ⦁ i + m ≤ i + n ⇔ m ≤ n⌝;
=TEX

\subsection{Goal Oriented Predicate Calculus Proof}

=IGN
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
These proofs are also conducted automatically.

% context setting point 3  (there is none)

=SML
map prove_and_store PM9;
map prove_and_store PM10;
map prove_and_store PM10b;
map prove_and_store PM11;
=TEX

The problems in PM11b cannot be solved by $prove_tac$.
=SML
set_goal([], lassoc3 PM11b "*11.32");
=GFT ProofPower output
...
(* ?⊢ *)  ⓩ[Y]((∀ x, y : Y ⦁ φ (x, y) ⇒ ψ (x, y))
             ⇒ (∀ x, y : Y ⦁ φ (x, y))
             ⇒ (∀ x, y : Y ⦁ ψ (x, y)))⌝
...
=SML
a contr_tac;
=GFT ProofPower output
...
(*  4 *)  ⓩ∀ x, y : Y ⦁ φ (x, y) ⇒ ψ (x, y)⌝
(*  3 *)  ⓩ∀ x, y : Y ⦁ φ (x, y)⌝
(*  2 *)  ⓩx ∈ Y⌝
(*  1 *)  ⓩy ∈ Y⌝

(* ?⊢ *)  ⓩψ (x, y)⌝
...
=SML
a(z_spec_nth_asm_tac 5 ⓩ(x ≜ x, y ≜ y)⌝);
=GFT ProofPower output
...
(*  6 *)  ⓩ∀ x, y : Y ⦁ φ (x, y) ⇒ ψ (x, y)⌝
(*  5 *)  ⓩ∀ x, y : Y ⦁ φ (x, y)⌝
(*  4 *)  ⓩx ∈ Y⌝
(*  3 *)  ⓩy ∈ Y⌝
(*  2 *)  ⓩ¬ ψ (x, y)⌝
(*  1 *)  ⓩ¬ φ (x, y)⌝

(* ?⊢ *)  ⓩfalse⌝
...
=SML
a(z_spec_nth_asm_tac 5 ⓩ(x ≜ x, y ≜ y)⌝);
=GFT ProofPower output
Tactic produced 0 subgoals:
Current and main goal achieved
val it = () : unit
=SML
save_pop_thm("*11.32");
=TEX
=SML
setlg "*11.45" PM11b;
a contr_tac;
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(x ≜ x', y ≜ y')⌝);
(* *** Goal "2" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(x ≜ x, y ≜ y)⌝);
(* *** Goal "3" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(x ≜ x', y ≜ y')⌝);
save_pop_thm("*11.45");
=TEX
=SML
setlg "*11.54" PM11b;
a contr_tac;
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(x ≜ x)⌝);
(* *** Goal "2" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(y ≜ y)⌝);
(* *** Goal "3" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(x ≜ x, y ≜ y)⌝);
save_pop_thm("*11.54");
=SML
setlg "*11.55" PM11b;
a contr_tac;
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(x ≜ x)⌝);
a(z_spec_nth_asm_tac 1 ⓩ(y ≜ y)⌝);
(* *** Goal "2" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(x ≜ x, y ≜ y)⌝);
save_pop_thm("*11.55");
=TEX
=SML
setlg "*11.6" PM11b;
a contr_tac;
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(y ≜ y)⌝);
a(z_spec_nth_asm_tac 1 ⓩ(x ≜ x)⌝);
(* *** Goal "2" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(x ≜ x)⌝);
a(z_spec_nth_asm_tac 1 ⓩ(y ≜ y)⌝);
save_pop_thm("*11.6");
=TEX
=SML
setlg "*11.62" PM11b;
a contr_tac;
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 6 ⓩ(x ≜ x, y ≜ y)⌝);
(* *** Goal "2" *** *)
a(z_spec_nth_asm_tac 6 ⓩ(x ≜ x)⌝);
a(z_spec_nth_asm_tac 1 ⓩ(y ≜ y)⌝);
save_pop_thm("*11.62");
=TEX
Forward chaining suffices.  To show this we first delete the theorems from the theory:
=SML
map delete_thm (map fst PM11b);
=TEX
Then we write a function to do the proofs using a simpler approach:
=SML
fun prove_and_store2 (key, term) = save_thm (key,
	tac_proof (([],term),
	(contr_tac
		THEN (all_asm_fc_tac[])
		THEN (all_asm_fc_tac[]))));
		
map prove_and_store2 PM11b;
=TEX

% ***5***
\subsection{Rewriting}
\subsubsection{Rewriting with the Subgoal Package}

% context setting point 4

=SML
repeat drop_main_goal;
open_theory "z_exercises_1";
set_pc "z_library_ext";
=TEX


No solutions.

% ***6***
\subsubsection{Combining Forward and Backward Proof}

% context setting point 5

=SML
repeat drop_main_goal;
open_theory "z_exercises_1";
set_pc "z_library";


=TEX

\begin{enumerate}
\item :
=SML
set_goal([],ⓩ x + y = y + x⌝);
a (rewrite_tac[]);
save_pop_thm "X6.1";
=TEX
\item :
=SML
set_goal([],ⓩ x + y + z = (x + y) + z⌝);
a (rewrite_tac[z_plus_assoc_thm]);
save_pop_thm "X6.2";
=TEX
\item :
=SML
set_goal([],ⓩ z + y + x = y + z + x⌝);
a (rewrite_tac[z_plus_assoc_thm1]);
save_pop_thm "X6.3";
=TEX
\item :
=SML
set_goal([],ⓩ x + y + z = y + z + x⌝);
a (rewrite_tac[z_∀_elim ⓩ(i≜y,j≜z,k≜x)⌝
	z_plus_assoc_thm1]);
save_pop_thm "X6.4";
=TEX
\item :
=SML
set_goal([],ⓩ x + y + z + v = y + v + z + x⌝);
a (rewrite_tac[z_∀_elim ⓩ x⌝ z_plus_order_thm]);
save_pop_thm "X6.5";
=TEX
\end{enumerate}
\subsection{Stripping}
No solutions.

\section{Expressions and Schema Expressions}

\subsection{Expressions}


% context setting point 6

=SML
repeat drop_main_goal;
open_theory "z_exercises_2";
set_pc "z_library";
=TEX

Group ZE1 are all provable automatically in proof context $z_library$.
=SML
map prove_and_store ZE1;
=TEX

% context setting point 7


Group ZE2 are provable automatically in proof context $z_library_ext$.
=SML
repeat drop_main_goal;
open_theory "z_exercises_2";
set_pc "z_language_ext" ;

map prove_and_store ZE2;
=TEX


Group ZE3 results are not automatically provable.
Thought the results are primarily about the language, they make use of definitions in the Z ToolKit and therefore need to be conducted in the proof context $z_library$.

=SML
set_pc "z_library";
=TEX
=SML
(* ZE3.1 *)
set_goal ([], ⓩ(λx:ℤ⦁ x+1) 3 = 4⌝);
a (conv_tac (MAP_C z_β_conv));
a (rewrite_tac[]);
save_pop_thm "ZE3.1";
=TEX
=SML
(* ZE3.2 *)
set_goal ([], ⓩ{(1,2), (3,4)} 3 = 4⌝);
a (z_app_eq_tac);
a (rewrite_tac []);
a (REPEAT strip_tac);
save_pop_thm "ZE3.2";
=TEX
=SML
(* ZE3.3 *)
set_goal ([], ⓩ(1,~2) ∈ (abs _) ⇒ abs 1 = ~2⌝);
a (REPEAT strip_tac);
a (strip_asm_tac (z_get_spec ⓩ(abs _)⌝));
a (asm_tac (prove_rule[] ⓩ 1 ∈ ℤ⌝));
a (all_fc_tac [z_→_∈_rel_⇔_app_eq_thm]);
save_pop_thm "ZE3.3";
=TEX
=SML
(* ZE3.4 *)
set_goal ([], ⓩ∀ i,j:ℤ⦁ (i,j) ∈ (abs _) ⇒ abs i = j⌝);
a (REPEAT strip_tac);
a (strip_asm_tac (z_get_spec ⓩ(abs _)⌝));
a (asm_tac (prove_rule[] ⓩ i ∈ ℤ⌝));
a (all_fc_tac [z_→_∈_rel_⇔_app_eq_thm]);
save_pop_thm "ZE3.4";
=TEX
=SML
(* ZE3.5 *)
set_goal ([], ⓩ∀i:ℤ⦁ abs i ∈ ℕ⌝);
a (REPEAT strip_tac);
a (strip_asm_tac (z_get_spec ⓩ(abs _)⌝));
a (asm_tac (prove_rule[] ⓩ i ∈ ℤ⌝));
a (all_fc_tac [z_fun_∈_clauses]);
save_pop_thm "ZE3.5";
=TEX
=SML
(* ZE3.6 *)
set_goal ([], ⓩ(μx:ℤ | x=3 ⦁ x*x) = 9⌝);
a (strip_asm_tac (z_∀_elim ⓩ9⌝ (z_μ_rule ⓩ(μx:ℤ | x=3 ⦁ x*x)⌝)));
(* *** Goal "1" *** *)
a (var_elim_nth_asm_tac 2);
a (asm_ante_tac ⓩ¬ 3 * 3 = 9⌝ THEN rewrite_tac[]);
(* *** Goal "2" *** *)
a (z_spec_nth_asm_tac 1 ⓩ3⌝);
a (asm_ante_tac ⓩ¬ 3 * 3 = 9⌝ THEN rewrite_tac[]);
save_pop_thm "ZE3.6";
=TEX
=SML
(* ZE3.7 *)
set_goal ([], ⓩ25 ∈ {y:ℤ ⦁ y*y}⌝);
a (rewrite_tac[]);
a (z_∃_tac ⓩ5⌝);
a (rewrite_tac[]);
save_pop_thm "ZE3.7";
=TEX
=SML
(* ZE3.8 *)
set_goal ([], ⓩ(a × b × c) = (d × e × f) ⇒ (a × b) = (d × e) ∨ (c ∩ f) = ∅ ⌝);
a (PC_T1 "z_library_ext" rewrite_tac[]);
a (contr_tac THEN all_asm_fc_tac[]);
a (z_spec_nth_asm_tac 6 ⓩ(x1 ≜ x1, x2 ≜ x2, x3 ≜ x1')⌝);
a (z_spec_nth_asm_tac 6 ⓩ(x1 ≜ x1, x2 ≜ x2, x3 ≜ x1')⌝);
save_pop_thm "ZE3.8";
=TEX
=SML
(* ZE3.9 *)
set_goal ([], ⓩ[X,Y](∀ p: ℙ (X × Y)⦁
			(∀ x:X; y:Y⦁ (x,y) ∈ p)
		⇔	(∀ z:X × Y⦁ z ∈ p))⌝);
a (REPEAT strip_tac);
(* *** Goal "1" *** *)
a (z_spec_nth_asm_tac 3 ⓩ(x ≜ z.1, y ≜ z.2)⌝);

a (conv_tac (ONCE_MAP_C z_sel⋎t_intro_conv));

a (asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a (z_spec_nth_asm_tac 3 ⓩ(x,y)⌝);
save_pop_thm "ZE3.9";
=TEX
=SML
(* ZE3.10 *)
set_goal ([], ⓩ[File | people = {}] = {File | people = {}}⌝);
a (PC_T "z_library_ext" z_strip_tac);
a (prove_tac[]);
a (z_∃_tac ⓩ(age ≜ x1, people ≜ x2)⌝);
a (asm_rewrite_tac[]);
save_pop_thm "ZE3.10";
=TEX
=SML
(* ZE3.11 *)
set_goal ([], ⓩ⟨a,b⟩ = ⟨c,d⟩ ⇒ a=c ∧ b=d⌝);
a (PC_T "z_library_ext" contr_tac);
(* *** Goal "1" *** *)
a (z_spec_nth_asm_tac 2 ⓩ(x1 ≜ 1, x2 ≜ a)⌝);
(* *** Goal "2" *** *)
a (z_spec_nth_asm_tac 2 ⓩ(x1 ≜ 2, x2 ≜ b)⌝);
save_pop_thm "ZE3.11";
=TEX
=SML
(* ZE3.12 *)
set_goal ([], ⓩ⟨a,b⟩ = ⟨d,e⟩ ⇒ ⟨b,d⟩ = ⟨e,a⟩⌝);
a (PC_T "z_library_ext" z_strip_tac);
a (z_spec_nth_asm_tac 1 ⓩ(x1 ≜ 1, x2 ≜ a)⌝);
a (z_spec_nth_asm_tac 2 ⓩ(x1 ≜ 2, x2 ≜ b)⌝);
a (asm_rewrite_tac[]);
save_pop_thm "ZE3.12";
=TEX

\subsection{Propositional Schema Calculus}

These results can be solved by stripping in a manner analogous to the analogous propositional result.
=SML
repeat drop_main_goal;
open_theory "z_exercises_2";
set_pc "z_language";
=TEX
We illustrate the proofs by showing one example in detail.
=SML
setlg "*2.03" SCPM2;
=GFT ProofPower output
...
(* *** Goal "" *** *)

(* ?⊢ *)  ⓩ((Pab ⇒ ¬ Qac) ⇒ Qac ⇒ ¬ Pab)⌝
...
=TEX
In the following proof two main things are taking place.

Firstly, the logical schema operators are being transformed into the corresponding propositional logic operators, and secondly, the stripping of these follows the normal course.

In addition there is some switching taking place between schemas-as-predicates, in which there is an implicit binding membership assertion, and explicit statements about membership of bindings.

The basic proof facilities are provided for the binding membership assertions since these are more general than the schema-as-predicate format, and also are likely to arise from the latter when substitutions take place.
At present the stripping facilities will revert to the schema-as-predicate format at the top level of the conclusion or assumptions if possible.
=SML
a z_strip_tac;
=GFT ProofPower output
..
(* ?⊢ *)  ⓩ(a ≜ a, b ≜ b, c ≜ c) ∈ (Pab ⇒ ¬ Qac)
             ⇒ (a ≜ a, b ≜ b, c ≜ c) ∈ (Qac ⇒ ¬ Pab)⌝
...
=TEX
The first step has transformed the implication to a logical implication.
=SML
a z_strip_tac;
=GFT ProofPower output
Tactic produced 2 subgoals:

(* *** Goal "2" *** *)

(*  1 *)  ⓩ¬ Qac⌝

(* ?⊢ *)  ⓩ(Qac ⇒ ¬ Pab)⌝


(* *** Goal "1" *** *)

(*  1 *)  ⓩ¬ Pab⌝

(* ?⊢ *)  ⓩ(Qac ⇒ ¬ Pab)⌝
...
=TEX
When the implication is stripped the left hand side is completely stripped into the assumptions.
This results in a case split.
Note here that the negation in the assumption is now a logical negation.
=SML
a z_strip_tac;
=GFT ProofPower output
...
(*  1 *)  ⓩ¬ Pab⌝

(* ?⊢ *)  ⓩ(a ≜ a, c ≜ c) ∈ Qac ⇒ (a ≜ a, b ≜ b) ∈ (¬ Pab)⌝
...
=SML
a z_strip_tac;
=GFT ProofPower output
...
(*  2 *)  ⓩ¬ Pab⌝
(*  1 *)  ⓩQac⌝

(* ?⊢ *)  ⓩ(¬ Pab)⌝
...
=TEX
Here we are not quite finished because the negation in the assumption is a logical negation while the one in the conclusion is a schema-negation.
=SML
a z_strip_tac;
=GFT ProofPower output
...
(*  2 *)  ⓩ¬ Pab⌝
(*  1 *)  ⓩQac⌝

(* ?⊢ *)  ⓩ¬ (a ≜ a, b ≜ b) ∈ Pab⌝
...
=SML
a z_strip_tac;
=GFT ProofPower output
...
(*  2 *)  ⓩ¬ Pab⌝
(*  1 *)  ⓩQac⌝

(* ?⊢ *)  ⓩ¬ Pab⌝
...
=TEX
Now the conclusion really is the same as the assumption.
=SML
a z_strip_tac;
=GFT ProofPower output
Current goal achieved, next goal is:

(* *** Goal "2" *** *)

(*  1 *)  ⓩ¬ Qac⌝

(* ?⊢ *)  ⓩ(Qac ⇒ ¬ Pab)⌝
...
=TEX
The proof of this subgoal contains nothing new so we do it in one step.
=SML
a (REPEAT z_strip_tac);
=GFT ProofPower output
Tactic produced 0 subgoals:
Current and main goal achieved
val it = () : unit
=TEX
An alternative approach is to eliminate the schema operations first by rewriting, and then complete the proof by stripping.
=SML
setlg "*2.03" SCPM2;
=GFT ProofPower output
...
(* *** Goal "" *** *)

(* ?⊢ *)  ⓩ((Pab ⇒ ¬ Qac) ⇒ Qac ⇒ ¬ Pab)⌝
...
=TEX
Since all the membership conversions are built in to the proof context $z_language$ rewriting with no parameters suffices to eliminate the schema operators.
This would not be the case if the schema expression had not been used as a predicate, since the implicit membership statement is essential to trigger the transformations in this context.
=SML
a (rewrite_tac[]);
=TEX
This yields the syntactically similar goal in which all operators are logical operators rather than schema operators.
=GFT ProofPower output
...
(* ?⊢ *)  ⓩ(Pab ⇒ ¬ Qac) ⇒ Qac ⇒ ¬ Pab⌝
...
=TEX
A cleaner proof is now obtained by stripping.
=SML
a z_strip_tac;
=GFT ProofPower output
(* *** Goal "2" *** *)

(*  1 *)  ⓩ¬ Qac⌝

(* ?⊢ *)  ⓩQac ⇒ ¬ Pab⌝


(* *** Goal "1" *** *)

(*  1 *)  ⓩ¬ Pab⌝

(* ?⊢ *)  ⓩQac ⇒ ¬ Pab⌝
...
=TEX
We will not complete the proof, which proceeds as the previous one but with a number of steps omitted.
=SML
drop_main_goal();
=TEX
Many other examples are provided for you to play through if you wish.
The following script demonstrates that the system can prove them all automatically.
=SML
map prove_and_store SCPM2;
map prove_and_store SCPM3;
map prove_and_store SCPM4;
map prove_and_store SCPM5;
=TEX

\subsection{Schema Calculus Quantification}
=SML
open_theory "z_exercises_2";
set_pc "z_library";
=TEX
=SML
map prove_and_store SCPM9;
map prove_and_store SCPM10;
=TEX

\section{Paragraphs}
% First set the context.
% =SML
% open_theory "z_exercises_3";
% set_pc "z_library";
% =TEX

\subsection{Axiomatic Descriptions and Generics}




\begin{enumerate}
\item \
% context setting point 8

=SML
repeat drop_main_goal;
open_theory "z_exercises_3";
set_pc "z_library";
set_flags [("z_type_check_only", false), ("z_use_axioms", true)];
=TEX
ⓈZ
fun  if _ then _ else _
■

\item \

╒[X]═══════════════════════
│	if _ then _ else _ : (𝔹 × X × X) → X
├───────────────
│	∀ e1,e2:X⦁
│	if true then e1 else e2 = e1
│ ∧	if false then e1 else e2 = e2
└───────────────────────────

\item \

First specialise the specification to $𝕌$ to simplify using it as a rewrite.
=SML
val if_then_else_thm = z_gen_pred_elim [ⓩ𝕌⌝]
	(z_get_spec ⓩ(if _ then _ else _ ) ⌝);
=GFT ProofPower output
val if_then_else_thm = ⊢ (if _ then _ else _) ∈ 𝔹 × 𝕌 × 𝕌 → 𝕌
    ∧ (∀ e1, e2 : 𝕌
      ⦁ if true then e1 else e2 = e1 ∧ if false then e1 else e2 = e2) : THM
=TEX
The required result can then be obtained directly using $rewrite_conv$:
=SML
rewrite_conv [if_then_else_thm] ⓩif 2>1 then 1 else 0⌝;
=GFT ProofPower output
val it = ⊢ if 2 > 1 then 1 else 0 = 1 : THM
=TEX
Adding $if_then_else_thm$ to any rewrite will result in elimination of conditionals.

\end{enumerate}

\subsection{Consistency Proofs}

Set the flags appropriately:

% context setting point 9

=SML
repeat drop_main_goal;
open_theory "z_exercises_3";
set_pc "z_library";
set_flags [("z_type_check_only", false), ("z_use_axioms", false)];
=TEX
Now define the required global variable:
ⓈZAX
num:ℕ
├
 4 ≤ num ≤ 50
■
Push the consistency goal, and tidy it up:
=SML
z_push_consistency_goal ⓩnum⌝;
=TEX
Supply a witness:
=SML
a (z_∃_tac ⓩ10⌝);
=TEX
Then complete the proof by rewriting:
=SML
a (rewrite_tac[]);
=TEX
Then save the consistency goal.
=SML
save_consistency_thm ⓩnum⌝ (pop_thm());
=TEX
Now set up the required goal:
=SML
set_goal([], ⓩ num ≥ 0⌝);
=TEX
Strip the specification of $num$ into the assumptions:
=SML
a (strip_asm_tac (z_get_spec ⓩnum⌝));
=GFT ProofPower output
...
(* *** Goal "" *** *)

(*  3 *)  ⓩ0 ≤ num⌝
(*  2 *)  ⓩ4 ≤ num⌝
(*  1 *)  ⓩnum ≤ 50⌝

(* ?⊢ *)  ⓩnum ≥ 0⌝
..
=TEX
Then rewrite the conclusion of the goal with the assumptions.
=SML
a (asm_rewrite_tac []);
=GFT ProofPower output
Tactic produced 0 subgoals:
Current and main goal achieved
...
=SML
save_pop_thm "ZP1";
=TEX

\subsection{Reasoning using Schema Definitions}

% context setting point 10

=SML
repeat drop_main_goal;
open_theory "z_exercises_3";
set_pc "z_library";
set_flags [("z_type_check_only", false), ("z_use_axioms", false)];
=TEX

\subsubsection{Simple Pre-conditions and Refinement}

Before beginning the proofs we extract the specifications for the relevant constants and bind them to an ML name:

=SML
val specs = (map z_get_spec [ⓩOP2⌝, ⓩOP⌝, ⓩSTATE⌝]);
=TEX

Conjecture 1:

First set the goal:
=SML
set_goal ([], ⓩ pre OP ⇔ i? ≥ 0⌝);
=GFT ProofPower output
...
(* ?⊢ *)  ⓩ(pre OP) ⇔ i? ≥ 0⌝
...
=TEX
Now rewrite with the specifications of $OP$ and $STATE$:
=SML
a (rewrite_tac (map z_get_spec [ⓩOP⌝, ⓩSTATE⌝]));
=GFT ProofPower output
...
(* ?⊢ *)  ⓩ(∃ r' : 𝕌 ⦁ true) ∧ 0 ≤ i? ⇔ 0 ≤ i?⌝
...
=SML
a (REPEAT strip_tac);
=GFT ProofPower output
...
(*  1 *)  ⓩ0 ≤ i?⌝

(* ?⊢ *)  ⓩ∃ r' : 𝕌 ⦁ true⌝
=SML
a (z_∃_tac ⓩx⌝);
=GFT ProofPower output
...
(* ?⊢ *)  ⓩx ∈ 𝕌 ∧ true ∧ true⌝
...
=SML
a contr_tac;
save_pop_thm "ZP2";
=GFT ProofPower output
Tactic produced 0 subgoals:
Current and main goal achieved
...
=TEX

Conjecture 2:

=SML
save_thm ("ZP3", (prove_rule specs
	ⓩ (pre OP ⇒ pre OP2) ∧ (pre OP ∧ OP2 ⇒ OP)⌝));
=TEX

=GFT ProofPower output
val it = ⊢ ((pre OP) ⇒ (pre OP2)) ∧ ((pre OP) ∧ OP2 ⇒ OP) : THM
=TEX

\subsubsection{The Vending Machine}

=SML
repeat drop_main_goal;
open_theory "z_exercises_3";
set_pc "z_library";
set_flags [("z_type_check_only", false), ("z_use_axioms", true)];
=TEX

ⓈZAX
│	price :ℕ
■
┌VMSTATE────────────────
│	stock, takings :ℕ
└────────────────────
┌VM_operation─────────────
│	ΔVMSTATE;
│	cash_tendered?, cash_refunded! :ℕ;
│	bars_delivered! :ℕ
└─────────────────────
┌exact_cash───────────────────
│	cash_tendered? :ℕ
├──────────
│	cash_tendered? = price
└─────────────────────────
┌insufficient_cash──────────────
│	cash_tendered? :ℕ
├──────────
│	cash_tendered? < price
└─────────────────────────
┌some_stock───────────────────
│	stock :ℕ
├──────────
│	stock > 0
└─────────────────────────
┌VM_sale─────────────────────
│	VM_operation
├──────────
│	stock' = stock - 1;
│	bars_delivered! = 1;
│	cash_refunded! = cash_tendered? - price;
│	takings' = takings + price
└──────────────────────────
┌VM_nosale─────────────────
│	VM_operation
├──────────
│	stock' = stock;
│	bars_delivered! = 0;
│	cash_refunded! = cash_tendered?;
│	takings' = takings
└───────────────────────

ⓈZ
│	VM1 ≜ exact_cash ∧ some_stock ∧ VM_sale
■

ⓈZ
│	VM2 ≜ insufficient_cash ∧ VM_nosale
■

ⓈZ
│	VM3 ≜ VM1 ∨ VM2
■

Now for convenience we bind the various specifications to ML variables:
=SML
val [price, VMSTATE, VM_operation, exact_cash,
    insufficient_cash, some_stock, VM_sale,
    VM_nosale, VM1, VM2, VM3]
 = map z_get_spec [ⓩprice⌝,ⓩVMSTATE⌝,ⓩVM_operation⌝,ⓩexact_cash⌝,
    ⓩinsufficient_cash⌝,ⓩsome_stock⌝,ⓩVM_sale⌝,
    ⓩVM_nosale⌝,ⓩVM1⌝,ⓩVM2⌝,ⓩVM3⌝];
=TEX
We prove various preconditions (though these are not needed for the following correctness proofs).
First the pre-condition of $VM1$.
=SML
set_goal([],ⓩpre VM1 ⇔
	(0 < stock
	∧ cash_tendered? = price
	∧ 0 ≤ takings)⌝);
a (rewrite_tac [VM1, VM_sale, some_stock,
 VM_operation, VMSTATE, exact_cash]);
a (pure_rewrite_tac [z_get_spec ⓩ(_ ≤ _)⌝]);
a (rewrite_tac[]);
a (REPEAT z_strip_tac);
a (z_∃_tac ⓩ(
	bars_delivered! ≜ 1,
	cash_refunded! ≜ cash_tendered? + ~ price,
	stock' ≜ stock + ~ 1,
	takings' ≜ takings + price)⌝
   THEN rewrite_tac[]);
a (PC_T1 "z_library_ext" asm_rewrite_tac
   [rewrite_rule [] price]);
a (LEMMA_T ⓩstock + ~ 1 ≤ stock⌝ asm_tac THEN1 rewrite_tac[]);
a (all_fc_tac [z_≤_trans_thm]);
a (asm_rewrite_tac []);
a (strip_asm_tac (z_get_spec ⓩprice⌝));
a (all_fc_tac [z_ℕ_plus_thm]);
val pre_VM1_thm = save_pop_thm "pre_VM1_thm";
=TEX
Now we establish the precondition of VM2.
=SML
set_goal([], ⓩpre VM2 ⇔
	cash_tendered? < price
	∧ cash_tendered? ≥ 0
	∧ stock ≥ 0
	∧ takings ≥ 0⌝);
a (rewrite_tac [VM2, VM_nosale, VM_operation, VMSTATE, insufficient_cash]);
a (REPEAT z_strip_tac);
a (z_∃_tac ⓩ(
	bars_delivered! ≜ 0,
	cash_refunded! ≜ cash_tendered?,
	stock' ≜ stock,
	takings' ≜ takings)⌝
   THEN PC_T1 "z_library_ext" asm_rewrite_tac[]);
val pre_VM2_thm = save_pop_thm "pre_VM2_thm";
=TEX
We next establish the precondition of VM3.
The proof is simplified if the following result is established first:
=SML
set_goal([], ⓩpre (VM1 ∨ VM2) ⇔ pre VM1 ∨ pre VM2⌝);
a (prove_tac[]);
val VM1VM2_lemma = pop_thm();
=TEX

=SML
set_goal([],ⓩpre VM3 ⇔
	 0 < stock ∧ cash_tendered? = price ∧ 0 ≤ takings
             ∨ cash_tendered? < price
               ∧ 0 ≤ cash_tendered?
               ∧ 0 ≤ stock
               ∧ 0 ≤ takings⌝);
a (pure_rewrite_tac [VM3, VM1VM2_lemma, pre_VM1_thm, pre_VM2_thm]);
a (z_strip_tac
	THEN z_strip_tac
	THEN z_strip_tac
	THEN strip_asm_tac price
	THEN asm_rewrite_tac[]);
val pre_VM3_thm = save_pop_thm "pre_VM3_thm";
=TEX
Now we prove that VM3 is a correct refinement of VM1.

The results about preconditions are not particularly helpful here, since the top level structure of the specification suffices to obtain the result without detailed knowledge of the preconditions.
=SML
set_goal([], ⓩ¬ (insufficient_cash ∧ exact_cash)⌝);
a (rewrite_tac [insufficient_cash, exact_cash]);
=GFT ProofPower output
...
(* ?⊢ *)  ⓩ¬
           ((0 ≤ cash_tendered?
               ∧ cash_tendered? < price)
               ∧ 0 ≤ cash_tendered?
               ∧ cash_tendered? = price)⌝
...
=TEX
We eliminate the $<$ relation by rewriting with its specification.
However, the specification of $<$ contains other facts whose inverses are in the current proof context, so a simple rewrite with the specification loops.
$pure_rewrite_tac$ is therefore used.
=SML
a (pure_rewrite_tac [z_get_spec ⓩ(_<_)⌝]);
=GFT ProofPower output
(* ?⊢ *)  ⓩ¬
           ((0 ≤ cash_tendered?
               ∧ 0 ≤ price + ~ (cash_tendered? + 1))
               ∧ 0 ≤ cash_tendered?
               ∧ cash_tendered? = price)⌝
=TEX
The remaineder of the proof is a routine arithmetic manipulation.
=SML
a (rewrite_tac [z_minus_thm, z_plus_assoc_thm1]);
a (REPEAT_N 3 z_strip_tac THEN asm_rewrite_tac[]);
val cash_lemma = save_pop_thm "cash_lemma";
=TEX
Proving the correctness of the refinement is now straightforward.
=SML
set_goal([], ⓩ (pre VM1 ⇒ pre VM3) ∧ (pre VM1 ∧ VM3 ⇒ VM1)⌝);
a (rewrite_tac [VM1, VM2, VM3]);
=GFT ProofPower output
(* ?⊢ *)  ⓩ((∃ bars_delivered! : 𝕌;
                   cash_refunded! : 𝕌;
                   stock' : 𝕌;
                   takings' : 𝕌
                 ⦁ exact_cash ∧ some_stock ∧ VM_sale)
               ⇒ (∃ bars_delivered! : 𝕌;
                   cash_refunded! : 𝕌;
                   stock' : 𝕌;
                   takings' : 𝕌
                 ⦁ exact_cash ∧ some_stock ∧ VM_sale
                   ∨ insufficient_cash ∧ VM_nosale))
             ∧ ((∃ bars_delivered! : 𝕌;
                     cash_refunded! : 𝕌;
                     stock' : 𝕌;
                     takings' : 𝕌
                   ⦁ exact_cash ∧ some_stock ∧ VM_sale)
                 ∧ (exact_cash ∧ some_stock ∧ VM_sale
                   ∨ insufficient_cash ∧ VM_nosale)
               ⇒ exact_cash ∧ some_stock ∧ VM_sale)⌝
=SML
a (strip_asm_tac cash_lemma THEN asm_rewrite_tac[]);
=GFT ProofPower output
(*  1 *)  ⓩ¬ insufficient_cash⌝

(* ?⊢ *)  ⓩ(∃ bars_delivered! : 𝕌;
                   cash_refunded! : 𝕌;
                   stock' : 𝕌;
                   takings' : 𝕌
                 ⦁ exact_cash ∧ some_stock ∧ VM_sale)
               ∧ exact_cash
               ∧ some_stock
               ∧ VM_sale
             ⇒ exact_cash ∧ some_stock ∧ VM_sale⌝
=TEX
a (REPEAT z_strip_tac);
val VM3_refines_VM1 = save_pop_thm "VM3_refines_VM1";
=TEX

Next we express the requirement that a vending machine does not undercharge:

ⓈZAX
│	VM_ok : ℙ ℙ VM_operation
├────────────────
│	∀ vm : ℙ VM_operation⦁
│	vm ∈ VM_ok ⇔
│		(∀ VM_operation ⦁ vm ⇒
│		takings' - takings ≥ price * (stock - stock'))
■

Before using this definition we convert it into an unconditional rewrite.
=SML
val VM_ok = z_defn_simp_rule (z_get_spec ⓩVM_ok⌝);
=TEX
We now prove that VM3 is a VM_ok.
=SML
set_goal([], ⓩVM3 ∈ VM_ok⌝);
a (rewrite_tac [VM1,VM2,VM3,VM_ok,VM_sale,VM_nosale]);
=GFT ProofPower output
...
(* ?⊢ *)  ⓩ(exact_cash
                   ∧ some_stock
                   ∧ [VM_operation
                     | stock' = stock + ~ 1
                       ∧ bars_delivered! = 1
                       ∧ cash_refunded! = cash_tendered? + ~ price
                       ∧ takings' = takings + price]
                 ∨ insufficient_cash
                   ∧ [VM_operation
                     | stock' = stock
                       ∧ bars_delivered! = 0
                       ∧ cash_refunded! = cash_tendered?
                       ∧ takings' = takings])
                 ⊆ VM_operation
             ∧ (∀ VM_operation
               ⦁ exact_cash
                     ∧ some_stock
                     ∧ VM_operation
                     ∧ stock' = stock + ~ 1
                     ∧ bars_delivered! = 1
                     ∧ cash_refunded! = cash_tendered? + ~ price
                     ∧ takings' = takings + price
                   ∨ insufficient_cash
                     ∧ VM_operation
                     ∧ stock' = stock
                     ∧ bars_delivered! = 0
                     ∧ cash_refunded! = cash_tendered?
                     ∧ takings' = takings
                 ⇒ price * (stock + ~ stock') ≤ takings' + ~ takings)⌝
...
=TEX
There are a lot of propositional logic (or related schema calculus) operators here which can be simplified by stripping.
The subset sign will need to be treated extensionally, so proof context $z_library_ext$ is probably appropriate.
It is also clear that several equations will arise in the assumptions, and therefore likely that rewriting with the assumptions will be a good idea, so:
=SML
a (PC_T "z_library_ext" (REPEAT z_strip_tac) THEN asm_rewrite_tac[]);
=TEX
Which considerably simplified the problem:
=GFT ProofPower output
...
(*  7 *)  ⓩVM_operation⌝
(*  6 *)  ⓩexact_cash⌝
(*  5 *)  ⓩsome_stock⌝
(*  4 *)  ⓩstock' = stock + ~ 1⌝
(*  3 *)  ⓩbars_delivered! = 1⌝
(*  2 *)  ⓩcash_refunded! = cash_tendered? + ~ price⌝
(*  1 *)  ⓩtakings' = takings + price⌝

(* ?⊢ *)  ⓩprice * (stock + ~ (stock + ~ 1)) ≤ (takings + price) + ~ takings⌝
...
=TEX
To solve this little arithmetic problem we move
=INLINEFT
ⓩ~ takings⌝
=TEX
\ left to place it next to $takings$:
=SML
a (rewrite_tac [z_∀_elim ⓩ~ takings⌝ z_plus_order_thm]);
=GFT ProofPower output
...
(* ?⊢ *)  ⓩprice * (stock + ~ (stock + ~ 1)) ≤ ~ takings + takings + price⌝
...
=TEX
Pushing in the minus sign and associating the additions to the left will result in the goal being proved using the cancellation results built into our current proof context.
=SML
a (rewrite_tac [z_minus_thm, z_plus_assoc_thm1]);
val VM3_ok_thm = save_pop_thm "VM3_ok_thm";
=TEX

\section{The Z ToolKit}

\subsection{Sets}

All of the examples in this theory can be proven automatically by the system.

First we set up an appropriate context:

% context setting point 11

=SML
repeat drop_main_goal;
open_theory "z_exercises_4";
set_pc "z_sets_ext";
=TEX

\subsubsection{Results Provable by Stripping}

We display one case partly expanded out:
=GFT SML
set_goal([],ⓩa ∩ (b \ c) = a ∩ b \ c⌝);
a z_strip_tac;
=GFT ProofPower output
(* ?⊢ *)  ⓩ∀ x1 : 𝕌 ⦁ x1 ∈ a ∩ (b \ c) ⇔ x1 ∈ a ∩ b \ c⌝
=GFT SML
a z_strip_tac;
=GFT ProofPower output
(* ?⊢ *)  ⓩx1 ∈ 𝕌 ∧ true ⇒ (x1 ∈ a ∩ (b \ c) ⇔ x1 ∈ a ∩ b \ c)⌝
=TEX
continuing only using $z_strip_tac$ (but omitting the display of this) as follows:
=GFT ProofPower output
(* ?⊢ *)  ⓩx1 ∈ a ∩ (b \ c) ⇔ x1 ∈ a ∩ b \ c⌝
=TEX
=GFT ProofPower output
(* ?⊢ *)  ⓩ(x1 ∈ a ∩ (b \ c) ⇒ x1 ∈ a ∩ b \ c)
             ∧ (x1 ∈ a ∩ b \ c ⇒ x1 ∈ a ∩ (b \ c))⌝
=TEX
=GFT ProofPower output
(* *** Goal "2" *** *)
(* ?⊢ *)  ⓩx1 ∈ a ∩ b \ c ⇒ x1 ∈ a ∩ (b \ c)⌝

(* *** Goal "1" *** *)
(* ?⊢ *)  ⓩx1 ∈ a ∩ (b \ c) ⇒ x1 ∈ a ∩ b \ c⌝
=TEX
=GFT ProofPower output
(* *** Goal "1" *** *)
(*  3 *)  ⓩx1 ∈ a⌝
(*  2 *)  ⓩx1 ∈ b⌝
(*  1 *)  ⓩ¬ x1 ∈ c⌝

(* ?⊢ *)  ⓩx1 ∈ a ∩ b \ c⌝
=TEX
=GFT ProofPower output
...
(* ?⊢ *)  ⓩx1 ∈ a ∩ b ∧ x1 ∉ c⌝
=TEX
=GFT ProofPower output
(* *** Goal "1.2" *** *)
(*  3 *)  ⓩx1 ∈ a⌝
(*  2 *)  ⓩx1 ∈ b⌝
(*  1 *)  ⓩ¬ x1 ∈ c⌝

(* ?⊢ *)  ⓩx1 ∉ c⌝

(* *** Goal "1.1" *** *)
(*  3 *)  ⓩx1 ∈ a⌝
(*  2 *)  ⓩx1 ∈ b⌝
(*  1 *)  ⓩ¬ x1 ∈ c⌝

(* ?⊢ *)  ⓩx1 ∈ a ∩ b⌝
=TEX
=GFT ProofPower output
(* *** Goal "1.1" *** *)
(*  3 *)  ⓩx1 ∈ a⌝
(*  2 *)  ⓩx1 ∈ b⌝
(*  1 *)  ⓩ¬ x1 ∈ c⌝

(* ?⊢ *)  ⓩx1 ∈ a ∧ x1 ∈ b⌝
=TEX
=GFT ProofPower output
(* *** Goal "1.1.2" *** *)
(*  3 *)  ⓩx1 ∈ a⌝
(*  2 *)  ⓩx1 ∈ b⌝
(*  1 *)  ⓩ¬ x1 ∈ c⌝

(* ?⊢ *)  ⓩx1 ∈ b⌝

(* *** Goal "1.1.1" *** *)
(*  3 *)  ⓩx1 ∈ a⌝
(*  2 *)  ⓩx1 ∈ b⌝
(*  1 *)  ⓩ¬ x1 ∈ c⌝

(* ?⊢ *)  ⓩx1 ∈ a⌝
=TEX
=GFT ProofPower output
Tactic produced 0 subgoals:
Current goal achieved, next goal is:

(* *** Goal "1.1.2" *** *)
...
=TEX
=GFT ProofPower output
Tactic produced 0 subgoals:
Current goal achieved, next goal is:

(* *** Goal "1.2" *** *)
...
=TEX
=GFT ProofPower output
...
(* ?⊢ *)  ⓩ¬ x1 ∈ c⌝
=TEX
=GFT ProofPower output
Tactic produced 0 subgoals:
Current goal achieved, next goal is:

(* *** Goal "2" *** *)

(* ?⊢ *)  ⓩx1 ∈ a ∩ b \ c ⇒ x1 ∈ a ∩ (b \ c)⌝
...
=TEX
Goal 2 being similar to goal 1 we complete its proof in one step:
=GFT SML
a (REPEAT z_strip_tac);
=GFT ProofPower output
Tactic produced 0 subgoals:
Current and main goal achieved
=TEX
The following groups of exercises are provable in exactly the same manner.
=SML
map prove_and_store Z1;
map prove_and_store Z2;
map prove_and_store Z3;
map prove_and_store Z3b;
=TEX

\subsection{Relations}


% context-setting point 12

=SML
repeat drop_main_goal;
open_theory "z_exercises_4";
set_pc "z_rel_ext";
=TEX
The following simple example shows how stripping followed by forward chaining often suffices for proofs in this theory.
=SML
set_goal([], ⓩP ⨾ Q ⨾ R = (P ⨾ Q) ⨾ R⌝);
a contr_tac;
=GFT ProofPower output
(* *** Goal "2" *** *)

(*  4 *)  ⓩ(x1, y') ∈ P⌝
(*  3 *)  ⓩ(y', y) ∈ Q⌝
(*  2 *)  ⓩ(y, x2) ∈ R⌝
(*  1 *)  ⓩ∀ y : 𝕌 ⦁ ¬ ((x1, y) ∈ P ∧ (y, x2) ∈ Q ⨾ R)⌝

(* ?⊢ *)  ⓩfalse⌝


(* *** Goal "1" *** *)

(*  4 *)  ⓩ(x1, y) ∈ P⌝
(*  3 *)  ⓩ(y, y') ∈ Q⌝
(*  2 *)  ⓩ(y', x2) ∈ R⌝
(*  1 *)  ⓩ∀ y : 𝕌 ⦁ ¬ ((x1, y) ∈ P ⨾ Q ∧ (y, x2) ∈ R)⌝

(* ?⊢ *)  ⓩfalse⌝
=TEX
The ``implications'' in the assumptions of these subgoals are well buried, but are nevertheless uncovered by the forward chaining facilities.
=SML
a (all_asm_fc_tac[]);
=GFT ProofPower output
Tactic produced 0 subgoals:
Current goal achieved, next goal is:
...
=SML
a (all_asm_fc_tac[]);
pop_thm();
=GFT ProofPower output
Tactic produced 0 subgoals:
Current and main goal achieved
...
val it = ⊢ P ⨾ Q ⨾ R = (P ⨾ Q) ⨾ R : THM
...
=TEX
Many of the exercises are therefore proven automatically as follows.
=SML
map prove_and_store Z4;
map prove_and_store Z5;
=TEX

=SML
map prove_and_store Z5b;
=TEX
=SML
(* "Z5c.1" *)
set_goal([], ⓩ[X,Y,Z] (∀x:𝕌;g:𝕌⦁ g ∈ X ⇸ Y ∧ x ∈ dom g ⇒ (x, g x) ∈ g)⌝);
a (REPEAT z_strip_tac);
a (POP_ASM_T (PC_T1 "z_library_ext" strip_asm_tac));
a (all_fc_tac [z_fun_app_clauses]);
a (asm_rewrite_tac[]);
val Z5c1 = save_pop_thm "Z5c.1";
=TEX
The following proof make use of the previous result (Z5c1).
=SML
(* "Z5c.2" *)
set_goal([], ⓩ[X,Y,Z] x ∈ dom g ∧ g x ∈ dom f ∧ g ∈ X ⇸ Y
	∧ f ∈ Y ⇸ Z ⇒ (f ∘ g)(x) = f(g(x))⌝);
set_pc "z_library";
a (REPEAT z_strip_tac);
a(z_app_eq_tac);
a (PC_T1 "z_library_ext" rewrite_tac[]);
a (REPEAT z_strip_tac);
a (lemma_tac ⓩg x = y⌝);
(* *** Goal "1.1" *** *)
a (all_fc_tac [z_fun_app_clauses]);
(* *** Goal "1.2" *** *)
a (all_fc_tac [z_fun_app_clauses]);
a (asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a (z_∃_tac ⓩg x⌝);
a (REPEAT z_strip_tac);
(* *** Goal "2.1" *** *)
a (all_fc_tac [Z5c1]);
(* *** Goal "2.2" *** *)
a (all_fc_tac [Z5c1]);
save_pop_thm("Z5c.2");
=TEX
\vfill
=SML
set_pc "z_rel_ext";
map prove_and_store Z6;
map prove_and_store Z6b;
map prove_and_store Z7;
map prove_and_store Z8;
map prove_and_store Z8b;
map prove_and_store Z9;
=TEX
\vfill

=SML
setlg "Z9b.1" Z9b;
a(prove_tac[z_∈_first_thm]);
(* *** Goal "1" *** *)
a(contr_tac);
a(z_spec_nth_asm_tac 1 ⓩ(x ≜ (x1, y))⌝);
a(swap_nth_asm_concl_tac 1);
a(rewrite_tac[]);
(* *** Goal "2" *** *)
a(contr_tac);
a(z_spec_nth_asm_tac 1 ⓩ(y ≜ (x.2))⌝);
a(all_var_elim_asm_tac1);
a(swap_nth_asm_concl_tac 1);
a(conv_tac(ONCE_MAP_C z_tuple_intro_conv));
a(asm_rewrite_tac[]);
save_pop_thm "Z9b.1";
=TEX
\vfill
=SML
setlg "Z9b.2" Z9b;
a(prove_tac[z_∈_second_thm]);
(* *** Goal "1" *** *)
a(contr_tac);
a(z_spec_nth_asm_tac 1 ⓩ(x ≜ (x, x1))⌝);
a(swap_nth_asm_concl_tac 1);
a(rewrite_tac[]);
(* *** Goal "2" *** *)
a(contr_tac);
a(z_spec_nth_asm_tac 1 ⓩ(x ≜ (x.1))⌝);
a(all_var_elim_asm_tac1);
a(swap_nth_asm_concl_tac 1);
a(conv_tac(ONCE_MAP_C z_tuple_intro_conv));
a (asm_rewrite_tac[]);
save_pop_thm "Z9b.2";
=TEX
\vfill
=SML
map prove_and_store Z10;
=TEX

=SML
setlg "Z10b.1" Z10b;
a(contr_tac);
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(y ≜ y)⌝);
(* *** Goal "2" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(y ≜ y)⌝);
(* *** Goal "3" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(y ≜ y)⌝);
a(z_spec_nth_asm_tac 3 ⓩ(y ≜ y')⌝);
(* *** Goal "4" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(y ≜ y)⌝);
save_pop_thm "Z10b.1";
=TEX


=SML
set_pc "z_library_ext";
setlg "Z10b.2" Z10b;
a (REPEAT strip_tac);
a(z_app_eq_tac);
a(z_spec_nth_asm_tac 6 ⓩ(x1 ≜ x,x2 ≜ y)⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 9 ⓩ(x1 ≜ x,x2 ≜ f_a)⌝);
a(z_app_eq_tac);
a(REPEAT strip_tac);
a(z_spec_nth_asm_tac 11 ⓩ(x1 ≜ x,x2 ≜ f_a')⌝);
a(z_spec_nth_asm_tac 11 ⓩ(x ≜ x, y1 ≜ f_a', y2 ≜ f_a)⌝);
(* *** Goal "2" *** *)
a(z_spec_nth_asm_tac 4 ⓩ(y ≜ f_a)⌝);
(* *** Goal "3" *** *)
a(z_spec_nth_asm_tac 4 ⓩ(y ≜ y')⌝);
(* *** Goal "4" *** *)
a(lemma_tac ⓩf x = y⌝);
(* *** Goal "4.1" *** *)
a(z_app_eq_tac);
a(REPEAT strip_tac);
a(z_spec_nth_asm_tac 9 ⓩ(x ≜ x, y1 ≜ f_a, y2 ≜ y)⌝);
a(z_spec_nth_asm_tac 11 ⓩ(x1 ≜ x,x2 ≜ f_a)⌝);
(* *** Goal "4.2" *** *)
a(swap_nth_asm_concl_tac 2);
a(asm_rewrite_tac[]);
save_pop_thm "Z10b.2";
=TEX


=SML
setlg "Z10b.3" Z10b;
a(contr_tac);
a(swap_nth_asm_concl_tac 1);
a(z_app_eq_tac);
a(contr_tac);
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 3 ⓩ(y ≜ y)⌝);
(* *** Goal "2" *** *)
a(swap_nth_asm_concl_tac 1);
a(z_app_eq_tac);
a(contr_tac);
a(z_spec_nth_asm_tac 6 ⓩ(x1 ≜ x,x2 ≜ f_a)⌝);
a(z_spec_nth_asm_tac 8 ⓩ(x1 ≜ x,x2 ≜ f_a')⌝);
a(z_spec_nth_asm_tac 8 ⓩ(x ≜ x, y1 ≜ f_a', y2 ≜ f_a)⌝);
(* *** Goal "3" *** *)
a(z_spec_nth_asm_tac 5 ⓩ(x1 ≜ x,x2 ≜ y)⌝);
a(lemma_tac ⓩg x = y⌝);
(* *** Goal "3.1" *** *)
a(z_app_eq_tac);
a(contr_tac);
a(z_spec_nth_asm_tac 9 ⓩ(x1 ≜ x,x2 ≜ f_a)⌝);
a(z_spec_nth_asm_tac 9 ⓩ(x ≜ x, y1 ≜ f_a, y2 ≜ y)⌝);
(* *** Goal "3.2" *** *)
a(swap_nth_asm_concl_tac 4);
a(asm_rewrite_tac[]);
(* *** Goal "4" *** *)
a(z_spec_nth_asm_tac 5 ⓩ(x1 ≜ x,x2 ≜ y)⌝);
a(lemma_tac ⓩg x = y⌝);
(* *** Goal "4.1" *** *)
a(z_app_eq_tac);
a(contr_tac);
a(z_spec_nth_asm_tac 9 ⓩ(x1 ≜ x,x2 ≜ f_a)⌝);
a(z_spec_nth_asm_tac 9 ⓩ(x ≜ x, y1 ≜ f_a, y2 ≜ y)⌝);
(* *** Goal "4.2" *** *)
a(swap_nth_asm_concl_tac 4);
a(asm_rewrite_tac[]);
save_pop_thm "Z10b.3";
=TEX


=SML
map prove_and_store Z11;
=TEX

=SML
setlg "Z11b.1" Z11b;
a contr_tac;
a(z_spec_nth_asm_tac 2 ⓩ(x1 ≜ x1, x2 ≜ x2)⌝);
a(z_spec_nth_asm_tac 6 ⓩ(S ≜ S)⌝);
(* *** Goal "1" *** *)
a(asm_fc_tac[]);
(* *** Goal "2" *** *)
a(z_spec_nth_asm_tac 6 ⓩ(x1 ≜ x1', x2 ≜ x2')⌝);
a(z_spec_nth_asm_tac 1 ⓩ(y ≜ y')⌝);
(* *** Goal "3" *** *)
a(z_spec_nth_asm_tac 6 ⓩ(S ≜ S)⌝);
(* *** Goal "3.1" *** *)
a(asm_fc_tac[]);
(* *** Goal "3.2" *** *)
a(z_spec_nth_asm_tac 7 ⓩ(x1 ≜ x1', x2 ≜ x2')⌝);
a(z_spec_nth_asm_tac 1 ⓩ(y ≜ y')⌝);
(* *** Goal "3.3" *** *)
a(z_spec_nth_asm_tac 3 ⓩ(y ≜ y)⌝);
save_pop_thm "Z11b.1";
=TEX

\subsection{Functions}

% context setting point 13

=SML
repeat drop_main_goal;
open_theory "z_exercises_4";
set_pc "z_fun_ext";
=TEX



=SML
setlg "Z12.1" Z12;
a (rewrite_tac[] THEN REPEAT strip_tac);
a (z_app_eq_tac THEN REPEAT strip_tac);
a (all_asm_fc_tac[]);
a (all_asm_fc_tac[]);
save_pop_thm "Z12.1";
=TEX
=SML
setlg "Z12.2" Z12;
a (rewrite_tac[] THEN REPEAT strip_tac);
a (z_app_eq_tac THEN REPEAT strip_tac);
a (all_asm_fc_tac[]);
a (all_asm_fc_tac[]);
save_pop_thm "Z12.2";
=TEX
=SML
setlg "Z12.3" Z12;
a (rewrite_tac[] THEN REPEAT strip_tac);
a (z_app_eq_tac THEN REPEAT strip_tac);
a (all_asm_fc_tac[]);
a (all_asm_fc_tac[]);
save_pop_thm "Z12.3";
=TEX
=SML
setlg "Z12.4" Z12;
a (rewrite_tac[] THEN REPEAT strip_tac);
a (z_app_eq_tac THEN REPEAT strip_tac);
a (all_asm_fc_tac[]);
a (all_asm_fc_tac[]);
save_pop_thm "Z12.4";
=TEX
=SML
setlg "Z12.5" Z12;
a (rewrite_tac[] THEN REPEAT strip_tac);
a (z_app_eq_tac THEN REPEAT strip_tac);
a (all_asm_fc_tac[]);
a (all_asm_fc_tac[]);
save_pop_thm "Z12.5";
=TEX
=SML
setlg "Z12.6" Z12;
a (rewrite_tac[] THEN REPEAT strip_tac);
a (z_app_eq_tac THEN REPEAT strip_tac);
a (all_asm_fc_tac[]);
a (all_asm_fc_tac[]);
save_pop_thm "Z12.6";
=TEX
=SML
setlg "Z12a.1" Z12a;
a (EVERY[
	rewrite_tac[],
	REPEAT strip_tac,
	z_app_eq_tac,
	REPEAT strip_tac,
	all_asm_fc_tac[],
	all_asm_fc_tac[]]);
save_pop_thm "Z12a.1";
=TEX

=SML
setlg "Z12b.1" Z12b;
a(contr_tac THEN all_asm_fc_tac[]);
a(all_asm_fc_tac[]);
a(z_spec_nth_asm_tac 3 ⓩ(y ≜ x)⌝);
a(swap_nth_asm_concl_tac 6);
a(asm_rewrite_tac[]);
save_pop_thm "z12b.1";
=TEX

=SML
setlg "Z12b.2" Z12b;
a (contr_tac THEN all_asm_fc_tac[]);
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 7 ⓩ(x1 ≜ y1, x2 ≜ y2)⌝);
(* *** Goal "1.1" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(y ≜ x)⌝);
(* *** Goal "1.2" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(y ≜ x)⌝);
(* *** Goal "1.3" *** *)
a(swap_nth_asm_concl_tac 1);
a(ALL_ASM_FC_T rewrite_tac [get_thm "-" "Z12a.1"]);
(* *** Goal "2" *** *)
a(lemma_tac ⓩy = f x1⌝);
(* *** Goal "2.1" *** *)
a(z_app_eq_tac);
a(contr_tac);
a(z_spec_nth_asm_tac 14 ⓩ(x1 ≜ x1, x2 ≜ f_a)⌝);
a(z_spec_nth_asm_tac 14 ⓩ(x ≜ x1, y1 ≜ f_a, y2 ≜ y)⌝);
(* *** Goal "2.2" *** *)
a(swap_nth_asm_concl_tac 9);
a(asm_rewrite_tac[]);
a(contr_tac);
a(z_spec_nth_asm_tac 13 ⓩ(x1 ≜ x1, x2 ≜ f x2)⌝);
a(z_spec_nth_asm_tac 11 ⓩ(x ≜ ⓩf x2⌝, y1 ≜ x1, y2 ≜ x2)⌝);
a(lemma_tac ⓩy' = f x2⌝);
(* *** Goal "2.2.1" *** *)
a(z_app_eq_tac);
a(contr_tac);
a(z_spec_nth_asm_tac 17 ⓩ(x1 ≜ x2, x2 ≜ f_a)⌝);
a(z_spec_nth_asm_tac 17 ⓩ(x ≜ x2, y1 ≜ f_a, y2 ≜ y')⌝);
(* *** Goal "2.2.2" *** *)
a(swap_nth_asm_concl_tac 12);
a(asm_rewrite_tac[]);
save_pop_thm "Z12b.2";
=TEX

No solutions for Z12.b3 to Z12b.7.



\subsection{Numbers and Finiteness}

% context setting point 14

=SML
repeat drop_main_goal;
open_theory "z_exercises_4";
set_pc "z_library";
set_flags [("z_type_check_only", false), ("z_use_axioms", true)];
=TEX
ⓈZAX
│	Σ : ℕ → ℕ
├───────────
│	∀n:ℕ⦁
│	Σ 0 = 0
│∧	Σ (n+1) = (n + 1) + Σ n
■

The second problem:

=SML
set_goal([],ⓩ ∀n: ℕ⦁ (Σ n) * 2 = n * (n+1)⌝);
=GFT ProofPower output
...
(* *** Goal "" *** *)

(* ?⊢ *)  ⓩ∀ n : ℕ ⦁ Σ n * 2 = n * (n + 1)⌝
...
=SML
a (strip_asm_tac (z_get_spec ⓩ(Σ)⌝));
=GFT ProofPower output
...
(*  2 *)  ⓩΣ ∈ ℕ → ℕ⌝
(*  1 *)  ⓩ∀ n : ℕ ⦁ Σ 0 = 0 ∧ Σ (n + 1) = (n + 1) + Σ n⌝

(* ?⊢ *)  ⓩ∀ n : ℕ ⦁ Σ n * 2 = n * (n + 1)⌝
...
=SML
a (z_strip_tac THEN PC_T1 "z_language" rewrite_tac[]);
=GFT ProofPower output
...
(*  2 *)  ⓩΣ ∈ ℕ → ℕ⌝
(*  1 *)  ⓩ∀ n : ℕ ⦁ Σ 0 = 0 ∧ Σ (n + 1) = (n + 1) + Σ n⌝

(* ?⊢ *)  ⓩn ∈ ℕ ⇒ Σ n * 2 = n * (n + 1)⌝
...
=SML
a z_ℕ_induction_tac;
=GFT ProofPower output
...
(* *** Goal "2" *** *)

(*  4 *)  ⓩΣ ∈ ℕ → ℕ⌝
(*  3 *)  ⓩ∀ n : ℕ ⦁ Σ 0 = 0 ∧ Σ (n + 1) = (n + 1) + Σ n⌝
(*  2 *)  ⓩ0 ≤ i⌝
(*  1 *)  ⓩΣ i * 2 = i * (i + 1)⌝

(* ?⊢ *)  ⓩΣ (i + 1) * 2 = (i + 1) * ((i + 1) + 1)⌝


(* *** Goal "1" *** *)

(*  2 *)  ⓩΣ ∈ ℕ → ℕ⌝
(*  1 *)  ⓩ∀ n : ℕ ⦁ Σ 0 = 0 ∧ Σ (n + 1) = (n + 1) + Σ n⌝

(* ?⊢ *)  ⓩΣ 0 * 2 = 0 * (0 + 1)⌝
=SML
(* *** Goal "1" *** *)
a (z_spec_nth_asm_tac 1 ⓩ0⌝
	THEN asm_rewrite_tac[]);
=GFT ProofPower output
...
Current goal achieved, next goal is:
...
=SML
(* *** Goal "2" *** *)
a (all_asm_fc_tac[]);
=GFT ProofPower output
...
(*  6 *)  ⓩΣ ∈ ℕ → ℕ⌝
(*  5 *)  ⓩ∀ n : ℕ ⦁ Σ 0 = 0 ∧ Σ (n + 1) = (n + 1) + Σ n⌝
(*  4 *)  ⓩ0 ≤ i⌝
(*  3 *)  ⓩΣ i * 2 = i * (i + 1)⌝
(*  2 *)  ⓩΣ 0 = 0⌝
(*  1 *)  ⓩΣ (i + 1) = (i + 1) + Σ i⌝

(* ?⊢ *)  ⓩΣ (i + 1) * 2 = (i + 1) * ((i + 1) + 1)⌝
=SML
a (asm_rewrite_tac[]);
=GFT ProofPower output
...
(* ?⊢ *)  ⓩ((i + 1) + Σ i) * 2 = (i + 1) * ((i + 1) + 1)⌝
...
=SML
a (asm_rewrite_tac[z_times_plus_distrib_thm]);
=GFT ProofPower output
...
(* ?⊢ *)  ⓩ(i * 2 + 2) + i * i + i = ((i * i + i) + i + 1) + i + 1⌝
...
=SML
a (rewrite_tac [z_∀_elim ⓩi*i⌝ z_plus_order_thm]);
=GFT ProofPower output
...
(* ?⊢ *)  ⓩ(i * 2 + 2) + i = (i + i + 1) + i + 1⌝
...
=SML
a (rewrite_tac [z_∀_elim ⓩi⌝ z_plus_order_thm]);
=GFT ProofPower output
...
(* ?⊢ *)  ⓩi * 2 + 2 = i + i + 2⌝
...
=SML
a (rewrite_tac[z_plus_assoc_thm1]);
=GFT ProofPower output
...
(* ?⊢ *)  ⓩi * 2 = i + i⌝
=SML
a (pure_rewrite_tac
	[prove_rule []ⓩ2 = 1 + 1⌝,
	z_times_plus_distrib_thm]);
=GFT ProofPower output
...
(* ?⊢ *)  ⓩi * 1 + i * 1 = i + i⌝
=SML
a (rewrite_tac[]);
=GFT ProofPower output
...
Current and main goal achieved
=SML
save_pop_thm "ZNum.1";
=TEX

The solution to the third problem of this section is:

% context setting point 15

=SML
repeat drop_main_goal;
open_theory "z_exercises_4";
set_pc "z_library_ext";
set_flags [("z_type_check_only", false), ("z_use_axioms", true)];

setlg "ZNum.2" ZNum;
=GFT ProofPower output
(* ?⊢ *)  ⓩ∀ x, y : ℤ ⦁ x ≤ y ⇒ 0 .. x ⊆ 0 .. y⌝
=TEX
First expand $..$.
=SML
a(rewrite_tac[z_get_spec ⓩ(_.._)⌝] THEN REPEAT strip_tac);
=GFT ProofPower output
...
(*  3 *)  ⓩx ≤ y⌝
(*  2 *)  ⓩ0 ≤ x1⌝
(*  1 *)  ⓩx1 ≤ x⌝

(* ?⊢ *)  ⓩx1 ≤ y⌝
...
=TEX
Then forward chain using transitivity of $≤$.
=SML
a(all_fc_tac[z_≤_trans_thm]);
=GFT ProofPower output
Tactic produced 0 subgoals:
Current and main goal achieved
=TEX
=SML
save_pop_thm "ZNum.2";
=TEX
The solution to the fourth problem of this section is:

=SML
setlg "ZNum.3" ZNum;
=GFT ProofPower output
...
(* ?⊢ *)  ⓩ∀ x, y : ℤ ⦁ ¬ x ≤ y ⇒ 0 .. y ⊆ 0 .. x - 1⌝
...
=TEX
First expand the definition of $..$.
=SML
a(rewrite_tac[z_get_spec ⓩ(_.._)⌝] THEN REPEAT strip_tac);
=GFT ProofPower output
...
(*  3 *)  ⓩy < x⌝
(*  2 *)  ⓩ0 ≤ x1⌝
(*  1 *)  ⓩx1 ≤ y⌝

(* ?⊢ *)  ⓩx1 ≤ x + ~ 1⌝
...
=TEX
Now forward chain on the assumptions using $z_≤_less_trans_thm$ to obtain $x1 < x$.
=SML
a(all_fc_tac[z_≤_less_trans_thm]);
=GFT ProofPower output
...
(*  1 *)  ⓩx1 < x⌝

(* ?⊢ *)  ⓩx1 ≤ x + ~ 1⌝
...
=TEX
Now it is necessary to expand the definition of $<$ in the last assumption.
$POP_ASM_T$ takes out the last assumption and feeds it into the $THM_TACTIC$ supplied to it.
In this case we rewrite the assumption with the specification of $<$ before passing it to $ante_tac$, which inserts in into the conclusion of the goal as the $ante$cedent of a new implication.
=SML
a(POP_ASM_T (ante_tac o pure_once_rewrite_rule[z_get_specⓩ(_<_)⌝]));
=GFT ProofPower output
...
(* ?⊢ *)  ⓩx1 + 1 ≤ x ⇒ x1 ≤ x + ~ 1⌝
...
=TEX
In the absence of support for linear arithmetic this obvious result must be proven by transforming the conclusion of the goal until the various built in cancellation laws apply.
First we move everything to the left hand side of the inequalities using $z_≤_≤_0_thm$.
=SML
a(once_rewrite_tac[z_≤_≤_0_thm]);
=GFT ProofPower output
...
(* ?⊢ *)  ⓩ(x1 + 1) + ~ x ≤ 0 ⇒ x1 + ~ (x + ~ 1) ≤ 0⌝
...
=TEX
Now we use $z_plus_order_thm$ to reorder the arithmetic expressions and $z_minus_thm$ to provide some cancellation results which have been omitted from the proof context.
=SML
a(rewrite_tac[z_∀_elim ⓩ~ x⌝ z_plus_order_thm, z_minus_thm]);
=GFT ProofPower output
...
Current and main goal achieved
...
=SML
save_pop_thm "ZNum.3";
=TEX

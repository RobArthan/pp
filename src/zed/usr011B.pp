=IGN
********************************************************************************
usr011B.doc: this file is part of the PPZed system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% usr011B.doc   ℤ $Date: 2002/10/17 16:26:32 $ $Revision: 1.12 $ $RCSfile: usr011B.doc,v $
% this should form a chapter of the document
=TEX

\section{Propositional Connectives}\label{PropositionalConnectives}

{\ftlmargin=0in\ftrmargin=0in

=GFT Z_TERM
	(* ⓩ true⌝ *)
	
	⦏ZTrue⦎
	
	(* ⓩ false⌝ *)
	
 |	⦏ZFalse⦎

	(* negation, e.g. ⓩ ¬ p⌝ *)
	
 |	⦏Z¬⦎		of TERM		(* predicate *)
 			
	(* conjunction, e.g. ⓩ p ∧ q⌝ *)
	
 |	⦏Z∧⦎		of TERM * TERM	(* predicates *)
 			
	(* disjunction, e.g. ⓩ p ∨ q⌝ *)
	
 |	⦏Z∨⦎		of TERM * TERM	(* predicates *)
 			
	(* implication, e.g. ⓩ p ⇒ q⌝ *)
	
 |	⦏Z⇒⦎		of TERM * TERM 	(* predicates *)
 			
	(* bi-implication, e.g. ⓩ p ⇔ q⌝ *)
	
 |	⦏Z⇔⦎		of TERM * TERM 	(* predicates *)
=TEX

}

\subsection{Propositional Reasoning in Z}\label{PropositionalReasoning}

The Z propositional connectives are mapped directly to the corresponding connective in HOL, and propositional reasoning in \ProductZ{} behaves therefore in a manner identical to propositional reasoning in \ProductHOL{}.

The behaviour is sensitive to the current proof context, but almost all the proof contexts behave in the same way for propositional reasoning.

A suitable context for propositional reasoning in Z is ``$z_language$'', and all other Z proof contexts contain the same material for propositional reasoning.

The main methods of proof are:

\begin{enumerate}
\item
Forward proof using elementary rules.
\item
Goal oriented proof by stripping.
\item
Goal oriented automatic proof.
\end{enumerate}

These methods are described and illustrated in each of the following subsections.

\subsubsection{Forward proof using elementary rules}

Forward propositional reasoning is rarely required in \ProductZ{} proofs.
The methods of forward proof are illustrated below showing the use of the following rules.

These are all rules which behave identically for \ProductHOL{} and \ProductZ{}.
In the case of Z however, it should be noted that they concern only the propositional connectives, and do not operate on the corresponding schema calculus operators.

{\ftlmargin=0.5in

\begin{description}
\item
$asm_rule$ - make or use an assumption

Given an arbitrary boolean term `$t$', infer `%
=INLINEFT
t ⊢ t
=TEX
', e.g.:
=SML
val x_eq_y = asm_rule ⓩx=y⌝;
=GFT ProofPower output
val x_eq_y = x = y ⊢ x = y : THM
=TEX
=SML
val eq_sym_thm = asm_rule ⓩx=y ⇒ y=x⌝;
=GFT ProofPower output
val eq_sym_thm = x = y ⇒ y = x ⊢ x = y ⇒ y = x : THM
=TEX

\item
$⇒_elim$ - use an implication (modus ponens)

Given a theorem of the form `%
=INLINEFT
Ψ ⊢ a ⇒ b
=TEX
' and one of the form `%
=INLINEFT
Υ ⊢ a
=TEX
' infer `%
=INLINEFT
Ψ, Υ ⊢ b
=TEX
', e.g:
=SML
val y_eq_x = ⇒_elim eq_sym_thm x_eq_y;
=GFT ProofPower output
val y_eq_x = x = y ⇒ y = x, x = y ⊢ y = x : THM
=TEX

\item
$⇒_intro$ - prove an implication

Given an arbitrary theorem `$Ψ ⊢ a$' possibly having $ⓩp1⌝$ as an assumption, infer the theorem `
=INLINEFT
Ψ\{ⓩp1⌝} ⊢ p1 ⇒ a$'.

=SML
val imp_thm = ⇒_intro ⓩx = y ⇒ y = x⌝ y_eq_x;
=GFT ProofPower output
val imp_thm = x = y ⊢ (x = y ⇒ y = x) ⇒ y = x : THM
=TEX
=SML
val imp_thm2 = ⇒_intro ⓩx = y⌝ imp_thm;
=GFT ProofPower output
val imp_thm2 = ⊢ x = y ⇒ (x = y ⇒ y = x) ⇒ y = x : THM
=TEX

\item
$strip_∧_rule$ - split up a conjunction

Given an arbitrary theorem whose conclusion is a conjunction, e.g. `$Ψ ⊢ a ∧ b ∧ c$' deliver a list of theorems, one for each conjunct separately: `$[Ψ ⊢ a, Ψ ⊢ b, Ψ ⊢ c]$'.

=SML
val [thm1,thm2,thm3] = strip_∧_rule (asm_rule ⓩa ∧ b ∧ c⌝);
=TEX
=GFT ProofPower output
val thm1 = a ∧ b ∧ c ⊢ a : THM
val thm2 = a ∧ b ∧ c ⊢ b : THM
val thm3 = a ∧ b ∧ c ⊢ c : THM
=TEX

\item
$list_∧_intro$ - create a conjunction from a list of theorems

Takes `$[Ψ ⊢ a, Ω ⊢ b, Υ ⊢ c]$' to `$Ψ,Ω,Υ ⊢ a ∧ b ∧ c$'.

=SML
val newconj = list_∧_intro [thm1,thm2,thm3];
=GFT ProofPower output
val newconj = a ∧ b ∧ c ⊢ a ∧ b ∧ c : THM
=TEX

\end{description}

}

\subsubsection{Proof by stripping}

In suitable proof contexts (which is almost all of them) proofs of propositional results can be completed using only ``stripping'' facilities.

In such cases a proof of the form:

{\ftlmargin=0.5in


=GFT SML
set_goal([],ⓩ conjecture ⌝);
a contr_tac;
=TEX

will suffice.

e.g., first set the goal:

=SML
set_goal([],ⓩ a ∧ b ⇒ b ∧ a⌝);
=GFT ProofPower output
Now 1 goal on the main goal stack

(* *** Goal "" *** *)

(* ?⊢ *)  ⓩa ∧ b ⇒ b ∧ a⌝
...
=TEX

Then initiate proof by contradiction by applying $contr_tac$.

=SML
a contr_tac;
=GFT ProofPower output
Tactic produced 0 subgoals:
Current and main goal achieved
val it = () : unit
=TEX

In this proof method the conjecture is negated and ``stripped'' into the assumptions, which process is sometimes sufficient to discharge the result without further intervention by the user.
In the case of pure propositional results this is always sufficient.

It is however instructive to undertake such proofs in a more piecemeal way, so as to get an understanding of how these stripping facilities work.

To achieve this a proof of the form:

=GFT SML
set_goal([],ⓩ conjecture ⌝);
a z_strip_tac;  (* repeat as often as necessary *)
=TEX
may be used.

e.g.:
=SML
set_goal([],ⓩ a ∧ b ⇒ b ∧ a⌝);
=GFT ProofPower output
Now 1 goal on the main goal stack

(* *** Goal "" *** *)

(* ?⊢ *)  ⓩa ∧ b ⇒ b ∧ a⌝
...
=TEX
=SML
a z_strip_tac;
=TEX
The current goal is an implication, which is dealt with by transferring the antecedent of the implication into the assumption list.
As it is added to the assumptions the antecedent, $ⓩa ∧ b⌝$, is completely stripped, which in this case results in it being split into two separate assumptions $ⓩa⌝$ and $ⓩb⌝$.
=GFT ProofPower output
Tactic produced 1 subgoal:

(* *** Goal "" *** *)

(*  2 *)  ⓩa⌝
(*  1 *)  ⓩb⌝

(* ?⊢ *)  ⓩb ∧ a⌝
...
=TEX
Now the conclusion of the current goal is a conjunction, and stripping results in two subgoals, one for each conjunct.
=SML
a z_strip_tac;
=GFT ProofPower output
Tactic produced 2 subgoals:

(* *** Goal "2" *** *)

(*  2 *)  ⓩa⌝
(*  1 *)  ⓩb⌝

(* ?⊢ *)  ⓩa⌝


(* *** Goal "1" *** *)

(*  2 *)  ⓩa⌝
(*  1 *)  ⓩb⌝

(* ?⊢ *)  ⓩb⌝
...
=TEX
Each of these subgoals has its conclusion among its assumptions.
If no other action is possible $z_strip_tac$ will check for this condition and will discharge the subgoal if it applies.
=SML
a z_strip_tac;
=GFT ProofPower output
Tactic produced 0 subgoals:
Current goal achieved, next goal is:

(* *** Goal "2" *** *)

(*  2 *)  ⓩa⌝
(*  1 *)  ⓩb⌝

(* ?⊢ *)  ⓩa⌝
...
=SML
a z_strip_tac;
=GFT ProofPower output
Tactic produced 0 subgoals:
Current and main goal achieved
val it = () : unit
=TEX

In such a proof, the conclusion of the current goal is stripped one step at a time.
Whenever an assumption is added to the list of assumptions in the current goal, this assumption is completely stripped.
If the original goal was completely well formed Z, (and the proof context is appropriate for reasoning in Z) then this stripping process should result only in subgoals which are also well formed Z.
If the original subgoal was true, so will be any subgoals obtained by this stripping process, so if an evidently false subgoal appears the original conjecture must have been false.

To get an idea of how the assumptions are being stripped a tactic is available which performs step-by-step stripping on new assumptions before they are taken out of the conclusion.

=GFT SML
set_goal([],ⓩ conjecture ⌝);
a step_strip_tac;  (* repeat as often as necessary *)
=TEX

e.g.:
=SML
set_goal([], ⓩ (a ∧ b ∧ (¬a ∨ ¬b)) ⇒ false⌝);
=GFT ProofPower output
Now 1 goal on the main goal stack

(* *** Goal "" *** *)

(* ?⊢ *)  ⓩa ∧ b ∧ (¬ a ∨ ¬ b) ⇒ false⌝
...
=TEX
If $z_strip_tac$ were used at this point the antecendent of the implication in the conclusion of the goal would be completely stripped into the assumptions, which would in fact solve the goal.

$step_strip_tac$, however, performs as much stripping as possible while the antecedent is still in place in the conclusion, creating new assumptions only when no further stripping is possible.

In this case the leftmost conjunct of the antecendent is considered completely stripped and is added to the assumptions, while the remaining conjuncts are left for further attention.

=SML
a step_strip_tac;
=GFT ProofPower output
Tactic produced 1 subgoal:

(* *** Goal "" *** *)

(*  1 *)  ⓩa⌝

(* ?⊢ *)  ⓩb ∧ (¬ a ∨ ¬ b) ⇒ false⌝
...
=SML
a step_strip_tac;
=TEX
The leftmost conjunct of the antecedent is again transferred to the assumptions.
=GFT ProofPower output
Tactic produced 1 subgoal:

(* *** Goal "" *** *)

(*  2 *)  ⓩa⌝
(*  1 *)  ⓩb⌝

(* ?⊢ *)  ⓩ¬ a ∨ ¬ b ⇒ false⌝
...
=TEX
The antecedent is now a disjunction.
Stripping a disjunction into the assumptions gives rise to a case split.
=SML
a step_strip_tac;
=GFT ProofPower output
Tactic produced 2 subgoals:

(* *** Goal "2" *** *)

(*  2 *)  ⓩa⌝
(*  1 *)  ⓩb⌝

(* ?⊢ *)  ⓩ¬ b ⇒ false⌝


(* *** Goal "1" *** *)

(*  2 *)  ⓩa⌝
(*  1 *)  ⓩb⌝

(* ?⊢ *)  ⓩ¬ a ⇒ false⌝
...
=TEX
The next step would attempt to strip
=INLINEFT
ⓩ¬ a⌝
=TEX
\ into the assumptions.
However, $ⓩa⌝$ is already in the assumptions and this results in the discharge of the subgoal.
=TEX
=SML
a step_strip_tac;
=GFT ProofPower output
Tactic produced 0 subgoals:
Current goal achieved, next goal is:

(* *** Goal "2" *** *)

(*  2 *)  ⓩa⌝
(*  1 *)  ⓩb⌝

(* ?⊢ *)  ⓩ¬ b ⇒ false⌝
...
=SML
a step_strip_tac;
=GFT ProofPower output
Tactic produced 0 subgoals:
Current and main goal achieved
val it = () : unit
=TEX

\subsubsection{Automatic Proof}

An automatic proof procedure is provided for each proof context which is usually capable of solving results reducible to the pure propositional calculus.
Even when it fails it may have resulted in more simplification than would be obtained by other methods.

=GFT SML
set_goal([],ⓩ conjecture⌝);
a (prove_tac[]); (* once only *)
=TEX

e.g.:

=SML
set_goal([],ⓩ (a ∧ b ∧ (¬a ∨ ¬b)) ⇒ false⌝);
=GFT ProofPower output
Now 1 goal on the main goal stack

(* *** Goal "" *** *)

(* ?⊢ *)  ⓩa ∧ b ∧ (¬ a ∨ ¬ b) ⇒ false⌝
...
=SML
a (prove_tac[]);
=GFT ProofPower output
Tactic produced 0 subgoals:
Current and main goal achieved
val it = () : unit
=TEX

If subgoals are left by $prove_tac$ then they will not normally be further progressed by repeated application of the tactic.

$prove_tac$ should be used only when the current goal has no assumptions, or where it is expected that $prove_tac$ can completely discharge the current goal without making use of the assumptions.

If the assumptions must be used to obtain the proof, or if there are assumptions and $prove_tac$ is likely to leave some outstanding subgoals, then instead of $prove_tac$, $asm_prove_tac$ should be used:

=GFT SML
a (asm_prove_tac[]); (* once only *)
=TEX

e.g.:
=SML
set_goal([ⓩ¬a⌝,ⓩ¬b⌝], ⓩ ¬(a ∨ b)⌝);
=GFT ProofPower output
Now 1 goal on the main goal stack

(* *** Goal "" *** *)

(*  2 *)  ⓩ¬ b⌝
(*  1 *)  ⓩ¬ a⌝

(* ?⊢ *)  ⓩ¬ (a ∨ b)⌝
...
=SML
a (asm_prove_tac[]);
=GFT ProofPower output
Tactic produced 0 subgoals:
Current and main goal achieved
val it = () : unit
=TEX

If $prove_tac$ is used in these circumstances then it may fail.

If the conjecture to be proven can be completely proved by one application of $prove_tac$ then invocation of the subgoal package is unnecessary.
$prove_rule$ may be used to obtain the result as follows:

=SML
prove_rule [] ⓩ (a ∧ b ∧ (¬a ∨ ¬b)) ⇒ false⌝;
=GFT ProofPower output
val it = ⊢ a ∧ b ∧ (¬ a ∨ ¬ b) ⇒ false : THM
=TEX

}%\ftlmargin

\section{Predicates}

{\ftlmargin=0in\ftrmargin=0in
=GFT Z_TERM
	(* equation, e.g. ⓩ a = b⌝ *)
	
 |	⦏ZEq⦎		of TERM * TERM	(* expressions *)
 		
	(* membership, e.g. ⓩ a ∈ b⌝ *)
	
 |	⦏Z∈⦎		of TERM * TERM	(* expressions *)

	(* schema predicate, e.g. ⓩ Π (File ')⌝ *)
	
 |	⦏ZSchemaPred⦎	of TERM	(* schema expression *)
 				* string	(* decoration *)
=TEX
}

At bottom there are just two kinds of predicate in Z, equations and membership assertions, though there are a variety of ways in which these are presented in the concrete syntax.

Equations always appear in a direct literal way, but membership statements come in a variety of concrete forms.

Where a rel fixity paragraph has been entered the actual membership sign is omitted, and the set may be ``applied'' to its member as if it were a propositional function or predicate using prefix, postfix or ``fancyfix'' notation, according to the details in the fixity declaration.

Finally schemas as predicates are effectively abbreviations of assertions about the membership of theta terms in the schema expressions, the theta terms themselves being abbreviations of binding displays.

\subsection{Equations}

\subsubsection{Syntax}

{\ftlmargin=0in\ftrmargin=0in
=GFT Z_TERM
	(* equation, e.g. ⓩ a = b⌝ *)
	
 |	⦏ZEq⦎		of TERM * TERM	(* expressions *)
=TEX
}

\subsubsection{Proof Support}

Equations are exploited in proof usually by the use of the rewriting facilities, which enable equations to be used to transform terms.

Equations are established in two main ways:

\begin{itemize}
\item
By rewriting either or both sides of the equation until they are identical.
\item
By using identity criteria specific to the type of the expressions equated.
\end{itemize}

In the former case the main resource deployed will be the standard rewriting facilities.

The latter case can be further divided into cases according to the type of the expression.
Types of expressions in Z may be classified according to their outer type constructor into the following categories:

\begin{enumerate}
\item
Elements of Given sets
\item
Sets
\item
Tuples
\item
Bindings
\item
Elements of Free Types
\end{enumerate}

Elements of given sets, unless further constraints are added, admit no opportunities for proving equations other than by rewriting the two sides of the equation, since nothing is known about the elements of a given set.

Sets may be proven equal using the principle of extensionality, that two sets are equal if and only if they have the same members.
This principle is built in to the proof context $z_language_ext$:

=SML
PC_C1 "z_language_ext" rewrite_conv[] ⓩ x = y ⦂ ℙ 𝕌⌝;
=GFT ProofPower output
val it = ⊢ x = y ⇔ (∀ x1 : 𝕌 ⦁ x1 ∈ x ⇔ x1 ∈ y) : THM
=TEX

Note the need for the type cast here to ensure that the free variables have power set types; otherwise the principle of extensionality could not be applied.
Normally the cast would not be necessary because the context would be sufficient to determine the type of the free variables.

Tuples are proven equal with an analogous principle, viz. that two tuples are equal if and only if each of their components is equal.
The well typing rules will ensure that they have the same number and type of components.
This principle, for use with tuple displays only, is built into the proof context $z_language$.

=SML
rewrite_conv[] ⓩ (x, y) = (v, w)⌝;
=IGN
PC_C1 "z_language_ext" rewrite_conv[] ⓩ x = y ⦂ (𝕌 × 𝕌)⌝; (* doesn't work *)
z_tuple_lang_eq_conv
(MAP_C z_tuple_intro_conv)
=GFT ProofPower output
val it = ⊢ (x, y) = (v, w) ⇔ x = v ∧ y = w : THM
=TEX

Bindings are similar to tuples, being labelled rather than unlabelled records.
Two bindings are equal iff each of their respective components are equal.
The type system ensures that the names and types of the components are the same.
This principle is supported by $z_binding_eq_conv1$, which is built into the proof context ``z_language'' for binding displays.

=SML
rewrite_conv[] ⓩ(cn1 ≜ x, cn2 ≜ y) = (cn1 ≜ v, cn2 ≜ w)⌝;
=GFT ProofPower output
val it = ⊢ (cn1 ≜ x, cn2 ≜ y) = (cn1 ≜ v, cn2 ≜ w)
			⇔ x = v ∧ y = w : THM
=TEX

=SML
z_binding_eq_conv1 ⓩx = y ⦂ [cn1: 𝕌; cn2: 𝕌]⌝;
=GFT ProofPower output
val it = ⊢ x = y ⇔ x.cn1 = y.cn1 ∧ x.cn2 = y.cn2 : THM
=TEX

Two elements of the same free type are equal under the following conditions:

\begin{enumerate}
\item
They are formed using the same constructor (the ranges of the constructors are disjoint)
\item
Where the constructor is a function the values supplied to this function are the same (the constructor functions are injections).
\end{enumerate}

An equality principle may be derived from the axiom which introduces the free type.
Automatic derivation of this principle is not yet supported.

\subsection{Membership Assertions}

\subsubsection{Syntax}

{\ftlmargin=0in\ftrmargin=0in
=GFT Z_TERM
	(* membership, e.g. ⓩ a ∈ b⌝ *)
	
 |	⦏Z∈⦎		of TERM * TERM	(* expressions *)
=TEX
}

The forms of concrete syntax are varied by the use of $rel\ fixity$ paragraphs (see section \ref{FixityDeclarations}).

The following examples illustrate these variations.

Without a {\it rel fixity} paragraph in force $prerel$ in the example below is treated as a local variable denoting a function, and the quoted term as a function application.

=SML
dest_z_term ⓩprerel x⌝;
=GFT ProofPower output
val it = ZApp (ⓩprerel⌝, ⓩx⌝) : Z_TERM
=TEX

The following paragraph attaches prefix status to the name $prerel$ (even though this has not been declared as a global variable).

ⓈZ
rel ⦏prerel _⦎
■

Which causes the same Z quotation to be interpreted as a set membership assertion:

=SML
dest_z_term ⓩprerel x⌝;
=GFT ProofPower output
val it = Z∈ (ⓩx⌝, ⓩ(prerel _)⌝) : Z_TERM
=TEX

Note that to parse the term consisting only of the local variable $prerel$ once the fixity clause has been introduced, the name must be supplied with an underscore and enclosed in brackets.

ⓈZ
rel ⦏_ postrel⦎
■

=SML
dest_z_term ⓩx postrel⌝;
=GFT ProofPower output
val it = Z∈ (ⓩx⌝, ⓩ(_ postrel)⌝) : Z_TERM
=TEX

ⓈZ
rel ⦏_ infixrel _⦎
■

=SML
dest_z_term ⓩx infixrel y⌝;
=GFT ProofPower output
val it = Z∈ (ⓩ(x, y)⌝, ⓩ(_ infixrel _)⌝) : Z_TERM
=TEX

The above example shows that where there is more than one argument these are made into a tuple.

ⓈZ
rel ⦏rellb ... relrb⦎
■
=SML
dest_z_term ⓩrellb 1,2,3 relrb⌝;
=GFT ProofPower output
val it = Z∈ (ⓩ⟨1, 2, 3⟩⌝, ⓩ(rellb ... relrb)⌝) : Z_TERM
=TEX

The use of ``...'' in a rel fixity clause indicates a position at which a sequence display is required with the sequence brackets omitted.
This is interpreted as asserting the membership of the sequence in the set.

\subsubsection{Proof Support}

Reasoning about membership is in general specific to the construct of which membership is asserted.
Throughout this tutorial constructs in the Z language which yield sets are normally characterised by identifying the conditions for membership of the resulting set.
Each of these characterisations provides a method for proving a result about set membership from more elementary results (possibly also about membership, but in this case usually of simpler expressions).

A general convention is adopted for the naming of conversions concerning set membership, and they may therefore be sought in the keyword index for the Reference Manual.
Such conversions have names of the form $z_∈_something_conv$, where $something$ is the name of the kind of construct of which membership is asserted.
In the case of constructs which form part of the Z language most of these conversion are built into the proof context ``$z_language$'' and so their names need not be invoked or remembered for most purposes.
Where global variables are defined in the Z ToolKit which are functions yielding sets, then the relevant theory will normally contain a theorem giving a characterisation by membership of the resulting sets, and a proof context will normally be supplied which invokes this characterisation.

\subsection{Schemas as Predicates}

\subsubsection{Syntax}

An arbitrary expression denoting a set of bindings, together with an optional decoration, may be used as a predicate.

{\ftlmargin=0in\ftrmargin=0in
=GFT Z_TERM
	(* schema predicate, e.g. ⓩ Π (File ')⌝ *)
	
 |	⦏ZSchemaPred⦎	of TERM		(* schema expression *)
 				* string		(* decoration *)
=TEX
}

\subsubsection{Proof Support}

Schemas as predicates are eliminated in favour of membership statements by $z_schema_pred_conv$ (which is built into rewriting in proof context $z_language$) or by rewriting with $z'schema_pred_def$:

=SML
pure_rewrite_conv[z'schema_pred_def]ⓩ Π[x:X]⌝;
=TEX
=GFT ProofPower output
val it = ⊢ [x : X] ⇔ (x ≜ x) ∈ [x : X] : THM
=TEX
Normally the membership statement will be eliminated immediately, as follows:
=SML
rewrite_conv[]ⓩ Π[x:X]⌝;
=TEX
=GFT ProofPower output
val it = ⊢ [x : X] ⇔ x ∈ X : THM
=TEX

\subsection{Propositional Equational Reasoning}

Special facilities are provided for solving problems which lie in the domain of the propositional calculus augmented by equality.
These facilities are not specific to Z but work in Z because in this region the mapping from Z to HOL is completely transparent.

The facilities provided consist of decision procedures for problems in this domain provided through $prove_tac$ and $prove_rule$ in proof contexts $prop_eq$ and $prop_eq_pair$.

e.g.:
=SML
push_pc "prop_eq";
prove_rule [] ⓩa=b ∧ c=d ∧ e=f ⇒ b=e ⇒ c=a ⇒ d=f⌝;
pop_pc();
=GFT ProofPower output
...
val it = ⊢ a = b ∧ c = d ∧ e = f ⇒ b = e ⇒ c = a ⇒ d = f : ...
THM
=TEX

$PC_T1$ may be used to invoke this decision procedure during a tactical proof in the following way:
=GFT SML
set_goal([], ⓩa=b ⇒ b=c ⇒ c=a⌝);
a (PC_T1 "prop_eq" prove_tac[]);
=GFT ProofPower output
...
Tactic produced 0 subgoals:
Current and main goal achieved
...
=TEX
This method avoids the need to change the current proof context.
($PC_T$ and $PC_T1$ are general facilities for invoking a tactic in a specific proof context)

$prop_eq_pair$ is a similar proof context which extends the domain or reasoning of $prop_eq$ to include a knowledge of HOL ordered pairs, however, since HOL pairs are distinct from Z pairs (2-tuples) this does not work for Z.

\section{Quantifiers}

{\ftlmargin=0in\ftrmargin=0in
=GFT Z_TERM
	(* universal quantification, ⓩ ∀ File | p ⦁ q⌝ *)
	
 |	⦏Z∀⦎		of TERM		(* declaration *)
			* TERM * TERM	(* predicates *)

	(* existential quantification, ⓩ ∃ File | p ⦁ q⌝ *)
	
 |	⦏Z∃⦎ 		of TERM		(* declaration *)
 			* TERM * TERM	(* predicates *)
 		
	(* unique existential quantification, ⓩ ∃⋎1 File | p ⦁ q⌝ *)
	
 |	⦏Z∃⋎1⦎		of TERM		(* declaration *)
 			* TERM * TERM	(* predicates *)
=TEX
}

\subsection{Universal Quantification}

\subsubsection{Syntax}
{\ftlmargin=0in\ftrmargin=0in
=GFT Z_TERM
	(* universal quantification, ⓩ ∀ File | p ⦁ q⌝ *)
	
 |	⦏Z∀⦎		of TERM		(* declaration *)
			* TERM * TERM	(* predicates *)
=TEX
}

\subsubsection{Proof Support}

For forward proof the rules $z_∀_elim$ and $z_∀_intro$ are the key facilities.

In its most simple case, where the signature of the declaration part of the universal quantifier contains only a single component name, a value for that variable is supplied:

=SML
z_plus_order_thm;
=GFT ProofPower output
val it = ⊢ ∀ i : 𝕌
    ⦁ ∀ j, k : 𝕌
      ⦁ j + i = i + j ∧ (i + j) + k = i + j + k
      	∧ j + i + k = i + j + k : THM
=TEX
=SML
z_∀_elim ⓩ43⌝ z_plus_order_thm;
=GFT ProofPower output
val it = ⊢ 43 ∈ 𝕌 ∧ true
    ⇒ (∀ j, k : 𝕌
      ⦁ j + 43 = 43 + j
        ∧ (43 + j) + k = 43 + j + k
        ∧ j + 43 + k = 43 + j + k) : THM
=TEX

Where the signature has more than one component it is necessary to supply a binding which has the same signature as the outermost quantifier.
Any expression of the right type will do:

=SML
z_plus_assoc_thm;
=GFT ProofPower output
val it = ⊢ ∀ i, j, k : 𝕌 ⦁ (i + j) + k = i + j + k : THM
=SML
z_∀_elim ⓩexp ⦂ [i, j, k : ℤ]⌝ z_plus_assoc_thm;
=GFT ProofPower output
val it = ⊢ {exp.i, exp.j, exp.k} ⊆ 𝕌 ∧ true
    ⇒ (exp.i + exp.j) + exp.k = exp.i + exp.j + exp.k : THM
=TEX

In the above case projections were used when substituting the value into the new conclusion.
If an explicit binding is supplied (which is the most common case) these projections are not required:

=SML
z_∀_elim ⓩ(i ≜ 2, j ≜ 3, k ≜ 4)⌝ z_plus_assoc_thm;
=GFT ProofPower output
val it = ⊢ {2, 3, 4} ⊆ 𝕌 ∧ true ⇒ (2 + 3) + 4 = 2 + 3 + 4 : THM
=TEX

$z_∀_intro1$ is a left inverse of $z_∀_elim$, and may be used to introduce universal quantifiers.

=SML
z_∀_elim ⓩ(i ≜ v⦂ℤ, j ≜ w⦂ℤ, k ≜ x⦂ℤ)⌝ z_plus_assoc_thm;
=GFT ProofPower output
val it = ⊢ {v, w, x} ⊆ 𝕌 ∧ true ⇒ (v + w) + x = v + w + x : THM
=SML
z_∀_intro1 it;
=GFT ProofPower output
val it = ⊢ ∀ v, w, x : 𝕌 ⦁ (v + w) + x = v + w + x : THM
=TEX

Because of the complications caused by the predicate implicit in the declarations, forward proof using these rules is much less convenient than using more powerful facilities.

For example, if the result required is $(2 + 3) + 4 = 2 + 3 + 4$, then this can most conveniently be proven using $prove_rule$ in an appropriate proof context.

e.g.
=SML
prove_rule [z_plus_assoc_thm] ⓩ(2 + 3) + 4 = 2 + 3 + 4⌝;
=GFT ProofPower output
val it = ⊢ (2 + 3) + 4 = 2 + 3 + 4 : THM
=TEX

In goal oriented proof a wider range of facilities provide support for universal quantification.

Elimination of an outer universal quantifier in the conclusion of the current goal is accomplished by $z_∀_tac$.

=SML
set_goal([],ⓩ∀ x:X ⦁ x = x⌝);
=GFT ProofPower output
(* *** Goal "" *** *)

(* ?⊢ *)  ⓩ∀ x : X ⦁ x = x⌝
...
=SML
a z_∀_tac;
=GFT ProofPower output
(* *** Goal "" *** *)

(* ?⊢ *)  ⓩx ∈ X ∧ true ⇒ x = x⌝
...
=TEX

Exactly the same effect for universal quantifiers is obtained by using $z_strip_tac$.

Universal assumptions may be specialised in a number of ways.

The tactics $z_spec_asm_tac$ or $z_spec_nth_asm_tac$ may be used in a manner analogous to $z_∀_elim$ to specialise an assumption which is unversally quantified.
The result of the specialisation is stripped into the assumptions, and the original assumption also remains in the assumptions.

=SML
set_goal([], ⓩ[X] (∀x:X ⦁ P x ⇒ Q x) ⇒ (∀x:X ⦁ P x) ⇒ (∀x:X ⦁ Q x)⌝);
a (REPEAT z_strip_tac);
=GFT ProofPower output
Tactic produced 1 subgoal:

(* *** Goal "" *** *)

(*  3 *)  ⓩ∀ x : X ⦁ P x ⇒ Q x⌝
(*  2 *)  ⓩ∀ x : X ⦁ P x⌝
(*  1 *)  ⓩx ∈ X⌝

(* ?⊢ *)  ⓩQ x⌝
...
=SML
a (z_spec_nth_asm_tac 3 ⓩx⌝);
=GFT ProofPower output
Tactic produced 1 subgoal:

(* *** Goal "" *** *)

(*  4 *)  ⓩ∀ x : X ⦁ P x ⇒ Q x⌝
(*  3 *)  ⓩ∀ x : X ⦁ P x⌝
(*  2 *)  ⓩx ∈ X⌝
(*  1 *)  ⓩ¬ P x⌝

(* ?⊢ *)  ⓩQ x⌝
...
=TEX
The effect of stripping
=INLINEFT
ⓩP x ⇒ Q x⌝
=TEX
\ into the assumptions here has been to cause a case split into the two cases
=INLINEFT
ⓩQ x⌝
=TEX
\ and
=INLINEFT
ⓩ¬ P x⌝
=TEX
\ of which the first case was discharged automatically because the new assumption matches the conclusion of the goal.

One more specialisation completes the proof:
=SML
a (z_spec_nth_asm_tac 3 ⓩx⌝);
=GFT ProofPower output
Tactic produced 0 subgoals:
Current and main goal achieved
val it = () : unit
=TEX
Specialisation of assumption 3 has created a new assumption which contradicts an existing assumption, and therefore discharges the goal.


\subsection{Existential Quantification}
\subsubsection{Syntax}
{\ftlmargin=0in\ftrmargin=0in
=GFT Z_TERM
	(* existential quantification, ⓩ ∃ File | p ⦁ q⌝ *)
	
 |	⦏Z∃⦎ 		of TERM		(* declaration *)
 			* TERM * TERM	(* predicates *)
=TEX
}

\subsubsection{Proof Support}

Support for existential quantifiers in goal oriented proof consists in three main features.

Firstly, existentials entered into the assumptions are skolemised automatically in all Z proof contexts.

=SML
set_goal([],ⓩ(∃ x:ℤ ⦁ x=2 ∧ x=3) ⇒ false⌝);
a z_strip_tac;
=GFT ProofPower output
...
(* *** Goal "" *** *)

(*  3 *)  ⓩx ∈ ℤ⌝
(*  2 *)  ⓩx = 2⌝
(*  1 *)  ⓩx = 3⌝

(* ?⊢ *)  ⓩfalse⌝
...
=TEX

Secondly when stripping a negated existential conclusion the negation is pushed over the quantifier, resulting in a universal quantifier, which will be eliminated in the next stage of stripping.
The universal quantifier will be elimated on the next step of stripping so the effect is similar to skolemisation.

=SML
set_goal([],ⓩ¬(∃ x:ℤ ⦁ x=2 ∧ x=3)⌝);
a z_strip_tac;
=GFT ProofPower output
...
(* *** Goal "" *** *)

(* ?⊢ *)  ⓩ∀ x : ℤ ⦁ ¬ (x = 2 ∧ x = 3)⌝
...
=TEX
=SML
a z_strip_tac;
=GFT ProofPower output
(* *** Goal "" *** *)

(* ?⊢ *)  ⓩx ∈ ℤ ∧ true ⇒ ¬ (x = 2 ∧ x = 3)⌝
...
=TEX

Finally, the user may attempt to prove a goal with an existential conclusion by offering a witness.
This is done using $z_∃_tac$.

=SML
set_merge_pcs ["z_library"];
set_goal([],ⓩ∃ x:ℤ ⦁ x*x = 4⌝);
a (z_∃_tac ⓩ2⌝);
=GFT ProofPower output
...
(* *** Goal "" *** *)

(* ?⊢ *)  ⓩ2 ∈ ℤ ∧ true ∧ 2 * 2 = 4⌝
...
=TEX
$z_∃_tac$ is parameterised in a manner similar to $z_∀_elim$, accepting a binding (display or expression) in general, and other types of value where the binding would have only one component.

The proof can be completed in this proof context by rewriting.
=SML
a (rewrite_tac[]);
=GFT ProofPower output
Tactic produced 0 subgoals:
Current and main goal achieved
val it = () : unit
=TEX

\ignore{
=SML
repeat drop_main_goal;
=TEX
}%\ignore

WARNING: $z_∃_tac$ could send you down a blind alley.
A true existential goal can be transformed into a false subgoal if the wrong witness is identified.

In some cases it may be more convenient effectively to offer several alternative witnesses which work in difference circumstances.
This is analogous to instantiating the same universal assumption in more than one way.
If this is desired then instead of using $z_∃_tac$ the user should switch to proof by contradiction by using $contr_tac$.
This will transfer the negated existential conclusion into the assumptions, which will appear as a universally quantified assumption after the negation has been pushed in.
The assumption may then be specialised as often as necessary.

\subsection{Unique Existential Quantification}
\subsubsection{Syntax}
{\ftlmargin=0in\ftrmargin=0in
=GFT Z_TERM
	(* unique existential quantification, ⓩ ∃⋎1 File | p ⦁ q⌝ *)
	
 |	⦏Z∃⋎1⦎		of TERM		(* declaration *)
 			* TERM * TERM	(* predicates *)
=TEX
}
\subsubsection{Proof Support}

Support for unique existential quantifiers in goal oriented proof consists in two main features.

Firstly, unique existentials entered into the assumptions are skolemised automatically in all Z proof contexts.
A unique existential results in a universal assumption which expresses the uniqueness condition.

=SML
set_goal([],ⓩ(∃⋎1 x:ℤ ⦁ x=2 ∧ x=3) ⇒ false⌝);
a z_strip_tac;
=GFT ProofPower output
...
(* *** Goal "" *** *)

(*  4 *)  ⓩx ∈ ℤ⌝
(*  3 *)  ⓩx = 2⌝
(*  2 *)  ⓩx = 3⌝
(*  1 *)  ⓩ∀ x' : ℤ | true ∧ x' = 2 ∧ x' = 3 ⦁ x' = x⌝

(* ?⊢ *)  ⓩfalse⌝
...

=TEX

Secondly when stripping a negated unique existential conclusion the negation is pushed over the existential quantifier, resulting in a universal quantifier, which will be eliminated in the next stage of stripping.
The universal quantifier will be elimated on the next step of stripping so the effect is similar to skolemisation.

=SML
set_goal([],ⓩ¬(∃⋎1 x:ℤ ⦁ x=2 ∨ x=3)⌝);
a z_strip_tac;
=GFT ProofPower output
...
(* *** Goal "" *** *)

(* ?⊢ *)  ⓩ∀ x : ℤ
             | true ∧ (x = 2 ∨ x = 3)
             ⦁ ¬
             (∀ x' : ℤ | true ∧ (x' = 2 ∨ x' = 3) ⦁ x' = x)⌝
...
=TEX

A unique existential conclusion may be handled by proof by contradiction using $contr_tac$.

\ignore{
Finally, the user may attempt to prove a goal with a unique existential conclusion by offering a witness.
This is done using $z_∃⋎1_tac$.

=GFT SML
set_goal([],ⓩ∃⋎1 x:ℕ ⦁ x*x = 4⌝);
a (z_∃⋎1_tac ⓩ2⌝);
=GFT ProofPower output
...
(* *** Goal "" *** *)

(* ?⊢ *)  ⓩ2 ∈ ℤ ∧ true ∧ 2 * 2 = 4⌝
...
=TEX
}%\ignore


\section{Predicate Calculus Proofs}

Several methods of proof may be adopted for results in the predicate calculus (or for dealing with the predicate calculus aspects of other proofs):

They are:

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

The first two methods, which are complete for propositional logic may fail to solve some results in the pure predicate calculus.
For these a simple and systematic and simple approach known as the `two-tactic' approach will suffice, or alternatively forward chaining, may suffice to obtain the result with less effort on the part of the user.

These two new methods are described in each of the following subsections, and then a selection of examples are provided which may be attempted by any of the above methods.

\subsection{The Two Tactic Method}

Proof by stripping is effective in discharging a goal only where the reasoning is mainly propositional.
Where the proof will depend either on appropriate specialisation of universally quantified assumptions, or on the choice of a suitable witness for proving an existential conclusion stripping will not suffice.

The two tactic method injects into the proof process based on stripping, user directed specialisation of universal assumptions.
In the context of a proof by contradiction (in which existential conclusions will not arise) this is sufficient to discharge any goals which are reduced to reasoning in the pure first order predicate calculus.

The method is therefore as follows:
=GFT SML
set_goal([],conjecture);
a contr_tac; 				(* once suffices *)
a (z_spec_asm_tac ⓩ assumption ⌝ ⓩ value⌝);	(* as many times as necessary *)
=TEX
The choice of universal assumptions and of the values to specialise them to depends on the user identifying one or more specialisations which will result in the derivation of a contradiction from the assumptions.

\subsection{Forward Chaining}

Forward chaining facilities often provide an easier way of achieving proofs requiring instantiation of universal assumptions.

When a proof fails to be solved by $contr_tac$ alone, $all_asm_fc_tac$ may be capable progressing the proof.

$all_asm_fc_tac$ will attempt to instantiate universally quantified assumptions which are effectively implications to values which will enable forward inference to take place.
This is achieved by matching the antecedent of the implication against other assumptions.

If $contr_tac$ leaves goals outstanding, try progressing the proof using:

=GFT SML
a (all_asm_fc_tac[]); (* once or twice *)
=TEX

This may lead to the derivation of a contradiction with less effort from the user, however it will sometimes fail to solve a goal (and often generate a lot of irrelevant new asumptions).
If forward chaining is not heading anywhere useful, revert to the two tactic method.

A related tactic suitable for use with Z is $all_fc_tac$, which chains forward using implications derived from a list of theorems supplied as an argument, matching these against the assumptions, using the assumptions to match the antecedents of the implications.

$fc_tac$ and $asm_fc_tac$ are also useful (see \REFERENCE), but these are liable to introduce HOL universals, leaving a mixed language subgoal.

\subsection{Predicate Calculus with Equality}

The above facilities primarily support reasoning in the pure predicate calculus, and a proof using these facilities may fail by failing to exploit equations which could be used to complete the proof.

A variety of additional proof facilities are available to make use of equations.

\begin{enumerate}
\item $asm_rewrite_tac$

may be used to cause equations in the assumptions to rewrite the conclusion of a subgoal.
This may sometimes prove sufficient to complete a proof.

\item $eq_sym_asm_tac$ or $eq_sym_nth_asm_tac$

may be used to turn round an equation in an assumption which is the wrong way round to achieve the required rewrite.

\item
$var_elim_asm_tac$ or $var_elim_nth_asm_tac$

may be used to completely eliminate from the subgoal occurrences of a variable which appears on one side of an equation in the specified assumption.
This causes the conclusion and all the other assumptions to be rewritten with the equation, eliminating occurrences of it.
The assumption will then be discarded.
These tactics will work whichever way round the equation appears in the assumption.

\item $all_var_elim_asm_tac$, $all_var_elim_asm_tac1$

automatically eliminate from the assumptions all equations of a sufficiently simple kind, by rewriting the subgoal with them and then discarding the equations.
They avoid eliminating equations where this might cause a looping rewrite.
The first variant only eliminates equations where both sides are either variables or constants, the second variant will eliminate any equation of which one side is a variable which does not appear on the other side.

\end{enumerate}


\subsection{Rewriting}

Rewriting using any collection of theorems from which equations are derivable is supported by the standard HOL rewriting facilities ($rewrite_tac$ etc.), using Z specific preprocessing of the rewrite theorems (supplied in the Z proof contexts).

Many Z paragraphs give rise to predicates which can be used without further preparation by these standard rewriting facilities.
This applies to given sets, abbreviation definitions and schema definitions.

Axiomatic descriptions, and generic axiomatic descriptions will result in equations which are likely to be effectively conditional.
In such cases it is necessary to establish the applicability of the rewrite before it can be undertaken.

One way of achieving this is by forward chaining using the conditional equation after establishing the relevant condition.
The relevant conditions are usually the membership assertions corresponding to the declaration part of the outer universal quantifier on the theorem to be used for rewriting.

For example, to prove the goal:
=SML
set_pc "z_library";
set_goal([], ⓩ ∀ i:ℕ ⦁ abs i = abs ~i⌝);
=TEX
using theorem $z_abs_thm$ (which is :
=INLINEFT
⊢ ∀ i : ℕ ⦁ abs i = i ∧ abs ~ i = i
=TEX
).
First strip the goal:
=SML
a (REPEAT z_strip_tac);
=GFT ProofPower output
...
(*  1 *)  ⓩ0 ≤ i⌝

(* ?⊢ *)  ⓩabs i = abs ~ i⌝
...
=TEX
Then forward chain using the theorem and rewrite with the results:
=SML
a (ALL_FC_T rewrite_tac [z_abs_thm]);
save_pop_thm "abs_eq_abs_minus_thm";
=GFT ProofPower output
Tactic produced 0 subgoals:
Current and main goal achieved
=TEX
In more complicated cases the proof of the required conditions may be non-trivial, often because reasoning about membership of expressions formed with function application is involved.
This topic is further discussed in section \ref{FunctionApplication}.

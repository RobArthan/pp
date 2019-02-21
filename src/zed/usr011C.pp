=IGN
********************************************************************************
usr011C.doc: this file is part of the PPZed system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% usr011C.doc   ℤ $Date: 2004/01/19 12:44:00 $ $Revision: 1.14 $ $RCSfile: usr011C.doc,v $
% this should form a Chapter of the document
% Z Expressions
=TEX
{\ftlmargin=0.5in
\section{Expressions}

{\ftlmargin=0in\ftrmargin=0in
=GFT Z_TERM
	(* function application:  ⓩ f x⌝  *)
	
 |	⦏ZApp⦎ 		of TERM * TERM	(* expressions *)
 		
	(* lambda expression: ⓩ λ x:ℕ | x > 3 ⦁ x * x ⌝ *)
	
 |	⦏Zλ⦎		of TERM		(* declaration *)
 			* TERM		(* predicate *)
 			* TERM		(* expression *)
 	
	(* definite description: ⓩ μ x:ℕ | x * x = 4 ⦁ x⌝ *)
	
 |	⦏Zμ⦎		of TERM		(* declaration *)
 			* TERM		(* predicate *)
			* TERM		(* expression *)
 		
	(* power set construction: ⓩ ℙ ℤ⌝ *)
	
 |	⦏Zℙ⦎		of TERM		(* expression *)

	(* set display: ⓩ {1,2,3,4} ⌝ *)
	
 |	⦏ZSetd⦎		of TYPE	(* HOL type of elements *)
 			* TERM list	(* expressions *)
 		
	(* set abstraction: ⓩ {x:ℤ | 1≤x≤4 ⦁ x*x} ⌝*)
	
 |	⦏ZSeta⦎ 		of TERM		(* declaration *)
 			* TERM		(* predicate *)
 			* TERM		(* expression *)
 		
	(* tuple: ⓩ (1,2,3,4) ⌝ *)
	
 |	⦏ZTuple⦎ 	of TERM list		(* expressions *)
 		
	(* tuple element selection: ⓩ (x,y).2⌝ *)
	
 |	⦏ZSel⋎t⦎ 		of TERM		(* expression *)
 			* int			(* element number *)

 	(* cartesian product: ⓩ (ℤ × ℕ) ⌝ *)
 	
 |	⦏Z×⦎		of TERM list		(* expressions *)
 		
	(* binding display: ⓩ (people ≜ {}, age ≜ {}) ⌝ *)
	
 |	⦏ZBinding⦎	of (	string		(* component name *)
 			* TERM		(* component value *)
 			) list
 		
	(* theta term: ⓩ θFile' ⌝ *)
	
 |	⦏Zθ⦎		of TERM		(* schema expression *)
			* string		(* decoration *)
 		
	(* binding component selection: ⓩ (a ≜ 1, b ≜ "4").b ⌝ *)
	
 |	⦏ZSel⋎s⦎		of TERM		(* expression *)
 			* string		(* component name *)

	(* horizontal schema expression: ⓩ [x:ℤ | x>0] ⌝ *)
	
 |	⦏Z⋎s⦎		of TERM		(* declaration *)
			* TERM		(* predicate *)
		
	(* sequence display: ⓩ ⟨1,2,3⟩⌝ *)
	
 |	⦏Z⟨⟩⦎		of TYPE		(* type of elements *)
			* TERM list		(* values of elements *)
=TEX
}

The main new feature here is the binding display, which is important in expressing convenient proof rules.

Though absent from the first edition of the ZRM \cite{spivey89}, binding displays have been introduced into the second edition \cite{spivey92} for exposition, but not as part of Z, and have now appeared in the draft standard, with two distinct concrete syntaxes neither of which corresponds to our proposal.

Bag displays and relational image, which were once treated as part of the language, can now be introduced in the library using appropriate fixity declarations.


\subsection{Function Application}\label{FunctionApplication}

\subsubsection{Syntax}
{\ftlmargin=0in\ftrmargin=0in
=GFT Z_TERM
	(* function application:  ⓩ f x⌝  *)
	
 |	⦏ZApp⦎ 		of TERM * TERM		(* expressions *)
=TEX
}

Function application may also use infix, postfix or ``fancyfix'' notation if an appropriate fixity paragraph has been entered.
In such cases the arguments are effectively the name of the global variable and the second is the term consisting of a tuple of arguments.

=SML
dest_z_term ⓩf a⌝;
=GFT ProofPower output
val it = ZApp (ⓩf⌝, ⓩa⌝) : Z_TERM
=TEX

=SML
dest_z_term ⓩa ∪ b⌝;
=GFT ProofPower output
val it = ZApp (ⓩ(_ ∪ _)⌝, ⓩ(a, b)⌝) : Z_TERM
=TEX

In the following case the fixity declaration for bag brackets required a single argument which is a sequence (with sequence brackets elided in the concrete syntax of the bag display).

=SML
dest_z_term ⓩ⟦1,2,3,2,1⟧⌝;
=GFT ProofPower output
val it = ZApp (ⓩ(⟦ ... ⟧)⌝, ⓩ⟨1, 2, 3, 2, 1⟩⌝) : Z_TERM
=TEX

\subsubsection{Proof Support}

Applications of lambda abstractions can be eliminated by (conditional) β-conversion.

=SML
z_β_conv ⓩ (λ x:X | P x ⦁ f x) a⌝;
=GFT ProofPower output
val it = P a, a ∈ X ⊢ (λ x : X | P x ⦁ f x) a = f a : THM
=TEX

Applications may also be eliminated in favour of definite descriptions (though this is not particularly helpful).

=SML
z_app_conv ⓩ f a⌝;
=GFT ProofPower output
val it = ⊢ f a = μ f_a : 𝕌 | (a, f_a) ∈ f ⦁ f_a : THM
=TEX

More commonly function applications are eliminated by rewriting with the definition of the relevant function.

Reasoning at a low level, $z_app_eq_tac$ may be used to reduce an equation involving an application to sufficient conditions for its truth, in terms of the membership of the function, e.g.:
=SML
set_goal([],ⓩ f a = v⌝);
a z_app_eq_tac;
=GFT ProofPower output
...
(* ?⊢ *)  ⓩ(∀ f_a : 𝕌 | (a, f_a) ∈ f ⦁ f_a = v) ∧ (a, v) ∈ f⌝
...
=TEX

The first conjunct of this result is needed to ensure that $f$ is functional at $a$ (i.e. maps $a$ to only one value).
In the case that $f$ is known to be a function, the theorem $z_fun_app_clauses$ may be used with forward chaining, avoiding the need to prove that $f$ is functional at $a$.
=GFT
val z_fun_app_clauses =
  ⊢ ∀ f : 𝕌; x : 𝕌; y : 𝕌; X : 𝕌; Y : 𝕌
    ⦁ (f ∈ X ⇸ Y
          ∨ f ∈ X ⤔ Y
          ∨ f ∈ X ⤀ Y
          ∨ f ∈ X → Y
          ∨ f ∈ X ↣ Y
          ∨ f ∈ X ↠ Y
          ∨ f ∈ X ⤖ Y)
        ∧ (x, y) ∈ f
      ⇒ f x = y : THM
=TEX
In this case the result $(a,v)\ ∈\ f$ would have to be proven and added to the assumptions before undertaking the forward chaining, e.g.:
=SML
drop_main_goal();
set_goal([], ⓩf ∈ ℕ ↠ ℤ ⇒ (4, ~45) ∈ f ⇒ f 4 = ~45⌝);
a (REPEAT z_strip_tac);
=GFT ProofPower output
...
(*  2 *)  ⓩf ∈ ℕ ↠ ℤ⌝
(*  1 *)  ⓩ(4, ~ 45) ∈ f⌝

(* ?⊢ *)  ⓩf 4 = ~ 45⌝

=SML
a (all_fc_tac [z_fun_app_clauses]);
pop_thm();
=GFT ProofPower output
Tactic produced 0 subgoals:
Current and main goal achieved
=TEX

A common problem is to have to establish that the value of some expression formed by application falls within some particular set.
This is often needed to establish the conditions necessary for use of a rewriting equation on the expression.

In these circumstances the theorem $z_fun_∈_clauses$ may be used:
=GFT
val z_fun_∈_clauses = ⊢ ∀ f : 𝕌; x : 𝕌; X : 𝕌; Y : 𝕌
 ⦁ ((f ∈ X → Y ∨ f ∈ X ↣ Y ∨ f ∈ X ↠ Y ∨ f ∈ X ⤖ Y) ∧ x ∈ X
 	⇒ f x ∈ Y)
 ∧ ((f ∈ X ⇸ Y ∨ f ∈ X ⤔ Y ∨ f ∈ X ⤀ Y) ∧ x ∈ dom f
 	⇒ f x ∈ Y) : THM
=TEX
The claim that a global variable is a member of a function space will often be obtained from the specification of the constant (as part of the predicate implicit in the declaration part of the specification).
Where the function is an expression the result is likely to have been established by forward inference using similar methods.
=SML
set_goal([], ⓩ[X](∀ b: bag X⦁ count[X] b ∈ X → ℕ)⌝);
a (REPEAT z_strip_tac);
=GFT ProofPower output
...
(*  1 *)  ⓩb ∈ bag X⌝

(* ?⊢ *)  ⓩcount[X] b ∈ X → ℕ⌝
...
=TEX
We need the fact about $count$ which is found in its defining declaration instantiated to $X$ to make the required inference.
This is added to the assumptions as follows:
=SML
a (strip_asm_tac (z_gen_pred_elim [ⓩX⌝] (z_get_spec ⓩcount⌝)));
=GFT ProofPower output
...
(*  3 *)  ⓩb ∈ bag X⌝
(*  2 *)  ⓩcount[X] ∈ bag X ⤖ X → ℕ⌝
(*  1 *)  ⓩ∀ x : X; B : bag X ⦁ count[X] B = (λ x : X ⦁ 0) ⊕ B⌝

(* ?⊢ *)  ⓩcount[X] b ∈ X → ℕ⌝
...
=TEX
Assumption 1 is spurious but harmless.
Next we forward chain using the theorem $z_fun_∈_clauses$, which suffices to discharge the goal.
=SML
a (all_fc_tac [z_fun_∈_clauses]);
save_pop_thm "bag_lemma1";
=GFT ProofPower output
Tactic produced 0 subgoals:
Current and main goal achieved
...
=TEX

Care is sometimes needed when proving membership lemmas which require intermediate results which involve constructs such as cartesian products, since most proof contexts will eliminate these.
=SML
set_goal([],ⓩ[X](∀ b,c: bag X ⦁ ((_⊎_)[X](b, c)) ∈ bag X)⌝);
a (REPEAT strip_tac);
a (strip_asm_tac (z_gen_pred_elim [ⓩX⌝] (z_get_spec ⓩ(_⊎_)⌝)));
=GFT ProofPower output
...
(*  4 *)  ⓩb ∈ bag X⌝
(*  3 *)  ⓩc ∈ bag X⌝
(*  2 *)  ⓩ(_ ⊎ _)[X] ∈ (bag X) × (bag X) → bag X⌝
(*  1 *)  ⓩ∀ B, C : bag X; x : X
             ⦁ count ((_ ⊎ _)[X] (B, C)) x = count B x + count C x⌝

(* ?⊢ *)  ⓩ(_ ⊎ _)[X] (b, c) ∈ bag X⌝
...
=TEX
Here the assumption
=INLINEFT
(b,c) ∈ (bag X) × (bag X)
=TEX
\ is needed to enable the required forward chaining, but the obvious methods of obtaining this, e.g.:
=SML
a (lemma_tac ⓩ(b,c) ∈ (bag X) × (bag X)⌝ THEN1 contr_tac);
=TEX
have no effect since the lemma is broken up as it is added to the assumptions.
This break-up can be inhibited as follows:
=SML
a (LEMMA_T ⓩ(b,c) ∈ (bag X) × (bag X)⌝ asm_tac THEN1 contr_tac);
=GFT ProofPower output
...
(*  1 *)  ⓩ(b, c) ∈ (bag X) × (bag X)⌝

(* ?⊢ *)  ⓩ(_ ⊎ _)[X] (b, c) ∈ bag X⌝
...
=TEX
where $asm_tac$ is used instead of the default $strip_asm_tac$ for processing the new assumption.
Now the forward chaining will work.
=SML
a (all_fc_tac [z_fun_∈_clauses]);
save_pop_thm "bag_lemma2";
=GFT ProofPower output
Tactic produced 0 subgoals:
Current and main goal achieved
...
=TEX

\subsection{Lambda Abstraction}

\subsubsection{Syntax}
{\ftlmargin=0in\ftrmargin=0in
=GFT Z_TERM
	(* lambda expression ⓩ λ x:ℕ | x > 3 ⦁ x * x ⌝ *)
	
 |	⦏Zλ⦎		of TERM		(* declaration *)
 			* TERM		(* predicate *)
 			* TERM		(* expression *)
=TEX
}
\subsubsection{Proof Support}

$λ$-abstractions when applied to arguments may be eliminated by $z_β_conv$ (see \ref{FunctionApplication}).

Assertions about membership of $λ$-abstractions may be directly eliminated.
=SML
rewrite_conv [] ⓩz ∈ (λ x:X | P x ⦁ f x)⌝;
=GFT ProofPower output
val it = ⊢ z ∈ λ x : X | P x ⦁ f x ⇔ z.1 ∈ X ∧ P z.1 ∧ f z.1 = z.2 : THM
=TEX

Since $λ$-abstractions denote sets they may also be eliminated in favour of set comprehensions using $z_λ_conv$.

=SML
z_λ_conv ⓩλ x:X | P x ⦁ f x⌝;
=GFT ProofPower output
val it = ⊢ (λ x : X | P x ⦁ f x) = {x : X | P x ⦁ (x, f x)} : THM
=TEX

\subsection{Definite Description}

\subsubsection{Syntax}
{\ftlmargin=0in\ftrmargin=0in
=GFT Z_TERM
	(* definite description ⓩ μ x:ℕ | x * x = 4 ⦁ x⌝ *)
	
 |	⦏Zμ⦎		of TERM		(* declaration *)
 			* TERM		(* predicate *)
			* TERM		(* expression *)
=TEX
}
\subsubsection{Proof Support}

Definite descriptions may be eliminated using $z_μ_rule$.

=SML
z_μ_rule ⓩ μ x:X | P ⦁ y⌝;
=GFT ProofPower output
val it = ⊢ ∀ x' : 𝕌
    ⦁ (∀ x : X | P ⦁ y = x') ∧ (∃ x : X | P ⦁ y = x')
      ⇒ (μ x : X | P ⦁ y) = x' : THM
=TEX
\subsection{Let Expression}

\subsubsection{Syntax}
{\ftlmargin=0in\ftrmargin=0in
=GFT Z_TERM
		(* let expression ⓩ let x ≜ 9 ⦁ (x, x+x) ⌝ *)
 | ⦏ZLet⦎
 		of (string * TERM) list	(* local definitions *)
 		* TERM	(* expression *)
=TEX
}
\subsubsection{Proof Support}

Let expressions may be expanded using $z_let_conv$.

=SML
z_let_conv ⓩ let x ≜ 9 ⦁ (x, x + x) ⌝;
=GFT ProofPower output
val it = ⊢
	(let x ≜ 9 ⦁ (x, x + x)) = (9, 9 + 9) : THM
=TEX
=TEX

\subsection{The Power Set}

\subsubsection{Syntax}

{\ftlmargin=0in\ftrmargin=0in
=GFT Z_TERM
	(* power set construction, ⓩ ℙ ℤ⌝ *)
	
 |	⦏Zℙ⦎		of TERM		(* expression *)
=TEX
}
\subsubsection{Proof Support}

Membership statements concerning power sets may be eliminated using $z_∈_ℙ_conv$, or by rewriting in proof context $z_language_ext$.

=SML
PC_C1 "z_language_ext" rewrite_conv[] ⓩ z ∈ ℙ y⌝;
=GFT ProofPower output
val it = ⊢ z ∈ ℙ y ⇔ (∀ x1 : 𝕌 ⦁ x1 ∈ z ⇒ x1 ∈ y) : THM
=TEX

\subsection{Set Displays}
\subsubsection{Syntax}

{\ftlmargin=0in\ftrmargin=0in
=GFT Z_TERM
	(* set display, ⓩ {1,2,3,4} ⌝ *)
	
 |	⦏ZSetd⦎		of TYPE	(* HOL type of elements *)
 			* TERM list	(* expressions *)
=TEX
}
\subsubsection{Proof Support}

Membership statements sets displays may be eliminated using $z_∈_setd_conv$, or by rewriting in proof context $z_language$.

=SML
rewrite_conv[] ⓩ z ∈ {1,2,3,4,5}⌝;
=GFT ProofPower output
val it = ⊢ z ∈ {1, 2, 3, 4, 5} ⇔
	z = 1 ∨ z = 2 ∨ z = 3 ∨ z = 4 ∨ z = 5 : THM
=TEX

\subsection{Set Abstractions}
\subsubsection{Syntax}
{\ftlmargin=0in\ftrmargin=0in
=GFT Z_TERM		
	(* set abstraction, ⓩ {x:ℤ | 1≤x≤4 ⦁ x*x} ⌝*)
	
 |	⦏ZSeta⦎ 		of TERM		(* declaration *)
 			* TERM		(* predicate *)
 			* TERM		(* expression *)
 		
=TEX
}
\subsubsection{Proof Support}

Statements about membership of set abstractions may be eliminated using $z_∈_seta_conv$, or by rewriting in proof context $z_language$.

A simple abstraction results in straightforward substitution into the body of the abstraction:

=SML
rewrite_conv[] ⓩ 9 ∈ {x:ℕ | x < 12}⌝;
=GFT ProofPower output
val it = ⊢ 9 ∈ {x : ℕ | x < 12} ⇔ 9 ∈ ℕ ∧ 9 < 12 : THM
=TEX

Where the signature is more complex tuple projections are introduced:

=SML
rewrite_conv[]ⓩ z ∈ {x, y:ℕ | x < y}⌝;
=GFT ProofPower output
val it = ⊢ z ∈ {x, y : ℕ | x < y}
⇔ (z.1 ∈ ℕ ∧ z.2 ∈ ℕ) ∧ z ∈ (_ < _) : THM
=TEX

Where membership is asserted of a tuple the projections are undertaken automatically.

=SML
rewrite_conv[]ⓩ (v,w) ∈ {x, y:ℕ | x < y}⌝;
=GFT ProofPower output
val it = ⊢ (v, w) ∈ {x, y : ℕ | x < y}
⇔ (v ∈ ℕ ∧ w ∈ ℕ) ∧ v < w : THM
=TEX

In the general case introduction of an existential is necessary, though this is avoided whenever possible.

=SML
rewrite_conv[]ⓩ z ∈ {x, y:ℕ | x < y ⦁ x * y - x}⌝;
=GFT ProofPower Output
val it = ⊢ z ∈ {x, y : ℕ | x < y ⦁ x * y - x}
⇔ (∃ x, y : ℕ | x < y ⦁ x * y - x = z) :THM
=TEX

\subsection{Tuple Displays}
\subsubsection{Syntax}
{\ftlmargin=0in\ftrmargin=0in
=GFT Z_TERM
	(* tuple, ⓩ (1,2,3,4) ⌝ *)
	
 |	⦏ZTuple⦎ 	of TERM list		(* expressions *)
=TEX
}

Note that $n-$tuples for $n > 2$ are not iterated pairs, i.e. $ⓩ(1,(2,3))⌝$ is not the same as $ⓩ(1,2,3)⌝$ (and doesn't have the same type either).

\subsubsection{Proof Support}

Two tuple displays are equal iff each of their respective components are equal.
This fact is built into the proof context $z_language$ both for rewriting and stripping assumptions or conclusions.

=SML
rewrite_conv[] ⓩ(x,y) = (a,b)⌝;
=GFT ProofPower output
val it = ⊢ (x, y) = (a, b) ⇔ x = a ∧ y = b : THM
=TEX

\subsection{Tuple Element Selection}\label{TupleSelection}

\subsubsection{Syntax}
{\ftlmargin=0in\ftrmargin=0in
=GFT Z_TERM
	(* tuple element selection, ⓩ (x,y).2⌝ *)
	
 |	⦏ZSel⋎t⦎ 		of TERM		(* expression *)
 			* int			(* element number *)
=TEX
}
\subsubsection{Proof Support}

Conversions to effect projection from tuple displays are also built into proof context $z_language$.
=SML
rewrite_conv[] ⓩ (x,y).1⌝;
=GFT ProofPower output
val it = ⊢ (x, y).1 = x : THM
=TEX

\subsection{Cartesian Products}
\subsubsection{Syntax}
{\ftlmargin=0in\ftrmargin=0in
=GFT Z_TERM
 	(* cartesian product, ⓩ (ℤ × ℕ) ⌝ *)
 	
 |	⦏Z×⦎		of TERM list		(* expressions *)
=TEX
}

Note that the n-ary cartesian products for $n>2$ are not formed by iteration of the binary cartesian product.

\subsubsection{Proof Support}

The membership conversion for n-ary cartesian products is $z_∈_×_conv$ which is built into proof context $z_language$.

=SML
rewrite_conv[] ⓩ (a, b, c) ∈ (x × y × z)⌝;
=GFT ProofPower output
val it = ⊢ (a, b, c) ∈ x × y × z
	⇔ a ∈ x ∧ b ∈ y ∧ c ∈ z : THM
=TEX

Cartesian products may also be converted into set abstractions using $z_×_conv$.
=SML
z_×_conv	ⓩ (x × y × z)⌝;
=GFT ProofPower output
val it = ⊢ x × y × z = {t⋎1 : x; t⋎2 : y; t⋎3 : z} : THM
=TEX

Extensional proof contexts incorporate an extensional understanding of equality of cartesian products:

=SML
PC_C1 "z_language_ext"
rewrite_conv[] ⓩ (x × y × z) = (x' × y' × z')⌝;
=GFT ProofPower output
val it = ⊢ x × y × z = x' × y' × z'
    ⇔ (∀ x1 : 𝕌; x2 : 𝕌; x3 : 𝕌
      ⦁ x1 ∈ x ∧ x2 ∈ y ∧ x3 ∈ z
      ⇔ x1 ∈ x' ∧ x2 ∈ y' ∧ x3 ∈ z') : THM
=TEX

Such an equation can also be demonstrated by rewriting if each of the respective components can be proven equal, however this is not a necessary condition for the equality (since any single empty component set will render the cartesian product empty).

\subsection{Binding Displays}
\subsubsection{Syntax}
{\ftlmargin=0in\ftrmargin=0in
=GFT Z_TERM
	(* binding ⓩ (people ≜ {}, age ≜ {}) ⌝ *)
	
 |	⦏ZBinding⦎	of (	string		(* component name *)
 			* TERM		(* component value *)
 			) list
=TEX
}

\subsubsection{Proof Support}

Two binding displays are equal iff each of their respective components are equal.
This fact is built into the proof context $z_language$ for rewriting and for stripping assumptions and conclusions.

=SML
rewrite_conv[] ⓩ (x ≜ a, y ≜ b) = (y ≜ d, x ≜ c)⌝;
=GFT ProofPower output
val it = ⊢ (x ≜ a, y ≜ b) = (x ≜ c, y ≜ d) ⇔ a = c ∧ b = d : THM
=TEX


\subsection{Theta Terms}
\subsubsection{Syntax}
{\ftlmargin=0in\ftrmargin=0in
=GFT Z_TERM
	(* theta term ⓩ θFile' ⌝ *)
	
 |	⦏Zθ⦎		of TERM		(* schema expression *)
			* string		(* decoration *)
=TEX
}

The extended syntax allows arbitrary expressions of appropriate type in place of the schema reference usually required.

\subsubsection{Proof Support}

Theta terms may be though of as abbreviations for explicit binding constructions.
Rewriting with $z'θ_def$ will reveal the underlying binding construction:

=SML
rewrite_conv[z'θ_def] ⓩ θFile'⌝;
=GFT ProofPower output
val it = ⊢ θFile' = (age ≜ age', people ≜ people') : THM
=TEX

Alternatively $z_θ_conv$ may be used to secure the same effect:

=SML
z_θ_conv ⓩ θFile'⌝;
=GFT ProofPower output
val it = ⊢ θFile' = (age ≜ age', people ≜ people') : THM
=TEX

In most respects $θ$-terms are treated in the same way as binding displays.

\subsection{Binding Component Selection}\label{BindCompSel}

\subsubsection{Syntax}
{\ftlmargin=0in\ftrmargin=0in
=GFT Z_TERM
	(* binding component selection ⓩ (a ≜ 1, b ≜ "4").b ⌝ *)
	
 |	⦏ZSel⋎s⦎		of TERM		(* expression *)
 			* string		(* component name *)
=TEX
}

The $⋎s$ here and in the following is entered into the source document as:
=GFTSHOW
		⋎s
=TEX
{\ShowAllImages
The `subscript-shift character',
=INLINEFT
⋎
=TEX
, here may be obtained from the palette of mathematical symbols or
typed directly (as Meta+tab under SunView, or as Meta+d when using {\tt xpp}).}

\subsubsection{Proof Support}

Projection from binding displays is built in to proof context $z_language$.

=SML
rewrite_conv[] ⓩ (x ≜ a, y ≜ b).y⌝;
=GFT ProofPower output
val it = ⊢ (x ≜ a, y ≜ b).y = b : THM
=TEX

Projection from theta terms is also built in to proof context $z_language$.
=SML
rewrite_conv[] ⓩ (θFile').age⌝;
=GFT ProofPower output
val it = ⊢ (θFile').age = age' : THM
=TEX

\subsection{Horizontal Schemas}
\subsubsection{Syntax}

{\ftlmargin=0in\ftrmargin=0in
=GFT Z_TERM
	(* horizontal schema expression: ⓩ [x:ℤ | x>0] ⌝ *)
	
 |	⦏Z⋎s⦎		of TERM		(* declaration *)
			* TERM		(* predicate *)
=TEX
}

\subsubsection{Proof Support}

The basic rule for horizontal schemas is the conversion $z_∈_horiz_schema_conv1$, which is built into the standard rewrites for proof context {\it z_language}.

=SML
rewrite_conv[]ⓩz ∈ [x:ℤ;y:ℕ]⌝;
=TEX

=GFT ProofPower output
val it = ⊢ z ∈ [x : ℤ; y : ℕ]
	⇔ z.x ∈ ℤ ∧ z.y ∈ ℕ : THM
=TEX

Where a binding display or theta term is used the selections take place automatically.

=SML
rewrite_conv[]ⓩ(x ≜ a, y ≜ b) ∈ [x:ℤ;y:ℕ]⌝;
=TEX

=GFT ProofPower output
val it = ⊢ (x ≜ a, y ≜ b) ∈ [x : ℤ; y : ℕ]
	⇔ a ∈ ℤ ∧ b ∈ ℕ : THM
=TEX

\subsection{Sequence Displays}
\subsubsection{Syntax}

{\ftlmargin=0in\ftrmargin=0in
=GFT Z_TERM
	(* sequence display: ⓩ ⟨1,2,3⟩⌝ *)
	
 |	⦏Z⟨⟩⦎		of TYPE		(* type of elements *)
			* TERM list		(* values of elements *)
=TEX
}

\subsubsection{Proof Support}

The basic rules for sequence displays are the conversion $z_⟨⟩_conv$ and $z_∈_⟨⟩_conv$, which differ only in that the latter will trigger only for membership assertions.
$z_∈_⟨⟩_conv$ is built into the standard rewrites for proof context $z_language$.

=SML
z_⟨⟩_conv ⓩ⟨a,b,c⟩⌝;
=TEX

=GFT ProofPower output
val it = ⊢ ⟨a, b, c⟩ = {(1, a), (2, b), (3, c)} : THM
=TEX

In the context of a membership assertion, rewriting in the proof context $z_language$ performs the same elimination:

=SML
once_rewrite_conv[]ⓩz ∈ ⟨a,b,c⟩⌝;
=TEX

=GFT ProofPower output
val it = ⊢ z ∈ ⟨a, b, c⟩ ⇔
	z ∈ {(1, a), (2, b), (3, c)} : THM
=TEX

Which (without the ``once'') is further reduced as follows:

=SML
rewrite_conv[]ⓩz ∈ ⟨a,b,c⟩⌝;
=TEX

=GFT ProofPower output
val it = ⊢ z ∈ ⟨a, b, c⟩ ⇔
	z = (1, a) ∨ z = (2, b) ∨ z = (3, c) : THM
=TEX

\section{Schema Expressions}

{\ftlmargin=0in\ftrmargin=0in
=GFT Z_TERM
	(* schema negation: ⓩ(¬ File)⦂𝕌⌝ *)
	
 |	⦏Z¬⋎s⦎		of TERM	(* schema expression *)
			
	(* schema conjunction: ⓩ(File ∧ File2)⦂𝕌⌝ *)
	
 |	⦏Z∧⋎s⦎		of TERM * TERM	(* schema expressions *)
			
	(* schema disjunction: ⓩ(File ∨ File2)⦂𝕌⌝ *)

 |	⦏Z∨⋎s⦎		of TERM * TERM	(* schema expressions *)
			
	(* schema implication ⓩ(File ⇒ File2)⦂𝕌⌝ *)

 |	⦏Z⇒⋎s⦎		of TERM * TERM	(* schema expressions *)
			
	(* schema equivalence: ⓩ(File ⇔ File2)⦂𝕌⌝ *)

 |	⦏Z⇔⋎s⦎		of TERM * TERM	(* schema expressions *)
			
	(* schema existential: ⓩ(∃ File3 | people = {} ⦁ File2)⦂𝕌⌝ *)
	
 |	⦏Z∃⋎s⦎		of TERM		(* declaration *)
			* TERM		(* predicate *)
			* TERM		(* schema expression *)
			
	(* schema unique existential: ⓩ(∃⋎1 File3 | people = {} ⦁ File2)⦂𝕌⌝ *)
	
 |	⦏Z∃⋎1⋎s⦎		of TERM		(* declaration *)
			* TERM		(* predicate *)
			* TERM		(* schema expression *)
			
	(* schema universal: ⓩ(∀ File3 | people = {} ⦁ File2)⦂𝕌⌝ *)
	
 |	⦏Z∀⋎s⦎		of TERM		(* declaration *)
			* TERM		(* predicate *)
			* TERM		(* schema expression *)

	(* decoration: ⓩ File ''⌝ *)
	
 |	⦏ZDecor⋎s⦎	of TERM		(* schema expression *)
 			* string		(* decoration *)
 		
	(* pre-condition: ⓩ pre FileOp⌝ *)
	
 |	⦏ZPre⋎s⦎		of TERM		(* schema expression *)

 	(* schema hiding: ⓩ FileOp \⋎s (age, i?)⌝  *)
 	
 |	⦏ZHide⋎s⦎	of TERM		(* schema expression *)
 			* string list		(* component names *)
 		
	(* schema renaming: ⓩFile [aged/age, input/i?]⌝ *)
	
 |	⦏ZRename⋎s⦎	of TERM		(* schema expression *)
 			* (string * string) list	(* rename list *)
 		
	(* schema projection: ⓩFileOp ↾⋎s File⌝*)
	
 |	⦏Z↾⋎s⦎		of TERM * TERM	(* schema expressions *)

	(* schema composition: ⓩΔFile ⨾⋎s ΔFile⌝ *)
	
 |	⦏Z⨾⋎s⦎	of TERM * TERM	(* schema expressions *)
 		
	(* delta operation: ⓩΔFile⌝ *)
	
 |	⦏ZΔ⋎s⦎		of TERM		(* schema expression *)
 		
	(* Ξ operation: ⓩΞFile⌝ *)
	
 |	⦏ZΞ⋎s⦎		of TERM		(* schema expression *)
;
=TEX
}


Note here that though the logical operators have been overloaded, at present the system does not support the overloading of other schema operators which clash with names in the Z ToolKit.
For these operators
=INLINEFT
(⨾⋎s, ↾⋎s, \⋎s)
=TEX
, the name subscripted with s has been used for the schema operator.

\subsection{Schema Negation}

\subsubsection{Syntax}

{\ftlmargin=0in\ftrmargin=0in
=GFT Z_TERM
	(* schema negation ⓩ(¬ File)⦂𝕌⌝ *)
	
 | 	⦏Z¬⋎s⦎		of TERM	(* schema expression *)
=TEX
}

A negation occurring at the outermost level in a term quotation is interpreted as a logical negation rather than a schema negation, unless a cast is applied.

\subsubsection{Proof Support}

A binding is an element of the schema negation of a schema iff it is not an element of the schema.

This rule is captured by the conversion $z_∈_¬⋎s_conv$, which is built into the standard rewrites for proof context $z_language$.

=SML
rewrite_conv[]ⓩz ∈ (¬ File)⌝;
=TEX

=GFT ProofPower output
val it = ⊢ z ∈ (¬ File) ⇔ ¬ z ∈ File : THM
=TEX

\subsection{Schema Conjunction}

\subsubsection{Syntax}

{\ftlmargin=0in\ftrmargin=0in
=GFT Z_TERM
	(* schema conjunction: ⓩ(File ∧ File2)⦂𝕌⌝ *)
	
 |	⦏Z∧⋎s⦎		of TERM * TERM	(* schema expressions *)
=TEX
}

The two operands must be schema expressions with compatible types.

A conjunction occurring at the outermost level in a term quotation is interpreted as a logical conjunction rather than a schema conjunction, unless a cast is applied.

\subsubsection{Proof Support}

A binding is an element of the schema conjunction of two schemas iff both the projections of the binding to the signatures of the operands are elements of the corresponding operand schemas.

This rule is captured by the conversion $z_∈_∧⋎s_conv$, which is built into the standard rewrites for proof context $z_language$.

=IGN
z_∈_∧⋎s_conv ⓩz ∈ (File ∧ File2)⌝;
=SML
rewrite_conv[] ⓩz ∈ (File ∧ File2)⌝;
=TEX

=GFT ProofPower output
val it = ⊢ z ∈ (File ∧ File2)
    ⇔ (age ≜ z.age, people ≜ z.people) ∈ File
      ∧ (height ≜ z.height, people ≜ z.people) ∈ File2 : THM
=TEX

\subsection{Schema Disjunction}

\subsubsection{Syntax}

{\ftlmargin=0in\ftrmargin=0in
=GFT Z_TERM
	(* schema disjunction: ⓩ(File ∨ File2)⦂𝕌⌝ *)
	
 |	⦏Z∨⋎s⦎		of TERM * TERM	(* schema expressions *)
=TEX
}

The two operands must be schema expressions with compatible types.

A disjunction occurring at the outermost level in a term quotation is interpreted as a logical disjunction rather than a schema disjunction, unless a cast is applied.

\subsubsection{Proof Support}

A binding (of appropriate type) is an element of the schema disjunction of two schemas iff either of the projections of the binding to the signatures of the operands are elements of the corresponding operand schemas.

This rule is captured by the conversion $z_∈_∨⋎s_conv$, which is built into the standard rewrites for proof context $z_language$.

=IGN
z_∈_∨⋎s_conv ⓩz ∈ (File ∨ File2)⌝;
=SML
rewrite_conv[] ⓩz ∈ (File ∨ File2)⌝;
=TEX

=GFT ProofPower output
val it = ⊢ z ∈ (File ∨ File2)
    ⇔ (age ≜ z.age, people ≜ z.people) ∈ File
      ∨ (height ≜ z.height, people ≜ z.people) ∈ File2 : THM
=TEX

\subsection{Schema Implication}
\subsubsection{Syntax}

{\ftlmargin=0in\ftrmargin=0in
=GFT Z_TERM
	(* schema implication ⓩ(File ⇒ File2)⦂𝕌⌝ *)

 |	⦏Z⇒⋎s⦎		of TERM * TERM	(* schema expressions *)
=TEX
}

The two operands must be schema expressions with compatible types.

An implication occurring at the outermost level in a term quotation is interpreted as a logical implication rather than a schema implication, unless a cast is applied.

\subsubsection{Proof Support}

A binding (of appropriate type) is an element of the schema implication of two schemas iff whenever the projection of the binding to the signature of the first operand is an element of the corresponding operand schemas, the projections of the binding to the signature of the second operand is also an element of the second operand schema.

This rule is captured by the conversion $z_∈_⇒⋎s_conv$, which is built into the standard rewrites for proof context {\it z_language}.

=IGN
z_∈_⇒⋎s_conv ⓩz ∈ (File ⇒ File2)⌝;
=SML
rewrite_conv[] ⓩz ∈ (File ⇒ File2)⌝;
=TEX

=GFT ProofPower output
val it = ⊢ z ∈ (File ⇒ File2)
    ⇔ (age ≜ z.age, people ≜ z.people) ∈ File
      ⇒ (height ≜ z.height, people ≜ z.people) ∈ File2 : THM
=TEX


\subsection{Schema Equivalence}
\subsubsection{Syntax}

{\ftlmargin=0in\ftrmargin=0in
=GFT Z_TERM
	(* schema equivalence: ⓩ(File ⇔ File2)⦂𝕌⌝ *)

 |	⦏Z⇔⋎s⦎		of TERM * TERM	(* schema expressions *)
=TEX
}

The two operands must be schema expressions with compatible types.

An equivalence occurring at the outermost level in a term quotation is interpreted as a logical equivalence rather than a schema equivalence, unless a cast is applied.


\subsubsection{Proof Support}

A binding (of appropriate type) is an element of the schema equivalence of two schemas iff the projection of the binding to the signature of the first operand is an element of the corresponding operand schema iff the projection of the binding to the signature of the second operand is an element of the second operand schema.

This rule is captured by the conversion $z_∈_⇔⋎s_conv$, which is built into the standard rewrites for proof context {\it z_language}.

=SML
rewrite_conv[]ⓩz ∈ (File ⇔ File2)⌝;
=TEX

=GFT ProofPower output
val it = ⊢ z ∈ (File ⇔ File2)
    ⇔ (age ≜ z.age, people ≜ z.people) ∈ File
    ⇔ (height ≜ z.height, people ≜ z.people) ∈ File2 : THM
=TEX


\subsection{Schema Existential}
\subsubsection{Syntax}

{\ftlmargin=0in\ftrmargin=0in
=GFT Z_TERM
	(* schema existential: ⓩ(∃ File3 | people = {} ⦁ File2)⦂𝕌⌝ *)
	
 |	⦏Z∃⋎s⦎		of TERM		(* declaration *)
			* TERM		(* predicate *)
			* TERM		(* schema expression *)
=TEX
}

The last operand must be a schema expressions with type compatible with the signature of the declaration.
The signature of the declaration part must be contained in the signature of the body.

An existential occurring at the outermost level in a term quotation is interpreted as a logical existential rather than a schema existential, unless a cast is applied.

\subsubsection{Proof Support}

The basic rule for schema existentials is the conversion $z_∈_∃⋎s_conv$, which is built into the standard rewrites for proof context {\it z_language}.

=SML
rewrite_conv[]ⓩz ∈ (∃ File3 | people = {} ⦁ File2)⌝;
=TEX

=GFT ProofPower output
val it = ⊢ z ∈ (∃ File3 | people = {} ⦁ File2)
    ⇔ (∃ x1 : 𝕌
      ⦁ ((people ≜ x1.people) ∈ File3
        ∧ x1.people = {})
        ∧ (height ≜ z.height, people ≜ x1.people) ∈ File2) : THM
=TEX

\subsection{Schema Unique Existence}
\subsubsection{Syntax}

{\ftlmargin=0in\ftrmargin=0in
=GFT Z_TERM
	(* schema unique existential: ⓩ(∃⋎1 File3 | people = {} ⦁ File2)⦂𝕌⌝ *)
	
 |	⦏Z∃⋎1⋎s⦎		of TERM		(* declaration *)
			* TERM		(* predicate *)
			* TERM		(* schema expression *)
=TEX
}

The last operand must be a schema expressions with type compatible with the signature of the declaration.
The signature of the declaration part must be contained in the signature of the body.

A unique existential occurring at the outermost level in a term quotation is interpreted as a logical existential rather than a schema existential, unless a cast is applied.

\subsubsection{Proof Support}

The basic rule for schema existentials is the conversion $z_∈_∃⋎1⋎s_conv$, which is built into the standard rewrites for proof context {\it z_language}.

=SML
rewrite_conv[]ⓩz ∈ (∃⋎1 File3 | people = {} ⦁ File2)⌝;
=TEX

=GFT ProofPower output
val it = ⊢ z ∈ (∃⋎1 File3 | people = {} ⦁ File2)
    ⇔ (∃⋎1 x1 : 𝕌
      ⦁ ((people ≜ x1.people) ∈ File3
        ∧ x1.people = {})
        ∧ (height ≜ z.height, people ≜ x1.people) ∈ File2) : THM
=TEX

\subsection{Schema Universal}
\subsubsection{Syntax}

{\ftlmargin=0in\ftrmargin=0in
=GFT Z_TERM
	(* schema universal: ⓩ(∀ File3 | people = {} ⦁ File2)⦂𝕌⌝ *)
	
 |	⦏Z∀⋎s⦎		of TERM		(* declaration *)
			* TERM		(* predicate *)
			* TERM		(* schema expression *)
=TEX
}

The last operand must be a schema expressions with type compatible with the signature of the declaration.
The signature of the declaration part must be contained in the signature of the body.

A universal occurring at the outermost level in a term quotation is interpreted as a logical universal rather than a schema universal, unless a cast is applied.

\subsubsection{Proof Support}

The basic rule for schema universals is the conversion $z_∈_∀⋎s_conv$, which is built into the standard rewrites for proof context {\it z_language}.

=SML
rewrite_conv[]ⓩz ∈ (∀ File3 | people = {} ⦁ File2)⌝;
=TEX

=GFT ProofPower output
val it = ⊢ z ∈ (∀ File3 | people = {} ⦁ File2)
    ⇔ (∀ x1 : 𝕌
      ⦁ (people ≜ x1.people) ∈ File3 ∧ x1.people = {}
        ⇒ (height ≜ z.height, people ≜ x1.people) ∈ File2) : THM
=TEX

\subsection{Decoration}
\subsubsection{Syntax}

{\ftlmargin=0in\ftrmargin=0in
=GFT Z_TERM
	(* decoration: ⓩ File ''⌝ *)
	
 |	⦏ZDecor⋎s⦎	of TERM		(* schema expression *)
 			* string		(* decoration *)
=TEX
}
\subsubsection{Proof Support}

The operation of decoration is extensionally characterised by $z_∈_dec⋎s_conv$ which is built into the proof context $z_language$.
=SML
rewrite_conv[]ⓩz ∈ File ''⌝;
=TEX

=GFT ProofPower output
val it = ⊢ z ∈ (File'') ⇔ (age ≜ z.age'', people ≜ z.people'') ∈ File : THM
=TEX

\subsection{Pre-Condition}
\subsubsection{Syntax}

{\ftlmargin=0in\ftrmargin=0in
=GFT Z_TERM
	(* pre-condition: ⓩ pre FileOp⌝ *)
	
 |	⦏ZPre⋎s⦎		of TERM		(* schema expression *)
=TEX
}
\subsubsection{Proof Support}

The operation of forming a pre-condition is extensionally characterised by $z_∈_pre⋎s_conv$ which is built into the proof context $z_language$.

=SML
once_rewrite_conv[]ⓩz ∈ (pre FileOp)⌝;
=TEX

=GFT ProofPower output
val it = ⊢ z ∈ (pre FileOp) ⇔
 z ∈	[age : 𝕌; i? : 𝕌; people : 𝕌
	| ∃ age' : 𝕌; people' : 𝕌 ⦁ FileOp] : THM
=TEX

Normally the membership of the horizontal schema thus introduced would be immediately eliminated.
Where a binding display or theta term is used selections are eliminated.

=SML
rewrite_conv[]ⓩ(age ≜ age, i? ≜ i?, people ≜ people) ∈ (pre FileOp)⌝;
=TEX

=GFT ProofPower output
val it = ⊢ (age ≜ age, i? ≜ i?, people ≜ people) ∈ (pre FileOp)
    ⇔ (∃ age' : 𝕌; people' : 𝕌 ⦁ FileOp) : THM
=TEX

\subsection{Schema Hiding}

\subsubsection{Syntax}

{\ftlmargin=0in\ftrmargin=0in
=GFT Z_TERM
 	(* schema hiding: ⓩ FileOp \⋎s (age, i?)⌝  *)
 	
 |	⦏ZHide⋎s⦎	of TERM		(* schema expression *)
 			* string list		(* component names *)
=TEX
}

This is entered into the source document as:
=GFTSHOW
ⓩ FileOp \⋎s (age, i?)⌝
=TEX

\subsubsection{Proof Support}

This is characterised by $z_∈_hide⋎s_conv$ which is built into the proof context $z_language$.

=SML
once_rewrite_conv[]ⓩz ∈ (File \⋎s (age))⌝;
=TEX

=GFT ProofPower output
val it = ⊢ z ∈ (File \⋎s (age)) ⇔ z ∈ [people : 𝕌 | ∃ age : 𝕌 ⦁ File] : THM
=TEX

Normally further membership eliminations, and possibly selection eliminations, will take place:

=SML
rewrite_conv[]ⓩ(people ≜ people) ∈ (File \⋎s (age))⌝;
=TEX

=GFT ProofPower output
val it = ⊢ (people ≜ people) ∈ (File \⋎s (age)) ⇔ (∃ age : 𝕌 ⦁ File) : THM
=TEX

\subsection{Schema Renaming}
\subsubsection{Syntax}

{\ftlmargin=0in\ftrmargin=0in
=GFT Z_TERM
	(* schema renaming: ⓩFile [aged/age, input/i?]⌝ *)
	
 |	⦏ZRename⋎s⦎	of TERM		(* schema expression *)
 			* (string * string) list	(* rename list *)
=TEX
}

\subsubsection{Proof Support}

Schema renaming is extensionally characterised by $z_∈_rename⋎s_conv$ which is built into the proof context $z_language$.

=SML
once_rewrite_conv[]ⓩz ∈ File[aged/age]⌝;
=TEX

=GFT ProofPower output
val it = ⊢ z ∈ (File [aged/age]) ⇔
	(age ≜ z.aged, people ≜ z.people) ∈ File : THM
=TEX

Normally further membership eliminations, and possibly selection eliminations, will take place:

=SML
rewrite_conv[]ⓩ(aged ≜ age, people ≜ people) ∈ File[aged/age]⌝;
=TEX

=GFT ProofPower output
val it = ⊢ (aged ≜ age, people ≜ people) ∈ (File [aged/age]) ⇔ File : THM
=TEX

\subsection{Schema Projection}
\subsubsection{Syntax}

{\ftlmargin=0in\ftrmargin=0in
=GFT Z_TERM
	(* schema projection: ⓩFileOp ↾⋎s File⌝*)
	
 |	⦏Z↾⋎s⦎		of TERM * TERM	(* schema expressions *)
=TEX
}
\subsubsection{Proof Support}

Schema projection is extensionally characterised by $z_∈_↾⋎s_conv$, which is built into proof context $z_language$.
=SML
once_rewrite_conv[]ⓩz ∈ (FileOp ↾⋎s File)⌝;
=TEX

=GFT ProofPower output
val it = ⊢ z ∈ (FileOp ↾⋎s File)
    ⇔ z ∈ ((FileOp ∧ File) \⋎s (age', i?, people')) : THM
=TEX

Normally further membership eliminations, and possibly selection eliminations, will take place:

=SML
rewrite_conv[]ⓩ(age ≜ age, people ≜ people) ∈ (FileOp ↾⋎s File)⌝;
=TEX

=GFT ProofPower output
val it = ⊢ (age ≜ age, people ≜ people) ∈ (FileOp ↾⋎s File)
    ⇔ (∃ age' : 𝕌; i? : 𝕌; people' : 𝕌 ⦁ FileOp ∧ File) : THM
=TEX

\subsection{Schema Composition}
\subsubsection{Syntax}

{\ftlmargin=0in\ftrmargin=0in
=GFT Z_TERM
	(* schema composition: ⓩFileOp ⨾⋎s FileOp⌝ *)
	
 |	⦏Z⨾⋎s⦎	of TERM * TERM	(* schema expressions *)
=TEX
}
\subsubsection{Proof Support}
Schema projection is extensionally characterised by $z_∈_⨾⋎s_conv$, which is built into proof context $z_language$.

=SML
once_rewrite_conv[]ⓩz ∈ (FileOp ⨾⋎s FileOp)⌝;
=TEX

=GFT ProofPower output
val it = ⊢ z ∈ (FileOp ⨾⋎s FileOp)
    ⇔ z
      ∈ [age : 𝕌; i? : 𝕌; people : 𝕌; age' : 𝕌; people' : 𝕌
        | ∃ x1 : 𝕌; x2 : 𝕌
          ⦁ (age ≜ age, age' ≜ x1, i? ≜ i?, people ≜ people, people' ≜ x2)
              ∈ FileOp
            ∧ (age ≜ x1, age' ≜ age', i? ≜ i?, people ≜ x2,
                  people' ≜ people')
              ∈ FileOp] : THM
=TEX
Normally further membership eliminations, and possibly selection eliminations, will take place:
=SML
rewrite_conv[]ⓩz ∈ (FileOp ⨾⋎s FileOp)⌝;
=TEX
=GFT ProofPower output
val it = ⊢ z ∈ (FileOp ⨾⋎s FileOp)
    ⇔ (∃ x1 : 𝕌; x2 : 𝕌
      ⦁ (age ≜ z.age, age' ≜ x1, i? ≜ z.i?, people ≜ z.people, people' ≜ x2)
          ∈ FileOp
        ∧ (age ≜ x1, age' ≜ z.age', i? ≜ z.i?, people ≜ x2,
              people' ≜ z.people')
          ∈ FileOp) : THM
=TEX

\subsection{$\Delta$}
\subsubsection{Syntax}

{\ftlmargin=0in\ftrmargin=0in
=GFT Z_TERM
	(* delta operation: ⓩΔFile⌝ *)
	
 |	⦏ZΔ⋎s⦎		of TERM		(* schema expression *)
=TEX
}

Delta is currently supplied in {\ProductZ} as a schema operator rather than a convention.

\subsubsection{Proof Support}
Delta is extensionally characterised by $z_∈_Δ⋎s_conv$, which is built into proof context $z_language$.

=SML
once_rewrite_conv[]ⓩz ∈ (ΔFile)⌝;
=TEX

=GFT ProofPower output
val it = ⊢ z ∈ (Δ File) ⇔ z ∈ [File; File'] : THM
=TEX

Normally further membership eliminations, and possibly selection eliminations, will take place:

=SML
rewrite_conv[]ⓩz ∈ (ΔFile)⌝;
=TEX
=GFT ProofPower output
val it = ⊢ z ∈ (Δ File)
    ⇔ (age ≜ z.age, people ≜ z.people) ∈ File
      ∧ (age ≜ z.age', people ≜ z.people') ∈ File : THM
=TEX

\subsection{$\Xi$}
\subsubsection{Syntax}

{\ftlmargin=0in\ftrmargin=0in
=GFT Z_TERM
	(* Ξ operation: ⓩΞFile⌝ *)
	
 |	⦏ZΞ⋎s⦎		of TERM		(* schema expression *)
=TEX
}

Rather than a convention, {\ProductZ} currently provides an operator.

\subsubsection{Proof Support}

This operation is extensionally characterised by $z_∈_Ξ⋎s_conv$, which is built into proof context $z_language$.

=SML
once_rewrite_conv[]ⓩz ∈ (ΞFile)⌝;
=TEX

=GFT ProofPower output
val it = ⊢ z ∈ (Ξ File) ⇔ z ∈ [File; File' | θFile = θFile'] : THM
=TEX

Normally further membership eliminations, and possibly selection eliminations, will take place:

=SML
rewrite_conv[]ⓩz ∈ (ΞFile)⌝;
=TEX
=GFT ProofPower output
val it = ⊢ z ∈ (Ξ File)
    ⇔ ((age ≜ z.age, people ≜ z.people) ∈ File
      ∧ (age ≜ z.age', people ≜ z.people') ∈ File)
      ∧ z.age = z.age'
      ∧ z.people = z.people' : THM
=TEX

}%\ftmargins

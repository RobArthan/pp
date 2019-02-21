=IGN
********************************************************************************
usr023_slides.doc: this file is part of the PPZed system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************

=TEX
% usr023_slides.doc   $Date: 2005/09/21 11:39:16 $ $Revision: 1.25 $ $RCSfile: usr023_slides.doc,v $
% COPYRIGHT (c) Lemma 1 Ltd.

\def\SCCSissue{$Revision: 1.25 $
}


\long\def\ignore#1{}

\newcounter{slidenum}
\setcounter{slidenum}{-1}
\def\Slide{%
\addtocounter{slidenum}{1}
\begin{slide}{\arabic{slidenum}}}

\underscoreoff
\ftlmargin=0.5in
% =====================================================================

\Slide
\vfill
\begin{center}

\vfill

{\huge Proof in Z}\\
with\\
{\huge \bf ProofPower}\\

\vfill

\end{center}

\end{slide}

% =====================================================================

\Slide
\begin{center}

{\bf Course Objectives}

\end{center}
\vfill

\begin{itemize}
\item
to describe the basic principles and concepts underlying ProofPower support for Z
\item
to enable the student to write simple specifications and undertake elementary proofs in Z using ProofPower
\item
to enable the student to make effective use of the reference documentation for ProofPower-Z
\end{itemize}
\vfill

\end{slide}

% =====================================================================

\Slide
\begin{center}

{\bf Course Outline}

\end{center}
\vfill

\begin{itemize}
\item
Introduction to ProofPower-Z

\item
The Z Predicate Calculus

\item
Expressions

\item
Schema Expressions

\item
Paragraphs and Theories

\item
The Z ToolKit

\item
Case Study

\end{itemize}
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}

{\bf Course Prerequisites}

\end{center}
\vfill

We assume a working knowledge of:
\begin{itemize}
\vfill
\item
Z as a specification language
\vfill
\item
the use of ProofPower with HOL
\end{itemize}
\vfill
{\small
{\ftlmargin=0.7in \ftrmargin=0.5in
=SML
open_theory "z_library";
new_theory "usr023";
new_parent(hd (get_cache_theories()));
set_pc "z_library";
=TEX
\vfill
ⓈZ
[NAME, DATE]
■
\vfill
=GFT Z
𝕌[X] ≜ X
=TEX
}%\ftlmargin
}%\small
\vfill
\end{slide}

% =====================================================================

{\ftlmargin=0.7in \ftrmargin=0.5in
\Slide
\begin{center}
{\bf Sample Schemas}
\end{center}
{\small
\vfill
┌File───────
│ people : ℙ NAME;
│ age : NAME ⇸ DATE
├────────
│ dom age = people
└──────────
\vfill
┌File2───────
│ people : ℙ NAME;
│ height : NAME ⇸ ℤ
├────────
│ dom height = people
└──────────
\vfill
┌File3───────
│ people : ℙ NAME
└──────────
\vfill
┌FileOp───────
│ File;File'; i?:ℕ
└──────────
}%\small
\vfill
\end{slide}
}%\ftlmargin

% =====================================================================

\Slide
\begin{center}
{\bf Useful Files}
\end{center}

\begin{itemize}
\item
usr023.dvi - these transparencies for use with previewer.
\item
usr023_slides.doc - transparencies source file.
\item
zed_course_work.doc - exercise ``work book''.
\item
zed_course_answers.doc - solutions to exercises.
\item
sun4example_zed.db - ProofPower database with material loaded in ready to do the exercises.
\end{itemize}

\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Reasoning in Z with ProofPower\\
Facilities `lifted' from HOL}
\end{center}

\vfill
\begin{itemize}
\item
Propositional Reasoning
\item
Predicate Calculus:
\begin{itemize}
\item
stripping
\item
forward chaining
\item
resolution (via $prove_tac$)
\end{itemize}
\item
basic rewriting
\item
basic integer arithmetic
\item
arithmetic computations
\end{itemize}
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Reasoning in Z\\
Areas for Future Enhancement}
\end{center}

\vfill
Function Application
\vfill
`set' inference
\vfill
Conditional Rewriting
\vfill
Consistency Proofs
\vfill
Performance Improvements
\vfill
Ease of Unfolding Definitions
\vfill
Methods which contain complexity
\vfill

\end{slide}

% =====================================================================

\Slide
\begin{center}
\vfill

{\bf Some Z Proofs are Easy with ProofPower}
\end{center}

\begin{itemize}
\item
propositional tautologies

{\tiny Propositional reasoning in Z is exactly the same as in HOL, fully automatic and well integrated into the normal proof methods.}

\item
first order predicate calculus

{\tiny As in HOL, predicate calculus proofs in Z are either automatic or routine.}

\item
elementary set theory

{\tiny A useful class of results from elementary set theory are automatically provable.}

\item
other classes of results

{\tiny Whenever a new theory is introduced one or more proof contexts may be developed to solve automatically a range of results in that theory.
``Decision procedures'' for such classes of results can be made available via ``prove_tac''.}
\end{itemize}
\vfill
\end{slide}

% =====================================================================


\Slide
\begin{center}

{\bf Simple Predicate Calculus Proofs}
\end{center}
\vfill
{\small

\begin{itemize}
\item
use the subgoaling package

\item
set the goal

=SML
open_theory"usr023";
set_pc "z_library";
set_goal([],ⓩ (∀x, y:X⦁ P x ⇒ R y)
	⇔ (∀v, w:X⦁ ¬ P w ∨ R v)⌝);
=TEX
\item
initiate proof by contradiction
=SML
a contr_tac;
=TEX
=GFT ProofPower output
Tactic produced 2 subgoals:
...
(*  5 *)  ⓩ ∀ x, y : X ⦁ P x ⇒ R y⌝
(*  4 *)  ⓩ v ∈ X⌝
(*  3 *)  ⓩ w ∈ X⌝
(*  2 *)  ⓩ P w⌝
(*  1 *)  ⓩ ¬ R v⌝

(* ?⊢ *)  ⓩ false⌝
=TEX
\item
instantiate assumptions as required
=SML
a (z_spec_asm_tac ⓩ ∀ x, y : X ⦁ P x ⇒ R y⌝
	ⓩ (x ≜ w, y ≜ v)⌝);
=TEX
\end{itemize}
\vfill
}%\small
\end{slide}

% =====================================================================

{\small
\Slide
\vfill
=GFT ProofPower output
Tactic produced 0 subgoals:
(* *** Goal "2" *** *)

(*  5 *)  ⓩ ∀ v, w : X ⦁ ¬ P w ∨ R v⌝
(*  4 *)  ⓩ x ∈ X⌝
(*  3 *)  ⓩ y ∈ X⌝
(*  2 *)  ⓩ P x⌝
(*  1 *)  ⓩ ¬ R y⌝

(* ?⊢ *)  ⓩ false⌝
=SML
a (z_spec_asm_tac ⓩ ∀ v, w : X ⦁ ¬ P w ∨ R v⌝
	ⓩ (v ≜ y, w ≜ x)⌝);
=GFT ProofPower output
Tactic produced 0 subgoals:
Current and main goal achieved
=SML
pop_thm();
=GFT ProofPower output
Now 0 goals on the main goal stack
val it = ⊢ (∀ x, y : X ⦁ P x ⇒ R y) ⇔
	(∀ v, w : X ⦁ ¬ P w ∨ R v) : THM
=TEX
\vfill
\end{slide}
}%\small

% =====================================================================

\Slide
\begin{center}
{\bf Exercises: 1}
\end{center}

\vfill
Log in;

start Motif Window manager (using {\tt openwin} command);

Select ``Z Course'' from the Root Menu;

Find Exercises 1 in zed_course_work.doc;

Execute the preliminary commands just before the Exercises;

Work through the exercises recording your solutions in
zed_course_work.doc.

\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}

{\bf The Z Language in ProofPower}

\end{center}

\vfill

{\ftlmargin=0.8in

\begin{itemize}
\item
HOL terms are used to represent Z.

\item
The ``concrete datatype'' {\bf Z_TERM} reveals\\
the structure of terms representing values in Z.

\item
The function:
=SML
dest_z_term : TERM -> Z_TERM;
=TEX
may be used to disassemble a TERM which represents Z, and
=SML
mk_z_term : Z_TERM -> TERM;
=TEX
may be used to construct a TERM representing a Z construct.
\end{itemize}

}%\ftlmargin

\vfill

\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Z Language Quotation}
\end{center}
\vfill
\begin{itemize}
\item
{\bf Z Term Quotations}

{\small
Predicates, expressions, and schema expressions may be entered in Z using the Z quotation character ``
=INLINEFT
ⓩ
=TEX
'', e.g.:
=INLINEFT
 ⓩ{x:ℤ | x>0 ⦁ x*x}⌝
=TEX
.
}%\small

\vfill

\item
{\bf Extended Z}

{\small
ProofPower accepts an extended Z language for convenience in formal proof, provided that the system control flag $standard_z_terms$ is set to $false$.
}%\small

\vfill

\item
{\bf Standard Z}

{\small
Eventually we intend ProofPower to be prepared to check fully against the forthcoming Z standard.
}%\small

{\tiny
The norm would then be to check specifications against the standard, but permit the extended language for use in proofs.
}%\tiny

\end{itemize}

\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}

{\bf Special Extensions}

\end{center}

\vfill

\begin{itemize}

\item 𝕌
=GFT Z
𝕌[X] ≜ X
=TEX
may be used to avoid explicit typing, or to ensure quantification over entire types rather than sets.

\vfill

\item
$⦂$, which type checks like $∈$ (and means the same thing).
When used infix $⦂$ and its right hand operand are discarded.
It may therefore be used to force the type of an expression without otherwise changing its value.

\vfill

\item
$Π$ which take a single operand and creates a context in which a predicate is required.
Π is discarded after parsing and type-checking.

\end{itemize}

\vfill
\end{slide}

% =====================================================================

\ftlmargin=0in
\Slide
\begin{center}

{\bf The Z Language in ProofPower\\
declarations}

\end{center}

\vfill
{\tiny
=GFT
datatype	⦏Z_TERM⦎ =

   ⦏ZLVar⦎	(* local variable ⓩ x⌝ *)
 		of string	(* variable name *)
 		* TYPE	(* HOL type of variable *)
 		* TERM list	(* generic parameters *)
 | ⦏ZGVar⦎ 	(* global variable ⓩ 𝕌[DATE]⌝ *)
 		of string	(* variable name *)
 		* TYPE	(* HOL type of variable *)
 		* TERM list	(* generic parameters *)

 | ⦏ZInt⦎ 	(* positive integer literal ⓩ 34⌝ *)
 		of string
 | ⦏ZString⦎	(* string literal ⓩ "characters"⌝ *)
 		of string

 | ⦏ZDec⦎		(* declaration, e.g.
   			ⓜdec_of ⓩ[x,y:ℤ]⌝⌝ *)
  		of TERM list	(* variables *)
  		* TERM		(* expression *)
 | ⦏ZSchemaDec⦎ 	(* schema reference, e.g.
 			ⓜdec_of ⓩ[File!]⌝⌝ *)
		of TERM	(*schema expression*)
		* string		(* decoration *)
 | ⦏ZDecl⦎ 	(* declaration list, e.g.
 			ⓜdecl_of ⓩ[x,y:ℤ; File!]⌝⌝ *)
		of TERM list	(* declarations *)
=TEX
}%\tiny
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Local Variables}
\end{center}
\vfill

Used in variable binding constructs (e.g. quantifiers)

Free variables used in proofs of universal assertions, or in using existential assumptions (by `skolemisation').

ProofPower allows `generic' local variables.

\vfill
\begin{center}
{\bf Global Variables (i.e. constants)}
\end{center}
\vfill

These are introduced and constrained by various paragraphs.

Subsequent reasoning relies upon utilisation of predicates explicit or implicit in defining paragraph (see later).

\vfill

\end{slide}

% =====================================================================

\ftlmargin=0.5in
\Slide
\begin{center}
{\bf Integer Literals}
\end{center}

\vfill

Evaluation of arithmetic expressions involving Integer Literals is built into appropriate proof contexts.

\vfill


=SML
rewrite_conv [] ⓩ543*20⌝;
=GFT ProofPower output
val it = ⊢ 543 * 20 = 10860 : THM
=TEX

\vfill

\begin{center}
{\bf String Literals}
\end{center}

\vfill

These are supported by the conversion $z_string_conv$ which converts a string literal into a sequence of HOL character literals:

\vfill

=SML
z_string_conv ⓩ"string"⌝;
=TEX
=GFT ProofPower output
val it = ⊢ "string" =
⟨⌜`s`⌝, ⌜`t`⌝, ⌜`r`⌝, ⌜`i`⌝, ⌜`n`⌝, ⌜`g`⌝⟩ : THM
=TEX

\vfill

\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Declarations}
\end{center}

\vfill

Conversion $z_dec_pred_conv$ converts a declaration into its implicit predicate:

\vfill

=SML
val pred2 = z_dec_pred_conv
	(dec_ofⓩ[x, y : ℤ]⌝);
=GFT ProofPower output
val pred2 = ⊢ ⓜdec_ofⓩ[x, y : ℤ]⌝⌝
	⇔ {x, y} ⊆ ℤ : THM
=TEX

\vfill

\begin{center}
{\bf Declaration Lists}
\end{center}

\vfill

Conversion $z_decl_pred_conv$ converts a declaration list into its implicit predicate:

\vfill

=SML
val pred4 = z_decl_pred_conv
	(decl_ofⓩ[x, y : ℤ; File!]⌝);
=GFT ProofPower output
val pred4 = ⊢ ⓜdecl_ofⓩ[x, y : ℤ; File!]⌝⌝
  ⇔ {x, y} ⊆ ℤ ∧ (File!) : THM
=TEX

\vfill

\end{slide}

% =====================================================================

\Slide
\begin{center}

{\bf The Z Language in ProofPower\\
propositional connectives}

\end{center}
\vfill
{\tiny
=GFT
 | ⦏ZTrue⦎	(* ⓩ true⌝ *)

 | ⦏ZFalse⦎	(* ⓩ false⌝ *)

 | ⦏Z¬⦎	(* negation, e.g. ⓩ ¬ p⌝ *)
 	of TERM	(* predicate *)

 | ⦏Z∧⦎	(* conjunction, e.g. ⓩ p ∧ q⌝ *)
 	of TERM * TERM	(* predicates *)

 | ⦏Z∨⦎	(* disjunction, e.g. ⓩ p ∨ q⌝ *)
 	of TERM * TERM	(* predicates *)

 | ⦏Z⇒⦎	(* implication, e.g. ⓩ p ⇒ q⌝ *)
 	of TERM * TERM 	(* predicates *)

 | ⦏Z⇔⦎	(* bi-implication, e.g. ⓩ p ⇔ q⌝ *)
 	of TERM * TERM 	(* predicates *)
=TEX
}%\tiny
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Propositional Reasoning
\end{center}
\vfill
{\small
\begin{itemize}
\item assume rule:
=SML
open_theory "usr023";
val thm1 = asm_rule ⓩ ∀x, y:ℕ⦁ x*y > 0⌝;
=GFT ProofPower Output
val thm1 = ∀ x, y : ℕ ⦁ x * y > 0
	⊢ ∀ x, y : ℕ ⦁ x * y > 0 : THM
=TEX
\item modus ponens
=SML
val thm_a = asm_rule ⓩ a ⦂ 𝔹⌝;
val thm_b = asm_rule ⓩ a⇒b⌝;
=GFT ProofPower Output
val thm_a = a ⊢ a : THM
val thm_b = a ⇒ b ⊢ a ⇒ b : THM
=SML
val thm_c = ⇒_elim thm_b thm_a;
=GFT ProofPower Output
val thm_c = a ⇒ b, a ⊢ b : THM
=TEX
\end{itemize}
}%\small
\vfill
\end{slide}

% =====================================================================

\ftlmargin=0in
\Slide
\begin{center}

{\bf The Z Language in ProofPower\\
quantifiers and relations}

\end{center}
\vfill
{\tiny
=GFT
 | ⦏ZEq⦎	(* equation, e.g. ⓩ a = b⌝ *)
 		of TERM * TERM	(* expressions *)


 | ⦏Z∈⦎	(* membership, e.g. ⓩ a ∈ b⌝ *)
		of TERM * TERM	(* expressions *)


 | ⦏ZSchemaPred⦎	(* schema predicate, e.g.
 			ⓩ Π (File ')⌝ *)
 		of TERM		(* schema expression *)
 		* string		(* decoration *)

 | ⦏Z∃⦎	(* existential quantification, ⓩ ∃ File | p ⦁ q⌝ *)
 		of TERM		(* declaration *)
 		* TERM * TERM	(* predicates *)


 | ⦏Z∃⋎1⦎	(* unique existential quantification, ⓩ ∃⋎1 File | p ⦁ q⌝ *)
 		of TERM		(* declaration *)
 		* TERM * TERM	(* predicates *)


 | ⦏Z∀⦎	(* universal quantification, ⓩ ∀ File | p ⦁ q⌝ *)
		of TERM		(* declaration *)
		* TERM * TERM	(* predicates *)

=TEX
}%\tiny

\vfill
\end{slide}

% =====================================================================

\ftlmargin=0.5in
\Slide
\begin{center}

{\bf Schema Predicates}

\end{center}

\vfill

These are be eliminated in favour of membership statements when rewriting with $z_library$:

\vfill
=SML
once_rewrite_conv[]ⓩ Π(([x:X])')⌝;
=TEX
=GFT ProofPower outputval
val it = ⊢ (([x : X])') ⇔
       (x ≜ x') ∈ [x : X] : THM
=TEX
\vfill
The proof context $z_library$ which will also eliminate the resulting horizontal schema.
\vfill
=SML
rewrite_conv[]ⓩ Π(([x:X])')⌝;
=TEX
\vfill
=GFT ProofPower outputval
val it = ⊢ (([x : X])') ⇔
           x' ∈ X : THM
=TEX
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Reasoning with Quantifiers\\
Specialisation (I)
\end{center}
\vfill
\begin{itemize}
\item most commonly a binding display is used
=SML
z_∀_elim ⓩ (x≜455, y≜32)⌝ thm1;
=GFT ProofPower Output
val it = ∀ x, y : ℕ ⦁ x * y > 0
 ⊢ {455, 32} ⊆ ℕ ∧ true ⇒
            455 * 32 > 0 : THM
=TEX
\item any binding expression is acceptable
=SML
z_∀_elim ⓩ exp⦂[x,y:ℕ]⌝ thm1;
=GFT ProofPower Output
val it = ∀ x, y : ℕ ⦁ x * y > 0
  ⊢ {exp.x, exp.y} ⊆ ℕ ∧ true
      ⇒ exp.x * exp.y > 0 : THM
=TEX
\end{itemize}
\vfill
The signatures of the bindings must match the signature of the declaration exactly.
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Reasoning with Quantifiers
Specialisation (II)
\end{center}
\vfill
\begin{itemize}
\item where the signature of the declaration contains only a single name an expression which has the same type as that name may be offered:
=SML
z_∀_elim ⓩ 45⌝ z_ℕ_¬_plus1_thm;
=GFT ProofPower Output
val it = ⊢ 45 ∈ ℕ ∧ true
	⇒ ¬ 45 + 1 = 0 : THM
=TEX
\end{itemize}
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Goal Oriented Proof}
\end{center}
\vfill
{\small
\begin{itemize}
\item
Works exactly the same as for HOL.
\item
Make sure you are in a Z theory.
\item
Make sure you have a Z proof context.
\item
Terms should be entered using Z quotes
=INLINEFT
ⓩ ⌝
=TEX
.
\end{itemize}
}%\small
\vfill
\begin{center}
\bf Tactics for Quantifiers
\end{center}
\vfill
\begin{itemize}
\item
$z_strip_tac$:
{\small
\begin{itemize}
\item
eliminates outer universals in conclusions
\item
skolemises existential assumptions
\item
pushes in outer negations over universal conclusions
\item
pushes in outer negations over existential assumptions
\end{itemize}
}%\small
\item
$z_spec_nth_asm_tac$:

specialises universal assumptions
\item
$z_∃_tac$

eliminates existential conclusions
\end{itemize}
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Rewriting}
\vfill

Use same facilities as for HOL in appropriate proof contexts.

Most rewrites arising from axiomatic descriptions are effectively conditional, and the conditions must be discharged to achieve the rewrite.

Forward chaining is often an appropriate way to achieve such conditional rewriting.

\vfill
{\bf Chaining}
\vfill

In appropriate proof contexts forward chaining facilities with $all$ in name work and stay in Z.
Other variants are liable to introduce hol universals.
\vfill
\end{center}

\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Rewriting by Chaining - example}
\end{center}
\vfill
{\small
$z_abs_thm$ is :
=GFT
⊢ ∀ i : ℕ ⦁ abs i = i ∧ abs ~ i = i
=TEX
Which, because quantified over $ℕ$, is effectively a $conditional$ rewrite.
\vfill
The proof of:
\vfill
=SML
set_goal([],ⓩ∀ a : ℕ ⦁ (abs a)*(abs ~a) = a*a⌝);
=TEX
is therefore complicated by the need to establish the necessary conditions for rewriting with $z_abs_thm$.
\vfill

First we strip the goal:
=SML
a (REPEAT z_strip_tac);
=GFT ProofPower output
(*  1 *)  ⓩ0 ≤ a⌝

(* ?⊢ *)  ⓩabs a * abs ~ a = a * a⌝
=TEX
Which places the necessary information in the assumptions.
}%\small
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Rewriting by Chaining - example continued}
\end{center}
\vfill
{\small

Then we use forward chaining to establish unconditional equations:
\vfill
=SML
a (all_fc_tac [z_abs_thm]);
=GFT ProofPower output
(*  3 *)  ⓩ0 ≤ a⌝
(*  2 *)  ⓩabs a = a⌝
(*  1 *)  ⓩabs ~ a = a⌝

(* ?⊢ *)  ⓩabs a * abs ~ a = a * a⌝
=TEX
\vfill
Then rewrite with these equations:
\vfill
=SML
a (asm_rewrite_tac[]);
pop_thm();
=TEX
(which solves the goal)
\vfill
}%\small
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Exercises 2: Predicate Calculus
\end{center}

\vfill
Try Exercises 2 in zed_course_work.doc.
\vfill
Hints and further exercises may be found in section 7.1 of
the Z Tutorial Manual.
\vfill

\end{slide}


% =====================================================================

\ftlmargin=0in
\Slide
\begin{center}

{\bf The Z Language in ProofPower\\
expressions}

\end{center}

\vfill

{\tiny
=GFT
 | ⦏ZApp⦎	(* function application  ⓩ f x⌝  *)
 		of TERM * TERM	(* expressions *)
 | ⦏Zλ⦎	(* lambda expression ⓩ λ x:ℕ | x > 3 ⦁ x * x ⌝ *)
 		of TERM	(* declaration *)
 		* TERM	(* predicate *)
 		* TERM	(* expression *)
 | ⦏Zμ⦎	(* definite description ⓩ μ x:ℕ | x * x = 4 ⦁ x⌝ *)
 		of TERM	(* declaration *)
 		* TERM	(* predicate *)
		* TERM	(* expression *)
 | ⦏ZLet⦎	(* let expression ⓩ let x ≜ 9 ⦁ (x, x+x) ⌝ *)
 		of (string * TERM) list	(* local definitions *)
 		* TERM	(* expression *)
 | ⦏Zℙ⦎	(* power set construction, ⓩ ℙ ℤ⌝ *)
 	of TERM		(* expression *)
 | ⦏ZSetd⦎	(* set display, ⓩ {1,2,3,4} ⌝ *)
 	of TYPE		(* HOL type of elements *)
 	* TERM list	(* expressions *)
 | ⦏ZSeta⦎	(* set abstraction, ⓩ {x:ℤ | 1≤x≤4 ⦁ x*x} ⌝*)
 	of TERM	(* declaration *)
 	* TERM	(* predicate *)
 	* TERM	(* expression *)
=TEX
}%\tiny

\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}

{\bf The Z Language in ProofPower\\
expressions (continued)}

\end{center}

\vfill

{\tiny
=GFT
 | ⦏ZTuple⦎	(* tuple displays, ⓩ (1,2,3,4) ⌝ *)
 	of TERM list	(* expressions *)
 | ⦏ZSel⋎t⦎	(* tuple element selection, ⓩ (x,y).2⌝ *)
 	of TERM	(* expression *)
 	* int		(* element number *)
 | ⦏Z×⦎	(* cartesian product, ⓩ (ℤ × ℕ) ⌝ *)
 	of TERM list	(* expressions *)
 | ⦏ZBinding⦎ (* binding displays ⓩ (people ≜ {}, age ≜ {}) ⌝ *)
 	of (	string	(* component name *)
 		* TERM	(* component value *)
 		) list
 | ⦏Zθ⦎	(* theta term ⓩ θFile' ⌝ *)
 	of TERM	(* schema expression *)
 	* string	(* decoration *)
 | ⦏ZSel⋎s⦎	(* binding component selection ⓩ (a ≜ 1, b ≜ "4").b ⌝ *)
 	of TERM	(* expression *)
 	* string	(* component name *)
 | ⦏Z⋎s⦎	(* horizontal schema expression
 		ⓩ [x:ℤ | x>0] ⌝ *)
		of TERM	(* declaration *)
		* TERM	(* predicate *)
 | ⦏Z⟨⟩⦎	(* sequence display ⓩ ⟨1,2,3⟩ ⌝ *)
 	of TYPE	(* type of elements *)
 	* TERM list	(* values of elements *)
=TEX
}%\tiny

\vfill
\end{slide}

% =====================================================================
\ftlmargin=0.5in
{\small
% =====================================================================

\Slide
\begin{center}

{\bf Function Application (I)}

\end{center}

{\small
\vfill

Applications of lambda abstractions can be eliminated by (conditional) β-conversion.

=SML
z_β_conv ⓩ (λ x:X | P x ⦁ f x) a⌝;
=GFT ProofPower outputval
val it = P a, a ∈ X ⊢
	(λ x : X | P x ⦁ f x) a = f a : THM
=TEX
\vfill

Other applications may be eliminated in favour of definite descriptions.

=SML
z_app_conv ⓩ f a⌝;
=GFT ProofPower output
val it = ⊢ f a = μ f_a : 𝕌
	| (a, f_a) ∈ f ⦁ f_a : THM
=TEX

More commonly function applications will be eliminated by rewriting with their definitions.

}%\small
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}

{\bf Function Application (II)}

\end{center}

\vfill
For low level reasoning $z_app_eq_tac$ is useful:
=SML
set_goal([],ⓩ f a = v⌝);
a z_app_eq_tac;
=GFT ProofPower output
...
(* ?⊢ *) ⓩ(∀ f_a : 𝕌 | (a, f_a) ∈ f ⦁ f_a = v)
  ∧ (a, v) ∈ f⌝
...
=TEX
Here the first conjunct expresses the requirement that $f$ is functional at $a$.

If f is known to be a function this fact may be used more directly with the assistance of the theorem $z_fun_app_clauses$:
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

Which is most conveniently appplied using forward chaining.
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}

{\bf Function Application (III)}

\end{center}

{\tiny
\vfill
=SML
drop_main_goal();
set_goal([], ⓩf ∈ ℕ ↠ ℤ ⇒
    (4, ~45) ∈ f ⇒ f 4 = ~45⌝);
a (REPEAT z_strip_tac);
=GFT ProofPower output
(*  2 *)  ⓩf ∈ ℕ ↠ ℤ⌝
(*  1 *)  ⓩ(4, ~ 45) ∈ f⌝

(* ?⊢ *)  ⓩf 4 = ~ 45⌝
=TEX
\vfill
=SML
a (all_fc_tac [z_fun_app_clauses]);
pop_thm();
=TEX
\vfill
=GFT ProofPower output
Tactic produced 0 subgoals:
Current and main goal achieved
=TEX
\vfill

Often it is necessary to establish that a function application is a member of a set.

The theorem $z_fun_∈_clauses$ is of assistance in such cases:
=GFT
val z_fun_∈_clauses = ⊢
 ∀ f : 𝕌; x : 𝕌; X : 𝕌; Y : 𝕌
 ⦁ ((f ∈ X → Y ∨ f ∈ X ↣ Y ∨ f ∈ X ↠ Y ∨ f ∈ X ⤖ Y)
    ∧ x ∈ X ⇒ f x ∈ Y)
 ∧ ((f ∈ X ⇸ Y ∨ f ∈ X ⤔ Y ∨ f ∈ X ⤀ Y)
     ∧ x ∈ dom f ⇒ f x ∈ Y) : THM
=TEX
\vfill
}%\tiny
\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Function Application (IV)}
\end{center}
This too is best applied using forward chaining:
=SML
set_goal([],
 ⓩ[X](∀ b: bag X⦁ count[X] b ∈ X → ℕ)⌝);
a (REPEAT z_strip_tac);
=GFT ProofPower output
(*  1 *)  ⓩb ∈ bag X⌝

(* ?⊢ *)  ⓩcount[X] b ∈ X → ℕ⌝
=TEX
We need the information from the declaration of $count$:
=SML
a (strip_asm_tac (z_gen_pred_elim
   [ⓩX⌝] (z_get_spec ⓩcount⌝)));
=GFT ProofPower output
(*  3 *)  ⓩb ∈ bag X⌝
(*  2 *)  ⓩcount[X] ∈ bag X ⤖ X → ℕ⌝
...
(* ?⊢ *)  ⓩcount[X] b ∈ X → ℕ⌝
=TEX
Now we can forward chain:
=SML
a (all_fc_tac [z_fun_∈_clauses]);
val bag_lemma1 = pop_thm ();
=GFT ProofPower output
Tactic produced 0 subgoals:
Current and main goal achieved
...
=TEX
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}

{\bf Lambda Abstraction}

\end{center}

\vfill

For extensional reasoning:

=SML
rewrite_conv [] ⓩz ∈ (λ x:X | P x ⦁ f x)⌝;
=TEX
=GFT ProofPower outputval
val it = ⊢ z ∈ λ x : X | P x ⦁ f x ⇔
	z.1 ∈ X ∧ P z.1 ∧ f z.1 = z.2 : THM
=TEX

Lambda abstractions may be transformed into set abstractions.

=SML
z_λ_conv ⓩ λ x:X | P x ⦁ f x⌝;
=GFT ProofPower outputval
val it = ⊢ λ x : X | P x ⦁ f x =
	{x : X | P x ⦁ (x, f x)} : THM
=TEX

\vfill
\end{slide}

% =====================================================================

\Slide
\vfill

\begin{center}

{\bf Definite Description}

\end{center}

\vfill
=SML
z_μ_rule ⓩ μ x:X | P ⦁ y ⌝;
=GFT ProofPower output
val it = ⊢ ∀ x' : 𝕌
    ⦁ (∀ x : X | P ⦁ y = x')
    ∧ (∃ x : X | P ⦁ y = x')
      ⇒ (μ x : X | P ⦁ y) = x' : THM
=TEX
\vfill

\begin{center}

{\bf Let Expression}

\end{center}

\vfill
=SML
z_let_conv ⓩ let x ≜ 9 ⦁ (x, x + x) ⌝;
=GFT ProofPower output
val it = ⊢
	(let x ≜ 9 ⦁ (x, x + x)) = (9, 9 + 9) : THM
=TEX
\vfill

\end{slide}

% =====================================================================

\Slide
\begin{center}

{\bf The Power Set Constructor}

\end{center}

\vfill

=SML
z_∈_ℙ_conv ⓩ z ∈ ℙ y⌝;
=GFT ProofPower output
val it = ⊢ z ∈ ℙ y ⇔
	(∀ x1 : 𝕌 ⦁ x1 ∈ z ⇒ x1 ∈ y) : THM
=TEX

\vfill

=SML
rewrite_conv[] ⓩ z ∈ ℙ y⌝;
=GFT ProofPower output
val it = ⊢ z ∈ ℙ y ⇔ z ⊆ y : THM
=TEX

\vfill

=SML
rewrite_conv[z_⊆_thm] ⓩ z ∈ ℙ y⌝;
=GFT ProofPower output
val it = ⊢ z ∈ ℙ y
	⇔ (∀ x : 𝕌 ⦁ x ∈ z ⇒ x ∈ y) : THM
=TEX

\vfill

\end{slide}

% =====================================================================

\Slide
\begin{center}

{\bf Set Displays}

\end{center}

\vfill

{\small
\begin{itemize}
\item
sets may be entered as terms by enumeration:
=SML
rewrite_conv [] ⓩ 5 ∈ {1,2,3,4,5}⌝;
=GFT ProofPower output
val it = ⊢ 5 ∈ {1, 2, 3, 4, 5} ⇔ true : THM
=TEX

\vfill

=SML
rewrite_conv [] ⓩ x ∈ {1,2,3,4,5}⌝;
=GFT ProofPower output
val it = ⊢ x ∈ {1, 2, 3, 4, 5} ⇔
 x = 1 ∨ x = 2 ∨ x = 3 ∨ x = 4 ∨ x = 5 : THM
=TEX
\end{itemize}
}%\small

\vfill

\end{slide}

% =====================================================================

\Slide
\begin{center}

{\bf Set Abstractions}

\end{center}

\vfill
{\small
\begin{itemize}
\item
sets may also be entered as set abstractions:
=SML
rewrite_conv[] ⓩ 9 ∈ {x:ℕ | x < 12}⌝;
=GFT ProofPower output
val it =
⊢ 9 ∈ {x : ℕ | x < 12} ⇔ 9 ∈ ℕ ∧ 9 < 12 : THM
=SML
rewrite_conv[]ⓩ z ∈ {x, y:ℕ | x < y}⌝;
=GFT ProofPower Output
val it = ⊢ z ∈ {x, y : ℕ | x < y}
 ⇔ {z.1, z.2} ⊆ ℕ ∧ z.1 < z.2 : THM
=TEX
=SML
rewrite_conv[]ⓩ z ∈ {x, y:ℕ | x < y ⦁ x * y - x}⌝;
=GFT ProofPower Output
val it = ⊢ z ∈ {x, y : ℕ | x < y ⦁ x * y - x}
    ⇔ (∃ x, y : ℕ | x < y ⦁ x * y - x = z) : THM
=TEX
\end{itemize}
}%\small

\vfill

\end{slide}

% =====================================================================

{\small
\Slide
\begin{center}

{\bf Tuples}

\end{center}

\vfill

=SML
rewrite_conv[] ⓩ (x,y) = (a,b)⌝;
=GFT ProofPower output
val it = ⊢ (x, y) = (a, b)
	⇔ x = a ∧ y = b : THM
=TEX

\vfill

=SML
rewrite_conv[] ⓩ (x,y).1⌝;
=GFT ProofPower output
val it = ⊢ (x, y).1 = x : THM
=TEX

\vfill

\begin{center}

{\bf Bindings}

\end{center}

\vfill

=SML
rewrite_conv[]
	ⓩ (x ≜ a, y ≜ b) = (y ≜ d, x ≜ c)⌝;
=GFT ProofPower output
val it = ⊢ (x ≜ a, y ≜ b) = (x ≜ c, y ≜ d)
	⇔ a = c ∧ b = d : THM
=TEX

=SML
rewrite_conv[] ⓩ (x ≜ a, y ≜ b).y⌝;
=GFT ProofPower output
val it = ⊢ (x ≜ a, y ≜ b).y = b : THM
=TEX

\vfill

\end{slide}

% =====================================================================

\Slide
\begin{center}

{\bf Cartesian Products}

\end{center}

\vfill
=SML
rewrite_conv[] ⓩ (a, b) ∈ (x × y)⌝;
=GFT ProofPower output
val it = ⊢ (a, b) ∈ x × y
	⇔ a ∈ x ∧ b ∈ y : THM
=TEX

=SML
rewrite_conv[z_sets_ext_thm]
	ⓩ (x × y) = (a × b)⌝;
=GFT ProofPower output
it = ⊢ x × y = a × b
	⇔	(∀ z : 𝕌 ⦁ z.1 ∈ x ∧ z.2 ∈ y
    		⇔ z.1 ∈ a ∧ z.2 ∈ b) : THM
=TEX
\vfill

\begin{center}

{\bf Theta Terms}

\end{center}
\vfill

=SML
z_θ_conv ⓩ θFile'⌝;
=GFT ProofPower output
val it = ⊢ θFile' =
  (age ≜ age', people ≜ people') : THM
=SML
rewrite_conv[z'θ_def] ⓩ θFile'⌝;
=GFT ProofPower output
val it = ⊢ θFile' =
  (age ≜ age', people ≜ people') : THM
=TEX
\vfill

\end{slide}


% =====================================================================

\Slide
\begin{center}

{\bf Binding Component Selection}

\end{center}

\vfill
Projection from binding displays is built in to proof context $z_language$.
\vfill

=SML
rewrite_conv[] ⓩ (x ≜ a, y ≜ b).y⌝;
=GFT ProofPower output
val it = ⊢ (x ≜ a, y ≜ b).y = b : THM
=TEX
\vfill

Projection from theta terms is also built in to proof context $z_language$.
\vfill
=SML
rewrite_conv[] ⓩ (θFile').age⌝;
=GFT ProofPower output
val it = ⊢ (θFile').age = age' : THM
=TEX
\vfill

\end{slide}


% =====================================================================

\Slide
\begin{center}

{\bf Horizontal Schemas}

\end{center}

\vfill
=SML
rewrite_conv[]ⓩz ∈ [x:ℤ;y:ℕ]⌝;
=TEX

=GFT ProofPower output
val it = ⊢ z ∈ [x : ℤ; y : ℕ]
	⇔ z.x ∈ ℤ ∧ z.y ∈ ℕ : THM
=TEX
\vfill
=SML
rewrite_conv[]ⓩ(x ≜ a, y ≜ b) ∈ [x:ℤ;y:ℕ]⌝;
=TEX

=GFT ProofPower output
val it = ⊢ (x ≜ a, y ≜ b) ∈ [x : ℤ; y : ℕ]
	⇔ a ∈ ℤ ∧ b ∈ ℕ : THM
=TEX

\vfill

\begin{center}
{\bf Sequence Displays}
\end{center}

\vfill

=SML
z_⟨⟩_conv ⓩ⟨a,b,c⟩⌝;
=TEX

=GFT ProofPower output
val it = ⊢ ⟨a, b, c⟩ = {(1, a), (2, b), (3, c)} : THM
=TEX

\vfill
=SML
once_rewrite_conv[]ⓩz ∈ ⟨a,b,c⟩⌝;
=TEX

=GFT ProofPower output
val it = ⊢ z ∈ ⟨a, b, c⟩ ⇔
	z ∈ {(1, a), (2, b), (3, c)} : THM
=TEX
\vfill

\end{slide}


% =====================================================================

\Slide

{\normalsize
\begin{center}
{\bf Exercises 3: Expressions}
\end{center}

\vfill
Try Exercises 3 in zed_course_work.doc.
\vfill
Hints and further exercises may be found in section 7.2.1  of
the Z Tutorial Manual.
\vfill
}%\normalsize
\end{slide}

% =====================================================================

\ftlmargin=0in
\Slide
\begin{center}

{\bf The Z Language in ProofPower\\
schema expressions (I)}

\end{center}

\vfill

{\tiny
=GFT
 | ⦏Z¬⋎s⦎	(* schema negation ⓩ(¬ File)⦂𝕌⌝ *)
		of TERM (* schema expression *)
 | ⦏Z∧⋎s⦎	(* schema conjunction ⓩ(File ∧ File2)⦂𝕌⌝ *)
		of TERM * TERM (* schema expressions *)
 | ⦏Z∨⋎s⦎	(* schema disjunction ⓩ(File ∨ File2)⦂𝕌⌝ *)
		of TERM * TERM (* schema expressions *)
 | ⦏Z⇒⋎s⦎	(* schema implication ⓩ(File ⇒ File2)⦂𝕌⌝ *)
		of TERM * TERM (* schema expressions *)
 | ⦏Z⇔⋎s⦎	(* schema equivalence ⓩ(File ⇔ File2)⦂𝕌⌝ *)
		of TERM * TERM (* schema expressions *)
 | ⦏Z∃⋎s⦎	(* schema existential
 		ⓩ(∃ File3 | people = {} ⦁ File2)⦂𝕌⌝ *)
		of TERM	(* declaration *)
		* TERM	(* predicate *)
		* TERM	(* schema expression *)
 | ⦏Z∃⋎1⋎s⦎	(* schema unique existential
 		ⓩ(∃⋎1 File3 | people = {} ⦁ File2)⦂𝕌⌝ *)
		of TERM	(* declaration *)
		* TERM	(* predicate *)
		* TERM	(* schema expression *)
 | ⦏Z∀⋎s⦎	(* schema universal
 		ⓩ(∀ File3 | people = {} ⦁ File2)⦂𝕌⌝ *)
		of TERM	(* declaration *)
		* TERM	(* predicate *)
		* TERM	(* schema expression *)
=TEX
}%\tiny

\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}

{\bf The Z Language in ProofPower\\
schema expressions (II)}

\end{center}

\vfill

{\tiny
=GFT
 | ⦏ZDecor⋎s⦎ (* decoration ⓩ File ''⌝ *)
 		of TERM	(* schema expression *)
 		* string	(* decoration *)
 | ⦏ZPre⋎s⦎	(* pre-condition ⓩ pre FileOp⌝ *)
 		of TERM	(* schema expression *)
 | ⦏ZHide⋎s⦎	(* schema hiding ⓩ FileOp \⋎s (age, i?)⌝  *)
 		of TERM	(* schema expression *)
 		* string list	(* component names *)
 | ⦏ZRename⋎s⦎ (* schema renaming
 			ⓩFile [aged/age, input/i?]⌝ *)
 		of TERM	(* schema expression *)
 		* (string * string) list	(* rename list *)
 | ⦏Z↾⋎s⦎	(* schema projection ⓩFileOp ↾⋎s File⌝*)
 		of TERM * TERM	(* schema expressions *)
 | Z⨾⋎s	(* schema composition ⓩΔFile ⨾⋎s ΔFile⌝ *)
 		of TERM * TERM	(* schema expressions *)
 | ⦏ZΔ⋎s⦎	(* delta operation ⓩΔFile⌝ *)
 		of TERM	(* schema expression *)
 | ⦏ZΞ⋎s⦎	(* Ξ operation ⓩΞFile⌝ *)
 		of TERM	(* schema expression *)
;
=TEX
}%\tiny

\vfill
\end{slide}

% =====================================================================
\Slide
\begin{center}
{\bf Schema Negation}
\end{center}

\vfill
Return to theory where we defined schema $File$:

=SML
open_theory "usr023";
set_pc "z_language";
=TEX
=SML
rewrite_conv[]ⓩz ∈ (¬ File)⌝;
=TEX

\vfill

=GFT ProofPower output
val it = ⊢ z ∈ (¬ File) ⇔ ¬ z ∈ File : THM
=TEX

\vfill

\begin{center}
{\bf Schema Conjunction}
\end{center}

\vfill

=SML
rewrite_conv[]ⓩz ∈ (File ∧ File2)⌝;
=TEX

\vfill

=GFT ProofPower output
val it = ⊢ z ∈ (File ∧ File2) ⇔
 (age ≜ z.age, people ≜ z.people) ∈ File ∧
 (height ≜ z.height, people ≜ z.people) ∈ File2 : THM
=TEX

\vfill

\end{slide}
% =====================================================================
\Slide
\begin{center}
{\bf Schema Disjunction}
\end{center}

\vfill

=SML
rewrite_conv[]ⓩz ∈ (File ∨ File2)⌝;
=TEX

\vfill

=GFT ProofPower output
val it = ⊢ z ∈ (File ∨ File2) ⇔
 (age ≜ z.age, people ≜ z.people) ∈ File ∨
 (height ≜ z.height, people ≜ z.people) ∈ File2 : THM
=TEX

\vfill

\begin{center}
{\bf Schema Implication}
\end{center}

\vfill

=SML
rewrite_conv[]ⓩz ∈ (File ⇒ File2)⌝;
=TEX

\vfill

=GFT ProofPower output
val it = ⊢ z ∈ (File ⇒ File2) ⇔
 (age ≜ z.age, people ≜ z.people) ∈ File ⇒
 (height ≜ z.height, people ≜ z.people) ∈ File2 : THM
=TEX

\vfill


\end{slide}
% =====================================================================
\Slide
\begin{center}
{\bf Schema Equivalence}
\end{center}

\vfill

=SML
rewrite_conv[]ⓩz ∈ (File ⇔ File2)⌝;
=TEX

\vfill

=GFT ProofPower output
val it = ⊢ z ∈ (File ⇔ File2) ⇔
 (age ≜ z.age, people ≜ z.people) ∈ File ⇔
 (height ≜ z.height, people ≜ z.people) ∈ File2 : THM
=TEX

\vfill

\begin{center}
{\bf Schema Existential}
\end{center}

\vfill

=SML
rewrite_conv[]ⓩz ∈ (∃ File3 | people = {} ⦁ File2)⌝;
=TEX

\vfill

=GFT ProofPower output
val it = ⊢ z ∈ (∃ File3 | people = {} ⦁ File2) ⇔
 (∃ x1 : 𝕌 ⦁
   ((people ≜ x1.people) ∈ File3
   ∧ x1.people = {})
   ∧ (height ≜ z.height, people ≜ x1.people) ∈ File2)
   : THM
=TEX

\vfill

\end{slide}
% =====================================================================
\Slide
\begin{center}
{\bf Schema Unique Existence}
\end{center}

\vfill

=SML
rewrite_conv[]ⓩz ∈ (∃⋎1 File3 | people = {} ⦁ File2)⌝;
=TEX

\vfill

=GFT ProofPower output
val it = ⊢ z ∈ (∃⋎1 File3 | people = {} ⦁ File2) ⇔
 (∃⋎1 x1 : 𝕌 ⦁
   ((people ≜ x1.people) ∈ File3
   ∧ x1.people = {})
   ∧ (height ≜ z.height, people ≜ x1.people) ∈ File2)
   : THM
=TEX

\vfill

\begin{center}
{\bf Schema Universal}
\end{center}

\vfill

=SML
rewrite_conv[]ⓩz ∈ (∀ File3 | people = {} ⦁ File2)⌝;
=TEX

\vfill

=GFT ProofPower output
val it = ⊢ z ∈ (∀ File3 | people = {} ⦁ File2) ⇔
 (∀ x1 : 𝕌
 ⦁ (people ≜ x1.people) ∈ File3 ∧ x1.people = {}
   ⇒ (height ≜ z.height, people ≜ x1.people) ∈ File2)
   : THM
=TEX

\vfill

\end{slide}
% =====================================================================
\Slide

\begin{center}
{\bf Decoration}
\end{center}

\vfill

=SML
rewrite_conv[]ⓩz ∈ File ''⌝;
=TEX

\vfill

=GFT ProofPower output
val it = ⊢ z ∈ (File'')	⇔
 (age ≜ z.age'', people ≜ z.people'') ∈ File : THM
=TEX

\vfill

\begin{center}
{\bf Pre-Condition}
\end{center}

\vfill

=SML
once_rewrite_conv[]ⓩz ∈ (pre FileOp)⌝;
=TEX

\vfill

=GFT ProofPower output
val it = ⊢ z ∈ (pre FileOp) ⇔
 z ∈	[age : 𝕌; i? : 𝕌; people : 𝕌
	| ∃ age' : 𝕌; people' : 𝕌 ⦁ FileOp] : THM
=TEX

\vfill

\end{slide}
% =====================================================================
\Slide


\begin{center}
{\bf Schema Hiding}
\end{center}

\vfill

=SML
once_rewrite_conv[]ⓩz ∈ (File \⋎s (age))⌝;
=TEX

\vfill

=GFT ProofPower output
val it = ⊢ z ∈ (File \⋎s (age)) ⇔
	z ∈ [people : 𝕌 | ∃ age : 𝕌 ⦁ File] : THM
=TEX

\vfill
=SML
rewrite_conv[]ⓩz ∈ (File \⋎s (age))⌝;
=TEX

\vfill

=GFT ProofPower output
val it = ⊢ z ∈ (File \⋎s (age))
    ⇔ (∃ age : 𝕌 ⦁
    	(age ≜ age, people ≜ z.people) ∈ File) : THM
=TEX

\vfill

\end{slide}
% =====================================================================
\Slide

\begin{center}
{\bf Schema Renaming}
\end{center}

\vfill

=SML
once_rewrite_conv[]ⓩz ∈ File[aged/age]⌝;
=TEX

\vfill

=GFT ProofPower output
val it = ⊢ z ∈ (File [aged/age]) ⇔
	(age ≜ z.aged, people ≜ z.people) ∈ File : THM
=TEX

\vfill

\begin{center}
{\bf Schema Projection}
\end{center}

\vfill

=SML
once_rewrite_conv[]ⓩz ∈ (FileOp ↾⋎s File)⌝; (*  *)
=TEX

\vfill

=GFT ProofPower output
val it = ⊢ z ∈ (FileOp ↾⋎s File)
    ⇔ z ∈ ((FileOp ∧ File) \⋎s (age', i?, people')) : THM
=TEX

\vfill

\end{slide}
% =====================================================================
\Slide

\begin{center}
{\bf Schema Composition}
\end{center}

\vfill

=SML
once_rewrite_conv[]ⓩz ∈ (FileOp ⨾⋎s FileOp)⌝; (*  *)
=TEX

\vfill

=GFT ProofPower output
val it = ⊢ z ∈ (FileOp ⨾⋎s FileOp)
    ⇔ z
      ∈ [age : 𝕌; i? : 𝕌; people : 𝕌; age' : 𝕌; people' : 𝕌
        | ∃ x1 : 𝕌; x2 : 𝕌
          ⦁ (age ≜ age, age' ≜ x1, i? ≜ i?,
          		people ≜ people, people' ≜ x2)
              ∈ FileOp
            ∧ (age ≜ x1, age' ≜ age', i? ≜ i?, people ≜ x2,
                  people' ≜ people')
              ∈ FileOp] : THM
=TEX

\vfill

\end{slide}

}%\small

% =====================================================================
\Slide

\begin{center}
{\bf Delta}
\end{center}

\vfill

=SML
once_rewrite_conv[]ⓩz ∈ (ΔFile)⌝; (*  *)
=TEX

\vfill

=GFT ProofPower output
val it = ⊢ z ∈ (Δ File) ⇔
	z ∈ [File; File'] : THM
=TEX

\vfill
\begin{center}
{\bf Xi}
\end{center}

\vfill

=SML
once_rewrite_conv[]ⓩz ∈ (ΞFile)⌝; (*  *)
=TEX

\vfill

=GFT ProofPower output
val it = ⊢ z ∈ (Ξ File) ⇔
	z ∈ [File; File' | θFile = θFile'] : THM
=TEX

\vfill

\end{slide}

}%\small

% =====================================================================

\ftlmargin=0in
\Slide
\begin{center}
{\bf Exercises 4: Schema Expressions}
\end{center}
\vfill
Try Exercises 4 in zed_course_work.doc.
\vfill
Hints and further exercises may be found in sections 7.2.2 and 7.2.3  of
the Z Tutorial Manual.
\vfill
The exercises show that these operators behave in similiar ways to the predicate calculus versions, and that reasoning is largely automatic.
\vfill
Entering the goals is tricky because the parser prefers the predicate calculus interpretation of the connectives.
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Z Paragraphs}
\end{center}
\vfill
\begin{itemize}
\item
Fixity declarations
\item
Given sets
\item
Abbreviation definitions
\item
Schema boxes
\item
Axiomatic descriptions
\item
Generics
\item
Free types
\item
Constraints
\end{itemize}
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Z Paragraphs\\
Paragraph Processing Modes and Flags}
\end{center}
\vfill
{\small
There are several different modes of processing Z paragraphs which are controlled by flags.

\begin{itemize}
\item
{\bf Type-checking Mode}

If the flag $z_type_check_only$ is set to $true$ then only type checking of Z paragrpahs is performed.

{\tiny
This makes the response faster, and permits greater flexibility in amending paragraphs.
This mode is suitable for use while developing specifications prior to undertaking any proof work.
}

\item
{\bf Axiomatic Mode}

If the flag $z_use_axioms$ is set to true (and\\
$z_type_check_only$ is set to $false$) then axiomatic descriptions and free-type descriptions are introduced using axioms.


\item
{\bf Conservative Mode}

If both the above flags is set $false$ then all Z axiomatic descriptions are introduced using the ProofPower\\
$new_specification$ facility, i.e. by conservative extension.

{\tiny
Consistency proof obligations, unless discharged automatically, will have to be discharged by the user.

In a future release it is hoped that free-types will also be supported by conservative extension.
}%\tiny

\end{itemize}

}%\small
\vfill
\end{slide}

% =====================================================================

\ignore{
=SML
open_theory "usr023";
set_pc "z_library";
=TEX
}%\ignore

\Slide
\vfill
\begin{center}
{\bf Fixity Declarations}
\end{center}
Fixity declarations may be provided for:
\vfill
{\small
\begin{itemize}
\item
functions
ⓈZ
fun 10 twice _
■
ⓈZ
fun  select ... from _
■
\item
generics
ⓈZ
gen _ swap _
■
\item
relations
ⓈZ
rel  _ is_even
■
\end{itemize}

\vfill

The optional numeric value is a priority.

`_' is a space for a parameter\\
`...' is a space for a sequence of parameters (with sequence brackets elided)

Fixity clauses can only be deleted by deleting the theory they are contained in.

}%\small
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Given Sets}
\end{center}

\vfill

ⓈZ
[G1, G2]
■

\vfill

=SML
val G1_def = z_get_spec ⓩG1⌝;
=GFT ProofPower output
val G1_def = ⊢ G1 = 𝕌 : THM
=TEX

\vfill

=SML
rewrite_conv [G1_def] ⓩx ∈ G1⌝;
=GFT ProofPower output
val it = ⊢ x ∈ G1 ⇔ true : THM
=TEX

\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Abbreviation Definitions}
\end{center}

{\small
\vfill
=SML
val _ = set_flag("z_type_check_only", false);
=TEX

ⓈZ
X swap Y ≜ Y × X
■

\vfill

=SML
val swap_def = z_get_spec ⓩ(_ swap _)⌝;
=GFT ProofPower Output
val swap_def =
⊢ [X, Y](X swap Y = Y × X) : THM
=TEX

\vfill

=SML
rewrite_conv [swap_def] ⓩℤ swap ℕ⌝;
=TEX
=GFT ProofPower Output
val it = ⊢ ℤ swap ℕ = ℕ × ℤ : THM
=TEX

}%\small
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Schema Boxes}
\end{center}
\vfill
{\small
┌Sch────────────
│	x, y : ℤ;
│	z : ℕ
├─────────
│	x = y ∨ y = z
└──────────────
=SML
val sch_def = z_get_spec ⓩSch⌝;
=GFT ProofPower Output
val sch_def = ⊢ Sch =
  [x, y : ℤ; z : ℕ | x = y ∨ y = z] : THM
=TEX
=SML
rewrite_conv [sch_def]
 ⓩ∀ x,y:ℤ; z:ℕ ⦁ Sch ∨ disjoint ⟨{x},{y},{z}⟩⌝;
=TEX
=GFT ProofPower Output
val it = ⊢ (∀ x, y : ℤ; z : ℕ ⦁ Sch
		∨ disjoint ⟨{x}, {y}, {z}⟩)
    ⇔ (∀ x, y : ℤ; z : ℕ
      ⦁ [x, y : ℤ; z : ℕ | x = y ∨ y = z]
      	∨ disjoint ⟨{x}, {y}, {z}⟩) : THM
=TEX

}%\small
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Generic Schema Boxes}
\end{center}
\vfill
{\small
┌DSUBS[X]───────────
│	set1, set2: ℙ X
├─────────────
│	set1 ∩ set2 = {}
└────────────────
\vfill
=SML
val dsubs_def = z_get_spec ⓩDSUBS⌝;
=GFT ProofPower Output
val dsubs_def = ⊢ [X](DSUBS[X] =
  [set1, set2 : ℙ X | set1 ∩ set2 = {}]) : THM
=TEX
\vfill
=SML
rewrite_conv [dsubs_def]
       ⓩ∀ DSUBS[ℕ] ⦁ set1 ⊆ ℕ ∧ set2 ⊆ ℕ⌝;
=GFT ProofPower Output
val it = ⊢ (∀ (DSUBS[ℕ]) ⦁ set1 ⊆ ℕ ∧ set2 ⊆ ℕ)
	⇔ (∀ [set1, set2 : ℙ ℕ | set1 ∩ set2 = {}] ⦁
		set1 ⊆ ℕ ∧ set2 ⊆ ℕ) : THM
=TEX
\vfill

}%\small
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Axiomatic Descriptions}
\end{center}
\vfill
{\small
ⓈZAX
│	twice _ : ℤ → ℤ
├───────────
│	∀i : ℤ ⦁ twice i = 2*i
■
\vfill
=SML
val twice_def = z_get_spec ⓩ(twice _)⌝;
=GFT ProofPower Output
val twice_def = ⊢ (twice _) ∈ ℤ → ℤ
	∧ (∀ i : ℤ ⦁ twice i = 2 * i) : THM
=TEX
\vfill
\ignore{
=SML
set_flag("use_file_non_stop_mode",true);
=TEX
}
=SML
rewrite_conv[twice_def] ⓩtwice 4⌝;
=GFT ProofPower Output
Exception- Fail * no rewriting occurred
=TEX
\ignore{
=SML
set_flag("use_file_non_stop_mode",false);
=TEX
}
\vfill
=SML
set_goal([],ⓩ∀ n:ℤ ⦁ twice n = 2*n⌝);
a (REPEAT z_strip_tac);
=GFT ProofPower Output
(* *** Goal "" *** *)
(*  1 *)  ⓩn ∈ ℤ⌝
(* ?⊢ *)  ⓩtwice n = 2 * n⌝
=TEX
\vfill
=SML
a (fc_tac [twice_def]);
=GFT ProofPower Output
Current and main goal achieved
=TEX
}%\small
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Generic Axiomatics}
\end{center}
\vfill
{\small
╒[X,Y,Z]════════════════════════
│ select ... from _ : (X ↔ Y) × (Y ↔ Z) → (Y ↔ Z)
├────────────────
│ ∀ indexed_set:(X ↔ Y); relation:(Y ↔ Z) ⦁
│
│     (select ... from _) (indexed_set, relation)
│     = (ran indexed_set) ◁ relation
└─────────────────────────────

\vfill
=GFT ProofPower output
val select_from_def = ⊢ [X, Y, Z](
 (select ... from _)[X, Y, Z]
    ∈ (X ↔ Y) × (Y ↔ Z) → Y ↔ Z
 ∧
 (∀ indexed_set : X ↔ Y; relation : Y ↔ Z⦁
     (select ... from _)[X, Y, Z] (indexed_set, relation)
     = ran indexed_set ◁ relation)) : THM
=TEX
\vfill
}%\small
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Free Types}
\end{center}
\vfill

{\small
ⓈZ
TREE ::= tip | fork (ℕ × TREE × TREE)
■
\vfill

=SML
val tree_def = z_get_spec ⓩTREE⌝;
=GFT ProofPower Output
val tree_def = ⊢ TREE = 𝕌 : THM
=TEX

\vfill

=SML
val tip_def = z_get_spec ⓩtip⌝;
=GFT ProofPower Output
val tip_def = ⊢ (
   tip ∈ TREE
 ∧ fork ∈ ℕ × TREE × TREE ↣ TREE)

 ∧ disjoint ⟨{tip}, ran fork⟩

 ∧ (∀ W : ℙ TREE |
   {tip} ∪ fork ⦇ ℕ × W × W ⦈ ⊆ W⦁
	TREE ⊆ W) : THM
=TEX


}%\small
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Mutually Recursive Free Types}
\end{center}
\vfill

{\small

ⓈZ
TYPE ::= Tvar G1 | Tcon (G1 × seq TERM)
&
TERM ::= Con (G1 × TYPE) | App (TERM × TERM)
■

\vfill

=SML
val tvar_def = z_get_spec ⓩTvar⌝;
=GFT ProofPower Output
val tvar_def = ⊢ (
      Tvar ∈ G1 ↣ TYPE
    ∧ Tcon ∈ G1 × (seq TERM) ↣ TYPE
    ∧ Con ∈ G1 × TYPE ↣ TERM
    ∧ App ∈ TERM × TERM ↣ TERM)

    ∧ (disjoint ⟨ran Tvar, ran Tcon⟩

    ∧ (∀ W : ℙ TYPE
      | Tvar ⦇ G1 ⦈ ∪ Tcon ⦇ G1 × (seq TERM) ⦈ ⊆ W
      ⦁ TYPE ⊆ W))

    ∧ disjoint ⟨ran Con, ran App⟩

    ∧ (∀ W : ℙ TERM
      | Con ⦇ G1 × TYPE ⦈ ∪ App ⦇ W × W ⦈ ⊆ W
      ⦁ TERM ⊆ W) : THM
=TEX

}%\small
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Constraints}
\end{center}
\vfill

{\small

ⓈZ
[X] ((∃f : X ↣ G1 ⦁ true)
	⇔ (∃f : X ↣ G2 ⦁ true))
■

\vfill

=SML
val c1 = get_axiom "-" "Constraint 1";
=GFT ProofPower output
val c1 = ⊢ [X]((∃ f : X ↣ G1 ⦁ true) ⇔
		(∃ f : X ↣ G2 ⦁ true)) : THM
=TEX

\vfill

ⓈZ
 {1} swap {⟨1⟩} = {⟨1⟩} × {1}
 	∧ Sch ≠ [x, y, z : ℤ]
■

\vfill

ⓈZ
 tip ≠ fork(2, tip, tip) ∧
 tip ∈ TREE
■

\vfill

}%\small
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Theories}
\end{center}
\vfill
Z Theories contain the following information:
\begin{itemize}
\item
The theory name and the names of the theories parents and children.
\item
The names of types (given sets) declared in the theory.
\item
The names and types of `global variables' declared in the theory.
\item
Fixity information.
\item
Axioms or specifications corresponding to the paragraphs of the Z specification introduced in this theory.
\item
A collection of saved theorems.
\end{itemize}
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Access to Z Theories}
\end{center}
\vfill
\begin{itemize}
\item
To use a theory it must be ``in context'', this can be achieved be opening the theory or one of its descendents:
=SML
open_theory : string -> unit;
=TEX
\item
To display the contents of a theory:
=SML
z_print_theory : string -> unit;
=TEX
\item
To get things from the theory:
{\small
=SML
get_aliases; get_ancestors; get_axiom; get_axioms;
get_children; get_consts; get_defn;
get_defns; get_descendants; get_parents; get_thm;
get_thms; z_get_spec;
=TEX
}%\small
\item
To save things in the theory use Z paragraphs.
\end{itemize}
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Exercises 5:  Paragraphs and Theories}
\end{center}
\vfill
Try Exercises 5 in zed_course_work.doc.
\vfill
Hints and further exercises may be found in section 7.3  of
the Z Tutorial Manual.
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf The Z ToolKit
\end{center}
\vfill
{\small
Available as a set of six theories.
\vfill
To get the Z ToolKit in context make $z_library$ a parent.
\vfill
The theories are:
\vfill
\begin{itemize}
\item $z_sets$
\item $z_relations$
\item $z_functions$
\item $z_numbers$
\item $z_sequences$
\item $z_bags$
\end{itemize}
\vfill
These definitions have been entered in axiomatic mode.
\vfill
}%\small
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Sets and Relations
\end{center}
\vfill
\begin{itemize}
\item
Recommended proof context: $z_rel_ext$.
\vfill
\item
High rate of automatic proof of lemmas in these theories.
\vfill
\item
Automatic proof fails if actual generic parameters are supplied.
\end{itemize}
\vfill
\end{slide}

% =====================================================================

{\tiny

\Slide

{\normalsize
\begin{center}
\bf A Sample Proof About Sets (I)
\end{center}

\vfill

=SML
set_pc "z_library_ext";
set_goal([],ⓩa ∩ (b \ c) = (a ∩ b) \ c⌝);
a z_strip_tac;
=TEX
}%\normalsize

\vfill

=GFT ProofPower output
(* ?⊢ *)  ⓩ∀ x1 : 𝕌 ⦁ x1 ∈ a ∩ (b \ c) ⇔ x1 ∈ a ∩ b \ c⌝
=SML
a z_strip_tac;
=GFT ProofPower output
(* ?⊢ *)  ⓩx1 ∈ 𝕌 ∧ true ⇒ (x1 ∈ a ∩ (b \ c) ⇔ x1 ∈ a ∩ b \ c)⌝
=TEX
\vfill
continuing only using $z_strip_tac$ as follows:
\vfill
=GFT ProofPower output
(* ?⊢ *)  ⓩx1 ∈ a ∩ (b \ c) ⇔ x1 ∈ a ∩ b \ c⌝
=TEX
\vfill
=GFT ProofPower output
(* ?⊢ *)  ⓩ(x1 ∈ a ∩ (b \ c) ⇒ x1 ∈ a ∩ b \ c)
             ∧ (x1 ∈ a ∩ b \ c ⇒ x1 ∈ a ∩ (b \ c))⌝
=TEX
\vfill
=GFT ProofPower output
(* *** Goal "2" *** *)
(* ?⊢ *)  ⓩx1 ∈ a ∩ b \ c ⇒ x1 ∈ a ∩ (b \ c)⌝

(* *** Goal "1" *** *)
(* ?⊢ *)  ⓩx1 ∈ a ∩ (b \ c) ⇒ x1 ∈ a ∩ b \ c⌝
=TEX
\vfill
\end{slide}

% =====================================================================

\Slide

{\normalsize
\begin{center}
\bf A Sample Proof About Sets (II)
\end{center}
}%\normalsize

\vfill
=GFT ProofPower output
(*  3 *)  ⓩx1 ∈ a⌝
(*  2 *)  ⓩx1 ∈ b⌝
(*  1 *)  ⓩ¬ x1 ∈ c⌝

(* ?⊢ *)  ⓩx1 ∈ a ∩ b \ c⌝
=TEX
\vfill
=GFT ProofPower output
...
(* ?⊢ *)  ⓩx1 ∈ a ∩ b ∧ x1 ∉ c⌝
=TEX
\vfill

=GFT ProofPower output
(* *** Goal "1.2" *** *)
...
(* ?⊢ *)  ⓩx1 ∉ c⌝

(* *** Goal "1.1" *** *)
...
(* ?⊢ *)  ⓩx1 ∈ a ∩ b⌝
=TEX
\vfill
=GFT ProofPower output
(* *** Goal "1.1" *** *)
...
(* ?⊢ *)  ⓩx1 ∈ a ∧ x1 ∈ b⌝
=TEX
\vfill

=GFT ProofPower output
(* *** Goal "1.1.2" *** *)
(* ?⊢ *)  ⓩx1 ∈ b⌝

(* *** Goal "1.1.1" *** *)
(* ?⊢ *)  ⓩx1 ∈ a⌝
=TEX
\vfill
\end{slide}

% =====================================================================


\Slide

{\normalsize
\begin{center}
\bf A Sample Proof About Sets (III)
\end{center}
}%\normalsize

\vfill
=GFT ProofPower output
Tactic produced 0 subgoals:
Current goal achieved, next goal is:
(* *** Goal "1.1.2" *** *)
...
=TEX
\vfill

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
=SML
a (REPEAT z_strip_tac);
=GFT ProofPower output
Tactic produced 0 subgoals:
Current and main goal achieved
=TEX

\vfill
\end{slide}
}%\tiny

% =====================================================================

\Slide
\begin{center}
\bf A Sample Proof About Relations (I)
\end{center}
\vfill
=SML
set_goal([], ⓩP ⨾ (Q ⨾ R) = (P ⨾ Q) ⨾ R⌝);
a contr_tac;
=TEX
{\tiny
=GFT ProofPower output
(* *** Goal "2" *** *)

(*  4 *)  ⓩ(x1, y') ∈ P⌝
(*  3 *)  ⓩ(y', y) ∈ Q⌝
(*  2 *)  ⓩ(y, x2) ∈ RSchedule
(*  1 *)  ⓩ∀ y : 𝕌 ⦁ ¬ ((x1, y) ∈ P ∧ (y, x2) ∈ Q ⨾ R)⌝

(* ?⊢ *)  ⓩfalse⌝


(* *** Goal "1" *** *)

(*  4 *)  ⓩ(x1, y) ∈ P⌝
(*  3 *)  ⓩ(y, y') ∈ Q⌝
(*  2 *)  ⓩ(y', x2) ∈ R⌝
(*  1 *)  ⓩ∀ y : 𝕌 ⦁ ¬ ((x1, y) ∈ P ⨾ Q ∧ (y, x2) ∈ R)⌝

(* ?⊢ *)  ⓩfalse⌝
=TEX
}%\tiny

\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf A Sample Proof About Relations (II)
\end{center}
\vfill
{\small
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
}%\small

\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Functions
\end{center}
\vfill
\begin{itemize}
\item
Automatic proof not very effective.
\item
Recommended proof contexts: ?
\begin{itemize}
\item
Use $z_fun_ext$ for extensional low level reasoning (expands out function arrows).
\item
Use $z_library$ for non-extensional reasoning.
\item
For extensional reasoning avoiding expansion of function arrows merge $'z_fun_alg$ into $z_rel_ext$.
\item
Use $z_fun_??_clauses$ where appropriate instead of expanding function arrows.
\end{itemize}
\item
Much further development expected.
\end{itemize}

\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Numbers
\end{center}
\vfill
\begin{itemize}
\item
Use proof context $z_library$.
\item
Theory well populated with results.
\item
Induction tactics available.
\item
Linear arithmetic not yet available.
\item
Theory of $\#$ not yet developed.
\end{itemize}
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Induction
\end{center}
\vfill
Induction principles for Z can be expressed as mixed language theorems in Higher Order Logic and Z e.g.:
\vfill
{\small
\begin{itemize}
=TEX
\item $z_ℕ_induction_thm$
=GFT
⊢ ∀ p
  ⦁ p ⓩ 0⌝
  ∧ (∀ i⦁ i ∈ ⓩ ℕ⌝ ∧ p i ⇒ p ⓩ i + 1⌝)
  ⇒ (∀ m⦁ m ∈ ⓩ ℕ⌝ ⇒ p m) : THM
=TEX
\item $z_ℤ_induction_thm$
=GFT
 ⊢ ∀ p
  ⦁ p ⓩ 1⌝
  ∧ (∀ i⦁ p i ⇒ p ⓩ ~ i⌝)
  ∧ (∀ i j⦁ p i ∧ p j ⇒ p ⓩ i + j⌝)
  ⇒ (∀ m⦁ p m) : THM
=TEX
\end{itemize}
}%\small
\vfill
$∀_elim$ and $all_β_rule$ may be used to specialise these for use in forward proofs.
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Induction Tactics
\end{center}
\vfill
Special tactics are available to facilitate the use\\
of induction principles:
\begin{itemize}
\item induction over natural numbers using\\
$z_ℕ_induction_tac$
{\small
=FRULE 2
z_ℕ_induction_tac ⓩ x⌝
├
{ Γ } x ∈ ℕ ⇒ t
├
{ Γ } t[0/x] ;
strip{t, Γ} t[x+1/x]
=TEX
}%\small
\item induction over integers using\\
$z_ℤ_induction_tac$
{\small
=FRULE 2
z_ℤ_induction_tac ⓩ x⌝
├
{ Γ } t
├
{ Γ } t[1/x];
strip{t[i/x], Γ} t[~i/x];
strip{t[i/x] ∧ t[j/x], Γ} t[i+j/x]
=TEX
}%\small
\end{itemize}
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Induction - Example (I)
\end{center}
\vfill
=SML
set_goal ([], ⓩx ∈ ℕ ⇒ x + y ≥ y⌝);
a (z_ℕ_induction_tac);
=GFT ProofPower output
(* *** Goal "2" *** *)

(*  1 *)  ⓩ0 ≤ i⌝

(* ?⊢ *)  ⓩ(i + 1) + y ≥ y⌝


(* *** Goal "1" *** *)

(* ?⊢ *)  ⓩ0 + y ≥ y⌝
=TEX
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Induction - Example (II)
\end{center}
\vfill
=SML
set_goal ([], ⓩx * x ≥ 0⌝);
a (z_ℤ_induction_tac ⓩx⌝);
=GFT ProofPower output
(* *** Goal "3" *** *)
(*  2 *)  ⓩ0 ≤ i * i⌝
(*  1 *)  ⓩ0 ≤ j * j⌝

(* ?⊢ *)  ⓩ(i + j) * (i + j) ≥ 0⌝

(* *** Goal "2" *** *)
(*  1 *)  ⓩ0 ≤ i * i⌝

(* ?⊢ *)  ⓩ~ i * ~ i ≥ 0⌝

(* *** Goal "1" *** *)
(* ?⊢ *)  ⓩ1 * 1 ≥ 0⌝
=TEX
\vfill
\end{slide}

% =====================================================================

{\small
\Slide
=SML
set_goal([],ⓩ∀ x, y : ℤ ⦁
        x ≤ y ⇒ 0 .. x ⊆ 0 .. y⌝);
a(rewrite_tac[z_get_spec ⓩ(_ .. _)⌝]
 THEN REPEAT strip_tac);
=GFT ProofPower output
...
(*  3 *)  ⓩx ≤ y⌝
(*  2 *)  ⓩ0 ≤ x1⌝
(*  1 *)  ⓩx1 ≤ x⌝

(* ?⊢ *)  ⓩx1 ≤ y⌝
=TEX
=SML
z_≤_trans_thm;
=GFT ProofPower output
val it = ⊢ ∀ i, j, k : 𝕌
      | i ≤ j ∧ j ≤ k ⦁ i ≤ k : THM
=SML
a(all_fc_tac[z_≤_trans_thm]);
=GFT ProofPower output
Tactic produced 0 subgoals:
Current and main goal achieved
=TEX
\vfill
\end{slide}

% =====================================================================

\Slide
=SML
set_pc "z_library_ext";
set_goal([],ⓩ∀ x, y : ℤ ⦁ ¬ x ≤ y ⇒
                0 .. y ⊆ 0 .. x - 1⌝);
a(rewrite_tac[z_get_spec ⓩ(_ .. _)⌝]
 THEN REPEAT strip_tac);
=GFT ProofPower output
...
(*  3 *)  ⓩy < x⌝
(*  2 *)  ⓩ0 ≤ x1⌝
(*  1 *)  ⓩx1 ≤ y⌝

(* ?⊢ *)  ⓩx1 ≤ x + ~ 1⌝
=TEX
=SML
a(all_fc_tac[z_≤_less_trans_thm]);
=GFT ProofPower output
(*  4 *)  ⓩy < x⌝
(*  3 *)  ⓩ0 ≤ x1⌝
(*  2 *)  ⓩx1 ≤ y⌝
(*  1 *)  ⓩx1 < x⌝

(* ?⊢ *)  ⓩx1 ≤ x + ~ 1⌝
=TEX
=SML
a(POP_ASM_T (ante_tac o
pure_once_rewrite_rule[z_get_specⓩ(_ < _)⌝]));
=TEX
\vfill
\end{slide}

% =====================================================================

\Slide
=GFT ProofPower output
(*  3 *)  ⓩy < x⌝
(*  2 *)  ⓩ0 ≤ x1⌝
(*  1 *)  ⓩx1 ≤ y⌝

(* ?⊢ *)  ⓩx1 + 1 ≤ x ⇒ x1 ≤ x + ~ 1⌝
=SML
a(once_rewrite_tac[z_≤_≤_0_thm]);
=GFT ProofPower output
(*  3 *)  ⓩy < x⌝
(*  2 *)  ⓩ0 ≤ x1⌝
(*  1 *)  ⓩx1 ≤ y⌝

(* ?⊢ *)  ⓩ(x1 + 1) + ~ x ≤ 0 ⇒
                 x1 + ~ (x + ~ 1) ≤ 0⌝
=SML
a(rewrite_tac[z_∀_elim ⓩ~ x⌝ z_plus_order_thm,
                  z_minus_thm]);
=GFT ProofPower output
Tactic produced 0 subgoals:
Current and main goal achieved
=TEX
\vfill
\end{slide}
}%\small

% =====================================================================

\Slide
\begin{center}
\bf Sequences and Bags
\end{center}
\begin{itemize}
\item
All definitions present.
\item
Theories otherwise undeveloped.
\item
Theory of $\#$ required before development of this theory.
\item
If necessary, pro-tem, we recommend adding induction principles and other required results for reasoning in this theory as ``constraints''.
\end{itemize}
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Exercises 6: Z ToolKit
\end{center}
\vfill
Try Exercises 6 in zed_course_work.doc.
\vfill
Hints and further exercises may be found in section 7.4  of
the Z Tutorial Manual.

\begin{itemize}
\vfill
\item
7.4.1 Sets

(easy)
\vfill
\item
7.4.2 Relations

(start easy and get harder\\
solutions to last set incomplete)
\vfill
\item
7.4.3 Functions

(no so easy, some solutions missing)
\vfill
\item
7.4.4  Numbers and Finiteness

(middling to hard)
\end{itemize}
\vfill
\end{slide}

% =====================================================================
{\small

\Slide
{\normalsize
\begin{center}
{\bf CASE STUDY - Confidentiality}
\end{center}
}%\normalsize
\vfill
=SML
open_theory"usr023";
new_theory⦏"usr023C"⦎;
set_pc "z_library";
set_flag("z_type_check_only", false);
set_flag("z_use_axioms", true);
=TEX
\vfill
ⓈZ
│	[⦏DATA⦎]
■
\vfill
┌⦏STATE⦎─────────────────
│	classified_data :ℕ ⇸ DATA
└─────────────────────
\vfill
┌⦏OPERATION⦎──────────────
│	ΔSTATE;
│	⦏clear?⦎ : ℕ
└─────────────────────
\vfill
\end{slide}

% =====================================================================

\Slide

┌⦏READ⦎─────────────────────
│	OPERATION;
│	⦏class?⦎	:ℕ;
│	⦏data!⦎	: DATA
├───────────────
│	class? ∈ dom classified_data;
│	class? ≤ clear?;
│	data! = classified_data class?;
│	classified_data' = classified_data
└────────────────────────
\vfill
┌⦏COMPUTE⦎───────────────────
│  OPERATION;
│  ⦏class?⦎	:ℕ;
│  ⦏computation?⦎	:(ℕ ⇸ DATA) → DATA
├───────────────
│  class? ∈ dom classified_data;
│  class? ≥ clear?;
│  classified_data'
│  =  classified_data ⊕ {class? ↦
│      computation? ((0 .. clear?) ◁ classified_data)}
└─────────────────────────
\vfill

\end{slide}

% =====================================================================

\Slide
{\normalsize
\begin{center}
{\bf Pre-Condition Proofs}
\end{center}
}%\normalsize
\vfill
=SML
set_goal ([], ⓩpre OPERATION ⇔
 classified_data ∈ ℕ ⇸ DATA ∧ 0 ≤ clear?⌝);
=TEX
\vfill
=SML
a (rewrite_tac (map z_get_spec
	[ⓩOPERATION⌝, ⓩSTATE⌝]));
=TEX
\vfill
=GFT ProofPower output
...
(* ?⊢ *)  ⓩ(∃ classified_data' : 𝕌
    ⦁ (classified_data ∈ ℕ ⇸ DATA
      ∧ classified_data' ∈ ℕ ⇸ DATA)
    ∧ 0 ≤ clear?)
 ⇔ classified_data ∈ ℕ ⇸ DATA ∧ 0 ≤ clear?⌝
...
=TEX
\vfill
\end{slide}

% =====================================================================

\Slide
=SML
a (REPEAT z_strip_tac
   THEN_TRY asm_rewrite_tac[]);
=TEX
\vfill
=GFT ProofPower output
...
(*  2 *)  ⓩclassified_data ∈ ℕ ⇸ DATA⌝
(*  1 *)  ⓩ0 ≤ clear?⌝

(* ?⊢ *)  ⓩ∃ classified_data' : 𝕌 ⦁
	classified_data' ∈ ℕ ⇸ DATA⌝
...
=TEX
\vfill
=SML
a (z_∃_tac ⓩ{}⌝ THEN
  PC_T1 "z_library_ext" rewrite_tac[]);
=TEX
\vfill
\end{slide}

% =====================================================================

\Slide
{\normalsize
\begin{center}
{\bf An Algorithmic Refinement}
\end{center}
}%\normalsize
\vfill
┌⦏BADREAD⦎─────────────────────
│	OPERATION;
│	⦏class?⦎	:ℕ;
│	⦏data!⦎	: DATA
├───────────
│	READ ∨
│ 	(class? > clear?;
│	data! = classified_data class?;
│	classified_data' = classified_data)
└──────────────────────────
\vfill
=SML
set_goal([],
 ⓩ(pre READ ⇒ pre BADREAD)
 ∧ (pre READ ∧ BADREAD ⇒ READ)⌝);

a (rewrite_tac (map z_get_spec
 [ⓩBADREAD⌝, ⓩREAD⌝, ⓩOPERATION⌝, ⓩSTATE⌝]));

a (REPEAT z_strip_tac THEN rename_tac[]
 THEN asm_rewrite_tac[]);
=TEX
\vfill
\end{slide}
}%\small

% =====================================================================

{\tiny
\Slide
=GFT ProofPower output
...
(*  9 *)  ⓩclassified_data ∈ ℕ ⇸ DATA⌝
(*  8 *)  ⓩclassified_data' ∈ ℕ ⇸ DATA⌝
(*  7 *)  ⓩ0 ≤ clear?⌝
(*  6 *)  ⓩ0 ≤ class?⌝
(*  5 *)  ⓩdata! ∈ DATA⌝
(*  4 *)  ⓩclass? ∈ dom classified_data⌝
(*  3 *)  ⓩclass? ≤ clear?⌝
(*  2 *)  ⓩdata! = classified_data class?⌝
(*  1 *)  ⓩclassified_data' = classified_data⌝

(* ?⊢ *)  ⓩ∃ classified_data'' : 𝕌; data!' : 𝕌
 ⦁ (classified_data'' ∈ ℕ ⇸ DATA
   ∧ data!' ∈ DATA)
 ∧ ((classified_data'' ∈ ℕ ⇸ DATA
      ∧ data!' ∈ DATA)
    ∧ data!' = classified_data class?
    ∧ classified_data'' = classified_data
   ∨ clear? < class?
    ∧ data!' = classified_data class?
    ∧ classified_data'' = classified_data)⌝
...
=TEX
\vfill
\end{slide}

% =====================================================================

\Slide
=SML
a (z_∃_tac ⓩ
   (classified_data'' ≜ classified_data,
   data!' ≜ classified_data class?)⌝
 THEN asm_rewrite_tac[]);
=GFT ProofPower output
...
(*  9 *)  ⓩclassified_data ∈ ℕ ⇸ DATA⌝
...
(*  4 *)  ⓩclass? ∈ dom classified_data⌝
...
(* ?⊢ *)  ⓩclassified_data class? ∈ DATA
             ∧ (classified_data class? ∈ DATA ∨ clear? < class?)⌝
...
=TEX
\vfill
=GFT
⊢ ∀ f : 𝕌; x : 𝕌; X : 𝕌; Y : 𝕌
    ⦁ ((f ∈ X → Y ∨ f ∈ X ↣ Y ∨ f ∈ X ↠ Y ∨ f ∈ X ⤖ Y)
       ∧ x ∈ X ⇒ f x ∈ Y)
    ∧ ((f ∈ X ⇸ Y ∨ f ∈ X ⤔ Y ∨ f ∈ X ⤀ Y)
       ∧ x ∈ dom f ⇒ f x ∈ Y) : THM
=TEX
\vfill
=SML
a (all_fc_tac [z_fun_∈_clauses]
	THEN REPEAT strip_tac);
=TEX
\vfill
\end{slide}
}%\tiny

% =====================================================================

{\small
\Slide
{\normalsize
\begin{center}
{\bf Base Types}
\end{center}
}%\normalsize
\vfill
=SML
open_theory "usr023C";
=TEX
\vfill
ⓈZ
│  [⦏IN⦎,⦏OUT⦎]
■
\vfill
ⓈZ
│  ⦏STATE2⦎ ≜ ℕ ⇸ DATA
■
\vfill
ⓈZ
│  ⦏SYSTEM⦎ ≜ (ℕ × IN × STATE2)
		→ (STATE2 × OUT)
■
\vfill
\end{slide}

% =====================================================================

\Slide
{\normalsize
\begin{center}
{\bf Critical Property}
\end{center}
}%\normalsize
\vfill
ⓈZAX
│  ⦏out_secure⦎ : ℙ SYSTEM
├──────────────────────────────
│  ∀sys:SYSTEM⦁ sys ∈ out_secure ⇔
│
│  (∀ clear:ℕ; inp:IN; s,s':STATE2
│  | (0 ..  clear) ◁ s = (0 ..  clear) ◁ s'
│  ⦁ second (sys (clear, inp, s))
│    = second (sys (clear, inp, s')))
■
\vfill
ⓈZAX
│  ⦏state_secure⦎ : ℙ SYSTEM
├──────────────────────────────
│  ∀sys:SYSTEM⦁ sys ∈ state_secure ⇔
│
│  (∀class, clear:ℕ; inp:IN; s,s':STATE2
│  | ((0 ..  class) ◁ s) = ((0 ..  class) ◁ s')
│  ⦁ (0 ..  class) ◁ (first (sys (clear, inp, s)))
│    = (0 ..  class) ◁ (first (sys (clear, inp, s'))))
■
\vfill
ⓈZAX
│  ⦏secure⦎ : ℙ SYSTEM
├──────────────────────────────
│  ∀sys:SYSTEM⦁ sys ∈ secure ⇔
│  sys ∈ state_secure ∧ sys ∈ out_secure
■
\vfill
\end{slide}

% =====================================================================

\Slide
{\normalsize
\begin{center}
{\bf Secure Architecture}
\end{center}
}%\normalsize
\vfill
ⓈZ
  ⦏APPLICATION⦎ ≜ (IN × STATE2)
                    → (STATE2 × OUT)
■
\vfill
ⓈZ
│  ⦏KERNEL⦎ ≜ APPLICATION → SYSTEM
■
\vfill
ⓈZAX
│  ⦏construction⦎ : APPLICATION × KERNEL → SYSTEM
├──────────────────────────────
│  ∀appl:APPLICATION; kernel:KERNEL⦁
│    construction (appl, kernel) = kernel appl
■
\vfill
ⓈZAX
│  ⦏secure_kernel⦎ : ℙ KERNEL
├──────────────────────────────
│  ∀ kernel:KERNEL⦁ kernel ∈ secure_kernel ⇔
│    (∀appl:APPLICATION⦁
│      (construction (appl, kernel)) ∈ secure)
■
\vfill
\end{slide}

% =====================================================================

\Slide
{\normalsize
\begin{center}
{\bf Architectural Correctness}
\end{center}
}%\normalsize
\vfill

=SML
set_goal([],ⓩ∀kernel:KERNEL;appl:APPLICATION⦁
  kernel ∈ secure_kernel ⇒
  (construction (appl,kernel)) ∈ secure⌝);
=TEX
\vfill
=SML
val ⦏secure_kernel_sim⦎ = z_defn_simp_rule
           (z_get_specⓩsecure_kernel⌝);
=TEX
\vfill
=GFT ProofPower output
val secure_kernel_sim = ⊢ ∀ kernel : 𝕌 ⦁
 kernel ∈ secure_kernel ⇔
 kernel ∈ KERNEL
 ∧ (∀ appl : APPLICATION ⦁
    construction (appl, kernel) ∈ secure) : THM
=TEX
\vfill
=SML
a (rewrite_tac[secure_kernel_sim]);
=GFT ProofPower output
(* ?⊢ *)  ⓩ∀ kernel : KERNEL; appl : APPLICATION
 ⦁ kernel ∈ KERNEL
 ∧ (∀ appl : APPLICATION
    ⦁ construction (appl, kernel) ∈ secure)
      ⇒ construction (appl, kernel) ∈ secure⌝
=TEX
\vfill
\end{slide}

% =====================================================================

\Slide
=SML
a (REPEAT strip_tac);
=TEX
\vfill
=GFT ProofPower output
(*  3 *)  ⓩkernel ∈ KERNEL⌝
(*  2 *)  ⓩappl ∈ APPLICATION⌝
(*  1 *)  ⓩ∀ appl : APPLICATION ⦁
             construction (appl, kernel) ∈ secure⌝

(* ?⊢ *)  ⓩconstruction (appl, kernel) ∈ secure⌝
=TEX
\vfill
=SML
a (all_asm_fc_tac[]);
=TEX
\vfill
=GFT ProofPower output
Tactic produced 0 subgoals:
Current and main goal achieved
=TEX
\vfill
\end{slide}

% =====================================================================

\Slide
{\normalsize
\begin{center}
{\bf A Secure Kernel}
\end{center}
}%\normalsize
\vfill
ⓈZAX
│ ⦏kernel_implementation⦎ : KERNEL
├──────────────────────────────
│ ∀ clear:ℕ; inp:IN;
│   state:STATE2; appl:APPLICATION ⦁
│
│ kernel_implementation appl (clear, inp, state) =
│
│ (  state ⊕ ((0  ..  (clear-1)) ⩤
│        (first (appl (inp, (0  ..  clear) ◁ state)))),
│	second (appl (inp, (0  ..  clear) ◁ state)) )
■

\vfill
\end{slide}
}%\small


% =====================================================================

{\tiny
\Slide
{\normalsize
\begin{center}
{\bf Arithmetic Lemmas}
\end{center}
}%\normalsize
\vfill
=SML
set_pc "z_library_ext";
=TEX
\vfill
=SML
set_goal ([], ⓩ∀ x, y : ℤ ⦁ x ≤ y ⇒ (0 .. x) ⊆ (0 .. y)⌝);
a (rewrite_tac[z_get_spec ⓩ(_ .. _)⌝]
  THEN REPEAT strip_tac);
a (all_fc_tac[z_≤_trans_thm]);
val ⦏le_dots_lemma1⦎ = pop_thm ();
=TEX
\vfill
=SML
set_goal ([], ⓩ∀ x, y : ℤ ⦁ ¬ x ≤ y ⇒ (0 .. y) ⊆ (0 .. (x - 1))⌝);
a (rewrite_tac[z_get_spec ⓩ(_ .. _)⌝]
  THEN REPEAT strip_tac);
a (all_fc_tac[z_≤_less_trans_thm]);
a (POP_ASM_T (ante_tac o pure_once_rewrite_rule
                           [z_get_specⓩ(_ < _)⌝]));
a (once_rewrite_tac[z_≤_≤_0_thm]);
a (rewrite_tac[z_∀_elim ⓩ~ x⌝ z_plus_order_thm, z_minus_thm]);
val ⦏le_dots_lemma2⦎ = pop_thm();
=TEX
\vfill
=SML
val ⦏×_fc_thm⦎ = prove_rule []
  ⓩ (∀ v:𝕌; w:𝕌; V:𝕌; W:𝕌 ⦁
  v ∈ V ∧ w ∈ W ⇒ (v,w) ∈ (V × W))⌝;
=TEX
\vfill
\end{slide}

% =====================================================================


\Slide
{\normalsize
\begin{center}
{\bf Kernel Security Proof}
\end{center}
}%\normalsize
\vfill
=SML
set_pc "z_sets_alg";
set_goal([],ⓩkernel_implementation ∈ secure_kernel⌝);
=GFT ProofPower output
(* ?⊢ *)  ⓩkernel_implementation ∈ secure_kernel⌝
=TEX

=SML
val ⦏specs⦎ = map (z_defn_simp_rule o z_get_spec)
  [ⓩsecure_kernel⌝, ⓩsecure⌝, ⓩstate_secure⌝, ⓩout_secure⌝];
=SML
a (	rewrite_tac specs
	THEN REPEAT strip_tac);
=TEX
\vfill
=GFT ProofPower output
Tactic produced 6 subgoals:

(* *** Goal "6" *** *)
(*  6 *)  ⓩappl ∈ APPLICATION⌝
(*  5 *)  ⓩclear ∈ ℕ⌝
(*  4 *)  ⓩinp ∈ IN⌝
(*  3 *)  ⓩs ∈ STATE2⌝
(*  2 *)  ⓩs' ∈ STATE2⌝
(*  1 *)  ⓩ(0 .. clear) ◁ s = (0 .. clear) ◁ s'⌝

(* ?⊢ *)
  ⓩ(construction (appl, kernel_implementation) (clear, inp, s)).2
 = (construction (appl, kernel_implementation) (clear, inp, s')).2⌝
=TEX
\vfill
\end{slide}

% =====================================================================

\Slide
{\normalsize
\begin{center}
{\bf A Secure Kernel}
\end{center}
}%\normalsize
\vfill
=GFT
...
(* *** Goal "4" *** *)
(*  7 *)  ⓩappl ∈ APPLICATION⌝
(*  6 *)  ⓩclass ∈ ℕ⌝
(*  5 *)  ⓩclear ∈ ℕ⌝
(*  4 *)  ⓩinp ∈ IN⌝
(*  3 *)  ⓩs ∈ STATE2⌝
(*  2 *)  ⓩs' ∈ STATE2⌝
(*  1 *)  ⓩ(0 .. class) ◁ s = (0 .. class) ◁ s'⌝

(* ?⊢ *)  ⓩ(0 .. class)
                 ◁ (construction (appl, kernel_implementation)
                       (clear, inp, s)).1
             = (0 .. class)
                 ◁ (construction (appl, kernel_implementation)
                       (clear, inp, s')).1⌝
=TEX
=GFT ProofPower output
...
(* *** Goal "2" *** *)
(*  1 *)  ⓩappl ∈ APPLICATION⌝

(* ?⊢ *)  ⓩconstruction (appl, kernel_implementation) ∈ SYSTEM⌝
=TEX
\vfill
\end{slide}

% =====================================================================

\Slide
=GFT ProofPower output
...
(* *** Goal "1" *** *)
(* ?⊢ *)  ⓩkernel_implementation ∈ KERNEL⌝

The subgoal 2 duplicates goals labelled 3, 5
The subgoal 3 duplicates goals labelled 2, 5
=TEX
=SML
val [condec, conpred] = strip_∧_rule (z_get_spec ⓩconstruction⌝);
val [kidec, kipred] =
      strip_∧_rule (z_get_spec ⓩkernel_implementation⌝);
=GFT ProofPower output
val condec = ⊢ construction ∈
     APPLICATION × KERNEL → SYSTEM : THM
val conpred =
   ⊢ ∀ appl : APPLICATION; kernel : KERNEL
       ⦁ construction (appl, kernel) = kernel appl : THM

val kidec = ⊢ kernel_implementation ∈ KERNEL : THM
val kipred =
...
=TEX
=SML
a (strip_asm_tac kidec);
=GFT ProofPower output
Tactic produced 0 subgoals:
Current goal achieved, next goal is:
=TEX
\vfill
\vfill
\end{slide}

% =====================================================================

\Slide
=GFT ProofPower output
(*  1 *)  ⓩappl ∈ APPLICATION⌝

(* ?⊢ *)  ⓩconstruction (appl, kernel_implementation) ∈ SYSTEM⌝
...
=SML
a (asm_tac kidec THEN asm_tac condec);
a (LEMMA_T
 ⓩ(appl, kernel_implementation) ∈ (APPLICATION × KERNEL)⌝
 asm_tac
 THEN1 contr_tac);
=GFT ProofPower output
...
(* 2 *) ⓩconstruction ∈ APPLICATION × KERNEL → SYSTEM⌝
(* 1 *) ⓩ(appl, kernel_implementation) ∈ APPLICATION × KERNEL⌝

(* ?⊢ *) ⓩconstruction (appl, kernel_implementation) ∈ SYSTEM⌝
...
=SML
a (all_fc_tac [z_fun_∈_clauses]);
=TEX
This discharges the current subgoal.
=GFT ProofPower output
Tactic produced 0 subgoals:
Current goal achieved, next goal is:
...
=TEX
\vfill
\end{slide}

% =====================================================================

\Slide

=GFT ProofPower output
(*  7 *)  ⓩappl ∈ APPLICATION⌝
...
(*  4 *)  ⓩinp ∈ IN⌝
...
(*  1 *)  ⓩ(0 .. class ◁ s) = (0 .. class ◁ s')⌝

(* ?⊢ *)
  ⓩ(0 .. class ◁ (construction
                    (appl, kernel_implementation)
                       (clear, inp, s)).1)
 = (0 .. class ◁ (construction
                    (appl, kernel_implementation)
                       (clear, inp, s')).1)⌝
=TEX
\vfill
=SML
a (strip_asm_tac kidec);
a (ALL_FC_T asm_rewrite_tac [kipred, conpred]);
=GFT ProofPower output
...
(*  8 *)  ⓩappl ∈ APPLICATION⌝
...
(*  2 *)  ⓩ(0 .. class) ◁ s = (0 .. class) ◁ s'⌝
(*  1 *)  ⓩkernel_implementation ∈ KERNEL⌝

(* ?⊢ *)
  ⓩ(0 .. class) ◁ (s ⊕ (0 .. clear - 1) ⩤
                   (appl (inp, (0 .. clear) ◁ s)).1)
 = (0 .. class) ◁ (s' ⊕ (0 .. clear - 1) ⩤
                   (appl (inp, (0 .. clear) ◁ s')).1)⌝
...
=TEX
\vfill
\end{slide}

% =====================================================================

\Slide
{\small

\vfill
If $ⓩclear ≤ class⌝$ then:

\begin{center}

 $ⓩ(0 .. clear) ⊆ (0 .. class)⌝$

\end{center}
and, given:
\begin{center}

 $ⓩ(0 .. class) ◁ s = (0 .. class) ◁ s'⌝$

\end{center}
we can conclude that:
\begin{center}

 $ⓩ(0 .. clear) ◁ s = (0 .. clear) ◁ s'⌝$

\end{center}

This fact may be used to rewrite the goal, changing the second occurence of $s$ to $s'$.
The resulting goal will be provable using:
\begin{center}

$ⓩ(0 .. class) ◁ s = (0 .. class) ◁ s'⌝$

\end{center}
once more, with the theorem:
\begin{center}

$ⓩx ◁ z = x ◁ z' ⇒ x ◁ (z ⊕ y) = x ◁ (z' ⊕ y)⌝$

\end{center}

\vfill

If $ⓩ¬ clear ≤ class⌝$ then:
\begin{center}

 $ⓩ0 .. class ⊆ 0 .. (clear - 1)⌝$

\end{center}
and the theorem:
\begin{center}

$ⓩ(A ⊆ B) ⇒ (A ◁ z) = (A ◁ z')$\\
$⇒ (A ◁ (z ⊕ (B ⩤ s))) = (A ◁ (z' ⊕ (B ⩤ s')))⌝$

\end{center}


suffices to prove the subgoal.
\vfill

}%\small

\end{slide}

% =====================================================================

\Slide
=SML
a (cases_tac ⓩclear ≤ class⌝);
=TEX
\vfill
=GFT ProofPower output
Tactic produced 2 subgoals:

(* *** Goal "4.1" *** *)
(*  9 *)  ⓩappl ∈ APPLICATION⌝
...
(*  3 *)  ⓩ(0 .. class) ◁ s = (0 .. class) ◁ s'⌝
(*  2 *)  ⓩkernel_implementation ∈ KERNEL⌝
(*  1 *)  ⓩ clear ≤ class⌝

(* ?⊢ *)
  ⓩ(0 .. class) ◁ (s ⊕ (0 .. clear - 1) ⩤
                   (appl (inp, (0 .. clear) ◁ s)).1)
 = (0 .. class) ◁ (s' ⊕ (0 .. clear - 1) ⩤
                   (appl (inp, (0 .. clear) ◁ s')).1)⌝
=TEX
\vfill
=SML
a (fc_tac [rewrite_rule[z_get_specⓩℤ⌝]
  le_dots_lemma1]);
=TEX
\vfill
\end{slide}

% =====================================================================

\Slide
=GFT ProofPower output
...
(* 10 *)  ⓩappl ∈ APPLICATION⌝
...
(*  4 *)  ⓩ(0 .. class) ◁ s = (0 .. class) ◁ s'⌝
(*  3 *)  ⓩkernel_implementation ∈ KERNEL⌝
(*  2 *)  ⓩclear ≤ class⌝
(*  1 *)  ⓩ0 .. clear ⊆ 0 .. class⌝

(* ?⊢ *)  ⓩ(0 .. class) ◁ (s ⊕ (0 .. clear - 1)
              ⩤ (appl (inp, (0 .. clear) ◁ s)).1)
         = (0 .. class) ◁ (s' ⊕ (0 .. clear - 1)
              ⩤ (appl (inp, (0 .. clear) ◁ s')).1)⌝
=TEX
\vfill
=SML
val set_lemma_1 = pc_rule1 "z_rel_ext" prove_rule []
  ⓩ∀ A, B : 𝕌; x, x' : 𝕌 ⦁
  A ⊆ B ⇒ (B ◁ x) = (B ◁ x') ⇒ (A ◁ x) = (A ◁ x')⌝;
a (ALL_FC_T asm_rewrite_tac[set_lemma_1]);
=TEX
\vfill
\end{slide}

% =====================================================================

\Slide
=GFT ProofPower output
...
(* 10 *)  ⓩappl ∈ APPLICATION⌝
...
(*  4 *)  ⓩ(0 .. class ◁ s) = (0 .. class ◁ s')⌝
...
(*  3 *)  ⓩkernel_implementation ∈ KERNEL⌝
(*  2 *)  ⓩclear ≤ class⌝
(*  1 *)  ⓩ0 .. clear ⊆ 0 .. class⌝

(* ?⊢ *)
 ⓩ(0 .. class) ◁ (s ⊕ (0 .. clear - 1) ⩤
                  (appl (inp, (0 .. clear) ◁ s')).1)
 = (0 .. class) ◁ (s' ⊕ (0 .. clear - 1) ⩤
                   (appl (inp, (0 .. clear) ◁ s')).1)⌝
=TEX
\vfill
=SML
val set_lemma_2 = pc_rule1 "z_rel_ext" prove_rule[]
 ⓩ∀ A : 𝕌; x, x', y : 𝕌 ⦁
  A ◁ x = A ◁ x' ⇒ A ◁ (x ⊕ y) = A ◁ (x' ⊕ y)⌝;
a(ALL_FC_T asm_rewrite_tac[set_lemma_2]);
=TEX
\vfill
\end{slide}

% =====================================================================

\Slide
{\normalsize
\begin{center}
{\bf state secure - second case}
\end{center}
}%\normalsize

=GFT ProofPower output
(* *** Goal "4.2" *** *)
(*  9 *)  ⓩappl ∈ APPLICATION⌝
...
(*  3 *)  ⓩ(0 .. class ◁ s) = (0 .. class ◁ s')⌝
(*  2 *)  ⓩkernel_implementation ∈ KERNEL⌝
(*  1 *)  ⓩ¬ (clear ≤ class)⌝

(* ?⊢ *)
 ⓩ (0 .. class) ◁ (s ⊕ (0 .. clear - 1) ⩤
                   (appl (inp, (0 .. clear) ◁ s)).1)
 = (0 .. class) ◁ (s' ⊕ (0 .. clear - 1) ⩤
                   (appl (inp, (0 .. clear) ◁ s')).1)⌝
=TEX
\vfill
=SML
(* *** Goal "4.2" *** *)
val set_lemma_3 = pc_rule1 "z_rel_ext" prove_rule[]
  ⓩ∀ A,B:𝕌; x,x':𝕌; st,st':𝕌 ⦁
  A ◁ x = A ◁ x' ⇒ (A ⊆ B)
  ⇒ A ◁ (x ⊕ (B ⩤ st)) = A ◁ (x' ⊕ (B ⩤ st'))⌝;
a (FC_T (MAP_EVERY ante_tac)
  [rewrite_rule[z_get_specⓩℤ⌝]le_dots_lemma2]
  THEN asm_ante_tac ⓩ(0 .. class) ◁ s = (0 .. class) ◁ s'⌝
  THEN rewrite_tac [set_lemma_3]);
=TEX
\vfill
\end{slide}

% =====================================================================

\Slide
{\normalsize
\begin{center}
{\bf The out_secure Subgoal}
\end{center}
}%\normalsize

=GFT ProofPower output
(* *** Goal "6" *** *)
(*  6 *)  ⓩappl ∈ APPLICATION⌝
(*  5 *)  ⓩclear ∈ ℕ⌝
(*  4 *)  ⓩinp ∈ IN⌝
(*  3 *)  ⓩs ∈ STATE⌝
(*  2 *)  ⓩs' ∈ STATE⌝
(*  1 *)  ⓩ(0 .. clear) ◁ s = (0 .. clear) ◁ s'⌝


(* ?⊢ *)
  ⓩ(construction (appl, kernel_implementation) (clear, inp, s)).2
 = (construction (appl, kernel_implementation) (clear, inp, s')).2⌝
=TEX
\vfill
=SML
a (MAP_EVERY asm_tac [condec, kidec] THEN
  ALL_FC_T asm_rewrite_tac [conpred, kipred]);
=TEX
\vfill
=SML
val ⦏kernel_secure_thm⦎ = pop_thm();
=GFT ProofPower output
val kernel_secure_thm =
     ⊢ kernel_implementation ∈ secure_kernel : THM
=TEX
\vfill
\end{slide}
}%\tiny

% =====================================================================

\Slide
{\normalsize
\begin{center}
{\bf A Vending Machine}
\end{center}
}%\normalsize
\small


\vfill

=IGN
open_theory"z_library";
new_theory"usr023";

=SML
repeat drop_main_goal;
open_theory "usr023";
new_theory "usr023V";
set_flags [
	("z_type_check_only", false),
	("z_use_axioms", true)
	   ];
=TEX

\vfill
ⓈZAX
│	price :ℕ
■
\vfill
┌VMSTATE────────────────
│	stock, takings :ℕ
└────────────────────
\vfill
┌VM_operation─────────────
│	ΔVMSTATE;
│	cash_tendered?, cash_refunded! :ℕ;
│	bars_delivered! :ℕ
└─────────────────────
\vfill
\end{slide}

% =====================================================================

\Slide
{\normalsize
\begin{center}
{\bf Vending Machine Operation Pre-conditions}
\end{center}
}%\normalsize
\small
\vfill
┌exact_cash───────────────────
│	cash_tendered? :ℕ
├──────────
│	cash_tendered? = price
└─────────────────────────
\vfill
┌insufficient_cash──────────────
│	cash_tendered? :ℕ
├──────────
│	cash_tendered? < price
└─────────────────────────
\vfill
┌some_stock───────────────────
│	stock :ℕ
├──────────
│	stock > 0
└─────────────────────────
\vfill
\end{slide}

% =====================================================================

\Slide
{\normalsize
\begin{center}
{\bf Vending Machine Operations}
\end{center}
}%\normalsize
\small
\vfill
┌VM_sale─────────────────────
│ VM_operation
├──────────
│ stock' = stock - 1;
│ bars_delivered! = 1;
│ cash_refunded! = cash_tendered? - price;
│ takings' = takings + price
└──────────────────────────
\vfill
┌VM_nosale─────────────────
│ VM_operation
├──────────
│ stock' = stock;
│ bars_delivered! = 0;
│ cash_refunded! = cash_tendered?;
│ takings' = takings
└───────────────────────
\vfill

ⓈZ
│ VM1 ≜ exact_cash ∧ some_stock ∧ VM_sale
■
\vfill

ⓈZ
│ VM2 ≜ insufficient_cash ∧ VM_nosale
■
\vfill

ⓈZ
│ VM3 ≜ VM1 ∨ VM2
■
\vfill
\end{slide}

% =====================================================================

\Slide
{\normalsize
\begin{center}
{\bf Exercises 7 : Vending Machine}
\end{center}
}%\normalsize
\small
Turn to Exercises 7 in zed_course_work.doc
\vfill
\begin{enumerate}
\item
Prove that the schema VM3 is non-empty. i.e., prove:

=GFT
∃ VM3 ⦁ true
=TEX

\tiny
Hints:
\begin{enumerate}
\item
Set the proof context to work with set extensionality by using:
=GFT
set_pc "z_library_ext";
=TEX
\item
Prove this by contradiction using $contr\_tac$.
\item
Try specialising VM3 with a suitable witness.
\item
Does your witness provide values for $cash\_tendered?$, $stock$, $stock'$, $takings$, $takings'$, $cash\_refunded!$

and $bars\_delivered!$ ?
\item
Is the conclusion $false$?

If so, try using $swap\_asm\_concl\_tac$ to help simplify the goal.
\item
Try rewriting with the all the definitions.
\item
Does your goal contain a disjunct, $0 ≤ price$ ?

If so try $strip_asm_tac\   price$ and rewriting with the assumptions.

\end{enumerate}

\end{enumerate}
\vfill
\end{slide}


% =====================================================================
\Slide

{\normalsize
\begin{center}
{\bf Exercises 7 (cont.) : VM Refinement Proof}
\end{center}
}%\normalsize
\small

This exercise is concerned with proving that VM3 is a refinement of VM1. This is a two stage proof.
\vfill
\begin{enumerate}
\setcounter{enumi}{1}
\item
It is useful to prove a lemma that stating that the pre-conditions $insufficient\_cash$ and $exact\_cash$ are disjoint. i.e., prove:
=GFT
¬ (insufficient_cash ∧ exact_cash)
=TEX
{\tiny
Hints:
\begin{enumerate}
\item
Set the proof context to work with set extensionality by using:
=GFT
set_pc "z_library_ext";
=TEX
\item
Try rewriting with all the definitions.
\item
If the goal contains inequalities, try rewriting with the specification of $<$.
e.g., use $z\_get\_spec$. (Avoid looping by using $pure\_rewrite\_tac$.)
\item
$z\_minus\_thm$ and $plus\_assoc\_thm$ may be useful to normalize any arithmetic expressions.
\item
Repeatedly stripping the goal might be too aggressive; try stripping it in steps, looking for likely opportunities for rewriting with the assumptions.
\end{enumerate}}%\tiny
\item
Show that $VM3$ is a refinement of $VM1$. i.e., prove
=GFT
(pre VM1 ⇒ pre VM3) ∧ (pre VM1 ∧ VM3 ⇒ VM1)
=TEX
{\tiny
Hints:
\begin{enumerate}
\item
Try rewriting with some of the top-level definitions; the goal can be proved without rewriting will all the definitions!
\item
The lemma proved in part 1 of this exercise will be useful.
\item
If you're stuck, try stripping the goal and seeing what you get.
\end{enumerate}}%\tiny

\end{enumerate}
\vfill
\end{slide}

% =====================================================================

\Slide

{\normalsize
\begin{center}
{\bf Exercises 7 : Solutions}
\end{center}
}%
\tiny
\vfill
For convenience we bind the various specifications to ML variables:
=SML
val [	price, VMSTATE, VM_operation,
	exact_cash, insufficient_cash, some_stock,
	VM_sale, VM_nosale, VM1, VM2, VM3 ]
    = map z_get_spec [ ⓩprice⌝, ⓩVMSTATE⌝, ⓩVM_operation⌝,
	ⓩexact_cash⌝, ⓩinsufficient_cash⌝, ⓩsome_stock⌝,
	ⓩVM_sale⌝, ⓩVM_nosale⌝, ⓩVM1⌝, ⓩVM2⌝, ⓩVM3⌝ ];
=TEX
\vfill
=SML
set_pc "z_library_ext";
set_goal([], ⓩ∃ VM3 ⦁ true⌝);
a(contr_tac);
a(z_spec_asm_tac ⓩ∀ VM3 ⦁ false⌝
	ⓩ(	cash_tendered? ≜ price,
		stock ≜ 1, stock' ≜ 0,
		takings ≜ 0, takings' ≜ price,
		cash_refunded! ≜ 0,
		bars_delivered! ≜ 1)⌝);
a(swap_asm_concl_tac
 ⓩ¬ (bars_delivered! ≜ 1, cash_refunded! ≜ 0, cash_tendered? ≜ price,
          stock ≜ 1, stock' ≜ 0, takings ≜ 0, takings' ≜ price)
          ∈ VM3⌝);
=TEX
\vfill
\end{slide}

% =====================================================================
\Slide

{\normalsize
\begin{center}
{\bf Exercises 7 : Solutions (cont.)}
\end{center}
}%\normalsize
\tiny
\vfill
=GFT Proofpower output
(* *** Goal "" *** *)

(*  1 *)  ⓩ∀ VM3 ⦁ false⌝

(* ?⊢ *)  ⓩ(bars_delivered! ≜ 1, cash_refunded! ≜ 0,
		cash_tendered? ≜ price, stock ≜ 1, stock' ≜ 0,
		takings ≜ 0, takings' ≜ price)
             ∈ VM3⌝
=TEX
\vfill
=SML
a(rewrite_tac[VM1, VM3,
	exact_cash,
	some_stock, VM_sale, VM_operation, VMSTATE]);
a(strip_asm_tac price);
a(asm_rewrite_tac[]);
val VM3_non_empty = pop_thm ();
=TEX
\vfill
\end{slide}
% =====================================================================
\Slide

{\normalsize
\begin{center}
{\bf Exercises 7 : Solutions (cont.)}
\end{center}
}%\normalsize
\tiny
\vfill
=SML
set_goal([], ⓩ¬ (insufficient_cash ∧ exact_cash)⌝);
a (rewrite_tac [insufficient_cash, exact_cash]);
=GFT ProofPower output
(* ?⊢ *)  ⓩ¬
           ((0 ≤ cash_tendered?
               ∧ cash_tendered? < price)
               ∧ 0 ≤ cash_tendered?
               ∧ cash_tendered? = price)⌝
=TEX
\vfill
=SML
a (pure_rewrite_tac [z_get_spec ⓩ(_ < _)⌝]);
a (rewrite_tac [z_plus_assoc_thm1]);
a (rewrite_tac [z_minus_thm, z_plus_assoc_thm1]);
a (REPEAT_N 3 z_strip_tac);
a (asm_rewrite_tac[]);
val cash_lemma = pop_thm ();
=TEX
\vfill
\end{slide}

% =====================================================================

\Slide

{\normalsize
\begin{center}
{\bf Exercises 7 : Solutions (cont.)}
\end{center}
}%\normalsize
\tiny

\vfill
To prove the refinement, the previous lemma is useful.
\vfill
=SML
set_goal([], ⓩ (pre VM1 ⇒ pre VM3) ∧ (pre VM1 ∧ VM3 ⇒ VM1)⌝);
a (rewrite_tac [VM1, VM2, VM3]);
=TEX
\vfill
=GFT ProofPower output
(* ?⊢ *)  ⓩ(
 (∃ bars_delivered! : 𝕌;
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
=TEX
\vfill
\end{slide}

% =====================================================================

\Slide
{\normalsize
\begin{center}
{\bf Exercises 7 : Solutions (cont.)}
\end{center}
}%\normalsize
\tiny
\vfill
=SML
a (strip_asm_tac cash_lemma
   THEN asm_rewrite_tac[]);
=TEX
\vfill
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
\vfill
=SML
a (REPEAT z_strip_tac);
val VM3_refines_VM1 = pop_thm ();
=TEX
\vfill
\end{slide}

% =====================================================================

\Slide

{\normalsize
\begin{center}
{\bf Vending Machine Correctness Property}
\end{center}
}%\normalsize
\small
\vfill

Next we express the requirement that a vending machine does not undercharge:

\vfill

ⓈZAX
│	VM_ok : ℙ ℙ VM_operation
├────────────────
│ ∀ vm : ℙ VM_operation⦁
│ vm ∈ VM_ok ⇔
│  (∀ VM_operation ⦁ vm ⇒
│   takings' - takings ≥ price * (stock - stock'))
■
\vfill

\end{slide}

% =====================================================================

\Slide
{\normalsize
\begin{center}
{\bf Exercises 8 : Correctness Proof}
\end{center}
}%\normalsize
\small
\vfill
\begin{enumerate}
\item
Prove that the Vending Machine VM3 does not undercharge. i.e., prove:
=GFT
VM3 ∈ VM_ok
=TEX

Hints:

\begin{enumerate}
\item
Set the proof context to work with set extensionality by using:
=GFT
set_pc "z_library_ext";
=TEX
\item
You will probably need to rewrite the goal with all the definitions.
\item
Try stripping the goal.
\item
Do you think that the conclusion is true by dint of arithmetic reasoning?

If so, you might want to try rewriting with theorems such as $z\_minus\_thm$ and/or $z\_plus\_assoc1\_thm$.
\item
$z\_plus\_order\_thm$ may also be useful. You will need to specialise this to some appropriate values if you are going to rewrite with it.
\end{enumerate}

\end{enumerate}
\vfill
\end{slide}

% =====================================================================

\Slide

{\normalsize
\begin{center}
{\bf Exercises 8 : Solutions}
\end{center}
}%\normalsize
\tiny
\vfill

Before using the definition of VM\_ok we convert it into an unconditional rewrite.
\vfill
=SML
val VM_ok = z_defn_simp_rule (z_get_spec ⓩVM_ok⌝);
=GFT ProofPower output
val VM_ok = ⊢ ∀ vm : 𝕌
    ⦁ vm ∈ VM_ok
      ⇔ vm ∈ ℙ VM_operation
        ∧ (∀ VM_operation
          ⦁ vm ⇒ takings' - takings ≥ price * (stock - stock')) : THM
=TEX
\vfill

We now prove that VM3 is a VM_ok.
\vfill
=SML
set_pc"z_library_ext";

set_goal([], ⓩVM3 ∈ VM_ok⌝);
a (rewrite_tac [VM1,VM2,VM3,VM_ok,VM_sale,VM_nosale,
		VM_operation,VMSTATE]);
=TEX
\vfill
\end{slide}

% =====================================================================

\Slide

{\normalsize
\begin{center}
{\bf Exercises 8 : Solutions (cont.)}
\end{center}
}%\normalsize
\tiny
\vfill


=SML
a(REPEAT z_strip_tac THEN asm_rewrite_tac[]);
=TEX
\vfill

Which considerably simplified the problem:
\vfill

=GFT ProofPower output
...
(*  2 *)  ⓩcash_refunded! = cash_tendered? + ~ price⌝
(*  1 *)  ⓩtakings' = takings + price⌝

(* ?⊢ *)  ⓩprice * (stock + ~ (stock + ~ 1)) ≤
                       (takings + price) + ~ takings⌝
...
=TEX
To solve this arithmetic problem, we simplify the lhs of the inequality by
1. pushing in the minus sign

and

2. associating the additions to the left

\vfill
\end{slide}

% =====================================================================

\Slide
{\normalsize
\begin{center}
{\bf Exercises 8 : Solutions (cont.)}
\end{center}
}%\normalsize
\tiny
\vfill
=SML
a (rewrite_tac [z_minus_thm, z_plus_assoc_thm1]);
=TEX
\vfill
which gives the conclusion:
=GFT Proofpower output
(* ?⊢ *)  ⓩprice ≤ (takings + price) + ~ takings⌝
=TEX
\vfill
To solve this problem we move
=INLINEFT
ⓩ~ takings⌝
=TEX
\ left to place it next to $takings$.

For this we specialise $z_plus_order_thm$:

=SML
z_plus_order_thm;
=GFT ProofPower output
val it = ⊢ ∀ i : 𝕌
    ⦁ ∀ j, k : 𝕌
      ⦁ j + i = i + j
      ∧ (i + j) + k = i + j + k
      ∧ j + i + k = i + j + k : THM
=TEX
\vfill
\end{slide}

% =====================================================================

\Slide
{\normalsize
\begin{center}
{\bf Exercises 8 : Solutions (cont.)}
\end{center}
}%\normalsize
\tiny
\vfill
=SML
z_∀_elim ⓩ~ takings⌝ z_plus_order_thm;
=TEX
\vfill
=GFT ProofPower output
val it = ⊢ ~ takings ∈ 𝕌 ∧ true
    ⇒ (∀ j, k : 𝕌
      ⦁ j + ~ takings = ~ takings + j
        ∧ (~ takings + j) + k = ~ takings + j + k
        ∧ j + ~ takings + k = ~ takings + j + k) : THM
=TEX
\vfill
=SML
a (rewrite_tac [z_∀_elim ⓩ~ takings⌝ z_plus_order_thm]);
a (rewrite_tac [z_plus_assoc_thm1]);
=TEX
\vfill
=SML
val VM3_ok_thm = pop_thm();
=TEX

\vfill
\end{slide}

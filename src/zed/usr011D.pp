=IGN
********************************************************************************
usr011D.doc: this file is part of the PPZed system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% usr011D.doc   ℤ $Date: 2004/01/19 12:44:00 $ $Revision: 1.11 $ $RCSfile: usr011D.doc,v $
% this should form a Chapter of the document
% Z Paragraphs
=TEX
\section{Introduction}

\begin{itemize}
\item
Fixity declaration
\item
Given set definition
\item
Structured set definition
\item
Axiomatic definition
\item
Constraint
\item
Generic definition
\item
Abbreviation definition
\item
Schema boxes
\end{itemize}

\subsection{Syntax}

Unlike lower level constructs in the Z language, such as predicates and expressions, paragraphs are not represented as HOL terms, though predicates arising from the paragraphs are represented as terms.

Paragraphs in Z are mapped to the facilities in HOL for introducing new constants and types.
Consequently, they are not entered using the Z term quotes `
=INLINEFT
ⓩ
=TEX
' and `
=INLINEFT
⌝
=TEX
', and they are not to be found in the structure of the datatype $Z_TERM$.

In the following description of Z paragraphs in {\Product} the syntax sections show how these paragraphs are rendered in the source documents, and omit any details of abstract syntax.

In general Z paragraphs are entered in documents using one are other of the paragraph introduction symbols, $ⓈZ$ or $ⓈZAX$, at the beginning of a new line, and are terminated with the character $■$ on its own on a line.
The characters Ⓢ, ■ may be obtained from the palette of extended characters
or typed directly (as Meta+`(' and Meta+`)').
However in some cases (schemas, and generics) the characters used to form the relevant boxes suffice to introduce the paragraphs.

\subsection{Paragraph Processing Modes and Flags}

There are several different modes of processing Z paragraphs which are controlled by flags.

\begin{itemize}
\item
{\bf Type-check-only Mode}

If the flag $z_type_check_only$ is set to $true$ then only type checking of Z paragraphs is performed.

This makes the response faster, and permits greater flexibility in amending paragraphs.
This mode is suitable for use while developing specifications prior to undertaking any proof work.

In type-check-only mode the definitions of global variables are not saved, only their types.
This makes it possible to change the definitions without reprocessing all subsequent definitions.
No diagnostics are given in type-check-only mode if a global variable is redefined, though a diagnostic still arises if a new type is entered twice.
This facility is only available in theories which have no children.

When a global variable is redefined global variables depending on it are not re-checked, and so it is desirable to re-check the specification as a whole when the changes are complete.
If it is required to reason about a specification which has been entered in type-check-only mode then the specification will have to be re-processed with $z_type_check_only$ set false.
This would normally be done by extracting the specification from the source document using $docsml$ and loading it using $use_file$.

\item
{\bf Axiomatic Mode}

If the flag $z_use_axioms$ is set to true (and $z_type_check_only$ is set to $false$) then axiomatic\\
descriptions and free-type descriptions are introduced using axioms.


\item
{\bf Conservative Mode}

If both the above flags are set $false$ then all Z axiomatic descriptions are introduced using the \Product{} $new_specification$ facility, i.e. by conservative extension.

Consistency proof obligations, unless discharged automatically, will have to be discharged by the user.

In a future release it is hoped that free-types will also be supported by conservative extension.

\end{itemize}

\section{Paragraphs}

\subsection{Fixity Declarations}\label{FixityDeclarations}

The fixity paragraphs currently supported by {\Product} generalise a facility required to avoid special treatment to constants introduced in the Z-ToolKit such as relational image and bag brackets.
This more general facility has been proposed for inclusion in the standard under development\cite{zip/prg/92/121}.

Fixity declarations may be entered for:

{\ftlmargin 0.5in
\begin{itemize}
\item
functions, e.g.:
ⓈZ
fun 10 twice _
■
ⓈZ
fun  select ... from _
■

\item
generics, e.g.:
ⓈZ
gen _ swap _
■

\item
relations, e.g.:
ⓈZ
rel  _ is_even
■
\end{itemize}
}%\ftlmargin

In each of these cases:
\begin{itemize}
\item
The first word is a keyword indicating the kind of fixity declaration involved, which must be $fun$, $gen$ or $rel$.
\item
The next element is an optional numeric value, which is the precedence of the name or template.
This is not permitted in a rel fixity paragraph.
\item
The final part of the declaration is a template, showing the form of the `name' and the position and kind of the parameters.
\begin{itemize}
\item
`_' is a place for a parameter
\item
`...' is a place for a sequence of parameters (with sequence brackets elided)
\end{itemize}
\end{itemize}

Where a name or template is declared using a `fun' fixity paragraph three possible methods of subsequent use are possible.

Firstly, the template may be used in exactly the form used in the fixity declaration in the defining declaration of a global or local variable.

Secondly, within the scope of such a declaration or as a free variable, the template may be applied by substituting expressions in place of the formal parameter markers in the template.
In this case the resulting expression is interpreted as a function application, where the variable whose name is the template is applied to a tuple formed from the actual arguments.

Finally the template may be used verbatim as an expression, if enclosed in brackets.
This is necessary if the template is declared as a generic global variable and it is necessary to supply actual generic parameters rather than accept the set of all elements of the type inferred by the type inferrer.

Where a name or template is declared using a `gen' fixity paragraph the forms of use are similar to those described for `fun' fixity paragraphs above except that:

\begin{itemize}
\item
the expressions substituted for the formal parameter markers must be sets (the formal parameter may not be `...').
\item
the expression is interpreted as an instance of the generic rather than an application of the variable.
\end{itemize}

Where a name or template is declared using a `rel' fixity paragraph the forms of use are similar to those for `fun' fixity paragraph except that the variable represented by the name or template must denote a set, and the expression involving use of this name or template will be interpreted as a set membership assertion (provided expressions are supplied in place of the formal parameter markers).

Fixity clauses can be deleted only by deleting the theory they are contained in.

\subsection{Given Sets}

\subsubsection{Syntax}

Given sets are introduced as a list of names enclosed in square brackets.
Typed in as:
{\ftlmargin=0in
=GFTSHOW
	ⓈZ
	[G1, G2]
	■
=TEX
}
The printed form is:

ⓈZ
[G1, G2]
■

\subsubsection{Proof Support}

Each given set causes the introduction of a new type and a new global variable known to be the set of all elements of that type.

The specification of the given set may be retrieved as follows:

=SML
val G1_def = z_get_spec ⓩG1⌝;
=GFT ProofPower output
val G1_def = ⊢ G1 = 𝕌 : THM
=TEX

`𝕌' is the generic identity function, and when its actual generic parameter is not printed it may be assumed to be the set of all elements of the relevant (inferred) type.
The normal proof contexts have knowledge of `𝕌' so that rewriting with the specification of a given set will enable assertions about membership of the given set to be proven.

=SML
rewrite_conv [G1_def] ⓩx ∈ G1⌝;
=GFT ProofPower output
val it = ⊢ x ∈ G1 ⇔ true : THM
=TEX

A special facility is provided to enable the information in the given set declarations in a theory to be collected for inclusion in a proof context (so that it may be used in rewriting).
$theory_u_simp_eqn_cxt$ will extract an equational context from a named theory incorporating conversions which prove results of the form:

=GFT
	x ∈ GIVENSET ⇔ true
=TEX

for each of the given sets declared in the theory.

This may be made into a partial proof context and then merged to form a new proof context, e.g.:
=SML
new_pc "'usr011";
set_u_simp_eqn_cxt (theory_u_simp_eqn_cxt "usr011")
	"'usr011";
set_merge_pcs ["'usr011", "z_language"];
=TEX
(note here that $'usr011$ should come first in the list)

Now knowledge of the given sets defined in the theory ``usr011'' is built into the rewriting facilities:
=SML
rewrite_conv[] ⓩx ∈ NAME⌝;
=GFT ProofPower output
val it = ⊢ x ∈ NAME ⇔ true : THM
=TEX

\subsection{Abbreviation and Generic Definitions}

\subsubsection{Syntax}

Typed in as:
{\ftlmargin=0in
=GFTSHOW
	ⓈZ
	GPROD ≜ G1 × G2
	■
=TEX
}

Displayed as:

ⓈZ
GPROD ≜ G1 × G2
■

Similarly generics:

ⓈZ
X swap Y ≜ Y × X
■

and schema definitions:

ⓈZ
SCHEMA ≜ [x, y :G1 | ¬ x = y]
■

The {\Product} system currently uses `$≜$', not only for schema definitions, but also instead of `$==$' for abbreviation definitions and generic definitions.
This reflects a proposal to the Z standardisation panel to eliminate unnecessary distinctions between global variables denoting schemas and those denoting other types of value.

The fixity status of the relevant name or template should be declared beforehand.

\subsubsection{Proof Support}

These definitions will generally yield equations when retrieved using $z_get_spec$.

=SML
val gprod_def = z_get_spec ⓩGPROD⌝;
=GFT ProofPower output
val gprod_def = ⊢ GPROD = G1 × G2 : THM
=TEX

If the declaration is of a generic global variable then the resulting predicate will also be generic.

=SML
val swap_def = z_get_spec ⓩ(_ swap _)⌝;
=GFT ProofPower Output
val swap_def = ⊢ [X, Y](X swap Y = Y × X) : THM
=TEX

Specialisation of such a generic predicate will be done automatically by the rewriting facilities when required:

=SML
rewrite_conv [swap_def] ⓩℤ swap ℕ⌝;
=TEX
=GFT ProofPower Output
val it = ⊢ ℤ swap ℕ = ℕ × ℤ : THM
=TEX

Specialisation may also be done using $∀_elim$ or $list_∀_elim$.

Schema declarations may be used in a similar manner, using the rewriting facilities to expand an occurence of the schema name.

=SML
rewrite_conv [z_get_spec ⓩSCHEMA⌝] ⓩSCHEMA ∨ x = y⌝;
=GFT ProofPower output
val it = ⊢ SCHEMA ∨ x = y ⇔ ¬ x = y ∨ x = y : THM
=TEX

(Note here that the predicate implicit in the declaration part of the horizontal schema has been simplified away because we inserted the given set declarations into the current proof context.)

\subsection{Schema Boxes}

\subsubsection{Syntax}

A schema box is typed in as :
{\ftlmargin=0in
=GFTSHOW
	┌Sch────────────
	│	x, y : ℤ;
	│	z : ℕ
	├─────────
	│	x = y ∨ y = z
	└──────────────
=TEX
}

resulting in the printed text:

┌Sch────────────
│	x, y : ℤ;
│	z : ℕ
├─────────
│	x = y ∨ y = z
└──────────────

The dividing horizontal bar and the following predicate are optional.

The horizontal and vertical bar characters in the source text may also be omitted without affecting the printed form or the logical significance of the paragraph.

Elision of semicolons between declarations and predicates is not supported.
Use of semicolons as low precedence conjunctions in the predicate part is supported.

\subsubsection{Proof Support}

The predicate obtained from such a schema declaration is the same as that which would result from the equivalent schema declaration using $≜$ and a horizontal schema expression:

=SML
val sch_def = z_get_spec ⓩSch⌝;
=GFT ProofPower Output
val sch_def = ⊢ Sch =
  [x, y : ℤ; z : ℕ | x = y ∨ y = z] : THM
=TEX

This can be used in rewriting in the normal manner.

=SML
rewrite_conv [sch_def]
 ⓩ∀ x,y:ℤ; z:ℕ ⦁ Sch ∨ disjoint ⟨{x},{y},{z}⟩⌝;
=TEX
=GFT ProofPower Output
val it = ⊢ (∀ x, y : ℤ; z : ℕ ⦁ Sch ∨ disjoint ⟨{x}, {y}, {z}⟩)
    ⇔ (∀ x, y : ℤ; z : ℕ
      ⦁ ({x, y} ⊆ ℤ ∧ z ∈ ℕ) ∧ (x = y ∨ y = z)
      ∨ disjoint ⟨{x}, {y}, {z}⟩) : THM
=TEX

Note that where a schema reference as a predicate is expanded into a horizontal schema, the horizontal schema is immediately eliminated to give the constituent predicate (in the proof context $z_language$).
Similar observations will also apply to schemas which are defined in terms of schema operations.
The operation will normally be eliminated if it appears as a predicate, using the relevant membership conversion (since membership of the relevant theta-term is implicit in the formation of a predicate from a schema expression, i.e. $sexp ⇔ θ sexp ∈ sexp$).

\subsection{Generic Schema Boxes}

\subsubsection{Syntax}

┌DSUBS[X]───────────
│	set1, set2: ℙ X
├─────────────
│	set1 ∩ set2 = {}
└────────────────

These differ from ordinary schemas only in having formal generic parameters.

\subsubsection{Proof Support}

The defining predicate is a generic equation with a horizontal schema on the right hand side.

=SML
val dsubs_def = z_get_spec ⓩDSUBS⌝;
=GFT ProofPower Output
val dsubs_def = ⊢ [X](DSUBS[X] =
  [set1, set2 : ℙ X | set1 ∩ set2 = {}]) : THM
=TEX

This is normally used by rewriting, the actual generic parameters being supplied automatically.

=SML
rewrite_conv [dsubs_def]
 ⓩ∀ DSUBS[ℕ] ⦁ set1 ⊆ ℕ ∧ set2 ⊆ ℕ⌝;
=GFT ProofPower Output
val it = ⊢ (∀ (DSUBS[ℕ]) ⦁ set1 ⊆ ℕ ∧ set2 ⊆ ℕ)
	⇔ (∀ [set1, set2 : ℙ ℕ | set1 ∩ set2 = {}]
	   ⦁ set1 ⊆ ℕ ∧ set2 ⊆ ℕ) : THM
=TEX

Note here that, because the schema reference expanded was in a declaration, the result is not within the language described in \cite{spivey89}.
This extension to the language is expected to appear in the forthcoming Z standard.

This works out more naturally in a goal oriented proof as follows:

=SML
push_merge_pcs ["'usr011", "z_library"];

set_goal([],ⓩ∀ DSUBS[ℕ] ⦁ set1 ⊆ ℕ ∧ set2 ⊆ ℕ⌝);
a z_strip_tac;
=GFT ProofPower output
...
(* ?⊢ *)  ⓩ(DSUBS[ℕ]) ∧ true ⇒ set1 ⊆ ℕ ∧ set2 ⊆ ℕ⌝
...
=TEX
The first step of stripping has converted the schema-as-declaration into a schema-as-predicate.
Rewriting with the definition is now appropriate.
=SML
a (rewrite_tac [dsubs_def]);
=GFT ProofPower output
...
(* ?⊢ *)  ⓩ{set1, set2} ⊆ ℙ ℕ ∧ set1 ∩ set2 = {}
		⇒ set1 ⊆ ℕ ∧ set2 ⊆ ℕ⌝
...
=SML
a (REPEAT strip_tac);
pop_pc();
=GFT ProofPower output
Tactic produced 0 subgoals:
Current and main goal achieved
=TEX

\subsection{Axiomatic Descriptions}

\subsubsection{Syntax}

Entered as:
{\ftlmargin=0in
=GFTSHOW
	ⓈZAX
	│	twice _ : ℤ → ℤ
	├───────────
	│	∀i : ℤ ⦁ twice i = 2*i
	■
=TEX
}
Printed as:

ⓈZAX
│	twice _ : ℤ → ℤ
├───────────
│	∀i : ℤ ⦁ twice i = 2*i
■

\subsubsection{Proof Support}

The predicate obtained from $z_get_spec$ is a conjunction of which the first part is the predicate implicit in the declaration part of the definition, and the second conjunct is the explicit predicate.

=SML
val twice_def = z_get_spec ⓩ(twice _)⌝;
=GFT ProofPower Output
val twice_def = ⊢ (twice _) ∈ ℤ → ℤ
	∧ (∀ i : ℤ ⦁ twice i = 2 * i) : THM
=TEX

The predicate can be used for rewriting, provided the condition implicit in the universal quantifier can be proven.
In the current proof context this is not achieved:

\ignore{
=SML
set_flag("use_file_non_stop_mode", true);
=TEX
}%\ignore

=SML
rewrite_conv[twice_def] ⓩtwice 4⌝;
=GFT ProofPower Output
Exception- Fail * no rewriting occurred
  [rewrite_conv.26001] * raised
=TEX

\ignore{
=SML
set_flag("use_file_non_stop_mode", false);
=TEX
}%\ignore

because $ℤ$ is not known to be a given set in this context.

A common way of obtaining a usable rewrite is by forward chaining using $all_fc_tac$ or $all_asm_fc_tac$ ($fc_tac$ and $asm_fc_tac$ may also be used, but are likely to give mixed-language results, involving HOL quantifiers).

=SML
set_goal([],ⓩ∀ n:ℤ ⦁ twice n = 2*n⌝);
a (REPEAT z_strip_tac);
=GFT ProofPower Output
...
(*  1 *)  ⓩn ∈ ℤ⌝

(* ?⊢ *)  ⓩtwice n = 2 * n⌝
...
=TEX
=SML
a (all_fc_tac [twice_def]);
=GFT ProofPower Output
Current and main goal achieved
=TEX

\subsection{Generic Axiomatic Descriptions}

\subsubsection{Syntax}

Entered as:
{\ftlmargin=0in
=GFTSHOW
	╒[X]═══════════════════
	│ length : seq X → ℕ
	├────────────────
	│	length ⟨⟩ = 0;
	│	∀ h:X; t: seq X⦁
	│	length (⟨h⟩ ⁀ t) = length t + 1
	└──────────────────────
=TEX
}

The double horizontal bar characters are inessential, though the top left hand corner is not.

Printed as:
╒[X]═══════════════════
│ length : seq X → ℕ
├────────────────
│	length ⟨⟩ = 0;
│	∀ h:X; t: seq X⦁
│	length (⟨h⟩ ⁀ t) = length t + 1
└──────────────────────

The following example shows the use in the declaration part and the predicate part of the schema of a template for which a fixity declaration has been entered.

Use of the template is necessary in the predicate of this generic description because the `...' parameter position in a template requires a parameter which is a list display (with list brackets omitted); no other kind of expression is permitted at this point.

╒[X,Y,Z]═══════════════════════════
│ select ... from _ : (X ↔ Y) × (Y ↔ Z) → (Y ↔ Z)
├────────────────
│	∀ indexed_set:(X ↔ Y); relation:(Y ↔ Z) ⦁
│	(select ... from _) (indexed_set, relation)
│		= (ran indexed_set) ◁ relation
└───────────────────────────────

\subsubsection{Proof Support}

Generic axiomatics definitions give rise to generic predicates whose bodies are the conjunction of the predicate implicit in the declaration part and the explicit predicate in the body of the paragraph.

In the body of the paragraph the normal rules for supply of actual generic parameters
where these have been omitted are varied.
The formal generic parameters are supplied, rather than the set of all elements of the inferred type.
Omission of the actual generic parameters is mandatory in this context.

=SML
val select_from_def = z_get_spec ⓩ(select ... from _)⌝;
=GFT ProofPower Output
val select_from_def = ⊢ [X,
  Y,
  Z]((select ... from _)[X, Y, Z] ∈ (X ↔ Y) × (Y ↔ Z) → Y ↔ Z
    ∧ (∀ indexed_set : X ↔ Y; relation : Y ↔ Z
      ⦁ (select ... from _)[X, Y, Z] (indexed_set, relation)
        = ran indexed_set ◁ relation)) : THM
=TEX

We see in the above that even if the `...' parameter type had not been used the verbatim template would have appeared in the generic predicate, since this is the only way to supply actual generic parameters to a template.

Other than in the defining occurrences the template is applied in the intended fashion, e.g.:

=SML
	ⓩselect 1,3,8 from sequence⌝;
=TEX


\subsection{Structured Set Definitions}

``Structured Set Definition'' is the name in version 1.0 of the Z standard\cite{zip/prg/92/121} for what has hitherto been called a ``Free Type'' paragraph.

\subsubsection{Syntax}
Entered as:
{\ftlmargin=0in
=GFTSHOW
	ⓈZ
	TREE ::= tip | fork (ℕ × TREE × TREE)
	■
=TEX
}
Printed as:
ⓈZ
TREE ::= tip | fork (ℕ × TREE × TREE)
■

Note that {\Product} at present neither requires nor allows the normal chevrons in these definitions.
Where a fixity clause is in force it is applied normally in the context of a structured set definition.

\subsubsection{Proof Support}

A structured set definition gives rise to defining axioms as described in the ZRM \cite{spivey89}.

For each given set an axiom defines it as the set of all elements of a new type:

=SML
val tree_def = z_get_spec ⓩTREE⌝;
=GFT ProofPower Output
val tree_def = ⊢ TREE = 𝕌 : THM
=TEX

A single axiom characterises all the constructors of the `structured set'.

=SML
val tip_def = z_get_spec ⓩtip⌝;
=GFT ProofPower Output
val tip_def = ⊢ (tip ∈ TREE
 ∧ fork ∈ ℕ × TREE × TREE ↣ TREE)
 ∧ disjoint ⟨{tip}, ran fork⟩
 ∧ (∀ W : ℙ TREE | {tip} ∪ fork ⦇ ℕ × W × W ⦈ ⊆ W⦁
	TREE ⊆ W) : THM
=TEX

\subsection{Mutually Recursive Structured Set Definitions}

Mutually recursive structured set definitions are also supported by {\Product}.

\subsubsection{Syntax}

Entered as:

{\ftlmargin=0in
=GFTSHOW
	ⓈZ
	TYPE ::= Tvar G1 | Tcon (G1 × seq TERM)
	&
	TERM ::= Con (G1 × TYPE) | App (TERM × TERM)
	■
=TEX
}

Printed as:

ⓈZ
TYPE ::= Tvar G1 | Tcon (G1 × seq TERM)
&
TERM ::= Con (G1 × TYPE) | App (TERM × TERM)
■

\subsubsection{Proof Support}

The axiomatisation of these definitions is a generalisation of the simpler cases:

=SML
val tvar_def = z_get_spec ⓩTvar⌝;
=GFT ProofPower Output
val tvar_def = ⊢ (Tvar ∈ G1 ↣ TYPE
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

\subsection{Constraints}

Constraints are arbitrary axioms introduced by the user, which are permitted in {\Product} to be generic.


\subsubsection{Syntax}

A constraint is entered as follows:

{\ftlmargin=0in
=GFTSHOW
	ⓈZ
	 {1} swap {⟨1⟩} = {⟨1⟩} × {1}
	 	∧ Sch ≠ [x, y, z : ℤ]
	■
=TEX
}
which is printed as:

ⓈZ
 {1} swap {⟨1⟩} = {⟨1⟩} × {1}
 	∧ Sch ≠ [x, y, z : ℤ]
■

An example of a $generic$ constraint is:

ⓈZ
[X] ((∃f : X ↣ G1 ⦁ true) ⇔ (∃f : X ↣ G2 ⦁ true))
■

\subsubsection{Proof Support}

The axioms resulting from the entry of constraints are stored in the current theory under keys which are of the form ``Constraint n'' where n is a numeric literal.

They may not be retrieved using $z_get_spec$ since they are not associated with any specific global variable.

A constraint is therefore accessed using $get_axiom$ with the relevant key.

=SML
val c1 = get_axiom "-" "Constraint 2";
=GFT ProofPower output
val c1 = ⊢ [X]((∃ f : X ↣ G1 ⦁ true) ⇔
		(∃ f : X ↣ G2 ⦁ true)) : THM
=TEX

\subsection{Conjectures}

Conjectures are arbitrary predicates mentioned by the user, normally to suggest or claim that they are true.

If entered into the source document as a conjecture paragraph then the conjecture will be syntax and type checked by the system whenever the document is processed by {\Product}.

Such conjectures are permitted to be generic.

\subsubsection{Syntax}

A conjecture paragraph is entered as follows:

{\ftlmargin=0in
=GFTSHOW
	ⓈZ
	 ?⊢ 0=1
	■
=TEX
}
which is printed as:

ⓈZ
 ?⊢ 0=1
■

This conjecture can be proven false in {\Product}.
Its assertion as a constraint would render the relevant theory inconsistent, but its inclusion as a conjecture is harmless.

An example of a $generic$ conjecture is:

ⓈZ
 ?⊢ [X,Y] (∀s:ℙ(X × Y)⦁(∀x:X⦁ ∃y:Y⦁ (x,y) ∈ s)
 		⇒ (∃f : X → Y ⦁ true))
■

This conjecture should in fact be provable under {\Product}.
Asserting it as a constraint would avoid the need to prove it but would not render the theory inconsistent.
Including it as a conjecture however leaves the result still in need of proof should the result be required.

\subsubsection{Proof Support}

There is no proof support for conjecture paragraphs.
The {\Product} system provides support for syntax and type checking conjectures only.
Once checked the contents of a conjecture paragraph are discarded.

If it required to prove a conjecture then it should be entered into the subgoal package using $set_goal$ or $push_goal$.

\section{Proof Support for Paragraphs}
\subsection{Consistency Proofs for Axiomatic Descriptions}

Specifications are treated as extension to the logical system supplied by {\Product}.
Such extensions take the form of introducing new type constructors (in Z these are always 0-ary type constructors corresponding to new given sets), new constants (called global variables in Z) and new axioms which generally provide information about these new types and constants.

When a new constant is introduced together with an axiom describing that constant, the extension will often be $conservative$.
To say that such an extension is conservative is to say that the information in the axiom only serves to define the constant which is introduced, and does not enable any new facts to be proved which do not mention that constant.

Conservative extensions are important since an extension known to be conservative cannot render the logical system inconsistent, whereas an arbitrary logical extension may render the system inconsistent, thus enabling `false' conjectures to be proven.

Because of the special importance of extensions which are conservative, axioms which are introduced as a part of a conservative extension are known by the system as $definitions$ and are kept distinct from axioms which are not known to be conservative.
The system provides mechanisms for undertaking conservative extensions in ways which it can check, so that specifications introduced using only these means can be guaranteed by the system not to interfere with the consistency of the logical system.

If Z axiomatic descriptions are entered into ProofPower while flag $z_use_axioms$ is false the descriptions will be stored as $definitions$ rather than as axioms.
In order to do this the system has to establish that the resulting axiom is a conservative extension of the previous logical context.
This is done either by the system automatically constructing a proof that this is the case for the axiom as supplied (which the supplied proof contexts are not capable of doing), or by the system adding a consistency caveat to the axiom before storing it as a definition.
The proof of consistency of the axiom with caveat is trivial, ensuring that the extension is conservative, but the user will subsequently need to prove the consistency result before the axiom can be used in proof without caveat.

We demonstrate this with a very simple axiomatic description.
First ensure that we are in the right mode:
=SML
set_flag("z_use_axioms", false);
set_pc "z_library";
=TEX

Then enter the axiomatic specification:

ⓈZAX
│	root : ℤ
├──────────
│	root * root = 9
■

Now retrieve the specification:
=SML
z_get_spec ⓩroot⌝;
=GFT ProofPower output
...
  ⊢ root ∈ ℤ ∧ root * root = 9 : THM
=TEX

The indigestible assumption (not shown here) is a consistency caveat.
Until the caveat is proven the specification is unusable for proof.

To prove the caveat the goal should be set up by $z_push_consistency_goal$.
=SML
z_push_consistency_goal ⓩroot⌝;
=GFT ProofPower output
...
(* ?⊢ *)  ⓩ∃ root' : ℤ ⦁ root' * root' = 9⌝
...
=TEX
This is easily discharged by supplying a witness as follows:
=SML
a (z_∃_tac ⓩ3⌝ THEN rewrite_tac[]);
=GFT ProofPower output
Tactic produced 0 subgoals:
Current and main goal achieved
...
=TEX
Then the result must be saved using $save_consistency_thm$ as follows:
=SML
save_consistency_thm ⓩroot⌝ (pop_thm());
=TEX
We can now retrieve a useful theorem using $z_get_spec$.
=SML
val root_def = z_get_spec ⓩroot⌝;
=GFT ProofPower output
val root_def = ⊢ root ∈ ℤ ∧ root * root = 9 : THM
=TEX

\subsection{Consistency Proofs for Generic Axiomatic Descriptions}

A similar pattern is necessary when introducing generics, though some additional complications arise.
Though ProofPower requires no uniqueness condition to establish a generic global variable, the consistency caveat arising cannot be expressed in Z, since it involves generic local variables, which are not permitted.

The consistency caveat therefore appears in a mixture of Z and HOL and some mixed language working is necessary.

╒[X]════════════
│	empty : ℙ X
├──────────
│	empty = {}
└───────────────

=SML
z_push_consistency_goal ⓩempty⌝;
=GFT ProofPower output
...
(* ?⊢ *)  ⓩ∃ empty' : 𝕌
             ⦁ ∀ X : 𝕌 ⦁ ⌜empty' ⓩ(X)⌝⌝ ∈ ℙ X ∧ ⌜empty' ⓩ(X)⌝⌝ = {}⌝
...
=TEX
Here the outermost existential in fact quantifies over generic local variable (though this is obscured by the use of 𝕌) and the uses of the generic local variable in the predicate are displayed by switching into HOL.

The witness supplied must be a HOL function which takes a tuple of formal parameters and yields the required instance:
=SML
a (z_∃_tac ⌜λ X ⦁ ⓩ{}⌝⌝ THEN PC_T1 "hol" rewrite_tac[]);
=GFT ProofPower output
...
(* ?⊢ *)  ⓩ⌜λ X ⦁ ⓩ{}⌝⌝ ∈ 𝕌 ∧ (∀ X : 𝕌 ⦁ {} ∈ ℙ X)⌝
...
=TEX
Here the rewriting was done in a HOL proof context because a HOL beta reduction is needed.
Now we rewrite again in the Z proof context:
=SML
a (rewrite_tac[]);
=GFT ProofPower output
Tactic produced 0 subgoals:
Current and main goal achieved
...
=SML
save_consistency_thm ⓩempty⌝ (pop_thm());
val empty_def = z_get_spec ⓩempty⌝;
=GFT ProofPower output
val empty_def = ⊢ [X](empty[X] ∈ ℙ X ∧ empty[X] = {}) : THM
=TEX

╒[X,Y]════════════
│	cprod : ℙ (X × Y)
├──────────
│	∀x:ℙX; y:ℙY⦁ cprod = X × Y
└───────────────

=SML
z_push_consistency_goal ⓩcprod⌝;
=GFT ProofPower output
(* ?⊢ *)  ⓩ∃ cprod' : 𝕌
             ⦁ ∀ X : 𝕌; Y : 𝕌
               ⦁ ⌜cprod' ⓩ(X, Y)⌝⌝ ∈ ℙ (X × Y)
                 ∧ (∀ x : ℙ X; y : ℙ Y ⦁ ⌜cprod' ⓩ(X, Y)⌝⌝ = X × Y)⌝
=TEX
Note here that the parameter to the required HOL function is a Z 2-tuple.
In the general case it is an $n-tuple$, where $n$ is the number of generic parameters, even when $n=1$ (very limited support for 1-tuples is available).
When used the appropriate projection function must therefore be applied.
A type cast is likely to be necessary for the type inferrer, as below.
=SML
a (z_∃_tac ⌜λ xy⦁ ⓩ(xy⦂(𝕌×𝕌)).1 × xy.2⌝⌝);
a (PC_T1 "hol" rewrite_tac[]);
a (rewrite_tac[]);
=GFT ProofPower output
Tactic produced 0 subgoals:
Current and main goal achieved
...
=TEX

Later releases of {\Product} may be expected to discharge such consistency results automatically, and proficient users may themselves adapt the available consistency provers for HOL specifications to give a basic capability for Z.

\section{Theories}

Z specifications are held in theories in the same way as specifications in HOL.
The content of these theories is the same as the HOL theories in respect of matters of a logical nature, but there are differences in the information held in the theories relating to the concrete presentation of a specification.

In HOL the fixity information held concerns which names are pre-fix, post-fix and infix, and which names are binders.
HOL also allows aliases and type abbreviations.

None of this information is appropriate for Z specifications.
{\ProductZ} provides a generalised mixfix notation, and the information controlling this is provided in the form of fixity paragraphs.
This information is retained in theories whose language is Z.
Aliases and type abbreviations are not supported for Z.

The primary facilities for access to Z theories are $z_print_theory$ and $z_get_spec$.
Other facilities available for HOL theories may also be used on Z theories, e.g. $get_parents$, $get_ancestors$, $get_thm$.

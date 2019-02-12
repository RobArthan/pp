=IGN
********************************************************************************
usr013C.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
=TEX
% usr013C.doc $Date: 2002/10/18 15:26:07 $ $Revision: 2.4 $ $RCSfile: usr013C.doc,v $
% COPYRIGHT (c) Lemma 1 Ltd.
\ignore{
=SML
(* usr013C.sml $Date: 2002/10/18 15:26:07 $ $Revision: 2.4 $ $RCSfile: usr013C.doc,v $
   COPYRIGHT (c) Lemma 1 Ltd. *)
=TEX
}

\chapter{HOL {\term}s}

\section{Introduction}

Following the structured presentation of {\type}s we now present the {\Product-HOL} ⦏TERM⦎ language.

The primitive {\term} structure is first presented, covering:

\begin{itemize}
\item
Abstract Syntax
\item
Concrete Syntax
\item
Typing Rules
\item
Semantics
\end{itemize}

Overlaid on this simple primitive structure there is a syntactically richer derived syntax, all of which can be explained as more convenient notation for writing {\term}s which can also be written in the primitive language.

The derived syntax is described also, and the semantics of these constructs is illustrated.

When entering {\term}s using the concrete syntax it is usually necessary to use `Quine corners' (`⌜'\ and\ `⌝') as quotation marks.
A pair of Quine corners enclosing a piece of concrete syntax is understood by {\Product} as an ML expression of type {\term}.
The effect of evaluating such an expression is achieved by parsing the concrete syntax, performing {\type} inference to determine whether the expression is {\welltyped}, and constructing the appropriate {\term}.
When an expression is submitted to {\Product} which results in the computation of a value of type {\term}, the {\term} pretty printer is automatically invoked to print the {\term}, and will print the {\term} in {\hol} concrete syntax enclosed in Quine corners.
These features will be illustrated in the following material.

\section{Abstract Syntax}

The primitive abstract syntax of {\term}s has just four constructors.

A {\term} is either a {\it TERM variable\/}, a {\it constant\/}, an {\it application\/}, or a {\it lambda-abstraction\/}.

A {\it TERM variable\/} may be thought of as denoting unspecified value, a {\it constant\/} as denoting a previously defined value.
An {\it application\/} denotes the value of some function when applied to an argument, and a {\it lambda-abstraction\/} describes a function by specifying the value of the function for an arbitrary value of its argument.

The standard ML datatype {\it DEST_SIMPLE_TERM} reflects the top-level structure of HOL {\term}s and may be used in computations with {\term}s.

=GFT
datatype ⦏DEST_SIMPLE_TERM⦎ =
		⦏Var⦎		of string * TYPE
	|	⦏Const⦎		of string * TYPE
	|	⦏App⦎		of TERM * TERM
	|	⦏Simpleλ⦎	of TERM * TERM;
=TEX
A {\term} may be transformed into a {\it DEST_SIMPLE_TERM}, or vice-versa by the following functions.
=GFT
⦏dest_simple_term⦎	: TERM -> DEST_SIMPLE_TERM;
⦏mk_simple_term⦎	: DEST_SIMPLE_TERM -> TERM;
=TEX

Alternatively a full collection of constructors, recognisers and destructors which operate directly on {\term}s are available.
The names of these are formed by prefixing {\it mk_}, {\it is_} and {\it dest_} to the names of the constructors in the abstract data type above (without capitalisation).

\section{Concrete Syntax}

The following BNF describes a very limited subset of the concrete syntax of HOL {\term}s which is sufficient for expressing {\term}s according to their primitive structure.
Later we see a richer syntax which makes the notation more readable.

The clauses in this syntax describe:

\begin{enumerate}
\item
⦏lambda\ abstraction⦎s
\item
⦏function\ application⦎s
\item
⦏infix\ function\ application⦎s
\item
⦏type\ cast⦎s
\item
⦏variable⦎s or ⦏constant⦎s
\item
⦏bracketted\ expression⦎s
\end{enumerate}
in turn.

=GFT BNF
Term	=
		`λ`, Name, [`:`, Type], `⦁`, Term
	|	Term, Term
	|	Term, InfixName, Term
	|	Term, `:`, Type
	|	Name
	|	`(`, Term, `)`;		
=TEX

Names are treated as variables unless they have been previously declared as constants.
Infix status and priority are determined by fixity declarations.

\section{{\type}s of {\term}s}

Terms must be ⦏well\ typed⦎.

The {\type} of a {\term} is determined by {\type} inference using the following rules:

\subsection{Variables}

A {\it TERM variable\/} in the abstract syntax (which may be thought of as its internal representation), consist simply of a name and a {\type}.
The variable has the {\type} associated with it, and this is essentially an axiom schema in the {\type} inference system

In concrete syntax the {\type} of a variable may be explicitly cited using a {\it {\type}-cast}, in which case the variable constructed by the system in forming the {\term} from the quotation will have that {\type} associated with it (provided a well-typing for the {\term} as a whole can be discovered which is consistent with all the contraints imposed, otherwise an error report will be given and no {\term} will be constructed.

This is reflected in the form of the axiom schema, which is expressed using the concrete syntax.
=FRULE 1
├
├
⌜v:α⌝ : α
=TEX
The schema states that the {\type} of any variable quoted with a cast is the same as the {\type} used in the cast.

Where a variable is not given a cast a most general (possibly polymorphic) {\type} will be inferred for it (if possible), and this will be used in the construction of the {\term}.
Nevertheless, the principle hold that in the asbtract representation it has the {\type} which was associated with it when it was formed.

\subsection{Constants}

A similar rule holds for {\it constants}.
Each constant is also constructed as a constant name associate with a {\type}, and the {\type} supplied at the time of construction is the {\type} of the constant thus formed.

When constants are constructed by the system while evaluating an object language quotation, the {\type} inference rules adopted differ from those used for variables.
In particular a name parsed will only be interpreted as a constant if a constant of that name has been declared in the current scope.
The {\type} inferrer will also insist on the {\type} assigned to the constant being the {\type} associated with the constant when it was declared, or a {\type} instance of that {\type}.
=FRULE 1
├
├
⌜c:α⌝ : α
=TEX

\subsection{Lambda Abstractions}

A {\it lambda abstraction\/} denotes a function from values of the {\type} of its formal parameter to the values of the {\type} of the body of the lambda abstraction.
The {\type} of the lambda abstraction is therefore a function space {\type} where the first argument to the function space constructor (the domain {\type}) is the {\type} of the formal parameter (or bound variable) and the second argument to the function space constructor (the co-domain {\type}) is the {\type} of the body of the lambda abstraction.
=FRULE 1
├
t : α
├
⌜λ x:β ⦁ t⌝ : β → α
=TEX
The rule then states that if some {\term} `t' has {\type} α, then a lambda abstraction with {\type} cast β on its bound variable and body `t' has {\type}
=INLINEFT
ⓣ β → α ⌝
=TEX
.

\subsection{Applications}

For a {\it function application} to be well-{\type}d the function must have a function space {\type}, and the argument must have the same {\type} as the domain {\type} of the function.
In that case the application will have the same {\type} as the codomain of the function.
=FRULE 1
├
f : α → β; x : α
├
⌜f x⌝ : β
=TEX

\subsection{Type Rules in the Meta-language}

The same rules may be rendered in ML as follows:

The main difficulty in expressing rules of this kind in the metalanguage is that the metalanguage is a programming language, not a logic, and therefore it only contains constructs which are executable, which does not include universal quantifiers.

Nevertheless something similar to a free variable formulation of the rules can be given.
This is an expression in ML containing variables which are to be understood as uninterpreted, together with the convention that to assert an ML expression containing such uninterpreted variables is to assert that the expression will evaluate to the boolean value `true' whatever well-{\type}d value is substituted for the instances of uninterpreted variables, provided that distinct occurences of the same variable are assigned the same value throughout the expression.

Such a claim cannot be verified without a logic for the metalanguage, which we do not have, however it can be illustrated (or tested) by evaluating the expressions for one or more specific values.

Thus all the following ML encapsulations of the HOL {\type} inference rules have the following characteristic.
If for a particular set of values of the free variables occuring in it, the premises of the rule (the assertions above the line) evaluate to the value `true', then so will the conclusion.
This can be illustrated by evaluating them after making the following specific bindings:
=SML
val vname = "var";
val vtype = ⓣBOOL⌝;
val cname = "0";
val ctype = ⓣℕ⌝;
val term = ⌜0⌝;
val ttype = ⓣℕ⌝;
val funterm = ⌜fun : 'a → 'b⌝;
val arg = ⌜arg : 'a⌝;
=TEX
\begin{itemize}
\item variables
=FRULE 1
├
├
type_of (mk_var(vname,vtype)) =: vtype;
=TEX
\item constants
=FRULE 1
├
├
type_of (mk_const(cname,ctype)) =: ctype;
=TEX
\item lambda abstractions
=FRULE 1
├
type_of term =: ttype;
├
type_of ⌜λ x:'a ⦁ ⓜterm⌝⌝ =: ⓣ'a → ⌜↘SML:↕ ttype⌝⌝;
=TEX
\item applications
=FRULE 1
├
type_of funterm =: ⓣ'a → 'b⌝;
type_of arg =: ⓣ'a⌝;
├
type_of ⌜ⓜfunterm⌝ ⓜarg⌝⌝ =: ⓣ'b⌝;
=TEX
\end{itemize}

In fact the function {\it type_of} which is supplied in the {\Product} system can be defined by recursion in a manner very similar to the above statement of the {\type} inference rules.

\section{Types of Terms - Examples}

The following examples use the same method of expressing in the metalanguage claims about the {\type} of a {\term} by citing ML expressions which evaluate to `true'.

They also give a preview of how the typed lambda calculus is made into higher order logic, by showing the {\type}s of some of the logical connectives that are defined in the system.

=SML
type_of	⌜x:ℕ⌝			=:	ⓣℕ⌝;
type_of	⌜x:'a⌝			=:	ⓣ'a⌝;
type_of	⌜0⌝			=:	ⓣℕ⌝;
type_of	⌜λx:ℕ ⦁ x + 1⌝	=:	ⓣℕ → ℕ⌝;
type_of	⌜λx ⦁ x + 1⌝		=:	ⓣℕ → ℕ⌝;
type_of	⌜(λx ⦁ x + 1) 3⌝	=:	ⓣℕ⌝;
type_of	⌜$+ 1⌝			=:	ⓣℕ → ℕ⌝;
type_of	⌜$+⌝			=:	ⓣℕ → ℕ → ℕ⌝;
type_of	⌜T⌝			=:	ⓣBOOL⌝;
type_of	⌜¬ T⌝			=:	ⓣBOOL⌝;
type_of	⌜$¬⌝			=:	ⓣBOOL → BOOL⌝;
type_of	⌜$∧⌝			=:	ⓣBOOL → BOOL → BOOL⌝;
type_of	⌜$∀⌝			=:	ⓣ('a → BOOL) → BOOL⌝;
=TEX

\section{The Semantics of {\term}s}\label{SemanticsOfTerms}

The semantics of {\term}s is explained informally by giving rules for evaluation of a {\term} to yield the value denoted by the {\term}.
This does not imply that the {\term}s are executable, the evaluation rules will often involve application of non-computable functions.

As with {\type}s, {\term}s can only be given a value in an appropriate context.

In the case of {\type}s the necessary context was:

\begin{itemize}
\item
A ⦏TYPE\ interpretation⦎ identifying the {\type} universe (a collection of non-empty sets which represents the domain of discourse) and assigning values to the {\typeconstructor}s in use.
\item
An assignment of sets to the {\typevariable}s occuring in the {\type}.
\end{itemize}

In the case of {\term}s the same context is necessary to enable a denotation to be assigned to the {\type}s occurring in the {\term}, and in addition the following are required:
\begin{itemize}
\item
An interpretation which assigns to each constant a family of values, one for each monomorphic instance of the {\type} of the constant, each such value being a member of the denotation under the {\type} interpretation of the relevant monomorphic {\type}.
\item
For each assignment of {\type}s to the {\type} variables occuring in the {\term}, an assignment of values for each distinct variable having free occurrences in the {\term}.
Two variables are considered the same only if their names and their {\type}s are the same.
The values assigned to the variables must be members of the set denoted by their {\type} in the context of the {\type} variable assignment.
\end{itemize}

In such a context the denotation of a {\term} can be established by rules depending on the top level abstract constructor as follows:

\begin{itemize}

\item
{\bf Variables}

A variable denotes the value assigned to it under the variable assignment.

\item
{\bf Constants}

A constant denotes the value assigned to the constant in the interpretation for the specific values assigned to {\type} variables in the current {\type}-variable assignment.

\item
{\bf Lambda Abstractions}

A lambda abstraction denotes the function whose domain is the set assigned to the {\type} of its bound variable in the current context and whose value at any point `p' is the value assigned to the {\term} which is the body of the lambda expression in the context formed from the current context by replacing the value assigned to the free variable having the same name aned {\type} as the bound variable of the abstraction by the value `p'.

\item
{\bf Applications}

Denotes the value of the function denoted by the first constituent {\term} at the point which is the value denoted by the second constituent {\term}.

\end{itemize}

\section{Semantics of {\term}s - Examples}

In these examples we use proof in {\Product} to illustrate the semantics of HOL {\term}s.
The particular proof facilities used will be explained in greater detail later.
For present purposes it is sufficient to know that an ML name ending in {\it _conv} is the name of a {\it conversion}, and that conversions are functions which take {\term}s as arguments and return theorems after constructing a proof of the theorem behind the scenes.
The theorems returned will normally be equations of which the left hand side is the {\term} supplied as argument, and the right hand side is some transformation of that {\term}.

The first example illustrates how the semantics of application and of lambda abstraction fit together to give ⦏β-reduction⦎.
This is the technical term for the process of substituting an argument of a function into the body of the function definition.

=SML
⦏β_conv⦎ ⌜(λx ⦁ x + 1) 3⌝;
=GFT Hol Output
val it = ⊢ (λ x⦁ x + 1) 3 = 3 + 1 : THM
=TEX

{\it
=INLINEFT
β_conv
=TEX
} is a very specific inference facility which does no more than the substitution.
In general we will illustrate semantic features using the more powerful higher level rewriting facilities which will do {\it β-reduction}, and many other useful simplifications.
=SML
rewrite_conv[] ⌜(λx ⦁ x + 1) 3⌝;
=GFT Hol Output
val it = ⊢ (λ x⦁ x + 1) 3 = 4 : THM
=TEX
In the above case not only was the {\it β-reduction} performed but also the evaluation of the resulting subexpression formed from numeric literals.

{\it η_axiom} is one of the primitive axioms of the HOL logic.
Its purpose is to assert that functions in HOL are {\it extensional}.
=SML
⦏η_axiom⦎;
=GFT Hol Output
val it = ⊢ ∀ f⦁ (λ x⦁ f x) = f : THM
=TEX
This is more transparently stated by {\it ext_thm}, a theorem derived from {\it η_axiom}.
{\it ext_thm} states that two functions are equal if and only if they have the same values at every point in their domains.
(Quantification over the domain is ensured by the {\type} inferrer, given that all functions in HOL are total functions over their domain {\type}.)
=SML
⦏ext_thm⦎;
=GFT Hol Output
val it = ⊢ ∀ f g⦁ f = g ⇔ (∀ x⦁ f x = g x) : THM
=TEX
The final examples are intended to illustrate the facts that:
\begin{itemize}
\item
⌜43⌝ is a natural number.
\item
⌜T⌝ is of {\type} ⓣBOOL⌝.
\item
The values of {\type} ⓣℕ⌝ are all greater than or equal to zero.
\item
There are just two values of {\type} ⓣBOOL⌝, ⌜T⌝ and ⌜F⌝ (true and false).
\end{itemize}
The facts are all provable using the automatic proof facilities provided in {\Product}, which the reader may verify by pasting in the standard ML expressions below into {\Product} and observing that the {\term} supplied as argument is transformed into a theorem (by proof behind the scenes).
=SML
prove_rule [] ⌜∃ x:ℕ		⦁	43 = x⌝;
prove_rule [] ⌜∃ b:BOOL	⦁	T = b⌝;
prove_rule [] ⌜∀ x:ℕ		⦁	x ≥ 0⌝;
prove_rule [] ⌜∀ b:BOOL	⦁	b = T ∨ b = F⌝;
=TEX

\section{Derived Syntax for {\term}s}

The primitive syntax described above for HOL {\term}s is complete in the sense that every HOL {\term} can be built up or taken apart using only the primitive constructors and destructors.
In the same way the primitive concrete syntax is complete, permitting any {\term} to be written down as applications or abstractions formed from variables or constants.

This Spartan concrete syntax is however not ideal for writing specifications in a concise and readable form.
For this purpose it is desirable to be able to adopt a richer variety of syntactic forms corresponding more with normal mathematical usage.

{\it Product} HOL provides `syntactic sugar' which permits specifications to be written in a more readable way.
These forms are also known as `derived syntax'.
Coresponding to the derived syntax supported by the HOL parser there are computational facilities which permit {\term}s to be processed in ways which correspond to the derived forms rather than the primitive forms.

To some extent it is arbitrary what features are treated in this way as part of the range of fully supported `derived syntax'.
A new datatype {\it DEST_TERM} is provided which gives a computational view of the derived syntax of HOL {\term}s.
A full range of constructors destructors and discriminators corresponding to the categories in this datatype are also available.

\subsection{DEST_TERM}

The full definition of the datatype {\it DEST_TERM} is as follows:

=GFT
datatype ⦏DEST_TERM⦎ =
	⦏DVar⦎		of string * TYPE
|	⦏DConst⦎	of string * TYPE
|	⦏DApp⦎		of TERM * TERM
|	⦏Dλ⦎		of TERM * TERM
|	⦏DEq⦎		of TERM * TERM
|	⦏D⇒⦎		of TERM * TERM
|	⦏DT⦎
|	⦏DF⦎
|	⦏D¬⦎		of TERM
|	⦏DPair⦎		of TERM * TERM
|	⦏D∧⦎		of TERM * TERM
|	⦏D∨⦎		of TERM * TERM
|	⦏D⇔⦎		of TERM * TERM
|	⦏DLet⦎		of ((TERM * TERM)list * TERM)
|	⦏DEnumSet⦎	of TERM list
|	⦏D∅⦎		of TYPE
|	⦏DSetComp⦎	of TERM * TERM
|	⦏DList⦎		of TERM list
|	⦏DEmptyList⦎	of TYPE
|	⦏D∀⦎		of TERM * TERM
|	⦏D∃⦎		of TERM * TERM
|	⦏D∃⋎1⦎		of TERM * TERM
|	⦏Dε⦎		of TERM * TERM
|	⦏DIf⦎		of (TERM * TERM * TERM)
|	⦏Dℕ⦎		of int
|	⦏DChar⦎	of string
|	⦏DString⦎	of string;
=TEX

The generalised destructor and constuctor for this derived abstract syntax are {\it dest_term} and {\it mk_term} respectively, which are ML functions with the following types.
=SML
⦏dest_term⦎	: TERM -> DEST_TERM;
⦏mk_term⦎	: DEST_TERM -> TERM;
=TEX

Specific constructors, destructors and discriminators for each category in this
%except the four which correspond to categories in the primitive syntax
may be obtained by the following algorithm:

\begin{enumerate}
\item
Take the name of the corresponding constructor from the definition of DEST_TERM.
\item
Drop the initial `D'.
\item
prefix with {\it mk_}, {\it dest_} or {\it is_} as appropriate.
\item
Change to lower case every upper case letter in the name and insert an underscore character in front of it.
\end{enumerate}

The signature of the constructors and destructors can be obtained directly from the type associated with the corresponding constructor in the datatype {\it DEST_TERM}.

Alternatively the {\it KWIC} index to the reference manual may be used to find a full listing of syntactic constructors and destructors.

For example, corresponding to the constuctor `DSetComp' three functions are available as follows:

=SML
⦏mk_set_comp⦎	: TERM * TERM -> TERM;
⦏dest_set_comp⦎	: TERM -> TERM * TERM;
⦏is_set_comp⦎ 		: TERM -> bool;
=TEX

It may be noted that in this structure the first four items correspond to the four constructors in the primitive abstract syntax, and therefore, in principle any {\term} could be classified as one of these four.
However, when a {\term} is transformed into a {\it DEST_TERM} using the function {\it dest_term}, it will only be treated as a constant, a application or an abstraction if it cannot be interpreted as one of the following derived {\term}s (all of which are in primitive {\term}s, either constants, applications or abstractions).

The derived syntax available for TERMs may be classified and discussed in then following categories:

\begin{itemize}
\item
prefix, infix and postfix operators
\item
binders
\item
pair matching lambda abstractions
\item
conditionals
\item
local definitions
\item
set displays and abstractions
\item
list displays
\item
literals (numeric, character, and string)
\end{itemize}

Of these the first two categories represent a general facility where any name can be given a special lexical status and will then be used in the concrete syntax in that special way.
This does not affect the computational processing of {\term}s.

Certain of the categories in the datatype DEST_TERM represent the treatment of important constants defined in the system as if they were fixtures of the language.
This has been done primarily for those constructs which in first order logic are normally considered as built in features of the language rather than as defined primitive or defined constants, which is their true status in HOL.
This includes the normal boolean operators, the quantifiers, and the constants `T' and `F' representing formulae which are true and false respectively in all standard models.

\subsection{Binders}

Constants having {\type}:
=INLINEFT
ⓣ('a → 'b) → 'c⌝
=TEX
\ (or any instance of this) may be declared as ⦏binder⦎s.

In normal use a constant which has been declared as a {\it binder} must be applied to a lambda expression with the `
=INLINEFT
λ
=TEX
' symbol omitted.
The lexical status can be suspended by prefixing the name by $\$$, and this must be done if it is required to use the name in any way other than by applying it to a lambda expression.

The following illustrates that an existentially quantified {\term} is just the same as an application of the constant ⌜ \$∃ ⌝ to a lambda expression (in this case `just the same as' means `is evaluated to yield exactly the same {\term}').
=SML
⌜∃ x⦁ x = 4⌝ =$ ⌜$∃ λ x⦁ x = 4⌝;
=IGN
new_const ("α", ⓣ('a → 'b) → 'c⌝);
declare_binder"α";
⌜α x⦁ x = 4⌝ =$ ⌜$∃ (λ x⦁ x = 4)⌝;
=TEX

\subsection{Nested Paired Abstractions}

Nested lambda abstractions (often called {\it curried}) can be abbreviated as follows:
=SML
⌜λx:ℕ⦁λy:ℕ⦁ (x,y)⌝ =$ ⌜λ x y:ℕ⦁ (x,y)⌝;
=TEX
The second occurrence of λ being omitted, together with the preceding ⦁.
The function denoted by the nested abstraction takes two natural numbers and returns a pair.
(``,'' is the infix pairing operator.)

Functions taking pairs may be written as `pattern matching lambda abstractions':
=SML
rewrite_conv[] ⌜(λ(x,y):ℕ × ℕ⦁ x)=Fst⌝;
=GFT ProofPower output
val it = ⊢ (λ (x, y)⦁ x) = Fst ⇔ T : THM
=TEX
This {\lamabstr} takes an argument which is an ordered pair, and returns the first element of the pair.

{\it Fst} is the function defined in {\Product} to select the first element from an ordered pair.
By use of extensionality of functions and the definition of {\it Fst} the rewriting facilities have reduced the given equation to ⌜T⌝.

These effects can be iterated or combined.
=SML
rewrite_conv []
	⌜(λ(x,y):ℕ × ℕ; ((v,w),z)⦁ x + y + v + w + z) (1,2) ((3,4),5)⌝;
=GFT ProofPower output
val it =
	⊢ (λ (x, y) ((v, w), z)⦁ x + y + v + w + z) (1, 2) ((3, 4), 5) = 15 : THM
=TEX

\subsection{Conditionals}

Conditionals may be written:

\begin{centering}

⦏if⦎ t1 ⦏then⦎ t2 ⦏else⦎ t3

\end{centering}

This {\term} denotes the same value as the {\term} ⌜ t2 ⌝ in contexts in which the {\term} ⌜ t1 ⌝ denotes ⌜T⌝, otherwise it denotes the same value as the {\term} ⌜t3⌝.

This is illustrated by the following examples:

=SML
rewrite_conv[] ⌜if T then 0 else 1⌝;
=GFT ProofPower output
val it = ⊢ (if T then 0 else 1) = 0 : THM
=TEX
=SML
rewrite_conv[] ⌜if F then 0 else 1⌝;
=GFT ProofPower output
val it = ⊢ (if F then 0 else 1) = 1 : THM
=TEX
=SML
rewrite_conv[] ⌜if 3>6 then x else y⌝;
=GFT ProofPower output
val it = ⊢ (if 3 > 6 then x else y) = y : THM
=TEX

\subsection{Let Clauses}

Local declarations may be made in the form:

\begin{centering}

⦏let⦎ defs ⦏in⦎ term

\end{centering}

This {\term} denotes in any context the same value as the {\term} ⌜term⌝ denotes in the context obtained by modifying the first context by subsituting the values denoted by the defining expressions in `defs' to the variables to which they are bound in `defs'.
i.e. it denotes the value of {\it term} when evaluated in the context of the local definitions in {\it defs}.
To eliminate a {\it let} clause, rewrite with ⦏let_def⦎.

=SML
rewrite_conv[let_def] ⌜let a = "Peter" in a,a⌝;
=GFT ProofPower output
val it = ⊢ (let a = "Peter" in (a, a)) = ("Peter", "Peter") : THM
=TEX

The left hand side of a definition may be a variable structure (known as a ⦏varstruct⦎) formed from simple variables using the infix pair constructor `,':
=SML
rewrite_conv[let_def] ⌜let (x,y) = (1,T) in (y,x)⌝;
=GFT ProofPower output
val it = ⊢ (let (x, y) = (1, T) in (y, x)) = (T, 1) : THM
=TEX
The left hand side of a definition may also be a (non-recursive) function definition:
=SML
rewrite_conv[let_def] ⌜let f x = x*x in f 3⌝;
=GFT ProofPower output
val it = ⊢ (let f x = x * x in f 3) = 9 : THM
=TEX
Multiple definitions may be given in a single let clause.
=SML
rewrite_conv[let_def] ⌜let a = 1 and b = 2 in (a,b)⌝;
=GFT ProofPower output
val it = ⊢ (let a = 1 and b = 2 in (a, b)) = (1, 2) : THM
=TEX
Multiple definitions are `evaluated in parallel', i.e. the variable introduced by one definition is only in scope in the body of the let clause, not in the other definitions.
=SML
rewrite_conv[let_def] ⌜let a = 2 and b = a*a in (a,b)⌝;
=GFT ProofPower output
val it = ⊢ (let a = 2 and b = a * a in (a, b)) = (2, a * a) : THM
=TEX
If the first definition is required to be in scope for the second definition then nested let clauses should be used, e.g.:
=SML
rewrite_conv[let_def] ⌜let a = 2 in let b = a*a in (a,b)⌝;
=GFT ProofPower output
val it = ⊢ (let a = 2 in let b = a * a in (a, b)) = (2, 4) : THM
=TEX


\subsection{Set Displays}

Sets may be entered as {\term}s by enumeration using the normal mathematical syntax, except that semi-colons are used instead of commas as separators in the list of elements:
=SML
rewrite_conv[]⌜9 ∈ {1*1; 2*2; 3*3; 4*4}⌝;
=GFT ProofPower Output
val it = ⊢ 9 ∈ {1 * 1; 2 * 2; 3 * 3; 4 * 4} ⇔ T : THM
=TEX
=SML
rewrite_conv[]⌜10 ∈ {1*1; 2*2; 3*3; 4*4}⌝;
=GFT ProofPower Output
val it = ⊢ 10 ∈ {1 * 1; 2 * 2; 3 * 3; 4 * 4} ⇔ F : THM
=TEX
Sets may also be entered as set abstractions:
=SML
rewrite_conv[]⌜9 ∈ {x | x < 12}⌝;
=GFT ProofPower Output
val it = ⊢ 9 ∈ {x|x < 12} ⇔ T : THM
=TEX
=SML
rewrite_conv[]⌜z ∈ {(x, y) | x < y}⌝;
=GFT ProofPower Output
val it = ⊢ z ∈ {(x, y)|x < y} ⇔ Fst z < Snd z : THM
=TEX

\subsection{List Displays}
A similar syntax is available for lists:
=SML
rewrite_conv[append_def]
	⌜[1*1; 2*2; 3*3; 4*4] @ [5*5]⌝;
=GFT ProofPower Output
val it = ⊢
	[1 * 1; 2 * 2; 3 * 3; 4 * 4] @ [5 * 5] = [1; 4; 9; 16; 25] : THM
=TEX
=SML
⌜Cons 1 [2;3;4;5]⌝;
=GFT ProofPower Output
val it = ⌜[1; 2; 3; 4; 5]⌝ : TERM
=TEX

\subsection{Literals}

Numeric literals consist of a sequence of decimal digits (no sign):
=SML
dest_simple_term ⌜123⌝;
=GFT ProofPower output
val it = Const ("123", ⓣℕ⌝) : DEST_SIMPLE_TERM
=TEX
As shown this is interpreted as a constant of {\type} ⓣℕ⌝ whose name is the same as the literal itself (except that leading zeros will have been omitted.

Character literals consist of a single character in \verb!`! characters:
=SML
dest_simple_term ⌜`α`⌝;
=GFT ProofPower output
val it = Const ("`α", ⓣCHAR⌝) : DEST_SIMPLE_TERM
=TEX
Again this is interpreted as a constant, in this case of {\type} ⓣCHAR⌝.
The name is prefixed by a \verb!`! character in order to prevent its name clashing with the name of any constant introduced by a user of {\Product} (but it is not terminated by \verb!`!).

String literals consist of zero or more characters in ``\verb!"!'' characters:
=SML
dest_simple_term ⌜"many characters αβγ"⌝;
=GFT ProofPower output
val it = Const ("\"many characters αβγ",
	ⓣCHAR LIST⌝) : DEST_SIMPLE_TERM
=TEX
In this case the name of the constant is prefixed with but not terminated by \verb!"!.

A string literal denotes a LIST of characters:
=SML
TOP_MAP_C string_conv ⌜"characters αβγ"⌝;
=GFT ProofPower output
val it = ⊢ "characters αβγ"
    = [`c`; `h`; `a`; `r`; `a`; `c`; `t`; `e`; `r`; `s`; ` `; `α`; `β`; `γ`] : THM
=TEX



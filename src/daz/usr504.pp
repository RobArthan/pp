=IGN
********************************************************************************
usr504.doc: this file is part of the PPDaz system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
Lemma 1 Ltd.% $Date: 2008/03/24 15:07:06 $ $Revision: 1.74 $ $RCSfile: usr504.doc,v $
=TEX
% TQtemplate.tex
% sed -n "/^=DOC/,/^=ENDDOC/p" <dtd516.doc | sieve tex > usr501E.tex
\documentclass[a4paper,11pt]{book}
\usepackage{ppusr}
\usepackage{ProofPower}
\usepackage{fleqn}
\def\SCCSversion{\VCVersion}
\def\SCCSdate{\VCDate}

\def\Hide#1{}
\def\daztool{Compliance Tool}
% just useful macros
\def\ltm{$^{\rm TM}$}
\def\Note#1{{\small\bf[ #1 ]}}
%\TPPabstractF{}

\USRmanual{Compliance Tool Language Description}
\USRref{USR504}
\USRisbns{151427776X}
\USRisbnl{978-1514277768}

\raggedbottom
\ftlinepenalty=9999
\makeindex

\begin{document}
\makeUSRfrontpage

\makeatletter
\def\USR@FPmanual{\begin{tabular}{c}Compliance Tool\\Language Description\end{tabular}}
\makeatother

\underscoreoff

\chapter*{CONTENTS}

\tableofcontents
\listoftables

\pagebreak

\setcounter{chapter}{-1}

\chapter{ABOUT THIS PUBLICATION} \label{intro}
\section{Purpose}

This document describes the syntax and semantics of the Compliance Notation as supported by the Compliance Tool supplied as an extension to {\Product}.

\section{Readership}
This document provides reference material intended to be read by users of the Compliance Tool.

\section{Related Publications}

A bibliography is given on page \pageref{BIBLIOG} of this document.

\begin{itemize}

\item
An overview of the of the Compliance notation can be found in the DRA document:

{\em A commentary on the Specification of the Compliance Notation for SPARK and Z} \cite{DRA/CIS(SE2)/PROJ/SWI/TR/1/1.1}.

\item
The formal specification of the Compliance notation may be found in the DRA document:

{\em Specification of the Compliance Notation for SPARK and Z (3 volumes)} \cite{DRA/CIS/CSE3/TR/94/27}.

\item
The SPARK subset of Ada is described in the book:

{\em High Integrity Ada --- The Spark Approach} \cite{barnes97}.

\item
The use of the Compliance Tool is described in:

{\CNUSERGUIDE}.

\item
A description of \Product{} may be found in:

{\em {\SOFTSERV}},

which also contains a list of other \Product{} documentation.

\item
The Ada language supported by the Compliance Tool
is a subset of Ada '83. Ada '83 is defined in the following book
(referred to as ALRM in this document):

{\em The Annotated Ada Reference Manual}\cite{AJPO83}

\end{itemize}


\section{Prerequisites}

It is assumed that the reader is familiar with Ada and Z.

\section{Acknowledgements}

Lemma 1 Ltd. gratefully acknowledges its debt to the many researchers (both academic and industrial) who have provided intellectual capital on which ICL and then Lemma 1 have
drawn in the development of {\Product} and the Compliance Tool.

Program Validation Limited (PVL) designed the SPARK subset of Ada,
on which the Compliance Notation subset of Ada was originally based.
We are indebted to the Defence Research Agency, Malvern (DRA), now called QinetiQ,
who designed the Compliance Notation and sponsored the development of SPARK and
of the Compliance Tool.

=TEX
\chapter{INTRODUCTION}\label{INTRODUCTION}

The Compliance Notation allows Ada programs to be presented in a literate programming style in which the order of presentation of program fragments is chosen by the writer rather than fixed by the Ada syntax rules.
A program presented in the Compliance Notation may be interspersed with formal specifications of the program's behaviour written in the specification language Z.
If the program conforms to the rules given in this language
description, a Z document can be produced automatically from its presentation using the Compliance Notation.
This Z document contains Z paragraphs representing the Ada types, functions and constants defined in the Ada program, together with conjectures, known as verification conditions (VCs), whose proof constitutes a correctness proof for the program against its specification.

The level of mathematical rigour in a Compliance Notation script is under the user's control.
At one extreme, no formal material at all need be included; at the other extreme, every subprogram can be formally specified and verified.
Most practical uses of the Compliance Notation will lie between these extremes.

The notation includes a feature allowing the syntactic and semantic rules that support formal modelling
to be bypassed completely so that Ada features, such as tasks, which are outside the scope of the
formal treatment, can be used.

The Compliance Notation is supported by the Compliance Tool, an extension to {\Product}.
In addition to syntax-checking, type-checking and document preparation functions, the Compliance Tool supports extraction of the Ada program from a Compliance Notation script and the generation of the Z document.
All the facilities of {\Product} are available for proving VCs. These facilities are augmented with a range of theorems and proof procedures which are customised for VC proofs.
The use of the Compliance Tool is described in \CNUSERGUIDE.

This document describes the syntax and semantics of the Compliance Notation.
The description of the syntax follows the structure of the Ada Language Reference Manual, \cite{AJPO83}, referred to as ALRM in the rest of this document.
Some features of Ada'95 as defined in~\cite{ISO95} are supported in the Compliance Notation, notably use type clauses and child packages, but ALRM is the primary reference.

The description of the semantics of the Compliance Notaion is informal, but is based on the formal specifications of the Compliance Notation prepared by the Defence Research Agency \cite{DRA/CIS/CSE3/TR/94/27}.


\chapter{COMPLIANCE NOTATION SYNTAX}\label{SYNTAX}
\vertbarfalse
\section{Introduction}
In this chapter, the syntax of the Compliance Notation is described.
The Compliance Notation as described here uses the {\ProductZ} dialect of Z.
The syntax of {\ProductZ} is described in \DESCRIPTION.

Sections \ref{2} to \ref{14} give the bulk of the description following the structure of chapters 2 to 14 of ALRM.

BNF syntax in this document is given using the same notation as in ALRM, except that reserved words are shown in double quotation marks rather than in a bold font.
Bold font is used for non-terminal symbols at their point of introduction. An index including these symbols is given at the end of this document.

Section \ref{15} describes the {\em web clauses} which comprise the outermost level of the notation (the level at which Compliance Notation constructs are interleaved with narrative text in a script).

In the description of the syntax, the following terminology is used:

\begin{enumerate}
\item A construct {\em is not handled formally} if the Compliance Notation allows the syntax for the construct in parts of the script which do not have a formal specification, but does not support formal reasoning about the construct.
\item A construct is {\em not supported} if the Compliance Notation does not allow the syntax for the construct.
\end{enumerate}

Unsupported constructs can be included in a script by means of the arbitrary Ada replacement facility (see \ref{15}).

\section{Lexical Elements}\label{2}
\subsection{Character Set}\label{2.1}
The character set for the Compliance Notation is the ISO seven-bit coded character set augmented with symbols required by the Z notation and certain special symbols described in section \ref{2.2} below.

\subsection{Lexical Elements, Separators, and Delimiters}\label{2.2}
The lexical elements of the Compliance Notation are the union of those for Ada as described in \cite{AJPO83} and those for {\ProductZ} as described in {\DESCRIPTION} augmented with a small list of symbols with special significance.

The special symbols are listed in table \ref{SS}:

\begin{table}[ht]
\begin{center}
{\ShowAllImages
\begin{tabular}{|l|l|}\hline
Symbol & Name \\\hline\hline
=INLINEFT
 ⓈCN
=TEX
& Compliance Notation start symbol \\\hline
=INLINEFT
 ■
=TEX
& Compliance Notation end symbol\\\hline
=INLINEFT
 ⊑
=TEX
& Statement refinement symbol \\\hline
=INLINEFT
 !⊑
=TEX
& Statement replacement symbol \\\hline
=INLINEFT
 ≡
=TEX
& Declaration replacement symbol \\\hline
=INLINEFT
 !≡
=TEX
&  Arbitrary Ada replacement symbol \\\hline
=INLINEFT
 ⟨
=TEX
& Left k-slot  symbol \\\hline
=INLINEFT
 ⟩
=TEX
& Right k-slot  symbol \\\hline
=INLINEFT
 Δ
=TEX
& Specification statement symbol \\\hline
=INLINEFT
 Γ
=TEX
& Assertion statement symbol \\\hline
=INLINEFT
 Ξ
=TEX
& Function specification statement symbol \\\hline
\end{tabular}}

\end{center}
\caption{Special Symbols}\label{SS}
\end{table}

The Compliance Notation start and end symbols are used like the analogous symbols for {\ProductZ} to delimit the Compliance Notation parts of a document (see \DESCRIPTION).
The other symbols are used within the Compliance Notation proper.
Several of these symbols are also used in Z; the grammar of the Compliance Notation is such that the extent of a Z expression or Z predicate within a valid Compliance Notation construct can always be unambiguously determined.

\subsection{Identifiers}\label{2.3}
The rules for identifiers are as in ALRM.
The Compliance Notation reserved words are listed in section \ref{2.9} below.

While Ada is not case-sensitive, Z is: when an Ada name is translated into a Z name it is translated into upper case.

\subsection{Numeric Literals}\label{2.4}
Integer literals are as in ALRM.

Based real literals are not handled formally.

\subsection{Character Literals}\label{2.5}

Character literals are as in ALRM.

\subsection{String Literals}\label{2.6}

String literals are as in ALRM.


\subsection{Comments}\label{2.7}
Ada comments are normally not passed on to the Ada program generated from a Compliance Notation script.
For compatibility with the SPARK examiner, comments beginning with
=INLINEFT
--#
=TEX
\ are optionally passed on to the Ada program in those syntactic positions where the SPARK examiner allows or requires annotations, as described in \cite{barnes97}.
Comments of this form are only allowed in these syntactic positions when the option is enabled.
If this option is disabled, comments of this form are ignored.

Comments may also be passed on to the Ada program using the arbitrary Ada replacement facility.

Wherever a SPARK annotation is permitted, a k-slot (see section \ref{3.9}) may be used to defer provision of the actual text of the annotation.
In the case of the assert annotation, which appears as part of a sequence of statements, use of a k-slot produces a construct which cannot be handled formally (see section \ref{5.1}).
To handle a deferred annotation formally, a specification statement with an empty frame and $true$ for the pre- and post-condition can be used; this specification statement can then be refined (see section \ref{14}) by the assert annotation, which is equivalent to a null statement for the purposes of VC generation.

\subsection{Pragmas}\label{2.8}

Pragmas in the Compliance Notation are supported in the following places:

\begin{enumerate}
\item at any place where a declaration or a statement would be allowed;
\item in a declarative part;
\item immediately after a context clause;
\item where a compilation unit would be allowed.
\end{enumerate}

Pragmas are just treated as data to be passed in to the Ada program generated from a Compliance Notation script and have no effect on the Z document.

\subsection{Reserved Words}\label{2.9}

In addition to the reserved words of the ALRM,
the Compliance Notation has the following keywords comprising
a ``\$'' character immediately followed by an identifier.
The keywords are not case-sensitive.

=GFT
	$auxiliary
	$block
	$by
	$con
	$deferred
	$implement
	$implicit
	$nothing
	$references
	$till
	$using
=TEX

\subsection{Allowable Replacements of Characters}

The replacement characters are not supported.

\section{Declarations and Types}\label{3}
\subsection{Declarations}\label{3.1}

Only the following forms of basic declaration are supported:

=GFT
⦏basic_declaration⦎ ::=
		object_declaration
	|	number_declaration
	|	type_declaration
	|	subtype_declaration
	|	subprogram_declaration
	|	package_declaration
	|	renaming_declaration
	|	deferred_constant_declaration
=TEX

A package declaration standing as a basic declaration inside a subprogram or another package declaration cannot be handled formally;
package declarations can only be handled formally when they are used as library units (i.e., at the top level).

\subsection{Objects and Named Numbers}\label{3.2}
=GFT
⦏object_declaration⦎  ::=
		constant_declaration
	|	variable_declaration

⦏constant_declaration⦎ ::=
		identifier_list ":" "constant" subtype_indication ":=" expression ";"

⦏variable_declaration⦎ ::=
		identifier_list ":" subtype_indication [ ":=" expression  ] ";"

⦏number_declaration⦎ ::=
		identifier_list ":" "constant" ":=" expression ";"

⦏identifier_list⦎  ::= identifier {"," identifier}
=TEX
Object declarations involving anonymous array subtypes are not supported.


\subsection{Types and Subtypes}\label{3.3}
\subsubsection{Type Declarations}\label{3.3.1}
=GFT
⦏type_declaration⦎ ::=	full_type_declaration
			|	private_type_declaration

⦏full_type_declaration⦎ ::=	"type" identifier [discriminant_part] "is" type_definition ";"

⦏type_definition⦎ ::=		enumeration_type_definition
			|	integer_type_definition
			|	real_type_definition
			|	array_type_definition
			|	record_type_definition
=TEX
\subsubsection{Subtype Declarations}\label{3.3.2}
=GFT
⦏subtype_declaration⦎ ::=	"subtype" identifier "is" subtype_indication ";"

⦏subtype_indication⦎ ::=	type_mark [constraint]

⦏type_mark⦎ ::=	name

⦏constraint⦎ ::=	range_constraint
		|	floating_point_constraint
		|	fixed_point_constraint
		|	index_constraint
		|	discriminant_constraint
=TEX

Note that a subtype indication need not include a constraint.

\subsection{Derived Types}\label{3.4}
Derived types are not supported.
\subsection{Scalar Types}\label{3.5}
=GFT
⦏range_constraint⦎ ::= "range" range

⦏range⦎ ::=	range_attribute
	|	simple_expression .. simple_expression
=TEX

A range constraint must not denote a null range when used within a type definition.
A VC may be generated asserting that the range is not null if it cannot be determined whether or not the range is null (e.g., if the range constraint appeals to compiler-dependent constants such as $INTEGER'LAST$).

\subsubsection{Enumeration Types}\label{3.5.1}

=GFT
⦏enumeration_type_definition⦎ ::=  "(" identifier {"," identifier} ")"
=TEX

Character literals are not supported as enumeration literals.
\subsubsection{Character Types}\label{3.5.2}
The predefined type $CHARACTER$ may be used;
however, user-defined character types are not supported
(see the restriction in section \ref{3.5.1} above).

\subsubsection{Boolean Types}\label{3.5.3}
No restrictions apply to this section of ALRM.
\subsubsection{Integer Types}\label{3.5.4}

=GFT
⦏integer_type_definition⦎ ::=
	signed_integer_type_definition | modular_type_definition

⦏signed_integer_type_definition⦎ ::= range_constraint

⦏modular_type_definition⦎ ::= "mod" expression
=TEX

No restrictions apply to this section of ALRM.
\subsubsection{Operations of Discrete Types}\label{3.5.5}

All predefined attributes of discrete types can be handled formally.
See section~\ref{Attributes} below for more information.

\subsubsection{Real Types}\label{3.5.6}
=GFT
⦏real_type_definition⦎ ::=
	floating_point_constraint | fixed_point_constraint
=TEX


\subsubsection{Floating Point Types}\label{3.5.7}
=GFT
⦏floating_point_constraint⦎ ::=
	floating_accuracy_definition [range_constraint]

⦏floating_accuracy_definition⦎ ::=
	"digits" simple_expression
=TEX

\subsubsection{Operations of Floating Point Types}\label{3.5.8}
All predefined attributes of floating point types can be handled formally.
See section~\ref{Attributes} below for more information.


\subsubsection{Fixed Point Types}\label{3.5.9}
=GFT
⦏fixed_point_constraint⦎ ::=
	fixed_accuracy_definition [range_constraint]

⦏fixed_accuracy_definition⦎ ::=
	"delta" simple_expression
=TEX

\subsubsection{Operations of Fixed Point Types}\label{3.5.10}
All predefined attributes of fixed point types can be handled formally.
See section~\ref{Attributes} below for more information.

\subsection{Array Types}\label{3.6}

=GFT
⦏array_type_definition⦎ ::=
	unconstrained_array_definition | constrained_array_definition

⦏unconstrained_array_definition⦎ ::=
	"array" "(" index_subtype_definition {"," index_subtype_definition} ")" "of"
		type_mark

⦏constrained_array_definition⦎ ::=
	"array" index_constraint "of" type_mark

⦏index_subtype_definition⦎ ::= type_mark "range" "<>"

⦏index_constraint⦎ ::= "(" discrete_range {"," discrete_range} ")"

⦏discrete_range⦎ ::= subtype_indication | range

=TEX

\subsubsection{Index Constraints and Discrete Ranges}\label{3.6.1}

A discrete range in an index constraint that is not given as a type mark and which
does not contain a discriminant is treated as if transformed
into one that is given as a type mark. This is done by treating the declaration as if it were preceded by a declaration
of a type with an automatically generated type mark
whose Z representation is equal to the required discrete range. The discrete
range is then treated as if it had been written
using the automatically generated type mark. See section~\ref{STI}.

An index constraint including a discriminant is only allowed in a record component
declaration. The translation of these constraints is described in section~\ref{RST} below.

\subsubsection{Operations of Array Types}\label{3.6.2}

All predefined attributes of array types can be handled formally.
See section~\ref{Attributes} below for more information.
In the case of the following attributes used with an argument, it must be possible
to evaluate the argument statically --- see section~\ref{4.9} for information
on static expressions.

=GFT
	A'FIRST(N)
	A'LAST(N)
	A'RANGE(N)
	A'LENGTH(N)
=TEX



\subsubsection{The Type String}\label{3.6.3}
The type $STRING$ is treated precisely as if defined by the following unconstrained array type definition (see section \ref{UAT}):
=GFT
	type STRING is array (POSITIVE range <>) of CHARACTER
=TEX

The catenation and ordering operators for string types are handled formally
as is concatenation of a character and a string or a string and a character.

\subsection{Record Types}\label{3.7}

=GFT
⦏record_type_definition⦎ ::=
	"record"
		component_list
	"end" "record"

⦏component_list⦎ ::=
	component_declaration {component_declaration}

⦏component_declaration⦎ ::=
	identifier_list ":" type_mark ";"
=TEX
\subsubsection{Discriminants}\label{3.7.1}

=GFT
⦏discriminant_part⦎ ::= "(" discriminant_specification {";" discriminant_specification}

⦏discriminant_specification⦎ ::= "identifier_list ":" type_mark
=TEX

\subsubsection{Discriminant Constraints}\label{3.7.2}
=GFT
⦏discriminant_constraint⦎ ::= actual_parameter_part
=TEX

\subsubsection{Variant Parts}\label{3.7.3}
Variant parts are not supported.
The syntax for $choice$ is given in section \ref{4.3}.

\subsubsection{Operations of Record Types}\label{3.7.4}

The attributes for record types can be handled formally.
See section~\ref{Attributes} for more information.

\subsection{Access Types}\label{3.8}
Access types are not supported.

\subsection{Declarative Parts}\label{3.9}

=GFT
⦏declarative_part⦎ ::=
	{basic_declarative_item} {later_declarative_item}

⦏basic_declarative_item⦎ ::=
	basic_declaration | representation_clause | use_clause | k_slot | using_declaration

⦏later_declarative_item⦎ ::= body
	| subprogram_declaration | package_declaration | k_slot

⦏body⦎ ::= proper_body | body_stub

⦏proper_body⦎ = subprogram_body | package_body
=TEX

A k-slot (short for Knuth-slot) serves in several places in the syntax and denotes a placeholder for an Ada construct. The Ada constructs which can be deferred in this way are a compilation, a basic declarative item, a statement, a visible part or a private part.

Using declarations are only allowed in the declarative part of a package body.
See section~\ref{7.1} for more information on using declarations.
See
=GFT
⦏k_slot⦎ ::= "⟨" commentary "⟩" [tag]

⦏tag⦎ ::= "(" digit{digit} ")" | identifier
=TEX

Here
=INLINEFT
⦏commentary⦎
=TEX
\ stands for an arbitrary sequence of characters not including
=INLINEFT
"⟩"
=TEX
.
The optional tag is used to identify the k-slot when the Ada construct whose place it is holding is provided in a refinement or replacement step.
If the tag is omitted, then an anonymous tag is implicitly introduced to identify the k-slot.
The next refinement or replacement step in the script that also omits the tag will be treated as if it referred to this anonymous tag.



\section{Names and Expressions}\label{4}
\subsection{Names}\label{4.1}
=GFT
⦏name⦎ ::=
		simple_name
	|	indexed_component
	|	selected_component

⦏prefix⦎ ::= name | function_call
=TEX

Use of an operator symbol as a name is not supported.

Slices are not supported.

Character literals and attributes are taken as primaries rather than names.

\subsubsection{Indexed Components}\label{4.1.1}

=GFT
⦏indexed_component⦎ ::= prefix "(" expression {"," expression} ")"
=TEX

\subsubsection{Slices}\label{4.1.2}
Slices are not supported.

\subsubsection{Selected Components}\label{4.1.3}

=GFT
⦏selected_component⦎ ::= prefix "." selector
=TEX

Other rules imply that the only supported forms of selected components denote a record component or an entity declared in the visible part of a package.

\subsubsection{Attributes}\label{4.1.4}
=GFT
⦏attribute⦎ ::= prefix "'" attribute_designator
	|	character_literal "'" attribute_designator
=TEX

Only the first form of attribute can be handled formally.

\subsection{Literals}\label{4.2}
Literals are as in ALRM except that the literal $null$
and based real literals are not handled formally.

\subsection{Aggregates}\label{4.3}

=GFT
⦏aggregate⦎ ::=
		"(" component_associations ["," "others" "=>" expression] ")"
	|	"(" "others" "=>" expression ")"

⦏component_associations⦎ ::=
		named_association {"," named_association}
	|	positional_association {"," positional_association}

⦏named_association⦎ ::=
	choice {"|" choice} "=>" expression

⦏positional_association⦎ ::= expression

⦏choice⦎ ::=
	simple_expression
	|	discrete_range
	|	"others"
	|	simple_name
=TEX

A mixture of named and positional component associations is not supported in an aggregate (although an $others$ choice is permitted when positional component associations are used).

To be handled formally, an aggregate must appear either as the operand of a qualified expression
or as a component in another aggregate
or in a variable or constant declaration.
The restriction means that the Ada type of the aggregate is available to guide its translation into Z.
In the case of a subaggregates, the types are given by the range attributes
of the multidimensional array type that qualifies the outermost enclosing aggegrate.

\subsubsection{Record Aggregates}\label{4.3.1}

To be handled formally, a record aggregate must appear either as the operand of a qualified expression
or as the initial value in a variable or constant declaration,
so that the Ada type is available to guide the translation into Z.

A record aggregate with an $others$ choice cannot be handled formally.

\subsubsection{Array Aggregates}\label{4.3.2}


To be handled formally, an array aggregate must appear either as the operand of a qualified expression
or as a subaggregate (i.e., inside another aggregate as part of a multidimensional
aggregate) or as the initial value in a variable or constant declaration.
The restriction means that the Ada type of the aggregate is available to guide its translation into Z.
In the case of subaggregates, the types are given by the range attributes
of the multidimensional array type that qualifies the outermost enclosing aggegrate.

\subsection{Expressions}\label{4.4}

=GFT
⦏expression⦎ ::=
	relation {"and" relation}	| relation {"and" "then" relation}
    |	relation {"or" relation}	| relation {"or" "else" relation}
    |	relation {"xor" relation}

⦏relation⦎ ::=
	simple_expression [relational_operator simple_expression]
    |	simple_expression ["not"] "in" range
    |	simple_expression ["not"] "in" type_mark

⦏simple_expression⦎ ::=
	[unary_adding_operator] term {binary_adding_operator term}


⦏term⦎ ::=
	factor {multiplying_operator factor}


⦏factor⦎ ::= primary ["**" primary] | "abs" primary | "not" primary

⦏primary⦎ ::=
	numeric_literal	|	aggregate		|	string_literal
    |	name			|	function_call		|	type_conversion
    |	qualified_expression	|	"(" expression ")"	| attribute
    |	auxiliary_expression

⦏auxiliary_expression⦎ ::= "⟦" z_expression "⟧"
=TEX

The $null$ expression and allocators are not supported.

See section \ref{4.2} for restrictions on literals.

Logical operators on boolean arrays are supported and handled formally.

=INLINEFT
⦏z_expression⦎
=TEX
\ stands for the construct called $Expr$ in {\DESCRIPTION}.

\subsection{Operators and Expression Evaluation}\label{4.5}
The syntax for the six classes of operator is exactly as in ALRM except that the catenation operator \& is not supported.

\subsubsection{Logical Operators and Short-circuit Control Forms}\label{4.5.1}
The short-circuit control forms $and\,then$ and $or\,else$ are treated formally as synonymous with $and$ and $or$ respectively.



\subsubsection{Relational Operators and Membership Test}\label{4.5.2}


\subsubsection{Binary Adding Operators}\label{4.5.3}

Addition and subtraction are only handled formally for integer types.

Catenation of one array element with another to produce a two-element
array is not handled formally.
Catenation of arrays with arrays and of arrays with array elements is handled formally.

\subsubsection{Unary Adding Operators}\label{4.5.4}

The unary adding operators are only handled formally for integer types.

\subsubsection{Multiplying Operators}\label{4.5.5}

The multiplying operators are only handled formally for integer types.

\subsubsection{Highest Precedence Operators}\label{4.5.6}

The absolute value operation is only handled formally for integer types.

\subsubsection{Accuracy of Operations with Real Operands}\label{4.5.7}

Ada real types are represented in Z as subsets of the type of real numbers.
The arithmetic operators on real numbers in Ada are translated into corresponding
operators in Z. These operators will therefore have the semantics defined for
them in the Z toolkit. This will typically be the semantics of the field of real
numbers of pure mathematics. The translation into Z is then an idealisation
of the Ada semantics and it is the user's responsibility to deal with issues
of numeric analysis by formulating pre- and post-conditions appropriately.

\subsection{Type Conversions}\label{4.6}

=GFT
⦏type_conversion⦎ ::= type_mark "(" expression ")"
=TEX

A type conversion appearing as an actual parameter whose corresponding formal parameter has mode $out$ or $in\,out$ cannot be handled formally.

A type conversion can only be handled formally if the operand and target types are integer
or real types. Type conversions from integer to real and from real to integer are supported.


\subsection{Qualified Expressions}\label{4.7}

=GFT
⦏qualified_expression⦎ ::=
	type_mark "'" "(" expression ")"
    |	type_mark "'" aggregate
=TEX

\subsection{Allocators}\label{4.8}
Allocators are not supported.

\subsection{Static Expressions and Static Subtypes}\label{4.9}

Not all static expressions can be completely evaluated when a Compliance Notation script is checked.
For example, the value of an attribute such as $INTEGER'FIRST$ depends on the compiler being used.
This sometimes results in a VC being generated (see sections~\ref{3.5} and~\ref{RangeInTypeDefinition}).

\subsection{Universal Expressions}\label{4.10}
Universal expressions of integer and real types are handled formally.

\section{Statements}\label{5}
\subsection{Simple and Compound Statements --- Sequences of Statements}\label{5.1}

=GFT
⦏sequence_of_statements⦎ ::= statement {statement}
=TEX
The statement forms comprises the optionally labelled, simple and compound statement forms of ALRM augmented with specification statements, assertion statements and k-slots.

=GFT
⦏statement⦎ ::=
		simple_statement
	|	compound_statement
	|	label statement
	|	[logical_constant_declaration] specification_statement [tag]
	|	assertion_statement
	|	k_slot_statement
=TEX
All the statement forms other than those associated with tasks and machine code insertions are supported:
=GFT
⦏simple_statement⦎ ::=
		null_statement
	|	assignment_statement
	|	procedure_call_statement
	|	exit_statement
	|	return_statement
	|	goto_statement

⦏compound_statement⦎ ::=
		if_statement
	|	case_statement
	|	loop_statement
	|	block_statement
=TEX
A specification statement gives a formal specification of a sequence of statements to be given later in the script (in a refinement step or a replacement step, see section~\ref{15}).
The formal specification comprises a list of variables called the frame and Z predicates called the pre-condition and the post-condition.
A specification statement may be preceded by an optional Z declaration defining variables known as logical constants.
=GFT
⦏logical_constant_declaration⦎ ::= "$con" z_declaration "⦁"

⦏specification_statement⦎ ::=
		"Δ" frame "[" [pre_condition ","] post_condition "]"
	|	"Δ" frame "{" pre_condition "}"

⦏frame⦎ ::= [ z_identifier {"," z_identifier} ]

⦏pre_condition⦎ ::= z_predicate

⦏post_condition⦎ ::= z_predicate
=TEX
{\raggedright
Here the symbols
=INLINEFT
⦏z_declaration⦎
=TEX
,
=INLINEFT
⦏z_identifier⦎
=TEX
\ and
=INLINEFT
⦏z_predicate⦎
=TEX
\ stand for the constructs referred to in {\DESCRIPTION} as {\it Decl}, {\it Id} and {\it Pred} respectively.

}

Either, but not both, the pre-condition or the post-condition may be omitted.
Braces are used instead of square brackets when the post-condition that has been omitted.
The omitted predicate is taken to be {\it true}.

The semantics of specification statements are discussed in section~\ref{VCG}.
Z variable names ending in a subscript 0,
e,g.,
=INLINEFT
MY_VAR⋎0
=TEX
, are called initial variables.
Initial variables are allowed to appear free in post-conditions, but may
not appear free in pre-conditions.

The Z declaration in a logical constant declaration must not comprise any
schemas-as-declarations.
The specification statement following a logical constant declaration must have a pre-condition, and that pre-condition must have the form:
=INLINEFT
X⋎1 = E⋎1 ∧ X⋎2 = E⋎2 ∧ ... X⋎k = E⋎k ∧ A
=TEX
\ or
=INLINEFT
X⋎1 = E⋎1 ∧ X⋎2 = E⋎2 ∧ ... X⋎k = E⋎k
=TEX
, where
=INLINEFT
X⋎1, X⋎2, ... X⋎k
=TEX
\ stand for the variables declared by the Z declaration.
The variables in the Z declaration may appear in any order, but the defining
equations in the pre-condition must satisfy a rule of definition-before-use.
I.e., No
=INLINEFT
X⋎i
=TEX
\ may appear free in
=INLINEFT
E⋎1
=TEX
; only
=INLINEFT
X⋎1
=TEX
\ may appear free in
=INLINEFT
E⋎2
=TEX
, only
=INLINEFT
X⋎1
=TEX
and
=INLINEFT
X⋎2
=TEX
\ may appear free in
=INLINEFT
E⋎3
=TEX
, and so on.

Anonymous tags are introduced for specification statements appearing as statements without a tag in the same way as for k-slots (see section \ref{3.9}).

=GFT
⦏assertion_statement⦎ ::=
		"Γ" "{" pre_condition "}"

=TEX
An assertion statement cannot be refined and has no effect on the translation of a script into Ada.
An assertion statement  otherwise has the same formal semantics as the specification statement
obtained by replacing the leading
=INLINEFT
Γ
=TEX
\ by a
=INLINEFT
Δ
=TEX
.
=GFT
⦏kslot_statement⦎ ::= k_slot
=TEX
A k-slot used as a statement stands as a placeholder for a sequence of statements to be given later in the script without any formal specification.
A k-slot used as a statement acts as a break in the chain of formal development and cannot be handled formally.
=GFT
⦏label⦎ ::= "<<" simple_name ">>"
=TEX
Labels have no significance in the Compliance Notation (since {\tt goto} statements are not handled formally).

=GFT
⦏null_statement⦎ ::= "null" ";" | "$nothing" ";"
=TEX

The statement {\tt \$nothing} is semantically equivalent to {\tt null} but causes no code to be generated in the Ada program.
It may be used, for example, when  formally specifying an {\tt if} statement whose {\tt else} part has been omitted in the Ada program:
the {\tt else} part can be given in the Compliance Notation script as a specification statement which is later refined by {\tt \$nothing}.

\subsection{Assignment Statement}\label{5.2}
=GFT
⦏assignment_statement⦎ ::= name ":=" expression ";"
=TEX

\subsection{If Statements}\label{5.3}

=GFT
⦏if_statement⦎ ::=
	"if" condition "then"
		sequence_of_statements
    {	"elsif" condition "then"
		sequence_of_statements }
    [	"else"
		sequence_of_statements ]

⦏condition⦎ ::= expression
=TEX

\subsection{Case Statements}\label{5.4}

=GFT
⦏case_statement⦎ ::=
	"case" expression is
		case_statement_alternative
	{	case_statement_alternative }
	"end" "case" ";"

⦏case_statement_alternative⦎ ::=
	"when" choice { "|" choice } =>
		sequence_of_statements
=TEX

See section \ref{4.3} for the syntax of $choice$.

\subsection{Loop Statements}\label{5.5}

=GFT
⦏loop_statement⦎ ::=
[block_name:]
	[iteration_scheme]
	[till_predicate] "loop"
		sequence_of_statements
	"end" "loop" [block_name] ";"

⦏block_name⦎ ::=
		simple_name
	|	"$block" simple_name

⦏iteration_scheme⦎ ::=
		"while" condition
	|	"for" loop_parameter_specification

⦏loop_parameter_specification⦎ ::=
	identifier "in" ["reverse"] discrete_range

⦏till_predicate⦎ ::=
		"$till" auxiliary_expression
=TEX

See section \ref{4.4} for the syntax of auxiliary expression.

To be handled formally, the sequence of statements comprising the body of a loop statement must comprise a single specification statement possibly with a tag (see section~\ref{5.1}).

A loop which is anonymous in Ada may be given a name in the Compliance Notation using the keyword
=INLINEFT
$block
=TEX
.

\subsection{Block Statements}\label{5.6}

=GFT
⦏block_statement⦎ ::=
	[block_name:]
	["declare"
		declarative_part]
	"begin"
		sequence_of_statements
	"end"	[block_name] ";"
=TEX

To be handled formally, a block statement must appear as the only statement in
the sequence of statements on the right-hand side
of a refinement step or a replacement step (see section~\ref{15}).

A block which is anonymous in Ada may be given a name in the Compliance Notation using the keyword
=INLINEFT
$block
=TEX
.

\subsection{Exit Statements}\label{5.7}

=GFT
⦏exit_statement⦎ ::=
	"exit" [loop_name] ["when" condition] ";"

⦏loop_name⦎ ::= identifier
=TEX

To be handled formally, the loop being exited by an exit statement must have a {\it till} predicate.

\subsection{Return Statements}\label{5.8}
=GFT
⦏return_statement⦎ ::=
	"return" [expression] ";"
=TEX

\subsection{Goto Statements}\label{5.9}

=GFT
⦏goto_statement⦎ ::=
	"goto" simple_name ";"
=TEX
Goto statements cannot be handled formally.
\section{Subprograms}\label{6}

\subsection{Subprogram Declarations}\label{6.1}
=GFT
⦏subprogram_declaration⦎ ::= ["$implicit"] subprogram_specification ";"

⦏subprogram_specification⦎ ::=
		informal_subprogram_specification
	|	formal_subprogram_specification

⦏informal_subprogram_specification⦎ ::=
		"procedure" identifier [formal_part]
	|	"function" designator [formal_part] "return" type_mark

⦏formal_subprogram_specification⦎ ::=
		"procedure" identifier [formal_part]
		procedure_specification_statement
	|	"function" designator [formal_part] "return" type_mark
		function_specification_statement

⦏designator⦎ ::= identifier

⦏formal_part⦎ ::=
	"(" parameter_specification { ";" parameter_specification } ")"

⦏parameter_specification⦎ ::=
	identifier_list : mode type_mark [":=" expression]

⦏mode⦎ ::= ["in"] | "in" "out" | "out"

⦏procedure_specification_statement⦎ ::=
		"Δ" frame ["Ξ" global_dependencies] "[" [pre_condition ","] post_condition "]"
	|	"Δ" frame ["Ξ" global_dependencies] "{" pre_condition "}"


⦏function_specification_statement⦎ ::=
		"Ξ" global_dependencies "[" [pre_condition ","] post_condition "]"
	|	"Ξ" global_dependencies "{" pre_condition "}"

⦏global_dependencies⦎ ::= [ z_identifier {"," z_identifier} ]
=TEX

A subprogram declaration preceded by the Compliance Notation keyword
=INLINEFT
$implicit
=TEX
\ allows a formal subprogram declared in a package specification to be used in a package body before its body is introduced.
The subprogram declaration is not included in the Ada program.

Use of an operator symbol as a function designator is not supported for user-defined functions.

A subprogram, procedure or function is said to be a {\em formal} subprogram, procedure or function if it has a specification statement and is said to be informal otherwise.
Subprogram calls can only be handled formally for formal subprograms.

A formal function may not have side effects --- the frame of its specification
statement is implicitly empty.

A formal subprogram may read the values
of variables declared outside the subprogram.
Such variables must be identified in the global dependencies list of the subprogram specification statement and must be in scope at the point that the subprogram is declared.
These can either be program variables or auxiliary variables.
If auxiliary variables are used, they must be declared in a package other than the package (if any) containing the subprogram specification.
The variables need not actually be global: they might be local to a
package or subprogram containing the function specification.

In a parameter specification, if a default expression is given, the default expression can only be
handled formally if it contains no variables.

\subsection{Formal Parameter Modes}\label{6.2}
Certain rules are applied when a formal procedure call is processed to ensure that parameter aliasing does not compromise the soundness of the VCs generated for the call.
The rules also make the soundness of the VCs independent of the parameter passing mechanism used by the Ada compiler.

The rules are defined using the notion of an {\it entire variable}
of an actual parameter of mode {\tt in out} or {\tt out}.
The entire variable is what is obtained by removing all array indexes and record component selectors from
the parameter. For example, the entire variable of the actual parameter
{\tt A(I).DAY} is~{\tt A}.

\begin{enumerate}
\item
A variable in the frame or global dependencies list
of the procedure must not appear as the entire variable in an actual parameter
of mode {\tt in out} or {\tt out}.
\item
A variable in the frame
of the procedure must not appear anywhere in any expression in the actual parameter list.
\item
The entire variable of an actual parameter
of mode {\tt in out} or {\tt out} must not occur anywhere else
in any expression in the parameter list.
\end{enumerate}

The last rule disallows an {\tt in out} or {\tt out} mode actual parameter
such as {\tt B(B(I))} in which {\tt B} appears both as the
entire variable and as part of the index expression.


\subsection{Subprogram Bodies}\label{6.3}

=GFT
⦏subprogram_body⦎ ::=
	[ "$deferred" ]
	subprogram_specification "is"
		[ declarative_part ]
	"begin"
		sequence_of_statements
	"end" [designator] ";"
=TEX

Exception handlers are not supported.

A  subprogram body may be preceded by the keyword
=INLINEFT
$deferred
=TEX
\ is called a deferred subprogram.
In a deferred subprogram,
the declarative part must contain only k-slots and the sequence of statements must comprise a single k-slot.
The generation of Z corresponding to the declarative parts and
the sequence of statements of a deferred subprogram is deferred until these k-slots are expanded.


This
\subsection{Subprogram Calls}\label{6.4}
=GFT
⦏procedure_call_statement⦎ ::=
	name [actual_parameter_part]";"

⦏function_call⦎ ::=
	name [actual_parameter_part]

⦏actual_parameter_part⦎ ::=
	"(" named_parameter {"," named_parameter} ")"
    |	"(" positional_parameter {"," positional_parameter}} ")"


⦏name_parameter⦎ ::= formal_parameter "=>" expression

⦏formal_parameter⦎ ::= simple_name

⦏positional_parameter⦎ ::= expression
=TEX
Positional and named parameter association may not be mixed within one subprogram call.

\subsection{Parameter and Result Type Profile --- Overloading of Subprograms}\label{6.6}

Overloading of subprogram names cannot be handled formally.

\subsection{Overloading of Operators}\label{6.7}

No overloading of operator symbols is supported except for the limited form of overloading of operator symbols using renaming declarations (see section \ref{8.5}).


\section{Packages}\label{7}
\subsection{Package Structure}\label{7.1}
=GFT
⦏package_declaration⦎ ::= package_specification ";"

⦏package_specification⦎ ::=
	"package" defining_program_unit_name "is"
		visible_part
    [	"private"
		private_part
	"end" [[parent_unit_name"."]simple_name]

⦏defining_program_unit_name⦎ ::= [parent_unit_name"."]simple_name

⦏parent_unit_name⦎ ::= name

⦏visible_part⦎ ::= { package_declaration }

⦏package_declaration⦎ ::=
   {	basic_declarative_item
    |	subprogram_declaration
    |	auxiliary_declaration
    |  renaming_declaration }

⦏private_part⦎ ::= { package_declaration }

⦏auxiliary_declaration⦎ ::= "$auxiliary" z_declaration ";"
=TEX

Here
=INLINEFT
z_declaration
=TEX
\ stands for the first alternative for the construct called $BasicDecl$ in {\DESCRIPTION}, i.e., a list of Z names followed by a colon followed by a Z expression.

A variable introduced by an auxiliary declaration is a Z variable referred to
as an
=INLINEFT
⦏auxiliary variable⦎
=TEX
.
Auxiliary variables are used in specification statements in a package specification as abstractions of all or part of the state of the package body.
Together with using declarations, auxiliary variables support data refinement.

=GFT
⦏package_body⦎ ::=
	"package" "body" defining_program_unit_name "is"
		declarative_part
 	["begin"
		sequence_of_statements ]
	"end" [[parent_unit_name"."]simple_name] ";"

⦏using_declaration⦎ ::=
	"$using" simple_declaration { simple_declaration }
	"$implement" z_identifier "$by" invariant ";"

⦏simple_declaration⦎ ::=
		object_declaration
	|	type_declaration
	|	subtype_declaration

⦏invariant⦎ ::= z_predicate
=TEX
Here
=INLINEFT
⦏z_identifier⦎
=TEX
\ and
=INLINEFT
⦏z_predicate⦎
=TEX
\ stand for the constructs called
{\it Id} and {\it Pred} respectively in {\DESCRIPTION}.

The visible part declarations after a using declaration may not be k-slots
or auxiliary variable declarations.

Auxiliary declarations and using declarations together support data refinement.
A using declaration relates the values taken by one or more variables in the package body with the value of a Z variable introduced in an auxiliary declaration in the package specification.
If using declarations are given the package body must have a sequence of statements.

\subsection{Package Specifications and Declarations}\label{7.2}

If a procedure in a package specification has a specification statement, then it is this specification statement which is used in the generation of VCs for calls of the procedure outside the package body.

When a package is named in a with clause, Z global variables are introduced representing the types, constants and functions in the package.
The Z variable names are derived from the Ada name by converting it to upper case and prefixing the result with the package name (also converted to upper case) and an `o'.
For example a function $fnc$ define in package $pck$ would give rise to the Z global variable $FNCoPCK$ defined in an axiomatic description capturing the signature and the formal specification of the function (if any).

\subsection{Package Bodies}\label{7.3}

If a subprogram has a specification statement both in the package specification and in the package body, then VCs are generated to ensure that the specification statement in the package body refines that in the package specification.

If a subprogram has a specification statement in the package body, then it is this specification statement which is used in the generation of VCs for calls of the subprogram inside the package body.
The subprogram will be treated as an informal procedure if it is used before its implementation within the package body.

When a package body is introduced, Z global variables are automatically bought into scope representing the types and constants, {\em but not the functions} in the package (as stated in the package specification).
The names of these global variables are {\em not} prefixed with the package name.
Global variables for any functions in the package are introduced as the function implementations are processed.

A Z global variable representing a function in the package is introduced at the point where the implementation of the function is provided.
Thus calls of the function will not be handled formally within the package body, if they appear before the implementation of the function.

\subsection{Private Type and Deferred Constant Declarations}\label{7.4}

=GFT
⦏private_type_declaration⦎ ::=
	"type" identifier "is [ "limited" ] "private" ";"

⦏deferred_constant_declaration⦎ ::=
	identifier_list : "constant" type_mark ";"
=TEX

The Z global variables corresponding to private type declarations and deferred constant declarations are introduced using the information in the actual declarations in the private part of the package specification.


\section{Visibility Rules}\label{8}
The visibility rules for the Compliance Notation may be described in terms of the Ada visibility rules given the method for extracting the Ada program from a literate script.
The Ada program is extracted from a literate script as follows:

\begin{enumerate}
\item Any auxiliary declarations are removed;
\item Any using declarations are replaced by their constituent simple declarations;
\item Any till predicates are removed;
\item Any references clauses are removed;
\item Any specification statements not occurring as statements are removed;
\item Any assertion statements are removed;
\item Any subprogram declarations preceded by the keyword
=INLINEFT
$implicit
=TEX
\ are removed;
\item The constituent web clauses of the script are scanned in order and k-slots and specification statements in each web clause are expanded in turn;
\begin{enumerate}
\item A k-slot is expanded by replacing its text by the text on the right hand side of the corresponding replacement step or arbitrary replacement step and then, in the case of an ordinary replacement step, recursively expanding any k-slots or specifications in the resulting text;
\item A specification statement occurring as a statement is  expanded by replacing its text by the text on the right hand side of the corresponding refinement step, replacement step or arbitrary replacement step and then recursively expanding any k-slots or specifications in the resulting text;
\end{enumerate}
\item All statements of the form ``{\tt nothing;}'' are removed and any else parts, others parts or
package initialisation statements which become empty as a result are also removed;
\item Any procedure or function specification statements are removed.
\end{enumerate}

The phrase ``current Ada program'' or ``current Ada program for $C$'' is used below to refer to the result of carrying out the above steps on an initial fragment of the literate script, up to the point at which some construct, $C$, appears.

If any k-slots or specification statements remain unexpanded after the above steps, then the script
is incomplete.

\subsection{Declarative Region}\label{8.1}
The declarative region in which a Compliance Notation construct occurs is determined by the declarative region it occupies in the current Ada program.

\subsection{Scope of Declarations}\label{8.2}
Within one compilation unit, the scope of a declaration includes any Compliance Notation construct, $C$, which would be in the scope of the declaration in the current Ada program for $C$.

\underscoreon
A compilation unit $U_1$ may only refer to entities defined in another compilation unit, $U_2$, under the following circumstances:
{\em(a)}, $U_1$ is the package body implementing the package specification in $U_2$ and the entity is a type, constant or variable,
or, {\em(b)}, $U_2$ gives the package specification of a package identified in the context clause of $U_2$.
In case {\em(a)}, the entity must be referred to by its simple name, without a package name prefix.
\underscoreoff

\subsection{Visibility}\label{8.3}

No overloading of names or operator symbols is allowed except for the limited form of overloading of operator symbols using renaming declarations (see section \ref{8.5}).

Declaring a name in an inner scope which is already declared in an outer scope is not handled formally.

\subsection{Use Clauses}\label{8.4}
=GFT
⦏use_clause⦎ ::= use_package_clause | use_type_clause

⦏use_package_clause⦎ ::= "use" identifier {"," identifier} ";"

⦏use_type_clause⦎ ::= "use" "type" identifier {"," identifier} ";"
=TEX

A use package clause makes the simple names declared in one or more packages available for use
in the current declarative region. Occurrences of the simple names are converted into the corresponding
expanded names when handled formally.

A package mentioned in a use clause must have been processed formally and must not
contain any unexpanded k-slots.
A package may not be mentioned more than once in the use
clauses occurring in each declarative region.

The syntax of Ada '95 use type clauses is supported. Use type clauses have no semantic effect
in the Compliance Notation (since the Z representations of the predefined operators for any
type are always directly available and may not be redefined).

\subsection{Renaming Declarations}\label{8.5}
=GFT
⦏renaming_declaration⦎ ::=
		object_renaming
	|	package_renaming
	|	operator_symbol_renaming
	|	subprogram_renaming

⦏object_renaming⦎ ::= identifer ":" type_mark renames name semi

⦏package_renaming⦎ ::= package identifier "renames" name semi

⦏operator_symbol_renaming⦎ ::=
 		"function" operator_symbol formal_part "return" type_mark
			"renames" simple_name "." operator_symbol ";"

⦏subprogram_renaming⦎ ::=
		informal_subprogram_specification
		"renames" simple_name "." operator_symbol ";"
	|	informal_subprogram_specification "renames" name ";"

=TEX

In an operator symbol renaming, the two operator symbols must be the same.
This form of renaming declaration is intended for operators such as
=INLINEFT
pck."+"
=TEX
\ introduced implicitly when a numeric type is declared in package $pck$.

If the object in an object renaming is a constant, a Z global variable is introduced and defined
to be equal to the renamed constant.
If the object is a variable, the new name for the variable may
be used as a synonym for the old name in Ada and Z expressions in the scope of the renaming declaration.

A package renaming, {\tt package new renames old},
is considered to be equivalent to the declaration of a package named {\tt new}
containing a sequence of renaming declarations and
subtype declarations.
Each declaration in the package {\tt new}
corresponds to a name declared in the package {\t old}. If a name in the package {\tt old}
denotes a type, the corresponding declaration in {\tt new} is a subtype declaration, e.g.,
{\tt subtype ty is old.ty}. If the name is an object or subprogram, then
the corresponding declaration is a renaming declaration, e.g., {\tt x : float renames old.x}.


In a subprogram renaming,
if the subprogram being renamed is a formal procedure, then the formal specification for the new procedure name is taken from that for the old one.
If the subprogram being renamed is a function or a predefined operator, a Z global variable for the new function name is introduced and defined to be equal to the Z global variable corresponding
to the renamed function or predefined operator.

\subsection{The Package Standard}\label{8.6}

Compliance Notation scripts are processed in an environment which includes the declarations in the package $STANDARD$ with the following restrictions:

\begin{enumerate}
\item
The enumeration literals of the type $CHARACTER$ are not provided.
\item
The package $ASCII$ is not provided.
\item
The only predefined operators for the type $STRING$ are $=$,
=INLINEFT
&
=TEX
, and
=INLINEFT
/=
=TEX
.
\item
The type $DURATION$ is not provided.
\end{enumerate}
\subsection{The Context of Overload Resolution}\label{8.7}

No overloading of names is supported except for the limited form of overloading of predefined operators using renaming declarations (see section \ref{8.5}).
The question of overload resolution does not arise for predefined operators, since the underlying semantics of these operators is built into the notation.

\section{Tasks}\label{9}
Tasks are not supported.

\section{Program Structure and Compilation Issues}\label{10}

\subsection{Compilation Units --- Library Units}\label{10.1}

=GFT
⦏compilation⦎ ::= k_slot | compilation_unit {compilation_unit}

⦏compilation_unit⦎ ::= context_clause library_unit | context_clause secondary_unit

⦏library_unit⦎ ::= [private] package_declaration | subprogram_body

⦏secondary_unit⦎ ::= library_unit_body | subunit

⦏library_unit_body⦎ ::= package_body
=TEX

The only declarations allowed as compilation units are package declarations.

Generic packages are not supported.

\subsubsection{Context Clauses --- With Clauses}\label{10.1.1}

=GFT
⦏context_clause⦎ ::= { with_clause | references_clause | use_clause } ;

⦏with_clause⦎ ::= "with" simple_name {"," simple_name} ";"

⦏references_clause⦎ ::= "$references" simple_name {"," simple_name} ";"
=TEX
A with clause must refer to a package not a library subprogram.

To allow use of packages for purely informal purposes, the names in a with clause need not all identify packages whose specifications have been provided.
The use of entities declared in such packages is not handled formally.

A context clause may also include a references clause.
A references clause is used to identify packages that are needed to specify the semantics of a compilation unit.
This allows such packages to be identified without including them in a with clause.

\subsection{Subunits of Compilation Units}

=GFT
⦏body_stub⦎ ::=
	subprogram_specification "is" "separate" ";"
    |	"package" "body" simple_name "is" "separate"

⦏subunit⦎ ::=
	"separate" "(" name ")" proper_body
=TEX

Tasks are not supported.

\section{Exceptions}\label{11}
Exceptions are not supported.

\section{Generic Units}\label{12}
Generic units are not supported.

\section{Representation Clauses and Implementation-Dependent Features}\label{13}

\subsection{Representation Clauses}

=GFT
⦏representation_clause⦎ ::= type_representation_clause | address_clause

⦏type_representation_clause⦎ ::= length_clause
	| enumeration_representation_clause | record_representation_clause
=TEX
\subsection{Length Clauses}\label{13.2}

=GFT
⦏length_clause⦎ ::= "for" attribute "use" simple_expression ";"
=TEX

\subsection{Enumeration Representation Clauses}\label{13.3}

=GFT
⦏enumeration_representation_clause⦎ ::= "for" simple_name "use" aggregate ";"
=TEX

\subsection{Record Representation Clauses}\label{13.4}

=GFT
⦏record_representation_clause⦎ ::=
	"for" simple_name "use"
	"record" [ alignment_clause ]
	   	{ component_clause }
	"end" "record" ";"

⦏alignment_clause⦎ ::= "at" "mod" simple_expression ";"

⦏component_clause⦎ ::= name "at" simple_expression "range" range ";"
=TEX
\subsection{Address Clauses}\label{13.5}

=GFT
⦏address_clause⦎ ::= "for" simple_name "use" "at" simple_expression ";"
=TEX

\subsection{Change of Representation}\label{13.6}

Note that because derived types are not supported the approach taken in the example in section 13.6 of ALRM would not be supported by the Compliance notation.

\subsection{The Package System}\label{13.7}

The Compliance Notation does not provide the package $SYSTEM$.

\subsection{Machine Code Insertion}\label{13.8}

Machine code insertions are not supported.

\subsection{Interface to Other Languages}\label{13.9}
The interface pragma is supported (as are any other pragmas meeting the restrictions of section \ref{2.8}).

\subsection{Unchecked Programming}\label{13.10}

The generic library subprograms for unchecked storage  deallocation and unchecked type conversions are not supported.


\section{Input-Output}\label{14}
The predefined packages for input-output are not provided.

\section{Web Clauses and Compliance Notation Scripts}\label{15}
=GFT
⦏web_clause⦎ ::=
	z_paragraph
    |	ⓈCN
		compilation
	■
    |	ⓈCN
		refinement_step
	■
    |	ⓈCN
		replacement_step
	■
    |	ⓈCN
		arbitrary_replacement_step
	■

⦏refinement_step⦎ ::=
	[ tag ] "⊑" sequence_of_statements

⦏replacement_step⦎ ::=
   	[ tag ] "!⊑" sequence_of_statements
    |	[ tag ] "≡" compilation
    |	[ tag ] "≡" private_part
    |	[ tag ] "≡" visible_part
    |	[ tag ] "≡" declarative_part

⦏arbitrary_replacement_step⦎ ::=
	[ tag ] "!≡" lexical_elements
=TEX

If the tag is omitted in any of the above constructs, the refinement, replacement or arbitrary replacement applies to the immediately preceding k-slot or specification statement without an explicit tag.

The kind of refinement or replacement must be appropriate to the corresponding k-slot or specification statement.
For example, it is not allowed to refine a declaration k-slot or to replace a specification statement with a declaration.
This restriction does not apply to an arbitrary replacement step.

A replacement step which introduces a declaration into a declarative part has the implicit effect of widening the frames of any specification statements in the scope of that declarative part to include the variables declared on the right-hand side of the replacement step.
Thus, local variables introduced in this way after a specification statement become available for use in the refinement of that specification statement.

Here,
=INLINEFT
⦏lexical_elements⦎
=TEX
\ stands for an arbitrary sequence of the lexical elements of Ada.
This means that string and character quotation characters must be properly balanced in an arbitrary replacement step.
No other restrictions apply to the right-hand side of an arbitrary replacement step, which is copied verbatim, with all format effectors preserved, into the Ada program when the replacement is expanded.

=GFT
⦏compliance_notation_application⦎ ::=	compliance_notation_script
						{compliance_notation_script}

⦏compliance_notation_script⦎ ::=	web_clause
					{web_clause}
=TEX

A compliance notation application is made of one or more scripts each of which is a sequence of web clauses.
In practice, the scripts are interleaved with {\Product} metalanguage commands to identify the scripts (see section \ref{PS} and \CNUSERGUIDE).

A script may contain at most one Ada compilation unit.

The compliance notation requires any formal dependencies between scripts to be expressed in a linear sequence.

\chapter{COMPLIANCE NOTATION SEMANTICS}\label{SEMANTICS}
The semantics of the Compliance Notation may be understood in terms of the translation of one or more Compliance Notation script into {\em(a)} Ada source code, and {\em(b)} one or more Z documents.
The translation into Ada source code is described in section \ref{8} above.
The translation of a script into a Z document is described in this chapter.

The main purpose of the Z document is to provide a set of Z conjectures, the verification conditions, or VCs, whose truth entails that the formally specified parts of the Ada program satisfy their specifications.
The Z document also contains any Z paragraphs which appear in the script together with Z paragraphs that are automatically generated from some of the Ada declarations in the script.
These Z paragraphs together with the extensions to the Z library described in chapter \ref{cn} provide the vocabulary in terms of which the VCs are couched.

In sections \ref{ToE} to \ref{PS} below, the generation of the Z document is described under the following headings:

\begin{description}
\item[Expressions] Ada expressions are translated into Z expressions appearing in VCs or in generated Z paragraphs according to the context of use.
\item[Declarations] Type, constant and function declarations are translated into  Z paragraphs.
\item[VC Generation] VCs are generated for refinement steps and for certain other constructs.
\item[Domain Conditions] Optionally, VCs may be generated with additional hypotheses justifying the
application of partial functions.
\item[Program Structure] The top level structure of the literate scripts gives rise to the creation of one or more {\Product} theories.
\end{description}

\section{Translation of Expressions}\label{ToE}

In this section the translation of Ada expressions into Z is described.
The examples used depend on the following definitions:
=GFT
   type ⦏DAY⦎ is (⦏MON⦎, ⦏TUE⦎, ⦏WED⦎, ⦏THU⦎, ⦏FRI⦎, ⦏SAT⦎, ⦏SUN⦎);
   subtype ⦏INDEX⦎ is INTEGER range 2 .. 5;
   type ⦏ARR⦎ is array (INDEX) of DAY;
   type ⦏REC⦎ is record  START : DAY; FINISH : DAY; end record; 	
   type ⦏ARR2⦎ is array (INDEX, DAY) of REC;
   function ⦏MAX⦎ (x, y: DAY) return DAY Ξ [true];
   function ⦏CONST⦎ return INTEGER Ξ [CONST = 1001];
   function ⦏SUMXY⦎ return INTEGER Ξ X, Y [SUMXY(X, Y) = X + Y];
   function ⦏XPLUSY⦎ (Y : INTEGER) return INTEGER Ξ X [XPLUSY(X)(Y) = X + Y];
   ArrVar : ⦏ARR⦎;
   Arr2Var : ⦏ARR2⦎;
   RecVar : ⦏REC⦎;
=TEX

Sections \ref{Literals} to \ref{Type} below discuss the translation of the various forms of Ada expression.
Many of these translations depend on the some extensions to the Z library which support predefined types and their operators and attributes.
These extensions are described in chapter \ref{cn}.

\subsection{Literals}\label{Literals}
Null literals and based real literals cannot be handled formally and do not have a translation.

Integer literals both based and decimal are translated into Z decimal literals.
For example, both $35$ and
=INLINEFT
2#0010_0011#
=TEX
\ are translated as $35$.

Real literals are translated into expressions involving the operator
=INLINEFT
(_e_)
=TEX
.
For example,
=INLINEFT
3.14159
=TEX
\ is translated as
=INLINEFT
314159 e ~5
=TEX
.
The translation,
=INLINEFT
i e j
=TEX
\ of a real literal is always normalised so that $i$ is not divisible by 10.

An enumeration literal is translated in the same way as an identifier (see below).

\subsection{Identifiers}
A simple name is translated into Z as a variable (global or local) by converting all letters into upper case.
For example, both $Var$ and $var$ are translated as $VAR$.

An identifier prefixed by a package name (which is strictly speaking a selected component in Ada terminology) is translated into a Z variable by converting all letters into upper case and replacing each `.' by `$o$'.
For example, $Pack.object$ is translated as $PACKoOBJECT$.

Attribute names are translated into Z global variables whose names are formed by converting letters to upper case and replacing the prime with a `$v$'.
For example, $ARR'LENGTH$ is translated as $ARRvLENGTH$.

\subsection{Record Aggregates}\label{Records}
A record aggregate using either named or positional association is translated into a Z binding display.

For example both
=INLINEFT
REC'(WED, SUN)
=TEX
\ and
=INLINEFT
REC'(START=>WED, FINISH=>SUN)
=TEX
\ are translated as
=INLINEFT
(FINISH ≜ SUN, START ≜ WED)
=TEX
.

\subsection{Array Aggregates}\label{Array}
A positional array aggregate with no $others$ part is translated as a Z sequence display composed with a numerical shift operator.
For example,
=GFT
		ARR'(SAT, SUN, MON, TUE)
=TEX
is translated as
=GFT
		succ ↗ 1 - ARRvFIRST ↕ ⨾ ⟨SAT, SUN, MON, TUE⟩.
=TEX
A named array aggregate with no $others$ part is translated as the union of functions with a singleton range, and with a domain formed by representing the aggregate choice as a union of singleton sets or integer intervals:
For example,
=GFT
		ARR'(MON .. THU | FRI => WED, SAT | SUN => TUE);
=TEX
is translated as
=GFT
		((MON .. THU) ∪ {FRI} × {WED}) ∪ ({SAT, SUN} × {TUE}).
=TEX

An $others$ part is represented by a total function on the index set of the array with a singleton range.
This is overridden with the translation of the rest of the aggregate (if any)
For example,
=GFT
		ARR'(others=>MON)
=TEX
is translated as
=GFT
		(ARRvRANGE × {MON}),
=TEX
and
=GFT
		ARR'(SAT, SUN, others=>MON)
=TEX
is translated as
=GFT
		(ARRvRANGE × {MON}) ⊕ (succ ↗ 1 - ARRvFIRST ↕ ⨾ ⟨SAT, SUN⟩).
=TEX

For $n \ge 2$, an $n$-dimensional array aggregate is translated by first applying
the above translation as if it were an array of arrays of arrays of arrays \ldots (where
each array is one-dimensional). This is done using the attributes
of the  $n$-dimensional array type in place of the qualifying type marks for
the subaggegrates.
The result is then converted to the right type using one of the functions
{\it array_agg2},
{\it array_agg3},
and so on, defined in the extensions to the Z library described in chapter \ref{cn}.
For example,
the aggregate:

=GFT
	ARR2'(	2 => (
			MON => REC'(MON, TUE),
			others => REC'(TUE, WED)),
		others => (
			others => REC'(SAT, SUN)) );
=TEX
is translated as:
=GFT
	((ARR2vRANGEv1 × {ARR2vRANGEv2 × {(FINISH ≜ SUN, START ≜ SAT)}})
		⊕ ({2} × {(ARR2vRANGEv2 × {(FINISH ≜ WED, START ≜ TUE)})
			⊕ ({MON} × {(FINISH ≜ TUE, START ≜ MON)})}))
=TEX

\subsection{Unary Expressions}\label{Unary}

Unary plus is simply discarded in the translation.
I.e., $+Exp$ is translated in the same way as $Exp$.

Other unary expressions are translated into an application of a Z function representing the operator to the translation of the operand.
The Z functions representing the operators are either taken from the Z library or are defined in the theory $cn$ described in chapter \ref{cn}.

\subsection{Binary Expressions}\label{Binary}

Binary expressions are translated into an application of an infix Z function representing the operator to the translated operands.
The Z functions representing the operators are either taken from the Z library or are defined in the theory $cn$ described in chapter \ref{cn}.
For example,
=INLINEFT
not(abs (-2) = (1 + y))
=TEX
\ is translated as
=INLINEFT
not (abs (~ 2) eq (1 + Y))
=TEX
.

\subsection{Membership}\label{Membership}

Membership of a range is treated in the same way as the binary expressions
and is supported by the operators $mem$ and $notmem$ in the theory $cn$ described in chapter \ref{cn}.

\subsection{Attributes}\label{Attributes}
The names of attributes are translated into Z identifiers as follows: function calls or
other complex expressions in the prefix are replaced by the translation of
their type; occurrences of the attribute
=INLINEFT
P'BASE
=TEX
\ are replaced by the Z identifier for the base type of
=INLINEFT
P
=TEX
;
the result of these replacements is then  translated as an Ada name in the usual way;
the prime character before the attribute
designator is translated as a lower-case `v', the attribute designator is translated
into upper-case; finally, if the attribute has an argument, then the argument is statically
evaluated to give an integer, say {\cal N} and then `v{\cal N}' is appended to the Z identifier.
For example,
=INLINEFT
arr'range
=TEX
\ and
=INLINEFT
arr'length(2)
=TEX
\ are translated as
=INLINEFT
ARRvRANGE
=TEX
\ and
=INLINEFT
ARRvLENGTHv2
=TEX
\ respectively.
An attribute with an argument that cannot be statically evaluated cannot be handled formally.

The Compliance Notation divides the predefined attributes into three categories, A, B and C.
The Z paragraphs that support category A attributes are generated automatically when a type
declaration that introduces the attribute is processed. Examples of these Z paragraphs for
the various sorts of type declaration are given in section~\ref{ToD} below.

The Z paragraphs that support category B attributes are generated if necessary when a use of
the attribute is encountered. For example, when the expression
=INLINEFT
float'small
=TEX
\ is processed, if the Z global variable
=INLINEFT
FLOATvSMALL
=TEX
\ is not in scope, then the following axiomatic description is generated

=GFT
	FLOATvSMALL : ℝ
=TEX

Attributes in category C are only supported formally if they are preceded in
the script by a Z paragraph introducing the global variable that corresponds
to the attribute. (Note that this usage is also acceptable for category B attributes,
but would cause a Z type-checking error for a category A attribute).

The category A and B attributes are listed in the following table.
All other attributes except
=INLINEFT
P'BASE
=TEX
\ are in category C. The attribute
=INLINEFT
P'BASE
=TEX
\ is a special case as described in the rule for translating attribute names above.

\begin{center}
\begin{tabular}{|l|l|l|}\hline
Attribute & Type & Category \\\hline\hline
P'DELTA	& Real	& A	\\\hline
P'DIGITS	& Integer & A	\\\hline
P'FIRST	& P	& A	\\\hline
P'LAST	& P	& A	\\\hline
P'LENGTH	& Integer	& A	\\\hline
P'POS	& Function from Integer to P	& A	\\\hline
P'PRED	& Function from P'BASE to P'BASE	& A\\\hline
P'SUCC	& Function from P'BASE to P'BASE	& A	\\\hline
P'VAL	& Function from P to Integer	& A	\\\hline
P'RANGE	& Range (of elements of P)	& A	\\\hline
P'AFT	& Integer	& B	\\\hline
P'EMAX	& Integer	& B	\\\hline
P'EPSILON	& Real	& B	\\\hline
P'FORE	& Integer	& B	\\\hline
P'LARGE	& Real	& B	\\\hline
P'MACHINE\_EMAX	& Integer	& B	\\\hline
P'MACHINE\_EMIN	& Integer	& B	\\\hline
P'MACHINE\_MANTISSA	& Integer	& B	\\\hline
P'MACHINE\_OVERFLOWS	& Boolean	& B	\\\hline
P'MACHINE\_RADIX	& Integer	& B	\\\hline
P'MACHINE\_ROUNDS	& Boolean	& B	\\\hline
P'MANTISSA	& Integer	& B	\\\hline
P'SAFE\_EMAX	& Integer	& B	\\\hline
P'SAFE\_LARGE	& Real	& B	\\\hline
P'SAFE\_SMALL	& Real	& B	\\\hline
P'SIZE	& Integer	& B	\\\hline
P'SMALL	& Real	& B	\\\hline
\end{tabular}
\end{center}

\subsection{Indexed Components}\label{Indexed}
An indexed component with a one-dimensional index is translated into a Z function application of the function representing the array to the translation of the index expression.
For example,
=INLINEFT
ArrVar(3)
=TEX
\ is translated as
=INLINEFT
ARRVAR 3
=TEX
.

For $n \ge 2$, an indexed component with an $n$-dimensional into a Z function application
of the function representing the array to the Z tuple whose components are given by
translating the $n$ index expressions. For example,
=INLINEFT
Arr2Var(3, MON)
=TEX
\ is translated as
=INLINEFT
ARR2VAR (3, MON)
=TEX
.

(Note: the above description does not apply to an indexed component appearing as the left-hand side of an assignment statement.
Such an assignment is effectively treated as an assignment of an aggregate value to the whole array, see section \ref{Assignment}.)

\subsection{Selected Components}\label{Selected}
Selection of a component from a record is translated into Z component selection.
For example,
=INLINEFT
RecVar.START
=TEX
\ is translated as
=INLINEFT
RECVAR.START
=TEX
.
(Note: the above description does not apply to a selected component appearing as the left-hand side of an assignment statement.
Such an assignment is effectively treated as an assignment of an aggregate value to the whole record, see section \ref{Assignment}.)

\subsection{Function Calls}\label{Function}
A function call using either positional or named argument association translates into a Z function application.
For example,
both
=INLINEFT
MAX(y=>THU, x=>FRI)
=TEX
\ and
=INLINEFT
MAX(FRI, THU)
=TEX
\ are translated as
=INLINEFT
MAX(FRI, THU)
=TEX
.
A call of a function with neither global dependencies or arguments is translated as a Z global variable, for example
=INLINEFT
CONST
=TEX
\ is translated as
=INLINEFT
CONST
=TEX
.
If a function has global dependencies, then these are formed into
a tuple (if there is more than one), and become an extra argument to
the Z function call.
For example, the function calls
=INLINEFT
SUMXY
=TEX
\ and
=INLINEFT
XPLUSY(42)
=TEX
\ are translated as
=INLINEFT
SUMXY(X, Y)
=TEX
\ and
=INLINEFT
PLUSX X 42
=TEX
\ respectively.
\subsection{Qualified Expressions}\label{Qualified}
A qualified expression is translated in the same way as its operand.
For example,
=INLINEFT
NATURAL'(4)
=TEX
\ is translated as
=INLINEFT
4
=TEX
.
\subsection{Type Conversions}\label{Type}
A type conversion is translated in the same way as its operand provided both the operand and the result both have integer types or both have real types.
For example,
=INLINEFT
NATURAL(4)
=TEX
\ is translated as
=INLINEFT
4
=TEX
.

A type conversion from an integer type to a real type or from a real type to an integer type
is translated into an application of an appropriate numeric conversion function
({\it real\_to\_integer} or {\it integer\_to\_real}).
For example,
=INLINEFT
FLOAT(4)
=TEX
\ is translated as
=INLINEFT
integer_to_real 4
=TEX
.

Type conversions involving types other than integer or real types cannot be handled
formally and are not translated.

\subsection{Array Sliding}\label{Sliding}
Section 5.2.1 of ALRM describes an implicit conversion that may apply to expressions
whose type is a subtype of an unconstrained array type. This implicit conversion
is referred to in this document as {\it sliding}. It may apply to the left-hand
side of an assignment statement and to {\it in} mode actual parameters
in function or procedure calls. When the sliding conversion is applicable,
the expression is translated as {\it slide(e, r)}
where {\it e} is the translation of the unconverted expression and {\it r}
is a Z identifier denoting the range of the converted array.

The sliding conversion also applies in ALRM to {\it in} and {\it in out} mode parameters.
When it does apply, a verification condition is generated, see section~ref{VCG}.

\subsection{Subtype Indications and Discrete Ranges}\label{STI}
Object declarations, discrete ranges and component declarations involving subtypes
which are not type marks are translated as if subtype declarations for the subtypes
had been introduced. The Z identifiers for these type marks are automatically
generated so as to be distinct from Z identifiers representing names in the Ada program.
For example, the type declaration:
=GFT
	type sti_eg is array(index) of integer range 1 .. 10;
=TEX
is translated into the following Z paragraphs:

{\ftlmargin=1in\vertbartrue
\begin{enumerate}
\item A definition of an automatically generated name for the anonymous subtype
of {\tt integer}:
ⓈIZ
│ INTEGERs1 ≜ 1 .. 10
■
\item Definitions of the attributes of the anonymous subtype:
ⓈIZ
│ INTEGERs1vFIRST ≜ 1
■
\ldots etc.
\item A definition for the array type {\tt sti\_eg}:
ⓈIZ
│ STI_EG ≜ INDEX → INTEGERs1
■
\item Definitions for the attributes of the array type:
ⓈIZ
│ STI_EGvFIRST ≜ INDEXvFIRST
■
\ldots etc.
\end{enumerate}} %\ftlmargin ...

Discrete ranges that do not include a type mark are translated using the Z
name {\it universal\_discrete} in place of the type mark.

\section{Translation of Declarations}\label{ToD}


\subsection{Enumeration Types}\label{ET}

An enumeration type is represented in Z as a range of integers starting at $0$.
Global variables are introduced corresponding to the type name, the enumeration literals and the supported attributes of the type.

For example, the enumeration type declaration:

=GFT
	type ENUM_TYPE is (LIT1, LIT2, LIT3);
=TEX

is translated into a sequence of abbreviation definitions as follows:

{\vertbartrue
=GFT
│	LIT1 ≜ 0
│	LIT2 ≜ 1
│	LIT3 ≜ 2
│	ENUM_TYPE ≜ LIT1 .. LIT3
│	ENUM_TYPEvFIRST ≜ LIT1
│	ENUM_TYPEvLAST ≜ LIT3
│	ENUM_TYPEvSUCC ≜ (ENUM_TYPE \ {ENUM_TYPEvLAST}) ◁ succ
│	ENUM_TYPEvPRED ≜ ENUM_TYPEvSUCC ↗~↕
│	ENUM_TYPEvPOS ≜ id ENUM_TYPE
│	ENUM_TYPEvVAL ≜ ENUM_TYPEvPOS ↗~↕
=TEX
} %\vertbartrue
\subsection{Array Types}\label{AT}

\subsubsection{Constrained Array Types}

A constrained array type is represented as a set of total functions.
Z global variables are introduced corresponding to the type name and the supported attributes of the type.
The attributes are only supported for one-dimensional arrays.

For example, the one-dimensional array type:
=GFT
	type ARRAY_TYPE is array (INDEX_TYPE) of ELEMENT_TYPE;
=TEX
is translated into a sequence of abbreviation definitions as follows:
{\vertbartrue
=GFT
│	ARRAY_TYPE ≜ INDEX_TYPE → ELEMENT_TYPE
│	ARRAY_TYPEvFIRST ≜ INDEX_TYPEvFIRST
│	ARRAY_TYPEvLAST ≜ INDEX_TYPEvLAST
│	ARRAY_TYPEvLENGTH ≜ # INDEX_TYPE
│	ARRAY_TYPEvRANGE ≜ INDEX_TYPE
│	ARRAY_TYPEvFIRSTv1 ≜ INDEX_TYPEvFIRST
│	ARRAY_TYPEvLASTv1 ≜ INDEX_TYPEvLAST
│	ARRAY_TYPEvLENGTHv1 ≜ # INDEX_TYPE
│	ARRAY_TYPEvRANGEv1 ≜ INDEX_TYPE
=TEX
} %\vertbartrue
A 2-dimensional array type:
=GFT
	type ARRAY_TYPE2 is
		array (INDEX_TYPE1, INDEX_TYPE2) of ELEMENT_TYPE;
=TEX
is translated into the sequence of abbreviation definitions:
{\vertbartrue
=GFT
│	ARRAY_TYPE2 ≜ INDEX_TYPE1 × INDEX_TYPE2 → ELEMENT_TYPE
│	ARRAY_TYPE2vFIRST ≜ INDEX_TYPE1vFIRST
│	ARRAY_TYPE2vLAST ≜ INDEX_TYPE1vLAST
│	ARRAY_TYPE2vLENGTH ≜ # INDEX_TYPE1
│	ARRAY_TYPE2vRANGE ≜ INDEX_TYPE1
│	ARRAY_TYPE2vFIRSTv1 ≜ INDEX_TYPE1vFIRST
│	ARRAY_TYPE2vLASTv1 ≜ INDEX_TYPE1vLAST
│	ARRAY_TYPE2vLENGTHv1 ≜ # INDEX_TYPE1
│	ARRAY_TYPE2vRANGEv1 ≜ INDEX_TYPE1
│	ARRAY_TYPE2vFIRSTv2 ≜ INDEX_TYPE2vFIRST
│	ARRAY_TYPE2vLASTv2 ≜ INDEX_TYPE2vLAST
│	ARRAY_TYPE2vLENGTHv2 ≜ # INDEX_TYPE2
│	ARRAY_TYPE2vRANGEv2 ≜ INDEX_TYPE2=TEX
=TEX
}%\vertbartrue
\subsubsection{Unconstrained Array Types}\label{UAT}
An unconstrained array type is represented as a set of partial functions.
For example, the unconstrained array type:
=GFT
	type ARRAY_TYPE3 is array (INDEX_TYPE range <>) of ELEMENT_TYPE;
=TEX
is translated as:
ⓈIZAX
│	ARRAY_TYPE3 : ℙ (INDEX_TYPE ⇸ ELEMENT_TYPE)
■

\subsection{Record Types}\label{RECT}
A record type is represented as a schema type.
To support the generation of VCs for assignments to components of records,
record update functions are also introduced.
For example, the record type:
=GFT
type date is record d : DAY; m : MONTH; y : YEAR; end record;
=TEX
is translated as follows:

{\vertbartrue
ⓈIZ
│	DATE ≜ [D : DAY; M : MONTH; Y : YEAR]
■
} %\vertbartrue

Ⓢ╒ [g1, g2, g3] ════════
│ DATEuD : [D : g1; W : g2; Y : g3] × g1 → [D : g1; W : g2; Y : g3];
│ DATEuM : [D : g1; W : g2; Y : g3] × g2 → [D : g1; W : g2; Y : g3];
│ DATEuY : [D : g1; W : g2; Y : g3] × g3 → [D : g1; W : g2; Y : g3]
├─────────────────
│ ∀ r : [D : g1; W : g2; Y : g3]; x1 : g1; x2 : g2; x3 : g3
│ ⦁	DATEuD (r, x1) = (D ≜ x1, W ≜ r.W, Y ≜ r.Y)
│ ∧	DATEuW (r, x2) = (D ≜ r.D, W ≜ x2, Y ≜ r.Y)
│ ∧	DATEuY (r, x3) = (D ≜ r.D, W ≜ r.W, Y ≜ x3)
└─────────────────

A record type with a discriminant part is translated similarly using a predicate in the schema
to express the formal discriminant constraints. For example, the record type:

=GFT
type buffer(size : integer) is record data : string (1 .. size); end record;
=TEX

is translated into the following schema (followed by the record update functions for
the two components of the schema).

{\vertbartrue
ⓈIZ
│ BUFFER ≜
│ [SIZE : INTEGER; DATA : STRING
│   | DATA ∈ {array : STRING | dom array = 1 .. SIZE}]
■
} %\vertbartrue
\subsection{Integer Types}\label{IT}
A signed integer type declaration is represented as a range of integers.
Z global variables are introduced corresponding to the type name and the supported attributes of the type.
The attributes that are functions have Z signatures but no defining properties (since the defining properties are compiler-dependent as regards arithmetic overflow).


For example, the integer type declaration:

=GFT
	type INTEGER_TYPE is range -1000 .. 1000;
=TEX

is translated as the sequence of abbreviation definitions:
Z global variables are introduced corresponding to the type name and the supported attributes of the type.

{\vertbartrue
=GFT
│	INTEGER_TYPE ≜ ~ 1000 .. 1000
│	INTEGER_TYPEvFIRST ≜ ~ 1000
│	INTEGER_TYPEvLAST ≜ 1000
=TEX
} %\vertbartrue

followed by the sequence of axiomatic descriptions:

{\vertbartrue
=GFT
│	INTEGER_TYPEvSUCC : ℤ ⇸ ℤ
│	INTEGER_TYPEvPRED : ℤ ⇸ ℤ
│	INTEGER_TYPEvPOS : ℤ ⇸ ℤ
│	INTEGER_TYPEvVAL : ℤ ⇸ ℤ
=TEX
} %\vertbartrue

A modular type is represented by a free type
with one constructor representing the Val attribute of
the type. The domain of the constructor is the set of
integers representable in the modular type.
The free type definition is preceded by an abbreviation
definition for the Modulus attribute and followed by
an axiom description for the function which maps the integers
onto the modular type and
abbreviation definitions for the other attributes of the
type.

For example, the modular type declaration:

=GFT
	type mod5 is mod 5;
=TEX

is translated into the following sequence of Z paragraphs:

{\vertbartrue
=GFT
	MOD5vMODULUS ≜ 5
	MOD5 ::= MOD5vVAL (0 .. MOD5vMODULUS - 1)
=TEX
=GFT
│	MOD5_of_int : ℤ → MOD5
├──────
│	∀i:ℤ⦁ MOD5_of_int i = MOD5vVAL (i mod MOD5vMODULUS)
=TEX
=GFT
	MOD5vFIRST ≜ MOD5vVAL 0
	MOD5vLAST ≜ MOD5vVAL (MOD5vMODULUS - 1)
	MOD5vPOS ≜ MOD5vVAL↗~↕
	MOD5vSUCC ≜ MOD5vPOS ⨾ succ⨾ MOD5_of_int
	MOD5vPRED ≜ MOD5vSUCC↗~↕
=TEX
} %\vertbartrue

\subsection{Real Types}\label{RT}

A real type (floating point or fixed point) is represented as a subset of
the set of real numbers in Z.
The category A attributes for the type are defined when the type is declared.

For example, the fixed point type declaration:

=GFT
	type FIX is delta 0.1 range 5.1 .. 10.0;
=TEX

is translated as

{\vertbartrue
=GFT
│	FIX ≜ 51 e ~1 .. 10 e 0
│	FIXvDELTA ≜ 1 e ~1
│	FIXvFIRST ≜ 51 e ~1
│	FIXvLAST ≜ 1 e 1
=TEX
} %\vertbartrue

The floating point type declaration:

=GFT
	type FLOAT1 is digits 7 range -1.0 .. 1.0;
=TEX

is translated as

{\vertbartrue
=GFT
│	FLOAT1 ≜ ~⋎R (1 e 0) ..⋎R 1 e 0
│	FLOAT1vDIGITS ≜ 7
│	FLOAT1vFIRST ≜ ~⋎R 1 e 0
│	FLOAT1vLAST ≜ 1 e 0
=TEX
} %\vertbartrue
A floating point type declaration with no range such as

=GFT
	type FLOAT2 is digits 6;
=TEX

is translated as

{\vertbartrue
=GFT
│	FLOAT2vFIRST : ℝ
│	FLOAT2vLAST : ℝ
│	FLOAT2 ≜ FLOAT2vFIRST .. FLOAT2vLAST
│	FLOAT2vDIGITS ≜ 6
=TEX
} %\vertbartrue

\subsection{Subtypes}\label{ST}

\subsubsection{Integer Subtypes}\label{IST}
A signed integer subtype is represented as a range of integers.
Z global variables are introduced corresponding to the type name and the supported attributes of the type.
The attributes are defined to be equal to the corresponding attributes of the base type.

For example, the subtype declaration:

=GFT
	subtype INTEGER_SUBTYPE is INTEGER_TYPE range -10 .. 10;
=TEX
is translated as the sequence of abbreviation definitions:

{\vertbartrue
=GFT
│	INTEGER_SUBTYPE ≜ ~ 10 .. 10
│	INTEGER_SUBTYPEvFIRST ≜ ~ 10
│	INTEGER_SUBTYPEvLAST ≜ 10
│	INTEGER_SUBTYPEvSUCC ≜ INTEGER_TYPEvSUCC
│	INTEGER_SUBTYPEvPRED ≜ INTEGER_TYPEvPRED
│	INTEGER_SUBTYPEvPOS ≜ INTEGER_TYPEvPOS
│	INTEGER_SUBTYPEvVAL ≜ INTEGER_TYPEvVAL
=TEX
} %\vertbartrue

A modular subtype is represented as a subset of the free type representing the base type.
The First and Last attributes are derived from the range in
the subtype definition and the other attributes are defined
equal to the corresponding attributes of the supertype.
For example, the subtype declaration:

=GFT
	subtype ttf is mod5 range 2 .. 4;
=TEX
is translated as the following sequence of abbreviation definitions:

=GFT
│	TTF ≜ MOD5vVAL ⦇2 .. 4⦈
│	TTFvFIRST ≜ MOD5vVAL 2
│	TTFvLAST ≜ MOD5vVAL 4
│	TTFvMODULUS ≜ MOD5vMODULUS
│	TTFvPOS ≜ MOD5vPOS
│	TTFvSUCC ≜ MOD5vSUCC
│	TTFvPRED ≜ MOD5vPRED
│	TTFvVAL ≜ MOD5vVAL
=TEX

\subsubsection{Array Subtypes}\label{AST}
An array subtype, i.e. a subtype with an index constraint, is represented as an appropriate subset of the set of functions which represents the base type.
Z global variables are introduced corresponding to the type name and the supported attributes of the type.

For example, the subtype declaration:

=GFT
	   subtype ARRAY_SUBTYPE is ARRAY_TYPE3(INDEX_TYPE);
=TEX

is translated as:

{\vertbartrue
=GFT
│	ARRAY_SUBTYPE ≜ {array : ARRAY_TYPE3 | dom array = INDEX_TYPE}
│	ARRAY_SUBTYPEvFIRST ≜ INDEX_TYPEvFIRST
│	ARRAY_SUBTYPEvLAST ≜ INDEX_TYPEvLAST
│	ARRAY_SUBTYPEvLENGTH ≜ # INDEX_TYPE
│	ARRAY_SUBTYPEvRANGE ≜ INDEX_TYPE
│	ARRAY_SUBTYPEvFIRSTv1 ≜ INDEX_TYPEvFIRST
│	ARRAY_SUBTYPEvLASTv1 ≜ INDEX_TYPEvLAST
│	ARRAY_SUBTYPEvLENGTHv1 ≜ # INDEX_TYPE
│	ARRAY_SUBTYPEvRANGEv1 ≜ INDEX_TYPE
=TEX
} %\vertbartrue

For a multi-dimensional array, the domain in the first abbreviation definition is given by an appropriate cartesian product and then abbreviation definitions
giving attributes for each dimension are introduced.

If a discrete range in an index constraint is not just a type mark, a Z declaration are introduced
for the range as described section~\ref{STI}.

\subsubsection{Record Subtypes}\label{RST}
A record subtype, i.e., a subtype with a discriminant constraint is translated into a schema definition
with the declaration given by the base type and with a predicate expressing the actual
discriminant constraints. For example, the record subtype:

=GFT
subtype line_buffer is buffer(80);
=TEX
is translated as:
{\vertbartrue
ⓈIZ
│	LINE_BUFFER ≜ [BUFFER | SIZE = 80]
■
} %\vertbartrue

\subsubsection{Other Subtypes}
Unconstrained subtypes have type attributes introduced for each
of the type attributes of the base type of the subtype.
Otherwise, subtypes of forms other than those discussed in section \ref{IST} and \ref{AST} above are represented in a similar way to real types as described in section \ref{RT}.
If a subtype involves expressions that cannot be handled formally, then a given set paragraph
is generated to represent the type (and the predefined operators on the type other than
equality will not be handled formally).

\subsection{Constant Declarations}\label{TCD}

An Ada constant is represented in Z as a global variable.
The form of definition for this global variable depends on whether the
defining expression for the constant can be handled formally.

Provided $EXPRESSION$ can be handled formally, the constant declaration:

=GFT
	CONST_NAME : constant TYPE_NAME := EXPRESSION
=TEX

is translated as the axiomatic description:

ⓈIZAX
│ 	CONST_NAME : TYPE_NAME
├──────
│	CONST_NAME = EXPRESSION
■

If $EXPRESSION$ cannot be handled formally, the constant declaration above would be translated as the axiomatic description:

ⓈIZAX
│	CONST_NAME : TYPE_NAME
■

A constant declaration defining more than one constant is treated as the equivalent sequence of single-constant declarations.

\subsection{Function Specifications}\label{TFS}
An Ada function is represented in Z as a global variable defined via an axiomatic description.
The form of the axiomatic description depends on whether or not the function is a formal function (i.e., whether or not the function specification includes a function specification statement).

An informal function (i.e., a function without a function specification statement) is translated into a member of the given set
=INLINEFT
Informal_Function
=TEX
.
Informal functions have no defining property and are only translated into Z to prevent their use in expressions in the formal parts of a Compliance Notation script.
For example, a function specified as:

=GFT
function INF_FUN (A : in INTEGER) return INTEGER;
■

is translated into Z as:

ⓈIZAX
│ INF_FUN : Informal_Function
├─────────────────
│ true
■

A formal function is translated into a global variable whose type is derived from the global dependencies, formal parameters and return type of the function and whose defining property is derived from the pre- and post-conditions in the function specification statement.
For example, the functions specified as follows:

=GFT
function FORM_FUN_00 return RTYPE
Ξ [ FORM_FUN_00 = 100 ]
function FORM_FUN_01 (A : PTYPE) return RTYPE
Ξ [ FORM_FUN_01 A = A * A ]
function FORM_FUN_10 return RTYPE
Ξ G [ G > 0, FORM_FUN_10 G = G ]
function FORM_FUN_23 (A, B, C : PTYPE) return RTYPE
Ξ G, H [ H > 0, FORM_FUN_23 (G, H) (A, B, C) = G + H + A + B + C ]
=TEX
are translated into the following axiomatic descriptions.
ⓈIZAX
│ FORM_FUN_00 : RTYPE
├─────────────────
│ true ⇒ FORM_FUN_00 = 100
■
ⓈIZAX
│ FORM_FUN_01 : PTYPE → RTYPE
├─────────────────
│ ∀ A : PTYPE ⦁ true ⇒ FORM_FUN_01 A = A * A
■
ⓈIZAX
│ FORM_FUN_10 : GTYPE → RTYPE
├─────────────────
│ ∀ G : GTYPE ⦁ G > 0 ⇒ FORM_FUN_10 G = G
■
ⓈIZAX
│ FORM_FUN_23 : GTYPE × HTYPE → PTYPE × PTYPE × PTYPE → RTYPE
├─────────────────
│ ∀ G : GTYPE; H : HTYPE
│   ⦁ ∀ A, B, C : PTYPE
│     ⦁ H > 0 ⇒ FORM_FUN_23 (G, H) (A, B, C) = G + H + A + B + C
■
\section{VC Generation}\label{VCG}
\HOLindexOff % - stays off throughout most of this section

A number of language constructs give rise to verification conditions (VCs).
These constructs are as follows.

\begin{enumerate}
%vcs_speclabel:
\item \label{VCRefStep}
A refinement step gives rise to VCs demanding that the sequence of statements on the right-hand side of the refinement symbol correctly implements the specification statement being refined.
\item \label{VCSubProgBody}
A subprogram body with a formal subprogram specification gives rise to VCs demanding that the sequence of statements in the body correctly implements the specification statement in the subprogram specification.
\item \label{VCSubProgPackBody}
If a subprogram specification in a package body and the corresponding subprogram specification in the package declaration are both formal, then VCs are generated demanding that the specification statement in the package body correctly implements the one in the package declaration.
\item \label{VCSubunit}
If a subprogram specification in a subunit and the corresponding subprogram specification in the corresponding body stub are both formal, then VCs are generated demanding that the specification statement in the subunit correctly implements the one in the body stub.
\item \label{VCPackInit}
A package body which implements a package containing using declarations gives rise to VCs demanding that the package initialisation statements establishes the invariants given in the using declarations.
\item \label{VCType}
If it cannot be determined whether a range in a type definition is non-empty, a VC is generated asserting that the type is non-empty; this VC always has the form
=INLINEFT
⊢ TYPENAME ≠ ∅
=TEX
.
\item \label{VCArraySubtype}
In a call of a procedure with a formal parameter whose mode is {\tt out} or {\tt in out} and whose
type is a subtype of an unconstrained array type, a VC is generated asserting that the
range of the array passed as the actual parameter is the same as the range of the subtype
specified in the procedure declaration. That is to say, the VC asserts that the sliding
conversion is not needed (see section~\ref{Sliding} above).


\end{enumerate}

The first four forms of VC generation in the above list are concerned with one or more specification statements.
A specification statement is a general means for making assertions about program state changes.
The specification statement with frame variables
=INLINEFT
A, B, C ...
=TEX
:

=GFT
	Δ A, B, C ... [PRE_CONDITION, POST_CONDITION]
=TEX
effectively denotes the set of all pairs $(S\sb{1}, S\sb{2})$ where: each $S\sb{i}$ is a program state; the pre-condition holds in $S\sb{1}$; the post-condition holds in $S\sb{2}$; and $S\sb{1}$ and $S\sb{2}$ only differ with respect to the values of the frame variables
=INLINEFT
A, B, C ...
=TEX
\ (but see also the remarks about replacement steps which declare new local variables in section~\ref{15}, and the discussion of domain conditions in section~\ref{DCS}).
In the post-condition the initial values of the frame variables may be referred to by adding a subscript $0$ to the name.
For example, the specification statement:

=GFT
	Δ A [true, A = A⋎0 + 1]
=TEX
asserts that the integer variable $A$ should be increased by $1$.

The Compliance Notation VC generation algorithm is based on the notion of {\em partial correctness}.
If all VCs of a refinement step can be proved, then at run-time, the refining code either meets its specification or fails to terminate or raises an exception.
The soundness of the algorithm requires that the script conform to the rules in chapter \ref{SYNTAX} above and that the Ada program generated from the script conforms to the rules of the ALRM.


In generating the VCs that give the conditions under which
a sequence of statements refine a specification statement,
certain statement forms must be restricted.
The statement forms in question are:

\begin{itemize}
\item specification statements that refer to initial variables;
\item logical constant statements;
\item procedure calls, where the specification statement for the procedure refers to initial
variables;
\item for-loops whose bounds are not static expressions.
\end{itemize}

Such statements are restricted to appearing in positions where no code with side effects
could be executed before them in the sequence of statements.
This condition is formulated syntactically as follows: the above four statement
forms may only appear in positions in the sequence of statements
which are {\em suitable} in the following sense:

\begin{itemize}
\item the first statement in a sequence is suitable;
\item the first statement in a branch of a case statement which is itself in a suitable position is also suitable;
\item the first statement in a branch of an if statement which is itself in a suitable position is also suitable.
\end{itemize}


The form of VCs generated for refinement steps involving the various forms of statement are described, by means of symbolic examples, in sections~\ref{Null} to \ref{LogicalConstant} below.
Sections~\ref{SubprogramBody} to \ref{RangeInTypeDefinition} below give symbolic examples for the other kinds of VC generation.


\Hide{%
=SML
map (fn thy => ( force_delete_theory thy handle Fail _ => () ))
	(get_descendants "cn" less "cn" diff get_cache_theories());
open_theory"cn";
new_theory"usr504aux";
=TEX
We will need a supply of symbolic pre- and post-conditions.
We use generic sets for these purposes.
It is pleasant to use prefix syntax for membership of the generic sets:
ⓈZ
│ rel	PRE _ ,		POST _,		PRE1 _ ,	POST1 _,
│	PRE2 _,		POST2 _,		PRE3 _ ,	POST3 _,
│	TILL _,		COND _,		APRE _ ,	APOST _,
│	CPRE _,		CPOST _,	INV _,	SPRE _,
│	SPOST _, IPRE _, IPOST _
■
■
╒[ X ]═══════════
│	PRE _,		POST _,		PRE1 _, 	POST1 _,
│	PRE2 _,		POST2 _,		PRE3 _, 	POST3 _,
│	TILL _,		COND _,		APRE _ ,	APOST _,
│	CPRE _,		CPOST _,	INV _,	SPRE _,
│	SPOST _, IPRE _, IPOST _			: ℙ X
└──────────────
The following Standard ML command is used to set up the tool to process each of the many other little Compliance Notation scripts given in this document.
Note that it ensures that ``usr504aux'' is a parent of any theories created.
=SML
fun ns {name : string, unit_type : string} : unit = (
	new_script1 {name=name, unit_type=unit_type, library_theories=["usr504aux"]}
);
=TEX
The following command is used to list one of these theories.
=SML
fun zo (thy : string, fstem : string) : unit = (
	open_theory thy;
	z_output_theory{out_file=fstem ^".th.pp", theory = thy}
);
=TEX
The following package introduces functions which we will need.
It reduces clutter to define these functions here rather than inside the subprograms which use them.
Here and throughout this document, red-tape commands to {\Product} have been suppressed from the printed document in the interests of clarity.
=SML
ns{name="FUNS", unit_type="spec"};
=TEX
ⓈCN
 package FUNS
 is
    function TEST (A : INTEGER) return BOOLEAN
     Ξ [COND (A, FUNSoTEST(A))] ;
    function COMPUTE (A : INTEGER) return INTEGER
     Ξ [COND (A, FUNSoCOMPUTE(A))] ;
 end FUNS;
■
}
\newpage
\subsection{Null Statement}\label{Null}
\subsubsection*{Compliance Notation Script: Null Statement}
\Hide{%
=SML
ns{name="VC_NULL", unit_type="proc"};
=TEX
}
ⓈCN
 procedure vc_null
 is
    X : INTEGER;
 begin
  Δ X [ PRE X, POST X ]		(111)
 end vc_null;
■
ⓈCN
 (111) ⊑ NULL;
■
\Hide{%
=SML
zo("VC_NULL'proc", "usr504x01");
=TEX
}
\subsubsection*{Generated VCs}
\input{usr504x01.th}
\subsubsection*{Notes}
A null statement can only achieve its specification if the pre-condition
already implies the post-condition so that no action needs to be taken.
\newpage
\subsection{Assignment Statement}\label{Assignment}
\subsubsection*{Compliance Notation Script: Assignment: Case 1}
\Hide{%
=SML
ns{name="VC_ASSIGNMENT1", unit_type="proc"};
=TEX
}
ⓈCN
 procedure vc_assignment1
 is
    LHS, RHS : INTEGER;
 begin
  Δ LHS [ PRE (LHS, RHS), POST (LHS, RHS, LHS⋎0) ]		(211)
 end vc_assignment1;
■
ⓈCN
 (211) ⊑ LHS := RHS;
■
\Hide{%
=SML
zo("VC_ASSIGNMENT1'proc", "usr504x02");
=TEX
}
\subsubsection*{Generated VCs}
\input{usr504x02.th}
%\subsubsection*{Notes}
%\cite[vol. 2]{DRA/CIS/CSE3/TR/94/27}.
\newpage
\subsubsection*{Compliance Notation Script: Assignment: Case 2}
\Hide{%
=SML
ns{name="VC_ASSIGNMENT2", unit_type="proc"};
=TEX
}
ⓈCN
 procedure vc_assignment2
 is
    type DAY is range 1 .. 31;
    type MONTH is range 1 .. 12;
    type YEAR is range -10000 .. +10000;
    type DATE is record D : DAY; M : MONTH; Y : YEAR; end record;
    LHS : DATE;
    RHS : DAY;
 begin
  Δ LHS [ PRE (LHS, RHS), POST (LHS, RHS, LHS⋎0) ]		(221)
 end vc_assignment2;
■
ⓈCN
 (221) ⊑ LHS.D := RHS;
■
\Hide{%
=SML
zo("VC_ASSIGNMENT2'proc", "usr504x03");
=TEX
}
\subsubsection*{Generated VCs}
\input{usr504x03.th}
\subsubsection*{Notes}
Assignment to a record component results in VC containing a call to the record update function
for that component (see section~\ref{RECT}).
\newpage
\subsubsection*{Compliance Notation Script: Assignment: Case 3}
\Hide{%
=SML
ns{name="VC_ASSIGNMENT3", unit_type="proc"};
=TEX
}
ⓈCN
 procedure vc_assignment3
 is
    type TRIAD is (ONE, TWO, THREE);
    type ARRAY3 is array (TRIAD) of INTEGER;
    LHS : ARRAY3;
    RHS : INTEGER;
    INDEX : TRIAD;
 begin
  Δ LHS [ PRE (LHS, RHS), POST (LHS, RHS, LHS⋎0) ]		(231)
 end vc_assignment3;
■
ⓈCN
 (231) ⊑ LHS(INDEX) := RHS;
■
\Hide{%
=SML
zo("VC_ASSIGNMENT3'proc", "usr504x04");
=TEX
}
\subsubsection*{Generated VCs}
\input{usr504x04.th}
\subsubsection*{Notes}
Assignment to an array element results in a singleton override on the Z function representing the array in the VC.
\newpage
\subsubsection*{Compliance Notation Script: Assignment: Case 4}
\Hide{%
=SML
ns{name="VC_ASSIGNMENT4", unit_type="proc"};
=TEX
}
ⓈCN
 procedure vc_assignment4
 is
    type REC_XY is record X : INTEGER; Y : INTEGER; end record;
    type DYAD is (EINS, ZWEI);
    type ARRAY2_REC is array (DYAD) of REC_XY;
    LHS : ARRAY2_REC;
    RHS : INTEGER;
    INDEX : DYAD;
 begin
  Δ LHS [ PRE (LHS, RHS), POST (LHS, RHS, LHS⋎0) ]		(241)
 end vc_assignment4;
■
ⓈCN
 (241) ⊑ LHS(INDEX).X := RHS;
■
\Hide{%
=SML
zo("VC_ASSIGNMENT4'proc", "usr504x05");
=TEX
}
=TEX
\subsubsection*{Generated VCs}
\input{usr504x05.th}
\subsubsection*{Notes}
Assignments with more complex right hand-sides produce a mixture of record update operations and singleton overrides in the VC.
\newpage
\subsubsection*{Compliance Notation Script: Assignment: Case 5}
\Hide{%
=SML
ns{name="VC_ASSIGNMENT5", unit_type="proc"};
=TEX
}
ⓈCN
 procedure vc_assignment5
 is
    type DYAD is (EINS, ZWEI);
    type ARRAY2_INT is array (DYAD) of INTEGER;
    type REC_AB is record A : ARRAY2_INT; B : ARRAY2_INT; end record;
    LHS : REC_AB;
    RHS : INTEGER;
    INDEX : DYAD;
 begin
  Δ LHS [ PRE (LHS, RHS), POST (LHS, RHS, LHS⋎0) ]		(251)
 end vc_assignment5;
■
ⓈCN
 (251) ⊑ LHS.A(INDEX) := RHS;
■
\Hide{%
=SML
zo("VC_ASSIGNMENT5'proc", "usr504x06");
=TEX
}
=TEX
\subsubsection*{Generated VCs}
\input{usr504x06.th}
\subsubsection*{Notes}
Assignments with more complex right hand-sides produce a mixture of binding displays and singleton overrides in the VC.
\newpage
\subsection{Specification Statement}\label{Specification}
\subsubsection*{Compliance Notation Script: Specification Statement}
\Hide{%
=SML
ns{name="VC_SPECIFICATION", unit_type="proc"};
=TEX
}
ⓈCN
 procedure vc_specification
 is
    X : INTEGER;
 begin
  Δ X [ PRE X, POST (X, X⋎0) ]		(311)
 end vc_specification;
■
ⓈCN
 (311) ⊑  Δ X [ PRE1 X, POST1 (X, X⋎0) ] (312)
■
\Hide{%
=SML
zo("VC_SPECIFICATION'proc", "usr504x07");
=TEX
}
=TEX
\subsubsection*{Generated VCs}
\input{usr504x07.th}
\subsubsection*{Notes}
Note that $PRE$ rather than $PRE1$ appears in the second VC.
Since the first VC requires $PRE$ to be at least as strong $PRE1$ this is no loss, and could be a gain.

\newpage
\subsection{Semicolon}\label{Sequence of Statements}
\subsubsection*{Compliance Notation Script: Sequence of Statements}
\Hide{%
=SML
ns{name="VC_SEQUENCE_OF_STATEMENTS", unit_type="proc"};
=TEX
}
ⓈCN
 procedure vc_sequence_of_statements
 is
    X : INTEGER;
 begin
  Δ X [ PRE X, POST (X, X⋎0) ]		(411)
 end vc_sequence_of_statements;
■
ⓈCN
 (411) ⊑	Δ X [ PRE1 X, POST1 (X, X⋎0) ] (412)
		Δ X [ PRE2 X, POST2 X ] (413)
■
\Hide{%
=SML
zo("VC_SEQUENCE_OF_STATEMENTS'proc", "usr504x08");
=TEX
}
=TEX
\subsubsection*{Generated VCs}
\input{usr504x08.th}
\subsubsection*{Notes}

It is not permitted to refer to initial values of variables in the second statement.

The intermediate post-condition $POST1$ only as appears as part of the assumptions under which the second VC requires us to prove $PRE2$.
If $POST1$ or some part of $POST1$ is needed in $POST$, then it must be included in $POST2$ and $PRE2$.

\Hide{%
This construct is referred to as ``semicolon'' in \cite[vol. 2]{DRA/CIS/CSE3/TR/94/27}; we have reverted to the official Ada terminology, because no semicolon actually appears when both statements are specification statements.
}

\newpage
\subsection{If Statement}\label{If}
\subsubsection*{Compliance Notation Script: If Statement}
\Hide{%
=SML
ns{name="VC_IF", unit_type="proc"};
=TEX
}
ⓈCN
with FUNS;
 procedure vc_if
 is
    X : INTEGER;
 begin
  Δ X [ PRE X, POST X ]		(511)
 end vc_if;
■
ⓈCN
 (511) ⊑	if FUNS.TEST(X)
		then	Δ X [ PRE1 X, POST1 X ] (512)
		else	Δ X [ PRE2 X, POST2 X ] (513)
		end if;
■
\Hide{%
=SML
zo("VC_IF'proc", "usr504x09");
=TEX
}
=TEX
\subsubsection*{Generated VCs}
\input{usr504x09.th}
\subsubsection*{Notes}
Initial variables are not allowed in the arms of the if statement.

If the $else$ part is omitted then $POST$ appears in the second VC in place of $PRE2$ and the fourth VC does not appear.
\newpage
\subsection{Case Statement}\label{Case}
\subsubsection*{Compliance Notation Script: Case Statement}
\Hide{%
=SML
ns{name="VC_CASE", unit_type="proc"};
=TEX
}
ⓈCN
with FUNS;
 procedure vc_case
 is
    type T_CASE is range 1 .. 9;
    X : T_CASE;
 begin
  Δ X [ PRE X, POST X ]		(611)
 end vc_case;
■
ⓈCN
 (611) ⊑	case T_CASE(FUNS.COMPUTE(X)) is
		when 1 =>			Δ X [ PRE1 X, POST1 X ] (612)
		when 5 .. 7 =>		Δ X [ PRE2 X, POST2 X ] (613)
		when 2 .. 4 | 8 | 9  =>	Δ X [ PRE3 X, POST3 X ] (614)
		end case;
■
\Hide{%
=SML
zo("VC_CASE'proc", "usr504x10");
=TEX
}
=TEX
\subsubsection*{Generated VCs}
\input{usr504x10.th}
\subsubsection*{Notes}
Initial variables are not allowed in the specification statements in the arms of the case statement.

If the fact that the case expression is in one of the ranges is needed in the corresponding arm, then that needs to be stated in the pre-condition for that arm.
(E.g.\ if we need to know that the expression is $1$ in the first arm here, we need to say that in $PRE1$).

\newpage
\subsection{Undecorated Loop Statement}\label{Undecorated}
\subsubsection*{Compliance Notation Script: Undecorated Loop Statement}
\Hide{%
=SML
ns{name="VC_UNDECORATED_LOOP", unit_type="proc"};
=TEX
}
ⓈCN
 procedure vc_undecorated_loop
 is
    X : INTEGER;
 begin
  Δ X [ PRE X, POST X ]		(711)
 end vc_undecorated_loop;
■
ⓈCN
 (711) ⊑	$till ⟦ TILL X ⟧
		loop
		   Δ X [ PRE1 X, POST1 X ] (712)
		end loop;
■
\Hide{%
=SML
zo("VC_UNDECORATED_LOOP'proc", "usr504x11");
=TEX
}
=TEX
\subsubsection*{Generated VCs}
\input{usr504x11.th}
\subsubsection*{Notes}
If the till predicate is omitted, then the last VC is not produced (and there is no formally handled way of leaving the loop, since an $exit$ statement is not allowed in a loop with no till predicate).

\newpage
\subsection{While Loop Statement}\label{While}
\subsubsection*{Compliance Notation Script: While Loop Statement}
\Hide{%
=SML
ns{name="VC_WHILE_LOOP", unit_type="proc"};
=TEX
}
ⓈCN
with FUNS;
 procedure vc_while_loop
 is
    X : INTEGER;
 begin
  Δ X [ PRE X, POST X ]		(811)
 end vc_while_loop;
■
ⓈCN
 (811) ⊑	while FUNS.TEST(X) $till ⟦ TILL X ⟧
		loop
		   Δ X [ PRE1 X, POST1 X ] (812)
		end loop;
■
\Hide{%
=SML
zo("VC_WHILE_LOOP'proc", "usr504x12");
=TEX
}
=TEX
\subsubsection*{Generated VCs}
\input{usr504x12.th}
\subsubsection*{Notes}
If the till predicate is omitted, then the last VC is not produced.
\newpage
\subsection{For Loop Statement}\label{For}
\subsubsection*{Compliance Notation Script: For Loop Statement: Case 1}
\Hide{%
=SML
ns{name="VC_FOR_LOOP1", unit_type="proc"};
=TEX
}
ⓈCN
 procedure vc_for_loop1
 is
    X : INTEGER;
 begin
  Δ X [ PRE X, POST X ]		(911)
 end vc_for_loop1;
■
ⓈCN
 (911) ⊑	for I in INTEGER range 1 .. 10 $till ⟦ TILL (X, I) ⟧
		loop
		   Δ X [ PRE1 (X, I) , POST1 (X, I) ] (912)
		end loop;
■
\Hide{%
=SML
zo("VC_FOR_LOOP1'proc", "usr504x13");
=TEX
}
\subsubsection*{Generated VCs}
\input{usr504x13.th}
\subsubsection*{Notes}
If the till predicate is omitted, then the last VC is not produced.

If the type mark in the loop parameter specification is omitted
it will be taken to be {\it universal\_discrete} in any VCs
involving the loop control variable.

\newpage
\subsubsection*{Compliance Notation Script: For Loop Statement: Case 2}
\Hide{%
=SML
ns{name="VC_FOR_LOOP2", unit_type="proc"};
=TEX
}
ⓈCN
 procedure vc_for_loop2
 is
    type T_FOR_LOOP2 is range 1 .. 10;
    X : INTEGER;
 begin
  Δ X [ PRE X, POST X ]		(921)
 end vc_for_loop2;
■
ⓈCN
 (921) ⊑	for I in T_FOR_LOOP2 $till ⟦ TILL (X, I) ⟧
		loop
		  Δ X [ PRE1 (X, I), POST1 (X, I) ] (922)
		end loop;
■
\Hide{%
=SML
zo("VC_FOR_LOOP2'proc", "usr504x14");
=TEX
}
\subsubsection*{Generated VCs}
\input{usr504x14.th}
\subsubsection*{Notes}
If the till predicate is omitted, then the last VC is not produced.

If the type mark in the loop parameter specification is omitted
it will be taken to be {\it universal\_discrete} in any VCs
involving the loop control variable.
\newpage
\subsection{Block Statement}\label{Block}
\subsubsection*{Compliance Notation Script: Block Statement}
\Hide{%
=SML
ns{name="VC_BLOCK", unit_type="proc"};
=TEX
}
ⓈCN
 procedure vc_block
 is
    X : INTEGER;
 begin
  Δ X [ PRE X, POST X ]		(1411)
 end vc_block;
■
ⓈCN
 (1411) ⊑	
blk:
  declare
    Y : INTEGER := 0;
  begin
    Δ X, Y [PRE1(X, Y), POST1(X, Y)]
  end blk;
■

\Hide{%
=SML
zo("VC_BLOCKoBLK'block", "usr504x15");
=TEX
}
=TEX
\subsubsection*{Generated VCs}
\input{usr504x15.th}
\subsubsection*{Notes}
Equations derived from any initial values in variable declarations in the block are conjoined with the pre-condition, $PRE\,X$.

=TEX
\newpage
\subsection{Exit Statement}\label{Exit}
\subsubsection*{Compliance Notation Script: Exit Statement: Case 1}
\Hide{%
=SML
ns{name="VC_EXIT1", unit_type="proc"};
=TEX
}
ⓈCN
with FUNS;
 procedure vc_exit1
 is
    X : INTEGER;
 begin
  Δ X [ PRE X, POST X ]		(1011)
 end vc_exit1;
■
ⓈCN
 (1011) ⊑	for I in INTEGER range 1 .. 10 $till ⟦TILL X⟧
		loop
		   Δ X [ PRE1 (X, I), POST1 (X, I) ]		(1012)
		end loop;
■
\Hide{%
=SML
(map delete_conjecture (flat (map fst  (get_conjectures"-"))); ());
=TEX
}
ⓈCN
 (1012) ⊑	Δ X[PRE2 X, POST2 X]
		exit when FUNS.TEST(X);
■
\Hide{%
=SML
zo("VC_EXIT1'proc", "usr504x16");
=TEX
}
\subsubsection*{Generated VCs}
\input{usr504x16.th}
\subsubsection*{Notes}
For clarity, the VCs from the first refinement step are not shown above.

The till predicate must not be omitted on the loop being
exited. For an exit with a loop name, the till
predicate is taken from the corresponding enclosing named loop.

If the statement before the exit is omitted the first VC does not appear.
\newpage
\subsubsection*{Compliance Notation Script: Exit Statement: Case 2}
\Hide{%
=SML
ns{name="VC_EXIT2", unit_type="proc"};
=TEX
}
ⓈCN
with FUNS;
 procedure vc_exit2
 is
    X : INTEGER;
 begin
  Δ X [ PRE X, POST X ]		(1021)
 end vc_exit2;
■
ⓈCN
 (1021) ⊑	for I in INTEGER range 1 .. 10 $till ⟦TILL X⟧
		loop
		   Δ X [ PRE1 (X, I), POST1 (X, I) ]		(1022)
		end loop;
■
\Hide{%
=SML
(map delete_conjecture (flat (map fst  (get_conjectures"-"))); ());
=TEX
}
ⓈCN
 (1022) ⊑	if FUNS.TEST(X)
		then	Δ X[PRE2 X, POST2 X]
			exit;
		end if;
■
\Hide{%
=SML
zo("VC_EXIT2'proc", "usr504x17");
=TEX
}
=TEX
\subsubsection*{Generated VCs}
\input{usr504x17.th}
\subsubsection*{Notes}
For clarity, the VCs from the first refinement step have been omitted.

The till predicate must not be omitted.

If the statement before the exit is omitted the first VC does not appear.
\newpage
\subsection{Return Statement}\label{Return}
\subsubsection*{Compliance Notation Script: Return Statement: Case 1}
\Hide{%
=SML
ns{name="VC_RETURN1", unit_type="func"};
=TEX
}
ⓈCN
with FUNS;
 function vc_return1 (A : INTEGER) return INTEGER
 Ξ [PRE A, POST (A, VC_RETURN1(A))]
 is
 begin
  return FUNS.COMPUTE(A);
 end vc_return1;
■
\Hide{%
=SML
zo("VC_RETURN1'func", "usr504x18");
=TEX
}
\subsubsection*{Generated VCs}
\input{usr504x18.th}

For a return from a procedure, i.e., without an expression,
the equation defining the returned value is omitted from the VC.

\newpage
\subsubsection*{Compliance Notation Script: Return Statement: Case 2}
\Hide{%
=SML
ns{name="VC_RETURN2", unit_type="func"};
=TEX
}
ⓈCN
with FUNS;
 function vc_return2 (A : INTEGER) return INTEGER
 Ξ [PRE A, POST (A, VC_RETURN2(A))]
 is
 begin
     Δ  [ PRE1 A , false ]   (1121)
 end vc_return2;
■
ⓈCN
 (1121) ⊑ return FUNS.COMPUTE(A);
■
\Hide{%
=SML
zo("VC_RETURN2'func", "usr504x19");
=TEX
}
\subsubsection*{Generated VCs}
\input{usr504x19.th}
\subsubsection*{Notes}

The post-condition for the body of a function can be $false$ since control never returns from the body (instead, control returns to the caller of the function when the return statement is executed).
By using $false$ we ensure that the second VC is a tautology.

For a return from a procedure, i.e., without an expression,
the equation defining the returned value is omitted from the last VC.
A post-condition of $false$ is
also appropriate for a procedure if all paths through the body of the procedure
end in a return statement.

=TEX
\newpage
\subsection{Procedure Call Statement}\label{Procedure}
\subsubsection*{Compliance Notation Script: Procedure Call Statement}
\Hide{%
=SML
ns{name="VC_PROCEDURE_CALL", unit_type="proc"};
=TEX
}
ⓈCN
 procedure vc_procedure_call
 is
    procedure PROC (A : in out INTEGER)
     Δ [PRE1 A, PRE1 (A⋎0, A)]
    is separate;
    X : INTEGER;
 begin
  Δ X [ PRE X, POST X ]		(1211)
 end vc_procedure_call;
■
ⓈCN
 (1211) ⊑  PROC(X);
■
\Hide{%
=SML
zo("VC_PROCEDURE_CALL'proc", "usr504x20");
=TEX
}
=TEX
\subsubsection*{Generated VCs}
\input{usr504x20.th}
\newpage
\subsection{Logical Constant Statement}\label{LogicalConstant}
\subsubsection*{Compliance Notation Script: Logical Constant Statement: Case 1}
\Hide{%
=SML
ns{name="VC_LOGICAL_CONSTANT1", unit_type="proc"};
=TEX
}
ⓈCN
 procedure vc_logical_constant1
 is
    X : INTEGER;
 begin
  Δ X [ PRE X, POST X ]		(1311)
 end vc_logical_constant1;
■
ⓈCN
 (1311) ⊑	$CON X_INIT : ℤ⦁
			Δ X [X_INIT = X ∧ PRE1 X, POST1(X, X_INIT)] (1312)
■
ⓈCN
 (1312) ⊑	Δ X [ PRE2 X, POST2(X, X_INIT)] (1313)
		Δ X [ PRE3(X, X_INIT), POST3(X, X_INIT)] (1314)
■
\Hide{%
=SML
zo("VC_LOGICAL_CONSTANT1'proc", "usr504x21");
=TEX
}
=TEX
\subsubsection*{Generated VCs}
\input{usr504x21.th}
\subsubsection*{Notes}
A refinement of the logical constant statement into a sequence of statements i
s shown to illustrate how the statement may be used to capture an initial value.
\newpage
\subsubsection*{Compliance Notation Script: Logical Constant Statement: Case 2}
\Hide{%
=SML
ns{name="VC_LOGICAL_CONSTANT2", unit_type="proc"};
=TEX
}
ⓈCN
 procedure vc_logical_constant2
 is
    X : INTEGER;
 begin
  Δ X [ PRE X, POST X ]		(1321)
 end vc_logical_constant2;
■
ⓈCN
 (1321) ⊑	$CON Y, Z : ℤ⦁
			Δ X [Y = X+X ∧ Z = Y*Y ∧ PRE1 X, POST1(X, Y, Z)] (1312)
■
\Hide{%
=SML
zo("VC_LOGICAL_CONSTANT2'proc", "usr504x22");
=TEX
}
=TEX
\subsubsection*{Generated VCs}
\input{usr504x22.th}
\newpage
\subsection{Subprogram Body}\label{SubprogramBody}
\subsubsection*{Compliance Notation Script: Subprogram Body: Case 1 (Procedure)}
\Hide{%
=SML
ns{name="VC_PROCEDURE_BODY", unit_type="proc"};
=TEX
}
ⓈCN
 procedure vc_procedure_body(X : in out INTEGER)
 Δ X[ PRE X, POST X ]
 is
    Y : INTEGER := 0;
 begin
  Δ X [ PRE1 (X, Y), POST1 (X, Y) ]
 end vc_procedure_body;
■

\Hide{%
=SML
zo("VC_PROCEDURE_BODY'proc", "usr504x23");
=TEX
}
=TEX
\subsubsection*{Generated VCs}
\input{usr504x23.th}
\subsubsection*{Notes}
This shows the VCs generated for a formal procedure body.
The VCs assert that the sequence of statements in the body
(given in the example as a single specification statement)
refines the specification statement in the procedure specification.
Equations derived from any initial values in variable declarations in the subprogram are conjoined with the pre-condition, $PRE\,X$.

If the body contains one or more program statements then the VCs generated are similar to those generated if the statements were used to implement the specification statement in a refinement step as described in sections~\ref{Null} to~\ref{LogicalConstant} above.
\newpage
\subsubsection*{Compliance Notation Script: Subprogram Body: Case 2 (Function)}
\Hide{%
=SML
ns{name="VC_FUNCTION_BODY", unit_type="func"};
=TEX
}
ⓈCN
 function vc_function_body(X : in INTEGER) return INTEGER
 Ξ [ PRE X, POST (X, VC_FUNCTION_BODY X) ]
 is
    Y : INTEGER;
 begin
  Δ Y [ PRE1 (X, Y), POST1 (X, Y) ]
 end vc_function_body;
■

\Hide{%
=SML
zo("VC_FUNCTION_BODY'func", "usr504x24");
=TEX
}
=TEX
\subsubsection*{Generated VCs}
\input{usr504x24.th}
\subsubsection*{Notes}
This shows the VCs generated for a formal function body.
The VCs assert that the sequence of statements in the body
(given in the example as a single specification statement)
refines the specification statement in the function specification.

Here, and in further refinements of the sequence of statements, the function itself appears under a universal quantifier, so that the translation of the function as a Z global variable is not available inside the formal development of the function itself.
=TEX
\newpage
\subsection{Subprogram in Package Body}\label{SubprogramPackBody}
\subsubsection*{Compliance Notation Script: Subprogram in Package Body: Case 1}
\Hide{%
=SML
ns{name="VC_PACK_BODY1", unit_type="spec"};
=TEX
}
ⓈCN
 package vc_pack_body1
 is
   X : INTEGER;
   procedure P
   Δ VC_PACK_BODY1oX[ PRE VC_PACK_BODY1oX, POST VC_PACK_BODY1oX ] ;
 end vc_pack_body1;
■
\Hide{%
=SML
ns{name="VC_PACK_BODY1", unit_type="body"};
=TEX
}
ⓈCN
 package body vc_pack_body1
 is
   procedure P
   Δ VC_PACK_BODY1oX[ PRE1 VC_PACK_BODY1oX, POST1 VC_PACK_BODY1oX ]
   is
   begin
   Δ VC_PACK_BODY1oX[ PRE2 VC_PACK_BODY1oX, POST2 VC_PACK_BODY1oX]
   end P;
 end vc_pack_body1;
■

\Hide{%
=SML
zo("VC_PACK_BODY1'body", "usr504x26");
=TEX
}
=TEX
\subsubsection*{Generated VCs}
\input{usr504x26.th}
\subsubsection*{Notes}
The subprogram body in this example cause 2 additional VCs to be generated that are not shown here.
See sections~\ref{SubprogramBody} for these VCs.
\newpage
\subsubsection*{Compliance Notation Script: Subprogram in Package Body: Case 2}
\Hide{%
=SML
ns{name="VC_PACK_BODY2", unit_type="spec"};
=TEX
}
ⓈCN
package vc_pack_body2
is
  $auxiliary A : ℕ;
  procedure P
  Δ A [ APRE A, APOST A ] ;
end vc_pack_body2;
■
\Hide{%
=SML
ns{name="VC_PACK_BODY2", unit_type="body"};
=TEX
}
ⓈCN
package body vc_pack_body2
is
  $using C : INTEGER; $implement A $by INV(A, C);
  procedure P
  Δ C [ CPRE  C, CPOST C ]
  is begin
   Δ C [ SPRE C, SPOST C] (1)
  end P;
begin
  Δ C[IPRE C, IPOST C] (2)
end vc_pack_body2;
■

\Hide{%
=SML
val _ = map delete_conjecture
["vcVC_PACK_BODY2_3",
"vcVC_PACK_BODY2_4"];
zo("VC_PACK_BODY2'body", "usr504x28");
=TEX
}
=TEX
\subsubsection*{Generated VCs}
\input{usr504x28.th}
\subsubsection*{Notes}
This example shows a
\HOLindexOn
=INLINEFT
⦏data refinement⦎
=TEX
\HOLindexOff
: the situation in which one or more auxiliary variables are used in the package specification to model the state of the package.
If the using clause is omitted, then the invariant $INV(A, C)$ does not appear in the VCs (which will typically not then be provable).

The subprogram body and the package initialisation in this example cause additional VCs to be generated that are not shown here.
See sections~\ref{SubprogramBody} and~\ref{PackageInitialisation} for these VCs.
\newpage
\subsubsection*{Compliance Notation Script: Subprogram in Package Body: Case 3}
\Hide{%
=SML
ns{name="VC_PACK_BODY3", unit_type="spec"};
=TEX
}
ⓈCN
package vc_pack_body3
is
  $auxiliary A : ℕ;
  procedure Q(X : in out INTEGER)
  Δ X Ξ A[APRE (A, X), APOST(A, X, X⋎0)] ;
end vc_pack_body3;
■
\Hide{%
=SML
ns{name="VC_PACK_BODY3", unit_type="body"};
=TEX
}
ⓈCN
package body vc_pack_body3
is
  $using C : INTEGER; $implement A $by INV(A, C);
  procedure Q(X : in out INTEGER)
  Δ X, C [CPRE C, CPOST(C, X, X⋎0)]
  is begin
   Δ X, C [SPRE C, SPOST(C, X, X⋎0)] (1)
  end Q;
begin
  Δ C[IPRE C, IPOST C] (2)
end vc_pack_body3;
■

\Hide{%
=SML
val _ = map delete_conjecture
["vcVC_PACK_BODY3_3",
"vcVC_PACK_BODY3_4"];
zo("VC_PACK_BODY3'body", "usr504x30");
=TEX
}
=TEX
\subsubsection*{Generated VCs}
\input{usr504x30.th}
\subsubsection*{Notes}
This case shows a data refinement in which a procedure specification does not refer to the auxiliary variables in its frame.
In this case, equations requiring that the procedure does not change the auxiliary variable are introduced.

The subprogram body and the package initialisation in this example cause additional VCs to be generated that are not shown here.
See sections~\ref{SubprogramBody} and~\ref{PackageInitialisation} for these VCs.
\newpage
\subsection{Subunit}\label{Subunit}
\subsubsection*{Compliance Notation Script: Subunit}
\Hide{%
=SML
ns{name="VC_SUBUNIT", unit_type="proc"};
=TEX
}
ⓈCN
procedure vc_subunit
is
  X : INTEGER;
  procedure P
  Δ X[ PRE X, POST X ]
  is separate;
begin
  null;
end vc_subunit;
■
\Hide{%
=SML
ns{name="VC_SUBUNIT.P", unit_type="proc"};
=TEX
}
ⓈCN
 separate (vc_subunit)
 procedure P
   Δ X[ PRE1 X, POST1 X ]
   is
   begin
   Δ X[ PRE2 X, POST2 X]
   end P;
■

\Hide{%
=SML
zo("VC_SUBUNIToP'proc", "usr504x32");
=TEX
}
=TEX
\subsubsection*{Generated VCs}
\input{usr504x32.th}
\subsubsection*{Notes}
The {\ProductML} command required to introduce the new script to contain the subunit has been suppressed for clarity.
The first two VCs assert that the subunit specification statement refines the specification statement in the stub.
The second two VCs arise from the subprogram body as in section~\ref{SubprogramBody}.

\newpage
\subsection{Package Initialisation}\label{PackageInitialisation}
\subsubsection*{Compliance Notation Script: Package Initialisation}
\Hide{%
=SML
ns{name="PACKAGE_INITIALISATION", unit_type="spec"};
=TEX
}
ⓈCN
package package_initialisation
is
  $auxiliary A : ℕ;
  procedure Q(X : in out INTEGER)
  Δ X Ξ A [APRE (A, X), APOST(A, X, X⋎0)] ;
end package_initialisation;
■
\Hide{%
=SML
ns{name="PACKAGE_INITIALISATION", unit_type="body"};
=TEX
}
ⓈCN
package body package_initialisation
is
  $using C : INTEGER; $implement A $by INV(A, C);
  procedure Q(X : in out INTEGER)
  Δ X, C [CPRE C, CPOST(C, X, X⋎0)]
  is begin
   Δ X, C [SPRE C, SPOST(C, X, X⋎0)] (1)
  end Q;
begin
  Δ C[IPRE C, IPOST C] (2)
end package_initialisation;
■

\Hide{%
=SML
val _ = map delete_conjecture
["vcPACKAGE_INITIALISATION_1",
"vcPACKAGE_INITIALISATION_2"];
zo("PACKAGE_INITIALISATION'body", "usr504x34");
=TEX
}
=TEX
\subsubsection*{Generated VCs}
\input{usr504x34.th}
\subsubsection*{Notes}
The {\ProductML} command required to introduce the new script to contain the subunit has been suppressed for clarity.
The first 4 VCs generated by this example do not relate to the package initialisation and may be seen in cases 2 and 3 in section~\ref{SubprogramPackBody} above.
\newpage
\subsection{Range in Type Definition}\label{RangeInTypeDefinition}
\subsubsection*{Compliance Notation Script: Range in Type Definition}
\Hide{%
=SML
ns{name="RANGE_TYPE", unit_type="proc"};
=TEX
}
ⓈCN
procedure range_type
is
 type T3 is (ONE, TWO, THREE);
 subtype SUB is T3 range ONE .. T3'SUCC(ONE);
begin
 null;
end range_type;
■
\Hide{%
=SML
zo("RANGE_TYPE'proc", "usr504x35");
=TEX
}
=TEX
\subsubsection*{Generated VCs}
\input{usr504x35.th}
\subsubsection*{Notes}
Here, the heuristics used in the attempt to prove that the type $SUB$ is non-empty did not succeed (because of the use of the successor attribute) and a VC has been generated.
In normal use, the heuristics typically succeed in evaluating the bounds of the range and such a VC is not generated.
\newpage
\section{Domain Conditions}\label{DCS}
The Z translation of an Ada expression as described in section~\ref{ToE} may involve
applications of partial functions.
For example, the expression {\tt 1 / X}, is translated into {\it 1 intdiv X}, which
is an application of the partial function {\it\_intdiv\_}.
Typically, application of a partial function to a value outside its domain would
correspond to a situation in which execution of the expression would cause an
exception to be raised. For example, ALRM requires
execution of the expression {\tt 1 / X}
to cause the exception {\sf NUMERIC\_ERROR} to be raised if {\tt X} is
equal to zero.

The Compliance Tool has an option to generate {\em domain conditions}
derived from the Ada expressions in the program. These appear as
additional hypotheses in the VCs.
For example, the domain condition derived from the expression {\tt 1 / X} would be the
hypothesis $X \not= 0$.
These domain conditions satisfy the following soundness condition: if $h$ is a domain
condition, then any assignment of values to variables which makes $h$ false would
cause the code from which $h$ has been derived to raise an exception.

Domain conditions are intended to enable the proof of VCs that would be unprovable
without them. Domain conditions are not generated for operations such as integer
addition which may raise an exception but which are represented in Z by total
functions.

ALRM does not require real arithmetic operations to detect error conditions
and raise exceptions in erroneous cases. The compiler-dependent value of the attribute
P'MACHINE\_OVERFLOWS indicates whether or not arithmetic on the real type P
will cause exceptions to be raised for errors such as division by 0.
If generation of domain conditions for real arithmetic is enabled, the VCs
produced are sound subject to the proviso
that this attribute is true for all real types used in the program.

\newpage
\HOLindexOn
\section{Program Structure}\label{PS}
The Z paragraphs in a Z document produced by processing a Compliance Notation script are put in {\Product} theories so as to manage the namespace in a way which represents the Ada program structure.
For this to work correctly, the following rules are imposed:
{\em(a)} a script may contain at most one compilation unit,
and, {\em(b)}, a script delimits the scope of all the k-slots tags and specification statement tags it contains, i.e., the refinement, replacement, or arbitrary replacement step that expands a tag must be given in the same script as the k-slot or specification statement that introduced the tag.



A Z theory, referred to as the {\em script theory} is created for each compilation unit.
The script theory is to be named according to conventions based on the name and type of the compilation unit in the script as shown in table \ref{UoT}.
(The name is given as a parameter to the function $new\_script$ or $new\_script1$ called by convention at the beginning of each script, see \CNUSERGUIDE).

The script theory holds the Z paragraphs arising from the declarative part of the compilation unit.
For each subprogram body, subprogram stub or block statement a theory is generated to hold the Z paragraphs associated with the declarative part of that subprogram body or block.
A subprogram theory has as its parent a context theory which holds a snapshot of the state of the theory for the enclosing declarative part.
A block theory has as its parent the theory associated with the enclosing declarative part.
Any VCs arising from a declarative part go in the corresponding theory.
Any VCs arising from the formal development of a sequence of statements go in the theory associated with the immediately enclosing declarative part.


A command {\em open\_scope} is provided to navigate into the appropriate theory for a given declarative region.
See {\CNUSERGUIDE} for more information.

The scheme for naming the theories is shown in figure~\ref{UoT}.
Note that the expanded names of blocks will include the names of any enclosing loop and block statements and these may be omitted in Ada.
Omitted loop or block names are treated as empty strings and may give rise to clashes.
The
=INLINEFT
$block
=TEX
\ keyword may be used, if necessary, to provide a Compliance Notation name for an anonymous loop or block (see sections~\ref{5.5} and~\ref{5.6} for details).



\def\Stack#1{\begin{tabular}[t]{@{}l@{}}#1\end{tabular}}

\begin{table}[ht]
\begin{center}

\begin{tabular}{lll}
Compilation		& Example		& Example \\
Unit/Item Type		& Unit Name		& Script Name \\\hline
Package Specification	& {\tt utils}		& {\em UTILS'spec} \\
Package Body		& {\tt utils}		& {\em UTILS'body} \\
Procedure Body		& {\tt update}		& {\em UPDATE'proc} \\
			& {\tt utils.write}	& {\em UTILSoWRITE'proc} \\
Function Body		& {\tt head}		& {\em HEAD'func} \\
			& {\tt utils.READ}	& {\em UTILSoREAD'func} \\
Context Theory		& {\tt utils.sort}	& {\em UTILSoSORT'context} \\
Block Statement		& {\tt utils.sort.local}	& {\em UTILSoSORToLOCAL'block} \\
\end{tabular}

\end{center}
\caption{Use of Theories}\label{UoT}
\end{table}
\chapter{COMPLIANCE NOTATION TOOLKIT}\label{cn}
The Z paragraphs below support the translation of expressions and declaration into Z as described in chapter \ref{SEMANTICS}.

Essentially these paragraphs define the representations of the supported predefined types and their supported attributes.
They also give representations for those predefined operators of Ada which are not directly supported by the Z library
and provide for the translation of multi-dimensional array aggregates into Z.

{\small
\input{usr504a}
Ⓢ╒ [ X1, X2, X ]═══════════
│ array_agg2 : (X1 → X2 → X) → ( X1 × X2 → X)
├──────
│ ∀f : X1 → X2 → X; x1 : X1; x2 : X2⦁
│	array_agg2 f (x1, x2) = f x1 x2
└──────────────
Ⓢ╒ [ X1, X2, X3, X ]═══════════
│ array_agg3 : (X1 → X2 → X3 → X) → ( X1 × X2 × X3 → X)
├──────
│ ∀f : X1 → X2 → X3 → X; x1 : X1; x2 : X2; x3 : X3⦁
│	array_agg3 f (x1, x2, x3) = f x1 x2 x3
└──────────────
Ⓢ╒ [ X1, X2, X3, X4, X ]═══════════
│ array_agg4 : (X1 → X2 → X3 → X4 → X) → ( X1 × X2 × X3 × X4 → X)
├──────
│ ∀f : X1 → X2 → X3 → X4 → X; x1 : X1; x2 : X2; x3 : X3; x4 : X4⦁
│	array_agg4 f (x1, x2, x3, x4) = f x1 x2 x3 x4
└──────────────

and so on up to {\it array\_agg20}.
} %\small
\chapter*{REFERENCES}
\addcontentsline{toc}{chapter}{REFERENCES}
\label{BIBLIOG}

\bibliographystyle{fmu}
{\raggedright
\bibliography{fmu,daz}
}
\pagebreak
\twocolumn
\chapter*{INDEX}
\addcontentsline{toc}{chapter}{INDEX}
\small
\printindex

\end{document}
=SML
val _ = diag_line "All module tests passed (by dint of reaching this output statement)."
=TEX

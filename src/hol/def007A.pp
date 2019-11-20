=IGN
********************************************************************************
def007A.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  def007A.doc,v 2011/07/16 15:37:38 1.30
% def007A: include file for def007 and usr005
%
=TEX
\section{STANDARD AND EXTENDED Z}\label{ZStandardAndExtendedZ}
% want to show bar, box and subscription characters throughtout this file:
{\ShowBars
\ShowBoxes
\def\Us#1{\hbox{\underbar{{\footnotesize\tt#1}}}}
\def\Ax{\Us{AX}}
\def\Sch{\Us{SCH}}
\def\Bar{\Us{BAR}}
\def\SuchThat{\Us{ST}}
\def\Is{\Us{IS}}
\def\Semi{\Us{END}}
\def\SQuote{{\hbox{\tt\char'015}}}
\def\DQuote{{\hbox{\tt\char'042}}}
\def\NT#1{{\footnotesize[#1]}}
% pro tem need to define the free type brackets here:
\def\LFreeTyBrk{\MMM{{<}\mkern-8mu{<}}}
\def\RFreeTyBrk{\MMM{{>}\mkern-8mu{>}}}

The \ProductZ\ language is an extension of an approximation to
the Z language of the ongoing standardisation activity for Z.
In this document the term {\em extended Z} is used to refer to the
full \ProductZ\ language, and the term {\em standard Z} for the subset which
approximates the language of the standard.

Normally, the \Product\ parser and type checker prohibit the
use of non-standard features within the paragraphs of a specification
but allow them within predicates and expressions entered as
term quotations (see \ref{ZEnteringSpecification} and \ref{ZGrammar} below).
(This default behaviour may be modified by changing the settings of
the system control flags
=INLINEFT
standard_z_paras
=TEX
\ and
=INLINEFT
standard_z_terms
=TEX
.)

The main differences between standard and extended Z are as follows;

\begin{itemize}
\item
Extended Z is higher-order, in effect the \ProductHOL\ type,
=INLINEFT
ⓣ𝔹⌝
=TEX
, of truth values acts as a given set, so removing the
distinction between the syntactic categories of predicates and expressions
in standard Z. In particular, in extended Z, one can state and prove
theorems involving propositional variables.
\item
Nested term quotations are allowed in extended Z, permitting mixed
language working (see section \ref{ZLexicalAnalysis} below).
\item
Extended Z supports two cast operators required to enter fragments of
Z during proof (see section \ref{ZCasts} below).
\end{itemize}

(Remark, the first of these differences is not fully checked in the current
implementation of the system.)

\section{ENTERING A Z SPECIFICATION}\label{ZEnteringSpecification}
% want to show subscription characters in this section
{\ShowScripts
A \ProductZ\ specification is presented as a \LaTeX\ document using
the facilities described in \cite{DS/FMU/IED/USR001} and in what follows
familiarity is assumed with the use of the extended character
set discussed in that document.

The lexical rules for \ProductZ\ are defined in section \ref{ZLexicalAnalysis} in
terms of the slightly abstract view of the Z character
set shown in table \ref{ZCharacterSetTable}. Each of these characters
be entered into a \ProductZ\ document or into the
\Product\ system using a single key-stroke with the following exceptions:


\begin{itemize}
\item
The guillemet characters, ``%
=INLINEFT
≪
=TEX
'' and ``%
=INLINEFT
≫
=TEX
'', are entered as \verb"%"\verb"<<%" and \verb"%"\verb">>%".
\item
A calligraphic letter such as ``%
=INLINEFT
ℳ
=TEX
'' that has not been assigned a single key-stroke is entered as \verb"%"\verb"calM%".
\item
Most of the additional symbols from the \LaTeX\ manual mentioned under $Symbol$
are entered by enclosing the alphabetic part of the \LaTeX\
name in percent characters. E.g.\ the infinity symbol, ``%
=INLINEFT
⧜
=TEX
'', which
is invoked by the macro \verb"\infty" in \LaTeX, is entered as
\verb"%"\verb"infty%". There are some exceptions to this rule, mainly
because \LaTeX\ has more than one name for some of the symbols.
The exceptions are listed in the file \verb"sievekeyword"
provided in the subdirectory \verb"sun3bin" or
\verb"sun4bin" of the installation directory.
\item
A character is entered as a subscript by preceding it with
the character ⋎.
\item
{\ShowBoxes
The $Box$ characters are entered simply by laying the box out as formal
Z material in the sense of \cite{DS/FMU/IED/USR001}.
Note that the paragraph forms which do not use a box, namely, fixity
paragraphs, given set definitions, abbreviation definitions
and free type definitions, must be preceded by a line containing
the two characters ``$ⓈZ$'' and followed by a line containing
the single character ``■''. Boxes beginning with ``┌'' or ``╒'' must be
terminated with a line beginning ``└'' (not ``■'').
}
\end{itemize}

The paragraph forms behave like ML functions executed at the top-level
for their side-effects (and the formatting directive characters which terminate
the boxes implicitly insert the semi-colon required to cause the
function to be executed by the ML compiler after them).

Z term quotations
are entered bracketed with the characters `ⓩ' and
`⌝', for example,
=INLINEFT
ⓩ⟨1, 2, 3⟩⌝
=TEX
.
Z declaration quotations are bracketed with `ⓩ:' and `⌝',
for example,
=INLINEFT
ⓩ: x, y : ℕ; z : ℤ⌝
=TEX
.
Since a Z term cannot begin with the character `:', there is no ambiguity.
See sections~\ref{ZTerm} and~\ref{ZDeclaration} below for the syntax of Z terms and declarations.
Z term quotations and Z declaration quotations both
behave like ML functions executed for their result value,
which has type
=INLINEFT
TERM
=TEX
.



As described in \cite{DS/FMU/IED/USR001}, the normal effect of the
characters ↗ and ↕ is to begin and end sections of superscripted text.
Thus, for example, the name of the iteration operation is ``%
=INLINEFT
_ ↗ _ ↕
=TEX
'', so that, something entered as
=INLINEFT
R ↗ i ↕
=TEX
\ prints as $R\,\sp{i}$.

\begin{table}[b]
\centering
\begin{tabular}{|l|l|}\hline
=INLINEFT
⦏Letter⦎
=TEX
&
\begin{tabular}{*{12}{p{0.4in}@{}}}
A &	B &	C &	D &
E &	F &	G &	H &
I &	J &	K &	L \\
M &	N &	O &	P &
Q &	R &	S &	T &
U &	V &	W &	X \\
Y &	Z\\
a &	b &	c &	d &
e &	f &	g &	h &
i &	j &	k &	l \\
m &	n &	o &	p &
q &	r &	s &	t &
u &	v &	w &	x \\
y &	z \\
\end{tabular}
\\\hline
=INLINEFT
⦏GreekLetter⦎
=TEX
&
\begin{tabular}{*{12}{p{0.4in}@{}}}
α &	β &	γ &	δ &
ε &	ζ &	η &	θ &
ι &	κ &	λ &	μ \\
ν &	ξ &	 &	π &
ρ &	σ &	τ &	υ &
φ &	χ &	ψ &	ω \\
 &	 &	Γ &	Δ &
 &	 &	 &	Θ &
 &	 &	Λ &	  \\
 &	Ξ &	 &	Π &
 &	Σ &	 &	Υ &
Φ &	 &	Ψ &	Ω \\
\end{tabular}
\\\hline
=INLINEFT
⦏Digit⦎
=TEX
&
\begin{tabular}{*{12}{p{0.4in}@{}}}
0 &	1 &	2 &	3 &	4 &	5 &	6 &	7 &	8 &	9\\
\end{tabular}
\\\hline
=INLINEFT
⦏Symbol⦎
=TEX
&
\begin{tabular}{*{12}{p{0.4in}@{}}}
∪ &	∩ &	⋃ &	⋂ &
⊆ &	⊂ &	∅ &	∉ &
⦇ &	⦈ &	⩤ &	⩥ \\
◁ &	▷ &	⊢ &	⨾ &
⊕ &	⇸ &	→ &	⤔ &
↣ &	⤀ &	↠ &	⤖ \\
↔ &	≤ &	≥ &	$<$ &
$>$ &	⁀ &	 &	≠ &
$+$ &	$-$ &	$*$ &	\# \\
$.$ &	$\sim$ &	⊎ & 	⟦ &
⟧ &	$/$ &	$\backslash$  &	\leavevmode\_ &
% the \leavevmode above defeats a bizarre LaTeX problem.
∧ &	∨ &	¬ &	⇒ \\
⇔ &	$=$ &	∈ &	∀ &
∃ &	× &	\& &	?⊢ &
⨾ &	↾ &	⦂ \\
\multicolumn{12}{p{4.8in}}{and the calligraphic letters and any other symbols from tables 3.4, 3.5, 3.6 and 3.7 of
the  \LaTeX\ User's Guide and Reference Manual, \cite{Lamport86}} \\
\end{tabular}
\\\hline
=INLINEFT
⦏Stop⦎
=TEX
&
\begin{tabular}{*{12}{p{0.4in}@{}}}
$,$ &	$;$ &	$:$ &	⦁ &
$($ &	$)$ &	$[$ &	$]$ &
$\{$ &	$\}$ &	$⟨$ &	$⟩$  \\
$⟦$ &	$⟧$ &
=INLINEFT
≪
=TEX
&
=INLINEFT
≫
=TEX
 & $\vert$ &	$::=$ &	≜ &
𝔹 &	ℂ &	𝔽 &	ℕ &	ℙ \\
ℚ &	ℝ  &
𝕊 &	𝕌 &	ℤ & \\
\end{tabular}
\\\hline
=INLINEFT
⦏Underscore⦎
=TEX
&
\begin{tabular}{*{12}{p{0.4in}@{}}}
$\_$ \\
\end{tabular}
\\\hline
=INLINEFT
⦏Stroke⦎
=TEX
&
\begin{tabular}{*{12}{p{0.4in}@{}}}
$'$ &	$?$ &	$!$\\
\end{tabular}
\\\hline
=INLINEFT
⦏Subscript⦎
=TEX
& Subscripted forms of any of the above characters.
\\\hline
=INLINEFT
⦏Shift⦎
=TEX
&
\begin{tabular}{*{12}{p{0.4in}@{}}}
↗ &	↕ &\\
\end{tabular}
\\\hline
=INLINEFT
⦏Box⦎
=TEX
&
\begin{tabular}{*{12}{p{0.4in}@{}}}
\Ax &	\Sch &	\Semi &	\Is &	\SuchThat&	\Bar\\
\end{tabular}
\\\hline
=INLINEFT
⦏Quote⦎
=TEX
&
\begin{tabular}{*{12}{p{0.4in}@{}}}
\DQuote &\\
\end{tabular}
\\\hline
=INLINEFT
⦏Format⦎
=TEX
& A format character such as space, tab, line-break or page-break.
\\\hline
\end{tabular}
\caption{Character Set}\label{ZCharacterSetTable}
\end{table}


} % Matches the brace at the beginning of this section
% From now on want to see subscripts as subscripts.
\newpage
\section{LEXICAL ANALYSIS}\label{ZLexicalAnalysis}
\paragraph{Token} A {\em token} is a sequence of characters,
as shown in table~\ref{ZCharacterSetTable}, conforming to the
grammar given in this section. The terminal symbols of
the grammar are the sets of characters
defined in the table, and the sentence symbol is $Token$.
The different sorts of token correspond to the sorts of terminal
symbols of the grammar for Z given in section \ref{ZGrammar}, together with an extra sort of space
tokens.

A sequence of characters is interpreted as a sequence of non-space tokens
by a left-to-right scan taking tokens which are as long as
possible and then discarding any $Space$ tokens.
If it is not
possible to do this then the sequence of characters is erroneous.

\ProductZ\ supports inline comments within both paragraphs
and terms. These comments follow
the same rules as for comments in \ProductHOL\ and \ProductML.

As an extension to Z, quotation of terms using other \Product\ languages,
e.g.\ HOL,  is allowed.

=GFT BNF
	⦏Token⦎		=	Identifier
			|	Decor
			|	Narrative
			|	Natural
			|	Float
			|	String
			|	Punctuation
			|	Quotation
			|	Space;
=TEX

	

\paragraph{Identifier} There are four sorts of identifier.
=GFT BNF
	⦏Identifier⦎	=	Alphanumeric
			|	Greek
			|	Symbolic
			|	QuotedIdentifier;

	⦏Alphanumeric⦎
			=	Letter, {Letter | Digit | `_`}, {Subscript}
			| 	`_`, (Letter | Digit | `_`),
				{Letter | Digit | `_`}, {Subscript};

	⦏Greek⦎		=	GreekLetter, {Subscript};

	⦏Symbolic⦎	=	(Symbol | Shift), {(Symbol | Shift)}, {Subscript}
			|	Punctuation, Subscript, {Subscript};

	⦏QuotedIdentifier⦎
			=	`$`, String;
=TEX

=TEX
\paragraph{Decoration} Decoration comprises just a sequence of stroke characters
=GFT BNF
	⦏Decor⦎		=	Stroke, {Stroke};
=TEX


\paragraph{Numbers} An natural number literal is a non-empty sequence of decimal digits
=GFT BNF
	⦏Natural⦎	=	Digit, {Digit};
=TEX
A floating point numeric literal comprises two non-empty sequences of digits separated by a decimal point together with an optional exponent part.
=GFT BNF
	⦏Float⦎	=	Digit, {Digit}, `.`, Digit, {Digit}, [(`e` | `E`), [`~`], Digit, {Digit}];
=TEX
\label{FloatRule}
A token preceded by the reserved identifer `.' is not interpreted as a floating point numeric literal.
E.g., in `$(x, y, (a, b)).1.2$', `1.2' is treated as two natural number literals separated by a `.' and not a floating point literal so that the expression is a valid tuple component selection (see section~\ref{Expression}).
\paragraph{Strings}
A string literal denotes a sequence of arbitary text.
String literals conform to the same syntax as HOL string literals, which follow Standard ML.
=GFT BNF
	⦏String⦎		=	`%DQuote%`, {StringItems}, `%DQuote%`;
	⦏StringItems⦎	=	? As in Standard ML ?;
=TEX
\paragraph{Narrative} The means for delimiting the narrative sections between
formal material in a Z document is defined in \cite{DS/FMU/IED/USR001}:
=GFT BNF
	⦏Narrative⦎	= 	? See Document Preparation User Guide ?
=TEX
\paragraph{Punctuation} This kind of token includes the stop and box characters
of section~\ref{ZEnteringSpecification} symbols and an underscore optionally followed by a
question mark or an exclamation mark.
=GFT BNF
	⦏Punctuation⦎	=	Stop
			|	Box
			|	`_`
			|	`_?`
			|	`_!`;
=TEX
\paragraph{Quotation} A quotation must be a term valued quotation .
E.g.\ an HOL type quotation is not allowed, while an HOL term
quotation is.
=GFT BNF
	⦏Quotation⦎	=	? A term valued quotation ?;
=TEX
\paragraph{Space} A space token is a sequence of one or more white space characters or a comment.
=GFT BNF
	⦏Space⦎		=	Format, {Format}
			|	Comment;
=TEX
Comments follow the syntax for comments in Standard ML:
=GFT BNF
	⦏Comment⦎	=	? As in Standard ML ?;
=TEX
=TEX
\newpage
\section{GRAMMAR}\label{ZGrammar}
The following grammar defines two languages over the set of all non-space
tokens as defined in section \ref{ZLexicalAnalysis}.
The languages are the language of Z specifications corresponding to
the non-terminal $Specification$ in section \ref{ZSpecification}
and the language of Z terms corresponding to
the non-terminal $Term$ in section \ref{ZTerm}. The language of terms
is, in a sense, an extension to standard Z permitting entry of Z constructs
needed as parameters to proof procedures etc.

The specific terminal symbols of the grammar are the punctuation symbols
and reserved identifiers listed below.

=GFT Punctuation
	`ℙ`	`:`	`;`	`\`	`(`	`)`	`[`	`]`	`{`	`}`	`⟨`	`⟩`
	`≪`	`≫`	`⦁`	`_`	`::=`	`%Ax%`	`%Sch%`	`%Semi%`	`%Is%`	`∋`	`%Bar%`
=TEX
=GFT Reserved Identifiers
	`∃⋎1`	`θ`	`λ`	`μ`	`Δ`	`Ξ`	`.`	`...`	`>>`	`⇔`	`∧`	`∨`
	`¬`	`⇒`	`∀`	`∃`	`|`	`×`	`&`	`,`	`/`	`∈`	`=`	`≜`
	`==`	`?⊢`	`↾⋎s`	`⨾⋎s`	`\⋎s`	`⇔⋎s`	`∧⋎s`	`∨⋎s`	`¬⋎s`	`⇒⋎s`	`∀⋎s`	`∃⋎s`
	`false`	`pre`	`true`	`let`
=TEX
In addition to the reserved identifiers, the following identifiers associated with
fixity paragraphs are mentioned in the grammar.
These identifiers may be used as ordinary identifiers except in the appropriate
position in a fixity paragraph.
=GFT Reserved Identifiers
	`fun`		`function`
	`gen`		`generic`
	`rel`		`relation`
	`leftassoc`
	`rightassoc`
=TEX

The only difference between punctuation symbols and reserved identifiers
is that the former are not identifiers according to the lexical rules
given in section \ref{ZLexicalAnalysis} whereas the latter are. The grammar
prohibits attempts to use the reserved identifiers as variables.

The general terminal symbols of the grammar are as shown in
table \ref{ZTerminalSymbols}.

\begin{table}[h]
\centering
\begin{tabular}{|l|l|}\hline
Symbol & Description \\\hline
=INLINEFT
⦏Id⦎
=TEX
 & Identifier other than the reserved identifiers\\\hline
=INLINEFT
⦏Decor⦎
=TEX
 & A sequence of decoration characters\\\hline
=INLINEFT
⦏Natural⦎
=TEX
 & Natural number literal\\\hline
=INLINEFT
⦏Float⦎
=TEX
 & Numeric literal\\\hline
=INLINEFT
⦏Character⦎
=TEX
 & Character literal\\\hline
=INLINEFT
⦏String⦎
=TEX
 & String literal\\\hline
=INLINEFT
⦏Narrative⦎
=TEX
& Informal text\\\hline
\end{tabular}
\caption{Terminal Symbols for the Z Grammar} \label{ZTerminalSymbols}
\end{table}


\subsection{Specification}\label{ZSpecification}
A specification comprises a sequence of {\em paragraphs} interleaved
with narrative text
=GFT BNF
	⦏Specification⦎	=	[Narrative], {Paragraph, Narrative}, [Paragraph];
=TEX
\subsection{Paragraphs}
A paragraph takes one of 7 forms:
=GFT BNF
	⦏Paragraph⦎	=	Fixity
			|	GivenSet
			|	AbbDef
			|	FreeTypeDef
			|	AxBox
			|	Constraint
			|	Conjecture;
=TEX
\subsection{Term}\label{ZTerm}
This non-terminal is an extension to Z enabling expressions, predicates
and schemas to be supplied as parameters to proof procedures etc.

A term comprises a Z predicate (which, in extended Z, includes
expression and schema) together with optional generic parameters.
=GFT BNF
	⦏Term⦎	=	[GenFormals], Pred;
=TEX
Note that the above is actually the same as the $Constraint$ paragraph.
No ambiguity arises because of the use of different beginning and end markers
for the two forms as described in section~\ref{ZEnteringSpecification} above.
\subsection{Fixity Paragraph}\label{ZFixity}
A fixity paragraph describes syntactic abbreviations which are to be used
in the specification. The constructs which can be abbreviated are application
of a function to a tuple of arguments, explicit instantiation of a generic constant
and the membership predicate. These three possibilities are given by
the $Function$, $Generic$ and $Relation$ options in the following production.

=GFT BNF
	⦏Fixity⦎		=	Function , [Prec, [Assoc]], Template, {`,`, Template}
			|	Generic, [Prec, [Assoc]], GTemplate, {`,`, Template}
			|	Relation, Template, {`,`, Template};
=TEX
Each of the three alternatives for a fixity paragraph begins with an identifier
as shown in the following productions.
The options in each of these productions support both the original {\ProductZ}
syntax and the Standard Z syntax.
These identifiers are not treated as reserved except when they appear at the
beginning of a Z paragraph.
=GFT BNF
	⦏Function⦎	=	`fun` | `function`;
	⦏Generic⦎	=	`gen` | `generic`;
	⦏Relation⦎	=	`rel` | `relation`;
=TEX
A numeric precedence may be specified in a function or generic fixity paragraph.
The precedence gives a non-negative numeric precedence for the abbreviations being
described. Omitting the precedence number is equivalent to supplying it as $0$.
This is only relevant to postfix, prefix, or infix templates, i.e.,
those that begin with the placeholder `$\_$`, end with the placeholder `$\_$`,
or both begin and end with the placeholder `$\_$` (respectively).
=GFT
	⦏Prec⦎		= 	Natural;
=TEX
Left or right associativity may be specified in a function or generic fixity paragraph
using the identifiers listed in the following production.
This is only relevant to infix templates, i.e., those that begin and end
with the placeholder `$\_$`.
If the associativity specification is omitted, then an infix template is
treated as right associative,
An example of a function defined with a right associative
template is the function arrow in the Z
toolkit, for which `%
=INLINEFT
X → Y → Z
=TEX
' means the same as `%
=INLINEFT
X → (Y → Z)
=TEX
' rather than `%
=INLINEFT
(X → Y) → Z
=TEX
'.
=GFT BNF
	⦏Assoc⦎		=	`leftassoc` | `rightassoc`;
=TEX
A template has the form of a sample use of the abbreviation with stubs for the arguments.
The stubs are either `$\_$' (optionally followed by `$?$' or `$!$'),
corresponding to an argument position where a single expression is expected,
or `$...$', corresponding to an argument position requiring a list of expressions
(a possibility which does not arise in generic fixity paragraphs or at the beginning and end of
function and relation fixity paragraphs).
The form `$,,$' may also be used and is equivalent to `$...$'.
Quoted identifiers are not allowed in templates.
=GFT BNF
	⦏Template⦎	=	([Stub1], {Id, Stub}, Id, [Stub1]) - Id;

	⦏GTemplate⦎	=	([Stub1], {Id, Stub1}, Id, [Stub1]) - Id;

	⦏Stub1⦎		= 	`_` | `_?` | `_!`;

	⦏Stub⦎		= 	Stub1 | `...` | `,,`;
=TEX

In standard Z, the arguments of functions, relations and generic operators must be expressions.
In {\ProductZ}, functions and relations can also take predicates as arguments.
The stubs `$\_?$' and `$\_!$' are for use in defining operators that use this extension: `$\_?$' indicates an argument that is to be parsed as a predicate and `$\_!$' indicates an argument that is
to be parsed as a predicate or as an expression according to the context.
See sections~\ref{ZCasts} and ~\ref{ZConditionals} below for examples.

The syntactic abbreviations introduced by a fixity paragraph are in
force throughout the entire specification containing them.
The following rules apply to the identifiers which appear in
a template:

\begin{enumerate}
\item the first and last identifiers in the template must not appear
anywhere in any other template in any fixity paragraph
in the specification, unless that template
introduces exactly the same syntactic abbreviation.
\item identifiers other than the first and last in the template must
not appear as the first, or last, identifier in any template in the
specification.
\end{enumerate}

Standard Z imposes the rule that no two infix templates may be
assigned the same precedence but different associativities.
This rule is not imposed by {\ProductZ}, which instead prohibits use
of the resulting syntactic abbreviations in a way which would be ambiguous.

We use the term {\em fancy-fix syntax} to refer to
a use of a syntactic abbreviation.

\subsection{Given Set Definition}
A given set definition lists the names of the given sets
being defined, optionally followed by a constraint:
=GFT BNF
	⦏GivenSet⦎	=	`[`, DecName, {`,`, DecName}, `]`, [`&`, Constraint];
=TEX
\subsection{Abbreviation Definition}
=GFT BNF
	⦏AbbDef⦎	=	EqDef
			|	SchemaBox;

	⦏EqDef⦎		=	DefLhs, (`≜` | `==`), Schema;

	⦏SchemaBox⦎	=	%Sch%, DefLhs, %Is%, VSchemaText, %Semi%;

	⦏DefLhs⦎	=	([VarName], {Id, VarName}, IdDec, [VarName]) - Id
			|	VarName, [GenFormals];

	⦏GenFormals⦎	=	`[`, DecName, {`,`, DecName}, `]`;
=TEX
An instance of the first alternative for $DefLhs$ must match
some template in some $gen$ fixity paragraph in the specification, in the
sense that the template results if we delete any decoration from the $DefLhs$
and replace each $VarName$ in it by `$\_$'.

Note that the $Expr$ possibility for $Schema$ allows an abbreviation
definition to be used either as a ``horizontal'' equivalent of the $SchemaBox$
form or as a means of giving an equational
definition of a, possibly generic, global variable.
\subsection{FreeType Definition}
In a free type definition, constructors which appear in a $fun$ fixity
paragraph may be written using fancy-fix syntax:
=GFT BNF
	⦏FreeTypeDef⦎	=	DecName, `::=`, Branch, {, `|`, Branch}, [`&`, FreeTypeDef];

	⦏Branch⦎	=	([FreeTypePar], {Id, FreeTypePar}, IdDec, [FreeTypePar])
			|	VarName, [FreeTypePar];

	⦏FreeTypePar⦎	=	Expr;
=TEX
We say that the first alternative for a branch matches a template if the template
may be obtained from the branch by deleting any decoration and replacing each
$FreeTypePar$ by
=INLINEFT
`...`
=TEX
\ or
=INLINEFT
`_`
=TEX
.
Each branch construed under the first alternative for $Branch$
must match some template in some $fun$ fixity paragraph
in the specification.

For compatibility with other dialects of Z, the expressions in a
=INLINEFT
FreeTypePar
=TEX
\ may be enclosed in guillemet brackets as described in
section~\ref{GuillemetBrackets}.

\subsection{Axiomatic Box}
An axiomatic box has an optional list of generic formal parameters,
a declaration, and an optional predicate.
=GFT BNF
	⦏AxBox⦎	=	%Ax%, [GenFormals, %Bar%], VSchemaText, %Semi%;
=TEX

\subsection{Constraint}
A constraint may optionally start with a list of generic formal parameters.
=GFT BNF
	⦏Constraint⦎	=	[GenFormals], Pred;
=TEX
There is an ambiguity between this rule and the second alternative
of the rule for the non-terminal $Expr3$, since a phrase of the
form $[X]Y$ could be interpreted either as a constraint with generic
formals $[X]$ or as a term beginning
with an application of a horizontal schema expression
to $Y$. The former interpretation is to be preferred (and, indeed, the
second interpretation cannot be well-typed).


\subsection{Conjecture}
A conjecture comprises an optional label, an optional list of
formal parameters and a predicate.
A conjecture serves either for documentary purposes or as a means of recording an assertion for subsequent proof: the \Product\ system checks that it the conjecture is type-correct and then stores it in the theory database (whence it may be retrieved using the function $get\_conjecture$).
=GFT BNF
	⦏Conjecture⦎	=	[Id], `?⊢`, [GenFormals], Pred;
=TEX
As with $Constraint$ there is an ambiguity
between this rule and the second alternative
of the rule for the non-terminal $Expr3$.
The interpretation as a generic conjecture rather than as a phrase beginning
with an application of a horizontal schema expression is to be preferred.
\subsection{Declaration}\label{ZDeclaration}
A declaration is a sequence of basic declarations each of which is
either an explicit declaration of a list of variables ranging over
some set or a schema-as-declaration.
=GFT BNF
	⦏Decl⦎		=	BasicDecl, {`;`, BasicDecl};

	⦏BasicDecl⦎	=	DecName, {`,`, DecName}, `:`, Expr
			|	Schema;
=TEX
\subsection{Schema}\label{Schema}
The syntax for schema-expressions is as follows:

=GFT BNF
	⦏Schema⦎	=	Schema2
			|	SQuant, SchemaText, `⦁`, Schema;

	⦏SQuant⦎	=	`∀⋎s` | `∃⋎s` | `∃⋎1⋎s` | Quant;

	⦏Quant⦎		=	`∀` | `∃` | `∃⋎1`;

	⦏Schema2⦎	=	Schema3
			|	Schema2, SchInOp1, Schema2;
			|	Schema2, SchInOp2, Schema2;

	⦏SchInOp1⦎	=	`∧` |  `∨` |   `⇒` |  `⇔` ;

	⦏SchInOp2⦎	=	`∧⋎s` |  `∨⋎s` |   `⇒⋎s` |  `⇔⋎s`  | `↾⋎s` | `⨾⋎s`;

	⦏Schema3⦎	=	Schema4
			|	SchPreOp, Schema3;

	⦏SchPreOp⦎	=	`¬` | `pre` | `Δ` | `Ξ`;

	⦏Schema4⦎	=	Expr0
			|	Schema4, [RenameList]
			|	`[`, SchemaText, `]`
			|	Schema4, `\⋎s`, `(`, DecName, {`,`, DecName}, `)`;

	⦏RenameList⦎	=	`[`, Renaming, {`,` Renaming}, `]`;

	⦏Renaming⦎	=	DecName, `/`, DecName;
=TEX
The grammar for $Schema2$ is ambiguous.
The ambiguities are resolved by taking the operators of
$SchInOp1$ and $SchInOp2$ as listed in decreasing order of precedence and taking
each operator as right associative.
The corresponding operators in $SchInOp1$ and $SchInOp2$ have equal precedence.


The operators of $SchInOp1$ are overloaded: they are also used for the logical connectives.
The rules for resolving the overloading are given in section~\ref{ZPredicate} below.
The operators of $SchInOp2$ are not overloaded and can only denote schema operations.

\subsection{Schema Text}
The grammar distinguishes between vertical schema text and
horizontal schema text to ensure that declaration and predicate parts are
separated by a horizontal bar when arranged vertically
and by a vertical bar when arranged horizontally.
=GFT BNF
	⦏VSchemaText⦎	=	[Decl], [∋, Pred];

	⦏SchemaText⦎		=	[Decl], [`|`, Pred];
=TEX
\subsection{Predicate}\label{ZPredicate}
The syntax for predicate is as follows. Note that a schema-expression,
and so an arbitrary expression, is one of the possibilities for a predicate.
=GFT BNF
	⦏Pred⦎		=	Pred1, { `;`, Pred1 }


	⦏Pred1⦎		=	Pred2
			|	Quant, SchemaText, `⦁`, Pred1
			|	`let`, EqDef, {`;` EqDef}, `⦁`, Pred1;

	⦏Pred2⦎		=	Pred3
			|	Pred2, LogInOp, Pred2;

	⦏LogInOp⦎	=	`∧` | `∨` | `⇒` | `⇔`;

	⦏Pred3⦎		=	Pred4
			|	`¬`, Pred3;
	
	⦏Pred4⦎		=	Expr, Rel, Expr {Rel, Expr}			(* Pred4.A *)
			|	([Expr], {Id, Exprs}, Id, [Expr])
				- (Id | (Expr, Id, Expr))			(* Pred4.B *)
			|	Schema
			|	`true`
			|	`false`
			|	`(`, Pred, `)`;

	⦏Rel⦎		=	Id | `∈` | `=`;


=TEX
The grammar for predicates is ambiguous.
The ambiguities are resolved by imposing the following rules:

\begin{enumerate}
\item
The operators in the production
for $LogInOp$ are listed in decreasing order of precedence,
and are right associative.
\item
\label{ZRelRule}
In $Pred4.A$ the {\it Id} in each $Rel$ must appear in a template of
the form $\_Id\_$ in a $rel$ fixity paragraph.
\item
The alternative $Pred4.B$ is only allowed when the resulting phrase matches a template
in a $rel$ fixity paragraph
in the specification. Here the phrase is said to match a template if the template can
be obtained from it by
replacing each direct constituent $Expr$ in the phrase by `$\_$' and
replacing each direct constituent
$Exprs$ by `$...$'.

\item
Negation is to have higher precedence than the infix schema operators
of section \ref{Schema}
\item
\label{ZStubRule1}
An argument corresponding to a stub of the form
`$\_?$' is to be construed as a $Pred$.
\item
\label{ZStubRule2}
An argument corresponding to a stub of the form
`$\_!$' is to be construed as a $Pred$
or a $Schema$ according to whether the surrounding phrase is to be
construed as a $Pred$ or a $Schema$.
\item
A phrase which can be construed both as a $Pred$ and a $Schema$
and not governed by rules~\ref{ZStubRule1} or~\ref{ZStubRule2} above should
be construed as a $Pred$, unless this makes some enclosing phrase
impossible to construe.

\end{enumerate}

Rule~\ref{ZRelRule} above controls the resolution of the overloading in Z of
the logical connectives,
=INLINEFT
∀
=TEX
,
=INLINEFT
∃
=TEX
,
=INLINEFT
∃⋎1
=TEX
,
=INLINEFT
∧
=TEX
,
=INLINEFT
∨
=TEX
,
=INLINEFT
⇒
=TEX
,
=INLINEFT
⇔
=TEX
and
=INLINEFT
¬
=TEX
, which are used both to construct schema expressions and to construct
predicates. This resolution is done on the basis of syntactic
context only, i.e. it can be done without a knowledge of the types of a
construct and its constituents.

In some syntactic contexts where a
construct formed with one of these connectives may appear,
only a truth value, i.e. a predicate, is semantically acceptable,
whereas, in other contexts either a set of bindings, i.e. a schema-as-expression,
or a truth value would be acceptable, and in other contexts
a truth value is not considered to be syntactically acceptable (because
standard is a first order language).

The syntactic contexts demanding
predicates are the positions where $Pred$ occurs in
$SchemaBox$, $AxBox$, $Constraint$, $Conjecture$ and $SchemaText$;
the syntactic contexts permitting
either predicates or expressions are the operand positions of the logical
connectives; and the contexts demanding expressions are the operand
positions of the other schema operators, the $Pred$ which occurs
in $Term$, and all positions where
$Expr$, $Expr0$, $Expr1$, $Expr2$, $Expr3$ and $Expr4$ appear.
The rule is that the overloading of the logical connectives is to
be resolved in favour of the predicate interpretation except where so
doing would force a predicate to appear in some enclosing context which
demands an expression.

As stated in rules~\ref{ZStubRule1} and~\ref{ZStubRule2} above, templates
containing stubs of the form `$\_?$' and `$\_!$' provide exceptions to the
general rule.  See section~\ref{ZCasts} and~\ref{ZConditionals} below for
useful examples of such templates.


\subsection{Expression}\label{Expression}
The syntax for expressions is as follows. Note that a predicate
in brackets is one of the alternatives for expressions.
This is because extended Z is higher-order not first-order.
In standard Z, the predicate must take the $Schema$ alternative
of $Pred4$ unless the expression appears, perhaps nested in additional
(and redundant) layers of brackets, as an immediate constituent
of one of the alternatives for $Pred$, $Pred21$ or $Pred3$.
=GFT BNF
	⦏Expr⦎		=	Expr1;

	⦏Expr0⦎		=	Expr1
			|	`μ`, SchemaText, `⦁`, Expr0
			|	`λ`, SchemaText, `⦁`, Expr0;
			|	`let`, EqDef, {`;` EqDef}, `⦁`, Expr0;

	⦏Expr1⦎		=	Expr2	
			|	([Expr1], {Id, Exprs}, Id, [Expr1]) - Id;	(* Expr1.A *)
			|	Expr1, `×`, Expr1, {`×`, Expr1};		(* Expr1.B *)

	⦏Expr2⦎		=	Expr3	
			|	`ℙ`, Expr2;

	⦏Exprs⦎		=	[Expr, {`,`, Expr}];

	⦏Expr3⦎		=	Expr4
			|	Expr3, Expr4
			|	`θ`, Expr4, [Decor];

	⦏Expr4⦎		=	VarName, [GenActuals]
			|	Literal
			|	Quotation
			|	`(`, Pred, `)`
			|	`(`, Schema, `)`, [Decor]
			|	`(`, `μ`, SchemaText, `)`
			|	`(`, Expr, {`,`, Expr}, `)`
			|	Schema
			|	`(`, [EqDef, {`,` EqDef}], `)`
			|	`⟨`, [Expr, {`,`, Expr}], `⟩`
			|	`{`, [Expr, {`,`, Expr}], `}`				(* Expr4.A *)
			|	`{`, SchemaText, [`⦁`, Expr], `}`			(* Expr4.B *)
			|	Expr4, `.`, VarName
			|	Expr4, `.`, Natural				(* Expr4.C *)
			|	Quotation;

	⦏GenActuals⦎	= `[`, Expr, {`,`, Expr}, `]`;

	⦏Literal⦎	= 	Natural | Float | Character | String;

=TEX
The third alternative for $Expr4$ here is part of extended Z and is not allowed in
standard Z.

The grammar for expressions is ambiguous, the ambiguities are to be resolved using the following rules.

\begin{enumerate}
\item
The alternative $Expr1.A$ is only allowed when the resulting phrase matches a template
in a $gen$ or $fun$ fixity paragraph
in the specification. Here the phrase is said to match a template if the template can
be obtained from it by
replacing each direct constituent $Expr$ in the phrase by `$\_$' and
replacing each direct constituent
$Exprs$ by `$...$'.
(In extended Z, $Expr1.A$ is also allowed when the phrase matches a template
in a $rel$ fixity paragraph.)
\item
The alternative $Expr1.A$ corresponding to a $gen$ fixity paragraph
has lower precedence that the alternative $Expr1.B$ which has
lower precedence than the alternative $Expr1.A$ corresponding
to a $fun$ fixity paragraph.
The precedence and associativity in the fixity paragraphs give the precedence
and associativity  to apply
for a phrase which can be interpreted in
two ways using $Expr1.A$ with the same sort of fixity paragraph.
(In extended Z, a $rel$ fixity paragraph is treated as right associative
with precedence $0$).
A phase which can be interpreted in two ways using $Expr1.A$ and for
which the relevant precedences are different but the relevant associativities
are the same is not allowed.
\item
A phrase of the form $\{S\}$ where $S$ is a {\em Name} could be
interpreted as a set display ($Expr4.A$) or as a set comprehension
($Expr4.B$). The set display is to be preferred.
\item
A phrase of the form $V[S]$ where $V$ is a {\em Name} could be
interpreted as a generic instantiation ($Expr4.A$) or as application
of $V$ to a horizontal schema
($Schema4.A$). The generic instantiation is to be preferred.
\item
A phrase which can be construed both as a $Schema$ and an $Exp$ should
be construed as an $Exp$, wherever possible (this is not a source of
semantic ambiguity).

\item
In extended Z, the ambiguity between the fourth and fifth alternatives of
$Expr4$ is to be resolved in favour of the former (there is no semantic
ambiguity here).

\item
A token should not be treated as a floating point literal if it is preceded by the reserved identifier `.`'.
I.e., the alternative $Expr4.C$ above is to be preferred over the production for $Float$ in section ~\ref{FloatRule}.

\end{enumerate}

\subsection{Names}\label{Names}
=GFT BNF
	⦏VarName⦎		=	IdDec
				|	`(`, (([Stub1], {Id, Stub}, IdDec, [Stub1]) - IdDec), `)`;
=TEX
=GFT BNF
	⦏DecName⦎		=	IdDec
				|		(([Stub1], {Id, Stub}, IdDec, [Stub1]) - IdDec)
				|	Quotation;
=TEX
In the first alternative in both of the above productions the {\it Id} in the $IdDec$
must not appear in any fixity
paragraph in the specification. In the second alternative the result of deleting
any decoration must make the phrase between the brackets the same as some
template in some fixity paragraph in the specification.

In the third alternative for $DecName$, the nested quotation must be an HOL variable or constant.

=GFT BNF
	⦏IdDec⦎		=	Identifier, [Decor];
=TEX

\section{LANGUAGE SUPPORT LIBRARY}
Certain features, such as conditional predicates and expressions, that are language constructs in other dialects of Z can be defined in {\ProductZ}.
Also, in order to enter fragments of Z while doing proofs, some additional language features, such as casts, are desirable and these too can be defined in the language.
This section describes the library that provide these features.


\subsection{Casts}\label{ZCasts}
\ftlmargin=2em
\ftrmargin=2em
The global variables `%
=INLINEFT
_ ⦂ _
=TEX
' and `%
=INLINEFT
Π _
=TEX
' are defined in the library of theories
which support \ProductZ\ as if by the following paragraphs;
however, they are treated specially by the parser and type checker.

ⓈIZ
 	fun	_ ⦂ _
=TEX
╒[X]
	_ ⦂ _ : X × ℙ X → X
├
	(_ ⦂ _) = first
└
ⓈIZ
 	fun	Π _?
=TEX
╒[X]
	Π _? : 𝔹 → 𝔹
├
	∀x⦁Π x = x
└

`%
=INLINEFT
_ ⦂ _
=TEX
' is an operator which acts as a type cast,
i.e., it ensures that its left operand has the same type
as the elements of its second operand and it takes the same value as
its left operand. This is intended for use during
proof when it is necessary to enter
Z expressions which do not contain enough information to
fix the types of all their sub-expressions. For this reason, an expression
of the form
=INLINEFT
ⓩx ⦂ s⌝
=TEX
\ is treated as identical with
=INLINEFT
ⓩx⌝
=TEX
, except that during type-checking
the type constraints imposed by the above definition of `%
=INLINEFT
_ ⦂ _
=TEX
' are enforced.


In entering Z terms, one occasionally needs to
provide a syntactic context which
will force the schema interpretation of the logical connectives.
The left-hand operand of `%
=INLINEFT
_ ⦂ _
=TEX
' supplies such a context.
For example,
=INLINEFT
ⓩ[x:ℤ] ∧ [x:ℤ]⌝
=TEX
\ is a predicate conjunction, whereas
=INLINEFT
ⓩ([x:ℤ] ∧ [x:ℤ]) ⦂ U⌝
=TEX
\ is a schema conjunction.

`%
=INLINEFT
Π _
=TEX
', while it acts as a prefix function from the point of view of the
grammar for Z (i.e., it may be used to form expressions taking the
alternative of $Expr0$ above labelled $Expr1.AS$), supplies a syntactic
context forcing the predicate interpretation of the logical connectives,
and forcing the type checker to treat a schema-expression as a
schema-as-predicate.
For example, in
=INLINEFT
ⓩ[x:ℤ] ∧ [x:ℤ] ≠ [x:ℕ]⌝
=TEX
, the conjunction is necessarily a schema conjunction by the rules of
section~\ref{ZPredicate}.
One can force the interpretation as
a logical conjunction and have the right hand-side treated as
a schema-as-predicate by writing
=INLINEFT
ⓩΠ([x:ℤ] ∧ [x:ℤ]) ≠ Π([x:ℕ])⌝
=TEX
.
Apart from this special interpretation during parsing and type-checking,
=INLINEFT
ⓩΠ x⌝
=TEX
\ is treated as identical with
=INLINEFT
ⓩx⌝
=TEX
.

If for some reason, it is necessary to construct a Z term which actually
has `%
=INLINEFT
_ ⦂ _
=TEX
' or `%
=INLINEFT
Π _
=TEX
' as a sub-term, this may be done by not using the fancy-fix
notation, for example,
while
=INLINEFT
ⓩ1 ⦂ ℤ⌝
=TEX
\ is just the same as
=INLINEFT
ⓩ1⌝
=TEX
,
=INLINEFT
ⓩ(_⦂_)(1, ℤ)⌝
=TEX
\ really is an application of
=INLINEFT
ⓩ(_⦂_)⌝
=TEX
\ to the pair
=INLINEFT
ⓩ(1,ℤ)⌝
=TEX
.


\subsection{Conditionals}\label{ZConditionals}

Standard Z supports a conditional expression form which is defined
as a higher-order operator in {\ProductZ}:
the global variable `%
=INLINEFT
if _? then _! else _!
=TEX
' is defined in the library of theories
which support \ProductZ\ as follows:

ⓈZ
function 0 if _? then _! else _!
■

╒[X]
 if _? then _! else _! : 𝔹 × X × X → X
├
 ∀x, y:X⦁
	(if true then x else y) = x
 ∧	(if false then x else y) = y
└


\subsection{Guillemet Brackets}\label{GuillemetBrackets}

{\ProductZ} supports the syntax for free types in Standard Z
by providing an outfix operator $≪\ \_\ ≫$.
This makes the symbols ``≪'' and ``≫'' act
as general purpose brackets that will not be eliminated by the
type-checker. The guillemet brackets are defined as follows:

ⓈZ
function 0 ≪ _! ≫
■

╒[X]
 ≪ _! ≫ : X → X
├
 ∀x:X⦁ ≪x≫ = x
└

\subsection{Underlined Infix Relations}\label{UnderlinedInfixRelations}

An arbitrary expression can be used as an infix relation symbol in
{\ProductZ} by enclosing it in the underlining brackets,
{\ShowScripts
=INLINEFT
⨽
=TEX
\ and
=INLINEFT
⨼
=TEX
}. These cause the expression to be underlined when printed.
The underlining brackets are defined as follows:

ⓈZ
relation _ ⨽ _ ⨼ _
■

╒[X, Y]
 _ ⨽ _ ⨼ _ : ℙ(X × ℙ(X × Y) × Y)
├
 ∀x:X; R : ℙ(X × Y); y: Y⦁ x ⨽ R ⨼ y ⇔ (x, y) ∈ R
└

} % matches the brace at the head of the file.
















=IGN
********************************************************************************
usr032.doc: this file is part of the PPXpp system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
=TEX
%
% This document includes some xfig diagrams usr032?.fig..
%
%%%%% YOU MAY WANT TO CHANGE POINT SIZE IN THE FOLLOWING:
%\documentclass[a4paper,12pt]{article}
% \documentstyle[11pt,hol1,fleqn,USR,epsf]{book}

\documentclass[a4paper,11pt]{book}
\usepackage{ppusr}
\usepackage{ProofPower}
\usepackage{epsf}
\usepackage{fleqn}

%\usepackage{A4}
%\usepackage{Lemma1}
%\usepackage{float}
\makeindex


\def\SLRP{{\sf SLRP}}
\def\Slrp{{\tt slrp}}

\def\FigRef#1{\ref{#1} on page \pageref{#1}}
\def\Hide#1{\relax}

\vertbarfalse


\newenvironment{NoBoxFig}[3]{%
\begin{figure}[#1]
\def\Label{\label{#3}}
\def\Caption{\caption{#2}}
\begin{center}
\begin{tabular}{c}
\begin{minipage}{.9\hsize}
}{%
\end{minipage}
\end{tabular}
\end{center}
\Caption\Label
\end{figure}}

\newenvironment{Fig}[3]{%
\begin{figure}[#1]
\def\Label{\label{#3}}
\def\Caption{\caption{#2}}
\begin{center}
\begin{tabular}{|c|}\hline
\begin{minipage}{.9\hsize}
}{%
\end{minipage}\\\hline
\end{tabular}
\end{center}
\Caption\Label
\end{figure}}

%%%%% YOU WILL USUALLY WANT TO CHANGE THE FOLLOWING TO SUIT YOU AND YOUR DOCUMENT:

\def\Title{ {\SLRP} User Guide }

\USRmanual{{\SLRP} User Guide}
\USRref{USR032}
\USRisbns{1514276844}
\USRisbnl{978-1514276846}

\def\Abstract{\begin{center}
{\bf Abstract}\par\parbox{0.7\hsize}
{\small This document is the user guide for {\SLRP} --- a simple parser generator for Standard ML.}
\end{center}}

\def\Reference{LEMMA1/XPP/USR032}

\def\Author{R.D. Arthan}

\def\EMail{{\tt rda@lemma-one.com}}

\def\Phone{+44 118 958 4409}

\def\Fax{+44 118 956 1920}

%%%%% YOU MAY WANT TO CHANGE THE FOLLOWING TO GET A NICE FRONT PAGE:
\def\FrontPageTitle{ {\huge ProofPower\\\ \\{\SLRP} User Guide } }
\def\FrontPageHeader{\raisebox{16ex}{\begin{tabular}[t]{c}
\bf Copyright \copyright\ : Lemma 1 Ltd \number\year\\\strut\\
\end{tabular}}}
\begin{centering}



\end{centering}

%%%%% THE FOLLOWING DEFAULTS WILL GENERALLY BE RIGHT:

\def\Version{$Revision: 1.16 $%
}
\def\Date{\FormatDate{$Date: 2003/04/16 13:34:37 $%
}}

%%%%% NOW BEGIN THE DOCUMENT AND MAKE THE FRONT PAGE

\begin{document}
%\headsep=0mm
%\FrontPage
%\headsep=10mm
\makeUSRfrontpage

%%%%% STANDARD RED-TAPE SECTIONS (MAY WANT TO INTERLEAVE SOME \newpage COMMANDS IN THESE)

%%%%% CONTENTS:

\chapter*{CONTENTS}

\tableofcontents

\vfill

\listoffigures

\vfill

\pagebreak

\setcounter{chapter}{-1}

\chapter{ABOUT THIS PUBLICATION} \label{intro}
\section{Purpose}

This document describes the use of the {\SLRP} Parser Generator supplied with {\Product}.

\section{Readership}
This document is intended to be read by users of the {\SLRP} Parser Generator.

It contains both introductory material for the new user and reference material for more experienced users.
The reader is expected to have some familiarity with the Standard ML programming language and with
the concept of using a BNF grammar to specify a formal language.
%%%%% REFERENCES:

\newpage

%%%%% NOW THE CREATIVE BIT:

\chapter{INTRODUCTION}

\section{Overview of {\SLRP}}

{\SLRP} is a simple but powerful parser generator for Standard ML. The input to {\SLRP}
is a grammar written in a version of BNF, \cite{BS6154}.
The output from {\SLRP} is a file of Standard ML code that can be used to construct
a parser for the language specified by the grammar.
Grammar rules may include semantic actions: Standard ML expressions to be evaluated when a rule is applied
during parsing.
{\SLRP} can also output a listing describing its analysis of a grammar
to assist you in designing the language or the grammar that defines it.

{\SLRP} is similar in conception to well-known parser generators like {\tt yacc} and {\tt bison}
for C and ML-Yacc for Standard ML. {\SLRP} differs from these in that the parser it generates
is table-driven rather than comprising a mixture of tables and decision-making code. The tables
are interpreted by a simple polymorphic parser-driver function that takes as its arguments
functions that you supply to carry out application-specific tasks such as reading the input stream
and reporting errors. The parser driver function is supplied as part of a simple API that provides
support for coding these functions. Another difference between {\SLRP} and {\tt yacc} or
{\tt bison} is that it supports dynamic rather than static resolution of parsing conflicts. This makes it easy
to implement language features such as user-defined operator precedences.

{\SLRP} does not include an automatic lexical analyser generator. It does support production
of a generic parser from a grammar. This means that {\SLRP}  can automatically
generate the semantic actions for you.  The result is a complete
working parser whose input is a sequence of terminal symbols in the same format as was
used in the grammar and whose output is a parse tree.
This makes it easy to experiment with the design of the language or
the grammar without committing a lot of effort to writing code.
The generic parser is supplied as part of an API that you can use or adapt
to provide the parsing functionality that your application requires.

{\SLRP} is currently available to run with the Poly/ML or Standard ML of New Jersey compilers.
The output from {\SLRP} is Standard ML code that should work with any Standard ML compiler.
{\SLRP} includes the {\Product} library of utility functions and the
code it generates does depend on these. However, substitutes for the small repertoire
of functions actually used (primarily concerned with table lookup) can easily be developed
to work in other environments.

Like {\tt yacc} and {\tt bison}, {\SLRP} implements a version of the LALR(1)  technique. This
means that it is capable of generating code to parse a wide range of practical languages.
It is used for all of the main object languages supported by {\Product}: HOL, Z and the Compliance
Notation (which includes most of the Ada '83 language).
The {\SLRP} distribution includes example grammars for the programming languages
Ada 95,  Java 1.1 and Pascal and a fairly complete worked example of a parser for C. {\SLRP} is also
used for the parsers for the object languages HOL and Z supported by {\Product}.

The {\SLRP} source code and documentation is packaged using PPTex, the {\Product}
document preparation and literate programming system. You do not need to use
PPTex to use {\SLRP}, but it does provide a convenient way of packaging the various
source files and scripts you need to build a parser with {\SLRP}.

\section{Overview of this Document}

This document is intended to be a self-contained introduction to using  {\SLRP}.
It assumes some familiarity with the Standard
ML programming language and with the basic concepts of using a context-free
grammar written in BNF to specify a language.

The document is structured as follows:

\begin{description}
\item[Chapter~\ref{STARTING}] shows you how to get started by preparing a grammar in the
form supported by {\SLRP} and to use it to implement a first cut at a generic parser, in a few lines of
ML, that reads strings of grammar symbols and outputs parse trees.
\item[Chapter~\ref{COMPLETING}] shows how you can use the API supplied with the generic
parser support code to implement a lexical analyser and how to add semantic
actions to the grammar and so implement a complete working parser for a simple
calculator program.
\item[Chapter~\ref{HOWITWORKS}] gives a brief introduction to the theory behind the LALR(1)
parsing technique and explains the concept of shift/reduce and reduce/reduce conflicts
that tend to arise when working with more complex languages and grammars.
\item[Chapter~\ref{CONFLICTS}] discusses some of the common problems that arise, such
as errors in the grammar; it gives some useful techniques for working with ambiguous
grammars, e.g., for languages which are best expressed using numeric operator precedence.
\item[Chapter~\ref{ERRORS}] shows you how to develop a parser
with more sophisticated error handling and error recovery.
\item[Appendix~\ref{EXAMPLES}] give the full Standard ML code for the examples
in the earlier sections.
\item[Appendix~\ref{COMMAND}] describes the {\SLRP} command line interface.
\item[Appendix~\ref{INPUTFORMAT}] gives the BNF grammar for the SLRP input format.
\item[Appendix~\ref{LIBRARY}] describes the library of Standard ML utility types and functions
that is supplied with {\SLRP}.
\item[Appendix~\ref{DRIVERAPI}] gives detailed reference documentation for the parser driver API.
\item[Appendix~\ref{GENERICPARSERAPI}] gives detailed reference documentation for
the generic parser API.
\end{description}



The source
of this document is itself a literate script containing example grammars and example code that
can be automatically processed and compiled.
Other examples may be found in the documents~\cite{LEMMA1/DEV/WRK063} and
\cite{LEMMA1/DEV/WRK064} supplied with {\SLRP}.

\newpage
\chapter{GETTING STARTED WITH \SLRP}\label{STARTING}

The first task in using {\SLRP} to build a parser is to prepare a text file containing
a grammar for the language you want to parse. The file should be given a name ending
in ``{\tt .txt}''.  The format of this file is specified in detail in appendix~\ref{INPUTFORMAT}.
Figure~\ref{usr032a.grm.txt} shows an example file containing a grammar for a language of arithmetic expressions:

\begin{Fig}{h}{A Grammar for Arithmetic Expressions}{usr032a.grm.txt}
=DUMP usr032a.grm.txt
Expression =	Sum;

Atom =		literal
		|	identifier
		|	`(`, Expression, `)`;

Application =	Atom
		|	`-`, Application
		|	`+`, Application
		|	identifier, `(`, Expression, `)`;

Product =		Application
		|	Product, `*`, Application
		|	Product, `/`, Application;

Sum =		Product
		|	Sum, `+`, Product
		|	Sum, `-`, Product;
=TEX
\end{Fig}

=TEX
In this document, we assume that you are familiar with the basic concepts of what are
generally called {\em context-free} or {\em BNF} grammars, or, in this document, just {\em grammars}.
This example shows the {\SLRP} conventions for writing a grammar: the grammar is
written as a list of equations, which we call {\em productions}; the right-hand side of each
production comprises zero or more
{\em alternatives} separated by vertical bars and terminated by a semi-colon;
each alternative comprises zero or more
{\em grammar symbols} separated by commas.
A {\em nonterminal symbol} is a grammar symbol that appears on the left-hand side
of some production.
A {\em terminal symbol} is a grammar symbol that does not appear on the left-hand side
of any production.
A {\em grammar rule} is an equation such as {\em Sum = Product} whose left and
right-hand sides are both drawn from some production in the grammar.

Nonterminal symbols are written as identifiers, e.g., {\it Sum}, following the Standard ML rules for
forming identifiers (using letters, numbers, underscores and the prime character and
beginning with a letter).
Terminal symbols may be written either as identifiers, e.g., {\it literal}, or as arbitrary strings
enclosed in back-quote characters, e.g., `+`.

In strings, you may use a backslash character as an escape character,
if you need to include a backslash, a new-line or a back-quote character in the string.

{\SLRP} adopts the convention that the first production
gives the starting symbol for the grammar, in this case {\it Expression}. We call
this symbol the {\em sentence symbol} and we use the term {\em sentences} to refer
to the programs, or algebraic expressions, or specification
language paragraphs, or whatever syntactic objects it may be that the sentence symbol represents.

Once you have prepared your grammar file, you can run {\SLRP} to analyse the grammar
and generate the parser code. You use the shell script {\Slrp} to do this, specifying the
name of your file using the {\it -f} option. The file name must end in ``{\tt .txt}''. In this case, the name is
{\tt usr032a.grm.txt}. If you want to generate the generic parser, you specify the option
{\it -g}.  For our example, the command would be as follows:

=SH
	slrp -g -f  usr032a.grm.txt >usr032a.grm.run 2>&1
=TEX
This will result in some messages on standard output (redirected
to the file {\tt usr032a.grm.run} in the above example call on {\Slrp}).
It will also produce two output files: {\tt usr032a.grm.sml} which contains the Standard ML code
of the generated parser and
{\tt usr032a.grm.log} which contains a listing of the grammar and various
additional information;  for example, it includes a sorted list of the terminal symbols,
which is useful for checking for mistyped nonterminal names.

You can now compile and run the generic parser for your language
after first compiling the parser driver and supporting material using
the ML commands shown in figures~\ref{usr032a.grm.sml1} and~\ref{usr032a.grm.sml2}.
The example code in
figure~\ref{usr032a.grm.sml2} defines
a function
=INLINEFT
ae_ parser1
=TEX
\ that takes the name of an input file as its argument;
it parses the sequence of terminal symbols in the input file and, if
the input is correct, prints out
a textual representation of the parse tree.
An example input file, {\tt usr032a.grm.tst}, for it is shown in figure~\ref{usr032a.grm.tst}

If you now execute \verb!ae_parser1 "usr032a.grm.tst"!, you will see the print-out of the parse tree shown
in figure~\ref{usr032a.grm.out}.
The parse tree is printed out as a left-to-right, bottom-up listing of the
grammar rules used to parse the input; each application of a rule is given
a label showing its position in the tree. Each terminal symbol in the print-out of the
tree is followed by the line number on which the terminal symbol in question was encountered.
The print-out can be understood as a top-down description of
how the input has been parsed by reading it backwards: ``{\it 1: an Expression can be a Sum;
1.1: a Sum can be a Sum followed by a plus sign (the one on line 2) followed by
a Product; 1.1.3: a Product can be an Application \ldots}''.

Of course the functionality of the generic parser as it stands is unlikely to be what you
want in your actual application. Both its ``front-end'', i.e., its lexical analyser, and
its ``back-end'', i.e., the generic reduction actions that build a generic parse tree, will
generally need to be modified to do what is really wanted.
Chapter~\ref{COMPLETING} explains how you can go about
mutating the generic parser to meet your needs.



\begin{Fig}{ht}{Generic Parser Input}{usr032a.grm.tst}
=DUMP usr032a.grm.tst
	literal  `*`  `(` literal `-` literal
	`)` `+`  identifier `(`
		 literal `/`
		literal
	`)`
=TEX
\end{Fig}

\begin{Fig}{htp}{The Parse Tree for the Input in Figure~\ref{usr032a.grm.txt}}{usr032a.grm.out}
=GFT
1.1.1.1.1.1.1: Atom = literal(1);
1.1.1.1.1.1: Application = Atom;
1.1.1.1.1: Product = Application;
1.1.1.1.3.1.2.1.1.1.1.1: Atom = literal(1);
1.1.1.1.3.1.2.1.1.1.1: Application = Atom;
1.1.1.1.3.1.2.1.1.1: Product = Application;
1.1.1.1.3.1.2.1.1: Sum = Product;
1.1.1.1.3.1.2.1.3.1.1: Atom = literal(1);
1.1.1.1.3.1.2.1.3.1: Application = Atom;
1.1.1.1.3.1.2.1.3: Product = Application;
1.1.1.1.3.1.2.1: Sum = Sum, `-`(1), Product;
1.1.1.1.3.1.2: Expression = Sum;
1.1.1.1.3.1: Atom = `(`(1), Expression, `)`(2);
1.1.1.1.3: Application = Atom;
1.1.1.1: Product = Product, `*`(1), Application;
1.1.1: Sum = Product;
1.1.3.1.3.1.1.1.1.1: Atom = literal(3);
1.1.3.1.3.1.1.1.1: Application = Atom;
1.1.3.1.3.1.1.1: Product = Application;
1.1.3.1.3.1.1.3.1: Atom = literal(4);
1.1.3.1.3.1.1.3: Application = Atom;
1.1.3.1.3.1.1: Product = Product, `/`(3), Application;
1.1.3.1.3.1: Sum = Product;
1.1.3.1.3: Expression = Sum;
1.1.3.1: Application = identifier(2), `(`(2), Expression, `)`(5);
1.1.3: Product = Application;
1.1: Sum = Sum, `+`(2), Product;
1: Expression = Sum;
=TEX
\end{Fig}

=TEX
\clearpage
\chapter{WRITING A COMPLETE PARSER}\label{COMPLETING}
The code generated by {\SLRP} defines a polymorphic function called
=INLINEFT
slrp'gen_parser
=TEX
. This function takes four parameters which identify functions as follows:

\begin{description}
\item[RESOLVER:] a function to resolve what {\SLRP} sees as possible
ambiguities in the grammar,
referred to as {\em conflicts}, (see chapters~\ref{HOWITWORKS} and~\ref{CONFLICTS} below for more
information on this).
If the grammar has no conflicts, the function {\it default\_resolver} provided
as part of the {\SLRP} library will serve for this parameter.
\item[CLASSIFIER:] a function to map tokens read from an input stream, e.g.,
``TEMP\_VAR'' or ``+'' to the terminal symbol in your grammar that represents the lexical
class of the token, e.g., {\it Identifier} or `+`. A function {\em classifier}
is provided as part of the generic {\SLRP} parser which will serve for
this parameter unless you want to customise the data types used to
represent the lexical classes.
\item[ERROR ROUTINE:] a function to deal with syntax errors. A function
{\it default\_error} is provided as part of the {\SLRP} library to serve
as an off-the-shelf value for this parameter. See chapter~\ref{ERRORS}
for more information on error handling.
\item[READER:] a function to provide input to the parser; this is interface
by which you supply a lexical analyser suiting the rules of the language
you are parsing.
\end{description}

The parser function is also implicitly parametrised by a table generated by {\SLRP}
which maps grammar rules to ML functions called {\em reduction actions} or just {\em actions} for short.
These actions are executed during parsing and give an operational semantics to the grammar.

To understand how this works,
you can think of the parser  identifying the sequence of tokens that
make up its input by a series of {\em reductions} that transform sequences of grammar symbols.
The parser tries to match parts of the input with the right-hand side of a grammar rule.
When a match is found the parser reduces the matching portion of the input to the name of the
nonterminal symbol on the left-hand side of the matching rule.
It keeps trying these reduction steps until it has reached a sequence comprising just the sentence symbol.
Each time a rule is used in a reduction the corresponding action is evaluated and the result or side-effect
of ths gives a semantics to the rule.

The reductions are analogous to a forwards reading of the parse tree in figure~\ref{usr032a.grm.out}:
``{\it 1.1.1.1.1.1.1: The literal (on line 1) can be reduced to an Atom; 1.1.1.1.1.1: an Atom
can be reduced to an Application \ldots}''. The evaluation of the action functions can be viewed as
as a similar reading together with a description of a calculation of a value: ``{\it \ldots an Atom [with value 99]
can be reduced to an Application [with value 99] \ldots}''.

For the generic parser we constructed in chapter~\ref{STARTING}, the
action code is automatically generated by {\SLRP} and the semantics
is calculation of a parse tree. {\SLRP} lets you write Standard ML expressions
alongside the alternatives in a grammar to serve as the action code; when you do this, your
expressions are evaluated as the reduction actions, giving each alternative the semantics
implied by your action code.

The purpose of this section is to show by example how to write a lexical analyser to
serve as the READER function and how to include application-specific actions in a grammar.
Our example will be based on the language of arithmetic expressions of figure~\ref{usr032a.grm.txt};
the result will be a calculator program that reads, parses and evaluates the sentences
of the language.
Section~\ref{LEXAN} deals with lexical analysis and section~\ref{ACTIONS} deals with implementing
the actions.

\section{Lexical Analyser}\label{LEXAN}
The structure {\it GenericSlrpParser} contains the generic parser API which
provides a framework to help you construct a lexical analyser.
Reference documentation for the generic parser API is given in appendix~\ref{GENERICPARSERAPI}
of this document.

In this section we show how you can use this framework to implement a lexical analyser
for the language of arithmetic expressions of figure~\ref{usr032a.grm.txt}.
The framework helps you with things such as reading an input stream and keeping track of line numbers,
letting you concentrate on the lexical matters that are specific to your language.

The framework is provided both as an API and as source code.
The source code is only a few hundred lines of ML.
If you are writing a parser for use in a larger application you may well want, eventually, to take a copy
of the source, strip out the parts you do not use, and customise what remains to the requirements
of your application. In this section, we will concentrate on using the API, since that is the
first step in understanding of the framework.

In the lexical analysis framework, a polymorphic type
=INLINEFT
'lc LEX_VALUE
=TEX
\ is used for communication between the lexical analyser and the parser. It is defined as follows:
=GFT
	type 'lc LEX_VALUE = 'lc * (string * int);
=TEX

Here $'lc$ stands for the ML representation of the various terminal symbols (lexical classes)
in the grammar (together with a special end-of-sentence symbol). In the generic parser we
constructed in chapter~\ref{STARTING}, $'lc$ is instantiated to a data type
=INLINEFT
LEX_CLASS
=TEX
\ representing the identifiers and string quotations that make up the set of terminal
symbols in the {\SLRP} input format. For our language of arithmetic expressions, we
will continue to use this data type for the lexical classes. It is defined as follows:

=GFT
	datatype LEX_CLASS =
			LCIdentifier of string
		|	LCString of string
		|	LCEos;
=TEX

The listing file {\tt usr032a.grm.log} generated by {\SLRP} shows us that we have the following
lexical classes to deal with:
=INLINEFT
identifier,  literal, `(`, `)`, `*`, `+`, `-`, `/`
=TEX
.
Here are the lexical rules chosen for the example language:
identifiers are formed from  letters, numbers and underscores and start with a letter or an underscore;
literals are strings of decimal digits;
the punctuation symbols are as given above together with semicolon, the hash symbol
and the equals symbol (for later use)
and the parser must warn about and skip
over other characters. The input stream comprises a sequence of
arithmetic expressions separated by semicolons.
Comments comprise any sequence of characters beginning
with a hash character and terminated by an end-of-line character.
The ML definitions given
in figure~\ref{lex.values} reflect  some of these design decisions.

To construct a lexical analyser using the framework,
you write what we call recogniser functions for the various
lexical classes.  These are defined in terms of the following data types, a recogniser
function being a function from
=INLINEFT
'lc LEX_STATE
=TEX
\ to itself.

=GFT
datatype CONTINUATION_STATUS =
		InComment
	|	InString of string list;
datatype 'lc LEX_STATUS =
		Unknown
	|	Known of 'lc LEX_VALUE
	|	Comment
	|	Continuation of int * CONTINUATION_STATUS;
type 'lc LEX_STATE = (string list * 'lc LEX_STATUS);
=TEX


The idea is that a recogniser function is passed as the first component
of its parameter a buffer comprising a list of strings representing the
unread input characters (one character per string) from the current
input line.  If it recognises what it finds, the function should consume the appropriate
number of characters from the buffer and return the remaining characters in the buffer together
with a status value indicating what has been found. The generic tools look after
issues such as skipping white space between tokens and ignoring tokens that have
been recognised as comments.

The data types above allow
for lexical values, e.g., comments or strings in some languages, that
can be continued over multiple lines.
We do not need to use these features in our example.

Figures~\ref{lex.punctuation} to~\ref{lex.unknown} show the code for recognising
the lexical classes we are interested in. Because we want to accept a sequence
of arithmetic expressions separated by semicolons, the recogniser for
punctuation maps semicolon to the end of sentence symbol; it also deals
with comments, and, for use when we extend the language a little in section~\ref{ACTIONS}, with
equals signs. The  recognisers for identifiers and numeric literals are straightforwards representations
in ML of finite state machines implementing  our lexical rules. Finally the recogniser for
unknown symbols issues an error message and classifies the erroneous symbol as a comment,
so that the lexical analyser will skip over it.

In figure~\ref{lex.reader}, we use our recogniser functions and the lexical analysis framework API
to construct our READER and then in figure~\ref{lex.parser} we construct the parser
by supplying the appropriate parameters to {\it slrp'gen\_parser} to give a parsing function
that, given a string containing the sentences to be parsed, returns a function which when
called will return the results of parsing the successive sentences in the text.

In figure~\ref{lex.reader}, the first step is to use the function {\it rec\_first} from the API
to combine our individual recognisers. It works by first of all skipping over space characters
and then when a non-space character is found it calls the individual recognisers in turn
until it finds one that signals success (i.e., that does not return status {\it Unknown}).

The READER parameter to {\it slrp'gen\_parser} is defined to have type an instance of
the polymorphic type
=INLINEFT
'st -> 'tok * 'st
=TEX
. Here $'st$ is the type of some internal state of the reader and $'tok$ is the type of the
lexical token returned by a call on the READER.
In the lexical analysis framework, $'st$ is instantiated to
=INLINEFT
string list * bool
=TEX
. I.e., the state comprises a buffer of single-character strings representing the as yet
unconsumed contents of an input line together with a flag indicating whether the input
source for the next line is available.

The function {\it gen\_reader}  in the API will automatically produce a READER given
parameters identifying the lexical class representing end-of-input, a recogniser
function and an input source. The input source is represented by a type
{\it IN\_CHAR\_STREAM} defined in the API, which also provides functions
to construct such input streams given a source of input text such as an ML string
or a file name. This provides all that is needed to construct a READER for a parser
that is expecting to find exactly one sentence in the input source. Our example is
a little more complicated, because we want to read a sequence of sentences
separated by semicolons. Our approach in figure~\ref{lex.reader} is to wrap round
a call of the READER function produced by {\it gen\_reader} some code that records the
state of the READER in an assignable variable.

Given the READER function constructed in figure~\ref{lex.reader}, figure~\ref{lex.parser}
shows the construction of the finished parser. Note that the type {\it IN\_CHAR\_STREAM}
is a record type including a component called {\em close} which we should call to free up
resources, such as open files, associated with the input stream. We do not need to close
a stream explicitly if we read to the end of the stream, but we do need to close it explicitly
if the parsing is abandoned before the end of stream is read.

To test the parser, we can execute the following code which will print out the parse trees for
the two expressions ``$1+2$'' and ``$3*4$''.

=GFT
	let	val p = ae_parser2 "1 + 2; 3 * 4";
	in	print_tree(p());
		print_tree(p())
	end;
=TEX

\newpage
\section{Adding Actions}\label{ACTIONS}
In this section, we will finish off our example by adding
actions to the grammar.
We also extend the language a little to introduce commands that bind
numbers to names. The actions will compute the value of
expressions, so that our parser becomes a simple interactive calculator
with a memory of named numbers.


The grammar for the extended language is given in figure~\ref{usr032b.grm.txt}.
The grammar has been extended in two ways: first, the sentence symbol
is now {\it Command}, which is either an expression as before, or a definition
of a named number, comprising an identifier and an expression giving
its value; second, we have added {\em actions} giving semantics to
the grammar rules as discussed on page \pageref{COMPLETING}.
The actions are given by supplying a Standard ML
expression enclosed in brackets at the end of each alternative.

\begin{Fig}{ht}{An Action Grammar for Arithmetic Expressions}{usr032b.grm.txt}
=DUMP usr032b.grm.txt
Command =		Expression			(red_command1 x1)
		|	identifier, `=`, Expression	(red_command2 x1 x3);

Expression =	Sum					(red_expression x1);

Atom =		literal				(red_atom1 x1)
		|	identifier			(red_atom2 x1)
		|	`(`, Expression, `)`		(red_atom3 x2);

Application =	Atom				(red_application1 x1)
		|	`-`, Application		(red_application2 x2)
		|	`+`, Application		(red_application3 x2)
		|	identifier, `(`, Expression, `)`
							(red_application4 x1 x3);

Product =		Application			(red_product1 x1)
		|	Product, `*`, Application	(red_product2 x1 x3)
		|	Product, `/`, Application	(red_product3 x1 x3);

Sum =		Product			(red_sum1 x1)
		|	Sum, `+`, Product		(red_sum2 x1 x3)
		|	Sum, `-`, Product		(red_sum3 x1 x3);
=TEX
\end{Fig}

Whenever the parser reduces an instance of an alternative in an action grammar,
it evaluates the action as an ML expression.
The result of evaluating an action is called the {\em semantic value}
of the instance of the nonterminal symbol on the left-hand side of the grammar rule.
The action is evaluated inside an ML {\tt fn}-expression whose pattern
binds the variables, {\it x1}, {\it x2}, {\it x3}, \ldots to representations of
the semantic values of the 1st, 2nd, 3rd, \ldots grammar symbols in the alternative
(reading it left-to-right). Here, the semantic value of a terminal symbol is
a representation of the lexical value of the input token.

The semantic values are represented in ML as instances of the following polymorphic type:
=GFT
datatype ('tok, 'lc, 'pp) INPUT_STACK_ITEM =
		Token of 'tok * 'lc
	|	Parsed of 'pp;
=TEX

Here $'pp$ (the name stands for ``partially-parsed'') is the type of the semantic value
of a nonterminal symbol and $'tok$ and $'lc$ are the types for the lexical value of a token
and its lexical class.  For our calculator, $'pp$ will be integers representing
the results of evaluating arithmetic expressions; $'tok$ and $'lc$
will be the types {\it AE\_LEX\_VALUE} (defined in figure~\ref{lex.values})
and {\it LEX\_CLASS} (discussed in section~\ref{LEXAN}) respectively.
In fact, if you're using the lexical analysis framework,
all you usually need to know about the operand of the constructor {\it Token} is that it has
the form $((\_, (s, \_)), \_)$ where $s$ is the text of the input token.

In our action grammar, we have adopted the convention of having a separate ML function for each
alternative in the grammar. We call these the {\em reduction} functions.
Each reduction function is passed as parameters the $xN$ that
correspond to nonterminals, literals or identifiers in the alternative. So, for
example, the function {\it red\_sum2} is passed the semantic values of the two operands
of the addition.

Figures~\ref{actions.commands} to~\ref{actions.expressions3} give the reduction
functions which give the calculator semantics to our language.
The reduction functions do pattern-matching on their parameters to pick out
the semantic values of the symbols on the right-hand side of the corresponding
grammar rule: a parameter corresponding to a nonterminal has a pattern constructed
with {\it Parsed} and a parameter corresponding to a terminal symbol has a pattern
constructed with {\it Token}.
Several of the reduction functions are just defined to be equal to an auxiliary function
{\it red\_accept} which simply returns the semantic value of its parsed parameter
(this is often useful for rules where the right-hand side comprises a single nonterminal).

For example, {\it red\_application4} in figure~\ref{actions.expressions1} corresponds to
the rule:

=GFT
	Application = identifier, `(`, Expression, `)`
=TEX

Its first parameter is expected to be a token and its second a parsed value.
It implements a semantics supporting two named functions ``abs'' and ``sgn''
which compute absolute value and the sign function. It checks to see that
the name is one of these two and if so returns the value of
the specified function applied to the number appearing in the second parameter.
If the name is not one of the two supported functions it outputs an error
message and raises an exception.

The reduction functions for commands shown in figure~\ref{actions.commands}
also have side effects: they both cause something to be printed on standard output
and update a table of named numbers (used in {\it red\_atom2}
to look up the value of an expression comprising an identifier --- {\it red\_command1}
adopts the ML-like convention of binding a top-level expression to the variable {\it it}).

In general, care should  be taken when actions have side-effects, since the order in which the
actions are evaluated can be tricky to understand. In this case, all we need to
know is that the calling order corresponds to some order for constructing a parse
tree from the bottom up. Since the production for the sentence
symbol, {\it Command}, is not recursive, the actions in its alternatives will
be evaluated once only and after evaluating any other actions for each
sentence parsed.

Finally, figure~\ref{actions.parser} shows the construction of the finished parser with
semantic actions. It reuses the lexical analyser code described in section~\ref{LEXAN}.
So that it can be tested interactively, we formulate the parser to take its input
from an {\it instream}, such as {\it std\_in}.

If you compile the code in the figures in sections~ref{Compiling}
to~\ref{ActionCode} and run the following ML command, you will
begin an interactive session with our simple calculator program.
=GFT
	ae_parser3 std_in;
=TEX

\Hide{
=DUMP usr032b.grm.tst
# One of everything for the calculator program:
1;
ten = 10;
eleven = ten + 1;
twelve = (2  + 2) * 5 - (4 + 4);
one = +1;
neg = -one;
zero = sgn(one) + sgn(neg);
two = abs(one) + abs(one);
three = two + - sgn(neg);
four = twelve/three
=TEX
} %\Hide

If you put a semicolon-separated list of commands in a file, say {\tt usr032b.grm.tst},
then the following command will execute the commands.
=GFT
	ae_parser3 (open_in "usr032b.grm.tst");
=TEX

Note that the calculator
will not allow the file to end with a semicolon. You may find it an instructive exercise to try redesigning
the calculator to treat semicolons as terminators rather than separators --- there
are many ways of going about it.

\clearpage

\chapter{HOW THE PARSERS WORK}\label{HOWITWORKS}
Many useful grammars give rise to problems when you first enter them
into a tool like {\SLRP}; moreover, some applications have requirements, e.g., for
error-recovery, that are not covered by the simple techniques
we have been using so far. To help you understand and solve
the problems that can arise, this section gives a more
detailed description of how {\SLRP} and the parsers it generates work.

\section{LR(0) Parsing}

For any grammar, parsing a sentence according using the grammar
corresponds to finding a possible computation of a machine called the LR(0) automaton
for the grammar. The behaviour of this machine is governed by
a certain rooted directed graph each of whose edges is labelled
 either with a grammar symbol or with a special symbol {\$} meaning end-of-input.

An example grammar and the corresponding graph are given in figure~\ref{lr0.automaton}.
The root of the graph is the node drawn in black. The nodes of the graph
are referred to as {\em states}. There is a distinguished state
``accept'', which is labelled $-1$ in the figure.


\begin{NoBoxFig}{ht}{A Grammar and the Graph of its LR(0) Automaton}{lr0.automaton}
\begin{tabular}{@{}c@{}}
\begin{tabular}{|c|}\hline
\begin{minipage}{0.8\hsize}
=DUMP usr032d.grm.txt
Decl		= UninitDecl, `;`
		|  InitDecl, `;`;

UninitDecl	= var, `:`, type;

InitDecl	= var, `:`, type, `:=`, expr;
=TEX
\end{minipage}\\\hline
\end{tabular}\\\ \\
\epsffile{usr032a.eps}
\end{tabular}
\end{NoBoxFig}


The LR(0) automaton is a machine whose input comprises the graph and a string of terminal symbols.
The states of the automaton are the nodes of the graph, the initial state being the root of the graph.
The automaton ``consumes'' its input string, symbol by symbol working from left to right, but it need not consume a new symbol on every transition.
At each stage of its computation it carries out one of the following types of transition:

\begin{description}
\item[Accept:] if the current state $s$ is ``accept'', then the input string is a sentence of the language, the sequence of reductions which have been carried out determine a parse tree for it, and the automaton stops, accepting the input string;

\item[Shift:] if there is an edge labelled with the current input symbol and leading from the current state $s$ to some state $s'$, then the automaton can consume the input symbol and move to state $s'$;


\item[Reduce:] if there is a state, $s'$, and a grammar rule, $X = \alpha$, such that:
\begin{enumerate}
\item the path in the automaton that led to the current state $s$ passes through $s'$
\item the edge labels on the path from $s'$ to $s$ spell out the sequence of symbols $\alpha$
\item there is an edge labelled with $X$ leading out of $s'$ to some state
$s''$
\end{enumerate}
then the automaton can move to state $s''$ (without consuming an input symbol);
\item[Error:] if none of the above types of transition is possible, the input string is not
a sentence of the language and the automaton stops, rejecting the input string.
\end{description}

For example, consider the input ``{\it var, `:', type, `:=', expr}'' for the example  in
figure~\ref{lr0.automaton}. From the start state 10,
the first three input symbols force the automaton to shift three times and enter state 9.
In this state it has a choice: either it can reduce to state 1 (taking $s'$ to be the
start state 10, and using the rule
for {\it UninitDecl}), or it can shift into state 5.
Such a choice is referred to as a {\em conflict} and means that the LR(0) automaton
does not give a deterministic parser for the grammar.

\section{Conflict Resolution}\label{ConfRes}

An LR(1) automaton is an LR(0) automaton equipped with a table resolving any conflicts
by telling it
what transition to make in each state for each possible input symbol.  This table
is called the {\em lookahead} table.
If a suitable lookahead
table exists for the grammar then the grammar is unambiguous and the LR(1) automaton
will provide a deterministic parser for it. At each stage of a parse, the action of the parser
is driven by the next unconsumed input symbol, which we refer to as the {\it lookahead token}.

There are several ways of attempting to calculate lookahead tables. The method used in {\SLRP} is first
to apply a simple method called SLR(1) to compute the LR(0)
graph and to calculate a first approximation to the lookahead table.
This may not resolve all the conflicts, in which case {\SLRP} applies a rather more
sophisticated method called LALR(1)  in an attempt to resolve the remaining conflicts.

Even the LALR(1) method will sometimes fail to resolve all conflicts.
There can still be states and input symbols for which the lookahead tables
offer the automaton more than one choice.
It turns out that there will never be a choice between two different ways to shift: the
possibilities for a given state and input symbol may include at most one shift transition
and any number of reduce transitions.

{\SLRP} implements a traditional heuristic to resolve the situations where there is a choice
between several reduce transitions (reduce/reduce conflicts):
the reduction corresponding to the nonterminal that appeared first
in the grammar is taken as the resolution and the rest are removed. If several reductions for the
same nonterminal are possible, then the alternative that appeared first is taken as the resolution.

After this heuristic has  been applied, there will be at most one conflict for each state
and input symbol and that will be a shift/reduce conflict. Chapter~\ref{CONFLICTS} below
discusses how you can check that the built-in static resolution of reduce/reduce conflicts is appropriate
for your application
and how you can work with grammars that have shift/reduce conflicts by supplying ML code
to resolve conflicts dynamically.

\section{LR(0) States}

If your grammar gives rise to conflicts you will often need to study the listings it produces to understand
what is causing the problem. The listing of the state table can be very useful for this purpose.
The state table comprises a list of sets of {\em items},
an {\em item} being a grammar rule together with a marker identifying a position
the parser could reach in parsing an instance of that rule.

The LR(0) state table is constructed by
an algorithm which groups the items into sets. The resulting sets of
items are assigned numbers which represent the states in the implementation of the LR(1)
automaton.
Note that the algorithm does not generally produce an equivalence relation on items, i.e., an
item may appear in several different states.

Figure~\ref{lr0.state.table} shows some extracts
from the listing of a state table for a grammar for the C programming language.
Items are shown in the listing as grammar rules with a dot to indicate the position marker.
For example, the two items in state 207 show the position in a parse when
the then-part of an if statement has just been identified.
This is discussed in more detail in section~\ref{SHIFTREDUCE}.

\begin{Fig}{t}{LR(0) State Table and Conflict Listing}{lr0.state.table}
\small
\tabstop=0.7\tabstop
=GFT
+++ State Table +++
...
207:	selection_statement = `if`, `(`, expression, `)`, statement.
	selection_statement = `if`, `(`, expression, `)`, statement., `else`, statement
...
343:	statement = .labeled_statement
	statement = .compound_statement
	statement = .expression_statement
	statement = .selection_statement
	statement = .iteration_statement
	statement = .jump_statement
	labeled_statement = .identifier, `:`, statement
	labeled_statement = .`case`, constant_expression, `:`, statement
	labeled_statement = .`default`, `:`, statement
	compound_statement = .`{`, `}`
...
+++ Conflicts +++
...
1 conflict detected (1 shift/reduce, 0 reduce/reduce)

State 207 on symbol `else`
	Reduce by selection_statement = `if`, `(`, expression, `)`, statement | ...
	Shift to 343
=TEX
\end{Fig}

%\clearpage

\section{{\SLRP} Parser Driver Implementation Details}

The LR(1) automaton is implemented in {\SLRP} by the grammar-independent
parser driver code in \cite{DS/FMU/IED/DTD018,DS/FMU/IED/IMP018}.
Reference documentation for the parser dirver API is given in appendix~\ref{DRIVERAPI} of
this document.

The parser driver API implements a generic LR(1) automaton as an ML function {\it slrp'parse}.
In the implementation,  all the information the automaton needs
about the LR(0) graph, the grammar and the lookahead
table are encoded in a compact way in two tables called the action table and the goto table.
The implementation maintains two stacks to represent the path in the graph
that led from the root to the current state (one stack for the states and one for the edges).

The function {\it slrp'parse} takes 8 parameters. The first four of these parameters are values that
are computed by {\SLRP}: the first of these
gives the initial state of the automaton; the next two give action
table and goto table; the fourth parameter gives reduction table containing the
semantic action functions that are applied whenever a reduction transition is
taken.

The function {\em slrp'gen\_parser} is then generated by {\SLRP} as the result of applying
{\it slrp'parse} to an initial state value and a trio of tables that it
computes for your grammar (see appendix~\ref{DRIVERAPI} for more information).
The remaining four parameters
of {\it slrp'parse} become the parameters to {\it slrp'gen\_parser} as discussed
at the beginning of chapter~\ref{COMPLETING} above.
\newpage
\chapter{AMBIGUOUS GRAMMARS}\label{CONFLICTS}

This section is intended to help you understand and deal with shift/reduce and reduce/reduce
conflicts in your grammar. If either kind of conflict occurs, you have essentially two options:
either change the grammar to eliminate the conflicts or take steps to ensure that the parser
that is generated does what is wanted despite the conflicts.
The following points should be kept in mind when working on a grammar with conflicts.
\begin{itemize}
\item You may be fighting against one of the following possibilities:
\begin{itemize}
\item your language may be inherently ambiguous, i.e., there may
be no way of describing it with an unambiguous grammar;
\item your grammar may be ambiguous and it may be difficult or impossible to find a tractable grammar for
the same language that is not ambiguous;
\item your grammar may be unambiguous but may not belong
to the class of LALR(1) languages that {\SLRP} can support without some hand-coded assistance.
\end{itemize}
In practice, there is almost always a work-around for these problems,
e.g.,  by writing code to resolve conflicts dynamically or by
using a grammar for a  tractable superset of
the language and imposing extra hand-coded checks.
\item A shift/reduce conflict will cause the parser to fail at run-time if it encounters an
input that gives rise to the conflict unless you have supplied a RESOLVER function that
tells the parser what to do.
\item Reduce/reduce conflicts are all resolved statically using the heuristic described in
section~\ref{ConfRes} above. You must check that this heuristic is appropriate for
your language.
\item A grammar with a few well understood conflicts that you can resolve dynamically
is often a better solution than a more complicated grammar without the conflicts.
\end{itemize}

\section{Debugging a Grammar}

Conflicts often occur just because of a mistake in grammar.
Common causes include: accidentally omitting an important punctuation symbol, accidentally
duplicating an alternative in a production and giving several ways of accepting an empty
sequence of symbols. Figure~\ref{c.broken} shows some fragments of the
grammar for C as given in ~\cite{LEMMA1/DEV/WRK064} seeded with a few minor errors
along these lines. These modifications introduce 200 conflicts into the grammar.

There is no general rule for debugging a grammar. The following suggestions
may be helpful:

\begin{itemize}
\item The first thing
to do is to study  the conflict and state table listings to see which symbols
and which rules are causing the problem.
\item In the case of a large grammar
like the one for C, try analysing sublanguages such as expressions, statements and declarations
separately. This will often reduce the amount of information you need to process to find the
source of the problem, particularly if there are several unrelated errors in the grammar.
\item If the problem seems to be related to missing or ambiguous
punctuation in the grammar, then try temporarily introducing distinctive delimiters
for the main syntactic categories, e.g., for C, try putting distinctive keywords
in at the points where the statement and declaration nonterminals are used.
\item Try approximating the language from below: start from a small sublanguage that
works and then put in language features one by one.
\item Try approximating the language from above: design a superset
which admits a simpler description and then refine it in stages to
remove unwanted constructs.
\item
Check for other errors: e.g., {\SLRP} reports if there are nonterminals
in your grammar that are useless because they are not reachable from
the sentence symbol or because they generate an empty language. These
problems could highlight a mistake giving rise to conflicts elsewhere.
\end{itemize}


\begin{Fig}{hb}{Fragments of an Incorrect Grammar for C}{c.broken}
=GFT
declaration		(* should have a semicolon terminator *)
	= declaration_specifiers
	| declaration_specifiers, init_declarator_list
	;
declaration_list	(* an empty declaration list should not be allowed *)
	=
	| declaration_list, declaration
	;
statement_list	(* an empty statement list should not be allowed *)
	=
	| statement_list, statement
	;
relational_expression
	= shift_expression
	| relational_expression, `<`, shift_expression
	| relational_expression, `>`, shift_expression
	| relational_expression, `<=`, shift_expression
	| relational_expression, `<=`, shift_expression
			(* typo: should be `>=` - duplicates previous alternative *)
	;
=TEX
\end{Fig}

\clearpage

\section{Reduce/Reduce Conflicts}

As discussed in section~\ref{ConfRes}, {\SLRP} resolves reduce/reduce conflicts statically
using a heuristic based on the order of the rules in your grammar:
if the conflict is between two different nonterminals it chooses the one that came first
in the grammar, and similarly if it is between two different alternatives for the same
nonterminal it chooses the first one.

An example that gives rise to several reduce/reduce conflicts
is given in figure~\ref{usr032e.grm.txt}. This example shows a modification to part of the grammar
of figure~\ref{usr032b.grm.txt} which produces reduce/reduce conflicts.
The heuristic will cause the alternatives with two minus signs or two plus signs to be used
in favour of the ones with just one sign.

\begin{Fig}{ht}{A Grammar With Reduce/Reduce Conflicts}{usr032e.grm.txt}
=DUMP usr032e.grm.txt
Application =	Atom				(red_application1 x1)
		|	`-`, `-`, Application	(red_accept x3)
		|	`+`, `+`,  Application	(red_accept x3)
		|	`-`, Application		(red_application2 x2)
		|	`+`, Application		(red_application3 x2)
		|	identifier, `(`, Expression, `)`
							(red_application4 x1 x3);
=TEX
\end{Fig}

\begin{Fig}{ht}{Reduce/Reduce Conflicts --- Extracts from the Listing}{usr032e.grm.log}
=GFT
+++ State Table +++
...
12:	Application = `-`, `-`, Application.
	Application = `-`, Application.
13:	Application = `+`, `+`, Application.
	Application = `+`, Application.
14:	Application = identifier., `(`, Expression, `)`
...
+++ Conflicts +++
...
12 conflicts detected (0 shift/reduce, 12 reduce/reduce)

State 12 on symbol LCEos
	Reduce by Application = ... | `-`, Application | ...
	Reduce by Application = ... | `-`, `-`, Application | ...
 ...
State 13 on symbol LCEos
	Reduce by Application = ... | `+`, Application | ...
	Reduce by Application = ... | `+`, `+`, Application | ...
...
=TEX
\end{Fig}

The heuristic for removing reduce/reduce conflicts
works  nicely with some styles for presenting a grammar, but care should
be taken to check that it does actually implement the language that you want.
It is wise to check the state table and the conflicts in the listings carefully.
The relevant parts of the listings for the above example are shown
in figure~\ref{usr032e.grm.log}.

In the example, there are 12 conflicts --- the two that are shown in figure~\ref{usr032e.grm.txt}
are both repeated for each of the symbols `*', `/', `+', `-' and `)' that can validly appear immediately
following an Application. The state table shows that the only thing the parser can be doing
when the reduce/reduce conflict would occur is recognising an Application following two plus or
minus signs. From this you can conclude that it is always safe to reduce by the rule that
comes first, and so this tiny optimisation to our calculator is acceptable.

\clearpage
\section{Shift/Reduce Conflicts}\label{SHIFTREDUCE}

When {\SLRP} detects shift/reduce conflicts, these always have to be resolved dynamically. I.e.,
you must supply a RESOLVER function to tell the parser what to do when the conflict occurs.
The function can either give the parser one of three options: Shift, Reduce or Error, or it can raise
an exception,
The function {\it default\_resolver} supplied in the {\SLRP} API always raises the exception
{\it PARSER\_ERROR}, which is intended to signal a design error.

The API uses the following data types for the RESOLVER function:

=GFT
datatype RESOLUTION	=	DoShift
				|	DoReduce
				|	DoError;
type ('tok, 'lc, 'pp)RESOLVER
	= ('tok * 'lc) * ('tok, 'lc, 'pp)INPUT_STACK * ((string * int) * int)
		-> RESOLUTION;
=TEX
The RESOLVER function is called when a lookahead token giving rise to a shift/reduce conflict
is encountered, its arguments have the form $(x, stack, r)$ where $x$ is a pair containing
the lexical value and lexical class of the lookahead token, $stack$ is the parser driver input stack, and $r$
describes the possible reduction by giving the nonterminal name, the index of the
alternative (0-based indexing) and the state to be entered.
Most applications do not need all this information, but there are situations where it is useful.
As we shall see shortly, the parser driver API provides a function to make one common approach (based on
operator precedence) a little easier.

\section{If-then-else}
For a first example, consider the example in figure~\ref{lr0.state.table}
which shows extracts from the listing of the state table for the grammar for
C given in~\cite{LEMMA1/DEV/WRK063} together with the description of the conflict that grammar
gives rise to. This conflict is caused by a deliberate ambiguity in the grammar,
which does not specify whether the else-part in the statement ``{\tt if(a) if(b) f(); else g();}''
belongs to the inner if-statement or the outer one. The language rule is that the else-part should
belong to the inner if-statement and that means the resolution should always be to shift. As this
is the only conflict in the grammar, the RESOLVER function in~\cite{LEMMA1/DEV/WRK063}
could hardle be simpler:

=GFT
fun c_resolver _ = DoShift;
=TEX

Note that if the C language rule said that an ambiguous else-part belonged to the outer
if-statement, then it would not be satisfactory to use the grammar of~\cite{LEMMA1/DEV/WRK063}
and a RESOLVER that always reduces --- the resulting parser would reject valid
statements such as  ``{\tt while(a) if(b) f(); else g();}''. To achieve the desired effect, you
would either have to rework the grammar or supply a more complicated RESOLVER that
examined the input stack to check if it is appropriate to reduce.

\section{Operator Precedence}
Our next example shows a widely used technique. The grammar in figure~\ref{usr032f.grm.txt}
actually specifies the same language of arithmetic expressions as the grammar of
figure~\ref{usr032a.grm.txt} considered in chapter~\ref{STARTING} above. However,
unlike the earlier grammar, it is ambiguous: it no longer has
the precedence rules for the arithmetic operators wired into it; it allows an expression such as
``$1*2 + 3*4$'' to be parsed in several different ways.

\begin{Fig}{ht}{A Grammar Requiring Operator Precedence Rules}{usr032f.grm.txt}
=DUMP usr032f.grm.txt
Expression = 	Binary;

Atom =		literal
		|	identifier
		|	`(`, Expression, `)`;

Application =	Atom
		|	`-`, Application
		|	`+`, Application
		|	identifier, `(`, Expression, `)`;

Binary =		Binary, `+`, Binary
		|	Binary, `-`, Binary
		|	Binary, `*`, Binary
		|	Binary, `/`, Binary
		|	Application;
=TEX
\end{Fig}

Figure~\ref{usr032f.grm.log} shows an extract from the {\SLRP} listing for the grammar.
The 16 conflicts arise from the sixteen different pairs of the infix operators,
`+', `-', `*' and `/'.  The conflicts arise in four different states, all of which contain exactly
the same set of items (the ones shown in the extract).
From the state table, we can see that the conflict occurs when the
parser has just got to the end of something that could be a {\it Binary} and the lookahead
token is one of the infix operators. From the conflcts listing, we see that the possible reduction is
via one of the alternatives
{\it Binary, `+', Binary}. {\it Binary,  `-', Binary} etc.
This means that the conflict can be resolved by comparing the topmost terminal symbol on the stack with
the lookahead token: for example, if the topmost terminal symbol is `*' and the
lookahead token is `+', then we having something of the form $a * b + c$, and we should reduce
so that the multiplication takes precedence over the addition.

\begin{Fig}{htp}{Operator Precedence --- Extracts from the Listing}{usr032f.grm.log}
=GFT
+++ State Table +++
...
12:	Binary = Binary., `+`, Binary
	Binary = Binary, `+`, Binary.
	Binary = Binary., `-`, Binary
	Binary = Binary., `*`, Binary
	Binary = Binary., `/`, Binary
...
+++ Conflicts +++

...
16 conflicts detected (16 shift/reduce, 0 reduce/reduce)

...
State 12 on symbol `*`
	Reduce by Binary = Binary, `+`, Binary | ...
	Shift to 20
...
=TEX
\end{Fig}

The API provides the function {\it simple\_resolver} to simplify the coding of a RESOLVER
based on operator precedence, you provide a function to compare the two tokens
and return the appropriate resolution and it constructs the RESOLVER for you.
Your function is passed a pair $(stk\_tok, la\_tok)$ where $stk\_tok$ represents the
topmost terminal symbol on the stack and $la\_tok$ represents the lookahead token.
The RESOLVER that results will return {\it DoError} if there is no
unreduced terminal symbol on the stack.

=GFT
val simple_resolver:
	(('tok * 'lc) * ('tok * 'lc) -> RESOLUTION) -> ('tok, 'lc, 'pp) RESOLVER;
=TEX

Figure~\ref{operator.precedence.parser} shows this function in use to implement our
example grammar. If you compile this and execute the following, you can check whether
it is building the right parse trees.
=GFT
let	val p = ae_parser4 "2*3 + 4; 2 - 3*4; 1 + 2 + 3";
in	print_tree(p());
	print_tree(p());
	print_tree(p())
end;
=TEX
\section{An Inherently Ambiguous Language}
A language is called {\em inherently ambiguous} if there is no unambiguous context-free grammar
that describes it. Such languages exist, but are not very common in practical applications.
An example is given by the language defined by the ambiguous grammar in figure~\ref{usr032g.grm.txt}.
The language comprises strings comprising some `a's followed by some `b's followed by some `c's
subject to the constraint that there should either be the same number of `a's and
`b's or the same number of `b's and `c's or possibly both.

\begin{Fig}{ht}{An Inherently Ambiguous Language}{usr032g.grm.txt}
=DUMP usr032g.grm.txt
	S	= AB, C | A, BC;
	AB	= | `a`, AB, `b`;
	C	= | C, `c`;
	A	= | A, `a`;
	BC	= | `b`, BC, `c`;
=TEX
\end{Fig}

If you are faced with an inherently ambiguous language, or, and much more likely, a language
defined by a grammar that is difficult to transform into an unambiguous one, then your
only option is to try to specify a wider language and supply code in the reduction functions
or subsequent processing to detect invalid language constructs. This is demonstrated
for our inherently ambiguous example in figure~\ref{usr032h.grm.txt} where the grammar
accepts any string comprising some `a's followed by some `b's followed by some `c's
and the reduction functions impose the desired checks on the numbers of `a's, `b's and
`c's.

\begin{Fig}{ht}{Resolving Ambiguities By Widening the Language}{usr032h.grm.txt}
=DUMP usr032h.grm.txt
	S	= A, B, C	
			((fn Parsed  m => fn Parsed n => fn Parsed p =>
			if	m <> n andalso n <> p
			then	raise SYNTAX_ERROR
			else	0) x1 x2 x3);
	A	= 		( 0 )
		|   A, `a`		((fn Parsed m => m + 1) x1);
	B	=		( 0 )
		|   B, `b`		((fn Parsed n => n + 1) x1);
	C	=		( 0 )
		|   C, `c`		((fn Parsed p => p + 1) x1);
=TEX
\end{Fig}
\section{Transforming a non-LALR(1) Grammar into an LALR(1) one}
In practice, if your grammar gives rise to conflicts, it can often be transformed
into one that does not. Figure~\ref{usr032i.grm.txt} shows an example which
adapts our language of arithmetic expressions to support functions with
more than one argument and to allow the user to define functions using syntax such as
$mean(x, y) = (x + y) / 2$.

The way the grammar is expressed in figure~\ref{usr032i.grm.txt} must give rise to conflicts.
The reason is that, in parsing a construct such as $f(x_1, x_2, \ldots) = \ldots$, while reading
the comma after $x_1$, say, one needs to look ahead as far as the equals sign to guide the
LR(0) automaton into parsing $x_1$ as an {\it IdentifierList} rather than as
an {\it ExpressionList}.

\begin{Fig}{htp}{A non-LALR(1) Grammar}{usr032i.grm.txt}
=DUMP usr032i.grm.txt
Command =		Expression
		|	identifier, `=`, Expression
		|	identifier, FormalParams,  `=`,  Expression;

Expression = Sum;

FormalParams =	`(`, IdentifierList, `)`;

IdentifierList =	identifier
		|	IdentifierList, `,`, identifier;

Atom =		literal
		|	identifier
		|	`(`, Expression, `)`;

Application =	Atom
		|	`-`, Application
		|	`+`, Application
		|	identifier, `(`, ExpressionList, `)`;

ExpressionList =	Expression
		|	ExpressionList, `,`,  Expression;

Product =		Application
		|	Product, `*`, Application
		|	Product, `/`, Application;

Sum =		Product
		|	Sum, `+`, Product
		|	Sum, `-`, Product;
=TEX
\end{Fig}
\Hide{
=SH
sed -e '/^ExpressionList/,/;/d' \
	-e '/^Application/,/;/d' \
	< usr032i.grm.txt > usr032j.grm.txt
=TEX
} % \Hide

Figure~\ref{usr032j.grm.txt} shows a transformation to the productions for {\it Application}
and {\it ExpressionList}
which gives a grammar that defines the same language as that
of figure~\ref{usr032j.grm.txt} but with no conflicts.
The transformed grammar distinguishes between lists of identifiers and lists of more complex expressions.
It makes it explicit how the language of the grammar of figure~\ref{usr032i.grm.txt} can be recognised
by an LR(0) automaton guided only by one lookahead token.

The alternative to the solution in figure~\ref{usr032j.grm.txt} would be to remove the non-terminal
{\it IdentifierList} altogether and use {\it ExpressionList} in its place in the production for {\it FormalParams}.
The action code for {\it FormalParams} would then have to check the semantic value of the
{\it ExpressionList} and reject invalid ones. This would probably be a better solution in the case at hand,
since it makes the grammar shorter and, assuming the semantic actions compute some kind of
syntax tree, processing the tree to check for non-identifiers in a {\it FormalParams} will be no more work
than converting the tree for an {\it IdentifierList} into what is needed for the tree representing
an {\it Application}..


\begin{Fig}{htp}{Making a Grammar LALR(1)}{usr032j.grm.txt}
=DUMPMORE usr032j.grm.txt
Application =	Atom
		|	`-`, Application
		|	`+`, Application
		|	identifier, `(`, NonIdExpressionList, `)`
		|	identifier, `(`, IdentifierList, `)`;

NonIdExpressionList =
			NonIdExpression
		|	IdentifierList, `,`, NonIdExpression
		|	NonIdExpressionList, `,`, Expression;

NonIdExpression =	`(`, Expression, `)`
		|	`-`, Application
		|	`+`, Application
		|	identifier, `(`, NonIdExpressionList, `)`
		|	identifier, `(`, IdentifierList, `)`
		|	Product, `*`, Application
		|	Product, `/`, Application
		|	Sum, `+`, Product
		|	Sum, `-`, Product;
=TEX
\end{Fig}


\clearpage
=TEX
\chapter{ERROR HANDLING}\label{ERRORS}

As mentioned at the head of chapter~\ref{STARTING}, one of the parameters to the {\SLRP}
parser driver is an ERROR ROUTINE: an ML function you provide to deal with
errors. This function is called whenever there is no entry in the action table telling the
parser how to respond to the lookahead token.
The function {\it default\_error} is an error routine that implements the simplest error handling strategy of all: it
just prints an error message and raises an exception. This can be a perfectly acceptable
approach, e.g., see the code in figure~\ref{actions.parser}, which catches the exception,
and continues trying to parse the input if it is running interactively.


The type of the ERROR ROUTINE is an instance of the following type:
=GFT
type ('tok, 'lc, 'pp, 'st)ERROR_ROUTINE
 	= 'tok * ('tok, 'lc, 'pp)INPUT_STACK * STATE_STACK * 'st
		-> 'tok * 'st * int;
=TEX
The quadruple that is passed as the argument to the ERROR ROUTINE has the form
$(tok, is, ss, rs)$, where: $tok$ is the lookahead token that caused the error,
$is$ is the input stack, $ss$ is the stack stack and $rs$ is the READER state.
If the function returns a value (rather than raising an exception), then the return
value is a triple $(tok', rs', n)$, where $tok'$ is a lookahead token to be used
in place of the erroneous one, $rs'$ is a new READER state and $n$ is an integer.
If the ERROR ROUTINE returns $(tok', rs', n)$, the parser will pop $n$ entries
off its input and state stacks, and proceed as if $tok'$ had just been read as
the lookahead token resulting in a READER state rs'.

Figures~\ref{errors1.parser} show an ERROR ROUTINE that raises an exception
after printing a bit more information than {\it default\_error}. It looks up the current
state (the top of the state stack) in the action table and gets the list of lexical
classes that could be dealt with in that state. (The action table entries are lists
of lexical class/action pairs). It prints out an error message similar
to that printed by {\it default\_error}, and then prints out the list of ``expected''
lexical classes. This is quite a common technique, although it is sometimes a little
misleading, since the lexical classes the parser is expecting in a given state may
not be the only ones that could validly continue the input processed so far.

Figuer~\ref{errors2.parser} shows a simple error recovery scheme for the language
of arithmetic expressions.  Here the error routine first prints out the error message
and then it attempts to recover from the error, by discarding tokens until
it encounters the end-of-stream marker (either a semicolon or the actual
end of the input stream). If there is another token available, it reads it and
returns that token and the current READER state to the parser telling it
to unwind its stacks back to their initial state. If there is no more input available
it raises an exception which is handled in the parser function and causes a tidy
exit.


\clearpage
\appendix
\chapter{STANDARD ML CODE EXAMPLES}\label{EXAMPLES}
\section{Compiling {\SLRP} Parsers}\label{Compiling}
The Standard ML code in the figures in this section compiles all the library support needed for the generic parser for
arithmetic expressions described in chapter~\ref{STARTING}
and then compiles and instantiates the code generated by {\SLRP}. If you are
working in a {\Product} ML database, then you can omit the first six files since
they are already compiled into {\Product}.

\begin{Fig}{h}{Compiling the {\SLRP} Library Code}{usr032a.grm.sml1}
=SML
map use [
	"dtd108.sml",	(* Portability infrastructure *)
	"imp108.sml",
	"dtd002.sml",	(* System control and error reporting *)
	"imp002.sml",
	"dtd001.sml",	(* Standard ML utilities *)
	"imp001.sml",
	"dtd018.sml",	(* SLRP parser driver *)
	"imp018.sml",
	"dtd118.sml",	(* Generic SLRP parser support *)
	"imp118.sml"
	];
open GenericSlrpParser;
=TEX
\end{Fig}

\begin{Fig}{htp}{Compiling the Code Generated by {\SLRP}}{usr032a.grm.sml2}
=SML
use"usr032a.grm.sml";		(* The generated parser code *)
val ae_parser1 : string -> unit =
	print_tree o parse_file slrp'gen_parser;
=TEX
\end{Fig}
=TEX

\Hide{
=SML
 ae_parser1 "usr032a.grm.tst";
=TEX
}

\clearpage
\section{A Lexical Analyser}\label{LexAnCode}

The Standard ML code in the figures in this section implements the lexical analyser
for the language of arithmetic expressions as discussed in section~\ref{LEXAN} above.

\begin{Fig}{h}{Constructing Lexical Values}{lex.values}
=SML
type AE_LEX_VALUE = LEX_CLASS LEX_VALUE;
type AE_LEX_STATE = LEX_CLASS LEX_STATE;
fun lv_identifier (s : string) : AE_LEX_VALUE = (
	(LCIdentifier "identifier", (s, get_line_number()))
);
fun lv_literal (s : string) : AE_LEX_VALUE = (
	(LCIdentifier "literal", (s, get_line_number()))
);
fun lv_punctuation c = (LCString c, (c, get_line_number()));
val lv_left_bracket : AE_LEX_VALUE = lv_punctuation "(";
val lv_right_bracket : LEX_CLASS LEX_VALUE = lv_punctuation ")";
val lv_times : AE_LEX_VALUE = lv_punctuation "*";
val lv_plus : AE_LEX_VALUE = lv_punctuation "+";
val lv_minus : AE_LEX_VALUE = lv_punctuation "-";
val lv_over : AE_LEX_VALUE = lv_punctuation "/";
val lv_equals : AE_LEX_VALUE = lv_punctuation "=";
val lv_semicolon : AE_LEX_VALUE = (LCEos, (";", get_line_number()));
val lv_end_of_input : AE_LEX_VALUE =
	(LCEos, ("<end-of-input>", get_line_number()));
=TEX
\end{Fig}


\begin{Fig}{htp}{Recognising Punctuation Symbols}{lex.punctuation}
=SML
fun rec_punctuation (("(" :: more, _)  : AE_LEX_STATE)
	: AE_LEX_STATE
	= (more, Known  lv_left_bracket)
|   rec_punctuation ( ")" :: more, _ ) = (more, Known lv_right_bracket)
|   rec_punctuation ( "*" :: more, _ ) = (more, Known lv_times)
|   rec_punctuation ( "+" :: more, _ ) = (more, Known lv_plus)
|   rec_punctuation ( "-" :: more, _ ) = (more, Known lv_minus)
|   rec_punctuation ( "/" :: more, _ ) = (more, Known lv_over)
|   rec_punctuation ( ";" :: more, _ ) = (more, Known lv_semicolon)
|   rec_punctuation ( "=" :: more, _ ) = (more, Known lv_equals)
|   rec_punctuation ( "#" :: _, _ ) = ([], Comment)
|   rec_punctuation (chs, _) = (chs, Unknown);
=TEX
\end{Fig}


\begin{Fig}{htp}{Recognising an Identifier}{lex.identifier}
=SML
fun is_alph_or_us ch = (
		"a" <= ch andalso ch <= "z"
	orelse	"A" <= ch andalso ch <= "Z"
	orelse	ch = "_"
);
fun is_digit ch = "0" <= ch andalso ch <= "9";
val is_alnum = is_alph_or_us fun_or is_digit;
fun rec_identifier (([], _) : AE_LEX_STATE) : AE_LEX_STATE = (
	([], Unknown)
) | rec_identifier (chs as (ch :: more), _) = (
	let	fun aux acc [] = (implode (rev acc), [])
		|   aux acc (cs as (c::more)) = (
			if	is_alnum c
			then	aux (c::acc) more
			else	(implode(rev acc), cs)
		);
	in	if	is_alph_or_us ch
		then	let	val (name, rest) = aux [ch] more;
			in	(rest, Known (lv_identifier name))
			end
		else	(chs, Unknown)
	end
);
=TEX
\end{Fig}

\begin{Fig}{htp}{Recognising a Literal}{lex.literal}
=SML
fun rec_literal (([], _) : AE_LEX_STATE)
	: AE_LEX_STATE = ([], Unknown)
|   rec_literal (chs as (ch :: more), _) = (
	let	fun aux acc [] = (implode (rev acc), [])
		|   aux acc (cs as (c::more)) = (
			if	is_digit c
			then	aux (c::acc) more
			else	(implode(rev acc), cs)
		);
	in	if	is_digit ch
		then	let	val (digits, rest) = aux [ch] more;
			in	(rest, Known (lv_literal digits))
			end
		else	(chs, Unknown)
	end
);
=TEX
\end{Fig}

\begin{Fig}{htp}{Dealing with Lexical Errors}{lex.unknown}
=SML
fun rec_unknown (( ch :: more, _ ) : AE_LEX_STATE)
	: AE_LEX_STATE = (
	output(std_out, "Unrecognised input character \"" ^ ch ^ "\"\n");
	(more, Comment)
) | rec_unknown ([], _) = ([], Unknown);
=TEX
\end{Fig}

\begin{Fig}{htp}{Constructing the Reader}{lex.reader}
=SML
val rec_token : AE_LEX_STATE -> AE_LEX_STATE =
	rec_first[rec_punctuation, rec_identifier, rec_literal, rec_unknown];
val reader_state : (string list * bool) ref = ref ([], true);
fun reader (strm : IN_CHAR_STREAM)
	: (AE_LEX_VALUE, string list * bool) READER = (
	let	val do_read = gen_reader LCEos rec_token strm
	in	fn state =>
		let	val (tok, state') = do_read state;
		in	reader_state := state';
			(tok, state')
		end
	end
);
=TEX
\end{Fig}

\begin{Fig}{htp}{Constructing the Parser}{lex.parser}
=SML
use"usr032a.grm.sml";
fun ae_parser2
	(text : string)  : unit -> LEX_CLASS GEN_PARSE_TREE = (
	let	val strm as {close, ...} = in_char_stream_of_string text;
		val do_parse =
			slrp'gen_parser
			default_resolver
			classifier
			(default_error string_of_lex_value)
			(reader strm);
		val _ = reader_state := ([], true);
	in	fn () => do_parse (!reader_state)
		handle ex => (
			close();
			raise ex
		)
	end	
);
=TEX
\end{Fig}

\clearpage
\section{Adding Actions}\label{ActionCode}

The Standard ML code in this section implements the reduction functions
that support the action grammar shown in figure~\ref{usr032b.grm.txt} in
section~\ref{ACTIONS} above.

\begin{Fig}{h}{The Reduction Functions for Commands}{actions.commands}
=SML
val named_numbers : int S_DICT ref = ref [];
fun red_command1 (Parsed i) = (
	named_numbers := s_enter "it" i (!named_numbers);
	output(std_out, "it = " ^ string_of_int i ^ "\n");
	i
);
fun red_command2 (Token ((_, (s, _)), _)) (Parsed i) = (
	named_numbers := s_enter s i (!named_numbers);
	output(std_out, s ^ " = " ^ string_of_int i ^ "\n");
	i
);
=TEX
\end{Fig}


\begin{Fig}{htp}{The Reduction Functions for Expressions I}{actions.expressions1}
=SML
fun red_accept (Parsed i) = i;
val red_expression = red_accept;
fun red_atom1 (Token ((_, (s, _)), _)) = nat_of_string s;
fun red_atom2 (Token ((_, (s, _)), _)) = (
	case s_lookup s (!named_numbers) of
		Value i => i
	|	Nil => (
		output(std_out, "Undefined name \"" ^ s ^ "\"\n");
		raise SYNTAX_ERROR
	)
);		
=TEX
\end{Fig}


\begin{Fig}{htp}{The Reduction Functions for Expressions II}{actions.expressions2}
=SML
val red_atom3 = red_accept;
val red_application1 = red_accept;
fun red_application2 (Parsed i) =  ~i;
val red_application3 = red_accept;
fun red_application4 (Token((_, (s, _)), _)) (Parsed i) = (
	case s of
		"abs" => if i < 0 then ~i else i
	|	"sgn" => if i > 0 then 1 else if i = 0 then 0 else ~1
	|	_ => (
		output(std_out, "Unsupported function \"" ^ s ^ "\"\n");
		raise SYNTAX_ERROR
	)
);
=TEX
\end{Fig}

\begin{Fig}{htp}{The Reduction Functions for Expressions III }{actions.expressions3}
=SML
val red_product1 = red_accept;
fun red_product2 (Parsed i) (Parsed j) = i * j;
fun red_product3 (Parsed i) (Parsed j) = i div j handle Div => (
	output(std_out, "Zero divisor\n");
	raise SYNTAX_ERROR
);
val red_sum1 = red_accept;
fun red_sum2 (Parsed i) (Parsed j) = i + j;
fun red_sum3 (Parsed i) (Parsed j) = i - j;
=TEX
\end{Fig}

\begin{Fig}{htp}{Constructing the Parser}{actions.parser}
=SML
use"usr032b.grm.sml";
fun ae_parser3
	(instrm : instream)  : unit = (
	let	val strm as {close, ...} = in_char_stream_of_instream instrm;
		val do_parse =
			slrp'gen_parser
			default_resolver
			classifier
			(default_error string_of_lex_value)
			(reader strm);
		val _ = reader_state := ([], true);
	in	while case !reader_state of ([], false) => false | _ => true do
			(do_parse (!reader_state); ())
			handle SYNTAX_ERROR =>  (
				(if	not (ExtendedIO.is_term_in instrm)
				then	(close(); raise SYNTAX_ERROR)
				else	())
			)
	end
);
=TEX
\end{Fig}



\clearpage
\section{Operator Precedence Conflict Resolution}\label{OperatorPrecedenceCode}

\begin{Fig}{htp}{The Operator Precedence Parser}{operator.precedence.parser}
=SML
use"usr032f.grm.sml";
fun	precedence (((_, (stk_val, _)), _) , ((_, (la_val, _)), _))  = (
	let	fun num_prec "*" = 2
		|   num_prec "/" = 2
		|   num_prec _ = 1;
		val stk_prec = num_prec stk_val;
		val la_prec = num_prec  la_val;
	in	if	stk_prec <  la_prec
		then	DoShift
		else	DoReduce
	end
);


fun ae_parser4
	(text : string)  : unit -> LEX_CLASS GEN_PARSE_TREE = (
	let	val strm as {close, ...} = in_char_stream_of_string text;
		val do_parse =
			slrp'gen_parser
			(simple_resolver precedence)
			classifier
			(default_error string_of_lex_value)
			(reader strm);
		val _ = reader_state := ([], true);
	in	fn () => do_parse (!reader_state)
		handle ex => (
			close();
			raise ex
		)
	end	
);
=TEX
\end{Fig}
=TEX

\clearpage

\section{Error Handling}\label{ErrorHandlingCode}

\begin{Fig}{htp}{A Simple Extension to the Default Error Routine}{errors1.parser}
=SML
use"usr032b.grm.sml";
fun ae_error_reporter (tok, is, ss as (s::_), rs) = (
	let	val lcs =map (string_of_lex_class o fst)
			(PPArray.sub(slrp'actions, s));
		val location = case is of [] => "here"
		|	_ =>  "after  " ^ format_stack string_of_lex_value is
		val sorted_lcs = Sort.sort Sort.string_order lcs;
		val msg1 = "*** Error in arithmetic expression:\n";
		val msg2 = string_of_lex_value tok ^
			" is not expected "  ^ location ^ "\n";
		val msg3 = "Expected " ^
			format_list (fn x => x) sorted_lcs ", " ^ ", ...\n";
	in	output(std_out, msg1 ^ msg2 ^ msg3)
	end
);
fun ae_error_handler5 tok_is_ss_rs =
	(ae_error_reporter tok_is_ss_rs; raise SYNTAX_ERROR);
fun ae_parser5
	(instrm : instream)  : unit = (
	let	val strm as {close, ...} = in_char_stream_of_instream instrm;
		val do_parse = slrp'gen_parser default_resolver
			classifier ae_error_handler5 (reader strm);
		val _ = reader_state := ([], true);
	in	while case !reader_state of ([], false) => false | _ => true do
			(do_parse (!reader_state); ())
			handle SYNTAX_ERROR =>
				(if	not (ExtendedIO.is_term_in instrm)
				then	(close(); raise SYNTAX_ERROR)
				else	())
	end
);
=TEX
\end{Fig}

\clearpage

\begin{Fig}{htp}{A Simple Error Recovery Scheme}{errors2.parser}
=SML
use"usr032b.grm.sml";
exception DONE;
fun ae_error_handler6 rdr = (fn (tok, is, ss, rs) =>
	let	val _ = ae_error_reporter (tok, is, ss, rs);
		val n = length is;
		fun is_eos (LCEos, _) = true | is_eos _ = false;
		val ref_tok : AE_LEX_VALUE ref = ref tok;
	in	(while	not(is_eos(!ref_tok))
		andalso	case !reader_state of ([], false) => false | _ => true
		do	let	val (t, s) = rdr (!reader_state);
			in	ref_tok := t
			end);
		case !reader_state of
			([], false) =>  raise DONE
		|	_ =>
			let	val (t, s) = rdr (!reader_state);
			in	(t, s, n)
			end
	end
);
fun ae_parser6
	(instrm : instream)  : unit = (
	let	val strm as {close, ...} = in_char_stream_of_instream instrm;
		val rdr = reader strm;
		val do_parse =
			slrp'gen_parser
			default_resolver
			classifier
			(ae_error_handler6 rdr)
			(reader strm);
		val _ = reader_state := ([], true);
	in	(while case !reader_state of ([], false) => false | _ => true do
			(do_parse (!reader_state); ())
			handle SYNTAX_ERROR =>  (
				(if	not (ExtendedIO.is_term_in instrm)
				then	(close(); raise SYNTAX_ERROR)
				else	())
			)) handle DONE => output(std_out, "\nBye!\n")
	end
);
=TEX
\end{Fig}

\clearpage
\chapter{COMMAND LINE INTERFACE}\label{COMMAND}
{\def\subsection#1{\section{#1}}
\raggedbottom
\input{dtd017b.tex}
} %\def

\newpage
\chapter{SLRP INPUT FORMAT}\label{INPUTFORMAT}

{\raggedbottom
\input{dtd017a.tex}
} %\raggedbottom


\newpage
\chapter{STANDARD ML  LIBRARY}\label{LIBRARY}

The parser driver API and the generic parser API are implemented using
a library of data types and functions borrowed from the {\ProductHOL}
system.  This is described in detail in chapter~2 of the {\ProductHOL}
reference manual~\cite{LEMMA1/HOL/USR029}.

In fact, the parser driver function and the data types that it needs
only depend on one data type from the library: the type {\it E\_DICT} of efficient string indexed
dictionaries.  If only the parser driver function is required,
it is be straightforward to compile the parser
driver function given a suitable implementation of this data type only.
This allows a parser generated by {\SLRP} to be integrated at
source level without having to import the {\ProductHOL} library.

\newpage
\chapter{PARSER DRIVER API}\label{DRIVERAPI}
This section contains the reference documentation for the parser driver API.
It includes the Standard ML signature to which the API conforms together
with brief narrative descriptions of the types and values defined in the signature.
An index to the APIs described in this document may be found at the end of this document.

{\raggedbottom
\input{dtd018a.tex}
} %\raggedbottom

\vfill

\newpage
\chapter{GENERIC PARSER API}\label{GENERICPARSERAPI}
This section contains the reference documentation for the generic parser API.
It includes the Standard ML signature to which the API conforms together
with brief narrative descriptions of the types and values defined in the signature.
An index to the APIs described in this document may be found at the end of this document.

{\raggedbottom
\input{dtd118a.tex}
} %\raggedbottom

\vfill

\chapter*{REFERENCES}\label{REFERENCES}
\addcontentsline{toc}{chapter}{REFERENCES}

\bibliographystyle{fmu}

\bibliography{fmu}

\vfill

\pagebreak
\twocolumn
\chapter*{INDEX}
\addcontentsline{toc}{chapter}{INDEX}
\small

\printindex

\Hide{
=SH
sed -e '/^Application/,/;/d' < usr032b.grm.txt >> usr032e.grm.txt
slrp -g -l  4 -f  usr032d.grm.txt >usr032d.grm.run 2>&1
for c in b e f g h i j
do
	slrp -g -l 2 -f  usr032$c.grm.txt >usr032$c.grm.run 2>&1
done
=TEX
} %\Hide

\end{document}


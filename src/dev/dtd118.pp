=IGN
********************************************************************************
dtd118.doc: this file is part of the PPDev system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
=TEX
%%%%% YOU MAY WANT TO CHANGE POINT SIZE IN THE FOLLOWING:
\documentclass[a4paper,12pt]{article}

%%%%% YOU CAN ADD OTHER PACKAGES AS NEEDED BELOW:
\usepackage{A4}
\usepackage{Lemma1}
\usepackage{ProofPower}
\usepackage{epsf}
\makeindex
\def\Slrp{{\bf SLRP}}
\def\Hide#1{\relax}

%%%%% YOU WILL USUALLY WANT TO CHANGE THE FOLLOWING TO SUIT YOU AND YOUR DOCUMENT:

\def\Title{ Generic SLRP Parser: Detailed Design }

\def\Abstract{\begin{center}
{\bf Abstract}\par
{The detailed design of a generic SLRP parser.}
\end{center}}

\def\Reference{DS/FMU/IED/DTD118}

\def\Author{R.D. Arthan}

\def\EMail{{\tt rda@lemma-one.com}}

\def\Phone{+44 118 958 4409}

\def\Fax{+44 118 956 1920}

%%%%% YOU MAY WANT TO CHANGE THE FOLLOWING TO GET A NICE FRONT PAGE:
\def\FrontPageTitle{ {\huge \Title } }
\def\FrontPageHeader{\raisebox{16ex}{\begin{tabular}[t]{c}
\bf Copyright \copyright\ : Lemma 1 Ltd \number\year\\\strut\\
\end{tabular}}}

%%%%% THE FOLLOWING DEFAULTS WILL GENERALLY BE RIGHT:

\def\Version{$Revision: 1.9 $%
}
\def\Date{\FormatDate{$Date: 2003/03/20 16:20:12 $%
}}

%%%%% NOW BEGIN THE DOCUMENT AND MAKE THE FRONT PAGE

\begin{document}
\headsep=0mm
\FrontPage
\headsep=10mm

%%%%% STANDARD RED-TAPE SECTIONS (MAY WANT TO INTERLEAVE SOME \newpage COMMANDS IN THESE)

%%%%% CONTENTS:

\subsection{Contents}

\tableofcontents

%%%%% REFERENCES:

\subsection{References}

\bibliographystyle{fmu}

%%%%% CHANGE THE FOLLOWING AS NECESSARY (E.G., TO PICK UP daz.bib):
{\raggedright
\bibliography{fmu}
}
%%%%% CHANGES HISTORY:
\subsection{Changes History}
\begin{description}

\item[Issues 1.1 (2003/02/26) to 1.4 (2003/02/28) ] First drafts.
\item[ Issue 1.5 (2003/03/05) ] Improved representation of {\it LEX\_VALUE}.
\item[ Issue 1.6 (2003/03/06) ] Tidied document formatting.
\item[ Issue 1.7 (2003/03/07) ] Better interface for tree printing.
\item[ Issue 1.8 (2003/03/07) ] More polymorphic generic  parser interface.
\item[ Issue 1.9 (2003/03/20) ] Reorganised documentation to support extracts for USR032.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

%%%% END OF CHANGES HISTORY %%%%
\end{description}

%%%%%  CHANGES FORECAST:

\subsection{Changes Forecast}

None.

%%%%% DISTRIBUTION LIST

\subsection{Distribution}
\begin{center}
\begin{tabular}{ll}
{\Product} Development Library & Lemma 1\\
\end{tabular}
\end{center}
\newpage
\section{GENERAL}
\subsection{Scope}
This document contains the detailed design for a generic {\Slrp} parser.
This is intended to be useful both for testing {\Slrp} and as a service to {\Slrp} users.

\subsection{Introduction}
By running {\Slrp} with the {\it -g} option on a grammar which omits
reduction actions, {\Slrp} will automatically generate
the missing reduction code for you. All being well, if you then rename the output file
from {\Slrp} as ``grammar.sml'' and then  compile the code whose is given
in this document, the result will be a full working parser for your grammar.

The input to the resulting generic {\Slrp} parser is text
comprising a sequence of terminal symbols in the
same format as was used in the {\Slrp} grammar. For example, the following is an acceptable
input to the C grammar that may be found in {\tt mdt018.grm.tgz} and which uses {\Slrp}
identifiers for general character classes such as {\it identifier} and {\it typedef\_name} and
quoted strings for specific non-terminals like punctuation symbols and the names of
built-in types.

=GFT Terminal symbols for a C function
`int` identifier `(` `)`
`{`
	typedef_name identifier `=` CONSTANT `;`
	identifier `=` identifier `+` identifier`;`
	`return` identifier`;`
`}`
=TEX
The result of parsing the above with the generic {\Slrp} parser is a parse tree. Here is a print-out
of the last few lines of the parse tree (the dotted lists of numbers at the beginning of each
line are tree node addresses; the numbers in brackets are line numbers):

=GFT
...
1.1.1.3.1: compound_statement = `{`(2), declaration_list, statement_list, `}`(6);
1.1.1.3: function_body = compound_statement;
1.1.1: function_definition = declaration_specifiers, declarator, function_body;
1.1: external_definition = function_definition;
1: translation_unit = external_definition;
=TEX

Of course, the functionality of the generic {\Slrp} parser is almost certainly not what you
actually want. The idea is that the generic {\Slrp} parser will give you a framework for getting started with
constructing a parser and you can then adapt the generic code to meet your specific requirements.

The implementation of the generic {\Slrp} parser is given in \cite{LEMMA1/HOL/IMP118}. It contains
a ``front-end'' comprising a lexical analyser for the language of {\Slrp} terminal symbols
and a ``back-end'' comprising functions to support
the reduction actions that {\Slrp} generates when called with the {\it -g} option by building
and printing a parse tree. The intention is that you take a copy of the implementation and
mutate it to make it provide the functionality you actually need.

The lexical analyser is implemented as a set of recogniser functions that deal with an input line
represented as a list of characters supported by boiler-plate code for reading from a multi-line
input stream and for handling problems such as lexical values like comments and strings which
spread over several lines. Many useful parsers can readily be implemented just by
reworking the code of the line-at-a-time recogniser functions and re-using the boiler-plate code.

The reduction actions generated by {\Slrp} are very simple: they all just call a single function
{\it generic\_reducer} which collects together the subtrees produced by an instance of
a grammar rule to make the children of a new, suitably labelled, parse tree node. You may either use
them as they stand and write your own functions to traverse the generic parse tree and
take whatever action is appropriate (e.g., to build a more abstract parse tree), or,
and this is more likely,  you can replace the calls to {\it generic\_reducer} with calls to
functions that you write that carry out the desired semantic actions.

If you develop your own action code, then we recommend that you put your new reduction functions in
a separate file and copy the appropriate action code into your grammar.  {\Slrp}
only generates the generic reduction actions for grammar productions which do not
already contain action code, so, in this way, you can safely mix the generic actions with specific ones
of your own devising.


%\subsection{Purpose and Background}
%See \cite{DS/FMU/IED/HLD013}.

\subsection{Dependencies}
The design is dependent on \cite{DS/FMU/IED/IMP018} for the data types
used.

\subsection{Possible Enhancements}
A lexical analyser generator?

%\subsection{Deficiencies}


\pagebreak
\section{ML INTERFACE}\label{MLINTERFACE}
=SML
structure SlrpDriver : SlrpDriver = SlrpDriver;
=DOC
signature ⦏GenericSlrpParser⦎ = sig
include SlrpDriver;
=DESCRIBE
This is the signature of a structure containing the generic {\Slrp} parser API.
=ENDDOC

=DOC
datatype ⦏LEX_CLASS⦎ =
		⦏LCIdentifier⦎ of string
	|	⦏LCString⦎ of string
	|	⦏LCEos⦎;
type 'lc ⦏LEX_VALUE⦎ = 'lc * (string * int);
val ⦏classifier⦎ : ('lc LEX_VALUE,  'lc) CLASSIFIER;
val ⦏string_of_lex_class⦎ : LEX_CLASS -> string;
val ⦏string_of_lex_value⦎ : LEX_CLASS LEX_VALUE -> string;
val ⦏line_number_of_lex_value⦎ : 'lc LEX_VALUE -> int;
=DESCRIBE
The types are the types of lexical classes ($'lc$ in the parser driver API)  and
of lexical values ($'tok$ in the parser driver API) for the generic {\Slrp} parser.
{\it classifier} is the CLASSIFIER function that maps the latter onto the former.
The integers in the lexical values are source line numbers.
The function {\it string\_of\_lex\_value} returns a textual representation of a lexical
value and is what is used as the parameter to the generic ERROR ROUTINE
function {\it default\_error} in the parser.
{\it line\_number\_of\_lex\_value} returns what its name suggests.
=ENDDOC
=DOC
exception ⦏LexFail⦎ of int * string;
datatype ⦏CONTINUATION_STATUS⦎ =
		⦏InComment⦎
	|	⦏InString⦎ of string list;
datatype 'lc ⦏LEX_STATUS⦎ =
		⦏Unknown⦎
	|	⦏Known⦎ of 'lc LEX_VALUE
	|	⦏Comment⦎
	|	⦏Continuation⦎ of int * CONTINUATION_STATUS;
type 'lc ⦏LEX_STATE⦎ = (string list * 'lc LEX_STATUS);
val ⦏rec_first⦎  :
	('lc LEX_STATE -> 'lc LEX_STATE) list ->
	'lc LEX_STATE -> 'lc LEX_STATE;
val ⦏get_line_number⦎ : unit -> int;
=DESCRIBE
These types etc. are used to construct the line-at-a-time part of the lexical analyser
for the generic {\Slrp} parser. In conjunction with the function {\it gen\_reader}, q.v., they
may be used to construct lexical analysers for an actual language rather than for the {\Slrp}
representation of its terminal symbols.
=ENDDOC

=DOC
type ⦏IN_CHAR_STREAM⦎;
val ⦏in_char_stream_of_instream⦎ : instream -> IN_CHAR_STREAM;
val ⦏in_char_stream_of_file⦎ : string -> IN_CHAR_STREAM;
val ⦏in_char_stream_of_string⦎ : string -> IN_CHAR_STREAM;
val ⦏gen_reader⦎  : 'lc ->
	('lc LEX_STATE -> 'lc LEX_STATE) ->IN_CHAR_STREAM ->
	 ('lc LEX_VALUE, string list * bool) READER;
val ⦏reader⦎  : IN_CHAR_STREAM ->
	 (LEX_CLASS LEX_VALUE, string list * bool) READER;
=DESCRIBE
This type and associated functions provide the READER function that the parsing function
generated by {\Slrp} uses to read a sequence of lexical tokens.
=ENDDOC
=DOC
type 'lc ⦏SLRP_GEN_PARSER⦎;
datatype 'lc ⦏GEN_PARSE_TREE⦎ =
		⦏Leaf⦎ of 'lc LEX_VALUE
	|	⦏Node⦎ of (string * int) * 'lc GEN_PARSE_TREE list;
val ⦏generic_reducer⦎  : string * int ->
	('lc LEX_VALUE, 'lc, 'lc GEN_PARSE_TREE)
		INPUT_STACK_ITEM list ->
	('lc LEX_VALUE, 'lc, 'lc GEN_PARSE_TREE)
		INPUT_STACK_ITEM list ->
	'lc GEN_PARSE_TREE;
val ⦏output_tree⦎ : ('lc LEX_VALUE -> string) -> (string -> unit) ->
	'lc GEN_PARSE_TREE -> unit;
val ⦏print_tree⦎ : LEX_CLASS GEN_PARSE_TREE -> unit;
val ⦏parse_file⦎ : LEX_CLASS SLRP_GEN_PARSER -> string ->
	LEX_CLASS GEN_PARSE_TREE;
val ⦏parse_string⦎ : LEX_CLASS SLRP_GEN_PARSER -> string ->
	LEX_CLASS GEN_PARSE_TREE;
=DESCRIBE
The type {\it SLRP\_GEN\_PARSER} is the instance of the type of the parser function
{\it slrp'gen\_parse} generated by {\Slrp}.

The remaining type and associated functions support the generic action functions generated by
{\Slrp} when called with the {\it -g} option and implement the resulting parser.
When used with the supplied code for {\it generic\_reducer}, the parser will compute a value of type
{\it GEN\_PARSE\_TREE}.   {\it print\_tree} and {output\_tree} may be used to print out a textual
representation of such a value .

{\it parse\_file\ name} attempts to parse sequence of lexical tokens represented in the named file.
{\it parse\_string string} does the same job for a sequence of tokens given in an ML string.
The lexical format for the token sequences is the same as that used in the {\Slrp} grammar.
I.e., they are either ML-style alphanumeric identifiers or arbitrary strings given in back-quotes.
ML-style comments are allowed and ignored.
=ENDDOC

=DOC
end; (* of signature GenericSlrpParser *)
=ENDDOC
=TEX
\section{TEST POLICY}
The code has been tested using LALR(1) grammars for C, Pascal, Java 1.1 and Ada 95.

\section{INDEX}
\small
\printindex

\end{document}
=IGN
GenericSlrpParser.print_tree (curry output std_out) (GenericSlrpParser.parse_file"eg.c");




=IGN
********************************************************************************
imp031.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% imp031.doc   ℤ $Date: 2004/08/24 16:03:28 $ $Revision: 2.17 $ $RCSfile: imp031.doc,v $

=TEX
%%%%% YOU MAY WANT TO CHANGE POINT SIZE IN THE FOLLOWING:
\documentclass[a4paper,11pt]{article}

%%%%% YOU CAN ADD OTHER PACKAGES AS NEEDED BELOW:
\usepackage{A4}
\usepackage{Lemma1}
\usepackage{ProofPower}
\usepackage{latexsym}
\usepackage{epsf}
\makeindex

%%%%% YOU WILL WANT TO CHANGE THE FOLLOWING TO SUIT YOU AND YOUR DOCUMENT:

\def\Title{Implementation of Pretty Printer Support Structure}

\def\AbstractText{This document contains declarations for the supporting the ICL HOL pretty printer. They form a framework for pretty printing terms and are used to declare and install printing functions for the concrete syntaxes of the languages supported by or added into ICL HOL.}

\def\Reference{DS/FMU/IED/IMP031}

\def\Author{A.J. Hammon}


\def\EMail{C/O {\tt rda@lemma-one.com}}

\def\Phone{C/O +44 7497 030682}

\def\Abstract{\begin{center}{\bf Abstract}\par\parbox{0.7\hsize}
{\small \AbstractText}
\end{center}}

%%%%% YOU MAY WANT TO CHANGE THE FOLLOWING TO GET A NICE FRONT PAGE:
\def\FrontPageTitle{ {\huge \Title } }
\def\FrontPageHeader{\raisebox{16ex}{\begin{tabular}[t]{c}
\bf Copyright \copyright\ : Lemma 1 Ltd \number\year\\\strut\\
\end{tabular}}}

%%%%% THE FOLLOWING DEFAULTS WILL GENERALLY BE RIGHT:

\def\Version{\VCVersion}
\def\Date{\FormatDate{\VCDate}}

%% LaTeX2e port: =TEX
%% LaTeX2e port: % imp031.doc   ℤ $Date: 2004/08/24 16:03:28 $ $Revision: 2.17 $ $RCSfile: imp031.doc,v $
%% LaTeX2e port: \documentstyle[hol1,11pt,TQ]{article}
%% LaTeX2e port: 
%% LaTeX2e port: \TPPtitle{Implementation of Pretty Printer Support Structure}
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP031}
%% LaTeX2e port: \def\SCCSissue{$Revision: 2.17 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSissue}
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2004/08/24 16:03:28 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPproject{FST PROJECT}
%% LaTeX2e port: 
%% LaTeX2e port: =IGN
%% LaTeX2e port: 
%% LaTeX2e port: Commands to process this document in various ways.
%% LaTeX2e port: 
%% LaTeX2e port: make -f rel001.mkf imp031.dvi
%% LaTeX2e port: doctex imp031
%% LaTeX2e port: texdvi imp031
%% LaTeX2e port: bibtex imp031
%% LaTeX2e port: doctex imp031 ; texdvi imp031
%% LaTeX2e port: doctex imp031 ; texdvi imp031 ; bibtex imp031
%% LaTeX2e port: dvipage imp031 &
%% LaTeX2e port: 
%% LaTeX2e port: docsml imp031
%% LaTeX2e port: use_file "imp031.sml";
%% LaTeX2e port: 
%% LaTeX2e port: lasp -s imp031.doc > zz1
%% LaTeX2e port: lasp -s -u imp031.OKwords imp031.doc > zz1
%% LaTeX2e port: 
%% LaTeX2e port: =TEX
%% LaTeX2e port: %\TPPstatus{Approved}
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{A.J. Hammon & WIN01}  %% Mandatory field
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document contains declarations for the supporting the
%% LaTeX2e port: 	ICL~HOL pretty printer.  They form a framework for pretty
%% LaTeX2e port: 	printing terms and are used to declare and install printing
%% LaTeX2e port: 	functions for the concrete syntaxes of the languages supported
%% LaTeX2e port: 	by or added into ICL~HOL.}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	Library
%% LaTeX2e port: }}
%% LaTeX2e port: 
%% LaTeX2e port: %\ftlinepenalty=9999
%% LaTeX2e port: \makeindex
%% LaTeX2e port: 
%% LaTeX2e port: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LaTeX2e port: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LaTeX2e port: 
\catcode`\_=\active
\def\_{\kern.06em\vbox{\hrule height.1ex width.3em}\hskip0.1em\relax}
%% LaTeX2e port: 
%% LaTeX2e port: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LaTeX2e port: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LaTeX2e port: 
%% LaTeX2e port: \begin{document}
%% LaTeX2e port: \makeTPPfrontpage
%% LaTeX2e port: 
%% LaTeX2e port: \vfill
%% LaTeX2e port: \begin{center}
%% LaTeX2e port: \bf Copyright \copyright\ : Lemma 1 Ltd. \number\year
%% LaTeX2e port: \end{center}

\begin{document}

\headsep=0mm
\FrontPage
\headsep=10mm

\setcounter{section}{-1}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
\section{DOCUMENT CONTROL}

%********************************************************************

\subsection{Contents List}
\tableofcontents
% \listoftables

%********************************************************************

\subsection{Document Cross References}

\bibliographystyle{fmu}
\bibliography{fmu}

%********************************************************************

\subsection{Changes History}

\begin{description}

\item[Issues 1.1 (1991/07/10) to 1.10 (1991/09/11) ] Initial drafts.

\item[\FormatDate{91/09/12}, issue 2.1 ] First Approved version.

\item[Issue 2.2 (1992/01/20), \FormatDate{92/01/20} ] Updated to use new fonts.

\item [Issue 2.3 (1992/04/14) (13th April 1992)]
Changes due to CR0017.
\item [Issue 2.4 (1992/05/13)] Updates for SML'97.

\item[Issue 2.5]
	Add $pe_depth$ field to type $PP_ENV$ plus routines to support it.
	Change characters used for language changes.
	Let all printing functions in $PP_ENV$ have an answer but
	make sure that the HOL printers only return the
		success value.
	Allow enabling and disabling of printing function.
	Add $set_start_quote$ and $get_start_quote$ functions.
	Add $\ldots _show_index$ function and flag.
	Improve alias handling.
\item[Issue 2.14 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 2.15 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 2.16 (2004/07/09)] Alias handling moved to IMP032, where it belongs (as part of the HOL language not the generic interface).
\item[Issue 2.17 (2004/08/24)] New data types for operator precedence to support left-associative operators properly.
\item[Issue 2.18 (2005/05/07)] HOL now supports left-associative operators.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}

%********************************************************************

%\subsection{Changes Forecast} \label{ChangesForecast}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
\section{GENERAL}

%********************************************************************

\subsection{Scope}

This document contains type declarations and the primitive pretty
printing routines for Release~1 of the ICL HOL system which are
specified in the detailed design~\cite{DS/FMU/IED/DTD031}.  These
declarations and routines provide the hooks for adding printing
routines for specific languages.


%********************************************************************

\subsection{Introduction}

%********************************************************************

\subsubsection{Purpose and Background}

One goal of ICL HOL is to enable the embedding of other languages by
providing many tools which may be used or readily extended in their
support.  The pretty printer is one of these tools.  To this end the
pretty printer is split into a number of main components.

\begin{itemize}

\item Basic textual output routines that provide string output, line
	breaking, spacing and indentation are made available by the
	Oppen style printing routines in~\cite{DS/FMU/IED/IMP024}.  In
	the PolyML compiler the function $PolyML.install_pp$ provides
	the same interfaces and very similar functionality.

\item This document, which provides a framework for the printing of HOL
	terms.  One of the difficulties in producing an extensible
	pretty printer is the need to add new functions into a set of
	mutually recursive routines without needing to edit and
	recompile.  This framework provides the basic recursion
	handling plus a mechanism for adding new functions into the
	recursion.  (Adding is achieved by updating a Standard~ML
	mutable value.)

\item Language specific printing routines are placed in further
	documents, those for the HOL concrete syntax are
	in~\cite{DS/FMU/IED/IMP032}.

\item The general printing functions, for converting HOL terms into
	strings, are in the final component~\cite{DS/FMU/IED/IMP032}.
	The smallest useful (i.e., useable) pretty printer requires
	printing functions for at least the HOL language.  These also
	supply a HOL~type printer plus derived printers for (e.g.)
	theorems.

\end{itemize}

%********************************************************************

\subsubsection{Dependencies}

Basic output mechanisms are provided by the Oppen style printing
routines in~\cite{DS/FMU/IED/IMP024} and by the PolyML function
$PolyML.install_pp$.

To be of any use this primitive pretty printer requires language
specific printing functions to be installed.  For HOL they are
in~\cite{DS/FMU/IED/IMP032}.  If no printing functions can be found
an error message is produced.  Note that the dependency
upon~\cite{DS/FMU/IED/IMP032} is for achieving any useful
functionality, it is not needed for successful compilation.

The pretty printing facilities are installed into the PolyML system by
the final pretty printer document~\cite{DS/FMU/IED/IMP024}.  No working
pretty printer is available until them.

%********************************************************************

%\subsubsection{Interface}

%********************************************************************

\subsubsection{Algorithms}

The basic algorithm of pretty printing uses a recursive descent of the
tree that constitutes the HOL term or type to be printed.  The
traversal order is such that the tree may be printed by side effects of
the printing functions.

\begin{description}

%--------------------------------------------------------------------

\item{Bracket Elimination}

Bracket elimination is achieved during the recursive pass.  Each term
or type production in the concrete syntax construct is given a
precedence level, each position that a term or type may occur with the
syntax construct production is also given a precedence level.  Brackets
are output only when a comparison of these precedence levels shows that
they are needed.

%--------------------------------------------------------------------

\item{Language Embedding}

Terms are printed using the rules for a particular language.  HOL is
the first language.  Other languages, such as~Z, are to be embedded in
ICL~HOL.  Printing is always done in the context of a `current
language'.  When the pretty printer is initially entered with a term
its first task is to identify the language to be used.  If the
outermost structure of the term is that of a HOL constant applied to a
number of arguments then the language of that constant is chosen.  In
all other cases the HOL term language, with concrete syntax given
in~\cite{DS/FMU/IED/DEF001} is chosen.

If a constant whose language is not the current language is found then
the pretty printer produces text to indicate the quotation of one
language within text of another.

%--------------------------------------------------------------------

\item{Concrete Syntax Forms}

Printing the concrete syntax form of a HOL term involves finding
applications of HOL constants.  The language of a constant is used to
select a printing function, HOL is the default.  The task of this
function is to format the constant and its arguments in their concrete
form, it also passes information back to indicate whether it can print
the arguments.  Three cases are distinguished.  Firstly the function
could print the arguments, but too many provided.  Here the function
prints nothing, it returns a number indicating how many arguments it
could print.  Secondly the function cannot print the arguments at all,
the arguments do not correspond to a concrete syntax form handled by
the function.  Thirdly the function can print the arguments, in which
case it does so and returns a success indicator.

The body of the printing function breaks the term into pieces that
correspond to concrete syntax.  Printing is achieved by a sequence of
outputs of fixed strings, of spaces and of recursive calls of the main
pretty printing routine $main_term_pp$ for the pieces of the term.

\end{description}

%********************************************************************

\subsubsection{Possible Enhancements}

Avoid the repetitive examination of constants for (e.g.) HOL lists that
do not have $Nil$ as their tail.

Print out HOL types in a language dependent manner.  Possibly by
finding the language and a printing function for type constructors in a
similar manner to the way that HOL constants are handled.

When printing out HOL types (with the HOL concrete syntax) provide more
controls for selecting when types are printed.  A useful control would
produce the minimum amount of explicit typing that allows the text
produced for a term to be successfully read back into the system.

%********************************************************************

%\subsubsection{Deficiencies}

%********************************************************************

\subsubsection{Terminology}

\begin{description}

\item[Associativity ] When operators are combined to form expressions
	the evaluation order must be defined.  For example the
	expression `$1-2-3$' may be `$(1-2)-3$' which yields `$-4$' or
	it may be `$1-(2-3)$' which yields `$0$', the chosen order is
	known as the associativity of the operator.  Left associativity
	means grouped together on the left, or with brackets on the
	left.  Correspondingly, right associativity means grouped
	together on the right, or with brackets on the right.  Thus a
	left associative subtract gives `$1-2-3 = -4$' and a right
	associative subtract gives `$1-2-3 = 0$'.

%\item[Left Associativity ] See Associativity.
%\item[Right Associativity ] See Associativity.

\end{description}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\newpage
\section{PRETTY PRINTER SUPPORT STRUCTURE}

%********************************************************************

\subsection{Prelude}

=SML
structure ⦏PrettyPrinterSupport⦎ : PrettyPrinterSupport = struct
=TEX

=SML
open OppenFormatting;
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
\section{BRACKET REDUCTION}

Bracket reduction (bracket elimination) uses a scheme based upon
precedence levels which are determined from the concrete syntax of the
languages being printed.  The discussion and examples of bracket
reduction are centered on HOL, since that is the primary language of
Release~1.  The mechanisms used are believed to be compatible with
other languages.

%********************************************************************

\subsection{Mechanism}

Each production in the concrete syntax construct for a HOL type or term
is given a precedence level, each position where a term or type may
occur with the syntax construct production is also given a precedence
level.  Brackets are output only when a comparison of these precedence
levels shows that brackets are needed.  The precedence levels are
chosen so that most of the unnecessary brackets are eliminated.  The
word `most' is correct in the previous sentence, brackets are inserted
in a small number of cases where, strictly speaking, they are not
necessary.  This is done partly to present output which the author
believes is easier to read and partly because a much more complex
algorithm would be needed to determine when some brackets were
unnecessary.

An example of a case which requires a complex algorithm to determine
whether brackets are necessary.  All but one pair of brackets may be
removed from the following HOL term, it does not matter which pair are
retained.  If the binder term were replaced with a variable then all of
the brackets may be removed.  The distinction may only be found when
the binder is recognised.  Note that the operator `$\land$' binds more
tightly than the `$=$' in this term.

=GFT HOL example
	⌜ (a ∧ (b ∧ (c ∧ (d ∧ (e ∧ (∀ f ⦁ g)))))) = h ⌝
=TEX

The problem comes from the HOL syntax rule that binder terms extend as
far to the right as possible.  Similar problems occur with `{\tt if}'
and `{\tt let}' terms.  The solution adopted is to set the precedences
so that binder terms (also `{\tt if}' and `{\tt let}' terms, for the
same reason) are always bracketed when used as arguments to infix
operators.

Bracket reduction is merged into the recursive pass over the term by
each printing routine having the enclosing precedence level as one of
its input parameters.  A called routine, knowing the precedence of the
concrete syntax production to be printed, compares the two
precedences.

Precedence levels are ordered in the same way as in the concrete
syntax.  ``High'' precedences bind more tightly than ``low''
precedences.  Each concrete syntax production (not the actual concrete
syntax of~\cite{DS/FMU/IED/DEF001}, rather an idealised syntax that
allows for the extra brackets that are inserted) is given a particular
precedence level, if it is used in a higher precedence context then it
must be enclosed in round brackets.  The round brackets themselves
require the highest precedence level, thus never need to be enclosed in
round brackets.  The context within round brackets is the lowest
normally used precedence level allowing any concrete syntax production
to be used without brackets.

Precedence levels of the other concrete syntax productions are
generally simple to decide.  All the self-bracketing forms assume
highest normal precedence level and enclose the lowest.

Using the precedence levels the basic algorithm for printing part of
the HOL term language is then as follows.  A recursive routine
traverses the input term outputting parts of the term as they are
reached.  Arguments to the routine include the term to be printed and
the precedence level of the current context.  The term is analysed to
find its concrete syntax form, which has its own precedence level.  If
the current context level is higher than that of the concrete syntax
form then brackets are required.

An extra set of low precedences are provided for use in places where
brackets are always required.  E.g., in HOL pairs of values are formed
using the infix comma as an operator, Tuples may be formed by nesting
pairs, the comma is right associative allowing some brackets to be
eliminated.  Having an extra precedence below the normal lowest level
allows the general bracket elimination mechanism to be used to insert
only those brackets that are necessary.

%********************************************************************

\subsection{Data Type for Precedence Levels}

Precedence levels are identified by the constructors of $OP_PREC$,
they are ordered by the comparison function $gt_prec$ which are
declared below.  Values of type $OP_PREC$ form a series of partial
orderings, one for each collection of concrete syntax productions.
There are three for HOL, for terms, for types and for varstructs.
Other languages will have their own partial orderings.  In HOL the
processing of lists of declarations from the abbreviated form of nested
binders (concrete syntax~\cite{DS/FMU/IED/DEF001} productions $BinDec$,
$Block$ and $Vars_Ty$) are handled outside of the precedence
structure.

=SML
datatype ⦏OP_PREC⦎
	=	⦏PcHighest⦎
	|	⦏PcNormal⦎		of int * int * Lex.ASSOC
	|	⦏PcLowest⦎
	;
type	⦏PREC_CONTEXT⦎ = OP_PREC * Lex.ASSOC;
=TEX

%********************************************************************

\subsection{Precedence Comparison}

A simple mechanism is used to produce a fully bracketed form, namely by
getting virtually all precedence comparisons to indicate that brackets
are required.

=SML
val pp_add_brackets : bool ref = ref false;
val _ =
new_flag {name = "⦏pp_add_brackets⦎",  control=pp_add_brackets,
		check=fun_true, default=fun_false};
=TEX

=IGN
set_flag("pp_add_brackets", true);
set_flag("pp_add_brackets", false);
=TEX

The constructors of type $OP_PREC$ are ranked by converting them
(with local function $pc_ord$) to integers.  This coding style was
chosen because it is easier to understand than the full pattern match
between all precedence pairs.

=SML
local
	fun	⦏pc_ord⦎	PcHighest			= (4, 0, 0)
	|	pc_ord		(PcNormal(a, b, c))		= (3, a, b)
	|	pc_ord		PcLowest			= (2, 0, 0)
	;
in
	infix gt_prec;

	fun	((outer, lr):PREC_CONTEXT) ⦏gt_prec⦎ (inner:OP_PREC) : bool = (
		if !pp_add_brackets
		then
			case (outer, inner)
			of (PcLowest, _) => false
			| _ => true
		else
			let
				val (o1, o2, o3)	= pc_ord outer;
				val (i1, i2, i3)	= pc_ord inner;
			in
				if	o1 <> i1 then o1 > i1
				else if	o2 <> i2 then o2 > i2
				else if	o3 <> i3 then o3 > i3
				else	case (outer, inner) of
					(PcNormal(_, _, oa), PcNormal(_, _, ia)) => (
						oa <> ia orelse
						oa <> lr
				) |	_ => false
			end
	);
end;
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
\section{HOL TERM PATTERNS}

The basic pretty printing algorithm is to receive a term and split
it up into one of a small number of patterns.

=SML
datatype ⦏PATTERN⦎
	=	⦏PFunConst⦎	of TERM * string * TYPE * (TERM list)
	|	⦏PFunVar⦎	of TERM * string * TYPE * (TERM list)
	|	⦏PApp⦎		of TERM * (TERM list)
	|	⦏Pλ⦎		of TERM * TERM
	;
=TEX

Where:

\begin{description}
\def\ITEM#1{\item[$#1$ ] }

\ITEM{PFunConst, PFunVar} Function application of a constant or a
	variable (with name and
	type) to a list of arguments.

\ITEM{PApp} Function application of a non-constant to a (possibly
	empty) list of arguments.

\ITEM{Pλ} As returned by $dest_simple_term$.

\end{description}

For each pattern, including $PFun\ldots$, there is a printing routine for
the current language which gives the default printing form for that
pattern type.

\bigskip

Function $open_up$ returns the pattern corresponding to a term.
Note that the value returned with constructors $PFunConst$ and
$PFunVar$ is the head term of the application which is the term
passed to the $aux$ function.

=SML
fun ⦏open_up⦎ (tm:TERM) : PATTERN = (
let
	fun aux tm1 rest = (
		case dest_simple_term tm1
		of	Const(str, ty) =>	PFunConst(tm1, str, ty, rest)
		|	Var(str, ty) =>	PFunVar(tm1, str, ty, rest)
		|	App(t1, t2) =>	aux t1 (t2::rest)
		|	_ =>			PApp(tm1, rest)
	);
in
	case dest_simple_term tm
	of	Var(str, ty) =>		PFunVar(tm, str, ty, nil)
	|	Const(str, ty) =>		PFunConst(tm, str, ty, nil)
	|	Simpleλ t1_t2 =>		Pλ t1_t2
	|	App(t1, t2) =>		aux t1 [t2]
end);
=TEX

If the given term is a constant applied to a list of arguments then
return its name.

=SML
fun ⦏get_first_const⦎ (tm:TERM) : string OPT = (
	case open_up tm
	of PFunConst(_, const, _, _) => Value const
	| _ => Nil
);
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
\section{APPLICATIONS OF HOL CONSTANTS}

For patterns of type $PFunConst$ and $PFunVar$ we have a table of functions indexed
by language name.  The indicated function is called with the arguments
of the constructor.  These printing functions return a value of the
following type.
This datatype is also used for the $PApp$ and $P$ patterns but in this
case $PfFewer$ has no meaning, it and $PfNotPossible$ are treated
identically.

=SML
datatype ⦏PFUN_ANS⦎
	=	⦏PfFewer⦎		of int
	|	⦏PfNotPossible⦎
	|	⦏PfOk⦎
	;
=TEX

If these functions cannot handle the quantity of arguments given in the
list, but they could handle a smaller list, then they do nothing apart
from returning $PfFewer$ with their preferred number of arguments.  A
function that can handle various number of arguments, but not the
number given, must select the number it would prefer to print.  If they
cannot handle the arguments at all then $PfNotPossible$ is returned.
If they handled all of the arguments successfully and printed out the
term then $PfOk$ is returned.

The calling sequence of these functions is to call them with all of the
available arguments, if the result is $PfFewer$ they are split into
two portions, one of the required size, the other the remainder.  The
function is called again, but not immediately, the second time it may
only return $PfOk$ (view the first call as setting a contract: the
function says it cannot handle the initial set of arguments, but it
contracts to handle a specified number of arguments if it is called
again).  Patterns $PFun\ldots$ after splitting become a use of pattern
$PApp$ where the single term is built from the required number of
arguments, and the list holds the remainder.  The delay in making the
second call stems from outputting the $PApp$ that combines the two
portions of the original call chain.

If any function returns $PfNotPossible$ then its arguments are
reformatted and printed using the more primitive formatting routines
for the current language.

Looping where the called function keeps returning different values with
$PfFewer$ should always terminate because the repackaging of the
argument list (in function $handle_fun_const$) always makes the list
smaller.

%********************************************************************

\subsection{Some Examples}

\paragraph{HOL conditional} These expect three arguments:  condition,
consequence and alternative.  The HOL printing function is entered, it
recognises the constant name for a conditional.  If more than three
arguments are given it returns $PfFewer\;\;3$, if it is given less
than three arguments it returns $PfNotPossible$, for exactly three
arguments it does the following steps.

\begin{itemize}

\item If the enclosing precedence is greater than that of a conditional
	then output an open bracket.

\item Print an `{\tt if}'.

\item Call the main printer recursively with the condition argument and
	precedence of $PcLowest$.

\item Print a `{\tt then}'.

\item Call the main printer recursively with the consequence argument
	and precedence of $PcLowest$.

\item Print an `{\tt else}'.

\item Call the main printer recursively with the alternative argument
	and precedence indicating the last element of a conditional.

\item If the enclosing precedence is greater than that of a conditional
	then output a closing bracket.

\end{itemize}

There are some extra actions to set the spacing and indentation
required at various places within the conditional.

%--------------------------------------------------------------------

\paragraph{HOL lists}  The constant $Cons$ would normally expect two
arguments, the head element and the rest.  It will recursively examine
the second argument until it does not find a $Cons$, if a $Nil$ is
found then it has a list that can be printed using the HOL syntax for
lists.  If anything else is found then the function returns
$PfNotPossible$ and the $PFun\ldots$ is printed in a more primitive
form.

A valid list is printed by a sequence of calls to output fixed strings,
spacing and recursive calls of the main printer.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
\section{CURRENT PRINTING ENVIRONMENT}

Information about the current printing environment is passed to all
called printing functions.  The value passed into a function is
expected to be passed onto any printing function that it calls,
although there may be some modifications.  In particular the four Oppen
printing functions (components $pe_addstring$, $pe_beginb$, $pe_endb$
and $pe_space$) should not be changed, they are the only output
mechanism allowed to the printers.

A number of functions are held in the environment, for convenience
their types are named here.  Types $FUN_APP_PR$ and $VAR_APP_PR$ are
used for the application of constants and variables, respectively, to
arguments.  The next types are used for the
primitive HOL constructors with corresponding name.  Type
$PRIM_PRS$ combines these types to hold the functions for `abs',
`app', `const', application and `var', its functions are given in
alphabetical order.

=SML
datatype ⦏PP_ENV⦎ = PpEnv of {
	⦏pe_depth⦎		: int OPT,
	⦏pe_prec⦎		: PREC_CONTEXT,
	⦏pe_show_index⦎		: bool,
	⦏pe_lang⦎		: string,
	⦏pe_fun_const⦎		: FUN_APP_PR,
	⦏pe_fun_var⦎		: VAR_APP_PR,
	⦏pe_app⦎		: APP_PR,
	⦏pe_const⦎		: VAR_CONST_PR,
	⦏pe_var⦎		: VAR_CONST_PR,
	⦏pe_λ⦎			: λ_PR,
	⦏pe_addstring⦎		: string -> unit,
	⦏pe_beginb⦎		: (int * bool) -> unit,
	⦏pe_endb⦎		: unit -> unit,
	⦏pe_space⦎		: (int * int) -> unit
}

withtype ⦏FUN_APP_PR⦎	= PP_ENV -> TERM -> string  -> TYPE
					-> TERM list -> PFUN_ANS
and ⦏VAR_APP_PR⦎	= PP_ENV -> TERM -> string -> TYPE
					-> TERM list -> PFUN_ANS
and ⦏λ_PR⦎			= PP_ENV -> TERM -> TERM -> PFUN_ANS
and ⦏APP_PR⦎			= PP_ENV -> TERM -> TERM list -> PFUN_ANS
and ⦏VAR_CONST_PR⦎	= PP_ENV -> TERM -> string -> TYPE -> PFUN_ANS;

type ⦏PRIM_PRS⦎		= (λ_PR * APP_PR * VAR_CONST_PR
					* FUN_APP_PR * VAR_APP_PR * VAR_CONST_PR);
=TEX

The values in this datatype are discussed in detail in the detailed design.

\bigskip

Field $pe_show_index$ is initialised from the following flag.

=SML
val pp_show_index : bool ref = ref false;
val _ =
new_flag {name = "⦏pp_show_index⦎",  control=pp_show_index,
		check=fun_true, default=fun_false};
=TEX

=IGN
set_flag("pp_show_index", true);
set_flag("pp_show_index", false);
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\newpage
\section{DATABASE OF PRINTING FUNCTIONS}

A database of functions for printing each of the languages is held.

As the number of expected languages is small a simple dictionary
suffices to hold the database.
We actually hold two databases where $database$ holds the active and
$full_database$ holds all of the printing functions.  Functions
$enable_printer$ and $disable_printer$ control which printing functions
are active.

=SML
local

open SimpleDictionary;

val ⦏database⦎ : PRIM_PRS S_DICT ref = ref initial_s_dict;
val ⦏full_database⦎ : PRIM_PRS S_DICT ref = ref initial_s_dict;

in

fun ⦏get_printers⦎ (lang:string) : PRIM_PRS OPT = (
	s_lookup lang (!database)
);

fun ⦏set_printers⦎ (lang:string, functions : PRIM_PRS) : unit = (
	case s_lookup lang (!full_database)
	of Nil => ()
	| _ => (
		if lang = "HOL"
		then
			fail "enable_printer" 31004 nil
		else
			warn "set_printers" 31002 [fn () => lang]
	)
	;
	database := s_enter lang functions (!database);
	full_database := s_enter lang functions (!full_database)
);

fun ⦏enable_all_printers⦎ (_:unit) : unit = (
	database := !full_database
);

fun ⦏enable_printer⦎ (lang:string) : unit = (
	case s_lookup lang (!full_database)
	of Nil => fail "enable_printer" 31005 [fn () => lang]
	| Value functions => (
		database := s_enter lang functions (!database)
	)
);

fun ⦏disable_printer⦎ (lang:string) : unit = (
	if lang = "HOL"
	then
		fail "disable_printer" 31006 nil
	else
		case s_lookup lang (!full_database)
		of Nil => fail "disable_printer" 31005 [fn () => lang]
		| Value functions => (
			database := s_delete lang (!database)
		)
);

end;
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
\section{ENVIRONMENT MANIPULATION}

A small number of functions are useful for altering $PP_ENV$ records.

=SML
fun ⦏set_env_for_language⦎ (lang:string) (cur_env:PP_ENV) : PP_ENV = (
let
	val PpEnv{pe_lang = cur_lang, pe_addstring = cur_addstring, pe_beginb = cur_beginb,
		pe_depth = cur_depth,
		pe_show_index = cur_show_index,
		pe_endb = cur_endb, pe_space = cur_space, pe_app = app,
		pe_const = const, pe_var = var, pe_λ = abs, ...} = cur_env;

	val (new_abs, new_app, new_const, new_fun_const, new_fun_var, new_var) = (
		case get_printers lang
		of Value printers => printers
		| Nil => (	case get_printers "HOL"
				of Value printers => printers
				| Nil => fail "pretty_printer" 31001 [fn () => lang]
			)
	);
in
	PpEnv{	pe_lang	= lang,
			pe_depth	= cur_depth,
			pe_prec		= (PcLowest, Lex.LeftAssoc),
			pe_show_index	= cur_show_index,
			pe_fun_const	= new_fun_const,
			pe_fun_var	= new_fun_var,
			pe_app		= new_app,
			pe_const	= new_const,
			pe_var		= new_var,
			pe_λ		= new_abs,
			pe_addstring	= cur_addstring,
			pe_beginb	= cur_beginb,
			pe_endb	= cur_endb,
			pe_space	= cur_space
	}
end
);
=TEX

An initial environment is required, it does not do anything useful.

=SML
local
	fun dummy_fun_co _ _ _ _ _ = PfOk;
	fun dummy_fun_va _ _ _ _ _ = PfOk;
	fun dummy_abs _ _ _ = PfOk;
	fun dummy_app _ _ _ = PfOk;
	fun dummy_var_const _ _ _ _ = PfOk;
in
	fun ⦏initial_env⦎ (lang:string)
			(depth :int OPT)
			((addstring, beginb, space, endb):OPPEN_FUNS)
			: PP_ENV = (
		set_env_for_language lang
			(PpEnv	{	pe_lang	= " -- none -- ",
						pe_depth	= depth,
						pe_prec		= (PcLowest, Lex.LeftAssoc),
						pe_show_index	= !pp_show_index,
						pe_fun_const	= dummy_fun_co,
						pe_fun_var	= dummy_fun_va,
						pe_app		= dummy_app,
						pe_var		= dummy_var_const,
						pe_const	= dummy_var_const,
						pe_λ		= dummy_abs,
						pe_addstring	= addstring,
						pe_beginb	= beginb,
						pe_endb	= endb,
						pe_space	= space
					})
	);
end;
=TEX

Set the $pe_prec$ field to a new value.

=SML
fun ⦏set_prec⦎ (new_prec:PREC_CONTEXT) (cur_env:PP_ENV) : PP_ENV = (
let
	val PpEnv{pe_lang = cur_lang, pe_fun_const = cur_fun_const,
		pe_depth = cur_depth,
		pe_show_index = cur_show_index,
		pe_fun_var = cur_fun_var, pe_const = cur_const, pe_var = cur_var,
		pe_λ = cur_abs, pe_app = cur_app,
		pe_addstring = cur_addstring, pe_beginb = cur_beginb,
		pe_endb = cur_endb, pe_space = cur_space, ...} = cur_env;
in
	PpEnv{	pe_lang	= cur_lang,
			pe_depth	= cur_depth,
			pe_prec		= new_prec,
			pe_show_index	= cur_show_index,
			pe_fun_const	= cur_fun_const,
			pe_fun_var	= cur_fun_var,
			pe_app		= cur_app,
			pe_const	= cur_const,
			pe_var		= cur_var,
			pe_λ		= cur_abs,
			pe_addstring	= cur_addstring,
			pe_beginb	= cur_beginb,
			pe_endb	= cur_endb,
			pe_space	= cur_space
	}
end
);
=TEX

Set the $set_show_index$ field to a new value.

=SML
fun ⦏set_show_index⦎ (new_si:bool) (cur_env:PP_ENV) : PP_ENV = (
let
	val PpEnv{pe_lang = cur_lang, pe_fun_const = cur_fun_const,
		pe_depth = cur_depth,
		pe_prec = cur_prec,
		pe_fun_var = cur_fun_var, pe_const = cur_const, pe_var = cur_var,
		pe_λ = cur_abs, pe_app = cur_app,
		pe_addstring = cur_addstring, pe_beginb = cur_beginb,
		pe_endb = cur_endb, pe_space = cur_space, ...} = cur_env;
in
	PpEnv{	pe_lang	= cur_lang,
			pe_depth	= cur_depth,
			pe_prec		= cur_prec,
			pe_show_index	= new_si,
			pe_fun_const	= cur_fun_const,
			pe_fun_var	= cur_fun_var,
			pe_app		= cur_app,
			pe_const	= cur_const,
			pe_var		= cur_var,
			pe_λ		= cur_abs,
			pe_addstring	= cur_addstring,
			pe_beginb	= cur_beginb,
			pe_endb	= cur_endb,
			pe_space	= cur_space
	}
end
);
=TEX

Set the $pe_depth$ field to a new value.

=SML
fun ⦏set_depth⦎ (new_depth:int OPT) (cur_env:PP_ENV) : PP_ENV = (
let
	val PpEnv{pe_lang = cur_lang, pe_fun_const = cur_fun_const,
		pe_fun_var = cur_fun_var, pe_const = cur_const, pe_var = cur_var,
		pe_show_index = cur_show_index,
		pe_prec = cur_prec,
		pe_λ = cur_abs, pe_app = cur_app,
		pe_addstring = cur_addstring, pe_beginb = cur_beginb,
		pe_endb = cur_endb, pe_space = cur_space, ...} = cur_env;
in
	PpEnv{	pe_lang	= cur_lang,
			pe_depth	= new_depth,
			pe_prec		= cur_prec,
			pe_show_index	= cur_show_index,
			pe_fun_const	= cur_fun_const,
			pe_fun_var	= cur_fun_var,
			pe_app		= cur_app,
			pe_const	= cur_const,
			pe_var		= cur_var,
			pe_λ		= cur_abs,
			pe_addstring	= cur_addstring,
			pe_beginb	= cur_beginb,
			pe_endb	= cur_endb,
			pe_space	= cur_space
	}
end
);
=TEX

Decrement the $pe_depth$ field to a new value.

=SML
fun ⦏decrement_depth⦎ (cur_env:PP_ENV) : PP_ENV = (
let
	val PpEnv{pe_lang = cur_lang, pe_fun_const = cur_fun_const,
		pe_fun_var = cur_fun_var, pe_const = cur_const, pe_var = cur_var,
		pe_show_index = cur_show_index,
		pe_prec = cur_prec, pe_depth = cur_depth_opt,
		pe_λ = cur_abs, pe_app = cur_app,
		pe_addstring = cur_addstring, pe_beginb = cur_beginb,
		pe_endb = cur_endb, pe_space = cur_space, ...} = cur_env;
in
	case cur_depth_opt
	of Nil => cur_env
	| Value cur_depth =>
		PpEnv{	pe_lang	= cur_lang,
				pe_depth	= Value(cur_depth - 1),
				pe_prec		= cur_prec,
				pe_show_index	= cur_show_index,
				pe_fun_const	= cur_fun_const,
				pe_fun_var	= cur_fun_var,
				pe_app		= cur_app,
				pe_const	= cur_const,
				pe_var		= cur_var,
				pe_λ		= cur_abs,
				pe_addstring	= cur_addstring,
				pe_beginb	= cur_beginb,
				pe_endb	= cur_endb,
				pe_space	= cur_space
		}
end
);
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
\section{LANGUAGE QUOTATIONS}

These routines are used to output the language quotation symbols around
any text to be output.

A database of language names and starting symbols is maintained.  The
HOL term and type languages are handled specially, there is a standard
way of quoting unknown languages.
The database could easily be extended to cater for concluding symbols.

=SML
local

open SimpleDictionary;

val ⦏database⦎ : string S_DICT ref = ref initial_s_dict;

in

fun ⦏get_start_quote⦎ (lang:string) : string OPT = (
	case lang
	of "HOL" => Value "⌜"
	| "HOL:" => Value "ⓣ"
	| _ => s_lookup lang (!database)
);

fun ⦏set_start_quote⦎ (lang:string, quoter:string) : unit = (
	case lang
	of "HOL" => fail "set_start_quote" 31007 [fn () => lang]
	| "HOL:" => fail "set_start_quote" 31007 [fn () => lang]
	| _ => (
		case s_lookup lang (!database)
		of Nil => ()
		| _ => warn "set_printers" 31008 [fn () => lang]
		;
		database := s_enter lang quoter (!database)
	)
);
end;
=TEX

=SML
fun ⦏start_new_language⦎ (PpEnv{pe_addstring=addstring, ...}:PP_ENV)
			(new:string) : unit = (
	addstring (	case get_start_quote new
			of Value q	=> q
			| _		=> "⌜↘" ^ new ^ "↕ ")
);

fun ⦏conclude_new_language⦎ (PpEnv{pe_addstring=addstring, ...}:PP_ENV)
			(new:string) : unit = (
	addstring "⌝"
);
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\section{CHOOSING LANGUAGES}

These functions select the language to be used for printing terms.

=SML
local (* for choose_..._language *)

fun select (tml : string list, pr_h::pr_t : string list, def : string) : string =
	if contains tml pr_h then pr_h else select(tml, pr_t, def)
| select(tml as (tml_h::_), nil, def) =
	if contains tml def then def else tml_h
| select (_, _, def:string) = def
;

in
=TEX

=SML
fun ⦏choose_const_language⦎ (const:string, prefs : string list) : string = (
	select(
		get_const_language const,
		prefs,
		get_current_language()
	)
);
=TEX

=SML
fun ⦏choose_term_language⦎ (tm:TERM, prefs : string list) : string = (
	case get_first_const tm
	of Nil => get_current_language ()
	| Value l => choose_const_language(l, prefs)
);

end (* of local for choose_..._language *);
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\section{BASIC HOL TERM PRINTER}

%********************************************************************

\subsection{Printing Uses of HOL Constants and Variables}

HOL constants and variables may be applied to arguments or they may just be named.

Function $handle_fun_const$ deals with uses of HOL constants, both
applied uses and constants as arguments.  It calls the printing
function for applications of constants in the current language.  If the
printing function cannot print the values then a more primitive
function is used.  For function applications this is component
$pe_app$, for non applied uses it is component $pe_const$, both from
the current environment.

Similarly, function $handle_fun_var$ deals with uses of HOL variables,
but in this case no language change is required.

If the printing function indicates that it can handle fewer arguments
then they are recombined and passed to component $pe_app$ from the
current environment.  This routine will print the function application
of a term to the excess arguments, the term will passed to function
$main_term_pp$ which will open it up to find a $PFun\ldots$, but this
time it will have the correct number of arguments.

The test of `$length\;\;args <= num$' is, strictly, unnecessary given
the specification of how the functions should operate and the meaning
of $PfFewer$, however it is an easy check to make and may avoid some
problems when writing or testing printing functions.


=SML
fun ⦏handle_fun_const⦎ (cur_env:PP_ENV) (orig:TERM) (hdtm:TERM)
		(const:string) (const_ty:TYPE)
		(args:TERM list) : PFUN_ANS = (
let
	val PpEnv{pe_fun_const = do_fun_const, pe_app=do_app,
		pe_const=do_const, ...} = cur_env;

in
	case do_fun_const cur_env hdtm const const_ty args
	of PfNotPossible => (
		if length args = 0
		then
			do_const cur_env hdtm const const_ty
		else
			do_app cur_env hdtm args
		)
	| PfOk => PfOk
	| PfFewer num => (
		if length args <= num
		then
			do_app cur_env hdtm args
		else
			do_app cur_env
				(revfold	(fn(el, prev) => mk_app(prev, el))
						(args to (num-1))
						hdtm
				)
				(args from num)
		)
end
);
=TEX

=SML
fun ⦏handle_fun_var⦎ (cur_env:PP_ENV) (orig:TERM) (hdtm:TERM)
		(var:string) (var_ty:TYPE)
		(args:TERM list) : PFUN_ANS = (
let
	val PpEnv{pe_fun_var = do_fun_var, pe_app=do_app,
		pe_var=do_var, ...} = cur_env;
in
	case do_fun_var cur_env hdtm var var_ty args
	of PfNotPossible => (
		if length args = 0
		then
			do_var cur_env hdtm var var_ty
		else
			do_app cur_env hdtm args
		)
	| PfOk => PfOk
	| PfFewer num => (
		if length args <= num
		then
			do_app cur_env hdtm args
		else
			do_app cur_env
				(revfold	(fn(el, prev) => mk_app(prev, el))
						(args to (num-1))
						hdtm
				)
				(args from num)
		)
end
);
=TEX

%********************************************************************

\subsection{Main Recursive Entry Point}
=SML
val pp_prefer_current_language : bool ref = ref false;
val _ =
new_flag {	name = "⦏pp_prefer_current_language⦎",
		control=pp_prefer_current_language,
		check=fun_true, default=fun_false};
=TEX

Function $main_term_pp$ is the function that is called by all the other
term printing functions when they have a sub term to be printed.

=SML
fun ⦏main_term_pp⦎ (cur_env:PP_ENV) (tm:TERM) : unit = (
let
	val PpEnv{pe_app=do_app, pe_var=do_var, pe_λ=do_abs,
		pe_depth = cur_depth,
		pe_addstring = addstring,
		pe_space = space,
		pe_lang=cur_lang, pe_beginb=beginb, pe_endb=endb, ...} = cur_env;
	val new_env = decrement_depth cur_env;
in
	if (case cur_depth of Nil => true | Value d => d > 0)
	then
	case open_up tm
	of PFunConst(hdtm, const, const_ty, args) =>
		let
			val prefs = (
				if	!pp_prefer_current_language
				then	[get_current_language(), cur_lang]
				else	[cur_lang]
			);
			val lang = choose_const_language(const, prefs);
			val lang_change = cur_lang <> lang;
			val env =	if lang_change
					then set_env_for_language lang new_env
					else new_env;
		in
			if lang_change then start_new_language new_env lang else ();

			case handle_fun_const env tm hdtm const const_ty args
			of PfOk => ()
			| _ => hol_term_pp cur_env tm;

			if lang_change then conclude_new_language new_env lang else ()
		end
	| PFunVar(hdtm, const, const_ty, args) => (
		case handle_fun_var new_env tm hdtm const const_ty args
		of PfOk => ()
		| _ => hol_term_pp cur_env tm
	)
	| PApp(head_fn, args) => (
		case do_app new_env head_fn args
		of PfOk => ()
		| _ => hol_term_pp cur_env tm
	)
	| Pλ(tm1, tm2) => (
		case do_abs new_env tm1 tm2
		of PfOk => ()
		| _ => hol_term_pp cur_env tm
	)
	else (addstring "..."; space(1, 0))
end
)
(*
=TEX

Function $hol_term_pp$ is like $main_term_pp$ but prints its argument
using the HOL printing routines.  This function is used in those cases
where the previously called routine failed, i.e., a value other than
$PfOk$ was returned.

Note how this function differs in when it opens up the environment
compared to most of the other pretty printing functions.  Here we must
create an environment containing the HOL printing functions and then
extract them rather than using the functions of the environment
provided as an argument.

=SML
*)
and ⦏hol_term_pp⦎ (cur_env:PP_ENV) (tm:TERM) : unit = (
let
	val new_env = set_env_for_language "HOL" (decrement_depth cur_env);

	val PpEnv{pe_app=do_app, pe_λ=do_abs,
		pe_addstring = addstring,
		pe_space = space,
		pe_lang=cur_lang, pe_beginb=beginb, pe_endb=endb, ...} = new_env;
in
	start_new_language cur_env "HOL";

	case	case open_up tm
		of PFunConst(hdtm, const, const_ty, args) =>
				handle_fun_const new_env tm hdtm const const_ty args
		| PFunVar(hdtm, const, const_ty, args) =>
			handle_fun_var new_env tm hdtm const const_ty args
		| PApp(head_fn, args) =>
			do_app new_env head_fn args
		| Pλ(tm1, tm2) =>
			do_abs new_env tm1 tm2
	of PfOk => ()
	| _ => error "pretty_printer" 31003 nil
	;
	conclude_new_language cur_env "HOL"
end
);
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\newpage
\section{FINALE}

%********************************************************************

\subsection{End of Pretty Printer Structure}

=SML
end (* of structure PrettyPrinterSupport *);
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%********************************************************************
%--------------------------------------------------------------------

\newpage

\makeatletter
\def\refstepcounter#1{\stepcounter{#1}\global\edef\@currentlabel{\csname
	p@#1\endcsname\csname the#1\endcsname}}
\makeatother

\twocolumn[\section{INDEX}] \label{Index}

\footnotesize
\printindex

\onecolumn

\end{document}



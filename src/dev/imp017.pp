=IGN
********************************************************************************
imp017.doc: this file is part of the PPDev system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
N.B. sieve may warn about "val ⦏banner⦎ : string = ... " line
Don't worry about this!
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

\def\Title{SLR Parser Generator}

\def\AbstractText{The SLRP parser generator is implemented.}

\def\Reference{DS/FMU/IED/IMP017}

\def\Author{R.D. Arthan, D.J.King}


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
%% LaTeX2e port: % TQtemplate.tex
%% LaTeX2e port: \documentstyle[hol1,11pt,TQ]{article}
%% LaTeX2e port: \ftlinepenalty=9999
\def\Hide#1{}
%% LaTeX2e port: \def\Bool{``$\it{:}bool\,$''}
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{FST PROJECT}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{SLR Parser Generator}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP017}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.57 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: %\TPPdate{}  %% Mandatory field (with sensible default)
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: %\TPPauthor{}  %% Mandatory field
%% LaTeX2e port: \TPPauthors{R.D.~Arthan & WIN01\\D.J.King&WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{
%% LaTeX2e port: A simple SLR parser generator is implemented.}
%% LaTeX2e port: %\TPPabstractB{}
%% LaTeX2e port: %\TPPabstractC{}
%% LaTeX2e port: %\TPPabstractD{}
%% LaTeX2e port: %\TPPabstractE{}
%% LaTeX2e port: %\TPPabstractF{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port:       Library}}
%% LaTeX2e port: 
%% LaTeX2e port: %\TPPclass{CLASSIFICATION}
%% LaTeX2e port: %\def\TPPheadlhs{}
%% LaTeX2e port: %\def\TPPheadcentre{}
%% LaTeX2e port: %def\TPPheadrhs{}
%% LaTeX2e port: %\def\TPPfootlhs{}
%% LaTeX2e port: %\def\TPPfootcentre{}
%% LaTeX2e port: %\def\TPPfootrhs{}
%% LaTeX2e port: 
%% LaTeX2e port: \begin{document}
%% LaTeX2e port: \TPPsetsizes
%% LaTeX2e port: \makeTPPfrontpage
%% LaTeX2e port: 
%% LaTeX2e port: \vfill
%% LaTeX2e port: \begin{centering}
%% LaTeX2e port: 
%% LaTeX2e port: \bf Copyright \copyright\ : Lemma 1 Ltd \number\year
%% LaTeX2e port: 
%% LaTeX2e port: \end{centering}

\begin{document}

\headsep=0mm
\FrontPage
\headsep=10mm

\setcounter{section}{-1}

\newpage
\section{DOCUMENT CONTROL}
\subsection{Contents list}
\tableofcontents
\subsection{Document cross references}
\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes history}  % to get section number `0.3'
\begin{description}
\item[Issue 1.1 (1991/04/10)-1.14 (1992/01/20)] Initial Versions

\item[Issue 1.15 (1992/01/21) (21 January 1992)]
Performance improvements made. Introduced an
efficient representation of the grammar, and support
for sets and sets of set as ordered lists. This
gives a ten-fold improvement in performance.

\item[Issue 1.16 (1992/01/23) (22 January 1992)]
Textual content brought into line with changes to
the code. Also, modification made to the
code which generates the action table. The table
now compiles about 5 times faster than before.
\item[Issue 1.17 (1992/01/27) (27 January 1992)] Made $make\_items$ use new $rcup''$ operation and amended
computation of $init\_state$ in $slr\_tables$.
\item[Issue 1.18 (1992/01/28) (27 January 1992)] Changed $maprcup''$ to sort the results after they
are computed (using $Sort.sort$).
\item[Issue 1.19 (1992/02/04) (4 February 1992)] Changed type of
$BNF\_error$ in accordance with changes made to the parser
driver error handling mechanism.
\item[Issue 1.20 (1992/02/04) (4 February 1992)] Fixed a syntax error
in $maprcup''$!.
\item[Issue 1.21 (1992/04/02) (1 April 1992)] Fixed an error in the
printing of syntax errors in the input, whereby the symbol
rejected was never printed in the message reported to
the user. Also, the parse stack is now available to the
actions description in the input grammar under the name
$stk$, together with the existing names $x1$, $x2$ etc.
\item [Issue 1.22 (1992/04/14) (13th April 1992)]
Changes due to CR0017.
\item [Issue 1.23 (1992/04/28) (27th April 1992)]
The goto and reducer tables produced are now structured like the action tables of
version 1.16 and following of this document;
i.e., each table entry is assigned to a Standard ML
variable name, and the table is constructed by conjoining
the table entries.
\item [Issue 1.24 (1992/05/26) (26th May 1992)]
Renamings from version 1.5 of DS/FMU/IED/WRK038.
\item[Issue 1.25 (1999/02/08) (8th February 1999)] Updates for SML'97.
\item[Issue 1.26 (1999/02/17) (17th February 1999)] Corrected missing comma in reduction-table output code.
\item[Issue 1.27 (1999/04/21) (21st April 1999)] New strategy for code to generate tables to circumvent SML-NJ compile-time problem.
\item[Issues 1.28 (2000/08/01),1.29 (2000/08/01) (1st August 2000)]
A shell script to run the parser generator has been added and the error handling
of the ML interface has been rationalised to facilitate this --- after reporting
an error, the interface now raises an exception that can be trapped by the
code piped in from the script.
\item[Issues 1.30 (2002/03/13)]
Port to Poly/ML.
\item[Issue 1.31 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.32 (2002/10/17)] PPDev-specific updates for open source release
\item[Issue 1.33 (2002/11/01)] Removed misplaced comment in the shell script.
\item[Issue 1.34 (2003/02/17)] Improved {\it LaTeX} layout.
\item[Issues 1.35 (2003/02/20), 1.36 (2003/02/21)] Tidy-up in preparation for implementing calculation of LALR(1) lookahead sets.
\item[Issue 1.37 (2003/02/22)] Now calculates LALR(1) lookahead sets when the SLR(1) algorithm results in conflicts.
\item[Issues 1.38 (2003/02/22), 1.39 (2003/02/23)] Added option to print out the LR(0) automaton and tidied up some
of the printing code.
\item[Issue1.40 (2003/02/23)] Can now specify a constructor to apply to string literals in the action tables
(and they are output as valid ML strings now).
\item[Issue 1.41 (2003/02/23)] Implemented execution timings.
\item[Issue 1.42 (2003/02/23)] It can now tell you how many conflicts the LALR(1) step removed.
\item[Issue 1.43 (2003/02/24)] Tidied up error-handling and the treatment of MS-DOS and Macintosh format text files.
\item[Issue 1.44 (2003/02/24)] Made the follow and first functions work with arrays rather than lists.
\item[Issue 1.45 (2003/02/25)] Fixed bug in print-out of LR(0) automaton.
\item[Issues 1.46 (2003/02/25)--1.48 (2003/02/26)] Added generic parser output facility --- it can now write the reduction functions for you!
\item[Issue 1.49 (2003/02/28)] Fixed bug in FOLLOW.
\item[Issue 1.50 (2003/03/03)] Fixed obscure problem with accept/reduce conflicts.
\item[Issue 1.51 (2003/03/05)] Stopped {\it make\_grammar\_and\_reduction\_table} deleting duplicated alternatives
(which prevents detection of a quite likely error); added check for non-terminals that generate
an empty language.
\item[Issue 1.52 (2003/03/06)] Reduction table entries are now arrays.
\item[Issue 1.53 (2003/03/10)] Adjusted interpretation of log level (to give room for expansion).
\item[Issue 1.54 (2003/03/20)] Tidied output format in {\it print\_grammar}. Now applies signature
constraint to {\it SlrpDriver}.
\item[Issue 1.55 (2003/04/16)] Now outputs a binding for the initial state.
\item[Issue 1.56 (2006/10/25)] Implements two new options effective only in the case where generic parser output has been specified:
\item[Issues 1.57 (2008/01/27), 1.58 (2008/01/27)] Poly/ML 5.1 port.
=INLINEFT
-r
=TEX
\ which diverts generic reduction functions to a separate file and
=INLINEFT
-b
=TEX
\ which requests a briefer interface for the reduction functions omitting the first argument,
which is otherwise a pair formed from the corresponding production name and number.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
\item[2015/11/21]
Added {\it slrp\_main}. The shell script {\tt slrp} now uses {\it slrp\_main} and passes the parameter
attributes in via environmental variables.
\item[2015/11/24]
Now does what is necessary to build a stand-alone binary.
This works with Poly/ML, SML/NJ and MLton.
\item[2015/11/25]
Added boiler-plate to support compilation with MLton.
\item[2015/11/25]
Made shell script more robust after further testing.
\item[2016/01/25]
Fixed title.
\item[2016/02/10]
Fixed incompatibility with POSIXly pedantic shells like {\tt dash}.

%%%% END OF CHANGES HISTORY %%%%
\end{description}

See also HISTORICAL NOTES below.
\subsection{Changes Forecast}
None.

\pagebreak
\section{GENERAL}
\subsection{Scope}
This document contains the implementation of the SLR(1)/LALR(1) parser generator
the detailed design of which is given in \cite{DS/FMU/IED/DTD017}.
\subsection{Introduction}
\cite{DS/FMU/IED/DTD017} gives a ``black box'' description of the parser
generator.
For historical reasons, and because it is quite a sensible and efficent design,
we first use the SLR(1) algorithm and only calculate the LALR(1) lookahead
if this gives rise to conflicts.
The SLR(1) implementation given here follows the treatment
in \cite{Aho77} fairly closely and the reader of this document is assumed
to be familiar with sections 6.1, 6.2 and 6.3 of that book.
The calculation of LALR(1) lookahead sets is based on the excellent treatment
of \cite{Bermudez89}.
The key point, not stated explicitly in \cite{Aho77}, is that the LALR(1) states
are the same as the SLR(1) states as are the shift transitions while the
LALR(1) reduce transitions are a subset of the SLR(1) ones.
The approach to calculating them in \cite{Bermudez89} is based on repeating
parts of the SLR(1) calculations on a transformed grammar, which we
will call the state transition grammar or STG.
After beginning the definition of the structure $Slrp$ in section
\ref{PREAMBLE},
the implementation proper starts in section \ref{UTILITIES}
which collects together some
utilities needed throughout the material which follows.

In sections \ref{SLRTABLECOMPUTATION} and
\ref{DIAGNOSTICUTILITIES}, we define
the SLR(1) table construction algorithm together with some useful functions
for formatting the tables for inspection.
In section \ref{BNFPARSER} we apply the SLR(1) algorithm to construct a
parser for the extended BNF described in \cite{DS/FMU/IED/DTD017}.
Section \ref{CONFLICTRESOLUTION} contains further material for manipulating
the tables to resolve conflicts.
Section \ref{OUTPUTROUTINES} contains functions to write the tables out to
the output file (as fragments of Standard ML).

Finally, section \ref{INTERFACE} pulls all the earlier pieces together to
give the function {\it slrp} which is the ML user interface to the parser
generator and the {\it slrp} shell script which can be used to call it from make-files etc.

\subsection{Dependencies}
The code is dependent on \cite{DS/FMU/IED/DTD018}.
It also depends on the makefile (or a developer working interactively) to
define two strings at the ML top level: {\it system\_version} and {\it copyright}.

\section{HISTORICAL NOTE}
SLRP has had evolved in several stages. The original. implementation in 1991
was a very simple-minded translation of the SLR(1) technique as descrobed in
\cite{Aho77} based on representations of sets, functions etc. as lists.
In 1992, it was realised that representing the grammars as lists was slugging
the performance on grammars with more than a few dozen productions and
the representation for grammars was changed to lists.  This produced acceptable
results for quite big grammars, e.g., the Compliance Notation which has about
170 non-terminals and generates a parser with about 700 states.

The SLRP black box then remained closed until 1999, when the back-end needed
to be adjusted to work-around a memory problem in Standard ML of New Jersey
(which needed 400Mb or so to compile the Compliance Notation parser).

In 2003, a desire to handle more languages with less pain resulted in an extension
to implement the LALR(1) method in the very neat formulation of
\cite{Bermudez89}. This only adds about 300 lines to the code below and greatly
increases the scope. This update was accompanied by a general tidy-up of the
code and the functionality it provides.

Finally, in the 2003 round of work, the computation of the FIRST and FOLLOW
functions has been converted to use arrays. Interestingly, the Bermudez-Logothetis
LALR(1) method tends to hit these functions much harder than the SLR(1) table
calculations.  Experiments with the grammars for Ada 95, C and Pascal show
a speed-up for the LALR(1) calculations by a factor of 20 to 30, whereas the SLR(1)
calculation only goes about 5\% to 10% faster.
=IGN
Ada95:
Parsing grammar: 56ms.
Building SLR(1) tables: 11601ms.
Checking for SLR(1) conflicts: 9ms.
Calculating LALR(1) lookahead sets: 121665ms.
Writing parsing tables: 57ms.

Parsing grammar: 56ms.
Building SLR(1) tables: 11114ms.
Checking for SLR(1) conflicts: 9ms.
Calculating LALR(1) lookahead sets: 4036ms.
Writing parsing tables: 60ms.

Pascal:
Parsing grammar: 19ms.
Building SLR(1) tables: 1033ms.
Checking for SLR(1) conflicts: 4ms.
Calculating LALR(1) lookahead sets: 7257ms.
Writing parsing tables: 22ms.

Parsing grammar: 19ms.
Building SLR(1) tables: 923ms.
Checking for SLR(1) conflicts: 2ms.
Calculating LALR(1) lookahead sets: 243ms.
Writing parsing tables: 20ms.

C:

Parsing grammar: 10ms.
Building SLR(1) tables: 6928ms.
Checking for SLR(1) conflicts: 5ms.
Calculating LALR(1) lookahead sets: 23732ms.
Resolving reduce/reduce conflicts: 5ms.
Writing parsing tables: 30ms.

Parsing grammar: 10ms.
Building SLR(1) tables: 6905ms.
Checking for SLR(1) conflicts: 5ms.
Calculating LALR(1) lookahead sets: 1285ms.
Resolving reduce/reduce conflicts: 5ms.
Writing parsing tables: 26ms.
=TEX
\section{ACKNOWLEDGMENT}
I am grateful to Prof. Manuel Bermudez for very helpful correspondence clarfying
my reading of \cite{Bermudez89}.

\section{PREAMBLE}\label{PREAMBLE}
=TEX
=SML
infix 4 rgrab;
infix 4 rcup;
infix 4 rcup';
infix 4 rcup'';
infix 4 rgrab';
structure ⦏Slrp⦎ : Slrp = struct
=TEX
The following banner is written to the log file and to standard output
whenever the parser generator is run.
=SML
val ⦏banner⦎ : string = "SLRP Parser Generator  " ^ product_version ^ "  " ^ copyright;
=TEX
=SML
structure SlrpDriver : SlrpDriver = SlrpDriver;
open EfficientDictionary SlrpDriver;
=TEX
The following exception is raised in the event of, e.g., i/o errors.
It is caught in {\it slrp} and so is never visible to the user.
=SML
exception ⦏SlrpError⦎ of string;
=TEX
The action, goto and reduction tables produced are constructed out of lists.
The length of those lists is configurable by changing the value of the reference
variable $slrp\_break$ defined below. Changing its value can have a significant
effect on the speed of compilation of these tables (apparent when building a parser).
This effect is compiler-dependent (and SML/NJ is more troublesome than Poly/ML).
The best compromise with the current compilers has been found to be when $slrp\_break$ is $1$.
=SML
val ⦏slrp_break⦎ = ref 1;
val _ = if contains (map fst (get_int_controls()))
			"slrp_break"
	then	()
	else	new_int_control{name="slrp_break",
			control=slrp_break,
			default=(fn x => 1),
			check=(fn x =>
				if x > 0 then true
				else raise SlrpError
				  "slrp_break must be a positive number")
	};
=TEX
The following string controls define the format of the names used for the names for
the generic reduction functions. The given defaults are the ones that work with
the supplied generic parser code.
=SML
val ⦏gen_red_prefix⦎ : string ref = ref "red_";
val _ = if contains (map fst (get_string_controls()))
			"gen_red_prefix"
	then	()
	else	new_string_control{name="gen_red_prefix",
			control=gen_red_prefix,
			default=(fn x => "red_"),
			check=fun_true
	};
=TEX
=SML
val ⦏gen_red_suffix⦎ : string ref = ref "_";
val _ = if contains (map fst (get_string_controls()))
			"gen_red_suffix"
	then	()
	else	new_string_control{name="gen_red_suffix",
			control=gen_red_suffix,
			default=(fn x => "_"),
			check=fun_true
	};
=TEX
=SML
val ⦏proofpower_ml⦎ : bool ref = ref true;
val _ = if contains (map fst (get_flags()))
			"ProofPower-ML"
	then	()
	else	new_flag{name="ProofPower-ML",
			control=proofpower_ml,
			default=(fn x => true),
			check=fun_true
	};
=TEX
\section{UTILITIES}\label{UTILITIES}
\subsection{Miscellany}
In order to make the output from the program more easily understood
it is helpful to have (i) a version of $grab$ which adds the new element
at the end of the list, and (ii) a version of $cup$ which accumulates its
second operand into its first:
=SML
fun (xs : ''a list) ⦏rgrab⦎ (what : ''a) = (
	if	what mem xs
	then	xs
	else	xs @ [what]
);
=TEX
=SML
fun (list1 : ''a list) ⦏rcup⦎ (list2 : ''a list) : ''a list = (
	revfold (fn(x, xs) => xs rgrab x) list2 list1
);
=TEX
The following formulation of $nth$ is more natural here:
=SML
fun ⦏kth⦎ (xs : 'a list) : int -> 'a = switch nth xs;
=TEX
=SML
val ⦏alpha_sort⦎ = Sort.sort Sort.string_order;
=TEX
Given a list return the index of its last element (or ~1 for an empty list):
=SML
fun ⦏bound⦎ (list : 'a list)  : int = length list - 1;
=TEX
Count the elements of a list with a given property:
=SML
fun ⦏count⦎ (list : 'a list) (prop : 'a -> bool): int = (
	let	fun aux n (a :: more) = (
			if prop a
			then aux (n+1) more
			else aux n more
		) | aux n _ = n;
	in	aux 0 list
	end
);
=TEX
Coerce an array into a list:
=SML
fun ⦏listofarray⦎ (Xs : 'a PPArray.array) : 'a list = (
	let	open PPArray;
		val len = length Xs;
		fun aux acc ~1 = acc
		|   aux acc i = aux (PPArray.sub(Xs, i)::acc) (i-1);
	in	aux [] (len-1)
	end
);
=TEX
The following function chops an array up into lists of a given length (or at most the given length
in the case of the last list).
=SML
fun ⦏listsofarray⦎ (Xs : 'a PPArray.array) (listsize : int) : 'a list list = (
let	open PPArray;
	val len = length Xs;
	fun aux start = (
	let	val last = start + listsize;
		val ext' = if last >= len
			then len
			else last;
	in
		map (fn i => PPArray.sub (Xs, i)) (interval start (ext'-1))
	end);
	val nlists = (len-1) div listsize;
	val stl  = fold (fn (i, acc) => i*listsize::acc)
		(interval 0 nlists) [];
in	map aux stl
end
);
=TEX
The following function does the same job as {\it listsofarray} but with the input given as
a list rather than an array.
=SML
fun ⦏listsoflist⦎ xs listsize = (
let	fun aux (xs, res) = (
	let	val left = xs to listsize-1;
		val right = xs from listsize;
	in
		case left of
		[]	=> res
		|left'	=> aux (right, res@[left])
	end);
in
	fold aux [xs] []
end);
=TEX
\subsection{I/O and Formatting Utilities}
=SML
fun ⦏so_many⦎ (true:bool) (0 : int) (thing : string) : string = "No " ^ thing ^ "s"
|   so_many false (0 : int) (thing : string) : string = "no " ^ thing ^ "s"
|   so_many _ 1 (thing : string) : string = "1 " ^ thing
|   so_many _ n (thing : string) : string = string_of_int n ^ " " ^ thing ^ "s";
=TEX
=SML
fun ⦏burst⦎ (s : string) : string = "+++ " ^ s ^ " +++\n";
=TEX
=SML
fun ⦏chat⦎ (msg : string) = (output(std_out, msg));
=TEX
=SML
fun ⦏read_file⦎ ("": string) : string =
	raise SlrpError "an empty filename is not allowed for the input file"
|   read_file (file : string) = (
	let	val ip = open_in file;
		fun aux () = (
			let	val whatgot = input(ip, 512)
			in	if size whatgot = 512
				then whatgot :: aux ()
				else [whatgot]
			end
		);
		val res = implode(aux());
	in	close_in ip; res
	end	handle ex as Io _ =>
		raise SlrpError
			("i/o failure on input file: " ^ file ^ " (" ^ string_of_exn ex ^ ")")
);
=SML
local
val ⦏log_file⦎ : outstream OPT ref = ref Nil;
in
=TEX
=SML
fun ⦏open_log_file⦎ (file : string) : unit = (
	(if file <> ""
	then log_file := Value(open_out file)
	else ())
	handle ex as Io _ =>
	raise SlrpError("i/o failure on log file: " ^ file ^ " (" ^ string_of_exn ex ^ ")")
);
=TEX
=SML
fun ⦏flush_log_file⦎ () : unit = (
	case !log_file of
		Value s => ExtendedIO.flush_out s
	|	Nil => ()
	
);
=TEX
=SML
fun ⦏close_log_file⦎ () : unit = (
	case !log_file of
		Value s => close_out s
	|	Nil => ()
);
=TEX
=SML
fun ⦏log⦎ (msg : string) = (
	(case !log_file of
		Value s => output(s, msg)
	|	Nil => output(std_out, msg))
	handle ex as Io _ =>
	raise SlrpError("i/o failure on log file (" ^ string_of_exn ex ^ ")")
);
end; (* of local ... in ... end *)
=TEX
\section{THE SETS OF ITEMS CONSTRUCTION}\label{THESETSOFITEMSCONSTRUCTION}
\subsection{Types and Operations for Grammars}
The following types are used to represent grammars etc.:
=SML
type ⦏NONTERMINAL⦎ = string;
datatype ''lc ⦏SYMBOL⦎ = ⦏Terminal⦎ of ''lc | ⦏NonTerminal⦎ of NONTERMINAL;
type ''lc ⦏PRODUCTION⦎ = NONTERMINAL * (''lc SYMBOL list list);
type ''lc ⦏GRAMMAR⦎ = ''lc PRODUCTION list;
datatype ⦏SYM_CLASS⦎ =
		⦏VarClass⦎ of string
	|	⦏PuncClass⦎ of string
	|	⦏EosClass⦎ of string;
=TEX
=SML
fun ⦏expand⦎ (g : ''lc GRAMMAR) (name : NONTERMINAL) : ''lc SYMBOL list list = (
	lassoc2 g (fn _ => nil) name
);
=TEX
=SML
fun ⦏give_terms⦎ (g : ''lc GRAMMAR) : ''lc list = (
	let	fun f(Terminal a :: rest) = a :: f rest
		|   f (_ :: rest) = f rest
		|   f nil = nil;
	in	list_cup(map (fn (x, y) => (list_cup (map f y))) g)
	end
);

=TEX
\subsection{Types and Operations on Sets for Items}
We represent an item by giving the name of the associated non-terminal
the index of the alternative for that non-terminal and the index within
that alternative. In the efficient representation of grammars that we are about
to define, names of non-terminals have become integer indexes into an array:
=SML
type ⦏FNONTERM⦎ = int;
type ⦏ITEM⦎ = (FNONTERM * int * int);
type ⦏ALT⦎ = (FNONTERM * int);
=TEX
We now introduce an efficient representation of the
grammar denoted by the type $FGRAMMAR$.
=SML
datatype ''a ⦏FSYM⦎ = ⦏FTerm⦎ of ''a
	| ⦏FNonTerm⦎ of FNONTERM;
type ''a ⦏FPRODUCTION⦎ = NONTERMINAL * (''a FSYM array array);
type ''a ⦏FGRAMMAR⦎ = ''a FPRODUCTION array;
=IGN

!!!FOLLOWING IS NOT USED AT THE MOMENT BUT MAY BE USEFUL
IN A FUTURE RE-ORGANISED VERSION OF SLRP!!!

fun f_give_terms (g : ''a FGRAMMAR) = (
let	fun aux symarr (i, acc) = (
		case PPArray.sub (symarr, i) of
			FNonTerm _ => 	acc
			|FTerm x =>		acc grab x
	);
	fun aux1 symarr = fold (aux symarr) (interval 0 (length symarr - 1)) [];
	fun aux2 altarr (i, acc) =
	let	val alt = PPArray.sub (altarr, i);
	in
		aux1 alt
	end;
	fun aux3 altarr = fold (aux2 altarr) (interval 0 (length altarr - 1)) [];
	fun aux4 prodarr (i, acc) =
	let	val prod = (snd o PPArray.sub) (prodarr, i);
	in
		aux3 prod
	end;
	fun aux5 prodarr = fold (aux4 prodarr) (interval 0 (length prodarr - 1)) [];
in
	aux5 g
end);
!!!!!!
=TEX

\subsection{Sets of Items as Ordered Lists}

=SML
fun ⦏item_order⦎ (((nt1, aux1, opt1), (nt2, aux2, opt2)):ITEM*ITEM) : int = (
	if nt1 = nt2
	then
		if aux1 = aux2
		then
			if opt1 = opt2
			then
				0
			else	if opt1 < opt2
				then	~1
				else	1
		else	if aux1 < aux2
			then	~1
			else	1
	else	if nt1 < nt2
		then	~1
		else	1
);

fun ⦏item_list_order⦎ ((list1, list2):ITEM list*ITEM list) : int = (
let	val l1 = length list1;
	val l2 = length list2;
	fun aux (x1::rest1) (x2::rest2) = (
		case item_order (x1, x2) of
		0 =>	aux rest1 rest2
		|Other => Other)
	  | aux _ _ = 0;
in
	if l1 = l2
	then
		aux list1 list2
	else	if l1 < l2
		then	~1
		else	1
end);

fun ⦏merge⦎ (order:(''a*''a)->int) (xx:''a list) (yy:''a list) : ''a list = (
let	fun aux (x::xs) (y::ys) = (
		case order (x,y) of
		0 =>	x::(aux xs ys)
		| ~1 =>	x::(aux xs (y::ys))
		|_ =>	y::(aux (x::xs) ys)
	) | aux xx nil = xx
	  | aux nil (yy) = yy;
in
	aux xx yy
end);

fun xx ⦏rcup'⦎ yy = merge item_order xx yy;


fun xx ⦏rcup''⦎ yy = merge item_list_order xx yy;

fun ⦏maprcup''⦎ f = (Sort.sort (curry item_list_order)) o (map f);

fun xx ⦏rgrab'⦎ y = xx rcup' [y];

fun ⦏gen_eq⦎ (eqfn:(''a*''a)->int) (xx:''a list) (yy:''a list) : bool = (
let	fun aux (x::xs) (y::ys) = (
		case eqfn (x,y) of
		0 =>	aux xs ys
		|_ =>	false
	) | aux nil nil = true
	  | aux _ _ = false;
in length xx = length yy
	andalso aux xx yy
end);

nonfix set_eq';
val ⦏set_eq'⦎ = gen_eq item_order;
=TEX
\subsection{Converting the Grammar to an Efficient Representation}
=SML
=SML
fun ⦏nt_name⦎ (g : ''a FGRAMMAR) (nt : FNONTERM)
		: NONTERMINAL = (
	fst (PPArray.sub(g, nt))
);
=TEX
=SML
fun ⦏make_grammar⦎ (sen : NONTERMINAL)  (g : ''a GRAMMAR)
	: ''a FGRAMMAR * FNONTERM =
let	val ⦏nt_dict⦎ : FNONTERM E_DICT ref =
		ref initial_e_dict;	val sd = (nt_dict := initial_e_dict);
	val mapping = combine (map fst g) (interval 0 (bound g)) ;
	fun aux1 (s,i) = (nt_dict := e_extend s i (!nt_dict));
	val sd = map aux1 mapping;
	fun aux2 (Terminal x) = FTerm x
	  | aux2 (NonTerminal name) =
		FNonTerm (
			case e_lookup name (!nt_dict) of
			Value nt =>	nt
			| _ =>		raise SlrpError "make_grammar")
	fun aux3 rhs = map (map aux2) rhs;
	fun aux4 (nt, rhs) =
		(nt,  PPArray.arrayoflist
			(map PPArray.arrayoflist (aux3 rhs)));
	val sent = (case e_lookup sen (!nt_dict) of
		Nil => raise SlrpError "SLR_TABLES"
		|Value x => x);
in
	(PPArray.arrayoflist (map aux4 g), sent)
end;
=TEX
$f\_expand$ is a version of the function $expand$ which
works on the efficient representation of the grammar.
=SML
fun ⦏f_expand⦎ (g : ''a FGRAMMAR) (name : FNONTERM) : ''a FSYM array array = (

	snd (PPArray.sub (g, name))
);
=TEX
$f\_follower\,g\,x$ returns the symbol immediately after the dot in the item $x$
for the grammar $g$
=SML
fun ⦏f_follower⦎ (g : ''a FGRAMMAR) ((sym, alt, dot) : ITEM) : ''a FSYM = (
	PPArray.sub(PPArray.sub(f_expand g sym, alt), dot)
);
=TEX
\subsection{CLOSURE Function}
The function $closure$ is just as in \cite{Aho77}.
=SML
fun ⦏f_closure⦎ (g : ''a FGRAMMAR) (items : ITEM list) : ITEM list = (
let	fun aux1 res (FNonTerm nt) = (
	let	val newitems = map (fn i => (nt, i, 0))
		  (interval 0 (PPArray.length (f_expand g nt) - 1));
	in
		res rcup' newitems
	end) | aux1 res _ = res;
	fun aux2 res (item::more) = (
		(aux2 (aux1 res (f_follower g item)) more)
		handle _ => aux2 res more
	) | aux2 res _ = res;
	val res = aux2 items items;
in	if length res > length items
	then f_closure g res
	else res
end);
=TEX
\subsection{GOTO Function}
The function $goto$ is just as in \cite{Aho77}.
=SML
fun ⦏f_goto⦎ (g: ''a FGRAMMAR) (items : ITEM list) (sym : ''a FSYM) : ITEM list = (
let	fun aux ((item  as (name, alt, dot)):: more) = (
		(if sym = f_follower g item
		then
			(name, alt, dot+1) :: aux more
		else aux more)
		handle Any => aux more
	) | aux [] = [];
in	f_closure g (aux items)
end
);
=TEX
\subsection{ITEMS Function}
=TEX
Again $make\_items$ is as in \cite{Aho77} (under $items$). We assume the grammar is already
augmented. The sentence symbol is supplied as an additional parameter.
=SML
fun ⦏make_items⦎ (g : ''a FGRAMMAR) (sen : FNONTERM) : ITEM list list = (
let	fun aux1 (item :: more) = (
		((f_follower g item) :: aux1 more) handle _ => aux1 more
	) | aux1 [] = [];
	fun aux2 res (items' :: more) = (
		case aux1 items' of
			[] => aux2 res more
		|	xs => aux2 (res rcup'' (maprcup''
				(f_goto g items') xs)) more
	) | aux2 res [] = res;
	fun aux3 items' = (
		let	val newitems = aux2 items' items'
		in	if length newitems > length items'
			then aux3 newitems
			else items'
		end
	);
in	aux3 [f_closure g [(sen, 0, 0)]]
end);
=TEX
\section{DIAGNOSTIC UTILITIES}\label{DIAGNOSTICUTILITIES}
It is helpful to have code which attempts to explain the conflicts which
arise.

Most things here are parametrised by a grammar
and/or a function to print out lexical classes.
=SML
fun ⦏format_symbol⦎ (p : ''lc -> string) (Terminal x : (''lc) SYMBOL)
	= p x
|   format_symbol _ (NonTerminal s) = s;
=TEX
=SML
fun ⦏format_alt⦎ (g: ''lc GRAMMAR, p : ''lc -> string) (alt : string, i : int) : string = (
	if all g (fn (s,_) => s <> alt)
	then "*** INTERNAL ERROR: invalid alternative: " ^ alt ^ " ***"
	else	let	val alts = expand g alt;
			val len = length alts;
			val dots1 = if i > 0 then "... | " else "";
			val dots2 = if i < len-1 then " | ..." else "";
		in	if i < 0 orelse i >= len
			then "*** INTERNAL ERROR: invalid index ***"
			else	alt ^ " = " ^ dots1
			^	format_list (format_symbol p)(kth alts i) ", " ^ dots2
		end
);
=TEX
=SML
fun ⦏format_item⦎
	(g : ''lc GRAMMAR, p : ''lc -> string)
	((nt, alt, dot) : ITEM)
	(eff_grammar : ''lc FGRAMMAR) = (
let	val sym = nt_name eff_grammar nt;
in
	if all g (fn (s,_) => s <> sym)
	then "*** INTERNAL ERROR: invalid alternative: " ^ sym ^ " ***"
	else	let	val alts = expand g sym;
			val len = length alts;
		in	if alt < 0 orelse alt >= len
			then "*** INTERNAL ERROR: invalid item ***"
			else let	val syms = kth alts alt;
					val slen = length syms;
			in	if dot < 0 orelse dot > slen
				then "*** INTERNAL ERROR: invalid index in item ***"
				else	sym ^ " = "
					^ format_list (format_symbol p)(syms to (dot-1)) ", "
					^ (if dot = 0 then "." else
					   if dot = slen then "." else "., ")
					^ format_list (format_symbol p)(syms from dot) ", "
			end
		end
end);
=SML
fun ⦏format_state⦎(gp : ''lc GRAMMAR * (''lc -> string))
		((items, i) : ITEM list * int)
		(eff_grammar : ''lc FGRAMMAR) : string list = (
	case items of
		[] => [string_of_int i ^ ":"]
	|	[item] => [string_of_int i ^ ":\t" ^ format_item gp item eff_grammar]
	|	item :: more => string_of_int i ^ ":\t" ^ format_item gp item eff_grammar
			:: map (fn item => "\t" ^ format_item gp item eff_grammar) more
);
=TEX
=SML
fun ⦏print_grammar⦎ (p : ''lc -> string)(g : ''lc GRAMMAR) : unit = (
	let	fun fmt_alt [] = (
			"(* nothing *)"
		) | fmt_alt alt = (
			format_list (format_symbol p) alt ", "
		);
		fun fmt_prod (nt, alts) = (
			case alts of
				[] => [nt ^ " ="]
			|	[alt] => [nt ^ " =\n\t\t" ^ fmt_alt alt]
			|	alt :: more => nt ^ " =\n\t\t" ^ fmt_alt alt ^ ""
					:: map (fn alt => "\t|\t" ^ fmt_alt alt) more
		);
		fun add_semi list = (
			let	val r = rev list;
			in	rev(hd r ^ ";" :: tl r)
			end
		);
		fun do_prod prod = map (fn s => (log s; log"\n"))
				(add_semi(fmt_prod prod));
	in	map do_prod g; ()
	end
);
=SML
fun ⦏print_terms⦎ (p : ''lc -> string)(g : ''lc GRAMMAR) : unit = (
	let	val names = Sort.sort Sort.string_order (map p(give_terms g));
	in	map (fn n =>(log n; log "\n")) names; ()
	end
);
=TEX
=SML
fun ⦏print_states⦎ (gp : ''lc GRAMMAR * (''lc -> string))
		(states : (ITEM list * int) list) (eff_grammar : ''lc FGRAMMAR) : unit = (
	let	fun do1 state = (
			map (fn s => (log s; log"\n")) (format_state gp state eff_grammar)
		);
	in	map do1 states; ()
	end
);
=TEX
The following function presents an LR(0) automaton given by an action table
and a goto table as a labelled directed graph.
=SML
fun ⦏get_lr0_automaton_graph⦎
	(actions : ''lc ACTION_TABLE)
	(gotos : GOTO_TABLE)
	(init_state : STATE)
	: (STATE * (''lc SYMBOL * STATE OPT) list) list
	= (
	let	open PPArray;
		val done = array(length actions, false);
		fun do_goto_entry acc [] = rev acc
		|   do_goto_entry acc ((nt, q)::more)  =
			do_goto_entry ((NonTerminal nt, Value q) :: acc) more;
		fun do_action_entry ges acc [] = (do_goto_entry acc ges)
		| do_action_entry  ges acc ((lc, act)::more) = (
			case act of
				Shift q =>
				do_action_entry ges ((Terminal lc, Value q)::acc) more
			|	Dynamic (q, _) =>
				do_action_entry ges ( (Terminal lc, Value q)::acc) more
			|	Accept =>
				do_action_entry ges ((Terminal lc, Nil)::acc) more
			|	_ =>
				do_action_entry ges acc more
		);
		fun do_state acc [] = rev acc
		|   do_state acc (p::ps) = (
			update(done, p, true);
			let	val ges = sub(gotos, p);
				val aes = sub(actions, p);
				val new = do_action_entry ges [] aes;
				fun unwanted (Value q) = sub(done, q) orelse q mem ps
				|   unwanted Nil = true;
				val more = Sort.sort (curry (op -))
					(map force_value ((map snd new) drop unwanted));
			in	do_state ((p, new) :: acc) (ps @ more)
			end
		);
	in	do_state [] [init_state]
	end
);
=TEX
=SML
fun ⦏print_lr0_automaton_graph⦎
	(actions : ''lc ACTION_TABLE)
	(gotos : GOTO_TABLE)
	(init_state : STATE)
	(p : ''lc -> string) : unit = (
	let	val graph = get_lr0_automaton_graph actions gotos init_state;
		fun int_of_sso (Value p1) = p1
		|   int_of_sso Nil = ~1;
		fun fmt_state_opt sso = (string_of_int(int_of_sso sso));
		fun fmt_sym_state_opt (sym, po) =
			 format_symbol p sym ^ " -> " ^ fmt_state_opt po;
		fun int_of_sso (Value p1) = p1
		|   int_of_sso Nil = ~1;
		fun sso_sort ssos = (
			let	val marked = combine ssos (interval 1 (length ssos));
				fun order ((_, p1), i1) ((_, p2), i2) = (
					if	p1 <> p2
					then	int_of_sso p1 - int_of_sso p2
					else	i1 - i2
				);
			in	map fst (Sort.sort order marked)
			end
		);
		fun print1 (s, sso) = (
			log (string_of_int s); log ":\t";
			log (format_list fmt_sym_state_opt (sso_sort sso) "\n\t");
			log "\n"
		);
	in	log "\n"; log (burst "LR(0) automaton");
		log "\nStart in state "; log (string_of_int init_state); log "\n\n";
		map print1 graph; ()
	end
);
=TEX
The following function is used for formatting quoted terminal symbols in the
ML output and in lexical analysis error messages.
There is a hack which sanitises per-cent signs for {\ProductML}.
=SML
fun ⦏ml_escapify⦎ (x : string) : string = (
	let	val chars = explode x;
		fun digits n = (
			let	val ds = string_of_int n;
				val s = size ds;
			in	if	s = 1
				then	"00" ^ ds
				else if	s = 2
				then	"0" ^ ds
				else	ds
			end
		);
		fun aux acc [] = implode(rev acc)
		|   aux acc (ch :: chs) = (
			if	ch = "\\" orelse ch = "\""
			then	aux (ch::"\\"::acc) chs
			else if	ord ch < ord " "
			orelse	ord ch > 126
			orelse	(!proofpower_ml andalso ord ch = 37)
			then	aux (digits (ord ch)::"\\"::acc) chs
			else	aux (ch::acc) chs
		);
	in	aux [] chars
	end
);
=TEX
\section{SLR TABLE COMPUTATION}\label{SLRTABLECOMPUTATION}
\subsection{FIRST and FOLLOW}
The following computes the $first$ function of \cite{Aho77}.
The result is represented as an array indexed by non-terminals (for a terminal symbol
$s$ $first(s) = \{s\}$).
=SML
fun ⦏first⦎ (g : ''a FGRAMMAR) : ''a OPT list array = (
	let	(* val step1 = map (fn s => (Terminal s, [Value s])) (give_terms g); *)
		fun step1 s = [Value s];
		fun step2_aux1 alts acc  j = (
			if	j = PPArray.length alts
			then	acc
			else	let	val syms = PPArray.sub(alts, j);
				in	if	PPArray.length syms = 0
					then	step2_aux1 alts (acc rgrab Nil) (j+1)
					else	case PPArray.sub(syms, 0) of
							FTerm a =>
							step2_aux1 alts (acc rgrab Value a) (j+1)
						|	_ =>
							step2_aux1 alts acc (j+1)
				end
		);
		val num_nts = PPArray.length g;
		val result = PPArray.array(num_nts, [] : ''a OPT list);
		fun step2_aux2 i = (
			if	i = num_nts
			then	()
			else (
				PPArray.update
				(result, i, step2_aux1(snd(PPArray.sub(g, i))) [] 0);
				step2_aux2 (i+1)
			)
		);
		val step2 = step2_aux2 0;
		fun step3_aux1 alts acc j k = (
			if	j = PPArray.length alts
			then	acc
			else	let	val syms = PPArray.sub(alts, j);
				in	if	k = PPArray.length syms
					then	step3_aux1 alts (acc rgrab Nil) (j+1) 0
					else	case PPArray.sub(syms, k) of
							FNonTerm a =>
	let	val new = PPArray.sub(result, a);
	in	if	Nil mem new
		then	step3_aux1 alts (acc rcup (new less Nil)) j (k+1)
		else	step3_aux1 alts (acc rcup new) (j+1) 0
	end
						|	FTerm t =>
	step3_aux1 alts (acc rgrab (Value t)) (j+1) 0
				end

		);
 		fun step3_aux2 changed i = (
			if	i = num_nts
			then	changed
			else (	let	val old = PPArray.sub(result, i);
					val alts = snd(PPArray.sub(g, i));
					val new = old rcup step3_aux1 alts [] 0 0;
				in	PPArray.update(result, i, new);
					step3_aux2
					(changed orelse length new <> length old)
					(i+1)
				end
			)
		);
		fun step3_aux3 () = (
			let	val changed = step3_aux2 false 0;
			in	if	changed
				then	step3_aux3 ()
				else	()
			end
		);
	in	step3_aux3 (); result
	end
);
=TEX
The following computes the $FOLLOW$ function of \cite{Aho77}.
When we're constructing the SLR(1) tables, the table is most conveniently presented as an array:
=SML
fun ⦏follow⦎ (g : ''lc FGRAMMAR) (sen : FNONTERM) (eos : ''lc)
	: ''lc list array = (
	let	val first_tab = first g;
		fun first_of_sym (FNonTerm nt) = PPArray.sub(first_tab, nt)
		|   first_of_sym (FTerm lc) = [Value lc];
		fun first_syms alt k = (
			if	k =  PPArray.length alt
			then	[Nil]
			else	let	val firsts = first_of_sym(PPArray.sub(alt, k));
				in	if	Nil mem firsts
					then	(firsts less Nil) rcup first_syms alt (k+1)
					else	firsts
				end
		);
		val num_nts = PPArray.length g;
		val result = PPArray.array(num_nts, [] : ''lc list);
		fun doalt changed a alt k = (
			if	k = PPArray.length alt
			then	changed
			else (case PPArray.sub(alt, k) of
				FNonTerm b => (
					let	val oldb =PPArray.sub(result, b);
						val firstmore = first_syms alt (k+1);
						val newb = oldb rcup
							(if Nil mem firstmore
							then	PPArray.sub(result, a)
							rcup map
							 force_value(firstmore less Nil)
							else map force_value firstmore);
						val changed' = length newb <> length oldb;
					in	PPArray.update(result, b, newb);
						doalt (changed orelse changed') a alt (k+1)
					end
			) |	FTerm _ =>  doalt changed a alt (k+1)
			)
		);
		fun doprod changed a alts j = (
			if	j = PPArray.length alts
			then	changed
			else	doprod(doalt changed a (PPArray.sub(alts, j)) 0) a alts (j+1)
		);
		fun again changed i = (
			if	i = num_nts
			then	changed
			else	again (doprod changed i (snd(PPArray.sub(g, i))) 0) (i+1)
		);
		fun go () = (
			if	again false 0
			then	go()
			else	()
		);
		val _ = PPArray.update(result, sen, [eos]);
		val _ = go();
	in	result
	end
);
=TEX
When we're constructing the LALR(1) lookahead sets it turns out to be better to have the
table as a dictionary:
=SML
fun ⦏follow_dict⦎ (g : ''lc FGRAMMAR) (sen : FNONTERM) (eos : ''lc)
	: ''lc list E_DICT = (
	let	val tab = follow g sen eos;
		val indices = interval 0 (PPArray.length tab - 1);
		val sd = map (fn i => (fst(PPArray.sub(g, i)), PPArray.sub(tab, i))) indices;
	in	list_e_merge initial_e_dict sd
	end
);
=TEX

\subsection{The Table Construction}

=SML
fun ⦏slr_tables⦎ (g : ''lc GRAMMAR) (eos : ''lc) (sen : NONTERMINAL)
	: (''lc)ACTION_TABLE * GOTO_TABLE * (ITEM list * int) list *
			 ''lc FGRAMMAR * STATE = (
	let	open PPArray;
		val (g' , sent) = make_grammar sen g;
		val C = make_items g' sent;
		val n = bound C;
		val js = interval 0 n;
		val Ijs = combine C js;
		val actions = array (n+1, []:(''lc * ACTION)list);
		val gotos = array (n+1, []: (NONTERMINAL * STATE)list);
		val follow_tab = follow g' sent eos;
		fun my_follower item = (
			(Value (f_follower g' item)) handle _ => Nil
		);
		fun item_index items = (
			snd(find Ijs (fn (items', _) => set_eq' items items'))
		);
		fun make_actions items ((item as (nt, alt, dot)) :: more) = (
			case my_follower item of
				Value(a as (FTerm lc)) => (
				make_actions items more rgrab
					(lc, Shift(item_index(f_goto g' items a)))
			) |	Value _ => (make_actions items more
			) |	Nil => (
				if nt <> sent
				then let	fun f lc = (lc, Reduce((nt_name g' nt, alt), dot));
					val lcs = sub(follow_tab, nt);
				in	make_actions items more rcup map f lcs
				end else make_actions items more rgrab (eos, Accept)
			)
		) | make_actions _ _ = [];
		val non_terms = interval 0 (PPArray.length g' - 1);
		fun make_gotos items = (
			let	fun aux (nt :: more) = (
					case f_goto g' items (FNonTerm nt) of
						[] => aux more
					|	items' =>
						(nt_name g' nt, item_index items') :: aux more
				) | aux [] = [];
			in	aux non_terms
			end
		);
		val SideEffect1 =
			map (fn (items, j) =>
				PPArray.update(actions, j, make_actions items items)) Ijs;
		val SideEffect2 =
			map (fn (items, j) => PPArray.update(gotos, j, make_gotos items)) Ijs;
		val init_state = snd (find Ijs (fn (items, _) =>
					any items (fn (nt, 0, 0) => nt = sent
						|   _ => false)))
		handle Fail _ =>
		raise SlrpError
		"the sentence symbol is not in the list of items";
	in	(actions, gotos, Ijs, g', init_state)
	end
);
=TEX
\subsection{Conflict Detection}
The following function calculates whether there are any conflicts in an action table.
=SML
fun ⦏conflicts⦎  (actions : (''lc) ACTION_TABLE) :
		(''lc * STATE * (ACTION list)) list = (
	let	open PPArray;
		fun aux i ((lc, act) :: more) = (
			if any more (fn (lc', _) => lc' = lc)
			then (lc, i, act :: map snd (more drop (fn (lc', _) => lc' <> lc)))
				:: aux i (more drop (fn (lc', _) => lc' = lc))
			else aux i more
		) | aux _ [] = [];
	in	flat
			(map (fn i => aux i (PPArray.sub(actions, i)))
				(interval 0 (length actions - 1)))
	end
);
=TEX
\newpage
\section{CALCULATING LALR(1) LOOKAHEAD SETS}\label{LALRLA}
The input to the functions in this section is the output of the SLR(1) table
construction of the previous section.
I.e., we have an action table, the goto table (for non-terminal transitions),
the sets of items that the parser states represent, and the grammar in the
efficient array-based representation.
Both the action table and the goto table are represented as arrays whose
index sets are the numeric representations of the states of the parser.
To avoid recalculating it, we are also given the list of states for
which conflicts have been detected.
We follow \cite{Bermudez89} for the calculation of the LALR(1) lookahead
sets and then use them to filter out unnecessary reductions from the action
table.

Given the current structure of the overall process, there should not be any dynamic actions
in the action table at this stage, because they are only introduced if the LALR(1) calculations have
not removed all the conflicts. However, they have an obvious interpretation here and so we allow for them
in the event of future changes. There will be no error actions in the action table.

=TEX
To make the grammar more informative for the user, we include the target
state of each transition in the grammar symbols (only the source state
and edge-label are strictly needed). Thus,  we differ from \cite{Bermudez89}, by having triples
$[p:X:q]$ rather than pairs $[p:X]$. For $X$ terminal, $q$ is optional, a missing $q$ corresponds
to the accepting state. The following function computes the string representation of a non-terminal.
=SML
fun ⦏mk_stg_nonterminal⦎ ((s0 : STATE , nt : NONTERMINAL), s1 : STATE) : string  = (
	"[" ^ string_of_int s0 ^ ":" ^ nt ^ ":" ^ string_of_int s1 ^ "]"
);
=TEX
The following function takes a step along a terminal symol in an action table.
=SML
fun ⦏step_terminal⦎
	(actions : ''lc ACTION_TABLE)
	(p : STATE)
	(lc : ''lc)
	: (STATE * ''lc * STATE OPT) list = (
	let	open PPArray;
		val lc_acts = sub(actions, p);
		fun aux acc [] = rev acc
		|   aux acc ((lc', Shift q)::more) =
			aux (if lc = lc' then (p, lc, Value q)::acc else acc) more
		|   aux acc ((lc', Dynamic(q, _))::more) =
			aux (if lc = lc' then (p, lc, Value q)::acc else acc) more
		|   aux acc ((lc', Accept)::more) =
			aux (if lc = lc' then (p, lc, Nil) ::acc else acc) more
		|   aux acc (_::more) = aux acc more;
	in	aux [] lc_acts
	end
);
=TEX
The following function takes a step along a non-terminal symol in a goto table.
=SML
fun ⦏step_nonterminal⦎
	(gotos : GOTO_TABLE)
	(p : STATE)
	(nt : NONTERMINAL)
	: STATE list = (
	let	open PPArray;
		val nt_sts = sub(gotos, p);
		fun aux acc [] = rev acc
		|   aux acc ((nt', q)::more) =
			aux (if nt = nt' then q ::acc else acc) more;
	in	aux [] nt_sts
	end
);
=TEX
The following function walks along an alternative in a grammar starting at a given state and
produces the list of all paths through the LR(0) automaton starting in a given state with
a sequence of edge labels given by the symbols in the alternative. It is caller's responsibility
to supply a state/alternative pair that does actually correspond to a nonterminal transition
in the LR(0) automaton (else you will get a spurious production with an empty right-hand side
in the state transition grammar).
=SML
fun ⦏walk⦎
	(actions : ''lc ACTION_TABLE)
	(gotos : GOTO_TABLE)
	(g : ''lc FGRAMMAR)
	(s0 : STATE)
	((nt, i) : ALT)
	:((STATE * ''lc * STATE OPT)  SYMBOL list * STATE OPT) list = (
	let	open PPArray;
		val alt = sub(f_expand g nt, i);
		val len = length alt;
		fun step p k = (
			case sub(alt, k) of
				FNonTerm fnt => (
				let	val nt_sts = sub(gotos, p);
					val nt = nt_name g fnt;
					fun aux q =
					(NonTerminal(mk_stg_nonterminal((p, nt), q)), Value q);
				in	map aux (step_nonterminal gotos p nt)
				end
			) |	FTerm lc =>  (
				map
				(fn x as (_,_, q)=> (Terminal x, q))
				(step_terminal actions p lc)
			)
		);
		fun gather_step k (syms, Value q)= (
			let	val new_sqs = step q k;
			in	map
				(fn (sym, q') => (sym::syms, q'))
				new_sqs
			end
		) | gather_step _ syms_nil = [syms_nil];
		fun gather_steps k (syms_qs) = (
			if	k = len
			then	rev(map (fn (syms, q) => (rev syms, q)) syms_qs)
			else	gather_steps(k+1)  (flat(map (gather_step k) syms_qs))
		);
	in	gather_steps 0 [([], Value s0)]
	end
);
=TEX

The main step is the construction of the state transition grammar.
In this step, we also construct some auxiliary items: a dictionary
mapping non-terminals, $A$, of the original grammar to the sets of states, $p$, for which
there is a transition $[p:A:q]$ for some state $q$;
a dictionary mapping non-terminals to their integer representations in the efficent grammar
representation; the sentence symbol for the state transition grammar; and the
end of stream symbol.


=SML
fun ⦏make_transition_grammar⦎
	(actions : ''lc ACTION_TABLE)
	(gotos : GOTO_TABLE)
	(g : ''lc FGRAMMAR)
	(sen : NONTERMINAL)
	(eos : ''lc)
	(init_state : STATE)
	: (STATE * ''lc * STATE OPT) GRAMMAR *
	  STATE list E_DICT *
	  FNONTERM E_DICT *
	  NONTERMINAL *
	   (STATE * ''lc * STATE OPT) = (
	let	open PPArray;
		val b = length gotos - 1;
		val states = interval 0 b;
		fun mk_nt_triples (s0, nts_s1s) = map (fn (nt, s1) => ((s0, nt), s1)) nts_s1s;
		val nt_triples = flat(map (fn s => mk_nt_triples (s, sub(gotos, s))) states);
		fun mk_st_edict acc [] = acc
		|   mk_st_edict acc (((s, nt), _)::more) = (
			case e_lookup nt acc of
				Nil => mk_st_edict (e_enter nt [s] acc) more
			|	Value sl => mk_st_edict (e_enter nt (sl rgrab s) acc) more
		);
		val st_edict = mk_st_edict initial_e_dict nt_triples;
		val fnts = interval 0 (length g - 1);
		val nt_sdict = map
				(fn fnt => (fst(sub(g, fnt)), fnt))
					(interval 0 (length g - 1));
		val nt_edict = list_e_merge initial_e_dict nt_sdict;
		fun do_prod (s0nts1 as ((s0, nt), s1)) = (
			let	val fnt = force_value(e_lookup nt nt_edict);
				val prod = snd(sub(g, fnt));
				val nalts = length prod;
				val alts = map (fn i => (fnt, i)) (interval 0 (nalts-1));
				val my_walk = map fst o walk actions gotos g s0;
			in	(mk_stg_nonterminal s0nts1, flat (map my_walk alts))
			end
		);
		val init_triple = ((init_state, sen), ~1);
		val g' = map do_prod (init_triple::nt_triples);
		val eos_triple = (~1, eos, Nil)
	in	(g', st_edict, nt_edict, mk_stg_nonterminal init_triple, eos_triple)
	end
);
=SML
fun ⦏fmt_stg_terminal⦎
	(p : ''lc -> string)
	 (s0 : STATE, lc : ''lc, Value s1 : STATE OPT)  : string = (
	"[" ^ string_of_int s0 ^ ":" ^ p lc ^ ":" ^ string_of_int s1 ^"]"
) | fmt_stg_terminal p (s0, lc, Nil) = "[" ^ string_of_int s0 ^ ":" ^  p lc ^ ":]";
=TEX
The next step is the computation of the LALR(1) look-ahead (assuming the follow table
for the state transition grammar has already been calculated). It is caller's responsibiliity to provide an alternative
which does label a transition leading from the given state.
=SML
fun ⦏lalr_lookahead_set⦎
	(actions : ''lc ACTION_TABLE)
	(gotos : GOTO_TABLE)
	(g : ''lc FGRAMMAR)
	 (st_ed : STATE list E_DICT)
	 (nt_ed : FNONTERM E_DICT)
	(follow_tab : (STATE * ''lc * STATE OPT) list E_DICT)
	(q : STATE)
	(alt as (a, i) : NONTERMINAL * int) : ''lc list = (
	let	open PPArray;
		val fnt = force_value(e_lookup a nt_ed);
		val ps = force_value(e_lookup a st_ed) handle Fail _ => [];
		fun unwanted_state p =  (
			all
			(walk actions gotos g p (fnt, i))
			(fn (_, Value q') => q <> q' | _ => true)
		);
		val ps' = ps drop unwanted_state;
		fun collect acc  [] = flat acc
		|   collect acc (p::more) = (
			let	val p1 = snd(find(sub(gotos, p)) (fn(a', _) => a = a'));
				val name = mk_stg_nonterminal((p, a), p1);
				val lcs =	case e_lookup name follow_tab of
						Value triples => map (fn(_, lc, _) => lc) triples
					|	Nil => [];
			in	collect (lcs::acc) more
			end
		);
	in	collect [] ps' cup []
	end
);
=TEX
As a diagnostic tool, we provide a function which will calculate all of the LALR(1) lookahead sets.
This involves much more calculation than is normally required just to resolve the shift/reduce and
reduce/reduce conflicts.
=SML
fun ⦏lalr_lookahead_sets⦎
	(actions : ''lc ACTION_TABLE)
	(gotos : GOTO_TABLE)
	(g : ''lc FGRAMMAR)
	 (st_ed : STATE list E_DICT)
	 (nt_ed : FNONTERM E_DICT)
	(follow_tab : (STATE * ''lc * STATE OPT) list E_DICT)
	: ((STATE * (NONTERMINAL * int)) * ''lc list) list = (
	let	open PPArray;
		val nts = Sort.sort Sort.string_order (map fst(e_flatten nt_ed));
		fun num_alts a = (
			length(snd(sub(g, force_value(e_lookup a nt_ed))))
		);
		fun aux1 a p = (
			let	val ks = interval 0 (num_alts a - 1);
				val la = lalr_lookahead_set actions gotos g st_ed nt_ed follow_tab;
			in	map (fn i => ((p, (a, i)), la p (a, i))) ks
			end
		);
		fun aux2 acc a [] = flat (rev acc)
		|    aux2 acc a (p::ps) = (
			aux2 (aux1 a p::acc) a ps
		);
		val states = interval 0 (length gotos - 1);
		fun aux3 a = aux2 [] a states;
	in	flat (map aux3  nts)
	end
);
=TEX
=SML
fun ⦏log_lookahead_set⦎
	(_ : ''lc -> string)
	((_, []) :  (STATE * (NONTERMINAL * int)) * ''lc list) : unit = ( ()
) |  ⦏log_lookahead_set⦎
	(p : ''lc -> string)
	(((s, (nt, i)), lcs) :  (STATE * (NONTERMINAL * int)) * ''lc list) : unit = (
	log nt; log "."; log (string_of_int (i+1)); log ", "; log (string_of_int s);
	log": "; log (format_list p lcs ", ");  log "\n"
);
=TEX
=SML
fun ⦏log_lookahead_sets⦎
	(actions : ''lc ACTION_TABLE)
	(gotos : GOTO_TABLE)
	(g : ''lc FGRAMMAR)
	 (st_ed : STATE list E_DICT)
	 (nt_ed : FNONTERM E_DICT)
	(follow_tab : (STATE * ''lc * STATE OPT) list E_DICT)
	(p : ''lc -> string) : unit= (
	let	val sets = lalr_lookahead_sets actions gotos g st_ed nt_ed follow_tab;
	in	log"\n";
		log (burst "LALR(1) Lookahead Sets");
		log "\n";
		map (log_lookahead_set p) sets; ()
	end

);
=TEX
=SML
fun ⦏log_transition_grammar⦎
	(p : ''lc -> string)
	(stg : (STATE * ''lc * STATE OPT) GRAMMAR) : unit= (
	log "\n";
	log (burst "Bermudez-Logothetis State Transition Grammar");
	log "\n";
	print_grammar (fmt_stg_terminal p) stg
);
=TEX
We can now define the function which carries out the resolution of conflicts using the LALR(1) look-ahead sets.
=SML
fun ⦏lalr_resolve_conflicts⦎
	(_ : ''lc ACTION_TABLE)
	(_ : GOTO_TABLE)
	(_ : ''lc FGRAMMAR)
	(_ : NONTERMINAL)
	(_ : ''lc)
	(_ : STATE)
	([] : (STATE * ''lc) list)
	(_ : ''lc -> string)
	(false : bool)
	(false : bool) : unit = (
) | lalr_resolve_conflicts
	(actions : ''lc ACTION_TABLE)
	(gotos : GOTO_TABLE)
	(g : ''lc FGRAMMAR)
	(sen : NONTERMINAL)
	(eos : ''lc)
	(init_state : STATE)
	(confs : (STATE * ''lc) list)
	(p : ''lc -> string)
	(log_tg : bool)
	(log_la_sets : bool)  : unit = (
	let	open PPArray;
		val (g', st_ed, nt_ed, sen', eos') =
			make_transition_grammar actions gotos g sen eos init_state;
		val (fg', fsen') = make_grammar sen' g' ;
		val follow_tab = follow_dict fg' fsen' eos';
		val lc_tab = array(length actions, []:''lc list);
		val _ = map (fn (s, lc) => update(lc_tab, s, lc::sub(lc_tab, s))) confs;
		val la = lalr_lookahead_set actions gotos g st_ed nt_ed follow_tab;
		fun do_action_entry p (entry as (lc, act)) = (
			if	lc mem sub(lc_tab, p)
			then	case act of
					Reduce((a, i), _) => (
					if	lc mem la p (a, i)
					then	[entry]
					else	[]
				) |	Dynamic (q, ((a, i), j)) => (
					if	lc mem la p (a, i)
					then	[entry]
					else	[(lc, Shift q)]
				) |	_ => [entry]
			else	[entry]
		);
		fun do_state p = (
			let	val action_entries = sub(actions, p);
				val action_entries' = flat
					(map (do_action_entry p) action_entries);
			in	update(actions, p, action_entries')
			end
		);
		val conf_states = Sort.sort (curry (op-)) (map fst confs);
	in	map do_state conf_states;
		(if	log_tg
		 then	log_transition_grammar p g'
		 else ());
		(if	log_la_sets
		 then	log_lookahead_sets  actions gotos g st_ed nt_ed follow_tab p
		 else ())
	end
);
=TEX
\newpage
\section{BNF PARSER}\label{BNFPARSER}
\subsection{Action Grammars}
We need a parser for BNF.
The BNF dialect used for this
parser is an extension of a subset of the British Standard (\cite{BS6154}),
which allows fragments of ML code to be given with any alternative.
The subset is the one in which the only operators are concatenation
and alternation and in which grouping with parentheses is not allowed.
Empty alternatives are allowed.
We refer to such a grammar as an action grammar.

The concrete syntax
for action grammars is as follows:
=TEX
=GFT
	Grammar	=		Prod, `;`
			|	Prod, `;`, Grammar;

	Prod		=	Nam, `=`, Def;

	Def		=	OptAlt, OptAction | OptAlt, OptAction, `|`, Def;

	OptAlt		=	Alt |;

	Alt		=	Symbol | Symbol, `,`, Alt;

	Symbol		=	Nam | Con;

	OptAction	=	Action | ;
=TEX
The result of parsing an action grammar will be a value
whose type is an instance of the following type.
=SML
type ('lc, 'act) ⦏ACTION_GRAMMAR⦎ =
	(string * ((('lc)SYMBOL list * 'act)list)) list;
=TEX
We derive an ordinary grammar from an action grammar as follows:
=SML
fun ⦏strip_action⦎ (x : ('lc, 'act) ACTION_GRAMMAR) :  ('lc) GRAMMAR =
				map (Combinators.I ** map fst) x;
=TEX
We derive a $'act$-valued reduction table from an action grammar as follows:
=SML
type ('act) ⦏REDUCTION_DICT⦎ = ('act) PPArray.array E_DICT;
=TEX
=SML
fun ⦏make_reduction_table⦎ (ag:('lc, 'act) ACTION_GRAMMAR)
					: ('act) REDUCTION_DICT = (
	let	fun aux (nt, alts_acts) = (nt, PPArray.arrayoflist (map snd alts_acts));
	in	list_e_merge initial_e_dict (map aux ag)
	end
);
=TEX
\subsection{Implementing Action Grammars}
=TEX
The lexical categories are as follows:
=SML
datatype ⦏BNF_lex_class⦎	=	BNF_var
			|	BNF_con
			|	BNF_eq
			|	BNF_semi
			|	BNF_vert
			|	BNF_comma
			|	BNF_action
			|	BNF_eos;
=TEX
=SML
type ⦏BNF_lex_item⦎ = BNF_lex_class * string;
=TEX
=SML
val ⦏format_BNF_lex_item⦎ : BNF_lex_item -> string = snd;
=TEX
We use the following datatype for the partially parsed inputs when we parse
an action grammar.
=SML
datatype ⦏P_GRAMMAR⦎	= ⦏PG_Grammar⦎ of
			(string * ((SYM_CLASS list * string OPT)list)) list
			| ⦏PG_Prod⦎ of string * ((SYM_CLASS list * string OPT)list)
			| ⦏PG_Def⦎ of(SYM_CLASS list * string OPT) list
			| ⦏PG_OptAlt⦎ of SYM_CLASS list
			| ⦏PG_Symbol⦎ of SYM_CLASS
			| ⦏PG_OptAction⦎ of string OPT;

type ⦏RT_ENTRY⦎ =
	(BNF_lex_item, BNF_lex_class, P_GRAMMAR)INPUT_STACK->P_GRAMMAR;
=TEX
The reduction functions are as follows:
=SML
fun ⦏pdiag⦎ stk area = (
	raise PARSER_ERROR
	("invalid reduction (stack=" ^ (format_stack format_BNF_lex_item stk) ^ ")")
);
=TEX
The following batch of functions all have type $RT\_ENTRY$. However, the
ML syntax makes it awkward to put in the type constraint, so we leave it out.
=SML
fun ⦏grammar'0⦎ stk = pdiag stk "grammar'0";

fun ⦏grammar0⦎ (_ :: Parsed(PG_Prod P) :: _) = PG_Grammar [P]
|   grammar0 stk = pdiag stk "grammar0";

fun ⦏grammar1⦎ (Parsed(PG_Grammar G) :: _ :: Parsed(PG_Prod P) :: _) =
							PG_Grammar (P::G)
|   grammar1 stk = pdiag stk "grammar1";

fun ⦏prod0⦎ (Parsed(PG_Def D)::_::Token((_, V), _)::_) = PG_Prod(V, D)
|   prod0 stk = pdiag stk "prod0";

fun ⦏def0⦎ (Parsed(PG_OptAction act)::Parsed(PG_OptAlt alt)::_) =
							PG_Def[(alt, act)]
|   def0 stk = pdiag stk "def0";

fun ⦏def1⦎
	(Parsed(PG_Def D)::_::Parsed(PG_OptAction act)::Parsed(PG_OptAlt alt)::_) =
							PG_Def((alt, act)::D)
|   def1 stk = pdiag stk "def1";

fun ⦏optalt0⦎ (Parsed alt::_) = alt
|   optalt0 stk = pdiag stk "optalt0";

fun ⦏optalt1⦎ _ = PG_OptAlt [];

fun ⦏alt0⦎ (Parsed(PG_Symbol S)::_) = PG_OptAlt [S]
|   alt0 stk = pdiag stk "alt0";

fun ⦏alt1⦎ (Parsed(PG_OptAlt alt)::_::Parsed(PG_Symbol S)::_) = PG_OptAlt (S::alt)
|   alt1 stk = pdiag stk "alt1";

fun ⦏symbol0⦎ (Token((_, V), _)::_) = PG_Symbol(VarClass V)
|   symbol0 stk = pdiag stk "symbol0";

fun ⦏symbol1⦎ (Token((_, V), _)::_) = PG_Symbol(PuncClass V)
|   symbol1 stk = pdiag stk "symbol1";

fun ⦏optaction0⦎ (Token((_, V), _)::_) = PG_OptAction (Value V)
|   optaction0 stk = pdiag stk "optaction0";

fun ⦏optaction1⦎ (_) = PG_OptAction Nil;

=TEX
The following value bindings help to abbreviate the
description of the grammar. We think of the
terminals $NonTerminal$ and $Terminal$ as variables
and constants in the notation below.
=SML
local
val ⦏Grammar⦎ = NonTerminal "Grammar";
val ⦏Prodn⦎ = NonTerminal "Prod";
val ⦏Nam⦎ = Terminal BNF_var;
val ⦏Def⦎ = NonTerminal "Def";
val ⦏Alt⦎ = NonTerminal "Alt";
val ⦏Symbol⦎ = NonTerminal "Symbol";
val ⦏Con⦎ = Terminal BNF_con;
val ⦏OptAction⦎ = NonTerminal "OptAction";
val ⦏OptAlt⦎ = NonTerminal "OptAlt";
val ⦏Action⦎ = Terminal BNF_action;
=TEX
We can now write down the agumented grammar for our BNF subset together with the
reduction table entries:
=SML
in
val ⦏BNF_action_grammar⦎ : (BNF_lex_class, RT_ENTRY) ACTION_GRAMMAR = [
	("Grammar'", ([Grammar], grammar'0) :: nil),
	("Grammar", ([Prodn, Terminal BNF_semi], grammar0)
		:: ([Prodn, Terminal BNF_semi, Grammar], grammar1) :: nil),
	("Prod", ([Nam, Terminal BNF_eq, Def], prod0) :: nil),
	("Def", ([OptAlt, OptAction], def0) ::
		([OptAlt, OptAction, Terminal BNF_vert, Def], def1) :: nil),
	("OptAlt", ([Alt], optalt0) :: ([], optalt1):: nil),
	("Alt", ([Symbol], alt0) :: ([Symbol, Terminal BNF_comma, Alt], alt1):: nil),
	("Symbol", ([Nam], symbol0) :: ([Con], symbol1) :: nil),
	("OptAction", ([Action], optaction0) :: ([], optaction1) :: nil)
];
val ⦏BNF_reduction_table⦎
		: (BNF_lex_item, BNF_lex_class, P_GRAMMAR) REDUCTION_TABLE
		= make_reduction_table BNF_action_grammar;
val ⦏BNF_grammar⦎ : (BNF_lex_class)GRAMMAR = strip_action BNF_action_grammar;
end;
=TEX
Once we have coded the lexical analyser for our action grammar concrete syntax
it will be easy to use the above functions to make an SLR(1) parser for
the input to our parser generator.
We adopt the convention that the first production in the grammar gives
the sentence symbol.
The resulting parser will compute
a value of type $P\_GRAMMAR$. Such a value may be used to compute a
grammar and a reduction table as follows (where from now on we
use a standard ``impossible'' non-terminal as a sentence symbol to augment
the grammar):
=SML
val ⦏sentence_symbol⦎ : string ="*Start*";
val ⦏sentence_action⦎ : string OPT = Value "(raise PARSER_ERROR\"invalid control\")";
=TEX
=SML
fun ⦏make_grammar_and_reduction_table⦎
	(PG_Grammar(G as ((sen,_)::_)) : P_GRAMMAR)
	: SYM_CLASS GRAMMAR * string OPT REDUCTION_DICT = (
	let	val G' =  (sentence_symbol, [([VarClass sen], sentence_action)])::G;
		val nts = map fst G';
		fun make_sym(PuncClass s) = Terminal (PuncClass s)
		|   make_sym(VarClass s) =
			if s mem nts
			then NonTerminal s
			else Terminal(VarClass s)
		| make_sym (EosClass s) = Terminal (EosClass s);
		val Y = map (fn(x, y) => (x, map (fn (a,b) =>(map make_sym a, b)) y)) G';
		fun folder((def, alts), g) = g overwrite (def, lassoc4 g nil def @ alts);
		val AG = revfold folder Y nil;
	in	(strip_action AG, make_reduction_table AG)
	end
) | make_grammar_and_reduction_table _ = raise SlrpError "invalid argument";
=TEX
\subsection{Lexical Analyser}
=TEX
Quotes in our concrete syntax for BNF are introduced by the backquote character, \verb"`"
and backslashes serve as escapes. These are needed later on so they are defined here
outside the local block containing the bulk of the lexical analyser.
=SML
    val ⦏quoter⦎ : string = "`";
    val ⦏escape⦎ : string = "\\";
=TEX
\subsection{Local Definitions}
Most of the lexical analyser is declared within this local block.
=SML
local

    exception ⦏LexFail⦎ of string;
=TEX
We maintain by side-effect a line counter for use in syntax error reports:
=SML
	val line_number : int ref = ref 1;
=TEX
A state, $lex\_state$, is used by most of the lexical analysis
functions, it is in two parts.  First the characters not yet tokenised,
actually a list of strings of single characters produced by exploding
the input text.  Second the token immediately preceeding the first
part.  The token may not be recognised (yet) so the token part of the
state carries a success indicator.  On entry to an analysis function
the state will be ``$(chars, (UNKNOWN, \hbox{``''}))$''.
=SML
    datatype ⦏success⦎ = ⦏KNOWN⦎ of BNF_lex_class | ⦏COMMENT⦎ | ⦏UNKNOWN⦎;

    type ⦏token⦎ = success * string;

    type ⦏lex_state⦎  = (string list) * token;
=TEX
$collect$ adds the first character of the untokenised input text into the current token.
=SML
    fun ⦏collect⦎ ( (cs, (cl, tk)) : lex_state ) : lex_state = (
        (tl cs, (cl, tk ^ (hd cs)))
    );
=TEX
The terminator characters for BNF are the following:
=SML
    val ⦏terminators⦎ : (string * BNF_lex_class) list =
	[(";", BNF_semi), ("=", BNF_eq), ("|", BNF_vert), (",", BNF_comma)];
=TEX
We lift some material here that was originally in the lexical analyser (and is still used there).
=TEX
=SML
    val ⦏ord0⦎	= ord "0";
    val ⦏ord9⦎	= ord "9";
    val ⦏orda⦎	= ord "a";
    val ⦏ordA⦎	= ord "A";
    val ⦏ordz⦎	= ord "z";
    val ⦏ordZ⦎	= ord "Z";
=SML
    fun ⦏next_is_digit⦎ ((ch :: _): string list) : bool = (
        let
            val code = ord ch
        in
            (code >= ord0) andalso (code <= ord9)
        end
    ) | next_is_digit nil = false;
=TEX
We allow underscores and primes in names by treating them as letters:
=SML
    fun ⦏next_is_alpha⦎ ((ch :: _): string list) : bool = (
        let
            val code = ord ch
        in
            ((code >= orda) andalso (code <= ordz)) orelse
            ((code >= ordA) andalso (code <= ordZ)) orelse
            (ch = "_") orelse (ch = "'")
        end
    ) | next_is_alpha nil = false;
=TEX
=SML
    fun ⦏next_is_term⦎ (ch :: _) = any terminators (fn (c,_) => c = ch)
    |   next_is_term _ = false;

    fun ⦏next_is_quoter⦎ (ch :: _) = ch = quoter
    |   next_is_quoter _ = false;

    fun ⦏next_is_space⦎ (" " :: _) = true
    |   next_is_space ("\t" :: _) = true
    |   next_is_space ("\n" :: _) = true
    |   next_is_space _ = false;

    fun ⦏next_is_lbrack⦎ ("(" :: _) = true
    |   next_is_lbrack _ = false;

    fun ⦏next_is_rbrack⦎ (")" :: _) = true
    |   next_is_rbrack _ = false;

    fun ⦏check_eoln⦎  ("\n"::cs : string list) : string list = (
	line_number := !line_number + 1;
	cs
    ) | check_eoln cs = cs;
=TEX
=SML
fun ⦏skip_space⦎ ("\n":: cs : string list) : string list = (
	line_number := !line_number + 1;
	skip_space cs
) | skip_space (cs : string list) : string list = (
	if next_is_space cs
	then (skip_space (tl cs))
	else cs
);
=TEX
Comments are enclosed in ``(*'' and ``*)''
=SML
	fun next_is_lcomment("(" :: "*" :: _) = true
	|   next_is_lcomment _ = false;

	fun next_is_rcomment("*" :: ")" :: _) = true
	|   next_is_rcomment _ = false;

     fun ⦏next_is_other⦎ (cs as (_ :: _) : string list) = (
        (not (next_is_term cs)) andalso
        (not (next_is_space cs)) andalso
        (not (next_is_digit cs)) andalso
        (not (next_is_alpha cs)) andalso
        (not (next_is_lcomment cs)) andalso
        (not (next_is_rcomment cs)) andalso
        (not (next_is_quoter cs))
    ) | next_is_other nil = false;
=TEX
To perform the analysis a number of recognisers of tokens are provided,
they are tried in turn on the input characters until one of them
recognises one of more of the input characters as a token.  Those
characters are then removed, classified and added to the output list of
tokens.  Then the recognisers are applied to the remaining input, and
so on until there is no more input.

Function $rec_alphanum_rest$ recognises a list of alpha numerics, it is
an auxiliary for the other recognisers.
=SML
    fun ⦏rec_alphanum_rest⦎ (cs, tok) = (
	if next_is_alpha cs orelse next_is_digit cs
	then rec_alphanum_rest (collect (cs, tok))
	else (cs, tok)
    );

    fun ⦏rec_terminator⦎ ( (cs, tk) : lex_state ) : lex_state = (
        if next_is_term cs
        then (tl cs, (KNOWN(lassoc3 terminators (hd cs)), hd cs))
        else (cs, (UNKNOWN, ""))
    );
=TEX
=SML
    fun ⦏rec_identifier⦎( (cs, tok) : lex_state ) : lex_state = (
	if next_is_alpha cs
	then rec_alphanum_rest (tl cs, (KNOWN BNF_var, hd cs))
	else (cs, tok)
    );
=TEX
A string starts and finishes with $quoter$.

Within a string the escape character `$\backslash$' may be used to
provide characters not normally available.
Unescaped newlines  in strings are ignored.
The escape character `$\backslash$' is therefore only needed for itself and
the start quote character and for newlines.
=SML
    fun ⦏rec_quote⦎ ( (cs, (_, tk)) : lex_state ) : lex_state = (
        let
            fun rec_quote_rest qtch (cs, tok) = (
		case check_eoln cs of
		("\\" :: (t as (_ :: rest))) => (
			check_eoln t; (* just for side-effect *)
			rec_quote_rest qtch (collect (t, tok))
		) | ("\\" :: _) =>
			raise (LexFail "escaped character at end of string")
		| cs' as (ch :: rest) =>
			if (ch = qtch)
			then (rest, tok)
			else rec_quote_rest qtch (collect (cs', tok))
		| _ => raise (LexFail "unmatched quote")
            );
        in
            if next_is_quoter cs
            then rec_quote_rest(hd cs) (tl cs, (KNOWN BNF_con, ""))
            else (cs, (UNKNOWN, ""))
        end
    );
=TEX
Actions are distinguished by their starting with a left bracket and are
finished by the matching right bracket.
=SML
    fun ⦏rec_action_rest⦎ i (cs, tok) = (
	check_eoln cs; (* just for the line-numbering side-effect *)
	if next_is_lbrack cs
	then rec_action_rest (i+1) (collect (cs, tok))
	else if next_is_rbrack cs
	then	if i <= 0
		then (collect (cs, tok))
		else rec_action_rest (i-1) (collect (cs, tok))
	else if not (is_nil cs)
	then rec_action_rest i (collect(cs, tok))
	else raise (LexFail "unmatched left bracket")
    );
=TEX
=SML
    fun ⦏rec_action⦎ (cs, tok) = (
	if next_is_lbrack cs
	then rec_action_rest 0 (tl cs, (KNOWN BNF_action, hd cs))
	else (cs, (UNKNOWN, ""))
    );
=TEX
=TEX
Left and right comment symbols must balance. $rec\_comment\_rest$ arranges for this:
=SML
   fun ⦏rec_comment_rest⦎ i cs = (
	let	val cs' = skip_space cs;
	in	if next_is_lcomment cs'
		then rec_comment_rest (i+1) (tl(tl cs'))
		else if next_is_rcomment cs'
		then	if i <= 0
			then (tl(tl cs'), (COMMENT, ""))
			else rec_comment_rest (i-1) (tl(tl cs'))
		else if not (is_nil cs')
		then rec_comment_rest i (tl cs')
		else raise (LexFail "unmatched comment symbol")
	end
    );
=TEX
=SML
    fun ⦏rec_comment⦎ (cs, tok) = (
	if next_is_lcomment cs
	then rec_comment_rest 0 (tl(tl cs))
	else (cs, (UNKNOWN, ""))
    );
=TEX
Function $next\_token$ applies recogniser functions to the input
characters, returning the results of the first successful recogniser,
or an indicator of token unknown.
=SML
    fun ⦏next_token⦎ (recognisers : (lex_state -> lex_state) list)
                   (chars       : string list) : lex_state = (
        let
            fun try (recogniser : lex_state -> lex_state,
                     (cs, (cl, tk)) : lex_state) : lex_state = (case cl of
            UNKNOWN => recogniser(cs, (cl, tk))
          |  _ => (cs, (cl, tk))
    );
        in
            revfold try recognisers (chars, (UNKNOWN, ""))
        end
    );
=TEX
Function $tokenise$ converts the input characters into tokens by
repeatedly using $next\_token$ to identify the start of the remaining
part of the input.
=SML
    fun ⦏tokenise⦎ (recognisers : (lex_state -> lex_state) list)
                 (chars       : string list) : BNF_lex_item list = (
       case skip_space chars
       of
           nil => nil
       |   cs as (_::_) => (
           let
               val (cs', tk) = next_token recognisers cs;
           in
               case tk of
                   (KNOWN cls, tk) => (cls, tk):: tokenise recognisers cs'
	      |	   (COMMENT, _) => tokenise recognisers cs'
              |    (UNKNOWN, tk) =>  raise LexFail
			("did not recognise: \"" ^ ml_escapify (hd cs') ^ "\"")
           end
       )
    );
=TEX
The various recognisers are gathered together in their order of application.
=SML
    val ⦏recognisers⦎ = [rec_terminator,
                       rec_quote,
                       rec_identifier,
			rec_comment,
			rec_action];
=TEX
We allow for MS-DOS and Macintosh input by mapping to UNIX line-endings:
=SML
fun ⦏unix_eolns⦎ (acc:string list) ([] : string list) : string list = rev acc
|   unix_eolns acc ("\r" :: "\n" ::more) = unix_eolns ("\n"::acc) more
|   unix_eolns acc ("\r"  ::more) = unix_eolns ("\n"::acc) more
|   unix_eolns acc (ch::more) = unix_eolns (ch::acc) more;
=SML
in
=TEX
The interface to the lexical analyser is the following function.
=SML

    fun ⦏BNF_lex_string⦎ (text : string) : BNF_lex_item list = (
	(tokenise recognisers (unix_eolns [] (explode text)))
	handle (LexFail msg) => (
            raise SlrpError
	("Lexical analysis error on or near line number " ^
	 string_of_int (!line_number) ^
	 ": " ^ msg)
        )
    );
=TEX
That completes the lexical analyser:
=SML
end; (* of local ... in ... end *)
=TEX
\subsection{Parser Auxiliaries}
=SML
val ⦏BNF_classify⦎ : BNF_lex_item -> BNF_lex_class = fst;
=TEX
=SML
=SML
val ⦏BNF_error⦎ : (BNF_lex_item, BNF_lex_class, 'a, 'b) ERROR_ROUTINE = (
	fn (tok, stk, _, _) =>
	let	val do_tok = format_BNF_lex_item;
		val msg =
			if	any stk (fn Token _ => true | _ => false)
			then	do_tok tok ^ " not expected after: " ^ format_stack do_tok stk
			else	do_tok tok ^ " not expected here";
	in	raise SlrpError ("Syntax error: " ^ msg)
	end
);
=TEX
=SML
val ⦏BNF_end_of_string⦎ : BNF_lex_item = (BNF_eos, "<End-of-Input>");
=TEX
=SML
fun ⦏BNF_reader⦎ (toks : BNF_lex_item list) : BNF_lex_item  * BNF_lex_item list = (
	case toks of
		(h :: more) => (h, more)
	|	[] => (BNF_end_of_string, [])
);
=TEX
=SML
val (⦏BNF_actions⦎, ⦏BNF_gotos⦎, ⦏BNF_Ijs⦎, ⦏BNF_effgrammar⦎, ⦏BNF_init⦎) =
					slr_tables BNF_grammar BNF_eos "Grammar'";
=TEX
The grammar has no conflicts so we may safely use the default
resolver to form a parser, which we set up to take its input from a file:
=SML
fun ⦏BNF_parse⦎
	(file : string)
	: SYM_CLASS GRAMMAR * string OPT REDUCTION_DICT =
	make_grammar_and_reduction_table(
		slrp'parse
		BNF_init BNF_actions BNF_gotos BNF_reduction_table default_resolver
		BNF_classify BNF_error  BNF_reader
		(BNF_lex_string(read_file file)));
=TEX
The following function is used for formatting quoted terminal symbols in listings:
=SML
fun ⦏escapify⦎  (x : string) : string = (
	let	val chars = explode x;
		fun aux acc [] = implode(rev acc)
		|   aux acc (ch :: chs) = (
			if	ch = quoter orelse ch = escape
			then	aux (ch::escape::acc) chs
			else	aux (ch::acc) chs
		);
	in	aux [] chars
	end
);
=TEX
The formatter for $sym\_class$ values is the following:
=SML
fun ⦏format_sym_class⦎ (VarClass v) = v
|   format_sym_class (EosClass e) = e
|   format_sym_class (PuncClass p) = "`" ^ escapify p ^ "`";
=TEX
\section{CONFLICT RESOLUTION}\label{CONFLICTRESOLUTION}
=TEX
To resolve a reduce/reduce conflict we need to choose an alternative in
the list of possible alternatives by which to reduce. We choose
the one which appears earliest in the grammar.

There is also a possibility of an accept/reduce conflict, which we treat as a kind of
reduce/reduce conflict.  This occurs e.g., for the grammar containing the single
production $S = S;$. Accept/shift conflicts are not possible, since {\em(a)} an accept
is only every generated for the end-of-sentence terminal, and {\em(b)} a shift on a terminal
$t$ is only generated when there is some item $\alpha.t\beta$ in the actual grammar
(not the augmented grammar) so that $t$ cannot be the end-of-sentence terminal.
To give the right (non-terminating) semantics to a parser for grammars such
as $S = S;$, accept should also lose in an accept/reduce conflict.

The following function which resolves reduce/reduce and accept/reduce conflicts
assumes there are actually some conflicts to resolve (and would raise an acception if the
supplied actions did not contain any reduce conflicts).
=SML
fun ⦏resolve_reduce_reduce⦎ (g : ('lc)GRAMMAR) (acts : ACTION list) : ACTION list = (
	let	fun folder
			(x2 as Reduce(((nt2, alt2), _)), x1 as Reduce(((nt1, alt1), _))) = (
			let	fun index nt i ((nt', _)::more) = (
					if nt = nt'
					then i
					else index nt (i+1) more
				) | index _ _ [] = raise SlrpError "invalid non-terminal";
				val (i1, i2) = (index nt1 0 g, index nt2 0 g);
			in	if i1 = i2
				then	if alt1 <= alt2
					then x1
					else x2
				else if i1 <= i2
				then x1
				else x2
			end
		) | folder (x1, _) = x1;
		val winner = fold folder acts (find acts (fn Reduce _ => true | _ => false));
	in	acts less Accept drop (fn (x as (Reduce _)) => x <> winner | _ => false)
	end	handle Fail _  => acts
);
=TEX
After resolving reduce/reduce conflicts only shift/reduce conflicts
with a single shift and a single reduce will remain (the SLR(1) algorithm
cannot produce shift/shift conflicts).
The shift/reduce conflicts are replaced by dynamic actions
and we shout loudly when we do this.

The following functions are used to do the shouting:
=SML
fun ⦏format_action⦎ (gp : (''lc) GRAMMAR * (''lc -> string)) (act : ACTION) : string = (
	case act of
		Accept => "Accept"
	|	Error => "Error"
	|	Shift i => "Shift to " ^ string_of_int i
	|	Reduce(alt, _) => "Reduce by " ^ format_alt gp alt
	|	Dynamic (i, (alt, _)) => "Either shift to " ^ string_of_int i
					^ " or reduce by " ^ format_alt gp alt
);
=TEX
=SML
fun ⦏print_actions⦎ (put : string -> unit)
	(gp as (_, p) : (''lc) GRAMMAR * (''lc -> string))
	(lc : ''lc, s : STATE, acts : ACTION list) : unit = (
	put("State " ^ string_of_int s ^ " on symbol " ^ p lc ^ "\n");
	map put (alpha_sort(map(fn act => ("\t" ^ format_action gp act ^ "\n")) acts));
	()
);
=TEX
=SML
fun ⦏print_action_table⦎ (put : string -> unit)
	(gp as (_, p) : (''lc) GRAMMAR * (''lc -> string))
	(actions : (''lc)ACTION_TABLE) : unit = (
	let	open PPArray;
		fun aux1 i ((lc, act) :: more) = (
			(lc, i, act :: map snd (more drop (fn (lc', _) => lc' <> lc)))
				:: aux1 i (more drop (fn (lc', _) => lc' = lc))
		) | aux1 _ [] = [];
		val actionl = flat(map (fn i => aux1 i (PPArray.sub(actions, i)))
			(interval 0 (length actions - 1)));
	
	in map (print_actions put gp) actionl; ()
	end
);
=TEX
=SML
fun ⦏print_conflicts⦎ (put : string -> unit)
	(gp as (_, p) : (''lc) GRAMMAR * (''lc -> string))
	(confs : (''lc * STATE * (ACTION list)) list) : unit = (
	map (print_actions put gp) confs; ()
);
=TEX
=SML
fun ⦏print_dynamic_actions⦎ (put : string -> unit)
	(gp as (_, p) : (''lc) GRAMMAR * (''lc -> string))
	(actions : (''lc)ACTION_TABLE) : unit = (
	let	open PPArray;
		fun aux1 i ((lc, act as Dynamic _) :: more) = (
			(lc, i, [act]) :: aux1 i more
		) | aux1 i ((_, _)::more) = ( aux1 i more
		) | aux1 _ [] = [];
		val actionl = flat(map (fn i => aux1 i (PPArray.sub(actions, i)))
			(interval 0 (length actions - 1)));
	
	in map (print_actions put gp) actionl; ()
	end
);
=TEX
Recall that we treat an accept/reduce conflict as a kind of reduce/reduce conflict.
=SML
fun ⦏has_rr⦎ (Reduce _ :: more : ACTION list) : bool = (
	any more (fn Reduce _ => true | Accept => true | _ =>  false)
) | has_rr (Accept :: more ) = (
	any more (fn Reduce _ => true | Accept => true | _ =>  false) orelse has_rr more
) | has_rr (_ :: more) = has_rr more
|   has_rr [] = false;
=TEX
=SML
fun ⦏has_sr⦎ (Reduce _ :: more : ACTION list) : bool = (
	any more (fn Shift _ => true |_ =>  false)
) | has_sr (Shift _ :: more : ACTION list) : bool = (
	any more (fn Reduce _ => true |_ =>  false)
) | has_sr (_ :: more ) = has_sr more
|   has_sr [] = false;
=TEX
=SML
fun ⦏conflict_summary⦎ (confs : ('lc * STATE * ACTION list) list) : string = (
	let	val tot = length confs;
		val rrs = count confs (fn (_, _, acts) => not(has_sr acts));
		val srs = tot - rrs;
	in	(so_many true tot "conflict" ^ " detected") ^
		(if tot <> 0
		then ((" (" ^ string_of_int srs ^ " shift/reduce, "
			^ string_of_int rrs ^ " reduce/reduce)"))
		else "") ^ "\n"
	end
);
=TEX
=SML
fun ⦏resolve_either⦎(g : ('lc)GRAMMAR) (acts : ACTION list) : ACTION = (
	let	val acts' = if has_rr acts then resolve_reduce_reduce
			g acts else acts;
	in	case acts' of
			[(act1 as Reduce x), (act2 as Shift s)] => Dynamic(s, x)
		|	[(act1 as Shift s), (act2 as Reduce x)] => Dynamic(s, x)
		|	[act] => act
		|	other => raise SlrpError "failure in conflict resolution"
	end
);
=TEX
=SML
fun ⦏resolve_conflicts⦎ (g : (''lc)GRAMMAR) (actions : (''lc)ACTION_TABLE) : unit = (
	let	fun aux(lc, s, acts) = (
			let	val old = PPArray.sub(actions, s);
				val act = resolve_either g acts;
				val new = old drop (fn (lc', _) => lc = lc');
			in	PPArray.update(actions, s, new overwrite (lc, act))
			end
		);
	in	case conflicts actions of
			[] => ()
		|	todo => (map aux todo; ())
	end
);
=TEX
\section{OTHER CHECKS}\label{OTHER CHECKS}
In addition to the other checks carried out as part of the parser
generation, we also have some other checks.

The following function checks for non-terminals that aren't
linked into the grammar. These are ones other than the sentence symbol of
the augmented grammar that don't appear in the goto table.
=SML
fun ⦏orphans⦎ (g : ''lc GRAMMAR) (gotos : GOTO_TABLE) : NONTERMINAL list = (
	let
		fun aux1 d ((nt, s) ::more) = aux1(e_enter nt s d) more
		|   aux1 d _ = d;
		fun aux2 d i = (
			if	i = PPArray.length gotos
			then	d
			else	aux2 (aux1 d (PPArray.sub(gotos, i))) (i+1)
		);
		val dict = e_enter sentence_symbol 0 (aux2 initial_e_dict 0);
		val orphan_nts = map fst g drop (fn a => not(is_Nil(e_lookup a dict)));
	in	Sort.sort Sort.string_order orphan_nts
	end
);
=TEX
The following computes the set of non-terminals which generate an empty language.
=SML
fun ⦏empty_non_terminals⦎ (g : ''lc FGRAMMAR)
	: NONTERMINAL list = (
	let	val num_nts = PPArray.length g;
		val non_empty = PPArray.array(num_nts, false);
		fun doalt changed a alt k = (
			if	k = PPArray.length alt
			then	(PPArray.update(non_empty, a, true); true)
			else case PPArray.sub(alt, k) of
				FNonTerm b => (
					if	PPArray.sub(non_empty, b)
					then	doalt changed a alt (k+1)
					else	changed
			) |	FTerm _ => (
					 doalt changed a alt (k+1)
			)
		);
		fun doprod changed a alts j = (
			if	j = PPArray.length alts
			then	changed
			else if	PPArray.sub(non_empty, a)
			then	changed
			else	doprod(doalt changed a (PPArray.sub(alts, j)) 0) a alts (j+1)
		);
		fun again changed i = (
			if	i = num_nts
			then	changed
			else	again (doprod changed i (snd(PPArray.sub(g, i))) 0) (i+1)
		);
		fun go () = (
			if	again false 0
			then	go()
			else	()
		);
		val _ = go();
		fun extract_result acc 0 = acc
		|   extract_result acc i = (
			if	PPArray.sub(non_empty, i)
			then	extract_result acc (i-1)
			else	extract_result (fst(PPArray.sub(g, i))::acc) (i-1)
		);
	in	extract_result [] (num_nts - 1)
	end
);
=TEX
\section{OUTPUT ROUTINES}\label{OUTPUTROUTINES}
=SML
local
val ⦏out_file⦎ : outstream ref = ref std_out;
val ⦏cursor⦎ : int ref = ref 0;
in
=TEX
=SML
fun ⦏open_out_file⦎ (file : string) : unit = (
	(if file <> ""
	then out_file := open_out file
	else raise SlrpError "an empty filename is not allowed for the output file")
	handle ex as Io _ =>
	raise SlrpError("i/o failure on output file: " ^ file ^ " (" ^ string_of_exn ex ^ ")")
);
=TEX
=SML
fun ⦏close_out_file⦎ () : unit = (
	close_out (!out_file)
);
=TEX
We provide one-level save/restore for
=INLINEFT
out_file
=TEX
\ .
=SML
val saved_out_file : outstream ref = ref std_out;

fun ⦏save_out_file⦎ () : unit = (
	saved_out_file := !out_file
);

fun ⦏restore_out_file⦎ () : unit = (
	out_file := !saved_out_file
);
=TEX
=SML
fun ⦏put_string⦎ (s:string):unit = ((
	let	val len = size s;
		val next = !cursor + len;
	in	if next <= 80
		then (
			output(!out_file, s);
			cursor := next
		) else (
			output(!out_file, "\n");
			output(!out_file, s);
			cursor := size s
		)
	end
)	handle ex as Io _ =>
	raise SlrpError("i/o failure on output file (" ^ string_of_exn ex ^ ")")
);
fun ⦏put_line⦎ (s:string):unit = ((
	output(!out_file, s);
	output(!out_file,"\n");
	cursor := 0
)	handle ex as Io _ =>
	raise SlrpError("i/o failure on output file (" ^ string_of_exn ex ^ ")")
);
end; (* of local ... in ... end *)
=SML
fun ⦏put_list⦎ (sep : string) (s : string list) = (
	case s of
		x :: [] => put_string x
	|	x :: more => (put_string x; put_string sep; put_list sep more)
	|	[] => ()
);
=TEX
\subsection{Initial State}
=SML
fun ⦏output_initial_state⦎ (init : int) : unit = (
	put_line ("val slrp'initial_state = " ^ string_of_int init ^ ";")
);
=TEX
\subsection{Action Table}
=SML
fun ⦏format_action_entry⦎ (p : ''lc -> string) (lc : ''lc, act : ACTION) : string = (
	"(" ^ p lc ^ "," ^ (
		case act of
			Shift s => (
				"Shift " ^ string_of_int s
		) |	Reduce ((nt, alt), n) => (
				"Reduce((\"" ^ nt ^ "\"," ^ string_of_int alt
				^	"),"^string_of_int n ^ ")"
		) |	Dynamic (s, ((nt, alt), n)) => (
				"Dynamic(" ^ string_of_int s ^ "," ^
				"((\"" ^ nt ^ "\"," ^ string_of_int alt ^ "),"^
				string_of_int n ^ "))"
		) |	Error => ("Error"
		) |	Accept => ("Accept"
		)
	) ^ ")"
);
=TEX
=SML
fun ⦏output_action_entry_list⦎(p : ''lc -> string) (entries : (''lc * ACTION) list) : unit = (
	put_string "[";
	put_list "," (map (format_action_entry p) entries);
	put_string "]"
);
=TEX
The following functions are used to output the code to generate the action,
goto and reduction tables.
Given e.g.,
=GFT
	lists = [ [a, b], [c, d], [e] ]
	stem = "slrp'x"
	result = "slrp'array"
=TEX
The code generated by $output\_table$ will be:
=GFT
local
val slrp'x3=[e];
val slrp'x2=[c, d]@slrp'x3;
val slrp'x1=[a, b]@slrp'x2;
in
val slrp'array=PPArray.arrayoflist slrp'x1;
end;
=TEX
where the insides of the list expressions $[e]$, $[c, d]$ etc. are
output using $do1list$.
To get round the value polymorphism restriction in the case of the reduction tables
we need to defer actual construction of the values.
=TEX
=SML
fun output_loc_bindings
	(lists : 'a list)
	(do1list : 'a -> unit)
	(stem : string) (defer : bool) : unit = (
let	val nentries = length lists;
	val ns_lists = rev (combine (interval 1 nentries) lists);
	fun lvar i = stem ^ (string_of_int i);
	fun do_loc_binding (i, tab) = (
		put_string (if defer then "fun "^(lvar i)^ "()=[" else "val "^(lvar i)^"=[");
		do1list tab;
		if	i = nentries
		then	put_line "];"
		else	put_line ("]@" ^ lvar (i+1) ^ (if defer then "();" else ";"))
	);
in	map do_loc_binding ns_lists;
	()
end	
);
=TEX
=SML
fun output_table
	(lists : 'a list)
	(do1list : 'a -> unit)
	(stem : string)
	(result : string) : unit = (
let		fun do_glob_binding() = (
		put_string ("val " ^ result ^ "=PPArray.arrayoflist ");
		put_line (stem ^ string_of_int 1 ^ ";")
	);
in	put_line "local";
	output_loc_bindings lists do1list stem false;
	put_line "in";
	do_glob_binding();
	put_line "end;"
end	
);
=TEX
=SML
fun ⦏output_action_table⦎ (p : ''lc -> string) (actions : (''lc)ACTION_TABLE) : unit = (
let	val tabs = listsofarray actions (get_int_control"slrp_break");
	fun aux (x :: []) = output_action_entry_list p x
	  | aux (x :: more) = (output_action_entry_list p x; put_string ","; aux more)
	  | aux [] = ();

in	output_table tabs aux "slrp'a" "slrp'actions"
end
);
=TEX
=SML
fun ⦏do_sym_class⦎ (generic : bool) (qco : string OPT) (nco : string OPT)
	: SYM_CLASS -> string = (
	let	fun wrap true Nil def = (fn x => def ^ "\"" ^ ml_escapify x ^ "\"")
		|   wrap true (Value c) _ = wrap true Nil c
		|   wrap false Nil _ = (fn x => x)
		|   wrap false (Value c) _ = wrap true Nil c;
		val wrap_punc = wrap generic qco "LCString";
		val wrap_var = wrap generic nco "LCIdentifier";
	in	fn
		EosClass e => e
	|	PuncClass x => wrap_punc x
	|	VarClass x => wrap_var x
	end
);
=TEX
\subsection{Goto Table}
=SML
fun ⦏format_goto_entry⦎ (nt : string, s : STATE) : string = (
	"(\"" ^ nt ^ "\"," ^ string_of_int s ^ ")"
);
=TEX
=SML
fun ⦏output_goto_entry_list⦎ ( entries : (string * STATE) list) : unit = (
	put_string "[";
	put_string (format_list format_goto_entry entries ",");
	put_string "]"
);
=TEX
=SML
fun ⦏output_goto_table⦎ (gotos : GOTO_TABLE) : unit = (
let	val tabs = listsofarray gotos (get_int_control"slrp_break");
	fun aux (x :: []) = output_goto_entry_list x
	  | aux (x :: more) = (output_goto_entry_list x; put_string ","; aux more)
	  | aux [] = ();
in	output_table tabs aux "slrp'g" "slrp'gotos"
end
);
=TEX
\subsection{Reduction Table}
=SML
fun ⦏format_reducer⦎ (bodyo : string OPT) (n : int) : string = (
	let	val body = case bodyo of Value b => b | Nil => "()";
		val is = map string_of_int(rev (interval 1 n));
		fun do1 i = "x" ^ i;
		val xs = format_list do1 is "::";
	in	if n = 0
		then
	"(fn stk =>" ^ body ^ ")"
		else
	"(fn(" ^ xs ^ "::stk)=>" ^ body ^
		"|_=>raise PARSER_ERROR\"invalid reduction\")"
	end
);
=TEX
=SML
fun output_reduction_table
	(g: (''lc) GRAMMAR)
	(tab : string OPT REDUCTION_DICT) : unit = (
let	val tabs = listsoflist (e_flatten tab) (get_int_control"slrp_break");
	fun aux nt i acts = (
		if	i = PPArray.length acts
		then	()
		else (	let	val act = PPArray.sub(acts, i);
				val n = length(kth(expand g nt) i);
				val func = format_reducer act n;
				val next_i = i + 1;
			in	if	next_i = PPArray.length acts
				then	put_string func
				else (	put_string(func ^ ",");
					aux nt next_i acts
				)
			end
		)
	);
	fun aux1 i = "slrp'r"^(string_of_int i);

	fun aux2 (nt, acts) = (
		put_string("(\"" ^ nt ^ "\",PPArray.arrayoflist[");
		aux nt 0 acts;
		put_string "])"
	);
	fun aux3 (row :: []) = (
		aux2 row
	) | aux3 (row :: more) = (
		aux2 row; put_string","; aux3 more
	) | aux3 [] = ();

in	put_line "local";
	output_loc_bindings tabs aux3 "slrp'r" true;
	put_line "in";
(* Value polymorphism! for SML 90 the following would work:
	put_line "val slrp'reducers = list_e_merge initial_e_dict slrp'r1;";
   but for SML 97 we must use: *)
	put_line
	"fun slrp'reducers () = list_e_merge initial_e_dict (slrp'r1());";
	put_line "end;"
end
);
=TEX
\subsection{Driver Function}
=SML
fun ⦏output_driver⦎ (() : unit) : unit = (
	put_line
(* Value polymorphism! for SML 90 the following would work:
	("val slrp'gen_parser = slrp'parse slrp'initial_state slrp'actions slrp'gotos slrp'reducers;")
   but for SML 97 we must use: *)
	("fun slrp'gen_parser x = slrp'parse slrp'initial_state slrp'actions slrp'gotos (slrp'reducers()) x;")
);
=TEX
\subsection{Generic Reduction Functions}
=SML
fun ⦏output_gen_red_defns⦎
	(false : bool)
	(_ : ''lc -> string)
	(_ : ''lc GRAMMAR)
	(red_tab : string OPT REDUCTION_DICT)
	(brief : bool)
	(reductions_file : string OPT)
	: string OPT REDUCTION_DICT = (
	red_tab
) | output_gen_red_defns true p g red_tab brief reductions_file = (
let	val void1 = save_out_file()
	val void2 =
		case reductions_file of
			Nil => ()
		|	Value x => open_out_file(x)
	fun do_alt _ _ (j, (Value act, syms)) = (Value act)
	|  do_alt  a k (j, (Nil, syms)) = (
		let	val n = length syms;
			val user_j = string_of_int(j + 1);
			val f =
				if	k = 1
				then	!gen_red_prefix ^ a
				else	!gen_red_prefix ^ a ^ !gen_red_suffix ^ user_j;
			val xs = format_list (fn i => "x"^string_of_int i) (interval 1 n) ",";
			val fun_def =
			"fun " ^ f ^(if brief then "" else " (nt, i) ")^"(" ^ xs ^
			") stk = (\n" ^ "\t(* " ^ a ^ " = " ^
			format_list (format_symbol p) syms ", " ^ " *)\n" ^
				"\tgeneric_reducer "^
				(	if brief
					then "(\""^a^"\", "^user_j^") "
					else "(nt, i) "
				)
				^"[" ^ xs ^ "] stk\n);"
			val fun_call =
				"(" ^ f ^
				( 	if brief
				  	then ""
					else  "(\"" ^ a ^ "\", " ^ user_j ^ ")"
				) ^
				"(" ^ xs ^")stk)";
		in	put_line fun_def;
			Value fun_call
		end
	);
	fun do_prod tab (a, alts) = (
		let	val acts = listofarray(force_value (e_lookup a  tab));
			val act_alts = combine acts alts;
			val j_act_alts = combine(interval 0 (length acts - 1)) act_alts;
			val acts' = map (do_alt a (length alts)) j_act_alts;
		in	e_enter a (PPArray.arrayoflist acts') tab
		end	handle Fail _ => raise PARSER_ERROR
			"invalid entry in the reduction table"
	);
	fun do_prods tab [] = tab
	|   do_prods tab (prod::more) = do_prods (do_prod tab prod) more;
	val ans = do_prods red_tab g
in	
	restore_out_file();
	ans
end
);
=TEX
\subsection{Interface}
Note that the SML code output file is open as the "{\tt out\_file}" when this function is
called and should be re-instated before normal return.
=SML
fun ⦏output_parser⦎
		(p : ''lc -> string)
		(fmt : ''lc -> string)
		(g : (''lc) GRAMMAR)
		(actions : (''lc) ACTION_TABLE)
		(gotos : GOTO_TABLE)
		(red_tab : string OPT REDUCTION_DICT)
		(init : STATE)
		(generic : bool)
		(brief_interface : bool)
		(reductions_file : string OPT): unit = (
	let	val red_tab' = output_gen_red_defns generic fmt g red_tab brief_interface
					reductions_file;
	in	output_initial_state init;
		output_action_table p actions;
		output_goto_table gotos;
		output_reduction_table g red_tab';
		output_driver ()
	end
);
=TEX
\section{INTERFACE} \label{INTERFACE}
\subsection{Recording Execution Times}
=SML
local
	open Timing;
	val ⦏exec_times⦎ : (string * int) list ref = ref[];
in
	fun ⦏reset_exec_times⦎ (false : bool) : unit=()
	|   reset_exec_times true = (
		exec_times := [];
		reset_stopwatch()
	);
	fun ⦏store_exec_time⦎ (false : bool)  (_:string): unit = ()
	|   store_exec_time true desc = (
		exec_times := (desc, read_stopwatch Milliseconds) :: !exec_times;
		reset_stopwatch()
	);
	fun ⦏report_exec_times⦎ (false : bool) : unit = ()
	|   report_exec_times true = (
		chat  "\n"; chat (burst "Execution times"); chat "\n";
		let	fun do1(desc, t) = (
				chat desc; chat ": ";
				chat (string_of_int t);
				chat "ms.\n"
			);
		in	map do1 (rev(!exec_times));  chat "\n"
		end
	);
end;
=TEX
\subsection{ML Interface}
See the detailed design for a description of the parameter interface.
=IGN
val in_file = "t.txt";
val out_file = "t.sml";
val log_file = "t.log";
val eos = "eos";
val quote_con = Nil;
val name_con = Nil;
val log_level = 6;
val slr_only = false;
val timings = true;
val generic = true;
=SML
fun ⦏slrp⦎ {
	in_file : string,
	out_file : string,
	log_file : string,
	eos:string,
	quote_con:string OPT,
	name_con:string OPT,
	log_level:int,
	slr_only : bool,
	timings : bool,
	generic : bool,
	reductions_file : string OPT,
	brief_interface : bool} : unit = (
	(let	val se00 = if log_level > 0 then open_log_file log_file else ();
		val _ = reset_exec_times timings;
		fun my_log msg = (if log_level > 0 then log msg else ());
	in let	val se01 = chat(burst banner);
		val se02 = my_log (burst banner);
		val se03 = open_out_file out_file;
		val (grm, reducers) = BNF_parse in_file;
		val _ = store_exec_time timings "Parsing grammar";
		val se04 = (if log_level >= 2
			then (	log "\n"; log(burst "Grammar"); log"\n";
				print_grammar format_sym_class grm;
				log "\n"; log(burst "Terminal Symbols"); log"\n";
				print_terms format_sym_class grm;
				flush_log_file() )
			else ());
		val sym_eos = EosClass eos;
		val _ = reset_stopwatch();
		val (actions, gotos, Ijs, eff_grammar, init) =
			slr_tables grm sym_eos sentence_symbol;
		val _ = store_exec_time timings "Building SLR(1) tables";
		val se05 = (if log_level >= 2
			then (	log "\n"; log(burst "State Table"); log"\n";
				print_states (grm, format_sym_class) Ijs eff_grammar)
			else ());
		val _ = reset_stopwatch();
		val confs1 = conflicts actions;
		val _ = store_exec_time timings "Checking for SLR(1) conflicts";
		val se06 = if slr_only then () else
				 lalr_resolve_conflicts
				actions gotos eff_grammar
				sentence_symbol sym_eos init
				(map (fn (s, l, _) => (l, s)) confs1)
				format_sym_class (log_level >= 11) (log_level >=12);
		val _ = if is_nil confs1 then  () else
			store_exec_time timings "Calculating LALR(1) lookahead sets";
		val confs2 = conflicts actions;
		val conf_msg = conflict_summary confs2;
		val se07 = (if log_level >= 2
			then (	log "\n"; log(burst "Conflicts"); log"\n";
				chat conf_msg;
				(if is_nil confs1 orelse slr_only then () else (
					my_log ("LALR(1) lookahead sets resolved " ^
					so_many false
					(length confs1 - length confs2) "conflict");
				my_log "\n"; my_log "\n"));
				my_log conf_msg; my_log "\n";
				print_conflicts log (grm, format_sym_class) confs2)
			else(chat conf_msg; my_log"\n"; my_log conf_msg));
		val se08 = (if log_level >= 3
			then (	log "\n"; log(burst "Action Table"); log"\n";
				print_action_table log (grm, format_sym_class) actions)
			else());
		val _ = reset_stopwatch ();
		val se09 = (if not(is_nil confs2)
			then (resolve_conflicts grm actions;
				store_exec_time timings "Resolving reduce/reduce conflicts")
			else ());
		val se10 = (if any confs2 (fn (_, _, acts) => has_sr acts)
			then (	my_log "\n"; my_log(burst "Dynamic Actions"); my_log"\n";
				print_dynamic_actions my_log (grm, format_sym_class) actions;
				chat(burst "Dynamic Actions");
				print_dynamic_actions chat (grm, format_sym_class) actions)
			else());
		val _ = reset_stopwatch();
		val se11 = output_parser (do_sym_class generic quote_con name_con)
				format_sym_class grm actions gotos reducers init
				generic brief_interface reductions_file;
		val _ = store_exec_time timings "Writing parsing tables";
		val se12 =
			(if log_level >= 4
			then print_lr0_automaton_graph actions gotos init format_sym_class
			else ());
		val se13 = (case orphans grm gotos of
			[] => ()
		|	nts => (
			let	val msg1 = "Detected " ^ so_many false (length nts)
					"unreachable non-terminal";
				val msg2 = format_list Combinators.I nts "\n\t";
			in	chat "\n"; chat msg1; chat "\n\n";
				my_log "\n"; my_log msg1; my_log ":\n\n\t";
				my_log msg2; my_log "\n"
			end
		));
		val se14 = (case empty_non_terminals eff_grammar of
			[] => ()
		|	nts => (
			let	val msg1 = "Detected " ^ so_many false (length nts)
					"non-terminal" ^ " generating an empty language";
				val msg2 = format_list Combinators.I nts "\n\t";
			in	chat "\n"; chat msg1; chat "\n\n";
				my_log "\n"; my_log msg1; my_log ":\n\n\t";
				my_log msg2; my_log "\n"
			end
		));
		val _ = report_exec_times timings;
		val se15 = (chat (burst "End of Run");
				my_log "\n"; my_log (burst "End of Run"));
	in	(close_out_file(); close_log_file())
	end	handle ex as SlrpError msg =>
		(my_log "*** ERROR "; my_log msg; my_log "\n"; raise ex)
	end
	handle ex as SlrpError msg =>
		(chat "*** ERROR "; chat msg; chat "\n"; raise ex))
	handle ex as PARSER_ERROR msg =>
		(chat "*** INTERNAL ERROR IN SLRP ";
		 chat msg; chat "\n"; raise SlrpError msg)
);
=TEX
=SML
fun ⦏get_bool⦎ (var : string) : bool = (
	ExtendedIO.get_env var = "true"
);
=TEX
=SML
fun ⦏get_nat⦎ (var : string) : int = (
	(nat_of_string o ExtendedIO.get_env) var handle Fail _ => 0
);
=TEX
=SML
fun ⦏get_string⦎ (var : string) : string = (
	ExtendedIO.get_env var
);
=TEX
=SML
fun ⦏get_string_opt⦎ (var : string) : string OPT = (
	case ExtendedIO.get_env var of
		"" => Nil
	|	s => Value s
);
=TEX
=SML
val ⦏slrp_main⦎ : unit -> unit = (fn () => 
	(	slrp{
			in_file		= get_string "SLRPINFILE",
			out_file	= get_string "SLRPOUTFILE",
			eos		= get_string "SLRPEOS",
			quote_con	= get_string_opt "SLRPQUOTECON",
			name_con	= get_string_opt "SLRPNAMECON",
			log_file	= get_string "SLRPLOGFILE",
			log_level	= get_nat "SLRPLOGLEVEL",
			slr_only	= get_bool "SLRPSLRONLY",
			timings		= get_bool "SLRPTIMINGS",
			generic		= get_bool "SLRPGENERIC",
			reductions_file	= get_string_opt "SLRPREDUCTIONSFILE",
			brief_interface	= get_bool "SLRPBRIEFINTERFACE"};
		OS.Process.exit OS.Process.success)
	handle
		SlrpError _ => ()
	|	ex => (
		TextIO.output(TextIO.stdErr, 
			exnName ex ^ ": " ^ exnMessage ex ^ "\n");
		OS.Process.exit OS.Process.failure
	)
);
=TEX
=SML
end; (* of structure Slrp *)
=TEX
\subsection{Compiler Interface}
This section creates file containing the ML commands that create a stand-alone binary
and files containing the commands to compile SLRP.

For Poly/ML we just export a binary with {\it slrp\_main} as its entry point.
=DUMP polyml-trailer.sml
PolyML.export("slrp-bin", Slrp.slrp_main);
=TEX
For SML/NJ, we export a binary that invokes {\it slrp\_main} ignoring
any command line arguments. The response value below is a dummy to make the
command typecheck, since {\it slrp\_main} always calls {\it OS.Process.exit}.
=DUMP smlnj-trailer.sml
SMLofNJ.exportFn("slrp-bin", fn _ => (Slrp.slrp_main(); OS.Process.success));
=TEX
For MLton, we just ask it to invoke {\it slrp\_main}.
=DUMP mlton-trailer.sml
val _ = Slrp.slrp_main();
=TEX
Now we create files to build SLRP.
First of all we have a template file that is subsequently customised
by the make file to give the system version and copyright line:
=DUMP slrp-header.sml.template
val product_version : string = "VERSION";
val copyright : string = "Copyright (c) Lemma 1 Ltd. 2002 - YEAR";

=TEX
For Poly/ML and SML/NJ we create a file of ML commands to load the source files.
=DUMP polyml-build.sml
use "slrp-header.sml";
use "dtd108.sml";
use "imp108.sml";
use "dtd002.sml";
use "imp002.sml";
use "dtd001.sml";
use "imp001.sml";
use "dtd018.sml";
use "imp018.sml";
use "dtd017.sml";
use "imp017.sml";
=TEX
\ldots together with the appropriate file to export a binary.
=SH
cat polyml-build.sml > smlnj-build.sml
=TEX
=DUMPMORE polyml-build.sml
use "polyml-trailer.sml";
=DUMPMORE smlnj-build.sml
use "smlnj-trailer.sml";
=TEX
For MLton, we construct an ML basis file:
=DUMP  mlton-build.mlb
$(SML_LIB)/basis/basis.mlb
slrp-header.sml
dtd108.sml
imp108.sml
dtd002.sml
imp002.sml
dtd001.sml
imp001.sml
dtd018.sml
imp018.sml
dtd017.sml
imp017.sml
mlton-trailer.sml
=TEX
\subsection{Shell Interface}
The following is a template for the shell script {\tt slrp}, the make file edits in the correct
value for {\it MLCOMPILER}.
=DUMP slrp.template
#!/bin/sh
# slrp From: imp017.doc
# Shell script to run the SLRP Parser Generator
if test -z "$PROGNAME"
then
	PROGNAME=`basename $0`
	USAGE="$PROGNAME [-l log_level] [-g] [-h] [-b] [-q quote_con] [-n name_con] [-r] -e eos_class -f grammar_file"
fi
DIRNAME=`dirname "$0"`
MLCOMPILER=POLYML
LOGLEVEL=2
EOS=LCEos
INFILE=
QUOTECON=""
QUOTECONSUPPLIED=false
NAMECON=""
NAMECONSUPPLIED=false
SLRONLY=false
TIMINGS=false
GENERIC=false
SEPARATEREDUCTIONS=false
BRIEFINTERFACE=false
while getopts l:e:f:grbsq:tn: arg
do
	case $arg in
		q)	QUOTECONSUPPLIED=true; QUOTECON=$OPTARG ;;
		e)	EOS=$OPTARG ;;
		f)	INFILE=$OPTARG ;;
		g)	GENERIC=true ;;
		r)	SEPARATEREDUCTIONS=true ;;
		b)	BRIEFINTERFACE=true ;;		
		n)	NAMECONSUPPLIED=true; NAMECON=$OPTARG ;;
		l)	LOGLEVEL=$OPTARG ;;
		s)	SLRONLY=true ;;
		t)	TIMINGS=true
	esac
done
shift `expr $OPTIND - 1`
if	test -n "$*" -o -z "$INFILE"
then
	echo "$PROGNAME: usage: $USAGE"
	exit 1
fi
if	test `expr "$INFILE" : ".*\\.txt\$"` -eq 0
then
	INFILE=$INFILE.txt
fi
if	test `expr "$LOGLEVEL" : "[0-9]*$"` -eq 0
then
	echo "$PROGNAME: usage: $USAGE"
	echo "$PROGNAME: the -l option must be a number"	
	exit 1
fi
if	[ "$QUOTECONSUPPLIED" = true -a "$QUOTECON" = "" ]
then
	echo "$PROGNAME: usage: $USAGE"
	echo "$PROGNAME: if -q is supplied, the string quote_con must not be empty"	
fi
if	[ "$NAMECONSUPPLIED" = true -a "$NAMECON" = "" ]
then
	echo "$PROGNAME: usage: $USAGE"
	echo "$PROGNAME: if -n is supplied, the string name_con must not be empty"	
fi
DIR=`dirname "$INFILE"`
BASE=`basename "$INFILE" .txt`
OUTFILE="$DIR/$BASE.sml"
if 	[ $SEPARATEREDUCTIONS = true ]
then	REDUCTIONSFILE="$DIR/$BASE.red.sml"
else	REDUCTIONSFILE=""
fi
LOGFILE="$DIR/$BASE.log"
if	[ "$MLCOMPILER" = SMLNJ ]
then	eval `.arch-n-opsys`
	RUNSLRP="eval sml \"@SMLload=$DIRNAME/slrp-bin.$HEAP_SUFFIX\""
else	RUNSLRP="eval \"$DIRNAME/slrp-bin\""
fi
(
	export \
		SLRPINFILE="$INFILE" \
		SLRPOUTFILE="$OUTFILE" \
		SLRPEOS="$EOS" \
		SLRPQUOTECON="$QUOTECON" \
		SLRPNAMECON="$NAMECON" \
		SLRPLOGFILE="$LOGFILE" \
		SLRPLOGLEVEL="$LOGLEVEL" \
		SLRPSLRONLY="$SLRONLY" \
		SLRPTIMINGS="$TIMINGS" \
		SLRPGENERIC="$GENERIC" \
		SLRPREDUCTIONSFILE="$REDUCTIONSFILE" \
		SLRPBRIEFINTERFACE="$BRIEFINTERFACE"
	$RUNSLRP
)
=TEX
\twocolumn[\section{INDEX}]
\small
\printindex

\end{document}

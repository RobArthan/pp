=IGN
********************************************************************************
imp510.doc: this file is part of the PPDaz system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% $Header: /Users/rda/pp/daz/RCS/imp510.doc,v 1.165 2008/12/06 14:29:39 rda Exp rda $
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

\def\Title{Implementation: Ada Output Function}

\def\AbstractText{This document contains the implementation for the Ada output function.}

\def\Reference{ISS/HAT/DAZ/IMP510}

\def\Author{A.C. Hayward}


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
%% LaTeX2e port: \documentstyle[hol1,11pt,TQ]{article}
%% LaTeX2e port: \ftlinepenalty=9999
\def\Hide#1{}
\def\Bool{``$\it{:}bool\,$''}
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{DAZ PROJECT}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Implementation: Ada Output Function}  %% Mandatory field
%% LaTeX2e port: \TPPref{ISS/HAT/DAZ/IMP510}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.165 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2008/12/06 14:29:39 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}	    %% Mandatory field
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{CN}
%% LaTeX2e port: \TPPauthor{A.C.~Hayward & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{D.J.~King & DAZ Team Leader}
%% LaTeX2e port: \TPPabstract{
%% LaTeX2e port: This document contains the implementation for the Ada output function.}
%% LaTeX2e port: %\TPPabstractB{}
%% LaTeX2e port: %\TPPabstractC{}
%% LaTeX2e port: %\TPPabstractD{}
%% LaTeX2e port: %\TPPabstractE{}
%% LaTeX2e port: %\TPPabstractF{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port:     Library}}
%% LaTeX2e port: 
%% LaTeX2e port: %\TPPclass{CLASSIFICATION}
%% LaTeX2e port: %\def\TPPheadlhs{}
%% LaTeX2e port: %\def\TPPheadcentre{}
%% LaTeX2e port: %def\TPPheadrhs{}
%% LaTeX2e port: \def\TPPheadlhs{Lemma 1 Ltd.}
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
%% LaTeX2e port: \bf Copyright \copyright\ : Lemma 1 Ltd. \number\year
%% LaTeX2e port: 
%% LaTeX2e port: \end{centering}

\begin{document}

\headsep=0mm
\FrontPage
\headsep=10mm

\setcounter{section}{-1}

\newpage
\section{DOCUMENT CONTROL}
\subsection{Contents List}
\tableofcontents
\subsection{Document Cross References}
\bibliographystyle{fmu}
\bibliography{daz,fmu}

\subsection{Changes History}  % to get section number `0.3'
\begin{description}

\item[Issues 1.1 (1994/03/28)-1.18 (1994/07/14)]
Initial Drafts.
\item[Issue 1.19 (1994/10/05)]
Added calls to CaseIndependence.get\_external\_name.
\item[Issue 1.20 (1994/10/10)]
Updated in line with changes to SPEC.
\item[Issue 1.21 (1994/10/10)]
Removed output\_spark\_program1 and changed interface to output\_spark\_program.
\item[Issue 1.22 (1994/10/13)]
Added support for auxiliary variables.
\item[Issue 1.23 (1994/10/14)]
Fixed bugs in function/procedure declaration handling and corrected aux vars.
\item[Issue 1.24 (1994/10/14)]
Removed variant records from the implementation.
\item[Issue 1.25 (1994/10/14)]
Added newlines afte compilation units.
\item[Issue 1.26 (1994/11/02)]
Fixed problem with outputting the letter Q to a file.
\item[Issue 1.27 (1994/11/03)]
Fixed to use get\_cn\_state rather than !spark\_prog.
\item[Issue 1.28 (1994/11/03)]
Changed SUBUNIT to COMP\_SUBUNIT.
\item[Issue 1.29 (1994/11/09)]
Adjusted for new AS constructor.
\item[Issue 1.30 (1994/11/14)]
Rationalised the structure wrapping.
\item[Issue 1.31 (1994/11/15)]
Replacement env now distinguishes refinements from replacements.
\item[Issue 1.32 (1994/11/18)]
Fixed a problem with printing labels (now need to add brackets).
\item[Issue 1.33 (1994/11/18)]
Added kslot brackets.
\item[Issue 1.34 (1994/11/24)]
Added first cut of calls to the soundness checking algorithm .
\item[Issue 1.35 (1994/12/08)-1.39 (1994/12/18)]
Minor corrections.
\item[Issue 1.40 (1995/01/05)]
Renamed call of $get\_cn\_state$ to be $get\_z\_generator\_state$.
\item[Issue 1.41 (1995/04/19)]
Fixed DRA bug 3 (batch 1)
\item[Issue 1.42 (1995/09/15)]
Fixed DRA bug 20 (batch 2)
\item[Issue 1.43 (1995/09/15)]
Fixed DRA bug 5 (batch 2)
\item[Issues 1.44 (1995/10/04),1.45 (1995/10/06)]
Added annotations and pragmas.
\item[Issues 1.46 (1995/10/11)]
Fixed bug in printing of unreplaced compilation unit k-slot.
\item[Issue 1.47 (1995/11/29)] Enhancement 3.
\item[Issue 1.48 (1995/12/01)] Added name-clash checking (which fixes bug 15 inter alia).
\item[Issue 1.49 (1995/12/05)] Fixed DRA bugs 14 and issue 2 (V0.6).
\item[Issue 1.50 (1996/02/12)] Fixed DRA bug 11 (V0.6).
\item[Issue 1.51 (1996/02/12),1.52 (1996/02/13)] Fixing DRA bug 3 (V0.6).
\item[Issue 1.53 (1996/02/14)] Made it handle membership of a range properly and tidied error-reporting.
\item[Issue 1.54 (1996/02/27)] Fixed named aggregates with others-part and pragmas without arguments.
\item[Issue 1.55 (1996/02/28)-1.56 (1996/07/15)] Syntax changes.
\item[Issue 1.58 (1997/04/04) - 1.63 (1997/04/10)] Major rewrite as called for as WP 6 of \cite{ISS/HAT/DAZ/HLD505}.
\item[Issue 1.64 (1997/04/16)] Made file reloadable, by gracefully accepting pre-existence
of integer control.
\item[Issue 1.65 (1997/05/08)] Corrected checking of variable redeclaration rules in subprogram specifications. (bug 6 (v0.7.1)).
\item[Issue 1.66 (1997/05/29)] Fixing $strings\_from\_fmt$.
\item[Issue 1.67 (1997/06/13)] IUCT WP 3 changes.
\item[Issue 1.69 (1997/07/07)] Improved use of $cn\_automatic\_line\_splitting$, corrected variable initialisation output.
\item[Issue 1.69 (1997/07/07)] IUCT WP 4 changes.
\item[Issue 1.70 (1997/07/18)] IUCT WP 4 fix --- package names mustn't be overloaded for the changes to be robust.
\item[Issue 1.71 (1997/08/06)] Updated references.
\item[Issue 1.72 (1997/08/18)]  Added conditional compilation for {\bf FULLVERSION} and {\bf CUTDOWNVERSION}
                   Removed CNVCGenerator from open list and added dummy $do\_soundness\_checks2$ for
                   cut-down version.
		   Changes to allow compilation with hol.db base.
\item[Issue 1.73 (1999/02/10)] Changes to allow compilation with poly.db.
\item[Issue 1.74 (1999/02/15)] Added control over case of keywords.
\item[Issue 1.75 (1999/03/11)] Fixed bug in printing of ELSIF.
\item[Issue 1.76 (1999/03/14)] Enhancement R5 --- Initial Variables in Conditionals.
Also fixed bug in printing of keyword ``CONSTANT''.
\item[Issue 1.77 (2000/05/24)] Enhancement R2 --- Multiple Logical Constant Statements.
\item[Issue 1.78 (2000/06/14)-1.80 (2000/06/20)] Fixed bugs in treatment of case
for keyword ``CONSTANT'', attribute designators and pragmas.
\item[Issue 1.81 (2000/10/17)] CTLE II R1/10 --- multiple with clauses.
\item[Issue 1.82 (2000/10/25)] CTLE II R2/1: global variable unsoundness.
\item[Issues 1.83 (2000/10/29),1.84 (2000/10/30)] CTLE II R1/1: real types.
\item[Issues 1.85 (2001/03/16)] Adjustment to formatting of {\it Z\_TM}s to support
pretty-printing of Web clauses containing nested quotations
in a format that can more often be re-entered.
\item[Issue 1.86 (2001/12/15)] R0037: support for named numbers.
\item[Issue 1.87 (2001/12/19)] R0043: problem with long lines when the frames of specification statements are printed.
\item[Issue 1.88 (2002/01/11)] Problem with lower case `o' in attribute names.
\item[Issue 1.89 (2002/01/26), 1.90 (2002/01/26)] R0006: mods to allow for extended use of subtype indications
and ranges; also involved a fairly extensive overhaul to remove the enormous
mutual recursions.
\item[Issue 1.91 (2002/03/13)] R0056: default parameter modes supported properly.
\item[Issue 1.92 (2002/03/14)] Fixed bugs in output of loop statements; tidied various statement forms
which were producing newlines inconsistently.
\item[Issue 1.93 (2002/03/14)] Improved commentary for unexpanded labels; moved {\it
translate\_for\_output} calls to the points where Z-like fragments are being
processed so that per-cent signs in strings etc. will work properly.
\item[Issue 1.92 (2002/03/14)] Soundness check failures now reported after the
program has been printed.
\item[Issue 1.93 (2002/03/14)] Added missing {\it translate\_for\_output} call for identifiers.
\item[Issue 1.94 (2002/03/21)] Added further missing {\it translate\_for\_output} calls.
\item[Issue 1.95 (2002/03/21)] Removed {\it translate\_for\_output} calls that are now
made during lexical analysis (annotations and arbitrary Ada). Added calls
that were missing for refinement and replacement symbols. Also completed R0061:
new symbol for statement replacement.
\item[Issue 1.96 (2002/03/26)-1.98 (2002/04/09)] Various fixes plus R0061: new syntax for statement replacement.
\item [Issue 1.99 (2002/05/02)] First go at new syntax for interim Spring 2002 release.
\item [Issue 1.100 (2002/05/03),1.101 (2002/05/04)] More new syntax plus R0063: unexpanded specification statements
are now handled by printing a comment and then the specification statement.
\item [Issue 1.102 (2002/05/04)] R0050: discriminants now working.
\item[Issue 1.103 (2002/05/06)] Spring 2002 enhancements: return and exit statements.
\item[Issue 1.104 (2002/05/10)] Spring 2002 enhancements: checking use clauses.
\item[Issue 1.105 (2002/05/21)] No longer want a null statement when outputting
an unexpanded statement label. Tidied up handling of controls.
\item[Issue 1.106 (2002/05/31)] Fixed bug in printing of object renamings and relaxed rules on clashing
names arising from use clauses.
\item[Issue 1.107 (2002/07/24)] R0051/R0052: default parameters and block statements.
\item[Issue 1.108 (2002/08/07)] Now support renaming of operator symbol with no package name prefix.
\item[Issue 1.110 (2002/08/23)] Removed use of ICL logo font and corrected {\LaTeX} error.
\item[Issue 1.111 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.112 (2002/10/17), 1.113 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.114 (2002/11/10)] Uniform treatment of block statements.
\item[Issues 1.115 (2002/11/13)--1.120 (2002/11/15)] R0055: warnings for non-SPARK constructs.
\item[Issue 1.121 (2002/12/10)] SPARK keywords are now lower case by default.
\item[Issue 1.122 (2002/12/11)] Residual problems with {\it translate\_for\_output}.
\item[Issue 1.123 (2002/12/16)] We now learn that named numbers are allowed in SPARK.
\item[Issue 1.124 (2002/12/17)] Updates after testing the new error management scheme.
\item[Issue 1.125 (2003/05/19), 1.126 (2003/05/20)] Support for NOTHING statement form.
N.b., this includes a change to the {\it PP\_FMT\_INFO} type to defer the binding
of the output function to the replacement formatter. This means that by changing
the output function to a function that just carries out some kind of test, the formatting
apparatus can also be re-used as a combinator to apply a test over the SPARK abstract
syntax without doing any output.
\item[Issue 1.127 (2003/05/20)] R0092: improved generality of the pretty-printing API.
\item[Issue 1.128 (2003/05/27)] Fixed changes history.
\item[Issue 1.129 (2003/06/18)] R0096: improved formatting of nothing statement form in web clauses
\item[Issue 1.130 (2003/07/01)] When formatting web clauses, Compliance Notation reserved words
used as identifiers are now escaped with a dollar sign (as required if they are to be reparsed).
\item[Issue 1.131 (2004/02/07)] Fixed wrong indentation for others clauses in case statements.
\item[Issue 1.132 (2004/02/07)] The name at the end of a package specification or a proper body is now optional.
\item[Issue 1.133 (2004/02/07)] The SPARK program is now referred to as the Ada program.
\item[Issue 1.134 (2004/05/14)] Now calls {\it translate\_for\_output} to preprocess input file names..
\item[Issue 1.135 (2004/07/11)]  Fixed non-exhaustive (but typically harmless) match.
\item[Issue 1.136 (2004/08/11)] Missing identifiers at end of subprogram body etc. are now flagged as non-SPARK
\item[Issue 1.137 (2004/08/29)] Implemented distinction between empty private part and omitted private part.
\item[Issues 1.138 (2004/09/01),1.139 (2004/09/06)] Relaxed checks on subprogram declarations.
\item[Issue 1.139 (2004/09/06)] Support for labelled statements and goto statements.
\item[Issue 1.140 (2004/10/10)] Support for derived types.
\item[Issue 1.141 (2004/12/08)] Dollar now required before Compliance Notation reserved words.
\item[Issue 1.142 (2005/04/22)] Now uses correct syntax for all types of specification statement.
\item[Issue 1.143 (2005/05/28)] Allowed for change in HOL name of Π.
\item[Issue 1.144 (2005/06/02)] Enhancement 115: support for implicitly declared subprograms.
\item[Issue 1.145 (2005/06/22)] Efficiency improvement in printing out Z terms.
\item[Issue 1.146 (2005/09/09)] Made {\em all\_implicit\_nulls} turn off clash checking to avoid spurious clash reports. Added test for clash with package STANDARD.
\item[Issue 1.147 (2005/12/07)] Allowed for rationalised data type for subunits.
\item[Issue 1.148 (2006/01/23)] Multiple auxiliary variables are now allowed in one Z declaration.
\item[Issue 1.148 (2006/01/23)] Allowed for deferred subprograms.
\item[Issue 1.149 (2006/04/13)] {\em case\_of\_ada\_keywords} is now {\em cn\_case\_of\_ada\_keywords}.
\item[Issue 1.150 (2006/05/31)] Allowed for data type rationalisations.
\item[Issue 1.151 (2006/08/10)] Allowed for multiple auxiliary variable declarations.
\item[Issue 1.152 (2006/09/17)] Allowed for deferred subprograms.
\item[Issue 1.153 (2006/09/18)] Change to name of string control.
\item[Issues 1.154 (2007/05/12)--1.157 (2007/05/22)] Allowed for anonymous loops and blocks that have been given a name in the Compliance Notation.
\item[Issues 1.158 (2008/03/23)-1.161 (2008/05/01)] Child packages.
\item[Issues 1.162 (2008/05/05)] Modular types.
\item[Issue 1.163 (2008/07/24)] Arranged to put Quine corners round Z strings.
\item[Issue 1.164 (2008/10/11)] When expansion of k-slots and specification statements is not selected (i.e., {\em fmt\_repl} is not supplied), we now make a determined effort to output valid Compliance Notation.
\item[Issue 1.165 (2008/12/06)] Avoided clash with new type {\em SCOPE}.
\item[Issue 1.166 (2010/02/11)] Removed obsolete CUTDOWNVERSION option.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported daz source documents onto the Lemma 1 document template
%%%% END OF CHANGES HISTORY %%%%
\end{description}

\subsection{Changes Forecast}
None.
\pagebreak

\section{GENERAL}
\subsection{Scope}

This document contains the implementation for the Compliance Notation Output functions.  The detailed design for this material is in \cite{ISS/HAT/DAZ/DTD510} and the module tests are in \cite{ISS/HAT/DAZ/MDT503}.

\subsection{Introduction}

\subsection{Purpose and Background}

One signature is implemented in this document, $CNAdaOutput$.  The functions in this signature are not intended to be called directly by the user.  Instead \cite{ISS/HAT/DAZ/DTD516} details some top-level functions which use this signature.

\subsection{Dependencies}

The functions in this signature depend on the data types introduced in the structures $CNTypes$, $CNTypes1$, $CNVCGenerator$, $CNZGenerator$ and $ZUserInterfaceSupport$ which are defined in \cite{ISS/HAT/DAZ/DTD513}, \cite{ISS/HAT/DAZ/DTD514}, \cite{ISS/HAT/DAZ/DTD505}, \cite{ISS/HAT/DAZ/DTD507} and \cite{DS/FMU/IED/DTD079}.

\section{THE STRUCTURE $CNAdaOutput$}

=SML
structure ⦏CNAdaOutput⦎ : CNAdaOutput = struct
=SML
    open    CNTypes CNTypes1 CNZGenerator CNLex;
    open    ZUserInterfaceSupport;
    open    CNVCGenerator;
=TEX

\subsection{Checking for Name Clashes}
This module is responsible for implementing the Compliance Notation rules against redeclaration of identifiers as required in \cite{DRA/CIS/CSE3/TR/94/27/3.0}, volume 1.
Some checking is done as web clauses are entered, but only when the program is output is all the information needed to make a comprehensive check available.
The following ML data structures and access functions are used to record information about declarations as they are encounetered.

The bool flag is only set true in the call from the functions which print or output the entire Ada program.
The flag is used to ensure that diagnostic routines etc. using the lower-level formatting routines directly will not indefinitely consume resources.
N.b. some functions use the stack variable directly for special effects, so they must do so in a way which won't consume resources if the flag is false.

Names introduced in use clauses need special treatment. The Z Generator imposes rules on use clauses
that imply that we do not need to check names introduced in use clauses against other names introduced
in the same way.
=SML
val ⦏error_checking⦎ : bool ref = ref false;
type ⦏FRAME⦎ = {block : ID, names : ID list, use_clause_names : ID list};
val ⦏stack⦎ : FRAME list ref = ref [];
fun ⦏push_scope⦎ (block : ID) : unit = (
	if	!error_checking
	then	stack := {block=block, names=[], use_clause_names = []} :: !stack
	else	()
);
fun ⦏pop_scope⦎ () : unit = (
	if	!error_checking
	then	case !stack of
			[] => ()
		|	_ :: more => (stack := more)
	else	()
);
=TEX
The following data structures and functions are used to accumulate a list of name-clash and other
errors.
=SML
type ⦏CLASH_INFO⦎ = {name1 : ID list, name2 : ID list};
val ⦏clashes⦎ : CLASH_INFO list ref = ref [];
fun ⦏check_decl⦎ (name : ID) : unit = (
if	!error_checking
then	let	fun full_name (st : FRAME list) (n : ID) : ID list = (
			rev(n :: (map #block st less ""))
		);
		val _ = if name <> "STANDARD" then () else
				clashes := !clashes grab
				{name1 = ["STANDARD (predefined package)"],
				name2 = full_name (!stack) name};
		fun scan [] = ()
		|   scan (st as ({block, names, use_clause_names} :: more)) = (
			if	name mem names orelse name mem use_clause_names
			then	(clashes := !clashes grab
					{name1 = full_name st name,
					name2 = full_name (!stack) name};
				scan more)
			else	scan more
		);
	in	scan (!stack);
		case !stack of
			[] => (
				stack := [{block="", names =[name], use_clause_names = []}]
		) |	{block, names, use_clause_names} :: more => (
				stack :=
				{block=block,names=names grab name,
					use_clause_names = use_clause_names}::more
		)
	end
else	()
);
=TEX
=SML
fun ⦏check_use_clause_name⦎ (name : ID) : unit = (
if	!error_checking
then	let	fun full_name (st : FRAME list) (n : ID) : ID list = (
			rev(n :: (map #block st less ""))
		);
		fun scan [] = ()
		|   scan (st as ({block, names, use_clause_names} :: more)) = (
			if	name mem names
			then	(clashes := !clashes grab
					{name1 = full_name st name,
					name2 = full_name (!stack) name};
				scan more)
			else	scan more
		);
	in	scan (!stack);
		case !stack of
			[] => (
				stack := [{block="", names =[name], use_clause_names = []}]
		) |	{block, names, use_clause_names} :: more => (
				stack :=
				{block=block,names=names,
					use_clause_names = use_clause_names grab name}::more
		)
	end
else	()
);
=TEX
In many cases the following gives a convenient idiom:
=SML
fun ⦏in_new_scope⦎ (check_n : bool) (n : ID) (what : unit -> 'b) : 'b = (
	(if check_n then check_decl n else ());
	push_scope n;
	let	val res = what ();
	in	pop_scope ();
		res
	end
);
=TEX
=SML
val ⦏unnamed_scope_counter⦎ : int ref = ref 0;
fun ⦏reset_unnamed_scope_counter⦎ (():unit) : unit = (
	unnamed_scope_counter := 0
);
fun ⦏get_scope_name⦎ (LBAdaName n : LOOP_OR_BLOCK_NAME) : string = n
|   get_scope_name (LBCNName n) = n
|   get_scope_name LBNoName = (
	if	!error_checking
	then	(unnamed_scope_counter := !unnamed_scope_counter + 1;
		string_of_int (!unnamed_scope_counter))
	else	""
);
=TEX
=SML
fun ⦏with_soundness_checks⦎ (what : unit -> 'a) : 'a = (
	clashes := [];
	stack := [];
	error_checking := true;
	reset_unnamed_scope_counter();
	let	fun show_name n = format_list Combinators.I n ".";
		fun report_clash {name1, name2} = (
			diag_line
				(get_error_message 510002
					[show_name name1, show_name name2])
		);
		fun report_clashes cls = (
			case cls of
			[]	=> ()
		|	_ => (
				diag_line (get_error_message 510001 []);
				map report_clash cls;
				log_message (get_error_message 510006
					["510003", "soundness_checks", get_error_message 510003[]]);
				fail "soundness_checks" 510003 []
			)
		);
		val res = what();
		val cls = !clashes;
	in	error_checking := false;
		clashes := [];
		stack := [];
		report_clashes cls;
		res
	end
)	handle ex => (
		error_checking := false;
		clashes := [];
		stack := [];
		raise ex
);
=TEX

\subsection{Low level functions}

These functions deal with the low-level output of characters.
=SML
=TEX

=SML
local
	val ⦏cn_tab_width⦎ : int ref = ref 2;
in
val _ = (new_int_control{name="cn_tab_width",
	control=cn_tab_width,
	default = (fn () => 2),
	check = (fn (x:int) => 1 <= x)}
		handle (Fail _) => () (* assume control already present *));
fun ⦏get_cn_tab_width⦎ ( () : unit) : int = !cn_tab_width;
end;

fun ⦏fmt_spaces⦎ (i : int) : string =
   if i<=0 then "" else " "^fmt_spaces(i-1);
fun ⦏fmt_tabs⦎ (i : int) : string = (
	let	val tab_str = fmt_spaces(get_cn_tab_width());
		fun aux (j : int) = if (j <= 0) then "" else tab_str ^ aux (j-1);
	in
		aux i
	end);
=TEX
Now we set up the tab state as some global state:
=SML
local
	val ⦏cn_left_margin⦎ : int ref = ref 0;
	val ⦏tab_stop⦎ : int ref = ref 0;
in
val _ = (new_int_control{name="cn_left_margin",
	control=cn_left_margin,
	default = (fn () => 0),
	check = (fn (x:int) => 0 <= x)}
		handle (Fail _) => () (* assume control already present *));
fun ⦏set_PPTab_no⦎ (x : int) = (if (x > 0)
	then tab_stop := x
	else tab_stop := 0;
	());
fun ⦏reset_PPTab_no⦎ (() :unit) = (tab_stop := !cn_left_margin;());
fun ⦏get_PPTab_no⦎ ( () : unit) : int = !tab_stop;
end;
=TEX
In the following type, {\it outf} is the function to output some
formatted text and {\it fmt\_repl} is the optional function that
deals with a label, either by recursively formatting
and printing the replacement for the label or by printing a place-holder.
The optional function returns {\tt true} iff. the label had a replacement.
=SML
type ⦏PP_FMT_INFO⦎ = {
    outf : string -> unit,
    fmt_repl : ((string -> unit) -> LABEL -> bool) OPT
    };
=TEX
=TEX
=SML
fun ⦏set_tabs⦎(i : int) = set_PPTab_no(i);
fun ⦏get_tabs⦎() = get_PPTab_no();

fun ⦏inc_tabs⦎ (() :unit) =
    (set_PPTab_no(get_PPTab_no() + 1));
fun ⦏dec_tabs⦎ (() :unit) =
    (set_PPTab_no(get_PPTab_no() - 1));
fun ⦏reset_tabs⦎ (() :unit) =
    (reset_PPTab_no());
fun ⦏len_tab⦎ (():unit) : int = (get_PPTab_no() * get_cn_tab_width());
=TEX
\subsection{Infrastructure for non-SPARK warnings}
The non-SPARK warnings are generated by side-effect, if requested, as we traverse the
syntax tree. They are then printed out at the end of the declaration, statement or
body that provoked them.
=SML
val ⦏cn_spark_syntax_warnings⦎ : bool ref = ref false;
val side_effect = new_flag
	{name = "cn_spark_syntax_warnings",
	control = cn_spark_syntax_warnings,
	check = fun_true,
	default = fun_false} handle Fail _ => ();
val ⦏warning_list⦎ : string list ref = ref [];
=TEX
=SML
fun ⦏non_spark_warning⦎ (msg_num : int) : unit = (
	if	!cn_spark_syntax_warnings
	then	warning_list := ! warning_list @ [get_error_message msg_num []]
	else	()
);
fun ⦏fmt_warnings⦎ ({outf, ...}: PP_FMT_INFO) : unit = (
	let	fun aux s = (outf(get_error_message 510100 [s]); outf "\n");
	in	map aux (!warning_list);
		warning_list := []
	end
);
=TEX
\subsection{The String from Identifiers}
We need a function to convert an identifier into its external
form for both bracket tests and actual output, so
it is given here, in isolation.
The plus in the name refers to the third argument, $s$, which is either empty or a punctuation
symbol like a comma that we want to ensure is printed on the same line as the identifier.
=SML
fun ⦏sfmt_id_plus⦎  ({outf, fmt_repl} : PP_FMT_INFO) (n : ID) (s : string): string  = (
	let	fun break_up acc (lhs, "o"::rest) = (
			break_up ((implode o rev) lhs::acc) ([], rest)
		) | break_up acc (lhs, (c::rest)) = (
			break_up acc (c::lhs, rest)
		) | break_up acc (lhs, []) = (
			(implode o rev) lhs::acc, ([], [])
		);
		val comps = (	map CaseIndependence.get_external_name o rev
				o fst o (break_up [])) ([], explode n);
		fun fmt_aux (a::b::rest) = (
			a^"."^fmt_aux (b::rest)
		) | fmt_aux (a::rest) = a ^ s
		| fmt_aux [] = s;
	in
		fmt_aux comps
	end
);
=TEX
\subsection{Case of Keywords}
=SML
local
fun default () = "lower";
fun ⦏check⦎ ("as input" : string) : bool = true
|   check "lower" = true
|   check "upper" = true
|   check x = (
	fail "check_cn_case_of_ada_keywords" 510004 [fn _ => x]
);
val ⦏cn_case_of_ada_keywords⦎ : string ref = ref (default());
val _ = new_string_control{
		check = check,
		control = ref(default()),
		default = default,
		name = 	"cn_case_of_ada_keywords"} handle Fail _ => ();
in
=TEX
=SML
	fun ⦏kw⦎ (s : string) : string = (
		translate_for_output
		((case get_string_control "cn_case_of_ada_keywords" of
			"as input" => CaseIndependence.get_external_name
		|	"lower" => CaseIndependence.to_lower
		|	_ => CaseIndependence.to_upper) s)
	);
	fun ⦏kw2⦎ (s1 : string) (s2 : string) : string = (
		kw s1 ^ " " ^ kw s2
	);
	fun ⦏kw3⦎ (s1 : string) (s2 : string) (s3 : string) : string = (
		kw s1 ^ " " ^ kw s2 ^ " " ^ kw s3
	);
end;
=TEX
\subsection{Bracketing}
In a few places it is important not to put extra brackets around a
bracketed construct (e.g., an array index).
We check by having a parallel set of functions for expressions and their fragments
(all prefixed by ``nb''),
which return false if the item is either such that it is not printed
(i.e. its string representation would be empty), or it is already bracketed.
=SML
fun ⦏nb_spaces⦎ (i : int) : bool = if (i > 0) then true else false;
fun ⦏nb_tabs⦎ (i : int) : bool = if (i > 0) then true else false;
fun ⦏nb_z_tm⦎ ({outf,...} : PP_FMT_INFO) (z_tm : Z_TM) : bool = true;

fun ⦏nb_id_plus⦎  (fmtinfo: PP_FMT_INFO) (n : ID) (s : string): bool = (
	(sfmt_id_plus fmtinfo n s) <> ""
);

fun ⦏nb_id_comma⦎  (fmtinfo : PP_FMT_INFO) (n : ID) : bool  = true;
fun ⦏nb_id⦎  (fmtinfo : PP_FMT_INFO) (n : ID) : bool = (nb_id_plus fmtinfo n "");

fun ⦏nb_tmark_plus⦎  (fmtinfo : PP_FMT_INFO) (t : TMARK) (s : string): bool =
	nb_id_plus fmtinfo t s;
fun ⦏nb_tmark⦎  (fmtinfo : PP_FMT_INFO) (t : TMARK) : bool =
	nb_tmark_plus fmtinfo t "";
fun ⦏nb_tmark_comma⦎  (fmtinfo : PP_FMT_INFO) (t : TMARK) : bool = true;

fun ⦏nb_term⦎  ({outf,...} : PP_FMT_INFO) (z : TERM) : bool = (
let	val cn_als = get_int_control	"cn_automatic_line_splitting";
	val awidth = if cn_als = 0
		then get_line_length()
		else cn_als;
	val awidth1 = if (awidth - len_tab()) < 0
		then 0
		else awidth - len_tab();
	val strs = map translate_for_output
                   (PrettyPrinter.format_term1 false awidth1 z);
=SML
in
	(length strs > 1 orelse (length strs = 1 andalso (hd strs <> "")))
end);

fun ⦏nb_label⦎ ({outf,...} : PP_FMT_INFO) (label : LABEL) = false;

fun ⦏nb_unary_op⦎ ({outf,...} : PP_FMT_INFO) (_ : UNARY_OP) = true;

fun ⦏nb_binary_op⦎ ({outf,...} : PP_FMT_INFO)(_ : BIN_OP) = true;

fun ⦏nb_mode⦎ ({outf,...} : PP_FMT_INFO)(_ : MODE) = true;

fun ⦏nb_loop_direction⦎ ({outf,...} : PP_FMT_INFO) (LDForwards : LOOP_DIRECTION) = false
  | nb_loop_direction ({outf,...} : PP_FMT_INFO)(LDReverse : LOOP_DIRECTION) = true;

fun ⦏nb_operator_symbol⦎ ({outf,...} : PP_FMT_INFO)(s : OPERATOR_SYMBOL) = s <> "";

fun ⦏nb_id_list⦎ (fmtinfo : PP_FMT_INFO)([] : ID list) = false
  | nb_id_list (fmtinfo : PP_FMT_INFO)([x] : ID list) = (nb_id fmtinfo x)
  | nb_id_list (fmtinfo : PP_FMT_INFO)(x::xs: ID list) = true;

fun ⦏nb_tmark_list⦎ (_ : PP_FMT_INFO)([] : TMARK list) = false
  | nb_tmark_list (fmtinfo : PP_FMT_INFO)([x] : TMARK list) = (nb_tmark fmtinfo x)
  | nb_tmark_list (fmtinfo: PP_FMT_INFO)(x::xs : TMARK list) = true;

fun ⦏nb_z_pred⦎ (fmtinfo : PP_FMT_INFO) (z : Z_PRED) = nb_term fmtinfo z;
fun ⦏nb_z_exp⦎ (fmtinfo : PP_FMT_INFO) (z : Z_EXP) =  nb_term fmtinfo z;
fun ⦏nb_z_id⦎ ({outf, ...} : PP_FMT_INFO) (z : Z_ID) = z <> "";
fun ⦏nb_attrib⦎ (fmtinfo : PP_FMT_INFO) (x : ATTRIB) = nb_id fmtinfo x;
fun ⦏nb_int_real_lit⦎ (fmtinfo : PP_FMT_INFO) (x : INT_REAL_LIT) = nb_id fmtinfo x;

fun ⦏nb_rangelohi⦎ (fmtinfo: PP_FMT_INFO)
	({lo=l, hi=h} : EXP RANGELOHI) = true
and ⦏nb_range⦎ (fmtinfo: PP_FMT_INFO)(RRange x : EXP RANGE) = true
  | nb_range fmtinfo (RRangeAttr x : EXP RANGE) = nb_exp fmtinfo x
and ⦏nb_discrete_range_constrained⦎ (fmtinfo: PP_FMT_INFO)
		({tmark=t, range=r} : EXP DISCRETE_RANGE_CONSTRAINED) = true
and ⦏nb_discrete_range⦎ (fmtinfo : PP_FMT_INFO) (DRRange x : DISCRETE_RANGE) = (nb_range fmtinfo x)
  | nb_discrete_range (fmtinfo : PP_FMT_INFO)(DRConstrained x : DISCRETE_RANGE) =
    (nb_discrete_range_constrained fmtinfo x)
and ⦏nb_agg_choice⦎ (fmtinfo : PP_FMT_INFO) (ACAggChoiceRange x : AGG_CHOICE) = (nb_discrete_range fmtinfo x)
  | nb_agg_choice (fmtinfo : PP_FMT_INFO) (ACAggChoiceSingle x : AGG_CHOICE) = (nb_exp fmtinfo x)
and ⦏nb_agg_choice_list⦎ (_: PP_FMT_INFO)([] : AGG_CHOICE list) = false
 | nb_agg_choice_list (fmtinfo: PP_FMT_INFO) ([x] : AGG_CHOICE list) = (nb_agg_choice fmtinfo x)
  | nb_agg_choice_list (fmtinfo: PP_FMT_INFO) (x::xs : AGG_CHOICE list) = true
and ⦏nb_named_assoc⦎ (fmtinfo: PP_FMT_INFO)({choice=c, comp=e} : (AGG_CHOICE, EXP) NAMED_ASSOC) = true
and ⦏nb_named_assoc_list⦎ (_: PP_FMT_INFO)([] : (AGG_CHOICE, EXP) NAMED_ASSOC list) = false
  | nb_named_assoc_list (fmtinfo: PP_FMT_INFO) ([x] : (AGG_CHOICE, EXP) NAMED_ASSOC list) =
    (nb_named_assoc fmtinfo x)
  | nb_named_assoc_list (fmtinfo: PP_FMT_INFO) (x::xs : (AGG_CHOICE, EXP) NAMED_ASSOC list) = true
and ⦏nb_others⦎ (fmtinfo: PP_FMT_INFO)({others=oth} : EXP OTHERS) = true
and ⦏nb_agg_pos⦎ (fmtinfo: PP_FMT_INFO) ({tmark=tm, comps=c} : EXP AGG_POS) =
    (case tm
	of Nil => false
	| Value t => true
    )
and ⦏nb_agg_pos_others⦎ (fmtinfo: PP_FMT_INFO) ({agg_pos = {tmark=tm, comps=c} :
    EXP AGG_POS, others = oth} : EXP AGG_POS_OTHERS) =
    (case tm
	of Nil => false
	| Value t => true
    )
and ⦏nb_agg_others⦎ (fmtinfo: PP_FMT_INFO) ({tmark=tm, others=oth} : EXP AGG_OTHERS) =
    (case tm
	of Nil =>  false
	| Value t => true
    )
and ⦏nb_agg_named⦎ (fmtinfo: PP_FMT_INFO)
	({tmark=tm,named_assocs=n} : (AGG_CHOICE, EXP) AGG_NAMED) =
    (case tm
	of Nil => false
	| Value t => true
    )
and ⦏nb_agg_named_others⦎ (fmtinfo: PP_FMT_INFO)
	({agg_named=a as{tmark=tm, named_assocs=n}, others=oth} :
		(AGG_CHOICE, EXP) AGG_NAMED_OTHERS) =
    (case tm
	of Nil => false
	| Value t => true
    )
and ⦏nb_unary_exp⦎ (fmtinfo: PP_FMT_INFO) ({uop=u, right=r}
		: EXP UNARY_EXP) = true
and ⦏nb_bin_exp⦎ (fmtinfo: PP_FMT_INFO) ({bop=b, left=l, right=r}
		: EXP BIN_EXP) = true
and ⦏nb_attrib_desig⦎ (fmtinfo : PP_FMT_INFO) (ADAttrib x : ATTRIB_DESIG) =
	nb_attrib fmtinfo x
  | nb_attrib_desig (fmtinfo: PP_FMT_INFO) (ADAttribArg (a,e)
		: ATTRIB_DESIG) = true
and ⦏nb_mem_range⦎ (fmtinfo: PP_FMT_INFO)
	({left=e, mop=m, range=r} : EXP MEM_RANGE) = true

and ⦏nb_attribute⦎ (fmtinfo: PP_FMT_INFO)
	({prefix=p, attribute_desig=a} : (EXP, ATTRIB_DESIG) ATTRIBUTE) = true

and ⦏nb_indexed_comp⦎ (fmtinfo: PP_FMT_INFO)
	({prefix=p, index=i} : EXP INDEXED_COMP) = true
and ⦏nb_selected_comp⦎ (fmtinfo: PP_FMT_INFO)
	({prefix=p, selector=s} : EXP SELECTED_COMP) = true
and ⦏nb_qualified_expression⦎ (fmtinfo: PP_FMT_INFO)
	({tmark=t, exp=e} : EXP QUALIFIED_EXPRESSION) = true
and ⦏nb_type_conversion⦎ (fmtinfo: PP_FMT_INFO)
	({tmark=t, exp=e} : EXP QUALIFIED_EXPRESSION) = true
and ⦏nb_exp⦎ (fmtinfo: PP_FMT_INFO) (EId x : EXP) = (nb_id fmtinfo x)
  | nb_exp (fmtinfo: PP_FMT_INFO) (EIntReal x : EXP) = (nb_int_real_lit fmtinfo x)
  | nb_exp (fmtinfo: PP_FMT_INFO) (EArrayAggPos x : EXP) = (nb_agg_pos fmtinfo x)
  | nb_exp (fmtinfo: PP_FMT_INFO) (EArrayAggPosOthers x : EXP) =
	(nb_agg_pos_others fmtinfo x)
  | nb_exp (fmtinfo: PP_FMT_INFO) (EArrayAggOthers x : EXP) =
	(nb_agg_others  fmtinfo x)
  | nb_exp (fmtinfo: PP_FMT_INFO) (EArrayAggNamed x : EXP) =
	(nb_agg_named fmtinfo x)
  | nb_exp (fmtinfo: PP_FMT_INFO) (EArrayAggNamedOthers x : EXP) =
	(nb_agg_named_others fmtinfo x)
  | nb_exp (fmtinfo: PP_FMT_INFO) (ERecAggPos x : EXP) = (nb_agg_pos fmtinfo x)
  | nb_exp (fmtinfo: PP_FMT_INFO) (ERecAggNamed x : EXP) = false
  | nb_exp (fmtinfo: PP_FMT_INFO) (EUnaryExp x : EXP) = (nb_unary_exp fmtinfo x)
  | nb_exp (fmtinfo: PP_FMT_INFO) (EBinExp x : EXP) = (nb_bin_exp fmtinfo x)
  | nb_exp (fmtinfo: PP_FMT_INFO) (EMemRange x : EXP) = (nb_mem_range fmtinfo x)
  | nb_exp (fmtinfo: PP_FMT_INFO) (EAttribute x : EXP) = (nb_attribute fmtinfo x)
  | nb_exp (fmtinfo: PP_FMT_INFO) (EIndexedComp x : EXP) =
	(nb_indexed_comp fmtinfo x)
  | nb_exp (fmtinfo: PP_FMT_INFO) (ESelectedComp x : EXP) =
	(nb_selected_comp fmtinfo x)
  | nb_exp (fmtinfo: PP_FMT_INFO) (EFunCall x : EXP) = false
  | nb_exp (fmtinfo: PP_FMT_INFO) (EAuxiliaryExp x : EXP) = true
  | nb_exp (fmtinfo: PP_FMT_INFO) (EQualifiedExp x : EXP) =
	(nb_qualified_expression fmtinfo x)
  | nb_exp (fmtinfo: PP_FMT_INFO) (ETypeConversion x : EXP) =
	(nb_type_conversion fmtinfo x)
  | nb_exp (fmtinfo  : PP_FMT_INFO) (EBracketed e : EXP) = false
  | nb_exp ({outf,...}: PP_FMT_INFO) (EStringLiteral s : EXP) = true
  | nb_exp ({outf,...}: PP_FMT_INFO) (ECharacterLiteral c : EXP) = true
  | nb_exp ({outf,...}: PP_FMT_INFO) (EDiscreteRange _: EXP) = true
and ⦏nb_exp_list⦎ (fmtinfo: PP_FMT_INFO) ([] : EXP list) = false
  | nb_exp_list (fmtinfo: PP_FMT_INFO) ([x] : EXP list) = (nb_exp fmtinfo x)
  | nb_exp_list (fmtinfo : PP_FMT_INFO) (x::xs : EXP list) = true;
=TEX
=IGN
(* apparently not needed *)
fun ⦏nb_static_exp⦎ (fmtinfo: PP_FMT_INFO)(x : STATIC_EXP) = (nb_exp fmtinfo x);

fun ⦏nb_static_rangelohi⦎ (fmtinfo: PP_FMT_INFO) ({lo=l, hi=h} : STATIC_EXP RANGELOHI) = true;
fun ⦏nb_static_range⦎ (fmtinfo: PP_FMT_INFO) (RRange x : EXP RANGE) =
	nb_static_rangelohi fmtinfo x
  | nb_static_range (fmtinfo: PP_FMT_INFO) (RRangeAttr x : EXP RANGE) =
	nb_static_exp fmtinfo x;

fun ⦏nb_cond⦎ (fmtinfo: PP_FMT_INFO) (c : COND) = (nb_exp fmtinfo c);

fun ⦏nb_actuals⦎ (fmtinfo : PP_FMT_INFO) (_ : (AGG_CHOICE, EXP) ACTUALS) = false;
=TEX
Statements, nor items embedding them never need brackets.

\subsection{Expression Fragments}
=SML
fun ⦏is_expansion_selected⦎ ({fmt_repl, ...} : PP_FMT_INFO) : bool = (
    case fmt_repl of
	Value _	=> true
    |    Nil 	=> false
);
=TEX

=SML
fun ⦏fmt_z_tm⦎ (fmt_info as {outf,...} : PP_FMT_INFO) (z_tm : Z_TM) : unit =
(
    case z_tm of
	ZTmFancyApp ((TmplPre (("Π", Nil), _), ""),
	ZTmTuple[z_tm']) => (
	    fmt_z_tm fmt_info z_tm'
    ) |    ZTmFancyApp ((TmplPre (("Π", Nil), _), ""), z_tm') => (
	    fmt_z_tm fmt_info z_tm'
    ) |    ZTmQuotation (tm, Nil) => (
	    app (fn s => (outf (translate_for_output s); outf "\n"))
		(PrettyPrinter.format_term false tm)
    ) |    _ => outf(translate_for_output(format_z_tm z_tm))
);
=TEX

Leaf functions, these don't call any other functions.

=SML
fun ⦏fmt_id_plus⦎  (fmtinfo as {outf,...}: PP_FMT_INFO) (n : ID) (s : string): unit  = (
	outf(translate_for_output (sfmt_id_plus fmtinfo n s))
);

fun ⦏fmt_id_comma⦎  (fmtinfo : PP_FMT_INFO) (n : ID) : unit  = (
	fmt_id_plus fmtinfo n ","
);

fun ⦏fmt_id_dot⦎  (fmtinfo : PP_FMT_INFO) (n : ID) : unit  = (
	fmt_id_plus fmtinfo n "."
);

fun ⦏fmt_id⦎  (fmtinfo : PP_FMT_INFO) (n : ID) : unit  = (
	fmt_id_plus fmtinfo n ""
);

fun ⦏fmt_id_opt⦎  (fmtinfo : PP_FMT_INFO) (Value n : ID OPT) : unit  = (
	fmt_id_plus fmtinfo n ""
) | fmt_id_opt _ _ = ();

fun ⦏fmt_tmark_plus⦎  (fmtinfo : PP_FMT_INFO) (t : TMARK) (s : string): unit =
	fmt_id_plus fmtinfo t s;
fun ⦏fmt_tmark⦎  (fmtinfo : PP_FMT_INFO) (t : TMARK) : unit =
	fmt_tmark_plus fmtinfo t "";
fun ⦏fmt_tmark_comma⦎  (fmtinfo : PP_FMT_INFO) (t : TMARK) : unit =
	fmt_tmark_plus fmtinfo t ",";

fun ⦏fmt_term⦎  ({outf,...} : PP_FMT_INFO) (z : TERM) : unit = (
let	val cn_als = get_int_control	"cn_automatic_line_splitting";
	val awidth = if cn_als = 0
		then get_line_length()
		else cn_als;
	val awidth1 = if (awidth - len_tab()) < 0
		then 0
		else awidth - len_tab();
	val strs = map translate_for_output
                  (PrettyPrinter.format_term1 false awidth1 z);
=SML
in
	outf (hd strs);
	if (length strs = 1)
	then ()
	else (map (fn s => (outf("\n"); outf(s))) (tl strs);
		())
end);
=TEX
Internally generated labels begin with an underscore. We arrange to comment these
out. This may need a newline to be added depending on the context.
=SML
fun ⦏fmt_label⦎ ({outf,...} : PP_FMT_INFO) (eoln : bool) (label : LABEL) = (
	if	case explode label of
			"_" :: _ => true
		|	x :: more => "0" <= x andalso x <= "9" andalso any more (fn c => c = "_")
		|	[] => false
	then	if	eoln
		then	outf (translate_for_output("-- ("^label^")\n"))
		else	outf (translate_for_output("-- ("^label^")"))
	else	outf (translate_for_output("("^label^")"))
);

fun ⦏fmt_unary_op⦎ ({outf,...} : PP_FMT_INFO) (UOSparkUnaryAdd : UNARY_OP) = outf "+"
  | fmt_unary_op ({outf,...} : PP_FMT_INFO) (UOSparkUnaryMinus : UNARY_OP) = outf "-"
  | fmt_unary_op ({outf,...} : PP_FMT_INFO)(UOSparkNot : UNARY_OP) = outf (kw "not")
  | fmt_unary_op ({outf,...} : PP_FMT_INFO)(UOSparkAbs : UNARY_OP) = outf (kw "abs");

fun ⦏fmt_binary_op⦎ ({outf,...} : PP_FMT_INFO)(BOSparkAdd : BIN_OP) = outf"+"
  | fmt_binary_op ({outf,...} : PP_FMT_INFO)(BOSparkAnd : BIN_OP) = outf (kw "and")
  | fmt_binary_op ({outf,...} : PP_FMT_INFO)(BOSparkAndThen : BIN_OP) = outf (kw "and then")
  | fmt_binary_op ({outf,...} : PP_FMT_INFO)(BOSparkConcat : BIN_OP) = outf "&"
  | fmt_binary_op ({outf,...} : PP_FMT_INFO)(BOSparkEq : BIN_OP) = outf "="
  | fmt_binary_op ({outf,...} : PP_FMT_INFO)(BOSparkExpon : BIN_OP) = outf "**"
  | fmt_binary_op ({outf,...} : PP_FMT_INFO)(BOSparkGreater : BIN_OP) = outf ">"
  | fmt_binary_op ({outf,...} : PP_FMT_INFO)(BOSparkGreaterEq : BIN_OP) = outf ">="
  | fmt_binary_op ({outf,...} : PP_FMT_INFO)(BOSparkDiv : BIN_OP) = outf "/"
  | fmt_binary_op ({outf,...} : PP_FMT_INFO)(BOSparkLess : BIN_OP) = outf "<"
  | fmt_binary_op ({outf,...} : PP_FMT_INFO)(BOSparkLessEq : BIN_OP) = outf "<="
  | fmt_binary_op ({outf,...} : PP_FMT_INFO)(BOSparkMem : BIN_OP) = outf (kw "in")
  | fmt_binary_op ({outf,...} : PP_FMT_INFO)(BOSparkMinus : BIN_OP) = outf "-"
  | fmt_binary_op ({outf,...} : PP_FMT_INFO)(BOSparkMod : BIN_OP) = outf (kw "mod")
  | fmt_binary_op ({outf,...} : PP_FMT_INFO)(BOSparkNotEq : BIN_OP) = outf "/="
  | fmt_binary_op ({outf,...} : PP_FMT_INFO)(BOSparkNotMem : BIN_OP) = outf (kw "not in")
  | fmt_binary_op ({outf,...} : PP_FMT_INFO)(BOSparkOr : BIN_OP) = outf (kw "or")
  | fmt_binary_op ({outf,...} : PP_FMT_INFO)(BOSparkOrElse : BIN_OP) = outf (kw "or else")
  | fmt_binary_op ({outf,...} : PP_FMT_INFO)(BOSparkRem : BIN_OP) = outf (kw "rem")
  | fmt_binary_op ({outf,...} : PP_FMT_INFO)(BOSparkTimes : BIN_OP) = outf "*"
  | fmt_binary_op ({outf,...} : PP_FMT_INFO)(BOSparkXor : BIN_OP) = outf (kw "xor");

fun ⦏fmt_mode⦎ ({outf,...} : PP_FMT_INFO)(MSparkIn true : MODE) = outf (kw"IN")
  | fmt_mode ({outf,...} : PP_FMT_INFO)(MSparkIn false : MODE) = ()
  | fmt_mode ({outf,...} : PP_FMT_INFO)(MSparkOut : MODE) = outf (kw"OUT")
  | fmt_mode ({outf,...} : PP_FMT_INFO)(MSparkInOut : MODE) = outf (kw2"IN""OUT");

fun ⦏fmt_loop_direction⦎ ({outf,...} : PP_FMT_INFO) (LDForwards : LOOP_DIRECTION) = ()
  | fmt_loop_direction ({outf,...} : PP_FMT_INFO)(LDReverse : LOOP_DIRECTION) = outf (kw"REVERSE");
=TEX
To ensure that the string quotes are adjacent to the operator name.
=SML
fun ⦏sfmt_operator_symbol⦎ ({outf,...} : PP_FMT_INFO)(s : OPERATOR_SYMBOL) = (
	( "\"" ^ translate_for_output s ^ "\"")
);
=TEX

Lists of leaf functions.
=SML
fun ⦏fmt_id_list⦎ (fmtinfo : PP_FMT_INFO)([] : ID list) = ()
  | fmt_id_list (fmtinfo : PP_FMT_INFO)([x] : ID list) = (fmt_id fmtinfo x)
  | fmt_id_list (fmtinfo : PP_FMT_INFO)(x::xs: ID list) = (
	(fmt_id_comma fmtinfo x);
	(fmt_id_list fmtinfo xs)
  );

fun ⦏fmt_tmark_list⦎ (_ : PP_FMT_INFO)([] : TMARK list) = ()
  | fmt_tmark_list (fmtinfo : PP_FMT_INFO)([x] : TMARK list) = (fmt_tmark fmtinfo x)
  | fmt_tmark_list (fmtinfo as {outf,...}: PP_FMT_INFO)(x::xs : TMARK list) = (
    (fmt_tmark_comma fmtinfo x);
    (fmt_tmark_list fmtinfo xs)
  );
=TEX

Equivalences to leaf functions.

=SML
fun ⦏loc_fmt_z_pred⦎ (fmtinfo : PP_FMT_INFO) (z : Z_PRED) = fmt_term fmtinfo z;
fun ⦏fmt_z_exp⦎ (fmtinfo : PP_FMT_INFO) (z : Z_EXP) =  fmt_term fmtinfo z;
fun ⦏sfmt_z_id⦎ ({outf, ...} : PP_FMT_INFO) (z : Z_ID) = z;
fun ⦏fmt_z_id⦎ ({outf, ...} : PP_FMT_INFO) (z : Z_ID) = outf (translate_for_output z);
fun ⦏fmt_z_id_comma⦎ ({outf, ...} : PP_FMT_INFO) (z : Z_ID) = outf (translate_for_output z ^ ",");
fun ⦏fmt_z_id_list⦎ (fmtinfo : PP_FMT_INFO)([] : ID list) = ()
  | fmt_z_id_list (fmtinfo : PP_FMT_INFO)([x]) = (
	fmt_z_id fmtinfo x
) | fmt_z_id_list (fmtinfo : PP_FMT_INFO)(x::xs) = (
	(fmt_z_id_comma fmtinfo x);
	(fmt_z_id_list fmtinfo xs)
);
=TEX
The lexical analyser treats attribute identifiers as including the prime character.
We need to work round that to get the case right.
We must not run the identifier through {\it fmt\_id} once we have adjusted the
case, since that would cause a lower case `o' to be translated into a dot.
=SML
fun ⦏fmt_attrib⦎ (fmtinfo as {outf, ...} : PP_FMT_INFO) (x : ATTRIB) = (
	outf (
		case explode (kw ("'"^x)) of
			"'"::more => implode more
		|	weird => implode weird)
);
fun ⦏fmt_int_real_lit⦎ (fmtinfo : PP_FMT_INFO) (x : INT_REAL_LIT) = fmt_id fmtinfo x;
=TEX

\subsection{Expressions}

Expressions.
=SML
fun ⦏fmt_rangelohi⦎ (fmtinfo as {outf,...}: PP_FMT_INFO)
	({lo=l, hi=h} : EXP RANGELOHI) = (
		(loc_fmt_exp1 fmtinfo l);
		outf "..";
		(loc_fmt_exp1 fmtinfo h)
	)
and ⦏fmt_range⦎ (fmtinfo: PP_FMT_INFO)(RRange x : EXP RANGE) = fmt_rangelohi fmtinfo x
  | fmt_range fmtinfo (RRangeAttr x : EXP RANGE) = loc_fmt_exp1 fmtinfo x
and ⦏fmt_discrete_range_constrained⦎ (fmtinfo as {outf,...}: PP_FMT_INFO)
		({tmark=t, range=r} : EXP DISCRETE_RANGE_CONSTRAINED) = (
    (fmt_tmark fmtinfo t);
    outf (kw"RANGE");
    (fmt_range fmtinfo r)
    )
and ⦏fmt_discrete_range⦎ (fmtinfo : PP_FMT_INFO) (DRRange x : DISCRETE_RANGE) = (fmt_range fmtinfo x)
  | fmt_discrete_range (fmtinfo : PP_FMT_INFO)(DRConstrained x : DISCRETE_RANGE) =
    (fmt_discrete_range_constrained fmtinfo x)
and ⦏fmt_agg_choice⦎ (fmtinfo : PP_FMT_INFO) (ACAggChoiceRange x : AGG_CHOICE) = (fmt_discrete_range fmtinfo x)
  | fmt_agg_choice (fmtinfo : PP_FMT_INFO) (ACAggChoiceSingle x : AGG_CHOICE) = (loc_fmt_exp1 fmtinfo x)
and ⦏fmt_agg_choice_list⦎ (_: PP_FMT_INFO)([] : AGG_CHOICE list) = ()
  | fmt_agg_choice_list (fmtinfo as {outf,...}: PP_FMT_INFO) ([x] : AGG_CHOICE list) = (fmt_agg_choice fmtinfo x)
  | fmt_agg_choice_list (fmtinfo as {outf,...}: PP_FMT_INFO) (x::xs : AGG_CHOICE list) = (
	(fmt_agg_choice fmtinfo x);
	outf "|";
	(fmt_agg_choice_list fmtinfo xs)
   )
and ⦏fmt_named_assoc⦎ (fmtinfo as {outf,...}: PP_FMT_INFO)({choice=c, comp=e} : (AGG_CHOICE, EXP) NAMED_ASSOC) = (
    (fmt_agg_choice_list fmtinfo c);
    outf "=>";
    (loc_fmt_exp1 fmtinfo e))
and ⦏fmt_named_assoc_list⦎ (_: PP_FMT_INFO)([] : (AGG_CHOICE, EXP) NAMED_ASSOC list) = ()
  | fmt_named_assoc_list (fmtinfo as {outf,...}: PP_FMT_INFO) ([x] : (AGG_CHOICE, EXP) NAMED_ASSOC list) =
    (fmt_named_assoc fmtinfo x)
  | fmt_named_assoc_list (fmtinfo as {outf,...}: PP_FMT_INFO) (x::xs : (AGG_CHOICE, EXP) NAMED_ASSOC list) = (
	(fmt_named_assoc fmtinfo x);
	outf ",";
	(fmt_named_assoc_list fmtinfo xs)
    )
and ⦏fmt_others⦎ (fmtinfo as {outf,...}: PP_FMT_INFO)({others=oth} : EXP OTHERS) = (
	outf (kw"OTHERS");
	outf "=>";
	(loc_fmt_exp1 fmtinfo oth)
)
and ⦏fmt_agg_pos⦎ (fmtinfo as {outf,...}: PP_FMT_INFO) ({tmark=tm, comps=c} : EXP AGG_POS) =
    (case tm
	of Nil => ( outf "("; (loc_fmt_exp_list1 fmtinfo c); outf ")")
	| Value t => ((fmt_tmark fmtinfo t; outf "'"; outf "(");
		(loc_fmt_exp_list1 fmtinfo c);
		outf ")")
    )
and ⦏fmt_agg_pos_others⦎ (fmtinfo as {outf,...}: PP_FMT_INFO) ({agg_pos = {tmark=tm, comps=c} :
    EXP AGG_POS, others = oth} : EXP AGG_POS_OTHERS) =
    (case tm
	of Nil => (
		outf "(";
		(loc_fmt_exp_list1 fmtinfo c);
		outf ",";
		(fmt_others fmtinfo oth);
		outf ")"
	) | Value t => (
		fmt_tmark fmtinfo t; outf "'"; outf "(";
		(loc_fmt_exp_list1 fmtinfo c);
		outf ",";
		(fmt_others fmtinfo oth);
		outf ")"
	)
    )
and ⦏fmt_agg_others⦎ (fmtinfo as {outf,...}: PP_FMT_INFO) ({tmark=tm, others=oth} : EXP AGG_OTHERS) =
    (case tm
	of Nil =>  (
		outf "(";
		(fmt_others fmtinfo oth);
		outf ")"
    ) | Value t => (
		fmt_tmark fmtinfo t; outf "'"; outf "(";
		(fmt_others fmtinfo oth);
		outf ")"
	)
    )
and ⦏fmt_agg_named⦎ (fmtinfo as {outf,...}: PP_FMT_INFO)
	({tmark=tm,named_assocs=n} : (AGG_CHOICE, EXP) AGG_NAMED) =
    (case tm
	of Nil => (
		outf "(";
		(fmt_named_assoc_list fmtinfo n);
		outf ")"
	) | Value t => (
		fmt_tmark fmtinfo t; outf "'"; outf "(";
		(fmt_named_assoc_list fmtinfo n);
		outf ")"
	)
    )
and ⦏fmt_agg_named_others⦎ (fmtinfo as {outf,...}: PP_FMT_INFO)
	({agg_named=a as{tmark=tm, named_assocs=n}, others=oth} :
		(AGG_CHOICE, EXP) AGG_NAMED_OTHERS) =
    (case tm
	of Nil => (
		outf "(";
		(fmt_named_assoc_list fmtinfo n);
		outf ",";
		(fmt_others fmtinfo oth);
		outf ")"
	) | Value t => (
		(fmt_tmark fmtinfo t; outf "'"; outf "(");
		(fmt_named_assoc_list fmtinfo n);
		outf ",";
		(fmt_others fmtinfo oth);
		outf ")"
	)
    )
and ⦏fmt_unary_exp⦎ (fmtinfo: PP_FMT_INFO) ({uop=u, right=r}
		: EXP UNARY_EXP) =
    ((fmt_unary_op fmtinfo u); (loc_fmt_exp1 fmtinfo r))
and ⦏fmt_bin_exp⦎ (fmtinfo as {outf,...}: PP_FMT_INFO) ({bop=b, left=l, right=r}
		: EXP BIN_EXP) =
    ((loc_fmt_exp1 fmtinfo l); (fmt_binary_op fmtinfo b); (loc_fmt_exp1 fmtinfo r))
and ⦏fmt_attrib_desig⦎ (fmtinfo : PP_FMT_INFO) (ADAttrib x : ATTRIB_DESIG) =
	fmt_attrib fmtinfo x
  | fmt_attrib_desig (fmtinfo as {outf,...}: PP_FMT_INFO) (ADAttribArg (a,e)
		: ATTRIB_DESIG) =
    ((fmt_attrib fmtinfo a); outf "("; (loc_fmt_exp1 fmtinfo e); outf ")")
and ⦏fmt_mem_range⦎ (fmtinfo as {outf,...}: PP_FMT_INFO)
	({left=e, mop=m, range=r} : EXP MEM_RANGE) =
    (loc_fmt_exp1 fmtinfo e; fmt_binary_op fmtinfo m; fmt_range fmtinfo r)
and ⦏fmt_attribute⦎ (fmtinfo as {outf,...}: PP_FMT_INFO)
	({prefix=p, attribute_desig=a} : (EXP, ATTRIB_DESIG) ATTRIBUTE) =
    (loc_fmt_exp1 fmtinfo p; outf"'"; (fmt_attrib_desig fmtinfo a))

and ⦏fmt_indexed_comp⦎ (fmtinfo as {outf,...}: PP_FMT_INFO)
	({prefix=p, index=i} : EXP INDEXED_COMP) = (
    loc_fmt_exp1 fmtinfo p;
    (if (nb_exp fmtinfo i)
    then ( (* bracket *)
	outf "("; loc_fmt_exp1 fmtinfo i;	outf ")"
    ) else (loc_fmt_exp1 fmtinfo i))
   )
and ⦏fmt_selected_comp⦎ (fmtinfo as {outf,...}: PP_FMT_INFO)
	({prefix=p, selector=s} : EXP SELECTED_COMP) =
    (loc_fmt_exp1 fmtinfo p; outf "."; (fmt_id fmtinfo s))
and ⦏fmt_qualified_expression⦎ (fmtinfo as {outf,...}: PP_FMT_INFO)
	({tmark=t, exp=e} : EXP QUALIFIED_EXPRESSION) = (
	(fmt_tmark fmtinfo t);
	outf "'";
	(if (nb_exp fmtinfo e)
	then ( (* bracket *)
	    outf "("; loc_fmt_exp1 fmtinfo e; outf ")"
	) else (loc_fmt_exp1 fmtinfo e)))
and ⦏fmt_type_conversion⦎ (fmtinfo as {outf,...}: PP_FMT_INFO)
	({tmark=t, exp=e} : EXP QUALIFIED_EXPRESSION) = (
	fmt_tmark fmtinfo t;
	(if (nb_exp fmtinfo e)
	then ( (* bracket *)
	outf "("; loc_fmt_exp1 fmtinfo e;	outf ")"
	) else (loc_fmt_exp1 fmtinfo e))
)
and ⦏loc_fmt_exp1⦎ (fmtinfo: PP_FMT_INFO) (EId x : EXP) = (fmt_id fmtinfo x)
  | loc_fmt_exp1 (fmtinfo: PP_FMT_INFO) (EIntReal x : EXP) = (fmt_int_real_lit fmtinfo x)
  | loc_fmt_exp1 (fmtinfo: PP_FMT_INFO) (EArrayAggPos x : EXP) = (fmt_agg_pos fmtinfo x)
  | loc_fmt_exp1 (fmtinfo: PP_FMT_INFO) (EArrayAggPosOthers x : EXP) =
	(fmt_agg_pos_others fmtinfo x)
  | loc_fmt_exp1 (fmtinfo: PP_FMT_INFO) (EArrayAggOthers x : EXP) =
	(fmt_agg_others  fmtinfo x)
  | loc_fmt_exp1 (fmtinfo: PP_FMT_INFO) (EArrayAggNamed x : EXP) =
	(fmt_agg_named fmtinfo x)
  | loc_fmt_exp1 (fmtinfo: PP_FMT_INFO) (EArrayAggNamedOthers x : EXP) =
	(fmt_agg_named_others fmtinfo x)
  | loc_fmt_exp1 (fmtinfo: PP_FMT_INFO) (ERecAggPos x : EXP) = (fmt_agg_pos fmtinfo x)
  | loc_fmt_exp1 (fmtinfo: PP_FMT_INFO) (ERecAggNamed x : EXP) =
    fail "loc_fmt_exp1" 510999 [fn()=>"named record aggregate"]
  | loc_fmt_exp1 (fmtinfo: PP_FMT_INFO) (EUnaryExp x : EXP) = (fmt_unary_exp fmtinfo x)
  | loc_fmt_exp1 (fmtinfo: PP_FMT_INFO) (EBinExp x : EXP) = (fmt_bin_exp fmtinfo x)
  | loc_fmt_exp1 (fmtinfo: PP_FMT_INFO) (EMemRange x : EXP) = (fmt_mem_range fmtinfo x)
  | loc_fmt_exp1 (fmtinfo: PP_FMT_INFO) (EAttribute x : EXP) = (fmt_attribute fmtinfo x)
  | loc_fmt_exp1 (fmtinfo: PP_FMT_INFO) (EIndexedComp x : EXP) =
	(fmt_indexed_comp fmtinfo x)
  | loc_fmt_exp1 (fmtinfo: PP_FMT_INFO) (ESelectedComp x : EXP) =
	(fmt_selected_comp fmtinfo x)
  | loc_fmt_exp1 (fmtinfo: PP_FMT_INFO) (EFunCall x : EXP) =
    fail "loc_fmt_exp1" 510999 [fn()=>"function call"]
  | loc_fmt_exp1 (fmtinfo as {outf,...}: PP_FMT_INFO) (EAuxiliaryExp x : EXP) =
	(outf (translate_for_output "⟦"); (fmt_z_tm fmtinfo x); outf (translate_for_output "⟧"))
  | loc_fmt_exp1 (fmtinfo: PP_FMT_INFO) (EQualifiedExp x : EXP) =
	(fmt_qualified_expression fmtinfo x)
  | loc_fmt_exp1 (fmtinfo: PP_FMT_INFO) (ETypeConversion x : EXP) =
	(fmt_type_conversion fmtinfo x)
  | loc_fmt_exp1 (fmtinfo as {outf, ...} : PP_FMT_INFO) (EBracketed e : EXP) =
	(outf "("; (loc_fmt_exp1 fmtinfo e); outf ")")
(*
=TEX
We don't use {\it translate\_for\_output} on string and character literals to get
things like percent signs right
=SML
*)
  | loc_fmt_exp1 ({outf,...}: PP_FMT_INFO) (EStringLiteral s : EXP) =
	(outf ("\""^s^"\""))
  | loc_fmt_exp1 ({outf,...}: PP_FMT_INFO) (ECharacterLiteral c : EXP) =
	outf ("'"^c^"'")

  | loc_fmt_exp1 (fmtinfo as {outf,...}: PP_FMT_INFO) (EDiscreteRange dr : EXP) =
	fmt_discrete_range fmtinfo dr
and ⦏loc_fmt_exp_list1⦎ (fmtinfo: PP_FMT_INFO) ([] : EXP list) = ()
  | loc_fmt_exp_list1 (fmtinfo: PP_FMT_INFO) ([x] : EXP list) = (loc_fmt_exp1 fmtinfo x)
  | loc_fmt_exp_list1 (fmtinfo as {outf,...} : PP_FMT_INFO) (x::xs : EXP list) =
	((loc_fmt_exp1 fmtinfo x); outf ","; (loc_fmt_exp_list1 fmtinfo xs));
=TEX
=SML
=SML
=SML
datatype ⦏EXP_CONTEXT⦎ =
		⦏ECIndex⦎
	|	⦏ECQualified⦎
	|	⦏ECOther⦎;
=TEX
The following generates warnings by side-effect in addition to returning true iff. no non-SPARK constructs
where found (the return value is not currently used).
=SML
fun ⦏exp_check⦎ (ec : EXP_CONTEXT)  : EXP -> bool = (fn e =>
	case e of
		EId _ => (
		true
	) |	EIntReal _ => (
		true
	) |	EArrayAggPos {comps, ...} => (
		case ec of
			ECOther => (non_spark_warning 510115; false)
		|	ECQualified => all comps (exp_check ECQualified)
		|	ECIndex => all comps (exp_check ECOther)
	) |	EArrayAggPosOthers {agg_pos = {comps, ...}, others = {others}} => (
		case ec of
			ECOther => (non_spark_warning 510115; false)
		|	ECQualified => all (others::comps) (exp_check ECQualified)
		|	ECIndex => all (others::comps) (exp_check ECOther)
	) |	EArrayAggOthers {others = {others}, ...} => (
		case ec of
			ECOther => (non_spark_warning 510115; false)
		|	ECQualified => exp_check ECQualified others
		|	ECIndex => exp_check ECOther others
	) |	EArrayAggNamed {named_assocs, ...} => (
		case ec of
			ECOther => (non_spark_warning 510115; false)
		|	ECQualified => all named_assocs (named_assoc_check ECQualified)
		|	ECIndex => all named_assocs (named_assoc_check ECOther)
	) |	EArrayAggNamedOthers
			{agg_named={named_assocs, ...}, others={others}} => (
		case ec of
			ECOther => (non_spark_warning 510115; false)
		|	ECQualified => all named_assocs (named_assoc_check ECQualified)
					andalso exp_check ECQualified others
		|	ECIndex => all named_assocs (named_assoc_check ECOther)
					andalso exp_check ECOther others
	) |	ERecAggPos {comps, ...} => (
		case ec of
			ECOther => (non_spark_warning 510115; false)
		|	ECQualified => all comps (exp_check ECQualified)
		|	ECIndex => all comps (exp_check ECOther)
	) |	ERecAggNamed {named_assocs, ...} => (
		case ec of
			ECOther => (non_spark_warning 510115; false)
		|	ECQualified => all named_assocs (named_assoc_check ECQualified)
		|	ECIndex => all named_assocs (named_assoc_check ECOther)
	) |	EUnaryExp {right, ...} => (
		exp_check ECOther right
	) |	EBinExp {left, right, ...} => (
		exp_check ECOther left andalso exp_check ECOther right
	) |	EMemRange {left, range, ...} => (
		exp_check ECOther left andalso range_check range
	) |	EAttribute {prefix, attribute_desig = (ADAttrib _)} => (
		exp_check ECOther prefix
	) |	EAttribute {prefix, attribute_desig = (ADAttribArg (_, arg))} => (
		exp_check ECOther prefix andalso exp_check ECOther arg
	) |	EIndexedComp {prefix, index} => (
		exp_check ECOther prefix andalso exp_check ECIndex index
	) |	ESelectedComp {prefix, ...} => (
		exp_check ECOther prefix
	) |	EFunCall {fun_name, args} => (
		all args (exp_check ECOther)
	) |	EAuxiliaryExp _ => (
		non_spark_warning 510122;
		false
	) |	EQualifiedExp {exp, ...} => (
		exp_check ECQualified exp
	) |	ETypeConversion {exp, ...} => (
		exp_check ECOther exp
	) |	EBracketed exp => (
		exp_check ECOther exp
	) |	EStringLiteral _ => (
		true
	) |	ECharacterLiteral _ => (
		true
	) |	EDiscreteRange d => (
		discrete_range_check d
	)
) and ⦏range_check⦎ (r : EXP RANGE) : bool = (
	case r of
		RRange{lo, hi} => exp_check ECOther lo andalso exp_check ECOther hi
	|	RRangeAttr e => exp_check ECOther e
) and ⦏discrete_range_check⦎ (d : DISCRETE_RANGE) : bool = (
	case d of
		DRRange r => range_check r
	|	DRConstrained {range = r, ...} => range_check r
) and ⦏agg_choice_check⦎  (a : AGG_CHOICE) : bool = (
	case a of
		ACAggChoiceRange d => discrete_range_check d
	|	ACAggChoiceSingle e => exp_check ECOther e
) and ⦏named_assoc_check⦎
	 (ec : EXP_CONTEXT)
	(n : (AGG_CHOICE, EXP) NAMED_ASSOC)
	: bool = (
	let	val {choice, comp} = n;
	in	exp_check ec comp andalso all choice agg_choice_check
	end
);
=TEX
=SML
fun ⦏loc_fmt_exp⦎  (fmtinfo: PP_FMT_INFO)(e : EXP) = (
	exp_check ECOther e;
	loc_fmt_exp1 fmtinfo e
);
=TEX
=SML
fun ⦏loc_fmt_exp_list⦎  (fmtinfo: PP_FMT_INFO)(es : EXP list) = (
	map (exp_check ECOther) es;
	loc_fmt_exp_list1 fmtinfo es
);
=TEX
=SML
fun ⦏fmt_static_exp⦎ (fmtinfo: PP_FMT_INFO)(x : STATIC_EXP) = (
	loc_fmt_exp fmtinfo x
);
=TEX
=SML
fun ⦏fmt_static_rangelohi⦎ (fmtinfo as {outf,...}: PP_FMT_INFO) ({lo=l, hi=h} : STATIC_EXP RANGELOHI) = (
	(fmt_static_exp fmtinfo l);
	outf "..";
	(fmt_static_exp fmtinfo h)
);
fun ⦏fmt_static_range⦎ (fmtinfo: PP_FMT_INFO) (RRange x : EXP RANGE) =
	fmt_static_rangelohi fmtinfo x
  | fmt_static_range (fmtinfo: PP_FMT_INFO) (RRangeAttr x : EXP RANGE) =
	fmt_static_exp fmtinfo x;

fun ⦏fmt_cond⦎ (fmtinfo: PP_FMT_INFO) (c : COND) = (loc_fmt_exp fmtinfo c);

fun ⦏fmt_actuals⦎ (fmtinfo as {outf,...} : PP_FMT_INFO) (APositional x : (AGG_CHOICE, EXP) ACTUALS) =
    (case x
	of [] => ()
	| z => (
		outf "(";
		(loc_fmt_exp_list fmtinfo x);
		outf ")"
	)
    )
  | fmt_actuals (fmtinfo as {outf,...}: PP_FMT_INFO) (ANamed x : (AGG_CHOICE, EXP) ACTUALS) =
    (case x
	of [] => ()
	| z => (
		outf "(";
		(fmt_named_assoc_list fmtinfo x);
		outf ")"
	)
    );
=TEX
=SML
fun ⦏check_range_not_attr⦎ (_ : int) (RRange _ : EXP RANGE) = ()
|   check_range_not_attr msg_num (RRangeAttr _) = non_spark_warning msg_num;
=TEX
\subsection{Statements}

A datatype and a few auxiliary functions before we do statements.

=SML
datatype ⦏SPEC_STATEMENT_TYPE⦎ =
	⦏SpecStatement⦎
|	⦏Assertion⦎
|	⦏ProcedureSpecStatement⦎
|	⦏FunctionSpecStatement⦎;
=TEX
=SML
fun ⦏loc_fmt_spec⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
	(tipe : SPEC_STATEMENT_TYPE,
		globals : Z_ID list,
		{w=w, w0=w0, pre=pre, post=post} : SPEC) = (
	let	fun out_zids [] = ()
		|   out_zids [zn] = outf ((sfmt_z_id fmtinfo) (translate_for_output zn))
		|   out_zids (zn::zns) = (out_zids [zn]; outf ","; out_zids zns);
		fun out_frame () = (
			case tipe of
				FunctionSpecStatement => ()
			|	_ => (
				outf(translate_for_output
		(case tipe of Assertion => "Γ" | _ => "Δ"));
				out_zids w
			)
		);
		fun out_globals () = (
			(case tipe of
				FunctionSpecStatement => (
					outf(translate_for_output "Ξ")
				)
			|	_ => (
				case globals of
					[] => ()
				|	_ => (
					outf(translate_for_output "Ξ")
				)
			));
			out_zids globals
		);

	in	out_frame ();
		out_globals ();
		outf(case tipe of Assertion => "{" | _ =>  "[");
		(fmt_z_tm fmtinfo pre);
		(case tipe of
			Assertion => ()
		|	_ =>  (outf ","; fmt_z_tm fmtinfo post));
		outf(case tipe of Assertion => "}" | _ =>  "]")
	end
);

fun ⦏fmt_proc_call⦎ (fmtinfo : PP_FMT_INFO)
	({name=n, actuals=e} : (AGG_CHOICE, EXP) PROC_CALL) =
    ((fmt_id fmtinfo n); (fmt_actuals fmtinfo e));
=TEX
=SML
fun ⦏fmt_pragma⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
		({id, args} : (AGG_CHOICE, EXP) PRAGMA) : unit = (
let	fun fmt_arg (Nil, e) =
		loc_fmt_exp fmtinfo e
	|   fmt_arg (Value ac, e) = (
		fmt_agg_choice fmtinfo ac;
		outf "=>";
		loc_fmt_exp fmtinfo e
	);
	fun fmt_arg_list [] = ()
	| fmt_arg_list [x] = fmt_arg x
	| fmt_arg_list (x :: xs) = (
		fmt_arg x;
		outf ",";
		fmt_arg_list xs
	);
in	(outf (kw"PRAGMA" ^" "^ kw id);
	(case args of
		[] => (outf ";"; outf "\n")
		| _ => (
			outf "(";
			fmt_arg_list args;
			outf ")"; outf ";";
			outf "\n"
		)
	))
end);
=TEX
At version 2.5.7 and later, the lexical analyser let us get strings
in arbitrary Ada right by doing the translation for output on the
non-string parts of the Ada for us. This means that `%' and `Q'
in strings print correctly.
=SML
fun ⦏loc_fmt_replaced_by_arbitrary_ada⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
	({label, replacement} : REPLACED_BY_ARBITRARY_ADA ) = (
	(fmt_label fmtinfo true label);
	outf (translate_for_output "!≡" ^ replacement);
	outf "\n"
);
=TEX
At version 2.5.7 and later, the lexical analyser helps us get strings
in annotations right, by doing the translation for output for us on
the non-string parts of the annotation. This means that `%' and `Q'
in strings print correctly.
=SML
fun ⦏fmt_ann⦎ (fmtinfo as {outf,fmt_repl} : PP_FMT_INFO)
	(anks as ANKSlot {content, label} : ANN) = (
    case fmt_repl of
    Value f => (f outf label; ())
    | Nil => (outf (translate_for_output ("⟨ " ^ content^" ⟩    "));
	(fmt_label fmtinfo false label);
	outf "\n"
    )
) |   fmt_ann (fmtinfo as {outf,fmt_repl} : PP_FMT_INFO) (ANString ann) = (
	outf ann;
	outf "\n"
);
=TEX
=SML
fun ⦏fmt_annotation⦎ (fmtinfo : PP_FMT_INFO) (anns: ANNOTATION) = (
	(map (fmt_ann fmtinfo) anns; ())
);
=IGN
=TEX
=SML
fun ⦏loc_fmt_spec_no_ivars⦎ (fmtinfo as {outf, fmt_repl} : PP_FMT_INFO) (s as
		{spec, label, is_assertion} : SPEC_NO_IVARS) = (
	if	(case fmt_repl of
			Value f =>  is_assertion orelse (f outf label)
		|	Nil => false)
	then	()
	else	(
		loc_fmt_spec fmtinfo
		(if is_assertion then Assertion else SpecStatement, [], spec);
		outf "    ";
		(fmt_label fmtinfo false label);
		outf "\n"
	)
);
=TEX

Statements.

=SML
fun ⦏fmt_assign⦎ (fmtinfo as {outf,...} : PP_FMT_INFO) ({name=n, e=e} : ASSIGN) = (
	(loc_fmt_exp fmtinfo n);
	outf ":=";
	(loc_fmt_exp fmtinfo e);
	outf ";";
	outf "\n"
);

fun ⦏fmt_exit_when⦎ (fmtinfo as {outf,...} : PP_FMT_INFO) ({g=g, n = n} : EXIT_WHEN) = (
	outf (kw"EXIT");
	(case n of
		Value name => (
			non_spark_warning 510118;
			fmt_id fmtinfo name
		) | _ => ());
	outf (kw"WHEN");
	(fmt_cond fmtinfo g);
	outf ";";
	outf "\n"
);

fun ⦏fmt_exit⦎ (fmtinfo as {outf,...} : PP_FMT_INFO) ({n = n} : EXIT) = (
	outf (kw"EXIT");
	(case n of
		Value name => (
			non_spark_warning 510118;
			fmt_id fmtinfo name
		) | _ => ());
	outf ";";
	outf "\n"
);
=TEX
=SML
fun ⦏fmt_return⦎ (fmtinfo as {outf,...} : PP_FMT_INFO) ({e=e} : RETURN) = (
	outf (kw"RETURN");
	(case e of Value exp => loc_fmt_exp fmtinfo exp | _ => non_spark_warning 510119);
	outf ";";
	outf "\n"
);
=TEX
=SML
fun ⦏fmt_goto⦎ (fmtinfo as {outf,...} : PP_FMT_INFO) ({label} : GOTO) = (
	non_spark_warning 510128;
	outf (kw"GOTO");
	fmt_tmark fmtinfo label;
	outf ";";
	outf "\n"
);
=TEX
=SML
fun ⦏fmt_proc_call_no_ivars⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
	(x : (AGG_CHOICE, EXP) PROC_CALL_NO_IVARS) = (
	(fmt_proc_call fmtinfo x);
	outf ";";
	outf "\n"
);

fun ⦏fmt_k_slot⦎ (fmtinfo as {outf, fmt_repl} : PP_FMT_INFO) ({content, label} : K_SLOT) = (
    case fmt_repl of
    Value f =>    (f outf label; ())
    |Nil =>    (
	outf (translate_for_output "⟨");
	outf (translate_for_output content);
	outf (translate_for_output " ⟩   ");
	(fmt_label fmtinfo false label);
	outf "\n"
	)
);
=TEX
For else parts and for semicolon, we need to be able to detect when a statement comprises
only implicit nulls. The following function tests for this condition. It will return
false if the {fmt\_repl} component is Nil and the statement contains statement labels.
=SML
fun ⦏all_implicit_nulls⦎
	(fmt_stat : PP_FMT_INFO -> STATEMENT -> unit)
	 ({fmt_repl, ...} : PP_FMT_INFO)  (stmt :  STATEMENT) :  bool = (
	let	val saved_cn_spark_syntax_warnings = !cn_spark_syntax_warnings;
		val _ = cn_spark_syntax_warnings := false;
		val saved_error_checking = !error_checking;
		val _ = error_checking := false;
		val result =
			let	exception FoundSomething;
				fun outf _ = raise FoundSomething;
			in	(fmt_stat {fmt_repl = fmt_repl, outf = outf} stmt; true)
				handle FoundSomething => false
			end;
		val _ = cn_spark_syntax_warnings := saved_cn_spark_syntax_warnings;
		val _ = error_checking := saved_error_checking;
	in	result
	end
);
=TEX
=SML
fun ⦏fmt_elsif⦎
	(fmt_stat : PP_FMT_INFO -> STATEMENT -> unit)
	(fmtinfo as {outf,...} : PP_FMT_INFO)
	(stmt as (STIfThenElse {g=g, p=p, q=q, elsif=true}) : STATEMENT) = (
	outf (kw"ELSIF");
	(fmt_cond fmtinfo g);
	outf "\n";
	outf (kw"THEN");
	outf "\n";
	inc_tabs ();
	(fmt_stat fmtinfo p);
	dec_tabs();
	(fmt_elsif fmt_stat fmtinfo q)
   )
  | fmt_elsif fmt_stat (fmtinfo as {outf,...} : PP_FMT_INFO)
	(stmt as (STIfThenElse {g=g, p=p, q=q, elsif=false}) : STATEMENT) = (
	outf (kw"ELSIF");
	(fmt_cond fmtinfo g); outf "\n";
	outf (kw"THEN"); outf "\n";
	inc_tabs(); fmt_stat fmtinfo p; dec_tabs();
	(if all_implicit_nulls fmt_stat fmtinfo q
	then	()
	else	(outf (kw"ELSE"); outf "\n";
		inc_tabs();
		(fmt_stat fmtinfo q);
		dec_tabs())
	)
   )
  | fmt_elsif fmt_stat (fmtinfo as {outf,...} : PP_FMT_INFO) (stmt : STATEMENT) = (
	inc_tabs();
	(fmt_stat fmtinfo stmt);
	dec_tabs()
  );
=TEX
=SML
fun ⦏fmt_if_then_else⦎
	(fmt_stat : PP_FMT_INFO -> STATEMENT -> unit)
	(fmtinfo as {outf,...} : PP_FMT_INFO)
	({g=g, p=p, q=q, elsif=false} : STATEMENT IF_THEN_ELSE) = (
	outf (kw"IF");
	(fmt_cond fmtinfo g);
	outf "\n";
	outf (kw"THEN");
	outf "\n";
	inc_tabs();
	(fmt_stat fmtinfo p);
	dec_tabs();
	(if all_implicit_nulls fmt_stat fmtinfo q
	then	()
	else	(outf (kw"ELSE"); outf "\n";
		inc_tabs();
		(fmt_stat fmtinfo q);
		dec_tabs())
	);
	outf (kw2"END" "IF" ^ ";");
	outf "\n"
  ) | fmt_if_then_else fmt_stat (fmtinfo as {outf,...} : PP_FMT_INFO)
	({g=g, p=p, q=q, elsif=true} : STATEMENT IF_THEN_ELSE) = (
	outf (kw"IF");
	(fmt_cond fmtinfo g);
	outf "\n";
	outf (kw"THEN");
	outf "\n";
	inc_tabs();
	(fmt_stat fmtinfo p);
	dec_tabs();
	(fmt_elsif fmt_stat fmtinfo q);
	outf (kw2"END""IF"^";");
	outf "\n"
   );
=TEX
=SML
fun ⦏fmt_case_choice⦎ (fmtinfo : PP_FMT_INFO) (CCCaseExp x : CASE_CHOICE) = (loc_fmt_exp fmtinfo x)
  | fmt_case_choice (fmtinfo : PP_FMT_INFO) (CCCaseRange x : CASE_CHOICE) = (fmt_discrete_range fmtinfo x)
and ⦏fmt_case_choice_list⦎  (fmtinfo : PP_FMT_INFO) ([] : CASE_CHOICE list) = ()
  | fmt_case_choice_list (fmtinfo : PP_FMT_INFO) ([x] : CASE_CHOICE list) = (fmt_case_choice fmtinfo x)
  | fmt_case_choice_list  (fmtinfo as {outf,...} : PP_FMT_INFO) (x::xs : CASE_CHOICE list) = (
	(fmt_case_choice fmtinfo x);
	outf "|";
	(fmt_case_choice_list fmtinfo xs)
   );
=TEX
=SML
fun ⦏fmt_case_alt⦎
	(fmt_stat : PP_FMT_INFO -> STATEMENT -> unit)
	(fmtinfo as {outf,...} : PP_FMT_INFO)
	({choices=c, p=s} : STATEMENT CASE_ALTERNATIVE) = (
	outf (kw"WHEN");
	(fmt_case_choice_list fmtinfo c);
	outf "=>";
	outf"\n";
	inc_tabs();
	(fmt_stat fmtinfo s);
	dec_tabs(); outf "\n"
);
=TEX
=SML
fun ⦏fmt_case_alt_list⦎
	(fmt_stat : PP_FMT_INFO -> STATEMENT -> unit)
	(fmtinfo : PP_FMT_INFO)
	([] : STATEMENT CASE_ALTERNATIVE list) = ()
  | fmt_case_alt_list fmt_stat (fmtinfo : PP_FMT_INFO)
	(x::xs : STATEMENT CASE_ALTERNATIVE list) = (
	(fmt_case_alt fmt_stat fmtinfo x);
	(fmt_case_alt_list fmt_stat fmtinfo xs)
   );
=TEX
=SML
fun ⦏fmt_case⦎
	(fmt_stat : PP_FMT_INFO -> STATEMENT -> unit)
	(fmtinfo as {outf,...} : PP_FMT_INFO)
	({e=e, s=s, others=oth} : STATEMENT CASE) = (
	outf (kw"CASE");
	(loc_fmt_exp fmtinfo e);
	outf (kw"IS"); outf "\n";
	fmt_warnings fmtinfo;
	inc_tabs();
	(fmt_case_alt_list fmt_stat fmtinfo s);
	(if	all_implicit_nulls fmt_stat fmtinfo oth
	then	()
	else	(outf (kw2"WHEN""OTHERS" ^ " =>");
			outf"\n";
			inc_tabs();
			fmt_stat fmtinfo oth;
			dec_tabs()
		)
	);
	dec_tabs();
	outf (kw2"END""CASE"^";");
	outf "\n"
   );
=TEX
=SML
fun ⦏fmt_loop_or_block_label⦎ (fmtinfo as {outf, ...})  (n : LOOP_OR_BLOCK_NAME): unit = (
	case n of
		LBNoName => (
		()
	) |	LBAdaName n => (
		fmt_id fmtinfo n; outf ":"; outf "\n"
	) |	LBCNName n => (
		(if is_expansion_selected fmtinfo then outf "-- " else ());
		outf (kw"$BLOCK");
		fmt_id fmtinfo n; outf ":"; outf "\n"
	)
);
=TEX
=SML
fun ⦏finish_loop_or_block⦎ (fmtinfo as {outf, ...})  (n : LOOP_OR_BLOCK_NAME): unit = (
	case n of
		LBNoName => (
		outf ";"; outf "\n"
	) |	LBAdaName n => (
		fmt_id fmtinfo n; outf ";"; outf "\n"
	) |	LBCNName n => (
		(if is_expansion_selected fmtinfo then outf "; -- " else ());
		outf (kw"$BLOCK");
		fmt_id fmtinfo n;
		outf ";";
		outf "\n"
	)
);
=TEX
=SML
fun ⦏fmt_loop_body⦎
	(fmt_stat : PP_FMT_INFO -> STATEMENT -> unit)
	(fmtinfo as {outf, fmt_repl} : PP_FMT_INFO) ({t=Value t, stmt=s} : STATEMENT LOOP_BODY, n : LOOP_OR_BLOCK_NAME) =  (
	(case fmt_repl of
	Value _  => (outf "-- $TILL statement"; outf "\n")
	| Nil =>  (
		outf (kw"$TILL");
		outf (translate_for_output "⟦");
		(fmt_z_tm fmtinfo t);
		outf (translate_for_output "⟧");
		outf "\n")
	);
	outf (kw"LOOP"); outf "\n";
	inc_tabs(); fmt_stat fmtinfo s; dec_tabs();
	outf (kw2"END""LOOP"); finish_loop_or_block fmtinfo n
)  | fmt_loop_body fmt_stat (fmtinfo as {outf, ...}) ({t=Nil, stmt=s, ...}, n) = (
	outf (kw"LOOP"); outf "\n";
	inc_tabs(); fmt_stat fmtinfo s; dec_tabs();
	outf (kw2"END""LOOP"); finish_loop_or_block fmtinfo n
);
=TEX
=SML
fun ⦏fmt_loop⦎
	(fmt_stat : PP_FMT_INFO -> STATEMENT -> unit)
	(fmtinfo as {outf,...} : PP_FMT_INFO)
	({name=n, loop = {t=Value t, stmt=s}} : STATEMENT LOOP) = (
    in_new_scope false (get_scope_name n)
	(fn () => (
	fmt_loop_or_block_label fmtinfo n;
	(    if is_expansion_selected fmtinfo
	then    (outf "-- $TILL statement"; outf "\n")
	else    (
		outf (kw"$TILL");
		outf (translate_for_output "⟦");
		(fmt_z_tm fmtinfo t);
		outf (translate_for_output "⟧"); outf "\n")
	);
	outf (kw"LOOP"); outf "\n";
	inc_tabs();
	(fmt_stat fmtinfo s);
	dec_tabs();
	outf (kw2"END""LOOP"); finish_loop_or_block fmtinfo n
	)
   )
)  | fmt_loop fmt_stat (fmtinfo as {outf,...} : PP_FMT_INFO)
	({name=n, loop = {t=Nil, stmt=s}} : STATEMENT LOOP) = (
    in_new_scope false
	(case n of LBAdaName i => i | _ => "")
	(fn () => (
	fmt_loop_or_block_label fmtinfo n;
	outf (kw"LOOP"); outf "\n";
	(inc_tabs(); fmt_stat fmtinfo s; dec_tabs());
	outf (kw2"END""LOOP"); finish_loop_or_block fmtinfo n
    ))
);
=TEX
=SML
fun ⦏fmt_while⦎
	(fmt_stat : PP_FMT_INFO -> STATEMENT -> unit)
	(fmtinfo as {outf,...} : PP_FMT_INFO)
	({name=n, g=g, loop=l} : STATEMENT WHILE) = (
in_new_scope false (get_scope_name n) (fn () => (
	fmt_loop_or_block_label fmtinfo n;
	outf  (kw"WHILE"); (fmt_cond fmtinfo g); outf "\n";
	fmt_warnings fmtinfo;
	fmt_loop_body fmt_stat fmtinfo (l, n)))
);
=TEX
=SML
fun ⦏fmt_for_static⦎
	(fmt_stat : PP_FMT_INFO -> STATEMENT -> unit)
	(fmtinfo as {outf,...} : PP_FMT_INFO)
	({name=n, tmark=t, i=i, dir=d, range=r, loop=loop}:
    STATEMENT FOR_STATIC) = (
    in_new_scope false
	(case n of LBAdaName i => i | _ => "")
    (fn () => (
	check_decl i;
	fmt_loop_or_block_label fmtinfo n;
	outf (kw"FOR"); fmt_id fmtinfo i; outf (kw"IN");
	fmt_loop_direction fmtinfo d;
	(case t of Value tm => (fmt_tmark fmtinfo tm; outf (kw"RANGE")) | Nil => non_spark_warning 510116);
	(fmt_range fmtinfo r); outf"\n";
	fmt_warnings fmtinfo;
	fmt_loop_body fmt_stat fmtinfo (loop, n)
)));
=TEX
=SML
fun ⦏fmt_for_tmark⦎
	(fmt_stat : PP_FMT_INFO -> STATEMENT -> unit)
	(fmtinfo as {outf,...} : PP_FMT_INFO)
	({name=n, i=i, tmark=t, dir=d, loop=loop} :
    STATEMENT FOR_TMARK) = (
    in_new_scope false
	(case n of LBAdaName i => i | _ => "")
	(fn () => (
	check_decl i;
	fmt_loop_or_block_label fmtinfo n;
	outf (kw"FOR"); fmt_id fmtinfo i; outf (kw"IN");
	(fmt_loop_direction fmtinfo d);(fmt_tmark fmtinfo t); outf "\n";
	fmt_warnings fmtinfo;
	fmt_loop_body fmt_stat fmtinfo (loop, n)
)));
=TEX
=SML
fun ⦏fmt_labelled⦎
	(fmt_stat : PP_FMT_INFO -> STATEMENT -> unit)
	(fmtinfo as {outf,...} : PP_FMT_INFO)
	({label, statement} : STATEMENT LABELLED) : unit = (
	non_spark_warning 510127;
	outf "<<"; fmt_id fmtinfo label; outf ">>"; outf"\n";
	fmt_stat fmtinfo statement
);
=TEX

Logical constructs.

=SML
fun ⦏fmt_log_con⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
	({defs=defs, spec=s, label, ...} : LOG_CON) = (
    if is_expansion_selected fmtinfo
    then    loc_fmt_spec_no_ivars fmtinfo {spec=s, label=label, is_assertion = false}
    else    (let	fun outdefs [] = ()
		|   outdefs [{x, t, e}] = (
			fmt_z_id fmtinfo x; outf ":"; fmt_z_tm fmtinfo t
		) | outdefs ({x, t, e}::more) = (
			fmt_z_id fmtinfo x; outf ":"; fmt_z_tm fmtinfo t; outf ";";
			outdefs more
		);
	   in
		outf (kw"$CON ");
		outdefs defs;
		outf "⦁";
		(loc_fmt_spec fmtinfo (SpecStatement, [], s));
		outf "    ";(fmt_label fmtinfo false label);
		outf "\n"
	   end
	)
);
=TEX
The function for formatting a statement is defined later on by mutual recursion with the one
for declarations.
=TEX

\subsection{Declarations and Type Definitions}
=TEX

Floating point type constraint.

=SML
fun ⦏fmt_floating_point_constraint⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
	({exp=e, range=Value r} : EXP FLOATING_POINT_CONSTRAINT) = (
	check_range_not_attr 510108 r;
	outf (kw"DIGITS"); (loc_fmt_exp fmtinfo e); outf (kw"RANGE");
	(fmt_range fmtinfo r)
  ) | fmt_floating_point_constraint (fmtinfo as {outf,...} : PP_FMT_INFO)
	({exp=e, range=Nil} : EXP FLOATING_POINT_CONSTRAINT) = (
	outf (kw"DIGITS"); loc_fmt_exp fmtinfo e)
and ⦏fmt_floating_type_def⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
	(name, x : EXP FLOATING_TYPE_DEF) = (
    check_decl name;
	outf (kw"TYPE"); (fmt_id fmtinfo name);
	outf (kw"IS"); (fmt_floating_point_constraint fmtinfo x); outf ";"; outf "\n"
);
=TEX

Fixed point type constraints.

=SML
fun ⦏fmt_fixed_point_constraint⦎(fmtinfo as {outf,...} : PP_FMT_INFO)
	({exp=e, range=Value r} : EXP FIXED_POINT_CONSTRAINT) = (
	check_range_not_attr 510108 r;
	outf (kw"DELTA"); (loc_fmt_exp fmtinfo e); outf (kw"RANGE");
	(fmt_range fmtinfo r)
) | fmt_fixed_point_constraint(fmtinfo as {outf,...} : PP_FMT_INFO)
	({exp=e, range=Nil} : EXP FIXED_POINT_CONSTRAINT) = (
	outf (kw"DELTA"); loc_fmt_exp fmtinfo e);
=TEX
=SML
fun ⦏fmt_fixed_type_def⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
	(name, x : EXP FIXED_TYPE_DEF) = (
    check_decl name;
	outf (kw"TYPE"); (fmt_id fmtinfo name);
	outf (kw"IS"); (fmt_fixed_point_constraint fmtinfo x); outf ";"; outf "\n"
);
=TEX
Constraints in the basic syntax:
=SML
fun ⦏fmt_constraint⦎ (fmtinfo as {outf,...} : PP_FMT_INFO) (CRange x : CONSTRAINT) = (
	outf (kw"RANGE"); fmt_range fmtinfo x)
  | fmt_constraint (fmtinfo as {outf,...} : PP_FMT_INFO) (CIndex x : CONSTRAINT) = (
	outf "("; loc_fmt_exp_list fmtinfo x; outf ")")
  | fmt_constraint (fmtinfo as {outf,...} : PP_FMT_INFO) (CDiscriminant x : CONSTRAINT) = (
	outf "("; loc_fmt_exp_list fmtinfo x; outf ")")
  | fmt_constraint (fmtinfo : PP_FMT_INFO)(CFloating x : CONSTRAINT) =
    (fmt_floating_point_constraint fmtinfo x)
  | fmt_constraint (fmtinfo : PP_FMT_INFO)(CFixed x : CONSTRAINT) =
    (fmt_fixed_point_constraint fmtinfo x)
  | fmt_constraint (fmtinfo : PP_FMT_INFO)(CNoCon : CONSTRAINT) =
    ();
=TEX
Subtype indications in the basic syntax:
=SML
fun ⦏fmt_sub_ind⦎
	(fmtinfo : PP_FMT_INFO)
	({tmark=t, con=c} : CONSTRAINT SUB_IND) = (
    (fmt_tmark fmtinfo t; fmt_constraint fmtinfo c)
);
=TEX
Discrete ranges in the derived syntax:
=SML
fun ⦏fmt_si_discrete_range⦎
	(fmtinfo : PP_FMT_INFO)
	(SIDiscreteRangeSubInd si : SI_DISCRETE_RANGE) = fmt_sub_ind fmtinfo si
|  fmt_si_discrete_range
	(fmtinfo : PP_FMT_INFO)
	(SIDiscreteRangeRange range) = fmt_range fmtinfo range;
=TEX
Lists of the above:
=SML
fun ⦏fmt_si_discrete_range_list⦎ (fmtinfo: PP_FMT_INFO)
	([] : SI_DISCRETE_RANGE list) = ()
  | fmt_si_discrete_range_list (fmtinfo: PP_FMT_INFO)
	([x]) = (fmt_si_discrete_range fmtinfo x)
  | fmt_si_discrete_range_list (fmtinfo as {outf,...} : PP_FMT_INFO)
	(x::xs) =
	((fmt_si_discrete_range fmtinfo x); outf ","; (fmt_si_discrete_range_list fmtinfo xs));
=SML
fun ⦏check_si_discrete_range_no_con⦎
	(msg_num : int)
	(SIDiscreteRangeSubInd {con = CNoCon, ...} : SI_DISCRETE_RANGE) =()
|  check_si_discrete_range_no_con
	(msg_num)
	_ = non_spark_warning msg_num;
=TEX
=TEX
Constraints in the derived syntax:

Note that the context free parsing is unable to distinguish discriminant constraints from index
constraints.
=SML
fun ⦏fmt_si_constraint⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
	(SIRangeCon x : SI_CONSTRAINT) = (
	outf (kw"RANGE"); fmt_range fmtinfo x)
  | fmt_si_constraint (fmtinfo as {outf,...} : PP_FMT_INFO)
	(SIIndexCon x) = (
	(map (check_si_discrete_range_no_con 510111) x);
	outf "("; fmt_si_discrete_range_list fmtinfo x; outf ")")
  | fmt_si_constraint (fmtinfo as {outf,...} : PP_FMT_INFO)
	(SIDiscriminantCon [EArrayAggPos{comps, ...}]) = (
	(if	any comps (fn EDiscreteRange _ => true | _ => false)
	then	non_spark_warning 510111
	else	());
	outf "("; loc_fmt_exp_list fmtinfo comps; outf ")")
  | fmt_si_constraint (fmtinfo as {outf,...} : PP_FMT_INFO)
	(SIDiscriminantCon x) = (
	outf "("; loc_fmt_exp_list fmtinfo x; outf ")")
  | fmt_si_constraint (fmtinfo : PP_FMT_INFO)
	(SIFloatingCon x) =
    (fmt_floating_point_constraint fmtinfo x)
  | fmt_si_constraint (fmtinfo : PP_FMT_INFO)
	(SIFixedCon x) =
    (fmt_fixed_point_constraint fmtinfo x)
  | fmt_si_constraint (fmtinfo : PP_FMT_INFO)
	(SINoCon) =
    ();
=TEX
From now on everything is in the derived syntax and we
sometimes drop the `si' prefix from
the function names.

Subtype indications, lists of same:
=SML
fun ⦏fmt_si_sub_ind⦎
	(fmtinfo : PP_FMT_INFO)
	({tmark=t, con=c} : SI_SUB_IND) =
    (fmt_tmark fmtinfo t; fmt_si_constraint fmtinfo c);
=TEX
=SML
fun ⦏check_si_no_con⦎ (msg_num : int)  ({con = SINoCon, ...} : SI_SUB_IND) : unit = ()
|    check_si_no_con msg_num _ = (
	non_spark_warning msg_num
);
=TEX
=SML
fun ⦏check_si_not_fixed⦎ ({con = SIFixedCon _, ...} : SI_SUB_IND) : unit = (
	non_spark_warning 510105
) |    check_si_not_fixed _ = (
	()
);
=TEX
=SML
fun ⦏check_si_not_floating⦎ ({con = SIFloatingCon _, ...} : SI_SUB_IND) : unit = (
	non_spark_warning 510106
) |    check_si_not_floating _ = (
	()
);
=TEX
=SML
fun ⦏fmt_si_sub_ind_list⦎ (_ : PP_FMT_INFO)
	([] : SI_SUB_IND list) = ()
  | fmt_si_sub_ind_list (fmtinfo : PP_FMT_INFO)
	([x]) = (fmt_si_sub_ind fmtinfo x)
  | fmt_si_sub_ind_list (fmtinfo as {outf,...}: PP_FMT_INFO)
	(x::xs) = (
	fmt_si_sub_ind fmtinfo x; outf ","; fmt_si_sub_ind_list fmtinfo xs
);
=TEX
Subtype declarations:
=SML
fun ⦏fmt_subtype_decl⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
	(d as {name=n, sub_ind=s} : CONSTRAINT SUBTYPE_DECL) = (
	check_decl n;
	outf (kw"SUBTYPE"); (fmt_id fmtinfo n);
	outf (kw"IS"); (fmt_sub_ind fmtinfo s); outf ";"; outf "\n"
);

fun ⦏fmt_si_subtype_decl⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
	(d as {name=n, type_def=s} : SI_SUBTYPE_DECL) = (
	check_decl n;
	check_si_not_fixed s;
	check_si_not_floating s;
	outf (kw"SUBTYPE"); (fmt_id fmtinfo n);
	outf (kw"IS"); (fmt_si_sub_ind fmtinfo s); outf ";"; outf "\n"
);
=TEX
=SML
fun ⦏fmt_derived_type_def⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
	(name, x : SI_SUB_IND) = (
    check_decl name;
	outf (kw"TYPE"); (fmt_id fmtinfo name);
	outf (kw"IS"); outf (kw"NEW");
	(fmt_si_sub_ind fmtinfo x); outf ";"; outf "\n"
);
=TEX
Variable declarations.

=SML
fun ⦏loc_fmt_si_var_decl⦎ (msg_num : int) (fmtinfo as {outf,...} : PP_FMT_INFO)
	({vars=v, t=t} : SI_VAR_DECL) = (
	map check_decl v;
	(fmt_id_list fmtinfo v);
	outf ":";
	check_si_no_con msg_num t;
	(fmt_si_sub_ind fmtinfo t);
	outf ";"; outf "\n"
);

fun loc_fmt_si_var_decl_list (_ : int) (_ : PP_FMT_INFO) ([] : SI_VAR_DECL list) = ()
  | loc_fmt_si_var_decl_list msg_num (fmtinfo as {outf,...} : PP_FMT_INFO) (x::xs : SI_VAR_DECL list) = (
    loc_fmt_si_var_decl msg_num fmtinfo x;
    fmt_warnings fmtinfo;
    loc_fmt_si_var_decl_list msg_num fmtinfo xs
);

fun ⦏loc_fmt_var_decl⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
	({vars=v, tmark=t} : VAR_DECL) = (
	map check_decl v;
	(fmt_id_list fmtinfo v);
	outf ":";
	(fmt_tmark fmtinfo t);
	outf ";"; outf "\n"
) and loc_fmt_var_decl_list (fmtinfo as {outf,...} : PP_FMT_INFO) ([] : VAR_DECL list) = ()
  | loc_fmt_var_decl_list (fmtinfo as {outf,...} : PP_FMT_INFO) (x::xs : VAR_DECL list) =
    (loc_fmt_var_decl fmtinfo x; loc_fmt_var_decl_list fmtinfo xs);
=TEX

Initialised variables.
=SML
fun ⦏fmt_var_init_decl⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
		(({vars=v, tmark=t} : VAR_DECL), exp : EXP) = (
	map check_decl v;
	(fmt_id_list fmtinfo v);
	outf ":";
	(fmt_tmark fmtinfo t);
	outf ":=";
	(loc_fmt_exp fmtinfo exp);
	outf ";"; outf "\n"
);

fun ⦏fmt_si_var_init_decl⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
		(({vars=v, t=t} : SI_VAR_DECL), exp : EXP) = (
	map check_decl v;
	(fmt_id_list fmtinfo v);
	outf ":";
	check_si_no_con 510101 t;
	(fmt_si_sub_ind fmtinfo t);
	outf ":=";
	(loc_fmt_exp fmtinfo exp);
	outf ";"; outf "\n"
);
=TEX

Constant and deferred constant declarations.

=SML
fun ⦏fmt_const_decl⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
	({consts=c, tm=t, expr=e} : EXP CONST_DECL) = (
    map check_decl c;
    (fmt_id_list fmtinfo c); outf (": " ^ kw"CONSTANT");
    (case t of Value tmark => fmt_tmark fmtinfo tmark | Nil => (non_spark_warning 510102)); outf ":=";
    (loc_fmt_exp fmtinfo e); outf ";"; outf "\n";
    fmt_warnings fmtinfo
);

fun ⦏fmt_si_const_decl⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
	({consts=c, t=t, expr=e} : SI_CONST_DECL) = (
 	map check_decl c;
	 (fmt_id_list fmtinfo c); outf (": " ^ kw"CONSTANT");
	 (case t of
		Value tmark => (check_si_no_con 510102 tmark; fmt_si_sub_ind fmtinfo tmark)
	|	Nil => ());
	outf ":=";
	 (loc_fmt_exp fmtinfo e); outf ";"; outf "\n"
);

fun ⦏fmt_deferred_const_decl⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
	({consts=c, tmark=t} : DEFERRED_CONST_DECL) = (
	map check_decl c;
	(fmt_id_list fmtinfo c); outf (": "^ kw"CONSTANT");
	(fmt_tmark fmtinfo t); outf ";"; outf "\n"
);
=TEX

Enumerated types.

=SML
fun ⦏fmt_enum_type_def⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
	(name, {vals=v} : ENUM_TYPE_DEF) = (
    check_decl name;
	outf (kw"TYPE"); (fmt_id fmtinfo name);
	outf (kw"IS"); outf "("; (fmt_id_list fmtinfo v); outf ")"; outf ";"; outf "\n"
);
=TEX

Integer types.

=SML
fun ⦏fmt_int_type_def⦎ (fmtinfo as {outf,...} : PP_FMT_INFO) (name, r : EXP RANGE) = (
	check_decl name;
	check_range_not_attr 510107 r;
	outf (kw"TYPE"); (fmt_id fmtinfo name);
	outf (kw2"IS""RANGE"); (fmt_range fmtinfo r); outf ";"; outf "\n"
);
=TEX

Modular types.

=SML
fun ⦏fmt_modular_type_def⦎ (fmtinfo as {outf,...} : PP_FMT_INFO) (name, {modulus} : EXP MODULUS) = (
	check_decl name;
	outf (kw"TYPE"); (fmt_id fmtinfo name);
	outf (kw2"IS""MOD"); (loc_fmt_exp fmtinfo modulus); outf ";"; outf "\n"
);
=TEX

Array types.

=SML
fun ⦏fmt_array_def⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
	(name, {index=i, comp=c} : ARRAY_DEF) = (
    check_decl name;
	outf (kw"TYPE"); (fmt_id fmtinfo name);
	outf (kw2"IS""ARRAY"); outf "(";
	(fmt_tmark_list fmtinfo i);
	outf ")"; outf (kw"OF");
	(fmt_tmark fmtinfo c); outf ";"; outf "\n"
);

fun ⦏fmt_si_array_def⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
	(name, {index=i, comp=c} : SI_ARRAY_DEF) = (
    check_decl name;
	outf (kw"TYPE"); (fmt_id fmtinfo name);
	outf (kw2"IS""ARRAY"); outf "(";
	(map (check_si_discrete_range_no_con 510111) i);
	(fmt_si_discrete_range_list fmtinfo i);
	outf ")"; outf (kw"OF");
	check_si_no_con 510110 c;
	(fmt_si_sub_ind fmtinfo c); outf ";"; outf "\n"
);

fun ⦏fmt_uncon_tmark_list⦎ (fmtinfo : PP_FMT_INFO)
	([] : TMARK list) = ()
  | fmt_uncon_tmark_list(fmtinfo as {outf,...} : PP_FMT_INFO)
	([x]) = (fmt_tmark fmtinfo x; outf (kw"RANGE"^" <>"))
  | fmt_uncon_tmark_list (fmtinfo as {outf,...} : PP_FMT_INFO)
	(x::xs) = (
	fmt_uncon_tmark_list fmtinfo [x];
	outf ","; fmt_uncon_tmark_list fmtinfo xs);

fun ⦏fmt_si_uncon_tmark_list⦎ (fmtinfo : PP_FMT_INFO)
	([] : SI_DISCRETE_RANGE list) = ()
  | fmt_si_uncon_tmark_list(fmtinfo as {outf,...} : PP_FMT_INFO)
	([x]) = (fmt_si_discrete_range fmtinfo x; outf (kw"RANGE"^" <>"))
  | fmt_si_uncon_tmark_list (fmtinfo as {outf,...} : PP_FMT_INFO)
	(x::xs) = (
	fmt_si_uncon_tmark_list fmtinfo [x];
	outf ","; fmt_si_uncon_tmark_list fmtinfo xs);

fun ⦏fmt_uncon_array_def⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
	(name, {index=i, comp=c} : ARRAY_DEF) = (
    check_decl name;
	outf (kw"TYPE"); (fmt_id fmtinfo name);
	outf (kw2"IS""ARRAY"); outf  "(";
	(fmt_uncon_tmark_list fmtinfo i);
	outf ")"; outf (kw"OF");
	(fmt_tmark fmtinfo c); outf ";"; outf "\n"
);

fun ⦏fmt_si_uncon_array_def⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
	(name, {index=i, comp=c} : SI_ARRAY_DEF) = (
    check_decl name;
	outf (kw"TYPE"); (fmt_id fmtinfo name);
	outf (kw2"IS""ARRAY"); outf  "(";
	(fmt_si_uncon_tmark_list fmtinfo i);
	outf ")"; outf (kw"OF");
	check_si_no_con 510110 c;
	(fmt_si_sub_ind fmtinfo c); outf ";"; outf "\n"
);
=TEX

Record types.

Procedure and Function parameter specifications come here allowing the code
to be re-used for discriminant parts.

=SML
fun ⦏fmt_parameter_specification⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
	({idlist=i, mode=m, name=n, default = d} : PARAMETER_SPECIFICATION) = (
   map  check_decl i;
   (fmt_id_list fmtinfo i); outf ":"; (fmt_mode fmtinfo m); (fmt_tmark fmtinfo n);
   (case d of
	Nil => ()
   |	Value e => (non_spark_warning 510120; outf ":="; loc_fmt_exp fmtinfo e))
);
fun ⦏fmt_parameter_specification_list1⦎ (fmtinfo : PP_FMT_INFO)
	([] : PARAMETER_SPECIFICATION list) = ()
  | fmt_parameter_specification_list1 (fmtinfo : PP_FMT_INFO)
	([x] : PARAMETER_SPECIFICATION list) =
    (fmt_parameter_specification fmtinfo x)
  | fmt_parameter_specification_list1 (fmtinfo as {outf,...} : PP_FMT_INFO)
		(x::xs : PARAMETER_SPECIFICATION list) = (
	(fmt_parameter_specification fmtinfo x);
	outf ";";
	(fmt_parameter_specification_list1 fmtinfo xs)
);
fun ⦏fmt_parameter_specification_list⦎ (fmtinfo : PP_FMT_INFO)
	([] : PARAMETER_SPECIFICATION list) = ()
  | fmt_parameter_specification_list (fmtinfo as {outf,...} : PP_FMT_INFO)
	(xs : PARAMETER_SPECIFICATION list) = (
	outf "("; fmt_parameter_specification_list1 fmtinfo xs; outf ")"
  );
=TEX
Note that the variable name clash rules do not apply here.
=SML
fun ⦏fmt_comp_decl⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
	(({vars=v, tmark=t}, con) : EXP COMP_DECL) = (
	(fmt_id_list fmtinfo v);
	outf ":";
	(fmt_tmark fmtinfo t);
	(case con of
		CCNoCon => ()
	|	CCIndexCon exps => (outf"("; loc_fmt_exp_list fmtinfo exps; outf")")
	|	CCDiscCon exps => (outf"("; loc_fmt_exp_list fmtinfo exps; outf")"));
	outf ";"; outf "\n"
);
	
fun ⦏fmt_discriminant_part⦎
	(fmtinfo : PP_FMT_INFO)
	([] : DISCRIMINANT_SPECIFICATION list) = (
	()
) |  fmt_discriminant_part fmtinfo disc = (
	non_spark_warning 510104;
	let	fun aux {vars, tmark} =
			{mode = MSparkIn false, idlist =  vars, name = tmark, default = Nil};
	in	fmt_parameter_specification_list fmtinfo (map aux disc)
	end
);

fun ⦏fmt_record_type_def⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
	(name, {decl, disc} : EXP RECORD_TYPE_DEF) = (
	check_decl name;
	let	val old_st = !stack;
		val res = (stack := [];
			outf (kw"TYPE");
			fmt_id fmtinfo name;
			fmt_discriminant_part fmtinfo disc;
			outf (kw"IS");
			outf "\n";
			outf (kw"RECORD");
			outf "\n";
			inc_tabs();
			(map (fmt_comp_decl fmtinfo) decl);
			dec_tabs();
			outf (kw2"END""RECORD"^";");
			outf "\n");
	in	stack := old_st;
		res
	end
);

fun ⦏fmt_si_record_type_def⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
	(name, {decl, disc} : SI_RECORD_TYPE_DEF) = (
	check_decl name;
	let	val old_st = !stack;
		val res = (stack := [];
			outf (kw"TYPE");
			(fmt_id fmtinfo name);
			fmt_discriminant_part fmtinfo disc;
			outf (kw"IS");
			outf "\n";
			fmt_warnings fmtinfo;
			outf (kw"RECORD");
			outf "\n";
			inc_tabs();
			(loc_fmt_si_var_decl_list 510112 fmtinfo decl);
			dec_tabs();
			outf (kw2"END""RECORD"^";");
			outf "\n");
	in	stack := old_st;
		res
	end
);
=TEX

Type declarations.

=SML
fun ⦏fmt_type_def⦎ (fmtinfo : PP_FMT_INFO)
	(name, (TDEnumTypeDef x) : TYPE_DEF) =
    (fmt_enum_type_def fmtinfo (name, x))
  | fmt_type_def (fmtinfo : PP_FMT_INFO)
	(name, (TDIntTypeDef x)) =
    (fmt_int_type_def fmtinfo (name, x))
  | fmt_type_def (fmtinfo : PP_FMT_INFO)
	(name, (TDModularTypeDef x)) =
    (fmt_modular_type_def fmtinfo (name, x))
  | fmt_type_def (fmtinfo : PP_FMT_INFO)
	(name, (TDFloatingTypeDef x)) =
    (fmt_floating_type_def fmtinfo (name, x))
  | fmt_type_def (fmtinfo : PP_FMT_INFO)
	(name, (TDFixedTypeDef x)) =
    (fmt_fixed_type_def fmtinfo (name, x))
  | fmt_type_def (fmtinfo : PP_FMT_INFO)
	(name, (TDUnconArrayDef x)) =
    (fmt_uncon_array_def fmtinfo (name, x))
  | fmt_type_def (fmtinfo : PP_FMT_INFO)
	(name, (TDConArrayDef x)) =
    (fmt_array_def fmtinfo (name, x))
  | fmt_type_def (fmtinfo : PP_FMT_INFO)
	(name, (TDRecordTypeDef x)) =
    (fmt_record_type_def fmtinfo (name, x))
and ⦏fmt_type_decl⦎ (fmtinfo : PP_FMT_INFO)
	({name=n, type_def=t} : TYPE_DEF TYPE_DECL) =
    (fmt_type_def fmtinfo (n, t));

fun ⦏fmt_si_type_def⦎ (fmtinfo : PP_FMT_INFO)
	(name, (SIEnumTypeDef x) : SI_TYPE_DEF) =
    (fmt_enum_type_def fmtinfo (name, x))
  | fmt_si_type_def (fmtinfo : PP_FMT_INFO)
	(name, (SIIntTypeDef x)) =
    (fmt_int_type_def fmtinfo (name, x))
  | fmt_si_type_def (fmtinfo : PP_FMT_INFO)
	(name, (SIModularTypeDef x)) =
    (fmt_modular_type_def fmtinfo (name, x))
  | fmt_si_type_def (fmtinfo : PP_FMT_INFO)
	(name, (SIFloatingTypeDef x)) =
    (fmt_floating_type_def fmtinfo (name, x))
  | fmt_si_type_def (fmtinfo : PP_FMT_INFO)
	(name, (SIFixedTypeDef x)) =
    (fmt_fixed_type_def fmtinfo (name, x))
  | fmt_si_type_def (fmtinfo : PP_FMT_INFO)
	(name, (SIDerivedTypeDef x)) =
    (fmt_derived_type_def fmtinfo (name, x))
  | fmt_si_type_def (fmtinfo : PP_FMT_INFO)
	(name, (SIUnconArrayDef x)) =
    (fmt_si_uncon_array_def fmtinfo (name, x))
  | fmt_si_type_def (fmtinfo : PP_FMT_INFO)
	(name, (SIConArrayDef x)) =
    (fmt_si_array_def fmtinfo (name, x))
  | fmt_si_type_def (fmtinfo : PP_FMT_INFO)
	(name, (SIRecordTypeDef x)) =
    (fmt_si_record_type_def fmtinfo (name, x))
and ⦏fmt_si_type_decl⦎ (fmtinfo : PP_FMT_INFO)
	({name=n, type_def=t} : SI_TYPE_DECL) =
    (fmt_si_type_def fmtinfo (n, t));
=TEX

Private type declarations.

=SML
fun ⦏fmt_private_type_decl⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
	({id=i, disc, limited=l} : PRIVATE_TYPE_DECL) = (
	check_decl i;
	outf (kw"TYPE"); fmt_id fmtinfo i;
	(case disc of
		[] => ()
	 |	_ => (
		outf "(";
		loc_fmt_var_decl_list fmtinfo disc;
		outf ")"
	));
	outf (kw"IS");
	(if l then outf (kw"LIMITED") else ());
	outf (kw"PRIVATE"^";"); outf "\n"
);
=TEX

Basic declarations.

=SML
fun ⦏loc_fmt_basic_decl⦎ (fmtinfo : PP_FMT_INFO)
	(BDConstDecl x : BASIC_DECL) =
    (fmt_const_decl fmtinfo x)
  | loc_fmt_basic_decl (fmtinfo : PP_FMT_INFO)
	(BDDeferredConstDecl x) =
    (fmt_deferred_const_decl fmtinfo x)
  | loc_fmt_basic_decl (fmtinfo : PP_FMT_INFO)
	(BDTypeDecl x) =
    (fmt_type_decl fmtinfo x)
  | loc_fmt_basic_decl (fmtinfo : PP_FMT_INFO)
	(BDVarDecl x) =
    (loc_fmt_var_decl fmtinfo x)
  | loc_fmt_basic_decl (fmtinfo : PP_FMT_INFO)
	(BDVarDeclInit x) =
    (fmt_var_init_decl fmtinfo x)
  | loc_fmt_basic_decl (fmtinfo : PP_FMT_INFO)
	(BDSubtypeDecl x) =
    (fmt_subtype_decl fmtinfo x)
  | loc_fmt_basic_decl (fmtinfo : PP_FMT_INFO)
	(BDPrivateTypeDecl x ) =
    (fmt_private_type_decl fmtinfo x)
  | loc_fmt_basic_decl (fmtinfo : PP_FMT_INFO)
	(BDPragma x ) =
    (fmt_pragma fmtinfo x)
  | loc_fmt_basic_decl (fmtinfo : PP_FMT_INFO)
	 (BDAnnotation x ) =
    (fmt_annotation fmtinfo x)
and ⦏loc_fmt_basic_decl_list⦎ (fmtinfo : PP_FMT_INFO)
	([] : BASIC_DECL list) = ()
  | loc_fmt_basic_decl_list (fmtinfo : PP_FMT_INFO)
	(x::xs) =
    (loc_fmt_basic_decl fmtinfo x; loc_fmt_basic_decl_list fmtinfo xs);

fun ⦏loc_fmt_si_basic_decl⦎ (fmtinfo : PP_FMT_INFO)
	(SIConstDecl x : SI_BASIC_DECL) =
    (fmt_si_const_decl fmtinfo x)
  | loc_fmt_si_basic_decl (fmtinfo : PP_FMT_INFO)
	(SIDeferredConstDecl x) =
    (fmt_deferred_const_decl fmtinfo x)
  | loc_fmt_si_basic_decl (fmtinfo : PP_FMT_INFO)
	(SITypeDecl x) =
    (fmt_si_type_decl fmtinfo x)
  | loc_fmt_si_basic_decl (fmtinfo : PP_FMT_INFO)
	(SIVarDecl x) =
    (loc_fmt_si_var_decl 510101 fmtinfo x)
  | loc_fmt_si_basic_decl (fmtinfo : PP_FMT_INFO)
	(SIVarDeclInit x) =
    (fmt_si_var_init_decl fmtinfo x)
  | loc_fmt_si_basic_decl (fmtinfo : PP_FMT_INFO)
	(SISubtypeDecl x) =
    (fmt_si_subtype_decl fmtinfo x)
  | loc_fmt_si_basic_decl (fmtinfo : PP_FMT_INFO)
	(SIPrivateTypeDecl x ) =
    (fmt_private_type_decl fmtinfo x)
  | loc_fmt_si_basic_decl (fmtinfo : PP_FMT_INFO)
	(SIPragma x ) =
    (fmt_pragma fmtinfo x)
  | loc_fmt_si_basic_decl (fmtinfo : PP_FMT_INFO)
	 (SIAnnotation x ) =
    (fmt_annotation fmtinfo x)
and ⦏loc_fmt_si_basic_decl_list⦎ (fmtinfo : PP_FMT_INFO)
	([] : SI_BASIC_DECL list) = ()
  | loc_fmt_si_basic_decl_list (fmtinfo : PP_FMT_INFO)
	(x::xs) =
    (loc_fmt_si_basic_decl fmtinfo x; loc_fmt_si_basic_decl_list fmtinfo xs);
=TEX

\subsection{Procedure and Function specifications}
Formal parts have already been dealt with.

Procedure and Function specifications.

Note these do a $push\_scope$ which someone on the calling chain will need to pop.
This is needed because the name of the procedure or function is visible at this level and needs to be on the stack when a subprogram body is processed.
=SML
fun ⦏fmt_procedure_specification⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
	({name=n, formal_part=f, spec=Value s, annotation=ann, globals=gs}
		: PROCEDURE_SPECIFICATION) = (
	push_scope n;
	(if is_expansion_selected fmtinfo
		then (
		outf (kw"PROCEDURE");
		(fmt_id fmtinfo n);
		(fmt_parameter_specification_list fmtinfo f);
		outf "\n";
		inc_tabs(); outf "-- Spec ..."; dec_tabs(); outf "\n"
	) else (
		outf (kw"PROCEDURE");
		(fmt_id fmtinfo n);
		(fmt_parameter_specification_list fmtinfo f);
		outf "\n";
		inc_tabs();
		(loc_fmt_spec fmtinfo (ProcedureSpecStatement, gs, s));
		dec_tabs(); outf "\n"
   	);
	fmt_warnings fmtinfo;
  	fmt_annotation fmtinfo ann)
)  | fmt_procedure_specification (fmtinfo as {outf,...} : PP_FMT_INFO)
	({name=n, formal_part=f, spec=Nil, annotation=ann, globals=_}
		: PROCEDURE_SPECIFICATION) = (
	push_scope n;
	outf (kw"PROCEDURE");
	(fmt_id fmtinfo n);
	(fmt_parameter_specification_list fmtinfo f);
	outf "\n";
	fmt_warnings fmtinfo;
	fmt_annotation fmtinfo ann
);
=TEX
=SML
fun ⦏fmt_function_specification⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
	({designator=d, return=r, formal_part=f,
		spec=Value s, annotation=ann, globals=gs}
			: FUNCTION_SPECIFICATION) = (
	push_scope d;
	(if is_expansion_selected fmtinfo
	then (
		outf (kw"FUNCTION");(fmt_id fmtinfo d);
		(fmt_parameter_specification_list fmtinfo f);
		outf (kw"RETURN"); (fmt_tmark fmtinfo r);
		outf "\n";
		inc_tabs(); outf "-- Spec ..."; dec_tabs(); outf "\n"
	) else (
		outf (kw"FUNCTION");(fmt_id fmtinfo d);
		(fmt_parameter_specification_list fmtinfo f);
		outf (kw"RETURN"); (fmt_tmark fmtinfo r); outf "\n";
		inc_tabs();
		(loc_fmt_spec fmtinfo (FunctionSpecStatement, gs, s));
		dec_tabs(); outf "\n"
	);
	fmt_warnings fmtinfo;
	fmt_annotation fmtinfo ann
	)
)
  | fmt_function_specification (fmtinfo as {outf,...} : PP_FMT_INFO)
	({designator=d, return=r, formal_part=f,
		spec=Nil, annotation=ann, globals=_}
		: FUNCTION_SPECIFICATION) = (
	push_scope d;
	outf (kw"FUNCTION");(fmt_id fmtinfo d);
	(fmt_parameter_specification_list fmtinfo f); outf (kw"RETURN");
	(fmt_tmark fmtinfo r); outf "\n";
	fmt_warnings fmtinfo;
	fmt_annotation fmtinfo ann
);
=TEX

Subprograms.

Callers of this must pop the scope pushed by the support functions.
=SML
fun ⦏fmt_subprogram_specification⦎ (fmtinfo : PP_FMT_INFO)
	(SSProcedure x : SUBPROGRAM_SPECIFICATION) =
    (fmt_procedure_specification fmtinfo x)
  | ⦏fmt_subprogram_specification⦎ (fmtinfo : PP_FMT_INFO)
	(SSFunction x : SUBPROGRAM_SPECIFICATION) =
    (fmt_function_specification fmtinfo x);
=TEX

Renaming declarations.

=SML
fun ⦏fmt_object_renaming⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
	({new_name, tmark, old_name} : OBJECT_RENAMING) = (
	in_new_scope false new_name (fn () => (
	fmt_id fmtinfo new_name;
	outf ":";
	(fmt_tmark fmtinfo tmark);
	outf (kw"RENAMES");
	fmt_id fmtinfo old_name;
	outf ";"; outf "\n"
	))
);
=TEX
=SML
fun ⦏loc_fmt_expanded_name_plus⦎
		(fmtinfo: PP_FMT_INFO)
		([] : EXPANDED_NAME)
		(sfx : string) : unit = (
	 ()
) | loc_fmt_expanded_name_plus fmtinfo [n] sfx = (
	fmt_id_plus fmtinfo n sfx
) | loc_fmt_expanded_name_plus fmtinfo (n::more) sfx = (
	fmt_id_dot fmtinfo n;
	loc_fmt_expanded_name_plus fmtinfo more sfx
);
=TEX
=SML
fun ⦏loc_fmt_expanded_name⦎
		(fmtinfo: PP_FMT_INFO)
		(en : EXPANDED_NAME) = (
	loc_fmt_expanded_name_plus fmtinfo en ""
);
=TEX
=SML
fun ⦏loc_fmt_expanded_name_opt⦎  (fmtinfo : PP_FMT_INFO) (Value n : EXPANDED_NAME OPT) : unit  = (
	loc_fmt_expanded_name fmtinfo n
) | loc_fmt_expanded_name_opt _ _ = ();
=TEX
=SML
fun ⦏loc_fmt_expanded_name_list⦎ (fmtinfo : PP_FMT_INFO)([] : EXPANDED_NAME list) = (
	 ()
) | loc_fmt_expanded_name_list (fmtinfo : PP_FMT_INFO)([en]) = (
	loc_fmt_expanded_name fmtinfo en
) | loc_fmt_expanded_name_list (fmtinfo : PP_FMT_INFO)(en::more) = (
	loc_fmt_expanded_name_plus fmtinfo en ",";
	loc_fmt_expanded_name_list fmtinfo more
);
=TEX
=SML
fun ⦏fmt_package_renaming⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
	({new_name, old_name} : PACKAGE_RENAMING) = (
	in_new_scope false (trans_expanded_name new_name) (fn () => (
	non_spark_warning 510121;
	outf (kw"PACKAGE");
	loc_fmt_expanded_name fmtinfo new_name;
	outf (kw"RENAMES");
	loc_fmt_expanded_name fmtinfo old_name;
	outf ";"; outf "\n"
	))
);
=TEX
=SML
fun ⦏fmt_opsym_renaming⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
	({new_name, formal_part, tmark, name1, name2} : OPSYM_RENAMING) = (
let	val nn = case new_name of Nil => name2 | Value nn => nn;
in
	in_new_scope false nn (fn () => (
	outf (kw"FUNCTION");
	(case new_name of
		Nil => outf (sfmt_operator_symbol fmtinfo nn)
	|	Value _ => (non_spark_warning 510121; fmt_id fmtinfo nn));
	(fmt_parameter_specification_list fmtinfo formal_part);
	outf (kw"RETURN");
	(fmt_tmark fmtinfo tmark);
	outf (kw"RENAMES");
	(case name1 of Nil => () | Value n1 => (fmt_id fmtinfo n1; outf "."));
	outf(sfmt_operator_symbol fmtinfo name2);
	outf ";"; outf "\n"
	))
end
);
=TEX
=SML
fun ⦏subprogram_name⦎ (SSProcedure {name, ...} : SUBPROGRAM_SPECIFICATION) : ID = name
|    subprogram_name (SSFunction{designator, ...}) = designator;
=TEX
=SML
fun ⦏fmt_subprogram_renaming⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
	({subprogram_specification=s, name1=n1, name2=n2} :
	SUBPROGRAM_RENAMING) = (
	let	val res = (
		(fmt_subprogram_specification fmtinfo s);
		inc_tabs ();
			outf (kw"RENAMES");
			(case n1 of
				Nil => (non_spark_warning 510121)
			|	Value n => (
				(if	subprogram_name s <> n2
				then	non_spark_warning 510121
				else	());
				fmt_id fmtinfo n; outf "."
			)); outf (sfmt_id_plus fmtinfo n2 "");
			outf ";"; outf "\n";
		dec_tabs());
	in	pop_scope(); res
	end
);
=TEX
=SML
fun ⦏fmt_renaming_declaration⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
	(RDObject x : RENAMING_DECLARATION) = (
	fmt_object_renaming fmtinfo x
) | fmt_renaming_declaration (fmtinfo as {outf,...} : PP_FMT_INFO)
	(RDPackage x) = (
	fmt_package_renaming fmtinfo x
) | fmt_renaming_declaration (fmtinfo as {outf,...} : PP_FMT_INFO)
	(RDOpsym x) = (
	fmt_opsym_renaming fmtinfo x
) | fmt_renaming_declaration (fmtinfo as {outf,...} : PP_FMT_INFO)
	(RDSubprogram x) = (
	fmt_subprogram_renaming fmtinfo x
);
=TEX

Representation clauses.

=SML
fun ⦏fmt_component_clause⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
	({name=n, exp=e, range=r} : COMPONENT_CLAUSE) = (
	(fmt_id fmtinfo n);
	outf (kw(kw"AT"));
	(loc_fmt_exp fmtinfo e); outf (kw"RANGE");
	(fmt_range fmtinfo r); outf ";"; outf "\n"
);

fun ⦏fmt_component_clause_list⦎ (fmtinfo : PP_FMT_INFO)
	([] : COMPONENT_CLAUSE list) = ()
  | fmt_component_clause_list (fmtinfo : PP_FMT_INFO)
	(x::xs : COMPONENT_CLAUSE list) =
    (fmt_component_clause fmtinfo x; fmt_component_clause_list fmtinfo xs);

fun ⦏fmt_length_clause⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
	({attribute=a, exp=e} : LENGTH_CLAUSE) = (
	outf (kw"FOR"); (loc_fmt_exp fmtinfo a);
	outf (kw"USE"); (loc_fmt_exp fmtinfo e); outf ";"; outf "\n"
);
fun ⦏fmt_enumeration_representation_clause⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
    ({name=n, exp=e} : ENUMERATION_REPRESENTATION_CLAUSE) = (
	outf (kw"FOR"); (fmt_id fmtinfo n); outf (kw"USE");
	(loc_fmt_exp fmtinfo e); outf ";"; outf "\n"
);
fun ⦏fmt_record_representation_clause⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
	({name=n, alignment_opt=Value a,  component_pack=c} :
	RECORD_REPRESENTATION_CLAUSE) = (
	outf (kw"FOR"); (fmt_id fmtinfo n); outf (kw"USE"); outf "\n";
	inc_tabs();
		outf (kw3 "RECORD" "AT" "MOD"); (loc_fmt_exp fmtinfo a);
		outf ";"; outf "\n";
		(fmt_component_clause_list fmtinfo c);
		outf (kw2 "END" "RECORD;");
	dec_tabs(); outf "\n"
 ) | fmt_record_representation_clause (fmtinfo as {outf,...} : PP_FMT_INFO)
	({name=n, alignment_opt=Nil, component_pack=c} :
	RECORD_REPRESENTATION_CLAUSE) = (
	outf (kw"FOR"); (fmt_id fmtinfo n); outf (kw"USE"); outf "\n";
	inc_tabs();
		outf (kw"RECORD"); outf "\n";
		(fmt_component_clause_list fmtinfo c);
		outf (kw2"END""RECORD"^";");
	dec_tabs();
	outf "\n"
);

fun ⦏fmt_address_clause⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
	({name=n, exp=e} : ADDRESS_CLAUSE) = (
	outf (kw"FOR"); (fmt_id fmtinfo n);
	outf (" " ^ kw2 "USE""AT");
	(loc_fmt_exp fmtinfo e); outf ";"; outf "\n"
);

fun ⦏fmt_representation_clause⦎ (fmtinfo : PP_FMT_INFO)
	(RCLength x : REPRESENTATION_CLAUSE) =
    (fmt_length_clause fmtinfo x)
  | fmt_representation_clause (fmtinfo : PP_FMT_INFO)
	(RCEnumeration x : REPRESENTATION_CLAUSE) =
    (fmt_enumeration_representation_clause fmtinfo x)
  | fmt_representation_clause (fmtinfo : PP_FMT_INFO)
	(RCRecord x : REPRESENTATION_CLAUSE) =
    (fmt_record_representation_clause fmtinfo x)
  | fmt_representation_clause (fmtinfo : PP_FMT_INFO)
	(RCAddress x : REPRESENTATION_CLAUSE) =
    (fmt_address_clause fmtinfo x);
=TEX

Use clauses.

=SML
fun ⦏fmt_use_clause⦎ (fmtinfo as {outf, ...} : PP_FMT_INFO) (UCUse ids : USE_CLAUSE) = (
let	val zns = map trans_expanded_name ids;
in
	non_spark_warning 510114;
	map (map check_use_clause_name) (map package_ids zns);
	outf (kw"USE"); loc_fmt_expanded_name_list fmtinfo ids; outf ";"; outf "\n";
	fmt_warnings fmtinfo
end
) | fmt_use_clause (fmtinfo as {outf, ...}) (UCUseType ids : USE_CLAUSE) = (
	outf (kw2"USE""TYPE"); fmt_id_list fmtinfo ids; outf ";"; outf "\n"
);
=TEX

Subprogram declarations.

=SML
fun ⦏fmt_procedure_declaration⦎ (fmtinfo as {outf, fmt_repl} : PP_FMT_INFO)
	({implicit, spec = {name=n, formal_part=f, spec=Value s, annotation=ann, globals=gs}}
		: PROCEDURE_DECLARATION) =
    in_new_scope false n (fn () =>
    (if	is_expansion_selected fmtinfo
     then (
	if	not implicit
	then	(outf (kw"PROCEDURE");
		(fmt_id fmtinfo n);
		(fmt_parameter_specification_list fmtinfo f); outf ";"; outf "\n";
		inc_tabs(); outf "-- Spec ..."; outf "\n"; dec_tabs()
	) else ()
    ) else (
	(if implicit then outf (kw"$IMPLICIT") else ());
	outf (kw"PROCEDURE");
	(fmt_id fmtinfo n);
	(fmt_parameter_specification_list fmtinfo f); outf "\n";
	inc_tabs();
	(loc_fmt_spec fmtinfo (ProcedureSpecStatement, gs, s));
	outf ";"; outf "\n";
	dec_tabs()
    );
    fmt_warnings fmtinfo;
    fmt_annotation fmtinfo ann
    )
)
  | fmt_procedure_declaration (fmtinfo as {outf,...})
	({implicit, spec = {name=n, formal_part=f, spec=Nil, annotation=ann, globals=_}}) =
    in_new_scope false n (fn () => (
	if	is_expansion_selected fmtinfo
	then	if	not implicit
		then	(outf (kw"PROCEDURE"); (fmt_id fmtinfo n);
			(fmt_parameter_specification_list fmtinfo f);
			outf ";"; outf "\n";
			fmt_warnings fmtinfo;
			fmt_annotation fmtinfo ann
		) else	()
	else	(
		(if implicit then outf (kw"$IMPLICIT") else ());
		outf (kw"PROCEDURE"); (fmt_id fmtinfo n);
		(fmt_parameter_specification_list fmtinfo f);
		outf ";"; outf "\n";
		fmt_warnings fmtinfo;
		fmt_annotation fmtinfo ann
	)
   )
);
=TEX
=SML
fun ⦏fmt_function_declaration⦎ (fmtinfo as {outf, fmt_repl} : PP_FMT_INFO)
	({implicit, spec = {designator=d, return=r, formal_part=f,
		spec=Value s, annotation=ann,globals=gs}}
		: FUNCTION_DECLARATION) =
    in_new_scope false d (fn () =>
    (if	is_expansion_selected fmtinfo
     then (
	if	not implicit
	then	(
	outf (kw"FUNCTION");(fmt_id fmtinfo d);
	(fmt_parameter_specification_list fmtinfo f); outf (kw"RETURN");
	(fmt_tmark fmtinfo r); outf ";"; outf "\n";
	inc_tabs(); outf "-- Spec ..."; dec_tabs(); outf "\n")
	else	()
    ) else (
	(if implicit then outf (kw"$IMPLICIT") else ());
	outf (kw"FUNCTION");(fmt_id fmtinfo d);
	(fmt_parameter_specification_list fmtinfo f);
	outf (kw"RETURN"); (fmt_tmark fmtinfo r); outf "\n";
	inc_tabs();
	(loc_fmt_spec fmtinfo (FunctionSpecStatement, gs, s));
	outf ";"; outf "\n";
	dec_tabs()
    );
   fmt_warnings fmtinfo;
    fmt_annotation fmtinfo ann
    )
)  | fmt_function_declaration  (fmtinfo as {outf,...})
	({implicit, spec = {designator=d, return=r, formal_part=f,
		spec=Nil, annotation=ann, globals=_}}) = (
    in_new_scope false d (fn () =>
	if	is_expansion_selected fmtinfo
	then	if	not implicit
		then	(outf (kw"FUNCTION");(fmt_id fmtinfo d);
			(fmt_parameter_specification_list fmtinfo f); outf (kw"RETURN");
			(fmt_tmark fmtinfo r); outf ";"; outf "\n";
			fmt_warnings fmtinfo;
			fmt_annotation fmtinfo ann)
		else	()
	else	((if implicit then outf (kw"$IMPLICIT") else ());
		outf (kw"FUNCTION");(fmt_id fmtinfo d);
		(fmt_parameter_specification_list fmtinfo f); outf (kw"RETURN");
		(fmt_tmark fmtinfo r); outf ";"; outf "\n";
		fmt_warnings fmtinfo;
		fmt_annotation fmtinfo ann)
    )
);
=TEX
=SML
fun ⦏fmt_procedure_stub⦎ (fmtinfo as {outf, fmt_repl} : PP_FMT_INFO)
	(x as {spec, name, formal_part, globals, ...} : PROCEDURE_SPECIFICATION) =
    in_new_scope true name (fn () =>
    case spec of
    Nil => (
	outf (kw"PROCEDURE"); (fmt_id fmtinfo name);
	(fmt_parameter_specification_list fmtinfo formal_part);
	outf (kw2"IS""SEPARATE"^";"); outf "\n";
	fmt_warnings fmtinfo
    ) | Value s => (
	case fmt_repl of
	Value _ => (
		outf (kw"PROCEDURE"); (fmt_id fmtinfo name);
		(fmt_parameter_specification_list fmtinfo formal_part);
		outf "\n";
		outf "-- Spec ..."; outf "\n";
		outf (kw2"IS""SEPARATE"^";"); outf "\n";
		fmt_warnings fmtinfo
	) | Nil =>  (
		outf (kw"PROCEDURE"); (fmt_id fmtinfo name);
	(fmt_parameter_specification_list fmtinfo formal_part);
		outf "\n";
		loc_fmt_spec fmtinfo (ProcedureSpecStatement, globals, s);
		outf "\n";
		outf (kw2"IS""SEPARATE"^";"); outf "\n";
		fmt_warnings fmtinfo
	))
);
=TEX
=SML
fun ⦏fmt_function_stub⦎ (fmtinfo as {outf, fmt_repl} : PP_FMT_INFO)
	(x as {spec, designator, formal_part, return, globals, ...}
			: FUNCTION_SPECIFICATION) = (
    in_new_scope true designator (fn () =>
    case spec of
    Nil => (
	    outf (kw"FUNCTION");(fmt_id fmtinfo designator);
		(fmt_parameter_specification_list fmtinfo formal_part);
		outf (kw"RETURN");
	(fmt_tmark fmtinfo return); outf "\n";
		outf (kw2"IS""SEPARATE"^";"); outf "\n";
		fmt_warnings fmtinfo
    ) | Value s => (
	case fmt_repl of
	Value _ => (
	    outf (kw"FUNCTION");(fmt_id fmtinfo designator);
		(fmt_parameter_specification_list fmtinfo formal_part);
		outf (kw"RETURN");
		(fmt_tmark fmtinfo return); outf "\n";
		outf "-- Spec ..."; outf "\n";
		outf (kw2"IS""SEPARATE"^";"); outf "\n";
		fmt_warnings fmtinfo
	) | Nil => (
	    outf (kw"FUNCTION");(fmt_id fmtinfo designator);
		(fmt_parameter_specification_list fmtinfo formal_part);
		outf (kw"RETURN");
		(fmt_tmark fmtinfo return); outf "\n";
		loc_fmt_spec fmtinfo (FunctionSpecStatement, globals, s);
		outf "\n";
		outf (kw2"IS""SEPARATE"^";"); outf "\n";
		fmt_warnings fmtinfo
	)
    ))
);
=TEX
=SML
fun ⦏fmt_package_stub⦎ (fmtinfo as {outf,...} : PP_FMT_INFO) (n : EXPANDED_NAME) = (
	outf (kw2"PACKAGE""BODY");
	loc_fmt_expanded_name fmtinfo n; outf (kw2"IS""SEPARATE"^";");
	outf "\n"
);
fun ⦏fmt_auxiliary⦎ (fmtinfo as {outf, fmt_repl} : PP_FMT_INFO) (av : AUX_VAR) =
    (case fmt_repl of
    Value _ => (outf "-- $AUXILIARY ... ;"; outf "\n")
    | Nil => (
	outf (kw"$AUXILIARY"); (fmt_z_id_list fmtinfo (#aux av));
	outf ":"; fmt_z_tm fmtinfo (#t av);
	outf" ;"; outf "\n"
    )
);
fun ⦏fmt_using⦎ (fmtinfo as {outf, fmt_repl} : PP_FMT_INFO) (u : SI_USING_DEC) =
    (case fmt_repl of
    Value _ => (
	outf  "-- $USING ..."; outf "\n";
	loc_fmt_si_basic_decl_list fmtinfo (#basic_decls u); outf "\n";
	outf "-- $IMPLEMENT ... $BY ... ;"; outf "\n"
    ) | Nil => (
	outf (kw"$USING"); outf "\n";
	(loc_fmt_si_basic_decl_list fmtinfo (#basic_decls u));
	outf (kw"$IMPLEMENT"); (fmt_z_tm fmtinfo (#aux u));
	outf (kw"$BY"); (fmt_z_tm fmtinfo (#invariant u));
	outf " ;"; outf "\n"
    ));
=TEX
=SML
fun ⦏fmt_package_declaration⦎
	(fmt_decls : PP_FMT_INFO -> DECLARATION list -> unit)
	(fmtinfo as {outf,...} : PP_FMT_INFO)
	({name=n, end_name = en, visible_decs=v, private_decs=p, annotation=ann} :
    DECLARATION PACKAGE_DECLARATION) = (
    in_new_scope true (trans_expanded_name n) (fn () => (
	outf (kw"PACKAGE");
	loc_fmt_expanded_name fmtinfo n; outf "\n";
	fmt_annotation fmtinfo ann;
	outf (kw"IS"); outf "\n";
	(inc_tabs();
		fmt_decls fmtinfo v;
	dec_tabs())));
    in_new_scope false (trans_expanded_name n) (fn () => (
    	(case p
	of Nil => ()
	| Value pds => (
		outf (kw"PRIVATE"); outf "\n";
		inc_tabs();
		(case pds of [] => non_spark_warning 510126 | _ => ());
		fmt_decls fmtinfo pds;
		fmt_warnings fmtinfo;
		dec_tabs()
	));
        (case en of Nil => non_spark_warning 510123 | _ => ());
        outf (kw"END"); (loc_fmt_expanded_name_opt fmtinfo en); outf ";"; outf "\n"
    ))
   );
=TEX
=SML
fun ⦏fmt_procedure_body⦎
	(fmt_stat : PP_FMT_INFO -> STATEMENT -> unit)
	(fmt_decls : PP_FMT_INFO -> DECLARATION list -> unit)
	(fmtinfo as {outf,...} : PP_FMT_INFO)
	({deferred, procedure_spec=p, declarative_part=d, statement=s, end_name = en} :
	PROCEDURE_BODY) = (
	let	val _ = check_decl (#name p);
		val res = (
			(if	not(is_expansion_selected fmtinfo)
			 andalso	deferred
			 then	outf (kw"$DEFERRED")
			 else	());
			fmt_procedure_specification fmtinfo p;
			outf (kw"IS"); outf "\n";
			(inc_tabs();
				fmt_decls fmtinfo d;
			dec_tabs());
			outf (kw"BEGIN"); outf "\n";
			(inc_tabs();
				fmt_stat fmtinfo s;
			dec_tabs());
			 (case en of Nil => non_spark_warning 510124 | _ => ());
			outf (kw"END");
 			(fmt_id_opt fmtinfo en); outf ";"; outf "\n");
	in	pop_scope (); res
	end
);
=TEX
=SML
fun ⦏fmt_function_body⦎
	(fmt_stat : PP_FMT_INFO -> STATEMENT -> unit)
	(fmt_decls : PP_FMT_INFO -> DECLARATION list -> unit)
	(fmtinfo as {outf,...} : PP_FMT_INFO)
	({deferred, function_spec=f, declarative_part=d, statement=s, end_name = en} :
	FUNCTION_BODY) = (
	let	val _ = check_decl (#designator f);
		val res = (
			(if	not(is_expansion_selected fmtinfo)
			 andalso	deferred
			 then	outf (kw"$DEFERRED")
			 else	());
			fmt_function_specification fmtinfo f;
			outf (kw"IS"); outf "\n";
			(inc_tabs();
				fmt_decls fmtinfo d;
			dec_tabs());
			outf (kw"BEGIN"); outf "\n";
			(inc_tabs();fmt_stat fmtinfo s; dec_tabs());
			 (case en of Nil =>  non_spark_warning 510124 | _ => ());
			outf (kw"END"); (fmt_id_opt fmtinfo en);
			outf ";"; outf "\n");
	in	pop_scope(); res
	end
);
=TEX
=SML
fun ⦏fmt_package_body⦎
	(fmt_stat : PP_FMT_INFO -> STATEMENT -> unit)
	(fmt_decls : PP_FMT_INFO -> DECLARATION list -> unit)
	(fmtinfo as {outf,...} : PP_FMT_INFO)
	({name=n, decls=d, statement=s, annotation=ann, end_name = en}
		: PACKAGE_BODY) = (
    in_new_scope true (trans_expanded_name n) (fn () => (
    outf (kw2"PACKAGE""BODY");
    loc_fmt_expanded_name fmtinfo n; outf "\n";
    fmt_annotation fmtinfo ann;
    (outf (kw"IS"); outf "\n");
    inc_tabs(); fmt_decls  fmtinfo d; dec_tabs();
    (if all_implicit_nulls fmt_stat fmtinfo s
   then ()
    else (outf (kw"BEGIN"); outf "\n";
	inc_tabs();fmt_stat fmtinfo s; dec_tabs())
    );
    (case en of Nil => non_spark_warning 510125 | _ => ());
    outf (kw"END"); (loc_fmt_expanded_name_opt fmtinfo en); outf ";"; outf "\n")
));
=TEX
=SML
fun ⦏fmt_proper_body⦎
	(fmt_stat : PP_FMT_INFO -> STATEMENT -> unit)
	(fmt_decls : PP_FMT_INFO -> DECLARATION list -> unit)
	(fmtinfo : PP_FMT_INFO) (PBProcedure x : PROPER_BODY) =
    (fmt_procedure_body fmt_stat fmt_decls fmtinfo x)
  | fmt_proper_body fmt_stat fmt_decls
	(fmtinfo : PP_FMT_INFO) (PBFunction x : PROPER_BODY) =
    (fmt_function_body fmt_stat fmt_decls fmtinfo x)
  | fmt_proper_body fmt_stat fmt_decls
	(fmtinfo : PP_FMT_INFO) (PBPackage x : PROPER_BODY) =
    (fmt_package_body fmt_stat fmt_decls fmtinfo x);
=TEX

Compilation subunits.

=SML
fun ⦏fmt_compilation_subunit⦎
	(fmt_stat : PP_FMT_INFO -> STATEMENT -> unit)
	(fmt_decls : PP_FMT_INFO -> DECLARATION list -> unit)
	(fmtinfo as {outf,...} : PP_FMT_INFO)
	({name=n, proper_body=p} : COMP_SUBUNIT) = (
	outf (kw"SEPARATE"); outf "(";
	(fmt_id fmtinfo (format_list Combinators.I n ".")); outf")"; outf "\n";
	(inc_tabs(); fmt_proper_body fmt_stat fmt_decls fmtinfo p; dec_tabs())
);
=TEX
Statements and declarations. For statements, we want to output any warnings after each statement,
and we have to do this in each branch of the case analysis. We need to do
the same for declarations, but as these always occur in lists in
the surrounding syntax, it is sufficient just to output the warnings in the iterator.

If we are not expanding replacements and refinements, then we want to print nothing statements
explicitly (for use in code that use the web clause formatting function to generate compliance
arguments).
=SML
fun ⦏loc_fmt_statement⦎ (fmtinfo as {outf, fmt_repl} : PP_FMT_INFO) (STNull snt : STATEMENT) : unit = (
	case snt of
		SNNull => (
		outf (kw"NULL"^";"); outf "\n";
		fmt_warnings fmtinfo
	) |	SNImplicit => (
		()
	) |	SNNothing => (
		case fmt_repl of
			Value f => ()
		|	Nil => (
			outf (kw"$NOTHING"^";"); outf "\n";
			fmt_warnings fmtinfo
		)
	)
) | loc_fmt_statement (fmtinfo as {outf,...} : PP_FMT_INFO) (STAssign x : STATEMENT) = (
	fmt_assign fmtinfo x;
	fmt_warnings fmtinfo
) | loc_fmt_statement (fmtinfo : PP_FMT_INFO) (STSpecNoIvars x : STATEMENT) = (
	loc_fmt_spec_no_ivars fmtinfo x;
	fmt_warnings fmtinfo
) | loc_fmt_statement (fmtinfo : PP_FMT_INFO) (STSemicolon (a,b) : STATEMENT) = (
	loc_fmt_statement fmtinfo a;
	loc_fmt_statement fmtinfo b;
	fmt_warnings fmtinfo
) | loc_fmt_statement (fmtinfo : PP_FMT_INFO) (STIfThenElse x : STATEMENT) = (
	fmt_if_then_else loc_fmt_statement fmtinfo x;
	fmt_warnings fmtinfo
) | loc_fmt_statement (fmtinfo : PP_FMT_INFO) (STCase x : STATEMENT) = (
	fmt_case loc_fmt_statement fmtinfo x;
	fmt_warnings fmtinfo
) | loc_fmt_statement (fmtinfo : PP_FMT_INFO) (STLoop x : STATEMENT) = (
	fmt_loop loc_fmt_statement fmtinfo x;
	fmt_warnings fmtinfo
) | loc_fmt_statement (fmtinfo : PP_FMT_INFO) (STWhile x : STATEMENT) = (
	fmt_while loc_fmt_statement fmtinfo x;
	fmt_warnings fmtinfo
) | loc_fmt_statement (fmtinfo : PP_FMT_INFO) (STForStatic x : STATEMENT) = (
	fmt_for_static loc_fmt_statement fmtinfo x;
	fmt_warnings fmtinfo
) | loc_fmt_statement (fmtinfo : PP_FMT_INFO) (STForTmark x : STATEMENT) = (
	fmt_for_tmark loc_fmt_statement fmtinfo x;
	fmt_warnings fmtinfo
) | loc_fmt_statement (fmtinfo : PP_FMT_INFO) (STLabelled x : STATEMENT) = (
	fmt_labelled loc_fmt_statement fmtinfo x;
	fmt_warnings fmtinfo
) | loc_fmt_statement (fmtinfo : PP_FMT_INFO) (STExitWhen x : STATEMENT) = (
	fmt_exit_when fmtinfo x;
	fmt_warnings fmtinfo
) | loc_fmt_statement (fmtinfo as {outf,...} : PP_FMT_INFO) (STExit x: STATEMENT) = (
	fmt_exit fmtinfo x;
	fmt_warnings fmtinfo
) | loc_fmt_statement (fmtinfo : PP_FMT_INFO) (STRet x : STATEMENT)  = (
	fmt_return fmtinfo x;
	fmt_warnings fmtinfo
) | loc_fmt_statement (fmtinfo : PP_FMT_INFO) (STGoto x : STATEMENT)  = (
	fmt_goto fmtinfo x;
	fmt_warnings fmtinfo
) | loc_fmt_statement (fmtinfo : PP_FMT_INFO) (STProcNoIvars x : STATEMENT) = (
	fmt_proc_call_no_ivars fmtinfo x;
	fmt_warnings fmtinfo
) | loc_fmt_statement (fmtinfo : PP_FMT_INFO) (STKSlot x : STATEMENT) = (
	fmt_k_slot fmtinfo x;
	fmt_warnings fmtinfo
) | loc_fmt_statement (fmtinfo : PP_FMT_INFO) (STPragma x : STATEMENT) = (
	fmt_pragma fmtinfo x;
	fmt_warnings fmtinfo
) | loc_fmt_statement (fmtinfo : PP_FMT_INFO) (STAnnotation x : STATEMENT) = (
	fmt_annotation fmtinfo x;
	fmt_warnings fmtinfo
) | loc_fmt_statement (fmtinfo : PP_FMT_INFO) (SSpecIvars x) =
    fail "loc_fmt_statement" 510999 [fn()=>"spec with ivars"]
  | loc_fmt_statement (fmtinfo : PP_FMT_INFO) (SForNonStatic x) =
    fail "loc_fmt_statement" 510999 [fn()=>"for with non-static bounds"]
  | loc_fmt_statement (fmtinfo : PP_FMT_INFO) (SLogCon x) = (
	fmt_log_con fmtinfo x;
	fmt_warnings fmtinfo
) | loc_fmt_statement (fmtinfo : PP_FMT_INFO) (SProcIvars x) =
    fail "loc_fmt_statement" 510999 [fn()=>"proc with ivars"]
  | ⦏loc_fmt_statement⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
	(SBlockStatement{name, declarative_part, statement}) : unit = (
in_new_scope false (get_scope_name name) (fn () => (
	fmt_loop_or_block_label fmtinfo name;
	(case declarative_part of
		Nil => ()
	|	Value decs => (
		outf (kw"DECLARE"); outf "\n";
		inc_tabs();
			loc_fmt_declaration_list fmtinfo decs;
		dec_tabs()
	));
	outf (kw"BEGIN"); outf "\n";
	inc_tabs();
		loc_fmt_statement fmtinfo statement;
	dec_tabs();
	outf (kw"END");
	finish_loop_or_block fmtinfo name;
	non_spark_warning 510117;
	fmt_warnings fmtinfo))
)
(*
=TEX
=SML
*)
and ⦏loc_fmt_declaration⦎ (fmtinfo : PP_FMT_INFO)
	(DDeclarationKSlot (x, _) : DECLARATION) =
    (fmt_k_slot fmtinfo x
) | loc_fmt_declaration (fmtinfo : PP_FMT_INFO)
	(DRenamingDeclaration x : DECLARATION) =
    (fmt_renaming_declaration fmtinfo x
) | loc_fmt_declaration (fmtinfo : PP_FMT_INFO)
	(DBasicDecl x : DECLARATION) =
    (loc_fmt_si_basic_decl fmtinfo x
) | loc_fmt_declaration (fmtinfo : PP_FMT_INFO)
	(DRepresentationClause x : DECLARATION) =
    (fmt_representation_clause fmtinfo x
) | loc_fmt_declaration (fmtinfo : PP_FMT_INFO)
	(DUseClause x : DECLARATION) =
    (fmt_use_clause fmtinfo x
) | loc_fmt_declaration (fmtinfo : PP_FMT_INFO)
	(DProperBody x : DECLARATION) =
    (fmt_proper_body loc_fmt_statement loc_fmt_declaration_list fmtinfo x
) | loc_fmt_declaration (fmtinfo : PP_FMT_INFO)
	(DProcedureDeclaration x : DECLARATION) =
    (fmt_procedure_declaration fmtinfo x
) | loc_fmt_declaration (fmtinfo : PP_FMT_INFO)
	(DFunctionDeclaration x : DECLARATION) =
    (fmt_function_declaration fmtinfo x
) | loc_fmt_declaration (fmtinfo : PP_FMT_INFO)
	(DPackageDeclaration x : DECLARATION) =
    (fmt_package_declaration loc_fmt_declaration_list fmtinfo x
) | loc_fmt_declaration (fmtinfo : PP_FMT_INFO)
	(DProcedureStub x : DECLARATION) =
    (fmt_procedure_stub fmtinfo x
) | loc_fmt_declaration (fmtinfo : PP_FMT_INFO)
	(DFunctionStub x : DECLARATION) =
    (fmt_function_stub fmtinfo x
) | loc_fmt_declaration (fmtinfo : PP_FMT_INFO)
	(DPackageStub x : DECLARATION) =
    (fmt_package_stub fmtinfo x
) | loc_fmt_declaration (fmtinfo : PP_FMT_INFO)
	(DExternalProcedureStub x : DECLARATION) =
    (fmt_procedure_declaration fmtinfo x
) | loc_fmt_declaration (fmtinfo : PP_FMT_INFO)
	(DExternalFunctionStub x : DECLARATION) =
    (fmt_function_declaration fmtinfo x
) | loc_fmt_declaration (fmtinfo : PP_FMT_INFO)
	(DAuxiliary x : DECLARATION) =
    (fmt_auxiliary fmtinfo x
) | loc_fmt_declaration (fmtinfo : PP_FMT_INFO)
	(DUsing x : DECLARATION) =
    (fmt_using fmtinfo x)
(*
=TEX
There is a SPARK rule that renaming declarations must come first.
However,  presumably annotations and pragmas may be mixed in with these.
=SML
*)
and ⦏loc_fmt_declaration_list⦎ (fmtinfo : PP_FMT_INFO)
	(decls : DECLARATION list) = (
	let	fun is_later_decl (DBasicDecl(SIPragma _)) = false
		|    is_later_decl (DBasicDecl(SIAnnotation _)) = false
		|    is_later_decl (DRenamingDeclaration _) = false
		|    is_later_decl _ = true;
		fun aux _ [] = ()
		|    aux later ((decl as (DRenamingDeclaration _)) :: more) = (
			loc_fmt_declaration fmtinfo decl;
			(if later then non_spark_warning 510113 else ());
			fmt_warnings fmtinfo;
			aux later more
		) | aux later (decl::more) = (
			loc_fmt_declaration fmtinfo decl;
			fmt_warnings fmtinfo;
			aux (later orelse is_later_decl decl) more
		);
	in	aux false decls
	end
);
=TEX

Compilation units.

=SML
fun ⦏fmt_context_item⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
	(CIWith x : CONTEXT_ITEM) = (
	outf (kw"WITH"); loc_fmt_expanded_name_list fmtinfo x; outf ";"; outf "\n"
) | fmt_context_item fmtinfo (CIUse uc) = (
	fmt_use_clause fmtinfo uc
) | fmt_context_item fmtinfo (CIPragma p) = (
	fmt_pragma fmtinfo p
);
=TEX
=SML
fun ⦏fmt_references⦎ (fmtinfo as {outf, fmt_repl, ...} : PP_FMT_INFO)
	(x : EXPANDED_NAME list) = (
	case (x, fmt_repl) of
		(_::_, Nil) => (
		outf (kw"$REFERENCES"); loc_fmt_expanded_name_list fmtinfo x; outf ";"; outf "\n"
	) |	_ => ()
);
=TEX
=SML
fun ⦏fmt_compilation_unit⦎ (fmtinfo as {outf, ... }: PP_FMT_INFO)
	(CUPackageDeclaration {private, pack_decl} : COMPILATION_UNIT) = (
	(if private then outf(kw"PRIVATE") else ());
	fmt_package_declaration loc_fmt_declaration_list fmtinfo pack_decl
) | fmt_compilation_unit (fmtinfo : PP_FMT_INFO)
	(CUProperBody x : COMPILATION_UNIT) =
    (fmt_proper_body loc_fmt_statement loc_fmt_declaration_list fmtinfo x
) | fmt_compilation_unit (fmtinfo : PP_FMT_INFO)
	(CUSubUnit x : COMPILATION_UNIT) =
    (fmt_compilation_subunit loc_fmt_statement loc_fmt_declaration_list fmtinfo x);
=TEX
Note that the references clause, if any, does not get put in the Ada document.
=SML
fun ⦏fmt_context_compilation_unit⦎ (fmtinfo : PP_FMT_INFO)
	({context=cil, references=r, comp_unit=c, annotation=ann}
		: CONTEXT_COMPILATION_UNIT) = (
	map (fmt_context_item fmtinfo) cil;
	fmt_references fmtinfo r;
	fmt_annotation fmtinfo ann;
	fmt_compilation_unit fmtinfo c ;
	fmt_warnings fmtinfo
);
=TEX
=SML
fun ⦏loc_fmt_kslot_compilation_unit⦎ (fmtinfo : PP_FMT_INFO)
	(KCUKSlot x : KSLOT_COMPILATION_UNIT) =
    (fmt_k_slot fmtinfo x
) | loc_fmt_kslot_compilation_unit (fmtinfo : PP_FMT_INFO)
	(KCUUnit x : KSLOT_COMPILATION_UNIT) =
    (fmt_context_compilation_unit fmtinfo x
) | loc_fmt_kslot_compilation_unit (fmtinfo : PP_FMT_INFO)
	(KCUPragma x : KSLOT_COMPILATION_UNIT) =
    (fmt_pragma fmtinfo x);
=TEX
=SML
fun ⦏loc_fmt_kslot_compilation_unit_list⦎ (fmtinfo : PP_FMT_INFO)
    ([] : KSLOT_COMPILATION_UNIT list) = ()
  | loc_fmt_kslot_compilation_unit_list (fmtinfo as {outf,...} : PP_FMT_INFO)
    (x::xs : KSLOT_COMPILATION_UNIT list) =
    (loc_fmt_kslot_compilation_unit fmtinfo x;
    loc_fmt_kslot_compilation_unit_list fmtinfo xs);
=TEX
=SML
fun ⦏loc_fmt_replaced_by_comp⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
	({label=l, comp=c} : REPLACED_BY_COMP) =
    (fmt_label fmtinfo true l; outf (translate_for_output "≡"); outf "\n";
    inc_tabs();
	loc_fmt_kslot_compilation_unit_list fmtinfo c;
    dec_tabs());
fun ⦏loc_fmt_replaced_by_private_part⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
	({label=l, private=p} : REPLACED_BY_PRIVATE_PART) =
    (fmt_label fmtinfo true l; outf (translate_for_output "≡"); outf "\n";
	inc_tabs();
		loc_fmt_declaration_list fmtinfo p;
	dec_tabs());
fun ⦏loc_fmt_replaced_by_visible_part⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
	({label=l, visible=v} : REPLACED_BY_VISIBLE_PART) =
    (fmt_label fmtinfo true l; outf (translate_for_output "≡"); outf "\n";
	inc_tabs(); loc_fmt_declaration_list fmtinfo v; dec_tabs());
fun ⦏loc_fmt_replaced_by_decl⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
	({label=l, decls=d} : REPLACED_BY_DECL) =
    (fmt_label fmtinfo true l; outf (translate_for_output "≡"); outf "\n";
	inc_tabs(); loc_fmt_declaration_list  fmtinfo d; dec_tabs());
fun ⦏loc_fmt_refined_by⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
	({label=l, statement=s} : REFINED_BY) =
	(fmt_label fmtinfo true l; outf (translate_for_output "⊑");
	outf "\n"; inc_tabs();loc_fmt_statement fmtinfo s; dec_tabs());
fun ⦏loc_fmt_replaced_by⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
	({label=l, statement=s} : REFINED_BY) =
    (fmt_label fmtinfo true l; outf (translate_for_output "!⊑"); outf "\n";
	inc_tabs();loc_fmt_statement fmtinfo s; dec_tabs());
fun ⦏loc_fmt_replaced_by_annotation⦎ (fmtinfo as {outf,...} : PP_FMT_INFO)
	({label=l, replacement=a} : REPLACED_BY_ANNOTATION) =
    (fmt_label fmtinfo true l; outf (translate_for_output "≡"); outf "\n";
	inc_tabs(); fmt_annotation fmtinfo a; dec_tabs());
=TEX

Web Clauses.

=SML
fun ⦏loc_fmt_web_clause⦎ (fmtinfo : PP_FMT_INFO)
	(WCCompilation x : WEB_CLAUSE) =
    (loc_fmt_kslot_compilation_unit_list fmtinfo x; fmt_warnings fmtinfo)
  | loc_fmt_web_clause (fmtinfo : PP_FMT_INFO)
	(WCReplacedByCompilation x : WEB_CLAUSE) =
    (loc_fmt_replaced_by_comp fmtinfo x; fmt_warnings fmtinfo)
  | loc_fmt_web_clause (fmtinfo : PP_FMT_INFO)
	(WCReplacedByPrivatePart x : WEB_CLAUSE) =
    (loc_fmt_replaced_by_private_part fmtinfo x; fmt_warnings fmtinfo)
  | loc_fmt_web_clause (fmtinfo : PP_FMT_INFO)
	(WCReplacedByVisiblePart x : WEB_CLAUSE) =
    (loc_fmt_replaced_by_visible_part fmtinfo x; fmt_warnings fmtinfo)
  | loc_fmt_web_clause (fmtinfo : PP_FMT_INFO)
	(WCReplacedByDecl x : WEB_CLAUSE) =
    (loc_fmt_replaced_by_decl fmtinfo x; fmt_warnings fmtinfo)
  | loc_fmt_web_clause (fmtinfo : PP_FMT_INFO)
	(WCReplacedByArbitraryAda x : WEB_CLAUSE) =
    (loc_fmt_replaced_by_arbitrary_ada fmtinfo x; fmt_warnings fmtinfo)
  | loc_fmt_web_clause (fmtinfo : PP_FMT_INFO)
	(WCRefinedBy x : WEB_CLAUSE) =
    (loc_fmt_refined_by fmtinfo x; fmt_warnings fmtinfo)
  | loc_fmt_web_clause (fmtinfo : PP_FMT_INFO)
	(WCReplacedBy x : WEB_CLAUSE) =
    (loc_fmt_replaced_by fmtinfo x; fmt_warnings fmtinfo)
  | loc_fmt_web_clause (fmtinfo : PP_FMT_INFO)
	(WCReplacedByAnnotation x : WEB_CLAUSE) =
    (loc_fmt_replaced_by_annotation fmtinfo x; fmt_warnings fmtinfo);
=TEX

\section{PRINTING AND OUTPUTTING SPARK}
=SML
val _ = (new_int_control{name="cn_automatic_line_splitting",
	control=ref 80,
	default = (fn () => 80),
	check = (fn (x:int) => x = 0 orelse 20 <= x)}
		handle (Fail _) => () (* assume control already present *));
=TEX
=SML
fun ⦏make_output_fun1⦎ (prt : string -> unit) : string -> unit = (
reset_tabs();
let  val max_line_len = get_int_control("cn_automatic_line_splitting");
    val curr_line_length : int ref = ref 0;
    val skipspace : bool ref = ref false;
    fun starts_with (s : string) (chs : string list) = (
		s <> ""
	andalso	substring(s, 0, 1) mem chs
    );
    fun ends_with (s : string) (chs : string list) = (
		s <> ""
	andalso	substring(s, size s - 1, 1) mem chs
    );
    fun out_fun (s : string) : unit = (
	if (s = "\n")
	then (
		skipspace := false;
		curr_line_length := 0;
		prt("\n");
		()
	) else (
		let val len_s = size(s);
		in
			if ((!curr_line_length) = 0)
			then (  skipspace := false;
				let	val tab_s = fmt_tabs(get_PPTab_no());
					val len_tab_s = size(tab_s);
				in
				(prt(tab_s);
				    prt(s);
				    curr_line_length := len_tab_s + len_s;
				    ())
				end
			) else (
				if ((max_line_len > 0) andalso
				    (len_s + (!curr_line_length) >= max_line_len))
				then ( prt("\n");
					curr_line_length := 0;
					skipspace := false;
					out_fun(s);
				    ()
				) else (
					if	!skipspace
					orelse	starts_with s
						[";", ",", ")", ".", "'"]
					then	()
					else	(
						prt(" ");
						curr_line_length := (!curr_line_length) + 1;
						());
					prt(s);
					skipspace := ends_with s ["'", "(", "."];
					curr_line_length := (!curr_line_length) + len_s;
					()
				)
			)
		end
	));
in	out_fun
end);
=TEX
=SML
fun ⦏make_output_fun⦎ (outs : outstream) : string -> unit = (
	let	val prt : string -> unit =  fn s => output(outs, s);
	in	make_output_fun1 prt
	end
);
=IGN
set_int_control("cn_automatic_line_splitting", 40);
val outf = make_output_fun(std_out);
(outf "\n"; outf "12345"; inc_tabs(); outf "12345";outf "12345";outf "12345";outf "12345";
outf "12345";outf "12345";outf "12345";outf "12345";outf "12345";
outf "12345";outf "12345";outf "12345";outf "12345";
outf "12345";outf "12345";outf "12345";outf "12345";outf "12345";
outf "12345";outf "12345";outf "12345";inc_tabs(); outf "12345";outf "12345";
outf "12345";outf "12345";outf "12345";outf "\n");
=SML
fun ⦏mk_fmt_repl⦎
	(repl_fun : LABEL -> REPLACEMENT OPT)
	: (string -> unit) -> LABEL -> bool = (fn outf => fn label =>
let    val fmtinfo = {outf = outf, fmt_repl = Value(mk_fmt_repl repl_fun)};
in
    case repl_fun label of
    Value repl => (
	case repl of
	       ReplaceComp {comp, ...} => (
		loc_fmt_kslot_compilation_unit_list fmtinfo comp; true
	) |    ReplacePPart {private, ...} => (
		loc_fmt_declaration_list fmtinfo private; true
	) |    ReplaceVPart {visible, ...} => (
		loc_fmt_declaration_list fmtinfo visible; true
	) |    ReplaceDecl {decls, ...} => (
		loc_fmt_declaration_list fmtinfo decls; true
	) |    RefineStat {statement, ...}    => (
		loc_fmt_statement fmtinfo statement; true
	) |    ReplaceStat {statement, ...}    => (
		loc_fmt_statement fmtinfo statement; true
	) |    ReplaceArbitrary {replacement, ...} => (
		(let val tabs = get_tabs();
		in
			(reset_tabs();
			outf replacement;
			outf "\n";
			set_tabs (tabs)
			)
		end); true
	) |    ReplaceAnnotation {replacement, ...} => (
		fmt_annotation fmtinfo replacement; true
	) |    UnReplaced (RSCompilation, s) => (
	    outf ("-- unexpanded compilation k-slot: " ^
			 translate_for_output label);
		outf "\n"; false
	) |    UnReplaced (RSSpecStatement, s) => (
	    outf ("-- unexpanded specification statement: " ^
			 translate_for_output label);
		outf "\n"; false
	) |    UnReplaced (RSStatement, s) => (
	    outf ("-- unexpanded statement k-slot: " ^
			 translate_for_output label);
		outf "\n"; false	
	) |    UnReplaced (RSDeclaration, s) => (
	    outf ("-- unexpanded declaration k-slot " ^
			 translate_for_output label);
		outf "\n"; false
	) |    UnReplaced (RSPrivatePart, s) => (
	    outf ("-- unexpanded private part k-slot " ^
			 translate_for_output label);
		outf "\n"; false
	) |    UnReplaced (RSVisiblePart, s) => (
	    outf ("-- unexpanded visible part k-slot " ^
			 translate_for_output label);
		outf "\n"; false
	) |    UnReplaced (RSAnnotation, s) => (
	    outf ("-- unexpanded annotation k-slot " ^
			 translate_for_output label);
		outf "\n"; false
	)
    ) |    Nil =>    (
		outf ("-- unrecognised label: " ^
			 translate_for_output label);
		outf "\n"; false
	)
end);
=TEX
\subsection{Interfaces}
=SML
fun ⦏in_required_state⦎ (f : PP_FMT_INFO -> 'a -> unit)
	(info : PP_FMT_INFO) (x : 'a) : unit = (
	let	val pqzs = get_flag "pp_quote_z_strings";
	in	let	val _ = set_flag("pp_quote_z_strings", true);
		in	f info x;
			set_flag("pp_quote_z_strings", pqzs);
			()
		end	handle ex => (
			set_flag("pp_quote_z_strings", pqzs);
			raise ex
		)
	end
);
=TEX

The signature constraint will make sure the following have the right type:
=SML

val ⦏fmt_spec⦎ = in_required_state loc_fmt_spec;
val ⦏fmt_var_decl⦎ = in_required_state loc_fmt_var_decl;
fun ⦏fmt_si_var_decl⦎ (i : int) = in_required_state (loc_fmt_si_var_decl i);
val ⦏fmt_var_decl_list⦎ = in_required_state loc_fmt_var_decl_list;
fun  ⦏fmt_si_var_decl_list⦎ (i : int) = in_required_state (loc_fmt_si_var_decl_list i);
val ⦏fmt_exp⦎ = in_required_state loc_fmt_exp;
val ⦏fmt_exp1⦎ = in_required_state loc_fmt_exp1;
val ⦏fmt_basic_decl⦎ = in_required_state loc_fmt_basic_decl;
val ⦏fmt_basic_decl_list⦎ = in_required_state loc_fmt_basic_decl_list;
val ⦏fmt_si_basic_decl⦎ = in_required_state loc_fmt_si_basic_decl;
val ⦏fmt_si_basic_decl_list⦎ = in_required_state loc_fmt_si_basic_decl_list;
val ⦏fmt_z_pred⦎ = in_required_state loc_fmt_z_pred;
val ⦏fmt_declaration⦎ = in_required_state loc_fmt_declaration;
val ⦏fmt_statement⦎ = in_required_state loc_fmt_statement;
val ⦏fmt_kslot_compilation_unit⦎ = in_required_state loc_fmt_kslot_compilation_unit;
val ⦏fmt_kslot_compilation_unit_list⦎ = in_required_state loc_fmt_kslot_compilation_unit_list;
val ⦏fmt_replaced_by_comp⦎ = in_required_state loc_fmt_replaced_by_comp;
val ⦏fmt_replaced_by_private_part⦎ = in_required_state loc_fmt_replaced_by_private_part;
val ⦏fmt_replaced_by_visible_part⦎ = in_required_state loc_fmt_replaced_by_visible_part;
val ⦏fmt_replaced_by_decl⦎ = in_required_state loc_fmt_replaced_by_decl;
val ⦏fmt_refined_by⦎ = in_required_state loc_fmt_refined_by;
val ⦏fmt_replaced_by⦎ = in_required_state loc_fmt_replaced_by;
val ⦏fmt_web_clause⦎ = in_required_state loc_fmt_web_clause;
=SML
fun ⦏mk_fmt_info⦎
	(outf : string -> unit)
	(Value repl_fun : (LABEL -> REPLACEMENT OPT) OPT)
	: PP_FMT_INFO = (
	{outf = outf,
	 fmt_repl = Value(mk_fmt_repl repl_fun)}
) | mk_fmt_info outf Nil = {outf = outf, fmt_repl = Nil};
=TEX
=SML
fun ⦏format_web_clause⦎ (repl_fun : (LABEL -> REPLACEMENT OPT) OPT)
	(x : WEB_CLAUSE) : unit = (
let	val outf = make_output_fun std_out;
	val fmt_info = mk_fmt_info outf repl_fun
in
	(
	reset_tabs();
	fmt_web_clause fmt_info x;
	reset_tabs())
end);

val ⦏print_web_clause⦎ : WEB_CLAUSE -> unit = (
    format_web_clause Nil
);

fun ⦏print_ada_program1⦎ (() : unit) : unit = with_soundness_checks (fn () =>
   ( format_web_clause (Value get_replacement)
    (WCCompilation (#spark_prog (get_z_generator_state()))))
);

fun ⦏output_ada_program1⦎ ({out_file : string}) = with_soundness_checks (fn () =>
let	val stream = open_out (translate_for_output out_file);
	val outf = make_output_fun stream;
	val fmt_info = mk_fmt_info outf (Value get_replacement)
    val x = (WCCompilation (#spark_prog (get_z_generator_state())));
in
	(
	reset_tabs();
	fmt_web_clause fmt_info x;
	reset_tabs();
	close_out stream
	)
end);
=TEX
\subsection{SPARK to Lists of Strings}
For various reasons, functions wish to apply a format function to a piece of
abstract syntax, and gain list of strings, each string being a logical line
of output, neither indented nor split merely due to length.
The following function takes and $fmt\_$ function and does what is necessary:
=SML
fun ⦏strings_from_fmt⦎ (fmt : PP_FMT_INFO -> 'a -> unit) (syntax : 'a) : string list = (
reset_tabs();
let val skipspace : bool ref = ref false;
    val strings : string list ref = ref [];
    val curr_str : string ref = ref "";
    val line_length = get_int_control"line_length";
    fun out_fun (s : string) : unit = (
	if (s = "\n")
	then (
		skipspace := false;
		strings := !strings @ [!curr_str];
		curr_str := "";
		()
	) else (
		if (s = ";" orelse s = "," orelse s = ")"
			orelse s = "." orelse s = "'" orelse s = ".."
			orelse !skipspace)
		then ()
		else	let	val cur_len = size (!curr_str);
				val s_len = size s;
			in	if	cur_len > 0 andalso cur_len + s_len > line_length
				then	(strings := !strings @ [!curr_str];
					 curr_str := "")
				else	(curr_str := !curr_str ^ " ")
			end;
		curr_str := !curr_str ^ s;
		if (s = "'" orelse s = "(" orelse s = "." orelse s = "..")
		then skipspace := true
		else skipspace := false;
		()
	)
    );
in
   (
	reset_tabs();
	fmt {outf = out_fun, fmt_repl = Nil} syntax;
	reset_tabs();
	if (!curr_str = "")
	then (!strings)
	else !strings @ [!curr_str]
   )
end);
=TEX
It is also convenient to have a function that assembles the list of strings
corresponding to the list of lines that would be output using {\it make\_output\_fun},
i.e., with indentation and line-wrapping.
=SML
fun ⦏strings_from_fmt1⦎ (fmt : PP_FMT_INFO -> 'a -> unit) (syntax : 'a) : string list = (
reset_tabs();
	let	 val strings : string list ref = ref [];
		val curr_str : string list ref = ref [];
		fun prt ("\n" : string) : unit = (
			strings := implode(rev(!curr_str)) :: !strings;
			curr_str := []
		) | prt s = (
			curr_str := s :: !curr_str
		);
	in
		reset_tabs();
		fmt {outf = make_output_fun1 prt, fmt_repl = Nil} syntax;
		reset_tabs();
		rev	(if (!curr_str = [])
			then (!strings)
			else implode(rev(!curr_str)) :: !strings)
	end
);
=TEX
\section{EPILOGUE}

=SML
end (* of structure CNAdaOutput *);
=TEX
\small
\twocolumn[\section{INDEX}]
\printindex
\end{document}
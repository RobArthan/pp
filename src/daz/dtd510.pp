=IGN
********************************************************************************
dtd510.doc: this file is part of the PPDaz system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% dtd510.doc ℤ $Date: 2005/06/02 15:05:19 $ $Revision: 1.57 $ $RCSfile: dtd510.doc,v $
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

\def\Title{Detailed Design: Ada Output Function}

\def\AbstractText{This document contains the detailed design for the DAZ Ada Output Function.}

\def\Reference{ISS/HAT/DAZ/DTD510}

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
%% LaTeX2e port: % TQtemplate.tex
%% LaTeX2e port: \documentstyle[hol1,11pt,TQ]{article}
%% LaTeX2e port: \ftlinepenalty=9999
\def\Hide#1{}
\def\Bool{``$\it{:}bool\,$''}
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{DAZ PROJECT} %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Detailed Design: Ada Output Function} %% Mandatory field
%% LaTeX2e port: \TPPref{ISS/HAT/DAZ/DTD510} %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.57 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion} %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2005/06/02 15:05:19 $%
%% LaTeX2e port: }}
%% LaTeX2e port: %\TPPstatus{Approved}
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: %\TPPkeywords{Ada}
%% LaTeX2e port: \TPPauthor{A.C.~Hayward&WIN01}
%% LaTeX2e port: \TPPauthorisation{D.J.~King & HAT Team}
%% LaTeX2e port: \TPPabstract{
%% LaTeX2e port: This document contains the detailed design for the DAZ Ada Output Function.}
%% LaTeX2e port: %\TPPabstractB{}
%% LaTeX2e port: %\TPPabstractC{}
%% LaTeX2e port: %\TPPabstractD{}
%% LaTeX2e port: %\TPPabstractE{}
%% LaTeX2e port: %\TPPabstractF{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	A.~Smith, DERA \\
%% LaTeX2e port: 	Library}}
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

\subsection{Changes History} % to get section number `0.3'
\begin{description}
\item[Issue 1.1 (1994/03/28)-1.16 (1994/10/10)] Initial Drafts.
\item[Issue 1.17 (1994/10/13) (13th October 1994)] Added auxiliary expression support.
\item[Issue 1.18 (1994/10/14) (14th October 1994)] Removed variant records from the implementation.
\item[Issue 1.19 (1994/11/03) (3rd November 1994)] Changed SUBUNIT to COMP\_SUBUNIT.
\item[Issue 1.20 (1994/11/14) (14th November 1994)] rationalised signature wrapping.
\item[Issues 1.21 (1994/12/08)-1.22 (1994/12/08)] Minor corrections before document inspection.
\item[Issue 1.23 (1994/12/09)] Reworked according to desk check report 019.
\item[Issue 1.24 (1995/10/27)] Updated the distribution list.
\item[Issue 1.25 (1995/11/07)] Corrected test policy statement.
\item[Issue 1.26 (1995/12/05)] Tidy-up.
\item[Issue 1.27 (1996/02/27)] Tidier error reporting.
\item[Issue 1.28 (1996/04/03)] Corrected {\LaTeX} error.
\item[Issue 1.29 (1997/04/08)] Reissue to match changes in version 1.61 of implementation doecument,
changing from string lists to direct output.
Many functions have been removed as they are not used externally to the structure.
\item[Issue 1.30 (1997/04/10)] Revealed more functions required elsewhere.
\item[Issue 1.31 (1997/07/07)] Clarified use of $cn\_automatic\_line\_splitting$.
\item[Issue 1.32 (1999/02/17)] Changes for NJML port.
\item[Issue 1.34 (2001/12/12)] Added control over case of keywords.
\item[Issue 1.35 (2002/01/26)] Removed local declarations for Poly/ML port.
\item[Issue 1.36 (2002/03/21)] New error message.
\item[Issue 1.38 (2002/08/23)] Removed use of ICL logo font.
\item[Issue 1.39 (2002/10/14)] Exposed interfaces needed by the VC browser.
\item[Issue 1.40 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.41 (2002/10/17), 1.42 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.43 (2002/11/10)] Uniform treatment of block statements.
\item[Issues 1.44 (2002/11/13)--1.49 (2002/12/16)] R0055: warnings for non-SPARK constructs.
\item[Issue 1.50 (2002/12/17)] R0092: improved generality of the pretty-printing API.
\item[Issue 1.51 (2003/05/27)] Addressed comments on documentation from QinetiQ.
\item[Issue 1.53 (2004/02/07)] The SPARK program is now referred to as the Ada program.
\item[Issue 1.54 (2004/08/11)] Missing identifiers at end of package body etc. now give non-SPARK warnings.
\item[Issue 1.55 (2004/10/10)] Non-SPARK warning messages for labelled statements and goto sttatements added.
\item[Issue 1.56 (2004/12/08)] Changed type of {\em fmt\_spec} to allow it to deal with all types of specification statement.
\item[Issue 1.57 (2005/06/02)] Made {\em fmt\_exp} visible externally.
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

This document contains the detailed design for the Compliance Tool Ada Output Function and responds to the high level design in \cite{ISS/HAT/DAZ/HLD503}.

The implementation is in \cite{ISS/HAT/DAZ/IMP510}.

\subsection{Introduction}

\subsubsection{Purpose and Background}

This detailed design document contains one signature, $CNAdaOutput$.  This provides facilities for printing out the various categories of abstract syntax.  None of the functions in it are intended to be called directly by the user.  Instead \cite{ISS/HAT/DAZ/DTD516} describes the top level functions which use this signature.

\subsubsection{Dependencies}

The functions in $CNAdaOutput$ depend on data types introduced in the structure $CNTypes$ which is defined in \cite{ISS/HAT/DAZ/DTD502}.

\subsection{Compliance}

The requirement is that the functions in this document support the correct printing of Ada programs which can be compiled using an Ada compiler.

\section{PRINTING ABSTRACT SYNTAX}

\subsection{The Signature}
=DOC
signature ⦏CNAdaOutput⦎ = sig
=DESCRIBE
This signature contains functions which format abstract syntax into strings
and the functions to print entire Ada programs from the compliance tool environment when compliance notation has been entered.
=USES
None of the functions in this signature are intended to be called directly by the user.
=ENDDOC
As in other signatures, local declarations would be nicer than includes
if they were allowed here:
=SML
include (* CNTypes *) CNTypes1;
=TEX
\subsection{Functions to Print Abstract Syntax}
=DOC
type ⦏PP_FMT_INFO⦎
	(* = {outf : string -> unit, fmt_repl : (LABEL -> unit) OPT} *);
val ⦏make_output_fun⦎ : outstream -> string -> unit;
val ⦏make_output_fun1⦎ : (string -> unit) -> string -> unit;
=DESCRIBE
{\it PP\_FMT\_INFO}
is the type used to pass formatting and output information to the
various functions that format Ada abstract syntax.

{\it make\_output\_fun} may be used to derive a suitable value for the
{\it outf} component of a {\it PP\_FMT\_INFO} from an output stream.
The resulting function will indent the output according to the nesting
of Ada constructs and will break long lines as guided by the integer
control {\it cn\_automatic\_line\_splitting}.
{\it make\_output\_fun1} is similarly but uses a function supplied as an argument
to do the actual output of a string, e.g., to assemble it in a buffer in memory.
=ENDDOC

=DOC

=DOC
datatype ⦏SPEC_STATEMENT_TYPE⦎ =
	⦏SpecStatement⦎
|	⦏Assertion⦎
|	⦏ProcedureSpecStatement⦎
|	⦏FunctionSpecStatement⦎;
val ⦏fmt_spec⦎ : PP_FMT_INFO ->
	(SPEC_STATEMENT_TYPE * Z_ID list * SPEC) -> unit
=DESCRIBE
Formatting a spec statement.
The boolean parameter indicates whether or not the spec statement is an assertion.
=ENDDOC

=DOC
val ⦏fmt_var_decl⦎ :
	PP_FMT_INFO -> VAR_DECL -> unit
val ⦏fmt_si_var_decl⦎ :
	int -> PP_FMT_INFO -> SI_VAR_DECL -> unit
val ⦏fmt_var_decl_list⦎ :
	PP_FMT_INFO -> VAR_DECL list -> unit
val ⦏fmt_si_var_decl_list⦎ :
	int -> PP_FMT_INFO -> SI_VAR_DECL list -> unit
=DESCRIBE
Formatting functions for variable declarations in the basic and derived abstract syntax.
These may also be used to format record component declarations.

The first parameter to {\it fmt\_si\_var\_decl} and {\it fmt\_si\_var\_decl\_list}
is a message number used to determine which message to produce if
{\it cn\_spark\_syntax\_warnings} is set true and the declaration contains a
non-SPARK construct. The parameter should be 510101 if the argument
is a variable declaration and 510112 if its a record component declaration.

=ENDDOC

=DOC
val ⦏fmt_exp⦎ : PP_FMT_INFO -> EXP -> unit;
val ⦏fmt_exp1⦎ : PP_FMT_INFO -> EXP -> unit;
=DESCRIBE
Formatting functions for Ada expressions.
{\em fmt\_exp} checks for non-SPARK constructs in the expression and outputs warning messages if any are found.
Use {\em fmt\_exp1} if these checks are not wanted.

=ENDDOC

=DOC
val ⦏fmt_basic_decl⦎ :
	PP_FMT_INFO -> BASIC_DECL -> unit
val ⦏fmt_basic_decl_list⦎ :
	PP_FMT_INFO -> BASIC_DECL list -> unit
val ⦏fmt_si_basic_decl⦎ :
	PP_FMT_INFO -> SI_BASIC_DECL -> unit
val ⦏fmt_si_basic_decl_list⦎ :
	PP_FMT_INFO -> SI_BASIC_DECL list -> unit
=DESCRIBE
Formattting functions for basic declarations in the basic and derived abstract syntax.
=ENDDOC

=DOC
val ⦏fmt_z_pred⦎ :
	PP_FMT_INFO -> Z_PRED -> unit
=DESCRIBE
Z predicates.
=ENDDOC

=DOC
val ⦏fmt_declaration⦎ : PP_FMT_INFO -> DECLARATION -> unit;
val ⦏fmt_statement⦎ : PP_FMT_INFO -> STATEMENT -> unit;
=DESCRIBE
Declarations, statements and blocks
=ENDDOC

=DOC
val ⦏fmt_kslot_compilation_unit⦎ :
	PP_FMT_INFO -> KSLOT_COMPILATION_UNIT ->
	unit
val ⦏fmt_kslot_compilation_unit_list⦎ :
	PP_FMT_INFO -> KSLOT_COMPILATION_UNIT list ->
	unit
=DESCRIBE
Compilation units.
=ENDDOC

=DOC
val ⦏fmt_replaced_by_comp⦎ :
	PP_FMT_INFO -> REPLACED_BY_COMP -> unit
val ⦏fmt_replaced_by_private_part⦎:
	PP_FMT_INFO -> REPLACED_BY_PRIVATE_PART ->
	unit
val ⦏fmt_replaced_by_visible_part⦎ :
	PP_FMT_INFO -> REPLACED_BY_VISIBLE_PART ->
	unit
val ⦏fmt_replaced_by_decl⦎ :
	PP_FMT_INFO -> REPLACED_BY_DECL -> unit
val ⦏fmt_refined_by⦎ :
	PP_FMT_INFO -> REFINED_BY -> unit
val ⦏fmt_replaced_by⦎ :
	PP_FMT_INFO -> REFINED_BY -> unit
val ⦏fmt_web_clause⦎ :
	PP_FMT_INFO -> WEB_CLAUSE -> unit
=DESCRIBE
Web clauses.
=ENDDOC


\section{ADA PROGRAM OUTPUT}
=DOC
val ⦏format_web_clause⦎ :
	(LABEL -> REPLACEMENT OPT) OPT -> WEB_CLAUSE -> unit
val ⦏print_web_clause⦎ : WEB_CLAUSE -> unit
val ⦏print_ada_program1⦎ : unit -> unit
val ⦏output_ada_program1⦎ : {out_file : string} -> unit
val ⦏strings_from_fmt⦎ : (PP_FMT_INFO -> 'a -> unit) -> 'a -> string list
val ⦏strings_from_fmt1⦎ : (PP_FMT_INFO -> 'a -> unit) -> 'a -> string list
=DESCRIBE
See
=SEEALSO
$cn\_automatic\_line\_splitting$ for an integer control that governs
the output line lengths.
=FAILURE
510001	The following name clashes have been detected in the Ada program:
510002	?0 clashes with ?1
510003	Name clashes detected in the Ada program
510004	Invalid control value "?0" not one of "upper", "lower" or "as input"
510005	VC soundness checks have failed
510006	*** SOUNDNESS CHECK FAILURE : ?2 [?1.?0]
510999	Internal error: unexpected language construct: ?0
=ENDDOC
See DTD516 for the interface description for these.
The functions whose names end in ``1'' have an historical parameter interface
and IMP516 maps the current parameter interface to these.
=DOC
(* ⦏cn_automatic_line_splitting⦎ - integer control declared by new_int_control, default 80 *)
(* ⦏cn_tab_width⦎ - integer control declared by new_int_control, default 2 *)
(* ⦏cn_left_margin⦎ - integer control declared by new_int_control, default 0 *)
=DESCRIBE
See DTD516.
=ENDDOC
=DOC
(* ⦏cn_spark_syntax_warnings⦎ - integer control declared by new_flag; default false *)
=DESCRIBE
See DTD516.
=ENDDOC
=FAILURE
510100	-- WARNING: ?0
510101	Subtype indications with constraints are not allowed in variable declarations in SPARK
510102	Subtype indications with constraints are not allowed in constant declarations in SPARK
510104	Discriminant parts are not allowed in SPARK
510105	Fixed point constraints are not allowed in subtype declarations in SPARK
510106	Floating point constraints are not allowed in subtype declarations in SPARK
510107	Attributes are not allowed as range constraints in integer type declarations
510108	Attributes are not allowed as range constraints in real type declarations
510110	Subtype indications with constraints are not allowed as array component subtypes in SPARK
510111	Ranges and subtype indications with constraints are not allowed as index constraints in SPARK
510112	Subtype indications with constraints are not allowed as record component subtypes in SPARK
510113	Renaming declarations occurring after other kinds of declaration are not allowed in SPARK
510114	Use clauses are not allowed in SPARK
510115	Aggregates that are not enclosed in a qualified expression are not allowed in SPARK
510116	Ranges without subtype marks are not allowed as loop parameter specifications in SPARK
510117	Block statements are not allowed in SPARK
510118	Exit statements with loop names are not allowed in SPARK
510119	Return statements with no return expression are not allowed in SPARK
510120	Default parameters are not allowed in SPARK
510121	Renaming declarations of this form are not allowed in SPARK
510122	Auxiliary expressions are not allowed in Ada
510123	The identifier at the end of a package declaration may not be omitted in SPARK
510124	The identifier at the end of a subprogram body may not be omitted in SPARK
510125	The identifier at the end of a package body may not be omitted in SPARK
510126	The private part of a package is not allowed to be empty in SPARK
510127	Labelled statements are not allowed in SPARK
510128	Goto statements are not allowed in SPARK
=TEX
\subsection{Epilogue}
=SML
end (* signature CNAdaOutput *);
=TEX

\section{TEST POLICY}
The functions in this document do not lend themselves to the module test framework (since their correct operation depends on the contents of output files).
The integration tests described in \cite{ISS/HAT/DAZ/HLD503} will exercise these functions.

\small
\twocolumn[\section{INDEX}]
\printindex

\end{document}




=IGN
********************************************************************************
dtd511.doc: this file is part of the PPDaz system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% dtd511.doc ℤ $Date: 2006/09/18 16:26:12 $ $Revision: 1.27 $ $RCSfile: dtd511.doc,v $
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

\def\Title{Detailed Design: Z Output Function}

\def\AbstractText{This document contains the detailed design for the Z Document Output Function.}

\def\Reference{ISS/HAT/DAZ/DTD511}

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
%% LaTeX2e port: \TPPtitle{Detailed Design: Z Output Function} %% Mandatory field
%% LaTeX2e port: \TPPref{ISS/HAT/DAZ/DTD511} %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.27 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion} %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2006/09/18 16:26:12 $%
%% LaTeX2e port: }}
%% LaTeX2e port: %\TPPstatus{Approved}
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: %\TPPkeywords{SPARK}
%% LaTeX2e port: \TPPauthor{A.C.~Hayward&WIN01}
%% LaTeX2e port: \TPPauthorisation{D.J.~King & DAZ Team}
%% LaTeX2e port: \TPPabstract{
%% LaTeX2e port: This document contains the detailed design for the Z Document Output Function.}
%% LaTeX2e port: %\TPPabstractB{}
%% LaTeX2e port: %\TPPabstractC{}
%% LaTeX2e port: %\TPPabstractD{}
%% LaTeX2e port: %\TPPabstractE{}
%% LaTeX2e port: %\TPPabstractF{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	A.~Smith, DRA \\
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
\item[Issue 1.1 (1994/07/11)-1.4 (1994/07/12) (\FormatDate{94/07/12})]
Initial Drafts.
\item[Issue 1.5 (1994/09/20) (\FormatDate{94/09/20})]
Added descriptive text.
\item[Issue 1.6 (1994/11/14) (\FormatDate{94/11/14})]
Caters for use of $new\_conjecture$.
\item[Issue 1.7 (1994/12/09) (\FormatDate{94/12/09})]
Minor corrections before document inspection.
\item[Issue 1.8 (1994/12/09)] Reworked according to desk check report 020.
\item[Issues 1.9 (1994/12/09) - 1.12 (1995/01/03) (\FormatDate{94/12/12})]
Changes to include the printing of package and subunit specification theories.
\item[Issue 1.13 (1995/01/04)]
Final Issue for {\Product} 0.5.
\item[Issue 1.14 (1995/03/31)]
Changed references for ISS/HAT/DAZ/WRK501.
\item[Issue 1.15 (1995/10/27)] Updated the distribution list.
\item[Issue 1.16 (1995/11/07)] Corrected test policy statement.
\item[Issue 1.17 (1997/08/12)] Typo in a reference.
\item[Issue 1.18 (1999/02/26)] Update for SML97.
\item[Issue 1.19 (2001/12/12)] Removed local declarations for Poly/ML port.
\item[Issue 1.20 (2002/01/29)] Allowed for datatypes for new Z fixity syntax.
\item[Issue 1.21 (2002/08/23)] Removed use of ICL logo font.
\item[Issue 1.22 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.23 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.24 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.25 (2006/06/13)] Now prints out all theories associated with the script theory (and general tidy-up).
\item[Issue 1.26 (2006/07/21)] Allowed for new context theory approach.
\item[Issue 1.27 (2006/09/18)] Fixed {\LaTeX} problem.
\item[Issue 1.28 (2007/01/23)] The ML bindings for {\em cn\_subprog\_ud\_key} etc. are now defined here.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported daz source documents onto the Lemma 1 document template
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
None.

\section{GENERAL}
\subsection{Scope}

This document contains the detailed design for the compliance notation Z Output Functions.  The implementation is in \cite{ISS/HAT/DAZ/IMP511}.

\subsection{Introduction}

\subsubsection{Purpose and Background}

This document contains a signature providing functions to output the Z document based on the environment information constructed during the input of a Compliance Notation literate script. It also provides many supporting functions for formatting pieces of Z.

This detailed design document contains one signature, $CNZOutput$. None of the functions in it is intended to be called directly by the user.  Instead \cite{ISS/HAT/DAZ/DTD516} describes the top level functions which use this signature.

%\subsubsection{Dependencies}
%\subsubsection{Possible Enhancements}
\subsubsection{Compliance}

This design must meet the requirements in \cite{ISS/HAT/DAZ/HLD503}. There is no further compliance argument appropriate.

\section{Z OUTPUT SIGNATURE}

\subsection{Preamble}
=DOC
signature ⦏CNZOutput⦎ = sig
=DESCRIBE
This is the signature for the structure containing the output function for Z.
=ENDDOC
\subsection{Dictionary}
The Z Output function works in two stages. In the first stage we scan through the theory database, picking up the information we require and holding it in a sorted list or dictionary.  This is ordered by the order items were placed into the theory database, and it is in this order we print things out.

The exception in fixity information.  The theory database doesn't tell us when this was introduced, so we place it at the beginning to be sure.

Information from seven sources is collected for the Z document.  Axioms, conjectures, fixity and definations is collected with $get\_XXX$ on the current theory.  Information relating to subprogram and stub theories and package specification theories is stored as user data in the theory.

In the Z Generator, described in \cite{ISS/HAT/DAZ/DTD507}, package specification and subprogram and stub theories are generated at the appropriate places while processing a literate script.  Markers are placed in the user data of the script theory indicating what theories have been created and at what stage during the script using the keys defined in \cite{ISS/HAT/DAZ/IMP507}.  These specification theories can be related to a script theory by becoming parents.  When this occurs and entry in made in the user data with the key $CN'newparent$.

When we come to print out the Z Document we gather this information from the user data to store in our sorted list of things to print.

=DOC
val ⦏dest_ud_string⦎ : USER_DATUM -> string * USER_DATUM list
val ⦏dest_ud_int⦎ : USER_DATUM -> int * USER_DATUM list
=DESCRIBE
These functions destroy objects of the type $USER\_DATUM$.
=ENDDOC

=DOC
type ⦏Z_DOC_PARAGRAPH⦎
=DESCRIBE
This datatype is used to store information relating to the output of the Z document in a dictionary.
=ENDDOC

=DOC
val ⦏add_sorted_to_list⦎ : (int * 'a) list -> int * 'a -> (int * 'a) list
=DESCRIBE
This function adds a new element to a list in ascending order.
=ENDDOC

=DOC
val ⦏delete_sorted⦎ : (int * 'a) list -> int -> (int * 'a) list
=DESCRIBE
This function removes all the elements in the list with indices before a given value.
=ENDDOC

=DOC
val ⦏add_sort_defn⦎ : (int * Z_DOC_PARAGRAPH) list ->
string list * THM -> (int * Z_DOC_PARAGRAPH) list
val ⦏add_sort_axiom⦎ : (int * Z_DOC_PARAGRAPH) list ->
string list * THM -> (int * Z_DOC_PARAGRAPH) list
val ⦏add_sort_vc⦎ : (int * Z_DOC_PARAGRAPH) list ->
string list * (int * TERM) -> (int * Z_DOC_PARAGRAPH) list
val ⦏add_sort_fix⦎ : (int * Z_DOC_PARAGRAPH) list ->
ZUserInterfaceSupport.CLASS * ZUserInterfaceSupport.TEMPLATE -> (int * Z_DOC_PARAGRAPH) list
val ⦏add_sort_create_subprog⦎ : (int * Z_DOC_PARAGRAPH) list ->
int * (string * int) -> (int * Z_DOC_PARAGRAPH) list
val ⦏add_sort_new_parent⦎ : (int * Z_DOC_PARAGRAPH) list ->
int * string -> (int * Z_DOC_PARAGRAPH) list
=DESCRIBE
These functions add a single element of each type to our dictionary.
=ENDDOC

=DOC
val ⦏add_sort_defns⦎ : (int * Z_DOC_PARAGRAPH) list ->
(string list * THM) list -> (int * Z_DOC_PARAGRAPH) list
val ⦏add_sort_axioms⦎ : (int * Z_DOC_PARAGRAPH) list ->
(string list * THM) list -> (int * Z_DOC_PARAGRAPH) list
val ⦏add_sort_vcs⦎ : (int * Z_DOC_PARAGRAPH) list ->
(string list * (int * TERM)) list -> (int * Z_DOC_PARAGRAPH) list
val ⦏add_sort_fixs⦎ : (int * Z_DOC_PARAGRAPH) list ->
(ZUserInterfaceSupport.CLASS * ZUserInterfaceSupport.TEMPLATE) list -> (int * Z_DOC_PARAGRAPH) list
val ⦏add_sort_create_subprogs⦎ : (int * Z_DOC_PARAGRAPH) list ->
USER_DATUM list -> (int * Z_DOC_PARAGRAPH) list
val ⦏add_sort_new_parents⦎ : (int * Z_DOC_PARAGRAPH) list ->
USER_DATUM list -> (int * Z_DOC_PARAGRAPH) list
=DESCRIBE
These functions add a list of elements to our dictionary.
=ENDDOC

=DOC
val ⦏get_create_subprogs⦎ : string -> USER_DATUM list
val ⦏get_new_parents⦎ : string -> USER_DATUM list
=DESCRIBE
These functions retrieve some of the information we require from the user data of a given theory.
=ENDDOC
=DOC
val ⦏cn_context_ud_key⦎ : string;
val ⦏cn_subprog_ud_key⦎ : string;
val ⦏cn_new_parent_ud_key⦎ : string;
=DESCRIBE
These strings are used as keys to communicate information to the Z output functions about various relationships between theories.
=ENDDOC

=DOC
val ⦏add_defns⦎ : (int * Z_DOC_PARAGRAPH) list ->
string -> (int * Z_DOC_PARAGRAPH) list
val ⦏add_axioms⦎ : (int * Z_DOC_PARAGRAPH) list ->
string -> (int * Z_DOC_PARAGRAPH) list
val ⦏add_vcs⦎ : (int * Z_DOC_PARAGRAPH) list ->
string -> (int * Z_DOC_PARAGRAPH) list
val ⦏add_fixs⦎ : (int * Z_DOC_PARAGRAPH) list ->
string -> (int * Z_DOC_PARAGRAPH) list
val ⦏add_create_subprogs⦎ : (int * Z_DOC_PARAGRAPH) list ->
string -> (int * Z_DOC_PARAGRAPH) list
val ⦏add_new_parents⦎ : (int * Z_DOC_PARAGRAPH) list ->
string -> (int * Z_DOC_PARAGRAPH) list
=DESCRIBE
These functions take a theory name as an argument, and add the relevant parts from that theory to our dictionary.
=ENDDOC

\subsection{Formatting}
In the second stage, we take the elements of our dictionary in turn and pretty print them.

=DOC
val ⦏z_thm_rule⦎ : THM -> THM
=DESCRIBE
z\_thm\_rule is used to strip the Z Paragraph header information from a theorem.
=ENDDOC

=DOC
val ⦏z_output_tab_width⦎ : int
val ⦏z_output_mk_tab⦎ : int -> string
val ⦏z_output_tab⦎ : string
val ⦏z_output_ll⦎ : int
=DESCRIBE
Information needed for the formatting functions.
=ENDDOC

=DOC
val ⦏fmt_string_list⦎ : string list -> string
val ⦏concat_string_list⦎ : string list -> string
val ⦏fmt_semi_colon⦎ : string list -> string list
val ⦏fmt_body⦎ : string list -> string list
val ⦏fmt_prefix_tab⦎ : string list -> string list
val ⦏dest_z_many_∧⦎ : TERM -> TERM list
=DESCRIBE
Generally useful functions.
=ENDDOC

=DOC
val ⦏fmt_var⦎ : Z_TERM * TERM -> string
val ⦏fmt_var_list⦎ : TERM list -> string
val ⦏fmt_dec⦎ : TERM -> string list
val ⦏fmt_dec_list⦎ : TERM list -> string list
=DESCRIBE
Formatting functions for Declarations.
=FAILURE
511001	Theory contains a declaration which cannot be printed as Z: ?0
=ENDDOC

=DOC
val ⦏fmt_pred_list⦎ : TERM list -> string list
=DESCRIBE
Formatting functions for Predicates.
=ENDDOC

=DOC
val ⦏fmt_schbox_name⦎ : TERM -> string list
val ⦏fmt_schbox⦎ : THM -> string list
=DESCRIBE
Formatting functions for Z Schema Boxes
=ENDDOC

=DOC
val ⦏fmt_abbdef⦎ : THM -> string list
=DESCRIBE
Formatting functions for Z Abbreviation Definations
=ENDDOC

=DOC
val ⦏fmt_defns⦎ : THM -> string list
=DESCRIBE
Formatting functions for Definations.
=FAILURE
511002	Theory contains a definition which cannot be printed as Z: ?0
=ENDDOC

=DOC
val ⦏fmt_axioms⦎ : THM -> string list
=DESCRIBE
Formatting functions for Axioms.
=ENDDOC

=DOC
val ⦏fmt_vcs⦎ : string * TERM -> string list
=DESCRIBE
Formatting functions for Verification Conditions.
=ENDDOC

=DOC
val ⦏fmt_fixs⦎ : ZUserInterfaceSupport.CLASS * ZUserInterfaceSupport.TEMPLATE -> string list
=DESCRIBE
Formatting functions for Fixity Paragraphs.
=ENDDOC

The following function is used if a package specification theory was generated by the literate script.  This is done by a $duplicate\_theory$.  To avoid repetitious output we output a $duplicate\_theory$ command, and only print new additions to the specification theory by calling $fmt\_z\_document$ with level set to after the objects introduced by the $duplicate\_theory$.

=DOC
val ⦏fmt_create_context⦎ : string list -> (string * int) -> string list
=DESCRIBE
Formatting function for the creation of context theories.
=FAILURE
511004	Unable to create document from context theory : ?0
=ENDDOC

=DOC
val ⦏fmt_create_subprog⦎ : string list -> (string * int) -> string list
=DESCRIBE
Formatting function for the creation of subprogram theories.
=FAILURE
511005	Unable to create document from subprogram theory : ?0
=ENDDOC

=DOC
val ⦏fmt_new_parent⦎ : string -> string list
=DESCRIBE
Formatting function for the creation of a new parent for the current theory.
=ENDDOC

=DOC
val ⦏fmt_paragraph⦎ : string list -> Z_DOC_PARAGRAPH -> string list
val ⦏fmt_paragraphs⦎ : string list -> (int * Z_DOC_PARAGRAPH) list -> string list
=DESCRIBE
Formatting functions for Z Paragraphs.
=ENDDOC

The string argument of the following function gives the theory name.  This is followed by an integer.  Only objects in our dictionary with indices after this integer are printed.  This is used by $fmt\_subprog$ to avoid printing repetitious output.
=DOC
val ⦏fmt_z_document⦎ : string -> int -> string list -> string list
=DESCRIBE
This function creates the whole Z Document from a given theory, and returns it as a string suitable for diag\_line or output.
=FAILURE
511010	The Compliance Notation theory information is corrupt
	(there is an infinite cycle through theory ?0)
511011	The Compliance Notatio theory information in theory ?0
	is corrupt
=ENDDOC

=TEX

\subsection{Output Functions}
=DOC
val ⦏print_z_document⦎ : string -> unit
val ⦏output_z_document⦎ : {out_file : string, script : string} -> unit
=DESCRIBE
These are the top-level printing functions and are called by the Compliance Tool user interface module in ISS/HAT/DAZ/DTD516.
=ENDDOC

\subsection{Epilogue}
=SML
end (* signature CNZOutput *);
=TEX

=TEX
\section{TEST POLICY}
The functions in this document do not lend themselves to the module test framework (since their correct operation depends on the contents of output files).
The integration tests described in \cite{ISS/HAT/DAZ/HLD503} will exercise these functions.
=IGN

*** for possible future inclusion in the test documentation ***

The test module is \cite{ISS/HAT/DAZ/WRK501}.  To run the test:

\begin{verbatim}
use_file "wrk501";
output_z_document {out_file="wrk501.thy.old", script="wrk501"};
open_theory "daz_toolkit_extensions";
delete_theory "wrk501";
new_theory "delete_me";
open_theory "delete_me";
use_file "wrk501.thy.old";
output_z_document {out_file="wrk501.thy.new", script="delete_me"};
\end{verbatim}

and then at a unix prompt:

\begin{verbatim}
diff wrk501.thy.old wrk501.thy.new > wrk501.diff
\end{verbatim}

Load the file wrk501.diff into an editor, like Xpp and check for the differences.
=TEX

\small
\twocolumn[\section{INDEX}]
\printindex

\end{document}




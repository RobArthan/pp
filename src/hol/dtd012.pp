=IGN
********************************************************************************
dtd012.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  dtd012.doc  $Id: dtd012.doc,v 2.44 2014/04/12 16:03:18 rda Exp rda $ ℤ
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

\def\Title{Detailed Design for the Interface to the Abstract Data Type $THM$}

\def\AbstractText{This document gives a detailed design for the interface to the abstract data type $THM$. This includes all those functions that the kernel of ICL HOL will need to interface to the abstract data type, but do not need to be present within the abstract data type.}

\def\Reference{DS/FMU/IED/DTD012}

\def\Author{R.D. Arthan, K. Blackburn}


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
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{FST Project}  %% Mandatory field
%% LaTeX2e port: \TPPtitle{Detailed Design for the Interface to the Abstract Data Type $THM$}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Detailed Design for the \cr
%% LaTeX2e port: Interface to the Abstract Data Type $THM$}
%% LaTeX2e port: \TPPref{DS/FMU/IED/DTD012}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 2.44 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2014/04/12 16:03:18 $ %
%% LaTeX2e port: }}  %% Mandatory field
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: %\TPPstatus{Approved}
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: %\TPPauthor{R.D. Arthan & WIN01}  %% Mandatory field
%% LaTeX2e port: \TPPauthors{R.D. Arthan & WIN01\\K. Blackburn & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document gives a detailed design for the
%% LaTeX2e port: interface to the
%% LaTeX2e port: abstract data type $THM$.
%% LaTeX2e port: This includes all those functions that the kernel of ICL HOL
%% LaTeX2e port: will need to interface to the abstract data type, but do not
%% LaTeX2e port: need to be present within the abstract data type.}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	    Library \\ RDA \\ KB \\RBJ
%% LaTeX2e port: }}
%% LaTeX2e port: %\TPPclass{CLASSIFICATION}
%% LaTeX2e port: %\def\TPPheadlhs{}
%% LaTeX2e port: %\def\TPPheadcentre{}
%% LaTeX2e port: %def\TPPheadrhs{}
%% LaTeX2e port: %\def\TPPfootlhs{}
%% LaTeX2e port: %\def\TPPfootcentre{}
%% LaTeX2e port: %\def\TPPfootrhs{}
%% LaTeX2e port: \begin{document}
%% LaTeX2e port: \makeTPPfrontpage
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
\pagebreak
\section{DOCUMENT CONTROL}
\subsection{Contents List}
\tableofcontents
\subsection{Document Cross References}
\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes History}
\begin{description}
\item [Issue 1.1 (1991/04/30) - 1.17 (1991/09/18)]
First drafts leading up to deskcheck ID0042,
and the resulting rework.
\item [Issue 2.1 (1991/09/18) (18th September 1991)]
Approved version of issue 1.17.
\item [Issue 2.2 (1991/09/25) (25th September 1991)]
Approved version of issue 2.1, differing only in a ``=ERRORS'' being replaced by the correct marker, ``=FAILURE''.

\item[Issue 2.3 (1992/01/20)~(\FormatDate{92/01/20})] Updated to use new fonts.
\item[Issue 2.4 (1992/01/27) (23rd January 1992)]
$new\_axiom$, $simple\_new\_type\_defn$ and $new\-\_type\-\_defn$
all changed to take lists of keys, rather than single ones.
\item [Issue 2.6 (1992/04/14) (13th April 1992)]
Changes due to CR0017.
\item[Issue 2.8 (1992/05/21) (14 May 1992)]
Use correct quotation symbols.
\item [Issue 2.9 (1992/05/26)(26th May 1992)]
Renamings from version 1.5 of DS/FMU/IED/WRK038.
\item [Issue 2.10 (1992/07/14) (31st July 1992)]
Added $do\_in\_theory$.
\item [Issue 2.11 (1992/07/31) (14th December 1992)]
Added $pending\_reset\_ksc\_functions$.
\item [Issue 2.13 (1993/01/07) (7th January 1993)]
Clarifying text.
\item [Issue 2.14 (1993/02/18) (18th February 1993)]
$delete\_const$ will now delete constant at head of application.
\item [Issue 2.15 (1993/08/16)-2.17 (1993/08/18) (16th-18th August 1993)]
Added type, term and theorem compactification.
\item [Issue 2.18 (1993/12/09) (8th December 1993)]
Added $get\_theory\_names$.
\item [Issue 2.19 (2001/08/09) (9th August 2001)]
Added description of new caching mechanism.
\item [Issue 2.20 (2002/06/03)]
Added functions to access the efficient representations of the axioms, definitions
and theorems in a theory.
\item[Issue 2.21 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 2.22 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 2.23 (2002/12/11)] Removed unnecessary level of indirection from the {\it USER\_DATA} data type.
\item[Issues 2.24 (2002/12/13) -- 2.28 (2003/01/17)] Introduced theory checkpointing functionality.
\item[Issue 2.29 (2005/04/18)] Relaxed restrictions on checkpointing.
\item[Issues 2.30 (2005/04/19)] Interfaces to the kernel inference rules are now here in the kernel interface module.
\item[Issue 2.31 (2005/09/07)] Added functions {\em get\_const\_keys} and {\em get\_type\_keys}.
\item[Issues 2.32 (2005/12/14), 2.33 (2005/12/15)] Kernel interface and symbol table reform.
\item[Issue 2.35 (2005/12/16)] The prefix for private interfaces is now $pp'$ rather than $icl'$.
\item[Issue 2.36 (2005/12/16)] {\em delete\_to\_level} and {\em thm\_level} are now made available for use in Compliance Tool etc.
\item[Issue 2.37 (2005/12/16)] Adjustments to the documentation and error messages for the new conjecture management facilities.
\item[Issue 2.38 (2006/01/17)] Interface tables are now implemented as a list of dictionaries, one for each ancestor.
\item[Issue 2.39 (2006/01/26)] Default compactification mask is now compiler-dependent (Poly/ML is better without compactification these days).
\item[Issues 2.40 (2007/05/21), 2.41 (2013/11/21)] Added {\em delete\_kernel\_inference\_fun}.
\item[Issue 2.41 (2013/11/21), 2.42 (2013/11/21)] Added {\em delete\_kernel\_inference\_fun}.
\item[Issue 2.43 (2014/01/10)] Can now delete kernel state change monitoring functions.
\item[Issues 2.44 (2014/04/12)]
=INLINEFT
simple_new_defn
=TEX
\ has been replaced by
=INLINEFT
gen_new_spec
=TEX
.
\item[Issue 2.45 (2014/04/14)] Added
=INLINEFT
new_spec1
=TEX
\ so that we can demonstrate that
=INLINEFT
gen_new_spec
=TEX
\ is capable of simulating the functionality of
=INLINEFT
new_spec
=TEX
.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.

\item[2015/08/03]
Added more aggressive rollback function.

%%%% END OF CHANGES HISTORY %%%%
\end{description}
% \subsection{Changes Forecast}
\pagebreak
\section{GENERAL}
\subsection{Scope}
This document contains a detailed design for the interface to the
abstract data type $THM$.
The interface functions complete the set of functions called
for in section 4 of \cite{DS/FMU/IED/HLD007}.
The design is implemented in \cite{DS/FMU/IED/IMP012}.

The interfaces given here do not include the inference rules.
The interfaces for the rules are considered in \cite{DS/FMU/IED/DTD007}.

\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains the detailed design for the theory management interface
functions to the abstract data type $THM$.
These functions give a user- or programmer- oriented interface rather
than the raw minimum supplied by the abstract data type itself.

\subsubsection{Dependencies}
This document depends on \cite{DS/FMU/IED/IMP006}.
\subsubsection{Deficiencies}
Error 6067 of $new\_parent$ would be best replaced by
an error that indicates the cause of the clash.
\subsubsection{Possible Enhancements}
There is some possibility for further experimentation and improvement
of the compactification techniques. One possibility is the use of
a string store to hold constant and variable names.

\section{DISCUSSION}
A few minor policy decisions are worth noting:

\begin{enumerate}
\item the interface provided uses strings for theory names throughout
(rather than the numeric theory identifiers used in the abstract data
type);
\item as in the abstract data type, modifications to a theory may
only happen when it is current;
\item operations which change the state are formulated as uncurried
functions so that an interactive user is less likely to omit an
argument unwittingly.
\item
all functions that take a theory name as a string recognise
``-'' as meaning the current theory.
This will not be indicated in the individual documentation boxes.
\end{enumerate}


\section{PREAMBLE}
=DOC
signature ⦏KernelInterface⦎ = sig
=DESCRIBE
This is the signature of the structure that gives the standard interface to the logical kernel.
This interface adds a layer of additional services to the kernel functionality.
E.g., it is used to notify the parser and type-inferrer so that they operate correctly when the current theory changes.
The functions in the structure {\em KernrlInterface} should always be used in preference to direct use of the functions in the structure {\em pp'Kernel} except in coding extensions to the system that need to bypass these services.
=FAILURE
6013	?0 is ill-formed in current theory: type name ?1 is not declared
6014	?0 is ill-formed in current theory: type name ?1 does not have arity used
6015	?0 is ill-formed in current theory: constant name ?1 not declared
6038	?0 is ill-formed in current theory: constant name ?1 cannot have type used
=FAILUREC
The above are error messages various kinds of well-formedness check failures.
A well-formedness check occurs on any types, terms and theorems saved in a theory, and thus these errors may occur for any function in this signature which saves types, terms or theorems in a theory.
=ENDDOC
There are errors common to many kernel (i.e. from the abstract data type) functions, that
are raised by $error$.
This means that they raise exceptions whose ``area'' is a
kernel function that is used to implement a corresponding
interface function of this document.
\section{TYPES}
Most of the types with which the interface works are given in the
signature $KernelTypes$ defined in \cite{DS/FMU/IED/DTD006}.
Here we merely need to include that signature:
=SML
include KernelTypes;
=TEX

\section{THEORY MANAGEMENT OPERATIONS}
\subsection{Operations on Hierarchies}
No operations on hierarchies are supplied in this interface. The only
user interface to hierarchies is via the UNIX commands as described
in \cite{DS/FMU/IED/HLD005} and these use the interfaces of
\cite{DS/FMU/IED/DTD006} directly.

\subsection{Operations on Theory Attributes}
=DOC
val ⦏open_theory⦎ : string -> unit;
=DESCRIBE
All specification and proof work is carried out in the context
of some theory, referred to as the current theory.
$open\_theory\,thy$ makes an existing theory $thy$ the current theory.
=FAILURE
6017	Theory ?0 may not be opened (it is not a descendant of ?1 which must be in scope)
12035	Theory ?0 is not present in the current hierarchy
=FAILUREC
Certain theories created when the system is constructed may
not be subsequently opened, and attempts to open them give rise to error 6017.
=ENDDOC

=DOC
val ⦏delete_theory⦎ : string -> unit;
=DESCRIBE
$delete\_theory\,thy$ removes the theory $thy$ from the theory database.
This means, for instance, that all theorems that were proven with the deleted
theory as the current theory, and all constants and types declared within the theory, will become out of scope.
=FAILURE
12035	Theory ?0 is not present in the current hierarchy
6037	Theory ?0 is locked
6069	Theory ?0 is in scope
6071	Theory ?0 is a read-only ancestor
6076	Theory ?0 has child theories
=ENDDOC

=DOC
val ⦏new_theory⦎ : string -> unit;
=DESCRIBE
$new\_theory\,thy$ adds a new, empty, theory called
$thy$ to the theory database.
The empty theory has no declarations within it,
but does have the current theory as its sole parent.
The new theory then becomes the current theory.
=FAILURE
6040	Theory ?0 is already present in current theory hierarchy
=ENDDOC
Note that the notifier functions are only notified of $NewTheory$, not $OpenTheory$ as well.
=DOC
val ⦏new_parent⦎ : string -> unit;
=DESCRIBE
Adds the given parent theory to the list of parents of the current
theory, considered as a set.
It will fail if the parent theory does not exist; is already a parent of the current theory;
or if making it a parent would cause a clash by bringing a new theory into scope (perhaps the new parent itself)
that declares a new type or constant that is already in scope,
or is declared in the descendants of the current theory.
=FAILURE
12035	Theory ?0 is not present in the current hierarchy
6037	Theory ?0 is locked
6067	Making ?0 a parent would cause a clash
6071	Theory ?0 is a read-only ancestor
6082	Theory ?0 is already a parent
6084	Suggested parent ?0 is a child of the current theory
=ENDDOC

=DOC
val ⦏lock_theory⦎ : string -> unit;
=DESCRIBE
$lock\_theory\,thy$ causes $thy$ to be {\em locked}. The contents of
a locked theory are protected from further changes.
A locked theory may be unlocked using $unlock\_theory$(q.v.).
=FAILURE
12035	Theory ?0 is not present in the current hierarchy
6037	Theory ?0 is locked
6071	Theory ?0 is a read-only ancestor
=ENDDOC

=DOC
val ⦏unlock_theory⦎ : string -> unit;
=DESCRIBE
$unlock\_theory\,thy$ causes the locked theory $thy$ to be unlocked,
so that the contents of $thy$ may be changed.
=FAILURE
12035	Theory ?0 is not present in the current hierarchy
6068	Theory ?0 has not been locked
=ENDDOC

=DOC
val ⦏duplicate_theory⦎ : (string * string) -> unit;
=DESCRIBE
$duplicate\_theory\,oldthy\,newthy$ creates a new theory,
called $newthy$
with the same contents and parents as $oldthy$,
but without any children.
The current theory remains unchanged.
=USES
To allow the user to modify and experiment with a theory that
has child theories that are not involved in the experiment,
and would perhaps clash with the experiment.
=FAILURE
6026	Theory ?0 may not be duplicated
	(it must always be in the scope of any opened theory)
6042	Theory ?0 may not be duplicated (the duplicate would not be a descendant of ?1)
12035	Theory ?0 is not present in the current hierarchy
6040	Theory ?0 is already present in current theory hierarchy
=FAILUREC
To ensure that the duplicate theory can be opened by $open\_theory$ (q.v.) the system will prevent the duplication of
theories which would give rise to error 6017 of $open\_theory$ if opened, and attempts to create such duplicates will give rise to
error 6026 or 6042.
=ENDDOC

\subsection{Operations on Theorems}
=DOC
val ⦏=|-⦎ : THM * THM -> bool;
val ⦏~=|-⦎ : THM * THM -> bool;
val ⦏=#⦎ : SEQ * SEQ -> bool;
val ⦏~=#⦎ : SEQ * SEQ -> bool;
=DESCRIBE
=INLINEFT
 =|-
=TEX
{} provides a strict equality test on the conclusion and assumptions of theorems,
=INLINEFT
~=|-
=TEX
{} provides an equality test on the conclusion and assumptions of theorems up to $α$-convertibility and order of assumptions.
=INLINEFT
 =#
=TEX
{} provides a strict equality test on sequents,
=INLINEFT
~=#
=TEX
{} provides an equality test on the sequents up to $α$-convertibility and order of assumptions.
=ENDDOC
=DOC
val ⦏dest_thm⦎ : THM -> SEQ;
=DESCRIBE
This returns the representation of a theorem as a sequent, i.e. as a list of assumptions and a conclusion.
=SEEALSO
$asms$, $concl$
=ENDDOC
=DOC
val ⦏valid_thm⦎ : THM -> bool;
=DESCRIBE
This function uses the check for the validity of theorems:
returning true if valid and false otherwise: it cannot raise exceptions.
=USES
To preempt errors caused by the primitive inference rules,
which raise uncatchable errors when given invalid theorems,
and so return more helpful error messages.
=ENDDOC
=DOC
val ⦏thm_fail⦎ : string -> int -> THM list -> 'a;
=DESCRIBE
$thm\_fail$ $area$ $msg$ $thml$ first creates a list of functions from $unit$ to $string$, providing displays of the list of theorems.
It then calls $fail$ with the $area$, $msg$ and this list of functions.
This allows theorems to be presented in error messages.
=ENDDOC
=DOC
val ⦏string_of_thm⦎ : THM -> string;
=DESCRIBE
This returns a display of a theorem in the form of a string,
with no inserted new lines, suitable for use with $diag\_string$ and $fail$.
=SEEALSO
$format\_thm$, a formatted string display of a theorem.
=ENDDOC
=DOC
val ⦏asms⦎ : THM -> TERM list;
=DESCRIBE
This returns the assumptions(hypotheses) of a theorem.
=SEEALSO
$dest\_thm$
=ENDDOC
=DOC
val ⦏concl⦎ : THM -> TERM;
=DESCRIBE
This returns the conclusion of a theorem.
=SEEALSO
$dest\_thm$
=ENDDOC
=DOC
val ⦏thm_theory⦎ : THM -> string;
=DESCRIBE
$thm\_theory\,thm$ returns the name of the theory which was current when
$thm$ was proven.
This will succeed even if the theory is out of scope,
but not if the theory has been deleted.
=FAILURE
12007	?0 proven in theory with internal name ?1,
	which is not present in current hierarchy
=ENDDOC
\subsection{Operations on Theory Contents}
Implementation note: as the error numbers suggest,
the checking of conjectures in the following two functions is actually implemented in \cite{DS/FMU/IED/IMP103}
{\em using before\_kernel\_state\_change}
=DOC
val ⦏save_thm⦎ : (string * THM) -> THM
=DESCRIBE
$save\_thm(key, thm)$ causes $thm$ to be save under the key $key$ in the current
theory.
The saved theorem is returned as the function's result.
If there is a conjecture stored under the same key in the current theory,
the theorem must prove the conjecture, i.e., its conclusion must be the same as the conjecture and it must have an empty assumption list.
=SEEALSO
{\em new\_conjecture}, {\em is\_proved\_conjecture}
=FAILURE
6037	Theory ?0 is locked
6039	Key ?0 has already been used for a theorem in theory ?1
6071	Theory ?0 is a read-only ancestor
103101	This theorem does not prove the conjecture stored under key ?0
=ENDDOC

=DOC
val ⦏list_save_thm⦎ : (string list * THM) -> THM
=DESCRIBE
$list\_save\_thm(keys, thm)$ causes $thm$ to be save under the keys $keys$ in the current
theory.
The saved theorem is returned as the function's result.
If there is a conjecture stored under any of the keys in the current theory,
the theorem must prove each such conjecture, i.e., its conclusion must be the same as the conjecture and it must have an empty assumption list.
=SEEALSO
{\em new\_conjecture}, {\em is\_proved\_conjecture}
=FAILURE
6031	Key list may not be empty
6037	Theory ?0 is locked
6039	Key ?0 has already been used for a theorem in theory ?1
6071	Theory ?0 is a read-only ancestor
103101	This theorem does not prove the conjecture stored under key ?0
=ENDDOC

=DOC
val ⦏delete_const⦎ : TERM -> unit
=DESCRIBE
$delete\_const\,c$ deletes the constant $c$
(or the constant with the same type, up to renaming of type variables) and any other object which
depends on $c$ from the current theory.
If $c$ is the application of a constant to some arguments
then that constant is the one deleted.
If any saved objects other than $c$ and
its defining theorem do depend on $c$, the interactive user will be notified
and asked whether to proceed with the deletion.

After the deletion
any theorems which have been proven since the definition of $c$ will no
longer be usable for further proof.

Note that the deletion will attempt to delete all necessary
theorems before deleting constants, types, and axioms in single steps,
and thus may fail with a partially modified theory.
This is because checks in the interface may not be as definitive as those of the kernel.
The ``on kernel state change'' functions will be notified as if
all necessary single step deletions, of theorems, constants, types and axioms to achieve the goal had been done, but after
all the actual changes have been made.
The ``before kernel state change'' functions will be notified of all the changes, as if single steps, before any are made.
=FAILURE
6037	Theory ?0 is locked
6071	Theory ?0 is a read-only ancestor
6076	Theory ?0 has child theories
12001	Theory ?0 does not contain the constant ?1 with the supplied type
12012	Deletion of ?0 would require the deletion of ?1
12014	?0 is not a constant or a constant applied to some arguments
=ENDDOC
The following strings are used in formatting the arguments of
message 12012:
=FAILURE
12100	Constant?0:
12101	Type?0:
12102	Theorem?0:
12103	Axiom?0:
12104	Definition?0:
=TEX

=DOC
val ⦏delete_type⦎ : string -> unit
=DESCRIBE
$delete\_type\,t$ deletes the type constructor $t$ and any other object which
depends on $t$ from the current theory. If any objects other than $t$ and
its defining theorem do depend on $t$, the interactive user will be notified
and asked whether to proceed with the deletion.

After the deletion
ny theorems which have been proven since the definition of $ty$ will no
longer be usable for further proof.

Note that the deletion will attempt to delete all necessary
theorems before deleting constants, types, and axioms in single steps,
and thus may fail with a partially modified theory.
This is because checks in the interface may not be as definitive as those of the kernel.
The ``on kernel state change'' functions will be notified as if
all necessary single step deletions, of theorems, constants, types and axioms to achieve the goal had been done, but after
all the actual changes have been made.
The ``before kernel state change'' functions will be notified of all the changes, as if single steps, before any are made.
=FAILURE
6037	Theory ?0 is locked
6071	Theory ?0 is a read-only ancestor
6076	Theory ?0 has child theories
12002	Theory ?0 does not contain the type constructor ?1
12012	Deletion of ?0 would require the deletion of ?1
=ENDDOC

=DOC
val ⦏delete_axiom⦎ : string -> unit
=DESCRIBE
$delete\_axiom\,key$ deletes the
axiom stored under key $key$ and any other object which
depends on it from the current theory. If any objects
do depend on the axiom, the interactive user will be notified
and asked whether to proceed with the deletion.

After the deletion any theorems which have been proven since the introduction
of the axiom will no longer be usable for further proof.

Note that the deletion will attempt to delete all necessary
theorems before deleting constants, types, and axioms in single steps,
and thus may fail with a partially modified theory.
This is because checks in the interface may not be as definitive as those of the kernel.
The ``on kernel state change'' functions will be notified as if
all necessary single step deletions, of theorems, constants, types and axioms to achieve the goal had been done, but after
all the actual changes have been made.
The ``before kernel state change'' functions will be notified of all the changes, as if single steps, before any are made.
=FAILURE
6037	Theory ?0 is locked
6071	Theory ?0 is a read-only ancestor
6076	Theory ?0 has child theories
12003	Theory ?0 does not contain an axiom under key ?1
12012	Deletion of ?0 would require the deletion of ?1
=ENDDOC

=DOC
val ⦏delete_thm⦎ : string -> THM;
=DESCRIBE
$delete\_thm\,key$ deletes the
theorem stored under key $key$ from the current theory.
It returns the deleted theorem.
=FAILURE
6037	Theory ?0 is locked
6046	Key ?0 is not used for a theorem in theory ?1
6071	Theory ?0 is a read-only ancestor
=ENDDOC

=DOC
val ⦏new_axiom⦎ : (string list * TERM) -> THM
=DESCRIBE
$new\_axiom(keys, tm)$ stores the boolean term $tm$ an axiom in the
current theory as an axiom under keys $keys$.
=FAILURE
3031	?0 is not of type ⓣBOOL⌝
6031	Key list may not be empty
6037	Theory ?0 is locked
6047	Key ?0 has already been used for an axiom in theory ?1
6071	Theory ?0 is a read-only ancestor
=ENDDOC

=DOC
val ⦏new_const⦎ : (string * TYPE) -> TERM;
=DESCRIBE
$new\_const$ $(name, type)$ introduces a new constant
(with no defining theorem) called $name$, with most general type
$type$, into the current theory.
=FAILURE
6037	Theory ?0 is locked
6049	There is a constant called ?0 already in scope
6063	There is a constant called ?0 in the descendants of the
	current theory
6071	Theory ?0 is a read-only ancestor
=ENDDOC
=DOC
val ⦏new_type⦎ : (string * int) -> TYPE;
=DESCRIBE
$new\_type$ $(name, arity)$ introduces a new type constructor
(with no defining theorem) called $name$ with arity $arity$ into the
current theory.
The function returns the new type with sufficient arguments $'1, '2, \ldots$
to provide a well-formed type.
=FAILURE
6034	There is a type called ?0 in the descendants of the current theory
6037	Theory ?0 is locked
6045	There is a type called ?0 already in scope
6071	Theory ?0 is a read-only ancestor
6088	The arity of a type must be ≥ 0
=ENDDOC

=DOC
val ⦏set_user_datum⦎ : (string * USER_DATUM) -> unit;
=DESCRIBE
$set\_user\_datum(key, ud)$ assigns the new value $ud$ to the user data
slot allocated to $key$ in the current theory.
If an old value was present it will be overwritten.
=FAILURE
6037	Theory ?0 is locked
6071	Theory ?0 is a read-only ancestor
=ENDDOC

=DOC
val ⦏get_user_datum⦎ :  string -> string -> USER_DATUM;
=DESCRIBE
$get\_user\_datum\,thy\,key$ returns the value stored in the user data
slot allocated to $key$ in the theory $thy$, if any.
=FAILURE
12035	Theory ?0 is not present in the current hierarchy
12009	No user data stored under key ?0 in theory ?1
=ENDDOC

\subsection{Definitional Mechanisms}
=TEX
\subsubsection{$new\_type\_defn$}
=DOC
val ⦏new_type_defn⦎ :
	(string list * string * string list * THM) -> THM;
=DESCRIBE
$new\_type\_defn$ $(keys, name, typars, defthm)$
declares a new type with name $name$, and arity the length of
$typars$.
It creates a defining theorem for the type, saves it in the current theory under the keys $keys$. It returns the defining theorem.
$defthm$ must be a valid well-formed theorem of the form:
=GFT
⊢ ∃ x : type ⦁ p x
=TEX
with no assumptions, no free variables and no type variables that are not named in $typars$.
The defining theorem will then be of the form:
=GFT
⊢ ∃ f : typars name → type ⦁
	TypeDefn (p: type → BOOL) f
=TEX
where $TypeDefn$ asserts that its predicate argument
$p$ is non-empty, and its function argument $f$ is a bijection
between the new type and the subset of $type$ delineated by $p$.
=FAILURE
6031	Key list may not be empty
6034	There is a type called ?0 in the descendants of the current theory
6037	Theory ?0 is locked
6045	There is a type called ?0 already in scope
6052	Key ?0 has already been used for an type definition theorem in theory ?1
6053	?0 must not have assumptions
6054	?0 is not of the form: `⊢ ∃ x ⦁ px`
6055	?0 is not of the form: `⊢ ∃ x ⦁ p y` where ⌜x⌝  is a variable
6056	?0 is a free variable in ?1
6062	?0 are free variables in ?1
6057	?0 contains type variables not found in type variable parameter list,
	type variables being: ?1
6071	Theory ?0 is a read-only ancestor
6079	?0 repeated in type parameter list
6080	?0 is not of the form: `⊢ ∃ x ⦁ p y` where ⌜x⌝ equals ⌜y⌝
=ENDDOC
\subsubsection{$gen\_new\_spec$}
=DOC
val ⦏gen_new_spec⦎ : (string list * THM) -> THM;
=TEX
=DESCRIBE
$gen_new\_spec$ $(key\ list, thm)$ defines one or more new constants.
The theorem $thm$ must have the following form:
=GFT
	x⋎1 = t⋎1, x⋎2 = t⋎2, ..., x⋎n = t⋎n ⊢ p
=TEX
\ where the $x_i$ are variables. The theorem must satisfy the following constraints:
\begin{itemize}
\item no two of the variables $x_i$ may have the same name;
\item no variable $x_i$ may have the same name as a constant that is in scope
in the current theory or any of its descendants;
\item the terms $t_i$ must contain no free variables;
\item any type variable occurring anywhere in one of the terms $t_i$ must also occur somewhere
in the type of the corresponding $x_i$;
\item the term $p$ must contain no free variables other than the $x_i$;
\item any type or constant that occurs in one of the $t_i$ or in $p$ must be in scope in the current theory.
\end{itemize}

If any of these constraints is not satisfied, the function will raise an exception and
will not change the current theory.
If the constraints are satisfied, the function increments the level number of the current theory,
declares new constants $c_1, \ldots c_n$, where each $c⋎i$ has the same name and type
as the corresponding $x⋎i$, and saves under the keys specified
in $key\_list$ a definition comprising the theorem:
=GFT
	⊢ p[c⋎1/x⋎1, ..., c⋎n/x⋎n]
=TEX

=FAILURE
6031	Key list may not be empty
6037	Theory ?0 is locked
6049	There is a constant called ?0 already in scope
6051	Key ?0 has already been used for a definition in theory ?1
6058	The term ?0 contains one or more type variables (?1) not occurring in the variable ?2
6059	The ?0 ?1 contains the following free variable?2: ?3
6063	There is a constant called ?0 in the descendants of the
	current theory
6064	?0 is not of the form ⌜x = t⌝ where x is a variable.
6071	Theory ?0 is a read-only ancestor
=ENDDOC
=TEX
\subsubsection{$new\_spec$}
=DOC
val ⦏new_spec⦎ : (string list * int * THM) -> THM;
=DESCRIBE
$new\_spec\;(keylist, n, thm)$ defines $n$ new constants.
The theorem $thm$ must have the form:
=GFT
	⊢ ∃ x⋎1 ... x⋎n ⦁ p
=TEX
and must satisfy the following constraints:
\begin{itemize}
\item no two of the variables $x_i$ may have the same name;
\item no variable $x_i$ may have the same name as a constant that is in scope
in the current theory or any of its descendants;
\item $p$ must contain no free variables other than the $x_i$;
\item any type variable occurring anywhere in $p$ must also occur somewhere
in the type of every $x_i$;
\end{itemize}

If any of these constraints is not satisfied, the function will raise an exception and
will not change the current theory.
If the constraints are satisfied, the function increments the level number of the current theory,
declares new constants $c_1, \ldots c_n$, where each $c⋎i$ has the same name and type
as the corresponding $x⋎i$, and saves under the keys specified
in $key\_list$ a definition comprising the theorem:
=GFT
	⊢ p[c⋎1/x⋎1, ..., c⋎n/x⋎n]
=TEX
=FAILURE
6016	Existentially bound variable ?0 is repeated in theorem ?1
6031	Key list may not be empty
6037	Theory ?0 is locked
6044	Must define at least one constant
6049	There is a constant called ?0 already in scope
6051	Key ?0 has already been used for a definition in theory ?1
6053	?0 must not have assumptions
6060	?0 is not of the form: `⊢ ∃ x1 ... xn ⦁ p[x1,...,xn]`
	where the ⌜xi⌝ are variables, and n (= ?1) is the number of
	constants to be defined
6061	the body of ?0 contains type variables not found in type
	of constants to be defined, the variables being: ?1
6063	There is a constant called ?0 in the descendants of the current theory
6071	Theory ?0 is a read-only ancestor
6081	Sets of type variables in ?0 and ?1 differ
=ENDDOC
=DOC
val ⦏new_spec1⦎ : (string list * string list * THM) -> THM;
=DESCRIBE
$new\_spec1\;(keylist, cnames, thm)$ is functionally the same as $new\_spec$, q.v.,
except that the names of the new constants are supplied in the parameter $cnames$ rather
than derived from the names of the bound variables in $thm$.
$new\_spec1$ is implemented as an interface to $gen\_new\_spec$, whereas
$new\_spec$ is implemented as a built-in definitional principle.
$new\_spec$ will be more efficient in definitions involving large numbers of new constants.
=FAILURE
12041	The list of new constant names must not be empty
12042	The new constant names must be distinct
=ENDDOC
In fact $new\_spec1$ cannot be implemented until the theory of pairs is defined.
So the implementation is in \cite{DS/FMU/IED/IMP037} and the implementation in \cite{DS/FMU/IED/IMP012}
is a stub that raises an internal error.
=FAILURE
12043	Internal error: new_spec1 is not implemented at this stage in the build
=TEX
\subsection{Theory Access Functions}

\subsubsection{Accessing Individual Theorems}
=DOC
val ⦏get_defn⦎ : string -> string -> THM;
=DESCRIBE
$get\_defn$ $theory$ $key$ returns the definition with key $key$,
found in theory $theory$.

To improve performance, this function uses a cache containing the values of
previous calls. This cache is rebuilt when {\it open\_theory} is called, by
removing entries that have gone out of scope. Opening a theory such as {\it basic\_hol}
that is low down in the theory hierarchy will reclaim the memory occupied by the
cache.
=FAILURE
12035	Theory ?0 is not present in the current hierarchy
12004	Theory ?0 does not have a definition with key ?1
12010	Theory ?0 is not in scope
=ENDDOC
=DOC
val ⦏get_axiom⦎ : string -> string -> THM;
=DESCRIBE
$get\_axiom$ $theory$ $key$ returns the axiom with key $key$,
found in theory $theory$.

To improve performance, this function uses a cache containing the values of
previous calls. This cache is rebuilt when {\it open\_theory} is called, by
removing entries that have gone out of scope. Opening a theory such as {\it basic\_hol}
that is low down in the theory hierarchy will reclaim the memory occupied by the
cache.
=FAILURE
12035	Theory ?0 is not present in the current hierarchy
12005	Theory ?0 does not have an axiom with key ?1
12010	Theory ?0 is not in scope
=ENDDOC
=DOC
val ⦏get_thm⦎ : string -> string -> THM;
=DESCRIBE
$get\_thm$ $theory$ $key$ returns the theorem with key $key$,
found in theory $theory$.

To improve performance, this function uses a cache containing the values of
previous calls. This cache is rebuilt when {\it open\_theory} is called, by
removing entries that have gone out of scope. Opening a theory such as {\it basic\_hol}
that is low down in the theory hierarchy will reclaim the memory occupied by the
cache.
=FAILURE
12035	Theory ?0 is not present in the current hierarchy
12006	Theory ?0 does not have a theorem with key ?1
12010	Theory ?0 is not in scope
=ENDDOC
=DOC
val ⦏get_const_type⦎ : string -> TYPE OPT;
=DESCRIBE
If a constant with the given name is in scope, then its type is returned, otherwise $Nil$.
=USES
This is likely to be often used just as a rapid test for a constant being in scope.
=SEEALSO
$get\_const\_info$
=ENDDOC
=DOC
val ⦏get_type_arity⦎ : string -> int OPT;
=DESCRIBE
If a type with the given name is in scope, then its arity is returned, otherwise $Nil$.
=USES
This is likely to be often used just as a rapid test for a type being in scope.
=SEEALSO
$get\_type\_info$
=ENDDOC
=DOC
	val ⦏get_const_theory⦎ : string -> string;
=DESCRIBE
$get\_const\_theory\,c$ returns the name of the theory in which the constant
$c$ is defined.
=FAILURE
12201	There is no constant called ?0 in the current context
=ENDDOC
=DOC
	val ⦏get_type_theory⦎ : string -> string;
=DESCRIBE
$get\_type\_theory\,ty$ returns the name of the theory in which the
type constructor $ty$ is defined.
=FAILURE
12202	There is no type constructor called ?0 in the current context
=ENDDOC
\subsubsection{Theory Names and Ancestry}
=DOC
val ⦏get_current_theory_name⦎ : unit -> string;
=DESCRIBE
Returns the name of the current theory.
=ENDDOC
=DOC
val ⦏get_theory_names⦎ : unit -> string list;
val ⦏theory_names⦎ : unit -> string list;
=DESCRIBE
These return the list of undeleted theories in the current hierarchy, whether
in scope or not.  $theory\_names$ is an alias for $get\_theory\_names$.
=ENDDOC
=DOC
val ⦏get_ancestors⦎ : string -> string list;
=DESCRIBE
This returns all the ancestors of the named theory, including
the theory itself.
The named theory is the last name in the list returned.
The name of the parent first added to the named theory is next to last,
preceded by its ancestors.
All these are preceded by the second parent theory and its ancestors,
apart from those already added.
These are preceded by any unnoted ancestors of the third, fourth, etc parents of the named theory.
The order in the list of the ancestors of the parent theories is determined recursively by this ordering.
=FAILURE
12035	Theory ?0 is not present in the current hierarchy
=ENDDOC
=DOC
val ⦏is_theory_ancestor⦎ : string -> string -> bool;
=DESCRIBE
$is\_theory\_ancestor$ $thy1$ $thy2$ returns true if
$thy1$ is an ancestor of $thy2$ within the current hierarchy.
=FAILURE
12035	Theory ?0 is not present in the current hierarchy
=FAILUREC
This failure arises if either theory name is not present in the current hierarchy.
=ENDDOC
=DOC
val ⦏get_parents⦎ : string -> string list;
=DESCRIBE
This returns the immediate parents of the named theory, (not including
the theory itself).
=FAILURE
12035	Theory ?0 is not present in the current hierarchy
=ENDDOC
=DOC
val ⦏get_children⦎ : string -> string list;
=DESCRIBE
This returns the immediate children of the named theory, (not including
the theory itself).
=FAILURE
12035	Theory ?0 is not present in the current hierarchy
=ENDDOC
=DOC
val ⦏get_descendants⦎ : string -> string list;
=DESCRIBE
This returns all the descendants of the named theory, including
itself.
=FAILURE
12035	Theory ?0 is not present in the current hierarchy
=ENDDOC
\subsection{Accessing Theory Contents}
=DOC
val ⦏get_defns⦎ : string -> (string list * THM) list;
val ⦏get_defn_dict⦎ : string -> THM OE_DICT;
=DESCRIBE
{\it get\_defns} returns all the defining theorems stored in the indicated
theory together with the keys under which they are stored.

{\it get\_defn\_dict} returns the mapping of keys to defining theorems represented as an
order-preserving efficient dictionary.
=FAILURE
12035	Theory ?0 is not present in the current hierarchy
=ENDDOC
=DOC
val ⦏get_axioms⦎ : string -> (string list * THM) list;
val ⦏get_axiom_dict⦎ : string -> THM OE_DICT;
=DESCRIBE
{\it get\_axioms} returns all the axioms stored in the indicated
theory together with the keys under which they are stored.

{\it get\_axiom\_dict} returns the mapping of keys to axioms represented as an
order-preserving efficient dictionary.
=FAILURE
12035	Theory ?0 is not present in the current hierarchy
=ENDDOC
=DOC
val ⦏get_thms⦎ : string -> (string list * THM) list;
val ⦏get_thm_dict⦎ : string -> THM OE_DICT;
=DESCRIBE
{\it get\_thms} returns all the theorems stored in the indicated
theory together with the keys under which they are stored.

{\it get\_thm\_dict} returns the mapping of keys to theorems represented as an
order-preserving efficient dictionary.
=FAILURE
12035	Theory ?0 is not present in the current hierarchy
=ENDDOC
=DOC
val ⦏get_consts⦎ : string -> TERM list;
=DESCRIBE
This returns (most general instances of) all the constants stored in a theory.
=FAILURE
12035	Theory ?0 is not present in the current hierarchy
=ENDDOC
=DOC
val ⦏get_const_keys⦎ : string -> E_KEY list;
=DESCRIBE
This returns the efficient dictionary keys that represent the names of the constants stored in a theory.
=FAILURE
12035	Theory ?0 is not present in the current hierarchy
=ENDDOC
=DOC
val ⦏get_types⦎ : string -> TYPE list;
=DESCRIBE
This returns (canonical applications of) all the type constructors stored on a theory.
=FAILURE
12035	Theory ?0 is not present in the current hierarchy
=ENDDOC
=DOC
val ⦏get_type_keys⦎ : string -> E_KEY list;
=DESCRIBE
This returns the efficient dictionary keys that represent the names of the type constructors stored in a theory.
=FAILURE
12035	Theory ?0 is not present in the current hierarchy
=ENDDOC
\subsubsection{Accessing Status Information}
=DOC
val ⦏get_current_theory_status⦎ : unit -> THEORY_STATUS;
=DESCRIBE
This returns the current theory's status.
=ENDDOC
=DOC
val ⦏get_theory_status⦎ : string -> THEORY_STATUS;
=DESCRIBE
This returns the status of the indicated theory.
=FAILURE
12035	Theory ?0 is not present in the current hierarchy
=ENDDOC
\subsubsection{Accessing Theory Data Structures}
=DOC
val ⦏get_theory⦎ : string -> THEORY;
val ⦏get_theory_info⦎ : string -> THEORY_INFO;
=DESCRIBE
These functions return the data structures associated with a theory in the logical kernel.
=FAILURE
12035	Theory ?0 is not present in the current hierarchy
=ENDDOC
\section{NOTIFICATION OF STATE CHANGES}

Subsystems such as the user interface need to be notified
when state changes occur (e.g. when the current theory changes).
Others may wish to prevent certain state changes,
and need to be notified before such changes are attempted.
We supply an interface which allows a function to be nominated to
be called whenever a state change occurs,
and another for functions to be called before any state change occurs.
In general, there will be
lists of such functions. The functions have a single argument which
encodes the type of operation, its arguments and where appropriate
its result type.

=DOC
datatype ⦏KERNEL_STATE_CHANGE⦎
		=	⦏OpenTheory⦎ of string * ((string list) * (string list))
		|	⦏DeleteTheory⦎ of string
		|	⦏NewTheory⦎ of string
		|	⦏NewParent⦎ of string * (string list)
		|	⦏LockTheory⦎ of string
		|	⦏UnlockTheory⦎ of string
		|	⦏DuplicateTheory⦎ of string * string
		|	⦏SaveThm⦎ of string * THM
		|	⦏ListSaveThm⦎ of string list * THM
		|	⦏DeleteConst⦎ of TERM
		|	⦏DeleteType⦎ of string
		|	⦏DeleteAxiom⦎ of string
		|	⦏DeleteThm⦎ of string
		|	⦏NewAxiom⦎ of (string list * TERM)*THM
		|	⦏NewConst⦎ of string * TYPE
		|	⦏NewType⦎ of string * int
		|	⦏GenNewSpec⦎ of (string list * THM) * THM
		|	⦏NewTypeDefn⦎ of (string list * string * (string list) * THM) * THM
		|	⦏NewSpec⦎ of (string list * int * THM) * THM
		|	⦏SetUserDatum⦎ of string * USER_DATUM;
=DESCRIBE
This is an encoding of the arguments of
the functions of signature $KernelInterface$ which change the state of the theory database.
When used to notify the system of a change that has been made
certain additional information is also included.
If used to notify the system before a change is made the slots will be given ``null'' default values (``'', $[]$, $asm\_rule$ $mk\_t$).

{\hfuzz 3pt
\begin{tabular}{|l|l|p{2.73in}|}\hline
Operation & Value & Description \\\hline
$open\_theory$ &
$(thy, (inthys, outthys))$ &
$thy$ names the theory which has been opened.
$inthys$ names the theories which have come into scope.
$outthys$ names the theories which have gone out of scope.
\\\hline
$new\_parent$ &
$(thy, inthys)$ &
$thy$ names the new parent theory.
$inthys$ names the theories which have come into scope.
\\\hline
\begin{tabular}[t]{l}
$SimpleNewDefn$\\$NewTypeDefn$\\$NewSpec$\\$NewAxiom$\\
\end{tabular} &
$(arg, thm)$ &
$arg$ gives the argument to the operation. $thm$ is the new defining
theorem.
\\\hline
\end{tabular}}

SEE ALSO
$on\_kernel\_state\_change$,
$before\_kernel\_state\_change$
=ENDDOC

=DOC
eqtype ⦏OKSC_KEY⦎;
val ⦏on_kernel_state_change⦎ : (KERNEL_STATE_CHANGE -> unit) -> OKSC_KEY
val ⦏delete_on_kernel_state_change_fun⦎:  OKSC_KEY-> unit;
=DESCRIBE
The call {\em on\_kernel\_state\_change f}
registers the function $f$ to be called whenever the theory database
is modified by a function from the signature $KernelInterface$. The argument to $f$ encodes the
operation which caused the modification together with its arguments and
certain other additional information.
A list of such functions is maintained, and the new function is put at the
end of the list, which means it may, if desired undo or overwrite the effects of a
function nominated by an earlier call of {\em on\_kernel\_state\_change}.

{\em on\_kernel\_state\_change} returns a key which may be used to remove the function
from the list of registered functions using {\em delete\_on\_kernel\_state\_change\_fun}.

Functions handled by $on\_kernel\_state\_change$ should not be
coded to raise exceptions as the handler will not catch these exceptions.
If the function is to prevent a change from happening {\em before\_kernel\_state\_change} should be used instead.
=SEEALSO
$KERNEL\_STATE\_CHANGE$,
$before\_kernel\_state\_change$
=FAILURE
12050	There is no on kernel state change function with the specified key
=ENDDOC
=DOC
eqtype ⦏BKSC_KEY⦎;
val ⦏before_kernel_state_change⦎ : (KERNEL_STATE_CHANGE -> unit) -> BKSC_KEY
val ⦏delete_before_kernel_state_change_fun⦎:  BKSC_KEY-> unit;
=DESCRIBE
The call {\em before\_kernel\_state\_change f}
registers $f$ to be called before the theory database
is to be modified by functions from the signature $KernelInterface$. The argument to $f$ encodes the
operation which caused the modification together with its arguments and
certain other additional information
(usually sets to null defaults for this function).
A list of such functions is maintained, and the new function is put at the
end of the list, which means it may, if desired undo or overwrite the effects of a
function nominated by an earlier call of  {\em before\_kernel\_state\_change}.

{\em before\_kernel\_state\_change} returns a key which may be used to remove the function
from the list of registered functions using {\em delete\_before\_kernel\_state\_change\_fun}.

Functions handled by {\em before\_kernel\_state\_change} may
raise exeptions and this will prevent the state change occurring.
=SEEALSO
$KERNEL\_STATE\_CHANGE$,
$on\_kernel\_state\_change$
=FAILURE
12051	There is no before kernel state change function with the specified key
=ENDDOC
=DOC
val ⦏pending_reset_kernel_interface⦎ : unit -> unit -> unit;
=DESCRIBE
This function, applied to $()$ takes a ``snapshot'' of the
current state of the kernel interface module (comprising the``On Kernel State Change'', ``Before Kernel State Change'' and ``On Kernel Inference'' functions).
The resulting snapshot,  when applied to $()$ will restore
these functions to their state at the time of making the snap shot.
=USES
To assist in saving the overall system state.
=ENDDOC
\subsection{Temporary Working in Other Theories}
=DOC
val ⦏do_in_theory⦎ : string -> ('a -> 'b) -> 'a -> 'b;
=DESCRIBE
=INLINEFT
do_in_theory thy f a
=TEX
{} will change to the named theory $thy$, apply $f$ to $a$, and return
to the theory in which it was called.
It will not notify the kernel state change functions
(e.g. $on\-\_kernel\-\_state\-\_change$) when it changes
to the named theory, nor
will it notify them on its return.
Thus for instance the symbol table mechanism, and so term parsing, will behave
as if no theory change had taken place before the
application of $f$ to $a$.
This refusal to notify causes this function to be faster
than the appropriate two uses of $open\_theory$.

The function prevents the application of $f$ from once more changing the current theory to another, or functions
that may delete the original theory.
The block will provoke error 12011.
These functions are:
=GFT
open_theory	new_theory	delete_theory
=TEX
It will also discard any changes made by $before\-\_kernel\-\_state\-\_change$ during the application of $f$ at its end.

The function will intercept any exceptions (including keyboard interrupts), and will attempt to remove the block
on changing the current theory, and then return to the original theory.
However, in certain circumstances (such as multiple
keyboard interrupts, or use of $pp'$ functions)
the exception handler itself may be interrupted or
be otherwise unable to complete its work.
In these cases $open\-\_theory$ must be used by hand
to notify the proof system of the correct theory and its context.
If this raises the error $12011$ then repeat the use of $open\-\_theory$,
as each raising of the error involves the removal
of one block put in place by $do\-\_in\-\_theory$ before the
message is generated.
=FAILURE
12011	Blocked from changing the current theory.
	This particular block has now been removed.
	Exceptionally, further blocks, giving the same
	error message, may still be in place. These blocks
	should be cleared now by repeatedly trying open_theory
	until this error message is not provoked
12013	An internal error has corrupted the current theory
	data. Immediately make a call of open_theory
	to clear this internal error
12203	The kernel interface tables were in an inconsistent state.
	The tables are now being rebuilt.
=ENDDOC
\subsection{Programming Support for Deleting Constants, Types and Axioms}
=DOC
val ⦏delete_to_level⦎ :
	{do_warn : bool,
	 caller : string,
	 target : string,
	 level : int} -> (string * int) list * (string * TYPE) list;
val ⦏thm_level⦎ : THM -> int;
=DESCRIBE
=INLINEFT
delete_to_level
=TEX
\ deletes constants, types and axioms (and any theorems that may depend on them) down to a specified level number.
{\em do\_warn} specifies whether or not the user should be warned before doing this.
{\em caller} is the name of the calling function for use in error messages.
{\em target} is the name of the target being deleted for use in the warning message.
{\em level} is the level of the constant, type or axiom which is the target to be deleted.
The returned value comprises the lists of types and constants that have been deleted (with their arities and types).

The level numbers for constants and types may be retrieved using the data structure returned by
=INLINEFT
get_theory
=TEX
.
=INLINEFT
thm_level
=TEX
\ returns the level number associated with a theorem or axiom.
=ENDDOC
\subsection{Kernel Interface Diagnostics}
=DOC
	val ⦏kernel_interface_diagnostics⦎ : bool -> {
		clean_flag : bool,
		const_thys : int list E_DICT list,
		type_thys: int list E_DICT list,
		int_thy_names : int E_DICT,
		in_scope : int list};
=DESCRIBE
This function can be used to examine and optionally reset internal state used by the kernel interface module.
It is intended for diagnostic purposes.
If the argument is {\em false}, it just returns a representation of the state; if {\em true}, it also sets the internal state so that the next call on any operation such as {\em get\_const\_theory} will cause the state to be recalculated.
=ENDDOC

=SML
	val ⦏pp'new_kernel_interface_tables⦎ : unit -> unit
=TEX
This function is solely for use in {\em pp\_make\_database}.
The potentially large kernel interface tables ({\em const\_thys} and {\em type\_thys}) are organised as a list of tables, one for each ancestor database.
Thus, with a persistent object store like Poly/ML's, the information in a parent does not take up any space in its children.
This function pushes a new empty table onto the list.

\section{COMPACTIFICATION}
=DOC
	val ⦏compact_type⦎ : TYPE -> TYPE;
	val ⦏compact_term⦎ : TERM -> TERM;
	val ⦏compact_thm⦎ : THM -> THM;
=DESCRIBE
These functions compactify type, term and theorem values,
currently by commoning up type information so that only one ML instance
of any type is used in the compactified value. Depending on the value
of the integer control variable $compactification\_mask$, q.v., these
interfaces are invoked automatically as values are stored in the theory
database.

The $compactify\_{\cal XXX}$ interfaces act as identify functions: $compactify\_{\cal XXX}\,x$ returns a value
which is equal to $x$ (in the sense of $=:$, $=\$$ or $=\vert-$ as
appropriate), but which usually occupies significantly less space than
$x$.
=ENDDOC
Note: the algorithm used to do the compactification is not important
from the functional point of view, but is crucial to the performance.
The implementation documents the details of the techniques used.
=DOC
	(* ⦏compactification_mask⦎ : integer control: default: compiler-dependent *)
	val ⦏get_compactification_cache⦎ : unit -> TYPE list;
	val ⦏set_compactification_cache⦎ : TYPE list -> unit;
	val ⦏clear_compactification_cache⦎ : unit -> unit;
=DESCRIBE
These functions and associated control value support compactification
of objects stored in the theory database.

$set\_compactification\_cache$ and $get\_compactification\_cache$ may
be used at the beginning and end of a \Product\ session to preserve the
contents of the cache of type information which is used to implement
compactification. Internally, the cache is held as a rather more
complex, and much larger, data structure than a simple list of types
and so $clear\_compactification\_cache$ is used automatically to empty
the cache at the end of a session, thereby avoiding saving the data
structure in the database file.  Restoring the cache from the list
returned by  $get\_compactification\_cache$ using
$set\_compactification\_cache$ is time-consuming and is not done
automatically; however, doing this using, e.g., the following lines of ML,
may improve the space-saving in applications which are built up in
several sessions:

=GFT SML Example - End of Every Session
val saved_compactification_cache = get_compactification_cache();
=TEX

=GFT SML Example - Beginning of Second and Later Sessions
set_compactification_cache saved_compactification_cache;
=TEX

ML functions which compute terms can often be coded so as to produce
terms in which common subterms are shared. The compactification algorithm
may actually increase the space occupied by such terms. Producers of such
functions may therefore wish to suppress the compactification when the computed
terms are stored in the theory database.

$compactification\_mask$ is an integer control which is treated as a
bit-mask and may used to suppress selected aspects of the
compactification algorithm. The default value of $0$ should be correct
for most normal specification and proof work. The significance of the
bits in the mask is as follows:

\begin{center}
\begin{tabular}{|l|p{4.0in}|}\hline
1 & Suppress compactification in $new\_axiom$ \\\hline
2 & Suppress compactification in $new\_const$  \\\hline
4 & Suppress compactification in $new\_type\_defn$ \\\hline
8 & Suppress compactification in $new\_spec$ \\\hline
16 & Suppress compactification in $save\_thm$ \\\hline
32 & Suppress compactification in $simple\_new\_defn$ \\\hline
\end{tabular}
\end{center}
So, for example, if the mask is set to $47$ ($=1+2+4+8+32$), then compactification
will only be performed when $save\_thm$ is called.
The default value depends on the Standard ML compiler: 63 (i.e., no compactification) for Poly/ML and 0 (i.e., full compactification) for Standard ML of New Jersey.
=ENDDOC

\section{CHECKPOINTING}
=DOC
type ⦏CHECKPOINT⦎;
val ⦏checkpoint⦎ : string -> CHECKPOINT;
val ⦏rollback⦎ : CHECKPOINT -> unit;
val ⦏rollback1⦎ : CHECKPOINT -> unit;
=DESCRIBE
This opaque type and its associated functions implement a system for checkpointing and restoring
the state of the theory hierarchy. It is intended primarily for programmatic use
in applications that may need to undo multiple extensions to the logical
contents of the theory and changes to user data. The check-pointing scheme is unable
to keep track of theories, theorems, definitions etc. that have been deleted. Applications that
may delete such objects must make their own arrangements for restoring the deleted objects.

The parameter to {\it checkpoint} is a theory name. The checkpoint returned
contains the information required by {\it rollback} or {\tt rollback1}
to roll the indicated theory and all its descendants back to the state it had when the checkpoint was taken.
The theory becomes the current theory after the rollback.
The difference between {\tt rollback} and {\tt rollback1} is explained in the discussion of error messages below.

Rolling back is done using {\it delete\_const} etc. and so rolling back the state of
definitions and axioms is restricted to changes made in theories which did not have children
when the checkpoint was taken. For uniformity, {\it rollback} does not attempt to restore
the state of the theorems and the user data in theories which had children when the checkpoint
was taken. A theory that has been introduced and has become a parent of a theory that existed
when the checkpoint was taken will not be deleted (otherwise the child theory would also
have to be deleted).

Messages 12015 to 12017 are reported by  {\it rollback} as comments.
In general,  {\it rollback} will just report on the problem and continue trying
to restore other theories.

Messages 12018 and 12019 indicate that one or more theories that were present when the checkpoint was taken
need to be deleted so that type or constant definitions in their parents can be undone or because
a theory in the checkpoint has been deleted and replaced by a new theory of the same name.
If the presence of a child theory would prevent a type or constant being deleted, {\tt rollback} reports message 12018 as a failure and does not attempt to restore anything.
In the same circumstances, {\tt rollback1} reports message 12019 as a comment and then
deletes the child theory or theories in question and restores the other theories in the checkpoint.

If{\it rollback} is unable to delete a theory, it continues to
attempt to restore the state of the definitions, etc. in the theories that are to be retained.
This is an unlikely situation, since {\it rollback} unlocks a theory if necessary before trying to delete it,
so it will only happen if the application using {\it rollback} has created a new theory
hierarchy and a theory to be deleted has obtained ancestor status.

Message 12020 is  reported by {\it rollback} as a failure while {\tt rollback1} will attempt to delete a theory
that has been deleted and replaced by a new theory of the same name.

=FAILURE
12015	it was not possible to delete theory ?0
12016	the theory ?0 has been deleted since the checkpoint was taken; this change cannot
	be rolled back
12017	a failure was reported while trying to restore theory ?0 (?1)
12018	the ?0 ?1 must be deleted in order to restore theory ?2
12019	the ?0 ?1 has been deleted in order to restore theory ?2
12020	the theory ?0 has been deleted since this checkpoint was taken and a new
	theory of the same name has been created. Rolling back to this checkpoint
	is not possible.
=ENDDOC

=TEX
\section{INFERENCE RULES}

=DOC
datatype ⦏KERNEL_INFERENCE⦎ =
		⦏KISubstRule⦎ of (THM * TERM) list * TERM * THM * THM
	|	⦏KISimpleλEqRule⦎ of TERM * THM * THM
	|	⦏KIInstTypeRule⦎ of (TYPE * TYPE) list * THM * THM
	|	⦏KI⇒Intro⦎ of TERM * THM * THM
	|	⦏KI⇒Elim⦎ of THM * THM * THM
	|	⦏KIAsmRule⦎ of TERM * THM
	|	⦏KIReflConv⦎ of TERM * THM
	|	⦏KISimpleβConv⦎ of TERM * THM
	|	⦏KISucConv⦎ of TERM * THM
	|	⦏KIStringConv⦎ of TERM * THM
	|	⦏KICharConv⦎ of TERM * THM
	|	⦏KIEqSymRule⦎ of THM * THM
	|	⦏KIListSimple∀Elim⦎ of TERM list * THM * THM
	|	⦏KIEqTransRule⦎ of THM * THM * THM
	|	⦏KIMkAppRule⦎ of THM * THM * THM
	|	⦏KI⇔MPRule⦎ of THM * THM * THM
	|	⦏KISimple∀Intro⦎ of TERM * THM * THM
	|	⦏KIInstTermRule⦎ of (TERM * TERM) list * THM * THM
	|	⦏KIPlusConv⦎ of TERM * THM;
eqtype ⦏KI_KEY⦎;
val ⦏on_kernel_inference⦎ : (KERNEL_INFERENCE -> unit) -> KI_KEY;
val ⦏delete_kernel_inference_fun⦎ : KI_KEY-> unit;
=DESCRIBE
The call {\em on\_kernel\_inference f} registers the function {\em f} to be called whenever a kernel inference rule is called successfully.
Several functions may be registered and they will be called in order of registration.

{\em on\_kernel\_inference} returns a key which may be used to remove the function
from the list of registered functions using {\em delete\_kernel\_inference\_fun}.

A value of type {\em KERNEL\_INFERENCE} is passed to represent the instance of the rule that has been called.
The tuple forming the argument to each constructor of the type gives the arguments and result of the corresponding rule.
=FAILURE
12301	There is no kernel inference function with the specified key
=ENDDOC
To implement {\em on\_kernel\_inference}, the interfaces to the kernel inference rules are provided in this signature.
The documentation for them is given in \cite{DS/FMU/IED/DTD007}.
=SML
val ⦏subst_rule⦎ : (THM * TERM) list -> TERM -> THM -> THM;
val ⦏simple_λ_eq_rule⦎ : TERM -> THM -> THM;
val ⦏inst_type_rule⦎ : (TYPE * TYPE) list -> THM -> THM;
val ⦏⇒_intro⦎ : TERM -> THM -> THM;
val ⦏⇒_elim⦎ : THM -> THM -> THM;
val ⦏asm_rule⦎ : TERM -> THM;
val ⦏refl_conv⦎ : CONV;
val ⦏simple_β_conv⦎ : CONV;
val ⦏prim_suc_conv⦎ : CONV;
val ⦏string_conv⦎ : CONV;
val ⦏char_conv⦎ : CONV;
val ⦏eq_sym_rule⦎ : THM -> THM;
val ⦏list_simple_∀_elim⦎ : TERM list -> THM -> THM;
val ⦏eq_trans_rule⦎ : THM -> THM -> THM;
val ⦏mk_app_rule⦎ : THM -> THM -> THM;
val ⦏⇔_mp_rule⦎ : THM -> THM -> THM;
val ⦏simple_∀_intro⦎ : TERM -> THM -> THM;
val ⦏inst_term_rule⦎ : (TERM * TERM) list -> THM -> THM;
val ⦏plus_conv⦎ : CONV;
=TEX
=SML
end(* of signature KernelInterface *);
=TEX
\section{TEST POLICY}
The functions in this document should be tested according to the
general criteria set out in \cite{DS/FMU/IED/PLN008}, using the
tests in \cite{DS/FMU/IED/MDT012}.

Running the module tests for this module is slightly awkward, since
the tests need to take actions, such as deleting all of the theory
hierarchy, which are not allowed in normal
operation of the system. Consequently the tests are run part-way
through the construction of the system, at a point where
the code which disallows these actions has not been activated.
If the code or tests change, the most convenient way of checking
the tests without doing a full system build is to edit the
system build makefile so that it stops just after carrying out
the tests.



\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}



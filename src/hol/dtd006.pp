=IGN
********************************************************************************
dtd006.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  dtd006.doc  ℤ $Date: 2014/04/14 11:09:42 $ $Revision: 2.29 $ $RCSfile: dtd006.doc,v $
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

\def\Title{Detailed Design for the Abstract Data Type $THM$}

\def\AbstractText{This document gives a detailed design for the abstract data type $THM$. This includes its primitive and built-in inference rules, and its theory management material.}

\def\Reference{DS/FMU/IED/DTD006}

\def\Author{K. Blackburn}


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
%% LaTeX2e port: \TPPtitle{Detailed Design for the Abstract Data Type $THM$}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Detailed Design for the Abstract Data Type $THM$}
%% LaTeX2e port: \TPPref{DS/FMU/IED/DTD006}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 2.29 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2014/04/14 11:09:42 $ %
%% LaTeX2e port: }}  %% Mandatory field
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: %\TPPstatus{Approved}
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.~Blackburn & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document gives a detailed design for the
%% LaTeX2e port: abstract data type $THM$.
%% LaTeX2e port: This includes its
%% LaTeX2e port: primitive and built-in inference rules,
%% LaTeX2e port: and its theory management material.}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	    Project Library
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

{\hfuzz 1pt
\subsection{Changes History}
\begin{description}
\item [Issue 2.1 (1991/08/16) (16th August 1991)]
Approved version of issue 1.23.
\item [Issue 2.2 (1991/09/17) (17th September 1991)]
Approved version of issue 2.1, differing only in changed
error messages: 6017, 6026, and 6042.
\item [Issue 2.3 (1991/11/11) (8th November 1991)]
Added $icl'plus\_conv$, removed $icl'div2\_conv$ and $icl'mod2\_conv$,
following change request CR007.
\item [Issue 2.4 (1991/11/12) (12th November 1991)]
Tidying up layout.
\item [Issue 2.5 (1991/12/06) (6th December 1991)]
Approved version of issue 2.4.

\item[Issue 2.6 (1992/01/20)~(\FormatDate{92/01/20})] Updated to use new fonts.
\item [Issue 2.7 (1992/03/19)]
Removed some percent keywords.
\item [Issue 2.8 (1992/04/09) (1st April 1992)]
Changes required by CR0016.
\item [Issue 2.9 (1992/04/14) (13th April 1992)]
Changed 6026.
\item [Issue 2.10 (1992/05/06) (6th May 1992)]
Added note on $icl'seal\_hierarchy$ in child databases.
\item[Issue 2.11 (1992/05/14) (14 May 1992)] Use correct quotation symbols.
\item [Issue 2.12 (1992/05/20) (20th May 1992)]
Added $icl'get\_pervasive\_theory\_name$.
\item [Issue 2.12 (1992/05/20) (21st May 1992)]
Improved message 6056.
\item [Issue 2.13 (1992/05/21) (26th May 1992)]
Removed rogue character.
\item [Issue 2.14 (1992/05/26) (14th July 1992)]
Collapsed error 6052 into 6051.
\item [Issue 2.17 (1993/01/18) (18th January 1993)]
Added greater awareness of inconsistent hierarchies.
\item [Issue 2.18 (1999/02/11) (11th February 1999)]
Update for SML'97.
\item[Issue 2.19 (2002/06/03)]
Type {\it THEORY} now uses {\it OE\_DICT} rather than {\it S\_DICT} throughout.
\item[Issue 2.20 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 2.21 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 2.22 (2002/12/11)] Removed unnecessary level of indirection from the {\it USER\_DATA} data type.
\item[Issue 2.23 (2005/12/14)] Kernel interface and symbol table reform.
\item[Issue 2.24 (2005/12/16)] Now using $pp'$ instead of $icl'$ to prefix private interface names.
\item[Issue 2.25 (2006/01/26)] Added $pp'step\_current\_level$.
\item[Issue 2.26 (2013/08/10)] Fixed typos in some error messages.
\item[Issue 2.27 (2014/04/12)] Rationalising some error messages in preparation for implementing
=INLINEFT
gen_new_spec
=TEX
.
\item[Issue 2.28 (2014/04/12)] Implemented
=INLINEFT
gen_new_spec
=TEX
, which replaces

=INLINEFT
simple_new_defn
=TEX
.
\item[Issues 2.29 (2014/04/14), 2.30 (2014/04/14)] Tidied up error handling.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
}
% \subsection{Changes Forecast}
\section{GENERAL}
\subsection{Scope}
This document contains a detailed design for the
abstract data type $THM$.
This includes its
primitive and built-in inference rules,
and its theory management material.
This is called for in section 4 of \cite{DS/FMU/IED/HLD007}.
The high-level specification for the code is
given in \cite{DS/FMU/IED/SPC003}, \cite{DS/FMU/IED/SPC004} and \cite{DS/FMU/IED/SPC005}.
The design is
implemented in \cite{DS/FMU/IED/IMP006}.
\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains a detailed design for the
abstract data type $THM$.
This includes its
primitive and built-in inference rules,
and its theory management material.
None of the material, other than certain types, is for other than ICL use, and thus most description boxes merely state this.
This is indicated by using the $pp'$ prefix in the names.

The functions provided in this document allow the implementation
of a theory tools interface document \cite{DS/FMU/IED/DTD012},
and a derived inference rule document \cite{DS/FMU/IED/DTD007}.
Those two documents contain only non-critical code,
and should be the only direct use made of the material given a design
in this document.
This is because a design goal for this document has been to minimise the functions provided within the
abstract data type for theorems (which is critical code), while still providing enough
to allow the implementation of a fast set of interfaces
(non-critical code).
To this end we only note the signatures of the functions, and that the functions should not be used by other than ICL,
in documentation boxes, with signatures grouped by subsection.

We wish to reserve the potential for various forms of notification to occur by side effect whenever a theory is modified.
These notification mechanisms are to be provided outside of the
abstract data type $THM$.
Thus we prefix the names all functions that modify the theory database with $pp'$,
for all that in some cases initial implementations may set the user interface
functions just to equal the ones provided in this document.
We also give an $pp'$ prefix to any function we gather
profile information about, as the profiling is better done outside the Abstract Data Type.

A ``primitive'' inference rule is considered to be part of the logic,
whereas a built-in rule is one that, though it could be coded in terms
of the primitive rules, will actually be part of the abstract data type $THM$, and thus taken as holding true without being checked by using the primitive rules.

All functions require all their arguments before they can be evaluated,
unless otherwise noted.
This is in contrast to functions which may be ``partially evaluated'' with less than their full compliment of arguments.
For instance $pp'subst\_rule$ will check the well-formedness of its
list argument, and break apart the equational theorems within the list, even if not applied to the further two arguments
it requires to derive a theorem.
Thus it is said that we may partially evaluate $pp'subst\_rule$ with one argument.

\subsubsection{Dependencies}
Loading this document is dependent on \cite{DS/FMU/IED/IMP003}.

This document is placing requirements on the properties of the
constants it invokes.
The following constants have their definition specified in \cite{DS/FMU/IED/SPC003}:
$∀$, $∃$, $TypeDefn$ (as $Type\_Definition$).
$=$ and $⇒$ are given their properties by the primitive inference rules, rather than by definition.
$⇔$ is later declared (in \cite{DS/FMU/IED/IMP023})
as an alias for boolean equality, and thus all functions that handle equality will
properly handle terms and theorems containing $⇔$.
Thus $⇔$ is only used in this document when specific reference is intended to boolean equality.

The remaining constants: $Suc$, $Zero$, $Mod$, $Div$, $Cons$,
$Nil$, and $AbsChar$, are given their properties in
the declarations of theories $ℕ$, $list$ and $char$.

\subsubsection{Deficiencies}
None known.
\subsubsection{Possible Enhancements}
None known.
\subsubsection{Terminology}
The following supplements the terminology used in those documents
upon which this one depends.
\begin{tabular}{l l}
key & a string index into a dictionary \\
equational theorem & a theorem whose conclusion is an equation \\
implicative theorem & a theorem whose conclusion is an implication \\
bi-implicative theorem & a theorem whose conclusion is an bi-implication (formed by $⇔$) \\
universally quantified theorem & a theorem whose conclusion is a $∀$-term \\
\end{tabular}
\section{CORRESPONDENCE TO THE SPECIFICATIONS}
As noted in the scope of this document, the material within it is specified within \cite{DS/FMU/IED/SPC003}, \cite{DS/FMU/IED/SPC004} and \cite{DS/FMU/IED/SPC005}.
We must ensure two things with regard to these specifications:
\begin{itemize}
\item
That all the relevant functionality in the specifications is reflected in this document.
A function is relevant if the specification intends the
function to be available to ``a user''.
For instance, the function $mk\_thm$ is used in the specification, but is clearly not intended for the user.
We can ignore auxiliary functions in the specification whose only purpose is to
simplify the declaration of further functions.
\item
That no additional facilities are made available by this document that could be derived from the relevant specified functions.
\end{itemize}
As a step towards this we provide the following tables detailing
 the relationship between specified and design functions.
The items are presented in the same order as within \cite{DS/FMU/IED/SPC005}, and then in turn the relevant parts from
\cite{DS/FMU/IED/SPC004} and \cite{DS/FMU/IED/SPC003}.
Then we give the material that is declared in this design with no corresponding item in the specifications.

\begin{tabular}{p{2.1in} | p{4.1in}} \hline
Specification & Design \\ \hline
Dictionary material & auxiliary \\
Store material & auxiliary \\
$*UD$ & $USER\_DATA$, a dictionary of datatype $USER\-\_DATUM$ \\
$*IP$ & This corresponds to a user executing the functions provided. \\
$THEORY\_CONTENTS$ & $THEORY$, a labelled record type \\
$TSNormal$, $TSLocked$, & $THEORY\-\_STATUS$ and its constructors \\
$TSAncestor$, $TSDeleted$ &  \\
$THEORY\_INFO$ & $THEORY\_INFO$, a labelled record type \\
$HIERARCHY$ & $pp'HIERARCHY$, an abstract data type \\
$PDS\_THM$ & $THM$, an abstract data type \\
$pt\_theory$ & extract contents (not address) of theory of the theorem via $pp'dest\-\_thm$ \\
$pt\_level$ & extract level of theorem via $pp'dest\-\_thm$ \\
$pt\_sequent$ & $dest\_thm$ \\
$PDS\_STATE$ & components are directly accessed with no intervening type \\
$current\_theory$ & $pp'get\-\_current\-\_theory\-\_name$ used with $pp'get\-\_theory$ \\
$current\_hierarchy$ & $pp'new\_hierarchy$ and $pp'get\-\_hierarchy$\\
$theory\_store$ & $pp'get\_theory$ \\
$hierarchy\_store$ & hierarchies assigned to Standard ML
variables \\
$theorem\_store$ & theorems assigned to Standard ML
variables \\
$initial\_theory$ & theory ``min'' before any theory functions have been used \\
$initial\_state$ & implementation initialisation of components of current state \\
$theory\_contents$ & $pp'get\_theory$ \\
$theory\_names$ & extract via $pp'get\_hierarchy$ \\
$theory\_ancestors$ & extract via $pp'get\_hierarchy$ \\
$interpret\_?$ & only formal constructs of the specification
\\
$dest\_state$ & auxiliary \\
$dest\_theory\_contents$ & type $THEORY$ is a labelled record type, and therefore its contents already may be accessed by Standard ML pattern-matching \\
$current\_theory\_contents$ & use $pp'get\-\_current\-\_theory\-\_name$ in combination with $pp'get\-\_theory$ \\
$current\_theory\_name$ & $pp'get\_current\_theory\_name$ \\
$current\_abstract\_theory$ & only a formal construct of the specification \\
$theory\_info$ & $pp'get\_theory\_info$ \\
$current\_theory\_status$ & $get\_current\_theory\_status$ \\
$check\_thm$ & $valid\_thm$ \\
$check\_thm\_address$ & auxiliary \\
\end{tabular}

\begin{tabular}{p{2.1in} | p{4.1in}} \hline
Specification & Design \\ \hline
$fetch\_thms$ & use appropriate Standard ML variable names:
no full list exists \\
$hierarchy\_ancestor$ & auxiliary - used in $pp'load\-\_hierarchy$ \\
$mk\_thm$ & auxiliary - effect is not directly available! \\
$freeze\_hierarchy$ & $pp'freeze\_hierarchy$ \\
$new\_hierarchy$ & $pp'new\_hierarchy$ \\
$load\_hierarchy$ & $pp'load\_hierarchy$ \\
$open\_theory$ & $pp'open\_theory$ \\
$empty\_theory$ & auxiliary \\
$arbitrary\_ud$ & an empty dictionary of $USER\-\_DATUM$ \\
$delete\_theory$ & $pp'delete\_theory$ \\
$new\_theory$ & $pp'new\_theory$ \\
$new\_parent$ & $pp'new\_parent$ \\
$duplicate\_theory$ & $pp'duplicate\_theory$ \\
$lock\_theory$ & $pp'lock\_theory$ \\
$unlock\_theory$ & $pp'unlock\_theory$ \\
$save\_thm$ & $pp'list\_save\_thm$ - it is more convenient to make the list version primitive \\
$is\_latest\_level$ & auxiliary \\
$delete\_extension$ & $pp'delete\_extension$ \\
$delete\_thm$ & $pp'delete\_thm$ \\
$pds\_new\_axiom$ & $pp'new\_axiom$ \\
$SUBSYS\_INPUT$ & auxiliary \\
$PDS\_INPUT$ & auxiliary \\
$DEFINER$ & auxiliary \\
$make\_definition$ & three instantiations:
$pp'new\-\_defn$, $pp'new\-\_type\-\_defn$, $pp'new\-\_spec$ \\
$pds\_new\_type$ & $pp'new\_type$ \\
$pds\_new\_constant$ & $pp'new\_const$ \\
$make\_inference$ & instantiations to those primitive inference rules
of \cite{DS/FMU/IED/SPC004} and further built-in rules \\
System Construction & this material corresponds to compiling the HOL \hfill\penalty -10 implementation \\
$SUBST$ & $pp'subst\_rule$ \\
$ABS$ & $pp'λ\_eq\_rule$ \\
$INST\_TYPE$ & $pp'inst\_type\_rule$ \\
$DISCH$ & $pp'⇒\_intro$ \\
$MP$ & $pp'⇒\_elim$ \\
$ASSUME$ & $pp'asm\_rule$ \\
$REFL$ & $pp'refl\_conv$ \\
$BETA\_CONV$ & $pp'simple\_\beta\_conv$ \\
All other material in \cite{DS/FMU/IED/SPC003} and \cite{DS/FMU/IED/SPC004} & auxiliary to other parts of specification,
formal constructs, or not within the scope of this document \\
\end{tabular}

The following lists items that are found in the design,
but have no corresponding specification.
A summary of the reason for their inclusion is given in each case:
``built-in'' items are given justifications in their
individual sections in this document.
A set of built-in inference rules are called for by \cite{DS/FMU/IED/HLD007}: the ones below were chosen by being demonstrated helpful by experiment.

\begin{tabular}{p{2.1in} | p{4.1in}} \hline
Item & Reason \\ \hline
$SEQ$ & a type abbreviation, introduced in \cite{DS/FMU/IED/SPC001}, but this design uses a list of assumptions, instead of that document's function \\
$CONV$ & just a type abbreviation \\
$pp'suc\_conv$ & a built-in definitional schemata \\
$pp'string\_conv$ & a built-in definitional schemata \\
$pp'char\_conv$ & a built-in definitional schemata \\
$pp'eq\_sym\_rule$ & a built-in inference rule \\
$pp'list\_simple\_∀\_elim$ & a built-in inference rule \\
$pp'eq\_trans\_rule$ & a built-in inference rule \\
$pp'mk\_app\_rule$ & a built-in inference rule \\
$pp'⇔\_mp\_rule$&  a built-in inference rule \\
$pp'simple\_∀\_intro$ & a built-in inference rule \\
$pp'inst\_term\_rule$ & a built-in inference rule \\
$pp'plus\_conv$ & a built-in inference rule \\
$pp'seal\_hierarchy$ & a mechanism for ensuring that certain declarations will always be in scope, as discussed in section 2.2 of \cite{DS/FMU/IED/SPC005} \\
$pp'get\_pervasive\-\_theory\_name$ & returns the name of the pervasive theory, set by $pp'seal\-\_hierarchy$ \\
$pp'get\_theory\_name$ & a fast method of doing what is
already possible with $pp'get\-\_hierarchy$ \\
$get\_const\_type$ & a fast route of getting something
that could be extracted by $pp'get\-\_hierarchy$ \\
$get\_type\_arity$ & a fast route of getting something
that could be extracted by $pp'get\-\_hierarchy$ \\
$thm\_fail$ & a fast route of getting something that could be extracted by $dest\-\_thm$ \\
$string\_of\_thm$ & a fast route of getting something
that could be extracted by $dest\_thm$ \\
\end{tabular}

That we implement the types of theorem, theory, etc., internally as a single
abstract datatype is our strongest reason for presuming that
we have added no additional functionality - the only functions
that can manipulate the protected values must work ``through''
the functions and values provided by the abstract datatype,
and each is justified by reference to the specification.
Some of the types, e.g. $THEORY$, are presented to the user as labelled record types or other types whose contents may be extracted by pattern-matching - this does not
reflect the internal forms which are abstract data types.
One particular kind of value that we have to be careful with is
the addresses of assignable variables. The implementation
uses such assignable variables in a number of places and we must
ensure that none become available to the user if assignment
to the addresses could cause inconsistency.
The only addresses used within that are visible outside of the abstract data type are to user data stores, which are judged to be
non-critical values.

\section{INFIX DIRECTIVES}
=SML
infix 3 =|-;
infix 3 =#;
infix 3 ~=|-;
infix 3 ~=#;
=TEX

\section{TYPES OF THE KERNEL}
=DOC
signature ⦏KernelTypes⦎ = sig
=DESCRIBE
This is the signature for the types of the kernel.
It has no associated structure: it is included into
the signatures $pp'Kernel$ and $KernelInterface$.
=ENDDOC
\subsection{The Type of Theorems}
=DOC
type ⦏THM⦎;
=DESCRIBE
This is the abstract data type of theorems in \Product{}, whose primitive constructors are the inference rules and extensional mechanisms
of the abstract data type.
=INLINEFT
 =|-
=TEX
provides a strict equality test on the conclusion and assumptions of theorems,
=INLINEFT
~=|-
=TEX
provides an equality test on the conclusion and assumptions of theorems up to $α$-convertibility and order of assumptions.
=ENDDOC
=DOC
type ⦏SEQ⦎;
=DESCRIBE
This is the type of sequents, consisting of a list of assumptions and a conclusion.
=GFT Definition
type SEQ = (TERM list) * TERM;
=TEX
=INLINEFT
 =#
=TEX
provides a strict equality test on sequents,
=INLINEFT
~=#
=TEX
provides an equality test on the sequents up to $α$-convertibility and order of assumptions.
=ENDDOC
=DOC
type ⦏CONV⦎;
=DESCRIBE
This is the type name conventionally used for conversions, that is, inference rules
whose last argument is a term, and whose result is an equation
whose LHS is precisely that term (no $\alpha$-conversion).
Though it would be type correct, we conventionally do not use this type name for other functions of type $\ldots\ ->\ TERM\ ->\ THM$.
=GFT Definition
type CONV = TERM -> THM;
=TEX
=ENDDOC
=TEX
\subsection{Types for User Data}
=DOC
datatype ⦏USER_DATUM⦎ =
	⦏UD_Term⦎ of TERM * (USER_DATUM list)
|	⦏UD_Type⦎ of TYPE * (USER_DATUM list)
|	⦏UD_String⦎ of string * (USER_DATUM list)
|	⦏UD_Int⦎ of int * (USER_DATUM list);
=DESCRIBE
This provides a monomorphic type of trees whose nodes are labelled by terms, types,
strings or integers.
=USES
This type is used in the type $USER\_DATA$, and may be used elsewhere, as a means of storing data that may be represented in a ``reasonably general'' structure for \Product{} related purposes, which also is
not polymorphic.
=ENDDOC
In some implementations we will wish to save objects of this type in files,
and thus we could not have objects of a monomorphic function type as a new kind of label (though encodings of them are possible).
=DOC
type ⦏USER_DATA⦎;
=DESCRIBE
This is the type of a store for objects of type $USER\_DATUM$.
It is implemented as:
=GFT ML
type USER_DATA = USER_DATUM S_DICT;
=TEX
=USES
Within the type $THEORY$ it is used to include such details as the fixity of types and
constants.
=ENDDOC
By making this a dictionary of references the structure, as well as the garbage created by modifying the structure, is lessened.
On the other hand, it does allow
the implementer to cause modifications
without checking whether the theory is locked, deleted, etc
(though they are strongly recommended not to, but to use the interfaces of \cite{DS/FMU/IED/DTD012}).
\subsection{The Type of Theories}
=DOC
type ⦏THEORY⦎;
=DESCRIBE
A theory is a named collection of type names, constant names, axioms, definitions and theorems.
In the abstract data type of theorems, the ``names'' of theories are represented as integers.
For each type name the arity of the type is recorded and for each constant name
its type is recorded. In order to allow deletion of types, constants, axioms and definitions.
So-called level numbers are used to enables theorems that may depend on deleted
material to be identified and rejected.
In order for non-critical information such as operator fixity to be stored, a theory
also includes a user-data slot which may be used to encode such information.

A theory is represented as a labelled record type, as follows:

{\raggedright
\begin{tabular}{|l|l|p{2.65in}|} \hline
Label & Type & Description \\ \hline
$name$ & $int$ & Internal representation of theory name. \\
$ty\_env$ & $\{arity:int,$ $level:int\}$ $OE\_DICT$ &
A dictionary indexed by type constructor names, returning arity, and definition level. \\
$con\_env$ & $\{ty:TYPE,$ $level:int\}$ $OE\_DICT$ & A dictionary indexed by constant name, returning the type and definition level. \\
$parents$ & $int$ $list$ & Internal representations of names of parents of theory. \\
$del\_levels$ & $(int * int)$ $list$ &
A list of ranges of deleted definition levels --- if empty then
no levels have been deleted. \\
$axiom\_$ $dict$& $THM$ $OE\_DICT$ &
A dictionary of axioms. \\
$defn\_dict$ & $THM$ $OE\_DICT$ &
A dictionary of definitions. \\
$thm\_dict$ & $THM$ $OE\_DICT$ &
A dictionary of theorems. \\
$current\_$ $level$ & $int$ & The current definition level. \\
$user\_data$ & $USER\_DATA$ $ref$ & The user data stored
in the theory. \\ \hline
\end{tabular}

} % end of \raggedright

=ENDDOC
Users will start their HOL sessions within a current theory,
which perhaps possesses some parent theories.
They may then add to the theory by operations upon its contents,
or change the current theory by an operation upon theory attributes.
The user is recommended to use the access functions provided,
rather than manipulate this ``raw'' theory type.

The user will see each theory as named by a string.
Internally however this name is represented and manipulated
as an integer (that is an index to the internal representation of
a theory hierarchy).
This internal representation of names is visible from various functions.

Similarly, a theory will contain a current definition level,
which is incremented by 1 at each definition, axiom, etc., saved in the
theory.
Various things, in particular theorems, are created and saved with a field
set to their current definition level.
This definition level mechanism is used to allow sound deletion of
definitions and theorems.
These declaration levels will also be integers.
\subsection{The Type of Hierarchies}
=DOC
datatype ⦏THEORY_STATUS⦎ =
	⦏TSNormal⦎ | ⦏TSLocked⦎ | ⦏TSAncestor⦎ | ⦏TSDeleted⦎;
=DESCRIBE
Objects of this datatype indicate the status of a theory within a hierarchy, being:

\begin{tabular}{| l | p{5.0in} |} \hline
Constructor & Description \\ \hline
TSNormal & Theory is present and may be written to. \\
TSLocked & Theory is present, and cannot be written to as it is locked. \\
TSAncestor & Theory is present, and cannot be written to as it is in an ancestor for some hierarchy. \\
TSDeleted & Theory has been deleted: the theory name may be reused for a new theory. \\ \hline
\end{tabular}

=ENDDOC
It is possible that the list of statuses will be added to in
later releases, and thus this type should be used with caution.
=DOC
type ⦏THEORY_INFO⦎;
=DESCRIBE
This is a labelled record type containing certain information associated with a theory.

\begin{tabular}{|l|p{1.6in}|p{3.6in}|} \hline
Label & Type & Description \\ \hline
status & $THEORY\_STATUS$ & Current status of the theory. \\
inscope & $bool$ & True if the theory is currently in scope (i.e. can
its theorems, types and constants be usefully referred to). \\
contents & $THEORY$ & The theory contents. \\
children & $int$ $list$ & List of the immediate children of the theory. \\
name & $string$ & The name of the theory, as a string. \\ \hline
\end{tabular}

=ENDDOC
This is not the type used internally, but is modified
to allow no access to addresses of dangerous assignable variables.
However, the user is recommended to use the access functions provided,
rather than manipulate this ``raw'' $THEORY\_INFO$.
\subsection{End of Kernel Types}
=SML
end; (* KernelTypes *)
=TEX
\section{THE ABSTRACT DATA TYPE $THM$}
=DOC
signature ⦏pp'Kernel⦎ = sig
=DESCRIBE
This provides the abstract data type $THM$.
It includes the
primitive and built-in inference rules,
and theory management material.
=FAILURE
6083	STATE WAS FOUND TO BE INCONSISTENT: state is now read-only, and
	you are advised to quit ProofPower. Do not commit the ML database.
=FAILUREC
Error 6083 occurs when an interrupt has rendered the state of \Product{} inconsistent.
This is an implementation issue, and is fully discussed
in the implementation document for the structure
associated with this signature.
=FAILURE
6036	?0 is from deleted theory ?1 (internally theory ?2)
6065	?0 not valid as it may depend on a deleted axiom or definition of theory ?1
6066	?0 was created in the context of theory ?1 which is not in scope
6072	The theory of ?0, ?1, is not in current hierarchy
=FAILUREC
The above errors are common to most of the inference rules of this document,
and some other functions within the signature.
All are raised by $error$ not $fail$.
Thus they will be raised with exceptions that name functions in this document, as conventionally exceptions raised by $error$ are not caught or processed by the ICL implementation.
=ENDDOC
The following are various kinds of well-formedness check failures - their exceptions are caught and handled by
interface functions, and so should never be seen by the user as raised by functions from this document.
A well-formedness check occurs on any types, terms and theorems saved in a theory.
=FAILURE
6013	?0 is ill-formed in current theory: type name ?1 is not declared
6014	?0 is ill-formed in current theory: type name ?1 does not have arity used
6015	?0 is ill-formed in current theory: constant name ?1 not declared
6038	?0 is ill-formed in current theory: constant name ?1 cannot have type used
=FAILUREC
The following are conceivable design errors, which
are common to many of the functions.
They arise where the implementation gives rise to tests
some of whose results are considered ``impossible'' - such
branches give design errors (which may in fact be, for instance, implementation errors).
As they should never be seen they are not part of the user documentation.
=FAILURE
6008	DESIGN ERROR : Current theory ?0 has status TSDeleted
6032	DESIGN ERROR
6041	DESIGN ERROR : Current hierarchy corrupted
6070	DESIGN ERROR : Infinite Array Package failed
6073	DESIGN ERROR : corrupted constant scope
6074	DESIGN ERROR : corrupted type scope
=TEX
Include the types of the kernel:
=SML
include KernelTypes;
=TEX
=DOC
type ⦏pp'HIERARCHY⦎;
=DESCRIBE
$pp'HIERARCHY$ is an abstract data type, which provides
communication between the functions $pp'new\_hierarchy$ and $pp'load\_hierarchy$ (q.v.).
Objects of this type should not become visible to the user.
=ENDDOC
A theory hierarchy is a collection of theories, together with
information about those theories.
In particular, it records whether theories are in scope, and whether
they may be modified.

Users will start their HOL sessions within a current theory hierarchy,
which perhaps possesses some parent hierarchies.

\subsection{Primitive Rules of Inference}
All the inference rules will check that the theorems they
are given are valid (i.e. do not belong to theories that are out
of scope, nor were they potentially derived from now deleted
definitions or axioms).
They will not check that their term arguments are well-formed, however,
as even if they are malformed, this cannot introduce logical inconsistencies.
Theorems saved in, or otherwise associated with changes in, a theory are checked for well-formedness however.

All of these inference rules will have corresponding
entries in the derived rules of inference, with names
formed by dropping the $pp'$.
These are the sole interface to the kernel's inference rules.
\subsubsection{pp'subst\_rule}
=GFT Signature
val ⦏pp'subst_rule⦎ : (THM * TERM) list -> TERM -> THM -> THM;
=TEX
=DESCRIBE
Substitution of equational theorems according to a template.
=FRULE 1 Rule
pp'subst_rule
├
[Γ1 ⊢ t1=t1', ... , Γn ⊢ tn=tn']
Γ ⊢ t[t1,...tn]
├
Γ1 ∪ ... Γn ∪ Γ ⊢ t[t1',...tn']
=TEX
$pp'subst\_rule$ $[(thm_1, x_1),\ldots,(thm_n, x_n)]$ $template$ $thm$
returns a theorem in which $template$ determines where in $thm$ the $thm_i$ are substituted.
The $x_i$ must be variables.
The template is of the form $t[x_1,\ldots,x_n]$, and wherever the $x_i$ occur free in $template$ their associated equational theorem, $thm_i$,
is substituted into $thm$.
The rule will rename as necessary to avoid variable capture,
in the same manner as $var\_subst$ (q.v.).
The assumption list of the resulting theorem is the union of all
substitution theorems, regardless of use.

The conclusion of the resulting theorem will take its bound variable names
from $template$, not $thm$, as shown in the following example.
This provides an $\alpha$-conversion facility.

The function may be usefully partially evaluated with one or two arguments.
=EXAMPLE
pp'subst_rule [(`⊢ p = q`, ⌜x1⌝), (`⊢ r = s`, ⌜x2⌝)]
	(⌜∀ y ⦁ f x1 r y + g x2 p = h y⌝)
	(`⊢ ∀ x ⦁ f p r x + g r p = h x`)
	=
	`⊢ ∀ y ⦁ f q r y + g s p = h y`
=SEEALSO
$subst\_conv$
=FAILURE
3007	?0 is not a term variable
6001	?0 does not substitute to conclusion of theorem ?1
6002	Substitution theorem ?0 is not of the form: `Γ ⊢ t1 = t2`
6029	Substitution list contains entry (?0,?1) where the type of the variable
	differs from the type of the LHS of the theorem
=TEX
($SUBST$ in Cambridge HOL)

The $(\ldots * TERM)$ argument in the specification is a $string$ $*$ $TYPE$, representing destroyed variables.
A list is used to represent the specification's (partial) function,
on the assumption that its domain is finite.
\subsubsection{pp'simple\_λ\_eq\_rule}
=GFT Signature
val ⦏pp'simple_λ_eq_rule⦎ : TERM -> THM -> THM;
=TEX
=DESCRIBE
Given an equational theorem, return the equation formed by abstracting the term argument (which must be a variable) from both sides.
=FRULE 1 Rule
pp'simple_λ_eq_rule
⌜x⌝
├
Γ ⊢ t1[x] = t2[x]
├
Γ ⊢ (λ x ⦁ t1[x]) = (λ x ⦁ t2[x])
=TEX
=SEEALSO
$abs\_conv$, $abs\_rule$
=FAILURE
3007	?0 is not a term variable
6005	?0 occurs free in assumption list
6020	?0 is not of the form: `Γ ⊢ t1 = t2`
=TEX
($ABS$ in Cambridge HOL)

The $TERM$ argument in the specification is a $string$ $*$ $TYPE$, representing destroyed variables.
\subsubsection{pp'inst\_type\_rule}
=GFT Signature
val ⦏pp'inst_type_rule⦎ : (TYPE * TYPE) list -> THM -> THM;
=TEX
=DESCRIBE
Parallel instantiation of some of the type variables of the conclusion of a theorem.
=FRULE 1 Rule
pp'inst_type_rule
[(σ1, tyv1), ..., (σn,tyvn)]
├
Γ ⊢ t[tyv1,...tyvn]
├
Γ ⊢ t[σ1,...σn]
=TEX
$pp'inst\_type\_rule$ $talist$ $thm$ will instantiate each type variable in
$talist$ with its associated type.
It will decorate free variables that would become identified with
other variables (both in conclusion and assumptions)
by their types becoming the same and the names originally being the same.
To instantiate types in the assumption list, see $asm\_inst\_type\_rule$.
=FAILURE
3019	?0 is not a type variable
6006	Trying to instantiate type variable ?0, which occurs in assumption list
=TEX
($INST\_TYPE$ in Cambridge HOL)

The $(\ldots * TYPE)$ argument in the specification is a $string$, representing the name of a type variable.
A list is used to represent the specification's (partial) function,
on the assumption that its domain is finite.
\subsubsection{pp'⇒\_intro}
=GFT Signature
val ⦏pp'⇒_intro⦎ : TERM -> THM -> THM;
=TEX
=DESCRIBE
Prove an implicative theorem, removing, if $\alpha$-convertibly present, the antecedent of the implication from the assumption list.
=FRULE 1 Rule
pp'⇒_intro
⌜t1⌝
├
Γ ⊢ t2
├
Γ - {t1} ⊢ t1 ⇒ t2
=TEX
=FAILURE
3031	?0 is not of type ⓣBOOL⌝
=TEX
($DISCH$ in Cambridge HOL)
\subsubsection{pp'⇒\_elim}
=GFT Signature
val ⦏pp'⇒_elim⦎ : THM -> THM -> THM;
=TEX
=DESCRIBE
Modus Ponens
=FRULE 1 Rule
pp'⇒_elim
├
Γ1 ⊢ t1 ⇒ t2; Γ2 ⊢ t1'
├
Γ1 ∪ Γ2 ⊢ t2
=TEX
where $t1$ and $t1'$ must be $\alpha$-convertible.
=SEEALSO
$⇔\_mp\_rule$(reminiscent of Modus Ponens on $⇔$)
=FAILURE
6010	?0 is not of the form: `Γ ⊢ t1 ⇒ t2`
6011	?0 and ?1 are not of the forms: `Γ1 ⊢ t1 ⇒ t2` and `Γ2 ⊢ t1'` where
	⌜t1⌝ and ⌜t1'⌝ are α-convertible
=TEX
($MP$ in Cambridge HOL)

\subsubsection{pp'asm\_rule}
=GFT Signature
val ⦏pp'asm_rule⦎ : TERM -> THM;
=TEX
=DESCRIBE
``A term is true on the assumption that it is true''.
=FRULE 1 Rule
pp'asm_rule
⌜t⌝
├
├
t ⊢ t
=TEX
=FAILURE
3031	?0 is not of type ⓣBOOL⌝
=TEX
($ASSUME$ in Cambridge HOL)
\subsubsection{pp'refl\_conv}
=GFT Signature
val ⦏pp'refl_conv⦎ : CONV;
=TEX
=DESCRIBE
The reflexivity of equality implemented as a conversion.
=FRULE 1 Rule
pp'refl_conv
⌜t⌝
├
├
⊢ t = t
=TEX
($ALL\_CONV$ and $REFL$ in Cambridge HOL)
\subsubsection{pp'simple\_$\beta$\_conv}
=GFT Signature
val ⦏pp'simple_β_conv⦎ : CONV;
=TEX
=DESCRIBE
Apply a $\beta$-reduction to a simple abstraction.
=FRULE 1 Conversion
pp'simple_β_conv
⌜(λ x ⦁ t1[x]) t2⌝
├
├
⊢ (λ x ⦁ t1[x]) t2 = t1[t2]
=TEX
=SEEALSO
$\beta\_conv$
=FAILURE
6012	?0 is not of the form: ⌜(λ x ⦁ t1[x])t2⌝ where ⌜x⌝ is a variable
=TEX
($BETA\_CONV$ in Cambridge HOL)
\subsubsection{Summary}
=DOC
val pp'subst_rule : (THM * TERM) list -> TERM -> THM -> THM;
val pp'simple_λ_eq_rule : TERM -> THM -> THM;
val pp'inst_type_rule : (TYPE * TYPE) list -> THM -> THM;
val pp'⇒_intro : TERM -> THM -> THM;
val pp'⇒_elim : THM -> THM -> THM;
val pp'asm_rule : TERM -> THM;
val pp'refl_conv : CONV;
val pp'simple_β_conv : CONV;
=DESCRIBE
These primitive inference rules are for ICL use only.
They are used to implement the inference rules named by dropping
the $pp'$ prefix from the above names.
=ENDDOC
\subsection{Definition Schemata}
\subsubsection{pp'suc\_conv}
=GFT Signature
val ⦏pp'suc_conv⦎ : CONV;
=TEX
=DESCRIBE
This function defines the constants with names consisting only of decimal digits, and type $ℕ$.
=FRULE 1 Rule
pp'suc_conv
(mk_ℕ (m+1))
├
├
⊢ ⓜ(mk_ℕ(m+1))⌝ =
	Suc ⓜmk_ℕ m⌝
=TEX
=FRULE 1 Rule
pp'suc_conv
(mk_ℕ 0)
├
├
⊢ 0 = Zero
=TEX
=FAILURE
3026	?0 is not a numeric literal
=SEEALSO
$suc\_conv$, $mk\_num$
=TEX
($num\_CONV$ in Cambridge HOL)

$suc\_conv$ will not have the clause for $0$.
\subsubsection{pp'string\_conv}
=GFT Signature
val ⦏pp'string_conv⦎ : CONV;
=TEX
=DESCRIBE
This function defines the string literal constants.
A string literal constant is indicated by the constant name starting with a double quote($"$), and being of type $CHAR\ LIST$.
Later a type abbreviation, $STRING$ will be introduced
for $CHAR\ LIST$, but it is not available in the documents
upon which this one depends.
This is equivalent to a list of character literal constants,
one for each but the first ($"$) character of the string constant's name.
This conversion defines this relationship, by returning the head and unexploded tail of the list of characters.
A character literal constant is indicated by the constant's name starting with single backquote ($`$), having a single other character, and being of type $CHAR$.
=FRULE 1 Rule
pp'string_conv
(mk_string ("c..."))
├
├
⊢ ⓜ(mk_string("c..."))⌝ =
Cons ⓜ(mk_char("c"))⌝
	ⓜ(mk_string("..."))⌝
=TEX
Or:
=FRULE 1 Rule
pp'string_conv
(mk_string "")
├
├
⊢ ⓜ(mk_string(""))⌝ = Nil
=TEX
=SEEALSO
$mk\_string$
=FAILURE
3025	?0 is not a string literal
=TEX
\subsubsection{pp'char\_conv}
=GFT Signature
val ⦏pp'char_conv⦎ : CONV;
=TEX
=DESCRIBE
This function defines the character literal constants, by giving a relationship between character literal constants and their ASCII code (derived by the Standard ML function $ord$).
A character literal is indicated by the constant's name starting with single backquote ($`$), having a single other character, and being of type $CHAR$.
=FRULE 1 Rule
pp'char_conv
(mk_char("c"))
├
├
⊢ ⓜ(mk_char("c"))⌝ =
	AbsChar ⓜord "c"⌝
=TEX
=SEEALSO
$mk\_char$
=FAILURE
3024	?0 is not a character literal
=TEX
\subsubsection{Summary}
=DOC
val pp'suc_conv : CONV;
val pp'string_conv : CONV;
val pp'char_conv : CONV;
=DESCRIBE
These definitional schemata are for ICL use only.
They are used to implement the inference rules named by dropping
the $pp'$ prefix from the above names.
=ENDDOC

\subsection{Built-In Rules of Inference}
Each of the following inference rules is justified in terms of the primitive inference rules
and definitional schemata, or derived rules declared and justified prior to the new declaration.
We will give an informal proof
in each case, following the documentation of the rule.
This provides a partial order of introduction on the rules that follow.
We will ignore the distinction between $=$ and $⇔$ in our proofs when
either could be present, and present the proof in terms of $=$.
\subsubsection{pp'eq\_sym\_rule}
=GFT Signature
val ⦏pp'eq_sym_rule⦎ : THM -> THM;
=TEX
=DESCRIBE
Symmetry of equality:
=FRULE 1 Rule
pp'eq_sym_rule
├
Γ ⊢ t1 = t2
├
Γ ⊢ t2 = t1
=TEX
=SEEALSO
$eq\_sym\_conv$
=FAILURE
6020	?0 is not of the form: `Γ ⊢ t1 = t2`
=TEX
($SYM$ in Cambridge HOL)
=GFT
1.	Γ ⊢ t1 = t2			Hypothesis
2.	⊢ t1 = t1			pp'eq_refl_conv
3.	Γ ⊢ t2 = t1			pp'subst_rule 1,2
=TEX
\subsubsection{t\_thm}
We will use the theorem
=GFT definition
t_thm = ⊢ T
=TEX
in our following work.
It is proven by
=GFT Informal Proof
1.	⊢ T ⇔ ((λ x⦁ x) = (λ x⦁ x))			definition of T
2.	⊢ (λ x⦁ x) = (λ x⦁ x)				pp'refl_conv
3.	⊢ ((λ x⦁ x) = (λ x⦁ x)) ⇒ ((λ x⦁ x) = (λ x⦁ x))	pp'⇒_intro 2
4.	⊢ ((λ x⦁ x) = (λ x⦁ x)) ⇔ T			pp'eq_sym_rule 1.
5.	⊢ ((λ x⦁ x) = (λ x⦁ x)) ⇒ T			pp'subst_rule 1,4
6.	⊢ T						pp'⇒_elim
=TEX
where the context must contain the theorem:
=GFT
t_def = ⊢ T ⇔ ((λ x⦁ x) = (λ x⦁ x))
=TEX
\subsubsection{pp'⇔\_T\_elim}
We later use the following rule of inference (which is not built in):
=FRULE 1 Rule
pp'⇔_T_elim
├
Γ ⊢ t ⇔ T
├
Γ ⊢ t
=TEX
Justified by:
=GFT Informal Proof
1.	Γ ⊢ t ⇔ T					Hypothesis
2.	Γ ⊢ T ⇔ t					pp'eq_sym_rule 1
3.	⊢ T						t_thm
4.	Γ ⊢ t						pp'subst_rule 3,2
=TEX
\subsubsection{pp'list\_simple\_∀\_elim}
=GFT Signature
val ⦏pp'list_simple_∀_elim⦎ : TERM list -> THM -> THM;
=TEX
=DESCRIBE
Instantiate a (multiply) universally quantified term to a given value.
=FRULE 1 Rule
pp'list_simple_∀_elim
[...,⌜tn⌝,...]
├
Γ ⊢ ∀ ...xn ... ⦁ t2[...,xn,...]
├
Γ ⊢ t2'[...,tn,...]
=TEX
where $t2'$ is renamed from $t2$ to prevent bound variable capture,
and the $x_i$ are variables.
The terms must have the same types as the corresponding
universally quantified variables.
The instantiation is done by simultaneous substitution (as if by $var\_subst$, q.v.), rather than by
iteration of a single instantiation.
=FAILURE
3012	?0 and ?1 do not have the same types
6018	?0 is not of the form: `Γ ⊢ ∀ ...xi... ⦁ t` where
	the ⌜xi⌝ are ?1 variables
=TEX
($SPECL$ in Cambridge HOL)

The following is a justification for a single instantiation.
It may, with some care due to the simultaneous instantiation, be iterated to gain an appropriate finite list case.
=GFT
1.	⊢ $∀ = (λP ⦁ P = λx.T)			pp'inst_type applied to Definition
2.	Γ ⊢ ∀ x ⦁ t2[x]					Hypothesis
3.	Γ ⊢ (λP ⦁ P = λx.T)(λ x ⦁ t2[x])		pp'subst_rule 1,2
4.	⊢ (λP ⦁ P = λx ⦁ T)(λ x ⦁ t2[x]) = ((λ x ⦁ t2[x]) = λx.T)
							pp'simple_β_conv
5.	Γ ⊢ (λ x ⦁ t2[x]) = λx ⦁ T			pp'subst_rule 4,3
6.	⊢ (λ x ⦁ t2[x]) t1 ⇔ (λ x ⦁ t2[x]) t1		pp'eq_refl_conv
7.	Γ ⊢ (λ x ⦁ t2[x]) t1 ⇔ (λx ⦁ T) t1		pp'subst_rule 5,6
8.	Γ ⊢ (λ x ⦁ t2[x]) t1 ⇔ t2'[t1]			pp'simple_β_conv
9.	Γ ⊢ t2'[t1] ⇔ (λ x ⦁ t2[x]) t1			pp'eq_sym_rule 8
10.	Γ ⊢ t2'[t1] ⇔ (λx ⦁ T) t1			pp'subst_rule 9,5
11.	⊢ (λx ⦁ T) t1 ⇔ T				pp'simple_β_conv
12.	Γ ⊢ t2'[t1] ⇔ T				pp'subst_rule 10,11
13.	Γ ⊢ t2'[t1]					pp'⇔_T_elim 12
=TEX
Notice in step 8. where $simple\_\beta\_conv$ may introduce some renaming
(changing $t2$ to $t2'$)
to prevent bound variable capture.
\subsubsection{pp'eq\_trans\_rule}
=GFT Signature
val ⦏pp'eq_trans_rule⦎ : THM -> THM -> THM;
=TEX
=DESCRIBE
Transitivity of equality:
=FRULE 1 Rule
pp'eq_trans_rule
├
Γ1 ⊢ t1 = t2; Γ2 ⊢ t2' = t3
├
Γ1 ∪ Γ2 ⊢ t3
=TEX
where ⌜t2⌝ and ⌜t2'⌝ are $\alpha$ convertible.
=FAILURE
6020	?0 is not of the form: `Γ ⊢ t1 = t2`
6022	?0 and ?1 are not of the form: `Γ1 ⊢ t1 = t2` and `Γ2 ⊢ t2a = t3`
	where ⌜t2⌝ and ⌜t2a⌝ are α-convertible
=FAILUREC
Error 6020 is used if either the first or second theorems are
not equations.
=TEX
($TRANS$ in Cambridge HOL)
=GFT
1.	Γ1 ⊢ t1 = t2			Hypothesis
2.	Γ2 ⊢ t2' = t3			Hypothesis
3.	Γ1 ∪ Γ2 ⊢ t1 = t3		pp'subst_rule 2,1
=TEX
\subsubsection{pp'mk\_app\_rule}
=GFT Signature
val ⦏pp'mk_app_rule⦎ : THM -> THM -> THM;
=TEX
=DESCRIBE
Given two equational theorems, one being between two functions, apply the two functions
to the LHS and RHS of the other equation.
=FRULE 1 Rule
pp'mk_app_rule
├
Γ1 ⊢ u1 = u2; Γ2 ⊢ v1 = v2
├
Γ1 ∪ Γ2 ⊢ u1 v1 = u2 v2
=TEX
=FAILURE
6020	?0 is not of the form: `Γ ⊢ t1 = t2`
6023	?0 and ?1 are not of the form :`Γ1 ⊢ u1 = u2` and `Γ2 ⊢ v1 = v2`
	where ⌜u1⌝ can be functionally applied to ⌜v1⌝
=FAILUREC
Error 6020 is used if either the first or second theorems are
not equational.
=TEX
($MK\_COMB$ in Cambridge HOL)
=GFT Informal Proof
1.	Γ1 ⊢ u1 = u2					Hypothesis
2.	Γ2 ⊢ v1 = v2					Hypothesis
3.	⊢ u1 v1 = u1 v1				pp'eq_refl_conv
4.	Γ1 ∪ Γ2 ⊢ u1 v1 = u2 v2			pp'subst_rule [1,2] 3
=TEX
\subsubsection{pp'⇔\_T\_intro}
We later use the following rule of inference (which is not built in):
=FRULE 1 Rule
pp'⇔_T_intro
├
Γ ⊢ t
├
Γ ⊢ t ⇔ T
=TEX
which is justified by:
=GFT Informal Proof
1.	⊢ ∀ b1 b2 ⦁ (b1 ⇒ b2) ⇒ (b2 ⇒ b1) ⇒ (b1 ⇔ b2)	
							pp'⇒_antisym_axiom
2.	⊢ ∀ b2 ⦁ (t ⇒ b2) ⇒ (b2 ⇒ t) ⇒ (t ⇔ b2)	
							pp'simple_∀_elim 1
3.	⊢ (t ⇒ T) ⇒ (T ⇒ t) ⇒ (t ⇔ T)		pp'simple_∀_elim 2
4.	⊢ T						t_thm
5.	⊢ t ⇒ T					pp'⇒_intro 4
6.	⊢ (T ⇒ t) ⇒ (t ⇔ T)				pp'⇒_elim 3,5
7.	Γ ⊢ t						Hypothesis
8.	Γ ⊢ T ⇒ t					pp'⇒_intro 7
9.	Γ ⊢ t ⇔ T					pp'⇒_elim 6,8
=TEX
where the context must contain the theorem:
=GFT
⇒_antisym_axiom =
	⊢ ∀ b1 b2 ⦁ (b1 ⇒ b2) ⇒ (b2 ⇒ b1) ⇒ (b1 ⇔ b2)
=TEX

\subsubsection{pp'⇔\_mp\_rule}
=GFT Signature
val ⦏pp'⇔_mp_rule⦎ : THM -> THM -> THM;
=TEX
=DESCRIBE
This is an inference rule reminiscent of Modus Ponens, but using a bi-implicative theorem rather than an implicative one.
=FRULE 1 Rule
pp'⇔_mp_rule
├
Γ1 ⊢ t1 ⇔ t2; Γ2 ⊢ t1'
├
Γ1 ∪ Γ2 ⊢ t2
=TEX
where $t1$ and $t1'$ must be $\alpha$-convertible.
=SEEALSO
$⇒\_elim$ (true Modus Ponens, on $⇒$)
=FAILURE
6024	?0 and ?1 are not of the form: `Γ1 ⊢ t1 ⇔ t2` and `Γ2 ⊢ t1'`
	where ⌜t1⌝ and ⌜t1'⌝ are α-convertible
6030	?0 is not of the form: `Γ ⊢ t1 ⇔ t2`
=TEX
($EQ\_MP$ in Cambridge HOL)
=GFT Informal Proof
1.	Γ1 ⊢ t1 ⇔ t2					Hypothesis
2.	Γ2 ⊢ t1'					Hypothesis
3.	Γ2 ⊢ t1' ⇔ T					pp'⇔_T_intro 2
4.	Γ1 ∪ Γ2 ⊢ t2 ⇔ T				pp'subst_rule 1,3
5.	Γ1 ∪ Γ2 ⊢ t2					pp'⇔_T_elim 4
=TEX
\subsubsection{pp'simple\_∀\_intro}
=GFT Signature
val ⦏pp'simple_∀_intro⦎ : TERM -> THM -> THM;
=TEX
=DESCRIBE
Prove a simple universally quantified theorem.
=FRULE 1 Rule
pp'simple_∀_intro
⌜x⌝
├
Γ ⊢ t
├
Γ ⊢ ∀ x ⦁ t
=TEX
=SEEALSO
$∀\_intro$
=FAILURE
3007	?0 is not a term variable
6005	?0 occurs free in assumption list
=TEX
($GEN$ in Cambridge HOL)

In the following we use $pp'subst\_rule$ where the HOL description uses $TRANS$( which is the same as $pp'eq\_trans\_rule$).

First we prove $∀x ⦁ T$
=GFT Informal Proof
1.	⊢ (λx ⦁ T) = λx ⦁ T				pp'eq_refl_conv
2.	⊢ ((λx ⦁ T) = λx ⦁ T) ⇔ T			pp'⇔_T_intro 1
3.	⊢ (λP ⦁ P = λx ⦁ T)(λx ⦁ T) ⇔ ((λx ⦁ T) = λx ⦁ T)
							pp'simple_β_conv
4.	⊢ (λP ⦁ P = λx ⦁ T)(λx ⦁ T) ⇔ T		pp'subst_rule 3, 2
5.	⊢ $∀ = (λP ⦁ P = λx ⦁ T)			pp'inst_type applied to Definition
6.	⊢ (λP ⦁ P = λx ⦁ T) = $∀			pp'eq_sym_rule 5
7.	⊢ (∀x ⦁ T) ⇔ T					pp'subst_rule 6, 4
8.	⊢ (∀x ⦁ T)					pp'⇔_T_elim 7
=TEX
where the context must contain the stated definition of $∀$.
Then we can prove $∀\_intro$:
=GFT Informal Proof
1.	Γ ⊢ t						Hypothesis
2.	Γ ⊢ t ⇔ T					pp'⇔_T_intro 1
3.	Γ ⊢ (λy ⦁ t) = λy ⦁ T				pp'abs_rule 2
4.	⊢ (∀y ⦁ t) ⇔ (∀y ⦁ t)				pp'eq_refl_conv
5.	Γ ⊢ (∀y ⦁ t) ⇔ ∀y ⦁ T				pp'subst_rule 3,4
6.	Γ ⊢ (∀y ⦁ T) ⇔ ∀y ⦁ t				pp'eq_sym_rule 5
7.	⊢ ∀x ⦁ T					pp'inst_type_rule(⊢ ∀x ⦁ T)
8.	⊢ ∀y ⦁ T					pp'subst_rule[] 7
9.	⊢ ∀y ⦁ t						pp'subst_rule 6, 8
=TEX
Note that $subst\_rule\;[]\;t\;(⊢\,t')$ returns $⊢\,t$ only when
$t$ and $t'$ are $\alpha$-convertible.
\subsubsection{pp'inst\_term\_rule}
=GFT Signature
val ⦏pp'inst_term_rule⦎ : (TERM * TERM) list -> THM -> THM;
=TEX
=DESCRIBE
Parallel instantiation of term variables within a theorem's conclusion to some other values.
=FRULE 1 Rule
pp'inst_term_rule
[..., (⌜ti⌝, ⌜xi⌝), ...]
├
Γ ⊢ t[x1, ..., xn]
├
Γ ⊢ t[t1, ..., tn]
=TEX
=FAILURE
3007	?0 is not a term variable
6027	Types of element (?0, ?1) in term association list differ
6028	Instantiation variable ?0 free in assumption list
=TEX
($INST$ in Cambridge HOL)

A list is used to represent the specification's (partial) function,
on the assumption that its domain is finite.
=GFT Informal Proof
1.	Γ ⊢ t[x1, ..., xn]			Hypothesis
2.	Γ ⊢ ∀ x1 ... xn ⦁ t[x1, ..., xn]		repeated pp'simple_intro on 1
3.	Γ ⊢ t[t1, ..., tn]				repeated pp'simple_∀_elim on 2
=TEX
It is important to do all the generalisations before any  specialisations to gain the effect of instantiation in parallel.
Without this, if a variable to be instantiated is introduced by
a specialisation, and then generalised along with those already
present, then that variable occurrence will also be instantiated.
\subsubsection{pp'plus\_conv}
=GFT Signature
val ⦏pp'plus_conv⦎ : CONV;
=TEX
=DESCRIBE
This conversion provides the value of the addition of two numeric literals.
=FRULE 1 Rule
pp'plus_conv
⌜ⓜmk_ℕ m⌝ +
 ⓜmk_ℕ n⌝⌝
├
├
⊢ ⌜ⓜmk_ℕ m⌝ +
	ⓜmk_ℕ n⌝⌝ =
	ⓜmk_ℕ(m + n)⌝
=TEX
=USES
For doing fast arithmetic proofs.
=FAILURE
6085	?0 is not of the form: ⌜ⓜmk_ℕ m⌝ + ⓜmk_ℕ n⌝⌝
=TEX
This rule should only be used in a context that contains the definitions of $+$ and $Suc$:.
=GFT
∀ m n⦁ 0 + n = n ∧ (m + 1) + n = (m + n) + 1 ∧ Suc m = m + 1

⊢ (∀ n⦁ ¬ Suc n = Zero) ∧
	OneOne Suc ∧
	(∀ p⦁ p Zero ∧ (∀ m⦁ p m ⇒ p (Suc m)) ⇒ (∀ n⦁ p n))
=TEX
From these we must be able to derive $plus\_assoc$
=GFT
⊢ ∀ m n p ⦁ (m + n) + p = m + (n + p)
=TEX
(a simpler result than $plus\_assoc$ might well do).
From these, and the inference rules already declared we could justify any single
instance of this theorem schemata.
E.g.
=GFT Informal Proof of ?⊢ 2 + 2 = 4
1.	⊢ 3 = Suc 2			pp'suc_conv
2.	⊢ 4 = Suc 3			pp'suc_conv
3.	⊢ Suc 3 = 3 + 1		defn +
4.	⊢ 4 = 3 + 1			pp'eq_trans_rule 2,3
5.	⊢ Suc 2 = 2 + 1		defn +
6.	⊢ 3 = 2 + 1			pp'eq_trans_rule 1,6
7.	⊢ (+) = (+)			pp'refl_conv
8.	⊢ 1 = 1				pp'refl_conv
9.	⊢ (+) 3 = (+) (2 + 1)		pp'mk_app_rule 6,7
10.	⊢ 3 + 1 = (2 + 1) + 1		pp'mk_app_rule 9,8
11.	⊢ 4 = (2 + 1) + 1		pp'eq_trans_rule 4,10
12.	⊢ (2 + 1) + 1 = 2 + (1 + 1)	plus_assoc
13.	⊢ 4 = 2 + (1 + 1)		pp'eq_trans_rule 11,12
14.	⊢ 2 = Suc 1			pp'suc_conv
15.	⊢ Suc 1 = 1 + 1		defn +
16.	⊢ 2 = 1 + 1			pp'eq_trans_rule 14,15
17.	⊢ (+) 2 = (+) 2		pp'refl_conv
18.	⊢ 2 + 2 = 2 + (1 + 1)		pp'mk_app_rule 17,16
19.	⊢ 2 + (1 + 1) = 2 + 2		pp'eq_sym_rule 18
20.	⊢ 4 = 2 + 2			pp'eq_trans_rule 13,19
21.	⊢ 2 + 2 = 4			pp'eq_sym_rule 20
=TEX
\subsubsection{Summary}
=DOC
val pp'eq_sym_rule : THM -> THM;
val pp'list_simple_∀_elim : TERM list -> THM -> THM;
val pp'eq_trans_rule : THM -> THM -> THM;
val pp'mk_app_rule : THM -> THM -> THM;
val pp'⇔_mp_rule : THM -> THM -> THM;
val pp'simple_∀_intro : TERM -> THM -> THM;
val pp'inst_term_rule : (TERM * TERM) list -> THM -> THM;
val pp'plus_conv : CONV;
=DESCRIBE
These built-in inference rules are for ICL use only.
They are used to implement the functions named by dropping
the $pp'$ prefix from the above names.
=ENDDOC

\section{THEORY MANAGEMENT}
\subsection{Operations on Hierarchies}
The user will not see the effects of these
functions.
In particular, the user will find that they stay within one
hierarchy during what they see as a session.
\subsubsection{pp'freeze$\_$hierarchy}
=GFT Signature
val ⦏pp'freeze_hierarchy⦎ : unit -> unit;
=TEX
=DESCRIBE
$pp'freeze\_hierarchy$ modifies the current hierarchy,
setting all undeleted theories in that hierarchy as an ancestor, and so read-only.
This resulting hierarchy is an ancestor hierarchy, appropriate for copying by $pp'new\_hierarchy$ (q.v.).
=TEX
\subsubsection{pp'new$\_$hierarchy}
=GFT Signature
val ⦏pp'new_hierarchy⦎ : unit -> pp'HIERARCHY;
=TEX
=DESCRIBE
$pp'new\_hierarchy$ takes a copy of an ancestor hierarchy as produced by $pp'freeze\-\_hierarchy$(q.v.),
in which all undeleted theories in that hierarchy are marked as ancestors, and so read-only.
This new hierarchy may be later loaded by $pp'load\-\_hierarchy$ (q.v.).
=FAILURE
6090	Theory with internal number ?0 is neither an ancestor nor deleted
=TEX
\subsubsection{pp'load$\_$hierarchy}
=GFT Signature
val ⦏pp'load_hierarchy⦎ : pp'HIERARCHY -> unit;
=TEX
=DESCRIBE
The current hierarchy is set to the stated hierarchy,
if that new hierarchy is a descendant of the current hierarchy.
A hierarchy is a descendant if it contains all the theories
in the current hierarchy, with the same name, contents and status,
though not necessarily same ``in scope'' or children.
The specification only requires the contents to be equal,
on the expectation that in such a case the rest cannot differ.
We put in further checks as an act of ``defensive programming''.
The current theory remains unchanged.
A hierarchy is formed by $pp'new\_hierarchy$ (q.v.).
=FAILURE
6033	Hierarchy is not a descendant of the current hierarchy
6092	Supplied hierarchy is inconsistent
=TEX
\subsubsection{pp'get$\_$hierarchy}
=GFT Signature
val ⦏pp'get_hierarchy⦎ : unit -> (string * THEORY_INFO) list;
=TEX
=DESCRIBE
Returns the current hierarchy, presented as a list of theory names and the information associated with those theory names.
=TEX
\subsubsection{pp'seal$\_$hierarchy}
=GFT Signature
val ⦏pp'seal_hierarchy⦎ : unit -> unit;
=TEX
=DESCRIBE
This command ``seals'' the current hierarchy at the current theory.
Once sealed, no theory may successfully be opened (i.e. have $pp'open\_theory$ applied to it) that does not have the now pervasive theory as a parent,
or is the pervasive theory itself.
By the nature of the command a subsequent $pp'seal\_hierarchy$ can only be done on
a theory that takes the pervasive theory as a parent,
or is the same theory,
because the current theory can no longer not satisfy this constraint.
A theory cannot become pervasive if an undeleted theory in the theory database is neither an ancestor nor descendant.

This is similar to the effect of a $pp'new\_hierarchy$,
but with more precision and more effect.

Note that using this function in a child database will not
have an effect that persists over into a new session,
even if the child is commited (e.g. by $hol\_save$, q.v.).
=SEEALSO
$pp'get\_pervasive\_theory\_name$ which returns the name
of the ``top'' pervasive theory.
=FAILURE
6004	?0 is neither an ancestor nor descendant of current theory
=TEX
\subsubsection{pp'get$\_$pervasive$\_$theory$\_$name}
=DOC
val ⦏pp'get_pervasive_theory_name⦎ : unit -> string;
=DESCRIBE
This function returns the ``top'' pervasive theory name,
as set by $pp'seal\-\_hierarchy$.
This theory, and all its ancestors will always be in scope.
=ENDDOC
A possible design error occurs if the integer stored as the
pervasive theory name cannot be transformed into a string.
=FAILURE
6091	DESIGN ERROR: Pervasive theory name ?0 is corrupt
=TEX	
\subsubsection{pp'get$\_$theory$\_$info}
=GFT Signature
val ⦏pp'get_theory_info⦎ : int -> THEORY_INFO;
=TEX
=DESCRIBE
$pp'get\_theory\_info$ $iname$ returns a presentation of the information about the theory with internal name $iname$
held within the current hierarchy.
=SEEALSO
$HIERARCHY$
=FAILURE
6043	There is no theory associated with internal name ?0
=TEX
\subsubsection{pp'get$\_$theory$\_$name}
=GFT Signature
val ⦏pp'get_theory_name⦎ : int -> string;
=TEX
=DESCRIBE
$pp'get\_theory\_name$ $nm$ returns the actual theory name associated with $nm$, an internal representation of a theory name.
This may return the name of a deleted theory,
which won't be recognised by those functions that
take a string represented theory names.
=FAILURE
6043	There is no theory associated with internal name ?0
6089	The theory with internal name ?0 has been deleted
=TEX
\subsubsection{Summary}
=DOC
val pp'freeze_hierarchy : unit -> unit;
val pp'new_hierarchy : unit -> pp'HIERARCHY;
val pp'load_hierarchy : pp'HIERARCHY -> unit;
val pp'get_hierarchy : unit -> (string * THEORY_INFO) list;
val pp'seal_hierarchy : unit -> unit;
val pp'get_theory_info : int -> THEORY_INFO;
val pp'get_theory_name : int -> string;
=DESCRIBE
These hierarchy theory management tools are for ICL use only.
There are no corresponding user functions.
=ENDDOC

\subsection{Operations on Theory Attributes}
In the specification, whenever a theory is modified a copy is made of the current hierarchy, that copy is modified,
and the copy is then made the current theory.
In our implementation we can sometimes shortcut this
process, as our hierarchy is implemented as an array of addresses, so that we can modify theories ``in place'',
without taking a copy of the hierarchy.
The functionality doesn't change, merely the process achieving the effect.
\subsubsection{pp'open$\_$theory}
=GFT Signature
val ⦏pp'open_theory⦎ : int -> (int list * int list);
=TEX
=DESCRIBE
This makes an existing theory of the current theory hierarchy the current theory,
making only it and those theories that are its ancestors in scope.
The function returns a pair of lists that are the internal form of theory names.
The first list is those theories that have come into of scope,
the second is those that have passed out of scope.
=FAILURE
6017	Theory ?0 may not be opened (it is not a descendant of ?1 which must be in scope)
6043	There is no theory associated with internal name ?0
=TEX
Error 6017 arises from attempting to open a theory that doesn't have the last theory sealed by $pp'seal\_hierarchy$ as an ancestor.

Note that the Cambridge HOL $load\_theory$ would be implemented by
using $pp'open\_theory$ and $pp'lock\_theory$.
\subsubsection{pp'delete$\_$theory}
=GFT Signature
val ⦏pp'delete_theory⦎ : int -> unit;
=TEX
=DESCRIBE
If the named theory is present in the current hierarchy,
is not in scope (and in particular is not the current theory),
is writable, and has no child theories, then delete it.
This means that all theorems that were proven with the deleted
theory as the current theory will become unusable.
In addition, the theory name will be ``not present''
for all purposes, including allowing it to be reused for a
new theory.
=FAILURE
6043	There is no theory associated with internal name ?0
6037	Theory ?0 is locked
6071	Theory ?0 is a read-only ancestor
6076	Theory ?0 has child theories
6069	Theory ?0 is in scope
=TEX
\subsubsection{pp'new$\_$theory}
=GFT Signature
val ⦏pp'new_theory⦎ : string -> int;
=TEX
=DESCRIBE
This adds a new, empty, theory to the current theory hierarchy,
with the given name.
The name must not previously have been used in the current hierarchy as a theory name, unless it has since been deleted.
The empty theory has no declarations within it,
but does have the current theory as its sole parent.
The function returns the internal form of the new theory's name.
The current theory does not change, unlike the user interface function $new\_theory$ (q.v.).
=FAILURE
6040	Theory ?0 is already present in current theory hierarchy
=TEX
The specification calls for a ``user data'' parameter: we instead always use a default ``empty'' user data value.
\subsubsection{pp'new$\_$parent}
=GFT Signature
val ⦏pp'new_parent⦎ : int -> int list;
=TEX
=DESCRIBE
Adds the given parent theory to the list of parents of the current
theory, considered as a set.
It will fail if the parent theory does not exist,
is already a parent,
or if making it a parent causes clashes in the current theory
or its children.
This will bring the parent theory and its ancestors into scope.

The function returns the theories bought into scope.
=FAILURE
6043	There is no theory associated with internal name ?0
6037	Theory ?0 is locked
6071	Theory ?0 is a read-only ancestor
6067	Making ?0 a parent would cause a clash
6082	Theory ?0 is already a parent
6084	Suggested parent ?0 is a child of the current theory
=FAILUREC
Error 6043 refers to the parent,
errors 6037 and 6071 refer to the current theory.
=TEX
Error 6067 should be more informative.
\subsubsection{pp'lock$\_$theory}
=GFT Signature
val ⦏pp'lock_theory⦎ : int -> unit;
=TEX
=DESCRIBE
If the named theory exists, and is currently writable,
then it is made locked.
This locking may be unlocked using $pp'unlock\_theory$(q.v.).
=FAILURE
6043	There is no theory associated with internal name ?0
6037	Theory ?0 is locked
6071	Theory ?0 is a read-only ancestor
=TEX
\subsubsection{pp'unlock$\_$theory}
=GFT Signature
val ⦏pp'unlock_theory⦎ : string -> unit;
=TEX
=DESCRIBE
If the named theory exists and has been locked by $pp'lock\_theory$(q.v.),
then this function unlocks it.
=FAILURE
6043	There is no theory associated with internal name ?0
6068	Theory ?0 has not been locked
=TEX
\subsubsection{pp'duplicate$\_$theory}
=GFT Signature
val ⦏pp'duplicate_theory⦎ : string -> string -> int;
=TEX
=DESCRIBE
$pp'duplicate\_theory$ $source$ $duplicate$ creates a new theory,
called $duplicate$
with identical contents and parents to $source$,
but without its children, a status of $TSNormal$, and it will not be initially in scope.
Note that unless $source$ contains no declarations, then neither
theory could be made an ancestor of the other, because of clashing
declarations.
The function returns the internal form of the new theory's name.
Note that the theorems (including axioms and definitions)
will have as their theory $source$, not the duplicate.
The sealed theory and its ancestors (see $pp'seal\_hierarchy$) may not be duplicated, as the result could
not be opened.
Attempts to do this will give rise to errors 6026 and 6042.
Thus in particular theory ``min'' can never be duplicated,
as it is the initial sealed theory.
=USES
To allow the user to modify and experiment with a theory that
has child theories that are not involved in the experiment,
and would perhaps clash with the experiment.
=FAILURE
6026	Theory ?0 may not be duplicated
	(it must always be in the scope of any opened theory)
6042	Theory ?0 may not be duplicated (the duplicate would not be a descendant of ?1)
6043	There is no theory associated with internal name ?0
6040	Theory ?0 is already present in current theory hierarchy
=TEX
\subsubsection{Summary}
=DOC
val pp'open_theory : int -> (int list * int list);
val pp'delete_theory : int -> unit;
val pp'new_theory : string -> int;
val pp'new_parent : int -> int list;
val pp'lock_theory : int -> unit;
val pp'unlock_theory : int -> unit;
val pp'duplicate_theory : int -> string -> int;
=DESCRIBE
These operations of theory attributes are for ICL use only.
They are used to implement the functions named by dropping
the $pp'$ prefix from the above names.
=ENDDOC
\subsection{Operations on Theory Contents}
\subsubsection{dest$\_$thm}
=GFT Signature
val ⦏dest_thm⦎ : THM -> SEQ;
=TEX
=DESCRIBE
This returns the representation of a theorem as a sequent, which is a list of assumptions and a conclusion.
=SEEALSO
$pp'dest\_thm$
=TEX
This will not test whether the theorem is valid while destroying
it, as the result is ``harmless'' even if the theorem is invalid.
\subsubsection{pp'dest$\_$thm}
=GFT Signature
val ⦏pp'dest_thm⦎ : THM -> {level:int, theory:THEORY, sequent :SEQ};
=TEX
=DESCRIBE
This returns the full representation of a theorem, in a safe, interface, form.
The level is the definition level at which the theorem was created, the theory is
that in which the theorem was created, and the sequent is the assumptions and conclusion
of the theorem.
=TEX
This will not test whether the theorem is valid while destroying
it, as the result is ``harmless'' even if the theorem is invalid.
\subsubsection{pp'list$\_$save$\_$thm}
=GFT Signature
val ⦏pp'list_save_thm⦎ : (string list * THM) -> THM;
=TEX
=DESCRIBE
$pp'list\_save\_thm$ $(key list, thm)$ attempts to save $thm$ under the keys in $key$ $list$
in the current theory.
It will fail if $thm$ is not valid, the current theory is locked, there are no keys, or if any $key$ has already been used to save a theorem in
the current theory.
The function returns $thm$.
=FAILURE
6037	Theory ?0 is locked
6071	Theory ?0 is a read-only ancestor
6031	Key list may not be empty
6039	Key ?0 has already been used for a theorem in theory ?1
=FAILUREC
Error 6039 will also occur if the list of keys has duplicates.
=TEX
\subsubsection{pp'delete$\_$extension}
=GFT Signature
val ⦏pp'delete_extension⦎ : unit -> int;
=TEX
=DESCRIBE
$pp'delete\_extension$ $key$ will delete the last extension to the
current theory.
This will undo the effect of the last execution of any of:

\begin{tabular}{l p{4.0in}}
$pp'new\_type$ & \\
$pp'new\_const$ & \\
$pp'new\_axiom$ & \\
$pp'new\_defn$ & Deleting the definition (under all its keys), and the constant declared. \\
$pp'new\_spec$ & Deleting the specification (under all its keys), and the constants declared. \\
$pp'new\_type\_defn$ & Deleting the definition (under all its keys) and type declared. \\
\end{tabular}

Note that, amongst other effects, all theorems created in the theory since the deleted extension was created
will become unusable after the deletion.
However, $pp'delete\-\_extension$ will fail if it would cause a saved theorem to
become unusable:
the user should first delete the theorem.

The function returns the level number deleted.
=FAILURE
6037	Theory ?0 is locked
6071	Theory ?0 is a read-only ancestor
6050	Theory ?0 contains no extensions
6076	Theory ?0 has child theories
6077	Theory ?0 has a saved theorem with key ?1 created after
	the extension was made
=TEX
There is no point in the function returning the deleted
definition, etc, because the theorem is unusable.

It is up to the interface to this package to determine what a
user wants to delete, check that the deletions required are indeed desired, and do sufficient $pp'delete\_extension$s
to delete the original offending declaration.
This may be done by examining the results of $pp'get\_theory$.
\subsubsection{pp'delete$\_$thm}
=GFT Signature
val ⦏pp'delete_thm⦎ : string -> THM;
=TEX
=DESCRIBE
$pp'delete\_thm$ $key$ attempts to delete the theorem
saved in the current theory under $key$.
It will fail if the key does not refer to a theorem, or the theory
is locked.
=FAILURE
6037	Theory ?0 is locked
6071	Theory ?0 is a read-only ancestor
6046	Key ?0 is not used for a theorem in theory ?1
=TEX
\subsubsection{pp'new$\_$axiom}
=GFT Signature
val ⦏pp'new_axiom⦎ : (string list * TERM) -> THM;
=TEX
=DESCRIBE
$pp'new\_axiom$ $(key list, term)$ attempts to save as an axiom the theorem `$⊢ term$'
on the current theory under each of the keys provided.
It fails if the term is ill-formed (e.g. it uses an undeclared
or incorrectly typed constant),
the current theory is locked, the key list is empty, or a $key$ has already been used for
an axiom.
Adding a new axiom increments the level number of the current theory.
=FAILURE
3031	?0 is not of type ⓣBOOL⌝
6031	Key list may not be empty
6037	Theory ?0 is locked
6047	Key ?0 has already been used for an axiom in theory ?1
6071	Theory ?0 is a read-only ancestor
=TEX
\subsubsection{pp'new$\_$const}
=GFT Signature
val ⦏pp'new_const⦎ : (string * TYPE) -> TERM;
=TEX
=DESCRIBE
$pp'new\_const$ $(name, type)$ introduces a new constant
(with no defining theorem) called $name$, with most general type
$TYPE$, into the current theory.
The function returns the constant as a term, with the stated
most general type.
Adding a new constant increments the level number of the current theory.

The constant required cannot be one that $mk\_const$ will refuse to form, thus error messages 3002, 3003 and 3004 below.
=FAILURE
3002	Type of constant with name "=" must be of form:⌜ty1 → ty1 → BOOL⌝
3003	Type of constant with name "⇒" must be of form:⌜BOOL → BOOL → BOOL⌝
3004	Type of constant with name ?0 must be of form:⌜(ty1 → BOOL) → BOOL⌝
6037	Theory ?0 is locked
6049	There is a constant called ?0 already in scope
6063	There is a constant called ?0 in the descendants of the current theory
6071	Theory ?0 is a read-only ancestor
=TEX
A constant's fixity is set by a separate
function call, rather than being bound in a user-level
$pp'new\_const$.
\subsubsection{pp'new$\_$type}
=GFT Signature
val ⦏pp'new_type⦎ : (string * int) -> TYPE;
=TEX
=DESCRIBE
$pp'new\_type$ $(name, arity)$ introduces a new type (constructor)
(with no defining theorem) called $name$ with arity $arity$ into the
current theory.
The function returns the new type with sufficient arguments $'1, '2, \ldots$
to provide a well formed type.
Adding a new type increments the level number of the current theory.
=FAILURE
6034	There is a type called ?0 in the descendants of the current theory
6037	Theory ?0 is locked
6045	There is a type called ?0 already in scope
6071	Theory ?0 is a read-only ancestor
6088	The arity of a type must be ≥ 0
=TEX
A type's fixity is set by a separate
function call, rather than being bound in a user-level
$pp'new\_type$ function.
\subsubsection{Summary}
=DOC
val dest_thm : THM -> SEQ;
val pp'dest_thm : THM -> {level:int, theory:THEORY, sequent :SEQ};
val pp'list_save_thm : (string list * THM) -> THM;
val pp'delete_extension : unit -> int;
val pp'delete_thm : string -> THM;
val pp'new_axiom : (string list * TERM) -> THM;
val pp'new_const : (string * TYPE) -> TERM;
val pp'new_type : (string * int) -> TYPE;
val pp'step_current_level : unit -> unit;
=DESCRIBE
These operations on theory contents are for advanced programming purposes only.
They are used to implement the functions named by dropping
the $pp'$ prefix, except for $dest\_thm$ which is echoed
in the signature $KernelInterface$.
=ENDDOC
\subsection{Definitional Mechanisms for Theories}
\subsubsection{pp'new$\_$type$\_$defn}
=GFT Signature
val ⦏pp'new_type_defn⦎ :
	(string list * string * string list * THM) -> THM;
=TEX
=DESCRIBE
$pp'new\_type\_defn$ $(key\ list, name, typars, defthm)$
declares a new type with name $name$, and arity the length of
$typars$.
It also creates a defining theorem for the type, saves it in the current theory under the keys in $key\ list$, and also returns it.
$defthm$ must be a valid well-formed theorem of the form:
=GFT
⊢ ∃ x : type ⦁ p x
=TEX
with no assumptions.
The defining theorem will then be of the form:
=GFT
⊢ ∃ f : typars name → type ⦁
	TypeDefn (p: type → BOOL) f
=TEX
where $TypeDefn$ asserts that its predicate argument
$p$ is non-empty, and its function argument $f$ is a bijection
between the new type and the subset of $type$ delineated by $p$.
Adding a new type definition increments the level number of the current theory.
=FAILURE
6031	Key list may not be empty
6034	There is a type called ?0 in the descendants of the current theory
6037	Theory ?0 is locked
6045	There is a type called ?0 already in scope
6051	Key ?0 has already been used for a definition in theory ?1
6053	?0 must not have assumptions
6054	?0 is not of the form: `⊢ ∃ x ⦁ p x`
6055	?0 is not of the form: `⊢ ∃ x ⦁ p x` where ⌜x⌝  is a variable
6057	?0 contains type variables not found in type variable parameter list,
	type variables being: ?1
6071	Theory ?0 is a read-only ancestor
6079	?0 repeated in type parameter list
6080	?0 is not of the form: `⊢ ∃ x ⦁ p y` where ⌜x⌝ equals ⌜y⌝
=TEX
\subsubsection{pp'gen$\_$new$\_$spec}
=GFT Signature
val ⦏pp'gen_new_spec⦎ : (string list * THM) -> THM;
=TEX
=DESCRIBE
$pp'gen_new\_spec$ $(key\ list, thm)$ declares one or more new constants.
The theorem $thm$ must have the following form:
=GFT
	v⋎1 = t⋎1, v⋎2 = t⋎2, ..., v⋎n = t⋎n ⊢ p
=TEX
\ where the $v_i$ are variables, and must satisfy the following constraints:
\begin{itemize}
\item no two of the variables $v_i$ may have the same name;
\item no variable $v_i$ may have the same name as a constant that is in scope
in the current theory or any of its descendants;
\item the terms $t_i$ must contain no free variables;
\item any type variable occurring anywhere in one of the terms $t_i$ must also occur somewhere
in the type of the corresponding $v_i$;
\item the term $p$ must contain no free variables other than the $v_i$;
\item any type or constant that occurs in one of the $t_i$ or in $p$ must be in scope in the current theory.
\end{itemize}

If any of these constraints is not satisfied, the function will raise an exception and
will not change the current theory.
If the constraints are satisfied, the function increments the level number of the current theory,
declares new constants $c_1, \ldots c_n$, where each $c⋎i$ has the same name and type
as the corresponding $v⋎i$, and saves under the keys specified
in $key\_list$ a definition comprising the theorem:
=GFT
	⊢ p[c⋎1/v⋎1, ..., c⋎n/v⋎n]
=TEX

=FAILURE
6019	There are two equations for ?0 in the assumptions of theorem ?1
6031	Key list may not be empty
6037	Theory ?0 is locked
6049	There is a constant called ?0 already in scope
6051	Key ?0 has already been used for a definition in theory ?1
6058	The term ?0 contains one or more type variables (?1) not occurring in the type of ?2
6059	The ?0 ?1 contains the following free variable?2: ?3
6063	There is a constant called ?0 in the descendants of the current theory
6064	?0 is not of the form ⌜v = t⌝ where v is a variable.
6071	Theory ?0 is a read-only ancestor
=TEX
The fixity of the definition is not given at the point of definition,
but by a separate user directive, in the non-critical code.
\subsubsection{pp'new$\_$spec}
=GFT Signature
val ⦏pp'new_spec⦎ : (string list * int * THM) -> THM;
=TEX
=DESCRIBE
$pp'new\_spec$ $(keylist$, $ndef$, `$⊢ ∃ x_1,\ldots,x_n\ ⦁\ p[x_1,\ldots,x_n])$'
will introduce $ndef$ new constants named and typed from the $x_i$.
It will also save a defining theorem under each of the names in
$keylist$ in the current theory of the
form `$⊢ p[c_1,\ldots,c_n]$' where $c_i$ is the constant with the
name and type of $x_i$.
If either the constant or theorem introduction fails then
the function will not change the current theory.
Adding a new specification increments the level number of the current theory.
The set of type variables in the types of the $x_i$ must all be equal,
and the body of $p[x_1,\ldots,x_n]$ must not contain type variables that are not in these sets.

The constants required cannot be ones that $mk\_const$ will refuse to form, thus error messages 3002, 3003 and 3004 below.
=FAILURE
3002	Type of constant with name "=" must be of form:⌜ty1 → ty1 → BOOL⌝
3003	Type of constant with name "⇒" must be of form:⌜BOOL → BOOL → BOOL⌝
3004	Type of constant with name ?0 must be of form:⌜(ty1 → BOOL) → BOOL⌝
6016	Existentially bound variable ?0 is repeated in theorem ?1
6031	Key list may not be empty
6037	Theory ?0 is locked
6044	Must define at least one constant
6049	There is a constant called ?0 already in scope
6051	Key ?0 has already been used for a definition in theory ?1
6053	?0 must not have assumptions
6059	The ?0 ?1 contains the following free variable?2: ?3
6060	?0 is not of the form: `⊢ ∃ x1 ... xn ⦁ p[x1,...,xn]`
	where the ⌜xi⌝ are variables, and n( = ?1) is the number of
	constants to be defined
6061	the body of ?0 contains type variables not found in type
	of constants to be defined, the variables being: ?1
6063	There is a constant called ?0 in the descendants of the current theory
6071	Theory ?0 is a read-only ancestor
6081	Sets of type variables in ?0 and ?1 differ
=TEX
$ndef$ could be allowed to be $0$, which forms an odd way of
saving a theorem as a definition, though we do not currently allow this option.

We do not need Cambridge HOL's $flag\_name\_list$ parameter, which lists
the names of the new constants, and their lexical properties.
The names come from the existential quantifiers, the number from $ndef$, the properties
from separate user directives.
\subsubsection{Summary}
=DOC
val pp'gen_new_spec : (string list * THM) -> THM;
val pp'new_type_defn :
	(string list * string * string list * THM) -> THM;
val pp'new_spec : (string list * int * THM) -> THM;
=DESCRIBE
These functions are the direct interfaces to the {\Product} logical kernel
and are used to implement the functions named by dropping the $pp'$ prefix from the above names.
Using these functions bypasses the extra services provided by the kernel interface module (such as
management of the symbol table) and is not recommended unless you fully understand the consequences.
=ENDDOC
\subsection{Theory Access Functions}
Many of the theory access functions are found only
in the interface document, \cite{DS/FMU/IED/DTD012}.
The ones below are provided as they may be more efficiently
implemented within the abstract data type, than by
an interface function accessing the results of just
$pp'get\_theory\_hierarchy$.

\subsubsection{pp'get$\_$theory}
=GFT Signature
val ⦏pp'get_theory⦎ : int -> THEORY;
=TEX
=DESCRIBE
This returns the named theory in its ``raw'' state.
This cannot lead to logical inconsistencies,
e.g. by returning addresses of ``trusted'' ML variables that the user
could modify without going through the interface functions.
However, the user is recommended to use the interface functions,
rather than directly access the theory.

=SEEALSO
$THEORY$ for the structure of the result
=FAILURE
6043	There is no theory associated with internal name ?0
=TEX
\subsubsection{pp'get$\_$current$\_$theory$\_$name}
=GFT Signature
val ⦏pp'get_current_theory_name⦎ : unit -> int;
=TEX
=DESCRIBE
Returns the current theory's name, in an internal form.
=TEX
\subsubsection{pp'get$\_$current$\_$theory$\_$status}
=GFT Signature
val ⦏get_current_theory_status⦎ : unit -> THEORY_STATUS;
=TEX
=DESCRIBE
Returns the current theory's status.
=TEX
\subsubsection{pp'get$\_$ancestors}
=GFT Signature
val ⦏pp'get_ancestors⦎ : int -> int list;
=TEX
=DESCRIBE
Given the internal names of a theory, this function returns the list of all ancestors of the theory (including itself).
=TEX
\subsubsection{pp'get$\_$descendants}
=GFT Signature
val ⦏pp'get_descendants⦎ : int -> int list;
=TEX
=DESCRIBE
Given the internal names of a theory, this function returns the list of all ancestors of the theory (not including itself).
=TEX
\subsubsection{pp'get$\_$const$\_$type}
=GFT Signature
val ⦏pp'get_const_type⦎ : int -> string -> TYPE OPT;
=TEX
=DESCRIBE
=INLINEFT
pp'get_const_type thyn conn
=TEX
\ returns the type associated with the constant with name $conn$ in the theory with internal name $thyn$ if any.
The function recognises numeric and string literals and returns the appropriate type.
=TEX
\subsubsection{pp'get$\_$type$\_$arity}
=GFT Signature
val ⦏pp'get_type_arity⦎ : string -> int OPT;
=TEX
=DESCRIBE
=INLINEFT
pp'get_type_arity thyn tyn
=TEX
\ returns the arity associated with the type with name $tyn$ in the theory with internal name $thyn$ if any.
=TEX
\subsubsection{valid$\_$thm}
=GFT Signature
val ⦏valid_thm⦎ : THM -> bool;
=TEX
=DESCRIBE
This function uses the check for the validity of theorems
that can give rise to errors 6036, 6065, 6066 and 6072,
returning false if such errors would be caused by processing
the theorem, and true otherwise.
=USES
To preempt errors caused by the primitive inference rules, et al.,
to allow the raising of more helpful error messages.
=TEX
\subsubsection{thm$\_$fail}
=GFT Signature
val ⦏thm_fail⦎ : string -> int -> THM list -> 'a;
=TEX
=DESCRIBE
$thm\_fail$ $area$ $msg$ $thml$ first creates a list of functions from $unit$ to $string$, providing displays of the list of theorems.
It then calls $fail$ with the $area$, $msg$ and this list of functions.
This allows theorems to be presented in error messages.
=TEX
\subsubsection{string$\_$of$\_$thm}
For SML'97, $makestring$ which supported $string\_of\_thm$
is not available. We provide the following interface,
not intended for end user consumption to let us do without $makestring$.
Cf. the analogous treatment of terms and types in \cite{DS/FMU/IED/DTD003}.
=SML
val ⦏pp'string_of_thm⦎ : THM -> string;
val ⦏pp'set_string_of_thm⦎ : (THM -> string) -> (THM -> string);
=TEX
=GFT Signature
val ⦏string_of_thm⦎ : THM -> string;
=TEX
=DESCRIBE
This returns a display of a theorem in the form of a string,
with no inserted new lines, suitable for use with $diag\_string$ and $fail$.
=SEEALSO
$format\_thm$ is a formatted string display of a theorem.
=TEX
\subsubsection{Equalities}
=GFT Signature
val ⦏=|-⦎ : THM * THM -> bool;
val ⦏~=|-⦎ : THM * THM -> bool;
val ⦏=#⦎ : SEQ * SEQ -> bool;
val ⦏~=#⦎ : SEQ * SEQ -> bool;
=TEX
=DESCRIBE
=INLINEFT
 =|-
=TEX
provides a strict equality test on the conclusion and assumptions of theorems,
=INLINEFT
~=|-
=TEX
provides an equality test on the conclusion and assumptions of theorems up to $α$-convertibility and order of assumptions.
=INLINEFT
 =#
=TEX
provides a strict equality test on sequents,
=INLINEFT
~=#
=TEX
provides an equality test on the sequents up to $α$-convertibility and order of assumptions.

=TEX
\subsubsection{Summary}
=DOC
val pp'get_theory : int -> THEORY;
val pp'get_current_theory_name : unit -> int;
val get_current_theory_status : unit -> THEORY_STATUS;
val pp'get_ancestors : int -> int list;
val pp'get_descendants : int -> int list;
val pp'get_const_type : int -> string -> TYPE OPT;
val pp'get_type_arity : int -> string -> int OPT;
val valid_thm : THM -> bool;
val thm_fail : string -> int -> THM list -> 'a;
val string_of_thm : THM -> string;
val =|- : THM * THM -> bool;
val ~=|- : THM * THM -> bool;
val =# : SEQ * SEQ -> bool;
val ~=# : SEQ * SEQ -> bool;
=DESCRIBE
These theorem access functions are for internal use only.
The functions with names beginning $pp'$ used to implement the functions named by dropping the prefix from the above names.
The rest are made visible through the signature $KernelInterface$, are documented with that signature.
=ENDDOC
=SML
end(* signature of pp'Kernel *);
=TEX
\section{TEST POLICY}
The functions in this document should be tested according to the general criteria described in
\cite{DS/FMU/IED/PLN008}.
The partial evaluation of $pp'subst\_rule$ needs checking to ensure that it doesn't allow the encoding of a rule that doesn't check theorems in the scope it is used in.

Non-error cases of $gen\_new\_spec$ will be tricky to test at this stage in the build other than in the special case where the input theorem has the form
=INLINEFT
x = t ⊢ x = t
=TEX
. More complex cases will be covered where $new\_spec1$ is tested in \cite{DS/FMU/IED/MDT037}.
\twocolumn[\section{INDEX}]
\small
\printindex
=TEX
\end{document}



=IGN
********************************************************************************
dtd014.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
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

\def\Title{Detailed Design for Unification}

\def\AbstractText{This document gives the detailed design of the module containing a function to compute the unifier of two types.}

\def\Reference{DS/FMU/IED/DTD014}

\def\Author{D.J. King}


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
%% LaTeX2e port: \TPPtitle{Detailed Design for Unification}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/DTD014}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 2.5 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2002/10/17 15:10:58 $%
%% LaTeX2e port: }}  %% Mandatory field (with sensible default)
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: %\TPPstatus{Approved}
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{D.J.~King & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document gives the detailed design
%% LaTeX2e port: of the module containing a function to compute the
%% LaTeX2e port: unifier of two types.
%% LaTeX2e port: }
%% LaTeX2e port: %\TPPabstractB{}
%% LaTeX2e port: %\TPPabstractC{}
%% LaTeX2e port: %\TPPabstractD{}
%% LaTeX2e port: %\TPPabstractE{}
%% LaTeX2e port: %\TPPabstractF{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port:       Library \\ R.D. Arthan\\ D.J. King}}
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
\subsection{Contents list}
\tableofcontents
\subsection{Document cross references}

\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes history}  % to get section number `0.3'

\begin{description}
\item[Issue 1.1 (1991/05/07) - 1.5 (1991/08/15)]
Initial versions.

\item[Issue 2.1 (1991/08/15) 15 August 1991]
This is an approved version of Issue 1.5.

\item[Issue 2.2 (1991/11/25) 20 November 1991]
Changed the representation of the substitution function
from a binary tree to sparse array. This increases
the speed significantly.

\item[Issue 2.3, \FormatDate{92/01/20} ] Updated to use new fonts.

\item[Issue 2.4, \FormatDate{2001/07/17} ] Now uses dynamic arrays.

\item[Issue 2.5 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 2.6 (2002/10/17)] PPHol-specific updates for open source release
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}

\subsection{Changes forecast}

None.

\pagebreak
\section{GENERAL}

\subsection{Scope}

This document contains part of the detailed design of the
ICL HOL system, concerned with the unification of types.
It is envisaged that the type unification algorithm covered
by this document will be used by the type inferrer
to solve the type equations
in HOL terms which contain elements of type unknown.

This document responds to the requirements in \cite{DS/FMU/IED/HLD008}.

\subsection{Introduction}
\subsubsection{Background and Purpose}
\label{BackgroundandPurpose}

This document contains a suite of functions which
support the function $unify$. Type checking and
type inference for the HOL language is based upon
the approach described in \cite{PeytonJones86}. This
describes a way of identifying the types of all the
elements in a term, as a process of solving linear
equations. The approach used here draws heavily from
\cite{PeytonJones86}, and the reader is referred to
this reference for background to the design of
the unification algorithm adopted here.

The unification of types has been a requirement in the
development of the prototype ICL HOL. The design
and implementation of a type unification algorithm
has been adapted from the prototype.

Changes have been made from the prototype in the
following areas:

\begin{enumerate}

\item
The substitution function was represented as a binary
tree. It is now represented as a sparse array and
uses structure sharing to improve space and time
utilization.

\item
Exception and error handling will not be done locally
anymore. Use has been made of the generic error handling
facilities described in \cite{DS/FMU/IED/DTD002}.

\item
The function $format\_TTYPE$ will no longer be required
for the reason above.

\item
Naming conventions have been changed in accordance
with \cite{DS/FMU/IED/DEF003}.

\end{enumerate}

The support for unification of HOL types are
potentially of use in constructing parsers for other
languages e.g. Z. This material is therefore also made
available for external use.

\subsubsection{Interface}

This document defines a signature Unification.

\subsubsection{Deficiencies}

None Known.

\subsubsection{Dependencies}

This document depends on the error handling system described
in document \cite{DS/FMU/IED/DTD002}. It also depends on the
data types defined in \cite{DS/FMU/IED/DTD003}.

\subsubsection{Algorithms}

The algorithms used in this document closely
follow the description of type inference
and unification for functional
programming languages which may be found in
chapters 8 and 9 of \cite{PeytonJones86}.
The analogy between our problem and the one discussed
in \cite{PeytonJones86} is very close. The typing rules
for HOL constants are like those for variables
bound in let-expressions in a functional programming
language and the typing rules for HOL variables are
like those for parameters.
Note however that the algorithm
described in \cite{PeytonJones86} computes
the type of a term, whereas we need to record
the types of all the constants and variables contained
in the term, and end up having to record the
types of every subterm. This is a very simple modification
of the algorithm.

The type inference algorithm turns out to be
essentially a matter of solving equations.
For example, consider the concrete term
``$(λx⦁a = x)F$''.
This contains no explicit type information
at all. However the theory database contains
information about the types of the constants
in the term: ``$=$'' has the polymorphic type
``$:'a→'a→bool$'' and ``$F$'' has type ``$:bool$''.
It follows that the bound variable ``$x$'' must have type
``$:bool$'', whence the instance of ``$=$'' has type
`$:bool→bool→bool$'', whence the free variable ``$a$'' must
have type ``$:bool$''. Since this determines
the types of all the variables and constants in the
term, this is all the information we
need to construct the corresponding abstract term
using the term constructors.

To represent the above reasoning as equation solving,
we use an extension of the algebra of HOL types which
includes an infinite collection of type unknowns,
which we shall write as ``$?1$'', ``$?2$'' etc.
To each distinct variable in the concrete term we
assign a distinct type unknown. To each constant we
assign an instance of the type stored in the theory
database for the constant; this instance has each type
variable in the type replaced by a distinct type unknown.
String and numeric constants are a special case here ---
their types are supplied by the parser.
Thus the term in the example becomes:
=GFT Example
	(λx:?1⦁ ($=:?3→?3→bool) (a:?2) (x:?1))(F:bool)
=TEX
This results in the following equations, in which
additional type unknowns arise to represent the result
types of combinations:
=GFT Example
	?3 → ?3 → bool	=	?2 → ?4
	?4			=	?1 → ?5
	?1 → ?5		=	bool → ?6
=TEX
We solve these above equations using a technique called
unification which returns a solution to any finite
set of equations which is the most general solution.
Its substitution instances comprise all the solutions
to the equations.

This technique is explained in detail in chapter 9
of \cite{PeytonJones86}.
The technique uses the notion of substitutions, i.e.
functions from type unknowns to extended types, which
differ from the identity in at most finitely many
places. Such a substitution may be used
to represent the solution to a set of equations between
extended types. E.g. in our example above, the
substitution giving the solution is:
=GFT Example
	I ⊕ {?1 ↦ bool, ?2 ↦ bool, ?3 ↦ bool, ?4 ↦ bool → bool, ?5 ↦ bool, ?6 ↦ bool}
=TEX
To find the substitution which gives the most general
solution to a set of equations, we take the equations
one at a time. Clearly the identity substitution is the
most general solution to an empty set of equations and,
if we have the solution $\phi$ for a set of equations $S$,
we may extend it to a solution for the set
$S\,∪\,\{\tau_1 = \tau_2\}$, if a solution exists, by a
recursion over
the structure of the $\tau_i$. Roughly
speaking this reduces
to extending the solution for additional equations
of the form $?n = \tau$ and checking that the resulting
solution is compatible with structure of the $\tau_i$.
\subsection{Possible Enhancements}
Various forms of overloading of names have been
proposed for HOL. One such scheme could be implemented
by additions to the code here to resolve the overloading.

An explicit type constraint on a subterm or on a binding
occurrence of a variable are taken as requests that
the subterm or bound variable must have the type
indicated. It might be more desirable to allow the type
of the subterm or variable to be an instance of the
type. Thus, for example,
one could write ``$(f:'a→'a)(12,\,[T,\,F])$'' instead of
``$(f(12,\,[T,\,F])):num*(bool list)$''.
(The disadvantage would be that it could prove confusing
in some cases and in such cases the user has to work
a little to find out what is going on.)

\subsection{Naming Conventions}
\label{NamingConventions}

Many of the functions and variables
in this document are given the
same names as those used in chapter 9 of \cite{PeytonJones86}.

\section{THE STRUCTURE $Unification$}

We now start the structure Unification which contains
the unification algorithm and some associated data types
and utilities.

=DOC
signature ⦏Unification⦎ = sig
=DESCRIBE
$Unification$ is the signature comprising a suite
of functions used to compute the unifier of
two types.
=ENDDOC
\subsection{Extended Types}

The type of extended types (i.e. types containing type unknowns) is
the following type $EXTYPE$.
The extended type corresponding
to a type variable is $EXVAR$ and is either known or unknown.
This is characterised by the value contructors $Known$ and
$Unknown$.
The extended type $EXTYPE$ is then constructed using $EXVAR$.

=DOC
	datatype ⦏EXVAR⦎ = Known of string | Unknown of int;
	datatype ⦏EXTYPE⦎ = ExVartype of EXVAR | ExType of string * EXTYPE list;
=DESCRIBE
$EXVAR$ and $EXTYPE$ denote the type of extended types used
in unification and type inference.
=ENDDOC

\subsection{Substitutions}

Unification is carried out by using a substitution function.
This is a partial finite function mapping a type unknown
to an extended type.

=DOC
	type ⦏SUBS⦎

=DESCRIBE
$SUBS$ denotes the type of a substitution function. $SUBS$ is
an assignable data structure (based on dynamic arrays) allocated
by $new\_subs$, updated by $unify$ and $list\_unify$ and
re-initialised by $init\_subs$.
=ENDDOC

$sub\_type$ takes an extended
type and uses the substitution given by the finite function
$SUBS$ to yield an extended type, $EXTYPE$. The substitution
is repeatedly applied until no further substitution is made.
=DOC
	val ⦏sub_type⦎ : SUBS -> EXTYPE -> EXTYPE
=DESCRIBE
$sub\_type$ applies a substitution to a extended type.
=ENDDOC

The function $extype\_to\_type$ translates an extended type
to a type. Since not all extended types have a
corresponding type (ie. unknown types), special action
is required to handle these cases. If an
attempt is made to translate a type unknown, then
$extype\_to\_type$ will create a new name for the type according
to the name map supplied as the second argument.

The function $type\_\to\_extype$ converts a type into
an extended type. The function is total.

=DOC
	val ⦏extype_to_type⦎ : SUBS -> ((int * string) list) -> EXTYPE -> TYPE
	val ⦏type_to_extype⦎ : TYPE -> EXTYPE

=DESCRIBE
The first parameter to $extype\_to\_type$ is the substitution
function. A mapping of type unknowns to names constitutes
the second parameter. The third parameter is the extended type
to be translated.

The function $type\_to\_extype$ converts a type to
an extended type.
=FAILURE
14003	No entry for type unknown ?0 found in the name-map
=ENDDOC

The following two functions create and initialize substitutions.
=DOC
	val ⦏new_subs⦎ : int -> SUBS
	val ⦏init_subs⦎ : SUBS -> unit
=DESCRIBE
$new\_subs$ creates a new substitution which is initially
the identity function. The initial array size to be used is passed as
a parameter. A typical value (for the HOL type
inferrer) might be 100.
$init\_subs$ takes a substitution and changes it to be
the identity function as a side-effect.
Since the memory occupied by a substitution will grow as unifications
proceed, callers are recommended to re-initialise substitutions
after use as well as before.
=ENDDOC

\subsection{Unification functions}

The function $unify$ computes the unifier of two
extended types and modifies the substitution as
a side-effect. This new substitution
can later be applied to type unknowns in a term to
find out what they are. If the unification fails then
an exception is raised.
=DOC
	val ⦏unify⦎ : SUBS -> EXTYPE * EXTYPE -> unit

=DESCRIBE
$unify$ computes the unifier of two
extended types with respect to a substitution function.
The unifier is in the form of a substitution function which
is computed as a side-effect.
=FAILURE
14001	Failed to unify type constructors ?0 with ?1.
14002	Unification would cause a loop.
=ENDDOC

It will also be useful to have a function which computes
the unifier of a list of types.

=DOC
	val ⦏list_unify⦎ : SUBS -> EXTYPE list -> unit
=DESCRIBE
The function $list\_unify$ computes the unifier of
a list of extended types and changes the substitution as
a side-effect.
=ENDDOC

\subsection{Further Utilities}

The process of unifying two types requires a supply
of unique names. The utilities $start\_again$,
$next\_name$ and $new\_name$ serve this purpose.

=DOC
	val ⦏start_again⦎ : unit -> unit
	val ⦏next_name⦎ : unit -> int
=DESCRIBE
$start\_again$ resets the internal record of the
next number to be generated to zero.
$next\_name$ will generate the next number in a sequence.
=ENDDOC

=DOC
	val ⦏new_name⦎ : 'a list -> ('a * int) list
=DESCRIBE
$new\_name$ associates each item in the argument list
with a unique number. It returns a list of pairs. The
first of each pair is item and the second is the
unique number.
=USES
$new\_name$ is used when converting types to extended
types to supply a list of distinct type unknown names.
=ENDDOC

=DOC
	val ⦏replaced⦎ : TYPE -> EXTYPE
=DESCRIBE
$replaced$ is used whenever a constant is encountered
to give an extended type for the constant. Since the
same constant may have its type instantiated differently
at different instances in the same term, we replace all the
type variables in the new type by type unknowns using a
different set of type unknowns on every invocation.
=ENDDOC


This completes the signature for the structure Unification.
=SML
end; (* of signature Unification *)
=TEX


\section{TEST POLICY}

The tests should follow the standards and guidelines laid down in \cite{DS/FMU/IED/PLN008}.
The design and implementation should be close to that
of the ICL HOL prototype described in \cite{DS/FMU/IED/SML007}.
It is suggested that particular attention be given to
testing the
areas which are new to this implementation of unification
as highlighted in section \ref{BackgroundandPurpose}.


\twocolumn[\section{INDEX OF DEFINED TERMS}]
\printindex
\end{document}




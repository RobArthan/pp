=IGN
********************************************************************************
imp006.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  imp006.doc  ℤ $Date: 2014/04/12 16:03:18 $ $Revision: 1.69 $ $RCSfile: imp006.doc,v $
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

\def\Title{Implementation for Abstract Data Type $THM$}

\def\AbstractText{}

\def\Reference{DS/FMU/IED/IMP006}

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
%% LaTeX2e port: \TPPproject{FST PROJECT}  %% Mandatory field
%% LaTeX2e port: \TPPtitle{Implementation for Abstract Data Type $THM$}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Implementation for Abstract Data Type $THM$}
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP006}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.69 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2014/04/12 16:03:18 $ %
%% LaTeX2e port: }}  %% Mandatory field
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.~Blackburn & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{}
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

\subsection{Changes History}
\begin{description}
\item [Issue 1.1 (1991/05/03)]
First version.
\item [Issue 1.2 (1991/05/07),1.3 (1991/05/09),1.4 (1991/05/13)]
Still being created.
\item [Issue 1.5 (1991/05/15)]
First version working with a version of \cite{DS/FMU/IED/DTD006}.
\item [Issue 1.6 (1991/05/16)]
Minor Corrections.
Functions more closely related to the specifications.
\item [Issue 1.7 (1991/05/20)]
Added $get\_constant\_type$ and $get\_type\_arity$.
\item [Issue 1.8 (1991/05/20)]
Prevented negative arity types.
$icl'get\_theory\_name$ no longer given deleted theory names.
Corrected some $fail$ calls.
\item [Issue 1.9 (1991/05/21)]
Replaced local $set\_equal$ with function from utilities.
Removed open dictionaries statement.
\item [Issue 1.10 (1991/06/06)]
Corrections after comments by RDA.
No external functionality change, merely tidying up.
\item [Issue 1.11 (1991/06/17)]
Made the function $icl'list\_simple\_∀\_elim$ primitive, rather than $icl'simple\-\_∀\-\_elim$.
Renamed $get\_constant\_type$ as $get\_const\_type$.
Added $icl'seal\_hierarchy$.
\item [Issue 1.12 (1991/06/17)]
Use $term\_mem$ etc.
\item [Issue 1.13 (1991/06/19)]
Corrected error message, and execution, of $list\_simple\_∀\_elim$.
\item [Issue 1.14 (1991/06/27)]
Errors 6008, 6032, 6036, 6041, 6065, 6066, 6070, 6072, 6073, 6074, 6083 are now all raised by $error$ not $fail$
(only some were before).
The name atom ``theorem(s)'' has been consistently changed
to ``thm(s)'',
and ``definition(s)'' to ``defn(s)''.
Corrected result of $get\_con\_env\ ""$.
\item [Issue 1.15 (1991/07/10)]
Change the flag character used for character literals.
\item [Issue 1.16 (1991/07/11)]
Corrected a flaw in $icl'open\_theory$ concerning scopes.
\item [Issue 1.17 (1991/07/12)]
Corrected a flaw in $icl'new\_parent$ concerning scope checking.
Added $valid\_thm$.
\item [Issue 1.18 (1991/07/29)]
Changed as result of changes caused by IR0016.
\item [Issue 1.19 (1991/07/29),1.20 (1991/08/05)]
Changes to match issue 1.17 of \cite{DS/FMU/IED/DTD006}.
\item [Issue 1.21 (1991/08/06)]
Eliminated message 6009.
Catch $mk\_const$ errors.
\item [Issue 1.22 (1991/08/07)]
Fixed the use of message 6061.
\item [Issue 1.23 (1991/08/14)]
Changes in response to ID0021.
\item [Issue 1.24 (1991/08/15)]
Renamings of functions containing the name atom $simple$,
and renaming of $aconv$.
\item [Issue 1.25 (1991/09/03)]
Corrected $icl'new\_parent$, to ensure it checks for clashes in children of current theory.
\item [Issue 1.26 (1991/09/04),1.27 (1991/10/07)]
Tidying up prior to a desk check.
\item [Issue 1.28 (1991/11/07)]
Correcting problems to do with saving and getting hierarchies.
\item [Issue 1.29 (1991/11/11),1.30 (1991/11/12)]
Added $icl'plus\_conv$, removed $icl'div2\_conv$ and $icl'mod2\_conv$,
following change request CR007.
\item[Issue 31, \FormatDate{92/01/20} ] Updated to use new fonts.
\item [Issue 1.32 (1992/01/23)]
Changes to using sparse arrays from \cite{DS/FMU/IED/DTD001},
rather than local structure.
\item [Issue 1.33 (1992/02/07)]
Fixed a bug in $new\_parent$.
\item [Issue 1.34 (1992/02/10) ]
Put $translate\_for\_output$ around uses of $makestring$.
\item [Issue 1.36 (1992/04/14) (13th April 1992)]
Changes due to CR0017.
\item [Issue 1.37 (1992/05/06) (6th May 1992)]
$icl'load\_hierarchy$ sets $inscope$ fields correctly.
\item [Issue 1.38 (1992/05/20) (20th May 1992)]
Added $icl'get\_pervasive\_theory\_name$.
\item [Issue 1.39 (1992/05/21) (21st May 1992)]
Improved 6056.
\item [Issue 1.40 (1992/06/01) (1 June 1992)]
Do not do a $translate\_for\_output$, undo change~1.34.
\item [Issue 1.41 (1992/07/14) (14th July 1992)]
Collapsed error 6052 into 6051.
\item [Issue 1.42 (1992/08/12) (12th August 1992)]
Improved error handling of $valid\_thm$.
\item [Issue 1.43 (1992/08/13) (13th August 1992)]
Corrected error handling for interrupts.
\item [Issue 1.44 (1993/01/18) (18th January 1993)]
Made inconsistency ``flag'' part of a hierarchy.
\item [Issue 1.45 (1994/11/04) (4th November 1994)]
Fixed bug 167.
\item [Issue 1.46 (1999/02/11) (11th February 1999)]
Update for SML'97.
\item[Issue 1.47 (1999/03/06)] Use of new INTEGER type.
\item[Issue 1.48 (2001/07/30)] Performance improvement in {\it icl'inst\_term\_rule}.
\item[Issue 1.49 (2002/05/29)] Performance improvement when checking new constant and type names: removed
redundant linear search of current theory.
\item[Issues 1.49 (2002/05/29)-1.53 (2002/06/03)] Performance improvement when checking additions to the theory: removed
redundant linear search of current theory for constant names and type names and introduced ordered
efficient dictionaries for axiom, definiition and theorem keys. (Note: issue 1.50 involved an experiment
that was backed out at issue 1.51.)
\item[Issue 1.54 (2002/06/03)] Now need to look after the state of the types and terms module.
\item[Issue 1.56 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.57 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.58 (2002/12/11)] Removed unnecessary level of indirection from the {\it USER\_DATA} data type.
\item[Issue 1.59 (2005/04/18)]
The inference rules now report error messages without the icl' prefix on the source function name.
This saves the need to remap the names in the interface functions.
\item[Issue 1.60 (2005/09/05)]
Brought handling of initial state of the abstract data type of types and terms into line with intended design.
\item[Issues 1.61 (2005/12/14)--1.63 (2005/12/15)] Kernel interface and symbol table reform.
\item[Issue 1.64 (2005/12/16)] Now using $pp'$ instead of $icl'$ to prefix private interface names.
\item[Issue 1.65 (2006/01/26)] Added $pp'step\_current\_level$.
\item[Issue 1.66 (2009/06/10)] Fixed checks for clashing types and constants when a new parent is added.
\item[Issue 1.67 (2012/09/02)] {\em plus\_conv} now does the addition directly on the digit strings rather than
converting to integers and back again.
\item[Issue 1.68 (2014/04/12)] Fixed some cosmetic issues and rationalised some error handling
in preparation for implementing
=INLINEFT
gen_new_spec
=TEX
.
\item[Issue 1.69 (2014/04/12)] Implemented
=INLINEFT
gen_new_spec
=TEX
.
\item[Issue 1.70 (2014/04/14)] Improved error handling in
=INLINEFT
gen_new_spec
=TEX
\ and
=INLINEFT
new_spec
=TEX
.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
% \subsection{Changes Forecast}
\section{GENERAL}
\subsection{Scope}
This document contains an implementation of the abstract data type $THM$.
This includes its
primitive and built-in inference rules,
and its theory management material.
This is called for in section 4 of \cite{DS/FMU/IED/HLD007}.
The high-level specification for the code is
given in \cite{DS/FMU/IED/SPC003}, \cite{DS/FMU/IED/SPC004} and \cite{DS/FMU/IED/SPC005}.
The design is in \cite{DS/FMU/IED/DTD006}.
\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains an implementation of the
abstract data type $THM$.
This includes its
primitive and built-in inference rules,
and its theory management material.
A ``primitive'' inference rule is considered to be part of the logic,
whereas a built-in rule is one that, though it could be coded in terms
of the primitive rules, will actually be part of the abstract data type $THM$, and thus taken as holding true without checking.

We have to assume that single assignments cannot be interrupted,
but that any sequence of commands may be.
We need to maintain consistency between certain parts of state,
and thus we have some protected functions,
see section \ref{Inconsistent}.

When handling hierarchies it should be borne in mind that
the only function that may change the address of the current
hierarchy is $pp'load\_hierarchy$.
This is so that the addresses in $pp'new\_hierarchy$
remain current until the next $pp'load\_hierarchy$.
\subsubsection{Dependencies}
This document takes its signature from \cite{DS/FMU/IED/DTD006},
and also requires those files indicated as preceding it in the
rel001 makefile.
\subsubsection{Deficiencies}
None known.
\subsubsection{Possible Enhancements}
None known.

\newpage
\section{INTERRUPTS AND INCONSISTENCY}
\label{Inconsistent}
There are three activities we sometimes wish to do in uninterruptable combinations.
Interrupts might be, for instance, due to the user pressing Control-C, or the program running out of machine resources.
\begin{description}
\item[1]
``In place'' modification of $pp'THEORY\_INFO$s within the hierarchy, using the fact that the hierarchy is an (imperative-style) array and using array assignment.
\item[2]
Changes to the current state, other than ``in place''.
In particular, modifications to the type and constructor environments $ty\-\_env$ and $con\-\_env$.
\item[3]
Assignments to the current theory address, to update the theory rather than change the theory that is current.
\end{description}
If combinations of these were interrupted they might lead to some of the following:
\begin{itemize}
\item
The type or constructor environments containing items that are not actually within any theory in scope.
This can cause theorems to be apparently valid, when in fact they are not.
\item
The type or constructor environments failing to contain items that are actually within some theory in scope.
This could allow the redefinition of such things while theorems concerning
the old definition are still in scope
(and are made valid once more by the redefinition placing the items in the type or constructor environment).
\item
A theory may have another as parent that does not record its child in its $children$ field
(we take the $parents$ field as definitive).
This would allow the parent to declare things that clashed with its child's contents, and would sometimes allow the parent to be deleted
leaving an orphan.
\item
A theory may indicate it has another as a child, while the so-called child does not record the other as parent.
This will cause the parent to be unable to redefine things present in the so-called child that strictly it should be able to do.
This is not inconsistent, but only inconvenient.
\item
Having the $inscope$ fields inconsistent with the current theory and the parentage relation has the same problems as the $children$ field being inconsistent.
If the $inscope$ fields are inconsistent with the type and constant environments
then this will give rise to the same problems as if those are
inconsistent with the theory's contents.
\end{itemize}
These problems could occur in the following functions,
the numbers in brackets refer to the kind of changes made: 1, 2, or 3.

\begin{tabular}{| l | p{4.7in}|}\hline
Function & Combination \\ \hline
$pp'open\_theory$ & Multiple ``in place'' modifications to the hierarchy and environments, and a change of address for the current theory(1,2). \\
$pp'delete\_theory$ & Multiple ``in place'' modifications to the hierarchy: the deleted theory, and its parents. Can also leave
some garbage if interrupted(1). \\
$pp'new\_theory$ & Two ``in place'' modifications to the hierarchy
(the new theory and parent) (1). \\
$pp'duplicate\_theory$ & Multiple ``in place'' modifications to the hierarchy
(new theory and its parents)(1). \\
$pp'freeze\_hierarchy$ & Multiple ``in place'' modifications to the hierarchy
(all theories)(1). \\
$delete\_extension$ & Deletions from environments and an assignment to current theory address(2,3). \\
$pp'new\_const$ & Addition to constant environment and an assignment to current theory address(2,3). \\
$pp'new\_type$ & Addition to type environment and an assignment to current theory address(2,3). \\
$pp'new\_defn$ & Addition to constant environment and an assignment to current theory address(2,3). \\
$pp'new\_type\_defn$ & Addition to type environment and an assignment to current theory address(2,3). \\
$pp'new\_spec$ & Additions to constant environment and an assignment to current theory address(2,3). \\
$pp'new\_parent$ & Additions to constant and type environments, an assignment to current theory address, and ``in place'' modifications to the hierarchy (new parent and current theory)(2,3). \\ \hline
\end{tabular}

These problems occur because we maintain ``value added'' copies of
definitive information, usually to increase speed.
One solution would be to eliminate the copies, and accept the time
cost: this seems an unreasonable deal, and might not solve the
problem.
Another solution would be to maintain a backup of the entire system
to be reverted to in the case of an error.
This would have a time penalty, would have to be careful in
avoiding introducing inconsistencies, and might be vulnerable to multiple interrupts.

We choose as a solution the introduction of a boolean flag in $HIERARCHY$ (q.v.),
that is set on entering a block of code that is dangerous if interrupted,
and reset on exiting normally.
An interrupt will leave the flag set.
All validity checkers, in particular $check\_thm$ (q.v.)
and $check\_c\_writable$
(``check current theory writable'', q.v.),
will check the flag, and if it is set then the validity check will fail.
Thus an unfortunately timed interrupt could render the system ``you can look, but you can't touch''.
This is indicated by the error message:

=GFT Error Declaration
6083	STATE WAS FOUND TO BE INCONSISTENT: state is now read-only, and
	you are advised to quit ICL HOL. Do not commit the ML database.
=TEX

\section{THE ABSTRACT DATA TYPE $THM$}
=SML
structure ⦏pp'Kernel⦎ : pp'Kernel = struct
=TEX
\subsection{Utilities}
=SML
fun ⦏max⦎ (a:int) (b:int) : int = if a > b
	then a
	else b;
=TEX
The following is a function to give the maximum of a list of numbers.
The maximum of n empty list is $0$ (could be made a fail).
=SML
fun ⦏list_max⦎ ([]: int list): int = 0
| list_max (a :: x) = (
let	fun aux (sf:int) ((p :: q):int list) : int = (
	if sf < p
	then aux p q
	else aux sf q
	) | aux sf [] = sf;
in
	aux a x
end);
=TEX
Give a list of HOL type variables $'1, '2,\ldots$:
=SML
fun ⦏ntyvars⦎ (n : int) : TYPE list = (
	map (fn x=> mk_vartype("'"^string_of_int x))
		(interval 1 n)
);
=TEX
Find two elements that are the same (presuming $all\_different$ has failed):
=SML
fun ⦏two_the_same⦎ ((a :: x): ''a list) : ''a = (
	if a mem x
	then a
	else two_the_same x
) | two_the_same _ = error "two_the_same" 6032 [];
=TEX
=SML
fun ⦏st_equals⦎ (((nm1,ty1):string * TYPE), ((nm2,ty2):string * TYPE))  : bool = (
	nm1 = nm2 andalso ty1 =: ty2
);
=TEX
\subsubsection{Ranges}
We are interested in supporting ranges of deleted levels,
but the code can be given in isolation from
the type of theories.

We are interested in a list of numbers,
\[ [ (a_{1},\ b_{1}),\ (a_{2},\ b_{2}),\ ...,\ (a_n,\ b_n)]\]
where $b_{i-1}$ is always less than $a_i$,
$0\ <\ a_1$,
and $a_i$ is always less than or equal to $b_i$.

First, we wish to check whether a number fails inside any of the ranges $a_i$ to $b_i$.
=SML
fun ⦏range_mem⦎ (v : int, [] : (int * int)list) = false
| range_mem (v, ((a,b) :: x)) = (
	(v >= a) andalso
	((v <= b) orelse range_mem(v, x))
);
=TEX
Second, we wish to extend the range by adding (a,b), which may enclose other ranges.
=SML
fun ⦏extend_range⦎ (a:int,b:int) ([]:(int * int)list): (int * int)list= (
	[(a,b)]
) | extend_range (a,b) (lst as ((a1,b1) :: x)) = (
let
	fun fixb lw (lst1 as ((a2,b2) :: x1)) = (
		if b + 1 < a2
		then ((lw,b) :: lst1)
		else if b <= b2
		then ((lw,b2) :: x1)
		else fixb lw x1
	) | fixb lw [] = [(lw,b)];
in
	if a < a1
	then fixb a lst
	else if b1+1 < a
	then ((a1,b1) :: extend_range (a,b) x)	
	else fixb a1 lst
end);
=IGN
val p = [(1,2), (6,8), (10,10), (12,13)];
extend_range (0,3) p;
extend_range (4,4) p;
extend_range (5,5) p;
extend_range (11,15) p;
extend_range (11,11) p;

=TEX
We will use the dynamic array material of \cite{DS/FMU/IED/DTD001}
=SML
open DynamicArray;
=TEX
\subsection{Types of the ADT $THM$}
A fragment of some user data, and a collection of such
fragments:
=SML
datatype ⦏USER_DATUM⦎ =
	⦏UD_Term⦎ of TERM * (USER_DATUM list) |
	⦏UD_Type⦎ of TYPE * (USER_DATUM list) |
	⦏UD_String⦎ of string * (USER_DATUM list) |
	⦏UD_Int⦎ of int * (USER_DATUM list);

type ⦏USER_DATA⦎ = USER_DATUM S_DICT;
=TEX
The type of sequents:
=SML
type ⦏SEQ⦎ = TERM list * TERM;
=TEX
The type of the theory status:
=SML
datatype ⦏THEORY_STATUS⦎ =
	⦏TSNormal⦎ | ⦏TSLocked⦎ | ⦏TSAncestor⦎ | ⦏TSDeleted⦎;
=TEX
=SML
abstype ⦏THM⦎ = ⦏Thm⦎ of {
		level : int,
		theory : pp'THEORY ref,
		sequent : SEQ}
and
	⦏pp'THEORY⦎ = ⦏Thy⦎ of {
		name : int,
		ty_env : {arity:int, level:int} OE_DICT,
		con_env : {ty:TYPE, level:int} OE_DICT,
		parents : int list,
		del_levels : (int * int) list,
		axiom_dict : THM OE_DICT,
		defn_dict : THM OE_DICT,
		thm_dict : THM OE_DICT,
		current_level : int,
		user_data : USER_DATA ref}
and
	⦏pp'THEORY_INFO⦎ = ⦏ThyInfo⦎ of {
		status : THEORY_STATUS,
		inscope : bool,
		contents : pp'THEORY ref,
		children : int list,
		name : string}
and
=TEX
In a hierarchy there will be:
\begin{itemize}
\item
A boolean flag which is $false$ if the hierarchy is consistent, and true otherwise.
If a new hierarchy is loaded then the new consistency will be the new flag alone.
I.e. the new hierachy is not necessarily recorded as inconsistent if the old one was.
\item
An array of theory information blocks.
This will contain theories with internal names $0$ to length of array, though some may have the status ``deleted''.
\item
A state for the types and terms module.
\end{itemize}
=SML
	⦏pp'HIERARCHY⦎ =
	⦏hier⦎ of bool ref * pp'THEORY_INFO DYNAMIC_ARRAY * TYPES_AND_TERMS_STATE
=TEX
There now follows the body of the $abstype$:
=SML
with
=TEX
\subsection{The Interface Theory Type}
The interface presentation of $pp'THEORY$:
=SML
type ⦏THEORY⦎ = {
		name : int,
		ty_env : {arity:int, level:int} OE_DICT,
		con_env : {ty:TYPE, level:int} OE_DICT,
		parents : int list,
		del_levels : (int * int) list,
		axiom_dict : THM OE_DICT,
		defn_dict : THM OE_DICT,
		thm_dict : THM OE_DICT,
		current_level : int,
		user_data : USER_DATA ref};
=TEX
\subsection{The State Type}
$hierarchy$ is the current theory hierarchy.
$theory$ is the reference to the current theory as held in the theory hierarchy, so that assignments
to it will update the stored contents.
$in\_scope$ is the list of theories that are in scope (this could be inferred from the current
theory, but it is more efficient to have it available directly).
$sealed$ is the integer index of the sealed theory.
=SML
type ⦏STATE⦎ = {hierarchy : pp'HIERARCHY,
	theory : pp'THEORY ref,
	in_scope : int list,
	sealed : int};
=TEX
\subsection{Interface Types}
=SML
type ⦏THEORY_INFO⦎ = {
		status : THEORY_STATUS,
		inscope : bool,
		contents : THEORY,
		children : int list,
		name : string};

type ⦏HIERARCHY⦎ = (string * THEORY_INFO) list;
=TEX
\subsection{The Type of Conversions}
=SML
type ⦏CONV⦎ = TERM -> THM;
=TEX
\subsection{Equalities}
The following doesn't require very much from the ADT,
and could be moved out.
=SML
fun ⦏list_eq⦎ eq (a :: x) (b :: y) = eq (a,b) andalso list_eq eq x y
| list_eq eq [] [] = true
| list_eq eq _ _ = false;
=TEX
=SML
fun sequal (eq:'a * 'a -> bool) ([]: 'a list) ([]:'a list) : bool = true
| sequal _ [] _  = false
| sequal _ _ [] = false
| sequal eq (a1 :: x1) l2 = (
let fun aux acc (a2 :: x2) = (
	if eq (a1, a2)
	then (true, acc @ (x2 drop (fn v => eq(v, a1))))
	else aux (a2 :: acc) x2
	) | aux acc [] = (false, []);

	val (ok,res) = aux [] l2;
in
	ok andalso (sequal eq (x1 drop (fn v => eq(v, a1))) res)
end);

fun ((asms1,conc1):SEQ) ⦏=#⦎ ((asms2,conc2):SEQ) = (
	conc1 =$ conc2
	andalso list_eq (op =$) asms1 asms2
);

fun ((asms1,conc1):SEQ) ⦏~=#⦎ ((asms2,conc2):SEQ) = (
	conc1 ~=$ conc2
	andalso sequal (op ~=$) asms1 asms2
);

fun (Thm {sequent=seq1,...}:THM) ⦏=|-⦎
	(Thm {sequent=seq2,...}:THM) = seq1 =# seq2;
fun (Thm {sequent=seq1,...}:THM) ⦏~=|-⦎
	(Thm {sequent=seq2,...}:THM) = seq1 ~=# seq2;
=TEX
\subsection{Formatting Theorems and Theorem Failures}
=TEX
=SML
val ⦏pp'string_of_thm_ref⦎ : (THM -> string) ref =
	ref (fn _ : THM => "<THM>");
fun ⦏pp'set_string_of_thm⦎ (f : THM -> string) : THM -> string = (
	let	val res = !pp'string_of_thm_ref;
	in	pp'string_of_thm_ref := f;
		res
	end
);
fun ⦏string_of_thm⦎ (tm : THM) : string = (
	! pp'string_of_thm_ref tm
);
=SML
fun ⦏thm_fail⦎ (area : string) (msg : int) (thml : THM list) : 'a = (
	fail area msg (map (fn x => fn () => string_of_thm x) thml)
);
=TEX
We often wish to destroy a theorem equation into its assumptions, LHS and RHS,
giving an error if it fails:
=SML
fun ⦏dest_thm_eq⦎ (area : string) (msg : int) (thm as Thm{sequent=(asms,concl),...} : THM)
	: (TERM list * (TERM * TERM)) = (
	(asms,dest_eq concl)
	handle complaint =>
	case (area_of complaint) of
	"dest_eq" => thm_fail area msg [thm]
	| _ => reraise complaint (area_of complaint)
);
=TEX
\subsection{The Initial State}
The following is a function to give an empty theory, for initialisation
or deletion purposes.
The $pnts$ (for ``parents'') are given as a list type to give a simple ``optional'' value method.
=SML
fun ⦏empty_theory⦎ (nm: int) (pnts : int list) : pp'THEORY = (
	Thy{name = nm,
	 ty_env = initial_oe_dict,
	 con_env = initial_oe_dict,
	 parents = pnts,
	 del_levels = [],
	 axiom_dict = initial_oe_dict,
	 defn_dict = initial_oe_dict,
	 thm_dict = initial_oe_dict,
	 current_level = 0,
	 user_data = ref initial_s_dict}
);
=TEX
The following initialises the ``current state'', which is a $ref$ variable called $current$.
Initially it contains the empty theory "min" (with index 0), alone, as the current theory, which is also the sealed theory, with empty environments
(except that the constant environment always contains the numeric, string and character literal constants).

=SML
local
	val min = ref (empty_theory 0 []);

	val min_ti = ThyInfo{status = TSNormal,
		inscope = true,
		contents = min,
		children = [],
		name = "⦏min⦎"};

	val init_hier_ia : pp'THEORY_INFO DYNAMIC_ARRAY = array 100;

	val dummy = update(init_hier_ia, 0, min_ti);

	val types_and_terms_state = new_types_and_terms_state();

	val _ = set_types_and_terms_state types_and_terms_state;

	val init_hier : pp'HIERARCHY =
		hier (ref false, init_hier_ia, types_and_terms_state);
in
	val ⦏current⦎ : STATE ref = ref {
		hierarchy = init_hier,
		theory = min,
		in_scope = [0],
		sealed = 0};
end;
=TEX
Pointers into the current state:
=SML
fun ⦏current_hierarchy⦎ (():unit) : pp'HIERARCHY = (
let	val {hierarchy=hierarchy,...} = !current
in
	hierarchy
end);

fun ⦏current_theory⦎ (():unit) : pp'THEORY = (
let	val {theory=theory,...} = !current
in
	!theory
end);
=TEX
\subsection{The Scope of Types and Constants}
We will need to be able to rapidly check where HOL terms, types
and their derivatives are well-formed.
Well-formedness is just that the HOL type constructors and constants are in scope, with the right usage.
To do this efficiently we need a fast lookup facility for
type constructors and constants in scope.

=TEX
The following functions look up a named entry in the value constructor or type constructor scopes.
These two functions could be made available to the user or interface
document, to allow, if nothing else, a ``what caused the well-formedness check to fail'' function to be written.
The constant environment always contains the numeric, string and character literal constants.
=SML
local
	val ordquote = ord("`");
	val orddquote = ord("\""); (* " *)
	val ord0 = ord("0");
	val ord9 = ord("9");
in
fun ⦏get_con_env⦎ (opt_thyn : int OPT)
	(nm : string): {ty:TYPE, level:int} OPT = (
let	val {in_scope, hierarchy = hier(_, lookup, _), ...} = !current;
	val ordnm = ord nm handle Ord => 0;
in
	if (ordnm = ordquote) andalso (size nm = 2)
	then Value {ty=CHAR, level = 0}
	else if	(ordnm = orddquote)
	then Value {ty = STRING, level = 0}
	else if	(ord0 <= ordnm andalso ordnm <= ord9 andalso
		(is_all_decimal nm))
	then Value {ty = ℕ, level = 0}
	else 	let	val k = e_get_key nm;
			fun aux [] = Nil
			|    aux (thyn::more) = (
				let	val ThyInfo {contents = ref thy, ...} = sub(lookup, thyn);
				val Thy {con_env, ...} = thy;
				in	case oe_key_lookup k con_env of
						Nil => aux more
					|	got_it => got_it
				end	handle Fail _ => Nil
			);
		in	case opt_thyn of
				Nil => aux in_scope
			|	Value thyn => aux [thyn]
		end
end
);
end;

fun ⦏get_ty_env⦎ (opt_thyn : int OPT)
	(nm : string):{arity:int, level:int} OPT = (
let	val {in_scope, hierarchy = hier(_, lookup, _), ...} = !current;
	val k = e_get_key nm;
	fun aux [] = Nil
	|    aux (thyn::more) = (
		let	val ThyInfo {contents = ref thy, ...} = sub(lookup, thyn);
			val Thy {ty_env, ...} = thy;
		in	case oe_key_lookup k ty_env of
				Nil => aux more
			|	got_it => got_it
		end	handle Fail _ => Nil
	);
in	case opt_thyn of
		Nil => aux in_scope
	|	Value thyn => aux [thyn]
end);
=TEX
\subsection{Utilities Depending on ADT State and Types}
\subsubsection{Well-formedness}
The following are functions to check whether a type, term or theorem is well-formed within the current scope:
they give rise to an appropriate error message if not.

We choose to make a set of all types and constants to be checked,
and then check each set member, rather than check all generated
items, as this is judged superior in speed.
=SML
local
	fun auxty (caller:string) fw [] = ()
	| auxty caller fw ((tnm,arit) :: x) = (
		let val res = get_ty_env Nil tnm
		in
		case res of
		Value{arity=arity,...} => (
			if (arit=arity)
			then auxty caller fw x
			else fail caller 6014 [fw,fn () => tnm]
		) | Nil => fail caller 6013 [fw,fn () => tnm]
		end);

	fun auxcon (caller:string) fw [] = ()
	| auxcon caller fw ((cnm,typ) :: x) = (
		let val res = get_con_env Nil cnm
		in
		case res of
		Value{ty=ty1,...} => (
			if (is_type_instance typ ty1)
			then auxcon caller fw x
			else fail caller 6038 [fw,fn () => cnm]
		) | Nil => fail caller 6015 [fw,fn () => cnm]
		end);
in
	fun ⦏wf_type⦎ (caller : string) (ty : TYPE) : unit = (
	let	val tyv = type_tycons ty;
		val fw = (fn () => string_of_type ty);
	in
		auxty caller fw tyv
	end);

	fun ⦏wf_term⦎ (caller : string) (tm : TERM) : unit = (
	let	val tyv = term_tycons tm;
		val con = term_consts tm;
		val fw = (fn () => string_of_term tm);
	in
		(auxty caller fw tyv; auxcon caller fw con)
	end);

	fun ⦏wf_thm⦎ (caller : string) (thm : THM as Thm{sequent = (tml,tm),...}) : unit = (
	let	val tyv = list_cup (term_tycons tm ::
			map term_tycons tml);
		val con = list_union st_equals (term_consts tm ::
			map term_consts tml);
		val fw = (fn () => string_of_thm thm);
	in
		(auxty caller fw tyv; auxcon caller fw con)
	end);
end; (* of local fun auxty... *)
=TEX
The following is a function to check that a theorem is valid, fail if not.
Note that we do not check the well-formedness of the sequent,
as this is not required by the specification.
=SML
fun ⦏check_thm⦎ (caller: string)
	(thm as Thm {level = level, theory=theory, ...} : THM) : unit = (
let	val {hierarchy = hier (inconsistent,lookup, _),...} = !current;

	val Thy{name = iname, del_levels = del_levels, ...} = !theory;
	
	val dummy = if !inconsistent
		then error caller 6083 []
		else if (0 <= iname) andalso (iname <= uindex lookup)
		then ()
		else error caller 6072 [fn () => string_of_thm thm,
			fn () => "Internal "^string_of_int iname];

	val ThyInfo{status = status,
		inscope = inscope,
		contents = contents,
		children = children,
		name = ename}
		= sub(lookup,iname);
in
	if status = TSDeleted
	then error caller 6036 [fn () => string_of_thm thm,
		(fn () => ename),
		(fn () => string_of_int iname)]
	else if theory <> contents
	then error caller 6072 [fn () => "Internal "^string_of_int iname]
	else if not inscope
	then error caller 6066 [fn () => string_of_thm thm,
		fn () => ename]
	else if range_mem(level, del_levels)
	then error caller 6065 [fn () => string_of_thm thm,
		fn () => ename]
	else ()
end);
=TEX
In the following we deliberately catch all errors, whether raised by $fail$ or $error$, to provide a test of whether $check\_thm$ will fail on a given theorem.
=SML
fun ⦏valid_thm⦎ (thm : THM) : bool = (
	(check_thm "valid_thm" thm; true)
	handle complaint =>
	case complaint of
	(Fail _) => false
	| Error _ => false
	| _ => raise complaint
);
=TEX
\subsubsection{Theory Names}
$pp'get\_current\_theory\_name$ is part of the ADT interface,
but it is useful in defining utilities, so we provide it ``out of sequence''.

Get the current theory's name as an integer:
=SML
fun ⦏pp'get_current_theory_name⦎ (():unit) : int = (
let	val Thy{name = name,...} = current_theory();
in
	name
end);
=TEX
Check that an internal name is within the range of the array and indexes a theory that has not been deleted failing if not,
with area being the $caller$ parameter.
Returns the name.
=SML
fun ⦏get_internal_theory_name⦎ (thyn : int) (caller : string) : string = (
let	val hier (inconsistent,lookup, _) = current_hierarchy();
in	if	0 <= thyn andalso thyn <= uindex lookup
	then	let val (ThyInfo{name=name, status=status,...}) = sub(lookup, thyn)
		in	if	status <> TSDeleted
			then	name
			else	fail caller 6089 [fn () => string_of_int thyn]
		end
	else	fail caller 6043 [fn () => string_of_int thyn]
end);
=TEX
The following is a test of whether the given theory name present at all.
A deleted theory will not be noted by this function.
There is always a current theory, ``-''.
=SML
fun ⦏is_theory_name⦎ (nm : string) : bool = (
let	val hier (inconsistent,lookup, _) = current_hierarchy();
	fun aux ~1 = false
	| aux n = (let val (ThyInfo{name=sname,status=status,...}) = sub(lookup, n);
		in
			((sname = nm) andalso (status <> TSDeleted))
			orelse aux (n-1)
		end)
in
	(nm = "-")
	orelse aux (uindex lookup)
end);
=TEX
Return the theory contents:
=SML
fun ⦏get_theory_contents⦎ (n : int) : pp'THEORY = (
let	val hier (inconsistent,lookup, _) = current_hierarchy();
	val (ThyInfo{contents=contents,...}) = sub(lookup, n);
in
	!contents
end);
=TEX
Return the current theory name as a string:
=SML
fun ⦏get_current_theory_name⦎ (():unit):string = (
let	val hier (inconsistent,lookup, _) = current_hierarchy();
	val Thy{name = iname,...} = current_theory();
	val (ThyInfo{name=ename,...}) = sub(lookup, iname);
in
	ename
end);
=TEX
\subsubsection{Checking Writability}
We give a check that the current theory status allows writing, with various fail messages if not.
Note that the current theory should never have status $TSDeleted$.
=SML
fun ⦏check_c_writable⦎ (caller : string) : unit = (
let	val {hierarchy = hier (inconsistent,lookup, _),
		theory = theory, ...} = !current;

	val Thy{name = iname,...} = !theory;

	val ThyInfo{status = status, name = ename,...} = sub(lookup,iname);

in
	if !inconsistent
	then error caller 6083 []
	else case status of
	TSDeleted => error caller 6008 [fn x=>ename]
	| TSAncestor => fail caller 6071 [fn x=>ename]
	| TSLocked => fail caller 6037 [fn x=>ename]
	| TSNormal => ()
end);
=TEX
\subsubsection{Ancestors and Descendants}
A function to return all of a theory's ancestors
(including itself):
=SML
fun ⦏pp'get_ancestors⦎ (nm : int) : int list = (
let	val hier (inconsistent,lookup, _) = current_hierarchy();

	fun lparents (n : int) = (
		let	val ThyInfo{contents=contents,...} = sub(lookup,n);
			val Thy{parents=parents,...} = !contents
		in
			parents
		end);

	fun allparents ([]:int list) (acc:int list) = acc
	| allparents (a :: x) acc = (
		if a mem acc
		then allparents x acc
		else allparents ((lparents a) cup x) (a :: acc));
in
	get_internal_theory_name nm "pp'get_ancestors";
	allparents [nm] []
end);
=TEX
A function to return all of a theory's descendants
(but not including itself):
=SML
fun ⦏pp'get_descendants⦎ (nm : int) : int list = (
let	val hier (inconsistent,lookup, _) = current_hierarchy();

	fun lchildren (n : int) = (
		let val ThyInfo{children=children,...} = sub(lookup,n);
		in
			children
		end);

	fun allchildren ([]:int list) (acc:int list) = acc
	| allchildren (a :: x) acc = (
		if a mem acc
		then allchildren x acc
		else allchildren ((lchildren a) cup x) (a :: acc));
in
	get_internal_theory_name nm "pp'get_descendants";
	allchildren (lchildren nm) []
end);
=TEX
We provide a datatype to encode the results of the following functions.
=SML
datatype ⦏THEORY_SCOPE⦎ = ⦏NotPresent⦎ | ⦏InScope⦎ | ⦏InDescendant⦎;
=TEX
Is a given constant name used in any ancestor or descendant of the
current theory?
=SML
fun ⦏const_in_anc_or_des⦎ (nm : string) : THEORY_SCOPE = (
let	val iname =pp'get_current_theory_name();
	
	val hier (inconsistent,lookup, _) = current_hierarchy();

	fun const_in_thy (k : E_KEY) (thry : int) : bool = (
	let val ThyInfo{contents = contents,...} = sub(lookup, thry);
		val Thy{con_env=con_env,...} = !contents;
	in
		not(is_Nil(oe_key_lookup k con_env))
	end);
in	
	if	is_Nil(get_con_env Nil nm)
	then	let	val k = e_get_key nm;
		in	if	any (pp'get_descendants iname less iname)
					(fn thry => const_in_thy k thry)
			then	InDescendant
			else	NotPresent
		end
	else	InScope
end);
=TEX
Is a given type constructor name used in any ancestor or descendant of the
current theory?
=SML
fun ⦏type_in_anc_or_des⦎ (nm : string) : THEORY_SCOPE = (
let	val iname = pp'get_current_theory_name();
	
	val hier (inconsistent,lookup, _) = current_hierarchy();

	fun type_in_thy (k : E_KEY) (thry : int) : bool = (
	let	val ThyInfo{contents = contents,...} = sub(lookup, thry);
		val Thy{ty_env=ty_env,...} = !contents;
	in
		not(is_Nil(oe_key_lookup k ty_env))
	end);
in	
	if	is_Nil(get_ty_env Nil nm)
	then	let	val k = e_get_key nm;
		in	if	any (pp'get_descendants iname less iname)
					(fn thry => type_in_thy k thry)
			then	InDescendant
			else	NotPresent
		end
	else	InScope
end);
=TEX
=SML
=TEX
The following function checks whether bringing a list of theories into scope would cause
a clash of constant names with a constant in an ancestor or descendant;
if so, it returns the first clashing constant name, otherwise Nil.
=SML
fun ⦏check_con_env⦎ (thys : int list) : string OPT = (
	let	val hier (_,lookup, _) = current_hierarchy();
		fun aux1 [] = Nil
		|    aux1 ((cn, _)::more) = (
			case const_in_anc_or_des cn of
				NotPresent => aux1 more
			|	_ => Value cn
		);
		fun aux2 [] = Nil
		|   aux2  (thyn::more) = (
			let	val ThyInfo {contents = ref thy, ...} = sub(lookup, thyn);
				val Thy {con_env = con_env, ...} = thy;
			in	case aux1 (oe_flatten con_env) of
					clash as Value _ => clash
				|	Nil => aux2 more
			end
		);
	in	aux2 thys
	end
);
=TEX
Similarly to the above, the following function checks whether bringing a list of theories into scope would cause
a clash of types names; if so, it returns the first clashing type name, otherwise Nil.
=SML
fun ⦏check_ty_env⦎ (thys : int list) : string OPT = (
	let	val hier (_,lookup, _) = current_hierarchy();
		fun aux1 [] = Nil
		|    aux1 ((tn, _)::more) = (
			case type_in_anc_or_des tn of
				NotPresent => aux1 more
			|	_ => Value tn
		);
		fun aux2 [] = Nil
		|   aux2  (thyn::more) = (
			let	val ThyInfo {contents = ref thy, ...} = sub(lookup, thyn);
				val Thy {ty_env = ty_env, ...} = thy;
			in	case aux1 (oe_flatten ty_env) of
					clash as Value _ => clash
				|	Nil => aux2 more
			end
		);
	in	aux2 thys
	end
);
=TEX
=SML
local
	fun ⦏modify_child⦎ (parents: int list)
		(modify : int list -> int list) : unit = (
	let	val hier (inconsistent,lookup, _) = current_hierarchy();
		fun aux (a :: x) = (
		let val ThyInfo{status = status,
			inscope = inscope,
			contents = contents,
			children = children,
			name = name} = sub(lookup,a)
		in
		update(lookup,a,
			ThyInfo{status = status,
			inscope = inscope,
			contents = contents,
			children = modify children,
			name = name});
			aux x
		end
		) | aux [] = ();
	in
		aux parents
	end);
in
=TEX
The following function removes theory $child$ from the children field
of each of its $parents$.
This will be used in $pp'delete\_theory$.
=SML
fun ⦏remove_child⦎ (child : int) (parents: int list) : unit = (
	modify_child parents (fn children => children less child)
);
=TEX
The following function adds theory $child$ to the children field
of each of its $parents$.
This will be used in $pp'new\_theory$ and
$pp'duplicate\_theory$.
=SML
fun ⦏add_child⦎ (child : int) (parents : int list) : unit = (
	modify_child parents (fn children => (child :: children))
);
end; (* of local fun modify_child ... *)
=TEX
\subsubsection{Hierarchies}
The following function maps $f$ over each of the theory information cells in the hierarchy.
As it is working through references it is misleading to
return any value.
=SML
fun ⦏map_hierarchy⦎ (f: (int * pp'THEORY_INFO) -> pp'THEORY_INFO)
	(hier (incons,lookup, _) : pp'HIERARCHY) : unit = (
let	val leng = uindex lookup;
	fun aux	n = (if n <= leng
		then (
		let val old_ti = sub(lookup, n)
		in
			update(lookup,n,f (n,old_ti));
			aux (n+1)
		end)
		else ());
in
	aux 0
end);
=TEX
Now a function to copy a hierarchy into a new one:
Note that when creating new hierarchies by copying we must copy from theory information 0 first, and then copy up to the number of hierarchies.
=SML
fun ⦏copy_hierarchy⦎ (hier (inconsistent,old_lookup, old_tnt_state) : pp'HIERARCHY) : pp'HIERARCHY = (
let	val new_lookup = array 100;
	val top_theory = uindex old_lookup;
	fun aux	n = (if n <= top_theory
		then (
		let	val old_ti = sub(old_lookup, n);
		in
			update(new_lookup,n,old_ti);
			aux (n+1)
		end)
		else ());
	val new_tnt_state = new_types_and_terms_state();

	val _ = set_types_and_terms_state old_tnt_state;

in
	(aux 0;
	hier (ref (!inconsistent),new_lookup, new_tnt_state))
end);
=TEX
We need a test to see if $hir1$ hierarchy is an ``ancestor'' of $hir2$.
According to the specification, this is so if the child possesses all the ancestors theories (by address comparison),
with the same theory information for each,
except that the children theories field may be different.
As new theories are always added to the ``tail'' of the theory hierarchy array we need only test up to the top theory of the ``ancestor''
hierarchy.
=SML
fun ⦏is_hierarchy_ancestor⦎ (hier (incons1,lookup1, _) : pp'HIERARCHY)
	(hier (incons2,lookup2, _) : pp'HIERARCHY) : bool = (
let	fun aux ~1 = true
	| aux n = (
	let	val (ThyInfo{status = status1,
			inscope = inscope1,
			contents = contents1,
			children = children1,
			name = name1})
		= sub(lookup1,n);

		val (ThyInfo{status = status2,
			inscope = inscope2,
			contents = contents2,
			children = children2,
			name = name2})
		= sub(lookup2,n)
	in
		(status1 = status2) andalso
		(contents1 = contents2) andalso
		(name1 = name2) andalso
		aux (n-1)
	end)
in
	(uindex lookup1 <= uindex lookup2) andalso
	aux (uindex lookup1)
end);
=TEX
\section{THEORY AND HIERARCHY FUNCTIONS OF ADT THM}
\subsection{Operations on Hierarchies}
These functions follow the specification of \cite{DS/FMU/IED/SPC005}.

The following sets all non-deleted theories to have
status TSancestor.
=SML
fun ⦏pp'freeze_hierarchy⦎ () : unit = (
let	val {hierarchy=hierarchy as hier(inconsistent,lookup, _), ...} = !current;
	val dummy = if !inconsistent
		then error "pp'freeze_hierarchy" 6083 []
		else ();
	fun make_anc (n , ThyInfo{status = status,
				inscope = inscope,
				contents = contents,
				children = children,
				name = name})
		=
		( ThyInfo{status = (if status = TSDeleted
					then TSDeleted
					else TSAncestor),
				inscope = inscope,
				contents = contents,
				children = children,
				name = name});
	val was_inconsistent = !inconsistent;
in
	inconsistent := true;

	map_hierarchy make_anc hierarchy; (* spec. step 1 *)

	inconsistent := was_inconsistent;
		(* spec. step 2 *)
	()
end);
=TEX

The following function gives the process of creating a new hierarchy from the current one,
but fails if any ancestor has status other than
$TSancestor$ or $TSdeleted$.
We first take a copy, we then modify its contents by reference,
we then make the current state have this new hierarchy as its current
one, as well as returning this value.
=SML
fun ⦏pp'new_hierarchy⦎ () : pp'HIERARCHY = (
let	val {hierarchy=hierarchy as hier(inconsistent,lookup, _), theory=theory, ...} = !current;
	val dummy = if !inconsistent
		then error "pp'new_hierarchy" 6083 []
		else ();
	fun test_anc (n , ti as ThyInfo{status = status,
				inscope = inscope,
				contents = contents,
				children = children,
				name = name})
		=
		if (status <> TSDeleted) andalso (status <> TSAncestor)
		then fail "pp'new_hierarchy" 6090 [fn () => string_of_int n]
		else ti;

	val hcopy = copy_hierarchy hierarchy;

	val dummy = map_hierarchy test_anc hcopy; (* spec. step ? *)

in
	hcopy (* spec. step ? *)
end);
=TEX
Now we give a ``load hierarchy'' function, as demanded by the specification.
As the current theory address doesn't change, and its contents and its ancestors are
equal, $ty\_env$ and $con\_env$ do not change.
The specification step 1 is irrelevant to our style of
implementation.

First a function, used with $map\_hierarchy$ to match the new hierarchies $inscope$ flags to the existing ones, or set them false.
After applying this only the $children$ field of the overlap
might differ, and the differences can only be aditional children in the new hierarchy.

We do not load the new hierarchy if either the new or the old are inconsistent.
=SML
local
fun match_scope (hier (_,flookup,_)):(int * pp'THEORY_INFO) -> pp'THEORY_INFO = (
let	val uflookup = uindex flookup
in
	fn (thn,
	thi as ThyInfo{status = status,
			inscope = inscope,
			contents = contents,
			children = children,
			name = name}) => (
	if thn <= uindex flookup
	then (let val ThyInfo{inscope=finscope,...} = sub(flookup, thn);
	in ThyInfo{status = status,
			inscope = finscope,
			contents = contents,
			children = children,
			name = name}
	end)
	else ThyInfo{status = status,
			inscope = false,
			contents = contents,
			children = children,
			name = name}
	)
end);
=TEX
=SML
in
fun ⦏pp'load_hierarchy⦎ (hir as (hier(inconsistent,lookup,tnt_state): pp'HIERARCHY)) : unit = (
let	val {hierarchy=hierarchy as hier(inconsistent1, old_lookup, _),
		theory=theory, in_scope = in_scope, sealed=sealed} = !current;
	val dummy = if !inconsistent
		then error "pp'load_hierarchy" 6092 []
		else ();
	val dummy = if !inconsistent1
		then error "pp'load_hierarchy" 6083 []
		else ();
in
	if is_hierarchy_ancestor hierarchy hir (* spec step 2 *)
	then 	(let
	val dummy = map_hierarchy (match_scope hierarchy) hir;
	in
	inconsistent := true; inconsistent1 := true;
		set_types_and_terms_state tnt_state;
		current := {hierarchy = hir, theory=theory, in_scope = in_scope, sealed=sealed}
			(* spec step 3 *);
	inconsistent := false; inconsistent1 := false
	end)
	else fail "pp'load_hierarchy" 6033 []
end
);
end; (* local fun match_scope ... *)
=IGN
pp'Kernel.pp'open_theory "min";
pp'Kernel.pp'freeze_hierarchy();
val temp = pp'Kernel.pp'new_hierarchy();
pp'Kernel.pp'new_theory "temp";
pp'Kernel.pp'open_theory "temp";
pp'Kernel.pp'new_const ("temp",mk_vartype "'a");
pp'Kernel.pp'new_theory "temp2";
pp'Kernel.pp'open_theory "temp2";
pp'Kernel.pp'new_const ("temp2",mk_vartype "'a");
pp'Kernel.pp'open_theory "min";
pp'Kernel.pp'load_hierarchy temp;
pp'Kernel.pp'open_theory "temp";
=TEX
Give an interface presentation of a theory:
=SML
fun ⦏theory_of_pp'theory⦎ ( Thy{
		name,
		ty_env,
		con_env,
		parents,
		del_levels,
		axiom_dict,
		defn_dict,
		thm_dict,
		current_level,
		user_data} : pp'THEORY ) : THEORY = (
	{	name = name,
		ty_env = ty_env,
		con_env = con_env,
		parents = parents,
		del_levels = del_levels,
		axiom_dict = axiom_dict,
		defn_dict = defn_dict,
		thm_dict = thm_dict,
		current_level = current_level,
		user_data = user_data}
);
=TEX
Give an interface presentation of the current hierarchy:
=SML
fun ⦏pp'get_hierarchy⦎ (():unit) : HIERARCHY = (
let	val hier (inconsistent,lookup, _) = current_hierarchy();
	fun aux ~1 = []
	| aux n = (let	val (ThyInfo{status = status,
				inscope = inscope,
				contents = contents,
				children = children,
				name = name}) = sub(lookup,n);
			val athy = !contents;
		in
			(name, {status = status,
				inscope = inscope,
				contents = theory_of_pp'theory athy,
				children = children,
				name = name})
			:: aux (n-1)
		end)
in
	aux (uindex lookup)
end);
=TEX
The bulk of the following is taken up with ensuring
that there will be no unopenable theories.
=SML
fun ⦏pp'seal_hierarchy⦎ () : unit = (
let	val {hierarchy=hierarchy as hier (inconsistent,lookup, _),
		theory=theory, in_scope = in_scope, sealed=sealed} = !current;
	val dummy = if !inconsistent
		then error "pp'seal_hierarchy" 6083 []
		else ();
	val top_theory = uindex lookup;

	val cthynm = pp'get_current_theory_name ();

	val c_anc_des = pp'get_ancestors cthynm cup
		pp'get_descendants cthynm;

	fun aux	n = (if n > top_theory
		then ()
		else if n mem c_anc_des
		then aux (n+1)
		else (let val (ThyInfo{status = status,
			inscope = inscope,
			contents = contents,
			children = children,
			name = name}) = sub(lookup,n);
		in
			if status <> TSDeleted
			then fail "pp'seal_hierarchy" 6004 [fn () => name]
			else aux (n+1)
		end)
			
		);
	val side_effect = aux 0;
in
	current := {hierarchy = hierarchy, theory=theory, in_scope = in_scope,
		sealed=pp'get_current_theory_name ()}
end
);
=TEX
Given a theory name as an integer, return it as a string:
=SML
fun pp'get_theory_name (thyn : int) : string = (
	get_internal_theory_name thyn "pp'get_theory_name"
);
=TEX
In the sequence suggested by \cite{DS/FMU/IED/DTD006}
we would only now give $pp'get\_current\_theory\_name$,
but the function was useful in defining utilities needed before this point.

Return an interface presentation of a theory, based on a string:
=SML
fun ⦏pp'get_theory_info⦎ (iname : int) : THEORY_INFO = (
let	val hier (inconsistent,lookup, _) = current_hierarchy();

	val _ = get_internal_theory_name iname "pp'get_theory_info";

	val (ThyInfo{status = status,
			inscope = inscope,
			contents = contents,
			children = children,
			name = name}) = sub(lookup,iname);

	val athy = !contents;
in
	{status = status,
	inscope = inscope,
	contents = theory_of_pp'theory athy,
	children = children,
	name = name}
end);
=TEX
=SML
fun ⦏pp'get_pervasive_theory_name⦎ () : string = (
let	val {sealed=sealed,...} = !current;
in
	pp'get_theory_name sealed
	handle (Fail _) =>
	error "pp'get_pervasive_theory_name" 6091 [fn () => string_of_int sealed]
end);
=TEX

\subsection{Operations on Theory Attributes}
These functions follow the specification of \cite{DS/FMU/IED/SPC005}.

We give a function to make some theory the current theory.
Interrupting the body of the main $let$ statement may leave the state with the $inconsistent$ flag set.
=SML
fun ⦏pp'open_theory⦎ (thyn : int) : (int list * int list) = (
let	val {hierarchy = hierarchy as hier (inconsistent,lookup, _),
		theory=theory, in_scope = in_scope,
		sealed=sealed} = !current;
	val top_theory = uindex lookup;

	val _ = get_internal_theory_name thyn "pp'open_theory"; (* spec step 1 *)

	val allp = pp'get_ancestors thyn;

	val sideeffect = if sealed mem allp
		then ()
		else fail "pp'open_theory" 6017 [fn () => pp'get_theory_name thyn,
			fn () => pp'get_theory_name sealed];

	val ThyInfo{status = status,
		inscope = inscope,
		contents = contents,
		children = children,
		name = name} = sub(lookup,thyn);
=TEX
The following auxiliary function sets the inscope fields of all the theories to their appropriate state
for the theory being opened and returns a triple of lists: the theories that have gone out
of scope, the theories that have newly come into scope and all theories that are now in scope.
The first two of these lists are for the result value required by caller.
=SML
	fun aux ~1 out_of_scope into_scope now_in_scope = (out_of_scope, into_scope, now_in_scope)
	| aux n out_of_scope into_scope now_in_scope = (
		let	val ThyInfo{status = status1,
				inscope = inscope1,
				contents = contents1,
				children = children1,
				name = name1} = sub(lookup,n);
			val wanted_in_scope = n mem allp;
			val out_of_scope' =
				if	inscope1 andalso not wanted_in_scope
				then	n::out_of_scope
				else	out_of_scope;
			val into_scope' =
				if	wanted_in_scope andalso not inscope1	
				then	n::into_scope
				else	into_scope;
			val now_in_scope' =
				if	wanted_in_scope
				then	n::now_in_scope
				else	now_in_scope;
		in	update(lookup,n,
				ThyInfo{status = status1,
					inscope = wanted_in_scope,
					contents = contents1,
					children = children1,
					name = name1});
				aux (n-1)  out_of_scope' into_scope' now_in_scope'
		end
	);
	val was_inconsistent = !inconsistent;
=TEX
We now need to protect the changes to the hierarchy:
=SML
in
	(inconsistent := true;
=TEX
Now use these auxiliary functions to gain the theories moved in and out of scope and the
new type and constructor environments, after the opening.
Notice we must take everything necessary out of scope before we put anything into scope.
=SML
	let
	val (outs, ins, in_scope) = aux top_theory [] [] [];
=TEX
=SML
	in
	(current := {hierarchy=hierarchy, theory=contents, in_scope = in_scope, sealed=sealed};
	inconsistent := was_inconsistent;
		(* spec step 3, 4 *)
	(ins, outs))
	end)
end);
=TEX
The following is a function to delete theories.
We modify the current hierarchy ``in place'' rather than taking a copy.
If it is interrupted then the state may be left with the $inconsistent$ flag set.
=SML
fun ⦏pp'delete_theory⦎ (thyn : int) : unit = (
let	val {hierarchy = hierarchy as hier (inconsistent,lookup, _),
		theory=theory, in_scope = in_scope,
		sealed=sealed} = !current;

	val _ = get_internal_theory_name thyn "pp'delete_theory"; (* spec. step 1 *)
	
	val ThyInfo{status = status,
		inscope = inscope,
		contents = contents,
		children = children,
		name = name} = sub(lookup,thyn);

	val dummy = case status of
		TSDeleted => error "pp'delete_theory" 6041 [fn () => pp'get_theory_name thyn]
		| TSAncestor => fail "pp'delete_theory" 6071 [fn () => pp'get_theory_name thyn]
		| TSLocked => fail "pp'delete_theory" 6037 [fn () => pp'get_theory_name thyn]
		| TSNormal =>
		if !inconsistent
		then error "pp'delete_theory" 6083 []
		else if not(is_nil children)
		then fail "pp'delete_theory" 6076 [fn () => pp'get_theory_name thyn]
		else if inscope
		then fail "pp'delete_theory" 6069 [fn () => pp'get_theory_name thyn]
		else ();

	val Thy{parents = parents,...} = !contents;

	val ethy = empty_theory thyn [];
	val was_inconsistent = !inconsistent;
in
	inconsistent :=true;
	remove_child thyn parents;
	contents := ethy; (* spec step 3 *)
	update(lookup,thyn,ThyInfo{status = TSDeleted,
		inscope = false,
		contents = contents,
		children = [],
		name = name}); (* spec step 2, 4 *)
	inconsistent := was_inconsistent
end);
=TEX
The following creates a new theory, though it does not make it current.
Interrupting the body of the main $let$ statement may leave the state with the $inconsistent$ flag set.
=SML
fun ⦏pp'new_theory⦎ (nm : string) : int = (
	if (is_theory_name nm)	(* spec. step 1 *)
	then fail "pp'new_theory" 6040 [fn () => nm]
	else let val {hierarchy = hierarchy as hier (inconsistent,lookup, _),
		theory=theory, in_scope = in_scope,
		sealed=sealed} = !current;
	val dummy = if !inconsistent
		then error "pp'new_theory" 6083 []
		else ();

	val cthy = pp'get_current_theory_name();

	val ntop_theory = uindex lookup + 1;

	val nthy = ref (empty_theory ntop_theory [cthy]); (* spec. step 2 *)

	val nti = (ThyInfo{status = TSNormal,
		inscope = false,
		contents = nthy,
		children = [],
		name = nm});
	val was_inconsistent = !inconsistent;

in
	inconsistent:=true;
	update(lookup,ntop_theory,nti); (* spec step 3 *)
	add_child ntop_theory [cthy];
	inconsistent := was_inconsistent; (* spec. step 4 *)
	ntop_theory
end
);
=TEX
The following adds a new parent to the current theory.
Interrupting the body of the main $let$ statement may leave the state with the $inconsistent$ flag set.
=SML
fun ⦏pp'new_parent⦎ (pthy : int) : int list = (
let	val dummy = check_c_writable "pp'new_parent";

	val _ = get_internal_theory_name pthy "pp'new_parent";

	val {hierarchy=hierarchy as hier (inconsistent,lookup, _),
		theory=theory, in_scope = in_scope, sealed=sealed}
		 = !current;

	val ThyInfo{status = fstatus,
		inscope = finscope,
		contents = fcontents,
		children = fchildren,
		name = fname}
		= sub(lookup, pthy);

	val cthy = pp'get_current_theory_name();

	val Thy{name = iname,
		ty_env = ty_env,
		con_env = con_env,
		parents = parents,
		del_levels = del_levels,
		axiom_dict = axiom_dict,
		defn_dict = defn_dict,
		thm_dict = thm_dict,
		current_level = current_level,
		user_data = user_data} = !theory;
(*
=TEX
The ancestors of the current and parent theories:
=SML
*)
	val pthy_anc = pp'get_ancestors pthy;
	val cthy_anc = pp'get_ancestors cthy;
(*
=TEX
A theory is an ancestor of the current one if and only if it is in scope.
=SML
*)
	val dummy = if pthy mem parents
		then fail "pp'new_parent" 6082 [fn () => fname]
		else if cthy mem pthy_anc
		then fail "pp'new_parent" 6084 [fn () => fname]
		else ();

	val nfti = (ThyInfo{status = fstatus,
		inscope = finscope,
		contents = fcontents,
		children = (cthy :: fchildren),
		name = fname});

	val new_thys_in_scope = pthy_anc diff cthy_anc ;
(*
=TEX
The following detects clashes with things in scope.
=SML
*)
	val check_cons = (
		case check_con_env new_thys_in_scope of
			Nil => ()
		|	Value cn => fail "pp'new_parent" 6067 [fn() => fname]
	);

	val check_tys = (
		case check_ty_env new_thys_in_scope of
			Nil => ()
		|	Value cn => fail "pp'new_parent" 6067 [fn() => fname]
	);
(*
=TEX
Add the new parent to the theory:
=SML
*)
	val new_thy = Thy{name = iname,
		ty_env = ty_env,
		con_env = con_env,
		parents = (pthy :: parents),
		del_levels = del_levels,
		axiom_dict = axiom_dict,
		defn_dict = defn_dict,
		thm_dict = thm_dict,
		current_level = current_level,
		user_data = user_data};
(*
=TEX
Put the new ancestor theories in scope:
=SML
*)
	fun put_in_scope [] = ()
	| put_in_scope (n :: x) = (
	let val ThyInfo{status = astatus,
		inscope = ainscope,
		contents = acontents,
		children = achildren,
		name = aname} = sub(lookup,n)
	in
		(update(lookup,n,ThyInfo{status = astatus,
			inscope = true,
			contents = acontents,
			children = achildren,
			name = aname});
		put_in_scope x)
	end);

	val now_in_scope = new_thys_in_scope @ in_scope;

	val was_inconsistent = !inconsistent;
in
	inconsistent:=true;
	put_in_scope new_thys_in_scope;
	add_child cthy [pthy];
	theory := new_thy;
	current := {hierarchy=hierarchy, theory=theory, in_scope = now_in_scope,
		sealed=sealed};
	inconsistent:= was_inconsistent;
	new_thys_in_scope
end);
=TEX
The following is a function to lock a theory, to make it read-only.
We work by modifying the current hierarchy ``in place''.
=SML
fun ⦏pp'lock_theory⦎ (thyn : int): unit = (
let	val _ = get_internal_theory_name thyn "pp'lock_theory"; (* spec. step 1 *)

	val hier (inconsistent,lookup, _) = current_hierarchy();
	val dummy = if !inconsistent
		then error "pp'lock_theory" 6083 []
		else ();
	
	val ThyInfo{status = status,
		inscope = inscope,
		contents = contents,
		children = children,
		name = name} = sub(lookup,thyn);

	val dummy = case status of
		TSDeleted => error "pp'lock_theory" 6041 []
		| TSAncestor => fail "pp'lock_theory" 6071 [fn () => pp'get_theory_name thyn]
		| TSLocked => fail "pp'lock_theory" 6037 [fn () => pp'get_theory_name thyn]
		| TSNormal => ();
in
	update(lookup,thyn,ThyInfo{status = TSLocked,
		inscope = inscope,
		contents = contents,
		children = children,
		name = name}) (* spec step 2,3 *)
end);
=TEX
The following is a function to unlock a locked theory, allowing to be written to once more.
We work by modifying the current hierarchy ``in place''.
=SML
fun ⦏pp'unlock_theory⦎ (thyn : int): unit = (
let	val _ = get_internal_theory_name thyn "pp'unlock_theory"; (* spec. step 1 *)

	val hier (inconsistent,lookup, _) = current_hierarchy();
	val dummy = if !inconsistent
		then error "pp'unlock_theory" 6083 []
		else ();
	
	val ThyInfo{status = status,
		inscope = inscope,
		contents = contents,
		children = children,
		name = name} = sub(lookup,thyn);

	val dummy = case status of
		TSDeleted => error "pp'unlock_theory" 6041 []
		| TSAncestor => fail "pp'unlock_theory" 6068 [fn () => pp'get_theory_name thyn]
		| TSNormal => fail "pp'unlock_theory" 6068 [fn () => pp'get_theory_name thyn]
		| TSLocked => ();
in
	update(lookup,thyn,ThyInfo{status = TSNormal,
		inscope = inscope,
		contents = contents,
		children = children,
		name = name}) (* spec. step 2,3 *)
end);
=TEX
The following is a function to create a duplicate theory, except it has no children.
Interrupting the body of the main $let$ statement may leave the state with the $inconsistent$ flag set.
=SML
fun ⦏pp'duplicate_theory⦎ (fromn : int) (tonm : string) : int = (
let	val {hierarchy = hierarchy as hier (inconsistent,lookup, _),
		theory=theory, in_scope = in_scope,
		sealed=sealed} = !current;
	val dummy = if !inconsistent
		then error "pp'duplicate_theory" 6083 []
		else if (is_theory_name tonm)
		then fail "pp'duplicate_theory" 6040 [fn () => tonm]
		else ();

	val _ = get_internal_theory_name fromn "pp'duplicate_theory";

	val dummy = if sealed = fromn
		then fail "pp'duplicate_theory" 6026 [fn () => pp'get_theory_name fromn]
		else if sealed mem (pp'get_ancestors fromn)
		then ()
		else fail "pp'duplicate_theory" 6042 [fn () => pp'get_theory_name fromn];

	val ntop_theory = uindex lookup + 1;

	val ThyInfo{status = status1,
		inscope = inscope1,
		contents = contents1,
		children = children1,
		name = name1}
		= sub(lookup,fromn);

	val Thy{name = frname,
		ty_env = ty_env,
		con_env = con_env,
		parents = parents,
		del_levels = del_levels,
		axiom_dict = axiom_dict,
		defn_dict = defn_dict,
		thm_dict = thm_dict,
		current_level = current_level,
		user_data = user_data} = !contents1;

	val dummy = if frname <> fromn
		then error "pp'duplicate_theory" 6041 []
		else ();

	val tothy = ref (empty_theory 0 []);

	fun new_dict_entries_aux acc []  = (acc
	)   | new_dict_entries_aux acc ((k, Thm {level, theory, sequent}) ::more) = (
		new_dict_entries_aux
		(oe_extend k (Thm {level = level, theory = tothy, sequent = sequent}) acc) more
	);

	fun new_dict_entries dict = (
		new_dict_entries_aux initial_oe_dict (rev (oe_flatten dict))
	);

	val side = (
		tothy :=
		Thy{	name = ntop_theory,
			ty_env = ty_env,
			con_env = con_env,
			parents = parents,
			del_levels = del_levels,
			axiom_dict = new_dict_entries axiom_dict,
			defn_dict = new_dict_entries defn_dict,
			thm_dict = new_dict_entries thm_dict,
			current_level = current_level,
			user_data = ref(!user_data)});

	val toti = (ThyInfo{status = TSNormal,
		inscope = false,
		contents = tothy,
		children = [],
		name = tonm});

	val was_inconsistent = !inconsistent;
in
	inconsistent:=true;
	update(lookup,ntop_theory,toti);
	add_child ntop_theory parents;
	current := {hierarchy = hierarchy,
		theory=theory, in_scope = in_scope,
		sealed=sealed};
	inconsistent:=was_inconsistent;
	ntop_theory
end);
=TEX

\subsection{Operations on Theory Contents}
The first two functions of this section have no specification.
The rest of the functions follow the specification of \cite{DS/FMU/IED/SPC005}.

Get a theory's contents, by internal name:
=SML
fun ⦏pp'get_theory⦎ (iname : int) : THEORY = (
let	val _ = get_internal_theory_name iname "pp'get_theory"
	val gthy = get_theory_contents iname
in
	theory_of_pp'theory gthy
end);
=TEX
Get the current theory's status:
=SML
fun ⦏get_current_theory_status⦎ () : THEORY_STATUS = (
let	val {hierarchy = hier (inconsistent,lookup, _), theory = theory, ...} = !current;

	val Thy{name = iname,...} = !theory;

	val (ThyInfo{status = status,...}) = sub(lookup, iname);
in
	status
end);
=TEX
Give the sequent of a theorem:
=SML
fun ⦏dest_thm⦎ (Thm{sequent=sequent,...} : THM) : SEQ = sequent;
=TEX
Give a user presentation of a theorem:
=SML
fun ⦏pp'dest_thm⦎ (Thm{level = level, theory=theory, sequent = sequent}:THM) :
	{level : int, theory : THEORY, sequent : SEQ} = (
let	val thry = !theory
in
	{level=level, theory = theory_of_pp'theory thry, sequent = sequent}
end);
=TEX

Save a theorem under a list of keys:
=SML
fun ⦏pp'list_save_thm⦎ (keys : string list,
	thm : THM as Thm {level = level, theory=theory, sequent = sequent}) : THM = (
let	val dummy = (check_thm "pp'list_save_thm" thm;
		wf_thm "pp'list_save_thm" thm;
		if keys = []
		then fail "pp'list_save_thm" 6031 []
		else check_c_writable "pp'list_save_thm"); (* part of spec. step 2 *)

	val {theory = ctheory,...} = !current;

	val Thy{name = iname,
		ty_env = ty_env,
		con_env = con_env,
		parents = parents,
		del_levels = del_levels,
		axiom_dict = axiom_dict,
		defn_dict = defn_dict,
		thm_dict = thm_dict,
		current_level = current_level,
		user_data = user_data} = !ctheory; (* spec. step 1 *)
=TEX
The definition level of the saved theorem is 0 if it is from
an ancestor theory, as described in the specification.
=SML
	val new_thm = Thm{level = if (theory = ctheory)
			then current_level
			else 0,
		theory = ctheory,
		sequent = sequent};
=TEX
We test that all the keys are new (part of spec. step 2) at the same time as
adding new entries to the dictionary, by using $se\_extend$
(spec. step 3).
=SML
	val new_thm_dict = (fold (fn (x,y) => x y)
		(map (fn key => fn dct =>
			oe_extend key new_thm dct
			handle complaint =>
			divert complaint "e_extend" "pp'list_save_thm" 6039
		 [(fn () => key),
		  (fn () => get_current_theory_name())])
		keys)
		thm_dict);

	val new_thy = Thy{name = iname,
		ty_env = ty_env,
		con_env = con_env,
		parents = parents,
		del_levels = del_levels,
		axiom_dict = axiom_dict,
		defn_dict = defn_dict,
		thm_dict = new_thm_dict,
		current_level = current_level,
		user_data = user_data}
in
	ctheory := new_thy; (* spec. step 4 *)
	new_thm
end);
=TEX
The following is a function to delete the last extension to the current theory.
Interrupting the body of the main $let$ statement may leave the state with the $inconsistent$ flag set.
=SML
fun ⦏pp'delete_extension⦎ (():unit) : int = (
let	val {hierarchy = hierarchy as hier (inconsistent,lookup, _),
		theory=theory, in_scope,
		sealed=sealed} = !current;

	val Thy{name = iname,
		ty_env = ty_env,
		con_env = con_env,
		parents = parents,
		del_levels = del_levels,
		axiom_dict = axiom_dict,
		defn_dict = defn_dict,
		thm_dict = thm_dict,
		current_level = current_level,
		user_data = user_data} = !theory;

	val ThyInfo{children = children, name = ename,...} = sub(lookup,iname);

	val dummy = (check_c_writable "pp'delete_extension"; (* spec. step 1 *)
		if children <> []
		then fail "pp'delete_extension" 6076 [fn x=>ename]
		else ());
=TEX
We want the last level at which something was defined
(specification step 2).
All the following lists are always manipulated so that their head
will be the last declaration of their kind.
N.B. this does not hold true of $thm\_dict$,
as it may save theorems from other theories at level 0.

In the following $ll\_def$ should always be less than or equal $ll\_con$, but we check, just in case.
=SML
	val fty_env = oe_flatten ty_env;

	val ll_type = case fty_env of
		[] => 0
		| ((_,{level=llt,...})::_) => llt;

	val fcon_env = oe_flatten con_env;

	val ll_con = case fcon_env of
		[] => 0
		| ((_,{level=llc,...})::_) => llc;

	val fdefn_dict = oe_flatten defn_dict;

	val ll_def = case fdefn_dict of
		[] => 0
		| ((_,Thm{level=lld,...})::_) => lld;

	val faxiom_dict = oe_flatten axiom_dict;

	val ll_axiom = case faxiom_dict of
		[] => 0
		| ((_,Thm{level=lla,...})::_) => lla;

	val last_level = list_max[ll_type, ll_con, ll_def, ll_axiom];

	val fthm_dict = oe_flatten thm_dict;

	val dummy = (
		if last_level = 0
		then fail "pp'delete_extension" 6050 [fn () => ename]
		else if (any fthm_dict (fn (_,Thm{level=ll,...}) =>
			ll >= last_level))
		then fail "pp'delete_extension" 6077
			[(fn () => ename),
			(fn () => let val (key,_) = (find fthm_dict
				(fn (_,Thm{level=ll,...}) =>
				 ll >= last_level))
				in key end)]
		else ());

	val new_del_levels = extend_range (last_level, current_level) del_levels;
=TEX
The following deletion, specification step 3, depends upon the implementation of simple
dictionaries.
We delete anything made between $last\_level$ and $current\_level$
(there should only be things {\bf at} the current level,
but we are very cautious).
=SML
	val new_ty_env= list_oe_merge initial_oe_dict
		(fty_env drop (fn (_,{level=ll,...}) => ll >= last_level));

	val new_con_env= list_oe_merge initial_oe_dict
		(fcon_env drop (fn (_,{level=ll,...}) => ll >= last_level));

	val new_axiom_dict =  list_oe_merge initial_oe_dict
		(faxiom_dict drop  (fn (_,Thm{level=ll,...}) => ll >= last_level));

	val new_defn_dict =  list_oe_merge initial_oe_dict
		(fdefn_dict drop (fn (_,Thm{level=ll,...}) => ll >= last_level));

	val new_thy = Thy{name = iname,
		ty_env = new_ty_env,
		con_env = new_con_env,
		parents = parents,
		del_levels = new_del_levels,
		axiom_dict = new_axiom_dict,
		defn_dict = new_defn_dict,
		thm_dict = thm_dict,
		current_level = current_level+1,
		user_data = user_data};
	val was_inconsistent = !inconsistent;
in
(*
=TEX
Note that the current theory address doesn't change, only the contents of the location pointed to.
=SML
*)
	inconsistent:=true;
	theory := new_thy; (* spec. step 4 *)
	current := {hierarchy=hierarchy, theory=theory,
		in_scope = in_scope,
		sealed=sealed};
	inconsistent:=was_inconsistent;
	last_level
end);
=TEX
Delete a named theorem from the current theory:
=SML
fun ⦏pp'delete_thm⦎ (key : string) : THM = (
let	val {theory=theory, ...} = !current;

	val Thy{name = iname,
		ty_env = ty_env,
		con_env = con_env,
		parents = parents,
		del_levels = del_levels,
		axiom_dict = axiom_dict,
		defn_dict = defn_dict,
		thm_dict = thm_dict,
		current_level = current_level,
		user_data = user_data} = !theory;

	val dummy = check_c_writable "pp'delete_thm"; (* spec. step 1 *)

	val dthm = (force_value(oe_lookup key thm_dict)
		handle complaint =>
		divert complaint "force_value" "pp'delete_thm" 6046 [
				fn x => key,
				fn x => get_current_theory_name()]);

	val new_thm_dict = oe_delete key thm_dict; (* spec step 2 *)

	val new_thy = Thy{name = iname,
		ty_env = ty_env,
		con_env = con_env,
		parents = parents,
		del_levels = del_levels,
		axiom_dict = axiom_dict,
		defn_dict = defn_dict,
		thm_dict = new_thm_dict,
		current_level = current_level,
		user_data = user_data}
in
	theory := new_thy;
	dthm
end);
=TEX
Add an axiom to the current theorem:
=SML
fun ⦏pp'new_axiom⦎ (keys : string list, tm : TERM) : THM = (
let	val {theory=theory,...} = !current;

	val Thy{name = iname,
		ty_env = ty_env,
		con_env = con_env,
		parents = parents,
		del_levels = del_levels,
		axiom_dict = axiom_dict,
		defn_dict = defn_dict,
		thm_dict = thm_dict,
		current_level = current_level,
		user_data = user_data} = !theory;
	
	val dummy = (check_c_writable "pp'new_axiom" ;
		wf_term "pp'new_axiom" tm;
		if keys = []
		then fail "pp'new_axiom" 6031 []
		else if type_of tm =: BOOL
		then ()
		else term_fail "pp'new_axiom" 3031 [tm]);
			(* spec step 1 *)

	val new_axiom = Thm{level = current_level+1,
		theory=theory,
		sequent = ([], tm)}; (* spec step 2,3 *)
(*
=TEX
We both check for an unused key (part of specification step 1 *), and insert a new entry in the dictionary by using $s\_extend$.
=SML
*)
	val new_axiom_dict = (fold (fn (x,y) => x y)
		(map (fn key => fn dct =>
			oe_extend key new_axiom dct
			handle complaint =>
			divert complaint "e_extend" "pp'new_axiom" 6047
			[(fn () => key),
			 (fn () => get_current_theory_name ())])
		keys)
		axiom_dict);

	val new_thy = Thy{name = iname,
		ty_env = ty_env,
		con_env = con_env,
		parents = parents,
		del_levels = del_levels,
		axiom_dict = new_axiom_dict,
		defn_dict = defn_dict,
		thm_dict = thm_dict,
		current_level = current_level+1,
		user_data = user_data}
in
	theory := new_thy; (* spec step 4 *)
	new_axiom
end);
=TEX
\subsubsection{Definitional Mechanisms}
These functions follow the specification of \cite{DS/FMU/IED/SPC005}.
The following five functions follow the pattern of the
definitional mechanisms of the specification.

In various places, it is an error if a certain term or theorem contains
certain free variables. The following function
reports on these errors giving the right wording using error message 6059.
=TEX
=SML
fun ⦏fv_error⦎ (caller : string) (what : string) (format_x : 'a -> string)
		(x : 'a) (fvs : TERM list) : 'b = (
	let	fun s () = case fvs of [_] => "" | _ => "s";
	in	fail caller 6059 [
			fn () => what, fn () => format_x x, s,
			fn () => format_list (fst o dest_var) fvs ", "]
	end
);
=TEX
The following is a function to add a new constant to the theory.
Interrupting the body of the main $let$ statement may leave the state with the $inconsistent$ flag set.
=SML
fun ⦏pp'new_const⦎ (nm : string, ty : TYPE) : TERM = (
let	val {hierarchy=hierarchy as hier(inconsistent,lookup, _), theory=theory,
		in_scope = in_scope,sealed=sealed} = !current;

	val Thy{name = iname,
		ty_env = ty_env,
		con_env = con_env,
		parents = parents,
		del_levels = del_levels,
		axiom_dict = axiom_dict,
		defn_dict = defn_dict,
		thm_dict = thm_dict,
		current_level = current_level,
		user_data = user_data} = !theory;
	
	val dummy = (check_c_writable "pp'new_const";
		wf_type "pp'new_const" ty;
		(case const_in_anc_or_des nm of
		InScope => fail "pp'new_const" 6049 [fn () => nm]
		| InDescendant => fail "pp'new_const" 6063 [fn () => nm]
		| NotPresent => ()));
		
	val new_const = mk_const(nm,ty)
		handle complaint =>
		pass_on complaint "mk_const" "pp'new_const";

	val con_decl = {ty=ty,level=current_level+1};

	val new_con_env = oe_extend nm con_decl con_env;

	val new_thy = Thy{name = iname,
		ty_env = ty_env,
		con_env = new_con_env,
		parents = parents,
		del_levels = del_levels,
		axiom_dict = axiom_dict,
		defn_dict = defn_dict,
		thm_dict = thm_dict,
		current_level = current_level+1,
		user_data = user_data};

	val was_inconsistent = !inconsistent;
in
	inconsistent:=true;
	theory := new_thy;
	current := {hierarchy=hierarchy, theory=theory, in_scope = in_scope,
		sealed=sealed};
	inconsistent:=was_inconsistent;
	new_const
end);
=TEX
The following is a function to add a new type to the theory.
Interrupting the body of the main $let$ statement may leave the state with the $inconsistent$ flag set.
=SML
fun ⦏pp'new_type⦎ (nm : string, arity : int) : TYPE = (
let	val {hierarchy=hierarchy as hier(inconsistent,lookup, _),
		theory=theory, in_scope = in_scope,
		sealed=sealed} = !current;

	val Thy{name = iname,
		ty_env = ty_env,
		con_env = con_env,
		parents = parents,
		del_levels = del_levels,
		axiom_dict = axiom_dict,
		defn_dict = defn_dict,
		thm_dict = thm_dict,
		current_level = current_level,
		user_data = user_data} = !theory;
	
	val dummy = (check_c_writable "pp'new_type";
		(case type_in_anc_or_des nm of
		InScope => fail "pp'new_type" 6045 [fn () => nm]
		| InDescendant => fail "pp'new_type" 6034 [fn () => nm]
		| NotPresent =>
		if arity < 0
		then fail "pp'new_type" 6088 []
		else ()));
		
	val new_type = mk_ctype(nm,ntyvars arity);

	val type_decl = {arity=arity,level=current_level+1};

	val new_ty_env = oe_extend nm type_decl ty_env;

	val new_thy = Thy{name = iname,
		ty_env = new_ty_env,
		con_env=con_env,
		parents = parents,
		del_levels = del_levels,
		axiom_dict = axiom_dict,
		defn_dict = defn_dict,
		thm_dict = thm_dict,
		current_level = current_level+1,
		user_data = user_data};

	val was_inconsistent = !inconsistent;
in
	inconsistent:=true;
	theory := new_thy;
	current := {hierarchy=hierarchy, theory=theory, in_scope = in_scope,
		sealed=sealed};
	inconsistent:=was_inconsistent;
	new_type
end);
=TEX
The following is a function to increment the current level.
It is for use by higher level code that uses the level as a marker.
=SML
fun ⦏pp'step_current_level⦎ (() : unit) : unit = (
let	val {hierarchy=hierarchy as hier(inconsistent,lookup, _),
		theory=theory, in_scope = in_scope,
		sealed=sealed} = !current;

	val Thy{name = iname,
		ty_env = ty_env,
		con_env = con_env,
		parents = parents,
		del_levels = del_levels,
		axiom_dict = axiom_dict,
		defn_dict = defn_dict,
		thm_dict = thm_dict,
		current_level = current_level,
		user_data = user_data} = !theory;
	
	val dummy = check_c_writable "pp'step_current_level";

	val new_thy = Thy{name = iname,
		ty_env = ty_env,
		con_env = con_env,
		parents = parents,
		del_levels = del_levels,
		axiom_dict = axiom_dict,
		defn_dict = defn_dict,
		thm_dict = thm_dict,
		current_level = current_level+1,
		user_data = user_data};

	val was_inconsistent = !inconsistent;
in
	inconsistent:=true;
	theory := new_thy;
	current := {hierarchy=hierarchy, theory=theory, in_scope = in_scope,
		sealed=sealed};
	inconsistent:=was_inconsistent;
	()
end);
=TEX
The following is the most general function for defining new constants.
Interrupting the body of the main $let$ statement may leave the state with the $inconsistent$ flag set.
Note that the function assumes the presence of $=$ as a valid constant.
=IGN
val x = mk_var("x", BOOL);
val lam = mk_simple_λ(x, mk_eq(x, x));
val def = mk_eq(mk_var("c1", type_of lam), lam);
val defthm as Thm{sequent = (asms, concl),...} = pp'asm_rule def;
val keys = ["c1"];
val _ = pp'new_type("BOOL", 0);
val _ = pp'new_type("→", 2);
val _ = pp'new_const("=", mk_ctype("→", [mk_vartype "'a", mk_ctype("→", [mk_vartype "'a", mk_ctype("BOOL", [])])]));
=SML
fun ⦏pp'gen_new_spec⦎ (keys : string list,
		defthm : THM as Thm{sequent = (asms, concl),...}) : THM = (
let	val {hierarchy=hierarchy as hier(inconsistent,lookup, _),
		 theory=theory, in_scope = in_scope,
		sealed=sealed} = !current;

	val Thy{name = iname,
		ty_env = ty_env,
		con_env = con_env,
		parents = parents,
		del_levels = del_levels,
		axiom_dict = axiom_dict,
		defn_dict = defn_dict,
		thm_dict = thm_dict,
		current_level = current_level,
		user_data = user_data} = !theory;
(*
=TEX
The theory must be writable and the list of keys must not be empty
=SML
*)
	val _ = check_c_writable "pp'gen_new_spec";
	val _ =	if is_nil keys
		then fail "pp'gen_new_spec" 6031 []
		else ();
=TEX
Derive a constant-variable pair from one assumption of the theorem, making all the
checks that apply to an individual assumption.
Note that it is sufficient to check that the right-hand side of the equation is well-formed
since {\em mk\_eq} guarantees that the left-hand side will have the same type as the right-hand
side (and as the left-hand side is checked to be a variable, only its type can make it ill-formed).
=SML
	fun const_var_from_eq (v_eq_t : TERM) : string * (TERM * TERM) = (
		let	val (v, t) = dest_eq v_eq_t
				handle complaint =>
				divert complaint "dest_eq" "pp'gen_new_spec"
					6064 [fn () => string_of_term v_eq_t];
			val (cnm, cty) = dest_var v
				handle complaint =>
				divert complaint "dest_var" "pp'gen_new_spec"
					6064 [fn () => string_of_term v_eq_t];
			val c = mk_const (cnm, cty)
				handle complaint =>
				pass_on complaint "mk_const" "pp'gen_new_spec";
			val _ = case const_in_anc_or_des cnm of
					InScope => fail "pp'gen_new_spec" 6049 [fn () => cnm]
				|	InDescendant => fail "pp'gen_new_spec" 6063 [fn () => cnm]
				|	NotPresent => ();
			val _ = wf_term "pp'gen_new_spec" t;
			val _ = if not(is_nil (frees t))
				then fv_error "pp'gen_new_spec" "term" string_of_term t (frees t)
				else if not(is_nil((term_tyvars t) diff (type_tyvars cty)))
				then fail "pp'gen_new_spec" 6058  [fn () => string_of_term t,
					 fn () => format_list (Combinators.I)
						 ((term_tyvars t) diff (type_tyvars cty)) ", ",
					fn () => string_of_term v]
				else ();
		in	(cnm, (c, v))
		end
	);
	val (cnames, const_var_subs) = split (map const_var_from_eq asms);
(*
=TEX
Check for duplicates in the list of constant names:
=SML
*)
	val _ = if not(all_distinct (op =) cnames)
		then fail "pp'gen_new_spec" 6019
			[fn () => two_the_same cnames, fn () => string_of_thm defthm]
		else ();
(*
=TEX
Build and check the defining property. This must be well-formed and have no free variables
(implying that the conclusion of the input theorem is well-formed and has all
its free variables contained amoungst the $v_i$).
=SML
*)
	val def_prop = var_subst const_var_subs concl;
	val _ = if is_nil (frees def_prop)
		then ()
		else	fv_error "pp'new_type_defn" "theorem" string_of_thm defthm (frees def_prop);
(*
=TEX
Build the new constant environment. It is here that we detect
duplicate new constant names: {oe\_extend} will fail if this happens.
=SML
*)
	val new_current_level = current_level + 1;

	val con_decl = map (fn (c, _) =>
			let val (cnm, ty) = dest_const c
			in	(cnm, {ty=ty, level=new_current_level})
			end) const_var_subs;

	val new_con_env = fold
		(fn ((cnm, entry), edict) => oe_extend cnm entry edict)
		 con_decl con_env;

(*
=TEX
Build the new definition dictionary.
=SML
*)
	val new_defn = Thm{level = new_current_level,
		theory=theory,
		sequent = ([], def_prop)};

	val new_defn_dict = (fold (fn (x, y) => x y)
		(map (fn key => fn dct =>
			oe_extend key new_defn dct
			handle complaint =>
			divert complaint "e_extend" "pp'gen_new_spec" 6051
				[(fn () => key),
				(fn () => get_current_theory_name())])

		keys)
		defn_dict);
(*
=TEX
Put it all together to give the new theory.
=SML
*)
	val new_thy = Thy{name = iname,
		ty_env = ty_env,
		con_env = new_con_env,
		parents = parents,
		del_levels = del_levels,
		axiom_dict = axiom_dict,
		defn_dict = new_defn_dict,
		thm_dict = thm_dict,
		current_level = current_level+1,
		user_data = user_data};
	val was_inconsistent = !inconsistent;
in
	inconsistent:=true;
	theory := new_thy;
	current := {hierarchy=hierarchy, theory=theory, in_scope = in_scope, sealed=sealed};
	inconsistent := was_inconsistent;
	new_defn
end);
=TEX
The following is a function to introduce a new type definition.
Interrupting the body of the main $let$ statement may leave the state with the $inconsistent$ flag set.
Note that the function assumes the presence of $TypeDefn$ and $∃$ as valid constants.
=SML
fun ⦏pp'new_type_defn⦎ (keys : string list, tnm : string,
		typars : string list,
		defthm : THM as Thm{sequent = (asms, concl), ...}) : THM = (
let	val {hierarchy=hierarchy as hier(inconsistent, lookup, _),
		 theory=theory, in_scope = in_scope,
		sealed=sealed} = !current;

	val Thy{name = iname,
		ty_env = ty_env,
		con_env = con_env,
		parents = parents,
		del_levels = del_levels,
		axiom_dict = axiom_dict,
		defn_dict = defn_dict,
		thm_dict = thm_dict,
		current_level = current_level,
		user_data = user_data} = !theory;
(*
=TEX
Do the checks required (other than on keys):
=SML
*)
	val dummy = (check_c_writable "pp'new_type_defn";
		(case type_in_anc_or_des tnm of
		InScope => fail "pp'new_type_defn" 6045 [fn () => tnm]
		| InDescendant => fail "pp'new_type_defn" 6034 [fn () => tnm]
		| NotPresent => ());
		check_thm "pp'new_type_defn" defthm;
		wf_thm "pp'new_type_defn" defthm;
		if is_nil keys
		then fail "pp'new_type_defn" 6031 []
		else if not(is_nil asms)
		then thm_fail "pp'new_type_defn" 6053 [defthm]
		else if not(is_nil (frees concl))
		then fv_error "pp'new_type_defn" "theorem" string_of_thm defthm (frees concl)
		else if not(is_nil((term_tyvars concl) diff typars))
		then fail "pp'new_type_defn" 6057
			[fn () => string_of_thm defthm,
			 fn () => format_list (Combinators.I)
			  ((term_tyvars concl) diff typars) ", "]
		else if not(all_different typars)
		then fail "pp'new_type_defn" 6079
			[fn () => two_the_same typars]
		else ());
(*
=TEX
Now build up the new material:
=SML
*)
	val (x, (p, x1)) = ((Combinators.I ** dest_app)(dest_simple_∃ concl)
		handle complaint =>
		case (area_of complaint) of
		"dest_app" => thm_fail "pp'new_type_defn" 6055 [defthm]
		| "dest_simple_∃" => thm_fail "pp'new_type_defn" 6054 [defthm]
		| _ => reraise complaint (area_of complaint));

	val dummy = if not(x =$ x1)
		then thm_fail "pp'new_type_defn" 6080 [defthm]
		else ();

	val arity = length typars;

	val new_type = mk_ctype(tnm, map mk_vartype typars);

	val ftype = mk_→_type(new_type, type_of x);

	val f = mk_var("f", ftype); (* cannot be present in p, from frees test *)

	val td = mk_const("TypeDefn", mk_→_type(type_of p,
		mk_→_type(ftype, BOOL)));

	val seq_concl = mk_simple_∃(f, list_mk_app (td, [p, f]));

	val new_current_level = current_level + 1;

	val new_type_defn = Thm{level = new_current_level,
		theory = theory,
		sequent = ([], seq_concl)};

	val ty_decl = {arity = arity, level = new_current_level};

	val new_ty_env = oe_extend tnm ty_decl ty_env;

	val new_defn_dict = (fold (fn (x, y) => x y)
		(map (fn key => fn dct =>
			oe_extend key new_type_defn dct
			handle complaint =>
			divert complaint "e_extend"
				"pp'new_type_defn" 6051
				 [(fn () => key),
				 (fn () => get_current_theory_name())])
		keys)
		defn_dict);

	val new_thy = Thy{name = iname,
		ty_env = new_ty_env,
		con_env=con_env,
		parents = parents,
		del_levels = del_levels,
		axiom_dict = axiom_dict,
		defn_dict = new_defn_dict,
		thm_dict = thm_dict,
		current_level = current_level+1,
		user_data = user_data};
	val was_inconsistent = !inconsistent;
in
	inconsistent:=true;
	theory := new_thy;
	current := {hierarchy=hierarchy, theory=theory, in_scope = in_scope, sealed=sealed};
	inconsistent:=was_inconsistent;
	new_type_defn
end);
=TEX
The following is a function to introduce a new specification.
Interrupting the body of the main $let$ statement may leave the state with the $inconsistent$ flag set.
Note that this function examines theorems involving $∃$,
through there is no guarantee of this constant being present yet.
=SML
fun ⦏pp'new_spec⦎ (keys : string list, ndef : int,
	defthm : THM as Thm{sequent = (asms, concl), ...}) : THM = (
let	val {hierarchy=hierarchy as hier(inconsistent, lookup, _),
		 theory=theory, in_scope = in_scope, sealed=sealed} = !current;

	val Thy{name = iname,
		ty_env = ty_env,
		con_env = con_env,
		parents = parents,
		del_levels = del_levels,
		axiom_dict = axiom_dict,
		defn_dict = defn_dict,
		thm_dict = thm_dict,
		current_level = current_level,
		user_data = user_data} = !theory;
(*
=TEX
Do the checks required (other than on keys, and theorem form):
=SML
*)
	val dummy = (check_c_writable "pp'new_spec";
		check_thm "pp'new_spec" defthm;
		wf_thm "pp'new_spec" defthm;
		if is_nil keys
		then fail "pp'new_spec" 6031 []
		else if not(is_nil (frees concl))
		then fv_error "pp'new_spec" "theorem" string_of_thm defthm (frees concl)
		else if ndef < 1
		then fail "pp'new_spec" 6044 []
		else if is_nil asms
		then ()
		else thm_fail "pp'new_spec" 6053 [defthm]
		);
(*
=TEX
Now build up the new material:
=SML
*)
	fun nexists (n:int) (tm : TERM) (res : TERM list) : (TERM list * TERM) = (
		if n = 0
		then (res, tm)
		else (let val (x, bdy) = dest_simple_∃ tm
			handle complaint =>
			divert complaint "dest_simple_∃" "pp'new_spec"
			6060 [fn () => string_of_thm defthm,
				fn () => string_of_int ndef]
	   	in
			nexists (n-1) bdy (res @ [x])
		end)
	);

	val (xlist, bdt) = nexists ndef concl [];

	val xtyvars = term_tyvars(hd xlist);
(*
=TEX
Check the results of picking apart the theorem:
=SML
*)
	val cnames = map (fst o dest_var) xlist;
	val dummy = (if any (tl xlist) (fn x => not((term_tyvars x) ~= xtyvars))
		then term_fail "pp'new_spec" 6081 [hd xlist,
			find (tl xlist) (fn x => not((term_tyvars x) ~= xtyvars))]
		else if not(is_nil((term_tyvars bdt) diff xtyvars))
		then fail "pp'new_spec" 6061
			[fn () => string_of_thm defthm,
			 fn () => format_list (Combinators.I)
			 ((term_tyvars concl) diff xtyvars) ", "]
		else if not(all_distinct (op =) cnames)
		then fail "pp'new_spec" 6016
			[fn () => two_the_same cnames, fn () => string_of_thm defthm]
		else ();
		map (fn x =>
			let val (cnm, ty) = dest_var x
			in
			(case const_in_anc_or_des cnm of
			InScope => fail "pp'new_spec" 6049 [fn () => cnm]
			| InDescendant => fail "pp'new_spec" 6063 [fn () => cnm]
			| NotPresent => ())
			end)
		xlist;
		());

	val new_consts = map (fn x => mk_const(dest_var x)
		handle complaint =>
		pass_on complaint "mk_const" "pp'new_spec") xlist;

	val new_current_level = current_level+1;

	val con_decl = map (fn x => let val(cnm, ty) = dest_var x
			in
			(cnm, {ty=ty, level=new_current_level})
			end)
		xlist;

	val new_con_env = fold
		(fn ((cnm, entry), edict) => oe_extend cnm entry edict)
		 con_decl con_env;

	val new_concl = subst(combine new_consts xlist) bdt;
(*
=TEX
Now put everything in the correct place:
=SML
*)
	val new_defn = Thm{level = new_current_level,
		theory=theory,
		sequent = ([], new_concl)};

	val new_defn_dict = (fold (fn (x, y) => x y)
		(map (fn key => fn dct =>
			oe_extend key new_defn dct
			handle complaint =>
			divert complaint "e_extend" "pp'new_spec" 6051
				[(fn () => key),
				(fn () => get_current_theory_name())])

		keys)
		defn_dict);

	val new_thy = Thy{name = iname,
		ty_env = ty_env,
		con_env = new_con_env,
		parents = parents,
		del_levels = del_levels,
		axiom_dict = axiom_dict,
		defn_dict = new_defn_dict,
		thm_dict = thm_dict,
		current_level = current_level+1,
		user_data = user_data};
	val was_inconsistent = !inconsistent;
in
	inconsistent:=true;
	theory := new_thy;
	current := {hierarchy=hierarchy, theory=theory, in_scope = in_scope, sealed=sealed};
	inconsistent := was_inconsistent;
	new_defn
end);
=TEX
=SML
fun ⦏pp'get_const_type⦎ (thyn : int) (nm : string) : TYPE OPT = (
	case (get_con_env (Value thyn) nm) of
	Value {ty = ty, ...} => Value ty
	| _ => Nil
);
=TEX
=SML
fun ⦏pp'get_type_arity⦎ (thyn : int) (nm : string) : int OPT = (
	case (get_ty_env (Value thyn) nm) of
	Value {arity=arity, ...} => Value arity
	| _ => Nil
);
=TEX

\section{PRIMITIVE INFERENCE RULES OF ADT THM}
The functions in this section, other than the utilities, follow the specifications of
\cite{DS/FMU/IED/SPC003} and \cite{DS/FMU/IED/SPC004}.
\subsection{Utilities}
Do union up to $\alpha$-conversion:
Give the frees of a list of terms:
=SML
val ⦏list_frees⦎ = list_union (op =$) o map frees;
=TEX
Then provide a test for being free in a list of terms:
=SML
fun ⦏list_is_free_in⦎ (x:TERM) (tms:TERM list) : bool = (
	any tms (fn p => is_free_in x p)
);
=TEX
Create a theorem from a sequent of the current theory and current definition level:
=SML
fun ⦏mk_current_thm⦎(seq : SEQ) : THM = (
let	val {theory = theory, ...} = !current;

	val Thy{current_level = current_level, ...} = !theory;
in
	Thm{theory = theory, level = current_level, sequent = seq}
end);
=TEX

\subsection{pp'subst\_rule}
This function partially evaluates with one or two arguments.
=FRULE 1 Rule
pp'subst_rule
├
[Γ1 ⊢ t1=t1', ... , Γn ⊢ tn=tn']
Γ ⊢ t[t1, ..., tn]
├
Γ1 ∪ ... ∪ Γn ∪ Γ ⊢ t[t1',..., tn']
=TEX
The following local function takes the input list and hypotheses to $pp'subst\_rule$, and returns the
substitution lists for $var\_subst$, as well as the
new assumption list.
=SML
local
	fun two_subst_lists (lhslst : (TERM * TERM) list)
		(rhslst : (TERM * TERM) list)
		(new_hyps : TERM list)
		([] : (THM * TERM) list) :
		(((TERM * TERM) list) * ((TERM * TERM) list) * (TERM list)) = (
		lhslst, rhslst, new_hyps
	) | two_subst_lists lhslst rhslst new_hyps ((thmi, vari) :: lst) = (
	let val (nhyps, (lhsi, rhsi)) = dest_thm_eq "subst_rule" 6002 thmi;
	in
		if not(is_var vari)
		then term_fail "subst_rule" 3007 [vari]
		else if not(type_of lhsi =: type_of vari)
		then fail "subst_rule" 6029 [fn () => string_of_thm thmi,
			fn () => string_of_term vari]
		else (two_subst_lists ((lhsi, vari) :: lhslst)
			((rhsi, vari) :: rhslst)
			(nhyps term_union new_hyps)
			lst)
	end);
in
=TEX
Main function:
=SML
fun ⦏pp'subst_rule⦎ (thm_var_list : (THM * TERM) list):
	TERM -> THM -> THM = (
	if is_nil thm_var_list
	then (
=TEX
We optimize for the special case of an empty $thm\_var\_list$, which is just returning a theorem that is $\alpha$-convertible to the input:
=SML
		(fn (template : TERM) =>
		(fn (ithm as Thm{sequent = (asms, concl), ...}) =>
		let val dummy = check_thm "subst_rule" ithm;
		in
			if concl ~=$ template
			then mk_current_thm(asms, template)
			else term_fail "subst_rule" 6001 [template, concl]
		end))
	)
=TEX
We now consider doing a full substitution.
Create (while checking) two lists, one of $lhs_i\ ×\ var_i$,
one of $rhs_i\ ×\ var_i$, as well as accumulating the hypotheses of the theorems used;
create two terms, $lhs$ and $rhs$, from $template$,
one by the $lhs$ substitutions, the other by the $rhs$;
if the $lhs$ is $\alpha$-convertible to $concl$, then
return the theorem that the $rhs$ term is true.
=SML
	else (
	let val (lhssubs, rhssubs, new_hyps) = two_subst_lists [] [] [] thm_var_list;
	in
	(fn (template : TERM) => let
		val template_as_lhs = var_subst lhssubs template;
		val template_as_rhs = var_subst rhssubs template;
	in
	(fn (ithm as Thm{sequent = (asms, concl), ...}) =>
		let val dummy = (check_thm "subst_rule" ithm;
			map (check_thm "subst_rule" o fst) thm_var_list);
		in
			if concl ~=$ template_as_lhs
			then mk_current_thm(asms term_union new_hyps, template_as_rhs)
			else term_fail "subst_rule" 6001 [template_as_lhs, concl]
		end
	)
	end
	)
	end
	)
); (* end of if..then...else... *)
end; (* of local fun two_subst_lists ... *)
=TEX
\subsection{pp'simple\_λ\_eq\_rule}
=FRULE 1 Rule
pp'simple_λ_eq_rule
⌜x⌝
├
Γ ⊢ t1[x] = t2[x]
├
Γ ⊢ (λ x ⦁ t1[x]) = (λ x ⦁ t2[x])
=TEX
And:
=FRULE 1 Rule
pp'simple_λ_eq_rule
⌜x⌝
├
Γ ⊢ t1[x] ⇔ t2[x]
├
Γ ⊢ (λ x ⦁ t1[x]) = (λ x ⦁ t2[x])
=TEX
=SML
fun ⦏pp'simple_λ_eq_rule⦎ (absvar : TERM) (thrm : THM)
	: THM = (
let	 val dummy = (check_thm "simple_λ_eq_rule" thrm;
		if not(is_var absvar)
		then term_fail "simple_λ_eq_rule" 3007 [absvar]
		else ());

	val (asms, (lhs, rhs)) = dest_thm_eq "simple_λ_eq_rule" 6020 thrm;

	val dummy = if list_is_free_in absvar asms
		then term_fail "simple_λ_eq_rule" 6005 [absvar]
		else ();
in
	mk_current_thm (asms,
		mk_eq(mk_simple_λ(absvar, lhs), mk_simple_λ(absvar, rhs)))
end);
=TEX
\subsection{pp'inst\_type\_rule}
=FRULE 1 Rule
pp'inst_type_rule
[(σ1, tyv1), ..., (σn, tyvn)]
├
Γ ⊢ t[tyv1, ..., tyvn]
├
Γ ⊢ t[σ1,..., σn]
=TEX
=SML
fun ⦏pp'inst_type_rule⦎ (talist: (TYPE * TYPE) list)
	(thrm : THM as Thm{sequent = (asms, concl), ...}) : THM = (
let	val dummy = check_thm "inst_type_rule" thrm;

	val usingtvs : string list = map (fn (t, tv) => (dest_vartype tv
		handle complaint =>
		pass_on complaint "dest_vartype" "inst_type_rule"))
		talist;

	val dummy = if any asms (fn x => any (term_tyvars x)
			(fn y => y mem usingtvs))
		then fail "inst_type_rule" 6006
			[fn () => find (term_tyvars (find asms (fn x => any (term_tyvars x)
			(fn y => y mem usingtvs))))
			(fn y => y mem usingtvs)]
		else ();
in
	mk_current_thm(asms, inst (list_frees asms) talist concl)
end);
=TEX
\subsection{pp'⇒\_intro}
=FRULE 1 Rule
pp'⇒_intro
⌜t1⌝
├
Γ ⊢ t2
├
Γ - {t1} ⊢ t1 ⇒ t2
=TEX
=SML
fun ⦏pp'⇒_intro⦎ (asm : TERM) (thrm : THM as Thm{sequent = (asms, concl), ...}) : THM = (
let	val dummy = (check_thm "⇒_intro" thrm;
	if type_of asm =: BOOL
	then ()
	else term_fail "⇒_intro" 3031 [asm]);
in
	mk_current_thm(asms term_less asm, mk_⇒(asm, concl))
end);
=TEX
\subsection{pp'⇒\_elim}
=FRULE 1 Rule
pp'⇒_elim
├
Γ1 ⊢ t1 ⇒ t2; Γ2 ⊢ t1'
├
Γ1 ∪ Γ2 ⊢ t2
=TEX
=SML
fun ⦏pp'⇒_elim⦎ (thrm1 : THM as Thm{sequent = (hyps1, concl1), ...})
	(thrm2 : THM as Thm{sequent = (hyps2, concl2), ...}) : THM = (
let	val dummy = (check_thm "⇒_elim" thrm1;
		check_thm "⇒_elim" thrm2);

	val (hconcl1, cconcl1) = (dest_⇒ concl1
		handle complaint =>
		case (area_of complaint) of
		"dest_⇒" => thm_fail "⇒_elim" 6010 [thrm1]
		| _ => reraise complaint (area_of complaint));
in
	if hconcl1 ~=$ concl2
	then mk_current_thm(hyps1 term_union hyps2, cconcl1)
	else thm_fail "⇒_elim" 6011 [thrm1, thrm2]
end);
=TEX
\subsection{pp'asm\_rule}
=FRULE 1 Rule
pp'asm_rule
⌜t⌝
├
├
t ⊢ t
=TEX
=SML
fun ⦏pp'asm_rule⦎ (tm : TERM) : THM = (
	if type_of tm =: BOOL
	then mk_current_thm([tm], tm)
	else term_fail "asm_rule" 3031 [tm]
);
=TEX
\subsection{pp'refl\_conv}
=FRULE 1 Rule
pp'refl_conv
⌜t⌝
├
├
⊢ t = t
=TEX
Or, if $t$ is boolean:
=FRULE 1 Rule
pp'refl_conv
⌜t⌝
├
├
⊢ t ⇔ t
=TEX
=SML
val ⦏pp'refl_conv⦎ : CONV = (fn (tm : TERM) =>
	mk_current_thm([], mk_eq(tm, tm))
);
=TEX
\subsection{pp'simple\_$\beta$\_conv}
=FRULE 1 Conversion
pp'simple_β_conv
⌜(λ x ⦁ t1[x]) t2⌝
├
├
⊢ (λ x ⦁ t1[x]) t2 = t1[t2]
=TEX
Or, if the term is of type $BOOL$:
=FRULE 1 Conversion
pp'simple_β_conv
⌜(λ x ⦁ t1[x]) t2⌝
├
├
⊢ (λ x ⦁ t1[x]) t2 ⇔ t1[t2]
=TEX
=SML
val ⦏pp'simple_β_conv⦎ : CONV = (fn (tm : TERM) =>
let	val ((vr, t1), t2) = ((dest_simple_λ ** Combinators.I)(dest_app tm)
		handle complaint =>
		case (area_of complaint) of
		"dest_simple_λ" => term_fail "simple_β_conv" 6012 [tm]
		| "dest_app" => term_fail "simple_β_conv" 6012 [tm]
		| _ => reraise complaint (area_of complaint));
	val rhs = var_subst [(t2, vr)] t1;
in
	mk_current_thm([], mk_eq(tm, rhs))
end);
=TEX
\subsection{pp'suc\_conv}
We have no specification for this.
=FRULE 1 Rule
pp'suc_conv
(mk_ℕ (m+1))
├
├
⊢ ^(mk_ℕ(m+1)) = Suc ^(mk_ℕ m)
=TEX
=FRULE 1 Rule
pp'suc_conv
(mk_ℕ 0)
├
├
⊢ 0 = Zero
=TEX
The following inference rule relies on the well-formedness of the following constants.
=SML
local
	val ⦏Suc⦎ = mk_const("Suc", mk_→_type(ℕ, ℕ));
	val ⦏Zero⦎ = mk_const("Zero", ℕ);
in
=TEX
=SML
val ⦏pp'suc_conv⦎ : CONV = (fn (tm : TERM) =>
let	val nint = (dest_ℕ tm
		handle complaint =>
		pass_on complaint "dest_ℕ" "suc_conv");

	val rhs = if nint = zero
		then Zero
		else mk_app(Suc, mk_ℕ (nint @- one));
in
	mk_current_thm([], mk_eq(tm, rhs))
end);
end;
=TEX
\subsection{pp'string\_conv}
We have no specification for this.
=FRULE 1 Rule
pp'string_conv
(mk_string ("c" :: t))
├
├
⊢ ^(mk_string("c" :: t)) =
Cons ^(mk_char("c")) ^(mk_string(t))
=TEX
Or:
=FRULE 1 Rule
pp'string_conv
(mk_string "")
├
├
⊢ ^(mk_string("")) = Nil
=TEX
The following inference rule relies on the well-formedness of the following constants.
=SML
local
	val SCons = mk_const("Cons", mk_→_type(CHAR, mk_→_type(STRING, STRING)));
	val SNil = mk_const("Nil", STRING);
in
val ⦏pp'string_conv⦎ : CONV = (fn (tm : TERM) =>
let	val sex = explode(dest_string tm)
		handle complaint =>
		pass_on complaint "dest_string" "string_conv";

	val rhs = if is_nil sex
		then SNil
		else list_mk_app(SCons,
			[mk_char(hd sex),
			mk_string(implode (tl sex))]);

in
	mk_current_thm([], mk_eq(tm, rhs))
end);
end;
=TEX
\subsection{pp'char\_conv}
We have no specification for this.
=FRULE 1 Rule
pp'char_conv
(mk_char("c"))
├
├
⊢ ^(mk_char("c")) = AbsChar ^(ord "c")
=TEX
The following inference rule relies on the well-formedness of the following constant.
=SML
local
	val AbsChar = mk_const("AbsChar", mk_→_type(ℕ, CHAR));
in
val ⦏pp'char_conv⦎ : CONV = (fn (tm : TERM) =>
let	val cnum = integer_of_int(ord(dest_char tm))
		handle complaint =>
		pass_on complaint "dest_char" "char_conv";
	
	val rhs = mk_app(AbsChar, mk_ℕ cnum);
in
	mk_current_thm([], mk_eq(tm, rhs))
end);
end;
=TEX
\section{BUILT-IN INFERENCE RULES OF ADT $THM$}
The inference rules in this section are justified by
the informal reasoning given in \cite{DS/FMU/IED/DTD006}.
They should mimic the end results of the reasoning stated there, for any acceptable input.
\subsection{pp'eq\_sym\_rule}
=FRULE 1 Rule
pp'eq_sym_rule
├
Γ ⊢ t1 = t2
├
Γ ⊢ t2 = t1
=TEX
And:
=FRULE 1 Rule
pp'eq_sym_rule
├
Γ ⊢ t1 ⇔ t2
├
Γ ⊢ t2 ⇔ t1
=TEX
=SML
fun ⦏pp'eq_sym_rule⦎ (thrm : THM) : THM = (
let	val dummy = check_thm "eq_sym_rule" thrm;

	val (asms, (lhs_concl, rhs_concl)) = dest_thm_eq "eq_sym_rule" 6020 thrm;

	val new_concl = mk_eq(rhs_concl, lhs_concl);
in
	mk_current_thm(asms, new_concl)
end);
=TEX
\subsection{pp'list\_simple\_∀\_elim}
=FRULE 1 Rule
pp'list_simple_∀_elim
[..., ⌜t1⌝, ...]
├
Γ ⊢ ∀ ...x... ⦁ t2[..., xn, ...]
├
Γ ⊢ t2'[..., tn, ...]
=TEX
In the following, when creating the local variable $subs$, of substitutions
to be carried out, we reverse the order of the list so that
if there are two nested quantifiers with the same variable,
the inner quantifier's instantiation has effect, and the
outer one is ignored.
=SML
local
	fun simple_n_∀ 0 acc tm = (acc, tm)
	| simple_n_∀ n acc tm = (
	let val (v, bdy) = dest_simple_∀ tm
	in
		simple_n_∀ (n-1) (acc @ [v]) bdy
	end);
in
fun ⦏pp'list_simple_∀_elim⦎ (tml : TERM list)
	(thrm : THM as Thm{sequent = (asms, concl), ...}) : THM = (
let	val dummy = check_thm "list_simple_∀_elim" thrm;

	val ninsts = length tml;
	
	val (bvl, bdy) = (simple_n_∀ ninsts [] concl
		handle complaint =>
		case (area_of complaint) of
		"dest_simple_∀" => fail "list_simple_∀_elim" 6018
			[fn () => string_of_thm thrm,
			fn () => string_of_int ninsts]
		| _ => reraise complaint (area_of complaint));

	val subs = rev(combine tml bvl);

	val new_concl = (var_subst subs bdy
		handle complaint =>
		pass_on complaint "var_subst" "list_simple_∀_elim");
in
	mk_current_thm(asms, new_concl)
end);
end; (* local fun simple_n_∀ = *)
=TEX
\subsection{pp'eq\_trans\_rule}
=FRULE 1 Rule
pp'eq_trans_rule
├
Γ1 ⊢ t1 = t2; Γ2 ⊢ t2' = t3
├
Γ1 ∪ Γ2 ⊢ t3
=TEX
And:
=FRULE 1 Rule
pp'eq_trans_rule
├
Γ1 ⊢ t1 ⇔ t2; Γ2 ⊢ t2' ⇔ t3
├
Γ1 ∪ Γ2 ⊢ t1 ⇔ t3
=TEX
=SML
fun ⦏pp'eq_trans_rule⦎ (thrm1 : THM) (thrm2 : THM) : THM = (
let	val dummy = (check_thm "eq_trans_rule" thrm1;
		check_thm "eq_trans_rule" thrm2);

	val (hyps1, (lhs_concl1, rhs_concl1)) = dest_thm_eq "eq_trans_rule" 6020 thrm1;

	val (hyps2, (lhs_concl2, rhs_concl2)) = dest_thm_eq "eq_trans_rule" 6020 thrm2;

	val dummy = if rhs_concl1 ~=$ lhs_concl2
		then ()
		else thm_fail "eq_trans_rule" 6022 [thrm1, thrm2];

	val new_concl = mk_eq(lhs_concl1, rhs_concl2);
in
	mk_current_thm(hyps1 term_union hyps2, new_concl)
end);
=TEX
\subsection{pp'mk\_app\_rule}
=FRULE 1 Rule
pp'mk_app_rule
├
Γ1 ⊢ u1 = u2; Γ2 ⊢ v1 = v2
├
Γ1 ∪ Γ2 ⊢ u1 v1 = u2 v2
=TEX
=SML
fun ⦏pp'mk_app_rule⦎ (thrm1 : THM) (thrm2 : THM) : THM = (
let	val dummy = (check_thm "mk_app_rule" thrm1;
		check_thm "mk_app_rule" thrm2);

	val (hyps1, (lhs_concl1, rhs_concl1)) = dest_thm_eq "mk_app_rule" 6020 thrm1;

	val (hyps2, (lhs_concl2, rhs_concl2)) = dest_thm_eq "mk_app_rule" 6020 thrm2;

	val new_concl = mk_eq(mk_app(lhs_concl1, lhs_concl2),
		mk_app(rhs_concl1, rhs_concl2))
		handle complaint =>
		case (area_of complaint) of
		"mk_app" => thm_fail "mk_app_rule" 6023 [thrm1, thrm2]
		| _ => reraise complaint (area_of complaint);
in
	mk_current_thm(hyps1 term_union hyps2, new_concl)
end);
=TEX
\subsection{pp'⇔\_mp\_rule}
=FRULE 1 Rule
pp'⇔_mp_rule
├
Γ1 ⊢ t1 ⇔ t2; Γ2 ⊢ t1'
├
Γ1 ∪ Γ2 ⊢ t2
=TEX
=SML
fun ⦏pp'⇔_mp_rule⦎ (thrm1 : THM)
	(thrm2 : THM as Thm{sequent = (hyps2, concl2), ...}) : THM = (
let	val dummy = (check_thm "⇔_mp_rule" thrm1;
		check_thm "⇔_mp_rule" thrm2);

	val (hyps1, (lhs_concl1, rhs_concl1)) = dest_thm_eq "⇔_mp_rule" 6030 thrm1;

	val side_effect = if type_of lhs_concl1 =: BOOL
		then ()
		else thm_fail "⇔_mp_rule" 6030 [thrm1];

	val new_concl = if lhs_concl1 ~=$ concl2
		then rhs_concl1
		else thm_fail "⇔_mp_rule" 6024 [thrm1, thrm2];
in
	mk_current_thm(hyps1 term_union hyps2, new_concl)
end);
=TEX
\subsection{pp'simple\_∀\_intro}
=FRULE 1 Rule
pp'simple_∀_intro
⌜x⌝
├
Γ ⊢ t
├
Γ ⊢ ∀ x ⦁ t
=TEX
=SML
fun ⦏pp'simple_∀_intro⦎ (tm : TERM)
	(thrm : THM as Thm{sequent = (asms, concl), ...}) : THM = (
let	val dummy = check_thm "simple_∀_intro" thrm;
		
	val dummy = (if not(is_var tm)
		then term_fail "simple_∀_intro" 3007 [tm]
		else if list_is_free_in tm asms
		then term_fail "simple_∀_intro" 6005 [tm]
		else ());

	val new_concl = mk_simple_∀(tm, concl);
in
	mk_current_thm(asms, new_concl)
end);
=TEX
\subsection{pp'inst\_term\_rule}
=FRULE 1 Rule
pp'inst_term_rule
[..., (⌜ti⌝, ⌜xi⌝), ...]
├
Γ ⊢ t[x1, ..., xn]
├
Γ ⊢ t[t1, ..., tn]
=TEX
=SML
fun ⦏pp'inst_term_rule⦎ (tvl : (TERM * TERM)list)
	(thrm : THM as Thm{sequent = (asms, concl), ...}) : THM = (
let	val dummy = check_thm "inst_term_rule" thrm;

	val svars = (map (fn (t, x) => (
		let val (_, xty) = (dest_var x
			handle complaint =>
			pass_on complaint "dest_var" "inst_term_rule")
		in
			if type_of t =: xty
			then x
			else term_fail "inst_term_rule" 6027 [t, x]
		end))		
		tvl);
		
	fun rogue x = list_is_free_in x asms;

	val dummy = if any svars rogue
		then term_fail "inst_term_rule" 6028
			[find svars rogue]
		else ();

	val new_concl = var_subst tvl concl;
in
	mk_current_thm(asms, new_concl)
end);
=TEX
\subsection{pp'plus\_conv}
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
It is more efficient to implement the addition digit-by-digit rather than converting to
integers and using integer arithmetic. The following function does this
on the assumption that the operands are strings of decimal digits (which will be guaranteed
by the discriminator function
=INLINEFT
is_ℕ
=TEX
\ at the point of use).
If the operands have no leading zeroes, then neither will the result.
=SML
local
val ord0 = ord "0";
fun ⦏add_decimal⦎ (x : string) (y : string) : string = (
	let	open SML97BasisLibrary;
		fun digit i z = (
			if	i >= 0
			then	Char.ord(String.sub(z, i)) - ord0
			else	0
		);
		fun recur acc carry i j = (
			if	i >= 0 orelse j >= 0
			then	let	val r = digit i x + digit j y + carry;
					val (carry, r) =
						if	r >= 10
						then	(1, r - 10)
						else	(0, r);
					val d = Char.chr(r + ord0);
				in	recur (d::acc) carry (i - 1) (j - 1)
				end
			else if	carry = 0
			then	String.implode acc
			else	String.implode (#"1" :: acc)
		);
	in	recur [] 0 (size x - 1) (size y - 1)
	end
);
in
val ⦏pp'plus_conv⦎ : CONV = (fn (tm : TERM) =>
let	val (m, n) = dest_bin_op "plus_conv" 6085 "+" tm;
	val _ =
		if is_ℕ m andalso is_ℕ n
		then ()
		else fail "plus_conv" 6085 [fn () => string_of_term tm];
	val mds = fst(dest_const m);
	val nds = fst(dest_const n);
	val rhs = mk_const (add_decimal mds nds, ℕ);
in
	mk_current_thm([], mk_eq(tm, rhs))
end);
end;
=TEX

\section{END OF THE ADT}
=SML
end; (* of abstype THM *)
=TEX
=SML
fun ⦏pp'string_of_thm⦎ (t : THM) : string = (
	let	val {sequent = (asms, conc), ...} = pp'dest_thm t;
	in	format_list string_of_term asms "," ^ "⊢" ^ string_of_term conc
	end
);
=TEX
=SML
end; (* of structure pp'Kernel *)
val _ = pp'Kernel.pp'set_string_of_thm pp'Kernel.pp'string_of_thm;
=TEX
\section{SEALING OFF THE TYPES AND TERMS MODULE}
=SML
structure pp'TypesAndTerms : pp'TypesAndTerms = struct
	open pp'TypesAndTerms;
	fun ⦏new_types_and_terms_state⦎ (() : unit) : TYPES_AND_TERMS_STATE = (
		error "new_types_and_terms_state" 3029 []
	);
	fun ⦏set_types_and_terms_state⦎ (_: TYPES_AND_TERMS_STATE) : unit = (
		error "new_types_and_terms_state" 3029 []
	);
end  (* of structure pp'TypesAndTerms *);
=TEX
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}

=IGN
********************************************************************************
dtd001.doc: this file is part of the PPDev system

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

\def\Title{Detailed Design for Standard ML Utilities}

\def\AbstractText{Utility functions for use in the prototype HOL system are given a detailed design in this document.}

\def\Reference{DS/FMU/IED/DTD001}

\def\Author{K.Blackburn}


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
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Detailed Design for Standard ML Utilities}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Detailed Design for Standard ML Utilities}
%% LaTeX2e port: \TPPref{DS/FMU/IED/DTD001}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 2.42 $ %
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2013/08/03 15:34:22 $ %
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: %\TPPstatus{Approved}
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.Blackburn & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & Project Manager}
%% LaTeX2e port: \TPPabstract{Utility functions for use in the prototype HOL
%% LaTeX2e port: system are given a detailed design in this document.}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	    Library
%% LaTeX2e port: }}
%% LaTeX2e port: \begin{document}
%% LaTeX2e port: \makeTPPfrontpage
%% LaTeX2e port: \vfill
%% LaTeX2e port: \begin{centering}
%% LaTeX2e port: 
%% LaTeX2e port: \bf Copyright \copyright\ : Lemma 1 Ltd.. \number\year
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
\item[Issue 2.1 (1991/07/19) (19th July 1991)]
Approved version of issue 1.14.
\item[Issue 2.2 (1991/11/21) (12th November 1991)]
Addition of sparse arrays.

\item[Issue 2.3 (1992/01/20), \FormatDate{92/01/20} ] Updated to use new fonts.
\item [Issue 2.4 (1992/01/22) (22nd January 1991)]
Changes as required by CR0006
\item[Issue 2.5 (1992/02/03) (3rd February 1992)]
Changed $diag\_$ to $raw\_diag\_$.
\item[Issue 2.6 (1992/03/30) (30th March 1992)]
Added $filter$.
\item[Issue 2.7 (1992/03/31) (31st March 1992)]
Removed $gensym$.
\item [Issue 2.8 (1992/04/09) (1st April 1992)]
Renamed $set\_eq$ to $~=$.
\item [Issue 2.9 (1992/04/14) (13th April 1992)]
Changes due to CR0017.
\item [Issue 2.10 (1992/05/21) (21st May 1992)]
Fixing typos.
\item [Issue 2.11 (1992/05/28) (28th May 1992)]
Improved description of $format\_list$.
\item [Issue 2.12 (1992/12/14) (14th December 1992)]
Added $set\_stats$.
\item [Issue 2.13 (1992/12/15) (15th December 1992)]
Changed default of ``profiling'' flag.
\item [Issue 2.14 (1999/03/06)-2.17 (1999/03/07) (6th March 1999)]
Added new section on the signature $Integer$.
\item [Issue 2.18 (2000/08/02) (20th July 2000)]
Fixing typo.
\item [Issue 2.19 (2001/07/17) (16th July 2001)]
Added signature for $DynamicArray$.
\item [Issue 2.20 (2001/08/09) (9th August 2001)]
Added signature for $Timing$.
\item[Issue 2.21 (2001/12/02)]
Poly/ML port.
\item [Issue 2.22 (2002/06/01)]
Added key-based efficient dictionary access functions and stop-watch timer functions.
\item[Issue 2.23 (2002/06/03)]
Added order-preserving efficient dictionaries.
\item[Issue 2.25 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 2.26 (2002/10/17)] PPDev-specific updates for open source release
\item [Issue 2.27 (2003/01/07)] Added set inclusion test for lists.
\item[Issue 2.28 (2003/06/11)] Fixed description of ordered efficient dictionary functions.
\item[Issue 2.29 (2004/06/19)] Added {\em list\_e\_enter}.
\item[Issues 2.30 (2004/09/07),2.31 (2004/09/07)] Added {\em e\_stats} and {\em e\_dict\_of\_oe\_dict}.
\item[Issues 2.32 (2005/04/24)] Fixed {\em app} function.
\item[Issue 2.33 (2005/09/02)] Added {\em oe\_key\_flatten}.
\item[Issues 2.34 (2005/12/13)] Fixed {\LaTeX} errors.
\item[Issue 2.35 (2006/04/20)] Added missing error message.
\item[Issue 2.36 (2006/12/02)] Support for floating point literals.
\item[Issue 2.37 (2007/08/15)] Added ordering function for integer types;
added several functions for constructing new ordering functions from old.
\item[Issue 2.38 (2007/08/28)] Added {\em opt\_order1}.
\item[Issue 2.39 (2007/09/08)] Added new structure $Order$.
\item[Issue 2.40 (2008/12/10)] Added {\em merge}.
\item[Issues 2.41 (2013/08/01)--2.43 (2013/11/02)] Added search tree structure.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.

\item[2015/11/23]
Now allows SLRP to be compiled with MLton.

%%%% END OF CHANGES HISTORY %%%%
\end{description}
%\subsection{Changes Forecast}
\section{GENERAL}
\subsection{Scope}
This document contains a detailed design of the functional tool-kit, called for by section 4.1.2 of the Release 1 ICL HOL Product Requirement Specification \cite{DS/FMU/IED/DEF004},
and by the high level design \cite{DS/FMU/IED/HLD006}.
The design is
implemented in \cite{DS/FMU/IED/IMP001}.

\subsection{Introduction}
\subsubsection{Purpose and Background}
This document gives a detailed design, in the form of signatures and informal descriptions,  of a number of general purpose
Standard ML objects
which are of use in coding the prototype HOL system.
Many of these are general functions which
support some common functional programming idioms.
\subsubsection{Dependencies}
The definitions in this document are self-contained
and depend only on the Standard ML facilities defined
in \cite{Harper86}.
\subsubsection{Deficiencies}
The treatment of output supports only output
of messages to the terminal (i.e. UNIX standard output),
and this document contains no input functions.
These facilities may need revision.
\subsubsection{Possible Enhancements}
Versions of the general functions defined here
may well be supplied with particular
Standard ML compilers. It may improve performance if
the supplied versions are used.
\section{INFIX DIRECTIVES}
A Standard ML $infix$ command must be given at the `top level'.
Thus we give the commands here for those functions declared in the following signatures.
=SML
infix 4 drop;
infix 4 less;
infix 4 grab;
infix 4 cup;
infix 3 mem;
infix 3 subset;
infix 3 ~=;
infix 3 ~<=;
infix 4 diff;
infix 4 overwrite;
infix 4 list_overwrite;
infix 4 roverwrite;
infix 4 list_roverwrite;
infix 4 THEN_O;
infix 5 from;
infix 5 to;
infix 4 **;
infix 4 fun_and;
infix 4 fun_or;
infix 7 idiv imod @*;
infix 6 @+ @-;
infix 4 @< @> @<= @>=;
=TEX
The binding precedences are chosen reflect ``most likely use''.
A higher precedence indicates tighter binding.
Thus we choose higher precedences for functions that construct
objects (e.g. $cup$) rather than test for properties (e.g. $mem$)
so that we test ``the largest constructed objects'' rather than
their constituents.

For comparison Standard ML sets the following precedences:

\begin{tabular}{| c | l |}\hline
Precedence & Functions \\ \hline
7 & $/$, $div$, $mod$, $*$ \\
6 & $+$, $-$, \verb"^" \\
5 & $::$, $@$ \\
4 & $=$, $<>$, $<$, $>$, $<=$, $>=$ \\
3 & $:=$, $o$ \\ \hline
\end{tabular}

As $::$ is used to construct sets that may be operated on by, e.g., $overwrite$, $overwrite$ has precedence 4, and thus
set equality and set inclusion, $~=$ and $~< =$, have precedence 3.
Prefix function application has higher precedence than all infix functions.
Language keywords (e.g. $andalso$, $orelse$) have a lower precedence than any infix function.

\section{SHARED TYPES IN THIS DOCUMENT}
=DOC
signature ⦏UtilitySharedTypes⦎ = sig
=DESCRIBE
Any new types in the Utility structures mentioned in more than one signature
will be declared in this signature.
=ENDDOC
The associated structure is also declared in this document,
as the types involved are required to declare the signatures
that follow this one.
=DOC
datatype 'a ⦏OPT⦎ = ⦏Nil⦎ | ⦏Value⦎ of 'a;
=DESCRIBE
A type of ``optional'' values.
=USES
A typical use for the datatype $'a\;OPT$ is  in implementing
partial functions for which raising an exception
is not an appropriate action for undefined cases.
=SEEALSO
$force\_value$, $is\_Nil$
=ENDDOC
=DOC
type 'a ⦏S_DICT⦎;
=DESCRIBE
The type of simple dictionaries: $(string\ *\ 'a)\ list$.
=SEEALSO
Signature $SimpleDictionary$.
=ENDDOC
=SML
end (* UtilitySharedTypes signature *);
=TEX
We now declare the shared type structure:
=SML
structure ⦏UtilitySharedTypes⦎ : UtilitySharedTypes = struct
	datatype 'a ⦏OPT⦎ = ⦏Nil⦎ | ⦏Value⦎ of 'a;
	type 'a ⦏S_DICT⦎ = (string * 'a) list;
end;
open UtilitySharedTypes;
=TEX
\section{LIST UTILITIES}
=DOC
signature ⦏ListUtilities⦎ = sig
=DESCRIBE
Holds a variety of utility Standard ML list functions.
=ENDDOC
\subsection{Functions For Type $'a\ OPT$}
=DOC
val ⦏force_value⦎ : 'a OPT -> 'a;
=DESCRIBE
Force an object of type  $'a\;OPT$ (q.v.) into one of type $'a$:
=GFT Definition
force_value (Value x) = x
=TEX
=FAILURE
1001	Argument may not be Nil
=ENDDOC
=DOC
val ⦏is_Nil⦎ : 'a OPT -> bool
=DESCRIBE
Is the argument equal to $Nil$  (q.v.).
=GFT Definition
is_Nil Nil = true
| is_Nil _ = false
=TEX
=ENDDOC
We choose the unconventional capitalisation of $is\_Nil$ to
avoid clashing with the name $is\_nil$ (q.v.).
\subsection{A Miscellany}
$hd$ and $tl$ are the usual destructor functions for
lists.
=DOC
val ⦏hd⦎ : 'a list -> 'a;
val ⦏tl⦎ : 'a list -> 'a list;
=DESCRIBE
$hd$ returns first element of a list,
$tl$ returns all but the first element of a list.
=GFT Definition
hd (a :: x) = a
tl (a :: x) = x
=TEX
=FAILURE
1002	An empty list has no head
1003	An empty list has no tail
=ENDDOC
=DOC
val ⦏fold⦎ : ('a * 'b -> 'b) -> 'a list -> 'b -> 'b;
=DESCRIBE
Fold a list into a single value:
=GFT Definition
fold f [x1, x2, ...., xk] b = f(x1, f(x2, ... f (xk, b))...)
=TEX
=SEEALSO
revfold
=ENDDOC
=DOC
val ⦏revfold⦎ : ('a * 'b -> 'b) -> 'a list -> 'b -> 'b;
=DESCRIBE
Fold a list into a single value:
=GFT Definition
revfold f [x1, x2, ...., xk] b = f(xk, ..., f(x2, f (x1, b))...)
=TEX
=SEEALSO
fold
=ENDDOC
=DOC
val ⦏length⦎ : 'a list -> int;
=DESCRIBE
$length$ returns the length of a list.
Note that the Standard ML function $size$ can be used to find the length of strings.
=ENDDOC
=DOC
val ⦏filter⦎ : ('a -> bool) -> 'a list -> 'a list;
=DESCRIBE
$filter$ $pred$ $list$ returns a list that is $list$, except that
elements of the list that don't satisfy $pred$ are dropped.
=GFT Definition
filter pred [] = []
| filter pred (a :: x) = (
	if pred a
	then (a :: filter pred x)
	else filter pred x);
=TEX
=ENDDOC
\subsection{Lists as Sets}
$drop$,  $less$ and $grab$ are infix operators with priority 4 (lower than
`::' and higher than `=').
$drop$ and $less$ are essentially the set difference operation.
$grab$ is union with a singleton set.

=DOC
val ⦏drop⦎ : 'a list * ('a -> bool) -> 'a list;
=DESCRIBE
$list\,drop\,cond$ is the list obtained by deleting all members
of $list$ for which the boolean function $cond$ is true.
=SEEALSO
$less$
=ENDDOC
=DOC
val ⦏less⦎ : ''a list * ''a -> ''a list;
=DESCRIBE
$list\,less\,what$ is the list obtained by deleting all members
of $list$ which are equal to $what$.
=SEEALSO
$drop$
=ENDDOC
=DOC
val ⦏grab⦎ : ''a list * ''a -> ''a list;
=DESCRIBE
$list\, grab\,what$ is the list obtained by inserting $what$
at the head of $list$ if it is not a member of it already,
in which case $list$ is returned.
=SEEALSO
$insert$
=ENDDOC
=DOC
val ⦏insert⦎ : ('a * 'a -> bool) -> 'a list -> 'a -> 'a list;
=DESCRIBE
=INLINEFT
insert eq list what
=TEX
is the list obtained by inserting $what$
at the head of $list$ if it is not a member, by equality test $eq$, of it already,
in which case $list$ is returned.
=SEEALSO
$grab$
=ENDDOC
=DOC
val ⦏union⦎ : ('a * 'a -> bool) -> 'a list -> 'a list -> 'a list;
=SYNOPSIS
A prefix binary union operation for lists, with parameterised equality test.
=DESCRIBE
$union$ is essentially a binary union operation for lists.
Since we need it to work on types which are
not equality types, it has a parameter giving the relation to be
used to determine equality of members of the lists.
In some cases it may be important for the order of members of the union
to be known. The rule is that $union\,eq\,list1\,list2$ is
the list obtained by prepending those elements of $list1$ not already present in $list2$, to the list $list2$.
Presence for $x$ in the list being created being
that there is a
member, $y$, of the list being created with $eq(x,\,y)\,=\,true$.
If $list1$ contains duplicates then all but the rightmost will be eliminated,
but those in $list2$ will not be.
Note also that if one of the lists is small it is better
supplied as the first list argument if efficiency is of
the essence.
=GFT Definition
union eq (list1 @ [a]) list2 = union eq list1 (
	if present eq a list2
	then list2
	else (a :: list2)
) | union eq [] list2 = list2
=TEX
=SEEALSO
$cup$, $list\_union$
=ENDDOC
=DOC
val ⦏cup⦎ : ''a list * ''a list -> ''a list;
=DESCRIBE
An infix binary union operation for lists, with Standard ML equality test.
It has the same result ordering as $union$(q.v.).
=SEEALSO
$list\_cup$, $union$
=ENDDOC
=DOC
val ⦏list_union⦎ : ('a * 'a -> bool) -> 'a list list -> 'a list;
=DESCRIBE
A distributed union operation for lists, with parameterised equality test:
=GFT Definition
list_union eq [list0, list1, ..., listn] =
	union eq list0 (union eq list1 (...(union eq listn [])...))
=TEX
=SEEALSO
$union$, $list\_cup$.
=ENDDOC
=DOC
val ⦏list_cup⦎ : ''a list list -> ''a list;
=DESCRIBE
A distributed union operation for lists, with Standard ML equality test.
=GFT Definition
list_cup [list0, list1, ..., listn] =
	list0 cup (list1 cup ...(listn cup [])...))
=TEX
=SEEALSO
$cup$, $list\_union$
=ENDDOC
=DOC
val ⦏find⦎ : 'a list -> ('a -> bool) -> 'a;
=DESCRIBE
$find$ $list$ $cond$ searches for the first member of $list$ satisfying $cond$, and
returns such a member if there is one.
=FAILURE
1004	Element cannot be found in list
=ENDDOC
=DOC
val ⦏contains⦎ : ''a list -> ''a -> bool;
=DESCRIBE
$contains$ $list$ $x$ searches for a member of
$list$ equal to $x$ and returns true iff. it finds one.
=SEEALSO
$present$, $mem$
=ENDDOC
=DOC
val ⦏mem⦎ : ''a * ''a list -> bool;
=DESCRIBE
$x$ $mem$ $list$ searches for a member of
$list$ equal to $x$ and returns true iff. it finds one.
=SEEALSO
$contains$, $present$
=ENDDOC
=DOC
val ⦏present⦎ : (('a * 'a) -> bool) -> 'a -> 'a list -> bool;
=DESCRIBE
$present$ $eq$ $x$ $list$ searches for a member, $y$, of
$list$ that satisfies $eq(x,y)$  and returns true iff. it finds one.
=SEEALSO
$contains$, $mem$
=ENDDOC
=DOC
val ⦏any⦎ : 'a list -> ('a -> bool) -> bool;
=DESCRIBE
$any$ $list$ $cond$ is true iff. some element of $list$ satisfies $cond$.
=ENDDOC
=DOC
val ⦏all⦎ : 'a list -> ('a -> bool) -> bool;
=DESCRIBE
$all$ $list$ $cond$ is true iff. all elements of $list$ satisfy $cond$.
=ENDDOC
=DOC
val ⦏subset⦎ : ''a list * ''a list -> bool;
=DESCRIBE
$l1\,subset\,l2$ is true iff. all the elements of $l1$
are  also elements of $l2$
=SEEALSO
$~=$
=ENDDOC
=DOC
val ⦏~<=⦎ : ''a list * ''a list -> bool;
val ⦏~=⦎ : ''a list * ''a list -> bool;
=DESCRIBE
$l1\,~<=\,l2$ is true iff. every member of $l1$ is also a member of $l2$.
$l1\,~=\,l2$ is true iff. the set of members of $l1$ is equal to the set of members of $l2$.
=SEEALSO
$subset$
=ENDDOC
=DOC
val ⦏diff⦎ : ''a list * ''a list -> ''a list;
=DESCRIBE
$diff$ is the set difference operator for lists.
=ENDDOC
\subsection{Lists of Pairs as Functions and Relations}
We will frequently implement functions or relations as
lists of pairs. The following associative lookup functions are
used to implement application of such functions or relations.
We will need a number of variations on the same theme.
Each variation has left- and right-handed versions.

=DOC
val ⦏lassoc1⦎ : (''a * ''a) list -> ''a -> ''a;
=DESCRIBE
$lassoc1$ $alist$ $arg$ is $x$, where $(arg,\ x)$ is the first element of $alist$ with $arg$ as its left item.
The function
is made total by taking $arg$ as the result if there is no
appropriate member of the list.
=SEEALSO
lassoc$\cal N$ and rassoc$\cal N$, where ${\cal N} =\ 1 \ldots 5$.
=ENDDOC
=DOC
val ⦏rassoc1⦎ : (''a * ''a) list -> ''a -> ''a;
=DESCRIBE
$rassoc1$ $alist$ $arg$ is $x$, where $(x,\ arg)$ is the first element of $alist$ with $arg$ as its right item.
The function
is made total by taking $arg$ as the result if there is no
appropriate member of the list.
=SEEALSO
lassoc$\cal N$ and rassoc$\cal N$, where ${\cal N} =\ 1 \ldots 5$.
=ENDDOC

=DOC
val ⦏lassoc2⦎ : (''a * 'b) list -> (''a -> 'b) -> ''a -> 'b;
=DESCRIBE
$lassoc2$ $alist$ $f$ $arg$ is $x$, where $(arg,\ x)$ is the first element of $alist$ with $arg$ as its left item.
The function
is made total by returning $f\ arg$ if there is no
appropriate member of the list.
=SEEALSO
lassoc$\cal N$ and rassoc$\cal N$, where ${\cal N} =\ 1 \ldots 5$.
=ENDDOC
=DOC
val ⦏rassoc2⦎ : ('a * ''b) list -> (''b -> 'a) -> ''b -> 'a;
=DESCRIBE
$rassoc2$ $alist$ $f$ $arg$ is $x$, where $(x,\ arg)$ is the first element of $alist$ with $arg$ as its left item.
The function
is made total by returning $f\ arg$ if there is no
appropriate member of the list.
=SEEALSO
lassoc$\cal N$ and rassoc$\cal N$, where ${\cal N} =\ 1 \ldots 5$.
=ENDDOC

=DOC
val ⦏lassoc3⦎ : (''a * 'b) list -> ''a -> 'b;
=DESCRIBE
$lassoc3$ $alist$ $arg$ is $x$, where $(arg,\ x)$ is the first element of $alist$ with $arg$ as its left item.
=FAILURE
1005	No such value in association list
=SEEALSO
lassoc$\cal N$ and rassoc$\cal N$, where ${\cal N} =\ 1 \ldots 5$.
=ENDDOC
=DOC
val ⦏rassoc3⦎ : ('a * ''b) list -> ''b -> 'a;
=DESCRIBE
$rassoc3$ $alist$ $arg$ is $x$, where $(x,\ arg)$ is the first element of $alist$ with $arg$ as its right item.
=FAILURE
1005	No such value in association list
=SEEALSO
lassoc$\cal N$ and rassoc$\cal N$, where ${\cal N} =\ 1 \ldots 5$.
=ENDDOC

=DOC
val ⦏lassoc4⦎ : (''a * 'b) list -> 'b -> ''a -> 'b;
=DESCRIBE
$lassoc4$ $alist$ $default$ $arg$ is $x$, where $(arg,\ x)$ is the first element of $alist$ with $arg$ as its left item.
The function
is made total by returning $default$ if there is no
appropriate member of the list.
=SEEALSO
lassoc$\cal N$ and rassoc$\cal N$, where ${\cal N} =\ 1 \ldots 5$.
=ENDDOC
=DOC
val ⦏rassoc4⦎ : ('a * ''b) list -> 'a -> ''b -> 'a;
=DESCRIBE
$rassoc4$ $alist$ $default$ $arg$ is $x$, where $(x,\ arg)$ is the first element of $alist$ with $arg$ as its right item.
The function
is made total by returning $default$ if there is no
appropriate member of the list.
=SEEALSO
lassoc$\cal N$ and rassoc$\cal N$, where ${\cal N} =\ 1 \ldots 5$.
=ENDDOC

=DOC
val ⦏lassoc5⦎ : (''a * 'b) list -> ''a -> 'b OPT;
=DESCRIBE
$lassoc5$ $alist$ $arg$ is $Value\ x$, where $(arg,\ x)$ is the first element of $alist$ with $arg$ as its left item.
The function
is made total by returning $Nil$ if there is no
appropriate member of the list.
=SEEALSO
lassoc$\cal N$ and rassoc$\cal N$, where ${\cal N} =\ 1 \ldots 5$.
=ENDDOC
=DOC
val ⦏rassoc5⦎ : ('a * ''b) list -> ''b -> 'a OPT;
=DESCRIBE
$rassoc5$ $alist$ $arg$ is $Value\ x$, where $(x,\ arg)$ is the first element of $alist$ with $arg$ as its right item.
The function
is made total by returning $Nil$ if there is no
appropriate member of the list.
=SEEALSO
lassoc$\cal N$ and rassoc$\cal N$, where ${\cal N} =\ 1 \ldots 5$.
=ENDDOC
=DOC
val ⦏overwrite⦎ : (''a * 'b) list * (''a * 'b) -> (''a * 'b) list;
=DESCRIBE
$alist$ $overwrite$ $(a,b)$ gives the list in which the first pair in $alist$ that has the left item $a$ is replaced with the pair $(a, b)$.
If no such pair is found in $alist$ then it returns the list of $(a,b)$ appended to the tail of $alist$.
=SEEALSO
$roverwrite$, $list\_overwrite$
=ENDDOC
=DOC
val ⦏list_overwrite⦎ : (''a * 'b) list * (''a * 'b) list -> (''a * 'b) list;
=DESCRIBE
$alist$ $list\_overwrite$ $olist$ overwrites $alist$ with each element of $olist$, using $overwrite$(q.v.).
=GFT Definition
fun alist list_overwrite olist = (
	fold (fn (l1, l2) => l2 overwrite l1) olist alist
)
=TEX
=SEEALSO
$overwrite$, $list\_roverwrite$.
=ENDDOC
=DOC
val ⦏roverwrite⦎ : ('a * ''b) list * ('a * ''b) -> ('a * ''b) list;
=DESCRIBE
$alist$ $roverwrite$ $(a,b)$ gives the list that in which the first pair in $alist$ that has the right item $b$ is replaced with the pair $(a, b)$.
If no such pair is found in $alist$ then it returns the list of $(a,b)$ appended to the end of $alist$.
=SEEALSO
$overwrite$, $list\_roverwrite$
=ENDDOC
=DOC
val ⦏list_roverwrite⦎ : ('a * ''b) list * ('a * ''b) list -> ('a * ''b) list;
=DESCRIBE
$alist$ $list\_roverwrite$ $olist$ overwrites $alist$ with each element of $olist$, using $roverwrite$ (q.v.).
=GFT Definition
fun alist list_roverwrite olist = (
	fold (fn (l1, l2) => l2 roverwrite l1) olist alist
)
=TEX
=SEEALSO
$roverwrite$, $list\_overwrite$.
=ENDDOC

\subsection{Another Miscellany}
=DOC
val ⦏is_nil⦎ : 'a list -> bool;
=DESCRIBE
$is\_nil$ tests whether a list is empty([]). It can be
used for lists of types which do not admit equality.
=ENDDOC
=DOC
val ⦏flat⦎ : 'a list list -> 'a list;
=DESCRIBE
$flat$ takes a list of lists and returns the result of
concatenating them all.
=ENDDOC
=DOC
val ⦏split⦎ : ('a * 'b) list -> 'a list * 'b list;
=DESCRIBE
Split a list of pairs into a pair of lists.
=GFT Definition
split [(x0, y0), (x1, y1), ... (xk, yk)] = [x0, x1, ... , xk],  [y0, y1, ... , yk]
=TEX
=SEEALSO
$split3$, $combine$
=ENDDOC
=DOC
val ⦏split3⦎ : ('a * 'b * 'c) list -> 'a list * 'b list * 'c list;
=DESCRIBE
Split a list of triples into a triple of lists.
$split3$ is the analogue of $split$ for lists of triples.
=SEEALSO
$split$
=ENDDOC
=DOC
val ⦏combine⦎ : 'a list -> 'b list -> ('a * 'b) list;
=DESCRIBE
$combine$ combines a pair of lists into a list of pairs. It is the left inverse of $split$.
=FAILURE
1007	Cannot combine unequal length lists
=SEEALSO
$split$, $zip$
=ENDDOC
=DOC
val ⦏all_different⦎ : ''a list -> bool;
=DESCRIBE
$all\_different$ determines whether a list has any
repeated entries.
=SEEALSO
$all\_distinct$
=ENDDOC
=DOC
val ⦏all_distinct⦎ : ('a * 'a -> bool) -> 'a list -> bool;
=DESCRIBE
$all\_distinct$ $eq$ $list$ determines whether $list$ has any
repeated entries using $eq$ to test for
equality.
Each member, $x$ of the list is tested against all the subsequent
members of the list, with $x$ being the first argument to
$eq$.
=SEEALSO
$all\_different$
=ENDDOC
=DOC
val ⦏from⦎ : 'a list * int -> 'a list;
=DESCRIBE
$list$ $from$ $n$ takes
the trailing slice of $list$.
It uses 0-based indexing.
If $n$ is 0 or negative then entire list is returned,
and if $n$ indexes past the other end of the list then the
empty list is returned.
=EXAMPLE
[0,1,2,3] from 2 = [2,3]
=SEEALSO
$to$
=ENDDOC
=DOC
val ⦏to⦎ : 'a list * int -> 'a list;
=DESCRIBE
$list$ $to$ $n$ takes
the initial slice of $list$.
It uses 0-based indexing.
If $n$ is 0 or negative an empty list is returned,
and if $n$ indexes past the other end of $list$ then the
entire list is returned.
=EXAMPLE
[0,1,2,3] to 2 = [0,1,2]
=SEEALSO
$from$
=ENDDOC
=DOC
val ⦏interval⦎ : int -> int -> int list;
=DESCRIBE
$interval\;a\;b$ is the list $[a,a+1,a+2\ldots,b]$.
This is taken to be $[]$ if $a > b$ and to be $[a]$
if $a = b$.
=ENDDOC
=DOC
val ⦏mapfilter⦎ : ('a -> 'b) -> 'a list -> 'b list;
=DESCRIBE
Map a function over a list.
If, when evaluating
\[mapfilter\ f\ (x_1 :: \ldots x_{k-1} :: x_k :: x_{k+1} :: \ldots )\]
the evaluation of $f\ x_k$ raises a $Fail$ exception, then
the result will be
\[(f\ x_1 :: \ldots f\ x_{k-1} :: f\ x_{k+1} :: \ldots)\]
=ENDDOC
=DOC
val ⦏app⦎ : ('a -> unit) -> 'a list -> unit;
=DESCRIBE
Apply a function to each element of a list in turn for the side-effect.
=ENDDOC

=DOC
val ⦏zip⦎ : ('a -> 'b)list -> 'a  list -> 'b list;
=DESCRIBE
Given a list of functions, and a list of arguments, of the same length, apply each function to its corresponding argument.
For the cases when the list of functions induce side effects,
note that
the functions are applied from the head of their list to the tail, and
will be applied until there are insufficient elements of either list to continue.
If there lists are not of equal length then at that point a failure will be raised.
=SEEALSO
$combine$
=FAILURE
1008	List lengths differ
=ENDDOC
=DOC
val ⦏nth⦎ : int -> 'a list -> 'a;
=DESCRIBE
Return the $n$-th element of a list. The head of the list is the $0$-th element.
=FAILURE
1009	Index past ends of list
=ENDDOC
=DOC
val ⦏which⦎ : (('a * 'a) -> bool) -> 'a -> 'a list -> int OPT;
=DESCRIBE
$which$ $eq$ $x$ $list$ returns $Value$ of the position of first element, $y$, in $list$ for which $eq\ x\ y$ is true.
It uses 0-based indexing.
If no such $y$ is found, then it returns $Nil$.
=ENDDOC
\subsection{End of ListUtilities}
=SML
end (* of ListUtilities signature *);
=TEX
\section{FUNCTION UTILITIES}
=DOC
signature ⦏FunctionUtilities⦎ = sig
=DESCRIBE
Holds a variety of utility Standard ML functions concerned with functions.
=ENDDOC
\subsection{Pairs}
=DOC
val ⦏fst⦎ : 'a * 'b -> 'a;
=DESCRIBE
$fst$ is the left projection function for pairs: $fst(a,b)\ =\ a$.
=SEEALSO
$snd$
=ENDDOC
=DOC
val ⦏snd⦎ : 'a * 'b -> 'b;
=DESCRIBE
$snd$ is the right projection function for pairs: $snd(a,b)\ =\ b$.
=SEEALSO
$fst$
=ENDDOC
=DOC
val ⦏swap⦎  : 'a * 'b -> 'b * 'a;
=DESCRIBE
$swap$ interchanges the elements of a pair: $swap(a,b)\ =\ (b,a)$.
=ENDDOC
\subsection{Functionals}
Certain higher-order functions are very useful.

=DOC
val ⦏curry⦎  : ('a * 'b -> 'c) -> 'a -> 'b -> 'c;
=DESCRIBE
$curry$ $f$ $a$ $b$ gives $f\ (a,b)$.
=SEEALSO
$uncurry$
=ENDDOC
=DOC
val ⦏uncurry⦎ : ('a -> 'b -> 'c) -> 'a * 'b -> 'c;
=DESCRIBE
$uncurry$ $f$ $(a,b)$ gives $f$ $a$ $b$.
=SEEALSO
$curry$
=ENDDOC
=DOC
val ⦏switch⦎  : ('a -> 'b -> 'c) -> 'b -> 'a -> 'c;
=DESCRIBE
$switch$ $f$ $a$ $b$ gives $f$ $b$ $a$.
=ENDDOC
=DOC
val ⦏**⦎  : ('a -> 'b) * ('c -> 'd) -> 'a * 'c -> 'b * 'd;
=DESCRIBE
The infix operator $**$, with precedence 4 (higher
than ``$o$''),
applies the first of a pair of functions to the first of a pair,
and the second of the pair of functions to the second of the pair, returning the pairing of the results.
=GFT Definition
(f ** g) x = (f x, g x)
=TEX
=ENDDOC
=DOC
val ⦏fun_pow⦎  : int -> ('a -> 'a) -> 'a -> 'a;
=DESCRIBE
For non-negative $n$, $fun\_pow\ n\ f$ is $f^n$, i.e. the
function
\[λx⦁f(f( ... f(f x) ....)\]
where $f$
appears $n$ times.
=FAILURE
1010	First argument must not be negative
=ENDDOC
=DOC
val ⦏fun_and⦎ : (('a -> bool) * ('a -> bool)) -> 'a -> bool;
val ⦏fun_or⦎ : (('a -> bool) * ('a -> bool)) -> 'a -> bool;
val ⦏fun_not⦎ : ('a -> bool) -> 'a -> bool;
val ⦏fun_true⦎ : 'a -> bool;
val ⦏fun_false⦎ : 'a -> bool;
=DESCRIBE
These functions allow a style of programming that handles predicates rather than booleans.
=GFT Definition
(f fun_and g) x	= f x andalso g x
(f fun_or g) x 	= f x orelse g x
(fun_not f) x 	= not(f x)
fun_true x 	= true
fun_false x 	= false
=TEX
=ENDDOC
=DOC
val ⦏repeat⦎ : (unit -> 'a) -> unit;
val ⦏iterate⦎ : ('a -> 'a) -> 'a -> 'a;
=DESCRIBE
$repeat$ applies its argument to $()$ until it fails (with an error generated by $fail$, q.v.), whereupon it returns $()$.
$iterate$ $f$ $a$ applies $f$ to $a$.
If this causes no failure it then calls $iterate$ $f$ on the result.
If it fails  (with an error generated by $fail$, q.v.) it returns $a$.
Failures other than those caused by $fail$ are not handled.
=GFT Definition
fun repeat f		= (f (); repeat f) handle (Fail _) => ()
fun iterate f a	= (iterate f (f a)) handle (Fail _) => a
=TEX
=ENDDOC
$repeat$ does not return its last successful result, as if it failed on the
first application there would be none available.
=SML
end (* of FunctionUtilities signature *);
=TEX
\section{COMBINATORS}
It can be convenient to have the definitions of
certain combinators. We package these in a structure
(since their conventional names are single letters).
=DOC
signature ⦏Combinators⦎ = sig
=DESCRIBE
Holds the three combinators $S$, $K$, $I$.
=ENDDOC
=DOC
val ⦏I⦎ : 'a -> 'a
=DESCRIBE
The identity combinator: $I\ x\ =\ x$.
=ENDDOC
=DOC
val ⦏S⦎ : ('a -> 'b -> 'c) -> ('a -> 'b) -> 'a -> 'c
=DESCRIBE
The duplication combinator: $S\ f\ g\ a$ is $(f\ a)(g\ a)$.
=ENDDOC
=DOC
val ⦏K⦎ : 'a -> 'b -> 'a
=DESCRIBE
The deletion combinator: $K\ x\ y$ is $x$.
=ENDDOC
=SML
end (* of Combinators signature *);
=TEX
\section{SIMPLE OUTPUT}
=DOC
signature ⦏SimpleOutput⦎ = sig
=DESCRIBE
Holds a variety of utility Standard ML functions concerned with simple output.
Related facilities may be found in structure ReaderWriter.
Function $ask\_at\_terminal$ (q.v.)
provides for prompted input of text from the terminal.

Strings containing extended characters and strings derived
from HOL types and terms should be passed through the ReaderWriter function $translate\_for\_output$ (q.v.) before being output.  This allows the proper output
of keywords and extended characters on both graphic and simple
ASCII terminals.

=ENDDOC
The following two functions will be implemented using
the functions of structure $SystemControl$.
=DOC
(* ⦏line_length⦎ - integer control declared by new_int_control *)
=DESCRIBE
An integer control dictating the output's length of line available for printing.
=SEEALSO
$set\_line\_length$, $get\_line\_length$
=ENDDOC
=DOC
val ⦏set_line_length⦎ : int -> int
=DESCRIBE
Set the output line length, returning the previous line length.
Default length is 80, minimum length 20.
=SEEALSO
$get\_line\_length$
=FAILURE
1015	line length must be at least 20
=ENDDOC
=DOC
val ⦏get_line_length⦎ : unit -> int
=DESCRIBE
Returns current output line length.
=SEEALSO
$set\_line\_length$
=ENDDOC
=DOC
val ⦏raw_diag_string⦎ : string -> unit;
=DESCRIBE
$raw\_diag\_string$ outputs
a string on the standard output stream.
If the string exceeds the value of {\em get\_line\_length} it attempts to split the string into tokens, to fit within the line length.
A token is taken to be an initial string of spaces, followed by exclusively non-space characters.
=SEEALSO
$list\_raw\_diag\_string$, $raw\_diag\_line$, $diag\_string$.
=ENDDOC
=DOC
val ⦏list_raw_diag_string⦎ : string list -> unit;
=DESCRIBE
$list\_raw\_diag\_string$ outputs a list of strings
onto the standard output stream. The strings in the list
are concatenated (with spaces to separate them) and then
output with $raw\_diag\_string$ (q.v.).
=SEEALSO
$raw\_diag\_string$, $raw\_diag\_line$, $list\_diag\_string$.
=ENDDOC
=DOC
val ⦏raw_diag_line⦎ : string -> unit;
=DESCRIBE
$raw\_diag\_line$ outputs a string to the standard output
stream followed by a new line.
It is intended for use in printing formatted terms,
theorems and the like (for which the pretty printer
will have included new lines within the string if
necessary).
=SEEALSO
$raw\_diag\_string$, $diag\_line$.
=ENDDOC
=DOC
val ⦏format_list⦎ : ('a -> string) -> 'a list -> string -> string;
=DESCRIBE
$format\_list$ $formatter$ $items$ $seperator$
is used to format a list of items for printing
as a string, perhaps for printing.  Given $formatter$, a function to
format a single item, $items$, a list of items, and $seperator$, a string to
separate elements of a multi-element list, the resulting
string is the contatenation of the formatted items with
interposed separators.  The formatted head element of
the list becomes the left hand end of the result string.
=EXAMPLE
format_list string_of_term [⌜1⌝,⌜x⌝,⌜a ∧ b⌝] ", ";
  --->
val it = "⌜1⌝, ⌜x⌝, ⌜a ∧ b⌝"  : string
=ENDDOC
=SML
end (* of SimpleOutput signature *);
=TEX
\section{CHARACTER UTILITIES}
=DOC
signature ⦏CharacterUtilities⦎ = sig
=DESCRIBE
Holds a variety of utility Standard ML functions concerned with character handling.
=ENDDOC
=DOC
val ⦏is_all_decimal⦎ : string -> bool;
=DESCRIBE
$is\_all\_decimal$ checks whether a string consists
of one or more decimal digits.
=ENDDOC
\subsection{Numeric Conversions}
=DOC
val ⦏nat_of_string⦎ : string -> int;
=DESCRIBE
$nat\_of\_string$ converts a string into non-negative
integer (using decimal notation).
=SEEALSO
$string\_of\_int$
=FAILURE
1012	?0 is not a decimal string
1013	String is empty
=ENDDOC
=DOC
val ⦏string_of_int⦎  : int -> string;
=DESCRIBE
$string\_of\_int$ converts an integer into a decimal
string.
=SEEALSO
$nat\_of\_string$
=ENDDOC
This function is similar to $makestring$ of some implementations of Standard ML.
=SML
end (* of CharacterUtilities signature *);
=TEX
\section{DICTIONARIES}
To implement HOL theories and the theory hierarchy
we need to represent the type and constant environments
of the formal specification (\cite{DS/FMU/IED/SPC001}).
These environments are essentially partial functions from
$string$ to values of suitable type.

The operations required on these partial functions
are: application,
extension by a singleton function, deletion of elements
from the domain and overwriting both
by singleton functions and by arbitrary partial function.
This is similar to what is typically required for
the symbol table of a compiler.
We will call a data structure together with functions
to perform these operations a ``dictionary''.

We offer two generic implementations of dictionaries
here. The first implementation uses linear search
and performs slowly when the data structures become
large. The second implementation uses a hash addressing technique
and gives considerably more efficient access than the simple
implementation to larger data structures.

\subsection{Simple Dictionaries}
The implementation will use linear search
and performs slowly when the data structures become
large.

Its functions are straightforward. We use the prefix $s\_$ to
distinguish the types and functions involved from those
used for the more efficient technique.

After defining a simple dictionary to be a list of
pairs, the functions for accessing and modifying
dictionaries are essentially just interfaces to the
partial function operations defined in
signature $ListUtilities$.

The type of simple dictionaries is declared in signature $UtilitySharedTypes$.
=DOC
signature ⦏SimpleDictionary⦎ = sig
=DESCRIBE
Holds a set of Standard ML functions concerned with a linear search
dictionary.
=USES
For handling small dictionaries.
=SEEALSO
$EfficientDictionary$.
=ENDDOC
=DOC
val ⦏s_lookup⦎ : string -> 'a S_DICT -> 'a OPT;
=DESCRIBE
$s\_lookup$ implements application (of the dictionary
viewed as a partial function).
$s\_lookup$ $name$ $dict$ returns the value that $dict$ associates with $name$.
=ENDDOC
=DOC
val ⦏s_enter⦎ : string -> 'a -> 'a S_DICT -> 'a S_DICT;
=DESCRIBE
$s\_enter$ implements overwriting by a singleton function.
$s\_enter$ $name$ $value$ $dict$ returns the dictionary
that associates $name$ with $value$, and otherwise associates as $dict$.
Overwriting is done ``in place'', entries not previously present will be placed at the end of the dictionary viewed as a list.
=ENDDOC
=DOC
val ⦏s_extend⦎ : string -> 'a -> 'a S_DICT -> 'a S_DICT;
=DESCRIBE
$s\_extend$ implements extension by a singleton function,
that is to say it is like $s\_enter$.
$s\_extend$ $name$ $value$ $dict$ returns the dictionary
that associates $name$ with $value$, and otherwise associates as $dict$.
It fails if $name$ is already in the domain of $dict$.
Entries not previously present will be placed at the head of the dictionary viewed as a list.
=FAILURE
1014	?0 is already in dictionary
=ENDDOC
=DOC
val ⦏s_delete⦎ : string -> 'a S_DICT -> 'a S_DICT;
=DESCRIBE
$s\_delete$ deletes an element of the domain of a dictionary.
If the element is not in the domain it returns the
dictionary unchanged.
$s\_delete$ $name$ $dict$ returns a dictionary that does not associate anything with $name$, but otherwise associates as $dict$.
=ENDDOC
=DOC
val ⦏s_merge⦎ : 'a S_DICT -> 'a S_DICT -> 'a S_DICT;
=DESCRIBE
$s\_merge$ extends one dictionary by another.
The dictionary $s\_merge$ $dict1$ $dict2$ will associate
a name with the value that either $dict1$ or $dict2$ associates it with.
=FAILUREC
\paragraph{Failure}
Will get the $s\_extend$ failure message if any element is common to the domains of both dictionaries ($dict1$ and $dict2$).
Duplicate keys in the first list will also cause an $s\_extend$ error,
but will be replicated in the result if found in the second list.
=ENDDOC
=DOC
val ⦏initial_s_dict⦎ : 'a S_DICT;
=DESCRIBE
The empty dictionary, which
gives a starting point for the use of the simple dictionary functions.
It does not associate a value with any name.
=ENDDOC
=SML
end (* of SimpleDictionary signature *);
=TEX
\subsection{Efficient Dictionaries}
The technique we use for the more efficient dictionaries
is essentially the standard compiler writer's technique
of hash addressing with chaining to handle collisions
(see, for example, \cite{Bornat79}).

We discuss the detailed algorithm in \cite{DS/FMU/IED/IMP001}.
The signature is essentially that of simple dictionaries,
only the desire to open these structures at the same time,
and a few additional functions,
means that the signatures are not unified.

Its functions are similar to those of $SimpleDictionary$.
=DOC
signature ⦏EfficientDictionary⦎ = sig
=DESCRIBE
This is the signature of a structure implementing dictionaries (lookup-up tables) based on hash-search techniques.
=USES
For handling large dictionaries.
=SEEALSO
$SimpleDictionary$.
=ENDDOC
=DOC
type 'a ⦏E_DICT⦎;
=DESCRIBE
The type of efficient dictionaries.
=ENDDOC
=DOC
val ⦏e_lookup⦎ : string -> 'a E_DICT -> 'a OPT
=DESCRIBE
$e\_lookup$ implements application (of the dictionary
viewed as a partial function).
$e\_lookup$ $name$ $dict$ returns the value that $dict$ associates with $name$.
=ENDDOC
=DOC
val ⦏e_enter⦎ : string -> 'a -> 'a E_DICT -> 'a E_DICT;
=DESCRIBE
$e\_enter$ implements overwriting by a singleton function.
$e\_enter$ $name$ $value$ $dict$ returns the dictionary
that associates $name$ with $value$, and otherwise associates as $dict$.
=ENDDOC
=DOC
val ⦏e_extend⦎ : string -> 'a -> 'a E_DICT -> 'a E_DICT;
=DESCRIBE
$e\_extend$ implements extension by a singleton function,
that is to say it is like $e\_enter$.
$e\_extend$ $name$ $value$ $dict$ returns the dictionary
that associates $name$ with $value$, and otherwise associates as $dict$.
It fails if $name$ is already in the domain of $dict$.
=FAILURE
1014	?0 is already in dictionary
=ENDDOC
=DOC
val ⦏e_delete⦎ : string -> 'a E_DICT -> 'a E_DICT;
=DESCRIBE
$e\_delete$ deletes an element of the domain of a dictionary.
If the element is not in the domain it returns the
dictionary unchanged.
$e\_delete$ $name$ $dict$ returns a dictionary that does not associate anything with $name$, but otherwise associates as $dict$.
=ENDDOC
=DOC
val ⦏e_flatten⦎ : 'a E_DICT -> 'a S_DICT;
=DESCRIBE
$e\_flatten$ converts an efficient dictionary into a simple one.
The result will contain no duplicates, but will be in no useful order.
=ENDDOC
=DOC
val ⦏e_merge⦎ : 'a E_DICT -> 'a E_DICT -> 'a E_DICT;
=DESCRIBE
$e\_merge$ extends one efficient dictionary by another.
The dictionary $e\_merge$ $dict1$ $dict2$ will associate
a name with the value that either $dict1$ or $dict2$ associates it with.
=FAILUREC
\paragraph{Failure}
Will get the $e\_extend$ failure message if an element is common to the domains of both dictionaries.
=ENDDOC
=DOC
val ⦏list_e_enter⦎ : 'a E_DICT -> 'a S_DICT -> 'a E_DICT;
=DESCRIBE
$list\_e\_merge$ extends an efficient dictionary by overwriting with entries from a simple
one.
That is, for each association in the simple dictionary
an $e\_enter$ is executed on the efficient dictionary.
=ENDDOC
=DOC
val ⦏list_e_merge⦎ : 'a E_DICT -> 'a S_DICT -> 'a E_DICT;
=DESCRIBE
$list\_e\_merge$ extends an efficient dictionary by merging with entries from a simple
one.
That is, for each association in the simple dictionary
an $e\_extend$ is executed on the efficient dictionary.
=FAILUREC
\paragraph{Failure}
Will get the $e\_extend$ failure message if an element is common to the domains of both dictionaries.
=ENDDOC
=DOC
val ⦏initial_e_dict⦎ : 'a E_DICT;
=DESCRIBE
The empty dictionary, which
gives a starting point for the use of the efficient dictionary functions.
It does not associate a value with any name.
=ENDDOC
=DOC
val ⦏e_stats⦎ : 'a E_DICT -> {height : int, nentries : int, nnodes : int, sumweights : int};
=DESCRIBE
{\em e\_stats dict} returns statistics about the internals of the efficient dictionary {\em dict}.
Efficient dictionaries are currently represented as binary trees whose non-leaf nodes each carry a simple dictionary of entries (in case of collisiion of hash values).
The statistics currently returned are the height of the tree, the number of entries, the number of nodes and the sum over all entries of the depth of the entries (i.e,  the sum of the number of entries per node weighted by node-depth).
=ENDDOC
=DOC
type ⦏E_KEY⦎;
val ⦏e_get_key⦎ : string -> E_KEY;
val ⦏e_key_lookup⦎ : E_KEY -> 'a E_DICT -> 'a OPT
val ⦏e_key_enter⦎ : E_KEY -> 'a -> 'a E_DICT -> 'a E_DICT;
val ⦏e_key_extend⦎ : E_KEY -> 'a -> 'a E_DICT -> 'a E_DICT;
val ⦏e_key_delete⦎ : E_KEY -> 'a E_DICT -> 'a E_DICT;
val ⦏string_of_e_key⦎ : E_KEY -> string;
=DESCRIBE
The abstract data type $E\_KEY$ represents the hash-keys used
in the internals of the efficient dictionary ($E\_DICT$) access functions.
{\it e\_get\_key} computes the hash-key for a given string.
This may then be used as an argument to the functions
{\it e\_key\_lookup}, {\it e\_key\_enter}, {\it e\_key\_extend} and {\it e\_key\_delete}
which perform the same functions as the corresponding functions without ``{\it key\_}''
in the name. This approach may be used if the same string is to be used to access
several efficient dictionaries to avoid the computational cost of recalculating the hash-key.
{\it string\_of\_key} is the left inverse of {\it e\_get\_key}.
=FAILUREC
\paragraph{Failure}
The failures are exactly as for the corresponding string access functions. In particular,
the area names in error messages are, e.g., ``e\_lookup'' rather than ``e\_key\_lookup'' etc.
=ENDDOC
=SML
end (* of EfficientDictionary signature *);
=TEX
\subsection{Ordered Efficient Dictionaries}
=DOC
signature ⦏OrderedEfficientDictionary⦎ = sig
=DESCRIBE
This is the signature of a structure providing dictionaries (look-up tables) which use hash-based search technique
to give efficient indexing and which also record the order in which entries are made.
=ENDDOC
=SML
include EfficientDictionary;
=DOC
type 'a ⦏OE_DICT⦎;
val ⦏initial_oe_dict⦎ : 'a OE_DICT;
val ⦏oe_lookup⦎ : string -> 'a OE_DICT -> 'a OPT
val ⦏oe_enter⦎ : string -> 'a -> 'a OE_DICT -> 'a OE_DICT;
val ⦏oe_extend⦎ : string -> 'a -> 'a OE_DICT -> 'a OE_DICT;
val ⦏oe_delete⦎ : string -> 'a OE_DICT -> 'a OE_DICT;
val ⦏oe_key_lookup⦎ : E_KEY -> 'a OE_DICT -> 'a OPT
val ⦏oe_key_enter⦎ : E_KEY -> 'a -> 'a OE_DICT -> 'a OE_DICT;
val ⦏oe_key_extend⦎ : E_KEY -> 'a -> 'a OE_DICT -> 'a OE_DICT;
val ⦏oe_key_delete⦎ : E_KEY -> 'a OE_DICT -> 'a OE_DICT;
val ⦏oe_flatten⦎ : 'a OE_DICT -> 'a S_DICT;
val ⦏oe_key_flatten⦎ : 'a OE_DICT -> ('a * E_KEY) S_DICT;
val ⦏e_dict_of_oe_dict⦎ : 'a OE_DICT -> 'a E_DICT;
val ⦏list_oe_merge⦎ : 'a OE_DICT -> 'a S_DICT -> 'a OE_DICT;
val ⦏oe_merge⦎ : 'a OE_DICT -> 'a OE_DICT -> 'a OE_DICT;
=DESCRIBE
This type and associated access functions implement order-preserving efficient dictionaries.
The functions have exactly the same effect as the corresponding functions {\it e\_lookup},
{\it e\_enter} etc., qv., for the type {\it E\_DICT} except that {\it se\_flatten} returns a list
which preserves the order in which entries were made (last-in, first-out).
If an entry is updated (rather than added) by {\it oe\_key\_enter} or {\it oe\_enter}, the updated
entry appears in its original position.

{\it list\_oe\_merge} enters the list of items in the second argument into the
dictionary given as its first argument in tail-first (right-to-left) order.
=FAILUREC
\paragraph{Failure}
The failures are exactly as for the corresponding {\it E\_DICT} functions. In particular,
the area names in error messages are, e.g., ``e\_lookup'' rather than ``oe\_lookup'' etc.
=ENDDOC
=TEX
=SML
end (* of signature OrderedEfficientDictionary *);
=TEX
\section{CODE PROFILING}
=DOC
signature ⦏Profiling⦎ = sig
=DESCRIBE
The signature contains definitions that may be used to record
statistics, e.g., on the number of times certain
functions have been called.
=ENDDOC
=DOC
(* ⦏profiling⦎ - boolean flag declared by new_flag *)
=DESCRIBE
Turns profiling on (if true) or off (if false).
Default is false, but flag is true during build of \ProductHOL.
This should be maintained via the functions of structure $SystemControl$.
=ENDDOC
=DOC
val ⦏prof⦎ : string -> unit;
val ⦏counts⦎ : string -> int OPT;
val ⦏get_stats⦎ : unit -> int S_DICT;
val ⦏set_stats⦎ : int S_DICT -> unit;
val ⦏print_stats⦎ : int S_DICT -> unit;
val ⦏init_stats⦎ : unit -> unit;
=DESCRIBE
These five functions provide a simple database facility, associating
each name with a count.
A call to $prof$ $name$ increments, if the flag ``profiling'' is true, the count for $name$.
A call to $counts$ $name$ returns the value of the current count
for $name$.
A call to $get\_stats$ provides the counting database as an integer dictionary, in order of first name entry into database being first
in the dictionary viewed as a list.
The function $print\_stats$ will provide a one line - one entry
display of an integer dictionary, in particular the kind of dictionary
provided by $get\_stats$.
A call to $init\_stats$ initialises all the counts to 0
(which is also the state in which the database starts).
A call to $set\_stats$ will restore a statistics database
to a given set of values (such as those given by $get\_stats$).
The input list must contain no duplicated names.

It is likely that the output of $get\_stats$ would be best sorted
before being printed by $print\_stats$.
=USES
The intended use of this database is to profile function calls,
with the implementer making one call to $prof$ per profiled function.
=FAILURE
1020	Input list is ill-formed
=ENDDOC
=SML
end(* of Profiling signature *);
=TEX
=TEX
\section{CODE TIMING}
=DOC
signature ⦏Timing⦎ = sig
=DESCRIBE
The signature contains definitions that can be used to measure execution time
of ML code.
=ENDDOC
=DOC
datatype ⦏TIMER_UNITS⦎ = ⦏Microseconds⦎ | ⦏Milliseconds⦎ | ⦏Seconds⦎;
type 'b ⦏TIMED⦎ = {result : 'b, time : int, units : TIMER_UNITS};
val ⦏time_app⦎ : TIMER_UNITS -> ('a -> 'b) -> 'a -> 'b TIMED;

val ⦏reset_stopwatch⦎ : unit -> unit ;
val ⦏read_stopwatch⦎ : TIMER_UNITS -> int;
=DESCRIBE
The function {\it time\_app} and the associated data types {\it TIMER\_UNITS}
and {\it 'a TIMED} may be used to measure the execution time of a function.

In the call {\it time\_app u f x},
{\it u} specifies the units in which the timing
is to be measured, {\it f} is the function to be timed and
{\it x} gives the argument to be passed to {\it f}.
The return value gives the result of the application {\it f x} together with
the time taken measured in the specified units and a reminder of what the
units were.

{\it reset\_stopwatch\_time} and {\it read\_stopwatch\_time} give a way of
timing sequences of ML commands. {\it read\_stopwatch\_time u} returns
the elapsed time measured in the units specified by {\it u} since the last call of
{\it reset\_stopwatch\_time}. {\it read\_stopwatch\_time} will either return
a meaningless value or result in arithmetic overflow if {\it reset\_stopwatch\_time}
has not been called in the current session.

The following points should be born in mind when using these functions:
\begin{itemize}
\item
The times are ``wall-clock'' times. Garbage-collection and other overheads
will be included.
\item
Depending on the underlying Standard ML compiler, arithmetic overflow may occur if the units
are chosen inappropriately for the time period being measured.
\item
The functions will themselves introduce a time overhead, which may vary depending on
system load and other system-dependent factors.
\end{itemize}

=FAILURE
1021	Arithmetic overflow in time conversion
=ENDDOC
=SML
end(* of Timing signature *);
=TEX
\section{ORDERINGS}
=DOC
signature ⦏Order⦎ = sig
=DESCRIBE
This provides a package of functions convenient for constructing various kinds of orders (quasi-orders, etc.) on ML data types.
=ENDDOC
=DOC
type 'a ⦏ORDER⦎ = 'a -> 'a -> int;
=DESCRIBE
This is a polymorphic type used by several functions (e.g., $sort$) to represent various kinds of ordering, e.g., linear orders or quasi-orders.

If $f$ is an ordering in this sense, then elements $x$ and $y$ are taken to be in order ($x \prec y$), equivalent ($x \simeq y$) or out of order ($x \succ y$) according as $f\,x\,y$ is negative, zero or positive.
So, for example, the usual ordering of the integers corresponds to $f\,x\,y = x - y$.
=ENDDOC
=DOC
val ⦏int_order⦎ : int ORDER;
=DESCRIBE
This function gives the usual ordering on the standard ML integers.
=ENDDOC
=DOC
val ⦏no_order⦎ : 'a ORDER;
=DESCRIBE
This function is the ordering which makes any two elements compare equivalent.
=ENDDOC
=DOC
val ⦏ascii_order⦎ : string ORDER;
=DESCRIBE
This function gives the ordering of character string by numeric character code.
The integer result is appropriate for use in $sort$ (q.v.).
=SEEALSO
$strin\_order$ which is a slightly less efficient but order alphabetic characters in a more intuitive way.
=ENDDOC
=DOC
val ⦏string_order⦎ : string ORDER;
=DESCRIBE
This function gives a more civilised ordering on
strings than the one given by the ASCII codes.
It collates upper-case and lower-case letters together in the
(increasing) order `A', `a', \ldots, `Z', `z' and all other characters after `z' ordered by numeric character code.
The integer result is appropriate for use in $sort$ (q.v.).
=SEEALSO
$lexicographic$, $ascii\_order$.
=ENDDOC
=DOC
val ⦏lexicographic⦎ : 'a ORDER -> 'a list ORDER;
=SYNOPSIS
This function returns the lexicographic ordering
function induced from an ordering
of items of type $'a$ on items of type $'a\,list$.
=DESCRIBE
Lexicographic ordering may be defined as follows:

Let us presume some ordering $<$ on the type of variables $a_i$ and $b_i$.
Then
\[ [a_1, \ldots, a_n]\ <_{lexicographic}\ [b_1, \ldots, b_m] \]
If, and only if, either
\[ n\ <_{int}\ m\ ∧ \ ∀ i : 1 .. n\ ⦁\ a_i\ =\ b_i\]
Or
\[∃ j : 1 .. n\ ⦁\ (∀ i : 1 .. (j-1)\ ⦁\ a_i\ =\ b_i)\ ∧\ (a_j\ <\ b_j)\]
The resulting ordering is appropriate for use in $sort$ (q.v.).

$list\_order$ is a synonym for $lexicographic$.
=SEEALSO
$string\_order$, $pair\_order$, $sort$, $list\_order$.
=ENDDOC
=DOC
val ⦏pair_order⦎ : 'a ORDER -> 'b ORDER -> ('a * 'b) ORDER;
val ⦏list_order⦎ : 'a ORDER -> 'a list ORDER;
val ⦏inv_list_order⦎ : 'a ORDER -> 'a list ORDER;
val ⦏opt_order⦎ : 'a ORDER -> 'a OPT ORDER;
val ⦏opt_order1⦎ : 'a ORDER -> 'a OPT ORDER;
val ⦏rev_order⦎ : 'a ORDER -> 'a ORDER;
=SYNOPSIS
Several functions such as $sort$ are parameterised by ordering functions, $f$, say, such that, $f\;x\;y$ is negative, zero or positive result according as $x < y$, $x = y$ or $x > y$ with respect to some total ordering.
The above functions help to construct new ordering functions from old.

Given orderings on the component types of a binary product type, $pair\_order$ gives the ordering on the product type that orders first on the left component and then on the right to break ties.

Given an ordering on the element type of a list type, $list\_order$ gives the lexicographic ordering on the list type.
It is a synonym for $lexicographic$, q.v.

$inv\_list\_order$ is like $list\_order$ but gives the inverse lexicographic order (equivalent to reversing both operand lists but more efficiently implemented).

Given an ordering on any type, $opt\_order$ (resp. $opt\_order1$ gives an ordering on the type of optional values of that type. $Nil$ is taken as greater (resp. less) than any supplied value, $Value\;x$.

Given an ordering on any type, $rev\_order$ gives the corresponding reverse ordering.
=SEEALSO
$string\_order$, $lexicographic$, $sort$
=ENDDOC
=DOC
val ⦏induced_order⦎ : ('a -> 'b) * 'b ORDER -> 'a ORDER;
=SYNOPSIS
Given an ordering $r$ on elements of type $'b$ and a function $f$ of type $'a \mathrel{{-}{>}} 'b$, $induced\_order(f, r)$ is the ordering of the type $'a$ induced by $f$ and $r$, i.e., is the ordering obtained by mapping elements of type $'a$ to the type $'b$ using $f$ and then comparing the results with $r$.
=ENDDOC
=DOC
val ⦏THEN_O⦎ : 'a ORDER * 'a ORDER -> 'a ORDER;
=SYNOPSIS
$THEN\_O$ is an infix operator of precedence 4.
Given orderings $r$ and $s$ on elements of type $'a$, $r\,THEN\_O\,s$ is the ordering that first compares elements using $r$ and accepts the comparison unless the elements compare equivalent, in which case they are compared using $s$.
This is equivalent to $induced\_order(diag, pair_order\,r\,s)$ where $diag\,x = (x, x)$.
=ENDDOC
=SML
end (* end of Order signature *);
=TEX
=TEX
\section{SORTING}
=DOC
signature ⦏Sort⦎ = sig

include Order;
=DESCRIBE
This provides an efficient sort utility package.
For historical reasons it includes the structure $Order$.
=ENDDOC
=DOC
val ⦏sort⦎ : 'a ORDER -> 'a list -> 'a list
val ⦏merge⦎ : 'a ORDER -> 'a list -> 'a list -> 'a list
=DESCRIBE
$sort$ sorts a list and $merge$ merges two lists assumed
already to be sorted. Both functions  are parametrised by an
ordering function of type $'a\,ORDER$, i.e., $'a -> 'a -> int$.
The integer, say $n$ returned by an application
of this function, say $f\ a_1\ a_2$, is interpreted as
follows:
\begin{description}
\item[$n < 0$] $a_2$ is to come after $a_1$ (i.e. the arguments are in order).
\item[$n > 0$] $a_2$ is to come before $a_1$ (i.e. the arguments are out of order).
\item[$n = 0$] $a_2$ is to be taken as equal to $a_1$
\end{description}

Sorting eliminates duplicate elements in the sense of the equality test given by the ordering. Merging includes just one copy of an element that occurs once in each of its arguments in the result.
The result of merging unsorted lists is unspecified; in particular, the result is unspecified
if there is duplication within one of the lists.

=EXAMPLE
To sort a list of integers, ilist in ascending order:

	sort (curry (op -)) ilist

or

	sort int_order ilist
=SEEALSO
For convenient ways of constructing orderings, see, e.g. $string\_order$ and $list\_order$.
=ENDDOC
=SML
end (* end of Sort signature *);
=TEX
\section{SPARSE ARRAYS}
=DOC
signature ⦏SparseArray⦎ = sig
=DESCRIBE
This is the signature of a structure implementing sparse arrays
(i.e. imperative data structures representing finite partial functions
on the integers).
The sparse arrays also give an efficient means for handling dense (i.e.
contiguous) arrays whose size varies. To facilitate their use for such
dynamically sized arrays, the sparse arrays have lower and
upper bound attributes
which gives the smallest and
largest indices into the array which identify an occupied cell.

The design of the structure is an adaptation of the library
structure $Array$ implementing fixed length arrays.
=ENDDOC
=DOC
	type '_a ⦏SPARSE_ARRAY⦎;
=DESCRIBE
This is the type of a sparse array with entries of type $'\_a$.
=ENDDOC
=DOC
	val ⦏array⦎ 		: int -> '_a SPARSE_ARRAY;
=DESCRIBE
This function creates an empty sparse array. The parameter indicates the
length of an internal data structure used to represent the array.
For a contiguous array or for a sparsely filled array with
a random distribution of occupied cells, the average access time for an
element will be proportional to $n/l$ where $n$ is the number of occupied cells
and $l$ is this length.
=FAILURE
1102	The length parameter must be positive
=ENDDOC
=DOC
	val ⦏update⦎		: ('_a SPARSE_ARRAY * int * '_a) -> unit;
=DESCRIBE
$update(array, i, a)$ makes $a$ the occupant of the
$i$-th cell of the sparse array $array$.  The cell need not previously have
been occupied (indeed, $update$ is the only means by which cells become
occupied).
=ENDDOC
=DOC
	val ⦏scratch⦎		: '_a SPARSE_ARRAY -> unit;
=DESCRIBE
$scratch\,array$ empties all cells in the sparse array $array$.
=ENDDOC
=DOC
	val ⦏sub⦎			: ('_a SPARSE_ARRAY * int) -> '_a
=DESCRIBE
$sub(array, i)$ returns the occupant of
the $i$-th cell of the sparse array $array$. An exception is raised if the
cell is not occupied.
=FAILURE
1101	Cell with index ?0 is empty
=ENDDOC
=DOC
	val ⦏sub_opt⦎		: ('_a SPARSE_ARRAY * int) -> '_a OPT
=DESCRIBE
$sub(array, i)$ returns $Value\,a$, where $a$ is the occupant of
the $i$-th cell of the sparse array $array$. If the cell is unoccupied
it returns $Nil$.
=ENDDOC
=DOC
	val ⦏lindex⦎		:  '_a SPARSE_ARRAY -> int
	val ⦏uindex⦎		: '_a SPARSE_ARRAY -> int
=DESCRIBE
$lbound(array)$ (resp. $ubound(array)$) returns the smallest (resp. largest)
index of an occupied cell in the sparse array $array$.
An exception is raised if the array is empty.
=FAILURE
1103	the array is empty
=ENDDOC
=SML
end; (* of signature SparseArray *)
=TEX
\section{DYNAMIC ARRAYS}
=DOC
signature ⦏DynamicArray⦎ = sig
=DESCRIBE
This is the signature of a structure implementing dynamic arrays
with 0-based indexing (i.e. imperative data structures representing
finite partial functions on the integers, whose range is an interval $1 \ldots n$).
The implementation gives constant access time.
The design of the structure is an adaptation of the library
structure $Array$ implementing fixed length arrays.

=ENDDOC
=DOC
	type '_a ⦏DYNAMIC_ARRAY⦎;
=DESCRIBE
This is the type of a dynamic array with entries of type $'\_a$.
=ENDDOC
=DOC
	val ⦏array⦎ 		: int -> '_a DYNAMIC_ARRAY;
=DESCRIBE
This function creates an empty dynamic array. The parameter indicates the
length of an internal data structure used to represent the initial size of the array.
The average access time for an element will be constant --- the underlying
array structure is grown as necessary.
=FAILURE
1301	The initial size parameter must be positive
=ENDDOC
=DOC
	val ⦏update⦎		: ('_a DYNAMIC_ARRAY * int * '_a) -> unit;
=DESCRIBE
$update(array, i, a)$ makes $a$ the occupant of the
$i$-th cell of the sparse array $array$.  The cell need not previously have
been occupied (indeed, $update$ is the only means by which cells become
occupied).
=ENDDOC
=FAILURE
1302	The index must not be negative
=DOC
	val ⦏scratch⦎		: '_a DYNAMIC_ARRAY -> unit;
=DESCRIBE
$scratch\,array$ empties all cells in the sparse array $array$
and reduces the underlying data structure to the initial length
specified when the array was first created.
=ENDDOC
=DOC
	val ⦏sub⦎			: ('_a DYNAMIC_ARRAY * int) -> '_a
=DESCRIBE
$sub(array, i)$ returns the occupant of
the $i$-th cell of the dynamic array $array$. An exception is raised if the
cell is not occupied.
=FAILURE
1101	Cell with index ?0 is empty
1303	Index ?0 is out of range
=ENDDOC
=DOC
	val ⦏sub_opt⦎		: ('_a DYNAMIC_ARRAY * int) -> '_a OPT
=DESCRIBE
$sub(array, i)$ returns $Value\,a$, where $a$ is the occupant of
the $i$-th cell of the dynamic array $array$. If the cell is unoccupied
it returns $Nil$.
=ENDDOC
=DOC
	val ⦏uindex⦎		: '_a DYNAMIC_ARRAY -> int
=DESCRIBE
$lbound(array)$ the largest
index of an occupied cell in the dynamic array $array$
or
=INLINEFT
~1
=TEX
\ if no cells in the array are occupied.
=ENDDOC
=SML
end; (* of signature DynamicArray *)
=TEX
\section{SEARCH TREES}
=DOC
signature ⦏SearchTree⦎ = sig
=DESCRIBE
This is the signature for a structure implementing search trees
These provide an efficient mapping from keys drawn from a type
equipped with an ordering to data values of some type.
=ENDDOC
=DOC
include Order;
type ('k, 'd) ⦏SEARCH_TREE⦎
val ⦏initial_search_tree⦎ : 'k ORDER -> ('k, 'd) SEARCH_TREE
val ⦏st_lookup⦎ : 'k -> ('k, 'd) SEARCH_TREE -> 'd OPT
val ⦏st_extend⦎ : 'k -> 'd -> ('k, 'd) SEARCH_TREE -> ('k, 'd) SEARCH_TREE
val ⦏list_st_merge⦎ : ('k, 'd) SEARCH_TREE -> ('k * 'd) list -> ('k, 'd) SEARCH_TREE
val ⦏st_enter⦎ : 'k -> 'd -> ('k, 'd) SEARCH_TREE -> ('k, 'd) SEARCH_TREE
val ⦏list_st_enter⦎ : ('k, 'd) SEARCH_TREE -> ('k *'d) list -> ('k, 'd) SEARCH_TREE
val ⦏st_delete⦎ : 'k -> ('k, 'd) SEARCH_TREE -> ('k, 'd) SEARCH_TREE
val ⦏st_flatten⦎ : ('k, 'd) SEARCH_TREE -> ('k * 'd) list
=DESCRIBE
The type
=INLINEFT
(κ, δ) SEARCH_TREE
=TEX
\ implements mappings from keys of type τ to values of type δ.
The type τ must be ordered by an ordering function passed as a parameter to
the funciton
=INLINEFT
initial_search_tree
=TEX
\ that creates an empty search tree.

=INLINEFT
st_lookup k st
=TEX
\ returns the data associated with key $k$ in the search tree $st$, if any.

=INLINEFT
st_extend k d st
=TEX
\ adds an association of $k$ with $d$ in the search tree $st$ if $k$ is in use as a key in $st$.
It fails if $k$ is already in use as a key in $st$.

=INLINEFT
list_st_merge kvs st
=TEX
\ merges a list of key-value associations $a$ into a search tree $st$, failing if any of the keys is already in use in $st$.

=INLINEFT
st_extend k d st
=TEX
\ adds an association of $k$ with $d$ in the search tree $st$ overwriting any existing association.


=INLINEFT
list_st_enter kvs st
=TEX
\ adds a list of key-value associations $a$ to a search tree $st$ overwriting existing associations.

=INLINEFT
st_delete k st
=TEX
\ deletes any association with key $k$ from the search tree $st$.
It is not an error if there is no such association.

=INLINEFT
st_flatten st
=TEX
\ returns the list of associations in the search tree $st$ sorted by increasing order of the keys.
The list is processed left-to-right, so, if a key appears more than once, the last association for it will be
recorded in the resulting search tree.

The search trees are implemented using Hinze's approach to a
functional implementation of 1--2 brother trees.
=FAILURE
1401	there is already an entry with this key in the search tree
1402	INTERNAL ERROR: ill-formed search tree
=ENDDOC
=SML
end (* of signature SearchTree *);
=TEX
\section{ARBITRARY MAGNITUDE INTEGER ARITHMETIC}
Some compilers provide arbitrary magnitude integer arithmetic as standard.
Others provide arithmetic that can overflow. For efficient and general
reasoning about integers, we require arbitrary magnitude arithmetic.
This section provides a portable interface to this.
It is provided here rather than in the portability module~\cite{DS/FMU/IED/DTD109} because we want to use the {\Product} approach to error handling (see~\cite{DS/FMU/IED/DTD002}).
=MLTON
=MLTON
(* MLton applications of this code currently do not need arbitrary magnitude integer arithmetic
=DOC
signature ⦏Integer⦎ = sig
	eqtype ⦏INTEGER⦎;
	val ⦏idiv⦎ : INTEGER * INTEGER -> INTEGER;
	val ⦏imod⦎ : INTEGER * INTEGER -> INTEGER;
	val ⦏@*⦎ : INTEGER * INTEGER -> INTEGER;
	val ⦏@+⦎ : INTEGER * INTEGER -> INTEGER;
	val ⦏@-⦎ : INTEGER * INTEGER -> INTEGER;
	val ⦏@~⦎ : INTEGER -> INTEGER;
	val ⦏iabs⦎ : INTEGER -> INTEGER;
	val ⦏@<⦎ : INTEGER * INTEGER -> bool;
	val ⦏@>⦎ : INTEGER * INTEGER -> bool;
	val ⦏@<=⦎ : INTEGER * INTEGER -> bool;
	val ⦏@>=⦎ : INTEGER * INTEGER -> bool;
	val ⦏integer_of_string⦎ : string -> INTEGER;
	val ⦏@@⦎ : string -> INTEGER;
	val ⦏string_of_integer⦎ : INTEGER -> string;
	val ⦏int_of_integer⦎ : INTEGER -> int;
	val ⦏integer_of_int⦎ : int -> INTEGER;
	val ⦏natural_of_string⦎ : string -> INTEGER;
	val ⦏zero⦎ : INTEGER;
	val ⦏one⦎ : INTEGER;
	val ⦏string_of_float⦎ : INTEGER * INTEGER * INTEGER -> string;
	val ⦏integer_order⦎ : INTEGER -> INTEGER -> int;
=DESCRIBE
This is the signature of an open structure providing arithmetic on integers
of arbitrary magnitude. It is used to support HOL natural numbers and
other object language numeric types. The names of the usual arithmetic
operators are decorated with an initial $i$ or $@$ as appropriate.
The string conversions work with signed decimal string representations.
Either `%
=INLINEFT
-
=TEX
' or `%
=INLINEFT
~
=TEX
' may be used for unary negation and a leading `%
+
=TEX
' is also allowed.
$@@$ is an abbreviation for $integer\_of\_string$.
$natural\_of\_string$ is a converter for non-negative numbers (it has
the same error cases as $nat\_of\_string$).

$string\_of\_float$ interprets a triple $(x, p, e)$ as a floating point number with value $x \times 10^{e - p}$ and converts the triple into its string representation.

$integer\_order$ implements the ordering of the integers in the form used by $sort$, q.v.
=FAILURE
1201	the divisor is zero
1202	an empty string is not a valid decimal number
1203	the string `?0' is not a valid decimal number
1204	the conversion would overflow
=ENDDOC
=SML
end (* of signature Integer *);
=MLTON
end of code commented out for MLton *)
=TEX
\section{TEST POLICY}
In  \cite{DS/FMU/IED/PLN008} there is a statement of the general principle of testing to be adopted.
This section gives some individual comments on special testing requirements for individual functions.

Any function parameterised by an equality argument should be tested with an asymmetric ``equality'', to check the argument order.

The design of the function $union$ describes a particular ordering of its result.
The conformance to this order should be checked.

The functions $lassoc{\cal N}$, $rassoc{\cal N}$ and all others that act on ``\ldots the first element of the list that \ldots'' should be checked with lists containing duplicates, to ensure that the first matching element is selected.

The designs of functions $string\_order$ and $lexicographic$
describe orderings that their implementations should be tested against.

\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}



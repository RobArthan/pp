=IGN
********************************************************************************
imp001.doc: this file is part of the PPDev system

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

\def\Title{Implementation of Standard ML Utilities}

\def\AbstractText{Utility functions for use in the Release 1 of ICL HOL system are implemented in this document.}

\def\Reference{DS/FMU/IED/IMP001}

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
%% LaTeX2e port: \TPPproject{FST Project}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Implementation of Standard ML Utilities}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Implementation of Standard ML Utilities}
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP001}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{2.16%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{99/03/06%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: %\TPPstatus{Approved}
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.Blackburn & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & Project Manager}
%% LaTeX2e port: \TPPabstract{Utility functions for use in the Release 1 of ICL HOL
%% LaTeX2e port: system are implemented in this document.}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	    Library
%% LaTeX2e port: }}
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
\section{Document Control}
\subsection{Contents List}
\tableofcontents
\subsection{Document Cross References}
\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes History}
\begin{description}
\item [Issue 1.1 (1991/01/15) - 1.14 (1991/09/12)]
Initial drafts up to desk check ID0061 and its rework.
\item [Issue 2.1 (1991/09/12) (12th September 1991)]
Approved version of issue 1.14.
\item [Issue 2.2 (1991/11/21) (21 November 1991)]
Addition of sparse arrays.

\item[Issue 2.3 (1992/01/20), \FormatDate{92/01/20} ] Updated to use new fonts.
\item [Issue 2.4 (1992/02/03) (3rd February 1992)]
Changed $diag\_$ to $raw\_diag\_$.
\item [Issue 2.5 (1992/03/30) (30th March 1992)]
Added $filter$.
\item [Issue 2.6 (1992/03/31) (31st March 1992)]
Removed $gensym$.
\item [Issue 2.7 (1992/04/09) (1st April 1992)]
Renamed $set\_eq$ to $~=$.
\item [Issue 2.8 (1992/04/14) (13th April 1992)]
Changes due to CR0017.
\item [Issue 2.9 (1992/05/28) (28th May 1992)]
Changed implementation of $format\_list$.
\item [Issue 2.10 (1992/12/14) (14th December 1992)]
Added $set\_stats$.
\item [Issue 2.11 (1992/12/15) (15th December 1992)]
Changed default of ``profiling'' flag.
\item [Issue 2.12 (1997/07/29) (28th July 1997)]
Improving known space hogs: mem, drop and lassoc5.
\item [Issue 2.13 (1999/02/06) (6th February 1998)]
Made implementation of length SML97-compatible.
\item [Issues 2.14 (1999/03/06)-2.17 (1999/03/07) (6th March 1999)] Added $Integer$ structure.
\item [Issue 2.18 (2001/07/17) (16th July 2001)] Added $DynamicArray$ structure.
\item [Issue 2.19 (2001/07/30)-2.22 (2001/08/03) (3rd August 2001)] Even slicker hash function!
\item [Issue 2.23 (2001/08/07) (7th August 2001)] {\it e\_delete} now reclaims space when possible (to
support the pattern of use in the abstract data type of theorems better).
{\it e\_lookup} tests for an empty tree before doing anything else.
\item [Issue 2.24 (2001/08/09) (9th August 2001)] Added timing structure.
\item [Issue 2.25 (2001/08/28) (28th August 2001)] Minor performance tweak to {\it mem}.
\item[Issue 2.26 (2001/12/02)] Port to Poly/ML
\item[Issue 2.27 (2002/06/01)]
New efficient dictionary functions and new stopwatch timer functions.
\item[Issue 2.28 (2002/06/03)]
New type of order-preserving efficient dictionaries.
\item[Issue 2.29 (2002/06/03)]
Performance tweak to {\it format\_list}.
\item[Issue 2.30 (2002/06/04), 2.31 (2002/06/05)]
Replaced tree sort with a merge sort and optimised the string ordering function.
\item[Issue 2.33 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 2.34 (2002/10/17)] PPDev-specific updates for open source release
\item [Issue 2.35 (2003/01/07)] Reworked various of the list-processing functions to make better use
of time and space. Added set inclusion test for lists.
\item[Issue 2.36 (2003/06/11)] Fixed {\it oe\_key\_enter} and {\it oe\_enter}.
\item[Issue 2.37 (2004/06/19)] Added {\em list\_e\_enter}.
\item[Issue 2.38 (2004/09/07)] Added {\em e\_stats} and {\em e\_dict\_of\_oe\_dict}.
\item[Issue 2.39 (2005/04/24)] Added {\tt app}.
\item[Issue 2.40 (2005/04/27)] Tidy-up to improve some of the string and character handling.
\item[Issue 2.41 (2005/06/22), 2.42 (2005/06/29)] Updates for SML/NJ 110.54.
\item[Issues 2.43 (2005/09/02)] Added $oe\_key\_flatten$.
\item[Issues 2.44 (2006/12/02),2.45 (2006/12/02)] Added support for floating point literals.
\item[Issue 2.46 (2007/03/04)] Floating point literals with no mantisssa or exponent are now supported.
\item[Issue 2.47 (2007/08/15)] Added {\em pair\_order}, {\em list\_order}, {\em opt\_order} and {\em integer\_order}; now opens {\em Sort} structure.
\item[Issue 2.48 (2007/08/28)] Added {\em opt\_order1}.
\item[Issue 2.49 (2007/09/08)] Added new structure {\em Order}.
\item[Issue 2.50 (2008/01/27)] Poly/ML 5.1 port.
\item[Issue 2.51 (2008/02/26)] {\em set\_line\_length} etc. now notify the compiler of the current line length.
\item[Issue 2.52 (2008/12/10)] Added {\em merge}.
\item[Issue 2.53 (2008/12/14)] Hack for Poly/ML 4.1.3.
\item[Issue 2.54 (2008/12/14)] Back to Poly/ML 5.1.X.
\item[Issue 2.55 (2009/11/25)] Suppressed pretty-printing of the abstypes under Poly/ML.
\item[Issues 2.56 (2013/08/01)--2.59 (2013/08/03)] Added search tree structure and fixed various {\LaTeX} formatting errors.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.

\item[2015/11/23]
It now allows SLRP to be compiled with MLton.

\item[2016/09/17]
Updates to support latest updates to Poly/ML and Mac OS Xcode

\item[2017/03/05]
Poly/ML can now be compiled with a fixed magnitude type for the default integer type,
so we now use structure {\tt IntInf} rather than {\tt Int} for the
arbitrary magnitude arithmetic.  Pretty-printing arbitrary magnitude integers in SML/NJ
now works so SML/NJ and Poly/ML can use the same code.


%%%% END OF CHANGES HISTORY %%%%
\end{description}

%\subsection{Changes Forecast}
\section{GENERAL}
\subsection{Scope}
This document contains an implementation
of the detailed design in \cite{DS/FMU/IED/DTD001}.

\subsection{Introduction}
\subsubsection{Purpose and Background}
This document implements definitions of some general purpose
Standard ML objects,
whose signatures are declared in \cite{DS/FMU/IED/DTD001}.
Many of these are general functions which
support some common functional programming idioms.
\subsubsection{Dependencies}
The definitions in this document are mostly self-contained
and depend only on the Standard ML facilities defined
in \cite{Harper86},
and on the error handling features of \cite{DS/FMU/IED/DTD002}.
The signatures for the document are in \cite{DS/FMU/IED/DTD001}.
Error messages numbers for this document are set in this document,
but their texts are assigned by \cite{DS/FMU/IED/DTD001}.
\subsubsection{Algorithms}
Nearly all the functions defined here are short
and straightforward.
When felt necessary, the algorithms used are discussed
in the narrative which accompanies each function.
\subsubsection{Deficiencies}
None known.
\subsubsection{Possible Enhancements}
Versions of the general functions defined here
may well be supplied with particular
Standard ML compilers. It may improve performance if
the supplied versions are used.

\section{LIST UTILITIES}
=SML
structure ⦏ListUtilities⦎ : ListUtilities = struct
=TEX
\subsection{Some Useful Datatypes and Functions upon them}
The datatype $'a\;OPT$ is declared in $UtilitySharedTypes$.
Occasionally we want to force a $'a\;OPT$ into a $'a$
raising an exception if the $'a\;OPT$ is $Nil$.
=SML
fun ⦏force_value⦎ (Value X : 'a OPT) : 'a = X
|   force_value Nil = fail "force_value" 1001 [];
=TEX
A test for $Nil$:
=SML
fun ⦏is_Nil⦎ (Nil:'a OPT) : bool = true
|   is_Nil _ = false;
=TEX
\subsection{List Processing Functions}
Many of the following functions are supplied as standard with
some SML compilers. The definitions here could
be removed if we fix on a compiler with these supplied.

$hd$ and $tl$ are the usual destructor functions for
lists.
They raise an exception when passed empty arguments.
=SML
fun ⦏hd⦎ (h :: _ : 'a list) : 'a = h
|   hd [] = fail "hd" 1002 [];
=TEX
=SML
fun ⦏tl⦎ (_ :: t : 'a list) : 'a list = t
|   tl [] = fail "tl" 1003 [];
=TEX
$fold\;f\;[x_1, x_2, \ldots, x_k]\;b$ is $f(x_1, f(x_2, \ldots f(x_k, b)) \ldots)$.
=SML
fun ⦏fold⦎ (f : ('a*'b -> 'b)) (h :: t : 'a list) (b : 'b) : 'b = f (h, fold f t b)
|   fold (f : ('a*'b -> 'b)) ([] : 'a list) (b : 'b) = b;
=TEX
$revfold\;f\;[x_1, x_2, \ldots]\;b$  is
$f(x_k,\ldots f(x_2,(f(x_1, b)))\ldots)$
=SML
fun ⦏revfold⦎ (f : ('a*'b -> 'b)) (h :: t : 'a list) (b : 'b) : 'b = revfold f t (f(h, b))
|   revfold (f : ('a*'b -> 'b)) ([] : 'a list) (b : 'b) = b;
=TEX
$length$ returns the length of a list (this version written to avoid garbage generation and calling overhead).
=SML
local
	fun l n (_ :: _ :: _ :: _ :: t) = l (n+4) t
	|   l n      (_ :: _ :: _ :: t) = l (n+3) t
	|   l n           (_ :: _ :: t) = l (n+2) t
	|   l n                (_ :: t) = l (n+1) t
	|   l n                      [] = n;
in
	fun ⦏length⦎ (x : 'a list) : int = l 0 x;
end;
=TEX
=SML
fun ⦏filter⦎ (pred : 'a -> bool) (xs:'a list) : 'a list = (
	let	fun aux acc [] = rev acc
		|   aux acc (x :: xs) = (
			if	pred x
			then	aux (x :: acc) xs
			else	aux acc xs
		);
	in	aux [] xs
	end
);
=TEX
\subsection{Lists as Sets}
$drop$,  $less$ and $grab$ are infix operators with priority 4 (lower than
`::' and higher than `=').
$drop$ and $less$ are essentially the set difference operation.
$grab$ is union with a singleton set.

$mem$ is an infix form of $contains$.
=SML
fun (x: ''a) ⦏mem⦎ (xs  : ''a list) : bool = (
let	fun aux (x1 :: xs) = ((x = x1) orelse aux xs
	) | aux _ = false
in
	aux xs
end);
=TEX
$contains$ searches for a member of
a list equal to a given value and returns true iff. it finds one.
=SML
fun ⦏contains⦎ (xs : ''a list) (x: ''a) : bool = (x mem xs);
=TEX
$present$ is an equality-parameterised membership test.
We use an auxiliary function to save passing two parameters,
and allow some minor partial evaluation.
=SML
fun ⦏present⦎ (eq : ('a * 'a) -> bool) (x: 'a) : 'a list -> bool = (
	let fun test (h :: t) = eq(x,h) orelse test t
	| test [] = false
	in
		test
	end
);
=TEX
$any$ returns true iff. some element of a list satisfies a given
condition.
=SML
fun ⦏any⦎ ((x :: xs) : 'a list) (cond : 'a -> bool) : bool = (
	cond x orelse any xs cond
) | any ([] : 'a list) (_ : 'a -> bool) : bool = false;
=TEX
$all$ returns true iff. all elements of a list satisfy a given
property.
=SML
fun ⦏all⦎ ((x :: xs) : 'a list) (cond : 'a -> bool) : bool = (
	cond x andalso all xs cond
) |   all ([] : 'a list) (_ : 'a -> bool) : bool = true;
=TEX

$list\,drop\,cond$ is the list obtained by deleting all members
of $list$ for which the boolean function $cond$ returns true.
=SML
fun (xs : 'a list) ⦏drop⦎ (cond : 'a  -> bool) : 'a list = (
	let	fun aux acc [] = rev acc
		|   aux acc (x :: xs) = (
			if	cond x
			then	aux acc xs
			else	aux (x :: acc) xs
		);
	in	aux [] xs
	end
);
=TEX
$list\,less\,what$ is the list obtained by deleting all members
of $list$ which are equal to $what$.
=SML
fun (xs : ''a list) ⦏less⦎ (what : ''a) : ''a list = (
	let	fun aux acc [] = rev acc
		|   aux acc (x :: morexs) = (
			if	x = what
			then	aux acc morexs
			else	aux (x::acc) morexs
		);
	in	aux [] xs
	end
);
=TEX
$list\, grab\,what$ is the list obtained by inserting $what$
at the head of $list$ if it is not a member of it already.
=SML
fun (lst : ''a list) ⦏grab⦎ (what : ''a) = (
	if what mem lst
	then lst
	else (what :: lst)
);
=TEX
=SML
fun ⦏insert⦎ (eq:'a * 'a -> bool) (lst : 'a list) (what : 'a) = (
	if present eq what lst
	then lst
	else (what :: lst)
);
=TEX
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

=SML
fun ⦏union⦎ (eq : ('a*'a) -> bool) (list1 : 'a list)(list2 : 'a list) : 'a list = (
	let
		fun insert_it (what, lst) = (
			if present eq what lst
			then lst
			else (what :: lst)
		);
	in
		fold insert_it list1 list2
	end
);
=TEX
For convenience and performance we supply the special
case of $union$
when the equality function is ordinary SML equality.
This is the following infix function $cup$:
=SML
fun (list1 : ''a list) ⦏cup⦎ (list2 : ''a list) : ''a list = (
	fold (fn(x, xs) => xs grab x) list1 list2
);
=TEX
$list\_union$ is essentially a distributed union operation for lists.
=GFT Example
list_union eq [list0, list1, ...] = union eq (list0 union eq (list1 ...)).
=TEX
=SML
fun ⦏list_union⦎ (eq : ('a * 'a) -> bool) (lists : 'a list list) : 'a list = (
	fold (fn (l1, l2) => union eq l1 l2) lists []
);
=TEX
For convenience and performance again, we supply
$list\_cup$: the special case of $list\_union$ when the
equality operator is ordinary SML equality.
=SML
fun ⦏list_cup⦎ (lists : ''a list list) : ''a list = (
	fold op cup lists []
);
=TEX
$find$ searches for a member of a list satisfying a given condition and
returns such a member if there is one.
=SML
fun ⦏find⦎ ((x :: xs)  : 'a list) (cond: 'a -> bool) : 'a = (
	if cond x
	then x
	else find xs cond
) | find ([]  : 'a list) (_ : 'a -> bool) = fail "find" 1004 [];
=TEX
$l1\,subset\,l2$ is true iff. all the elements of $l1$
are  also elements of $l2$
=SML
fun (x : ''a list) ⦏subset⦎ (y : ''a list) : bool = (
	all x (fn a => a mem y)
);
=TEX
Given two lists, considered as sets, test whether the first is contained in the second:
=SML
fun ([]: ''a list)  ⦏~<=⦎ (_:''a list) : bool = true
| (a1 :: x1) ~<= l2 = (
	a1 mem l2 andalso x1 ~<= l2
);
=TEX
Given two lists, considered as sets, test whether they are equal:
=SML
fun (l1: ''a list)  ⦏~=⦎ (l2:''a list) : bool = (
	l1 ~<= l2 andalso l2 ~<= l1
);
=TEX
$diff$ is the set difference operator for lists.
=SML
fun (list1 : ''a list) ⦏diff⦎ (list2 : ''a list) : ''a list = (
	list1 drop (fn x => x mem list2)
);
=TEX
\subsection{Lists of Pairs as Functions and Relations}
We will frequently implement functions or relations as
lists of pairs. The following associative lookup functions are
used to implement application of such functions or relations.
We will need some variations on the same theme.
Each variation has left- and right-handed versions.

The first two variations are used to view a list of pairs as
representing a total function. The function is applied to an argument
by looking for the first member in the list with that argument
in the appropriate position. In the first variation the function
is made total by taking the argument as the result if there is no
appropriate member of the list.
=SML
fun ⦏lassoc1⦎ ((x, y) :: rest : (''a * ''a) list) (what : ''a) : ''a = (
	if x = what
	then y
	else lassoc1 rest what
) | lassoc1 [] what = what;
=TEX
=SML
fun ⦏rassoc1⦎ ((x, y) :: rest : (''a * ''a) list) (what : ''a) : ''a = (
	if y = what
	then x
	else rassoc1 rest what
) | rassoc1 [] what = what;
=TEX
In the second variation, an ML function
to compute the value in this case is supplied as an argument.
=SML
fun ⦏lassoc2⦎
	((x, y) :: rest : (''a * 'b) list)
	(default : ''a -> 'b)
	(what : ''a) : 'b = (
	if x = what
	then y
	else lassoc2 rest default what
) | lassoc2 [] default what = default what;
=TEX
=SML
fun ⦏rassoc2⦎
	((x, y) :: rest : ('a * ''b) list)
	(default : ''b -> 'a)
	(what : ''b) : 'a = (
	if y = what
	then x
	else rassoc2 rest default what
) | rassoc2 [] default what = default what;
=TEX
The third variation treats the list as defining a partial
function. An error is signaled if the list does not
contain an appropriate pair.
=SML
fun ⦏lassoc3⦎ ((x, y) :: rest : (''a * 'b) list) (what : ''a) : 'b = (
	if x = what
	then y
	else lassoc3 rest what
) | lassoc3 [] _ = fail "lassoc3" 1005 [];
=TEX
=SML
fun ⦏rassoc3⦎ ((x, y) :: rest : ('a * ''b) list)(what : ''b) : 'a = (
	if y = what
	then x
	else rassoc3 rest what
) | rassoc3 [] _ = fail "rassoc3" 1005 [];
=TEX
The fourth variation is the special case of the second
in which a constant default is to be used.
=SML
fun ⦏lassoc4⦎
	((x, y) :: rest : (''a * 'b) list)
	(default : 'b)
	(what : ''a) : 'b = (
	if x = what
	then y
	else lassoc4 rest default what
) | lassoc4 [] default _ = default;
=TEX
=SML
fun ⦏rassoc4⦎
	((x, y) :: rest : ('a * ''b) list)
	(default : 'a)
	(what : ''b) : 'a = (
	if y = what
	then x
	else rassoc4 rest default what
) | rassoc4 [] default _ = default;
=TEX
A fifth variation uses the datatype $'a\;OPT$ to implement
the partial function.
=SML
fun ⦏lassoc5⦎ (xy : (''a * 'b) list) (what : ''a) : 'b OPT = (
let	fun aux ((x, y) :: rest) = (
		if x = what
		then Value y
		else aux rest
	) | aux [] = Nil;
in
	aux xy
end);
=TEX
=SML
fun ⦏rassoc5⦎ ((x, y) :: rest : ('a * ''b) list)(what : ''b) : 'a OPT = (
	if y = what
	then Value x
	else rassoc5 rest what
) | rassoc5 [] _ = Nil;
=TEX
The following functions facilitate the creation and
modification of functions represented as lists of pairs.
They are similar to the function override notion in Z.
$overwrite$ overwrites with a single element,
$list\_overwrite$ with a list of elements.
Both work with the argument before value representation
(corresponding to $lassoc\ldots$ above).

=SML
fun (abs : (''a * 'b) list) ⦏overwrite⦎ ((xy as (x, y)) : ''a * 'b) : (''a * 'b) list = (
	let	fun aux acc [] = rev (xy :: acc)
		|   aux acc ((ab as (a, b)) :: moreabs) = (
			if	a = x
			then	rev acc @ (xy :: moreabs)
			else	aux (ab :: acc) moreabs
		);
	in	aux [] abs
	end
);
=TEX
=SML
fun (abs : (''a * 'b) list) ⦏list_overwrite⦎ (xys : (''a * 'b) list) : (''a * 'b) list = (
	fold (fn (l1, l2) => l2 overwrite l1) xys abs
);
=TEX
$roverwrite$ and $list\_roverwrite$ are the value before
argument versions of the above.
=SML
fun (abs : ('a * ''b) list) ⦏roverwrite⦎ ((xy as (x, y)) : 'a * ''b) : ('a * ''b) list = (
	let	fun aux acc [] = rev (xy :: acc)
		|   aux acc ((ab as (a, b)) :: moreabs) = (
			if	b = y
			then	rev acc @ (xy :: moreabs)
			else	aux (ab :: acc) moreabs
		);
	in	aux [] abs
	end
);
=TEX
=SML
fun (abs : ('a * ''b) list) ⦏list_roverwrite⦎ (xys : ('a * ''b) list) : ('a * ''b) list = (
	fold (fn (l1, l2) => l2 roverwrite l1) xys abs
);
=TEX
\subsection{Another Miscellany}
$is\_nil$ tests whether a list is []. It can be
used for lists of types which do not admit equality.
=SML
fun ⦏is_nil⦎ ([] : 'a list) : bool = true
|   is_nil ( _ : 'a list) : bool = false;
=TEX
$flat$ takes a list of lists and returns the result of
concatenating them all.
=SML
fun ⦏flat⦎  (lists : 'a list list) : 'a list = (
	fold op @ lists []
);
=TEX
$split$ takes a list of pairs:
=GFT Example
[(x_0, y_0), (x_1, y_1), ... (x_k, y_k)]
=TEX
say, and returns
the pair of lists:
=GFT Example
[x_0, x_1, ... , x_k],  [y_0, y_1, ... , y_k]
=TEX
=SML
fun ⦏split⦎ (xys : ('a * 'b) list) : ('a list) * ('b list) = (
	let	fun aux xacc yacc [] = (rev xacc, rev yacc)
		|   aux xacc yacc ((x, y) :: morexys) = aux (x :: xacc) (y :: yacc) morexys;
	in	aux [] [] xys
	end
);
=TEX
$split3$ is the analogue of $split$ for lists of triples.
=SML
fun ⦏split3⦎ ((x, y, z) :: xyzs : ('a * 'b * 'c) list) : ('a list) * ('b list) * ('c list) = (
	let	val (xs, ys, zs) = split3 xyzs
	in	(x :: xs, y :: ys, z :: zs)
	end
) | split3 [] = ([], [], []);
=TEX
$combine$ is the left inverse of $split$; it signals an error
if its arguments are not lists of equal length.
=SML
fun ⦏combine⦎ (xs : 'a list) (ys : 'b list) : ('a * 'b) list = (
	let	fun aux acc [] [] = rev acc
		|   aux acc (x :: morexs) (y :: moreys) = (
			aux ((x, y) :: acc) morexs moreys
		) | aux acc _ _ = fail "combine" 1007 [];
	in	aux [] xs ys
	end
);
=TEX
$all\_different$ determines whether a list has any
repeated entries:
=SML
fun ⦏all_different⦎ (x :: xs : ''a list) : bool = (
	not (x mem xs) andalso all_different xs
) |   all_different [] = true;
=TEX
$all\_distinct$ determines whether a list has any
repeated entries using a given function to test for
equality.
=SML
fun ⦏all_distinct⦎ (eq : ('a * 'a) -> bool) (x :: xs : 'a list) : bool = (
	not (present eq x xs) andalso all_distinct eq xs
) | all_distinct eq [] = true;
=TEX
The infix functions $from$ and $to$ take
slices of lists. The conventions are such
that, e.g. $$[0,1,2,3] from 2 = [2,3]$$ and
$$[0,1,2,3] to 2 = [0,1,2]$$.
=SML
fun ((ht as (_ :: t)) : 'a list) ⦏from⦎ (n : int) : 'a list = (
	if n > 0
	then t from (n-1)
	else ht
) | [] from _ = [];
=TEX
=SML
fun (xs: 'a list) ⦏to⦎ (n: int) : 'a list = (
	let	fun aux acc [] _ = rev acc
		|   aux acc (h :: t) i = (
			if	i < 0
			then	rev acc
			else	aux (h :: acc) t (i - 1)
		);
	in	aux [] xs n
	end
);
=TEX
$interval\;a\;b$ is the list $[a,a+1,a+2\ldots,b]$.
This is taken to be $[]$ if $a > b$ and to be $[a]$
if $a = b$.
=SML
fun ⦏interval⦎ (a:int) (b:int) : int list = (
	let	fun aux acc i = (
			if	i < a
			then	acc
			else	aux (i :: acc) (i-1)
		);
	in	aux [] b
	end
);
=TEX
Map a function over a list - failure on an element is treated as do not include in the list.
=SML
fun ⦏mapfilter⦎ (f : 'a -> 'b) ((x :: xs) : 'a list) = (
	([f x] handle (Fail _) => []) @ mapfilter f xs
) | mapfilter _ [] = [];
=TEX
=TEX
Apply a function to each element of a list for the side-effects.
=SML
fun ⦏app⦎ (f : 'a -> unit) ((x :: xs) : 'a list) = (
	f x; app f xs
) | app _ [] = ();
=TEX
=SML
fun ⦏zip⦎ (lf_hd :: lf_tl: ('a -> 'b)list) (lt_hd :: lt_tl: 'a  list): 'b list = (
	lf_hd lt_hd :: (zip lf_tl lt_tl)
) | zip [] [] = []
| zip _ _ = fail "zip" 1008 [];
=TEX
=SML
fun ⦏nth⦎ n ((a: 'a) :: al): 'a = (
	if n = 0 then a else nth (n-1) al
) | nth n [] = fail "nth" 1009 [];
=TEX
=SML
fun ⦏which⦎ (eq: ('a * 'a) -> bool) (v: 'a) (lt: 'a list): int OPT = (
let
	fun lwhich (n: int) ((a: 'a) :: al): int OPT = (
		if eq (v, a)
		then Value n
		else lwhich (n+1) al
	) | lwhich n [] = Nil
in
	lwhich 0 lt
end);
=TEX

\subsection{End of ListUtilities}
=SML
end (* of ListUtilities *);
open ListUtilities;
=TEX
\section{FUNCTION UTILITIES}
=SML
structure ⦏FunctionUtilities⦎ : FunctionUtilities = struct
=TEX
\subsection{Pairs}
$fst$ and $snd$ are the projection functions for pairs.
=SML
fun ⦏fst⦎ (a, _) = a;

fun ⦏snd⦎ (_, b) = b;
=TEX
$swap$ interchanges the elements of a pair
=SML
fun ⦏swap⦎ (a, b) = (b, a);
=TEX
\subsection{Functionals}
Certain higher-order functions are useful.
$curry$ and $uncurry$ convert a function with a pair
of arguments into a function with an argument pair (and
vice versa).
=SML
fun ⦏curry⦎ (f : ('a * 'b) -> 'c) : 'a -> 'b -> 'c = (
	(fn a => (fn b => f(a, b)))
);

fun ⦏uncurry⦎ (f : 'a -> 'b -> 'c) : ('a * 'b) -> 'c = (
	(fn (a, b) => f a b)
);
=TEX
$switch$ reverse the order of the arguments of a
two argument function.
=SML
fun ⦏switch⦎ (f:'b -> 'a -> 'c) (a : 'a) (b : 'b) : 'c = f b a;
=TEX
The infix operator ``**'', with precedence 4 (higher
than ``$o$''), gives the function induced by a pair
of functions from the product of their domains to
the product of their codomains. (To use categorical
language it is the morphisms part of the product
functor.)
=SML

fun (f : 'a1 -> 'b1) ⦏**⦎ (g : 'a2 -> 'b2) : ('a1 * 'a2) -> ('b1 * 'b2) = (
	(fn (x1, x2) => (f x1, g x2))
);
=TEX
For non-negative $n$,
$fun\_pow (n:int) (f:'a->'a)$ is $f^n$, i.e. the
function $λx⦁f(f( ... f(f x) ....)$, where $f$
appears $n$ times.
=SML
fun ⦏fun_pow⦎ (n:int) (f:'a->'a) (v:'a) : 'a = (
	if n > 0
	then fun_pow (n-1) f (f v)
	else if n = 0
	then v
	else fail "fun_pow" 1010 []
);
=TEX
=SML
fun ((f: 'a -> bool) ⦏fun_and⦎ (g: 'a -> bool)) (x: 'a) : bool = (
	f x andalso g x
);
fun ((f: 'a -> bool) ⦏fun_or⦎ (g: 'a -> bool)) (x: 'a) : bool = (
	f x orelse g x
);
fun ⦏fun_not⦎ (f: 'a -> bool) (x: 'a) : bool = (
	not(f x)
);
val ⦏fun_true⦎ : 'a -> bool = (fn x => true);
val ⦏fun_false⦎ : 'a -> bool = (fn x => false);
=TEX
The detailed design for the following refers to catching any failure:
our implementation will only catch $Fail$ exceptions,
following our conventions for exception handling.
=SML
fun ⦏repeat⦎ (f: unit -> 'a) : unit = (
	(f (); repeat f) handle (Fail _) => ()
);
fun ⦏iterate⦎ (f : 'a -> 'a) (a:'a): 'a = (
	iterate f (f a) handle (Fail _) => a
);
end (* of FunctionUtilities *);
open FunctionUtilities;
=TEX
\section{COMBINATORS}
It can be convenient to have the definitions of
certain combinators. We package these in a structure
(since their conventional names are single letters).
=SML
structure ⦏Combinators⦎ : Combinators = struct
	fun ⦏I⦎ (x: 'a) : 'a = x;
	fun ⦏K⦎ (x : 'a) (_ : 'b) : 'a = x;
	fun ⦏S⦎ (f: 'a -> 'b -> 'c) (g  : 'a -> 'b) (x : 'a): 'c = f x (g x);
end (* of Combinators *);

=TEX
\section{I/O}
=SML
structure ⦏SimpleOutput⦎ : SimpleOutput = struct
=TEX
Currently we offer a rudimentary output facility
for messages to the user.

We first need a mechanism for the user to set and get a line length, that defaults to 80.
{\em set\_line\_length} returns the old value of the
setting.
The actual value, {\em line\_length}, is declared and handled by the utilities within SystemControls.
=SML
local
	fun notify_compiler (x : int) : int = (
=POLYML
		PolyML.line_length x;
=NJML
		Control.Print.linewidth := x;
=SML
		x
	);
	fun check_and_notify_compiler (x : int) : bool = (
		if	x >= 20
		then	(notify_compiler x; true)
		else	fail "set_line_length" 1015 []
	);
	val line_length: int ref = ref 80;
	val _ = new_int_control{name="line_length",
		control=line_length,
		default = (fn () => notify_compiler 80),
		check = check_and_notify_compiler};
in
fun ⦏set_line_length⦎ (n: int): int = set_int_control ("line_length", n);
fun ⦏get_line_length⦎ (():unit): int = !line_length;
end;
=TEX
$raw\_diag\_string$ outputs
a string on the standard output stream.
If the string exceeds the value of {\em get\_line\_length} it attempts to split the string into tokens, to fit within the line length.
A token is taken to be an initial string of spaces, followed by exclusively non-space characters.
=SML
fun ⦏raw_diag_string⦎ (s : string) : unit = (
	let 	val line_length = get_line_length();
		val len = size s;
		fun next test i = (
			if	i >= len
			orelse	test(String.sub(s, i))
			then	i
			else	next test (i+1)
		);
		val next_token = next (fn c => c = #" ") o next (fn c => c <> #" ");
		fun go cursor i = (
			let	val j = next_token i;
				val k = j - i;
			in	if	k = 0
				then	if	cursor > 0
					then	output(std_out, "\n")
					else	()
				else if	cursor + k > line_length
				then (	(if	cursor > 0
					then	output(std_out, "\n")
					else	());
					output(std_out, substring(s, i, k));
					go k j)
				else (	output(std_out, substring(s, i, k));
					go (cursor + k) j)
			end
		);
	in	go 0 0
	end
);
=TEX
$raw\_diag\_string\_list$ outputs a list of strings
onto the standard output stream. The strings in the list
are concatenated (with spaces to separate them) and then
output with $raw\_diag\_string$.
=SML
fun ⦏list_raw_diag_string⦎ (s : string list) : unit = (
    let
        fun aux ((s :: []) : string list) = s
        |   aux ((s :: t) : string list) = s ^ " " ^ aux t
        |   aux [] = "";
    in
        raw_diag_string (aux s)
    end
);
=TEX
$raw\_diag\_line$ outputs a string to the standard output
stream followed by a new line.
It is intended for use in printing formatted terms,
theorems and the like (for which the pretty printer
will have included new lines within the string if
necessary ).
=SML
fun ⦏raw_diag_line⦎ (s : string) : unit = (
        output(std_out, s);
        output(std_out, "\n")
);
=TEX
$format\_list$ is used to format a list of items for printing
as a string, given a function to format a single item
and a string to separate elements of a multi-element
list.
=SML
fun	⦏format_list⦎
	(format_it : 'a -> string)
	(what : 'a list) (sep : string): string = (
let
	fun aux _ [] = []
	| aux acc (h :: []) = rev (format_it h :: acc)
	| aux acc (h :: t) = aux (sep :: format_it h :: acc) t;
in
	implode(aux [] what)
end);
=TEX
=SML
end (* of SimpleOutput *);
open SimpleOutput;
=TEX
\section{CHARACTER UTILITIES}
=SML
structure ⦏CharacterUtilities⦎ : CharacterUtilities = struct
=TEX
$is\_all\_decimal$ checks whether a string consists
of one or more decimal digits.
=SML
local
	val chr_ord = SML97BasisLibrary.Char.ord;
	val ord0 = chr_ord #"0";
	val ord9 = chr_ord #"9";
in
fun ⦏is_all_decimal⦎ (s : string) : bool = (
	let	val len = size s;
		fun aux i = (
			i = len
		orelse	(let	val x = chr_ord(String.sub(s, i));
			in	x >= ord0 andalso x <= ord9
			end	andalso aux (i + 1))
		);
	in	len <> 0 andalso aux 0
	end
);
end;
=TEX
\subsection{Numeric Conversions}
$nat\_of\_string$ converts a string into a non-negative
integer (using decimal notation). It raises an exception
if that cannot be done.
=SML
local
	val chr_ord = SML97BasisLibrary.Char.ord;
	val ord0 = chr_ord #"0";
in
fun ⦏nat_of_string⦎ (s : string) : int = (
	let	val len = size s;
		fun aux acc i = (
			if	i = len
			then	acc
			else	let	val n = chr_ord (String.sub(s, i)) - ord0;
				in	if	n >= 0 andalso n <= 9
					then	aux (n + 10*acc) (i+1)
					else	fail
						"nat_of_string"
						1012 [(fn () => s)]
				end
		);
	in	if	len = 0
		then	fail "nat_of_string" 1013 []
		else	aux 0 0
	end
);
end;
=TEX
$string\_of\_int$ converts an integer into a decimal
string. (SML's library function $makestring$ would
nearly do, but we want negative numbers to be shown
with a minus sign, and we do not want
to be affected by $PolyML.print\-\_depth$ being set to 0.)
=SML
local
	val ord0 = ord "0"
in
fun ⦏string_of_int⦎ (n : int) : string = (
	let	fun aux m = ( (* assumes m > 0 *)
			case m div 10 of
				0 => chr(ord0 + (m mod 10))
			|	mdiv10 => aux mdiv10 ^ chr(ord0 + (m mod 10))
		);
	in	if n > 0
		then aux n
		else if n = 0
		then "0"
		else "-" ^ aux (~n)
	end
);
end;
=TEX
=SML
end (* of CharacterUtilities *);
open CharacterUtilities;
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
=SML
structure ⦏SimpleDictionary⦎ : SimpleDictionary = struct
=TEX

These are straightforward. We use the prefix $s\_$ to
distinguish the types and functions involved from those
used for the more efficient technique.

We define a simple dictionary to be a list of
pairs in UtilitySharedTypes.
The functions for accessing and modifying
dictionaries are essentially just interfaces to the
partial function operations defined in
previous sections:

$s\_lookup$ implements application (of the dictionary
viewed as a partial function):
=SML
fun ⦏s_lookup⦎ (s : string) (dict : 'a S_DICT) : 'a OPT = (
	lassoc5 dict s
);
=TEX
$s\_enter$ implements overwriting by a singleton function:
=SML
fun ⦏s_enter⦎ (s : string) (a : 'a) (dict : 'a S_DICT) : 'a S_DICT = (
	dict overwrite (s, a)
);
=TEX
$s\_extend$ implements extension by a singleton function,
that is to say it is like $s\_enter$  but raises an
exception if the new argument is already
in the domain of the dictionary:
=SML
fun ⦏s_extend⦎ (s : string) (a : 'a) (dict : 'a S_DICT) : 'a S_DICT = (
	case lassoc5 dict s of
	Value _ => fail "s_extend" 1014 [fn (():unit) => s]
	| Nil => (s,a) :: dict
);
=TEX
$s\_delete$ deletes an element of the domain of a dictionary.
If the element is not in the domain it returns the
dictionary unchanged.
=SML
fun ⦏s_delete⦎ (s : string) (dict : 'a S_DICT) : 'a S_DICT = (
	dict drop (fn (s', _) => s' = s)
);
=TEX
$s\_merge$ extends one dictionary by another.
An exception will be raised if the domains of the
two dictionaries have elements in common.
=SML
fun ⦏s_merge⦎ (dict1 : 'a S_DICT) (dict2 : 'a S_DICT) : 'a S_DICT = (
	fold (uncurry(uncurry s_extend)) dict1 dict2
);
=TEX
The initial value of the dictionary is just the empty list.
=SML
val ⦏initial_s_dict⦎ : 'a S_DICT = [];
=TEX
=SML
end (* of SimpleDictionary *);

open SimpleDictionary;
=TEX

\subsection{Efficient Dictionaries}
=SML
structure ⦏EfficientDictionary⦎ : EfficientDictionary = struct
=TEX
The technique we use for the more efficient dictionaries
is binary search trees using a hashing function to avoid
problems with partially sorted input data causing degenerate
tree structures.

Note that these trees never
grow to have more than $R$ (internal) nodes where
$R$ is the number of possible hash keys (which is however very large). The idea of
using the hashing approach rather than binary search trees with
one node per dictionary entry is to avoid string comparisons and to avoid partially
sorted input data causing the trees to degenerate into lists.

The code for the more efficient dictionaries is quite
straightforward except, perhaps for the hashing function.
We use the prefix $e\_$ to distinguish
names from those used for the simple dictionaries.
We package the dictionary code in an abstract data type
since the implementation may well change if the performance
is not satisfactory.

Inside the abstract data type we see that an efficient
dictionary is, as promised above, a binary tree whose
internal nodes contain integer keys and simple dictionaries.
=SML
abstype 'a ⦏E_DICT⦎	=	⦏Leaf⦎
			|	⦏Node⦎ of int * ('a S_DICT) * ('a E_DICT) * ('a E_DICT)
with
datatype ⦏E_KEY⦎		=	⦏Key⦎ of int * string;
=TEX
The hashing function, $hash$ is local to the abstract
data type. The basic method is what Knuth \cite[pp. 508ff.]{Knuth73}
calls the division method: one treats the string value as a number
and reduces it modulo $N$ for suitable $N$. However, on its own this
gives bad results on partially sorted data (runs in the data will give
runs in the hashed key values). To remedy this, we first pass each byte of
the string through a fixed random permutation of the 256 byte values (see assumptions
below). We also take the bytes of the string from right-to-left which will give
better results with input of the form ``XXX1'', ``XXX2'' \ldots.
Experimentation shows that this gives a very worthwhile improvement in
the balance of the trees.

The chosen value $N$ is the prime number $2^{22}-3$. This has some pleasant
properties: firstly, it is the largest prime number, $p$, such that $256\times p < 2^{30}-1$
(which is the maximum integer on Standard ML of New Jersey, and is certainly representable
as an integer on other common ML implementations). This permits a simple byte-by-byte
implementation of the hash function. This choice of $N$ also seems to give
a very good spread of hash values in testing on large data sets.

However, the simple implementation involves some avoidable overhead in terms of
recursive function calls and arithmetic operations (one each per byte of:
recursive call, multiplication, addition and modulo).
The coding below reduces this to one recursive call, one multiplication, one modulo
and three additions for every three bytes and this seems to result in a 10\% or
more improvement in average access times on large tables .
This reduction is achieved by precomputing
tables giving the values $2^{8}\times r$ and
$2^{16}\times r$ for each entry $r$ in the table giving the random permutation.
This means that the string can be treated as a base $2^24$ number
with each three bytes supplying one base $2^24$ digit in three table lookups and two additions.
The hash value being accumulated is in the range $0 \ldots 2^{22}-4$.
Multiplying such a value by $2^{24}$ could clearly overflow on a system such as Standard ML of
New Jersey, but as $2^24$ is congruent to $12$ modulo $2^{22}-3$, we can multiply by $12$
instead and this will not overflow, even when we add in the next base $2^24$ digit.
As a final improvement, the {\tt rem} function in Standard ML is rumoured
to be more efficient than {\tt mod} on may processors --- as all the arithmetic
is with non-negative numbers, we use {\tt rem} in place of {\tt mod} (which
seemed to make a tiny improvement on an Intel Pentium processor).

The performance of the efficient dictionaries has been tested on tables
with 4,000 to 40,000 entries comprising a variety of near sorted data and
on real-life data extracted from the {\ProductZ} system.
The current hash function gives a large improvement in the average access
compared with earlier versions (which used a much smaller prime number resulting
in decay into linear search on quite small data sets).
On all the data sets tested, the current hash function gives very few
collisions (e.g., 2 or 3 in tables with 4,000 entries and less than 100
in a table with just over 18,000 real-life keys).
The optimisations to the hash function result in a more than 10\% improvement
on average access time on all data sets tested.

The following assumptions about the compiler and the basis library are
recorded for future reference. The code below may overflow or give bad
results if these assumptions are not satisfied.
\begin{itemize}
\item The maximum positive integer must be at least $2^{30}-1$.
\item {\it Char.ord} must not return negative values (this is implicit in
the basis library documentation which says that the values range from $0$
up to {\it maxOrd}).
\item {\it maxOrd} must be at most $255$.
\end{itemize}


=SML
local
	open SimpleDictionary;
	val ⦏prime⦎ = 4194301;
	val ⦏H⦎ = 256;
	val ⦏Hsq⦎ = H*H;
	val ⦏Hcubed_mod_prime⦎ = (H*H*H) mod prime (* 12 *);
	val ⦏permutation⦎ =
	[93,84,24,165,149,68,97,20,37,187,222,52,96,106,77,173,53,138,116,143,6,124,
	 88,101,232,123,239,131,110,213,61,141,230,155,47,31,95,89,14,172,188,74,157,
	 5,180,9,58,177,32,152,75,113,185,78,220,191,231,50,128,179,112,91,254,161,
	 71,156,125,167,15,92,201,190,10,218,164,51,133,145,108,57,82,33,200,66,229,
	 181,8,219,80,174,224,183,150,199,40,208,34,105,63,26,109,7,134,39,104,238,
	 194,184,62,94,210,178,46,147,41,67,246,211,252,79,43,221,182,103,197,235,
	 237,119,171,18,148,2,243,76,240,195,250,83,30,192,198,170,111,227,35,19,132,
	 204,244,118,255,140,64,17,4,29,225,12,212,28,163,73,146,196,169,206,27,23,
	 245,117,217,203,48,242,216,205,159,86,228,249,45,99,215,22,54,135,214,241,
	 49,42,186,100,56,36,102,247,44,85,69,114,160,81,175,136,233,162,168,126,16,
	 13,25,202,90,209,115,60,87,153,130,122,11,127,158,248,1,144,236,166,226,223,
	 176,70,207,72,253,121,189,3,142,137,107,98,0,154,38,234,59,139,55,120,129,
	 65,193,251,151,21];
	val ⦏table0⦎ = PPVector.vector (map (fn i => Hsq * i) permutation);
	val ⦏table1⦎ = PPVector.vector (map (fn i => H * i) permutation);
	val ⦏table2⦎ = PPVector.vector permutation;
	fun ⦏get_byte0⦎ (s, i) = (
		PPVector.sub(table0, SML97BasisLibrary.Char.ord(String.sub(s, i)))
	);
	fun ⦏get_byte1⦎ (s, i) = (
		PPVector.sub(table1, SML97BasisLibrary.Char.ord(String.sub(s, i)))
	);
	fun ⦏get_byte2⦎ (s, i) = (
		PPVector.sub(table2, SML97BasisLibrary.Char.ord(String.sub(s, i)))
	);
	fun ⦏hash⦎ ("" : string) : int = 0
	|   hash (s : string) : int = (
		let	val len = size s;
			fun aux acc i = (
				case i of
					0 => (
					(acc * H + get_byte2(s, 0)) mod prime
				) |	1 => (
					(((acc * H + get_byte2(s, 1)) mod prime) * H
						+ get_byte2(s, 0)) mod prime
				) |	_ => (
					let	val w = get_byte0(s, i) +
							get_byte1(s, i-1) +
							get_byte2(s, i-2);
						val acc' = (Hcubed_mod_prime * acc + w)
							mod prime;
						val i' = i - 3;
					in	if	i' < 0
						then	acc'
						else	aux acc' i'
					end
				)
			);
		in	aux 0 (len-1)
		end
	);
in
=TEX
The various operations on the dictionaries are straightforward
to code. We do the hash-key versions first then the string versions using them.
First of all the operations on keys:
=SML
	fun ⦏e_get_key⦎ (s: string)  : E_KEY = (
		Key(hash s, s)
	);
=TEX
=SML
	fun ⦏string_of_e_key⦎ (Key(_, s)  : E_KEY) = (
		s
	);
=TEX
Like $s\_lookup$, $e\_key\_lookup$ implements application.
=SML
	fun ⦏e_key_lookup⦎ (Key(k, s) : E_KEY)  (dict : 'a E_DICT) : 'a OPT = (
		let	fun aux Leaf = Nil
			| aux (Node(k', pairs, l, r)) = (
				if k < k'
				then aux l
				else if k = k'
				then lassoc5 pairs s
				else aux r
			);
		in	aux dict
		end
	);
=TEX
Like $s\_enter$,
$e\_key\_enter$ implements overwriting by a singleton function:
=SML
	fun ⦏e_key_enter⦎ (Key(k, s) : E_KEY) (a : 'a) (dict : 'a E_DICT) : 'a E_DICT = (
		let	fun aux Leaf = Node (k, [(s, a)], Leaf, Leaf)
			| aux (Node(k', pairs, l, r)) = (
				if k < k'
				then Node(k', pairs, aux l, r)
				else if k = k'
				then Node(k', pairs overwrite (s, a), l, r)
				else Node(k', pairs, l, aux r)
			);
		in	aux dict
		end
	);
=TEX
Like $s\_extend$,
$e\_key\_extend$ implements extension by a singleton function:
=SML
	fun ⦏e_key_extend⦎ (Key(k, s) : E_KEY) (a : 'a) (dict : 'a E_DICT) : 'a E_DICT = (
		let	fun aux Leaf = Node (k, [(s, a)], Leaf, Leaf)
			| aux (Node(k', pairs, l, r)) = (
				if k < k'
				then Node(k', pairs, aux l, r)
				else if k = k'
				then	case lassoc5 pairs s of
						Nil => Node(k', ((s, a) :: pairs), l, r)
					|	Value _ => fail "e_extend"
							1014 [fn (():unit) => s]
				else Node(k', pairs, l, aux r)
			);
		in	aux dict
		end
	);
=TEX
Like $s\_delete$, $e\_delete$ deletes an element from
the domain of a dictionary.
Some modules make heavy use of deletion and as the hashing function gives
a good spread of values, it is important both for space and speed to
reclaim nodes whose data components have become empty.
This is done by lifting up the left-most leaf of the right hand subtree
to fill in for a node that is to be deleted from the tree.
The resulting tree is at most no deeper than the original.
=SML
	fun ⦏e_key_delete⦎ (Key(k, s) : E_KEY) (dict : 'a E_DICT) : 'a E_DICT = (
		let	fun del_left_most (Node (k', pairs, l, r)) = (
				case l of
					Node(_, _, Node _, _) => (
					let	val (l', kpairs) = del_left_most l;
					in	(Node (k', pairs, l', r), kpairs)
					end	
				) | 	Node (lk, lpairs, Leaf, lr) => (
					(Node(k', pairs, lr, r), (lk, lpairs))
				) | 	Leaf => (
					(r, (k', pairs))
				)
			) | del_left_most Leaf = (Leaf, (0, []));
			fun aux Leaf = Leaf
			|   aux (Node(k', pairs, l, r)) = (
				if k < k'
				then Node(k', pairs, aux l, r)
				else if k = k'
				then	case pairs drop (fn (s',_) => s' = s) of
						[] => (
						case del_left_most r of
							(r', (k'', pairs'' as _::_)) => (
								Node(k'', pairs'', l, r')
							) | (_, (_, [])) => l
					) | pairs' => Node(k', pairs', l, r)
				else Node(k', pairs, l, aux r)
			);
		in	aux dict
		end
	);
=TEX
Now we give the string versions of the access functions.

For {\it e\_lookup} we make the tiny optimisation of avoiding calculating the key if the
dictionary is empty.
=SML
	fun ⦏e_lookup⦎ (_ : string) (Leaf : 'a E_DICT) : 'a OPT = Nil
	|   e_lookup s dict = (
		e_key_lookup (e_get_key s) dict
	);
=TEX
=SML
	fun ⦏e_enter⦎ (s : string) (a : 'a) (dict : 'a E_DICT) : 'a E_DICT = (
		e_key_enter (e_get_key s) a dict
	);
=TEX
=SML
	fun ⦏e_extend⦎ (s : string) (a : 'a) (dict : 'a E_DICT) : 'a E_DICT = (
		e_key_extend (e_get_key s) a dict
	);
=TEX
=SML
	fun ⦏e_delete⦎ (s : string) (dict : 'a E_DICT) : 'a E_DICT = (
		e_key_delete (e_get_key s) dict
	);
=TEX
Before defining $e\_merge$ we first define operations
which allow efficient dictionaries to be converted
into simple ones and vice versa.

$e\_flatten$ converts an efficient dictionary into a simple one.
Notice the ordering of a flattened node's components - this is done to attempt to address the problem of gaining an unbalanced tree if one flattens a dictionary, and then rebuilds it.
The order chosen is likely to cause the creation of a dictionary with a similar structure and balance to the original.
=SML
	fun ⦏e_flatten⦎ (dict : 'a E_DICT) : 'a S_DICT = (
		case dict of
			Leaf => []
		|	Node(_, pairs, l, r) => pairs @ e_flatten l @ e_flatten r
	);
=TEX
$list\_e\_merge$ extends an efficient dictionary by a simple
one. Note that this operation raises an exception if the domains of the
two dictionaries have elements in common.
=SML
	fun ⦏list_e_merge⦎ (dict1 : 'a E_DICT) (pairs : 'a S_DICT) : 'a E_DICT = (
		fold (uncurry(uncurry e_extend)) pairs dict1
	);
=TEX
$list\_e\_enters$ overwrites an efficient dictionary with the entries in a simple
one.
=SML
	fun ⦏list_e_enter⦎ (dict1 : 'a E_DICT) (pairs : 'a S_DICT) : 'a E_DICT = (
		fold (uncurry(uncurry e_enter)) pairs dict1
	);
=TEX
$e\_merge$ extends one efficient dictionary by another.
Again, note that this operation raises an exception if the domains of the
two dictionaries have elements in common.
=SML
	fun ⦏e_merge⦎ (dict1 : 'a E_DICT) (dict2 : 'a E_DICT) : 'a E_DICT = (
		list_e_merge dict1 (e_flatten dict2)
	);
=TEX
The following function may be useful to anyone wanting to do further work
on the performance of the efficient dictionaries.
=SML
	fun e_stats (dict : 'a E_DICT) :
		{height : int, nentries : int, nnodes : int, sumweights : int} = (
		let	fun aux
			{height, nentries, nnodes, sumweights}
			h Leaf = (
				{height = if h < height then height else h,
				 nentries = nentries,
				 nnodes = nnodes,
				 sumweights = sumweights}
			) |   aux
			{height, nentries, nnodes, sumweights}
		  	h (Node(k', pairs, l, r)) = (
				let	val npairs = length pairs;
					val acc =
						{height = height,
						 nentries = nentries + npairs,
						 nnodes = nnodes + 1,
						 sumweights = sumweights + (h+1)*npairs};
					val acc' = aux acc (h+1) l
				in	aux acc' (h+1) r
				end
			);
		in	aux
			{height = 0,
			 nentries = 0,
			 nnodes = 0,
			 sumweights = 0}
			0 dict
		end
	);
=TEX
The final item declared in the abstract data type for
efficient dictionaries is an empty dictionary, which
gives a starting point for the use of the above functions.

=SML
	val ⦏initial_e_dict⦎ : 'a E_DICT = Leaf;

end (* of local ... in ... end *)
=TEX
We suppress pretty-printing of the type under Poly/ML.
=POLYML
local
    fun pp _ _ (_: 'a E_DICT) = PolyML.PrettyString "?"
in
    val _ = PolyML.addPrettyPrinter pp
end;
=SML
end; (* of abstype E_DICT *)
=TEX
=SML
end (* of EfficientDictionary *);

open EfficientDictionary;
=TEX
\subsection{Order Preserving Efficient Dictionaries}
=SML
structure ⦏OrderedEfficientDictionary⦎ : OrderedEfficientDictionary = struct
open EfficientDictionary;
=TEX
The implementation provides the combined services of a simple dictionary and an
efficient one  by having both:
=SML
abstype 'a ⦏OE_DICT⦎ = OEDict of (('a * E_KEY) S_DICT * 'a E_DICT)
with
=TEX
=SML
	val ⦏initial_oe_dict⦎ : 'a OE_DICT = OEDict (initial_s_dict, initial_e_dict);
=TEX
We arrange to have the failure behaviour for {e\_extend} simply by always calling the
``{\it e\_}'' function first. For efficiency, we bypass the simple dictionary function
wherever possible.
=SML
	fun ⦏oe_key_lookup⦎  (key : E_KEY)  (OEDict(_, ed): 'a OE_DICT) : 'a  OPT = (
		e_key_lookup key ed
	);
	fun ⦏oe_key_extend⦎  (key : E_KEY) (item : 'a)  (OEDict(sd, ed): 'a OE_DICT) : 'a OE_DICT = (
		let	val ed' = e_key_extend key item ed;
			val sd' = (string_of_e_key key, (item, key)) :: sd;
		in	OEDict (sd', ed')
		end
	);
	fun ⦏oe_key_enter⦎  (key : E_KEY) (item : 'a)  (OEDict(sd, ed): 'a OE_DICT) : 'a OE_DICT = (
		let	val ed' = e_key_enter key item ed;
			val sd' = case e_key_lookup key ed of
				Nil =>  (string_of_e_key key, (item, key)) :: sd
			|	Value _ => s_enter (string_of_e_key key) (item, key) sd;
		in	OEDict (sd', ed')
		end
	);
	fun ⦏oe_key_delete⦎  (key : E_KEY)  (OEDict(sd, ed): 'a OE_DICT) : 'a  OE_DICT = (
		let	val ed' = e_key_delete key ed;
			val sd' = s_delete (string_of_e_key key) sd;
		in	OEDict (sd', ed')
		end
	);
	fun ⦏oe_lookup⦎  (skey : string)  (OEDict(_, ed): 'a OE_DICT) : 'a  OPT = (
		e_lookup skey ed
	);
	fun ⦏oe_extend⦎  (skey : string) (item : 'a)  (oed: 'a OE_DICT) : 'a OE_DICT = (
		oe_key_extend (e_get_key skey) item oed
	);
	fun ⦏oe_enter⦎  (skey : string) (item : 'a)  (oed: 'a OE_DICT) : 'a OE_DICT = (
		oe_key_enter (e_get_key skey) item oed
	);
	fun ⦏oe_delete⦎  (skey : string)  (OEDict(sd, ed): 'a OE_DICT) : 'a  OE_DICT = (
		let	val ed' = e_delete skey ed;
			val sd' = s_delete skey sd;
		in	OEDict (sd', ed')
		end
	);
	fun ⦏oe_flatten⦎ (OEDict(sd, _) : 'a OE_DICT) : 'a S_DICT = (
		map (fn (s, (i, _)) => (s, i)) sd
	);
	fun ⦏oe_key_flatten⦎ (OEDict(sd, _) : 'a OE_DICT) : ('a * E_KEY) S_DICT = (
		sd
	);
	fun ⦏e_dict_of_oe_dict⦎ (OEDict(_, ed) : 'a OE_DICT) : 'a E_DICT = (
		ed
	);
	fun ⦏list_oe_merge⦎ (sed : 'a OE_DICT)  (new : 'a S_DICT) : 'a OE_DICT = (
		fold (fn ((k,x), d) => oe_extend k x d) new sed
	);
=TEX
For merging we need to be careful to use the approach of {\it s\_merge}:
=SML
	fun ⦏oe_merge⦎ (OEDict(sd1, _ )  : 'a OE_DICT) (dict2 : 'a OE_DICT) : 'a OE_DICT = (
		fold (fn ((s, (x, _)), d) => oe_extend s x d) sd1 dict2
	);
=TEX
We suppress pretty-printing of the type under Poly/ML.
=POLYML
local
    fun pp _ _ (_: 'a OE_DICT) = PolyML.PrettyString "?"
in
    val _ = PolyML.addPrettyPrinter pp
end;
=SML
end; (* of abstype OE_DICT *)
end (* of OrderedEfficientDictionary *);

open OrderedEfficientDictionary;
=TEX
\section{CODE PROFILING}
The following definitions may be used to record
statistics, e.g., on the number of times certain
functions have been called.
=SML
structure ⦏Profiling⦎ : Profiling = struct
local
	open EfficientDictionary;
	val stats : int E_DICT ref = ref initial_e_dict;
	val profiling : bool ref = ref true;
	val _= new_flag{name="⦏profiling⦎",
		control = profiling,
		default = fun_false,
		check = fun_true};
in
fun ⦏prof⦎ (name : string) : unit = (
	if !profiling
	then
		stats :=
		e_enter
		name
		(case e_lookup name (!stats) of
			Value n => n + 1
		|	Nil => 1)
		(!stats)
	else ()
);
fun ⦏counts⦎ (name: string) : int OPT = e_lookup name (!stats);

fun ⦏print_stats⦎ (i_d : int S_DICT) : unit = (
	map (raw_diag_string o (fn (n, i: int) => n ^ " : " ^ string_of_int i)) i_d;
	()
);

fun ⦏get_stats⦎ (():unit) : int S_DICT = e_flatten (!stats);

fun ⦏init_stats⦎ (():unit) : unit = (
	stats := initial_e_dict;
	()
);

fun ⦏set_stats⦎ (stts: int S_DICT) : unit = (
let	val estats = list_e_merge initial_e_dict stts
		handle (Fail _) => fail "set_stats" 1020 [];
	val dummy = (stats := estats);
in
	()
end);	
end(* of local *)
end(* of Profiling *);
open Profiling;
=TEX
\section{CODE TIMING}
=SML
structure ⦏Timing⦎ : Timing = struct
=SML
datatype ⦏TIMER_UNITS⦎ = ⦏Microseconds⦎ | ⦏Milliseconds⦎ | ⦏Seconds⦎;
type 'b ⦏TIMED⦎ = {result : 'b, time : int, units : TIMER_UNITS};
structure TimeInt = IntInf;
=SML
fun ⦏time_app⦎ (units : TIMER_UNITS) : ('a -> 'b) -> 'a -> 'b TIMED = (
	let	val time_conv = TimeInt.toInt o (
			case units of
				Microseconds => Time.toMicroseconds
			|	Milliseconds => Time.toMilliseconds
			|	Seconds => Time.toSeconds
		);
	in	fn f => fn x =>
		let	val start = Time.now();
			val result = f x;
			val time = time_conv(Time.-(Time.now(), start))
				handle Overflow => fail "time_app" 1021 [];
		in	{result = result, time = time, units = units}
		end	
	end
);
=TEX
=SML
val ⦏stopwatch⦎ : Time.time ref = ref (Time.fromSeconds 0);
=TEX
=SML
fun ⦏reset_stopwatch⦎ (():unit) : unit = (
	stopwatch := Time.now()
);
=TEX
=SML
fun ⦏read_stopwatch⦎ (units : TIMER_UNITS) : int = (
	(TimeInt.toInt o
	(case units of
		Microseconds => Time.toMicroseconds
	|	Milliseconds => Time.toMilliseconds
	|	Seconds => Time.toSeconds))
	(Time.-(Time.now(), !stopwatch))
);
=SML
end(* of Timing structure *);
open Timing;
=TEX
=TEX
\section{ORDERINGS}
=SML
structure ⦏Order⦎ : Order = struct
=TEX

By way of an example, to sort integers in ascending order,
you would use $curry (op -)$.
\subsection{The Type of Orderings}
=SML
type 'a ⦏ORDER⦎ = 'a -> 'a -> int;
=TEX
Note that the type can be used to represent orderings whose field is not the carrier set of the type, using failure to represent non-membership of the field.
\subsection{Some Useful Specific Orderings}
=TEX
Ordering on the ML integers:
=SML
val ⦏int_order⦎ : int ORDER = curry (op -);
=TEX
Trivial ordering (everyhing equivalent).
=SML
val ⦏no_order⦎ : 'a ORDER = fn _ => fn _ => 0;
=TEX
Simple ordering of strings:
=SML
val ⦏ascii_order⦎ : string ORDER = (fn s1 => fn s2 =>
	case String.compare (s1, s2) of
		LESS => ~1
	|	GREATER => 1
	|	_ => 0
);
=TEX
A more civilised ordering on
strings than the one given by the ASCII codes.

The original implementation exploded the strings and used {\it lexicographic}; the coding now
uses indexing and a table and is a lot faster.
=SML
local
	val orda = ord "a";
	val ordz = ord "z";
	val ordA = ord "A";
	val ordZ = ord "Z";
	fun char_pos (ord_ch : int) : int = (
		if	ordA <= ord_ch andalso ord_ch <= ordZ
		then	2*(ord_ch - ordA)
		else if	orda <= ord_ch andalso ord_ch <= ordz
		then	2*(ord_ch - orda) + 1
		else if	ord_ch > ordZ andalso ord_ch > ordz
		then	ord_ch
		else if	ord_ch > ordZ orelse ord_ch > ordz (* but not both *)
		then	ord_ch + 26
		else	ord_ch + 52
	);
	val order_table : int PPVector.vector = PPVector.vector (map char_pos (interval 0 255));
in
	fun ⦏string_order⦎   (s1 : string) (s2 : string) : int = (
		let	val sz1 = size s1;
			val sz2 = size s2;
			val ascii_code = SML97BasisLibrary.Char.ord;
			fun first_diff i = (
				if	i = sz1
				then	if	i = sz2
					then	0	(* equal *)
					else	~1	(* s1 proper substring of s2 - in order *)
				else if	i = sz2
				then	1		(* s2 proper substring of s1 - out of order *)
				else 	let	val c1 = ascii_code(String.sub(s1, i));
						val c2 = ascii_code(String.sub(s2, i));
						val i1 = PPVector.sub(order_table, c1);
						val i2 = PPVector.sub(order_table, c2);
				in	case i1 - i2 of
							0 => first_diff (i+1)
						|	x => x
					end
			);
		in	first_diff 0
		end
	);
end;
=TEX
\subsection{Functions on Orderings}
The following function returns the lexicographic ordering
function induced from an ordering
of items of type $'a$ on items of type $'a\,list$.
=SML
fun ⦏list_order⦎ (order : 'a ORDER) : 'a list ORDER = (
	let	fun aux [] [] = 0
		| aux [] _ = ~1
		| aux _ [] = 1
		| aux (x :: xs) (y :: ys) = (
			case order x y of
				0 => aux xs ys
			|	NonZero => NonZero
		);
	in	aux
	end
);
=TEX
Synonym for $list\_order$ (historical):
=SML
val ⦏lexicographic⦎ : 'a ORDER -> 'a list ORDER = list_order;
=TEX
=SML
fun ⦏inv_list_order⦎ (r : 'a ORDER) : 'a list ORDER = (fn xs => fn ys =>
	let	fun aux1 acc1 acc2 (x::xs) (y::ys) = (
			let	val i = r x y;
			in	if	i = 0
				then	aux1 acc1 acc2 xs ys
				else	aux1 acc1 i xs ys
			end
		) | aux1 acc1 acc2 _ _ = (
			if	acc2 = 0
			then	acc1
			else	acc2
		);
		val lxs = length xs;
		val lys = length ys;
	in	if	lxs < lys
		then	aux1 (~1) 0 xs (ys from (lys - lxs))
		else	aux1 1 0 (xs from (lxs - lys)) ys
	end
);
=TEX
Lexicographic
order induced on a binary product type by orderings on the
component types:
=SML
fun ⦏pair_order⦎ (o1 : 'a ORDER) (o2 : 'b ORDER)
	: ('a * 'b) ORDER = (fn (a1, b1) => fn (a2, b2) =>
	case o1 a1 a2 of
		0 => o2 b1 b2
	|	not_zero => not_zero
);
=TEX
Ordering on OPT types with $Nil$ top.
=SML
fun ⦏opt_order⦎ (o1 : 'a ORDER) : 'a OPT ORDER = (fn x => fn y =>
	case (x, y) of
		(Value x, Value y) => o1 x y
	|	(Value _, Nil) => ~1
	|	(Nil, Value _) => 1
	|	(Nil, Nil) => 0
);
=TEX
Ordering on OPT types with $Nil$ bottom.
=SML
fun ⦏opt_order1⦎ (o1 : 'a ORDER) : 'a OPT ORDER = (fn x => fn y =>
	case (x, y) of
		(Value x, Value y) => o1 x y
	|	(Value _, Nil) => 1
	|	(Nil, Value _) => ~1
	|	(Nil, Nil) => 0
);
=TEX
=SML
fun ⦏rev_order⦎ (r : 'a ORDER) : 'a ORDER = (fn x => fn y =>
	~(r x y)	
);
=TEX
=SML
infix 4 THEN_O;
fun (r1 : 'a ORDER) ⦏THEN_O⦎ (r2 : 'a ORDER) = (fn x => fn y =>
	let	val i1 = r1 x y;
	in	if	i1 <> 0
		then	i1
		else	r2 x y
	end	
);
=TEX
=SML
fun ⦏induced_order⦎ (f : 'a -> 'b, r : 'b ORDER) : 'a ORDER = (fn x => fn y =>
	r (f x) (f y)	
);
=TEX
That ends the structure:
=SML
end (* of Structure Order *);
open Order;
=TEX
\section{SORTING UTILITIES}
It is convenient here and elsewhere to have a reasonably
efficient sort function.
In this section we define a structure $Sort$ which
supplies such a function .
=SML
structure ⦏Sort⦎ : Sort = struct
open Order;
=TEX
\subsection{$sort$}
The sorting algorithm is a binary merge sort.
=TEX
=SML
fun ⦏merge⦎  (order : 'a ORDER) (xs : 'a list) (ys : 'a list) : 'a list = (
	let	fun aux acc [] [] = rev acc
		|   aux acc (x::xs) [] = aux (x::acc) xs []
		|   aux acc [] (y::ys) = aux (y::acc) [] ys
		|   aux acc (xs as (x::more_xs)) (ys as (y::more_ys)) = (
			let	val t = order x y;
			in	if	t < 0	(* x < y *)
				then	aux (x::acc) more_xs ys
				else if	t > 0 	(* x >  y *)
				then	aux (y::acc) xs more_ys
				else	aux (x::acc) more_xs more_ys (* x = y *)
			end
		);
	in	aux [] xs ys
	end
);
=SML
fun ⦏sort⦎  (order : 'a ORDER) (xs : 'a list) : 'a list = (
	let	fun deal lr [] = lr
		|   deal (l, r) (x::y::more) = deal (x::l, y::r) more
		|   deal (l, r) [x] = (x::l, r);
	in	case xs of
			[] => []
		|	[_] => xs
		|	[x, y] =>
			let	val t = order x y;
			in	if	t < 0	(* x < y *)
				then	xs
				else if	t > 0	(* x > y *)
				then	[y, x]
				else	[x]	(* x = y *)
			end
		|	_::_ => (
			let	val (l, r) = deal ([], []) xs;
				val sl = sort order l;
				val sr = sort order r;
			in	merge order sl sr
			end
		)
	end
);
=SML
=TEX
That ends the structure:
=SML
end (* of Structure Sort *);
open Sort;
=TEX
\section{SPARSE ARRAYS}
=SML
structure SparseArray : SparseArray = struct
=TEX
The sparse arrays are represented using the following data structure.
An empty array is signalled by $lbound$ being greater than $ubound$.
=SML
abstype '_a ⦏SPARSE_ARRAY⦎ = SA of {
	lbound	: int ref,
	ubound	: int ref,
	data	: (int * '_a) list Array.array
}
with
=TEX
=SML
fun ⦏array⦎ (len : int) : '_a SPARSE_ARRAY = (
	if len <= 0
	then	fail "array" 1102 []
	else	SA{lbound = ref 1, ubound = ref 0, data =Array.array (len, [])}
);
=TEX
=SML
fun ⦏update⦎ (array:'_a SPARSE_ARRAY, ind : int, a : '_a) : unit  = (
	let	val SA{	lbound = lbound as ref lb,
			ubound = ubound as ref ub,
			data = data} = array;
		val se1 = (
			if lb > ub
			then	(lbound := ind; ubound := ind)
			else if ind < lb
			then	lbound := ind
			else if ind > ub
			then	ubound := ind
			else ()
		);
		val actind = ind mod (Array.length data);
		val old = Array.sub(data, actind)
		val new = old overwrite (ind, a)
	in	Array.update(data, actind, new)
	end
);
=TEX
=SML
fun ⦏scratch⦎ (array:'_a SPARSE_ARRAY) : unit  = (
	let	val SA{	lbound = lbound,
			ubound = ubound,
			data = data} = array;
		fun aux i = (
			if i >= 0
			then (Array.update(data, i, []); aux (i-1))
			else ()
		);
	in	(lbound := 1; ubound := 0; aux (Array.length data - 1))
	end
);
=TEX
=SML
fun ⦏sub⦎ (array:'_a SPARSE_ARRAY, ind : int) : '_a  = (
	let	val SA{	lbound = _,
			ubound = _,
			data = data} = array;
		val pairs = Array.sub(data, ind mod Array.length data);
	in	lassoc3 pairs ind
	end	handle ex => divert ex "lassoc3" "sub" 1101 [fn()=>string_of_int ind]
);
=TEX
=SML
fun ⦏sub_opt⦎ (arrayind :'_a SPARSE_ARRAY * int) : '_a OPT = (
	(Value (sub arrayind)) handle Fail _ => Nil
);
=TEX
=SML
fun ⦏lindex⦎ (array :'_a SPARSE_ARRAY) : int = (
	let	val SA{	lbound = lbound as ref lb,
			ubound = ubound as ref ub,
			data = _} = array;
	in	if lb > ub
		then	fail "lindex" 1103 []
		else lb
	end
);
=TEX
=SML
fun ⦏uindex⦎ (array :'_a SPARSE_ARRAY) : int = (
	let	val SA{	lbound = lbound as ref lb,
			ubound = ubound as ref ub,
			data = _} = array;
	in	if lb > ub
		then	fail "uindex" 1103 []
		else ub
	end
);
=TEX
We suppress pretty-printing of the type under Poly/ML.
=POLYML
local
    fun pp _ _ (_: 'a SPARSE_ARRAY) = PolyML.PrettyString "?"
in
    val _ = PolyML.addPrettyPrinter pp
end;
=SML
end; (* of abstype 'a SPARSE_ARRAY *)
end; (* of structure SparseArray *)
=TEX
\section{DYNAMIC ARRAYS}
=SML
structure DynamicArray : DynamicArray = struct
=TEX
=TEX
The sparse arrays are represented using the following data structure.
An empty array is signalled by $lbound$ being greater than $ubound$.
=SML
abstype '_a ⦏DYNAMIC_ARRAY⦎ = DA of {
	init_size: int,
	ubound: int ref,
	data	: ('_a OPT) Array.array ref
}
with
=TEX
=SML
fun ⦏array⦎ (init : int) : '_a DYNAMIC_ARRAY = (
	if init <= 0
	then	fail "array" 1301 []
	else	DA{init_size = init, ubound = ref ~1, data = ref (Array.array (init, Nil))}
);
=TEX
The following number is the growth factor expressed as a percentage.
We use an approximation to $\sqrt{2}$.
=SML
val ⦏growth_rate⦎ = 141;
=TEX
Then following function calculates the new size:
=SML
fun ⦏new_size⦎ (cur_sz : int) (ind : int) : int  = (
	let	val estimate1 = (cur_sz * growth_rate) div 100;
	in	if 	estimate1 > ind
		then	estimate1
		else	ind + 1
	end
);
=TEX
Now here's the function that does the growing:

=SML
fun ⦏grow⦎ (array:'_a DYNAMIC_ARRAY, ind : int) : unit  = (
	let	val DA{	init_size = init_size,
			ubound = ubound as ref ub,
			data = data as ref arr} = array;
		val cur_sz = Array.length arr;
	in	if	ind < cur_sz
		then	()
		else	let	val new_sz = new_size cur_sz ind;
				val new_arr = Array.array(new_sz, Nil : '_a OPT);
				val _ = Array.copy{
						src = arr,
						di = 0, dst = new_arr};
			in	data := new_arr
			end
	end
);
=SML
fun ⦏update⦎ (array:'_a DYNAMIC_ARRAY, ind : int, a : '_a) : unit  = (
	let	val DA{	init_size = init_size,
			ubound = ubound as ref ub,
			data = data} = array;
	in	if	ind < 0
		then	fail "update" 1302 []
		else	(grow (array, ind);
			(if	ind > ub
			then	ubound := ind
			else	());
			Array.update(!data, ind, Value a))
	end
);
=TEX
=SML
fun ⦏scratch⦎ (array:'_a DYNAMIC_ARRAY) : unit  = (
	let	val DA{	init_size = init_size,
			ubound = ubound as ref ub,
			data = data} = array;
	in	(ubound := ~1; data := Array.array(init_size, Nil))
	end
);
=TEX
=SML
fun ⦏sub⦎ (array:'_a DYNAMIC_ARRAY, ind : int) : '_a  = (
	let	val DA{	init_size = init_size,
			ubound = ref ub,
			data = data} = array;
	in	if	ind < 0
		then	fail "sub" 1302 []
		else if	ind > ub
		then	fail "sub" 1303 [fn () => string_of_int ind]
		else	case Array.sub(!data, ind) of
				Nil => fail "sub" 1101 [fn () => string_of_int ind]
			|	Value a => a
	end
);
=TEX
=SML
fun ⦏sub_opt⦎ (arrayind :'_a DYNAMIC_ARRAY * int) : '_a OPT = (
	(Value (sub arrayind)) handle Fail _ => Nil
);
=TEX
=SML
fun ⦏uindex⦎ (array :'_a DYNAMIC_ARRAY) : int = (
	let	val DA{	init_size = _,
			ubound = ref ub,
			data = _} = array;
	in	ub
	end
);
=TEX
We suppress pretty-printing of the type under Poly/ML.
=POLYML
local
    fun pp _ _ (_: 'a DYNAMIC_ARRAY) = PolyML.PrettyString "?"
in
    val _ = PolyML.addPrettyPrinter pp
end;
=SML
end; (* of abstype 'a DYNAMIC_ARRAY *)
end; (* of structure DynamicArray *)

=TEX
\section{SEARCH TREES}
=SML
structure ⦏SearchTree⦎ : SearchTree = struct
=TEX
=SML
	open Order;
=TEX
The search trees are implemented as 1-2 brother trees (or just brother trees for short)
following \cite{Hinze09}.
The performance is very good even without the two optimisations that Hinze identifies.

The main data type allows for unlabelled leaves ($N0$) and unary nodes ($N1$) and
labelled binary nodes ($N2$). Inside the insertion function, we also use labelled leaves ($L2$)
and ternary nodes with two labels ($N3$). These auxiliary nodes actually only appear
at the root of the tree, but it greatly simplifies the pattern-matching in the insertion
operation not to express this in the type.

The operations preserve the following invariants (a) all leaves have the same depth and
(b) unary nodes only occur as the children of a binary node.
These invariants imply that brother trees are equivalent to AVL trees: if
we elide the unary nodes in a brother the result is a binary tree in which the heights of
the left and right children of every node differ by at most 1, which is the defining
property of AVL trees; conversely an AVL tree can be converted into a brother tree by inserting
unary nodes to make all leaves have the same depth.

=SML
datatype ('k, 'd) ⦏BT⦎ =
		⦏N0⦎
	|	⦏N1⦎ of ('k, 'd) BT
	|	⦏N2⦎ of ('k, 'd) BT * ('k * 'd) * ('k, 'd) BT
	|	⦏L2⦎ of ('k *'d)
	|	⦏N3⦎ of ('k, 'd) BT * ('k * 'd) * ('k, 'd) BT * ('k *'d) * ('k, 'd) BT;
=TEX
The functions that follow carry out the basic operations on brother trees (look-up, insert,
delete and flatten).
These functions assume that their inputs
satisfy these invariants and do not contain any auxiliary nodes.
The external interfaces packages them inside an abstract data type
to guarantee that this holds.

The look-up function is the standard look-up for binary trees skipping over the unary nodes.
=SML
fun ⦏lookup⦎ (order : 'k ORDER) (tree : ('k, 'd) BT) (key : 'k) : 'd OPT = (
	let	fun lu N0 = Nil
		|   lu (N1 t) = lu t
		|   lu (N2 (l, (k, d), r)) = (
			let	val s = order key k;
			in	if s < 0 then lu l
				else if s = 0 then Value d
				else lu r
			end
		) | lu _ = error "st_lookup" 1402 [];
	in	lu tree
	end
);
=TEX
The insertion function is parametrised by a flag indicating whether updates to existing
nodes are allowed. When a new item is inserted, it is initially a labelled leaf ($L2$).
This is either accommodated in the parent or results in a ternary node ($N3$) that is passed
up the tree until it can be accomodated or until we reach the root, where we can increase the
height of the tree to accomodate it. The rewrites that do this carefully preserve the height of
subtrees. See \cite{Hinze09} for diagrams and details.
=SML
fun ⦏insert⦎ (update : bool)
		(order : 'k ORDER) (key : 'k) (d : 'd) (tree: ('k, 'd) BT) : ('k, 'd) BT = (
	let	fun root(N3(t1, a1, t2, a2, t3)) =
			N2(N2(t1, a1, t2), a2, N1 t3)
		|   root(L2 a) =
			N2(N0, a, N0)
		|   root t = t;
		fun n1(L2 a) =
			N2(N0, a, N0)
		|   n1(N3(t1, a1, t2, a2, t3)) =
			N2(N2(t1, a1, t2), a2, N1 t3)
		|   n1 t = N1 t;
		fun n2l(L2 a1, a2, t1) =
			N3(N0, a1, N0, a2, t1) (* t1 must equal N0 *)
		|   n2l(N3(t1, a1, t2, a2, t3), a3, N1 t4) =
			N2(N2(t1, a1, t2), a2, N2(t3, a3, t4))
		|   n2l(N3(t1, a1, t2, a2, t3), a3, t4 as N2 _) =
			N3(N2(t1, a1, t2), a2, N1 t3, a3, t4)
		|   n2l(t1, a1, t2) = N2(t1, a1, t2);
		fun n2r(t1, a1, L2 a2) =
			N3(t1, a1, N0, a2, N0) (* t1 must equal N0 *)
		|   n2r(N1 t1, a1, N3(t2, a2, t3, a3, t4)) =
			N2(N2(t1, a1, t2), a2, N2(t3, a3, t4))
		|   n2r(t1 as N2 _, a1, N3(t2, a2, t3, a3, t4)) =
			N3(t1, a1, N1 t2, a2, N2(t3, a3, t4))
		|   n2r(t1, a1, t2) = N2(t1, a1, t2);
		fun replace (l, r) =
			if update then N2(l, (key, d), r)
			else fail "st_extend" 1401 [];
		fun ins N0 = L2(key, d)
		|   ins(N1 t) = n1(ins t)
		|   ins(N2(l, b as (k, _), r)) =
			let	val s = order key k;
			in	if s < 0 then n2l(ins l, b, r)
				else if s = 0 then replace (l, r)
				else n2r(l, b, ins r)
			end
		|   ins _ = error "st_insert" 1402 [];
	in	root(ins tree)
	end
);
=TEX
To delete the rightmost item in the tree, we replace its node by a unary node and
to delete any other item, we replace it by the leftmost item to its right using a unary
node to remove the original occurrence of the latter item from the tree.
In both cases, a binary node is replaced by a unary
node, which will generally violate the invariants on a brother tree. We repair the tree
by rewriting. See \cite{Hinze09} for diagrams and details.
=SML
fun ⦏delete⦎ (order : 'k ORDER) (key : 'k) (tree: ('k, 'd) BT) : ('k, 'd) BT = (
	let	fun root (N1 t) = t
		|   root t = t;
		fun n2(N1 t1, a1, N1 t2) =
			N1(N2(t1, a1, t2))
		|   n2(N1(N1 t1), a1, N2(N1 t2, a2, t3 as N2 _)) =
			N1(N2(N2(t1, a1, t2), a2, t3))
		|   n2(N1(N1 t1), a1, N2(N2(t2, a2, t3), a3, N1 t4)) =
			N1(N2(N2(t1, a1, t2), a2, N2(t3, a3, t4)))
		|   n2(N1(t1 as N1 _), a1, N2(t2 as N2 _, a2, t3 as N2 _)) =
			N2(N2(t1, a1, t2), a2, N1 t3)
		|   n2(N2(N1 t1, a1, N2(t2, a2, t3)), a3, N1(N1 t4)) =
			N1(N2(N2(t1, a1, t2), a2, N2(t3, a3, t4)))
		|   n2(N2(t1 as N2 _, a1, N1 t2), a2, N1(N1 t3)) =
			N1(N2(t1, a1, N2(t2, a2, t3)))
		|   n2(N2(t1 as N2 _, a1, t2 as N2 _), a2, N1(t3 as N1 _)) =
			N2(N1 t1, a1, N2(t2, a2, t3))
		|   n2(t1, a1, t2) = N2(t1, a1, t2);
		fun split_min N0 = Nil
		|   split_min(N1 t) =
			(case split_min t of Nil => Nil | Value (a, t') => Value(a, N1 t'))
		|   split_min(N2(t1, a1, t2)) =
			(case split_min t1 of Nil => Value(a1, N1 t2)
				| Value(a, t1') => Value(a, n2(t1', a1, t2)))
		|   split_min _ = error "st_delete" 1402 [];
		fun del N0 = N0
		|   del(N1 t) = N1(del t)
		|   del(N2(l, b as (k, _), r)) =
			let	val s = order key k;
			in	if s < 0 then n2(del l, b, r)
				else if s = 0 then
					case split_min r of
						Nil => N1 l
					|	Value(a', r') => n2(l, a', r')
				else n2(l, b, del r)
			end
		|   del _ = error "st_delete" 1402 [];
	in	root(del tree)
	end
);
=TEX
The other basic operation we support is flattening a search tree into a list.
=SML
fun ⦏flatten⦎ (tree : ('k, 'd) BT) : ('k * 'd) list = (
	let	fun aux acc N0 = acc
		|   aux acc (N1 t) = aux acc t
		|   aux acc (N2(l, a, r)) = aux (a::aux acc r) l
		|   aux acc _ = error "st_flatten" 1402 [];
	in	aux [] tree
	end
);
=TEX
The external interface is an abstract datatype encapsulating a pair comprising the ordering
function and a brother tree built using that ordering.
=SML
abstype ('k, 'd) ⦏SEARCH_TREE⦎ = ⦏SearchTree⦎ of {order : 'k ORDER, tree : ('k, 'd) BT}
with
	fun ⦏initial_search_tree⦎ (order : 'k ORDER) : ('k, 'd) SEARCH_TREE = (
		SearchTree {order = order, tree = N0}
	);
	fun ⦏st_lookup⦎ (k : 'k) (SearchTree {order, tree}
			: ('k, 'd) SEARCH_TREE): 'd OPT = (
		lookup order tree k
	);
	fun ⦏st_enter⦎ (k : 'k) (d : 'd) (SearchTree {order, tree} : ('k, 'd) SEARCH_TREE)
			: ('k, 'd) SEARCH_TREE = (
		SearchTree {order = order, tree = insert true order k d tree}
	);
	fun  ⦏list_st_enter⦎ (SearchTree {order, tree} : ('k, 'd) SEARCH_TREE)
		(kvs :  ('k * 'd) list) : ('k, 'd) SEARCH_TREE  = (
		SearchTree {order = order,
			tree = foldl (fn ((k, d), t) => insert true order k d t) tree kvs}
	);
	fun ⦏st_extend⦎ (k : 'k) (d : 'd) (SearchTree {order, tree}
		: ('k, 'd) SEARCH_TREE): ('k, 'd) SEARCH_TREE = (
		SearchTree {order = order, tree = insert false order k d tree}
	);
	fun  ⦏list_st_merge⦎ (SearchTree {order, tree} : ('k, 'd) SEARCH_TREE)
		(kvs :  ('k * 'd) list) : ('k, 'd) SEARCH_TREE  = (
		SearchTree {order = order,
			tree = foldl (fn ((k, d), t) => insert false order k d t) tree kvs}
		handle ex as Fail _ => reraise ex "list_st_merge"
	);
	fun ⦏st_delete⦎ (k : 'k)
			(SearchTree {order, tree} : ('k, 'd) SEARCH_TREE): ('k, 'd) SEARCH_TREE = (
		SearchTree {order = order, tree = delete order k tree}
	);
	fun ⦏st_flatten⦎ (SearchTree {order, tree} : ('k, 'd) SEARCH_TREE): ('k *'d) list = (
		flatten tree
	);
end;
=TEX
=POLYML
local
	fun pp _ _ (_ : ('k, 'd) SEARCH_TREE) = PolyML.PrettyString "?"
in
	val _ = PolyML.addPrettyPrinter pp
end;
=TEX
=SML
end (* of structure SearchTree *);
open SearchTree;
=TEX
\section{ARBITRARY MAGNITUDE INTEGER ARITHMETIC}
=MLTON
(* MLton applications of this code currently do not need arbitrary magnitude integer arithmetic
=SML
structure ⦏Integer⦎ : Integer = struct
=TEX
We use the basis library's $IntInf$ structure.
=SML
	type INTEGER = IntInf.int;
=TEX
For $idiv$ and $imod$ we have to map the basis library exception
onto the {\Product} one.
=SML
	fun (x : INTEGER) ⦏idiv⦎ (y : INTEGER) : INTEGER = (
		x div y
		handle Div => fail "idiv" 1201 []
	);
	fun (x : INTEGER) ⦏imod⦎ (y : INTEGER) : INTEGER = (
		x mod y
		handle Div => fail "imod" 1201 []
	);
=TEX
The remaining operators really are just renamings of the
existing ones:
=SML
	val op ⦏@*⦎ : INTEGER * INTEGER -> INTEGER = IntInf.*;
	val op ⦏@+⦎ : INTEGER * INTEGER -> INTEGER = IntInf.+;
	val op ⦏@-⦎ : INTEGER * INTEGER -> INTEGER = IntInf.-;
	val op ⦏@~⦎ : INTEGER -> INTEGER = IntInf.~;
	val op ⦏iabs⦎ : INTEGER -> INTEGER = IntInf.abs;
	val op ⦏@<⦎ : INTEGER * INTEGER -> bool = IntInf.<;
	val op ⦏@>⦎ : INTEGER * INTEGER -> bool = IntInf.>;
	val op ⦏@<=⦎ : INTEGER * INTEGER -> bool = IntInf.<=;
	val op ⦏@>=⦎ : INTEGER * INTEGER -> bool = IntInf.>=;
=TEX
The interface to convert from a string requires a bit of glue
for the result value and error-handling.
=SML
	fun ⦏integer_of_string⦎ (s : string) : INTEGER = (
		case IntInf.fromString s of
			SOME x => x
		|	NONE =>
				if	s = ""
				then	fail "integer_of_string" 1202 []
				else	fail "integer_of_string" 1203 [fn _ =>s]
	);
	val @@ : string -> INTEGER = integer_of_string;
=TEX
The opposite conversion requires adjustment of the signs to our preferred
form.
=SML
	val zero = integer_of_string "0";
	fun ⦏string_of_integer⦎ (x : INTEGER) : string = (
		if	x @< zero
		then	"-" ^ string_of_integer (@~ x)
		else	IntInf.toString x
=SML
	);
=TEX
Conversion to ints requires glue for error-handling.
=SML
	fun ⦏int_of_integer⦎ (x : INTEGER) : int = (
		IntInf.toInt x
		handle Overflow => fail "int_of_integer" 1204 []
	);
=TEX
And again the opposite conversion is just a renaming:
=SML
	val ⦏integer_of_int⦎ : int -> INTEGER = IntInf.fromInt;
=TEX
The error path in the following is a bit odd for an empty string: we
call $fromString$ and let it fail.
=SML
	fun ⦏natural_of_string⦎ (s : string) : INTEGER = (
		if	s = "" orelse is_all_decimal s
		then
			case IntInf.fromString s of
				SOME x => x
			|	NONE => fail "natural_of_string" 1013 []
		else	fail "natural_of_string" 1012 [fn _ => s]
	);
=SML
	val ⦏one⦎ : INTEGER = @@"1";
=TEX
=SML
fun ⦏integer_order⦎ (i1 : INTEGER) (i2 : INTEGER) : int = (
	if	i1 = i2
	then	0
	else if	i1 @< i2
	then	~1
	else	1
);
=TEX
=SML
fun ⦏integer_interval⦎ (a : INTEGER) (b : INTEGER) : INTEGER list = (
	let	fun aux acc i = (
			if	i @< a
			then	acc
			else	aux (i :: acc) (i @- one)
		);
	in	aux [] b
	end
);
=TEX
=SML
fun ⦏string_of_float⦎ ((x, p, e): INTEGER * INTEGER * INTEGER) : string = (
	let	fun add_point acc [] 0 = ("0." ^ implode acc)
		|   add_point acc ds 0 = (implode (rev ds) ^ "." ^ implode acc)
		|   add_point acc [] i = add_point ("0"::acc) [] (i-1)
		|   add_point acc (d::ds) i = add_point (d::acc) ds (i-1);
		val (ip, overflow) = (int_of_integer p, false)
			handle Fail _ => (0, true);
	in	if	x @< zero
		orelse	p @< zero
		orelse	overflow
		then	let	val xs = if x @< zero
					then "~" ^ string_of_integer (@~x)
					else string_of_integer x;
				val ps = if p @< zero
					then "~" ^ string_of_integer (@~p)
					else string_of_integer p;
				val es = if e @< zero
					then "~" ^ string_of_integer (@~e)
					else string_of_integer e;
			in	"Float (" ^ xs ^ ")(" ^ ps ^ ")(" ^ es ^ ")"
			end
		else	let	val xs = string_of_integer x;
				val es = if e = zero
					then ""
					else if e @< zero
					then "e~" ^ string_of_integer (@~e)
					else "e" ^ string_of_integer e;
				val xr = rev(explode xs);
			in	add_point [] xr ip ^ es
			end
	end
);
=TEX
=SML
end (* of structure Integer *);
=TEX
=SML
open Integer;
=MLTON
end of code commented out for MLton *)
=TEX
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}



=IGN
********************************************************************************
dtd009.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  ℤc
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

\def\Title{Detailed Design for Tactics I}

\def\AbstractText{This document gives a detailed design for the first group of tactics and tacticals in ICL HOL.}

\def\Reference{DS/FMU/IED/DTD009}

\def\Author{R.D. Arthan,   K. Blackburn}


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
%% LaTeX2e port: \TPPtitle{Detailed Design for Tactics I}
%% LaTeX2e port: \TPPref{DS/FMU/IED/DTD009}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.30 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2002/10/17 15:10:58 $%
%% LaTeX2e port: }}  %% Mandatory field
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{Design}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthors{R.D.~Arthan & WIN01 \\ K.~Blackburn & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document gives a detailed design for the
%% LaTeX2e port: first group of tactics and tacticals in ICL HOL.}
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
\item [Issue 1.1 (1991/03/25)]
First version.
\item [Issue 1.7 (1991/06/21)]
Draft issue for comment after shipping out less basic material to
\cite{DS/FMU/IED/DTD028} and adding treatment of theorem tacticals etc.
\item [Issue 1.8 (1991/06/27)]
$always\_tac$ and $always\_ttcl$ renamed to $id\_tac$ and $id\_ttcl$.
\item [Issue 1.10 (1991/07/01)]
Rework after comments received. $FAIL\_THEN$ etc. now name to follow
stated conventions. $COND\_T$, $REPEAT\_UNTIL1$, $SOLVED\_T$ and indexing
of assumption lists added.
\item [Issue 1.15 (1991/09/25)]
Improved error messages 9400 and 9102.
\item [Issue 1.16 (1991/10/30)]
Changes in response to deskcheck ID0028.
Added list versions of, e.g., $DROP\_ASM\_T$.

\item[Issue 1.17 (1992/01/20), \FormatDate{92/01/20} ] Updated to use new fonts.
Improved message 9504.
\item [Issue 1.18 (1992/02/12)]
Minor corrections.
\item [Issue 1.19 (1992/02/17)]
Corrected $FAIL\_THEN$, etc.
\item [Issue 1.20 (1992/03/18)(12th March 1992)] Various minor additions and extensions.
\item [Issue 1.21 (1992/03/30) (30th March 1992)]
Added $GET/DROP\_FILTER\_ASMS\_T$.
\item [Issue 1.22 (1992/04/14) (13th April 1992)]
Changes due to CR0017.
\item[Issue 1.23 (1992/05/14) (14 May 1992)] Use correct quotation symbols.
\item[Issue 1.25 (1992/08/20) (20th August 1992)]
Corrections to text.
\item[Issue 1.26 (1992/09/07) (7th September 1992)]
Replaced mentions of $always\_tac$ with $id\_tac$.
\item[Issue 1.27 (1993/08/12) (12th August 1993)]
Addition of $discard\_tac$,.
\item[Issue 1.28 (1993/08/17) (17th August 1993)]
Bug fixingin $discard\_tac$, addition of $k\_id\_tac$, $TRY$.
\item[Issue 1.29 (1996/01/29) (29th January 1996)]
Reinserted SCCS keywords.
\item[Issue 1.30 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.31 (2002/10/17)] PPHol-specific updates for open source release
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
When more advanced tactics have been coded, there may well be a requirement
for more (or different) utilities.
\pagebreak
\section{GENERAL}
\subsection{Scope}
This document contains a detailed design for the first group of tactics
and tacticals.
This is called for in \cite{DS/FMU/IED/HLD009}.
The design is implemented in \cite{DS/FMU/IED/IMP009}.
\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains a detailed design for the
first group of tactics and tacticals for ICL HOL.
This first group is mainly concerned with supplying facilities
for constructing the tactics which the interactive user uses.

\subsubsection{Dependencies}
This document depends on the type definitions in \cite{DS/FMU/IED/DTD006}.
The implementation is dependent on the derived rules of
inference in \cite{DS/FMU/IED/IMP007}.

\subsubsection{Deficiencies}
None known.

\subsubsection{Terminology}
A {\em tactic} is a function which attempts to prove a goal. Here a {\em goal} is
just a sequent. Given a goal of a form which it finds acceptable, a tactic
returns a list of new goals (often referred to as
the {\em subgoals}), together with a {\em proof}, i.e. a function
value which given theorems achieving the subgoals can compute a theorem
matching the original goal. Here, roughly speaking,
a theorem, $\Gamma⊢t$, {\em achieves} a goal, $gl$,
iff. $gl = (\Gamma, t)$ (see section \ref{OnUsingTactics} below for
more information).

A {\em tactical} is a function which composes one or more tactics and perhaps
parameters of other types in
some way (e.g. by repetition until failure) to produce a new tactic.
A {\em tactic generating function} is used for any function which computes
a tactic.

By a minor abuse of terminology the term tactic is frequently used to
describe a function which takes one or more arguments which are not tactics
and computes a tactic.
A very common form of tactic in this broader sense is a
{\em theorem tactic}, i.e., a function which takes a theorem and returns
a tactic.
{\em Theorem tacticals} are functions which compose one or more
theorem tactics in some way to produce a new theorem tactic.
{\em Theorem tactical combinators} are functions which produce
new theorem tacticals from old.

\pagebreak
\section{GENERAL REMARKS}

\subsection{Naming and Type Conventions}

We adopt the following clarifications/extensions of
the naming conventions given in \cite{DS/FMU/IED/DEF003}

\begin{tabular}{|l|l|l|}\hline
Object & Suffix & Type\\\hline
tactic & $\_tac$ &
$[ty →]TACTIC$
\\\hline
theorem tactic & $\_tac$ &
$[ty →]THM → TACTIC$
\\\hline
tactical & $\_T$ &
$ty(TACTIC) → TACTIC$
\\\hline
theorem tactical & $\_THEN$ &
$ty(THM → TACTIC) → THM → TACTIC$
\\\hline
theorem tactical combinator & $\_TTCL$ &
$ty((THM → TACTIC) → (THM → TACTIC)) →$ \\
& & $\ \ \ \ \ \ (THM → TACTIC) → (THM → TACTIC)$
\\\hline
\end{tabular}

where $ty$ denotes a Standard ML type expression, where $[ ...]$ indicates
a part of the type which may be omitted, and where we assume that
the type abbreviations $THM\_TACTIC$ and $THM\_TACTICAL$ defined in
section \ref{TYPEABBREVIATIONS} below have been expanded.
Note that an object of type $\scriptscriptstyle ty(TACTIC) → THM → TACTIC$ is to be named
as a tactical (rather than a theorem tactic)
if it is not a theorem tactical.

It should be noted that the type
abbreviations $THM\_TACTIC$ and $THM\_TACTICAL$ are not
generally used in the type constraints for particular theorem tactics
or theorem tactical combinators. This is because it is felt more helpful
to the less experienced user to be told, for example, that $asm\_tac$
has type $THM → TACTIC$, rather than having to learn that there is
a type abbreviation $THM\_TACTIC$ for this type.
On the other hand, to make the types more memorable for the experienced
user, the type abbreviations are used to constrain the types of such
things as theorem tactical combinators (such as $THEN\_TTCL$).
The decision whether to use the type abbreviations or not is largely
a matter of taste.

\subsection{On Using Tactics}\label{OnUsingTactics}
In the previous section we said that a theorem $\Gamma⊢t$,
achieves a goal, $gl$, iff. $gl = (\Gamma, t)$. In fact, there would be
a significant performance cost if tactics were required to achieve goals
in this strict sense. Instead, the theorem, $\Gamma⊢t$, is actually taken to
achieve a goal, $(asms, conc)$, if $\Gamma\subseteq asms$ and $t = conc$
modulo $\alpha$-conversion. Thus, the theorem proved by a tactic
applied to a given goal may require a certain amount of additional inferences
($\alpha$-conversions and addition of assumptions) to give a theorem which
achieves the goal in the strict sense.

Both the subgoal package and
the utility $tac\_proof$ (which is used to do non-interactive proofs with tactics) take
the necessary measures to give the user the theorem he asked for.

\subsection{Treatment of Assumptions}\label{TreatmentofAssumptions}

The general policy to be adopted in tactics which add new assumptions is
that the new assumptions are always to be added at the head of the list
even if this gives rise to duplicated assumptions (modulo $\alpha$-convertibility).
This helps the interactive user manage the assumption list as a stack or an array
without having to predict the effect of a given tactic.
Tactics should not assume
that the assumptions in a goal are all distinct,
e.g. tactics which remove assumptions
should remove all instances of the assumptions to be removed.

Some tacticals must assume that their tactic arguments generate proofs which
are not sensitive to the presence of additional assumptions in the theorems
presented to them as arguments. All proofs generated by ICL-supplied tactics
will have this property (which is easily effected by avoiding use of rules
which do global operations on the assumption lists).

\subsection{Use of Theorems by Tactics}
Many tactics use theorems (supplied as, or computed by, their arguments).
There is an issue as to what one should do with the assumptions of such
theorems.

At first glance, one would imagine that any assumptions in the theorem
which are not also in the goal should be set as additional subgoals.
This convention would work nicely in circumstances where the theorem had
been proved indepently of the goal in question.

However, what frequently happens, e.g. with $POP\_ASM\_T$, is that a theorem, say $thm$,
is made by applying $asm\_rule$ to an assumption, $asm$ say. The assumption is then
removed from the goal, and the resulting goal is attacked with $ttac\,thm$ where
$ttac$ is some theorem tactic. In such usage, what is being assumed is that
$ttac$ will produce a `proof' of the intermediate goal which may actually
introduce $asm$ as an additional assumption, but that this will not matter
since the original goal did indeed have such an assumption.
This approach is not compatible with the convention mentioned in the
previous paragraph.

The tactics and tacticals supplied are therefore designed on the assumption
that there calling environment will make any necessary checks on the applicability
of theorems supplied by the user. $tac\_proof$ is a very simple example
of such an environment, which will simply fail if essential use is made of
a theorem with an unwarranted assumption.
The subgoal package (see \cite{DS/FMU/IED/DTD030}), which
gives an interactive environment for developing proofs using tactics,
causes any extra assumptions to be set as additional subgoals.

\section{INFIX DIRECTIVES}
A Standard ML $infix$ directive must be given at the ``top level''.
Thus we give the directives here for those functions declared in the following signatures.
=SML
infix 4 THEN_T;
infix 4 THEN;
infix 4 THEN_LIST_T;
infix 4 THEN_LIST;
infix 4 THEN_TRY_T;
infix 4 THEN_TRY;
infix 4 THEN_TRY_LIST_T;
infix 4 THEN_TRY_LIST;
infix 4 ORELSE_T;
infix 4 ORELSE;
infix 4 THEN_TTCL;
infix 4 THEN_TRY_TTCL;
infix 4 ORELSE_TTCL;
=TEX
\section{PREAMBLE}
=DOC
signature ⦏Tactics1⦎ = sig
=DESCRIBE
This provides the first group of tactics and tacticals in ICL HOL.
=ENDDOC
\section{UTILITIES}
This document exports several utilities which are of use in constructing other
tactics:
=DOC
val ⦏map_shape⦎ : (('a list -> 'b) * int) list -> 'a list -> 'b list
=DESCRIBE
$map\-\_shape$ is a means of composing functions on lists.
It is intended for composing the proofs produced by tactics
in tacticals such as $THEN$.
Its effect is as follows:
=GFT
		map_shape [(f1, n1), (f2, n2)... ] [a1, a2, ...]
	=	[f1[a1, ..., a(n1)], f2[a(n1+1), ..., a(n1+n2)], ...]
=TEX
where, if there are not enough $a_i$, then unused $f_j$ are ignored and the
last $f_j$ to be used may receive less than $n_j$ elements in its argument.
(This case is not expected to occur in the application of $map\_shape$
in tactic programming.)
=USES
Specialised low-level tactic programming.
=ENDDOC
=DOC
val ⦏bad_proof⦎ : string -> 'a
=DESCRIBE
$bad\_proof\,name$ is equivalent to $error\,name\,9001\,[]$.
$bad\_proof$ is for use in low level tactical programming to report
the error situation when the proof generated by a tactic is supplied with
the wrong number of arguments.
(This will not happen for the usual use of tactics with $tac\_proof$ or
within the subgoal package):

=FAILURE
9001	the proof of the subgoals has produced the wrong number of theorems
=USES
Specialised low-level tactic programming.
=ENDDOC

\section{TYPE ABBREVIATIONS}\label{TYPEABBREVIATIONS}
=DOC
type ⦏GOAL⦎		(*	=	SEQ	*);
type ⦏PROOF⦎		(*	=	THM list -> THM *);
type ⦏TACTIC⦎		(*	=	GOAL -> (GOAL list * PROOF) *);
=DESCRIBE
$TACTIC$ is the type of tactics.
The types $GOAL$ and $PROOF$ help to abbreviate its definition.
=ENDDOC
=DOC
type ⦏THM_TACTIC⦎		(*	= THM -> TACTIC			*);

type ⦏THM_TACTICAL⦎	(*	= THM_TACTIC -> THM_TACTIC	*);
=DESCRIBE
These are the types of theorem tactics and theorem tacticals.
=ENDDOC
\section{ELEMENTARY TACTICALS}
In this section we define the most commonly used functions for composing
tactics.

(Errors in this section begin with 91.)
=DOC
val ⦏THEN_T⦎ : (TACTIC * TACTIC) -> TACTIC;
val ⦏THEN⦎ : (TACTIC * TACTIC) -> TACTIC;
=DESCRIBE
$THEN\_T$ is a tactical used as an infix operator.
$tac1$ $THEN\_T$ $tac2$ is the tactic that applies $tac1$
and then applies $tac2$ to each resulting subgoal (perhaps none).
$THEN$ is an alias for $THEN\_T$.
=FAILUREC
\paragraph{Errors}
As the errors of $tac1$ and $tac2$.
=ENDDOC
($THEN$ in Cambridge HOL)
=DOC
val ⦏THEN_TRY_T⦎ : (TACTIC * TACTIC) -> TACTIC;
val ⦏THEN_TRY⦎ : (TACTIC * TACTIC) -> TACTIC;
=DESCRIBE
$THEN\_TRY\_T$ is a tactical used as an infix operator.
$tac1$ $THEN\_TRY\_T$ $tac2$ is the tactic that applies $tac1$
and then attempts to apply $tac2$ to each resulting subgoal (perhaps none).
If $tac2$ fails on any particular subgoal then that subgoal will be unchanged from the result of $tac1$.
If $tac1$ fails then the overall tactic fails.
$THEN\_TRY$ is an alias for $THEN\_TRY\_T$.
=FAILUREC
\paragraph{Errors}
As the errors of $tac1$.
=ENDDOC
=DOC
val ⦏EVERY_T⦎ : TACTIC list -> TACTIC;
val ⦏EVERY⦎ : TACTIC list -> TACTIC;
=DESCRIBE
$EVERY\_T$ $tlist$ is a tactic that applies the head of $tlist$ to its subgoal, and
recursively applies the tail of $tlist$ to each resulting subgoal.
$EVERY$ is an alias for $EVERY\_T$.
$EVERY$ $[]$ is equal to $id\_tac$.
=EXAMPLE
=GFT
EVERY [∀_tac, ∧_tac, ∀_tac]
	is equivalent to
∀_tac THEN ∧_tac THEN ∀_tac
=TEX
=FAILUREC
\paragraph{Errors}
As for the tactics in the list.
=ENDDOC
=DOC
val ⦏THEN_LIST_T⦎ : (TACTIC * TACTIC list) -> TACTIC;
val ⦏THEN_LIST⦎ : (TACTIC * TACTIC list) -> TACTIC;
=DESCRIBE
$THEN\_LIST\_T$ is a tactical used as an infix operator.
$tac$ $THEN\_LIST\_T$ $tlist$ is a tactic that applies $tac$, and
then applies the first member of $tlist$ to the first resulting subgoal, the second to the second, etc.
If there are not the correct number of tactics in the list then an error will be raised.
$THEN\_LIST$ is an alias for $THEN\_LIST\_T$.
=FAILURE
9101	number of tactics must equal the number of subgoals
=FAILUREC
As failures of the initial tactic or the tactics in the list.
=ENDDOC
($THENL$ in Cambridge HOL)
This could instead give a warning if the number of subgoals and
tactics differ, using $id\_tac$ if there is no corresponding tactic,
and ignoring excess tactics.
=DOC
val ⦏THEN_TRY_LIST_T⦎ : (TACTIC * TACTIC list) -> TACTIC;
val ⦏THEN_TRY_LIST⦎ : (TACTIC * TACTIC list) -> TACTIC;
=DESCRIBE
$THEN\_TRY\_LIST\_T$ is a tactical used as an infix operator.
$tac$ $THEN\-\_TRY\-\_LIST\-\_T$ $tlist$ is a tactic that applies $tac$, and
then attempts to apply the first member of $tlist$ to the first resulting subgoal, the second to the second, etc.
If there are not the correct number of tactics in the list then an error will be raised.
If any member of $tlist$ fails on a particular subgoal,
then that subgoal is returned unchanged.
$THEN\_LIST$ is an alias for $THEN\_LIST\_T$.
=FAILURE
9101	number of tactics must equal the number of subgoals
=FAILUREC
As failures of the initial tactic.
=ENDDOC

=DOC
val ⦏MAP_EVERY_T⦎ : ( 'a -> TACTIC) -> 'a list -> TACTIC;
val ⦏MAP_EVERY⦎ : ( 'a -> TACTIC) -> 'a list -> TACTIC;
=DESCRIBE
$MAP\_EVERY\_T$ $mapf$ $alist$ maps $mapf$ over $alist$,
and then applies the resulting list of tactics to the goal
in sequence (in the same manner as $EVERY$, q.v.).
$MAP\_EVERY$ is an alias for $MAP\_EVERY\_T$.
=FAILUREC
\paragraph{Errors}
As the individual items generated by mapping the tactic over the
list.
=ENDDOC

=DOC
val ⦏ORELSE_T⦎ : (TACTIC * TACTIC) -> TACTIC;
val ⦏ORELSE⦎ : (TACTIC * TACTIC) -> TACTIC;
=DESCRIBE
$ORELSE\_T$ is a tactical used as an infix operator.
$tac1$ $ORELSE\_T$ $tac2$ is a tactic which behaves as $tac1$ unless
application of $tac1$ fails, in which case it behaves as $tac2$.
$ORELSE$ is an alias for $ORELSE\_T$
=SEEALSO
$LIST\_ORELSE\_T$
=FAILUREC
\paragraph{Errors}
As the failure of $tac2$.
=ENDDOC
=DOC
val ⦏FIRST_T⦎ : TACTIC list -> TACTIC;
val ⦏FIRST⦎ : TACTIC list -> TACTIC;
=DESCRIBE
$FIRST\_T$ $tlist$ is a tactic that attempts to apply each tactics in $tlist$ until one succeeds, or all fail.
The first successful application will be the result of the tactic,
and it fails if all the attempts fail.
$FIRST$ is an alias for $FIRST\_T$.
$FIRST$ $[]$ fails on being applied to any goal.
=FAILURE
9105	the list of tactics is empty
=FAILUREC
Also as the failure of last member of a non-empty list.
=ENDDOC
($FIRST$ in Cambridge HOL)
=DOC
val ⦏MAP_FIRST_T⦎ : ('a -> TACTIC) -> 'a list -> TACTIC;
val ⦏MAP_FIRST⦎ : ('a -> TACTIC) -> 'a list -> TACTIC;
=DESCRIBE
$MAP\_FIRST\_T$ $mapf$ $alist$ maps $mapf$ over $alist$,
and then attempts to apply each resulting tactic in order, until
one succeeds or all fail
(in the same manner as $FIRST$, q.v.).
$MAP\_FIRST$ is an alias for $MAP\_FIRST\_T$.
=FAILUREC
\paragraph{Errors}
As the last tactic.
=ENDDOC
($MAP\_FIRST$ in Cambridge HOL)

=DOC
val ⦏COND_T⦎ : (GOAL -> bool) -> TACTIC -> TACTIC -> TACTIC;
=DESCRIBE
$COND\_T\,p\,tac1\,tac2$
is a tactic which acts as $tac1$ if the
predicate $p$ holds for the goal, otherwise it acts as $tac2$.
=EXAMPLE
COND_T (is_¬ o snd) (cases_tac ⌜X:BOOL⌝) strip_tac
=TEX
is a tactic which does a case split on ⌜X⌝ if the goal is a negation
and behaves as $strip\_tac$ otherwise.
=USES
For constructing larger tactics, in cases where the more common
idiom using $ORELSE$ would not have the desired effect.
=SEEALSO
$ORELSE$
=FAILUREC

\paragraph{Errors}
As determined by the arguments.
=ENDDOC

=DOC
val ⦏REPEAT_T⦎ : TACTIC -> TACTIC;
val ⦏REPEAT⦎ : TACTIC -> TACTIC;
=DESCRIBE
$REPEAT\_T$ is a tactical which repeatedly applies its tactic argument
until it fails.
This may cause an infinite loop of evaluation, or even no change,
if the tactic fails on the first application.
$REPEAT$ is an alias for $REPEAT\_T$.
=ENDDOC
($REPEAT$ in Cambridge HOL)
=DOC
val ⦏REPEAT_N_T⦎ : int -> TACTIC -> TACTIC;
val ⦏REPEAT_N⦎ : int -> TACTIC -> TACTIC;
=DESCRIBE
$REPEAT\_N\_T\,n$ is a tactical which repeatedly applies its tactic argument
$n$ times. Unlike $REPEAT$ it fails if the tactic fails.
If $n$ is not greater than 0 then $REPEAT\_N\_T\,n\,tac$ is a tactic which
has no effect.

$REPEAT\_N$ is an alias for $REPEAT\_N\_T$.
=FAILUREC
\paragraph{Errors} As for the tactic being repeated.
=ENDDOC

=DOC
val ⦏REPEAT_UNTIL_T⦎ : (TERM -> bool) -> TACTIC -> TACTIC;
val ⦏REPEAT_UNTIL⦎ : (TERM -> bool) -> TACTIC -> TACTIC;
=DESCRIBE
$REPEAT\_UNTIL1\_T\,p\,tac$ is a tactical which repeatedly applies its $tac$
until all outstanding subgoals either have conclusions
which satisfy the predicate $p$ or cause
$tac$ to fail.

If the conclusion
of the goal already satisfies $p$, then $REPEAT\_UNTIL1\_T1\,p\,tac$ is a tactic
which has no effect.


$REPEAT\_UNTIL$ is an alias for $REPEAT\_UNTIL\_T$.
=EXAMPLE
REPEAT_UNTIL is_or strip_tac
=TEX
will repeatedly apply $strip\_tac$ until all outstanding subgoals have
disjunctive conclusions or cause $strip\_tac$ to fail.
=ENDDOC

=DOC
val ⦏REPEAT_UNTIL_T1⦎ : (GOAL -> bool) -> TACTIC -> TACTIC;
val ⦏REPEAT_UNTIL1⦎ : (GOAL -> bool) -> TACTIC -> TACTIC;
=DESCRIBE
$REPEAT\_UNTIL1\_T1\,p\,tac$ is a tactical which repeatedly applies its $tac$
until all outstanding subgoals either satisfy the predicate $p$ or cause
$tac$ to fail.

If the goal already satisfies $p$, then $REPEAT\_UNTIL1\_T1\,p\,tac$ is a tactic
which has no effect.


$REPEAT\_UNTIL1$ is an alias for $REPEAT\_UNTIL1\_T1$.
=EXAMPLE
REPEAT_UNTIL1 (is_or o snd) strip_tac
=TEX
will repeatedly apply $strip\_tac$ until all outstanding subgoals have
disjunctive conclusions or cause $strip\_tac$ to fail.
=ENDDOC

=TEX
\section{BASIC THEOREM TACTICALS AND COMBINATORS}
(Errors in this section begin with 94.)
=DOC
val ⦏THEN_TTCL⦎ : (THM_TACTICAL * THM_TACTICAL) -> THM_TACTICAL;
=DESCRIBE
$THEN\_TTCL$ is a theorem tactical combinator. It is an infix operator
which composes two theorem tacticals using ordinary function composition:
=GFT
(tcl1 THEN_TTCL tcl2) thmtac thm = (tcl1 o tcl2) thmtac thm
=TEX

=USES
For use in programming theorem tacticals.
=ENDDOC
=DOC
val ⦏THEN_TRY_TTCL⦎ : (THM_TACTICAL * THM_TACTICAL) ->
	THM_TACTICAL;
=DESCRIBE
$THEN\_TRY\_TTCL$ is a theorem tactical combinator. It is an infix operator
which applies the first theorem tactical, and then, if it
succeeds, the second theorem tactical, using only
the first result if the second fails.
=USES
For use in programming theorem tacticals.
=ENDDOC
=DOC
val ⦏ORELSE_TTCL⦎ : (THM_TACTICAL * THM_TACTICAL) -> THM_TACTICAL;
=DESCRIBE
$ORELSE\_TTCL$ is a theorem tactical combinator. It is an infix operator.
$(tcl1\,ORELSE\_TTCL\,tcl2)th$ is $tcl1\,th$ unless evaluation of
$tcl1\,th$ fails, in which case it is $tcl2\,th$.
=USES
For use in programming theorem tacticals.
=ENDDOC
=DOC
val ⦏ID_THEN⦎ : THM_TACTICAL;
=DESCRIBE
This is the identity for the theorem tactical combinator $THEN\_TTCL$.
=GFT
(ID_THEN) thmtac = thmtac
=TEX
=USES
For use in programming theorem tacticals.
=ENDDOC
=DOC
val ⦏CONV_THEN⦎ : CONV -> THM_TACTICAL;
=DESCRIBE
$CONV\_THEN\,conv\,thmtac$ is a theorem tactic which first uses $conv$ to
transform the conclusion of a theorem and then acts as $thmtac$.
=GFT
(CONV_THEN) conv thmtac thm = thmtac (conv thm)
=TEX
=USES
For use in programming theorem tacticals.
The function may be partially evaluated with only its
conversion, theorem tactic and theorem arguments.
=FAILURE
9400	the conversion returned `?0` which is not of the form:
	`... ⊢ ?1 ⇔ ...`
=ENDDOC
=DOC
val ⦏FAIL_THEN⦎ : THM_TACTICAL;
=DESCRIBE
This is a theorem tactical which always fails at the point it receives its theorem (having already been given a theorem tactic). It acts as the identity
for the theorem tactical combinator $ORELSE\_TTCL$.
=USES
For use in programming theorem tacticals.
=FAILURE
9401	failed as requested
=ENDDOC
=DOC
val ⦏FAIL_WITH_THEN⦎ : string -> int -> (unit -> string) list -> THM_TACTICAL;
=DESCRIBE
$FAIL\_WITH\_THEN\,area\,msg\,inserts$
is a theorem tactical that always fails when given its theorem (having already been given a theorem tactic), reporting an error message via the
call $fail\,area\,msg\,inserts$.
=USES
For constructing larger theorem tacticals.
=SEEALSO
$fail$
=FAILUREC
\paragraph{Errors}
As determined by the arguments.
=ENDDOC
=DOC
val ⦏REPEAT_TTCL⦎ : THM_TACTICAL -> THM_TACTICAL;
=DESCRIBE
$REPEAT\_TTCL\,ttcl$ is a theorem tactical which applies $ttcl$
repeatedly until it fails.
=USES
For use in programming theorem tacticals.
=FAILUREC
As for the argument theorem tactic.
=ENDDOC
=DOC
val ⦏TRY_TTCL⦎ : THM_TACTICAL -> THM_TACTICAL;
=DESCRIBE
$TRY\_TTCL\,ttcl$ is a theorem tactical which applies $ttcl$
if it can, and otherwise acts as $ID\_THEN$.
=USES
For use in programming theorem tacticals.
=ENDDOC
=DOC
val ⦏EVERY_TTCL⦎ : THM_TACTICAL list -> THM_TACTICAL;
=DESCRIBE
$EVERY\_TTCL$ is a theorem tactical combinator.
=GFT
EVERY_TTCL [ttcl1, ttcl2, ...] = ttcl1 THEN_TTCL ttcl2 THEN_TTCL ...
=TEX
$EVERY\_TTCL\ []$ acts as $ID\_THEN$.
=USES
For use in programming theorem tacticals.
=ENDDOC
=DOC
val ⦏FIRST_TTCL⦎ : THM_TACTICAL list -> THM_TACTICAL;
=DESCRIBE
$FIRST\_TTCL$ is a theorem tactical combinator.
$FIRST\_TTCL$ $[]$ fails on being applied to its theorem tactic
and then theorem.
=GFT
FIRST_TTCL [ttcl1, ttcl2, ...] =
	ttcl1 ORELSE_TTCL ttcl2 ORELSE_TTCL ...
=TEX
=USES
For use in programming theorem tacticals.
=FAILURE
9402	the list of theorem tactics is empty
=ENDDOC
\section{BASIC TACTICS}
(Errors in this section begin with 92.)
=DOC
val ⦏id_tac⦎ : TACTIC;
=DESCRIBE
A tactic that always succeeds, having no effect.
This is the identity for the tactical $THEN\_T$.
=FRULE 2 Tactic
id_tac
├
{ Γ } t
├
{ Γ } t
=TEX
=USES
For constructing larger tactics.
=ENDDOC
($ALL\_TAC$ in Cambridge HOL)
=DOC
val ⦏discard_tac⦎ : 'a -> TACTIC;
val ⦏k_id_tac⦎ : 'a -> TACTIC;
=DESCRIBE
A tactic that discards its argument, but otherwise has no effect.
$k\_id\_tac$ is an alias for $discard\_tac$.
=USES
Can be used to remove unwanted assumptions : $a$ $(POP\_ASM\_T$ $discard\_tac)$
discards the top-most assumption.  This usage of $discard\_tac$ may
strengthen the goal.  ie it may result in unprovable subgoals even when the
original goal was provable.
=ENDDOC

=DOC
val ⦏fail_tac⦎ : TACTIC;
=DESCRIBE
A tactic that always fails.
This is the identity for the tactical $ORELSE\_T$
=USES
For constructing larger tactics.
=FAILURE
9201	failed as requested
=ENDDOC
($NO\_TAC$ in Cambridge HOL)

=DOC
val ⦏fail_with_tac⦎ : string -> int -> (unit -> string) list -> TACTIC;
=DESCRIBE
$fail\_with\_tac\,area\,msg\,inserts$
is a tactic that always fails, reporting an error message via the
call $fail\,area\,msg\,inserts$.
=USES
For constructing larger tactics.
=SEEALSO
$fail$
=FAILUREC
\paragraph{Errors}
As determined by the arguments.
=ENDDOC


($FAIL\_TAC$ in Cambridge HOL.)

=DOC
val ⦏accept_tac⦎ : THM -> TACTIC;
=DESCRIBE
Prove a goal by a theorem which is $\alpha$-convertible to it.
=FRULE 2 Tactic
accept_tac
Γ1 ⊢ t1
├
{ Γ2 } t2
├
=TEX
where $t1$ and $t2$ are $\alpha$-convertible.
=FAILURE
9102	?0 is not α-convertible to the goals conclusion ?1
=ENDDOC

=DOC
val ⦏asm_tac⦎ : THM -> TACTIC;
=DESCRIBE
$asm\_tac\,thm$ is a tactic which adds the conclusion of the theorem, $thm$,
into the assumptions of a goal:
=FRULE 2 Tactic
asm_tac
Γ1 ⊢ t1
├
{ Γ2 } t2
├
{ t1, Γ2 } t2
=TEX
=ENDDOC

=DOC
val ⦏conv_tac⦎ : CONV -> TACTIC;
=DESCRIBE
$conv\_tac\,conv$ is a tactic which applies the conversion $conv$ to the
conclusion of a goal, and replaces
the conclusion of the goal with the right-hand side of the resulting
equational theorem if this is successful:
=FRULE 2 Tactic
asm_tac conv
├
{ Γ2 } t2
├
{ Γ2 } t1
=TEX
where $conv\,t2 = (Γ1 ⊢t2 = t1)$.
=FAILURE
9400	the conversion returned `?0` which is not of the form:
	`... ⊢ ?1 ⇔ ...`
=ENDDOC

=DOC
val ⦏rename_tac⦎ : (TERM * string)list -> TACTIC;
=DESCRIBE
$rename\_tac$ renames variables (bound or free) in a goal.
It is typically used when a goal contains several variables with
the same name or to introduce names which are better mnemonics.
For the latter purpose,
the argument controls the algorithm used to
make variants of the names.

The renaming affects both the conclusions and the assumptions of the goal.
Variables are renamed to ensure that the new goal
satisfies the following conditions:
\begin{itemize}
\item
No two free variables with different types have the same name.
\item
No bound variable has the same name as a free variable or a variable
which is bound in an outer scope.
\item
No variable shall have the same name as any constant in scope.
\end{itemize}


Before a variable is checked,
it is looked up in the $renaming$ association list,
and if present it is treated as if
the name were the corresponding string.
The function $variant$, q.v., is used to rename variables.


The function may be partially evaluated with only the renamings argument.

Note that applying the tactic in the subgoal package will give rise to the message
``The subgoal $<$label$>$ is $α$-convertible to its goal''.

For example,
{\FruleLeftJustify\tabstop=0.4in
=FRULE 2 Tactic
rename_tac
[(⌜j:ℕ×ℕ⌝,"apple"),
 (⌜j:ℕ⌝, "banana"),
 (⌜k:ℕ⌝, "carrot")]
├
	{ k = 1 }
	(∀ i:ℕ×ℕ⦁ ∃i:ℕ⦁i = 0)
	∧ (∀ j:ℕ×ℕ
 	 ⦁ (∃k:ℕ⦁k = Fst j)
 	    ∧ ∀j:ℕ⦁j = k)
├
	{ apple = 1 }
	(∀ i⦁ ∃ i'⦁ i' = 0)
	∧ (∀ apple
	   ⦁ (∃ carrot'⦁ carrot' = Fst apple)
	      ∧ ∀ banana⦁ banana = carrot)
=TEX
}
=USES
In clarifying goals where the variable names clash or are
unparseable or are inconvenient.
=FAILURE
3007	?0 is not a term variable
=FAILUREC
=ENDDOC
\section{BASIC TACTICALS}

\subsection{Using Assumptions}
(Errors in this section begin with 93.)

We supply tacticals which give the user several ways of
using assumptions as arguments to tactic generating functions.
The options are which assumptions to select and whether or not
the assumptions are to be removed from or left in the assumption list.
The combinations are then as shown in the following table:

\begin{tabular}{|l|l|l|}\hline
			& Remove Asms			& Leave Asms.
\\\hline
Select Given Asm.	& $DROP\_ASM\_T$		& $GET\_ASM\_T$
\\\hline
Select List of Given Asm.	& $LIST\_DROP\_ASM\_T$		& $LIST\_GET\_ASM\_T$
\\\hline
Select Top Asm.		& $POP\_ASM\_T$			& $TOP\_ASM\_T$
\\\hline
Select All Asms.	& $DROP\_ASMS\_T$			& $GET\_ASMS\_T$
\\\hline
Select $n-th$ Asm.	& $DROP\_NTH\_ASM\_T$		& $GET\_NTH\_ASM\_T$
\\\hline
Select $m,n,p,...$ Asm.	& $LIST\_DROP\_NTH\_ASM\_T$		& $LIST\_GET\_NTH\_ASM\_T$\\\hline
\end{tabular}

Note the following:

\begin{enumerate}

\item
The tactic generating function
supplied as an argument to the tactical may
elect to remove assumptions of its own accord --- the above table refers
to the assumptions passed to the tactic generating function.

\item
In accordance with section \ref{TreatmentofAssumptions}
above, the functions which remove assumptions work modulo $\alpha$convertibility.

\item
The functions which work with indexed assumptions are to number the assumptions
$1, 2, \ldots$. Thus, for example, $POP\_ASM\_T$ is the same
as $DROP\_NTH\_ASM\_T\,1$.
\item
Other options, e.g., selection of a subset of the assumptions satisfying
a given condition, may be coded in terms of $GET\_ASMS\_T$
or $DROP\_ASMS\_T$ by applying a tactic
generating function with an appropriate filtering action.
\item
The assumption or assumptions selected by these functions are passed to the
tactic generating functions as theorems (which is what is required in the
most common modes of use). $dest\_thm$ may be used if the
tactic generating function works with terms.
\end{enumerate}

=DOC
val ⦏GET_ASM_T⦎ : TERM -> (THM -> TACTIC) -> TACTIC;
=DESCRIBE
$GET\_ASM\_T$ $asm$ $thmtac$ is a tactic which checks that $asm$
is in the assumption list and then acts as  $thmtac(asm ⊢ asm)$.
=FRULE 2 Tactic
GET_ASM_T
⌜asm⌝
thmtac
├
{ Γ, asm' } t
├
thmtac (asm ⊢ asm) ({ Γ, asm' } t)
=TEX
where $asm$ and $asm'$ are $\alpha$-convertible.
=USES
To use an assumption as a theorem
=FAILURE
9301	the term ?0 is not in the assumption list
=ENDDOC
=DOC
val ⦏LIST_GET_ASM_T⦎ : TERM list -> (THM list -> TACTIC) -> TACTIC;
=DESCRIBE
$LIST\_GET\_ASM\_T$ $[asm_1,asm_2,...]$ $thmtac$ is a tactic which checks that all the $asm_1,asm_2,...$
are in the assumption list and then acts as
\[thmtac[(asm_1 ⊢ asm_1),(asm_2 ⊢ asm_2),...]\]
=FRULE 2 Tactic
LIST_GET_ASM_T
[⌜asm1⌝,...]
thmtac
├
{ Γ, asm1', ... } t
├
thmtac [(asm1 ⊢ asm1),...]
	({ Γ, asm',... } t)
=TEX
where $asm_i$ and $asm_i'$ are $\alpha$-convertible.
=USES
To use a list of assumptions as theorems
=FAILURE
9301	the term ?0 is not in the assumption list
=ENDDOC

=DOC
val ⦏DROP_ASM_T⦎ : TERM -> (THM -> TACTIC) -> TACTIC;
=DESCRIBE
$DROP\_ASM\_T$ $asm$ $thmtac$ is a tactic which removes $asm$
from the assumption list and then acts as  $thmtac(asm ⊢ asm)$.
=FRULE 2 Tactic
DROP_ASM_T
⌜asm⌝
thmtac
├
{ Γ, asm' } t
├
thmtac (asm ⊢ asm) ({ Γ } t)
=TEX
where $asm$ and $asm'$ are $\alpha$-convertible.
=USES
To use an assumption as a theorem
=FAILURE
9301	the term ?0 is not in the assumption list
=ENDDOC

=DOC
val ⦏LIST_DROP_ASM_T⦎ : TERM list -> (THM list -> TACTIC) -> TACTIC;
=DESCRIBE
$LIST\_DROP\_ASM\_T$ $[asm_1,asm_2,...]$ $thmtac$ is a tactic which removes the $asm_1,asm_2,...$
from the assumption list and then acts as
\[thmtac[(asm_1 ⊢ asm_1),(asm_2 ⊢ asm_2),...]\]
=FRULE 2 Tactic
LIST_DROP_ASM_T
[⌜asm1⌝,...]
thmtac
├
{ Γ, asm1',... } t
├
thmtac [(asm1 ⊢ asm1),...] ({ Γ } t)
=TEX
where $asm_i$ and $asm_i'$ are $\alpha$-convertible.
=USES
To use assumptions as theorems
=FAILURE
9301	the term ?0 is not in the assumption list
=ENDDOC

=DOC
val ⦏TOP_ASM_T⦎ : (THM -> TACTIC) -> TACTIC;
=DESCRIBE
If the top entry in the assumption list is $asm$ say,
$TOP\_ASM\_T$ $thmtac$ acts as  $thmtac(asm ⊢ asm)$.
=FRULE 2 Tactic
TOP_ASM_T
⌜asm⌝
thmtac
├
{ asm, Γ } t
├
thmtac (asm ⊢ asm) ({ asm, Γ } t)
=USES
To use an assumption as a theorem
=FAILURE
9302	the assumption list is empty
=ENDDOC

=DOC
val ⦏POP_ASM_T⦎ : (THM -> TACTIC) -> TACTIC;
=DESCRIBE
$POP\_ASM\_T$ $thmtac$ is a tactic which removes the top entry,
$asm$ say, from the assumption list and then acts as  $thmtac(asm ⊢ asm)$.
=FRULE 2 Tactic
POP_ASM_T
⌜asm⌝
thmtac
├
{ asm, Γ } t
├
thmtac (asm ⊢ asm) ({ Γ } t)
=USES
To use an assumption as a theorem
=FAILURE
9302	the assumption list is empty
=ENDDOC

=DOC
val ⦏GET_ASMS_T⦎ : (THM list -> TACTIC) -> TACTIC;
=DESCRIBE
$GET\_ASMS\_T$ $thmstac$ is a tactic which applies $asm\_rule$ to each assumption
of the goal, giving a list of theorems, $thms$ say,
and then acts as  $thmstac\,thms$.
=FRULE 2 Tactic
GET_ASMS_T
thmstac
├
{ Γ } t
├
thmstac (map asm_rule Γ)
	({ a1,...,an } t)
=TEX
=USES
To use all the assumptions as theorems.
=FAILUREC
\paragraph{Errors}
As for $thmstac$.
=ENDDOC
=DOC
val ⦏GET_FILTER_ASMS_T⦎ : (TERM -> bool) ->
	(THM list -> TACTIC) -> TACTIC;
=DESCRIBE
$GET\_FILTER\_ASMS\_T$ $pred$ $thmstac$ is a tactic which applies $asm\_rule$ to each assumption
of the subgoal that satisfies $pred$, giving a list of theorems, $thms$ say
and then acts as  $thmstac\,thms$.
=FRULE 2 Tactic
GET_FILTER_ASMS_T
pred
thmstac
├
{ Γ } t
├
thmstac (map asm_rule (Γ ∩ pred))
	({ Γ } t)
=TEX
=USES
To use all the selected assumptions as theorems.
=FAILUREC
\paragraph{Errors}
As for $thmstac$.
=ENDDOC

=DOC
val ⦏DROP_ASMS_T⦎ : (THM list -> TACTIC) -> TACTIC;
=DESCRIBE
$DROP\_ASMS\_T$ $thmstac$ is a tactic which applies $asm\_rule$ to each assumption
of the subgoal, giving a list of theorems, $thms$ say, then removes
all the assumptions of the goal
and then acts as  $thmstac\,thms$.
=FRULE 2 Tactic
DROP_ASMS_T
thmstac
├
{ Γ } t
├
thmstac (map asm_rule Γ) ({} t)
=TEX
=USES
To use all the assumptions as theorems.
=FAILUREC
\paragraph{Errors}
As for $thmstac$.
=ENDDOC
=DOC
val ⦏DROP_FILTER_ASMS_T⦎ : (TERM -> bool) ->
	(THM list -> TACTIC) -> TACTIC;
=DESCRIBE
$DROP\_FILTER\_ASMS\_T$ $pred$ $thmstac$ is a tactic which applies $asm\_rule$ to each assumption
of the subgoal that satisfies $pred$, giving a list of theorems, $thms$ say, then removes
all the selected assumptions of the goal
and then acts as  $thmstac\,thms$.
=FRULE 2 Tactic
DROP_FILTER_ASMS_T
pred
thmstac
├
{ Γ } t
├
thmstac (map asm_rule (Γ ∩ pred))
	({Γ \ pred} t)
=TEX
=USES
To use all the selected assumptions as theorems.
=FAILUREC
\paragraph{Errors}
As for $thmstac$.
=ENDDOC

=DOC
val ⦏GET_NTH_ASM_T⦎ : int -> (THM -> TACTIC) -> TACTIC;
=DESCRIBE
$GET\_NTH\_ASM\_T$ $i$ $thmtac$ is a tactic which applies $asm\_rule$
to the $i$-th assumption of the goal, giving a theorem, $thm$ say,
and then acts as  $thmtac\,thm$.

Assumptions are numbered $1, 2 \ldots$, so that, e.g., $GET\_NTH\_ASM\_T\,1$
is the same as $TOP\_ASM\_T$
=FRULE 2 Tactic
GET_NTH_ASM_T
i
thmtac
├
{ a1, ..., an } t
├
thmtac (asm_rule [ai]) ({ Γ } t)
=TEX
=USES
To use an assumption as a theorem, treating the assumption list as an array.
=FAILURE
9303	the index ?0 is out of range
=ENDDOC
=DOC
val ⦏LIST_GET_NTH_ASM_T⦎ : int list -> (THM list -> TACTIC) -> TACTIC;
=DESCRIBE
$LIST\_GET\_NTH\_ASM\_T$ $[i,j,...]$ $thmtac$ is a tactic which applies $asm\_rule$
to the $i$-th, $j$-th, etc, assumption of the goal, giving theorems, $thm_i$, $thm_j$, etc, say,
and then acts as  $thmtac\,[thm_i, thm_j,...]$.
=FRULE 2 Tactic
LIST_GET_NTH_ASM_T
[i,...]
thmtac
├
{ a1, ..., an } t
├
thmtac [(asm_rule [ai]),...] ({ Γ } t)
=TEX
=USES
To use assumptions as theorems, treating the assumption list as an array.
=FAILURE
9303	the index ?0 is out of range
=ENDDOC

=DOC
val ⦏DROP_NTH_ASM_T⦎ : int -> (THM -> TACTIC) -> TACTIC;
=DESCRIBE
$DROP\_NTH\_ASM\_T$ $i$ $thmtac$ is a tactic which applies $asm\_rule$
to the $i$-th assumption of the goal, giving a theorem, $thm$ say,
and then removes $asm$ from the assumptions and acts as  $thmtac\,thm$.

Assumptions are numbered $1, 2 \ldots$, so that, e.g., $DROP\_NTH\_ASM\_T\,1$
is the same as $POP\_ASM\_T$
=FRULE 2 Tactic
DROP_NTH_ASM_T
i
thmtac
├
{ a1, ..., an } t
├
thmtac (asm_rule [ai]) ({ Γ \ ai} t)
=TEX
=USES
To use an assumption as a theorem, treating the assumption list as an array.
=FAILURE
9303	the index ?0 is out of range
=ENDDOC
=DOC
val ⦏LIST_DROP_NTH_ASM_T⦎ : int list ->
	(THM list -> TACTIC) -> TACTIC;
=DESCRIBE
$LIST\_DROP\_NTH\_ASM\_T$ $[i,j,...]$ $thmtac$ is a tactic which applies $asm\_rule$
to the $i$-th, $j$-th, etc assumptions of the goal, giving theorems, $thm_i$, $thm_j$, etc, say,
and then removes the $asm_i$, $asm_j$ from the assumptions and acts as  $thmtac\,[thm_i, thm_j,...]$.
=FRULE 2 Tactic
DROP_NTH_ASM_T
[i,j,...]
thmtac
├
{ a1, ..., an } t
├
thmtac [(asm_rule [ai]),
	(asm_rule [aj]),...]
	({ Γ \ {ai, aj, ...}} t)
=TEX
=USES
To use assumptions as theorems, treating the assumption list as an array.
=FAILURE
9303	the index ?0 is out of range
=ENDDOC


\subsection{Utility Tacticals}
(Errors in this section begin with 96.)

In this section we supply some miscellaneous tactics which are useful
in tactic programming and/or in general use.
=DOC
val ⦏ROTATE_T⦎ : int -> TACTIC -> TACTIC;
=DESCRIBE
$ROTATE\_T\,i\,tac$ is a tactic which first applies $tac$ and, if
this does not achieve the goal, rotates
the resulting subgoals by $i$ places. $i$ is taken modulo the number
of subgoals produced by $tac$.

Thus if the result of $tac$ is:
=FRULE 2 Tactic
tac
├
{ Γ } t
├
{ Γ1 } t1; ... { Γk } tk
=TEX
then the result of $ROTATE\_T\,i\,t$ will be:
=FRULE 2 Tactic
ROTATE_T i tac
├
{ Γ } t
├
{ Γ(i+1) } t(i+1); ..., { Γk } tk;
{ Γ1 } t1; ... { Γi } ti
=TEX
=USES
For use in tactic programming to handle tactics which return their subgoals
in an inconvenient order for the task at hand.
=FAILUREC
\paragraph{Errors}
As for $tac$.
=ENDDOC
=DOC
val ⦏TRY_T⦎ : TACTIC -> TACTIC;
val ⦏TRY⦎ : TACTIC -> TACTIC;
=DESCRIBE
$TRY\_T\,tac$ is a tactic which applies $tac$ to the goal and if that
fails leaves the goal unchanged. It is the same as
$tac\,ORELSE\,id\_tac$.  $TRY$ is an alias for $TRY_T$.
=ENDDOC

=DOC
val ⦏CHANGED_T⦎ : TACTIC -> TACTIC;
=DESCRIBE
$CHANGED\_T\,tac$ is a tactic which applies $tac$ to the goal and fails
if this results in a single subgoal
which is $\alpha-$convertible to the original goal.
=USES
$CHANGED\_T$ can be a useful way of ensuring termination of, e.g., rewriting
tactics.
=FAILURE
9601	the tactic did not change the goal
=ENDDOC
It is not felt to be in the spirit of the name of $CHANGED\_T$ for it also
to fail if the tactic produces several subgoals one or more of which is
$\alpha-$convertible to the original goal. A tactical to do this could
easily be supplied if there was a use for it ($PROGRESS\_T$?).

=DOC
val ⦏SOLVED_T⦎ : TACTIC -> TACTIC;
=DESCRIBE
$SOLVED\_T\,tac$ is a tactic which applies $tac$ to the goal and fails
if it does not solve the goal. I.e. it fails unless the tactic returns an
empty list of subgoals.

$SOLVED\_T$ does not check that the proof delivered by the tactic is
valid. $tac\_proof$ may be used to achieve this type of effect.
=USES
Tactic programming, for when a tactic that fails to prove a goal
is likely to leave an untidy goal state.
=SEEALSO
$tac\_proof$
=FAILURE
9602	the tactic did not solve the goal
=ENDDOC

=DOC
val ⦏LEMMA_T⦎ : TERM -> (THM -> TACTIC) -> TACTIC;
=DESCRIBE
$LEMMA\_T\,newsg\,thmtac$ is a tactic which sets $newsg$ as a new
subgoal and applies $thmtac (newsg ⊢ newsg)$ to the original goal.
=FRULE 2 Tactic
LEMMA_T
newsg thmtac
├
{ Γ } t
├
{ Γ } newsg;
thmtac(newsg ⊢ newsg) ({ Γ } t)
=TEX
=USES
For use in tactic programming and in interactive use where $lemma\_tac$
is not appropriate.
=FAILURE
9603	the term ?0 is not boolean
=SEEALSO
$lemma\_tac$.
=ENDDOC

$lemma\_tac$ is $LEMMA\_T\,strip\_asm\_tac$ and is defined
in \cite{DS/FMU/IED/DTD028}.

\section{USING TACTICS}
(Errors in this section start with 95.)
=DOC
val ⦏simple_tac_proof⦎ : (GOAL * TACTIC) -> THM;
=DESCRIBE
$simple\_tac\_proof(gl, tac)$ applies the tactic $tac$ to the goal $gl$, and, if
the tactic returns no unsolved subgoals returns the theorem proved by
the tactic.

Infelicities in the coding of the tactic may cause the theorem
returned to be rather different from the specified goal (in general,
a ``successful'' application of a correctly coded tactic will return a theorem
which may require addition
of assumptions and $\alpha$-conversion to give the desired goal).
$tac\_proof$ should be used rather than $simple\_tac\_proof$ if it is important
that the theorem should achieve the goal precisely.
=USES
In programming tactics or other proof procedures where speed is important
and the extra care taken by $tac\_proof$ is not required.
=FAILURE
9501	the tactic returned unsolved subgoals: ?0
9502	evaluation of the tactic failed: ?0
9503	the proof returned by the tactic failed: ?0
=SEEALSO
$tac\_proof$
=ENDDOC

=DOC
val ⦏tac_proof⦎ : (GOAL * TACTIC) -> THM;
=DESCRIBE
$tac\_proof(gl, tac)$ applies the tactic $tac$ to the goal $gl$, and, if
the tactic succeeds in proving the goal returns the resulting theorem.

$tac\_proof$ performs $\alpha$-conversion,
introduces additional assumptions, and reorders assumptions as necessary
to ensure that the theorem returned has the same form as the specified
goal (note that this is not possible if the goal has $\alpha$-equivalent
assumptions).
In circumstances where these adjustments are known not to be necessary,
$simple\_tac\_proof$ may be used to avoid the overhead.

=USES
The subgoal package is the normal interactive mechanism for developing
proofs using tactics. $tac\_proof$ is typically used in
tactic programming and other proof procedures, in cases where it is necessary
to ensure that the correct goal is proved.
=FAILURE
9501	the tactic returned unsolved subgoals: ?0
9502	evaluation of the tactic failed: ?0
9503	the proof returned by the tactic failed: ?0
9504	the proof returned by the tactic proved ?0 which could not be
	converted into the desired goal.
9505	the goal contains alpha-equivalent assumptions (?0 and ?1)
9506	the assumption ?0 is not of type ⓣBOOL⌝
9507	the conclusion ?0 is not of type ⓣBOOL⌝
=SEEALSO
$simple\_tac\_proof$, $prove\_thm$.
=ENDDOC
=DOC
val ⦏prove_thm⦎ : (string * TERM * TACTIC) -> THM;
=DESCRIBE
$prove\_thm$ $(key,\ gl,\ tac)$ applies the tactic $tac$ to the goal $([],tm)$, and, if
the tactic succeeds in proving the goal
saves the theorem under the key given,
and returns the resulting theorem.

$prove\_thm$ performs $\alpha$-conversion as necessary
to ensure that the theorem returned has the same form as the specified
goal.
In circumstances where these adjustments are known not to be necessary,
$simple\_tac\_proof$ may be used to avoid the overhead.

=GFT Defn
prove_thm (key, tm, tac) = save_thm(key, tac_proof(([],tm).tac));
=TEX
=USES
The subgoal package is the normal interactive mechanism for developing
proofs using tactics. $prove\_thm$ is typically used in
tactic programming and other proof procedures, in cases where it is necessary
to ensure that the correct goal is proved and saved.
=FAILURE
9501	the tactic returned unsolved subgoals: ?0
9502	evaluation of the tactic failed: ?0
9503	the proof returned by the tactic failed: ?0
9504	the proof returned by the tactic proved ?0 which could not be
	converted into the desired goal.
9507	the conclusion ?0 is not of type ⓣBOOL⌝
=SEEALSO
$simple\_tac\_proof$, $prove\_thm$.
=ENDDOC

=TEX
=SML
end; (* of signature Tactics1 *)
=TEX
\section{TEST POLICY}
The functions in this document should be tested according to
the general criteria set out in \cite{DS/FMU/IED/PLN008}.
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}




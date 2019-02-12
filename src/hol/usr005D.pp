=IGN
********************************************************************************
usr005D.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% usr005D.doc   ℤ $Date: 2002/10/17 15:10:58 $ $Revision: 1.3 $ $RCSfile: usr005D.doc,v $
=TEX
\section{Tactics}
\subsection{Terminology}
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

\subsection{Naming and Type Conventions}

%We adopt the following clarifications/extensions of
%the naming conventions given in \cite{DS/FMU/IED/DEF003}

The following table summarises some of the naming conventions adopted in \Product.

\begin{centering}

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

\end{centering}

where $ty$ denotes a Standard ML type expression, where $[ ...]$ indicates
a part of the type which may be omitted, and where we assume that
the type abbreviations $THM\_TACTIC$ and $THM\_TACTICAL$
%defined in section \ref{TYPEABBREVIATIONS} below
have been expanded.

Note that an object of type $ty(TACTIC) → THM → TACTIC$ is to be named
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
presented to them as arguments.

%All proofs generated by tactics supplied as a part of \Product{} have this property (which is easily effected by avoiding use of rules which do global operations on the assumption lists).

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
$ttac$ is some theorem tactic.
In such usage, what is being assumed is that $ttac$ will produce a `proof' of the intermediate goal which may actually introduce $asm$ as an additional assumption, but that this will not matter since the original goal did indeed have such an assumption.
This approach is not compatible with the convention mentioned in the
previous paragraph.

The tactics and tacticals supplied are therefore designed on the assumption
that their calling environment will make any necessary checks on the applicability of theorems supplied by the user.
$tac\_proof$ is a very simple example of such an environment, which fails if essential use is made of a theorem with an unwarranted assumption.

The subgoal package
%(see \cite{DS/FMU/IED/DTD030}),
which gives an interactive environment for developing proofs using tactics,
causes any extra assumptions to be set as additional subgoals.


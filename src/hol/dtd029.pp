=IGN
********************************************************************************
dtd029.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% dtd029.doc   ℤ 2002/10/17 16:20:01 1.31 dtd029.doc,v
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

\def\Title{Detailed Design of Tactics III}

\def\AbstractText{This document gives a detailed design for the third grouping of tactics, in particular those concerned with paired abstractions.}

\def\Reference{DS/FMU/IED/DTD029}

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
%% LaTeX2e port: \TPPtitle{Detailed Design of Tactics III}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Detailed Design of Tactics III}
%% LaTeX2e port: \TPPref{DS/FMU/IED/DTD029}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{1.31 %
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{2002/10/17 16:20:01 %
%% LaTeX2e port: }}  %% Mandatory field
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.~Blackburn & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document gives a detailed design for the third grouping of tactics,
%% LaTeX2e port: in particular those concerned with paired abstractions.}
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
\item [Issue 1.1 (1991/10/15)]
First version: place holder for tautology stuff.
\item [Issue 1.2 (1991/10/31)]
Added some more odds and ends.
\item [Issue 1.3 (1991/11/12)]
Attempting a ``complete'' design.
\item [Issue 1.4 (1991/11/18)]
Used $GET\_ASM\_T$, etc, in $spec\_asm\_tac$, etc.
\item [Issue 1.5 (1991/11/19)]
Reacting to issue 1.5 of \cite{DS/FMU/IED/DTD051}.

\item[Issue 1.6 (1992/01/20), \FormatDate{92/01/20} ] Updated to use new fonts.
\item [Issue 1.7 (1992/01/27)]
Added $sets\_(e)pc$.
\item [Issue 1.8 (1992/03/18)(11th March 1992)]
Various minor additions and extensions.
\item [Issue 1.9 (1992/03/26) (26th March 1992)]
Changed to use proof context material of issue 1.13 of \cite{DS/FMU/IED/DTD051}.
\item [Issue 1.10 (1992/03/31) (31st March 1992)]
Added understanding of double negation
to $¬\-\_rewrite\-\_canon$.
\item [Issue 1.11 (1992/04/14) (13th April 1992)]
Changes due to CR0017.
\item [Issue 1.12 (1992/04/28) (28th April 1992)]
Corrected documentation typo.
\item [Issue 1.13 (1992/05/14) (14th May 1992)]
Tidying up proof contexts.
\item [Issue 1.14 (1992/05/27) (27th May 1992)]
Added $all\_β\_tac$.
\item [Issue 1.15 (1992/07/06) (5th July 1992)]
Added $step\_strip\_tac$ and $THEN1$.
\item [Issue 1.19 (1992/08/03) (3 August 1992)]
Added chaining and induction tactics.
\item [Issue 1.20 (1992/08/04),1.21 (1992/08/10)]
Updated descriptions of chaining and induction tactics in light of comments received.
\item [Issue 1.22 (1992/08/20) (3 August 1992)]
Corrections and clarifications to text.
\item [Issue 1.23 (1992/09/18) (18th September 1992)]
Added indexing characters where necessary.
\item [Issue 1.24 (1992/09/18) (18th September 1992)]
Correcting typos.
\item [Issue 1.25 (1992/10/05) (3rd October 1992)]
Added $all\_$ variants of forward chaining tactics.
Correcting typos.
\item [Issue 1.26 (1993/01/07) (7th January 1993)]
Clarifying text.
\item [Issue 1.27 (1993/02/02),1.28 (1993/02/03) (2nd-3rd February 1993)]
Added variable elimination tactics.
\item [Issue 1.29 (1993/02/16) (16th February 1993)]
Changes to forward chaining as a consequence to change in $fc\_rule$.
\item[Issue 1.30 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.31 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.32 (2003/03/05)] Change to documentation of GEN\_INDUCT\_T/T1 removing mention that assumptions on the induction theorem are not allowed.
\item[Issues 1.33 (2008/10/30), 1.34 (2008/10/30)] Added
=INLINEFT
list_simple_∃_tac
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
This document contains a detailed design for the
third grouping of tactics, in particular those concerning paired abstractions.
This is called for in \cite{DS/FMU/IED/HLD012}.
The design is
implemented in \cite{DS/FMU/IED/IMP029}.
\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains a detailed design for the
third grouping of tactics, in particular those concerning paired abstractions.

The document provides groups of tactics, related by their core operator.

All functions require all their arguments to begin evaluation,
unless otherwise noted.

Note also that the order of declaration given in this document will
not necessarily reflect the order of implementation in
\cite{DS/FMU/IED/IMP029}.

We use the notation ``varstruct'' for ``an allowed variable structure, under ICL HOL syntax''.
\subsubsection{Dependencies}
Loading this document is dependent on \cite{DS/FMU/IED/IMP026}.
It is implemented in theory ``pair''.
\subsubsection{Deficiencies}
None known.
\subsubsection{Possible Enhancements}
None known.
\section{INFIX DIRECTIVES}
A Standard ML $infix$ directive must be given at the ``top level''.
Thus we give the directives here for those functions declared in the following signatures.
=SML
infix 4 THEN_T1;
infix 4 THEN1;
=TEX

\section{THE SIGNATURE}
=DOC
signature ⦏Tactics3⦎ = sig
=DESCRIBE
This provides a third group of tactics.
They are primarily concerned with adding handling for paired abstractions.
=ENDDOC
\section{TACTICS}
\subsection{Concerning Tautologies}
The following are all implemented using $simple\_taut\_tac$.
=DOC
val ⦏taut_tac⦎ : TACTIC;
=DESCRIBE
A tautology prover.
If the conclusion of the goal is a tautology then $taut\_tac$ will prove
the goal.
A tautology is taken to be any (perhaps universally quantified) substitution
instance of a term which is formed from boolean variables,
the constants $T$ and $F$ and the following
connectives:
=GFT
∧, ∨, ⇒, ⇔, ¬, if ... then ... else
=TEX
and which is true for any assignment of truth values to the variables.
=FRULE 2 Tactic
taut_tac
├
{ Γ } t
├
=TEX
=SEEALSO
$strip\_tac$, $taut\_rule$, $taut\_conv$,
$simple\_taut\_tac$.
=FAILURE
29020	Conclusion of the goal is not a universally quantified tautology
=ENDDOC
=DOC
val ⦏taut_rule⦎ : TERM -> THM;
=DESCRIBE
A tautology prover.
A tautology is taken to be any universally quantified substitution
instance of a term which is formed from boolean variables,
the constants $T$ and $F$ and the following
connectives:
=GFT
∧, ∨, ⇒, ⇔, ¬, if ... then ... else
=TEX
and which is true for any assignment of truth values to the variables.
If its argument is such a tautology then the
function will return that term as a theorem.
=FRULE 1 Rule
taut_rule
⌜t⌝
├
├
⊢ t
=TEX
=SEEALSO
$taut\_tac$, $taut\_conv$,
$simple\_taut\_tac$.
=FAILURE
27037	?0 is not tautologically true
=ENDDOC
This is not a conversion, but there are two conversions leading
from it:
=DOC
val ⦏taut_conv⦎ : CONV;
=DESCRIBE
A tautology prover.
A tautology is taken to be any universally quantified substitution
instance of a term which is formed from boolean variables,
the constants $T$ and $F$ and the following
connectives:
=GFT
∧, ∨, ⇒, ⇔, ¬, if ... then ... else
=TEX
and which is true for any assignment of truth values to the variables.
If its argument is a tautologically true term, then the
function will return a theorem that the term is equivalent to $T$.
=FRULE 1 Conversion
taut_conv
⌜t⌝
├
├
⊢ t ⇔ T
=TEX
=SEEALSO
$taut\_tac$, $taut\_rule$,
$simple\_taut\_tac$.
=FAILURE
27037	?0 is not tautologically true
=ENDDOC
\subsection{Concerning ¬}
=DOC
val ⦏¬_in_tac⦎ : TACTIC;
=DESCRIBE
This is a tactic which moves a top level negation in the conclusion of the goal inside other predicate calculus
connectives using the following rules:
=GFT
		¬¬t			→	 t
		¬(t1 ∧ t2)		→	 ¬t1 ∨ ¬t2
		¬(t1 ∨ t2)		→	 ¬t1 ∧ ¬t2
		¬(t1 ⇒ t2)		→	 t1 ∧ ¬t2
		¬(t1 ⇔ t2)		→	 (t1 ∧ ¬t2) ∨ (t2 ∧ ¬t1)
		¬∀vs⦁t			→	 ∃vs⦁¬t
		¬∃vs⦁t			→	 ∀vs⦁¬t
		¬∃⋎1vs⦁t	→	 ∀vs⦁¬(t ∧ ∀vs'⦁t[vs'] ⇒ vs' = vs)
		¬T			→	 F
		¬F			→	 T
=TEX
=USES
=SEEALSO
$simple\_¬\_in\_tac$, $¬\_in\_conv$
=FAILURE
28025	No applicable rule for this goal
=ENDDOC

=DOC
val ⦏¬_IN_THEN⦎ : THM_TACTICAL;
=DESCRIBE
This is a theorem tactical which applies a given
theorem tactic to the result of transforming a theorem
by moving a top level negation inside other predicate calculus
connectives using the following rules:
=GFT
		¬¬t			→	 t
		¬(t1 ∧ t2)		→	 ¬t1 ∨ ¬t2
		¬(t1 ∨ t2)		→	 ¬t1 ∧ ¬t2
		¬(t1 ⇒ t2)		→	 t1 ∧ ¬t2
		¬(t1 ⇔ t2)		→	 (t1 ∧ ¬t2) ∨ (t2 ∧ ¬t1)
		¬∀vs⦁t			→	 ∃vs⦁¬t
		¬∃vs⦁t			→	 ∀vs⦁¬t
		¬∃⋎1vs⦁t		→	 ∀vs⦁¬(t ∧ ∀vs'⦁t[vs'] ⇒ vs' = vs)
		¬T			→	 F
		¬F			→	 T
=TEX
This function partially evaluates given only the theorem
and theorem-tactical.
=SEEALSO
$SIMPLE\_¬\_IN\_THEN$
=FAILURE
29010	No applicable rule for ?0
=ENDDOC
\subsection{Concerning ⇒ and ⇔}
=DOC
val ⦏⇒_thm_tac⦎ : THM -> TACTIC;
=DESCRIBE
A tactic which uses a theorem whose conclusion is an
implication, $t1 ⇒ t2$, to reduce a goal with conclusion $t2$
to $t1$.
=FRULE 2 Tactic
⇒_thm_tac
Γ1 ⊢ t1 ⇒ t2
├
{ Γ } t2
├
{ Γ } t1
=TEX
N.B. this tactic strengthens the goal, i.e. it may result in unprovable
subgoals even when the original goal was provable.
=USES
Mainly for use in tactic programming where the extra generality
of
=INLINEFT
bc_thm_tac
=TEX
\ and
=INLINEFT
bc_tac
=TEX
\ is not required.
=SEEALSO
$bc\_thm\_tac$, $bc\_tac$.
=FAILURE
29013	Conclusion of the goal is not ?0
=ENDDOC
=DOC
val ⦏back_chain_thm_tac⦎ : THM -> TACTIC;
val ⦏bc_thm_tac⦎ : THM -> TACTIC;
=DESCRIBE
=INLINEFT
back_chain_thm_tac
=TEX
\ is a tactic which uses a theorem whose conclusion is a possibly
universally quantified implication or bi-implication to chain backwards
one step from the conclusion of a goal. (%
=INLINEFT
bc_thm_tac
=TEX
\ is an alias for
=INLINEFT
back_chain_thm_tac
=TEX
.)
The effect is as follows:

=FRULE 2 Tactic
bc_thm_tac
Γ1 ⊢ t1 ⇒ t2
├
{ Γ } t2'
├
{ Γ } t1'
=TEX
=FRULE 2 Tactic
bc_thm_tac
Γ1 ⊢ t1 ⇔ t2
├
{ Γ } t2'
├
{ Γ } t1'
=TEX
where $t2'$ is an instance (under type instantiation and substitution)
of $t2$ and $t1'$ is the corresponding instance of $t1$.
If $t1'$ contains free variables which do not appear in
the assumptions of the instantiated theorem or in $t2'$, then the new subgoal
$t1'$ will be existentially quantified over these variables.
For example,
=TEX
=FRULE 2 Example
bc_thm_tac
⊢ ∀ m i n⦁ m < i ∧ i < n ⇒ m < n
├
{ Γ } a < b
├
{ Γ } ∃ i⦁ a < i ∧ i < b
=TEX

Note that, bi-implications are in effect treated as right-to-left rewrite
rules at the top level by this tactic. The standard rewriting
mechanisms may be used for left-to-right rewriting.

N.B. this tactic strengthens the goal, i.e. it may result in unprovable
subgoals even when the original goal was provable.
=SEEALSO
$back\_chain\_tac$ (which supplies a more general facility).
=FAILURE
29011	Conclusion of the goal is not an instance of: ?0
29012	Theorem ?0 is not of the form `Γ ⊢ ∀ x1 ... xn ⦁ u ⇔ v`
	or `Γ ⊢ ∀ x1 ... xn ⦁ u ⇒ v`
=ENDDOC

=DOC
val ⦏back_chain_tac⦎ : THM list -> TACTIC;
val ⦏bc_tac⦎ : THM list -> TACTIC;
=DESCRIBE
=INLINEFT
back_chain_tac
=TEX
\ is a tactic which uses theorems whose conclusions are possibly
universally quantified implications or bi-implications, to reason
backwards from the conclusion of a goal.
(%
=INLINEFT
bc_tac
=TEX
\ is an alias for
=INLINEFT
back_chain_tac
=TEX
.) The tactic
repeatedly performs the following steps:

\begin{enumerate}
\item
Scan the list of theorems looking for an implication,
=INLINEFT
t1 ⇒ t2
=TEX
, or a bi-implication
=INLINEFT
t1 ⇔ t2
=TEX
\ for which the conclusion of the goal is a substitution instance, $t2'$
say, of $t2$. If no such theorem is found then stop.
\item
If in step 1, an applicable theorem, say $thm$, has been found reduce the goal to
the corresponding instance of $t1$ (or an existentially quantified version
thereof) using
=INLINEFT
bc_thm_tac
=TEX
, q.v.
\item
Repeatedly apply
=INLINEFT
∀_tac
=TEX
\ or
=INLINEFT
∧_tac
=TEX
\ until neither of these is applicable.
\item
Delete $thm$ from the list of theorems and return to step 1.
\end{enumerate}

In step 4, only the first appearance of $thm$ is removed from the list,
so that one can arrange for a theorem to be used more than once by the
tactic by putting several copies of it in the list.

For example:
=FRULE 2 Example
⇒_tac
[Γ1 ⊢ t1 ∧ (∀x⦁t2) ⇒ t3,
Γ2 ⊢ t4 ⇔ t1,
Γ3 ⊢ t5 ⇒ t2,
├
{ Γ } t3'
├
{ Γ } t4'; { Γ } t5'
=TEX

(Here $t3'$ is some substitution instance of $t3$ and $t4'$ and $t5'$ are the
corresponding instances of $t4$ and $t5$.)

N.B. this tactic strengthens the goal, i.e. it may result in unprovable
subgoals even when the original goal was provable.
=SEEALSO
$bc\_thm\_tac$ (which is used to perform step 2).
=FAILURE
29012	Theorem ?0 is not of the form `Γ ⊢ ∀ x1 ... xn ⦁ u ⇔ v`
	or `Γ ⊢ ∀ x1 ... xn ⦁ u ⇒ v`
=ENDDOC
The above formulation of backwards chaining has been explicitly designed for
the case when a theorem is being assembled from several lemmas proved
separately and is not intended to be a precise dual of the forward chaining
tactics. Backward chaining using the assumptions will work but a separate
tactic with a dedicated canonicalisation of both assumptions and the
conclusion would be needed to provide such a dual (and it is unclear
what the right canonicalisation would be).
=DOC
val ⦏forward_chain_tac⦎ : THM list -> TACTIC;
val ⦏fc_tac⦎ : THM list -> TACTIC;
val ⦏all_forward_chain_tac⦎ : THM list -> TACTIC;
val ⦏all_fc_tac⦎ : THM list -> TACTIC;
val ⦏asm_forward_chain_tac⦎ : THM list -> TACTIC;
val ⦏asm_fc_tac⦎ : THM list -> TACTIC;
val ⦏all_asm_forward_chain_tac⦎ : THM list -> TACTIC;
val ⦏all_asm_fc_tac⦎ : THM list -> TACTIC;
=DESCRIBE
These are tactics which use theorems whose conclusions are
implications, or from which implications can be derived using
the canonicalisation function
=INLINEFT
fc_canon
=TEX
, q.v., to reason forwards from the assumptions of a goal. (The names
with
=INLINEFT
fc
=TEX
\ are aliases for the corresponding ones with
=INLINEFT
forward_chain
=TEX
.)

The basic step is to take a theorem of the form
=INLINEFT
Γ ⊢ t1 ⇒ t2
=TEX
\ and an assumption of the form
=INLINEFT
t1'
=TEX
\ where $t1'$ is a substitution instance of $t1$ and to deduce the
corresponding instance of $t2'$. The new theorem,
=INLINEFT
Δ ⊢ t2'
=TEX
\ say, may then be stripped into the assumptions.

In the case of
=INLINEFT
fc_tac
=TEX
\ the implicative theorem is always derived from the list
of theorems given as an argument.
In the case of
=INLINEFT
asm_fc_tac
=TEX
\ the assumptions are also used.
In all of the tactics the rule
=INLINEFT
fc_canon
=TEX
\ is used to derive an implicative canonical form from the
candidate implicative theorems.
Normally combination of an implicative theorem and an assumption
is then tried in turn and all resulting theorems are stripped into
the assumptions of the goal.
However, if the chaining results contain a theorem whose conclusion is ⌜F⌝ then the first such found will be stripped
into the assumptions, and all other theorems discarded.

If one of the implications has the form
=INLINEFT
t1 ⇒ t2 ⇒ t3
=TEX
\ or
=INLINEFT
t1 ∧ t2 ⇒ t3
=TEX
\ and if assumptions matching $t1$ and $t2$ are available,
=INLINEFT
fc_tac
=TEX
\ or
=INLINEFT
asm_fc_tac
=TEX
\ will derive an intermediate implication
=INLINEFT
t2 ⇒ t3
=TEX
\ and
=INLINEFT
asm_fc_tac
=TEX
\ could then be used to derive $t3$.
The variants with $all\_$ may be used to derive $t3$ directly without
generating any intermediate implications in the assumptions.
They work like the corresponding tactic without $all\_$ but any theorems
which are derived which are themselves implications are not stripped into
the assumptions but instead are used recursively to derive further theorems.
When no new implications are derivable all of the non-implicative theorems
derived during the process are stripped into the assumptions.

Note that the use of
=INLINEFT
fc_canon
=TEX
\ implies that conversions from the
proof context are applied to generate implications.
E.g., in an appropriate proof-context covering set theory,
=INLINEFT
a ⊆ b
=TEX
\ might be treated as the implication
=INLINEFT
∀x⦁x ∈ a ⇒ x ∈ b
=TEX
.
Also variables which appear free in a theorem are not considered as candidates
for instantiation
(in order to give some control over the number of results generated).
The tacticals,
=INLINEFT
FC_T1
=TEX
\ and
=INLINEFT
ASM_FC_T1
=TEX
\ may be used to avoid the use of
=INLINEFT
fc_canon
=TEX
.

For example, the tactic:
=GFT
asm_fc_tac[] THEN asm_fc_tac[]
=TEX
will prove the goal:
=GFT
{p x, ∀x⦁p x ⇒ q x, ∀x⦁q x ⇒ r x} r x.
=TEX
=SEEALSO
$bc\_tac$,
$FC\_T$,
$ASM\_FC\_T$,
$FC\_T1$,
$ASM\_FC\_T1$.
=ENDDOC

=DOC
val ⦏FORWARD_CHAIN_T⦎ :
	(THM list -> TACTIC) -> THM list -> TACTIC;
val ⦏FC_T⦎ :
	(THM list -> TACTIC) -> THM list -> TACTIC;
val ⦏ALL_FORWARD_CHAIN_T⦎ :
	(THM list -> TACTIC) -> THM list -> TACTIC;
val ⦏ALL_FC_T⦎ :
	(THM list -> TACTIC) -> THM list -> TACTIC;
val ⦏ASM_FORWARD_CHAIN_T⦎ :
	(THM list -> TACTIC) -> THM list -> TACTIC;
val ⦏ASM_FC_T⦎ :
	(THM list -> TACTIC) -> THM list -> TACTIC;
val ⦏ALL_ASM_FORWARD_CHAIN_T⦎ :
	(THM list -> TACTIC) -> THM list -> TACTIC;
val ⦏ALL_ASM_FC_T⦎ :
	(THM list -> TACTIC) -> THM list -> TACTIC;
=DESCRIBE
These are tacticals which use theorems whose conclusions are
implications, or from which implications can be derived,
to reason forwards from the assumptions of a goal.
(The tacticals with
=INLINEFT
FC
=TEX
\ are aliases for the corresponding ones with
=INLINEFT
FORWARD_CHAIN
=TEX
.)

The description of
=INLINEFT
fc_tac
=TEX
\ should be consulted for the basic forward chaining algorithms used.
The significance of the final argument and of the presence or absence of
=INLINEFT
ASM
=TEX
\ and
=INLINEFT
ALL
=TEX
\ in the name is exactly as for
=INLINEFT
fc_tac
=TEX
\ and its relatives.

The tacticals allow variation of
the tactic generating function used to process the theorems derived
by the forward inference.
The tactic generating function to be used is given as the first
argument.

\paragraph{Examples}
=INLINEFT
fc_tac
=TEX
\ is the same as:
=INLINEFT
FC_T (MAP_EVERY strip_asm_tac)
=TEX
.

To rewrite the goal with the results of the forward inference one
could use
=INLINEFT
FC_T rewrite_tac
=TEX
.
=SEEALSO
$fc\_tac$, $asm\_fc\_tac$, $bc\_tac$, $FC\_T1$.
=ENDDOC


=DOC
val ⦏FORWARD_CHAIN_T1⦎ :
	(THM -> THM list) -> (THM list -> TACTIC) -> THM list -> TACTIC;
val ⦏FC_T1⦎ :
	(THM -> THM list) -> (THM list -> TACTIC) -> THM list -> TACTIC;
val ⦏ALL_FORWARD_CHAIN_T1⦎ :
	(THM -> THM list) -> (THM list -> TACTIC) -> THM list -> TACTIC;
val ⦏ALL_FC_T1⦎ :
	(THM -> THM list) -> (THM list -> TACTIC) -> THM list -> TACTIC;
val ⦏ASM_FORWARD_CHAIN_T1⦎ :
	(THM -> THM list) -> (THM list -> TACTIC) -> THM list -> TACTIC;
val ⦏ASM_FC_T1⦎ :
	(THM -> THM list) -> (THM list -> TACTIC) -> THM list -> TACTIC;
val ⦏ALL_ASM_FORWARD_CHAIN_T1⦎ :
	(THM -> THM list) -> (THM list -> TACTIC) -> THM list -> TACTIC;
val ⦏ALL_ASM_FC_T1⦎ :
	(THM -> THM list) -> (THM list -> TACTIC) -> THM list -> TACTIC;
=DESCRIBE
These are tacticals which use theorems whose conclusions are
implications, or from which implications can be derived,
to reason forwards from the assumptions of a goal.
(The tacticals with
=INLINEFT
FC
=TEX
\ are aliases for the corresponding ones with
=INLINEFT
FORWARD_CHAIN
=TEX
.)

The description of
=INLINEFT
fc_tac
=TEX
\ should be consulted for the basic forward chaining algorithms used.
The significance of the final argument and of the presence or absence of
=INLINEFT
ASM
=TEX
\ and
=INLINEFT
ALL
=TEX
\ in the name is exactly as for
=INLINEFT
fc_tac
=TEX
\ and its relatives.

The tacticals allow variation of the canonicalisation function
used to obtain implications from the argument theorems and of
the tactic generating function used to process the theorems derived
by the forward inference.
The canonicalisation function to use is the first argument
and the tactic generating function is the second.
(Related tacticals with names ending in
=INLINEFT
T
=TEX
\ rather than
=INLINEFT
T1
=TEX
\ are also available for the simpler case when
wants to use the same canonicalisation function as
=INLINEFT
fc_tac
=TEX
\ and just to vary the tactic generating function.)

\paragraph{Examples}

If the theorem argument comprises only implications
which are to be used without canonicalisation, one might use:
=INLINEFT
FC_T1 id_canon (MAP_EVERY strip_asm_tac)
=TEX
.

If one has an instance of $t1$ as an assumption and one wishes to
use the bi-implication in a theorem of the form
=INLINEFT
⊢ t1 ⇒ (t2 ⇔ t3)
=TEX
\ for rewriting, one might use
=INLINEFT
FC_T1 id_canon rewrite_tac
=TEX
.

=SEEALSO
$fc\_tac$, $asm\_fc\_tac$, $bc\_tac$, $FC\_T$.
=ENDDOC


The $all\_$ variants of all the above forward chaining tactics and
tacticals are intended to be particularly relevant for Z, since in Z
one often has, e.g., an equation universally quantified over several
variables and to get an instance of the equation into the assumptions
requires discharging one set membership condition for each bound
variables as it is specialised.

\subsection{Concerning ∀}
=DOC
val ⦏∀_tac⦎ : TACTIC;
=DESCRIBE
Reduce a universally quantified goal.
=FRULE 2 Tactic
∀_tac
├
{ Γ } ∀ vs[x1,...] ⦁ t[x1,...]
├
{ Γ } t[x1',...]
=TEX
where $x1'$ is a variant name of $x1$, etc, different from any
variable in $Γ$ or $t$.
=SEEALSO
$simple\_∀\_tac$
=FAILURE
29001	Goal is not of the form: { Γ } ∀ vs ⦁ t[vs]
=ENDDOC

\subsection{Concerning ∃}

=DOC
val ⦏∃_tac⦎ : TERM -> TACTIC ;
=DESCRIBE
Provide a witness for an existential subgoal.

N.B. this tactic strengthens the goal, i.e. it may result in unprovable
subgoals even when the original goal was provable.
=FRULE 2 Tactic
∃_tac
⌜t⌝
├
{ Γ } ∃ vs[x1,...] ⦁ t2[x1,...]
├
{ Γ } t2[t1',...]
=TEX
where $vs[t_1,...]$ is $t$, type instantiated to have the same type as $vs[x1,...]$, and broken up using
$Fst$ and $Snd$ as necessary.
=SEEALSO
$simple\_∃\_tac$
=FAILURE
29002	Goal is not of the form: { Γ } ∃ vs ⦁ t2[vs]
29008	Cannot match witness ?0 to varstruct ?1
=ENDDOC
=DOC
val ⦏list_simple_∃_tac⦎ : TERM list -> TACTIC ;
=DESCRIBE
Provide a list of witnesses for an interated existential subgoal.

N.B. this tactic strengthens the goal, i.e. it may result in unprovable
subgoals even when the original goal was provable.
=FRULE 2 Tactic
list_simple_∃_tac
[⌜t1⌝,⌜t2⌝,...]
├
{ Γ } ∃ x1,x2... ⦁ t2[x1,x2,...]
├
{ Γ } t2[t1',t2'...]
=TEX
where $t1',t2',\ldots$ are $t1, t2,\ldots$, type instantiated to have the same type as $x1, x2, \ldots$.
=SEEALSO
$simple\_∃\_tac$
=FAILURE
29008	Cannot match witness ?0 to variable ?1
29015	The list of witnesses is longer than the list of
	existentially quantified variables in ?0
29016	The list of witnesses is empty
29017	Goal is not of the form: { Γ } ∃ x ⦁ t2[x]
=ENDDOC
=DOC
val ⦏∃_THEN⦎ : (THM -> TACTIC) -> (THM -> TACTIC);
=DESCRIBE
A theorem tactical which applies a given theorem tactic to the result
of eliminating the outermost quantifier from a theorem of the form
$Γ ⊢ ∃vs⦁t$.
=GFT
∃_THEN thmtac (Γ ⊢ ∃vs[x1,...]⦁t) = thmtac (Γ ⊢ t[x1'/x1,...])
=TEX
where ⌜x1'⌝ is a variant of ⌜x1⌝ , etc, which does not appear in $Γ$ or in
the assumption or conclusion of the goal.
=SEEALSO
$SIMPLE\_∃\_THEN$
=FAILURE
29003	?0 is not of the form: `Γ ⊢ ∃ vs ⦁ t`
=ENDDOC

\subsection{Concerning ∃$_1$}

=DOC
val ⦏∃⋎1_tac⦎ : TERM -> TACTIC;
=DESCRIBE
Provide a witness for a goal with conclusion of the form
=INLINEFT
∃⋎1x⦁t
=TEX
.

N.B. this tactic strengthens the goal, i.e. it may result in unprovable
subgoals even when the original goal was provable.
=FRULE 2 Tactic
∃⋎1_tac1
⌜t⌝
├
{ Γ } ∃⋎1 vs[x1,...] ⦁ P[x1,...]
├
{ Γ } P[t1',...];
{ Γ } ∀vs[x1',...]⦁
	P[x1',...] ⇒ vs[x1',...] = t'
=TEX
where $x_i'$ is a variant of $x_i$ which does not occur free in $t$,
$t'$ is equal to $t$ type instantiated to the type of $vs[x1,...]$,
and $vs[t1',...]$ equals $t'$ (perhaps using $Fst$ and $Snd$).
=FAILURE
29004	Goal is not of the form: { Γ } ∃⋎1 vs ⦁ t
29008	Cannot match witness ?0 to varstruct ?1
=ENDDOC
=DOC
val ⦏∃⋎1_THEN⦎ : (THM -> TACTIC) -> (THM -> TACTIC);
=DESCRIBE
A theorem tactical which applies a given theorem tactic to the result
of eliminating the outermost quantifier from a theorem of the form
$Γ ⊢ ∃_1vs⦁t$.
=GFT
∃⋎1_THEN thmtac (Γ ⊢ ∃⋎1vs[x1,...]⦁t) =
	thmtac (Γ ⊢ t[x1'/x1,...] ∧
		∀vs[x1'',...]⦁P[x1'',...] ⇒ vs[x1'',...] = vs[x1',...])
=TEX
where ⌜x1'⌝ and ⌜x1''⌝ are distinct variants of ⌜x1⌝, etc, which do not appear free in $Γ$ or in
the assumptions or conclusion of the goal.
=FAILURE
29005	?0 is not of the form: `Γ ⊢ ∃⋎1 vs ⦁ t`
=ENDDOC
\subsection{Concerning λ}
=DOC
val ⦏all_β_tac⦎ : TACTIC;
=DESCRIBE
This tactic will $β$-reduce all $β$-redexes in the goal's
conclusion,
including
those redexes introduced by preceding $β$-reductions
in the same tactic application.
=USES
In most proof contexts $β$-reduction will be a side effect
of rewriting: this tactic is intended for cases where
rewriting would do ``too much''.
=SEEALSO
$all\_β\_rule$, $all\_β\_conv$
=FAILURE
27049	?0 contains no β-redexes
=ENDDOC
\subsection{Concerning ε}
=DOC
val ⦏ε_tac⦎ : TERM -> TACTIC;
val ⦏ε_T⦎ : TERM -> (THM -> TACTIC) -> TACTIC;
=DESCRIBE
Given a choice term,
=INLINEFT
εx⦁t
=TEX
\ say,
=INLINEFT
ε_tac
=TEX
\ sets
=INLINEFT
∃x⦁t
=TEX
\ as a lemma, and derives the new assumption
=INLINEFT
t[εx⦁t/x]
=TEX
\ from it.

%
=INLINEFT
ε_T
=TEX
\ is the same as
=INLINEFT
ε_tac
=TEX
\ except that it passes the new assumption to a tactic
generating function.
=FRULE 2 Tactic
ε_tac
⌜εx⦁t⌝
├
{ Γ } t1
├
{ Γ } ∃x⦁t; {strip t[εx⦁t/x], Γ } t1
=TEX
N.B. this tactic strengthens the goal, i.e. it may result in unprovable
subgoals even when the original goal was provable. This occurs when
the use of the choice function is in some sense irrelevant
to the truth of the goal, e.g.,
=INLINEFT
(εx⦁T) = (εx⦁T)
=TEX
.
=SEEALSO
$all\_ε\_tac$, $all\_ε\_T$ (which are easier to use in most cases).
=FAILURE
29050	?0 is not of the form ⌜εx⦁p x⌝
=ENDDOC

=DOC
val ⦏all_ε_tac⦎ : TACTIC;
val ⦏ALL_ε_T⦎ : (THM -> TACTIC) -> TACTIC;
=DESCRIBE
=INLINEFT
all_ε_tac
=TEX
\ applies
=INLINEFT
ε_tac
=TEX
\ to all subterms of the conclusion of the goal of the form
=INLINEFT
εx⦁t
=TEX
.
=INLINEFT
ALL_ε_T
=TEX
\ is similar but uses
=INLINEFT
ε_T
=TEX
\ rather than
=INLINEFT
ε_tac
=TEX
.
The effect is to set the corresponding terms of the form
=INLINEFT
∃x⦁t
=TEX
\ as lemmas, and to derive new assumptions of the form
=INLINEFT
t[εx⦁t/x]
=TEX
.
=FRULE 2 Tactic
ε_tac
├
{ Γ } t[εx⋎1⦁t⋎1/y⋎1, ..., εx⋎k⦁t⋎k/y⋎k]
├
{ Γ } ∃x⋎1⦁t⋎1; ...; { Γ } ∃x⋎k⦁t⋎k;
{strip t⋎1[εx⋎1⦁t⋎1/x⋎1], ...,
		strip t⋎k[εx⋎k⦁t⋎k/x⋎k], Γ } t
=TEX
N.B. this tactic strengthens the goal, i.e. it may result in unprovable
subgoals even when the original goal was provable. This occurs when
the use of the choice function is in some sense irrelevant
to the truth of the goal, e.g.,
=INLINEFT
(εx⦁T) = (εx⦁T)
=TEX
.
=ENDDOC

\subsection{Concerning Assumptions}
=DOC
val ⦏spec_asm_tac⦎ : TERM -> TERM -> TACTIC;
val ⦏list_spec_asm_tac⦎ : TERM -> TERM list -> TACTIC;
val ⦏spec_nth_asm_tac⦎ : int -> TERM -> TACTIC;
val ⦏list_spec_nth_asm_tac⦎ : int -> TERM list -> TACTIC;
=DESCRIBE
These are four methods of specialising assumptions,
differing by single or lists of values to specialise to,
and in the method of selection of the assumption.
All of them leave the old assumption in place, and place the
 instantiated assumption onto the assumption list using $strip\_asm\_tac$.
If the desired behaviour differs from any of those supplied
then use $GET\_ASM\_T$ and its cousins to create the desired functionality.
=FRULE 2 Tactic
spec_asm_tac
⌜∀ vs[x1,...] ⦁ f [x1,...]⌝
⌜tm⌝
├
{ Γ, ⌜∀ vs[x1',...] ⦁ f [x1',...]⌝ } t
├
{strip ⌜f [t1,...]⌝, Γ,
⌜∀ vs[x1,...] ⦁ f [x1,...]⌝} t1
=TEX
The following all handle paired abstractions in a similar
manner.
=FRULE 2 Tactic
list_spec_asm_tac
⌜∀ x1 ... ⦁ f [x1,...]⌝
[⌜t1⌝,⌜t2⌝,...]
├
{ Γ, ⌜∀ x1 ... ⦁ f [x1,...]⌝ } t
├
{strip ⌜f [t1,...]⌝, Γ,
⌜∀ x1 x2 ... ⦁ f [x1,...]⌝,
} t
=TEX
=FRULE 2 Tactic
spec_nth_asm_tac
n
⌜t2⌝
├
{ Γ1...n-1, ⌜∀ x' ⦁ f [x']⌝, Γ} t1
├
{strip ⌜f [t2]⌝,  Γ1...n-1,
⌜∀ x' ⦁ f [x']⌝,
Γ} t1
=TEX
=FRULE 2 Tactic
list_spec_nth_asm_tac
n
[⌜t1⌝,...]
├
{ Γ1...n-1, ⌜∀ x1 ...⦁ f [x1,...]⌝, Γ} t
├
{strip ⌜f [t1,...]⌝, Γ1...n-1,
⌜∀ x1 ...⦁ f [x1,...]⌝,
Γ} t
=TEX
=GFT Definitions
fun spec_asm_tac asm instance =
	GET_ASM_T asm (strip_asm_tac o ∀_elim instance);
fun list_spec_asm_tac asm instances =
	GET_ASM_T asm (strip_asm_tac o list_∀_elim instances);
fun spec_nth_asm_tac n instance =
	GET_NTH_ASM_T n (strip_asm_tac o ∀_elim instance);
fun list_spec_nth_asm_tac n instances =
	GET_NTH_ASM_T n (strip_asm_tac o list_∀_elim instances);
=TEX
=FAILUREC
\paragraph{Errors}
As the constituents of the implementing functions.
=ENDDOC
=DOC
val ⦏SPEC_ASM_T⦎ : TERM -> TERM -> (THM -> TACTIC) -> TACTIC;
val ⦏LIST_SPEC_ASM_T⦎ : TERM -> TERM list -> (THM -> TACTIC)
	-> TACTIC;
val ⦏SPEC_NTH_ASM_T⦎ : int -> TERM -> (THM -> TACTIC) -> TACTIC;
val ⦏LIST_SPEC_NTH_ASM_T⦎ : int -> TERM list -> (THM -> TACTIC)
	-> TACTIC;
=DESCRIBE
These are four methods of specialising assumptions,
differing by single or lists of values to specialise to,
and in the method of selection of the assumption.
All of them leave the old assumption in place, and place the
 instantiated assumption onto the assumption list using
their theorem tactic.
If the desired behaviour differs from any of those supplied
then use $GET\_ASM\_T$ and its cousins to create the desired functionality.
=FRULE 2 Tactic
SPEC_ASM_T
⌜∀ vs[x1,...] ⦁ f [x1,...]⌝
⌜tm⌝
thm_tac
├
{ Γ, ⌜∀ vs[x1',...] ⦁ f [x1',...]⌝ } t
├
thm_tac (asm_rule ⌜f [t1,...]⌝)
{Γ,⌜∀ vs[x1,...] ⦁ f [x1,...]⌝} t1
=TEX
The following all handle paired abstractions in a similar
manner.
=FRULE 2 Tactic
LIST_SPEC_ASM_T
⌜∀ x1 x2 ... ⦁ f [x1,x2,...]⌝
[⌜t1⌝,⌜t2⌝,...]
thm_tac
├
{ Γ, ⌜∀ x1 x2 ... ⦁ f [x1,x2,...]⌝ } t
├
thm_tac (asm_rule ⌜f [t1,t2,...]⌝)
{Γ,⌜∀ x1 x2 ... ⦁ f [x1,x2,...]⌝} t
=TEX
=FRULE 2 Tactic
SPEC_NTH_ASM_T
n
⌜t2⌝
thm_tac
├
{ Γ1...n-1, ⌜∀ x' ⦁ f [x']⌝, Γ} t1
├
thm_tac (asm_rule ⌜f [t2]⌝)
{Γ1...n-1,⌜∀ x' ⦁ f [x']⌝,Γ} t1
=TEX
=FRULE 2 Tactic
LIST_SPEC_NTH_ASM_T
n
[⌜t1⌝,...]
thm_tac
├
{ Γ1...n-1, ⌜∀ x1 ...⦁ f [x1,...]⌝, Γ} t
├
thm_tac (asm_rule ⌜f [t1,...]⌝)
{Γ1...n-1,⌜∀ x1 ...⦁ f [x1,...]⌝, Γ}
t
=TEX
=GFT Definitions
fun SPEC_ASM_T asm instance thmtac =
	GET_ASM_T asm (thmtac o ∀_elim instance);
fun LIST_SPEC_ASM_T asm instances thmtac =
	GET_ASM_T asm (thmtac o list_∀_elim instances);
fun SPEC_NTH_ASM_T n instance thmtac =
	GET_NTH_ASM_T n (thmtac o ∀_elim instance);
fun LIST_SPEC_NTH_ASM_T n instances thmtac =
	GET_NTH_ASM_T n (thmtac o list_∀_elim instances);
=TEX
=FAILUREC
\paragraph{Errors}
As the constituents of the implementing functions.
=ENDDOC
\subsection{Concerning Stripping}
=DOC
val ⦏step_strip_tac⦎ : TACTIC;
val ⦏step_strip_asm_tac⦎ : THM -> TACTIC;
=DESCRIBE
These functions provide methods of single-stepping through the application of $strip\-\_tac$ and $strip\-\_asm\-\_tac$ (q.v.).

When stripping the antecedent of an implication ,or a theorem, into the assumption list $strip\-\_tac$ and $strip\-\_asm\-\_tac$ respectively do all their stripping in one application of the tactic.
This is not appropriate behaviour when:
\begin{enumerate}
\item
Explaining the detailed behaviour of these functions by example
applications.
\item
Attempting to ``debug'' a failed or inappropriate stripping.
\item
When a partial strip into the assumption list is desired.
\end{enumerate}
The two functions provided give a single-step stripping of antecedents and theorems.
They represent sets of objects that are partially stripped into
the assumption list by making the conclusion of the resulting goal an implication with the antecedent being the conjunction of the
partially stripped objects and the consequent being the unstripped part of the goal.
Repeated use of the provided functions closely corresponds to the processing order and effect of $strip\-\_tac$ and $strip\-\_asm\-\_tac$.
Under certain unusual circumstances the match may not be exact.
=EXAMPLE
⊢? ((a ∨ b) ∧ c) ⇒ ((a ∧ c) ∨ (b ∧ c))
Single steps to:
⊢? (a ∧ c) ⇒ ((a ∧ c) ∨ (b ∧ c))
and ⊢? (b ∧ c) ⇒ ((a ∧ c) ∨ (b ∧ c))
Each single step to:
a ⊢? c ⇒ ((a ∧ c) ∨ (b ∧ c))
and b ⊢? c ⇒ ((a ∧ c) ∨ (b ∧ c))
Each single step to:
a, c ⊢? ⇒ ((a ∧ c) ∨ (b ∧ c))
and b, c ⊢? ⇒ ((a ∧ c) ∨ (b ∧ c))
=TEX
These five steps (two on each branch) map onto one call of
$strip\_tac$.
=FAILURE
28003	There is no stripping technique for ?0 in the current proof context
=ENDDOC
Some ``unusual circumstances'' when the above do not correspond to  $strip\-\_tac$ and $strip\-\_asm\-\_tac$ are:
\begin{enumerate}
\item
If a conversion in the proof context for stripping theorems
is applicable to conjuncts then it might not be applied in the single stripping case.
\item
If a conversion in the proof context has side effects these might interfere with the main goal, etc, in different manners, though the
order of occurrence of the side effects should normally be the same.
\item
Some of the processing that a single call of $strip\_tac$ would do before
determining that a subgoal has been proved may not
occur in the single-step case,
due to the single step functions being unable to distinguish
whether certain conclusions were formed from partially
stripped objects, or were part of the original goal.
This only affects the amount of processing, not the equivalence of the result.
\end{enumerate}
\subsection{Concerning Induction}
=DOC
val ⦏GEN_INDUCTION_T⦎ : THM -> (THM -> TACTIC) -> TERM -> TACTIC;
val ⦏gen_induction_tac⦎ : THM -> TERM -> TACTIC;
=DESCRIBE
These give general means for constructing an induction tactic from
an induction principle formulated as a theorem.
The term argument is the induction variable, which must be free in
the conclusion of the goal to which the tactic is applied but not
in the assumptions.

=INLINEFT
GEN_INDUCTION_T
=TEX
\ causes any inductive hypotheses (see below) to be passed to
a tactic generating function.

=INLINEFT
gen_induction_tac thm
=TEX
\ is the same as
=INLINEFT
GEN_INDUCTION_T thm strip_asm_tac
=TEX
.

The discussion below is for the tactic computed by the call
=INLINEFT
GEN_INDUCTION_T thm ttac y
=TEX
\ applied to a goal with conclusion
=INLINEFT
t
=TEX
.

The induction principle, $thm$ has the form:
=GFT
⊢ ∀p⦁a ⇒ ∀x⦁p x
=TEX
E.g. the usual principle of induction for the natural numbers:
=GFT
⊢ ∀ p⦁ p 0 ∧ (∀ n⦁ p n ⇒ p (n + 1)) ⇒ (∀ n⦁ p n)
=TEX

The induction tactic takes the following steps:

\begin{enumerate}
\item
Use ∀-elimination on $thm$, (with the term
=INLINEFT
⌜λy⦁t⌝
=TEX
) and β-reduction to give an implicative theorem,
=INLINEFT
⊢ a' ⇒ t
=TEX
\  and use it to reduce the goal to a subgoal with conclusion
=INLINEFT
a'
=TEX
.\item
Repeatedly apply
=INLINEFT
∧_tac
=TEX
\ and then repeatedly apply
=INLINEFT
∀_tac
=TEX
.
\item
To any of the resulting subgoals whose principal connective corresponds to an
an implication in $thm$ apply
=INLINEFT
⇒_T ttac
=TEX
. E.g., with the usual principle of induction for the natural numbers
as formulated above
=INLINEFT
⇒_T ttac
=TEX
is applied in the inductive step but not in the base case,
even if the conclusion of the goal is an implication.
\end{enumerate}

The tactic also renames bound variables so that names which begin
with the name of the variable in the theorem now begin
with the name of the induction variable passed to the tactic.
=FAILURE
29021	?0 does not have the form `⊢ ∀p⦁a ⇒ ∀x⦁p x`
29023	The type of ?0 is not an instance of ?1
29024	?0 is not a variable
29025	?0 appears free in the assumptions of the goal
29026	?0 does not appear free in the conclusion of the goal
=ENDDOC

=DOC
val ⦏GEN_INDUCTION_T1⦎ : THM -> (THM -> TACTIC) -> TACTIC;
val ⦏gen_induction_tac1⦎ : THM -> TACTIC;
=DESCRIBE
These give a means for constructing an induction tactic from
an induction principle formulated as a theorem, in cases where the
induction variable can be inferred from the form of the theorem
and the goal. They are in other respects very like
=INLINEFT
GEN_INDUCTION_T
=TEX
\ and
=INLINEFT
gen_induction_tac thm
=TEX
, q.v.

The induction theorem must be a theorem of the form:
=GFT
⊢ ∀p⦁a ⇒ ∀x⦁t[p x/b]
=TEX
Where $t$ contains at least one occurrence of $x$.
For example,
=GFT
⊢ ∀ p ⦁ p {} ∧ (∀ a x⦁ a ∈ Finite ∧ p a ∧ ¬ x ∈ a ⇒ p ({x} ∪ a))
      ⇒ (∀ a⦁ a ∈ Finite ⇒ p a)
=TEX
(for which $t$ is
=INLINEFT
a ∈ Finite ⇒ b
=TEX
).

The induction tactic matches the conclusion, $c$, of the goal with $t$,
uses the result to derive a theorem
of the form
=INLINEFT
⊢ a' ⇒ c
=TEX
\ and then proceeds exactly like the corresponding induction tactic produced
by
=INLINEFT
GEN_INDUCTION_T
=TEX
\ and
=INLINEFT
gen_induction_tac thm
=TEX
\, q.v.

=FAILURE
29007	?0 does not have the form `⊢∀p:τ→BOOL⦁a ⇒ ∀x⦁t[p x/b]`
	(where ⌜x⌝ must also appear in ⌜t⌝ other than as an argument of ⌜p⌝)
29009	The conclusion of the goal cannot be rewritten in the form ?0
29014	The term ?0 which matches the induction variable is not a variable
=ENDDOC
\section{VARIABLE ELIMINATION}
=DOC
val ⦏var_elim_asm_tac⦎ : TERM -> TACTIC;
val ⦏var_elim_nth_asm_tac⦎ : int -> TACTIC;
val ⦏VAR_ELIM_ASM_T⦎ : TERM -> (THM -> TACTIC) -> TACTIC;
val ⦏VAR_ELIM_NTH_ASM_T⦎ : int -> (THM -> TACTIC) -> TACTIC;
=DESCRIBE
These tactics and tacticals do variable elimination with a chosen assumption of the goal.
They take an assumption of the form:
=INLINEFT
⌜var = value⌝
=TEX
{} or
=INLINEFT
⌜value = var⌝
=TEX
{}, where $var$ is a variable and, if the subterm $value$ does not contain $var$ free, they substitute $value$ for the free variable $var$ throughout the goal (discarding the original assumption).

If an assumption is an equation of variables,
then the tactic will strip digits and the current variant suffix from the right of the two variable names, and will choose to eliminate the variable with the shortest remaining name string, taking eliminating the left hand side variable if the strings are of equal length
(this is a heuristic).
If the variables are the same then the assumption is just discarded with no further effect.

$var\_elim\_asm\_tac$ will determine whether its term argument is an assumption of the above form.
If so,
it will substitute for the free variable $var$ with $value$ throughout the goal, stripping any changed assumptions back into the goal (returning the rest by $check\_asm\_tac$), and then discard the original assumption.
$VAR\_ELIM\_ASM\_T$ allows the users choice of function to be applied to the modified assumptions.

$var\_elim\_nth\_asm\_tac$ works as $var\_elim\_asm\_tac$, except it takes an integer indicating the ``nth'' assumption is to be used.
$VAR\_ELIM\_NTH\_ASM\_T$ allows the users choice of function to be applied to the modified assumptions.
=SEEALSO
$all\_var\_elim\_asm\_tac1$ and its kin to apply this sort of functionality to all the assumptions simultaneously.
$prop\_eq\_prove\_tac$ for more sophisticated approach to these kinds of
problems.
=FAILURE
9301	the term ?0 is not in the assumption list
9303	the index ?0 is out of range
29027	?0 is not of the form ⌜var = ...⌝ or ⌜... = var⌝ where
	the variable ⌜var⌝ is not free in ⌜...⌝
=ENDDOC
=DOC
val ⦏all_var_elim_asm_tac⦎ : TACTIC;
val ⦏all_var_elim_asm_tac1⦎ : TACTIC;
val ⦏ALL_VAR_ELIM_ASM_T⦎ : (THM -> TACTIC) -> TACTIC;
val ⦏ALL_VAR_ELIM_ASM_T1⦎ : (THM -> TACTIC) -> TACTIC;
=DESCRIBE
These tactics and tacticals do variable elimination with all the appropriate assumptions of the goal.
They process one or more assumptions of the form:
=INLINEFT
⌜var = value⌝
=TEX
{} or
=INLINEFT
⌜value = var⌝
=TEX
{}, where $var$ is a variable and the subterm $value$ satisfies a tactic-specific requirement, eliminating the variable $var$ in favour of the $value$.

If an assumption is an equation of variables,
which all of the listed tactics accept,
then the tactic will strip digits and the current variant suffix from the right of the two variable names, and will choose to eliminate the variable with the shortest remaining name string, taking eliminating the left hand side variable if the strings are of equal length
(this is a heuristic).
If the variables are the same then the assumption is just discarded with no further effect.

$all\_var\_elim\_asm\_tac$ will first extract
all the goal's assumptions, holding them in a ``pool''.
It will examine each assumption of the required form in turn, starting at the assumptions from the head of the assumption list.
To eliminate a variable $var$ using an assumption it requires that the $value$ to which it is equated is also a variable, or an isolated constant
(this is more restrictive than $var\_elim\_asm\_tac$).
All the occurrences of the variable will be eliminated from the rest of the assumptions in the pool,
and from the conclusion of the goal, and the assumption discarded from the pool.
Each of the assumptions in the pool will be examined once,
as the process described so far will only exceptionally introduce new equations that can be used for variable elimination.

Finally, the remaining assumptions in the pool will be returned to the
goal's assumption list - if an individual assumption is unchanged then it
will be returned by $check\_asm\_tac$, otherwise it will be stripped
back into the assumption list by $strip\_asm\_tac$.
This stripping may result in further possible variable eliminations being enabled,
and indeed certain fairly unlikely combinations of assumptions and proof contexts may result in
=INLINEFT
REPEAT all_var_elim_asm_tac
=TEX
{} not halting.
$ALL\_VAR\_ELIM\_ASM\_T$ allows the users choice of function to be applied to the modified assumptions, rather than $strip\_asm\_tac$.

$all\_var\_elim\_asm\_tac1$ works as $all\_var\_elim\_asm\_tac$, except that an assumption will be used to eliminate
a variable $var$ if the $value$ to which it is equated does not contain $var$ free (i.e. its requirement is as $var\_elim\_asm\_tac$).
$ALL\_VAR\_ELIM\_ASM\_T1$ allows the users choice of function to be applied to the modified assumptions.

All the functions fail if they find no assumptions that
can be used to eliminate variables.
=USES
General purpose, and in $basic\_prove\_tac$.
=SEEALSO
$prop\_eq\_prove\_tac$ for more sophisticated approach to these kinds of
problems.
=FAILURE
29028	This tactic is unable to eliminate any variable
=ENDDOC
An example of infinite looping using $REPEAT$ and the above is when the proof context
contains the stripping rule:
=GFT
⊢ p 0 = ∃ v ⦁ v = 0 ∧ p v
=TEX
and there are two assumptions:
=GFT
⌜v = 0⌝,
⌜p v⌝
=TEX
Each application of $all\_var\_elim\_asm\_tac$ will recreate the original goal.

\section{TACTICALS}
=DOC
val ⦏THEN_T1⦎ : (TACTIC * TACTIC) -> TACTIC;
val ⦏THEN1⦎ : (TACTIC * TACTIC) -> TACTIC;
=DESCRIBE
$THEN\_T1$ is a tactical used as an infix operator.
$tac1$ $THEN\_T1$ $tac2$ is the tactic that applies $tac1$
and then applies $tac2$ to the first of the resulting subgoals
and $id\_tac$ to any other subgoals.
If $tac1$ returns no subgoals, then nor will $tac1$ $THEN\_T1$ $tac2$.
$THEN1$ is an alias for $THEN\_T1$.

It is intended for use in conjunction with induction tactics or
tactics like $lemma\_tac$ for which the first subgoal (i.e., the base
case of the induction or the lemma) often has a simple proof.
=SEEALSO
$THEN$
=FAILUREC
\paragraph{Errors}
As the errors of $tac1$ and $tac2$.
=ENDDOC

\section{CONVERSIONS}
=DOC
val ⦏¬_in_conv⦎ : CONV;
=DESCRIBE
This is a conversion which moves a top level negation inside other predicate
calculus connectives using whichever one of the following rules applies:
=GFT
		¬¬t			=	 t
		¬(t1 ∧ t2)		=	 ¬t1 ∨ ¬t2
		¬(t1 ∨ t2)		=	 ¬t1 ∧ ¬t2
		¬(t1 ⇒ t2)		=	 t1 ∧ ¬t2
		¬(t1 ⇔ t2)		=	 (t1 ∧ ¬t2) ∨ (t2 ∧ ¬t1)
		¬(if a then t1 else t2)
					=	 (if a then ¬t1 else ¬t2)
		¬∀vs⦁t			=	 ∃vs⦁¬t
		¬∃vs⦁t			=	 ∀vs⦁¬t
		¬∃⋎1vs⦁t	=	 ∀vs⦁¬(t ∧ ∀vs'⦁t[vs'] ⇒ vs' = vs)
		¬T			=	 F
		¬F			=	 T
=TEX
=USES
Tactic and conversion programming.
=SEEALSO
$simple\_¬\_in\_conv$, $¬\_in\_tac$
=FAILURE
28131	No applicable rules for the term ?0
=ENDDOC
\section{CANONICALISATION}
=DOC
val ⦏¬_rewrite_canon⦎ : THM -> THM list
val ⦏∀_rewrite_canon⦎ : THM -> THM list
=DESCRIBE
These are some of the standard canonicalisation functions used for breaking theorems up into
lists of equations for use in rewriting. They four perform the following
transformations:
=GFT
¬_rewrite_canon		(Γ ⊢ ¬(t1 ∨ t2))	= (Γ ⊢ ¬t1 ∧ ¬t2)	
¬_rewrite_canon		(Γ ⊢ ¬∃vs⦁t)		= (Γ ⊢ ∀vs⦁¬t)	
¬_rewrite_canon		(Γ ⊢ ¬¬t)		= (Γ ⊢ t)	
¬_rewrite_canon		(Γ ⊢ ¬t)		= (Γ ⊢ t ⇔ F)	
∀_rewrite_canon		(Γ ⊢ ∀vs⦁t)		= Γ ⊢ t
=TEX

=SEEALSO
$simple\_¬\_rewrite\_canon$, $simple\_∀\_rewrite\_canon$.
=FAILURE
26201	Failed as requested
=FAILUREC
The area given by the failure will be $fail\_canon$.
=ENDDOC

=DOC
val ⦏pair_rw_canon⦎ : CANON;
=DESCRIBE
This is the rewrite canonicalisation function for the theory of pairs,
defined as
=GFT
val pair_rw_canon =
	REWRITE_CAN
	(REPEAT_CAN(FIRST_CAN [
	∀_rewrite_canon,
	∧_rewrite_canon,
	¬_rewrite_canon,
	f_rewrite_canon,
	⇔_t_rewrite_canon]));
=TEX
This is the repeated application of the first applicable
operation in the following list:
\begin{enumerate}
\item
stripping universal quantifiers (paired or simple);
\item
dividing conjunctive theorems into their conjuncts;
\item
changing $⊢¬(t1 ∨ t2)$ to $¬t1 ∧ ¬t2$;
\item
changing $⊢¬∃vs⦁t$ to $∀vs⦁¬t$;
\item
changing $⊢¬¬t$ to $t ⇔ F$;
\item
changing $⊢¬t$ to $t ⇔ F$;
\item
if none of the above apply, changing $⊢t$ to $⊢t ⇔ T$.
\end{enumerate}

Finally, after all this canonicalisation we then universally quantify
the resulting theorems in all free variables other than those
that were free in the original.
=ENDDOC
\section{END OF THE SIGNATURE}
=SML
end; (* signature of Tactics3 *)
=TEX
\section{TEST POLICY}
The functions in this document should be tested as described in
\cite{DS/FMU/IED/PLN008}.
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}

=IGN
open Sort;
fun sf {id = id1,text = text1} {id = id2,text = text2} = (
	if text1 <> text2
	then string_order text1 text2
	else (id1 - id2)
);

sort sf (get_error_messages());


set_goal([], ⌜
∀p⦁p{} ∧ (∀x⦁p{x}) ∧ (∀a1 a2⦁a1 ∈ Finite ∧ a2 ∈ Finite ∧ p a1 ∧ p a2 ⇒ p (a1 ∪ a2))
	⇒ (∀a⦁a ∈ Finite ⇒ p a)
⌝);
a(REPEAT_N 3 strip_tac);
a(fin_set_induction_tac);
a(strip_tac);
a(asm_fc_tac[]);
a(once_rewrite_tac[pc_rule1"hol1"prove_rule[]⌜∀a b⦁a ∪ b = b ∪ a⌝]);
a(strip_asm_tac(rewrite_rule[](fc_rule[fin_set_thm3][fin_set_thm2])));
a(strip_asm_tac(rewrite_rule[](hd(fc_rule[fin_set_thm3][fin_set_thm2]))));
a(asm_fc_tac[] THEN asm_fc_tac[]);
pop_thm();

=IGN
********************************************************************************
dtd027.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% dtd027.doc   ℤ $Date: 2011/02/11 16:38:44 $ $Revision: 1.34 $ $RCSfile: dtd027.doc,v $
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

\def\Title{Detailed Design of Derived Rules of Inference II}

\def\AbstractText{This document gives a detailed design for further derived rules of inference in ICL HOL, in particular those concerned with paired abstractions.}

\def\Reference{DS/FMU/IED/DTD027}

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
%% LaTeX2e port: \TPPtitle{Detailed Design of Derived Rules of Inference II}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Detailed Design of Derived Rules of Inference II}
%% LaTeX2e port: \TPPref{DS/FMU/IED/DTD027}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.34 $ %
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2011/02/11 16:38:44 $ %
%% LaTeX2e port: }}  %% Mandatory field
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.~Blackburn & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document gives a detailed design for further
%% LaTeX2e port: derived rules of inference in ICL HOL,
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
\item [Issue 1.1 (1991/06/03)]
First version.
\item [Issue 1.2 (1991/06/03)]
Fixed an error message.
\item [Issue 1.3 (1991/06/07)]
Gained inference rules about sets.
\item [Issue 1.4 (1991/06/27)]
Gained tautology material.
\item [Issue 1.5 (1991/10/10)]
Changes with a view to implementation,
and to reflect changes in \cite{DS/FMU/IED/DTD007} issue 2.1.
\item [Issue 1.6 (1991/10/16)]
Changes made during implementation.
\item [Issue 1.7 (1991/10/16)]
Changed name of signature.
\item [Issue 1.8 (1991/11/12)]
Changed $∃_1\_elim$.
Added $∃_1\_conv$, $varstruct\-\_variant$,
tidied up.
\item [Issue 1.9 (1991/11/18)]
Clarified $∀\_reorder\_conv$ and $∃\_reorder\_conv$

\item[Issue 1.10 (1992/01/20), \FormatDate{92/01/20} ] Updated to use new fonts.
\item[Issue 1.11 (1992/02/13),(13th February 1992)]
Moving material from 058 to 027.
\item [Issue 1.12 (1992/03/11) (11th March 1992)]
Fixing typos.
\item [Issue 1.13 (1992/03/18) (11th March 1992)]
Various minor additions and extensions.
\item [Issue 1.14 (1992/03/19)]
Removed percent keywords.
\item [Issue 1.15 (1992/04/01)]
Removed sets material.
\item [Issue 1.16 (1992/04/14) (13th April 1992)]
Changes due to CR0017.
\item [Issue 1.17 (1992/05/12) (11th May 1992)]
Made $∀\_elim$ matching.
\item[Issue 1.18 (1992/05/14) (14 May 1992)] Use correct quotation symbols.
\item [Issue 1.19 (1992/07/02) (2nd July 1992)]
Tidying text.
\item [Issue 1.20 (1992/07/30) (30 July 1992)]
Added forward chaining rules and minor mods to matching modus
ponens (to accomodate changes to the simple versions).
\item [Issue 1.21 (1992/08/10)] Changed $fc\_rule$ in light of comments on first version.
\item [Issue 1.22 (1992/08/20) (20th August 1992)]
Corrected typo.
\item [Issue 1.23 (1992/11/11) (11th November 1992)]
Added fancy variants on $fc\_canon$.
\item [Issue 1.24 (1993/02/16) (16th February 1993)]
Modified forward chaining.
\item [Issue 1.25 (1996/02/15))]
New forward chaining canon.
\item[Issue 1.26 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.27 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.28 (2003/01/09)] Fixed typo in description of
=INLINEFT
fc_⇔_canon
=TEX
.
\item[Issue 1.29 (2006/10/18)] Acted on pedantic comment on use of ε.
\item[Issue 1.30 (2008/08/06)] Added
=INLINEFT
λ_pair_conv
=TEX
.
\item[Issue 1.31 (2008/10/30)] Added
=INLINEFT
list_simple_∃_intro
=TEX
.
\item[Issue 1.32 (2011/02/05)--1.34 (2011/02/11)] Added {⇒\_match\_mp\_rule2}. Forward chaining is now
parameterised by a matching modus ponens rule in the proof context.
\item[Issue 1.35 (2012/03/19)] Added
=INLINEFT
λ_unpair_conv
=TEX
.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
None.
\section{GENERAL}
\subsection{Scope}
This document contains a detailed design for the
derived rules of inference concerning paired abstractions.
This is called for in \cite{DS/FMU/IED/HLD012}.
The design is
implemented in \cite{DS/FMU/IED/IMP027}.
\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains a detailed design for the
paired abstraction
derived rules of inference in Release 001 of ICL HOL,
as well as some further inference rules.

The document provides groups of rules of inference, related by their core operator.

All functions require all their arguments to begin evaluation,
unless otherwise noted.

Note also that the order of declaration given in this document will
not necessarily reflect the order of implementation in
\cite{DS/FMU/IED/IMP027}.

\subsubsection{Dependencies}
Loading this document is dependent on those
files indicated as preceding it in the ICL HOL release 001 makefile.

This document places requirements upon the constants handled by the
inference rules discussed.
In summary, the requirements are that the definitions of the constants must be such that the designs of the rules are satisfiable.
\subsubsection{Deficiencies}
The coverage of some of the material provided is uneven.
This is the result of those functions being a toolbox to achieve
a particular goal.
.
\subsubsection{Possible Enhancements}
None known.
\subsubsection{Terminology}
We use ``varstruct'' or ``(allowed) variable structure (in ICL HOL syntax)'' to indicate terms that
satisfy the concrete syntax rule for $V$  (see \cite{DS/FMU/IED/DEF001}),
i.e. the kind of terms that may be
bound in an abstraction.
They are formed from variables by pairing: a simple variable is one example of a ``varstruct''.
\section{THE DERIVED RULES OF REASONING}
=DOC
signature ⦏DerivedRules2⦎ = sig
=DESCRIBE
This provides the further derived rules of inference for ICL HOL.
They are primarily concerned with handling paired abstractions.
=ENDDOC
\subsection{Tools For Variable Structures}
=DOC
val ⦏varstruct_variant⦎ : TERM list -> TERM -> TERM;
=DESCRIBE
$varstruct\_variant$ $avoid$ $vs$ will recreate the variable structure $vs$ using only names that are not found in the
$avoid$ list of variables, and also renaming to avoid
duplicate variable names in the structure.
Variant names are found using $string\_variant$ (q.v.).
If there are duplicates to be renamed, then the original
name will be the rightmost in the variable structure.
=FAILURE
3007	?0 is not a term variable
4016	?0 is not an allowed variable structure
=FAILUREC
Message 3007 applies to the avoid list, 27060 to the variable
structure.
=ENDDOC
\subsection{Concerning ∧ and ∨}
=DOC
val ⦏ALL_∧_C⦎ : CONV -> CONV;
val ⦏ALL_∨_C⦎ : CONV -> CONV;
=DESCRIBE
These respectively apply their conversion argument to:
\begin{itemize}
\item
All the conjuncts of a structure of conjuncts (including a term that is not a conjunct at all)
failing only if the conversion fails for all the conjuncts.
\item
All the disjuncts of a structure of disjuncts (including a term that is not a disjunct at all)
failing only if the conversion fails for all the disjuncts.
\end{itemize}
The result is simplified at any conjunct
or disjunct where at least one branch had a successful
application of the conversion and matches the appropriate theorems of:
=GFT
⊢ ∀ t⦁ (T ∧ t ⇔ t) ∧ (t ∧ T ⇔ t) ∧ ¬ (F ∧ t) ∧ ¬ (t ∧ F) ∧ (t ∧ t ⇔ t)

⊢ ∀ t⦁ (T ∨ t) ∧ (t ∨ T) ∧ (F ∨ t ⇔ t) ∧ (t ∨ F ⇔ t) ∧ (t ∨ t ⇔ t)
=TEX
=FAILUREC
\paragraph{Errors}
As the failure of the conversion argument.
=ENDDOC

\subsection{Concerning ⇒}
=DOC
val ⦏⇒_match_mp_rule⦎ : THM -> THM -> THM ;
=DESCRIBE
A matching Modus Ponens rule for an implicative theorem.
=FRULE 1 Rule
⇒_match_mp_rule
├
Γ1 ⊢ ∀ x1 ...⦁ t1 ⇒ t2; Γ2 ⊢ t1'
├
Γ1' ∪ Γ2 ⊢ t2'
=TEX
where we type instantiate, generalise and specialise
to get the first theorem's antecedent to match the conclusion of the
second theorem.
Universal quantification, or the lack of it, in the first theorem makes no difference to the matching.

This may be partially evaluated with only the first argument.
=SEEALSO
$⇒\_match\_mp\_rule1$, $⇒\_elim$
=FAILURE
7044	Cannot match ?0 and ?1
=ENDDOC
=DOC
val ⦏⇒_match_mp_rule1⦎ : THM -> THM -> THM ;
val ⦏⇒_match_mp_rule2⦎ : THM -> THM -> THM ;
=DESCRIBE
Two variants of a matching Modus Ponens rule for an implicative theorem.
=FRULE 1 Rule
⇒_match_mp_rule
├
Γ1 ⊢ ∀ x1 ...⦁ t1 ⇒ t2; Γ2 ⊢ t1'
├
Γ1 ∪ Γ2 ⊢ t2'
=TEX
where $t1'$ is an instance of $t1$ under type instantiation
and substitution for the $x⋎i$ and the free variables of the
first theorem, and where $t2'$
is the corresponding instance of $t2$.
The type instantiations and
substitutions are obtained by matching $t1$ and $t1'$ using
$term\_match$.


=INLINEFT
⇒_match_mp_rule2
=TEX
\ is just like
=INLINEFT
⇒_match_mp_rule1
=TEX
\ except that the instantiations and substitutions returned by
$term\_match$ are extended to replace type variables that do not
occur in $t1$ or in
=INLINEFT
Γ1
=TEX
\ and $x_i$
that do not occur free in $t1$ by fresh variables to avoid clashes with each other and with the
type variables and free variables of
=INLINEFT
Γ1
=TEX
\ and
=INLINEFT
Γ2
=TEX
.

Types in the assumptions of the theorems will not be instantiated.


Both rules may be partially evaluated with only the first argument.
=FAILURE
7044	Cannot match ?0 and ?1
7045	?0 is not of the form `Γ ⊢ ∀ x1 ... xn ⦁ u ⇒ v`
=ENDDOC
=DOC
val ⦏forward_chain_rule⦎ : THM list -> THM list -> THM list;
val ⦏fc_rule⦎ : THM list -> THM list -> THM list;

=DESCRIBE
This is a rule which uses a list of possibly universally
quantified implications and a list of
other theorems to infer new theorems, using the matching modus ponens
rule from the proof context, if present, or
=INLINEFT
⇒_match_mp_rule2
=TEX
if
=INLINEFT
current_ad_mmp_rule()
=TEX
\ returns $Nil$.
(%
=INLINEFT
fc_rule
=TEX
\ is an alias for
=INLINEFT
forward_chain_rule
=TEX
.)
=INLINEFT
fc_rule imps ants
=TEX
\ returns the list of all theorems which may be derived by
applying the matching modus ponens rule to a theorem from $imps$ and one from $ants$.
As a special case, if any theorem to be returned is determined
to have $⌜F⌝$ as its conclusion, the first such found wil be returned as a singleton list.
In order to work well in conjunction with
=INLINEFT
fc_canon
=TEX
\ and
=INLINEFT
fc_tac
=TEX
\ the theorems returned by the matching modus ponens rule are transformed as follows:

\begin{enumerate}
\item
Theorems of the form:
=INLINEFT
⊢ ∀ x⋎1 ...⦁ t⋎1 ⇒ t⋎2 ⇒ ... ⇒ ¬t⋎k ⇒ F
=TEX
\ have their final implication changed to
=INLINEFT
t⋎k
=TEX
.
\item
Theorems of the form:
=INLINEFT
⊢ ∀ x⋎1 ...⦁ t⋎1 ⇒ t⋎2 ⇒ ... ⇒ t⋎k ⇒ F
=TEX
\ have their final implication changed to
=INLINEFT
⇒\¬t⋎k
=TEX
.
\item
All theorems are universally quantified over all the variables which
appear free in their conclusions but not in their assumptions
(using
=INLINEFT
all_∀_intro
=TEX
).
\end{enumerate}
Note that when the matching modus ponens rule is either
=INLINEFT
⇒_match_mp_rule2
=TEX
\ or
=INLINEFT
⇒_match_mp_rule1
=TEX
, there is some control over the number of results generated, since
variables which appear free in $imps$ are not considered as candidates
for instantiation.

The rule does not check that the theorems in its first argument
are (possible universally) quantified implications.
=SEEALSO
$forward\_chain\_tac$, $forward\_chain\_canon$.
=ENDDOC

=DOC
val ⦏FORWARD_CHAIN_CAN⦎ : CANON list -> CANON;
val ⦏FC_CAN⦎ : CANON list -> CANON;
=DESCRIBE
=INLINEFT
FORWARD_CHAIN_CAN
=TEX
, which has the alias
=INLINEFT
FC_CAN
=TEX
, is a parameterised variant of
=INLINEFT
fc_canon
=TEX
. Given a list of canonicalisation functions $cans$,
=INLINEFT
FC_CAN cans
=TEX
\ behaves as
=INLINEFT
fc_canon
=TEX
\ would do if the line
=GFT
⊢ A		→	FIRST_CAN cans A
=TEX
were inserted at the beginning of the table of transformations given
in the description of
=INLINEFT
fc_canon
=TEX
.

For example,
=INLINEFT
fc_canon1
=TEX
, q.v., is the same as:

=GFT
	FC_CAN ((fn (x, y) => [x,y]) o ⇔_elim);
=TEX
=USES
In tactic programming, or, occasionally interactively, typically in
circumstances where neither
=INLINEFT
fc_canon
=TEX
\ nor
=INLINEFT
fc_canon1
=TEX
\ is able to generate enough implications.
=ENDDOC

=DOC
val ⦏forward_chain_canon⦎ : THM -> THM list;
val ⦏fc_canon⦎ : THM -> THM list;
val ⦏forward_chain_canon1⦎ : THM -> THM list;
val ⦏fc_canon1⦎ : THM -> THM list;
=DESCRIBE
=INLINEFT
forward_chain_canon
=TEX
\ is a canonicalisation function which uses a theorem
to generate a list of
implications. (%
=INLINEFT
fc_canon
=TEX
\ is an alias for
=INLINEFT
forward_chain_canon
=TEX
.)
It may be used for constructing rules and tactics in conjunction
with
=INLINEFT
forward_chain_rule
=TEX
.
An example of such a tactic is
=INLINEFT
forward_chain_tac
=TEX
.
=INLINEFT
forward_chain_canon1
=TEX
, which has alias
=INLINEFT
fc_canon1
=TEX
, is just like
=INLINEFT
fc_canon
=TEX
\ except for its treatment of bi-implications.
The effects of
=INLINEFT
fc_canon
=TEX
\ and
=INLINEFT
fc_canon1
=TEX
\ are shown schematically in the following table (which only
shows assumptions relevant to the process):

=GFT
⊢ A ∧ B		→	⊢ A ; ⊢ B
⊢ ∀x⦁A		→	⊢ A[x'/x]
⊢ A ∧ B ⇒ C	→	map (⇒_intro (st⌜A⌝)) (xf( st⌜A⌝ ⊢ B ⇒ C ))
⊢ A ∨ B ⇒ C	→	xf( ⊢ (A ⇒ C) ∧ (B ⇒ C) )
⊢ (∃x⦁A) ⇒ C	→	map (∀_intro ⌜x'⌝) (xf( ⊢ A[x'/x] ⇒ B ))
A ⊢ A ⇒ B		→	A ⊢ B
⊢ T ⇒ B		→	⊢ B
A ⊢ ¬A ⇒ B		→	(* discarded *)
⊢ F ⇒ B		→	(* discarded *)
⊢ A ⇒ B		→	map (⇒_intro (st⌜A⌝)) (xf( st⌜A⌝ ⊢ B ))
⊢ A ⇔ B		→	⊢ A ⇒ B			(* fc_canon *)
⊢ A ⇔ B		→	⊢ A ⇒ B; ⊢ B ⇒ A		(* fc_canon1 *)
⊢ T			→	(* discarded *)
⊢ A			→	⊢ sc⌜A⌝
⊢ A			→	⊢ ¬A ⇒ F
=TEX

The intention here is that
is that the first applicable transformation is applied repeatedly
until no further change is possible. The resulting theorems are
then universally quantified over
all of the free variables in their conclusions which were not free
in the original theorem.
In the table, $st$ and $sc$ stand for attempts to apply the
theorem and conclusion stripping conversions in the current proof context
(as returned by
=INLINEFT
current_ad_st_conv
=TEX
\ and
=INLINEFT
current_ad_sc_conv
=TEX
). If the stripping conversions fail then $st$ and $sc$ have no effect.
$x'$ denotes a variable name derived from $x$ and
chosen to avoid variable capture problems.
$xf$ stands for a nested recursive application of the transformation process.

In the transformations involving
=INLINEFT
⇒_intro
=TEX
\ the implication is only introduced if the antecedent is in the assumptions.
So, for example,
=INLINEFT
A ⇒ B ⇒ A ⇒ C
=TEX
\ is transformed into
=INLINEFT
B ⇒ A ⇒ C
=TEX
.
The transformation for
=INLINEFT
A ⇒ B
=TEX
\ is only applied if it changes the theorem, and the last of the
transformations is only applied if $A$ is neither an implication nor $F$.

The asymmetry in the rules is deliberate.
E.g., they derive
=INLINEFT
A ⇒ B ⇒ C
=TEX
\ from
=INLINEFT
A ∧ B ⇒ C
=TEX
, but not
=INLINEFT
B ⇒ A ⇒ C
=TEX
. This is intended to give slightly finer control and to result
in less duplication of results in the intended application
in
=INLINEFT
forward_chain_tac
=TEX
 (q.v.).

=SEEALSO
$forward\_chain\_rule$, $forward\_chain\_tac$, $FC\_CAN$
=ENDDOC

=DOC
val ⦏FORWARD_CHAIN_⇔_CAN⦎ : CANON list -> CANON;
val ⦏FC_⇔_CAN⦎ : CANON list -> CANON;
=DESCRIBE
These are just like
=INLINEFT
FORWARD_CHAIN_CAN
=TEX
, q.v., except that they do {\em not} break up bi-implications.
Thus, given a list of canonicalisation functions $cans$,
=INLINEFT
FC_⇔_CAN cans
=TEX
\ behaves as
=INLINEFT
fc_canon
=TEX
\ would do if the line
=GFT
⊢ A		→	FIRST_CAN cans A
=TEX
were inserted at the beginning of the table of transformations given
in the description of
=INLINEFT
fc_canon
=TEX
 and all transformations (including those coming from the proof context) that eliminate bi-implications were suppressed.

=USES
In tactic programming, or, occasionally interactively, typically in
circumstances where
=INLINEFT
fc_⇔_canon
=TEX
\ is not able to generate enough implications.
=ENDDOC
=DOC
val ⦏forward_chain_⇔_canon⦎ : THM -> THM list;
val ⦏fc_⇔_canon⦎ : THM -> THM list;
=DESCRIBE
=INLINEFT
forward_chain_⇔_canon
=TEX
\ is a canonicalisation function very similar to
=INLINEFT
forward_chain_canon
=TEX
, q.v.
The difference is that
=INLINEFT
forward_chain_⇔_canon
=TEX
\ suppresses all transformations which break up bi-implications.
It is intended for use in situations where a bi-implication is to be used as a conditional rewrite rule.

For example, the tactic
=INLINEFT
ALL_ASM_FC_T1 fc_⇔_canon rewrite_tac []
=TEX
\ can instantiate an assumption of the form
=INLINEFT
∀x1 x2 ...⦁ A ⇒ B ⇒ (C ⇔ D)
=TEX
\ and use the result to rewrite instances of $C$.
=SEEALSO
$FC\_T1$, $ALL\_FC\_T1$ etc.
=ENDDOC

\subsection{Concerning ⇔}
=DOC
val ⦏⇔_match_mp_rule⦎ : THM -> THM -> THM;
=DESCRIBE
A matching Modus Ponens for $⇔$.
=FRULE 1 Rule
⇔_match_mp_rule
├
Γ1 ⊢ ∀ x1 ...⦁ t1 ⇔ t2; Γ2 ⊢ t1'
├
Γ1' ∪ Γ2 ⊢ t2'
=TEX
where we type instantiate, generalise and specialise
both conclusion and assumptions
to get the first theorem's LHS to match the conclusion of the
second theorem.
Universal quantification, or the lack of it, in the first theorem makes no difference to the matching.

This may be partially evaluated with only first argument.
=SEEALSO
$⇒\_elim$ (Modus Ponens on $⇒$),
$simple\_⇔\_match\-\_mp\_rule$
$⇔\-\_mp\-\_rule$
$⇔\-\_match\-\_mp\-\_rule1$
=FAILURE
7044	Cannot match ?0 and ?1
=ENDDOC
=DOC
val ⦏⇔_match_mp_rule1⦎ : THM -> THM -> THM;
=DESCRIBE
A matching Modus Ponens for $⇔$ that doesn't affect assumption lists.
=FRULE 1 Rule
⇔_match_mp_rule1
├
Γ1 ⊢ ∀ x1 ...⦁ t1 ⇔ t2; Γ2 ⊢ t1'
├
Γ1 ∪ Γ2 ⊢ t2'
=TEX
where $t1'$ is an instance of $t1$ under type instantiation
and substitution for the $x⋎i$ and the free variables of the
first theorem, and where $t2'$
is the corresponding instance of $t2$.
No type instantiation or substitution will occur in the assumptions of either
theorem.

This may be partially evaluated with only first argument.
=SEEALSO
$⇒\_elim$ (Modus Ponens on $⇒$),
$simple\_⇔\_match\_mp\_rule1$
=FAILURE
7044	Cannot match ?0 and ?1
7046	?0 is not of the form `Γ ⊢ ∀ x1 ... xn ⦁ u ⇔ v`
=ENDDOC

\subsection{Concerning =}
=DOC
val ⦏eq_match_conv⦎ : THM -> CONV ;
=DESCRIBE
This matches the LHS of an equational theorem to a term,
instantiating the RHS accordingly.
The equational theorem may be partially or fully universally quantified
(simple or by varstruct),
without affecting the result of the conversion.
=FRULE 1 Conversion
eq_match_conv
(Γ ⊢ ∀ ...⦁ u = v)
⌜t⌝
├
├
Γ ⊢ t = v'
=TEX
where $v'$ is the result of applying to $v$ the instantiation rules required to match $u$ to $t$
(including both term and type instantiation).
If there are free variables on the RHS of the supplied equational theorem (when stripped of all universal quantification)
they will be renamed as necessary to avoid identification with
any variables in $t$.

This conversion may be partially evaluated with only its theorem argument.
=SEEALSO
$eq\_match\_conv1$
=FAILURE
7044	Cannot match ?0 and ?1
=ENDDOC

=DOC
val ⦏eq_match_conv1⦎ : THM -> CONV ;
=DESCRIBE
This matches the LHS of an universally quantified (simple or by varstruct) equational theorem to a term,
instantiating the RHS accordingly.
The conversion will only instantiate its universal quantifications,
and type variables not found within the assumptions, not its free term variables.
=FRULE 1 Conversion
eq_match_conv1
(Γ ⊢ ∀ x1 ... xn⦁ u[x1,...,xn] =
   v[x1,...,xn])
⌜t⌝
├
├
Γ ⊢ t = v[t1,...,tn]
=TEX
where ⌜u[t1,...,tn]⌝ is $α$-convertible to ⌜t⌝.
If there are free variables on the RHS of the supplied equational theorem (when stripped of all universal quantification)
they will be renamed as necessary to avoid identification with
any variables in $t$.

This conversion may be partially evaluated with only its theorem argument.
=USES
In producing a limited rewriting facility, that only instantiates
explicitly identified variables.
=FAILURE
27003	?0 is not of the form `Γ ⊢ ∀ x1 ... xn⦁ u = v`
	where ⌜xi⌝ are varstructs
7076	Could not match term ?0 to LHS of theorem ?1
=ENDDOC
\subsection{Concerning λ}
=DOC
val ⦏β_rule⦎ : THM -> THM;
=DESCRIBE
An elimination rule for $λ$, which can handle paired abstractions.
=FRULE 1 Rule
β_rule
├
Γ ⊢ (λ x⦁ t[x]) y
├
Γ ⊢ t[y]
=TEX
=SEEALSO
$β\_conv$
=FAILURE
27007	?0 is not of the form: `Γ ⊢ (λ x⦁ t[x]) y`
	where ⌜x⌝ is a varstruct
=ENDDOC
=DOC
val ⦏β_conv⦎ : CONV;
=DESCRIBE
Apply a $β$-reduction to an abstraction.
=FRULE 1 Rule
β_conv
⌜(λ x⦁ t1[x])t2⌝
├
├
⊢ ((λ x⦁ t[x])y) = t'[y]
=TEX
where $x$ may be any varstruct allowed by the ICL HOL syntax,
$y$ is an instance of this structure,
and $t'$ is $α$-convertible to $t$, changed to avoid variable capture.

When the bound variable structure has a pair,
where the value applied to does not, then $Fst$ and $Snd$ are
introduced as necessary, e.g.:
=GFT Example
β_conv ⌜(λ (x,y)⦁ f x y) p⌝ =
	⊢ (λ (x,y)⦁ f x y) p = f (Fst p) (Snd p)
=TEX
=SEEALSO
$simple\_β\_conv$, $β\_rule$
=FAILURE
27008	?0 is not of the form: ⌜(λ x⦁ t1[x])t2⌝
	where ⌜x⌝ is a varstruct
=ENDDOC
=DOC
val ⦏all_β_conv⦎ : CONV;
=DESCRIBE
A conversion to eliminate all instances of $β$ redexes,
including paired abstraction redexes, in a term, regardless of nesting, or even that the $β$ redex was created as the result of
an earlier reduction in the conversion's evaluation.
=FRULE 1 Rule
all_β_conv
⌜t⌝
├
├
⊢ t = t'
=TEX
$t'$ is $t$ with all $β$ redexes reduced.
=USES
This uses an optimised term traversal algorithm, superior in speed
to the general term traversal algorithms used with conversions,
and should be used in preference to them and $β\_conv$.
=SEEALSO
$all\_simple\_β\_conv$ which only handles simple
$β$-redexes, but does a faster traversal if that is all that is required.
$all\_β\_rule$.
=FAILURE
27049	?0 contains no β-redexes
=ENDDOC
=DOC
val ⦏all_β_rule⦎ : THM -> THM;
=DESCRIBE
Eliminate all instances of $β$ redexes,
including paired abstraction redexes, in the conclusion of a theorem, regardless of nesting, or even that the $β$ redex was created as the result of
an earlier reduction in the rule's evaluation.
=FRULE 1 Rule
all_β_rule
├
Γ ⊢ t
├
Γ ⊢ t'
=TEX
$t'$ is $t$ with all $β$-redexes reduced.
=SEEALSO
$all\_β\_conv$ for the conversion.
$all\_simple\_β\_rule$ which only handles simple
$β$-redexes, but does a faster traversal if that is all that is required.
=FAILURE
27049	?0 contains no β-redexes
=ENDDOC
=DOC
val ⦏λ_eq_rule⦎ : TERM -> THM -> THM;
=DESCRIBE
Given an equational theorem, return the equation formed by abstracting the term argument (which must be an allowed variable structure) from both sides.
=FRULE 1 Rule
λ_eq_rule
⌜x⌝
├
Γ ⊢ t1[x] = t2[x]
├
Γ ⊢ (λ x⦁ t1[x]) = (λ x⦁ t2[x])
=TEX
=FAILURE
4016	?0 is not an allowed variable structure
6005	?0 occurs free in assumption list
6020	?0 is not of the form: `Γ ⊢ t1 = t2`
=ENDDOC
=DOC
val ⦏η_conv⦎ : CONV;
=DESCRIBE
The rule for $\eta$ conversion.
=FRULE 1 Conversion
η_conv
⌜λ vs⦁ t vs⌝
├
├
⊢ (λ vs⦁ t vs) = t
=TEX
where $t$ contains no free instances of the variables of varstruct $vs$.
=FAILURE
27018	?0 is not of the form: ⌜λ vs⦁ t vs'⌝
	where ⌜vs⌝ is a varstruct
27023	?0 is not of the form: ⌜λ vs⦁ t vs⌝ where ⌜t⌝ should not contain ⌜vs⌝
=ENDDOC
=DOC
val ⦏λ_varstruct_conv⦎ : TERM -> CONV;
=DESCRIBE
This conversion is a generalisation of $α\_conv$ allowing one to convert a $\lambda$-abstraction
into an equivalent $\lambda$-abstraction that differs only in the form of the varstruct and the corresponding use of $Fst$ in the $Snd$ in the body of the abstraction.
=FRULE 1 Rule
λ_varstruct_conv
⌜λ vs1[x1,y1,...]⦁ t[x1,y1,...]⌝
⌜λ vs2[x2,y2,...]⦁ t'[x2,y2,...]⌝
├
├
⊢ (λ vs2[x2,y2,...]⦁ t[x2,y2,...]) =
	(λ vs1[x1,y1,...]⦁ t'[x1,y1,...])
=TEX
Where the types of $vs1[x1,y1,...]$ and $vs2[x2,y2,...]$
are the same, and $t'$ and $t$ differ only in applications of $Fst$ and $Snd$ to the bound variables.

For example,

=FRULE 1 Rule
λ_varstruct_conv
⌜λ (a, b)⦁ a + b = 1⌝
⌜λ x⦁ Fst x + Snd x = 1⌝
├
├
⊢ ((λ x⦁ Fst x + Snd x = 1) =
	(λ (a, b)⦁ a + b = 1)
=TEX

=SEEALSO
$α\_conv$ for a more limited form of renaming.
=FAILURE
27050	Cannot prove equality of ?0 and ?1
=ENDDOC
This is implemented using two $β$-reductions, one for each term applied to the same machine-generated variable.
Worse, if a simple approach fails, it will attempt to pull $Fst$ and $Snd$ together by pure rewriting.
It is thus potentially not very fast.
=DOC
val ⦏λ_pair_conv⦎ : CONV;
=DESCRIBE
This conversion eliminates abstraction over simple variables of product type
in favour of abstraction over variable structures.
The bound variables of the resulting $\lambda$-abstraction do not have product types.
=FRULE 1 Rule
λ_pair_conv
⌜λ v:'a × 'b⦁ t⌝
├
├
⊢ (λ v⦁ t) =
(λ (v1, v2)⦁ t[(v1, v2)/v])
=TEX
=FRULE 1 Rule
λ_pair_conv
⌜λ (v, w):('a × 'b) × ('c × 'd)⦁ t⌝
├
├
⊢ (λ (v, w)⦁ t) =
(λ ((v1, v2), (w1, w2))⦁
	t[(v1, v2)/v, (w1, w2)/v])
=TEX
and so on.
=FAILURE
27055	The type of ?0 is not of the form σ × τ
=ENDDOC

=DOC
val ⦏λ_unpair_conv⦎ : CONV;
=DESCRIBE
This conversion eliminates abstraction over variable structures in favour of abstraction
over simple variables of product type.
The result is a simple $\lambda$-abstraction, i.e., it has a single bound variable.
=FRULE 1 Rule
λ_unpair_conv
⌜λ (v1, v2)⦁ t⌝
├
├
⊢ (λ (v1, v2)⦁ t) =
(λ v⦁ t'[Fst v/v1, Snd v/v2])
=TEX
=FRULE 1 Rule
λ_unpair_conv
⌜λ ((v1, v2), (w1, w2))⦁ t⌝
├
├
⊢ (λ ((v1, v2), (w1, w2))⦁ t) =
(λ v⦁
	t[Fst(Fst v)/v1, Snd(Fst v)/v2,
	  Fst(Snd v)/w1, Snd(Snd v)/w2])
=TEX
and so on.
The conversions fails if its argument is not a $\lambda$-abstraction or is a simple $\lambda$-abstraction.

The name of the new bound variable is obtained by concatenating the names of the bound variables
in the argument term and decorating the result as necessary to avoid variable capture.
=FAILURE
27056	?0 is already a simple λ-abstraction
=ENDDOC

\subsection{Concerning ∀}
=DOC
val ⦏∀_uncurry_conv⦎ : CONV;
=DESCRIBE
Convert a paired universally quantified term into
simple universal quantifications of the same term.
=FRULE 1 Conversion
∀_uncurry_conv
⌜∀ vs[x,y,...]⦁ f[x,y,...]⌝
├
├
Γ ⊢ ∀ vs[x,y,...]⦁ f[x,y,...] =
	∀ x y ...⦁ f[x,y,...]
=TEX
where $vs[x,y,...]$ is an allowed variable structure with
variables $x,y,...$.
It may not be a simple variable.
=SEEALSO
$λ\_varstruct\_conv$, $all\_∀\_uncurry\_conv$.
=FAILURE
27038	?0 is not of the form: ⌜∀ (x,y)⦁ f⌝
=ENDDOC
=DOC
val ⦏all_∀_uncurry_conv⦎ : CONV;
=DESCRIBE
Apply $∀\_uncurry\_conv$ (q.v.) to the outer universal
quantifications of a term,
flattening those binders.
=FRULE 1 Conversion
all_∀_uncurry_conv
⌜∀ vs1[x1,y1,...] vs2[x2,y2,...] ...⦁
	f[x1,y1,...,x2,y2,...]⌝
├
├
Γ ⊢ (∀ vs1[x,y,...] vs2[x,y,...] ...⦁
	f[x1,y1,...,x2,y2,...])
 = (∀ x1 y1 ... x2 y2 ...⦁
	f[x1,y1,...,x2,y2,...])
=TEX
where the $vs_i[x_i,y_i,...]$ are variable structures
at least one of which must not be a simple variable,
built from variables $x_i,y_i,...$,
=FAILURE
27041	?0 is not of the form: ⌜∀ ... (x,y) ...⦁ f⌝
=ENDDOC
=DOC
val ⦏∀_intro⦎ : TERM -> THM -> THM;
=DESCRIBE
Introduce a universally quantified theorem.
=FRULE 1 Rule
∀_intro
⌜x⌝
├
Γ ⊢ t
├
Γ ⊢ ∀ x'⦁ t
=TEX
Where $⌜x'⌝$ is an allowed variable structure based on $⌜x⌝$, but with
duplicate variables renamed, the original name being rightmost in the resulting variable structure.
=SEEALSO
$list\_∀\_intro$, $all\_∀\_intro$.
=FAILURE
4016	?0 is not an allowed variable structure
6005	?0 occurs free in assumption list
=ENDDOC
=DOC
val ⦏∀_elim⦎ : TERM -> THM -> THM;
=DESCRIBE
Specialise a universally quantified theorem with a given value, instantiating the type of the theorem as necessary.
=FRULE 1 Rule
∀_elim
⌜t1⌝
├
Γ ⊢ ∀ x⦁ t2[x]
├
Γ ⊢ t2'[t1]
=TEX
where $t2'$ is renamed from $t2$ to prevent bound variable capture and possibly type instantiated,
and $x$ is a varstruct, instantiable to the structure of $t1$.
The value $t1$ will be expanded using $Fst$ and $Snd$ as necessary to match
the structure of $⌜x⌝$.
=SEEALSO
$list\_∀\_elim$, $all\_∀\_elim$.
=FAILURE
27011	?0 is not of the form: `Γ ⊢ ∀ x⦁ t` where ⌜x⌝ is a varstruct
27012	?0 is not of the form: `Γ ⊢ ∀ x⦁ t` where the type of ⌜x⌝
	is instantiable to the type of ?1
27013	?0 is not of the form: `Γ ⊢ ∀ x⦁ t` where the type of ⌜x⌝
	is instantiable to the type of ?1 without instantiating
	type variables in the assumptions
=ENDDOC
=DOC
val ⦏list_∀_intro⦎ : TERM list -> THM -> THM;
=DESCRIBE
Generalised $∀$ introduction.
=FRULE 1 Rule
list_∀_intro
[⌜x1⌝, ..., ⌜xn⌝]
├
Γ ⊢ t[x1, ..., xn]
├
Γ ⊢ ∀ x1 ... xn⦁ t[x1, ..., xn]
=TEX
=SEEALSO
$∀\_intro$, $all\_∀\_intro$.
=FAILUREC
\paragraph{Errors}
Same messages as $∀\_intro$.
=ENDDOC
=DOC
val ⦏list_∀_elim⦎ : TERM list -> THM -> THM;
=DESCRIBE
Generalised $∀$ elimination.
Specialise a universally quantified theorem with given values, instantiating the types of the theorem as necessary.
=FRULE 1 Rule
list_∀_elim
[⌜t1⌝, ..., ⌜tn⌝]
├
Γ ⊢ ∀ x1 ... xn⦁ t[x1, ..., xn]
├
t'[t1, ..., tn]
=TEX
where $t'$ is renamed from $t$ to prevent bound variable capture and type instantiated as necessary,
the $x_i$ are varstructs, instantiable to the structures of $t_i$.
The values will be expanded using $Fst$ and $Snd$ as necessary to match
the structure of $⌜x⌝$.

Note that due to the type instantiation this function is somewhat
more that a $fold$ of $∀\_elim$.
=SEEALSO
$∀\_elim$, $all\_∀\_elim$.
=FAILURE
27014	?0 is not of the form: `Γ ⊢ ∀ vs1 ... vsi ⦁ t` where
	i ≥ ?1
27015	?0 is not of the form: `Γ ⊢ ∀ vs1 ... vsi ⦁ t` where the types of the vsi
	are instantiable to the types of ?1
27016	?0 is not of the form: `Γ ⊢ ∀ vs1 ... vsi ⦁ t` where the types of the vsi
	are instantiable to the types of ?1 without instantiating
	type variables in the assumptions
=ENDDOC
The following is a design error caused by a check being passed by
that should have stopped processing:
=FAILURE
27017	DESIGN ERROR: counting arguments
=TEX
=DOC
val ⦏all_∀_elim⦎ : THM -> THM;
=DESCRIBE
Specialises all the outer universal quantifications in a theorem:
=FRULE 1 Rule
all_∀_elim
├
Γ ⊢ ∀ x1 ... xn⦁ t[x1, ..., xn]
├
Γ ⊢ t[x1', ..., xn']
=TEX
where $x1', \ldots, xn'$ are renamed from $x1, \ldots, xn$ as necessary to avoid name clashes with
free variables in the assumption list.
=SEEALSO
$all\_∀\_arb\_elim$ which is faster, though the results are
slightly opaque.
$list\_∀\_elim$.
=ENDDOC
=DOC
val ⦏¬_∀_conv⦎ : CONV;
=DESCRIBE
Move $¬$ into a $∀$ construct.
=FRULE 1 Rule
¬_∀_conv
⌜¬ (∀ x⦁ t[x])⌝
├
├
⊢ (¬ (∀ x⦁ t[x])) ⇔ ∃ x⦁ ¬ t[x]
=TEX
=SEEALSO
$¬\_simple\_∀\_conv$ which only works with simple $∀$-abstractions, $¬\_∃\_conv$
=FAILURE
27019	?0 not of the form: ⌜¬ (∀ x⦁ t[x])⌝
	where ⌜x⌝ is a varstruct
=ENDDOC
=DOC
val ⦏∀_⇔_rule⦎ : TERM -> THM -> THM;
=DESCRIBE
Universally quantify a variable on both sides of an equivalence.
=FRULE 1 Rule
∀_⇔_rule
⌜x⌝
├
Γ ⊢ p[x] ⇔ q[x]
├
Γ ⊢ (∀ x⦁ p[x]) ⇔ (∀ x⦁ q[x])
=TEX
where $x$ is a varstruct.
=FAILURE
6005	?0 occurs free in assumption list
6020	?0 is not of the form: `Γ ⊢ t1 = t2`
7062	?0 is not of the form: `Γ ⊢ t1 ⇔ t2`
4016	?0 is not an allowed variable structure
=ENDDOC
=DOC
val ⦏∀_arb_elim⦎ : THM -> THM;
=DESCRIBE
Specialise a universally quantified theorem with a machine generated variable or variable structure.
=FRULE 1 Rule
∀_arb_elim
├
Γ ⊢ ∀ vs[x,y,...]⦁ p[x,y,...]
├
Γ ⊢ p[x',y',...]
=TEX
where $x'$, $y'$, etc, are not variables (free or bound) in $p$ or $Γ$,
created by $gen\_vars$(q.v.).
=SEEALSO
$∀\_elim$
=FAILURE
27011	?0 is not of the form: `Γ ⊢ ∀ x⦁ t` where ⌜x⌝ is a varstruct
=ENDDOC
=DOC
val ⦏all_∀_arb_elim⦎ : THM -> THM;
=DESCRIBE
Specialise all the quantifiers of a possibly universally quantified theorem with a machine generated variables or variable structures.
=FRULE 1 Rule
∀_arb_elim
├
Γ ⊢ ∀ vs1[x1,y1,...] vs2[x2,y2,...] ...⦁
	p[x1,y1,....x2,y2,...]
├
Γ ⊢ p[x1',y1',...,x2',y2',...]
=TEX
where $x_i'$, $y_i'$, etc, are not variables (free or bound) in $p$ or $Γ$,
created by $gen\_vars$(q.v.).
=SEEALSO
$all\_∀\_elim$
=ENDDOC
The precise rules for the name formation of $x$ will not be given here.
=DOC
val ⦏∀_asm_rule⦎ : TERM -> TERM -> THM -> THM;
=DESCRIBE
Generalise an assumption (Left $∀$ introduction).
=FRULE 1 Rule
∀_asm_rule
⌜x⌝
⌜p[x]⌝
├
Γ, p'[x] ⊢ q[x]
├
Γ, ∀ x⦁ p'[x] ⊢ q[x]
=TEX
where $p$ and $p'$ are $α$-convertible.
$x$ {\bf may} be free in $Γ$.
The function will work even if $p'[x]$ is not present
in the assumption list.
=FAILURE
4016	?0 is not an allowed variable structure
=ENDDOC
This is from \cite{Manna74}.
=DOC
val ⦏∀_reorder_conv⦎ : TERM -> CONV;
=DESCRIBE
Reorder universal quantifications.
=FRULE 1 Rule
∀_reorder_conv
⌜∀ x1 .. xn⦁ t1⌝
⌜∀ y1 .. ym⦁ t2⌝
├
├
(∀ y1 .. ym⦁ t2) ⇔ (∀ x1 .. xn⦁ t1)
=TEX
where the $x_i$ and $y_i$ are varstructs,
and the reordering, restructuring (by pairing) and renaming requested is provable by this function.
The presence of redundant quantifiers, including duplicates, is also handled.
=EXAMPLE
:> ∀_reorder_conv ⌜∀ (x,q) z⦁ x ∧ z⌝ ⌜∀ (z,z,y) x⦁ x ∧ z⌝;
val it = ⊢ (∀ (z, z, y) x⦁ x ∧ z) ⇔ (∀ (x, q) z⦁ x ∧ z) : THM
Note that before more sophisticated attempts, the conversion
will try $α\_conv$ on the two term arguments.
=SEEALSO
$∃\_reorder\_conv$
=FAILURE
27050	Cannot prove equality of ?0 and ?1
=ENDDOC

We do not give a rule for $∀∀$ introduction from \cite{Manna74}.
=DOC
val ⦏ALL_SIMPLE_∀_C⦎ : CONV -> CONV;
=DESCRIBE
This conversional applies its conversion argument to the body of a repeated simple universal quantification.
=FAILUREC
\paragraph{Errors}
As the failure of the conversion argument.
=ENDDOC
=DOC
val ⦏simple_∀_∃_conv⦎: CONV;
=DESCRIBE
Swap the order of a simple $∀$ and $∃$:
=FRULE 1 Conversion
simple_∀_∃_conv
⌜∀ x⦁ ∃ y⦁ P[x,y]⌝
├
├
⊢ (∀ x⦁ ∃ y⦁ P[x,y]) ⇔
	(∃ y'⦁ ∀ x⦁ P[x, y' x])
=TEX
where $y'$ is renamed to distinguish it from $y$ (for the types differ) and every other term variable in the argument.
=FAILURE
27031	?0 is not of the form: ⌜∀ x⦁ ∃ y⦁ P[x,y]⌝
=ENDDOC
=DOC
val ⦏simple_∃_∀_conv⦎: CONV;
=DESCRIBE
Swap the order of a simple $∃$ and $∀$:
=FRULE 1 Conversion
simple_∃_∀_conv
⌜∃ x⦁ ∀ y⦁ P[x,y]⌝
├
├
⊢ (∃ x⦁ ∀ y⦁ P[x,y]) ⇔
	(∀ y'⦁ ∃ x⦁ P[x, y' x])
=TEX
where $y'$ is renamed to distinguish it from $y$ (for the types differ) and every other term variable in the argument.
=FAILURE
27032	?0 is not of the form: ⌜∃ x⦁ ∀ y⦁ P[x,y]⌝
=ENDDOC
=DOC
val ⦏simple_∃_∀_conv1⦎: CONV;
=DESCRIBE
Swap the order of a simple $∃$ and $∀$, where the first variable is always applied to the second:
=FRULE 1 Conversion
simple_∃_∀_conv1
⌜∃ f⦁ ∀ x⦁ P[f x, x]⌝
├
├
(∃ f⦁ ∀ x⦁ P[f x, x]) ⇔
 (∀ x⦁ ∃ f'⦁ P[f', x])
=TEX
where $f'$ is renamed to distinguish it from $f$ (for the types differ) and every other term variable in the argument.
=FAILURE
27033	?0 is not of the form: ⌜∃ f⦁ ∀ x⦁ P[f x,x]⌝
=ENDDOC
There is a potential design error in these two functions,
that is checked for ``just in case''.
=FAILURE
27034	DESIGN ERROR: resulting theorem for ?0 could not
	be coerced to correct LHS
=TEX

\subsection{Concerning ∃}
=DOC
val ⦏v_∃_intro⦎ : TERM -> THM -> THM ;
=DESCRIBE
Introduce an existential quantified variable structure into a theorem.
=FRULE 1 Rule
v_∃_intro
⌜vs[x,y,...]⌝
├
Γ ⊢ t[x,y,...]
├
Γ ⊢ ∃ vs[x,y,...]⦁ t[x,y,...]
=TEX
where ⌜vs[x,y,...]⌝ is a varstruct built from variables $⌜x⌝$, $⌜y⌝$, etc, which may contain duplicates.
=USES
If the functionality is sufficient, this is superior
in efficiency to both $∃\_intro$ and $simple\_∃\_intro$ (q.v.).
=FAILURE
4016	?0 is not an allowed variable structure
=ENDDOC
=DOC
val ⦏∃_intro⦎ : TERM -> THM -> THM ;
=DESCRIBE
Introduce an existential quantifier by reference to a witness.
=FRULE 1 Rule
∃_intro
⌜∃ vs[x,y,...]⦁ t[x,y,...]⌝
├
Γ ⊢ t[t1,t2,...]
├
Γ ⊢ ∃ vs[x',y',...]⦁ t[x,y,...]
=TEX
where ⌜vs[x,y,...]⌝ is varstruct built from variables $⌜x⌝$, $⌜y⌝$, etc,
and the $⌜x'⌝$ are renamed if duplicated inside the varstruct, all but the rightmost being so renamed.
=FAILURE
4020	?0 is not of form: ⌜∃ vs⦁ t⌝
7047	?0 cannot be matched to conclusion of theorem ?1
=ENDDOC
=DOC
val ⦏∃_elim⦎ : TERM -> THM -> THM -> THM;
=DESCRIBE
Eliminate an existential quantifier by reference to an arbitrary varstruct satisfying the predicate.
=FRULE 1 Rule
∃_elim
⌜vs[y1,y2,...]⌝
├
Γ1 ⊢ ∃ vs[x1,x2,...]⦁ t1[x1,x2,...];
Γ2, t1[y1,y2,...] ⊢ t2
├
Γ1 ∪ Γ2 ⊢ t2
=TEX
$t1[y1,y2,...]$ need not actually be present in the assumptions of the second theorem.
The $y_i$ must be free variables, none of whom are present elsewhere in the second theorem, or in the conclusion
of the first.
The $y_i$ may contain duplicates as long as the end pattern
matches the $x_i$ in required duplicates.
The term argument may be a less complex variable structure
than the bound variable structure of the theorem,
as $Fst$ and $Snd$ are used to make them match.
For example, the following rule holds true:
=FRULE 1 Rule
∃_elim
⌜x⌝
├
Γ1 ⊢ ∃ (p,q)⦁ t1[p,q];
Γ2, t1[Fst x, Snd x] ⊢ t2
├
Γ1 ∪ Γ2 ⊢ t2
=TEX

=FAILURE
27042	?0 does not match the bound varstruct of ?1
27046	?0 is not of the form `Γ ⊢ ∃ vs⦁ t`
27051	?0 has members appearing free in conclusion of ?1
27052	?0 has members appearing free in ?1 other than in assumption ?2
=ENDDOC
=DOC
val ⦏∃_uncurry_conv⦎ : CONV;
=DESCRIBE
Convert a paired existentially quantified term into
simple universal quantifications of the same term.
=FRULE 1 Conversion
∃_uncurry_conv
⌜∃ vs[x,y,...]⦁ f[x, y,...]⌝
├
├
⊢ ∃ vs[x,y,...]⦁ f[x,y,...] =
	∃ x y ...⦁ f[x,y,...]
=TEX
where $vs[x,y,...]$ is an allowed variable structure with
variables $x,y,...$.
It may not be a simple variable.
=SEEALSO
$λ\_varstruct\_conv$, $all\_∃\_uncurry\_conv$, $∀\_uncurry\_conv$.
=FAILURE
27047	?0 is not of the form: ⌜∃ (x,y)⦁ f⌝
=ENDDOC
=DOC
val ⦏all_∃_uncurry_conv⦎ : CONV;
=DESCRIBE
Apply $∃\_uncurry\_conv$ (q.v.) to the outer existential
quantifications of a term,
flattening those binders.
=FRULE 1 Conversion
all_∃_uncurry_conv
⌜∃ vs1[x1,y1,...] vs2[x2,y2,...] ...⦁
 f[x1,y1,...,x2,y2,...]⌝
├
├
Γ ⊢ (∃ vs1[x,y,...] vs2[x,y,...]⦁
	f[x1,y1,...,x2,y2,...])
 = (∃ x1 y1 ... x2 y2 ...⦁
	f[x1,y1,...,x2,y2,...])
=TEX
where the $vs[x,y,...]$ are variable structures
with variables $x,y,...$, at least one of which must not be a simple variable.
=SEEALSO
$all\_∀\_uncurry\_conv$
=FAILURE
27048	?0 is not of the form: ⌜∃ ... (x,y) ...⦁ f⌝
=ENDDOC
=DOC
val ⦏¬_∃_conv⦎ : CONV;
=DESCRIBE
Move $¬$ into an $∃$ construct.
=FRULE 1 Rule
¬_∃_conv
⌜¬ (∃ x⦁ t[x])⌝
├
├
⊢ (¬ (∃ x⦁ t[x])) ⇔ ∀ x⦁ ¬ t[x]
=TEX
=SEEALSO
$¬\_simple\_∃\_conv$ which only works with simple $∃$-abstractions, $¬\_∀\_conv$
=FAILURE
27020	?0 is not of the form: ⌜¬ (∃ x⦁ t[x])⌝
	where ⌜x⌝ is a varstruct
=ENDDOC
=DOC
val ⦏∃_asm_rule⦎ : TERM -> TERM -> THM -> THM;
=DESCRIBE
Existentially quantify an assumption (Left $∃$ introduction).
=FRULE 1 Rule
∃_asm_rule
⌜x⌝
⌜p[x]⌝
├
Γ, p'[x] ⊢ q
├
Γ, ∃ x⦁ p'[x] ⊢ q
=TEX
where $p$ and $p'$ are $α$-convertible.
where the variables of the varstruct $x$ are not free in $Γ$ or $q$.
The assumption need not be present for the rule to apply.
=FAILURE
3015	?1 is not of type ⓣBOOL⌝
4016	?0 is not an allowed variable structure
6005	?0 occurs free in assumption list
27052	?0 has members appearing free in ?1 other than in assumption ?2
=FAILUREC
Message 3015 is just passed on from low level functions,
which is why it has "?1" not "?0".
=ENDDOC
This is from \cite{Manna74}.

=DOC
val ⦏∃_reorder_conv⦎ : TERM -> CONV;
=DESCRIBE
Reorder existential quantifications.
=FRULE 1 Rule
∃_reorder_conv
⌜∃ x1 .. xn⦁ t1⌝
⌜∃ y1 .. ym⦁ t2⌝
├
├
(∃ y1 .. ym⦁ t2) ⇔ (∃ x1 .. xn⦁ t1)
=TEX
where the $x_i$ and $y_i$ are varstructs,
and the reordering, restructuring (by pairing) and renaming requested is provable by this function.
The presence of redundant quantifiers, including duplicates, is also handled.
=EXAMPLE
:> ∃_reorder_conv ⌜∃ (x,q) z⦁ x ∧ z⌝ ⌜∃ (z,z,y) x⦁ x ∧ z⌝;
val it = ⊢ (∃ (z, z, y) x⦁ x ∧ z) ⇔ (∃ (x, q) z⦁ x ∧ z) : THM
Note that before more sophisticated attempts, the conversion
will try $α\_conv$ on the two term arguments.
=SEEALSO
$∀\_reorder\_conv$
=FAILURE
27050	Cannot prove equality of ?0 and ?1
=ENDDOC

We do not give a rule for $∃∃$ introduction from \cite{Manna74}.
=DOC
val ⦏ALL_SIMPLE_∃_C⦎ : CONV -> CONV;
=DESCRIBE
This conversional applies its conversion argument to
the body of a repeated simple existential quantification.
=FAILUREC
\paragraph{Errors}
As the failure of the conversion argument.
=ENDDOC
=DOC
val ⦏list_simple_∃_intro⦎ : TERM list -> TERM -> THM -> THM ;
=DESCRIBE
Introduce an iterated existential quantifier by providing a list of witnesses and a theorem asserting that the desired property holds of these witnesses.
=FRULE 1 Rule
list_simple_∃_intro
[⌜t1⌝, ⌜t2⌝, ...]
⌜∃ x1 x2 ...⦁ t[x1,x2,...]⌝
├
Γ ⊢ t[t1,t2,...]
├
Γ ⊢ ∃ x1 x2...⦁ t[x1,x2,...]
=TEX
=FAILURE
7047	?0 cannot be matched to conclusion of theorem ?1
=ENDDOC

\subsection{Concerning ∃$_1$}
=DOC
val ⦏∃⋎1_intro⦎ : THM -> THM -> THM;
=DESCRIBE
Introduce $∃_1$ by reference to a witness, and a uniqueness theorem.
=FRULE 1 Rule
∃⋎1_intro
├
Γ1 ⊢ P'[t']
Γ2 ⊢ ∀ x⦁ P[x] ⇒ x = t
├
Γ1 ∪ Γ2 ⊢ ∃⋎1 x⦁ P[x]
=TEX
Where $P'$ is $α$-convertible to $P$, and
$t'$ is $α$-convertible to $t$.
Notice that for the resulting theorem we take the varstruct, $x$,
and the form of the predicate, $P$, from the second theorem.
=FAILURE
27021	?0 and ?1 are not of the form: `Γ1 ⊢ Pa[ta]` and
	`Γ2 ⊢ ∀ vs[x,y,..]⦁ P[x,y...] ⇒ vs[x,y,..] = t`
	where ⌜Pa⌝ and ⌜P⌝, ⌜ta⌝ and ⌜t⌝ are α-convertible
	and ⌜x⌝ is a varstruct
27054	?0 not of the form: `Γ ⊢ ∀ vs[x,y,..]⦁ P[x,y...] ⇒ vs[x,y,..] = t`
=ENDDOC
=DOC
val ⦏∃⋎1_elim⦎ : THM -> THM;
=DESCRIBE
Express a $∃_1$ in terms of $∃$ and a uniqueness property.
=FRULE 1 Rule
∃⋎1_elim
├
Γ ⊢ ∃⋎1 vs[a,b,...]⦁ P[a,b,...]
├
Γ ⊢ ∃ vs[a,b,...]⦁ P[a,b,...] ∧
	∀ vs[a',b',...]⦁ P[x1,x2,...]
 ⇒
	vs[a',b',...] = vs[a,b,...]
=TEX
where the $a'$, etc, are variants of the $a$.
=FAILURE
27022	?0 is not of the form: `Γ ⊢ ∃⋎1 x⦁ P[x]`
	where ⌜x⌝ is a varstruct
=ENDDOC
This could be rewritten to produce two theorems,
$`∃\ x⦁\ P[x]`$ and $`∀\ x\ y⦁\ P[x]\ ∧\ P[y]\ ⇒\ x\ =\ y`$
=DOC
val ⦏∃⋎1_conv⦎ : CONV;
=DESCRIBE
This is a conversion which turns a unique existential quantifier into
an equivalent existential quantifier
=FRULE 1 Conversion
∃⋎1_conv
⌜∃⋎1vs[x1,...]⦁t[x1,...]⌝
├
├
⊢ (∃⋎1vs[x1,...]⦁t[x1,...]) ⇔
	(∃vs[x1,...]⦁t[x1,...] ∧
	∀vs[x1',...]⦁t[x1',...] ⇒
	vs[x1',...] = vs[x1,...])
=TEX
=USES
Tactic and conversion programming.
=SEEALSO
$strip\_tac$, $simple\_∃_1\_conv$
=FAILURE
27053	?0 is not of the form: ⌜∃⋎1vs⦁t⌝
=ENDDOC
\subsection{Concerning ε}
=DOC
val ⦏ε_elim_rule⦎ : TERM -> THM -> THM -> THM;
=DESCRIBE
Given that $ε$ of a predicate satisfies that predicate, then
in a different theorem we may eliminate an assumption that
claims an otherwise unused variable structure satisfies the predicate.
=FRULE 1 Rule
ε_elim_rule
⌜vs⌝
├
Γ1 ⊢ t' ($ε t'');
Γ2, t vs ⊢ s
├
Γ1 ∪ Γ2 ⊢ s
=TEX
where $t$, $t'$ and $t''$ are $α$-convertible, and
$vs$ is a varstruct, with no duplicates, and with its free variables
occurring nowhere else in the second theorem, or in the conclusion
of the first.
In fact, $(\$ε\ t'')$ here can be any term, it is not constrained to be an application of the choice function.
=FAILURE
4016	?0 is not an allowed variable structure
7019	?0 is not of the form: `Γ ⊢ t1(ε t1)`
7054	?0 is not of same type as choice sub-term of first theorem
27043	?0 is repeated in the varstruct ?1
27045	Arguments ?0; ?1 and ?2 not of the form ⌜vs⌝; `Γ1 ⊢ t (ε t)` and
	`Γ2, (t vs) ⊢ s`
27051	?0 has members appearing free in conclusion of ?1
27052	?0 has members appearing free in ?1 other than in assumption ?2
=ENDDOC
The above cannot handle duplicates within $vs$, because for instance a predicate on $(a,a)$
where $a$ is free is not the same as that predicate on $x$ where $x$ is free.
Renaming is not a sensible solution.
=DOC
val ⦏∃_ε_rule⦎ : THM -> THM;
=DESCRIBE
Give that $ε$ of a predicate satisfies the predicate by reference to an $∃$ construct.
It can properly handle paired existence.
=FRULE 1 Rule
∃_ε_rule
├
Γ ⊢ ∃ x⦁ p[x]
├
Γ ⊢ p[ε x⦁ p x]
=TEX
If $x$ is formed by paired then the $Fst$ and $Snd$ are used to extract the appropriate bits of the ε-term
for distribution in $p[ε\ x⦁\ p\ x]$.
=SEEALSO
$∃\_ε\_conv$
=FAILURE
27024	?0 is not of the form: `Γ ⊢ ∃ x⦁ p[x]`
	where ⌜x⌝ is a varstruct
=ENDDOC
=DOC
val ⦏∃_ε_conv⦎ : CONV;
=DESCRIBE
Give that $ε$ of a predicate satisfies the predicate by reference to an $∃$ construct.
It can properly handle paired existence.
=FRULE 1 Rule
∃_ε_conv
⌜∃ x⦁ p[x]⌝
├
├
Γ ⊢ (∃ x⦁ p[x]) = p(ε x⦁ p x)
=TEX
If $x$ is formed by paired then the $Fst$ and $Snd$ are used to extract the appropriate bits of the ε-term
for distribution in $p[ε\ x⦁\ p\ x]$.
=SEEALSO
$∃\_ε\_rule$
=FAILURE
27024	?0 is not of the form: `Γ ⊢ ∃ x⦁ p[x]`
	where ⌜x⌝ is a varstruct
=ENDDOC
\subsection{Concerning Local Definitions}
=DOC
val ⦏let_conv⦎ : CONV;
=DESCRIBE
Eliminate an outermost $let\ldots and\ldots in\ldots$ construct.
=FRULE 1 Conversion
let_conv
⌜let vs1[x1,y1,..] =
 t1 and ... vsn[xn,yn,..] = tn
 in t[x1,...,xn,...]⌝
├
├
⊢ (let vs1[x1,y1,..] = t1
 and ... and vsn[xn,yn,..] = tn
 in t[x1,...,xn,...]
	= t[t1x,...,t1y,...,tnx,tny,...]
=TEX
Where the $t_ix$ is the component of $t_i$ matching $x_i$
when $t_i$ matches $vs_i[x_i,y_i,..]$.
=FAILURE
4009	?0 is not of form: ⌜let ... in ...⌝
=ENDDOC

\subsection{Concerning $Uncurry$}
I don't believe we need a rule for eliminating $Uncurry$,
and its introduction is mostly behind the scenes.
\subsection{Concerning Sets}
See \cite{DS/FMU/IED/DTD044}.
\subsection{Conversionals}
=DOC
val ⦏λ_C⦎ : CONV -> CONV;
=DESCRIBE
Apply a conversion to the body of an abstraction:
=FRULE 1 Rule
λ_C
(c : CONV)
⌜λ x⦁ p⌝
├
├
⊢ (λ x⦁ p[x]) = (λ x⦁ pa[x])
=TEX
where $c\ p[x]$ gives $`⊢ p[x] = pa[x]`$.
=FAILURE
4002	?0 is not of form: ⌜λ vs⦁ t⌝
7104	Result of conversion, ?0, ill-formed
=FAILUREC
Also as the failure of the conversion.
=ENDDOC
=DOC
val ⦏BINDER_C⦎ : CONV -> CONV;
=DESCRIBE
Apply a conversion to the body of a binder term:
=FRULE 1 Rule
BINDER_C
(c : CONV)
⌜B x⦁ p⌝
├
├
⊢ (B x⦁ p[x]) = (B x⦁ pa[x])
=TEX
where $c\ p[x]$ gives $`⊢ p[x] = pa[x]`$,
and $B$ is a binder.
=FAILURE
27035	?0 is not of the form: ⌜B x⦁ p[x]⌝ where ⌜B⌝ is a binder
	and ⌜x⌝ a varstruct
7104	Result of conversion, ?0, ill-formed
=FAILUREC
Also as the failure of the conversion.
=ENDDOC
This will later be renamed to $SIMPLE\-\_BINDER\-\_C$, and the current $SIMPLE\-\_BINDER\-\_C$ renamed to $SIMPLE\-\_BINDER\_C$.
\section{END OF THE SIGNATURE}
=SML
end; (* signature of DerivedRules2 *)
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

sort (fn x => fn y => x - y) (map (fn {id=id,...} => id)( get_error_messages()));



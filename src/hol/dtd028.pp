=IGN
********************************************************************************
dtd028.doc: this file is part of the PPHol system

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

\def\Title{Detailed Design for Tactics II}

\def\AbstractText{This document gives the detailed design for the second group of tactics and tacticals in ICL HOL.}

\def\Reference{DS/FMU/IED/DTD028}

\def\Author{R.D. Arthan}


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
%% LaTeX2e port: \TPPtitle{Detailed Design for Tactics II}
%% LaTeX2e port: \TPPref{DS/FMU/IED/DTD028}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.45 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2005/12/12 16:05:28 $%
%% LaTeX2e port: }}  %% Mandatory field
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{Design}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{R.D. Arthan & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D. Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document gives the detailed design for the
%% LaTeX2e port: second group of tactics and tacticals in ICL HOL.}
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
\item [Issue 1.6 (1991/07/03) (2 July 1991)]
First draft issue (incorporating much of former DS/FMU/IED/DTD009).
\item [Issue 1.8 (1991/07/09) (\FormatDate{91/07/09
})]
Update to expose some of the internal conversions and theorems.
Negated conditionals now handled.
Commentary etc. updated in the light of comments received.
\item [Issue 1.11 (1991/09/04) (\FormatDate{91/09/04%
})] Issue for desk-check (reworked error messages and addition of
$ante\_tac$).
\item [Issue 1.12 (1991/10/28) (25th October 1991)]
Changes in response to deskcheck ID0029.
\item [Issue 1.13 (1991/10/30) (30th October 1991)]
Reacted to opening of $NetTools$, improved some error messages.
\item [Issue 1.14 (1991/10/31) (31th October 1991)]
Added $⇒\_THEN$.
\item [Issue 1.15 (1991/11/19) (18th November 1991)]
Reacting to issue 1.5/6 of \cite{DS/FMU/IED/DTD051}.

\item[Issue 1.16 (1992/01/20) (\FormatDate{92/01/20})] Updated to use new fonts.
\item[Issue 1.17 (1992/02/05) (4th February 1992)]
Modified $strip\_tac$, added $swap\_asm\_concl\_tac$ et al.
\item[Issue 1.18 (1992/02/10) (10th February 1992)]
Minor corrections.
\item [Issue 1.20 (1992/03/18)(11th March 1992)]
Various minor additions and extensions.
\item [Issue 1.21 (1992/03/26) (26th March 1992)]
Changed to use proof context material of issue 1.13 of \cite{DS/FMU/IED/DTD051}.
\item [Issue 1.22 (1992/04/14) (13th April 1992)]
Changes due to CR0017.
\item [Issue 1.23 (1992/04/28) (28th April 1992)]
Corrected documentation typos.
\item [Issue 1.25 (1992/05/14) (14th May 1992)]
Reorganisation of proof contexts.
\item [Issue 1.26 (1992/05/26) (26th May 1992)]
Renamings from version 1.5 of DS/FMU/IED/WRK038.
\item [Issue 1.27 (1992/05/29) (29th May 1992)]
Gained $prove\_tac$, $prove\_∃\_tac$.
\item [Issue 1.28 (1992/06/15) (29th May 1992)]
Added $intro\_∀\_tac$.
\item[Issue 1.29 (1992/06/24) (24th June 1992)]
Renamings from issue 1.6 of \cite{DS/FMU/IED/WRK038},
mostly proof context name changes.
\item[Issue 1.31 (1992/07/31) (31st July 1992)]
Handle an error in $SIMPLE\_∃\_THEN$.
\item[Issue 1.32 (1992/08/05) (5th August 1992)]
Added message 28083.
\item[Issue 1.34 (1992/08/20) (20th August 1992)]
Correcting text.
\item[Issue 1.35 (1992/10/28) (28th October 1992)]
Added an explanation of a kind of failure that $prove\_tac$
can cause.
\item[Issue 1.36 (1992/11/11) (11th November 1992)]
Added $STRIP\_T$ and $strip\_concl\_tac$.
\item[Issue 1.37 (1992/12/07) (7th December 1992)]
Added $strip\_concl\_conv$, $strip\_asm\_conv$.
\item[Issue 1.38 (1993/01/07) (7th January 1993)]
Typos.
\item[Issue 1.39 (1993/02/09) (9th February 1993)]
Corrected $check\_asm\_tac$ description.
\item[Issue 1.40 (1993/02/12) (12th February 1993)]
Added tactics for equality symmetry in assumptions.
\item[Issue 1.41 (1993/09/22) (22nd September 1993)]
Tidied up layout for description of $eq\_sym\_asm\_tac$.
\item[Issue 1.42 (1997/08/12)]
Typo.
\item[Issue 1.43 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.44 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.45 (2005/12/12)] Added
=INLINEFT
intro_∀_tac1
=TEX
.
\item[Issue 1.46 (2014/02/28)] Added
=INLINEFT
IF_CASES_T
=TEX
\ and
=INLINEFT
if_cases_tac
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
\pagebreak
\section{GENERAL}
\subsection{Scope}
This document contains the detailed design for the
second group of tactics and tacticals for ICL HOL.
This group is mainly concerned with supplying support for predicate calculus
connectives (including boolean conditionals but not boolean $let$-expressions).
This is called for in \cite{DS/FMU/IED/HLD009}.
The design is implemented in \cite{DS/FMU/IED/IMP028}.
\subsection{Introduction}
The second group of tactics and tacticals is mainly concerned with supplying support for predicate calculus
connectives (including boolean conditionals but not boolean $let$-expressions).
The main objective is to supply adequate goal, theorem
and assumption stripping tactics and tacticals (sufficiently
powerful to prove all tautologies). These and the other tactics defined
here may then be used to construct the rewriting tactics and
the elementary theory of pairs and so enable definition
of the tactics (and supporting rules)
which handle paired abstractions and other term constructs
which are not covered here.

This document contains first of all a general discussion of some of
the design issues and decisions concerning the tactics and tacticals
(section \ref{GENERALREMARKS}).
Section \ref{THETACTICSANDTACTICALS} then contains the specifications
of the tactics and tacticals, starting with the important tactics
which relate to stripping goals and theorems and then giving those
which relate to particular predicate calculus connectives.

Section \ref{CONVERSIONS} describes two conversions which are required
to implement the tactics and which also need some of the tactics for
their proof. As these conversions are likely to be required elsewhere they
are made visible here. Fortunately from the user's point of view they
are `simple' versions of conversions whose more general form will appear
in a more appropriate place.
\subsubsection{Purpose and Background}
Study material which relates to the coverage of the tactics and tacticals
may be found in \cite{DS/FMU/IED/WRK013} and
\cite{DS/FMU/IED/WRK014}.

The section of general remarks in the document describing the more
elementary tactics, \cite{DS/FMU/IED/DTD009} also apply to this document.

\subsubsection{Dependencies}
Loading this document is dependent on \cite{DS/FMU/IED/IMP009}
and \cite{DS/FMU/IED/IMP051}.

\subsubsection{Deficiencies}
There is  currently no way of extending the stripping techniques more
generally than by adding extra conversions. If there is a requirement for
adding stripping techniques which do there own Skolemisation or assumption
(without going via an equivalent HOL existential quantifier, or one of the HOL
propositional connectives), then more general hooks into
$STRIP\_THM\_THEN$ and $STRIP\-\_CONCL\_THEN$ would need to be exposed.
Such hooks have been rejected for the time being since it is felt that they
would be rather hard to explain and because misuse of such hooks could
prevent $strip\_tac$ being an equivalence transformation.

\subsubsection{Possible Enhancements}
One could supply $strip\_tac$ etc. in versions with the
extra conversions as arguments. The present formulation, in which these
conversions are stored in proof contexts, has the advantage that
any application-specific conversions then permeate into all of the
tactics which introduce new assumptions via $strip\_asm\_tac$ (e.g.
$cases\_tac$). Versions of the stripping functions with the conversions
as explicit arguments could be supplied as well
if there was a requirement for them.
\subsubsection{Terminology}
{\em Stripping} is a process of generating subgoals from a goal or breaking
a theorem into simpler parts by considering only its outermost connective, or top level ``form''.

\section{GENERAL REMARKS}\label{GENERALREMARKS}
\subsection{Coverage}
We wish to supply tactics which correspond
to (a useful subset of) the inference rules for the predicate
calculus connectives given in \cite{DS/FMU/IED/DTD007}. Here by
predicate calculus connective we mean one of the following:

=GFT
∧, ∨, ⇒, ⇔, ¬, (if ... then ... else):BOOL, ∀, ∃, T, F
=TEX

It would be perfectly feasible to handle boolean $let$-expressions
as well. However, it is considered more appropriate to let the
user explicitly control the expansion of local definitions rather than
make the general purpose predicate calculus tactics expand them automatically
(and thereby run a risk of making the user's goal large and incomprehensible)

In general, for each connective, $con$, (and also for some combinations of
connectives, e.g. $⇔ \,T$), we supply:

\begin{enumerate}
\item
a tactical, $con\_T$, which takes one or more theorem tactic arguments,
and which may be used to attack a goal whose principal connective is
$con$ by inverting the introduction rule for $con$ to give one or more
subgoals. The theorem tactic arguments are then applied to any extra assumptions
in the antecedents of the rule, in an attempt to further simplify the goal.
E.g. $⇒\_T\,thmtac$ is a tactic which works on a goal with conclusion of the
form $t1⇒t2$ by applying $thmtac(t1⊢t1)$ to a goal with the same assumptions
and with conclusion $t2$;
\item
a theorem tactical, $con\_THEN$, which helps to use a theorem with $con$
as its principal connective by using the elimination rule for
$con$ to simplify the goal.
E.g. $∃\_THEN\,thmtac$ is a theorem tactic which uses a theorem
of the form $⊢∃x⦁t$ by applying $thmtac(t ⊢ t)$ to the goal and composing
the resulting proof with the existential elimination rule;
\item
a tactic, $con\_tac$, which inverts the introduction rule for $con$ and
applies the standard stripping tactic to any extra assumptions in the antecedents
of the rule.
\end{enumerate}

In cases where there is more than one introduction rule (e.g. disjunction, for
which there are left and right rules), there will be corresponding $con\_tac$s
with suitably decorated names.
Every connective has a $con\_tac$, but
$con\_T$ and $con\_THEN$ are not always supplied. E.g. $con\_T$ is only
supplied for connectives for which the introduction rule eliminates some
assumptions (i.e. introduces assumptions when inverted), so, for instance, $∀\_T$
is not needed.

N.B. $con\_tac$ or $con\_T$, may well not be the best or most
common way of handling a
goal whose principal connective is $con$. E.g. negation is usually best
handled by moving the negation inside other connectives when possible rather
than by attempting a proof inverting negation introduction (which latter amounts
to the variant of proof by contradiction in which one proves $⊢ ¬a$ by demonstrating
that $a ⊢ b$ and $a ⊢ ¬b$ for some suitable choice of $b$).

It turns out in practice that $¬$ and $F$ are some of the trickier
connectives to deal with and the tactics supplied to deal with them include
various tactics, mostly variations on the theme of proof by contradiction which
do not fit into the above scheme.
Similarly we supply some {\em ad hoc}, but very useful, tactics relating to the connective $⇒$ and to case analysis.

\subsection{Strengthening}
Many tactics strengthen the goal, that is to say they replace it with one
or more subgoals whose conjunction entails the goal but is not
equivalent to it.
This is, of course, a common proof approach, but it is worth knowing which
tactics may do this, in case one generates an unprovable goal
(which may indicate either that the main
goal is unprovable or that an incorrect choice of proof has been made).
All potentially strengthening tactics are noted as such in their description.

\pagebreak
\subsection{Stripping Goals, Theorems and Assumptions}\label{StrippingGoalsTheoremsandAssumptions}
One of the most important purposes of the present design is to
supply the tacticals which are used to strip goals
and theorems. These tacticals support some common
techniques for proving goals or using theorems within
tactic proofs in a uniform fashion.
For example, a goal of the form $\{Γ\}a ∧ b$ is almost always
proved by reducing it to $\{Γ\}a$ and $\{Γ\}b$, and, dually, a theorem of
the form $⊢ a ∨ b$ is almost always used to do a case split.

Very commonly the theorem stripping techniques are used to strip theorems
corresponding to new assumptions introduced by a tactic. For example,
the obvious way of proving a goal of the form $\{Γ\}(a ∨ b) ⇒ c$
is to reduce it to two subgoals  $\{a, Γ\}c$ and $\{b, Γ\}c$. A uniform
means of performing this type of reduction is to have the tactic which strips
a goal of the form $\{Γ\}t1 ⇒ t2$ pass the theorem $t1 ⊢ t1$ to the theorem
stripper which then decomposes $t1 ⊢ t1$ into primitive constituents, performs any
relevant case splits and passes the primitive constituents on to a suitable
theorem tactic (typically $asm\_tac$). A more precise definition of
how this is done may be found in the following subsections.

The goal stripping techniques are packaged as a tactical
$STRIP\-\_CONCL\_T$ whose argument is a theorem tactic which
is used to process any new assumptions which may arise from stripping
the goal. The theorem stripping techniques are packaged as a theorem
tactical $STRIP\_THM\_THEN$.
Both of these are parameterised by conversions held in the current proof context,
which state how stripping is to be attempted before the built-in
techniques are tried.
The design approach taken is to move as much as possible into
the parameterised conversions,
and then we provide initial conversions that match the
level of coverage of the rest of this document.
This allows application-specific transformations
to be handled in a uniform manner with the predicate calculus transformations
dealt with in the initial contexts. Note that any remarks below about termination of the
stripping process are made on the assumption that these conversions do not
lead to a loop.

The following subsections describe in outline the stripping facilities
supplied. This description is slightly simplified (as may be seen
by comparison with section \ref{THETACTICSANDTACTICALS}). For example,
it often turns out to be appropriate to supply a general theorem tactical
combinator, say $con\_THEN2$ which takes two arguments and obtain the more usual
$con\_THEN$ as a special case. The discussion below is not
concerned with such refinements.

\subsubsection{Stripping Goals}
Schematically, the effect on a goal of the goal stripping capabilities
supplied here is as follows:

=GFT
simple_∀_tac		({Γ}, ∀x⦁t)			→	({Γ}, t)

∧_tac 			({Γ}, t1 ∧ t2)			→	({Γ}, t1) ; ({Γ}, t2)


⇒_T ttac		({Γ}, t1 ⇒ t2)			→	ttac(t1 ⊢ t1) ({Γ}, t)

t_tac			({Γ}, T)			→	[]

concl_in_asms_tac	({Γ, t}, t)			→	[]
=TEX
where $[]$ denotes an empty list of subgoals, i.e.that the tactic
proves the goal.
The initial conversion from the proof context will provide the additional
rules:
=GFT
({Γ}, t1 ∨ ¬t2)		→	({Γ}, t2 ⇒ t1)
({Γ}, t1 ∨ t2)			→	({Γ}, ¬t1 ⇒ t2)
({Γ}, t1 ⇔ t2)			→	({Γ}, (t1 ⇒ t2) ∧ (t2 ⇒ t1));
({Γ}, if a then t1 else t2)	→	({Γ}, a ∧ t1 ∨ ¬ a ∧ t2) ;
({Γ}, ¬t)			→	({Γ}, rhs(simple_¬_in_conv(¬t)))
=TEX
and where $simple\_¬\_in\_conv$ is a conversion which moves negations over the
other connectives, i.e. it proves theorems of the following forms
(and fails if none of them applies):
=GFT
	⊢	¬¬t			= t
	⊢	¬(t1 ∧ t2)		= ¬t1 ∨ ¬t2
	⊢	¬(t1 ∨ t2)		= ¬t1 ∧ ¬t2
	⊢	¬(t1 ⇒ t2)		= t1 ∧ ¬t2
	⊢	¬(t1 ⇔ t2)		= (t1 ∧ ¬t2) ∨ (t2 ∧ ¬t1)
	⊢	¬if a then t1 else t2)
					= if a then ¬t1 else ¬t2
	⊢	¬∀x⦁t			= ∃x⦁¬t
	⊢	¬∃x⦁t			= ∀x⦁¬t
	⊢	¬∃⋎1x⦁t[x]	= ∀x⦁¬(t[x] ∧ ∀x'⦁t[x'] ⇒ x' = x)
	⊢	¬T			= F
	⊢	¬F			= T
=TEX

Note that in the present document we do not deal with paired abstractions (e.g. $∃(x,y)⦁...$).
However, we expect this feature to be addressed purely through additional equational contexts.


$STRIP\-\_CONCL\_T\,ttac$ (as set up here) attempts to apply each of the
above ``tactics'' until it finds one which is appropriate.

Each of the above stripping tactics is an equivalence transformation
(in the sense that the original goal is valid iff. all of the subgoals indicated
are valid). If we also assume that the theorem tactic $ttac$ above always
either achieves its goal or produces a set of subgoals which is
logically equivalent to its goal and which has a possibly
increased stock of assumptions but the same conclusion, then we see that
iteration of these stripping tactics, with the initial parameters stated will always terminate
and result in a conclusion of one of the following forms (which we will
call {\em conclusion literals} in the discussion in this document, but
not in the descriptions for the user in section \ref{THETACTICSANDTACTICALS}
below):

=GFT
	∃x⦁t	∃⋎1x⦁t	F	¬a	a
=TEX

where the principal connective of $a$ is not one of our predicate calculus
connectives.

Note that the treatment of disjunctions is asymmetrical. A utility
tactic $swap\_∨\_tac$ is supplied which allows the user to interchange
the operands of a disjunctive goal in circumstances where the choice
of simplifications made by $STRIP\-\_CONCL\_T$ is inappropriate.

\subsubsection{Stripping Theorems}

The theorem stripping capability supplied here may be shown schematically
as follows:
=GFT
∧_THEN ttac (Δ ⊢ a ∧ b)	({Γ} t)	→ (ttac (Δ ⊢ a) THEN ttac (Δ ⊢ b)) ({Γ} t)
∨_THEN ttac (Δ ⊢ a ∨ b)	({Γ} t)	→ ttac (a ⊢ a) ({Γ} t) ; ttac (b ⊢ b) ({Γ} t)
∃_THEN ttac (Δ ⊢ ∃x⦁a)	({Γ} t)	→ ttac (a[x'/x] ⊢ a[x'/x]) ({Γ} t)
=TEX

where $a[x'/x]$ denotes $a$ with $x'$ substituted for $x$, where $x'$ is a
variable which does not appear free anywhere in the theorem or the goal.

The initial parameterisation will further provide:
=GFT
(Γ ⊢ a ⇒ b)		→ (Γ ⊢ ¬a ∨ b)
(Γ ⊢ a ⇔ b)		→ (Γ ⊢ a ⇒ b ∧ b ⇒ a)
(Γ ⊢ if a then b else c)	→ (Γ ⊢ a ∧ b ∨ ¬ a ∧ c)
(Γ ⊢ ¬a)		→ (Γ ⊢ rhs(simple_¬_in_conv(¬a)))
(Γ ⊢ ∃⋎1 x⦁a)	→ (Γ ⊢ ∃x⦁a ∧ ∀y⦁a[y] ⇒ y = x)
=TEX

(The negation and existence approaches defined in this document are actually
$simple\_$ versions since we do not handle paired abstractions here.)

$STRIP\_THM\_THEN$ (as set up here) is a theorem tactical which uses
the first of the above theorem tacticals which applies to the
given theorem.

Each of the above theorem tacticals is an equivalence transformation
in the sense that if applications of the theorem tactic $ttac$ do not
strengthen the goal then neither does its transform under the theorem
tactical. Moreover if we repeatedly apply the above theorem tacticals
we will ultimately apply $ttac$ to theorems with conclusions having
one of the following forms (which we will call {\em assumption literals}
in the discussion below):

=GFT
	∀x⦁t	T	F	¬a	a
=TEX
where the principal connective of $a$ is not one of our predicate
calculus connectives.

\subsubsection{Stripping Assumptions}

$strip\_asm\_tac$ is a theorem tactic which repeatedly applies
$STRIP\_THM\_THEN$ to a theorem tactic $check\_asm\_tac$ which
acts as follows:

=GFT
check_asm_tac (Δ ⊢ T) ({Γ} t)	→ ({Γ} t)
check_asm_tac (Δ ⊢ F) ({Γ} t)	→ []
check_asm_tac (Δ ⊢ ¬a) ({Γ, a} t)	→ []
check_asm_tac (Δ ⊢ a) ({Γ, ¬a} t)	→ []
check_asm_tac (Δ ⊢ a) ({Γ} t)		→ ({a, Γ}, t)
=TEX

where $[]$ denotes an empty list of subgoals, i.e. that the tactic proves
the goal.
Note that $check\-\_asm\-\_tac$ does not strengthen the goal.

\subsubsection{$strip\_tac$}
The general purpose stripping tactic $strip\_tac$ is now
defined as $STRIP\-\_CONCL\_T\,strip\_asm\_tac$. From our observations
above on the goal and theorem stripping facilities this uses, we see that
repeated application of $strip\_tac$ reduces any goal to an equivalent collection
of subgoals each of which may be obtained from the original goal by (a)
replacing the conclusion by a conclusion literal and (b) adding zero or
more assumption literals to the assumptions.
Moreover, within each of the subgoals, each new assumption
will be distinct from any other assumption
and from the negation of any other assumption and from the conclusion.

As we will see in the next section the stripping tactic plus initial parameterisation we offer the user
actually goes further then is needed to prove all tautologies (too far, in
fact --- it will not prove certain substitution instances of tautologies in which
a quantified subterm appears both positively and negatively).
However, it does not go to the extreme of putting the goal into a clausal form
(e.g. as might be represented by a collection of goals all of which had
$F$ as the conclusion and had assumptions comprising universally quantified
disjunctions of propositional literals).

The form of goal is considered to be a convenient
compromise between the two extremes, in that it simplifies
existentially quantified assumptions and universally quantified conclusions
without rendering the goal incomprehensible to the interactive user.
A resolution-style tactic could sensibly start from a goal in this form, either
by continuing to reduce to clausal form (for a fully automatic proof) or
by just doing some propositional calculus normalisations
inside the assumptions to
allow derivation of obvious immediate consequences of the assumptions
in a form which is still comprehensible to the user.

\subsubsection{$taut\_tac$}
By using a subset of the stripping techniques discussed in the
previous sections, a tactic which will prove any goal whose
conclusion is a substitution instance
of a tautology may be produced. (Here we define a {\em tautology} to be
a term formed from propositional variables and the propositional constants
$T$ and $F$ using the non-quantifying predicate calculus connectives, which
is true for any assignment of truth values to the propositional variables).

To see this, consider (without loss of generality) the case when the original goal
has no assumptions and observe that by applying only transformations
for the non-quantifying connectives we will reduce any goal to
an equivalent collection of subgoals in which each conclusion and each assumptions is
what we shall call  a {\em propositional literal}, i.e.
either a {\em propositional atom} ---  a term which has a quantifier or a
non-predicate calculus connective as principal connective ---
or the negation of such a propositional atom.
Moreover, each subgoal, $\{Γ\}t$ say is {\em (a)} such that no assumption
$a ∈ Γ$ is $\alpha$-convertible with $t$ or with the negation of
any other assumption in that subgoal or with $T$, $F$, $¬T$ or $¬F$,
and  {\em (b)} such that $t$ is not $T$ or $¬F$ or $¬T$.

Now assume that the original goal had a tautology as its conclusion.
In this case, each subgoal produced by the stripping process of the previous paragraph
must be true with respect to any (consistent) assignment of truth values
to the non-constant propositional
atoms which appear (possibly negated) as its conclusion or in its assumptions.
I claim that no subgoal of the form discussed
in the previous paragraph can be true with respect to all such assignments.
For, there are two possibilities: either, (a), the
subgoal has the form $\{Γ\}F$, in which case, as no assumption $a ∈ Γ$
also appears negated in $Γ$, we can choose an assignment which makes all the assumptions true and so make the subgoal false,
or, (b), the subgoal has the form $\{Γ\}t$ or $\{Γ\}¬t$
where $t$ is not a propositional constant, but then, as no assumption is
$\alpha$-convertible with the conclusion $t$ or $¬t$, we can choose
an assignment which makes each assumption true, makes the conclusion
false and so makes the subgoal false.
It follows that as the original goal had a tautology as its conclusion
then the stripping process of the previous paragraph must result in an
empty collection of subgoals, i.e. it will prove the original goal.

(The above is a straightforward adaptation of a standard argument see, e.g. \cite{wang60}).

\subsection{Introduction of New Assumptions}
Many of the tactics $con\_tac$ (where $con$ stands for some predicate calculus
connective) naturally introduce additional assumptions. For example,
$⇒\_tac$ might reduce $\{Γ\} a ⇒ b$ to $\{a, Γ\} b$. However, in the
majority of cases it is best to strip the new assumptions as described
in section \ref{StrippingGoalsTheoremsandAssumptions} before adding them
to the assumptions. Note that, in general, this may cause case splits.

For ease of use, therefore, those tactics, $con\_tac$, which
introduce new assumptions will always strip the assumptions.
I.e. $con\_tac$ will be implemented as $con\_T\,strip\_asm\_tac$.
In the more specialised cases where stripping is not required the user may use
$con\_T\,asm\_tac$ to achieve the desired effect.

To describe such a tactic we use the notation $(\{strip\ a, Γ\}t)$ to denote
$strip\_asm\_tac(a ⊢ a) (\{Γ\}t)$.

\section{THE TACTICS AND TACTICALS}\label{THETACTICSANDTACTICALS}
=DOC
signature ⦏Tactics2⦎ = sig
=DESCRIBE
This provides the second group of tactics and tacticals in ICL HOL.
These are mainly concerned with the predicate calculus.
=ENDDOC
=TEX
\subsection{Stripping Tactics and Tacticals}
(New errors in this section begin with 2800).
=DOC
val ⦏strip_concl_tac⦎ : TACTIC;
val ⦏strip_tac⦎ : TACTIC;
=DESCRIBE
$strip\_concl\_tac$, more usually known by its alias, $strip\_tac$,
is a general purpose tactic for simplifying away the outermost
connective of a goal.
It first tries to apply the
conclusion stripping conversion from the current proof context,
to rewrite the outermost connective in the goal.
If that conversion fails, tries to simplify the goal by applying an applicable
member of the following collection of tactics
(only one could possibly apply):
=GFT
simple_∀_tac,		∧_tac,			
⇒_T strip_asm_tac,	t_tac
=TEX
Failing either being successful, it tries $concl\-\_in\-\_asms\-\_tac$ to prove the goal,
and failing that, returns the error message below.

Note how new assumptions generated by the tactic are processed using
$strip\_asm\_tac$,
which uses the current proof context's theorem stripping conversion.
$strip\_tac$ may produce several new
subgoals, or may prove the goal.

$REPEAT\,strip\_tac$ in the proof context ``basic$\_$hol''
(amongst others) will prove all
tautologies automatically. It will, however,
not succeed in proving some substitution instances
of tautologies involving positive and
negative instances of a quantified subterm.

=USES
This is the usual way of simplifying a goal involving predicate
calculus connectives,
and other functions ``understood'' by the current prof context.
=SEEALSO
$STRIP\_T$ and $STRIP\_THM\_THEN$ which are used
to implement this function.
$taut\_tac$ for an alternative simplifier.
$swap\_∨\_tac$ to rearrange the conclusion for tailored stripping.
Also $strip\_concl\_conv$, $strip\_asm\_conv$.
=FAILURE
28003	There is no stripping technique for ?0 in the current proof context
=ENDDOC
=DOC
val ⦏strip_concl_conv⦎ : CONV;
val ⦏strip_asm_conv⦎ : CONV;
=DESCRIBE
=INLINEFT
strip_concl_conv tm;
=TEX
{} applies the
conclusion stripping conversion from the current proof context,
to rewrite the outermost connective in the term $tm$.

=INLINEFT
strip_asm_conv tm;
=TEX
{} applies the
assumption stripping conversion from the current proof context,
to rewrite the outermost connective in the term $tm$.
=FAILURE
28003	There is no stripping technique for ?0 in the current proof context
=ENDDOC
=DOC
val ⦏strip_asm_tac⦎ : THM -> TACTIC;
=DESCRIBE
$strip\_asm\_tac$ is a general purpose tactic for splitting a theorem up
into useful pieces using a range of
simplification techniques, including a parameterised part, before using it to increase the stock of assumptions.

First, before attempting to use the transformations below, $strip\_asm\_tac$ uses the
current proof context's theorem stripping conversion
to attempt to rewrite the outermost connective in the theorem.

Then the following simplification techniques will be tried.
Using $sat$ as an abbreviation for $strip\_asm\_tac$:
=GFT
sat (⊢ a ∧ b) 			→	sat (⊢ a) THEN sat (⊢ b)
sat (∃x⦁a)			→	sat (a[x'/x] ⊢ a[x'/x])
sat (⊢ a ∨ b)({Γ} t)		→	sat (a ⊢ a) ({Γ} t) ; sat (b ⊢ b) ({Γ} t)
=TEX

I.e. $strip\_asm\_tac$ does a case split resulting in two subgoals when
it processes a disjunction.

After all of the available simplification techniques have been attempted
$strip\_asm\_tac$ then proceeds as $check\_asm\_tac$ (q.v.) to use the simplified theorem
either to prove the goal or to generate additional assumptions.
=SEEALSO
$STRIP\_THM\_THEN$, used to implement this function.
$check\_asm\_tac$, $strip\_tac$, $strip\-\_asm\-\_conv$.
=ENDDOC
=DOC
val ⦏check_asm_tac⦎ : THM -> TACTIC;
=DESCRIBE
$check\_asm\_tac\,thm$ is a tactic which checks the form of the theorem, $thm$,
and then takes the first applicable action from the following table:

{\centering
\begin{tabular}{|l|p{4in}|}\hline
$thm$ & action \\ \hline
$Γ ⊢ t$ & proves goal if its conclusion is $t$ \\ \hline
$Γ ⊢ T$ & as $id\_tac$ (i.e. the theorem is discarded) \\ \hline
$Γ ⊢ F$ & proves goal\\ \hline
$Γ ⊢ ¬t$ & proves goal if $t$ in assumptions, else as $asm\_tac$\\ \hline
$Γ ⊢ t$ & proves goal if $¬t$ in assumptions, else as $asm\_tac$\\ \hline
\end{tabular}}

During the search through the assumptions in the last two cases,
$check\_asm\_tac$ also checks to see whether any of the assumptions is
equal to the conclusion of the goal, and if so proves the goal.
It also checks to see if the conclusion of the theorem
is already an assumption, in which case the tactic has no effect.
When all the assumptions have been examined, if none of the
above actions is applicable, the conclusion of the theorem is
added to the assumption list.

=USES
Tactic programming.
=SEEALSO
$strip\_asm\_tac$, $strip\_tac$.
=ENDDOC
=DOC
val ⦏STRIP_THM_THEN⦎ : THM_TACTICAL;
=DESCRIBE
$STRIP\_THM\_THEN$ provides a general purpose way of
stripping theorems into primitive constituents before
using them in a tactic proof.
$STRIP\_THM\_THEN$ attempts to apply
the conversion held for the function in the current proof context, which is
extracted by $current\_ad\_st\_conv$.
to rewrite the theorem.
If that fails it attempts to apply a theorem tactical from the following list (in order):
=GFT
∧_THEN,			∨_THEN,		SIMPLE_∃_THEN
=TEX
The conversion in the current proof context
got by $current\_ad\_st\_conv$ (q.v.)
is derived by applying $eqn\_cxt\_conv$ to an equational context in the proof context extracted by $get\_st\_eqn\_cxt$.

The function is partially evaluated with only the
theorem tactic and theorem arguments.
=USES
Tactic programming.
=SEEALSO
$strip\_asm\_tac$, $strip\_tac$.
=FAILURE
28003	There is no stripping technique for ?0 in the current proof context
=ENDDOC
An experiment that needs to be made is to see what
effect ignoring the term indexes and using $FIRST\_C$
to implement the evaluation of the proof context.
Even if this is initially a better approach, the effect for
longer parameters should also be checked.
=DOC
val ⦏STRIP_CONCL_T⦎ : (THM -> TACTIC) -> TACTIC;
val ⦏STRIP_T⦎ : (THM -> TACTIC) -> TACTIC;
=DESCRIBE
$STRIP\-\_CONCL\_T\,ttac$ is a general purpose way of stripping
goals and passing any new assumptions generated by the stripping
to a tactic generating function, $ttac$.
$STRIP\-\_CONCL\_T$ attempts
to apply the conversion
held for it in the current proof context to rewrite the goal.
The conversion is extracted from the current proof context by $current\_ad\_sc\_conv$.
If that fails it attempts to apply one of the following list of tactics (in order):
=GFT
simple_∀_tac,	∧_tac,	⇒_T ttac,	t_tac
=TEX
If none of the above apply it tries $concl\-\_in\-\_asms\-\_tac$,
and failing that, return the error message below.

The conversion in the current proof context
held by $current\_ad\_sc\_conv$ (q.v.)
is derived by applying $eqn\_cxt\_conv$ to an equational context in the proof context,
extracted by $get\_sc\_eqn\_cxt$.

$STRIP\_T$ is an alias for $STRIP\-\_CONCL\_T$.
=USES
Tactic programming.
=SEEALSO
$strip\_asm\_tac$, $strip\_tac$, $strip\-\_concl\-\_conv$.
=FAILURE
28003	There is no stripping technique for ?0 in the current proof context
=ENDDOC
An experiment that needs to be made is to see what
effect ignoring the term indexes and using $FIRST\_C$
to implement the evaluation of the proof context.
Even if this is initially a better approach, the effect for
longer parameters should also be checked.
=DOC
val ⦏concl_in_asms_tac⦎ : TACTIC;
=DESCRIBE
$concl\-\_in\-\_asms\-\_tac$ is a tactic which checks whether the conclusion of
the goal is also in the assumptions, and if so proves the goal.
=FRULE 2 Tactic
concl_in_asms_tac
├
{ Γ, t } t'
├
=TEX
where $t$ and $t'$ are $\alpha$-convertible.
=USES
Tactic programming.
=SEEALSO
$strip\_tac$.
=FAILURE
28002	Goal does not appear in the assumptions
=ENDDOC

\subsection{Concerning $T$}
(New errors in this section begin with 2801.)

=DOC
val ⦏t_tac⦎ :  TACTIC;
=DESCRIBE
Prove a goal with conclusion `$T$'.
=FRULE 2 Tactic
t_tac
├
{ Γ } T
├
=TEX
=SEEALSO
$strip\_tac$, $taut\_tac$.
=USES
Tactic programming.
=FAILURE
28011	Goal does not have the form {Γ}T
=ENDDOC
=DOC
val ⦏⇔_t_tac⦎ : TACTIC;
=DESCRIBE
Simplifies a goal of the form: $... ⇔ T$ or $T ⇔ ...$.
=FRULE 2 Tactic
⇔_t_tac
├
{ Γ } t ⇔ T
├
{ Γ } t
=TEX
and
=FRULE 2 Tactic
⇔_t_tac
├
{ Γ } T ⇔ t
├
{ Γ } t
=TEX
=FAILURE
28012	Goal not of form: { Γ } t ⇔ T or { Γ } T ⇔ t
=SEEALSO
$strip\_tac$
=USES
Tactic programming.
=ENDDOC

\subsection{Concerning $F$}
(New errors in this section begin with 2802.)
=DOC
val ⦏i_contr_tac⦎ : TACTIC;
=DESCRIBE
Prove a goal by showing that the assumptions are contradictory, in an intuitionistic manner.

N.B. this tactic strengthens the goal, i.e. it may result in unprovable
subgoals even when the original goal was provable.
=FRULE 2 Tactic
i_contr_tac
├
{ Γ } t
├
{ Γ } F
=TEX
=USES
If a proof is to be carried out by showing the assumptions inconsistent,
then the conclusion of the subgoal is irrelevant and may be removed.
=ENDDOC
=DOC
val ⦏f_thm_tac⦎ : THM -> TACTIC;
=DESCRIBE
Prove a goal by using a theorem of the form $Γ ⊢ F$.
=FRULE 2 Tactic
f_thm_tac (Γ1 ⊢ F)
├
{ Γ2 } t
├
=TEX
where the assumptions, $Γ1$, of the theorem are contained in the assumptions,
$Γ2$, of the goal.
=FAILURE
28021	?0 does not have the form Γ ⊢ F
=USES
In tactic programming, to use a theorem which shows that the assumptions are contradictory.
=SEEALSO
$strip\_asm\_tac$.
=ENDDOC
=DOC
val ⦏contr_tac⦎ : TACTIC;
=DESCRIBE
A form of proof by contradiction: $t$ holds if $¬t ⊢ F$.

(The name stands for classical contradiction, as opposed to the
intuitionistic contradiction proof of $i\_contr\_tac$.)
=FRULE 2 Tactic
contr_tac
├
{ Γ } t
├
{strip ¬t, Γ} F
=TEX
=USES
Proof by contradiction.
=SEEALSO
$strip\_tac$, $¬\_tac$.
=FAILURE
28027	Conclusion of goal does not have type ⓣBOOL⌝
=ENDDOC
=DOC
val ⦏CONTR_T⦎ : (THM -> TACTIC) -> TACTIC;
=DESCRIBE
A form of proof by contradiction as a tactical.
$CONTR\_T\,thmtac$ is a tactic which attempts to solve a goal $(Γ, t)$,
by applying $thmtac(¬t ⊢ ¬t)$ to the goal $(Γ, F)$.
=FRULE 2 Tactic
CONTR_T
thmtac
├
{ Γ } t
├
thmtac (¬t ⊢ ¬t) ({Γ} F)
=TEX
=USES
Proof by contradiction in combination with a theorem tactic.
=SEEALSO
$contr\_tac$, $¬\_T$.
=FAILURE
28027	Conclusion of goal does not have type ⓣBOOL⌝
=ENDDOC

\subsection{Concerning ¬}
=DOC
val ⦏¬_tac⦎ : TERM -> TACTIC;
=DESCRIBE
A form of proof by contradiction as a tactic: $¬t2$  holds if $t2 ⊢ t1$ and
$t2 ⊢ ¬t1$ for some term $t1$.

Note that $strip\_tac$ may be used to push a negation inside other logical connectives,
which is often the best way of handling a negated goal.
=FRULE 2 Tactic
¬_tac
⌜t1⌝
├
{ Γ } ¬t2
├
{strip t2, Γ } t1; {strip t2, Γ } ¬ t1
=TEX
=USES
To prove a negated term by showing that assuming the term gives rise to a contradiction.
=SEEALSO
$strip\_tac$, $contr\_tac$, $¬\_T$
=FAILURE
28022	?0 is not boolean
28023	Goal is not of the form ⌜¬ t⌝
=ENDDOC

=DOC
val ⦏simple_¬_in_tac⦎ : TACTIC;
=DESCRIBE
This is a tactic which moves negations inside other predicate calculus
connectives using the following rules:
=GFT
		¬¬t			→	 t
		¬(t1 ∧ t2)		→	 ¬t1 ∨ ¬t2
		¬(t1 ∨ t2)		→	 ¬t1 ∧ ¬t2
		¬(t1 ⇒ t2)		→	 t1 ∧ ¬t2
		¬(t1 ⇔ t2)		→	 (t1 ∧ ¬t2) ∨ (t2 ∧ ¬t1)
		¬∀x⦁t			→	 ∃x⦁¬t
		¬∃x⦁t			→	 ∀x⦁¬t
		¬∃⋎1x⦁t	→	 ∀x⦁¬(t ∧ ∀x'⦁t[x'] ⇒ x' = x)
		¬T			→	 F
		¬F			→	 goal solved
=TEX
It fails with paired quantifiers.
=USES
The more general $¬\_in\_tac$ is just as efficient as $simple\_¬\_in\_tac$
in cases where both succeed.
=SEEALSO
$strip\_tac$, $contr\_tac$, $¬\_T$, $¬\_in\_tac$
=FAILURE
28025	No applicable rule for this goal
=ENDDOC

=DOC
val ⦏SIMPLE_¬_IN_THEN⦎ : THM_TACTICAL;
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
		¬∀x⦁t			→	 ∃x⦁¬t
		¬∃x⦁t			→	 ∀x⦁¬t
		¬∃⋎1x⦁t	→	 ∀x⦁¬(t ∧ ∀x'⦁t[x'] ⇒ x' = x)
		¬T			→	 F
		¬F			→	 T
=TEX
The function may be partially evaluated with only its theorem tactic and theorem arguments.
It fails with paired quantifiers.
=USES
The more general $¬\_IN\_THEN$ is just as efficient as $SIMPLE\_¬\_IN\_THEN$
in cases where both succeed.
=SEEALSO
$strip\_tac$, $STRIP\_THM\_THEN$
=FAILURE
28026	No applicable rule for this theorem
=ENDDOC

=DOC
val ⦏¬_T⦎ : TERM -> (THM -> TACTIC) -> TACTIC;
=DESCRIBE
A form of proof by contradiction using a theorem tactic to
simplify the subgoals.

Note that $strip\_tac$ may be used to push a negation inside other logical connectives,
which is often the best way of handling a negated goal.
=FRULE 2 Tactic
¬_T
ttac
⌜t1⌝
├
{ Γ } ¬t2
├
ttac (t2 ⊢ t2) { Γ } t1;
ttac (t2 ⊢ t2) { Γ } ¬ t1
=TEX
=USES
To prove a negated term by showing that assuming the term gives rise to a contradiction.
=SEEALSO
$strip\_tac$, $contr\_tac$, $¬\_tac$, $STRIP\-\_CONCL\_T$, $¬\_in\_conv$
=FAILURE
28022	?0 is not boolean
28023	Goal is not of the form ⌜¬ t⌝
=ENDDOC

=DOC
val ⦏¬_T2⦎ : TERM -> (THM -> TACTIC) -> (THM -> TACTIC) -> TACTIC;
=DESCRIBE
A form of proof by contradiction using two theorem tactics to
simplify the subgoals.

Note that $strip\_tac$ may be used to push a negation inside other logical connectives,
which is often the best way of handling a negated goal.
=FRULE 2 Tactic
¬_T2
ttac1 ttac2
⌜t1⌝
├
{ Γ } ¬t2
├
ttac1 (t2 ⊢ t2) { Γ } t1;
ttac2 (t2 ⊢ t2) { Γ } ¬ t1
=TEX
=USES
To prove a negated term by showing that assuming the term gives rise to a contradiction.
=SEEALSO
$strip\_tac$, $contr\_tac$, $¬\_tac$, $STRIP\-\_CONCL\_T$, $¬\_in\_conv$
=FAILURE
28022	?0 is not boolean
28023	Goal is not of the form ⌜¬ t⌝
=ENDDOC

=DOC
val ⦏¬_elim_tac⦎ : TERM -> TACTIC;
=DESCRIBE
Proof by showing assumptions give rise to two contradictory
subgoals.

N.B. this tactic strengthens the goal, i.e. it may result in unprovable
subgoals even when the original goal was provable.
=FRULE 2 Tactic
¬_elim_tac
⌜t1⌝
├
{ Γ } t2
├
{ Γ } t1; { Γ } ¬ t1
=TEX
The function may be partially evaluated with only its term argument.
=USES
In tactic programming.
If an assumption has its negation also in the assumption list
this will make for a rapid proof.
$asm\-\_ante\-\_tac\,t1\,THEN\,strip\_tac$ is a more memorable idiom for handling
such a case in interactive use but is a little slower.
=SEEALSO
$strip\_tac$
=FAILURE
28022	?0 is not boolean
=ENDDOC

\subsection{Concerning ∧}
(New errors in this section begin with 2803.)
=DOC
val ⦏∧_tac⦎ : TACTIC;
=DESCRIBE
Reduce the proof of a conjunction to the proof of its conjuncts.
=FRULE 2 Tactic
∧_tac
├
{ Γ } t1 ∧ t2
├
{ Γ } t1; { Γ } t2
=TEX
=SEEALSO
$strip\_tac$
=FAILURE
28031	Goal is not of the form: { Γ } t1 ∧ t2
=ENDDOC
=DOC
val ⦏∧_THEN⦎ : (THM -> TACTIC) -> (THM -> TACTIC);
=DESCRIBE
A theorem tactical to apply a given theorem tactic to the conjuncts of
a theorem of the form $Γ ⊢ t1 ∧ t2$.
=GFT
∧_THEN thmtac (Γ ⊢ t1 ∧ t2) = thmtac (Γ ⊢ t1) THEN thmtac (Γ ⊢ t2)
=TEX
The function may be partially evaluated with only its theorem tactic and theorem arguments.
=SEEALSO
$∧\_THEN2$, $STRIP\_THM\_THEN$
=FAILURE
28032	?0 is not of the form: `Γ ⊢ t1 ∧ t2`
=ENDDOC
=DOC
val ⦏∧_THEN2⦎ : (THM -> TACTIC) -> (THM -> TACTIC) -> (THM -> TACTIC);
=DESCRIBE
A theorem tactical to apply given theorem tactics to the conjuncts of
a theorem of the form $Γ ⊢ t1 ∧ t2$.
=GFT
∧_THEN2 thmtac1 thmtac2 (Γ ⊢ t1 ∧ t2) = thmtac1 (Γ ⊢ t1) THEN thmtac2 (Γ ⊢ t2)
=TEX
=SEEALSO
$∧\_THEN$, $STRIP\_THM\_THEN$
=FAILURE
28032	?0 is not of the form: `Γ ⊢ t1 ∧ t2`
=ENDDOC
\subsection{Concerning ∨}
(New errors in this section begin with 2804.)
=DOC
val ⦏∨_left_tac⦎ : TACTIC;
=DESCRIBE
Take the left disjunct of the current
goal as the subgoal.

N.B. this tactic strengthens the goal, i.e. it may result in unprovable
subgoals even when the original goal was provable.
=FRULE 2 Tactic
∨_left_tac
├
{ Γ } a ∨ b
├
{ Γ } a
=TEX
=SEEALSO
$∨\_left\_tac$, $swap\_∨\_tac$, $strip\_tac$
=FAILURE
28041	Goal is not of the form: { Γ } a ∨ b
=ENDDOC

=DOC
val ⦏∨_right_tac⦎ : TACTIC;
=DESCRIBE
Take the right disjunct of the current
subgoal as the new subgoal.

N.B. this tactic strengthens the goal, i.e. it may result in unprovable
subgoals even when the original goal was provable.
=FRULE 2 Tactic
∨_right_tac
├
{ Γ } a ∨ b
├
{ Γ } b
=TEX
=SEEALSO
$∨\_right\_tac$, $swap\_∨\_tac$, $strip\_tac$
=FAILURE
28041	Goal is not of the form: { Γ } a ∨ b
=ENDDOC
=DOC
val ⦏swap_∨_tac⦎ : TACTIC;
=DESCRIBE
Interchange the disjuncts of a disjunctive goal.
=FRULE 2 Tactic
swap_∨_tac
├
{ Γ } a ∨ b
├
{ Γ } b ∨ a
=TEX
=USES
For use in conjunction with $strip\_tac$ (q.v.) when the reduction
of $\{ Γ \} a ∨ b$ to $\{ ¬a, Γ \} b$ is inappropriate.
=SEEALSO
$∨\_left\_tac$, $∨\_right\_tac$, $swap\_∨\_tac$, $strip\-\_tac$
=FAILURE
28041	Goal is not of the form: { Γ } a ∨ b
=ENDDOC
=DOC
val ⦏∨_THEN⦎ : (THM -> TACTIC) -> (THM -> TACTIC);
=DESCRIBE
A theorem tactical to perform a case split on a given disjunctive theorem
applying a tactic generating function to the extra assumption in each branch.
=GFT
∨_THEN ttac (Δ ⊢ t1 ∨ t2) ({Γ} t) = ttac (t1 ⊢ t1) ({Γ} t); ttac (t2 ⊢ t2)({Γ} t)
=TEX
The function may be partially evaluated with only its theorem tactic and theorem arguments.
=SEEALSO
$STRIP\_THM\_THEN$, $∨\_THEN2$
=FAILURE
28042	?0 is not of the form: `Γ ⊢ t1 ∨ t2`
=ENDDOC

=DOC
val ⦏∨_THEN2⦎ : (THM -> TACTIC) -> (THM -> TACTIC) -> (THM -> TACTIC);
=DESCRIBE
A theorem tactical to perform a case split on a given disjunctive theorem
applying tactic generating functions to the extra assumption in each branch.
=GFT
∨_THEN2 ttac1 ttac2 (Δ ⊢ t1 ∨ t2) ({Γ} t) =
	ttac1 (t1 ⊢ t1) ({Γ} t); ttac2 (t2 ⊢ t2)({Γ} t)
=TEX
The function may be partially evaluated with only its theorem tactic and theorem arguments.
=SEEALSO
$STRIP\_THM\_THEN$, $∨\_THEN$
=FAILURE
28042	?0 is not of the form: `Γ ⊢ t1 ∨ t2`
=ENDDOC

=DOC
val ⦏cases_tac⦎ : TERM -> TACTIC;
=DESCRIBE
Do a case split on a given boolean term.
=FRULE 2 Tactic
cases_tac
⌜t1⌝
├
{ Γ } t2
├
{strip t1, Γ } t2; {strip ¬t1, Γ } t2
=TEX
=SEEALSO
$CASES\_T$, $∨\_THEN$
=FAILURE
28022	?0 is not boolean
=ENDDOC

=DOC
val ⦏CASES_T⦎ : TERM -> (THM -> TACTIC) -> TACTIC;
=DESCRIBE
Do a case split on a given boolean term using a tactic generating function:
=GFT
CASES_T t1 ttac ({Γ} t2) = ttac(t1 ⊢ t1)({Γ} t2) ; ttac(¬t1 ⊢ ¬t1)({Γ} t2)
=TEX
=SEEALSO
$cases\_tac$, $∨\_THEN$, $CASES\_T2$
=FAILURE
28022	?0 is not boolean
=ENDDOC

=DOC
val ⦏CASES_T2⦎ : TERM -> (THM -> TACTIC) ->
	(THM -> TACTIC) -> TACTIC;
=DESCRIBE
Do a case split on a given boolean term using two tactic generating functions:
=GFT
CASES_T2 t1 ttac1 ttac2 ({Γ} t2) = ttac1(t1 ⊢ t1)({Γ} t2) ; ttac2(¬t1 ⊢ ¬t1)({Γ} t2)
=TEX
=SEEALSO
$cases\_tac$, $∨\_THEN$, $CASES\_T$
=FAILURE
28022	?0 is not boolean
=ENDDOC

\subsection{Concerning ⇒}
(New errors in this section begin with 2805)
=DOC
val ⦏⇒_tac⦎ : TACTIC;
=DESCRIBE
Strip the antecedent of an implicative goal into the assumption list.
=FRULE 2 Tactic
⇒_tac
├
{ Γ } t1 ⇒ t2
├
{strip t1, Γ } t2
=TEX
=FAILURE
28051	Goal is not of form: { Γ } t1 ⇒ t2
=ENDDOC

=DOC
val ⦏⇒_T⦎ : (THM -> TACTIC) -> TACTIC;
=DESCRIBE
Reduce an implicative goal
by passing the antecedent to a tactic generating function.
=FRULE 2 Tactic
⇒_T
ttac
├
{ Γ } t1 ⇒ t2
├
ttac{ t1, Γ } t2
=TEX
=FAILURE
28051	Goal is not of form: { Γ } t1 ⇒ t2
=ENDDOC
=DOC
val ⦏⇒_THEN⦎ : (THM -> TACTIC) -> (THM -> TACTIC);
=DESCRIBE
A theorem tactical to apply a given theorem tactic to the result
of eliminating $⇒$ from a theorem of the form $Γ ⊢ t1 ⇒ t2$.
=GFT
⇒_THEN thmtac (Γ ⊢ t1 ⇒ t2) = thmtac (Γ ⊢ ¬ t1 ∨ t2)
=TEX
The function is partially evaluated with only the
theorem tactic and theorem arguments.
=FAILURE
28054	?0 is not of the form: `Γ ⊢ t1 ⇒ t2`
=ENDDOC

=DOC
val ⦏asm_ante_tac⦎ : TERM -> TACTIC ;
=DESCRIBE
Bring a term out of the assumption list into the goal as the antecedent
of an implication.
=FRULE 1 Rule
asm_ante_tac
⌜t1⌝
├
{ Γ, t1' } t2
├
{ Γ } ⊢ t1 ⇒ t2
=TEX
where $t1$ and $t1'$ are $\alpha$-convertible.
Note that all assumptions $\alpha$-convertible with $t1$ are removed.
=USES
Typically to make the assumption amenable to manipulation, e.g. by
a rewriting tactic.
=SEEALSO
$list\_asm\-\_ante\-\_tac$, $all\_asm\-\_ante\-\_tac$,
$swap\-\_asm\-\_concl\-\_tac$, $DROP\-\_ASM\-\_T$.
=FAILURE
28052	Term ?0 is not in the assumptions
28055	The conclusion or an assumption of goal does not have type ⓣBOOL⌝
=ENDDOC

=DOC
val ⦏list_asm_ante_tac⦎ : TERM list -> TACTIC;
=DESCRIBE
Repeatedly apply $asm\-\_ante\-\_tac$.
=FRULE 1 Rule
list_asm_ante_tac
[⌜t1⌝,...,⌜tn⌝]
├
{ Γ, t1, ..., tn } t
├
{ Γ } t1 ⇒ ... ⇒ tn ⇒ t
=TEX
$\alpha$-equivalent assumptions will only appear once in the resulting
goal,
in their rightmost position,
(which also means that duplicates in the list are ignored).
=SEEALSO
$asm\-\_ante\-\_tac$, $all\_asm\-\_ante\-\_tac$
=FAILURE
28052	Term ?0 is not in the assumptions
28055	The conclusion or an assumption of goal does not have type ⓣBOOL⌝
=ENDDOC

=DOC
val ⦏all_asm_ante_tac⦎ : TACTIC;
=DESCRIBE
Apply $asm\-\_ante\-\_tac$ to every assumption in turn:
=FRULE 2 Tactic
all_asm_ante_tac
├
{ t1, ..., tn } t
├
{} tn ⇒ ... ⇒ t1 ⇒ t
=TEX
$\alpha$-equivalent assumptions will only appear once in the resulting
goal.
Notice that the first assumption becomes the rightmost antecedent.
=SEEALSO
$asm\-\_ante\-\_tac$, $list\_asm\-\_ante\-\_tac$
=FAILURE
28055	The conclusion or an assumption of goal does not have type ⓣBOOL⌝
=ENDDOC

=DOC
val ⦏ante_tac⦎ : THM -> TACTIC;
=DESCRIBE
Replace a goal with conclusion $t2$ by $t1 ⇒ t2$, where
the antecedent, $t1$, of the implication is the conclusion of
a theorem:
=FRULE 2 Tactic
ante_tac (Γ1 ⊢ t1)
├
{ Γ2 } t2
├
{ Γ2 } t1 ⇒ t2
=TEX
where the assumptions, $Γ1$, of the theorem are contained in the
assumptions, $Γ2$ of the goal.
=USES
This is often useful if one needs to transform the conclusion of
theorem e.g. by rewriting with the assumptions.
=SEEALSO
$asm\_tac$, $strip\_asm\_tac$
=FAILURE
28027	Conclusion of goal does not have type ⓣBOOL⌝
=ENDDOC

\subsection{Concerning ⇔}
(New errors in this section begin with 2806.)
=DOC
val ⦏⇔_tac⦎ : TACTIC;
=DESCRIBE
Reduce a bi-implication to two subgoals.
=FRULE 2 Tactic
⇔_tac
├
{ Γ } t1 ⇔ t2
├
{strip t1, Γ } ⊢ t2; {strip t2, Γ } ⊢ t1
=TEX
=SEEALSO
$strip\_tac$, $⇔_T$
=FAILURE
28061	Goal is not of the form: { Γ } t1 ⇔ t2
=ENDDOC

=DOC
val ⦏⇔_T⦎ : (THM -> TACTIC) -> TACTIC;
=DESCRIBE
Reduce a bi-implication by passing each operand to a tactic generating
function.
=FRULE 2 Tactic
⇔_T
ttac
├
{ Γ } t1 ⇔ t2
├
ttac{ t1, Γ } ⊢ t2; ttac{ t2, Γ } ⊢ t1
=TEX
=SEEALSO
$⇔\_T2$, $STRIP\-\_CONCL\_T$
=FAILURE
28061	Goal is not of the form: { Γ } t1 ⇔ t2
=ENDDOC

=DOC
val ⦏⇔_T2⦎ : (THM -> TACTIC) -> (THM -> TACTIC) -> TACTIC;
=DESCRIBE
Reduce a bi-implication by passing the operands to tactic generating
functions.
=FRULE 2 Tactic
⇔_T2
ttac1 ttac2
├
{ Γ } t1 ⇔ t2
├
ttac1{ t1, Γ } ⊢ t2; ttac2{ t2, Γ } ⊢ t1
=TEX
=SEEALSO
$⇔\_T$, $STRIP\-\_CONCL\_T$
=FAILURE
28061	Goal is not of the form: { Γ } t1 ⇔ t2
=ENDDOC

=DOC
val ⦏⇔_THEN⦎ : (THM -> TACTIC) -> (THM -> TACTIC);
=DESCRIBE
A theorem tactical to apply a given theorem tactic to the result
of eliminating $⇔$ from a theorem of the form $Γ\ ⊢\ t1\ ⇔\ t2$.
=GFT
⇔_THEN thmtac (Γ ⊢ t1 ⇔ t2) = thmtac (Γ ⊢ t1 ⇒ t2) THEN thmtac (Γ ⊢ t2 ⇒ t1)
=TEX
The function is partially evaluated with only the
theorem tactic and theorem arguments.
=SEEALSO
$⇔\_THEN2$, $STRIP\_THM\_THEN$
=FAILURE
28062	?0 is not of the form: `Γ ⊢ t1 ⇔ t2`
=ENDDOC

=DOC
val ⦏⇔_THEN2⦎ : (THM -> TACTIC) -> (THM -> TACTIC) ->
	(THM -> TACTIC);
=DESCRIBE
A theorem tactical to apply given theorem tactics to the result
of eliminating $⇔$ from a theorem of the form $Γ ⊢ t1 ⇔ t2$.
=GFT
⇔_THEN2 ttac1 ttac2(Γ ⊢ t1 ⇔ t2) = ttac1(Γ ⊢ t1 ⇒ t2) THEN ttac2(Γ ⊢ t2 ⇒ t1)
=TEX
The function is partially evaluated with only the
theorem tactic and theorem arguments.
=SEEALSO
$⇔\_THEN$, $STRIP\_THM\_THEN$
=FAILURE
28062	?0 is not of the form: `Γ ⊢ t1 ⇔ t2`
=ENDDOC


\subsection{Concerning $if\ldots then\ldots else \ldots$}
(New errors in this section begin with 2807.)

=DOC
val ⦏if_tac⦎ : TACTIC;
=DESCRIBE
Reduce a conditional subgoal by performing a case split on the
selector.
=FRULE 2 Tactic
if_tac
├
{ Γ } if a then tt else et
├
{strip a, Γ } tt ;  {strip ¬a, Γ } et
=TEX
=SEEALSO
$strip\_tac$
=FAILURE
28071	Goal is not of the form: { Γ } if a then tt else et
=ENDDOC

=DOC
val ⦏IF_T⦎ : (THM -> TACTIC) -> TACTIC;
=DESCRIBE
Reduce a conditional by applying a tactic generating function to the
two cases for the selector.
=FRULE 2 Tactic
IF_T
ttac
├
{ Γ } if a then tt else et
├
ttac{ a, Γ } ⊢ tt; ttac{ ¬a, Γ } ⊢ et
=TEX
=SEEALSO
$IF\_T2$, $STRIP\-\_CONCL\_T$
=FAILURE
28071	Goal is not of the form: { Γ } if a then tt else et
=ENDDOC

=DOC
val ⦏IF_T2⦎ : (THM -> TACTIC) -> (THM -> TACTIC) -> TACTIC;
=DESCRIBE
Reduce a conditional by applying tactic generating functions to the
two cases for the selector.
=FRULE 2 Tactic
IF_T2
ttac1 ttac2
├
{ Γ } if a then tt else et
├
ttac1{ a, Γ } ⊢ tt; ttac2{ ¬a, Γ } ⊢ et
=TEX
=SEEALSO
$⇔\_T$, $STRIP\-\_CONCL\_T$
=FAILURE
28071	Goal is not of the form: { Γ } if a then tt else et
=ENDDOC

=DOC
val ⦏IF_THEN⦎ : (THM -> TACTIC) -> (THM -> TACTIC);
=DESCRIBE
A theorem tactical to apply a given theorem tactic to the result
of eliminating the conditional from a theorem with a conditional as its
conclusion.
=GFT
IF_THEN ttac (Γ ⊢ if a then tt else et) = ttac (Γ ⊢ a ⇒ tt) THEN ttac (Γ ⊢ ¬ a ⇒ et)
=TEX
The function is partially evaluated with only the
theorem tactic and theorem arguments.
=SEEALSO
$IF\_THEN2$, $STRIP\_THM\_THEN$
=FAILURE
7012	?0 is not of the form: `Γ ⊢ if tc then tt else te`
=ENDDOC

=DOC
val ⦏IF_THEN2⦎ : (THM -> TACTIC) -> (THM -> TACTIC) ->
	(THM -> TACTIC);
=DESCRIBE
A theorem tactical to apply given theorem tactics to the result
of eliminating the conditional from a theorem with a conditional as its
conclusion.
=GFT
IF_THEN ttac (Γ ⊢ if a then tt else et) = ttac1 (a, Γ ⊢ tt) THEN ttac2 (¬a, Γ ⊢ et)
=TEX
The function is partially evaluated with only the
theorem tactic and theorem arguments.
=SEEALSO
$IF\_THEN$, $STRIP\_THM\_THEN$
=FAILURE
7012	?0 is not of the form: `Γ ⊢ if tc then tt else te`
=ENDDOC

=DOC
val ⦏IF_CASES_T⦎ : (THM -> TACTIC) -> TACTIC;
val ⦏if_cases_tac⦎ : TACTIC;
=DESCRIBE
=INLINEFT
IF_CASES_T ttac
=TEX
\ does a case split on the conditions of any suitable conditionals it finds in
the conclusion of the goal.
A conditional,
=INLINEFT
if tc then tt else te
=TEX
, is suitable if free variables of
=INLINEFT
tc
=TEX
\ (if any) are all free in the conclusion of the goal
and
=INLINEFT
tc
=TEX
\ does not contain any suitable conditionals.
It does the case splits by invoking the tactic generating function
=INLINEFT
ttac
=TEX
\ as
=INLINEFT
CASES_T tc ttac
=TEX
.
It fails if it find no suitable conditionals.

=INLINEFT
if_cases_tac
=TEX
\ is equivalent to
=INLINEFT
IF_CASES_T strip_asm_tac
=TEX
.
=FAILURE
28072	The goal does not contain any suitable conditionals
=ENDDOC

\subsection{Concerning ∀}
(New errors in this section begin with 2808.)

=DOC
val ⦏simple_∀_tac⦎ : TACTIC;
=DESCRIBE
Reduce a universally quantified goal.
It fails with paired quantifiers.
=FRULE 2 Tactic
simple_∀_tac
├
{ Γ } ∀ x ⦁ t[x]
├
{ Γ } t[x']
=TEX
where $x'$ is a variant name of $x$, different from any
variable in $Γ$ or $t$.
=USES
Tactic programming.
The more general $∀\_tac$ is just as efficient as $simple\_∀\_tac$
in cases where both succeed.
=SEEALSO
$∀\_tac$
=FAILURE
28081	Goal is not of the form: { Γ } ∀ x ⦁ t[x]
=ENDDOC

=DOC
val ⦏intro_∀_tac⦎ : (TERM * TERM) -> TACTIC;
val ⦏intro_∀_tac1⦎ : TERM -> TACTIC;
=DESCRIBE
Sometimes it is helpful to prove a goal by proving a more general conjecture has the goal as a special case.
$intro\_∀\_tac$ introduces a universal quantifier into the conclusion of a goal in order to do this.

=FRULE 2 Tactic
intro_∀_tac (t1, x)
├
{ Γ } t[t1/x]
├
{ Γ } ∀x⦁t
=TEX
where $t$ is a term in which $x$ appears free and where either $t1$
the same as $x$ or $x$ does not appear free in the conclusion,
$t[t1/x]$, of the original goal.

Note that $t1$ need not be a variable, e.g.,

=FRULE 2 Example
intro_∀_tac (⌜1+2⌝, ⌜i:ℕ⌝)
├
{ Γ } 1 + 2 > 0 ⇒ ¬1 + 2 = 0
├
{ Γ } ∀i⦁i > 0 ⇒ ¬i = 0
=TEX

=INLINEFT
intro_∀_tac1
=TEX
\ is for use in the common case where one simply wants to take replace the goal by its universal closure over some variable.
=INLINEFT
intro_∀_tac1 ⌜x⌝
=TEX
\ is equivalent to
=INLINEFT
intro_∀_tac (⌜x⌝, ⌜x⌝)
=TEX
.

N.B. these tactics may strengthen the goal, i.e. they may result in unprovable
subgoals even when the original goal was provable.

=USES
The most common use is in preparation for an inductive proof when it
is necessary to generalise the conclusion in order to give stronger
assumptions in the inductive step or steps.
=SEEALSO
$∀\_reorder\_conv$
=FAILURE
28082	?0 does not appear free in the goal
28083	?0 appears free in the goal and is not the same as ?1
=ENDDOC


\subsection{Concerning ∃}
(New errors in this section begin with 2809.)

=DOC
val ⦏simple_∃_tac⦎ : TERM -> TACTIC ;
=DESCRIBE
Provide a witness for an existential subgoal.
It fails with paired quantifiers.

N.B. this tactic strengthens the goal, i.e. it may result in unprovable
subgoals even when the original goal was provable.
=FRULE 2 Tactic
simple_∃_tac
⌜t1⌝
├
{ Γ } ∃ x ⦁ t2[x]
├
{ Γ } t2[t1]
=TEX
where $t1$ must have the same type as $x$.
=USES
Tactic programming.
The more general $∃\_tac$ is just as efficient as $simple\_∃\_tac$
in cases where both succeed.
=FAILURE
28091	Goal is not of the form: { Γ } ∃ x ⦁ t2[x]
28092	Term ?0 has the wrong type
=ENDDOC
$∃\_tac$ is expected to be able to type instantiate
its argument if necessary, but $simple\_∃\_tac$ is not required to do this.
=DOC
val ⦏SIMPLE_∃_THEN⦎ : (THM -> TACTIC) -> (THM -> TACTIC);
=DESCRIBE
A theorem tactical which applies a given theorem tactic to the result
of eliminating the outermost quantifier from a theorem of the form
$Γ ⊢ ∃x⦁t$.
It fails with paired quantifiers.
=GFT
SIMPLE_∃_THEN thmtac (Γ ⊢ ∃x⦁t) = thmtac (Γ ⊢ t[x'/x])
=TEX
where ⌜x'⌝ is a variant of ⌜x⌝ which does not appear in $Γ$ or in
the assumption or conclusion of the goal.
The function is partially evaluated with only the
theorem tactic and theorem arguments.
=USES
Tactic programming. Note that the more general $∃\_THEN$ is just as
efficient as $SIMPLE\_∃\_THEN$ in cases where both succeed.

Error 28094 normally arises when $⌜x'⌝$ is also introduced by the proof
of $ttac$, and occurs during the application of the proof
of $SIMPLE\_∃\_THEN$.
The bound variable $⌜x⌝$ should be renamed to something
that doesn't cause this identification of distinct
variables, by using $rename\_tac$(q.v.).
=SEEALSO
$∃\_THEN$
=FAILURE
28093	?0 is not of the form: `Γ ⊢ ∃ x ⦁ t`
28094	Error in proof of SIMPLE_∃_THEN.
	Usually indicates chosen skolem variable ?0 also
	introduced by proof of supplied theorem tactic,
	which gave `?1`, and the two became identified:
	use rename_tac to rename original bound variable ?2
=ENDDOC

\subsection{Concerning ∃$_1$}
(New errors in this section begin with 2810.)

=DOC
val ⦏simple_∃⋎1_tac⦎ : TERM -> TACTIC;
=DESCRIBE
Simplify a unique existentially quantified goal with a particular
witness.
It fails with paired quantifiers.

N.B. this tactic strengthens the goal, i.e. it may result in unprovable
subgoals even when the original goal was provable.
=FRULE 2 Tactic
simple_∃⋎1_tac1
⌜t⌝
├
{ Γ } simple_∃⋎1 x ⦁ P[x]
├
{ Γ } P[t];
{ Γ } ∀ x' ⦁ P[x'] ⇒ x' = t
=TEX
where $x'$ is a variant of $x$ which does not occur free in $t$.
=USES
Tactic programming.
The more general $∃_1\_tac$ is just as efficient as $simple\-\_∃_1\_tac$
in cases where both succeed.
=FAILURE
28101	Goal is not of the form: { Γ } ∃⋎1 x ⦁ P[x]
28092	Term ?0 has the wrong type
=ENDDOC
Like $simple\_∃\_tac$, $simple\_∃_1\_tac$ is not required to be able
to type instantiate its argument.
=DOC
val ⦏SIMPLE_∃⋎1_THEN⦎ : (THM -> TACTIC) -> (THM -> TACTIC);
=DESCRIBE
A theorem tactical which applies a given theorem tactic to the result
of eliminating the outermost quantifier from a theorem of the form
$Γ ⊢ ∃_1x⦁t$.
It fails with paired quantifiers.
=GFT
SIMPLE_∃⋎1_THEN thmtac (Γ ⊢ ∃⋎1x⦁t) =
	thmtac (Γ ⊢ t[x'/x] ∧ ∀x''⦁P[x''] ⇒ x'' = x)
=TEX
where ⌜x'⌝ and ⌜x''⌝ are distinct variants of ⌜x⌝ which do not appear free in $Γ$ or in
the assumptions or conclusion of the goal.
=USES
Tactic programming.
The more general $∃⋎1\_THEN$ is just as efficient as $SIMPLE\-\_∃⋎1\_THEN$
in cases where both succeed.
=FAILURE
28102	?0 is not of the form: `Γ ⊢ ∃⋎1 x ⦁ t`
=ENDDOC
\subsection{Concerning Assumptions}
Much of the subgoal assumption handling material provided in ICL
HOL has already been given in \cite{DS/FMU/IED/DTD009},
as the $GET\_ASM\_T$ family.
The following family of functions are related, allowing the
user to ``swap'' one or more assumptions with the current goal,
negating and stripping as necessary.
=DOC
val ⦏swap_asm_concl_tac⦎ : TERM -> TACTIC;
val ⦏swap_nth_asm_concl_tac⦎ : int -> TACTIC;
=DESCRIBE
Strip the negation of current goal into the assumption list
and make an assumption, suitably negated, into the
current goal.
If the simplifications it does are ignored,
=INLINEFT
swap_asm_concl_tac asm
=TEX
is equivalent to
=GFT Example
contr_tac THEN asm_ante_tac asm
=TEX
and
=INLINEFT
swap_nth_asm_concl_tac n
=TEX
is equivalent to
=GFT Example
contr_tac THEN DROP_NTH_ASM_T n ante_tac
=TEX

=FRULE 2 Tactic
swap_asm_concl_tac
⌜t1⌝
├
{ Γ, ⌜t1⌝ } t2
├
{strip ⌜¬ t2⌝, Γ} ¬ t1
=TEX
=FRULE 2 Tactic
swap_nth_asm_concl_tac
m
├
{ ⌜t1⌝, ..., ⌜tm⌝,..., ⌜tn⌝} t
├
{strip ⌜¬ t⌝, ⌜t1⌝,..., ⌜tn⌝} ¬ tm
=TEX
If the assumption is a negated term then the double negation
will be eliminated.
=SEEALSO
Other $swap$ and $SWAP$ functions.
=FAILURE
9303	the index ?0 is out of range
28052	Term ?0 is not in the assumptions
=ENDDOC
=DOC
val ⦏list_swap_asm_concl_tac⦎ : TERM list -> TACTIC;
val ⦏list_swap_nth_asm_concl_tac⦎ : int list -> TACTIC;
=DESCRIBE
Strip the negation of current goal into the assumption list
and make some assumptions, suitably negated, into a disjunction forming the
current goal.
If the list is empty then the conclusion will become $⌜F⌝$.

=FRULE 2 Tactic
list_swap_asm_concl_tac
[⌜t1⌝,...,⌜tn⌝]
├
{ Γ } t2
├
{strip ⌜¬ t2⌝, Γ - {⌜t1⌝,...,⌜tn⌝}}
	¬ t1 ∨ ... ∨ ¬ tn
=TEX
=FRULE 2 Tactic
list_swap_nth_asm_concl_tac
[p,...,q]
├
{ Γ } t
├
{strip ⌜¬ t⌝, Γ - {⌜tp⌝, ..., ⌜tq⌝}}
	¬ tp ∨ ... ¬ tq
=TEX
If any assumption is a negated term then the double negation
will be eliminated.
=SEEALSO
Other $swap$ and $SWAP$ functions.
=FAILURE
9303	the index ?0 is out of range
28052	Term ?0 is not in the assumptions
=ENDDOC

=DOC
val ⦏SWAP_ASM_CONCL_T⦎ : TERM -> (THM -> TACTIC) -> TACTIC;
val ⦏SWAP_NTH_ASM_CONCL_T⦎ : int -> (THM -> TACTIC) -> TACTIC;
=DESCRIBE
Process the negation of current goal with the supplied theorem tactic
and make an assumption, suitably negated, into the
current goal.
If the simplifications it does are ignored,
=INLINEFT
SWAP_ASM_CONCL_T asm ttac
=TEX
is equivalent to
=GFT Example
CONTR_T (fn x => asm_ante_tac asm THEN ttac x)
=TEX
and
=INLINEFT
SWAP_NTH_ASM_CONCL_T n ttac
=TEX
is equivalent to
=GFT Example
CONTR_T (fn x => (DROP_NTH_ASM_T n ante_tac) THEN ttac x)
=TEX

=FRULE 2 Tactic
SWAP_ASM_CONCL_T
⌜t1⌝
ttac
├
{ Γ, ⌜t1⌝ } t2
├
ttac(asm_rule ⌜¬t2⌝ )({Γ} ¬ t1)
=TEX
=FRULE 2 Tactic
SWAP_NTH_ASM_CONCL_T
m
ttac
├
{ ⌜t1⌝, ..., ⌜tm⌝, ..., ⌜tn⌝} t
├
ttac(asm_rule ⌜¬t⌝ )
	({⌜t1⌝, ..., ⌜tn⌝} ¬ tm)
=TEX
If the assumption is a negated term then the double negation
will be eliminated.
=SEEALSO
Other $swap$ and $SWAP$ functions.
=FAILURE
9303	the index ?0 is out of range
28027	Conclusion of goal does not have type ⓣBOOL⌝
28052	Term ?0 is not in the assumptions
=ENDDOC
=DOC
val ⦏LIST_SWAP_ASM_CONCL_T⦎
	: TERM list -> (THM -> TACTIC) -> TACTIC;
val ⦏LIST_SWAP_NTH_ASM_CONCL_T⦎
	: int list -> (THM -> TACTIC) -> TACTIC;
=DESCRIBE
Process the negation of current goal with the supplied theorem tactic
and make some assumptions, suitably negated, into a disjunction forming the
current goal.
=FRULE 2 Tactic
LIST_SWAP_ASM_CONCL_T
[⌜tp⌝,...⌜tq⌝]
ttac
├
{ Γ } t
├
ttac(asm_rule ⌜¬t⌝ )
	({Γ - {⌜tp⌝,...⌜tq⌝}} ¬ t1)
=TEX
=FRULE 2 Tactic
LIST_SWAP_NTH_ASM_CONCL_T
[p, ..., q]
ttac
├
{ Γ } t
├
ttac(asm_rule ⌜¬t⌝ )
	({Γ - {⌜tp⌝, ..., ⌜tq⌝}} ¬ tm)
=TEX
If an assumption is a negated term then the double negation
will be eliminated.
If the list is empty then the conclusion (before applying the tactic argument) will become $⌜F⌝$.
=SEEALSO
Other $swap$ and $SWAP$ functions.
=FAILURE
9303	the index ?0 is out of range
28052	Term ?0 is not in the assumptions
28027	Conclusion of goal does not have type ⓣBOOL⌝
=ENDDOC
\subsubsection{Concerning Equality and Assumptions}
=DOC
val ⦏eq_sym_asm_tac⦎ : TERM -> TACTIC;
val ⦏eq_sym_nth_asm_tac⦎ : int -> TACTIC;
=DESCRIBE
THese two tactics identify an assumption (either by being
equal to the term argument, or by index number).
They take it from the assumption list, use symmetry upon it to
reverse any equations (or bi-implications)
(though equations embedded within other equations will not be reversed),
and then strip the result into the assumption list.
The tactics fail if there are no equations to reverse.
=FRULE 2 Tactic
eq_sym_asm_tac
t[x = y, p = q,...]
├
{Γ1, t[x = y, p = q,...], Γ2} cnc
├
{strip t[y = x, q = p, ...], Γ1, Γ2} cnc
=TEX
=FRULE 2 Tactic
eq_sym_nth_asm_tac
n
├
{t1,...,tn-1, tn[x = y, p = q,...],
tn+1,...} cnc
├
{strip tn[y = x, q = p, ...],
t1,...,tn-1, tn+1,...} cnc
=TEX
=GFT Definition
fun eq_sym_asm_tac asm = DROP_ASM_T asm
	(strip_asm_tac o conv_rule(ONCE_MAP_C eq_sym_conv));
fun eq_sym_nth_asm_tac n = DROP_NTH_ASM_T n
	(strip_asm_tac o conv_rule(ONCE_MAP_C eq_sym_conv));
=TEX
=EXAMPLE
Assumption		Becomes
⌜x = y⌝			⌜y = x⌝
⌜∀ x y ⦁ x ⇔ y⌝		⌜∀ x y ⦁ y ⇔ x⌝
⌜f(x = (p = q))⌝	⌜f((p = q) = x)⌝
⌜x = y ∧ p = q⌝		⌜x = y⌝, ⌜p = q⌝
=TEX
=FAILURE
9301	the term ?0 is not in the assumption list
9303	the index ?0 is out of range
28053	?0 contains no equations
=ENDDOC
\subsection{$lemma\_tac$}
(New errors in this section begin with 2811.)
=DOC
val ⦏lemma_tac⦎ : TERM -> TACTIC;
=DESCRIBE
Introduce a lemma (the term argument) to be proved,
and then added as an assumption.

N.B. this tactic strengthens the goal, i.e. it may result in unprovable
subgoals even when the original goal was provable.
=FRULE 2 Tactic
lemma_tac
⌜t1⌝
├
{ Γ } t2
├
{ Γ } t1;
{strip t1, Γ} t2
=TEX
=SEEALSO
$LEMMA\_T$
=FAILURE
9603	the term ?0 is not boolean
=ENDDOC
\subsection{Tautology Prover}
(New errors in this section begin with 2812.)
Note that unlike the tautology provers in earlier instances of HOL,
our $taut\_tac$ proves a goal if and only if its conclusion is
a tautology in the precise sense defined in the following box.
It will not prove $1 = 1$ or $∀x⦁T$.
=DOC
val ⦏simple_taut_tac⦎ : TACTIC;
=DESCRIBE
A tautology prover.
If the conclusion of the goal is a tautology then $taut\_tac$ will prove
the goal.
A tautology is taken to be any substitution
instance of a term which is formed from boolean variables,
the constants $T$ and $F$ and the following
connectives:
=GFT
∧, ∨, ⇒, ⇔, ¬, if ... then ... else
=TEX
and which is true for any assignment of truth values to the variables.
=FRULE 2 Tactic
simple_taut_tac
├
{ Γ } t
├
=TEX
=SEEALSO
$strip\_tac$
=FAILURE
28121	Conclusion of the goal is not a tautology
=ENDDOC
($TAUT\_TAC$ in Cambridge HOL)
\subsection{Automatic Proof Procedures}
=DOC
val ⦏prove_tac⦎ : THM list -> TACTIC;
=DESCRIBE
This tactic is an automatic proof procedure appropriate to the
current proof context.

At the point of applying this tactic to its theorems it will
access the current setting of proof context field $pr\_tac$,
apply it to the theorem list immediately,
and then to the goal, with its assumptions temporarily removed when available
(i.e. the result is partially evaluated with only the list of theorems).
The original assumptions will be returned to the resulting
subgoals using $check\-\_asm\-\_tac$.
=FRULE 2 Tactic
prove_tac
thms
├
{ Γ } t
├
current_ad_pr_tac()thms({}, t)
THEN MAP_EVERY check_asm_tac Γ
=TEX
=SEEALSO
$PC\_T1$ to defer accessing the proof context until application to the goal;
and,
$asm\_prove\_tac$ for the form that does react to the presence of assumptions.
=FAILURE
51021	The current proof context was created in theory ?0 at a
	point now either not in scope, deleted or modified
=FAILUREC
and as the proof context setting.

It is possible that if $prove\_tac$ does not prove all its subgoals, then there may be an identification of newly introduced
variables with free variables in the assumptions that were temporarily put to one side.
This will lead to failures in the execution of the proof parts of the tactics
that constitute the current proof context's automatic prover.
Such a failure may not give particularly helpful messages concerning the cause of the failure.
The problem is avoided by using $asm\-\_prove\-\_tac$,
or by a call to $rename\-\_tac$ to change the offending variable names.
=ENDDOC
=DOC
val ⦏prove_∃_tac⦎ : TACTIC;
=DESCRIBE
This tactic is an automatic proof procedure for existential proofs,
appropriate to the current proof context.

At the point of applying this tactic to a goal it will
access the current setting of proof context field $prove\_∃$,
apply it to the goal,
with its assumptions temporarily removed, using $conv\_tac$.
The original assumptions will be returned to the resulting
subgoals using $check\-\_asm\-\_tac$.
=FRULE 2 Tactic
prove_∃_tac
thms
├
{ Γ } t
├
conv_tac(current_ad_cs_∃_conv())({}, t)
THEN MAP_EVERY check_asm_tac Γ
=TEX
=SEEALSO
$asm\_prove\_∃\_tac$ that does react to any assumptions that
are present.
=FAILURE
51021	The current proof context was created in theory ?0 at a
	point now either not in scope, deleted or modified
=FAILUREC
and as the proof context setting.
=ENDDOC

\section{CONVERSIONS}\label{CONVERSIONS}
(New errors in this section begin with 2813.)
=DOC
val ⦏simple_¬_in_conv⦎ : CONV;
=DESCRIBE
This is a conversion which moves negations inside other predicate
calculus connectives using whichever of the following rules applies:
=GFT
		¬¬t			=	 t
		¬(t1 ∧ t2)		=	 ¬t1 ∨ ¬t2
		¬(t1 ∨ t2)		=	 ¬t1 ∧ ¬t2
		¬(t1 ⇒ t2)		=	 t1 ∧ ¬t2
		¬(t1 ⇔ t2)		=	 (t1 ∧ ¬t2) ∨ (t2 ∧ ¬t1)
		¬(if a then t1 else t2)
					=	 (if a then ¬t1 else ¬t2)
		¬∀x⦁t			=	 ∃x⦁¬t
		¬∃x⦁t			=	 ∀x⦁¬t
		¬∃⋎1x⦁t	=	 ∀x⦁¬(t ∧ ∀x'⦁t[x'] ⇒ x' = x)
		¬T			=	 F
		¬F			=	 T
=TEX
It does not handle paired quantifiers.
=USES
Tactic and conversion programming.
The more general $¬\_in\_conv$ is just as efficient as $simple\_¬\_in\_conv$
in cases where both succeed.
=SEEALSO
$strip\_tac$
=FAILURE
28131	No applicable rules for the term ?0
=ENDDOC
=DOC
val ⦏simple_∃⋎1_conv⦎ : CONV;
=DESCRIBE
This is a conversion which turns a unique existential quantifier into
an equivalent existential quantifier
=FRULE 1 Conversion
simple_∃⋎1_conv
⌜∃⋎1x⦁t⌝
├
├
⊢ (∃⋎1x⦁t[x]) ⇔
	(∃x⦁t[x] ∧ ∀x'⦁t[x'] ⇒ x' = x)
=USES
Tactic and conversion programming.
The more general $∃_1\_conv$ is just as efficient as $simple\_∃_1\_conv$
in cases where both succeed.
=SEEALSO
$strip\_tac$
=FAILURE
4019	?0 is not of form: ⌜∃⋎1 v⦁ t⌝
=ENDDOC
\section{THEOREMS}
The following sets of theorems will be needed to code the tactics and because
of their general utility are saved for reuse (as a space optimisation, since
their proofs are trivial once the tactics defined here are available).
=DOC
val ⦏¬_¬_thm⦎ : THM
val ⦏¬_∨_thm⦎ : THM
val ⦏¬_∧_thm⦎ : THM
val ⦏¬_⇒_thm⦎ : THM
val ⦏¬_⇔_thm⦎ : THM
val ⦏¬_if_thm⦎ : THM
val ⦏¬_f_thm⦎ : THM

val ⦏⇒_thm⦎ : THM
val ⦏⇔_thm⦎ : THM
val ⦏if_thm⦎ : THM
=DESCRIBE
These theorems are tautologies saved in the theory
``misc'' because they are frequently used in tactic
and conversion programming.

The first seven theorems are De Morgan's laws for the various
propositional connectives formulated so that they can be used to normalise
a propositional term by moving all negations inside other connectives.
$¬\_t\_thm$ is also provided but is documented elsewhere.

The last three theorems give definitions for implication, bi-implication
and conditional in terms of disjunction, conjunction and negation.
=GFT
¬_¬_thm		⊢ ∀a⦁¬ ¬a ⇔ a
¬_∨_thm		⊢ ∀a b⦁¬ (a ∨ b) ⇔ (¬a ∧ ¬b)
¬_∧_thm		⊢ ( ¬(a ∧ b) ⇔ (¬a ∨ ¬b)
¬_⇒_thm		⊢ ∀a b⦁¬(a ⇒ b) ⇔ (a ∧ ¬b)
¬_⇔_thm		⊢ ∀ a b ⦁ ¬ (a ⇔ b) ⇔ a ∧ ¬ b ∨ b ∧ ¬ a
¬_if_thm		⊢ ∀ a b ⦁ ¬ (if a then T else T) ⇔ (if a then ¬ T else ¬ T)

¬_f_thm		⊢ ¬F ⇔ T
⇒_thm			⊢ ∀a b⦁(a ⇒ b) ⇔ (¬a ∨ b)
⇔_thm			⊢ ∀a b⦁(a ⇔ b) ⇔ (a ⇒ b) ∧ (b ⇒ a)
if_thm			⊢ ∀a b c⦁(if a then b else c) ⇔ (a ∧ b) ∨ (¬a ∧ c)
=TEX
=SEEALSO
$¬\_t\_thm$.
=ENDDOC
\section{END OF THE SIGNATURE}
=SML
end; (* signature of Tactics2 *)
=TEX
\section{TEST POLICY}
The functions in this document should be tested according to the
general criteria given in \cite{DS/FMU/IED/PLN008}.
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}




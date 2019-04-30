=IGN
********************************************************************************
dtd007.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  dtd007.doc  ℤ $Date: 2011/07/11 11:05:38 $ $Revision: 1.55 $ $RCSfile: dtd007.doc,v $
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

\def\Title{Detailed Design for the Derived Rules of Inference}

\def\AbstractText{This document gives a detailed design for the derived rules of inference in ICL HOL.}

\def\Reference{DS/FMU/IED/DTD007}

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
%% LaTeX2e port: \TPPtitle{Detailed Design for the Derived Rules of Inference}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Detailed Design for the Derived Rules of Inference}
%% LaTeX2e port: \TPPref{DS/FMU/IED/DTD007}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.55 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2011/07/11 11:05:38 $ %
%% LaTeX2e port: }}  %% Mandatory field
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.~Blackburn & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document gives a detailed design for the
%% LaTeX2e port: derived rules of inference in ICL HOL.}
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
\item [Issue 1.1 (1991/02/19)]
First version.
\item [Issue 1.2 (1991/02/28)]
Changes after RDA comments.
\item [Issue 1.3 (1991/03/11),1.4 (1991/03/11)]
Moved statements about Cambridge HOL outside of documentation
boxes.
Added some conversions paralleling the functionality of some of the rules given in \cite{DS/FMU/IED/DTD006} and this document.
\item [Issue 1.5 (1991/05/21)]
Put in designs for primitive and built-in rules,
derived from \cite{DS/FMU/IED/DTD006}.
Some tidying up.
\item [Issue 1.6 (1991/05/29)]
Changed $suc\_conv$ to fail if given $0$, as in proto-type.
Various changes to error messages, introduced a few new
conversionals.
Primitive and built-in inference rules, and conversionals
all module tested to these designs.
\item [Issue 1.7 (1991/05/30)]
Corrected minor errors.
\item [Issue 1.8 (1991/06/03)]
Split contents between this document,
\cite{DS/FMU/IED/DTD026} and \cite{DS/FMU/IED/DTD027}.
\item [Issue 1.9 (1991/06/07)]
Corrected $if$ rules, added $disch\_rule$, placed set material in \cite{DS/FMU/IED/DTD027},
removed $∀\_t\_thm$, added $¬\_thm1$.
\item [Issue 1.11 (1991/06/18)]
Renamed $LIST\_THEN\_C$ to $EVERY\_C$ and $LIST\_ORELSE\_C$ to $FIRST\_C$.
Added $COMB\_C$.
\item [Issue 1.12 (1991/06/18)]
Bought $TOP\_TRAVERSE\_C$ into line with the prototype
$TOP\-\_DEPTH\-\_CONV$, and
$prove\-\_asm\-\_rule$ now ignores missing assumptions.
\item [Issue 1.13 (1991/06/21)]
Results of tests.
Corrected error messages.
Reworked $if$ rules.
\item [Issue 1.14 (1991/06/27)]
Corrected a 6029 error message.
Noted that errors 6036, 6065, 6066 and 6072 are raised by $error$ not $fail$.
Changed $?\_TRAVERSE\_C$ to $?\_MAP\_C$.
$?\_MAP\_C$ all have failure 7005 added.
The prefix $simple$ is moved to being the first prefix, bar $pp'$.
\item[Issue 1.15 (1991/07/03)]
$simple\_∃\_elim$ now does not complain if the assumption in the side-theorem.
Corrected duplicate error messages.
\item[Issue 1.16 (1991/07/03)]
Added $id\_conv$.
\item [Issue 1.17 (1991/07/08)]
Corrected \LaTeX\ errors, and formatting faults:
no code changes.
\item [Issue 1.18 (1991/07/29),1.19 (1991/07/30)]
Changed as result of changes caused by IR0016.
\item [Issue 1.18 (1991/07/29),1.19 (1991/07/30),1.20 (1991/08/06)]
Reacting to issue 1.18 of \cite{DS/FMU/IED/DTD006}.
\item [Issue 1.21 (1991/08/07)]
Removed message 7041 and 7030.
Corrected message 7066.
\item [Issue 1.22 (1991/08/14)]
Dealt with trivial mismatches in message 3014.
\item [Issue 1.23 (1991/08/15)]
Renamings of functions containing the name atom $simple$,
and renaming of $aconv$.
\item [Issue 1.24 (1991/09/10)]
Replaced error message 7045 with 3010.
\item [Issue 1.25 (1991/09/25)]
Added $asm\_inst\_term\_rule$, $simple\_⇒\_match\_mp\_rule1$, $simple\_⇔\_match\_mp\_rule1$,
and $COND\_C$.
Improved error messages.
\item [Issue 1.26 (1991/10/10)]
Tidying up presentation.
\item [Issue 1.27 (1991/10/16)]
Corrected statements of side conditions in $simple\-\_ε\-\_elim\-\_rule$
and $∃\_elim\_rule$.
Tidied so error messages.
\item [Issue 1.28 (1991/10/31)]
Changed description of $all\_simple\_∀\_elim$ to match reality.
\item[Issue 1.29 (1991/11/07)]
Padded out a ``='' that started the line in a display.
\item [Issue 1.30 (1991/11/11)]
Added $plus\_conv$, removed $div2\_conv$ and $mod2\_conv$,
following change request CR007.
\item [Issue 1.31 (1991/11/18)]
Tidying up \LaTeX.

\item[Issue 1.32 (1992/01/20), \FormatDate{92/01/20} ] Updated to use new fonts.
\item[Issue 1.33 (1992/01/27)]
Corrected message 6085, using new font for percent keywords.
\item [Issue 1.34 (1992/03/18) (12th March 1992)] Various minor additions and extensions.
\item [Issue 1.35 (1992/04/14) (13th April 1992)]
Changes due to CR0017.
\item[Issue 1.36 (1992/05/14) (14 May 1992)] Use correct quotation symbols.
\item [Issue 1.37 (1992/05/22) (22nd May 1992)]
Clarifying descriptions.
\item [Issue 1.38 (1992/05/26)(26th May 1992)]
Renamings from version 1.5 of DS/FMU/IED/WRK038.
\item [Issue 1.39 (1992/07/29)]
Changed the $match\_mp\_rule$s to be more uniform with
the $eq\_match\_conv$s.
\item [Issue 1.40 (1992/07/29)(20th August 1992)]
Clarifying text.
\item [Issue 1.42 (1992/09/10)(10th September 1992)]
Fixed a single typo.
\item[Issue 1.43 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.44 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.45 (2005/04/18)] Interfaces to the kernel inference rules are now in the kernel interface module.
\item[Issue 1.46 (2005/12/16)] The prefix for private interfaces is now $pp'$ rather than $icl'$.
\item[Issue 1.47 (2006/10/18)] Acted on pedantic comment about use of ε.
\item[Issue 1.48 (2006/12/02)] Corrected wrong description of $simple\_∃\_elim$.
\item[Issue 1.49 (2007/07/10)] Added documentation and ML binding for {\em cond\_thm}.
\item[Issue 1.50 (2010/11/17), 1.51 (2011/01/30)] Added {simple\_ho\_eq\_match\_conv}.
\item[Issue 1.52 (2011/02/05), 1.53 (2011/02/11)] Added {simple\_⇒\_match\_mp\_rule2}.
\item[Issue 1.54 (2011/02/20)] Fixed error-handling for {simple\_ho\_eq\_match\_conv} and
added {simple\_ho\_eq\_match\_conv1}.
\item[Issue 1.55 (2011/07/11)] Added
=INLINEFT
∃_intro_thm
=TEX
.
\item[Issue 1.56 (2013/01/05)] Corrected reference to the non-existent $ho\_match$.
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
derived rules of inference.
This is called for in \cite{DS/FMU/IED/HLD009}.
The design is
implemented in \cite{DS/FMU/IED/IMP007}.
\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains a detailed design for some
derived rules of inference in Release 001 of ICL HOL.
Though other rules of inference will be introduced, this
document should provide a core set, at least covering the rules
of natural deduction, and providing at least easy access to the functionality
of the rules of inference for the prototype ICL HOL
(other than rewriting)
Studies of this coverage may be found in \cite{DS/FMU/IED/WRK013} and
\cite{DS/FMU/IED/WRK014}.
Rewriting rules are covered by \cite{DS/FMU/IED/DTD026}
and rules of inference concerning paired abstractions
(rather than simple quantifiers) in \cite{DS/FMU/IED/DTD027}.

The document provides groups of rules of inference, related by their core operator.
Certain inference rules are noted as primitive, or built-in.
This means that their implementation will just be ``sugar'' surrounding a call to an inference rule from \cite{DS/FMU/IED/DTD006}, the new name being formed by stripping off the prefix $pp'$ from the name in \cite{DS/FMU/IED/DTD006}.

All functions require all their arguments before they can be evaluated,
unless otherwise noted.
All functions require all their arguments to begin evaluation,
unless otherwise noted.

Note also that the order of declaration given in this document will
not necessarily reflect the order of implementation in
\cite{DS/FMU/IED/IMP007}.

All successful calls of inference rules given in this document,
other than the conversionals, are profiled
(i.e. a call to $prof$ will be made).
\subsubsection{Dependencies}
Loading this document is dependent on those
files indicated as preceding it in the ICL HOL release 001 makefile.

This document places requirements upon the constants handled by the
inference rules discussed.
In summary, the requirements are that the definitions of the constants must be such that the designs of the rules are satisfiable.
\subsubsection{Deficiencies}
Some of the inference rules given may never be useful.
\subsubsection{Possible Enhancements}
As the choice of coverage is not rigidly defined, it is possible
some appropriate functions are not given.
\subsubsection{Terminology}
The following supplements the terminology used in those documents
upon which this one depends.
\begin{tabular}{p{1.3in} p{4.9in}}
existentially quantified theorem & a theorem whose conclusion is a $∃$-term \\
uniquely existentially quantified theorem & a theorem whose conclusion is a $∃⋎1$-term \\
\end{tabular}
\section{INFIX DIRECTIVES}
A Standard ML $infix$ command must be given at the ``top level''.
Thus we give the commands here for those functions declared in the following signatures.
=SML
infix 4 THEN_C;
infix 4 ORELSE_C;
infix 4 THEN_TRY_C;
infix 4 AND_OR_C;
=TEX
(The priorities given are probably not appropriate)
\section{THE DERIVED RULES OF REASONING}
=DOC
signature ⦏DerivedRules1⦎ = sig
=DESCRIBE
This provides the derived rules of inference in Release 001 of ICL HOL.
Though other rules of inference may be introduced, this
document's signature should provide a core set, at least covering the common rules
of natural deduction.
It subsumes the inference rules of the abstract data type $THM$.
=ENDDOC
Note that unusable theorems (e.g. out of scope) will cause the functions underlying
this interface to raise, using $error$, messages 6036, 6065, 6066 and 6072.
These cannot, by convention be caught by the interface functions.
\subsection{Concerning Instantiation}
=DOC
val ⦏inst_term_rule⦎ : (TERM * TERM) list -> THM -> THM;
=DESCRIBE
Parallel instantiation of term variables within a theorem's conclusion to some other values.
=FRULE 1 Rule
inst_term_rule
[..., (⌜ti⌝, ⌜xi⌝), ...]
├
Γ ⊢ t[x1, ..., xn]
├
Γ ⊢ t[t1, ..., tn]
=TEX
A built-in inference rule.
=SEEALSO
$asm\_inst\_term\_rule$
=FAILURE
3007	?0 is not a term variable
6027	Types of element (?0, ?1) in term association list differ
6028	Instantiation variable ?0 free in assumption list
=ENDDOC
($INST$ in Cambridge HOL)
=DOC
val ⦏inst_type_rule⦎ : (TYPE * TYPE) list -> THM -> THM;
=DESCRIBE
Parallel instantiation of some of the type variables of the conclusion of a theorem.
=FRULE 1 Rule
inst_type_rule
[(σ1, tyv1), ..., (σn,tyvn)]
├
Γ ⊢ t[tyv1,...tyvn]
├
Γ ⊢ t[σ1,...σn]
=TEX
$inst\_type\_rule$ $talist$ $thm$ will instantiate each type variable in
$talist$ with its associated type.
It will decorate free variables that would become identified with
other variables (both in conclusion and assumptions)
by their types becoming the same and the names originally being the same.
To instantiate types in the assumption list, see $asm\_inst\_type\_rule$.

A primitive inference rule.
=SEEALSO
$asm\_inst\_type\_rule$ for something that also works
on type variables in the assumption list.
=FAILURE
3019	?0 is not a type variable
6006	Trying to instantiate type variable ?0, which occurs in assumption list
=ENDDOC
($INST\_TYPE$ in Cambridge HOL)

\subsection{Concerning $T$}
$t\_thm$ is declared in section \ref{theorems}.
=DOC
val ⦏⇔_t_intro⦎ :  THM -> THM;
=DESCRIBE
The conclusion of a theorem is equal to $T$.
=FRULE 1 Rule
⇔_t_intro
├
Γ ⊢ t
├
Γ ⊢ t ⇔ T
=TEX
=ENDDOC
($EQT\_INTRO$ in Cambridge HOL)
An informal justification may be found in \cite{DS/FMU/IED/DTD006}.
=DOC
val ⦏⇔_t_elim⦎ :  THM -> THM;
=DESCRIBE
We can always eliminate $\ldots ⇔ T$.
=FRULE 1 Rule
⇔_t_elim
├
Γ ⊢ t ⇔ T
├
Γ ⊢ t
=TEX
=FAILURE
7106	?0 not of the form `Γ ⊢ t ⇔ T`
=ENDDOC
($EQT\_ELIM$ in Cambridge HOL)
An informal justification may be found in \cite{DS/FMU/IED/DTD006}.
\subsection{Concerning $F$}
$f\_thm$ is declared in section \ref{theorems}.
=DOC
val ⦏contr_rule⦎ : TERM -> THM -> THM;
=DESCRIBE
Intuitionistic contradiction rule:
=FRULE 1 Rule
contr_rule
⌜t⌝
├
Γ ⊢ F
├
Γ ⊢ t
=TEX
=FAILURE
7001	?0 is not of form: `Γ ⊢ F`
3031	?0 is not of type ⓣBOOL⌝
=ENDDOC
($CONTR$ in Cambridge HOL)
=DOC
val ⦏c_contr_rule⦎ : TERM -> THM -> THM;
=DESCRIBE
Classical contradiction rule:
=FRULE 1 Rule
c_contr_rule
⌜t⌝
├
Γ, ¬t' ⊢ F
├
Γ ⊢ t
=TEX
Note that the argument is the unnegated form of what must be present
in the assumption list for success.
Works up to $\alpha$-conversion.
=FAILURE
7001	?0 is not of form: `Γ ⊢ F`
3031	?0 is not of type ⓣBOOL⌝
7003	Negation of ?0 is not in assumption list
=ENDDOC
($CCONTR$ in Cambridge HOL)
\subsection{Concerning Negation}
=DOC
val ⦏¬_intro⦎ : TERM -> THM -> THM -> THM;
=DESCRIBE
Given two theorems with contradictory conclusions
(up to $\alpha$-convertibility), their assumptions must be inconsistent, and thus any member of the lists
(or indeed, anything else)
may be proven false on the assumption of the remainder
(reductio ad absurdum).
=FRULE 1 Rule
¬_intro
⌜a⌝
├
Γ1 ⊢ b ; Γ2 ⊢ ¬ b
├
(Γ1 ∪ Γ2) \ {a} ⊢ ¬ a
=TEX
Works up to $\alpha$-conversion, and input theorems may be
in either order.
=FAILURE
3031	?0 is not of type ⓣBOOL⌝
7004	?0 and ?1 are not of the form: `Γ1 ⊢ a` and `Γ2 ⊢ ¬ a`
=ENDDOC
=DOC
val ⦏¬_elim⦎ : TERM -> THM -> THM -> THM;
=DESCRIBE
Given two contradictory theorems with the same assumptions,
conclude any other fact from the assumptions:
input theorems may be
in either order.

=FRULE 1 Rule
¬_elim
⌜b⌝
├
Γ1 ⊢ a ; Γ2 ⊢ ¬ a
├
Γ1 ∪ Γ2 ⊢ b
=TEX
=FAILURE
3031	?0 is not of type ⓣBOOL⌝
7004	?0 and ?1 are not of the form: `Γ1 ⊢ a` and `Γ2 ⊢ ¬ a`
=ENDDOC
=DOC
val ⦏¬_¬_intro⦎ : THM -> THM;
=DESCRIBE
We may always introduce a double negation.
=FRULE 1 Rule
¬_¬_intro
├
Γ ⊢ t
├
Γ ⊢ ¬ (¬ t)
=TEX
=ENDDOC
=DOC
val ⦏¬_¬_elim⦎ : THM -> THM;
=DESCRIBE
A double negation is redundant.
=FRULE 1 Rule
¬_¬_elim
├
Γ ⊢ ¬ (¬ t)
├
Γ ⊢ t
=TEX
=FAILURE
7006	?0 is not of the form: `Γ ⊢ ¬ (¬ t)`
=ENDDOC
=DOC
val ⦏¬_¬_conv⦎ : CONV;
=DESCRIBE
A double negation is redundant.
=FRULE 1 Conversion
¬_¬_conv
⌜¬ (¬ t)⌝
├
├
Γ ⊢ ¬ (¬ t) ⇔ t
=TEX
=FAILURE
7022	?0 is not of the form:⌜¬ (¬ t)⌝
=ENDDOC

\subsection{Concerning ∧}
=DOC
val ⦏∧_intro⦎ : THM -> THM -> THM;
=DESCRIBE
Conjoin two theorems.
=FRULE 1 Rule
∧_intro
├
Γ1 ⊢ t1; Γ2 ⊢ t2
├
Γ1 ∪ Γ2 ⊢ t1 ∧ t2
=TEX
=ENDDOC
($CONJ$ in Cambridge HOL)
If we choose eager renaming, we might want to do a check here for
the identification of distinct free variables in the two theorems.
=DOC
val ⦏∧_left_elim⦎ : THM -> THM;
=DESCRIBE
Give the left conjunct of a conjunction.
=FRULE 1 Rule
∧_left_elim
├
Γ ⊢ t1 ∧ t2
├
Γ ⊢ t1
=TEX
=FAILURE
7007	?0 is not of the form: `Γ ⊢ t1 ∧ t2`
=ENDDOC
($CONJUNCT1$ in Cambridge HOL)
=DOC
val ⦏∧_right_elim⦎ : THM -> THM;
=DESCRIBE
Give the right conjunct of a conjunction.
=FRULE 1 Rule
∧_right_elim
├
Γ ⊢ t1 ∧ t2
├
Γ ⊢ t2
=TEX
=FAILURE
7007	?0 is not of the form: `Γ ⊢ t1 ∧ t2`
=ENDDOC
($CONJUNCT2$ in Cambridge HOL)
Cambridge HOL has $CONJ\_PAIR$, that returns the pair of theorems
resulting individually from the above two elimination rules.
We choose not to provide this.
=DOC
val ⦏list_∧_intro⦎ : THM list -> THM;
=DESCRIBE
Conjoin a list of theorems.
=FRULE 1 Rule
list_∧_intro
├
[Γ1 ⊢ t1, ..., Γn ⊢ tn]
├
Γ1 ∪ ... Γn ⊢ t1 ∧ ... tn
=TEX
=FAILURE
7107	List may not be empty
=ENDDOC
($LIST\_CONJ$ in Cambridge HOL)
=DOC
val ⦏strip_∧_rule⦎ : THM -> THM list;
=DESCRIBE
Break a theorem into conjuncts as far as possible.
=FRULE 1 Rule
strip_∧_rule
├
Γ ⊢ t
├
[Γ ⊢ t1, ..., Γ ⊢ tn]
=TEX
where $t$ can be formed from the $t_i$ by $∧\_intro$ alone, with
no duplication, exception or reordering.
=EXAMPLE
strip_∧_rule `⊢ (a ∧ b) ∧ (a ∧ c ∧ d)`
 =
[`⊢ a`, `⊢ b`, `⊢ a`, `⊢ c`, `⊢ d`]
=ENDDOC
($CONJUNCTS$ in Cambridge HOL)
=DOC
val ⦏⇒_∧_rule⦎ : THM -> THM;
=DESCRIBE
A theorem whose conclusion is an implication of an implication is equivalent to one whose conclusion is a conjunction and an
implication.
=FRULE 1 Rule
⇒_∧_rule
├
Γ ⊢ a ⇒ b ⇒ c
├
Γ ⊢ (a ∧ b) ⇒ c
=TEX
=FAILURE
7008	?0 is not of the form: `Γ ⊢ a ⇒ b ⇒ c`
=ENDDOC
=DOC
val ⦏∧_⇒_rule⦎ : THM -> THM;
=DESCRIBE
A theorem whose conclusion is an implication from a conjunction is an equivalent to one whose conclusion is an implication of an implication.
=FRULE 1 Rule
∧_⇒_rule
├
Γ ⊢ (a ∧ b) ⇒ c
├
Γ ⊢ a ⇒ b ⇒ c
=TEX
=FAILURE
7009	?0 is not of the form: `Γ ⊢ (a ∧ b) ⇒ c`
=ENDDOC
The above two are from \cite{Manna74}, as derived rules
of inference.

\subsection{Concerning ∨}
=DOC
val ⦏∨_left_intro⦎ : TERM -> THM -> THM;
=DESCRIBE
Introduce a disjunct to the left of a theorem's conclusion.
=FRULE 1 Rule
∨_left_intro
⌜a⌝
├
Γ ⊢ b
├
Γ ⊢ a ∨ b
=TEX
=FAILURE
3031	?0 is not of type ⓣBOOL⌝
=ENDDOC
($DISJ2$ in Cambridge HOL)
=DOC
val ⦏∨_right_intro⦎ : TERM -> THM -> THM;
=DESCRIBE
Introduce a disjunct to the right of a theorem's conclusion.
=FRULE 1 Rule
∨_right_intro
⌜a⌝
├
Γ ⊢ b
├
Γ ⊢ b ∨ a
=TEX
=FAILURE
3031	?0 is not of type ⓣBOOL⌝
=ENDDOC
($DISJ1$ in Cambridge HOL)

=DOC
val ⦏∨_elim⦎ : THM -> THM -> THM -> THM;
=DESCRIBE
Given a disjunctive theorem, and two further theorems, each
containing one of the disjuncts in their assumptions, but
with the same conclusion, we may eliminate the disjunct assumption
from the second of the theorems.
=FRULE 1 Rule
∨_elim
├
Γ1 ⊢ t1 ∨ t2
Γ2, t1' ⊢ t
Γ3, t2' ⊢ t'
├
Γ1 ∪ Γ2 ∪ Γ3 ⊢ t
=TEX
where $t1$ and $t1'$ are $\alpha$-convertible, as are
$t2$ and $t2'$, and $t$ and $t'$.
Actually, $t1'$ and $t2'$ do not have to be present in the
assumption lists for this function to work.
=FAILURE
7010	?0 is not of the form: `Γ ⊢ t1 ∨ t2`
7083	?0, ?1 and ?2 are not of the form: `Γ1 ⊢ t1 ∨ t2`, `Γ2, t1a ⊢ t3`
	and `Γ3, t2a ⊢ t3a`, where ⌜t1⌝ and ⌜t1a⌝, ⌜t2⌝ and ⌜t2a⌝,
	⌜t3⌝ and ⌜t3a⌝ are each α-convertible
=ENDDOC
($DISJ\_CASES$ in Cambridge HOL)

=DOC
val ⦏∨_cancel_rule⦎ : THM -> THM -> THM;
=DESCRIBE
If we know a disjunction is true, and one of its disjuncts is
false, then the other must be true.
If the second theorem is the negation of both disjuncts,
then the second disjunct will be eliminated.
(modus tollendo ponens)
=FRULE 1 Rule
∨_cancel_rule
├
Γ1 ⊢ t1 ∨ t2; Γ2 ⊢ ¬t1'
├
Γ1 ∪ Γ2 ⊢ t2
=TEX
And:
=FRULE 1 Rule
∨_cancel_rule
├
Γ1 ⊢ t1 ∨ t2; Γ2 ⊢ ¬t2'
├
Γ1 ∪ Γ2 ⊢ t1
=TEX
where $t1'$ and $t1$ are $\alpha$-convertible, as are
$t2$ and $t2'$.
=FAILURE
7010	?0 is not of the form: `Γ ⊢ t1 ∨ t2`
7050	?0 and ?1 are not of the form: `Γ1 ⊢ t1 ∨ t2` and `Γ2 ⊢ ¬t3`
	where ⌜t3⌝ is α-convertible to ⌜t1⌝ or ⌜t2⌝
=ENDDOC
\subsection{Concerning ⇒}
=DOC
val ⦏⇒_intro⦎ : TERM -> THM -> THM;
=DESCRIBE
Prove an implicative theorem, removing, if $\alpha$-convertibly present, the antecedent of the implication from the assumption list.
=FRULE 1 Rule
⇒_intro
⌜t1⌝
├
Γ ⊢ t2
├
Γ - {t1} ⊢ t1 ⇒ t2
=TEX
A primitive inference rule.
=SEEALSO
$disch\_rule$ (which fails if term not in assumption list)
=FAILURE
3031	?0 is not of type ⓣBOOL⌝
=ENDDOC
($DISCH$ in Cambridge HOL)
=DOC
val ⦏disch_rule⦎ : TERM -> THM -> THM;
=DESCRIBE
Prove an implicative theorem, removing, if $\alpha$-convertibly present, the antecedent of the implication from the assumption list,
and failing if it is not present.
=FRULE 1 Rule
disch_rule
⌜t1⌝
├
Γ, t1' ⊢ t2
├
Γ ⊢ t1 ⇒ t2
=TEX
=SEEALSO
$⇒\_intro$ (which does not fail if term not in assumption list)
=FAILURE
7031	?0 not α-convertibly present in assumption list
=ENDDOC
($DISCH$ in Cambridge HOL)
=DOC
val ⦏⇒_elim⦎ : THM -> THM -> THM;
val ⦏⇒_mp_rule⦎ : THM -> THM -> THM;
=DESCRIBE
Modus Ponens
(which is why we introduce the alias $⇒\_mp\_rule$,
though $⇒\_elim$ is shorter, conventional, and the preferred name).
=FRULE 1 Rule
⇒_elim
├
Γ1 ⊢ t1 ⇒ t2; Γ2 ⊢ t1'
├
Γ1 ∪ Γ2 ⊢ t2
=TEX
where $t1$ and $t1'$ must be $\alpha$-convertible.
A primitive inference rule.
=SEEALSO
$⇔\_mp\_rule$(Modus Ponens on $⇔$),
$⇒\_match\_mp\_rule$ (a ``matching'' version of this function).
=FAILURE
6010	?0 is not of the form: `Γ ⊢ t1 ⇒ t2`
6011	?0 and ?1 are not of the forms: `Γ1 ⊢ t1 ⇒ t2` and `Γ2 ⊢ t1'` where
	⌜t1⌝ and ⌜t1'⌝ are α-convertible
=ENDDOC
($MP$ in Cambridge HOL)
=DOC
val ⦏simple_⇒_match_mp_rule⦎ : THM -> THM -> THM ;
=DESCRIBE
A matching Modus Ponens rule for an implicative theorem.
=FRULE 1 Rule
simple_⇒_match_mp_rule
├
Γ1 ⊢ ∀ x1 ... ⦁ t1 ⇒ t2; Γ2 ⊢ t1'
├
Γ1 ∪ Γ2 ⊢ t2'
=TEX
where $t1'$ is an instance of $t1$ under type instantiation
and substitution for the $x⋎i$ and the free variables of the
first theorem, and where $t2'$
is the corresponding instance of $t2$.
No type instantiation or substitution will occur in the assumptions of either
theorem.
=SEEALSO
$simple\_⇒\_match\_mp\_rule1$, $simple\_⇒\_match\_mp\_rule2$
=FAILURE
7044	Cannot match ?0 and ?1
7045	?0 is not of the form `Γ ⊢ ∀ x1 ... xn ⦁ u ⇒ v`
=ENDDOC
($MATCH\_MP$ in Cambridge HOL)
=DOC
val ⦏simple_⇒_match_mp_rule1⦎ : THM -> THM -> THM ;
val ⦏simple_⇒_match_mp_rule2⦎ : THM -> THM -> THM ;
=DESCRIBE
Two variants on a matching Modus Ponens rule for an implicative theorem.
=FRULE 1 Rule
simple_⇒_match_mp_rule1
├
Γ1 ⊢ ∀ x1 ... ⦁ t1 ⇒ t2; Γ2 ⊢ t1'
├
Γ1 ∪ Γ2 ⊢ t2'
=TEX
where $t1'$ is an instance of $t1$ under type instantiation
and substitution for the $x⋎i$ (but not free variables), and where $t2'$
is the corresponding instance of $t2$.

=INLINEFT
simple_⇒_match_mp_rule2
=TEX
\ is just like
=INLINEFT
simple_⇒_match_mp_rule1
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

=SEEALSO
$simple\_⇒\_match\_mp\_rule$
=FAILURE
7044	Cannot match ?0 and ?1
7045	?0 is not of the form `Γ ⊢ ∀ x1 ... xn ⦁ u ⇒ v`
=ENDDOC

=DOC
val ⦏undisch_rule⦎ : THM -> THM ;
=DESCRIBE
Undischarge the antecedent of an implicative theorem into the assumption list.
=FRULE 1 Rule
undisch_rule
├
Γ ⊢ a ⇒ b
├
Γ ∪ {a} ⊢ b
=TEX
=FAILURE
7011	?0 is not of the form: `Γ ⊢ a ⇒ b`
=ENDDOC
($UNDISCH$ in Cambridge HOL)
=DOC
val ⦏strip_⇒_rule⦎ : THM -> THM;
=DESCRIBE
Repeatedly apply $undisch\_rule$:
=FRULE 1 Rule
strip_⇒_rule
├
Γ ⊢ t1 ⇒ ... ⇒ tn ⇒ t
├
Γ ∪ {t1, ..., tn} ⊢ t
=TEX
=ENDDOC
($UNDISCH\_ALL$ in Cambridge HOL)
=DOC
val ⦏all_⇒_intro⦎ :THM -> THM;
=DESCRIBE
Discharge all members of assumption list using $⇒\_intro$.
=FRULE 1 Rule
all_⇒_intro
├
{t1, ..., tn} ⊢ t
├
⊢ t1 ⇒ ... ⇒ tn ⇒ t
=TEX
=ENDDOC
($DISCH\_ALL$ in Cambridge HOL)
=DOC
val ⦏⇒_trans_rule⦎ : THM -> THM -> THM;
=DESCRIBE
Transitivity of $⇒$.
=FRULE 1 Rule
⇒_trans_rule
├
Γ1 ⊢ t1 ⇒ t2; Γ2 ⊢ t2' ⇒ t3
├
Γ1 ∪ Γ2 ⊢ t1 ⇒ t3
=TEX
where $t2$ and $t2'$ are $\alpha$-convertible.
=FAILURE
7040	?0 is not of the form: `Γ ⊢ t1 ⇒ t2`
7042	?0 and ?1 are not of the form: `Γ1 ⊢ t1 ⇒ t2` and `Γ2 ⊢ t2a ⇒ t3`
	where ⌜t2⌝ and ⌜t2a⌝ are α-convertible
=ENDDOC
($IMP\_TRANS$ in Cambridge HOL)
=DOC
val ⦏modus_tollens_rule⦎ : THM -> THM -> THM;
=DESCRIBE
If the consequent of an implicative theorem is false, then so must be
the antecedent (modus tollens).
=FRULE 1 Rule
modus_tollens_rule
├
Γ1 ⊢ t1 ⇒ t2; Γ2 ⊢ ¬t2'
├
Γ1 ∪ Γ2 ⊢ ¬t1
=TEX
where $t2$ and $t2'$ are $\alpha$-convertible.
=FAILURE
7040	?0 is not of the form: `Γ ⊢ t1 ⇒ t2`
7051	?0 and ?1 are not of the form: `Γ1 ⊢ t1 ⇒ t2` and `Γ2 ⊢ ¬t2a`
	where ⌜t2⌝ and ⌜t2a⌝ are α-convertible
=ENDDOC
This might be renamed $mt\_rule$ if we wanted the name shortened.
\subsection{Concerning ⇔}
This section is complemented by the inference rules
concerning equality, section \ref{EqualityInference}

=DOC
val ⦏⇔_intro⦎ : THM -> THM -> THM;
=DESCRIBE
Join two implicative theorems into an bi-implicative theorem.
=FRULE 1 Rule
⇔_intro
├
Γ1 ⊢ t1 ⇒ t2; Γ2 ⊢ t1' ⇒ t2'
├
Γ1 ∪ Γ2 ⊢ t1 ⇔ t2
=TEX
where $t1$ and $t1'$ are $\alpha$-convertible, as are
$t2$ and $t2'$.
=FAILURE
7040	?0 is not of the form: `Γ ⊢ t1 ⇒ t2`
7064	?0 and ?1 are not of the form: `Γ ⊢ t1 ⇒ t2; Γ ⊢ t2a ⇒ t1a`
	where ⌜t1⌝ and ⌜t1a⌝, ⌜t2⌝ and ⌜t2a⌝, are α-convertible
=ENDDOC
($CONJ\_IFF$ and $IMP\_ANTISYM\_RULE$ in Cambridge HOL)
=DOC
val ⦏⇔_elim⦎ : THM -> (THM * THM);
=DESCRIBE
Split a bi-implicative theorem into two implicative theorems.
=FRULE 1 Rule
⇔_elim
├
Γ ⊢ t1 ⇔ t2
├
Γ ⊢ t1 ⇒ t2; Γ ⊢ t2 ⇒ t1
=TEX
=FAILURE
7062	?0 is not of the form: `Γ ⊢ t1 ⇔ t2`
=ENDDOC
($IFF\_CONJ$ and $EQ\_IMP\_RULE$ in Cambridge HOL)
Perhaps we want to give
$⇔\_left\_elim$ and $⇔\_right\_elim$ as well,
being no more than $fst\ o\ ⇔\_elim$ and $snd\ o\ ⇔\_elim$.
=DOC
val ⦏⇔_mp_rule⦎ : THM -> THM -> THM;
=DESCRIBE
This is reminiscent of Modus Ponens, but upon bi-implicative theorems.
=FRULE 1 Rule
⇔_mp_rule
├
Γ1 ⊢ t1 ⇔ t2; Γ2 ⊢ t1'
├
Γ1 ∪ Γ2 ⊢ t2
=TEX
where $t1$ and $t1'$ must be $\alpha$-convertible.

A built-in inference rule.
=SEEALSO
$⇒\_elim$ (true Modus Ponens, on $⇒$),
$⇔\_match\_mp\_rule$ (a ``matching'' version of $⇔\_mp\_rule$)
=FAILURE
6024	?0 and ?1 are not of the form: `Γ1 ⊢ t1 ⇔ t2` and `Γ2 ⊢ t1'`
	where ⌜t1⌝ and ⌜t1'⌝ are α-convertible
6030	?0 is not of the form: `Γ ⊢ t1 ⇔ t2`
=ENDDOC
($EQ\_MP$ in Cambridge HOL)

=DOC
val ⦏simple_⇔_match_mp_rule⦎ : THM -> THM -> THM;
=DESCRIBE
A matching Modus Ponens for $⇔$.
=FRULE 1 Rule
simple_⇔_match_mp_rule
├
Γ1 ⊢ ∀ x1 ... ⦁ t1 ⇔ t2; Γ2 ⊢ t1'
├
Γ1' ∪ Γ2 ⊢ t2'
=TEX
where $t1'$ is an instance of $t1$ under type instantiation
and substitution for the $x⋎i$ and the free variables of the
first theorem, and where $t2'$
is the corresponding instance of $t2$.
No type instantiation or substitution will occur in the assumptions of either
theorem.
=SEEALSO
$⇒\_elim$ (Modus Ponens on $⇒$),
$simple\_⇔\_match\_mp\_rule$
=FAILURE
7044	Cannot match ?0 and ?1
7046	?0 is not of the form `Γ ⊢ ∀ x1 ... xn ⦁ u ⇔ v`
=ENDDOC
=DOC
val ⦏simple_⇔_match_mp_rule1⦎ : THM -> THM -> THM;
=DESCRIBE
A matching Modus Ponens for $⇔$ that doesn't affect assumption lists.
=FRULE 1 Rule
simple_⇔_match_mp_rule1
├
Γ1 ⊢ ∀ x1 ... ⦁ t1 ⇔ t2; Γ2 ⊢ t1'
├
Γ1 ∪ Γ2 ⊢ t2'
=TEX
where $t1'$ is an instance of $t1$ under type instantiation
and substitution for the $x⋎i$ (but not free variables), and where $t2'$
is the corresponding instance of $t2$.
Types in the assumptions of the theorems will not be instantiated.
=SEEALSO
$⇒\_elim$ (Modus Ponens on $⇒$),
$simple\_⇔\_match\_mp\_rule1$
=FAILURE
7044	Cannot match ?0 and ?1
7046	?0 is not of the form `Γ ⊢ ∀ x1 ... xn ⦁ u ⇔ v`
=ENDDOC

\subsection{Concerning =}
\label{EqualityInference}
=DOC
val ⦏subst_rule⦎ : (THM * TERM) list -> TERM -> THM -> THM;
=DESCRIBE
Substitution of equational theorems according to a template.
=FRULE 1 Rule
subst_rule
├
[Γ1 ⊢ t1=t1', ... , Γn ⊢ tn=tn']
Γ ⊢ t[t1,...tn]
├
Γ1 ∪ ... Γn ∪ Γ ⊢ t[t1',...tn']
=TEX
$subst\_rule$ $[(thm_1, x_1),\ldots,(thm_n, x_n)]$ $template$ $thm$
returns a theorem in which $template$ determines where in $thm$ the $thm_i$ are substituted.
The $x_i$ must be variables.
The template is of the form $t[x_1,\ldots,x_n]$, and wherever the $x_i$ are free in $template$ their associated equational theorem, $thm_i$,
is substituted into $thm$.
The rule will rename as necessary to avoid bound variable capture.
The assumption list of the resulting theorem will be the union of all
substitution theorems, regardless of use.

The conclusion of the resulting theorem will take its bound variable names
from $template$, not $thm$, as shown in the following example.
This provides an $\alpha$-conversion facility.

The function may be usefully partially evaluated with one or two arguments.

A primitive inference rule.
=EXAMPLE
subst_rule [(`⊢ p = q`, ⌜x1⌝), (`⊢ r = s`, ⌜x2⌝)]
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
=ENDDOC
($SUBST$ in Cambridge HOL)

=DOC
val ⦏subst_conv⦎ : (THM * TERM) list -> TERM -> CONV;
=DESCRIBE
Substitution of equational theorems according to a template.
=FRULE 1 Conversion
subst_conv
[...,(`Γi ⊢ ti=ti'`,⌜xi⌝), ...]
⌜t[...,xi,...]⌝
⌜t[...,ti,...]⌝
├
├
Γ1 ∪ ... Γn ⊢ t[...,ti,...] = t[...,ti',...]
=TEX

$subst\_conv$ $[(thm_1, x_1),\ldots,(thm_n, x_n)]$ $template$ $term$
returns a theorem in which $template$ determines where in $term$ the $thm_i$ are substituted, when forming the RHS of the equation.
The $x_i$ must be variables.
The template is of the form $t[x_1,\ldots,x_n]$, and wherever the $x_i$ are free in $template$ their associated equational theorem, $thm_i$,
is substituted into $thm$.
The rule will rename as necessary to avoid bound variable capture.
The assumption list of the resulting theorem will be the union of all
substitution theorems, regardless of use.

The RHS of the resulting theorem will take its bound variable names
from $template$, not $term$, as shown in the following example.
This provides an $\alpha$-conversion facility.

This function may be partially evaluated with only one argument.
=EXAMPLE
subst_conv [(`⊢ p = q`, ⌜x1⌝), (`⊢ r = s`, ⌜x2⌝)]
	(⌜∀ y ⦁ f x1 r y + g x2 p = h y⌝)
	(⌜∀ x ⦁ f p r x + g r p = h x⌝)
	=
	`⊢ (∀ x ⦁ f p r x + g r p = h x) ⇔
	    ∀ y ⦁ f q r y + g s p = h y`
=SEEALSO
$subst\_rule$
=FAILURE
3007	?0 is not a term variable
3012	?0 and ?1 do not have the same types
6001	?0 does not substitute to conclusion of theorem ?1
6002	Substitution theorem ?0 is not of the form: `Γ ⊢ t1 = t2`
6029	Substitution list contains entry (?0,?1) where the type of the variable
	differs from the type of the LHS of the theorem
=ENDDOC
=DOC
val ⦏refl_conv⦎ : CONV;
=DESCRIBE
The reflexivity of equality implemented as a conversion.
=FRULE 1 Rule
refl_conv
⌜t⌝
├
├
⊢ t = t
=TEX
A primitive inference rule.
=ENDDOC
($ALL\_CONV$ and $REFL$ in Cambridge HOL)
=DOC
val ⦏eq_trans_rule⦎ : THM -> THM -> THM;
=DESCRIBE
Transitivity of equality:
=FRULE 1 Rule
eq_trans_rule
├
Γ1 ⊢ t1 = t2; Γ2 ⊢ t2' = t3
├
Γ1 ∪ Γ2 ⊢ t1 = t3
=TEX
where $t2$ and $t2'$ are $\alpha$ convertible.
A built-in inference rule.
=FAILURE
6020	?0 is not of the form: `Γ ⊢ t1 = t2`
6022	?0 and ?1 are not of the form: `Γ1 ⊢ t1 = t2` and `Γ2 ⊢ t2a = t3`
	where ⌜t2⌝ and ⌜t2a⌝ are α-convertible
=ENDDOC
($TRANS$ in Cambridge HOL)
=DOC
val ⦏eq_sym_rule⦎ : THM -> THM;
=DESCRIBE
Symmetry of equality:
=FRULE 1 Rule
eq_sym_rule
├
Γ ⊢ t1 = t2
├
Γ ⊢ t2 = t1
=TEX
A built-in inference rule.
=SEEALSO
$eq\_sym\_conv$
=FAILURE
6020	?0 is not of the form: `Γ ⊢ t1 = t2`
=ENDDOC
($SYM$ in Cambridge HOL)
=DOC
val ⦏eq_sym_conv⦎ : CONV;
=DESCRIBE
Symmetry of equality:
=FRULE 1 Rule
eq_sym_conv
⌜t1 = t2⌝
├
├
⊢ (t1 = t2) ⇔ (t2 = t1)
=TEX
=SEEALSO
$eq\_sym\_rule$
=FAILURE
3014	?0 is not of form: ⌜t = u⌝
=ENDDOC
($SYM\_CONV$ in Cambridge HOL)
=DOC
val ⦏¬_eq_sym_rule⦎ : THM -> THM ;
=DESCRIBE
If $a$ is not equal to $b$ then $b$ is not equal to $a$.
=FRULE 1 Rule
¬_eq_sym_rule
├
Γ ⊢ ¬(a = b)
├
Γ ⊢ ¬(b = a)
=TEX
=FAILURE
7091	?0 is not of form: `Γ ⊢ ¬(a = b)`
=ENDDOC
($NOT\_EQ\_SYM$ in Cambridge HOL)
=DOC
val ⦏simple_eq_match_conv⦎ : THM -> CONV ;
=DESCRIBE
This matches the LHS of an equational theorem to a term,
instantiating the RHS accordingly.
In fact the equation may be partially or fully universally quantified
(simple quantification only),
without affecting the result of the conversion.
=FRULE 1 Conversion
simple_eq_match_conv
(Γ ⊢ ∀ ... ⦁ u = v)
⌜t⌝
├
├
Γ' ⊢ t = v'
=TEX
where $v'$ is the result of applying to $v$ the instantiation rules required to match $u$ to $t$
(including both term and type instantiation).
If there are free variables on the RHS of the supplied equational theorem (when stripped of all universal quantification)
they will be renamed as necessary to avoid identification with
any variables in $t$.
=FAILURE
7044	Cannot match ?0 and ?1
=ENDDOC
($REWRITE\_CONV$ in Cambridge HOL)
The process of renaming to avoid identification is a minimum requirement on free variables on the RHS.
More powerful requirements (e.g. something like Cambridge HOL's $genvar$) could be appropriate.
=DOC
val ⦏simple_eq_match_conv1⦎ : THM -> CONV ;
=DESCRIBE
This matches the LHS of an universally quantified (simple quantifiers only) equational theorem to a term,
instantiating the RHS accordingly.
The conversion will only instantiate its universal quantifications,
and type variables not present in the assumptions,
and not its free term variables.
=FRULE 1 Conversion
simple_eq_match_conv1
(Γ ⊢ ∀ x1 ... xn ⦁ u[x1,...,xn] =
   v[x1,...,xn])
⌜t⌝
├
├
Γ ⊢ t = v[t1,...,tn]
=TEX
where ⌜u[t1,...,tn]⌝ is $\alpha$-convertible to ⌜t⌝.
If there are free variables on the RHS of the supplied equational theorem(when stripped of all universal quantification)
they will be renamed as necessary to avoid identification with
any variables in $t$.

This conversion may be partially evaluated with only its theorem argument.
=USES
In producing a limited rewriting facility, that only instantiates
explicitly identified variables.
=FAILURE
7095	?0 is not of the form `Γ ⊢ ∀ x1 ... xn ⦁ u = v` where ⌜xi⌝ are variables
7076	Could not match term ?0 to LHS of theorem ?1
=ENDDOC
An alternative method of indicating what may be instantiated
is to give a ``forbidden list'' of variables that may not be instantiated,
whether they be universally quantified or free in the original theorem.
This could of course be a ``only modify'' list instead.

As this is calculated once per application of $eq\_match\_1_conv$ to a theorem, and not once per application to a term, it is not
a major potential time-saver either way.
What this function must be fast at is its application to a term.

We may want a specialised $term\_match$ function that understands
a ``forbidden list'' of variables that it may not modify.

We might also want some way of matching, such that free variables in the assumption list are also instantiated. This would work best with a ``forbidden list'' style, rather than a style that only
allows the universally quantified variables to be instantiated.
This question is particularly important if we want the possibility
of clever assumption introduction mechanisms during rewriting,
especially those involved in rewriting with implicative theorems.
\subsection{Concerning $if\ldots then\ldots else \ldots$}

=DOC
val ⦏if_intro⦎ : TERM -> THM -> THM -> THM;
=DESCRIBE
Introduce a conditional, based on the assumptions of two theorems.
=FRULE 1 Rule
if_intro
⌜a⌝
├
Γ1, a ⊢ tt ;  Γ2, ¬a' ⊢ et
├
Γ1 ∪ Γ2 ⊢ if a then tt else et
=TEX
where $a$ and $a'$ are $\alpha$-convertible.
Actually, the assumptions may be missing, and the rule still works.
=EXAMPLE
(⊢ x = tt), (⊢ x = te)			(* hypothesis *)
⊢ if a then (x = tt) else (x = te) 	(* if_intro ⌜a⌝ *)
⊢ x = if a then tt else te		(* if_fun_rule *)
=FAILURE
3031	?0 is not of type ⓣBOOL⌝
=ENDDOC
Perhaps the theorems could be in either order, the rule working out
which.
=DOC
val ⦏if_then_elim⦎ : THM -> THM;
=DESCRIBE
Give the dependence of the $then$ branch of a conditional
upon the condition.
=FRULE 1 Rule
if_then_elim
├
Γ ⊢ if tc then tt else te
├
Γ ⊢ tc ⇒ tt
=TEX
=FAILURE
7012	?0 is not of the form: `Γ ⊢ if tc then tt else te`
=ENDDOC
=DOC
val ⦏if_else_elim⦎ : THM -> THM;
=DESCRIBE
Give the dependence of the $else$ branch of a conditional
upon the condition.
=FRULE 1 Rule
if_else_elim
├
Γ ⊢ if tc then tt else te
├
Γ ⊢ ¬ tc ⇒ te
=TEX
=FAILURE
7012	?0 is not of the form: `Γ ⊢ if tc then tt else te`
=ENDDOC

As the ICL HOL conditional on booleans is the same as that on other
types,  we choose a different presentation to \cite{Manna74},
where this is not true.
However, Manna's rules for conditionals on other types can be derived from those present here, and vice versa.
=DOC
val ⦏if_app_conv⦎ : CONV;
=DESCRIBE
Move a function application out of a conditional.
=FRULE 1 Conversion
if_app_conv
⌜(if a then f b else f c)⌝
├
├
⊢ (if a then f b else f' c) =
	f(if a then b else c)
=TEX
where $f$ and $f'$ are $\alpha$-convertible, and $f$
is used on the RHS of the resulting equational theorem
=FAILURE
7037	?0 is not of the form: ⌜if a then (f b) else (g c)⌝
7038	?0 is not of the form: ⌜if a then (f b) else (fa c)⌝
	where ⌜f⌝ and ⌜fa⌝ are α-convertible
=ENDDOC
=DOC
val ⦏app_if_conv⦎ : CONV;
=DESCRIBE
Move a function application into a conditional.
=FRULE 1 Conversion
app_if_conv
⌜f(if a then b else c)⌝
├
├
⊢ f(if a then b else c) =
	(if a then f b else f c)
=TEX
=FAILURE
7098	?0 is not of the form: ⌜f(if a then b else c)⌝
=ENDDOC

\subsection{Concerning λ}
=DOC
val ⦏simple_β_conv⦎ : CONV;
=DESCRIBE
Apply a $\beta$-reduction to a simple abstraction.
=FRULE 1 Conversion
simple_β_conv
⌜(λ x ⦁ t1[x]) t2⌝
├
├
⊢ (λ x ⦁ t1[x]) t2 = t1[t2]
=TEX
A primitive inference rule.
=SEEALSO
$\beta\_conv$
=FAILURE
6012	?0 is not of the form: ⌜(λ x ⦁ t1[x])t2⌝ where ⌜x⌝ is a variable
=ENDDOC
($BETA\_CONV$ in Cambridge HOL)
=DOC
val ⦏simple_λ_eq_rule⦎ : TERM -> THM -> THM;
=DESCRIBE
Given an equational theorem, return the equation formed by abstracting the term argument (which must be a variable) from both sides.
=FRULE 1 Rule
simple_λ_eq_rule
⌜x⌝
├
Γ ⊢ t1[x] = t2[x]
├
Γ ⊢ (λ x ⦁ t1[x]) = (λ x ⦁ t2[x])
=TEX
A primitive inference rule.
=SEEALSO
$λ\_eq\_rule$
=FAILURE
3007	?0 is not a term variable
6005	?0 occurs free in assumption list
6020	?0 is not of the form: `Γ ⊢ t1 = t2`
=ENDDOC
($SIMPLE\_λ$ in Cambridge HOL)
=DOC
val ⦏λ_rule⦎ : TERM -> THM -> THM;
=DESCRIBE
An introduction rule for $λ$:
=FRULE 1 Rule
λ_rule
⌜t⌝
├
Γ ⊢ s[t]
├
Γ ⊢ (λ x ⦁ s[x]) t
=TEX
where $x$ is a machine generated variable.
=ENDDOC
=DOC
val ⦏all_simple_β_conv⦎ : CONV;
=DESCRIBE
A conversion to eliminate all instances of simple $\beta$ redexes in a term, regardless of nesting, or even that the $\beta$ redex was created as the result of
an earlier reduction in the conversion's evaluation.
=FRULE 1 Rule
all_simple_β_conv
⌜t⌝
├
├
⊢ t = t'
=TEX
$t'$ is $t$ with all simple $\beta$ redexes reduced.
=USES
This uses an optimised term traversal algorithm, superior in speed
to the general term traversal algorithms used with conversions,
and should be used in preference to them and $\beta\_conv$.
=FAILURE
7020	?0 contains no β-redexes
=ENDDOC
=DOC
val ⦏all_simple_β_rule⦎ : THM -> THM;
=DESCRIBE
Eliminate all instances of simple $\beta$ redexes in a theorem, regardless of nesting, or even that the $\beta$ redex was created as the result of
an earlier reduction in the rule's evaluation.
=FRULE 1 Rule
all_simple_β_rule
├
Γ ⊢ t
├
Γ ⊢ t'
=TEX
$t'$ is $t$ with all $\beta$-redexes reduced.
=FAILURE
7020	?0 contains no β-redexes
=ENDDOC
($BETA\_RULE$ in Cambridge HOL)

\subsection{Concerning ∀}
=DOC
val ⦏simple_∀_intro⦎ : TERM -> THM -> THM;
=DESCRIBE
Introduce a simple universally quantified theorem.
=FRULE 1 Rule
simple_∀_intro
⌜x⌝
├
Γ ⊢ t
├
Γ ⊢ ∀ x ⦁ t
=TEX
A built-in inference rule.
=SEEALSO
$∀\_intro$
=FAILURE
3007	?0 is not a term variable
6005	?0 occurs free in assumption list
=ENDDOC
($GEN$ in Cambridge HOL)
=DOC
val ⦏simple_∀_elim⦎ : TERM -> THM -> THM;
=DESCRIBE
Instantiate a universally quantified variable to a given value.
=FRULE 1 Rule
simple_∀_elim
⌜t1⌝
├
Γ ⊢ ∀ x ⦁ t2[x]
├
Γ ⊢ t2'[t1]
=TEX
where $t2'$ is renamed from $t2$ to prevent bound variable capture,
and $x$ is a variable.
=FAILURE
3012	?0 and ?1 do not have the same types
7039	?0 is not of the form: `Γ ⊢ ∀ x ⦁ t` where ⌜x⌝ is a variable
=ENDDOC
($SPEC$ in Cambridge HOL)
=DOC
val ⦏list_simple_∀_intro⦎ : TERM list -> THM -> THM;
=DESCRIBE
Generalised simple $∀$ introduction.
=FRULE 1 Rule
list_simple_∀_intro
[⌜x1⌝, ..., ⌜xn⌝]
├
Γ ⊢ t[x1, ..., xn]
├
Γ ⊢ ∀ x1 ... xn ⦁ t[x1, ..., xn]
=TEX
=SEEALSO
$∀\_intro$
=FAILUREC
\paragraph{Errors}
Same messages as $simple\_∀\_intro$.
=ENDDOC
($GENL$ in Cambridge HOL)
=DOC
val ⦏list_simple_∀_elim⦎ : TERM list -> THM -> THM;
=DESCRIBE
Generalised $∀$ elimination.
=FRULE 1 Rule
list_simple_∀_elim
[⌜t1⌝, ..., ⌜tn⌝]
├
Γ ⊢ ∀ x1 ... xn ⦁ t[x1, ..., xn]
├
t[t1, ..., tn]
=TEX
A built-in inference rule.
The instantiation is done simultaneously, rather than by
iteration of a single instantiation, which may affect renaming.
=SEEALSO
$∀\_elim$
=FAILURE
3012	?0 and ?1 do not have the same types
6018	?0 is not of the form: `Γ ⊢ ∀ ...xi... ⦁ t` where
	the ⌜xi⌝ are ?1 variables
=ENDDOC
($SPECL$ in Cambridge HOL)
=DOC
val ⦏all_∀_intro⦎ : THM -> THM;
=DESCRIBE
Generalises all the free variables (other than those in the assumption list) in a theorem:
=FRULE 1 Rule
all_∀_intro
├
Γ ⊢ t
├
Γ ⊢ ∀ x1 ... xn ⦁ t
=TEX
where $x1, \ldots, xn$ are all the free variables of $t$.
The function introduces variables in their order of occurrence,
so:
=EXAMPLE
all_∀_intro (⊢ a ∨ b) = ⊢ ∀ a b ⦁ a ∨ b
=ENDDOC
($GEN\_ALL$ in Cambridge HOL)
=DOC
val ⦏all_simple_∀_elim⦎ : THM -> THM;
=DESCRIBE
Specialises all the simple universally quantified variables in a theorem:
=FRULE 1 Rule
all_simple_∀_elim
├
Γ ⊢ ∀ x1 ... xn ⦁ t[x1, ..., xn]
├
Γ ⊢ t[x1', ..., xn']
=TEX
where $x1', \ldots, xn'$ are renamed from $x1, \ldots, xn$ as necessary to avoid clashes with
free variables in the assumption list, or duplicated names in
the list of specialisations.
=ENDDOC
($GEN\_ALL$ in Cambridge HOL)
=DOC
val ⦏¬_simple_∀_conv⦎ : CONV;
=DESCRIBE
Move $¬$ into a $∀$ construct.
=FRULE 1 Rule
¬_simple_∀_conv
⌜¬ (∀ x ⦁ t[x])⌝
├
├
⊢ (¬ (∀ x ⦁ t[x])) ⇔ ∃ x ⦁ ¬ t[x]
=TEX
This will work with any simple universal quantifier.
=FAILURE
7036	?0 not of the form: ⌜¬ (∀ x ⦁ t[x])⌝
=ENDDOC
($NOT\_FORALL\_CONV$ in Cambridge HOL)
We do not give a rule for $∀∀$ introduction from \cite{Manna74}.
\subsection{Concerning ∃}
=DOC
val ⦏simple_∃_intro⦎ : TERM -> THM -> THM ;
=DESCRIBE
Introduce an existential quantifier by reference to a witness.
=FRULE 1 Rule
simple_∃_intro
⌜∃ x ⦁ t1[x]⌝
├
Γ ⊢ t1[t2]
├
Γ ⊢ ∃ x ⦁ t1[x]
=TEX
where ⌜x⌝ is a variable.
=FAILURE
3034	?0 is not of form: ⌜∃ var ⦁ body⌝
7047	?0 cannot be matched to conclusion of theorem ?1
=ENDDOC
($EXISTS$ in Cambridge HOL)
In Cambridge HOL you give $t2$ (i.e. the witness that satisfies the predicate) as another argument, though this
seems only to speed the correctness check, as it may be
derived via $term\_match$.
=DOC
val ⦏simple_∃_elim⦎ : TERM -> THM -> THM -> THM ;
=DESCRIBE
Eliminate an existential quantifier.
=FRULE 1 Rule
simple_∃_elim
⌜y⌝
├
Γ1 ⊢ ∃ x ⦁ t1[x]; Γ2, t1[y] ⊢ t2
├
Γ1 ∪ Γ2 ⊢ t2
=TEX
where  $y$ must be variable which is not present elsewhere in the second theorem, nor in the conclusion of the
first.
$t1[y]$ need not actually be present in the assumptions of the second theorem.
=FAILURE
3007	?0 is not a term variable
7014	?0 has the wrong type
7109	?0 is not of the form `Γ ⊢ ∃ x ⦁ t[x]`
7120	?0 occurs free in conclusion of ?1
7121	?0 occurs free in hypotheses of ?1 other than ?2
=ENDDOC
($CHOOSE$ in Cambridge HOL)
=DOC
val ⦏¬_simple_∃_conv⦎ : CONV;
=DESCRIBE
Move $¬$ into an $∃$ construct.
=FRULE 1 Rule
¬_simple_∃_conv
⌜¬ (∃ x ⦁ t[x])⌝
├
├
⊢ (¬ (∃ x ⦁ t[x])) ⇔ ∀ x ⦁ ¬ t[x]
=TEX
This will work with any simple existential quantifier.
=FAILURE
7058	?0 is not of the form: ⌜¬ (∃ x ⦁ t[x])⌝
	where ⌜x⌝ is a variable
=ENDDOC
($NOT\_EXISTS\_CONV$ in Cambridge HOL)
We do not give a rule for $∃∃$ introduction from \cite{Manna74}.
\subsection{Concerning ∃$_1$}
=DOC
val ⦏simple_∃⋎1_intro⦎ : THM -> THM -> THM;
=DESCRIBE
Introduce $∃⋎1$ by reference to a witness, and a uniqueness theorem.
=FRULE 1 Rule
simple_∃⋎1_intro
├
Γ1 ⊢ P'[t']
Γ2 ⊢ ∀ x ⦁ P[x] ⇒ x = t
├
Γ1 ∪ Γ2 ⊢ ∃⋎1 x ⦁ P[x]
=TEX
Where $P'$ is $\alpha$-convertible to $P$, and
$t'$ is $\alpha$-convertible to $t$.
Notice that for the resulting theorem we take the bound variable name, $x$, and the form of the predicate, $P$, from the second theorem.
=FAILURE
7066	?0 not of the form: `Γ ⊢ ∀ x ⦁ P[x] ⇒ x = t`
7067	?0 and ?1 are not of the form: `Γ1 ⊢ Pa[ta]` and `Γ2 ⊢ ∀ x ⦁ P[x] ⇒ x = t`
	where ⌜Pa⌝ and ⌜P⌝, ⌜ta⌝ and ⌜t⌝ are α-convertible
=ENDDOC
=DOC
val ⦏simple_∃⋎1_elim⦎ : THM -> THM;
=DESCRIBE
Express a $∃⋎1$ in terms of $∃$ and a uniqueness property.
=FRULE 1 Rule
simple_∃⋎1_elim
├
Γ ⊢ ∃⋎1 x ⦁ P[x]
├
Γ ⊢ ∃ x ⦁ P[x] ∧ ∀ y ⦁ P[y] ⇒ y = x
=TEX
=FAILURE
7015	?0 is not of the form: `Γ ⊢ ∃⋎1 x ⦁ P[x]`
=ENDDOC
This could be rewritten to produce two theorems,
`$∃\ x\ ⦁\ P[x]$` and `$∀\ x\ y\ ⦁\ P[x]\ ∧\ P[y]\ ⇒\ x\ =\ y$`
\subsection{Concerning ε}
=DOC
val ⦏ε_intro_rule⦎ : THM -> THM;
=DESCRIBE
Given a theorem whose conclusion is a function application,
we know that the ``function'' is a predicate, and the rule states that
$ε$ of this predicate will satisfy the predicate.
=FRULE 1 Rule
ε_intro_rule
├
Γ ⊢ t1 t2
├
Γ ⊢ t1 ($ε t1)
=TEX
=FAILURE
7016	?0 is not of the form: `Γ ⊢ t1 t2`
=ENDDOC
($SELECT\_INTRO$ in Cambridge HOL)
$ε$ is not part of natural deduction so the rule cannot really be suffixed by just $\_intro$.
We might want an introduction function that requires a template $t1[x]$ and $x$, and a theorem of the form
`$⊢ t1 [t2]$`,
rather than the above more limited form.
=DOC
val ⦏simple_ε_elim_rule⦎ : TERM -> THM -> THM -> THM;
=DESCRIBE
Given that $ε$ of a predicate satisfies that predicate, then
in a different theorem we may eliminate an assumption that
claims an otherwise unused variable satisfies the predicate.
=FRULE 1 Rule
simple_ε_elim_rule
⌜x⌝
├
Γ1 ⊢ t' ($ε t'');
Γ2, t x ⊢ s
├
Γ1 ∪ Γ2 ⊢ s
=TEX
where $t$, $t'$ and $t''$ are $\alpha$-convertible, and $x$ is a free variable whose only free occurrence in the second theorem is the one shown and which does not appear free in the conclusion of the first theorem.
In fact, $(\$ε\ t'')$ here can be any term, it is not constrained to be an application of the choice function.
=FAILURE
3007	?0 is not a term variable
7019	?0 is not of the form: `Γ ⊢ t1($ε t1)`
7054	?0 is not of same type as choice sub-term of first theorem
7108	Arguments not of the form ⌜?0⌝, `Γ1 ⊢ t ($ε t)` and `Γ2, (t ?0) ⊢ s`
7120	?0 occurs free in conclusion of ?1
7121	?0 occurs free in hypotheses of ?1 other than ?2
7122	?0 occurs free in operator of the conclusion of ?1
=ENDDOC
($SELECT\_ELIM$ in Cambridge HOL)
As with the introduction rule, we might want a more general interface.
=DOC
val ⦏simple_∃_ε_rule⦎ : THM -> THM;
=DESCRIBE
Give that $ε$ of a predicate satisfies the predicate by reference to an $∃$ construct.
It can properly handle paired existence.
=FRULE 1 Rule
simple_∃_ε_rule
├
Γ ⊢ ∃ x ⦁ p[x]
├
Γ ⊢ p[ε x ⦁ p x]
=TEX
=SEEALSO
$∃\_ε\_conv$
=FAILURE
7092	?0 is not of the form: `Γ ⊢ ∃ x ⦁ p[x]`
=ENDDOC
($SELECT\_RULE$ in Cambridge HOL)
=DOC
val ⦏simple_∃_ε_conv⦎ : CONV;
=DESCRIBE
Give that $ε$ of a predicate satisfies the predicate by reference to an $∃$ construct.
=FRULE 1 Rule
simple_∃_ε_conv
⌜∃ x ⦁ p[x]⌝
├
├
Γ ⊢ (∃ x ⦁ p[x]) ⇔ p[ε x ⦁ p [x]]
=TEX
=SEEALSO
$∃\_ε\_rule$
=FAILURE
3034	?0 is not of form: ⌜∃ var ⦁ body⌝
=ENDDOC

\subsection{Concerning Functional Application}
=DOC
val ⦏mk_app_rule⦎ : THM -> THM -> THM;
=DESCRIBE
Given two equational theorems, one being between two functions, apply the two functions
to the LHS and RHS of the other equation.
=FRULE 1 Rule
mk_app_rule
├
Γ1 ⊢ u1 = u2; Γ2 ⊢ v1 = v2
├
Γ1 ∪ Γ2 ⊢ u1 v1 = u2 v2
=TEX
The second input theorem or the result may be expressed using $⇔$.

A built-in inference rule.
=FAILURE
6020	?0 is not of the form: `Γ ⊢ t1 = t2`
6023	?0 and ?1 are not of the form :`Γ1 ⊢ u1 = u2` and `Γ2 ⊢ v1 = v2`
	where ⌜u1⌝ can be functionally applied to ⌜v1⌝
=ENDDOC
($MK\_COMB$ in Cambridge HOL)
We might later want a variant of $mk\_app\_rule$ that prevents the
identification of free variables in the two theorems.
=DOC
val ⦏app_fun_rule⦎ : TERM -> THM -> THM ;
=DESCRIBE
Apply a function to both sides of an equational theorem.
=FRULE 1 Rule
app_fun_rule
⌜f⌝
├
Γ ⊢ a = b
├
Γ ⊢ f a = f b
=TEX
=FAILURE
6020	?0 is not of the form: `Γ ⊢ t1 = t2`
7024	?0 may not be applied to each side of equation
=ENDDOC
($AP\_TERM$ in Cambridge HOL)
=DOC
val ⦏app_arg_rule⦎ : TERM -> THM -> THM;
=DESCRIBE
Apply both sides of an equational theorem to an argument.
=FRULE 1 Rule
app_arg_rule
⌜x⌝
├
Γ ⊢ f = g
├
Γ ⊢ f x = g x
=TEX
=FAILURE
6020	?0 is not of the form: `Γ ⊢ t1 = t2`
7025	Sides of equation may not be applied to term
=ENDDOC
($AP\_THM$ in Cambridge HOL)
=DOC
val ⦏ext_rule⦎ : THM -> THM;
=DESCRIBE
Extensionality of functions in ICL HOL.
=FRULE 1 Rule
ext_rule
├
Γ ⊢ f = g
├
Γ ⊢ ∀ x ⦁ f x = g x
=TEX
where $x$ is a machine-generated variable of appropriate type,
not found free in the equational theorem.
=FAILURE
6020	?0 is not of the form: `Γ ⊢ t1 = t2`
7026	?0 is not an equation of functions
=ENDDOC
($EXT$ in Cambridge HOL)
\subsection{Concerning Assumptions}
=DOC
val ⦏asm_rule⦎ : TERM -> THM;
=DESCRIBE
``A term is true on the assumption that it is true.''
=FRULE 1 Rule
asm_rule
⌜t⌝
├
├
t ⊢ t
=TEX
A primitive inference rule.
=FAILURE
3031	?0 is not of type ⓣBOOL⌝
=ENDDOC
($ASSUME$ in Cambridge HOL)
=DOC
val ⦏asm_intro⦎ : TERM -> THM -> THM;
=DESCRIBE
Introduce a new assumption to an existing theorem.
=FRULE 1 Rule
asm_intro
⌜t1⌝
├
Γ ⊢ t2
├
Γ ∪ {t1} ⊢ t2
=TEX
=FAILURE
3031	?0 is not of type ⓣBOOL⌝
=ENDDOC
($ADD\_ASSUM$ in Cambridge HOL)
=DOC
val ⦏asm_elim⦎ : TERM -> THM -> THM -> THM;
=DESCRIBE
Eliminate an assumption with reference to contradictory assumption lists.
=FRULE 1 Rule
asm_elim
⌜a⌝
├
Γ1, a' ⊢ t; Γ2, ¬a''  ⊢ t'
├
Γ1 ∪ Γ2 ⊢ t
=TEX
where $a$, $a'$ and $a''$,
as well as $t$ and $t'$ are $\alpha$-convertible.
Actually, the assumptions don't have to be present for the function to succeed.
=FAILURE
3031	?0 is not of type ⓣBOOL⌝
7029	?0 and ?1 are not of the form:`Γ1, aa ⊢ t` and `Γ2, ¬aaa  ⊢ ta`
	where ⌜t⌝ and ⌜ta⌝ are α-convertible
=ENDDOC
=DOC
val ⦏prove_asm_rule⦎ : THM -> THM -> THM;
=DESCRIBE
Eliminate an assumption with reference to a the assumption being a conclusion of a theorem.
=FRULE 1 Rule
prove_asm_rule
├
Γ1 ⊢ t1; Γ2, t1 ⊢ t2
├
Γ1 ∪ Γ2 ⊢ t2
=TEX
This will in fact work even if the assumption is not present.
=ENDDOC
($PROVE\_HYP$ in Cambridge HOL)
It doesn't worry about the lack of an assumption, because
this is helpful in programming tactics.
This could easily be a (the?) assumption elimination rule, though \cite{Manna74} doesn't so use it.
=DOC
val ⦏asm_inst_term_rule⦎ : (TERM * TERM) list -> THM -> THM;
=DESCRIBE
Parallel instantiation of term variables within a theorem's conclusion and assumptions to some other values.
=FRULE 1 Rule
asm_inst_term_rule
[..., (⌜ti⌝, ⌜xi⌝), ...]
├
Γ ⊢ t[x1, ..., xn]
├
Γ' ⊢ t[t1, ..., tn]
=TEX
=SEEALSO
$inst\_term\_rule$
=FAILURE
3007	?0 is not a term variable
6027	Types of element (?0, ?1) in term association list differ
=ENDDOC
=DOC
val ⦏asm_inst_type_rule⦎ : (TYPE * TYPE) list -> THM -> THM;
=DESCRIBE
Parallel instantiation of some of the type variables of both the conclusion and assumptions of a theorem.
=FRULE 1 Rule
asm_inst_type_rule
[(σ1, tv1), ..., (σn,tvn)]
├
Γ ⊢ t[tv1,...tvn]
├
Γ' ⊢ t[σ1,...σn]
=TEX
$asm\_inst\_type\_rule$ $talist$ $thm$ will instantiate each type variable in
$talist$ with its associated type.
It will decorate free variables that would become identified with
other variables by their types becoming the same and the names originally being the same.
$\alpha$-convertible duplicate assumptions will be eliminated.
=SEEALSO
$inst\_type\_rule$
=FAILURE
3019	?0 is not a type variable
=ENDDOC
\subsection{Concerning $\alpha$-conversion}
=DOC
val ⦏α_conv⦎ : TERM -> CONV;
=DESCRIBE
Returns a theorem that two terms are equal, should they be
$\alpha$-convertible.
=FRULE 1 Rule
α_conv
⌜t2⌝
⌜t1⌝
├
├
⊢ t1 = t2
=TEX
=FAILURE
3012	?0 and ?1 do not have the same types
7034	?0 and ?1 are not α-convertible
=ENDDOC
($ALPHA$ in Cambridge HOL)
=DOC
val ⦏simple_α_conv⦎ : string -> CONV;
=DESCRIBE
Rename a bound variable name, as a conversion.
This only works with simple abstractions.
=FRULE 1 Rule
simple_α_conv
(v : string)
⌜λ x ⦁ t[x]⌝
├
├
⊢ (λ x ⦁ t[x]) = (λ v ⦁ t[v])
=TEX
=FAILURE
3011	?0 is not of form: ⌜λ var ⦁ t⌝
7035	Cannot rename bound variable ?0 to ?1 as this would cause variable capture
=ENDDOC
($ALPHA\_CONV$ in Cambridge HOL)
\subsection{Concerning Numbers, Characters and Strings}
=DOC
val ⦏suc_conv⦎ : CONV;
=DESCRIBE
This conversion gives the definition schema for non-zero natural number literals.
=FRULE 1 Rule
suc_conv
(mk_ℕ (m+1))
├
├
⊢ ⓜ(mk_ℕ(m+1))⌝ =
Suc ⓜmk_ℕ m⌝
=TEX
The conversion fails if given $0$.

=FAILURE
3026	?0 is not a numeric literal
7100	?0 must be numeric literal > 0
=SEEALSO
$mk\_ℕ$,
$prim\_suc\_conv$
=ENDDOC
=DOC
val ⦏prim_suc_conv⦎ : CONV;
=DESCRIBE
This conversion gives the definition schema for all natural number literals.
=FRULE 1 Rule
prim_suc_conv
(mk_ℕ (m+1))
├
├
⊢ ⓜ(mk_ℕ(m+1))⌝ =
Suc ⓜmk_ℕ m⌝
=TEX
=FRULE 1 Rule
prim_suc_conv
(mk_ℕ 0)
├
├
⊢ ⓜ(mk_ℕ 0)⌝ = Zero
=TEX

=FAILURE
3026	?0 is not a numeric literal
=SEEALSO
$mk\_ℕ$,
$suc\_conv$
=ENDDOC

($num\_CONV$ in Cambridge HOL)
=DOC
val ⦏string_conv⦎ : CONV;
=DESCRIBE
This function defines the constants with names starting with $"$, and type $CHAR\ LIST$
(an abbreviation of $CHAR\ LIST$).
A string literal constant is indicated by the constant name starting with a double quote($"$), as well as being of type $CHAR\ LIST$.
This is equivalent to a list of character literal constants,
one for each but the first ($"$) character of the string constant's name.
This conversion defines this relationship, by returning the head and unexploded tail of the list of characters.
A character literal is indicated by the constant's name starting with single backquote ($`$), as well as being of type $CHAR$.
=FRULE 1 Rule
string_conv
(mk_string ("c..."))
├
├
⊢ ⓜ(mk_string("c..."))⌝ =
Cons ⓜ(mk_char("c"))⌝
	ⓜ(mk_string("..."))⌝
=TEX
Or:
=FRULE 1 Rule
string_conv
(mk_string "")
├
├
⊢ ⓜ(mk_string(""))⌝ = Nil
=TEX
A primitive inference rule(axiom schemata).
=SEEALSO
$mk\_string$
=FAILURE
3025	?0 is not a string literal
=ENDDOC
=DOC
val ⦏char_conv⦎ : CONV;
=DESCRIBE
This function defines the character literal constants, by giving a relationship between character literal constants and their ASCII code (derived by the Standard ML function $ord$).
A character literal is indicated by the constant's name starting with single backquote ($`$), being a single other character, as well as being of type $CHAR$.
=FRULE 1 Rule
char_conv
(mk_char("c"))
├
├
⊢ ⓜ(mk_char("c"))⌝ =
	AbsChar ⓜord "c"⌝
=TEX
A primitive inference rule(axiom schemata).
=SEEALSO
$mk\_char$
=FAILURE
3024	?0 is not a character literal
=ENDDOC
=DOC
val ⦏plus_conv⦎ : CONV;
=DESCRIBE
Provides the value of the addition of two numeric literals.
=FRULE 1 Rule
plus_conv
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
=ENDDOC

\subsection{Concerning Conversions}
\subsubsection{Building Blocks}
=DOC
val ⦏id_conv⦎ : CONV;
=DESCRIBE
This is an alias for $refl\_conv$, reflecting the fact that
$refl\_conv$ is the identity for the conversional $THEN\_C$.
=FAILURE
7061	Failed as requested
=ENDDOC
=DOC
val ⦏fail_conv⦎ : CONV;
=DESCRIBE
This conversion always fails.
=FAILURE
7061	Failed as requested
=ENDDOC
($NO\_CONV$ in Cambridge HOL)
=DOC
val ⦏fail_with_conv⦎ : string -> CONV;
=DESCRIBE
This conversion always fails, with the error message being its string
argument.
=FAILURE
7075	?0
=ENDDOC
($FAIL\_CONV$ in Cambridge HOL)
\subsubsection{Conversionals}
=DOC
val ⦏THEN_C⦎ : (CONV * CONV) -> CONV;
=DESCRIBE
Combine the effect of two successful conversions.
=FRULE 1 Rule
(c1: CONV) THEN_C (c2: CONV)
⌜t⌝
├
├
Γ ⊢ t = t'''
=TEX
where $c1\ t$ returns `$Γ1 ⊢ t = t'$`, $c2\ t'$ returns
`$Γ2 ⊢ t'' = t'''$`, $t'$ and $t''$ are $\alpha$-convertible and
$Γ$ equals $Γ1 ∪ Γ2$.
=SEEALSO
$EVERY\_C$ (the iterated version of this function),
as well as $THEN\-\_TRY\-\_C$, $AND\-\_OR\-\_C$, and $ORELSE\_C$
=FAILURE
7101	Result of first conversion, ?0, not an equational theorem
7102	LHS (if any) of result of second conversion, ?0, not
	α-convertible to RHS of first, ?1
=FAILUREC
\paragraph{Errors}
If any, as the failures of $c1$ and $c2$ applied to $t$ and $t'$ respectively.
=ENDDOC
($THENC$ in Cambridge HOL)
=DOC
val ⦏THEN_TRY_C⦎ : (CONV * CONV) -> CONV;
=DESCRIBE
Combine the effect of two conversions, ignoring the failure
of the second if necessary.
That is, if the first conversion results in an equational theorem
whose RHS can have the second conversion applied,
and the two resulting theorems composed,
then that composition;
otherwise the result of the first conversion alone is returned.
=SEEALSO
$THEN\_C$, $AND\-\_OR\-\_C$, $ORELSE\_C$
=FAILUREC
\paragraph{Errors}
As the failure of $c1$.
=ENDDOC

=DOC
val ⦏ORELSE_C⦎ : (CONV * CONV) -> CONV;
=DESCRIBE
Attempt to apply one conversion, and if that fails, try the second one.
=FRULE 1 Rule
(c1: CONV) ORELSE_C (c2: CONV)
⌜t⌝
├
├
Γ ⊢ t = t'
=TEX
where $c1\ t$ returns $Γ ⊢ t = t'$, or $c1$ fails, and
$c2\ t$ returns
$Γ ⊢ t = t'$.
=SEEALSO
$FIRST\_C$ (the iterated version of this function), $THEN\_C$, $AND\-\_OR\-\_C$, and $THEN\-\_TRY\-\_C$
=FAILUREC
\paragraph{Errors}
As the failure of second conversion, should both conversions fail.
=ENDDOC
($ORELSEC$ in Cambridge HOL)
=DOC
val ⦏AND_OR_C⦎ : (CONV * CONV) -> CONV;
=DESCRIBE
$c1\ AND\-\_OR\-\_C\ c2$ will succeed if it can apply
one or both of $c1$ or $c2$.
If it cannot compose the results of applying both
conversions successfully (indicating an ill-formed conversion result)
it will return the result of the first conversion application.
=SEEALSO
$THEN\-\_TRY\-\_C$, $ORELSE\_C$, $THEN\_C$
=FAILUREC
\paragraph{Errors}

As the failure message of the second conversion
(implying that neither conversion was successfully applied).
=ENDDOC
=DOC
val ⦏REPEAT_C⦎ : CONV -> CONV;
=DESCRIBE
Repeatedly apply a conversion to a term.
To be more precise, the functionality is equivalent that of the following definition:
=GFT
fun REPEAT_C (c:CONV) =
	(c THEN_C (REPEAT_C c)) ORELSE_C refl_conv
=TEX
=SEEALSO
$REPEAT\_C1$
=ENDDOC
($REPEATC$ in Cambridge HOL)
=DOC
val ⦏REPEAT_C1⦎ : CONV -> CONV;
=DESCRIBE
Repeatedly apply a conversion to a term,
failing if not successfully applied at least once.
To be more precise, the functionality is equivalent that of the following definition:
=GFT
fun REPEAT_C1 (c:CONV) = (c THEN_TRY_C REPEAT_C1 c)
=TEX
=FAILUREC
\paragraph{Errors}
As the error of the conversion if it cannot be applied at
least once.
=ENDDOC
=DOC
val ⦏EVERY_C⦎ : CONV list -> CONV;
=DESCRIBE
Apply each conversion in the list, in the sequence given.
=SEEALSO
$THEN\_C$(which this function iterates)
=FAILURE
7103	List may not be empty
=FAILUREC
or as the failure of any constituent conversion,
or as $THEN\_C$.
=ENDDOC
($EVERYC$ in Cambridge HOL)
=DOC
val ⦏FIRST_C⦎ : CONV list -> CONV;
=DESCRIBE
Attempt to apply each conversion in the list, in the sequence given, until one succeeds, or all fail.
=SEEALSO
$ORELSE\_C$(which this function iterates)
=FAILURE
7103	List may not be empty
=FAILUREC
or as the failure of the last conversion.
=ENDDOC
($FIRSTC$ in Cambridge HOL)
=DOC
val ⦏CHANGED_C⦎ : CONV -> CONV;
=DESCRIBE
Applies a conversion, and fails if either the conversion fails,
has ill-formed results in certain ways,
or it causes no change.
Even $\alpha$-convertible changes count as a change for this purpose.
=FAILURE
7032	Conversion failed to cause a change
7104	Result of conversion, ?0, ill-formed
=FAILUREC
It may also fail with the error message of the conversion argument.
=ENDDOC
($CHANGED\_CONV$ in Cambridge HOL)
=DOC
val ⦏TRY_C⦎ : CONV -> CONV;
=DESCRIBE
Attempt to apply a conversion, and if it fails, apply $refl\_conv$.
=ENDDOC
($TRY\_CONV$ in Cambridge HOL)
=DOC
val ⦏COND_C⦎ : (TERM -> bool) -> CONV -> CONV -> CONV;
=DESCRIBE
$COND\_C$ $pred$ $cnv1$ $cnv2$ $tm$
will be, if the term predicate $pred$ applied to $tm$ is true, then $cnv1$ $tm$
and otherwise
the $cnv2$ $tm$.
=FAILUREC
\paragraph{Errors}
As the failure of the predicate or either conversion.
=ENDDOC
\subsubsection{Term Traversal Algorithms for Conversions}
There is a term traversal conversion tool, prototyped in \cite{DS/FMU/IED/SML019}.
Thus we do not provide as full a tool kit as possible.
In particular we do not give equivalents to $DEPTH\_FORALL\_CONV$
and $DEPTH\_EXISTS\_CONV$.
=DOC
val ⦏RAND_C⦎ : CONV -> CONV;
=DESCRIBE
Apply a conversion to the operand of a combination:
=FRULE 1 Rule
RAND_C
(c : CONV)
⌜f a⌝
├
├
⊢ f a = f a'
=TEX
where $c\ a$ gives $⊢ a = a'$.
=FAILURE
3010	?0 is not of form: ⌜t1 t2⌝
7104	Result of conversion, ?0, ill-formed
=FAILUREC
Also as the failure of the conversion.
=ENDDOC
($RAND\_CONV$ in Cambridge HOL)
=DOC
val ⦏RANDS_C⦎ : CONV -> CONV;
=DESCRIBE
Apply a conversion to each of the arguments of a function
=FRULE 1 Rule
RANDS_C
(c : CONV)
⌜f a ... z⌝
├
├
⊢ f a ... z = f a'...z'
=TEX
where $c\ a$ gives $⊢ a = a'$, etc.
The function $f$ may have no arguments in which case $refl\-\_conv$ $f$ is returned.
=FAILURE
7104	Result of conversion, ?0, ill-formed
=FAILUREC
Also as the failure of the conversion.
=ENDDOC
=DOC
val ⦏RATOR_C⦎ : CONV -> CONV;
=DESCRIBE
Apply a conversion to the operator of a combination:
=FRULE 1 Rule
RATOR_C
(c : CONV)
⌜f a⌝
├
├
⊢ f a = f' a
=TEX
where $c\ f$ gives $`⊢ f = f'`$.
=FAILURE
3010	?0 is not of form: ⌜t1 t2⌝
7104	Result of conversion, ?0, ill-formed
=FAILUREC
Also as the failure of the conversion.
=ENDDOC
($RAND\_CONV$ in Cambridge HOL)
=DOC
val ⦏LEFT_C⦎ : CONV -> CONV;
=DESCRIBE
Apply a conversion to the first operand of a binary operator:
=FRULE 1 Rule
LEFT_C
(c : CONV)
⌜f a b⌝
├
├
⊢ f a b = f a' b
=TEX
where $c\ a$ gives $⊢ a = a'$.
$f$ may itself be a function application.
=FAILURE
3013	?0 is not of form: ⌜f a b⌝
7104	Result of conversion, ?0, ill-formed
=FAILUREC
Also as the failure of the conversion.
=ENDDOC
=DOC
val ⦏RIGHT_C⦎ : CONV -> CONV;
=DESCRIBE
Apply a conversion to the second operand of a binary operator:
=FRULE 1 Rule
RIGHT_C
(c : CONV)
⌜f a b⌝
├
├
⊢ f a b = f a b'
=TEX
where $c\ b$ gives $`⊢ b = b'`$.
$f$ may itself be a function application.
=FAILURE
3013	?0 is not of form: ⌜f a b⌝
7104	Result of conversion, ?0, ill-formed
=FAILUREC
Also as the failure of the conversion.
=ENDDOC
=DOC
val ⦏APP_C⦎ : (CONV * CONV) -> CONV;
=DESCRIBE
Apply one conversion to the operator of a combination,
and a second to the operand.
=FRULE 1 Rule
APP_C
(c1 : CONV,
c2 : CONV)
⌜f a⌝
├
├
⊢ f a = f' a'
=TEX
where $c1\ f$ gives $`⊢ f = f'`$,
and $c2\ f$ gives $`⊢ a = a'`$.
=FAILURE
3010	?0 is not of form: ⌜t1 t2⌝
7110	Results of conversions, ?0 and ?1, ill-formed or cannot be combined
=FAILUREC
Also as the failure of the conversions.
=ENDDOC
=DOC
val ⦏SIMPLE_λ_C⦎ : CONV -> CONV;
=DESCRIBE
Apply a conversion to the body of a simple abstraction:
=FRULE 1 Rule
SIMPLE_λ_C
(c : CONV)
⌜λ x ⦁ p⌝
├
├
⊢ (λ x ⦁ p[x]) = (λ x ⦁ p'[x])
=TEX
where $c\ p[x]$ gives $`⊢ p[x] = p'[x]`$.
=SEEALSO
$SIMPLE\-\_BINDER\-\_C$
=FAILURE
3011	?0 is not of form: ⌜λ var ⦁ t⌝
7104	Result of conversion, ?0, ill-formed
=FAILUREC
Also as the failure of the conversion.
=ENDDOC
($SIMPLE\_λ\_CONV$ in Cambridge HOL)
=DOC
val ⦏SIMPLE_BINDER_C⦎ : CONV -> CONV;
=DESCRIBE
Apply a conversion to the body of a simple binder term:
=FRULE 1 Rule
SIMPLE_BINDER_C
(c : CONV)
⌜B x ⦁ p⌝
├
├
⊢ (B x ⦁ p[x]) = (B x ⦁ p'[x])
=TEX
where $c\ p[x]$ gives $`⊢ p[x] = p'[x]`$,
and $B$ is a binder.
=FAILURE
7059	?0 is not of the form: ⌜B x ⦁ p[x]⌝ where ⌜B⌝ is a binder
	and ⌜x⌝ a variable
7104	Result of conversion, ?0, ill-formed
=FAILUREC
Also as the failure of the conversion.
=ENDDOC
($SIMPLE\-\_BINDER\-\_CONV$ in Cambridge HOL)
=DOC
val ⦏SUB_C⦎ : CONV -> CONV;
=DESCRIBE
Apply a conversion to each of the constituents of a term,
however that term might be constructed,
and recombine the results.
Thus:
=GFT
SUB_C cnv var = refl_conv var

SUB_C cnv const = refl_conv const

SUB_C cnv (f x) = Γ ⊢ f x = f' x'
	where cnv f = Γ1 ⊢ f = f'
	and   cnv x = Γ2 ⊢ x = x'
	and Γ = Γ1 ∪ Γ2

SUB_C cnv (λ x ⦁ t) = Γ ⊢ (λ x ⦁ t) = (λ x ⦁ t')
	where cnv t = Γ ⊢ t = t'
=TEX
=SEEALSO
$SUB\_C1$
=ENDDOC
($SUB\_CONV$ in Cambridge HOL)
=DOC
val ⦏SUB_C1⦎ : CONV -> CONV;
=DESCRIBE
Apply a conversion to each of the constituents of a term,
failing if the term cannot be broken up, or the
conversion fails on all constituents
(if only one of the two constituents of a $mk\_app$ have failures,
then the offending term will be $refl\_conv$ed instead).
Thus:
=GFT
SUB_C1 cnv var = fail_conv var

SUB_C1 cnv const = fail_conv const

SUB_C1 cnv (f x) = Γ ⊢ f x = f' x'
	where cnv f = Γ1 ⊢ f = f'
	and   cnv x = Γ2 ⊢ x = x'
	and Γ = Γ1 ∪ Γ2

SUB_C1 cnv (λ x ⦁ t) = Γ ⊢ (λ x ⦁ t) = (λ x ⦁ t')
	where cnv t = Γ ⊢ t = t'
=TEX
=FAILURE
7104	Result of conversion, ?0, ill-formed
7105	?0 has no constituents
=FAILUREC
There may be failure messages from the conversions.
=ENDDOC

The following traversal schemes are those provided by Cambridge HOL,
and are by no means a complete set of ``reasonable'' traversal schemes.
Indeed, $REPEAT\_MAP\_C$ is unlikely to ever be an efficient traversal scheme, but merely complete.

When they fail, the resulting error message is somewhat ``non-deterministic'', it may
come from a function implementing the traversal scheme used,
or from the conversion traversed through the term.
=DOC
val ⦏ONCE_MAP_C⦎ : CONV -> CONV;
=DESCRIBE
This traverses a term from the root node to its leaves,
attempting to apply its conversion argument.
If it successfully applies the conversion to any subterm
then it will not further traverse that subterm,
but will still continue on other branches.
If it fails to apply its conversion to a leaf, its functionality is equivalent to then applying $refl\_conv$.
It traverses from left to right, though this should only matter for
conversions that work by side-effect.
It will fail if the conversion succeeds nowhere in the tree,
or if the results of certain conversion applications are ill-formed.
=FAILURE
7005	Conversion fails on term and all its subterms
=ENDDOC
($ONCE\_DEPTH\_CONV$ in Cambridge HOL)
=DOC
val ⦏MAP_C⦎ : CONV -> CONV;
=DESCRIBE
This traverses a term from its leaves to its root node.
It will repeat the application of its conversion argument, until failure,
on each subterm encountered en route.
At each node the conversion is applied to the sub-term that results from the application of the preceding traversal, not the original.
It traverses from left to right, though this should only matter for
conversions that work by side-effect.
It fails if the conversion applies nowhere within the tree.
=FAILURE
7005	Conversion fails on term and all its subterms
=ENDDOC
($DEPTH\_CONV$ in Cambridge HOL)
=DOC
val ⦏REPEAT_MAP_C⦎ : CONV -> CONV;
=DESCRIBE
This traverses a term from its leaves to its root node.
It will attempt the application of its conversion argument
on each subterm encountered en route.
If the conversion is successfully applied
to a given sub-term,
then the resulting sub-term from the conversion
is re-traversed by the function.
It traverses from left to right, though this should only matter for
conversions that work by side-effect.
It fails if the conversion is not applicable anywhere within
the term, or if certain applications of the conversion
have ill-formed results.
=FAILURE
7005	Conversion fails on term and all its subterms
=ENDDOC
($REDEPTH\_CONV$ in Cambridge HOL)
=DOC
val ⦏TOP_MAP_C⦎ : CONV -> CONV;
=DESCRIBE
$TOP\_MAP\_C$ $conv$ $tm$ traverses $tm$ from its root node to its leaves.
It will repeat the application of $conv$, until failure,
on each subterm encountered en route.
It then descends through the sub-term that results from the repeated application of the conversion.
If the descent causes any change, on ``coming back out'' to the sub-term the conversional will attempt
to reapply $conv$, and if successful
will then (recursively) reapply $TOP\_MAP\_C$ $conv$
once more.
If $conv$ cannot be reapplied then the conversional continues
to ascend back to the root.

It traverses from left to right, though this should only matter for
conversions that work by side-effect.
It fails if the conversion is applied nowhere within the term.
=FAILURE
7005	Conversion fails on term and all its subterms
=ENDDOC
($TOP\_DEPTH\_CONV$ in Cambridge HOL)
\subsubsection{Conversions as Rules}
=DOC
val ⦏conv_rule⦎ : CONV -> THM -> THM;
=DESCRIBE
Apply a conversion to the conclusion of a theorem, and do $⇔$ modus ponens between the original theorem and the result of the conversion
=FRULE 1 Rule
conv_rule
(c : CONV)
├
Γ1 ⊢ t
├
Γ1 ∪ Γ2 ⊢ t'
=TEX
where $c\ t$ gives $Γ2 ⊢ t ⇔ t'$.
=FAILURE
7104	Result of conversion, ?0, ill-formed
=FAILUREC
Also as the failure of the conversion upon the conclusion of the
theorem.
=ENDDOC
($CONV\_RULE$ in Cambridge HOL)
\section{SUPPORTING THEORY}
\label{theorems}
Some of the above inference rules are implemented by appealing
to theorems, some of which we make visible to the user in the following.
=DOC
val ⦏t_thm⦎ : THM;
=DESCRIBE
``True'' is true.
=FRULE 1 Theorem
t_thm
├
├
⊢ T
=TEX
=ENDDOC
($TRUTH$ in Cambridge HOL)
=DOC
val ⦏f_thm⦎ : THM;
=DESCRIBE
``Not False'' is true.
=FRULE 1 Theorem
f_thm
├
├
⊢ ¬ F
=TEX
=ENDDOC
=DOC
val ⦏¬_t_thm⦎ : THM;
=DESCRIBE
``Not true is false''.
=FRULE 1 Theorem
¬_t_thm
├
├
¬ T ⇔ F
=TEX
=ENDDOC
=DOC
val ⦏¬_thm1⦎ : THM;
=DESCRIBE
``Not t if and only if t is false.''
=FRULE 1 Theorem
¬_thm1
├
├
⊢ ∀ t ⦁ (¬ t) ⇔ (t ⇔ F)
=TEX
=ENDDOC
=DOC
val ⦏¬_thm⦎ : THM;
=DESCRIBE
Expanded form of definition of $¬$:
=FRULE 1 Theorem
¬_thm
├
├
∀ t ⦁ (¬ t) ⇔ (t ⇒ F)
=TEX
=ENDDOC
=DOC
val ⦏∧_thm⦎ : THM;
=DESCRIBE
Expanded form of definition of $∧$
=FRULE 1 Theorem
∧_thm
├
├
∀ t1 t2 ⦁ (t1 ∧ t2) ⇔
	(∀ b ⦁ (t1 ⇒ t2 ⇒ b) ⇒ b)
=TEX
=ENDDOC
=DOC
val ⦏∨_thm⦎ : THM;
=DESCRIBE
Expanded form of definition of $∨$
=FRULE 1 Theorem
∨_thm
├
├
∀ t1 t2 ⦁ (t1 ∨ t2) ⇔
(∀ b ⦁ (t1 ⇒ b) ⇒ (t2 ⇒ b) ⇒ b)
=TEX
=ENDDOC
=DOC
val ⦏∃⋎1_thm⦎ : THM;
=DESCRIBE
Expanded form of definition of $∃⋎1$
=FRULE 1 Theorem
∃⋎1_thm
├
├
⊢ ∀ P ⦁ ($∃⋎1 P) ⇔
	(∃ t ⦁ (P t) ∧
	(∀ x ⦁ (P x) ⇒ x = t))
=TEX
=ENDDOC
=DOC
val ⦏¬_∀_thm⦎ : THM;
=DESCRIBE
Used in pushing negations through simple universal quantifications.
=FRULE 1 Theorem
¬_∀_thm
├
├
⊢ ∀ p⦁ ¬ $∀ p ⇔ (∃ x⦁ ¬ p x)
=TEX
=ENDDOC
=DOC
val ⦏¬_∃_thm⦎ : THM;
=DESCRIBE
Used in pushing negations through simple existential quantifications.
=FRULE 1 Theorem
¬_∃_thm
├
├
⊢ ∀ p⦁ ¬ $∃ p ⇔ (∀ x⦁ ¬ p x)
=TEX
=ENDDOC
=DOC
val ⦏∃_intro_thm⦎ : THM;
=DESCRIBE
Introduction of existential quantification.
=FRULE 1 Theorem
∃_intro_thm
├
├
⊢ ∀ P x⦁ P x ⇒ $∃ P
=TEX
=ENDDOC
=DOC
val ⦏cond_thm⦎ : THM;
=DESCRIBE
A convenient variant of the definition of the conditional.
{
\def\FruleLeftWidth{0.7\textwidth}
\def\FruleRightWidth{0.2\textwidth}
\FruleLeftJustify
=FRULE 1 Theorem
cond_thm
├
├
   ⊢ ∀ a t1 t2⦁ (if a then t1 else t2) =
	(ε x⦁ ((a ⇔ T) ⇒ x = t1) ∧ ((a ⇔ F) ⇒ x = t2))
=TEX
}
=ENDDOC
=TEX
\subsection{Concerning Higher-Order Matching}

=DOC
val ⦏simple_β_η_norm_conv⦎ : CONV;
=DESCRIBE
This conversion eliminates all simple β- and η-redexes from a term giving
the βη-normal form. It does not eliminate β- and η-redexes involving abstraction over pairs. It fails if the term is already in normal form.
=FAILURE
7130	?0 contains no simple β- or η-redexes
=ENDDOC

=DOC
val ⦏simple_β_η_conv⦎ : TERM -> CONV;
=DESCRIBE
If $t$ is any term,
=INLINEFT
simple_β_η_conv t
=TEX
\ is a conversion which will prove all theorems of
the form
=INLINEFT
⊢ t = s
=TEX
\ where $t$ and $s$ are simply $\alpha\beta\eta$-equivalent,
i.e., can be reduced to $\alpha$-equivalent normal forms by $\beta$-
and $\eta$-reduction involving only simple (rather than paired)
$\lambda$-abstractions.
=FAILURE
7131	?0 and ?1 are not simply αβη-equivalent
=ENDDOC

=DOC
val ⦏simple_ho_eq_match_conv⦎ : THM -> CONV
=DESCRIBE
This conversion is like $simple\_eq\_match_conv$ but uses higher-order
matching.
It uses $simple\_ho\_match$ (q.v.) to match the LHS of an equational theorem to a
term $t$.
It then instantiates the theorem (including both term and type
instantiation) and carries out any βη-reductions required to give
a theorem of the form $t = v'$.
The equation may be partially or fully universally quantified
(simple quantification only, not quantification over pairs).
=FRULE 1 Conversion
simple_ho_eq_match_conv
(Γ ⊢ ∀ ... ⦁ u = v)
⌜t⌝
├
├
Γ' ⊢ t = v'
=TEX
where $v'$ is the result of applying to $v$ the instantiations required to match $u$ to $t$
(including term and type instantiation).
If there are free variables on the RHS of the supplied equational theorem (when stripped of all universal quantification)
they will be renamed as necessary to avoid identification with
any variables in $t$.


=FAILURE
7095	?0 is not of the form `Γ ⊢ ∀ x1 ... xn ⦁ u = v` where ⌜xi⌝ are variables
7076	Could not match term ?0 to LHS of theorem ?1
=ENDDOC

=DOC
val ⦏simple_ho_eq_match_conv1⦎ : THM -> CONV
=DESCRIBE
This conversion is like $simple\_eq\_match_conv1$ but uses higher-order
matching.
It uses $simple\_ho\_match$ (q.v.) to match the LHS of an equational theorem to a
term $t$.
The equation may be partially or fully universally quantified
(simple quantification only, not quantification over pairs).
It instantiates the theorem (including both term and type
instantiation) and carries out any βη-reductions required to give
a theorem of the form $t = v'$.
Only type variables that do not appear in the assumptions of the theorem and universally quantified term variables will be instantiated.

=FRULE 1 Conversion
simple_ho_eq_match_conv1
(Γ ⊢ ∀ ... ⦁ u = v)
⌜t⌝
├
├
Γ ⊢ t = v'
=TEX
where $v'$ is the result of applying to $v$ the instantiation rules required to match $u$ to $t$
(including term and type instantiation).
If there are free variables on the RHS of the supplied equational theorem (when stripped of all universal quantification)
they will be renamed as necessary to avoid identification with
any variables in $t$.


=FAILURE
7095	?0 is not of the form `Γ ⊢ ∀ x1 ... xn ⦁ u = v` where ⌜xi⌝ are variables
7076	Could not match term ?0 to LHS of theorem ?1
=ENDDOC



\section{END OF THE SIGNATURE}
=SML
end; (* signature of DerivedRules1 *)
=TEX
\section{TEST POLICY}
The functions in this document should be tested according to the general criteria described in
\cite{DS/FMU/IED/PLN008}.
All the primitive and built-in functions should be tested
to ensure they do not block errors 6036, 6065 and 6066
caused in their calls to the kernel inference rules they
are based on.
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}




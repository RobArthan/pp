=IGN
********************************************************************************
dtd041.doc: this file is part of the PPZed system

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

\def\Title{Detailed Design for the Z Predicate Calculus}

\def\AbstractText{This document contains the detailed design for the derived rules of inference, conversions and tactics for {\ProductZ} predicate calculus. It also contains a variety of Z language utilities}

\def\Reference{DS/FMU/IED/DTD041}

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
%% LaTeX2e port: \TPPtitle{Detailed Design for the Z Predicate Calculus}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Detailed Design for the Z Predicate Calculus}
%% LaTeX2e port: \TPPref{DS/FMU/IED/DTD041}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.43 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2009/03/24 17:04:28 $%
%% LaTeX2e port: }}  %% Mandatory field
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.~Blackburn & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{G.~Prout & WIN01\\K.~Blackburn & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document contains the detailed design for the
%% LaTeX2e port: derived rules of inference, conversions and tactics for \ProductZ{} predicate calculus.
%% LaTeX2e port: It also contains a variety of Z language utilities}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	    FST Library
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
%% LaTeX2e port: \bf Copyright \copyright\ : Lemma 1 Ltd. \number\year
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
\item [Issue 1.1 (1991/08/14),1.2 (1991/08/28)]
First versions.
\item [Issue 1.3 (1992/07/10) (9th July 1992)]
Taken over by KB, and reworked, new fonts.
\item [Issue 1.4 (1992/07/15) (14th July 1992)]
Significant changes after RBJ, RDA comments.
\item [Issue 1.5 (1992/07/30) (16th July 1992)]
Changes after RDA comments.
\item [Issue 1.6 (1992/08/12)-1.8 (1992/08/18)]
Changes during implementation.
\item [Issue 1.9 (1992/08/20) (20th August 1992)]
Added further Z checking functions.
\item [Issue 1.9 (1992/08/20) (8th September 1992)]
Minor corrections in text.
\item [Issue 1.11 (1992/09/14) (10th September 1992)]
Corrections after comments.
\item [Issue 1.12 (1992/10/05) (29th September 1992)]
More changes after comments,
and stopped using $z\-\_∀\-\_elim\-\_conv1$ in stripping theorems,
added $∀\-\_rewrite\-\_thm$ to $'z\-\_predicates$.
\item [Issue 1.13 (1992/10/07) (6th October 1992)]
Introduced $z\_basic\_prove\_tac$ and associates.
\item [Issue 1.14 (1992/10/09) (6th October 1992)]
$z\_quantifiers\_elim\_tac$ changed to do slightly
more.
Other minor typos fixed.
\item [Issue 1.15 (1992/10/19) (12th October 1992)]
Changed to only have $z\_language$ as parent.
\item [Issue 1.16 (1992/10/28), 1.17 (1992/10/30) (30th October 1992)]
Changes after comments - rearrangement of material
between 041, 042 and 043.
\item [Issue 1.18 (1992/11/12) (9th November 1992)]
Changes after comments: proof context changes,
new $z\_∀\_tac$, etc, replaced $z\_defn\_conv$ by $z\_para\_pred\_conv$, etc, added $z\_decl\_pred\_conv$.
Added chaining material.
\item [Issue 1.19 (1992/11/13) (13th November 1992)]
Correcting error message numbers.
\item [Issue 1.20 (1992/11/17) (17th November 1992)]
Added $z\_term\_of\_type$
\item [Issue 1.21 (1992/11/27) (25th November 1992)]
Changes after comments.
\item [Issue 1.22 (1992/12/01) (1st December 1992)]
Changed treatment of $⊆$ in proof contexts.
\item [Issue 1.23 (1992/12/01) (1st December 1992)]
Changed treatment of ill-formed schemas and predicates in $z\_dec\_pred\_conv$.
\item [Issue 1.24 (1992/12/03) (2nd December 1992)]
Improved $𝕌$ simplification.
\item [Issue 1.25 (1992/12/04) (4th December 1992)]
Added $z\_schema\_pred\_conv1$.
\item[Issue 1.26 (1992/12/10) (10th December 1992)]
Global rename from wrk038.doc issue 1.9.
\item[Issue 1.27 (1992/12/18) (18th December 1992)]
Added $z\_pred\_decl\_conv$.
\item[Issue 1.28 (1993/01/15) (14th January 1993)]
Added treatment of generic predicates.
\item[Issue 1.29 (1993/01/20) (20th January 1993)]
Lost $z\_strip\_tac$.
\item[Issue 1.30 (1993/02/03) (2nd February 1993)]
Added variable elimination to proof tactics.
\item[Issue 1.31 (1993/02/10),1.32 (1993/02/11) (10th-11th February 1993)]
Rearranging proof contexts, etc.
\item[Issue 1.33 (1993/02/16) (15th February 1993)]
Added $z\_push\_consistency\_goal$.
\item[Issue 1.34 (1993/02/24) (24th February 1993)]
Corrected description of proof context ``$'z\_fc$''.
\item[Issue 1.35 (1997/04/23) (23rd April 1997)]
Added $is\_z\_term1$.
\item[Issue 1.36 (1997/08/12)]
Typo corrected.
\item[Issue 1.37 (2000/07/01)]
Added
=INLINEFT
z_gen_pred_elim1
=TEX
.
\item[Issue 1.38 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.39 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.40 (2004/01/19)] The Z universal set is now called 𝕌.
\item[Issue 1.41 (2005/09/10)] Added {\em z\_gen\_pred\_u\_elim}.
\item[Issue 1.42 (2007/05/24)] Corrected typos in documentation boxes.
\item[Issue 1.43 (2009/03/24)] Exposed {\em set\_check\_is\_z}.
\item[Issue 1.44 (2010/04/01)] Support for empty schemas.  Various minor corrections/improvements to documentation.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported PPZed to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
Implementation of $α\_to\_z$.
Improvements to $is\_z$.
\section{GENERAL}
\subsection{Scope}
This document contains a detailed design for the
derived rules of inference, conversions and tactics for
\ProductZ (see \cite{DS/FMU/IED/HLD015}) predicate calculus.
This is called for in \cite{DS/FMU/IED/HLD016}.
The design is
implemented in \cite{DS/FMU/IED/IMP041}.
\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains a detailed design for the
initial set of rules, conversions and tactics for the predicate calculus of the \ProductZ.
\subsubsection{Dependencies}
Loading this document is dependent on
the Z Language theory, started in \cite{DS/FMU/IED/DTD052} and Z Paragraph processor
\cite{DS/FMU/IED/DTD049}.
\subsubsection{Deficiencies}
The coverage in initial releases of \ProductZ{} is aimed at the basic reasoning
tools, rather than a full coverage.
Thus we aim only to cover:
\begin{itemize}
\item
Rewriting
\item
Stripping conclusions and theorems (including assumptions)
\item
$∀$ elimination as inference rule
\item
Contradiction tactics
\item
$∃\_tac$
\end{itemize}
plus some of the auxiliary functions necessary for implementing these.
Thus, initial releases of the ProofPower Z tools will be
deficient in many areas in which reasoning is supported
for HOL.
\section{OVERLAP WITH HOL}
Some functions operating on Z have the same purpose
as an equivalent for HOL,
but perhaps different functionality.

Where this happens we will:
\begin{itemize}
\item
By preference use the HOL function, with, if necessary, parameterisation
changes provided by proof contexts (or, more rarely,
if at all, by other parameterisation).
In particular, if the functionality is the same, use the
same function (e.g. $∧\_tac$).
\item
Otherwise we will provide a separately named function for Z work.
The Z name will usually be formed by prefixing by
``$z\_$'', ``$Z\_$'' or ``Z'' (according to naming convention case and atom composition rules
followed by the object's name)
to indicate the object of
concern in the Z variant of the object.
\end{itemize}
Later releases might provide structures whose sole purpose is to
override HOL (i.e. primary language) objects by
their Z equivalents, and to undo this step.
There are both benefits and problems with this, and the final
approach is yet to be decided.
\section{LANGUAGE OVERLAP BETWEEN Z AND HOL}\label{ZCAVEAT}
Many of the functions below that generate results involving expressions and predicates
are stated to ``remain within the Z language''
(indicated by their results being in $ⓩ\ ...\ ⌝$ or
left without any such brackets at all - this document assumes
Z as the default language, HOL terms are explicitly quoted).
This should be taken to mean that in so far as the original
input was within the Z language (i.e. the range of the Z mapping)
the results will also be
(except for certain renaming problems, etc).
This will be checked by some derivative of $is\_z$, unless
otherwise noted, informing the user
if Z has been left.
Later releases will use $α\_to\_z\_conv$ to correct
what problems it can.

Legitimately, we use HOL universal quantification
to represent generic formals.
However we will also allow arbitrary outer HOL universal quantified terms to be considered ``within the Z language''
where this is convenient, though this is avoided where possible.

By default all relevant functions in this document should
be assumed to remain within the Z language and assumed to check this fact, unless otherwise stated.
\section{Z PREDICATE CALCULUS}
=DOC
signature ⦏ZPredicateCalculus⦎ = sig
=DESCRIBE
This provides a set of rules of inference, conversions and tactics sufficient for reasoning about the Z predicate calculus in ProofPower.
This structure declares the theory $z\_language\_ps$,
which is also used by structures $ZSetTheory$ and $ZSchemaCalculus$.
=ENDDOC
As theory $z\_set\_theory$ is also used by structure
$ZSetTheory$ we delay its theory design until
\cite{DS/FMU/IED/DTD042}.
\subsection{Subsidiary Functions}
\subsubsection{What is Z}
The following are extensions of work done in \cite{DS/FMU/IED/DTD047},
and perhaps some of this material should be moved to that document.

Errors start with 4100.
=DOC
val ⦏dest_z_term1⦎ : TERM -> Z_TERM;
=DESCRIBE
This function acts as $dest\_z\_term$ on terms
(i.e. expressions and predicates)
in the Z language, but makes additional checks.
This is in contrast to $dest\_z\_term$ whose
intended purpose is categorisation and destruction of Z terms with minimal overhead.

The function does not recursively check the constituents of the outermost Z syntactic construction.
For example, it does not check that the constituents
of a Z $decl$ are individually in the syntactic category $dec$.
=FAILURE
41002	Not within the Z language due to subterm ?0
=ENDDOC
=DOC
val ⦏is_z_term1⦎ : TERM -> bool;
=DESCRIBE
Tests if a given HOL term is valid Z in its top level structure.
=USES
Recursively in well-formedness checks.
=SEEALSO
$is\_z\_term$ for a less complete check of top level structure,
$is\_z$ for a full traversal of the terms structure.
=ENDDOC
=DOC
val ⦏is_z⦎ : TERM -> bool;
val ⦏is_all_z_type⦎ : TYPE -> bool;
=DESCRIBE
If the term (i.e. expression or predicate) or type given is in the range of the Z mapping
for a term or type respectively
then these functions will return true.
They will otherwise return false, unless the
only form of incorrectness is
that the constituents of a Z syntactic construction
are not as required.
For example, it does not check that the constituents
of a Z $decl$ are individually in the syntactic category $dec$.

The test traverses the provided object
by using $full\_dest\_z\-\_term$ (and $dest\_z\-\_type$
for constituenttypes) - the test is passed
if the entire term can be broken into non-type and non-term parts
(i.e. primitives such as strings or integers).
Otherwise it will fail with the given error message.

Note that a term is a subterm of itself for these purposes.
=SEEALSO
$is\_z\_term$ and $is\_z\_term1$.
=FAILURE
41002	Not within the Z language due to subterm ?0
41003	Not within the Z language due to containing type ?0
=ENDDOC
The above test is not complete because of not checking constituents, as indicated: later releases may
include a complete test for being Z.

We use the name $is\_all\_z\_type$ to distinguish
from the previously defined $is\_z\_type$.
=DOC
val ⦏not_z_subterms⦎ : TERM -> TERM list;
=DESCRIBE
This function will return a list (perhaps empty)
of all the subterms that prevent a term (i.e. expression or predicate) being within the
Z language (by the checks of $is\_z$, q.v.), starting with the rightmost subterm that is not Z.
The subterms given will be maximal in the sense that subterms of those given will not be included in the list.
=ENDDOC
=DOC
(* ⦏check_is_z⦎ : boolean flag *)

val ⦏set_check_is_z⦎ : bool -> bool;
=DESCRIBE
This flag, if true (the default), will cause all Z inference rules and tactics that claim to remain in the Z language
to check any terms they change (i.e. assumptions and conclusions) for remaining within the Z
language.
If any fail then the informational message 41004 is used
to output text to the user.
If the flag is false, no such checks are made.
The checks are computationally expensive,
and the results may be excessively verbose if terms are not
all Z.

The function sets the flag to a specified value and retursn the
original value.
=FAILURE
41004	The following subterms in the result are not in the Z language: ?0
=ENDDOC
Actually, the flag be defaulted to true during initial work,
it perhaps later should be defaulted to false.
=DOC
val ⦏check_is_z_thm⦎ : string -> THM -> THM;
val ⦏check_is_z_goal⦎ : string -> GOAL -> GOAL;
val ⦏check_is_z_term⦎ : string -> TERM -> TERM;
val ⦏CHECK_IS_Z_T⦎ : string -> TACTIC -> TACTIC;
val ⦏check_is_z_conv_result⦎ : string -> THM -> THM;
=DESCRIBE
For $check\_is\_z\_thm$,
if flag $check\_is\_z$ is true then the conclusion and
assumptions of the provided theorem are checked for being
within the Z language (except for outermost HOL universal quantification), and informational message 41005 used if not.
The string argument is used as the name of the calling function in the error message.
If the flag is false then there is no effect.
In either case the theorem is passed through unchanged.

$check\_is\_z\_goal$ and $check\_is\_z\_term$ are analogous.
$CHECK\-\_IS\-\_Z\-\_T$ checks each of the subgoals
a tactic requests.

$check\-\_is\-\_z\-\_conv\-\_result$ checks
that the RHS of the resulting equational theorem,
and any assumptions are within the
Z language.
This allows the RHS side of the equation to have outer HOL
universal quantification, and the LHS not to be Z (e.g. in an Z introduction conversion) without complaint.
=FAILURE
41005	In the result of ?0 the following subterms are not in the Z language: ?1
=ENDDOC

\subsubsection{Representing HOL Types as Z Terms}
=DOC
val ⦏z_term_of_type⦎ : TYPE -> TERM;
val ⦏z_type_of⦎ : TERM -> TERM;
=DESCRIBE
=INLINEFT
z_term_of_type ty
=TEX
\  is a term denoting the set of all elements of the type $ty$.
The term is constructed using
=INLINEFT
mk_z_ℙ
=TEX
,
=INLINEFT
mk_z_×
=TEX
,
=INLINEFT
mk_z_h_schema
=TEX
, given sets, and the relation symbol
=INLINEFT
_ ↔ _
=TEX
\ in order to display the structure of the type in a Z-like way.
=INLINEFT
mk_u
=TEX
\ is used when all else fails.

For example:
=GFT
z_term_of_type(type_of ⓩ⟨1, 2, 3⟩⌝)			= ⓩℤ ↔ ℤ⌝
z_term_of_type(type_of ⓩ(1, 2, 3)⌝)			= ⓩℤ × ℤ × ℤ⌝
z_term_of_type(type_of ⓩ{1, 2, 3}⌝)			= ⓩℙ ℤ⌝
z_term_of_type(type_of ⓩ(a≜1, b≜2, c≜3)⌝)	= ⓩa, b, c : ℤ⌝
z_term_of_type(type_of ⌜[1; 2; 3]⌝)			= ⓩ𝕌⌝
=TEX
Note that the quotation in the last example contains an HOL list display,
the type of which, namely
=INLINEFT
ⓣℕ LIST⌝
=TEX
, lies outside the representation of the Z type system in HOL.

$z\_type\_of$ returns the set of all elements of the (HOL) type of a particular term.
=GFT Definition
val z_type_of = z_term_of_type o type_of;
=TEX
=ENDDOC

\subsubsection{Adjustment after α-conversion}
Errors start with 4110.

If a substitution via $var\_subst$ is made upon a term in Z (that may be
part of a theorem or subgoal) by the
many important functions that call $var\_subst$
(e.g. rewriting and $∀$ elimination),
and if this substitution causes bound variable renaming, the
resulting term may no longer be in the Z language.
This may be because either the types of
$decl$-style bindings
(see \cite{DS/FMU/IED/ZED002}, the section upon ``Variable Binding Constructs'') may no longer match the variable names bound,
or because the variables in the binding have ceased being in a canonical order.
Either of these two problems can be ``fixed'' by post-processing.
The problems may be adjusted back to Z by using
Z renaming constructs, reordering of quantifiers or by $α$-conversion,
returning the term to being within
the Z language.

Other ProofPower functions, such as $inst$ may also cause
undesirable renaming.

The following two functions fulfill this need:
=DOC
val ⦏α_to_z⦎ : TERM -> TERM;
=DESCRIBE
This function will adjust all sub-terms that fail to be
Z because either:
\begin{itemize}
\item
The subterm involves a $decl$-style binding, and the type of the binding
does not match the names of the variables bound.
This is adjusted using the Z renaming construct.
\item
The subterm is a $decl$-style binding whose bound variables are not
in the canonical ordering that would result from the Z mapping.
This is adjusted by reorganising the order of abstractions and arguments.
\end{itemize}
If a HOL $α$-conversion will suffice then that will be
used instead.

Subterms that are not covered by these two cases will be traversed and their own subterms checked, regardless of their language.

NOT YET IMPLEMENTED.
=SEEALSO
$α\_to\_z\_conv$
=FAILURE
41100	No adjustment took place
=ENDDOC
=DOC
val ⦏α_to_z_conv⦎ : CONV;
=DESCRIBE
This function will return the equality theorem between a term
and one that adjusts all sub-terms that fail to be
Z because either:
\begin{itemize}
\item
The subterm is a $decl$-style binding, and the type of the binding
does not match the names of the variables bound.
This is adjusted using the Z renaming construct.
\item
The subterm is a $decl$-style binding whose bound variables are not
in the canonical ordering that would result from the Z mapping.
This is adjusted by reorganising the order of abstractions and arguments.
\end{itemize}
If a HOL $α$-conversion will suffice then that will be
used instead.

Subterms that are not covered by these two cases will be traversed and their own subterms checked, regardless of their language.

NOT YET IMPLEMENTED.
=SEEALSO
$α\-\_to\_z$
=FAILURE
41100	No adjustment took place
=ENDDOC
\subsubsection{Concerning Generic Formals}
These are represented by HOL universals and may thus
be manipulated by $∀\_elim$, etc.

\subsection{Concerning the Universe, 𝕌} \label{U}
Errors start with 4106.

In \cite{DS/FMU/IED/DTD078} the following definition is given.

Ⓢ╒ 𝕌[X]═
│ 𝕌 : ℙ X
├
│ 𝕌 = X
└

This definition is supplied purely for convenience.
If a generic global variable appears without any supplied generic actuals then the variable is taken to be generic
in $ⓩ𝕌⌝$.
This leads to terms which are polymorphic, rather than truly set generic. The following material about $𝕌$ is provided to facilitate discharging the proof obligation of implicit predicates in Z declarations.

=DOC
val ⦏z_∈_u_conv⦎ : CONV;
=DESCRIBE
Simplifies to $true$ a predicate of the forms:
=INLINEFT
ⓩx ∈ S[𝕌]⌝
=TEX
{},
=INLINEFT
ⓩx ⊆ S[𝕌]⌝
=TEX
{} or a schema as a predicate:
=INLINEFT
ⓩ[a,b: S[𝕌]; c : S'[𝕌]; ...]⌝
=TEX
{}, where
$S[𝕌]$, $S'[𝕌]$, ... are structures
that can be simplified to $𝕌$.
This uses the application of the built-in
simplifications listed below, and conversions held in the ``icl$'$u$\_$simp'' entry of the dictionary of nets field of the current
proof context
(the built-in's taking precedence).
=FRULE 1 Conversion
z_∈_u_conv
ⓩx ∈ S[𝕌]⌝
├
├
⊢ x ∈ S[𝕌] ⇔ true
=TEX
=FRULE 1 Conversion
z_∈_u_conv
ⓩx ⊆ S[𝕌]⌝
├
├
⊢ x ⊆ S[𝕌] ⇔ true
=TEX
=FRULE 1 Conversion
z_∈_u_conv
ⓩ[a,b: S[𝕌]; c : S'[𝕌]; ...]⌝
├
├
⊢ [a,b: S[𝕌]; c : S'[𝕌]; ...] ⇔ true
=TEX
The conversion starts with the structure $S[𝕌]$ above.
It will attempt to recursively prove equal to $𝕌$:
the argument to $ℙ$,
the consitituent sets of a cartesian tuple,
the types of a declaration part of a set abstraction with a true predicate,
and the types of a declaration part of a horizontal schema with a true predicate.
If it can do so it will then use:
=GFT
⊢ ℙ 𝕌 = 𝕌
⊢ (𝕌 × 𝕌 × ...) = 𝕌
⊢ {lab1 : 𝕌; lab2 : 𝕌; lab3,lab4 : 𝕌; ... } = 𝕌
⊢ [lab1 : 𝕌; lab2 : 𝕌; lab3,lab4 : 𝕌; ... ] = 𝕌
=TEX
to prove the set equal to $𝕌$.
If it cannot complete the above proof it will use the
first applicable conversion of the ``icl$'$u$\_$simp'' entry of the dictionary of nets field of the current
proof context,
and then return to attempting to use the built-in algorithm.

If the set has been reduced to $𝕌$ the conversion
will prove the input term $true$.
If the expression cannot be proven the conversion fails.
=USES
For stripping in proof contexts, and in eliminating redundant declarations that have been
converted to the predicates implicit in them.
=SEEALSO
$u\-\_simp\-\_eqn\-\_cxt$, $theory\-\_u\-\_simp\-\_eqn\-\_cxt$,
and $set\-\_u\-\_simp\-\_eqn\-\_cxt$ for creating appropriate proof
contexts.
=FAILURE
41061	cannot prove ?0 equal to ⓩtrue⌝
41062	?0 is not of the form: ⓩx ⊆ s⌝, ⓩx ∈ s⌝ or a schema as a predicate
=ENDDOC
We have a mix of built-in and proof context functions in the
above two simplifiers primarily to allow one to simplify
schemas and the other not to.
However this approach is also helpful in efficiently recognising structures created by
generated constants (such as those for tuples, set abstractions and schemas).

$⊆$, according to Spivey is part of the Z library, but it
is defined in the Z language theory, and is used in the
implementation of declarations.
This use in declarations is precisely the one we most wish to simplify if it is $⊆\ 𝕌$.

=DOC
val ⦏u_simp_eqn_cxt⦎ : THM list -> EQN_CXT;
=DESCRIBE
=INLINEFT
u_simp_eqn_cxt thms
=TEX
{} takes each member of $thms$,
and checks and then processes it for
use in
creating proof context entries used by
$z\-\_∈\-\_u\-\_conv$.

The check is that each theorem is
canonicalised with the current proof context's canonicalisation
function.
For each resulting theorem, if it is a universally quantified equation of sets then it is processed by $thm\_eqn\_cxt$ and added into the created equational context.
If it is not equation of sets the theorem is ignored.
=USES
This function is primarily intended to aid the
construction of proof contexts containing $𝕌$
simplification material.

Note that equational contexts can be joined using list append, $@$.
=SEEALSO
$theory\_u\_simp\_eqn\_cxt$, $set\-\_u\-\_simp\-\_eqn\-\_cxt$
=ENDDOC
=DOC
val ⦏theory_u_simp_eqn_cxt⦎ : string -> EQN_CXT;
=DESCRIBE
=INLINEFT
theory_u_simp_eqn_cxt theory_name
=TEX
{} takes the named theory and checks it for
theorems, definitions and axioms that could be used for
creating proof context entries used by
$z\-\_∈\-\_u\-\_conv$.

A theorem is checked by canonicalising it, and accepting
those resulting theorems that are equations between
an expression that is not $𝕌$, and $𝕌$.
Those that can be so used are processed by $thm\-\_eqn\-\_cxt$
and then added to the equational context being generated.
=USES
This function is primarily intended for the automatic extraction and processing
of the given set and free type definitions of a theory,
when building a proof context for a particular theory.

Note that equational contexts can be joined using list append, $@$.
=SEEALSO
$u\_simp\_eqn\_cxt$, $set\-\_u\-\_simp\-\_eqn\-\_cxt$
=FAILUREC
\paragraph{Errors}
As the failures of $get\_defn$.
=ENDDOC

=DOC
val ⦏set_u_simp_eqn_cxt⦎ : EQN_CXT -> string -> unit;
val ⦏get_u_simp_eqn_cxt⦎ : string -> (EQN_CXT * string)list;
=DESCRIBE
=INLINEFT
set_u_simp_eqn_cxt ec pc_name;
=TEX
{} sets the ``icl$'$u$\-\_$simp'' entry of the dictionary of nets field of the proof context called ``pc$\_$name''
to the equational context $ec$.
This means that when this named proof context has been made the current proof context
(probably merged with others)
it will be ``aware'' of the equational contexts potential $𝕌$ simplifications.

For example, to make the current proof context aware of the $𝕌$ simplifications of the (in scope) theory ``thy'' one would do:
=GFT
new_pc "thy_u_simp_pc";
set_u_simp_eqn_cxt (theory_u_simp_eqn_cxt "thy") "thy_u_simp_pc";
push_merge_pcs ("thy_u_simp_pc" :: other_desired_proof_contexts);
=TEX
One could later update information about the theory
(e.g. because new definitions have been added) by:
=GFT
set_u_simp_eqn_cxt (theory_u_simp_eqn_cxt "thy") "thy_u_simp_pc";
set_merge_pcs ("thy_u_simp_pc" :: other_desired_proof_contexts);
=TEX

=INLINEFT
set_u_simp_eqn_cxt ex pc_name;
=TEX
{} extracts the $𝕌$ simplification subfields of the named
proof context.
These subfields are each an equational context paired with its
original source proof context name.
=SEEALSO
$u\_simp\_eqn\_cxt$, $theory\_u\_simp\_eqn\_cxt$
=FAILURE
51010	There is no proof context with key ?0
51014	Proof context ?0 was created in theory ?1 at a
	point now either not in scope, deleted or modified
51016	Proof context ?0 has been committed
=ENDDOC

\subsection{Concerning Z Universal Quantification}
Errors start with  4102 or 4107
=DOC
val ⦏z_∀_elim⦎ : TERM -> THM -> THM;
=DESCRIBE
Specialise the variables introduced by a Z universally quantifier
to given values of the right type, the values being taken from a binding.
=FRULE 1 Rule
z_∀_elim
ⓩ(x⋎1 ≜ t⋎1, ... )⌝
├
Γ ⊢ ∀ D[x⋎1,...] | P⋎1[x⋎1,...]⦁ P⋎2[x⋎1,...]
├
Γ ⊢ "predicate from D'[t⋎1,...]"
    ∧ P⋎1'[t⋎1,...] ⇒ P⋎2'[t⋎1,...]
=TEX
where $D$ is a declaration that binds the $x⋎i$,
that is converted to its implicit predicate by
=INLINEFT
z_decl_pred_conv
=TEX
.
The theorem may be type instantiated or require bound variable renaming to allow the
specialisation to be valid, thus the priming in the result.

If both the supplied binding and the declaration are
recognisably ``empty'' then the universal quantification will be eliminated.

If instead the theorem's conclusion has a single universally quantified variable and the theorem can be type instantiated to match the supplied argument, then that supplied argument will be used directly.
=FRULE 1 Rule
z_∀_elim
ⓩt⌝
├
Γ ⊢ ∀ x:X | P⋎1[x]⦁ P⋎2[x]
├
Γ ⊢ t ∈ X' ∧ P⋎1'[t] ⇒ P⋎2'[t]
=TEX

If neither of the above apply then the supplied binding may instead be
anything else that has an appropriate binding type.
In such cases projection functions will be used:
=FRULE 1 Rule
z_∀_elim
ⓩt⌝
├
Γ ⊢ ∀ D[x⋎1,...] | P⋎1[x⋎1,...]⦁ P⋎2[x⋎1,...]
├
Γ ⊢ "predicate from D[t.x⋎1,...]" ∧
	P⋎1'[t.x⋎1,...] ⇒ P⋎2'[t.x⋎1,...]
=TEX
=SEEALSO
$z\_∀\_elim\_conv2$
=FAILURE
47310	?0 is not a Z universal quantification
41021	?0 cannot be interpreted as a binding that matches ?1
=ENDDOC
Later releases may include $z\_∀\_elim1$ that simplifies
the antecedent of the resulting implication,
and an $all\_z\_∀\_elim$.
=DOC
val ⦏z_∀_intro1⦎ :  THM -> THM;
=DESCRIBE
A rule to introduce a Z universal quantification. The variables to be quantified over must not occur free in the assumptions, and are determined from the form of the input theorem.
=FRULE 1 Rule
z_∀_intro1
├
Γ ⊢ "predicate from D" ∧ P⋎1 ⇒ P⋎2
├
Γ ⊢ ∀ D | P⋎1⦁ P⋎2
=TEX
where ``predicate from D'' is converted to a declaration
in which this predicate is implicit by
=INLINEFT
Z_DECL_INTRO_C z_pred_dec_conv
=TEX
.

An arbitrary conjunctive structure is allowed in ``D as a predicate'',
including repeated bindings of single variables: only the ordering,
as opposed to the nesting is significant in the
conjunctive structure.  The predicate
=INLINEFT
true
=TEX
{} is converted to the empty declaration.
=SEEALSO
$z\_∀\_intro$ for implicit $x⋎i\ ∈\ 𝕌$ conjuncts,
$all\-\_z\-\_∀\-\_intro$,
$z\_∀\_intro\_conv1$.
=FAILURE
6005	?0 occurs free in assumption list
41026	?0 not of the form `Γ ⊢ "predicate from D" ∧ P⋎1 ⇒ P⋎2`
41027	?0 cannot be made into a declaration
=ENDDOC
This rule, and the following are included in the initial release from a belief that they are likely to be necessary at some point,
rather than any more rigorous requirement.
=DOC
val ⦏z_∀_intro⦎ :  TERM list -> THM -> THM;
=DESCRIBE
A rule to introduce a Z universal quantification. The variables to be quantified over must not occur free in the assumptions,
and are determined from the variables from the supplied list.
=FRULE 1 Rule
z_∀_intro
[ⓩx⋎1⌝,...]
├
Γ ⊢ P⋎1 ⇒ P⋎2
├
Γ ⊢ ∀x⋎1:𝕌;... | P⋎1⦁ P⋎2
=TEX
or else:
=FRULE 1 Rule
z_∀_intro
[ⓩx⋎1⌝,...]
├
Γ ⊢ P
├
Γ ⊢ ∀x⋎1:𝕌;... | true⦁ P⋎2
=TEX
An arbitrary conjunctive structure is allowed,
including repeated bindings of single variables: only the ordering,
as opposed to the nesting is significant in the
conjunctive structure.
=SEEALSO
$z\_∀\_intro1$ for use without additional $x⋎i\ ∈\ 𝕌$,
$all\-\_z\-\_∀\-\_intro$,
$z\-\_∀\-\_intro\-\_conv1$.
=FAILURE
3007	?0 is not a term variable
6005	?0 occurs free in assumption list
=ENDDOC
This could be extended to accept predicates of the form $ⓩx ∈ X⌝$,
to indicate that a type constraint other than $ⓩ𝕌⌝$ is desired.
=DOC
val ⦏z_∀_elim_conv2⦎ : CONV;
val ⦏z_∀_intro_conv1⦎ : CONV;
=DESCRIBE
$z\_∀\_elim\_conv2$ turns a Z universally quantified predicate into
a HOL universally quantified term.
The result fails to be in the Z language because it contains
a declaration used in a position requiring a predicate, which Z does not allow.
=FRULE 1 Conversion
z_∀_elim_conv2
ⓩ∀ D[x⋎1,...] | P⋎1⦁ P⋎2⌝
├
├
⊢ (∀ D[x⋎1,...] | P⋎1⦁ P⋎2) ⇔
  ⌜∀ x⋎1 ...⦁ ⓩD[x⋎1,...]⌝ ∧ ⓩP⋎1⌝ ⇒ ⓩP⋎2⌝⌝
=TEX
The order of the resulting universally quantified variables
will be in a sorted order, rather than what the declaration
part might suggest.

$z\_∀\_intro\_conv1$ undoes this process, returning a theorem
whose RHS should be in the Z language.
=FRULE 1 Conversion
z_∀_intro_conv1
⌜∀ x⋎1 ...⦁ ⓩD[x⋎1,...] ∧ P⋎1 ⇒ P⋎2⌝⌝
├
├
⊢ ⌜∀ x⋎1 ...⦁ ⓩD[x⋎1,...] ∧ P⋎1 ⇒ P⋎2⌝⌝ ⇔
  ∀ D[x⋎1,...] | P⋎1⦁ P⋎2
=TEX

If there are no quantified variables and the declaration is
=INLINEFT
D[]
=TEX
, the HOL universal quantification is not generated by
$z\_∀\_elim\_conv2$ nor expected by $z\_∀\_intro\_conv1$.
=USES
Used in the Z form of $strip\_tac$,
and handling negations with quantifiers.
It will handle paired quantifiers, and quantifiers in any order, so long as the quantifiers and declaration can be matched
in names and types.
=SEEALSO
$z\_∀\_elim\_conv1$, $z\_∀\_elim\_conv$, $z\_∀\_intro\_conv$
=FAILURE
41022	?0 is not of the form: ⓩ∀ D | P⋎1⦁ P⋎2⌝
41023	?0 is not of the form: ⌜∀ x⋎1 ...⦁ Decl ∧ P⋎1 ⇒ P⋎2⌝
41024	?0 is not of the form: ⌜∀ x⋎1 ...⦁ Decl ∧ P⋎1 ⇒ P⋎2⌝
	where the ⌜x⋎i⌝ do not match the declaration
=ENDDOC
=DOC
val ⦏all_z_∀_intro⦎ : THM -> THM;
=DESCRIBE
This will Z universally quantify all free variables in the conclusion
of a theorem, that do not occur in the assumptions.
The declaration part will state the variables are of type $ⓩ𝕌⌝$,
and the predicate part will just be $true$.
If no variables can be introduced then the original theorem will be returned.
=ENDDOC
=DOC
val ⦏z_∀_elim_conv1⦎ : CONV;
=DESCRIBE
Turn a Z universally quantified predicate into
a HOL universally quantified term,
eliminating the declaration part of the original quantification using $z\_∈\_u\_conv$.
The function fails if the declaration cannot be eliminated.
=FRULE 1 Conversion
z_∀_elim_conv1
ⓩ∀ D[x⋎1,...] | P⋎1⦁ P⋎2⌝
├
├
⊢ (∀ D[x⋎1,...] | P⋎1⦁ P⋎2) ⇔
	⌜∀ x⋎1 ...⦁ ⓩP⋎1 ⇒ P⋎2⌝⌝
=TEX
The order of the resulting universally quantified variables
will be in a sorted order, rather than what the declaration
part might suggest.

Simplifications based on $P⋎i$ being $true$ or $false$
will also be applied.

If there are no quantified variables and the declaration is
=INLINEFT
D[]
=TEX
, the HOL universal quantification is not generated.

Remains within the Z language (with the caveat of using outer HOL universal quantification).
=USES
For stripping in proof contexts.
=SEEALSO
$z\_∀\_elim\_conv2$ and $z\_∀\_elim\_conv$
=FAILURE
41022	?0 is not of the form: ⓩ∀ D | P⋎1⦁ P⋎2⌝
41071	?0 is of the form: ⓩ∀ D | P⋎1⦁ P⋎2⌝ but could not eliminate D
=ENDDOC
=DOC
val ⦏z_∀_elim_conv⦎ : CONV;
=DESCRIBE
Turn a Z universally quantified predicate into
a HOL universally quantified term,
converting the declaration part of the original quantification into its implicit predicate.
=FRULE 1 Conversion
z_∀_elim_conv
ⓩ∀ D[x⋎1,...] | P⋎1⦁ P⋎2⌝
├
├
⊢ (∀ D[x⋎1,...] | P⋎1⦁ P⋎2) ⇔
	⌜∀ x⋎1 ...⦁
		ⓩ"predicate from D[x⋎1,...]"
		∧ P⋎1 ⇒ P⋎2⌝⌝
=TEX
The order of the resulting universally quantified variables
will be in a sorted order, rather than what the declaration
part might suggest.

If there are no quantified variables and the declaration is
=INLINEFT
D[]
=TEX
, the HOL universal quantification is not generated.

Remains within the Z language (with the caveat of using outer HOL universal quantification).
=FAILURE
41022	?0 is not of the form: ⓩ∀ D | P⋎1⦁ P⋎2⌝
=ENDDOC
=DOC
val ⦏z_∀_inv_conv⦎ : CONV;
=DESCRIBE
Simplifies a Z universal quantification whose predicate or
constraint is invariant w.r.t. the free variables bound by the declaration.
=FRULE 1 Conversion
z_∀_inv_conv
ⓩ∀ D | P⋎1⦁ P⋎2⌝
├
├
⊢ ∀ D | P⋎1⦁ P⋎2 ⇔
	(∀ D | P⋎1⦁ false) ∨ P⋎2
=TEX
if $P⋎2$ has no free variables bound by $D$, and
=FRULE 1 Conversion
z_∀_inv_conv
ⓩ∀ D | P⋎1⦁ P⋎2⌝
├
├
⊢ ∀ D | P⋎1⦁ P⋎2 ⇔
	P⋎1 ⇒ (∀ D | true⦁ P⋎2)
=TEX
if $P⋎1$ has no free variables bound by $D$, and
=FRULE 1 Conversion
z_∀_inv_conv
ⓩ∀ D | P⋎1⦁ P⋎2⌝
├
├
⊢ ∀ D | P⋎1⦁ P⋎2 ⇔
	P⋎1 ⇒ (∀ D | true⦁ false) ∨ P⋎2
=TEX
if both have no free variables bound by $D$.
The appropriate simplification will be avoided where the predicate $P⋎1$, is $ⓩtrue⌝$ or the value, $P⋎2$ is $ⓩfalse⌝$.
=SEEALSO
$z\_∃\_inv\_conv$
=FAILURE
47310	?0 is not a Z universal quantification
41025	?0 is not of the form: ⓩ∀ D | P⋎1⦁ P⋎2⌝ where at least
	one of P⋎1 or P⋎2 are unbound by D
=ENDDOC
=DOC
val ⦏z_∀_tac⦎ : TACTIC;
=DESCRIBE
Eliminate a Z universal in a goal.
=FRULE 2 Tactic
z_∀_tac
├
{ Γ } ∀ D | P ⦁ V
├
{ Γ } "predicate from D'" ∧ P' ⇒ V'
=TEX
$D$ is converted to its implicit predicate by $z\_decl\_pred\_conv$.
$D$, $P$ and $V$ are primed in the result because the
tactic may require some renaming to avoid, e.g. variable capture of the names of free variables in the assumption list.
=FAILURE
41030	Conclusion of the goal is not of the form: ⓩ∀ D | P ⦁ V⌝
=ENDDOC
=DOC
val ⦏z_intro_∀_tac⦎ : TERM -> TACTIC;
=DESCRIBE
Introduce a Z universal with reference to a binding.
=FRULE 2 Tactic
z_intro_∀_tac
ⓩ(x⋎1 ≜ t⋎1, ...)⌝
├
{ Γ } t
├
{ Γ } ∀ x⋎1:𝕌; ... | true⦁ t[x⋎1/t⋎1,...]
=TEX
=FAILURE
41029	?0 cannot be interpreted to be of the form: ⓩ(x⋎1 ≜ t⋎1, ...)⌝
=ENDDOC
Something like the following could be added:

``If the supplied expression is a schema object then:
=FRULE 2 Tactic
z_intro_∀_tac
ⓩS⌝
├
{ Γ } t
├
{ Γ } ∀ S⦁ t[x⋎1/S.x⋎1,...]
=TEX
where the $S.x⋎i$ substituted for are the actual values
bound by the schema, or the expression $⌜S.x⋎i⌝$.''

=DOC
val ⦏z_spec_asm_tac⦎ : TERM -> TERM -> TACTIC;
val ⦏z_spec_nth_asm_tac⦎ : int -> TERM -> TACTIC;
=DESCRIBE
These are two methods of specialising a Z universally quantified assumption.
Both leave the old assumption in place, and place the
 instantiated assumption onto the assumption list using $strip\_asm\_tac$.
If the desired behaviour differs from any of those supplied
then use $GET\_ASM\_T$ and its cousins, with $z\_∀\_elim$, to create the desired functionality.
=FRULE 2 Tactic
z_spec_asm_tac
ⓩ∀ D[x⋎1,...] | P⋎1⦁ P⋎2⌝
ⓩ(x⋎1 ≜ t⋎1, ...)⌝
├
{ Γ, ⓩ∀ D[x⋎1,...] | P⋎1⦁ P⋎2⌝ } t
├
{strip ⌜ⓩD'[t⋎1,...]⌝ ∧ ⓩP⋎1'⌝ ⇒ ⓩP⋎2'⌝⌝,
Γ, ⓩ∀ D | P⋎1⦁ P⋎2⌝} t1
=TEX
where $D'$, $P⋎1'$ and $P⋎2'$ are specialised, and if necessary have bound variable renaming done, appropriately.
Remains within the Z language (though failure to do this will be reported to be from
$z\_∀\_elim$).

$z\_spec\_nth\_asm\_tac$ uses an assumption number rather than an explicit statement of the assumption to be specialised.
=GFT Definition
fun z_spec_asm_tac (asm:TERM) (bind:TERM):TACTIC =
	GET_ASM_T asm (strip_asm_tac o z_∀_elim bind);
fun z_spec_nth_asm_tac (n:int) (bind:TERM):TACTIC =
	GET_NTH_ASM_T n (strip_asm_tac o z_∀_elim bind);
=TEX
=FAILUREC
\paragraph{Errors}
As the constituents of the implementing functions
(e.g. $GET\_ASM\_T$ and $z\_∀\_elim$).
=ENDDOC
=DOC
val ⦏z_∀_intro_conv⦎ : CONV;
=DESCRIBE
$z\_∀\_intro\_conv$ converts an arbitrary simple HOL universally quantified term into the corresponding Z,
returning a theorem whose RHS should be in the Z language
(though this is not checked for).
=FRULE 1 Conversion
z_∀_intro_conv
⌜∀ x⋎1 ...⦁ P⌝
├
├
⊢ ⌜∀ x⋎1 ...⦁ P⌝ ⇔
  (∀ x⋎1:𝕌; ... | true⦁ P)
=TEX
This conversion cannot introduce a Z~universal quantification with an empty declaration.
=SEEALSO
$z\_∀\_intro\_conv1$
=FAILURE
41047	?0 is not of the form: ⌜∀ x⋎1 ... ⦁ P⌝
=ENDDOC

\subsection{Concerning Z Existential Quantification}
Errors start with 4104
=DOC
val ⦏z_∃_elim_conv2⦎ : CONV;
val ⦏z_∃_intro_conv1⦎ : CONV;
=DESCRIBE
$z\_∃\_elim\_conv2$ turns a Z existentially quantified predicate into
a HOL existentially quantified term.
The result fails to be in the Z language because it contains
a declaration used in a position that requires a predicate, which Z does not allow,
as well as
the outer HOL existential quantification.
=FRULE 1 Conversion
z_∃_elim_conv2
ⓩ∃ D[x⋎1,...] | P⋎1⦁ P⋎2⌝
├
├
⊢ (∃ D[x⋎1,...] | P⋎1⦁ P⋎2) ⇔
  ⌜∃ x⋎1 ...⦁ ⓩD[x⋎1,...]⌝ ∧ ⓩP⋎1⌝ ∧ ⓩP⋎2⌝⌝
=TEX
The order of the resulting existentially quantified variables
will be in a sorted order, rather than what the declaration
part might suggest.

$z\_∃\_intro\_conv1$ undoes this process,
returning a theorem whose RHS should be in the Z language
(though this is not checked for).
=FRULE 1 Conversion
z_∃_intro_conv1
⌜∃ x⋎1 ...⦁ ⓩD[x⋎1,...] ∧ P⋎1 ∧ P⋎2⌝⌝
├
├
⊢ ⌜∃ x⋎1 ...⦁ ⓩD[x⋎1,...] ∧ P⋎1 ∧ P⋎2⌝⌝ ⇔
  (∃ D[x⋎1,...] | P⋎1⦁ P⋎2)
=TEX

If there are no quantified variables and the declaration is
=INLINEFT
D[]
=TEX
, the HOL existential quantification is not generated by
$z\_∃\_elim\_conv2$ nor expected by $z\_∃\_intro\_conv1$.
=USES
Used in the Z form of $strip\_tac$,
and handling negations with quantifiers.
=SEEALSO
$z\_∃\_elim\_conv1$, $z\_∃\_elim\_conv$ and
$z\_∃\_intro\_conv$
=FAILURE
41044	?0 is not of the form: ⓩ∃ D | P⋎1⦁ P⋎2⌝
41045	?0 is not of the form: ⌜∃ x⋎1 ...⦁ D[x⋎1,...] ∧ P⋎1 ∧ P⋎2⌝
41041	?0 is not of the form: ⌜∀ x⋎1 ...⦁ D ∧ P⋎1 ⇒ P⋎2⌝
	where the ⌜x⋎i⌝ do not match the declaration
=ENDDOC
=DOC
val ⦏z_∃_intro_conv⦎ : CONV;
=DESCRIBE
$z\_∃\_intro\_conv$ converts an arbitrary simple HOL existentially quantified term into the corresponding Z,
returning a theorem whose RHS should be in the Z language
(though this is not checked for).
=FRULE 1 Conversion
z_∃_intro_conv
⌜∃ x⋎1 ...⦁ P⌝
├
├
⊢ ⌜∃ x⋎1 ...⦁ P⌝ ⇔
  (∃ x⋎1:𝕌; ... | true⦁ P)
=TEX
This conversion cannot introduce a Z~existential quantification with an empty declaration.
=SEEALSO
$z\_∃\_intro\_conv1$
=FAILURE
41046	?0 is not of the form: ⌜∃ x⋎1 ... ⦁ P⌝
=ENDDOC
=DOC
val ⦏z_∃_elim_conv1⦎ : CONV;
=DESCRIBE
Turn a Z existentially quantified predicate into
a HOL existentially quantified term,
eliminating the declaration part of the original quantification using $z\_∈\_u\_conv$.
The function fails if the declaration cannot be eliminated.
=FRULE 1 Conversion
z_∃_elim_conv1
ⓩ∃ D[x⋎1,...] | P⋎1⦁ P⋎2⌝
├
├
⊢ (∃ D[x⋎1,...] | P⋎1⦁ P⋎2) ⇔
	⌜∃ x⋎1 ...⦁ ⓩP⋎1 ∧ P⋎2⌝⌝
=TEX
The order of the resulting existentially quantified variables
will be in a sorted order, rather than what the declaration
part might suggest.

Simplifications based on $P⋎i$ being $true$ or $false$
will also be applied.

If there are no quantified variables and the declaration is
=INLINEFT
D[]
=TEX
, the HOL existential quantification is not generated.
=USES
For stripping in proof contexts.
=SEEALSO
$z\_∃\_elim\_conv2$, $z\_∃\_elim\_conv$
=FAILURE
41042	?0 is not of the form: ⓩ∃ D | P⋎1⦁ P⋎2⌝
41043	?0 is of the form: ⓩ∃ D | P⋎1⦁ P⋎2⌝, but D non-trivial
=ENDDOC
=DOC
val ⦏z_∃_elim_conv⦎ : CONV;
=DESCRIBE
Turn a Z existentially quantified predicate into
a HOL existentially quantified term,
converting the declaration part of the original quantification into its implicit predicate.
=FRULE 1 Conversion
z_∃_elim_conv1
ⓩ∃ D[x⋎1,...] | P⋎1⦁ P⋎2⌝
├
├
⊢ (∃ D[x⋎1,...] | P⋎1⦁ P⋎2) ⇔
	⌜∃ x⋎1 ...⦁
	ⓩ"predicate from D[x⋎1,...]" ∧
	 P⋎1 ∧ P⋎2⌝⌝
=TEX
The order of the resulting existentially quantified variables
will be in a sorted order, rather than what the declaration
part might suggest.

If there are no quantified variables and the declaration is
=INLINEFT
D[]
=TEX
, the HOL existential quantification is not generated.

The result fails to be within the Z language,
but only due to the outer HOL existential quantification.
=SEEALSO
$z\_∃\_elim\_conv2$, $z\_∃\_elim\_conv1$
=FAILURE
41042	?0 is not of the form: ⓩ∃ D | P⋎1⦁ P⋎2⌝
=ENDDOC

=DOC
val ⦏z_∃⋎1_conv⦎ : CONV;
=DESCRIBE
Converts a Z unique existential quantification to a Z existential quantification.
=FRULE 1 Conversion
z_∃⋎1_conv
ⓩ∃⋎1 D | P⋎1⦁ P⋎2⌝
├
├
⊢ (∃⋎1 D | P⋎1⦁ P⋎2)
⇔
(∃ D | P⋎1⦁ P⋎2 ∧
(∀ D' | P⋎1' ∧ P⋎2'⦁
"characteristic tuples
 component-wise equal"))
=TEX
where the $P⋎i'$ are variants of the $P⋎i$, to
correspond to the difference between $D$ and $D'$.

Additional decoration may be introduced as necessary to
avoid free variable names capture, while
maintaining the same decoration on each component
(variable, schema, etc) of the declaration.
=EXAMPLE
z_∃⋎1_conv ⓩ ∃⋎1 [x,y : X; z:Y] | x = x' y⦁ z = f x⌝;
  -->
⊢ (∃⋎1 [x, y : X; z : Y | true] | x = x' y⦁ z = f x)
  ⇔ (∃ [x, y : X; z : Y | true]
    | (x = x' y) ∧ (z = f x)
⦁ ∀ [x, y : X; z : Y | true]''
      | (x'' = x' y'') ∧ (z'' = f x'')
⦁ (x'' = x) ∧ (y'' = y) ∧ (z'' = z))
=SEEALSO
$z\_∃⋎1\_intro\_conv$
=FAILURE
41122	?0 is not of the form: ⓩ∃⋎1D | P⋎1⦁ P⋎2⌝
=ENDDOC
=DOC
val ⦏z_∃⋎1_tac⦎ : TERM -> TACTIC;
=DESCRIBE
Provide a witness for a unique existential.
=FRULE 2 Tactic
z_∃⋎1_tac
ⓩ(x⋎1 ≜ t1,...)⌝
├
{ Γ } ∃⋎1 D[x⋎1,...] | P[x⋎1,...] ⦁ V[x⋎1,...]
├
{ Γ } "D[t⋎1,...] as a predicate" ∧
	(∀ D' | P[x⋎1',...] ∧ V[x⋎1',...]⦁
	"characteristic tuples of D'
	and witness
 	 component-wise equal"))
=TEX
=GFT Definition
val z_∃⋎1_tac wit = conv_tac z_∃⋎1_conv THEN z_∃_tac wit;
=FAILURE
41123	Conclusion of goal is not of the form: ⓩ∃⋎1D | P⋎1⦁ P⋎2⌝
41021	?0 cannot be interpreted as a binding that matches ?1
=ENDDOC

=DOC
val ⦏z_∃⋎1_intro_conv⦎ : CONV;
=DESCRIBE
$z\_∃⋎1\_intro\_conv$ converts an arbitrary simple HOL
unique existentially quantified term into the corresponding Z,
returning a theorem whose RHS should be in the Z language.

It can only reason about a single bound variable.
=FRULE 1 Conversion
z_∃⋎1_intro_conv
⌜∃⋎1 x ⦁ P[x]⌝
├
├
⊢ ⌜∃⋎1 x ⦁ P [x]⌝ ⇔
  (∃⋎1 x:𝕌 | true⦁ P[x] )
=TEX
This conversion cannot introduce a Z~unique existential quantification with an empty declaration.
=SEEALSO
$z\_∀\_intro\_conv1$
=FAILURE
41048	?0 is not of the form: ⌜∃⋎1 x⋎1 ⦁ P⌝
=ENDDOC

=DOC
val ⦏z_∃_tac⦎ : TERM -> TACTIC ;
=DESCRIBE
Given a binding of identifiers to witnesses,
accept this as a ``group witness'' for a Z existentially
quantified goal.
=FRULE 2 Tactic
z_∃_tac
ⓩ(x⋎1 ≜ t⋎1,...) ⌝
├
{ Γ } ∃ D[x⋎1,...] | P⋎1[x⋎1,...]⦁ P⋎2[x⋎1,...]
├
{ Γ } "predicate from D[t⋎1',...]" ∧
	P⋎1'[t⋎1',...] ∧ P⋎2'[t⋎1',...]
=TEX
where the $t⋎i'$ are appropriately type instantiated
forms of the $t⋎i$.
Renaming of bound variables may be necessary, thus $P⋎1'$
rather than $P⋎1$, etc.
See $z\_decl\_pred\_conv$ for the conversion of a declaration to its implicit predicate.

An empty declaration may be given an empty binding.

If the goal's conclusion has a single Z existentially bound variable, and the supplied argument can be type instantiated to match that, then it will be used as a witness.
=FRULE 2 Tactic
z_∃_tac
ⓩt⌝
├
{ Γ } ∃ x:X | P⋎1[x⋎1]⦁ P⋎2[x⋎1]
├
{ Γ } t' ∈ X ∧ P⋎1'[t'] ∧ P⋎2'[t']
=TEX
where $t'$ is an appropriately type instantiated
form of the $t$.

Finally, if none of the above apply, the supplied binding may instead be
anything else that can be type instantiated to the appropriate binding type.
In such cases projection functions will be used:
=FRULE 2 Tactic
z_∃_tac
ⓩt⌝
├
{ Γ } ∃ D[x⋎1,...] | P⋎1[x⋎1,...]⦁ P⋎2[x⋎1,...]
├
{ Γ } "predicate from D[t.x⋎1',...]" ∧
	P⋎1'[t'.x⋎1,...] ∧ P⋎2'[t'.x⋎1,...]
=TEX
where $t'$ is an appropriately type instantiated
form of the $t$.
=FAILURE
47290	?0 is not a Z existential quantification
41021	?0 cannot be interpreted as a binding that matches ?1
=ENDDOC
=DOC
val ⦏z_∃_inv_conv⦎ : CONV;
=DESCRIBE
Simplifies a Z existential quantification whose predicate or
constraint is invariant w.r.t. the free variables bound by the declaration.
=FRULE 1 Conversion
z_∃_inv_conv
ⓩ∃ D | P⋎1⦁ P⋎2⌝
├
├
⊢ ∃ D | P⋎1⦁ P⋎2 ⇔
	 (∃ D | P⋎1⦁ true) ∧ P⋎2
=TEX
if $P⋎2$  has no free variables bound by $D$, and
=FRULE 1 Conversion
z_∃_inv_conv
ⓩ∃ D | P⋎1⦁ P⋎2⌝
├
├
⊢ ∃ D | P⋎1⦁ P⋎2 ⇔
	P⋎1 ∧ (∃ D | true⦁ P⋎2)
=TEX
if $P⋎1$  has no free variables bound by $D$, and
=FRULE 1 Conversion
z_∃_inv_conv
ⓩ∃ D | P⋎1⦁ P⋎2⌝
├
├
⊢ ∃ D | P⋎1⦁ P⋎2 ⇔
	P⋎1 ∧ (∃ D | true⦁ true) ∧ P⋎2
=TEX
if both have no free variables bound by $D$.

$P⋎1$ nor $P⋎2$ will be ``extracted'' if identical to $true$.
=SEEALSO
$z\_∀\_inv\_conv$
=FAILURE
47290	?0 is not a Z existential quantification
41040	?0 is not of the form: ⓩ∃ D | P⋎1⦁ P⋎2⌝ where at least
	one of P⋎1 or P⋎2 are unbound by D
=ENDDOC


\subsection{Conversions between Z Universal and Existential Quantifications}
Errors start with 4105
=DOC
val ⦏z_¬_∀_conv⦎ : CONV;
val ⦏z_¬_∃_conv⦎ : CONV;
=DESCRIBE
$z\_¬\_∀\_conv$ converts a negated Z universal quantification to a Z existential quantification.
=FRULE 1 Conversion
z_¬_∀_conv
ⓩ¬(∀ D | P⋎1⦁ P⋎2)⌝
├
├
⊢ ¬(∀ D | P⋎1⦁ P⋎2) ⇔
	(∃ D | P⋎1⦁ ¬ P⋎2)
=TEX
The dual is $z\_¬\_∃\_conv$:
=FRULE 1 Conversion
z_¬_∃_conv
ⓩ¬(∃ D | P⋎1⦁ P⋎2)⌝
├
├
⊢ ¬(∃ D | P⋎1⦁ P⋎2) ⇔
	(∀ D | P⋎1⦁ ¬ P⋎2)
=TEX
These two functions remain within the Z language, though this is not checked.
=FAILURE
41050	?0 not of the form: ⓩ¬(∀ D | P⋎1⦁ P⋎2)⌝
41051	?0 not of the form: ⓩ¬(∃ D | P⋎1⦁ P⋎2)⌝
=ENDDOC
We are not immediately interested in providing support for pulling
out $¬$.

We are now in a position to give:
=DOC
val ⦏z_¬_in_conv⦎ : CONV;
=DESCRIBE
This is a conversion which moves an outermost negation inside other Z predicate
calculus connectives using whichever of the following rules applies:
=GFT
		¬¬t			=	t
		¬(t1 ∧ t2)		=	¬t1 ∨ ¬t2
		¬(t1 ∨ t2)		=	¬t1 ∧ ¬t2
		¬(t1 ⇒ t2)		=	t1 ∧ ¬t2
		¬(t1 ⇔ t1)		=	false
		¬(t1 ⇔ t2)		=	(t1 ∧ ¬t2) ∨ (t2 ∧ ¬t1)
		¬(t1 = t1)		=	false
		¬(∀ D | P⦁ V) 	=	∃ D | P⦁ ¬ V
		¬(∃D | P⦁ V)		=	∀ D | P⦁ ¬ V
		¬(∃⋎1 D|P⦁ V)	=	∀D|P⦁¬(V ∧ ∀D'|P'⦁V' ⇒ D = D')
		¬true			=	false
		¬false			=	true
=USES
Tactic and conversion programming.
=FAILURE
47240	?0 is not a Z negation
28131	No applicable rules for the term ?0
=ENDDOC

\subsection{Conversions betweens Declarations and Predicates}
Errors start with 4101.
=DOC
val ⦏z_dec_pred_conv⦎ : CONV;
=DESCRIBE
A conversion which rewrites a $dec$ part of a declaration to its implicit predicate. A $decsexp$ type of declaration remains unchanged (since $decsexp$ and $predsexp$ are, in fact, the same thing).
=FRULE 1 Conversion
z_dec_pred_conv
(mk_z_dec([ⓩx⌝],ⓩX⌝))
├
├
⊢ ⓜmk_z_dec([ⓩx⌝],ⓩX⌝)⌝ ⇔ x ∈ X
=TEX
and
=FRULE 1 Conversion
z_dec_pred_conv
(mk_z_dec([ⓩx⌝,...],ⓩX⌝))
├
├
⊢ ⓜmk_z_dec([ⓩx⌝,...],ⓩX⌝)⌝ ⇔
	{x⋎1,...} ⊆ X
=TEX
and
=FRULE 1 Conversion
z_dec_pred_conv
ⓩS⌝
├
├
⊢ S ⇔ S
=TEX
where S is a schema (here promoted to a predicate).
In this last case if the schema as predicate expression
is not well-formed Z (perhaps because of substitution
of variables)
the result will be further converted to correct Z of
the form:
=GFT
binding ∈ schema
=TEX

Note that a declaration on its own is not a Z expression,
though it may be correctly embedded within certain
forms of Z expressions.
=SEEALSO
$z\_pred\_dec\_conv$
=FAILURE
41010	?0 is not a declaration
=ENDDOC

=DOC
val ⦏z_decl_pred_conv⦎ : CONV;
=DESCRIBE
A conversion which rewrites an explicit Z declaration
(i.e. a $decl$) to its implicit predicate.
An Z declaration may be found, e.g., as a component of a Z
horizontal schema.
A declaration consists of a list of components
(each a $dec$),
that are individually converted into predicates,
and the results conjoined.
The predicate implicit in a declaration, $D$, is also sometimes
referred to as the ``predicate from $D$''.

The function is defined much as if by the following:
=GFT Definition
val z_decl_pred_conv = Z_DECL_C z_dec_pred_conv;
=TEX
Thus the handling of the individual declarations is as shown in the following examples:

=FRULE 1 Conversion
z_decl_pred_conv
(decl_ofⓩ[x : X; y, z : Y; S]⌝)
├
├
⊢ ⓜdecl_ofⓩ[x : X; y, z : Y; S]⌝⌝ ⇔
  x ∈ X ∧ {y, z} ⊆ Y ∧ S
=TEX
and
=FRULE 1 Conversion
z_decl_pred_conv (decl_ofⓩ[]⌝)
├
├
⊢ ⓜdecl_ofⓩ[]⌝⌝ ⇔ true
=TEX

Note that a declaration on its own is not a Z expression,
though it may be correctly embedded within certain
forms of Z expressions.
=SEEALSO
$z\_dec\_pred\_conv$
=FAILURE
47912	?0 is not a Z declaration
=ENDDOC

=DOC
val ⦏Z_DECL_C⦎ : CONV -> CONV;
=DESCRIBE
$Z\_DECL\_C$ applies the supplied conversion to each member of a declaration and returns the conjunction of the results.
It fails if its conversion fails on any member of the declaration.

=GFT
fun z_decl_pred_conv = Z_DECL_C z_dec_pred_conv;
=TEX
{} will convert a valid Z declaration into its implicit Z predicate.
=FAILURE
47912	?0 is not a Z declaration
41012	Supplied conversion failed on one or more members of ?0
=ENDDOC

=DOC
val ⦏z_pred_dec_conv⦎ : CONV;
=DESCRIBE
A conversion which, given a certain form of predicate, rewrites the predicate as the $dec$ component of a declaration.
This acts as an inverse to the conversion $z\_dec\_pred\_conv$, the four forms recognised being as shown below:
=FRULE 1 Conversion
z_pred_dec_conv ⓩx ∈ X⌝
├
├
⊢ x ∈ X ⇔ ⓜmk_z_dec([ⓩx⌝],ⓩX⌝)⌝
=TEX
where the $x$ must be variable,
and
=FRULE 1 Conversion
z_pred_dec_conv ⓩ{x⋎1,...} ⊆ X⌝
├
├
⊢ {x⋎1,...} ⊆ X ⇔
	ⓜmk_z_dec([ⓩx⌝,...],ⓩX⌝)⌝
=TEX
where the $x⋎i$ must be variables,
and
=FRULE 1 Conversion
z_pred_dec_conv ⓩS⌝
├
├
⊢ S ⇔ S
=TEX
and
=FRULE 1 Conversion
z_pred_dec_conv ⓩθS ∈ S⌝
├
├
⊢ (θS ∈ S) ⇔ S
=TEX
=SEEALSO
$z\_dec\_pred\_conv$
=FAILURE
41011	?0 cannot be rewritten to a declaration
=ENDDOC

=DOC
val ⦏Z_DECL_INTRO_C⦎ : CONV -> CONV;
=DESCRIBE
$Z\_DECL\_INTRO\_C$ applies the supplied conversion to each conjunct of a predicate, flattening the conjunctive structure.
If this is successful, it attempts to produce a declaration from the results.

=INLINEFT
Z_DECL_INTRO_C z_pred_dec_conv
=TEX
{} will convert certain Z predicates into Z declarations
implicitly containing the predicates,
and otherwise will fail.
=FAILURE
41013	?0 not of the form: ⓩtrue⌝ or ⓩc⋎1 ∧ ...⌝ where all the c⋎i
	may have the supplied conversion applied
41014	?0 when converted to ?1 cannot be viewed as a declaration
=FAILUREC
The conversion fails if the supplied conversion fails on any conjunct,
returning the error message of that conversion application.
=ENDDOC
=DOC
val ⦏z_pred_decl_conv⦎ : CONV;
=DESCRIBE
A conversion which, given a predicate comprising a conjunction of the forms recognised by $z\_pred\_dec\_conv$, rewrites the predicate as a declaration,

The function is defined much as if by the following:
=GFT Definition
val z_pred_decl_conv = Z_DECL_INTRO_C z_dec_pred_conv;
=TEX
Thus the handling of the conjuncts is as shown in the following examples:
=FRULE 1 Conversion
z_pred_decl_conv
ⓩx ∈ X ∧ {y, z} ⊆ Y ∧ S⌝
├
├
 ⊢ x ∈ X ∧ {y, z} ⊆ Y ∧ S ⇔
  ⓜdecl_ofⓩ[x : X; y, z : Y; S]⌝⌝
=TEX
and
=FRULE 1 Conversion
z_pred_decl_conv
ⓩtrue⌝
├
├
 ⊢ true ⇔ ⓜdecl_ofⓩ[]⌝⌝
=TEX
=SEEALSO
$z\_decl\_pred\_conv$
=FAILURE
41011	?0 cannot be rewritten to a declaration
=ENDDOC

The following two functions are introduced here
to allow reasoning about
set displays derived from declarations.
They would otherwise be put in \cite{DS/FMU/IED/DTD042}.
=DOC
val ⦏z_∈_setd_conv⦎ : CONV;
=DESCRIBE
A conversion of membership of a Z set display into equality with a member of the set.
=FRULE 1 Conversion
z_∈_setd_conv
ⓩt ∈ { t⋎1, t⋎2, ...}⌝
├
├
⊢ t ∈ { t⋎1, t⋎2, ...} =
((t = t⋎1) ∨ (t = t⋎2) ...)
=TEX
=SEEALSO
$z\_∈\_setd\_conv1$
=FAILURE
41015	?0 is not of the form: ⓩx ∈ {t1,...}⌝
41016	?0 is an ill-formed fragment of the membership of a set display
=ENDDOC

=DOC
val ⦏z_setd_⊆_conv⦎ : CONV
=DESCRIBE
Expand out expressions that state that a set display
is a subset of some other set.
This is particularly aimed at processing declarations
of the form
=INLINEFT
x⋎1,...,x⋎n : X
=TEX
{}.
=FRULE 1 Conversion
z_setd_⊆_conv
ⓩ{x⋎1,...} ⊆ X⌝
├
├
ⓩ{x⋎1,...} ⊆ X ⇔
(x⋎1 ∈ X ∧ ...)
=TEX
and
=FRULE 1 Conversion
z_setd_⊆_conv
ⓩ{} ⊆ X⌝
├
├
ⓩ{} ⊆ X ⇔ true
=TEX
The conversion will all simplify certain subterms involving
$true$ or terms of the form $x\ =\ x$.
=SEEALSO
$z\_setd\_∈\_ℙ\_conv$
=FAILURE
41017	?0 is not of the form: ⓩ{x⋎1,...} ⊆ X⌝
=ENDDOC
\subsection{Ill-formed Schemas as Predicates}
=DOC
val ⦏z_schema_pred_conv1⦎ : CONV;
=DESCRIBE
Convert an ill-formed schema as a predicate expression
into a statement of a binding being a member of the schema.
The input expression is ill-formed if it is of the form
=GFT
Z'SchemaPred bind schema
=TEX
where $bind$ is not equal to $ⓩθ\ schema⌝$.

=FRULE 1 Conversion
z_schema_pred_conv1
⌜Z'SchemaPred bind schema⌝
├
├
⊢ Z'SchemaPred bind schema ⇔
	bind ∈ schema
=TEX
=USES
In correcting the results of functions that leave Z because of substituting into the binding portion of a
schema as predicate.
In particular, in the proof context ``$'$z$\_$predicates''.
=FAILURE
41018	?0 is not an ill-formed schema as predicate expression
=ENDDOC

\subsection{Eliminating Z Quantifiers}
=DOC
val ⦏z_quantifiers_elim_tac⦎ : TACTIC;
=DESCRIBE
This tactic eliminates all Z $∀$, $∃$ and $∃⋎1$ quantifiers
in both conclusion and assumptions,
in favour of HOL $∀$ and $∃$,
using $z\-\_∀\-\_elim\-\_conv2$, $z\-\_∃\-\_elim\-\_conv2$,
 $z\-\_∃⋎1\-\_conv1$.
All declarations introduced will be converted to their implicit Z predicates,
and the following simplifications also done throughout:
=GFT
ⓩ{x,y,...} ⊆ s⌝  ---> ⌜x ∈ s ∧ y ∈ s ∧ ...⌝
	(* only when the set display contains just variables *)
ⓩx ∧ true⌝  ---> ⌜x⌝
ⓩtrue ∧ x⌝  ---> ⌜x⌝
ⓩx ⇒ true⌝  ---> ⌜true⌝
=TEX
All assumptions will be stripped back into the assumption
list, regardless of whether they were modified,
using the current proof context.

This is done to prepare for some further processing, such
as resolution.
The result is unlikely to be in the Z language
It has no effect
(rather than failing) if there are no conversions to be done.
=USES
Intended for implementing automated proof procedures.
=ENDDOC
\subsection{Generic Predicates}
A predicate within the Z language may only contain generic formals as the outermost construct.
However, various proof steps may damage this.
The following functions are intended to correct such flaws.
=DOC
val ⦏z_¬_gen_pred_conv⦎ : CONV;
=DESCRIBE
Convert a negated generic predicate (which is not legal Z) into
an existentially quantified negation (and therefore into Z).
=FRULE 1 Conversion
z_¬_gen_pred_conv
⌜¬ ⓩ[X1,...] pred⌝⌝
├
├
⊢ (⌜¬ ⓩ[X1,...] pred⌝⌝) ⇔
  ∃ X1:𝕌;... ⦁ ¬ pred
=TEX
=USES
In stripping for repaired the effects of, e.g., $contr\_tac$.
=FAILURE
41031	?0 is not of the form: ⌜¬ ⓩ[X1,...] pred⌝⌝
=ENDDOC
=DOC
val ⦏z_gen_pred_intro⦎ : TERM list -> THM -> THM;
=DESCRIBE
Introduce a list of generic formals.
The $TERM$ $list$ argument is of variables.
Their types will be ignored, they are replaced by
the variables $ⓩvar\ ⦂\ ℙ\ var⌝$.
=FRULE 1 Rule
z_gen_pred_intro
[X1,...]
├
Γ ⊢ t[X1,...]
├
Γ ⊢ [X1,...] (t[X1,...])
=TEX
=FAILURE
3007	?0 is not a term variable
6005	?0 occurs free in assumption list
=ENDDOC
=DOC
val ⦏z_gen_pred_elim⦎ : TERM list -> THM -> THM;
val ⦏z_gen_pred_elim1⦎ : TERM -> THM -> THM;
=DESCRIBE
Eliminate (some of) the generic formals of a generic predicate for actual values.
If possible, the theorem will be type instantiated
to allow generic formals to match the types of
the supplied $TERM$ $list$, otherwise the rule fails.
=FRULE 1 Rule
z_gen_pred_elim
[t1,...]
├
Γ ⊢ [X1,...] (t[X1,...])
├
Γ ⊢ t[t1,...]
=TEX
=INLINEFT
z_gen_pred_elim1
=TEX
\ is just like
=INLINEFT
z_gen_pred_elim
=TEX
\ except that its argument is a term rather than a list of terms.
=INLINEFT
z_gen_pred_elim1ⓩ(t1, ...)⌝
=TEX
\ is equivalent to
=INLINEFT
z_gen_pred_elim[ⓩt1⌝, ...]
=TEX
; if the term argument,
=INLINEFT
t
=TEX
, is not a Z tuple,
=INLINEFT
z_gen_pred_elim1ⓩt⌝
=TEX
\ is equivalent to
=INLINEFT
z_gen_pred_elim[ⓩt⌝]
=TEX
.
The advantage of
=INLINEFT
z_gen_pred_elim1
=TEX
\ is that in a call such as
=INLINEFT
z_gen_pred_elim1ⓩ(𝕌, 𝕌, 𝕌)⌝
=TEX
, the Z type inferrer can assign a more general type to
the occurrences of
=INLINEFT
U
=TEX
\ than it does in the call
=INLINEFT
z_gen_pred_elim[ⓩ𝕌⌝, ⓩ𝕌⌝, ⓩ𝕌⌝]
=TEX
.
=FAILURE
41033	?0 is not of the form: ⓩΓ ⊢ [X1,...]t⌝ where the types
	of the theorem can be instantiated to allow the types of the generic formals
	to match the types of the term list
41034	?0 is not of the form: ⓩΓ ⊢ [X1,...]t⌝ where there are sufficient Xi
	to match the supplied term list
=ENDDOC
=DOC
val ⦏z_gen_pred_u_elim⦎ : THM -> THM;
=DESCRIBE
Substitute 𝕌 for each of the generic formals of a generic predicate.
=FRULE 1 Rule
z_gen_pred_u_elim
├
Γ ⊢ [X1,X2,...] (t[X1,X2,...])
├
Γ ⊢ t[𝕌,𝕌...]
=TEX
Each occurrence of 𝕌 is instantiated to the same type as the corresponding generic formal parameter.
=ENDDOC
=DOC
val ⦏z_gen_pred_tac⦎ : TACTIC;
=DESCRIBE
A tactic to eliminate generic predicates.
=FRULE 2 Tactic
z_gen_pred_tac
├
{Γ} [X1,...] t
├
{Γ} t
=TEX
=FAILURE
41035	conclusion of goal is not of the form ⓩ[X1,...] t⌝
=ENDDOC
=DOC
val ⦏z_intro_gen_pred_tac⦎ : (TERM * TERM) list -> TACTIC;
=DESCRIBE
A tactic to introduce a generic predicate as the goal.
The term list argument pairs is of a term and a variable
(that is appropriate to be a generic formal), with the same set type
i.e. the second is of the form $ⓩvar\ :\ ℙ\ 'var⌝$.
=FRULE 2 Tactic
z_intro_gen_pred_tac
[(t1,X1),...]
├
{Γ} t[t1,...]
├
{Γ} [X1,...] (t[X1,...])
=TEX
where either $t_i$ is
the same as $X_i$, or $X_i$ does not appear free in the conclusion,
$t[t1,...]$, of the original goal.

N.B. this tactic strengthens the goal, i.e. it may result in unprovable
subgoals even when the original goal was provable.
=FAILURE
28082	?0 does not appear free in the goal
28083	?0 appears free in the goal and is not the same as ?1
41032	?0 is not of the form: ⓩvar : ℙ 'var⌝
41036	?0 does not have the same type as ?1
=ENDDOC
\section{Z CONSISTENCY PROOFS}
=DOC
val ⦏z_push_consistency_goal⦎ : TERM -> unit;
=DESCRIBE
$z\_push\_consistency\_goal$ $ⓩconst⌝$ will
first determine the specification theorem of $const$,
by executing $z\_get\_spec$.
The $const$ may either be a constant, or a constant applied to a list of arguments.
If this theorem has an assumption,
it will then push that specification assumption onto the stack of subgoals (using $push\_subgoal$, q.v.), as a goal with no assumptions.
By how $z\_get\_spec$ is designed, this (single) assumption
will be of the form:
=GFT
⌜Consistent (λ vs[x1,...,xn]⦁p[x1,...,xn])⌝
=TEX
or the consistency has already been proven, and saved, under some assumptions.
Only in the former case will the function continue:
it will apply a tactic (that may be undone by $undo$) which
rewrites the goal to:
=GFT
([], ⓩ∃ D[x1,...,xn]⦁p[x1,...,xn]⌝)
=TEX
where $D$ is a declaration of the variables, $x1$,...$xn$ representing the
existence witnesses of the $n$ constants declared in one paragraph.
Otherwise, if the definition involves generic formals:
=GFT
([], ⓩ∃ D[x1,...,xn]⦁p[x1,...,xn]⌝)
=TEX

If not, the function fails.
=SEEALSO
$save\_consistency\_thm$ to save the result in a conventional manner.
=FAILURE
46005	There is no constant with name ?0 in scope
46006	There is no definition or axiom with key ?0 in
	the declaration theory of the constant
46007	Specification of ?0 is not of the form: `Consistent (λ vs[x1,...,xn]⦁p[x1,...,xn]) ⊢ ...`
46009	?0 is not a constant, or a constant applied to some arguments
=ENDDOC

\section{Z REWRITING}
\subsection{Canonicalisation}
=DOC
val ⦏z_para_pred_canon⦎ : CANON;
val ⦏z_para_pred_conv⦎ : CONV;
=DESCRIBE
This canonicalisation function and conversion change
Z paragraphs to Z predicates. This change is also the one
$z\_get\_spec$ does, where appropriate.

Some paragraphs entered by the Z parser have ``markers''
applied to the rest of the theorem body to indicate their origin (i.e. the kind of paragraph).
In addition the form of the term is likely to have a
an explicit declaration as the left conjunct, rather than a ``predicate implicit in a declaration''.
$z\-\_para\-\_pred\-\_canon$ is a canonicalisation function that removes these markers and converts, if present,
a left conjunct declaration as
$z\_decl\_pred\_conv$ would;
$z\-\_para\-\_pred\-\_conv$ is a conversion that has the equivalent effect.

The following are instances in which markers are used:
=GFT
Constraint Definitions
Free Type Definitions
Given Set Definitions
Axiomatic Definitions
Schema Boxes
Abbreviation Definitions
=TEX
=EXAMPLE
If the following is entered:
=GFTSHOW
 ╒[X,Y]═
 │Ex : ℙ(X × Y)
 ├────
 │Ex = {}
 └────
=TEX
$z\_para\_pred\_canon$ given the defining theorem, returns a singleton list
containing:
=GFT
⊢ ⌜∀ X Y⦁ ⓩEx[X, Y] ∈ ℙ (X × Y) ∧ Ex[X, Y] = {}⌝⌝
=TEX
Both functions remain within the Z language, though this is not checked, with the caveat on HOL universals representing generic formals.
=FAILURE
41080	No Z markers found applied to conclusion body of ?0
41082	No Z markers found applied to body of ?0
=ENDDOC
=DOC
val ⦏z_get_spec⦎ : TERM -> THM;
=DESCRIBE
This function returns the specification of a constant, based
on its definiting theorem and, if one can be found, a consistency theorem.
The defining theorem may have been created by
Z paragraph processing, $new\_axiom$, or a HOL definitional mechanism.
This function should be the Z user's interface to definitional theorems, as $get\_spec$(q.v.) is for the HOL user.

$z\_get\_spec$ $⌜const⌝$ will find the (first) definition or axiom in scope
stored under key ``name of $const$'', in the theory in which the in-scope constant named $const$ was defined.
A definition will be taken in preference to an axiom in the same theory.
$z\_get\_spec$ $⌜const\ t1\ t2\ ...⌝$ (i.e. a constant applied
to an arbitrary number of arguments in HOL)
will act as $z\_get\_spec$ $⌜const⌝$.
This choice is made in the assumption that a naming convention
has been followed that such a definition (or axiom) should be the definition of the constant named $const$.
This convention has been followed throughout the implementation of \Product{}.
In addition, there can only be one definition of a particular constant in scope (though the conventional key might be used elsewhere, or not at all).
If there is no such constant in scope, or no definition with the given key, then the function fails.

If the definitional theorem is of the form:
=GFT
⊢ ConstSpec p c
=TEX
(i.e. its introduction requires a consistency assumption)
the function will seek for a theorem or axiom stored with key
$const$ $\verb"^"$ ``$\_consistent$'', starting at the theory in which the definition was found, and working ``out'' to the current theory.
If conventions have been followed this theorem should be of the form:
=GFT
Γ ⊢ Consistent p
=TEX
(Ideally there should be no assumptions in the theorem, but
the function caters for their presence.)
If a theorem of this form is found then the theorem:
=GFT
β_rule `Γ ⊢ p c`
=TEX
is formed.
If not, then the theorem:
=GFT
β_rule `Consistent p ⊢ p c`
=TEX
is formed.
In all of the above cases, (i.e. with or without $ConstSpec$),
the theorem formed is checked to see whether it
is the definiton formed from processing a Z paragraph.
If so, then the conclusion of the theorem is
converted into a predicate
(by $z\_para\_pred\_conv$), and then returned as the result of
$z\_get\_spec$.
If not, then the theorem is returned without further
processing as result of
$z\_get\_spec$.
=FAILURE
46005	There is no constant with name ?0 in scope
46006	There is no definition or axiom with key ?0 in
	the declaration theory of the constant
46009	?0 is not a constant, or a constant applied to some arguments
=ENDDOC
=DOC
val ⦏z_∀_rewrite_canon⦎ : CANON;
=DESCRIBE
Take a possibly Z universally quantified theorem and
make it into, as far as possible, a HOL universally quantified
theorem usable for rewriting.
=FRULE 1 Canon
z_∀_rewrite_canon
├
Γ ⊢ ⓩ(∀ D[x⋎1,...] | P⋎1⦁ P⋎2)⌝
├
[Γ ⊢ ⌜∀ x⋎1 ...⦁
	ⓩ"predicate from D[x⋎1,...]"
	∧ P⋎1 ⇒ P⋎2⌝⌝]
=TEX
See $z\_decl\_pred\_conv$ for a description of the conversion of a declaration to its implicit predicate.

Remains within the Z language
(under the relaxation that allows outermost HOL universals), though this is not checked.
=SEEALSO
$z\_defn\_canon$
=FAILURE
41081	?0 is not of the form: ⓩ(∀ D | P⋎1⦁ P⋎2)⌝
=ENDDOC
=DOC
val ⦏z_⇒_rewrite_canon⦎ : CANON;
=DESCRIBE
This canonicalisation expects to be passed the
canonicalisations of, e.g., a Z universal or the
 result of a $z\_∀\_elim$.
These are theorems of the form:
=GFT
⊢ "predicate from D" ∧ P ⇒ V
=TEX
In these cases it is intended to prove and discard
=INLINEFT
"predicate from D"
=TEX
{} whose conjuncts can be proven true by $z\_∈\_u\_conv$ (q.v.),
and a $P$ that is identically $true$.

In fact, each conjunct of the antecedent of the supplied theorem
will have $z\_∈\_u\_conv$ attempted upon it,
the resulting antecedent will be rewritten with the theorems
=GFT
⊢ ∀ x:𝕌 ⦁ x ∧ true ⇔ x
⊢ ∀ x:𝕌 ⦁ true ∧ x ⇔ x
=TEX
and if the antecedent is thus proven $true$ it will be discarded.
Remains within the Z language, though this is not checked.
=FAILURE
41083	?0 is not of the form: Γ ⊢ P ⇒ Q
41084	caused no change with ?0
=ENDDOC
=DOC
val ⦏z_¬_rewrite_canon⦎ : THM -> THM list
=DESCRIBE
This is a canonicalisation function used for breaking theorems up into
lists of equations for use in rewriting. It performs the following
transformations:
=GFT
z_¬_rewrite_canon	(Γ ⊢ ¬(t1 ∨ t2))	= (Γ ⊢ ¬t1 ∧ ¬t2)	
z_¬_rewrite_canon	(Γ ⊢ ¬∃D | P⦁ V)	= (Γ ⊢ ∀D | P⦁ ¬V)	
z_¬_rewrite_canon	(Γ ⊢ ¬¬t)		= (Γ ⊢ t)
z_¬_rewrite_canon	(Γ ⊢ ¬t)		= (Γ ⊢ t ⇔ false)	
=TEX
Remains within the Z language, though this is not checked.
=SEEALSO
$simple\_¬\_rewrite\_canon$, $simple\_∀\_rewrite\_canon$.
=FAILURE
26201	Failed as requested
=FAILUREC
The area given by the failure will be $fail\_canon$.
=ENDDOC
Should this recognise
=INLINEFT
⊢ ¬ (∃⋎1 ...)
=TEX
?

\subsection{Conditional Rewriting}
This is a yet to be implemented part of the HOL system,
that may have some Z specific features.
\section{Z STRIPPING AND PROOF CONTEXTS}
=DOC
val ⦏z_basic_prove_tac⦎ : THM list -> TACTIC;
=DESCRIBE
This is the tactic used for the automated proof tactic (the $pr\_tac$ field) of most
supplied Z proof contexts,
and is a reasonable, general-purpose, automatic proof tactic
for Z.

In summary it will:
\begin{enumerate}
\item
Attempt variable elimination, using $all\_var\_elim\_asm\_tac$.
\item
Extract the assumption list, rewrite each extracted assumption with the current
default rewrite rules and given theorems, and strip the results back into the assumption list.
\item
Attempt to rewrite the conclusion of the resulting goal with the current
default rewrite rules and given theorems.
\item
Repeatedly apply $strip\_tac$ to the conclusions of the resulting goals.
\item
Again attempt variable elimination, using $all\_var\_elim\_asm\_tac$.
\item
In all resulting goals replace all Z quantifiers by their HOL equivalents in both assumptions and goal.
This has no effect on any resulting goal if it is unsolved.
\item
Apply $all\_asm\_fc\_tac$ once to each resulting goal.
\item
Attempt to prove each of the resulting goals with resolution for up to 3 resolution steps, with goal's negated conclusion
as a resolvant that must be used, and the assumptions as possible
other resolvants.
This has no effect on any resulting goal if it is unsolved.
\item
Attempt to prove each of the resulting goals with resolution for up to 3 resolution steps amongst
just the assumptions.
This has no effect on any resulting goal if it is unsolved.
\end{enumerate}

Note that either stripping step may result in more than one subgoal, and thus the plural ``resulting goals''.

Under the current interface to
resolution this is
=GFT
fun z_basic_prove_tac thms =
TRY_T all_var_elim_asm_tac THEN
DROP_ASMS_T (MAP_EVERY (strip_asm_tac o rewrite_rule thms) o rev) THEN
(TRY_T (rewrite_tac thms)) THEN
REPEAT strip_tac THEN
TRY_T all_var_elim_asm_tac THEN_TRY
(z_quantifiers_elim_tac
 THEN basic_res_tac2 3 [⊢ ∀ x ⦁ x = x]
 ORELSE_T basic_res_tac3 3 [⊢ ∀ x ⦁ x = x]);
=TEX
=ENDDOC
The ``3 resolution steps'' is a fixed number of steps, chosen as a compromise between finding all possible resolution proofs
and the costs of such attempts.
For finer tuning, use the resolution package more directly.
=DOC
val ⦏z_basic_prove_conv⦎ : THM list -> CONV;
=DESCRIBE
This is the conversion used for the automatic proof conversion ($pr\_tac$ field) of most
supplied proof contexts,
and is a reasonable, general-purpose, automatic proof conversion.
It will either prove the theorem with the given conclusion, or fail.

In summary it will:
\begin{enumerate}
\item
Set the term as the goal of the subgoal package
(or, more exactly, $tac\_proof$).
\item
Attempt to rewrite the term with the current
default rewrite rules and given theorems.
\item
Repeatedly apply $strip\_tac$ to the goal.
\item
Attempt variable elimination, using $all\_var\_elim\_asm\_tac$.
\item
In all resulting goals replace all Z quantifiers by their HOL equivalents in both assumptions and goal.
\item
Apply $all\_asm\_fc\_tac$ once to each resulting goal.
\item
Attempt to prove the resulting goals with resolution for up to 3 resolution steps, with goal's negated conclusion
as a resolvant that must be used, and the assumptions as possible
other resolvants.
\item
Attempt to prove the resulting goals with resolution for up to 3 resolution steps amongst
just the assumptions.
\item
If the proof is successful, return
=INLINEFT
⊢ term ⇔ T
=TEX
{} and otherwise fail.
\end{enumerate}

Note that in the stripping step may result in more than one subgoal, and thus the phrase ``resulting goals'' is used above.

Under the current interface to
resolution this is equivalent to:
=GFT
fun z_basic_prove_conv thms tm =
⇔_t_intro (
tac_proof(([],tm),
	TRY_T (rewrite_tac thms)  THEN
	REPEAT strip_tac THEN
	TRY_T all_var_elim_asm_tac THEN
	(z_quantifiers_elim_tac THEN
	basic_res_tac2 3 [⊢ ∀ x ⦁ x = x]
	ORELSE_T basic_res_tac3 3 [⊢ ∀ x ⦁ x = x]))
);
=TEX
In the implementation however, partial evaluation with just the theorems is allowed.
=FAILURE
76001	Could not prove theorem with conclusion ?0
=ENDDOC
=DOC
val ⦏z_fc_prove_tac⦎ : THM list -> TACTIC
=DESCRIBE
The resolution-based proof procedure
=INLINEFT
z_basic_prove_tac
=TEX
\ supplied as the automatic proof tactic in many of the proof contexts
for Z may be found to be somewhat slow on complex problems.
=INLINEFT
z_fc_prove_tac
=TEX
\ supplies a less general but quicker alternative based on forward
chaining (in the sense of
=INLINEFT
fc_tac
=TEX
.
It is supplied as the automatic proof tactic field in the proof
context
=INLINEFT
'z_fc
=TEX
. Its effect may be described as follows:

\begin{enumerate}
\item
Attempt variable elimination, using $all\_var\_elim\_asm\_tac$.
\item
Extract the assumption list, rewrite each assumption as it is extracted
with the current
default rewrite rules and given theorems, and strip the results back into the assumption list.
\item
Attempt to rewrite the conclusions of the resulting goals  with the current
default rewrite rules and the argument theorems.
\item
Apply $contr\_tac$.
\item
Again attempt variable elimination, using $all\_var\_elim\_asm\_tac$.
\item
In all resulting goals replace all Z quantifiers by their HOL equivalents.
\item
Apply $all\_asm\_fc\_tac$.
\item
Generate (universally quantified) implications from the assumptions
using the canonicalisation function
=INLINEFT
fc_canon1
=TEX
. The go through three forward chaining passes (in the sense of
=INLINEFT
fc_tac
=TEX
) using these implications as a starting point. At the end of each pass
any generated results are both stripped into the assumptions and processed
with
=INLINEFT
fc_canon1
=TEX
\ to be passed on as additional implications for the subsequent pass.
\end{enumerate}

For example, the tactic will prove the following goal:
=GFT
([], ⓩ
	(∀ x1 : ℤ ⦁ x1 ∈ A ⇒ x1 ∈ B) ∧
	(∀ x1 : 𝕌; x2 : 𝕌 ⦁ (x1, x2) ∈ B ◁ x ⇔ (x1, x2) ∈ B ◁ x') ∧
	x1 ∈ A ∧
	x1 ∈ ℤ ∧
	(x1, x2) ∈ x ⇒ (x1, x2) ∈ x'
⌝);
=ENDDOC
=DOC
	val ⦏z_fc_prove_conv⦎ : THM list -> CONV
=DESCRIBE
This is the automatic proof conversion supplied in the proof
context
=INLINEFT
'z_fc
=TEX
. It is based on the automatic proof tactic
=INLINEFT
z_fc_prove_tac
=TEX
, q.v.,
and is defined, in effect as:
=GFT
fun z_fc_prove_conv (thms: THM list) : CONV = (fn tm =>
	⇔_t_intro (tac_proof(([],tm), z_fc_prove_tac thms))
);
=ENDDOC

=DOC
(* Proof Context: ⦏z_predicates⦎ *)
=DESCRIBE
A complete proof context for handling the requirements of the Z predicates of the Z language
(as opposed to the mathematical tool-kit).
It is composed of proof contexts ``$'$z$\_$predicates''
and
``$'$z$\_$decl''.
\paragraph{Usage Notes}
It requires theory $z\-\_language\-\_ps$.
It is not intended to be mixed with HOL proof contexts.
=ENDDOC

=DOC
(* Proof Context: ⦏'z_predicates⦎ *)
=DESCRIBE
A component proof context for handling the requirements of the Z predicates of the Z language
(as opposed to the mathematical tool-kit).
It remains purely within the Z language, and thus lacks the
features found in proof context ``$'$z$\_$decl''
which are necessary for a complete treatment of Z predicates.
(which may be found in proof context ``z$\_$predicates'').

Predicates treated by this proof context are constructs formed from:
=GFT
 =, ¬, ∧, ∨, ⇒, ⇔, 𝕌, ∀ D | P ⦁ V, ∃ D | P ⦁ V, ∃⋎1 D | P ⦁ V
=TEX
This proof context further handles membership of constructs
purely contructed from $𝕌$, generic formals,
and Z paragraph markers.
The language predicate $∈$ is treated with the set constructs
that it expresses membership of.
Schemas (and especially schema references) as predicates
are treated by ``z$\_$schemas'',
except that this proof context will replace an ill-formed ``schema as predicate'' expression with an explicit membership.
\paragraph{Contents}
Rewriting:
=GFT
⇔_rewrite_thm, ¬_rewrite_thm,  eq_rewrite_thm, ∧_rewrite_thm, ∨_rewrite_thm,
∀_rewrite_thm, ⇒_rewrite_thm, z_schema_pred_conv1,
z_∈_u_conv, `⊢ ℙ 𝕌 = 𝕌`, `⊢ (𝕌 × 𝕌 × ...) = 𝕌`
`⊢ {lab1 : 𝕌; lab2 : 𝕌; lab3,lab4 : 𝕌; ... } = 𝕌`
z_∀_inv_conv, z_∃_inv_conv, simplifications as z_para_pred_canon
=TEX
Stripping theorems:
=GFT
z_¬_in_conv, z_¬_gen_pred_conv, z_∃_elim_conv, z_∃⋎1_conv,
z_schema_pred_conv1, z_schema_pred_conv1 pushed in ¬,
z_∈_u_conv, z_∈_u_conv pushed in ¬, z_∀_inv_conv,
⇒_thm, ⇔_thm, ∀_rewrite_thm, eq_rewrite_thm,
simplifications as z_para_pred_canon
=TEX
Note that we do not break apart a Z $∀$ into HOL quantifiers
during theorem stripping.

Stripping conclusions:
=GFT
z_∀_elim_conv, z_¬_in_conv, z_¬_gen_pred_conv, z_∈_u_conv,
z_∈_u_conv pushed in ¬, z_∃_inv_conv, ⇔_thm, eq_rewrite_thm,
`⊢ ∀a b⦁(a ∨ ¬b) ⇔ (b ⇒ a)`, `⊢ ∀ a b⦁ ¬ a ∨ b ⇔ a ⇒ b`
`⊢ ∀ a b⦁ a ∨ b ⇔ ¬ a ⇒ b`, z_schema_pred_conv1, z_schema_pred_conv1 pushed in ¬,
simplifications as z_para_pred_canon
=TEX
Note that we do not break apart a Z $∃$ into HOL quantifiers
during conclusion stripping.

Rewriting canonicalisation:
=GFT
∀_rewrite_canon, z_¬_rewrite_canon, ∧_rewrite_canon,
f_rewrite_canon, z_∀_rewrite_canon, z_para_pred_canon, z_⇒_rewrite_canon
=TEX
Notice in particular the use of the HOL $∀\_rewrite\_canon$.

Automatic proof procedures are respectively $z\-\_basic\-\_prove\-\_tac$,
$z\-\_basic\-\_prove\-\_conv$,
and
the list
=GFT
z_∃_elim_conv2, ALL_SIMPLE_∃_C "simplifications as z_para_pred_canon",
basic_prove_∃_conv
=TEX
The existence prover can also handle 1-tuples, 2-tuples,
etc, up to 16-tuples.
as arguments.
\paragraph{Usage Notes}
It requires theory $z\-\_language\-\_ps$.
It is not intended to be mixed with HOL proof contexts.
Use with proof context ``$'$z$\_$decl'' to handle declarations
properly.
=ENDDOC

This proof context
will allow $strip\_tac$ to remain within the Z language
on each of its steps, though with the caveat noted in \ref{ZCAVEAT}.

$step\_strip\_tac$ is able to
leave the Z language, which it does for
stripping
a Z existentially quantified antecedent to an implication.
However,
=INLINEFT
REPEAT step_strip_tac
=TEX
{} will remain within the Z language if its argument starts there.

Note that rewriting does not expand Z $∃⋎1$-terms, nor does stripping the conclusion.

The proof context does not concern itself with schema references,
though these are Z language predicates.

Treating the universal set, $𝕌$, in this proof context is
apparently not in keeping with the context's theme,
but it is useful to handle trivial quantifier
declarations. Such material could be moved to proof context ``$'$z$\_$decl''.

=DOC
(* Proof Context: ⦏'z_decl⦎ *)
=DESCRIBE
A component proof context for handling the requirements of converting Z declarations into their implicit predicates, kept separate from ``$'$z$\_$predicates'' due to it introducing a small
portion of Z library set theoretic reasoning.

The requirement is met by appropriate treatment of:
=GFT
set_display ⊆ set_expression
=TEX
during stripping.

\paragraph{Contents}\

Rewriting:
=GFT
=TEX
Stripping theorems:
=GFT
z_setd_⊆_conv,
and this pushed in through ¬.
=TEX

Stripping conclusions:
=GFT
z_setd_⊆_conv,
and this pushed in through ¬.
=TEX

Notice how this proof context does not use
$z\_setd\_⊆\_conv$ for rewriting, but leaves such an effect
to the proof context concerned with extensional reasoning about the Z library.

Rewriting canonicalisation:
=GFT
=TEX
Automatic proof procedures are respectively $z\-\_basic\-\_prove\-\_tac$,
$z\-\_basic\-\_prove\-\_conv$,
and
no existence provers.
\paragraph{Usage Notes}
It requires theory $z\-\_language\-\_ps$.
It is not intended to be mixed with HOL proof contexts.
Used with proof context ``$'$z$\_$predicates''.
=ENDDOC
=DOC
(* Proof Context: ⦏'z_fc⦎ *)
=DESCRIBE
A component proof context giving a faster but less general automatic
proof capability than the one supplied in most other proof contexts
for Z.
The automatic proof procedures in the proof context
are $z\-\_fc\-\_prove\-\_tac$, $z\-\_fc\-\_prove\-\_conv$.
All other fields are blank.

\paragraph{Usage Notes}
It requires theory $z\-\_language\-\_ps$.

Note that the way proof contexts are merged by
=INLINEFT
push_merge_pcs
=TEX
\ is such that to get the faster automatic proof procedures, one should
put
=INLINEFT
'z_fc
=TEX
\ at the end of the list of proof contexts to be merged.
For example, to work in the Z predicate calculus with the faster
automatic proof procedures, one might use
=GFT
push_merge_pcs["z_predicates", "'z_fc"];
=ENDDOC

\subsection{Z Contradiction Tactics}
The tactics supplied for HOL contradiction tactics extend to Z without
change, if appropriate proof contexts are used.
\section{END OF THE SIGNATURE}

=SML
end; (* signature of ZPredicateCalculus *)
=TEX

\section{TEST POLICY}
The functions in this document should be tested as described in
\cite{DS/FMU/IED/PLN008}.

\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}








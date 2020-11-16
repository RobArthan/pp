=IGN
********************************************************************************
dtd078.doc: this file is part of the PPZed system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  dtd078.doc  ℤ $Date: 2011/07/19 12:19:03 $ $Revision: 1.34 $ $RCSfile: dtd078.doc,v $
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

\def\Title{Detailed Design of the Z Library Set Theory}

\def\AbstractText{This document contains the detailed design of the Z Library Set Theory and its proof support.}

\def\Reference{DS/FMU/IED/DTD078}

\def\Author{D.J. King, K. Blackburn}


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
%% LaTeX2e port: % TQtemplate.tex
%% LaTeX2e port: \documentstyle[hol1,11pt,TQ]{article}
%% LaTeX2e port: \ftlinepenalty=9999
\def\Hide#1{}
%% LaTeX2e port: \def\Bool{``$\it{:}bool\,$''}
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{FST PROJECT}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Detailed Design of the Z Library Set Theory}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/DTD078}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.34 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2011/07/19 12:19:03 $%
%% LaTeX2e port: }}
%% LaTeX2e port: %\TPPstatus{Approved}
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: % \TPPauthor{D.J.~King & WIN01}  %% Mandatory field
%% LaTeX2e port: \TPPauthors{D.J.~King & WIN01&WIN01\\K.~Blackburn & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document contains the detailed design of
%% LaTeX2e port: the Z Library Set Theory and its proof support.}
%% LaTeX2e port: %\TPPabstractB{}
%% LaTeX2e port: %\TPPabstractC{}
%% LaTeX2e port: %\TPPabstractD{}
%% LaTeX2e port: %\TPPabstractE{}
%% LaTeX2e port: %\TPPabstractF{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port:       Library}}
%% LaTeX2e port: 
%% LaTeX2e port: %\TPPclass{CLASSIFICATION}
%% LaTeX2e port: %\def\TPPheadlhs{}
%% LaTeX2e port: %\def\TPPheadcentre{}
%% LaTeX2e port: %def\TPPheadrhs{}
%% LaTeX2e port: %\def\TPPfootlhs{}
%% LaTeX2e port: %\def\TPPfootcentre{}
%% LaTeX2e port: %\def\TPPfootrhs{}
%% LaTeX2e port: 
%% LaTeX2e port: \begin{document}
%% LaTeX2e port: \TPPsetsizes
%% LaTeX2e port: \makeTPPfrontpage
%% LaTeX2e port: 
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

\newpage
\section{DOCUMENT CONTROL}
\subsection{Contents List}
\tableofcontents
\subsection{Document Cross References}
\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes History}  % to get section number `0.3'
\begin{description}

\item[Issue 1.4 (1992/07/27), (27th July 1992) ] Load the library in axiomatic proof mode.
\item [Issue 1.7 (1992/10/15) (12th October 1992)]
Moved $⊆$ definition to \cite{DS/FMU/IED/DTD052}.
\item [Issue 1.8 (1992/10/19) (19th October 1992)]
Changed parent theory.
\item [Issue 1.9 (1992/10/28) (22nd October 1992)]
Change of name and nature to Z Library Set Theory.
\item [Issue 1.10 (1992/10/30) (30th October 1992)]
Tidying.
\item [Issue 1.11 (1992/11/12), 11th November 1992]
Changes as a consequence of changes in dependences.
Added proof contexts ``z$\_$sets$\_$ext'',
``z$\_$sets$\_$alg''
and supporting material.
\item[Issue 1.12 (1992/12/03) (2nd December 1992)]
Improved $𝕌$ simplification.
\item[Issue 1.13 (1992/12/03) (3rd December 1992)]
Added Π.
\item[Issue 1.14 (1992/12/11) (10th December 1992)]
Global rename from wrk038.doc issue 1.9.
\item[Issue 1.15 (1992/12/17) (17th December 1992)]
Remove spurious ML bindings.
\item[Issue 1.16 (1993/01/19) (19th January 1993)]
Added $z\_sets\_ext\_clauses$.
\item[Issue 1.18 (1993/02/10) (10th February 1993)]
Changes to proof contexts, etc.
\item[Issue 1.21 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.22 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.23 (2004/01/19)] The Z universal set is now called 𝕌.
\item[Issues 1.24 (2004/02/02), 1.25 (2004/02/02)] Addressed comments on USR030 from QinetiQ.
\item[Issue 1.26 (2005/02/26)] Precedences and associativity of toolkit operators now follow \cite{ISO02}.
\item[Issue 1.27 (2005/09/09)] BOOL and CHAR are now renamed as 𝔹 and 𝕊.
\item[Issue 1.28 (2005/09/09)] Adapted to use more generalised templates and added definition of conditional.
\item[Issues 1.29 (2005/09/10), 1.30 (2005/09/13)] Added support for conditionals.
\item[Issues 1.31 (2005/12/06)] Added symmetric difference.
\item[Issue 1.32 (2008/04/13)] Moved ⦂, Π and if-then-else into theory {\em z\_lanbuage\_ps} (not effective).
\item[Issue 1.33 (2010/08/18)] Added syntax functions for subset terms.
\item[Issue 1.34 (2011/07/19)]  Backed out the attempt to have ⦂, Π and if-then-else in theory {\em z\_language\_ps}; Added ≪\_≫.
\item[Issue 1.35 (2011/07/22)] Added underlining brackets operator.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported PPZed to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
None.
\pagebreak
\section{GENERAL}
\subsection{Scope}
This document contains the detailed design
of the set theory material of the Z Library.
The high level design for this material is given in \cite{DS/FMU/IED/HLD017}.
\subsection{Introduction}
This document contains the detailed design
of the set theory material of the Z Library.

By default all relevant functions in this document should
be assumed to remain within the Z language and to check this fact, unless otherwise stated.
\subsection{Purpose and Background}
See \cite{DS/FMU/IED/HLD017}.
\subsection{Dependencies}
Loading this document and its implementation is dependent on
the Z Library Sets, \cite{DS/FMU/IED/IMP043}.
\subsection{Possible Enhancements}
None.
\subsection{Deficiencies}
None known.
\section {ADDITIONAL DEFINITIONS FOR {\em z\_language\_ps}}
=SML
open_theory"z_language_ps";
push_pc "z_predicates";
val _ = set_flag ("z_type_check_only", false);
val _ = set_flag ("z_use_axioms", true);
delete_theory"z_sets" handle Fail _ => ();
new_theory"z_sets";
=TEX
\section {DEFINITION OF FIXITY}

The following fixity information is taken from \cite{ISO02}.

ⓈZ
function 25 leftassoc _ ⊖ _
■

ⓈZ
function 30 leftassoc _ ∪ _, _ \ _
■

ⓈZ
function 40 leftassoc _ ∩ _
■

ⓈZ
relation _ ≠ _, _ ∉ _, _ ⊂ _
■
ⓈZ
generic 5 rightassoc _ ↔ _, _ → _
■

ⓈZ
generic 70 ℙ⋎1 _
■

We also have the conditional operator and the extras that support the use of the {\ProductZ} language.
ⓈZ
function 0 if _? then _! else _!
■
ⓈZ
function 0 rightassoc _ ⦂ _
■
ⓈZ
│ function 0 %ll% _! %gg%
■
ⓈZ
function 0 Π _?
■


ⓈZ
relation _ ⨽ _ ⨼ _
■

\section{FUNCTION AND RELATION}
These are introduced in this document to allow us to define
the types of the rest of the Z library:
by category they belong to the Z relations and functions documents
respectively.
ⓈZ
X ⦏↔⦎ Y ≜ ℙ (X × Y)
■


ⓈZ
X ⦏→⦎ Y ≜ {f : X ↔ Y | ∀ x : X ⦁ ∃⋎1 y : Y ⦁ (x, y) ∈ f}
■


\section{SETS}
Note that $⊆$ has been defined in \cite{DS/FMU/IED/DTD052}
as, though strictly part of the Z Library, it is needed to implement the representation of Z Language declarations
in that document.
\subsection{Inequality and Non-membership}

╒[X]════════════════
│ _ ⦏≠⦎ _ : X ↔ X;
│ _ ⦏∉⦎ _ : X ↔ ℙ X
├──────────────────
│(∀ x, y : X ⦁ x ≠ y ⇔ ¬ (x = y))
│∧
│(∀ x : X; S : ℙ X ⦁ x ∉ S ⇔ ¬ (x ∈ S))
└────────────────────

\subsection{Empty Set}

ⓈZ
⦏∅⦎ [X] ≜ {x : X | false}
■

\subsection{Subset Relation and Proper Subset Relation}

╒[X]════════════════
│ _ ⦏⊂⦎ _ : ℙ X ↔ ℙ X
├──────────────────
│∀ S, T : ℙ X ⦁
│	(S ⊂ T ⇔ S ⊆ T ∧ S ≠ T)
└────────────────────

\subsection{Non-Empty Subsets}

ⓈZ
⦏ℙ⋎1⦎ X ≜ {S : ℙ X | S ≠ ∅ }
■

\subsection{Set Union, Intersection, Difference and Symmetric Difference}

╒[X]════════════════
│ _ ⦏∪⦎ _, _ ⦏∩⦎ _, _ ⦏\⦎ _, _ ⦏⊖⦎ _: ℙ X × ℙ X → ℙ X
├──────────────────
│∀ S, T : ℙ X ⦁
│	S ∪ T = {x : X | x ∈ S ∨ x ∈ T} ∧
│	S ∩ T = {x : X | x ∈ S ∧ x ∈ T} ∧
│	S \ T = {x : X | x ∈ S ∧ x ∉ T} ∧
│	S ⊖ T = {x : X | ¬(x ∈ S ⇔ x ∈ T)}
└────────────────────

\subsection{Generalized Union and Intersection}


╒[X]════════════════
│ ⦏⋃⦎, ⦏⋂⦎  : ℙ (ℙ X) → ℙ X
├──────────────────
│∀ A : ℙ (ℙ X) ⦁
│	⋃ A = {x : X | (∃ S : A ⦁ x ∈ S)} ∧
│	⋂ A = {x : X | (∀ S : A ⦁ x ∈ S)}
└────────────────────

\subsection{First and Second of Ordered Pairs}


╒[X, Y]════════════════
│ ⦏first⦎ : X × Y → X;
│ ⦏second⦎ : X × Y → Y
├──────────────────
│ ∀ x : X; y : Y ⦁
│	first (x, y) = x ∧
│	second (x, y) = y
└────────────────────

=TEX
\subsection{Conditionals}
╒[X]════════════════
│ ⦏if _? then _! else _!⦎ : 𝔹 × X × X → X
├──────────────────
│ ∀x, y:X⦁
│	(if true then x else y) = x
│ ∧	(if false then x else y) = y
└────────────────────

\subsection{Casts}
These are not part of the Standard Z Library, but are required to support
the use of the {\ProductZ} language as discussed in \cite{DS/FMU/IED/DEF007}.

╒[X]════════════════
│ ⦏_ ⦂ _⦎ : X × ℙ X → X
├──────────────────
│	(_ ⦂ _) = first
└────────────────────
ⓈZAX
	⦏Π _?⦎ : 𝔹 → 𝔹
├─────────────────────
	∀x:𝔹⦁(Π_?) x = x
■

\subsection{The Guillemet Brackets}
These are not part of the Standard Z Library, but are required to support
the use of the {\ProductZ} language as discussed in \cite{DS/FMU/IED/DEF007}.
╒[X]═══════════
│ %ll% _! %gg% : X → X
├──────
│ ∀x:X⦁ %ll%x%gg% = x
└──────────────


\subsection{Underlining Brackets}
These are not part of the Standard Z Library, but
provide the language feature whereby an underlined expression works syntactically like ans infix relation  \cite{DS/FMU/IED/DEF007}.
╒[X, Y]═══════════
│ _ ⨽ _ ⨼ _ : ℙ(X × ℙ(X × Y) × Y)
├─────
│ ∀x:X; R : ℙ(X × Y); y: Y⦁ x ⨽ R ⨼ y ⇔ (x, y) ∈ R
└─────────────────


\section{START OF STRUCTURE}
=DOC
signature ⦏ZSets⦎ = sig
=DESCRIBE
This provides the Z library sets material.
It creates the theory $z\_sets$.
=ENDDOC
=THDOC
req_name ⦏"z_sets"⦎ (Value "z_language_ps");
req_language "Z";
set_flag("tc_thms_only",true);
=DESCRIBE
The theory $z\_sets$ contains various definitions and ``defining theorems'' of Z library constants concerned wit hset theory, combined with some reasoning tools for these constants.
It is created in structure $ZSets$.
=ENDDOC

The following theorems are mostly just definitions
instantiated to $ⓩ𝕌⌝$ where appropriate,
perhaps with the addition of set extensionality.
=THDOC
req_thm(⦏"z_first_thm"⦎, ([],ⓩ∀ x: 𝕌 ⦁
	first x = x.1⌝));
req_thm(⦏"z_second_thm"⦎, ([],ⓩ∀ x: 𝕌 ⦁
	second x = x.2⌝));
=DESCRIBE
Projections from pairs.
=SEEALSO
$z\_∈\_first\_thm$, $z\_∈\_second\_thm$.
=ENDDOC
The following theorems are mostly just definitions
instantiated to $ⓩ𝕌⌝$ where appropriate,
perhaps with the addition of set extensionality.
=THDOC
req_thm(⦏"z_≠_thm"⦎, ([],ⓩ∀ x:𝕌; y: 𝕌⦁ (x ≠ y) ⇔ ¬(x = y)⌝));
req_thm(⦏"z_∉_thm"⦎, ([],ⓩ∀ x: 𝕌; S: 𝕌⦁
	x ∉ S ⇔ ¬(x ∈ S)⌝));
=DESCRIBE
Inequality and ``non-membership''.
=ENDDOC
Spivey Ed 1. page 89.
=THDOC
req_thm(⦏"z_⊆_thm1"⦎,([],⌜∀ X:'a SET⦁
	ⓩ((_ ⊆ _)[X]) ∈ (_ ↔ _)[ℙ X, ℙ X] ∧
	(∀ S, T : ℙ X
            ⦁ ((S, T) ∈ (_ ⊆ _)[X] ⇔ (∀ x : X ⦁ x ∈ S ⇒ x ∈ T)))⌝⌝));
=DESCRIBE
This is the form that a definition of $⊆$ would have taken if
it had been introduced in the Z library.
=ENDDOC
	
=THDOC
req_thm(⦏"z_∅_thm"⦎, ([],ⓩ∀ x1: 𝕌⦁ ¬(x1 ∈ ∅)⌝));
req_thm(⦏"z_∅_thm1"⦎, ([],ⓩ∅ = {}⌝));
req_thm(⦏"z_⊆_thm"⦎, ([],ⓩ∀ s:𝕌; t: 𝕌⦁
	(s ⊆ t) ⇔ (∀ x: 𝕌⦁x ∈ s ⇒ x ∈ t)⌝));
req_thm(⦏"z_∈_ℙ_thm"⦎, ([],ⓩ∀ s:𝕌; t: 𝕌⦁
	(s ∈ ℙ t) ⇔ (s ⊆ t)⌝));
req_thm(⦏"z_⊂_thm"⦎, ([],ⓩ∀ s:𝕌; t: 𝕌⦁
	(s ⊂ t) ⇔ (s ⊆ t) ∧ s ≠ t⌝));
req_thm(⦏"z_ℙ⋎1_thm"⦎, ([],
	inst[] [(ⓣ'X⌝,ⓣ'a⌝)]
	ⓩ∀ X:𝕌 ⦁ (ℙ⋎1 X) = {S : ℙ X | S ≠ ∅}⌝));
=DESCRIBE
Empty set, subset, proper subset and non-empty power set.
=ENDDOC
Spivey Ed 1. page 90.
=THDOC
req_thm(⦏"z_∪_thm"⦎, ([],ⓩ∀ z: 𝕌; s:𝕌; t: 𝕌 ⦁
	z ∈ (s ∪ t) ⇔ z ∈ s ∨ z ∈ t⌝));
req_thm(⦏"z_∩_thm"⦎, ([],ⓩ∀ z: 𝕌; s:𝕌; t: 𝕌⦁
	z ∈ (s ∩ t) ⇔ z ∈ s ∧ z ∈ t⌝));
req_thm(⦏"z_set_dif_thm"⦎, ([],ⓩ∀ z: 𝕌; s:𝕌; t: 𝕌⦁
	z ∈ (s \ t) ⇔ z ∈ s ∧ (z ∉ t)⌝));
req_thm(⦏"z_⊖_thm"⦎, ([],ⓩ∀ z: 𝕌; s:𝕌; t: 𝕌⦁
	z ∈ (s ⊖ t) ⇔ ¬(z ∈ s ⇔ z ∈ t)⌝));
=DESCRIBE
Set union, intersection,difference and symmetric difference.
=ENDDOC
Spivey Ed 1. page 91.

=THDOC
req_thm(⦏"z_⋃_thm"⦎, ([],ⓩ∀ z: 𝕌; a: 𝕌⦁
	z ∈ ⋃ a ⇔ (∃ S : 𝕌 ⦁ S ∈ a ∧ z ∈ S)⌝));
req_thm(⦏"z_⋂_thm"⦎, ([],ⓩ∀ z: 𝕌; a: 𝕌⦁
	z ∈ ⋂ a ⇔ (∀ S : 𝕌 ⦁ S ∈ a ⇒ z ∈ S)⌝));
=DESCRIBE
Generalised set union and intersection.
=ENDDOC
Spivey Ed 1. page 92.
=DOC
val ⦏z_⊆_conv⦎ : CONV;
=DESCRIBE
Use $z\_⊆\_thm$ in combination with
knowledge about tuples.
Given as input an equality of the form $v\ ⊆\ w$ then:

If $w$ is of type $ty$ $SET$ where $ty$ is not a tuple type:
=FRULE 1 Conversion
z_⊆_conv
ⓩv ⊆ w⌝
├
├
⊢ (v ⊆ w) ⇔
	(∀ xn : 𝕌 ⦁ xn ∈ v ⇒ xn ∈ w)
=TEX
where $xn$ is the first variable in the list $x1$, $x2$,...
that doesn't appear in $v$ or $w$ (free or bound).

If $w$ is of type $ty$ $SET$ where $ty$ is an n-tuple type, or binding type, then sufficient $x_i$ will be introduced,
instead of just $xn$, to allow $xn$ to be replaced by a construct
of bindings and tuples of the $x_i$, such that no $x_i$ has a binding or tuple type and appears exactly once in the construct.
=EXAMPLE
z_⊆_conv ⓩp ⊆ r × [a,b:X] × x2⌝ =
⊢ p ⊆ r × [a, b : X] × x2
    ⇔ (∀ x1 : 𝕌; x3 : 𝕌; x4 : 𝕌; x5 : 𝕌
      ⦁ (x1, (a ≜ x3, b ≜ x4), x5) ∈ p
        ⇒ (x1, (a ≜ x3, b ≜ x4), x5) ∈ r × [a, b : X] × x2)
=TEX
Notice how the introduced universal quantification ``skips''
$x2$ which is present in the input term.
=SEEALSO
$z\_⊆\_thm$, $z\_∈\_ℙ\_conv$.
=FAILURE
78001	?0 is not of the form ⓩv ⊆ w⌝
=ENDDOC
=THDOC
req_thm(⦏"z_∪_clauses"⦎,([], ⓩ
	∀ a : 𝕌 ⦁
		(a ∪ {} = a)
	∧	({} ∪ a = a)
	∧	(a ∪ 𝕌 = 𝕌)
	∧	(𝕌 ∪ a = 𝕌)
	∧	(a ∪ a = a)⌝));
=DESCRIBE
``$z\_∪\_clauses$'' provides simplifying clauses associated with ``$\$∪$''.
=ENDDOC
=THDOC
req_thm(⦏"z_∩_clauses"⦎,([], ⓩ
	∀ a : 𝕌 ⦁
		(a ∩ {} = {})
	∧	({} ∩ a = {})
	∧	(a ∩ 𝕌 = a)
	∧	(𝕌 ∩ a = a)
	∧	(a ∩ a = a)⌝));
=DESCRIBE
``$z\_∩\_clauses$'' provides simplifying clauses associated with ``$\$∩$''.
=ENDDOC
=THDOC
req_thm(⦏"z_set_dif_clauses"⦎,([], ⓩ
	∀ a : 𝕌⦁
		(a \ {} = a)
	∧	({} \ a = {})
	∧	(a \ 𝕌 = {})
	∧	(a \ a = {})⌝));
=DESCRIBE
``$z\_set\_dif\_clauses$'' provides simplifying clauses associated with ``$\$\verb+\+$''.
=ENDDOC
=THDOC
req_thm(⦏"z_⊖_clauses"⦎,([], ⓩ
	∀ a : 𝕌 ⦁
		(a ⊖ {} = a)
	∧	({} ⊖ a = a)
	∧	(a ⊖ 𝕌 = 𝕌 \ a)
	∧	(𝕌 ⊖ a = 𝕌 \ a)
	∧	(a ⊖ a = {})⌝));
=DESCRIBE
``$z\_⊖\_clauses$'' provides simplifying clauses associated with ``$\$⊖$''.
=ENDDOC
=THDOC
req_thm(⦏"z_⊆_clauses"⦎,([], ⓩ
	∀ a : 𝕌 ⦁
		(a ⊆ a)
	∧	({} ⊆ a)
	∧	(a ⊆ 𝕌)⌝));
=DESCRIBE
``$z\_⊆\_clauses$'' provides simplifying clauses associated with ``$\$⊆$''.
=ENDDOC
=THDOC
req_thm(⦏"z_⊂_clauses"⦎,([], ⓩ
	∀ a : 𝕌 ⦁
		¬ (a ⊂ a)
	∧	¬ (a ⊂ {})
	∧	({} ⊂ 𝕌)⌝));
=DESCRIBE
``$z\_⊂\_clauses$'' provides simplifying clauses associated with ``$\$⊂$''.
=ENDDOC
=THDOC
req_thm("z_⋃_clauses",([], ⓩ
		(⋃ {} = {})
	∧	(⋃ 𝕌 = 𝕌)⌝));
=DESCRIBE
``$z\_⋃\_clauses$'' provides simplifying clauses associated with ``$\$⋃$''.
=ENDDOC
=THDOC
req_thm(⦏"z_⋂_clauses"⦎,([], ⓩ
		(⋂ {} = 𝕌)
	∧	(⋂ 𝕌 = {})⌝));
=DESCRIBE
``$z\_⋂\_clauses$'' provides simplifying clauses associated with ``$\$⋂$''.
=ENDDOC
=THDOC
req_thm(⦏"z_ℙ_clauses"⦎,([], ⓩ
	∀ a : 𝕌 ⦁
		(ℙ {} = {{}})
	∧	(ℙ 𝕌 = 𝕌)
	∧	a ∈ ℙ a
	∧	{} ∈ ℙ a⌝));
=DESCRIBE
``$z\_ℙ\_clauses$'' provides simplifying clauses associated with ``$\$ℙ$''.
=ENDDOC
=THDOC
req_thm(⦏"z_ℙ⋎1_clauses"⦎,([], ⓩ
	∀ a : 𝕌 ⦁
		(ℙ⋎1 {} = {})
	∧	(a ∈ ℙ⋎1 a ⇔ a ≠ {})
	∧	¬({} ∈ ℙ⋎1 a)⌝));
=DESCRIBE
``$z\_ℙ⋎1\_clauses$'' provides simplifying clauses associated with ``$\$ℙ⋎1$''.
=ENDDOC
=THDOC
req_thm(⦏"z_×_clauses"⦎,([], ⓩ
	∀ a : 𝕌 ⦁
		(a × {} = {})
	∧	({} × a = {})
	∧	(𝕌 × 𝕌 = 𝕌)⌝));
=DESCRIBE
``$z\_×\_clauses$'' provides simplifying clauses associated with ``$\$×$''.
=ENDDOC
=THDOC
req_thm(⦏"z_sets_ext_clauses"⦎,([], ⓩ
	∀ s,t : 𝕌 ⦁
	((s = t) ⇔ (∀ x : 𝕌 ⦁ x ∈ s ⇔ x ∈ t))
	∧
	((s ⊆ t) ⇔ (∀ x : 𝕌 ⦁ x ∈ s ⇒ x ∈ t))
	∧
	((s ⊂ t) ⇔ ((∀ x : 𝕌 ⦁ x ∈ s ⇒ x ∈ t) ∧ (∃ y : 𝕌 ⦁ y ∈ t ∧ ¬(y ∈ s))))
	⌝));
=DESCRIBE
These are the three basic extensionality results for Z set theory.
It is better to use the facilities in the proof contexts
``$'z\_sets\_ext\_lib$'' and ``$'z\_sets\_ext\_lang$''
rather than use these for rewriting, and the proof context material
will introduce``good''  unique variable names, rather than repeatedly prime $x$.
=ENDDOC
=DOC
val ⦏z_seta_false_conv⦎ : CONV;
=DESCRIBE
Simplifies a Z set abstraction whose predicate is false.
=FRULE 1 Conversion
z_seta_false_conv
ⓩ{ D | false ⦁ P}⌝
├
├
⊢{ D | false ⦁ P} = {}
=TEX
=FAILURE
78002	?0 is not of the form: ⓩ{D | false ⦁ P}⌝
=ENDDOC
=THDOC
req_thm(⦏"z_if_thm"⦎,([], ⓩ
	∀ x, y : 𝕌 ⦁
		(if true then x else y) = x
	∧	(if false then x else y) = y
	⌝));
=DESCRIBE
The defining property of the conditional instantiate to 𝕌.
=ENDDOC

=THDOC
req_thm(⦏"z_guillemets_thm"⦎,([], ⓩ
	∀ x : 𝕌 ⦁ %ll% x %gg% = x
	⌝));
=DESCRIBE
Rewrite rule to eliminate the guillemet brackets.
=ENDDOC

=THDOC
req_thm(⦏"z_underlining_brackets_thm"⦎,([], ⓩ
	∀ x : 𝕌; R : 𝕌; y : 𝕌 ⦁ x ⨽ R ⨼ y ⇔ (x, y) ∈ R
	⌝));
=DESCRIBE
Rewrite rule to eliminate the underlining; brackets.
=ENDDOC

\section{THEOREMS IN SIGNATURE}
=DOC
val ⦏z_≠_thm⦎: THM;
val ⦏z_∉_thm⦎: THM;
val ⦏z_∅_thm⦎: THM;
val ⦏z_⊆_thm⦎: THM;
val ⦏z_⊆_thm1⦎: THM;
val ⦏z_⊂_thm⦎: THM;
val ⦏z_∈_ℙ_thm⦎: THM;
val ⦏z_ℙ⋎1_thm⦎: THM;
val ⦏z_∪_thm⦎: THM;
val ⦏z_∩_thm⦎: THM;
val ⦏z_set_dif_thm⦎: THM;
val ⦏z_⊖_thm⦎: THM;
val ⦏z_⋃_thm⦎: THM;
val ⦏z_⋂_thm⦎: THM;
val ⦏z_first_thm⦎: THM;
val ⦏z_second_thm⦎: THM;
val ⦏z_∪_clauses⦎: THM;
val ⦏z_∩_clauses⦎: THM;
val ⦏z_set_dif_clauses⦎: THM;
val ⦏z_⊖_clauses⦎: THM;
val ⦏z_⊆_clauses⦎: THM;
val ⦏z_⊂_clauses⦎: THM;
val ⦏z_⋃_clauses⦎: THM;
val ⦏z_⋂_clauses⦎: THM;
val ⦏z_ℙ_clauses⦎: THM;
val ⦏z_ℙ⋎1_clauses⦎: THM;
val ⦏z_×_clauses⦎: THM;
val ⦏z_if_thm⦎: THM;
val ⦏z_guillemets_thm⦎: THM;
val ⦏z_underlining_brackets_thm⦎: THM;
val ⦏z_sets_ext_clauses⦎: THM;
=DESCRIBE
These are the ML bindings of the theorems of the theory $z\_sets$.
=ENDDOC

=DOC
val ⦏z_≠_def⦎ : THM;
val ⦏z_∉_def⦎ : THM;
val ⦏z_∅_def⦎ : THM;
val ⦏z_⊂_def⦎ : THM;
val ⦏z_ℙ⋎1_def⦎ : THM;
val ⦏z_∪_def⦎ : THM;
val ⦏z_∩_def⦎ : THM;
val ⦏z_setdif_def⦎ : THM;
val ⦏z_⊖_def⦎ : THM;
val ⦏z_⋃_def⦎ : THM;
val ⦏z_⋂_def⦎ : THM;
val ⦏z_first_def⦎ : THM;
val ⦏z_second_def⦎ : THM;
val ⦏z_↔_def⦎ : THM;
val ⦏z_→_def⦎ : THM;
=DESCRIBE
These are the ML bindings of the definitions of the theory $z\_sets$.
=ENDDOC
=DOC
val ⦏z_⦂_def⦎ : THM;
val ⦏z'Π_def⦎ : THM;
val ⦏z'if_def⦎ : THM;
val ⦏z'guillemets_def⦎ : THM;
val ⦏z'underlining_brackets_def⦎ : THM;
=DESCRIBE
These are the ML bindings of the definitions of built-in global variables
that support the use of the {\ProductZ} language.
=ENDDOC
=DOC
val ⦏mk_z_⊆⦎ : (TERM * TERM) -> TERM;
val ⦏dest_z_⊆⦎ : TERM -> (TERM * TERM);
val ⦏is_z_⊆⦎ : TERM -> bool;
=DESCRIBE
Constructor, destructor and discriminator functions for Z subset terms.
=FAILURE
78006	?0 is not of the form ⓩa ⊆ s⌝
78004	?0 and ?1 do not have the same types
78007	?0 does not have a Z set type
=ENDDOC
=DOC
val ⦏mk_z_if⦎ : (TERM * TERM * TERM) -> TERM;
val ⦏dest_z_if⦎ : TERM -> (TERM * TERM * TERM);
val ⦏is_z_if⦎ : TERM -> bool;
=DESCRIBE
Constructor, destructor and discriminator functions for Z conditional terms.
=FAILURE
78003	?0 is not a Z conditional term
78004	?0 and ?1 do not have the same types
78005	?0 is not of type ⓣBOOL⌝
=ENDDOC
\section{PROOF CONTEXTS}
We provide the following proof contexts to reason about the above:

\begin{tabular}{l p{4in}}
$'z\_∈\_set\_lib$ & Simple algebraic reasoning about set theory of the Z library, especially $∈$. (e.g. $∪$) \\
$'z\_sets\_ext\_lib$ & Extensional reasoning about set theory (e.g. $∩$) \\
$'z\_normal$ & normalisation of $≠$, $∉$, $∅$ and $x\ ∈\ ℙ\ y$. \\
\end{tabular}
=DOC
(* Proof Context: ⦏'z_∈_set_lib⦎ *)
=DESCRIBE
A component proof context for handling the membership of expressions created by Z set operations of the Z library.

Predicates and expressions treated by this proof context are constructs formed from:
=GFT
⋂, ⋃, ∩, ∪, \, ⊖, ℙ⋎1, ∅
=TEX
\paragraph{Contents}\

Rewriting:
=GFT
=TEX

Stripping theorems:
=GFT
=TEX

Stripping conclusions:
=GFT
=TEX
All three of the above have theorems concerning the membership ($∈$) of terms generated by the following operators:
=GFT
⋂, ⋃, ∩, ∪, \, ⊖, ℙ⋎1, ∅
=TEX
Stripping also contains the above in negated forms.

Rewriting canonicalisation:
=GFT
=TEX
$𝕌$ simplification has the definition of $↔$ added.

Automatic proof procedures are respectively $z\-\_basic\-\_prove\-\_tac$,
$z\-\_basic\-\_prove\-\_conv$,
and
no existence prover.
\paragraph{Usage Notes}
It requires theory $z\-\_sets$.
It is intended to be used with proof context ``$'$z$\-\_$set$\-\_$lang'' and ``$'$z$\-\_$normal''
It is not intended to be mixed with HOL proof contexts.
=SEEALSO
$'z\_sets\_ext\_lib$
=ENDDOC
=DOC
(* Proof Context: ⦏'z_normal⦎ *)
=DESCRIBE
A component proof context for normalising certain constructs of the Z library.
The normalisation is done to fix on, in each case, one of two
possible equivalent representations of the same concept.
These constructs are:
=GFT
x ≠ y    		normalised to ¬(x = y)
x ∉ y    		normalised to ¬(x ∈ y)
∅        		normalised to {}
x ∈ ℙ y  		normalised to x ⊆ y
if true then x else y	normalised to x
if false then x else y	normalised to y
=TEX
\paragraph{Contents}\

Rewriting:
=GFT
z_∈_ℙ_thm, z_∅_thm1, z_∉_thm, z_≠_thm, z_if_thm
=TEX

Stripping theorems:
=GFT
z_∈_ℙ_thm, z_∅_thm, z_∉_thm, z_≠_thm, z_if_thm
and these all pushed through ¬
=TEX

Stripping conclusions:
=GFT
z_∈_ℙ_thm, z_∅_thm, z_∉_thm, z_≠_thm, z_if_thm
and these all pushed through ¬
=TEX

Rewriting canonicalisation:
=GFT
=TEX
$𝕌$ simplification has the definition of $↔$ added.

Automatic proof procedures are respectively $z\-\_basic\-\_prove\-\_tac$,
$z\-\_basic\-\_prove\-\_conv$,
and
no existence prover.
\paragraph{Usage Notes}
It requires theory $z\-\_sets$.
It is intended to be used with proof contexts ``$'$z$\-\_$set$\_$lib'' or ``$'$z$\-\_$set$\_$alg''.
=ENDDOC
Strictly $z\_≠\_thm$ is a Z library predicate operator,
rather than a set operator.

$z\_∈\_ℙ\_thm$ is included as this seems the best non-extensional rule for $ℙ$, given $⊆$ is available.

=DOC
(* Proof Context: ⦏'z_sets_alg⦎ *)
=DESCRIBE
A component proof context for handling algebraic reasoning of expressions created by Z set operations of the Z library.

Predicates and expressions treated by this proof context are constructs formed from:
=GFT
∈, ∩, ∪, \, ⊖, ⊆, ⊂, ⋂, ⋃, ℙ, ℙ⋎1, {D | false ⦁ V}, ×
=TEX
\paragraph{Contents}\

Rewriting:
=GFT
z_∪_clauses, z_∩_clauses, z_set_dif_clauses, z_⊖_clauses,
z_⊆_clauses, z_⊂_clauses, z_⋃_clauses, z_⋂_clauses,
z_ℙ_clauses, z_ℙ⋎1_clauses, z_seta_false_conv,
z_×_clauses
=TEX

Stripping theorems:
=GFT
z_∪_clauses, z_∩_clauses, z_set_dif_clauses, z_⊖_clauses,
z_⊆_clauses, z_⊂_clauses, z_⋃_clauses, z_⋂_clauses,
z_ℙ_clauses, z_ℙ⋎1_clauses, z_seta_false_conv,
z_×_clauses
as necessary converted to membership statements by ∈_C,
And all of this pushed through ¬
=TEX
Stripping conclusions:
=GFT
z_∪_clauses, z_∩_clauses, z_set_dif_clauses, z_⊖_clauses,
z_⊆_clauses, z_⊂_clauses, z_⋃_clauses, z_⋂_clauses,
z_ℙ_clauses, z_ℙ⋎1_clauses, z_seta_false_conv,
z_×_clauses
as necessary converted to membership statements by ∈_C,
And all of this pushed through ¬
=TEX

Rewriting canonicalisation:
=GFT
=TEX

Automatic proof procedures are respectively $z\-\_basic\-\_prove\-\_tac$,
$z\-\_basic\-\_prove\-\_conv$,
and
no existence prover.
\paragraph{Usage Notes}
It requires theory $z\-\_sets$.
It is intended to usable with proof context ``$'$z$\-\_∈\-\_$set$\-\_$lib'', and always with ``$'$z$\-\_$normal''.
The proof context ensures that its simplifications will
be attempted before more general rules concerned membership
of set operators are used.

It is not intended to be mixed with HOL proof contexts.
=ENDDOC
=DOC
(* Proof Context: ⦏'z_sets_ext_lib⦎ *)
=DESCRIBE
An aggressive component proof context for handling the manipulation of Z set expressions, by breaking them into predicate calculus, within the Z library.

Predicates treated by this proof context are constructs formed from:
=GFT
⊆, ⊂
=TEX
\paragraph{Contents}\

Rewriting:
=GFT
z_⊆_conv, z_⊂_thm, z_setd_⊆_conv
=TEX

Stripping theorems:
=GFT
z_⊆_conv, z_⊂_thm, z_setd_⊆_conv,
plus these all pushed in through ¬
=TEX

Stripping conclusions:
=GFT
z_⊆_conv, z_⊂_thm, z_setd_⊆_conv,
plus these all pushed in through ¬
=TEX
In all of the above $z\_setd\_⊆\_conv$, which does the conversion:
=GFT
{x1,x2,...} ⊆ y ---> x1 ∈ y ∧ x2 ∈ y ∧ ...
=TEX
is used, where applicable, in preference to $z\_⊆\_conv$, which, in the simplest cases, does the conversion:
=GFT
p ⊆ q ---> ∀ x1 ⦁ x1 ∈ p ⇒ xx1 ∈ q
=TEX

Rewriting canonicalisation:
=GFT
=TEX

Automatic proof procedures are respectively $z\-\_basic\-\_prove\-\_tac$,
$z\-\_basic\-\_prove\-\_conv$,
and
no existence prover.
\paragraph{Usage Notes}
It requires theory $z\-\_sets$.
It is intended to always be used in conjunction with ``$'$z$\-\_$set$\-\_$lib'' and ``$'$z$\-\_$set$\-\_$ext$\-\_$lang''.
If used with ``$'$z$\_$sets$\_$alg'' then the simplification
in that proof context will take precedence over the
extensionality effects of this proof context.

It is not intended to be mixed with HOL proof contexts.
=SEEALSO
$'z\_∈\_set\_lib$
=ENDDOC
Notice that there is an overlap of sorts in stripping with ``$'$z$\_∈\_$set$\_$lib'' - the simplifications would usually
be discovered without these additions to the above proof context, but perhaps not as fast.

\section{EPILOGUE}
=SML
end (* end of signature ZSets *);
=TEX
=SML
reset_flag ("z_type_check_only");
reset_flag ("z_use_axioms");
=TEX

\section{TEST POLICY}
The module tests for this module are to follow the guidelines
laid down in the quality plan~\cite{DS/FMU/IED/PLN008}.

\twocolumn[\section{INDEX}]
\small
\printindex

\end{document}

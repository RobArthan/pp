=IGN
********************************************************************************
dtd071.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  ℤ $Date: 2002/10/17 15:10:58 $ $Revision: 1.18 $ $RCSfile: dtd071.doc,v $
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

\def\Title{Detailed Design for the Theory of Relations}

\def\AbstractText{This document gives a detailed design for the theory of (binary) relations viewed as sets of pairs.}

\def\Reference{DS/FMU/IED/DTD071}

\def\Author{R.B.Jones}


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
%% LaTeX2e port: \TPPproject{FST Project}
%% LaTeX2e port: \TPPtitle{Detailed Design for the Theory of Relations}
%% LaTeX2e port: \def\TPPheadtitle{Detailed Design for the \cr
%% LaTeX2e port: Theory of Relations}
%% LaTeX2e port: \TPPref{DS/FMU/IED/DTD071}
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.18 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}
%% LaTeX2e port: \def\SCCSdate{\FormatDate{$Date: 2002/10/17 15:10:58 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPdate{\SCCSdate}
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{R.B.Jones & WIN01}
%% LaTeX2e port: %\TPPauthors{R.D. Arthan & WIN01\\K. Blackburn & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D. Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document gives a detailed design for the
%% LaTeX2e port: theory of (binary) relations viewed as sets of pairs.}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	    Library
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
%% LaTeX2e port: \begin{center}
%% LaTeX2e port: \bf Copyright \copyright\ : Lemma 1 Ltd. 1992
%% LaTeX2e port: \end{center}

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
\item[Issue 1.6 (1992/06/02) (\FormatDate{92/06/02})]
This is the first draft of the document.

\item[Issue 1.7 (1992/06/10) (\FormatDate{92/06/10})]
Revised in the light of comments received.

\item[Issue 1.8 (1992/06/16) - 1.10 (1992/06/19)]
Added more comprehensive list of theorems and corrected miscellanea.
\item[Issue 1.11 (1992/06/24) (24th June 1992)]
Removed unproven theorem from signature.

\item[\FormatDate{92/10/29
}, issues 1.12 - 1.16]
	Add indexing characters.
	Add the $bin\_rel\_ext\_clauses$ theorem.
	Add the $'bin\_rel\_ext$ proof context.
	Change definitions of $Total$ and $Surjective$ to be more useful
		in defining properties of relations.
	Add more theorems.
	Add the $bin\_rel\_insert\_thm$ theorem.
	Reorder clauses in some definitions.

%\item[\FormatDate{issue 1.17 (1993/02/02)]
	Changed definitions of $Total$ and $Surjective$ to
	use set comprehensions.
	Added proof context $'bin\_rel$.
	Upgraded extensional proof context to use new conversions
	for set equality (from \cite{DS/FMU/IED/DTD044}).
\item[Issue 1.18 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.19 (2002/10/17)] PPHol-specific updates for open source release
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}

\subsection{Changes Forecast}
More theorems and proof contexts.

\section{GENERAL}
\subsection{Scope}
This document contains a detailed design
for the theory ``bin\_rel'' which is required by~\cite{DS/FMU/IED/HLD011}.
The design is implemented in \cite{DS/FMU/IED/IMP071}.

\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains the detailed design for the theory ``$bin\_rel$''.

\subsubsection{Dependencies}
This document depends on \cite{DS/FMU/IED/IMP044}, and the theory design tools of \cite{DS/FMU/IED/DTD035}.
\subsubsection{Deficiencies}
None known.
\subsubsection{Possible Enhancements}
Additional theorems and proof context facilities.

\section{THE THEORY ``$bin\_rel$''}
\subsection{Preamble}
=THDOC
set_flag("tc_thms_only", true);
=DESCRIBE
We set the theorem check only flag since the definitions in the theory are
to be made via constant specification boxes.
=ENDDOC
=THDOC
req_name ⦏"bin_rel"⦎ (Value "hol");
=DESCRIBE
The theory ``$bin\_rel$'' contains the definitions of various operators upon sets of pairs and proves theorems relating to these for use in proof contexts.
=ENDDOC
=SML
val _ = open_theory "hol";
val _ = push_pc "hol";
val _ = new_theory "bin_rel";
=TEX

\subsection{Constructing Binary Relations}

The definition of the maplet symbol ``$↦$'' and type abbreviations ``$ℙ$'' and ``$↔$'' are included to give a Z-like syntax:
=SML
val _ = declare_type_abbrev(⦏"ℙ"⦎, ["'a"], ⌜:('a)SET⌝);
val _ = declare_infix(240, "↔");
val _ = declare_type_abbrev(⦏"↔"⦎, ["'a","'b"], ⌜:('a × 'b)ℙ⌝);
val _ = declare_infix(300, "↦");
ⓈHOLCONST
│	$⦏↦⦎:'a → 'b → 'a × 'b
├───────────────────
│	$↦ = $,
■
The HOL constant $×$ is the cartesian product constructor.
ⓈHOLCONST
│	$⦏×⦎:'a ℙ → 'b ℙ → ('a ↔ 'b)
├───────────────────
│	∀ (x : 'a ℙ) (y : 'b ℙ)
│	⦁ (x × y) = {(v,w) | v ∈ x ∧ w ∈ y}
■
The HOL constant $⦏↔⦎$ is the relation constructor.

ⓈHOLCONST
│	$⦏↔⦎:'a ℙ → 'b ℙ → ('a ↔ 'b) ℙ
├───────────────────
│	∀ (x : 'a ℙ) (y : 'b ℙ)
│	⦁ (x ↔ y) = ℙ(x × y)
■
The HOL constant $Dom$ is the function giving the domain of a relation.
ⓈHOLCONST
│	⦏Dom⦎:('a ↔ 'b) → ('a)ℙ
├───────────────────
│	∀ (r : ('a ↔ 'b))
│	⦁ Dom r = {x | ∃y ⦁ (x, y) ∈ r}
■
The HOL constant $⦏Ran⦎$ is the function giving the range of a relation.
ⓈHOLCONST
│	⦏Ran⦎:('a ↔ 'b) → ('b)ℙ
├───────────────────
│	∀ (r : ('a ↔ 'b))
│	⦁ Ran r = {y | ∃x ⦁ (x, y) ∈ r}
■
Given a set $a$, then ``$Id\,a$'' is the identity relation on $a$.
ⓈHOLCONST
│	⦏Id⦎:('a)ℙ → ('a ↔ 'a)
├───────────────────
│	∀ (s : ('a)ℙ)
│	⦁  Id s = {(x, y) | x = y ∧ x ∈ s}
■
$Graph$ converts an HOL function into the corresponding relation.

ⓈHOLCONST
│	⦏Graph⦎:('a → 'b)→ ('a ↔ 'b)
├───────────────────
│	∀ f : 'a → 'b
│	⦁  Graph f = {(x, y) | y = f x}
■
=SML
val _ = declare_infix(240, "⨾");
ⓈHOLCONST
│	$⦏⨾⦎:('a → 'b) → ('b → 'c) → ('a → 'c)
├───────────────────
│	∀ (f:'a → 'b) (g:'b → 'c) ⦁ f ⨾ g = g o f
■
=SML
val _ = declare_infix(240, "R_⨾_R");
ⓈHOLCONST
│	$⦏R_⨾_R⦎:('a ↔ 'b) → ('b ↔ 'c) → ('a ↔ 'c)
├───────────────────
│	∀ r s ⦁ r R_⨾_R s =
│	{(x,z)|∃y⦁ (x,y) ∈ r ∧ (y,z) ∈ s}
■
We make $⨾$ an alias of $R\_⨾\_R$ to make the syntax more Z-like:
=SML
val _ = declare_alias(⦏"⨾"⦎,⌜$R_⨾_R⌝);
=TEX
=SML
val _ = declare_infix(240, "R_o_R");
ⓈHOLCONST
│	$⦏R_o_R⦎:('b ↔ 'c) → ('a ↔ 'b) → ('a ↔ 'c)
├───────────────────
│	∀ r s ⦁ r R_o_R s = s R_⨾_R r
■
=SML
val _ = declare_alias(⦏"o"⦎,⌜$R_o_R⌝);

=TEX
=SML
val _ = declare_infix(240,"◁");

ⓈHOLCONST
│	$⦏◁⦎:('a)ℙ → ('a ↔ 'b) → ('a ↔ 'b)
├───────────────────
│	∀ a r ⦁ a ◁ r = {(x,y)| x ∈ a ∧ (x,y) ∈ r}
■
=SML
val _ = declare_infix(240,"▷");
ⓈHOLCONST
│	$⦏▷⦎:('a ↔ 'b) → ('b)ℙ → ('a ↔ 'b)
├───────────────────
│	∀ a r ⦁ r ▷ a = {(x,y)| y ∈ a ∧ (x,y) ∈ r}
■
=SML
val _ = declare_infix(240,"⩤");

ⓈHOLCONST
│	$⦏⩤⦎:('a)ℙ → ('a ↔ 'b) → ('a ↔ 'b)
├───────────────────
│	∀ a r ⦁ a ⩤ r = {(x,y)| ¬ x ∈ a ∧ (x,y) ∈ r}
■
=SML
val _ = declare_infix(240,"⩥");
ⓈHOLCONST
│	$⦏⩥⦎:('a ↔ 'b) → ('b)ℙ → ('a ↔ 'b)
├───────────────────
│	∀ a r ⦁ r ⩥ a = {(x,y)| ¬ y ∈ a ∧ (x,y) ∈ r}
■
ⓈHOLCONST
│	$⦏InvRel⦎:('a ↔ 'b) → ('b ↔ 'a)
├───────────────────
│	∀ r ⦁ InvRel r = {(x,y)| (y,x) ∈ r}
■
Again to look like Z, we use an alias:
=SML
val _ = declare_alias(⦏"↗~↕"⦎,⌜InvRel⌝);
val _ = declare_postfix(300,"↗~↕");
=TEX
$Image$ is the relational image operation, written, rather
unpleasantly, as $\_⦇\_⦈$ in Z.
=SML
val _ = declare_infix(280,"Image");
ⓈHOLCONST
│	$⦏Image⦎:('a ↔ 'b) → ('a)ℙ → ('b)ℙ
├───────────────────
│	∀ r s ⦁ r Image s = {y| ∃x⦁ x ∈ s ∧ (x, y) ∈ r}
■

\subsection{Properties of Relations}

The following definitions of useful properties of relations are not
given in the Z library, but give a more readable way of defining
the closure operators and the various function-space arrows.

ⓈHOLCONST
│	$⦏Reflexive⦎:('a ↔ 'a) ℙ
├───────────────────
│	Reflexive = {r | ∀x⦁ (x, x) ∈ r}
■
ⓈHOLCONST
│	$⦏Symmetric⦎:('a ↔ 'a) ℙ
├───────────────────
│	Symmetric = {r | ∀x y⦁ (x, y) ∈ r ⇒ (y, x) ∈ r}
■
ⓈHOLCONST
│	$⦏Transitive⦎:('a ↔ 'a) ℙ
├───────────────────
│	Transitive = {r | ∀x y z⦁ (x, y) ∈ r ∧ (y, z) ∈ r ⇒ (x, z) ∈ r}
■
ⓈHOLCONST
│	$⦏Injective⦎:('a ↔ 'b) ℙ
├───────────────────
│	Injective = {r | ∀x y; z⦁ (x, z) ∈ r ∧ (y, z) ∈ r ⇒ x = y}
■

=TEX
Relations are described as ``surjective'' onto a set or as ``total''
from a set.  The sets of all surjective or total functions are then ``%
=INLINEFT
Surjective Universe
=TEX
'' and ``%
=INLINEFT
Total Universe
=TEX
'' respectively.  Reflexive relations might also be constrained to a
set, but the expression ``%
=INLINEFT
Id a ⊆ f
=TEX
'' may be used to show that the relation ``$f$'' is reflexive over the
set ``$a$'', this might also be (less clearly) expressed as ``%
=INLINEFT
f ∩ (Id (~ a)) ⊆ Reflexive
=TEX
''.

ⓈHOLCONST
│	$⦏Surjective⦎:'b SET → ('a ↔ 'b) ℙ
├───────────────────
│	∀ s ⦁ Surjective s = {r | s = Ran r}
■
ⓈHOLCONST
│	$⦏Total⦎:'a SET → ('a ↔ 'b) ℙ
├───────────────────
│	∀ s ⦁ Total s = {r | s = Dom r}
■

The definitions of $Surjective$ and $Total$ say very little, in use
they might even take more characters to state the required property
than using (a rewritten form of) the definition itself.  However, they
offer a convenient way of representing properties of relations which
allows (for example) the functional relations
of~\cite{DS/FMU/IED/DTD072} to be defined as the intersection of
several sets.  By constrast, using a rewritten form of the definitions
would require the functional relations to be defined as the
intersection of some sets together with a little formula containing
``$\in$'' and ``$Dom$'' or ``$Ran$''.

ⓈHOLCONST
│	$⦏Functional⦎:('a ↔ 'b) ℙ
├───────────────────
│	Functional = {r | ∀x; w z⦁ (x, w) ∈ r ∧ (x, z) ∈ r ⇒ w = z}
■

The semicolon in some of the above is a hint about which types are the
same and which are different.  In the case of $Functional$ it hints
that $w$ and $z$ are of
the same type which is different to the type of $z$.

\subsection{Combining Relations}

=SML
val _ = declare_infix(240,"⊕");
ⓈHOLCONST
│	$⦏⊕⦎:('a ↔ 'b) → ('a ↔ 'b) → ('a ↔ 'b)
├───────────────────
│	∀ r s ⦁ r ⊕ s = ((Dom s) ⩤ r) ∪ s
■
=SML
val _ = declare_postfix(300,"↗+↕");
ⓈHOLCONST
│	$⦏↗+↕⦎:('a ↔ 'a) → ('a ↔ 'a)
├───────────────────
│	∀ r ⦁ r ↗+↕ = ⋂{q | r ⊆ q ∧ q ∈ Transitive}
■
=SML
val _ = declare_postfix(300,"↗*↕");
ⓈHOLCONST
│	$⦏↗*↕⦎:('a ↔ 'a) → ('a ↔ 'a)
├───────────────────
│	∀ r ⦁
│	r ↗*↕ = ⋂{q | r ⊆ q ∧ q ∈ Reflexive ∧ q ∈ Transitive}
■

ⓈHOLCONST
│	$⦏RelCombine⦎:('a ↔ 'b) → ('a ↔ 'c) → ('a ↔ ('b × 'c))
├───────────────────
│	∀ f g ⦁ RelCombine f g
│	= {(x, (y,z)) | (x,y) ∈ f ∧ (x,z) ∈ g}
■

\subsection{Theorems}

=THDOC
req_thm(⦏"rel_∈_in_clauses"⦎,([],
⌜
∀	a : 'a SET; b : 'b SET;
	x x1 :'a; y : 'b; z : 'c;
	r  r1 r2 : 'a ↔ 'b; s : 'b ↔ 'c; t : 'a ↔ 'c;	q : 'a ↔ 'a;
	f:'a → 'b
⦁
		(x ↦ y ∈ r ⇔ (x, y) ∈ r)
	∧	((x, y) ∈ (a × b) ⇔ x ∈ a ∧ y ∈ b)
	∧	(r ∈ (a ↔ b) ⇔ r ⊆ (a × b))
	∧	(x ∈ Dom r ⇔ ∃y⦁ (x, y) ∈ r)
	∧	(y ∈ Ran r ⇔ ∃x⦁ (x, y) ∈ r)
	∧	((x, x1) ∈ Id a ⇔ x = x1 ∧ x ∈ a)
	∧	((x, y) ∈ Graph f ⇔ y = f x)
	∧	((x, z) ∈ r R_⨾_R s ⇔ ∃y⦁ (x, y) ∈ r ∧ (y, z) ∈ s)
	∧	((x, z) ∈ (s R_o_R r) ⇔ (x, z) ∈ r R_⨾_R s)
	∧	((x, y) ∈ a ◁ r ⇔ x ∈ a ∧ (x, y) ∈ r)
	∧	((x, y) ∈ r ▷ b ⇔ y ∈ b ∧ (x, y) ∈ r)
	∧	((x, y) ∈ a ⩤ r ⇔ ¬x ∈ a ∧ (x, y) ∈ r)
	∧	((x, y) ∈ r ⩥ b ⇔ ¬y ∈ b ∧ (x, y) ∈ r)
	∧	((y, x) ∈ InvRel r ⇔ (x, y) ∈ r)
	∧	(y ∈ r Image a ⇔ ∃x⦁ x ∈ a ∧ (x, y) ∈ r)
	∧	(q ∈ Reflexive ⇔ ∀x⦁(x, x) ∈ q)
	∧	(q ∈ Symmetric ⇔ ∀x1 x2⦁(x1, x2) ∈ q ⇒ (x2, x1) ∈ q)
	∧	(q ∈ Transitive ⇔
			∀x1 x2 x3⦁(x1, x2) ∈ q ∧ (x2, x3) ∈ q ⇒ (x1, x3) ∈ q)
	∧	(r ∈ Injective ⇔ ∀x1 x2 y⦁(x1, y) ∈ r ∧ (x2, y) ∈ r ⇒ x1 = x2)
	∧	(r ∈ Surjective b ⇔ (∀y⦁ y ∈ b ⇔ ∃x⦁(x, y) ∈ r))
	∧	(r ∈ Total a ⇔ (∀x⦁ x ∈ a ⇔ ∃y⦁(x, y) ∈ r))
	∧	(r ∈ Functional ⇔ ∀x y1 y2⦁(x, y1) ∈ r ∧ (x, y2) ∈ r ⇒ y1 = y2)
	∧	((x, y) ∈ r1 ⊕ r2 ⇔ (x, y) ∈ (Dom r2 ⩤ r1) ∪ r2)
	∧	((x, (y, z)) ∈ RelCombine r t ⇔ (x, y) ∈ r ∧ (x, z) ∈ t)
⌝
));
=DESCRIBE
The theorem ``$rel\_∈\_in\_clauses$'' gives what is required
to reduce problems in the vocabulary
of the theory $bin\_rel$ into the language of set theory. It is used in
the proof context $'bin\_rel\_ext$ for this purpose.

Reasoning about the transitive and reflexive-transitive closure operations,
=INLINEFT
↗+↕
=TEX
\ and
=INLINEFT
↗*↕
=TEX
\ is not supported by this theorem.
=ENDDOC

=THDOC
req_thm(⦏"bin_rel_ext_clauses"⦎, ([],
⌜
∀	r1 r2 : 'a ↔ 'b
⦁
		((r1 ⊂ r2) ⇔ ((∀ x y ⦁ (x, y) ∈ r1 ⇒ (x, y) ∈ r2)
			∧ (∃ x y ⦁ ¬((x, y) ∈ r1) ∧ ((x, y) ∈ r2))))
	∧	((r1 ⊆ r2) ⇔ ∀ x y ⦁ (x, y) ∈ r1 ⇒ (x, y) ∈ r2)
	∧	((r1 = r2) ⇔ (∀ x y ⦁ (x, y) ∈ r1 ⇔ (x, y) ∈ r2))
⌝
));
=DESCRIBE
The theorem ``$bin\_rel\_ext\_clauses$'' gives theorems which express
extensionality of binary relations and closely related results.  It is
for use when set theoretic results are to be obtained by reasoning
about membership rather than by more algebraic means.

This theorem is very similar to ``$sets\_ext\_clauses$'', but the
intention here is that expressions about binary relations are rewritten
with expressions involving set membership of pairs of values allowing
other binary relation theorems to then be more readily used.

The proof context $'bin\_rel\_ext$ offers a better means of working
with relations in most cases.
=ENDDOC


=THDOC
req_thm(⦏"inv_rel_thm"⦎, ([], ⌜
∀ f a b ⦁
	(	f↗~↕ ∈ Functional ⇔ f ∈ Injective )
	∧ (	f↗~↕ ∈ Injective ⇔ f ∈ Functional )
	∧ (	f↗~↕ ∈ (Surjective a) ⇔ f ∈ (Total a) )
	∧ (	f↗~↕ ∈ (Total b) ⇔ f ∈ (Surjective b) )
⌝));
=DESCRIBE
This theorem relates the various properties of relations via
the relational inverse.
=ENDDOC


=THDOC
req_thm(⦏"bin_rel_∅_universe_thm"⦎, ([],⌜
∀	f g r0;
	r1;
	a; b
⦁
(	Dom r0 = {} ⇔ r0 = {} 			) ∧ (	Ran r0 = {} ⇔ r0 = {} )
∧ (	Dom {} = {} 					) ∧ (	Ran {} = {} )
∧ (	Dom Universe = Universe 			) ∧ (	Ran Universe = Universe )
∧ (	Id r0 = {} ⇔ r0 = {} )
∧ (	Id {} = {} )
∧ (	(r0 ↗~↕) = {} ⇔ r0 = {} 			) ∧ (	{} ↗~↕ = {} )
∧ (	Universe ↗~↕ = Universe )
∧ (	r0 ⨾ {} = {} 					) ∧ (	{} ⨾ r0 = {} )
∧ (	{} = r0 ⨾ r1 ⇔ Ran r0 ∩ Dom r1 = {} )
∧ (	r0 ⨾ r1 = {} ⇔ Ran r0 ∩ Dom r1 = {} )
∧ (	RelCombine r0 {} = {} 			) ∧ (	RelCombine {} r0 = {} )
∧ (	r0 Image {} = {} 				) ∧ (	{} Image a = {} )
∧ (	f ⊕ {} = f 					) ∧ (	{} ⊕ f = f )
∧ (	f ⊕ g = {} ⇔ (f = {} ∧ g = {}) )
∧ (	(f = {} ∧ g = {}) ⇒ f ⊕ g = {} )
∧ (	f ⊕ g = {} ⇔ (f = {} ∧ g = {}) )
∧ (	f ⊕ Universe = Universe )
∧ (	Universe ⩤ r0 = {} 		) ∧ (	a ⩤ {} = {} 		) ∧ (	{} ⩤ r0 = r0 )
∧ (	Universe ◁ r0 = r0 		) ∧ (	a ◁ {} = {} 		) ∧ (	{} ◁ r0 = {} )
∧ (	r0 ⩥ Universe = {} 		) ∧ (	{} ⩥ b = {} 		) ∧ (	r0 ⩥ {} = r0 )
∧ (	r0 ▷ Universe = r0 		) ∧ (	{} ▷ b = {} 		) ∧ (	r0 ▷ {} = {} )
⌝));
=DESCRIBE
This theorem provides several rewriting simplifications for
expressions involving the empty and universe sets when
used with the operations of binary relation.
=ENDDOC


=THDOC
req_thm(⦏"bin_rel_insert_thm"⦎, ([], ⌜
∀ a:'a SET; b:'b SET; r x xy y
⦁ (	Dom (Insert (x, y) r) = Insert x (Dom r) )
∧ (	Dom (Insert xy r) = Insert (Fst xy) (Dom r) )
∧ (	Ran (Insert (x, y) r) = Insert y (Ran r) )
∧ (	Ran (Insert xy r) = Insert (Snd xy) (Ran r) )
∧ (	Id (Insert x a) = Insert (x, x) (Id a) )
∧ (	Insert (x, y) r Image a = r Image a ∪ (if x ∈ a then {y} else {}) )
∧ (	Insert (x, y) r ⩥ b = (r ⩥ b) ∪ (if ¬ y ∈ b then {(x, y)} else {}) )
∧ (	Insert (x, y) r ▷ b = (r ▷ b) ∪ (if y ∈ b then {(x, y)} else {}) )
∧ (	a ⩤ Insert (x, y) r = (a ⩤ r) ∪ (if ¬ x ∈ a then {(x, y)} else {}) )
∧ (	a ◁ Insert (x, y) r = (a ◁ r) ∪ (if x ∈ a then {(x, y)} else {}) )
∧ (	(Insert (x, y) r) ↗~↕ = Insert (y, x) (r ↗~↕) )
⌝));
=DESCRIBE
This theorem converts expressions involving set displays and some of
the operations of binary relation into a more primitive form.  Use of
the clauses involving the restriction and image operations is best
performed when the set memberships are readily determined.
=ENDDOC


=IGN
Here are a whole lot more simple expressions that are fairly easy to prove:

The first few concern singleton sets.  These might be better expressed
in terms of set displays and $Insert$ as has been done for some operations
in the $bin_rel_insert_thm$.


⊢ a ⩤ Universe = {(a1, a2) | ¬(a1 ∈ a)}
⊢ a ⩤ Universe = {(a1, a2) | ¬(a1 ∈ a)} ∧ (a1, a2) ∈ Universe
⊢ ¬ x ∈ Dom g ⇒ {(x,y)} ⊕ g = {(x,y)} ∪ g
⊢ ( x ↦ x') ∈ Id X ⇔ ( x ∈ X ∧ x = x' )
⊢ ( x ↦ z ) ∈ P ⨾ Q ⇔ ( ∃ y ⦁ (x, y) ∈ P ∧ (y, z) ∈ Q )
⊢ ((x, z) ∈ r R_⨾_R {(y, w)} ⇔ (x, y) ∈ r ∧ z = w)
⊢ ((x, z) ∈ {(w, y)} R_⨾_R s ⇔ x = w ∧ (y, z) ∈ s)
⊢ (x,y) ∈ f ⊕ {(a,b)} ⇔ ((x,y) = (a,b) ∨ ((x,y) ∈ f ∧ ¬(x = a)))
⊢ (x,y) ∈ {(a,b)} ⊕ f ⇔ ((x,y) ∈ f ∨ (x,y) = (a,b) ∧ ¬(a ∈ Dom f))
⊢ (x,y) ∈ {(a,b)} ⊕ f ⇔ if x ∈ Dom f then (x,y) ∈ f else (x,y) = (a,b)


?⊢ (x,y) ∈ f ⊕ (Insert (x1,y1) r) ⇔ if x = x1 then y = y1 else (x,y) ∈ f ⊕ r
	--- could not prove this.


⊢ (R↗~↕)↗~↕ = R
⊢ (Id V)↗~↕ = Id V
⊢ Ran(R↗~↕) = Dom R
⊢ Dom(R↗~↕) = Ran R
⊢ (Q ⨾ R)↗~↕ = R↗~↕ ⨾ Q↗~↕
⊢ (y ↦ x) ∈ R↗~↕ ⇔ (x ↦ y) ∈ R
⊢ Dom(Q ⨾ R) = Q↗~↕ Image (Dom R)
⊢ Id(Dom R) ⊆ R ⨾ R↗~↕
⊢ Id(Ran R) ⊆ R↗~↕ ⨾ R


⊢ (P ⊕ Q) ⊕ R = P ⊕ (Q ⊕ R)
⊢ (Q ⊕ R) ▷ W ⊆ (Q ▷ W) ⊕ (R ▷ W)
⊢ (R ▷ T1) ▷ W = R ▷ (T1 ∩ W)
⊢ (R ▷ T1) ∪ (R ⩥ T1) = R
⊢ (S ◁ R) ▷ T1 = S ◁ (R ▷ T1)
⊢ (S ◁ R) ∪ (S ⩤ R) = R
⊢ (a ⊆ b ⇔ (∀ x y⦁ (x,y) ∈ a ⇒ (x,y) ∈ b)) ∧ (a = b ⇔ (∀ x y⦁ (x,y)∈ a ⇔ (x,y) ∈ b))
⊢ (a ∪ b) ▷ r = (a ▷ r) ∪ (b ▷ r));
⊢ (a ∪ b) ⨾ r = (a ⨾ r) ∪ (b ⨾ r)
⊢ (a ∪ b) ◁ r = (a ◁ r) ∪ (b ◁ r)
⊢ (a ∪ b) Image s = a Image s ∪ b Image s
⊢ (x,y) ∈ Graph f ⇔ y = f x
⊢ (x,y) ∈ r ▷ s ⇔ y ∈ s ∧ (x,y) ∈ r
⊢ (x,y) ∈ r ⨾ s ⇔ ∃ z⦁ (x, z) ∈ r ∧ (z, y) ∈ s
⊢ (x,y) ∈ s ⩤ r ⇔ ¬ x ∈ s ∧ (x,y) ∈ r
⊢ (x,y) ∈ s ◁ r ⇔ x ∈ s ∧ (x,y) ∈ r
⊢ Dom ( Q ∩ R ) ⊆ ( Dom Q ) ∩ ( Dom R )
⊢ Dom ( Q ∪ R ) = ( Dom Q ) ∪ ( Dom R )
⊢ Dom (S ◁ R) = S ∩ Dom R
⊢ Dom (x ∪ y) = Dom x ∪ Dom y
⊢ Dom P ⊆ X ⇒ Id X ⨾ P = P
⊢ Dom Q ∩ Dom R = { } ⇒ Q ⊕ R = Q ∪ R
⊢ Dom R ⊆ X ⇒ R ▷ T1 = R ∩ (X × T1)
⊢ Dom R ⊆ X ⇒ S ⩤ R = (X \ S) ◁ R
⊢ Dom R = (Graph Fst) Image R
⊢ Dom(Id a) = a
⊢ Dom(Q ⊕ R) = Dom Q ∪ Dom R
⊢ Id V ⨾ Id W = Id ( V ∩ W )
⊢ Id X ⨾ P = X ◁ P
⊢ Id(a ∪ b) = Id a ∪ Id b
⊢ InvRel(a ∪ b) = InvRel a ∪ InvRel b
⊢ P R_⨾_R ( Q ⨾ R ) = ( P ⨾ Q ) ⨾ R
⊢ P R_⨾_R Id Y = P ▷ Y
⊢ R ▷ T1 ⊆ R
⊢ R ▷ T1 = R ⨾ Id T1
⊢ R ⊕ R = R
⊢ R Image (Dom R) = Ran R
⊢ R Image (S ∩ T1) ⊆ R Image S ∩ R Image T1
⊢ R Image (S ∪ T1) = R Image S ∪ R Image T1
⊢ R Image S = Ran(S ◁ R)
⊢ Ran ( Q ∩ R ) ⊆ ( Ran Q ) ∩ ( Ran R )
⊢ Ran ( Q ∪ R ) = ( Ran Q ) ∪ ( Ran R )
⊢ Ran (R ▷ T1) = Ran R ∩ T1
⊢ Ran P ⊆ Y ⇒ P ⨾ Id Y = P
⊢ Ran R ⊆ Y ⇒ R ⩥ T1 = R ▷ (Y \ T1)
⊢ Ran R ⊆ Y ⇒ S ◁ R = (S × Y) ∩ R
⊢ Ran R = (Graph Snd) Image R
⊢ Ran(Id a) = a
⊢ Ran(Q ⨾ R) = R Image (Ran Q)
⊢ RelCombine (r1 ∪ r2) r3 = (RelCombine r1 r3) ∪ (RelCombine r2 r3)
⊢ RelCombine r1 (r2 ∪ r3) = (RelCombine r1 r2) ∪ (RelCombine r1 r3)
⊢ S ◁ (V ◁ R) = (S ∩ V) ◁ R
⊢ S ◁ R ⊆ R
⊢ S ◁ R = Id S ⨾ R
⊢ V ◁ (Q ⊕ R) = (V ◁ Q) ⊕ (V ◁ R)
⊢ a ⊕ a = a
⊢ r ⨾ (a ∪ b) = (r ⨾ a) ∪ (r ⨾ b)
⊢ x ∈ Dom r ⇔ ∃ y⦁ (x, y) ∈ r
⊢ x ∈ Dom(Insert (y, z) a) ⇔ (x = y ∨ x ∈ Dom a)
⊢ x ∈ Ran(Insert (y, z) a) ⇔ (x = z ∨ x ∈ Ran a)
⊢ y ∈ R Image S ⇔ (∃ x ⦁ x ∈ S ∧ (x, y) ∈ R)
⊢ y ∈ Ran r ⇔ ∃ x⦁ (x, y) ∈ r




=TEX

\subsection{Signature of the theory ``$bin\_rel$''}
=DOC
signature ⦏BinRelTheory⦎ = sig
	val ⦏↦_def⦎ : THM;
	val ⦏×_def⦎ : THM;
	val ⦏↔_def⦎ : THM;
	val ⦏dom_def⦎ : THM;
	val ⦏ran_def⦎ : THM;
	val ⦏id_def⦎ : THM;
	val ⦏⨾_def⦎ : THM;
	val ⦏r_⨾_r_def⦎ : THM;
	val ⦏r_o_r_def⦎ : THM;
	val ⦏◁_def⦎ : THM;
	val ⦏▷_def⦎ : THM;
	val ⦏⩤_def⦎ : THM;
	val ⦏⩥_def⦎ : THM;
	val ⦏graph_def⦎ : THM;
	val ⦏inv_rel_def⦎ : THM;
	val ⦏image_def⦎ : THM;
	val ⦏⊕_def⦎ : THM;
	val ⦏reflexive_def⦎ : THM;
	val ⦏symmetric_def⦎ : THM;
	val ⦏transitive_def⦎ : THM;
	val ⦏injective_def⦎ : THM;
	val ⦏surjective_def⦎ : THM;
	val ⦏total_def⦎ : THM;
	val ⦏functional_def⦎ : THM;
	val ⦏tc_def⦎ : THM;
	val ⦏rtc_def⦎ : THM;
	val ⦏rel_combine_def⦎ : THM;
	val ⦏rel_∈_in_clauses⦎ : THM;
	val ⦏bin_rel_ext_clauses⦎ : THM;
	val ⦏inv_rel_thm⦎ : THM;
	val ⦏bin_rel_∅_universe_thm⦎ : THM;
	val ⦏bin_rel_insert_thm⦎ : THM;
=DESCRIBE
This is the signature in which we declare theory ``$bin\_rel$''.
=ENDDOC

\section{PROOF CONTEXTS}
=DOC
(* Proof context key ⦏"'bin_rel"⦎ *)
=DESCRIBE
A component proof context for theory $bin\_rel$, ``aggressively''
converting problems involving the vocabulary of the theory $bin\_rel$ into
that of the theory $sets$.

\paragraph{Contents}

Rewriting:
=INLINEFT
rel_∈_in_clauses, inv_rel_thm
=TEX
\ and the definitions of the constants defined in the theory $bin\_rel$.
Stripping theorems:
=INLINEFT
rel_∈_in_clauses, inv_rel_thm
=TEX
(also pushed in through `¬').


Stripping conclusions:
=INLINEFT
rel_∈_in_clauses, inv_rel_thm
=TEX
(also pushed in through `¬').

=TEX
Automatic proof procedures are $basic\-\_prove\-\_tac$ and
$basic\-\_prove\-\_conv$.

\paragraph{Usage Notes}
Should not be used in conjunction with component proof context
``$'sets\_ext$'', or with a complete proof context which includes it.
Requires theories $bin\_rel$ and $sets$.
Intended for use in conjunction with a proof context such
as $sets\_alg$ or $sets\_ext$ which is capable of solving the
resulting set-theoretic conjectures.
=ENDDOC

=SML
end;(* of signature BinRelTheory *)
=TEX

\section{TEST POLICY}

Any functions given in this document should be tested according to the
general criteria set out in~\cite{DS/FMU/IED/PLN008} using the tests
in~\cite{DS/FMU/IED/MDT071}.  In~\cite{DS/FMU/IED/MDT071} the theory
produced is checked by the theory design tools
of~\cite{DS/FMU/IED/DTD035} against the theory design provided.

The module tests should include automatic proof of as many as possible
of the ``rules''
in~\cite{Spivey92} expressible in this part of the theory of
relations.  The tests will include specific proofs of the remainder.

Using the proof context formed as below, most of the rules on pages~96
to~102 of~\cite{Spivey92} are automatically proven.  Half of the
remainder can be solved by rewriting the goal with an equality from an
assumption then application of $strip\_tac$ or $prove\_tac$. {} The
others (seven in total) require some existence proofs.

\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}


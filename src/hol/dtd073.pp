=IGN
********************************************************************************
dtd073.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  $Id: dtd073.doc,v 1.14 2004/11/03 15:07:25 rda Exp rda $ ℤ
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

\def\Title{Detailed Design for the Theory of Finite Sets}

\def\AbstractText{This document gives a detailed design for the theory of finite sets.}

\def\Reference{DS/FMU/IED/DTD073}

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
%% LaTeX2e port: \TPPproject{FST Project}  %% Mandatory field
%% LaTeX2e port: \TPPtitle{Detailed Design for the Theory of Finite Sets}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Detailed Design for the Theory of\cr
%% LaTeX2e port: Finite Sets}
%% LaTeX2e port: \TPPref{DS/FMU/IED/DTD073}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.14 $ %
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \def\SCCSdate{\FormatDate{$Date: 2004/11/03 15:07:25 $ %
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPdate{\SCCSdate}  %% Mandatory field
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{R.B.Jones & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{R.D. Arthan & WIN01\\K. Blackburn & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D. Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document gives a detailed design for the
%% LaTeX2e port: theory of finite sets.}
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
%% LaTeX2e port: \begin{centering}
%% LaTeX2e port: \bf Copyright \copyright\ : Lemma 1 Ltd. 1992
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
\item[Issue 1.1 (1992/05/11)-1.5 (1992/06/17)]

These are the first drafts of the document.
\item[Issue 1.6 (1992/08/26) (15th December 1992)]
Fixed theory design.
\item[Issue 1.7 (1992/12/15)]
Fix for SML'97.
\item[Issue 1.8 (1999/02/12)]
Proved consistency of {\it Max} and {\it Min}.
\item[Issue 1.10 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.11 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.12 (2003/09/30)] Added finite set induction (theorem and tactic) and added some basic theorems about finiteness.
\item[Issues 1.13 (2004/11/02),1.14 (2004/11/03)] Added theorems about sizes of finite sets.
\item[Issues 1.15 (2005/12/16)] Added in more theorems from the maths case studies.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}

Should be changed to use integers instead of natural numbers when these are available.

\section{GENERAL}
\subsection{Scope}
This document contains a detailed design
for the theory ``finset''.
The design is implemented in \cite{DS/FMU/IED/IMP073}.

\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains the detailed design for the theory ``relation''.

\subsubsection{Dependencies}
This document depends on \cite{DS/FMU/IED/IMP072}, and the theory design tools of \cite{DS/FMU/IED/DTD035}.
\subsubsection{Deficiencies}
None known.
\subsubsection{Possible Enhancements}
\section{THE THEORY ``$fin\_set$''}
\subsection{Preamble}
=THDOC
set_flag("tc_thms_only", true);
=DESCRIBE
We set the theorem check only flag since the definitions in the theory are
to be made via constant specification boxes.
=ENDDOC
=THDOC
req_name ⦏"fin_set"⦎ (Value "seq");
=DESCRIBE
The theory ``fin\_set'' contains the definitions of various functional (i.e. many-one) subsets of the set of finite sets.
=ENDDOC
=SML
val _ = open_theory "seq";
val _ = push_pc "hol";
val _ = new_theory "fin_set";
=TEX
\subsection{The Theory Contents}
ⓈHOLCONST
│	$⦏ℕ⦎: ℕ ℙ
├───────────────────
│	ℕ = Universe
│
■
ⓈHOLCONST
│	⦏Finite⦎:'a ℙ ℙ
├───────────────────
│	Finite = ⋂{u | {} ∈ u ∧ ∀a x⦁a ∈ u ⇒ ({x} ∪ a) ∈ u}
│
■
ⓈHOLCONST
│	⦏𝔽⦎:'a ℙ → 'a ℙ ℙ
├───────────────────
│	∀ (x : 'a ℙ)⦁ 𝔽 x = ℙ x ∩ Finite
│
■
ⓈHOLCONST
│	⦏𝔽⋎1⦎:'a ℙ → 'a ℙ ℙ
├───────────────────
│	∀ (x : 'a ℙ)⦁ 𝔽⋎1 x = 𝔽 x \ {{}}
■
ⓈHOLCONST
│	⦏Min⦎ : ℕ SET → ℕ
├
│	∀m a⦁m ∈ a ∧ (∀i⦁i ∈ a ⇒ m ≤ i) ⇒ Min a = m
■
ⓈHOLCONST
│	$⦏Max⦎:ℕ ℙ → ℕ
├───────────────────
│	∀m a⦁m ∈ a ∧ (∀i⦁i ∈ a ⇒ i ≤ m) ⇒ Max a = m
■
ⓈHOLCONST
	⦏Size⦎ : 'a SET → ℕ
├
	∀a⦁Size a = Min {i | ∃list⦁ Length list = i ∧ Elems list = a}
■
=SML
val _ = declare_alias(⦏"#"⦎, ⌜Size⌝);
ⓈHOLCONST
│	$⦏Iter⦎:ℕ → ('a ↔ 'a) → ('a ↔ 'a)
├───────────────────
│	∀ (r : 'a ↔ 'a)(n : ℕ)
│	⦁ Iter 0 r = Id Universe
│	∧ Iter (n+1) r = r ⨾ (Iter n r)
■
=SML
val _ = declare_infix(240,"⇻");
ⓈHOLCONST
│	$⦏⇻⦎:'a ℙ → 'b ℙ → ('a ↔ 'b) ℙ
├───────────────────
│	∀ a : 'a ℙ; b : 'b ℙ
│	⦁ a ⇻ b = (a ⇸ b) ∩ Finite
■
=SML
val _ = declare_infix(240,"⤕");
ⓈHOLCONST
│	$⦏⤕⦎:'a ℙ → 'b ℙ → ('a ↔ 'b) ℙ
├───────────────────
│	∀ a : 'a ℙ; b : 'b ℙ
│	⦁ a ⤕ b = (a ⇻ b) ∩ (a ⤔ b)	
■
\subsection{Theorems}
=THDOC
req_consistency_thm⌜Min⌝;
=DESCRIBE
This theorem demonstrates the consistency of the definition of
the {\it Min} function.
=ENDDOC
=THDOC
req_consistency_thm⌜Max⌝;
=DESCRIBE
This theorem demonstrates the consistency of the definition of
application of the {\it Max}.
=ENDDOC
=THDOC
req_thm("finite_induction_thm", ([], ⌜
		∀p⦁	p {} ∧ (∀a x⦁a ∈ Finite ∧ p a ∧ ¬x ∈ a ⇒ p({x} ∪ a))
		⇒ 	∀a⦁a ∈ Finite ⇒ p a
⌝));
=DESCRIBE
The principle of induction for finite sets.
=ENDDOC
=THDOC
req_thm("empty_finite_thm", ([],
	⌜{} ∈ Finite⌝));
req_thm("singleton_∪_finite_thm", ([],
	⌜∀ a x⦁ a ∈ Finite ⇒ ({x} ∪ a) ∈ Finite⌝));
req_thm("⊆_finite_thm", ([],
	⌜∀a b⦁ a ∈ Finite ∧ b ⊆ a ⇒ b ∈ Finite⌝));
req_thm("∪_finite_thm", ([],
	⌜∀ a b⦁a ∪ b ∈ Finite ⇔ a ∈ Finite ∧ b ∈ Finite⌝));
req_thm("∩_finite_thm", ([],
	⌜∀ a b⦁ a ∈ Finite ∨ b ∈ Finite ⇒ a ∩ b ∈ Finite⌝));
req_thm("finite_distinct_elems_thm", ([],
	⌜∀ a⦁ a ∈ Finite ⇒ (∃ list⦁ list ∈ Distinct ∧ Elems list = a)⌝));
req_thm("length_↾_≤_thm", ([],
	⌜∀ list a⦁ # (list ↾ a) ≤ # list⌝));
req_thm("length_↾_less_thm", ([],
	⌜∀ list a⦁ ¬ Elems list \ a = {} ⇒ # (list ↾ a) < # list⌝));
req_thm("elems_↾_thm", ([],
	⌜∀ list a⦁ Elems (list ↾ a) = Elems list ∩ a⌝));
req_thm("distinct_length_≤_thm", ([],
	⌜∀ list1 list2 ⦁ list1 ∈ Distinct ∧ Elems list1 = Elems list2 ⇒ # list1 ≤ # list2⌝));
req_thm("distinct_size_length_thm", ([],
	⌜∀ list a⦁ list ∈ Distinct ∧ Elems list = a ⇒ # a = # list⌝));
req_thm("size_empty_thm", ([],
	⌜# {} = 0⌝));
req_thm("size_singleton_∪_thm", ([],
	⌜∀ x a⦁ a ∈ Finite ∧ ¬ x ∈ a ⇒ # ({x} ∪ a) = # a + 1⌝));
req_thm("size_singleton_thm", ([],
	⌜∀ x⦁ # {x} = 1⌝));
req_thm("size_∪_thm", ([],
	⌜∀ a b ⦁ a ∈ Finite ∧ b ∈ Finite ⇒ # (a ∪ b) + # (a ∩ b) = # a + # b⌝));
req_thm("size_0_thm", ([],
	⌜∀ a⦁ a ∈ Finite ⇒ (# a = 0 ⇔ a = {})⌝));
req_thm("size_1_thm", ([],
	⌜∀ a⦁ a ∈ Finite ⇒ (# a = 1 ⇔ (∃ x⦁ a = {x}))⌝));
req_thm("⋃_finite_thm", ([],
	⌜∀ u⦁ u ∈ Finite ∧ u ⊆ Finite ⇒ ⋃ u ∈ Finite⌝));
req_thm("pigeon_hole_thm", ([],
	⌜∀ u ⦁ u ∈ Finite ∧ u ⊆ Finite ∧ # u < # (⋃ u) ⇒ (∃ a⦁ a ∈ u ∧ # a > 1)⌝));
req_thm("⊆_size_≤_thm", ([],
	⌜∀ a b⦁ a ∈ Finite ∧ b ⊆ a ⇒ # b ≤ # a⌝));
req_thm("⊆_size_less_thm", ([],
	⌜∀ a b⦁ a ∈ Finite ∧ b ⊆ a ∧ ¬b = a ⇒ # b < # a⌝));
req_thm("min_∈_thm", ([],
	⌜∀ n a⦁ n ∈ a ⇒ Min a ∈ a⌝));
req_thm("min_≤_thm", ([],
	⌜∀ n a⦁ n ∈ a ⇒ Min a ≤ n⌝));
req_thm("max_∈_thm", ([],
	⌜∀ m n a⦁ (∀ i⦁ i ∈ a ⇒ i ≤ m) ∧ n ∈ a ⇒ Max a ∈ a⌝));
req_thm("≤_max_thm", ([],
	⌜∀ m n a⦁ (∀ i⦁ i ∈ a ⇒ i ≤ m) ∧ n ∈ a ⇒ n ≤ Max a⌝));
req_thm("finite_⊆_well_founded_thm", ([],
	⌜∀ p a⦁ a ∈ Finite ∧ p a ⇒ (∃ b⦁ b ⊆ a ∧ p b ∧ (∀ c⦁ c ⊆ b ∧ p c ⇒ c = b))⌝));
=DESCRIBE
Basic facts about finite sets and their sizes.
=ENDDOC
\subsection{Signature of the theory ``finset''}
=DOC
signature ⦏FinSetTheory⦎ = sig
	val ⦏ℕ_def⦎ : THM;				val ⦏finite_def⦎ : THM;
	val ⦏𝔽_def⦎ : THM;				val ⦏𝔽⋎1_def⦎ : THM;
	val ⦏min_def⦎ : THM;				val ⦏max_def⦎ : THM;
	val ⦏size_def⦎ : THM;				val ⦏iter_def⦎ : THM;
	val ⦏⇻_def⦎ : THM;				val ⦏⤕_def⦎ : THM;
	val ⦏finite_induction_thm⦎ : THM;		val ⦏empty_finite_thm⦎ : THM;
	val ⦏singleton_∪_finite_thm⦎ : THM;	val ⦏⊆_finite_thm⦎ : THM;
	val ⦏∪_finite_thm⦎ : THM;			val ⦏∩_finite_thm⦎ : THM;
	val ⦏finite_distinct_elems_thm⦎ : THM;	val ⦏length_↾_≤_thm⦎ : THM;
	val ⦏length_↾_less_thm⦎ : THM;		val ⦏elems_↾_thm⦎ : THM;
	val ⦏distinct_length_≤_thm⦎ : THM;	val ⦏distinct_size_length_thm⦎ : THM;
	val ⦏size_empty_thm⦎ : THM;		val ⦏size_singleton_∪_thm⦎ : THM;
	val ⦏size_singleton_thm⦎ : THM;		val ⦏size_∪_thm⦎ : THM;
	val ⦏size_0_thm⦎ : THM;			val ⦏size_1_thm⦎ : THM;
	val ⦏⋃_finite_thm⦎ : THM;			val ⦏pigeon_hole_thm⦎ : THM;
	val ⦏⊆_size_≤_thm⦎ : THM;			val ⦏⊆_size_less_thm⦎ : THM;
	val ⦏min_∈_thm⦎ : THM;			val ⦏min_≤_thm⦎ : THM;
	val ⦏max_∈_thm⦎ : THM;			val ⦏≤_max_thm⦎ : THM;
	val ⦏finite_⊆_well_founded_thm⦎ : THM
=DESCRIBE
These are the ML bindings for the definitions and theorems in the  declare theory ``$fin\_set$''.
=ENDDOC
=DOC
	val ⦏finite_induction_tac⦎ : TERM -> TACTIC;
=DESCRIBE
An induction tactic for finite sets.  To prove
=INLINEFT
t
=TEX
\ on the assumption that
=INLINEFT
s ∈ Finite
=TEX
, it suffices to prove
=INLINEFT
t[{}/s]
=TEX
\ and to prove
=INLINEFT
t[({x} ∪ s)/s]
=TEX
\ on the
assumption that $t$ holds, that
=INLINEFT
s ∈ Finite
=TEX
,
=TEX
\ and that
=INLINEFT
¬x ∈ s
=TEX
.  The term argument must be a variable, $s$,
with type an instance of ⓣ'a SET⌝ and must appear free in the conclusion of the goal.
It must also appear once, and only once, in an assumption of the form
=INLINEFT
s ∈ Finite
=TEX
.
=FRULE 2 Tactic
finite_induction_tac ⓩs⌝
├
{ Γ, s ∈ Finite} t[s]
├
{ Γ } t[{}/s] ;
strip {t, s ∈ Finite, ¬x ∈ s, Γ} t[({x}∪ s)/s]
=TEX
=FAILURE
73001	?0 is not a variable
73002	A term of the form ⓩv ∈ Finite⌝ where v is the induction variable
	could not be found in the assumptions
73003	?0 does not appear free in the conclusion of the goal
73004	?0 appears free in more than one assumption of the goal
=ENDDOC
=SML
end;(* of signature FinSetTheory *)
=TEX
\section{TEST POLICY}
Any functions given in this document should be tested according to the general criteria set out in \cite{DS/FMU/IED/PLN008}, using the tests in \cite{DS/FMU/IED/MDT072}.
In \cite{DS/FMU/IED/MDT072} the theory produced is checked by the theory design tools of \cite{DS/FMU/IED/DTD035}, against the theory design provided.

The module tests should include automatic proof of all the ``rules'' in \cite{Spivey89} expressible in this part of the theory of functional relations.
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}




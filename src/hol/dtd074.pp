=IGN
********************************************************************************
dtd074.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  ℤ $Date: 2002/10/17 16:20:01 $ $Revision: 1.8 $ $RCSfile: dtd074.doc,v $
=TEX
%%%%% YOU MAY WANT TO CHANGE POINT SIZE IN THE FOLLOWING:
\documentclass[a4paper,12pt]{article}

%%%%% YOU CAN ADD OTHER PACKAGES AS NEEDED BELOW:
\usepackage{A4}
\usepackage{Lemma1}
\usepackage{ProofPower}
\usepackage{epsf}
\makeindex

%%%%% YOU WILL WANT TO CHANGE THE FOLLOWING TO SUIT YOU AND YOUR DOCUMENT:

\def\Title{ Detailed Design for the Theory of Sequences }

\def\Abstract{\begin{center}
{\bf Abstract}\par\parbox{0.7\hsize}
{\small This document gives a detailed design for the theory of seqiemces.}
\end{center}}

\def\Reference{DS/FMU/IED/DTD074}

\def\Author{R.B.Jones}

\def\EMail{{\tt rbj@rbjones.com}}

\def\Phone{Via +44 7947 030 682}


%%%%% YOU MAY WANT TO CHANGE THE FOLLOWING TO GET A NICE FRONT PAGE:
\def\FrontPageTitle{ {\huge \Title } }
\def\FrontPageHeader{\raisebox{16ex}{\begin{tabular}[t]{c}
\bf Copyright \copyright\ : Lemma 1 Ltd \number\year\\\strut\\
\end{tabular}}}
\begin{centering}



\end{centering}

%%%%% THE FOLLOWING DEFAULTS WILL GENERALLY BE RIGHT:

\def\Version{\VCVersion}
\def\Date{\FormatDate{\VCDate}}

%%%%% NOW BEGIN THE DOCUMENT AND MAKE THE FRONT PAGE

%% LaTeX2e PORT \documentstyle[hol1,11pt,TQ]{article}
%% LaTeX2e PORT \ftlinepenalty=9999
%% LaTeX2e PORT \makeindex
%% LaTeX2e PORT \TPPproject{FST Project}  %% Mandatory field
%% LaTeX2e PORT \TPPtitle{Detailed Design for the Theory of Sequences}  %% Mandatory field
%% LaTeX2e PORT \def\TPPheadtitle{Detailed Design for the Theory of\cr
%% LaTeX2e PORT Sequences}
%% LaTeX2e PORT \TPPref{DS/FMU/IED/DTD074}  %% Mandatory field
%% LaTeX2e PORT \def\SCCSversion{$Revision: 1.8 $%
%% LaTeX2e PORT }
%% LaTeX2e PORT \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e PORT \def\SCCSdate{\FormatDate{$Date: 2002/10/17 16:20:01 $%
%% LaTeX2e PORT }}
%% LaTeX2e PORT \TPPdate{\SCCSdate}  %% Mandatory field
%% LaTeX2e PORT \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e PORT \TPPtype{SML Literate Script}
%% LaTeX2e PORT \TPPkeywords{}
%% LaTeX2e PORT \TPPauthor{R.B.Jones & WIN01}  %% Mandatory field
%% LaTeX2e PORT %\TPPauthors{R.D. Arthan & WIN01\\K. Blackburn & WIN01}
%% LaTeX2e PORT \TPPauthorisation{R.D. Arthan & FST Team Leader}
%% LaTeX2e PORT \TPPabstract{This document gives a detailed design for the
%% LaTeX2e PORT theory of relations.}
%% LaTeX2e PORT \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e PORT 	    Library
%% LaTeX2e PORT }}
%% LaTeX2e PORT %\TPPclass{CLASSIFICATION}
%% LaTeX2e PORT %\def\TPPheadlhs{}
%% LaTeX2e PORT %\def\TPPheadcentre{}
%% LaTeX2e PORT %def\TPPheadrhs{}
%% LaTeX2e PORT %\def\TPPfootlhs{}
%% LaTeX2e PORT %\def\TPPfootcentre{}
%% LaTeX2e PORT %\def\TPPfootrhs{}

\begin{document}

\headsep=0mm
\FrontPage
\headsep=10mm

%% LaTeX2e PORT \makeTPPfrontpage
%% LaTeX2e PORT \vfill
%% LaTeX2e PORT \begin{centering}
%% LaTeX2e PORT \bf Copyright \copyright\ : Lemma 1 Ltd. 1992
%% LaTeX2e PORT \end{centering}
%% LaTeX2e PORT \pagebreak

\section{DOCUMENT CONTROL}
\subsection{Contents List}
\tableofcontents
\subsection{Document Cross References}
\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes History}
\begin{description}
\item[Issue 1.1]

This is the first draft of the document.

\item[Issue 1.7 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.8 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.9 (2005/05/07)] HOL now supports left-associative operators.
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
for the theory ``seq''.
The design is implemented in \cite{DS/FMU/IED/IMP074}.

\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains the detailed design for the theory ``relation''.

\subsubsection{Dependencies}
This document depends on \cite{DS/FMU/IED/IMP073}, and the theory design tools of \cite{DS/FMU/IED/DTD035}.
\subsubsection{Deficiencies}
None known.
\subsubsection{Possible Enhancements}
\section{THE THEORY ``seq''}
\subsection{Design of the theory ``seq''}
\subsubsection{Preamble}
=THDOC
set_flag("tc_thms_only", true);
=DESCRIBE
We set the theorem check only flag since the definitions in the theory are
to be made via constant specification boxes.
=ENDDOC
=THDOC
req_name ⦏"seq"⦎ (Value "fun_rel");
=DESCRIBE
The theory ``seq'' contains the definitions of analogues
of some of the elements in section 4.4 of \cite{spivey88}.
=ENDDOC
=SML
val _ = open_theory "fun_rel";
val _ = push_pc "hol";
val _ = new_theory "seq";
=TEX
\subsection{The Theory Contents}
=SML
val _ = declare_alias(⦏"#"⦎,⌜Length⌝);
ⓈHOLCONST
	⦏Elems⦎ : 'a LIST → 'a SET
├
	Elems [] = {}
∧ ∀x l⦁
	Elems (Cons x l) = {x} ∪ Elems l
■
ⓈHOLCONST
	⦏Distinct⦎ : 'a LIST SET
├
	[] ∈ Distinct
∧	∀x l⦁ (Cons x l) ∈ Distinct ⇔ ¬x ∈ Elems l ∧ l ∈ Distinct
■
ⓈHOLCONST
│	$⦏Lists⦎:'a ℙ → 'a LIST ℙ
├───────────────────
│	∀ (a : 'a ℙ) ⦁ Lists a = {l | Elems l ⊆ a}
│
■
ⓈHOLCONST
│	$⦏Lists⋎1⦎: 'a ℙ → 'a LIST ℙ
├───────────────────
│	∀ (a : 'a ℙ)⦁ Lists⋎1 a = Lists a \ {[]}
■
ⓈHOLCONST
│	⦏InjLists⦎:'a ℙ → 'a LIST ℙ
├───────────────────
│	∀ (a : 'a ℙ)⦁ InjLists a = Lists a ∩ Distinct
■
ⓈHOLCONST
│	⦏Nth⦎:'a LIST → ℕ → 'a
├───────────────────
│	∀ (l : 'a LIST) (x : 'a) (n : ℕ)⦁
│	Nth (Cons x l) n
│	=	if n = 1
│		then x
│		else Nth l (n-1)
■
=SML
val _ = declare_infix (290, "..");
ⓈHOLCONST
│	$⦏..⦎: ℕ → ℕ → ℕ ℙ
├───────────────────
│	∀ m n : ℕ⦁
│		m .. n = {i | m ≤ i ∧ i ≤ n}
■
ⓈHOLCONST
│	⦏ListRel⦎:'a LIST → (ℕ ↔ 'a)
├───────────────────
│	∀ (l : 'a LIST)⦁
│		ListRel l = 1 .. Length l ◁ (Graph(Nth l))
■
ⓈHOLCONST
│	⦏RelList⦎:(ℕ ↔ 'a) → 'a LIST
├───────────────────
│	∀ (l : 'a LIST)⦁ RelList (ListRel l) = l
■
=SML
val _ = declare_infix(300,"⁀");
val _ = declare_alias(⦏"⁀"⦎,⌜$@:'a LIST → 'a LIST → 'a LIST⌝);
val _ = declare_alias(⦏"Head"⦎,⌜Hd⌝);
ⓈHOLCONST
│	⦏Last⦎:'a LIST → 'a
├───────────────────
│	∀x l ⦁  Last (Cons x l) =
│	if l = [] then x else Last l	
■
ⓈHOLCONST
│	⦏Front⦎:'a LIST → 'a LIST
├───────────────────
│	∀x l ⦁  Front (Cons x l) =
│	if l = [] then [] else (Cons x (Front l))	
■
=SML
val _ = declare_left_infix(300,"↾");
ⓈHOLCONST
│	$⦏↾⦎:'a LIST → 'a ℙ → 'a LIST
├───────────────────
│	∀a x l ⦁ [] ↾ a = []
│	∧ (Cons x l) ↾ a  =
│	if x ∈ a then Cons x (l ↾ a) else l ↾ a	
■
=SML
val _ = declare_alias(⦏"Tail"⦎,⌜Tl⌝);
=TEX
The definition of $Enumerate$, could be made slicker if we had the theory
of finite sets. The following definition is intended to be reasonably compatible
with the intended development of that theory.

ⓈHOLCONST
│	⦏Enumerate⦎: ℕ ℙ → (ℕ ↔ ℕ)
├───────────────────
│	∀ a:ℕ ℙ ⦁
│	Enumerate a =
│	{ (i, j) | ∃l⦁	j ∈ a
│		∧	l ∈ Distinct
│		∧	Length l = i
│		∧	Elems l = a ∩ 0 .. j }
■
ⓈHOLCONST
│	⦏Squash⦎:(ℕ ↔ 'a) → (ℕ ↔ 'a)
├───────────────────
│	∀ r:ℕ ↔ 'a ⦁ Squash r = Enumerate (Dom r) ⨾ r
■
ⓈHOLCONST
│	⦏Extract⦎:ℕ ℙ → 'a LIST → 'a LIST
├───────────────────
│	∀ a l ⦁
│	Extract a l = RelList (Squash (a ◁ (ListRel l)))	
■
=TEX
An alternative for the next three would be to define the functions
associating with a list the set of its prefixes, suffixes or sublists.
=SML
val _ = declare_infix(300,"Prefix");
ⓈHOLCONST
│	$⦏Prefix⦎:'a LIST → 'a LIST → BOOL
├───────────────────
│	∀ s t ⦁ s Prefix t ⇔ (∃ v ⦁ s ⁀ v = t)	
■
=SML
val _ = declare_infix(300,"Suffix");
ⓈHOLCONST
│	$⦏Suffix⦎:'a LIST → 'a LIST → BOOL
├───────────────────
│	∀ s t ⦁ s Suffix t ⇔ (∃ u ⦁ u ⁀ s = t)	
■
=SML
val _ = declare_infix(300,"In");
ⓈHOLCONST
│	$⦏In⦎:'a LIST → 'a LIST → BOOL
├───────────────────
│	∀ s t ⦁ s In t ⇔ (∃ u v ⦁ u ⁀ s ⁀ v = t)	
■
ⓈHOLCONST
│	⦏Flat⦎:'a LIST LIST → 'a LIST
├───────────────────
│	∀ (e: 'a LIST) (l: 'a LIST LIST) ⦁ Flat [] = []
│	∧ Flat (Cons e l) = e ⁀ (Flat l)	
■

=TEX
\subsection{Signature of the theory ``seq''}
=DOC
signature ⦏SeqTheory⦎ = sig
	val ⦏elems_def⦎ : THM;
	val ⦏distinct_def⦎ : THM;
	val ⦏lists_def⦎ : THM;
	val ⦏lists⋎1_def⦎ : THM;
	val ⦏inj_lists_def⦎ : THM;
	val ⦏nth_def⦎ : THM;
	val ⦏dot_dot_def⦎ : THM;
	val ⦏list_rel_def⦎ : THM;
	val ⦏rel_list_def⦎ : THM;
	val ⦏⁀_def⦎ : THM;
	val ⦏head_def⦎ : THM;
	val ⦏last_def⦎ : THM;
	val ⦏front_def⦎ : THM;
	val ⦏tail_def⦎ : THM;
	val ⦏↾_def⦎ : THM;
	val ⦏enumerate_def⦎ : THM;
	val ⦏squash_def⦎ : THM;
	val ⦏extract_def⦎ : THM;
	val ⦏prefix_def⦎ : THM;
	val ⦏suffix_def⦎ : THM;
	val ⦏in_def⦎ : THM;
	val ⦏flat_def⦎ : THM;
=DESCRIBE
This is the signature in which we declare theory ``funrel''.
=ENDDOC
\section{PROOF CONTEXTS}
=DOC
(* proof context key "⦏seq_ext⦎" *)
=DESCRIBE
$seq\_ext$ extends $finset_ext$ by:
\begin{description}
\item [Name]\

Becomes ``finset$\_$ext''.
\item [Stripping Goals and Theorems]\

Adding in ? applied at the top level or under a single negation.
\item [Rewriting Context]\

Adding in ?.
\end{description}
=ENDDOC
=DOC
(* proof context key ⦏"funrel_alg"⦎ *)
=DESCRIBE
$finset\_alg$ extends $funrel\_alg$ by:
\begin{description}
\item [Name]\

Becomes ``finset$\_$alg''.
\item [Stripping Goals and Theorems]\

Adding in ? applied at the top level or under a single negation.
\item [Rewriting Context]\

Adding in ?.
\end{description}
=ENDDOC
=SML
end;(* of signature SeqTheory *)
=TEX
\section{TEST POLICY}
Any functions given in this document should be tested according to the general criteria set out in \cite{DS/FMU/IED/PLN008}, using the tests in \cite{DS/FMU/IED/MDT074}.
In \cite{DS/FMU/IED/MDT074} the theory produced is checked by the theory design tools of \cite{DS/FMU/IED/DTD035}, against the theory design provided.

The module tests should include automatic proof of all the ``rules'' in \cite{Spivey89} expressible in this part of the theory of sequences.
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}




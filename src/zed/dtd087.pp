=IGN
********************************************************************************
dtd087.doc: this file is part of the PPZed system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  dtd087.doc  ℤ $Date: 2006/02/08 10:21:01 $ $Revision: 1.14 $ $RCSfile: dtd087.doc,v $
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

\def\Title{Detailed Design of the Z Library Sequences}

\def\AbstractText{This document contains the detailed design of the Z Library Sequences and their proof support.}

\def\Reference{DS/FMU/IED/DTD087}

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
%% LaTeX2e port: \TPPtitle{Detailed Design of the Z Library Sequences}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/DTD087}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.14 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2006/02/08 10:21:01 $%
%% LaTeX2e port: }}
%% LaTeX2e port: %\TPPstatus{Approved}
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: %\TPPauthor{D.J.~King & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthors{D.J.~King & WIN01\\K.~Blackburn & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document contains the detailed design of
%% LaTeX2e port: the Z Library Sequences and their proof support.}
%% LaTeX2e port: %\TPPabstractB{}
%% LaTeX2e port: %\TPPabstractC{}
%% LaTeX2e port: %\TPPabstractD{}
%% LaTeX2e port: %\TPPabstractE{}
%% LaTeX2e port: %\TPPabstractF{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port:       Project Library}}
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
\item [Issue 1.1 (1992/10/28) (22nd October 1992)]
First version, derived from 078 and 083.
\item [Issue 1.2 (1992/10/30),1.3 (1992/10/30) (30th October 1992)]
Tidying.
\item [Issue 1.4 (1992/11/12), 12th November 1992]
Changes as a consequence of changes in dependences.
\item[Issue 1.5 (1992/12/11) (11th December 1992)]
Global rename from wrk038.doc issue 1.9.
\item[Issue 1.6 (1992/12/17) (17th December 1992)]
Remove spurious ML bindings.
\item[Issue 1.7 (1993/12/06) (6th December 19930]
Bug fixing in definition of rev.
\item[Issue 1.8 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.9 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.10 (2004/01/19)] The Z universal set is now called 𝕌.
\item[Issue 1.11 (2004/02/02)] Addressed comments on USR030 from QinetiQ.
\item[Issue 1.12 (2005/02/26)] Precedences and associativity of toolkit operators now follow \cite{ISO02}.
\item[Issue 1.13 (2005/12/06)] Brought in line with \cite{ISO02} (aded squash and extraction and redefined filtering using squash).
\item[Issue 1.14 (2006/02/08)] Corrected precedence of {\em seq\_} etc.
\item[Issue 1.15 (2011/08/05)] Added ISO Z compatible alias for distributed concatenation.
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
of the Z Library Sequences.
The high level design for this material is given in \cite{DS/FMU/IED/HLD017}.
\subsection{Introduction}

\subsection{Purpose and Background}
See \cite{DS/FMU/IED/HLD017}.
\subsection{Dependencies}
Loading this document and its implementation relies on having loaded
\cite{DS/FMU/IED/IMP086}.
\subsection{Possible Enhancements}
None known.
\subsection{Deficiencies}
None known.
\section{PROLOG}

=SML
open_theory"z_numbers";
push_pc "z_sets_alg";
delete_theory"z_sequences" handle Fail _ => ();
val _ = set_flag ("z_type_check_only", false);
val _ = set_flag ("z_use_axioms", true);
new_theory"z_sequences";
=TEX
\section {DEFINITION OF FIXITY}

The following fixity information is taken from \cite{ISO02}.
ⓈZ
function 30 leftassoc _ ⁀ _
■

ⓈZ
function 40 leftassoc _ ↾ _
■

ⓈZ
function 45 rightassoc _ ↿ _
■

ⓈZ
relation _ partition _, disjoint _
■
ⓈZ
gen 70 seq _, seq⋎1 _, iseq _
■

\section{SEQUENCES}

ⓈZ
⦏seq⦎ X ≜ {f:ℕ ⇻ X | dom f = 1  .. # f}
■

ⓈZ
⦏seq⋎1⦎ X ≜ {f:seq X | # f > 0}
■

ⓈZ
⦏iseq⦎ X ≜ (seq X) ∩ (ℕ ⤔ X)
■

\subsection{Concatenation}

╒[X]════════════════
│ _ ⦏⁀⦎ _ : (seq X) × (seq X) → seq X
├──────────────────
│ ∀ s, t : seq X ⦁ s ⁀ t = s ∪ {n : dom t | true ⦁ n + # s ↦ t(n)}
└────────────────────

\subsection{Sequence Decomposition}

╒[X]════════════════
│ ⦏head⦎ : seq⋎1 X → X
├──────────────────
│ ∀ s : seq⋎1 X ⦁ head s = s (1)
└────────────────────

╒[X]════════════════
│ ⦏last⦎ : seq⋎1 X → X
├──────────────────
│ ∀ s : seq⋎1 X ⦁ last s = s (# s)
└────────────────────

╒[X]════════════════
│ ⦏tail⦎ : seq⋎1 X → seq X
├──────────────────
│ ∀ s : seq⋎1 X ⦁
│	tail s = (λn : 1 .. (# s - 1) ⦁ s(n + 1))
└────────────────────

╒[X]════════════════
│ ⦏front⦎:seq⋎1 X → seq X
├──────────────────
│∀ s : seq⋎1 X ⦁
│	front s = (1  .. (# s - 1)) ◁ s
└────────────────────

\subsection{Reverse}

╒[X]════════════════
│ ⦏rev⦎ : seq X → seq X
├──────────────────
│ ∀ s : seq X ⦁
│	rev s = (λn:dom s ⦁ s((# s - n) + 1))
└────────────────────

\subsection{Squash}

╒[X]════════════════
│ ⦏squash⦎ : (ℤ ⇻ X) → seq X
├──────────────────
│ ∀ f : ℤ ⇻ X ⦁
│	squash f = { p : f ⦁ #{i : dom f | i ≤ p.1} ↦ p.2 }
└────────────────────

\subsection{Extraction}

╒[X]════════════════
│ _ ⦏↿⦎ _ : ℙ ℤ × (seq X) → seq X
├──────────────────
│ ∀ a : ℙ ℤ; s : seq X ⦁ a ↿ s = squash (a ◁ s)
└────────────────────

\subsection{Filtering}

╒[X]════════════════
│ _ ⦏↾⦎ _ : (seq X) × ℙ X → seq X
├──────────────────
│ ∀ s : seq X;  a : ℙ X ⦁ s ↾ a = squash(s ▷ a)
└────────────────────

\subsection{Distributed Concatenation}

╒[X]════════════════
│ ⦏⁀/⦎ : seq (seq X) → seq X
├──────────────────
│	⁀/ ⟨ ⟩ = ⟨ ⟩ ∧
│	(∀s:seq X ⦁ ⁀/ ⟨s⟩ = s) ∧
│	(∀q,r:seq(seq X) ⦁
│		⁀/(q ⁀ r) = (⁀/ q) ⁀ (⁀/ r))
└────────────────────

\subsection{Disjointness and Partitions}

╒[I,X]════════════════
│ ⦏disjoint⦎ _ : ℙ (I ⇸ ℙ X)
├──────────────────
│ ∀ S : I ⇸ ℙ X ⦁
│	(disjoint S ⇔
│		(∀ i , j : dom S | i ≠ j ⦁ S(i) ∩ S(j) = ∅))
└────────────────────

╒[I,X]════════════════
│ _ ⦏partition⦎ _ : (I ⇸ ℙ X) ↔ ℙ X
├──────────────────
│ ∀ S : I ⇸ ℙ X; T : ℙ X ⦁
│	(S partition T ⇔
│		disjoint S ∧ ⋃ {i : dom S | true ⦁ S(i)} = T)
└────────────────────
\section{START OF STRUCTURE}
=DOC
signature ⦏ZSequences⦎ = sig
=DESCRIBE
This provides the basic proof support for the Z library sequences.
It creates the theory $z\_sequences$.
=ENDDOC
=THDOC
req_name ⦏"z_sequences"⦎ (Value "z_numbers");
req_language "Z";
set_flag("tc_thms_only",true);
=DESCRIBE
The theory $z\_sequences$ contains various definitions of relation operators, and ``defining theorems'' of Z library constants derived from these definitions.
It is created in structure $ZSequences$.
=ENDDOC

=DOC
val ⦏z_seq_def⦎ : THM;
val ⦏z_seq⋎1_def⦎ : THM;
val ⦏z_iseq_def⦎ : THM;
val ⦏z_⁀_def⦎ : THM;
val ⦏z_head_def⦎ : THM;
val ⦏z_last_def⦎ : THM;
val ⦏z_tail_def⦎ : THM;
val ⦏z_front_def⦎ : THM;
val ⦏z_rev_def⦎ : THM;
val ⦏z_squash_def⦎ : THM;
val ⦏z_↿_def⦎ : THM;
val ⦏z_↾_def⦎ : THM;
val ⦏z_⁀_slash_def⦎ : THM;
val ⦏z_disjoint_def⦎ : THM;
val ⦏z_partition_def⦎ : THM;
=DESCRIBE
These are the ML bindings of the definitions of the theory of $z\_sequences$.
=ENDDOC

\section{EPILOGUE}
=SML
end (* of signature ZSequences *);
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


=IGN
delete_const ⌜$"z'_ ∪ _"⌝;

 ╒[X]════════════════
 │ _ ⦏∪⦎ _ : ℙ X × ℙ X → ℙ X
 ├──────────────────
 │∀ x  : ℙ X ⦁ x ∪ x = X
 └────────────────────

dest_Zapp ⓩ x ∪ x ⌝;
dest_app ⓩ x ∪ x ⌝;


=IGN
********************************************************************************
dtd083.doc: this file is part of the PPZed system

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

\def\Title{Detailed Design for the Z Library Relations}

\def\AbstractText{This document contains the detailed design for the proof support for the Z Library Relations.}

\def\Reference{DS/FMU/IED/DTD083}

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
%% LaTeX2e port: \documentstyle[hol1,11pt,TQ]{article}
%% LaTeX2e port: \ftlinepenalty=9999
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{FST PROJECT}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Detailed Design for the Z Library Relations}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/DTD083}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.19 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2005/08/11 12:13:04 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPclass{}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: % \TPPauthor{G.~Prout  & WIN01}  %% Mandatory field
%% LaTeX2e port: \TPPauthors{D.J.~King & WIN01\\K.~Blackburn & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document contains the detailed design for the
%% LaTeX2e port: proof support for the Z Library Relations.}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	Project Library}}
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

\item [Issue 1.1 (1992/10/19)]
First version, derived from \cite{DS/FMU/IED/DTD042}.
\item [Issue 1.2 (1992/10/20) (20th October 1992)]
Typo fixing.
\item [Issue 1.3 (1992/10/21) (21th October 1992)]
Added $z\_rel\_inv\_thm$ into appropriate proof context.
Added $z\-\_∈\-\_first\-\_thm$, $z\-\_∈\-\_second\-\_thm$.
\item [Issue 1.4 (1992/10/22) (22nd October 1992)]
Changed $z\_id\_thm$.
\item [Issue 1.5 (1992/10/28) (22nd October 1992)]
Change of name and nature to Z Library Relations.
\item [Issue 1.6 (1992/10/30) (30th October 1992)]
Tidying.
\item [Issue 1.7 (1992/11/12), 12th November 1992]
Changes as a consequence of changes in dependences.
\item[Issue 1.8 (1992/12/03) (3nd December 1992)]
Improved $𝕌$ simplification.
Added Z language proof contexts.
\item[Issue 1.9 (1992/12/08) (8th December 1992)]
Removed mention of ``$'$z$\_$schemas$\_$ext''.
\item[Issue 1.10 (1992/12/11) (11th December 1992)]
Global rename from wrk038.doc issue 1.9.
\item[Issue 1.11 (1992/12/17) (17th December 1992)]
Removed spurious ML bindings.
\item[Issue 1.12 (1993/02/10)-1.14 (1993/02/12) (5th-12th February 1993)]
Rearranging proof contexts.
\item[Issue 1.15 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.16 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.17 (2004/01/19)] The Z universal set is now called 𝕌.
\item[Issue 1.18 (2005/02/26)] Precedences and associativity of toolkit operators now follow \cite{ISO02}.
\item[Issue 1.25] Corrected {\em z\_dom\_clauses} and {\em z\_ran\_clauses}.
\item[Issue 1.26] Functional composition is now called ``∘''.
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
This document contains a detailed design for proof support for
the Z Library Relations, described in \cite{DS/FMU/IED/HLD015}.
This is called for in \cite{DS/FMU/IED/HLD016}.
The design is
implemented in \cite{DS/FMU/IED/IMP083}.

\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains a detailed design for the
initial set of proof support for
the Z Library.
\subsubsection{Dependencies}
Loading this document and its implementation is dependent on
the Z Library Sets, \cite{DS/FMU/IED/IMP078}.
\subsubsection{Deficiencies}
Perhaps ought to use theory check mechanisms.
\section{LANGUAGE OVERLAP BETWEEN Z AND HOL}\label{ZCAVEAT}
Many of the functions below that generate results involving terms
are stated to ``remain within the Z language''
(indicated by their results being in $ⓩ...⌝$ or
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

By default all relevant functions in this document should
be assumed to remain within the Z language and to check this fact, unless otherwise stated.
\section{PROLOG}
=SML
open_theory"z_sets";
push_merge_pcs ["z_predicates","'z_∈_set_lang",
	"'z_bindings","'z_normal","'z_tuples_lang",
	"'z_∈_set_lib","'z_sets_ext_lang","'z_sets_ext_lib"];
delete_theory"z_relations" handle Fail _ => ();
set_flag ("z_type_check_only", false);
set_flag ("z_use_axioms", true);
new_theory"z_relations";
=TEX
\section {DEFINITION OF FIXITY}

The following fixity information is taken from \cite{ISO02}.

ⓈZ
function 10 leftassoc _ ↦ _
■
ⓈZ
function 40 leftassoc _ ⨾ _, _ ∘ _
■
ⓈZ
function 50 leftassoc _ ⊕ _
■

ⓈZ
function 60 leftassoc _ ▷ _, _ ⩥ _
■
ⓈZ
function 65 rightassoc _ ◁ _, _ ⩤ _
■

ⓈZ
function 70 _ ↗~↕, _ ↗*↕, _ ↗+↕
■

ⓈZ
function 70 _ ⦇ _ ⦈
■
ⓈZ
generic 70 id _
■
\section{RELATIONS}
Note that $↔$ is defined in \cite{DS/FMU/IED/DTD078},
as it is required to define the Z Library set material.
\subsection{Maplet}

╒[X, Y]════════════════
│ _ ⦏↦⦎ _ : X × Y → X × Y
├──────────────────
│ ∀ x : X; y : Y ⦁
│	x ↦ y = (x, y)
└────────────────────

\subsection{Domain and Range}

╒[X, Y]════════════════
│ ⦏dom⦎ : (X ↔ Y) → ℙ X;
│ ⦏ran⦎ : (X ↔ Y) → ℙ Y
├──────────────────
│ ∀ R : X ↔ Y ⦁
│	dom R = {x : X; y : Y | (x ↦ y) ∈ R ⦁ x} ∧
│	ran R = {x : X; y : Y | (x ↦ y) ∈ R ⦁ y}
└────────────────────

\subsection{Identity}

ⓈZ
⦏id⦎ X ≜ {x : X ⦁ x ↦ x}
■

\subsection{Relational and Backward Relational Composition}

╒[X, Y, Z]════════════════
│ _ ⦏⨾⦎ _ : (X ↔ Y) × (Y ↔ Z) → (X ↔ Z);
│ _ ⦏∘⦎ _ : (Y ↔ Z) × (X ↔ Y) → (X ↔ Z)
├──────────────────
│ ∀ R : X ↔ Y; S : Y ↔ Z ⦁
│	R ⨾ S = S ∘ R ∧
│	S ∘ R = {x : X; y : Y; z : Z |
│		(x ↦ y) ∈ R ∧ (y ↦ z) ∈ S ⦁ x ↦ z}
└────────────────────


\subsection{Domain and Range Restriction}

╒[X, Y]════════════════
│ _ ⦏◁⦎ _ : ℙ X × (X ↔ Y) → (X ↔ Y);
│ _ ⦏▷⦎ _ : (X ↔ Y) × ℙ Y → (X ↔ Y)
├──────────────────
│ (∀ S : ℙ X; R : X ↔ Y ⦁
│	S ◁ R = {x : X; y : Y | x ∈ S ∧ (x ↦ y) ∈ R ⦁ x ↦ y}) ∧
│(∀ R : X ↔ Y; T : ℙ Y ⦁
│	R ▷ T = {x : X; y : Y | (x ↦ y) ∈ R ∧ y ∈ T ⦁ x ↦ y})
└────────────────────

\subsection{Domain and Range Anti-restriction}


╒[X, Y]════════════════
│ _ ⦏⩤⦎ _ : ℙ X × (X ↔ Y) → (X ↔ Y);
│ _ ⦏⩥⦎ _ : (X ↔ Y) × ℙ Y → (X ↔ Y)
├──────────────────
│ (∀ S : ℙ X; R : X ↔ Y ⦁
│	S ⩤ R = {x : X; y : Y | x ∉ S ∧ (x ↦ y) ∈ R ⦁ x ↦ y}) ∧
│(∀ R : X ↔ Y; T : ℙ Y ⦁
│	R ⩥ T = {x : X; y : Y | (x ↦ y) ∈ R ∧ y ∉ T ⦁ x ↦ y})
└────────────────────

\subsection{Relational Inversion}


╒[X, Y]════════════════
│ _ ⦏↗~↕⦎ : (X ↔ Y) → (Y ↔ X)
├──────────────────
│ ∀ R : X ↔ Y ⦁
│	R ↗~↕ = {x : X; y : Y | (x ↦ y) ∈ R ⦁ y ↦ x}
└────────────────────

\subsection{Relational Image}

╒[X, Y]════════════════
│ _ ⦏⦇⦎ _ ⦏⦈⦎ : (X ↔ Y) × ℙ X → ℙ Y
├──────────────────
│ ∀ R : X ↔ Y; S : ℙ X ⦁
│	R⦇S⦈ = {x : X; y : Y | x ∈ S ∧ (x ↦ y) ∈ R ⦁ y}
└────────────────────

\subsection{Transitive and Reflexive-Transitive Closure}

╒[X]════════════════
│ _ ⦏↗+↕⦎, _ ⦏↗*↕⦎ : (X ↔ X) → (X ↔ X)
├──────────────────
│ ∀ R : X ↔ X ⦁
│	R ↗+↕ = ⋂ {Q : X ↔ X | R ⊆ Q ∧ Q ⨾ Q ⊆ Q} ∧
│	R ↗*↕ = ⋂ {Q : X ↔ X | id X ⊆ Q ∧ R ⊆ Q ∧ Q ⨾ Q ⊆ Q}
└────────────────────

\subsection{Override}
╒[X,Y]════════════════
│ _ ⦏⊕⦎ _ : (X ↔ Y) × (X ↔ Y) → (X ↔ Y)
├──────────────────
│ ∀ f, g : X ↔ Y ⦁
│	f ⊕ g = ((dom g) ⩤ f) ∪ g
└────────────────────

\section{START OF STRUCTURE}
=DOC
signature ⦏ZRelations⦎ = sig
=DESCRIBE
This provides the basic proof support for the Z library relations.
It creates the theory $z\_relations$.
=ENDDOC
=THDOC
req_name ⦏"z_relations"⦎ (Value "z_sets");
req_language "Z";
set_flag("tc_thms_only",true);
=DESCRIBE
The theory $z\_relations$ contains various definitions of relation operators, and ``defining theorems'' of Z library constants derived from these definitions.
It is created in structure $ZRelations$.
=ENDDOC
The following theorems are mostly just the definition
instantiated to $ⓩ𝕌⌝$ where appropriate,
and perhaps with the addition of set extensionality.
They are supplimented by the $clauses$ theorems, which
show the interaction of a single operator, and $𝕌$ or ${}$.
Only those interactions giving uncontroversially simpler
results are given.

We choose to preserve maplets (formed by $↦$) presented by the user,
but not to introduce new ones in, e.g., any rewriting theorems we provide.
=THDOC
req_thm(⦏"z_↔_thm"⦎, ([],ⓩ∀ X: 𝕌; Y: 𝕌⦁
	(X ↔ Y) = ℙ(X × Y)⌝));
req_thm(⦏"z_↦_thm"⦎, ([],ⓩ∀ x: 𝕌; y: 𝕌⦁
	(x ↦ y) = (x,y)⌝));
req_thm(⦏"z_↔_clauses"⦎, ([],ⓩ∀ X: 𝕌⦁
	(X ↔ {} = {{}}) ∧
	({} ↔ X = {{}})⌝));
=DESCRIBE
Binary relations and maplets.
Note that $𝕌\ ↔\ 𝕌$ is simplified to $𝕌$ by, e.g., rewriting in proof
context $z\_language$.
=ENDDOC
Spivey Ed 1. page 95.

=THDOC
req_thm(⦏"z_dom_thm"⦎, ([],ⓩ∀ z: 𝕌; R: 𝕌 ⦁
	z ∈ dom R ⇔ (∃ y : 𝕌⦁ (z, y) ∈ R)⌝));
req_thm(⦏"z_ran_thm"⦎, ([],ⓩ∀ z: 𝕌; R: 𝕌 ⦁
	z ∈ ran R ⇔ (∃ x : 𝕌⦁ (x, z) ∈ R)⌝));
req_thm(⦏"z_dom_clauses"⦎, ([],ⓩ∀ a:𝕌; b:𝕌 ⦁
	dom 𝕌 = 𝕌 ∧
	dom {} = {} ∧
	dom {a ↦ b} = {a} ∧
	dom {(a, b)} = {a}⌝));
req_thm(⦏"z_ran_clauses"⦎, ([],ⓩ∀ a:𝕌; b:𝕌 ⦁
	ran 𝕌 = 𝕌 ∧
	ran {} = {} ∧
	ran {a ↦ b} = {b} ∧
	ran {(a, b)} = {b}⌝));
=DESCRIBE
Domain and range.
=ENDDOC
Spivey Ed 1. page 96.

The addition of clauses for the domain and range of singleton sets is the only place in this document where such kinds of clauses seem appropriate.

=THDOC
req_thm(⦏"z_id_thm"⦎, ([],ⓩ∀ X: 𝕌⦁ id X = {x : 𝕌 | x ∈ X ⦁ (x, x)}⌝));
req_thm(⦏"z_⨾_thm"⦎, ([],ⓩ∀ R: 𝕌; S: 𝕌⦁
	R ⨾ S = S ∘ R⌝));
req_thm(⦏"z_∘_thm"⦎, ([],ⓩ∀ x: 𝕌; S: 𝕌;
	R: 𝕌⦁
	x ∈ S ∘ R ⇔
	(∃ y : 𝕌⦁ (x.1, y) ∈ R ∧ (y, x.2) ∈ S)⌝));
req_thm(⦏"z_id_clauses"⦎, ([],ⓩid {} = {}⌝));
req_thm(⦏"z_⨾_clauses"⦎, ([],ⓩ∀ R: 𝕌 ⦁
	R ⨾ {} = {} ∧
	{} ⨾ R = {} ∧
	𝕌 ⨾ 𝕌 = 𝕌⌝));
req_thm(⦏"z_∘_clauses"⦎, ([],ⓩ∀ R: 𝕌 ⦁
	R ∘ {} = {} ∧
	{} ∘ R = {} ∧
	𝕌 ∘ 𝕌 = 𝕌⌝));
=DESCRIBE
Identity relation, relational composition, backward relational composition.
=ENDDOC
Spivey Ed 1. page 97.

=THDOC
req_thm(⦏"z_◁_thm"⦎, ([],ⓩ∀ x: 𝕌;
	 S: 𝕌; R: 𝕌⦁
	x ∈ S ◁ R ⇔ x.1 ∈ S ∧ x ∈ R⌝));
req_thm(⦏"z_▷_thm"⦎, ([],ⓩ∀ x: 𝕌;
	R: 𝕌; S: 𝕌⦁
	x ∈ R ▷ S ⇔ x ∈ R ∧ x.2 ∈ S⌝));
req_thm(⦏"z_◁_clauses"⦎, ([],ⓩ∀ R: 𝕌;S:𝕌⦁
	(𝕌 ◁ R = R) ∧
	({} ◁ R = {}) ∧
	(S ◁ {} = {})⌝));
req_thm(⦏"z_▷_clauses"⦎, ([],ⓩ∀ R: 𝕌;S:𝕌⦁
	(R ▷ 𝕌 = R) ∧
	({} ▷ S = {}) ∧
	(R ▷ {} = {})⌝));
=DESCRIBE
Domain restriction, range restriction.
=ENDDOC
Spivey Ed 1. page 98.

=THDOC
req_thm(⦏"z_⩤_thm"⦎, ([],ⓩ∀ x: 𝕌;
	 S: 𝕌; R: 𝕌 ⦁
	x ∈ S ⩤ R ⇔ ¬(x.1 ∈ S) ∧ x ∈ R⌝));
req_thm(⦏"z_⩥_thm"⦎, ([],ⓩ∀ x: 𝕌;
	R: 𝕌; S: 𝕌⦁
	x ∈ R ⩥ S ⇔ x ∈ R ∧ ¬(x.2 ∈ S)⌝));
req_thm(⦏"z_⩤_clauses"⦎, ([],ⓩ∀ R: 𝕌;S:𝕌⦁
	(𝕌 ⩤ R = {}) ∧
	({} ⩤ R = R) ∧
	(S ⩤ {} = {})⌝));
req_thm(⦏"z_⩥_clauses"⦎, ([],ⓩ∀ R: 𝕌;S:𝕌⦁
	(R ⩥ 𝕌 = {}) ∧
	({} ⩥ S = {}) ∧
	(R ⩥ {} = R)⌝));
=DESCRIBE
Domain anti-restriction and range anti-restriction.
=ENDDOC
Spivey Ed 1. page 99.

=THDOC
req_thm(⦏"z_rel_inv_thm"⦎, ([],ⓩ∀ x: 𝕌; R: 𝕌⦁
	x ∈ R ↗~↕ ⇔ (x.2, x.1) ∈ R⌝));
req_thm(⦏"z_rel_inv_clauses"⦎, ([],ⓩ
	𝕌 ↗~↕ = 𝕌 ∧
	{} ↗~↕ = {}⌝));
=DESCRIBE
Relational inversion.
=ENDDOC
Spivey Ed 1. page 100.

=THDOC
req_thm(⦏"z_rel_image_thm"⦎, ([],
	ⓩ∀ y : 𝕌; R : 𝕌; S : 𝕌
	⦁ y ∈ (R ⦇  S ⦈) ⇔
	 (∃ x : 𝕌 ⦁ x ∈ S ∧ (x, y) ∈ R)⌝));
req_thm(⦏"z_rel_image_clauses"⦎, ([],
	ⓩ∀ R : 𝕌; S:𝕌 ⦁
	R ⦇ {} ⦈ = {} ∧
	{} ⦇ S ⦈ = {}⌝));
=DESCRIBE
Relational image.
=ENDDOC
Spivey Ed 1. page 101

=THDOC
req_thm(⦏"z_trans_closure_thm"⦎, ([],ⓩ∀ R: 𝕌⦁
	 R ↗+↕ = ⋂ {Q : 𝕌 | (R ⊆ Q) ∧ (Q ⨾ Q ⊆ Q)⦁ Q}⌝));
req_thm(⦏"z_reflex_trans_closure_thm"⦎, ([],ⓩ∀ R: 𝕌
⦁ R ↗*↕
      = ⋂ {Q : 𝕌
	      | (id 𝕌 ⊆ Q) ∧ (R ⊆ Q) ∧ (Q ⨾ Q ⊆ Q)⦁
	 Q}⌝));
req_thm(⦏"z_trans_closure_clauses"⦎, ([],ⓩ
	𝕌 ↗+↕ = 𝕌 ∧
	{} ↗+↕ = {}⌝));
req_thm(⦏"z_reflex_closure_clauses"⦎, ([],ⓩ
	𝕌 ↗*↕ = 𝕌 ∧
	{} ↗*↕ = id 𝕌⌝));
=DESCRIBE
Transitive and reflexive-transitive closure operations.
=ENDDOC
Spivey Ed 1. page 102

=THDOC
req_thm(⦏"z_⊕_thm"⦎, ([],ⓩ∀ f : 𝕌; g: 𝕌⦁
	f ⊕ g = dom g ⩤ f ∪ g⌝));
req_thm(⦏"z_⊕_clauses"⦎, ([],ⓩ∀ f : 𝕌⦁
	f ⊕ {} = f ∧
	{} ⊕ f = f ∧
	f ⊕ 𝕌 = 𝕌⌝));
=DESCRIBE
Functional overriding.
=ENDDOC

\section{TUPLES}
This is a reworking of the language functions, but
with a knowledge of $↦$.
=DOC
val ⦏z_tuple_eq_conv⦎ : CONV;
=DESCRIBE
A conversion for eliminating tuples over equality.
=FRULE 1 Conversion
z_tuple_eq_conv
ⓩ(t⋎1,t⋎2,...) = (u⋎1,u⋎2,...)⌝
├
├
⊢ (t⋎1,t⋎2,...) = (u⋎1,u⋎2,...) ⇔
((t⋎1 = u⋎1) ∧ (t⋎2 = u⋎2) ∧ ...)
=TEX
$x\ ↦\ y$ will be treated as a 2-tuple.
=SEEALSO
$z\_tuple\_lang\_eq\_conv$
=FAILURE
42003	?0 is not of the form: ⓩ(x1,...) = (y1,...)⌝
=ENDDOC
=DOC
val ⦏z_sel⋎t_conv⦎ : CONV;
=DESCRIBE
This conversion carries out the
selection from a tuple display.
=FRULE 1 Conversion
z_sel⋎t_conv
ⓩ(t⋎1,...,t⋎i,...,t⋎n).i⌝
├
├
⊢ (t⋎1,...,t⋎i,...,t⋎n).i = t⋎i
=TEX
$x\ ↦\ y$ will be treated as a 2-tuple.
=SEEALSO
$z\_sel⋎t\_lang\_conv$
=FAILURE
47185	?0 is not a Z tuple selection
42006	?0 is not of the form ⓩ(x,...).i⌝
=ENDDOC
=DOC
val ⦏z_tuple_intro_conv⦎ : CONV;
=DESCRIBE
This conversion carries out the
elimination of a tuple display of tuple selections
from the same tuple.
=FRULE 1 Conversion
z_tuple_intro_conv
ⓩ(t.1,...,t.n)⌝
├
├
⊢ (t.1,...,t.n) = t
=TEX
where $n$ is the arity of $t$.
$x\ ↦\ y$ will be treated as a 2-tuple.
=SEEALSO
$z\_tuple\_lang\_intro\_conv$
=FAILURE
42005	?0 is not of the form: ⓩ(t.1,...,t.n)⌝
=ENDDOC

Spivey Ed 1. page 108
\subsection{Elementwise Equalities}
=DOC
val ⦏z_binding_eq_conv3⦎ : CONV;
=DESCRIBE
A conversion for eliminating equations of bindings
to an elementwise equality clause.
In general this does:
=FRULE 1 Conversion
z_binding_eq_conv3
ⓩb⋎1 = b⋎2⌝
├
├
⊢ (b⋎1 = b⋎2) ⇔ (b⋎1.s⋎1 = b⋎2.s⋎1) ∧
	(b⋎1.s⋎2 = b⋎2.s⋎2) ∧ ...
=TEX
However, it will expand on either side $θ$-terms into binding displays, and also use $z\_sel⋎s\_conv$ on selections from binding displays (whether from $θ$-terms or otherwise).
=FAILURE
42013	?0  is not of the form ⓩbinding = binding⌝
=ENDDOC
=DOC
val ⦏z_tuple_eq_conv1⦎ : CONV;
=DESCRIBE
A conversion for eliminating tuples over equality to an elementwise equality clause.
=FRULE 1 Conversion
z_tuple_eq_conv
ⓩt1 = t2⌝
├
├
⊢ (t1 = t2) ⇔ (t1.1 = t2.1 ∧ ...)
=TEX
This will then use $z\_sel⋎t\_conv$ to eliminate explicit
tuples.
$x\ ↦\ y$ will be treated as a 2-tuple.
=SEEALSO
$z\_tuple\_lang\_eq\_conv$
=FAILURE
83001	?0 is not of the form: ⓩtuple1 = tuple2⌝
=ENDDOC


\section{PROOF CONTEXTS}
We provide the following proof contexts to reason about the above:

\begin{tabular}{l p{4in}}
$'z\_∈\_rel$ & Membership of Z relations (e.g. $▷$). \\
$'z\_rel\_alg$ & Simplification of Z relations (e.g. $▷$). \\
$'z\_tuples$ & handling Z tuples and cartesian products in both language and library (e.g. $↦$ and $×$). \\
$z\_language$ & Z Language reasoning with minimal Library. \\
$z\_language\_ext$ & Extensional Z Language reasoning with minimal Library. \\
$z\_sets\_alg$ & Z Set (and language) reasoning. \\
$z\_sets\_ext$ & Extensional Z Set (and language) reasoning. \\
\end{tabular}

The above proof contexts
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
{} will remain within the Z language.

Some stripping theorems (e.g. for $◁$)
raise the dilemma of how and whether to
avoid leaving terms of the forms $ⓩ(x,y).1⌝$
(a special case is $ⓩ(x\ ↦\ y).1⌝$)
and $ⓩ(p.1,p.2)⌝$.
The first form is bad because of functionality problems;
the second is primarily bad because it is verbose,
but also because it provides a less general term for,
e.g., rewriting with.
We currently address this by including three theorems for
each problem operator, and relying on the discrimination
net effect of choosing ``the best match'' (see \cite{DS/FMU/IED/DTD008})
to get results that avoid the forms $ⓩ(x,y).1⌝$ and $ⓩ(p.1,p.2)⌝$.
We include all three theorems in both rewriting and stripping,
without relying on $z\-\_sel⋎t\-\_conv$
during rewriting.
Thus for instance we include the theorems:
=GFT
⊢ ∀ p S R⦁ ⓩp ∈ S ◁ R ⇔ p.1 ∈ S ∧ p ∈ R⌝
⊢ ∀ p1 p2 S R⦁ ⓩ(p1,p2) ∈ S ◁ R ⇔ p1 ∈ S ∧ (p1,p2) ∈ R⌝
⊢ ∀ p1 p2 S R⦁ ⓩ(p1 ↦ p2) ∈ S ◁ R ⇔ p1 ∈ S ∧ (p1 ↦ p2) ∈ R⌝
=TEX
The latter two theorems are automatically generated from the first.
This is only one possible solution, and not even necessarily the best.
Others include addressing the introduction of extensionality
variables, or ``fall back'' conversions if nothing else
applies to a term of the form $ⓩp\ ∈\ q⌝$.
The operators affected (to date) are:
=INLINEFT
⩤, ⩥, ◁, ▷, and o
=TEX
{}.
=DOC
(* Proof Context: ⦏'z_∈_rel⦎ *)
=DESCRIBE
A component proof context for handling the membership of Z relations created by Z library operations.

Predicates treated by this proof context are constructs formed from:
=GFT
↦, ⊕, _ ↗+↕, _ ↗*↕,_ ↗~↕, _ ⦇ _ ⦈, ⩥, ⩤, ▷, ◁,
o, ⨾, id, ran, dom, ↔
=TEX
\paragraph{Contents}\

Rewriting:
=GFT
z_↦_thm
=TEX

Stripping theorems:
=GFT
=TEX

Stripping conclusions:
=GFT
=TEX
All three of the above also have theorems concerning the membership of terms generated by the following operators:
=GFT
⊕, _ ↗+↕, _ ↗*↕,_ ↗~↕, _ ⦇ _ ⦈, ⩥, ⩤, ▷, ◁,
o, ⨾, id, ran, dom, ↔
=TEX
Stripping also contains the above in negated forms.

Rewriting canonicalisation:
=GFT
=TEX

Automatic proof procedures are respectively $z\-\_basic\-\_prove\-\_tac$,
$z\-\_basic\-\_prove\-\_conv$,
and
no existence prover.
\paragraph{Usage Notes}
It requires theory $z\-\_relations$.
It is intended to be used with proof contexts ``z$\_$sets$\_$ext'' and ``z$\_$sets$\_$alg''.
It is not intended to be mixed with HOL proof contexts.
=ENDDOC

=DOC
(* Proof Context: ⦏'z_rel_alg⦎ *)
=DESCRIBE
A component proof context for the simplification of Z relations created by Z library operations.

Predicates treated by this proof context are constructs formed from:
=GFT
⊕, _ ↗+↕, _ ↗*↕,_ ↗~↕, _ ⦇ _ ⦈, ⩥, ⩤, ▷, ◁,
o, ⨾, id, ran, dom, ↔
=TEX
\paragraph{Contents}\

Rewriting:
=GFT
z_↔_clauses, z_dom_clauses, z_ran_clauses,z_id_clauses,
z_⨾_clauses, z_∘_clauses, z_◁_clauses, z_▷_clauses,
z_⩤_clauses, z_⩥_clauses, z_rel_inv_clauses, z_rel_image_clauses,
z_trans_closure_clauses, z_reflex_closure_clauses,
z_⊕_clauses
=TEX

Stripping theorems:
=GFT
z_↔_clauses, z_dom_clauses, z_ran_clauses,z_id_clauses,
z_⨾_clauses, z_∘_clauses, z_◁_clauses, z_▷_clauses,
z_⩤_clauses, z_⩥_clauses, z_rel_inv_clauses, z_rel_image_clauses,
z_trans_closure_clauses, z_reflex_closure_clauses,
z_⊕_clauses
Expressed as memberships, as necessary, using ∈_C
All also pushed through ¬
=TEX

Stripping conclusions:
=GFT
z_↔_clauses, z_dom_clauses, z_ran_clauses,z_id_clauses,
z_⨾_clauses, z_∘_clauses, z_◁_clauses, z_▷_clauses,
z_⩤_clauses, z_⩥_clauses, z_rel_inv_clauses, z_rel_image_clauses,
z_trans_closure_clauses, z_reflex_closure_clauses,
z_⊕_clauses
Expressed as memberships, as necessary, using ∈_C
All also pushed through ¬
=TEX
Rewriting canonicalisation:
=GFT
=TEX

Automatic proof procedures are respectively $z\-\_basic\-\_prove\-\_tac$,
$z\-\_basic\-\_prove\-\_conv$,
and
no existence prover.
\paragraph{Usage Notes}
It requires theory $z\-\_relations$.
It is intended to be used with proof contexts ``z$\_$sets$\_$ext'' and ``z$\_$sets$\_$alg''.
There are clashes of effects if merged with ``z$\_∈\_$rel'', resolved
in favour of ``z$\_∈\_$rel'', though the resulting merge
has its uses.
It is not intended to be mixed with HOL proof contexts.
=ENDDOC
Membership analogues of these rules could be put in the
stripping.
=DOC
(* Proof Context: ⦏'z_tuples⦎ *)
=DESCRIBE
A component proof context for handling the manipulation of Z tuples and cartesian products within the Z language and library.

Expressions and predicates treated by this proof context are constructs formed from:
=GFT
(membership of) ×, equations of tuple displays,
selection from tuple displays, first, second, ↦
=TEX

\paragraph{Contents}\

Rewriting:
=GFT
z_∈_×_conv,
z_tuple_eq_conv, z_sel⋎t_conv,
z_second_thm, z_first_thm
=TEX

Stripping theorems:
=GFT
z_∈_×_conv,
z_tuple_eq_conv, ∈_C z_sel⋎t_conv,
z_sel⋎t_conv (where component of tuple is boolean),
plus these all pushed in through ¬
=TEX

Stripping conclusions:
=GFT
z_∈_×_conv,
z_tuple_eq_conv, ∈_C z_sel⋎t_conv,
z_sel⋎t_conv (where component of tuple is boolean),
plus these all pushed in through ¬
=TEX
Stripping also contains the above in negated forms.

Rewriting canonicalisation:
=GFT
=TEX

Automatic proof procedures are respectively $z\-\_basic\-\_prove\-\_tac$,
$\-\_basic\-\_prove\-\_conv$,
and
no existence prover (1-tuples and 2-tuples are handled in proof
context ``z$\_$predicates'').
\paragraph{Usage Notes}
It requires theory $z\-\_relations$.
It is intended to be used with proof contexts ``z$\_$sets$\_$ext'' and ``z$\_$sets$\_$alg''.
It should not be used with ``$'$z$\_$tuples$\_$lang''.
It is not intended to be mixed with HOL proof contexts.
=ENDDOC
Perhaps later releases will add rules such as
=GFT
(a,b,...) = p ⇔ (a = p.1 ∧ b = p.2 ∧ ...)
=TEX
perhaps into a separate $'z\_tuples\_ext$.
=DOC
(* Proof Context: ⦏'z_elementwise_eq⦎ *)
=DESCRIBE
A aggressive component proof context for forcing the elementwise
comparison of any two items of tuple or binding types.


Predicates and expressions treated by this proof context are:
=GFT
x = y   where x has a tuple type
x = y   where x has the type of a bidning display
=TEX
\paragraph{Contents}\

Rewriting:
=GFT
z_binding_eq_conv3, z_tuple_eq_conv1
=TEX

Stripping theorems:
=GFT
z_binding_eq_conv3, z_tuple_eq_conv1
plus these all pushed in through ¬
=TEX

Stripping conclusions:
=GFT
z_binding_eq_conv3, z_tuple_eq_conv1,
plus these all pushed in through ¬
=TEX
Rewriting canonicalisation:
=GFT
=TEX
Automatic proof procedures are respectively $z\-\_basic\-\_prove\-\_tac$,
$z\-\_basic\-\_prove\-\_conv$,
and
no existence prover.
\paragraph{Usage Notes}
It requires theory $z\-\_relations$.
It is intended to be used with proof context ``z$\_$language''.
It is not intended to be mixed with HOL proof contexts.
=ENDDOC

=DOC
(* Proof Context: ⦏z_language⦎ *)
=DESCRIBE
A mild complete proof context for reasoning in the Z language.
It will also do some minor peices of Z Library reasoning - in
particular, it ``understands'' maplets and $⊆$.

It consists of the merge of the proof contexts:
=GFT
"z_predicates",
"'z_∈_set_lang",
"'z_bindings",
"'z_schemas",
"'z_tuples"
=TEX
\paragraph{Usage Notes}
It requires theory $z\-\_relations$
(rather than $z\_language\_ps$ as one might expect).
This is because we wish to provide a proof context that
can be added to provide Library reasoning facilities.
This means that we cannot use the Z language proof context ``$'$z$\_tuples$\_$lang'',
as this is incompatible with ``$'$z$\_tuples'', its
library extension.
This is why this proof context understands maplets, which
are Z Library contructs.
=ENDDOC
=DOC
(* Proof Context: ⦏z_language_ext⦎ *)
=DESCRIBE
An aggressive complete proof context for reasoning in the Z language.
It uses the extensionality of sets, and will also decompose
any equality of objects of schema or tuple type
into a pairwise equality clause.
It will also do some minor peices of Z Library reasoning - in
particular, it ``understands'' maplets and $⊆$.

It consists of the merge of the proof contexts:
=GFT
"z_predicates",
"'z_∈_set_lang",
"'z_sets_ext_lang",
"'z_bindings",
"'z_schemas",
"'z_tuples",
"'z_elementwise_eq"
=TEX
\paragraph{Usage Notes}
It requires theory $z\-\_relations$
(rather than $z\_language\_ps$ as one might expect).
This is because we wish to provide a proof context that
can be added to provide Library reasoning facilities.
This means that we cannot use the Z language proof context ``$'$z$\_tuples$\_$lang'',
as this is incompatible with ``$'$z$\_tuples'', its
library extension.
This is why this proof context understands maplets, which
are Z Library contructs.
=ENDDOC
=DOC
(* Proof Context: ⦏z_sets_ext⦎ *)
=DESCRIBE
An aggressive complete proof context for handling the manipulation of Z set expressions, by breaking them into predicate calculus.

It consists of the merge of the proof contexts:
=GFT
"z_language_ext",
"'z_∈_set_lib",
"'z_sets_ext_lib",
"'z_normal"
=TEX
\paragraph{Usage Notes}
It requires theory $z\-\_relations$.

It is not intended to be mixed with HOL proof contexts
or ``z$\_$sets$\_$alg'', which offers an alternative
approach to reasoning about sets.
=ENDDOC
=DOC
(* Proof Context: ⦏z_sets_alg⦎ *)
=DESCRIBE
A mild complete proof context for handling the manipulation of Z set expressions, by algebraic reasoning and knowledge
of the set membership of the set operators.

It consists of the merge of the proof contexts:
=GFT
"z_language",
"'z_∈_set_lib",
"'z_sets_alg",
"'z_normal"
=TEX
\paragraph{Usage Notes}
It requires theory $z\-\_relations$.
The proof context ensures that its simplifications will
be attempted before more general rules concerned membership
of set operators are used (including extensionality rules).

It is not intended to be mixed with HOL proof contexts.
=ENDDOC
=DOC
(* Proof Context: ⦏z_rel_ext⦎ *)
=DESCRIBE
An aggressive complete proof context for reasoning about
Z relations. When stripping or rewriting it attempts to
reduce any predicate concerning relational constructs to predicate calculus. As a side effect set constructs
are also reduced to predicate calculus.
The proof context is a merge of:
=GFT
z_sets_ext - extensional reasoning about sets
'z_∈_rel - membership of relational constructs
'z_rel_alg - simplifications of relational constructs
=TEX
It requires the theory ``z$\_$relations''.
=ENDDOC

=TEX
\section{Theorems in the Signature}
=DOC
val z_↔_thm: THM;
val z_↦_thm: THM;
val z_dom_thm: THM;
val z_ran_thm: THM;
val z_id_thm: THM;
val z_⨾_thm: THM;
val z_∘_thm: THM;
val z_◁_thm: THM;
val z_▷_thm: THM;
val z_⩤_thm: THM;
val z_⩥_thm: THM;
val z_rel_inv_thm: THM;
val z_rel_image_thm: THM;
val z_trans_closure_thm: THM;
val z_reflex_trans_closure_thm: THM;
val z_⊕_thm: THM;
val z_↔_clauses: THM;
val z_dom_clauses: THM;
val z_ran_clauses: THM;
val z_id_clauses: THM;
val z_⨾_clauses: THM;
val z_∘_clauses: THM;
val z_◁_clauses: THM;
val z_▷_clauses: THM;
val z_⩤_clauses: THM;
val z_⩥_clauses: THM;
val z_rel_inv_clauses: THM;
val z_rel_image_clauses: THM;
val z_trans_closure_clauses: THM;
val z_reflex_closure_clauses: THM;
val z_⊕_clauses: THM;
=DESCRIBE
The ML bindings of the theorems (other than consistency ones)
in theory $z\-\_relations$.
=ENDDOC
=DOC
val ⦏z_↦_def⦎ : THM;
val ⦏z_dom_def⦎ : THM;
val ⦏z_ran_def⦎ : THM;
val ⦏z_id_def⦎ : THM;
val ⦏z_⨾_def⦎ : THM;
val ⦏z_∘_def⦎ : THM;
val ⦏z_◁_def⦎ : THM;
val ⦏z_▷_def⦎ : THM;
val ⦏z_⩤_def⦎ : THM;
val ⦏z_⩥_def⦎ : THM;
val ⦏z_rel_inv_def⦎ : THM;
val ⦏z_rel_image_def⦎ : THM;
val ⦏z_tc_def⦎ : THM;
val ⦏z_rtc_def⦎ : THM;
val ⦏z_⊕_def⦎ : THM;
=DESCRIBE
These are the definitions of the theory $z\_relations$.
=ENDDOC

\section{END OF THE SIGNATURE}
=SML
end; (* signature of ZRelations *)
=TEX
=SML
reset_flag ("z_type_check_only");
reset_flag ("z_use_axioms");
pop_pc();
=TEX
\section{TEST POLICY}
The functions in this document should be tested as described in
\cite{DS/FMU/IED/PLN008}.

\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}

=IGN
********************************************************************************
dtd086.doc: this file is part of the PPZed system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  dtd086.doc  ℤ $Revision: 1.30 $ $RCSfile: dtd086.doc,v $ $Date: 2011/08/07 14:54:36 $
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

\def\Title{Detailed Design of the Z Library Numbers and Finiteness}

\def\AbstractText{This document contains the detailed design of the Z Library Numbers and Finiteness and their proof support.}

\def\Reference{DS/FMU/IED/DTD086}

\def\Author{D.J. King, K. Blackburn, R.D. Arthan}


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
%% LaTeX2e port: \TPPtitle{Detailed Design of the Z Library Numbers and Finiteness}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/DTD086}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.30 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2011/08/07 14:54:36 $%
%% LaTeX2e port: }}
%% LaTeX2e port: %\TPPstatus{Approved}
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthors{D.J.~King & WIN01\\K.~Blackburn & WIN01\\R.D.~Arthan & WIN01}
%% LaTeX2e port: %\TPPauthor{D.J.~King & WIN01}  %% Mandatory field
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document contains the detailed design of
%% LaTeX2e port: the Z Library Numbers and Finiteness and their proof support.}
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
\item [Issue 1.1 (1992/10/28) (22nd October 1992)]
First version, derived from 078 and 083.
\item [Issue 1.2 (1992/10/30) (30th October 1992)]
Indexing of $\_ ↗ \_ ↕$ changed so that it works!
\item [Issue 1.3 (1992/10/30) (30th October 1992)]
Tidying.
\item [Issue 1.4 (1992/11/12), 12th November 1992]
Changes as a consequence of changes in dependences.
\item [Issue 1.5 (1992/11/16), 16th November 1992]
Added some theorems.
\item [Issue 1.6 (1992/11/19), 16th November 1992]
Changed names of system control flag. Corrected definition of $div$ and $mod$.
\item [Issue 1.7 (1992/12/08), 8th December 1992]
Added more theorems, computational conversions and a proof context.
\item [Issue 1.8 (1992/12/09), 9th December 1992]
Changes in the light of comments received. Added error messages for
syntax functions, etc.
\item[Issue 1.9 (1992/12/11) (11th December 1992)]
Global rename from wrk038.doc issue 1.9.
\item[Issue 1.10 (1993/02/10),1.11 (1993/02/11) (10th-11th February 1993)]
Rearranging proof contexts, etc.
\item[Issue 1.12 (1993/08/11) (10th August 1993)]
addition of some new induction theorems and tactics.
\item[Issue 1.13 (1993/08/11), 1.14 (1993/08/18) (17th August 1993)]
addition of course of values induction theorem and tactic.
\item[Issue 1.15 (1993/09/22) (22nd September 1993)]
tidying up of description of z\_cov\_induction\_tac.
\item[Issue 1.16 (1996/02/12)]
Fixed bug in definition of relational iteration.
\item[Issue 1.17 (1996/03/07), 1.18 (1996/03/08)]
Introduced new proof contexts that normalise to $≤$, exposed $z\_∈\_ℕ⋎1\_thm$.
\item[Issue 1.19 (1999/03/07)] Update for new INTEGER type.
\item[Issue 1.20 (2001/07/05)] Inserted missing index brackets.
\item[Issue 1.21 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.22 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.23 (2004/01/19)] The Z universal set is now called 𝕌.
\item[Issue 1.24 (2005/02/26)] Precedences and associativity of toolkit operators now follow \cite{ISO02}.
\item[Issue 1.25 (2006/04/28)] Fixed typo in documentation.
\item[Issue 1.26 (2006/10/18)] Fixed another typo.
\item[Issue 1.27 (2007/05/28)] Added pointer to {\em z\_dot\_dot\_conv}.
\item[Issue 1.28 (2007/08/04)] The integer range operator is now referred to as {\em dot\_dot} in all cases.
\item[Issue 1.29 (2007/09/11)] Standardised on {\em z\_simple} rather than {\em simple\_z}.
\item[Issue 1.30 (2011/08/07)] Added ISO Z-like symbol as an alias for monadic minus.
\item[Issue 1.31 (2011/09/18)] Added forgotten theorem to the signature.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported PPZed to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
All theorems involving quantification over $𝕌$ may now be changed to
use quantification over $ℤ$, since adequate support for $𝕌$-simplification
is now in place.
\pagebreak
\section{GENERAL}
\subsection{Scope}
This document contains the detailed design
of the Z Library Numbers and Finiteness, and their proof support.
The high level design for this material is given in \cite{DS/FMU/IED/HLD017}.
\subsection{Introduction}

\subsection{Purpose and Background}
See \cite{DS/FMU/IED/HLD017}.
\subsection{Dependencies}
Loading this document and its implementation relies on having loaded
\cite{DS/FMU/IED/IMP085}.

\subsection{Possible Enhancements}
\subsection{Deficiencies}
Proof support for the objects defined after $div$ and $mod$.
\section{PROLOGUE}

=SML
open_theory"z_functions";
push_pc "z_sets_alg";
delete_theory"z_numbers" handle Fail _ => ();
set_flag ("z_type_check_only", false);
set_flag ("z_use_axioms", true);
new_theory"z_numbers";
=TEX
\section {DEFINITION OF FIXITY}

The following fixity information is taken from \cite{ISO02}.

ⓈZ
function 20 leftassoc _ .. _
■

ⓈZ
function 30 leftassoc _ + _, _ - _
■

ⓈZ
function 40 leftassoc _ * _, _ div _, _ mod _
■
The following three are {\Product}-specific (the standard doesn't support numerical precedences for these):
ⓈZ
function 50 ~ _, ﹣ _
■
ⓈZ
function 50 abs _
■
ⓈZ
function 70 _ ↗ _ ↕
■

ⓈZ
relation _ < _, _ ≤ _, _ ≥ _, _ > _
■
ⓈZ
generic 5 _ ⇻ _, _ ⤕ _
■

ⓈZ
generic 70 𝔽 _, 𝔽⋎1 _
■

\section{NUMBERS AND FINITENESS}

\subsection{Natural Numbers, Integers and Basic Operators}

We need to break out into extended Z to define the set of integers
and to define the semantic constant for numeric literals.
=SML
val _ = set_flag("standard_z_paras", false);
=TEX
ⓈZ
ℤ ≜ 𝕌[⌜Totality:ℤ SET⌝]
■

We begin by defining addition, monadic minus and ℕ.
We want to assert that under addition ℤ is the infinite cyclic group
generated by $1$.
We use four clauses to do this: the first clause
says that $+$ is the operation of an Abelian group with $\sim$ as
inverse operation and $0$ as identity element; the second says
that any subgroup, $h$, containing $1$ is equal to ℤ itself (i.e.
that ℤ is a cyclic group with $1$ as a generator);
ℕ is then defined to be the smallest set which contains $0$ and
is closed under the operation of adding $1$; finally, we assert that
$\sim1$ is not a member of ℕ (which ensures that ℕ is
infinite by disallowing the possibility that $n + 1 = 0$ for $n$ in ℕ).
ⓈZAX
│	_ + _ : ℤ × ℤ → ℤ;
│	~ _ : ℤ → ℤ;
│	ℕ : ℙ ℤ
├──────────────────
│	∀i, j, k : ℤ⦁
│		(i + j) + k = i + (j + k)
│	∧	i + j = j + i
│	∧	i + ~i = 0
│	∧	i + 0 = i;
│	∀h : ℙ ℤ⦁
│		1 ∈ h
│	∧	(∀i, j : h⦁ i + j ∈ h ∧ ~i ∈ h)
│	⇒	h = ℤ;
│	ℕ = ⋂{s : ℙ ℤ | 0 ∈ s ∧ {i:s⦁i + 1} ⊆ s};
│	~1 ∉ ℕ
■

In order to link this with the representation of
numeric literals we must give a defining property for the semantic
constant $Z'Int$ used to give them meaning. (No base clause
is required here, because $ⓩ0⌝$ is
syntactically identical with $⌜Z'Int\,0⌝$).
=SML
new_axiom(["z'int_def", "Z'Int"], ⌜∀i⦁ Z'Int (i+1) = ⓩ⌜Z'Int i⌝ + 1⌝⌝);
=TEX
N.B. the above is not appropriate for a conservative treatment since
it is making an axiomatic assertion about $Z'Int$. In a conservative treatment,
one would first define the integers and associated operations in HOL
including a definition of the standard embedding of the natural numbers
in the integers; $Z'Int$ would then be defined
in the definition of $+$, $\sim$ and $ℕ$.

=SML
val _ = reset_flag"standard_z_paras";
=TEX
We define
=INLINEFT
﹣ _
=TEX
\ as an alias for monadic minus, to give visual compatibility with the standard if desired.
ⓈZ
│ ﹣ _ ≜ (~ _)
■

Now we define dyadic minus with the obvious definition in terms of addition
and monadic minus.
ⓈZAX
│	_ - _ : ℤ × ℤ → ℤ
├──────────────────
│	∀i, j : ℤ⦁ i - j = i + ~j
■
The theorems which follow are formulated on the assumption that dyadic
minus will normally be rewritten away using the above definition. This
has the technical benefit of simplicity.

=TEX
Now we characterise multiplication as the, necessarily unique,
operation under which the integers become a commutative
ring with $1$ as identity element for the multiplication.
ⓈZAX
│	_ * _ : ℤ × ℤ → ℤ
├──────────────────
│	(∀i, j, k : ℤ⦁
│		(i * j) * k = i * (j * k)
│	∧	i * j = j * i
│	∧	i * (j + k) = i*j + i*k
│	∧	1 * i = i)
■

=TEX
Now we can define the four variants of the ordering relation:
ⓈZAX
│	_ ≤ _, _ < _, _ ≥ _, _ > _ : ℤ ↔ ℤ
├──────────────────
│	∀i, j : ℤ⦁
│		(i ≤ j ⇔ j - i ∈ ℕ)
│	∧	(i < j ⇔ i + 1 ≤ j)
│	∧	(i ≥ j ⇔ j ≤ i)
│	∧	(i > j ⇔ j < i)
■
=TEX
\cite{Spivey89} does not give the absolute value function, but it
is convenient for defining division and modulus, and is useful for the
user:
ⓈZAX
│	abs _ : ℤ → ℕ
├──────────────────
│	(abs _) = (~ _) ⊕ id ℕ
■

=TEX
Finally division and modulus can be defined:
ⓈZAX
│	_ div _, _ mod _ : ℤ × (ℤ \ {0}) → ℤ
├──────────────────
│	∀i: ℤ; j : ℤ \ {0}⦁
│		i = (i div j) * j + i mod j
│	∧	0 ≤ i mod j < abs j
■

Note: \cite{Spivey89} says that ``integer division and the modulo operation
use truncation towards minus infinity'' and lists three laws they obey.
Unfortunately, it is not entirely clear what this means because {\em(a)}
``truncation'' is not a well-defined notion (it implies ``discarding a
fractional part'', but the effect of that depends on how numbers are
represented), {\em(b)} the idea of truncation seems inappropriate for
$mod$ (which one does not think of as being obtained by ``truncation''
of a rational number), and {\em(c)} it is not entirely clear where
``truncation'' is to be used in the definition.
The most obvious interpretation of what \cite{Spivey89} says is
that $i\,div\,j$ should be the floor of (i.e., the least integer not greater
than) the rational number $i/j$. Unfortunately, this is both
mathematically unsatisfactory and different from most programming languages.

The problem is that the naive definition for $i\,div\,j$ and
$i\,mod\,j$ is that, for $j\,≠\,0$, they should be the two numbers,
$d$ and $r$ say, satisfying the formula:
=GFT Informal Mathematics
	i = d * j + r  ∧  0 ≤ abs(r) ≤ abs(j)
=TEX
Sadly, unless $i$ is an exact multiple of $j$, this has two solutions, one
with $r$ negative and one with $r$ positive. Programming languages
tend either to take $r$ to have the same sign as $j$ (e.g. Ada, Standard ML),
or to have the same sign as $i$ (e.g. Algol-68, many C compilers).
Mathematically, it seems sensible always to take the non-negative solution,
since this results in simpler laws (fewer case splits) and is, in
my opinion, more compatible with what is normally done in pure mathematics
--- algebraists don't talk of $div$ and $mod$, they talk of arithmetic in the
ring of integers modulo $j$ or of euclidean rings, for which solutions
exist to an analogue of the above formulae with $abs$ replaced by some given
function mapping the non-zero elements of the ring to the natural numbers
(e.g. the ring of polynomials over the integers is such a ring if one takes
the degree of a polynomial as the replacement for $abs$).
The definition we have given for \ProductZ, therefore, makes $mod$ always
non-negative. It is suspected that this is what is
intended in \cite{Spivey89}, since the only other plausible interpretation,
in which one takes $i\,div\,j$ to be the floor of the rational quotient
$i/j$, leads to the unpleasant rule that $i\,mod\,j$ is non-negative
unless $i$ is positive and $j$ is negative.

\subsection{Strictly Positive Integers and the Successor Function}

ⓈZ
⦏ℕ⋎1⦎ ≜ ℕ \ {0}
■

ⓈZAX
│ ⦏succ⦎ : ℕ → ℕ
├──────────────────
│ ∀ n : ℕ ⦁ succ (n) = n + 1
■

\subsection{Iteration}

╒[X]════════════════
│ ⦏iter⦎ : ℤ → (X ↔ X) → (X ↔ X)
├──────────────────
│ ∀ r : X ↔ X ⦁
│	iter 0 r = id X ∧
│	(∀ k : ℕ ⦁ iter (k + 1) r = r ⨾ (iter k r)) ∧
│	(∀ k : ℕ ⦁ iter (~ k) r = iter k (r ↗~↕))
└────────────────────

╒[X]════════════════
│_ ↗ _ ↕ : (X ↔ X) × ℤ → (X ↔ X)
├──────────────────
│ ∀ r : X ↔ X; k : ℤ ⦁
│	⦏r ↗ k ↕⦎ = iter k r
└────────────────────


\subsection{Number Range}

ⓈZAX
│ _ ⦏..⦎ _ : ℤ × ℤ → ℙ ℤ
├──────────────────
│ ∀ x, y : ℤ ⦁
│	x .. y = {k : ℤ | x ≤ k ∧ k ≤ y}
■

\subsection{Finite Sets}


ⓈZ
𝔽 X ≜ {S : ℙ X | (∃ n:  ℕ ⦁ ∃ f :1 .. n → S ⦁ ran f = S)}
■

ⓈZ
⦏𝔽⋎1⦎ X ≜ (𝔽 X) \ { ∅ }
■

╒[X]════════════════
│ ⦏#⦎ : 𝔽 X → ℕ
├──────────────────
│ ∀ S : 𝔽 X ⦁
│	# S = (μ n : ℕ | (∃ f : 1 .. n ↣ S ⦁ ran f = S) ⦁ n)
└────────────────────

\subsection{Finite Partial Functions}

ⓈZ
X ⦏⇻⦎ Y ≜ {f : X ⇸ Y | dom f ∈ 𝔽 X}
■

ⓈZ
X ⦏⤕⦎ Y ≜ (X ⇻ Y) ∩ (X ⤔ Y)
■

\subsection{Minimum and Maximum of a Set of Numbers}

ⓈZAX
│ ⦏min⦎ : ℙ⋎1 ℤ ⇸ ℤ
├──────────────────
│ min = {S : ℙ⋎1 ℤ; m : ℤ | m ∈ S ∧ (∀ n : S ⦁ m ≤ n) ⦁ S ↦ m}
■

ⓈZAX
│ ⦏max⦎ : ℙ⋎1 ℤ ⇸ ℤ
├──────────────────
│ max = {S : ℙ⋎1 ℤ; m : ℤ | m ∈ S ∧ (∀ n : S ⦁ m ≥ n) ⦁ S ↦ m}
■
\section{START OF SIGNATURE}
=DOC
signature ⦏ZNumbers⦎ = sig
=DESCRIBE
This provides the basic proof support for the Z library relations.
It creates the theory $z\_numbers$.
=ENDDOC
=THDOC
req_name ⦏"z_numbers"⦎ (Value "z_functions");
req_language "Z";
set_flag("tc_thms_only",true);
=DESCRIBE
The theory $z\_numbers$ contains various definitions of numbers and finiteness constants and types, and ``defining theorems'' of Z library constants derived from these definitions.
It is created in structure $ZNumbers$.
=ENDDOC
\section{THEOREMS}
The current offering of theorems only covers the basic operations (i.e.
the operations defined above up to and including $div$ and $mod$), and
within that the repertoire of theorems is restricted to some
fairly basic facts.
In particular, the following simplifying assumptions are made:

\begin{enumerate}
\item
Dyadic minus will be eliminated in favour of addition and monadic minus
as a matter of course. Thus theorems like
=INLINEFT
z_plus_order_thm
=TEX
, but handling dyadic minus are not required.
\item
$<$ will usually be eliminated in favour of $≤$, and if not basic facts such
as irreflexivity for $<$ will be derivable by a decision procedure for linear
arithmetic.
\end{enumerate}
=THDOC
req_thm(⦏"z_plus_comm_thm"⦎, ([],
	ⓩ∀ i, j : 𝕌 ⦁ i + j = j + i⌝));
=DESCRIBE
Commutativity of addition.
=ENDDOC
=THDOC
req_thm(⦏"z_plus_assoc_thm"⦎, ([],
	ⓩ∀ i, j, k : 𝕌 ⦁ (i + j) + k = i + (j + k)⌝));
req_thm(⦏"z_plus_assoc_thm1"⦎, ([],
	ⓩ∀ i, j, k : 𝕌 ⦁ i + (j + k) = (i + j) + k⌝));
=DESCRIBE
=DESCRIBE
Associativity of addition: first form moves brackets to the right;
second moves brackets to the left.
=ENDDOC
=THDOC
req_thm(⦏"z_plus_order_thm"⦎, ([],
	ⓩ∀ i : 𝕌 ⦁ ∀ j, k : 𝕌 ⦁
	j + i = i + j ∧ (i + j) + k = i + (j + k) ∧ j + (i + k) = i + (j + k)⌝));
=DESCRIBE
Magic theorem for reordering sums. If $i$ is specialised to $t$, rewriting
with the result floats $t$ to the beginning of the sum.
=ENDDOC
=THDOC
req_thm(⦏"z_plus0_thm"⦎, ([],
	ⓩ∀ i : 𝕌 ⦁ i + 0 = i ∧ 0 + i = i⌝));
=DESCRIBE
0 is the additive identity.
=ENDDOC
=THDOC
req_thm(⦏"z_plus_minus_thm"⦎, ([],
	ⓩ∀ i : 𝕌 ⦁ i + ~ i = 0 ∧ ~ i + i = 0⌝));
=DESCRIBE
=INLINEFT
~x
=TEX
\ is the additive inverse of $x$.
=ENDDOC
=THDOC
req_thm(⦏"z_plus_clauses"⦎, ([],
	ⓩ∀ i, j, k : 𝕌⦁	(i + k = j + k ⇔ i = j)
			∧	(k + i = j + k ⇔ i = j)
			∧	(i + k = k + j ⇔ i = j)
			∧	(k + i = k + j ⇔ i = j)
			∧	(i + k = k ⇔ i = 0)
			∧	(k + i = k ⇔ i = 0)
			∧	(k = k + j ⇔ j = 0)
			∧	(k = j + k ⇔ j = 0)
			∧	i + 0 = i
			∧	0 + i = i
			∧	¬ 1 = 0
			∧	¬ 0 = 1⌝));
=DESCRIBE
Facts about addition of ubiquitous utility.
=ENDDOC
=THDOC
req_thm(⦏"z_ℕ_thm"⦎, ([],
	ⓩℕ = ⋂ {s : 𝕌 | 0 ∈ s ∧ {i : s ⦁ i + 1} ⊆ s} ∧ ¬ ~ 1 ∈ ℕ⌝));
=DESCRIBE
The defining property of the natural numbers extracted from the definition.
=ENDDOC
=THDOC
req_thm(⦏"z_plus_cyclic_group_thm"⦎, ([],
	ⓩ∀ h : 𝕌 ⦁ 1 ∈ h ∧ (∀ i, j : h ⦁ i + j ∈ h ∧ ~ i ∈ h) ⇒ h = 𝕌⌝));
=DESCRIBE
The fact that the integers are a cyclic group generated by $1$ under addition
extracted from their definition.
=ENDDOC
=THDOC
req_thm(⦏"z_int_homomorphism_thm"⦎, ([],
	⌜∀ i j⦁ ⓩ⌜Z'Int (i + j)⌝⌝ = ⓩ⌜Z'Int i⌝ + ⌜Z'Int j⌝⌝⌝));
=DESCRIBE
The fact that $Z'Int$ us a homomorphism (of monoids).
=ENDDOC
=THDOC
req_thm(⦏"z_ℤ_induction_thm"⦎, ([],
	⌜∀ p⦁	p ⓩ1⌝
	∧	(∀ i⦁ p i ⇒ p ⓩ~ i⌝)
	∧	(∀ i j⦁ p i ∧ p j ⇒ p ⓩi + j⌝)
	⇒	(∀ m⦁ p m)⌝));
=DESCRIBE
An induction principle for the integers: any property which holds for $1$, and
which is preserved under negation and addition, holds everywhere.
The theorem is stated in a mixture of HOL and Z suitable for use as an
argument to $gen\_induction\_tac$.
=ENDDOC
=THDOC
req_thm(⦏"z_ℕ_plus1_thm"⦎, ([],
	ⓩ∀ i : ℕ ⦁ i + 1 ∈ ℕ⌝));
=DESCRIBE
Closure of the natural numbers under addition of $1$.
=ENDDOC
=THDOC
req_thm(⦏"z_0_ℕ_thm"⦎, ([],
	ⓩ0 ∈ ℕ⌝));
=DESCRIBE
Zero is a natural number.
=ENDDOC
=THDOC
req_thm(⦏"z_ℕ_induction_thm"⦎, ([],
	⌜∀ p⦁ p ⓩ0⌝ ∧ (∀ i⦁ i ∈ ⓩℕ⌝ ∧ p i ⇒ p ⓩi + 1⌝) ⇒ (∀ m⦁ m ∈ ⓩℕ⌝ ⇒ p m)⌝));
=DESCRIBE
Ordinary induction for the natural numbers.
The theorem is stated in a mixture of HOL and Z suitable for use as an
argument to $gen\_induction\_tac1$.
=ENDDOC
=THDOC
req_thm(⦏"z_≤_induction_thm"⦎, ([],
	⌜∀ j : ℤ ⦁ ∀ p : ℤ → BOOL ⦁ p j
	∧	(∀ i : ℤ ⦁ ⓩj ≤ i⌝ ∧ p i ⇒ p ⓩi + 1⌝)
	⇒	(∀ m : ℤ ⦁ ⓩj ≤ m⌝ ⇒ p m)⌝));
=DESCRIBE
A more friendly induction principle for the integers.  The theorem is stated
as a mixture of HOL and Z to be used as an argument to $gen\_induction\_tac1$.
=ENDDOC
=THDOC
req_thm(⦏"z_cov_induction_thm"⦎, ([],
	⌜∀ (j:ℤ) (p:ℤ→BOOL) ⦁
	(∀ i ⦁ ⓩj ≤ i⌝ ∧ ⓩ∀ k : ℤ⦁ j ≤ k ∧ k < i ⇒ ⌜p k⌝⌝ ⇒ p i)
	⇒ (∀ i ⦁ ⓩj ≤ i⌝ ⇒ p i)⌝));
=DESCRIBE
A course of values induction theorem for the integers.  The theorem is stated
as a mixture of HOL and Z to be used as an argument to $gen\_induction\_tac1$.
=ENDDOC
=THDOC
req_thm(⦏"z_ℕ_plus_thm"⦎, ([],
	ⓩ∀ i, j : ℕ ⦁ i + j ∈ ℕ⌝));
=DESCRIBE
The natural numbers are closed under addition.
=ENDDOC
=THDOC
req_thm(⦏"z_ℤ_eq_thm"⦎, ([],
	ⓩ∀ i, j : 𝕌 ⦁ i = j ⇔ i + ~ j = 0⌝));
=DESCRIBE
Reduction of an equation between integers to one with the simplest
possible right-hand side. N.b. the theorem is intended for use
with
=INLINEFT
once_rewrite_tac
=TEX
, since repeated rewriting would loop.
=ENDDOC
=THDOC
req_thm(⦏"z_﹣_minus_thm"⦎, ([],
	ⓩ(﹣ _) = (~ _)⌝));
=DESCRIBE
The ISO Z style monadic minus symbol is identical with the ML-like monadic minus.
=ENDDOC
=THDOC
req_thm(⦏"z_minus_thm"⦎, ([],
	ⓩ∀ i, j : 𝕌 ⦁
		~ ~ i = i
	∧	i + ~ i = 0
	∧	~ i + i = 0
	∧	~ (i + j) = ~ i + ~ j
	∧	~ 0 = 0⌝));
=DESCRIBE
Standard facts about negation and addition. Rewriting with this moves negation inside
addition.
=ENDDOC
=THDOC
req_thm(⦏"z_minus_clauses"⦎, ([],
	ⓩ∀ i : 𝕌 ⦁ ~ ~ i = i ∧ ~ 0 = 0 ∧ i + ~ i = 0 ∧ ~ i + i = 0⌝));
=DESCRIBE
Facts about negation which are nearly always wanted as rewrite rules
for use in the proof context $z\_numbers$.
(This is like $z\_minus\_thm$, but with the equation which makes an
expansibe rewrite rule omitted.)
=ENDDOC
=THDOC
req_thm(⦏"z_ℕ_cases_thm"⦎, ([],
	ⓩ∀ i : ℕ ⦁ i = 0 ∨ (∃ j : ℕ ⦁ i = j + 1)⌝));
req_thm(⦏"z_ℕ_¬_minus_thm"⦎, ([],
	ⓩ∀ i : ℕ ⦁ i = 0 ∨ ¬ ~ i ∈ ℕ⌝));
=DESCRIBE
Case analyses for the natural numbers.
=ENDDOC
=THDOC
req_thm(⦏"z_¬_ℕ_thm"⦎, ([],
	ⓩ∀ i : 𝕌 ⦁ ¬ i ∈ ℕ ⇒ ~ i ∈ ℕ⌝));
=DESCRIBE
Integers which are not natural numbers are the negatives of natural numbers.
=ENDDOC
=THDOC
req_thm(⦏"z_ℤ_cases_thm"⦎, ([],
	ⓩ∀ i : 𝕌 ⦁ ∃ j : ℕ ⦁ i = j ∨ i = ~ j⌝));
req_thm(⦏"z_ℤ_cases_thm1"⦎, ([],
	ⓩ∀ i : 𝕌 ⦁ i ∈ ℕ ∨ (∃ j : ℕ ⦁ i = ~ (j + 1))⌝));
=DESCRIBE
Two forms of case analysis for the integers.
=ENDDOC
=THDOC
req_thm(⦏"z_ℕ_¬_plus1_thm"⦎, ([],
	ⓩ∀ i : ℕ ⦁ ¬ i + 1 = 0⌝));
=DESCRIBE
$1$ is not the additive inverse of any natural number.
=ENDDOC
=THDOC
req_thm(⦏"z_times_comm_thm"⦎, ([],
	ⓩ∀ i, j : 𝕌 ⦁ i * j = j * i⌝));
=DESCRIBE
Commutativity of multiplication.
=ENDDOC
=THDOC
req_thm(⦏"z_times_assoc_thm"⦎, ([],
	ⓩ∀ i, j, k : 𝕌 ⦁ (i * j) * k = i * (j * k)⌝));
req_thm(⦏"z_times_assoc_thm1"⦎, ([],
	ⓩ∀ i, j, k : 𝕌 ⦁ i * (j * k) = (i * j) * k⌝));
=DESCRIBE
Associativity of multiplication: first form moves brackets to the right;
second moves brackets to the left.
=ENDDOC
=THDOC
req_thm(⦏"z_times_order_thm"⦎, ([],
	ⓩ∀ i : 𝕌 ⦁ ∀ j, k : 𝕌 ⦁
	j * i = i * j ∧ (i * j) * k = i * (j * k) ∧ j * (i * k) = i * (j * k)⌝));
=DESCRIBE
Magic theorem for reordering products. If $i$ is specialised to $t$, rewriting
with the result floats $t$ to the beginning of the product.
=ENDDOC
=THDOC
req_thm(⦏"z_times1_thm"⦎, ([],
	ⓩ∀ i : 𝕌 ⦁ i * 1 = i ∧ 1 * i = i⌝));
=DESCRIBE
1 is the identity for multiplication.
=ENDDOC
=THDOC
req_thm(⦏"z_times_plus_distrib_thm"⦎, ([],
	ⓩ∀ i, j, k : 𝕌 ⦁ i * (j + k) = i * j + i * k ∧ (i + j) * k = i * k + j * k⌝));
=DESCRIBE
Multiplication is distributive over addition. Rewriting with this expands
all subterms of the form
=INLINEFT
t1*(t2 + t3)
=TEX
\ or
=INLINEFT
(t1 + t2)*t3
=TEX
.
=ENDDOC
=THDOC
req_thm(⦏"z_times0_thm"⦎, ([],
	ⓩ∀ i : 𝕌 ⦁ 0 * i = 0 ∧ i * 0 = 0⌝));
req_thm(⦏"z_times_eq_0_thm"⦎, ([],
	ⓩ∀ i, j : 𝕌 ⦁ i * j = 0 ⇔ i = 0 ∨ j = 0⌝));
=DESCRIBE
0 is an annihilator of any element, and moreover, by the second theorem
it is the only annihilator of any element apart from itself.
=ENDDOC
=THDOC
req_thm(⦏"z_minus_times_thm"⦎, ([],
	ⓩ∀ i, j : 𝕌 ⦁ ~ i * j = ~ (i * j) ∧ i * ~ j = ~ (i * j) ∧ ~ i * ~ j = i * j⌝));
=DESCRIBE
Standard facts about negation and multiplication.
Rewriting with this moves negation outside multiplication.
=ENDDOC
=THDOC
req_thm(⦏"z_times_clauses"⦎, ([],
	ⓩ∀ i, j : 𝕌 ⦁ 0 * i = 0 ∧ i * 0 = 0 ∧ i * 1 = i ∧ 1 * i = i⌝));
=DESCRIBE
Ubiquitously useful facts about multiplication.
=ENDDOC
=THDOC
req_thm(⦏"z_ℕ_times_thm"⦎, ([],
	ⓩ∀ i, j : ℕ ⦁ i * j ∈ ℕ⌝));
=DESCRIBE
The natural numbers are closed under multiplication.
=ENDDOC
=THDOC
req_thm(⦏"z_≤_trans_thm"⦎, ([],
	ⓩ∀ i, j, k : 𝕌 | i ≤ j ∧ j ≤ k ⦁ i ≤ k⌝));
req_thm(⦏"z_≤_cases_thm"⦎, ([],
	ⓩ∀ i, j : 𝕌 ⦁ i ≤ j ∨ j ≤ i⌝));
req_thm(⦏"z_≤_refl_thm"⦎, ([],
	ⓩ∀ i : 𝕌 ⦁ i ≤ i⌝));
req_thm(⦏"z_≤_antisym_thm"⦎, ([],
	ⓩ∀i, j : 𝕌 | i ≤ j ∧ j ≤ i ⦁ i = j⌝));
=DESCRIBE
≤ is transitive, reflexive, antisymmetric and total.
=ENDDOC
=THDOC
req_thm(⦏"z_less_trans_thm"⦎, ([],
	ⓩ∀ i, j, k : 𝕌 | i < j ∧ j < k ⦁ i < k⌝));
req_thm(⦏"z_less_irrefl_thm"⦎, ([],
	ⓩ∀ i, j : 𝕌 ⦁ ¬ (i < j ∧ j < i)⌝));
=DESCRIBE
$<$ is transitive and irreflexive.
=ENDDOC
=THDOC
req_thm(⦏"z_less_plus1_thm"⦎, ([],
	ⓩ∀ m, n : 𝕌 ⦁ m < n + 1 ⇔ m = n ∨ m < n⌝));
=DESCRIBE
Simple fact about $<$.
=ENDDOC
=THDOC
req_thm(⦏"z_≤_less_eq_thm"⦎,([],
	ⓩ∀ x, y : 𝕌 ⦁ x ≤ y ⇔ (x < y ∨ x = y)⌝));
=DESCRIBE
The natural definition of $≤$ in terms of $<$.
=ENDDOC
=THDOC
req_thm(⦏"z_less_≤_trans_thm"⦎, ([],
	ⓩ∀ i, j, k : 𝕌 | i < j ∧ j ≤ k ⦁ i < k⌝));
req_thm(⦏"z_≤_less_trans_thm"⦎, ([],
	ⓩ∀ i, j, k : 𝕌 | i ≤ j ∧ j < k ⦁ i < k⌝));
=DESCRIBE
Forms of ``transitivity'' in which
s strict and a non-strict inequality give a strict inequality.
=ENDDOC
=THDOC
req_thm(⦏"z_minus_ℕ_≤_thm"⦎, ([],
	ⓩ∀ i : 𝕌; j : ℕ ⦁ i + ~ j ≤ i⌝));
req_thm(⦏"z_≤_plus_ℕ_thm"⦎, ([],
	ⓩ∀ i : 𝕌; j : ℕ ⦁ i ≤ i + j⌝));
=DESCRIBE
Subtracting a natural number from any integer gives a smaller one,
and adding  a natural number to any integer gives a larger one.
=ENDDOC
=THDOC
req_thm(⦏"z_∈_ℕ_thm"⦎, ([],
	ⓩ∀ i : 𝕌 ⦁ i ∈ ℕ ⇔ 0 ≤ i⌝));
=DESCRIBE
The natural numbers are precisely those which are bounded below by $0$.
=ENDDOC
=THDOC
req_thm(⦏"z_≤_≤_0_thm"⦎, ([],
	ⓩ∀i, j : 𝕌 ⦁ i ≤ j ⇔ i + ~j ≤ 0⌝));
=DESCRIBE
Reduction of an inequality between integers to one with the simplest
possible right-hand side. N.b. the theorem is intended for use
with
=INLINEFT
once_rewrite_tac
=TEX
, since repeated rewriting would loop.

=ENDDOC
=THDOC
req_thm(⦏"z_≤_clauses"⦎, ([],
	ⓩ∀ i, j, k : 𝕌⦁	(i + k ≤ j + k ⇔ i ≤ j)
	 	∧	(k + i ≤ j + k ⇔ i ≤ j)
	 	∧	(i + k ≤ k + j ⇔ i ≤ j)
	 	∧	(k + i ≤ k + j ⇔ i ≤ j)
	 	∧	(i + k ≤ k ⇔ i ≤ 0)
	 	∧	(k + i ≤ k ⇔ i ≤ 0)
	 	∧	(i ≤ k + i ⇔ 0 ≤ k)
	 	∧	(i ≤ i + k ⇔ 0 ≤ k)
	 	∧	i ≤ i
	 	∧	¬ 1 ≤ 0
	 	∧	0 ≤ 1
⌝));
=DESCRIBE
Facts about ≤ of ubiquitous utility
=ENDDOC
=THDOC
req_thm(⦏"z_less_clauses"⦎, ([],
	ⓩ∀ i, j, k : 𝕌 ⦁	(i + k < j + k ⇔ i < j)
		∧	(k + i < j + k ⇔ i < j)
		∧	(i + k < k + j ⇔ i < j)
		∧	(k + i < k + j ⇔ i < j)
		∧	(i + k < k ⇔ i < 0)
		∧	(k + i < k ⇔ i < 0)
		∧	(i < k + i ⇔ 0 < k)
		∧	(i < i + k ⇔ 0 < k)
		∧	¬ i < i
		∧	0 < 1
		∧	¬ 1 < 0
⌝));
=DESCRIBE
Facts about $<$ of ubiquitous utility
=ENDDOC
=THDOC
req_thm(⦏"z_¬_≤_thm"⦎, ([], ⓩ∀ i, j : 𝕌 ⦁ ¬ i ≤ j ⇔ j < i⌝));
req_thm(⦏"z_¬_less_thm"⦎, ([], ⓩ∀ i, j : 𝕌 ⦁ ¬ i < j ⇔ j ≤ i⌝));
=DESCRIBE
Facts about < of ubiquitous utility
=ENDDOC
=THDOC
req_thm(⦏"z_abs_thm"⦎, ([],
	ⓩ∀ i : ℕ ⦁ abs i = i ∧ abs ~ i = i⌝));
req_thm(⦏"z_abs_ℕ_thm"⦎, ([],
	ⓩ∀ i : 𝕌 ⦁ abs i ∈ ℕ⌝));
req_thm(⦏"z_abs_eq_0_thm"⦎, ([],
	ⓩ∀ i : 𝕌 ⦁ abs i = 0 ⇔ i = 0⌝));
req_thm(⦏"z_abs_minus_thm"⦎, ([],
	ⓩ∀ i : 𝕌 ⦁ abs ~ i = abs i⌝));
req_thm(⦏"z_ℕ_abs_minus_thm"⦎, ([],
	ⓩ∀ i, j : ℕ | j ≤ i ⦁ abs (i + ~ j) ≤ i⌝));
req_thm(⦏"z_abs_times_thm"⦎, ([],
	ⓩ∀ i, j : 𝕌 ⦁ abs (i * j) = abs i * abs j⌝));
req_thm(⦏"z_abs_plus_thm"⦎, ([],
	ⓩ∀ i, j : 𝕌 ⦁ abs (i + j) ≤ abs i + abs j⌝));
=DESCRIBE
Standard properties of the absolute value function. The last of these is
commonly known as the {\em triangle inequality}.
=ENDDOC
=THDOC
req_thm(⦏"z_div_mod_unique_thm"⦎, ([],
	ⓩ
	∀ i, j, d, r : 𝕌
	|	¬ j = 0
	⦁		i = d * j + r ∧ 0 ≤ r ∧ r < abs j
		⇔	d = i div j ∧ r = i mod j⌝));
=DESCRIBE
The defining property of the division and modulo operations characterises
those operations.
=ENDDOC
=THDOC
req_thm(⦏"z_∈_ℕ⋎1_thm"⦎, ([],
	ⓩ∀ x:𝕌 ⦁ x ∈ ℕ⋎1 ⇔ 0 < x⌝));
=DESCRIBE
Positive integers.
=ENDDOC
=THDOC
req_thm(⦏"z_𝔽_thm"⦎, ([],
	ⓩ∀ X : 𝕌 ⦁
	𝔽 X = {S : ℙ X | ∃ n : ℕ ⦁ ∃ f : 1 .. n → S ⦁ ran f = S}⌝));
req_thm(⦏"z_𝔽⋎1_thm"⦎, ([],
	ⓩ∀ X : 𝕌 ⦁ 𝔽⋎1 X = (𝔽 X) \ {∅}⌝));
req_thm(⦏"z_𝔽_empty_thm"⦎, ([],
	ⓩ𝔽 {} = ℙ {}⌝));
=DESCRIBE
Finiteness
=ENDDOC
The next (big) step here is to prove a theorem of the form:
=GFT
⊢ ∀ x : 𝕌⦁ 𝔽 ⌜Z'Setd x⌝ = ℙ ⌜Z'Setd x⌝
=TEX
This is then the basis of a $z\_𝔽\_setd\_conv$.

=DOC
val ⦏z_∈_ℕ_thm⦎ : THM;			val ⦏z_¬_≤_thm⦎ : THM;
val ⦏z_¬_ℕ_thm⦎ : THM;			val ⦏z_¬_less_thm⦎ : THM;
val ⦏z_≤_≤_0_thm⦎ : THM;			val ⦏z_≤_antisym_thm⦎ : THM;
val ⦏z_≤_cases_thm⦎ : THM;			val ⦏z_≤_clauses⦎ : THM;
val ⦏z_≤_induction_thm⦎ : THM;		val ⦏z_≤_less_trans_thm⦎ : THM;
val ⦏z_≤_plus_ℕ_thm⦎ : THM;		val ⦏z_≤_refl_thm⦎ : THM;
val ⦏z_≤_trans_thm⦎ : THM;			val ⦏z_ℕ_¬_minus_thm⦎ : THM;
val ⦏z_ℕ_¬_plus1_thm⦎ : THM;		val ⦏z_ℕ_abs_minus_thm⦎ : THM;
val ⦏z_ℕ_cases_thm⦎ : THM;			val ⦏z_ℕ_induction_thm⦎ : THM;
val ⦏z_ℕ_plus1_thm⦎ : THM;			val ⦏z_ℕ_plus_thm⦎ : THM;
val ⦏z_ℕ_thm⦎ : THM;			val ⦏z_ℕ_times_thm⦎ : THM;
val ⦏z_ℤ_cases_thm⦎ : THM;			val ⦏z_ℤ_cases_thm1⦎ : THM;
val ⦏z_ℤ_eq_thm⦎ : THM;			val ⦏z_ℤ_induction_thm⦎ : THM;
val ⦏z_0_ℕ_thm⦎ : THM;			val ⦏z_abs_ℕ_thm⦎ : THM;
val ⦏z_abs_eq_0_thm⦎ : THM;		val ⦏z_abs_minus_thm⦎ : THM;
val ⦏z_abs_plus_thm⦎ : THM;		val ⦏z_abs_thm⦎ : THM;
val ⦏z_abs_times_thm⦎ : THM;		val ⦏z_cov_induction_thm⦎ : THM;
val ⦏z_div_mod_unique_thm⦎ : THM;	val ⦏z_int_homomorphism_thm⦎ : THM;
val ⦏z_less_≤_trans_thm⦎ : THM;		val ⦏z_less_clauses⦎ : THM;
val ⦏z_less_irrefl_thm⦎ : THM;		val ⦏z_less_trans_thm⦎ : THM;
val ⦏z_less_plus1_thm⦎ : THM;
val ⦏z_minus_ℕ_≤_thm⦎ : THM;		val ⦏z_minus_clauses⦎ : THM;
val ⦏z_minus_thm⦎ : THM;			val ⦏z_minus_times_thm⦎ : THM;
val ⦏z_﹣_minus_thm⦎ : THM;
val ⦏z_plus0_thm⦎ : THM;			val ⦏z_plus_assoc_thm⦎ : THM;
val ⦏z_plus_assoc_thm1⦎ : THM;		val ⦏z_plus_clauses⦎ : THM;
val ⦏z_plus_comm_thm⦎ : THM;		val ⦏z_plus_cyclic_group_thm⦎ : THM;
val ⦏z_plus_minus_thm⦎ : THM;		val ⦏z_plus_order_thm⦎ : THM;
val ⦏z_times0_thm⦎ : THM;			val ⦏z_times1_thm⦎ : THM;
val ⦏z_times_assoc_thm⦎ : THM;		val ⦏z_times_assoc_thm1⦎ : THM;
val ⦏z_times_clauses⦎ : THM;		val ⦏z_times_comm_thm⦎ : THM;
val ⦏z_times_eq_0_thm⦎ : THM;		val ⦏z_times_order_thm⦎ : THM;
val ⦏z_times_plus_distrib_thm⦎ : THM;	val ⦏z_≤_less_eq_thm⦎ : THM;
val ⦏z_𝔽_thm⦎ : THM;				val ⦏z_𝔽⋎1_thm⦎ : THM;
val ⦏z_𝔽_empty_thm⦎ : THM;			val ⦏z_∈_ℕ⋎1_thm⦎ : THM;
=DESCRIBE
These are the ML value bindings for the theorems saved in the theory
=INLINEFT
z_numbers
=TEX
.
=ENDDOC

\section{DEFINITIONS}
=DOC
val ⦏z_ℤ_def⦎ : THM;					val ⦏z_ℕ_def⦎ : THM;
val ⦏z_arith_def⦎ : THM;				val ⦏z_inequality_def⦎ : THM;
val ⦏z_ℕ⋎1_def⦎ : THM;				val ⦏z_succ_def⦎ : THM;
val ⦏z_iter_def⦎ : THM;				val ⦏z_dot_dot_def⦎ : THM;
val ⦏z_𝔽_def⦎ : THM;					val ⦏z_𝔽⋎1_def⦎ : THM;
val ⦏z_hash_def⦎ : THM;				val ⦏z_⇻_def⦎ : THM;
val ⦏z_⤕_def⦎ : THM;					val ⦏z_min_def⦎ : THM;
val ⦏z_max_def⦎ : THM;				val ⦏z'int_def⦎ : THM
=DESCRIBE
These are the ML bindings of the definitions of the theory $z\_numbers$.
=ENDDOC
\section{TACTICS}
=DOC
val ⦏z_ℕ_induction_tac⦎ : TACTIC
=DESCRIBE
This tactic implements induction over the natural numbers in Z:
to prove
=INLINEFT
x ∈ ℕ ⇒ t
=TEX
, it suffices to prove $t[0/x]$ and to prove $t[x+1/x]$ on the
assumption that $t$. The conclusion of the goal must have the
form
=INLINEFT
x ∈ ℕ ⇒ t
=TEX
.
=FRULE 2 Tactic
z_ℕ_induction_tac
├
{ Γ } x ∈ ℕ ⇒ t
├
{ Γ } t[0/x] ; strip{t, Γ} t[x+1/x]
=TEX
=SEEALSO
=INLINEFT
z_ℤ_cases_thm
=TEX
,
=INLINEFT
z_intro_∀_tac
=TEX
,
=INLINEFT
z_ℤ_induction_tac
=TEX
,

=INLINEFT
z_≤_induction_tac
=TEX
,
=INLINEFT
z_cov_induction_tac
=TEX
=FAILUREC
\paragraph{Errors} As for $gen\_induction\_tac1$.
=ENDDOC
=DOC
val ⦏z_ℤ_induction_tac⦎ : TERM -> TACTIC
=DESCRIBE
An induction-like tactic for the integers, based on the fact
that any subset of the integers containing $1$ and closed under
negation and addition must contain every integer.
=TEX
=FRULE 2 Tactic
z_ℤ_induction_tac ⓩx⌝
├
{ Γ } t
├
{ Γ } t[1/x] ;
strip{t[i/x], Γ} t[~i/x] ;
strip{t[i/x] ∧ t[j/x], Γ} t[i+j/x]
=TEX
=SEEALSO
=INLINEFT
z_ℤ_cases_thm
=TEX
,
=INLINEFT
z_intro_∀_tac
=TEX
,
=INLINEFT
z_ℕ_induction_tac
=TEX
,

=INLINEFT
z_≤_induction_tac
=TEX
,
=INLINEFT
z_cov_induction_tac
=TEX
=FAILUREC
\paragraph{Errors} As for $gen\_induction\_tac$.
=ENDDOC
=DOC
val ⦏z_≤_induction_tac⦎ : TERM -> TACTIC
=DESCRIBE
An induction tactic for a subset of the integers.  To prove
=INLINEFT
j≤x ⇒ t
=TEX
, it suffices to prove $t[j/x]$ and to prove $t[x+1/x]$ on the
assumptions $t$ and $j≤x$.  The term argument must be a variable
of type ⓣℤ⌝ and must appear free in the conclusion of the goal.
It must also appear once, and only once in the assumptions, in an
assumption of the form $j≤x$.
=FRULE 2 Tactic
z_≤_induction_tac ⓩx⌝
├
{ Γ, j≤x} t[x]
├
{ Γ, j≤x} t[j/x] ; strip {t[x], j≤x, Γ} t[x+1]
=TEX
=SEEALSO
=INLINEFT
z_ℤ_cases_thm
=TEX
,
=INLINEFT
z_intro_∀_tac
=TEX
,
=INLINEFT
z_ℕ_induction_tac
=TEX
,

=INLINEFT
z_ℤ_induction_tac
=TEX
,
=INLINEFT
z_cov_induction_tac
=TEX
=FAILURE
86401	?0 is not a variable of type ⓣℤ⌝
86402	A term of the form ⓩj ≤ i⌝ where i is the induction variable
	could not be found in the assumptions
86403	?0 appears free in more than one assumption of the goal
86404	?0 does not appear free in the conclusions of the goal
=ENDDOC
=DOC
val ⦏z_cov_induction_tac⦎ : TERM -> TACTIC
=DESCRIBE
A course of values induction tactic for a subset of the integers.
To prove
=INLINEFT
j≤x ⇒ t
=TEX
, it suffices to prove $t[i/x]$ on the assumptions that $j≤i$ and
=INLINEFT
∀k ⦁ j≤k ∧ k<i ⇒ t[k/x]
=TEX
.

(Course of values induction is sometimes called complete induction.)
The term argument must appear free in the conclusion of the goal.
It must also appear once, and only once, in the assumptions, in an
assumption of the form $j≤x$.
=FRULE 2 Tactic
z_cov_induction_tac ⓩx⌝
├
{ Γ, j≤x} t[x]
├
{ Γ, j≤x} t[j/x] ;
strip {j≤i, ⓩ∀k⦁ j≤k ∧ k<x ⇒ t[k]⌝, Γ} t[x]
=TEX
=SEEALSO
=INLINEFT
z_ℤ_cases_thm
=TEX
,
=INLINEFT
z_intro_∀_tac
=TEX
,
=INLINEFT
z_ℕ_induction_tac
=TEX
,

=INLINEFT
z_ℤ_induction_tac
=TEX
,
=INLINEFT
z_≤_induction_tac
=TEX
=FAILUREC
\paragraph{Errors} As for $z\_≤\_induction\_tac$.
=ENDDOC
\section{SYNTAX FUNCTIONS}
=DOC
val ⦏dest_z_≤⦎ : TERM -> TERM * TERM;
val ⦏dest_z_≥⦎ : TERM -> TERM * TERM;
val ⦏dest_z_abs⦎ : TERM -> TERM;
val ⦏dest_z_div⦎ : TERM -> TERM * TERM;
val ⦏dest_z_greater⦎ : TERM -> TERM * TERM;
val ⦏dest_z_less⦎ : TERM -> TERM * TERM;
val ⦏dest_z_minus⦎ : TERM -> TERM;
val ⦏dest_z_mod⦎ : TERM -> TERM * TERM;
val ⦏dest_z_plus⦎ : TERM -> TERM * TERM;
val ⦏dest_z_signed_int⦎ : TERM -> INTEGER;
val ⦏dest_z_subtract⦎ : TERM -> TERM * TERM;
val ⦏dest_z_times⦎ : TERM -> TERM * TERM;
=DESCRIBE
These are derived destructor
functions for the Z basic arithmetic operations.
An optionally signed integer literal, $signed\_int$, is taken to be either a numeric
literal or the result of applying
=INLINEFT
(~_)
=TEX
\ to a numeric literal. The other constructors correspond directly
to the arithmetic operations of the theory $z\_numbers$ with alphabetic
names assigned to give a valid ML name as needed
($greater: >$,
$less: <$,
=INLINEFT
minus: ~
=TEX
,
$plus: +$,
$subtract: -$,
$times: *$).

As usual, there are also corresponding discriminator ($is\_\ldots$) and
constructor functions ($mk\_\ldots$).
For programming convenience, $dest\_z\_signed\_int$ returns $0$  and
$is\_z\_signed\_int$ returns $true$ when
applied to
=INLINEFT
~0
=TEX
, but $mk\_z\_signed\_int$ cannot be used to construct such a term.
=FAILURE
86101	?0 is not of the form ⓩi ≤ j⌝
86102	?0 is not of the form ⓩi ≥ j⌝
86103	?0 is not of the form ⓩabs i⌝
86104	?0 is not of the form ⓩi div j⌝
86105	?0 is not of the form ⓩi > j⌝
86106	?0 is not of the form ⓩi < j⌝
86107	?0 is not of the form ⓩ~i⌝
86108	?0 is not of the form ⓩi mod j⌝
86109	?0 is not of the form ⓩi + j⌝
86110	?0 is not an optionally signed integer literal
86111	?0 is not of the form ⓩi - j⌝
86112	?0 is not of the form ⓩi * j⌝
=ENDDOC

=DOC
val ⦏is_z_≤⦎ : TERM -> bool;
val ⦏is_z_≥⦎ : TERM -> bool;
val ⦏is_z_abs⦎ : TERM -> bool;
val ⦏is_z_div⦎ : TERM -> bool;
val ⦏is_z_greater⦎ : TERM -> bool;
val ⦏is_z_less⦎ : TERM -> bool;
val ⦏is_z_minus⦎ : TERM -> bool;
val ⦏is_z_mod⦎ : TERM -> bool;
val ⦏is_z_plus⦎ : TERM -> bool;
val ⦏is_z_signed_int⦎ : TERM -> bool;
val ⦏is_z_subtract⦎ : TERM -> bool;
val ⦏is_z_times⦎ : TERM -> bool;
=DESCRIBE
These are derived discriminator
functions for the Z basic arithmetic operations.
See the documentation for the destructor functions ($dest\_z\_plus$ etc.)
for more information.
=ENDDOC

=DOC
val ⦏mk_z_≤⦎ : TERM * TERM -> TERM;
val ⦏mk_z_≥⦎ : TERM * TERM -> TERM;
val ⦏mk_z_abs⦎ : TERM -> TERM;
val ⦏mk_z_div⦎ : TERM * TERM -> TERM;
val ⦏mk_z_greater⦎ : TERM * TERM -> TERM;
val ⦏mk_z_less⦎ : TERM * TERM -> TERM;
val ⦏mk_z_minus⦎ : TERM -> TERM;
val ⦏mk_z_mod⦎ : TERM * TERM -> TERM;
val ⦏mk_z_plus⦎ : TERM * TERM -> TERM;
val ⦏mk_z_signed_int⦎ : INTEGER -> TERM;
val ⦏mk_z_subtract⦎ : TERM * TERM -> TERM;
val ⦏mk_z_times⦎ : TERM * TERM -> TERM;
=DESCRIBE
These are derived constructor
functions for the Z basic arithmetic operations.
See the documentation for the destructor functions ($dest\_z\_plus$ etc.)
for more information.
=FAILURE
86201	?0 does not have type ℤ
=ENDDOC

\section{CONVERSIONS}
=DOC
val ⦏z_ℕ_plus_conv⦎ : CONV;		val ⦏z_ℕ_times_conv⦎ : CONV;

val ⦏z_subtract_minus_conv⦎ : CONV;	val ⦏z_greater_less_conv⦎ : CONV
val ⦏z_≥_≤_conv⦎ : CONV;			val ⦏z_∈_ℕ_conv⦎ : CONV;

val ⦏z_plus_conv⦎ : CONV;			val ⦏z_times_conv⦎ : CONV
val ⦏z_abs_conv⦎ : CONV;			val ⦏z_div_conv⦎ : CONV
val ⦏z_mod_conv⦎ : CONV;			val ⦏z_≤_conv⦎ : CONV
val ⦏z_less_conv⦎ : CONV			val ⦏z_ℤ_eq_conv⦎ : CONV
=DESCRIBE
These conversions are used to perform evaluation of arithmetic expressions involving
numeric literal operands. The normal interface to the conversion is
via the proof context $'z\_numbers$ and other proof contexts which contain
it.

The first block above gives conversions to evaluate
expressions of the form $i\,op\,j$ where
$i$ and $j$ are numeric literals and $op$ is one of $+$ or $*$.
The second block gives conversions to transform terms of the form
$i\,-\,j$, $i\,>\,j$, $i\,>\,j$ and $i\,∈\,ℕ$ into
=INLINEFT
i + ~j
=TEX
, \ $j\,<\,i$, $j\,≤\,i$ and $0\,≤\,i$
respectively. The third block give conversions which evaluate
expressions of the form $i\,op\,j$ or $abs\,i$, where $op$ is
one of $+$, $*$, $div$, $mod$, $≤$, $<$, or $=$, and where $i$
and $j$ are signed integer literals (i.e., either numeric literals or of the form
=INLINEFT
~k
=TEX
, where $k$ is a numeric literal).
Thus the second block of conversions transform expressions
of the form $i\,-\,j$, $i\,>\,j$, $i\,≥\,j$ and $i\,∈\,ℕ$ into a form which
can be evaluated by the conversions in the third block if $i$ and $j$ are
signed literals.

=FAILURE
86301	?0 is not of the form ?1 where ⓩi⌝ and ⓩj⌝ are numeric literals
86302	?0 is not of the form ?1
86303	?0 is not of the form ?1 where ⓩi⌝ and ⓩj⌝ are optionally signed
	numeric literals
=ENDDOC
=DOC
val ⦏z_simple_dot_dot_conv⦎ : CONV;
val ⦏z_∈_dot_dot_conv⦎ : CONV;
=DESCRIBE
The first of these two conversions simplifies certain $dots$
terms,
the second, given a membership of a $dodts$ expression,
first tries the simplifications, and
whether or not that succeeds, expands the membership.
=FRULE 1 Conversion
z_simple_dot_dot_conv
ⓩx .. x⌝
├
├
⊢ (x .. x) = {x}
=TEX
and
=FRULE 1 Conversion
z_simple_dot_dot_conv
ⓩn1 .. n2⌝
├
├
⊢ (n1 .. n2) = {}
=TEX
where $n1$ is a numeric literal less than the numeric literal $n2$.

=FRULE 1 Conversion
z_∈_dot_dot_conv
ⓩx ∈ y .. y⌝
├
├
⊢ x ∈ y .. y ⇔ x = y
=TEX
=FRULE 1 Conversion
z_∈_dot_dot_conv
ⓩx ∈ n1 .. n2⌝
├
├
⊢ x ∈ n1 .. n2 ⇔ false
=TEX
where $n1$ is a numeric literal less than the numeric literal $n2$.
=FRULE 1 Conversion
z_∈_dot_dot_conv
ⓩx ∈ low .. high⌝
├
├
⊢ x ∈ low .. high ⇔ low ≤ x ∧ x ≤ high
=SEEALSO
=INLINEFT
z_dot_dot_conv
=FAILURE
86001	?0 is not of the form: ⓩlow .. high⌝ where the
	expresion can be simplified
86002	?0 is not of the form: ⓩx ∈ low .. high⌝
=ENDDOC
\section{PROOF CONTEXTS}
=DOC
(* Proof Context: ⦏'z_numbers⦎ *)
=DESCRIBE
A component proof context for handling the basic arithmetic operations
for Z.

Expressions and predicates treated by this proof context are constructs formed from:
=GFT
+, *, -, abs, div, mod, ℤ, ≤, <, ≥, >, =, ℕ
=TEX

\paragraph{Contents}\

Rewriting:
=GFT
z_plus_conv, z_times_conv, z_subtract_minus_conv
z_abs_conv, z_div_conv, z_mod_conv
z_ℤ_eq_conv, z_≤_conv, z_less_conv
z_≥_≤_conv, z_greater_less_conv, z_∈_ℕ_conv
z_plus_clauses, z_minus_clauses, z_≤_clauses
z_less_clauses, z_¬_≤_thm, z_¬_less_thm,
z_∈_ℕ⋎1_thm, simple_z_dot_conv, z_∈_dot_dot_conv,
z_﹣_minus_thm
=TEX
Stripping theorems:
=GFT
z_ℤ_eq_conv, z_≤_conv, z_less_conv
z_≥_≤_conv, z_greater_less_conv, z_∈_ℕ_conv
z_plus_clauses, z_minus_clauses, z_≤_clauses
z_less_clauses, z_∈_ℕ⋎1_thm, z_∈_dot_dot_conv
and all the above pushed through ¬

z_¬_≤_thm, z_¬_less_thm, z_≤_conv, z_less_conv
=TEX

Stripping conclusions: as for stripping theorems.

Rewriting canonicalisation: blank.

$𝕌$-simplification:
=GFT
⊢ ℤ = 𝕌
=TEX
Automatic proof procedures: $z\-\_basic\-\_prove\-\_tac$,
$z\-\_basic\-\_prove\-\_conv$.

Automatic existence prover: blank.
=SEEALSO
Proof context $'z_numbers1$
=ENDDOC
Should evaluable arithmetic expressions on one or both sides of a stripped equation
be evaluated during stripping?
=DOC
(* Proof Context: ⦏'z_numbers1⦎ *)
=DESCRIBE
A component proof context for handling the basic arithmetic operations
for Z.
It is distinct from $'z_numbers$ by its normalising all inequalities to $≤$.

Expressions and predicates treated by this proof context are constructs formed from:
=GFT
+, *, -, abs, div, mod, ℤ, ≤, <, ≥, >, =, ℕ
=TEX

\paragraph{Contents}\

Rewriting:
=GFT
z_plus_conv, z_times_conv, z_subtract_minus_conv
z_abs_conv, z_div_conv, z_mod_conv
z_ℤ_eq_conv, z_≤_conv, z_less_conv
z_≥_≤_conv, z_greater_less_conv, z_∈_ℕ_conv
z_plus_clauses, z_minus_clauses, z_≤_clauses
z_less_clauses, z_¬_less_thm,
z_∈_ℕ⋎1_thm, z_simple_dot_dot_conv, z_∈_dot_dot_conv,
conv_rule (ONCE_MAP_C eq_sym_conv) z_¬_≤_thm
=TEX
The final conversion to $<$ to $≤$ will only occur if no other rewriting applies.

Stripping theorems:
=GFT
z_ℤ_eq_conv, z_≤_conv, z_less_conv
z_≥_≤_conv, z_greater_less_conv, z_∈_ℕ_conv
z_plus_clauses, z_minus_clauses, z_≤_clauses
z_less_clauses, z_∈_ℕ⋎1_thm, z_∈_dot_dot_conv
and all the above pushed through ¬

z_¬_less_thm, z_≤_conv, z_less_conv,
conv_rule (ONCE_MAP_C eq_sym_conv) z_¬_≤_thm
=TEX

Stripping conclusions: as for stripping theorems.

Rewriting canonicalisation: blank.

$𝕌$-simplification:
=GFT
⊢ ℤ = 𝕌
=TEX
Automatic proof procedures: $z\-\_basic\-\_prove\-\_tac$,
$z\-\_basic\-\_prove\-\_conv$.

Automatic existence prover: blank.
=ENDDOC
\section{EPILOGUE}
=SML
end (* of signature ZNumbers *);
=SML
reset_flag "z_type_check_only";
reset_flag "z_use_axioms";
=TEX

\section{TEST POLICY}
The module tests for this module are to follow the guidelines
laid down in the quality plan~\cite{DS/FMU/IED/PLN008}.

\twocolumn[\section{INDEX}] \label{Index}

\footnotesize
\printindex

\onecolumn

\end{document}

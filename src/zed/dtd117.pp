=IGN
********************************************************************************
dtd117.doc: this file is part of the PPZed system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
=TEX
\documentclass[a4paper,12pt]{article}

%%%%% YOU CAN ADD OTHER PACKAGES AS NEEDED BELOW:
\usepackage{A4}
\usepackage{Lemma1}
\usepackage{ProofPower}
\usepackage{epsf}
\makeindex

\def\Title{ Detailed Design of the Z Library Real Numbers }

\def\Abstract{\begin{center}
{\bf Abstract}\par\parbox{0.7\hsize}
{\small This document gives the detailed design for the theory
of real numbers in \ProductZ.}
\end{center}}

\def\Reference{LEMMA1/HOL/DTD117}

\def\Author{R.D. Arthan}

\def\EMail{{\tt rda@lemma-one.com}}

\def\Phone{+44 118 958 4409}

\def\Fax{+44 118 956 1920}

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

\begin{document}
\headsep=0mm
\FrontPage
\headsep=10mm

%%%%% STANDARD RED-TAPE SECTIONS (MAY WANT TO INTERLEAVE SOME \newpage COMMANDS IN THESE)

%%%%% CONTENTS:

\subsection{Contents}

\tableofcontents

%%%%% REFERENCES:

\newpage
\subsection{References}

\bibliographystyle{fmu}

%%%%% CHANGE THE FOLLOWING AS NECESSARY (E.G., TO PICK UP daz.bib):
{\raggedright
\bibliography{fmu}
}
%%%%% CHANGES HISTORY:
\subsection{Changes History}
\begin{description}
\item[Issue 1.1 (2000/12/08)-1.3 (2000/12/13)] Initial development drafts.
\item[Issue 1.4 (2001/05/28)] Corrected errors in theorems about associativity and multiplication and
some improvements to the treatment of unary negation in the proof contexts.
\item[Issue 1.5 (2001/07/02)] Revisions after module testing.
\item[Issue 1.6 (2001/08/29)] Corrected over-strong definition of exponentiation.
\item[Issue 1.7 (2002/01/23)] Renaming of ML bindings for theorems about division.
\item[Issue 1.8 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.9 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.10 (2004/01/19)] The Z universal set is now called 𝕌.
\item[Issue 1.11 (2005/02/26)] Precedences and associativity of toolkit operators now follow \cite{ISO02}.
\item[Issue 1.12 (2005/08/01)] Allowed for new associativity of division in statement of
=INLINEFT
z_ℝ_over_clauses
=TEX
.
\item[Issue 1.13 (2006/04/20)] Added support for floating point literals
\item[Issue 1.14 (2006/04/28)] The proof context now normalises literal fractions.
\item[Issue 1.15 (2006/05/08)] Corrected documentation errors.
\item[Issue 1.16 (2006/10/18)] Fixed typo.
\item[Issue 1.17 (2007/11/22)] Added lower bounds, greatest lower, upper bounds and least upper bounds.
\item[Issue 1.18 (2008/02/10)] Allowed for changes to lexical rules for underscores.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

%%%% END OF CHANGES HISTORY %%%%
\end{description}

%%%%%  CHANGES FORECAST:

\subsection{Changes Forecast}

None.

%%%%% DISTRIBUTION LIST

\subsection{Distribution}

Lemma 1 build system.

\newpage

\section{Introduction}
\subsection{Scope}
This document contains the detailed design
of the Z Library theory of real numbers and their proof support.
The high level design for this material is given in \cite{DS/FMU/IED/HLD017}.


\subsection{Purpose and Background}
See \cite{DS/FMU/IED/HLD011}.


\section{PREAMBLE}
=SML
open_theory"z_numbers";
push_pc "z_sets_alg";
delete_theory"z_reals" handle Fail _ => ();
set_flag ("z_type_check_only", false);
set_flag ("z_use_axioms", true);
new_theory"z_reals";
new_parent"ℝ";
=TEX
\section {DEFINITION OF FIXITY}

The following is in the spirit of \cite{ISO02} as regards precedences and associativity.
\cite{ISO02} does not define all of these operators.

ⓈZ
function 20 leftassoc _ ..⋎R _
■

ⓈZ
function 30 leftassoc _ +⋎R _, _ -⋎R _
■

ⓈZ
function 40 leftassoc _ *⋎R _, _ /⋎R _, _ /⋎Z _
■

ⓈZ
function 50 ~⋎R _
■
ⓈZ
function 50 abs⋎R _
■
Exponentiation is necessarily right-associative.

ⓈZ
function 60 rightassoc _ ^⋎Z _
■

ⓈZ
relation _ <⋎R _, _ ≤⋎R _, _ ≥⋎R _, _ >⋎R _
■

ⓈZ
relation _ lb⋎R _, _ ub⋎R _
■

\section{THE REAL NUMBERS}

\subsection{The Numbers and their Basic Operators}

We need to break out into extended Z to define the reals and their operators.
=SML
val _ = set_flag("standard_z_paras", false);
=TEX
ⓈZ
ℝ ≜ 𝕌[⌜Totality:ℝ SET⌝]
■
Now we define the ordering properties of the real numbers.
=TEX

We characterise the main operators as being the same as the HOL ones:
ⓈZAX
│ ⦏_ <⋎R _⦎ : ℝ ↔ ℝ ;
│ ⦏_ ≤⋎R _⦎ : ℝ ↔ ℝ ;
│ ⦏~⋎R _⦎  : ℝ → ℝ ;
│ ⦏_ +⋎R _⦎ : ℝ × ℝ → ℝ ;
│ ⦏_ *⋎R _⦎ : ℝ × ℝ → ℝ ;
│ ⦏_ /⋎R _⦎ : ℝ × ℝ → ℝ ;
│ ⦏abs⋎R _⦎ : ℝ → ℝ
├─────────────────────────────
│	∀x, y: ℝ⦁ x <⋎R y ⇔ ⌜x <⋎R y⌝ ;
│	∀x, y: ℝ⦁ x ≤⋎R y ⇔ ⌜x ≤⋎R y⌝ ;
│	∀x: ℝ⦁ ~⋎R x = ⌜~⋎R x⌝ ;
│	∀x, y: ℝ⦁ x +⋎R y = ⌜x +⋎R y⌝ ;
│	∀x, y: ℝ⦁ x *⋎R y = ⌜x *⋎R y⌝ ;
│	∀x, y: ℝ⦁ x /⋎R y = ⌜x /⋎R y⌝ ;
│	∀x: ℝ⦁ abs⋎R x = ⌜Abs⋎R x⌝
■
ⓈZAX
│ ⦏_ >⋎R _⦎ : ℝ ↔ ℝ ;
│ ⦏_ ≥⋎R _⦎ : ℝ ↔ ℝ ;
│ ⦏_ -⋎R _⦎ : ℝ × ℝ → ℝ
├─────────────────────────────
│	∀x, y: ℝ⦁ x >⋎R y ⇔ y <⋎R x ;
│	∀x, y: ℝ⦁ x ≥⋎R y ⇔ y ≤⋎R x ;
│	∀x, y: ℝ⦁ x -⋎R y = x +⋎R ~⋎R y
■

Conversion of integers to reals:
ⓈZAX
│	⦏real⦎: ℤ → ℝ
├─────────────────────────────
│	real 1 = ⌜ℕℝ 1⌝
│∧	(∀i: ℤ⦁ real (~i) = ~⋎R (real i))
│∧	(∀i, j: ℤ⦁ real (i + j) = real i +⋎R real j)
■

Division (of one integer by another):
ⓈZAX
│	⦏_ /⋎Z _⦎: ℤ × ℤ → ℝ
├─────────────────────────────
│	∀i, j : ℤ⦁ i /⋎Z j = real i /⋎R real j
■

=TEX
Exponentiation (with integer exponents):

ⓈZAX
│	⦏_ ^⋎Z _⦎: ℝ × ℤ → ℝ
├─────────────────────────────
│	⌜∀x m⦁ ⓩx ^⋎Z ⌜Z'Int m⌝⌝ = x ^⋎N m⌝
│∧	⌜∀x m⦁ ⓩx ^⋎Z ~ ⌜Z'Int (m+1)⌝⌝ =  ℕℝ 1 /⋎R (x ^⋎N (m+1))⌝
■
=TEX
Interval:

ⓈZAX
│	⦏_ ..⋎R _⦎: ℝ × ℝ → ℙ ℝ
├─────────────────────────────
│	∀x, y : ℝ⦁x ..⋎R y = { t : ℝ | x ≤⋎R t ≤⋎R y }
■
=TEX
Lower bounds:

ⓈZAX
│ _ ⦏lb⋎R⦎ _: ℝ ↔ ℙ ℝ
├──────
│ ∀ r: ℝ; sr: ℙ ℝ⦁
│   r lb⋎R sr ⇔ (∀ x:sr⦁ r ≤⋎R x)
■
=TEX
Greatest lower bounds:

ⓈZAX
│ ⦏glb⋎R⦎: ℙ ℝ ⇸ ℝ
├──────
│ ∀ sr: ℙ ℝ; glb: ℝ⦁
│  (sr ↦ glb) ∈ glb⋎R ⇔
│   glb lb⋎R sr ∧ (∀lb: ℝ | lb lb⋎R sr⦁ lb ≤⋎R glb)
■
=TEX
Upper bounds:

ⓈZAX
│ _ ⦏ub⋎R⦎ _: ℝ ↔ ℙ ℝ
├──────
│ ∀ r: ℝ; sr: ℙ ℝ⦁
│   r ub⋎R sr ⇔ (∀ x:sr⦁ r ≥⋎R x)
■
=TEX
Least upper bounds:

ⓈZAX
│ ⦏lub⋎R⦎: ℙ ℝ ⇸ ℝ
├──────
│ ∀ sr: ℙ ℝ; lub: ℝ⦁
│  (sr ↦ lub) ∈ lub⋎R ⇔
│   lub ub⋎R sr ∧ (∀ub: ℝ | ub ub⋎R sr⦁ ub ≥⋎R lub)
■


=TEX
Semantic constant for floating point literals:

ⓈHOLCONST
│	⦏Z'Float⦎ : ℤ → ℤ → ℤ → ℝ
├───────────────────────────────
│∀ m p e⦁ Z'Float m p e = ⓩreal m *⋎R (real 10 ^⋎Z (e + ~p))⌝
■
=THDOC
req_name ⦏"z_reals"⦎ (Value "z_numbers");
req_parent"ℝ";
req_language "Z";
set_flag("tc_thms_only",true);
=DESCRIBE
The theory $z\_reals$ contains the theory of real numbers for Z.
Standard ML bindings for the theory are contained in the structure {\it ZReals}..
=ENDDOC

=TEX
\section{THEOREMS}
=THDOC
req_thm(⦏"z_ℝ_unbounded_below_thm"⦎, ([], ⓩ ∀ x : ℝ ⦁ ∃ y : ℝ ⦁ y <⋎R x⌝));
req_thm(⦏"z_ℝ_unbounded_above_thm"⦎, ([], ⓩ ∀ x : ℝ ⦁ ∃ y : ℝ ⦁ x <⋎R y⌝));
req_thm(⦏"z_ℝ_less_irrefl_thm"⦎, ([], ⓩ ∀ x : ℝ ⦁ ¬ x <⋎R x⌝));
req_thm(⦏"z_ℝ_less_antisym_thm"⦎, ([], ⓩ ∀ x, y : ℝ ⦁ ¬ (x <⋎R y ∧ y <⋎R x)⌝));
req_thm(⦏"z_ℝ_less_trans_thm"⦎, ([],
	ⓩ ∀ x, y, z : ℝ ⦁ x <⋎R y ∧ y <⋎R z ⇒ x <⋎R z⌝));
req_thm(⦏"z_ℝ_less_cases_thm"⦎, ([], ⓩ ∀ x, y : ℝ ⦁ x <⋎R y ∨ x = y ∨ y <⋎R x⌝));
req_thm(⦏"z_ℝ_less_¬_eq_thm"⦎, ([], ⓩ ∀ x, y : ℝ ⦁ x <⋎R y ⇒ ¬ x = y⌝));
req_thm(⦏"z_ℝ_less_dense_thm"⦎, ([],
	ⓩ ∀ x, y : ℝ ⦁ x <⋎R y ⇒ (∃ z : ℝ ⦁ x <⋎R z ∧ z <⋎R y)⌝));
req_thm(⦏"z_ℝ_complete_thm"⦎, ([], ⓩ ∀ A : ℙ ℝ ⦁
	¬ A = {} ∧ (∃ b : ℝ ⦁ ∀ x : ℝ ⦁ x ∈ A ⇒ x ≤⋎R b) ⇒
	(∃ s : ℝ⦁
		(∀ x : ℝ ⦁ x ∈ A ⇒ x ≤⋎R s)
	∧	(∀ b : ℝ ⦁ (∀ x : ℝ ⦁ x ∈ A ⇒ x ≤⋎R b) ⇒ s ≤⋎R b))⌝));
=DESCRIBE
=ENDDOC
=THDOC
req_thm(⦏"z_ℝ_≤_cases_thm"⦎, ([], ⓩ ∀ x, y : ℝ ⦁ x ≤⋎R y ∨ y ≤⋎R x⌝));
req_thm(⦏"z_ℝ_≤_less_cases_thm"⦎, ([], ⓩ ∀ x, y : ℝ ⦁ x ≤⋎R y ∨ y <⋎R x⌝));
req_thm(⦏"z_ℝ_eq_≤_thm"⦎, ([], ⓩ ∀ x, y : ℝ ⦁ x = y ⇔ x ≤⋎R y ∧ y ≤⋎R x⌝));
req_thm(⦏"z_ℝ_≤_antisym_thm"⦎, ([], ⓩ ∀ x, y : ℝ ⦁ x ≤⋎R y ∧ y ≤⋎R x ⇒ x = y⌝));
req_thm(⦏"z_ℝ_less_≤_trans_thm"⦎,
	([], ⓩ ∀ x, y, z : ℝ ⦁ x <⋎R y ∧ y ≤⋎R z ⇒ x <⋎R z⌝));
req_thm(⦏"z_ℝ_≤_less_trans_thm"⦎,
	([], ⓩ ∀ x, y, z : ℝ ⦁ x ≤⋎R y ∧ y <⋎R z ⇒ x <⋎R z⌝));
req_thm(⦏"z_ℝ_≤_refl_thm"⦎, ([], ⓩ ∀ x : ℝ ⦁ x ≤⋎R x⌝));
req_thm(⦏"z_ℝ_≤_trans_thm"⦎, ([],
	ⓩ ∀ x, y, z : ℝ ⦁ x ≤⋎R y ∧ y ≤⋎R z ⇒ x ≤⋎R z⌝));
req_thm(⦏"z_ℝ_≤_¬_less_thm"⦎, ([], ⓩ ∀ x, y : ℝ ⦁ x ≤⋎R y ⇔ ¬ y <⋎R x⌝));
req_thm(⦏"z_ℝ_¬_≤_less_thm"⦎, ([], ⓩ ∀ x, y : ℝ ⦁ ¬ x ≤⋎R y ⇔ y <⋎R x⌝));
=DESCRIBE
=ENDDOC
=THDOC
req_thm(⦏"z_ℝ_plus_assoc_thm"⦎, ([],
	ⓩ ∀ x, y, z : ℝ ⦁ (x +⋎R y) +⋎R z = x +⋎R (y +⋎R z)⌝));
req_thm(⦏"z_ℝ_plus_assoc_thm1"⦎, ([],
	ⓩ ∀ x, y, z : ℝ ⦁ x +⋎R (y +⋎R z) = (x +⋎R y) +⋎R z⌝));
req_thm(⦏"z_ℝ_plus_comm_thm"⦎, ([],
	ⓩ ∀ x, y : ℝ ⦁ x +⋎R y = y +⋎R x⌝));
req_thm(⦏"z_ℝ_plus_unit_thm"⦎, ([],
	ⓩ ∀ x : ℝ ⦁ x +⋎R real 0 = x⌝));
req_thm(⦏"z_ℝ_plus_mono_thm"⦎, ([],
	ⓩ ∀ x, y, z : ℝ ⦁ y <⋎R z ⇒ x +⋎R y <⋎R x +⋎R z⌝));
req_thm(⦏"z_ℝ_plus_mono_thm1"⦎, ([],
	ⓩ ∀ x, y, z : ℝ ⦁ y <⋎R z ⇒ y +⋎R x <⋎R z +⋎R x⌝));
req_thm(⦏"z_ℝ_plus_mono_thm2"⦎, ([],
	ⓩ ∀ x, y, s, t : ℝ ⦁ x <⋎R y ∧ s <⋎R t ⇒ x +⋎R s <⋎R y +⋎R t⌝));
req_thm(⦏"z_ℝ_plus_0_thm"⦎, ([],
	ⓩ ∀ x : ℝ ⦁ x +⋎R real 0 = x ∧ real 0 +⋎R x = x⌝));
req_thm(⦏"z_ℝ_plus_order_thm"⦎, ([],
	ⓩ ∀ x, y, z : ℝ ⦁ y +⋎R x = x +⋎R y
		∧	(x +⋎R y) +⋎R z = x +⋎R (y +⋎R z)
		∧	y +⋎R (x +⋎R z) = x +⋎R (y +⋎R z)⌝));
req_thm(⦏"z_ℝ_plus_minus_thm"⦎, ([],
	ⓩ ∀ x : ℝ ⦁ x +⋎R ~⋎R x = real 0 ∧ ~⋎R x +⋎R x = real 0⌝));
req_thm(⦏"z_ℝ_eq_thm"⦎, ([],
	ⓩ ∀ x, y : ℝ ⦁ x = y ⇔ x +⋎R ~⋎R y = real 0⌝));
=DESCRIBE
=ENDDOC
=THDOC
req_thm(⦏"z_ℝ_minus_clauses"⦎, ([],
	ⓩ ∀ x, y : ℝ ⦁
		~⋎R ~⋎R x = x
		∧	x +⋎R ~⋎R x = real 0
		∧	~⋎R x +⋎R x = real 0
		∧	~⋎R (x +⋎R y) = ~⋎R x +⋎R ~⋎R y
		∧	~⋎R real 0 = real 0⌝));
req_thm(⦏"z_ℝ_minus_eq_thm"⦎, ([], ⓩ ∀ x, y : ℝ ⦁ ~⋎R x = ~⋎R y ⇔ x = y⌝));
=DESCRIBE
=ENDDOC
=THDOC
req_thm(⦏"z_ℝ_plus_clauses"⦎, ([], ⓩ ∀ x, y, z : ℝ ⦁ (x +⋎R z = y +⋎R z ⇔ x = y)
∧	(z +⋎R x = y +⋎R z ⇔ x = y)
∧	(x +⋎R z = z +⋎R y ⇔ x = y)
∧	(z +⋎R x = z +⋎R y ⇔ x = y)
∧	(x +⋎R z = z ⇔ x = real 0)
∧	(z +⋎R x = z ⇔ x = real 0)
∧	(z = z +⋎R y ⇔ y = real 0)
∧	(z = y +⋎R z ⇔ y = real 0)
∧	x +⋎R real 0 = x
∧	real 0 +⋎R x = x
∧	¬ real 1 = real 0
∧	¬ real 0 = real 1⌝));
=DESCRIBE
=ENDDOC
=THDOC
req_thm(⦏"z_ℝ_less_clauses"⦎, ([], ⓩ ∀ x, y, z : ℝ ⦁ (x +⋎R z <⋎R y +⋎R z ⇔ x <⋎R y)
∧	(z +⋎R x <⋎R y +⋎R z ⇔ x <⋎R y)
∧	(x +⋎R z <⋎R z +⋎R y ⇔ x <⋎R y)
∧	(z +⋎R x <⋎R z +⋎R y ⇔ x <⋎R y)
∧	(x +⋎R z <⋎R z ⇔ x <⋎R real 0)
∧	(z +⋎R x <⋎R z ⇔ x <⋎R real 0)
∧	(x <⋎R z +⋎R x ⇔ real 0 <⋎R z)
∧	(x <⋎R x +⋎R z ⇔ real 0 <⋎R z)
∧	¬ x <⋎R x
∧	real 0 <⋎R real 1
∧	¬ real 1 <⋎R real 0⌝));
=DESCRIBE
=ENDDOC
=THDOC
req_thm(⦏"z_ℝ_≤_clauses"⦎, ([], ⓩ ∀ x, y, z : ℝ ⦁ (x +⋎R z ≤⋎R y +⋎R z ⇔ x ≤⋎R y)
∧	(z +⋎R x ≤⋎R y +⋎R z ⇔ x ≤⋎R y)
∧	(x +⋎R z ≤⋎R z +⋎R y ⇔ x ≤⋎R y)
∧	(z +⋎R x ≤⋎R z +⋎R y ⇔ x ≤⋎R y)
∧	(x +⋎R z ≤⋎R z ⇔ x ≤⋎R real 0)
∧	(z +⋎R x ≤⋎R z ⇔ x ≤⋎R real 0)
∧	(x ≤⋎R z +⋎R x ⇔ real 0 ≤⋎R z)
∧	(x ≤⋎R x +⋎R z ⇔ real 0 ≤⋎R z)
∧	x ≤⋎R x
∧	real 0 ≤⋎R real 1
∧	¬ real 1 ≤⋎R real 0⌝));
=DESCRIBE
=ENDDOC
=THDOC
req_thm(⦏"z_ℝ_times_assoc_thm"⦎, ([],
	ⓩ ∀ x, y, z : ℝ ⦁ (x *⋎R y) *⋎R z = x *⋎R (y *⋎R z)⌝));
req_thm(⦏"z_ℝ_times_assoc_thm1"⦎, ([],
	ⓩ ∀ x, y, z : ℝ ⦁ x *⋎R (y *⋎R z) = (x *⋎R y) *⋎R z⌝));
req_thm(⦏"z_ℝ_times_comm_thm"⦎, ([], ⓩ ∀ x, y : ℝ ⦁ x *⋎R y = y *⋎R x⌝));
req_thm(⦏"z_ℝ_times_unit_thm"⦎, ([], ⓩ ∀ x : ℝ ⦁ x *⋎R real 1 = x⌝));
req_thm(⦏"z_ℝ_0_less_0_less_times_thm"⦎, ([], ⓩ ∀ x, y : ℝ ⦁ real 0 <⋎R x
∧	real 0 <⋎R y ⇒ real 0 <⋎R x *⋎R y⌝));
req_thm(⦏"z_ℝ_times_plus_distrib_thm"⦎, ([],
	ⓩ ∀ x, y, z : ℝ ⦁ x *⋎R (y +⋎R z) = x *⋎R y +⋎R x *⋎R z
∧	(x +⋎R y) *⋎R z = x *⋎R z +⋎R y *⋎R z⌝));
req_thm(⦏"z_ℝ_times_order_thm"⦎, ([], ⓩ ∀ x, y, z : ℝ ⦁ y *⋎R x = x *⋎R y
∧	(x *⋎R y) *⋎R z = x *⋎R (y *⋎R z)
∧	y *⋎R (x *⋎R z) = x *⋎R (y *⋎R z)⌝));
req_thm(⦏"z_ℝ_times_clauses"⦎, ([], ⓩ ∀ x : ℝ ⦁ real 0 *⋎R x = real 0
∧	x *⋎R real 0 = real 0
∧	x *⋎R real 1 = x
∧	real 1 *⋎R x = x⌝));
req_thm(⦏"z_ℝ_over_clauses"⦎, ([], ⓩ (∀ y, z : ℝ ⦁ ¬ z = real 0 ⇒ (y *⋎R z) /⋎R z = y)
∧	(∀ x, y, z : ℝ ⦁ ¬ z = real 0 ⇒ (x *⋎R y) /⋎R z = x *⋎R (y /⋎R z))⌝));
req_thm(⦏"z_float_thm"⦎, ([], ⓩ ∀ m, p, e : ℤ⦁ ⌜Z'Float m p e⌝ = real m *⋎R (real 10 ^⋎Z (e + ~p))⌝));
=DESCRIBE
=ENDDOC

=TEX
\section{SIGNATURE}
=SML
signature ⦏ZReals⦎ = sig
=TEX

\subsection{Syntax Functions}
=DOC
val ⦏dest_z_ℝ_≤⦎ : TERM -> TERM * TERM;
val ⦏dest_z_ℝ_≥⦎ : TERM -> TERM * TERM;
val ⦏dest_z_ℝ_ℤ_exp⦎ : TERM -> TERM * TERM;
val ⦏dest_z_ℝ_abs⦎ : TERM -> TERM;
val ⦏dest_z_ℝ_frac⦎ : TERM -> TERM * TERM;
val ⦏dest_z_ℝ_greater⦎ : TERM -> TERM * TERM;
val ⦏dest_z_ℝ_less⦎ : TERM -> TERM * TERM;
val ⦏dest_z_ℝ_minus⦎ : TERM -> TERM;
val ⦏dest_z_ℝ_over⦎ : TERM -> TERM * TERM;
val ⦏dest_z_ℝ_plus⦎ : TERM -> TERM * TERM;
val ⦏dest_z_real⦎ : TERM -> TERM;
val ⦏dest_z_ℝ_subtract⦎ : TERM -> TERM * TERM;
val ⦏dest_z_ℝ_times⦎ : TERM -> TERM * TERM;
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
=FAILURE
117101	?0 is not of the form ⓩx ≤⋎R y⌝
117102	?0 is not of the form ⓩx ≥⋎R y⌝
117103	?0 is not of the form ⓩabs⋎R x⌝
117104	?0 is not of the form ⓩx /⋎R y⌝
117105	?0 is not of the form ⓩx >⋎R y⌝
117106	?0 is not of the form ⓩx <⋎R y⌝
117107	?0 is not of the form ⓩ~⋎R x⌝
117109	?0 is not of the form ⓩx +⋎R y⌝
117110	?0 is not of the form ⓩx /⋎Z y⌝
117111	?0 is not of the form ⓩx -⋎R y⌝
117112	?0 is not of the form ⓩx *⋎R y⌝
117113	?0 is not of the form ⓩreal x⌝
=ENDDOC

=DOC
val ⦏is_z_ℝ_≤⦎ : TERM -> bool;
val ⦏is_z_ℝ_≥⦎ : TERM -> bool;
val ⦏is_z_ℝ_ℤ_exp⦎ : TERM -> bool;
val ⦏is_z_ℝ_abs⦎ : TERM -> bool;
val ⦏is_z_ℝ_frac⦎ : TERM -> bool;
val ⦏is_z_ℝ_greater⦎ : TERM -> bool;
val ⦏is_z_ℝ_less⦎ : TERM -> bool;
val ⦏is_z_ℝ_minus⦎ : TERM -> bool;
val ⦏is_z_ℝ_over⦎ : TERM -> bool;
val ⦏is_z_ℝ_plus⦎ : TERM -> bool;
val ⦏is_z_real⦎ : TERM -> bool;
val ⦏is_z_ℝ_subtract⦎ : TERM -> bool;
val ⦏is_z_ℝ_times⦎ : TERM -> bool;
=DESCRIBE
These are derived discriminator
functions for the Z basic arithmetic operations.
See the documentation for the destructor functions ($dest\_z\_plus$ etc.)
for more information.
=ENDDOC

=DOC
val ⦏mk_z_ℝ_≤⦎ : TERM * TERM -> TERM;
val ⦏mk_z_ℝ_≥⦎ : TERM * TERM -> TERM;
val ⦏mk_z_ℝ_ℤ_exp⦎ : TERM * TERM -> TERM;
val ⦏mk_z_ℝ_abs⦎ : TERM -> TERM;
val ⦏mk_z_ℝ_frac⦎ : TERM * TERM -> TERM;
val ⦏mk_z_ℝ_greater⦎ : TERM * TERM -> TERM;
val ⦏mk_z_ℝ_less⦎ : TERM * TERM -> TERM;
val ⦏mk_z_ℝ_over⦎ : TERM * TERM -> TERM;
val ⦏mk_z_ℝ_minus⦎ : TERM -> TERM;
val ⦏mk_z_ℝ_plus⦎ : TERM * TERM -> TERM;
val ⦏mk_z_real⦎ : TERM -> TERM;
val ⦏mk_z_ℝ_subtract⦎ : TERM * TERM -> TERM;
val ⦏mk_z_ℝ_times⦎ : TERM * TERM -> TERM;
=DESCRIBE
These are derived constructor
functions for the Z basic arithmetic operations.
See the documentation for the destructor functions ($dest\_z\_plus$ etc.)
for more information.
=FAILURE
117201	?0 does not have type ℝ
=ENDDOC

\subsection{Definitions}
=DOC
val ⦏z_ℝ_ℤ_exp_def⦎ : THM;
val ⦏z_ℝ_≥_def⦎ : THM;
val ⦏z_ℝ_≤_def⦎ : THM;
val ⦏z_ℝ_abs_def⦎ : THM;
val ⦏z_ℝ_def⦎ : THM;
val ⦏z_ℝ_dot_dot_def⦎ : THM;
val ⦏z_ℝ_frac_def⦎ : THM;
val ⦏z_ℝ_greater_def⦎ : THM;
val ⦏z_ℝ_less_def⦎ : THM;
val ⦏z_ℝ_minus_def⦎ : THM;
val ⦏z_ℝ_over_def⦎ : THM;
val ⦏z_ℝ_plus_def⦎ : THM;
val ⦏z_ℝ_real_def⦎ : THM;
val ⦏z_ℝ_subtract_def⦎ : THM;
val ⦏z_ℝ_times_def⦎ : THM;
val ⦏z_ℝ_lb_def⦎ : THM;
val ⦏z_ℝ_glb_def⦎ : THM;
val ⦏z_ℝ_ub_def⦎ : THM;
val ⦏z_ℝ_lub_def⦎ : THM;
=DESCRIBE
ML bindings for the definitions in the theory of real numbers.
=ENDDOC

\subsection{Theorems}
=DOC
val ⦏z_ℝ_complete_thm⦎ : THM;
val ⦏z_ℝ_unbounded_above_thm⦎ : THM;
val ⦏z_ℝ_unbounded_below_thm⦎ : THM;
val ⦏z_ℝ_less_antisym_thm⦎ : THM;
val ⦏z_ℝ_less_cases_thm⦎ : THM;
val ⦏z_ℝ_less_clauses⦎ : THM;
val ⦏z_ℝ_less_dense_thm⦎ : THM;
val ⦏z_ℝ_less_irrefl_thm⦎ : THM;
val ⦏z_ℝ_less_thm⦎ : THM;
val ⦏z_ℝ_less_trans_thm⦎ : THM;
=DESCRIBE
These are ML bindings for the theorems that characterise the ordering relation
=INLINEFT
_ <⋎R _
=TEX
\ on the real numbers.
=ENDDOC
=DOC
val ⦏z_ℝ_eq_≤_thm⦎ : THM;
val ⦏z_ℝ_eq_thm⦎ : THM;
val ⦏z_ℝ_less_≤_trans_thm⦎ : THM;
val ⦏z_ℝ_less_¬_eq_thm⦎ : THM;
val ⦏z_ℝ_≤_¬_less_thm⦎ : THM;
val ⦏z_ℝ_≤_antisym_thm⦎ : THM;
val ⦏z_ℝ_≤_cases_thm⦎ : THM;
val ⦏z_ℝ_≤_clauses⦎ : THM;
val ⦏z_ℝ_≤_less_cases_thm⦎ : THM;
val ⦏z_ℝ_≤_less_trans_thm⦎ : THM;
val ⦏z_ℝ_≤_refl_thm⦎ : THM;
val ⦏z_ℝ_≤_thm⦎ : THM;
val ⦏z_ℝ_≤_trans_thm⦎ : THM;
val ⦏z_ℝ_¬_≤_less_thm⦎ : THM;
val ⦏z_ℝ_¬_less_≤_thm⦎ : THM;
val ⦏z_ℝ_0_less_0_less_times_thm⦎ : THM;

val ⦏z_ℝ_greater_thm⦎ : THM;
val ⦏z_ℝ_≥_thm⦎ : THM;
=DESCRIBE
These are ML bindings for theorems that deal with the equality and ordering relations.
=ENDDOC
=DOC
val ⦏z_ℝ_minus_clauses⦎ : THM;
val ⦏z_ℝ_minus_eq_thm⦎ : THM;
val ⦏z_ℝ_minus_thm⦎ : THM;
val ⦏z_ℝ_plus_0_thm⦎ : THM;
val ⦏z_ℝ_plus_assoc_thm⦎ : THM;
val ⦏z_ℝ_plus_assoc_thm1⦎ : THM;
val ⦏z_ℝ_plus_clauses⦎ : THM;
val ⦏z_ℝ_plus_comm_thm⦎ : THM;
val ⦏z_ℝ_plus_minus_thm⦎ : THM;
val ⦏z_ℝ_plus_mono_thm⦎ : THM;
val ⦏z_ℝ_plus_mono_thm1⦎ : THM;
val ⦏z_ℝ_plus_mono_thm2⦎ : THM;
val ⦏z_ℝ_plus_order_thm⦎ : THM;
val ⦏z_ℝ_plus_thm⦎ : THM;
val ⦏z_ℝ_plus_unit_thm⦎ : THM;
val ⦏z_ℝ_subtract_thm⦎ : THM;
=DESCRIBE
ML bindings for theorems about addition, unary minus and subtraction for the real numbers.
=ENDDOC
=DOC
val ⦏z_ℝ_real_ℕℝ_thm⦎ : THM;
val ⦏z_ℝ_real_0_thm⦎ : THM;
val ⦏z_float_thm⦎ : THM;
=DESCRIBE
ML bindings for theorems concerning Z integer and floating point real literals.
=ENDDOC
=DOC
val ⦏z_ℝ_times_assoc_thm⦎ : THM;
val ⦏z_ℝ_times_assoc_thm1⦎ : THM;
val ⦏z_ℝ_times_clauses⦎ : THM;
val ⦏z_ℝ_times_comm_thm⦎ : THM;
val ⦏z_ℝ_times_order_thm⦎ : THM;
val ⦏z_ℝ_times_plus_distrib_thm⦎ : THM;
val ⦏z_ℝ_times_thm⦎ : THM;
val ⦏z_ℝ_times_unit_thm⦎ : THM;
val ⦏z_ℝ_over_thm⦎ : THM;
val ⦏z_ℝ_over_clauses⦎ : THM;
=DESCRIBE
ML bindings for theorems about multiplication and division of real numbers.
=ENDDOC

\subsection{Conversions and Tactics}

=DOC
val ⦏z_ℝ_≤_conv⦎ : CONV;		(* _ ≤⋎R _ *)
val ⦏z_ℝ_eq_conv⦎ : CONV;		(* _ = _ *)
val ⦏z_ℝ_less_conv⦎ : CONV;		(* _ <⋎R _ *)
val ⦏z_ℝ_minus_conv⦎ : CONV;		(* ~⋎R *)
val ⦏z_ℝ_over_conv⦎ : CONV;		(* _ /⋎R _ *)
val ⦏z_ℝ_plus_conv⦎ : CONV;		(* _ +⋎R _ *)
val ⦏z_ℝ_times_conv⦎ : CONV;		(* _ *⋎R _ *)
val ⦏z_ℝ_ℤ_exp_conv⦎ : CONV;		(* _ ^⋎Z _ *)
val ⦏z_ℝ_abs_conv⦎ : CONV;		(* abs⋎Z _ *)

val ⦏z_ℝ_greater_conv⦎ : CONV;		(* _ >⋎R _ *)
val ⦏z_ℝ_≥_conv⦎ : CONV;		(* _ ≥⋎R _ *)
val ⦏z_ℝ_subtract_conv⦎ : CONV;	(* _ -⋎R _ *)

val ⦏z_ℝ_lit_norm_conv⦎ : CONV;

val ⦏z_ℝ_lit_conv⦎ : CONV;		val ⦏z_ℝ_lit_conv1⦎ : CONV;
=DESCRIBE
These are conversions for carrying out real arithmetic computation.
The first and second blocks of conversions deal with expressions of the form {\it c op d},
where {\it c} and {\it d} are real literal expressions (see below) and
where {\it op} is the operator given in the ML comment alongside the conversion above.
The conversions in the first block actually carry out the computation to
give a theorem {\it c op d = e} or
=INLINEFT
c op d ⇔ v
=TEX
\ where {\it e} and {\it v} are a real literal expression or a truth value as appropriate.

The conversions in the second block rewrite their argument in terms of the operators
supported by the conversions in the first block.

The conversion
=INLINEFT
z_ℝ_lit_norm_conv
=TEX
\ normalises real literal expressions, i.e., expressions of either of
the forms
=INLINEFT
real i
=TEX
\ or
=INLINEFT
i /⋎Z j
=TEX
, where {\it i} and {\it j} are optionally signed integer literals.
The conversion puts the result in a normal form, where the sign if any is
moved to the outside, where
=INLINEFT
real
=TEX
\ is used whenever possible and where if the form
=INLINEFT
i /⋎Z j
=TEX
\ has to be used, {\it i} and {it j} are taken to be coprime.
This conversion fails if its argument cannot be normalised or is already in the normal form.

The final two conversions
=INLINEFT
z_ℝ_lit_conv
=TEX
\ and
=INLINEFT
z_ℝ_lit_conv1
=TEX
\ convert to and from Z and HOL real literal expressions.

=FAILURE
117001	?0 is not a Z real fraction with integer literal operands
117002	?0 is not an HOL real fraction with literal operands
117003	?0 is not of the form ?1 where x and y are real literal expressions
117004	?0 is not of the form ?1 where x is a real literal expression
117005	?0 is not of the form x ^⋎Z i where x is a real literal expression and i is an integer literal
=ENDDOC

=DOC
val ⦏z_float_conv⦎ : CONV;
=DESCRIBE
The conversion
=INLINEFT
z_float_conv
=TEX
\ converts a floating point literal into a normalised real literal form.

=FAILURE
117006	?0 is not a Z floating point literal
=ENDDOC

=DOC
val ⦏z_ℝ_eval_conv⦎ : CONV;	val ⦏Z_ℝ_EVAL_C⦎ : CONV -> CONV;
=DESCRIBE
=INLINEFT
z_ℝ_eval_conv
=TEX
\ computes theorems of the form
=INLINEFT
⊢ t1 = t2
=TEX
\ where $t1$ is an expression made up from rational literals (see
=INLINEFT
z_ℝ_plus_conv
=TEX
) using real addition, subtraction, multiplication, division, reciprocal,
absolute value and unary negation.
$t2$ will be an optionally signed rational literal in normal form.
The conversion fails if the expression cannot be evaluated (e.g., because
it contains variables).

=INLINEFT
z_ℝ_EVAL_C conv
=TEX
\ is similar to
=INLINEFT
ℝ_eval_conv
=TEX
\ but it also applies
=INLINEFT
conv
=TEX
\ to any subterm that cannot be evaluated using the conversions for the
arithmetic operations listed above.
E.g.,
=INLINEFT
z_ℝ_EVAL_C z_ℝ_ℤ_exp_conv
=TEX
\ will evaluate expressions involving the usual arithmetic operations and
also exponentiation of rational literals by natural number literals.
=FAILURE
117020	?0 cannot be evaluated
=ENDDOC

=DOC
val ⦏z_ℝ_lin_arith_prove_conv⦎ : THM list -> CONV;
val ⦏z_ℝ_lin_arith_prove_tac⦎ : THM list -> TACTIC;
=DESCRIBE
This conversion and tactic implement the linear arithmetic decision procedure
for real numbers.
The usual interface to these is via the proof context {\it z\_reals}, q.v.
=ENDDOC

\subsection{Epilogue}
=SML
end (* of signature ZReals *);
val _ = reset_flag("standard_z_paras");
=TEX
\section{PROOF CONTEXTS}
=DOC
(* Proof Context: ⦏'z_reals⦎ *)
=DESCRIBE
A component proof context for handling the basic arithmetic operations
for real numbers in Z.

Expressions and predicates treated by this proof context are constructs formed from:
=GFT
+⋎R, *⋎R, -⋎R, /⋎R, ≤⋎R, <⋎R, ≥⋎R, >⋎R, ^⋎Z, =
=TEX

\paragraph{Contents}\

Rewriting:
=GFT
z_ℝ_plus_conv, z_ℝ_times_conv, z_ℝ_subtract_conv
z_ℝ_abs_conv, z_ℝ_div_conv, z_ℝ_mod_conv
z_ℝ_eq_conv, z_ℝ_≤_conv, z_ℝ_less_conv
z_ℝ_≥_conv, z_ℝ_greater_conv,
z_ℝ_plus_clauses, z_ℝ_minus_clauses, z_ℝ_≤_clauses
z_ℝ_less_clauses, z_ℝ_lit_norm_conv
=TEX
Stripping theorems:
=GFT
z_ℝ_eq_conv, z_ℝ_≤_conv, z_ℝ_less_conv
z_ℝ_≥_conv, z_ℝ_greater_conv,
z_ℝ_plus_clauses, z_ℝ_minus_clauses, z_ℝ_≤_clauses
z_ℝ_less_clauses,
and all the above pushed through ¬

=TEX

Stripping conclusions: as for stripping theorems.

Rewriting canonicalisation: blank.

=TEX
Automatic proof procedures:
=INLINEFT
z_basic_prove_tac
=TEX
,
=INLINEFT
z_basic_prove_conv
=TEX
.

Automatic existence prover: blank.
=ENDDOC
=DOC
(* Proof Context: ⦏z_ℝ_lin_arith⦎ *)
=DESCRIBE
This is a component
proof context whose main purpose is to supply a decision procedure
for problems in linear arithmetic for the real numbers in Z.
\paragraph{Contents}
The rewriting components converts Z real arithmetic expressions into equivalent HOL ones
and the automatic proof tactic then uses the HOL linear arithmetic proof context to
attempt the proof.
=ENDDOC

=TEX
\section{TEST POLICY}
The module tests for this module are to follow the guidelines
laid down in the quality plan~\cite{DS/FMU/IED/PLN007}.
The various conversions, tactics etc. need to be tested in addition to the
check of the theory design.


\twocolumn[\section{INDEX}]
\small
\printindex

\end{document}








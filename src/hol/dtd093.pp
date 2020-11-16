=IGN
********************************************************************************
dtd093.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  dtd093.doc  @(#) $Revision: 1.13 $ dtd093.doc $Date: 2005/05/07 12:08:26 $
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

\def\Title{Theory of Integers}

\def\AbstractText{This document contains the detailed design of a theory of integers for HOL.}

\def\Reference{DS/FMU/IED/DTD093}

\def\Author{R.D. Arthan, A.C. Hayward}


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
%% LaTeX2e port: \TPPtitle{Theory of Integers}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/DTD093}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.13 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2005/05/07 12:08:26 $%
%% LaTeX2e port: }}
%% LaTeX2e port: %\TPPstatus{Approved}
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthors{R.D.~Arthan & WIN01\\A.C.~Hayward & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document contains the detailed design of
%% LaTeX2e port: a theory of integers for HOL.}
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
%% LaTeX2e port: \load{\scriptsize}{\msyChar}
%% LaTeX2e port: \load{\footnotesize}{\msyChar}
%% LaTeX2e port: 
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
\item [Issue 1.1 (1993/03/26)]
First (incomplete) draft.
\item [Issue 1.5 (1993/04/30)]
Minor tidy up. Addition of $ℤ\_less\_cases\_thm$ and rationalisation of
some names.
\item [Issue 1.6 (1993/09/01)]
Parent theory now ``sets'' not ''hol''.
\item [Issue 1.7 (1999/03/07)]
Update for new INTEGER type.
\item [Issue 1.8 (2000/08/10)]
Corrected silly description of one of the theorems.
\item [Issue 1.9 (2000/12/04)]
New induction theorems and tactics to help with the real numbers.
\item [Issue 1.10 (2000/12/10)]
Corrected some historical errors in the descriptions.
\item[Issue 1.11 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.12 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.13 (2005/05/07)] HOL now supports left-associative operators.
\item[Issue 1.14 (2005/05/31)]
Added theorem for introducing functions over the integers.
Note that the proof of this uses the integer proof support so the theorem is proved in IMP105 not IMP093.
Also general tidy-up for the reference manual.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
\pagebreak
\section{GENERAL}
\subsection{Scope}
This document contains the detailed design
of  theory of integers for \ProductHOL, and elementary
(computational) proof support.
The high level design for this material is given in \cite{DS/FMU/IED/HLD011}.
\subsection{Introduction}
The document prevents a (conservative) treatment of the integers. The
treatment is close to the (currently axiomatic) account given for Z in
\cite{DS/FMU/IED/DTD086}.
\subsection{Purpose and Background}
See \cite{DS/FMU/IED/HLD011}.
\subsection{Dependencies}
Loading this document and its implementation relies on having loaded
the theory $basic\_hol$ of \cite{DS/FMU/IED/IMP045}.

\subsection{Possible Enhancements}
Course-of-values induction might be a valuable addition.
\subsection{Deficiencies}
\section{PROLOGUE}

=SML
open_theory"sets";
set_merge_pcs["'pair", "basic_hol"];
new_theory"ℤ";
=THDOC
req_name ⦏"ℤ"⦎ (Value "sets");
set_flag("tc_thms_only",true);
=DESCRIBE
The theory $ℤ$ contains various definitions of numbers and finiteness constants and types, and ``defining theorems'' of Z library constants derived from these definitions.
It is created in structure $ℤ$.
=ENDDOC
=TEX
\section {DEFINITION OF FIXITY}
=SML
declare_infix(210, "<⋎Z");
declare_infix(210, "≤⋎Z");
declare_infix(210, ">⋎Z");
declare_infix(210, "≥⋎Z");
declare_infix(300, "+⋎Z");
declare_left_infix(305, "-⋎Z");
declare_infix(310, "*⋎Z");
declare_left_infix(315, "Div⋎Z");
declare_left_infix(315, "Mod⋎Z");
declare_prefix(350, "~⋎Z");
declare_prefix(350, "Abs⋎Z");
=TEX
\section{DEFINITIONS}
The integer operations are distinguished from the natural number ones
by a subscript Z.
Later on the unsubscripted forms are declared as aliases.
\subsection{The New Type}
The integers are defined to be represented by equivalences classes of
pairs of natural numbers under the equivalence relation, $R$, given by
=GFT
	(m, n) R (x, y) ⇔ m + y = n + x
=TEX
The equivalence class of a pair $(m, n)$ represents the integer $m - n$.

The following property holds of a set of pairs of natural numbers iff.
the set is an equivalence class of $R$.
(There is no need to define a constant for $R$: $R$ is only need during
the consistency proof for the definition of addition, and is easily written
out in full there as needed.)

ⓈHOLCONST
	Is_ℤ_Rep : (ℕ × ℕ) SET → BOOL
├
	∀a⦁ Is_ℤ_Rep a ⇔ ∃m n⦁ a = { (x, y) | m + y = n + x }
■
=TEX
We now prove the consistency of the above definition as needed to define
a new type:
=SML
set_goal([], ⌜∃a⦁Is_ℤ_Rep a⌝);
a(∃_tac⌜{(i, j) | j = i}⌝ THEN rewrite_tac[get_spec⌜Is_ℤ_Rep⌝]);
a(∃_tac ⌜0⌝ THEN ∃_tac ⌜0⌝ THEN rewrite_tac[]);
save_thm("is_ℤ_rep_consistent_thm", pop_thm());
=TEX
Now we define the type:
=SML
val ℤ_def = new_type_defn(["ℤ", "ℤ_def"], "ℤ", [],
	get_thm"-""is_ℤ_rep_consistent_thm");
=TEX
\subsection{Constants}
We define simultaneously addition, unary minus, and the usual
injection, ℕℤ, of the natural numbers into the integers, thus:
ⓈHOLCONST
│	$+⋎Z: ℤ → ℤ → ℤ;
│	$~⋎Z: ℤ → ℤ;
│	ℕℤ: ℕ → ℤ
├─────────────────────────────
│	(∀i j k:ℤ⦁
│		(i +⋎Z j) +⋎Z k = i +⋎Z (j +⋎Z k)
│	∧	i +⋎Z j = j +⋎Z i
│	∧	i +⋎Z ~⋎Z i = ℕℤ 0
│	∧	i +⋎Z ℕℤ 0 = i)
│∧	(∀m n⦁ ℕℤ m +⋎Z ℕℤ n = ℕℤ(m + n))
│∧	OneOne ℕℤ
│∧	(∀i⦁∃m⦁ i = ℕℤ m ∨ i = ~⋎Z ℕℤ m)
■
=TEX
The four clauses of the above definition characterise the additive structure
of the integers as follows:

\begin{enumerate}
\item they form an abelian group under addition, with the inverse operation
given by unary minus, and the unit given by the image under ℕℤ of $0$.
\item ℕℤ is a homomorphism of monoids (w.r.t. addition).
\item ℕℤ is an injection
\item Any integer either is equal to (the image of) a natural number or
is equal to the negative (i.e. additive inverse) of (the image of) a natural number.
\end{enumerate}

(Note that the fact that the group is abelian could actually be derived
from the other properties, which are sufficient to ensure that the group
is the free group on one generator, namely $ℕℤ 1$, and so is commutative;
however, it is marginally easier to prove the commutativity using the
representation type.)

We define subtraction as addition with an additive inverse.
ⓈHOLCONST
│	$-⋎Z: ℤ → ℤ → ℤ
├─────────────────────────────
│	∀i j:ℤ⦁
│		(i -⋎Z j) = i +⋎Z ~⋎Z j
■
=TEX
Now we make shorter symbols overloaded aliases for the additive operations:
=SML
declare_alias("+", ⌜$+⋎Z⌝);
declare_alias("-", ⌜$-⋎Z⌝);
declare_alias("~", ⌜$~⋎Z⌝);
ⓈHOLCONST
│	$*⋎Z: ℤ → ℤ → ℤ
├─────────────────────────────
│	∀i j k:ℤ⦁i*⋎Z(j + k) = i*⋎Z j + i*⋎Z k
│	∧	i *⋎Z ℕℤ 1 = i
■
=TEX
=SML
declare_alias("*", ⌜$*⋎Z⌝);
=TEX
We now define the usual ordering relations. As with the treatment
of natural numbers for HOL, we take $≤$ as basic and define
the others in terms of it.
=SML
ⓈHOLCONST
│	$≤⋎Z: ℤ → ℤ → BOOL
├─────────────────────────────
│	∀i j:ℤ⦁i ≤⋎Z j ⇔ ∃m:ℕ⦁ i + ℕℤ m = j
■
=TEX
ⓈHOLCONST
│	$<⋎Z: ℤ → ℤ → BOOL
├─────────────────────────────
│	∀i j:ℤ⦁i <⋎Z j ⇔ i + ℕℤ 1 ≤⋎Z j
■
=TEX
ⓈHOLCONST
│	$≥⋎Z: ℤ → ℤ → BOOL
├─────────────────────────────
│	∀i j:ℤ⦁i ≥⋎Z j ⇔ j ≤⋎Z i
■
=TEX
ⓈHOLCONST
│	$>⋎Z: ℤ → ℤ → BOOL
├─────────────────────────────
│	∀i j:ℤ⦁i >⋎Z j ⇔ j <⋎Z i
■
=TEX
Now we give aliases for the above:
=SML
declare_alias("≤", ⌜$≤⋎Z⌝);
declare_alias("<", ⌜$<⋎Z⌝);
declare_alias("≥", ⌜$≥⋎Z⌝);
declare_alias(">", ⌜$>⋎Z⌝);
=TEX
Finally, we define the absolute value function and use it to define $Div$
and $Mod$.
Note that as defined below, $Mod$ always take non-negative values.
(See the discussion in \cite{DS/FMU/IED/DTD086}.)

ⓈHOLCONST
│	$Abs⋎Z: ℤ → ℤ
├─────────────────────────────
│	∀i:ℤ⦁Abs⋎Z i = if ℕℤ 0 ≤ i then i else ~i
■
=TEX
ⓈHOLCONST
│	$Div⋎Z: ℤ → ℤ → ℤ;
│	$Mod⋎Z: ℤ → ℤ → ℤ
├─────────────────────────────
│	∀i j:ℤ⦁	¬j = ℕℤ 0
│	⇒	i = (i Div⋎Z j) * j + i Mod⋎Z j
│	∧	ℕℤ 0 ≤ i Mod⋎Z j
│	∧	i Mod⋎Z j < Abs⋎Z j
■
=TEX
=SML
declare_alias("Abs", ⌜$Abs⋎Z⌝);
declare_alias("Div", ⌜$Div⋎Z⌝);
declare_alias("Mod", ⌜$Mod⋎Z⌝);
=TEX
\section{THEOREMS PROVED IN IMP093}

Most of the following has now been not so quite imperfectly adapted
from the Z treatment of \cite{DS/FMU/IED/DTD086}.

The current offering is restricted to some fairly basic facts.
In particular, the following simplifying assumptions are made:
\begin{enumerate}
\item
Dyadic minus will be eliminated in favour of addition and monadic minus
as a matter of course. Thus theorems like
=INLINEFT
ℤ_plus_order_thm
=TEX
, but handling dyadic minus are not required.
\item
$<$ will usually be eliminated in favour of $≤$, and if not basic facts such
as irreflexivity for $<$ will be derivable by a decision procedure for linear
arithmetic.
\item
In the, rare, cases where they are needed,
inductive proofs for the integers as a whole will usually be handled by the user
combining more primitive things (e.g. natural number induction over the
absolute value). (However, a sort of induction tactic based on the fact that the
integers are a cyclic group is supplied.)
\end{enumerate}
=THDOC
req_consistency_thm ⌜⦏ℕℤ⦎⌝;
req_consistency_thm ⌜⦏$+⋎Z⦎⌝;
req_consistency_thm ⌜⦏$~⋎Z⦎⌝;
req_consistency_thm ⌜⦏$*⋎Z⦎⌝;
req_consistency_thm ⌜⦏$Div⋎Z⦎⌝;
req_consistency_thm ⌜⦏$Mod⋎Z⦎⌝;
req_thm (⦏"is_ℤ_rep_consistent_thm"⦎, ([], ⌜∃a⦁Is_ℤ_Rep a⌝));
=DESCRIBE
Consistency theorems for various operators.
=ENDDOC
=THDOC
req_thm(⦏"ℤ_plus_comm_thm"⦎, ([],
	⌜∀ i j : ℤ ⦁ i + j = j + i⌝));
=DESCRIBE
Commutativity of addition.
=ENDDOC
=THDOC
req_thm(⦏"ℤ_plus_assoc_thm"⦎, ([],
	⌜∀ i j k : ℤ ⦁ (i + j) + k = i + j + k⌝));
req_thm(⦏"ℤ_plus_assoc_thm1"⦎, ([],
	⌜∀ i j k : ℤ ⦁ i + j + k = (i + j) + k⌝));
=DESCRIBE
=DESCRIBE
Associativity of addition: first form moves brackets to the right;
second moves brackets to the left.
=ENDDOC
=THDOC
req_thm(⦏"ℤ_plus_order_thm"⦎, ([], ⌜∀ i j k : ℤ ⦁ j + i = i + j
		∧ (i + j) + k = i + j + k
		∧ j + i + k = i + j + k⌝));
=DESCRIBE
Magic theorem for reordering sums. If $i$ is specialised to $t$, rewriting
with the result floats $t$ to the beginning of the sum.
=ENDDOC
=THDOC
req_thm(⦏"ℤ_plus0_thm"⦎, ([],
	⌜∀ i : ℤ ⦁ i + (ℕℤ 0) = i ∧ (ℕℤ 0) + i = i⌝));
=DESCRIBE
0 is the additive identity.
=ENDDOC
=THDOC
req_thm(⦏"ℤ_plus_minus_thm"⦎, ([],
	⌜∀ i : ℤ ⦁ i + ~ i = ℕℤ 0 ∧ ~i + i = ℕℤ 0⌝));
=DESCRIBE
=INLINEFT
~x
=TEX
\ is the additive inverse of $x$.
=ENDDOC
=THDOC
req_thm(⦏"ℤ_plus_clauses"⦎, ([],
	⌜∀ i j k : ℤ ⦁ (i + k = j + k ⇔ i = j)
	∧	(k + i = j + k ⇔ i = j)
	∧	(i + k = k + j ⇔ i = j)
	∧	(k + i = k + j ⇔ i = j)
	∧	(i + k = k ⇔ i = ℕℤ 0)
	∧	(k + i = k ⇔ i = ℕℤ 0)
	∧	(k = k + j ⇔ j = ℕℤ 0)
	∧	(k = j + k ⇔ j = ℕℤ 0)
	∧	(i + ℕℤ 0 = i)
	∧	(ℕℤ 0 + i = i)
	∧	¬ ℕℤ 1 = ℕℤ 0
	∧	¬ ℕℤ 0 = ℕℤ 1⌝));
=DESCRIBE
Facts about addition of ubiquitous utility.
=ENDDOC
=THDOC
req_thm(⦏"ℕℤ_plus_homomorphism_thm"⦎, ([],
	⌜∀ m n : ℕ ⦁ ℕℤ(m + n) = ℕℤ m + ℕℤ n⌝));
req_thm(⦏"ℕℤ_plus_homomorphism_thm1"⦎, ([],
	⌜∀ m n : ℕ ⦁ ℕℤ m + ℕℤ n = ℕℤ(m + n)⌝));
=DESCRIBE
The fact that $ℕℤ$ is a homomorphism of the additive monoids.
=ENDDOC
=THDOC
req_thm(⦏"ℕℤ_times_homomorphism_thm"⦎, ([],
	⌜∀ m n : ℕ ⦁ ℕℤ(m * n) = ℕℤ m * ℕℤ n⌝));
req_thm(⦏"ℕℤ_times_homomorphism_thm1"⦎, ([],
	⌜∀ m n : ℕ ⦁ ℕℤ m * ℕℤ n = ℕℤ(m * n)⌝));
=DESCRIBE
The fact that $ℕℤ$ is a homomorphism of the multiplicative monoids.
=ENDDOC
=THDOC
req_thm(⦏"ℕℤ_≤_thm"⦎, ([],
	⌜∀ m n : ℕ ⦁ ℕℤ m ≤ ℕℤ n ⇔ m ≤ n⌝));
req_thm(⦏"ℕℤ_less_thm"⦎, ([],
	⌜∀ m n : ℕ ⦁ ℕℤ m < ℕℤ n ⇔ m < n⌝));
=DESCRIBE
The fact that $ℕℤ$ is strictly monotonic.
=ENDDOC
=THDOC
req_thm(⦏"ℕℤ_one_one_thm"⦎, ([],
	⌜∀m n:ℕ⦁ ℕℤ m = ℕℤ n ⇔ m = n⌝));
=DESCRIBE
The fact that $ℕℤ$ is a one to one mapping.
=ENDDOC
=THDOC
req_thm(⦏"ℤ_induction_thm"⦎, ([],
	⌜∀ p : ℤ → BOOL ⦁ p (ℕℤ 1)
	∧	(∀i⦁ p i ⇒ p (~ i))
	∧	(∀i j⦁ p i ∧ p j ⇒ p (i + j))
	⇒	(∀i⦁ p i) ⌝));
=DESCRIBE
An induction principle for the integers: any property which holds for $1$, and
which is preserved under negation and addition, holds everywhere.
The theorem is stated in a form suitable for use as an
argument to $gen\_induction\_tac$.
=ENDDOC
=THDOC
req_thm(⦏"ℤ_ℕ_plus1_thm"⦎, ([],
	⌜∀ i : ℤ ⦁ ℕℤ 0 ≤ i ⇒ ℕℤ 0 ≤ i + ℕℤ 1⌝));
=DESCRIBE
Closure of the natural numbers under addition of $1$.
=ENDDOC
=THDOC
req_thm(⦏"ℤ_ℕ_induction_thm"⦎, ([],
	⌜∀ p ⦁ p (ℕℤ 0)
	∧	(∀ i ⦁ ℕℤ 0 ≤ i ∧ p i ⇒ p (i + ℕℤ 1))
	⇒	(∀ m⦁ ℕℤ 0 ≤ m ⇒ p m)⌝));
=DESCRIBE
Ordinary induction for the natural numbers.
The theorem is stated in a form suitable for use as an
argument to $gen\_induction\_tac1$.
=ENDDOC
=THDOC
req_thm(⦏"ℤ_≤_induction_thm"⦎, ([],
	⌜∀j p⦁	p j
	∧	(∀i⦁ j ≤ i ∧ p i ⇒ p (i + ℕℤ 1))
	⇒	(∀i⦁j ≤ i ⇒ p i)⌝));
=DESCRIBE
A more general form of induction for the integers; any property
which holds at $j$ and which holds at $i + 1$, if it hold at $i$ and if $i \ge j$,
must hold for all numbers no less than $j$.
=ENDDOC
=THDOC
req_thm(⦏"ℤ_cov_induction_thm"⦎, ([],
	⌜∀j : ℤ; p⦁
		(∀i⦁ j ≤ i ∧ (∀k⦁j ≤ k ∧ k < i ⇒ p k) ⇒ p i)
	⇒	(∀i⦁j ≤ i ⇒ p i)⌝));
=DESCRIBE
A general form of course-of-values induction for the integers.
=ENDDOC
=THDOC
req_thm(⦏"ℤ_ℕ_plus_thm"⦎, ([],
	⌜∀ i j : ℤ ⦁ ℕℤ 0 ≤ i ∧ ℕℤ 0 ≤ j ⇒ ℕℤ 0 ≤ i + j⌝));
=DESCRIBE
The natural numbers are closed under addition.
=ENDDOC
=THDOC
req_thm(⦏"ℤ_eq_thm"⦎, ([],
	⌜∀ i j : ℤ ⦁ i = j ⇔ i + ~j = ℕℤ 0⌝));
req_thm(⦏"ℤ_eq_thm1"⦎, ([],
	⌜∀ i j : ℤ ⦁ i = j ⇔ ~i + j = ℕℤ 0⌝));
=DESCRIBE
Theorems that give a reduction of an equation between integers
to one with the simplest possible right-hand side.
N.b. the theorem is intended for use with
=INLINEFT
once_rewrite_tac
=TEX
, since repeated rewriting would loop.
=ENDDOC
=THDOC
req_thm(⦏"ℤ_plus_eq_thm"⦎, ([],
	⌜∀ i j k : ℤ ⦁ (i + j) = k ⇔ i = k + ~j⌝));
=DESCRIBE
Useful theorem for when rewriting.
=ENDDOC
=THDOC
req_thm(⦏"ℤ_minus_thm"⦎, ([],
	⌜∀ i j : ℤ ⦁
		~ ( ~ i ) = i
	∧	i + ~ i   = ℕℤ 0
	∧	~ i + i   = ℕℤ 0
	∧	~ (i + j) = ~ i + ~ j
	∧	~ (ℕℤ 0) = ℕℤ 0  ⌝));
=DESCRIBE
Standard facts about negation and addition. Rewriting with this moves negation inside
addition.
=ENDDOC
=THDOC
req_thm(⦏"ℤ_minus_clauses"⦎, ([],
	⌜∀i j: ℤ⦁
		~ (~ i) = i
	∧	i + ~ i = ℕℤ 0
	∧	~ i + i = ℕℤ 0
	∧	~ (i + j) = ~ i + ~ j
	∧ 	~(ℕℤ 0) = (ℕℤ 0)⌝));
=DESCRIBE
Facts about negation which are nearly always wanted as rewrite rules
for use in the proof context $ℤ$.
=ENDDOC
=THDOC
req_thm(⦏"ℤ_ℕ_cases_thm"⦎, ([],
	⌜∀ i ⦁ ℕℤ 0 ≤ i ⇒ i = ℕℤ 0 ∨ (∃ j ⦁ ℕℤ 0 ≤ j ∧ i = j + ℕℤ 1)⌝));
req_thm(⦏"ℤ_ℕ_¬_minus_thm"⦎, ([],
	⌜∀ i ⦁ ℕℤ 0 ≤ i ⇒ i = ℕℤ 0 ∨ ¬ (ℕℤ 0 ≤ ~i)⌝));
=DESCRIBE
Case analyses for the natural numbers.
=ENDDOC
=THDOC
req_thm(⦏"ℤ_¬_ℕ_thm"⦎, ([],
	⌜∀ i : ℤ ⦁ ¬ ℕℤ 0 ≤ i ⇒ ℕℤ 0 ≤ ~ i⌝));
=DESCRIBE
Integers which are not natural numbers are the negatives of natural numbers.
=ENDDOC
=THDOC
req_thm(⦏"ℤ_cases_thm"⦎, ([],
	⌜∀ i : ℤ ⦁ ∃ m : ℕ ⦁ i = ℕℤ m ∨ i = ~(ℕℤ m)⌝));
req_thm(⦏"ℤ_cases_thm1"⦎, ([],
	⌜∀ i : ℤ ⦁ ∃ m : ℕ ⦁ i = ℕℤ m ∨ i = ~(ℕℤ (m + 1))⌝));
=DESCRIBE
Two forms of case analysis for the integers.
=ENDDOC
=THDOC
req_thm(⦏"ℤ_ℕ_¬_plus1_thm"⦎, ([],
	⌜∀ i ⦁ ℕℤ 0 ≤ i ⇒ ¬ i + (ℕℤ 1) = ℕℤ 0⌝));
=DESCRIBE
$1$ is not the additive inverse of any natural number.
=ENDDOC
=THDOC
req_thm(⦏"ℤ_times_comm_thm"⦎, ([],
	⌜∀ i j : ℤ ⦁ i * j = j * i⌝));
=DESCRIBE
Commutativity of multiplication.
=ENDDOC
=THDOC
req_thm(⦏"ℤ_times_assoc_thm"⦎, ([],
	⌜∀ i j k : ℤ ⦁ (i * j) * k  = i * (j * k)⌝));
req_thm(⦏"ℤ_times_assoc_thm1"⦎, ([],
	⌜∀ i j k : ℤ ⦁ i * j * k = (i * j) * k⌝));
=DESCRIBE
Associativity of multiplication: first form moves brackets to the right;
second moves brackets to the left.
=ENDDOC
=THDOC
req_thm(⦏"ℤ_times_order_thm"⦎, ([],
	⌜∀ i : ℤ ⦁ ∀ j k : ℤ ⦁
		j * i = i * j
	∧	(i * j) * k = i * j * k
	∧	j * i * k = i * j * k⌝));
=DESCRIBE
Magic theorem for reordering products. If $i$ is specialised to $t$, rewriting
with the result floats $t$ to the beginning of the product.
=ENDDOC
=THDOC
req_thm(⦏"ℤ_times1_thm"⦎, ([],
	⌜∀ i : ℤ ⦁ i * (ℕℤ 1) = i ∧ (ℕℤ 1) * i = i⌝));
=DESCRIBE
1 is the identity for multiplication.
=ENDDOC
=THDOC
req_thm(⦏"ℤ_times_plus_distrib_thm"⦎, ([],
	⌜∀ i j k : ℤ ⦁
		i * (j + k) = i * j + i * k
	∧	(i + j) * k = i * k + j * k⌝));
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
req_thm(⦏"ℤ_times0_thm"⦎, ([],
	⌜∀ i : ℤ ⦁ ℕℤ 0 * i = ℕℤ 0 ∧ i * ℕℤ 0 = ℕℤ 0⌝));
req_thm(⦏"ℤ_times_eq_0_thm"⦎, ([],
	⌜∀ i j : ℤ ⦁ i * j = ℕℤ 0 ⇔ i = ℕℤ 0 ∨ j = ℕℤ 0⌝));
=DESCRIBE
0 is an annihilator of any element, and moreover, by the second theorem
it is the only annihilator of any element apart from itself.
=ENDDOC
=THDOC
req_thm(⦏"ℤ_times_minus_thm"⦎, ([],
	⌜∀ i j : ℤ ⦁
		~ i * j = ~(i * j)
	∧	i * ~ j = ~(i * j)
	∧	~ i * ~ j = i * j⌝));
=DESCRIBE
Standard facts about negation and multiplication.
Rewriting with this moves negation outside multiplication.
=ENDDOC
=THDOC
req_thm(⦏"ℤ_times_clauses"⦎, ([],
	⌜∀ i j : ℤ ⦁
		ℕℤ 0 * i = ℕℤ 0
	∧	i * ℕℤ 0 = ℕℤ 0
	∧	i * ℕℤ 1 = i
	∧	ℕℤ 1 * i = i⌝));
=DESCRIBE
Ubiquitously useful facts about multiplication.
=ENDDOC
=THDOC
req_thm(⦏"ℤ_ℕ_times_thm"⦎, ([],
	⌜∀ i j ⦁ ℕℤ 0 ≤ i ∧ ℕℤ 0 ≤ j ⇒ ℕℤ 0 ≤ i * j⌝));
=DESCRIBE
The natural numbers are closed under multiplication.
=ENDDOC
=THDOC
req_thm(⦏"ℤ_≤_trans_thm"⦎, ([],
	⌜∀ i j k : ℤ ⦁ i ≤ j ∧ j ≤ k ⇒ i ≤ k⌝));
req_thm(⦏"ℤ_≤_cases_thm"⦎, ([],
	⌜∀ i j : ℤ ⦁ i ≤ j ∨ j ≤ i⌝));
req_thm(⦏"ℤ_≤_refl_thm"⦎, ([],
	⌜∀ i : ℤ ⦁ i ≤ i⌝));
req_thm(⦏"ℤ_≤_antisym_thm"⦎, ([],
	⌜∀ i j : ℤ ⦁ i ≤ j ∧ j ≤ i ⇒ i = j⌝));
=DESCRIBE
≤ is transitive, reflexive, antisymmetric and total.
=ENDDOC
=THDOC
req_thm(⦏"ℤ_less_trans_thm"⦎, ([],
	⌜∀ i j k : ℤ ⦁ i < j ∧ j < k ⇒ i < k⌝));
req_thm(⦏"ℤ_less_irrefl_thm"⦎, ([],
	⌜∀ i j : ℤ ⦁ ¬ (i < j ∧ j < i)⌝));
req_thm(⦏"ℤ_less_cases_thm"⦎, ([],
	⌜∀ i j : ℤ ⦁ i < j ∨ i = j ∨ j < i⌝));
=DESCRIBE
$<$ is transitive and irreflexive and total.
=ENDDOC
=THDOC
req_thm(⦏"ℤ_≤_minus_thm"⦎, ([],
	⌜∀i j:ℤ⦁ i ≤ j ⇔ ~j ≤ ~i⌝));
req_thm(⦏"ℤ_minus_≤_thm"⦎, ([],
	⌜∀i j:ℤ⦁ ~i ≤ ~j ⇔ j ≤ i⌝));
req_thm(⦏"ℤ_minus_less_thm"⦎, ([],
	⌜∀ i j : ℤ ⦁ ~ i < ~ j ⇔ j < i⌝));
=DESCRIBE
Theorems for rewriting inequalities containing additive inverses.
=ENDDOC
=THDOC
req_thm(⦏"ℤ_≤_less_eq_thm"⦎,([],
	⌜∀ i j : ℤ ⦁ i ≤ j ⇔ (i < j ∨ i = j)⌝));
=DESCRIBE
The natural definition of $≤$ in terms of $<$.
=ENDDOC
=THDOC
req_thm(⦏"ℤ_less_≤_trans_thm"⦎, ([],
	⌜∀ i j k : ℤ ⦁ i < j ∧ j ≤ k ⇒ i < k⌝));
req_thm(⦏"ℤ_≤_less_trans_thm"⦎, ([],
	⌜∀ i j k : ℤ ⦁ i ≤ j ∧ j < k ⇒ i < k⌝));
=DESCRIBE
Forms of ``transitivity'' in which
s strict and a non-strict inequality give a strict inequality.
=ENDDOC
=THDOC
req_thm(⦏"ℤ_minus_ℕ_≤_thm"⦎, ([],
	⌜∀ i m ⦁ i + ~ (ℕℤ m) ≤ i⌝));
req_thm(⦏"ℤ_≤_plus_ℕ_thm"⦎, ([],
	⌜∀ i m ⦁ i ≤ i + ℕℤ m⌝));
=DESCRIBE
Subtracting a natural number from any integer gives a smaller one,
and adding  a natural number to any integer gives a larger one.
=ENDDOC
=THDOC
req_thm(⦏"ℤ_∈_ℕ_thm"⦎, ([],
	⌜∀ i ⦁ ℕℤ 0 ≤ i ⇔ ∃ m ⦁ i = ℕℤ m⌝));
=DESCRIBE
The natural numbers are precisely those which are bounded below by $0$.
=ENDDOC
=THDOC
req_thm(⦏"ℤ_≤_≤_0_thm"⦎, ([],
	⌜∀ i j : ℤ ⦁ i ≤ j ⇔ i + ~j ≤ ℕℤ 0⌝));
req_thm(⦏"ℤ_less_less_0_thm"⦎, ([],
	⌜∀ i j : ℤ ⦁ i < j ⇔ i + ~j < ℕℤ 0⌝));
req_thm(⦏"ℤ_≤_≤_0_thm1"⦎, ([],
	⌜∀ i j : ℤ ⦁ i ≤ j ⇔ ℕℤ 0 ≤ j + ~i⌝));
req_thm(⦏"ℤ_less_less_0_thm1"⦎, ([],
	⌜∀ i j : ℤ ⦁ i < j ⇔ ℕℤ 0 < j + ~i⌝));
=DESCRIBE
The first two theorems give reductions of an inequality between integers
to one with the simplest possible right-hand side.  The other two
theorems give a similar reduction to an inequality with the simplest
possible left-hand side.
N.b. these theorems are intended for use with
=INLINEFT
once_rewrite_tac
=TEX
, since repeated rewriting would loop.
=ENDDOC
=THDOC
req_thm(⦏"ℤ_≤_clauses"⦎, ([],
	⌜∀i j k:ℤ⦁
		(i + k ≤ j + k ⇔ i ≤ j)
	∧	(k + i ≤ j + k ⇔ i ≤ j)
	∧	(i + k ≤ k + j ⇔ i ≤ j)
	∧	(k + i ≤ k + j ⇔ i ≤ j)
	∧	(i + k ≤ k ⇔ i ≤ ℕℤ 0)
	∧	(k + i ≤ k ⇔ i ≤ ℕℤ 0)
	∧	(k ≤ k + j ⇔ ℕℤ 0 ≤ j)
	∧	(k ≤ j + k ⇔ ℕℤ 0 ≤ j)
	∧	(i ≤ i)
	∧	¬ ℕℤ 1 ≤ ℕℤ 0
	∧	ℕℤ 0 ≤ ℕℤ 1 ⌝));
=DESCRIBE
Facts about ≤ of ubiquitous utility
=ENDDOC
=THDOC
req_thm(⦏"ℤ_less_clauses"⦎, ([],
	⌜∀ i j k : ℤ ⦁
		(i + k < j + k ⇔ i < j)
	∧	(k + i < j + k ⇔ i < j)
	∧	(i + k < k + j ⇔ i < j)
	∧	(k + i < k + j ⇔ i < j)
	∧	(i + k < k ⇔ i < ℕℤ 0)
	∧	(k + i < k ⇔ i < ℕℤ 0)
	∧	(i < k + i ⇔ ℕℤ 0 < k)
	∧	(i < i + k ⇔ ℕℤ 0 < k)
	∧	¬ i < i
	∧	ℕℤ 0 < ℕℤ 1
	∧	¬ ℕℤ 1 < ℕℤ 0 ⌝));
=DESCRIBE
Facts about $<$ of ubiquitous utility
=ENDDOC
=THDOC
req_thm(⦏"ℤ_¬_≤_thm"⦎, ([], ⌜∀ i j : ℤ ⦁ ¬ i ≤ j ⇔ j < i⌝));
req_thm(⦏"ℤ_¬_less_thm"⦎, ([], ⌜∀ i j : ℤ ⦁ ¬ i < j ⇔ j ≤ i⌝));
=DESCRIBE
Facts about $<$ of ubiquitous utility
=ENDDOC
=THDOC
req_thm(⦏"ℤ_ℕ_abs_thm"⦎, ([],
	⌜∀ m : ℕ ⦁ Abs (ℕℤ m) = ℕℤ m ∧ Abs (~(ℕℤ m)) = ℕℤ m⌝));
req_thm(⦏"ℤ_abs_thm"⦎, ([],
	⌜∀ i : ℤ ⦁ ℕℤ 0 ≤ i ⇒ (Abs (i) = i ∧ Abs (~i) = i)⌝));
req_thm(⦏"ℤ_abs_ℕ_thm"⦎, ([],
	⌜∀ i : ℤ ⦁ ℕℤ 0 ≤ Abs i⌝));
req_thm(⦏"ℤ_abs_eq_0_thm"⦎, ([],
	⌜∀ i : ℤ ⦁ Abs i = ℕℤ 0 ⇔ i = ℕℤ 0⌝));
req_thm(⦏"ℤ_abs_minus_thm"⦎, ([],
	⌜∀ i : ℤ ⦁ Abs (~i) = Abs i⌝));
req_thm(⦏"ℤ_ℕ_abs_minus_thm"⦎, ([],
	⌜∀ i j : ℤ ⦁ ℕℤ 0 ≤ i ∧ ℕℤ 0 ≤ j ∧ j ≤ i ⇒ Abs (i + ~j) ≤ i⌝));
req_thm(⦏"ℤ_abs_times_thm"⦎, ([],
	⌜∀ i j : ℤ ⦁ Abs (i * j) = Abs i * Abs j⌝));
req_thm(⦏"ℤ_abs_plus_thm"⦎, ([],
	⌜∀ i j : ℤ ⦁ Abs (i + j) ≤ Abs i + Abs j⌝));
=DESCRIBE
Standard properties of the absolute value function. The last of these is
commonly known as the {\em triangle inequality}.
=ENDDOC
=THDOC
req_thm(⦏"ℤ_div_mod_unique_thm"⦎, ([],
	⌜∀ i j d r : ℤ ⦁ ¬j = ℕℤ 0 ⇒
	(	(i = d * j + r ∧ ℕℤ 0 ≤ r ∧ r < Abs j)
	⇔	(d = i Div j ∧ r = i Mod j)	)⌝));
=DESCRIBE
The defining property of the division and modulo operations characterises
those operations.
=ENDDOC
=THDOC
req_thm(⦏"ℤ_div_mod_unique_lemma1"⦎, ([],
	⌜∀ i j : ℤ ⦁ ℕℤ 0 ≤ i ∧ ℕℤ 0 ≤ j ∧ i * j < j
	⇒ i = ℕℤ 0⌝));
req_thm(⦏"ℤ_div_mod_unique_lemma2"⦎, ([],
	⌜∀ j d r : ℤ ⦁ ¬j = ℕℤ 0
   ⇒ (	(d * j + r = ℕℤ 0 ∧ ℕℤ 0 ≤ r ∧ r < Abs j)
	⇒ d = ℕℤ 0 ∧ r = ℕℤ 0)⌝));
req_thm(⦏"ℤ_div_mod_unique_lemma3"⦎, ([],
	⌜∀ i j d r D R : ℤ ⦁ ¬j = ℕℤ 0 ⇒
	(	(D * j + R = d * j + r ∧ ℕℤ 0 ≤ r ∧ r ≤ R ∧ R < Abs j)
	⇒	D = d ∧ R = r)⌝));
=DESCRIBE
Lemmas used for the proof of $ℤ\_div\_mod\_unique\_thm$.
=ENDDOC
\section{THEOREMS PROVED IN IMP105}
=THDOC
req_thm(⦏"ℤ_fun_∃_thm"⦎, ([], ⌜∀f g : 'a → 'a; z: 'a⦁
	(∀x⦁ g(f x) = x)
∧	(∀y⦁ f(g y) = y)
⇒	∃⋎1h : ℤ → 'a⦁
	h(ℕℤ 0) = z
∧	(∀i⦁h(i + ℕℤ 1) = f(h i))
∧	(∀i⦁h(i - ℕℤ 1) = g(h i))⌝));
=DESCRIBE
A theorem for introducing functions on the integers.
=ENDDOC
\section{START OF SIGNATURE}
=DOC
signature ⦏ℤ⦎ = sig
=DESCRIBE
This provides the basic definitions proof support for the HOL
theory of integers.
It creates the theory $ℤ$.
=ENDDOC
\section{THEOREM BINDINGS}

=DOC
val ⦏ℕℤ_plus_homomorphism_thm⦎ : THM;
val ⦏ℕℤ_plus_homomorphism_thm1⦎ : THM;
val ⦏ℕℤ_times_homomorphism_thm⦎ : THM;
val ⦏ℕℤ_times_homomorphism_thm1⦎ : THM;
val ⦏ℕℤ_≤_thm⦎ : THM;				val ⦏ℕℤ_less_thm⦎ : THM;
val ⦏ℕℤ_one_one_thm⦎ : THM;			val ⦏ℤ_¬_≤_thm⦎ : THM;
val ⦏ℤ_¬_ℕ_thm⦎ : THM;				val ⦏ℤ_¬_less_thm⦎ : THM;
val ⦏ℤ_≤_≤_0_thm1⦎ : THM;				val ⦏ℤ_≤_≤_0_thm⦎ : THM;
val ⦏ℤ_≤_antisym_thm⦎ : THM;			val ⦏ℤ_≤_cases_thm⦎ : THM;
val ⦏ℤ_≤_clauses⦎ : THM;				val ⦏ℤ_≤_less_eq_thm⦎ : THM;
val ⦏ℤ_≤_minus_thm⦎ : THM;			val ⦏ℤ_≤_plus_ℕ_thm⦎ : THM;
val ⦏ℤ_≤_refl_thm⦎ : THM;				val ⦏ℤ_≤_trans_thm⦎ : THM;
val ⦏ℤ_∈_ℕ_thm⦎ : THM;				val ⦏ℤ_ℕ_¬_minus_thm⦎ : THM;
val ⦏ℤ_ℕ_¬_plus1_thm⦎ : THM;			val ⦏ℤ_ℕ_abs_minus_thm⦎ : THM;
val ⦏ℤ_ℕ_abs_thm⦎ : THM;				val ⦏ℤ_ℕ_cases_thm⦎ : THM;
val ⦏ℤ_ℕ_induction_thm⦎ : THM;			val ⦏ℤ_ℕ_plus_thm⦎ : THM;
val ⦏ℤ_ℕ_plus1_thm⦎ : THM;			val ⦏ℤ_ℕ_times_thm⦎ : THM;
val ⦏ℤ_abs_ℕ_thm⦎ : THM;				val ⦏ℤ_abs_eq_0_thm⦎ : THM;
val ⦏ℤ_abs_minus_thm⦎ : THM;			val ⦏ℤ_abs_thm⦎ : THM;
val ⦏ℤ_abs_times_thm⦎ : THM;			val ⦏ℤ_abs_plus_thm⦎ : THM;
val ⦏ℤ_cases_thm⦎ : THM;				val ⦏ℤ_cases_thm1⦎ : THM;
val ⦏ℤ_div_mod_unique_thm⦎ : THM;		val ⦏ℤ_eq_thm⦎ : THM;
val ⦏ℤ_eq_thm1⦎ : THM;				val ⦏ℤ_induction_thm⦎ : THM;
val ⦏ℤ_≤_induction_thm⦎ : THM;			val ⦏ℤ_cov_induction_thm⦎ : THM;
val ⦏ℤ_fun_∃_thm⦎ : THM;				val ⦏ℤ_less_≤_trans_thm⦎ : THM;
val ⦏ℤ_less_clauses⦎ : THM;				val ⦏ℤ_less_cases_thm⦎ : THM;
val ⦏ℤ_less_irrefl_thm⦎ : THM;			val ⦏ℤ_less_less_0_thm⦎ : THM;
val ⦏ℤ_less_less_0_thm1⦎ : THM;			val ⦏ℤ_less_trans_thm⦎ : THM;
val ⦏ℤ_minus_≤_thm⦎ : THM;			val ⦏ℤ_minus_ℕ_≤_thm⦎ : THM;
val ⦏ℤ_minus_clauses⦎ : THM;			val ⦏ℤ_minus_less_thm⦎ : THM;
val ⦏ℤ_minus_thm⦎ : THM;				val ⦏ℤ_plus_assoc_thm⦎ : THM;
val ⦏ℤ_plus_assoc_thm1⦎ : THM;			val ⦏ℤ_plus_clauses⦎ : THM;
val ⦏ℤ_plus_comm_thm⦎ : THM;			val ⦏ℤ_plus_eq_thm⦎ : THM;
val ⦏ℤ_plus_minus_thm⦎ : THM;			val ⦏ℤ_plus_order_thm⦎ : THM;
val ⦏ℤ_plus0_thm⦎ : THM;				val ⦏ℤ_times_assoc_thm⦎ : THM;
val ⦏ℤ_times_assoc_thm1⦎ : THM;			val ⦏ℤ_times_clauses⦎ : THM;
val ⦏ℤ_times_comm_thm⦎ : THM;			val ⦏ℤ_times_eq_0_thm⦎ : THM;
val ⦏ℤ_times_minus_thm⦎ : THM;			val ⦏ℤ_times_order_thm⦎ : THM;
val ⦏ℤ_times_plus_distrib_thm⦎ : THM;		val ⦏ℤ_times0_thm⦎ : THM;
val ⦏ℤ_times1_thm⦎ : THM;	
=DESCRIBE
These are the ML value bindings for the theorems saved in the theory
=INLINEFT
ℤ
=TEX
.
=ENDDOC

\section{DEFINITION BINDINGS}
=DOC
val ⦏Is_ℤ_Rep_def⦎ : THM;				val ⦏ℤ_ℕℤ_def⦎ : THM;
val ⦏ℤ_minus_def⦎ : THM;				val ⦏ℤ_plus_def⦎ : THM;
val ⦏ℤ_subtract_def⦎ : THM;				val ⦏ℤ_times_def⦎ : THM;
val ⦏ℤ_≤_def⦎ : THM;					val ⦏ℤ_less_def⦎ : THM;
val ⦏ℤ_≥_def⦎ : THM;					val ⦏ℤ_greater_def⦎ : THM;
val ⦏ℤ_abs_def⦎ : THM;					val ⦏ℤ_mod_def⦎ : THM;
val ⦏ℤ_div_def⦎ : THM;
=DESCRIBE
These are the ML bindings of the definitions of the theory $ℤ$.
=ENDDOC
\section{TACTICS}
=DOC
val ⦏ℤ_≤_induction_tac⦎ : TERM -> TACTIC
=DESCRIBE
This tactic implements induction over subsets of the integers that are bounded below:
to prove that
=INLINEFT
t[x]
=TEX
holds whenever $x \ge j$, it suffices to prove $t[j/x]$ and to prove $t[x+1/x]$ on the
assumption that $t[x]$ and $x \ge j$.

The term argument must be a variable that appears free in the conclusion of the goal.
The variable must also appear free once, and only once, in the assumptions, in an
assumption of the form $j\ge x$.
=FRULE 2 Tactic
ℤ_≤_induction_tac ⌜x⌝
├
{ Γ; j ≤ x } t
├
{ Γ } t[j/x] ; strip{t, j ≤ x, Γ} t[x+1/x]
=TEX
=SEEALSO
=INLINEFT
ℤ_cases_thm
=TEX
,
=INLINEFT
intro_∀_tac
=TEX
,
=INLINEFT
ℤ_induction_tac
=TEX
,
=INLINEFT
ℤ_ℕ_induction_tac
=TEX
,
=INLINEFT
ℤ_cov_induction_tac
=TEX
=FAILURE
93401	?0 is not a variable of type ⓣℤ⌝
93402	A term of the form ⓩj ≤ i⌝ where i is the induction variable
	could not be found in the assumptions
93403	?0 appears free in more than one assumption of the goal
93404	?0 does not appear free in the conclusions of the goal
=ENDDOC
=DOC
val ⦏ℤ_cov_induction_tac⦎ : TERM -> TACTIC
=DESCRIBE
This tactic implements course-of-values induction over subsets of the integers that are bounded below: to prove that
=INLINEFT
t[x]
=TEX
holds whenever $x \ge j$,
 it suffices to prove $t[i/x]$ on the assumptions that $j≤i$ and
=INLINEFT
∀k ⦁ j ≤ k ∧ k < i ⇒ t[k/x]
=TEX


The term argument must be a variable that appears free in the conclusion of the goal.
The variable must also appear free once, and only once, in the assumptions, in an
assumption of the form $j≤x$.

=FRULE 2 Tactic
ℤ_≤_induction_tac ⓩx⌝
├
{ Γ, j≤x} t[x]
├
strip {j≤x, ⓩ∀k⦁ j≤k ∧ k<x ⇒ t[k]⌝, Γ} t[x]
=TEX
=SEEALSO
=INLINEFT
ℤ_cases_thm
=TEX
,
=INLINEFT
intro_∀_tac
=TEX
,
=INLINEFT
ℤ_induction_tac
=TEX
,
=INLINEFT
ℤ_ℕ_induction_tac
=TEX
,
=INLINEFT
ℤ_≤_induction_tac
=TEX
=FAILURE
93401	?0 is not a variable of type ⓣℤ⌝
93402	A term of the form ⓩj ≤ i⌝ where i is the induction variable
	could not be found in the assumptions
93403	?0 appears free in more than one assumption of the goal
93404	?0 does not appear free in the conclusions of the goal
=ENDDOC

=DOC
val ⦏ℤ_ℕ_induction_tac⦎ : TACTIC
=DESCRIBE
This tactic implements induction over the natural numbers (as a subset of the HOL integers):
to prove
=INLINEFT
ℕℤ 0 ≤ x ⇒ t
=TEX
, it suffices to prove $t[0/x]$ and to prove $t[x+1/x]$ on the
assumption that $t$. The conclusion of the goal must have the
form
=INLINEFT
ℕℤ 0 ≤ x ⇒ t
=TEX
.
=FRULE 2 Tactic
ℤ_ℕ_induction_tac
├
{ Γ } ℕℤ 0 ≤ x ⇒ t
├
{ Γ } t[0/x] ; strip{t, Γ} t[x+1/x]
=TEX
=SEEALSO
=INLINEFT
ℤ_cases_thm
=TEX
,
=INLINEFT
intro_∀_tac
=TEX
,
=INLINEFT
ℤ_induction_tac
=TEX
,
=INLINEFT
ℤ_≤_induction_tac
=TEX
,
=INLINEFT
ℤ_cov_induction_tac
=TEX
=FAILUREC
\paragraph{Errors} As for $gen\_induction\_tac1$.

=ENDDOC
=DOC
val ⦏ℤ_induction_tac⦎ : TERM -> TACTIC
=DESCRIBE
An induction-like tactic for the integers, based on the fact that
any subset of the integers containing $1$ and closed under negation and
addition must contain every integer.
=FRULE 2 Tactic
ℤ_ℕ_induction_tac ⌜x⌝
├
{ Γ } t
├
{ Γ } t[1/x] ;
strip{t[i/x], Γ} t[~i/x] ;
strip{t[i/x] ∧ t[j/x], Γ} t[i+j/x]
=TEX
=SEEALSO
=INLINEFT
ℤ_ℕ_induction_tac
=TEX
,
=INLINEFT
ℤ_intro_∀_tac
=TEX
,
=INLINEFT
ℤ_cases_thm
=TEX
=FAILUREC
\paragraph{Errors} As for $gen\_induction\_tac$.

=ENDDOC
\section{SYNTAX FUNCTIONS}

=DOC
val ⦏dest_ℤ_≤⦎ : TERM -> TERM * TERM;
val ⦏dest_ℤ_≥⦎ : TERM -> TERM * TERM;
val ⦏dest_ℤ_abs⦎ : TERM -> TERM;
val ⦏dest_ℤ_div⦎ : TERM -> TERM * TERM;
val ⦏dest_ℤ_greater⦎ : TERM -> TERM * TERM;
val ⦏dest_ℤ_less⦎ : TERM -> TERM * TERM;
val ⦏dest_ℤ_minus⦎ : TERM -> TERM;
val ⦏dest_ℤ_mod⦎ : TERM -> TERM * TERM;
val ⦏dest_ℤ_plus⦎ : TERM -> TERM * TERM;
val ⦏dest_ℤ_signed_int⦎ : TERM -> INTEGER;
val ⦏dest_ℤ_subtract⦎ : TERM -> TERM * TERM;
val ⦏dest_ℤ_times⦎ : TERM -> TERM * TERM;
=DESCRIBE
These are derived destructor
functions for the basic arithmetic operations on the integers.
An optionally signed integer literal, $signed\_int$, is taken to be either a numeric
literal or the result of applying
=INLINEFT
(~_)
=TEX
\ to a numeric literal. The other constructors correspond directly
to the arithmetic operations of the theory $ℤ$ with alphabetic
names assigned to give valid ML name as needed
($greater: <$,
$less: >$,
=INLINEFT
minus: ~
=TEX
,
$plus: +$,
$subtract: -$,
$times: *$).

As usual, there are also corresponding discriminator ($is\_\ldots$) and
constructor functions ($dest\_\ldots$).
For programming convenience, $dest\_ℤ\_signed\_int$ returns $0$  and
$mk\_ℤ\_signed\_int$ returns $true$ when
applied to
=INLINEFT
~0
=TEX
, but $mk\_ℤ\_signed\_int$ cannot be used to construct such a term.
=FAILURE
93101	?0 is not of the form ⌜i ≤⋎Z j⌝
93102	?0 is not of the form ⌜i ≥⋎Z j⌝
93103	?0 is not of the form ⌜Abs⋎Z i⌝
93104	?0 is not of the form ⌜i Div⋎Z j⌝
93105	?0 is not of the form ⌜i >⋎Z j⌝
93106	?0 is not of the form ⌜i <⋎Z j⌝
93107	?0 is not of the form ⌜~⋎Zi⌝
93108	?0 is not of the form ⌜i Mod⋎Z j⌝
93109	?0 is not of the form ⌜i +⋎Z j⌝
93110	?0 is not an optionally signed integer literal (theory ℤ)
93111	?0 is not of the form ⌜i -⋎Z j⌝
93112	?0 is not of the form ⌜i *⋎Z j⌝
=ENDDOC

=DOC
val ⦏is_ℤ_≤⦎ : TERM -> bool;
val ⦏is_ℤ_≥⦎ : TERM -> bool;
val ⦏is_ℤ_abs⦎ : TERM -> bool;
val ⦏is_ℤ_div⦎ : TERM -> bool;
val ⦏is_ℤ_greater⦎ : TERM -> bool;
val ⦏is_ℤ_less⦎ : TERM -> bool;
val ⦏is_ℤ_minus⦎ : TERM -> bool;
val ⦏is_ℤ_mod⦎ : TERM -> bool;
val ⦏is_ℤ_plus⦎ : TERM -> bool;
val ⦏is_ℤ_signed_int⦎ : TERM -> bool;
val ⦏is_ℤ_subtract⦎ : TERM -> bool;
val ⦏is_ℤ_times⦎ : TERM -> bool;
=DESCRIBE
These are derived discriminator
functions for the Z basic arithmetic operations.
See the documentation for the destructor functions ($dest\_ℤ\_plus$ etc.)
for more information.
=ENDDOC

=DOC
val ⦏mk_ℤ_≤⦎ : TERM * TERM -> TERM;
val ⦏mk_ℤ_≥⦎ : TERM * TERM -> TERM;
val ⦏mk_ℤ_abs⦎ : TERM -> TERM;
val ⦏mk_ℤ_div⦎ : TERM * TERM -> TERM;
val ⦏mk_ℤ_greater⦎ : TERM * TERM -> TERM;
val ⦏mk_ℤ_less⦎ : TERM * TERM -> TERM;
val ⦏mk_ℤ_minus⦎ : TERM -> TERM;
val ⦏mk_ℤ_mod⦎ : TERM * TERM -> TERM;
val ⦏mk_ℤ_plus⦎ : TERM * TERM -> TERM;
val ⦏mk_ℤ_signed_int⦎ : INTEGER -> TERM;
val ⦏mk_ℤ_subtract⦎ : TERM * TERM -> TERM;
val ⦏mk_ℤ_times⦎ : TERM * TERM -> TERM;
=DESCRIBE
These are derived constructor
functions for the Z basic arithmetic operations.
See the documentation for the destructor functions ($dest\_ℤ\_plus$ etc.)
for more information.
=FAILURE
93201	?0 does not have type ℤ
=ENDDOC

\section{CONVERSIONS}
=DOC
val ⦏ℤ_ℕ_plus_conv⦎ : CONV;		val ⦏ℤ_ℕ_times_conv⦎ : CONV;

val ⦏ℤ_subtract_minus_conv⦎ : CONV;	val ⦏ℤ_greater_less_conv⦎ : CONV
val ⦏ℤ_≥_≤_conv⦎ : CONV;

val ⦏ℤ_plus_conv⦎ : CONV;			val ⦏ℤ_times_conv⦎ : CONV
val ⦏ℤ_abs_conv⦎ : CONV;			val ⦏ℤ_div_conv⦎ : CONV
val ⦏ℤ_mod_conv⦎ : CONV;			val ⦏ℤ_≤_conv⦎ : CONV
val ⦏ℤ_less_conv⦎ : CONV			val ⦏ℤ_eq_conv⦎ : CONV
=DESCRIBE
These conversions are used to perform evaluation of arithmetic expressions involving
numeric literal operands. The normal interface to the conversion is
via the proof context $ℤ$ and other proof contexts which contain
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
93301	?0 is not of the form ?1 where ⌜i⌝ and ⌜j⌝ are numeric literals (theory ℤ)
93302	?0 is not of the form ?1 (theory ℤ)
93303	?0 is not of the form ?1 where ⌜i⌝ and ⌜j⌝ are optionally signed
	numeric literals (theory ℤ)
=ENDDOC
\section{PROOF CONTEXTS}
=DOC
(* Proof Context: ⦏'ℤ⦎ *)
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
ℤ_plus_conv, ℤ_times_conv, ℤ_subtract_minus_conv
ℤ_abs_conv, ℤ_div_conv, ℤ_mod_conv
ℤ_eq_conv, ℤ_≤_conv, ℤ_less_conv
ℤ_≥_≤_conv, ℤ_greater_less_conv,
ℤ_plus_clauses, ℤ_minus_clauses, ℤ_≤_clauses
ℤ_less_clauses, ℤ_¬_≤_thm, ℤ_¬_less_thm
=TEX
Stripping theorems:
=GFT
ℤ_eq_conv, ℤ_≤_conv, ℤ_less_conv
ℤ_≥_≤_conv, ℤ_greater_less_conv,
ℤ_plus_clauses, ℤ_minus_clauses, ℤ_≤_clauses
ℤ_less_clauses,
and all the above pushed through ¬

ℤ_¬_≤_thm, ℤ_¬_less_thm, ℤ_≤_conv, ℤ_less_conv
=TEX

Stripping conclusions: as for stripping theorems.

Rewriting canonicalisation: blank.

=TEX
Automatic proof procedures:
=INLINEFT
basic_prove_tac
=TEX
,
=INLINEFT
basic_prove_conv
=TEX
.
Automatic existence prover: blank.
=ENDDOC
Should evaluable arithmetic expressions on one or both sides of a stripped equation
be evaluated during stripping?
\section{EPILOGUE}
=SML
end (* of signature ℤ *);
=SML
=TEX

\section{TEST POLICY}
The module tests for this module are to follow the guidelines
laid down in the quality plan~\cite{DS/FMU/IED/PLN008}.

\twocolumn[\section{INDEX}]
\small
\printindex

\end{document}


=IGN
********************************************************************************
dtd038.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  dtd038.doc  ℤ 2002/10/17 16:20:01 1.23 dtd038.doc,v
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

\def\Title{Elementary Theory of Arithmetic}

\def\AbstractText{This document contains the detailed design for the elementary theory of arithmetic for ICL HOL.}

\def\Reference{DS/FMU/IED/DTD038}

\def\Author{R.D. Arthan}


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
%% LaTeX2e port: \TPPtitle{Elementary Theory of Arithmetic}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/DTD038}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{1.23%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: %\TPPdate{}  %% Mandatory field (with sensible default)
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{R.D.~Arthan & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.B.Jones & HAT Team Leader}
%% LaTeX2e port: \TPPabstract{
%% LaTeX2e port: This document contains the detailed design for the elementary
%% LaTeX2e port: theory of arithmetic for ICL HOL.}
%% LaTeX2e port: %\TPPabstractB{}
%% LaTeX2e port: %\TPPabstractC{}
%% LaTeX2e port: %\TPPabstractD{}
%% LaTeX2e port: %\TPPabstractE{}
%% LaTeX2e port: %\TPPabstractF{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	Library}}
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
\item [Issue 1.3 (1991/10/10) (10 October 1991)]
First draft.
\item [Issue 1.5 (1991/10/16)\ (16 October 1991)]
Corrected definition of subtraction and added a theorem about it.
$Div$ and $Mod$ and subtraction are now all loosely defined.
\item [Issue 1.7 (1991/11/15) (15 November 1991)] Corrected definition of $>$. Corrected $lt\_trans\_thm$.
\item [Issue 1.9 (1992/01/06) (\FormatDate{92/01/06%
})] Change names of complete induction material (now called
course-of-values induction). Added theorem about uniqueness of
division and modulus.

\item[Issue 1.10 (1992/01/20)~(\FormatDate{92/01/20}) ] Updated to use new fonts.
\item[Issue 1.11 (1992/01/27) (23rd January 1992)]
$new\_axiom$, $simple\_new\_type\_defn$ and $new\_type\_defn$
are
all changed to take lists of keys, rather than single ones.
\item[Issue 1.12 (1992/03/20)-1.16 (1992/08/21)] Minor addition to minus clauses.
	Use correct quotation symbols.
	Add indexing characters in theory documentation.
\item[Issue 1.17 (1993/01/07),1.18 (1993/01/11) (7th-11th January 1993)]
Clarifying/correcting text.
\item[Issue 1.19 (1993/07/12) (12th July 1993)]
Added theorem about least upper bounds.
\item[Issue 1.20 (1999/02/12)]
Removed duplicated definition.
\item[Issue 1.21 (2000/12/04)]
Added the minimum principle (to help with the introduction of the real numbers).
\item[Issue 1.22 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.23 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.24 (2005/05/07)] HOL now supports left-associative operators.
\item[Issue 1.25 (2005/12/16)] The prefix for private interfaces is now $pp'$ rather than $icl'$.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
Theorems on subtraction and on linearity of $<$ and ≤
with respect to addition to be added.
\pagebreak
\section{GENERAL}
\subsection{Scope}
This document contains the detailed design for the
elementary theory of arithmetic ICL HOL.
The high level design for this material is given in \cite{DS/FMU/IED/HLD011}.

\subsection{Introduction}
This document develops an elementary theory of arithmetic. Here
the subject matter of ``arithmetic'' is taken to be the type ${:}ℕ$
of natural (i.e. non-negative) numbers together with the operations
of addition, subtraction, multiplication and modulus and the usual
ordering relation in its four guises.

The type ${:}ℕ$ is characterised using the successor function $Suc$,
however it is the intention that $Suc$ should be little used
outside this theory, the more natural $+1$ being what is supported
systematically by the theorems provided here.

The theory contains theorems under the following headings:

\begin{itemize}
\item
Peano postulates
\item
primitive recursion theorem
\item
theorems about addition
\item
theorems about subtraction
\item
theorems about $≤$
\item
theorems about $<$
\item
theorems about multiplication
\item
theorems about division and modulus
\end{itemize}

We also give a conversion (allowing reasoning with numeric literals)
and induction tactics and tacticals.

Thus all we have for $>$ and $≥$ are the definitions.
This is deliberate: the definitions
simply turn $>$ and $≥$ around to yield $<$ and $≤$ and the theorems
about these may then be used.
\subsubsection{Purpose and Background}
See \cite{DS/FMU/IED/HLD011}.
\subsubsection{Dependencies}
This document depends on the theory design support
tools in \cite{DS/FMU/IED/DTD035}. The implementation
will depend on the theory of pairs in \cite{DS/FMU/IED/IMP037}
\subsubsection{Possible Enhancements}
None known.
\subsubsection{Deficiencies}
None known.
\section{THE THEORY CONTENTS}
\subsection{Theory Name}
=THDOC
req_name "ℕ" (Value "pair");
=DESCRIBE
The theory ``⦏ℕ⦎'' contains the definitions
of  the type, ${:}ℕ$, of natural numbers and of
the usual arithmetic operations. It also contains theorems giving
the Peano postulates, the principle of definition by primitive recursion
together with a number of theorems giving elementary properties
of the arithmetic operations.
=ENDDOC
\subsection{Basic Definitions}
=THDOC
req_const (⦏"Is_ℕ_Rep"⦎, ⓣIND → BOOL⌝);
req_defn(["Is_ℕ_Rep","is_ℕ_rep_def"],([], ⌜
	∃ zero: IND; suc: IND → IND⦁
		  (Is_ℕ_Rep zero ∧ (∀ n⦁ Is_ℕ_Rep n ⇒ Is_ℕ_Rep (suc n))) ∧
		  (∀ n⦁ Is_ℕ_Rep n ⇒ ¬ suc n = zero) ∧
		  (OneOne suc) ∧
		  (∀ p⦁ p zero ∧ (∀ m⦁ p m ⇒ p (suc m)) ⇒
		  (∀ n⦁ Is_ℕ_Rep n ⇒ p n))
⌝));
=DESCRIBE
This is the defining property for the representation of the natural
numbers within the type of individuals. The slight over-specification
of $Suc$ (which need not, in fact, be one-one on the whole type) eases
later proofs slightly and is of no interest to any user of the theory.
It is bound to the ML variable $is\_ℕ\_rep\_def$.

Note here and elsewhere in the very early stages of the theory that
we use $OneOne$ for clarity rather than giving an expanded form which is useful
as a rewrite rule. $plus\_clauses$ gives the relevant rewrite rule which
is intended for general use.

=ENDDOC
=THDOC
req_type (⦏"ℕ"⦎, 0);
req_defn(["ℕ","ℕ_def"], ([], ⌜
	∃f:ℕ → IND⦁TypeDefn Is_ℕ_Rep f
⌝));
=DESCRIBE
The HOL type $⦏{:}ℕ⦎$ is the type of natural numbers: $0, 1, 2, \ldots$.
=ENDDOC
=THDOC
req_const (⦏"Zero"⦎, ⓣℕ⌝);
req_const (⦏"Suc"⦎, ⓣℕ → ℕ⌝);
req_defn(["Zero","Suc", "zero_suc_def"], ([], ⌜
		(∀ n⦁ ¬ Suc n = Zero) ∧
		OneOne Suc ∧
		(∀ p⦁ p Zero ∧ (∀ m⦁ p m ⇒ p (Suc m)) ⇒ (∀ n⦁ p n))
⌝));
=DESCRIBE
This gives a loose specification of $Zero$ and $Suc$ as any two constants
satisfying the Peano Postulates.
It is bound to the ML variable $zero\_suc\_def$.

The definition schema $pp'suc\_conv$
described in \cite{DS/FMU/IED/DTD006}, defines the numeric literal $0$ to
be equal to $Zero$ and defines all other numeric literals in terms of
$Suc$ and the preceding literal.

$Zero$ and $Suc$ are not intended for general use outside this theory
--- the more homely $0$ and $+1$ are preferred.
However, to increase confidence that the correct definitions have been given
(and to shorten and simplify the proofs), we work in terms of $Zero$ and
$Suc$ initially. In fact, $Zero$ only appears here and
there is just one other mention of $Suc$ (in the definition of $+$).
=ENDDOC
\subsection{Definitions of the Arithmetic Operators}
=THDOC
map (curry req_infix 210) ["<", ">", "≤", "≥"];
map (curry req_infix 300) ["+"];
map (curry req_left_infix 305) ["-"];
map (curry req_infix 310) ["*"];
map (curry req_left_infix 315) ["Div", "Mod"];

map (switch (curry req_const) ⓣℕ→ℕ→BOOL⌝) [⦏"<"⦎, ⦏">"⦎, ⦏"≤"⦎, ⦏"≥"⦎];
map (switch (curry req_const) ⓣℕ→ℕ→ℕ⌝) [⦏"+"⦎, ⦏"-"⦎];
map (switch (curry req_const) ⓣℕ→ℕ→ℕ⌝) [⦏"*"⦎, ⦏"Div"⦎, ⦏"Mod"⦎];
map req_defn[
([⦏"+"⦎,"plus_def"], ([],	⌜∀ m n⦁ 0 + n = n ∧ (m + 1) + n = (m + n) + 1
		∧ Suc m = m + 1⌝)),
([⦏"≤"⦎,"≤_def"], ([],	⌜∀ m n⦁ m ≤ n ⇔ (∃ i⦁ m + i = n)⌝)),
([⦏"<"⦎,"less_def"], ([],	⌜∀ m n⦁ m < n ⇔ m + 1 ≤ n⌝)),
([⦏">"⦎,"greater_def"], ([],	⌜∀ m n⦁ m > n ⇔ n < m⌝)),
([⦏"≥"⦎,"≥_def"], ([],	⌜∀ m n⦁ m ≥ n ⇔ n ≤ m⌝)),
([⦏"-"⦎,"minus_def"], ([],	⌜∀ m n⦁ (m + n) - n = m⌝)),
([⦏"*"⦎,"times_def"], ([],	⌜∀ m n⦁ 0 * n = 0 ∧ (m + 1) * n = m * n + n⌝)),
([⦏"Mod"⦎,"mod_def"], ([],	⌜∀ m n⦁ 0 < n ⇒
		0 Mod n = 0 ∧ (m + 1) Mod n =
		(if m Mod n + 1 < n then m Mod n + 1 else 0)⌝)),
([⦏"Div"⦎,"div_def"], ([],	⌜∀ m n⦁ 0 < n ⇒
		0 Div n = 0 ∧ (m + 1) Div n =
		(if m Mod n + 1 < n then m Div n else m Div n + 1)⌝))
];
=DESCRIBE
These are the precedences, types and defining
theorems for the arithmetic operators.
The definitions are given in an order which gives a possible
linearisation of the dependencies between them.

They are bound to the ML variables whose names are the second in each key list.
=ENDDOC
$≤$ has been chosen as the most primitive of the arithmetic relations,
since {\em(a)} we prefer $≤$ and $<$ to $≥$ and $>$ for fairly
arbitrary reasons and {\em(b)} the definition of $≤$ in terms
of an existential assertion is shorter than that for $<$.
(A poll of user opinion also showed a slight preference for reflexive
relations.)
It is envisaged that low-level proofs
will work with the relations by converting $≥$ and $>$
to $≤$ and $<$ and then either use the definitions or with
the cancellation theorems etc. which are proved in this document.

There seems to be no benefit (and some loss in ease of proof)
in not specifying $Div$, $Mod$ when the divisor is $0$ and $-$ when
the subtrahend is greater than the diminuend and so the definitions give
a value in these cases.
\subsection{Theorems}
\subsubsection{Peano Postulates}
=THDOC
req_thm(⦏"induction_thm"⦎,
	([], ⌜∀ p⦁ p 0 ∧ (∀ m⦁ p m ⇒ p (m + 1)) ⇒ (∀ n⦁ p n)⌝));
req_thm(⦏"¬_plus1_thm"⦎,
	([], ⌜∀ n⦁ ¬ n + 1 = 0⌝));
req_thm(⦏"one_one_plus1_thm"⦎,
	([], ⌜∀ x1 x2⦁ x1 + 1 = x2 + 1 ⇒ x1 = x2⌝));
=DESCRIBE
The first two of the Peano postulates (see e.g. \cite{Halmos74})
are captured by the types of $0$ and $+$.
The remaining three are given by these theorems.
=ENDDOC
\subsubsection{Primitive Recursion}
=THDOC
req_thm(⦏"prim_rec_thm"⦎,
	([], ⌜∀ z:'a; s:'a → ℕ → 'a⦁ ∃⋎1 f⦁ f 0 = z ∧ (∀ n⦁ f (n + 1) = s (f n) n)⌝));
=DESCRIBE
This is the principle of primitive recursion for the natural numbers.
=ENDDOC
\subsubsection{Course-of-Values Induction}
=THDOC
req_thm(⦏"cov_induction_thm"⦎,
	([], ⌜∀ p⦁ (∀ n⦁ (∀ m⦁ m < n ⇒ p m) ⇒ p n) ⇒ (∀ n⦁ p n)⌝));
=DESCRIBE
This is the principle of course-of-values induction
(also called complete induction)  for the natural numbers.
=ENDDOC
\subsubsection{Minimum Principle}
=THDOC
req_thm(⦏"minimum_¬_thm"⦎,
	([], ⌜∀p b⦁ p 0 ∧ ¬p b ⇒ ∃m⦁(∀n⦁ n ≤ m ⇒ p n) ∧ ¬p(m+1)⌝));
=DESCRIBE
This is a form of the minimum principle: every set of natural numbers
that is non-empty has a least member. Here we are considering the non-empty
set of numbers given by the negation of the predicate $p$.
=ENDDOC
\subsubsection{Case Analysis}
=THDOC
req_thm(⦏"ℕ_cases_thm"⦎,
	([], ⌜∀ m⦁ m = 0 ∨ (∃ i⦁ m = i + 1)⌝));
=DESCRIBE
This is the fundamental case analysis for the natural numbers.
=ENDDOC

\subsubsection{Theorems about Addition}
=THDOC
req_thm(⦏"plus_assoc_thm"⦎,
	([], ⌜∀ i m n⦁ (i + m) + n = i + (m + n)⌝));
req_thm(⦏"plus_assoc_thm1"⦎,
	([], ⌜∀ i m n⦁ i + m + n = (i + m) + n⌝));
req_thm(⦏"plus_comm_thm"⦎,
	([], ⌜∀ m n⦁ m + n = n + m⌝));
req_thm(⦏"plus_order_thm"⦎,
	([], ⌜∀ i m n⦁ m + i = i + m ∧
		(i + m) + n = i + (m + n) ∧
		m + (i + n) = i + (m + n)⌝));
=DESCRIBE
Associativity and commutativity of addition. Associativity is given in
two forms, one which moves the brackets right and one which moves them
left.

The final theorem is a useful way of using associativity and commutativity
in low-level proofs.
Rewriting with the theorem obtained by specialising $i$ to $t$, say, in
$plus\_order\_thm$,
causes all instances of $t$
to move to the beginning of each (maximal) subterm of the form $a + b + \ldots + t \ldots$.
=ENDDOC
=THDOC
req_thm(⦏"plus_clauses"⦎,
	([], ⌜∀m n i⦁
		(m + i = n + i ⇔ m = n)
	∧	(i + m = n + i ⇔ m = n)
	∧	(m + i = i + n ⇔ m = n)
	∧	(i + m = i + n ⇔ m = n)
	∧	(m + i = i ⇔ m = 0)
	∧	(i + m = i ⇔ m = 0)
	∧	(i = i + n ⇔ n = 0)
	∧	(i = n + i ⇔ n = 0)
	∧	(m + i = 0 ⇔ m = 0 ∧ i = 0)
	∧	(0 = m + i ⇔ m = 0 ∧ i = 0)
	∧	(m + 0 = m ∧ 0 + m = m)
	∧	¬1 = 0
	∧	¬0 = 1
⌝));
=DESCRIBE
This theorem gives cancellation rules for addition expressed as rewrite rules.
The theorem includes clauses which allow cancellation
on the left or the right of the $+$, which obviates detailed
manipulations of ordering of summands (using $plus\_order\_thm$) in many
simple cases.
=ENDDOC
\subsubsection{Theorems about Subtraction}
=THDOC
req_thm(⦏"minus_clauses"⦎,
	([], ⌜∀m n⦁
		m - m = 0
	∧	m - 0 = m
	∧	(m + n) - n = m
	∧	(m + n) - m = n
⌝));
=DESCRIBE
This theorem gives rewrite rules for simplifying terms involving
subtraction. Note that because we are working in ℕ not ℤ, subtraction
is not a left inverse for addition.
=ENDDOC
\subsubsection{Theorems about ≤}
=THDOC
req_thm(⦏"≤_trans_thm"⦎,
	([], ⌜∀ m i n⦁ m ≤ i ∧ i ≤ n ⇒ m ≤ n⌝));
req_thm(⦏"≤_cases_thm"⦎,
	([], ⌜∀ m n⦁ m ≤ n ∨ n ≤ m⌝));
req_thm(⦏"≤_antisym_thm"⦎,
	([], ⌜∀ m n⦁ m ≤ n ∧ n ≤ m ⇔ m = n⌝));
req_thm(⦏"≤_well_order_thm"⦎,
	([], ⌜∀ p⦁ (∃ i⦁ p i) ⇔ (∃ m⦁ p m ∧ (∀ i⦁ p i ⇒ m ≤ i))⌝));
req_thm(⦏"≤_least_upper_bound_thm"⦎,
	([], ⌜∀p⦁ (∃i⦁p i) ∧ (∃n⦁∀j⦁ p j ⇒ j ≤ n) ⇔ ∃m⦁p m ∧ ∀j⦁ p j ⇒ j ≤ m⌝));
=DESCRIBE
These theorems give standard order-theoretic properties of
$≤$, namely that it is transitive, connected, antisymmetric, a
well-ordering, and has the property that every set which is bounded
above contains a least upper bound (where we use the terms
{\em connected} and {\em well-ordering} in the sense
appropriate to reflexive orderings).
Note that the above formulation of antisymmetry
implies reflexivity (which is also given explicitly in the
cancellation theorem $lt\_clauses$, as is the fact that $0$ is a least
element for $≤$).
=ENDDOC
=THDOC
req_thm(⦏"≤_clauses"⦎,
	([], ⌜∀m n i⦁
		(m + i ≤ n + i ⇔ m ≤ n)
	∧	(i + m ≤ n + i ⇔ m ≤ n)
	∧	(m + i ≤ i + n ⇔ m ≤ n)
	∧	(i + m ≤ i + n ⇔ m ≤ n)
	∧	(m + i ≤ i ⇔ m = 0)
	∧	(i + m ≤ i ⇔ m = 0)
	∧	(m + i ≤ 0 ⇔ m = 0 ∧ i = 0)
	∧	(m ≤ 0 ⇔ m = 0)
	∧	m ≤ m + i
	∧	m ≤ i + m
	∧	m ≤ m
	∧	0 ≤ m
	∧	¬1 ≤ 0
⌝));
=DESCRIBE
This theorem gives cancellation rules for $≤$ expressed as rewrite rules.
Like $plus\_clauses$, the theorem includes clauses which allow cancellation
on the left or the right of the $+$.
=ENDDOC

=THDOC
req_thm(⦏"≤_plus1_thm"⦎,
	([], ⌜∀ m n⦁ m ≤ n + 1 ⇔ m = n + 1 ∨ m ≤ n⌝));
req_thm(⦏"plus1_≤_thm"⦎,
	([], ⌜∀ m n⦁ m + 1 ≤ n ⇔ m ≤ n ∧ ¬ m = n⌝));
=DESCRIBE
These two theorems give the step cases of the two ways of defining
$≤$ by primitive recursion. The base cases are part of
$le\_clauses$. The theorems are sometimes of use in reasoning
about $≤$ by induction.
=ENDDOC
\subsubsection{Theorems about $<$}
=THDOC
req_thm(⦏"less_trans_thm"⦎,
	([], ⌜∀ m i n⦁ m < i ∧ i < n ⇒ m < n⌝));
req_thm(⦏"less_cases_thm"⦎,
	([], ⌜∀ m n⦁ m < n ∨ m = n ∨ n < m⌝));
req_thm(⦏"less_irrefl_thm"⦎,
	([], ⌜∀ m n⦁ ¬ (m < n ∧ n < m)⌝));
req_thm(⦏"less_well_order_thm"⦎,
	([], ⌜∀ p⦁ (∃ i⦁ p i) ⇔ (∃ m⦁ p m ∧ (∀ i⦁ p i ⇒ ¬i < m))⌝));
=DESCRIBE
These theorems give standard order-theoretic properties of
$<$, namely that it is transitive, connected, irreflexive and a
well-ordering, (where we use the terms {\em connected} and
{\em well-ordering} in the sense appropriate to irreflexive orderings).
The fact that $0$ is a least element for $<$ is contained
in $lt\_clauses$.
=ENDDOC
=THDOC
req_thm(⦏"less_clauses"⦎,
	([], ⌜∀m n i⦁
		(m + i < n + i ⇔ m < n)
	∧	(i + m < n + i ⇔ m < n)
	∧	(m + i < i + n ⇔ m < n)
	∧	(i + m < i + n ⇔ m < n)
	∧	(m < m + i ⇔ 0 < i)
	∧	(m < i + m ⇔ 0 < i)
	∧	¬m + i < m
	∧	¬m + i < i
	∧	¬m < 0
	∧	¬m < m
	∧	0 < m + 1
	∧	0 < 1 + m
	∧	0 < 1
⌝));
=DESCRIBE
This theorem gives cancellation rules for $<$ expressed as rewrite rules.
Like $plus\_clauses$, the theorem includes clauses which allow cancellation
on the left or the right of the $+$.
=ENDDOC

=THDOC
req_thm(⦏"less_plus1_thm"⦎,
	([], ⌜∀ m n⦁ m < n + 1 ⇔ m = n ∨ m < n⌝));
req_thm(⦏"plus1_less_thm"⦎,
	([], ⌜∀ m n⦁ m + 1 < n ⇔ m < n ∧ ¬ m + 1 = n⌝));
=DESCRIBE
These two theorems give the step cases of the two ways of defining
$<$ by primitive recursion. The base cases are part of
$lt\_clauses$. The theorems are sometimes of use in reasoning
about $<$ by induction.
=ENDDOC
\subsubsection{Theorems about ≤ and $<$ and ¬}
=THDOC
req_thm(⦏"¬_≤_thm"⦎,
	([], ⌜∀m n⦁ ¬m ≤ n ⇔ n < m⌝));
req_thm(⦏"¬_less_thm"⦎,
	([], ⌜∀m n⦁ ¬m < n ⇔ n ≤ m⌝));
req_thm(⦏"¬_plus1_≤_thm"⦎,
	([], ⌜∀ m n⦁ ¬ m + 1 ≤ n ⇔ n ≤ m⌝));
req_thm(⦏"¬_less_plus1_thm"⦎,
	([], ⌜∀ m n⦁ ¬ m < n + 1 ⇔ n < m⌝));
=DESCRIBE
These theorems may be used in low-level reasoning about $≤$ and $<$
to remove negations.
=ENDDOC
\subsubsection{Theorems about Multiplication}
=THDOC
req_thm(⦏"times_comm_thm"⦎,
	([], ⌜∀ m n⦁ m * n = n * m⌝));
req_thm(⦏"times_assoc_thm"⦎,
	([], ⌜∀ i m n⦁ (i * m) * n = i * (m * n)⌝));
req_thm(⦏"times_plus_distrib_thm"⦎,
	([], ⌜∀ i m n⦁
		(i + m) * n = i * n + m * n
	∧	i * (m + n) = i * m + i  * n⌝));
req_thm(⦏"times_clauses"⦎,
	([], ⌜∀ m⦁
		m * 0 = 0
	∧	0 * m = 0
	∧	m * 1 = m
	∧	1 * m = m⌝));
=DESCRIBE
These four theorems give standard facts about multiplication.
=ENDDOC
We do not supply the analogues of $plus\_assoc\_thm1$ and
$plus\_order\_thm$ on the assumption that the type of
arguments in which they might be used will not be necessary until term
normalisation machinery to do them automatically is available.
\subsection{Theorems about Division and Modulus}
=THDOC
req_thm(⦏"mod_less_thm"⦎,
	([], ⌜∀m n⦁ 0 < n ⇒ m Mod n < n⌝));
req_thm(⦏"div_mod_thm"⦎,
	([], ⌜∀ m n⦁ 0 < n ⇒ m = (m Div n) * n + m Mod n⌝));
req_thm(⦏"div_mod_unique_thm"⦎,
	([], ⌜∀m n d r⦁ r < n ⇒
		(m = d * n + r ⇒ d = m Div n ∧ r = m Mod n)⌝));
=DESCRIBE
These theorems together give the characterising property for division
and modulus with a non-zero divisor.
=ENDDOC
\section{THE SIGNATURE}
=DOC
signature ⦏ℕ⦎ = sig
=TEX
=DESCRIBE
This is the signature in which the theory ``ℕ'' is declared.
This theory contains facts about the natural numbers
(i.e.: $0$, $1$, $2$, $\ldots$) and their usual arithmetic operators.
=ENDDOC
\subsection{Definitions}
=DOC
val ⦏is_ℕ_rep_def⦎ : THM;
val ⦏ℕ_def⦎ : THM;
val ⦏div_def⦎ : THM;
val ⦏≥_def⦎ : THM;
val ⦏≤_def⦎ : THM;
val ⦏less_def⦎ : THM;
val ⦏greater_def⦎ : THM;
val ⦏minus_def⦎ : THM;
val ⦏mod_def⦎ : THM;
val ⦏plus_def⦎ : THM;
val ⦏times_def⦎ : THM;
val ⦏zero_suc_def⦎ : THM;
=DESCRIBE
These Standard ML variables are bound to the definitions in the
theory ``ℕ''.
=ENDDOC
\subsection{Theorems}
=DOC
val ⦏ℕ_cases_thm⦎ : THM;
val ⦏¬_≤_thm⦎ : THM;
val ⦏¬_less_plus1_thm⦎ : THM;
val ⦏¬_less_thm⦎ : THM;
val ⦏¬_plus1_≤_thm⦎ : THM;
val ⦏¬_plus1_thm⦎ : THM;
val ⦏cov_induction_thm⦎ : THM;
val ⦏div_mod_thm⦎ : THM;
val ⦏div_mod_unique_thm⦎ : THM;
val ⦏induction_thm⦎ : THM;
val ⦏≤_antisym_thm⦎ : THM;
val ⦏≤_cases_thm⦎ : THM;
val ⦏≤_clauses⦎ : THM;
val ⦏≤_plus1_thm⦎ : THM;
val ⦏≤_trans_thm⦎ : THM;
val ⦏≤_well_order_thm⦎ : THM;
val ⦏≤_least_upper_bound_thm⦎ : THM;
val ⦏less_cases_thm⦎ : THM;
val ⦏less_clauses⦎ : THM;
val ⦏less_irrefl_thm⦎ : THM;
val ⦏less_plus1_thm⦎ : THM;
val ⦏less_trans_thm⦎ : THM;
val ⦏less_well_order_thm⦎ : THM;
val ⦏minimum_¬_thm⦎ : THM;
val ⦏minus_clauses⦎ : THM;
val ⦏mod_less_thm⦎ : THM;
val ⦏one_one_plus1_thm⦎ : THM;
val ⦏plus1_≤_thm⦎ : THM;
val ⦏plus1_less_thm⦎ : THM;
val ⦏plus_assoc_thm⦎ : THM;
val ⦏plus_assoc_thm1⦎ : THM;
val ⦏plus_clauses⦎ : THM;
val ⦏plus_comm_thm⦎ : THM;
val ⦏plus_order_thm⦎ : THM;
val ⦏prim_rec_thm⦎ : THM;
val ⦏times_comm_thm⦎ : THM;
val ⦏times_assoc_thm⦎ : THM;
val ⦏times_plus_distrib_thm⦎ : THM;
val ⦏times_clauses⦎ : THM;
=DESCRIBE
These Standard ML variables are bound to the theorems in the
theory ``ℕ''.
=ENDDOC
\subsection{Conversions}
=DOC
val ⦏plus1_conv⦎ : CONV;
=DESCRIBE
This conversion proves theorems of the form $m = n + 1$ where
$m$ and $n$ are numeric literals.
=FRULE 2 Tactic
plus1_conv (mk_ℕ m)
├
├
⊢   ⓜ mk_ℕ m ⌝
  = ⓜ mk_ℕ (m-1) ⌝ + 1
=TEX
=ENDDOC
\subsection{Tactics}
=DOC
val ⦏induction_tac⦎ : TERM -> TACTIC;
=DESCRIBE
This tactic implements induction over the natural numbers:
to prove $t[x]$ it suffices to prove $t[0]$ and to prove $t[x+1]$ on the
assumption that $t[x]$. The term argument must be a variable of type
ⓣℕ⌝  and must appear free in the conclusion of the
goal but not in its assumptions.
=FRULE 2 Tactic
induction_tac ⌜x⌝
├
{ Γ } t[x]
├
{ Γ } t[0] ; strip{t[x], Γ} t[x+1]
=TEX
=SEEALSO
$cov\_induction\_tac$,
$INDUCTION\_T$
=FAILURE
38001	?0 is not a variable of type ⓣℕ⌝
38002	?0 does not appear free in the conclusion of the goal
38003	?0 appears free in the assumptions of the goal
=ENDDOC
=DOC
val ⦏cov_induction_tac⦎ : TERM -> TACTIC;
=DESCRIBE
This tactic implements course-of-values induction over the natural numbers.
To prove $t[x]$ it suffices to prove $t[x]$ on the
assumption $∀m⦁m < x ⇒ t[m]$.
(Course-of-values induction is also sometimes called as complete induction.)
The term argument must be a variable of type
ⓣℕ⌝ and must appear free in the conclusion of the
goal but not in its assumptions.
=FRULE 2 Tactic
cov_induction_tac ⌜x⌝
├
{ Γ } t[x]
├
strip{⌜∀m⦁ m < x ⇒ t[m]⌝, Γ} t[x]
=TEX
$m$ will be renamed to a variant, if necessary.
=FAILURE
38001	?0 is not a variable of type ⓣℕ⌝
38002	?0 does not appear free in the conclusion of the goal
38003	?0 appears free in the assumptions of the goal
=SEEALSO
$induction\_tac$
=ENDDOC
=DOC
val ⦏INDUCTION_T⦎ : TERM -> (THM -> TACTIC) -> TACTIC;
=DESCRIBE
This implements induction over the natural numbers as
a tactical. The term argument must be a variable of type
ⓣℕ⌝ and must appear free in the conclusion of the
goal but not in its assumptions.
The inductive hypothesis is passed to the tactic generating function
given by the second argument.
=FRULE 2 Tactic
INDUCTION_T ⌜x⌝ ttac
├
{ Γ } t[x]
├
{ Γ } t[0] ; ttac(t[x] ⊢ t[x])
          ({ Γ } t[x+1])
=TEX
=USES
Most commonly used with $asm\_tac$ to avoid the stripping up of
the inductive hypothesis which occurs with $induction\_tac$.
=SEEALSO
$induction\_tac$,
$COV\_INDUCTION\_T$
=FAILURE
38001	?0 is not a variable of type ⓣℕ⌝
38002	?0 does not appear free in the conclusion of the goal
38003	?0 appears free in the assumptions of the goal
=ENDDOC
=DOC
val ⦏COV_INDUCTION_T⦎ : TERM -> (THM -> TACTIC) -> TACTIC;
=DESCRIBE
This implements course-of-values induction over the natural numbers
as a tactical.
The term argument must be a variable of type
ⓣℕ⌝ and must appear free in the conclusion of the
goal but not in its assumptions.
The inductive hypothesis is passed to the tactic generating function
given by the second argument.
=FRULE 2 Tactic
COV_INDUCTION_T ⌜x⌝ ttac
├
{ Γ } t[x]
├
ttac
(⌜∀m⦁ m < x ⇒ t m⌝
           ⊢ ⌜∀m⦁ m < x ⇒ t m⌝)
({ Γ } t[x])
=TEX
=USES
Tactic programming.
=SEEALSO
$cov\_induction\_tac$,
$INDUCTION\_T$
=FAILURE
38001	?0 is not a variable of type ⓣℕ⌝
38002	?0 does not appear free in the conclusion of the goal
38003	?0 appears free in the assumptions of the goal
=ENDDOC
=SML
end; (* of signature ℕ *)
=TEX
\section{TEST POLICY}

Any functions are to be tested according to then
general criteria laid down in the quality plan, \cite{DS/FMU/IED/PLN008}.
The theory implemented is to be checked by the theory design tools
of \cite{DS/FMU/IED/DTD035}.
\small
\twocolumn[\section{INDEX}]
\printindex

\end{document}




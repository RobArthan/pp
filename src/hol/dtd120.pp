=IGN
********************************************************************************
dtd120.doc: this file is part of the PPHol system

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

\def\Title{ Higher-Order Matching: Detailed Design }

\def\Abstract{\begin{center}
{\bf Abstract}\par\parbox{0.7\hsize}
{\small This document gives the detailed design for a higher-order matching function and proof tools based on it.}
\end{center}}

\def\Reference{LEMMA1/HOL/DTD120}

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
\item[Issues 1.1 (2009/09/11)--1.4 (2010/10/16)] Initial drafts.
\item[Issue 1.5 (2010/11/17)] Moved conversions out into \cite{DS/FMU/IED/IMP007}.
\item[Issue 1.6 (2011/01/30)] Fixed typos/phrasing.
\item[Issue 1.7 (2011/02/26)] Renamed $ho\_match$ on $simple\_ho\_match$ to make
way for an implementation of the Fettig/L\"{o}chner algborithm later.
\item[Issue 1.8 (2012/05/06)] You can now specify a list of ``rigid'' variables that will not be instantiated.
\item[Issue 1.9 (2013/01/05)] Corrected reference to the non-existent $ho\_match$.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.
\item[2015/04/15]
Now uses new date and version macros from doctex
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
This document gives the detailed design for a higher-order matching function and
derived rules, conversions and tactics that exploit it.

\subsection{Purpose and Background}
See \cite{DS/FMU/IED/HLD011}.


\section{THE SIGNATURE}

\subsubsection{Prologue}
=SML
signature ⦏HigherOrderMatching⦎ = sig
=TEX
\subsection{The Matcher}
=DOC
val ⦏simple_ho_match⦎ : TERM list -> TERM -> TERM ->
	(TYPE * TYPE) list * (TERM * TERM)list;
=DESCRIBE
$simple\_ho\_match$ implements the higher-order matching algorithm of
Miller and Nipkow.
$term\_match$ $r$ $t$ $p$ attempts to find type and term instantiations
under which $p$ becomes $\alpha\beta\eta$-equivalent to $t$.
$r$ gives a list of so-called {\em rigid} variables: they and the type variables in their
types will not be instantiated.

The algorithm is a decision procedure for this problem in
the case when $p$ is a linear pattern,
i.e., modulo, η-equivalence, $p$ is contains no β-redexes and
for each non-rigid free variable $v$ of $p$ there is an $n$ such that
each occurrence of $v$ is in a subterm of the form
$v\,x\sb{1}\ldots x\sb{n}$ where the $x_i$ are distinct bound variables
and where this subterm does not itself occur as the function in a function application (i.e., it is either the argument of a function application
or the body of a $\lambda$-abstraction).
The implementation does not check that $p$ is linear pattern but
will always fail rather than produce a pair of instantiations
that do not make $p$ $\alpha\beta\eta$-equivalent to $t$.

For example,
=GFT
simple_ho_match [] ⌜∀x⦁ x < 1⌝ ⌜∀x:'a⦁ P x⌝ =
	([(ⓣℕ⌝, ⓣ'a⌝)], [(⌜λ x⦁ x < 1⌝, ⌜P:ℕ → BOOL⌝)])
simple_ho_match [] ⌜∀x⦁ x < 1⌝ ⌜∀x:'a⦁ P x y⌝ =
	([(ⓣℕ⌝, ⓣ'a⌝)], [(⌜λ x (y:'b)⦁ x < 1⌝, ⌜P:ℕ → 'b → BOOL⌝)])
=TEX
Trivial associations (i.e. $(x,x)$) are omitted from the association lists returned by $simple\_ho\_match$.

This function is ``simple'' because although it does work with paired abstractions, it cannot match terms where the pairing structure
is not identical: e.g., it can match the pattern
=INLINEFT
λ(x, y)⦁ G x y
=TEX
\ to the target
=INLINEFT
λ(m, n)⦁ m + n
=TEX
, it cannot match it to
=INLINEFT
λp⦁ Fst p
=TEX
.

To suppress instantiation of a set of type variables without restricting instantiation of any term variables,
include in the list of rigid variables a variable whose type includes the type variables and that does not occur in the pattern.

=FAILURE
120001	?0 is not a higher-order instance of ?1
120002	?0 is not a variable
=ENDDOC


=TEX

\subsection{Rewriting}

\subsection{Epilogue}
=SML
end (* of signature HigherOrderMatching *);
=TEX

\section{TEST POLICY}
There are no special module test requirements.
\twocolumn[\section{INDEX}]
\small
\printindex

\end{document}









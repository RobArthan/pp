=IGN
********************************************************************************
mdt117.doc: this file is part of the PPZed system

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

\def\Title{ Module Test: Z Library Real Numbers }

\def\Abstract{\begin{center}
{\bf Abstract}\par\parbox{0.7\hsize}
{\small This document gives the module tests for the theory of real numbers in \ProductHOL.}
\end{center}}

\def\Reference{LEMMA1/ZED/MDT117}

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
\item[Issue 1.1 (2000/12/13)] First draft.
\item[Issue 1.2 (2001/07/02)] Improved testing of proof support.
\item[Issue 1.3 (2001/07/05)] Added tests from examples relating to ClawZ.
\item[Issus 1.4] Added tests for fix to
=INLINEFT
z_ℝ_ℤ_exp_conv
=TEX
\ and for new error messages.
\item[Issue 1.5 (2002/10/17)] Fixed {\LaTeX} errors.
\item[Issue 1.6 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.7 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.8 (2003/07/29)] Supplied missing spaces needed by new treatment of subscripts.
\item[Issue 1.9 (2004/01/19)] The Z universal set is now called 𝕌.
\item[Issue 1.10 (2005/02/26)] Precedences and associativity of toolkit operators now follow \cite{ISO02}.
\item[Issue 1.11 (2006/04/20)] Added support for floating point literals
\item[Issue 1.12 (2006/05/08)] Tested enhancement to the proof contexts.
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

\section{INTRODUCTION}
\subsection{Scope}
This document contains the module tests associated with the
theory of positive dyadic rationals
required by \cite{LEMMA1/ZED/DTD117} and
implemented in \cite{LEMMA1/ZED/IMP117}.
\subsection{Introduction}
\subsubsection{Purpose and Background}
See \cite{LEMMA1/ZED/DTD117}.
\subsubsection{Dependencies}
The test material depends on \cite{DS/FMU/IED/DTD013},
\cite{DS/FMU/IED/DTD035}.

\subsubsection{Deficiencies}
None known.
\section{INITIALISATION}
Initialise the test package:
=SML
use_file "dtd013.sml";
use_file "imp013.sml";
init_mt_results ();
=TEX
\section{TEST CASES}
The organisation of the test cases is as follows:

\begin{enumerate}
\item Check the theory design
\item Test the syntax functions
\item Test the computational conversions (correct operation)
\item Test the computational conversions (error cases)
\item Test the arithmetic normalisation conversion
\item Test the general purpose proof context
\item Test the linear arithmetic decision procedure
\item Examples from ClawZ work
\end{enumerate}


\section{CHECK THE THEORY DESIGN}
=SML
use_file "dtd117.tch";
store_mt_results mt_run[("theory design for theory of reals",
	theory_check_success,
	(),
	true)];
=TEX
\section{SYNTAX FUNCTIONS}
=TEX
Dyadic constructor functions:
=SML
store_mt_results
(mt_runf (op =$))
[
	("2.1.1", mk_z_ℝ_less, (ⓩreal 0⌝, ⓩreal 1⌝), ⓩreal 0 <⋎R real 1⌝),
	("2.1.2", mk_z_ℝ_≤, (ⓩreal 0⌝, ⓩreal 1⌝), ⓩreal 0 ≤⋎R real 1⌝),
	("2.1.3", mk_z_ℝ_greater, (ⓩreal 0⌝, ⓩreal 1⌝), ⓩreal 0 >⋎R real 1⌝),
	("2.1.4", mk_z_ℝ_≥, (ⓩreal 0⌝, ⓩreal 1⌝), ⓩreal 0 ≥⋎R real 1⌝),
	("2.1.5", mk_z_ℝ_plus, (ⓩreal 0⌝, ⓩreal 1⌝), ⓩreal 0 +⋎R real 1⌝),
	("2.1.6", mk_z_ℝ_subtract, (ⓩreal 0⌝, ⓩreal 1⌝), ⓩreal 0 -⋎R real 1⌝),
	("2.1.7", mk_z_ℝ_times, (ⓩreal 0⌝, ⓩreal 1⌝), ⓩreal 0 *⋎R real 1⌝),
	("2.1.8", mk_z_ℝ_over, (ⓩreal 0⌝, ⓩreal 1⌝), ⓩreal 0 /⋎R real 1⌝),
	("2.1.9", mk_z_ℝ_frac, (ⓩ0⌝, ⓩ1⌝), ⓩ0 /⋎Z 1⌝),
	("2.1.10", mk_z_ℝ_ℤ_exp, (ⓩreal 0⌝, ⓩ1⌝), ⓩreal 0 ^⋎Z 1⌝)
];
=TEX
Monadic constructor functions:
=SML
store_mt_results
(mt_runf (op =$))
[
	("2.2.1", mk_z_ℝ_minus, ⓩ2/⋎Z 3⌝, ⓩ~⋎R (2/⋎Z 3)⌝),
	("2.2.2", mk_z_ℝ_abs, ⓩ2/⋎Z 3⌝, ⓩabs⋎R (2/⋎Z 3)⌝),
	("2.2.3", mk_z_real, ⓩ6⌝, ⓩreal 6⌝)
];
=TEX
Dyadic destructor functions:
=SML
store_mt_results
(mt_runf (fn ((a, b), (c, d)) => a =$ c andalso b =$ d))
[
	("2.3.1", dest_z_ℝ_less, ⓩreal 0 <⋎R real 1⌝, (ⓩreal 0⌝, ⓩreal 1⌝)),
	("2.3.2", dest_z_ℝ_≤, ⓩreal 0 ≤⋎R real 1⌝, (ⓩreal 0⌝, ⓩreal 1⌝)),
	("2.3.3", dest_z_ℝ_greater, ⓩreal 0 >⋎R real 1⌝, (ⓩreal 0⌝, ⓩreal 1⌝)),
	("2.3.4", dest_z_ℝ_≥, ⓩreal 0 ≥⋎R real 1⌝, (ⓩreal 0⌝, ⓩreal 1⌝)),
	("2.3.5", dest_z_ℝ_plus, ⓩreal 0 +⋎R real 1⌝, (ⓩreal 0⌝, ⓩreal 1⌝)),
	("2.3.6", dest_z_ℝ_subtract, ⓩreal 0 -⋎R real 1⌝, (ⓩreal 0⌝, ⓩreal 1⌝)),
	("2.3.7", dest_z_ℝ_times, ⓩreal 0 *⋎R real 1⌝, (ⓩreal 0⌝, ⓩreal 1⌝)),
	("2.3.8", dest_z_ℝ_over, ⓩreal 0 /⋎R real 1⌝, (ⓩreal 0⌝, ⓩreal 1⌝)),
	("2.3.9", dest_z_ℝ_frac, ⓩ0 /⋎Z 1⌝, (ⓩ0⌝, ⓩ1⌝)),
	("2.3.10", dest_z_ℝ_ℤ_exp, ⓩreal 0 ^⋎Z 1⌝, (ⓩreal 0⌝, ⓩ1⌝))
];
=TEX
Monadic destructor functions:
=SML
store_mt_results
(mt_runf (op =$))
[
	("2.4.1", dest_z_ℝ_minus, ⓩ~⋎R (2/⋎Z 3)⌝, ⓩ2/⋎Z 3⌝),
	("2.4.2", dest_z_ℝ_abs, ⓩabs⋎R (2/⋎Z 3)⌝, ⓩ2/⋎Z 3⌝),
	("2.4.3", dest_z_real, ⓩreal 5⌝, ⓩ5⌝)
];
=TEX
Discriminator functions:
=SML
store_mt_results
mt_run
[
	("2.5.1", is_z_ℝ_less, ⓩreal 0 <⋎R real 1⌝, true),
	("2.5.2", is_z_ℝ_≤, ⓩreal 0 ≤⋎R real 1⌝, true),
	("2.5.3", is_z_ℝ_greater, ⓩreal 0 >⋎R real 1⌝, true),
	("2.5.4", is_z_ℝ_≥, ⓩreal 0 ≥⋎R real 1⌝, true),
	("2.5.5", is_z_ℝ_plus, ⓩreal 0 +⋎R real 1⌝, true),
	("2.5.6", is_z_ℝ_subtract, ⓩreal 0 -⋎R real 1⌝, true),
	("2.5.7", is_z_ℝ_times, ⓩreal 0 *⋎R real 1⌝, true),
	("2.5.8", is_z_ℝ_over, ⓩreal 0 /⋎R real 1⌝, true),
	("2.5.9", is_z_ℝ_frac, ⓩ0 /⋎Z 1⌝, true),
	("2.5.10", is_z_ℝ_ℤ_exp, ⓩreal 0 ^⋎Z 1⌝, true),
	("2.5.11", is_z_ℝ_minus, ⓩ~⋎R (2/⋎Z 3)⌝, true),
	("2.5.12", is_z_ℝ_abs, ⓩabs⋎R (2/⋎Z 3)⌝, true),
	("2.5.13", is_z_real, ⓩreal 5⌝, true)
];
=TEX
=SML
store_mt_results
mt_run
[
	("2.6.1", is_z_ℝ_less, ⓩreal 0 ≥⋎R real 1⌝, false),
	("2.6.2", is_z_ℝ_≤, ⓩreal 0 >⋎R real 1⌝, false),
	("2.6.3", is_z_ℝ_greater, ⓩreal 0 <⋎R real 1⌝, false),
	("2.6.4", is_z_ℝ_≥, ⓩreal 0 ≤⋎R real 1⌝, false),
	("2.6.5", is_z_ℝ_plus, ⓩreal 0 -⋎R real 1⌝, false),
	("2.6.6", is_z_ℝ_subtract, ⓩreal 0 +⋎R real 1⌝, false),
	("2.6.7", is_z_ℝ_times, ⓩreal 0 /⋎R real 1⌝, false),
	("2.6.8", is_z_ℝ_over, ⓩreal 0 *⋎R real 1⌝, false),
	("2.6.9", is_z_ℝ_frac, ⓩreal 0⌝, false),
	("2.6.10", is_z_ℝ_ℤ_exp, ⓩ0 /⋎Z x⌝, false),
	("2.6.11", is_z_ℝ_minus, ⓩabs⋎R (2/⋎Z 3)⌝, false),
	("2.6.12", is_z_real, ⓩ~⋎R (2/⋎Z 3)⌝, false),
	("2.6.13", is_z_ℝ_abs, ⓩ~⋎R (2/⋎Z 3)⌝, false)
];
=TEX
\section{COMPUTATIONAL CONVERSIONS (CORRECT OPERATION)}
=TEX
Conversions to HOL literals:
=SML
store_mt_results
(mt_runf (fn (thm, tm) => snd(dest_eq(concl thm)) =$ tm))
[
	("3.1.1", z_ℝ_lit_conv, ⓩreal 0⌝, ⌜ℕℝ 0⌝),
	("3.1.2", z_ℝ_lit_conv, ⓩreal (~0)⌝, ⌜ℕℝ 0⌝),
	("3.1.3", z_ℝ_lit_conv, ⓩreal (~1)⌝, ⌜~⋎R(ℕℝ 1)⌝),
	("3.1.4", z_ℝ_lit_conv, ⓩ1 /⋎Z 4⌝, ⌜1 / 4⌝),
	("3.1.5", z_ℝ_lit_conv, ⓩ2 /⋎Z 8⌝, ⌜1 / 4⌝),
	("3.1.6", z_ℝ_lit_conv, ⓩ~5 /⋎Z 8⌝, ⌜~⋎R(5 / 8)⌝),
	("3.1.7", z_ℝ_lit_conv, ⓩ5 /⋎Z ~8⌝, ⌜~⋎R(5 / 8)⌝),
	("3.1.8", z_ℝ_lit_conv, ⓩ~5 /⋎Z ~8⌝, ⌜5 / 8⌝)
];
=TEX
Conversions to HOL literals:
=SML
store_mt_results
(mt_runf (fn (thm, tm) => snd(dest_eq(concl thm)) =$ tm))
[
	("3.2.1", z_ℝ_lit_conv1, ⌜ℕℝ 0⌝, ⓩreal 0⌝),
	("3.2.2", z_ℝ_lit_conv1, ⌜~⋎R(ℕℝ 0)⌝, ⓩreal 0⌝),
	("3.2.3", z_ℝ_lit_conv1, ⌜~⋎R(ℕℝ 1)⌝, ⓩ~⋎R real 1⌝),
	("3.2.4", z_ℝ_lit_conv1, ⌜1 / 4⌝, ⓩ1 /⋎Z 4⌝),
	("3.2.5", z_ℝ_lit_conv1, ⌜2 / 8⌝, ⓩ1 /⋎Z 4⌝),
	("3.2.6", z_ℝ_lit_conv1, ⌜~⋎R(5 / 8)⌝, ⓩ~⋎R(5 /⋎Z 8)⌝)
];
=TEX
Normalisation of literals:
=SML
store_mt_results
(mt_runf (fn (thm, tm) => snd(dest_eq(concl thm)) =$ tm))
[
	("3.3.1", z_ℝ_lit_norm_conv, ⓩ0 /⋎Z 1⌝, ⓩreal 0⌝),
	("3.3.2", z_ℝ_lit_norm_conv, ⓩ2 /⋎Z 1⌝, ⓩreal 2⌝),
	("3.3.3", z_ℝ_lit_norm_conv, ⓩ2 /⋎Z ~1⌝, ⓩ~⋎R real 2⌝),
	("3.3.4", z_ℝ_lit_norm_conv, ⓩ~2 /⋎Z 1⌝, ⓩ~⋎R real 2⌝),
	("3.3.5", z_ℝ_lit_norm_conv, ⓩ~2 /⋎Z ~1⌝, ⓩreal 2⌝),
	("3.3.6", z_ℝ_lit_norm_conv, ⓩreal(~1)⌝, ⓩ~⋎R real 1⌝),
	("3.3.7", z_ℝ_lit_norm_conv, ⓩ4 /⋎Z ~2⌝, ⓩ~⋎R real 2⌝),
	("3.3.8", z_ℝ_lit_norm_conv, ⓩ~4 /⋎Z 2⌝, ⓩ~⋎R real 2⌝),
	("3.3.9", z_ℝ_lit_norm_conv, ⓩ~4 /⋎Z ~2⌝, ⓩreal 2⌝),
	("3.3.10", z_ℝ_lit_norm_conv, ⓩ2 /⋎Z 6⌝, ⓩ1 /⋎Z 3⌝),
	("3.3.11", z_ℝ_lit_norm_conv, ⓩ~2 /⋎Z 6⌝, ⓩ~⋎R(1 /⋎Z 3)⌝),
	("3.3.12", z_ℝ_lit_norm_conv, ⓩ2 /⋎Z ~6⌝, ⓩ~⋎R(1 /⋎Z 3)⌝),
	("3.3.13", z_ℝ_lit_norm_conv, ⓩ~2 /⋎Z ~6⌝, ⓩ1 /⋎Z 3⌝),
	("3.3.14", z_ℝ_lit_norm_conv, ⓩ~⋎R(2 /⋎Z 6)⌝, ⓩ~⋎R(1 /⋎Z 3)⌝),
	("3.3.15", z_ℝ_lit_norm_conv, ⓩ~⋎R(real 0)⌝, ⓩreal 0⌝)
];
=TEX
Dyadic predicates (one of each):
=SML
store_mt_results
(mt_runf (fn (thm, tm) => snd(dest_eq(concl thm)) =$ tm))
[
	("3.4.1", z_ℝ_less_conv, ⓩreal 99 <⋎R real 100⌝, ⓩtrue⌝),
	("3.4.2", z_ℝ_≤_conv, ⓩ1 /⋎Z 2 ≤⋎R 1 /⋎Z 2⌝, ⓩtrue⌝),
	("3.4.3", z_ℝ_greater_conv THEN_C z_ℝ_less_conv, ⓩ~⋎R(4 /⋎Z 5) >⋎R ~⋎R(4 /⋎Z 3)⌝, ⓩtrue⌝),
	("3.4.4", z_ℝ_≥_conv THEN_C z_ℝ_≤_conv, ⓩ7 /⋎Z 8 ≥⋎R 6 /⋎Z 8⌝, ⓩtrue⌝),
	("3.4.5", z_ℝ_less_conv, ⓩreal 99 <⋎R real 10⌝, ⓩfalse⌝),
	("3.4.6", z_ℝ_≤_conv, ⓩ(1 /⋎Z 2) ≤⋎R 1 /⋎Z 4⌝, ⓩfalse⌝),
	("3.4.7", (z_ℝ_greater_conv THEN_C z_ℝ_less_conv), ⓩ~⋎R(4 /⋎Z 3) >⋎R ~⋎R(4 /⋎Z 5)⌝, ⓩfalse⌝),
	("3.4.8", z_ℝ_≥_conv THEN_C z_ℝ_≤_conv, ⓩ6 /⋎Z 8 ≥⋎R 7 /⋎Z 8⌝, ⓩfalse⌝)
];
=TEX
Dyadic arithmetic operators (one of each):
=SML
store_mt_results
(mt_runf (fn (thm, tm) => snd(dest_eq(concl thm)) =$ tm))
[
	("3.5.1", z_ℝ_plus_conv, ⓩ2 /⋎Z 6 +⋎R 1 /⋎Z 6⌝, ⓩ1 /⋎Z 2⌝),
	("3.5.2", (z_ℝ_subtract_conv THEN_C z_ℝ_plus_conv), ⓩ1 /⋎Z 3 -⋎R 1 /⋎Z 6⌝, ⓩ1 /⋎Z 6⌝),
	("3.5.3", z_ℝ_times_conv, ⓩreal 0 *⋎R real 1⌝, ⓩreal 0⌝),
	("3.5.4", z_ℝ_over_conv, ⓩreal 0 /⋎R real 1⌝, ⓩreal 0⌝),
	("3.5.5", z_ℝ_ℤ_exp_conv, ⓩreal 0 ^⋎Z 1⌝, ⓩreal 0⌝),
	("3.5.6", z_ℝ_ℤ_exp_conv, ⓩreal 10 ^⋎Z (~ 3)⌝, ⓩ1 /⋎Z 1000⌝)
];
=TEX
Monadic arithmetic operators (a few of each):
=SML
store_mt_results
(mt_runf (fn (thm, tm) => snd(dest_eq(concl thm)) =$ tm))
[
	("3.6.1", z_ℝ_minus_conv, ⓩ~⋎R(~⋎R(2 /⋎Z 3))⌝, ⓩ2 /⋎Z 3⌝),
	("3.6.2", z_ℝ_minus_conv, ⓩ~⋎R(~⋎R(~⋎R(2 /⋎Z 3)))⌝, ⓩ~⋎R(2 /⋎Z 3)⌝),
	("3.6.3", z_ℝ_minus_conv, ⓩ~⋎R(~⋎R(~⋎R(~⋎R(4 /⋎Z 6))))⌝, ⓩ2 /⋎Z 3⌝),
	("3.6.4", z_ℝ_minus_conv, ⓩ~⋎R(~⋎R(~⋎R(4 /⋎Z 6)))⌝, ⓩ~⋎R(2 /⋎Z 3)⌝),
	("3.6.5", z_ℝ_minus_conv, ⓩ~⋎R(~⋎R(~⋎R(~⋎R(real 0))))⌝, ⓩreal 0⌝),
	("3.6.6", z_ℝ_minus_conv, ⓩ~⋎R(~⋎R(~⋎R(real 0)))⌝, ⓩreal 0⌝),
	("3.6.7", z_ℝ_abs_conv, ⓩabs⋎R(~⋎R(2 /⋎Z 3))⌝, ⓩ2 /⋎Z 3⌝),
	("3.6.8", z_ℝ_abs_conv, ⓩabs⋎R((2 /⋎Z 3))⌝, ⓩ2 /⋎Z 3⌝),
	("3.6.9", z_ℝ_abs_conv, ⓩabs⋎R(real 4)⌝, ⓩreal 4⌝),
	("3.6.10", z_ℝ_abs_conv, ⓩabs⋎R ~⋎R(real 4)⌝, ⓩreal 4⌝)
];
=TEX
Now some more extensive tests for main computational conversions.
First of all we need some ML to check that signed literal results
are in the approved normal form:
=SML
fun ⦏gcd⦎ (m : INTEGER) (n : INTEGER) = (
	if	m @<= zero
	then	n
	else if	m @< n
	then	gcd (n imod m) m
	else if	m = n
	then	m
	else	gcd (m imod n) n
);
fun is_ok_lit (tm : TERM) : bool = (
	let	val (tm1, pos) = (dest_z_ℝ_minus tm, false) handle Fail _ => (tm, true);
	in	let	val i = dest_z_signed_int(dest_z_real tm1);
		in	(pos andalso i @>= zero) orelse (not pos andalso i @> zero)
		end	handle Fail _ =>
		let	val (num, den) = (dest_z_signed_int ** dest_z_signed_int)
					(dest_z_ℝ_frac tm1);
		in	num @>= zero andalso den @>= one andalso gcd num den = one
		end	handle Fail _ => false
	end
);
=TEX
Now some glue so that we can check the results of a whole list of
conversion runs.
=SML
fun arith_conv_check (tm : TERM, th : THM) : bool = (
	let	val (lhs, rhs) = dest_eq(concl th);
	in	is_nil (asms th) andalso tm =$ lhs andalso is_ok_lit rhs
	end	handle Fail _ => false
);
fun chk_c (c : CONV) : TERM list -> (TERM * THM) list = (
	map (fn t => (t, c t))
);
fun arith_batch (tag : string) (c : CONV) (tms : TERM list) : (string * bool) list = (
	let	val labs = interval 1 (length tms);
		fun mk_tag i = tag ^ "." ^ string_of_int i;
	in	combine (map mk_tag labs) (map arith_conv_check (chk_c c tms))
	end
);
fun pred_conv_check (tm : TERM, th : THM) : bool = (
	let	val (lhs, rhs) = dest_eq(concl th);
	in	is_nil (asms th) andalso tm =$ lhs andalso (is_t rhs orelse is_f rhs)
	end	handle Fail _ => false
);
fun pred_batch (tag : string) (c : CONV) (tms : TERM list) : (string * bool) list = (
	let	val labs = interval 1 (length tms);
		fun mk_tag i = tag ^ "." ^ string_of_int i;
	in	combine (map mk_tag labs) (map pred_conv_check (chk_c c tms))
	end
);
=TEX
Now we can do batches of tests:
=SML
store_mt_results
(arith_batch "3.7.1" z_ℝ_plus_conv)
[
ⓩreal 0 +⋎R real 0⌝, ⓩreal 0 +⋎R ~⋎R(real 0)⌝, ⓩ~⋎R(real 0) +⋎R real 0⌝, ⓩ~⋎R(real 0) +⋎R ~⋎R(real 0)⌝,
ⓩreal 1 +⋎R real 0⌝, ⓩreal 1 +⋎R ~⋎R(real 0)⌝, ⓩ~⋎R(real 1) +⋎R real 0⌝, ⓩ~⋎R(real 1) +⋎R ~⋎R(real 0)⌝,
ⓩreal 0 +⋎R real 1⌝, ⓩreal 0 +⋎R ~⋎R(real 1)⌝, ⓩ~⋎R(real 0) +⋎R real 1⌝, ⓩ~⋎R(real 0) +⋎R ~⋎R(real 1)⌝,
ⓩreal 1 +⋎R real 1⌝, ⓩreal 1 +⋎R ~⋎R(real 1)⌝, ⓩ~⋎R(real 1) +⋎R real 1⌝, ⓩ~⋎R(real 1) +⋎R ~⋎R(real 1)⌝
];
=TEX
=SML
store_mt_results
(arith_batch "3.7.2"  z_ℝ_plus_conv)
[
ⓩ0 /⋎Z 1 +⋎R 0 /⋎Z 1⌝, ⓩ0 /⋎Z 1 +⋎R ~⋎R(0 /⋎Z 1)⌝, ⓩ~⋎R(0 /⋎Z 1) +⋎R 0 /⋎Z 1⌝, ⓩ~⋎R(0 /⋎Z 1) +⋎R ~⋎R(0 /⋎Z 1)⌝,
ⓩ1 /⋎Z 1 +⋎R 0 /⋎Z 1⌝, ⓩ1 /⋎Z 1 +⋎R ~⋎R(0 /⋎Z 1)⌝, ⓩ~⋎R(1 /⋎Z 1) +⋎R 0 /⋎Z 1⌝, ⓩ~⋎R(1 /⋎Z 1) +⋎R ~⋎R(0 /⋎Z 1)⌝,
ⓩ0 /⋎Z 1 +⋎R 1 /⋎Z 1⌝, ⓩ0 /⋎Z 1 +⋎R ~⋎R(1 /⋎Z 1)⌝, ⓩ~⋎R(0 /⋎Z 1) +⋎R 1 /⋎Z 1⌝, ⓩ~⋎R(0 /⋎Z 1) +⋎R ~⋎R(1 /⋎Z 1)⌝,
ⓩ1 /⋎Z 1 +⋎R 1 /⋎Z 1⌝, ⓩ1 /⋎Z 1 +⋎R ~⋎R(1 /⋎Z 1)⌝, ⓩ~⋎R(1 /⋎Z 1) +⋎R 1 /⋎Z 1⌝, ⓩ~⋎R(1 /⋎Z 1) +⋎R ~⋎R(1 /⋎Z 1)⌝
];
=TEX
=SML
store_mt_results
(arith_batch "3.7.3" z_ℝ_plus_conv)
[
ⓩ(1 /⋎Z 2) +⋎R real 0⌝, ⓩ(1 /⋎Z 2) +⋎R ~⋎R(real 0)⌝, ⓩ~⋎R(1 /⋎Z 2) +⋎R real 0⌝, ⓩ~⋎R(1 /⋎Z 2) +⋎R ~⋎R(real 0)⌝,
ⓩreal 0 +⋎R (1 /⋎Z 2)⌝, ⓩreal 0 +⋎R ~⋎R(1 /⋎Z 2)⌝, ⓩ~⋎R(real 0) +⋎R 1 /⋎Z 2⌝, ⓩ~⋎R(real 0) +⋎R ~⋎R(1 /⋎Z 2)⌝,
ⓩ(1 /⋎Z 2) +⋎R real 1⌝, ⓩ(1 /⋎Z 2) +⋎R ~⋎R(real 1)⌝, ⓩ~⋎R(1 /⋎Z 2) +⋎R real 1⌝, ⓩ~⋎R(1 /⋎Z 2) +⋎R ~⋎R(real 1)⌝,
ⓩreal 1 +⋎R (1 /⋎Z 2)⌝, ⓩreal 1 +⋎R ~⋎R(1 /⋎Z 2)⌝, ⓩ~⋎R(real 1) +⋎R 1 /⋎Z 2⌝, ⓩ~⋎R(real 1) +⋎R ~⋎R(1 /⋎Z 2)⌝,
ⓩ(1 /⋎Z 2) +⋎R real 2⌝, ⓩ(1 /⋎Z 2) +⋎R ~⋎R(real 2)⌝, ⓩ~⋎R(1 /⋎Z 2) +⋎R real 2⌝, ⓩ~⋎R(1 /⋎Z 2) +⋎R ~⋎R(real 2)⌝,
ⓩreal 2 +⋎R (1 /⋎Z 2)⌝, ⓩreal 2 +⋎R ~⋎R(1 /⋎Z 2)⌝, ⓩ~⋎R(real 2) +⋎R 1 /⋎Z 2⌝, ⓩ~⋎R(real 2) +⋎R ~⋎R(1 /⋎Z 2)⌝,
ⓩ(1 /⋎Z 2) +⋎R real 45⌝, ⓩ(1 /⋎Z 2) +⋎R ~⋎R(real 45)⌝, ⓩ~⋎R(1 /⋎Z 2) +⋎R real 45⌝, ⓩ~⋎R(1 /⋎Z 2) +⋎R ~⋎R(real 45)⌝,
ⓩreal 45 +⋎R (1 /⋎Z 2)⌝, ⓩreal 45 +⋎R ~⋎R(1 /⋎Z 2)⌝, ⓩ~⋎R(real 45) +⋎R 1 /⋎Z 2⌝, ⓩ~⋎R(real 45) +⋎R ~⋎R(1 /⋎Z 2)⌝
];
=TEX
=SML
store_mt_results
(arith_batch "3.7.4" z_ℝ_plus_conv)
[
ⓩ(44 /⋎Z 14) +⋎R real 0⌝, ⓩ(44 /⋎Z 14) +⋎R ~⋎R(real 0)⌝, ⓩ~⋎R(44 /⋎Z 14) +⋎R real 0⌝, ⓩ~⋎R(44 /⋎Z 14) +⋎R ~⋎R(real 0)⌝,
ⓩreal 0 +⋎R (44 /⋎Z 14)⌝, ⓩreal 0 +⋎R ~⋎R(44 /⋎Z 14)⌝, ⓩ~⋎R(real 0) +⋎R 44 /⋎Z 14⌝, ⓩ~⋎R(real 0) +⋎R ~⋎R(44 /⋎Z 14)⌝,
ⓩ(44 /⋎Z 14) +⋎R real 1⌝, ⓩ(44 /⋎Z 14) +⋎R ~⋎R(real 1)⌝, ⓩ~⋎R(44 /⋎Z 14) +⋎R real 1⌝, ⓩ~⋎R(44 /⋎Z 14) +⋎R ~⋎R(real 1)⌝,
ⓩreal 1 +⋎R (44 /⋎Z 14)⌝, ⓩreal 1 +⋎R ~⋎R(44 /⋎Z 14)⌝, ⓩ~⋎R(real 1) +⋎R 44 /⋎Z 14⌝, ⓩ~⋎R(real 1) +⋎R ~⋎R(44 /⋎Z 14)⌝,
ⓩ(44 /⋎Z 14) +⋎R real 2⌝, ⓩ(44 /⋎Z 14) +⋎R ~⋎R(real 2)⌝, ⓩ~⋎R(44 /⋎Z 14) +⋎R real 2⌝, ⓩ~⋎R(44 /⋎Z 14) +⋎R ~⋎R(real 2)⌝,
ⓩreal 2 +⋎R (44 /⋎Z 14)⌝, ⓩreal 2 +⋎R ~⋎R(44 /⋎Z 14)⌝, ⓩ~⋎R(real 2) +⋎R 44 /⋎Z 14⌝, ⓩ~⋎R(real 2) +⋎R ~⋎R(44 /⋎Z 14)⌝,
ⓩ(44 /⋎Z 14) +⋎R real 101⌝, ⓩ(44 /⋎Z 14) +⋎R ~⋎R(real 101)⌝, ⓩ~⋎R(44 /⋎Z 14) +⋎R real 101⌝, ⓩ~⋎R(44 /⋎Z 14) +⋎R ~⋎R(real 101)⌝,
ⓩreal 101 +⋎R (44 /⋎Z 14)⌝, ⓩreal 101 +⋎R ~⋎R(44 /⋎Z 14)⌝, ⓩ~⋎R(real 101) +⋎R 44 /⋎Z 14⌝, ⓩ~⋎R(real 101) +⋎R ~⋎R(44 /⋎Z 14)⌝
];
=TEX
=SML
store_mt_results
(arith_batch "3.7.5" z_ℝ_plus_conv)
[
ⓩ(22 /⋎Z 7) +⋎R (1 /⋎Z 3)⌝, ⓩ(22 /⋎Z 7) +⋎R ~⋎R(1 /⋎Z 3)⌝, ⓩ~⋎R(22 /⋎Z 7) +⋎R (1 /⋎Z 3)⌝, ⓩ~⋎R(22 /⋎Z 7) +⋎R ~⋎R(1 /⋎Z 3)⌝,
ⓩ(44 /⋎Z 14) +⋎R (1 /⋎Z 3)⌝, ⓩ(44 /⋎Z 14) +⋎R ~⋎R(1 /⋎Z 3)⌝, ⓩ~⋎R(44 /⋎Z 14) +⋎R (1 /⋎Z 3)⌝, ⓩ~⋎R(44 /⋎Z 14) +⋎R ~⋎R(1 /⋎Z 3)⌝,
ⓩ(22 /⋎Z 7) +⋎R (15 /⋎Z 45)⌝, ⓩ(22 /⋎Z 7) +⋎R ~⋎R(15 /⋎Z 45)⌝, ⓩ~⋎R(22 /⋎Z 7) +⋎R (15 /⋎Z 45)⌝, ⓩ~⋎R(22 /⋎Z 7) +⋎R ~⋎R(15 /⋎Z 45)⌝,
ⓩ(44 /⋎Z 14) +⋎R (15 /⋎Z 45)⌝, ⓩ(44 /⋎Z 14) +⋎R ~⋎R(15 /⋎Z 45)⌝, ⓩ~⋎R(44 /⋎Z 14) +⋎R (15 /⋎Z 45)⌝, ⓩ~⋎R(44 /⋎Z 14) +⋎R ~⋎R(15 /⋎Z 45)⌝
];
=TEX
=SML
store_mt_results
(arith_batch "3.8.1" z_ℝ_times_conv)
[
ⓩreal 0 *⋎R real 0⌝, ⓩreal 0 *⋎R ~⋎R(real 0)⌝, ⓩ~⋎R(real 0) *⋎R real 0⌝, ⓩ~⋎R(real 0) *⋎R ~⋎R(real 0)⌝,
ⓩreal 1 *⋎R real 0⌝, ⓩreal 1 *⋎R ~⋎R(real 0)⌝, ⓩ~⋎R(real 1) *⋎R real 0⌝, ⓩ~⋎R(real 1) *⋎R ~⋎R(real 0)⌝,
ⓩreal 0 *⋎R real 1⌝, ⓩreal 0 *⋎R ~⋎R(real 1)⌝, ⓩ~⋎R(real 0) *⋎R real 1⌝, ⓩ~⋎R(real 0) *⋎R ~⋎R(real 1)⌝,
ⓩreal 1 *⋎R real 1⌝, ⓩreal 1 *⋎R ~⋎R(real 1)⌝, ⓩ~⋎R(real 1) *⋎R real 1⌝, ⓩ~⋎R(real 1) *⋎R ~⋎R(real 1)⌝
];
=TEX
=SML
store_mt_results
(arith_batch "3.8.2" z_ℝ_times_conv)
[
ⓩ(0 /⋎Z 1) *⋎R (0 /⋎Z 1)⌝, ⓩ(0 /⋎Z 1) *⋎R (~⋎R(0 /⋎Z 1))⌝, ⓩ(~⋎R(0 /⋎Z 1)) *⋎R (0 /⋎Z 1)⌝, ⓩ(~⋎R(0 /⋎Z 1)) *⋎R (~⋎R(0 /⋎Z 1))⌝,
ⓩ(1 /⋎Z 1) *⋎R (0 /⋎Z 1)⌝, ⓩ(1 /⋎Z 1) *⋎R (~⋎R(0 /⋎Z 1))⌝, ⓩ(~⋎R(1 /⋎Z 1)) *⋎R (0 /⋎Z 1)⌝, ⓩ(~⋎R(1 /⋎Z 1)) *⋎R (~⋎R(0 /⋎Z 1))⌝,
ⓩ(0 /⋎Z 1) *⋎R (1 /⋎Z 1)⌝, ⓩ(0 /⋎Z 1) *⋎R (~⋎R(1 /⋎Z 1))⌝, ⓩ(~⋎R(0 /⋎Z 1)) *⋎R (1 /⋎Z 1)⌝, ⓩ(~⋎R(0 /⋎Z 1)) *⋎R (~⋎R(1 /⋎Z 1))⌝,
ⓩ(1 /⋎Z 1) *⋎R (1 /⋎Z 1)⌝, ⓩ(1 /⋎Z 1) *⋎R (~⋎R(1 /⋎Z 1))⌝, ⓩ(~⋎R(1 /⋎Z 1)) *⋎R (1 /⋎Z 1)⌝, ⓩ(~⋎R(1 /⋎Z 1)) *⋎R (~⋎R(1 /⋎Z 1))⌝
];
=TEX
=SML
store_mt_results
(arith_batch "3.8.3" z_ℝ_times_conv)
[
ⓩ(1 /⋎Z 2) *⋎R real 0⌝, ⓩ(1 /⋎Z 2) *⋎R ~⋎R(real 0)⌝, ⓩ~⋎R(1 /⋎Z 2) *⋎R real 0⌝, ⓩ~⋎R(1 /⋎Z 2) *⋎R ~⋎R(real 0)⌝,
ⓩreal 0 *⋎R (1 /⋎Z 2)⌝, ⓩreal 0 *⋎R ~⋎R(1 /⋎Z 2)⌝, ⓩ~⋎R(real 0) *⋎R (1 /⋎Z 2)⌝, ⓩ~⋎R(real 0) *⋎R ~⋎R(1 /⋎Z 2)⌝,
ⓩ(1 /⋎Z 2) *⋎R real 1⌝, ⓩ(1 /⋎Z 2) *⋎R ~⋎R(real 1)⌝, ⓩ~⋎R(1 /⋎Z 2) *⋎R real 1⌝, ⓩ~⋎R(1 /⋎Z 2) *⋎R ~⋎R(real 1)⌝,
ⓩreal 1 *⋎R (1 /⋎Z 2)⌝, ⓩreal 1 *⋎R ~⋎R(1 /⋎Z 2)⌝, ⓩ~⋎R(real 1) *⋎R (1 /⋎Z 2)⌝, ⓩ~⋎R(real 1) *⋎R ~⋎R(1 /⋎Z 2)⌝,
ⓩ(1 /⋎Z 2) *⋎R real 2⌝, ⓩ(1 /⋎Z 2) *⋎R ~⋎R(real 2)⌝, ⓩ~⋎R(1 /⋎Z 2) *⋎R real 2⌝, ⓩ~⋎R(1 /⋎Z 2) *⋎R ~⋎R(real 2)⌝,
ⓩreal 2 *⋎R (1 /⋎Z 2)⌝, ⓩreal 2 *⋎R ~⋎R(1 /⋎Z 2)⌝, ⓩ~⋎R(real 2) *⋎R (1 /⋎Z 2)⌝, ⓩ~⋎R(real 2) *⋎R ~⋎R(1 /⋎Z 2)⌝,
ⓩ(1 /⋎Z 2) *⋎R real 45⌝, ⓩ(1 /⋎Z 2) *⋎R ~⋎R(real 45)⌝, ⓩ~⋎R(1 /⋎Z 2) *⋎R real 45⌝, ⓩ~⋎R(1 /⋎Z 2) *⋎R ~⋎R(real 45)⌝,
ⓩreal 45 *⋎R (1 /⋎Z 2)⌝, ⓩreal 45 *⋎R ~⋎R(1 /⋎Z 2)⌝, ⓩ~⋎R(real 45) *⋎R (1 /⋎Z 2)⌝, ⓩ~⋎R(real 45) *⋎R ~⋎R(1 /⋎Z 2)⌝
];
=TEX
=SML
store_mt_results
(arith_batch "3.8.4" z_ℝ_times_conv)
[
ⓩ(44 /⋎Z 14) *⋎R real 0⌝, ⓩ(44 /⋎Z 14) *⋎R ~⋎R(real 0)⌝, ⓩ~⋎R(44 /⋎Z 14) *⋎R real 0⌝, ⓩ~⋎R(44 /⋎Z 14) *⋎R ~⋎R(real 0)⌝,
ⓩreal 0 *⋎R (44 /⋎Z 14)⌝, ⓩreal 0 *⋎R ~⋎R(44 /⋎Z 14)⌝, ⓩ~⋎R(real 0) *⋎R (44 /⋎Z 14)⌝, ⓩ~⋎R(real 0) *⋎R ~⋎R(44 /⋎Z 14)⌝,
ⓩ(44 /⋎Z 14) *⋎R real 1⌝, ⓩ(44 /⋎Z 14) *⋎R ~⋎R(real 1)⌝, ⓩ~⋎R(44 /⋎Z 14) *⋎R real 1⌝, ⓩ~⋎R(44 /⋎Z 14) *⋎R ~⋎R(real 1)⌝,
ⓩreal 1 *⋎R (44 /⋎Z 14)⌝, ⓩreal 1 *⋎R ~⋎R(44 /⋎Z 14)⌝, ⓩ~⋎R(real 1) *⋎R (44 /⋎Z 14)⌝, ⓩ~⋎R(real 1) *⋎R ~⋎R(44 /⋎Z 14)⌝,
ⓩ(44 /⋎Z 14) *⋎R real 2⌝, ⓩ(44 /⋎Z 14) *⋎R ~⋎R(real 2)⌝, ⓩ~⋎R(44 /⋎Z 14) *⋎R real 2⌝, ⓩ~⋎R(44 /⋎Z 14) *⋎R ~⋎R(real 2)⌝,
ⓩreal 2 *⋎R (44 /⋎Z 14)⌝, ⓩreal 2 *⋎R ~⋎R(44 /⋎Z 14)⌝, ⓩ~⋎R(real 2) *⋎R (44 /⋎Z 14)⌝, ⓩ~⋎R(real 2) *⋎R ~⋎R(44 /⋎Z 14)⌝,
ⓩ(44 /⋎Z 14) *⋎R real 101⌝, ⓩ(44 /⋎Z 14) *⋎R ~⋎R(real 101)⌝, ⓩ~⋎R(44 /⋎Z 14) *⋎R real 101⌝, ⓩ~⋎R(44 /⋎Z 14) *⋎R ~⋎R(real 101)⌝,
ⓩreal 101 *⋎R (44 /⋎Z 14)⌝, ⓩreal 101 *⋎R ~⋎R(44 /⋎Z 14)⌝, ⓩ~⋎R(real 101) *⋎R (44 /⋎Z 14)⌝, ⓩ~⋎R(real 101) *⋎R ~⋎R(44 /⋎Z 14)⌝
];
=TEX
=SML
store_mt_results
(arith_batch "3.8.5" z_ℝ_times_conv)
[
ⓩ(22 /⋎Z 7) *⋎R (1 /⋎Z 3)⌝, ⓩ(22 /⋎Z 7) *⋎R ~⋎R(1 /⋎Z 3)⌝, ⓩ~⋎R(22 /⋎Z 7) *⋎R (1 /⋎Z 3)⌝, ⓩ~⋎R(22 /⋎Z 7) *⋎R ~⋎R(1 /⋎Z 3)⌝,
ⓩ(44 /⋎Z 14) *⋎R (1 /⋎Z 3)⌝, ⓩ(44 /⋎Z 14) *⋎R ~⋎R(1 /⋎Z 3)⌝, ⓩ~⋎R(44 /⋎Z 14) *⋎R (1 /⋎Z 3)⌝, ⓩ~⋎R(44 /⋎Z 14) *⋎R ~⋎R(1 /⋎Z 3)⌝,
ⓩ(22 /⋎Z 7) *⋎R (15 /⋎Z 45)⌝, ⓩ(22 /⋎Z 7) *⋎R ~⋎R(15 /⋎Z 45)⌝, ⓩ~⋎R(22 /⋎Z 7) *⋎R (15 /⋎Z 45)⌝, ⓩ~⋎R(22 /⋎Z 7) *⋎R ~⋎R(15 /⋎Z 45)⌝,
ⓩ(44 /⋎Z 14) *⋎R (15 /⋎Z 45)⌝, ⓩ(44 /⋎Z 14) *⋎R ~⋎R(15 /⋎Z 45)⌝, ⓩ~⋎R(44 /⋎Z 14) *⋎R (15 /⋎Z 45)⌝, ⓩ~⋎R(44 /⋎Z 14) *⋎R ~⋎R(15 /⋎Z 45)⌝
];
=TEX
=SML
store_mt_results
(arith_batch "3.9.1" z_ℝ_over_conv)
[
ⓩ(1 /⋎Z 2)  /⋎R  real 5⌝, ⓩ(1 /⋎Z 2)  /⋎R  ~⋎R(real 5)⌝, ⓩ~⋎R(1 /⋎Z 2)  /⋎R  real 5⌝, ⓩ~⋎R(1 /⋎Z 2)  /⋎R  ~⋎R(real 5)⌝,
ⓩreal 5  /⋎R  (1 /⋎Z 2)⌝, ⓩreal 5  /⋎R  ~⋎R(1 /⋎Z 2)⌝, ⓩ~⋎R(real 5)  /⋎R  (1 /⋎Z 2)⌝, ⓩ~⋎R(real 5)  /⋎R  ~⋎R(1 /⋎Z 2)⌝,
ⓩ(1 /⋎Z 2)  /⋎R  real 1⌝, ⓩ(1 /⋎Z 2)  /⋎R  ~⋎R(real 1)⌝, ⓩ~⋎R(1 /⋎Z 2)  /⋎R  real 1⌝, ⓩ~⋎R(1 /⋎Z 2)  /⋎R  ~⋎R(real 1)⌝,
ⓩreal 1  /⋎R  (1 /⋎Z 2)⌝, ⓩreal 1  /⋎R  ~⋎R(1 /⋎Z 2)⌝, ⓩ~⋎R(real 1)  /⋎R  (1 /⋎Z 2)⌝, ⓩ~⋎R(real 1)  /⋎R  ~⋎R(1 /⋎Z 2)⌝,
ⓩ(1 /⋎Z 2)  /⋎R  real 2⌝, ⓩ(1 /⋎Z 2)  /⋎R  ~⋎R(real 2)⌝, ⓩ~⋎R(1 /⋎Z 2)  /⋎R  real 2⌝, ⓩ~⋎R(1 /⋎Z 2)  /⋎R  ~⋎R(real 2)⌝,
ⓩreal 2  /⋎R  (1 /⋎Z 2)⌝, ⓩreal 2  /⋎R  ~⋎R(1 /⋎Z 2)⌝, ⓩ~⋎R(real 2)  /⋎R  (1 /⋎Z 2)⌝, ⓩ~⋎R(real 2)  /⋎R  ~⋎R(1 /⋎Z 2)⌝,
ⓩ(1 /⋎Z 2)  /⋎R  real 45⌝, ⓩ(1 /⋎Z 2)  /⋎R  ~⋎R(real 45)⌝, ⓩ~⋎R(1 /⋎Z 2)  /⋎R  real 45⌝, ⓩ~⋎R(1 /⋎Z 2)  /⋎R  ~⋎R(real 45)⌝
];
=TEX
=SML
store_mt_results
(arith_batch "3.9.2" z_ℝ_over_conv)
[
ⓩ(44 /⋎Z 14)  /⋎R  real 5⌝, ⓩ(44 /⋎Z 14)  /⋎R  ~⋎R(real 5)⌝, ⓩ~⋎R(44 /⋎Z 14)  /⋎R  real 5⌝, ⓩ~⋎R(44 /⋎Z 14)  /⋎R  ~⋎R(real 5)⌝,
ⓩreal 5  /⋎R  (44 /⋎Z 14)⌝, ⓩreal 5  /⋎R  ~⋎R(44 /⋎Z 14)⌝, ⓩ~⋎R(real 5)  /⋎R  (44 /⋎Z 14)⌝, ⓩ~⋎R(real 5)  /⋎R  ~⋎R(44 /⋎Z 14)⌝,
ⓩ(44 /⋎Z 14)  /⋎R  real 1⌝, ⓩ(44 /⋎Z 14)  /⋎R  ~⋎R(real 1)⌝, ⓩ~⋎R(44 /⋎Z 14)  /⋎R  real 1⌝, ⓩ~⋎R(44 /⋎Z 14)  /⋎R  ~⋎R(real 1)⌝,
ⓩreal 1  /⋎R  (44 /⋎Z 14)⌝, ⓩreal 1  /⋎R  ~⋎R(44 /⋎Z 14)⌝, ⓩ~⋎R(real 1)  /⋎R  (44 /⋎Z 14)⌝, ⓩ~⋎R(real 1)  /⋎R  ~⋎R(44 /⋎Z 14)⌝,
ⓩ(44 /⋎Z 14)  /⋎R  real 2⌝, ⓩ(44 /⋎Z 14)  /⋎R  ~⋎R(real 2)⌝, ⓩ~⋎R(44 /⋎Z 14)  /⋎R  real 2⌝, ⓩ~⋎R(44 /⋎Z 14)  /⋎R  ~⋎R(real 2)⌝,
ⓩreal 2  /⋎R  (44 /⋎Z 14)⌝, ⓩreal 2  /⋎R  ~⋎R(44 /⋎Z 14)⌝, ⓩ~⋎R(real 2)  /⋎R  (44 /⋎Z 14)⌝, ⓩ~⋎R(real 2)  /⋎R  ~⋎R(44 /⋎Z 14)⌝,
ⓩ(44 /⋎Z 14)  /⋎R  real 151⌝, ⓩ(44 /⋎Z 14)  /⋎R  ~⋎R(real 151)⌝, ⓩ~⋎R(44 /⋎Z 14)  /⋎R  real 151⌝, ⓩ~⋎R(44 /⋎Z 14)  /⋎R  ~⋎R(real 151)⌝,
ⓩreal 151  /⋎R  (44 /⋎Z 14)⌝, ⓩreal 151  /⋎R  ~⋎R(44 /⋎Z 14)⌝, ⓩ~⋎R(real 151)  /⋎R  (44 /⋎Z 14)⌝, ⓩ~⋎R(real 151)  /⋎R  ~⋎R(44 /⋎Z 14)⌝
];
=TEX
=SML
store_mt_results
(arith_batch "3.9.3" z_ℝ_over_conv)
[
ⓩ(22 /⋎Z 7)  /⋎R  (1 /⋎Z 3)⌝, ⓩ(22 /⋎Z 7)  /⋎R  ~⋎R(1 /⋎Z 3)⌝, ⓩ~⋎R(22 /⋎Z 7)  /⋎R  (1 /⋎Z 3)⌝, ⓩ~⋎R(22 /⋎Z 7)  /⋎R  ~⋎R(1 /⋎Z 3)⌝,
ⓩ(44 /⋎Z 14)  /⋎R  (1 /⋎Z 3)⌝, ⓩ(44 /⋎Z 14)  /⋎R  ~⋎R(1 /⋎Z 3)⌝, ⓩ~⋎R(44 /⋎Z 14)  /⋎R  (1 /⋎Z 3)⌝, ⓩ~⋎R(44 /⋎Z 14)  /⋎R  ~⋎R(1 /⋎Z 3)⌝,
ⓩ(22 /⋎Z 7)  /⋎R  (15 /⋎Z 45)⌝, ⓩ(22 /⋎Z 7)  /⋎R  ~⋎R(15 /⋎Z 45)⌝, ⓩ~⋎R(22 /⋎Z 7)  /⋎R  (15 /⋎Z 45)⌝, ⓩ~⋎R(22 /⋎Z 7)  /⋎R  ~⋎R(15 /⋎Z 45)⌝,
ⓩ(44 /⋎Z 14)  /⋎R  (15 /⋎Z 45)⌝, ⓩ(44 /⋎Z 14)  /⋎R  ~⋎R(15 /⋎Z 45)⌝, ⓩ~⋎R(44 /⋎Z 14)  /⋎R  (15 /⋎Z 45)⌝, ⓩ~⋎R(44 /⋎Z 14)  /⋎R  ~⋎R(15 /⋎Z 45)⌝,
ⓩ(44 /⋎Z 14)  /⋎R  (44 /⋎Z 14)⌝, ⓩ~⋎R(44 /⋎Z 14)  /⋎R  ~⋎R(44 /⋎Z 14)⌝, ⓩ~⋎R(real 3)  /⋎R  ~⋎R(9 /⋎Z 6)⌝, ⓩ(9 /⋎Z 6)  /⋎R  (real 3)⌝,
ⓩ(0 /⋎Z 14)  /⋎R  (44 /⋎Z 14)⌝, ⓩ~⋎R(0 /⋎Z 14)  /⋎R  ~⋎R(44 /⋎Z 14)⌝, ⓩ~⋎R(real 0)  /⋎R  ~⋎R(9 /⋎Z 6)⌝, ⓩ(0 /⋎Z 6)  /⋎R  (real 3)⌝,
ⓩ~⋎R(0 /⋎Z 14)  /⋎R  (44 /⋎Z 14)⌝, ⓩ(0 /⋎Z 14)  /⋎R  ~⋎R(44 /⋎Z 14)⌝, ⓩ~⋎R(real 0)  /⋎R  (9 /⋎Z 6)⌝, ⓩ(0 /⋎Z 6)  /⋎R  (real 3)⌝
];
=TEX
=SML
store_mt_results
(arith_batch "3.10.1" z_ℝ_ℤ_exp_conv)
[
ⓩreal 0 ^⋎Z 0⌝, ⓩ(~⋎R(real 0)) ^⋎Z 0⌝, ⓩ(0 /⋎Z 1) ^⋎Z 0⌝, ⓩ(~⋎R(0 /⋎Z 1)) ^⋎Z 0⌝,
ⓩreal 0 ^⋎Z 1⌝, ⓩ(~⋎R(real 0)) ^⋎Z 1⌝, ⓩ(0 /⋎Z 1) ^⋎Z 1⌝, ⓩ(~⋎R(0 /⋎Z 1)) ^⋎Z 1⌝,
ⓩreal 0 ^⋎Z 7⌝, ⓩ(~⋎R(real 0)) ^⋎Z 7⌝, ⓩ(0 /⋎Z 1) ^⋎Z 7⌝, ⓩ(~⋎R(0 /⋎Z 1)) ^⋎Z 7⌝,
ⓩreal 1 ^⋎Z 0⌝, ⓩ(~⋎R(real 1)) ^⋎Z 0⌝, ⓩ(1 /⋎Z 1) ^⋎Z 0⌝, ⓩ(~⋎R(1 /⋎Z 1)) ^⋎Z 0⌝,
ⓩreal 1 ^⋎Z 1⌝, ⓩ(~⋎R(real 1)) ^⋎Z 1⌝, ⓩ(1 /⋎Z 1) ^⋎Z 1⌝, ⓩ(~⋎R(1 /⋎Z 1)) ^⋎Z 1⌝,
ⓩreal 1 ^⋎Z 7⌝, ⓩ(~⋎R(real 1)) ^⋎Z 7⌝, ⓩ(1 /⋎Z 1) ^⋎Z 7⌝, ⓩ(~⋎R(1 /⋎Z 1)) ^⋎Z 7⌝,
ⓩreal 2 ^⋎Z 0⌝, ⓩ(~⋎R(real 2)) ^⋎Z 0⌝, ⓩ(2 /⋎Z 1) ^⋎Z 0⌝, ⓩ(~⋎R(2 /⋎Z 1)) ^⋎Z 0⌝,
ⓩreal 2 ^⋎Z 0⌝, ⓩreal 2 ^⋎Z 1⌝, ⓩreal 2 ^⋎Z 2⌝, ⓩreal 2 ^⋎Z 3⌝,
ⓩ(3 /⋎Z 4) ^⋎Z 5⌝, ⓩ(~⋎R(99 /⋎Z 17)) ^⋎Z 2⌝, ⓩ(1001 /⋎Z 13) ^⋎Z 3⌝, ⓩ(2 /⋎Z 3) ^⋎Z 7⌝,
ⓩ(1 /⋎Z 4) ^⋎Z 5⌝, ⓩ(~⋎R(1 /⋎Z 17)) ^⋎Z 2⌝, ⓩ(1 /⋎Z 13) ^⋎Z 3⌝, ⓩ(1 /⋎Z 3) ^⋎Z 7⌝,
ⓩreal 0 ^⋎Z ~0⌝, ⓩ(~⋎R(real 0)) ^⋎Z ~0⌝, ⓩ(0 /⋎Z 1) ^⋎Z ~0⌝, ⓩ(~⋎R(0 /⋎Z 1)) ^⋎Z ~0⌝,
ⓩreal 1 ^⋎Z ~0⌝, ⓩ(~⋎R(real 1)) ^⋎Z ~0⌝, ⓩ(1 /⋎Z 1) ^⋎Z ~0⌝, ⓩ(~⋎R(1 /⋎Z 1)) ^⋎Z ~0⌝,
ⓩreal 1 ^⋎Z ~1⌝, ⓩ(~⋎R(real 1)) ^⋎Z ~1⌝, ⓩ(1 /⋎Z 1) ^⋎Z ~1⌝, ⓩ(~⋎R(1 /⋎Z 1)) ^⋎Z ~1⌝,
ⓩreal 1 ^⋎Z ~7⌝, ⓩ(~⋎R(real 1)) ^⋎Z ~7⌝, ⓩ(1 /⋎Z 1) ^⋎Z ~7⌝, ⓩ(~⋎R(1 /⋎Z 1)) ^⋎Z ~7⌝,
ⓩreal 2 ^⋎Z ~0⌝, ⓩ(~⋎R(real 2)) ^⋎Z ~0⌝, ⓩ(2 /⋎Z 1) ^⋎Z ~0⌝, ⓩ(~⋎R(2 /⋎Z 1)) ^⋎Z ~0⌝,
ⓩreal 2 ^⋎Z ~0⌝, ⓩreal 2 ^⋎Z ~1⌝, ⓩreal 2 ^⋎Z ~2⌝, ⓩreal 2 ^⋎Z ~3⌝,
ⓩ(3 /⋎Z 4) ^⋎Z ~5⌝, ⓩ(~⋎R(99 /⋎Z 17)) ^⋎Z ~2⌝, ⓩ(1001 /⋎Z 13) ^⋎Z ~3⌝, ⓩ(2 /⋎Z 3) ^⋎Z ~7⌝,
ⓩ(1 /⋎Z 4) ^⋎Z ~5⌝, ⓩ(~⋎R(1 /⋎Z 17)) ^⋎Z ~2⌝, ⓩ(1 /⋎Z 13) ^⋎Z ~3⌝, ⓩ(1 /⋎Z 3) ^⋎Z ~7⌝
];
=TEX
=SML
store_mt_results
(pred_batch "3.11.1" z_ℝ_less_conv)
[
ⓩ(1 /⋎Z 2) <⋎R real 0⌝, ⓩ(1 /⋎Z 2) <⋎R ~⋎R(real 0)⌝, ⓩ~⋎R(1 /⋎Z 2) <⋎R real 0⌝, ⓩ~⋎R(1 /⋎Z 2) <⋎R ~⋎R(real 0)⌝,
ⓩreal 0 <⋎R (1 /⋎Z 2)⌝, ⓩreal 0 <⋎R ~⋎R(1 /⋎Z 2)⌝, ⓩ~⋎R(real 0) <⋎R 1 /⋎Z 2⌝, ⓩ~⋎R(real 0) <⋎R ~⋎R(1 /⋎Z 2)⌝,
ⓩ(1 /⋎Z 2) <⋎R real 1⌝, ⓩ(1 /⋎Z 2) <⋎R ~⋎R(real 1)⌝, ⓩ~⋎R(1 /⋎Z 2) <⋎R real 1⌝, ⓩ~⋎R(1 /⋎Z 2) <⋎R ~⋎R(real 1)⌝,
ⓩreal 1 <⋎R (1 /⋎Z 2)⌝, ⓩreal 1 <⋎R ~⋎R(1 /⋎Z 2)⌝, ⓩ~⋎R(real 1) <⋎R 1 /⋎Z 2⌝, ⓩ~⋎R(real 1) <⋎R ~⋎R(1 /⋎Z 2)⌝,
ⓩ(1 /⋎Z 2) <⋎R real 2⌝, ⓩ(1 /⋎Z 2) <⋎R ~⋎R(real 2)⌝, ⓩ~⋎R(1 /⋎Z 2) <⋎R real 2⌝, ⓩ~⋎R(1 /⋎Z 2) <⋎R ~⋎R(real 2)⌝,
ⓩreal 2 <⋎R (1 /⋎Z 2)⌝, ⓩreal 2 <⋎R ~⋎R(1 /⋎Z 2)⌝, ⓩ~⋎R(real 2) <⋎R 1 /⋎Z 2⌝, ⓩ~⋎R(real 2) <⋎R ~⋎R(1 /⋎Z 2)⌝,
ⓩ(1 /⋎Z 2) <⋎R real 45⌝, ⓩ(1 /⋎Z 2) <⋎R ~⋎R(real 45)⌝, ⓩ~⋎R(1 /⋎Z 2) <⋎R real 45⌝, ⓩ~⋎R(1 /⋎Z 2) <⋎R ~⋎R(real 45)⌝,
ⓩreal 45 <⋎R (1 /⋎Z 2)⌝, ⓩreal 45 <⋎R ~⋎R(1 /⋎Z 2)⌝, ⓩ~⋎R(real 45) <⋎R 1 /⋎Z 2⌝, ⓩ~⋎R(real 45) <⋎R ~⋎R(1 /⋎Z 2)⌝
];
=TEX
=SML
store_mt_results
(pred_batch "3.11.2" z_ℝ_less_conv)
[
ⓩ(44 /⋎Z 14) <⋎R real 0⌝, ⓩ(44 /⋎Z 14) <⋎R ~⋎R(real 0)⌝, ⓩ~⋎R(44 /⋎Z 14) <⋎R real 0⌝, ⓩ~⋎R(44 /⋎Z 14) <⋎R ~⋎R(real 0)⌝,
ⓩreal 0 <⋎R (44 /⋎Z 14)⌝, ⓩreal 0 <⋎R ~⋎R(44 /⋎Z 14)⌝, ⓩ~⋎R(real 0) <⋎R 44 /⋎Z 14⌝, ⓩ~⋎R(real 0) <⋎R ~⋎R(44 /⋎Z 14)⌝,
ⓩ(44 /⋎Z 14) <⋎R real 1⌝, ⓩ(44 /⋎Z 14) <⋎R ~⋎R(real 1)⌝, ⓩ~⋎R(44 /⋎Z 14) <⋎R real 1⌝, ⓩ~⋎R(44 /⋎Z 14) <⋎R ~⋎R(real 1)⌝,
ⓩreal 1 <⋎R (44 /⋎Z 14)⌝, ⓩreal 1 <⋎R ~⋎R(44 /⋎Z 14)⌝, ⓩ~⋎R(real 1) <⋎R 44 /⋎Z 14⌝, ⓩ~⋎R(real 1) <⋎R ~⋎R(44 /⋎Z 14)⌝,
ⓩ(44 /⋎Z 14) <⋎R real 2⌝, ⓩ(44 /⋎Z 14) <⋎R ~⋎R(real 2)⌝, ⓩ~⋎R(44 /⋎Z 14) <⋎R real 2⌝, ⓩ~⋎R(44 /⋎Z 14) <⋎R ~⋎R(real 2)⌝,
ⓩreal 2 <⋎R (44 /⋎Z 14)⌝, ⓩreal 2 <⋎R ~⋎R(44 /⋎Z 14)⌝, ⓩ~⋎R(real 2) <⋎R 44 /⋎Z 14⌝, ⓩ~⋎R(real 2) <⋎R ~⋎R(44 /⋎Z 14)⌝,
ⓩ(44 /⋎Z 14) <⋎R real 101⌝, ⓩ(44 /⋎Z 14) <⋎R ~⋎R(real 101)⌝, ⓩ~⋎R(44 /⋎Z 14) <⋎R real 101⌝, ⓩ~⋎R(44 /⋎Z 14) <⋎R ~⋎R(real 101)⌝,
ⓩreal 101 <⋎R (44 /⋎Z 14)⌝, ⓩreal 101 <⋎R ~⋎R(44 /⋎Z 14)⌝, ⓩ~⋎R(real 101) <⋎R 44 /⋎Z 14⌝, ⓩ~⋎R(real 101) <⋎R ~⋎R(44 /⋎Z 14)⌝
];
=TEX
=SML
store_mt_results
(pred_batch "3.11.3" z_ℝ_less_conv)
[
ⓩ(22 /⋎Z 7) <⋎R (1 /⋎Z 3)⌝, ⓩ(22 /⋎Z 7) <⋎R ~⋎R(1 /⋎Z 3)⌝, ⓩ~⋎R(22 /⋎Z 7) <⋎R (1 /⋎Z 3)⌝, ⓩ~⋎R(22 /⋎Z 7) <⋎R ~⋎R(1 /⋎Z 3)⌝,
ⓩ(44 /⋎Z 14) <⋎R (1 /⋎Z 3)⌝, ⓩ(44 /⋎Z 14) <⋎R ~⋎R(1 /⋎Z 3)⌝, ⓩ~⋎R(44 /⋎Z 14) <⋎R (1 /⋎Z 3)⌝, ⓩ~⋎R(44 /⋎Z 14) <⋎R ~⋎R(1 /⋎Z 3)⌝,
ⓩ(22 /⋎Z 7) <⋎R (15 /⋎Z 45)⌝, ⓩ(22 /⋎Z 7) <⋎R ~⋎R(15 /⋎Z 45)⌝, ⓩ~⋎R(22 /⋎Z 7) <⋎R (15 /⋎Z 45)⌝, ⓩ~⋎R(22 /⋎Z 7) <⋎R ~⋎R(15 /⋎Z 45)⌝,
ⓩ(44 /⋎Z 14) <⋎R (15 /⋎Z 45)⌝, ⓩ(44 /⋎Z 14) <⋎R ~⋎R(15 /⋎Z 45)⌝, ⓩ~⋎R(44 /⋎Z 14) <⋎R (15 /⋎Z 45)⌝, ⓩ~⋎R(44 /⋎Z 14) <⋎R ~⋎R(15 /⋎Z 45)⌝
];
=TEX
=SML
store_mt_results
(pred_batch "3.12.1" z_ℝ_≤_conv)
[
ⓩ(1 /⋎Z 2) ≤⋎R real 0⌝, ⓩ(1 /⋎Z 2) ≤⋎R ~⋎R(real 0)⌝, ⓩ~⋎R(1 /⋎Z 2) ≤⋎R real 0⌝, ⓩ~⋎R(1 /⋎Z 2) ≤⋎R ~⋎R(real 0)⌝,
ⓩreal 0 ≤⋎R (1 /⋎Z 2)⌝, ⓩreal 0 ≤⋎R ~⋎R(1 /⋎Z 2)⌝, ⓩ~⋎R(real 0) ≤⋎R 1 /⋎Z 2⌝, ⓩ~⋎R(real 0) ≤⋎R ~⋎R(1 /⋎Z 2)⌝,
ⓩ(1 /⋎Z 2) ≤⋎R real 1⌝, ⓩ(1 /⋎Z 2) ≤⋎R ~⋎R(real 1)⌝, ⓩ~⋎R(1 /⋎Z 2) ≤⋎R real 1⌝, ⓩ~⋎R(1 /⋎Z 2) ≤⋎R ~⋎R(real 1)⌝,
ⓩreal 1 ≤⋎R (1 /⋎Z 2)⌝, ⓩreal 1 ≤⋎R ~⋎R(1 /⋎Z 2)⌝, ⓩ~⋎R(real 1) ≤⋎R 1 /⋎Z 2⌝, ⓩ~⋎R(real 1) ≤⋎R ~⋎R(1 /⋎Z 2)⌝,
ⓩ(1 /⋎Z 2) ≤⋎R real 2⌝, ⓩ(1 /⋎Z 2) ≤⋎R ~⋎R(real 2)⌝, ⓩ~⋎R(1 /⋎Z 2) ≤⋎R real 2⌝, ⓩ~⋎R(1 /⋎Z 2) ≤⋎R ~⋎R(real 2)⌝,
ⓩreal 2 ≤⋎R (1 /⋎Z 2)⌝, ⓩreal 2 ≤⋎R ~⋎R(1 /⋎Z 2)⌝, ⓩ~⋎R(real 2) ≤⋎R 1 /⋎Z 2⌝, ⓩ~⋎R(real 2) ≤⋎R ~⋎R(1 /⋎Z 2)⌝,
ⓩ(1 /⋎Z 2) ≤⋎R real 45⌝, ⓩ(1 /⋎Z 2) ≤⋎R ~⋎R(real 45)⌝, ⓩ~⋎R(1 /⋎Z 2) ≤⋎R real 45⌝, ⓩ~⋎R(1 /⋎Z 2) ≤⋎R ~⋎R(real 45)⌝,
ⓩreal 45 ≤⋎R (1 /⋎Z 2)⌝, ⓩreal 45 ≤⋎R ~⋎R(1 /⋎Z 2)⌝, ⓩ~⋎R(real 45) ≤⋎R 1 /⋎Z 2⌝, ⓩ~⋎R(real 45) ≤⋎R ~⋎R(1 /⋎Z 2)⌝
];
=TEX
=SML
store_mt_results
(pred_batch "3.12.2" z_ℝ_≤_conv)
[
ⓩ(44 /⋎Z 14) ≤⋎R real 0⌝, ⓩ(44 /⋎Z 14) ≤⋎R ~⋎R(real 0)⌝, ⓩ~⋎R(44 /⋎Z 14) ≤⋎R real 0⌝, ⓩ~⋎R(44 /⋎Z 14) ≤⋎R ~⋎R(real 0)⌝,
ⓩreal 0 ≤⋎R (44 /⋎Z 14)⌝, ⓩreal 0 ≤⋎R ~⋎R(44 /⋎Z 14)⌝, ⓩ~⋎R(real 0) ≤⋎R 44 /⋎Z 14⌝, ⓩ~⋎R(real 0) ≤⋎R ~⋎R(44 /⋎Z 14)⌝,
ⓩ(44 /⋎Z 14) ≤⋎R real 1⌝, ⓩ(44 /⋎Z 14) ≤⋎R ~⋎R(real 1)⌝, ⓩ~⋎R(44 /⋎Z 14) ≤⋎R real 1⌝, ⓩ~⋎R(44 /⋎Z 14) ≤⋎R ~⋎R(real 1)⌝,
ⓩreal 1 ≤⋎R (44 /⋎Z 14)⌝, ⓩreal 1 ≤⋎R ~⋎R(44 /⋎Z 14)⌝, ⓩ~⋎R(real 1) ≤⋎R 44 /⋎Z 14⌝, ⓩ~⋎R(real 1) ≤⋎R ~⋎R(44 /⋎Z 14)⌝,
ⓩ(44 /⋎Z 14) ≤⋎R real 2⌝, ⓩ(44 /⋎Z 14) ≤⋎R ~⋎R(real 2)⌝, ⓩ~⋎R(44 /⋎Z 14) ≤⋎R real 2⌝, ⓩ~⋎R(44 /⋎Z 14) ≤⋎R ~⋎R(real 2)⌝,
ⓩreal 2 ≤⋎R (44 /⋎Z 14)⌝, ⓩreal 2 ≤⋎R ~⋎R(44 /⋎Z 14)⌝, ⓩ~⋎R(real 2) ≤⋎R 44 /⋎Z 14⌝, ⓩ~⋎R(real 2) ≤⋎R ~⋎R(44 /⋎Z 14)⌝,
ⓩ(44 /⋎Z 14) ≤⋎R real 101⌝, ⓩ(44 /⋎Z 14) ≤⋎R ~⋎R(real 101)⌝, ⓩ~⋎R(44 /⋎Z 14) ≤⋎R real 101⌝, ⓩ~⋎R(44 /⋎Z 14) ≤⋎R ~⋎R(real 101)⌝,
ⓩreal 101 ≤⋎R (44 /⋎Z 14)⌝, ⓩreal 101 ≤⋎R ~⋎R(44 /⋎Z 14)⌝, ⓩ~⋎R(real 101) ≤⋎R 44 /⋎Z 14⌝, ⓩ~⋎R(real 101) ≤⋎R ~⋎R(44 /⋎Z 14)⌝
];
=TEX
=SML
store_mt_results
(pred_batch "3.12.3" z_ℝ_≤_conv)
[
ⓩ(22 /⋎Z 7) ≤⋎R (1 /⋎Z 3)⌝, ⓩ(22 /⋎Z 7) ≤⋎R ~⋎R(1 /⋎Z 3)⌝, ⓩ~⋎R(22 /⋎Z 7) ≤⋎R (1 /⋎Z 3)⌝, ⓩ~⋎R(22 /⋎Z 7) ≤⋎R ~⋎R(1 /⋎Z 3)⌝,
ⓩ(44 /⋎Z 14) ≤⋎R (1 /⋎Z 3)⌝, ⓩ(44 /⋎Z 14) ≤⋎R ~⋎R(1 /⋎Z 3)⌝, ⓩ~⋎R(44 /⋎Z 14) ≤⋎R (1 /⋎Z 3)⌝, ⓩ~⋎R(44 /⋎Z 14) ≤⋎R ~⋎R(1 /⋎Z 3)⌝,
ⓩ(22 /⋎Z 7) ≤⋎R (15 /⋎Z 45)⌝, ⓩ(22 /⋎Z 7) ≤⋎R ~⋎R(15 /⋎Z 45)⌝, ⓩ~⋎R(22 /⋎Z 7) ≤⋎R (15 /⋎Z 45)⌝, ⓩ~⋎R(22 /⋎Z 7) ≤⋎R ~⋎R(15 /⋎Z 45)⌝,
ⓩ(44 /⋎Z 14) ≤⋎R (15 /⋎Z 45)⌝, ⓩ(44 /⋎Z 14) ≤⋎R ~⋎R(15 /⋎Z 45)⌝, ⓩ~⋎R(44 /⋎Z 14) ≤⋎R (15 /⋎Z 45)⌝, ⓩ~⋎R(44 /⋎Z 14) ≤⋎R ~⋎R(15 /⋎Z 45)⌝,
ⓩ(44 /⋎Z 14) ≤⋎R (44 /⋎Z 14)⌝, ⓩ~⋎R(44 /⋎Z 14) ≤⋎R ~⋎R(44 /⋎Z 14)⌝, ⓩ~⋎R(real 3) ≤⋎R ~⋎R(9 /⋎Z 6)⌝, ⓩ(9 /⋎Z 6) ≤⋎R (real 3)⌝
];
=TEX
=SML
store_mt_results
(pred_batch "3.14.1" z_ℝ_eq_conv)
[
ⓩ(real 0) = (real 0)⌝, ⓩ~⋎R(real 0) = (real 0)⌝,  ⓩ(real 0) = ~⋎R(real 0)⌝, ⓩ~⋎R(real 0) = ~⋎R (real 0)⌝,
ⓩ(real 0) = (real 1)⌝, ⓩ~⋎R(real 0) = (real 1)⌝,  ⓩ(real 0) = ~⋎R(real 1)⌝, ⓩ~⋎R(real 0) = ~⋎R (real 1)⌝
];
=TEX
=SML
store_mt_results
(pred_batch "3.14.2" z_ℝ_eq_conv)
[
ⓩ(real 0) = (0 /⋎Z 1)⌝, ⓩ~⋎R(real 0) = (0 /⋎Z 1)⌝,  ⓩ(real 0) = ~⋎R(0 /⋎Z 1)⌝, ⓩ~⋎R(real 0) = ~⋎R (0 /⋎Z 1)⌝,
ⓩ(real 0) = (1 /⋎Z 1)⌝, ⓩ~⋎R(real 0) = (1 /⋎Z 1)⌝,  ⓩ(real 0) = ~⋎R(1 /⋎Z 1)⌝, ⓩ~⋎R(real 0) = ~⋎R (1 /⋎Z 1)⌝
];
=TEX
=SML
store_mt_results
(pred_batch "3.14.3" z_ℝ_eq_conv)
[
ⓩ(1 /⋎Z 2) = (1 /⋎Z 2)⌝, ⓩ~⋎R(1 /⋎Z 2) = (1 /⋎Z 2)⌝,ⓩ(1 /⋎Z 2) = ~⋎R(1 /⋎Z 2)⌝,  ⓩ~⋎R(1 /⋎Z 2) = ~⋎R(1 /⋎Z 2)⌝,
ⓩ(1 /⋎Z 2) = (2 /⋎Z 3)⌝, ⓩ~⋎R(1 /⋎Z 2) = (2 /⋎Z 3)⌝,ⓩ(1 /⋎Z 2) = ~⋎R(2 /⋎Z 3)⌝,  ⓩ~⋎R(1 /⋎Z 2) = ~⋎R(2 /⋎Z 3)⌝,
ⓩ(17 /⋎Z 34) = (3 /⋎Z 6)⌝, ⓩ~⋎R(17 /⋎Z 34) = (3 /⋎Z 6)⌝, ⓩ(17 /⋎Z 34) = ~⋎R(3 /⋎Z 6)⌝, ⓩ~⋎R(17 /⋎Z 34) = ~⋎R(3 /⋎Z 6)⌝
];
=TEX
=SML
store_mt_results
(arith_batch "3.15.1" z_ℝ_eval_conv)
[
	ⓩreal 0 +⋎R real 0⌝, ⓩreal 0 +⋎R ~⋎R(real 0)⌝, ⓩ~⋎R(real 0) +⋎R real 0⌝, ⓩ~⋎R(real 0) +⋎R ~⋎R(real 0)⌝,
	ⓩreal 1 +⋎R real 0⌝, ⓩreal 1 +⋎R ~⋎R(real 0)⌝, ⓩ~⋎R(real 1) +⋎R real 0⌝, ⓩ~⋎R(real 1) +⋎R ~⋎R(real 0)⌝,
	ⓩreal 1 +⋎R real 1⌝, ⓩreal 1 +⋎R ~⋎R(real 1)⌝, ⓩ~⋎R(real 1) +⋎R real 1⌝, ⓩ~⋎R(real 1) +⋎R ~⋎R(real 1)⌝,
	ⓩ(0 /⋎Z 1) +⋎R real 1⌝, ⓩ(0 /⋎Z 1) +⋎R ~⋎R(real 1)⌝, ⓩ~⋎R(0 /⋎Z 1) +⋎R real 1⌝, ⓩ~⋎R(0 /⋎Z 1) +⋎R ~⋎R(real 1)⌝,
	ⓩreal 1 +⋎R (0 /⋎Z 1)⌝, ⓩreal 1 +⋎R ~⋎R(0 /⋎Z 1)⌝, ⓩ~⋎R(real 1) +⋎R (0 /⋎Z 1)⌝, ⓩ~⋎R(real 1) +⋎R ~⋎R(0 /⋎Z 1)⌝,
	ⓩ(0 /⋎Z 1) +⋎R real 1⌝, ⓩ(0 /⋎Z 1) +⋎R ~⋎R(real 1)⌝, ⓩ~⋎R(0 /⋎Z 1) +⋎R real 1⌝, ⓩ~⋎R(0 /⋎Z 1) +⋎R ~⋎R(real 1)⌝,
	ⓩ(0 /⋎Z 1) +⋎R (0 /⋎Z 1)⌝, ⓩ(0 /⋎Z 1) +⋎R ~⋎R(0 /⋎Z 1)⌝, ⓩ~⋎R(0 /⋎Z 1) +⋎R (0 /⋎Z 1)⌝, ⓩ~⋎R(0 /⋎Z 1) +⋎R ~⋎R(0 /⋎Z 1)⌝,
	ⓩ1 /⋎Z 1 +⋎R 1 /⋎Z 1⌝, ⓩ1 /⋎Z 1 +⋎R ~⋎R(1 /⋎Z 1)⌝, ⓩ~⋎R(1 /⋎Z 1) +⋎R 1 /⋎Z 1⌝, ⓩ~⋎R(1 /⋎Z 1) +⋎R ~⋎R(1 /⋎Z 1)⌝,
	ⓩ2 /⋎Z 3 +⋎R 3 /⋎Z 4⌝, ⓩ2 /⋎Z 3 +⋎R ~⋎R(3 /⋎Z 4)⌝, ⓩ~⋎R(2 /⋎Z 3) +⋎R 3 /⋎Z 4⌝, ⓩ~⋎R(2 /⋎Z 3) +⋎R ~⋎R(3 /⋎Z 4)⌝
];
=TEX
=SML
store_mt_results
(arith_batch "3.15.2" z_ℝ_eval_conv)
[
	ⓩreal 0 *⋎R real 0⌝, ⓩreal 0 *⋎R ~⋎R(real 0)⌝, ⓩ~⋎R(real 0) *⋎R real 0⌝, ⓩ~⋎R(real 0) *⋎R ~⋎R(real 0)⌝,
	ⓩreal 1 *⋎R real 0⌝, ⓩreal 1 *⋎R ~⋎R(real 0)⌝, ⓩ~⋎R(real 1) *⋎R real 0⌝, ⓩ~⋎R(real 1) *⋎R ~⋎R(real 0)⌝,
	ⓩreal 1 *⋎R real 1⌝, ⓩreal 1 *⋎R ~⋎R(real 1)⌝, ⓩ~⋎R(real 1) *⋎R real 1⌝, ⓩ~⋎R(real 1) *⋎R ~⋎R(real 1)⌝,
	ⓩ(0 /⋎Z 1) *⋎R real 1⌝, ⓩ(0 /⋎Z 1) *⋎R ~⋎R(real 1)⌝, ⓩ~⋎R(0 /⋎Z 1) *⋎R real 1⌝, ⓩ~⋎R(0 /⋎Z 1) *⋎R ~⋎R(real 1)⌝,
	ⓩreal 1 *⋎R (0 /⋎Z 1)⌝, ⓩreal 1 *⋎R ~⋎R(0 /⋎Z 1)⌝, ⓩ~⋎R(real 1) *⋎R (0 /⋎Z 1)⌝, ⓩ~⋎R(real 1) *⋎R ~⋎R(0 /⋎Z 1)⌝,
	ⓩ(0 /⋎Z 1) *⋎R real 1⌝, ⓩ(0 /⋎Z 1) *⋎R ~⋎R(real 1)⌝, ⓩ~⋎R(0 /⋎Z 1) *⋎R real 1⌝, ⓩ~⋎R(0 /⋎Z 1) *⋎R ~⋎R(real 1)⌝,
	ⓩ(0 /⋎Z 1) *⋎R (0 /⋎Z 1)⌝, ⓩ(0 /⋎Z 1) *⋎R ~⋎R(0 /⋎Z 1)⌝, ⓩ~⋎R(0 /⋎Z 1) *⋎R (0 /⋎Z 1)⌝, ⓩ~⋎R(0 /⋎Z 1) *⋎R ~⋎R(0 /⋎Z 1)⌝,
	ⓩ(1 /⋎Z 1) *⋎R (1 /⋎Z 1)⌝, ⓩ(1 /⋎Z 1) *⋎R ~⋎R(1 /⋎Z 1)⌝, ⓩ~⋎R(1 /⋎Z 1) *⋎R (1 /⋎Z 1)⌝, ⓩ~⋎R(1 /⋎Z 1) *⋎R ~⋎R(1 /⋎Z 1)⌝,
	ⓩ(2 /⋎Z 3) *⋎R (3 /⋎Z 4)⌝, ⓩ(2 /⋎Z 3) *⋎R ~⋎R(3 /⋎Z 4)⌝, ⓩ~⋎R(2 /⋎Z 3) *⋎R (3 /⋎Z 4)⌝, ⓩ~⋎R(2 /⋎Z 3) *⋎R ~⋎R(3 /⋎Z 4)⌝
];
=TEX
=SML
store_mt_results
(arith_batch "3.15.3" z_ℝ_eval_conv)
[
	ⓩreal 1  /⋎R  real 1⌝, ⓩreal 1  /⋎R  ~⋎R(real 1)⌝, ⓩ~⋎R(real 1)  /⋎R  real 1⌝, ⓩ~⋎R(real 1)  /⋎R  ~⋎R(real 1)⌝,
	ⓩreal 1  /⋎R  real 7⌝, ⓩreal 1  /⋎R  ~⋎R(real 7)⌝, ⓩ~⋎R(real 1)  /⋎R  real 7⌝, ⓩ~⋎R(real 1)  /⋎R  ~⋎R(real 7)⌝,
	ⓩreal 3 /⋎R real 7⌝, ⓩreal 3 /⋎R ~⋎R(real 7)⌝, ⓩ~⋎R(real 3) /⋎R real 7⌝, ⓩ~⋎R(real 3) /⋎R ~⋎R(real 7)⌝,
	ⓩ(0 /⋎Z 1) /⋎R real 1⌝, ⓩ(0 /⋎Z 1) /⋎R ~⋎R(real 1)⌝, ⓩ~⋎R(0 /⋎Z 1) /⋎R real 1⌝, ⓩ~⋎R(0 /⋎Z 1) /⋎R ~⋎R(real 1)⌝,
	ⓩ(1 /⋎Z 1) /⋎R (1 /⋎Z 1)⌝, ⓩ(1 /⋎Z 1)  /⋎R  ~⋎R(1 /⋎Z 1)⌝, ⓩ~⋎R(1 /⋎Z 1)  /⋎R  (1 /⋎Z 1)⌝, ⓩ~⋎R(1 /⋎Z 1)  /⋎R  ~⋎R(1 /⋎Z 1)⌝,
	ⓩ(2 /⋎Z 3)  /⋎R  (3 /⋎Z 4)⌝, ⓩ(2 /⋎Z 3)  /⋎R  ~⋎R(3 /⋎Z 4)⌝, ⓩ~⋎R(2 /⋎Z 3)  /⋎R  (3 /⋎Z 4)⌝, ⓩ~⋎R(2 /⋎Z 3)  /⋎R  ~⋎R(3 /⋎Z 4)⌝
];
=TEX
=SML
store_mt_results
(arith_batch "3.15.4" z_ℝ_eval_conv)
[
	ⓩreal 1 +⋎R real 2 *⋎R (1 /⋎Z 4 -⋎R real 99  /⋎R  real 2) +⋎R abs⋎R (1 /⋎Z 2)  /⋎R  real 27⌝,
	ⓩreal 1  /⋎R  real 2 *⋎R (1 /⋎Z 4 -⋎R real 99  /⋎R  real 2) +⋎R ~⋎R(~⋎R(~⋎R (1 /⋎Z 2)))  /⋎R  real 27⌝
];
=TEX
=TEX
\section{PROOF CONTEXT}
=TEX
=SML
set_merge_pcs["z_sets_alg", "'z_reals"];
store_mt_results
(arith_batch "6.1" (rewrite_conv[]))
[
	ⓩ(1/⋎Z 2) +⋎R (3/⋎Z 4)⌝,  ⓩ(1/⋎Z 2) +⋎R ~⋎R(3/⋎Z 4)⌝, ⓩ~⋎R(1/⋎Z 2) +⋎R (3/⋎Z 4 )⌝, ⓩ~⋎R(1/⋎Z 2) +⋎R ~⋎R(3/⋎Z 4)⌝,
	ⓩ(real 2) +⋎R (3/⋎Z 9)⌝,  ⓩ(real 2) +⋎R ~⋎R(3/⋎Z 9)⌝, ⓩ~⋎R(real 2) +⋎R (3/⋎Z 9)⌝, ⓩ~⋎R(real 2) +⋎R ~⋎R(3/⋎Z 9)⌝,
	ⓩ(real 2) *⋎R (3/⋎Z 9)⌝,  ⓩ(real 2) *⋎R ~⋎R(3/⋎Z 9)⌝, ⓩ~⋎R(real 2) *⋎R (3/⋎Z 9)⌝, ⓩ~⋎R(real 2) *⋎R ~⋎R(3/⋎Z 9)⌝,
	ⓩ(real 2) /⋎R (3/⋎Z 9)⌝,  ⓩ(real 2) /⋎R ~⋎R(3/⋎Z 9)⌝, ⓩ~⋎R(real 2) /⋎R (3/⋎Z 9)⌝, ⓩ~⋎R(real 2) /⋎R ~⋎R(3/⋎Z 9)⌝
];
=TEX
=SML
store_mt_results
(pred_batch "6.2" (rewrite_conv[]))
[
	ⓩ1/⋎Z 2 +⋎R 3/⋎Z 4 >⋎R 3/⋎Z 4⌝, ⓩ~⋎R(1/⋎Z 2) <⋎R ~⋎R(1/⋎Z 2) +⋎R 3/⋎Z 4⌝, ⓩx +⋎R y = y +⋎R x⌝,
	ⓩx ≤⋎R x⌝, ⓩa +⋎R b ≥⋎R b +⋎R a⌝, ⓩabs⋎R(1/⋎Z 2) = real 1 /⋎R (2/⋎Z 1)⌝,
	ⓩx >⋎R x⌝, ⓩa +⋎R b >⋎R b +⋎R a⌝, ⓩabs⋎R(1/⋎Z 2) <⋎R real 1 /⋎R (2/⋎Z 1)⌝
];
=TEX
\section{COMPUTATIONAL CONVERSIONS (ERROR CASES)}
=TEX
Conversions to HOL literals:
=SML
store_mt_results
mt_run_fail
[
	("7.1.1", z_ℝ_lit_conv, ⓩtrue⌝, gen_fail_msg "z_ℝ_lit_conv" 117001 ["ⓩtrue⌝"])
];
=TEX
Conversions to HOL literals:
=SML
store_mt_results
mt_run_fail
[
	("7.2.1", z_ℝ_lit_conv1, ⌜true⌝, gen_fail_msg "z_ℝ_lit_conv1" 117002 ["ⓩtrue⌝"])
];
=TEX
Normalisation of literals:
=SML
store_mt_results
mt_run_fail
[
	("7.3.1", z_ℝ_lit_norm_conv, ⓩtrue⌝,  gen_fail_msg "z_ℝ_lit_norm_conv" 117001 ["ⓩtrue⌝"])
];
=TEX
Dyadic predicates (one of each):
=SML
store_mt_results
mt_run_fail
[
	("7.4.1", z_ℝ_less_conv, ⓩtrue⌝, gen_fail_msg "z_ℝ_less_conv" 117003 ["ⓩtrue⌝", "ⓩx <⋎R y⌝"]),
	("7.4.2", z_ℝ_≤_conv, ⓩtrue⌝, gen_fail_msg "z_ℝ_≤_conv" 117003 ["ⓩtrue⌝", "ⓩx ≤⋎R y⌝"])
,
	("7.4.3", z_ℝ_greater_conv, ⓩtrue⌝, gen_fail_msg "z_ℝ_greater_conv" 117105 ["ⓩtrue⌝"])
,
	("7.4.4", z_ℝ_≥_conv, ⓩtrue⌝, gen_fail_msg "z_ℝ_≥_conv" 117102 ["ⓩtrue⌝"])
,
	("7.4.5", z_ℝ_eq_conv, ⓩtrue⌝, gen_fail_msg "z_ℝ_eq_conv" 117003 ["ⓩtrue⌝", "ⓩx = y⌝"])
];
=TEX
Dyadic arithmetic operators (one of each):
=SML
store_mt_results
mt_run_fail
[
	("7.5.1", z_ℝ_plus_conv, ⓩtrue⌝, gen_fail_msg "z_ℝ_plus_conv" 117003 ["ⓩtrue⌝", "ⓩx +⋎R y⌝"]),
	("7.5.2", z_ℝ_subtract_conv, ⓩtrue⌝, gen_fail_msg "z_ℝ_subtract_conv" 117111 ["ⓩtrue⌝"]),
	("7.5.3", z_ℝ_times_conv, ⓩtrue⌝, gen_fail_msg "z_ℝ_times_conv" 117003 ["ⓩtrue⌝", "ⓩx *⋎R y⌝"]),
	("7.5.4", z_ℝ_over_conv, ⓩtrue⌝, gen_fail_msg "z_ℝ_over_conv" 117003 ["ⓩtrue⌝", "ⓩx /⋎R y⌝"]),
	("7.5.5", z_ℝ_ℤ_exp_conv, ⓩtrue⌝, gen_fail_msg "z_ℝ_ℤ_exp_conv" 117005 ["ⓩtrue⌝"])
];
=TEX
Monadic arithmetic operators (one of each):
=SML
store_mt_results
mt_run_fail
[
	("7.6.1", z_ℝ_minus_conv, ⓩtrue⌝, gen_fail_msg "z_ℝ_minus_conv" 117107 ["ⓩtrue⌝"]),
	("7.6.2", z_ℝ_abs_conv, ⓩtrue⌝, gen_fail_msg "z_ℝ_abs_conv" 117004 ["ⓩtrue⌝", "ⓩabs⋎R x⌝"])
];
=TEX
\section{LINEAR ARITHMETIC}
=TEX
This function tests that a tactic proves a goal:
=SML
fun ⦏tac_solve⦎ tac (seqasms, goal) = (
	dest_thm (tac_proof ((seqasms,goal),tac))
	=#
	(seqasms, goal)
);
=SML
set_merge_pcs["z_ℝ_lin_arith"];
store_mt_results
mt_run [
	("8.1.1",
	tac_solve (prove_tac[]),
	([], ⓩreal 0 <⋎R y ⇒ (1 /⋎Z 2) *⋎R y <⋎R (3 /⋎Z 2) *⋎R y⌝), true),
	("8.1.2",
	tac_solve (prove_tac[]),
	([], ⓩx <⋎R y ⇒ x <⋎R (x+⋎R y) /⋎R real 2 ∧ (x+⋎R y) /⋎R real 2 <⋎R y⌝), true),
	("8.1.3",
	tac_solve (prove_tac[]),
	([], ⓩy >⋎R x ⇒ x ≤⋎R (x+⋎R y) /⋎R real 2 ∧ y ≥⋎R (x+⋎R y) /⋎R real 2⌝), true),
	("8.1.4",
	tac_solve (prove_tac[]),
	([], ⓩa *⋎R a ≥⋎R real 0 ∧ b *⋎R b ≥⋎R real 0 ⇒ (a +⋎R b) *⋎R (a +⋎R b) ≥⋎R real 2 *⋎R a *⋎R b⌝), true)
];
=TEX
=SML
set_merge_pcs["z_ℝ_lin_arith"];
store_mt_results
mt_run [
	("8.1.5",
	tac_solve (prove_tac[]),
	([], ⓩa *⋎R a ≥⋎R real 0 ∧ b *⋎R b ≥⋎R 0.0 ⇒ (a +⋎R b) *⋎R (a +⋎R b) ≥⋎R 2.0 *⋎R a *⋎R b⌝), true),
	("8.1.6",
	tac_solve (prove_tac[]),
	([], ⓩ1.414 <⋎R 3.14159⌝), true),
	("8.1.7",
	tac_solve (prove_tac[]),
	([], ⓩ0.1414e1 <⋎R 0.314159e1⌝), true),
	("8.1.8",
	tac_solve (prove_tac[]),
	([], ⓩ0.1414e1 >⋎R 0.314159e~1⌝), true)
];
=TEX
\section{ClawZ EXAMPLES}
=TEX
=SML
set_merge_pcs["z_sets_alg", "'z_reals"];
val alfs_tm = ⓩ(real 2 *⋎R real 10 ^⋎Z 1
                     +⋎R ~⋎R (((real 5 +⋎R ~⋎R (real 2 *⋎R real 10 ^⋎Z 1))
                             *⋎R real 1313 *⋎R real 10 ^⋎Z (~ 3))
                           /⋎R (real 585 *⋎R real 10 ^⋎Z (~ 3)
                               +⋎R ~⋎R (real 1313 *⋎R real 10 ^⋎Z (~ 3)))))
                   +⋎R (((real 5 +⋎R ~⋎R (real 2 *⋎R real 10 ^⋎Z 1))
                           *⋎R (real 585 *⋎R real 10 ^⋎Z (~ 3))
                               *⋎R real 1313 *⋎R real 10 ^⋎Z (~ 3))
                         /⋎R (real 585 *⋎R real 10 ^⋎Z (~ 3)
                             +⋎R ~⋎R (real 1313 *⋎R real 10 ^⋎Z (~ 3))))
                       /⋎R real 585 *⋎R real 10 ^⋎Z (~ 3)
               = real 2 *⋎R real 10 ^⋎Z 1
             ∧ (real 2 *⋎R real 10 ^⋎Z 1
                     +⋎R ~⋎R (((real 5 +⋎R ~⋎R (real 2 *⋎R real 10 ^⋎Z 1))
                             *⋎R real 1313 *⋎R real 10 ^⋎Z (~ 3))
                           /⋎R (real 585 *⋎R real 10 ^⋎Z (~ 3)
                               +⋎R ~⋎R (real 1313 *⋎R real 10 ^⋎Z (~ 3)))))
                   +⋎R (((real 5 +⋎R ~⋎R (real 2 *⋎R real 10 ^⋎Z 1))
                           *⋎R (real 585 *⋎R real 10 ^⋎Z (~ 3))
                               *⋎R real 1313 *⋎R real 10 ^⋎Z (~ 3))
                         /⋎R (real 585 *⋎R real 10 ^⋎Z (~ 3)
                             +⋎R ~⋎R (real 1313 *⋎R real 10 ^⋎Z (~ 3))))
                       /⋎R real 1313 *⋎R real 10 ^⋎Z (~ 3)
               = real 5⌝;
store_mt_results
(pred_batch "9.1" ((MAP_C z_ℝ_ℤ_exp_conv) THEN_C rewrite_conv[]))
[
	alfs_tm
];
=TEX
\section{FIXES AND ENHANCEMENTS}
=TEX
=SML
store_mt_results
(mt_runf (fn (thm, tm) => is_nil(asms thm) andalso concl thm =$ tm))[
	("10.1.1", PC_C1 "'z_reals" rewrite_conv[],
		ⓩ2 /⋎Z 4⌝, ⓩ2 /⋎Z 4 = 1 /⋎Z 2⌝ ),
	("10.1.2", MERGE_PCS_C1 ["z_sets_alg", "'z_numbers", "'z_reals"] rewrite_conv[get_spec⌜Z'Float⌝],
		ⓩ1.2⌝, ⓩ1.2 = 6 /⋎Z 5⌝ )
];
=TEX
\section{END OF TESTS}
=SML
diag_string(summarize_mt_results());
=TEX
\end{document}
z_ℝ_minus_convⓩreal (~x)⌝;
rewrite_conv[]ⓩreal (~x)⌝;
z_ℝ_eval_convⓩreal 1 +⋎R 2/⋎Z 3⌝;
z_ℝ_eval_convⓩreal (~1) +⋎R 2/⋎Z 3⌝;
z_ℝ_eval_convⓩreal (~1) ⌝;





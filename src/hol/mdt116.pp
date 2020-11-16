=IGN
********************************************************************************
mdt116.doc: this file is part of the PPHol system

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

\def\Title{ Module Test: Theory of Real Numbers }

\def\Abstract{\begin{center}
{\bf Abstract}\par\parbox{0.7\hsize}
{\small This document gives the module tests for the theory of real numbers in \ProductHOL.}
\end{center}}

\def\Reference{LEMMA1/HOL/MDT114}

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
\item[Issue 1.1 (2000/12/05)] First draft.
\item[Issues 1.2 (2001/06/28)--1.5 (2001/07/02)] Added more comprehensive tests for the ML code.
\item[Issue 1.6 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.7 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.8 (2005/05/07)] HOL now supports left-associative operators.
\item[Issue 1.9 (2005/06/01)] Added tests for fixes to ℝ\_anf\_conv.
\item[Issue 1.10 (2006/04/19)] Added tests for exponentiation with integer exponents.
\item[Issue 1.11 (2006/05/08)] Added tests for enhancement to proof context.
\item[Issues 1.12 (2006/12/02)--1.14 (2006/12/09)] Added tests for floating point literals.
\item[Issue 1.15 (2007/03/03)] Added tests for support for maxima and minima of lists.
\item[Issue 1.16 (2007/08/15)] Added tests for term ordering function.
\item[Issue 1.17 (2007/09/01)] Added tests for quantifier elimination procedure.
\item[Issues 1.18 (2007/09/07),1.19 (2007/09/09)] Added tests for fix to term ordering.
\item[Issue 1.20 (2012/05/08)--1.23 (2012/05/10)] Allowed for and added new tests for changes to arithmetic normalisation and term ordering.
\item[Issue 1.24 (2013/04/27)] Tests for fix to arithmetic normalisation.
\item[Issue 1.25 (2013/07/28)] Tests for further fixes to arithmetic normalisation.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.
\item[2015/04/15]
Now uses new date and version macros from doctex

\item[2017/03/05]
Fixed test that assumed default integers were not fixed magnitude.
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
theory of real numbers
required by \cite{DS/FMU/IED/DTD116} and
implemented in \cite{DS/FMU/IED/IMP116}.
\subsection{Introduction}
\subsubsection{Purpose and Background}
See \cite{DS/FMU/IED/DTD040}.
\subsubsection{Dependencies}
The test material depends on \cite{DS/FMU/IED/DTD013},
\cite{DS/FMU/IED/DTD035} and \cite{DS/FMU/IED/IMP114}.

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
\item Test the induction tactic
\item Test the computational conversions
\item Test the arithmetic normalisation conversion
\item Test the general purpose proof context
\item Test the linear arithmetic decision procedure
\item Regression tests for any fixes or enhancements ad lib
\end{enumerate}

\section{CHECK THE THEORY DESIGN}
=SML
use_file "dtd116.tch";
store_mt_results mt_run[("theory design for theory of reals",
	theory_check_success,
	(),
	true)];
=TEX
\section{UTILITIES}
=TEX
The following can be used to check a conversion for a specific known result.
If the conversion delivers a theorem with assumptions, or with a conclusion that
is not an equation with the given term as the lhs, it fails. Otherwise it returns
the rhs of the equation.
=SML
fun conv_rhs (conv : CONV) (tm : TERM) : TERM = (
	let	val thm = conv tm;
		val (lhs, rhs) = dest_eq(concl thm);
	in	if is_nil (asms thm) andalso tm =$ lhs
		then rhs
		else fail "conv_rhs" 7061 []
	end
);
=TEX
\section{SYNTAX FUNCTIONS}
Dyadic constructor functions:
=SML
store_mt_results
(mt_runf (op =$))
[
	("2.1.1", mk_ℝ_less, (⌜ℕℝ 0⌝, ⌜ℕℝ 1⌝), ⌜ℕℝ 0 <⋎R ℕℝ 1⌝),
	("2.1.2", mk_ℝ_≤, (⌜ℕℝ 0⌝, ⌜ℕℝ 1⌝), ⌜ℕℝ 0 ≤⋎R ℕℝ 1⌝),
	("2.1.3", mk_ℝ_greater, (⌜ℕℝ 0⌝, ⌜ℕℝ 1⌝), ⌜ℕℝ 0 >⋎R ℕℝ 1⌝),
	("2.1.4", mk_ℝ_≥, (⌜ℕℝ 0⌝, ⌜ℕℝ 1⌝), ⌜ℕℝ 0 ≥⋎R ℕℝ 1⌝),
	("2.1.5", mk_ℝ_plus, (⌜ℕℝ 0⌝, ⌜ℕℝ 1⌝), ⌜ℕℝ 0 +⋎R ℕℝ 1⌝),
	("2.1.6", mk_ℝ_subtract, (⌜ℕℝ 0⌝, ⌜ℕℝ 1⌝), ⌜ℕℝ 0 -⋎R ℕℝ 1⌝),
	("2.1.7", mk_ℝ_times, (⌜ℕℝ 0⌝, ⌜ℕℝ 1⌝), ⌜ℕℝ 0 *⋎R ℕℝ 1⌝),
	("2.1.8", mk_ℝ_over, (⌜ℕℝ 0⌝, ⌜ℕℝ 1⌝), ⌜ℕℝ 0 /⋎R ℕℝ 1⌝),
	("2.1.9", mk_ℝ_frac, (⌜0⌝, ⌜1⌝), ⌜0 /⋎N 1⌝),
	("2.1.10", mk_ℝ_ℕ_exp, (⌜ℕℝ 0⌝, ⌜1⌝), ⌜ℕℝ 0 ^⋎N 1⌝),
	("2.1.11", mk_ℝ_ℤ_exp, (⌜ℕℝ 0⌝, ⌜ℕℤ 1⌝), ⌜ℕℝ 0 ^⋎Z ℕℤ 1⌝)
];
=TEX
Monadic constructor functions:
=SML
store_mt_results
(mt_runf (op =$))
[
	("2.2.1", mk_ℝ_minus, ⌜2/3⌝, ⌜~⋎R (2/3)⌝),
	("2.2.2", mk_ℝ_abs, ⌜2/3⌝, ⌜Abs⋎R (2/3)⌝),
	("2.2.3", mk_ℝ_recip, ⌜2/3⌝, ⌜(2/3)⋏-⋏1⌝),
	("2.2.4", mk_ℕℝ, ⌜2⌝, ⌜ℕℝ 2⌝),
	("2.2.5", mk_ℝ_max, ⌜[2/3]⌝, ⌜Max⋎R [2/3]⌝),
	("2.2.6", mk_ℝ_min, ⌜[2/3]⌝, ⌜Min⋎R [2/3]⌝)
];
=TEX
Dyadic destructor functions:
=SML
store_mt_results
(mt_runf (fn ((a, b), (c, d)) => a =$ c andalso b =$ d))
[
	("2.3.1", dest_ℝ_less, ⌜ℕℝ 0 <⋎R ℕℝ 1⌝, (⌜ℕℝ 0⌝, ⌜ℕℝ 1⌝)),
	("2.3.2", dest_ℝ_≤, ⌜ℕℝ 0 ≤⋎R ℕℝ 1⌝, (⌜ℕℝ 0⌝, ⌜ℕℝ 1⌝)),
	("2.3.3", dest_ℝ_greater, ⌜ℕℝ 0 >⋎R ℕℝ 1⌝, (⌜ℕℝ 0⌝, ⌜ℕℝ 1⌝)),
	("2.3.4", dest_ℝ_≥, ⌜ℕℝ 0 ≥⋎R ℕℝ 1⌝, (⌜ℕℝ 0⌝, ⌜ℕℝ 1⌝)),
	("2.3.5", dest_ℝ_plus, ⌜ℕℝ 0 +⋎R ℕℝ 1⌝, (⌜ℕℝ 0⌝, ⌜ℕℝ 1⌝)),
	("2.3.6", dest_ℝ_subtract, ⌜ℕℝ 0 -⋎R ℕℝ 1⌝, (⌜ℕℝ 0⌝, ⌜ℕℝ 1⌝)),
	("2.3.7", dest_ℝ_times, ⌜ℕℝ 0 *⋎R ℕℝ 1⌝, (⌜ℕℝ 0⌝, ⌜ℕℝ 1⌝)),
	("2.3.8", dest_ℝ_over, ⌜ℕℝ 0 /⋎R ℕℝ 1⌝, (⌜ℕℝ 0⌝, ⌜ℕℝ 1⌝)),
	("2.3.9", dest_ℝ_frac, ⌜0 /⋎N 1⌝, (⌜0⌝, ⌜1⌝)),
	("2.3.10", dest_ℝ_ℕ_exp, ⌜ℕℝ 0 ^⋎N 1⌝, (⌜ℕℝ 0⌝, ⌜1⌝)),
	("2.3.11", dest_ℝ_ℤ_exp, ⌜ℕℝ 0 ^⋎Z ℕℤ 1⌝, (⌜ℕℝ 0⌝, ⌜ℕℤ 1⌝))
];
=TEX
Monadic destructor functions:
=SML
store_mt_results
(mt_runf (op =$))
[
	("2.4.1", dest_ℝ_minus, ⌜~⋎R (2/3)⌝, ⌜2/3⌝),
	("2.4.2", dest_ℝ_abs, ⌜Abs⋎R (2/3)⌝, ⌜2/3⌝),
	("2.4.3", dest_ℝ_recip, ⌜(2/3)⋏-⋏1⌝, ⌜2/3⌝),
	("2.4.4", dest_ℕℝ, ⌜ℕℝ 2⌝, ⌜2⌝),
	("2.4.5", dest_ℝ_max, ⌜Max⋎R [2/3]⌝, ⌜[2/3]⌝),
	("2.4.6", dest_ℝ_min, ⌜Min⋎R [2/3]⌝, ⌜[2/3]⌝)
];
=TEX
Discriminator functions:
=SML
store_mt_results
mt_run
[
	("2.5.1", is_ℝ_less, ⌜ℕℝ 0 <⋎R ℕℝ 1⌝, true),
	("2.5.2", is_ℝ_≤, ⌜ℕℝ 0 ≤⋎R ℕℝ 1⌝, true),
	("2.5.3", is_ℝ_greater, ⌜ℕℝ 0 >⋎R ℕℝ 1⌝, true),
	("2.5.4", is_ℝ_≥, ⌜ℕℝ 0 ≥⋎R ℕℝ 1⌝, true),
	("2.5.5", is_ℝ_plus, ⌜ℕℝ 0 +⋎R ℕℝ 1⌝, true),
	("2.5.6", is_ℝ_subtract, ⌜ℕℝ 0 -⋎R ℕℝ 1⌝, true),
	("2.5.7", is_ℝ_times, ⌜ℕℝ 0 *⋎R ℕℝ 1⌝, true),
	("2.5.8", is_ℝ_over, ⌜ℕℝ 0 /⋎R ℕℝ 1⌝, true),
	("2.5.9", is_ℝ_frac, ⌜0 /⋎N 1⌝, true),
	("2.5.10", is_ℝ_ℕ_exp, ⌜ℕℝ 0 ^⋎N 1⌝, true),
	("2.5.11", is_ℝ_minus, ⌜~⋎R (2/3)⌝, true),
	("2.5.12", is_ℝ_abs, ⌜Abs⋎R (2/3)⌝, true),
	("2.5.13", is_ℝ_recip, ⌜(2/3)⋏-⋏1⌝, true),
	("2.5.14", is_ℕℝ, ⌜ℕℝ 2⌝, true),
	("2.5.15", is_ℝ_ℤ_exp, ⌜ℕℝ 0 ^⋎Z ℕℤ 1⌝, true),
	("2.5.16", is_ℝ_max, ⌜Max⋎R [2/3]⌝, true),
	("2.5.17", is_ℝ_min, ⌜Min⋎R [2/3]⌝, true)
];
=TEX
\section{INDUCTION TACTIC}
=TEX
This function tests that a tactic proves a goal:
=SML
fun ⦏tac_solve⦎ tac (seqasms, goal) = (
	dest_thm (tac_proof ((seqasms,goal),tac))
	=#
	(seqasms, goal)
);
=SML
set_merge_pcs["basic_hol", "'ℝ"];
store_mt_results
mt_run [
	("3.1.1",
	tac_solve (
		ℝ_delta_induction_tac ⌜y:ℝ⌝
		THEN ∃_tac⌜ℕℝ 2⌝
		THEN REPEAT strip_tac
		THEN_LIST [
			∃_tac⌜ℕℝ 3⌝ THEN REPEAT strip_tac
			THEN bc_thm_tac ℝ_less_trans_thm
			THEN ∃_tac⌜ℕℝ 1⌝ THEN REPEAT strip_tac,

			bc_thm_tac ℝ_less_trans_thm
			THEN ∃_tac⌜s:ℝ⌝ THEN REPEAT strip_tac]),
	([⌜ℕℝ 1 < y⌝], ⌜ℕℝ 0 < y⌝), true)];
=TEX
\section{COMPUTATIONAL CONVERSIONS}
=TEX
Dyadic predicates (one of each):
=SML
store_mt_results
(mt_runf (fn (thm, tm) => snd(dest_eq(concl thm)) =$ tm))
[
	("4.1.1", ℝ_less_conv, ⌜ℕℝ 99 <⋎R ℕℝ 100⌝, ⌜T⌝),
	("4.1.2", ℝ_≤_conv, ⌜1/2 ≤⋎R 1/2⌝, ⌜T⌝),
	("4.1.3", ℝ_greater_conv THEN_C ℝ_less_conv, ⌜~(4/5) >⋎R ~(4/3)⌝, ⌜T⌝),
	("4.1.4", ℝ_≥_conv THEN_C ℝ_≤_conv, ⌜7/8 ≥⋎R 6/8⌝, ⌜T⌝),
	("4.1.5", ℝ_less_conv, ⌜ℕℝ 99 <⋎R ℕℝ 10⌝, ⌜F⌝),
	("4.1.6", ℝ_≤_conv, ⌜(1/2) ≤⋎R 1/4⌝, ⌜F⌝),
	("4.1.7", ℝ_greater_conv THEN_C ℝ_less_conv, ⌜~(4/3) >⋎R ~(4/5)⌝, ⌜F⌝),
	("4.1.8", ℝ_≥_conv THEN_C ℝ_≤_conv, ⌜6/8 ≥⋎R 7/8⌝, ⌜F⌝)
];
=TEX
Dyadic arithmetic operators (one of each):
=SML
store_mt_results
(mt_runf (fn (thm, tm) => snd(dest_eq(concl thm)) =$ tm))
[
	("4.2.1", ℝ_plus_conv, ⌜2/6 +⋎R 1/6⌝, ⌜1/2⌝),
	("4.2.2", ℝ_subtract_conv THEN_C ℝ_plus_conv, ⌜1/3 -⋎R 1/6⌝, ⌜1/6⌝),
	("4.2.3", ℝ_times_conv, ⌜ℕℝ 0 *⋎R ℕℝ 1⌝, ⌜ℕℝ 0⌝),
	("4.2.4", ℝ_over_conv, ⌜ℕℝ 0 /⋎R ℕℝ 1⌝, ⌜ℕℝ 0⌝),
	("4.2.5", ℝ_frac_norm_conv, ⌜1 /⋎N 1⌝, ⌜ℕℝ 1⌝),
	("4.2.6", ℝ_ℕ_exp_conv, ⌜ℕℝ 0 ^⋎N 1⌝, ⌜ℕℝ 0⌝),
	("4.2.7", ℝ_ℤ_exp_conv, ⌜ℕℝ 0 ^⋎Z ℕℤ 1⌝, ⌜ℕℝ 0 ^⋎N 1⌝),
	("4.2.8", ℝ_ℤ_exp_conv, ⌜ℕℝ 0 ^⋎Z ~(ℕℤ 1)⌝, ⌜(ℕℝ 0 ^⋎N 1)⋏-⋏1⌝)
];
=TEX
Monadic arithmetic operators (a few of each):
=SML
store_mt_results
(mt_runf (fn (thm, tm) => snd(dest_eq(concl thm)) =$ tm))
[
	("4.3.1", ℝ_abs_conv, ⌜Abs⋎R (~(2/3))⌝, ⌜2/3⌝),
	("4.3.2", ℝ_abs_conv, ⌜Abs⋎R ((2/3))⌝, ⌜2/3⌝),
	("4.3.3", ℝ_recip_conv, ⌜(2/3)⋏-⋏1⌝, ⌜3/2⌝),
	("4.3.4", ℝ_recip_conv, ⌜(~(2/3))⋏-⋏1⌝, ⌜~(3/2)⌝),
	("4.3.5", ℝ_minus_conv, ⌜~(~(2/3))⌝, ⌜2/3⌝),
	("4.3.6", ℝ_minus_conv, ⌜~(~(~(2/3)))⌝, ⌜~(2/3)⌝),
	("4.3.7", ℝ_minus_conv, ⌜~(~(~(~(4/6))))⌝, ⌜2/3⌝),
	("4.3.8", ℝ_minus_conv, ⌜~(~(~(~(ℕℝ 0))))⌝, ⌜ℕℝ 0⌝),
	("4.3.9", ℝ_minus_conv, ⌜~(~(~(ℕℝ 0)))⌝, ⌜ℕℝ 0⌝)
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
	let	val (tm1, pos) = (dest_ℝ_minus tm, false) handle Fail _ => (tm, true);
	in	let	val i = dest_ℕ(dest_ℕℝ tm1);
		in	pos orelse i <> zero
		end	handle Fail _ =>
		let	val (num, den) = (dest_ℕ ** dest_ℕ) (dest_ℝ_frac tm1);
		in	num <> zero andalso den <> one andalso gcd num den = one
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
(arith_batch "4.5.1" ℝ_plus_conv)
[
⌜ℕℝ 0 + ℕℝ 0⌝, ⌜ℕℝ 0 + ~(ℕℝ 0)⌝, ⌜~(ℕℝ 0) + ℕℝ 0⌝, ⌜~(ℕℝ 0) + ~(ℕℝ 0)⌝,
⌜ℕℝ 1 + ℕℝ 0⌝, ⌜ℕℝ 1 + ~(ℕℝ 0)⌝, ⌜~(ℕℝ 1) + ℕℝ 0⌝, ⌜~(ℕℝ 1) + ~(ℕℝ 0)⌝,
⌜ℕℝ 0 + ℕℝ 1⌝, ⌜ℕℝ 0 + ~(ℕℝ 1)⌝, ⌜~(ℕℝ 0) + ℕℝ 1⌝, ⌜~(ℕℝ 0) + ~(ℕℝ 1)⌝,
⌜ℕℝ 1 + ℕℝ 1⌝, ⌜ℕℝ 1 + ~(ℕℝ 1)⌝, ⌜~(ℕℝ 1) + ℕℝ 1⌝, ⌜~(ℕℝ 1) + ~(ℕℝ 1)⌝
];
=TEX
=SML
store_mt_results
(arith_batch "4.5.2"  ℝ_plus_conv)
[
⌜0/1 + 0/1⌝, ⌜0/1 + ~(0/1)⌝, ⌜~(0/1) + 0/1⌝, ⌜~(0/1) + ~(0/1)⌝,
⌜1/1 + 0/1⌝, ⌜1/1 + ~(0/1)⌝, ⌜~(1/1) + 0/1⌝, ⌜~(1/1) + ~(0/1)⌝,
⌜0/1 + 1/1⌝, ⌜0/1 + ~(1/1)⌝, ⌜~(0/1) + 1/1⌝, ⌜~(0/1) + ~(1/1)⌝,
⌜1/1 + 1/1⌝, ⌜1/1 + ~(1/1)⌝, ⌜~(1/1) + 1/1⌝, ⌜~(1/1) + ~(1/1)⌝
];
=TEX
=SML
store_mt_results
(arith_batch "4.5.3" ℝ_plus_conv)
[
⌜(1/2) + ℕℝ 0⌝, ⌜(1/2) + ~(ℕℝ 0)⌝, ⌜~(1/2) + ℕℝ 0⌝, ⌜~(1/2) + ~(ℕℝ 0)⌝,
⌜ℕℝ 0 + (1/2)⌝, ⌜ℕℝ 0 + ~(1/2)⌝, ⌜~(ℕℝ 0) + 1/2⌝, ⌜~(ℕℝ 0) + ~(1/2)⌝,
⌜(1/2) + ℕℝ 1⌝, ⌜(1/2) + ~(ℕℝ 1)⌝, ⌜~(1/2) + ℕℝ 1⌝, ⌜~(1/2) + ~(ℕℝ 1)⌝,
⌜ℕℝ 1 + (1/2)⌝, ⌜ℕℝ 1 + ~(1/2)⌝, ⌜~(ℕℝ 1) + 1/2⌝, ⌜~(ℕℝ 1) + ~(1/2)⌝,
⌜(1/2) + ℕℝ 2⌝, ⌜(1/2) + ~(ℕℝ 2)⌝, ⌜~(1/2) + ℕℝ 2⌝, ⌜~(1/2) + ~(ℕℝ 2)⌝,
⌜ℕℝ 2 + (1/2)⌝, ⌜ℕℝ 2 + ~(1/2)⌝, ⌜~(ℕℝ 2) + 1/2⌝, ⌜~(ℕℝ 2) + ~(1/2)⌝,
⌜(1/2) + ℕℝ 45⌝, ⌜(1/2) + ~(ℕℝ 45)⌝, ⌜~(1/2) + ℕℝ 45⌝, ⌜~(1/2) + ~(ℕℝ 45)⌝,
⌜ℕℝ 45 + (1/2)⌝, ⌜ℕℝ 45 + ~(1/2)⌝, ⌜~(ℕℝ 45) + 1/2⌝, ⌜~(ℕℝ 45) + ~(1/2)⌝
];
=TEX
=SML
store_mt_results
(arith_batch "4.5.4" ℝ_plus_conv)
[
⌜(44/14) + ℕℝ 0⌝, ⌜(44/14) + ~(ℕℝ 0)⌝, ⌜~(44/14) + ℕℝ 0⌝, ⌜~(44/14) + ~(ℕℝ 0)⌝,
⌜ℕℝ 0 + (44/14)⌝, ⌜ℕℝ 0 + ~(44/14)⌝, ⌜~(ℕℝ 0) + 44/14⌝, ⌜~(ℕℝ 0) + ~(44/14)⌝,
⌜(44/14) + ℕℝ 1⌝, ⌜(44/14) + ~(ℕℝ 1)⌝, ⌜~(44/14) + ℕℝ 1⌝, ⌜~(44/14) + ~(ℕℝ 1)⌝,
⌜ℕℝ 1 + (44/14)⌝, ⌜ℕℝ 1 + ~(44/14)⌝, ⌜~(ℕℝ 1) + 44/14⌝, ⌜~(ℕℝ 1) + ~(44/14)⌝,
⌜(44/14) + ℕℝ 2⌝, ⌜(44/14) + ~(ℕℝ 2)⌝, ⌜~(44/14) + ℕℝ 2⌝, ⌜~(44/14) + ~(ℕℝ 2)⌝,
⌜ℕℝ 2 + (44/14)⌝, ⌜ℕℝ 2 + ~(44/14)⌝, ⌜~(ℕℝ 2) + 44/14⌝, ⌜~(ℕℝ 2) + ~(44/14)⌝,
⌜(44/14) + ℕℝ 101⌝, ⌜(44/14) + ~(ℕℝ 101)⌝, ⌜~(44/14) + ℕℝ 101⌝, ⌜~(44/14) + ~(ℕℝ 101)⌝,
⌜ℕℝ 101 + (44/14)⌝, ⌜ℕℝ 101 + ~(44/14)⌝, ⌜~(ℕℝ 101) + 44/14⌝, ⌜~(ℕℝ 101) + ~(44/14)⌝
];
=TEX
=SML
store_mt_results
(arith_batch "4.5.5" ℝ_plus_conv)
[
⌜(22/7) + (1/3)⌝, ⌜(22/7) + ~(1/3)⌝, ⌜~(22/7) + (1/3)⌝, ⌜~(22/7) + ~(1/3)⌝,
⌜(44/14) + (1/3)⌝, ⌜(44/14) + ~(1/3)⌝, ⌜~(44/14) + (1/3)⌝, ⌜~(44/14) + ~(1/3)⌝,
⌜(22/7) + (15/45)⌝, ⌜(22/7) + ~(15/45)⌝, ⌜~(22/7) + (15/45)⌝, ⌜~(22/7) + ~(15/45)⌝,
⌜(44/14) + (15/45)⌝, ⌜(44/14) + ~(15/45)⌝, ⌜~(44/14) + (15/45)⌝, ⌜~(44/14) + ~(15/45)⌝
];
=TEX
=SML
store_mt_results
(arith_batch "4.6.1" ℝ_times_conv)
[
⌜ℕℝ 0 * ℕℝ 0⌝, ⌜ℕℝ 0 * ~(ℕℝ 0)⌝, ⌜~(ℕℝ 0) * ℕℝ 0⌝, ⌜~(ℕℝ 0) * ~(ℕℝ 0)⌝,
⌜ℕℝ 1 * ℕℝ 0⌝, ⌜ℕℝ 1 * ~(ℕℝ 0)⌝, ⌜~(ℕℝ 1) * ℕℝ 0⌝, ⌜~(ℕℝ 1) * ~(ℕℝ 0)⌝,
⌜ℕℝ 0 * ℕℝ 1⌝, ⌜ℕℝ 0 * ~(ℕℝ 1)⌝, ⌜~(ℕℝ 0) * ℕℝ 1⌝, ⌜~(ℕℝ 0) * ~(ℕℝ 1)⌝,
⌜ℕℝ 1 * ℕℝ 1⌝, ⌜ℕℝ 1 * ~(ℕℝ 1)⌝, ⌜~(ℕℝ 1) * ℕℝ 1⌝, ⌜~(ℕℝ 1) * ~(ℕℝ 1)⌝
];
=TEX
=SML
store_mt_results
(arith_batch "4.6.2" ℝ_times_conv)
[
⌜0/1 * 0/1⌝, ⌜0/1 * ~(0/1)⌝, ⌜~(0/1) * 0/1⌝, ⌜~(0/1) * ~(0/1)⌝,
⌜1/1 * 0/1⌝, ⌜1/1 * ~(0/1)⌝, ⌜~(1/1) * 0/1⌝, ⌜~(1/1) * ~(0/1)⌝,
⌜0/1 * 1/1⌝, ⌜0/1 * ~(1/1)⌝, ⌜~(0/1) * 1/1⌝, ⌜~(0/1) * ~(1/1)⌝,
⌜1/1 * 1/1⌝, ⌜1/1 * ~(1/1)⌝, ⌜~(1/1) * 1/1⌝, ⌜~(1/1) * ~(1/1)⌝
];
=TEX
=SML
store_mt_results
(arith_batch "4.6.3" ℝ_times_conv)
[
⌜(1/2) * ℕℝ 0⌝, ⌜(1/2) * ~(ℕℝ 0)⌝, ⌜~(1/2) * ℕℝ 0⌝, ⌜~(1/2) * ~(ℕℝ 0)⌝,
⌜ℕℝ 0 * (1/2)⌝, ⌜ℕℝ 0 * ~(1/2)⌝, ⌜~(ℕℝ 0) * 1/2⌝, ⌜~(ℕℝ 0) * ~(1/2)⌝,
⌜(1/2) * ℕℝ 1⌝, ⌜(1/2) * ~(ℕℝ 1)⌝, ⌜~(1/2) * ℕℝ 1⌝, ⌜~(1/2) * ~(ℕℝ 1)⌝,
⌜ℕℝ 1 * (1/2)⌝, ⌜ℕℝ 1 * ~(1/2)⌝, ⌜~(ℕℝ 1) * 1/2⌝, ⌜~(ℕℝ 1) * ~(1/2)⌝,
⌜(1/2) * ℕℝ 2⌝, ⌜(1/2) * ~(ℕℝ 2)⌝, ⌜~(1/2) * ℕℝ 2⌝, ⌜~(1/2) * ~(ℕℝ 2)⌝,
⌜ℕℝ 2 * (1/2)⌝, ⌜ℕℝ 2 * ~(1/2)⌝, ⌜~(ℕℝ 2) * 1/2⌝, ⌜~(ℕℝ 2) * ~(1/2)⌝,
⌜(1/2) * ℕℝ 45⌝, ⌜(1/2) * ~(ℕℝ 45)⌝, ⌜~(1/2) * ℕℝ 45⌝, ⌜~(1/2) * ~(ℕℝ 45)⌝,
⌜ℕℝ 45 * (1/2)⌝, ⌜ℕℝ 45 * ~(1/2)⌝, ⌜~(ℕℝ 45) * 1/2⌝, ⌜~(ℕℝ 45) * ~(1/2)⌝
];
=TEX
=SML
store_mt_results
(arith_batch "4.6.4" ℝ_times_conv)
[
⌜(44/14) * ℕℝ 0⌝, ⌜(44/14) * ~(ℕℝ 0)⌝, ⌜~(44/14) * ℕℝ 0⌝, ⌜~(44/14) * ~(ℕℝ 0)⌝,
⌜ℕℝ 0 * (44/14)⌝, ⌜ℕℝ 0 * ~(44/14)⌝, ⌜~(ℕℝ 0) * 44/14⌝, ⌜~(ℕℝ 0) * ~(44/14)⌝,
⌜(44/14) * ℕℝ 1⌝, ⌜(44/14) * ~(ℕℝ 1)⌝, ⌜~(44/14) * ℕℝ 1⌝, ⌜~(44/14) * ~(ℕℝ 1)⌝,
⌜ℕℝ 1 * (44/14)⌝, ⌜ℕℝ 1 * ~(44/14)⌝, ⌜~(ℕℝ 1) * 44/14⌝, ⌜~(ℕℝ 1) * ~(44/14)⌝,
⌜(44/14) * ℕℝ 2⌝, ⌜(44/14) * ~(ℕℝ 2)⌝, ⌜~(44/14) * ℕℝ 2⌝, ⌜~(44/14) * ~(ℕℝ 2)⌝,
⌜ℕℝ 2 * (44/14)⌝, ⌜ℕℝ 2 * ~(44/14)⌝, ⌜~(ℕℝ 2) * 44/14⌝, ⌜~(ℕℝ 2) * ~(44/14)⌝,
⌜(44/14) * ℕℝ 101⌝, ⌜(44/14) * ~(ℕℝ 101)⌝, ⌜~(44/14) * ℕℝ 101⌝, ⌜~(44/14) * ~(ℕℝ 101)⌝,
⌜ℕℝ 101 * (44/14)⌝, ⌜ℕℝ 101 * ~(44/14)⌝, ⌜~(ℕℝ 101) * 44/14⌝, ⌜~(ℕℝ 101) * ~(44/14)⌝
];
=TEX
=SML
store_mt_results
(arith_batch "4.6.5" ℝ_times_conv)
[
⌜(22/7) * (1/3)⌝, ⌜(22/7) * ~(1/3)⌝, ⌜~(22/7) * (1/3)⌝, ⌜~(22/7) * ~(1/3)⌝,
⌜(44/14) * (1/3)⌝, ⌜(44/14) * ~(1/3)⌝, ⌜~(44/14) * (1/3)⌝, ⌜~(44/14) * ~(1/3)⌝,
⌜(22/7) * (15/45)⌝, ⌜(22/7) * ~(15/45)⌝, ⌜~(22/7) * (15/45)⌝, ⌜~(22/7) * ~(15/45)⌝,
⌜(44/14) * (15/45)⌝, ⌜(44/14) * ~(15/45)⌝, ⌜~(44/14) * (15/45)⌝, ⌜~(44/14) * ~(15/45)⌝
];
=TEX
=SML
store_mt_results
(arith_batch "4.7.1" ℝ_over_conv)
[
⌜(1/2) / ℕℝ 5⌝, ⌜(1/2) / ~(ℕℝ 5)⌝, ⌜~(1/2) / ℕℝ 5⌝, ⌜~(1/2) / ~(ℕℝ 5)⌝,
⌜ℕℝ 5 / (1/2)⌝, ⌜ℕℝ 5 / ~(1/2)⌝, ⌜~(ℕℝ 5) / (1/2)⌝, ⌜~(ℕℝ 5) / ~(1/2)⌝,
⌜(1/2) / ℕℝ 1⌝, ⌜(1/2) / ~(ℕℝ 1)⌝, ⌜~(1/2) / ℕℝ 1⌝, ⌜~(1/2) / ~(ℕℝ 1)⌝,
⌜ℕℝ 1 / (1/2)⌝, ⌜ℕℝ 1 / ~(1/2)⌝, ⌜~(ℕℝ 1) / (1/2)⌝, ⌜~(ℕℝ 1) / ~(1/2)⌝,
⌜(1/2) / ℕℝ 2⌝, ⌜(1/2) / ~(ℕℝ 2)⌝, ⌜~(1/2) / ℕℝ 2⌝, ⌜~(1/2) / ~(ℕℝ 2)⌝,
⌜ℕℝ 2 / (1/2)⌝, ⌜ℕℝ 2 / ~(1/2)⌝, ⌜~(ℕℝ 2) / (1/2)⌝, ⌜~(ℕℝ 2) / ~(1/2)⌝,
⌜(1/2) / ℕℝ 45⌝, ⌜(1/2) / ~(ℕℝ 45)⌝, ⌜~(1/2) / ℕℝ 45⌝, ⌜~(1/2) / ~(ℕℝ 45)⌝
];
=TEX
=SML
store_mt_results
(arith_batch "4.7.2" ℝ_over_conv)
[
⌜(44/14) / ℕℝ 5⌝, ⌜(44/14) / ~(ℕℝ 5)⌝, ⌜~(44/14) / ℕℝ 5⌝, ⌜~(44/14) / ~(ℕℝ 5)⌝,
⌜ℕℝ 5 / (44/14)⌝, ⌜ℕℝ 5 / ~(44/14)⌝, ⌜~(ℕℝ 5) / (44/14)⌝, ⌜~(ℕℝ 5) / ~(44/14)⌝,
⌜(44/14) / ℕℝ 1⌝, ⌜(44/14) / ~(ℕℝ 1)⌝, ⌜~(44/14) / ℕℝ 1⌝, ⌜~(44/14) / ~(ℕℝ 1)⌝,
⌜ℕℝ 1 / (44/14)⌝, ⌜ℕℝ 1 / ~(44/14)⌝, ⌜~(ℕℝ 1) / (44/14)⌝, ⌜~(ℕℝ 1) / ~(44/14)⌝,
⌜(44/14) / ℕℝ 2⌝, ⌜(44/14) / ~(ℕℝ 2)⌝, ⌜~(44/14) / ℕℝ 2⌝, ⌜~(44/14) / ~(ℕℝ 2)⌝,
⌜ℕℝ 2 / (44/14)⌝, ⌜ℕℝ 2 / ~(44/14)⌝, ⌜~(ℕℝ 2) / (44/14)⌝, ⌜~(ℕℝ 2) / ~(44/14)⌝,
⌜(44/14) / ℕℝ 151⌝, ⌜(44/14) / ~(ℕℝ 151)⌝, ⌜~(44/14) / ℕℝ 151⌝, ⌜~(44/14) / ~(ℕℝ 151)⌝,
⌜ℕℝ 151 / (44/14)⌝, ⌜ℕℝ 151 / ~(44/14)⌝, ⌜~(ℕℝ 151) / (44/14)⌝, ⌜~(ℕℝ 151) / ~(44/14)⌝
];
=TEX
=SML
store_mt_results
(arith_batch "4.7.3" ℝ_over_conv)
[
⌜(22/7) / (1/3)⌝, ⌜(22/7) / ~(1/3)⌝, ⌜~(22/7) / (1/3)⌝, ⌜~(22/7) / ~(1/3)⌝,
⌜(44/14) / (1/3)⌝, ⌜(44/14) / ~(1/3)⌝, ⌜~(44/14) / (1/3)⌝, ⌜~(44/14) / ~(1/3)⌝,
⌜(22/7) / (15/45)⌝, ⌜(22/7) / ~(15/45)⌝, ⌜~(22/7) / (15/45)⌝, ⌜~(22/7) / ~(15/45)⌝,
⌜(44/14) / (15/45)⌝, ⌜(44/14) / ~(15/45)⌝, ⌜~(44/14) / (15/45)⌝, ⌜~(44/14) / ~(15/45)⌝,
⌜(44/14) / (44/14)⌝, ⌜~(44/14) / ~(44/14)⌝, ⌜~(ℕℝ 3) / ~(9/6)⌝, ⌜(9/6) / (ℕℝ 3)⌝,
⌜(0/14) / (44/14)⌝, ⌜~(0/14) / ~(44/14)⌝, ⌜~(ℕℝ 0) / ~(9/6)⌝, ⌜(0/6) / (ℕℝ 3)⌝,
⌜~(0/14) / (44/14)⌝, ⌜(0/14) / ~(44/14)⌝, ⌜~(ℕℝ 0) / (9/6)⌝, ⌜(0/6) / (ℕℝ 3)⌝
];
=TEX
We also need to test division when the numerator is not a literal:
=SML
store_mt_results
(mt_runf (fn (thm, tm) => snd(dest_eq(concl thm)) =$ tm))
[
	("4.7.4.1", ℝ_over_conv, ⌜Z / (1/2)⌝, ⌜Z * ℕℝ 2⌝),
	("4.7.4.2", ℝ_over_conv, ⌜Z / ~(1/2)⌝, ⌜Z * ~(ℕℝ 2)⌝),
	("4.7.4.3", ℝ_over_conv, ⌜~Z / (1/2)⌝, ⌜Z * ~(ℕℝ 2)⌝),
	("4.7.4.4", ℝ_over_conv, ⌜~Z / ~(1/2)⌝, ⌜Z * ℕℝ 2⌝)
];
=TEX
=SML
store_mt_results
(arith_batch "4.8.1" ℝ_recip_conv)
[
⌜ℕℝ 1 ⋏-⋏1⌝, ⌜ℕℝ 99 ⋏-⋏1⌝, ⌜(22/7) ⋏-⋏1⌝,  ⌜(22/11) ⋏-⋏1⌝,  ⌜(6/10) ⋏-⋏1⌝,
⌜~(ℕℝ 1) ⋏-⋏1⌝, ⌜~(ℕℝ 99) ⋏-⋏1⌝, ⌜~(22/7) ⋏-⋏1⌝,  ⌜~(22/11) ⋏-⋏1⌝, ⌜~(6/10) ⋏-⋏1⌝
];
=TEX
=SML
store_mt_results
(arith_batch "4.9.1" ℝ_ℕ_exp_conv)
[
⌜ℕℝ 0 ^ 0⌝, ⌜~(ℕℝ 0) ^ 0⌝, ⌜(0/1) ^ 0⌝, ⌜ ~(0/1) ^ 0⌝,
⌜ℕℝ 0 ^ 1⌝, ⌜~(ℕℝ 0) ^ 1⌝, ⌜(0/1) ^ 1⌝, ⌜ ~(0/1) ^ 1⌝,
⌜ℕℝ 0 ^ 7⌝, ⌜~(ℕℝ 0) ^ 7⌝, ⌜(0/1) ^ 7⌝, ⌜ ~(0/1) ^ 7⌝,
⌜ℕℝ 1 ^ 0⌝, ⌜~(ℕℝ 1) ^ 0⌝, ⌜(1/1) ^ 0⌝, ⌜ ~(1/1) ^ 0⌝,
⌜ℕℝ 1 ^ 1⌝, ⌜~(ℕℝ 1) ^ 1⌝, ⌜(1/1) ^ 1⌝, ⌜ ~(1/1) ^ 1⌝,
⌜ℕℝ 1 ^ 7⌝, ⌜~(ℕℝ 1) ^ 7⌝, ⌜(1/1) ^ 7⌝, ⌜ ~(1/1) ^ 7⌝,
⌜ℕℝ 2 ^ 0⌝, ⌜~(ℕℝ 2) ^ 0⌝, ⌜(2/1) ^ 0⌝, ⌜ ~(2/1) ^ 0⌝,
⌜ℕℝ 2 ^ 0⌝, ⌜ℕℝ 2 ^ 1⌝, ⌜ℕℝ 2 ^ 2⌝, ⌜ℕℝ 2 ^ 3⌝,
⌜(3/4) ^ 5⌝, ⌜~(99/17) ^ 2⌝, ⌜(1001/13) ^ 3⌝, ⌜(2/3) ^ 7⌝
];
=TEX
=SML
store_mt_results
(pred_batch "4.10.1" ℝ_less_conv)
[
⌜(1/2) < ℕℝ 0⌝, ⌜(1/2) < ~(ℕℝ 0)⌝, ⌜~(1/2) < ℕℝ 0⌝, ⌜~(1/2) < ~(ℕℝ 0)⌝,
⌜ℕℝ 0 < (1/2)⌝, ⌜ℕℝ 0 < ~(1/2)⌝, ⌜~(ℕℝ 0) < 1/2⌝, ⌜~(ℕℝ 0) < ~(1/2)⌝,
⌜(1/2) < ℕℝ 1⌝, ⌜(1/2) < ~(ℕℝ 1)⌝, ⌜~(1/2) < ℕℝ 1⌝, ⌜~(1/2) < ~(ℕℝ 1)⌝,
⌜ℕℝ 1 < (1/2)⌝, ⌜ℕℝ 1 < ~(1/2)⌝, ⌜~(ℕℝ 1) < 1/2⌝, ⌜~(ℕℝ 1) < ~(1/2)⌝,
⌜(1/2) < ℕℝ 2⌝, ⌜(1/2) < ~(ℕℝ 2)⌝, ⌜~(1/2) < ℕℝ 2⌝, ⌜~(1/2) < ~(ℕℝ 2)⌝,
⌜ℕℝ 2 < (1/2)⌝, ⌜ℕℝ 2 < ~(1/2)⌝, ⌜~(ℕℝ 2) < 1/2⌝, ⌜~(ℕℝ 2) < ~(1/2)⌝,
⌜(1/2) < ℕℝ 45⌝, ⌜(1/2) < ~(ℕℝ 45)⌝, ⌜~(1/2) < ℕℝ 45⌝, ⌜~(1/2) < ~(ℕℝ 45)⌝,
⌜ℕℝ 45 < (1/2)⌝, ⌜ℕℝ 45 < ~(1/2)⌝, ⌜~(ℕℝ 45) < 1/2⌝, ⌜~(ℕℝ 45) < ~(1/2)⌝
];
=TEX
=SML
store_mt_results
(pred_batch "4.10.2" ℝ_less_conv)
[
⌜(44/14) < ℕℝ 0⌝, ⌜(44/14) < ~(ℕℝ 0)⌝, ⌜~(44/14) < ℕℝ 0⌝, ⌜~(44/14) < ~(ℕℝ 0)⌝,
⌜ℕℝ 0 < (44/14)⌝, ⌜ℕℝ 0 < ~(44/14)⌝, ⌜~(ℕℝ 0) < 44/14⌝, ⌜~(ℕℝ 0) < ~(44/14)⌝,
⌜(44/14) < ℕℝ 1⌝, ⌜(44/14) < ~(ℕℝ 1)⌝, ⌜~(44/14) < ℕℝ 1⌝, ⌜~(44/14) < ~(ℕℝ 1)⌝,
⌜ℕℝ 1 < (44/14)⌝, ⌜ℕℝ 1 < ~(44/14)⌝, ⌜~(ℕℝ 1) < 44/14⌝, ⌜~(ℕℝ 1) < ~(44/14)⌝,
⌜(44/14) < ℕℝ 2⌝, ⌜(44/14) < ~(ℕℝ 2)⌝, ⌜~(44/14) < ℕℝ 2⌝, ⌜~(44/14) < ~(ℕℝ 2)⌝,
⌜ℕℝ 2 < (44/14)⌝, ⌜ℕℝ 2 < ~(44/14)⌝, ⌜~(ℕℝ 2) < 44/14⌝, ⌜~(ℕℝ 2) < ~(44/14)⌝,
⌜(44/14) < ℕℝ 101⌝, ⌜(44/14) < ~(ℕℝ 101)⌝, ⌜~(44/14) < ℕℝ 101⌝, ⌜~(44/14) < ~(ℕℝ 101)⌝,
⌜ℕℝ 101 < (44/14)⌝, ⌜ℕℝ 101 < ~(44/14)⌝, ⌜~(ℕℝ 101) < 44/14⌝, ⌜~(ℕℝ 101) < ~(44/14)⌝
];
=TEX
=SML
store_mt_results
(pred_batch "4.10.3" ℝ_less_conv)
[
⌜(22/7) < (1/3)⌝, ⌜(22/7) < ~(1/3)⌝, ⌜~(22/7) < (1/3)⌝, ⌜~(22/7) < ~(1/3)⌝,
⌜(44/14) < (1/3)⌝, ⌜(44/14) < ~(1/3)⌝, ⌜~(44/14) < (1/3)⌝, ⌜~(44/14) < ~(1/3)⌝,
⌜(22/7) < (15/45)⌝, ⌜(22/7) < ~(15/45)⌝, ⌜~(22/7) < (15/45)⌝, ⌜~(22/7) < ~(15/45)⌝,
⌜(44/14) < (15/45)⌝, ⌜(44/14) < ~(15/45)⌝, ⌜~(44/14) < (15/45)⌝, ⌜~(44/14) < ~(15/45)⌝
];
=TEX
=SML
store_mt_results
(pred_batch "4.11.1" ℝ_≤_conv)
[
⌜(1/2) ≤ ℕℝ 0⌝, ⌜(1/2) ≤ ~(ℕℝ 0)⌝, ⌜~(1/2) ≤ ℕℝ 0⌝, ⌜~(1/2) ≤ ~(ℕℝ 0)⌝,
⌜ℕℝ 0 ≤ (1/2)⌝, ⌜ℕℝ 0 ≤ ~(1/2)⌝, ⌜~(ℕℝ 0) ≤ 1/2⌝, ⌜~(ℕℝ 0) ≤ ~(1/2)⌝,
⌜(1/2) ≤ ℕℝ 1⌝, ⌜(1/2) ≤ ~(ℕℝ 1)⌝, ⌜~(1/2) ≤ ℕℝ 1⌝, ⌜~(1/2) ≤ ~(ℕℝ 1)⌝,
⌜ℕℝ 1 ≤ (1/2)⌝, ⌜ℕℝ 1 ≤ ~(1/2)⌝, ⌜~(ℕℝ 1) ≤ 1/2⌝, ⌜~(ℕℝ 1) ≤ ~(1/2)⌝,
⌜(1/2) ≤ ℕℝ 2⌝, ⌜(1/2) ≤ ~(ℕℝ 2)⌝, ⌜~(1/2) ≤ ℕℝ 2⌝, ⌜~(1/2) ≤ ~(ℕℝ 2)⌝,
⌜ℕℝ 2 ≤ (1/2)⌝, ⌜ℕℝ 2 ≤ ~(1/2)⌝, ⌜~(ℕℝ 2) ≤ 1/2⌝, ⌜~(ℕℝ 2) ≤ ~(1/2)⌝,
⌜(1/2) ≤ ℕℝ 45⌝, ⌜(1/2) ≤ ~(ℕℝ 45)⌝, ⌜~(1/2) ≤ ℕℝ 45⌝, ⌜~(1/2) ≤ ~(ℕℝ 45)⌝,
⌜ℕℝ 45 ≤ (1/2)⌝, ⌜ℕℝ 45 ≤ ~(1/2)⌝, ⌜~(ℕℝ 45) ≤ 1/2⌝, ⌜~(ℕℝ 45) ≤ ~(1/2)⌝
];
=TEX
=SML
store_mt_results
(pred_batch "4.11.2" ℝ_≤_conv)
[
⌜(44/14) ≤ ℕℝ 0⌝, ⌜(44/14) ≤ ~(ℕℝ 0)⌝, ⌜~(44/14) ≤ ℕℝ 0⌝, ⌜~(44/14) ≤ ~(ℕℝ 0)⌝,
⌜ℕℝ 0 ≤ (44/14)⌝, ⌜ℕℝ 0 ≤ ~(44/14)⌝, ⌜~(ℕℝ 0) ≤ 44/14⌝, ⌜~(ℕℝ 0) ≤ ~(44/14)⌝,
⌜(44/14) ≤ ℕℝ 1⌝, ⌜(44/14) ≤ ~(ℕℝ 1)⌝, ⌜~(44/14) ≤ ℕℝ 1⌝, ⌜~(44/14) ≤ ~(ℕℝ 1)⌝,
⌜ℕℝ 1 ≤ (44/14)⌝, ⌜ℕℝ 1 ≤ ~(44/14)⌝, ⌜~(ℕℝ 1) ≤ 44/14⌝, ⌜~(ℕℝ 1) ≤ ~(44/14)⌝,
⌜(44/14) ≤ ℕℝ 2⌝, ⌜(44/14) ≤ ~(ℕℝ 2)⌝, ⌜~(44/14) ≤ ℕℝ 2⌝, ⌜~(44/14) ≤ ~(ℕℝ 2)⌝,
⌜ℕℝ 2 ≤ (44/14)⌝, ⌜ℕℝ 2 ≤ ~(44/14)⌝, ⌜~(ℕℝ 2) ≤ 44/14⌝, ⌜~(ℕℝ 2) ≤ ~(44/14)⌝,
⌜(44/14) ≤ ℕℝ 101⌝, ⌜(44/14) ≤ ~(ℕℝ 101)⌝, ⌜~(44/14) ≤ ℕℝ 101⌝, ⌜~(44/14) ≤ ~(ℕℝ 101)⌝,
⌜ℕℝ 101 ≤ (44/14)⌝, ⌜ℕℝ 101 ≤ ~(44/14)⌝, ⌜~(ℕℝ 101) ≤ 44/14⌝, ⌜~(ℕℝ 101) ≤ ~(44/14)⌝
];
=TEX
=SML
store_mt_results
(pred_batch "4.11.3" ℝ_≤_conv)
[
⌜(22/7) ≤ (1/3)⌝, ⌜(22/7) ≤ ~(1/3)⌝, ⌜~(22/7) ≤ (1/3)⌝, ⌜~(22/7) ≤ ~(1/3)⌝,
⌜(44/14) ≤ (1/3)⌝, ⌜(44/14) ≤ ~(1/3)⌝, ⌜~(44/14) ≤ (1/3)⌝, ⌜~(44/14) ≤ ~(1/3)⌝,
⌜(22/7) ≤ (15/45)⌝, ⌜(22/7) ≤ ~(15/45)⌝, ⌜~(22/7) ≤ (15/45)⌝, ⌜~(22/7) ≤ ~(15/45)⌝,
⌜(44/14) ≤ (15/45)⌝, ⌜(44/14) ≤ ~(15/45)⌝, ⌜~(44/14) ≤ (15/45)⌝, ⌜~(44/14) ≤ ~(15/45)⌝,
⌜(44/14) ≤ (44/14)⌝, ⌜~(44/14) ≤ ~(44/14)⌝, ⌜~(ℕℝ 3) ≤ ~(9/6)⌝, ⌜(9/6) ≤ (ℕℝ 3)⌝
];
=TEX
=SML
store_mt_results
(pred_batch "4.12.1" ℝ_eq_conv)
[
⌜(ℕℝ 0) = (ℕℝ 0)⌝, ⌜~(ℕℝ 0) = (ℕℝ 0)⌝,  ⌜(ℕℝ 0) = ~(ℕℝ 0)⌝, ⌜~(ℕℝ 0) = ~ (ℕℝ 0)⌝,
⌜(ℕℝ 0) = (ℕℝ 1)⌝, ⌜~(ℕℝ 0) = (ℕℝ 1)⌝,  ⌜(ℕℝ 0) = ~(ℕℝ 1)⌝, ⌜~(ℕℝ 0) = ~ (ℕℝ 1)⌝
];
=TEX
=SML
store_mt_results
(pred_batch "4.12.2" ℝ_eq_conv)
[
⌜(ℕℝ 0) = (0/1)⌝, ⌜~(ℕℝ 0) = (0/1)⌝,  ⌜(ℕℝ 0) = ~(0/1)⌝, ⌜~(ℕℝ 0) = ~ (0/1)⌝,
⌜(ℕℝ 0) = (1/1)⌝, ⌜~(ℕℝ 0) = (1/1)⌝,  ⌜(ℕℝ 0) = ~(1/1)⌝, ⌜~(ℕℝ 0) = ~ (1/1)⌝
];
=TEX
=SML
store_mt_results
(pred_batch "4.12.3" ℝ_eq_conv)
[
⌜(1/2) = (1/2)⌝, ⌜~(1/2) = (1/2)⌝,⌜(1/2) = ~(1/2)⌝,  ⌜~(1/2) = ~(1/2)⌝,
⌜(1/2) = (2/3)⌝, ⌜~(1/2) = (2/3)⌝,⌜(1/2) = ~(2/3)⌝,  ⌜~(1/2) = ~(2/3)⌝,
⌜(17/34) = (3/6)⌝, ⌜~(17/34) = (3/6)⌝, ⌜(17/34) = ~(3/6)⌝, ⌜~(17/34) = ~(3/6)⌝
];
=TEX
=SML
store_mt_results
(arith_batch "4.13.1" ℝ_eval_conv)
[
	⌜ℕℝ 0 + ℕℝ 0⌝, ⌜ℕℝ 0 + ~(ℕℝ 0)⌝, ⌜~(ℕℝ 0) + ℕℝ 0⌝, ⌜~(ℕℝ 0) + ~(ℕℝ 0)⌝,
	⌜ℕℝ 1 + ℕℝ 0⌝, ⌜ℕℝ 1 + ~(ℕℝ 0)⌝, ⌜~(ℕℝ 1) + ℕℝ 0⌝, ⌜~(ℕℝ 1) + ~(ℕℝ 0)⌝,
	⌜ℕℝ 1 + ℕℝ 1⌝, ⌜ℕℝ 1 + ~(ℕℝ 1)⌝, ⌜~(ℕℝ 1) + ℕℝ 1⌝, ⌜~(ℕℝ 1) + ~(ℕℝ 1)⌝,
	⌜0/1 + ℕℝ 1⌝, ⌜0/1 + ~(ℕℝ 1)⌝, ⌜~(0/1) + ℕℝ 1⌝, ⌜~(0/1) + ~(ℕℝ 1)⌝,
	⌜ℕℝ 1 + 0/1⌝, ⌜ℕℝ 1 + ~(0/1)⌝, ⌜~(ℕℝ 1) + 0/1⌝, ⌜~(ℕℝ 1) + ~(0/1)⌝,
	⌜0/1 + ℕℝ 1⌝, ⌜0/1 + ~(ℕℝ 1)⌝, ⌜~(0/1) + ℕℝ 1⌝, ⌜~(0/1) + ~(ℕℝ 1)⌝,
	⌜0/1 + 0/1⌝, ⌜0/1 + ~(0/1)⌝, ⌜~(0/1) + 0/1⌝, ⌜~(0/1) + ~(0/1)⌝,
	⌜1/1 + 1/1⌝, ⌜1/1 + ~(1/1)⌝, ⌜~(1/1) + 1/1⌝, ⌜~(1/1) + ~(1/1)⌝,
	⌜2/3 + 3/4⌝, ⌜2/3 + ~(3/4)⌝, ⌜~(2/3) + 3/4⌝, ⌜~(2/3) + ~(3/4)⌝
];
=TEX
=SML
store_mt_results
(arith_batch "4.13.2" ℝ_eval_conv)
[
	⌜1/1 + 1/2 + 1/4 + 1/8⌝, ⌜1/1 - 1/2 + 1/4 - 1/8⌝,
	⌜ℕℝ 1 + 1/2 + 1/4 + 1/8⌝, ⌜ℕℝ 1 - 1/2 + 1/4 - 1/8⌝,
	⌜ℕℝ 1 + ℕℝ 1 / ℕℝ 2 + ℕℝ 1 / ℕℝ 4 + ℕℝ 1 / ℕℝ 8⌝,
	⌜ℕℝ 1 - ℕℝ 1 / ℕℝ 2 + ℕℝ 1 / ℕℝ 4 - ℕℝ 1 / ℕℝ 8⌝
];
=TEX
=SML
store_mt_results
(arith_batch "4.13.3" ℝ_eval_conv)
[
	⌜ℕℝ 0 * ℕℝ 0⌝, ⌜ℕℝ 0 * ~(ℕℝ 0)⌝, ⌜~(ℕℝ 0) * ℕℝ 0⌝, ⌜~(ℕℝ 0) * ~(ℕℝ 0)⌝,
	⌜ℕℝ 1 * ℕℝ 0⌝, ⌜ℕℝ 1 * ~(ℕℝ 0)⌝, ⌜~(ℕℝ 1) * ℕℝ 0⌝, ⌜~(ℕℝ 1) * ~(ℕℝ 0)⌝,
	⌜ℕℝ 1 * ℕℝ 1⌝, ⌜ℕℝ 1 * ~(ℕℝ 1)⌝, ⌜~(ℕℝ 1) * ℕℝ 1⌝, ⌜~(ℕℝ 1) * ~(ℕℝ 1)⌝,
	⌜0/1 * ℕℝ 1⌝, ⌜0/1 * ~(ℕℝ 1)⌝, ⌜~(0/1) * ℕℝ 1⌝, ⌜~(0/1) * ~(ℕℝ 1)⌝,
	⌜ℕℝ 1 * 0/1⌝, ⌜ℕℝ 1 * ~(0/1)⌝, ⌜~(ℕℝ 1) * 0/1⌝, ⌜~(ℕℝ 1) * ~(0/1)⌝,
	⌜0/1 * ℕℝ 1⌝, ⌜0/1 * ~(ℕℝ 1)⌝, ⌜~(0/1) * ℕℝ 1⌝, ⌜~(0/1) * ~(ℕℝ 1)⌝,
	⌜0/1 * 0/1⌝, ⌜0/1 * ~(0/1)⌝, ⌜~(0/1) * 0/1⌝, ⌜~(0/1) * ~(0/1)⌝,
	⌜1/1 * 1/1⌝, ⌜1/1 * ~(1/1)⌝, ⌜~(1/1) * 1/1⌝, ⌜~(1/1) * ~(1/1)⌝,
	⌜2/3 * 3/4⌝, ⌜2/3 * ~(3/4)⌝, ⌜~(2/3) * 3/4⌝, ⌜~(2/3) * ~(3/4)⌝
];
=TEX
=SML
store_mt_results
(arith_batch "4.13.4" ℝ_eval_conv)
[
	⌜ℕℝ 1 / ℕℝ 1⌝, ⌜ℕℝ 1 / ~(ℕℝ 1)⌝, ⌜~(ℕℝ 1) / ℕℝ 1⌝, ⌜~(ℕℝ 1) / ~(ℕℝ 1)⌝,
	⌜ℕℝ 1 / ℕℝ 7⌝, ⌜ℕℝ 1 / ~(ℕℝ 7)⌝, ⌜~(ℕℝ 1) / ℕℝ 7⌝, ⌜~(ℕℝ 1) / ~(ℕℝ 7)⌝,
	⌜ℕℝ 3 / ℕℝ 7⌝, ⌜ℕℝ 3 / ~(ℕℝ 7)⌝, ⌜~(ℕℝ 3) / ℕℝ 7⌝, ⌜~(ℕℝ 3) / ~(ℕℝ 7)⌝,
	⌜(0/1) / ℕℝ 1⌝, ⌜(0/1) / ~(ℕℝ 1)⌝, ⌜~(0/1) / ℕℝ 1⌝, ⌜~(0/1) / ~(ℕℝ 1)⌝,
	⌜(1/1) / (1/1)⌝, ⌜(1/1) / ~(1/1)⌝, ⌜~(1/1) / (1/1)⌝, ⌜~(1/1) / ~(1/1)⌝,
	⌜(2/3) / (3/4)⌝, ⌜(2/3) / ~(3/4)⌝, ⌜~(2/3) / (3/4)⌝, ⌜~(2/3) / ~(3/4)⌝
];
=TEX
=SML
store_mt_results
(arith_batch "4.13.5" ℝ_eval_conv)
[
	⌜ℕℝ 1 + ℕℝ 2 * (1/4 - ℕℝ 99 / ℕℝ2) ⋏-⋏1 + Abs (1/2) / ℕℝ 27⌝,
	⌜ℕℝ 1 / ℕℝ 2 * (1/4 - ℕℝ 99 / ℕℝ2) ⋏-⋏1 + ~(~(~ (1/2))) / ℕℝ 27⌝
];
=TEX
=TEX
=SML
store_mt_results
(arith_batch "4.13.6" ℝ_eval_conv)
[
	⌜1/1 * 1/2 * 1/4 * 1/8⌝, ⌜(1/1) / (1/2) * (1/4) / (1/8)⌝,
	⌜ℕℝ 1 * 1/2 * 1/4 * 1/8⌝, ⌜ℕℝ 1 / (1/2) * (1/4) / (1/8)⌝,
	⌜ℕℝ 1 * ℕℝ 1 / ℕℝ 2 * ℕℝ 1 / ℕℝ 4 * ℕℝ 1 / ℕℝ 8⌝,
	⌜ℕℝ 1 / ℕℝ 1 / ℕℝ 2 * ℕℝ 1 / ℕℝ 4 / ℕℝ 1 / ℕℝ 8⌝
];
=TEX
Dyadic arithmetic operators, some error cases:
=SML
store_mt_results
mt_run_fail
[
	("4.14.1", ℝ_plus_conv, ⌜2/6⌝,
		gen_fail_msg "ℝ_plus_conv" 116305 [string_of_term ⌜2/6⌝]),
	("4.14.2", ℝ_times_conv, ⌜2/6⌝,
		gen_fail_msg "ℝ_times_conv" 116306 [string_of_term ⌜2/6⌝]),
	("4.14.3", ℝ_ℕ_exp_conv, ⌜2/6⌝,
		gen_fail_msg "ℝ_ℕ_exp_conv" 116317 [string_of_term ⌜2/6⌝]),
	("4.14.4", ℝ_ℤ_exp_conv, ⌜2/6⌝,
		gen_fail_msg "ℝ_ℤ_exp_conv" 116321 [string_of_term ⌜2/6⌝])
];
=TEX
\section{ARITHMETIC NORMALISATION CONVERSION}
=SML
store_mt_results
(arith_batch "5.1" ℝ_anf_conv)
[
	⌜ℕℝ 0 + ℕℝ 0⌝, ⌜ℕℝ 0 + ~(ℕℝ 0)⌝, ⌜~(ℕℝ 0) + ℕℝ 0⌝, ⌜~(ℕℝ 0) + ~(ℕℝ 0)⌝,
	⌜ℕℝ 1 + ℕℝ 0⌝, ⌜ℕℝ 1 + ~(ℕℝ 0)⌝, ⌜~(ℕℝ 1) + ℕℝ 0⌝, ⌜~(ℕℝ 1) + ~(ℕℝ 0)⌝,
	⌜ℕℝ 1 + ℕℝ 1⌝, ⌜ℕℝ 1 + ~(ℕℝ 1)⌝, ⌜~(ℕℝ 1) + ℕℝ 1⌝, ⌜~(ℕℝ 1) + ~(ℕℝ 1)⌝,
	⌜0/1 + ℕℝ 1⌝, ⌜0/1 + ~(ℕℝ 1)⌝, ⌜~(0/1) + ℕℝ 1⌝, ⌜~(0/1) + ~(ℕℝ 1)⌝,
	⌜ℕℝ 1 + 0/1⌝, ⌜ℕℝ 1 + ~(0/1)⌝, ⌜~(ℕℝ 1) + 0/1⌝, ⌜~(ℕℝ 1) + ~(0/1)⌝,
	⌜0/1 + ℕℝ 1⌝, ⌜0/1 + ~(ℕℝ 1)⌝, ⌜~(0/1) + ℕℝ 1⌝, ⌜~(0/1) + ~(ℕℝ 1)⌝,
	⌜0/1 + 0/1⌝, ⌜0/1 + ~(0/1)⌝, ⌜~(0/1) + 0/1⌝, ⌜~(0/1) + ~(0/1)⌝,
	⌜1/1 + 1/1⌝, ⌜1/1 + ~(1/1)⌝, ⌜~(1/1) + 1/1⌝, ⌜~(1/1) + ~(1/1)⌝,
	⌜2/3 + 3/4⌝, ⌜2/3 + ~(3/4)⌝, ⌜~(2/3) + 3/4⌝, ⌜~(2/3) + ~(3/4)⌝
];
=TEX
=SML
store_mt_results
(arith_batch "5.2" ℝ_anf_conv)
[
	⌜1/1 + 1/2 + 1/4 + 1/8⌝, ⌜1/1 - 1/2 + 1/4 - 1/8⌝,
	⌜ℕℝ 1 + 1/2 + 1/4 + 1/8⌝, ⌜ℕℝ 1 - 1/2 + 1/4 - 1/8⌝,
	⌜ℕℝ 1 + ℕℝ 1 / ℕℝ 2 + ℕℝ 1 / ℕℝ 4 + ℕℝ 1 / ℕℝ 8⌝,
	⌜ℕℝ 1 - ℕℝ 1 / ℕℝ 2 + ℕℝ 1 / ℕℝ 4 - ℕℝ 1 / ℕℝ 8⌝
];
=TEX
=SML
store_mt_results
(arith_batch "5.3" ℝ_anf_conv)
[
	⌜ℕℝ 0 * ℕℝ 0⌝, ⌜ℕℝ 0 * ~(ℕℝ 0)⌝, ⌜~(ℕℝ 0) * ℕℝ 0⌝, ⌜~(ℕℝ 0) * ~(ℕℝ 0)⌝,
	⌜ℕℝ 1 * ℕℝ 0⌝, ⌜ℕℝ 1 * ~(ℕℝ 0)⌝, ⌜~(ℕℝ 1) * ℕℝ 0⌝, ⌜~(ℕℝ 1) * ~(ℕℝ 0)⌝,
	⌜ℕℝ 1 * ℕℝ 1⌝, ⌜ℕℝ 1 * ~(ℕℝ 1)⌝, ⌜~(ℕℝ 1) * ℕℝ 1⌝, ⌜~(ℕℝ 1) * ~(ℕℝ 1)⌝,
	⌜0/1 * ℕℝ 1⌝, ⌜0/1 * ~(ℕℝ 1)⌝, ⌜~(0/1) * ℕℝ 1⌝, ⌜~(0/1) * ~(ℕℝ 1)⌝,
	⌜ℕℝ 1 * 0/1⌝, ⌜ℕℝ 1 * ~(0/1)⌝, ⌜~(ℕℝ 1) * 0/1⌝, ⌜~(ℕℝ 1) * ~(0/1)⌝,
	⌜0/1 * ℕℝ 1⌝, ⌜0/1 * ~(ℕℝ 1)⌝, ⌜~(0/1) * ℕℝ 1⌝, ⌜~(0/1) * ~(ℕℝ 1)⌝,
	⌜0/1 * 0/1⌝, ⌜0/1 * ~(0/1)⌝, ⌜~(0/1) * 0/1⌝, ⌜~(0/1) * ~(0/1)⌝,
	⌜1/1 * 1/1⌝, ⌜1/1 * ~(1/1)⌝, ⌜~(1/1) * 1/1⌝, ⌜~(1/1) * ~(1/1)⌝,
	⌜2/3 * 3/4⌝, ⌜2/3 * ~(3/4)⌝, ⌜~(2/3) * 3/4⌝, ⌜~(2/3) * ~(3/4)⌝
];
=TEX
=SML
store_mt_results
(arith_batch "5.4" ℝ_anf_conv)
[
	⌜ℕℝ 1 / ℕℝ 1⌝, ⌜ℕℝ 1 / ~(ℕℝ 1)⌝, ⌜~(ℕℝ 1) / ℕℝ 1⌝, ⌜~(ℕℝ 1) / ~(ℕℝ 1)⌝,
	⌜ℕℝ 1 / ℕℝ 7⌝, ⌜ℕℝ 1 / ~(ℕℝ 7)⌝, ⌜~(ℕℝ 1) / ℕℝ 7⌝, ⌜~(ℕℝ 1) / ~(ℕℝ 7)⌝,
	⌜ℕℝ 3 / ℕℝ 7⌝, ⌜ℕℝ 3 / ~(ℕℝ 7)⌝, ⌜~(ℕℝ 3) / ℕℝ 7⌝, ⌜~(ℕℝ 3) / ~(ℕℝ 7)⌝,
	⌜(0/1) / ℕℝ 1⌝, ⌜(0/1) / ~(ℕℝ 1)⌝, ⌜~(0/1) / ℕℝ 1⌝, ⌜~(0/1) / ~(ℕℝ 1)⌝,
	⌜(1/1) / (1/1)⌝, ⌜(1/1) / ~(1/1)⌝, ⌜~(1/1) / (1/1)⌝, ⌜~(1/1) / ~(1/1)⌝,
	⌜(2/3) / (3/4)⌝, ⌜(2/3) / ~(3/4)⌝, ⌜~(2/3) / (3/4)⌝, ⌜~(2/3) / ~(3/4)⌝
];
=TEX
=SML
store_mt_results
(arith_batch "5.5" ℝ_anf_conv)
[
	⌜1/1 * 1/2 * 1/4 * 1/8⌝, ⌜(1/1) / (1/2) * (1/4) / (1/8)⌝,
	⌜ℕℝ 1 * 1/2 * 1/4 * 1/8⌝, ⌜ℕℝ 1 / (1/2) * (1/4) / (1/8)⌝,
	⌜ℕℝ 1 * ℕℝ 1 / ℕℝ 2 * ℕℝ 1 / ℕℝ 4 * ℕℝ 1 / ℕℝ 8⌝,
	⌜ℕℝ 1 / ℕℝ 1 / ℕℝ 2 * ℕℝ 1 / ℕℝ 4 / ℕℝ 1 / ℕℝ 8⌝
];
=TEX
=SML
store_mt_results
(mt_runf (fn (thm, tm) => snd(dest_eq(concl thm)) =$ tm))
[
	("5.6.1", ℝ_anf_conv, ⌜ℕℝ 1 / (ℕℝ 2 + ℕℝ 3)⌝, ⌜1/5⌝),
	("5.6.2", ℝ_anf_conv, ⌜(x + y:ℝ) * (x - y)⌝, ⌜x^2 + ~(y^2) : ℝ⌝),
	("5.6.3", ℝ_anf_conv, ⌜(x + y:ℝ) * (x + y)⌝, ⌜x^2 + ℕℝ 2 * x * y +  y^2⌝),
	("5.6.4", ℝ_anf_conv,
		 ⌜(ℕℝ 1 - x) * (ℕℝ 1 + x + x^2 + x^3)⌝,
		⌜ℕℝ 1 + ~ (x^4)⌝),
	("5.6.5", ℝ_anf_conv,
		 ⌜(ℕℝ 1 + x) - y * ((ℕℝ 1 + x) - y)⌝,
		⌜ℕℝ 1 + x + ~ x * y + ~ y + y^2⌝),
	("5.6.6", ℝ_anf_conv, ⌜(x + y:ℝ) * (x + y) * (x + y)⌝, ⌜x^3 + 3.*x*y^2 + 3.*x^2*y + y^3⌝)
];
=TEX
\section{PROOF CONTEXT}
=SML
set_merge_pcs["basic_hol", "'ℝ"];
=TEX
=SML
store_mt_results
(arith_batch "6.1" (rewrite_conv[]))
[
	⌜1/2 + 3/4⌝, ⌜~(1/2) + 3/4⌝, ⌜1/2 + ~(3/4)⌝, ⌜~(1/2) + ~(3/4)⌝,
	⌜ℕℝ 2 + 3/4⌝, ⌜~(ℕℝ 2) + 3/4⌝, ⌜ℕℝ 2 + ~(3/4)⌝, ⌜~(ℕℝ 2) + ~(3/4)⌝,
	⌜Abs(ℕℝ 2) + 3/4⌝, ⌜Abs(~(ℕℝ 2)) + 3/4⌝,
		⌜ℕℝ 2 + Abs(~(3/4))⌝, ⌜~(ℕℝ 2) + Abs(~(3/4))⌝,
	⌜Abs(ℕℝ 2) * 3/4⌝, ⌜Abs(~(ℕℝ 2)) * 3/4⌝,
		⌜ℕℝ 2 * Abs(~(3/4))⌝, ⌜~(ℕℝ 2) * Abs(~(3/4))⌝,
	⌜Abs(ℕℝ 2) / (3/4)⌝, ⌜Abs(~(ℕℝ 2)) / (3/4)⌝,
		⌜ℕℝ 2 / Abs(~(3/4))⌝, ⌜~(ℕℝ 2) / Abs(~(3/4))⌝,
	⌜Abs(2.0) / 0.75⌝, ⌜Abs(~2.0) / 0.75⌝,
		⌜ℕℝ 2 / Abs(~(0.75))⌝, ⌜~2.0 / Abs(~0.75)⌝,
	⌜Max⋎R [2.0]⌝, ⌜Min⋎R [2.0]⌝,
		⌜Max⋎R [1.0; 6/5; 2.0; 9/8]⌝, ⌜Min⋎R [1.0; 6/5; 2.0; 9/8]⌝
];
=TEX
=SML
store_mt_results
(pred_batch "6.2" (rewrite_conv[]))
[
	⌜1/2 + 3/4 > 3/4⌝, ⌜~(1/2) < ~(1/2) + 3/4⌝, ⌜x + y = y + x :ℝ⌝,
	⌜x ≤ x :ℝ⌝, ⌜a + b ≥ b + a :ℝ⌝, ⌜Abs(1/2) = (2/1)⋏-⋏1⌝,
	⌜x > x :ℝ⌝, ⌜a + b > b + a :ℝ⌝, ⌜Abs(1/2) < (2/1)⋏-⋏1⌝
];
=TEX
\section{LINEAR ARITHMETIC DECISION PROCEDURE}

=SML
set_merge_pcs["ℝ_lin_arith"];
store_mt_results
mt_run [
	("7.1.1",
	tac_solve (prove_tac[]),
	([], ⌜ℕℝ 0 < y ⇒ (1/2)*y < (3/2)*y⌝), true),
	("7.1.2",
	tac_solve (prove_tac[]),
	([], ⌜x < y ⇒ x < (x+y) / ℕℝ 2 ∧ (x+y) / ℕℝ 2 < y⌝), true),
	("7.1.3",
	tac_solve (prove_tac[]),
	([], ⌜x < y ⇒ x < (x+y) / 0.02e2 ∧ (x+y) / 20.0e~1 < y⌝), true),
	("7.1.4",
	tac_solve (prove_tac[]),
	([], ⌜~1. ^ (N+1) * (p a + q b) = ~1. ^ (N+1) * p a + ~1. ^ (N+1) * q b⌝), true)
];
val tms1 = [
	⌜a ≤ ℕℝ 0⌝,
	⌜~a ≤ ~(ℕℝ 1)⌝,
	⌜T⌝
];
val tms2 = [
	⌜a + b = ℕℝ 0⌝,
	⌜ℕℝ 2*a = ℕℝ 1⌝,
	⌜ℕℝ 2*b = ℕℝ 1⌝
];
val tms3 = [
	⌜a ≤ ℕℝ 0⌝,
	⌜~b ≤ ~(ℕℝ 1)⌝,
	⌜T⌝,
	⌜~a + b ≤ ~(ℕℝ 2)⌝,
	⌜T⌝
];
val tms4 = [
	⌜(1/2)*a ≤ ℕℝ 0⌝,
	⌜~(4/5)*a ≤ ~(5/6)⌝,
	⌜T⌝
];
val tms5 = [
	⌜(1/2)*a = ℕℝ 1⌝,
	⌜~(2/5)*b ≤ ~(7/6)⌝,
	⌜~a + b ≤ (1/100)⌝,
	⌜T⌝
];
val tms6 = [⌜a ≤ 1 / 2⌝,⌜~ a ≤ ~ (3 / 4)⌝,⌜T⌝];
val tms7 = [
	⌜a + ~b ≤ ~(ℕℝ 1)⌝,
	⌜(1/2)*b + ~ (1/2)*c ≤ ℕℝ 0⌝,
	⌜(7/6)*c + ~ (7/6)*d ≤ ℕℝ 0⌝,
	⌜d + ~ a ≤ ℕℝ 0⌝,
	⌜T⌝
];
val tms7 = [
	⌜a + ~b < ~(ℕℝ 1)⌝,
	⌜(1/2)*b + ~ (1/2)*c ≤ ℕℝ 0⌝,
	⌜(7/6)*c + ~ (7/6)*d ≤ ℕℝ 0⌝,
	⌜d + ~ a ≤ ℕℝ 0⌝,
	⌜T⌝
];
val tms8 = [
	⌜a + ~b < ~(ℕℝ 1)⌝,
	⌜(1/2)*b + ~ (1/2)*c ≤ ℕℝ 0⌝,
	⌜(7/6)*c + ~ (7/6)*d = ℕℝ 0⌝,
	⌜(ℕℝ 99)*d + ~ (ℕℝ 99)*e < ℕℝ 0⌝,
	⌜e + ~ a = ℕℝ 0⌝,
	⌜T⌝
];
val tms9 = [
	⌜~ a * a ≤ ℕℝ 0⌝,
	⌜~ b * b ≤ ℕℝ 0⌝,
	⌜a * a + b * b < ℕℝ 0⌝,
	⌜T⌝
];
fun check_lin_arith_rule (thm, tms) = (
	is_f (concl thm) andalso is_nil (asms thm term_diff tms)
);
store_mt_results
(mt_runf check_lin_arith_rule)
(map (fn (tag, ths) => (tag, ℝ_lin_arith_rule, ths, ths)) [
	("7.2.1", tms1),
	("7.2.2", tms2),
	("7.2.3", tms3),
	("7.2.4", tms4),
	("7.2.5", tms5),
	("7.2.6", tms6),
	("7.2.7", tms7),
	("7.2.8", tms8),
	("7.2.9", tms9)
]);
=TEX
=SML
store_mt_results
(mt_runf (fn (th, tm) => snd(dest_eq(concl th)) =$ tm))
[
	("7.3.1", ℝ_eq_cancel_conv, ⌜x + ~(~(1/2 )) = y⌝, ⌜x + ~ y = ~ (1 / 2)⌝),
	("7.3.2", ℝ_≤_cancel_conv, ⌜x + ℕℝ 2 ⋏-⋏1 ≤ y⌝, ⌜x + ~ y ≤ ~ (1 / 2)⌝),
	("7.3.3", ℝ_less_cancel_conv, ⌜x + 3/6 < y⌝, ⌜x + ~ y < ~ (1 / 2)⌝)
];
=TEX
\section{FLOATING POINT LITERALS}
\subsection{Syntax Functions}
=SML

set_merge_pcs["ℝ_lin_arith"];
store_mt_results
mt_run [
	("8.1.1", dest_float, ⌜1.2⌝, (@@"12", @@"1", @@"0")),
	("8.1.2", dest_float, ⌜1.2e0⌝, (@@"12", @@"1", @@"0")),
	("8.1.3", dest_float, ⌜1.234e4⌝, (@@"1234", @@"3", @@"4")),
	("8.1.4", dest_float, ⌜1.234e~4⌝, (@@"1234", @@"3", @@"~4"))
];
=TEX
=SML
store_mt_results
mt_run_fail [
	("8.2.1", dest_float, ⌜Float 1 (ℕℤ 2) x⌝,
		gen_fail_msg "dest_float" 4042 ["⌜Float 1 (ℕℤ 2) x⌝"]),
	("8.2.2", dest_float, ⌜1⌝,
		gen_fail_msg "dest_float" 4042 ["⌜1⌝"])
];
=TEX
=SML
store_mt_results
mt_run [
	("8.3.1", is_float, ⌜Float 1 (ℕℤ 2) x⌝, false),
	("8.3.2", is_float, ⌜1.0⌝, true),
	("8.3.3", is_float, ⌜1⌝, false)
];
=TEX
\subsection{Evaluation Conversions}
=SML
store_mt_results
(mt_runf (fn (th, tm) => snd(dest_eq(concl th)) =$ tm))
[
	("8.4.1", float_conv, ⌜0.314159e1⌝, ⌜314159/100000⌝),
	("8.4.2", float_conv, ⌜10.0e1⌝, ⌜ℕℝ 100⌝),
	("8.4.3", float_conv, ⌜1.0e~1⌝, ⌜1/10⌝)
];
=TEX
=SML
store_mt_results
(mt_runf (fn (th, tm) => snd(dest_eq(concl th)) =$ tm))
[
	("8.5.1", ℝ_eval_conv, ⌜0.314159e1⌝, ⌜314159/100000⌝),
	("8.5.2", ℝ_eval_conv, ⌜1.0 * 10.0e1⌝, ⌜ℕℝ 100⌝),
	("8.5.3", ℝ_eval_conv, ⌜1.0e~1 + 0.0⌝, ⌜1/10⌝),
	("8.5.4", ℝ_eval_conv, ⌜1.0 * 2.0 * 3.0⌝, ⌜ℕℝ 6⌝),
	("8.5.5", ℝ_eval_conv, ⌜ℕℝ 1 + 2.0⌝, ⌜ℕℝ 3⌝)
];
=TEX
\section{LINEAR QUANTIFIER ELIMINATION PROCEDURE}
=SML
store_mt_results
(mt_runf (fn (th, tm) => snd(dest_eq(concl th)) =$ tm))
[
("9.1.1", ℝ_lin_qep_conv,
	⌜∃a b c ⦁ (a < b ∨ c = 1.0) ∨ b > 1.0⌝,
		⌜T⌝),
("9.1.2", ℝ_lin_qep_conv,
	⌜∃a b⦁ a + ~b < ~(ℕℝ1)⌝,
		⌜T⌝),
("9.1.3", ℝ_lin_qep_conv,
	⌜∃x1 x2⦁ x1 > 5.0 ∧ ~7.0*x2 > 5.0 ∧ x = x1 - x2⌝,
		⌜40/7 < x⌝),
("9.1.4", ℝ_lin_qep_conv,
	⌜∀x y z⦁ x + y + z = 0.0 ∧ ∀t⦁t + z < 0.0 ⇒ t < 0.0⌝,
		⌜F⌝),
("9.1.5", ℝ_lin_qep_conv,
	⌜∀x y z⦁ x + y + z = 0.0 ∧ ∃t⦁t + z < 0.0 ⇒ t < 0.0⌝,
		⌜F⌝),
("9.1.6", ℝ_lin_qep_conv,
	⌜∃ x y z⦁ ¬ x + y + z = 0.0⌝,
		⌜T⌝),
("9.1.7", ℝ_lin_qep_conv,
	⌜ ∃ x:ℝ ⦁ L1 < x ⌝,
		⌜T⌝),
("9.1.8", ℝ_lin_qep_conv,
	⌜ ∃ x:ℝ ⦁ L1 < x ∧ L2 < x⌝,
		⌜T⌝),
("9.1.9", ℝ_lin_qep_conv,
	⌜ ∃ x:ℝ ⦁ L1 < x ∧ L2 < x ∧ L3 < x⌝,
		⌜T⌝),
("9.1.10", ℝ_lin_qep_conv,
	⌜ ∃ x:ℝ ⦁ x < U1  ⌝,
		⌜T⌝),
("9.1.11", ℝ_lin_qep_conv,
	⌜ ∃ x:ℝ ⦁ x < U1 ∧ x < U2 ⌝,
		⌜T⌝),
("9.1.12", ℝ_lin_qep_conv,
	⌜ ∃ x:ℝ ⦁ x < U1 ∧ x < U2 ∧ x < U3⌝,
		⌜T⌝),
("9.1.13", ℝ_lin_qep_conv,
	⌜ ∃ x:ℝ ⦁ L1 < x ∧ x < U1⌝,
		⌜L1 + ~ U1 < 0.⌝),
("9.1.14", ℝ_lin_qep_conv,
	⌜ ∃ x:ℝ ⦁ L1 < x ∧ L2 < x ∧ x < U1 ⌝,
		⌜L1 + ~ U1 < 0. ∧ L2 + ~ U1 < 0.⌝),
("9.1.15", ℝ_lin_qep_conv,
	⌜ ∃ x:ℝ ⦁ L1 < x ∧ L2 < x ∧ x < U1  ∧ x < U2⌝,
		⌜L1 + ~ U1 < 0. ∧ L1 + ~ U2 < 0. ∧ L2 + ~ U1 < 0. ∧ L2 + ~ U2 < 0.⌝)
];
=TEX
\section{REGRESSION TESTS FOR FIXES AND ENHANCEMENTS}

=SML
set_merge_pcs["ℝ_lin_arith"];
store_mt_results
(mt_runf (fn (thm, tm) => tm =$ snd(dest_eq(concl thm)))) [
	("100.1.1",
	ℝ_anf_conv,
	⌜ℕℝ a + ℕℝ 0 + ℕℝ b - ℕℝ a ⌝, ⌜ℕℝ b⌝)
];

=TEX

=SML
store_mt_results
(mt_runf (fn (thm, tm) => tm =$ snd(dest_eq(concl thm)))) [
	("100.2.1",
	PC_C1 "'ℝ" rewrite_conv[],
	⌜2/4⌝, ⌜1/2⌝),
	("100.2.2",
	PC_C1 "'ℝ" rewrite_conv[],
	⌜3/12⌝, ⌜1/4⌝)
];
=TEX

=SML
store_mt_results
mt_run [
	("100.3.1",
	sort ℝ_term_order,
	[⌜2/3⌝, ⌜1/2⌝], [⌜1/2⌝, ⌜2/3⌝]),
	("100.3.2",
	sort ℝ_term_order,
	[⌜2/4⌝, ⌜1/2⌝], [⌜1/2⌝, ⌜2/4⌝]),
	("100.3.3",
	sort ℝ_term_order,
	[⌜4/2⌝, ⌜ℕℝ 2⌝], [⌜ℕℝ 2⌝, ⌜4/2⌝]),
	("100.3.4",
	sort ℝ_term_order,
	[⌜4/0⌝, ⌜4/1⌝], [⌜4/0⌝, ⌜4/1⌝]),
	("100.3.5",
	sort ℝ_term_order,
	[⌜x:ℝ⌝, ⌜~2. * x⌝], [⌜x:ℝ⌝, ⌜~2. * x⌝])
];
=TEX

=SML
store_mt_results
mt_run [
	("100.4.1",
	sort ℝ_term_order,
	[⌜(x:ℝ)*z⌝, ⌜(x:ℝ)*y⌝, ⌜(x:ℝ)*y*z⌝],
	[⌜(x:ℝ)*y⌝, ⌜(x:ℝ)*y*z⌝, ⌜(x:ℝ)*z⌝]),
	("100.4.2",
	sort ℝ_term_order,
	[⌜(x:ℝ)*y*z⌝, ⌜(x:ℝ)*y^2⌝, ⌜(x:ℝ)*y^2*z⌝],
	[⌜(x:ℝ)*y^2⌝, ⌜(x:ℝ)*y*z⌝, ⌜(x:ℝ)*y^2*z⌝]),
	("100.4.3",
	sort (ℝ_term_order1{graded=false, inverse=false}),
	[⌜(x:ℝ)*z⌝, ⌜(x:ℝ)*y⌝, ⌜(x:ℝ)*y*z⌝],
	[⌜(x:ℝ)*z⌝, ⌜(x:ℝ)*y⌝, ⌜(x:ℝ)*y*z⌝]),
	("100.4.4",
	sort (ℝ_term_order1{graded=false, inverse=false}),
	[⌜(x:ℝ)*y*z⌝, ⌜(x:ℝ)*y^2⌝, ⌜(x:ℝ)*y^2*z⌝],
	[⌜(x:ℝ)*y*z⌝, ⌜(x:ℝ)*y^2⌝, ⌜(x:ℝ)*y^2*z⌝]),
	("100.4.5",
	sort (ℝ_term_order1{graded=false, inverse=true}),
	[⌜(x:ℝ)*z⌝, ⌜(x:ℝ)*y⌝, ⌜(x:ℝ)*y*z⌝],
	[⌜(x:ℝ)*y⌝, ⌜(x:ℝ)*z⌝, ⌜(x:ℝ)*y*z⌝]),
	("100.4.6",
	sort ℝ_term_order,
	[⌜x:ℝ⌝, ⌜y:ℝ⌝, ⌜z:ℝ⌝],
	[⌜x:ℝ⌝, ⌜y:ℝ⌝, ⌜z:ℝ⌝]),
	("100.4.7",
	sort (ℝ_term_order1{graded=false, inverse=false}),
	[⌜x:ℝ⌝, ⌜y:ℝ⌝, ⌜z:ℝ⌝],
	[⌜z:ℝ⌝, ⌜y:ℝ⌝, ⌜x:ℝ⌝]),
	("100.4.8",
	sort (ℝ_term_order1{graded=false, inverse=true}),
	[⌜x:ℝ⌝, ⌜y:ℝ⌝, ⌜z:ℝ⌝],
	[⌜x:ℝ⌝, ⌜y:ℝ⌝, ⌜z:ℝ⌝]),
	("100.4.9",
	sort (ℝ_term_order1{graded=true, inverse=false}),
	[⌜(x:ℝ)*z^6⌝, ⌜(x:ℝ)*y^8⌝, ⌜(x:ℝ)*y*z^20⌝],
	[⌜(x:ℝ)*z^6⌝, ⌜(x:ℝ)*y^8⌝, ⌜(x:ℝ)*y*z^20⌝])
];
=TEX

=SML
store_mt_results
mt_run [
	("100.5.1",
	sort ℝ_term_order,
	[⌜(x:ℝ)*z⌝, ⌜(x:ℝ)*y⌝, ⌜(x:ℝ)^2*y⌝, ⌜(x:ℝ)^(n+1)*y⌝],
	 [⌜(x:ℝ)*y⌝, ⌜(x:ℝ)^2*y⌝, ⌜(x:ℝ)^(n+1)*y⌝, ⌜(x:ℝ)*z⌝]),
	("100.5.2",
	sort ℝ_term_order,
	[⌜(x:ℝ)^2⌝, ⌜(x:ℝ)^(2+2)⌝, ⌜(x:ℝ)⌝],
	[⌜(x:ℝ)⌝, ⌜(x:ℝ)^2⌝, ⌜(x:ℝ)^(2+2)⌝])
];
=TEX

=SML
store_mt_results
mt_run [
	("100.6.1",
	map (dest_ℕ o snd o dest_ℝ_ℕ_exp) o sort ℝ_term_order,
	map (fn n => mk_ℝ_ℕ_exp(⌜x:ℝ⌝, mk_ℕ n)) (integer_interval 1 20),
	integer_interval 1 20)
];
=TEX

=SML
store_mt_results
mt_run [
	("100.7.1",
	conv_rhs (rewrite_conv[let_def] THEN_C ℝ_anf_conv),
	⌜let g(x, y) = 12.*x^2 + 7.*x*y - 12.*y^2 in g(7.*t, 1.*t)⌝,
	⌜625. * t^2⌝)
];
=TEX

=SML
store_mt_results
mt_run_fail [
	("100.8.1",
	ℝ_anf_conv,
		 ⌜(f:ℝ → ℝ) x ^ 2⌝,
	gen_fail_msg "ℝ_anf_conv" 116318 ["⌜f x ^ 2⌝"])
];
=TEX

=SML
store_mt_results
mt_run [
	("100.9.1",
	conv_rhs ℝ_anf_conv,
		⌜1. / (3. ^ 2 + 2. ^ 2) ⌝,
	⌜1/13⌝)
];
=TEX

=TEX
\section{END OF TESTS}
=SML
diag_string(summarize_mt_results());
=TEX
\end{document}









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

\def\Title{ Higher-Order Matching: Module Tests }

\def\Abstract{\begin{center}
{\bf Abstract}\par\parbox{0.7\hsize}
{\small This document gives the module tests for the higher-order matching module.}
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
\item[Issue 1.1 (2009/09/11)] First draft (place-holder).
\item[Issue 1.2 (2010/11/17)] First complete version.
\item[Issue 1.3 (2011/02/20)] Added tests for cases where there are $\eta$-redexes in
the pattern.
\item[Issue 1.4 (2011/02/26)] Renamed $ho\_match$ on $simple\_ho\_match$ to make
way for a future implementation of the Fettig/L\"{o}chner algborithm later.
\item[Issue 1.5 (2012/02/21)] Allowed for new parameter to $simple\_ho\_match$ and added tests for new rigid variable feature.
\item[Issue 1.6 (2012/05/06)] Added regression test for fix to new rigid variable feature.
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

\section{INTRODUCTION}
\subsection{Scope}
This document contains the module tests associated with the higher-order matching function.
required by \cite{LEMMA1/HOL/DTD120} and
implemented in \cite{LEMMA1/HOL/IMP120}.
\subsection{Introduction}
\subsubsection{Purpose and Background}
See \cite{LEMMA1/HOL/DTD120}.
\subsubsection{Dependencies}
The test material depends on \cite{DS/FMU/IED/DTD013} and \cite{DS/FMU/IED/IMP013}.

\subsubsection{Deficiencies}
None known.
\section{INITIALISATION}
Initialise the test package:
=SML
use_file "dtd013.sml";
use_file "imp013.sml";
init_mt_results ();
=TEX
=TEX
=SML
fun gen_term_fail_msg area num tms = (
	gen_fail_msg area num (map string_of_term tms)
);
=TEX
=SML
open_theory "basic_hol";
new_theory"mdt120";
new_const("II", ⓣ'a → 'a⌝);
=TEX
\section{TEST CASES}


\section{THE TESTS}
\subsection{Group 1: Atoms}
=SML
store_mt_results
mt_run [
("120.simple_ho_match.1.1",
	uncurry (simple_ho_match[]),
		( ⌜ x:'a ⌝ , ⌜ y:'a ⌝ ),
			([], [(⌜x:'a⌝, ⌜y:'a⌝)]) ),
("120.simple_ho_match.1.2",
	uncurry (simple_ho_match[]),
		( ⌜ 1 ⌝ , ⌜ 1 ⌝ ),
			([], []) ),
("120.simple_ho_match.1.3",
	uncurry (simple_ho_match[]),
		( ⌜ 1 ⌝ , ⌜ y ⌝ ),
			([(ⓣℕ⌝, ⓣ'a⌝)], [(⌜1⌝, ⌜y:ℕ⌝)]) )];
=TEX
=SML
store_mt_results
mt_run_fail [
("120.simple_ho_match.1.4",
	uncurry (simple_ho_match[]),
		( ⌜ 1 ⌝ , ⌜ 2 ⌝ ),
			gen_term_fail_msg "simple_ho_match" 120001 [⌜1⌝, ⌜2⌝] )];

=TEX
\subsection{Group 2: λ-abstractions}
=SML
store_mt_results
mt_run [
("120.simple_ho_match.2.1",
	uncurry (simple_ho_match[]),
		( ⌜ λx:'a ⦁ x⌝ , ⌜ λy:'a ⦁ y⌝ ),
			([], []) ),
("120.simple_ho_match.2.2",
	uncurry (simple_ho_match[]),
		( ⌜ λx:'a ⦁ x ⌝ , ⌜ λy : 'a ⦁ (p y) : 'b ⌝ ),
			([(ⓣ'a⌝, ⓣ'b⌝)], [(⌜(λx⦁ x): 'a → 'a⌝, ⌜p:'a → 'a⌝)]) ),
("120.simple_ho_match.2.3",
	uncurry (simple_ho_match[]),
		( ⌜ λx:ℕ ⦁ f x : ℕ ⌝ , ⌜ p:'b ⌝ ),
			([(ⓣℕ → ℕ⌝, ⓣ'b⌝)], [(⌜ λx:ℕ ⦁ f x : ℕ ⌝, ⌜p:ℕ → ℕ⌝)]) ),
("120.simple_ho_match.2.4",
	uncurry (simple_ho_match[]),
		( ⌜ λx:ℕ ⦁ x + 1 ⌝ , ⌜ λy:'a⦁ t y:'a ⌝ ),
			([(ⓣℕ⌝, ⓣ'a⌝)], [(⌜ λ x⦁ x + 1 ⌝, ⌜t:ℕ → ℕ⌝)]) )];
=TEX
\subsection{Group 3: applications}
=SML
store_mt_results
mt_run [
("120.simple_ho_match.3.1",
	uncurry (simple_ho_match[]),
		( ⌜ (λx⦁x) (λx:'a ⦁ x) ⌝ , ⌜ (λy⦁y)  (λy : 'a ⦁ (p y) : 'b ) ⌝ ),
			([(ⓣ'a⌝, ⓣ'b⌝)], [(⌜(λx⦁ x): 'a → 'a⌝, ⌜p:'a → 'a⌝)])  ),
("120.simple_ho_match.3.2",
	uncurry (simple_ho_match[]),
		( ⌜ II (λx:'a ⦁ x) ⌝ , ⌜  II (λy : 'a ⦁ (p y) : 'b ) ⌝ ),
			([(ⓣ'a⌝, ⓣ'b⌝)], [(⌜(λx⦁ x): 'a → 'a⌝, ⌜p:'a → 'a⌝)])  )];

=TEX
\subsection{Group 4: η-redexes in the pattern}
=SML
=IGN
val s =  ⌜ (P : ('a → 'b) → 'c) X ⌝;
val t = ⌜ ((λx⦁G x) : ('a → 'b) → 'c) Y⌝
val (tym, tmm) = simple_ho_match [] s t;
val t1 = inst [] tym t;
val t2 = subst tmm t1;
val t3 = MAP_C β_conv t2;
val rvars = [⌜f : 'a → 'b⌝] : TERM list;
val rvars = [] : TERM list;
val s =  ⌜ x : 'a  ⌝
val t = ⌜ X : 'b⌝ ;
simple_ho_match []  ⌜ x : 'a  ⌝  ⌜ y : 'b⌝ ;
simple_ho_match []  s  t ;
=SML
fun check_ho_match_results rvars (s, t) = (
	let	val (tym, tmm) = simple_ho_match rvars s t;
		val t1 = inst [] tym t;
		val t2 = subst tmm t1;
		val t3 = snd(dest_eq(concl(TRY_C(MAP_C β_conv THEN_TRY_C rewrite_conv[η_axiom])t2)));
		val s1 = snd(dest_eq(concl(TRY_C(rewrite_conv[η_axiom])s)));
	in	s1 ~=$ t3
	end
);
=TEX
=SML
store_mt_results
mt_run [
("120.simple_ho_match.4.1",
	check_ho_match_results [],
		( ⌜ P : 'a → 'b  ⌝ , ⌜ λx⦁ (G : 'b → 'a) x⌝ ),
			true ),
("120.simple_ho_match.4.2",
	check_ho_match_results [],
		( ⌜ (P : ('a → 'b) → 'c) X ⌝ ,
		⌜ (G : ('a → 'b) → 'c) (λx⦁ H x)⌝ ),
			true  ),
("120.simple_ho_match.4.3",
	check_ho_match_results [],
		( ⌜ (P : ('a → 'b) → 'c) X ⌝ ,
		⌜ ((λx⦁G x) : ('a → 'b) → 'c) Y⌝ ),
			true )];
=IGN

=TEX
\subsection{Group 5: rigid variables}
120.simple\_ho\_match.5.1.2 below is just to check that this match does not fail for some other reason in 120.simple\_ho\_match.5.2.2.
=SML
store_mt_results
mt_run [
("120.simple_ho_match.5.1.1",
	check_ho_match_results [⌜f : 'a → 'b⌝],
		( ⌜ λa⦁ (f : 'a → 'b)(q x a) ⌝ , ⌜λx⦁ (f : 'a → 'b)(t x)⌝ ),
			true ),
("120.simple_ho_match.5.1.2",
	check_ho_match_results [],
		( ⌜ x : 'a  ⌝ , ⌜ X : 'b⌝ ),
			true ),
("120.simple_ho_match.5.1.3",
	check_ho_match_results [⌜r : ℕ → ℕ⌝],
		( ⌜ λi⦁ r i + i + 2 ⌝ , ⌜λx⦁ f x⌝ ),
			true )];
=TEX
120.simple\_ho\_match.5.2.1 fails because the pattern is not linear unless $f$ is treated as a rigid variable.
=SML
store_mt_results
mt_run_fail [
("120.simple_ho_match.5.2.1",
	uncurry (simple_ho_match []),
		( ⌜ λa⦁ (f : 'a → 'b)(q x a) ⌝ , ⌜λx⦁ (f : 'a → 'b)(t x)⌝ ),
			gen_fail_msg "simple_ho_match" 120001 ["⌜λ a⦁ f (q x a)⌝", "⌜λ x⦁ f (t x)⌝"]),
("120.simple_ho_match.5.2.2",
	uncurry (simple_ho_match [⌜t : 'b⌝]),
		( ⌜ x : 'a  ⌝ , ⌜ X : 'b⌝ ),
			gen_fail_msg "simple_ho_match" 120001 ["⌜x⌝", "⌜X⌝"] )];
=TEX

=TEX
\section{END OF TESTS}
=SML
diag_string(summarize_mt_results());
=TEX
\end{document}









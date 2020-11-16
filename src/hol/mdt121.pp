=IGN
********************************************************************************
mdt121.doc: this file is part of the PPHol system

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

\def\Title{ Theorem Finder: Module Tests }

\def\Abstract{\begin{center}
{\bf Abstract}\par\parbox{0.7\hsize}
{\small This document gives the module tests for tools for querying the theory hierarchy to find theorems satisfying specified conditions.}
\end{center}}

\def\Reference{LEMMA1/HOL/MDT121}

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
\item[Issue 1.1 (2010/10/16)] First draft.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.
\item[2015/02/23]
Fixed typos in the red tape.
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
This document contains the module tests associated with the tools for querying the theory hierarchy to find theorems satisfying specified conditions.
required by \cite{DS/FMU/IED/DTD120} and
implemented in \cite{DS/FMU/IED/IMP120}.
\subsection{Introduction}
\subsubsection{Purpose and Background}
See \cite{DS/FMU/IED/DTD040}.
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
\section{TEST CASES}
Due to the simple nature of the implementation we just test a sample of the functionality.

\section{THE TESTS}
=SML
open_theory"basic_hol";
new_theory"mdt121";
set_pc "predicates";
new_const("C1", ⓣ'a⌝);
new_const("C2", ⓣ'a → 'b⌝);
new_axiom (["AX1"], ⌜∀x:ℕ⦁ C2 x = εy:ℕ⦁F⌝);
new_axiom (["AX2"], ⌜∀x:BOOL⦁ C2 x = εy:BOOL⦁T⌝);
ⓈHOLCONST
│ ⦏C3⦎ : ℕ → ℕ
├──────
│ ∀x⦁ C3 x = x + 42
■
ⓈHOLCONST
│ ⦏C4⦎ : BOOL → BOOL → BOOL
├──────
│ ∀x y⦁ C4 x y = ¬x ∧ ¬y
■
=SML
save_thm("thm1", refl_conv ⌜C1⌝);
save_thm("thm2", ∧_intro (refl_conv ⌜C3⌝) (refl_conv ⌜C4⌝));
save_thm("thm3", ∧_intro (refl_conv ⌜C4⌝) (refl_conv ⌜C3⌝));
=SML
store_mt_results
mt_run [
	("121.find_thm.1.1", #names o hd o find_thm, [⌜42⌝], ["C3"]),
	("121.find_thm.1.2", #names o hd o find_thm, [⌜v = ¬a ∧ ¬b⌝], ["C4"]),
	("121.find_thm.1.3", #names o hd o find_thm, [⌜εa:ℕ⦁b⌝], ["AX1"]),
	("121.find_thm.1.4", #names o hd o find_thm, [⌜εa:BOOL⦁b⌝], ["AX2"]),
	("121.find_thm.1.5", #names o hd o find_thm, [⌜C1⌝], ["thm1"])
];
=TEX
=SML
store_mt_results
mt_run [
	("121.find_thm.2.1", length o find_thm, [⌜42⌝], 1),
	("121.find_thm.2.2", length o find_thm, [⌜v = ¬a ∧ ¬b⌝], 1),
	("121.find_thm.2.3", length o find_thm, [⌜εa:ℕ⦁b⌝], 1),
	("121.find_thm.2.4", length o find_thm, [⌜εa:BOOL⦁b⌝], 1),
	("121.find_thm.2.5", length o find_thm, [⌜C1⌝], 1)
];
=TEX
=SML
store_mt_results
mt_run [
	("121.find_thm.3.1", length o find_thm, [⌜C1⌝, ⌜C2⌝], 0),
	("121.find_thm.3.2", length o find_thm, [⌜C3⌝, ⌜C4⌝], 2)
];
=TEX
=SML
store_mt_results
mt_run [
	("121.gen_find_thm.1.1", #names o hd o gen_find_thm,
		any_submatch_tt[⌜x:IND⌝], ["Is_ℕ_Rep", "is_ℕ_rep_def"]),
	("121.gen_find_thm.1.2", #names o hd o gen_find_thm,
		any_subterm_tt[⌜C1⌝], ["thm1"])
];
=TEX
=SML
switch gen_find_thm_in_theories ["-"] (all_subterm_tt[]) ;
store_mt_results
mt_run [
	("121.gen_find_thm_in_theories.1.1", length o switch gen_find_thm_in_theories ["-"],
		all_subterm_tt[],
			length (get_axioms"-") + length(get_defns"-") + length(get_thms"-")),
	("121.gen_find_thm_in_theories.1.2", length o switch gen_find_thm_in_theories ["-"],
		TAll[any_submatch_tt[⌜C3⌝]],
			3),
	("121.gen_find_thm_in_theories.1.3", length o switch gen_find_thm_in_theories ["-"],
		TAll[any_submatch_tt[⌜C3⌝], no_subterm_tt[⌜C4⌝]],
			1),
	("121.gen_find_thm_in_theories.1.4", length o switch gen_find_thm_in_theories ["-"],
		TAll[any_submatch_tt[⌜C3⌝], no_subterm_tt[⌜C4⌝, ⌜42⌝]],
			0)
];
=TEX
\section{END OF TESTS}
=SML
diag_string(summarize_mt_results());
=TEX
\end{document}









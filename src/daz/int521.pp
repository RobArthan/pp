=IGN
********************************************************************************
int521.doc: this file is part of the PPDaz system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
=TEX
%%%%% YOU MAY WANT TO CHANGE POINT SIZE IN THE FOLLOWING:
\documentclass[a4paper,12pt]{article}

%%%%% YOU CAN ADD OTHER PACKAGES AS NEEDED BELOW:
\usepackage{A4}
\usepackage{Lemma1}
\usepackage{ProofPower}
\usepackage{epsf}

%%%%% YOU WILL USUALLY WANT TO CHANGE THE FOLLOWING TO SUIT YOU AND YOUR DOCUMENT:

\def\Title{ Spring 2002 Enhancement Tests }

\def\Abstract{\begin{center}
{\bf Abstract}\par\parbox{0.7\hsize}
{\small This document provides integration tests to support the enhancements developed
under the enhancements programme carried out in late 2001.}
\end{center}}

\def\Reference{LEMMA1/DAZ/INT521}

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
\underscoreoff
\headsep=0mm
\FrontPage
\headsep=10mm

%%%%% STANDARD RED-TAPE SECTIONS (MAY WANT TO INTERLEAVE SOME \newpage COMMANDS IN THESE)

%%%%% CONTENTS:

\subsection{Contents}

\tableofcontents

%%%%% REFERENCES:

\subsection{References}

\bibliographystyle{fmu}

%%%%% CHANGE THE FOLLOWING AS NECESSARY (E.G., TO PICK UP daz.bib):
h{\raggedright
\bibliography{fmu,daz}
}
%%%%% CHANGES HISTORY:
\subsection{Changes History}
\begin{description}
\item[Issues 1.1 (2002/03/20)-1.2 (2002/03/21)] First drafts
\item[Issues \Version] 2.5.4 bug 7 has been withdrawn.
\item[Issue 1.5 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.6 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.7 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.8 (2004/01/19)] The Z universal set is now called 𝕌
\item[Issue 1.9 (2006/03/17)] Allowed for enhancement 117.
\item[Issue 1.10 (2006/03/28)] Allowed for automated state management.
\item[Issue 1.12 (2006/04/20)] Ada real literals are now translated into Z floating point literals.
\item[Issue 1.13 (2006/06/26)] Made it set the current theory properly on start-up.
\item[Issue 1.14 (2006/09/19)] Allowed for enhancement 165.
\item[Issue 1.15 (2008/02/10)] Allowed for change to lexical rules for underscores in Z.
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
\begin{center}
\begin{tabular}{ll}
Rob Arthan & Lemma 1
\end{tabular}
\end{center}


\section{INTRODUCTION}\label{INTRODUCTION}
This document is intended to provide integration tests to cover
the enhancements undertaken under the programme
of enhancements carried out in Spring 2002. See \cite{LEMMA1/DAZ/HLD509}
for the detailed specification of the enhancements.

The interim releases of the Compliance Tool have been
fully regression-tested and the new features have been module-
and integration-tested to a certain extent by the existing tests.
This document provides specific integration tests to
complete the coverage.
\section{PREAMBLE}
Load the test harness.

=SML
use_file "dtd013";
use_file "imp013";
=TEX
Function to clean up before doing a test.

=SML
fun clean_up () = (
        let     val thys = (get_descendants "cn" less "cn"
                                        diff get_cache_theories())
                fun del_thy thy = (force_delete_theory thy handle Fail _ => ())
        in      map del_thy thys
        end;    ()
);
=TEX
=TEX
For batch use turn off subgoal package output:
=SML
set_flag("subgoal_package_quiet", not(ExtendedIO.is_term_in std_in));
=TEX
\section{THE TESTS}
\subsection{R0002: Spring 2002 Efficiency Issues} \label{ROne}
\subsection{R0031/R0069: {\tt Xpp} enhancements} \label{RTwo}
\subsection{R0047/R0054: Renaming declarations and use clauses} \label{RThree}
\subsection{R0048: {\tt Use type} clauses} \label{RFour}
\subsection{R0049: Generic Packages and Subprograms} \label{RFive}
\subsection{R0050: Discriminants} \label{RSix}
\subsection{R0051: Default parameters} \label{RSeven}
\subsection{R0052: Block statements} \label{REight}
\subsection{R0053/R0073: Loop names, exits from named loops, return statements} \label{RNine}
\subsection{R0055: Warnings for non-SPARK constructs} \label{RTen}
\subsection{R0056: Default parameter modes} \label{REleven}
\subsection{R0057: Script management facilities} \label{RTwelve}
\subsection{R0058: Forward declarations of subprograms} \label{RThirteen}
\subsection{R0059: Enhanced syntax-check-only mode} \label{RFourteen}
\subsection{R0060/R0064: Rationalised error reporting} \label{RFifteen}
\subsection{R0061: Change symbol for statement replacement} \label{RSixteen}
\subsection{R0062: Origin of VCs} \label{RSeventeen}
\subsection{R0063: Unexpanded specification statements} \label{REighteen}
\subsection{R0065: Duplicated names in context clauses} \label{RNineteen}
\subsection{R0066: Auxiliary variables in function $\Xi $-lists} \label{RTwenty}
\subsection{R0067: Schema references in function $\Xi $-lists} \label{RTwentyOne}
\subsection{R0071: Multiple underscores in Z identifiers} \label{RTwentyTwo}
\subsection{R0068: Poly/ML problems and other bug-fixing} \label{RTwentyThree}
\subsubsection{pp2.5.4-bug1/R0042}
There are specific tests for the detailed changes to the treatment of aliases in {\ProductHOL}
in the relevant HOL module tests.
We give an explicit test here for the problem as reported by QinetiQ.
=SML
clean_up();
open_theory"cn";
val b1_thm = (hd o rev o strip_∧_rule o z_get_spec)ⓩ(abs⋎R _)⌝;
=SML
store_mt_results
mt_run
 [("bugs.1.1", (PrettyPrinter.format_term true o concl), b1_thm,
	["ⓩ∀ x : ℝ ⦁ abs⋎R x = ⌜Abs x⌝⌝"])];
=TEX
\subsubsection{pp2.5.4-bug2}
Explicitly tested here:
=SML
clean_up();
new_script{name = "PACK", unit_type="spec"};
ⓈCN
package Pack is
  type Rec is record A, B : Integer; end record;
  procedure P (X : in out Integer);
  procedure Q (X : in out Rec);
end Pack;
■
=SML
new_script{name = "PACK", unit_type="body"};
ⓈCN
package body Pack is
  procedure P (X : in out Integer)
  Δ X [ X = 22 ]
  is separate;
  procedure Q (X : in out Rec)
  is separate;
end Pack;
■
=SML
new_script{name = "PACK.P", unit_type="proc"};
ⓈCN
separate (Pack)
procedure P (X : in out Integer)
Δ X [ X = 22 ]
is
begin
  X := 22;
end P;
■
=SML
new_script{name = "PACK.Q", unit_type="proc"};
ⓈCN
separate (Pack)
procedure Q (X : in out Rec)
Δ X [ X.A = 22 ]
is
  V : Integer;
begin
  P(V);
  X.A := V;
end Q;
■
With the bug the last web clause made the tool raise an exception.
=SML
set_pc"cn1";
set_goal([], get_conjecture"-""vcPACKoQ_2");
a(rewrite_tac[z_gen_pred_elim[ⓩ𝕌⌝](z_get_specⓩPACKoRECuA⌝)]);
a(cn_vc_simp_tac[]);
store_mt_results
(mt_runf (op =$))
 [("bug.2.1", snd o dest_thm o pop_thm , (), get_conjecture"-""vcPACKoQ_2")];
=TEX
\subsubsection{pp2.5.4-bug4}
Tested in INT511.
\subsubsection{pp2.5.4-bug5}
Tested in INT511.
\subsubsection{pp2.5.4-bug6}
=SML
clean_up();
new_script{name = "TEST", unit_type="proc"};
ⓈCN
procedure Test is
  C1 : constant Float := Float(55);
  C2 : constant Float := Float(55.7);
begin
  null;
end Test;
■
=SML
set_pc"cn1";
set_goal([], ⓩC1 = 55.0 ∧ C2 = 55.7⌝);
a(rewrite_tac(map z_get_spec[ⓩC1⌝,ⓩC2⌝, ⓩinteger_to_real⌝]));
a(PC_T1 "z_ℝ_lin_arith" prove_tac[]);
store_mt_results
(mt_runf (op =$))
 [("bug.6.1", snd o dest_thm o pop_thm , (), ⓩC1 = 55.0 ∧ C2 = 55.7⌝)];
=TEX
\subsubsection{pp2.5.4-bug7}
At release 2.5.7 and later this bug becomes irrelevant --- the syntactic restriction
on return statements have been dropped.
=TEX
\subsubsection{R0046}
\subsubsection{R0075}
=TEX
\section{EPILOGUE}
=SML
diag_line(summarize_mt_results());
=TEX
\end{document}

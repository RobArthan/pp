=IGN
********************************************************************************
int003.doc: this file is part of the PPZed system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
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

\def\Title{Integration Tests for the ProofPower-Z System}

\def\AbstractText{This document provides a description of the {\ProductZ} system integration tests.}

\def\Reference{DS/FMU/IED/INT003}

\def\Author{K.Blackburn}


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
%% LaTeX2e port: \documentstyle[hol1,11pt,TQ]{article}
%% LaTeX2e port: \ftlinepenalty=9999
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{FST Project}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Integration Tests for the ProofPower-Z System}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/INT003}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.17 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2004/01/19 12:44:00 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.Blackburn & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & Project Manager}
%% LaTeX2e port: \TPPabstract{This document provides a description of the \ProductZ{} system integration tests.}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	    Library
%% LaTeX2e port: }}
%% LaTeX2e port: \begin{document}
%% LaTeX2e port: \makeTPPfrontpage
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
\pagebreak
\section{DOCUMENT CONTROL}
\subsection{Contents List}
\tableofcontents
\subsection{Document Cross References}
\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes History}
\begin{description}
\item[Issue 1.1 (1992/10/20),1.2 (1992/10/20),1.3 (1992/10/21)]
First drafts.
\item[Issue 1.4 (1992/10/22) (13th November 1992)]
Updated for Z build 1.32.
\item[Issue 1.9 (1992/12/11) (11th December 1992)]
Global rename from wrk038.doc issue 1.9.
\item[Issue 1.10 (1992/12/11) (11th December 1992)]
Fixing theory usage.
\item[Issue 1.11 (1993/02/10),1.12 (1993/02/11) (10th-11th February 1993)]
Reacting to changes in proof contexts, etc.
\item[Issue 1.13 (1993/02/23) (23rd February 1993)]
Highlighting errors, changing parent theory.
\item[Issue 1.14 (1996/01/22) (22nd January 1996)]
Corrected use of fake test harness.
\item[Issue 1.15 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.16 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.17 (2004/01/19)] The Z universal set is now called 𝕌.
\item[Issue 1.18 (2006/02/02)] Functional composition is now called ``∘''.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported PPZed to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
%\subsection{Changes Forecast}
\section{GENERAL}
\subsection{Scope}\label{Scope}
This document provides either a description of, or reference for, the \ProductZ{} system integration tests,
called for in
\cite{DS/FMU/IED/HLD015},
and the high level designs it introduces.
This is a supplement to the integration tests for \ProductHOL{}
of \cite{DS/FMU/IED/INT001}.
\subsection{Introduction}
\subsubsection{Purpose and Background}
This document concerns the integration tests for the \ProductZ{} system, excluding the generic HOL support tools.
It either describes the tests to be made, or gives a reference
to the test documents.

\subsubsection{Dependencies}
This document must satisfy the requirements of all the high level designs covered in the scope of this document (section \ref{Scope}).
To be tested, material claimed to satisfy the high level designs must also exist, as must the build and test tools of
\cite{DS/FMU/IED/HLD013}.
\subsubsection{Deficiencies}
Only the proof support area is initially addressed,
and that only for preidctaes and library set theory.
T.B.A.'s are given for other areas that require testing,
or they are just omitted.
\subsubsection{Changes Forecast}
Addressing the deficiences.
\section{REQUIREMENTS}
T.B.A.
\section{PROOF SUPPORT}
The integration test for this section is passed if the following
can be successfully run:
=GFT
docsml int003
hol -d zed
:> use_file "int003";
:> quit();
y
=TEX
without failures.
The following allows the script to be used as an integration test in \cite{DS/FMU/IED/IMP021}.
=SML
fun  ⦏summarize_mt_results⦎ () =
	"++++ Compilation of int003.sml halted unexpectedly ++++";
=TEX

The following tests also provide some parsing/type checking/printing tests, as a side-effect.
\subsection{Utilities}
The following functions are intended for application to a list
of goal terms, printing each as the prof succeeds, so that
it can be determined where in the list, if anywhere,
the proof failed.

The following uses just the current proof context's stripping rules, embedded in the contradiction tactic:
=SML
fun ⦏contr_prove⦎ (lst:TERM list) : unit = (
	map (diag_string o string_of_thm o
	(fn tm => tac_proof(([],tm), contr_tac))) lst;
	()
);
=TEX
There is no point trying the two-tactic approach on goals
that are proven by the above.

The following uses the current proof context's automated proof rules:
=SML
fun ⦏full_prove⦎ (lst:TERM list) : unit = (
	map (diag_string o string_of_thm o prove_rule[]) lst;
	()
);
=TEX
The following uses the current proof context's stripping,
supplimented by three uses of $all\-\_asm\-\_fc\-\_tac$:
=SML
fun ⦏fc_prove⦎ (lst:TERM list) : unit = (
	map (diag_string o string_of_thm o
		(fn tm => tac_proof(([],tm),
			z_fc_prove_tac[]))) lst;
	()
);
=TEX
In this document goals that cannot be processed by $contr\_prove$ will also be proven by the two-tactic method.

\subsection{Predicate Calculus}
=SML
open_theory "z_language_ps";
new_theory "int003_thy";
set_pc "z_predicates";
=TEX
Two tactic approach:
=SML
set_goal([],ⓩ(∀x, y:X⦁ P x ⇒ R y)
	⇔ (∀v, w:X⦁ ¬ P w ∨ R v)⌝);
a(contr_tac);
(* *** Goal "1" *** *)
a (z_spec_nth_asm_tac 5 ⓩ(x ≜ w, y ≜ v)⌝);
(* *** Goal "2" *** *)
a (z_spec_nth_asm_tac 5 ⓩ(v ≜ y, w ≜ x)⌝);
pop_thm();
=TEX

=SML
(* Results from Principia Mathematica *2 *)
val PM2 =[
ⓩ(* *2.02 *) q ⇒ ( p ⇒ q)⌝,
ⓩ(* *2.03 *) (p ⇒ ¬ q) ⇒ (q ⇒ ¬ p)⌝,
ⓩ(* *2.15 *) (¬ p ⇒ q) ⇒ (¬ q ⇒ p)⌝,
ⓩ(* *2.16 *) (p ⇒ q) ⇒ (¬ q ⇒ ¬ p)⌝,
ⓩ(* *2.17 *) (¬ q ⇒ ¬ p) ⇒ (p ⇒ q)⌝,
ⓩ(* *2.04 *) (p ⇒ q ⇒ r) ⇒ (q ⇒ p ⇒ r)⌝,
ⓩ(* *2.05 *) (q ⇒ r) ⇒ (p ⇒ q) ⇒ (p ⇒ r)⌝,
ⓩ(* *2.06 *) (p ⇒ q) ⇒ (q ⇒ r) ⇒ (p ⇒ r)⌝,
ⓩ(* *2.08 *) p ⇒ p⌝,
ⓩ(* *2.21 *) ¬ p ⇒ (p ⇒ q)⌝];
=TEX
=SML
contr_prove PM2;
=TEX
=SML
(* Results from Principia Mathematica *3 *)
val PM3 =[
(* *3.01 *) ⓩp ∧ q ⇔ ¬(¬ p ∨ ¬ q)⌝,
(* *3.2  *) ⓩp ⇒ q ⇒ p ∧ q⌝,
(* *3.26 *) ⓩp ∧ q ⇒ p⌝,
(* *3.27 *) ⓩp ∧ q ⇒ q⌝,
(* *3.3  *) ⓩ(p ∧ q ⇒ r) ⇒ (p ⇒ q ⇒ r)⌝,
(* *3.31 *) ⓩ(p ⇒ q ⇒ r) ⇒ (p ∧ q ⇒ r)⌝,
(* *3.35 *) ⓩ(p ∧ (p ⇒ q)) ⇒ q⌝,
(* *3.43 *) ⓩ(p ⇒ q) ∧ (p ⇒ r) ⇒ (p ⇒ q ∧ r)⌝,
(* *3.45 *) ⓩ(p ⇒ q) ⇒ (p ∧ r ⇒ q ∧ r)⌝,
(* *3.47 *) ⓩ(p ⇒ r) ∧ (q ⇒ s) ⇒ (p ∧ q ⇒ r ∧ s)⌝];
=TEX
=SML
contr_prove PM3;
=TEX
=SML
(* Results from Principia Mathematica *4 *)
val PM4 =[
(* *4.1  *) ⓩp ⇒ q ⇔ ¬ q ⇒ ¬ p⌝,
(* *4.11 *) ⓩ(p ⇔ q) ⇔ (¬ p ⇔ ¬ q)⌝,
(* *4.13 *) ⓩp ⇔ ¬ ¬ p⌝,
(* *4.2  *) ⓩp ⇔ p⌝,
(* *4.21 *) ⓩ(p ⇔ q) ⇔ (q ⇔ p)⌝,
(* *4.22 *) ⓩ(p ⇔ q) ∧ (q ⇔ r) ⇒ (p ⇔ r)⌝,
(* *4.24 *) ⓩp ⇔ p ∧ p⌝,
(* *4.25 *) ⓩp ⇔ p ∨ p⌝,
(* *4.3  *) ⓩp ∧ q ⇔ q ∧ p⌝,
(* *4.31 *) ⓩp ∨ q ⇔ q ∨ p⌝,
(* *4.33 *) ⓩ(p ∧ q) ∧ r ⇔ p ∧ (q ∧ r)⌝,
(* *4.4  *) ⓩp ∧ (q ∨ r) ⇔ (p ∧ q) ∨ (p ∧ r)⌝,
(* *4.41 *) ⓩp ∨ (q ∧ r) ⇔ (p ∨ q) ∧ (p ∨ r)⌝,
(* *4.71 *) ⓩ(p ⇒ q) ⇔ (p ⇔ (p ∧ q))⌝,
(* *4.73 *) ⓩq ⇒ (p ⇔ (p ∧ q))⌝];
=TEX
=SML
contr_prove PM4;
=TEX
=SML
(* Results from Principia Mathematica *5 *)
val PM5 =[
(* *5.1  *) ⓩp ∧ q ⇒ (p ⇔ q)⌝,
(* *5.32 *) ⓩ(p ⇒ (q ⇔ r)) ⇒ ((p ∧ q) ⇔ (p ∧ r))⌝,
(* *5.6  *) ⓩ(p ∧ ¬ q ⇒ r) ⇒ (p ⇒ (q ∨ r))⌝];
=TEX
=SML
contr_prove PM5;
=TEX
=SML
(* Definitions from Principia Mathematica *9 *)
val PM9 =[
(* *9.01 *) ⓩ(¬ (∀x:X⦁ φx)) ⇔ (∃x: X⦁ ¬ φx)⌝,
(* *9.02 *) ⓩ(¬ (∃x:X⦁ φx) ⇔ (∀x:X⦁ ¬ φx))⌝,
(* *9.03 *) ⓩ(∀x:X⦁ φx ∨ p) ⇔ (∀x:X⦁ φx) ∨ p⌝,
(* *9.04 *) ⓩp ∨ (∀x:X⦁ φx) ⇔ (∀x:X⦁ p ∨ φx)⌝,
(* *9.05 *) ⓩ(∃ x:X⦁true) ⇒ ((∃x:X⦁ φx ∨ p) ⇔ (∃x:X⦁ φx) ∨ p)⌝,
(* *9.06 *) ⓩp ∨ (∃x:X⦁ φx) ⇔ p ∨ (∃x:X⦁ φx)⌝];
=TEX
=SML
full_prove PM9;
fc_prove PM9;
=TEX
=SML
set_goal([],nth 0 PM9);
a contr_tac;
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(x ≜ x)⌝);
(* *** Goal "2" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(x ≜ x)⌝);
pop_thm();
=TEX
=SML
set_goal([],nth 1 PM9);
a contr_tac;
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 3 ⓩ(x ≜ x)⌝);
pop_thm();
=TEX
=SML
set_goal([],nth 2 PM9);
a contr_tac;
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 4 ⓩ(x ≜ x)⌝);
(* *** Goal "2" *** *)
a(z_spec_nth_asm_tac 4 ⓩ(x ≜ x)⌝);
pop_thm();
=TEX
=SML
set_goal([],nth 3 PM9);
a contr_tac;
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 4 ⓩ(x ≜ x)⌝);
(* *** Goal "2" *** *)
a(z_spec_nth_asm_tac 4 ⓩ(x ≜ x)⌝);
pop_thm();
=TEX
=SML
set_goal([],nth 4 PM9);
a contr_tac;
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 2 ⓩ(x ≜ x')⌝);
(* *** Goal "2" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(x ≜ x')⌝);
(* *** Goal "3" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(x ≜ x)⌝);
pop_thm();
=TEX
=SML
set_goal([],nth 5 PM9);
a contr_tac;
pop_thm();
=TEX
=SML
val PM9b =[
(* *9.07 *) ⓩ(∃y:Y⦁true) ⇒ ((∀x:X⦁ φx) ∨ (∃y:Y⦁ ψy) ⇔ (∀x:X⦁∃y:Y⦁ φx ∨ ψy))⌝,
(* *9.08 *) ⓩ(∃y:Y⦁true) ⇒ ((∃y:Y⦁ ψy) ∨ (∀x:X⦁ φx) ⇔ (∀x:X⦁∃y:Y⦁ ψy ∨ φx))⌝];
=TEX
=SML
full_prove PM9b;
fc_prove PM9b;
=TEX
=SML
set_goal([],nth 0 PM9b);
a contr_tac;
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(y ≜ y)⌝);
a(z_spec_nth_asm_tac 5 ⓩ(x ≜ x)⌝);
(* *** Goal "2" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(y ≜ y')⌝);
(* *** Goal "3" *** *)
a(z_spec_nth_asm_tac 4 ⓩ(x ≜ x)⌝);
a(z_spec_nth_asm_tac 3 ⓩ(y ≜ y')⌝);
pop_thm();
=TEX
=SML
set_goal([],nth 1 PM9b);
a contr_tac;
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(y ≜ y')⌝);
(* *** Goal "2" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(y ≜ y)⌝);
a(z_spec_nth_asm_tac 5 ⓩ(x ≜ x)⌝);
(* *** Goal "3" *** *)
a(z_spec_nth_asm_tac 4 ⓩ(x ≜ x)⌝);
a(z_spec_nth_asm_tac 5 ⓩ(y ≜ y')⌝);
pop_thm();
=TEX

=SML
(* Results from Principia Mathematica *10 *)
val PM10 =[
(* *10.01  *) ⓩ(∃x:X⦁ φx) ⇔ ¬ (∀y:X⦁ ¬ φy)⌝,
(* *10.1   *) ⓩ(∀x:𝕌⦁ φx) ⇒ φy⌝,
(* *10.21  *) ⓩ(∀x:X⦁ p ⇒ φx) ⇔ p ⇒ (∀y:X⦁ φy)⌝,
(* *10.22  *) ⓩ(∀x:X⦁ φx ∧ ψx) ⇔ (∀y:X⦁ φy) ∧ (∀z:X⦁ ψz)⌝,
(* *10.24  *) ⓩ(∀x:X⦁ φx ⇒ p) ⇔ (∃y:X⦁ φy) ⇒ p⌝,
(* *10.27  *) ⓩ(∀x:X⦁ φx ⇒ ψx) ⇒ ((∀y:X⦁ φy) ⇒ (∀z:X⦁ ψz))⌝,
(* *10.28  *) ⓩ(∀x:X⦁ φx ⇒ ψx) ⇒ ((∃y:X⦁ φy) ⇒ (∃z:X⦁ ψz))⌝,
(* *10.35  *) ⓩ(∃x:X⦁ p ∧ φx) ⇔ p ∧ (∃y:X⦁ φy)⌝,
(* *10.42  *) ⓩ(∃x:X⦁ φx) ∨ (∃y:X⦁ ψy) ⇔ (∃z:X⦁ φz ∨ ψz)⌝,
(* *10.5   *) ⓩ(∃x:X⦁ φx ∧ ψx) ⇒ (∃y:X⦁ φy) ∧ (∃z:X⦁ ψz)⌝,
(* *10.51  *) ⓩ (¬ (∃x:X⦁ φx ∧ ψx) ⇒ (∀y:X⦁ φy ⇒ ¬ ψy))⌝];
=TEX
=SML
full_prove PM10;
fc_prove PM10;
=TEX
Ones that cannot be done with $fc\_prove$
(because of asymmetry about $⇔$).
=SML
val PM10b =[
(* *10.271 *) ⓩ(∀x:X⦁ φx ⇔ ψx) ⇒ ((∀y:X⦁ φy) ⇔ (∀z:X⦁ ψz))⌝,
(* *10.281 *) ⓩ(∀x:X⦁ φx ⇔ ψx) ⇒ ((∃y:X⦁ φy) ⇔ (∃z:X⦁ ψz))⌝];
=SML
full_prove PM10b;
=TEX
=SML
set_goal([],nth 0 PM10b);
a contr_tac;
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 3 ⓩ(y ≜ z)⌝);
a(z_spec_nth_asm_tac 5 ⓩ(x ≜ z)⌝);
(* *** Goal "2" *** *)
a(z_spec_nth_asm_tac 3 ⓩ(z ≜ y)⌝);
a(z_spec_nth_asm_tac 5 ⓩ(x ≜ y)⌝);
pop_thm();
=TEX
=SML
set_goal([],nth 1 PM10b);
a contr_tac;
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 4 ⓩ(x ≜ y)⌝);
a(z_spec_nth_asm_tac 2 ⓩ(z ≜ y)⌝);
(* *** Goal "2" *** *)
a(z_spec_nth_asm_tac 4 ⓩ(x ≜ z)⌝);
a(z_spec_nth_asm_tac 2 ⓩ(y ≜ z)⌝);
pop_thm();
=TEX
=SML
(* Results from Principia Mathematica *11 *)
val PM11 =[
(* *11.1  *) ⓩ(∀x, y:𝕌⦁ φ(x,y)) ⇒ φ(z,w)⌝,
(* *11.2  *) ⓩ(∀x, y:X⦁ φ(x,y)) ⇔ (∀y, x:X⦁ φ(x,y))⌝,
(* *11.3  *) ⓩ(p ⇒ (∀x, y:Y⦁ φ(x,y)))
		⇔ (∀x, y:Y⦁ p ⇒ φ(x,y))⌝,
(* *11.35 *) ⓩ(∀x, y:Y⦁ φ(x,y) ⇒ p) ⇔ (∃x, y:Y⦁ φ(x,y)) ⇒ p⌝
];
=TEX
=SML
full_prove PM11;
fc_prove PM11;
=TEX
=SML
(* Got to be done by two tactic method - prove_rule can't cope *)
val PM11b =[
(* *11.32 *) ⓩ(∀x, y:Y⦁ φ(x,y) ⇒ ψ(x,y))
		⇒ (∀x, y:Y⦁ φ(x,y)) ⇒ (∀x, y:Y⦁ ψ(x,y))⌝,
(* *11.45 *) ⓩ(∃x, y:Y⦁ true) ⇒ ((∃x, y:Y⦁ p ⇒ φ(x,y))
		⇔ (p ⇒ (∃x, y:Y⦁ φ(x,y))))⌝,
(* *11.54 *) ⓩ(∃x, y:Y⦁ φx ∧ ψy) ⇔ (∃x:Y⦁ φx) ∧ (∃y:Y⦁ ψy)⌝,
(* *11.55 *) ⓩ(∃x, y:Y⦁ φx ∧ ψ(x,y))
		⇔ (∃x:Y⦁ φx ∧ (∃y:Y⦁ ψ(x,y)))⌝,
(* *11.6  *) ⓩ(∃x:X⦁ (∃y:Y⦁ φ(x,y) ∧ ψy) ∧ χx)
		⇔ (∃y:Y⦁ (∃x:X⦁ φ(x,y) ∧ χx) ∧ ψy)⌝,
(* *11.62 *) ⓩ(∀x:X; y:Y⦁ φx ∧ ψ(x,y) ⇒ χ(x,y))
  		⇔ (∀x:X⦁ φx ⇒ (∀y:Y⦁ ψ(x,y) ⇒ χ(x,y)))⌝
];
=TEX
=SML
set_goal([],nth 0 PM11b);
a contr_tac;
a(z_spec_nth_asm_tac 5 ⓩ(x ≜ x, y ≜ y)⌝);
a(z_spec_nth_asm_tac 5 ⓩ(x ≜ x, y ≜ y)⌝);
pop_thm();
=TEX
=SML
set_goal([],nth 1 PM11b);
a contr_tac;
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(x ≜ x', y ≜ y')⌝);
(* *** Goal "2" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(x ≜ x, y ≜ y)⌝);
(* *** Goal "3" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(x ≜ x', y ≜ y')⌝);
pop_thm();
=TEX
=SML
set_goal([],nth 2 PM11b);
a contr_tac;
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(x ≜ x)⌝);
(* *** Goal "2" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(y ≜ y)⌝);
(* *** Goal "3" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(x ≜ x, y ≜ y)⌝);
pop_thm();
=TEX
=SML
set_goal([],nth 3 PM11b);
a contr_tac;
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(x ≜ x)⌝);
a(z_spec_nth_asm_tac 1 ⓩ(y ≜ y)⌝);
(* *** Goal "2" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(x ≜ x, y ≜ y)⌝);
pop_thm();
=TEX
=SML
set_goal([],nth 4 PM11b);
a contr_tac;
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(y ≜ y)⌝);
a(z_spec_nth_asm_tac 1 ⓩ(x ≜ x)⌝);
(* *** Goal "2" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(x ≜ x)⌝);
a(z_spec_nth_asm_tac 1 ⓩ(y ≜ y)⌝);
pop_thm();
=TEX
=SML
set_goal([],nth 5 PM11b);
a contr_tac;
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 6 ⓩ(x ≜ x, y ≜ y)⌝);
(* *** Goal "2" *** *)
a(z_spec_nth_asm_tac 6 ⓩ(x ≜ x)⌝);
a(z_spec_nth_asm_tac 1 ⓩ(y ≜ y)⌝);
pop_thm();
=TEX
\subsection{Z Library Set Theory}
The following are selected results from the Z Notation reference manual
\cite{spivey92}.
=SML
new_parent "z_relations";
set_pc "z_sets_ext";
=TEX
=SML
(* results from ZRM provable by stripping *)
val ZRM1 = [
ⓩa ∪ a = a ∪ {}⌝,
ⓩa ∪ {} = a ∩ a⌝,
ⓩa ∩ a = a \ {}⌝,
ⓩa \ {} = a⌝,
ⓩa ∩ {} = a \ a⌝,
ⓩa \ a = {} \ a⌝,
ⓩ{} \ a = {}⌝,
ⓩa ∪ b = b ∪ a⌝,
ⓩa ∩ b = b ∩ a⌝,
ⓩa ∪ (b ∪ c) = (a ∪ b) ∪ c⌝,
ⓩa ∩ (b ∩ c) = (a ∩ b) ∩ c⌝,
ⓩa ∪ (b ∩ c) = (a ∪ b) ∩ (a ∪ c)⌝,
ⓩa ∩ (b ∪ c) = (a ∩ b) ∪ (a ∩ c)⌝,
ⓩ(a ∩ b) ∪ (a \ b) = a⌝,
ⓩ((a \ b) ∩ b) = {}⌝,
ⓩa \ (b \ c) = (a \ b) ∪ (a ∩ c)⌝,
ⓩ(a \ b) \ c = a \ (b ∪ c)⌝,
ⓩa ∪ (b \ c) = (a ∪ b) \ (c \ a)⌝,
ⓩa ∩ (b \ c) = (a ∩ b) \ c⌝,
ⓩ(a ∪ b) \ c = (a \ c) ∪ (b \ c)⌝];
=TEX
=SML
contr_prove ZRM1;
=TEX
=SML
val ZRM2 = [
ⓩa \ (b ∩ c) = (a \ b) ∪ (a \ c)⌝,
ⓩ¬ x ∈ {}⌝,
ⓩa ⊆ a⌝,
ⓩ¬ a ⊂ a⌝,
ⓩ{} ⊆ a⌝,
ⓩ⋃ {} = {}⌝,
ⓩ⋂ {} = 𝕌⌝];
=TEX
=SML
contr_prove ZRM2;
=TEX
=SML
(* results from ZRM that can be proven automatically *)
val ZRM3 = [
ⓩa ⊆ b ⇔ a ∈ ℙ b⌝,
ⓩ¬ (a ⊂ b ∧ b ⊂ a)⌝,
ⓩa ⊆ b ∧ b ⊆ c ⇒ a ⊆ c⌝,
ⓩ⋃ (a ∪ b) = (⋃ a) ∪ (⋃ b)⌝,
ⓩ⋂ (a ∪ b) = (⋂ a) ∩ (⋂ b)⌝,
ⓩ a ⊆ b ⇒ ⋃ a ⊆ ⋃ b ⌝,
ⓩ a ⊆ b ⇒ ⋂ b ⊆ ⋂ a ⌝];
=TEX
=SML
(* results from ZRM that can be proven automatically,
	but not by fc_rule *)
val ZRM3b = [
ⓩa ⊆ b ∧ b ⊆ a ⇔ a = b⌝,
ⓩa ⊂ b ∧ b ⊂ c ⇒ a ⊂ c⌝,
ⓩ{} ⊂ a ⇔ ¬ a = {}⌝
];
=TEX
=SML
full_prove ZRM3;
fc_prove ZRM3;
full_prove ZRM3b;
=TEX
Now to do them by the two tactic method:
=SML
set_goal([],nth 0 ZRM3);
a contr_tac;
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 3 ⓩ(x1 ≜ x1)⌝);
pop_thm();
=TEX
=SML
set_goal([],nth 1 ZRM3);
a contr_tac;
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 3 ⓩ(x1 ≜ x1')⌝);
(* *** Goal "2" *** *)
a(z_spec_nth_asm_tac 6 ⓩ(x1 ≜ x1)⌝);
(* *** Goal "3" *** *)
a(z_spec_nth_asm_tac 3 ⓩ(x1 ≜ x1)⌝);
(* *** Goal "4" *** *)
a(z_spec_nth_asm_tac 3 ⓩ(x1 ≜ x1)⌝);
pop_thm();
=TEX
=SML
set_goal([],nth 2 ZRM3);
a contr_tac;
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 4 ⓩ(x1 ≜ x1)⌝);
a(z_spec_nth_asm_tac 4 ⓩ(x1 ≜ x1)⌝);
pop_thm();
=TEX
=SML
set_goal([],nth 3 ZRM3);
a contr_tac;
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 2 ⓩ(S ≜ S)⌝);
(* *** Goal "2" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(S ≜ S)⌝);
(* *** Goal "3" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(S ≜ S)⌝);
(* *** Goal "4" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(S ≜ S)⌝);
pop_thm();
=TEX
=SML
set_goal([],nth 4 ZRM3);
a contr_tac;
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 3 ⓩ(S ≜ S)⌝);
(* *** Goal "2" *** *)
a(z_spec_nth_asm_tac 3 ⓩ(S ≜ S)⌝);
(* *** Goal "3" *** *)
a(z_spec_nth_asm_tac 4 ⓩ(S ≜ S)⌝);
(* *** Goal "4" *** *)
a(z_spec_nth_asm_tac 3 ⓩ(S ≜ S)⌝);
pop_thm();
=TEX
=SML
set_goal([],nth 5 ZRM3);
a contr_tac;
a(z_spec_nth_asm_tac 1 ⓩ(S ≜ S)⌝);
a(z_spec_nth_asm_tac 5 ⓩ(x1 ≜ S)⌝);
pop_thm();
=TEX
=SML
set_goal([],nth 6 ZRM3);
a contr_tac;
a(z_spec_nth_asm_tac 4 ⓩ(x1 ≜ S)⌝);
a(z_spec_nth_asm_tac 4 ⓩ(S ≜ S)⌝);
pop_thm();
=TEX
Now the ones $fc\_rule$ cannot do
(because of asymmetry about $⇔$).
=SML
set_goal([],nth 0 ZRM3b);
a contr_tac;
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 4 ⓩ(x1 ≜ x1)⌝);
(* *** Goal "2" *** *)
a(z_spec_nth_asm_tac 3 ⓩ(x1 ≜ x1)⌝);
(* *** Goal "3" *** *)
a(z_spec_nth_asm_tac 3 ⓩ(x1 ≜ x1)⌝);
(* *** Goal "4" *** *)
a(z_spec_nth_asm_tac 3 ⓩ(x1 ≜ x1)⌝);
pop_thm();
=TEX
=SML
set_goal([],nth 1 ZRM3b);
a contr_tac;
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 8 ⓩ(x1 ≜ x1)⌝);
(* *** Goal "2" *** *)
a(z_spec_nth_asm_tac 7 ⓩ(x1 ≜ x1)⌝);
(* *** Goal "3" *** *)
a(z_spec_nth_asm_tac 8 ⓩ(x1 ≜ x1)⌝);
(* *** Goal "4" *** *)
a(z_spec_nth_asm_tac 7 ⓩ(x1 ≜ x1)⌝);
(* *** Goal "5" *** *)
a(z_spec_nth_asm_tac 5 ⓩ(x1 ≜ x1')⌝);
(* *** Goal "6" *** *)
a(z_spec_nth_asm_tac 4 ⓩ(x1 ≜ x1')⌝);
(* *** Goal "7" *** *)
a(z_spec_nth_asm_tac 8 ⓩ(x1 ≜ x1'')⌝);
a(z_spec_nth_asm_tac 6 ⓩ(x1 ≜ x1'')⌝);
(* *** Goal "8" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(x1 ≜ x1')⌝);
a(z_spec_nth_asm_tac 8 ⓩ(x1 ≜ x1')⌝);
pop_thm();
=TEX
=SML
set_goal([],nth 2 ZRM3b);
a contr_tac;
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(x1 ≜ x1)⌝);
(* *** Goal "2" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(x1 ≜ x1)⌝);
pop_thm();
=TEX

\subsection{Z Relations}
In the following proofs we ``allow'' ourselves
$swap\-\_nth\-\_asm\-\_concl\-\_tac$,
$nth\-\_asm\-\_sym\-\_tac$, and
$asm\-\_rewrite\-\_tac$.
These substitute for automated equational reasoning.
=SML
new_parent "z_library";
set_pc "z_library_ext";
=TEX
Page 96:
=SML
val ZRM4 = [
ⓩ (R ∈ X ↔ Y) ⇒ (∀ x : X ⦁ x ∈ dom R ⇔ (∃ y : Y ⦁ (x,y) ∈ R))⌝,
ⓩ (R ∈ X ↔ Y) ⇒ (∀ y : Y ⦁ y ∈ ran R ⇔ (∃ x : X ⦁ (x,y) ∈ R))⌝,
ⓩdom {x1 ↦ y1, x2 ↦ y2} = {x1, x2}⌝,
ⓩran {x1 ↦ y1, x2 ↦ y2} = {y1, y2}⌝,
ⓩdom (Q ∪ R) = dom Q ∪ dom R⌝,
ⓩran (Q ∪ R) = ran Q ∪ ran R⌝,
ⓩdom (Q ∩ R) ⊆ dom Q ∩ dom R⌝,
ⓩran (Q ∩ R) ⊆ ran Q ∩ ran R⌝,
ⓩdom {} = {}⌝,
ⓩran {} = {}⌝
];
=TEX
=SML
full_prove ZRM4;
=TEX
Page 97:
=SML
val ZRM5 = [
ⓩ P ∈ X ↔ Y ∧ Q ∈ Y ↔ Z ⇒
	((x ↦ z) ∈ P ⨾ Q ⇔ (∃ y : Y ⦁ (x,y) ∈ P ∧ (y,z) ∈ Q))⌝,
ⓩP ⨾ (Q ⨾ R) = (P ⨾ Q) ⨾ R⌝
];
val ZRM5a = [ⓩ (x ↦ x') ∈ id X ⇔ x = x' ∈ X⌝,
ⓩ (x ↦ x') ∈ id X ⇔ x = x' ∈ X⌝,
ⓩ(id X) ⨾ P = X ◁ P⌝,
ⓩ(id V) ⨾ id W = id (V ∩ W)⌝,
ⓩP ⨾ id Y = P ▷ Y⌝
];
val ZRM5b = [
ⓩ x ∈ dom g ∧ g x ∈ dom f ∧ g ∈ X ⇸ Y ∧ f ∈ Y ⇸ Z ⇒ (f ∘ g)(x) = f(g(x))⌝
];

=TEX
=SML
full_prove ZRM5;
full_prove ZRM5a;
fc_prove ZRM5;
=TEX
=SML
set_goal([], nth 0 ZRM5b);
push_pc "z_library_ext";
a(contr_tac);
a(z_spec_nth_asm_tac 5 ⓩ(x1 ≜ x, x2 ≜ y)⌝);
a(z_spec_nth_asm_tac 5 ⓩ(x1 ≜ g x, x2 ≜ y')⌝);
a(swap_nth_asm_concl_tac 5);
a(z_app_eq_tac);
a(rewrite_tac[]);
a(contr_tac);
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 11 ⓩ(x1 ≜ x, x2 ≜ y'')⌝);
a(z_spec_nth_asm_tac 10 ⓩ(x1 ≜ y'', x2 ≜ f_a)⌝);
a(swap_nth_asm_concl_tac 3);
a(z_app_eq_tac);
a(contr_tac);
(* *** Goal "1.1" *** *)
a(z_spec_nth_asm_tac 12 ⓩ(x1 ≜ g x, x2 ≜ f_a')⌝);
a(lemma_tac ⓩg x = y''⌝);
(* *** Goal "1.1.1" *** *)
a(z_app_eq_tac);
a(contr_tac);
a(z_spec_nth_asm_tac 17 ⓩ(x1 ≜ x, x2 ≜ f_a'')⌝);
a(z_spec_nth_asm_tac 17 ⓩ(x ≜ x, y1 ≜ f_a'', y2 ≜ y'')⌝);
(* *** Goal "1.1.2" *** *)
a(swap_nth_asm_concl_tac 4);
a(asm_rewrite_tac[]);
a(swap_nth_asm_concl_tac 3);
a(z_spec_nth_asm_tac 12 ⓩ(x ≜ y'', y1 ≜ f_a', y2 ≜ f_a)⌝);
(* *** Goal "1.2" *** *)
a(lemma_tac ⓩg x = y''⌝);
(* *** Goal "1.2.1" *** *)
a(z_app_eq_tac);
a(contr_tac);
a(z_spec_nth_asm_tac 14 ⓩ(x ≜ x, y1 ≜ f_a', y2 ≜ y'')⌝);
a(z_spec_nth_asm_tac 16 ⓩ(x1 ≜ x, x2 ≜ f_a')⌝);
(* *** Goal "1.2.2" *** *)
a(swap_nth_asm_concl_tac 2);
a(asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(y ≜ y)⌝);
a(lemma_tac ⓩy = g x⌝);
(* *** Goal "2.1" *** *)
a(z_app_eq_tac);
a(contr_tac);
a(z_spec_nth_asm_tac 12 ⓩ(x1 ≜ x, x2 ≜ f_a)⌝);
a(z_spec_nth_asm_tac 12 ⓩ(x ≜ x, y1 ≜ f_a, y2 ≜ y)⌝);
(* *** Goal "2.2" *** *)
a(swap_nth_asm_concl_tac 2);
a(asm_rewrite_tac[]);
a(lemma_tac ⓩf(g x) = y'⌝);
(* *** Goal "2.2.1" *** *)
a(z_app_eq_tac);
a(contr_tac);
a(z_spec_nth_asm_tac 10 ⓩ(x1 ≜ g x, x2 ≜ f_a)⌝);
a(z_spec_nth_asm_tac 10 ⓩ(x ≜ g x, y1 ≜ f_a, y2 ≜ y')⌝);
(* *** Goal "2.2.2" *** *)
a(asm_rewrite_tac[]);
pop_thm();
=TEX

From now on we allow ourselves $prove\-\_tac$ as a pre-processor.

Page 98:
=SML
val ZRM6 = [
ⓩdom (S ◁ R) = S ∩ dom R⌝,
ⓩran (R ▷ T) = ran R ∩ T⌝,
ⓩS ◁ R ⊆ R⌝,
ⓩR ▷ T ⊆ R⌝,
ⓩ(S ◁ R) ▷ T = S ◁ (R ▷ T)⌝,
ⓩS ◁ (V ◁ R) = (S ∩ V) ◁ R⌝,
ⓩ(R ▷ T) ▷ W = R ▷ (T ∩ W)⌝
];
val ZRM6b = [
ⓩran R ⊆ Y ⇒ (S ◁ R = (id S) ⨾ R = (S × Y) ∩ R)⌝,
ⓩdom R ⊆ X ⇒ (R ▷ T = R ⨾ (id T) = R ∩ (X × T))⌝
];
=TEX
=SML
full_prove ZRM6;
fc_prove ZRM6;
full_prove ZRM6b;
=TEX
Page 99:
=SML
val ZRM7 = [
ⓩdom R ⊆ X ⇒ S ⩤ R = (X \ S) ◁ R⌝,
ⓩran R ⊆ Y ⇒ R ⩥ T = R ▷ (Y \ T)⌝,
ⓩ(S ◁ R) ∪ (S ⩤ R) = R⌝,
ⓩ(R ▷ T) ∪ (R ⩥ T) = R⌝
];
=TEX
=SML
full_prove ZRM7;
fc_prove ZRM7;
=TEX
Page 100:
=SML
=SML
fun ⦏full_prove1⦎ (lst:TERM list) : unit = (
	map (diag_string o string_of_thm o prove_rule[z_↦_thm]) lst;
	()
);
=TEX
=SML
fun ⦏fc_prove1⦎ (lst:TERM list) : unit = (
	map (diag_string o string_of_thm o
		(fn tm => tac_proof(([],tm),
			z_fc_prove_tac[z_↦_thm]))) lst;
	()
);
=TEX
=SML
val ZRM8 = [
ⓩ(y ↦ x) ∈ R ↗~↕ ⇔ (x ↦ y) ∈ R⌝,
ⓩ(R ↗~↕) ↗~↕ = R⌝,
ⓩ(Q ⨾ R) ↗~↕ = R ↗~↕ ⨾ Q ↗~↕⌝,
ⓩdom(R ↗~↕) = ran R⌝,
ⓩran(R ↗~↕) = dom R⌝
];
val ZRM8b = [
ⓩid(dom R) ⊆ R ⨾ (R ↗~↕)⌝,
ⓩid(ran R) ⊆ (R ↗~↕) ⨾ R⌝,
ⓩ(id V) ↗~↕ = id V⌝
];
=TEX
=SML
full_prove1 ZRM8;
full_prove1 ZRM8b;
fc_prove1 ZRM8;
=TEX

Page 101:
=SML
val ZRM9 = [
ⓩS ⊆ X ⇒ (y ∈ R ⦇ S ⦈ ⇔ (∃ x : X ⦁ x ∈ S ∧ (x,y) ∈ R))⌝,
ⓩR ⦇ S ⦈ = ran(S ◁ R)⌝,
ⓩdom(Q ⨾ R) = (Q ↗~↕) ⦇ dom R ⦈⌝,
ⓩran(Q ⨾ R) = R ⦇ ran Q ⦈⌝,
ⓩR ⦇ S ∪ T ⦈ = R ⦇ S ⦈ ∪ R ⦇ T ⦈⌝,
ⓩR ⦇ S ∩ T ⦈ ⊆ R ⦇ S ⦈ ∩ R ⦇ T ⦈⌝,
ⓩR ⦇ dom R ⦈ = ran R⌝
];
=TEX
=SML
full_prove1 ZRM9;
fc_prove1 ZRM9;
=TEX
=SML
val ZRM9b = [
ⓩdom R = first ⦇ R ⦈⌝,
ⓩran R = second ⦇ R ⦈⌝
];
=TEX
Messing around with dropping assumptions indicates something's
unhealthy.
=SML
set_goal([],nth 0 ZRM9b);
a(prove_tac[z_∈_first_thm]);
(* *** Goal "1" *** *)
a(contr_tac);
a(z_spec_nth_asm_tac 1 ⓩ(x ≜ (x1, y))⌝);
a(swap_nth_asm_concl_tac 1);
a(rewrite_tac[]);
(* *** Goal "2" *** *)
a(contr_tac);
a(z_spec_nth_asm_tac 1 ⓩ(y ≜ (x.2))⌝);
a(all_var_elim_asm_tac1);
a(swap_nth_asm_concl_tac 1);
a(conv_tac(ONCE_MAP_C z_tuple_intro_conv));
a(asm_rewrite_tac[]);
pop_thm();
=TEX
=SML
set_goal([],nth 1 ZRM9b);
a(prove_tac[z_∈_second_thm]);
(* *** Goal "1" *** *)
a(contr_tac);
a(z_spec_nth_asm_tac 1 ⓩ(x ≜ (x, x1))⌝);
a(swap_nth_asm_concl_tac 1);
a(rewrite_tac[]);
(* *** Goal "2" *** *)
a(contr_tac);
a(z_spec_nth_asm_tac 1 ⓩ(x ≜ (x.1))⌝);
a(all_var_elim_asm_tac1);
a(swap_nth_asm_concl_tac 1);
a(conv_tac(ONCE_MAP_C z_tuple_intro_conv));
a (asm_rewrite_tac[]);
pop_thm();
=TEX
=SML
push_pc "z_library_ext";
=TEX
Page 102:
=SML
val ZRM10 = [
ⓩR ⊕ R = R⌝,
ⓩP ⊕ (Q ⊕ R) = (P ⊕ Q) ⊕ R⌝,
ⓩ∅ ⊕ R = R ⊕ ∅ = R⌝,
ⓩdom Q ∩ dom R = ∅ ⇒ Q ⊕ R = Q ∪ R⌝,
ⓩV ◁ (Q ⊕ R) = (V ◁ Q) ⊕ (V ◁ R)⌝,
ⓩ(Q ⊕ R) ▷ W ⊆ (Q ▷ W) ⊕ (R ▷ W)⌝
];
=TEX
=SML
full_prove ZRM10;
fc_prove ZRM10;
=TEX
=SML
val ZRM10b = [
ⓩdom(Q ⊕ R) = (dom Q) ∪ (dom R)⌝,
ⓩf ∈ X ⇸ Y ∧ g ∈ X ⇸ Y ⇒
	x ∈ (dom f) \ (dom g) ⇒ (f ⊕ g) x = f x⌝,
ⓩg ∈ X ⇸ Y ∧ x ∈ dom g ⇒ (f ⊕ g) x = g x⌝
];
=TEX
Embedded quantifiers:
=SML
set_goal([],nth 0 ZRM10b);
a(contr_tac);
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(y ≜ y)⌝);
(* *** Goal "2" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(y ≜ y)⌝);
(* *** Goal "3" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(y ≜ y)⌝);
a(z_spec_nth_asm_tac 3 ⓩ(y ≜ y')⌝);
(* *** Goal "4" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(y ≜ y)⌝);
pop_thm();
=TEX
Application problems:
=SML
set_goal([],nth 1 ZRM10b);
a(contr_tac);
a(swap_nth_asm_concl_tac 1);
a(z_app_eq_tac);
a(z_spec_nth_asm_tac 6 ⓩ(x1 ≜ x,x2 ≜ y)⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 9 ⓩ(x1 ≜ x,x2 ≜ f_a)⌝);
a(z_app_eq_tac);
a(REPEAT strip_tac);
a(z_spec_nth_asm_tac 11 ⓩ(x1 ≜ x,x2 ≜ f_a')⌝);
a(z_spec_nth_asm_tac 11 ⓩ(x ≜ x, y1 ≜ f_a', y2 ≜ f_a)⌝);
(* *** Goal "2" *** *)
a(z_spec_nth_asm_tac 4 ⓩ(y ≜ f_a)⌝);
(* *** Goal "3" *** *)
a(z_spec_nth_asm_tac 4 ⓩ(y ≜ y')⌝);
(* *** Goal "4" *** *)
a(lemma_tac ⓩf x = y⌝);
(* *** Goal "4.1" *** *)
a(z_app_eq_tac);
a(REPEAT strip_tac);
a(z_spec_nth_asm_tac 9 ⓩ(x ≜ x, y1 ≜ f_a, y2 ≜ y)⌝);
a(z_spec_nth_asm_tac 11 ⓩ(x1 ≜ x,x2 ≜ f_a)⌝);
(* *** Goal "4.2" *** *)
a(swap_nth_asm_concl_tac 2);
a(asm_rewrite_tac[]);
pop_thm();
=TEX
Application problems:
=SML
set_goal([],nth 2 ZRM10b);
a(contr_tac);
a(swap_nth_asm_concl_tac 1);
a(z_app_eq_tac);
a(contr_tac);
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 3 ⓩ(y ≜ y)⌝);
(* *** Goal "2" *** *)
a(swap_nth_asm_concl_tac 1);
a(z_app_eq_tac);
a(contr_tac);
a(z_spec_nth_asm_tac 6 ⓩ(x1 ≜ x,x2 ≜ f_a)⌝);
a(z_spec_nth_asm_tac 8 ⓩ(x1 ≜ x,x2 ≜ f_a')⌝);
a(z_spec_nth_asm_tac 8 ⓩ(x ≜ x, y1 ≜ f_a', y2 ≜ f_a)⌝);
(* *** Goal "3" *** *)
a(z_spec_nth_asm_tac 5 ⓩ(x1 ≜ x,x2 ≜ y)⌝);
a(lemma_tac ⓩg x = y⌝);
(* *** Goal "3.1" *** *)
a(z_app_eq_tac);
a(contr_tac);
a(z_spec_nth_asm_tac 9 ⓩ(x1 ≜ x,x2 ≜ f_a)⌝);
a(z_spec_nth_asm_tac 9 ⓩ(x ≜ x, y1 ≜ f_a, y2 ≜ y)⌝);
(* *** Goal "3.2" *** *)
a(swap_nth_asm_concl_tac 4);
a(asm_rewrite_tac[]);
(* *** Goal "4" *** *)
a(z_spec_nth_asm_tac 5 ⓩ(x1 ≜ x,x2 ≜ y)⌝);
a(lemma_tac ⓩg x = y⌝);
(* *** Goal "4.1" *** *)
a(z_app_eq_tac);
a(contr_tac);
a(z_spec_nth_asm_tac 9 ⓩ(x1 ≜ x,x2 ≜ f_a)⌝);
a(z_spec_nth_asm_tac 9 ⓩ(x ≜ x, y1 ≜ f_a, y2 ≜ y)⌝);
(* *** Goal "4.2" *** *)
a(swap_nth_asm_concl_tac 4);
a(asm_rewrite_tac[]);
pop_thm();
=TEX

Page 103:
=SML
val ZRM11 = [
ⓩR ⊆ R ↗+↕⌝,
ⓩid X ⊆ R ↗*↕⌝,
ⓩR ⊆ R↗*↕⌝
];
=TEX
=SML
full_prove ZRM11;
fc_prove ZRM11;
=TEX
=SML
val ZRM11b = [
ⓩR ↗+↕ ⨾ (R ↗+↕) ⊆ R ↗+↕⌝,
ⓩ(R ↗+↕) ↗+↕ = R ↗+↕⌝,
ⓩ(R ↗*↕) ↗*↕ = R ↗*↕⌝,
ⓩR ⊆ Q ∧ Q ⨾ Q ⊆ Q ⇒ R ↗+↕ ⊆ Q⌝,
ⓩR↗*↕ ⨾ R↗*↕ = R↗*↕⌝,
ⓩid X ⊆ Q ∧ R ⊆ Q ∧ Q ⨾ Q ⊆ Q ⇒ R↗*↕ ⊆ Q⌝,
ⓩR↗*↕ = R ↗+↕ ∪ id X = (R ∪ id X)↗+↕⌝,
ⓩR↗+↕ = R ⨾ R ↗*↕ = R ↗*↕ ⨾ R⌝,
ⓩS ⊆ R ↗*↕ ⦇ S ⦈⌝,
ⓩS ⊆ T ∧ R ⦇ T ⦈ ⊆ T ⇒ R ↗*↕ ⦇S⦈ ⊆ T⌝,
ⓩR ⦇R ↗*↕ ⦇ S ⦈ ⦈ ⊆ R ↗*↕ ⦇S⦈⌝
];
=TEX
Number of resolution steps, caused by reasoning about membership,
rather than sets:
=SML
set_goal([],nth 0 ZRM11b);
a contr_tac;
a(z_spec_nth_asm_tac 2 ⓩ(x1 ≜ x1, x2 ≜ x2)⌝);
a(z_spec_nth_asm_tac 6 ⓩ(S ≜ S)⌝);
(* *** Goal "1" *** *)
a(asm_fc_tac[]);
(* *** Goal "2" *** *)
a(z_spec_nth_asm_tac 6 ⓩ(x1 ≜ x1', x2 ≜ x2')⌝);
a(z_spec_nth_asm_tac 1 ⓩ(y ≜ y')⌝);
(* *** Goal "3" *** *)
a(z_spec_nth_asm_tac 6 ⓩ(S ≜ S)⌝);
(* *** Goal "3.1" *** *)
a(asm_fc_tac[]);
(* *** Goal "3.2" *** *)
a(z_spec_nth_asm_tac 7 ⓩ(x1 ≜ x1', x2 ≜ x2')⌝);
a(z_spec_nth_asm_tac 1 ⓩ(y ≜ y')⌝);
(* *** Goal "3.3" *** *)
a(z_spec_nth_asm_tac 3 ⓩ(y ≜ y)⌝);
pop_thm();
=TEX
Given the above, the other theorems in ZRM11b are
likely to be too nasty to prove in a manner
that demonstrates any good properties -
they require reasoning about sets.
=TEX
Page 106:
=SML
val ZRM12 = [
];
=TEX
=SML
full_prove ZRM12;
=TEX
=SML
val ZRM12b = [
ⓩf ∈ X ↔ Y ⇒ (f ∈ X ⇸ Y ⇔ f ∘ f↗~↕ = id(ran f))⌝,
ⓩf ∈ X ⤔ Y ⇔ (f ∈ X ⇸ Y ∧ f ↗~↕ ∈ Y ⇸ X)⌝,
ⓩf ∈ X ⤔ Y ⇔ (f ∈ X ⇸ Y ∧ f ↗~↕ ∈ Y ⇸ X)⌝,
ⓩf ∈ X ↣ Y ⇔ (f ∈ X → Y ∧ f ↗~↕ ∈ Y ⇸ X)⌝,
ⓩf ∈ X ⤔ Y ⇒ f ⦇S ∩ T⦈ = f ⦇S⦈ ∩ f ⦇T⦈⌝,
ⓩf ∈ X ⤖ Y ⇔ (f ∈ X → Y ∧ f ↗~↕ ∈ Y → X)⌝,
ⓩf ∈ X ⤀ Y ⇒ f ∘ f ↗~↕ = id Y⌝
];
=TEX
Too many resolution steps, some equational reasoning:
=SML
set_goal([],nth 0 ZRM12b);
a contr_tac;
(* *** Goal "1" *** *)
a(asm_fc_tac[]);
(* *** Goal "2" *** *)
a(z_spec_nth_asm_tac 5 ⓩ(x1 ≜ y, x2 ≜ x1)⌝);
a(z_spec_nth_asm_tac 7 ⓩ(x1 ≜ y, x2 ≜ x2)⌝);
a(z_spec_nth_asm_tac 7 ⓩ(x ≜ y, y1 ≜ x1, y2 ≜ x2)⌝);
(* *** Goal "3" *** *)
a(z_spec_nth_asm_tac 5 ⓩ(x1 ≜ x, x2 ≜ x1)⌝);
a(z_spec_nth_asm_tac 3 ⓩ(y ≜ x)⌝);
a(swap_nth_asm_concl_tac 6);
a(asm_rewrite_tac[]);
(* *** Goal "4" *** *)
a(z_spec_nth_asm_tac 4 ⓩ(x1 ≜ x1, x2 ≜ x2)⌝);
(* *** Goal "5" *** *)
a(z_spec_nth_asm_tac 4 ⓩ(x1 ≜ x1, x2 ≜ x2)⌝);
(* *** Goal "6" *** *)
a(z_spec_nth_asm_tac 7 ⓩ(x1 ≜ y1, x2 ≜ y2)⌝);
(* *** Goal "6.1" *** *)
a(asm_fc_tac[]);
(* *** Goal "6.2" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(y ≜ x)⌝);
(* *** Goal "6.3" *** *)
a(z_spec_nth_asm_tac 3 ⓩ(y ≜ y)⌝);
pop_thm();
=TEX
Too many resolution steps:
=SML
set_goal([],nth 1 ZRM12b);
a contr_tac;
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 5 ⓩ(x1 ≜ x1, x2 ≜ x2)⌝);
(* *** Goal "2" *** *)
a(z_spec_nth_asm_tac 5 ⓩ(x1 ≜ x1, x2 ≜ x2)⌝);
(* *** Goal "3" *** *)
a(z_spec_nth_asm_tac 8 ⓩ(x ≜ x, y1 ≜ y1, y2 ≜ y2)⌝);
(* *** Goal "6" *** *)
a(z_spec_nth_asm_tac 7 ⓩ(x1 ≜ y1, x2 ≜ y2)⌝);
(* *** Goal "6.1" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(y ≜ x)⌝);
(* *** Goal "6.2" *** *)
a(z_spec_nth_asm_tac 1 ⓩ(y ≜ x)⌝);
(* *** Goal "6.3" *** *)
a(swap_nth_asm_concl_tac 1);
a(z_app_eq_tac);
a(contr_tac);
(* *** Goal "6.3.1" *** *)
a(swap_nth_asm_concl_tac 1);
a(z_app_eq_tac);
a(contr_tac);
(* *** Goal "6.3.1.1" *** *)
a(z_spec_nth_asm_tac 12 ⓩ(x1 ≜ y1, x2 ≜ f_a)⌝);
a(z_spec_nth_asm_tac 13 ⓩ(x1 ≜ y2, x2 ≜ f_a')⌝);
a(z_spec_nth_asm_tac 13 ⓩ(x ≜ y1, y1 ≜ f_a, y2 ≜ x)⌝);
a(z_spec_nth_asm_tac 14 ⓩ(x ≜ y2, y1 ≜ f_a', y2 ≜ x)⌝);
a(swap_nth_asm_concl_tac 5);
a(asm_rewrite_tac[]);
(* *** Goal "6.3.1.2" *** *)
a(z_spec_nth_asm_tac 11 ⓩ(x1 ≜ y1, x2 ≜ f_a)⌝);
a(z_spec_nth_asm_tac 11 ⓩ(x ≜ y1, y1 ≜ f_a, y2 ≜ x)⌝);
a(swap_nth_asm_concl_tac 3);
a(asm_rewrite_tac[]);
(* *** Goal "6.3.2" *** *)
a(lemma_tac ⓩ(f y1 = x) ∧ (f y2 = x)⌝);
(* *** Goal "6.3.2.1" *** *)
a(strip_tac THEN z_app_eq_tac THEN contr_tac);
(* *** Goal "6.3.2.1.1" *** *)
a(z_spec_nth_asm_tac 12 ⓩ(x1 ≜ y1, x2 ≜ f_a)⌝);
a(z_spec_nth_asm_tac 12 ⓩ(x ≜ y1, y1 ≜ f_a, y2 ≜ x)⌝);
(* *** Goal "6.3.2.1.2" *** *)
a(z_spec_nth_asm_tac 12 ⓩ(x1 ≜ y2, x2 ≜ f_a)⌝);
a(z_spec_nth_asm_tac 12 ⓩ(x ≜ y2, y1 ≜ f_a, y2 ≜ x)⌝);
(* *** Goal "6.3.2.2" *** *)
a(swap_nth_asm_concl_tac 3);
a(asm_rewrite_tac[]);
(* *** Goal "7" *** *)
a(z_spec_nth_asm_tac 6 ⓩ(x1 ≜ x1, x2 ≜ x2)⌝);
(* *** Goal "8" *** *)
a(z_spec_nth_asm_tac 6 ⓩ(x1 ≜ x1, x2 ≜ x2)⌝);
(* *** Goal "9" *** *)
a(z_spec_nth_asm_tac 9 ⓩ(x ≜ x, y1 ≜ y1, y2 ≜ y2)⌝);
(* *** Goal "10" *** *)
a(z_spec_nth_asm_tac 8 ⓩ(x1 ≜ x1, x2 ≜ y)⌝);
a(z_spec_nth_asm_tac 10 ⓩ(x1 ≜ x2, x2 ≜ y')⌝);
a(lemma_tac ⓩy = f x1⌝);
(* *** Goal "10.1" *** *)
a(z_app_eq_tac);
a(contr_tac);
a(z_spec_nth_asm_tac 14 ⓩ(x1 ≜ x1, x2 ≜ f_a)⌝);
a(z_spec_nth_asm_tac 14 ⓩ(x ≜ x1, y1 ≜ f_a, y2 ≜ y)⌝);
(* *** Goal "10.2" *** *)
a(swap_nth_asm_concl_tac 9);
a(asm_rewrite_tac[]);
a(contr_tac);
a(z_spec_nth_asm_tac 13 ⓩ(x1 ≜ x1, x2 ≜ f x2)⌝);
a(z_spec_nth_asm_tac 11 ⓩ(x ≜ ⓩf x2⌝, y1 ≜ x1, y2 ≜ x2)⌝);
a(lemma_tac ⓩy' = f x2⌝);
(* *** Goal "10.2.1" *** *)
a(z_app_eq_tac);
a(contr_tac);
a(z_spec_nth_asm_tac 17 ⓩ(x1 ≜ x2, x2 ≜ f_a)⌝);
a(z_spec_nth_asm_tac 17 ⓩ(x ≜ x2, y1 ≜ f_a, y2 ≜ y')⌝);
(* *** Goal "10.2.2" *** *)
a(swap_nth_asm_concl_tac 12);
a(asm_rewrite_tac[]);
pop_thm();
=TEX
Presumably the rest of these goals are similarly horribly to do at a set membership level.

\section{DOCUMENT PROCESSING AND PRINTING}
The Z document preparation system, and the ability to strip material from sources files for various kinds of processing is heavily exercised
by the build and documentation of the system itself.
If the build is successful starting from an empty directory,
and the \ProductZ{} documentation can be printed in an acceptable form,
then this area can be considered tested.

To save reviewing the entire system documentation,
the evaluator is advised to check the following the printing of the following:

\begin{tabular}{| p{1.8in} | p{4.3in} |} \hline
Document & Checking for: \\ \hline
T.B.A. & whatever \\ \hline
\end{tabular}

=TEX
\section{FURTHER FORMATTING CHECKS}
Some module test documents indicate that their results file
be checked for correct formatting of user messages.
This is not currently automatically tested.
These are module test documents:
T.B.A.
=SML
fun  ⦏summarize_mt_results⦎ () = "Compiled OK: int003.sml";
=TEX
\section{END OF TESTS}
=SML
diag_string "Successfully reached end of DS/FMU/IED/INT003";
val _ = diag_line "All module tests passed (by dint of reaching this output statement).";
=TEX
\end{document}

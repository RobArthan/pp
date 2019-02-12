=IGN
********************************************************************************
mdt071.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  ℤ $Date: 2002/10/17 15:10:58 $ $Revision: 1.13 $ $RCSfile: mdt071.doc,v $

doctex mdt071 ; texdvi mdt071
bibtex mdt071

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

\def\Title{Module Tests for the Theory of Relations}

\def\AbstractText{A set of module tests are given for the functions (conversions, etc) associated with the theory of relations. It also checks that the theory design has been met by the theory implementation.}

\def\Reference{DS/FMU/IED/MDT071}

\def\Author{R.B.Jones}


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
%% LaTeX2e port: \TPPproject{FST PROJECT}  %% Mandatory field
%% LaTeX2e port: \TPPtitle{Module Tests for the Theory of Relations}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Module Tests for the \cr
%% LaTeX2e port: Theory of Relations}
%% LaTeX2e port: \TPPref{DS/FMU/IED/MDT071}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.13 $ %
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \def\SCCSdate{\FormatDate{$Date: 2002/10/17 15:10:58 $ %
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPdate{\SCCSdate}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{ML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{R.B.Jones & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{K.Blackburn & WIN01\\D.J.~King & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & Project Manager}
%% LaTeX2e port: \TPPabstract{A set of module tests are given for the
%% LaTeX2e port: functions (conversions, etc) associated with the
%% LaTeX2e port: theory of relations.
%% LaTeX2e port: It also checks that the theory design has been met by the theory implementation.}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	    Library
%% LaTeX2e port: }}
%% LaTeX2e port: %\TPPclass{CLASSIFICATION}
%% LaTeX2e port: %\def\TPPheadlhs{}
%% LaTeX2e port: %\def\TPPheadcentre{}
%% LaTeX2e port: %def\TPPheadrhs{}
%% LaTeX2e port: %\def\TPPfootlhs{}
%% LaTeX2e port: %\def\TPPfootcentre{}
%% LaTeX2e port: %\def\TPPfootrhs{}
%% LaTeX2e port: \begin{document}
%% LaTeX2e port: \makeTPPfrontpage
%% LaTeX2e port: \vfill
%% LaTeX2e port: \begin{center}
%% LaTeX2e port: \bf Copyright \copyright\ : Lemma 1 Ltd. 1992
%% LaTeX2e port: \end{center}

\begin{document}

\headsep=0mm
\FrontPage
\headsep=10mm

\setcounter{section}{-1}
\pagebreak
\section{Document Control}
\subsection{Contents List}
\tableofcontents
\subsection{Document Cross References}
\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes History}
\begin{description}

\item[Issues 1.1 (1992/05/07) to 1.6 (1992/06/17) ]
	First drafts of the document.

\item[Issues 1.17 to 1.11 (1993/02/02)]
	Add checks of Spivey's rules from~\cite{Spivey92}, the Z~Reference Manual.

\item[Issue 1.12 (1996/01/22)]
Made test output messages compatible with build process.
\item[Issue 1.13 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.14 (2002/10/17)] PPHol-specific updates for open source release
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
%\subsection{Changes Forecast}

\section{GENERAL}
\subsection{Scope}
This document contains the module testing of the functions
(conversions, etc) associated with the theory of relations, required
by~\cite{DS/FMU/IED/DTD071}.
The design is in \cite{DS/FMU/IED/DTD071} and it is implemented in \cite{DS/FMU/IED/IMP071}.

\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains the module testing for the material given in the
design document~\cite{DS/FMU/IED/DTD071}, following the test policy
given in that document and the general policy given
in~\cite{DS/FMU/IED/PLN008}.

The testing uses material from \cite{DS/FMU/IED/DTD013}.

\subsubsection{Dependencies}
This document is derived from the detailed design
in~\cite{DS/FMU/IED/DTD071} and is further influenced by the
implementation in~\cite{DS/FMU/IED/IMP071}.  It also requires a theory
check file, ``dtd071.tch'', created by running the Unix command ``{\tt
doctch dtd071}''.

\subsubsection{Deficiencies}
None known.
\section{TEST CASES}
The test cases are adapted from the so-called laws given in pp. 96-103 of
Spivey's Z~Reference Manual~\cite{Spivey92}. The intention is that
the proof context should support essentially automatic proof of all of
the laws. The tests are organised into groups, each group corresponding
to a page of \cite{Spivey92}. Not all the laws are true as stated and
a few require human intervention in the proof.

\section{INITIALISATION}
Initialise the test package:
=SML
use_file "dtd013";
use_file "imp013";
init_mt_results();
open_theory "bin_rel";

val bin_rel_defs = map snd(get_defns "-");

repeat drop_main_goal;
repeat pop_pc;
=TEX
=SML
fun list_eq (eq:'a * 'a -> bool) ((a :: x), (b :: y)) : bool = (
	eq(a,b) andalso list_eq eq (x, y)
) | list_eq eq ([], []) = true
| list_eq _ _ = false;
=TEX

\section{CHECK THE THEORY DESIGN}

=SML
"Check the theory design";
=TEX

=SML
use_file "dtd071.tch";
store_mt_results_show mt_run [
("theory design of bin_rel",
	theory_check_success,
	(),
	true)];
=TEX
\newpage
\section{CHECK THE PROOF CONTEXTS}

=SML
"Check the proof contexts";

push_merge_pcs["'bin_rel","hol2"];
=TEX

=IGN
set_merge_pcs["sets_ext", "'pair"];
set_merge_pcs["sets_ext", "'pair1"];
a(rewrite_tac bin_rel_defs THEN prove_tac nil);
=TEX

We save the test cases which allows us to rerun them later without
actually typing in the term.  This block of code is not used by the
normal test path.

We expect several tests to fail at present.  We keep track of them
to report the details at the end of the run.

=SML
val save_test_cases : (string * TERM) list ref = ref nil;
val expected_fails : (string * TERM) list ref = ref nil;

fun get_test_case (lab:string) = (
	(lab, lassoc3 (!save_test_cases) lab)
);

fun run_test (lab:string, t:TERM) = (
	diag_line("\n\n" ^ lab);
	push_goal(nil, t);
	a(prove_tac nil);
	repeat drop_main_goal
);

fun get_failed_test_labels () =
	map (fn (x,_) => x) (get_mt_results() drop (fn (_, x) => x));

fun run_failed_tests() = (
	let
		val fails = get_failed_test_labels();
		val e_fails = map (fn (x,_) => x) (!expected_fails);
	in
		map (run_test o get_test_case) (fails @ e_fails);
		()
	end
);
=TEX

The normal test path uses these next declarations. Most results
are provable automatically by the following tactic. First of all
it trys the $prove\_tac$ (from the $bin\_rel$ proof context).
Then, to accomodate the existentials introduced by things such
as relational composition it tries the existence prover to see if
that simplifies things. Then it tries equational simplification, which
will either prove the goal or give a foothold for a further go
with the $prove\_tac$ from the proof context, and finally if there's
anything left this is usually just because the predicate calculus
structure of the original goal was a bit too deep and a few goes with
forward chaining does the trick.

=SML
val my_prove_tac = (
	prove_tac[] THEN_TRY
	COND_T (is_∃ o snd) (prove_∃_tac) id_tac
	THEN_TRY PC_T1 "prop_eq_pair" asm_prove_tac[]
	THEN_TRY asm_prove_tac[]
	THEN_TRY REPEAT_N 3 (all_asm_fc_tac[])
);
local
	fun aux (lab:string) (tm:TERM) : bool = ((
			tac_proof(([], tm), my_prove_tac);
			true
		) handle Fail _ => false
	);
in
	fun make_test_case (lab:string, tm:TERM, expected_success:bool)
			: string * (TERM -> bool) * TERM * bool = (
		save_test_cases := (lab, tm) :: (!save_test_cases);
		if expected_success then () else
			expected_fails := (lab, tm) :: (!expected_fails);
		(lab, aux lab, tm, expected_success)
	);
end;
=TEX

These terms are copied from page~96 of the Z~Reference Manual~\cite{Spivey92}.


=IGN
:> map(make_test_case);
val it = fn : (string * TERM * bool) list -> (string * (TERM -> bool) * TERM * bool) list

:> store_mt_results_show mt_run ;
val it = fn : (string * ('a -> TERM) * 'a * TERM) list -> (string * bool) list



=SML
store_mt_results_show mt_run (map make_test_case [
("96_01",	⌜ x ∈ Dom R ⇔ ( ∃ y ⦁ (x ↦ y) ∈ R ) ⌝ , true ),
("96_02",	⌜ y ∈ Ran R ⇔ ( ∃ x ⦁ (x ↦ y) ∈ R ) ⌝ , true ),

(* 		⌜ Dom { x1 ↦ y1; ... ; xn ↦ yn } = { x1; ... ; xn } ⌝
			Spivey's statement *)
("96_03a",	⌜ Dom { } = { } ⌝ , true ),
("96_03b",	⌜ Dom { x1 ↦ y1 } = { x1 } ⌝ , true ),
("96_03c",	⌜ Dom { x1 ↦ y1; x2 ↦ y2 } = { x1; x2 } ⌝ , true ),
("96_03d",	⌜ Dom { x1 ↦ y1; x2 ↦ y2; x3 ↦ y3 } = { x1; x2; x3 } ⌝ , true ),
("96_03e",	⌜ Dom { x1 ↦ y1; x2 ↦ y2; x3 ↦ y3; x4 ↦ y4 } =
				{ x1; x2; x3; x4 } ⌝ , true ),
("96_03f",	⌜ ( ∃ y ⦁ ( x ↦ y ) ∈ S1 ) ⇔ x ∈ Dom S1 ⌝ , true ),
("96_03g",	⌜ Dom ( { x ↦ y } ∪ xy_s ) = { x } ∪ Dom xy_s ⌝ , true ),

(* 		⌜ Ran { x1 ↦ y1; ... ; xn ↦ yn } = { y1; ... ; yn } ⌝
			Spivey's statement *)
("96_04a",	⌜ Ran { } = { } ⌝ , true ),
("96_04b",	⌜ Ran { x1 ↦ y1 } = { y1 } ⌝ , true ),
("96_04c",	⌜ Ran { x1 ↦ y1; x2 ↦ y2 } = { y1; y2 } ⌝ , true ),
("96_04d",	⌜ Ran { x1 ↦ y1; x2 ↦ y2; x3 ↦ y3 } = { y1; y2; y3 } ⌝ , true ),
("96_04e",	⌜ Ran { x1 ↦ y1; x2 ↦ y2; x3 ↦ y3; x4 ↦ y4 } =
				{ y1; y2; y3; y4 } ⌝ , true ),
("96_04f",	⌜ ( ∃ x ⦁ ( x ↦ y ) ∈ S1 ) ⇔ y ∈ Ran S1 ⌝ , true ),
("96_04g",	⌜ Ran ( { x ↦ y } ∪ xy_s ) = { y } ∪ Ran xy_s ⌝ , true ),

("96_06",	⌜ Dom ( Q ∪ R ) = ( Dom Q ) ∪ ( Dom R ) ⌝ , true ),
("96_07",	⌜ Ran ( Q ∪ R ) = ( Ran Q ) ∪ ( Ran R ) ⌝ , true ),
("96_08",	⌜ Dom ( Q ∩ R ) ⊆ ( Dom Q ) ∩ ( Dom R ) ⌝ , true ),
("96_09",	⌜ Ran ( Q ∩ R ) ⊆ ( Ran Q ) ∩ ( Ran R ) ⌝ , true ),

("96_10",	⌜ Dom { } = { } ⌝ , true ),
("96_11",	⌜ Ran { } = { } ⌝ , true )
]);
=TEX

These terms are copied from page~97 of the Z~Reference Manual~\cite{Spivey92}.

=SML
store_mt_results_show mt_run (map make_test_case [
("97_01",	⌜ ( x ↦ x') ∈ Id X ⇔ ( x ∈ X ∧ x = x' ) ⌝ , true ),
("97_02",	⌜ ( x ↦ z ) ∈ P ⨾ Q ⇔ ( ∃ y ⦁ (x, y) ∈ P ∧ (y, z) ∈ Q ) ⌝ , true ),
("97_03",	⌜  P R_⨾_R ( Q ⨾ R ) = ( P ⨾ Q ) ⨾ R ⌝ , true ),

(*		⌜ Id X ⨾ P = P ⌝
			Not true in general, instead prove: *)
("97_04a",	⌜ Dom P ⊆ X ⇒ Id X ⨾ P = P ⌝ , true ),
("97_04b",	⌜ Id X ⨾ P = X ◁ P ⌝ , true ),

(*		⌜ P ⨾ Id Y = P ⌝
			Not true in general, instead prove: *)
("97_05a",	⌜ Ran P  ⊆ Y ⇒ P ⨾ Id Y = P ⌝ , true ),
("97_05b",	⌜ P R_⨾_R Id Y = P ▷ Y ⌝ , true ),
("97_06",	⌜ Id V ⨾ Id W = Id ( V ∩ W ) ⌝ , true )

(*		⌜ (f o g) x = f(g x) ⌝
	Spivey's statement not directly expressible here *)
]);
=TEX

The last item above, i.e.,
=INLINEFT
⌜ (f o g) x = f(g x) ⌝
=TEX
{} needs the functional application of relations, which is defined in
the "fun\_rel" theory in~\cite{DS/FMU/IED/DTD072}.

These terms are copied from page~98 of the Z~Reference Manual~\cite{Spivey92}.

=TEX
=SML
store_mt_results_show mt_run (map make_test_case [
("98_01",	⌜ S ◁ R = Id S ⨾ R ⌝ , true ),
(*		⌜ S ◁ R = (S × Y) ∩ R ⌝
			Not true in general, instead prove: *)
("98_02",	⌜ Ran R ⊆ Y ⇒ S ◁ R = (S × Y) ∩ R ⌝ , true ),
("98_03",	⌜ R ▷ T1 = R ⨾ Id T1 ⌝ , true ),
(*		⌜ R ▷ T1 = R ∩ (X × T1) ⌝
			Not true in general, instead prove: *)
("98_04",	⌜ Dom R ⊆ X ⇒ R ▷ T1 = R ∩ (X × T1) ⌝ , true ),
("98_05",	⌜ Dom (S ◁ R) = S ∩ Dom R ⌝ , true ),
("98_06",	⌜ Ran (R ▷ T1) = Ran R ∩ T1 ⌝ , true ),
("98_07",	⌜ S ◁ R ⊆ R ⌝ , true ),
("98_08",	⌜ R ▷ T1 ⊆ R ⌝ , true ),
("98_09",	⌜ (S ◁ R) ▷ T1 = S ◁ (R ▷ T1) ⌝ , true ),
("98_10",	⌜ S ◁ (V ◁ R) = (S ∩ V) ◁ R ⌝ , true ),
("98_11",	⌜ (R ▷ T1) ▷ W = R ▷ (T1 ∩ W) ⌝ , true )
]);
=TEX

=TEX

These terms are copied from page~99 of the Z~Reference Manual~\cite{Spivey92}.

=SML
store_mt_results_show mt_run (map make_test_case [
("99_01",	⌜ Dom R ⊆ X ⇒ S ⩤ R = (X \ S) ◁ R ⌝ , true ),
("99_02",	⌜ Ran R ⊆ Y ⇒ R ⩥ T1 = R ▷ (Y \ T1) ⌝ , true ),
("99_03",	⌜ (S ◁ R) ∪ (S ⩤ R) = R ⌝ , true ),
("99_04",	⌜ (R ▷ T1) ∪ (R ⩥ T1) = R ⌝ , true )
]);
=TEX

These terms are copied from page~100 of the Z~Reference Manual~\cite{Spivey92}.

=SML
store_mt_results_show mt_run (map make_test_case [
("100_01",	⌜ (y ↦ x) ∈ R↗~↕ ⇔ (x ↦ y) ∈ R ⌝ , true ),
("100_02",	⌜ (R↗~↕)↗~↕ = R ⌝ , true ),
("100_03",	⌜ (Q ⨾ R)↗~↕ = R↗~↕ ⨾ Q↗~↕ ⌝ , true ),
("100_04",	⌜ (Id V)↗~↕ = Id V ⌝ , true ),
("100_05",	⌜ Dom(R↗~↕) = Ran R ⌝ , true ),
("100_06",	⌜ Ran(R↗~↕) = Dom R ⌝ , true ),
("100_07",	⌜ Id(Dom R) ⊆ R ⨾ R↗~↕ ⌝ , true ),
("100_08",	⌜ Id(Ran R) ⊆ R↗~↕ ⨾ R ⌝ , true )
]);
=TEX
These terms are copied from page~101 of the Z~Reference Manual~\cite{Spivey92}.

=SML
store_mt_results_show mt_run (map make_test_case [
("101_01",	⌜ y ∈ R Image S ⇔ (∃ x ⦁ x ∈ S ∧ (x, y) ∈ R) ⌝ , true ),
("101_02",	⌜ R Image S = Ran(S ◁ R) ⌝ , true ),
("101_03",	⌜ Dom(Q ⨾ R) = Q↗~↕ Image (Dom R) ⌝ , true ),
("101_04",	⌜ Ran(Q ⨾ R) = R Image (Ran Q) ⌝ , true ),
("101_05",	⌜ R Image (S ∪ T1) = R Image S ∪ R Image T1 ⌝ , true ),
("101_06",	⌜ R Image (S ∩ T1) ⊆ R Image S ∩ R Image T1 ⌝ , true ),
("101_07",	⌜ R Image (Dom R) = Ran R ⌝ , true ),
("101_08",	⌜ Dom R = (Graph Fst) Image R ⌝ , false ),
("101_09",	⌜ Ran R = (Graph Snd) Image R ⌝ , false )
]);
=TEX
The two results involving $Graph$ fail because the definition
of $Image$ results in a single variable which is a pair, and the
membership statements involvign this then give rise to appearances of
$Fst$ and $Snd$.
=SML
"101_08a";
repeat drop_main_goal;
push_goal(nil, ⌜ Dom R = (Graph Fst) Image R ⌝);
a(prove_tac nil);
a(∃_tac ⌜(x, y)⌝ THEN rewrite_tac nil THEN REPEAT strip_tac);
a(∃_tac ⌜Snd x'⌝ THEN asm_rewrite_tac nil THEN REPEAT strip_tac);

store_mt_results_show mt_run [
("101_08a", fn x => (pop_thm x; true), (), true)
];
=TEX

=SML
"101_09a";
repeat drop_main_goal;
push_goal(nil, ⌜ Ran R = (Graph Snd) Image R ⌝);
a(prove_tac nil);
a(∃_tac ⌜(x', x)⌝ THEN rewrite_tac nil THEN REPEAT strip_tac);
a(∃_tac ⌜Fst x'⌝ THEN asm_rewrite_tac nil THEN REPEAT strip_tac);

store_mt_results_show mt_run [
("101_09a", fn x => (pop_thm x; true), (), true)
];
=TEX

These terms are copied from page~102 of the Z~Reference Manual~\cite{Spivey92}.
(The last two involve application of a relation and so cannot be expressed
in the vocabulary of theory $bin\_rel$.)
=SML
store_mt_results_show mt_run (map make_test_case [
("102_01",	⌜ R ⊕ R = R ⌝ , true ),
("102_02",	⌜ P ⊕ (Q ⊕ R) = (P ⊕ Q) ⊕ R ⌝ , true ),
("102_03",	⌜ P = { } ⊕ P ⌝ , true ),
("102_04",	⌜ P = P ⊕ { } ⌝ , true ),
("102_05",	⌜ Dom(Q ⊕ R) = Dom Q ∪ Dom R ⌝ , true ),
("102_06",	⌜ Dom Q ∩ Dom R = { } ⇒ Q ⊕ R = Q ∪ R ⌝ , true ),
("102_07",	⌜ V ◁ (Q ⊕ R) = (V ◁ Q) ⊕ (V ◁ R) ⌝ , true ),
("102_08",	⌜ (Q ⊕ R) ▷ W ⊆ (Q ▷ W) ⊕ (R ▷ W) ⌝ , true )
(*		⌜ x ∈ (Dom f) \ (Dom g) ⇒ (f ⊕ g) x = f x ⌝ *)
(*		⌜ x ∈ Dom g ⇒ (f ⊕ g) x = g x ⌝ *)
]);
=TEX


These terms are copied from page~103 of the Z~Reference Manual~\cite{Spivey92}.

=SML
val terms103 = [
("103_01",	(⌜ r ⊆ r↗+↕ ⌝ , true )),
("103_02",	(⌜ r↗+↕ ⨾ r↗+↕ ⊆ r↗+↕ ⌝ , false )),
("103_03",	(⌜ r ⊆ q ∧ q ⨾ q ⊆ q ⇒ r↗+↕ ⊆ q ⌝ , false )),
("103_04",	(⌜ Id X ⊆ r↗*↕ ⌝ , false )),
("103_05",	(⌜ r ⊆ r↗*↕ ⌝ , false )),
("103_06",	(⌜ r↗*↕ ⨾ r↗*↕ = r↗*↕ ⌝ , false )),
("103_07",	(⌜ Id Universe ⊆ q ∧ r ⊆ q ∧ q ⨾ q ⊆ q ⇒ r↗*↕ ⊆ q ⌝ , false )),
("103_08",	(⌜ r↗*↕ = r↗+↕ ∪ Id Universe ⌝ , false )),
("103_09",	(⌜ r↗*↕ = ( r ∪ Id Universe) ↗+↕ ⌝ , false )),
("103_10",	(⌜ r↗+↕ = r ⨾ r↗*↕ ⌝ , false )),
("103_11",	(⌜ r↗+↕ = r↗*↕ ⨾ r ⌝ , false )),
("103_12",	(⌜ ( r↗+↕ )↗+↕ = r↗+↕ ⌝ , false )),
("103_13",	(⌜ ( r↗*↕ )↗*↕ = r↗*↕ ⌝ , false )),
("103_14",	(⌜ s ⊆ r↗*↕ Image s ⌝ , false )),
("103_15",	(⌜ r Image ( r↗*↕ Image s ) ⊆ r↗*↕ Image s ⌝ , false )),
("103_16",	(⌜ s ⊆ t ∧ r Image t ⊆ t ⇒ r↗*↕ Image s ⊆ t ⌝ , false ))
];
(*	Trying all of these to see which fail takes too long:
store_mt_results_show mt_run
	(map (make_test_case o (fn (x,(y, z)) => (x,y,z))) [hd terms103]);
*)
=TEX
=SML
"103_02";
repeat drop_main_goal;
set_goal(nil, fst(lassoc3 terms103 "103_02"));
a(rewrite_tac[] THEN REPEAT strip_tac
	THEN asm_fc_tac[]
	THEN all_asm_fc_tac[]);
store_mt_results_show mt_run [
("103_02a", fn x => (pop_thm x; true), (), true)
];
=TEX
=SML
"103_03";
repeat drop_main_goal;
set_goal(nil, fst(lassoc3 terms103 "103_03"));
a(rewrite_tac[] THEN REPEAT strip_tac
	THEN asm_fc_tac[]
	THEN all_asm_fc_tac[]);
store_mt_results_show mt_run [
("103_03a", fn x => (pop_thm x; true), (), true)
];
=TEX
=SML
"103_04";
repeat drop_main_goal;
set_goal(nil, fst(lassoc3 terms103 "103_04"));
a(rewrite_tac[] THEN REPEAT strip_tac THEN PC_T1 "prop_eq_pair" asm_prove_tac[]
	THEN asm_fc_tac[]
	THEN all_asm_fc_tac[]);
store_mt_results_show mt_run [
("103_04a", fn x => (pop_thm x; true), (), true)
];
=TEX
=SML
"103_05";
repeat drop_main_goal;
set_goal(nil, fst(lassoc3 terms103 "103_05"));
a(rewrite_tac[] THEN REPEAT strip_tac THEN PC_T1 "prop_eq_pair" asm_prove_tac[]
	THEN asm_fc_tac[]
	THEN all_asm_fc_tac[]);
store_mt_results_show mt_run [
("103_05a", fn x => (pop_thm x; true), (), true)
];
=TEX
=SML
"103_06";
repeat drop_main_goal;
set_goal(nil, fst(lassoc3 terms103 "103_06"));
a(rewrite_tac[] THEN REPEAT strip_tac THEN PC_T1 "prop_eq_pair" asm_prove_tac[]
	THEN asm_fc_tac[]
	THEN all_asm_fc_tac[]);
store_mt_results_show mt_run [
("103_06a", fn x => (pop_thm x; true), (), true)
];
=TEX
=SML
"103_07";
repeat drop_main_goal;
set_goal(nil, fst(lassoc3 terms103 "103_07"));
a(rewrite_tac[] THEN REPEAT strip_tac THEN PC_T1 "prop_eq_pair" asm_prove_tac[]
	THEN asm_fc_tac[]
	THEN all_asm_fc_tac[]);
a(swap_nth_asm_concl_tac 1 THEN GET_NTH_ASM_T 4 bc_thm_tac THEN strip_tac);
store_mt_results_show mt_run [
("103_07a", fn x => (pop_thm x; true), (), true)
];
=TEX
=SML
"103_08a";
repeat drop_main_goal;
set_goal(nil, fst(lassoc3 terms103 "103_08"));
a(rewrite_tac[] THEN REPEAT strip_tac THEN PC_T1 "prop_eq_pair" asm_prove_tac[]
	THEN asm_fc_tac[]
	THEN all_asm_fc_tac[]);
a(swap_nth_asm_concl_tac 5 THEN strip_tac);
a(∃_tac⌜s ∪ Id Universe⌝ THEN REPEAT strip_tac
	THEN PC_T1 "prop_eq_pair" asm_prove_tac[]
	THEN asm_fc_tac[]
	THEN all_asm_fc_tac[]);
store_mt_results_show mt_run [
("103_08a", fn x => (pop_thm x; true), (), true)
];
=TEX
=SML
"103_09";
repeat drop_main_goal;
set_goal(nil, fst(lassoc3 terms103 "103_09"));
a(rewrite_tac[] THEN REPEAT strip_tac THEN PC_T1 "prop_eq_pair" asm_prove_tac[]
	THEN asm_fc_tac[]
	THEN all_asm_fc_tac[]);
(* *** Goal "1" *** *)
a(swap_nth_asm_concl_tac 3 THEN strip_tac);
a(∃_tac⌜s⌝ THEN REPEAT strip_tac
	THEN PC_T1 "prop_eq_pair" asm_prove_tac[]
	THEN asm_fc_tac[]
	THEN all_asm_fc_tac[]);
a(list_spec_nth_asm_tac 2 [⌜x⌝, ⌜x⌝]);
(* *** Goal "2" *** *)
a(swap_nth_asm_concl_tac 4 THEN strip_tac);
a(∃_tac⌜s⌝ THEN REPEAT strip_tac
	THEN PC_T1 "prop_eq_pair" asm_prove_tac[]
	THEN asm_fc_tac[]
	THEN all_asm_fc_tac[]);
store_mt_results_show mt_run [
("103_09a", fn x => (pop_thm x; true), (), true)
];
=TEX
Time has not permitted proof of the remaining results about the two
closure operations.
\newpage
\section{END OF TESTS}

=SML
diag_string "\n\n\
	\We do not expect all of the rules from Spivey's Z Reference \
	\Manual to be proven automatically by the proof context.  The \
	\Module tests here accomodate this view by having a boolean to \
	\show the expected success or otherwise of the proof.  Tests \
	\that unexpectedly fail to be proven are considered failed. \
	\Less obviously, tests that are unexpectedly proven are \
	\also considered failed.\n\n";

("Expected proof failures", !expected_fails);

diag_string(
	(string_of_int(length(!expected_fails))) ^
	" expected proof failures which are not counted as failing tests below.");

("Number of failing tests",
	length(map(fn (x,_) => x)
		(get_mt_results() drop (fn (_, x) => x))));
diag_string(summarize_mt_results());
=TEX

\end{document}


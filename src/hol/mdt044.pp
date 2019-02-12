=IGN
********************************************************************************
mdt044.doc: this file is part of the PPHol system

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

\def\Title{Module Tests for the Theory of Sets}

\def\AbstractText{A set of module tests are given for the functions (conversions ,etc) associated with the theory of sets. It also checks that the theory design has been met by the theory implementation.}

\def\Reference{DS/FMU/IED/MDT044}

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
%% LaTeX2e port: \TPPproject{FST PROJECT}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Module Tests for the Theory of Sets}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Module Tests for the \cr Theory of Sets}
%% LaTeX2e port: \TPPref{DS/FMU/IED/MDT044}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.14 $ %
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \def\SCCSdate{\FormatDate{$Date: 2002/10/17 16:20:01 $ %
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPdate{\SCCSdate}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{ML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.Blackburn & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{K.Blackburn & WIN01\\D.J.~King & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & Project Manager}
%% LaTeX2e port: \TPPabstract{A set of module tests are given for the
%% LaTeX2e port: functions (conversions ,etc) associated with the
%% LaTeX2e port: theory of sets.
%% LaTeX2e port: It also checks that the theory design has been met by the theory implementation.}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	    Library
%% LaTeX2e port: }}
%% LaTeX2e port: \begin{document}
%% LaTeX2e port: \makeTPPfrontpage
%% LaTeX2e port: \vfill
%% LaTeX2e port: \begin{centering}
%% LaTeX2e port: \bf Copyright \copyright\ : Lemma 1 Ltd. \number\year
%% LaTeX2e port: \end{centering}

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
\item [Issue 1.1 (1991/10/02)]
First draft version, works for \cite{DS/FMU/IED/IMP044} version 1.2.

\item[Issue 1.2 (1992/01/20), (\FormatDate{92/01/20}) ] Updated to use new fonts.

\item[Issue 1.3 (1992/03/30) ]\

Updated to test against \cite{DS/FMU/IED/DTD044} version ?.

\item [Issue 1.4 (1992/04/09) (9th April 1992)]
Changes required by CR0016.
\item [Issue 1.5 (1992/04/14) (14th April 1992)]
Changes required by CR0017.
\item [Issue 1.7 (1992/05/18),1.8 (1992/05/18) (18th May 1992)]
Modified proof context material.
\item [Issue 1.9 (1992/05/21) (20th May 1992)]
Removed proof contexts "$build\_sets\_?$".
\item [Issue 1.10 (1992/05/27) (27th May 1992)]
Added $sets\_simple\_∃\_conv$.
\item[Issue 1.11 (1992/06/24) (24th June 1992)]
Renamings from issue 1.6 of \cite{DS/FMU/IED/WRK038},
mostly proof context name changes.
\item[Issue 1.12 (1993/01/27) (27th January 1993)]
Added $sets\_eq\_conv$ etc.
\item[Issue 1.13 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.14 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.15 (2006/12/10)] Added examples using symmetric difference.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
Additions, as required by the additions of functions
to \cite{DS/FMU/IED/DTD044}.
\section{GENERAL}
\subsection{Scope}
This document contains the module testing of thfunctions (conversions ,etc) associated with the
theory of sets, required by \cite{DS/FMU/IED/DTD044}.
The design is in \cite{DS/FMU/IED/DTD044}
and it is
implemented in \cite{DS/FMU/IED/IMP044}.

\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains the module testing of the function material given a design in \cite{DS/FMU/IED/DTD044},
following the test policy given in that document and the general policy given in \cite{DS/FMU/IED/PLN008}.

The testing uses material from \cite{DS/FMU/IED/DTD013}.

\subsubsection{Dependencies}
This document is derived from the detailed design in \cite{DS/FMU/IED/DTD044},
and is further influenced by the implementation, in  \cite{DS/FMU/IED/IMP044}.
It also requires a theory check file, ``dtd044.tch'', created
by \[doc4thcheck\ dtd044\]

\subsubsection{Deficiencies}
Unable to test message 44013, as not certain that it can be raised by $sets\-\_simple\-\_∃\-\_conv$.
\section{INITIALISATION}
Initialise the test package
(if we don't have proof context ``basic$\_$hol'' then use
whatever is present).
=SML
use_file "dtd013";
use_file "imp013";
init_mt_results();
open_theory "sets";
push_merge_pcs ["'propositions","'paired_abstractions"];
repeat drop_main_goal;
=TEX
=SML
fun list_eq (eq:'a * 'a -> bool) ((a :: x), (b :: y)) : bool = (
	eq(a,b) andalso list_eq eq (x, y)
) | list_eq eq ([], []) = true
| list_eq _ _ = false;
=TEX
\section{TESTING FUNCTIONS OF THE DESIGN}
=SML
store_mt_results (mt_runf (op =#))[
("simple_∈_comp_conv 1",
	dest_thm o simple_∈_comp_conv,
	⌜xx ∈ {vv | vv = 0}⌝,
	([],⌜xx ∈ {vv | vv = 0} ⇔ xx = 0⌝)),
("simple_∈_comp_conv 2",
	dest_thm o simple_∈_comp_conv,
	⌜x ∈ {v | 0 = v}⌝,
	([],⌜x ∈ {v | 0 = v} ⇔ 0 = x⌝)),
("simple_∈_comp_conv 3",
	dest_thm o simple_∈_comp_conv,
	⌜x ∈ {v | T}⌝,
	([],⌜x ∈ {v | T} ⇔ T⌝))];
=TEX
=SML
store_mt_results mt_run_fail [
("simple_∈_comp_conv 44001 a",
	simple_∈_comp_conv,
	⌜T⌝,
	gen_fail_msg "simple_∈_comp_conv" 44001 ["⌜T⌝"]),
("simple_∈_comp_conv 44001 b",
	simple_∈_comp_conv,
	⌜x ∈ {(p,q) | p = q}⌝,
	gen_fail_msg "simple_∈_comp_conv" 44001 ["⌜x ∈ {(p, q)|p = q}⌝"])];
=TEX
\subsection{∈\_comp\_conv}
=SML
store_mt_results (mt_runf (op =#))[
("∈_comp_conv 1",
	dest_thm o ∈_comp_conv,
	⌜(a,b) ∈ {(x,y) | x ∨ y}⌝,
	([],⌜((a,b) ∈ {(x,y) | x ∨ y}) ⇔ a ∨ b⌝)),
("∈_comp_conv 2",
	dest_thm o ∈_comp_conv,
	⌜a ∈ {y | a ∨ y}⌝,
	([],⌜(a ∈ {y | a ∨ y}) ⇔ a ∨ a⌝)),
("∈_comp_conv 3",
	dest_thm o ∈_comp_conv,
	⌜a ∈ {(x,y) | x ∨ y}⌝,
	([],⌜(a ∈ {(x,y) | x ∨ y}) ⇔ Fst a ∨ Snd a⌝))
	];
store_mt_results mt_run_fail [
("∈_comp_conv 27002",
	∈_comp_conv,
	⌜x ∈ s⌝,
	gen_fail_msg "∈_comp_conv" 27002 ["⌜x ∈ s⌝"])
	];
=TEX
\subsection{∈\_enum\_set\_rule}
=SML
store_mt_results (mt_runf (op =#))[
("∈_enum_set_rule 1",
	dest_thm o ∈_enum_set_rule ⌜b⌝,
	[⌜a⌝, ⌜a⌝, ⌜b⌝, ⌜c⌝],
	([],⌜b ∈ {a; a; b; c}⌝)),
("∈_enum_set_rule 2",
	dest_thm o ∈_enum_set_rule ⌜1⌝,
	[⌜1⌝],
	([],⌜1 ∈ {1}⌝))
	];
store_mt_results mt_run_fail [
("∈_enum_set_rule 3012",
	∈_enum_set_rule ⌜b⌝,
	[⌜1⌝,⌜b⌝],
	gen_fail_msg "∈_enum_set_rule" 3012 ["⌜1⌝","⌜b⌝"]),
("∈_enum_set_rule 27001 a",
	∈_enum_set_rule ⌜1⌝,
	[⌜a⌝,⌜b⌝],
	gen_fail_msg "∈_enum_set_rule" 27001 ["⌜1⌝"]),
("∈_enum_set_rule 27001 b",
	∈_enum_set_rule ⌜1⌝,
	[],
	gen_fail_msg "∈_enum_set_rule" 27001 ["⌜1⌝"])
	];
=TEX
\subsection{∈\_enum\_set\_conv}
=SML
store_mt_results (mt_runf (op =#))[
("∈_enum_set_conv 1",
	dest_thm o ∈_enum_set_conv,
	⌜b ∈ {a; a; b; c}⌝,
	([],⌜b ∈ {a; a; b; c} ⇔ T⌝)),
("∈_enum_set_conv 2",
	dest_thm o ∈_enum_set_conv,
	⌜1 ∈ {1}⌝,
	([],⌜1 ∈ {1} ⇔ T⌝))
	];
store_mt_results mt_run_fail [
("∈_enum_set_conv 27005",
	∈_enum_set_conv,
	mk_t,
	gen_fail_msg "∈_enum_set_conv" 27006 ["⌜T⌝"]),
("∈_enum_set_conv 27006 a",
	∈_enum_set_conv,
	⌜1 ∈ {0;2;3}⌝,
	gen_fail_msg "∈_enum_set_conv" 27005 ["⌜1⌝","⌜{0; 2; 3}⌝"]),
("∈_enum_set_conv 27006 b",
	∈_enum_set_conv,
	⌜1 ∈ {}⌝,
	gen_fail_msg "∈_enum_set_conv" 27005 ["⌜1⌝","⌜{}⌝"])
	];
=TEX
\subsection{sets$\_$simple$\_$∃$\_$conv}
=SML
let
val tm1 = ⌜∃ S ⦁ x ∈ S ⇔ ¬(x = 0)⌝;
val tm2 =  ⌜∃ S ⦁ ∀ x ⦁ x ∈ S ⇔ ¬(x = 0)⌝;
val tm3 =  ⌜∃ S ⦁ ∀ x y ⦁ x ∈ S y ⇔ ¬(x = y)⌝;
val tm4 =  ⌜∃ S ⦁ ∀ x y z ⦁ ¬(x = y ∨ x = z) ⇔ x ∈ S y z⌝;
val tm5 =  ⌜∃ S ⦁ ∀ x y ⦁ x ∈ S y ⇔ y ∈ S x⌝;
val tm6 =  ⌜∃ S ⦁ ∀ x y ⦁ x ∈ S (y ∈ S T) ⇔ (y = x)⌝;
in
store_mt_results (mt_runf (op =$)) [
	("sets_simple_∃_conv 1",
	concl o sets_simple_∃_conv,
	tm1,
	mk_⇔(tm1,⌜∃ S' ⦁ S' x ⇔ ¬(x = 0)⌝)),
	("sets_simple_∃_conv 2",
	concl o sets_simple_∃_conv,
	tm2,
	mk_⇔(tm2,⌜∃ S' ⦁ ∀ x ⦁ S' x ⇔ ¬(x = 0)⌝)),
	("sets_simple_∃_conv 3",
	concl o sets_simple_∃_conv,
	tm3,
	mk_⇔(tm3,⌜∃ S' ⦁ ∀ x y ⦁ S' y x ⇔ ¬(x = y)⌝)),
	("sets_simple_∃_conv 4",
	concl o sets_simple_∃_conv,
	tm4,
	mk_⇔(tm4,⌜∃ S' ⦁ ∀ x y z ⦁ ¬(x = y ∨ x = z) ⇔ S' y z x⌝)),
	("sets_simple_∃_conv 5",
	concl o sets_simple_∃_conv,
	tm5,
	mk_⇔(tm5,⌜∃ S' ⦁ ∀ x y ⦁ S' y x ⇔ S' x y⌝)),
	("sets_simple_∃_conv 6",
	concl o sets_simple_∃_conv,
	tm6,
	mk_⇔(tm6,⌜∃ S' ⦁ ∀ x y ⦁ S' (S' T y) x ⇔ (y = x)⌝))]
end;
=TEX
=SML
store_mt_results mt_run_fail [
	("sets_simple_∃_conv 44010 a",
	sets_simple_∃_conv,
	⌜T⌝,
	gen_fail_msg "sets_simple_∃_conv" 44010 ["⌜T⌝"]),
	("sets_simple_∃_conv 44010 b",
	sets_simple_∃_conv,
	⌜∃ x : 'a ⦁ T⌝,
	gen_fail_msg "sets_simple_∃_conv" 44010 ["⌜∃ x⦁ T⌝"]),
	("sets_simple_∃_conv 44010",
	sets_simple_∃_conv,
	⌜∃ x : BOOL ⦁ T⌝,
	gen_fail_msg "sets_simple_∃_conv" 44010 ["⌜∃ x⦁ T⌝"]),
	("sets_simple_∃_conv 44011",
	sets_simple_∃_conv,
	⌜∃ S : 'a SET ⦁ T⌝,
	gen_fail_msg "sets_simple_∃_conv" 44011 ["⌜∃ S⦁ T⌝"]),
	("sets_simple_∃_conv 44012",
	sets_simple_∃_conv,
	⌜∃ S ⦁ ∀ x y ⦁ x ∈ S y ∧ S = S1⌝,
	gen_fail_msg "sets_simple_∃_conv" 44012
	    ["⌜∃ S⦁ ∀ x y⦁ x ∈ S y ∧ S = S1⌝","⌜S⌝"])];
=TEX
\subsection{Extensionality Conversions}
=SML
store_mt_results (mt_runf (op =$)) [
	("sets_eq_conv 1",
	concl o sets_eq_conv,
	⌜a : 'a SET = b⌝,
	⌜a = b ⇔ (∀ x : 'a ⦁ x ∈ a ⇔ x ∈ b)⌝),
	("sets_eq_conv 2",
	concl o sets_eq_conv,
	⌜a : ('a × 'b) SET = b⌝,
	⌜a = b ⇔ (∀ x1: 'a; x2 : 'b⦁ (x1, x2) ∈ a ⇔ (x1, x2) ∈ b)⌝),
	("sets_eq_conv 3",
	concl o sets_eq_conv,
	⌜a : ('a × ('b × 'c)) SET = b⌝,
	⌜a = b ⇔ (∀ x1: 'a; x2: 'b; x3: 'c⦁ (x1, x2, x3) ∈ a ⇔ (x1, x2, x3) ∈ b)⌝),
	("sets_eq_conv 4",
	concl o sets_eq_conv,
	⌜a : (('a × 'd) × ('b × 'c)) SET = x3⌝,
	⌜a : (('a × 'd) × ('b × 'c)) SET = x3
   	 ⇔ (∀ x1 x2 x4 x5⦁ ((x1, x2), x4, x5) ∈ a ⇔ ((x1, x2), x4, x5) ∈ x3)⌝)
];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("⊆_conv 1",
	concl o ⊆_conv,
	⌜a : 'a SET ⊆ b⌝,
	⌜a ⊆ b ⇔ (∀ x : 'a ⦁ x ∈ a ⇒ x ∈ b)⌝),
	("⊆_conv 2",
	concl o ⊆_conv,
	⌜a : ('a × 'b) SET ⊆ b⌝,
	⌜a ⊆ b ⇔ (∀ x1: 'a; x2 : 'b⦁ (x1, x2) ∈ a ⇒ (x1, x2) ∈ b)⌝),
	("⊆_conv 3",
	concl o ⊆_conv,
	⌜a : ('a × ('b × 'c)) SET ⊆ b⌝,
	⌜a ⊆ b ⇔ (∀ x1: 'a; x2: 'b; x3: 'c⦁ (x1, x2, x3) ∈ a ⇒ (x1, x2, x3) ∈ b)⌝),
	("⊆_conv 4",
	concl o ⊆_conv,
	⌜a : (('a × 'd) × ('b × 'c)) SET ⊆ x3⌝,
	⌜a : (('a × 'd) × ('b × 'c)) SET ⊆ x3
   	 ⇔ (∀ x1 x2 x4 x5⦁ ((x1, x2), x4, x5) ∈ a ⇒ ((x1, x2), x4, x5) ∈ x3)⌝)
];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [
	("⊂_conv 1",
	concl o ⊂_conv,
	⌜a : 'a SET ⊂ b⌝,
	⌜a ⊂ b ⇔ (∀ x : 'a ⦁ x ∈ a ⇒ x ∈ b) ∧ (∃ x⦁ ¬ x ∈ a ∧ x ∈ b)⌝),
	("⊂_conv 2",
	concl o ⊂_conv,
	⌜a : ('a × 'b) SET ⊂ b⌝,
	⌜a ⊂ b ⇔ (∀ x1: 'a; x2 : 'b⦁ (x1, x2) ∈ a ⇒ (x1, x2) ∈ b)
	∧ (∃ x1 x2⦁ ¬ (x1, x2) ∈ a ∧ (x1, x2) ∈ b)⌝)
];
=TEX
=SML
store_mt_results mt_run_fail [
	("sets_eq_conv error 44021",
	sets_eq_conv,
	⌜¬a : 'a SET = b⌝,
	gen_fail_msg "sets_eq_conv" 44021 [string_of_term⌜¬a : 'a SET = b⌝]),
	("sets_eq_conv error 44022",
	⊆_conv,
	⌜¬a : 'a SET ⊆ b⌝,
	gen_fail_msg "⊆_conv" 44022 [string_of_term⌜¬a : 'a SET ⊆ b⌝]),
	("⊂_conv error 44023",
	⊂_conv,
	⌜¬a : 'a SET ⊂ b⌝,
	gen_fail_msg "⊂_conv" 44023 [string_of_term⌜¬a : 'a SET ⊂ b⌝])
];
=TEX
\section{CHECK THE THEORY DESIGN}
=SML
use_file "dtd044.tch";
store_mt_results mt_run [
("theory design of set",
	theory_check_success,
	(),
	true)];
=TEX
\section{CHECK THE ``$'$sets$\_$ext'' PROOF CONTEXT}
This is declared in \cite{DS/FMU/IED/IMP076},
but more fully tested here than in its
implementations module tests.
=SML
push_merge_pcs ["basic_hol","'sets_ext"]
handle _ => ();
local
fun map_tactic t = map (fn x => (
		let	val res = tac_proof(([],x),t);
		in (snd o dest_thm) res
		end))
in
local
val terms1 =
	[
		⌜a ∪ a = a ∪ {}⌝,
		⌜a ∪ {} = a ∩ a⌝,
		⌜a ∩ a = a \ {}⌝,
		⌜a \ {} = a⌝,
		⌜a ∩ {} = a \ a⌝,
		⌜a \ a = {} \ a⌝,
		⌜{} \ a = {}⌝,
		⌜a ⊖ a = {}⌝,
		⌜{} ⊖ a = a⌝,
		⌜a ∪ b = b ∪ a⌝,
		⌜a ∩ b = b ∩ a⌝,
		⌜a ⊖ b = b ⊖ a⌝,
		⌜a ∪ (b ∪ c) = (a ∪ b) ∪ c⌝,
		⌜a ∩ (b ∩ c) = (a ∩ b) ∩ c⌝,
		⌜a ∪ (b ∩ c) = (a ∪ b) ∩ (a ∪ c)⌝,
		⌜a ∩ (b ∪ c) = (a ∩ b) ∪ (a ∩ c)⌝,
		⌜(a ∩ b) ∪ (a \ b) = a⌝,
		⌜(a \ b) ∩ b = {}⌝,
		⌜a \ (b \ c) = (a \ b) ∪ (a ∩ c)⌝,
		⌜(a \ b) \ c = (a \ (b ∪ c))⌝,
		⌜a ∪ (b \ c) = (a ∪ b) \ (c \ a)⌝,
		⌜a ∩ (b \ c) = (a ∩ b) \ c⌝,
		⌜(a ∪ b) \ c = (a \ c) ∪ (b \ c)⌝,
		⌜a \ (b ∩ c) = (a \ b) ∪ (a \ c)⌝,
		⌜a ⊖ (b ⊖ c) = (a ⊖ b) ⊖ c⌝
	];
in
val _ =
store_mt_results (mt_runf (list_eq(op =$)))[
("proof context sets_ext 1",
	map_tactic contr_tac,
	terms1,
	terms1)];
val _ =
store_mt_results (mt_runf (list_eq(op =$)))[
("proof context sets_ext 2",
	map_tactic (REPEAT strip_tac),
	terms1,
	terms1)]
end;
local
val terms2 =
	[	⌜¬ x ∈ {}⌝,
		⌜a ⊆ a⌝,
		⌜¬ a ⊂ a⌝,
		⌜{} ⊆ a⌝,
		⌜⋃ {} = {}⌝
	];
in
val it =
store_mt_results (mt_runf (list_eq(op =$))) [
("proof context sets_ext 3",
	map_tactic contr_tac,
	terms2,
	terms2)];
val it =
store_mt_results (mt_runf (list_eq(op =$))) [
("proof context sets_ext 4",
	map_tactic (REPEAT strip_tac),
	terms2,
	terms2)]
end;
end;
=TEX

\section{END OF TESTS}
=SML
diag_string(summarize_mt_results());
=TEX
\end{document}




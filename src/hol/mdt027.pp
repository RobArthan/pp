=IGN
********************************************************************************
mdt027.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% mdt027.doc   ℤ $Date: 2011/02/06 13:08:37 $ $Revision: 1.33 $ $RCSfile: mdt027.doc,v $
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

\def\Title{Module Tests for the Derived Rules of Inference II}

\def\AbstractText{A set of module tests are given for the the second group of derived rules of inference.}

\def\Reference{DS/FMU/IED/MDT027}

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
%% LaTeX2e port: \TPPtitle{Module Tests for the Derived Rules of Inference II}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Module Tests for the \cr Derived Rules of Inference II}
%% LaTeX2e port: \TPPref{DS/FMU/IED/MDT027}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.33 $ %
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2011/02/06 13:08:37 $ %
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{ML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.Blackburn & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & Project Manager}
%% LaTeX2e port: \TPPabstract{A set of module tests are given for the
%% LaTeX2e port: the second group of derived rules of inference.}
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
\item [Issue 1.1 (1991/10/10),1.2 (1991/10/16)]
First drafts.
\item [Issue 1.3 (1991/11/12)]
Added $∃_1\_conv$
\item [Issue 1.4 (1991/11/19)]
Now sets the theory for tests.
\item [Issue 1.5 (1991/11/29)]
Changed typing due to changes in type inference.

\item[Issue 1.6 (1992/01/20), \FormatDate{92/01/20} ] Updated to use new fonts.
\item [Issue 1.7 (1992/01/21)]
Removed duplicate labels.
\item [Issue 1.8 (1992/01/28)]
Fixed typo.
\item[Issue 1.9 (1992/02/13),(13th February 1992)]
Moving material from 058 to 027.
\item [Issue 1.10 (1992/03/18),1.11 (1992/03/19),1.12 (1992/03/19)(11th March 1992)]
Various minor additions and extensions.
\item [Issue 1.13 (1992/04/01)(1st April 1992)]
Removed sets material.
\item [Issue 1.14 (1992/04/09) (9th April 1992)]
Changes required by CR0016.
\item [Issue 1.15 (1992/04/14) (14th April 1992)]
Changes required by CR0017.
\item [Issue 1.17 (1992/05/14) (14th May 1992)]
Tidying up proof contexts.
\item [Issue 1.18 (1992/05/21) (20th May 1992)]
Rearranging build proof contexts.
\item[Issue 1.19 (1992/06/24) (24th June 1992)]
Renamings from issue 1.6 of \cite{DS/FMU/IED/WRK038},
mostly proof context name changes.
\item[Issue 1.20 (1992/07/02) (2nd July 1992)]
Changed tests for $?\_reorder\_conv$.
\item [Issue 1.21 (1992/07/30) (3rd August 1992)] Added forward chaining rules and minor mods to matching modus
ponens (to accomodate changes to the simple versions).
\item [Issue 1.22 (1992/08/04),1.23 (1992/08/04) (4th August 1992)]
Bug fixing.
\item [Issue 1.24 (1992/11/11) (4th August 1992)]
Added tests for variants on $fc\_canon$.
\item [Issue 1.25 (1992/12/08) (8th December 1992)]
Fixed a use of $pp'ts\_def$.
\item [Issue 1.26 (1993/02/16),1.27 (1993/02/16) (16th Februrary 1993)]
Modified $fc\_rule$.
\item[Issue 1.28 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.29 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.30 (2005/12/16)] The prefix for private interfaces is now $pp'$ rather than $icl'$.
\item[Issue 1.31 (2008/08/06)] Added tests for
=INLINEFT
λ_pair_conv
=TEX
.
\item[Issue 1.32 (2008/10/30)] Added test for
=INLINEFT
list_simple_∃_intro
=TEX
.
\item[Issue 1.33 (2011/02/06)] Added test for
=INLINEFT
⇒_match_mp_rule2
=TEX
.
\item[Issue 1.34 (2012/03/19)] Added tests for
=INLINEFT
λ_unpair_conv
=TEX
.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
None.
\section{GENERAL}
\subsection{Scope}
This document contains the module testing of the second set of derived rules of inference.
The design is in \cite{DS/FMU/IED/DTD027}
and it is
implemented in \cite{DS/FMU/IED/IMP027}.

\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains the module testing of the material given a design in \cite{DS/FMU/IED/DTD027},
following the test policy given in that document and the general policy given in \cite{DS/FMU/IED/PLN008}.

\subsubsection{Dependencies}
This document is derived from the detailed design in \cite{DS/FMU/IED/DTD027},
and is further influenced by the implementation, in  \cite{DS/FMU/IED/IMP027}.
\subsubsection{Deficiencies}
None known.
\section{TEST CASES}
We test each function of the signature of \cite{DS/FMU/IED/DTD027}
in turn, where possible in the same order as in the design document, testing both successful, and all error, cases.
\section{PROLOGUE}
Initialise the test package:
=SML
use_file "dtd013.sml";
use_file "imp013.sml";
init_mt_results();
open_theory "basic_hol";
push_merge_pcs ["'propositions","'simple_abstractions"];
=TEX
\section{VALUE BINDINGS}
Such as can be given here:
=SML
val eq_thm1 = refl_conv ⌜x⌝;
val eq_tm2 = ⌜∀ x y z :'a⦁ f x y = f y z⌝
val eq_thm2 = all_simple_∀_elim(asm_rule eq_tm2);
val eq_tm3 = ⌜∀ x y:'a ⦁ f x y = f y z⌝;
val eq_thm3 = all_simple_∀_elim(asm_rule eq_tm3);
val uq_tm = ⌜∀ a b c d e ⦁ (a,b,c) = (a,d,e)⌝;
val uq_thm = all_simple_∀_elim (asm_rule uq_tm);
val Eq_thm = tac_proof(([],⌜T ∧ (T ∨ F) ∧ (F ∨ T) ∧ T⌝),
	REPEAT strip_tac);
val pa_thm1 = ∀_intro ⌜((a, b), c, d)⌝ (refl_conv ⌜((a, b), c, d)⌝);
val pa_thm2 = list_∀_intro [⌜((a, b), c, d)⌝ ,
	⌜((e,f),g,h)⌝]
	(refl_conv ⌜(((e,f),g,h):(('a × 'b) × ('c × 'd))),
	 (((a, b), c, d):(('a × 'b) × ('c × 'd)))⌝);
=TEX
\section{THE TESTS}
\subsection{varstruct$\_$variant}
=SML
store_mt_results (mt_runf (op =$)) [
	("varstruct_variant 1",
	varstruct_variant [],
	⌜x⌝,
	⌜x⌝),
	("varstruct_variant 2",
	varstruct_variant [],
	⌜x,y⌝,
	⌜x,y⌝),
	("varstruct_variant 3",
	varstruct_variant [],
	⌜x,x⌝,
	⌜(x':'a),(x:'a)⌝),
	("varstruct_variant 4",
	varstruct_variant [⌜x:'b⌝,⌜y:'b⌝],
	⌜(x,y,z)⌝,
	⌜(x',y',z)⌝)
	];
store_mt_results mt_run_fail [
	("varstruct_variant 4014",
	varstruct_variant [],
	⌜T⌝,
	gen_fail_msg "varstruct_variant" 4016 ["⌜T⌝"]),
	("varstruct_variant 3007",
	varstruct_variant [⌜T⌝],
	⌜x⌝,
	gen_fail_msg "varstruct_variant" 3007 ["⌜T⌝"])
	];

=TEX
\subsection{ALL$\_$∧$\_$C}
=SML
store_mt_results (mt_runf (op =#)) [
	("ALL_∧_C 1",
	dest_thm o ALL_∧_C eq_sym_conv,
	⌜a ∧ (a ⇔ b) ∧ c⌝,
	([],⌜(a ∧ (a ⇔ b) ∧ c) ⇔ (a ∧ (b ⇔ a) ∧ c)⌝)),
	("ALL_∧_C 2",
	dest_thm o ALL_∧_C eq_sym_conv,
	⌜(a ⇔ b)⌝,
	([],⌜(a ⇔ b) ⇔ (b ⇔ a)⌝))
	];
store_mt_results mt_run_fail [
	("ALL_∧_C 3014",
	ALL_∧_C eq_sym_conv,
	⌜a ∧ b⌝,
	gen_fail_msg "eq_sym_conv" 3014 ["⌜b⌝"])
	];
=TEX
\subsection{ALL$\_$∨$\_$C}
=SML
store_mt_results (mt_runf (op =#)) [
	("ALL_∨_C 1",
	dest_thm o ALL_∨_C eq_sym_conv,
	⌜a ∨ (a ⇔ b) ∨ c⌝,
	([],⌜(a ∨ (a ⇔ b) ∨ c) ⇔ (a ∨ (b ⇔ a) ∨ c)⌝)),
	("ALL_∨_C 2",
	dest_thm o ALL_∨_C eq_sym_conv,
	⌜(a ⇔ b)⌝,
	([],⌜(a ⇔ b) ⇔ (b ⇔ a)⌝))
	];
store_mt_results mt_run_fail [
	("ALL_∨_C 3014",
	ALL_∨_C eq_sym_conv,
	⌜a ∨ b⌝,
	gen_fail_msg "eq_sym_conv" 3014 ["⌜b⌝"])
	];
=TEX
\subsection{⇒\_match\_mp\_rule}
=SML
store_mt_results (mt_runf (op =#)) [
	("⇒_match_mp_rule",
	dest_thm o ⇒_match_mp_rule
		(asm_rule ⌜∀ (x,y,z:'a) ⦁ (x ∧ f y) ⇒ (x ∧ f z)⌝),
	(asm_rule ⌜p ∧ f T⌝),
	([⌜∀ (x,y,z:BOOL) ⦁ (x ∧ f y) ⇒ (x ∧ f z)⌝,
	  ⌜p ∧ f T⌝], ⌜p ∧ f (z:BOOL)⌝))
	];
store_mt_results mt_run_fail [
	("⇒_match_mp_rule 7044",
	⇒_match_mp_rule t_thm,
	f_thm,
	gen_fail_msg "⇒_match_mp_rule" 7044 ["⊢ T","⊢ ¬ F"])
	];
=TEX
\subsection{⇒\_match\_mp\_rule1}
=SML
store_mt_results (mt_runf (op =#)) [
	("⇒_match_mp_rule1",
	dest_thm o ⇒_match_mp_rule
		(asm_rule ⌜∀ (x,y,z:BOOL) ⦁ (x ∧ f y) ⇒ (x ∧ f z)⌝),
	(asm_rule ⌜p ∧ f T⌝),
	([⌜∀ (x,y,z:BOOL) ⦁ (x ∧ f y) ⇒ (x ∧ f z)⌝,
	  ⌜p ∧ f T⌝], ⌜p ∧ f (z:BOOL)⌝))
	];
store_mt_results mt_run_fail [
	("⇒_match_mp_rule1 7045",
	⇒_match_mp_rule1,
	t_thm,
	gen_fail_msg "⇒_match_mp_rule1" 7045 ["⊢ T"])];
store_mt_results mt_run_fail [
	("⇒_match_mp_rule1 7044 b",
	⇒_match_mp_rule1 (asm_rule ⌜∀ (x,y,z:'a) ⦁ (x ∧ f y) ⇒ (x ∧ f z)⌝),
	(asm_rule ⌜p ∧ f T⌝),
	gen_fail_msg "⇒_match_mp_rule1" 7044 ["⌜p ∧ f T⌝",
	  "⌜x ∧ f y⌝"
	   ])
	];
=TEX
\subsection{⇒\_match\_mp\_rule2}
=SML
store_mt_results (mt_runf (op =#)) [
	("⇒_match_mp_rule2",
	dest_thm o ⇒_match_mp_rule
		(asm_rule ⌜∀ (x,y,z:BOOL) ⦁ (x ∧ f y) ⇒ (x ∧ f z)⌝),
	(asm_rule ⌜p ∧ f T⌝),
	([⌜∀ (x,y,z:BOOL) ⦁ (x ∧ f y) ⇒ (x ∧ f z)⌝,
	  ⌜p ∧ f T⌝], ⌜p ∧ f (z:BOOL)⌝))
	];
store_mt_results mt_run_fail [
	("⇒_match_mp_rule2 7045",
	⇒_match_mp_rule2,
	t_thm,
	gen_fail_msg "⇒_match_mp_rule2" 7045 ["⊢ T"])];
store_mt_results mt_run_fail [
	("⇒_match_mp_rule2 7044 b",
	⇒_match_mp_rule2 (asm_rule ⌜∀ (x,y,z:'a) ⦁ (x ∧ f y) ⇒ (x ∧ f z)⌝),
	(asm_rule ⌜p ∧ f T⌝),
	gen_fail_msg "⇒_match_mp_rule2" 7044 ["⌜p ∧ f T⌝",
	  "⌜x ∧ f y⌝"
	   ])
	];
=TEX
\subsection{⇔\_match\_mp\_rule}
=SML
store_mt_results (mt_runf (op =#)) [
	("⇔_match_mp_rule",
	dest_thm o ⇔_match_mp_rule
		(asm_rule ⌜∀ (x,y,z:'a) ⦁ (x ∧ f y) ⇔ (x ∧ f z)⌝),
	(asm_rule ⌜p ∧ f T⌝),
	([⌜∀ (x,y,z:BOOL) ⦁ (x ∧ f y) ⇔ (x ∧ f z)⌝,
	  ⌜p ∧ f T⌝], ⌜p ∧ f (z:BOOL)⌝))
	];
store_mt_results mt_run_fail [
	("⇔_match_mp_rule 7044",
	⇔_match_mp_rule t_thm,
	f_thm,
	gen_fail_msg "⇔_match_mp_rule" 7044 ["⊢ T","⊢ ¬ F"])
	];
=TEX
\subsection{⇔\_match\_mp\_rule1}
=SML
store_mt_results (mt_runf (op =#)) [
	("⇔_match_mp_rule1",
	dest_thm o ⇔_match_mp_rule
		(asm_rule ⌜∀ (x,y,z:BOOL) ⦁ (x ∧ f y) ⇔ (x ∧ f z)⌝),
	(asm_rule ⌜p ∧ f T⌝),
	([⌜∀ (x,y,z:BOOL) ⦁ (x ∧ f y) ⇔ (x ∧ f z)⌝,
	  ⌜p ∧ f T⌝], ⌜p ∧ f (z:BOOL)⌝))
	];
store_mt_results mt_run_fail [
	("⇔_match_mp_rule1 7046",
	⇔_match_mp_rule1,
	t_thm,
	gen_fail_msg "⇔_match_mp_rule1" 7046 ["⊢ T"])];
store_mt_results mt_run_fail [
	("⇔_match_mp_rule1 7044 b",
	⇔_match_mp_rule1 (asm_rule ⌜∀ (x,y,z:'a) ⦁ (x ∧ f y) ⇔ (x ∧ f z)⌝),
	(asm_rule ⌜p ∧ f T⌝),
	gen_fail_msg "⇔_match_mp_rule1" 7044 ["⌜p ∧ f T⌝",
	  "⌜x ∧ f y⌝"
	   ])
	];
=TEX
\subsection{fc\_rule}
=SML
fun list_thm_eq (seqs1 : THM list, seqs2 : THM list) : bool = (
	all (combine (map dest_thm seqs1) (map dest_thm seqs2)) (op =#)
);
store_mt_results (mt_runf list_thm_eq) [
	("fc_rule a", uncurry fc_rule,
		([], []), []),
	("fc_rule b", uncurry fc_rule,
		([asm_rule⌜A ⇒ B⌝], [asm_rule⌜A:BOOL⌝]),
		[⇒_elim(asm_rule⌜A ⇒ B⌝)(asm_rule⌜A:BOOL⌝)]),
	("fc_rule c", uncurry fc_rule,
		([asm_rule⌜A ⇒ B⌝], [asm_rule⌜C:BOOL⌝]),
		[]),
	("fc_rule d", uncurry fc_rule,
		([asm_rule⌜∀A⦁A ⇒ B⌝], [asm_rule⌜C:BOOL⌝]),
		[⇒_match_mp_rule(asm_rule⌜∀A⦁A ⇒ B⌝)(asm_rule⌜C:BOOL⌝)]),
	("fc_rule e", uncurry fc_rule,
		([asm_rule⌜∀A⦁A ⇒ B⌝], [asm_rule⌜C:BOOL⌝, asm_rule⌜D:BOOL⌝]),
		[⇒_match_mp_rule(asm_rule⌜∀A⦁A ⇒ B⌝)(asm_rule⌜D:BOOL⌝),
		⇒_match_mp_rule(asm_rule⌜∀A⦁A ⇒ B⌝)(asm_rule⌜C:BOOL⌝)]),
	("fc_rule f", uncurry fc_rule,
		([asm_rule⌜∀A⦁A ⇒ B⌝, asm_rule⌜∀B⦁B ⇒ D⌝], [asm_rule⌜C:BOOL⌝]),
		[⇒_match_mp_rule(asm_rule⌜∀B⦁B ⇒ D⌝)(asm_rule⌜C:BOOL⌝),
		⇒_match_mp_rule(asm_rule⌜∀A⦁A ⇒ B⌝)(asm_rule⌜C:BOOL⌝)]),
	("forward_chain_rule", uncurry forward_chain_rule,
		([asm_rule⌜∀A⦁A ⇒ B⌝, asm_rule⌜∀B⦁B ⇒ D⌝], [asm_rule⌜C:BOOL⌝]),
		[⇒_match_mp_rule(asm_rule⌜∀B⦁B ⇒ D⌝)(asm_rule⌜C:BOOL⌝),
		⇒_match_mp_rule(asm_rule⌜∀A⦁A ⇒ B⌝)(asm_rule⌜C:BOOL⌝)]),
	("fc_rule g", uncurry fc_rule,
		([asm_rule⌜∀A⦁A ⇒ B⌝, asm_rule⌜∀B⦁B ⇒ D⌝],
			[asm_rule⌜C:BOOL⌝, asm_rule⌜E:BOOL⌝]),
		[⇒_match_mp_rule(asm_rule⌜∀B⦁B ⇒ D⌝)(asm_rule⌜E:BOOL⌝),
		 ⇒_match_mp_rule(asm_rule⌜∀A⦁A ⇒ B⌝)(asm_rule⌜E:BOOL⌝),
		 ⇒_match_mp_rule(asm_rule⌜∀B⦁B ⇒ D⌝)(asm_rule⌜C:BOOL⌝),
		 ⇒_match_mp_rule(asm_rule⌜∀A⦁A ⇒ B⌝)(asm_rule⌜C:BOOL⌝)]),
	("fc_rule h", uncurry fc_rule,
		([asm_rule⌜B ⇒ F⌝,asm_rule⌜B ⇒ C⌝],
		[asm_rule⌜B:BOOL⌝]),
		[⇒_match_mp_rule(asm_rule⌜B ⇒ F⌝) (asm_rule⌜B:BOOL⌝)])
];
=TEX
\subsection{fc\_canon}
=SML
val ⦏ut⦎ = undisch_rule o taut_rule;
new_pc "test_mdt027";
val pp'ts_def = get_defn "misc" "pp'ts_def";
add_sc_thms [pp'ts_def] "test_mdt027";
store_mt_results (mt_runf list_thm_eq) [
	("fc_canon a", fc_canon,
		t_thm, []),
	("fc_canon b", fc_canon,
		asm_rule⌜A ∧ B⌝,
			[ut⌜A ∧ B ⇒ ¬A ⇒ F⌝,
			 ut⌜A ∧ B ⇒ ¬B ⇒ F⌝]),
	("fc_canon c", fc_canon,
		asm_rule⌜∀x:'a⦁A x⌝,
			[undisch_rule(
			tac_proof(([], ⌜(∀x:'a⦁A x) ⇒ ∀x:'a⦁¬A x ⇒ F⌝),
				rewrite_tac[]))]),
	("fc_canon d", fc_canon,
		asm_rule⌜A ∧ B ⇒ C⌝,
		[ut⌜(A ∧ B ⇒ C) ⇒ A ⇒ B ⇒ ¬C ⇒ F⌝]),
	("fc_canon e", fc_canon,
		asm_rule⌜A ∨ B ⇒ C⌝,
		fc_canon(ut⌜(A ∨ B ⇒ C) ⇒ B ⇒ C⌝)
		@ fc_canon(ut⌜(A ∨ B ⇒ C) ⇒ A ⇒ C⌝)),
	("fc_canon f", fc_canon,
		asm_rule⌜(∃x:'a⦁A x) ⇒ C⌝,
			[undisch_rule(
			tac_proof(([], ⌜((∃x:'a⦁A x) ⇒ C) ⇒ ∀x:'a⦁A x ⇒ ¬C ⇒ F⌝),
		REPEAT strip_tac THEN spec_asm_tac⌜∀x:'a⦁ ¬ A x⌝⌜x:'a⌝))]),
	("fc_canon g", fc_canon,
		asm_rule⌜A ⇒ A ⇒ B⌝,
		fc_canon(ut⌜(A ⇒ A ⇒ B) ⇒ A ⇒ B⌝)),
	("fc_canon h", fc_canon,
		asm_rule⌜T ⇒ B⌝,
		fc_canon(ut⌜(T ⇒ B) ⇒ B⌝)),
	("fc_canon i", fc_canon,
		taut_rule⌜A ⇒ ¬A ⇒ B⌝,
		[]),
	("fc_canon j", fc_canon,
		asm_rule⌜A ⇒ B⌝,
		[ut⌜(A ⇒ B) ⇒ A ⇒ ¬B ⇒ F⌝]),
	("fc_canon k", fc_canon,
		asm_rule⌜A ⇔ B⌝,
		[ut⌜(A ⇔ B) ⇒ A ⇒ ¬B ⇒ F⌝]),
	("fc_canon l", fc_canon,
		t_thm,
		[]),
	("fc_canon m", (fn t => (let val tl = (push_pc"test_mdt027"; fc_canon t)
				in pop_pc(); tl end)),
		asm_rule⌜pp'TS A : BOOL⌝,
		[undisch_rule(
		tac_proof(([], ⌜pp'TS A ⇒ ¬A ⇒ F⌝),
		rewrite_tac[pp'ts_def]THEN taut_tac))])
];
delete_pc"test_mdt027";
=TEX
Note that the last transformation rule is tested by nearly all of the
above cases and so does not need its own test.
Now test the treatment of free variables.
=SML
store_mt_results (mt_runf list_thm_eq) [
	("fc_canon 1 a", fc_canon,
		asm_rule⌜∀A⦁A ⇒ B⌝,
			[undisch_rule(
			tac_proof(([], ⌜(∀A⦁A ⇒ B) ⇒ ∀ A⦁ A ⇒ ¬ B ⇒ F⌝),
				rewrite_tac[]))]),
	("fc_canon 1 b", fc_canon,
		asm_rule⌜A ⇒ B⌝,
			[undisch_rule(
			tac_proof(([], ⌜(A ⇒ B) ⇒  A ⇒ ¬ B ⇒ F⌝),
				rewrite_tac[]))])
];
=TEX
Now spot checks to see that the relatives of $fc\_canon$ are there
(because of the way they are coded in terms of $FC\_CAN$, there is not
much point in checking out the finer points of the functionality all over
again).
=SML
store_mt_results (mt_runf list_thm_eq) [
	("fc_canon1 a", fc_canon1,
		asm_rule⌜∀A⦁A ⇔ B⌝,
			[undisch_rule(
			tac_proof(([], ⌜(∀A⦁A ⇔ B) ⇒ ∀ A⦁ A ⇒ ¬ B ⇒ F⌝),
		REPEAT strip_tac THEN spec_asm_tac ⌜(∀A⦁A ⇔ B)⌝ ⌜A:BOOL⌝)),
			undisch_rule(
			tac_proof(([], ⌜(∀A⦁A ⇔ B) ⇒ ∀ A⦁ B ⇒ ¬ A ⇒ F⌝),
		REPEAT strip_tac THEN spec_asm_tac ⌜(∀A⦁A ⇔ B)⌝ ⌜A:BOOL⌝))]),
	("FC_CAN a", FC_CAN [],
		asm_rule⌜A ⇒ B⌝,
			[undisch_rule(
			tac_proof(([], ⌜(A ⇒ B) ⇒  A ⇒ ¬ B ⇒ F⌝),
				REPEAT strip_tac))])
];
=TEX
\subsection{eq\_match\_conv}
=SML
store_mt_results (mt_runf (op =#)) [
	("eq_match_conv 1",
	dest_thm o eq_match_conv (refl_conv ⌜x⌝),
	⌜T⌝,
	([],⌜T ⇔ T⌝)),
	("eq_match_conv 2",
	dest_thm o eq_match_conv
		(asm_rule ⌜∀ ((a,b),(c,d)) e ⦁ ((a,b) = e) = ((c,b) = e)⌝),
	⌜(T,x:'a) = (T,y)⌝,
	([⌜∀ ((a:BOOL,b:'a),(c,d:'a)) e ⦁ ((a,b) = e) = ((c,b) = e)⌝],
		⌜((T,x:'a) = (T,y)) ⇔ ((c,x) = (T,y))⌝))
	];
store_mt_results mt_run_fail [
	("eq_match_conv 7044 1",
	eq_match_conv t_thm,
	⌜F⌝,
	gen_fail_msg "eq_match_conv" 7044 ["⌜F⌝","⊢ T"])
	];
=TEX
\subsection{eq\_match\_conv1}
=SML
store_mt_results (mt_runf (op =#)) [
	("eq_match_conv1 1",
	dest_thm o eq_match_conv1 (∀_intro ⌜x⌝ (refl_conv ⌜x⌝)),
	⌜T⌝,
	([],⌜T ⇔ T⌝))
	];
store_mt_results mt_run_fail [
	("eq_match_conv1 27003",
	eq_match_conv1,
	t_thm,
	gen_fail_msg "eq_match_conv1" 27003 ["⊢ T"])
	];
store_mt_results mt_run_fail [
	("eq_match_conv1 7044",
	eq_match_conv1 (asm_rule ⌜∀ x ⦁ x = x⌝),
	⌜T⌝,
	gen_fail_msg "eq_match_conv1" 7044 ["⌜T⌝","∀ x⦁ x = x ⊢ ∀ x⦁ x = x"])
	];
=TEX
\subsection{β\_rule}
=SML
store_mt_results (mt_runf (op =#)) [
	("β_rule",
	dest_thm o β_rule,
	asm_rule ⌜(λ ((a,b),(c,d)) ⦁ a ∧ b ∨ c ∧ d) (x,y)⌝,
	([⌜(λ ((a,b),(c,d)) ⦁ a ∧ b ∨ c ∧ d) (x,y)⌝],
	 ⌜Fst x ∧ Snd x ∨ Fst y ∧ Snd y⌝))
	];
store_mt_results mt_run_fail [
	("β_rule 27007",
	β_rule,
	t_thm,
	gen_fail_msg "β_rule" 27007 ["⊢ T"])
	];
=TEX
\subsection{β\_conv}
=SML
store_mt_results (mt_runf (op =#)) [
	("β_conv 1",
	dest_thm o β_conv,
	⌜(λ x:'a ⦁ f x 1) y⌝,
	([],⌜(λ x:'a ⦁ f x 1) y = f y 1⌝)),
	("β_conv 2",
	dest_thm o β_conv,
	⌜(λ (x, y) ⦁ f x y) (1,2)⌝,
	([],⌜(λ (x, y) ⦁ f x y) (1,2) = f 1 2⌝)),
	("β_conv 3",
	dest_thm o β_conv,
	⌜(λ ((x,a), (y,b)) ⦁ f a b x y) ((1,2),(3,4))⌝,
	([],⌜(λ ((x,a), (y,b)) ⦁ f a b x y) ((1,2),(3,4)) = f 2 4 1 3⌝)),
	("β_conv 4",
	dest_thm o β_conv,
	⌜(λ (x, y) :'a × 'b ⦁ f x y) p⌝,
	([],⌜(λ (x, y):'a × 'b ⦁ f x y) p = f (Fst p) (Snd p)⌝)),
	("β_conv 5",
	dest_thm o β_conv,
	⌜(λ ((x,a), (y,b)) : (('a × 'b) × ('c × 'd)) ⦁
		 f a b x y) p⌝,
	([],⌜(λ ((x,a), (y,b)) : (('a × 'b) × ('c × 'd)) ⦁
		f a b x y) p =
		f (Snd(Fst p)) (Snd(Snd p)) (Fst(Fst p)) (Fst(Snd p))⌝)),
	("β_conv 6",
	dest_thm o β_conv,
	⌜(λ ((x,a), (y,b)) : (('a × 'b) × ('c × 'd)) ⦁
		f a b x y) (p, q)⌝,
	([],⌜(λ ((x,a), (y,b)) : (('a × 'b) × ('c × 'd))⦁
		f a b x y) (p, q) =
		f (Snd p) (Snd q) (Fst p) (Fst q)⌝)),
	("β_conv 7",
	dest_thm o β_conv,
	⌜(λ ((x,a), (y,b)) : (('a × 'b) × ('c × 'd)) ⦁
		f a b x y) ((y,b), q)⌝,
	([],⌜(λ ((x,a), (y,b)) : (('a × 'b) × ('c × 'd)) ⦁
		f a b x y) ((y,b), q) =
		f b (Snd q) y (Fst q)⌝))
	];
store_mt_results mt_run_fail [
	("β_conv",
	β_conv,
	⌜T⌝,
	gen_fail_msg "β_conv" 27008 ["⌜T⌝"])
	];
=TEX
\subsection{all\_β\_conv}
=SML
store_mt_results (mt_runf (op =#)) [
	("all_β_conv 1",
	dest_thm o all_β_conv,
	⌜∀ (x:'a,y) ⦁ (λ (f,g) ⦁ f (λ (a,b,c) ⦁ y a b) ∧ g y)
		((λ p ⦁p (T,z)),(λ r ⦁ h r))⌝,
	([],⌜(∀ (x:'a,y) ⦁ (λ (f,g) ⦁ f (λ (a,b,c) ⦁ y a b) ∧ g y)
		((λ p ⦁p (T,z)),(λ r ⦁ h r))) ⇔
	(∀ (x:'a, y)⦁ y T (Fst z) ∧ h y)⌝))
	];
store_mt_results mt_run_fail [
	("all_β_conv 27049",
	all_β_conv,
	⌜∀ (x,y,z) ⦁ x ∧ y ∧ ∃ p ⦁ f p z⌝,
	gen_fail_msg "all_β_conv" 27049 ["⌜∀ (x, y, z)⦁ x ∧ y ∧ (∃ p⦁ f p z)⌝"])
	];
=TEX
\subsection{all\_β\_rule}
=SML
store_mt_results (mt_runf (op =#)) [
	("all_β_rule 1",
	dest_thm o all_β_rule,
	asm_rule ⌜∀ (x:'a,y) ⦁ (λ (f,g) ⦁ f (λ (a,b,c) ⦁ y a b) ∧ g y)
		((λ p ⦁p (T,z)),(λ r ⦁ h r))⌝,
	([⌜∀ (x:'a,y) ⦁ (λ (f,g) ⦁ f (λ (a,b,c) ⦁ y a b) ∧ g y)
		((λ p ⦁p (T,z)),(λ r ⦁ h r))⌝],
	⌜(∀ (x:'a, y)⦁ y T (Fst z) ∧ h y)⌝))
	];
store_mt_results mt_run_fail [
	("all_β_rule 27049",
	all_β_rule,
	t_thm,
	gen_fail_msg "all_β_rule" 27049 ["⊢ T"])
	];
=TEX
\subsection{λ\_eq\_rule}
=SML
store_mt_results (mt_runf (op =#)) [
	("λ_eq_rule 1",
	dest_thm o λ_eq_rule ⌜x:'a⌝,
	eq_thm1,
	([],⌜(λ x⦁ x) = (λ x⦁ x)⌝)),
	("λ_eq_rule 2",
	dest_thm o λ_eq_rule ⌜(x,y):'a × 'a⌝,
	eq_thm1,
	([],⌜(λ (x, y):'a × 'a⦁ x) = (λ (x, y)⦁ x)⌝)),
	("λ_eq_rule 3",
	dest_thm o λ_eq_rule ⌜(x,y):'a × 'a⌝,
	eq_thm2,
	([eq_tm2],⌜(λ (x, y):'a × 'a⦁ f x y)
		= (λ (x, y)⦁ f y z)⌝)),
	("λ_eq_rule 4",
	dest_thm o λ_eq_rule ⌜((x,y),(z,b)): (('a × 'a) × ('a × 'a))⌝,
	eq_thm2,
	([eq_tm2],⌜(λ ((x, y), z, b): (('a × 'a) × ('a × 'a))⦁ f x y)
		= (λ ((x, y), z, b)⦁ f y z)⌝))
	];
store_mt_results mt_run_fail [
	("λ_eq_rule 4016 a",
	λ_eq_rule ⌜T⌝,
	eq_thm1,
	gen_fail_msg "λ_eq_rule" 4016 ["⌜T⌝"]),
	("λ_eq_rule 4016 b",
	λ_eq_rule ⌜(x,T)⌝,
	eq_thm1,
	gen_fail_msg "λ_eq_rule" 4016 ["⌜(x, T)⌝"]),
	("λ_eq_rule 6005 a",
	λ_eq_rule ⌜z⌝,
	eq_thm3,
	gen_fail_msg "λ_eq_rule" 6005 ["⌜z⌝"]),
	("λ_eq_rule 6005 b",
	λ_eq_rule ⌜(x,z):'a × 'a⌝,
	eq_thm3,
	gen_fail_msg "λ_eq_rule" 6005 ["⌜z⌝"]),
	("λ_eq_rule 6020",
	λ_eq_rule ⌜(x,z):'a × 'a⌝,
	t_thm,
	gen_fail_msg "λ_eq_rule" 6020 ["⊢ T"])
	];
=TEX
\subsection{η\_conv}
=SML
store_mt_results (mt_runf (op =#)) [
	("η_conv 1",
	dest_thm o η_conv,
	⌜λ x:'a ⦁ t x⌝,
	([],⌜(λ x :'a⦁ t x) = t⌝)),
	("η_conv 2",
	dest_thm o η_conv,
	⌜λ (x,y):'a × 'b ⦁ t (x,y)⌝,
	([],⌜(λ (x,y):'a × 'b  ⦁ t (x,y)) = t⌝)),
	("η_conv 3",
	dest_thm o η_conv,
	⌜λ ((a,b),y,z):('a × BOOL) × 'c × 'd ⦁ t ((a,b),y,z)⌝,
	([],⌜(λ ((a,b),y,z):('a × BOOL) × 'c × 'd ⦁ t ((a,b),y,z)) = t⌝))
	];
store_mt_results mt_run_fail [
	("η_conv 27018",
	η_conv,
	⌜λ x ⦁ x⌝,
	gen_fail_msg "η_conv" 27018 ["⌜λ x⦁ x⌝"]),
	("η_conv 27023 a",
	η_conv,
	⌜λ x ⦁ f y⌝,
	gen_fail_msg "η_conv" 27023 ["⌜λ x⦁ f y⌝"]),
	("η_conv 27023 b",
	η_conv,
	⌜λ (x,x) ⦁ f (x,x)⌝,
	gen_fail_msg "η_conv" 27023 ["⌜λ (x, x)⦁ f (x, x)⌝"])
	];
=TEX
\subsection{λ\_varstruct\_conv}
=SML
store_mt_results (mt_runf (op =#)) [
	("λ_varstruct_conv 1",
	dest_thm o λ_varstruct_conv ⌜λ x ⦁ x ∧ T⌝,
	⌜λ y ⦁ y ∧ T⌝,
	([],⌜(λ y ⦁ y ∧ T) = λ x ⦁ x ∧ T⌝)),
	("λ_varstruct_conv 2",
	dest_thm o λ_varstruct_conv ⌜λ ((a,b),x) ⦁ a ∧ b ∧ Fst x ∧ Snd x⌝,
	 ⌜λ (x,(a,b)) ⦁ Fst x ∧ Snd x ∧ a ∧ b⌝,
	([],⌜(λ (x,(a,b)) ⦁ Fst x ∧ Snd x ∧ a ∧ b) =
		λ ((a,b),x) ⦁ a ∧ b ∧ Fst x ∧ Snd x⌝))
	];
store_mt_results mt_run_fail [
	("λ_varstruct_conv 27050",
	λ_varstruct_conv ⌜λ x ⦁ x ∧ T⌝,
	⌜λ x ⦁ x ∧ F⌝,
	gen_fail_msg "λ_varstruct_conv" 27050 ["⌜λ x⦁ x ∧ T⌝",
		"⌜λ x⦁ x ∧ F⌝"])
	];
=TEX
\subsection{λ\_pair\_conv}
=SML
store_mt_results (mt_runf (op =#)) [
	("λ_pair_conv 1",
	dest_thm o λ_pair_conv,
	⌜λ x ⦁ Fst x ∧ T ∨ Snd x⌝,
	([],⌜(λ x⦁ Fst x ∧ T ∨ Snd x) = (λ (x1, x2)⦁ x1 ∧ T ∨ x2)⌝)),
	("λ_pair_conv 2",
	dest_thm o λ_pair_conv,
	 ⌜λ (x, y) ⦁ Fst x ∧ Snd x ∧ y⌝,
	([],⌜(λ (x, y)⦁ Fst x ∧ Snd x ∧ y) =
		(λ ((x1, x2), y1)⦁ x1 ∧ x2 ∧ y1)⌝))
	];
store_mt_results mt_run_fail [
	("λ_pair_conv 27055",
	λ_pair_conv,
	⌜λ x ⦁ x ∧ F⌝,
	gen_fail_msg "λ_pair_conv" 27055 ["⌜x⌝"]),
	("λ_pair_conv 27007",
	λ_pair_conv,
	⌜F⌝,
	gen_fail_msg "λ_pair_conv" 27007 ["⌜F⌝"])
	];
=TEX
\subsection{λ\_unpair\_conv}
=SML
store_mt_results (mt_runf (op =#)) [
	("λ_unpair_conv 1",
	dest_thm o λ_unpair_conv,
	⌜λ (x, y) ⦁ x = y⌝,
	([],⌜(λ (x, y) ⦁ x = y) = (λ xy⦁ Fst xy = Snd xy)⌝)),
	("λ_unpair_conv 2",
	dest_thm o λ_unpair_conv,
	 ⌜λ ((x, y), (v, w)) ⦁ x = a ∨ y = b ∨ v = c ∨ w = d⌝,
	([],⌜(λ ((x, y), (v, w)) ⦁ x = a ∨ y = b ∨ v = c ∨ w = d) =
		(λ xyvw⦁ Fst(Fst xyvw) = a ∨ Snd(Fst xyvw) = b
			∨ Fst(Snd xyvw) = c ∨ Snd(Snd xyvw) = d)⌝)),
	("λ_unpair_conv 3",
	dest_thm o λ_unpair_conv,
	⌜λ (x, y) ⦁ (x, y) = xy⌝,
	([],⌜(λ (x, y) ⦁ (x, y) = xy) = (λ xy'⦁ (Fst xy', Snd xy') = xy)⌝))
	];
store_mt_results mt_run_fail [
	("λ_unpair_conv 27056",
	λ_unpair_conv,
	⌜λ x ⦁ x⌝,
	gen_fail_msg "λ_unpair_conv" 27056 ["⌜λ x⦁ x⌝"]),
	("λ_pair_conv 4002",
	λ_unpair_conv,
	⌜F⌝,
	gen_fail_msg "λ_unpair_conv" 4002 ["⌜F⌝"])
	];
=TEX
\subsection{∀\_uncurry\_conv}
=SML
store_mt_results (mt_runf (op =#)) [
	("∀_uncurry_conv 1",
	dest_thm o ∀_uncurry_conv,
	⌜∀ (x,y) ⦁ x ⇔ y⌝,
	([],⌜(∀ (x,y) ⦁ x ⇔ y) ⇔ ∀ x y ⦁ x ⇔ y⌝)),
	("∀_uncurry_conv 2",
	dest_thm o ∀_uncurry_conv,
	⌜∀ (x,y) : 'b × 'a ⦁ f y x⌝,
	([],⌜(∀ (x,y) : 'b × 'a ⦁ f y x) ⇔
		(∀ (x:'b) (y: 'a) ⦁ f y x)⌝)),
	("∀_uncurry_conv 3",
	dest_thm o ∀_uncurry_conv,
	⌜∀ ((a,b),(c,d)) ⦁ a ∨ b ∨ c ∨ d⌝,
	([],⌜(∀ ((a,b),(c,d)) ⦁ a ∨ b ∨ c ∨ d) =
		∀ a b c d ⦁ a ∨ b ∨ c ∨ d⌝)),
	("∀_uncurry_conv 4",
	dest_thm o ∀_uncurry_conv,
	⌜∀ (x:'a,x:'a) ⦁ x = x⌝,
	([],⌜(∀ (x:'a,x:'a) ⦁ x = x) ⇔
		∀ x x:'a ⦁ x = x⌝)),
	("∀_uncurry_conv 5",
	dest_thm o ∀_uncurry_conv,
	⌜∀ (x:'a,y,x:'a) ⦁ x = x ∧ y⌝,
	([],⌜(∀ (x:'a,y,x:'a) ⦁ x = x ∧ y) ⇔
		∀ (x:'a) y (x :'a)⦁ x = x ∧ y⌝))
	];
store_mt_results mt_run_fail [
	("∀_uncurry_conv 27038 1",
	∀_uncurry_conv,
	⌜T⌝,
	gen_fail_msg "∀_uncurry_conv" 27038 ["⌜T⌝"]),
	("∀_uncurry_conv 27038 2",
	∀_uncurry_conv,
	⌜∀ x ⦁ x⌝,
	gen_fail_msg "∀_uncurry_conv" 27038 ["⌜∀ x⦁ x⌝"])
	];
=TEX
\subsection{all\_∀\_uncurry\_conv}
=SML
store_mt_results (mt_runf (op =#)) [
	("all_∀_uncurry_conv",
	dest_thm o all_∀_uncurry_conv,
	⌜∀ (a,b) c (d,e) ⦁ a ∧ b ∧ c ∧ d ∧ e⌝,
	([],⌜(∀ (a,b) c (d,e) ⦁ a ∧ b ∧ c ∧ d ∧ e) =
		∀ a b c d e ⦁ a ∧ b ∧ c ∧ d ∧ e⌝))
	];
store_mt_results mt_run_fail [
	("all_∀_uncurry_conv 27041 1",
	all_∀_uncurry_conv,
	⌜T⌝,
	gen_fail_msg "all_∀_uncurry_conv" 27041 ["⌜T⌝"]),
	("all_∀_uncurry_conv 27041 2",
	all_∀_uncurry_conv,
	⌜∀ x y ⦁ x ∧ y⌝,
	gen_fail_msg "all_∀_uncurry_conv" 27041 ["⌜∀ x y⦁ x ∧ y⌝"])
	];
=TEX
\subsection{∀\_intro}
=SML
store_mt_results (mt_runf (op =#)) [
	("∀_intro 1",
	dest_thm o ∀_intro ⌜a:'a⌝,
	uq_thm,
	([uq_tm],⌜∀ a ⦁ (a, b, c) = (a, d, e)⌝)),
	("∀_intro 2",
	dest_thm o ∀_intro ⌜(a:'a,b:'b)⌝,
	uq_thm,
	([uq_tm],⌜∀ (a:'a,b:'b) ⦁ (a, b, c) = (a, d, e)⌝)),
	("∀_intro 3",
	dest_thm o ∀_intro ⌜((c:'c,d:'b),(a:'a,b:'b))⌝,
	uq_thm,
	([uq_tm],⌜∀ ((c:'c,d:'b),(a:'a,b:'b)) ⦁ (a, b, c) = (a, d, e)⌝)),
	("∀_intro 4",
	dest_thm o ∀_intro ⌜((c:'c,f:'b),(g:'a,b:'b))⌝,
	uq_thm,
	([uq_tm],⌜∀ ((c:'c,f:'b),(g:'a,b:'b)) ⦁ (a:'a, b:'b, c) = (a, d, e)⌝)),
	("∀_intro 5",
	dest_thm o ∀_intro ⌜((b:'b,a:'a),(a,b))⌝,
	uq_thm,
	([uq_tm],⌜∀ (((b':'b,a':'a)),(a:'a,b:'b)) ⦁ (a:'a, b:'b, c) = (a, d, e)⌝)),
	("∀_intro 6",
	dest_thm o ∀_intro ⌜(x,x)⌝,
	all_simple_∀_elim (asm_rule ⌜∀ x ⦁ x = x'⌝),
	([⌜∀ x ⦁ x = x'⌝],⌜∀ (x'':'a, x:'a)⦁ x = x'⌝))
	];
store_mt_results mt_run_fail [
	("∀_intro 4016 1",
	∀_intro ⌜T⌝,
	uq_thm,
	gen_fail_msg "∀_intro" 4016 ["⌜T⌝"]),
	("∀_intro 4016 2",
	∀_intro ⌜(a,T,b)⌝,
	uq_thm,
	gen_fail_msg "∀_intro" 4016 ["⌜(a, T, b)⌝"]),
	("∀_intro 6028",
	∀_intro ⌜(x,y)⌝,
	asm_rule ⌜x = x⌝,
	gen_fail_msg "∀_intro" 6005 ["⌜x⌝"])
	];
=TEX
\subsection{∀\_elim}
=SML
store_mt_results (mt_runf (op =#)) [
	("∀_elim 1",
	dest_thm o ∀_elim ⌜p:'a × 'b⌝,
	asm_rule ⌜∀ (x,y):'a × 'b ⦁ f y x⌝,
	([⌜∀ (x,y):'a × 'b ⦁ f y x⌝],⌜f (Snd (p:'a × 'b)) (Fst p):BOOL⌝)),
	("∀_elim 2",
	dest_thm o ∀_elim ⌜(v,w):'a × 'b⌝,
	asm_rule ⌜∀ (x,y):'a × 'b ⦁ f y x⌝,
	([⌜∀ (x,y):'a × 'b ⦁ f y x⌝],⌜f (w:'b) (v:'a):BOOL⌝)),
	("∀_elim 3",
	dest_thm o ∀_elim ⌜x:(BOOL × BOOL) × 'a × 'b⌝,
	asm_rule ⌜∀ ((a,b),(x,y):'a × 'b) ⦁ a ∧ b ∧ f y x⌝,
	([⌜∀ ((a,b),(x,y):'a × 'b) ⦁ a ∧ b ∧ f y x⌝],
		⌜(Fst(Fst (x:(BOOL × BOOL) × 'a × 'b))) ∧ (Snd(Fst x)) ∧
		 f (Snd(Snd x)) (Fst(Snd x))⌝)),
	("∀_elim 4",
	dest_thm o ∀_elim ⌜(v,w):(BOOL × BOOL) × 'a × 'b⌝,
	asm_rule ⌜∀ ((a,b),(x,y):'a × 'b) ⦁ a ∧ b ∧ f y x⌝,
	([⌜∀ ((a,b),(x,y):'a × 'b) ⦁ a ∧ b ∧ f y x⌝],
		⌜(Fst(v:BOOL × BOOL)) ∧ (Snd v) ∧
		 f (Snd(w:'a × 'b)) (Fst w)⌝)),
	("∀_elim 5",
	dest_thm o ∀_elim ⌜((T,F),v,w):(BOOL × BOOL) × 'a × 'b⌝,
	asm_rule ⌜∀ ((a,b),(x,y):'a × 'b) ⦁ a ∧ b ∧ f y x⌝,
	([⌜∀ ((a,b),(x,y):'a × 'b) ⦁ a ∧ b ∧ f y x⌝],
		⌜T ∧ F ∧
		 f (w:'b) (v:'a)⌝)),
	("∀_elim 6",
	dest_thm o ∀_elim ⌜T⌝,
	(asm_rule ⌜∀ x ⦁ ¬ x⌝),
	([⌜∀ x ⦁ ¬ x⌝], ⌜¬ T⌝)),
	("∀_elim 7",
	dest_thm o ∀_elim ⌜x:((BOOL × BOOL)×(BOOL × BOOL))⌝,
	pa_thm1,
	([], ⌜((Fst (Fst (x:((BOOL × BOOL)×(BOOL × BOOL)))),
	Snd (Fst x)), Fst (Snd x), Snd (Snd x))
    = ((Fst (Fst x), Snd (Fst x)), Fst (Snd x), Snd (Snd x))⌝)),
	("∀_elim 8",
	dest_thm o ∀_elim ⌜(x,y):((BOOL × BOOL)×(BOOL × BOOL))⌝,
	pa_thm1,
	([], ⌜((Fst (x:BOOL × BOOL), Snd x), Fst (y:BOOL × BOOL), Snd y) =
		((Fst x, Snd x), Fst y, Snd y)⌝)),
	("∀_elim 9",
	dest_thm o ∀_elim ⌜((T,T),T,T)⌝,
	pa_thm1,
	([], ⌜((T, T), T, T) = ((T, T), T, T)⌝))
	];
store_mt_results mt_run_fail [
	("∀_elim 27011",
	∀_elim ⌜T⌝,
	t_thm,
	gen_fail_msg "∀_elim" 27011 ["⊢ T"]),
	("∀_elim 27012",
	∀_elim ⌜y:'a⌝,
	asm_rule(⌜∀ x:BOOL ⦁ T⌝),
	gen_fail_msg "∀_elim" 27012 ["∀ x⦁ T ⊢ ∀ x⦁ T","⌜y⌝"]),
	("∀_elim 27013",
	∀_elim ⌜y:'a⌝,
	asm_rule(⌜∀ x:'b ⦁ T⌝),
	gen_fail_msg "∀_elim" 27013 ["∀ x⦁ T ⊢ ∀ x⦁ T","⌜y⌝"])
	];
=TEX
=SML
store_mt_results (mt_runf (op =#)) [("list_∀_elim",
	dest_thm o list_∀_elim [⌜T⌝,⌜F⌝],
	asm_rule ⌜∀ x y ⦁ x ∧ y⌝,
	([⌜∀ x y ⦁ x ∧ y⌝],⌜T ∧ F⌝))];
store_mt_results (mt_runf (op =#)) [
	("list_∀_elim 1",
	dest_thm o list_∀_elim [⌜p:'a × 'b⌝],
	asm_rule ⌜∀ (x,y):'a × 'b ⦁ f y x⌝,
	([⌜∀ (x,y):'a × 'b ⦁ f y x⌝],⌜f (Snd (p:'a × 'b)) (Fst p):BOOL⌝)),
	("list_∀_elim 2",
	dest_thm o list_∀_elim [⌜(v,w):'a × 'b⌝],
	asm_rule ⌜∀ (x,y):'a × 'b ⦁ f y x⌝,
	([⌜∀ (x,y):'a × 'b ⦁ f y x⌝],⌜f (w:'b) (v:'a):BOOL⌝)),
	("list_∀_elim 3",
	dest_thm o list_∀_elim [⌜x:(BOOL × BOOL) × 'a × 'b⌝],
	asm_rule ⌜∀ ((a,b),(x,y):'a × 'b) ⦁ a ∧ b ∧ f y x⌝,
	([⌜∀ ((a,b),(x,y):'a × 'b) ⦁ a ∧ b ∧ f y x⌝],
		⌜(Fst(Fst (x:(BOOL × BOOL) × 'a × 'b))) ∧ (Snd(Fst x)) ∧
		 f (Snd(Snd x)) (Fst(Snd x))⌝)),
	("list_∀_elim 4",
	dest_thm o list_∀_elim [⌜(v,w):(BOOL × BOOL) × 'a × 'b⌝],
	asm_rule ⌜∀ ((a,b),(x,y):'a × 'b) ⦁ a ∧ b ∧ f y x⌝,
	([⌜∀ ((a,b),(x,y):'a × 'b) ⦁ a ∧ b ∧ f y x⌝],
		⌜(Fst(v:BOOL × BOOL)) ∧ (Snd v) ∧
		 f (Snd(w:'a × 'b)) (Fst w)⌝)),
	("list_∀_elim 5",
	dest_thm o list_∀_elim [⌜((T,F),v,w):(BOOL × BOOL) × 'a × 'b⌝],
	asm_rule ⌜∀ ((a,b),(x,y):'a × 'b) ⦁ a ∧ b ∧ f y x⌝,
	([⌜∀ ((a,b),(x,y):'a × 'b) ⦁ a ∧ b ∧ f y x⌝],
		⌜T ∧ F ∧
		 f (w:'b) (v:'a)⌝)),
	("list_∀_elim 6",
	dest_thm o list_∀_elim [⌜T⌝],
	(asm_rule ⌜∀ x ⦁ ¬ x⌝),
	([⌜∀ x ⦁ ¬ x⌝], ⌜¬ T⌝)),
	("list_∀_elim 7",
	dest_thm o list_∀_elim [⌜x:((BOOL × BOOL)×(BOOL × BOOL))⌝],
	pa_thm1,
	([], ⌜((Fst (Fst (x:((BOOL × BOOL)×(BOOL × BOOL)))),
	Snd (Fst x)), Fst (Snd x), Snd (Snd x))
    = ((Fst (Fst x), Snd (Fst x)), Fst (Snd x), Snd (Snd x))⌝)),
	("list_∀_elim 8",
	dest_thm o list_∀_elim [⌜(x,y):((BOOL × BOOL)×(BOOL × BOOL))⌝],
	pa_thm1,
	([], ⌜((Fst (x:BOOL × BOOL), Snd x), Fst (y:BOOL × BOOL), Snd y) =
		((Fst x, Snd x), Fst y, Snd y)⌝)),
	("list_∀_elim 9",
	dest_thm o list_∀_elim [⌜((T,T),T,T)⌝],
	pa_thm1,
	([], ⌜((T, T), T, T) = ((T, T), T, T)⌝)),
	("list_∀_elim 10",
	dest_thm o list_∀_elim [⌜((T,T),T,T)⌝,⌜((T,T),T,T)⌝],
	pa_thm2,
	([], ⌜(((T, T), T, T), (T, T), T, T) = (((T, T), T, T), (T, T), T, T)⌝)),
	("list_∀_elim 11",
	dest_thm o list_∀_elim [],
	t_thm,
	([], ⌜T⌝))
	];
store_mt_results mt_run_fail [
	("list_∀_elim 27014",
	list_∀_elim [⌜T⌝],
	t_thm,
	gen_fail_msg "list_∀_elim" 27014 ["⊢ T","1"]),
	("list_∀_elim 27015 a",
	list_∀_elim [⌜y:'a⌝],
	asm_rule(⌜∀ x:BOOL ⦁ T⌝),
	gen_fail_msg "list_∀_elim" 27015 ["∀ x⦁ T ⊢ ∀ x⦁ T","⌜y⌝"]),
	("list_∀_elim 27015 b",
	list_∀_elim [⌜y:'a⌝,⌜x:'b⌝],
	list_∀_intro [⌜x:'a⌝,⌜y:'a⌝] t_thm,
	gen_fail_msg "list_∀_elim" 27015 ["⊢ ∀ x y⦁ T","⌜y⌝,⌜x⌝"]),
	("list_∀_elim 27016",
	list_∀_elim [⌜y:'a⌝],
	asm_rule(⌜∀ x:'b ⦁ T⌝),
	gen_fail_msg "list_∀_elim" 27016 ["∀ x⦁ T ⊢ ∀ x⦁ T","⌜y⌝"])
	];

=TEX
\subsection{all\_∀\_elim}
=SML
store_mt_results (mt_runf (op =#)) [
	("all_∀_elim 1",
	dest_thm o all_∀_elim,
	asm_rule ⌜∀ (p,q) r ⦁ p ∧ q ∧ r⌝,
	([⌜∀ (p,q) r ⦁ p ∧ q ∧ r⌝],⌜p ∧ q ∧ r⌝)),
	("all_∀_elim 2",
	dest_thm o all_∀_elim,
	asm_rule ⌜∀ (p,q) r ((s,t),(u,v)) ⦁
		p ∧ q ∧ r ∧ s ∧ t ∧ u ∧ v⌝,
	([⌜∀ (p,q) r ((s,t),(u,v))⦁ p ∧ q ∧ r ∧ s ∧ t ∧ u ∧ v⌝],
		⌜p ∧ q ∧ r ∧ s ∧ t ∧ u ∧ v⌝)),
	("all_∀_elim 3",
	dest_thm o all_∀_elim,
	asm_intro ⌜q:BOOL⌝ (asm_rule ⌜∀ (p,q) r ⦁ p ∧ q ∧ r⌝),
	([⌜∀ (p,q) r ⦁ p ∧ q ∧ r⌝, ⌜q:BOOL⌝],⌜p ∧ q' ∧ r⌝)),
	("all_∀_elim 4",
	dest_thm o all_∀_elim,
	t_thm,
	([],⌜T⌝))
	];
=TEX
\subsection{¬\_∀\_conv}
=SML
store_mt_results (mt_runf (op =#)) [
	("¬_∀_conv 1",
	dest_thm o ¬_∀_conv,
	⌜¬(∀ x y ⦁ x ∨ y)⌝,
	([],⌜¬ (∀ x y⦁ x ∨ y) ⇔ (∃ x⦁ ¬ (∀ y⦁ x ∨ y))⌝)),
	("¬_∀_conv 2",
	dest_thm o ¬_∀_conv,
	⌜¬(∀ (x,y) z ⦁ x ∨ y ∨ z)⌝,
	([],⌜¬ (∀ (x, y) z⦁ x ∨ y ∨ z) ⇔ (∃ (x, y)⦁ ¬ (∀ z⦁ x ∨ y ∨ z))⌝)),
	("¬_∀_conv 3",
	dest_thm o ¬_∀_conv,
	⌜¬(∀ (x,y,z) w ⦁ x ∨ y ∨ z ∨ w)⌝,
	([],⌜¬ (∀ (x, y, z) w⦁ x ∨ y ∨ z ∨ w) ⇔
	 (∃ (x, y, z)⦁ ¬ (∀ w⦁ x ∨ y ∨ z ∨ w))⌝)),
	("¬_∀_conv 4",
	dest_thm o ¬_∀_conv,
	⌜¬(∀ (x,y) ⦁ x ∨ y)⌝,
	([],⌜¬ (∀ (x, y)⦁ x ∨ y) ⇔
	 (∃ (x, y)⦁ ¬ (x ∨ y))⌝))
	];
store_mt_results mt_run_fail [
	("¬_∀_conv 27019 a",
	¬_∀_conv,
	⌜T⌝,
	gen_fail_msg "¬_∀_conv" 27019 ["⌜T⌝"]),
	("¬_∀_conv 27019 b",
	¬_∀_conv,
	⌜¬ T⌝,
	gen_fail_msg "¬_∀_conv" 27019 ["⌜¬ T⌝"])
	];
=TEX
\subsection{∀\_⇔\_rule}
=SML
store_mt_results (mt_runf (op =#)) [
	("∀_⇔_rule 1",
	dest_thm o ∀_⇔_rule ⌜x:BOOL⌝,
	refl_conv ⌜x:BOOL⌝,
	([],⌜(∀ x⦁x) = (∀ x⦁x)⌝)),
	("∀_⇔_rule 2",
	dest_thm o ∀_⇔_rule ⌜(x:BOOL,y:BOOL)⌝,
	refl_conv ⌜(x ∧ y)⌝,
	([],⌜(∀ (x,y) ⦁ x ∧ y) = (∀ (x,y) ⦁ x ∧ y)⌝))
	];
store_mt_results mt_run_fail [
	("∀_⇔_rule 6005",
	∀_⇔_rule ⌜x:BOOL⌝,
	asm_rule ⌜x ⇔ x⌝,
	gen_fail_msg "∀_⇔_rule" 6005 ["⌜x⌝"]),
	("∀_⇔_rule 6020",
	∀_⇔_rule ⌜x:BOOL⌝,
	t_thm,
	gen_fail_msg "∀_⇔_rule" 6020 ["⊢ T"]),
	("∀_⇔_rule 7062",
	∀_⇔_rule ⌜x⌝,
	refl_conv ⌜x⌝,
	gen_fail_msg "∀_⇔_rule" 7062 ["⊢ x = x"]),
	("∀_⇔_rule 4016",
	∀_⇔_rule ⌜T⌝,
	asm_rule ⌜x ⇔ x⌝,
	gen_fail_msg "∀_⇔_rule" 4016 ["⌜T⌝"])
	];
=TEX
\subsection{∀\_arb\_elim}
=SML
store_mt_results (mt_runf (op =#)) [
	("∀_arb_elim 1",
	dest_thm o ∀_arb_elim,
	(asm_rule ⌜∀ x y ⦁ x ∧ y⌝),
	([⌜∀ x y ⦁ x ∧ y⌝],⌜∀ y ⦁ @_1 ∧ y⌝)),
	("∀_arb_elim 2",
	dest_thm o ∀_arb_elim,
	(asm_rule ⌜∀ (a,b,c) y ⦁ a ∧ b ∧ c ∧ y⌝),
	([⌜∀ (a,b,c) y ⦁ a ∧ b ∧ c ∧ y⌝],⌜∀ y ⦁ @_1 ∧ @_2 ∧ @_3 ∧ y⌝)),
	("∀_arb_elim 3",
	dest_thm o ∀_arb_elim,
	(asm_rule ⌜∀ (a,b,c) y ⦁ a ∧ b ∧ c ∧ y ∧ @_2⌝),
	([⌜∀ (a,b,c) y ⦁ a ∧ b ∧ c ∧ y ∧ @_2⌝],⌜∀ y ⦁ @_1 ∧ @_3 ∧ @_4 ∧ y ∧ @_2⌝))
	];
store_mt_results mt_run_fail [
	("∀_arb_elim 27011",
	∀_arb_elim,
	t_thm,
	gen_fail_msg "∀_arb_elim" 27011 ["⊢ T"])
	];
=TEX
\subsection{all\_∀\_arb\_elim}
=SML
store_mt_results (mt_runf (op =#)) [
	("all_∀_arb_elim 1",
	dest_thm o all_∀_arb_elim,
	(asm_rule ⌜∀ x y ⦁ x ∧ y⌝),
	([⌜∀ x y ⦁ x ∧ y⌝],⌜@_1 ∧ @_2⌝)),
	("all_∀_arb_elim 2",
	dest_thm o all_∀_arb_elim,
	(asm_rule ⌜∀ (a,b,c) y ⦁ a ∧ b ∧ c ∧ y⌝),
	([⌜∀ (a,b,c) y ⦁ a ∧ b ∧ c ∧ y⌝],⌜@_1 ∧ @_2 ∧ @_3 ∧ @_4⌝)),
	("all_∀_arb_elim 3",
	dest_thm o all_∀_arb_elim,
	(asm_rule ⌜∀ (a,b,c) y ⦁ a ∧ b ∧ c ∧ y ∧ @_2⌝),
	([⌜∀ (a,b,c) y ⦁ a ∧ b ∧ c ∧ y ∧ @_2⌝],⌜@_1 ∧ @_3 ∧ @_4 ∧ @_5 ∧ @_2⌝)),
	("all_∀_arb_elim 4",
	dest_thm o all_∀_arb_elim,
	t_thm,
	([],⌜T⌝))
	];
=TEX
\subsection{∀\_asm\_rule}
=SML
store_mt_results (mt_runf (op =#)) [
	("∀_asm_rule 1",
	dest_thm o ∀_asm_rule ⌜x⌝ ⌜p x : BOOL⌝,
	asm_intro ⌜p x : BOOL⌝ t_thm,
	([⌜∀ x⦁ p x⌝],⌜T⌝)),
	("∀_asm_rule 2",
	dest_thm o ∀_asm_rule ⌜x⌝ ⌜p x : BOOL⌝,
	t_thm,
	([⌜∀ x⦁ p x⌝],⌜T⌝)),
	("∀_asm_rule 3",
	dest_thm o ∀_asm_rule ⌜(x,y)⌝ ⌜p x y: BOOL⌝,
	t_thm,
	([⌜∀ (x,y)⦁ p x y⌝],⌜T⌝))
	];
store_mt_results mt_run_fail [
	("∀_asm_rule 4016",
	∀_asm_rule ⌜T⌝ ⌜p x y: BOOL⌝,
	t_thm,
	gen_fail_msg "∀_asm_rule" 4016 ["⌜T⌝"])
	];
=TEX
\subsection{∀\_reorder\_conv}
=SML
let
	fun test (tm1,tm2) = (dest_thm(∀_reorder_conv tm1 tm2) =#
		([],mk_eq(tm2,tm1)));
in
store_mt_results mt_run [
	("∀_reorder_conv 1",
	test,
	(⌜T⌝, ⌜T⌝),
	true),
	("∀_reorder_conv 2",
	test,
	(⌜∀ x ⦁ y⌝, ⌜y : BOOL⌝),
	true),
	("∀_reorder_conv 3",
	test,
	(⌜∀(x,y) p ⦁x ∧ y ∧ p⌝, ⌜∀ q (y,x)⦁ x ∧ y ∧ q⌝),
	true),
	("∀_reorder_conv 4",
	test,
	(⌜∀ (x,y,x) ⦁ x ∧ y⌝, ⌜∀ (a,x,a) ⦁ x ∧ a⌝),
	true),
	("∀_reorder_conv 5",
	test,
	(⌜∀ (@_1,@_2) ⦁ @_1 ∧ @_2⌝, ⌜∀ @_3 @_4 ⦁ @_3 ∧ @_4⌝),
	true)
	]
end;
store_mt_results mt_run_fail [
	("∀_reorder_conv 27050 a",
	∀_reorder_conv ⌜T⌝,
	⌜F⌝,
	gen_fail_msg "∀_reorder_conv" 27050 ["⌜T⌝", "⌜F⌝"]),
	("∀_reorder_conv 27050 b",
	∀_reorder_conv ⌜∀ x ⦁ y⌝,
	⌜∀ x ⦁ x⌝,
	gen_fail_msg "∀_reorder_conv" 27050 ["⌜∀ x⦁ y⌝", "⌜∀ x⦁ x⌝"]),
	("∀_reorder_conv 27050 c",
	∀_reorder_conv ⌜2⌝,
	⌜T⌝,
	gen_fail_msg "∀_reorder_conv" 27050 ["⌜2⌝", "⌜T⌝"])
	];
=TEX
\subsection{ALL$\_$SIMPLE$\_$∀$\_$C}
=SML
store_mt_results (mt_runf (op =#)) [
	("ALL_SIMPLE_∀_C 1",
	dest_thm o ALL_SIMPLE_∀_C eq_sym_conv,
	⌜∀ a b c:'a ⦁ a = b⌝,
	([],⌜(∀ a b c:'a ⦁ a = b) = (∀ a b c:'a ⦁ b = a)⌝)),
	("ALL_SIMPLE_∀_C 2",
	dest_thm o ALL_SIMPLE_∀_C eq_sym_conv,
	⌜∀ a⦁ a = b⌝,
	([],⌜(∀ a⦁ a = b) = (∀ a⦁ b = a)⌝)),
	("ALL_SIMPLE_∀_C 3",
	dest_thm o ALL_SIMPLE_∀_C eq_sym_conv,
	⌜a = b⌝,
	([],⌜(a = b) = (b = a)⌝))
	];
store_mt_results mt_run_fail [
	("ALL_SIMPLE_∀_C 3014",
	ALL_SIMPLE_∀_C eq_sym_conv,
	mk_t,
	gen_fail_msg "eq_sym_conv" 3014 ["⌜T⌝"])
	];
=TEX
\subsection{simple$\_$∀$\_$∃$\_$conv}
=SML
store_mt_results (mt_runf (op =#)) [
	("simple_∀_∃_conv 1",
	dest_thm o simple_∀_∃_conv,
	⌜∀ x :'a⦁ ∃ y:'b ⦁ f x ∧ g y⌝,
	([],⌜(∀ x :'a⦁ ∃ y :'b⦁ f x ∧ g y) ⇔ (∃ y' ⦁ ∀ x:'a ⦁ f x ∧ g (y' x))⌝))
	];
store_mt_results mt_run_fail [
	("simple_∀_∃_conv",
	simple_∀_∃_conv,
	mk_t,
	gen_fail_msg "simple_∀_∃_conv" 27031 ["⌜T⌝"])
	];
=TEX
\subsection{simple$\_$∃$\_$∀$\_$conv}
=SML
store_mt_results (mt_runf (op =#)) [
	("simple_∃_∀_conv 1",
	dest_thm o simple_∃_∀_conv,
	⌜∃ x :'b⦁ ∀ y:'a ⦁ f x ∧ g y⌝,
	([],⌜(∃ x:'b ⦁ ∀ y:'a ⦁ f x ∧ g y) ⇔ (∀ y' ⦁ ∃ x:'b ⦁ f x ∧ g (y' x))⌝))
	];
store_mt_results mt_run_fail [
	("simple_∃_∀_conv 27032",
	simple_∃_∀_conv,
	mk_t,
	gen_fail_msg "simple_∃_∀_conv" 27032 ["⌜T⌝"])
	];
=TEX
\subsection{simple$\_$∃$\_$∀$\_$conv1}
=SML
store_mt_results (mt_runf (op =#)) [
	("simple_∃_∀_conv1 1",
	dest_thm o simple_∃_∀_conv1,
	⌜∃ y :'c → 'b ⦁ ∀ x :'c⦁ f x ∧ g (y x)⌝,
	([],⌜(∃ y :'c → 'b ⦁ ∀ x :'c⦁ f x ∧ g (y x)) ⇔ (∀ x ⦁ ∃ y'⦁ f x ∧ g y')⌝))
	];
store_mt_results mt_run_fail [
	("simple_∃_∀_conv1 27033",
	simple_∃_∀_conv1,
	mk_t,
	gen_fail_msg "simple_∃_∀_conv1" 27033 ["⌜T⌝"])
	];
=TEX
\subsection{v\_∃\_intro}
=SML
store_mt_results (mt_runf (op =#)) [
	("v_∃_intro 1",
	dest_thm o v_∃_intro ⌜x⌝,
	(refl_conv ⌜x⌝),
	([],⌜∃ x⦁ x = x⌝)),
	("v_∃_intro 2",
	dest_thm o v_∃_intro ⌜(x,y)⌝,
	(refl_conv ⌜(x,y)⌝),
	([],⌜∃ (x, y)⦁ (x, y) = (x, y)⌝)),
	("v_∃_intro 3",
	dest_thm o v_∃_intro ⌜(x,x)⌝,
	(refl_conv ⌜(x,x)⌝),
	([],⌜∃ (x, x)⦁ (x, x) = (x, x)⌝)),
	("v_∃_intro 4",
	dest_thm o v_∃_intro ⌜(x:'a,y:'a)⌝,
	(asm_rule ⌜x = y⌝),
	([⌜x = y⌝],⌜∃ (x, y)⦁ x = y⌝))
	];
store_mt_results mt_run_fail [
	("v_∃_intro 4016",
	v_∃_intro ⌜T⌝,
	t_thm,
	gen_fail_msg "v_∃_intro" 4016 ["⌜T⌝"])
	];
=TEX
\subsection{∃\_intro}
=SML
store_mt_results (mt_runf (op =#)) [
	("∃_intro 1",
	dest_thm o ∃_intro ⌜∃ x ⦁ x ∧ (T ∨ F) ∧ (F ∨ T) ∧ T⌝,
	Eq_thm,
	([],⌜∃ x ⦁ x ∧ (T ∨ F) ∧ (F ∨ T) ∧ T⌝)),
	("∃_intro 2",
	dest_thm o ∃_intro ⌜∃ (x,y) ⦁ x ∧ y ∧ (F ∨ T) ∧ T⌝,
	Eq_thm,
	([],⌜∃ (x,y) ⦁ x ∧ y ∧ (F ∨ T) ∧ T⌝)),
	("∃_intro 3",
	dest_thm o ∃_intro ⌜∃ ((x,y),(p,q)) ⦁ x ∧ y ∧ p ∧ q⌝,
	Eq_thm,
	([],⌜∃ ((x,y),(p,q)) ⦁ x ∧ y ∧ p ∧ q⌝)),
	("∃_intro 4",
	dest_thm o ∃_intro ⌜∃ ((x,p),(p,q)) ⦁ x ∧ (T ∨ F) ∧ p ∧ q⌝,
	Eq_thm,
	([],⌜∃ ((x,p':BOOL),(p,q)) ⦁ x ∧ (T ∨ F) ∧ p ∧ q⌝)),
	("∃_intro 5",
	dest_thm o ∃_intro ⌜∃ ((p',p),(p,q)) ⦁ p' ∧ (T ∨ F) ∧ p ∧ q⌝,
	Eq_thm,
	([],⌜∃ ((p',p'':BOOL),(p,q)) ⦁ p' ∧ (T ∨ F) ∧ p ∧ q⌝))
	];
store_mt_results mt_run_fail [
	("∃_intro 4020",
	∃_intro ⌜T⌝,
	Eq_thm,
	gen_fail_msg "∃_intro" 4020 ["⌜T⌝"]),
	("∃_intro 7047",
	∃_intro ⌜∃ x ⦁ x ∨ y⌝,
	Eq_thm,
	gen_fail_msg "∃_intro" 7047 ["⌜∃ x⦁ x ∨ y⌝",
		"⊢ T ∧ (T ∨ F) ∧ (F ∨ T) ∧ T"])
	];
=TEX
\subsection{list\_simple\_∃\_intro}
=SML
val ∃_thm = ∃_intro ⌜∃ x ⦁ T ∧ (T ∨ F) ∧ (F ∨ T) ∧ x⌝ Eq_thm;
store_mt_results (mt_runf (op =#)) [
	("list_simple_∃_intro 1",
	dest_thm o list_simple_∃_intro [⌜T⌝] ⌜∃ x ⦁ x ∧ (T ∨ F) ∧ (F ∨ T) ∧ T⌝,


	Eq_thm,
	([],⌜∃ x ⦁ x ∧ (T ∨ F) ∧ (F ∨ T) ∧ T⌝)),
	("list_simple_∃_intro 2",
	dest_thm o list_simple_∃_intro [⌜T⌝, ⌜F⌝] ⌜∃ x z ⦁ x ∧ (T ∨ z) ∧ (z ∨ T) ∧ T⌝,


	Eq_thm,
	([],⌜∃ x z ⦁ x ∧ (T ∨ z) ∧ (z ∨ T) ∧ T⌝)),
	("list_simple_∃_intro 3",
	dest_thm o list_simple_∃_intro [⌜T⌝, ⌜F⌝] ⌜∃ y z x⦁ y ∧ (T ∨ z) ∧ (z ∨ T) ∧ x⌝,


	∃_thm,
	([],⌜∃ y z x⦁ y ∧ (T ∨ z) ∧ (z ∨ T) ∧ x⌝))
];
store_mt_results mt_run_fail [
	("list_simple_∃_intro 3034",
	list_simple_∃_intro [⌜x⌝] ⌜T⌝,
	Eq_thm,
	gen_fail_msg "list_simple_∃_intro" 3034 ["⌜T⌝"]),
	("list_simple_∃_intro 7047",
	list_simple_∃_intro [⌜T⌝] ⌜∃ x ⦁ x ∨ y⌝,
	Eq_thm,
	gen_fail_msg "list_simple_∃_intro" 7047 ["⌜∃ x⦁ x ∨ y⌝",
		"⊢ T ∧ (T ∨ F) ∧ (F ∨ T) ∧ T"])
	];
=TEX
\subsection{∃\_elim}
=SML
store_mt_results (mt_runf (op =#)) [
	("∃_elim 1",
	dest_thm o ∃_elim ⌜(x:BOOL, y:BOOL)⌝
		(asm_rule ⌜∃ (p,q) ⦁ p ∧ q⌝),
	(undisch_rule(all_simple_∀_elim (asm_rule
		⌜∀ x y ⦁ x ∧ y ⇒ rubbish⌝))),
	([⌜∀ x y ⦁ x ∧ y ⇒ rubbish⌝, ⌜∃ (p,q) ⦁ p ∧ q⌝],⌜rubbish:BOOL⌝)),
	("∃_elim 2",
	dest_thm o ∃_elim ⌜(x:BOOL, y:BOOL)⌝
		(asm_rule ⌜∃ (p,q) ⦁ p ∧ q⌝),
	t_thm,
	([⌜∃ (p,q) ⦁ p ∧ q⌝],⌜T⌝)),
	("∃_elim 3",
	dest_thm o ∃_elim ⌜x : BOOL⌝
		(asm_rule ⌜∃ x ⦁ x ∧ q⌝),
	t_thm,
	([⌜∃ x ⦁ x ∧ q⌝],⌜T⌝)),
	("∃_elim 4",
	dest_thm o ∃_elim ⌜(x:BOOL, x:BOOL)⌝
		(asm_rule ⌜∃ (p,p) ⦁ p ∧ p⌝),
	(undisch_rule(all_simple_∀_elim (asm_rule
		⌜∀ x ⦁ x ∧ x ⇒ rubbish⌝))),
	([⌜∀ x ⦁ x ∧ x⇒ rubbish⌝,
		⌜∃ (p,p) ⦁ p ∧ p⌝],⌜rubbish:BOOL⌝)),
	("∃_elim 5",
	dest_thm o ∃_elim ⌜(x:BOOL, (y,y),x:BOOL)⌝
		(asm_rule ⌜∃ (p,(r,r),p) ⦁ p ∧ p ∧ (r=r)⌝),
	(undisch_rule(all_simple_∀_elim (asm_rule
		⌜∀ x y ⦁ x ∧ x ∧ (y = y) ⇒ rubbish⌝))),
	([⌜∀ x y ⦁ x ∧ x ∧ (y = y)⇒ rubbish⌝,
		⌜∃ (p,(r,r),p) ⦁ p ∧ p ∧ (r=r)⌝],⌜rubbish:BOOL⌝)),
	("∃_elim 6",
	dest_thm o ∃_elim ⌜x:BOOL × BOOL⌝
		(asm_rule ⌜∃ (p,q) ⦁ p ∧ q⌝),
	(undisch_rule(all_simple_∀_elim (asm_rule
		⌜∀ x ⦁ Fst x ∧ Snd x ⇒ rubbish⌝))),
	([⌜∀ x ⦁ Fst x ∧ Snd x ⇒ rubbish⌝, ⌜∃ (p,q) ⦁ p ∧ q⌝],⌜rubbish:BOOL⌝))
	];
store_mt_results mt_run_fail [
	("∃_elim 27046 a",
	∃_elim ⌜(x:BOOL, y:BOOL)⌝ t_thm,
	t_thm,
	gen_fail_msg "∃_elim" 27046 ["⊢ T"]),
	("∃_elim 27042 a",
	∃_elim ⌜T⌝ (asm_rule⌜∃ x⦁ x⌝),
	t_thm,
	gen_fail_msg "∃_elim" 27042 ["⌜T⌝","∃ x⦁ x ⊢ ∃ x⦁ x"]),
	("∃_elim 27042 b",
	∃_elim ⌜(x,y)⌝ (asm_rule⌜∃ x⦁ x⌝),
	t_thm,
	gen_fail_msg "∃_elim" 27042 ["⌜(x, y)⌝","∃ x⦁ x ⊢ ∃ x⦁ x"]),
	("∃_elim 27042 c",
	∃_elim ⌜(x:BOOL, x:BOOL)⌝
		(asm_rule ⌜∃ (p,q) ⦁ p ∧ q⌝),
	(undisch_rule(all_simple_∀_elim (asm_rule
		⌜∀ x ⦁ x ∧ x ⇒ rubbish⌝))),
	gen_fail_msg "∃_elim" 27042 ["⌜(x, x)⌝","∃ (p, q)⦁ p ∧ q ⊢ ∃ (p, q)⦁ p ∧ q"]),
	("∃_elim 27042 d",
	∃_elim ⌜T⌝ (asm_rule⌜∃ x⦁ x⌝),
	t_thm,
	gen_fail_msg "∃_elim" 27042 ["⌜T⌝","∃ x⦁ x ⊢ ∃ x⦁ x"]),
	("∃_elim 27046 b",
	∃_elim ⌜(x:BOOL, y:BOOL)⌝ t_thm,
	t_thm,
	gen_fail_msg "∃_elim" 27046 ["⊢ T"]),
	("∃_elim 27051",
	∃_elim ⌜(x:BOOL, y:BOOL)⌝
		(asm_rule ⌜∃ (p,q) ⦁ p ∧ q ∧ x⌝),
	(undisch_rule(all_simple_∀_elim (asm_rule
		⌜∀ x y ⦁ x ∧ y ⇒ rubbish⌝))),
	gen_fail_msg "∃_elim" 27051 ["⌜(x, y)⌝",
		"∃ (p, q)⦁ p ∧ q ∧ x ⊢ ∃ (p, q)⦁ p ∧ q ∧ x"]),
	("∃_elim 27052",
	∃_elim ⌜(x:BOOL, y:BOOL)⌝
		(asm_rule ⌜∃ (p,q) ⦁ p ∧ q⌝),
	(asm_intro ⌜x:BOOL⌝(undisch_rule(all_simple_∀_elim (asm_rule
		⌜∀ x y ⦁ x ∧ y ⇒ rubbish⌝)))),
	gen_fail_msg "∃_elim" 27052 ["⌜(x, y)⌝",
		"∀ x y⦁ x ∧ y ⇒ rubbish, x ∧ y, x ⊢ rubbish",
		"⌜x ∧ y⌝"])
	];
=TEX
\subsection{∃\_uncurry\_conv}
=SML
store_mt_results (mt_runf (op =#)) [
	("∃_uncurry_conv 1",
	dest_thm o ∃_uncurry_conv,
	⌜∃ (x,y) ⦁ x ⇔ y⌝,
	([],⌜(∃ (x,y) ⦁ x ⇔ y) ⇔ ∃ x y ⦁ x ⇔ y⌝)),
	("∃_uncurry_conv 2",
	dest_thm o ∃_uncurry_conv,
	⌜∃ (x,y) : 'b × 'a ⦁ f y x⌝,
	([],⌜(∃ (x,y) : 'b × 'a ⦁ f y x) ⇔
		(∃ (x:'b) (y: 'a) ⦁ f y x)⌝)),
	("∃_uncurry_conv 3",
	dest_thm o ∃_uncurry_conv,
	⌜∃ ((a,b),(c,d)) ⦁ a ∨ b ∨ c ∨ d⌝,
	([],⌜(∃ ((a,b),(c,d)) ⦁ a ∨ b ∨ c ∨ d) =
		∃ a b c d ⦁ a ∨ b ∨ c ∨ d⌝)),
	("∃_uncurry_conv 4",
	dest_thm o ∃_uncurry_conv,
	⌜∃ (x:'a,x:'a) ⦁ x = x⌝,
	([],⌜(∃ (x:'a,x:'a) ⦁ x = x) ⇔
		∃ x x:'a ⦁ x = x⌝)),
	("∃_uncurry_conv 5",
	dest_thm o ∃_uncurry_conv,
	⌜∃ (x:'a,y,x:'a) ⦁ x = x ∧ y⌝,
	([],⌜(∃ (x:'a,y,x:'a) ⦁ x = x ∧ y) ⇔
		∃ (x:'a) y (x :'a)⦁ x = x ∧ y⌝))
	];
store_mt_results mt_run_fail [
	("∃_uncurry_conv 27047 1",
	∃_uncurry_conv,
	⌜T⌝,
	gen_fail_msg "∃_uncurry_conv" 27047 ["⌜T⌝"]),
	("∃_uncurry_conv 27047 2",
	∃_uncurry_conv,
	⌜∃ x ⦁ x⌝,
	gen_fail_msg "∃_uncurry_conv" 27047 ["⌜∃ x⦁ x⌝"])
	];
=TEX
\subsection{all\_∃\_uncurry\_conv}
=SML
store_mt_results (mt_runf (op =#)) [
	("all_∃_uncurry_conv",
	dest_thm o all_∃_uncurry_conv,
	⌜∃ (a,b) c (d,e) ⦁ a ∧ b ∧ c ∧ d ∧ e⌝,
	([],⌜(∃ (a,b) c (d,e) ⦁ a ∧ b ∧ c ∧ d ∧ e) =
		∃ a b c d e ⦁ a ∧ b ∧ c ∧ d ∧ e⌝))
	];
store_mt_results mt_run_fail [
	("all_∃_uncurry_conv 27048 1",
	all_∃_uncurry_conv,
	⌜T⌝,
	gen_fail_msg "all_∃_uncurry_conv" 27048 ["⌜T⌝"]),
	("all_∃_uncurry_conv 27048 2",
	all_∃_uncurry_conv,
	⌜∃ x y ⦁ x ∧ y⌝,
	gen_fail_msg "all_∃_uncurry_conv" 27048 ["⌜∃ x y⦁ x ∧ y⌝"])
	];
=TEX
\subsection{¬\_∃\_conv}
=SML
store_mt_results (mt_runf (op =#)) [
	("¬_∃_conv 1",
	dest_thm o ¬_∃_conv,
	⌜¬(∃ x y ⦁ x ∨ y)⌝,
	([],⌜¬ (∃ x y⦁ x ∨ y) ⇔ (∀ x⦁ ¬ (∃ y⦁ x ∨ y))⌝)),
	("¬_∃_conv 2",
	dest_thm o ¬_∃_conv,
	⌜¬(∃ (x,y) z ⦁ x ∨ y ∨ z)⌝,
	([],⌜¬ (∃ (x, y) z⦁ x ∨ y ∨ z) ⇔ (∀ (x, y)⦁ ¬ (∃ z⦁ x ∨ y ∨ z))⌝)),
	("¬_∃_conv 3",
	dest_thm o ¬_∃_conv,
	⌜¬(∃ (x,y,z) w ⦁ x ∨ y ∨ z ∨ w)⌝,
	([],⌜¬ (∃ (x, y, z) w⦁ x ∨ y ∨ z ∨ w) ⇔
	 (∀ (x, y, z)⦁ ¬ (∃ w⦁ x ∨ y ∨ z ∨ w))⌝)),
	("¬_∃_conv 4",
	dest_thm o ¬_∃_conv,
	⌜¬(∃ (x,y) ⦁ x ∨ y)⌝,
	([],⌜¬ (∃ (x, y)⦁ x ∨ y) ⇔
	 (∀ (x, y)⦁ ¬ (x ∨ y))⌝))
	];
store_mt_results mt_run_fail [
	("¬_∃_conv 27020 a",
	¬_∃_conv,
	⌜T⌝,
	gen_fail_msg "¬_∃_conv" 27020 ["⌜T⌝"]),
	("¬_∃_conv 27020 b",
	¬_∃_conv,
	⌜¬ T⌝,
	gen_fail_msg "¬_∃_conv" 27020 ["⌜¬ T⌝"])
	];
=TEX
\subsection{∃\_asm\_rule}
=SML
store_mt_results (mt_runf (op =#)) [
	("∃_asm_rule 1",
	dest_thm o ∃_asm_rule ⌜x:BOOL⌝ ⌜(λ y ⦁ y) x : BOOL⌝,
	asm_intro ⌜(λ z ⦁ z) x : BOOL⌝ t_thm,
	([⌜∃ x ⦁ (λ y ⦁ y) x⌝],⌜T⌝)),
	("∃_asm_rule 2",
	dest_thm o ∃_asm_rule ⌜x:BOOL⌝ ⌜(λ y ⦁ y) x : BOOL⌝,
	t_thm,
	([⌜∃ x⦁ (λ y ⦁ y) x⌝],⌜T⌝)),
	("∃_asm_rule 3",
	dest_thm o ∃_asm_rule ⌜(x,y,z)⌝ ⌜(λ y ⦁ T) (x,y,z) : BOOL⌝,
	t_thm,
	([⌜∃ (x,y,z)⦁ (λ y ⦁ T) (x,y,z)⌝],⌜T⌝))
	];
store_mt_results mt_run_fail [
	("∃_asm_rule 3015",
	∃_asm_rule ⌜x⌝ ⌜2⌝,
	t_thm,
	gen_fail_msg "∃_asm_rule" 3015 ["","⌜2⌝"]),
	("∃_asm_rule 4016",
	∃_asm_rule ⌜2⌝ ⌜T⌝,
	t_thm,
	gen_fail_msg "∃_asm_rule" 4016 ["⌜2⌝"]),
	("∃_asm_rule 27052 a",
	∃_asm_rule ⌜x⌝ ⌜p x : BOOL⌝,
	asm_rule ⌜q x : BOOL⌝,
	gen_fail_msg "∃_asm_rule" 27052
		["⌜x⌝","q x ⊢ q x","⌜p x⌝"]),
	("∃_asm_rule 27052 b",
	∃_asm_rule ⌜x⌝ ⌜p x : BOOL⌝,
	all_∀_elim(asm_rule ⌜∀ x ⦁ q x⌝),
	gen_fail_msg "∃_asm_rule" 27052 ["⌜x⌝",
		"∀ x⦁ q x ⊢ q x",
		"⌜p x⌝"])
	];
=TEX
\subsection{∃\_reorder\_conv}
=SML
let
	fun test (tm1,tm2) = (dest_thm(∃_reorder_conv tm1 tm2) =#
		([],mk_eq(tm2,tm1)));
in
store_mt_results mt_run [
	("∃_reorder_conv 1",
	test,
	(⌜T⌝, ⌜T⌝),
	true),
	("∃_reorder_conv 2",
	test,
	(⌜∃ x ⦁ y⌝, ⌜y : BOOL⌝),
	true),
	("∃_reorder_conv 3",
	test,
	(⌜∃(x,y) p ⦁x ∧ y ∧ p⌝, ⌜∃ q (y,x)⦁ x ∧ y ∧ q⌝),
	true),
	("∃_reorder_conv 4",
	test,
	(⌜∃ (x,y,x) ⦁ x ∧ y⌝, ⌜∃ (a,x,a) ⦁ x ∧ a⌝),
	true),
	("∃_reorder_conv 5",
	test,
	(⌜∃ (@_1,@_2) ⦁ @_1 ∧ @_2⌝, ⌜∃ @_3 @_4 ⦁ @_3 ∧ @_4⌝),
	true)
	]
end;
store_mt_results mt_run_fail [
	("∃_reorder_conv 27050 a",
	∃_reorder_conv ⌜T⌝,
	⌜F⌝,
	gen_fail_msg "∃_reorder_conv" 27050 ["⌜T⌝", "⌜F⌝"]),
	("∃_reorder_conv 27050 b",
	∃_reorder_conv ⌜∃ x ⦁ y⌝,
	⌜∃ x ⦁ x⌝,
	gen_fail_msg "∃_reorder_conv" 27050 ["⌜∃ x⦁ y⌝", "⌜∃ x⦁ x⌝"]),
	("∃_reorder_conv 27050 c",
	∃_reorder_conv ⌜2⌝,
	⌜T⌝,
	gen_fail_msg "∃_reorder_conv" 27050 ["⌜2⌝", "⌜T⌝"])
	];
=TEX
\subsection{ALL$\_$SIMPLE$\_$∃$\_$C}
=SML
store_mt_results (mt_runf (op =#)) [
	("ALL_SIMPLE_∃_C 1",
	dest_thm o ALL_SIMPLE_∃_C eq_sym_conv,
	⌜∃ a b c:'a ⦁ a = b⌝,
	([],⌜(∃ a b c:'a ⦁ a = b) = (∃ a b c:'a ⦁ b = a)⌝)),
	("ALL_SIMPLE_∃_C 2",
	dest_thm o ALL_SIMPLE_∃_C eq_sym_conv,
	⌜∃ a⦁ a = b⌝,
	([],⌜(∃ a⦁ a = b) = (∃ a⦁ b = a)⌝)),
	("ALL_SIMPLE_∃_C 3",
	dest_thm o ALL_SIMPLE_∃_C eq_sym_conv,
	⌜a = b⌝,
	([],⌜(a = b) = (b = a)⌝))
	];
store_mt_results mt_run_fail [
	("ALL_SIMPLE_∃_C 3014",
	ALL_SIMPLE_∃_C eq_sym_conv,
	mk_t,
	gen_fail_msg "eq_sym_conv" 3014 ["⌜T⌝"])
	];
=TEX
\subsection{∃$_1$\_intro}
=SML
store_mt_results (mt_runf (op =#)) [("∃⋎1_intro 1",
	dest_thm o ∃⋎1_intro (∧_intro t_thm t_thm),
	asm_rule ⌜∀ (x, y)⦁ x ∧ y ⇒ (x, y) = (T, T)⌝,
	([⌜∀ (x, y)⦁ x ∧ y ⇒ (x, y) = (T, T)⌝],
		⌜∃⋎1 (x,y) ⦁ x ∧ y⌝)),
	("∃⋎1_intro 2",
	dest_thm o ∃⋎1_intro (asm_rule⌜Fst(T,T) ∧ Snd(T,T)⌝),
	asm_rule ⌜∀  z ⦁ Fst z ∧ Snd z ⇒ z = (T, T)⌝,
	([⌜Fst(T,T) ∧ Snd(T,T)⌝,
		⌜∀ z ⦁ Fst z ∧ Snd z ⇒ z = (T, T)⌝],
		⌜∃⋎1 z ⦁ Fst z ∧ Snd z⌝))];

store_mt_results mt_run_fail [("∃⋎1_intro 27054",
	∃⋎1_intro f_thm,
	t_thm,
	gen_fail_msg "∃⋎1_intro" 27054 ["⊢ T"]),
	("∃⋎1_intro 27021",
	∃⋎1_intro f_thm,
	asm_rule ⌜∀ (x,y)⦁ x ∧ y ⇒ (x,y) = (T, T)⌝,
	gen_fail_msg "∃⋎1_intro" 27021 ["⊢ ¬ F",
		"∀ (x, y)⦁ x ∧ y ⇒ (x, y) = (T, T) ⊢ ∀ (x, y)⦁ x ∧ y ⇒ (x, y) = (T, T)"])];
=TEX
\subsection{∃$_1$\_elim}
=SML
store_mt_results (mt_runf (op =#)) [("∃⋎1_elim 1",
	dest_thm o ∃⋎1_elim,
	asm_rule ⌜∃⋎1 (x,y) ⦁ x ∧ y⌝,
	([ ⌜∃⋎1 (x,y) ⦁ x ∧ y⌝],
		⌜∃ (x, y)⦁ (x ∧ y) ∧ (∀ (x', y')⦁ x' ∧ y' ⇒ (x', y') = (x, y))⌝)),
	("∃⋎1_elim 2",
	dest_thm o ∃⋎1_elim,
	asm_rule ⌜∃⋎1 tt ⦁ tt = (λ y:'b ⦁ y)⌝,
	([ ⌜∃⋎1 tt ⦁ tt = (λ y:'b ⦁ y)⌝],
		⌜∃ tt⦁ tt = (λ y⦁ y) ∧ (∀ tt'⦁ tt' = (λ y:'b⦁ y) ⇒ tt' = tt)⌝))];

store_mt_results mt_run_fail [("∃⋎1_elim 27022",
	∃⋎1_elim,
	t_thm,
	gen_fail_msg "∃⋎1_elim" 27022 ["⊢ T"])];
=TEX
\subsection{∃$_1$1\_conv}
=SML
store_mt_results (mt_runf (op =#)) [("∃⋎1_conv 1",
	dest_thm o ∃⋎1_conv,
	 ⌜∃⋎1 (x,y) ⦁ x ∧ y⌝,
	([],
		⌜(∃⋎1 (x,y) ⦁ x ∧ y) ⇔
		(∃ (x, y)⦁ (x ∧ y) ∧ (∀ (x', y')⦁ x' ∧ y' ⇒ (x', y') = (x, y)))⌝)),
	("∃⋎1_conv 2",
	dest_thm o ∃⋎1_conv,
	⌜∃⋎1 tt ⦁ tt = (λ y:'b ⦁ y)⌝,
	([],
		⌜(∃⋎1 tt ⦁ tt = (λ y:'b ⦁ y)) ⇔
		(∃ tt⦁ tt = (λ y:'b⦁ y) ∧ (∀ tt'⦁ tt' = (λ y⦁ y) ⇒ tt' = tt))⌝))];

store_mt_results mt_run_fail [("∃⋎1_conv 27053",
	∃⋎1_conv,
	mk_t,
	gen_fail_msg "∃⋎1_conv" 27053 ["⌜T⌝"])];
=TEX
\subsection{ε\-\_elim\-\_rule}
=SML
store_mt_results (mt_runf (op =#)) [("ε_elim_rule 1",
	dest_thm o ε_elim_rule ⌜x : BOOL → BOOL⌝
		(asm_rule ⌜(λ f ⦁ f T)(ε f ⦁ f T)⌝),
	(undisch_rule(simple_∀_elim ⌜x:BOOL → BOOL⌝ (asm_rule
		⌜∀ x : BOOL → BOOL ⦁  (λ f ⦁ f T) x ⇒ rubbish⌝))),
	([⌜∀ x : BOOL → BOOL ⦁  (λ f ⦁ f T) x ⇒ rubbish⌝,⌜(λ f ⦁ f T)(ε f ⦁ f T)⌝],
		⌜rubbish : BOOL⌝)),
	("ε_elim_rule 2",
	dest_thm o ε_elim_rule ⌜(x,y) : (BOOL × BOOL)⌝
		(asm_rule ⌜(λ (f,g) ⦁ f ∧ g)(ε p ⦁ T)⌝),
	(undisch_rule(∀_elim ⌜(x,y) : (BOOL × BOOL)⌝ (asm_rule
		⌜∀ (x,y) ⦁  (λ (f,g) ⦁ f ∧ g) (x,y) ⇒ rubbish⌝))),
	([⌜∀ (x,y) ⦁  (λ (f,g) ⦁ f ∧ g) (x,y) ⇒ rubbish⌝,⌜(λ (f,g) ⦁ f ∧ g)(ε p ⦁ T)⌝],
		⌜rubbish : BOOL⌝)),
	("ε_elim_rule 3",
	dest_thm o ε_elim_rule ⌜(x,y,z) : (BOOL × BOOL × BOOL)⌝
		 (asm_rule ⌜(λ (f,g,h) ⦁ f ∧ g ∧ h)(ε p ⦁ T)⌝),
	(undisch_rule(∀_elim ⌜(x,y,z) : (BOOL × BOOL × BOOL)⌝ (asm_rule
		⌜∀ (x,y,z) ⦁ (λ (f,g,h) ⦁ f ∧ g ∧ h) (x,y,z) ⇒ rubbish⌝))),
	([⌜∀ (x,y,z) ⦁  (λ (f,g,h) ⦁ f ∧ g ∧ h) (x,y,z) ⇒ rubbish⌝,
		 ⌜(λ (f,g,h) ⦁ f ∧ g ∧ h)(ε p ⦁ T)⌝],
		⌜rubbish : BOOL⌝))];

store_mt_results mt_run_fail [("ε_elim_rule 4016",
	ε_elim_rule ⌜f x : BOOL → BOOL⌝ (asm_rule ⌜(λ f ⦁ f T)(ε f ⦁ f T)⌝),
	(undisch_rule(simple_∀_elim ⌜x:BOOL → BOOL⌝ (asm_rule
		⌜∀ x ⦁  (λ f ⦁ f T) x ⇒ rubbish⌝))),
	gen_fail_msg "ε_elim_rule" 4016 ["⌜f x⌝"]),
	("ε_elim_rule 7019",
	ε_elim_rule ⌜x : BOOL → BOOL⌝ t_thm,
	(undisch_rule(simple_∀_elim ⌜x:BOOL → BOOL⌝ (asm_rule
		⌜∀ x ⦁  (λ f ⦁ f T) x ⇒ rubbish⌝))),
	gen_fail_msg "ε_elim_rule" 7019 ["⊢ T"]),
	("ε_elim_rule 7054",
	ε_elim_rule ⌜x : BOOL⌝ (asm_rule ⌜(λ f ⦁ f T)(ε f ⦁ f T)⌝),
	(undisch_rule(simple_∀_elim ⌜x:BOOL → BOOL⌝ (asm_rule
		⌜∀ x ⦁ (λ f ⦁ f T) x ⇒ rubbish⌝))),
	gen_fail_msg "ε_elim_rule" 7054 ["⌜x⌝"]),
	("ε_elim_rule 27043",
	ε_elim_rule ⌜(y,y)⌝ (asm_rule ⌜(λ f ⦁ f T)(ε f ⦁ f T)⌝),
	(undisch_rule(simple_∀_elim ⌜x:BOOL → BOOL⌝ (asm_rule
		⌜∀ x ⦁  (λ f ⦁ f T) x ⇒ rubbish⌝))),
	gen_fail_msg "ε_elim_rule" 27043 ["⌜y⌝","⌜(y, y)⌝"]),
	("ε_elim_rule 27045",
	ε_elim_rule ⌜y : BOOL → BOOL⌝ (asm_rule ⌜(λ f ⦁ f T)(ε f ⦁ f T)⌝),
	(undisch_rule(simple_∀_elim ⌜x:BOOL → BOOL⌝ (asm_rule
		⌜∀ x ⦁ (λ f ⦁ f T) x ⇒ rubbish⌝))),
	gen_fail_msg "ε_elim_rule" 27045 ["⌜y⌝",
		"(λ f⦁ f T) (ε f⦁ f T) ⊢ (λ f⦁ f T) (ε f⦁ f T)",
		"∀ x⦁ (λ f⦁ f T) x ⇒ rubbish, (λ f⦁ f T) x ⊢ rubbish"]),
	("ε_elim_rule 27051",
	ε_elim_rule ⌜y:BOOL → BOOL⌝ (asm_rule ⌜(λ f:BOOL → BOOL ⦁ f T)(ε f ⦁ f T)⌝),
	refl_conv ⌜y:BOOL → BOOL⌝,
	gen_fail_msg "ε_elim_rule" 27051 ["⌜y⌝","⊢ y = y"]),
	("ε_elim_rule 27052",
	ε_elim_rule ⌜x : BOOL → BOOL⌝ (asm_rule ⌜(λ f ⦁ f T)(ε f ⦁ f T)⌝),
	(undisch_rule(asm_rule
		⌜(λ f ⦁ f T) x ⇒ rubbish⌝)),
	gen_fail_msg "ε_elim_rule" 27052 ["⌜x⌝",
		"(λ f⦁ f T) x ⇒ rubbish, (λ f⦁ f T) x ⊢ rubbish",
		"⌜(λ f⦁ f T) x⌝"])
	];
=TEX
\subsection{∃\_ε\_conv}
=SML
store_mt_results (mt_runf (op =#)) [
	("∃_ε_conv 1",
	dest_thm o ∃_ε_conv,
	⌜∃ (x,y,z) ⦁ x ∧ y ∧ z⌝,
	([],⌜(∃ (x,y,z) ⦁ x ∧ y ∧ z) ⇔
		Fst (ε (x, y, z)⦁ x ∧ y ∧ z) ∧
		Fst (Snd (ε (x, y, z)⦁ x ∧ y ∧ z)) ∧
		Snd (Snd (ε (x, y, z)⦁ x ∧ y ∧ z))⌝)),
	("∃_ε_conv 2",
	dest_thm o ∃_ε_conv,
	⌜∃ x ⦁ x ∧ T⌝,
	([],⌜(∃ x ⦁ x ∧ T) ⇔ (ε x ⦁ x ∧ T) ∧ T⌝))
	];
store_mt_results mt_run_fail [
	("∃_ε_conv 4020",
	∃_ε_conv,
	⌜T⌝,
	gen_fail_msg "∃_ε_conv" 4020 ["⌜T⌝"])
	];
=TEX
\subsection{∃\_ε\_rule}
=SML
store_mt_results (mt_runf (op =#)) [
	("∃_ε_rule 1",
	dest_thm o ∃_ε_rule,
	asm_rule ⌜∃ (x,y,z) ⦁ x ∧ y ∧ z⌝,
	([⌜∃ (x,y,z) ⦁ x ∧ y ∧ z⌝],⌜Fst (ε (x, y, z)⦁ x ∧ y ∧ z) ∧
		Fst (Snd (ε (x, y, z)⦁ x ∧ y ∧ z)) ∧
		Snd (Snd (ε (x, y, z)⦁ x ∧ y ∧ z))⌝)),
	("∃_ε_rule 2",
	dest_thm o ∃_ε_rule,
	asm_rule ⌜∃ x ⦁ x ∧ T⌝,
	([⌜∃ x ⦁ x ∧ T⌝],⌜(ε x ⦁ x ∧ T) ∧ T⌝))
	];
store_mt_results mt_run_fail [
	("∃_ε_rule",
	∃_ε_rule,
	t_thm,
	gen_fail_msg "∃_ε_rule" 27024 ["⊢ T"])
	];
=TEX
\subsection{let\_conv}
=SML
store_mt_results (mt_runf (op =#)) [
	("let_conv 1",
	dest_thm o let_conv,
	⌜let x = 5 in f x 2⌝,
	([],⌜(let x = 5 in f x 2) = f 5 2⌝)),
	("let_conv 2",
	dest_thm o let_conv,
	⌜let f x = p x 5 in f 5 2⌝,
	([],⌜(let f x = p x 5 in f 5 2) = (λ x ⦁ p x 5) 5 2⌝)),
	("let_conv 3",
	dest_thm o let_conv,
	⌜let (x,y) = p and (a,b,c) = q in (a ∧ b ∧ c ∧ x ∧ y)⌝,
	([],⌜(let (x,y) = p and (a,b,c) = q in (a ∧ b ∧ c ∧ x ∧ y)) ⇔
	(Fst q ∧
  Fst (Snd q) ∧ Snd (Snd q) ∧ Fst p ∧ Snd p)⌝))
	];
store_mt_results mt_run_fail [
	("let_conv 4009",
	let_conv,
	⌜T⌝,
	gen_fail_msg "let_conv" 4009 ["⌜T⌝"])
	];
=TEX
\subsection{list\_∀\_intro}
=SML
store_mt_results (mt_runf (op =#)) [
	("list_∀_intro",
	dest_thm o list_∀_intro [⌜(x:BOOL,y:BOOL,z:BOOL)⌝,⌜a:BOOL⌝,⌜(b:BOOL,c:BOOL)⌝],
	all_⇒_intro(asm_rule ⌜a ∧ b ∧c ∧ x ∧ y ∧ z⌝),
	([],⌜∀ (x:BOOL,y:BOOL,z:BOOL) a (b:BOOL,c:BOOL) ⦁
		a ∧ b ∧ c ∧ x ∧ y ∧ z ⇒
		a ∧ b ∧ c ∧ x ∧ y ∧ z⌝))
	];
store_mt_results mt_run_fail [
	("list_∀_intro 4016",
	list_∀_intro [⌜T⌝],
	t_thm,
	gen_fail_msg "list_∀_intro" 4016 ["⌜T⌝"]),
	("list_∀_intro 6005",
	list_∀_intro [⌜x:BOOL⌝],
	asm_rule ⌜x:BOOL⌝,
	gen_fail_msg "list_∀_intro" 6005 ["⌜x⌝"])
	];
=TEX
\subsection{λ\_C}
=SML
store_mt_results (mt_runf (op =#)) [
	("λ_C 1",
	dest_thm o λ_C (RATOR_C(RAND_C eq_sym_conv)),
	⌜(λ x :'a ⦁ ((x=y),x))⌝,
	([],⌜(λ x :'a⦁ ((x=y),x)) = (λ x ⦁ ((y=x),x))⌝)),
	("λ_C 2",
	dest_thm o λ_C (RATOR_C(RAND_C eq_sym_conv)),
	⌜λ (x,y):'b × 'b ⦁ ((x=y),x)⌝,
	([],⌜(λ (x,y):'b × 'b  ⦁ ((x=y),x)) = (λ (x,y) ⦁ ((y=x),x))⌝)),
	("λ_C 3",
	dest_thm o λ_C (RATOR_C(RAND_C eq_sym_conv)),
	⌜λ ((a,b),(x,y)):('a × 'b) × ('a × 'b) ⦁ ((x=a),x)⌝,
	([],⌜(λ ((a,b),(x,y)) :('a × 'b) × ('a × 'b)⦁ ((x=a),x)) =
		(λ ((a,b),(x,y)) ⦁ ((a = x),x))⌝))
	];
store_mt_results mt_run_fail [
	("λ_C 4002",
	λ_C eq_sym_conv,
	⌜T⌝,
	gen_fail_msg "λ_C" 4002 ["⌜T⌝"]),
	("λ_C 7104",
	λ_C (fn x => t_thm),
	⌜λ x ⦁ T⌝,
	gen_fail_msg "λ_C" 7104 ["⊢ T"])
	];
=TEX
\subsection{BINDER\_C}
=SML
store_mt_results (mt_runf (op =#)) [
	("BINDER_C 1",
	dest_thm o BINDER_C (RATOR_C(RAND_C eq_sym_conv)),
	⌜(∀ x :'a ⦁ ((x=y)⇔ T))⌝,
	([],⌜(∀ x :'a⦁ ((x=y)⇔ T)) = (∀ x ⦁ ((y=x)⇔ T))⌝)),
	("BINDER_C 2",
	dest_thm o BINDER_C (RATOR_C(RAND_C eq_sym_conv)),
	⌜∀ (x,y):'b × 'b ⦁ ((x=y)⇔ T)⌝,
	([],⌜(∀ (x,y):'b × 'b  ⦁ ((x=y)⇔ T)) = (∀ (x,y):'b × 'b ⦁ ((y=x)⇔ T))⌝)),
	("BINDER_C 3",
	dest_thm o BINDER_C (RATOR_C(RAND_C eq_sym_conv)),
	⌜∀ ((a,b),(x,y)):('a × 'b) × ('a × 'b) ⦁ ((x=a)⇔ T)⌝,
	([],⌜(∀ ((a,b),(x,y)) :('a × 'b) × ('a × 'b)⦁ ((x=a)⇔ T)) =
		(∀ ((a,b),(x,y)) :('a × 'b) × ('a × 'b)⦁ ((a = x)⇔ T))⌝))
	];
store_mt_results mt_run_fail [
	("BINDER_C 27035",
	BINDER_C eq_sym_conv,
	⌜T⌝,
	gen_fail_msg "BINDER_C" 27035 ["⌜T⌝"]),
	("BINDER_C 7104",
	BINDER_C (fn x => t_thm),
	⌜∀ x ⦁ T⌝,
	gen_fail_msg "BINDER_C" 7104 ["⊢ T"])
	];
=TEX

=IGN
\subsection{}
store_mt_results mt_run [
	("",
	,
	,
	)
	];
store_mt_results mt_run_fail [
	("",
	,
	,
	gen_fail_msg ""  [])
	];
=TEX
\subsection{End of Tests}
=SML
diag_string(summarize_mt_results());
=TEX
\end{document}




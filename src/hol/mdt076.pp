=IGN
********************************************************************************
mdt076.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% $Id: mdt076.doc,v 1.12 2002/10/17 16:20:01 rda Exp rda $ ℤ
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

\def\Title{Module Tests for the Proof Contexts I}

\def\AbstractText{A set of module tests are given for the the proof contexts supplied up to theory ``hol''.}

\def\Reference{DS/FMU/IED/MDT076}

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
%% LaTeX2e port: \TPPtitle{Module Tests for the Proof Contexts I}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Module Tests for the Proof Contexts I}
%% LaTeX2e port: \TPPref{DS/FMU/IED/MDT076}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.12 $ %
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2002/10/17 16:20:01 $ %
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{ML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.Blackburn & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & Project Manager}
%% LaTeX2e port: \TPPabstract{A set of module tests are given for the
%% LaTeX2e port: the proof contexts supplied up to theory ``hol''.}
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
%\subsection{Contents List}
%\tableofcontents
\subsection{Document Cross References}
\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes History}
\begin{description}
\item [Issue 1.1 (1992/05/19),1.2 (1992/05/19),1.3 (1992/05/26)]
First drafts.
\item [Issue 1.4 (1992/05/27) (27th May 1992)]
Bug fixing.
\item [Issue 1.5 (1992/06/24) (24th June 1992)]
Changes to match issue 1.6 of \cite{DS/FMU/IED/DTD076}.
\item [Issue 1.6 (1992/06/25) (25th June 1992)]
Change of title and text.
\item [Issue 1.7 (1992/06/25) (25th June 1992)]
More changes to match issue 1.6 of \cite{DS/FMU/IED/DTD076}.
\item [Issue 1.8 (1993/01/27) (2nd February 1993)]
Added variable elimination to prove tactics.
\item[Issue 1.9 (1993/02/02)]
Remove table of contents to bypass {\LaTeX} error.
\item[Issue 1.11 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.12 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.13 (2006/12/10)] Added examples using symmetric difference.
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
This document contains the module testing of the proof contexts supplied for theories up to ``hol''.
The design is in \cite{DS/FMU/IED/DTD076}
and it is
implemented in \cite{DS/FMU/IED/IMP076}.

\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains the module testing of the material given a design in \cite{DS/FMU/IED/DTD076},
following the test policy given in that document and the general policy given in \cite{DS/FMU/IED/PLN008}.

\subsubsection{Dependencies}
This document is derived from the detailed design in \cite{DS/FMU/IED/DTD076},
and is further influenced by the implementation, in  \cite{DS/FMU/IED/IMP076}.
\subsubsection{Deficiencies}
None known.
\section{TEST CASES}
We test the two functions of the signature of \cite{DS/FMU/IED/DTD076}
in turn.
We then test for the presence, effect, and ``out of problem domain'' for each proof context in the detailed design \cite{DS/FMU/IED/DTD076}.
\section{PROLOGUE}
Initialise the test package:
=SML
use_file "dtd013.sml";
use_file "imp013.sml";
init_mt_results();
=TEX
=SML
open_theory "basic_hol";
set_pc "basic_hol";
=TEX
\section{FUNCTIONS}
=SML
store_mt_results (mt_runf (op =$)) [("basic_prove_tac 1",
	concl o tac_proof,
	(([],⌜∀ x ⦁ x = x⌝),basic_prove_tac []),
	⌜∀ x ⦁ x = x⌝),
	("basic_prove_tac 2",
	concl o tac_proof,
	(([],concl prim_rec_thm),basic_prove_tac [prim_rec_thm]),
	concl prim_rec_thm),
	("basic_prove_tac 3",
	concl o tac_proof,
	(([⌜a = b⌝, ⌜d = c⌝,⌜c = b⌝, ⌜c = c⌝],⌜a = d⌝),basic_prove_tac []),
	⌜a = d⌝)];
=TEX
=SML
store_mt_results (mt_runf (op =$)) [("basic_prove_conv 1",
	concl o basic_prove_conv [],
	⌜∀ x ⦁ x = x⌝,
	⌜(∀ x ⦁ x = x) ⇔ T⌝),
	("basic_prove_conv 2",
	concl o basic_prove_conv [prim_rec_thm],
	concl prim_rec_thm,
	mk_⇔(concl prim_rec_thm, mk_t)),
	("basic_prove_conv 3",
	concl o basic_prove_conv [],
	⌜a = b ⇒ d = c ⇒ c = b ⇒ c = c ⇒ a = d⌝,
	mk_⇔(⌜a = b ⇒ d = c ⇒ c = b ⇒ c = c ⇒ a = d⌝, mk_t))];
store_mt_results mt_run_fail [("basic_prove_conv 76001",
	basic_prove_conv [],
	mk_f,
	gen_fail_msg "basic_prove_conv" 76001 ["⌜F⌝"])];
=TEX

\section{SUPPLIED PROOF CONTEXTS}
\subsection{Test Functions}
=SML
fun lprove_rule tm = tac_proof(([],tm),
	TRY_T(rewrite_tac[]) THEN
	REPEAT strip_tac)
	handle complaint =>
	divert complaint "tac_proof" "lprove_rule" 76001
		[fn () => string_of_term tm];
=TEX
\subsection{Proof Context: ``initial''}
=SML
set_pc "initial";
store_mt_results (mt_runf (op =$)) [("proof context initial",
	concl o lprove_rule,
	⌜a ⇒ a⌝,
	⌜a ⇒ a⌝)];
store_mt_results mt_run_fail [("proof context initial does not apply",
	lprove_rule,
	⌜a ⇔ a⌝,
	gen_fail_msg "lprove_rule" 76001 ["⌜a ⇔ a⌝"])];
=TEX

\subsection{Proof Context: ``$'$basic$\_$prove$\_∃\_$conv''}
=SML
set_pc "'basic_prove_∃_conv";
store_mt_results (mt_runf (op =$)) [("proof context 'basic_prove_∃_conv",
	concl o prove_∃_conv,
	⌜∃ x ⦁ x = 1⌝,
	⌜(∃ x ⦁ x = 1) ⇔ T⌝)];
store_mt_results mt_run_fail [("proof context 'basic_prove_∃_conv does not apply a",
	lprove_rule,
	⌜a ⇔ a⌝,
	gen_fail_msg "lprove_rule" 76001 ["⌜a ⇔ a⌝"])];
=TEX
\subsection{Proof Context: ``$'$simple$\_$abstractions''}
=SML
set_pc "'simple_abstractions";
store_mt_results (mt_runf (op =$)) [("proof context 'simple_abstractions",
	concl o lprove_rule,
	⌜(¬(a ∨ b)) ⇒ ¬ a⌝,
	⌜(¬(a ∨ b)) ⇒ ¬ a⌝)];
store_mt_results mt_run_fail [("proof context 'simple_abstractions does not apply a",
	lprove_rule,
	⌜a ⇔ a⌝,
	gen_fail_msg "lprove_rule" 76001 ["⌜a ⇔ a⌝"]),
	("proof context 'simple_abstractions does not apply b",
	lprove_rule,
	⌜∀ (x, y)⦁ x ⇒ x⌝,
	gen_fail_msg "lprove_rule" 76001 ["⌜∀ (x, y)⦁ x ⇒ x⌝"])];
=TEX
\subsection{Proof Context: ``$'$paired$\_$abstractions''}
=SML

set_pc "'paired_abstractions";
store_mt_results (mt_runf (op =$)) [("proof context 'paired_abstractions",
	concl o lprove_rule,
	⌜∀ (x, y)⦁ x ⇒ x⌝,
	⌜∀ (x, y)⦁ x ⇒ x⌝)];
store_mt_results mt_run_fail [("proof context 'paired_abstractions does not apply",
	lprove_rule,
	⌜a ⇔ a⌝,
	gen_fail_msg "lprove_rule" 76001 ["⌜a ⇔ a⌝"])];
=TEX
\subsection{Proof Context: ``$'$propositions''}
=SML
set_pc "'propositions";
store_mt_results (mt_runf (op =$)) [("proof context 'propositions",
	concl o lprove_rule,
	⌜a ⇔ a⌝,
	⌜a ⇔ a⌝)];
store_mt_results mt_run_fail [("proof context 'propositions does not apply",
	lprove_rule,
	⌜¬(a ∨ b) ⇒ a⌝,
	gen_fail_msg "lprove_rule" 76001 ["⌜¬ (a ∨ b) ⇒ a⌝"])];
=TEX
\subsection{Proof Context: ``$'$fun$\_$ext''}
=SML
set_pc "'fun_ext";
store_mt_results (mt_runf (op =$)) [("proof context 'fun_ext",
	concl o lprove_rule,
	⌜(∀ x ⦁ f x = g x) ⇒ (f = g)⌝,
	⌜(∀ x ⦁ f x = g x) ⇒ (f = g)⌝)];
store_mt_results mt_run_fail [("proof context 'fun_ext does not apply",
	lprove_rule,
	⌜a ⇔ a⌝,
	gen_fail_msg "lprove_rule" 76001 ["⌜a ⇔ a⌝"])];
=TEX
\subsection{Proof Context: ``predicates''}
=SML
set_pc "predicates";
store_mt_results (mt_runf (op =$)) [("proof context predicates",
	concl o lprove_rule,
	⌜∀ (x,y) ⦁ ¬(x ∧ y) ⇒ ¬ x ∨ ¬ y⌝,
	⌜∀ (x,y) ⦁ ¬(x ∧ y) ⇒ ¬ x ∨ ¬ y⌝)];
store_mt_results mt_run_fail [("proof context predicates does not apply",
	lprove_rule,
	⌜(∀ x ⦁ f x = g x) ⇒ (f = g)⌝,
	gen_fail_msg "lprove_rule" 76001 ["⌜(∀ x⦁ f x = g x) ⇒ f = g⌝"])];
=TEX
\subsection{Proof Context: ``predicates1''}
=SML
set_pc "predicates1";
store_mt_results (mt_runf (op =$)) [("proof context predicates1",
	concl o lprove_rule,
	⌜(∀ x ⦁ f x = g x) ⇔ (f = g)⌝,
	⌜(∀ x ⦁ f x = g x) ⇔ (f = g)⌝)];
store_mt_results mt_run_fail [("proof context predicates1 does not apply",
	lprove_rule,
	⌜(a, b) = (c, d) ⇒ a = c⌝,
	gen_fail_msg "lprove_rule" 76001 ["⌜(a, b) = (c, d) ⇒ a = c⌝"])];
=TEX
\subsection{Proof Context: ``$'$pair''}
=SML
set_pc "'pair";
store_mt_results (mt_runf (op =$)) [("proof context 'pair",
	concl o lprove_rule,
	⌜((a, b) = (c, d)) ⇒ a = c⌝,
	⌜((a, b) = (c, d)) ⇒ a = c⌝)];
store_mt_results mt_run_fail [("proof context 'pair does not apply a",
	lprove_rule,
	⌜a ⇔ a⌝,
	gen_fail_msg "lprove_rule" 76001 ["⌜a ⇔ a⌝"]),
	("proof context pair does not apply b",
	lprove_rule,
	⌜((a, b) = c) ⇒ a = Fst c⌝,
	gen_fail_msg "lprove_rule" 76001 ["⌜(a, b) = c ⇒ a = Fst c⌝"])];
=TEX
\subsection{Proof Context: ``$'$pair1''}
=SML
set_pc "'pair1";
store_mt_results (mt_runf (op =$)) [("proof context 'pair1",
	concl o lprove_rule,
	⌜((a, b) = c) ⇒ a = Fst c⌝,
	⌜((a, b) = c) ⇒ a = Fst c⌝)];
store_mt_results mt_run_fail [("proof context 'pair1 does not apply",
	lprove_rule,
	⌜a ⇔ a⌝,
	gen_fail_msg "lprove_rule" 76001 ["⌜a ⇔ a⌝"])];
=TEX
\subsection{Proof Context: ``$'$ℕ''}
=SML
set_pc "'ℕ";
store_mt_results (mt_runf (op =$)) [
	("proof context 'ℕ",
	concl o lprove_rule,
	⌜0 ≤ x⌝,
	⌜0 ≤ x⌝)];
store_mt_results mt_run_fail [("proof context 'ℕ does not apply a",
	lprove_rule,
	⌜¬(1 = 0)⌝,
	gen_fail_msg "lprove_rule" 76001 ["⌜¬ 1 = 0⌝"]),
	("proof context 'ℕ does not apply b",
	lprove_rule,
	⌜2 + 3 = 5⌝,
	gen_fail_msg "lprove_rule" 76001 ["⌜2 + 3 = 5⌝"])];
=TEX
\subsection{Proof Context: ``$'$ℕ$\_$lit''}
=SML
set_pc "'ℕ_lit";
store_mt_results (mt_runf (op =$)) [("proof context 'ℕ_lit",
	concl o lprove_rule,
	⌜2 + 3 = 5⌝,
	⌜2 + 3 = 5⌝)];
store_mt_results mt_run_fail [("proof context 'ℕ_lit does not apply",
	lprove_rule,
	⌜0 ≤ x⌝,
	gen_fail_msg "lprove_rule" 76001 ["⌜0 ≤ x⌝"])];
=TEX
\subsection{Proof Context: ``$'$list''}
=SML
set_pc "'list";
store_mt_results (mt_runf (op =$)) [("proof context 'list",
	concl o lprove_rule,
	⌜[a] = [b] ⇒ a = b⌝,
	⌜[a] = [b] ⇒ a = b⌝)];
store_mt_results mt_run_fail [("proof context 'list does not apply",
	lprove_rule,
	⌜a ⇔ a⌝,
	gen_fail_msg "lprove_rule" 76001 ["⌜a ⇔ a⌝"])];
=TEX
\subsection{Proof Context: ``$'$char''}
=SML
set_pc "'char";
store_mt_results (mt_runf (op =$)) [("proof context 'char",
	concl o lprove_rule,
	⌜"ab" = "cd" ⇒ x⌝,
	⌜"ab" = "cd" ⇒ x⌝)];
store_mt_results mt_run_fail [("proof context 'char does not apply",
	lprove_rule,
	⌜a ⇔ a⌝,
	gen_fail_msg "lprove_rule" 76001 ["⌜a ⇔ a⌝"])];
=TEX
\subsection{Proof Context: ``basic$\_$hol''}
=SML
set_pc "basic_hol";
store_mt_results (mt_runf (op =$)) [("proof context basic_hol",
	concl o lprove_rule,
	⌜¬(0 = 1) ∧ ¬("ab" = "ac")⌝,
	⌜¬(0 = 1) ∧ ¬("ab" = "ac")⌝)];
store_mt_results mt_run_fail [("proof context basic_hol does not apply",
	lprove_rule,
	⌜2 + 3 = 5⌝,
	gen_fail_msg "lprove_rule" 76001 ["⌜2 + 3 = 5⌝"])];
=TEX
\subsection{Proof Context: ``basic$\_$hol1''}
=SML
set_pc "basic_hol1";
store_mt_results (mt_runf (op =$)) [("proof context basic_hol1",
	concl o lprove_rule,
	⌜3 - (2+1) ≤ x⌝,
	⌜3 - (2+1) ≤ x⌝)];
store_mt_results mt_run_fail [("proof context basic_hol1 does not apply",
	lprove_rule,
	⌜F⌝,
	gen_fail_msg "lprove_rule" 76001 ["⌜F⌝"])];
=TEX
\subsection{Proof Context: ``$'$sum''}
=SML
open_theory "sum";
set_pc "'sum";
store_mt_results (mt_runf (op =$)) [("proof context 'sum",
	concl o lprove_rule,
	⌜InL x = InR x ⇒ y⌝,
	⌜InL x = InR x ⇒ y⌝)];
store_mt_results mt_run_fail [("proof context 'sum does not apply",
	lprove_rule,
	⌜a ⇔ a⌝,
	gen_fail_msg "lprove_rule" 76001 ["⌜a ⇔ a⌝"])];
=TEX
\subsection{Proof Context: ``$'$one''}
=SML
open_theory "one";
set_pc "'one";
store_mt_results (mt_runf (op =$)) [("proof context 'one",
	concl o lprove_rule,
	⌜(x:ONE) = y⌝,
	⌜(x:ONE) = y⌝)];
store_mt_results mt_run_fail [("proof context 'one does not apply",
	lprove_rule,
	⌜a ⇔ a⌝,
	gen_fail_msg "lprove_rule" 76001 ["⌜a ⇔ a⌝"])];
=TEX
\subsection{Proof Context: ``$'$combin''}
=SML
open_theory "combin";
set_pc "'combin";
store_mt_results (mt_runf (op =$)) [("proof context 'combin",
	concl o lprove_rule,
	⌜CombK T F⌝,
	⌜CombK T F⌝)];
store_mt_results mt_run_fail [("proof context 'combin does not apply",
	lprove_rule,
	⌜a ⇔ a⌝,
	gen_fail_msg "lprove_rule" 76001 ["⌜a ⇔ a⌝"])];
=TEX
\subsection{Proof Context: ``$'$sets$\_$alg''}
=SML
open_theory "sets";
set_pc "'sets_alg";
store_mt_results (mt_runf (op =$)) [("proof context 'sets_alg",
	concl o lprove_rule,
	⌜x ∈ Universe⌝,
	⌜x ∈ Universe⌝)];
store_mt_results mt_run_fail [("proof context 'sets_alg does not apply",
	lprove_rule,
	⌜a = b ⇒ {v | a} = {w | b}⌝,
	gen_fail_msg "lprove_rule" 76001 ["⌜(a ⇔ b) ⇒ {v|a} = {w|b}⌝"])];
=TEX
\subsection{Proof Context: ``$'$sets$\_$ext''}
=SML
open_theory "sets";
set_pc "'sets_ext";
store_mt_results (mt_runf (op =$)) [("proof context 'sets_ext",
	concl o lprove_rule,
	⌜a = b ⇒ {v | a} = {w | b}⌝,
	⌜a = b ⇒ {v | a} = {w | b}⌝)];
store_mt_results mt_run_fail [("proof context 'sets_ext does not apply a",
	lprove_rule,
	⌜a ⇔ a⌝,
	gen_fail_msg "lprove_rule" 76001 ["⌜a ⇔ a⌝"]),
	("proof context 'sets_ext does not apply b",
	lprove_rule,
	⌜a ∩ b = b ∩ a⌝,
	gen_fail_msg "lprove_rule" 76001 ["⌜a ∩ b = b ∩ a⌝"])];
=TEX
\subsection{Proof Context: ``$'$sets$\_$ext1''}
=SML
set_pc "'sets_ext1";
store_mt_results (mt_runf (op =$)) [("proof context 'sets_ext1 a",
	concl o lprove_rule,
	⌜a = b ⇒ {v | a} = {w | b}⌝,
	⌜a = b ⇒ {v | a} = {w | b}⌝)];
store_mt_results mt_run_fail [("proof context 'sets_ext1 does not apply a",
	lprove_rule,
	⌜a ⇔ a⌝,
	gen_fail_msg "lprove_rule" 76001 ["⌜a ⇔ a⌝"]),
	("proof context 'sets_ext1 does not apply b",
	lprove_rule,
	⌜a ∩ b = b ∩ a⌝,
	gen_fail_msg "lprove_rule" 76001 ["⌜a ∩ b = b ∩ a⌝"])];
=TEX
\subsection{Proof Contexts: ``sets$\_$ext''}
=SML
open_theory "sets";
set_pc "sets_ext";
store_mt_results (mt_runf (op =$)) [("proof context sets_ext a",
	concl o lprove_rule,
	⌜a = b ⇒ {v | a} = {w | b}⌝,
	⌜a = b ⇒ {v | a} = {w | b}⌝),
	("proof context sets_ext b",
	concl o lprove_rule,
	⌜a ∩ b = b ∩ a⌝,
	⌜a ∩ b = b ∩ a⌝),
	("proof context sets_ext c",
	concl o lprove_rule,
	⌜a ⊖ b = b ⊖ a⌝,
	⌜a ⊖ b = b ⊖ a⌝)];
store_mt_results mt_run_fail [("proof context sets_ext does not apply a",
	lprove_rule,
	⌜CombK T F⌝,
	gen_fail_msg "lprove_rule" 76001 ["⌜CombK T F⌝"]),
	("proof context sets_ext does not apply b",
	lprove_rule,
	⌜((a, b) = (c, d)) ⇒ a = c⌝,
	gen_fail_msg "lprove_rule" 76001 ["⌜(a, b) = (c, d) ⇒ a = c⌝"])];
=TEX
\subsection{Proof Contexts: ``sets$\_$ext1''}
=SML
set_pc "sets_ext1";
store_mt_results (mt_runf (op =$)) [("proof context sets_ext1 a",
	concl o lprove_rule,
	⌜{(x, y)|(x, y) ∈ r} = r⌝,
	⌜{(x, y)|(x, y) ∈ r} = r⌝),
	("proof context sets_ext1 b ",
	concl o lprove_rule,
	⌜{(x, y)|(x, y) ∈ r} ⊆ r⌝,
	⌜{(x, y)|(x, y) ∈ r} ⊆ r⌝),
	("proof context sets_ext1 c ",
	concl o lprove_rule,
	⌜¬{(x, y)|(x, y) ∈ r} ⊂ r⌝,
	⌜¬{(x, y)|(x, y) ∈ r} ⊂ r⌝)
	];
store_mt_results mt_run_fail [("proof context sets_ext1 does not apply a",
	lprove_rule,
	⌜CombK T F⌝,
	gen_fail_msg "lprove_rule" 76001 ["⌜CombK T F⌝"])];
=TEX
\subsection{Proof Context: ``hol''}
=SML
open_theory "hol";
set_pc "hol";
store_mt_results (mt_runf (op =$)) [("proof context hol",
	concl o lprove_rule,
	⌜(x ∈ a ∩ b) ⇔ (x ∈ b ∩ a)⌝,
	⌜(x ∈ a ∩ b) ⇔ (x ∈ b ∩ a)⌝)];
store_mt_results mt_run_fail [("proof context hol does not apply",
	lprove_rule,
	⌜a ∩ b = b ∩ a⌝,
	gen_fail_msg "lprove_rule" 76001 ["⌜a ∩ b = b ∩ a⌝"])];
=TEX
\subsection{Proof Context: ``hol1''}
=SML
open_theory "hol";
set_pc "hol1";
store_mt_results (mt_runf (op =$)) [("proof context hol1 a",
	concl o lprove_rule,
	⌜a ∩ b = b ∩ a⌝,
	⌜a ∩ b = b ∩ a⌝),
	("proof context hol1 b",
	concl o lprove_rule,
	⌜a ⊖ b = b ⊖ a⌝,
	⌜a ⊖ b = b ⊖ a⌝)];
store_mt_results mt_run_fail [("proof context hol1 does not apply",
	lprove_rule,
	⌜F⌝,
	gen_fail_msg "lprove_rule" 76001 ["⌜F⌝"])];
=TEX
\subsection{Proof Context: ``hol1''}
=SML
set_pc "hol2";
store_mt_results (mt_runf (op =$)) [("proof context hol2",
	concl o lprove_rule,
	⌜¬{(x, y)|(x, y) ∈ r} ⊂ r⌝,
	⌜¬{(x, y)|(x, y) ∈ r} ⊂ r⌝)];
store_mt_results mt_run_fail [("proof context hol2 does not apply",
	lprove_rule,
	⌜F⌝,
	gen_fail_msg "lprove_rule" 76001 ["⌜F⌝"])];

=TEX
=IGN
SPARE SPARE SPARE SPARE SPARE SPARE SPARE SPARE SPARE
\subsection{Proof Context: ``''}
 =SML
set_pc "";
store_mt_results (mt_runf (op =$)) [("proof context ",
	concl o lprove_rule,
	⌜⌝,
	⌜⌝)];
store_mt_results mt_run_fail [("proof context  does not apply",
	lprove_rule,
	⌜⌝,
	gen_fail_msg "lprove_rule" 76001 ["⌜⌝"])];
=TEX
\subsection{End of Tests}
=SML
diag_string(summarize_mt_results());
=TEX
\end{document}




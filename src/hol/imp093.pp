=IGN
********************************************************************************
imp093.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% imp093.doc   ℤ $Date: 2005/05/31 16:43:13 $ $Revision: 1.11 $ $RCSfile: imp093.doc,v $
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

\def\Title{Theory of Integers}

\def\AbstractText{This document contains the implementation of the Z Library Numbers and Finiteness and their proof support.}

\def\Reference{DS/FMU/IED/IMP093}

\def\Author{R.D. Arthan, A.C. Hayward}


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
%% LaTeX2e port: % TQtemplate.tex
%% LaTeX2e port: \documentstyle[hol1,11pt,TQ]{article}
%% LaTeX2e port: \ftlinepenalty=9999
\def\Hide#1{}
%% LaTeX2e port: \def\Bool{``$\it{:}bool\,$''}
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{FST PROJECT}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Theory of Integers}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP093}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.11 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2005/05/31 16:43:13 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthors{R.D.~Arthan & WIN01\\A.C.~Hayward & WIN01}
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document contains the implementation of
%% LaTeX2e port: the Z Library Numbers and Finiteness and their proof support.}
%% LaTeX2e port: %\TPPabstractB{}
%% LaTeX2e port: %\TPPabstractC{}
%% LaTeX2e port: %\TPPabstractD{}
%% LaTeX2e port: %\TPPabstractE{}
%% LaTeX2e port: %\TPPabstractF{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port:       Library}}
%% LaTeX2e port: 
%% LaTeX2e port: %\TPPclass{CLASSIFICATION}
%% LaTeX2e port: %\def\TPPheadlhs{}
%% LaTeX2e port: %\def\TPPheadcentre{}
%% LaTeX2e port: %def\TPPheadrhs{}
%% LaTeX2e port: %\def\TPPfootlhs{}
%% LaTeX2e port: %\def\TPPfootcentre{}
%% LaTeX2e port: %\def\TPPfootrhs{}
%% LaTeX2e port: 
%% LaTeX2e port: \begin{document}
%% LaTeX2e port: \TPPsetsizes
%% LaTeX2e port: \makeTPPfrontpage
%% LaTeX2e port: 
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

\newpage
\section{DOCUMENT CONTROL}
\subsection{Contents List}
\tableofcontents
\subsection{Document Cross References}
\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes History}  % to get section number `0.3'
\begin{description}

\item[Issue 1.1 (1993/03/26)] Initial Draft.
\item[Issue 1.4 (1993/04/30)] Minor changes for v1.5 of the DTD.
\item[Issue 1.5 (1993/09/01)] Parent now ``sets'' not ``hol''.
\item[Issue 1.6 (1999/02/12)] Update for SML'97.
\item[Issue 1.7 (1999/03/07)] Update for new INTEGER type.
\item[Issue 1.8 (2000/12/04)] New induction tactics to help with the real numbers.
\item[Issue 1.9 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.10 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.11 (2005/05/31)] ML organisation now allows for theorems to be added in IMP105.
\item[Issue 1.12 (2008/04/13)] Fixed rogue error message.
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
This document contains the implementation
of the Z Library numbers and finiteness, meeting the detailed design
given in \cite{DS/FMU/IED/DTD093}.
\subsection{Introduction}
\subsection{Purpose and Background}
See \cite{DS/FMU/IED/DTD093}.
\subsection{Dependencies}

\subsection{Interface}
The interface for the structure is defined by the signature $ℤ$
(see\cite{DS/FMU/IED/DTD093}).

\subsection{Possible Enhancements}
None known.

\subsection{Deficiencies}
None known.

\section{PROLOGUE}
The structure is split into several pieces to make it small enough for
the Poly/ML compiler. The signature constraint is placed on the
final structure in IMP105.

The structure wrapping is omitted during initial development:
=SML
structure ⦏ℤ⦎ = struct
=TEX
=SML
	val dummy = open_theory "ℤ";
=TEX
\section{ML BINDINGS}
=TEX
Get the definitions:
=SML
	val ⦏Is_ℤ_Rep_def⦎ = get_spec ⌜Is_ℤ_Rep⌝;
	val ⦏ℤ_ℕℤ_def⦎ = get_spec ⌜ℕℤ⌝;
	val ⦏ℤ_minus_def⦎ = get_spec ⌜$~⋎Z⌝;
	val ⦏ℤ_plus_def⦎ = get_spec ⌜$+⋎Z⌝;
	val ⦏ℤ_subtract_def⦎ = get_spec ⌜$-⋎Z⌝;
	val ⦏ℤ_times_def⦎ = get_spec ⌜$*⋎Z⌝;
	val ⦏ℤ_≤_def⦎ = get_spec ⌜$≤⋎Z⌝;
	val ⦏ℤ_less_def⦎ = get_spec ⌜$<⋎Z⌝;
	val ⦏ℤ_≥_def⦎ = get_spec ⌜$≥⋎Z⌝;
	val ⦏ℤ_greater_def⦎ = get_spec ⌜$>⋎Z⌝;
	val ⦏ℤ_abs_def⦎ = get_spec ⌜$Abs⋎Z⌝;
	val ⦏ℤ_mod_def⦎ = get_spec ⌜$Mod⋎Z⌝;
	val ⦏ℤ_div_def⦎ = get_spec ⌜$Div⋎Z⌝;
=TEX
\section{THEOREMS}
=SML
=SML
val _ = set_merge_pcs["'sets_alg", "basic_hol"];
=TEX
=SML
val _ = declare_infix(300, "plus");
val _ = declare_prefix(350, "neg");
=TEX
=SML
val ⦏ℤ_add_ops_exist_thm⦎ = (
set_goal([], ⌜∃$plus: ℤ → ℤ → ℤ; $neg: ℤ → ℤ; iota: ℕ → ℤ⦁
	(∀i j k:ℤ⦁
		(i plus j) plus k = i plus (j plus k)
	∧	i plus j = j plus i
	∧	i plus neg i = iota 0
	∧	i plus iota 0 = i)
∧	(∀m n⦁ iota m plus iota n = iota(m + n))
∧	OneOne iota
∧	(∀i⦁∃m⦁ i = iota m ∨ i = neg iota m)⌝);
a (strip_asm_tac (simple_⇒_match_mp_rule type_lemmas_thm ℤ_def));
a(LEMMA_T⌜∀i⦁Is_ℤ_Rep (rep i)⌝ (strip_asm_tac o rewrite_rule[get_spec⌜Is_ℤ_Rep⌝])
	THEN1 asm_rewrite_tac[]);
a(∃_tac⌜λi j⦁	abs { (x, y) | ∃m1 n1 m2 n2 ⦁
	(m1, n1) ∈ rep i ∧ (m2, n2) ∈ rep j ∧ m1 + m2 + y = n1 + n2 + x }⌝);
a(∃_tac⌜λi⦁ abs { (x, y) | (y, x) ∈ rep i }⌝);
a(∃_tac⌜λm⦁ abs { (x, y) | ∃k⦁x = m + y }⌝ THEN rewrite_tac[] THEN REPEAT strip_tac);
(* *** Goal "1" (Associativity) *** *)
a(bc_tac[prove_rule[]⌜∀f x y⦁x = y ⇒ f x = f y⌝]);
a(spec_nth_asm_tac 1 ⌜i⌝ THEN POP_ASM_T rewrite_thm_tac);
a(spec_nth_asm_tac 1 ⌜j⌝ THEN POP_ASM_T rewrite_thm_tac);
a(spec_nth_asm_tac 1 ⌜k⌝ THEN POP_ASM_T rewrite_thm_tac);
a(LEMMA_T ⌜∀a b c d⦁Is_ℤ_Rep {(x, y) | ∃ m1 n1 m2 n2 ⦁
		a + n1 = b + m1
	∧	c + n2 = d + m2
	∧	m1 + m2 + y = n1 + n2 + x}⌝ ante_tac);
(* *** Goal "1.1" *** *)
a(rewrite_tac[get_spec⌜Is_ℤ_Rep⌝]);
a(REPEAT strip_tac);
a(∃_tac⌜a + c⌝ THEN ∃_tac⌜b + d⌝ THEN PC_T1 "sets_ext1" REPEAT strip_tac);
(* *** Goal "1.1.1" *** *)
a(PC_T1 "lin_arith" asm_prove_tac[]);
(* *** Goal "1.1.2" *** *)
a(∃_tac⌜a⌝ THEN ∃_tac⌜b⌝  THEN ∃_tac⌜c⌝  THEN ∃_tac⌜d⌝);
a(PC_T1 "lin_arith" asm_prove_tac[]);
(* *** Goal "1.2" *** *)
a(asm_rewrite_tac[] THEN STRIP_T rewrite_thm_tac);
a(rename_tac[] THEN PC_T1 "sets_ext1" REPEAT strip_tac);
(* *** Goal "1.2.1" *** *)
a(∃_tac⌜m⌝ THEN ∃_tac⌜n⌝ THEN PC_T1 "lin_arith" rewrite_tac[]);
a(∃_tac⌜m'+m2⌝ THEN ∃_tac⌜n'+n2⌝ THEN PC_T1 "lin_arith" rewrite_tac[]);
a(strip_tac THEN_LIST [id_tac,  PC_T1 "lin_arith" asm_prove_tac[]]);
a(∃_tac⌜m'⌝ THEN ∃_tac⌜n'⌝  THEN ∃_tac⌜m''⌝ THEN ∃_tac⌜n''⌝
	THEN PC_T1 "lin_arith" asm_prove_tac[]);
(* *** Goal "1.2.2" *** *)
a(∃_tac⌜m+m1'⌝ THEN ∃_tac⌜n+n1'⌝ THEN PC_T1 "lin_arith" rewrite_tac[]);
a(∃_tac⌜m''⌝ THEN ∃_tac⌜n''⌝ THEN PC_T1 "lin_arith" rewrite_tac[]);
a(strip_tac THEN_LIST [id_tac,  PC_T1 "lin_arith" asm_prove_tac[]]);
a(∃_tac⌜m⌝ THEN ∃_tac⌜n⌝  THEN ∃_tac⌜m'⌝ THEN ∃_tac⌜n'⌝
	THEN PC_T1 "lin_arith" asm_prove_tac[]);
(* *** Goal "2" (Commutativity) *** *)
a(bc_tac[prove_rule[]⌜∀f x y⦁x = y ⇒ f x = f y⌝]);
a(PC_T1 "sets_ext1" REPEAT strip_tac);
(* *** Goal "2.1" (duplicates "2.2") *** *)
a(∃_tac⌜m2⌝ THEN ∃_tac⌜n2⌝ THEN ∃_tac⌜m1⌝  THEN ∃_tac⌜n1⌝
	THEN REPEAT strip_tac);
a(PC_T1 "lin_arith" asm_prove_tac[]);
(* *** Goal "3" (inverse) *** *)
a(bc_tac[prove_rule[]⌜∀f x y⦁x = y ⇒ f x = f y⌝]);
a(spec_nth_asm_tac 1 ⌜i⌝ THEN POP_ASM_T rewrite_thm_tac);
a(LEMMA_T ⌜∀a b⦁Is_ℤ_Rep { (x, y) | a + x = b + y }⌝ ante_tac);
(* *** Goal "3.1" *** *)
a(rewrite_tac[get_spec⌜Is_ℤ_Rep⌝]);
a(REPEAT strip_tac);
a(∃_tac⌜b⌝ THEN ∃_tac⌜a⌝);
a(conv_tac (LEFT_C (ONCE_MAP_C eq_sym_conv)) THEN strip_tac);
(* *** Goal "3.2" *** *)
a(asm_rewrite_tac[] THEN STRIP_T rewrite_thm_tac);
a(PC_T1 "sets_ext1" REPEAT strip_tac);
(* *** Goal "3.2.1" *** *)
a(PC_T1 "lin_arith" asm_prove_tac[]);
(* *** Goal "3.2.2" *** *)
a(∃_tac⌜m⌝ THEN ∃_tac⌜n⌝ THEN ∃_tac⌜n⌝  THEN ∃_tac⌜m⌝
	THEN PC_T1 "lin_arith" asm_rewrite_tac[]);
(* *** Goal "4" (zero property) *** *)
a(LEMMA_T ⌜{(x, y) |∃ m1 n1 m2 n2 ⦁
		(m1, n1) ∈ rep i
	∧ (m2, n2) ∈ rep (abs {(x, y)|x = y})
	∧ m1 + m2 + y = n1 + n2 + x} = rep i⌝ asm_rewrite_thm_tac);
a(spec_nth_asm_tac 1 ⌜i⌝ THEN POP_ASM_T rewrite_thm_tac);
a(LEMMA_T ⌜∀a b⦁Is_ℤ_Rep { (x, y) | x = y }⌝ ante_tac);
(* *** Goal "4.1" *** *)
a(rewrite_tac[get_spec⌜Is_ℤ_Rep⌝]);
a(REPEAT strip_tac);
a(∃_tac⌜0⌝ THEN ∃_tac⌜0⌝ THEN MERGE_PCS_T1 ["sets_ext1", "basic_hol1"] REPEAT strip_tac
	THEN asm_rewrite_tac[]);
(* *** Goal "4.2" *** *)
a(asm_rewrite_tac[] THEN STRIP_T rewrite_thm_tac);
a(PC_T1 "sets_ext1" REPEAT strip_tac);
(* *** Goal "4.2.1" *** *)
a(PC_T1 "lin_arith" asm_prove_tac[]);
(* *** Goal "4.2.2" *** *)
a(∃_tac⌜m⌝ THEN ∃_tac⌜n⌝ THEN ∃_tac⌜0⌝  THEN ∃_tac⌜0⌝
	THEN asm_rewrite_tac[]);
(* *** Goal "5" (iota is a monoid homomorphism) *** *)
a(LEMMA_T ⌜∀a⦁Is_ℤ_Rep { (x, y) | x = a + y }⌝ ante_tac);
(* *** Goal "5.1" *** *)
a(rewrite_tac[get_spec⌜Is_ℤ_Rep⌝]);
a(REPEAT strip_tac);
a(∃_tac⌜a⌝ THEN ∃_tac⌜0⌝ THEN PC_T1 "sets_ext1" REPEAT strip_tac
	THEN PC_T1 "lin_arith" asm_prove_tac[]);
(* *** Goal "5.2" *** *)
a(asm_rewrite_tac[] THEN STRIP_T rewrite_thm_tac);
a(bc_tac[prove_rule[]⌜∀f x y⦁x = y ⇒ f x = f y⌝]);
a(PC_T1 "sets_ext1" REPEAT strip_tac);
(* *** Goal "5.2.1" *** *)
a(PC_T1"lin_arith" asm_prove_tac[]);
(* *** Goal "5.2.2" *** *)
a(∃_tac⌜m⌝ THEN ∃_tac⌜0⌝ THEN ∃_tac⌜n⌝  THEN ∃_tac⌜0⌝
	THEN PC_T1"lin_arith" asm_prove_tac[]);
(* *** Goal "6" (iota is 1-1) *** *)
a(rewrite_tac[get_spec⌜OneOne⌝] THEN REPEAT strip_tac);
a(LEMMA_T ⌜rep(abs{(x, y)|x = x1 + y}) = rep(abs{(x, y)|x = x2 + y})⌝
	ante_tac THEN1 asm_rewrite_tac[]);
a(LEMMA_T ⌜∀a⦁Is_ℤ_Rep { (x, y) | x = a + y }⌝ ante_tac);
(* *** Goal "6.1" *** *)
a(rewrite_tac[get_spec⌜Is_ℤ_Rep⌝]);
a(REPEAT strip_tac);
a(∃_tac⌜a⌝ THEN ∃_tac⌜0⌝ THEN PC_T1 "sets_ext1" REPEAT strip_tac
	THEN PC_T1 "lin_arith" asm_prove_tac[]);
(* *** Goal "6.2" *** *)
a(GET_NTH_ASM_T 3 rewrite_thm_tac THEN STRIP_T rewrite_thm_tac);
a(PC_T1 "sets_ext1" REPEAT strip_tac);
a(list_spec_nth_asm_tac 1 [⌜x1⌝, ⌜0⌝]);
a(asm_rewrite_tac[]);
(* *** Goal "7" *** *)
a(spec_nth_asm_tac 1 ⌜i⌝);
a(strip_asm_tac(rewrite_rule[get_spec⌜1 ≤ 2⌝]
	(list_∀_elim[⌜m⌝, ⌜n⌝] ≤_cases_thm)));
(* *** Goal "7.1" *** *)
a(∃_tac⌜i'⌝ THEN ∨_right_tac);
a(LEMMA_T ⌜∀a⦁Is_ℤ_Rep { (x, y) | x = a + y }⌝ ante_tac);
(* *** Goal "7.1.1" *** *)
a(rewrite_tac[get_spec⌜Is_ℤ_Rep⌝]);
a(REPEAT strip_tac);
a(∃_tac⌜a⌝ THEN ∃_tac⌜0⌝ THEN PC_T1 "sets_ext1" REPEAT strip_tac
	THEN PC_T1 "lin_arith" asm_prove_tac[]);
(* *** Goal "7.1.2" *** *)
a(GET_NTH_ASM_T 4 rewrite_thm_tac THEN STRIP_T rewrite_thm_tac);
a(LEMMA_T⌜abs(rep i) = abs{(x, y)|m + y = n + x}⌝ ante_tac
	THEN1 GET_NTH_ASM_T 2 rewrite_thm_tac);
a(GET_NTH_ASM_T 5 rewrite_thm_tac);
a(STRIP_T rewrite_thm_tac);
a(bc_tac[prove_rule[]⌜∀f x y⦁x = y ⇒ f x = f y⌝]);
a(POP_ASM_T (rewrite_thm_tac o eq_sym_rule));
a(PC_T1 "lin_arith" rewrite_tac[]);
(* *** Goal "7.2" *** *)
a(∃_tac⌜i'⌝ THEN ∨_left_tac);
a(LEMMA_T⌜abs(rep i) = abs{(x, y)|m + y = n + x}⌝ ante_tac
	THEN1 GET_NTH_ASM_T 2 rewrite_thm_tac);
a(GET_NTH_ASM_T 5 rewrite_thm_tac);
a(STRIP_T rewrite_thm_tac);
a(bc_tac[prove_rule[]⌜∀f x y⦁x = y ⇒ f x = f y⌝]);
a(POP_ASM_T (rewrite_thm_tac o eq_sym_rule));
a(PC_T1 "lin_arith" rewrite_tac[]);
a(conv_tac (LEFT_C(ONCE_MAP_C eq_sym_conv)) THEN strip_tac);
pop_thm()
);
=TEX
=SML
val _ = declare_nonfix"plus";
val _ = declare_nonfix"neg";
=TEX
=SML
val _ = (
push_consistency_goal ⌜$+⋎Z⌝;
a(strip_asm_tac ℤ_add_ops_exist_thm);
a(∃_tac⌜($plus, $neg, $iota)⌝);
a(all_asm_ante_tac THEN taut_tac);
save_consistency_thm ⌜$+⋎Z⌝ (pop_thm())
);
=TEX
=SML
val ⦏ℤ_plus_comm_thm⦎ = (
set_goal([], ⌜∀ i j : ℤ ⦁ i + j = j + i⌝);
a(REPEAT strip_tac);
a(conv_tac(LEFT_C (once_rewrite_conv[get_spec⌜ℕℤ⌝])) THEN rewrite_tac[]);
save_pop_thm"ℤ_plus_comm_thm"
);
=TEX
=SML
val ⦏ℤ_plus_assoc_thm⦎ = (
set_goal([], ⌜∀ i j k : ℤ ⦁ (i + j) + k = i + j + k⌝);
a(REPEAT strip_tac);
a(conv_tac(LEFT_C (once_rewrite_conv[get_spec⌜ℕℤ⌝])) THEN rewrite_tac[]);
save_pop_thm"ℤ_plus_assoc_thm"
);
=TEX
=SML
val ⦏ℤ_plus_assoc_thm1⦎ = (
set_goal([], ⌜∀ i j k: ℤ ⦁ i + j + k = (i + j) + k⌝);
a(rewrite_tac[ℤ_plus_assoc_thm]);
save_pop_thm"ℤ_plus_assoc_thm1"
);
=TEX
=SML
val ⦏ℤ_plus_order_thm⦎ = (
set_goal([], ⌜∀ i j k : ℤ ⦁ j + i = i + j
		∧ (i + j) + k = i + j + k
		∧ j + i + k = i + j + k⌝);
a(rewrite_tac[ℤ_plus_assoc_thm]);
a(rewrite_tac[∀_elim⌜i:ℤ⌝ℤ_plus_comm_thm]);
a(rewrite_tac[ℤ_plus_assoc_thm]);
save_pop_thm"ℤ_plus_order_thm"
);
=TEX
=SML
val ⦏ℤ_cases_thm⦎ = (
set_goal([], ⌜∀ i : ℤ ⦁ ∃ m : ℕ ⦁ i = ℕℤ m ∨ i = ~(ℕℤ m)⌝);
a(accept_tac(nth 3 (strip_∧_rule (get_spec⌜ℕℤ⌝))));
save_pop_thm"ℤ_cases_thm"
);
=TEX
=SML
val ⦏ℤ_plus0_thm⦎ = (
set_goal([], ⌜∀ i : ℤ ⦁ i + (ℕℤ 0) = i ∧ (ℕℤ 0) + i = i⌝);
a(∀_tac);
a(rewrite_tac[∀_elim⌜ℕℤ 0⌝ ℤ_plus_comm_thm]);
a(rewrite_tac[get_spec⌜ℕℤ⌝]);
save_pop_thm"ℤ_plus0_thm"
);
=TEX
=SML
val ⦏ℤ_plus_minus_thm⦎ = (
set_goal([], ⌜∀ i : ℤ ⦁ i + ~ i = ℕℤ 0 ∧ ~i + i = ℕℤ 0⌝);
a(∀_tac);
a(rewrite_tac[∀_elim⌜~i⌝ ℤ_plus_comm_thm]);
a(rewrite_tac[get_spec⌜ℕℤ⌝]);
save_pop_thm"ℤ_plus_minus_thm"
);
=TEX
=SML
val ⦏ℤ_eq_thm⦎ = (
set_goal([], ⌜∀ i j : ℤ ⦁ i = j ⇔ i + ~j = ℕℤ 0⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(asm_rewrite_tac[ℤ_plus_minus_thm]);
(* *** Goal "2" *** *)
a(LEMMA_T ⌜(i + ~ j) + j = ℕℤ 0 + j⌝ ante_tac THEN1 asm_rewrite_tac[]);
a(rewrite_tac[ℤ_plus_assoc_thm, ℤ_plus_minus_thm, ℤ_plus0_thm]);
save_pop_thm"ℤ_eq_thm"
);
=TEX
=SML
val ⦏ℕℤ_plus_homomorphism_thm⦎ = (
set_goal([], ⌜∀ m n : ℕ ⦁ ℕℤ(m + n) = ℕℤ m + ℕℤ n⌝);
a(REPEAT strip_tac);
a(conv_tac(RIGHT_C (once_rewrite_conv[get_spec⌜ℕℤ⌝])));
a(strip_tac);
save_pop_thm"ℕℤ_plus_homomorphism_thm"
);
=TEX
=SML
val ⦏ℤ_minus_clauses⦎ = (
set_goal([], ⌜∀i j: ℤ⦁
		~ (~ i) = i
	∧	i + ~ i = ℕℤ 0
	∧	~ i + i = ℕℤ 0
	∧	~ (i + j) = ~ i + ~ j
	∧ 	~(ℕℤ 0) = (ℕℤ 0)⌝);
a(REPEAT ∀_tac);
a(rewrite_tac[ℤ_plus_minus_thm]);
a(lemma_tac⌜∀i:ℤ⦁~(~ i) = i⌝);
(* *** Goal "1" *** *)
a(strip_tac THEN once_rewrite_tac[ℤ_eq_thm]);
a(once_rewrite_tac[ℤ_plus_comm_thm]);
a(rewrite_tac[ℤ_plus_minus_thm]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[] THEN strip_tac);
(* *** Goal "2.1" *** *)
a(conv_tac eq_sym_conv THEN once_rewrite_tac[ℤ_eq_thm]);
a(asm_rewrite_tac[∀_elim⌜~ j⌝ℤ_plus_order_thm]);
a(rewrite_tac[∀_elim⌜j⌝ℤ_plus_order_thm, ℤ_plus_minus_thm, ℤ_plus0_thm]);
(* *** Goal "2.2" *** *)
a(conv_tac eq_sym_conv THEN once_rewrite_tac[ℤ_eq_thm]);
a(asm_rewrite_tac[ℤ_plus0_thm]);
save_pop_thm"ℤ_minus_clauses"
);
=TEX
=SML
val ⦏ℤ_cases_thm1⦎ = (
set_goal([], ⌜∀ i : ℤ ⦁ ∃ m : ℕ ⦁ i = ℕℤ m ∨ i = ~(ℕℤ (m + 1))⌝);
a(strip_tac);
a(strip_asm_tac(∀_elim⌜i⌝ ℤ_cases_thm));
(* *** Goal "1" *** *)
a(∃_tac⌜m⌝ THEN asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(strip_asm_tac(∀_elim⌜m⌝ℕ_cases_thm));
(* *** Goal "2.1" *** *)
a(∃_tac⌜0⌝ THEN asm_rewrite_tac[ℤ_minus_clauses]);
(* *** Goal "2.2" *** *)
a(∃_tac⌜i'⌝ THEN asm_rewrite_tac[ℕℤ_plus_homomorphism_thm, ℤ_minus_clauses]);
save_pop_thm"ℤ_cases_thm1"
);
=TEX
=SML
val ⦏ℤ_induction_thm⦎ = (
set_goal([], ⌜∀ p : ℤ → BOOL ⦁ p (ℕℤ 1)
	∧	(∀i⦁ p i ⇒ p (~ i))
	∧	(∀i j⦁ p i ∧ p j ⇒ p (i + j))
	⇒	(∀i⦁ p i) ⌝);
a(REPEAT strip_tac);
a(lemma_tac⌜∀ m⦁p (ℕℤ m) ∧ p (~(ℕℤ m))⌝);
(* *** Goal "1" *** *)
a(lemma_tac⌜p (ℕℤ 0)⌝);
(* *** Goal "1.1" *** *)
a(all_asm_fc_tac[] THEN all_asm_fc_tac[]);
a(asm_ante_tac ⌜p (ℕℤ 1 + ~ (ℕℤ 1))⌝);
a(rewrite_tac[ℤ_minus_clauses]);
(* *** Goal "1.2" *** *)
a(REPEAT strip_tac);
(* *** Goal "1.2.1" *** *)
a(induction_tac⌜m⌝ THEN1 strip_tac);
a(all_asm_fc_tac[]);
a(asm_ante_tac ⌜p (ℕℤ m + (ℕℤ 1))⌝);
a(rewrite_tac[ℕℤ_plus_homomorphism_thm]);
(* *** Goal "1.2.2" *** *)
a(induction_tac⌜m⌝ THEN asm_rewrite_tac[ℤ_minus_clauses, ℕℤ_plus_homomorphism_thm]);
a(all_asm_fc_tac[] THEN all_asm_fc_tac[]);
(* *** Goal "2" *** *)
a(strip_asm_tac(∀_elim⌜i⌝(nth 3 (strip_∧_rule (get_spec⌜ℕℤ⌝))))
	THEN asm_rewrite_tac[]);
save_pop_thm"ℤ_induction_thm"
);
=TEX
=SML
val ⦏ℕℤ_one_one_thm⦎ = (
set_goal([], ⌜∀m n:ℕ⦁ ℕℤ m = ℕℤ n ⇔ m = n⌝);
a(REPEAT strip_tac THEN_TRY asm_rewrite_tac[]);
a(all_fc_tac[rewrite_rule[one_one_def] (get_spec⌜ℕℤ⌝)]);
save_pop_thm"ℕℤ_one_one_thm"
);
=TEX
=SML
val ⦏ℤ_plus_clauses⦎ = (
set_goal([], ⌜∀ i j k : ℤ ⦁ (i + k = j + k ⇔ i = j)
	∧	(k + i = j + k ⇔ i = j)
	∧	(i + k = k + j ⇔ i = j)
	∧	(k + i = k + j ⇔ i = j)
	∧	(i + k = k ⇔ i = ℕℤ 0)
	∧	(k + i = k ⇔ i = ℕℤ 0)
	∧	(k = k + j ⇔ j = ℕℤ 0)
	∧	(k = j + k ⇔ j = ℕℤ 0)
	∧	(i + ℕℤ 0 = i)
	∧	(ℕℤ 0 + i = i)
	∧	¬ ℕℤ 1 = ℕℤ 0
	∧	¬ ℕℤ 0 = ℕℤ 1⌝);
a(REPEAT ∀_tac);
a(rewrite_tac[ℤ_plus0_thm, ℕℤ_one_one_thm, plus_clauses,
	∀_elim⌜k⌝ ℤ_plus_order_thm]);
a(once_rewrite_tac[∀_elim⌜k + i⌝ ℤ_eq_thm]);
a(once_rewrite_tac[∀_elim⌜k⌝ ℤ_eq_thm]);
a(rewrite_tac[ℤ_minus_clauses, ∀_elim⌜~ k⌝ ℤ_plus_order_thm]);
a(rewrite_tac[ℤ_plus_assoc_thm1, ℤ_minus_clauses, ℤ_plus0_thm]);
a(once_rewrite_tac[∀_elim⌜i⌝ ℤ_eq_thm]);
a(rewrite_tac[]);
a(conv_tac(LEFT_C eq_sym_conv));
a(once_rewrite_tac[∀_elim⌜ℕℤ 0⌝ ℤ_eq_thm]);
a(rewrite_tac[ℤ_minus_clauses, ℤ_plus0_thm]);
save_pop_thm"ℤ_plus_clauses"
);
=TEX
=SML
val ⦏ℤ_≤_≤_0_thm⦎ = (
set_goal([], ⌜∀ i j : ℤ ⦁ i ≤ j ⇔ i + ~j ≤ ℕℤ 0⌝);
a(REPEAT ∀_tac);
a(rewrite_tac[get_spec⌜ℕℤ 0 ≤ ℕℤ 0⌝]);
a(once_rewrite_tac[ℤ_eq_thm]);
a(rewrite_tac[ℤ_minus_clauses, ∀_elim⌜~j⌝ℤ_plus_order_thm, ℤ_plus_clauses]);
save_pop_thm"ℤ_≤_≤_0_thm"
);
=TEX
=SML
val ⦏ℤ_minus_≤_thm⦎ = (
set_goal([], ⌜∀i j:ℤ⦁ ~i ≤ ~j ⇔ j ≤ i⌝);
a(REPEAT ∀_tac);
a(rewrite_tac[get_spec⌜ℕℤ 0 ≤ ℕℤ 0⌝]);
a(once_rewrite_tac[ℤ_eq_thm]);
a(rewrite_tac[ℤ_minus_clauses, ∀_elim⌜~i⌝ℤ_plus_order_thm, ℤ_plus_clauses]);
a(rewrite_tac[∀_elim⌜ℕℤ m⌝ℤ_plus_order_thm]);
save_pop_thm"ℤ_minus_≤_thm"
);
=TEX
=SML
val ⦏ℤ_≤_minus_thm⦎ = (
set_goal([], ⌜∀i j:ℤ⦁ i ≤ j ⇔ ~j ≤ ~i⌝);
a(rewrite_tac[ℤ_minus_≤_thm]);
save_pop_thm"ℤ_≤_minus_thm"
);
=TEX
=SML
val ⦏ℤ_≤_clauses⦎ = (
set_goal([], ⌜∀i j k:ℤ⦁
		(i + k ≤ j + k ⇔ i ≤ j)
	∧	(k + i ≤ j + k ⇔ i ≤ j)
	∧	(i + k ≤ k + j ⇔ i ≤ j)
	∧	(k + i ≤ k + j ⇔ i ≤ j)
	∧	(i + k ≤ k ⇔ i ≤ ℕℤ 0)
	∧	(k + i ≤ k ⇔ i ≤ ℕℤ 0)
	∧	(k ≤ k + j ⇔ ℕℤ 0 ≤ j)
	∧	(k ≤ j + k ⇔ ℕℤ 0 ≤ j)
	∧	(i ≤ i)
	∧	¬ ℕℤ 1 ≤ ℕℤ 0
	∧	ℕℤ 0 ≤ ℕℤ 1 ⌝);
a(REPEAT ∀_tac);
a(rewrite_tac[∀_elim⌜k⌝ ℤ_plus_order_thm]);
a(once_rewrite_tac[∀_elim⌜k + i⌝ ℤ_≤_≤_0_thm]);
a(once_rewrite_tac[∀_elim⌜k⌝ ℤ_≤_≤_0_thm]);
a(rewrite_tac[ℤ_minus_clauses, ∀_elim⌜~ k⌝ ℤ_plus_order_thm]);
a(rewrite_tac[ℤ_plus_assoc_thm1, ℤ_minus_clauses, ℤ_plus0_thm]);
a(once_rewrite_tac[∀_elim⌜i⌝ ℤ_≤_≤_0_thm]);
a(once_rewrite_tac[∀_elim⌜ℕℤ 0⌝ ℤ_≤_≤_0_thm]);
a(rewrite_tac[ℤ_minus_clauses, ℤ_plus_clauses]);
a(rewrite_tac[get_spec⌜ℕℤ 0 ≤ ℕℤ 0⌝]);
a(rewrite_tac[conv_rule(ONCE_MAP_C eq_sym_conv) ℕℤ_plus_homomorphism_thm]);
a(rewrite_tac[ℤ_plus_clauses, ℕℤ_one_one_thm]);
a(conv_tac(ONCE_MAP_C prove_∃_conv));
a(REPEAT strip_tac);
a(∃_tac⌜1⌝ THEN rewrite_tac[ℤ_minus_clauses]);
save_pop_thm"ℤ_≤_clauses"
);
=TEX
=SML
val ⦏ℕℤ_≤_thm⦎ = (
set_goal([], ⌜∀ m n : ℕ ⦁ ℕℤ m ≤ ℕℤ n ⇔ m ≤ n⌝);
a(REPEAT ∀_tac);
a(rewrite_tac[get_spec⌜ℕℤ 0 ≤ ℕℤ 0⌝, get_spec⌜0 ≤ 0⌝]);
a(rewrite_tac[conv_rule(ONCE_MAP_C eq_sym_conv) ℕℤ_plus_homomorphism_thm]);
a(rewrite_tac[ℕℤ_one_one_thm]);
save_pop_thm"ℕℤ_≤_thm"
);
=TEX
=SML
val ⦏ℤ_induction_tac⦎ = gen_induction_tac ℤ_induction_thm;
=TEX
=SML
val ⦏ℤ_times_consistent_thm⦎ = (
set_goal([], ⌜∀i: ℤ⦁∃f: ℤ → ℤ⦁
		f (ℕℤ 1) = i
	∧	∀j k⦁f(j + k) = f j + f k⌝);
a(strip_tac);
a(ℤ_induction_tac ⌜i⌝);
(* *** Goal "1" *** *)
a(∃_tac⌜λj⦁j⌝ THEN rewrite_tac[]);
(* *** Goal "2" *** *)
a(∃_tac⌜λj⦁~(f j)⌝ THEN asm_rewrite_tac[ℤ_minus_clauses]);
(* *** Goal "3" *** *)
a(∃_tac⌜λj⦁(f j) + (f' j)⌝ THEN asm_rewrite_tac[]);
a(REPEAT strip_tac);
a(rewrite_tac[∀_elim⌜f' j'⌝ℤ_plus_order_thm]);
a(rewrite_tac[∀_elim⌜f j'⌝ℤ_plus_order_thm]);
pop_thm()
);
=TEX
=SML
val _ = (
push_consistency_goal ⌜$*⋎Z⌝;
a(prove_∃_tac);
a(strip_tac);
a(strip_asm_tac(∀_elim ⌜i'⌝ ℤ_times_consistent_thm));
a(∃_tac⌜f⌝ THEN asm_rewrite_tac[]);
save_consistency_thm ⌜$*⋎Z⌝ (pop_thm())
);
=TEX
=SML
val ⦏ℤ_times_0_thm1⦎ = (
set_goal([], ⌜∀i:ℤ⦁ i * ℕℤ 0 = ℕℤ 0⌝);
a(accept_tac(
	all_∀_intro
	(rewrite_rule[ℤ_plus_clauses, ℤ_plus0_thm](prove_rule[get_spec⌜$*⋎Z⌝]
	⌜i*(ℕℤ 0 + ℕℤ 0) = i * ℕℤ 0 + i * ℕℤ 0⌝))));
pop_thm()
);
=TEX
=SML
val ⦏ℕℤ_times_homomorphism_thm⦎ = (
set_goal([], ⌜∀ m n : ℕ ⦁ ℕℤ(m * n) = ℕℤ m * ℕℤ n⌝);
a(REPEAT strip_tac);
a(induction_tac⌜n⌝);
(* *** Goal "1" *** *)
a(rewrite_tac[times_clauses, ℤ_times_0_thm1]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[times_plus_distrib_thm, get_spec⌜$*⋎Z⌝, ℕℤ_plus_homomorphism_thm]);
save_pop_thm"ℕℤ_times_homomorphism_thm"
);
=TEX
=SML
val ⦏ℤ_times_minus_thm1⦎ = (
set_goal([], ⌜∀i j:ℤ⦁ i * ~ j = ~(i * j)⌝);
a(REPEAT strip_tac);
a(lemma_tac ⌜i * ~ j + i * j = ℕℤ 0⌝);
(* *** Goal "1" *** *)
a(LEMMA_T ⌜i * ~ j + i * j = i * (~j + j)⌝ rewrite_thm_tac
	THEN1 rewrite_tac[get_spec⌜$*⋎Z⌝]);
a(rewrite_tac[ℤ_minus_clauses, ℤ_times_0_thm1]);
(* *** Goal "2" *** *)
a(once_rewrite_tac[ℤ_eq_thm]);
a(asm_rewrite_tac[ℤ_minus_clauses]);
pop_thm()
);
=TEX
=SML
val ⦏ℤ_times_minus_thm2⦎ = (
set_goal([], ⌜∀i j:ℤ⦁ ~ i * j = ~(i * j)⌝);
a(REPEAT strip_tac);
a(ℤ_induction_tac⌜j⌝ THEN
	asm_rewrite_tac[get_spec⌜$*⋎Z⌝, ℤ_times_minus_thm1, ℤ_minus_clauses]);
pop_thm()
);
=TEX
=SML
val ⦏ℤ_times_minus_thm⦎ = (
set_goal([], ⌜∀ i j : ℤ ⦁
		~ i * j = ~(i * j)
	∧	i * ~ j = ~(i * j)
	∧	~ i * ~ j = i * j⌝);
a(rewrite_tac[ℤ_times_minus_thm1, ℤ_times_minus_thm2, ℤ_minus_clauses]);
save_pop_thm"ℤ_times_minus_thm"
);
=TEX
=SML
val ⦏ℤ_times_comm_thm⦎ = (
set_goal([], ⌜∀ i j : ℤ ⦁ i * j = j * i⌝);
a(lemma_tac⌜∀a b:ℕ⦁ℕℤ a * ℕℤ b = ℕℤ b * ℕℤ a⌝);
(* *** Goal "1" *** *)
a(rewrite_tac[conv_rule(ONCE_MAP_C eq_sym_conv) ℕℤ_times_homomorphism_thm,
	∀_elim⌜a:ℕ⌝times_comm_thm]);
(* *** Goal "2" *** *)
a(REPEAT strip_tac);
a(strip_asm_tac(∀_elim⌜i⌝ ℤ_cases_thm) THEN strip_asm_tac(∀_elim⌜j⌝ ℤ_cases_thm)
	THEN POP_ASM_T rewrite_thm_tac THEN POP_ASM_T rewrite_thm_tac);
(* *** Goal "2.1" *** *)
a(POP_ASM_T (rewrite_thm_tac o ∀_elim ⌜m⌝));
(* *** Goal "2.2" *** *)
a(rewrite_tac[ℤ_times_minus_thm] THEN POP_ASM_T (rewrite_thm_tac o ∀_elim ⌜m⌝));
(* *** Goal "2.3" *** *)
a(rewrite_tac[ℤ_times_minus_thm] THEN POP_ASM_T (rewrite_thm_tac o ∀_elim ⌜m⌝));
(* *** Goal "2.4" *** *)
a(rewrite_tac[ℤ_times_minus_thm] THEN POP_ASM_T (rewrite_thm_tac o ∀_elim ⌜m⌝));
save_pop_thm"ℤ_times_comm_thm"
);
=TEX
=SML
val ⦏ℤ_times_assoc_thm⦎ = (
set_goal([], ⌜∀ i j k : ℤ ⦁ (i * j) * k  = i * (j * k)⌝);
a(REPEAT strip_tac);
a(ℤ_induction_tac ⌜k⌝
	THEN asm_rewrite_tac[ℤ_times_minus_thm, get_spec⌜$*⋎Z⌝]);
save_pop_thm"ℤ_times_assoc_thm"
);
=TEX
=TEX
=SML
val ⦏ℤ_div_lemma1⦎ = (
set_goal([], ⌜∀i:ℤ; n:ℕ⦁ 0 < n ⇒ ∃d⦁d * (ℕℤ n) ≤ i ∧ i < (d + ℕℤ 1) * ℕℤ n⌝);
a(REPEAT strip_tac);
a(strip_asm_tac(∀_elim⌜i⌝ ℤ_cases_thm1));
(* *** Goal "1" *** *)
a(∃_tac⌜ℕℤ (m Div n)⌝ THEN POP_ASM_T rewrite_thm_tac);
a(rewrite_tac[conv_rule(ONCE_MAP_C eq_sym_conv) ℕℤ_times_homomorphism_thm,
	conv_rule(ONCE_MAP_C eq_sym_conv) ℕℤ_plus_homomorphism_thm,
	ℕℤ_one_one_thm,
	ℕℤ_≤_thm, get_spec⌜$<⋎Z⌝]);
a(strip_asm_tac(list_∀_elim[⌜m⌝, ⌜n⌝] div_mod_thm));
a(strip_asm_tac(list_∀_elim[⌜m⌝, ⌜n⌝] mod_less_thm));
a(PC_T1 "lin_arith" asm_prove_tac[]);
(* *** Goal "2" *** *)
a(POP_ASM_T rewrite_thm_tac);
a(rewrite_tac[get_spec⌜$<⋎Z⌝]);
a(once_rewrite_tac[ℤ_≤_minus_thm]);
a(∃_tac⌜~(ℕℤ (m Div n)) + ~(ℕℤ 1)⌝);
a(rewrite_tac[ℤ_minus_clauses, ℤ_plus_assoc_thm, ℤ_plus0_thm]);
a(once_rewrite_tac[prove_rule[ℤ_times_minus_thm]⌜∀a b:ℤ⦁~ (a * b) = ~a * b⌝]);
a(rewrite_tac[ℤ_minus_clauses]);
a(rewrite_tac[ℕℤ_plus_homomorphism_thm, ℤ_plus_assoc_thm,
	ℤ_minus_clauses, ℤ_plus_clauses]);
a(rewrite_tac[conv_rule(ONCE_MAP_C eq_sym_conv) ℕℤ_times_homomorphism_thm,
	conv_rule(ONCE_MAP_C eq_sym_conv) ℕℤ_plus_homomorphism_thm,
	ℕℤ_one_one_thm,
	ℕℤ_≤_thm]);
a(strip_asm_tac(list_∀_elim[⌜m⌝, ⌜n⌝] div_mod_thm));
a(strip_asm_tac(list_∀_elim[⌜m⌝, ⌜n⌝] mod_less_thm));
a(PC_T1 "lin_arith" asm_prove_tac[]);
pop_thm()
);
=TEX
=SML

=SML
val _ = (
push_consistency_goal ⌜$Div⋎Z⌝;
a(prove_∃_tac THEN REPEAT strip_tac);
a(strip_asm_tac(∀_elim⌜j''⌝ ℤ_cases_thm1) THEN POP_ASM_T rewrite_thm_tac);
(* *** Goal "1" *** *)
a(rewrite_tac[ℕℤ_one_one_thm, pc_rule1"lin_arith"prove_rule[]⌜¬ m = 0 ⇔ 0 < m⌝]);
a(strip_asm_tac(list_∀_elim[⌜i''⌝, ⌜m⌝]ℤ_div_lemma1) THEN1 asm_rewrite_tac[]);
a(∃_tac⌜i'' + ~ (d * ℕℤ m)⌝ THEN ∃_tac ⌜d⌝ THEN strip_tac);
a(rewrite_tac[∀_elim⌜i''⌝ ℤ_plus_order_thm, ℤ_plus_clauses, ℤ_minus_clauses]);
a(POP_ASM_T (fn _ => id_tac) THEN all_asm_ante_tac);
a(rewrite_tac[get_spec⌜$Abs⋎Z⌝, get_spec⌜$<⋎Z⌝, ℕℤ_≤_thm]);
a(once_rewrite_tac[ℤ_≤_≤_0_thm]);
a(once_rewrite_tac[ℤ_times_comm_thm]);
a(rewrite_tac[get_spec⌜$*⋎Z⌝, ℤ_minus_clauses]);
a(rewrite_tac[∀_elim⌜ℕℤ m * d⌝ ℤ_plus_order_thm]);
a(rewrite_tac[∀_elim⌜~(ℕℤ m * d)⌝ ℤ_plus_order_thm]);
a(rewrite_tac[ℤ_plus_assoc_thm, ℤ_plus_clauses]);
a(taut_tac);
(* *** Goal "2" *** *)
a(conv_tac (ONCE_MAP_C eq_sym_conv) THEN once_rewrite_tac[ℤ_eq_thm]);
a(rewrite_tac[ℤ_plus0_thm, ℤ_minus_clauses,
	ℕℤ_one_one_thm, pc_rule1"lin_arith"prove_rule[]⌜¬ m = 0 ⇔ 0 < m⌝]);
a(strip_asm_tac(list_∀_elim[⌜i''⌝, ⌜m+1⌝]ℤ_div_lemma1));
a(∃_tac⌜i'' +  (~ d * ℕℤ (m+1))⌝ THEN ∃_tac ⌜~d⌝);
a(rewrite_tac[∀_elim⌜i''⌝ ℤ_plus_order_thm, ℤ_plus_clauses, ℤ_minus_clauses]);
a(all_asm_ante_tac);
a(rewrite_tac[get_spec⌜$Abs⋎Z⌝, get_spec⌜$<⋎Z⌝, ℕℤ_≤_thm]);
a(rewrite_tac[∀_elim⌜ℕℤ 0⌝ ℤ_≤_≤_0_thm,
	ℤ_minus_clauses, ℕℤ_≤_thm, ℤ_plus0_thm]);
a(rewrite_tac[ℕℤ_plus_homomorphism_thm, get_spec⌜$*⋎Z⌝]);
a(once_rewrite_tac[ℤ_times_comm_thm]);
a(rewrite_tac[ℕℤ_plus_homomorphism_thm, get_spec⌜$*⋎Z⌝]);
a(rewrite_tac[ℤ_minus_clauses]);
a(once_rewrite_tac[ℤ_times_comm_thm]);
a(rewrite_tac[get_spec⌜$*⋎Z⌝, ℤ_times_minus_thm]);
a(once_rewrite_tac[ℤ_≤_≤_0_thm]);
a(rewrite_tac[ℤ_minus_clauses]);
a(rewrite_tac[ℤ_plus_assoc_thm, ∀_elim⌜d * ℕℤ m ⌝ ℤ_plus_order_thm]);
a(rewrite_tac[∀_elim⌜~(d * ℕℤ m)⌝ ℤ_plus_order_thm]);
a(rewrite_tac[∀_elim⌜~d⌝ ℤ_plus_order_thm]);
a(rewrite_tac[∀_elim⌜d⌝ ℤ_plus_order_thm]);
a(rewrite_tac[∀_elim⌜~(ℕℤ m)⌝ ℤ_plus_order_thm]);
a(rewrite_tac[ℤ_plus_assoc_thm1, ℤ_plus_clauses, ℤ_minus_clauses]);
a(taut_tac);
save_consistency_thm⌜$Div⋎Z⌝ (pop_thm())
);
=TEX
=SML
val ⦏ℕℤ_plus_homomorphism_thm1⦎ = (
set_goal([], ⌜∀ m n : ℕ ⦁ ℕℤ m + ℕℤ n = ℕℤ(m + n)⌝);
a (rewrite_tac [ℕℤ_plus_homomorphism_thm]);
save_pop_thm "ℕℤ_plus_homomorphism_thm1"
);
=TEX
=SML
val ⦏ℤ_ℕ_induction_thm⦎ = (
set_goal([], ⌜∀ p ⦁ p (ℕℤ 0)
	∧	(∀ i ⦁ ℕℤ 0 ≤ i ∧ p i ⇒ p (i + ℕℤ 1))
	⇒	(∀ m⦁ ℕℤ 0 ≤ m ⇒ p m)⌝);
a (REPEAT strip_tac);
a (lemma_tac ⌜∀n ⦁ p (ℕℤ n)⌝);
(* *** Goal "1" *** *)
a strip_tac;
a (induction_tac ⌜n⌝);
(* *** Goal "1.1" *** *)
a (asm_rewrite_tac[]);
(* *** Goal "1.2" *** *)
a (spec_nth_asm_tac 3 ⌜ℕℤ n⌝);
(* *** Goal "1.2.1" *** *)
a (swap_nth_asm_concl_tac 1);
a (rewrite_tac [get_spec ⌜ℕℤ 0 ≤ ℕℤ 1⌝]);
a (∃_tac ⌜n⌝);
a (rewrite_tac [ℤ_plus_clauses]);
(* *** Goal "1.2.2" *** *)
a (POP_ASM_T ante_tac);
a (rewrite_tac [ℕℤ_plus_homomorphism_thm]);
(* *** Goal "2" *** *)
a (swap_nth_asm_concl_tac 2);
a (rewrite_tac [get_spec ⌜ℕℤ 0 ≤ ℕℤ 1⌝]);
a (rewrite_tac [ℤ_plus_clauses]);
a (swap_nth_asm_concl_tac 1);
a (POP_ASM_T (rewrite_thm_tac o eq_sym_rule));
a (asm_rewrite_tac[]);
save_pop_thm "ℤ_ℕ_induction_thm"
);
=TEX
=SML
val ⦏ℤ_ℕ_induction_tac⦎ = gen_induction_tac1 ℤ_ℕ_induction_thm;
=TEX
=SML
val ⦏ℤ_ℕ_plus_thm⦎ = (
set_goal ([], ⌜∀ i j : ℤ ⦁ ℕℤ 0 ≤ i ∧ ℕℤ 0 ≤ j ⇒ ℕℤ 0 ≤ i + j⌝);
a (rewrite_tac [get_spec ⌜ℕℤ 0 ≤ ℕℤ 1⌝, ℤ_plus_clauses] THEN REPEAT strip_tac);
a (∃_tac ⌜m+m'⌝);
a (asm_rewrite_tac [ℕℤ_plus_homomorphism_thm]);
save_pop_thm "ℤ_ℕ_plus_thm"
);
=TEX
=SML
val ⦏ℤ_ℕ_plus1_thm⦎ = (
set_goal ([], ⌜∀ i : ℤ ⦁ ℕℤ 0 ≤ i ⇒ ℕℤ 0 ≤ i + ℕℤ 1⌝);
a (rewrite_tac [get_spec ⌜ℕℤ 0 ≤ ℕℤ 1⌝, ℤ_plus_clauses] THEN REPEAT strip_tac);
a (∃_tac ⌜m+1⌝);
a (asm_rewrite_tac [ℕℤ_plus_homomorphism_thm]);
save_pop_thm "ℤ_ℕ_plus1_thm"
);
=TEX
=SML
val ⦏ℤ_minus_thm⦎ = (
set_goal ([], ⌜∀ i j : ℤ ⦁
		~ ( ~ i ) = i
	∧	i + ~ i   = ℕℤ 0
	∧	~ i + i   = ℕℤ 0
	∧	~ (i + j) = ~ i + ~ j
	∧	~ (ℕℤ 0) = ℕℤ 0  ⌝);
a (rewrite_tac [ℤ_minus_clauses]);
save_pop_thm "ℤ_minus_thm"
);
=TEX
We need to break off here to prevent the structure becoming too large for
the Poly/ML compiler.
=SML
end (* of structure ℤ *);
structure ⦏ℤ⦎ = struct
open ℤ;
=TEX
=SML
val ⦏ℤ_ℕ_cases_thm⦎ = (
set_goal ([], ⌜∀ i ⦁ ℕℤ 0 ≤ i ⇒ i = ℕℤ 0 ∨ (∃ j ⦁ ℕℤ 0 ≤ j ∧ i = j + ℕℤ 1)⌝);
a strip_tac;
a (ℤ_ℕ_induction_tac);
(* *** Goal "1" *** *)
a (rewrite_tac[]);
(* *** Goal "2" *** *)
a (asm_rewrite_tac[]);
a (REPEAT strip_tac);
a (∃_tac ⌜ℕℤ 0⌝);
a (rewrite_tac[ℤ_≤_clauses]);
(* *** Goal "3" *** *)
a (asm_rewrite_tac[]);
a (REPEAT strip_tac);
a (∃_tac ⌜i⌝);
a (REPEAT strip_tac);
save_pop_thm "ℤ_ℕ_cases_thm"
);
=TEX
=SML
val ⦏ℤ_ℕ_¬_minus_thm⦎ = (
set_goal ([], ⌜∀ i ⦁ ℕℤ 0 ≤ i ⇒ i = ℕℤ 0 ∨ ¬ (ℕℤ 0 ≤ ~i)⌝);
a strip_tac;
a (rewrite_tac [get_spec ⌜ℕℤ 0 ≤ ℕℤ 1⌝, ℤ_plus_clauses]);
a (REPEAT strip_tac);
a (lemma_tac ⌜ℕℤ (m + m') = ℕℤ 0⌝);
(* *** Goal "1" *** *)
a (asm_rewrite_tac [ℕℤ_plus_homomorphism_thm, ℤ_minus_clauses]);
(* *** Goal "2" *** *)
a (swap_nth_asm_concl_tac 1);
a (rewrite_tac [ℕℤ_one_one_thm]);
a (swap_nth_asm_concl_tac 3);
a (asm_rewrite_tac[]);
a (swap_nth_asm_concl_tac 3);
a (asm_rewrite_tac[]);
save_pop_thm "ℤ_ℕ_¬_minus_thm"
);
=TEX
=SML
val ⦏ℤ_¬_ℕ_thm⦎ = (
set_goal([], ⌜∀ i : ℤ ⦁ ¬ ℕℤ 0 ≤ i ⇒ ℕℤ 0 ≤ ~ i⌝);
a (REPEAT strip_tac);
a (strip_asm_tac (∀_elim ⌜i⌝ ℤ_cases_thm));
(* *** Goal "1" *** *)
a (swap_nth_asm_concl_tac 2);
a (asm_rewrite_tac[]);
a (rewrite_tac[get_spec ⌜ℕℤ 0 ≤ ℕℤ 1⌝]);
a (∃_tac ⌜m⌝ THEN rewrite_tac[ℤ_plus0_thm]);
(* *** Goal "2" *** *)
a (asm_rewrite_tac[ℤ_minus_clauses]);
a (rewrite_tac[get_spec ⌜ℕℤ 0 ≤ ℕℤ 1⌝]);
a (∃_tac ⌜m⌝ THEN rewrite_tac[ℤ_plus0_thm]);
save_pop_thm "ℤ_¬_ℕ_thm"
);
=TEX
=SML
val ⦏ℤ_plus_eq_thm⦎ = (
set_goal([], ⌜∀ i j k : ℤ ⦁ (i + j) = k ⇔ i = k + ~j⌝);
a (once_rewrite_tac [ℤ_eq_thm]);
a(rewrite_tac[ℤ_minus_clauses, ∀_elim⌜j : ℤ⌝ ℤ_plus_order_thm]);
save_pop_thm "ℤ_plus_eq_thm"
);
=TEX
=SML
val ⦏ℤ_ℕ_¬_plus1_thm⦎ = (
set_goal([], ⌜∀ i ⦁ ℕℤ 0 ≤ i ⇒ ¬ i + (ℕℤ 1) = ℕℤ 0⌝);
a (REPEAT strip_tac);
a (rewrite_tac [ℤ_plus_eq_thm, ℤ_plus0_thm]);
a (swap_nth_asm_concl_tac 1);
a (asm_rewrite_tac[]);
a (once_rewrite_tac[ℤ_≤_≤_0_thm]);
a (rewrite_tac [ℤ_minus_clauses, ℤ_plus0_thm, ℤ_≤_clauses]);
save_pop_thm "ℤ_ℕ_¬_plus1_thm"
);
=TEX
=SML
val ⦏ℤ_times_assoc_thm1⦎ = (
set_goal([], ⌜∀ i j k : ℤ ⦁ i * j * k = (i * j) * k⌝);
a (REPEAT strip_tac);
a (rewrite_tac [ℤ_times_assoc_thm]);
save_pop_thm "ℤ_times_assoc_thm1"
);
=TEX
=SML
val ⦏ℤ_times_order_thm⦎ = (
set_goal([], ⌜∀ i : ℤ ⦁ ∀ j k : ℤ ⦁
		j * i = i * j
	∧	(i * j) * k = i * j * k
	∧	j * i * k = i * j * k⌝);
a (REPEAT strip_tac);
(* *** Goal "1" *** *)
a (rewrite_tac [list_∀_elim [⌜j⌝,⌜i⌝] ℤ_times_comm_thm]);
(* *** Goal "2" *** *)
a (rewrite_tac [all_∀_elim ℤ_times_assoc_thm]);
(* *** Goal "3" *** *)
a (rewrite_tac [list_∀_elim [⌜j⌝,⌜i⌝,⌜k⌝] ℤ_times_assoc_thm1]);
a (once_rewrite_tac [list_∀_elim [⌜j⌝,⌜i⌝] ℤ_times_comm_thm]);
a (rewrite_tac [ℤ_times_assoc_thm]);
save_pop_thm "ℤ_times_order_thm"
);
=TEX
=SML
val ⦏ℕℤ_times_homomorphism_thm1⦎ = (
set_goal([], ⌜∀ m n : ℕ ⦁ ℕℤ m * ℕℤ n = ℕℤ(m * n)⌝);
a (REPEAT strip_tac);
a (rewrite_tac [all_∀_elim ℕℤ_times_homomorphism_thm]);
save_pop_thm "ℕℤ_times_homomorphism_thm1"
);
=TEX
=SML
val ⦏ℤ_times1_thm⦎ = (
set_goal ([], ⌜∀ i : ℤ ⦁ i * (ℕℤ 1) = i ∧ (ℕℤ 1) * i = i⌝);
a (rewrite_tac [list_∀_elim [⌜i : ℤ⌝,⌜ℕℤ 1⌝] ℤ_times_comm_thm]);
a (REPEAT strip_tac);
a (strip_asm_tac (∀_elim ⌜i⌝ ℤ_cases_thm));
(* *** Goal "1" *** *)
a (asm_rewrite_tac[ℕℤ_times_homomorphism_thm1]);
(* *** Goal "2" *** *)
a (asm_rewrite_tac[]);
a (rewrite_tac[ℤ_times_minus_thm, ℕℤ_times_homomorphism_thm1]);
save_pop_thm "ℤ_times1_thm"
);
=TEX
=SML
val ⦏ℤ_times_plus_distrib_thm⦎ = (
set_goal([], ⌜∀ i j k : ℤ ⦁
		i * (j + k) = i * j + i * k
	∧	(i + j) * k = i * k + j * k⌝);
a (REPEAT strip_tac);
(* *** Goal "1" *** *)
a (rewrite_tac [get_spec ⌜ℕℤ 1 * ℕℤ 1⌝]);
(* *** Goal "2" *** *)
a (rewrite_tac [list_∀_elim [⌜(i + j)⌝,⌜k⌝] ℤ_times_comm_thm]);
a (rewrite_tac [list_∀_elim [⌜i⌝,⌜k⌝] ℤ_times_comm_thm]);
a (rewrite_tac [list_∀_elim [⌜j⌝,⌜k⌝] ℤ_times_comm_thm]);
a (rewrite_tac [get_spec ⌜ℕℤ 1 * ℕℤ 1⌝]);
save_pop_thm "ℤ_times_plus_distrib_thm"
);
=TEX
=SML
val ⦏ℤ_times0_thm⦎ = (
set_goal ([], ⌜∀ i : ℤ ⦁ ℕℤ 0 * i = ℕℤ 0 ∧ i * ℕℤ 0 = ℕℤ 0⌝);
a (rewrite_tac [list_∀_elim [⌜ℕℤ 0⌝,⌜i:ℤ⌝] ℤ_times_comm_thm]);
a strip_tac;
a (lemma_tac ⌜ℕℤ 0 = j + ~j⌝);
(* *** Goal "1" *** *)
a (rewrite_tac [ℤ_minus_thm]);
(* *** Goal "2" *** *)
a (asm_rewrite_tac[ℤ_times_plus_distrib_thm]);
a (rewrite_tac [ℤ_minus_thm, ℤ_times_minus_thm]);
save_pop_thm "ℤ_times0_thm"
);
=TEX
=SML
val ⦏ℤ_eq_thm1⦎ = (
set_goal ([], ⌜∀ i j⦁ i = j ⇔ ~ i + j = ℕℤ 0⌝);
a (REPEAT strip_tac);
(* *** Goal "1" *** *)
a (asm_rewrite_tac[ℤ_minus_clauses]);
(* *** Goal "2" *** *)
a (lemma_tac ⌜i + (~i + j) = i + ℕℤ 0⌝ THEN1 asm_rewrite_tac[]);
a (POP_ASM_T ante_tac);
a (rewrite_tac[ℤ_plus_assoc_thm1, ℤ_plus_minus_thm, ℤ_plus0_thm]);
a (strip_tac THEN asm_rewrite_tac[]);
save_pop_thm "ℤ_eq_thm1"
);
=TEX
=SML
val ⦏ℤ_times_eq_0_thm⦎ = (
set_goal ([], ⌜∀ i j : ℤ ⦁ i * j = ℕℤ 0 ⇔ i = ℕℤ 0 ∨ j = ℕℤ 0⌝);
a (lemma_tac ⌜∀ a b : ℕ ⦁ a * b = 0 ⇒ a = 0 ∨ b = 0⌝);
(* *** Goal "1" *** *)
a (REPEAT strip_tac);
a (strip_asm_tac (∀_elim ⌜a⌝ ℕ_cases_thm));
a (strip_asm_tac (∀_elim ⌜b⌝ ℕ_cases_thm));
a (asm_ante_tac ⌜a * b = 0⌝);
a (asm_rewrite_tac[times_plus_distrib_thm]);
(* *** Goal "2" *** *)
a (REPEAT_N 4 strip_tac);
(* *** Goal "2.1" *** *)
a (strip_asm_tac (∀_elim ⌜i⌝ ℤ_cases_thm)
	THEN strip_asm_tac (∀_elim ⌜j⌝ ℤ_cases_thm)
	THEN asm_rewrite_tac[]);
(* *** Goal "2.1.1" *** *)
a (rewrite_tac [ℕℤ_times_homomorphism_thm1, ℕℤ_one_one_thm]);
a (asm_rewrite_tac[]);
(* *** Goal "2.1.2" *** *)
a (rewrite_tac [ℤ_times_minus_thm]);
a (once_rewrite_tac[list_∀_elim [⌜~ (ℕℤ m * ℕℤ m')⌝,⌜ℕℤ 0⌝] ℤ_eq_thm1]);
a (once_rewrite_tac[list_∀_elim [⌜~ (ℕℤ m')⌝,⌜ℕℤ 0⌝] ℤ_eq_thm1]);
a (rewrite_tac[ℤ_minus_thm, ℤ_plus0_thm]);
a (asm_rewrite_tac[ℕℤ_times_homomorphism_thm1, ℕℤ_one_one_thm]);
(* *** Goal "2.1.3" *** *)
a (rewrite_tac [ℤ_times_minus_thm]);
a (once_rewrite_tac[list_∀_elim [⌜~ (ℕℤ m * ℕℤ m')⌝,⌜ℕℤ 0⌝] ℤ_eq_thm1]);
a (once_rewrite_tac[list_∀_elim [⌜~ (ℕℤ m)⌝,⌜ℕℤ 0⌝] ℤ_eq_thm1]);
a (rewrite_tac[ℤ_minus_thm, ℤ_plus0_thm]);
a (asm_rewrite_tac[ℕℤ_times_homomorphism_thm1, ℕℤ_one_one_thm]);
(* *** Goal "2.1.4" *** *)
a (rewrite_tac [ℤ_times_minus_thm]);
a (once_rewrite_tac[list_∀_elim [⌜~ (ℕℤ m')⌝,⌜ℕℤ 0⌝] ℤ_eq_thm1]);
a (once_rewrite_tac[list_∀_elim [⌜~ (ℕℤ m)⌝,⌜ℕℤ 0⌝] ℤ_eq_thm1]);
a (rewrite_tac[ℤ_minus_thm, ℤ_plus0_thm]);
a (asm_rewrite_tac[ℕℤ_times_homomorphism_thm1, ℕℤ_one_one_thm]);
(* *** Goal "2.2" *** *)
a (REPEAT strip_tac THEN asm_rewrite_tac[ℤ_times0_thm]);
save_pop_thm "ℤ_times_eq_0_thm"
);
=TEX
=SML
val ⦏ℤ_times_clauses⦎ = (
set_goal ([], ⌜∀ i j : ℤ ⦁
		ℕℤ 0 * i = ℕℤ 0
	∧	i * ℕℤ 0 = ℕℤ 0
	∧	i * ℕℤ 1 = i
	∧	ℕℤ 1 * i = i⌝);
a (rewrite_tac [ℤ_times0_thm, ℤ_times1_thm]);
save_pop_thm "ℤ_times_clauses"
);
=TEX
=SML
val ⦏ℤ_ℕ_times_thm⦎ = (
set_goal ([], ⌜∀ i j ⦁ ℕℤ 0 ≤ i ∧ ℕℤ 0 ≤ j ⇒ ℕℤ 0 ≤ i * j⌝);
a(REPEAT strip_tac THEN POP_ASM_T ante_tac);
a (ℤ_ℕ_induction_tac);
(* *** Goal "1" *** *)
a (rewrite_tac [ℤ_times0_thm, ℤ_≤_clauses]);
(* *** Goal "2" *** *)
a (rewrite_tac [ℤ_times_plus_distrib_thm, ℤ_times1_thm]);
a (all_asm_fc_tac[ℤ_ℕ_plus_thm]);
save_pop_thm "ℤ_ℕ_times_thm"
);
=TEX
=SML
val ⦏ℤ_≤_trans_thm⦎ = (
set_goal ([], ⌜∀ i j k : ℤ ⦁ i ≤ j ∧ j ≤ k ⇒ i ≤ k⌝);
a (rewrite_tac [get_spec ⌜ℕℤ 0 ≤ ℕℤ 1⌝]);
a (REPEAT strip_tac);
a (∃_tac ⌜m+m'⌝);
a (rewrite_tac [ℕℤ_plus_homomorphism_thm]);
a (eq_sym_nth_asm_tac 1);
a (eq_sym_nth_asm_tac 2);
a (lemma_tac ⌜ℕℤ m = ~i + j⌝);
(* *** Goal "1" *** *)
a (asm_rewrite_tac[ℤ_plus_minus_thm, ℤ_plus_assoc_thm1, ℤ_plus0_thm]);
(* *** Goal "2" *** *)
a (lemma_tac ⌜ℕℤ m' = ~j + k⌝);
(* *** Goal "2.1" *** *)
a (GET_NTH_ASM_T 3 rewrite_thm_tac);
a (rewrite_tac[ℤ_plus_minus_thm, ℤ_plus_assoc_thm1, ℤ_plus0_thm]);
(* *** Goal "2.2" *** *)
a (LIST_GET_NTH_ASM_T [1,2] rewrite_tac);
a (rewrite_tac[ℤ_plus_assoc_thm]);
a (rewrite_tac[ℤ_plus_minus_thm, ℤ_plus_assoc_thm1, ℤ_plus0_thm]);
save_pop_thm "ℤ_≤_trans_thm"
);
=TEX
=SML
val ⦏ℤ_≤_cases_thm⦎ = (
set_goal ([], ⌜∀ i j : ℤ ⦁ i ≤ j ∨ j ≤ i⌝);
a (rewrite_tac [get_spec ⌜ℕℤ 0 ≤ ℕℤ 1⌝]);
a (REPEAT_N 2 strip_tac);
a (strip_asm_tac (∀_elim ⌜i + ~ j⌝ ℤ_cases_thm));
(* *** Goal "1" *** *)
a (∨_right_tac);
a (∃_tac ⌜m⌝);
a (eq_sym_nth_asm_tac 1);
a (asm_rewrite_tac[]);
a (rewrite_tac [∀_elim ⌜i⌝ ℤ_plus_order_thm, ℤ_plus_minus_thm, ℤ_plus0_thm]);
(* *** Goal "2" *** *)
a (∨_left_tac);
a (∃_tac ⌜m⌝);
a (eq_sym_nth_asm_tac 1);
a (lemma_tac ⌜i = ~ (ℕℤ m) + j⌝ THEN1 asm_rewrite_tac[]);
(* *** Goal "2.1" *** *)
a (rewrite_tac [ℤ_plus_assoc_thm, ℤ_plus_minus_thm, ℤ_plus0_thm]);
(* *** Goal "2.2" *** *)
a (once_asm_rewrite_tac[]);
a (rewrite_tac [list_∀_elim [⌜~ (ℕℤ m)⌝,⌜j⌝] ℤ_plus_comm_thm]);
a (rewrite_tac [ℤ_plus_assoc_thm, ℤ_plus_minus_thm, ℤ_plus0_thm]);
save_pop_thm "ℤ_≤_cases_thm"
);
=TEX
=SML
val ⦏ℤ_≤_refl_thm⦎ = (
set_goal ([], ⌜∀ i : ℤ ⦁ i ≤ i⌝);
a (rewrite_tac [get_spec ⌜ℕℤ 0 ≤ ℕℤ 1⌝]);
a strip_tac;
a (∃_tac ⌜0⌝);
a (rewrite_tac [ℤ_plus0_thm]);
save_pop_thm "ℤ_≤_refl_thm"
);
=TEX
=SML
val ⦏ℤ_≤_≤_0_thm1⦎ = (
set_goal([], ⌜∀ i j : ℤ ⦁ i ≤ j ⇔ ℕℤ 0 ≤ j + ~i⌝);
a (REPEAT ∀_tac);
a (rewrite_tac [get_spec ⌜ℕℤ 0 ≤ ℕℤ 1⌝]);
a (once_rewrite_tac [ℤ_eq_thm1]);
a (rewrite_tac [ℤ_minus_clauses, ℤ_plus_clauses]);
a (rewrite_tac [list_∀_elim [⌜~i⌝,⌜~ (ℕℤ m)⌝] ℤ_plus_comm_thm]);
a (rewrite_tac [list_∀_elim [⌜j⌝,⌜~i⌝] ℤ_plus_comm_thm]);
a (rewrite_tac [ℤ_plus_assoc_thm]);
save_pop_thm "ℤ_≤_≤_0_thm1"
);
=TEX
=SML
val ⦏ℤ_≤_antisym_thm⦎ = (
set_goal([], ⌜∀ i j : ℤ ⦁ i ≤ j ∧ j ≤ i ⇒ i = j⌝);
a (lemma_tac ⌜∀ m m' ⦁ ~ (ℕℤ m) = ~ (ℕℤ m') ⇔ ℕℤ m' = ℕℤ m⌝);
a (REPEAT strip_tac THEN1 once_rewrite_tac[ℤ_eq_thm]
	THEN asm_rewrite_tac[ℤ_minus_thm]);
(* *** Goal "2" *** *)
a (REPEAT ∀_tac);
a (strip_asm_tac (∀_elim ⌜i⌝ ℤ_cases_thm)
	THEN strip_asm_tac (∀_elim ⌜j⌝ ℤ_cases_thm));
(* *** Goal "2.1" *** *)
a (asm_rewrite_tac[ℕℤ_≤_thm, ℕℤ_one_one_thm, ≤_antisym_thm]);
(* *** Goal "2.2" *** *)
a (asm_rewrite_tac[]);
a (once_rewrite_tac[ℤ_≤_≤_0_thm, ℤ_eq_thm]);
a (once_rewrite_tac[list_∀_elim [⌜~ (ℕℤ m') + ~ (ℕℤ m)⌝,⌜ℕℤ 0⌝] ℤ_≤_≤_0_thm1]);
a (rewrite_tac[ℤ_plus_clauses, ℤ_minus_thm,ℕℤ_plus_homomorphism_thm1]);
a (rewrite_tac[ℕℤ_≤_thm, ℕℤ_one_one_thm, ≤_antisym_thm]);
(* *** Goal "2.3" *** *)
a (asm_rewrite_tac[]);
a (once_rewrite_tac[ℤ_≤_≤_0_thm1, ℤ_eq_thm1]);
a (once_rewrite_tac[list_∀_elim [⌜ℕℤ 0⌝,⌜~ (ℕℤ m) + ~ (ℕℤ m')⌝] ℤ_≤_≤_0_thm]);
a (rewrite_tac[ℤ_plus_clauses, ℤ_minus_thm,ℕℤ_plus_homomorphism_thm1]);
a (rewrite_tac[ℕℤ_≤_thm, ℕℤ_one_one_thm, ≤_antisym_thm]);
(* *** Goal "2.4" *** *)
a (asm_rewrite_tac[ℤ_minus_≤_thm]);
a (rewrite_tac[ℕℤ_≤_thm, ℕℤ_one_one_thm, ≤_antisym_thm]);
save_pop_thm "ℤ_≤_antisym_thm"
);
=TEX
=SML
val ⦏ℤ_less_trans_thm⦎ = (
set_goal([], ⌜∀ i j k : ℤ ⦁ i < j ∧ j < k ⇒ i < k⌝);
a (rewrite_tac [get_spec ⌜ℕℤ 0 < ℕℤ 1⌝, get_spec ⌜ℕℤ 0 ≤ ℕℤ 1⌝]);
a (REPEAT strip_tac);
a (∃_tac ⌜m + m' + 1⌝);
a (rewrite_tac[ℕℤ_plus_homomorphism_thm]);
a (eq_sym_nth_asm_tac 1);
a (eq_sym_nth_asm_tac 2);
a (asm_rewrite_tac[ℤ_plus_assoc_thm]);
a (rewrite_tac[list_∀_elim [⌜ℕℤ m'⌝,⌜ℕℤ 1⌝] ℤ_plus_comm_thm]);
save_pop_thm "ℤ_less_trans_thm"
);
=TEX
=SML
val ⦏ℤ_less_irrefl_thm⦎ = (
set_goal([], ⌜∀ i j : ℤ ⦁ ¬ (i < j ∧ j < i)⌝);
a (rewrite_tac [get_spec ⌜ℕℤ 0 < ℕℤ 1⌝, get_spec ⌜ℕℤ 0 ≤ ℕℤ 1⌝]);
a (REPEAT strip_tac);
a (eq_sym_nth_asm_tac 1);
a (asm_rewrite_tac[]);
a (rewrite_tac[ℤ_plus_assoc_thm, ℤ_plus_clauses,
		ℕℤ_plus_homomorphism_thm1, ℕℤ_one_one_thm]);
save_pop_thm "ℤ_less_irrefl_thm"
);
=TEX
=SML
val ⦏ℤ_less_cases_thm⦎ = (
set_goal([], ⌜∀ i j : ℤ ⦁ i < j ∨ i = j ∨ j < i⌝);
a (REPEAT ∀_tac);
a (rewrite_tac[get_spec⌜$<⋎Z⌝, get_spec⌜$≤⋎Z⌝]);
a (strip_asm_tac (∀_elim ⌜i + ~ j⌝ ℤ_cases_thm1));
(* *** Goal "1" *** *)
a (strip_asm_tac (∀_elim ⌜m⌝ ℕ_cases_thm) THEN var_elim_nth_asm_tac 1);
(* *** Goal "1.1" *** *)
a (once_rewrite_tac[ℤ_eq_thm] THEN asm_rewrite_tac[]);
(* *** Goal "1.2" *** *)
a (∨_right_tac THEN ∨_right_tac THEN ∃_tac⌜i'⌝);
a (once_rewrite_tac[ℤ_eq_thm1]);
a (all_asm_ante_tac THEN rewrite_tac [ℕℤ_plus_homomorphism_thm]);
a (STRIP_T (ante_tac o once_rewrite_rule[ℤ_eq_thm]));
a (rewrite_tac[ℤ_minus_thm, ∀_elim⌜~j⌝ ℤ_plus_order_thm]);
a (rewrite_tac[∀_elim⌜i⌝ ℤ_plus_order_thm]);
a (rewrite_tac[∀_elim⌜~(ℕℤ 1)⌝ ℤ_plus_order_thm]);
(* *** Goal "2" *** *)
a (∨_left_tac THEN ∃_tac⌜m⌝);
a (all_asm_ante_tac THEN rewrite_tac [ℕℤ_plus_homomorphism_thm]);
a (once_rewrite_tac[ℤ_eq_thm1]);
a (rewrite_tac[ℤ_minus_thm, ∀_elim⌜j⌝ ℤ_plus_order_thm]);
a (rewrite_tac[∀_elim⌜~i⌝ ℤ_plus_order_thm]);
a (rewrite_tac[∀_elim⌜~(ℕℤ 1)⌝ ℤ_plus_order_thm]);
save_pop_thm "ℤ_less_cases_thm"
);
=TEX
=SML
val ⦏ℕℤ_less_thm⦎ = (
set_goal([], ⌜∀ m n : ℕ ⦁ ℕℤ m < ℕℤ n ⇔ m < n⌝);
a (REPEAT ∀_tac);
a (rewrite_tac [get_spec ⌜ℕℤ 0 < ℕℤ 1⌝, get_spec ⌜0 < 1⌝]);
a (rewrite_tac [ℕℤ_plus_homomorphism_thm1, ℕℤ_≤_thm]);
save_pop_thm "ℕℤ_less_thm"
);
=TEX
=SML
val ⦏ℤ_less_less_0_thm⦎ = (
set_goal([], ⌜∀ i j : ℤ ⦁ i < j ⇔ i + ~j < ℕℤ 0⌝);
a (REPEAT ∀_tac);
a (rewrite_tac [get_spec ⌜ℕℤ 0 < ℕℤ 1⌝, get_spec ⌜ℕℤ 0 ≤ ℕℤ 1⌝]);
a (once_rewrite_tac [ℤ_eq_thm]);
a (rewrite_tac[ℤ_minus_clauses, ∀_elim ⌜~j⌝ ℤ_plus_order_thm, ℤ_plus_clauses]);
save_pop_thm "ℤ_less_less_0_thm"
);
=TEX
=SML
val ⦏ℤ_less_less_0_thm1⦎ = (
set_goal([], ⌜∀ i j : ℤ ⦁ i < j ⇔ ℕℤ 0 < j + ~i⌝);
a (REPEAT ∀_tac);
a (rewrite_tac [get_spec ⌜ℕℤ 0 < ℕℤ 1⌝, get_spec ⌜ℕℤ 0 ≤ ℕℤ 1⌝]);
a (once_rewrite_tac[ℤ_eq_thm1]);
a (rewrite_tac [ℤ_plus_clauses, ℤ_minus_clauses, ℤ_plus_assoc_thm]);
a (rewrite_tac [∀_elim ⌜~i⌝ ℤ_plus_order_thm]);
save_pop_thm "ℤ_less_less_0_thm1"
);
=TEX
=SML
val ⦏ℤ_minus_less_thm⦎ = (
set_goal([], ⌜∀ i j : ℤ ⦁ ~ i < ~ j ⇔ j < i⌝);
a(REPEAT ∀_tac);
a(rewrite_tac[get_spec⌜ℕℤ 0 < ℕℤ 0⌝, get_spec ⌜ℕℤ 0 ≤ ℕℤ 1⌝]);
a(once_rewrite_tac[ℤ_eq_thm]);
a(rewrite_tac[ℤ_minus_clauses, ∀_elim⌜~i⌝ℤ_plus_order_thm, ℤ_plus_clauses]);
a(rewrite_tac[∀_elim⌜ℕℤ m⌝ℤ_plus_order_thm]);
a(rewrite_tac[∀_elim⌜ℕℤ 1⌝ℤ_plus_order_thm]);
save_pop_thm "ℤ_minus_less_thm"
);
=TEX
=SML
val ⦏ℤ_¬_less_thm⦎ = (
set_goal([], ⌜∀ i j : ℤ ⦁ ¬ i < j ⇔ j ≤ i⌝);
a (REPEAT ∀_tac);
a (strip_asm_tac (∀_elim ⌜i⌝ ℤ_cases_thm)
	THEN strip_asm_tac (∀_elim ⌜j⌝ ℤ_cases_thm)
	THEN asm_rewrite_tac[]);
(* *** Goal "1" *** *)
a (rewrite_tac[ℕℤ_≤_thm, ℕℤ_less_thm, list_∀_elim [⌜m:ℕ⌝,⌜m':ℕ⌝] ¬_less_thm]);
(* *** Goal "2" *** *)
a (once_rewrite_tac[ℤ_≤_≤_0_thm1, ℤ_less_less_0_thm]);
a (rewrite_tac[ℤ_minus_clauses]);
a (rewrite_tac[ℕℤ_plus_homomorphism_thm1, ℕℤ_≤_thm, ℕℤ_less_thm]);
(* *** Goal "3" *** *)
a (once_rewrite_tac[ℤ_≤_≤_0_thm, ℤ_less_less_0_thm1]);
a (rewrite_tac[ℤ_minus_clauses, ℕℤ_plus_homomorphism_thm1]);
a (pure_rewrite_tac[ℕℤ_≤_thm, ℕℤ_less_thm]);
a (rewrite_tac[list_∀_elim [⌜0⌝, ⌜m' + m:ℕ⌝] ¬_less_thm]);
(* *** Goal "4" *** *)
a (once_rewrite_tac[ℤ_minus_≤_thm, ℤ_minus_less_thm]);
a (rewrite_tac[ℕℤ_≤_thm, ℕℤ_less_thm, list_∀_elim [⌜m':ℕ⌝,⌜m:ℕ⌝] ¬_less_thm]);
save_pop_thm "ℤ_¬_less_thm"
);
=TEX
=SML
val ⦏ℤ_¬_≤_thm⦎ = (
set_goal([], ⌜∀ i j : ℤ ⦁ ¬ i ≤ j ⇔ j < i⌝);
a(rewrite_tac[conv_rule(ONCE_MAP_C eq_sym_conv) ℤ_¬_less_thm]);
save_pop_thm "ℤ_¬_≤_thm"
);
=TEX
=SML
val ⦏ℤ_≤_less_eq_thm⦎ = (
set_goal([], ⌜∀ i j : ℤ ⦁ i ≤ j ⇔ (i < j ∨ i = j)⌝);
a (REPEAT strip_tac);
(* *** Goal "1" *** *)
a(swap_nth_asm_concl_tac 1);
a (rewrite_tac [eq_sym_rule (list_∀_elim [⌜j⌝,⌜i⌝] ℤ_¬_≤_thm)]);
a (contr_tac THEN asm_fc_tac [ℤ_≤_antisym_thm]);
(* *** Goal "2" *** *)
a (rewrite_tac [eq_sym_rule (list_∀_elim [⌜j⌝,⌜i⌝] ℤ_¬_less_thm)]);
a (contr_tac THEN asm_fc_tac [ℤ_less_irrefl_thm]);
(* *** Goal "3" *** *)
a(asm_rewrite_tac[ℤ_≤_refl_thm]);
save_pop_thm "ℤ_≤_less_eq_thm"
);
=TEX
=SML
val ⦏ℤ_less_≤_trans_thm⦎ = (
set_goal([], ⌜∀ i j k : ℤ ⦁ i < j ∧ j ≤ k ⇒ i < k⌝);
a (rewrite_tac [get_spec ⌜ℕℤ 0 < ℕℤ 1⌝, get_spec ⌜ℕℤ 0 ≤ ℕℤ 1⌝]);
a (REPEAT strip_tac);
a (∃_tac ⌜m+m'⌝);
a (eq_sym_nth_asm_tac 1);
a (eq_sym_nth_asm_tac 2);
a (asm_rewrite_tac[ℤ_plus_assoc_thm, ℕℤ_plus_homomorphism_thm]);
save_pop_thm "ℤ_less_≤_trans_thm"
);
=TEX
=SML
val ⦏ℤ_≤_less_trans_thm⦎ = (
set_goal([], ⌜∀ i j k : ℤ ⦁ i ≤ j ∧ j < k ⇒ i < k⌝);
a (rewrite_tac [get_spec ⌜ℕℤ 0 < ℕℤ 1⌝, get_spec ⌜ℕℤ 0 ≤ ℕℤ 1⌝]);
a (REPEAT strip_tac);
a (∃_tac ⌜m+m'⌝);
a (eq_sym_nth_asm_tac 1);
a (eq_sym_nth_asm_tac 2);
a (asm_rewrite_tac[ℤ_plus_assoc_thm, ℕℤ_plus_homomorphism_thm]);
a (rewrite_tac [∀_elim ⌜ℕℤ m⌝ ℤ_plus_order_thm]);
save_pop_thm "ℤ_≤_less_trans_thm"
);
=TEX
=SML
val ⦏ℤ_minus_ℕ_≤_thm⦎ = (
set_goal([], ⌜∀ i m ⦁ i + ~ (ℕℤ m) ≤ i⌝);
a (rewrite_tac [get_spec ⌜ℕℤ 0 ≤ ℕℤ 1⌝]);
a (REPEAT ∀_tac);
a (∃_tac ⌜m⌝);
a (rewrite_tac [ℤ_plus_assoc_thm, ℤ_plus_minus_thm, ℤ_plus0_thm]);
save_pop_thm "ℤ_minus_ℕ_≤_thm"
);
=TEX
=SML
val ⦏ℤ_≤_plus_ℕ_thm⦎ = (
set_goal ([], ⌜∀ i m ⦁ i ≤ i + ℕℤ m⌝);
a (rewrite_tac [get_spec ⌜ℕℤ 0 ≤ ℕℤ 1⌝]);
a (REPEAT ∀_tac);
a (∃_tac ⌜m⌝ THEN rewrite_tac[]);
save_pop_thm "ℤ_≤_plus_ℕ_thm"
);
=TEX
=SML
val ⦏ℤ_∈_ℕ_thm⦎ = (
set_goal([], ⌜∀ i ⦁ ℕℤ 0 ≤ i ⇔ ∃ m ⦁ i = ℕℤ m⌝);
a ∀_tac;
a (rewrite_tac [get_spec ⌜ℕℤ 0 ≤ ℕℤ 1⌝, ℤ_plus0_thm]);
a (REPEAT strip_tac THEN ∃_tac ⌜m⌝ THEN asm_rewrite_tac[]);
save_pop_thm "ℤ_∈_ℕ_thm"
);
=TEX
=SML
val ⦏ℤ_less_clauses ⦎= (
set_goal([], ⌜∀ i j k : ℤ ⦁
		(i + k < j + k ⇔ i < j)
	∧	(k + i < j + k ⇔ i < j)
	∧	(i + k < k + j ⇔ i < j)
	∧	(k + i < k + j ⇔ i < j)
	∧	(i + k < k ⇔ i < ℕℤ 0)
	∧	(k + i < k ⇔ i < ℕℤ 0)
	∧	(i < k + i ⇔ ℕℤ 0 < k)
	∧	(i < i + k ⇔ ℕℤ 0 < k)
	∧	¬ i < i
	∧	ℕℤ 0 < ℕℤ 1
	∧	¬ ℕℤ 1 < ℕℤ 0 ⌝);
a (REPEAT ∀_tac);
a (rewrite_tac [get_spec ⌜ℕℤ 0 < ℕℤ 1⌝]);
a (rewrite_tac [ℤ_≤_clauses, ℤ_plus_assoc_thm]);
a (rewrite_tac [∀_elim ⌜k⌝ ℤ_plus_order_thm]);
a (rewrite_tac [ℤ_≤_clauses, ℤ_plus0_thm]);
a (rewrite_tac [ℤ_¬_≤_thm]);
a (rewrite_tac [get_spec ⌜ℕℤ 0 < ℕℤ 1⌝]);
a (rewrite_tac [ℤ_plus_clauses, ℤ_≤_clauses]);
save_pop_thm "ℤ_less_clauses"
);
=TEX
=SML
val ⦏ℤ_ℕ_abs_thm⦎ = (
set_goal ([], ⌜∀ m : ℕ ⦁ Abs (ℕℤ m) = ℕℤ m ∧ Abs (~(ℕℤ m)) = ℕℤ m⌝);
a (REPEAT strip_tac THEN rewrite_tac [get_spec ⌜Abs⌝]);
(* *** Goal "1" *** *)
a (rewrite_tac [ℕℤ_≤_thm]);
(* *** Goal "2" *** *)
a (once_rewrite_tac [ℤ_≤_≤_0_thm]);
a (rewrite_tac [ℤ_plus0_thm, ℕℤ_≤_thm, ℤ_minus_thm]);
a (strip_asm_tac (∀_elim ⌜m⌝ ℕ_cases_thm));
(* *** Goal "2.1" *** *)
a (asm_rewrite_tac[ℤ_minus_clauses]);
(* *** Goal "2.2" *** *)
a (asm_rewrite_tac[]);
save_pop_thm "ℤ_ℕ_abs_thm"
);
=TEX
=SML
val ⦏ℤ_abs_thm⦎ = (
set_goal ([], ⌜∀ i : ℤ ⦁ ℕℤ 0 ≤ i ⇒ (Abs (i) = i ∧ Abs (~i) = i)⌝);
a ∀_tac;
a (strip_asm_tac (∀_elim ⌜i⌝ ℤ_cases_thm)
	THEN asm_rewrite_tac[ℤ_minus_thm, ℤ_ℕ_abs_thm]);
a (once_rewrite_tac [ℤ_≤_≤_0_thm]);
a (rewrite_tac [ℤ_minus_clauses, ℤ_plus0_thm, ℕℤ_≤_thm]);
a (strip_tac THEN asm_rewrite_tac [ℤ_minus_clauses]);
save_pop_thm "ℤ_abs_thm"
);
=TEX
=SML
val ⦏ℤ_abs_ℕ_thm⦎ = (
set_goal ([], ⌜∀ i : ℤ ⦁ ℕℤ 0 ≤ Abs i⌝);
a ∀_tac;
a (strip_asm_tac (∀_elim ⌜i⌝ ℤ_cases_thm)
	THEN asm_rewrite_tac[ℕℤ_≤_thm, ℤ_ℕ_abs_thm]);
save_pop_thm "ℤ_abs_ℕ_thm"
);
=TEX
=SML
val ⦏ℤ_abs_eq_0_thm⦎ = (
set_goal ([], ⌜∀ i : ℤ ⦁ Abs i = ℕℤ 0 ⇔ i = ℕℤ 0⌝);
a ∀_tac;
a (strip_asm_tac (∀_elim ⌜i⌝ ℤ_cases_thm)
	THEN asm_rewrite_tac[ℤ_minus_clauses, ℤ_ℕ_abs_thm]);
a (rewrite_tac [list_∀_elim [⌜~ (ℕℤ m)⌝,⌜ℕℤ 0⌝] ℤ_eq_thm1]);
a (rewrite_tac [ℤ_minus_thm, ℤ_plus0_thm]);
save_pop_thm "ℤ_abs_eq_0_thm"
);
=TEX
=SML
val ⦏ℤ_abs_minus_thm⦎ = (
set_goal([], ⌜∀ i : ℤ ⦁ Abs (~i) = Abs i⌝);
a ∀_tac;
a (strip_asm_tac (∀_elim ⌜i⌝ ℤ_cases_thm)
	THEN asm_rewrite_tac[ℤ_ℕ_abs_thm, ℤ_minus_thm]);
save_pop_thm "ℤ_abs_minus_thm"
);
=TEX
=SML
val ⦏ℤ_ℕ_abs_minus_thm⦎ = (
set_goal([], ⌜∀ i j : ℤ ⦁ ℕℤ 0 ≤ i ∧ ℕℤ 0 ≤ j ∧ j ≤ i ⇒ Abs (i + ~j) ≤ i⌝);
a (REPEAT ∀_tac);
a (rewrite_tac [get_spec ⌜ℕℤ 0 ≤ ℕℤ 1⌝, ℤ_plus0_thm]);
a (REPEAT strip_tac);
a (∃_tac ⌜m'⌝);
a (eq_sym_nth_asm_tac 1 THEN asm_rewrite_tac[]);
a (rewrite_tac[ ∀_elim ⌜ℕℤ m''⌝ ℤ_plus_order_thm, ℤ_plus_minus_thm, ℤ_plus0_thm]);
a (rewrite_tac[get_spec ⌜Abs⌝, ℕℤ_≤_thm]);
save_pop_thm "ℤ_ℕ_abs_minus_thm"
);
=TEX
=SML
val ⦏ℤ_abs_times_thm⦎ = (
set_goal([], ⌜∀ i j : ℤ ⦁ Abs (i * j) = Abs i * Abs j⌝);
a(REPEAT strip_tac);
a (strip_asm_tac (∀_elim ⌜i⌝ ℤ_cases_thm)
	THEN strip_asm_tac (∀_elim ⌜j⌝ ℤ_cases_thm)
	THEN asm_rewrite_tac[]
	THEN rewrite_tac [ℤ_times_minus_thm, ℕℤ_times_homomorphism_thm1]
	THEN rewrite_tac [ℤ_ℕ_abs_thm]
	THEN rewrite_tac [ℕℤ_times_homomorphism_thm]);
save_pop_thm "ℤ_abs_times_thm"
);
=TEX
=SML
val ⦏ℤ_abs_plus_thm⦎ = (
set_goal([], ⌜∀ i j : ℤ ⦁ Abs (i + j) ≤ Abs i + Abs j⌝);
a (REPEAT ∀_tac);
a (strip_asm_tac (∀_elim ⌜i⌝ ℤ_cases_thm)
	THEN strip_asm_tac (∀_elim ⌜j⌝ ℤ_cases_thm));
(* *** Goal "1" *** *)
a (asm_rewrite_tac [ℕℤ_plus_homomorphism_thm1, ℤ_ℕ_abs_thm, ℤ_≤_clauses]);
(* *** Goal "2" *** *)
a (strip_asm_tac (∀_elim ⌜i + j⌝ ℤ_cases_thm) THEN asm_rewrite_tac[]);
(* *** Goal "2.1" *** *)
a (rewrite_tac [ℤ_ℕ_abs_thm]);
a (POP_ASM_T (rewrite_thm_tac o eq_sym_rule));
a (asm_rewrite_tac[ℤ_≤_clauses]);
a (once_rewrite_tac [ℤ_≤_≤_0_thm1]);
a (rewrite_tac [ℤ_minus_thm, ℕℤ_plus_homomorphism_thm1, ℕℤ_≤_thm]);
(* *** Goal "2.2" *** *)
a (rewrite_tac [ℤ_ℕ_abs_thm]);
a (lemma_tac ⌜ℕℤ m'' = ~ (ℕℤ m + ~ (ℕℤ m'))⌝
	THEN1 DROP_NTH_ASM_T 3 (rewrite_thm_tac o eq_sym_rule)
	THEN1 DROP_NTH_ASM_T 2 (rewrite_thm_tac o eq_sym_rule)
	THEN1 asm_rewrite_tac []
	THEN1 rewrite_tac [ℤ_minus_clauses] );
a (asm_rewrite_tac[]);
a (once_rewrite_tac [ℤ_≤_≤_0_thm1]);
a (rewrite_tac [ℤ_minus_clauses]);
a (rewrite_tac [∀_elim ⌜ℕℤ m⌝ ℤ_plus_order_thm, ℤ_minus_clauses]);
a (rewrite_tac [ℤ_plus0_thm, ℕℤ_plus_homomorphism_thm1, ℕℤ_≤_thm]);
(* *** Goal "3" *** *)
a (strip_asm_tac (∀_elim ⌜i + j⌝ ℤ_cases_thm) THEN asm_rewrite_tac[]);
(* *** Goal "3.1" *** *)
a (rewrite_tac [ℤ_ℕ_abs_thm]);
a (POP_ASM_T (rewrite_thm_tac o eq_sym_rule));
a (asm_rewrite_tac[ℤ_≤_clauses]);
a (once_rewrite_tac [ℤ_≤_≤_0_thm1]);
a (rewrite_tac [ℤ_minus_thm, ℕℤ_plus_homomorphism_thm1, ℕℤ_≤_thm]);
(* *** Goal "3.2" *** *)
a (rewrite_tac [ℤ_ℕ_abs_thm]);
a (lemma_tac ⌜ℕℤ m'' = ~ (~(ℕℤ m) + ℕℤ m')⌝
	THEN1 DROP_NTH_ASM_T 3 (rewrite_thm_tac o eq_sym_rule)
	THEN1 DROP_NTH_ASM_T 2 (rewrite_thm_tac o eq_sym_rule)
	THEN1 asm_rewrite_tac []
	THEN1 rewrite_tac [ℤ_minus_clauses] );
a (asm_rewrite_tac[]);
a (once_rewrite_tac [ℤ_≤_≤_0_thm1]);
a (rewrite_tac [ℤ_minus_clauses]);
a (rewrite_tac [ℤ_plus_assoc_thm]);
a (rewrite_tac [∀_elim ⌜ℕℤ m'⌝ ℤ_plus_order_thm, ℤ_minus_clauses]);
a (rewrite_tac [ℤ_plus0_thm, ℕℤ_plus_homomorphism_thm1, ℕℤ_≤_thm]);
(* *** Goal "4" *** *)
a (lemma_tac ⌜~ (ℕℤ m) + ~ (ℕℤ m') = ~ (ℕℤ m + ℕℤ m')⌝
	THEN1 rewrite_tac [ℤ_minus_thm]);
a (asm_rewrite_tac [ℕℤ_plus_homomorphism_thm1, ℤ_ℕ_abs_thm, ℤ_≤_clauses]);
save_pop_thm "ℤ_abs_plus_thm"
);
=TEX
=SML
val ⦏ℤ_div_mod_unique_lemma1⦎ = (
set_goal([], ⌜∀ i j : ℤ ⦁ ℕℤ 0 ≤ i ∧ ℕℤ 0 ≤ j ∧ i * j < j
	⇒ i = ℕℤ 0⌝);
a (REPEAT ∀_tac);
a (rewrite_tac [get_spec ⌜ℕℤ 0 ≤ ℕℤ 1⌝, ℤ_plus0_thm]);
a (strip_tac);
a (POP_ASM_T ante_tac);
a (REPEAT (POP_ASM_T (rewrite_thm_tac o eq_sym_rule)));
a (rewrite_tac [ℕℤ_one_one_thm, ℕℤ_times_homomorphism_thm1, ℕℤ_less_thm]);
a (strip_tac);
a (strip_asm_tac (∀_elim ⌜m⌝ ℕ_cases_thm));
a (asm_ante_tac ⌜m * m' < m'⌝);
a (asm_rewrite_tac[times_plus_distrib_thm]);
save_pop_thm "ℤ_div_mod_unique_lemma1"
);
=TEX
=SML
val ⦏ℤ_div_mod_unique_lemma2⦎ = (
set_goal([], ⌜∀ j d r : ℤ ⦁ ¬j = ℕℤ 0
   ⇒ ((d * j + r = ℕℤ 0 ∧ ℕℤ 0 ≤ r ∧ r < Abs j) ⇒ d = ℕℤ 0 ∧ r = ℕℤ 0)⌝);
a (REPEAT_UNTIL is_∧ strip_tac);
a (lemma_tac ⌜d = ℕℤ 0⌝);
(* *** Goal "1" *** *)
a (lemma_tac ⌜Abs (d * j) = ℕℤ 0⌝);
(* *** Goal "1.1" *** *)
a (lemma_tac ⌜Abs (d * j) < Abs j⌝);
(* *** Goal "1.1.1" *** *)
a (lemma_tac ⌜d * j = (d * j + r) + ~ r⌝);
(* *** Goal "1.1.1.1" *** *)
a (rewrite_tac [ℤ_plus_assoc_thm, ℤ_minus_thm, ℤ_plus0_thm]);
(* *** Goal "1.1.1.2" *** *)
a (POP_ASM_T once_rewrite_thm_tac);
a (bc_tac [ℤ_≤_less_trans_thm]);
a (∃_tac ⌜r⌝);
a (asm_rewrite_tac [ℤ_plus0_thm]);
a (strip_asm_tac (∀_elim ⌜r⌝ ℤ_cases_thm));
(* *** Goal "1.1.1.2.1" *** *)
a (asm_rewrite_tac [ℤ_minus_thm, ℤ_ℕ_abs_thm, ℤ_≤_clauses]);
(* *** Goal "1.1.1.2.2" *** *)
a (DROP_ASM_T ⌜ℕℤ 0 ≤ r⌝ ante_tac);
a (asm_rewrite_tac[]);
a (once_rewrite_tac [ℤ_≤_≤_0_thm]);
a (rewrite_tac [ℤ_minus_clauses, ℤ_plus0_thm, ℕℤ_≤_thm]);
a (strip_tac THEN asm_rewrite_tac[ℤ_plus0_thm, ℤ_ℕ_abs_thm, ℤ_≤_clauses]);
(* *** Goal "1.1.2" *** *)
a (POP_ASM_T ante_tac);
a (rewrite_tac [ℤ_abs_times_thm]);
a (strip_asm_tac (∀_elim ⌜d⌝ ℤ_abs_ℕ_thm));
a (strip_asm_tac (∀_elim ⌜j⌝ ℤ_abs_ℕ_thm));
a strip_tac;
a (ALL_FC_T rewrite_tac [ℤ_div_mod_unique_lemma1]);
a (rewrite_tac [ℤ_times0_thm]);
(* *** Goal "1.2" *** *)
a (POP_ASM_T ante_tac);
a (asm_rewrite_tac [ℤ_abs_eq_0_thm, ℤ_times_eq_0_thm]);
(* *** Goal "2" *** *)
a (asm_rewrite_tac[]);
a (DROP_ASM_T ⌜d * j + r = ℕℤ 0⌝ ante_tac);
a (asm_rewrite_tac [ℤ_times0_thm, ℤ_plus0_thm]);
save_pop_thm "ℤ_div_mod_unique_lemma2"
);
=TEX
=SML
val ⦏ℤ_div_mod_unique_lemma3⦎ = (
set_goal([], ⌜∀ i j d r D R : ℤ ⦁ ¬j = ℕℤ 0 ⇒
	(	(D * j + R = d * j + r ∧ ℕℤ 0 ≤ r ∧ r ≤ R ∧ R < Abs j)
	⇒	D = d ∧ R = r)⌝);
a (REPEAT_UNTIL is_∧ strip_tac);
a (GET_ASM_T ⌜D * j + R = d * j + r⌝ (ante_tac o once_rewrite_rule [ℤ_eq_thm]));
a (lemma_tac ⌜(D * j + R) + ~(d * j + r) = (D + ~d)*j + (R + ~r)⌝);
(* *** Goal "1" *** *)
a (rewrite_tac[ℤ_times_minus_thm, ℤ_times_plus_distrib_thm,
	ℤ_minus_thm, ℤ_plus_assoc_thm]);
a (rewrite_tac[∀_elim ⌜R⌝ ℤ_plus_order_thm, ℤ_minus_thm]);
(* *** Goal "2" *** *)
a (GET_NTH_ASM_T 1 rewrite_thm_tac);
a (lemma_tac ⌜ℕℤ 0 ≤ R⌝ THEN1 all_fc_tac [ℤ_≤_trans_thm]);
a (strip_asm_tac (list_∀_elim [⌜R⌝,⌜r⌝] ℤ_ℕ_abs_minus_thm));
a (GET_ASM_T ⌜r ≤ R⌝ (asm_tac o once_rewrite_rule[ℤ_≤_≤_0_thm1]));
a (strip_asm_tac (∀_elim ⌜R + ~r⌝ ℤ_abs_thm));
a (GET_ASM_T ⌜Abs (R + ~ r) ≤ R⌝ ante_tac);
a (GET_ASM_T ⌜Abs (R + ~ r) = R + ~ r⌝ rewrite_thm_tac
	THEN strip_tac);
a (strip_asm_tac (list_∀_elim [⌜R + ~r⌝,⌜R⌝,⌜Abs j⌝] ℤ_≤_less_trans_thm));
a (strip_tac
	THEN strip_asm_tac (list_∀_elim [⌜j⌝,⌜D + ~d⌝,⌜R + ~r⌝]
		ℤ_div_mod_unique_lemma2));
a (once_rewrite_tac [ℤ_eq_thm] THEN REPEAT strip_tac);
save_pop_thm "ℤ_div_mod_unique_lemma3"
);
=TEX
=SML
val ⦏ℤ_div_mod_unique_thm⦎ = (
set_goal([], ⌜∀ i j d r : ℤ ⦁ ¬j = ℕℤ 0 ⇒
	(	(i = d * j + r ∧ ℕℤ 0 ≤ r ∧ r < Abs j)
	⇔	(d = i Div j ∧ r = i Mod j)	)⌝);
a (REPEAT_N 8 strip_tac);
(* *** Goal "1" *** *)
a (strip_asm_tac (list_∀_elim [⌜i⌝,⌜j⌝] (get_spec ⌜ℕℤ 2 Div ℕℤ 1⌝)));
a (strip_asm_tac (list_∀_elim [⌜r⌝,⌜i Mod j⌝] ℤ_≤_cases_thm));
(* *** Goal "1.1" *** *)
a (strip_asm_tac ℤ_div_mod_unique_lemma3);
a (lemma_tac ⌜(i Div j) * j + i Mod j = d * j + r⌝);
(* *** Goal "1.1.1" *** *)
a (DROP_ASM_T ⌜i = d * j + r⌝ (rewrite_thm_tac o eq_sym_rule));
a (DROP_ASM_T ⌜i = (i Div j) * j + i Mod j⌝
	(rewrite_thm_tac o eq_sym_rule));
(* *** Goal "1.1.2" *** *)
a (DROP_ASM_T ⌜i = d * j + r⌝ (fn _ => id_tac));
a (DROP_ASM_T ⌜i = (i Div j) * j + i Mod j⌝ (fn _ => id_tac));
a (all_asm_fc_tac[]);
a (asm_rewrite_tac[]);
(* *** Goal "1.2" *** *)
a (strip_asm_tac ℤ_div_mod_unique_lemma3);
a (lemma_tac ⌜d * j + r = (i Div j) * j + i Mod j⌝);
(* *** Goal "1.2.1" *** *)
a (DROP_ASM_T ⌜i = d * j + r⌝ (rewrite_thm_tac o eq_sym_rule));
a (DROP_ASM_T ⌜i = (i Div j) * j + i Mod j⌝
	(rewrite_thm_tac o eq_sym_rule));
(* *** Goal "1.2.2" *** *)
a (DROP_ASM_T ⌜i = d * j + r⌝ (fn _ => id_tac));
a (DROP_ASM_T ⌜i = (i Div j) * j + i Mod j⌝ (fn _ => id_tac));
a (all_asm_fc_tac[]);
a (asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a (strip_asm_tac (list_∀_elim [⌜i⌝,⌜j⌝] (get_spec ⌜ℕℤ 2 Div ℕℤ 1⌝)));
a (DROP_ASM_T ⌜i = (i Div j) * j + i Mod j⌝ once_rewrite_thm_tac);
a (asm_rewrite_tac[]);
save_pop_thm "ℤ_div_mod_unique_thm"
);
=TEX
We need to break off here to prevent the structure becoming too large for
the Poly/ML compiler.
=SML
end (* of structure ℤ *);
structure ⦏ℤ⦎ = struct
open ℤ;
=TEX
\section{SYNTAX FUNCTIONS}
=SML
val ⦏minus⦎ = (fst o dest_app) ⌜~ (ℕℤ 42)⌝;
val ⦏minusn⦎ = (fst o dest_const) minus;
val ⦏ℤabs⦎ = (fst o dest_app) ⌜Abs (ℕℤ 42)⌝;
val ⦏ℤabsn⦎ = (fst o dest_const) ℤabs;
val ⦏ℤint⦎ = (fst o dest_app) ⌜ℕℤ 42⌝;
val ⦏ℤintn⦎ = (fst o dest_const) ℤint;
=TEX
=SML
val ⦏dest_ℤ_≤⦎ = dest_bin_op "dest_ℤ_≤" 93101 (fst(dest_const ⌜$≤⋎Z⌝));
val ⦏dest_ℤ_≥⦎ = dest_bin_op "dest_ℤ_≥" 93102 (fst(dest_const ⌜$≥⋎Z⌝));
val ⦏dest_ℤ_greater⦎ = dest_bin_op "dest_ℤ_greater" 93105 (fst(dest_const ⌜$>⋎Z⌝));
val ⦏dest_ℤ_less⦎ = dest_bin_op "dest_ℤ_less" 93106 (fst(dest_const ⌜$<⋎Z⌝));
val ⦏dest_ℤ_plus⦎ = dest_bin_op "dest_ℤ_plus" 93109 (fst(dest_const ⌜$+⋎Z⌝));
val ⦏dest_ℤ_subtract⦎ = dest_bin_op "dest_ℤ_subtract" 93111 (fst(dest_const ⌜$-⋎Z⌝));
val ⦏dest_ℤ_times⦎ = dest_bin_op "dest_ℤ_times" 93112 (fst(dest_const ⌜$*⋎Z⌝));
val ⦏dest_ℤ_mod⦎ = dest_bin_op "dest_ℤ_mod" 93108 (fst(dest_const ⌜$Mod⋎Z⌝));
val ⦏dest_ℤ_div⦎ = dest_bin_op "dest_ℤ_div" 93104 (fst(dest_const ⌜$Div⋎Z⌝));
=TEX
=SML
fun ⦏dest_ℤ_minus⦎ (tm : TERM) : TERM = (
	let	val (sgn, a) = dest_app tm;
		val (s, _) = dest_const sgn;
	in	if s = minusn then a
			else term_fail "dest_ℤ_minus" 93107 [tm]
	end	handle Fail _ => term_fail "dest_ℤ_minus" 93107 [tm]
);
=TEX
=SML
fun ⦏dest_ℤ_abs⦎ (tm : TERM) : TERM = (
	let	val (sgn, a) = dest_app tm;
		val  (s,_) = dest_const sgn;
	in	if s = ℤabsn then a
			else term_fail "dest_ℤ_abs" 93106 [tm]
	end	handle Fail _ => term_fail "dest_ℤ_abs" 93106 [tm]
);
=TEX
=SML
fun ⦏dest_ℤ_signed_int⦎ (tm : TERM) : INTEGER = (
	let	val (f, a) = dest_app tm;
		val (n, _) = dest_const f;
	in	if n = ℤintn then dest_ℕ a
			else term_fail "dest_ℤ_signed_int" 93110 [tm]
	end	handle Fail _ => (
	let	val (sgn, a) = dest_app tm;
		val (s, _) = dest_const sgn;
		val (g, b) = dest_app a;
		val (n, _) = dest_const g;
	in	if s = minusn andalso n = ℤintn then @~(dest_ℕ b)
			else term_fail "dest_ℤ_signed_int" 93110 [tm]
	end
	)	handle Fail _ => (
		term_fail "dest_ℤ_signed_int" 93110 [tm]
	)
);
=TEX
=SML
val ⦏is_ℤ_≤⦎ = is_bin_op (fst(dest_const ⌜$≤⋎Z⌝));
val ⦏is_ℤ_≥⦎ = is_bin_op (fst(dest_const ⌜$≥⋎Z⌝));
val ⦏is_ℤ_less⦎ = is_bin_op (fst(dest_const ⌜$<⋎Z⌝));
val ⦏is_ℤ_greater⦎ = is_bin_op (fst(dest_const ⌜$>⋎Z⌝));
val ⦏is_ℤ_plus⦎ = is_bin_op (fst(dest_const ⌜$+⋎Z⌝));
val ⦏is_ℤ_subtract⦎ = is_bin_op (fst(dest_const ⌜$-⋎Z⌝));
val ⦏is_ℤ_times⦎ = is_bin_op (fst(dest_const ⌜$*⋎Z⌝));
val ⦏is_ℤ_mod⦎ = is_bin_op (fst(dest_const ⌜$Mod⋎Z⌝));
val ⦏is_ℤ_div⦎ = is_bin_op (fst(dest_const ⌜$Div⋎Z⌝));
=TEX
=SML
fun ⦏is_ℤ_minus⦎ (tm : TERM) : bool = (
	(dest_ℤ_minus tm; true) handle Fail _ => false
);
=TEX
=SML
fun ⦏is_ℤ_abs⦎ (tm : TERM) : bool = (
	(dest_ℤ_abs tm; true) handle Fail _ => false
);
=TEX
=SML
fun ⦏is_ℤ_signed_int⦎ (tm : TERM) : bool = (
	(dest_ℤ_signed_int tm; true) handle Fail _ => false
);
=TEX
=SML
fun ⦏mk_ℤ_simple_bin_op⦎ (tm : TERM) : TERM * TERM -> TERM = (fn (a1, a2) =>
	mk_app(mk_app(tm, a1), a2)
);
=TEX
=SML
val ℤ_ty = ⓣℤ⌝;
fun ⦏mk_ℤ_bin_op⦎ (area : string) (tm : TERM) : (TERM * TERM) -> TERM = (
	let val f = mk_ℤ_simple_bin_op tm;
	in (fn tt as (t1, t2) => (
		if	type_of t1 =: ℤ_ty
		then 	if	type_of t2 =: ℤ_ty
			then	f tt
			else term_fail area 93201 [t2]
		else	term_fail area 93201 [t1]
	))
	end
);
=TEX
=SML
val ⦏mk_ℤ_≤⦎ = mk_ℤ_bin_op "mk_ℤ_≤" ⌜$≤⋎Z⌝;
val ⦏mk_ℤ_≥⦎ = mk_ℤ_bin_op "mk_ℤ_≥" ⌜$≥⋎Z⌝;
val ⦏mk_ℤ_less⦎ = mk_ℤ_bin_op "mk_ℤ_less" ⌜$<⋎Z⌝;
val ⦏mk_ℤ_greater⦎ = mk_ℤ_bin_op "mk_ℤ_greater" ⌜$>⋎Z⌝;
val ⦏mk_ℤ_plus⦎ = mk_ℤ_bin_op "mk_ℤ_plus" ⌜$+⋎Z⌝;
val ⦏mk_ℤ_subtract⦎ = mk_ℤ_bin_op "mk_ℤ_subtract" ⌜$-⋎Z⌝;
val ⦏mk_ℤ_times⦎ = mk_ℤ_bin_op "mk_ℤ_times" ⌜$*⋎Z⌝;
val ⦏mk_ℤ_mod⦎ = mk_ℤ_bin_op "mk_ℤ_mod" ⌜$Mod⋎Z⌝;
val ⦏mk_ℤ_div⦎ = mk_ℤ_bin_op "mk_ℤ_div" ⌜$Div⋎Z⌝;
=TEX
=SML
fun ⦏mk_ℤ_minus⦎ (tm : TERM) : TERM = (
	if type_of tm =: ⓣℤ⌝ then mk_app (minus, tm)
			else term_fail "mk_ℤ_minus" 93201 [tm]
);
=TEX
=SML
fun ⦏mk_ℤ_abs⦎ (tm : TERM) : TERM = (
	if type_of tm =: ⓣℤ⌝ then mk_app (ℤabs, tm)
			else term_fail "mk_ℤ_abs" 93201 [tm]
);
=TEX
=SML
fun ⦏mk_ℤ_signed_int⦎ (i : INTEGER) : TERM = (
	(mk_app (ℤint, (mk_ℕ i)))
	handle ex => mk_app(minus, mk_app (ℤint, (mk_ℕ (@~i))))
);
=TEX
\section{ADDITIONAL INDUCTION PRINCIPLES}
=TEX
The following two induction theorems and corresponding tactics bring
the HOL support for induction up to the level provided for Z.
They should go somewhere in the {\ProductHOL} proof support tools.
(E.g., in the document that introduces the linear arithmetic
decision procedure for the integers).

First induction from an arbitrary starting point in the integers.
=SML
val ⦏ℤ_≤_induction_thm⦎ = (
set_goal([], ⌜∀j p⦁ p j ∧ (∀i⦁ j ≤ i ∧ p i ⇒ p (i + ℕℤ 1)) ⇒ (∀i⦁j ≤ i ⇒ p i)⌝);
a(REPEAT strip_tac);
a(lemma_tac ⌜∀k⦁ℕℤ 0 ≤ k ⇒ p(j + k)⌝);
(* *** Goal "1" *** *)
a(REPEAT ∀_tac);
a(ℤ_ℕ_induction_tac);
(* *** Goal "1.1" *** *)
a(asm_rewrite_tac[ℤ_plus_clauses]);
(* *** Goal "1.2" *** *)
a(LEMMA_T⌜j ≤ j + i'⌝ asm_tac THEN1 asm_rewrite_tac[ℤ_≤_clauses]);
a(PC_T1 "basic_hol" all_asm_fc_tac[]);
a(POP_ASM_T ante_tac THEN rewrite_tac[ℤ_plus_assoc_thm]);
(* *** Goal "2" *** *)
a(GET_ASM_T ⌜j ≤ i⌝ (strip_asm_tac o
	rewrite_rule[ℤ_minus_clauses] o
	once_rewrite_rule[conv_rule (ONCE_MAP_C eq_sym_conv) ℤ_minus_≤_thm] o
	once_rewrite_rule[ℤ_≤_≤_0_thm]));
a(all_asm_fc_tac[]);
a(POP_ASM_T ante_tac THEN rewrite_tac[∀_elim⌜i⌝ ℤ_plus_order_thm, ℤ_minus_clauses,
	ℤ_plus_clauses]);
save_pop_thm"ℤ_≤_induction_thm"
);
=TEX
=SML
fun ⦏ℤ_≤_induction_tac⦎ (tm : TERM) : TACTIC = (
	if not (is_var tm andalso type_of tm =: ⓣℤ⌝)
	then term_fail "ℤ_≤_induction_tac" 93401 [tm]
	else ( fn(asms, conc) =>
	let	val asm = find asms (fn t => is_ℤ_≤ t andalso snd(dest_ℤ_≤ t) =$ tm)
			handle Fail _ => fail "ℤ_≤_induction_tac" 93402 [];
		val thm = ∀_elim (fst(dest_ℤ_≤ asm)) ℤ_≤_induction_thm;
	in	if not (is_free_in tm conc)
			then term_fail "ℤ_≤_induction_tac" 93403 [tm]
		else if any (asms drop (fn t => t =$ asm)) (is_free_in tm)
			then term_fail "ℤ_≤_induction_tac" 93404 [tm]
		else	(asm_ante_tac asm THEN gen_induction_tac1 thm) (asms, conc)
	end
	)
);
=TEX
Second, course-of-values induction, again starting from an arbitrary point.
=SML
val ⦏ℤ_cov_induction_thm⦎ = (
set_goal([], ⌜∀j : ℤ; p⦁ (∀i⦁ j ≤ i ∧ (∀k⦁j ≤ k ∧ k < i ⇒ p k) ⇒ p i) ⇒ (∀i⦁j ≤ i ⇒ p i)⌝);
a(REPEAT strip_tac);
a(lemma_tac⌜∀ k⦁ j ≤ k ∧ k < i ⇒ p k⌝);
(* *** Goal "1" *** *)
a(ℤ_≤_induction_tac⌜i⌝);
(* *** Goal "1.1" *** *)
a(REPEAT strip_tac);
a(lemma_tac ⌜j < j⌝ THEN_LIST [id_tac, all_fc_tac[ℤ_less_irrefl_thm]]);
a(bc_thm_tac ℤ_≤_less_trans_thm THEN ∃_tac⌜k⌝ THEN REPEAT strip_tac);
(* *** Goal "1.2" *** *)
a(REPEAT strip_tac);
a(strip_asm_tac (list_∀_elim[⌜k⌝, ⌜i⌝]ℤ_less_cases_thm) THEN1 all_asm_fc_tac[]);
(* *** Goal "1.2.1" *** *)
a(all_asm_fc_tac[] THEN asm_rewrite_tac[]);
(* *** Goal "1.2.2" *** *)
a(POP_ASM_T ante_tac THEN POP_ASM_T ante_tac THEN rewrite_tac[ℤ_less_def, ℤ_≤_clauses]);
a(REPEAT strip_tac);
a(LEMMA_T ⌜i + ℕℤ 1 ≤ i⌝ ante_tac THEN_LIST [id_tac, rewrite_tac[ℤ_≤_clauses]]);
a(bc_thm_tac ℤ_≤_trans_thm THEN ∃_tac⌜k⌝ THEN REPEAT strip_tac);
(* *** Goal "2" *** *)
a(all_asm_fc_tac[]);
save_pop_thm"ℤ_cov_induction_thm"
);
=TEX
=SML
fun ⦏ℤ_cov_induction_tac⦎ (tm : TERM) : TACTIC = (
	if not (is_var tm andalso type_of tm =: ⓣℤ⌝)
	then term_fail "ℤ_cov_induction_tac" 93401 [tm]
	else ( fn(asms, conc) =>
	let	val asm = find asms (fn t => is_ℤ_≤ t andalso snd(dest_ℤ_≤ t) =$ tm)
			handle Fail _ => fail "ℤ_cov_induction_tac" 93402 [];
		val thm = ∀_elim (fst(dest_ℤ_≤ asm)) ℤ_cov_induction_thm;
	in	if not (is_free_in tm conc)
			then term_fail "ℤ_cov_induction_tac" 93403 [tm]
		else if any (asms drop (fn t => t =$ asm)) (is_free_in tm)
			then term_fail "ℤ_cov_induction_tac" 93404 [tm]
		else	(asm_ante_tac asm THEN gen_induction_tac1 thm) (asms, conc)
	end
	)
);
=TEX

=TEX
\section{CONVERSIONS}
=SML
val _ = set_pc "predicates";
val ⦏ℤ_plus_eg⦎ = ⌜i + j:ℤ⌝;
val ⦏ℤ_times_eg⦎ = ⌜i * j:ℤ⌝;
val ⦏ℤ_subtract_eg⦎ = ⌜i - j:ℤ⌝;
val ⦏ℤ_greater_eg⦎ = ⌜i > j:ℤ⌝;
val ⦏ℤ_≥_eg⦎ = ⌜i ≥ j:ℤ⌝;
val ⦏ℤ_∈_ℕ_eg⦎ = ⌜ℕℤ 0 ≤ ℕℤ i⌝;
val ⦏ℤ_abs_eg⦎ = ⌜Abs i:ℤ⌝;
val ⦏ℤ_mod_eg⦎ = ⌜i Mod j:ℤ⌝;
val ⦏ℤ_less_eg⦎ = ⌜i < j:ℤ⌝;
val ⦏ℤ_div_eg⦎ = ⌜i Div j:ℤ⌝;
val ⦏ℤ_≤_eg⦎ = ⌜i ≤ j:ℤ⌝;
val ⦏ℤ_eq_eg⦎ = ⌜i = j:ℤ⌝;
=TEX
=SML
fun ⦏accept_conv⦎ (thm : THM) : CONV = (fn tm =>
	if	(fst(dest_eq (concl thm)) =$ tm) handle Fail _ => false
	then	thm
	else	fail_conv tm
);
=TEX
=SML
val ⦏ℤ_ℕ_plus_conv_thm⦎ = (
set_goal([], ⌜∀ m n k ⦁ m + n = k ⇒ ℕℤ m + ℕℤ n = ℕℤ k⌝);
a (REPEAT strip_tac);
a (asm_rewrite_tac [ℕℤ_plus_homomorphism_thm1, ℕℤ_one_one_thm]);
pop_thm()
);
=TEX
=SML
val ⦏ℤ_ℕ_plus_conv⦎ : CONV = (fn tm =>
	let	val ((_, hol_op1), (_, hol_op2)) =
			((dest_app ** dest_app)(dest_ℤ_plus tm))
			handle Fail _ => term_fail "ℤ_ℕ_plus_conv" 93303 [tm, ℤ_plus_eg];
		val thm1 = (plus_conv (mk_plus (hol_op1, hol_op2)))
			handle Fail _ => term_fail "ℤ_ℕ_plus_conv" 93303 [tm, ℤ_plus_eg];
		val thm2 = simple_⇒_match_mp_rule ℤ_ℕ_plus_conv_thm thm1
			handle ex => reraise ex "ℤ_ℕ_plus_conv";
	in	(accept_conv thm2 tm)
		handle Fail _ => term_fail "ℤ_ℕ_plus_conv" 93303 [tm, ℤ_plus_eg]
	end
);
=TEX
=SML
val ⦏ℤ_ℕ_times_conv_thm⦎ = (
set_goal([], ⌜∀ m n k ⦁ m * n = k ⇒ ℕℤ m * ℕℤ n = ℕℤ k⌝);
a (REPEAT strip_tac);
a (asm_rewrite_tac [ℕℤ_times_homomorphism_thm1, ℕℤ_one_one_thm]);
pop_thm()
);
=TEX
=SML
val ⦏ℤ_ℕ_times_conv⦎ : CONV = (fn tm =>
	let	val ((_, hol_op1), (_, hol_op2)) =
			((dest_app ** dest_app)(dest_ℤ_times tm))
			handle Fail _ => term_fail "ℤ_ℕ_times_conv" 93301 [tm, ℤ_times_eg];
		val thm1 = (times_conv (mk_times (hol_op1, hol_op2)))
			handle Fail _ => term_fail "ℤ_ℕ_times_conv" 93301 [tm, ℤ_times_eg];
		val thm2 = simple_⇒_match_mp_rule ℤ_ℕ_times_conv_thm thm1
			handle ex => reraise ex "ℤ_ℕ_times_conv";
	in	(accept_conv thm2 tm)
		handle Fail _ => term_fail "ℤ_ℕ_times_conv" 93301 [tm, ℤ_times_eg]
	end
);
=TEX
=SML
val ⦏ℤ_subtract_minus_conv_thm⦎ = (
set_goal([], ⌜∀ m n : ℤ ⦁ m - n = m + ~n⌝);
a (rewrite_tac[get_spec⌜$-⋎Z⌝]);
pop_thm()
);
=TEX
=SML
val ⦏ℤ_subtract_minus_conv⦎ : CONV = (fn tm =>
	(simple_eq_match_conv ℤ_subtract_minus_conv_thm tm)
	handle Fail _ => term_fail "ℤ_subtract_minus_conv" 93302 [tm, ℤ_subtract_eg]
);
=TEX
=SML
val ⦏ℤ_greater_less_conv_thm⦎ = (
set_goal([], ⌜∀ i j : ℤ ⦁ i > j ⇔ j < i⌝);
a (REPEAT ∀_tac);
a (rewrite_tac [get_spec ⌜$>⋎Z⌝]);
pop_thm()
);
=TEX
=SML
val ⦏ℤ_greater_less_conv⦎ : CONV = (fn tm =>
	((simple_eq_match_conv ℤ_greater_less_conv_thm) tm)
	handle Fail _ => term_fail "ℤ_greater_less_conv" 93302 [tm, ℤ_greater_eg]
);
=TEX
=SML
val ⦏ℤ_≥_≤_conv_thm⦎ = (
set_goal([], ⌜∀ i j : ℤ ⦁ i ≥ j ⇔ j ≤ i⌝);
a (REPEAT ∀_tac);
a (rewrite_tac[get_spec ⌜$≥⋎Z⌝]);
pop_thm()
);
=TEX
=SML
val ⦏ℤ_≥_≤_conv⦎ : CONV = (fn tm =>
	((simple_eq_match_conv ℤ_≥_≤_conv_thm) tm)
	handle Fail _ => term_fail "ℤ_≥_≤_conv" 93302 [tm, ℤ_≥_eg]
);
=TEX
=SML
val ⦏ℤ_plus_conv_thm⦎ = (
set_goal([], ⌜∀ k m n ⦁
	(m + n = k ⇒ ℕℤ m + ℕℤ n = ℕℤ k)
∧	T
∧	(n + k = m ⇒ ℕℤ m + ~ (ℕℤ n) = ℕℤ k)
∧	(m + k = n ⇒ ℕℤ m + ~ (ℕℤ n) = ~ (ℕℤ k))
∧	(m + k = n ⇒ ~ (ℕℤ m) + ℕℤ n = ℕℤ k)
∧	(n + k = m ⇒ ~ (ℕℤ m) + ℕℤ n = ~ (ℕℤ k))
∧	T
∧	(m + n = k ⇒ ~ (ℕℤ m) + ~ (ℕℤ n) = ~ (ℕℤ k))
⌝);
a (REPEAT strip_tac
	THEN POP_ASM_T (rewrite_thm_tac o eq_sym_rule)
	THEN rewrite_tac[ℕℤ_plus_homomorphism_thm, ℤ_minus_clauses]);
(* *** Goal "1" *** *)
a (rewrite_tac [∀_elim ⌜ℕℤ k⌝ ℤ_plus_order_thm, ℤ_minus_clauses, ℤ_plus0_thm]);
(* *** Goal "2" *** *)
a (rewrite_tac [∀_elim ⌜~ (ℕℤ k)⌝ ℤ_plus_order_thm, ℤ_minus_clauses, ℤ_plus0_thm]);
(* *** Goal "3" *** *)
a (rewrite_tac [∀_elim ⌜ℕℤ k⌝ ℤ_plus_order_thm, ℤ_minus_clauses, ℤ_plus0_thm]);
(* *** Goal "4" *** *)
a (rewrite_tac [∀_elim ⌜~ (ℕℤ k)⌝ ℤ_plus_order_thm, ℤ_minus_clauses, ℤ_plus0_thm]);
pop_thm()
);
=TEX
=SML
local
open PPVector;
val ⦏ℤ_plus_conv_thms_forms⦎ : (THM * (INTEGER*INTEGER -> INTEGER)) vector = vector(combine
	(map (list_∀_intro [⌜m : ℕ⌝, ⌜n : ℕ⌝, ⌜k: ℕ⌝])
		(strip_∧_rule (all_∀_elim ℤ_plus_conv_thm)))
	([op @+, op @+, op @-, op @- o swap, op @- o swap, op @-, op @+, op @+]
				: (INTEGER*INTEGER -> INTEGER) list)
);
val ⦏plus_minus0_thm⦎ = prove_rule[ℤ_plus0_thm, ℤ_minus_thm] ⌜∀ i ⦁ i + ~ (ℕℤ 0) = i⌝;
val ⦏minus0_plus_thm⦎ = prove_rule[ℤ_plus0_thm, ℤ_minus_thm] ⌜∀ j ⦁ ~ (ℕℤ 0) + j = j⌝;
fun ⦏make_plus_conv_thm⦎ (i : INTEGER) (j : INTEGER) : THM = (
	let	val m = iabs i;
		val n = iabs j;
		val ix =	(if i @< zero then 4 else 0) +
				(if j @< zero then 2 else 0) +
				(if i @+ j @< zero then 1 else 0);
		val (thm1, f) = sub(ℤ_plus_conv_thms_forms, ix);
		val mt = mk_ℕ m;
		val nt = mk_ℕ n;
		val kt = mk_ℕ (f(m,n));
		val thm2 = list_simple_∀_elim [mt, nt, kt] thm1;
		val tm = (fst o dest_eq o fst o dest_⇒ o concl) thm2;
	in ⇒_mp_rule thm2 (plus_conv tm)
	end
);
in
val ⦏ℤ_plus_conv⦎ : CONV = (fn tm =>
	let	val (itm, jtm) = (dest_ℤ_plus tm);
		val i = dest_ℤ_signed_int itm;
		val j = dest_ℤ_signed_int jtm;
	in	(accept_conv (make_plus_conv_thm i j)
		ORELSE_C
		(fn t =>
		(if	j = zero
		then	accept_conv (simple_∀_elim itm plus_minus0_thm)
		else	fail_conv) t)
		ORELSE_C
		(fn t =>
		(if	i = zero
		then	accept_conv (simple_∀_elim jtm minus0_plus_thm)
		else	fail_conv) t)) tm
	end	handle Fail _ => term_fail "ℤ_plus_conv" 93303 [tm, ℤ_plus_eg]
);
end;
=TEX
=SML
local
open PPVector;
val ⦏times_convs⦎ : ((CONV -> CONV) * CONV) vector = vector(
	combine
	[RAND_C, RAND_C, Combinators.I]
	(map (simple_eq_match_conv o prove_rule[ℤ_times_minus_thm])
	[	⌜∀ i j : ℤ ⦁ i * ~j = ~(i * j)⌝,
		⌜∀ i j : ℤ ⦁ ~i * j = ~(i * j)⌝,
		⌜∀ i j : ℤ ⦁ ~i * ~j = i * j⌝]));
in
val ⦏ℤ_times_conv⦎ : CONV = (fn tm =>
	let	val (itm, jtm) = (dest_ℤ_times tm);
		val ix =	(if is_ℤ_minus itm then 2 else 0) +
				(if is_ℤ_minus jtm then 1 else 0);
	in	(if ix = 0
		then ℤ_ℕ_times_conv
		else	let val (f, c) = sub (times_convs, ix - 1)
			in c THEN_C f ℤ_ℕ_times_conv
			end) tm
	end	handle Fail _ => term_fail "ℤ_times_conv" 93303 [tm, ℤ_times_eg]
);
end;
=TEX
=SML
local
val ⦏ℤ_abs_conv_lemma⦎ = prove_rule [ℕℤ_≤_thm, ≤_clauses] ⌜∀ m ⦁ ℕℤ 0 ≤ ℕℤ m⌝;
in
val ⦏ℤ_abs_conv⦎ : CONV = (fn tm =>
	let	val arg_tm = hd(snd(strip_app tm));
		val (itm, is_neg) = (dest_ℤ_minus arg_tm, true)
				handle Fail _ => (arg_tm, false);
		val i = snd(dest_app itm);
		val chk = dest_ℕ i;
		val thm1 = ∀_elim itm ℤ_abs_thm;
		val thm2 = simple_∀_elim i ℤ_abs_conv_lemma;
		val thm3 = ⇒_mp_rule thm1 thm2;
	in	accept_conv
		(if is_neg	then ∧_right_elim thm3
				else ∧_left_elim thm3) tm
	end	handle Fail _ => term_fail "ℤ_abs_conv" 93303 [tm, ℤ_abs_eg]
);
end;
=TEX
=SML
val ⦏ℤ_div_mod_conv_thm⦎ = (
set_goal([], ⌜∀ i j d r : ℤ ⦁	d * j + r = i ∧ ℕℤ 0 ≤ r ∧ r < Abs j
			⇒	i Div j = d ∧ i Mod j = r	⌝);
a (conv_tac (ONCE_MAP_C eq_sym_conv) THEN REPEAT_UNTIL is_∧ strip_tac);
a (lemma_tac ⌜¬j = ℕℤ 0⌝);
(* *** Goal "1" *** *)
a (swap_asm_concl_tac ⌜r < Abs j⌝ THEN asm_rewrite_tac[]);
a (asm_rewrite_tac [get_spec ⌜$Abs⋎Z⌝, ℤ_≤_clauses, ℤ_¬_less_thm]);
(* *** Goal "2" *** *)
a(ALL_FC_T rewrite_tac [ℤ_div_mod_unique_thm]);
pop_thm()
);
=TEX
=SML
val ⦏ℤ_≤_conv_thm1⦎ = (
set_goal ([], ⌜∀ m n ⦁ ℕℤ m ≤ ℕℤ n ⇔ m ≤ n⌝);
a (rewrite_tac [get_spec ⌜ℕℤ 0 ≤ ℕℤ 1⌝, get_spec ⌜0 ≤ 1⌝] THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a (POP_ASM_T ante_tac);
a (rewrite_tac [ℕℤ_plus_homomorphism_thm1, ℕℤ_one_one_thm]);
a (strip_tac THEN ∃_tac ⌜m'⌝ THEN asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a (rewrite_tac [ℕℤ_plus_homomorphism_thm1, ℕℤ_one_one_thm]);
a (∃_tac ⌜i⌝ THEN asm_rewrite_tac[]);
pop_thm()
);
=TEX
=SML
val ⦏ℤ_≤_conv_thm2⦎ = (
set_goal([], ⌜∀ i j k : ℤ ⦁ i ≤ j ⇔ i + k ≤ j + k⌝);
a (REPEAT ∀_tac);
a (rewrite_tac[ℤ_≤_clauses]);
pop_thm()
);
=TEX
=SML
val ⦏ℤ_≤_conv⦎ : CONV =(fn tm =>
	let	val (itm, jtm) = dest_ℤ_≤ tm;
		val i = dest_ℤ_signed_int itm;
		val j = dest_ℤ_signed_int jtm;
		val min = if i @< j then i else j;
		val k = if min @< zero then iabs min else zero;
		val ktm = mk_ℤ_signed_int k;
	in	(accept_conv(list_simple_∀_elim[itm, jtm, ktm] ℤ_≤_conv_thm2)
		THEN_C RANDS_C ℤ_plus_conv
		THEN_C simple_eq_match_conv ℤ_≤_conv_thm1
		THEN_C ≤_conv) tm
	end	handle Fail _ => term_fail "ℤ_≤_conv" 93303 [tm, ℤ_≤_eg]
);
=TEX
=SML
val ⦏ℤ_less_conv_thm⦎ = (
set_goal([], ⌜∀ i j : ℤ ⦁ i < j ⇔ i + ℕℤ 1 ≤ j⌝);
a (REPEAT ∀_tac);
a (rewrite_tac [get_spec ⌜ℕℤ 0 ≤ ℕℤ 1⌝, get_spec ⌜ℕℤ 0 < ℕℤ 1⌝]);
pop_thm()
);
=TEX
=SML
val ⦏ℤ_less_conv⦎ : CONV = (fn tm =>
	((eq_match_conv ℤ_less_conv_thm
	THEN_C LEFT_C ℤ_plus_conv
	THEN_C ℤ_≤_conv) tm)
	handle Fail _ => term_fail "ℤ_less_conv" 93303 [tm, ℤ_less_eg]
);
=TEX
=SML
local
infix 7 ℤdiv ℤmod;
fun (i : INTEGER) ⦏ℤmod⦎ (j : INTEGER) : INTEGER = (
	let	val mlm = i imod j;
	in	if mlm @>= zero
		then mlm
		else mlm @- j
	end
);
fun (i : INTEGER) ⦏ℤdiv⦎ (j : INTEGER) : INTEGER = (
	let	val zm = i ℤmod j;
	in	(i @- zm) idiv j
	end
);
val ⦏mk_ℤ0⦎ = ⌜ℕℤ 0⌝;
fun ⦏ℤ_div_mod_conv⦎ (is_div : bool): TERM * TERM -> THM = (fn (itm, jtm) =>
	let	val i = dest_ℤ_signed_int itm;
		val j = dest_ℤ_signed_int jtm;
		val dtm = mk_ℤ_signed_int (i ℤdiv j);
		val rtm = mk_ℤ_signed_int (i ℤmod j);
		val thm1 = (LEFT_C ℤ_times_conv THEN_C ℤ_plus_conv)
			(mk_ℤ_plus(mk_ℤ_times (dtm, jtm), rtm));
		val thm2 = ⇔_t_elim (ℤ_≤_conv (mk_ℤ_≤(mk_ℤ0, rtm)));
		val thm3 = ⇔_t_elim
			((RIGHT_C ℤ_abs_conv THEN_C ℤ_less_conv)
			(mk_ℤ_less (rtm, mk_ℤ_abs jtm)));
		val thm4 = ⇒_mp_rule
			(list_simple_∀_elim[itm, jtm, dtm, rtm] ℤ_div_mod_conv_thm)
			(list_∧_intro [thm1, thm2, thm3]);
	in	(if is_div
		then ∧_left_elim else ∧_right_elim) thm4
	end
);
in
val ⦏ℤ_div_conv⦎ : CONV = (fn tm =>
	let	val (itm, jtm) = dest_ℤ_div tm;
	in	if jtm =$ mk_ℤ0
		then	term_fail "ℤ_div_conv" 93303 [tm, ℤ_div_eg]
		else	(accept_conv (ℤ_div_mod_conv true (dest_ℤ_div tm)) tm)
			handle Fail _ => term_fail "ℤ_div_conv" 57003 [tm]
	end
);
val ⦏ℤ_mod_conv⦎ : CONV = (fn tm =>
	let	val (itm, jtm) = dest_ℤ_mod tm;
	in	if jtm =$ mk_ℤ0
		then	term_fail "ℤ_mod_conv" 93303 [tm, ℤ_mod_eg]
		else	(accept_conv (ℤ_div_mod_conv false (dest_ℤ_mod tm)) tm)
			handle Fail _ => term_fail "ℤ_mod_conv" 57007 [tm]
	end
);
end;
=TEX
=SML
val ⦏ℤ_minus0_thm⦎ = (
set_goal([], ⌜~ (ℕℤ 0) = ℕℤ 0⌝);
a (rewrite_tac [ℤ_minus_thm]);
pop_thm()
);
=TEX
=SML
val ⦏ℤ_eq_conv_thm⦎ = (
set_goal([], ⌜∀ i j : ℤ ⦁ i < j ⇒ (i = j ⇔ F)⌝);
a (REPEAT strip_tac);
(* *** Goal "1" *** *)
a(asm_ante_tac⌜i < j⌝ THEN asm_rewrite_tac[ℤ_less_clauses]);
(* *** Goal "2" *** *)
pop_thm()
);
=TEX
=SML
val ⦏ℤ_eq_conv⦎ : CONV = (fn tm =>
	let	val (itm, jtm) = dest_eq tm;
		val i = dest_ℤ_signed_int itm;
		val j = dest_ℤ_signed_int jtm;
	in	(if i @< j
		then	rewrite_conv [simple_⇒_match_mp_rule ℤ_eq_conv_thm
				(⇔_t_elim(ℤ_less_conv(mk_ℤ_less(itm, jtm))))]
		else if i = j
		then		LEFT_C (simple_eq_match_conv ℤ_minus0_thm)
			AND_OR_C RIGHT_C (simple_eq_match_conv ℤ_minus0_thm)
			AND_OR_C accept_conv (⇔_t_intro (refl_conv (mk_ℤ_signed_int i)))
		else (* i > j *)
				eq_sym_conv
			THEN_C accept_conv(simple_⇒_match_mp_rule ℤ_eq_conv_thm
				(⇔_t_elim (ℤ_less_conv (mk_ℤ_less (jtm, itm))))))
		tm
	end
);
=TEX
\section{PROOF CONTEXTS}
=SML
fun ⦏thms_to_eqn_cxt⦎ (thms:THM list) : EQN_CXT = (
	flat(map (cthm_eqn_cxt (current_ad_rw_canon())) thms)
);
=TEX
=SML
val _ = delete_pc "'ℤ" handle Fail _ => ();
val _ = new_pc "'ℤ";
val _ = set_rw_eqn_cxt
		[	(⌜i +⋎Z j⌝, ℤ_plus_conv),
			(⌜i *⋎Z j⌝, ℤ_times_conv),
			(⌜i -⋎Z j⌝, ℤ_subtract_minus_conv),
			(⌜Abs⋎Z i⌝, ℤ_abs_conv),
			(⌜i Div⋎Z j⌝, ℤ_div_conv),
			(⌜i Mod⋎Z j⌝, ℤ_mod_conv),
			(⌜i = j⌝, ℤ_eq_conv),
			(⌜i ≤⋎Z j⌝, ℤ_≤_conv),
			(⌜i <⋎Z j⌝, ℤ_less_conv),
			(⌜i ≥⋎Z j⌝, ℤ_≥_≤_conv),
			(⌜i >⋎Z j⌝, ℤ_greater_less_conv)
		] "'ℤ";
val _ = add_rw_thms [ℤ_plus_clauses, ℤ_minus_clauses, ℤ_≤_clauses,
			ℤ_less_clauses, ℤ_times_clauses, ℤ_¬_≤_thm,
			ℤ_¬_less_thm]
	"'ℤ";
val ⦏pos⦎ = (thms_to_eqn_cxt [ℤ_minus_clauses, ℤ_≤_clauses, ℤ_less_clauses]) @
		[	(⌜i = j⌝, ℤ_eq_conv),
			(⌜i ≥⋎Z j⌝, ℤ_≥_≤_conv),
			(⌜i >⋎Z j⌝, ℤ_greater_less_conv)];
val ⦏neg⦎ = mapfilter (mk_¬ ** RAND_C) pos;
val ⦏neutral⦎ = thms_to_eqn_cxt [ℤ_¬_≤_thm, ℤ_¬_less_thm] @
		[(⌜i ≤⋎Z j⌝, ℤ_≤_conv), (⌜i <⋎Z j⌝, ℤ_less_conv)];
val ⦏strip_eqn_cxt⦎ = neutral @ pos @ neg;
val _ = set_st_eqn_cxt strip_eqn_cxt "'ℤ";
val _ = set_sc_eqn_cxt strip_eqn_cxt "'ℤ";
val _ = set_pr_tac basic_prove_tac "'ℤ";
val _ = set_pr_conv basic_prove_conv "'ℤ";
val _ = commit_pc "'ℤ";
=TEX
\section{EPILOG}
The structure is opened in IMP105 so that the proof support defined in that document can be used to prove additional theorems in this structure.
=SML
end (* of structure ℤ *);
=TEX
\twocolumn[\section{INDEX}]
\small
\printindex

\end{document}


=IGN
********************************************************************************
imp039.doc: this file is part of the PPHol system

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

\def\Title{Implementation of the Theory of Lists}

\def\AbstractText{The theory of lists for ICL HOL is implemented.}

\def\Reference{DS/FMU/IED/IMP039}

\def\Author{D.J. King}


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
%% LaTeX2e port: \TPPproject{FORMAL METHODS UNIT}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Implementation of the Theory of Lists}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP039}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.21 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2002/10/17 16:20:01 $
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{D.J.~King & WIN01}  %% Mandatory field
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{The theory of lists for ICL HOL is implemented.}
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
\section{DOCUMENT CONTROL}
\subsection{Contents List}
\tableofcontents
\subsection{Document Cross References}
\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes History}
\begin{description}
\item [Issue 1.1 (1991/08/30)-1.8 (1991/10/08)] Initial drafts.
\item [Issue 1.9 (1991/10/15) (15 October 1991)] Amended in accordance
with the changes of the names of theorems in the theory
of numbers.
\item [Issue 1.10 (1991/10/17) (17 October 1991)]
Added $fun\_rel\_lemma$ to correct a failed load.
\item[Issue 1.11 (1991/11/25) (22 November 1991)]
Draft for review.
\item[Issue 1.12 (1991/11/25) (22 November 1991)]
Changed the title of the document.

\item[Issue 1.13 (1992/01/20), \FormatDate{92/01/20} ] Updated to use new fonts.
\item[Issue 1.14 (1992/01/27) (23rd January 1992)]
$new\_axiom$, $simple\_new\_type\_defn$, $new\_type\_defn$
all changed to take lists of keys, rather than single ones.
item[Issue 1.15 (27th January 1992)]
Corrected some arithmentic theorem names.
\item [Issue 1.16 (1992/04/14) (13th April 1992)]
Changes due to CR0017.
\item [Issue 1.17 (1992/05/14),1.18 (1992/05/21) (14th May 1992)]
Tidying up proof contexts.
\item[Issue 1.19 (1992/06/24) (24th June 1992)]
Renamings from issue 1.6 of \cite{DS/FMU/IED/WRK038},
mostly proof context name changes.
\item[Issue 1.20 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.21 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.22 (2014/04/14)] Now uses $new\_spec1$ rather than $new\_spec$.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
None.
\pagebreak
\section{GENERAL}
\subsection{Scope}
This document contains parts of the ICL HOL
proof development system called for in \cite{DS/FMU/IED/HLD011} and is an implementation of the
design for the theory of lists in \cite{DS/FMU/IED/DTD039}.

\subsection{Introduction}

The implementation of lists first introduces the
type of lists. Basic definitions of operators are provided
e.g., as $Hd$ (head of a list), $Append$ (append one list
to another). A list induction tactic and
a related tactical are also provided.

\section{PROLOGUE}
In this section we create the new theory and begin the structure which
contains the theory.

=SML
structure ⦏List⦎ : List = struct
=TEX
=SML
val _ = open_theory "ℕ";
val _ = new_theory "list";
val _ = push_merge_pcs ["'propositions","'simple_abstractions"];
=TEX
It turns out to be slightly more convenient to have available
the following trivial consequence of $fun\_rel\_thm$:
=SML
val ⦏fun_rel_lemma⦎ = (
push_goal([], ⌜∀r:'a→'b→BOOL⦁
	(∀x⦁∃y⦁r x y ∧ ∀z⦁r x z ⇒ z = y) ⇒ (∃f⦁∀x y⦁(f x = y) = r x y)
⌝);
=TEX
=SML
a(rewrite_tac[fun_rel_thm]);
pop_thm()
);
=TEX
Next lemma is also required.
=SML
val ⦏less_⇒_less_plus_1_thm⦎ = (
push_goal([],⌜∀i m n⦁  m < n ⇒ m < n + i⌝);
a(strip_tac THEN induction_tac⌜i:ℕ⌝);
(* *** Goal "1" *** *)
a(rewrite_tac[plus_clauses]);
(* *** Goal "2" *** *)
a(REPEAT strip_tac);
a(DROP_NTH_ASM_T 2 (strip_asm_tac o list_simple_∀_elim
	[⌜m':ℕ⌝,⌜n:ℕ⌝]));
a(DROP_ASMS_T (MAP_EVERY ante_tac) THEN rewrite_tac
	[less_def,≤_def,plus_assoc_thm1]THEN REPEAT strip_tac);
a(simple_∃_tac⌜i''+1⌝);
a(asm_rewrite_tac[plus_assoc_thm1]);
pop_thm()
);
=TEX
As is this...
=SML
val ⦏less_⇒_¬_less_thm⦎ = (
push_goal ([],⌜∀ m n⦁ m < n ⇒ ¬ n < m + 1⌝);
a(rewrite_tac[less_def,≤_def]);
a(REPEAT strip_tac);
a(POP_ASM_T (rewrite_thm_tac o eq_sym_rule));
a(rewrite_tac[plus_assoc_thm]);
a(rewrite_tac[plus_clauses]);
pop_thm()
);
=TEX
\section{INTRODUCING THE TYPE ``'a LIST''}
In this section,we define the type $'a\  LIST$.
First we prove the existence of a function mapping
a concrete representation of lists to bool.
=SML
val ⦏is_list_rep_thm⦎ = (
push_goal ([],⌜∃ IsListRep:((ℕ→'a)×ℕ)→BOOL ⦁
∃ nil:(ℕ→'a)×ℕ⦁∃ cons:'a→((ℕ→'a)×ℕ)→((ℕ→'a)×ℕ) ⦁
	(IsListRep nil) ∧
	(∀x⦁IsListRep x
		⇒ (∀h:'a⦁¬cons h x = nil)) ∧
	(∀x y⦁IsListRep x ∧ IsListRep y
		⇒ (∀a b⦁ cons a x = cons b y
			⇔ (a=b ∧ x=y))) ∧
	(∀x⦁IsListRep x
		⇒ (∀h:'a⦁IsListRep (cons h x))) ∧

	(∀p:((ℕ→'a)×ℕ)→BOOL ⦁ p nil ∧
		(∀m⦁ p m ⇒ (∀h⦁ p (cons h m)))
			⇒ (∀n⦁ IsListRep n ⇒ p n))
⌝);
a(simple_∃_tac ⌜λrep⦁∃f⦁∃n⦁
	rep=((λm:ℕ⦁(if m<n then (f:ℕ→'a) m
			else (εx:'a⦁T))),n:ℕ)⌝);
a(rewrite_tac[]);
a(MAP_EVERY simple_∃_tac [
	⌜(λm:ℕ⦁εe⦁T),0:ℕ⌝,
	⌜λh:'a⦁λt:(ℕ→'a)×ℕ⦁((λm:ℕ⦁
		if m = Snd t then h
		else ((Fst t)m)),
			(Snd t)+1)⌝]);
a(rewrite_tac[]);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(MAP_EVERY simple_∃_tac [⌜f:ℕ→'a⌝,⌜0⌝]);
a(rewrite_tac[less_clauses]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[pair_clauses] THEN REPEAT strip_tac);
a(POP_ASM_T ante_tac THEN rewrite_tac[plus_clauses]);
(* *** Goal "3" *** *)
a(POP_ASM_T ante_tac);
a(DROP_ASMS_T rewrite_tac);
a(rewrite_tac[pair_clauses]);
a(REPEAT strip_tac);
a(lemma_tac ⌜n:ℕ=n'⌝);
(* *** Goal "3.1" *** *)
a(POP_ASM_T ante_tac THEN asm_rewrite_tac[plus_clauses]);
(* *** Goal "3.2" *** *)
a(DROP_NTH_ASM_T 3 (ante_tac o rewrite_rule[ext_thm])
	THEN asm_rewrite_tac[]);
a(strip_tac THEN POP_ASM_T (ante_tac o simple_∀_elim⌜n':ℕ⌝)
	THEN rewrite_tac[]);
(* *** Goal "4" *** *)
a(POP_ASM_T ante_tac);
a(DROP_ASMS_T rewrite_tac);
a(rewrite_tac[pair_clauses]);
a(REPEAT strip_tac);
(* *** Goal "4.1" *** *)
a(lemma_tac ⌜n:ℕ=n'⌝);
(* *** Goal "4.1.1" *** *)
a(POP_ASM_T ante_tac THEN asm_rewrite_tac[plus_clauses]);
(* *** Goal "4.1.2" *** *)
a(DROP_NTH_ASM_T 3 (ante_tac o rewrite_rule[ext_thm])
	THEN asm_rewrite_tac[]);
a(rewrite_tac[ext_thm] THEN REPEAT strip_tac);
a(POP_ASM_T (ante_tac o simple_∀_elim⌜x:ℕ⌝));
a(cases_tac⌜x:ℕ=n'⌝ THEN asm_rewrite_tac[less_clauses]);
(* *** Goal "5" *** *)
a(asm_rewrite_tac[]);
(* *** Goal "6" *** *)
a(MAP_EVERY simple_∃_tac [⌜(λm⦁if m=n then h else f m):ℕ→'a⌝,⌜n+1:ℕ⌝]);
a(DROP_ASMS_T (fn x => asm_rewrite_tac (pair_clauses::x)));
a(rewrite_tac[ext_thm]);
a(strip_tac);
a(cases_tac⌜x:ℕ=n⌝ THEN asm_rewrite_tac[less_clauses]);
a(lemma_tac⌜n < n+1⌝);
(* *** Goal "6.1" *** *)
a(rewrite_tac[less_clauses]);
(* *** Goal "6.2" *** *)
a(cases_tac⌜x<n⌝ THEN asm_rewrite_tac[]);
(* *** Goal "6.2.1" *** *)
a(strip_asm_tac(list_simple_∀_elim[
	⌜1⌝,⌜x:ℕ⌝,⌜n:ℕ⌝]less_⇒_less_plus_1_thm));
a(asm_rewrite_tac[]);
(* *** Goal "6.2.2" *** *)
a(LEMMA_T ⌜¬x < n + 1⌝ rewrite_thm_tac);
(* Lemma proves the goal, so only lemma to do *)
a(LEMMA_T ⌜n < x⌝ (fn th => strip_asm_tac(
	simple_⇒_match_mp_rule less_⇒_¬_less_thm th)));
(* Lemma proves the goal, so only lemma to do *)
a(strip_asm_tac (list_simple_∀_elim[⌜x:ℕ⌝, ⌜n:ℕ⌝]less_cases_thm));
(* *** Goal "7" *** *)
a(POP_ASM_T rewrite_thm_tac);
a(induction_tac⌜n'⌝);
(* *** Goal "7.1" *** *)
a(asm_rewrite_tac[less_clauses]);
(* *** Goal "7.2" *** *)
a(DROP_NTH_ASM_T 2
	(strip_asm_tac o rewrite_rule[pair_clauses] o
	simple_∀_elim⌜((λ m'⦁ if m' < n' then f m' else ε x⦁ T), n')⌝));
a(LEMMA_T⌜	(λ m'⦁ if m' < n' + 1 then f m' else ε x⦁ T)
	=	(λ m'⦁ if m' = n' then f n' else if m' < n' then f m' else ε x⦁ T)⌝
	asm_rewrite_thm_tac);
(* Lemma proves the goal, so only lemma to do *)
a(rewrite_tac[ext_thm]);
a(strip_tac THEN cases_tac⌜x=n'⌝);
(* *** Goal "7.2.1" *** *)
a(asm_rewrite_tac[less_clauses]);
(* *** Goal "7.2.2" *** *)
a(asm_rewrite_tac[]);
a(cases_tac⌜x<n'⌝ THEN asm_rewrite_tac[]);
(* *** Goal "7.2.2.1" *** *)
a(strip_asm_tac (list_simple_∀_elim[⌜1⌝,⌜x⌝,⌜n'⌝]
	less_⇒_less_plus_1_thm));
a(asm_rewrite_tac[]);
(* *** Goal "7.2.2.2" *** *)
a(LEMMA_T ⌜¬ x < n' + 1⌝ rewrite_thm_tac);
(* Lemma proves the goal, so only lemma to do *)
a(strip_asm_tac (list_simple_∀_elim[⌜x⌝,⌜n'⌝]less_cases_thm));
a(strip_asm_tac (list_simple_∀_elim[⌜n'⌝,⌜x⌝]
	less_⇒_¬_less_thm));
pop_thm()
);
=TEX
=SML
val ⦏is_list_rep_def⦎ = new_spec1 (["IsListRep","is_list_rep_def"], ["IsListRep"], is_list_rep_thm);
=TEX
In order to use IsListRep, to define the new type,
we need to show that the subset of representation
type which it determines is non-empty.
=SML
val ⦏list_∃_thm⦎ = (
push_goal([],⌜∃x:(ℕ→'a)×ℕ ⦁ IsListRep x⌝);
a(strip_asm_tac is_list_rep_def);
a(simple_∃_tac⌜nil:(ℕ→'a)×ℕ⌝ THEN asm_rewrite_tac[]);
pop_thm()
);
=TEX
Now we can introduce the new type:
=SML
val ⦏list_def⦎ = new_type_defn(["LIST","list_def"],"LIST",["'a"],list_∃_thm);
=TEX
\section{BASIC DEFINITIONS}
The names of $Nil$ and $Cons$ are known by
the HOL kernel. We show that functions exist
with the required properties for the abstract type $LIST$.

=SML
val ⦏nil_cons_thm⦎ = (
push_goal ([],⌜
∃ Nil:'a LIST; Cons:'a→'a LIST→'a LIST ⦁
	(∀ x : 'a; list:'a LIST ⦁ ¬Cons x list = Nil) ∧
	(∀ x1 x2 : 'a; list1 list2 : 'a LIST ⦁
		Cons x1 list1 = Cons x2 list2
			⇔ (x1=x2 ∧ list1=list2)) ∧
	(∀p:'a LIST→BOOL ⦁ p Nil ∧
		(∀list:'a LIST⦁ p list ⇒ (∀x⦁ p (Cons x list)))
			⇒ (∀list⦁ p list))
⌝);
a(strip_asm_tac (simple_⇒_match_mp_rule type_lemmas_thm list_def));
a(strip_asm_tac (is_list_rep_def));
a(simple_∃_tac ⌜(abs:((ℕ→'a)×ℕ)→'a LIST)nil⌝);
a(simple_∃_tac ⌜λx:'a⦁λlist:'a LIST⦁
(abs:((ℕ→'a)×ℕ)→'a LIST)
	(cons x ((rep:'a LIST→((ℕ→'a)×ℕ)) list))⌝);
a(rewrite_tac[] THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(lemma_tac ⌜IsListRep((rep:'a LIST→((ℕ→'a)×ℕ))list)⌝
	THEN_LIST[asm_rewrite_tac[], id_tac]);
(* asm_rewrite_tac proves the lemma so only one sub-goal *)
a(lemma_tac ⌜IsListRep((cons:'a→((ℕ→'a)×ℕ)→((ℕ→'a)×ℕ)) x
	((rep:'a LIST→((ℕ→'a)×ℕ)) list))⌝);
(* *** Goal "1.1" *** *)
a(DROP_NTH_ASM_T 3 (ante_tac o simple_∀_elim⌜(rep:'a LIST→((ℕ→'a)×ℕ))list⌝) THEN
	REPEAT strip_tac);
a(asm_rewrite_tac[]);
(* *** Goal "1.2" *** *)
a(GET_NTH_ASM_T 6 (strip_asm_tac o simple_∀_elim
	⌜(rep:'a LIST→((ℕ→'a)×ℕ))list⌝));
a(POP_ASM_T (strip_asm_tac o simple_∀_elim⌜x:'a⌝));
a(contr_tac);
a(lemma_tac ⌜(rep:'a LIST→((ℕ→'a)×ℕ))
	((abs:((ℕ→'a)×ℕ)→'a LIST)
	((cons:'a→((ℕ→'a)×ℕ)→((ℕ→'a)×ℕ)) x (rep list)))
	= rep (abs nil)⌝);
(* *** Goal "1.2.1" *** *)
a(POP_ASM_T rewrite_thm_tac);
(* *** Goal "1.2.2" *** *)
a(POP_ASM_T ante_tac);
a(GET_NTH_ASM_T 10 (strip_asm_tac o simple_∀_elim
	⌜(cons:'a→((ℕ→'a)×ℕ)→((ℕ→'a)×ℕ)) x
	((rep:'a LIST→((ℕ→'a)×ℕ)) list)⌝));
a(GET_NTH_ASM_T 11 (strip_asm_tac o simple_∀_elim
	⌜nil:(ℕ→'a)×ℕ⌝));
a(asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(lemma_tac ⌜IsListRep((rep:'a LIST→((ℕ→'a)×ℕ))list1)⌝
	THEN_LIST[asm_rewrite_tac[], id_tac]);
(* asm_rewrite_tac proves the lemma so only one sub-goal *)
a(lemma_tac ⌜IsListRep((rep:'a LIST→((ℕ→'a)×ℕ))list2)⌝
	THEN_LIST[asm_rewrite_tac[], id_tac]);
(* asm_rewrite_tac proves the lemma so only one sub-goal *)
a(lemma_tac ⌜(cons:'a→((ℕ→'a)×ℕ)→((ℕ→'a)×ℕ)) x1
	((rep:'a LIST→((ℕ→'a)×ℕ)) list1)
	= cons x2 (rep list2)⌝);
(* *** Goal "2.1" *** *)
a(lemma_tac ⌜IsListRep((cons:'a→((ℕ→'a)×ℕ)→((ℕ→'a)×ℕ)) x1
	((rep:'a LIST→((ℕ→'a)×ℕ)) list1))⌝);
(* *** Goal "2.1.1" *** *)
a(DROP_NTH_ASM_T 5 (ante_tac o simple_∀_elim⌜(rep:'a LIST→((ℕ→'a)×ℕ))list1⌝)
	THEN
	REPEAT strip_tac);
a(asm_rewrite_tac[]);
(* *** Goal "2.1.2" *** *)
a(lemma_tac ⌜IsListRep((cons:'a→((ℕ→'a)×ℕ)→((ℕ→'a)×ℕ)) x2
	((rep:'a LIST→((ℕ→'a)×ℕ)) list2))⌝);
(* *** Goal "2.1.2.1" *** *)
a(DROP_NTH_ASM_T 6 (ante_tac o simple_∀_elim⌜(rep:'a LIST→((ℕ→'a)×ℕ))list2⌝)
	THEN
	REPEAT strip_tac);
a(asm_rewrite_tac[]);
(* *** Goal "2.1.2.2" *** *)
a(GET_NTH_ASM_T 11 (strip_asm_tac o simple_∀_elim
	⌜(cons:'a→((ℕ→'a)×ℕ)→((ℕ→'a)×ℕ)) x1
	((rep:'a LIST→((ℕ→'a)×ℕ)) list1)⌝));
a(GET_NTH_ASM_T 12 (strip_asm_tac o simple_∀_elim
	⌜(cons:'a→((ℕ→'a)×ℕ)→((ℕ→'a)×ℕ)) x2
	((rep:'a LIST→((ℕ→'a)×ℕ)) list2)⌝));
a(lemma_tac ⌜(rep:'a LIST→((ℕ→'a)×ℕ))
	((abs:((ℕ→'a)×ℕ)→'a LIST)
	((cons:'a→((ℕ→'a)×ℕ)→((ℕ→'a)×ℕ)) x1 (rep list1)))
	= rep (abs (cons x2 (rep list2)))⌝);
(* *** Goal "2.1.2.2.1" *** *)
a(GET_NTH_ASM_T 2 ante_tac);
a(GET_NTH_ASM_T 7 rewrite_thm_tac);
(* *** Goal "2.1.2.2.2" *** *)
a(POP_ASM_T ante_tac THEN asm_rewrite_tac[]);
(* *** Goal "2.2" *** *)
a(GET_NTH_ASM_T 7 (strip_asm_tac o list_simple_∀_elim
	[⌜(rep:'a LIST→((ℕ→'a)×ℕ))list1⌝,
	⌜(rep:'a LIST→((ℕ→'a)×ℕ))list2⌝]));
a(POP_ASM_T (strip_asm_tac o list_simple_∀_elim
	[⌜x1:'a⌝,⌜x2:'a⌝]));
(* *** Goal "3" *** *)
a(lemma_tac ⌜IsListRep((rep:'a LIST→((ℕ→'a)×ℕ))list1)⌝
	THEN_LIST[asm_rewrite_tac[], id_tac]);
(* asm_rewrite_tac proves the lemma so only one sub-goal *)
a(lemma_tac ⌜IsListRep((rep:'a LIST→((ℕ→'a)×ℕ))list2)⌝
	THEN_LIST[asm_rewrite_tac[], id_tac]);
(* asm_rewrite_tac proves the lemma so only one sub-goal *)
a(lemma_tac ⌜(cons:'a→((ℕ→'a)×ℕ)→((ℕ→'a)×ℕ)) x1
	((rep:'a LIST→((ℕ→'a)×ℕ)) list1)
	= cons x2 (rep list2)⌝);
(* *** Goal "3.1" *** *)
a(lemma_tac ⌜IsListRep((cons:'a→((ℕ→'a)×ℕ)→((ℕ→'a)×ℕ)) x1
	((rep:'a LIST→((ℕ→'a)×ℕ)) list1))⌝);
(* *** Goal "3.1.1" *** *)
a(DROP_NTH_ASM_T 5 (ante_tac o simple_∀_elim⌜(rep:'a LIST→((ℕ→'a)×ℕ))list1⌝)
	THEN
	REPEAT strip_tac);
a(asm_rewrite_tac[]);
(* *** Goal "3.1.2" *** *)
a(lemma_tac ⌜IsListRep((cons:'a→((ℕ→'a)×ℕ)→((ℕ→'a)×ℕ)) x2
	((rep:'a LIST→((ℕ→'a)×ℕ)) list2))⌝);
(* *** Goal "3.1.2.1" *** *)
a(DROP_NTH_ASM_T 6 (ante_tac o simple_∀_elim⌜(rep:'a LIST→((ℕ→'a)×ℕ))list2⌝)
	THEN
	REPEAT strip_tac);
a(asm_rewrite_tac[]);
(* *** Goal "3.1.2.2" *** *)
a(GET_NTH_ASM_T 11 (strip_asm_tac o simple_∀_elim
	⌜(cons:'a→((ℕ→'a)×ℕ)→((ℕ→'a)×ℕ)) x1
	((rep:'a LIST→((ℕ→'a)×ℕ)) list1)⌝));
a(GET_NTH_ASM_T 12 (strip_asm_tac o simple_∀_elim
	⌜(cons:'a→((ℕ→'a)×ℕ)→((ℕ→'a)×ℕ)) x2
	((rep:'a LIST→((ℕ→'a)×ℕ)) list2)⌝));
a(lemma_tac ⌜(rep:'a LIST→((ℕ→'a)×ℕ))
	((abs:((ℕ→'a)×ℕ)→'a LIST)
	((cons:'a→((ℕ→'a)×ℕ)→((ℕ→'a)×ℕ)) x1 (rep list1)))
	= rep (abs (cons x2 (rep list2)))⌝);
(* *** Goal "3.1.2.2.1" *** *)
a(GET_NTH_ASM_T 2 ante_tac);
a(GET_NTH_ASM_T 7 rewrite_thm_tac);
(* *** Goal "3.1.2.2.2" *** *)
a(POP_ASM_T ante_tac THEN asm_rewrite_tac[]);
(* *** Goal "3.2" *** *)
a(GET_NTH_ASM_T 7 (strip_asm_tac o list_simple_∀_elim
	[⌜(rep:'a LIST→((ℕ→'a)×ℕ))list1⌝,
	⌜(rep:'a LIST→((ℕ→'a)×ℕ))list2⌝]));
a(POP_ASM_T (strip_asm_tac o list_simple_∀_elim
	[⌜x1:'a⌝,⌜x2:'a⌝]));
a(GET_NTH_ASM_T 13 (strip_asm_tac o
	eq_sym_rule o (simple_∀_elim⌜list1:'a LIST⌝)));
a(POP_ASM_T once_rewrite_thm_tac);
a(GET_NTH_ASM_T 13 (strip_asm_tac o
	eq_sym_rule o (simple_∀_elim⌜list2:'a LIST⌝)));
a(POP_ASM_T once_rewrite_thm_tac);
a(POP_ASM_T rewrite_thm_tac);
(* *** Goal "4" *** *)
a(asm_rewrite_tac[]);
(* *** Goal "5" *** *)
a(lemma_tac ⌜IsListRep((rep:'a LIST→((ℕ→'a)×ℕ))list)⌝
	THEN_LIST[asm_rewrite_tac[], id_tac]);
(* asm_rewrite_tac proves the lemma so only one sub-goal *)
a(lemma_tac ⌜IsListRep((cons:'a→((ℕ→'a)×ℕ)→((ℕ→'a)×ℕ)) x
	((rep:'a LIST→((ℕ→'a)×ℕ)) list))⌝);
(* *** Goal "5.1" *** *)
a(DROP_NTH_ASM_T 5 (ante_tac o simple_∀_elim⌜(rep:'a LIST→((ℕ→'a)×ℕ))list⌝) THEN
	REPEAT strip_tac);
a(asm_rewrite_tac[]);
(* *** Goal "5.2" *** *)
a(lemma_tac⌜∀list:((ℕ→'a)×ℕ)⦁IsListRep list ⇒ IsListRep list ∧
	p((abs:((ℕ→'a)×ℕ)→'a LIST) list)⌝);
(* *** Goal "5.2.1" *** *)
a(lemma_tac⌜∀list:((ℕ→'a)×ℕ)⦁IsListRep list ∧
	p((abs:((ℕ→'a)×ℕ)→'a LIST) list) ⇒
	IsListRep ((cons:'a→((ℕ→'a)×ℕ)→((ℕ→'a)×ℕ)) x
		list) ∧ p (abs (cons x list))⌝);
(* *** Goal "5.2.1.1" *** *)
a(REPEAT strip_tac);
(* *** Goal "5.2.1.1.1" *** *)
a(DROP_NTH_ASM_T 8 (ante_tac o simple_∀_elim⌜list':((ℕ→'a)×ℕ)⌝));
a(strip_tac);
a(asm_rewrite_tac[]);
(* 5.2.1.1.2 *)
a(DROP_NTH_ASM_T 5 (ante_tac o simple_∀_elim⌜(abs:((ℕ→'a)×ℕ)→'a LIST)list'⌝));
a(asm_rewrite_tac[]);
a(strip_tac THEN POP_ASM_T (ante_tac o simple_∀_elim⌜x:'a⌝));
a(GET_NTH_ASM_T 2 (asm_ante_tac o concl) THEN asm_rewrite_tac[]);
a(strip_tac THEN asm_rewrite_tac[]);
(* *** 5.2.1.2 *** *)
a(GET_NTH_ASM_T 6 (ante_tac o simple_∀_elim
	⌜λa⦁IsListRep a ∧ p((abs:((ℕ→'a)×ℕ)→'a LIST)a)⌝) THEN
	rewrite_tac[]);
a(strip_tac);
(* *** 5.2.1.2.1 *** *)
a(contr_tac);
a(DROP_NTH_ASM_T 3 ante_tac THEN rewrite_tac[]);
a(DROP_NTH_ASM_T 11 (ante_tac o simple_∀_elim⌜m:((ℕ→'a)×ℕ)⌝));
a(asm_rewrite_tac[]);
a(strip_tac THEN asm_rewrite_tac[]);
(* *** 5.2.1.2.2 *** *)
a(contr_tac);
a(DROP_NTH_ASM_T 3 ante_tac THEN rewrite_tac[]);
a(DROP_NTH_ASM_T 8 (ante_tac o simple_∀_elim⌜(abs:((ℕ→'a)×ℕ)→'a LIST)m⌝));
a(asm_rewrite_tac[]);
a(lemma_tac⌜((rep:'a LIST→((ℕ→'a)×ℕ))((abs:((ℕ→'a)×ℕ)→'a LIST)m))=m⌝);
(* *** 5.2.1.2.2.1 *** *)
a(DROP_NTH_ASM_T 4 ante_tac THEN asm_rewrite_tac[]);
(* *** 5.2.1.2.2.2 *** *)
a(asm_rewrite_tac[] THEN strip_tac THEN asm_rewrite_tac[]);
(* *** 5.2.2 *** *)
a(POP_ASM_T (ante_tac o simple_∀_elim⌜(rep:'a LIST→((ℕ→'a)×ℕ))list⌝));
a(GET_NTH_ASM_T 11 rewrite_thm_tac THEN REPEAT strip_tac);
pop_thm()
);
=TEX
The predicate is broken up and saved as individual
theorems.
=SML
val ⦏nil_cons_def⦎ = new_spec1(
	["Nil", "Cons", "nil_cons_def"],
		["Nil", "Cons"],
			nil_cons_thm);

val ⦏¬_cons_thm⦎ = ∧_left_elim nil_cons_def;

val ⦏one_one_cons_thm⦎ = (∧_left_elim o ∧_right_elim) nil_cons_def;

val ⦏list_induction_thm⦎ = save_thm ("list_induction_thm",
	∧_right_elim (∧_right_elim nil_cons_def));
=TEX
\section{INDUCTION OVER LISTS}
The list induction tactical is provided for application
users to do inductive proofs over lists.

=SML
fun ⦏LIST_INDUCTION_T⦎ (tm : TERM) : (THM -> TACTIC) -> TACTIC = (
if not(is_var tm)
then term_fail "LIST_INDUCTION_T" 39001 [tm]
else (fn thmtac =>
	let fun aux_tac (gl as (seqasms, conc)) = (
		if not (is_free_in tm conc)
		then term_fail "LIST_INDUCTION_T" 39002 [tm]
		else if any seqasms (is_free_in tm)
		then	term_fail "LIST_INDUCTION_T" 39003 [tm]
		else let
			val abs = mk_simple_λ(tm, conc);
			val pred = (fst o dest_∀ o concl) list_induction_thm;
			val (tmy, _) = term_match abs pred;
			val lit_inst = inst_type_rule tmy list_induction_thm;
			val thm0 = (conv_rule
					(ONCE_MAP_C (simple_β_conv))
					(simple_∀_elim abs lit_inst));
			val thm1 = undisch_rule(conv_rule
	((RATOR_C o RAND_C o RAND_C o RAND_C)(simple_α_conv (fst(dest_var tm))))
						thm0);
				val thm2 = simple_∀_elim tm thm1;
				val conc' = (hd (asms thm2));
			in	([(seqasms, conc')],
				 (fn [th] => prove_asm_rule th thm2
				  | _ => bad_proof "LIST_INDUCTION_T"))
			end
		);
		in	aux_tac THEN ∧_tac THEN_LIST
			[id_tac, simple_∀_tac THEN ⇒_T thmtac]
		end)
);
=TEX
A specific case of the tactical where the
assumption is always stripped is provided.

=SML
fun ⦏list_induction_tac⦎ (tm : TERM) : TACTIC = (
let	val tac = (LIST_INDUCTION_T tm strip_asm_tac);
in	fn gl => (tac gl
	handle ex => pass_on ex "LIST_INDUCTION_T" "list_induction_tac")
end
handle ex => pass_on ex "LIST_INDUCTION_T" "list_induction_tac"
);
=TEX
\section{PRIMITIVE RECURSION}
This section defines the primitive recursion theorem,
which is useful for introducing definitions which are
defined in primitive recursive form (e.g., $Length$).

=SML
val ⦏list_rec_lemma1⦎ = (
push_goal([],
	⌜∀n:'b⦁∀c:'a→'b→'b ⦁ ∃r:'a LIST→'b→BOOL⦁
		r Nil n
	∧	(∀ list x⦁r list x ⇒
			(∀a⦁ r (Cons a list) (c a x)))
	∧	∀x:'b⦁r Nil x ⇒ x = n⌝);
a(REPEAT strip_tac THEN simple_∃_tac
	⌜λ(l:'a LIST)(y:'b)⦁¬l=Nil ∨ (l=Nil ∧ y=n)⌝);
a(rewrite_tac[¬_cons_thm]);
pop_thm()
);
=TEX
=SML
val ⦏list_rec_lemma2⦎ = (
push_goal([],⌜∀list:'a LIST⦁∀x:'a⦁ ¬Cons x list = list⌝);
a(REPEAT strip_tac THEN list_induction_tac⌜list:'a LIST⌝);
(* *** Goal "1" *** *)
a(rewrite_tac[¬_cons_thm]);
(* *** Goal "2" *** *)
a(contr_tac THEN strip_asm_tac(list_simple_∀_elim
	[⌜x:'a⌝,⌜x':'a⌝,⌜Cons x' list⌝,⌜list:'a LIST⌝]one_one_cons_thm));
a(DROP_NTH_ASM_T 4 ante_tac THEN asm_rewrite_tac[]);
pop_thm()
);
=TEX
=SML
val ⦏list_rec_lemma3⦎ = (
push_goal([],
	⌜∀n:'b⦁∀c:'a→'b→'b⦁ ∀k:'a LIST⦁∃r:'a LIST→'b→BOOL⦁
		r Nil n
	∧	(∀list x⦁r list x ⇒ (∀a:'a⦁r(Cons a list)(c a x)))
	∧	∃t⦁r k t ∧ ∀x:'b⦁r k x ⇒ x = t⌝);
a(REPEAT strip_tac THEN list_induction_tac⌜k:'a LIST⌝);
(* *** Goal "1" *** *)
a(strip_asm_tac (all_simple_∀_elim list_rec_lemma1) THEN
	simple_∃_tac⌜r:'a LIST→'b→BOOL⌝);
a(asm_rewrite_tac[] THEN simple_∃_tac⌜n:'b⌝ THEN asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(REPEAT strip_tac);
a(simple_∃_tac⌜λ(i:'a LIST) (y:'b)⦁if Cons x k = i then
	y = (c:'a→'b→'b) x t else r i y⌝
	THEN rewrite_tac[¬_cons_thm] THEN REPEAT strip_tac);
(* *** Goal "2.1" *** *)
a(strip_asm_tac (list_simple_∀_elim[
	⌜x:'a⌝,⌜a:'a⌝,⌜k:'a LIST⌝, ⌜list:'a LIST⌝]
	one_one_cons_thm));
a(DROP_NTH_ASM_T 4 ante_tac THEN POP_ASM_T (rewrite_thm_tac o eq_sym_rule));
a(lemma_tac ⌜(r:'a LIST→'b→BOOL) k x' ⇒ x' = t⌝ THEN asm_rewrite_tac[]);
(* *** Goal "2.2" *** *)
a(DROP_NTH_ASM_T 6 (strip_asm_tac o list_simple_∀_elim
	[⌜list:'a LIST⌝,⌜x':'b⌝]) THEN asm_rewrite_tac[]);
(* *** Goal "2.3" *** *)
a(DROP_NTH_ASM_T 2 ante_tac THEN asm_rewrite_tac[list_rec_lemma2]);
(* *** Goal "2.4" *** *)
a(LEMMA_T ⌜(r:'a LIST→'b→BOOL)list x'⌝ ante_tac);
(* *** Goal "2.4.1" *** *)
a(DROP_NTH_ASM_T 2 (asm_rewrite_thm_tac o eq_sym_rule));
a(DROP_NTH_ASM_T 5 (strip_asm_tac o list_simple_∀_elim[
	⌜k:'a LIST⌝,⌜t:'b⌝]) THEN asm_rewrite_tac[]);
(* *** Goal "2.4.2" *** *)
a(DROP_NTH_ASM_T 6 (strip_asm_tac o list_simple_∀_elim
	[⌜list:'a LIST⌝,⌜x':'b⌝]) THEN asm_rewrite_tac[]);
(* *** Goal "2.5" *** *)
a(strip_asm_tac (list_simple_∀_elim[
	⌜x:'a⌝,⌜a:'a⌝,⌜k:'a LIST⌝, ⌜list:'a LIST⌝]
	one_one_cons_thm));
a(DROP_NTH_ASM_T 4 ante_tac THEN POP_ASM_T (rewrite_thm_tac o eq_sym_rule));
a(lemma_tac ⌜(r:'a LIST→'b→BOOL) k x' ⇒ x' = t⌝ THEN asm_rewrite_tac[]);
(* *** Goal "2.6" *** *)
a(DROP_NTH_ASM_T 6 (strip_asm_tac o list_simple_∀_elim
	[⌜list:'a LIST⌝,⌜x':'b⌝]) THEN asm_rewrite_tac[]);
(* *** Goal "2.7" *** *)
a(simple_∃_tac⌜(c:'a→'b→'b)x t⌝ THEN REPEAT strip_tac
	THEN asm_rewrite_tac[]);
pop_thm()
);
=TEX
=SML
val ⦏list_rec_lemma4⦎ = (
push_goal([],
	⌜∀n:'b⦁∀c:'a→'b→'b⦁ ∃r:'a LIST→'b→BOOL⦁
		r Nil n
	∧	(∀list x⦁r list x ⇒ (∀a:'a⦁
			r(Cons a list)(c a x)))
	∧	(∀m⦁∃y⦁r m y ∧ ∀x⦁r m x ⇒ x = y)⌝);
a(REPEAT strip_tac THEN
  simple_∃_tac⌜(λ(k:'a LIST) (y:'b)⦁
	(∀q⦁(q Nil n ∧ (∀list x⦁q list x
		⇒ (∀a⦁q(Cons a list)(c a x)))) ⇒ q k y))⌝);
a(rewrite_tac[] THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(DROP_NTH_ASM_T 3 (ante_tac o simple_∀_elim
	⌜q:'a LIST→'b→BOOL⌝) THEN asm_rewrite_tac[]);
a(POP_ASM_T (strip_asm_tac o all_simple_∀_elim)
	THEN asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(list_induction_tac ⌜m:'a LIST⌝);
(* *** Goal "2.1" *** *)
a(simple_∃_tac⌜n:'b⌝ THEN REPEAT strip_tac);
a(strip_asm_tac(all_simple_∀_elim list_rec_lemma1));
a(DROP_NTH_ASM_T 4 (ante_tac o simple_∀_elim⌜r:'a LIST→'b→BOOL⌝)
	THEN asm_rewrite_tac[]);
(* *** Goal "2.2" *** *)
a(strip_tac THEN simple_∃_tac ⌜(c:'a→'b→'b)x y⌝
	THEN REPEAT strip_tac);
(* *** Goal "2.2.1" *** *)
a(DROP_NTH_ASM_T 4 (ante_tac o simple_∀_elim⌜q:'a LIST→'b→BOOL⌝)
	THEN asm_rewrite_tac[]);
a(POP_ASM_T (strip_asm_tac o list_simple_∀_elim
	[⌜m:'a LIST⌝,⌜y:'b⌝]) THEN asm_rewrite_tac[]);
(* *** Goal "2.2.2" *** *)
a(strip_asm_tac(list_simple_∀_elim[⌜n:'b⌝, ⌜c:'a→'b→'b⌝, ⌜Cons x m⌝]
	list_rec_lemma3));
a(lemma_tac ⌜(r:'a LIST→'b→BOOL)m y⌝);
(* *** Goal "2.2.2.1" *** *)
a(DROP_NTH_ASM_T 7 (ante_tac o simple_∀_elim⌜r:'a LIST→'b→BOOL⌝)
	THEN asm_rewrite_tac[]);
(* *** Goal "2.2.2.2" *** *)
a(lemma_tac ⌜(r:'a LIST→'b→BOOL)(Cons x m) ((c:'a→'b→'b)x y)⌝);
(* *** Goal "2.2.2.2.1" *** *)
a(DROP_NTH_ASM_T 4 (strip_asm_tac o list_simple_∀_elim[⌜m:'a LIST⌝, ⌜y:'b⌝])
	THEN asm_rewrite_tac[]);
(* *** Goal "2.2.2.2.2" *** *)
a(lemma_tac ⌜(r:'a LIST→'b→BOOL)(Cons x m) x'⌝);
(* *** Goal "2.2.2.2.2.1" *** *)
a(DROP_NTH_ASM_T 7 (ante_tac o simple_∀_elim⌜r:'a LIST→'b→BOOL⌝)
	THEN asm_rewrite_tac[]);
(* *** Goal "2.2.2.2.2.2" *** *)
a(GET_NTH_ASM_T 4 (ante_tac o simple_∀_elim⌜x':'b⌝));
a(DROP_NTH_ASM_T 4 (ante_tac o simple_∀_elim⌜(c:'a→'b→'b)x y⌝));
a(strip_tac THEN asm_rewrite_tac[]);
pop_thm()
);
=TEX
=SML
val ⦏list_rec_lemma5⦎ = (
push_goal([],
	⌜∀n:'b⦁∀c:'a→'b→'b⦁ ∃f:'a LIST→'b⦁
		f Nil = n
	∧	∀list:'a LIST⦁∀a:'a⦁f(Cons a list) = c a (f list)⌝);
a(REPEAT strip_tac);
a((strip_asm_tac o all_simple_∀_elim) list_rec_lemma4);
a((ante_tac o simple_∀_elim⌜r:'a LIST→'b→BOOL⌝ o
	inst_type_rule[(ⓣ'a LIST⌝, ⓣ'a⌝)]) fun_rel_lemma);
a(asm_rewrite_tac [] THEN REPEAT strip_tac);
a(simple_∃_tac⌜f:'a LIST→'b⌝);
a(strip_tac THEN asm_rewrite_tac[] THEN strip_tac);
a(list_induction_tac⌜list:'a LIST⌝);
(* *** Goal "1" *** *)
a(LEMMA_T ⌜(f:'a LIST→'b) Nil=n⌝ rewrite_thm_tac);
(* *** Goal "1.1" *** *)
a(asm_rewrite_tac[]);
(* *** Goal "1.2" *** *)
a(DROP_NTH_ASM_T 3 (strip_asm_tac o list_simple_∀_elim
	[⌜Nil⌝,⌜n:'b⌝]) THEN asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(REPEAT strip_tac THEN LEMMA_T
	⌜(f:'a LIST→'b)(Cons x list)=(c:'a→'b→'b) x (f list)⌝ rewrite_thm_tac);
(* *** Goal "2.1" *** *)
a(asm_rewrite_tac[]);
(* *** Goal "2.2" *** *)
a(DROP_NTH_ASM_T 4 (strip_asm_tac o list_simple_∀_elim
	[⌜Cons x list⌝,⌜(c:'a→'b→'b)x (f (list:'a LIST))⌝]));
(* *** Goal "2.2.1" *** *)
a(POP_ASM_T ante_tac THEN asm_rewrite_tac[]);
(* *** Goal "2.2.2" *** *)
a(asm_rewrite_tac[]);
pop_thm()
);
=TEX
=SML
val ⦏list_rec_lemma6⦎ = (
push_goal([],
	⌜∀n:'b⦁∀c:'a→'b→'a LIST→'b⦁ ∃f:'a LIST→'b⦁
		f Nil = n
	∧	∀list:'a LIST⦁∀a:'a⦁
			f(Cons a list) = c a (f list)list⌝);
a(REPEAT strip_tac);
a(strip_asm_tac
	(list_simple_∀_elim[⌜((n:'b), Nil)⌝,
	⌜λ a; ix:'b × 'a LIST⦁((c a (Fst ix) (Snd ix):'b),
		Cons a (Snd ix))⌝]
	(inst_type_rule[(ⓣ'b × 'a LIST⌝, ⓣ'b⌝)] list_rec_lemma5)));
a(simple_∃_tac ⌜λi⦁Fst((f:'a LIST→('b × 'a LIST)) i)⌝);
a(GET_NTH_ASM_T 2 (fn th=> rewrite_tac[pair_clauses, th]));
a(strip_tac THEN list_induction_tac⌜list:'a LIST⌝);
(* *** Goal "1" *** *)
a(asm_rewrite_tac[pair_clauses]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[pair_clauses]);
a(LEMMA_T ⌜∀k⦁Snd((f:'a LIST→('b × 'a LIST))k) = k⌝ rewrite_thm_tac);
a(strip_tac THEN list_induction_tac⌜k:'a LIST⌝ THEN asm_rewrite_tac[pair_clauses]);
pop_thm()
);
=TEX
The uniqueness part of the primitive recursion theorem is
straightforward:
=SML
val ⦏list_rec_lemma7⦎ = (
push_goal([],
	⌜∀n:'b⦁∀c:'a→'b→'a LIST→'b⦁ ∀f g:'a LIST→'b⦁
	(	(	f Nil = n
		∧	∀list:'a LIST⦁∀a:'a⦁
			f(Cons a list) = c a (f list) list)
		∧ (	g Nil = n
		∧	∀list:'a LIST⦁∀a:'a⦁
			g(Cons a list) = c a (g list) list))
	⇒	f = g⌝);
a(REPEAT strip_tac THEN pure_once_rewrite_tac[ext_thm]);
a(strip_tac THEN list_induction_tac⌜x:'a LIST⌝ THEN asm_rewrite_tac[]);
pop_thm()
);
=TEX
=SML
val ⦏list_prim_rec_thm⦎ = save_thm("list_prim_rec_thm", (
push_goal([],
	⌜∀n:'b⦁∀c:'a→'b→'a LIST→'b⦁ ∃⋎1f:'a LIST→'b⦁
		f Nil = n
	∧	∀list:'a LIST⦁∀a:'a⦁
			f(Cons a list) = c a (f list) list⌝);
a(REPEAT strip_tac THEN conv_tac simple_∃⋎1_conv);
a(strip_asm_tac(all_simple_∀_elim list_rec_lemma6)
	THEN simple_∃_tac⌜f:'a LIST→'b⌝);
a(asm_rewrite_tac[]);
a(REPEAT strip_tac THEN
	ante_tac (list_simple_∀_elim[⌜n:'b⌝, ⌜c:'a→'b→'a LIST→'b⌝,
		⌜f:'a LIST→'b⌝, ⌜x:'a LIST→'b⌝]list_rec_lemma7));
a(asm_rewrite_tac[] THEN ⇒_T (accept_tac o eq_sym_rule));
pop_thm()
));
=TEX
\section{DEFINITIONS OF LIST OPERATIONS}
The definitions in this section are self-explanitory.
For each definition, the proof obligation for consistency
is discharged.
\subsection{Basic Operations on Lists}
=SML
val ⦏length_def⦎ = new_spec1 (["Length","length_def"], ["Length"], (
push_goal([],
⌜∃Length:'a LIST→ℕ ⦁
	Length (Nil:'a LIST) = 0 ∧
	∀ h:'a; list:'a LIST⦁
		Length (Cons h list) = Length list + 1⌝);

a(strip_asm_tac((list_simple_∀_elim
	[⌜0⌝, ⌜λa:'a; b:ℕ; c:'a LIST⦁ b + 1⌝])
	(inst_type_rule[(ⓣℕ⌝, ⓣ'b⌝)]list_prim_rec_thm)));
a(simple_∃_tac⌜f:'a LIST→ℕ⌝);
a(asm_rewrite_tac[]);
pop_thm()
));
=TEX
=SML
val ⦏hd_def⦎ = new_spec1 (["Hd","hd_def"], ["Hd"], (
push_goal([],
⌜∃Hd:'a LIST→'a⦁
	∀h:'a; list:'a LIST⦁ Hd (Cons h list) = h⌝);
a(strip_asm_tac((list_simple_∀_elim
	[⌜x:'a⌝, ⌜λa:'a; b:'a; c:'a LIST⦁ a⌝])
	(inst_type_rule[(ⓣ'a⌝, ⓣ'b⌝)]list_prim_rec_thm)));
a(simple_∃_tac⌜f⌝);
a(asm_rewrite_tac[]);
pop_thm()
));
=TEX
=SML
val ⦏tl_def⦎ = new_spec1(["Tl","tl_def"], ["Tl"], (
push_goal([],
⌜∃Tl:'a LIST→'a LIST⦁
	∀h:'a; list:'a LIST⦁ Tl (Cons h list) = list⌝);
a(strip_asm_tac((list_simple_∀_elim
	[⌜x:'a LIST⌝, ⌜λa:'a; b:'a LIST; c:'a LIST⦁ c⌝])
	(inst_type_rule[(ⓣ'a LIST⌝, ⓣ'b⌝)]list_prim_rec_thm)));
a(simple_∃_tac⌜f⌝);
a(asm_rewrite_tac[]);
pop_thm()
));
=TEX
=SML
val ⦏append_def⦎ = new_spec1 (["Append","append_def"], ["Append"], (
push_goal([],
⌜∃Append:'a LIST→'a LIST→'a LIST ⦁
	(∀list:'a LIST⦁ Append Nil list = list) ∧
	(∀h:'a; list:'a LIST; list':'a LIST⦁
	  Append (Cons h list) list' = Cons h (Append list list'))⌝);
a(strip_asm_tac((list_simple_∀_elim
	[⌜λlist:'a LIST⦁list⌝,
		⌜λa:'a; b:'a LIST→'a LIST; c:'a LIST⦁
			λlist⦁Cons a (b list)⌝])
	(inst_type_rule[(ⓣ'a LIST→'a LIST⌝, ⓣ'b⌝)]list_prim_rec_thm)));
a(simple_∃_tac⌜f⌝);
a(asm_rewrite_tac[]);
pop_thm()
));
=TEX
=SML
val _ = declare_alias ("@", ⌜Append⌝);
val _ = declare_infix (300, "@");
=TEX
=SML
val ⦏rev_def⦎ = new_spec1 (["Rev","rev_def"], ["Rev"], (
push_goal([],
⌜∃Rev:'a LIST→'a LIST⦁
	Rev (Nil:'a LIST) = Nil ∧
	∀ h:'a; list:'a LIST⦁
		Rev (Cons h list) = Append (Rev list) [h]
⌝);
a(strip_asm_tac((list_simple_∀_elim
	[⌜Nil⌝,
	⌜λa:'a; b:'a LIST; c:'a LIST⦁
	    Append b [a]⌝])
	(inst_type_rule[(ⓣ'a LIST⌝, ⓣ'b⌝)]list_prim_rec_thm)));
a(simple_∃_tac⌜f⌝);
a(asm_rewrite_tac[]);
pop_thm()
));
=TEX
\subsection{Lists and Pairs}
=SML
val ⦏split_def⦎ = new_spec1 (["Split","split_def"], ["Split"], (
push_goal([],
⌜∃Split:('a×'b)LIST→('a LIST×'b LIST)⦁
	Split (Nil:('a×'b)LIST) = (Nil,Nil) ∧
	(∀ list:('a×'b) LIST; h1:'a; h2:'b⦁
	 Split (Cons (h1,h2) list) =
		(Cons h1 (Fst(Split list)),
			Cons h2 (Snd(Split list))))
⌝);
a(strip_asm_tac((list_simple_∀_elim
	[⌜(Nil,Nil)⌝,
	⌜λ(a1,a2):'a×'b; b:'a LIST×'b LIST; c:('a×'b) LIST⦁
	    (Cons a1 (Fst b), Cons a2 (Snd b))⌝])
	(inst_type_rule[(ⓣ'a×'b⌝, ⓣ'a⌝),
			(ⓣ'a LIST×'b LIST⌝, ⓣ'b⌝)]list_prim_rec_thm)));
a(simple_∃_tac⌜f⌝);
a(asm_rewrite_tac[pair_clauses]);
pop_thm()
));
=TEX
=SML
val ⦏combine_def⦎ = new_spec1 (["Combine","combine_def"], ["Combine"], (
push_goal([],
⌜∃Combine:'a LIST→'b LIST→('a×'b)LIST⦁
	Combine (Nil:'a LIST) (Nil:'b LIST) = Nil ∧
	(∀ h1:'a; h2:'b; list1:'a LIST; list2:'b LIST⦁
		Combine (Cons h1 list1) (Cons h2 list2) =
		Cons (h1,h2) (Combine list1 list2))
⌝);
a(strip_asm_tac((list_simple_∀_elim
	[⌜λlist:'b LIST⦁(Nil:('a×'b) LIST)⌝,
	⌜λa:'a; b:'b LIST→('a×'b) LIST; c:'a LIST⦁
	 λlist:'b LIST⦁Cons (a, Hd list) (b (Tl list))⌝])
	(inst_type_rule[(ⓣ'b LIST→('a×'b) LIST⌝, ⓣ'b⌝)]list_prim_rec_thm)));
a(simple_∃_tac⌜f⌝);
a(asm_rewrite_tac[hd_def,tl_def]);
pop_thm()
));
=TEX
\subsection{Second Order Operations}
=SML
val ⦏map_def⦎ = new_spec1 (["Map","map_def"], ["Map"], (
push_goal([],
⌜∃Map: ('a→'b)→'a LIST→'b LIST ⦁
	(∀g:'a→'b⦁ Map g Nil = Nil) ∧
	(∀h:'a; g:'a→'b; list:'a LIST⦁
	  Map g (Cons h list) = Cons (g h) (Map g list))⌝);
a(strip_asm_tac((list_simple_∀_elim
	[⌜(λg⦁Nil):('a→'b)→ 'b LIST⌝,
	⌜λa:'a; b:('a→'b)→'b LIST; c:'a LIST⦁
	    λg⦁ Cons (g a) (b g)⌝])
	(inst_type_rule[(ⓣ('a→'b)→'b LIST⌝, ⓣ'b⌝)]list_prim_rec_thm)));
a(simple_∃_tac⌜((λf a b⦁ f b a)f):('a→'b)→'a LIST→'b LIST⌝);
a(asm_rewrite_tac[]);
pop_thm()
));
=TEX
=SML
val ⦏fold_def⦎ = new_spec1 (["Fold","fold_def"], ["Fold"], (
push_goal([],
⌜∃Fold: ('a→'b→'b)→'a LIST→'b→'b⦁
	(∀g:'a→'b→'b; x:'b⦁ Fold g Nil x = x) ∧
	(∀h:'a; g:'a→'b→'b; x:'b; list:'a LIST⦁
		Fold g (Cons h list) x = g h (Fold g list x))⌝);
a(strip_asm_tac((list_simple_∀_elim
	[⌜(λg x⦁x):('a→'b→'b)→'b→'b⌝,
	⌜λa:'a; b:('a→'b→'b)→'b→'b; c:'a LIST⦁
	    λg x⦁ g a (b g x)⌝])
	(inst_type_rule[(ⓣ('a→'b→'b)→'b→'b⌝, ⓣ'b⌝)]list_prim_rec_thm)));
a(simple_∃_tac⌜((λf a b c⦁ f b a c)f):('a→'b→'b)→'a LIST→'b→'b⌝);
a(asm_rewrite_tac[]);
pop_thm()
));
=TEX
\section{THEOREMS}
=SML
val ⦏list_clauses⦎ = save_thm ("list_clauses", (
push_goal([],⌜
∀ x1 x2:'a; list1 list2 :'a LIST⦁
	¬Cons x1 list1 = Nil ∧
	¬Nil = Cons x1 list1 ∧
	(Cons x1 list1 = Cons x2 list2 ⇔
		x1=x2 ∧ list1=list2) ∧
	Hd (Cons x1 list1) = x1 ∧
	Tl (Cons x1 list1) = list1⌝);
a(rewrite_tac[nil_cons_def,hd_def,tl_def]);
a(REPEAT strip_tac THEN contr_tac);
a(POP_ASM_T (ante_tac o eq_sym_rule)
	THEN rewrite_tac[nil_cons_def]);
pop_thm()
));
=TEX

=SML
val ⦏list_cases_thm⦎ = save_thm ("list_cases_thm", (
push_goal([],⌜
∀list1 :'a LIST⦁
	list1 = Nil ∨
	∃ x:'a; list2:'a LIST⦁ list1 = Cons x list2⌝);
a(strip_tac THEN list_induction_tac⌜list1:'a LIST⌝);
(* *** Goal "1" *** *)
a(rewrite_tac[]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[list_clauses]);
a(strip_tac THEN MAP_EVERY simple_∃_tac[⌜x:'a⌝,⌜Nil⌝]);
a(rewrite_tac[]);
(* *** Goal "3" *** *)
a(strip_tac THEN ∨_right_tac);
a(MAP_EVERY simple_∃_tac[⌜x':'a⌝,⌜list1⌝]);
a(rewrite_tac[]);
pop_thm()
));
=TEX
\section{EPILOGUE}
This completes the implementation of the theory for lists.
=SML
val _ = pop_pc();
end (* of structure ListTheory *);
=TEX
=SML
open List;
=TEX
{\twocolumn[\section{INDEX OF DEFINED TERMS}]
{\makeatletter
\printindex}}
\end{document}




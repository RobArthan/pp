=IGN
********************************************************************************
imp038.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  ℤ $Date: 2005/12/16 10:34:27 $ $Revision: 1.37 $ $RCSfile: imp038.doc,v $
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

\def\Title{Elementary Theory of Arithmetic}

\def\AbstractText{}

\def\Reference{DS/FMU/IED/IMP038}

\def\Author{R.D. Arthan}


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
%% LaTeX2e port: \TPPtitle{Elementary Theory of Arithmetic}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP038}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Date: 2005/12/16 10:34:27 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2005/12/16 10:34:27 $
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{R.D.~Arthan & WIN01}  %% Mandatory field
%% LaTeX2e port: \TPPauthorisation{R.B.~Jones & FMU Manager}
%% LaTeX2e port: \TPPabstract{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	    R.D.~Arthan \\ K.~Blackburn
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
\item[Issue 1.5 (1991/08/25) (25 August 1991)] First draft
\item[Issue 1.9 (1991/10/09) (25 August 1991)] First version with design and test
\item[Issue 1.10 (1991/10/16) (16th October 1991)] Brought in line with issue 1.3 design.
\item[Issue 1.11 (1991/10/17) (17th October 1991)]
Lost $fun\_rel\_thm$ to \cite{DS/FMU/IED/IMP037}.
\item[Issue 1.13 (1991/11/15) (15 November 1991)] Corrected definition of $>$. Corrected $lt\-\_trans\-\_thm$.
\item[Issue 1.14 (1991/11/21) (\FormatDate{91/11/21%
})] Change names of complete induction material (now called
course\--of\--values induction). Added theorem about uniqueness of
division and modulus.
\item [Issue 1.16 (1991/12/10) (10 December 1991)]
Added a further structure split, to enable SUN 3 builds.

\item[Issue 1.18 (1992/01/20), \FormatDate{92/01/20} ] Updated to use new fonts.
\item[Issue 1.19 (1992/01/27) (23rd January 1992)]
$new\_axiom$, $simple\_new\_type\_defn$, $new\_type\_defn$
all changed to take lists of keys, rather than single ones.
\item[Issue 1.20 (1992/01/27) (27th January 1992)]
Corrected arithmetic theorem names.
\item [Issue 1.21 (1992/03/18) (18th  March 1992)]
Used $simple\_taut\_tac$ rather than $taut\_tac$.
\item [Issue 1.22 (1992/03/20)(26th March 1992)]
changed to use new proof context material.
\item [Issue 1.23 (1992/03/26) (2nd April 1992)]
Changes required by CR0016.
\item [Issue 1.25 (1992/04/14) (13th April 1992)]
Changes due to CR0017.
\item[Issue 1.26 (1992/05/15) (15 May 1992)] Use correct quotation symbols.
\item [Issue 1.27 (1992/05/21),1.28 (1992/05/21) (21st May 1992)]
Rearranging proof contexts.
\item[Issue 1.30 (1992/06/24) (24th June 1992)]
Renamings from issue 1.6 of \cite{DS/FMU/IED/WRK038},
mostly proof context name changes.
\item[Issue 1.31 (1993/07/12) (12th July 1993)]
Added theorem about least upper bounds.
\item[Issue 1.32 (2000/12/04) (3rd December 2000)]
Added minimum principle.
\item[Issue 1.33 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.34 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.35 (2005/04/18)] {\em prim\_suc\_conv} can now be used in preference to calling the kernel inference rule directly.
\item[Issue 1.36 (2005/05/07)] HOL now supports left-associative operators.
\item[Issue 1.37 (2005/12/16)] The prefix for private interfaces is now $pp'$ rather than $icl'$.
\item[Issue 1.38 (2014/04/14)] Now uses $new\_spec1$ rather than $new\_spec$.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}

Under development.
\pagebreak
\section{GENERAL}
\subsection{Scope}
This document contains the implementation of the elementary
theory of arithmetic for the ICL HOL proof development system.
\subsection{Introduction}
\subsection{Purpose and Background}
This document will be called for in the yet-to-be-written
\cite{DS/FMU/IED/DTD038}.
\subsection{Dependencis}
The document depends on the theory of pairs given in
\cite{DS/FMU/IED/DTD037}.
\subsection{Deficiencies}
Operator precedences and names need reviewing against requirements.
\subsection{Possible Enhancements}
It might be better to give a loose definition of subtraction.
\section{PROLOGUE}
In this section we create the new theory and begin the structure which
contains the theory.
We actually use three structures, all called $ℕ$
(so the second overwrites the first, and the third the second),
and where the third includes the second includes the first.
This is to ease processing.

=SML
structure ⦏ℕ⦎ = struct
=TEX
First of all we make sure we are in the right theory
and have the right proof context:
=SML
val _ = open_theory"pair";
val _ = new_theory"ℕ";
val _ = push_merge_pcs ["'propositions",
		"'simple_abstractions"];
=TEX
\section{INTRODUCING THE TYPE ℕ}
In this section we define the type ℕ.
The following lemma asserts the existence of what will be the representations
of the $Suc$ and $0$. The characterising property it uses
is the first step on the way from the axiom of infinity to the Peano
postulates and brings out the fact that the successor function is not onto.
=SML
val ⦏lemma1⦎ : THM = (
push_goal([], ⌜
∃suc:IND→IND; zero:IND⦁ OneOne suc ∧ (∀x⦁¬suc x = zero)
⌝);
=TEX
=SML
a(strip_asm_tac infinity_axiom THEN simple_∃_tac⌜f:IND→IND⌝
	THEN asm_rewrite_tac[]);
a(asm_ante_tac⌜¬ Onto (f:IND→IND)⌝ THEN rewrite_tac[onto_def]
	THEN REPEAT strip_tac);
a(simple_∃_tac⌜y:IND⌝ THEN strip_tac THEN conv_tac(ONCE_MAP_C eq_sym_conv)
	THEN asm_rewrite_tac[]);
pop_thm()
);
=TEX
The next lemma is for use in loosely specifying the defining predicate
for the new type. It asserts that for some
subset of $IND$, analogues of the Peano postulates hold for
appropriate representatives of $Suc$ and $0$. The lemma is formulated
for use with $new\_spec$ to define $Is\_ℕ\_Rep$.

Note that the lemma is slightly stronger than what is strictly necessary, in
that the last two conjuncts are not relativised to the subset determined
by $Is\_ℕ\_Rep$. This makes later proofs a little easier.
=SML
val ⦏is_ℕ_rep_thm⦎ : THM = (
push_goal([], ⌜
∃Is_ℕ_Rep:IND → BOOL⦁
	∃ zero suc⦁
		(Is_ℕ_Rep zero ∧ ∀n⦁Is_ℕ_Rep n ⇒ Is_ℕ_Rep(suc n))
	∧	(∀n⦁Is_ℕ_Rep n ⇒ ¬ suc n = zero)
	∧	OneOne suc
	∧	(∀p⦁	p zero ∧ (∀m⦁p m ⇒ p (suc m))
		 ⇒	(∀n⦁Is_ℕ_Rep n ⇒ p n))
⌝);
=TEX
=SML
(* First bring in the lemma: *)
a(strip_asm_tac(rewrite_rule[one_one_def] lemma1));
(* Now exhibit the witnesses: *)
a(simple_∃_tac⌜λi:IND⦁∀q⦁ q zero ∧ (∀n⦁ q n ⇒ q (suc n)) ⇒ q i⌝);
a(simple_∃_tac⌜zero:IND⌝);
a(simple_∃_tac⌜suc:IND→IND⌝);
(* Get rid of beta-redexes and strip the goal: *)
a(rewrite_tac[one_one_def] THEN REPEAT strip_tac);
(* 4 subgoals. 1: *)
a(DROP_NTH_ASM_T 3 (ante_tac o all_simple_∀_elim) THEN asm_rewrite_tac[]);
(* 2: *)
a(asm_rewrite_tac[]);
(* 3: *)
a(POP_ASM_T ante_tac THEN asm_rewrite_tac[]);
(* 4: *)
a(POP_ASM_T (ante_tac o simple_∀_elim⌜p:IND→BOOL⌝) THEN asm_rewrite_tac[]);
=TEX
=SML
pop_thm()
);
=TEX
We now define $Is\_ℕ\_Rep$:
=SML
val ⦏is_ℕ_rep_def⦎ : THM = new_spec1(["Is_ℕ_Rep","is_ℕ_rep_def"], ["Is_ℕ_Rep"], is_ℕ_rep_thm);
=TEX
In order to use $Is\_ℕ\_Rep$, to define the new type, we need to show
that the subset of $IND$ which it determines is non-empty:
=SML
val ⦏ℕ_exist_thm⦎ : THM = (
push_goal([], ⌜∃x:IND⦁ Is_ℕ_Rep x⌝);
=TEX
=SML
a(strip_asm_tac is_ℕ_rep_def);
a(simple_∃_tac ⌜zero:IND⌝ THEN asm_rewrite_tac[]);
pop_thm()
);
=TEX
Now we can introduce the new type:
=SML
val ⦏ℕ_def⦎ : THM = new_type_defn(["ℕ","ℕ_def"], "ℕ", [], ℕ_exist_thm);
=TEX
\section{THE PEANO POSTULATES}
We now prove the existence of a zero-element and a successor
function for the new type satisfying the Peano postulates.
This is just a simple matter of lifting already-proved properties of the
representations of these objects up to the new type, and like most such
simple activities it is rather more difficult than one would hope.

The theorem is formulated for use to define $Zero$ and $Suc$ with
$new\_spec$. Note that the names $Zero$ and $Suc$ used here,
do, and must, agree with those used by $pp'suc\_conv$ as defined
in \cite{DS/FMU/IED/DTD006}.

=SML
val ⦏zero_suc_thm⦎ : THM = (
push_goal([], ⌜
	∃ Zero:ℕ; Suc:ℕ → ℕ⦁
		(∀n⦁ ¬ Suc n = Zero)
	∧	OneOne Suc
	∧	(∀p⦁ p Zero ∧ (∀m⦁p m ⇒ p (Suc m)) ⇒ (∀n⦁p n))
⌝);
=TEX
=SML
(* We use the type lemmas to bring abstraction and representation functions *)
(* for the new type into the assumptions: *)
a (strip_asm_tac (simple_⇒_match_mp_rule type_lemmas_thm ℕ_def));
a (strip_asm_tac (rewrite_rule[one_one_def] is_ℕ_rep_def));
(* Now we can introduce the witnesses: *)
a (simple_∃_tac ⌜(abs:IND → ℕ)zero⌝);
a (simple_∃_tac ⌜λa:ℕ⦁(abs:IND → ℕ)(suc((rep:ℕ → IND) a))⌝);
a (asm_rewrite_tac[one_one_def] THEN REPEAT strip_tac);
(* 3 subgoals: 1: *)
a (lemma_tac ⌜Is_ℕ_Rep((rep:ℕ → IND) n)⌝ THEN_LIST [asm_rewrite_tac[], id_tac]);
(* asm_rewrite_tac proves the lemma so ony 1 subgoal *)
a (lemma_tac ⌜Is_ℕ_Rep(suc((rep:ℕ → IND)n))⌝);
(* 1.1: *)
a (DROP_NTH_ASM_T 5 (ante_tac o simple_∀_elim⌜(rep:ℕ → IND)n⌝) THEN
	REPEAT strip_tac);
(* 1.2: *)
a contr_tac;
a (lemma_tac⌜(rep:ℕ → IND)((abs:IND → ℕ)(suc(rep n)))= rep(abs zero)⌝
	THEN_LIST [asm_rewrite_tac[], id_tac]);
(* asm_rewrite_tac proves the lemma so ony 1 subgoal *)
a (GET_NTH_ASM_T 10 (ante_tac o simple_∀_elim⌜suc((rep:ℕ → IND)n):IND⌝) THEN
	REPEAT strip_tac);
a (GET_NTH_ASM_T 11 (ante_tac o simple_∀_elim⌜zero:IND⌝) THEN
	REPEAT strip_tac);
a (GET_NTH_ASM_T 9 (ante_tac o simple_∀_elim⌜((rep:ℕ → IND)n)⌝) THEN
	REPEAT strip_tac);
a (GET_NTH_ASM_T 4 ante_tac THEN asm_rewrite_tac[]);
(* Completes 1.2 and 1. 2: *)
a (lemma_tac⌜(rep:ℕ → IND)x1 = rep x2⌝);
(* 2.1: *)
a (lemma_tac⌜(suc:IND→IND)((rep:ℕ → IND)x1) = suc(rep x2)⌝);
(* 2.1.1: *)
a (DROP_NTH_ASM_T 5 ante_tac THEN asm_rewrite_tac[] THEN REPEAT strip_tac);
(* only 1 subgoal. *)
a (lemma_tac ⌜(rep:ℕ → IND)((abs:IND → ℕ)(rep x2)) = rep x2
		∧ rep(abs(rep x1)) = rep x1⌝
	THEN_LIST [asm_rewrite_tac[], id_tac]);
a (GET_NTH_ASM_T 3 (ante_tac o simple_∀_elim⌜(rep:ℕ → IND)x2⌝) THEN
	REPEAT strip_tac);
a (GET_NTH_ASM_T 4 (ante_tac o simple_∀_elim⌜(rep:ℕ → IND)x1⌝) THEN
	REPEAT strip_tac);
a (GET_NTH_ASM_T 6 (ante_tac o app_fun_rule ⌜rep:ℕ → IND⌝)
	THEN asm_rewrite_tac[]);
(* Completes 2.1.1. 2.1.2: *)
a (GET_NTH_ASM_T 4 (ante_tac o list_simple_∀_elim[⌜(rep:ℕ → IND)x1⌝,
	⌜(rep:ℕ → IND)x2⌝]) THEN
	REPEAT strip_tac);
(* Completes 2.1.2. 2.2: *)
a (POP_ASM_T (ante_tac o app_fun_rule ⌜abs:IND → ℕ⌝)
	THEN asm_rewrite_tac[]);
(* Completes 2. 3: *)
a (lemma_tac⌜∀a:IND⦁Is_ℕ_Rep a ⇒ Is_ℕ_Rep a ∧ p ((abs:IND → ℕ) a)⌝);
(* 2 subgoals. 3.1: *)
a (lemma_tac⌜∀a:IND⦁Is_ℕ_Rep a ∧ p ((abs:IND → ℕ) a) ⇒
		Is_ℕ_Rep (suc a) ∧ p (abs (suc a))⌝);
(* 2 subgoals. 3.1.1: *)
a (REPEAT strip_tac);
(* 2 subgoals. 3.1.1.1: *)
a (GET_NTH_ASM_T 2 (asm_ante_tac o concl) THEN asm_rewrite_tac[]);
(* Completes 3.1.1.1. 3.1.1.2: *)
a (GET_NTH_ASM_T 3 (ante_tac o simple_∀_elim⌜(abs:IND → ℕ)m⌝));
a (GET_NTH_ASM_T 2 (asm_ante_tac o concl)
	THEN GET_NTH_ASM_T 9 rewrite_thm_tac);
a (strip_tac THEN asm_rewrite_tac[]);
a (GET_NTH_ASM_T 3 (ante_tac o simple_∀_elim⌜(abs:IND → ℕ)a⌝) THEN
	POP_ASM_T rewrite_thm_tac THEN REPEAT strip_tac);
(* Completes 3.1.1. 3.1.2: *)
a (GET_NTH_ASM_T 4 (ante_tac o simple_∀_elim⌜
	λa⦁ Is_ℕ_Rep a ∧ p ((abs:IND → ℕ) a)⌝) THEN
	conv_tac all_simple_β_conv THEN simple_taut_tac);
(* Completes 3.1. 3.2: *)
a (lemma_tac ⌜Is_ℕ_Rep ((rep:ℕ → IND) n)⌝ THEN_LIST
	[asm_rewrite_tac[], id_tac]);
(* asm_rewrite_tac proves the lemma so only one subgoal *)
a (GET_NTH_ASM_T 2 (ante_tac o simple_∀_elim⌜(rep:ℕ → IND) n⌝)
	THEN GET_NTH_ASM_T 11 rewrite_thm_tac THEN REPEAT strip_tac);
=TEX
=SML
pop_thm()
);
=TEX
$new\_spec$ may now be used to introduce the basic operations
on the natural numbers.
=SML
val ⦏zero_suc_def⦎ : THM =
	new_spec1(["⦏Zero⦎", "⦏Suc⦎","zero_suc_def"],
		["Zero", "Suc"], zero_suc_thm);
=TEX
=SML
val ⦏zero_conv⦎ : CONV = ONCE_MAP_C
	(simple_eq_match_conv (eq_sym_rule
	(prim_suc_conv ⌜0⌝)));
=TEX
The individual Peano postulates are trivial to extract from the
definition of $Suc$ and $Zero$:
=SML
val ⦏¬_suc_thm⦎ = (conv_rule zero_conv)(∧_left_elim zero_suc_def);
=TEX
=SML
val ⦏one_one_suc_thm⦎ = rewrite_rule[one_one_def] (∧_left_elim (∧_right_elim zero_suc_def));
=TEX
=SML
val ⦏suc_induction_thm⦎ = (conv_rule zero_conv)(∧_right_elim (∧_right_elim zero_suc_def));
=TEX
\section{INDUCTION TACTIC}
The following tactic implements ordinary mathematical induction.
It takes as its argument the variable on which induction is to be performed.

It is unsatisfactory for two reasons at the moment. Firstly, its error
messages aren't defined. Secondly, and deeper, it assumes that the variable
on which induction is being performed is free in the goal. Requirements here
need investigation.
=SML
fun ⦏suc_induction_tac⦎ (tm : TERM) : TACTIC = (
	if not(is_var tm andalso type_of tm =: ℕ)
	then term_fail "suc_induction_tac" 99999 [tm]
	else let fun aux_tac (gl as (seqasms, conc)) = (
			let	val abs = mk_simple_λ(tm, conc);
				val thm0 = (conv_rule
						(ONCE_MAP_C (simple_β_conv))
						(simple_∀_elim abs suc_induction_thm));
				val thm1 = undisch_rule(conv_rule
	((RATOR_C o RAND_C o RAND_C o RAND_C)(simple_α_conv (fst(dest_var tm))))
						thm0);
				val thm2 = simple_∀_elim tm thm1;
				val conc' = (hd (asms thm2));
			in	([(seqasms, conc')],
				 (fn [th] => prove_asm_rule th thm2
				  | _ => bad_proof "suc_induction_tac"))
			end
		);
	in	aux_tac THEN ∧_tac THEN_LIST [id_tac, simple_∀_tac THEN ⇒_tac]
	end
);
=TEX
\section{PRIMITIVE RECURSION THEOREM}
Our approach to the primitive recursion theorem is a straightforward
adaptation of the approach one might take in set theory.

It is usual in set theory to prove a ``principle of definition by
induction''. E.g. in \cite{Halmos74}, Halmos proves what he calls
the ``recursion theorem'', which (modulo names and a uniqueness assertion)
is the following:

\paragraph{Principle of Definition by Induction (PDI):} Let $X$ be a set, let $z \in X$,
and let $s$ be a function from $X$ to itself, then there exists a unique
function $f$ from $ℕ$ to $X$ such that $f(0) = z$ and
for any $n$, $f(n+1)=s(f n)$.

We wish to prove the slightly stronger ``principle of definition by
primitive recursion'', and the informal statement of which is:

\paragraph{Principle of Definition by Primitive Recursion(PDPR):}
Let $X$ be a set, let $z \in X$,
and let $s$ be a function of two arguments with domain and first codomain
$X$ and with the second codomain $ℕ$, then there exists a unique
function $f$ from $ℕ$ to $X$ such that $f(0) = z$ and
for any $n$, $f(n+1)=s(f n)n$.

Now, $PDPR$, is decidedly more useful than $PDI$, as is clear
when one examines almost any real-life recursive definition, e.g that
of the factorial function. However,
a mathematician would probably not bother to state $PDPR$ result separately,
since it is a fairly trivial consequence of $PDI$: given the problem
data of $PDPR$, one uncurries $s$ and combines it with the identity function
to give a function from $X×ℕ$ to itself to which $PDI$ may be applied
to give a function from $ℕ$ to $X×ℕ$ which composes with the projection
onto the first factor to give the desired function for $PDPR$.
(In both $PDI$ and $PDPR$ the uniqueness part is an easy induction. Halmos
does not even bother to mention it.)

Our plan for proving $PDPR$ therefore is to prove $PDI$ by adapting the
standard proof from set-theory and to derive $PDPR$ from it by formalising
the remarks of the previous paragraph.

\subsection{Definition by Induction}
As we have mentioned we will
prove the principle of definition by induction following the usual
set-theoretic proof, which may be found, for example, in \cite{Halmos74}.
The informal statement and a sketch of the proof is as follows:

\paragraph{Principle of Definition by Induction:} Let $X$ be a set, let $z \in X$,
and let $s$ be a function from $X$ to itself, then there exists a unique
function $f$ from $ℕ$ to $X$ such that $f(0) = z$ and
for any $n$, $f(n+1)=s(f n)$.

\paragraph{Sketch Proof} The uniqueness part is a straight forward proof by
induction; for the existence, let $\cal C$ be the collection of all subsets, $R$,  of
$ℕ \times X$ such that $(0, z)\in R$ and for any $n\in ℕ$ and $x\in X$,
$(n+1, s x)\in X$ if $(n, x)\in X$. Let $Q = \bigcap \cal C$. We then
prove the following:

\begin{enumerate}
\item $Q \in \cal C$;
\item $Q$ is the graph of a function;
\item the function whose graph is $Q$ is the desired function $f$.
\end{enumerate}

This completes the proof.

This proof translates into HOL reasonably straightforwardly. To avoid
a dependency on the theory of sets, we work with two-place relations instead
of subsets of $ℕ \times X$.

Much of the work of the proof is in exhibiting elements from the collection
$\cal C$ satisfying certain requirements. This is done in the following
lemmas, the first of which is fairly easy. In terms of the informal proof,
it says that exists an $R\in \cal C$ such that $(0, x)\in R$ iff. $x = z$.
Note that the first two conjuncts in the HOL statement below stand for
the assertion that $R\in \cal C$.
=SML
val ⦏rec_lemma1⦎ = (
push_goal([],
	⌜∀z:'a⦁∀s:'a→'a⦁ ∃r:ℕ→'a→BOOL⦁
		r 0 z
	∧	(∀n x⦁r n x ⇒ r(Suc n)(s x))
	∧	∀x:'a⦁r 0 x ⇒ x = z⌝);
=TEX
=SML
a(REPEAT strip_tac THEN simple_∃_tac⌜λ(k:ℕ) (y:'a)⦁¬(k = 0) ∨ (k = 0 ∧ y = z)⌝);
a(rewrite_tac[¬_suc_thm]);
pop_thm()
);
=TEX
The second lemma exhibiting an element of $\cal C$ is rather harder, and
requires the following arithmetic result:
=SML
val ⦏rec_lemma2⦎ = (
push_goal([], ⌜∀n:ℕ⦁¬(Suc n = n)⌝);
=TEX
=SML
a(REPEAT strip_tac THEN suc_induction_tac ⌜n:ℕ⌝);
(* 2 subgoals: 1: *)
a(rewrite_tac[¬_suc_thm]);
(* 2: *)
a(contr_tac THEN strip_asm_tac (list_simple_∀_elim[⌜Suc n⌝, ⌜n:ℕ⌝]
	one_one_suc_thm));
pop_thm()
);
=TEX
The second lemma exhibiting an element of $\cal C$ asserts that for
any $k\in ℕ$, there exists $R\in \cal C$ and $t\in X$ such that
$(k, x)\in R$ iff. $x = t$. Note that this implies
that $\bigcap \cal C$ is the graph of a (possibly partial) function on $ℕ$.
=SML
val ⦏rec_lemma3⦎ = (
push_goal([],
	⌜∀z:'a⦁∀s:'a→'a⦁ ∀k:ℕ⦁∃r:ℕ→'a→BOOL⦁
		r 0 z
	∧	(∀n x⦁r n x ⇒ r(Suc n)(s x))
	∧	∃t⦁r k t ∧ ∀x:'a⦁r k x ⇒ x = t⌝);
=TEX
=SML
a(REPEAT strip_tac THEN suc_induction_tac⌜k:ℕ⌝);
(* 2 subgoals: 1 (base case): *)
a(strip_asm_tac (all_simple_∀_elim rec_lemma1)
	THEN simple_∃_tac⌜r:ℕ→'a→BOOL⌝);
a(asm_rewrite_tac[] THEN simple_∃_tac⌜z:'a⌝ THEN asm_rewrite_tac[]);
(* 2 *)
a(simple_∃_tac⌜λ(i:ℕ) (y:'a)⦁if Suc k = i then y = s (t:'a) else r i y⌝
	THEN rewrite_tac[¬_suc_thm] THEN REPEAT strip_tac);
(* 7 subgoals: 2.1: *)
a(strip_asm_tac (list_simple_∀_elim[⌜k:ℕ⌝, ⌜n:ℕ⌝]one_one_suc_thm));
a(asm_ante_tac ⌜(r:ℕ→'a→BOOL) n x⌝ THEN
	POP_ASM_T (rewrite_thm_tac o eq_sym_rule));
a(lemma_tac ⌜(r:ℕ→'a→BOOL) k x ⇒ x = t⌝ THEN asm_rewrite_tac[]);
(* 2.2: *)
a(asm_ante_tac ⌜(r:ℕ→'a→BOOL) n x⌝ THEN asm_rewrite_tac[]);
(* 2.3: *)
a(asm_ante_tac ⌜Suc k = n⌝ THEN asm_rewrite_tac[rec_lemma2]);
(* 2.4 *)
a(LEMMA_T ⌜(r:ℕ→'a→BOOL) n x⌝ ante_tac);
(* 2 subgoals. 2.4.1: *)
a(DROP_ASM_T⌜Suc k = n⌝ (asm_rewrite_thm_tac o eq_sym_rule));
a(asm_ante_tac ⌜(r:ℕ→'a→BOOL) k t⌝ THEN asm_rewrite_tac[]);
(* 2.4.2: *)
a(asm_rewrite_tac[]);
(* 2.5: *)
a(strip_asm_tac (list_simple_∀_elim[⌜k:ℕ⌝, ⌜n:ℕ⌝]one_one_suc_thm));
a(asm_ante_tac ⌜(r:ℕ→'a→BOOL) n x⌝ THEN POP_ASM_T
	(rewrite_thm_tac o eq_sym_rule));
a(lemma_tac ⌜(r:ℕ→'a→BOOL) k x ⇒ x = t⌝ THEN asm_rewrite_tac[]);
(* 2.6: *)
a(asm_ante_tac ⌜(r:ℕ→'a→BOOL) n x⌝ THEN asm_rewrite_tac[]);
(* 2.7: *)
a(simple_∃_tac⌜(s:'a→'a)t⌝ THEN REPEAT strip_tac THEN asm_rewrite_tac[]);
=TEX
=SML
pop_thm()
);
=TEX
We can now prove the existence part of the principle of definition of
induction (in terms of two-place relations):
=SML
val ⦏rec_lemma4⦎ = (
push_goal([],
	⌜∀z:'a⦁∀s:'a→'a⦁ ∃r:ℕ→'a→BOOL⦁
		r 0 z
	∧	(∀n x⦁r n x ⇒ r(Suc n)(s x))
	∧	(∀m⦁∃y⦁r m y ∧ ∀x⦁r m x ⇒ x = y)⌝);

a(REPEAT strip_tac THEN
  simple_∃_tac⌜(λ(k:ℕ) (y:'a)⦁(∀q⦁(q 0 z ∧ (∀n x⦁q n x ⇒ q(Suc n)(s x))) ⇒ q k y))⌝);
a(rewrite_tac[] THEN REPEAT strip_tac);
(* 2 subgoals: 1: *)
a(DROP_NTH_ASM_T 3 (ante_tac o simple_∀_elim⌜q:ℕ→'a→BOOL⌝)
	THEN asm_rewrite_tac[]);
(* 1.2: *)
a(suc_induction_tac ⌜m:ℕ⌝);
(* 2 subgoals: 2.1: *)
a(simple_∃_tac⌜z:'a⌝ THEN REPEAT strip_tac);
a(strip_asm_tac(all_simple_∀_elim rec_lemma1));
a(DROP_NTH_ASM_T 4 (ante_tac o simple_∀_elim⌜r:ℕ→'a→BOOL⌝)
	THEN asm_rewrite_tac[]);
(* 2.2: *)
a(simple_∃_tac ⌜(s:'a→'a)y⌝ THEN REPEAT strip_tac);
(* 2 subgoals: 2.2.1: *)
a(DROP_NTH_ASM_T 4 (ante_tac o simple_∀_elim⌜q:ℕ→'a→BOOL⌝)
	THEN asm_rewrite_tac[]);
(* 2.2.2: *)
a(strip_asm_tac(list_simple_∀_elim[⌜z:'a⌝, ⌜s:'a→'a⌝, ⌜Suc m⌝]rec_lemma3));
a(lemma_tac ⌜(r:ℕ→'a→BOOL)m y⌝);
(* 2.2.2.1: *)
a(DROP_NTH_ASM_T 7 (ante_tac o simple_∀_elim⌜r:ℕ→'a→BOOL⌝)
	THEN asm_rewrite_tac[]);
(* 2.2.2.2: *)
a(lemma_tac ⌜(r:ℕ→'a→BOOL)(Suc m) (s:'a→'a y)⌝);
(* 2.2.2.2.1: *)
a(DROP_NTH_ASM_T 4 (ante_tac o list_simple_∀_elim[⌜m:ℕ⌝, ⌜y:'a⌝])
	THEN asm_rewrite_tac[]);
(* 2.2.2.2.2: *)
a(lemma_tac ⌜(r:ℕ→'a→BOOL)(Suc m) x⌝);
(* 2.2.2.2.2.1: *)
a(DROP_NTH_ASM_T 7 (ante_tac o simple_∀_elim⌜r:ℕ→'a→BOOL⌝)
	THEN asm_rewrite_tac[]);
(* 2.2.2.2.2.2: *)
a(GET_NTH_ASM_T 4 (ante_tac o simple_∀_elim⌜x:'a⌝));
a(DROP_NTH_ASM_T 4 (ante_tac o simple_∀_elim⌜s:'a→'a y⌝));
a(strip_tac THEN asm_rewrite_tac[]);
=TEX
=SML
pop_thm()
);
=TEX
It turns out to be slightly more convenient to have available
the following trivial consequence of $fun\_rel\_thm$:
=SML
val ⦏rec_lemma5⦎ = (
push_goal([], ⌜∀r:'a→'b→BOOL⦁
	(∀x⦁∃y⦁r x y ∧ ∀z⦁r x z ⇒ z = y) ⇒ (∃f⦁∀x y⦁(f x = y) = r x y)
⌝);
=TEX
=SML
a(rewrite_tac[fun_rel_thm]);
pop_thm()
);
=TEX
The following result gives the uniqueness part of the principle
of definition by induction:
=SML
val ⦏rec_lemma6⦎ = (
push_goal([],
	⌜∀z:'a⦁∀s:'a→'a⦁ ∀f g:ℕ→'a⦁
	(	(	f 0 = z
		∧	∀n:ℕ⦁f(Suc n) = s(f n))
		∧ (	g 0 = z
		∧	∀n:ℕ⦁g(Suc n) = s(g n)))
	⇒	f = g⌝);
=TEX
=SML
a(REPEAT strip_tac THEN pure_once_rewrite_tac[ext_thm]);
a(strip_tac THEN suc_induction_tac ⌜x:ℕ⌝ THEN asm_rewrite_tac[]);
=TEX
=SML
pop_thm()
);
=TEX
Using $rec_lemma5$, we now prove the existence part of the principle
of definition by induction in terms of HOL functions:
=SML
val ⦏rec_lemma7⦎ = (
push_goal([],
	⌜∀z:'a⦁∀s:'a→'a⦁ ∃f:ℕ→'a⦁
		f 0 = z
	∧	∀n:ℕ⦁f(Suc n) = s(f n)⌝);
=TEX
=SML
a(REPEAT strip_tac);
a((strip_asm_tac o all_simple_∀_elim) rec_lemma4);
a( (ante_tac o simple_∀_elim⌜r:ℕ→'a→BOOL⌝ o
	inst_type_rule[(ℕ, ⓣ'a⌝), (ⓣ'a⌝, ⓣ'b⌝)]) rec_lemma5);
a(asm_rewrite_tac [] THEN REPEAT strip_tac);
a(simple_∃_tac⌜f:ℕ→'a⌝);
a(REPEAT strip_tac THEN asm_rewrite_tac[]);
(* Only 1 subgoal *)
a(suc_induction_tac⌜n:ℕ⌝);
(* 2 subgoals: 1 (base case): *)
a(LEMMA_T ⌜(f 0):'a=z⌝ rewrite_thm_tac);
(* 1.1: *)
a(asm_rewrite_tac[]);
(* 1.2: *)
a(asm_ante_tac⌜(r:ℕ→'a→BOOL) 0 z⌝ THEN asm_rewrite_tac[]);
(* 2 (step): *)
a(LEMMA_T⌜(f(Suc n)):'a=s(f n)⌝ rewrite_thm_tac);
(* 2.1: *)
a(asm_rewrite_tac[]);
(* 2.2: *)
a(TOP_ASM_T (asm_ante_tac o concl) THEN asm_rewrite_tac[]);
=TEX
=SML
pop_thm()
);
=TEX
We can now assemble the existence and uniqueness parts of the
theorem to give the desired principle of definition by induction:
=SML
val ⦏induct_def_thm⦎ = (
push_goal([],
	⌜∀z:'a⦁∀s:'a→'a⦁ ∃⋎1f:ℕ→'a⦁
		f 0 = z
	∧	∀n:ℕ⦁f(Suc n) = s(f n)⌝);
=TEX
=SML
a(REPEAT strip_tac THEN conv_tac simple_∃⋎1_conv);
a(strip_asm_tac(all_simple_∀_elim rec_lemma7) THEN simple_∃_tac⌜f:ℕ→'a⌝);
a(asm_rewrite_tac[]);
a(REPEAT strip_tac THEN
	ante_tac (list_simple_∀_elim[⌜z:'a⌝, ⌜s:'a→'a⌝, ⌜f:ℕ→'a⌝, ⌜x:ℕ→'a⌝]rec_lemma6));
a(asm_rewrite_tac[] THEN ⇒_T (accept_tac o eq_sym_rule));
pop_thm()
);
=TEX
\subsection{Primitive Recursion Theorem}
As we have already mentioned, the existence part
of the primitive recursion theorem is a straightforward consequence of
the principle of definition by induction: given a set $X$, an element $z\in X$
and a two-place function, $s$, from $X × ℕ$ to X, we use the principle of
definition by induction to define a function from $ℕ$ to $X × ℕ$
which sends $0$ to $(0, z) an,d for any $n$, sends $n+1$ to
$(n+1, s(f n))$. The composite of this function with projection onto
the first factor of $X × ℕ gives the desired function, $f$ say, from
$ℕ$ to $X$ satisfying $f(0)=z$ and $f(n+1)=s(f(n), n)$.

The HOL translation of the above argument is the following:

=SML
val ⦏rec_lemma8⦎ = (
push_goal([],
	⌜∀z:'a⦁∀s:'a→ℕ→'a⦁ ∃f:ℕ→'a⦁
		f 0 = z
	∧	∀n:ℕ⦁f(Suc n) = s(f n)n⌝);
=TEX
=SML
a(REPEAT strip_tac THEN strip_asm_tac
	(list_simple_∀_elim[⌜((z:'a), 0)⌝, ⌜λ ix:'a × ℕ⦁((s (Fst ix) (Snd ix):'a), Suc(Snd ix))⌝]
	(inst_type_rule[(ⓣ'a × ℕ⌝, ⓣ'a⌝)] rec_lemma7)));
a(simple_∃_tac ⌜λi⦁Fst((f:ℕ→('a × ℕ)) i)⌝);
a(GET_ASM_T ⌜(f 0:'a × ℕ) = (z, 0)⌝ (fn th=> rewrite_tac[pair_clauses, th]));
a(strip_tac THEN suc_induction_tac⌜n:ℕ⌝);
(* 2 subgoals: 1 (base case) *)
a(asm_rewrite_tac[pair_clauses]);
(* 1/2: (step) *)
a(asm_rewrite_tac[pair_clauses]);
a(LEMMA_T ⌜∀k⦁Snd((f:ℕ→('a × ℕ))k) = k⌝ rewrite_thm_tac);
a(strip_tac THEN suc_induction_tac⌜k:ℕ⌝ THEN asm_rewrite_tac[pair_clauses]);
=TEX
=SML
pop_thm()
);
=TEX
The uniqueness part of the primitive recursion theorem is
straightforward:
=SML
val ⦏rec_lemma9⦎ = (
push_goal([],
	⌜∀z:'a⦁∀s:'a→ℕ→'a⦁ ∀f g:ℕ→'a⦁
	(	(	f 0 = z
		∧	∀n:ℕ⦁f(Suc n) = s(f n)n)
		∧ (	g 0 = z
		∧	∀n:ℕ⦁g(Suc n) = s(g n)n))
	⇒	f = g⌝);
=TEX
=SML
a(REPEAT strip_tac THEN pure_once_rewrite_tac[ext_thm]);
a(strip_tac THEN suc_induction_tac⌜x:ℕ⌝ THEN asm_rewrite_tac[]);
=TEX
=SML
pop_thm()
);
=TEX
Assembling $rec_lemma8$ and $rec_lemma9$ to give the primitive recursion theorem
in its usual form, is just like the corresponding step in the
proof of the principle of definition by induction:
=SML
val ⦏suc_prim_rec_thm⦎ = (
push_goal([],
	⌜∀z:'a⦁∀s:'a→ℕ→'a⦁ ∃⋎1f:ℕ→'a⦁
		f 0 = z
	∧	∀n:ℕ⦁f(Suc n) = s(f n)n⌝);
=TEX
=SML
a(REPEAT strip_tac THEN conv_tac simple_∃⋎1_conv);
a(strip_asm_tac(all_simple_∀_elim rec_lemma8) THEN simple_∃_tac⌜f:ℕ→'a⌝);
a(asm_rewrite_tac[]);
a(REPEAT strip_tac THEN
	ante_tac (list_simple_∀_elim[⌜z:'a⌝, ⌜s:'a→ℕ→'a⌝, ⌜f:ℕ→'a⌝, ⌜x:ℕ→'a⌝]rec_lemma9));
a(asm_rewrite_tac[] THEN ⇒_T (accept_tac o eq_sym_rule));
pop_thm()
);

=TEX
\section{THE ARITHMETIC OPERATORS}
\subsection{Interlude}
The following is required to circumvent a compiler problem which would
be caused if we attempted to include all the material in this document
in one Standard ML structure:
=SML
end; (* of structure ℕ (part 1) *)
structure ℕ = struct
open ℕ;
=TEX
\subsection{Fixity Declarations}
We choose fixities for the arithmetic operations as follows:
=SML
val side_effect = (
declare_infix(210, "<");
declare_infix(210, ">");
declare_infix(210, "≤");
declare_infix(210, "≥");
declare_infix(300, "+");
declare_left_infix(305, "-");
declare_infix(310, "*");
declare_left_infix(315, "Div");
declare_left_infix(315, "Mod")
);
=TEX
Thus, the relational operations are lower precedence than the operations
which return numbers. Addition and subtraction are lower precedence than
multiplication, division and modulus.

These precedences may need to be altered in the light of comparison with
other theories.
\subsection{Addition}
The defining property for $+$ includes a clause about the relation
of $+$ with $Suc$, with a view to freeing the world from $Suc$ as soon
as possible. Indeed, it would, in principle, be possible to build
the theory without ever defining $Suc$, however this would effectively
involve proving all of the results we have proved to date relativised to
the representation type for $ℕ$ followed by a mammoth task of lifting them
to $ℕ$. Since some people seem to like $Suc$, and it will have its uses from the
efficiency point of view in coding some proof procedures, we have taken it
as primitive.
=SML
val ⦏plus_def⦎ = new_spec1(["+","plus_def"], ["+"], (
push_goal([], ⌜
	∃$+:ℕ→ℕ→ℕ⦁ ∀m n⦁
		0 + n = n
	∧	(m + 1) + n = (m + n) + 1
	∧	Suc m = m + 1
⌝);
=TEX
=SML
a(lemma_tac ⌜
	∃$+:ℕ→ℕ→ℕ⦁ ∀m n⦁
		0 + n = n
	∧	(Suc m) + n = Suc (m + n)
⌝);
(* 1: *)
a(strip_asm_tac	(conv_rule all_simple_β_conv
	(list_simple_∀_elim
	[⌜λn:ℕ⦁n⌝, ⌜λf:ℕ→ℕ⦁λm:ℕ⦁λn⦁Suc(f n)⌝]
	(inst_type_rule[(ⓣℕ→ℕ⌝, ⓣ'a⌝)]suc_prim_rec_thm))));
a(simple_∃_tac ⌜f:ℕ→ℕ→ℕ⌝);
a(REPEAT strip_tac THEN asm_rewrite_tac[]);
(* 2: *)
a(simple_∃_tac ⌜$+:ℕ→ℕ→ℕ⌝ THEN asm_rewrite_tac[]);
a(LEMMA_T ⌜∀m⦁m + 1 = Suc m⌝ asm_rewrite_thm_tac);
(* The rewriting proves the goal, so only the lemma to do *)
a(strip_tac THEN suc_induction_tac ⌜m:ℕ⌝);
(* 2.1: *)
a (conv_tac (ONCE_MAP_C suc_conv) THEN asm_rewrite_tac[]);
(* 2.2 *)
a (asm_rewrite_tac[]);
=TEX
=SML
pop_thm()
));
=TEX
\subsection{Some Earlier Work Revisited}
We use $+1$ in preference to $Suc$ from now on and so we must carry
the induction and primitive recursion theorems etc. over to use
this notation.
=SML
val ⦏induction_thm⦎ = save_thm("induction_thm",
	rewrite_rule[plus_def] suc_induction_thm);
val ⦏¬_plus1_thm⦎ = save_thm("¬_plus1_thm",
		rewrite_rule[plus_def] ¬_suc_thm);
val ⦏one_one_plus1_thm⦎ = save_thm("one_one_plus1_thm",
		rewrite_rule[plus_def] one_one_suc_thm);
val ⦏prim_rec_thm⦎ = save_thm("prim_rec_thm",
	rewrite_rule[plus_def] suc_prim_rec_thm);
=TEX
=SML
fun ⦏INDUCTION_T⦎ (tm : TERM) : (THM -> TACTIC) -> TACTIC = (
	if not(is_var tm andalso type_of tm =: ℕ)
	then term_fail "INDUCTION_T" 38001 [tm]
	else (fn thmtac =>
		let fun aux_tac (gl as (seqasms, conc)) = (
			if not (is_free_in tm conc)
			then term_fail "INDUCTION_T" 38002 [tm]
			else if any seqasms (is_free_in tm)
			then term_fail "INDUCTION_T" 38003 [tm]
			else let
				val abs = mk_simple_λ(tm, conc);
				val thm0 = (conv_rule
						(ONCE_MAP_C (simple_β_conv))
						(simple_∀_elim abs induction_thm));
				val thm1 = undisch_rule(conv_rule
	((RATOR_C o RAND_C o RAND_C o RAND_C)
	 (simple_α_conv (fst(dest_var tm))))
						thm0);
				val thm2 = simple_∀_elim tm thm1;
				val conc' = (hd (asms thm2));
			in	([(seqasms, conc')],
				 (fn [th] => prove_asm_rule th thm2
				  | _ => bad_proof "INDUCTION_T"))
			end
		);
		in	aux_tac THEN ∧_tac THEN_LIST
			[id_tac, simple_∀_tac THEN ⇒_T thmtac]
		end)
);
=TEX
=SML
fun ⦏induction_tac⦎ (tm : TERM) : TACTIC = (
	let	val tac = (INDUCTION_T tm strip_asm_tac);
	in	fn gl => (tac gl
			handle ex => pass_on ex "INDUCTION_T" "induction_tac")
	end handle ex => pass_on ex "INDUCTION_T" "induction_tac"
);
=TEX
=SML
val ⦏plus1_lemma⦎ = tac_proof(([], ⌜∀m⦁Suc m = m + 1⌝), rewrite_tac[plus_def]);
val ⦏plus1_conv⦎ : CONV = (fn tm =>
	((suc_conv THEN_C simple_eq_match_conv plus1_lemma) tm)
	handle ex => pass_on ex "suc_conv" "plus1_conv");	
=TEX
\subsection{Arithmetic Relations}
We first define $≤$ using an obvious definition as
characterising theorem. Then we define $≥$, $<$ and $>$
in terms of it.

=SML
val ⦏≤_def⦎ = new_spec1(["≤","≤_def"], ["≤"], (
push_goal([], ⌜
	∃$≤:ℕ→ℕ→BOOL⦁ ∀m n⦁ m ≤ n ⇔ ∃ i:ℕ ⦁ m + i = n
⌝);
=TEX
=SML
a(simple_∃_tac⌜λm n ⦁ ∃ i:ℕ ⦁ m + i = n⌝ THEN rewrite_tac[]);
=TEX
=SML
pop_thm()
));
=TEX
=SML
val ⦏≥_def⦎ = new_spec1(["≥","≥_def"], ["≥"], (
push_goal([], ⌜
	∃$≥:ℕ→ℕ→BOOL⦁ ∀m n⦁ m ≥ n ⇔ n ≤ m
⌝);
=TEX
=SML
a(simple_∃_tac ⌜λm n⦁ n ≤ m⌝ THEN rewrite_tac[]);
=TEX
=SML
pop_thm()
));
=TEX
=SML
val ⦏less_def⦎ = new_spec1(["<","less_def"], ["<"], (
push_goal([], ⌜
	∃$<:ℕ→ℕ→BOOL⦁ ∀m n⦁ m < n ⇔ m + 1 ≤ n
⌝);
=TEX
=SML
a(simple_∃_tac ⌜λm n⦁ m + 1 ≤ n⌝ THEN rewrite_tac[]);
=TEX
=SML
pop_thm()
));
=TEX
=SML
val ⦏greater_def⦎ = new_spec1([">","greater_def"], [">"], (
push_goal([], ⌜
	∃$>:ℕ→ℕ→BOOL⦁ ∀m n⦁ m > n ⇔ n < m
⌝);
=TEX
=SML
a(simple_∃_tac ⌜λm n⦁ n < m⌝ THEN rewrite_tac[]);
=TEX
=SML
pop_thm()
));
=TEX
\subsection{Multiplication}
=SML
val ⦏times_def⦎ = new_spec1(["*","times_def"], ["*"], (
push_goal([], ⌜
	∃$*:ℕ→ℕ→ℕ⦁ ∀m n⦁
		0 * n = 0
	∧	(m + 1) * n = m * n + n
⌝);
=TEX
=SML
a(strip_asm_tac	(conv_rule all_simple_β_conv
	(list_simple_∀_elim
	[⌜λn:ℕ⦁0⌝, ⌜λf:ℕ→ℕ⦁λm:ℕ⦁λn⦁f n + n
⌝]
	(inst_type_rule[(ⓣℕ→ℕ⌝, ⓣ'a⌝)]prim_rec_thm))));
a(simple_∃_tac ⌜f:ℕ→ℕ→ℕ⌝);
a(asm_rewrite_tac[]);
=TEX
=SML
pop_thm()
));
=TEX
\subsection{Modulus}
We characterise $Mod$ by an odometer-style definition. This seems to be the
most straightforward way.
=SML
val ⦏mod_def⦎ = new_spec1(["Mod","mod_def"], ["Mod"], (
push_goal([], ⌜
	∃$Mod:ℕ→ℕ→ℕ⦁ ∀m n⦁
		0 < n ⇒
		0 Mod n = 0
	∧	(m + 1) Mod n = if m Mod n + 1 < n then m Mod n + 1 else 0
⌝);
=TEX
=SML
a(strip_asm_tac	(conv_rule all_simple_β_conv
	(list_simple_∀_elim
	[⌜λn:ℕ⦁0⌝, ⌜λf:ℕ→ℕ⦁λm:ℕ⦁λn⦁if f n + 1 < n then f n + 1 else 0
⌝]
	(inst_type_rule[(ⓣℕ→ℕ⌝, ⓣ'a⌝)]prim_rec_thm))));
a(simple_∃_tac ⌜f:ℕ→ℕ→ℕ⌝);
a(asm_rewrite_tac[]);
=TEX
=SML
pop_thm()
));
=TEX
\subsection{Division}
We characterise $Div$ using $Mod$.
=SML
val ⦏div_def⦎ = new_spec1(["Div","div_def"], ["Div"], (
push_goal([], ⌜
	∃$Div:ℕ→ℕ→ℕ⦁ ∀m n⦁
		0 < n ⇒
		0 Div n = 0
	∧	(m + 1) Div n = if m Mod n + 1 < n then m Div n else m Div n + 1
⌝);
=TEX
=SML
a(strip_asm_tac	(conv_rule all_simple_β_conv
	(list_simple_∀_elim
	[⌜λn:ℕ⦁0⌝, ⌜λf:ℕ→ℕ⦁λm:ℕ⦁λn⦁if m Mod n + 1 < n then f n else f n + 1
⌝]
	(inst_type_rule[(ⓣℕ→ℕ⌝, ⓣ'a⌝)]prim_rec_thm))));
a(simple_∃_tac ⌜f:ℕ→ℕ→ℕ⌝);
a(asm_rewrite_tac[]);
=TEX
=SML
pop_thm()
));
=TEX
\subsection{Associativity of $+$}

We wish to prove the associativity of $+$.

=SML
val ⦏plus_assoc_thm⦎ = (
push_goal([],⌜∀ i m n ⦁ (i + m) + n  =  i + m + n⌝);
=TEX
=SML
a(strip_tac THEN induction_tac ⌜i:ℕ⌝ THEN
	asm_rewrite_tac[plus_def]);
save_pop_thm"plus_assoc_thm"
);
=TEX
=SML
val ⦏plus_assoc_thm1⦎ = (
push_goal([],⌜∀ i m n ⦁ i + m + n  =  (i + m) + n⌝);
=TEX
=SML
a(rewrite_tac[plus_assoc_thm]);
save_pop_thm"plus_assoc_thm1"
);
=TEX

\subsection{Commutativity of $+$}

We wish to prove the commutativity of $+$.
=SML
val ⦏plus_comm_thm⦎ = (
push_goal([],⌜∀ m n ⦁ m + n  =  n + m⌝);
=TEX
=SML
a(MAP_EVERY (fn x => strip_tac THEN induction_tac x)[⌜m:ℕ⌝,⌜n:ℕ⌝]);
(* *** Goal "1" *** *)
a(rewrite_tac[]);
(* *** Goal "2" *** *)
a(rewrite_tac[plus_def]);
a(TOP_ASM_T (rewrite_thm_tac o eq_sym_rule));
a(rewrite_tac[plus_def]);
(* *** Goal "3" *** *)
a(rewrite_tac[plus_def]);
a(TOP_ASM_T (rewrite_thm_tac o simple_∀_elim⌜0⌝));
a(rewrite_tac[plus_def]);
(* *** Goal "4" *** *)
a(rewrite_tac[plus_def]);
a(TOP_ASM_T (rewrite_thm_tac o eq_sym_rule));
a(once_rewrite_tac[plus_def]);
a(rewrite_tac[plus_assoc_thm]);
save_pop_thm"plus_comm_thm"
);
=TEX
=SML
val ⦏plus_def1⦎ = (
push_goal ([],⌜
∀ m n⦁ m + 0 = m ∧ m + (n + 1) = (m + n) + 1
⌝);
a(rewrite_tac[plus_assoc_thm]);
a(once_rewrite_tac[plus_comm_thm] THEN rewrite_tac[plus_def]);
pop_thm()
);
=TEX
\subsection{Reordering Sums}
If we specialise $i$ in the following theorem to $t$ say, repeated rewriting
with the resulting theorem will change any term of the form
$a + b + \ldots + t + \ldots$ into a term of the form $t + \ldots$.
=SML
val ⦏plus_order_thm⦎ = (
push_goal([], ⌜∀i m n⦁
		m + i = i + m
	∧	(i + m) + n = i + m + n
	∧	m + i + n = i + m + n
⌝);
a(rewrite_tac[plus_assoc_thm, simple_∀_elim⌜m:ℕ⌝plus_comm_thm]);
save_pop_thm"plus_order_thm"
);
=IGN
rewrite_conv[simple_∀_elim⌜1⌝plus_order_thm] ⌜
	(101 + 102) + 2 + 3 + (1 + 2 + 99) + (55 + 10) +
	(101 + 102) + 2 + 3 + (3 + 1 + 99) + (55 + 10)
	⌝;
=TEX
\subsection{Cancellation Rules for $+$}
=SML
val ⦏plus_lemma1⦎ = (
push_goal([], ⌜∀m⦁
		m + 0 = m
	∧	0 + m = m
⌝);
a(rewrite_tac[plus_def, plus_def1]);
pop_thm()
);
=TEX
=SML
val ⦏plus_lemma2⦎ = (
push_goal([], ⌜∀m n⦁
		m + 1 = n + 1 ⇔ m = n
⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(strip_asm_tac (list_simple_∀_elim[⌜m:ℕ⌝, ⌜n:ℕ⌝]one_one_plus1_thm));
(* *** Goal "2" *** *)
a(asm_rewrite_tac[]);
pop_thm()
);
=TEX
=SML
val ⦏plus_lemma3⦎ = (
push_goal([], ⌜¬1 = 0⌝);
a(conv_tac (ONCE_MAP_C suc_conv) THEN rewrite_tac[¬_suc_thm]);
pop_thm()
);
=TEX
=SML
val ⦏plus_lemma4⦎ = (
push_goal([], ⌜∀m n⦁m + n = 0 ⇔ m = 0 ∧ n = 0⌝);
a(strip_tac THEN strip_tac THEN induction_tac⌜n:ℕ⌝
	THEN asm_rewrite_tac[plus_assoc_thm1, ¬_plus1_thm, plus_lemma1, plus_lemma3]);
pop_thm()
);
=TEX
=SML
val ⦏plus_lemma5⦎ = (
push_goal([], ⌜∀m n i⦁
		(m + i = n + i ⇔ m = n)
	∧	(m + i = i ⇔ m = 0)
⌝);
a(REPEAT strip_tac THEN TRY_T (asm_rewrite_tac[plus_lemma1])
	THEN POP_ASM_T ante_tac THEN induction_tac⌜i:ℕ⌝
	THEN asm_rewrite_tac[plus_lemma1, plus_assoc_thm1, plus_lemma2]);
pop_thm()
);
val ⦏plus_clauses⦎ = (
push_goal([], ⌜∀m n i⦁
		(m + i = n + i ⇔ m = n)
	∧	(i + m = n + i ⇔ m = n)
	∧	(m + i = i + n ⇔ m = n)
	∧	(i + m = i + n ⇔ m = n)
	∧	(m + i = i ⇔ m = 0)
	∧	(i + m = i ⇔ m = 0)
	∧	(i = i + n ⇔ n = 0)
	∧	(i = n + i ⇔ n = 0)
	∧	(m + i = 0 ⇔ m = 0 ∧ i = 0)
	∧	(0 = m + i ⇔ m = 0 ∧ i = 0)
	∧	(m + 0 = m ∧ 0 + m = m)
	∧	¬1 = 0
	∧	¬0 = 1
⌝);
a(rewrite_tac[eq_sym_conv⌜0 = 1⌝, eq_sym_conv⌜i = n + i⌝,
	eq_sym_conv ⌜0 = m + i⌝,
	simple_∀_elim⌜i:ℕ⌝ plus_comm_thm,
	plus_lemma1, plus_lemma2, plus_lemma3, plus_lemma4, plus_lemma5]);
save_pop_thm"plus_clauses"
);
=TEX
\subsection{Transitivity for $\leq $ and $<$}
=SML
val ⦏≤_trans_thm⦎ = (
push_goal([], ⌜∀m i n⦁m ≤ i ∧  i ≤ n ⇒ m ≤ n⌝);
a(rewrite_tac[≤_def] THEN REPEAT strip_tac);
a(simple_∃_tac⌜i' + i''⌝ THEN asm_rewrite_tac[plus_assoc_thm1]);
save_pop_thm"≤_trans_thm"
);
=TEX
=SML
val ⦏less_trans_thm⦎ = (
push_goal([], ⌜∀m i n⦁m < i ∧  i < n ⇒ m < n⌝);
a(rewrite_tac[≤_def, less_def] THEN REPEAT strip_tac);
a(simple_∃_tac⌜i' + 1 + i''⌝ THEN asm_rewrite_tac[plus_assoc_thm1]);
save_pop_thm"less_trans_thm"
);
=TEX
\subsection{Cancellation Rules for $\leq $}
=SML
val ⦏≤_lemma1⦎ = (
push_goal([], ⌜∀m n i⦁m + i ≤  n + i ⇔ m ≤ n⌝);
a(rewrite_tac[≤_def] THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(simple_∃_tac⌜i':ℕ⌝ THEN POP_ASM_T ante_tac
	THEN rewrite_tac[plus_assoc_thm, simple_∀_elim⌜i:ℕ⌝ plus_comm_thm]);
a(rewrite_tac[plus_assoc_thm1, plus_clauses]);
(* *** Goal "2" *** *)
a(simple_∃_tac⌜i':ℕ⌝ THEN rewrite_tac[plus_assoc_thm, simple_∀_elim⌜i:ℕ⌝ plus_comm_thm]);
a(asm_rewrite_tac[plus_assoc_thm1]);
pop_thm()
);
=TEX
=SML
val ⦏≤_lemma2⦎ = (
push_goal([], ⌜∀m⦁0 ≤ m ∧ ¬1 ≤ 0⌝);
a(rewrite_tac[≤_def] THEN REPEAT strip_tac);
a(simple_∃_tac⌜m:ℕ⌝ THEN rewrite_tac[plus_clauses]);
a(rewrite_tac[plus_clauses]);
pop_thm()
);
=TEX
=SML
val ⦏≤_lemma3⦎ = (
push_goal([], ⌜∀m i⦁ m + i ≤ i ⇔ m = 0⌝);
a(rewrite_tac[≤_def] THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(POP_ASM_T ante_tac THEN
	rewrite_tac[simple_∀_elim⌜m:ℕ⌝ plus_comm_thm,
		plus_assoc_thm, plus_clauses] THEN REPEAT strip_tac);
(* *** Goal "2" *** *)
a(simple_∃_tac⌜0⌝ THEN asm_rewrite_tac[plus_clauses]);
pop_thm()
);
=TEX
=SML
val ⦏≤_lemma4⦎ = (
push_goal([], ⌜∀m i⦁ m ≤ m + i⌝);
a(rewrite_tac[≤_def] THEN REPEAT strip_tac THEN simple_∃_tac⌜i:ℕ⌝
	THEN rewrite_tac[plus_clauses]);
pop_thm()
);
=TEX
=SML
val ⦏≤_lemma5⦎ = (
push_goal([], ⌜∀m i⦁m + i ≤ 0 ⇔ m = 0 ∧ i = 0⌝);
a(rewrite_tac[≤_def, plus_clauses] THEN REPEAT strip_tac);
a(simple_∃_tac⌜0⌝ THEN asm_rewrite_tac[]);
pop_thm()
);
=TEX
=SML
val ⦏≤_lemma6⦎ = (
push_goal([], ⌜∀m⦁m ≤ m⌝);
a(rewrite_tac[≤_def] THEN REPEAT strip_tac THEN simple_∃_tac⌜0⌝
	THEN rewrite_tac[plus_clauses]);
pop_thm()
);
=TEX
=SML
val ⦏≤_lemma7⦎ = (
push_goal([], ⌜∀m⦁m ≤ 0 ⇔ m = 0⌝);
a(rewrite_tac[≤_def] THEN REPEAT strip_tac);
a(all_asm_ante_tac THEN rewrite_tac[plus_clauses] THEN REPEAT strip_tac);
a(simple_∃_tac⌜0⌝ THEN asm_rewrite_tac[plus_clauses]);
pop_thm()
);
=TEX
=SML
val ⦏≤_clauses⦎ = (
push_goal([], ⌜∀m n i⦁
		(m + i ≤ n + i ⇔ m ≤ n)
	∧	(i + m ≤ n + i ⇔ m ≤ n)
	∧	(m + i ≤ i + n ⇔ m ≤ n)
	∧	(i + m ≤ i + n ⇔ m ≤ n)
	∧	(m + i ≤ i ⇔ m = 0)
	∧	(i + m ≤ i ⇔ m = 0)
	∧	(m + i ≤ 0 ⇔ m = 0 ∧ i = 0)
	∧	(m ≤ 0 ⇔ m = 0)
	∧	m ≤ m + i
	∧	m ≤ i + m
	∧	m ≤ m
	∧	0 ≤ m
	∧	¬1 ≤ 0
⌝);
a(rewrite_tac[simple_∀_elim⌜i:ℕ⌝ plus_comm_thm,
	≤_lemma1, ≤_lemma2, ≤_lemma3, ≤_lemma4, ≤_lemma5, ≤_lemma6, ≤_lemma7]);
save_pop_thm"≤_clauses"
);
=TEX
\subsection{Cancellation Rules for $<$}
=SML
val ⦏less_clauses⦎ = (
push_goal([], ⌜∀m n i⦁
		(m + i < n + i ⇔ m < n)
	∧	(i + m < n + i ⇔ m < n)
	∧	(m + i < i + n ⇔ m < n)
	∧	(i + m < i + n ⇔ m < n)
	∧	(m < m + i ⇔ 0 < i)
	∧	(m < i + m ⇔ 0 < i)
	∧	¬m + i < m
	∧	¬m + i < i
	∧	¬m < 0
	∧	¬m < m
	∧	0 < m + 1
	∧	0 < 1 + m
	∧	0 < 1
⌝);
a(rewrite_tac[less_def, simple_∀_elim⌜i:ℕ⌝ plus_order_thm, ≤_clauses, plus_clauses]);
a(rewrite_tac[simple_∀_elim⌜m:ℕ⌝ plus_order_thm, ≤_clauses, plus_clauses]);
save_pop_thm"less_clauses"
);
=TEX
\subsection{Case Analysis Etc.}
=SML
val ⦏ℕ_cases_thm⦎ = (
push_goal([], ⌜∀m⦁ m = 0 ∨ ∃i⦁ m = i + 1⌝);
a(strip_tac THEN induction_tac⌜m:ℕ⌝ THEN asm_rewrite_tac[plus_clauses]);
a(simple_∃_tac⌜0⌝ THEN rewrite_tac[]);
a(simple_∃_tac⌜m:ℕ⌝ THEN rewrite_tac[]);
save_pop_thm"ℕ_cases_thm"
);
=TEX
=SML
val ⦏≤_cases_thm⦎ = (
push_goal([], ⌜∀m n⦁m ≤ n ∨ n ≤ m⌝);
a(rewrite_tac[≤_def] THEN REPEAT_N 2 strip_tac THEN induction_tac⌜m:ℕ⌝
	THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(POP_ASM_T (ante_tac o simple_∀_elim⌜n:ℕ⌝) THEN rewrite_tac[plus_clauses]);
(* *** Goal "2" *** *)
a(strip_asm_tac(simple_∀_elim⌜i:ℕ⌝ ℕ_cases_thm));
(* *** Goal "2.1" *** *)
a(simple_∃_tac⌜1⌝ THEN asm_ante_tac⌜m + i = n⌝ THEN asm_rewrite_tac[plus_clauses]);
a(⇒_T rewrite_thm_tac);
(* *** Goal "2.2" *** *)
a(asm_ante_tac⌜m + i = n⌝ THEN
	POP_ASM_T (rewrite_thm_tac o once_rewrite_rule[plus_comm_thm])
	THEN asm_rewrite_tac[plus_assoc_thm1]);
(* *** Goal "3" *** *)
a(simple_∃_tac⌜i+1⌝ THEN asm_rewrite_tac[plus_assoc_thm1]);
save_pop_thm"≤_cases_thm"
);
=TEX
=SML
val ⦏≤_plus1_thm⦎ = (
push_goal([], ⌜∀m n⦁m ≤ n + 1 ⇔ m = n + 1 ∨ m ≤ n⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(all_asm_ante_tac THEN rewrite_tac[≤_def] THEN REPEAT strip_tac);
a(strip_asm_tac(simple_∀_elim⌜i:ℕ⌝ ℕ_cases_thm));
(* *** Goal "1.1" *** *)
a(asm_ante_tac⌜m + i = n + 1⌝ THEN asm_rewrite_tac[plus_clauses]);
(* *** Goal "1.2" *** *)
a(simple_∃_tac⌜i':ℕ⌝);
a(asm_ante_tac⌜m + i = n + 1⌝ THEN asm_rewrite_tac[plus_clauses, plus_assoc_thm1]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[≤_clauses]);
(* *** Goal "3" *** *)
a(lemma_tac⌜n ≤ n + 1⌝);
a(asm_rewrite_tac[≤_clauses]);
a(strip_asm_tac(list_simple_∀_elim[⌜m:ℕ⌝, ⌜n:ℕ⌝, ⌜n+1⌝] ≤_trans_thm));
save_pop_thm"≤_plus1_thm"
);
=TEX
=SML
val ⦏plus1_≤_thm⦎ = (
push_goal([], ⌜∀m n⦁m + 1 ≤ n ⇔ m ≤ n ∧ ¬m = n⌝);
a(rewrite_tac[≤_def] THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(simple_∃_tac⌜1+i⌝ THEN asm_rewrite_tac[plus_assoc_thm1]);
(* *** Goal "2" *** *)
a(contr_tac THEN asm_ante_tac⌜(m + 1) + i = n⌝ THEN
	asm_rewrite_tac[plus_assoc_thm, plus_clauses]);
(* *** Goal "3" *** *)
a(strip_asm_tac(simple_∀_elim⌜i⌝ℕ_cases_thm));
(* *** Goal "3.1" *** *)
a(asm_ante_tac⌜m + i = n⌝ THEN asm_rewrite_tac[plus_clauses]);
(* *** Goal "3.2" *** *)
a(simple_∃_tac⌜i'⌝ THEN asm_ante_tac⌜m + i = n⌝);
a(asm_rewrite_tac[plus_assoc_thm, simple_∀_elim⌜1⌝ plus_comm_thm]);
save_pop_thm"plus1_≤_thm"
);
=TEX
=SML
val ⦏¬_plus1_≤_thm⦎ = (
push_goal([], ⌜∀m n⦁¬m + 1 ≤ n ⇔ n ≤ m⌝);
a(rewrite_tac[≤_def] THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(all_asm_ante_tac THEN induction_tac⌜n:ℕ⌝);
(* *** Goal "1.1" *** *)
a(rewrite_tac[plus_clauses] THEN simple_∃_tac⌜m:ℕ⌝ THEN rewrite_tac[]);
(* *** Goal "1.2" *** *)
a(REPEAT strip_tac);
a(LEMMA_T ⌜(m+1)+i+1 = n+1⌝ ante_tac);
(* *** Goal "1.2.1" *** *)
a(GET_NTH_ASM_T 2 (fn th=>rewrite_tac[plus_assoc_thm1, th]));
(* *** Goal "1.2.2" *** *)
a(asm_rewrite_tac[]);
(* *** Goal "1.3" *** *)
a(REPEAT strip_tac);
a(strip_asm_tac(simple_∀_elim⌜i⌝ℕ_cases_thm));
(* *** Goal "1.3.1" *** *)
a(asm_ante_tac ⌜n + i = m⌝ THEN asm_rewrite_tac[plus_clauses] THEN strip_tac);
a(LEMMA_T⌜(m+1)+0 = n+1⌝ ante_tac);
a(DROP_NTH_ASM_T 3 (fn _ => id_tac) THEN asm_rewrite_tac[plus_clauses]);
a(asm_rewrite_tac[]);
(* *** Goal "1.3.2" *** *)
a(simple_∃_tac⌜i'⌝ THEN asm_ante_tac ⌜n + i = m⌝ THEN
	asm_rewrite_tac[plus_assoc_thm, simple_∀_elim⌜1⌝ plus_comm_thm]);
(* *** Goal "2" *** *)
a(CONTR_T (asm_tac o eq_sym_rule o rewrite_rule[]));
a(asm_ante_tac ⌜n + i = m⌝ THEN asm_rewrite_tac[plus_clauses, plus_assoc_thm]);
save_pop_thm"¬_plus1_≤_thm"
);
=TEX
=SML
val ⦏less_cases_thm⦎ = (
push_goal([], ⌜∀m n⦁m < n ∨ m = n ∨ n < m⌝);
a(rewrite_tac[less_def] THEN REPEAT strip_tac);
a(rewrite_tac[plus1_≤_thm] THEN conv_tac(ONCE_MAP_C eq_sym_conv));
a(asm_ante_tac ⌜¬ m + 1 ≤ n⌝ THEN asm_rewrite_tac[¬_plus1_≤_thm]);
save_pop_thm"less_cases_thm"
);
=TEX
=SML
val ⦏¬_less_plus1_thm⦎ = (
push_goal([], ⌜∀m n⦁¬m < n + 1 ⇔ n < m⌝);
a(rewrite_tac[less_def, ¬_plus1_≤_thm]);
save_pop_thm"¬_less_plus1_thm"
);
=TEX
=SML
val ⦏less_plus1_thm⦎ = (
push_goal([], ⌜∀m n⦁m < n + 1 ⇔ m = n ∨ m < n⌝);
a(rewrite_tac[less_def, ≤_plus1_thm, plus_clauses]);
save_pop_thm"less_plus1_thm"
);
=TEX
=SML
val ⦏plus1_less_thm⦎ = (
push_goal([], ⌜∀m n⦁m + 1 < n ⇔ m < n ∧ ¬m + 1 = n⌝);
a(rewrite_tac[less_def, plus1_≤_thm, plus_clauses] THEN REPEAT strip_tac);
save_pop_thm"plus1_less_thm"
);
=TEX
=SML
val ⦏≤_antisym_thm⦎ = (
push_goal([], ⌜∀m n⦁m ≤ n ∧ n ≤ m ⇔ m = n⌝);
a(REPEAT strip_tac THEN TRY_T(asm_rewrite_tac[≤_clauses]));
a(all_asm_ante_tac THEN asm_rewrite_tac[≤_def] THEN REPEAT strip_tac);
a(POP_ASM_T (fn th => all_asm_ante_tac THEN
		rewrite_tac[eq_sym_rule th, plus_assoc_thm, plus_clauses] THEN
		REPEAT strip_tac));
save_pop_thm"≤_antisym_thm"
);
=TEX
=SML
val ⦏less_irrefl_thm⦎ = (
push_goal([], ⌜∀m n⦁¬(m < n ∧ n < m)⌝);
a(rewrite_tac[less_def, ≤_def] THEN REPEAT strip_tac);
a(POP_ASM_T (rewrite_thm_tac o eq_sym_rule) THEN
	rewrite_tac[plus_assoc_thm, plus_clauses]);
save_pop_thm"less_irrefl_thm"
);
=TEX
\subsection{Complete Induction}
=SML
val ⦏cov_induction_thm⦎ = (
push_goal([], ⌜∀p⦁(∀n⦁(∀m⦁m < n ⇒ p m) ⇒ p n) ⇒ (∀n⦁p n)⌝);
a(REPEAT strip_tac);
a(lemma_tac⌜∀m⦁m < n ⇒ p m⌝);
(* *** Goal "1" *** *)
a(induction_tac⌜n:ℕ⌝);
(* *** Goal "1.1" *** *)
a(rewrite_tac[less_clauses]);
(* *** Goal "1.2" *** *)
a(rewrite_tac[less_plus1_thm] THEN REPEAT strip_tac);
(* *** Goal "1.2.1" *** *)
a(POP_ASM_T rewrite_thm_tac THEN POP_ASM_T ante_tac THEN asm_rewrite_tac[]);
(* *** Goal "1.2.2" *** *)
a(POP_ASM_T ante_tac THEN asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(POP_ASM_T ante_tac THEN asm_rewrite_tac[]);
save_pop_thm"cov_induction_thm"
);
=TEX
=SML
fun ⦏COV_INDUCTION_T⦎ (tm : TERM) : (THM -> TACTIC) -> TACTIC = (
	if not(is_var tm andalso type_of tm =: ℕ)
	then term_fail "COV_INDUCTION_T" 38001 [tm]
	else (fn thmtac =>
		 let fun aux_tac (gl as (seqasms, conc)) = (
			if not (is_free_in tm conc)
			then term_fail "COV_INDUCTION_T" 38002 [tm]
			else if any seqasms (is_free_in tm)
			then	term_fail "COV_INDUCTION_T" 38003 [tm]
			else let
				val abs = mk_simple_λ(tm, conc);
				val thm0 = (conv_rule
						(ONCE_MAP_C (simple_β_conv))
						(simple_∀_elim abs cov_induction_thm));
				val thm1 = undisch_rule(conv_rule
	((RATOR_C o RAND_C o RAND_C)(simple_α_conv (fst(dest_var tm))))
						thm0);
				val thm2 = simple_∀_elim tm thm1;
				val conc' = (hd (asms thm2));
			in	([(seqasms, conc')],
				 (fn [th] => prove_asm_rule th thm2
				  | _ => bad_proof "COV_INDUCTION_T"))
			end
		);
		in	aux_tac THEN simple_∀_tac THEN ⇒_T thmtac
		end)
);
=TEX
=SML
fun ⦏cov_induction_tac⦎ (tm : TERM) : TACTIC = (
	let	val tac = (COV_INDUCTION_T tm strip_asm_tac);
	in	fn gl => (tac gl
			handle ex => pass_on ex
				"COV_INDUCTION_T" "cov_induction_tac")
	end handle ex => pass_on ex "COV_INDUCTION_T" "cov_induction_tac"
);
=TEX
=SML
val ⦏less_well_order_thm⦎ = (
push_goal([], ⌜∀p⦁(∃i⦁p i) ⇔ ∃m⦁ p m ∧ ∀i⦁ p i ⇒ ¬i < m⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(asm_ante_tac⌜p i⌝ THEN cov_induction_tac⌜i⌝);
a(strip_tac THEN cases_tac⌜∃n⦁n < i ∧ p n⌝);
(* *** Goal "1.1" *** *)
a(GET_NTH_ASM_T 4 (strip_asm_tac o simple_∀_elim ⌜n⌝));
a(simple_∃_tac⌜m⌝ THEN asm_rewrite_tac[]);
(* *** Goal "1.2" *** *)
a(simple_∃_tac⌜i⌝ THEN REPEAT strip_tac);
a(GET_NTH_ASM_T 2 (strip_asm_tac o simple_∀_elim ⌜i'⌝));
(* *** Goal "2" *** *)
a(simple_∃_tac⌜m⌝ THEN asm_rewrite_tac[]);
save_pop_thm"less_well_order_thm"
);
=TEX
=SML
val ⦏¬_less_thm⦎ = (
push_goal([], ⌜∀m n⦁ ¬m < n ⇔ n ≤ m⌝);
a(rewrite_tac[less_def, ¬_plus1_≤_thm]);
save_pop_thm"¬_less_thm"
);
=TEX
=SML
val ⦏¬_≤_thm⦎ = (
push_goal([], ⌜∀m n⦁ ¬m ≤ n ⇔ n < m⌝);
a(REPEAT strip_tac THEN strip_asm_tac(list_simple_∀_elim[⌜n:ℕ⌝, ⌜m:ℕ⌝]¬_less_thm));
save_pop_thm"¬_≤_thm"
);
=TEX
=SML
val ⦏≤_well_order_thm⦎ = (
push_goal([], ⌜∀p⦁(∃i⦁p i) ⇔ ∃m⦁ p m ∧ ∀i⦁ p i ⇒ m ≤ i⌝);
a(accept_tac (rewrite_rule[¬_less_thm]less_well_order_thm));
save_pop_thm"≤_well_order_thm"
);
=TEX
=SML
val ⦏≤_least_upper_bound_thm⦎ = (
push_goal([], ⌜∀p⦁(∃i⦁p i) ∧ (∃n⦁∀j⦁ p j ⇒ j ≤ n) ⇔ ∃m⦁p m ∧ ∀j⦁ p j ⇒ j ≤ m⌝);
a(REPEAT strip_tac THEN_TRY (simple_∃_tac⌜m:ℕ⌝ THEN asm_rewrite_tac[]));
a(strip_asm_tac(fst(⇔_elim(rewrite_rule[]
	(simple_∀_elim⌜λk⦁∀j⦁ p j ⇒ j ≤ k⌝≤_well_order_thm)))));
(* *** Goal "1" *** *)
a(swap_nth_asm_concl_tac 2 THEN asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(simple_∃_tac⌜m⌝ THEN asm_rewrite_tac[]);
a(strip_asm_tac(simple_∀_elim⌜m⌝ℕ_cases_thm));
(* *** Goal "2.1" *** *)
a(DROP_NTH_ASM_T 3 (ante_tac o simple_∀_elim⌜i⌝)
	THEN asm_rewrite_tac[≤_clauses]);
a(REPEAT strip_tac THEN asm_ante_tac⌜p i⌝ THEN asm_rewrite_tac[]);
(* *** Goal "2.2" *** *)
a(LIST_DROP_NTH_ASM_T[2,3] (MAP_EVERY ante_tac)
	THEN POP_ASM_T rewrite_thm_tac THEN contr_tac);
a(lemma_tac⌜∀ j⦁ p j ⇒ j ≤ i'⌝ THEN REPEAT strip_tac);
(* *** Goal "2.2.1" *** *)
a(DROP_NTH_ASM_T 4 (strip_asm_tac o simple_∀_elim⌜j⌝));
a(strip_asm_tac(list_simple_∀_elim[⌜j⌝, ⌜i'⌝]≤_plus1_thm));
a(asm_ante_tac ⌜p j⌝ THEN asm_rewrite_tac[]);
(* *** Goal "2.2.2" *** *)
a(DROP_NTH_ASM_T 3 (ante_tac o simple_∀_elim⌜i'⌝)
	THEN asm_rewrite_tac[≤_clauses, plus_clauses]);
save_pop_thm"≤_least_upper_bound_thm"
);
=TEX
=SML
val ⦏minimum_¬_thm⦎ = (
set_goal([], ⌜∀p b⦁ p 0 ∧ ¬p b ⇒ ∃m⦁(∀n⦁ n ≤ m ⇒ p n) ∧ ¬p(m+1)⌝);
a(REPEAT strip_tac);
a(ante_tac (simple_∀_elim⌜λx⦁¬p x⌝less_well_order_thm)
	THEN conv_tac (ONCE_MAP_C simple_β_conv));
a(LEMMA_T ⌜∃j⦁¬p j⌝ rewrite_thm_tac THEN_LIST
	[simple_∃_tac⌜b⌝ THEN REPEAT strip_tac,
	 rewrite_tac[¬_less_thm] THEN REPEAT strip_tac]);
a(strip_asm_tac (simple_∀_elim⌜m⌝ ℕ_cases_thm));
(* *** Goal "1" *** *)
a(swap_nth_asm_concl_tac 3 THEN asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(LIST_DROP_NTH_ASM_T [2, 3] (MAP_EVERY ante_tac));
a(TOP_ASM_T rewrite_thm_tac THEN REPEAT strip_tac);
a(simple_∃_tac⌜i⌝ THEN REPEAT strip_tac);
a(contr_tac THEN GET_NTH_ASM_T 3 (strip_asm_tac o simple_∀_elim⌜n⌝));
a(LEMMA_T⌜m ≤ i⌝ ante_tac THEN_LIST
	[strip_asm_tac (list_simple_∀_elim[⌜m⌝, ⌜n⌝, ⌜i⌝] ≤_trans_thm),
	asm_rewrite_tac[≤_clauses, plus_clauses]]);
save_pop_thm"minimum_¬_thm"
);
=TEX
\subsection{Theorems on Multiplication}
=SML
val ⦏times_lemma1⦎ = (
push_goal([], ⌜∀m⦁ m * 0 = 0⌝);
a(strip_tac THEN induction_tac⌜m:ℕ⌝ THEN asm_rewrite_tac[times_def, plus_clauses]);
pop_thm()
);
=TEX
=SML
val ⦏times_lemma2⦎ = (
push_goal([], ⌜∀m n⦁ m * (n + 1) = m * n + m⌝);
a(strip_tac THEN induction_tac⌜m:ℕ⌝ THEN asm_rewrite_tac[times_def, plus_clauses]);
a(rewrite_tac[plus_assoc_thm1, plus_clauses]);
a(rewrite_tac[plus_assoc_thm, plus_clauses]);
pop_thm()
);
=TEX
=SML
val ⦏times_comm_thm⦎ = (
push_goal([], ⌜∀m n⦁ m * n = n * m⌝);
a(strip_tac THEN induction_tac⌜m:ℕ⌝ THEN rewrite_tac[times_def, times_lemma1]);
a(asm_rewrite_tac[times_lemma2]);
save_pop_thm"times_comm_thm"
);
=TEX
=SML
val ⦏times_lemma3⦎ = (
push_goal([], ⌜∀i m n⦁ (i + m) * n = i * n + m * n⌝);
a(strip_tac THEN induction_tac⌜i:ℕ⌝ THEN rewrite_tac[times_def, plus_clauses]);
a(LEMMA_T⌜∀i m'⦁(i + 1) + m' = (i + m') + 1⌝ rewrite_thm_tac);
(* *** Goal "1" *** *)
a(rewrite_tac[plus_assoc_thm, plus_clauses]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[times_def, plus_assoc_thm, plus_clauses]);
pop_thm()
);
=TEX
=SML
val ⦏times_assoc_thm⦎ = (
push_goal([], ⌜∀i m n⦁ (i * m) * n = i * (m * n)⌝);
a(strip_tac THEN induction_tac⌜i:ℕ⌝ THEN rewrite_tac[times_def]);
a(asm_rewrite_tac[times_lemma3, plus_clauses]);
save_pop_thm"times_assoc_thm"
);
=TEX
=SML
val ⦏times_plus_distrib_thm⦎ = (
push_goal([], ⌜∀i m n⦁
		(i + m) * n = i * n + m * n
	∧	i * (m + n) = i * m + i * n⌝);
a(rewrite_tac[times_lemma3]);
a(rewrite_tac[simple_∀_elim⌜i:ℕ⌝ times_comm_thm, times_lemma3]);
save_pop_thm"times_plus_distrib_thm"
);
=TEX
=SML
val ⦏times_lemma4⦎ = (
push_goal([], ⌜∀m⦁ 1 * m  = m⌝);
a(conv_tac (ONCE_MAP_C plus1_conv) THEN rewrite_tac[times_def, plus_clauses]);
pop_thm()
);
=TEX
=SML
val ⦏times_clauses⦎ = (
push_goal([], ⌜∀m⦁
		m * 0 = 0
	∧	0 * m = 0
	∧	m * 1 = m
	∧	1 * m = m⌝);
a(rewrite_tac[
	simple_∀_elim⌜m:ℕ⌝ times_comm_thm,
	times_def, times_lemma4]);
save_pop_thm"times_clauses"
);
=TEX
\subsection{Interlude}
The following is required to circumvent a compiler problem which would
be caused if we attempted to include all the material in this document
in one Standard ML structure:
=SML
end; (* of structure ℕ (part 2) *)
structure ℕ : ℕ = struct
open ℕ;
=TEX
\subsection{Theorems on Division and Modulus}
=SML
val ⦏mod_less_thm⦎ = (
push_goal([], ⌜∀m n⦁ 0 < n ⇒ m Mod n < n⌝);
a(strip_tac THEN strip_tac THEN induction_tac⌜m:ℕ⌝);
(* *** Goal "1" *** *)
a(strip_tac THEN strip_asm_tac (all_simple_∀_elim mod_def)
	THEN asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(strip_tac);
(* *** Goal "3" *** *)
a(strip_tac THEN strip_asm_tac (all_simple_∀_elim mod_def)
	THEN asm_rewrite_tac[]);
a(CASES_T ⌜m Mod n + 1 < n⌝ asm_rewrite_thm_tac);
save_pop_thm"mod_less_thm"
);
=TEX
=SML
val ⦏div_mod_thm⦎ = (
push_goal([], ⌜∀m n⦁ 0 < n ⇒ m = (m Div n) * n + m Mod n⌝);
a(strip_tac THEN strip_tac THEN induction_tac⌜m:ℕ⌝);
(* *** Goal "1" *** *)
a(strip_tac THEN strip_asm_tac (all_simple_∀_elim mod_def)
	THEN strip_asm_tac (all_simple_∀_elim div_def)
	THEN asm_rewrite_tac[times_def, plus_clauses]);
(* *** Goal "2" *** *)
a(strip_tac);
(* *** Goal "3" *** *)
a(strip_tac THEN strip_asm_tac (all_simple_∀_elim mod_def)
	THEN strip_asm_tac (all_simple_∀_elim div_def));
a(REPEAT_N 4 (POP_ASM_T (TRY_T o rewrite_thm_tac)));
a(CASES_T⌜m Mod n + 1 < n⌝ (fn th => rewrite_tac[th] THEN asm_tac th));
(* *** Goal "3.1" *** *)
a(rewrite_tac[plus_assoc_thm1, plus_clauses] THEN strip_tac);
(* *** Goal "3.2" *** *)
a(strip_asm_tac (list_simple_∀_elim[⌜m⌝, ⌜n⌝] mod_less_thm));
a(DROP_ASM_T ⌜¬m Mod n + 1 < n⌝ (strip_asm_tac o rewrite_rule[plus1_less_thm]));
a(rewrite_tac[times_def, plus_clauses]);
a(LEMMA_T ⌜m + 1 = (m Div n) * n + m Mod n + 1⌝
	(fn th => rewrite_tac[th, plus_clauses] THEN strip_tac));
a(rewrite_tac[plus_assoc_thm1, plus_clauses] THEN strip_tac);
save_pop_thm"div_mod_thm"
);
val ⦏less_lemma1⦎ = (
push_goal([], ⌜∀m n⦁ m < n ⇒ 0 < n⌝);
a(rewrite_tac[less_def, ≤_def] THEN REPEAT strip_tac);
a(simple_∃_tac⌜m+i⌝ THEN
	LEMMA_T⌜(0 + 1) + (m + i) = (m + 1) + i⌝ asm_rewrite_thm_tac);
a(rewrite_tac[plus_clauses, plus_assoc_thm1]);
pop_thm()
);
=TEX
=SML
val ⦏mod_lemma1⦎ = (
push_goal([], ⌜∀m n⦁ m < n ⇒ m Mod n = m⌝);
a(REPEAT simple_∀_tac THEN induction_tac⌜m:ℕ⌝);
(* *** Goal "1" *** *)
a(strip_tac THEN strip_asm_tac(all_simple_∀_elim mod_def));
(* *** Goal "2" *** *)
a(strip_tac THEN lemma_tac ⌜m + 1 < n ⇒ m < n⌝);
a(strip_asm_tac (list_simple_∀_elim[⌜m⌝, ⌜m+1⌝, ⌜n⌝]less_trans_thm));
a(asm_ante_tac⌜¬ m < m + 1⌝ THEN rewrite_tac[less_clauses]);
(* *** Goal "3" *** *)
a(strip_tac THEN strip_asm_tac(list_simple_∀_elim[⌜m + 1⌝, ⌜n⌝]less_lemma1));
a(strip_asm_tac (simple_∀_intro⌜m:ℕ⌝(undisch_rule(all_simple_∀_elim mod_def))));
a(asm_rewrite_tac[]);
pop_thm()
);
=TEX
=SML
val ⦏mod_lemma2⦎ = (
push_goal([], ⌜∀n⦁ 0 < n ⇒ n Mod n = 0⌝);
a(REPEAT strip_tac);
a(lemma_tac⌜∃i⦁n Mod n = (i + 1) Mod n ∧ i < n ∧ i Mod n + 1 = n⌝);
(* *** Goal "1" *** *)
a(POP_ASM_T(strip_asm_tac o rewrite_rule
		[less_def, ≤_def, plus_clauses, simple_∀_elim⌜1⌝plus_comm_thm]));
a(simple_∃_tac ⌜i⌝ THEN asm_rewrite_tac[]);
a(lemma_tac⌜i < n⌝);
(* *** Goal "1.1" *** *)
a(POP_ASM_T (rewrite_thm_tac o eq_sym_rule) THEN rewrite_tac[less_clauses]);
(* *** Goal "1.2" *** *)
a(strip_tac THEN strip_asm_tac (list_simple_∀_elim[⌜i⌝, ⌜n⌝]mod_lemma1));
a(asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(strip_asm_tac(list_simple_∀_elim[⌜i⌝, ⌜n⌝]mod_def));
a(asm_rewrite_tac[less_clauses]);
pop_thm()
);
=TEX
=SML
val ⦏mod_lemma3⦎ = (
push_goal([], ⌜∀m n⦁ 0 < n ⇒ (m + n) Mod n = m Mod n⌝);
a(REPEAT strip_tac THEN
	strip_asm_tac (simple_∀_intro⌜m:ℕ⌝(undisch_rule(all_simple_∀_elim mod_def)))
	THEN induction_tac⌜m:ℕ⌝);
(* *** Goal "1" *** *)
a(asm_rewrite_tac[plus_clauses]);
a(strip_asm_tac (simple_∀_elim ⌜n⌝ mod_lemma2));
a(LEMMA_T⌜(m + 1) + n = (m + n) + 1⌝ asm_rewrite_thm_tac);
a(rewrite_tac[plus_assoc_thm, plus_clauses]);
pop_thm()
);
=TEX
=SML
val ⦏mod_lemma4⦎ = (
push_goal([], ⌜∀m n i⦁ 0 < n ⇒ (m*n + i) Mod n = i Mod n⌝);
a(REPEAT strip_tac THEN induction_tac⌜m:ℕ⌝);
(* *** Goal "1" *** *)
a(rewrite_tac[times_clauses, plus_clauses]);
(* *** Goal "2" *** *)
a(LEMMA_T⌜(m + 1) * n + i = (m * n + i) + n⌝ rewrite_thm_tac);
(* *** Goal "2.1" *** *)
a(rewrite_tac[times_plus_distrib_thm, plus_assoc_thm, plus_clauses, times_clauses]);
(* *** Goal "2.2" *** *)
a(strip_asm_tac(list_simple_∀_elim[⌜m * n + i⌝, ⌜n⌝]mod_lemma3));
a(asm_rewrite_tac[]);
pop_thm()
);
=TEX
=SML
val ⦏div_lemma1⦎ = (
push_goal([], ⌜∀n⦁ 0 < n ⇒ n Div n = 1⌝);
a(REPEAT strip_tac THEN
	STRIP_THM_THEN ante_tac(list_simple_∀_elim[⌜n:ℕ⌝, ⌜n:ℕ⌝] div_mod_thm));
a(strip_asm_tac(simple_∀_elim⌜n⌝ mod_lemma2) THEN POP_ASM_T rewrite_thm_tac);
a(strip_asm_tac(list_simple_∀_elim[⌜n Div n⌝, ⌜1⌝] less_cases_thm) THEN contr_tac);
(* *** Goal "1" *** *)
a(lemma_tac ⌜n Div n = 0⌝);
(* *** Goal "1.1" *** *)
a(strip_asm_tac (simple_∀_elim⌜n Div n⌝ ℕ_cases_thm));
a(asm_ante_tac⌜n Div n < 1⌝ THEN asm_rewrite_tac[less_clauses]);
(* *** Goal "1.2" *** *)
a(asm_ante_tac⌜n = (n Div n) * n + 0⌝ THEN asm_rewrite_tac[plus_clauses, times_clauses]);
a(contr_tac THEN asm_ante_tac⌜0 < n⌝  THEN rewrite_tac[less_def, ≤_def]
	THEN REPEAT strip_tac);
a(asm_rewrite_tac[plus_clauses]);
(* *** Goal "2" *** *)
a(asm_ante_tac⌜1 < n Div n⌝ THEN
	rewrite_tac[less_def, ≤_def, simple_∀_elim⌜i:ℕ⌝ plus_order_thm] THEN
	REPEAT strip_tac);
a(conv_tac (RAND_C eq_sym_conv));
a(contr_tac THEN asm_ante_tac ⌜n = (n Div n) * n + 0⌝);
a(asm_rewrite_tac[plus_clauses, times_plus_distrib_thm, times_clauses, plus_assoc_thm1]);
a(REPEAT strip_tac);
a(asm_ante_tac ⌜0 < n⌝ THEN asm_rewrite_tac[less_clauses]);
pop_thm()
);
=TEX
=SML
val ⦏div_lemma2⦎ = (
push_goal([], ⌜∀m n⦁ 0 < n ⇒ (m + n) Div n = m Div n + 1⌝);
a(REPEAT strip_tac THEN
	strip_asm_tac (simple_∀_intro⌜m:ℕ⌝(undisch_rule(all_simple_∀_elim div_def)))
	THEN induction_tac⌜m:ℕ⌝);
(* *** Goal "1" *** *)
a(strip_asm_tac(simple_∀_elim⌜n⌝div_lemma1) THEN asm_rewrite_tac[plus_clauses]);
(* *** Goal "2" *** *)
a(LEMMA_T⌜(m + 1) + n = (m + n) + 1⌝ rewrite_thm_tac);
(* *** Goal "2.1" *** *)
a(rewrite_tac [plus_assoc_thm, plus_clauses]);
(* *** Goal "2.2" *** *)
a(strip_asm_tac (simple_∀_intro⌜m:ℕ⌝(undisch_rule(all_simple_∀_elim mod_lemma3))));
a(asm_rewrite_tac[]);
a(cases_tac⌜m Mod n + 1 < n⌝ THEN asm_rewrite_tac[]);
pop_thm()
);
=TEX
=SML
val ⦏div_lemma3⦎ = (
push_goal([], ⌜∀n i⦁ i < n ⇒ i Div n = 0⌝);
a(REPEAT strip_tac);
a(strip_asm_tac (list_simple_∀_elim[⌜i⌝, ⌜n⌝]less_lemma1));
a(strip_asm_tac (simple_∀_intro⌜m:ℕ⌝(undisch_rule(all_simple_∀_elim div_def))));
a(asm_ante_tac⌜i < n⌝ THEN induction_tac⌜i⌝ THEN asm_rewrite_tac[]
	THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(lemma_tac⌜i < i + 1⌝);
(* *** Goal "1.1" *** *)
a(rewrite_tac[less_clauses]);
(* *** Goal "1.2" *** *)
a(strip_asm_tac(list_simple_∀_elim[⌜i⌝, ⌜i + 1⌝, ⌜n⌝]less_trans_thm));
(* *** Goal "2" *** *)
a(lemma_tac⌜i < n⌝);
(* *** Goal "2.1" *** *)
a(lemma_tac⌜i < i + 1⌝);
(* *** Goal "2.1.1" *** *)
a(rewrite_tac[less_clauses]);
(* *** Goal "2.1.2" *** *)
a(strip_asm_tac(list_simple_∀_elim[⌜i⌝, ⌜i + 1⌝, ⌜n⌝]less_trans_thm));
(* *** Goal "2.2" *** *)
a(strip_asm_tac(list_simple_∀_elim[⌜i⌝, ⌜n⌝]mod_lemma1));
a(asm_rewrite_tac[]);
pop_thm()
);
=TEX
=SML
val ⦏div_lemma4⦎ = (
push_goal([], ⌜∀m n i⦁ i < n ⇒ (m * n + i) Div n = m⌝);
a(REPEAT strip_tac THEN induction_tac⌜m:ℕ⌝);
(* *** Goal "1" *** *)
a(strip_asm_tac(list_simple_∀_elim[⌜n⌝, ⌜i⌝]div_lemma3));
a(asm_rewrite_tac[times_clauses, plus_clauses]);
(* *** Goal "2" *** *)
a(strip_asm_tac(list_simple_∀_elim[⌜i⌝, ⌜n⌝]less_lemma1));
a(strip_asm_tac(list_simple_∀_elim[⌜m * n + i⌝, ⌜n⌝]div_lemma2));
a(LEMMA_T⌜(m + 1) * n + i = (m * n + i) + n⌝ asm_rewrite_thm_tac);
a(rewrite_tac[times_plus_distrib_thm, plus_assoc_thm, times_clauses, plus_clauses]);
pop_thm()
);
=TEX
=SML
val ⦏div_mod_unique_thm⦎ = (
push_goal([], ⌜∀m n d r⦁ r < n ⇒ (m = d * n + r ⇒ d = m Div n ∧ r = m Mod n)⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(strip_asm_tac(list_simple_∀_elim[⌜d⌝, ⌜n⌝, ⌜r⌝]div_lemma4));
a(asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(strip_asm_tac(list_simple_∀_elim[⌜r⌝, ⌜n⌝]less_lemma1));
a(strip_asm_tac(list_simple_∀_elim[⌜d⌝, ⌜n⌝, ⌜r⌝]mod_lemma4));
a(strip_asm_tac(list_simple_∀_elim[⌜r⌝, ⌜n⌝]mod_lemma1));
a(asm_rewrite_tac[]);
save_pop_thm"div_mod_unique_thm"
);
=TEX
\subsection{Subtraction}
=SML
val ⦏minus_def⦎ = new_spec1 (["-","minus_def"], ["-"], (
push_goal([], ⌜
	∃$-:ℕ→ℕ→ℕ⦁ ∀m n⦁
		(m + n) - n = m
⌝);
=TEX
=SML
a(strip_asm_tac	(conv_rule all_simple_β_conv
	(list_simple_∀_elim
	[⌜λn:ℕ⦁0⌝, ⌜λf:ℕ→ℕ⦁λm:ℕ⦁λn⦁if m < n then 0 else (f n) + 1⌝]
	(inst_type_rule[(ⓣℕ→ℕ⌝, ⓣ'a⌝)]prim_rec_thm))));
a(simple_∃_tac ⌜f:ℕ→ℕ→ℕ⌝);
a(strip_tac THEN strip_tac THEN induction_tac⌜m:ℕ⌝);
(* *** Goal "1" *** *)
a(rewrite_tac[plus_clauses] THEN induction_tac⌜n⌝ THEN asm_rewrite_tac[less_clauses]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[plus_def, less_clauses]);
=TEX
=SML
pop_thm()
));
=TEX
=SML
val ⦏minus_lemma1⦎ = (
push_goal([], ⌜∀m⦁ m - m = 0⌝);
a(LEMMA_T ⌜∀m⦁ (0 + m) - m = 0⌝
	(rewrite_thm_tac o rewrite_rule[plus_clauses])
	THEN rewrite_tac[minus_def]);
pop_thm()
);
=TEX
=SML
val ⦏minus_lemma2⦎ = (
push_goal([], ⌜∀m⦁ m - 0 = m⌝);
a(LEMMA_T ⌜∀m⦁ (m + 0) - 0 = m⌝
	(rewrite_thm_tac o rewrite_rule[plus_clauses])
	THEN rewrite_tac[minus_def]);
pop_thm()
);
=TEX
=SML
val ⦏minus_clauses⦎ = (
push_goal([], ⌜∀m n⦁
		m - m = 0
	∧	m - 0 = m
	∧	(m + n) - n = m
	∧	(m + n) - m = n
⌝);
a(rewrite_tac[minus_lemma1, minus_lemma2, minus_def]);
a(rewrite_tac[simple_∀_elim⌜n:ℕ⌝plus_order_thm, minus_def]);
save_pop_thm"minus_clauses"
);
=TEX
\section{EPILOGUE}
=SML
val _ = pop_pc();
end; (* of structure ℕ (part 3) *)
open ℕ;
=TEX

\end{document}





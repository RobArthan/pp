=IGN
********************************************************************************
imp044.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  imp044.doc  ℤ $Date: 2006/12/10 12:20:19 $ $Revision: 1.23 $ $RCSfile: imp044.doc,v $
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

\def\Title{Implementation for the Theory of Sets}

\def\AbstractText{This document creates the theory ``sets''.}

\def\Reference{DS/FMU/IED/IMP044}

\def\Author{K. Blackburn}


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
%% LaTeX2e port: \TPPtitle{Implementation for the Theory of Sets}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Implementation for the Theory of Sets}
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP044}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.23 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2006/12/10 12:20:19 $%
%% LaTeX2e port: }}  %% Mandatory field
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.~Blackburn & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document creates the theory ``sets''.}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	    Project Library
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
\item [Issue 1.2 (1991/10/02)]
First version.
\item [Issue 1.3 (1991/10/16)]
Changed to match \cite{DS/FMU/IED/HLD011}.
\item [Issue 1.4 (1991/10/21)]
Simplified requirement on $IsSetRep$.

\item[Issue 1.5 (1992/01/20), \FormatDate{92/01/20} ] Updated to use new fonts.
\item[Issue 1.6 (1992/01/27) (23rd January 1992)]
$new\_axiom$, $simple\_new\_type\_defn$, $new\_type\_defn$
all changed to take lists of keys, rather than single ones.
\item[Issue 1.7 (1992/01/27) (27th January 1992)]
Corrected a typo.
\item [Issue 1.8 (1992/02/07) (7th February 1992)]
Made ``basic$\_$hol'' a parent.
\item [Issue 1.10 (1992/04/14) (13th April 1992)]
Changes due to CR0017.
\item[Issue 1.12 (1992/05/15) (15 May 1992)] Use correct quotation symbols.
\item [Issue 1.13 (1992/05/18) (18th May 1992)]
Changed proof context material.
\item [Issue 1.12 (1992/05/15) (20th May 1992)]
Removed proof contexts "$build\_sets\_?$".
Stopped recreating theory $hol$.
\item [Issue 1.13 (1992/05/18) (22nd May 1992)]
Bug fixing.
\item [Issue 1.14 (1992/05/21) (27th May 1992)]
Added $sets\_simple\_∃\_conv$.
\item[Issue 1.17 (1992/06/24) (24th June 1992)]
Renamings from issue 1.6 of \cite{DS/FMU/IED/WRK038},
mostly proof context name changes.
\item[Issue 1.18 (1993/01/27) (27th January 1993)]
Added $sets\_eq\_conv$ etc.
\item[Issue 1.20 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.21 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.22 (2005/05/07)] HOL now supports left-associative operators.
\item[Issue 1.23 (2006/12/10)] Now use $new\_spec1$ rather than $new\_spec$.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
Further theorems, and some function tools will be later provided.
\section{GENERAL}
\subsection{Scope}
This document contains an implementation of the theory of sets.
This is called for in \cite{DS/FMU/IED/HLD011}.
The design is in \cite{DS/FMU/IED/DTD044}.
\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains an implementation of the
theory of sets.
\subsubsection{Dependencies}
This document takes its signature from \cite{DS/FMU/IED/DTD044},
and also requires the theory ``char'' defined in
\cite{DS/FMU/IED/DTD040}.
\subsubsection{Deficiencies}
None known.
\subsubsection{Possible Enhancements}
None known.
\section{THE THEORY ``sets''}
=SML
structure ⦏SetsTheory⦎ : SetsTheory = struct
=SML
val _ = open_theory "basic_hol";
=IGN
(* for use after main build complete *)
open_theory "basic_hol";
delete_theory "hol";
delete_theory "sets";
=SML
val _ = new_theory "sets";
val _ = push_merge_pcs ["'propositions",
	"'simple_abstractions"];
=IGN
(* for use after main build complete *)
open_theory "sum";
new_theory "hol";
new_parent "one";
=TEX
=SML
val ⦏is_set_rep_def⦎ = new_spec1(["IsSetRep", "is_set_rep_def"], ["IsSetRep"], (
push_goal([],⌜∃ IsSetRep:('a → BOOL) → BOOL ⦁
	IsSetRep = λ x: 'a → BOOL⦁ T⌝);
a(simple_∃_tac ⌜λ x:'a → BOOL⦁ T⌝ THEN rewrite_tac[]);
pop_thm()));
=TEX
=SML
val ⦏set_def⦎ = new_type_defn(["SET","set_def"],"SET",["'a"],(
push_goal([],⌜∃ x: 'a → BOOL ⦁ IsSetRep x⌝);
a(rewrite_tac[is_set_rep_def]);
pop_thm()));
=TEX
=SML
val _ = declare_binder "SetComp";
val _ = declare_infix (230,"∈");
val ⦏set_comp_def⦎ = new_spec1(["SetComp","∈","set_comp_def"],
	["SetComp","∈"],(
push_goal([],⌜∃ ($SetComp:('a → BOOL) → 'a SET)
	($∈ : 'a → 'a SET → BOOL) ⦁
	∀ (x : 'a) (p:'a → BOOL) (a: 'a SET) (b : 'a SET)⦁
	(x ∈ (SetComp v ⦁p v) ⇔ p x) ∧
	(a = b ⇔ (∀ x:'a⦁ x ∈ a ⇔ x ∈ b))⌝);
a (strip_asm_tac (rewrite_rule [is_set_rep_def]
	(simple_⇒_match_mp_rule type_lemmas_thm set_def)));
a(MAP_EVERY simple_∃_tac
	[⌜λ x ⦁ abs x⌝,
	⌜λ x a ⦁ (rep a) x⌝]);
a(asm_rewrite_tac[]);
a(rewrite_tac[all_∀_intro(eq_sym_rule(all_simple_∀_elim ext_thm))]);
a(REPEAT simple_∀_tac THEN ⇔_tac);
(* *** Goal "1" *** *)
a(asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(POP_ASM_T (ante_tac o app_fun_rule ⌜abs⌝));
a(asm_rewrite_tac[]);
pop_thm()));
=TEX
=SML
val ⦏insert_def⦎ = new_spec1(["Empty","Universe","Insert","insert_def"],
	["Empty","Universe","Insert"], (
push_goal([],⌜
∃ (Empty : 'a SET) (Universe : 'a SET) (Insert: 'a → 'a SET → 'a SET)⦁
	∀ (x : 'a) (y : 'a) (a: 'a SET) ⦁
		¬ x ∈ Empty
	∧	(x ∈ Universe)
	∧	(x ∈ Insert y a ⇔ (x = y ∨ x ∈ a))⌝);
a(MAP_EVERY simple_∃_tac
	[⌜{v:'a | (λ x ⦁ F) v}⌝,
	⌜{v:'a | (λ x ⦁ T) v}⌝,
	⌜λ y a ⦁ {x | x = y ∨ x ∈ a}⌝]);
a(rewrite_tac[set_comp_def]);
a(REPEAT simple_∀_tac);
a(LEMMA_T ⌜{x:'a | x = y ∨ x ∈ a} = {x:'a | (λ x ⦁ x = y ∨ x ∈ a) x}⌝
	(fn x => pure_rewrite_tac[x]));
(* *** Goal "1" *** *)
a(rewrite_tac[]);
(* *** Goal "2" *** *)
a(rewrite_tac[set_comp_def]);
pop_thm()));
=TEX
=SML

val ⦏sets_ext_thm⦎ = (
push_goal([],⌜	∀ (a : 'a SET) (b : 'a SET)⦁
	a = b ⇔ ∀ (x : 'a)⦁ x ∈ a ⇔ x ∈ b⌝);
a (rewrite_tac [set_comp_def]);
pop_thm());

val ⦏sets_clauses⦎ = save_thm("sets_clauses",(
push_goal([],⌜
	∀ (x : 'a) (y : 'a) (p:'a → BOOL) (q : BOOL)⦁
	(x ∈ {} ⇔ F) ∧
	(x ∈ Universe ⇔ T) ∧
	((x ∈ {v | q}) ⇔ q) ∧
	(x ∈ {v | p v} ⇔ p x) ∧
	(x ∈ {v | v = y} ⇔ (x = y)) ∧
	(x ∈ {y} ⇔ (x = y))⌝);
a(rewrite_tac[set_comp_def, insert_def]);
a(REPEAT simple_∀_tac);
a(LEMMA_T ⌜{v|q} = {v|(λs ⦁ q) v}⌝ (fn x => pure_rewrite_tac[x]));
(* *** Goal "1" *** *)
a(rewrite_tac[]);
(* *** Goal "2" *** *)
a(rewrite_tac[set_comp_def]);
a(LEMMA_T ⌜{v|v = y} = {v | (λ x ⦁ x = y) v}⌝ (fn x => pure_rewrite_tac[x]));
(* *** Goal "2.1" *** *)
a(rewrite_tac[]);
(* *** Goal "2.2" *** *)
a(rewrite_tac[set_comp_def]);
pop_thm()));
=TEX
=SML
local
	val aux_thm = tac_proof(([],⌜
		∀ x : 'a ⦁
		∀ p : 'a → BOOL ⦁
		x ∈ {v | p v} ⇔ p x⌝),
		rewrite_tac[sets_clauses]);
	val tva = ⓣ'a⌝;
in
val ⦏simple_∈_comp_conv⦎ : CONV = (fn tm:TERM =>
let	val (x,S) = dest_bin_op "simple_∈_comp_conv" 44001 "∈" tm;
	val (v,pv) = dest_set_comp S;
	val sideeffect = (if is_var v
		then ()
		else term_fail "simple_∈_comp_conv" 44001 [tm]);
	val s1 = inst_type_rule [(type_of x, tva)] aux_thm;
	val s2 = list_simple_∀_elim[x,
		mk_simple_λ(v,pv)] s1;
	val s3 =  conv_rule (APP_C
		((RAND_C o RAND_C o SIMPLE_BINDER_C) simple_β_conv,
		simple_β_conv))s2;
	val s4 = eq_trans_rule (α_conv
		(fst(dest_⇔(concl s3))) tm)
		s3
in
	s4
end);
end;
=TEX
\subsection{Derived Definitions}
=SML
val ⦏complement_def⦎ = new_spec1(["~","complement_def"], ["~"], (
push_goal([],⌜∃(~ : 'a SET → 'a SET)⦁
	∀ (x : 'a) (a: 'a SET) ⦁
	(x ∈ ~ a ⇔ ¬ x ∈ a)⌝);
a(simple_∃_tac ⌜λ a : 'a SET ⦁ {x : 'a | ¬ x ∈ a}⌝
	THEN rewrite_tac[]);
a(conv_tac(ONCE_MAP_C simple_∈_comp_conv) THEN rewrite_tac[]);
pop_thm()));

val ⦏complement_clauses⦎ = save_thm("complement_clauses",(
push_goal([], ⌜
	(∀ (x : 'a) (a: 'a SET) ⦁(x ∈ ~ a ⇔ ¬ x ∈ a)) ∧
		(~ Universe = {})
	∧	(~ {} = Universe)⌝);
a (rewrite_tac [sets_ext_thm, sets_clauses, complement_def, insert_def]);
pop_thm()));

val _ = declare_infix (260,"∪");
val ⦏∪_def⦎ = new_spec1(["∪","∪_def"], ["∪"], (
push_goal([],⌜∃ $∪: 'a SET → 'a SET → 'a SET ⦁
	∀ (x:'a) (a : 'a SET) (b : 'a SET) ⦁
	x ∈ a ∪ b ⇔ x ∈ a ∨ x ∈ b⌝);
a(simple_∃_tac ⌜λ a b ⦁ {x : 'a | x ∈ a ∨ x ∈ b}⌝
	THEN rewrite_tac[]);
a(conv_tac(ONCE_MAP_C simple_∈_comp_conv) THEN rewrite_tac[]);
pop_thm()));
=TEX
=SML
val ⦏∪_clauses⦎ = save_thm("∪_clauses",(
push_goal([], ⌜
	∀ (a: 'a SET)⦁
		(a ∪ {} = a)
	∧	({} ∪ a = a)
	∧	(a ∪ Universe = Universe)
	∧	(Universe ∪ a = Universe)
	∧	(a ∪ a = a)⌝);
a (rewrite_tac [sets_ext_thm, set_comp_def, insert_def, ∪_def]);
pop_thm()));
=TEX
=SML
val _ = declare_infix (270,"∩");
val ⦏∩_def⦎ = new_spec1(["∩","∩_def"], ["∩"], (
push_goal([],⌜∃ $∩: 'a SET → 'a SET → 'a SET ⦁
	∀ (x:'a) (a : 'a SET) (b : 'a SET) ⦁
	x ∈ a ∩ b ⇔ x ∈ a ∧ x ∈ b⌝);
a(simple_∃_tac ⌜λ a b ⦁ {x : 'a | x ∈ a ∧ x ∈ b}⌝
	THEN rewrite_tac[]);
a(conv_tac(ONCE_MAP_C simple_∈_comp_conv) THEN rewrite_tac[]);
pop_thm()));
=TEX
=SML
val ⦏∩_clauses⦎ = save_thm("∩_clauses",(
push_goal([], ⌜
	∀ (a: 'a SET)⦁
		(a ∩ {} = {})
	∧	({} ∩ a = {})
	∧	(a ∩ Universe = a)
	∧	(Universe ∩ a = a)
	∧	(a ∩ a = a)⌝);
a (rewrite_tac [sets_ext_thm, set_comp_def, insert_def, ∩_def]);
pop_thm()));
=TEX
=SML
val _ = declare_left_infix (265,"\\");
val ⦏set_dif_def⦎ = new_spec1(["\\","set_dif_def"], ["\\"], (
push_goal([],⌜∃ $\: 'a SET → 'a SET → 'a SET ⦁
	∀ (x:'a) (a : 'a SET) (b : 'a SET) ⦁
	x ∈ a \ b ⇔ x ∈ a ∧ ¬ x ∈ b⌝);
a(simple_∃_tac ⌜λ a b ⦁ {x : 'a | x ∈ a ∧ ¬ x ∈ b}⌝
	THEN rewrite_tac[]);
a(conv_tac(ONCE_MAP_C simple_∈_comp_conv) THEN rewrite_tac[]);
pop_thm()));
=TEX
=SML
val ⦏set_dif_clauses⦎ = save_thm("set_dif_clauses",(
push_goal([], ⌜
	∀ (a: 'a SET)⦁
		(a \ {} = a)
	∧	({} \ a = {})
	∧	(a \ Universe = {})
	∧	(Universe \ a = ~ a)
	∧	(a \ a = {})⌝);
a (rewrite_tac [set_comp_def, insert_def, set_dif_def, complement_def]);
a contr_tac;
pop_thm()));
=TEX
=SML
val _ = declare_infix (250,"⊖");
val ⦏⊖_def⦎ = new_spec1(["⊖","⊖_def"], ["⊖"], (
push_goal([],⌜∃ $⊖: 'a SET → 'a SET → 'a SET ⦁
	∀ (x:'a) (a : 'a SET) (b : 'a SET) ⦁
	(x ∈ a ⊖ b) ⇔ ¬(x ∈ a ⇔ x ∈ b)⌝);
a(simple_∃_tac ⌜λ a b ⦁ {x : 'a | ¬(x ∈ a ⇔ x ∈ b)}⌝
	THEN rewrite_tac[]);
a(conv_tac(ONCE_MAP_C simple_∈_comp_conv) THEN rewrite_tac[]);
pop_thm()));
=TEX
=SML
val ⦏⊖_clauses⦎ = save_thm("⊖_clauses",(
push_goal([], ⌜
	∀ (a: 'a SET)⦁
		(a ⊖ {} = a)
	∧	({} ⊖ a = a)
	∧	(a ⊖ Universe = ~a)
	∧	(Universe ⊖ a = ~a)
	∧	(a ⊖ a = {})⌝);
a (rewrite_tac [sets_ext_thm, set_comp_def, insert_def, complement_def, ⊖_def]);
pop_thm()));
=TEX
=SML
val _ = declare_infix (230,"⊆");
val ⦏⊆_def⦎ = new_spec1(["⊆","⊆_def"], ["⊆"], (
push_goal([],⌜∃ $⊆ : 'a SET → 'a SET → BOOL ⦁
	∀ a b : 'a SET ⦁
	a ⊆ b ⇔ ∀ x ⦁ x ∈ a ⇒ x ∈ b⌝);
a(simple_∃_tac ⌜λ a b ⦁ ∀ x ⦁ x ∈ a ⇒ x ∈ b⌝
	THEN rewrite_tac[]);
pop_thm()));
=TEX
=SML
val ⦏⊆_clauses⦎ = save_thm("⊆_clauses",(
push_goal([], ⌜
	∀ (a: 'a SET)⦁
		(a ⊆ a)
	∧	({} ⊆ a)
	∧	(a ⊆ Universe)⌝);
a (rewrite_tac [⊆_def, insert_def]);
pop_thm()));
=TEX
=SML
val _ = declare_infix (230,"⊂");
val ⦏⊂_def⦎ = new_spec1(["⊂","⊂_def"], ["⊂"], (
push_goal([],⌜∃ $⊂ : 'a SET → 'a SET → BOOL ⦁
	∀ a b : 'a SET ⦁
	a ⊂ b ⇔ (a ⊆ b ∧ (∃ x ⦁ ¬ x ∈ a ∧ x ∈ b))⌝);
a(simple_∃_tac ⌜λ a b ⦁ (a ⊆ b ∧ (∃ x ⦁ ¬ x ∈ a ∧ x ∈ b))⌝
	THEN rewrite_tac[]);
pop_thm()));
=TEX
=SML
val ⦏⊂_clauses⦎ = save_thm("⊂_clauses",(
push_goal([], ⌜
	∀ (a: 'a SET)⦁
		¬ (a ⊂ a)
	∧	¬ (a ⊂ {})
	∧	({} ⊂ Universe)⌝);
a (rewrite_tac [⊂_def, ⊆_def, insert_def]);
a contr_tac;
pop_thm()));
=TEX
=SML
val ⦏⋃_def⦎ = new_spec1(["⋃","⋃_def"], ["⋃"], (
push_goal([],⌜∃ ⋃ : ('a SET) SET → 'a SET ⦁
	∀ (x: 'a) (a: ('a SET) SET) ⦁
	x ∈ ⋃ a ⇔ ∃ s ⦁ x ∈ s ∧ s ∈ a⌝);
a(simple_∃_tac ⌜λ a ⦁ {x | ∃ s ⦁ x ∈ s ∧ s ∈ a}⌝
	THEN rewrite_tac[]);
a(conv_tac(ONCE_MAP_C simple_∈_comp_conv) THEN rewrite_tac[]);
pop_thm()));
=TEX
=SML
val ⦏⋃_clauses⦎ = save_thm("⋃_clauses",(
push_goal([], ⌜
		(⋃ ({}:'a SET SET) = {})
	∧	(⋃ (Universe: 'a SET SET) = Universe)⌝);
a (rewrite_tac [sets_ext_thm, ⋃_def, insert_def]);
a ∀_tac;
a (simple_∃_tac ⌜{x}⌝);
a (rewrite_tac [insert_def]);
pop_thm()));
=TEX
=SML
val ⦏⋂_def⦎ = new_spec1(["⋂","⋂_def"], ["⋂"], (
push_goal([],⌜∃ ⋂ : ('a SET) SET → 'a SET ⦁
	∀ (x: 'a) (a: ('a SET) SET) ⦁
	(x ∈ ⋂ a) ⇔ ∀ s ⦁ s ∈ a ⇒ x ∈ s⌝);
a(simple_∃_tac ⌜λ a ⦁ {x | ∀ s ⦁ s ∈ a ⇒ x ∈ s}⌝
	THEN rewrite_tac[]);
a(conv_tac(ONCE_MAP_C simple_∈_comp_conv) THEN rewrite_tac[]);
pop_thm()));
=TEX
=SML
val ⦏⋂_clauses⦎ = save_thm("⋂_clauses",(
push_goal([], ⌜
	(⋂ ({}: 'a SET SET) = Universe)
	∧	(⋂ Universe = ({}:'a SET SET))⌝);
a (rewrite_tac [sets_ext_thm, ⋂_def, insert_def]);
a (REPEAT strip_tac);
a (simple_∃_tac ⌜{}:'a SET SET⌝);
a (rewrite_tac [insert_def]);
pop_thm()));
=TEX
=SML
val ⦏ℙ_def⦎ = new_spec1(["ℙ","ℙ_def"], ["ℙ"],(
push_goal([],⌜∃ ℙ:'a SET → ('a SET) SET ⦁
	∀ (x : 'a SET) (a: 'a SET) ⦁
	x ∈ ℙ a ⇔ x ⊆ a⌝);
a(simple_∃_tac ⌜λ a ⦁ {x | x ⊆ a}⌝
	THEN rewrite_tac[]);
a(conv_tac(ONCE_MAP_C simple_∈_comp_conv) THEN rewrite_tac[]);
pop_thm()));
=TEX
=SML
val ⦏ℙ_clauses⦎ = save_thm("ℙ_clauses",(
push_goal([], ⌜
	∀ (a:'a SET)⦁
		(ℙ {} = {{}})
	∧	(ℙ Universe = Universe)
	∧	a ∈ ℙ a
	∧	{} ∈ ℙ a⌝);
a (rewrite_tac [sets_ext_thm, insert_def, ℙ_def, ⊆_def]);
pop_thm()));
=TEX
=SML
val ⦏∅_clauses⦎ = save_thm("∅_clauses",(
push_goal([], ⌜∀ (x : 'a) (a:'a SET) ⦁
	{x | F} = {} ∧
	¬ x ∈ {} ∧
	{} ∪ a = a ∧
	a ∪ {} = a ∧
	{} ∩ a = {} ∧
	a ∩ {} = {} ∧
	a \ {} = a ∧
	{} \ a = {} ∧
	a ⊖ {} = a ∧
	{} ⊖ a = a ∧
	{} ⊆ a ∧
	(a ⊆ {} ⇔ a = {}) ∧
	({} ⊂ a ⇔ ¬ a = {}) ∧
	¬ a ⊂ {} ∧
	¬ x ∈ ⋃ {} ∧
	x ∈ ⋂ {} ∧
	{} ∈ ℙ a ∧
	(ℙ {} = {{}})⌝);
a(REPEAT simple_∀_tac THEN rewrite_tac[sets_clauses, sets_ext_thm,
	∪_def, ∩_def, set_dif_def, ⊖_def, ⊆_def, ⊂_def, ⋃_def, ⋂_def, ℙ_def]);
a(conv_tac(MAP_C simple_¬_in_conv) THEN rewrite_tac[]);
pop_thm()));
=TEX
=SML
val ⦏∈_in_clauses⦎ = save_thm("∈_in_clauses",(
push_goal([], ⌜
	(∀ (x : 'a) (y : 'a) (a: 'a SET) ⦁
		(x ∈ Universe ⇔ T)
	∧	(x ∈ {} ⇔ F)
	∧	(x ∈ Insert y a ⇔ (x = y ∨ x ∈ a)))
∧	(∀ (x:'a) (a : 'a SET) (b : 'a SET) ⦁
		(x ∈ a ∪ b ⇔ x ∈ a ∨ x ∈ b)
	∧	(x ∈ a ∩ b ⇔ x ∈ a ∧ x ∈ b)
	∧	(x ∈ a \ b ⇔ x ∈ a ∧ ¬ x ∈ b)
	∧	(x ∈ a ⊖ b ⇔ ¬(x ∈ a ⇔ x ∈ b)))
∧	(∀ (x:'a) (a : 'a SET SET) ⦁
		(x ∈ ⋃ a ⇔ ∃ s ⦁ x ∈ s ∧ s ∈ a)
	∧	((x ∈ ⋂ a) ⇔ ∀ s ⦁ s ∈ a ⇒ x ∈ s)
∧	(∀ (x : 'a SET) (a : 'a SET) ⦁(x ∈ ℙ a ⇔ x ⊆ a)))⌝);
a(rewrite_tac[sets_clauses, sets_ext_thm, insert_def, ∪_def, ∩_def, set_dif_def, ⊖_def, ⊆_def,
	⊂_def, ⋃_def, ⋂_def, ℙ_def]
	THEN REPEAT strip_tac);
pop_thm()));
=TEX
=SML
val ⦏sets_ext_clauses⦎ = save_thm("sets_ext_clauses",(
push_goal([], ⌜∀(a : 'a SET) (b : 'a SET) ⦁
	((a ⊂ b) ⇔ ((∀ x ⦁ x ∈ a ⇒ x ∈ b) ∧ (∃ x ⦁ ¬(x ∈ a) ∧ (x ∈ b))))
∧	((a ⊆ b) ⇔ ∀ x ⦁ x ∈ a ⇒ x ∈ b)
∧	((a = b) ⇔ (∀ x:'a⦁ x ∈ a ⇔ x ∈ b))⌝);
a(rewrite_tac[sets_clauses, sets_ext_thm, insert_def, ∪_def, ∩_def, set_dif_def, ⊆_def,
	⊂_def, ⋃_def, ⋂_def, ℙ_def]
	THEN REPEAT strip_tac);
pop_thm()));
=TEX
\section{CONVERSIONS}
=SML
local
	val ⦏tva⦎ = ⓣ'a⌝;
	val aux_thm = tac_proof(([],⌜
		∀ x : 'a ⦁
		∀ p : 'a → BOOL ⦁
		x ∈ {v | p v} ⇔ p x⌝),
		rewrite_tac[sets_clauses]);
in
val ⦏∈_comp_conv⦎ : CONV = (fn tm:TERM =>
let	val (x,S) = dest_bin_op "∈_comp_conv" 27002 "∈" tm;
	val (v,pv) = dest_set_comp S;
	val s1 = inst_type_rule [(type_of x, tva)] aux_thm;
	val s2 = list_∀_elim[x, mk_λ(v,pv)] s1;
in
if is_var v
then (let val s3 =  conv_rule (APP_C
		((RAND_C o RAND_C o SIMPLE_BINDER_C) simple_β_conv,
		simple_β_conv))s2;
	val s4 = eq_trans_rule (α_conv
		(fst(dest_⇔(concl s3))) tm)
		s3;
in
	s4
end)
else (let val s3 = conv_rule (RATOR_C(RAND_C(RAND_C (RAND_C
	(λ_varstruct_conv (mk_λ(v,mk_app(mk_λ(v,pv),v)))))))) s2;
	val s4 = conv_rule (APP_C
		((RAND_C o RAND_C o BINDER_C) β_conv,
		β_conv))s3;
	val s5 = eq_trans_rule (refl_conv tm) s4;
in
	s5
end)
end
handle (Fail _) =>
term_fail "∈_comp_conv" 27002 [tm])
end;
=TEX
=SML
local
	val prc = pure_rewrite_conv[insert_def, ∨_rewrite_thm,
		eq_rewrite_thm];
in
fun ⦏∈_enum_set_rule⦎ (tm : TERM) (tml : TERM list): THM = (
	if not(tm term_mem tml)
	then term_fail "∈_enum_set_rule" 27001 [tm]
	else
(let	val es = mk_enum_set tml
		handle complaint =>
		pass_on complaint "mk_enum_set" "∈_enum_set_rule" ;
	val ttm = type_of tm;
	val tes = type_of es;
	val conc = list_mk_app(mk_const("∈",mk_→_type(ttm,
		mk_→_type(tes,BOOL))),
		[tm,es]);
	val s1 = prc conc;
	val s2 = eq_sym_rule s1;
	val s3 = ⇔_mp_rule s2 t_thm;
in
	s3
end));
end;
val ⦏∈_enum_set_conv⦎ : CONV = (fn tm =>
let	val (x,s) = dest_bin_op "∈_enum_set_conv" 27006 "∈" tm;
	val ss = dest_enum_set s;
in
	⇔_t_intro (∈_enum_set_rule x ss)
	handle complaint =>
	if area_of complaint = "∈_enum_set_rule"
	then term_fail "∈_enum_set_conv" 27005 [x,s]
	else reraise complaint(area_of complaint)
end);
=TEX
\subsection{A Preprocessor for Existence Proofs}
\subsubsection{Utilities}
=TEX
The following is as $term\_map$ except that it processes the leaves
first, and then comes out.
It does not traverse created subterms.
=SML
fun ⦏term_map1⦎ (tmfun :(TERM list) -> TERM -> TERM) (tm : TERM) : TERM = (
let
	fun aux
		(bvs : TERM list)
		(tm : TERM)
		(App(f, a)) = (
		let	val (something,gothrough) =
			(let	val f' = aux bvs f (dest_simple_term f);
			in
			(true,mk_app(f',
			(aux bvs a (dest_simple_term a) handle (Fail _) => a)))
			end
			handle (Fail _) =>
			(true,mk_app(f,aux bvs a (dest_simple_term a)))
			handle (Fail _) =>
			(false,tm))
		in
			if something
			then (tmfun bvs gothrough handle (Fail _) => gothrough)
			else tmfun bvs tm
		end
	) | aux bvs tm (Const _) = (tmfun bvs tm)
	| aux bvs tm (Var _) = (tmfun bvs tm)
	| aux bvs tm (Simpleλ(v, b)) = (
		(tmfun bvs tm) handle (Fail _) =>
			mk_simple_λ(v, aux (v :: bvs) b (dest_simple_term b))
	);
in
	aux [] tm (dest_simple_term tm)
	handle (Fail _) => tm
end);
=TEX
=SML
val ⦏dest_∈⦎ = dest_bin_op "dest_∈" 0 "∈";
val ⦏mk_∈⦎ = mk_bin_op "mk_∈" 0 0
	(fn ty1 => fn ty2 =>
	mk_const("∈",list_mk_→_type[ty1,ty2,BOOL]));
=TEX
\subsubsection{Main Function}
=SML

val ⦏sets_simple_∃_conv⦎  : CONV = (fn tm =>
let	val (f,bdy) = dest_simple_∃ tm
		handle complaint =>
		divert complaint "dest_simple_∃"
			"sets_simple_∃_conv"
			44010 [fn () => string_of_term tm];
	val ftys = strip_→_type (type_of f);
	val dummy = if is_ctype (hd(rev ftys))
		then ()
		else term_fail "sets_simple_∃_conv" 44010 [tm];
	val sety = case (dest_ctype(hd(rev ftys))) of
		("SET",[ty]) => ty
		| _ => term_fail "sets_simple_∃_conv" 44010 [tm];
	val f' = variant (map mk_var (term_vars tm))
		(mk_var(fst(dest_var f),
			list_mk_→_type (rev(tl(rev ftys)) @
				[sety,BOOL])));
	val new_bdy = term_map1 (fn bvs => fn tm1 =>
		if f term_mem bvs
		then fail "" 0 [] (* always caught *)
		else
	let	val (m,s) = dest_∈ tm1;
		val (root,rss) = (strip_app s);
	in
		if root =$ f
		then list_mk_app (f', rss @ [m])
		else fail "" 0 [] (* always caught *)
	end) bdy;
	val dummy = if f term_mem frees new_bdy
		then term_fail "sets_simple_∃_conv" 44012 [tm,f]
		else if new_bdy =$ bdy
		then term_fail "sets_simple_∃_conv" 44011 [tm]
		else ();
	val new_tm = mk_simple_∃(f',new_bdy);
	val arbvars = gen_vars ((rev(tl(rev ftys))) @ [sety]) [f',tm] ;
	val marbvar = hd(rev arbvars);
	val aarbvars = rev(tl(rev arbvars));
	val conv_concl = mk_⇔(tm,new_tm);
in
	(tac_proof(([],conv_concl),
	conv_tac (TRY_C (all_β_conv AND_OR_C
		TOP_MAP_C simple_∈_comp_conv)) THEN
	⇔_T2
=TEX
Old Term implies new term:
=SML
	(SIMPLE_∃_THEN (fn oldtmthm =>
	 simple_∃_tac (list_mk_simple_λ(arbvars,
		mk_∈(marbvar,list_mk_app(f,aarbvars))))
	 THEN conv_tac (TRY_C (all_β_conv))
	THEN accept_tac oldtmthm))
=TEX
New term implies old:
=SML
	(SIMPLE_∃_THEN (fn newtmthm =>
	 simple_∃_tac (list_mk_simple_λ(aarbvars,
		mk_set_comp(marbvar,list_mk_app(f',arbvars))))
	 THEN conv_tac (TRY_C (all_β_conv AND_OR_C
		TOP_MAP_C simple_∈_comp_conv))
	 THEN accept_tac newtmthm))
	)
	handle complaint =>
	divert complaint "tac_proof" "sets_simple_∃_conv"
		44013 [fn () => string_of_term conv_concl]
	)
end);
=TEX
\subsection{Extensionality for Sets of Pairs}
=TEX
=SML
local
	val ⦏ordx⦎ = ord "x";
	fun ⦏xnames⦎ (nm : string, ty : TYPE) : string = (if
		(ordx = ord nm) handle Ord => true
		then nm
		else fail "" 0 []);
	fun ⦏give_n_names⦎ (nn : int) (lst : string list) : string list = (
	let	fun nextn n = (let val poss = "x" ^ string_of_int n
			in
			if poss mem lst
			then nextn (n+1)
			else (n,poss)
			end);
		fun nextnm 0 m = []
		| nextnm n m = (let val (ind,next) = nextn m
			in
			(next :: nextnm (n-1) (ind+1))
			end)
	in
		nextnm nn 1
	end);

	val ⦏pair_intro_thm⦎ : THM = (⇔_t_elim o rewrite_conv[pair_clauses])
			⌜∀x : 'a × 'b ⦁x = (Fst x, Snd x)⌝;

	val (⦏tya⦎, ⦏tyb⦎) = (dest_×_type o type_of o fst o dest_∀ o concl) pair_intro_thm;

	fun ⦏explode_tm⦎ (tm : TERM) : THM = (
		let	fun c1 t = (
				let	val (ty1, ty2) = dest_×_type (type_of t);
				in	(simple_∀_elim t o
					inst_type_rule[(ty1, tya), (ty2, tyb)])
					pair_intro_thm
				end
			);
			fun c2 tm =
				(c1 THEN_TRY_C (LEFT_C c2 AND_OR_C RIGHT_C c2)) tm;
		in	c2 ORELSE_C refl_conv
		end	tm
	);

	fun ⦏exploded_bits⦎ tm = (
		let	val (tm1, tm2) = dest_pair tm;
		in	exploded_bits tm1 @ exploded_bits tm2
		end	handle Fail _ => [tm]
	);
=TEX
=SML
fun ⦏give_new_bits⦎ (ty:TYPE) (tm:TERM) :
	THM * TERM * TERM list * TERM list * TERM = (
let	val names = (mapfilter xnames (term_vars tm));
	val x = mk_var(string_variant names "x", ty);
	val explode_x_thm = explode_tm x;
	val exploded = (snd(dest_eq(concl explode_x_thm)));
	val explode_bits_x = exploded_bits exploded;
	val xi_names = give_n_names (length explode_bits_x) names;
	val xi = map (fn (nm,tm) => mk_var(nm,type_of tm))
		 (combine xi_names explode_bits_x);
	val construct = subst (combine xi explode_bits_x) exploded;
in
	(explode_x_thm, construct, xi, explode_bits_x, x)
end);
=TEX
=SML
	val ⦏sets_ext_thm⦎ = rewrite_conv[sets_ext_clauses] ⌜a:'a SET = b⌝;
	val ⦏sets_ext_⊆_thm⦎ = rewrite_conv[⊆_def] ⌜a:'a SET ⊆ b⌝;
	val ⦏sym_sets_ext_thm⦎ = all_∀_intro(eq_sym_rule sets_ext_thm);
	val ⦏sym_sets_ext_⊆_thm⦎ = all_∀_intro(eq_sym_rule sets_ext_⊆_thm);
	val ⦏⊆_def_thm⦎ = all_∀_intro sets_ext_⊆_thm;
	val ⦏gen_sets_ext_thm⦎ = all_∀_intro sets_ext_thm;
	val ⦏⊂_thm⦎ = tac_proof(
		([], ⌜∀a b⦁a ⊂ b ⇔ (a ⊆ b ∧ ¬b ⊆ a)⌝),
		rewrite_tac[sets_ext_clauses] THEN contr_tac
		THEN all_asm_fc_tac[]);
	val ⦏¬_⇒_thm⦎ = taut_rule⌜∀p q⦁¬(p ⇒ q) ⇔ ¬q ∧ p⌝;
=TEX
=SML
val rec ⦏¬_∀_⇒_conv⦎ : CONV = (fn tm =>
	((¬_simple_∀_conv THEN_C BINDER_C ¬_∀_⇒_conv) ORELSE_C
	(switch list_simple_∀_elim ¬_⇒_thm o
		(fn (p, q) => [p, q]) o dest_⇒ o dest_¬)) tm
);
=TEX
=SML
in
val ⦏sets_eq_conv⦎ : CONV = (fn tm =>
let	val (v,w) = dest_eq tm
		handle complaint =>
		divert complaint "dest_eq" "sets_eq_conv"
			44021 [fn () => string_of_term tm];
	val vty = type_of v;
	val elem_ty = case dest_ctype vty of
		("SET",[elem_ty]) => elem_ty
		| _ => term_fail "sets_eq_conv" 44021 [tm];
	val i_r = inst_type_rule[(elem_ty, tya)];
in	if not (is_×_type elem_ty)
	then list_simple_∀_elim[v, w]( i_r gen_sets_ext_thm)
	else
let
	val (explode_x_thm, construct, xs, explode_bits_x, x) =
		give_new_bits elem_ty tm;
	val s1 = asm_rule tm;
	val s2 = app_fun_rule
		(mk_app( (mk_const("∈",
			mk_→_type(elem_ty,
			mk_→_type(vty,BOOL)))),
			construct))
		s1;
	val s3 = list_simple_∀_intro xs s2;
	val s4 = asm_rule (concl s3);
	val s5 = list_simple_∀_elim explode_bits_x s4;
	val s6 = conv_rule(RANDS_C (LEFT_C (fn _ => eq_sym_rule explode_x_thm))) s5;
	val s7 = simple_∀_intro x s6;
	val s8 = list_simple_∀_elim[v,w] (i_r sym_sets_ext_thm);
	val s9 = ⇔_mp_rule s8 s7;
	val s10 = ⇔_intro (all_⇒_intro s3) (all_⇒_intro s9);	
	val res = eq_trans_rule (refl_conv tm) s10;
in	res
end
end);
val ⦏⊆_conv⦎ : CONV = (fn tm =>
let	val (v,w) = dest_bin_op "⊆_conv" 44022 "⊆" tm;
	val vty = type_of v;
	val elem_ty = case dest_ctype vty of
		("SET",[elem_ty]) => elem_ty
		| _ => term_fail "⊆_conv" 44022 [tm];
	val i_r = inst_type_rule[(elem_ty, tya)];
in	if not (is_×_type elem_ty)
	then list_simple_∀_elim[v, w](i_r ⊆_def_thm)
	else
let
	val (explode_x_thm, construct, xs, explode_bits_x, x) =
		give_new_bits elem_ty tm;
	val s1 = list_simple_∀_elim [v, w](inst_type_rule [(elem_ty, tya)]
			⊆_def_thm);
	val s2 = ⇔_mp_rule s1 (asm_rule tm);
	val s3 = list_simple_∀_intro xs (simple_∀_elim construct s2);
	val s4 = asm_rule (concl s3);
	val s5 = list_simple_∀_elim explode_bits_x s4;
	val s6 = conv_rule(RANDS_C (LEFT_C (fn _ => eq_sym_rule explode_x_thm))) s5;
	val s7 = simple_∀_intro x s6;
	val s8 = list_simple_∀_elim[v,w] (i_r sym_sets_ext_⊆_thm);
	val s9 = ⇔_mp_rule s8 s7;
	val s10 = ⇔_intro (all_⇒_intro s3) (all_⇒_intro s9);	
	val res = eq_trans_rule (refl_conv tm) s10;
in	res
end
end);
=TEX
=SML
val ⦏⊂_conv⦎ : CONV = (fn tm =>
let	val (v,w) = dest_bin_op "⊂_conv" 44023 "⊂" tm;
	val vty = type_of v;
	val elem_ty = case dest_ctype vty of
		("SET",[elem_ty]) => elem_ty
		| _ => term_fail "⊂_conv" 44023 [tm];
	val i_r = inst_type_rule[(elem_ty, tya)];
in	(fn _ => list_simple_∀_elim[v, w] (i_r ⊂_thm)) THEN_C
	LEFT_C ⊆_conv THEN_C
	RIGHT_C (RAND_C ⊆_conv THEN_C ¬_∀_⇒_conv)
end	tm
);
=TEX
=SML
end	(* of local ... in ... end *);
=IGN
=TEX
\section{EPILOGUE}
We wish to make the pre-existing theory ``hol''
have this theory as a parent:
=SML
val _ = open_theory "hol";
val _ = new_parent "sets";
=TEX
=IGN
val dummy = (new_theory "hol";
		new_parent "one";
		new_parent "sets") handle ? => ();
=SML
val _ = pop_pc();
=SML
end; (* of structure SetsTheory *)
open SetsTheory;
=TEX
\newpage
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}




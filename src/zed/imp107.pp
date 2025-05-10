=IGN
********************************************************************************
imp107.doc: this file is part of the PPZed system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% imp107.doc   ℤ $Date: 2007/08/04 13:44:08 $ $Revision: 1.28 $ $RCSfile: imp107.doc,v $
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

\def\Title{Implementation: Z Finiteness and Sequences}

\def\AbstractText{This document contains the implementation of material for Z finiteness and sequences}

\def\Reference{DS/FMU/IED/IMP107}

\def\Author{R.D. Arthan, K. Blackburn}


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
%% LaTeX2e port: \TPPtitle{Implementation: Z Finiteness and Sequences}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP107}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.28 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2007/08/04 13:44:08 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: %\TPPauthor{ & WIN01}  %% Mandatory field
%% LaTeX2e port: \TPPauthors{R.D.~Arthan&WIN01\\K.~Blackburn&WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document contains the implementation of
%% LaTeX2e port: material for Z finiteness and sequences}
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
\item [Issue 1.1 (1996/01/16) -1.3 (1996/01/19)(16th January 1996)]
First versions, derived from wrk056.
\item [Issue 1.4 (1996/01/23) (23rd January 1996)]
Corrected theory hierarchy.
\item [Issue 1.5 (1996/01/24) (24th January 1996)]
Correct names of theorems.
\item [Issue 1.6 (1996/02/22) (20th February 1996)]
Added $abs$, $mod$ and $div$ theorems to theory $z\_numbers$.
\item [Issue 1.7 (1996/03/13)]
Added some $⊕$ material.
\item [Issue 1.8 (1996/03/21)]
Added material about $succ$.
\item [Issue 1.9 (1996/03/26)-1.11 (1996/03/27)]
Added $z\_size\_dot\_dot\_conv$.
\item [Issue 1.12 (1996/06/14)]
Fixed $z\_size\_dot\_dot\_conv$.
\item [Issue 1.13 (2001/07/05)]
Added material on sequence displays.
\item[Issue 1.14 (2002/07/10)]
Added new induction tactic and some extra theorems for sequences;
fixed misleading error messages in the induction tactics.
\item[Issue 1.15 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.16 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.17 (2003/04/28)] {\it z\_size\_seq\_thm1} had a free variable that is now universally quantified.
\item[Issue 1.18 (2003/04/30)] Added conversion for equality of sequence displays.
\item[Issue 1.19 (2003/04/30)] Work-around SML/NJ syntax restriction.
\item[Issue 1.20 (2003/07/16)]  Allowed for corrections to theorems in {\it z\_functions}.
\item[Issue 1.21 (2004/01/19)] The Z universal set is now called 𝕌.
\item[Issue 1.22 (2005/02/26)] Precedences and associativity of toolkit operators now follow \cite{ISO02}.
\item[Issue 1.23 (2005/08/03)] Added new theorems from mutilated chessboard proof.
\item[Issue 1.24 (2005/08/11)] Allowed for corrections to {\em z\_dom\_clauses} and {\em z\_ran\_clauses}.
\item[Issue 1.25 (2006/02/02)] Functional composition is now called ``∘''.
\item[Issue 1.26 (2007/05/28)] Added {\em z\_dot\_dot\_conv}.
\item[Issue 1.27 (2007/05/30)] Fixed SML/NJ incompatibility.
\item[Issue 1.28 (2007/08/04)] The integer range operator is now referred to as {\em dot\_dot} in all cases.
\item[Issue 1.29 (2008/02/10)] Allowed for changes to lexical rules for underscores.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported PPZed to Lemma 1 document template.
\item[2018/09/21]
Added
=INLINEFT
z_string_eq_conv
=TEX
.

%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
None.
\section{GENERAL}
\subsection{Scope}
This document contains the implementation
of the Z Library functions
given in \cite{DS/FMU/IED/DTD107}.
\subsection{Introduction}
\subsection{Purpose and Background}
See \cite{DS/FMU/IED/DTD107}.
\subsection{Dependencies}
The theories generated are constrained by the signatures of the same name, specified
in \cite{DS/FMU/IED/DTD107}.

\subsection{Interface}
The interface for the structure is defined by the detailed design signatures
(see\cite{DS/FMU/IED/DTD107}).

\subsection{Possible Enhancements}
None known.

\subsection{Deficiencies}
None known.

\section{THE STRUCTURE $ZFunctions1$}
\subsection{Preamble}
=SML
structure ⦏ZFunctions1⦎ : ZFunctions1 = struct
=TEX
=SML
val lthy = get_current_theory_name();
val _ = open_theory ⦏"z_functions1"⦎;
val _ = push_pc "z_fun_ext";
val _ = set_flag("z_type_check_only",false);
=TEX

\subsection{Overrides with Maplets}
=SML
val ⦏z_⊕_↦_app_thm⦎ = (
set_pc"z_rel_ext";
set_goal([], ⓩ(∀f : 𝕌; x : 𝕌; y : 𝕌 ⦁ (f ⊕ {x ↦ y}) x = y)⌝);
a(REPEAT strip_tac);
a(z_app_eq_tac);
a(REPEAT strip_tac);
	save_pop_thm "z_⊕_↦_app_thm"
);
=TEX
=SML
val ⦏z_dom_⊕_↦_thm⦎ = (
set_pc"z_rel_ext";
set_goal([], ⓩ∀f : 𝕌; x : 𝕌; y : 𝕌 ⦁
	dom(f ⊕ {x ↦ y}) = dom f ∪ {x}⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "2" *** *)
a(cases_tac ⓩx1 = x⌝);
(* *** Goal "2.1" *** *)
a(all_var_elim_asm_tac);
a(z_∃_tac ⓩy⌝ THEN  REPEAT strip_tac);
(* *** Goal "2.2" *** *)
a(z_∃_tac ⓩy'⌝ THEN  REPEAT strip_tac);
(* *** Goal "3" *** *)
a(all_var_elim_asm_tac);
a(z_∃_tac ⓩy⌝ THEN  REPEAT strip_tac);
	save_pop_thm "z_dom_⊕_↦_thm"
);
=TEX
N.B. Range form of the above is more complex (you have to subtract $f\ x$
from the range).
=SML
val ⦏z_⊕_↦_∈_→_thm⦎ = (
set_pc "z_fun_ext";
set_goal([], ⓩ[X, Y](∀f : X → Y; x : X; y : Y ⦁
	f ⊕ {x ↦ y} ∈ X → Y)⌝);
a(REPEAT strip_tac);
(* *** Goal "1" = 7 *** *)
a(all_asm_fc_tac[]);
(* *** Goal "2" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "3" = 8 *** *)
a(all_var_elim_asm_tac);
(* *** Goal "4" *** *)
a(all_var_elim_asm_tac);
(* *** Goal "5" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "6" *** *)
a(all_var_elim_asm_tac THEN REPEAT strip_tac);
(* *** Goal "9" *** *)
a(cases_tac ⓩx1 = x⌝);
(* *** Goal "9.1" *** *)
a(all_var_elim_asm_tac);
a(z_∃_tac ⓩy⌝ THEN REPEAT strip_tac);
(* *** Goal "9.2" *** *)
a(DROP_NTH_ASM_T 5 (ante_tac o z_∀_elim ⓩx1⌝) THEN asm_rewrite_tac[]);
	save_pop_thm "z_⊕_↦_∈_→_thm"
);
=TEX
=SML
val ⦏z_⊕_↦_app_thm1⦎ = (
set_pc"z_fun_ext";
set_goal([], ⓩ[X, Y](∀f : X → Y; x2 : X; x1 : 𝕌; y : 𝕌 |
	¬ x2 = x1 ⦁
	(f ⊕ {x1 ↦ y}) x2 = f x2)⌝);
a(REPEAT strip_tac);
a(z_app_eq_tac);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(z_app_eq_tac);
a(REPEAT strip_tac);
a(all_asm_fc_tac[]);
a(all_asm_fc_tac[]);
(* *** Goal "2" *** *)
a(swap_nth_asm_concl_tac 1);
a(all_fc_tac [z_→_app_thm]);
(* *** Goal "3" *** *)
a(swap_nth_asm_concl_tac 1);
a(all_fc_tac [z_→_app_thm]);
	save_pop_thm "z_⊕_↦_app_thm1"
);
=TEX

\subsection{Miscellany}
This section provides some results which do not fall into any particularly
noteworthy pattern.
=SML
val _ = set_pc"z_fun_ext";
=TEX
=SML
val ⦏z_◁_→_thm⦎ = (
set_goal([], ⓩ[Y, Z](∀X:𝕌; f:Y → Z⦁ X ⊆ Y ⇒ (X ◁ f) ∈ X → (ran (X ◁ f)))⌝);
a(rewrite_tac[] THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(z_∃_tacⓩx1⌝ THEN REPEAT strip_tac);
(* *** Goal "2" *** *)
a(all_asm_fc_tac[] THEN all_asm_fc_tac[]);
(* *** Goal "3" *** *)
a(asm_rewrite_tac[]);
a(all_asm_fc_tac[]);
a(ALL_ASM_FC_T1 fc_canon1 (MAP_EVERY strip_asm_tac) []);
a(contr_tac THEN all_asm_fc_tac[]);
save_pop_thm"z_◁_→_thm"
);
=TEX
=SML
val ⦏z_ran_◁_thm⦎ = (
set_goal([], ⓩ[Y, Z](∀X:𝕌; f:Y → Z⦁
	ran(X ◁ f) = ran f \ {y : 𝕌 | ∀x : 𝕌 | (x, y) ∈ f ⦁ ¬x ∈ X})⌝);
a(rewrite_tac[] THEN contr_tac THEN all_asm_fc_tac[]);
save_pop_thm"z_ran_◁_thm"
);
=TEX
=SML
val ⦏z_∈_→_thm⦎ = (
set_goal([], ⓩ(∀X:𝕌; Y:𝕌⦁ ∀ f:X → Y; x:𝕌; y:𝕌 | (x, y) ∈ f ⦁ x ∈ X ∧ y ∈ Y)⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "2" *** *)
a(all_asm_fc_tac[]);
save_pop_thm"z_∈_→_thm"
);
=TEX
=SML
val _ = set_pc"z_sets_alg";
=TEX
=SML
val ⦏z_→_ran_eq_↠_thm⦎ = (
set_goal([], ⓩ(∀A:𝕌; B : 𝕌⦁ (∃f : A → B⦁ ran f = B) ⇔ (∃f : A ↠ B⦁ true))⌝);
a(rewrite_tac(map z_get_spec[ⓩ(_⤖_)⌝, ⓩ(_↠_)⌝, ⓩ(_⤀_)⌝]));
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(z_∃_tacⓩf⌝ THEN REPEAT strip_tac);
a(all_fc_tac[z_→_thm]);
(* *** Goal "2" *** *)
a(z_∃_tacⓩf⌝ THEN REPEAT strip_tac);
save_pop_thm"z_→_ran_eq_↠_thm"
);
=TEX
=SML
val ⦏z_↣_ran_eq_⤖_thm⦎ = (
set_goal([], ⓩ(∀A:𝕌; B : 𝕌⦁ (∃f : A ↣ B⦁ ran f = B) ⇔ (∃f : A ⤖ B⦁ true))⌝);
a(rewrite_tac(map get_spec[ⓩ(_⤖_)⌝, ⓩ(_↣_)⌝, ⓩ(_↠_)⌝, ⓩ(_⤀_)⌝]));
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(z_∃_tacⓩf⌝ THEN REPEAT strip_tac);
a(asm_ante_tacⓩf ∈ A ⤔ B⌝ THEN rewrite_tac[z_get_specⓩ(_⤔_)⌝]
	THEN REPEAT strip_tac);
(* *** Goal "2" *** *)
a(z_∃_tacⓩf⌝ THEN REPEAT strip_tac);
save_pop_thm"z_↣_ran_eq_⤖_thm"
);
=TEX
=SML
val ⦏z_ran_mono_thm⦎ =(
set_goal([], ⓩ∀X:𝕌; Y, Z:𝕌; f:𝕌 | f ∈ X → Y ∧ ran f ⊆ Z ⦁ f ∈ X → Z⌝);
a(rewrite_tac[z_get_specⓩ(_→_)⌝] THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(PC_T1 "z_rel_ext" asm_prove_tac[]);
(* *** Goal "2" *** *)
a(all_asm_fc_tac[]);
a(z_∃⋎1_tacⓩy⌝ THEN REPEAT strip_tac);
(* *** Goal "2.1" *** *)
a(PC_T1 "z_rel_ext" asm_prove_tac[]);
(* *** Goal "2.2" *** *)
a(PC_T1 "z_rel_ext" asm_prove_tac[]);
save_pop_thm"z_ran_mono_thm"
);
=TEX
\subsection{Characterising the Arrows}
=TEX
This section develops a reasonably comprehensive approach to reasoning
about the various function arrows.
The idea is to prefer total arrows to partial arrows and to prefer
membership of the function {\em qua} set (e.g., $(x, y) \in f$)
to predicates involving application (e.g., $y = f(x)$).
=SML
val _ = set_pc"z_sets_alg";
=TEX
=SML
val ⦏z_⇸_thm2⦎ = save_thm("z_⇸_thm2",
	merge_pcs_rule1 ["z_fun_ext", "'z_fc"] prove_rule[]
	ⓩ∀A:𝕌; B:𝕌; f:𝕌⦁ f ∈  A ⇸ B ⇔ f ∈ dom f → B ∧ dom f ⊆ A⌝);
=TEX
=SML
val ⦏z_↠_thm1⦎ = save_thm("z_↠_thm1",
	merge_pcs_rule1 ["z_fun_ext", "'z_fc"] prove_rule[]
	ⓩ∀A:𝕌; B:𝕌; f:𝕌⦁ f ∈ A ↠ B ⇔ f ∈ A → B ∧ B ⊆ ran f⌝);
=TEX
=SML
val ⦏z_⤔_thm1⦎ = (
set_goal([],
	ⓩ [X, Y]
	(X ⤔ Y =
	{f : X ⇸ Y | ∀ x1, x2 : 𝕌; y:𝕌⦁ (x1, y) ∈ f ∧ (x2, y) ∈ f⇒ x1 = x2})⌝);
a(PC_T1 "z_sets_ext" rewrite_tac[z_get_specⓩ(_⤔_)⌝, z_⇸_thm2]
	THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "2" *** *)
a(lemma_tacⓩx1 ∈ dom x3 ∧ x2 ∈ dom x3⌝ THEN1
	(REPEAT_N 2 (POP_ASM_T ante_tac) THEN PC_T1"z_rel_ext"prove_tac[]));
a(all_fc_tac[z_→_∈_rel_⇔_app_eq_thm]);
a(all_var_elim_asm_tac1 THEN all_asm_fc_tac[]);
(* *** Goal "3" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "4" *** *)
a(GET_ASM_T ⓩx3 x1 = x3 x2⌝ (asm_tac o eq_sym_rule));
a(ALL_FC_T1 fc_canon1 (MAP_EVERY strip_asm_tac) [z_→_∈_rel_⇔_app_eq_thm]);
a(POP_ASM_T ante_tac THEN once_asm_rewrite_tac[] THEN strip_tac
	THEN all_asm_fc_tac[]);
save_pop_thm"z_⤔_thm1"
);
=TEX
=SML
val ⦏z_→_dom_thm⦎ = (
set_goal([],
	ⓩ∀A:𝕌; B:𝕌; f:𝕌⦁
		f ∈ A → B
	⇒	f ∈ dom f → B⌝);
a(PC_T1 "z_fun_ext" REPEAT strip_tac);
(* *** Goal "1" *** *)
a(contr_tac THEN all_asm_fc_tac[]);
(* *** Goal "2" *** *)
a(PC_T1 "z_fun_ext" all_asm_fc_tac[]);
(* *** Goal "3" *** *)
a(PC_T1 "z_fun_ext" all_asm_fc_tac[]);
a(all_asm_fc_tac[]);
save_pop_thm"z_→_dom_thm"
);
=TEX
=SML
val ⦏z_↣_thm1⦎ = (
set_goal([],
	ⓩ∀A:𝕌; B:𝕌; f:𝕌⦁
		f ∈ A ↣ B
	⇔	f ∈ A → B ∧ (∀x, y:𝕌; z:𝕌⦁ (x, z) ∈ f ∧ (y, z) ∈ f ⇒ x = y)⌝);
a(rewrite_tac[z_get_specⓩ(_↣_)⌝, z_⤔_thm1, z_⇸_thm2]);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "2" *** *)
a(all_fc_tac[z_→_dom_thm]);
(* *** Goal "3" *** *)
a(asm_ante_tacⓩf ∈ A → B⌝ THEN PC_T1 "z_fun_ext" prove_tac[]);
(* *** Goal "4" *** *)
a(all_asm_fc_tac[]);
save_pop_thm"z_↣_thm1"
);
=TEX
\subsection{Forming Functions as Unions}
This section provides theorems about functions constructed as unions;
in particular it provides theorems intended for use in forward chaining
which help one to prove that a union of injections (resp. surjections or
bijections) is an injection (resp. surjection or bijection).
=SML
val _ = set_pc"z_sets_alg";
=SML
val ⦏z_∪_↔_thm⦎ = save_thm("z_∪_↔_thm",
	pc_rule1"z_rel_ext"prove_rule[]
	ⓩ∀A:𝕌; B:𝕌; C:𝕌; D:𝕌; f:𝕌; g:𝕌⦁
			f ∈ A ↔ B ∧ g ∈ C ↔ D
		⇒	f ∪ g ∈ (A ∪ C) ↔ (B ∪ D)⌝);
=TEX
=SML
val ⦏z_ran_∪_thm⦎ = save_thm("z_ran_∪_thm",
	pc_rule1"z_rel_ext"prove_rule[]
	ⓩ∀f:𝕌; g:𝕌⦁ran (f ∪ g) = ran f ∪ ran g⌝);
=TEX
=SML
val ⦏z_∪_→_thm⦎ = (
set_goal([], ⓩ∀A:𝕌; B:𝕌; C:𝕌; D:𝕌; f:𝕌; g:𝕌⦁
		f ∈ A → B ∧ g ∈ C → D ∧ A ∩ C = {}
	⇒	f ∪ g ∈ (A ∪ C) → (B ∪ D)⌝);
a(rewrite_tac[z_get_specⓩ(_→_)⌝] THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(all_fc_tac[z_∪_↔_thm]);
(* *** Goal "2" *** *)
a(all_asm_fc_tac[]);
a(z_∃⋎1_tacⓩy⌝ THEN REPEAT strip_tac);
(* *** Goal "2.1" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "2.2" *** *)
a(lemma_tacⓩx ∈ C⌝ THEN1
	(asm_ante_tacⓩg ∈ C ↔ D⌝ THEN asm_ante_tacⓩ(x, y') ∈ g⌝
		THEN PC_T1"z_rel_ext" prove_tac[]));
a(swap_nth_asm_concl_tac 1
	THEN asm_ante_tacⓩx ∈ A⌝ THEN asm_ante_tacⓩA ∩ C = {}⌝
		THEN PC_T1"z_sets_ext" prove_tac[]);
(* *** Goal "2.3" *** *)
a(lemma_tacⓩy' ∈ B⌝ THEN1
	(asm_ante_tacⓩf ∈ A ↔ B⌝ THEN asm_ante_tacⓩ(x, y') ∈ f⌝
		THEN PC_T1"z_rel_ext" prove_tac[]));
a(all_asm_fc_tac[]);
(* *** Goal "2.4" *** *)
a(lemma_tacⓩx ∈ C⌝ THEN1
	(asm_ante_tacⓩg ∈ C ↔ D⌝ THEN asm_ante_tacⓩ(x, y') ∈ g⌝
		THEN PC_T1"z_rel_ext" prove_tac[]));
a(swap_nth_asm_concl_tac 1
	THEN asm_ante_tacⓩx ∈ A⌝ THEN asm_ante_tacⓩA ∩ C = {}⌝
		THEN PC_T1"z_sets_ext" prove_tac[]);
(* *** Goal "3" *** *)
a(all_asm_fc_tac[]);
a(z_∃⋎1_tacⓩy⌝ THEN REPEAT strip_tac);
(* *** Goal "3.1" *** *)
a(lemma_tacⓩx ∈ A⌝ THEN1
	(asm_ante_tacⓩf ∈ A ↔ B⌝ THEN asm_ante_tacⓩ(x, y') ∈ f⌝
		THEN PC_T1"z_rel_ext" prove_tac[]));
a(swap_nth_asm_concl_tac 1
	THEN asm_ante_tacⓩx ∈ C⌝ THEN asm_ante_tacⓩA ∩ C = {}⌝
		THEN PC_T1"z_sets_ext" prove_tac[]);
(* *** Goal "3.2" *** *)
a(lemma_tacⓩy' ∈ D⌝ THEN1
	(asm_ante_tacⓩg ∈ C ↔ D⌝ THEN asm_ante_tacⓩ(x, y') ∈ g⌝
		THEN PC_T1"z_rel_ext" prove_tac[]));
a(all_asm_fc_tac[]);
(* *** Goal "3.3" *** *)
a(lemma_tacⓩx ∈ A⌝ THEN1
	(asm_ante_tacⓩf ∈ A ↔ B⌝ THEN asm_ante_tacⓩ(x, y') ∈ f⌝
		THEN PC_T1"z_rel_ext" prove_tac[]));
a(swap_nth_asm_concl_tac 1
	THEN asm_ante_tacⓩx ∈ C⌝ THEN asm_ante_tacⓩA ∩ C = {}⌝
		THEN PC_T1"z_sets_ext" prove_tac[]);
(* *** Goal "3.4" *** *)
a(all_asm_fc_tac[]);
save_pop_thm"z_∪_→_thm"
);
=TEX
=SML
val ⦏z_∪_↣_thm⦎ = (
set_goal([], ⓩ∀A:𝕌; B:𝕌; C:𝕌; D:𝕌; f:𝕌; g:𝕌⦁
		f ∈ A ↣ B ∧ g ∈ C ↣ D ∧ A ∩ C = {} ∧ B ∩ D = {}
	⇒	f ∪ g ∈ (A ∪ C) ↣ (B ∪ D)⌝);
a(rewrite_tac[z_↣_thm1] THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(all_fc_tac[z_∪_→_thm]);
(* *** Goal "2" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "3" *** *)
a(lemma_tacⓩz ∈ B ∩ D⌝ THEN1
	(LIST_GET_NTH_ASM_T [1,2,6,8] (MAP_EVERY ante_tac)
		THEN PC_T1 "z_fun_ext" prove_tac[]));
a(i_contr_tac THEN LIST_GET_NTH_ASM_T [1,2,5] (MAP_EVERY ante_tac)
	THEN PC_T1 "z_sets_ext" prove_tac[]);
(* *** Goal "4" *** *)
a(lemma_tacⓩz ∈ B ∩ D⌝ THEN1
	(LIST_GET_NTH_ASM_T [1,2,6,8] (MAP_EVERY ante_tac)
		THEN PC_T1 "z_fun_ext" prove_tac[]));
a(i_contr_tac THEN LIST_GET_NTH_ASM_T [1,2,5] (MAP_EVERY ante_tac)
	THEN PC_T1 "z_sets_ext" prove_tac[]);
(* *** Goal "5" *** *)
a(all_asm_fc_tac[]);
save_pop_thm"z_∪_↣_thm"
);
=TEX
=SML
val ⦏z_∪_↠_thm⦎ = (
set_goal([], ⓩ∀A:𝕌; B:𝕌; C:𝕌; D:𝕌; f:𝕌; g:𝕌⦁
		f ∈ A ↠ B ∧ g ∈ C ↠ D ∧ A ∩ C = {}
	⇒	f ∪ g ∈ (A ∪ C) ↠ (B ∪ D)⌝);
a(rewrite_tac[z_↠_thm1] THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(all_fc_tac[z_∪_→_thm]);
(* *** Goal "2" *** *)
a(PC_T1 "z_sets_ext" asm_prove_tac[z_ran_∪_thm]);
save_pop_thm"z_∪_↠_thm"
);
=TEX
=SML
val ⦏z_∪_⤖_thm⦎ = (
set_goal([], ⓩ∀A:𝕌; B:𝕌; C:𝕌; D:𝕌; f:𝕌; g:𝕌⦁
		f ∈ A ⤖ B ∧ g ∈ C ⤖ D ∧ A ∩ C = {} ∧ B ∩ D = {}
	⇒	f ∪ g ∈ (A ∪ C) ⤖ (B ∪ D)⌝);
a(rewrite_tac[z_get_specⓩ(_⤖_)⌝] THEN
	REPEAT strip_tac THEN all_fc_tac[z_∪_↠_thm, z_∪_↣_thm]);
save_pop_thm"z_∪_⤖_thm"
);
=TEX
\subsection{Forming Functions as Compositions}
This section provides theorems analogous to those of the previous
section but for composition rather than union.
=SML
val _ = set_pc"z_sets_alg";
=SML
val ⦏lemma_f1⦎ = pc_rule1 "z_rel_ext" prove_rule[]
	ⓩ∀A:𝕌; B:𝕌; C:𝕌; f:𝕌; g:𝕌⦁
			f ∈ A ↔ B ∧ g ∈ B ↔ C
		⇒	g ∘ f ∈ A ↔ C⌝;
=TEX
=SML
val ⦏z_∘_→_thm⦎ = (
set_goal([], 	ⓩ∀A:𝕌; B:𝕌; C:𝕌; f:𝕌; g:𝕌⦁
		f ∈ A → B ∧ g ∈ B → C
	⇒	g ∘ f ∈ A → C⌝);
a(rewrite_tac[z_get_specⓩ(_→_)⌝]);
a(REPEAT strip_tac THEN1 all_fc_tac[lemma_f1]);
a(LIST_GET_NTH_ASM_T [4] all_fc_tac);
a(LIST_GET_NTH_ASM_T [5] all_fc_tac);
a(z_∃⋎1_tacⓩy'⌝ THEN PC_T1 "z_rel_ext" asm_rewrite_tac[]);
a(REPEAT strip_tac THEN1 CONTR_T (fn th => all_fc_tac[th]));
a(PC_T1 "z_rel_ext" (LIST_GET_NTH_ASM_T [14]) all_fc_tac);
a(LIST_GET_NTH_ASM_T [8] all_fc_tac);
a(var_elim_nth_asm_tac 1);
a(LIST_GET_NTH_ASM_T [3] all_fc_tac);
save_pop_thm"z_∘_→_thm"
);
=TEX
=SML
val ⦏z_∘_↠_thm⦎ = (
set_goal([], 	ⓩ∀A:𝕌; B:𝕌; C:𝕌; f:𝕌; g:𝕌⦁
		f ∈ A ↠ B ∧ g ∈ B ↠ C
	⇒	g ∘ f ∈ A ↠ C⌝);
a(rewrite_tac[z_↠_thm1]);
a(PC_T1"z_rel_ext" REPEAT strip_tac THEN1 all_fc_tac[z_∘_→_thm]);
a(PC_T1"z_rel_ext" (LIST_GET_NTH_ASM_T [2])
	(ALL_FC_T1 fc_canon1 (MAP_EVERY strip_asm_tac)));
a(DROP_ASM_T ⓩg ∈ B → C⌝
	(fn th => PC_T1"z_rel_ext"all_fc_tac[rewrite_rule[z_get_specⓩ(_→_)⌝]th]));
a(PC_T1"z_rel_ext" (LIST_GET_NTH_ASM_T [5])
	(ALL_FC_T1 fc_canon1 (MAP_EVERY strip_asm_tac)));
a(z_∃_tacⓩx'⌝ THEN PC_T1"z_rel_ext" REPEAT strip_tac);
a(CONTR_T (fn th => all_fc_tac[th]));
save_pop_thm"z_∘_↠_thm"
);
=TEX
=SML
val ⦏z_∘_↣_thm⦎ = (
set_goal([], 	ⓩ∀A:𝕌; B:𝕌; C:𝕌; f:𝕌; g:𝕌⦁
		f ∈ A ↣ B ∧ g ∈ B ↣ C
	⇒	g ∘ f ∈ A ↣ C⌝);
a(rewrite_tac[z_↣_thm1]);
a(PC_T1"z_rel_ext" REPEAT strip_tac THEN1 all_fc_tac[z_∘_→_thm]);
a(all_asm_fc_tac[] THEN all_var_elim_asm_tac1);
a(all_asm_fc_tac[] THEN all_var_elim_asm_tac1);
save_pop_thm"z_∘_↣_thm"
);
=TEX
=SML
val ⦏z_∘_⤖_thm⦎ = (
set_goal([], 	ⓩ∀A:𝕌; B:𝕌; C:𝕌; f:𝕌; g:𝕌⦁
		f ∈ A ⤖ B ∧ g ∈ B ⤖ C
	⇒	g ∘ f ∈ A ⤖ C⌝);
a(rewrite_tac[z_get_specⓩ(_⤖_)⌝] THEN
	REPEAT strip_tac THEN all_fc_tac[z_∘_↠_thm, z_∘_↣_thm]);
save_pop_thm"z_∘_⤖_thm"
);
=TEX
\subsection{Bijectivity of Inverse Functions}
=SML
val _ = set_pc"z_sets_alg";
=TEX
=SML
val ⦏z_rel_inv_⤖_thm⦎ = (
set_goal([], 	ⓩ∀A:𝕌; B:𝕌; f:𝕌⦁
		f ∈ A ⤖ B  ⇒ f ↗~↕ ∈ B ⤖ A⌝);
a(rewrite_tac[z_get_specⓩ(_⤖_)⌝, z_↠_thm1, z_↣_thm1]
	THEN MERGE_PCS_T1 ["z_fun_ext", "'z_fc"] prove_tac[]);
save_pop_thm"z_rel_inv_⤖_thm"
);
=TEX
\subsection{Bijectivity of Identity Functions}
This section contains a proof that any identity function is a bijection.
=SML
val _ = set_pc"z_sets_alg";
=TEX
=SML
val ⦏z_id_thm1⦎ = save_thm("z_id_thm1",
	merge_pcs_rule1 ["z_rel_ext", "'z_fc"] prove_rule[]
	ⓩ∀X:𝕌; x, y:𝕌⦁ (x, y) ∈ id X ⇔ x ∈ X ∧ x = y⌝);
=TEX
=SML
val ⦏z_id_⤖_thm⦎ = (
set_goal([], ⓩ∀X:𝕌⦁ id X ∈ X ⤖ X⌝);
a(rewrite_tac[z_get_specⓩ(_⤖_)⌝, z_↠_thm1, z_↣_thm1]
	THEN PC_T1 "z_fun_ext" rewrite_tac[z_id_thm1]);
a(prove_tac[]);
save_pop_thm"z_id_⤖_thm"
);
=TEX
\subsection{Transitivity of Bijections}
The set of bijections from $X$ to $X$ are said to act transitively on $X$,
i.e., given any $x$ and $y$ in $X$ there is a bijection mapping $x$ to $y$.
A lemma is required to do this (which actually shows us more, the action
is doubly transitive: there is a bijection mapping $x$ to $y$ and $y$ to $x$).
=SML
val _ = set_pc"z_sets_alg";
=TEX
=SML
val ⦏z_simple_swap_⤖_thm⦎ = (
set_goal([], ⓩ∀x, y:𝕌⦁ {(x, y), (y, x)} ∈ {x, y} ⤖ {x, y}⌝);
a(rewrite_tac[z_get_specⓩ(_⤖_)⌝, z_↠_thm1, z_↣_thm1]
	THEN PC_T1 "z_fun_ext" rewrite_tac[]);
a(prove_tac[]);
save_pop_thm"z_simple_swap_⤖_thm"
);
=TEX
=SML
val ⦏z_swap_⤖_thm⦎ = (
set_goal([], ⓩ∀X:𝕌⦁ ∀x, y:X⦁ ∃g : X ⤖ X⦁ (x, y) ∈ g ∧ (y, x) ∈ g⌝);
a(REPEAT strip_tac);
a(z_∃_tacⓩ(id(X \ {x, y})) ∪ {(x, y), (y, x)}⌝);
a(REPEAT strip_tac);
a(strip_asm_tac(z_∀_elimⓩ(x≜x,y≜y)⌝z_simple_swap_⤖_thm));
a(strip_asm_tac(z_∀_elimⓩX \ {x, y}⌝z_id_⤖_thm));
a(lemma_tac ⓩ(X \ {x, y}) ∩ {x, y} = {}⌝ THEN1 PC_T1 "z_sets_ext" prove_tac[]);
a(all_fc_tac[z_∪_⤖_thm]);
a(POP_ASM_T ante_tac THEN LEMMA_T ⓩ(X \ {x, y}) ∪ {x, y} = X⌝rewrite_thm_tac
	THEN1 PC_T1 "z_sets_ext" prove_tac[]);
save_pop_thm"z_swap_⤖_thm"
);
=TEX
=SML
val ⦏z_⤖_trans_thm⦎ = (
set_goal([], ⓩ∀X:𝕌⦁ ∀x, y:X⦁ ∃g : X ⤖ X⦁ (x, y) ∈ g⌝);
a(contr_tac THEN all_fc_tac[z_swap_⤖_thm] THEN all_asm_fc_tac[]);
save_pop_thm"z_⤖_trans_thm"
);
=TEX
\subsection{A bijection between $f$ and $dom\,f$}
It is useful, for example in reasoning about the size of sequences, to
know that a function {\em qua} set is in bijection with its domain.
=SML
val _ = set_pc"z_sets_alg";
=TEX
=SML
val ⦏z_dom_f_↔_f_thm⦎ = (
set_goal([], ⓩ∀A:𝕌; B:𝕌; f:𝕌⦁
		f ∈ A ↔ B
	⇒	{x : A; y : B | (x, y) ∈ f⦁ (x, (x, y)) } ∈ dom f ↔ f⌝);
a(PC_T1 "z_rel_ext" prove_tac[]);
save_pop_thm"z_dom_f_↔_f_thm"
);
=TEX
=SML
val ⦏z_dom_f_→_f_thm⦎ = (
set_goal([], ⓩ∀A:𝕌; B:𝕌; f:𝕌⦁
		f ∈ A → B
	⇒	{x : A; y : B | (x, y) ∈ f⦁ (x, (x, y)) } ∈ dom f → f⌝);
a(rewrite_tac[z_get_specⓩ(_→_)⌝]);
a(REPEAT strip_tac THEN1 all_fc_tac[z_dom_f_↔_f_thm]);
a(POP_ASM_T (PC_T1 "z_rel_ext" strip_asm_tac));
a(lemma_tac ⓩx ∈ A⌝ THEN1 PC_T1 "z_rel_ext" asm_prove_tac[]);
a(all_asm_fc_tac[]);
a(z_∃⋎1_tacⓩ(x, y')⌝ THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(z_∃_tacⓩ(x'≜x, y''≜y')⌝ THEN REPEAT strip_tac);
(* *** Goal "2" *** *)
a(POP_ASM_T (strip_asm_tac o eq_sym_rule) THEN asm_rewrite_tac[]);
a(all_var_elim_asm_tac1);
a(all_asm_fc_tac[]);
save_pop_thm"z_dom_f_→_f_thm"
);
=TEX
=SML
val ⦏z_dom_f_↠_f_thm⦎ = (
set_goal([], ⓩ∀A:𝕌; B:𝕌; f:𝕌⦁
		f ∈ A → B
	⇒	{x : A; y : B | (x, y) ∈ f⦁ (x, (x, y)) } ∈ dom f ↠ f⌝);
a(rewrite_tac[z_↠_thm1]);
a(REPEAT strip_tac THEN1 all_fc_tac[z_dom_f_→_f_thm]);
a(asm_ante_tac ⓩf ∈ A → B⌝ THEN rewrite_tac[z_get_specⓩ(_→_)⌝]);
a(strip_tac THEN asm_ante_tac ⓩf ∈ A ↔ B⌝);
a(DROP_ASMS_T discard_tac THEN PC_T1"z_rel_ext" REPEAT strip_tac);
a(z_∃_tacⓩx1⌝ THEN REPEAT strip_tac);
a(z_∃_tacⓩ(x≜x1, y≜x2)⌝ THEN asm_prove_tac[]);
save_pop_thm"z_dom_f_↠_f_thm"
);
=TEX
=SML
val ⦏z_dom_f_↣_f_thm⦎ = (
set_goal([], ⓩ∀A:𝕌; B:𝕌; f:𝕌⦁
		f ∈ A → B
	⇒	{x : A; y : B | (x, y) ∈ f⦁ (x, (x, y)) } ∈ dom f ↣ f⌝);
a(rewrite_tac[z_↣_thm1]);
a(REPEAT strip_tac THEN1 all_fc_tac[z_dom_f_→_f_thm]);
a(all_var_elim_asm_tac1);
a(all_var_elim_asm_tac1);
a(REPEAT strip_tac);
save_pop_thm"z_dom_f_↣_f_thm"
);
=TEX
=SML
val ⦏z_dom_f_⤖_f_thm⦎ = (
set_goal([], ⓩ∀A:𝕌; B:𝕌; f:𝕌⦁
		f ∈ A → B
	⇒	{x : A; y : B | (x, y) ∈ f⦁ (x, (x, y)) } ∈ dom f ⤖ f⌝);
a(rewrite_tac[z_get_specⓩ(_⤖_)⌝]);
a(REPEAT strip_tac THEN all_fc_tac[z_dom_f_↣_f_thm, z_dom_f_↠_f_thm]);
save_pop_thm"z_dom_f_⤖_f_thm"
);
=TEX
\subsection{Forming Functions as Intersections}
This section provides theorems analogous to those proved
earlier for union and composition but this time for union.
=SML
val _ = set_pc"z_sets_alg";
=TEX
The following could go in the theory of relations:
=SML
val ⦏z_∩_↔_thm⦎ = save_thm("z_∩_↔_thm",
	pc_rule1 "z_rel_ext" prove_rule[]
	ⓩ∀X:𝕌; Y:𝕌; f, g:𝕌 | f ∈ X ↔ Y ⦁
		(f ∩ g) ∈ dom (f ∩ g) ↔ ran(f ∩ g)⌝);
=TEX
The following could go in the theory of relations:
=SML
val ⦏z_↔_ran_thm⦎ = save_thm("z_↔_ran_thm",
	pc_rule1 "z_rel_ext" prove_rule[]
	ⓩ∀X:𝕌; f:𝕌 ⦁ f ∈ X ↔ ran f ⇔ f ∈ X ↔ 𝕌⌝);
=TEX
=SML
val ⦏z_→_ran_thm⦎ = (
set_goal([], ⓩ∀X:𝕌; f:𝕌 ⦁ f ∈ X → ran f ⇔ f ∈ X → 𝕌⌝);
a(rewrite_tac[z_get_specⓩ(_→_)⌝] THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(ALL_FC_T rewrite_tac[z_↔_ran_thm]);
(* *** Goal "2" *** *)
a(all_asm_fc_tac[]);
a(z_∃⋎1_tacⓩy⌝ THEN asm_rewrite_tac[]);
a(REPEAT strip_tac);
a(lemma_tacⓩy' ∈ ran f⌝ THEN1
	(POP_ASM_T ante_tac THEN PC_T1"z_rel_ext" prove_tac[]));
a(all_asm_fc_tac[]);
(* *** Goal "3" *** *)
a(ALL_FC_T1 fc_canon1 rewrite_tac[z_↔_ran_thm]);
(* *** Goal "4" *** *)
a(all_asm_fc_tac[]);
a(z_∃⋎1_tacⓩy⌝ THEN asm_rewrite_tac[]);
a(strip_tac THEN1
	(GET_NTH_ASM_T 2 ante_tac THEN PC_T1"z_rel_ext" prove_tac[]));
a(REPEAT strip_tac THEN all_asm_fc_tac[]);
save_pop_thm"z_→_ran_thm"
);
=TEX
=SML
val ⦏z_∩_→_thm⦎ = (
set_goal([], ⓩ∀X:𝕌; Y:𝕌; f, g:𝕌 | f ∈ X → Y ⦁
		(f ∩ g) ∈ dom (f ∩ g) → ran(f ∩ g)⌝);
a(rewrite_tac[z_→_ran_thm]);
a(rewrite_tac[z_get_specⓩ(_→_)⌝] THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(ALL_FC_T rewrite_tac[rewrite_rule[z_↔_ran_thm] z_∩_↔_thm]);
(* *** Goal "2" *** *)
a(lemma_tacⓩx ∈ X⌝ THEN1
	(DROP_NTH_ASM_T 2 discard_tac THEN PC_T1"z_rel_ext" asm_prove_tac[]));
a(all_asm_fc_tac[]);
a(z_∃⋎1_tacⓩy⌝ THEN asm_rewrite_tac[]);
a(PC_T1 "z_rel_ext" (GET_NTH_ASM_T 5) strip_asm_tac);
a(lemma_tacⓩ(x, y') ∈ f ⇒ y' ∈ Y⌝ THEN1
	(GET_NTH_ASM_T 9 ante_tac THEN PC_T1"z_rel_ext" prove_tac[]));
a(LIST_GET_NTH_ASM_T [4] all_fc_tac THEN all_var_elim_asm_tac1);
a(REPEAT strip_tac);
a(lemma_tacⓩ(x, y') ∈ f ⇒ y' ∈ Y⌝ THEN1
	(GET_NTH_ASM_T 10 ante_tac THEN PC_T1"z_rel_ext" prove_tac[]));
a(LIST_GET_NTH_ASM_T [5] all_fc_tac);
save_pop_thm"z_∩_→_thm"
);
=TEX
=SML
val ⦏z_∩_↣_thm⦎ = (
set_goal([], ⓩ∀X:𝕌; Y:𝕌; f, g:𝕌 | f ∈ X ↣ Y ⦁
		(f ∩ g) ∈ dom (f ∩ g) ↣ ran(f ∩ g)⌝);
a(rewrite_tac[z_↣_thm1] THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(ALL_FC_T rewrite_tac[z_∩_→_thm]);
(* *** Goal "2" *** *)
a(all_asm_fc_tac[]);
save_pop_thm"z_∩_↣_thm"
);
=TEX
=SML
val ⦏z_↠_ran_thm⦎ = (
set_goal([], ⓩ∀X:𝕌; Y:𝕌; f:𝕌 | f ∈ X → Y ⦁ f ∈ dom f ↠ ran f⌝);
a(rewrite_tac[z_↠_thm1] THEN REPEAT strip_tac);
a(all_fc_tac[z_→_thm]);
a(asm_rewrite_tac[]);
a(LIST_DROP_NTH_ASM_T [1,2] discard_tac);
a(asm_ante_tac ⓩf ∈ X → Y⌝ THEN PC_T1 "z_fun_ext" REPEAT strip_tac);
(* *** Goal "1" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "2" *** *)
a(CONTR_T (fn th => all_fc_tac[th]));
(* *** Goal "3" *** *)
a(LIST_GET_NTH_ASM_T [8] all_fc_tac);
a(LIST_GET_NTH_ASM_T [11] all_fc_tac);
(* *** Goal "4" = Goal "1" *** *)
(* *** Goal "5" *** *)
a(ALL_ASM_FC_T1 fc_canon1 (MAP_EVERY strip_asm_tac) []);
a(PC_T1 "z_rel_ext" POP_ASM_T strip_asm_tac);
a(CONTR_T (fn th => all_fc_tac[th]));
save_pop_thm"z_↠_ran_thm"
);
=TEX
=SML
val ⦏z_∩_↠_thm⦎ = (
set_goal([], ⓩ∀X:𝕌; Y:𝕌; f, g:𝕌 | f ∈ X ↠ Y ⦁
		(f ∩ g) ∈ dom (f ∩ g) ↠ ran(f ∩ g)⌝);
a(rewrite_tac[z_↠_thm1] THEN REPEAT strip_tac);
a(ALL_FC_T rewrite_tac[z_∩_→_thm]);
save_pop_thm"z_∩_↠_thm"
);
=TEX
=SML
val ⦏z_∩_⤖_thm⦎ = (
set_goal([], ⓩ∀X:𝕌; Y:𝕌; f, g:𝕌 | f ∈ X ⤖ Y ⦁
		(f ∩ g) ∈ dom (f ∩ g) ⤖ ran(f ∩ g)⌝);
a(rewrite_tac[z_get_specⓩ(_⤖_)⌝] THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(ALL_FC_T rewrite_tac[z_∩_↠_thm]);
(* *** Goal "1" *** *)
a(ALL_FC_T rewrite_tac[z_∩_↣_thm]);
save_pop_thm"z_∩_⤖_thm"
);
=TEX
\subsection{Lemmas about Functions and Singleton Sets}
=SML
val _ = set_pc"z_sets_alg";
=TEX
=SML
val ⦏z_→_diff_singleton_thm⦎ = (
set_goal([], ⓩ∀X:𝕌; Y:𝕌⦁ ∀ f:X → Y; x:𝕌; y:𝕌⦁ (x, y) ∈ f ⇒
	(f \ {(x, y)}) ∈ (X \ {x}) → Y ⌝);
a(REPEAT strip_tac);
a(lemma_tacⓩf ∈ X ↔ Y⌝ THEN1 PC_T1 "z_fun_ext" asm_prove_tac[]);
a(lemma_tacⓩ(x, y) ∈ X × Y⌝ THEN1 PC_T1 "z_rel_ext" asm_prove_tac[]);
a(lemma_tacⓩX = dom f⌝ THEN1 all_fc_tac[z_→_thm]
	THEN all_var_elim_asm_tac1 THEN REPEAT strip_tac);
a(all_fc_tac[z_∩_→_thm] THEN POP_ASM_T (ante_tac o ∀_elimⓩ𝕌 \ {(x, y)}⌝));
a(LEMMA_Tⓩf \ {(x, y)} = f ∩ (𝕌 \ {(x, y)})⌝rewrite_thm_tac
	THEN1 PC_T1 "z_rel_ext" prove_tac[]);
a(LEMMA_Tⓩdom f \ {x} = dom(f ∩ (𝕌 \ {(x, y)}))⌝asm_rewrite_thm_tac
	THEN1 PC_T1 "z_rel_ext" REPEAT strip_tac);
(* *** Goal "1" *** *)
a(z_∃_tacⓩy'⌝ THEN asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(z_∃_tacⓩy'⌝ THEN asm_rewrite_tac[]);
(* *** Goal "3" *** *)
a(z_∃_tacⓩy'⌝ THEN asm_rewrite_tac[]);
(* *** Goal "4" *** *)
a(contr_tac THEN all_var_elim_asm_tac1);
a(all_fc_tac[z_→_∈_rel_⇔_app_eq_thm]);
a(all_var_elim_asm_tac1);
(* *** Goal "5" *** *)
a(lemma_tacⓩf ∈ dom f → Y ⇒ ran f ⊆ Y⌝
	THEN1 PC_T1 "z_fun_ext" prove_tac[]);
a(lemma_tacⓩran f ⊆ Y ⇒ ran (f ∩ (𝕌 \ {(x, y)})) ⊆ Y⌝
	THEN PC_T1 "z_rel_ext" prove_tac[]);
a(all_fc_tac[z_ran_mono_thm]);
save_pop_thm"z_→_diff_singleton_thm"
);
=TEX
=SML
val ⦏z_⤖_diff_singleton_thm⦎ = (
set_goal([], ⓩ∀X:𝕌; Y:𝕌⦁ ∀ f:X ⤖ Y; x:X; y:Y⦁ (x, y) ∈ f ⇒
	(f \ {(x, y)}) ∈ (X \ {x}) ⤖ (Y \ {y})⌝);
a(REPEAT strip_tac);
a(lemma_tacⓩf ∈ X → Y ∧ X = dom f ∧ Y = ran f⌝ THEN1
	(all_fc_tac[z_⤖_thm] THEN all_fc_tac[z_→_thm])
	THEN all_var_elim_asm_tac1 THEN REPEAT strip_tac);
a(all_fc_tac[z_∩_⤖_thm] THEN POP_ASM_T (strip_asm_tac o ∀_elimⓩ𝕌 \ {(x, y)}⌝));
a(LEMMA_Tⓩf \ {(x, y)} = f ∩ (𝕌 \ {(x, y)})⌝rewrite_thm_tac
	THEN1 PC_T1 "z_rel_ext" prove_tac[]);
a(LEMMA_Tⓩdom f \ {x} = dom(f ∩ (𝕌 \ {(x, y)}))
	∧ ran f \ {y} = ran(f ∩ (𝕌 \ {(x, y)}))⌝asm_rewrite_thm_tac
	THEN1 PC_T1 "z_rel_ext" REPEAT strip_tac);
(* *** Goal "1" *** *)
a(z_∃_tacⓩy'⌝ THEN asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(z_∃_tacⓩy'⌝ THEN asm_rewrite_tac[]);
(* *** Goal "3" *** *)
a(z_∃_tacⓩy'⌝ THEN asm_rewrite_tac[]);
(* *** Goal "4" *** *)
a(contr_tac THEN all_var_elim_asm_tac1);
a(lemma_tacⓩ(x, y') ∈ f ⇒ y' ∈ ran f⌝
	THEN1 PC_T1 "z_rel_ext" prove_tac[]);
a(all_fc_tac[z_→_thm] THEN all_fc_tac[z_⇸_thm]);
(* *** Goal "5" *** *)
a(z_∃_tacⓩx'⌝ THEN asm_rewrite_tac[]);
(* *** Goal "6" *** *)
a(z_∃_tacⓩx'⌝ THEN asm_rewrite_tac[]);
(* *** Goal "7" *** *)
a(contr_tac THEN all_var_elim_asm_tac1);
a(lemma_tacⓩ(x', y) ∈ f ⇒ x' ∈ dom f⌝
	THEN1 PC_T1 "z_rel_ext" prove_tac[]);
a(all_fc_tac[z_→_∈_rel_⇔_app_eq_thm]);
a(all_var_elim_asm_tac1 THEN all_fc_tac[z_⤖_thm] THEN all_var_elim_asm_tac1);
(* *** Goal "8" *** *)
a(z_∃_tacⓩx'⌝ THEN asm_rewrite_tac[]);
save_pop_thm"z_⤖_diff_singleton_thm"
);
=TEX
=SML
val ⦏z_singleton_app_thm⦎ = (
set_goal([], ⓩ∀x : 𝕌; y: 𝕌⦁ {(x, y)} x = y⌝);
a(REPEAT strip_tac THEN z_app_eq_tac);
a(PC_T1 "z_rel_ext" asm_prove_tac[]);
save_pop_thm"z_singleton_app_thm"
);
=TEX
=TEX
\subsection{Lemmas about Functions and the Empty Set}
=SML
val _ = set_pc"z_sets_alg";
=SML
val ⦏z_empty_↠_thm⦎ = (
set_goal([], ⓩ∀X: 𝕌⦁ (∃f: {} ↠ X⦁ true) ⇔ X = {}⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(all_asm_ante_tac THEN rewrite_tac[z_↠_thm1,
	pc_rule1"z_fun_ext"prove_rule[]ⓩ[X]({} → X = {{}})⌝]);
a(REPEAT strip_tac THEN all_var_elim_asm_tac1 THEN all_asm_ante_tac);
a(rewrite_tac[pc_rule1"z_rel_ext"prove_rule[]ⓩran {} = {}⌝]);
a(PC_T1 "z_sets_ext" prove_tac[]);
(* *** Goal "2" *** *)
a(all_var_elim_asm_tac1);
a(z_∃_tacⓩ{}⌝ THEN PC_T1 "z_fun_ext" prove_tac[]);
save_pop_thm"z_empty_↠_thm"
);
=TEX
=SML
val ⦏z_→_empty_thm⦎ = (
set_goal([], ⓩ∀X: 𝕌⦁ (∃f: X → {}⦁ true) ⇔ X = {}⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(PC_T1 "z_fun_ext" asm_prove_tac[]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[] THEN z_∃_tacⓩ{}⌝ THEN PC_T1 "z_fun_ext" prove_tac[]);
save_pop_thm"z_→_empty_thm"
);
=TEX
\subsection{EPILOG OF ZFunctions1}
Final restoration of original proof context
=SML
val _ = pop_pc();
=TEX
=SML
end (* of structure ZFunctions1 *);
open ZFunctions1;
=TEX
\section{THE STRUCTURE $ZNumbers1$}
\subsection{Preamble}
=SML
structure ⦏ZNumbers1⦎ : ZNumbers1 = struct
=TEX
=SML
val lthy = get_current_theory_name();
val _ = open_theory ⦏"z_numbers1"⦎;
val _ = push_merge_pcs["'z_numbers", "z_sets_alg"];
val _ = set_flag("z_type_check_only",false);
=TEX

=SML
val ⦏z_dot_dot_clauses⦎ = (
set_goal([], ⓩ∀i, i1, i2, j1, j2:𝕌⦁
	(i ∈ i1 .. i2 ⇔ i1 ≤ i ≤ i2)
∧	(i1 .. i2 = {} ⇔ i2 < i1)
∧	(i1 .. i2 ⊆ j1 .. j2 ⇔ i2 < i1 ∨ (j1 ≤ i1 ∧ i2 ≤ j2))⌝);
a(rewrite_tac[z_get_specⓩ(_.._)⌝]);
a(PC_T1"z_sets_ext"rewrite_tac[]);
a(REPEAT strip_tac THEN_TRY SOLVED_T
	(contr_tac THEN
	REPEAT_N 2(all_asm_fc_tac[z_≤_less_trans_thm,
			z_less_≤_trans_thm, z_≤_trans_thm])));
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 2 ⓩi1⌝);
a(all_fc_tac[z_≤_less_trans_thm, z_less_≤_trans_thm, z_≤_trans_thm]);
(* *** Goal "2" *** *)
a(z_spec_nth_asm_tac 2 ⓩi2⌝);
a(all_fc_tac[z_≤_less_trans_thm, z_less_≤_trans_thm, z_≤_trans_thm]);
save_pop_thm"⦏z_dot_dot_clauses⦎"
);
=TEX
=SML
val ⦏z_dot_dot_plus_thm⦎ = (
set_goal([], ⓩ∀n, i1, i2 : 𝕌⦁
	{i : i1 .. i2 ⦁ i + n} = i1 + n .. i2 + n⌝);
a(REPEAT strip_tac THEN PC_T"z_sets_ext"strip_tac THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(all_var_elim_asm_tac1
	THEN contr_tac
	THEN all_fc_tac[z_≤_less_trans_thm, z_less_≤_trans_thm, z_≤_trans_thm]);
(* *** Goal "2" *** *)
a(all_var_elim_asm_tac1
	THEN contr_tac
	THEN all_fc_tac[z_≤_less_trans_thm, z_less_≤_trans_thm, z_≤_trans_thm]);
(* *** Goal "3" *** *)
a(all_asm_ante_tac);
a(LEMMA_Tⓩx1 = (x1 - n) + n⌝ once_rewrite_thm_tac
	THEN1 rewrite_tac[z_plus_assoc_thm]);
a(REPEAT strip_tac);
a(z_∃_tacⓩx1 - n⌝ THEN asm_rewrite_tac[z_plus_assoc_thm]);
save_pop_thm"z_dot_dot_plus_thm"
);
=TEX
=SML
val ⦏z_less_cases_thm⦎ = (
set_goal([],  ⓩ∀i, j:𝕌⦁ i < j ∨ i = j ∨ j < i⌝);
a(z_∀_tac);
a(ante_tac (rewrite_rule[z_≤_less_eq_thm] (z_∀_elimⓩ(i≜i, j≜j)⌝z_≤_cases_thm)));
a(rewrite_tac[prove_rule[]⌜j = i ⇔ i = j⌝]);
a(taut_tac);
save_pop_thm"z_less_cases_thm"
);
=TEX
=SML
val ⦏z_≤_≤_plus1_thm⦎ = (
set_goal([],  ⓩ∀i, j:𝕌⦁ i ≤ j ≤ i + 1 ⇔ j = i ∨ j = i + 1⌝);
a(contr_tac THEN_TRY SOLVED_T all_var_elim_asm_tac1);
a(strip_asm_tac (z_∀_elimⓩ(i≜j,j≜i+1)⌝ z_less_cases_thm));
(* *** Goal "1" *** *)
a(POP_ASM_T (strip_asm_tac o once_rewrite_rule[z_get_specⓩ(_<_)⌝])
	THEN all_fc_tac[z_≤_antisym_thm]);
(* *** Goal "2" *** *)
a(all_fc_tac[z_≤_less_trans_thm]);
save_pop_thm"z_≤_≤_plus1_thm"
);
=TEX
=SML
val ⦏z_dot_dot_diff_thm⦎ = (
set_goal([],  ⓩ∀i:ℕ⦁ (1 .. i + 1) \ {i + 1} = 1 .. i⌝);
a(MERGE_PCS_T1 ["'z_numbers", "z_sets_ext"]REPEAT strip_tac);
(* *** Goal "1" *** *)
a(contr_tac);
a(lemma_tacⓩi ≤ x1⌝ THEN1 (contr_tac THEN all_fc_tac[z_less_trans_thm]));
a(lemma_tacⓩ¬x1 = i⌝ THEN1 (contr_tac THEN all_var_elim_asm_tac1));
a(all_fc_tac[z_≤_≤_plus1_thm]);
(* *** Goal "2" *** *)
a(ante_tac(z_∀_elimⓩ(i≜x1, j≜i, k≜i+1)⌝z_≤_trans_thm));
a(asm_rewrite_tac[]);
(* *** Goal "3" *** *)
a(contr_tac THEN all_var_elim_asm_tac1);
save_pop_thm"z_dot_dot_diff_thm"
);
=TEX
=SML
val ⦏z_dot_dot_∪_thm⦎ = (
set_goal([],  ⓩ∀i:ℕ⦁ (1 .. i) ∪ {i + 1} = 1 .. i + 1⌝);
a(REPEAT strip_tac);
a(all_fc_tac[z_dot_dot_diff_thm]);
a(POP_ASM_T (rewrite_thm_tac o eq_sym_rule));
a(PC_T1 "z_sets_ext" prove_tac[]);
a(asm_rewrite_tac[]);
save_pop_thm"z_dot_dot_∪_thm"
);
=TEX
=SML
val ⦏z_dot_dot_∩_thm⦎ = (
set_goal([],  ⓩ∀i:ℕ⦁ (1 .. i) ∩ {i + 1} = {}⌝);
a(MERGE_PCS_T1 ["'z_numbers", "z_sets_ext"]REPEAT strip_tac);
a(all_var_elim_asm_tac1);
save_pop_thm"z_dot_dot_∩_thm"
);
=TEX
\subsection{Theorems on Finiteness}
\subsubsection{An Inductive Characterisation of Finiteness}
In this section we prove an inductive characterisation of the set
$𝔽X$ of finite subsets of $X$.
This requires quite a number of preliminaries.
=SML
val ⦏lemma_n1⦎ = (
set_goal([], ⓩ∀X:𝕌; n:ℕ⦁ ∀f: 1 .. n + 1 → X | ran f = X⦁
		∃x:X; Y:𝕌⦁ ∃ g:1 .. n → Y⦁ ran g = Y ∧ X = Y ∪ {x}⌝);
a(REPEAT strip_tac);
a(lemma_tacⓩdom f = 1 .. n + 1⌝ THEN1
	(asm_ante_tac ⓩf ∈ 1 .. n + 1 → X⌝ THEN prove_tac[z_→_thm]));
a(PC_T1 "z_fun_ext" lemma_tacⓩn + 1 ∈ dom f⌝ THEN1 asm_rewrite_tac[]);
a(z_∃_tacⓩ(x≜y, Y≜ran((1..n)◁f))⌝ THEN REPEAT strip_tac
	THEN1 PC_T1"z_fun_ext" asm_prove_tac[]);
a(z_∃_tacⓩ(1..n)◁f⌝ THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(lemma_tacⓩ1 .. n ⊆ 1 .. n + 1⌝ THEN1 rewrite_tac[z_dot_dot_clauses]);
a(all_fc_tac[z_◁_→_thm]);
(* *** Goal "2" *** *)
a(ALL_FC_T asm_rewrite_tac [z_ran_◁_thm]);
a(PC_T1 "z_sets_ext" REPEAT strip_tac);
(* *** Goal "2.1" *** *)
a(PC_T1 "z_fun_ext" lemma_tacⓩx1 ∈ ran f⌝ THEN1 asm_rewrite_tac[]);
a(lemma_tacⓩx ∈ dom f⌝ THEN1
	(POP_ASM_T ante_tac THEN PC_T1 "z_fun_ext" prove_tac[]));
a(POP_ASM_T ante_tac THEN asm_rewrite_tac[] THEN REPEAT strip_tac);
a(POP_ASM_T ante_tac THEN rewrite_tac[z_≤_less_eq_thm]);
a(once_rewrite_tac[z_get_specⓩ(_<_)⌝] THEN REPEAT strip_tac);
(* *** Goal "2.1.1" *** *)
a(all_asm_fc_tac[] THEN all_asm_fc_tac[z_≤_less_trans_thm]);
(* *** Goal "2.1.2" *** *)
a(all_var_elim_asm_tac1);
a(PC_T1 "z_sets_ext" lemma_tacⓩn + 1 ∈ 1 .. n + 1⌝ THEN1 asm_rewrite_tac[]);
a(all_fc_tac[z_→_∈_rel_⇔_app_eq_thm]);
a(all_var_elim_asm_tac1 THEN strip_tac);
(* *** Goal "2.2" *** *)
a(all_var_elim_asm_tac1);
a(POP_ASM_T ante_tac THEN PC_T1 "z_fun_ext" prove_tac[]);
Combinators.K (pop_thm()) "lemma_n1"
);
=TEX
=SML
val ⦏lemma_n2⦎ = (
set_goal([],  ⓩ[X](𝔽 X ⊆ ⋂{u : ℙ ℙ X| {} ∈ u ∧ (∀ x:X; a:u⦁ (a ∪ {x}) ∈ u)})⌝);
a(rewrite_tac[get_specⓩ(𝔽_)⌝]);
a(REPEAT strip_tac THEN PC_T "z_sets_ext" strip_tac THEN REPEAT strip_tac);
a(MAP_EVERY asm_ante_tac [ⓩran f = x1⌝, ⓩf ∈ 1 .. n → x1⌝, ⓩx1 ⊆ X⌝]);
a(z_intro_∀_tacⓩ(f ≜ f,a≜x1)⌝ THEN z_≤_induction_tacⓩn⌝);
(* *** Goal "1" *** *)
a(LEMMA_Tⓩ 1 .. 0 = {}⌝ rewrite_thm_tac THEN1 rewrite_tac[z_dot_dot_clauses]);
a(rewrite_tac[pc_rule1"z_fun_ext"prove_rule[]ⓩ[X]({} → X = {{}})⌝]);
a(REPEAT_N 4 z_strip_tac THEN asm_rewrite_tac[]);
a(rewrite_tac[pc_rule1"z_rel_ext"prove_rule[]ⓩran {} = {}⌝]);
a(REPEAT strip_tac THEN all_var_elim_asm_tac1);
(* *** Goal "2" *** *)
a(REPEAT strip_tac);
a(all_fc_tac[lemma_n1]);
a(lemma_tacⓩY ⊆ X⌝ THEN1
	(asm_ante_tac ⓩa ⊆ X⌝ THEN asm_ante_tac ⓩa = Y ∪ {x}⌝
		THEN PC_T1 "z_sets_ext" prove_tac[]));
a(LIST_GET_NTH_ASM_T [9] all_fc_tac);
a(PC_T1 "z_sets_ext" (LIST_GET_NTH_ASM_T [9]) all_fc_tac);
a(LIST_GET_NTH_ASM_T [13] (ALL_FC_T asm_rewrite_tac));
Combinators.K (pop_thm()) "lemma_n2"
);
=TEX
=SML
val ⦏z_empty_𝔽_thm⦎ = (
set_goal([],  ⓩ[X]({} ∈ 𝔽 X)⌝);
a(rewrite_tac[z_get_specⓩ(𝔽_)⌝, z_→_ran_eq_↠_thm]);
a(z_∃_tac ⓩ0⌝ THEN REPEAT strip_tac);
a(LEMMA_Tⓩ 1 .. 0 = {}⌝ rewrite_thm_tac THEN1 rewrite_tac[z_dot_dot_clauses]);
a(rewrite_tac[z_empty_↠_thm]);
save_pop_thm"z_empty_𝔽_thm"
);
=TEX
=SML
val ⦏z_𝔽_∪_singleton_thm⦎ = (
set_goal([],  ⓩ[X](∀x : X; a : 𝔽 X⦁ (a ∪ {x}) ∈ 𝔽 X)⌝);
a(rewrite_tac[z_get_specⓩ(𝔽_)⌝, z_→_ran_eq_↠_thm]);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(PC_T1 "z_sets_ext" asm_prove_tac[]);
(* *** Goal "2" *** *)
a(z_∃_tac ⓩn+1⌝ THEN all_fc_tac[z_ℕ_plus1_thm] THEN asm_rewrite_tac[]);
a(lemma_tacⓩ {(n + 1, x)} ∈ {n + 1} ↠ {x} ⌝ THEN PC_T1 "z_fun_ext" prove_tac[]);
a(strip_asm_tac(z_∀_elimⓩn⌝z_dot_dot_∩_thm) THEN1 all_fc_tac[z_≤_less_trans_thm]);
a(all_fc_tac[z_∪_↠_thm]);
a(POP_ASM_T ante_tac THEN ALL_FC_T rewrite_tac[z_dot_dot_∪_thm]);
a(PC_T1 "z_predicates" prove_tac[]);
save_pop_thm"z_𝔽_∪_singleton_thm"
);
=TEX
=SML
val ⦏lemma_n3⦎ = (
set_goal([],  ⓩ[X](⋂{u : ℙ ℙ X| {} ∈ u ∧ (∀ x:X; a:u⦁ (a ∪ {x}) ∈ u)} ⊆ 𝔽 X)⌝);
a(REPEAT strip_tac THEN PC_T "z_sets_ext" strip_tac THEN REPEAT strip_tac);
a(POP_ASM_T (strip_asm_tac o z_∀_elimⓩ𝔽 X⌝));
(* *** Goal "1" *** *)
a(i_contr_tac THEN PC_T1 "z_sets_ext" asm_prove_tac[z_get_specⓩ(𝔽_)⌝]);
(* *** Goal "2" *** *)
a(asm_prove_tac[z_empty_𝔽_thm]);
(* *** Goal "3" *** *)
a(all_fc_tac[z_𝔽_∪_singleton_thm]);
Combinators.K (pop_thm()) "lemma_n3"
);
=TEX
Our desired inductive characterisation of $𝔽X$ may now be proved:
=SML
val ⦏z_𝔽_thm1⦎ = (
set_goal([],  ⓩ[X](𝔽 X = ⋂{u : ℙ ℙ X| {} ∈ u ∧ (∀ x:X; a:u⦁ (a ∪ {x}) ∈ u)})⌝);
a(rewrite_tac[pc_rule1"z_sets_ext"prove_rule[]ⓩ∀a, b:𝕌⦁a = b ⇔ a ⊆ b ∧ b ⊆ a⌝,
	lemma_n2, lemma_n3]);
save_pop_thm"z_𝔽_thm1"
);
=TEX
\subsubsection{The Induction Principle}
The inductive characterisation of $𝔽X$ proved in the previous section
makes it fairly easy to derive an induction principle.

First a supplementary lemma:
=SML
val ⦏lemma_n4⦎ = (
set_goal([], ⓩ∀X:𝕌; Y:𝕌⦁ ∀ f:X ⤖ Y; x:X; y:Y⦁ ∃g : X ⤖ Y⦁ (x, y) ∈ g⌝);
a(REPEAT strip_tac);
a(lemma_tacⓩ∃z:Y⦁(x, z) ∈ f⌝ THEN1
	(asm_ante_tac ⓩx ∈ X⌝ THEN asm_ante_tac ⓩf ∈ X ⤖ Y⌝
		THEN PC_T1 "z_rel_ext"
			prove_tac(z_↠_thm1 :: map z_get_spec[ⓩ(_⤖_)⌝, ⓩ(_→_)⌝])));
a(strip_asm_tac(z_∀_elimⓩ(x≜z, y≜y)⌝(rewrite_rule[]
				(z_∀_elimⓩY⌝ z_⤖_trans_thm))));
a(z_∃_tacⓩg ∘ f⌝);
a(ALL_FC_T rewrite_tac[z_∘_⤖_thm]);
a(PC_T1 "z_rel_ext" asm_prove_tac[]);
Combinators.K (pop_thm()) "lemma_n4"
);
=TEX
=SML
val ⦏lemma_n5⦎ = (
set_goal([], ⓩ∀m, n: ℕ⦁( ∃f: 1..m ⤖ 1..n⦁ true) ⇔ m = n⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(POP_ASM_T ante_tac THEN POP_ASM_T ante_tac THEN
	z_intro_∀_tacⓩ(f≜f,n≜n)⌝ THEN z_≤_induction_tacⓩm⌝);
(* *** Goal "1.1" *** *)
a(LEMMA_Tⓩ 1 .. 0 = {}⌝ rewrite_thm_tac THEN1 rewrite_tac[z_dot_dot_clauses]);
a(rewrite_tac[z_get_specⓩ(_⤖_)⌝] THEN REPEAT strip_tac);
a(all_fc_tac[z_empty_↠_thm]);
a(contr_tac);
a(strip_asm_tac(z_∀_elimⓩn⌝ z_ℕ_cases_thm)
	THEN1 all_fc_tac[z_≤_less_trans_thm] THEN all_var_elim_asm_tac1);
a(swap_asm_concl_tac ⓩ1 .. j + 1 = {}⌝ THEN PC_T1 "z_sets_ext" REPEAT strip_tac);
a(z_∃_tacⓩ1⌝ THEN asm_rewrite_tac[z_dot_dot_clauses]);
(* *** Goal "1.2" *** *)
a(contr_tac);
a(lemma_tacⓩ1 ≤ n⌝);
(* *** Goal "1.2.1" *** *)
a(contr_tac);
a(strip_asm_tac(z_∀_elimⓩn⌝ z_ℕ_cases_thm)
	THEN_TRY all_var_elim_asm_tac1
	THEN_TRY (SOLVED_T (all_fc_tac[z_less_≤_trans_thm, z_≤_less_trans_thm])));
a(swap_asm_concl_tacⓩf ∈ 1 .. i + 1 ⤖ 1 .. 0⌝
	THEN (LEMMA_Tⓩ 1 .. 0 = {}⌝ rewrite_thm_tac THEN1
			rewrite_tac[z_dot_dot_clauses]));
a(rewrite_tac[z_get_specⓩ(_⤖_)⌝, z_↠_thm1]);
a(contr_tac THEN all_fc_tac[z_→_empty_thm]);
a(swap_asm_concl_tacⓩ1 .. i + 1 = {}⌝ THEN PC_T1 "z_sets_ext" REPEAT strip_tac);
a(z_∃_tacⓩ1⌝ THEN asm_rewrite_tac[]);
(* *** Goal "1.2.2" *** *)
a(strip_asm_tac(z_∀_elimⓩn⌝ z_ℕ_cases_thm)
	THEN_TRY all_var_elim_asm_tac1
	THEN_TRY (SOLVED_T (all_fc_tac[z_less_≤_trans_thm, z_≤_less_trans_thm])));
a(strip_asm_tac(rewrite_rule[](z_∀_elimⓩ(f≜f, x≜i+1, y≜j+1)⌝
	(rewrite_rule[](z_∀_elimⓩ(X≜1..i+1, Y≜1..j+1)⌝ lemma_n4))))
	THEN_TRY (SOLVED_T (all_fc_tac[z_less_≤_trans_thm, z_≤_less_trans_thm])));
a(strip_asm_tac(rewrite_rule[](z_∀_elimⓩ(f≜g, x≜i+1, y≜j+1)⌝
	(rewrite_rule[](z_∀_elimⓩ(X≜1..i+1, Y≜1..j+1)⌝ z_⤖_diff_singleton_thm))))
	THEN_TRY (SOLVED_T (all_fc_tac[z_less_≤_trans_thm, z_≤_less_trans_thm])));
a(swap_nth_asm_concl_tac 1);
a(ALL_FC_T rewrite_tac[z_dot_dot_diff_thm]);
a(contr_tac THEN all_asm_fc_tac[]);
a(all_var_elim_asm_tac1);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[] THEN z_∃_tacⓩid (1..n)⌝ THEN rewrite_tac[z_id_⤖_thm]);
Combinators.K (pop_thm()) "lemma_n5"
);
=TEX
Now we prove the induction principle, which we state in a mixture of Z and
HOL suitable for use with HOL's generic function for deriving induction
tactics.
=SML
val ⦏z_𝔽_induction_thm⦎ = (
set_goal([],
	⌜∀ X p ⦁
		p ⓩ{}⌝
	∧	(∀ x a⦁ p ⓩa⌝ ∧ ⓩa ∈ 𝔽 X⌝ ∧ ⓩx ∈ X⌝ ∧ ⓩ¬x ∈ a⌝ ⇒ p ⓩa ∪ {x}⌝)
      ⇒ (∀ a⦁ ⓩa ∈ 𝔽 X⌝ ⇒ p a)⌝);
a(REPEAT ∀_tac THEN strip_tac);
a(rewrite_tac[z_𝔽_thm1] THEN REPEAT strip_tac);
a(POP_ASM_T (strip_asm_tac o z_∀_elimⓩ{a : 𝔽 X | ⌜p a⌝}⌝));
(* *** Goal "1" *** *)
a(swap_nth_asm_concl_tac 1 THEN PC_T1 "z_sets_ext" prove_tac[z_get_specⓩ(𝔽_)⌝]);
(* *** Goal "2" *** *)
a(all_fc_tac[z_empty_𝔽_thm]);
(* *** Goal "3" *** *)
a(all_fc_tac[z_𝔽_∪_singleton_thm]);
(* *** Goal "4" *** *)
a(cases_tacⓩx ∈ a'⌝);
(* *** Goal "4.1" *** *)
a(lemma_tacⓩa' ∪ {x} = a'⌝ THEN1 PC_T1 "z_sets_ext" asm_prove_tac[]);
a(asm_ante_tac ⓩ¬ ⌜p ⓩa' ∪ {x}⌝⌝⌝ THEN asm_rewrite_tac[]);
(* *** Goal "4.2" *** *)
a(all_asm_fc_tac[]);
save_pop_thm"z_𝔽_induction_thm"
);
=TEX
We now define the induction tactic:
=SML
local
val ZGVar (𝔽_name, _, _) = dest_z_term ⓩ𝔽 {}⌝;

fun ⦏dest_∈_𝔽⦎ (tm : TERM) : TERM * TERM = (
	let	val (x, 𝔽a) = dest_z_∈ tm;
		val (𝔽, _, a) = dest_z_gvar 𝔽a;
	in	if	𝔽 = 𝔽_name
		then	(x, hd a)
		else	fail "dest_∈_𝔽" 0 []	(* always caught below *)
	end
);
in
fun ⦏z_𝔽_induction_tac⦎ (tm : TERM) : TACTIC = (
	if not (is_var tm)
	then term_fail "z_𝔽_induction_tac" 107032 [tm]
	else ( fn(asms, conc) =>
	let	fun d t = (dest_∈_𝔽 t, t);
		val ((x, a), asm) = find
			(mapfilter d asms) (fn ((x, _), _) => x =$ tm)
			handle Fail _ => fail "z_𝔽_induction_tac" 107033 [];
		val thm = ∀_elim a z_𝔽_induction_thm;
	in	if not (is_free_in tm conc)
			then term_fail "z_𝔽_induction_tac" 86404 [tm]
		else if any (asms drop (fn t => t =$ asm)) (is_free_in tm)
			then term_fail "z_𝔽_induction_tac" 86403 [tm]
		else	(asm_ante_tac asm THEN gen_induction_tac1 thm) (asms, conc)
	end
	)
);
end;
=TEX
\subsubsection{Concerning the Size Function}
We now prove theorems for determining the size of
finite sets constructed in various ways, e.g. as a union.
First of all, the next few lemmas build up to a result of very
general utility: to show a set is finite and has size $n$, put
it in one-one correspondence with the interval $1..n$.
=SML
val ⦏lemma_n6⦎ = (
set_goal([], ⓩ[X](∀A:𝔽 X⦁ ∃n:ℕ⦁ ∃f : 1 .. n ⤖ A⦁ true)⌝);
a(REPEAT strip_tac);
a(z_𝔽_induction_tacⓩA⌝);
(* *** Goal "1" *** *)
a(z_∃_tacⓩ0⌝ THEN REPEAT strip_tac);
a(LEMMA_Tⓩ 1 .. 0 = {}⌝ rewrite_thm_tac THEN1 rewrite_tac[z_dot_dot_clauses]);
a(z_∃_tacⓩ{}⌝ THEN REPEAT strip_tac);
a(PC_T1 "z_fun_ext" prove_tac[]);
(* *** Goal "2" *** *)
a(strip_asm_tac(z_∀_elimⓩn⌝ z_ℕ_plus1_thm) THEN1 all_fc_tac[z_≤_less_trans_thm]);
a(z_∃_tacⓩn+1⌝ THEN REPEAT strip_tac);
a(z_∃_tacⓩf ∪ {(n+1, x)}⌝ THEN REPEAT strip_tac);
a(lemma_tacⓩ{(n+1, x)} ∈ {n+1} ⤖ {x}⌝ THEN1
	(PC_T1 "z_fun_ext" prove_tac[] THEN asm_rewrite_tac[]));
a(strip_asm_tac(z_∀_elimⓩn⌝z_dot_dot_∩_thm) THEN1 all_fc_tac[z_≤_less_trans_thm]);
a(lemma_tacⓩA ∩ {x} = {}⌝
	THEN1 (PC_T"z_sets_ext"contr_tac THEN all_var_elim_asm_tac1));
a(all_fc_tac[z_∪_⤖_thm]);
a(POP_ASM_T ante_tac THEN ALL_FC_T rewrite_tac[z_dot_dot_∪_thm]);
Combinators.K (pop_thm()) "lemma_n6"
);
=TEX
=SML
val ⦏lemma_n7⦎ = (
set_goal([], ⓩ[X](∀A:𝔽 X⦁ ∃⋎1 n:ℕ⦁ ∃f : 1 .. n ⤖ A⦁ true)⌝);
a(REPEAT strip_tac);
a(all_fc_tac[lemma_n6]);
a(z_∃⋎1_tacⓩn⌝ THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(z_∃_tacⓩf⌝ THEN REPEAT strip_tac);
(* *** Goal "2" *** *)
a(lemma_tacⓩf ↗~↕ ∘ f' ∈  1 .. n' ⤖ 1 ..n⌝
	THEN1 (all_fc_tac[z_rel_inv_⤖_thm] THEN all_fc_tac[z_∘_⤖_thm]));
a(all_fc_tac[lemma_n5]);
Combinators.K (pop_thm()) "lemma_n7"
);
=TEX
=SML
val ⦏lemma_n8⦎ = (
set_goal([], ⓩ[X](𝔽 X = {A : ℙ X | ∃n:ℕ⦁ ∃f : 1 .. n ⤖ A⦁ true})⌝);
a(strip_tac THEN PC_T "z_sets_ext" strip_tac THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(z_𝔽_induction_tacⓩx1⌝ THEN PC_T1 "z_sets_ext" asm_prove_tac[]);
(* *** Goal "2" *** *)
a(all_fc_tac[lemma_n7]);
a(z_∃_tacⓩn⌝ THEN REPEAT strip_tac);
a(z_∃_tacⓩf⌝ THEN REPEAT strip_tac);
(* *** Goal "3" *** *)
a(POP_ASM_T ante_tac THEN
	rewrite_tac(map z_get_spec [ⓩ(_⤖_)⌝, ⓩ(𝔽_)⌝, ⓩ(_↣_)⌝]));
a(REPEAT strip_tac);
a(z_∃_tacⓩn⌝ THEN REPEAT strip_tac);
a(z_∃_tacⓩf⌝ THEN REPEAT strip_tac);
a(all_fc_tac[z_↠_thm]);
Combinators.K (pop_thm()) "lemma_n8"
);
=TEX
=SML
val ⦏z_𝔽_ℙ_thm⦎ = (
set_goal([], ⓩ[X](𝔽 X = ℙ X ∩ (𝔽_))⌝);
a(rewrite_tac[lemma_n8] THEN strip_tac
	THEN PC_T "z_sets_ext" strip_tac THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(z_∃_tacⓩn⌝ THEN REPEAT strip_tac);
a(z_∃_tacⓩf⌝ THEN REPEAT strip_tac);
(* *** Goal "2" duplicates goal "1" *** *)
save_pop_thm "z_𝔽_ℙ_thm"
);
=TEX
=SML
val ⦏z_𝔽_size_thm⦎ = (
set_goal([], ⓩ∀A:𝕌; f:𝕌; n:ℕ| f ∈ 1 .. n ⤖ A⦁ A ∈ (𝔽 _) ∧ # A = n⌝);
a(REPEAT_UNTIL is_∧ strip_tac);
a(lemma_tac ⓩA ∈ (𝔽 _)⌝ THEN1
	(rewrite_tac[lemma_n8]
		THEN contr_tac THEN all_asm_fc_tac[] THEN all_asm_fc_tac[]));
a(ALL_FC_T rewrite_tac[z_get_specⓩ#⌝]);
a(asm_rewrite_tac[z_↣_ran_eq_⤖_thm]);
a(bc_tac[rewrite_rule[](z_∀_elimⓩn⌝
		(z_μ_ruleⓩμ n : ℕ | ∃ f : 1 .. n ⤖ A ⦁ true ⦁ n⌝))]);
(* *** Goal "1" *** *)
a(all_fc_tac[lemma_n7]);
a(contr_tac);
a(all_asm_fc_tac[]);
a(all_var_elim_asm_tac1);
(* *** Goal "2" *** *)
a(all_fc_tac[lemma_n7]);
a(contr_tac);
a(all_asm_fc_tac[]);
save_pop_thm"z_𝔽_size_thm"
);
=TEX
In use it is convenient to have the two empty sets in the following have
the same type.
=SML
val ⦏z_size_empty_thm⦎ = (
set_goal([], ⓩ({} ⦂ ℙ X) ∈ (𝔽_) ∧ # ({} ⦂ ℙ X) = 0⌝);
a(lemma_tacⓩ∃f: 1 .. 0 ⤖ {} ⦁ true⌝);
(* *** Goal "1" *** *)
a(LEMMA_Tⓩ1 .. 0 = {}⌝ rewrite_thm_tac THEN1 rewrite_tac[z_dot_dot_clauses]);
a(z_∃_tacⓩ{}⌝ THEN PC_T1 "z_fun_ext" prove_tac[]);
(* *** Goal "2" *** *)
a(LEMMA_T ⓩ0 ≤ 0⌝ asm_tac THEN all_fc_tac[z_𝔽_size_thm] THEN REPEAT strip_tac);
save_pop_thm"z_size_empty_thm"
);
=TEX
=SML
val ⦏z_size_singleton_thm⦎ = (
set_goal([], ⓩ∀x : 𝕌⦁ {x} ∈ (𝔽_) ∧ # {x} = 1⌝);
a(z_∀_tac THEN rewrite_tac[]);
a(lemma_tacⓩ∃f: 1 .. 1 ⤖ {x} ⦁ true⌝);
(* *** Goal "1" *** *)
a(LEMMA_Tⓩ1 .. 1 = {1}⌝ rewrite_thm_tac THEN1 rewrite_tac[z_dot_dot_clauses]);
a(z_∃_tacⓩ{(1, x)}⌝ THEN PC_T1 "z_fun_ext" prove_tac[]);
a(asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(LEMMA_T ⓩ0 ≤ 1⌝ asm_tac THEN all_fc_tac[z_𝔽_size_thm] THEN REPEAT strip_tac);
save_pop_thm"z_size_singleton_thm"
);
=TEX
=SML
val ⦏z_size_dot_dot_thm⦎ = (
set_goal([], ⓩ∀n:ℕ⦁ 1 .. n ∈ (𝔽 _) ∧ # (1 .. n) = n⌝);
a(REPEAT_UNTIL is_∧ strip_tac);
a(strip_asm_tac(z_∀_elimⓩ1 .. n⌝z_id_⤖_thm));
a(all_fc_tac[z_𝔽_size_thm]);
a(REPEAT strip_tac);
save_pop_thm"z_size_dot_dot_thm"
);
=TEX
=SML
val ⦏lemma_n10⦎ = (
set_goal([], ⓩ∀X:𝕌; Y:𝕌; f:𝕌⦁
		f ∈ X ⤖ Y ∧ X ∈ (𝔽_) ⇒ Y ∈ (𝔽_)⌝);
a(rewrite_tac[lemma_n8] THEN REPEAT strip_tac);
a(z_∃_tacⓩn⌝ THEN REPEAT strip_tac);
a(z_∃_tacⓩf ∘ f'⌝ THEN REPEAT strip_tac);
a(all_fc_tac[z_∘_⤖_thm]);
Combinators.K (pop_thm()) "lemma_n10"
);
=TEX
=SML
val ⦏lemma_n11⦎ = (
set_goal([], ⓩ∀X:𝕌; Y:𝕌; f:𝕌⦁
		(f ∈ X ⤖ Y)
	⇒	(X ∈ (𝔽_) ⇔ Y ∈ (𝔽_)) ∧ (X ∈ (𝔽_) ∨ Y ∈ (𝔽_) ⇒ #X = #Y)⌝);
a(z_strip_tac THEN strip_tac THEN strip_tac);
a(LEMMA_TⓩY ∈ (𝔽 _) ⇔ X ∈ (𝔽 _)⌝rewrite_thm_tac);
(* *** Goal "1" *** *)
a(all_fc_tac[z_rel_inv_⤖_thm]);
a(REPEAT strip_tac THEN all_fc_tac[lemma_n10]);
(* *** Goal "2" *** *)
a(rewrite_tac[lemma_n8] THEN REPEAT strip_tac);
a(all_fc_tac[z_∘_⤖_thm]);
a(ALL_FC_T rewrite_tac[z_𝔽_size_thm]);
Combinators.K (pop_thm()) "lemma_n11"
);
=TEX
=SML
val ⦏z_size_⇻_thm⦎ = (
set_goal([], ⓩ∀X:𝕌; Y:𝕌; f:𝕌 | f ∈ X ⇻ Y ⦁ f ∈ (𝔽_) ∧ #f = #(dom f)⌝);
a(rewrite_tac[z_⇸_thm2, z_get_specⓩ(_⇻_)⌝] THEN REPEAT_UNTIL is_∧ strip_tac);
a(POP_ASM_T (strip_asm_tac o once_rewrite_rule[z_𝔽_ℙ_thm]));
a(all_fc_tac[z_dom_f_⤖_f_thm]);
a(ALL_FC_T rewrite_tac [lemma_n11]);
save_pop_thm"z_size_⇻_thm"
);
=TEX
=SML
val ⦏z_size_seq_thm⦎ = (
set_goal([], ⓩ∀X:𝕌; f:𝕌; n : ℕ | f ∈ 1 .. n → X ⦁ #f = n⌝);
a(REPEAT strip_tac);
a(all_fc_tac[z_dom_f_⤖_f_thm, z_→_thm]);
a(DROP_NTH_ASM_T 3 ante_tac THEN asm_rewrite_tac[]
	THEN REPEAT strip_tac);
a(all_fc_tac[z_𝔽_size_thm]);
save_pop_thm"z_size_seq_thm"
);
=TEX
=SML
val _ = set_merge_pcs["'z_numbers", "z_sets_alg"];
=TEX
=SML
val ⦏z_size_∪_singleton_thm⦎ = (
set_goal([], ⓩ∀a : (𝔽_); x: 𝕌 | ¬x ∈ a ⦁ # (a ∪ {x}) = #a + 1⌝);
a(rewrite_tac[lemma_n8] THEN REPEAT strip_tac);
a(lemma_tacⓩ{(n + 1, x)} ∈ {n + 1} ⤖ {x}⌝ THEN1
	(PC_T1 "z_fun_ext" prove_tac[] THEN asm_rewrite_tac[]));
a(lemma_tacⓩ(1 .. n) ∩ {n + 1} = {}⌝ THEN1 ALL_FC_T rewrite_tac[z_dot_dot_∩_thm]);
a(lemma_tac ⓩa ∩ {x} = {}⌝ THEN1 PC_T1 "z_fun_ext" asm_prove_tac[]);
a(all_fc_tac[z_∪_⤖_thm]);
a(POP_ASM_T ante_tac THEN ALL_FC_T rewrite_tac[z_dot_dot_∪_thm] THEN strip_tac);
a(all_fc_tac[z_ℕ_plus1_thm]);
a(all_fc_tac[z_𝔽_size_thm]);
a(asm_rewrite_tac[]);
save_pop_thm"z_size_∪_singleton_thm"
);
=TEX
=SML
val ⦏z_𝔽_∩_thm⦎ = (
set_goal([], ⓩ∀a, b : 𝕌 | a ∈ (𝔽_) ∨ b ∈ (𝔽_) ⦁ (a ∩ b) ∈ (𝔽_)⌝);
a(lemma_tac ⓩ∀c, d : 𝕌 | c ∈ (𝔽_) ⦁ (c ∩ d) ∈ (𝔽_)⌝);
a(REPEAT strip_tac);
a(z_𝔽_induction_tacⓩc⌝);
(* *** Goal "1.1" *** *)
a(rewrite_tac[z_empty_𝔽_thm]);
(* *** Goal "1.2" *** *)
a(cases_tacⓩx ∈ d⌝);
(* *** Goal "1.2.1" *** *)
a(lemma_tacⓩ¬x ∈ c ∧ x ∈ d ⇒ (c ∪ {x}) ∩ d = (c ∩ d) ∪ {x}⌝
	THEN1 PC_T1 "z_sets_ext" prove_tac[]);
a(strip_asm_tac (z_∀_elimⓩ(x≜x, a≜c ∩ d)⌝
	(∀_elimⓩ𝕌 ⦂ℙX⌝z_𝔽_∪_singleton_thm)));
a(asm_rewrite_tac[]);
(* *** Goal "1.2.2" *** *)
a(lemma_tacⓩ¬ x ∈ d ⇒ (c ∪ {x}) ∩ d = c ∩ d⌝
	THEN1 PC_T1 "z_sets_ext" prove_tac[]);
a(asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(REPEAT strip_tac THEN all_asm_fc_tac[]);
(* *** Goal "2.1" *** *)
a(asm_rewrite_tac[]);
(* *** Goal "2.2" *** *)
a(LEMMA_Tⓩa ∩ b = b ∩ a⌝ asm_rewrite_thm_tac THEN PC_T1 "z_sets_ext" prove_tac[]);
save_pop_thm"z_𝔽_∩_thm"
);
=TEX
=SML
val ⦏z_𝔽_diff_thm⦎ = (
set_goal([], ⓩ∀a, b : 𝕌 | a ∈ (𝔽_) ⦁ (a \ b) ∈ (𝔽_)⌝);
a(REPEAT strip_tac);
a(LEMMA_T ⓩa \ b = a ∩ (𝕌 \ b)⌝ rewrite_thm_tac THEN1
		PC_T1 "z_sets_ext"prove_tac[]);
a(FC_T rewrite_tac[z_𝔽_∩_thm]);
save_pop_thm"z_𝔽_diff_thm"
);
=TEX
=SML
val ⦏z_⊆_𝔽_thm⦎ = (
set_goal([], ⓩ∀a:(𝔽_); b: 𝕌 | b ⊆ a ⦁ b ∈ (𝔽_)⌝);
a(REPEAT strip_tac);
a(LEMMA_Tⓩb = a \ {x:a|¬x ∈ b}⌝ once_rewrite_thm_tac
	THEN1 PC_T1 "z_sets_ext" asm_prove_tac[]);
a(ALL_FC_T rewrite_tac[z_𝔽_diff_thm]);
save_pop_thm"z_⊆_𝔽_thm"
);
=TEX
=SML
val ⦏z_size_∪_thm⦎ = (
set_goal([], ⓩ∀a, b : (𝔽_)⦁ (a ∪ b) ∈ (𝔽_) ∧ # (a ∪ b) + #(a ∩ b) = #a + #b⌝);
a(REPEAT_UNTIL is_∧ strip_tac);
a(z_𝔽_induction_tacⓩb⌝);
(* *** Goal "1" *** *)
a(asm_rewrite_tac[z_size_empty_thm]);
(* *** Goal "2" *** *)
a(rewrite_tac[
	pc_rule1"z_sets_ext" prove_rule[]ⓩ∀A, B, C:𝕌⦁A ∪ (B ∪ C) = (A ∪ B) ∪ C⌝]);
a(ALL_FC_T rewrite_tac[∀_elimⓩ𝕌 ⦂ℙX⌝z_𝔽_∪_singleton_thm,
	z_size_∪_singleton_thm]);
a(cases_tacⓩx ∈ a⌝);
(* *** Goal "2.1" *** *)
a(lemma_tac ⓩx ∈ a ⇒ ((a ∪ b') ∪ {x}) = a ∪ b' ∧  a ∩ (b' ∪ {x}) = (a ∩ b') ∪ {x}⌝
	THEN1 PC_T1 "z_sets_ext" prove_tac[]);
a(strip_asm_tac (z_∀_elimⓩ(a≜a, b≜b')⌝z_𝔽_∩_thm));
a(strip_asm_tac (z_∀_elimⓩ(a≜a ∩ b', x≜x)⌝z_size_∪_singleton_thm));
a(asm_rewrite_tac[z_∀_elimⓩ1⌝ z_plus_order_thm]);
(* *** Goal "2.2" *** *)
a(lemma_tac ⓩ¬x ∈ a ∧ ¬ x ∈ b' ⇒ a ∩ (b' ∪ {x}) = (a ∩ b')⌝
	THEN1 PC_T1 "z_sets_ext" prove_tac[]);
a(strip_asm_tac (z_∀_elimⓩ(a≜a ∪ b', x≜x)⌝z_size_∪_singleton_thm));
a(asm_rewrite_tac[z_∀_elimⓩ1⌝ z_plus_order_thm]);
save_pop_thm"z_size_∪_thm"
);
=TEX
=SML
val ⦏z_⋃_𝔽_thm⦎ = (
set_goal([], ⓩ∀u : 𝔽(𝔽_)⦁ ⋃u ∈ (𝔽_)⌝);
a(REPEAT strip_tac);
a(z_𝔽_induction_tacⓩu⌝);
(* *** Goal "1" *** *)
a(rewrite_tac[z_size_empty_thm]);
(* *** Goal "2" *** *)
a(all_fc_tac[z_size_∪_thm]);
a(LEMMA_T ⓩ⋃ (u ∪ {x}) = ⋃ u ∪ x⌝ asm_rewrite_thm_tac);
a(DROP_ASMS_T discard_tac THEN PC_T1 "z_sets_ext" prove_tac[]);
a(z_∃_tacⓩx⌝ THEN REPEAT strip_tac);
save_pop_thm"z_⋃_𝔽_thm"
);
=TEX
=SML
val ⦏z_size_diff_thm⦎ = (
set_goal([], ⓩ∀ a : (𝔽 _); b: 𝕌 ⦁ a \ b ∈ (𝔽 _) ∧  # (a \ b) + # (a ∩ b) = # a⌝);
a(REPEAT_UNTIL is_∧ strip_tac);
a(lemma_tac ⓩa \ b ∈ (𝔽 _)⌝THEN1 ALL_FC_T rewrite_tac[z_𝔽_diff_thm]);
a(lemma_tac ⓩa ∩ b ∈ (𝔽 _)⌝THEN1 ALL_FC_T rewrite_tac[z_𝔽_∩_thm]);
a(REPEAT strip_tac);
a(strip_asm_tac(z_∀_elimⓩ(a ≜ a \ b, b ≜ a ∩ b)⌝ z_size_∪_thm));
a(POP_ASM_T ante_tac);
a(rewrite_tac[pc_rule1"z_sets_ext" prove_rule[]
	ⓩ(a \ b) ∪ a ∩ b = a ∧ (a \ b) ∩ (a ∩ b) = {}⌝, z_size_empty_thm]);
a(STRIP_T rewrite_thm_tac);
save_pop_thm"z_size_diff_thm"
);
=TEX
=SML
val ⦏z_size_ℕ_thm⦎ = (
set_goal([], ⓩ∀a : (𝔽_) ⦁ # a ∈ ℕ⌝);
a(rewrite_tac[lemma_n8] THEN REPEAT strip_tac);
a(all_fc_tac[z_𝔽_size_thm]);
a(asm_rewrite_tac[]);
save_pop_thm"z_size_ℕ_thm"
);
=TEX
=SML
val ⦏z_𝔽_size_thm1⦎ = (
set_goal([], ⓩ∀a: (𝔽_) ⦁ (∃f:1 .. #a ⤖ a ⦁true)⌝);
a(REPEAT strip_tac);
a(z_𝔽_induction_tac ⓩa⌝);
(* *** Goal "1" *** *)
a(rewrite_tac[z_size_empty_thm] THEN REPEAT strip_tac);
a(z_∃_tacⓩ{}⌝ THEN PC_T1 "z_fun_ext" REPEAT strip_tac);
(* *** Goal "2" *** *)
a(all_fc_tac[z_size_∪_singleton_thm, z_size_ℕ_thm]);
a(asm_rewrite_tac[]);
a(ALL_FC_T rewrite_tac[conv_rule(ONCE_MAP_C eq_sym_conv) z_dot_dot_∪_thm]);
a(z_∃_tacⓩf ∪ {(#a + 1, x)}⌝ THEN rewrite_tac[]);
a(bc_thm_tac
	(rewrite_rule[](conv_rule (MAP_C z_∀_elim_conv) (z_∪_⤖_thm))));
a(asm_rewrite_tac[
	pc_rule1 "z_fun_ext" prove_rule[]
		ⓩ∀x:𝕌; y:𝕌⦁{(x, y)} ∈ {x} ⤖ {y}⌝]);
a(PC_T1 "z_rel_ext" REPEAT strip_tac
	THEN all_var_elim_asm_tac1);
save_pop_thm"z_𝔽_size_thm1"
);
=TEX
=SML
val ⦏z_size_mono_thm⦎ = (
set_goal([], ⓩ∀a : (𝔽_); b: 𝕌 | b ⊆ a ⦁ #b ≤ #a⌝);
a(REPEAT strip_tac);
a(strip_asm_tac(z_∀_elimⓩ(a ≜ a, b ≜ a \ b)⌝ z_size_diff_thm));
a(POP_ASM_T ante_tac);
a(lemma_tacⓩb ⊆ a ⇒ a \ (a \ b) = b ∧ a ∩ (a \ b) = a \ b⌝
	THEN1 PC_T1 "z_sets_ext" prove_tac[]);
a(asm_rewrite_tac[]);
a(STRIP_T (rewrite_thm_tac o eq_sym_rule));
a(lemma_tac ⓩa \ b ∈ (𝔽_)⌝ THEN1 ALL_FC_T rewrite_tac[z_size_diff_thm]);
a(all_fc_tac[z_size_ℕ_thm]);
save_pop_thm"z_size_mono_thm"
);
=TEX
=SML
val ⦏z_size_∪_≤_thm⦎ = (
set_goal([], ⓩ∀a, b : (𝔽_)  ⦁ #(a ∪ b) ≤ #a + #b⌝);
a(REPEAT strip_tac);
a(strip_asm_tac(z_∀_elimⓩ(a ≜ a, b ≜ b)⌝ z_size_∪_thm));
a(strip_asm_tac(z_∀_elimⓩ(a ≜ a, b ≜ b)⌝ z_𝔽_∩_thm));
a(strip_asm_tac(z_∀_elimⓩ(a ≜ a ∩ b)⌝ z_size_ℕ_thm));
a(lemma_tacⓩ# (a ∪ b) + # (a ∩ b) ≤ (# a + # b) + # (a ∩ b)⌝);
a(pure_asm_rewrite_tac[z_plus_assoc_thm]);
a(asm_rewrite_tac[]);
save_pop_thm"z_size_∪_≤_thm"
);
=TEX
=SML
val ⦏z_size_eq_thm⦎ = (
set_goal([], ⓩ∀a, b:(𝔽_) | a ⊆ b ∧ #a = #b ⦁ a = b⌝);
a(PC_T "z_sets_ext" contr_tac
	THEN1 all_asm_fc_tac[]);
a(lemma_tacⓩa ⊆ a ∪ {x1} ∧ a ∪ {x1} ⊆ b⌝ THEN1
	PC_T1 "z_sets_ext" asm_prove_tac[]);
a(strip_asm_tac (z_∀_elimⓩ(x ≜ x1, a ≜ a)⌝ z_size_∪_singleton_thm));
a(strip_asm_tac (z_∀_elimⓩ(x ≜ x1, a ≜ a)⌝ (z_gen_pred_elim[ⓩ𝕌⌝] z_𝔽_∪_singleton_thm)));
a(strip_asm_tac (z_∀_elimⓩ(a ≜ b, b ≜ a ∪ {x1})⌝ z_size_mono_thm));
a(PC_T1 "z_lin_arith" asm_prove_tac[]);
save_pop_thm"z_size_eq_thm"
);
=TEX
=SML
val ⦏z_size_0_thm⦎ = (
set_goal([], ⓩ∀a : (𝔽_) ⦁ # a = 0 ⇔ a = {}⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(POP_ASM_T ante_tac THEN z_𝔽_induction_tac ⓩa⌝
	THEN_TRY asm_rewrite_tac[z_size_singleton_thm]);
a(all_fc_tac[z_size_ℕ_thm, z_size_∪_singleton_thm]);
a(asm_rewrite_tac[]);
a(contr_tac);
a(LEMMA_Tⓩ# a +  (1 + ~ 1) = ~1⌝ (strip_asm_tac o rewrite_rule[])
	THEN1 asm_rewrite_tac[z_plus_assoc_thm1]);
a(swap_nth_asm_concl_tac 4 THEN asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[z_size_empty_thm]);
save_pop_thm"z_size_0_thm"
);
=TEX
=SML
val ⦏z_size_1_thm⦎ = (
set_goal([], ⓩ∀a : (𝔽_) ⦁ # a = 1 ⇔ (∃x:𝕌⦁ a = {x})⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(lemma_tacⓩ¬ #a = 0⌝ THEN1 asm_rewrite_tac[]);
a(strip_asm_tac(z_∀_elimⓩa⌝ z_size_0_thm));
a(PC_T1 "z_sets_ext" POP_ASM_T strip_asm_tac);
a(lemma_tacⓩ x1 ∈ a ⇒ (a \ {x1}) ∪ {x1} = a⌝ THEN1 PC_T1 "z_sets_ext" prove_tac[]);
a(strip_asm_tac(z_∀_elimⓩ(a≜a, b  ≜ {x1})⌝ z_𝔽_diff_thm));
a(ante_tac (z_∀_elimⓩ(a≜ a \ {x1}, x≜ x1)⌝z_size_∪_singleton_thm)
	THEN asm_rewrite_tac[]);
a(ante_tac(z_∀_elimⓩ(a≜ a \ {x1})⌝z_size_0_thm) THEN asm_rewrite_tac[]);
a(STRIP_T rewrite_thm_tac);
a(REPEAT strip_tac);
a(z_∃_tacⓩx1⌝ THEN rewrite_tac[]);
a(POP_ASM_T ante_tac THEN PC_T1 "z_sets_ext" prove_tac[]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[z_size_singleton_thm]);
save_pop_thm"z_size_1_thm"
);
=TEX
=SML
val ⦏z_size_pair_thm⦎ = (
set_goal([], ⓩ∀x, y:𝕌 | ¬x = y ⦁ {x, y} ∈ (𝔽_) ∧ #{x, y} = 2⌝);
a(z_∀_tac THEN strip_tac);
a(lemma_tacⓩ{y} ∈ (𝔽_) ∧ #{y} = 1⌝ THEN1 rewrite_tac[z_size_singleton_thm]);
a(ante_tac (z_∀_elimⓩ(x ≜ x, a ≜ {y})⌝ z_size_∪_singleton_thm));
a(ante_tac (z_∀_elimⓩ(x ≜ x, a ≜ {y})⌝  (z_gen_pred_elim[ⓩ𝕌⌝] z_𝔽_∪_singleton_thm)));
a(asm_rewrite_tac[z_size_singleton_thm]);
a(LEMMA_T ⓩ{x, y} = {y} ∪ {x}⌝ rewrite_thm_tac
	THEN PC_T1 "z_sets_ext" prove_tac[]);
save_pop_thm"z_size_pair_thm"
);
=TEX
=SML
val ⦏z_size_2_thm⦎ = (
set_goal([], ⓩ∀a:(𝔽_) ⦁ #a = 2 ⇔ (∃x, y:𝕌⦁¬x = y ∧ a = {x, y})⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(PC_T1 "z_sets_ext" lemma_tac ⓩ¬a = {}⌝
	THEN1 (swap_nth_asm_concl_tac 1 THEN asm_rewrite_tac[z_size_empty_thm]));
a(PC_T1 "z_sets_ext" lemma_tac ⓩ¬a = {x1}⌝
	THEN1 (swap_nth_asm_concl_tac 2 THEN asm_rewrite_tac[z_size_singleton_thm])
	THEN_TRY all_var_elim_asm_tac1);
a(lemma_tacⓩ{x2, x1} ∈ (𝔽_) ∧ #{x2, x1} = 2⌝ THEN1
	ALL_FC_T rewrite_tac[z_size_pair_thm]);
a(LEMMA_Tⓩ{x2, x1} ⊆ a⌝ asm_tac THEN1
	PC_T1 "z_sets_ext" asm_prove_tac[]);
a(ante_tac (z_∀_elimⓩ(a ≜ {x2, x1}, b ≜ a)⌝ z_size_eq_thm));
a(asm_rewrite_tac[] THEN REPEAT strip_tac);
a(z_∃_tacⓩ(x ≜ x2, y ≜ x1)⌝ THEN asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(ALL_FC_T asm_rewrite_tac[z_size_pair_thm]);
save_pop_thm"z_size_2_thm"
);
=TEX
=SML
val ⦏z_size_×_thm⦎ = (
set_goal([], ⓩ∀a : (𝔽_); b:(𝔽_) ⦁ a × b ∈ (𝔽_) ∧ #(a × b) = #a * #b⌝);
a(z_∀_tac THEN strip_tac);
a(z_𝔽_induction_tacⓩa⌝);
(* *** Goal "1" *** *)
a(rewrite_tac[z_size_empty_thm]);
(* *** Goal "2" *** *)
a(rewrite_tac[
	pc_rule1 "z_rel_ext"
		prove_rule[] ⓩ(a ∪ {x}) × b = (a × b) ∪ ({x} × b)⌝]);
a(lemma_tacⓩ(a × b) ∩ ({x} × b) = {}⌝ THEN1
	PC_T1 "z_sets_ext" asm_prove_tac[]);
a(lemma_tacⓩ({x} × b) ∈ (𝔽_) ∧ #({x} × b) = #b⌝);
(* *** Goal "2.1" *** *)
a(LIST_DROP_NTH_ASM_T [1, 2, 3, 4, 5] discard_tac);
a(z_𝔽_induction_tacⓩb⌝
	THEN1 rewrite_tac[z_size_empty_thm]);
a(rewrite_tac[
	pc_rule1 "z_rel_ext"
		prove_rule[] ⓩ{x} × (b ∪ {x'}) = ({x} × b) ∪ {(x, x')}⌝]);
a(LEMMA_Tⓩ¬(x, x') ∈ ({x} × b)⌝ asm_tac THEN1
	PC_T1 "z_sets_ext" asm_prove_tac[]);
a(ante_tac (z_∀_elimⓩ(x ≜ (x, x'), a ≜ {x} × b)⌝ z_size_∪_singleton_thm));
a(ante_tac (z_∀_elimⓩ(x ≜ x', a ≜ b)⌝ z_size_∪_singleton_thm));
a(ante_tac (z_∀_elimⓩ(x ≜ (x, x'), a ≜ {x} × b)⌝ (z_gen_pred_elim[ⓩ𝕌⌝] z_𝔽_∪_singleton_thm)));
a(REPEAT strip_tac THEN asm_rewrite_tac[]);
(* *** Goal "2.2" *** *)
a(ante_tac (z_∀_elimⓩ(a ≜ a × b, b ≜ {x} × b)⌝ z_size_∪_thm));
a(asm_rewrite_tac[z_size_empty_thm]);
a(REPEAT strip_tac THEN asm_rewrite_tac[]);
a(ALL_FC_T rewrite_tac[z_size_∪_singleton_thm]);
a(PC_T1 "z_lin_arith" prove_tac[]);
save_pop_thm"z_size_×_thm"
);
=TEX
=SML
val ⦏z_size_≤_1_thm⦎ = (
set_goal([], ⓩ∀a : (𝔽_) | # a ≤ 1 ⦁ a = {} ∨ (∃x:𝕌⦁a = {x})⌝);
a(REPEAT strip_tac);
a(all_fc_tac[z_size_ℕ_thm]);
a(fc_tac[z_size_0_thm]);
a(ante_tac (z_∀_elimⓩ(i≜ 0, j≜ #a)⌝z_≤_≤_plus1_thm) THEN asm_rewrite_tac[]);
a(ante_tac(z_∀_elimⓩ(a≜ a)⌝z_size_1_thm) THEN asm_rewrite_tac[]);
a(STRIP_T rewrite_thm_tac);
save_pop_thm"z_size_≤_1_thm"
);
=TEX
The following is a more general result for ranges of numbers:
=SML
val _ = set_merge_pcs["'z_numbers", "z_sets_alg"];
=TEX
=SML
val ⦏z_size_dot_dot_thm1⦎ = (
set_goal([], ⓩ∀i,j : ℤ ⦁ i .. j ∈ (𝔽_) ∧
		(i ≤ j ⇒ # (i .. j) = (j + ~ i) + 1) ∧
		(j < i ⇒ # (i .. j) = 0)⌝);
a(z_∀_tac THEN strip_tac);
a(cases_tac ⓩj < i⌝ THEN POP_ASM_T strip_asm_tac);
(* *** Goal "1" *** *)
a(PC_T1 "z_sets_alg" strip_asm_tac (z_∀_elim ⓩ(i ≜ i, j ≜ j)⌝ z_¬_≤_thm));
a(PC_T1 "z_sets_alg" asm_rewrite_tac[]);
a(ante_tac (rewrite_rule[](z_∀_elim ⓩ(i ≜ 0, i1 ≜ i, i2 ≜ j, j1 ≜ i, j2 ≜ j)⌝
	 z_dot_dot_clauses)));

a(asm_rewrite_tac[]);
a(⇒_T rewrite_thm_tac);
a(rewrite_tac[z_size_empty_thm]);

(* *** Goal "2" *** *)
a(PC_T1 "z_sets_alg" strip_asm_tac (z_∀_elim ⓩ(i ≜ j, j ≜ i)⌝ z_¬_less_thm));
a(PC_T1 "z_sets_alg" asm_rewrite_tac[]);

a(strip_asm_tac (z_∀_elim ⓩ(A ≜ i .. j,
		f ≜ {n : 1 .. ((j + ~ i) + 1) ⦁ (n, n + (i - 1))},
		n ≜ ((j + ~ i) + 1))⌝ z_𝔽_size_thm));

(* *** Goal "2.1" *** *)
a(PC_T1 "z_sets_alg" strip_asm_tac
	(z_∀_elim ⓩ(i ≜ 0, j ≜ (j + ~ i) + 1)⌝ z_¬_≤_thm));
a(ante_tac(z_∀_elim ⓩ(i ≜ i, j ≜ j)⌝ z_≤_≤_0_thm));
a(asm_rewrite_tac[]);
a(strip_tac);
a(PC_T1 "z_sets_alg" lemma_tac ⓩ(i + ~ j) + (j + ~ i) ≤ 0 + (j + ~ i)⌝);
(* *** Goal "2.1.1" *** *)
a(PC_T1 "z_sets_alg" asm_rewrite_tac [z_≤_clauses]);
(* *** Goal "2.1.2" *** *)
a(POP_ASM_T (asm_tac o pure_rewrite_rule[(z_∀_elim ⓩ~ j⌝ z_plus_order_thm)]));
a(POP_ASM_T (asm_tac o rewrite_rule[(z_∀_elim ⓩj⌝ z_plus_order_thm)]));
a(ante_tac(rewrite_rule[]
	(z_∀_elim ⓩ(i ≜ 0, j ≜ (j + ~ i), k ≜ (j + ~ i) + 1)⌝ z_≤_trans_thm)));
a(PC_T "z_sets_alg" (REPEAT strip_tac));

(* *** Goal "2.2" *** *)
a(SWAP_NTH_ASM_CONCL_T 1 discard_tac);
a(rewrite_tac[]);
a(MERGE_PCS_T ["'z_numbers", "z_fun_ext"] (REPEAT strip_tac));
(* *** Goal "2.2.1" *** *)
a(POP_ASM_T (rewrite_thm_tac o eq_sym_rule));
a(rewrite_tac[z_∀_elim ⓩi⌝ z_plus_order_thm]);
a(PC_T1 "z_sets_alg" lemma_tac ⓩ1 + ~ 1 ≤ x1 + ~1⌝);
(* *** Goal "2.2.1.1" *** *)
a(asm_rewrite_tac[]);
(* *** Goal "2.2.1.2" *** *)
a(POP_ASM_T (rewrite_thm_tac o pure_rewrite_rule [z_plus_minus_thm]));

(* *** Goal "2.2.2" *** *)
a(POP_ASM_T (rewrite_thm_tac o eq_sym_rule));
a(PC_T1 "z_sets_alg" lemma_tac ⓩx1 + (i + ~ 1) ≤ ((j + ~ i) + 1) + (i + ~1)⌝);
(* *** Goal "2.2.2.1" *** *)
a(asm_rewrite_tac[]);
(* *** Goal "2.2.2.2" *** *)
a(POP_ASM_T ante_tac);
a(PC_T1 "z_sets_alg" rewrite_tac[ z_plus_assoc_thm]);
a(PC_T1 "z_sets_alg" rewrite_tac[ z_∀_elim ⓩi⌝ z_plus_order_thm,
	 z_plus_minus_thm, z_plus_clauses]);

(* *** Goal "2.2.3" *** *)
a(POP_ASM_T (rewrite_thm_tac o eq_sym_rule));
a(POP_ASM_T (rewrite_thm_tac o eq_sym_rule));

(* *** Goal "2.2.4" *** *)
a(z_∃_tac ⓩx1 + (i + ~ 1)⌝);
a(asm_rewrite_tac[]);

(* *** Goal "2.2.7" (2.2.5 and 2.2.6 were duplicates) *** *)
a(z_∃_tac ⓩx1 - ( i + ~ 1 )⌝);
a(asm_rewrite_tac[z_minus_thm]);
a(asm_rewrite_tac[z_∀_elim ⓩj⌝ z_plus_order_thm]);
a(asm_rewrite_tac[z_∀_elim ⓩx1⌝ z_plus_order_thm]);
a(asm_rewrite_tac[z_∀_elim ⓩi⌝ z_plus_order_thm]);
a(asm_rewrite_tac[z_∀_elim ⓩ~ i⌝ z_plus_order_thm]);
a(asm_rewrite_tac[z_∀_elim ⓩ1⌝ z_plus_order_thm]);
a(PC_T1 "z_sets_alg" lemma_tac ⓩ(~i) + i ≤ (~ i) + x1⌝);
(* *** Goal "2.2.7.1" *** *)
a(asm_rewrite_tac[]);
(* *** Goal "2.2.7.2" *** *)
a(POP_ASM_T (rewrite_thm_tac o pure_rewrite_rule[z_minus_clauses]));

(* *** Goal "2.2.8" *** *)
a(DROP_NTH_ASM_T 5 discard_tac);
a(DROP_NTH_ASM_T 2 discard_tac);
a(ante_tac (rewrite_rule[](z_∀_elim ⓩ(a ≜ x1, f ≜ {n : 1 .. (j + ~ i) + 1 ⦁
	(n, n + (i + ~ 1))}, x ≜ x1 + (i + ~ 1))⌝ z_app_thm)));
a(ante_tac (rewrite_rule[](z_∀_elim ⓩ(a ≜ x2, f ≜ {n : 1 .. (j + ~ i) + 1 ⦁
	(n, n + (i + ~ 1))}, x ≜ x2 + (i + ~ 1))⌝ z_app_thm)));
a(asm_rewrite_tac[]);
a(strip_tac);
(* *** Goal "2.2.8.1" *** *)
a(GET_NTH_ASM_T 2 (strip_asm_tac o eq_sym_rule));

(* *** Goal "2.2.8.2" *** *)
a(POP_ASM_T rewrite_thm_tac);
a(strip_tac);
(* *** Goal "2.2.8.2.1" *** *)
a(GET_NTH_ASM_T 2 (strip_asm_tac o eq_sym_rule));
a(asm_rewrite_tac[]);

(* *** Goal "2.3" *** *)
a(asm_rewrite_tac[]);

save_pop_thm"z_size_dot_dot_thm1"
);
=TEX

\subsection{The Pigeon-Hole Principle}

It is a little more natural to prove the pigeon hole theorem in the
following guise first: if $u$ is a family of sets each of which has
at most $1$ element, then the union of the sets in $u$ has no more elements
than $u$.
=SML
val z_pigeon_hole_thm1 = (
set_goal([], ⓩ∀u : 𝔽 (𝔽_) | (∀a:u⦁ #a ≤ 1) ⦁ # (⋃u) ≤ # u⌝);
a(REPEAT strip_tac);
a(POP_ASM_T ante_tac THEN z_𝔽_induction_tac ⓩu⌝);
(* *** Goal "1" *** *)
a(rewrite_tac[z_size_empty_thm]);
(* *** Goal "2" *** *)
a(REPEAT strip_tac);
a(z_spec_nth_asm_tac 1 ⓩu'⌝);
a(all_fc_tac[z_≤_less_trans_thm]);
(* *** Goal "3" *** *)
a(REPEAT strip_tac);
a(z_spec_nth_asm_tac 1 ⓩx⌝);
a(LEMMA_T ⓩ⋃ (u ∪ {x}) = ⋃ u ∪ x⌝ asm_rewrite_thm_tac);
(* *** Goal "3.1" *** *)
a(DROP_ASMS_T discard_tac THEN PC_T1 "z_sets_ext" prove_tac[]);
a(z_∃_tacⓩx⌝ THEN REPEAT strip_tac);
(* *** Goal "3.2" *** *)
a(GET_ASM_T ⓩu ∈ 𝔽 (𝔽 _)⌝ (strip_asm_tac o once_rewrite_rule[z_𝔽_ℙ_thm]));
a(ALL_FC_T rewrite_tac[z_size_∪_singleton_thm]);
a(lemma_tacⓩ# (⋃ u ∪ x) ≤ #(⋃ u) + #x⌝);
(* *** Goal "3.2.1" *** *)
a(all_fc_tac[z_⋃_𝔽_thm]);
a(strip_asm_tac(z_∀_elimⓩ(a ≜ ⋃ u, b ≜ x)⌝ z_size_∪_≤_thm));
(* *** Goal "3.2.2" *** *)
a(PC_T1 "z_predicates"
	strip_asm_tac(rewrite_rule[]
		(z_∀_elimⓩ(i ≜ # (⋃ u ∪ x), j ≜ # (⋃ u) + # x, k ≜ # (⋃ u) + 1)⌝
			z_≤_trans_thm)));
a(PC_T1 "z_predicates"
	strip_asm_tac(rewrite_rule[]
		(z_∀_elimⓩ(i ≜ # (⋃ u ∪ x), j ≜ # (⋃ u) + 1, k ≜ # u + 1)⌝
			z_≤_trans_thm)));
pop_thm()
);
=TEX
Finally, as a simple consequence of the last theorem, we can readily
derive the pigeon hole principle in a more standard formulation: if $u$
is a family of sets, whose union contains more elements than $u$ itself,
then some set in $u$ contains more than one element.
=SML
val z_pigeon_hole_thm = (
set_goal([], ⓩ∀u : 𝔽 (𝔽_) | # (⋃u) > # u ⦁ ∃a:u⦁ #a > 1⌝);
a(contr_tac);
a(POP_ASM_T (strip_asm_tac o rewrite_rule[]));
a(all_fc_tac[z_pigeon_hole_thm1]);
a(all_fc_tac[z_less_≤_trans_thm]);
save_pop_thm"z_pigeon_hole_thm"
);
=TEX
\subsection{More on Arithmetic}
=SML
val ⦏z_div_thm⦎ = (
set_goal([],ⓩ∀ i,j,k : ℤ | ¬j = 0 ⦁ (i div j = k) ⇔
	(∃ m : ℤ ⦁ i = k * j + m ∧ 0 ≤ m ∧ m < abs j)⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(z_∃_tacⓩi mod j⌝);
a(ante_tac (z_∀_elim
	ⓩ(i ≜ i,j ≜ j,d ≜ k ,r ≜ i mod j)⌝ z_div_mod_unique_thm));
a(asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(ante_tac (z_∀_elim
	ⓩ(i ≜ i,j ≜ j,d ≜ k ,r ≜ m)⌝ z_div_mod_unique_thm));
a(asm_rewrite_tac[]);
a ⇒_tac;
a(DROP_NTH_ASM_T 2 (rewrite_thm_tac o eq_sym_rule));
save_pop_thm"z_div_thm"
);
=TEX
=SML
val ⦏z_mod_thm⦎ = (
set_goal([],ⓩ∀ i,j,k : ℤ | ¬j = 0 ⦁ (i mod j = k) ⇔
	(∃ d : ℤ ⦁ i = d * j + k ∧ 0 ≤ k ∧ k < abs j)⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(z_∃_tacⓩi div j⌝);
a(ante_tac (z_∀_elim
	ⓩ(i ≜ i,j ≜ j,d ≜ i div j ,r ≜ k)⌝ z_div_mod_unique_thm));
a(asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(ante_tac (z_∀_elim
	ⓩ(i ≜ i,j ≜ j,d ≜ d ,r ≜ k)⌝ z_div_mod_unique_thm));
a(asm_rewrite_tac[]);
a ⇒_tac;
a(POP_ASM_T (rewrite_thm_tac o eq_sym_rule));
save_pop_thm"z_mod_thm"
);
=TEX
=SML
val ⦏z_abs_pos_thm⦎ = (
set_goal([],ⓩ∀ i:ℤ| 0 < i ⦁ abs i = i ∧ abs ~ i = i⌝);
a(z_∀_tac THEN ⇒_T strip_asm_tac);
a(lemma_tacⓩ0 ≤ i⌝THEN1 PC_T1"z_lin_arith"asm_prove_tac[]);
a(ALL_ASM_FC_T rewrite_tac[z_abs_thm]);
save_pop_thm"z_abs_pos_thm"
);
=TEX
=SML
val ⦏z_abs_neg_thm⦎ = (
set_goal([],ⓩ∀ i:ℤ| i < 0 ⦁ abs i = ~i ∧ abs ~ i = ~i⌝);
a(z_∀_tac THEN ⇒_T strip_asm_tac);
a(strip_asm_tac (z_∀_elim⌜i⌝z_ℤ_cases_thm)
	THEN1 PC_T1"z_lin_arith"asm_prove_tac[]);
a(all_var_elim_asm_tac1);
a(ALL_ASM_FC_T rewrite_tac[z_abs_thm]);
save_pop_thm"z_abs_neg_thm"
);
=TEX
=SML
val ⦏z_abs_≤_times_thm⦎ = (
set_goal([],ⓩ∀ i,j:ℤ| ¬ i = 0 ∧ ¬ j = 0 ⦁ abs j ≤ abs (i * j)⌝);
a(REPEAT strip_tac);
a(rewrite_tac[z_abs_times_thm]);
a(strip_asm_tac (z_∀_elim⌜j⌝z_ℤ_cases_thm) THEN all_var_elim_asm_tac1
	THEN all_asm_fc_tac[z_abs_thm]THEN asm_rewrite_tac[]);
(* *** Goal "1" *** *)
a(DROP_NTH_ASM_T 4 asm_tac);
set_labelled_goal"2";
(* *** Goal "2" *** *)
a(LEMMA_Tⓩ¬ ~ j' = 0 ⇒ ¬  j' = 0 ⌝ante_tac
	THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(DROP_NTH_ASM_T 4 rewrite_thm_tac);
a(⇒_tac);
a(strip_asm_tac (z_∀_elim⌜i⌝z_ℤ_cases_thm) THEN all_var_elim_asm_tac1
	THEN all_asm_fc_tac[z_abs_thm]THEN asm_rewrite_tac[]);
(* *** Goal "2.1" *** *)
a(DROP_NTH_ASM_T 8 asm_tac);
set_labelled_goal"2.2";
(* *** Goal "2.2" *** *)
a(LEMMA_Tⓩ¬ ~ j = 0 ⇒ ¬  j = 0 ⌝ante_tac
	THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(DROP_NTH_ASM_T 8 rewrite_thm_tac);
a(⇒_tac);
a(LIST_DROP_NTH_ASM_T[2,3,6,7](MAP_EVERY discard_tac));
a(lemma_tacⓩ1 ≤ j' ∧ 1 ≤ j⌝THEN1 PC_T1"z_lin_arith"asm_prove_tac[]);
a(LIST_DROP_NTH_ASM_T[3,4,5,6](MAP_EVERY discard_tac));
a(z_≤_induction_tacⓩj⌝ THEN_TRY asm_rewrite_tac[]);
a(PC_T1"z_lin_arith"asm_prove_tac[]);
save_pop_thm"z_abs_≤_times_thm"
);
=TEX
=SML
val ⦏z_abs_0_less_thm⦎ = (
set_goal([],ⓩ∀ i:ℤ| ¬ i = 0 ⦁ 0 < abs i⌝);
a(REPEAT strip_tac);
a(strip_asm_tac (z_∀_elim⌜i⌝z_ℤ_cases_thm) THEN all_var_elim_asm_tac1);
(* *** Goal "1" *** *)
a(LEMMA_T ⓩ0 < j⌝asm_tac THEN1 PC_T1"z_lin_arith"asm_prove_tac[]
	THEN ALL_ASM_FC_T asm_rewrite_tac[z_abs_pos_thm]);
(* *** Goal "2" *** *)
a(LEMMA_T ⓩ0 < j⌝asm_tac THEN1 PC_T1"z_lin_arith"asm_prove_tac[]
	THEN ALL_ASM_FC_T asm_rewrite_tac[z_abs_pos_thm]);
save_pop_thm"z_abs_0_less_thm"
);
=TEX
=SML
val ⦏z_0_less_times_thm⦎ = (
set_goal([],ⓩ∀ i,j : ℤ ⦁ 0 < i * j ⇔ (0 < i ∧ 0 < j) ∨ (i < 0 ∧ j < 0)⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(POP_ASM_T (strip_asm_tac o rewrite_rule[z_≤_less_eq_thm]));
a(all_var_elim_asm_tac1);
a(asm_prove_tac[]);
(* *** Goal "2" *** *)
a(swap_nth_asm_concl_tac 1);
a(DROP_NTH_ASM_T 2 ante_tac);
a(z_≤_induction_tacⓩj⌝THEN_TRY asm_rewrite_tac[]);
a(PC_T1"z_lin_arith"asm_prove_tac[]);
(* *** Goal "3" *** *)
a(swap_nth_asm_concl_tac 1);
a(DROP_NTH_ASM_T 2 ante_tac);
a(z_≤_induction_tacⓩi⌝THEN_TRY asm_rewrite_tac[]);
a(PC_T1"z_lin_arith"asm_prove_tac[]);
(* *** Goal "4" *** *)
a(POP_ASM_T (strip_asm_tac o rewrite_rule[z_≤_less_eq_thm]));
a(all_var_elim_asm_tac1);
a(asm_prove_tac[]);
(* *** Goal "5" *** *)
a(LEMMA_Tⓩ0 < i ⇒ 1 ≤ i⌝ante_tac THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(DROP_NTH_ASM_T 2 rewrite_thm_tac THEN ⇒_tac);
a(z_≤_induction_tacⓩi⌝THEN_TRY asm_rewrite_tac[]);
a(PC_T1"z_lin_arith"asm_prove_tac[]);
(* *** Goal "6" *** *)
a(LEMMA_Tⓩ¬ i = 0 ∧ ¬ j = 0⌝ strip_asm_tac
	THEN1 PC_T1"z_lin_arith"asm_prove_tac[]);
a(strip_asm_tac (z_∀_elim⌜i⌝z_ℤ_cases_thm) THEN all_var_elim_asm_tac1
	THEN1 PC_T1"z_lin_arith"asm_prove_tac[]);
a(DROP_NTH_ASM_T 5 discard_tac);
a(LEMMA_Tⓩ¬ j' = 0⌝ ante_tac THEN1 PC_T1"z_lin_arith"asm_prove_tac[]);
a(DROP_NTH_ASM_T 3 discard_tac);
a(z_≤_induction_tacⓩj'⌝THEN_TRY asm_rewrite_tac[] THEN
	 PC_T1"z_lin_arith"asm_prove_tac[]);
save_pop_thm"z_0_less_times_thm"
);
=TEX
=SML
val ⦏z_times_less_0_thm⦎ = (
set_goal([],ⓩ∀ i,j : ℤ  ⦁ i * j < 0 ⇔ (0 < i ∧ j < 0) ∨ (i < 0 ∧ 0 < j)⌝);
a(z_∀_tac THEN ⇒_T strip_asm_tac);
a(ante_tac (z_∀_elimⓩ(i  ≜ ~i ,j ≜ j)⌝z_0_less_times_thm));
a(asm_rewrite_tac[z_minus_times_thm]);
a(LEMMA_Tⓩ∀x:ℤ⦁ (0 < ~x ⇔ x < 0) ∧ (~x < 0 ⇔ 0 < x)⌝rewrite_thm_tac
	THEN1 PC_T1"z_lin_arith"prove_tac[]);
a(taut_tac);
save_pop_thm"z_times_less_0_thm"
);
=TEX
\subsection{Material on succ}
=SML
val _ = set_merge_pcs ["'z_numbers1", "z_sets_alg", "'z_rel_alg"];
val ⦏z_∈_succ_thm⦎ =  (
	set_goal([], ⌜∀ i j ⦁
	ⓩ(i, j) ∈ succ ⇔ (0 ≤ i) ∧ (j = i + 1)⌝⌝);
	a(strip_tac THEN strip_tac);
	a(ante_tac (∀_intro ⓩz⌝ (z_∀_elim ⓩ(f ≜  succ, x ≜  i, z ≜  i + 1)⌝
		(rewrite_rule[](z_∀_elim ⓩ(X ≜ ℕ, Y ≜ ℕ)⌝
		 z_→_app_eq_⇔_∈_rel_thm)))));
	a(strip_asm_tac (z_get_spec ⓩsucc⌝));
	a(asm_rewrite_tac[]);
	a(CASES_T ⓩ0 ≤ i⌝ asm_tac THEN asm_rewrite_tac[]);
	(* *** Goal "1" *** *)
	a(GET_NTH_ASM_T 2 ( strip_asm_tac o
		 rewrite_rule[] o z_∀_elim ⓩi⌝));
	a(asm_rewrite_tac[]);
	a(REPEAT strip_tac);
(* *** Goal "1.1" *** *)
	a(GET_NTH_ASM_T 6 (PC_T1 "z_fun_ext" strip_asm_tac));
	a(GET_NTH_ASM_T 2 (ante_tac o z_∀_elim ⓩ(x ≜ i, y1 ≜ j, y2 ≜ i + 1)⌝));
	a(asm_rewrite_tac[]);
	a(GET_NTH_ASM_T 3 (fn t => fc_tac[t]));
	a(PC_T1 "z_sets_alg" REPEAT strip_tac);
(* *** Goal "1.2" *** *)
	a(var_elim_asm_tac ⓩj = i + 1⌝);
(* *** Goal "2" *** *)
	a(GET_NTH_ASM_T 3 (PC_T1 "z_fun_ext" strip_asm_tac));
	a(GET_NTH_ASM_T 3 (strip_asm_tac o z_∀_elim ⓩ(x1 ≜ i, x2 ≜ j)⌝));
	save_pop_thm "z_∈_succ_thm"
	);
=TEX
=SML
val _ = set_merge_pcs ["'z_numbers1", "z_sets_alg", "'z_rel_alg"];
val ⦏z_succ↗0↕_thm⦎ = (
set_goal ([], ⓩsucc ↗ 0 ↕  = id ℤ⌝);
a(pure_rewrite_tac[ (z_∀_elim ⓩ(r ≜ succ, k ≜ 0)⌝ (∧_right_elim
	(z_gen_pred_elim [ⓩ𝕌⌝] (z_get_spec ⓩ(_↗_↕)⌝))))]);
a(pure_rewrite_tac[z_gen_pred_elim[ⓩ𝕌⌝](z_get_spec ⓩiter⌝)]);
a(MERGE_PCS_T1 ["z_fun_ext", "'z_numbers1"] REPEAT strip_tac);
save_pop_thm "z_succ↗0↕_thm");
=TEX
=SML
val _ = set_merge_pcs ["'z_numbers1", "z_sets_alg", "'z_rel_alg"];
val ⦏z_succ↗n↕_thm⦎ = (
set_goal ([], ⓩ∀ n : ℤ | 1 ≤ n ⦁ succ ↗ n ↕  = {m : ℕ ⦁ (m ↦ m + n)}⌝);
a(z_∀_tac THEN strip_tac);
a(pure_rewrite_tac[ (z_∀_elim ⓩ(r ≜ succ, k ≜ n)⌝ (∧_right_elim
	(z_gen_pred_elim [ⓩ𝕌⌝] (z_get_spec ⓩ(_↗_↕)⌝))))]);
a(z_≤_induction_tac ⓩn⌝);
(* *** Goal "1" *** *)
a(strip_asm_tac (z_∀_elim ⓩsucc⌝ (
	∧_right_elim(z_gen_pred_elim[ⓩ𝕌⌝](z_get_spec ⓩiter⌝)))));
a(DROP_NTH_ASM_T 2 (rewrite_thm_tac o rewrite_rule [] o z_∀_elim ⓩ0⌝));
a(MERGE_PCS_T1 ["z_fun_ext", "'z_numbers1"] asm_rewrite_tac[z_∈_succ_thm]);
a(REPEAT strip_tac);
(* *** Goal "1.1" *** *)
a(all_var_elim_asm_tac1);
a(z_∃_tac ⓩx1⌝ THEN REPEAT strip_tac);
(* *** Goal "1.2" *** *)
a(all_var_elim_asm_tac1);
a(z_∃_tac ⓩx1 + 1⌝ THEN REPEAT strip_tac);
(* *** Goal "2" *** *)
a(strip_asm_tac (z_∀_elim ⓩsucc⌝ (
	∧_right_elim(z_gen_pred_elim[ⓩ𝕌⌝](z_get_spec ⓩiter⌝)))));
a(DROP_NTH_ASM_T 2 (strip_asm_tac o z_∀_elim ⓩi⌝));
(* *** Goal "2.1" *** *)
a(PC_T1 "z_lin_arith" asm_prove_tac[]);
(* *** Goal "2.2" *** *)
a(MERGE_PCS_T1 ["z_fun_ext", "'z_numbers1"] asm_rewrite_tac[]);
a(REPEAT strip_tac);
(* *** Goal "2.2.1" *** *)
a(all_var_elim_asm_tac1);
a(z_∃_tac ⓩx1⌝ THEN REPEAT strip_tac);
(* *** Goal "2.2.1.1" *** *)
a(DROP_NTH_ASM_T 2 (strip_asm_tac o rewrite_rule[z_∈_succ_thm]));
(* *** Goal "2.2.1.2" *** *)
a(DROP_NTH_ASM_T 2 (strip_asm_tac o rewrite_rule[z_∈_succ_thm]));
a(all_var_elim_asm_tac1);
a(PC_T1 "z_lin_arith" prove_tac []);
(* *** Goal "2.2.2" *** *)
a(all_var_elim_asm_tac1);
a(z_∃_tac ⓩx1 + 1⌝ THEN rewrite_tac [z_∈_succ_thm] THEN REPEAT strip_tac);
a(z_∃_tac ⓩx1 + 1⌝ THEN REPEAT strip_tac);
(* *** Goal "2.2.2.1" *** *)
a(PC_T1 "z_lin_arith" asm_prove_tac []);
(* *** Goal "2.2.2.2" *** *)
a(PC_T1 "z_lin_arith" prove_tac []);
save_pop_thm "z_succ↗n↕_thm"
);
=TEX
=SML
val _ = set_merge_pcs ["'z_numbers1", "z_sets_alg", "'z_rel_alg"];
val ⦏z_succ↗minus_n↕_thm⦎ = (
set_goal ([], ⓩ∀ n : ℕ | 1 ≤ n ⦁ succ ↗ ~ n ↕  = {m : ℕ  ⦁ (m + n ↦ m)}⌝);
a(z_∀_tac THEN strip_tac);
a(pure_rewrite_tac[ (z_∀_elim ⓩ(r ≜ succ, k ≜ ~ n)⌝ (∧_right_elim
	(z_gen_pred_elim [ⓩ𝕌⌝] (z_get_spec ⓩ(_↗_↕)⌝))))]);
a(DROP_NTH_ASM_T 2 (fn x => id_tac));
a(z_≤_induction_tac ⓩn⌝);
(* *** Goal "1" *** *)
a(strip_asm_tac (z_∀_elim ⓩsucc⌝ (
	∧_right_elim(z_gen_pred_elim[ⓩ𝕌⌝](z_get_spec ⓩiter⌝)))));
a(DROP_NTH_ASM_T 1 (rewrite_thm_tac o rewrite_rule [] o z_∀_elim ⓩ1⌝));
a(strip_asm_tac (z_∀_elim ⓩsucc ↗~↕⌝ (
	∧_right_elim(z_gen_pred_elim[ⓩ𝕌⌝](z_get_spec ⓩiter⌝)))));
a(DROP_NTH_ASM_T 2 (rewrite_thm_tac o rewrite_rule [] o z_∀_elim ⓩ0⌝));
a(MERGE_PCS_T1 ["z_fun_ext", "'z_numbers1"] asm_rewrite_tac[z_∈_succ_thm]);
a(REPEAT strip_tac);
(* *** Goal "1.1" *** *)
a(all_var_elim_asm_tac1);
a(z_∃_tac ⓩx2⌝ THEN REPEAT strip_tac);
(* *** Goal "1.2" *** *)
a(all_var_elim_asm_tac1);
a(z_∃_tac ⓩx2⌝ THEN REPEAT strip_tac);
(* *** Goal "2" *** *)
a(strip_asm_tac (z_∀_elim ⓩsucc⌝ (
	∧_right_elim(z_gen_pred_elim[ⓩ𝕌⌝](z_get_spec ⓩiter⌝)))));
a(GET_NTH_ASM_T 1 (strip_asm_tac o z_∀_elim ⓩi + 1⌝));
(* *** Goal "2.1" *** *)
a(PC_T1 "z_lin_arith" asm_prove_tac []);
(* *** Goal "2.2" *** *)
a(DROP_NTH_ASM_T 1 rewrite_thm_tac);
a(DROP_NTH_ASM_T 1 (strip_asm_tac o z_∀_elim ⓩi⌝));
(* *** Goal "2.2.1" *** *)
a(PC_T1 "z_lin_arith" asm_prove_tac []);
(* *** Goal "2.2.2" *** *)
a(DROP_NTH_ASM_T 4 ante_tac);
a(DROP_NTH_ASM_T 1 rewrite_thm_tac);
a(strip_tac);
a(strip_asm_tac (z_∀_elim ⓩsucc ↗~↕⌝ (
	∧_right_elim(z_gen_pred_elim[ⓩ𝕌⌝](z_get_spec ⓩiter⌝)))));
a(DROP_NTH_ASM_T 2 (strip_asm_tac o z_∀_elim ⓩi⌝));
(* *** Goal "2.2.2.1" *** *)
a(PC_T1 "z_lin_arith" asm_prove_tac []);
(* *** Goal "2.2.2.2" *** *)
a(DROP_NTH_ASM_T 1 rewrite_thm_tac);
a(DROP_NTH_ASM_T 1 (fn _ => id_tac));
a(DROP_NTH_ASM_T 2 rewrite_thm_tac);
a(MERGE_PCS_T1 ["z_fun_ext", "'z_numbers1"] rewrite_tac[z_∈_succ_thm]);
a(REPEAT strip_tac THEN all_var_elim_asm_tac1);
(* *** Goal "2.2.2.2.1" *** *)
a(z_∃_tac ⓩx2⌝ THEN REPEAT strip_tac);
a(PC_T1 "z_lin_arith" asm_prove_tac []);
(* *** Goal "2.2.2.2.2" *** *)
a(z_∃_tac ⓩx2 + i⌝ THEN REPEAT strip_tac);
(* *** Goal "2.2.2.2.2.1" *** *)
a(PC_T1 "z_lin_arith" asm_prove_tac []);
(* *** Goal "2.2.2.2.2.2" *** *)
a(PC_T1 "z_lin_arith" asm_prove_tac []);
(* *** Goal "2.2.2.2.2.3" *** *)
a(z_∃_tac ⓩx2⌝ THEN REPEAT strip_tac);
save_pop_thm "z_succ↗minus_n↕_thm"
);
=TEX
=IGN
z_size_dot_dot_conv ⓩ# (2 .. 7)⌝;
z_size_dot_dot_conv ⓩ# (8 .. 5)⌝;
=SML
local
	val pat1 = ⓩ#(a .. b)⌝;
	val tma = ⓩa ⦂ ℤ⌝;
	val tmb = ⓩb ⦂ ℤ⌝;
	val pat2 = ⓩa .. b⌝;
	val local_rw_conv = merge_pcs_rule1 ["z_sets_alg", "'z_numbers1"]
		 rewrite_conv [];
=TEX
=SML
val ⦏base_thm⦎ : THM = (
set_goal([], ⌜∀i j⦁ⓩ
	j < i ⇒ i .. j = {}⌝⌝);
a(PC_T1 "z_sets_ext" rewrite_tac[z_dot_dot_def] THEN PC_T1 "z_lin_arith" prove_tac[]);
pop_thm());
=TEX
=SML
val ⦏step_thm1⦎ : THM = (
set_goal([], ⌜∀i j⦁ⓩ
	i ≤ j ⇒ i .. j = ((i+1) .. j) ∪ {i}⌝⌝);
a(PC_T1 "z_sets_ext" rewrite_tac[z_dot_dot_def] THEN PC_T1 "z_lin_arith" prove_tac[]);
pop_thm());
=TEX
=SML
val ⦏step_thm2⦎ : THM = (
set_goal([], ⌜∀x l⦁ⓩ
	⌜Z'Setd l⌝ ∪ {x} = ⌜Z'Setd (Cons x l)⌝⌝⌝);
a(MERGE_PCS_T1 ["sets_ext", "z_sets_ext"] rewrite_tac[z'setd_def]);
pop_thm());
=TEX
=SML
val ⦏z_dot_dot⦎ = ⓩ(_ .. _)⌝;
in
val z_size_dot_dot_conv : CONV = (fn (tm : TERM) =>
let	val (_, tm_matches) = term_match tm pat1;
	val (a, b) = (subst tm_matches tma, subst tm_matches tmb);
	val aint = dest_z_signed_int a;
	val bint = dest_z_signed_int b;
	val binding = mk_z_binding [("i", a), ("j", b)];
	val thm1 = (z_∀_elim binding z_size_dot_dot_thm1);
	val thm2 = conv_rule (RATOR_C local_rw_conv) thm1;
	val thm3 = ∧_right_elim (⇒_elim thm2 t_thm);
in
	if	bint @< aint
	then	let val thm4 = ⇒_elim (conv_rule (LEFT_C z_less_conv)
			(∧_right_elim thm3)) t_thm;
		in
			thm4
		end
	else	let	val thm4 = ⇒_elim (conv_rule (LEFT_C z_≤_conv)
			(∧_left_elim thm3)) t_thm;
			val thm5 = conv_rule (RIGHT_C (MAP_C z_anf_conv)) thm4;
		in
			thm5
		end
end	handle (Fail _) =>
	term_fail "z_size_dot_dot_conv" 107001 [tm]
);
=TEX
=SML
val rec ⦏z_dot_dot_conv⦎ : CONV = (fn tm =>
let	val (_, tm_matches) = term_match tm pat2;
	val (lo, hi) = (subst tm_matches tma, subst tm_matches tmb);
	val ilo = dest_z_signed_int lo;
	val ihi = dest_z_signed_int hi;
in	if	ilo @> ihi
	then	let	val thm1 = list_∀_elim[lo, hi] base_thm;
			val cond = mk_z_less(hi, lo);
			val thm2 = ⇔_t_elim (z_less_conv cond);
			val thm3 = ⇒_mp_rule thm1 thm2;
		in	thm3
		end
	else	let	val thm1 = list_∀_elim[lo, hi] step_thm1;
			val cond = mk_z_≤(lo, hi);
			val thm2 = ⇔_t_elim (z_≤_conv cond);
			val thm3 = ⇒_mp_rule thm1 thm2;
			val conv4 = RIGHT_C(Z_LEFT_C(Z_LEFT_C z_plus_conv));
			val thm4 = conv_rule conv4 thm3;
			val lo' = mk_z_signed_int(ilo @+ one);
			val tm' = mk_z_app(z_dot_dot, mk_z_tuple[lo', hi]);
			val thm5 = z_dot_dot_conv tm';
			val conv6 = RIGHT_C(Z_LEFT_C (simple_eq_match_conv thm5));
			val thm6 = conv_rule conv6 thm4;
			val conv7 = RIGHT_C(simple_eq_match_conv step_thm2);
			val thm7 = conv_rule conv7 thm6;
		in	thm7
		end
end	handle Fail _ =>
	term_fail "z_dot_dot_conv" 107002 [tm]
);
end;
=TEX
\section{EPILOG OF ZNumbers1}
Final restoration of original proof context
=SML
val _ = pop_pc();
=TEX
=SML
end (* of structure ZNumbers1 *);
open ZNumbers1;
=TEX
\section{THE STRUCTURE $ZSequences1$}
\subsection{Preamble}
=SML
structure ⦏ZSequences1⦎ : ZSequences1 = struct
=TEX
=SML
val lthy = get_current_theory_name();
val _ = open_theory ⦏"z_sequences1"⦎;
val _ = push_merge_pcs["'z_numbers", "z_sets_alg"];
val _ = set_flag("z_type_check_only",false);
=TEX

=SML
val ⦏z_seq_thm⦎ = (
set_goal([], ⓩ∀X:𝕌⦁ seq X = ⋃{n : ℕ⦁ 1 .. n → X}⌝);
a(rewrite_tac[z_get_specⓩ(seq _)⌝]
	THEN REPEAT_N 4 (PC_T "z_sets_ext" strip_tac));
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(GET_ASM_T ⓩx1 ∈ ℕ ⇻ X⌝ ante_tac THEN
		rewrite_tac[z_⇸_thm2,  z_get_specⓩ(_⇻_)⌝]);
a(REPEAT strip_tac);
a(z_∃_tacⓩdom x1 → X⌝ THEN REPEAT strip_tac);
a(z_∃_tacⓩ#x1⌝ THEN asm_rewrite_tac[]);
a(all_fc_tac[z_size_⇻_thm]);
a(all_fc_tac[rewrite_rule[z_get_specⓩ#⌝](z_∀_elim
	ⓩ(f≜ #[𝕌 ⦂ ℙ (ℤ × X)], x≜ x1, X≜ (𝔽(𝕌 ⦂ ℙ (ℤ × X))), Y≜ ℕ)⌝
		z_fun_∈_clauses)]);
(* *** Goal "2" *** *)
a(all_var_elim_asm_tac1);
a(rewrite_tac[z_get_specⓩ(_⇻_)⌝, z_⇸_thm2]);
a(lemma_tacⓩdom x1 = 1 .. n⌝ THEN1 all_fc_tac[z_→_thm]);
a(once_rewrite_tac[z_𝔽_ℙ_thm]);
a(ALL_FC_T asm_rewrite_tac [z_size_dot_dot_thm]);
a(PC_T1 "z_sets_ext" rewrite_tac[] THEN rewrite_tac[z_dot_dot_clauses]);
a(contr_tac);
a(all_fc_tac[z_≤_less_trans_thm]);
(* *** Goal "3" *** *)
a(all_var_elim_asm_tac1);
a(LEMMA_Tⓩdom x1 = 1 .. n⌝ rewrite_thm_tac THEN1 all_fc_tac[z_→_thm]);
a(ALL_FC_T asm_rewrite_tac [z_size_seq_thm]);
save_pop_thm"z_seq_thm"
);
=TEX
=SML
val ⦏z_prim_seq_induction_thm⦎ = (
set_goal([],
	⌜∀ X p ⦁
		p ⓩ{}⌝
	∧	(∀ x n s⦁
			ⓩx ∈ X⌝ ∧ ⓩn ∈ ℕ⌝ ∧ ⓩs ∈ 1 .. n → X⌝ ∧ p ⓩs⌝
		⇒	p ⓩs ∪ {(n + 1, x)}⌝)
      ⇒ (∀ s⦁ ⓩs ∈ (seq X)⌝ ⇒ p s)⌝);
a(rewrite_tac[z_seq_thm] THEN REPEAT strip_tac);
a(all_var_elim_asm_tac1);
a(POP_ASM_T ante_tac THEN z_intro_∀_tacⓩ(s≜s)⌝ THEN z_≤_induction_tac ⓩn⌝);
(* *** Goal "1" *** *)
a(LEMMA_Tⓩ 1 .. 0 = {}⌝ rewrite_thm_tac THEN1 rewrite_tac[z_dot_dot_clauses]);
a(rewrite_tac[pc_rule1"z_fun_ext"prove_rule[]ⓩ[X]({} → X = {{}})⌝]);
a(REPEAT strip_tac THEN asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(REPEAT strip_tac);
a(PC_T1 "z_rel_ext" lemma_tac ⓩi + 1 ∈ dom s⌝
	THEN1 (ALL_FC_T asm_rewrite_tac[z_→_thm]));
a(lemma_tacⓩ∃f:1 .. i → X⦁ s = f ∪ {(i+1, y)}⌝);
(* *** Goal "2.1" *** *)
a(all_fc_tac[z_→_diff_singleton_thm]);
a(POP_ASM_T ante_tac THEN
	ALL_FC_T rewrite_tac [z_dot_dot_diff_thm]
	THEN strip_tac);
a(z_∃_tacⓩs \ {(i + 1, y)}⌝ THEN REPEAT strip_tac);
a(all_fc_tac [pc_rule1"z_sets_ext"prove_rule[]
	ⓩ∀x:𝕌; a:𝕌 | x ∈ a ⦁ a = (a \ {x}) ∪ {x}⌝]);
(* *** Goal "2.2" *** *)
a(lemma_tacⓩ(i + 1, y) ∈ s ∧ s ∈ 1 .. i + 1 → X ⇒ y ∈ X⌝
	THEN PC_T1 "z_fun_ext" prove_tac[]);
a(DROP_NTH_ASM_T 4 discard_tac	(* else irrelevant case split *)
	THEN all_var_elim_asm_tac1);
a(all_asm_fc_tac[] THEN all_asm_fc_tac[]);
save_pop_thm"z_prim_seq_induction_thm"
);
=TEX
=SML
val ⦏z_seq_thm1⦎ = (
set_goal([], ⓩ∀X:𝕌; n:𝕌⦁ seq X = {s:𝕌 | ∃n: ℕ⦁ s ∈ 1 .. n → X}⌝);
a(rewrite_tac[z_seq_thm] THEN REPEAT strip_tac
	THEN PC_T "z_sets_ext" strip_tac THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(z_∃_tacⓩn⌝ THEN all_var_elim_asm_tac1 THEN REPEAT strip_tac);
(* *** Goal "2" *** *)
a(z_∃_tacⓩ1 .. n → X⌝ THEN REPEAT strip_tac);
a(z_∃_tacⓩn⌝ THEN REPEAT strip_tac);
save_pop_thm"z_seq_thm1"
);
=TEX
=SML
val ⦏z_size_seq_thm1⦎ = (
set_goal([], ⓩ∀X:𝕌; s : 𝕌; n:ℕ⦁ s ∈ seq X ∧ #s = n ⇔ s ∈ 1 .. n → X⌝);
a(rewrite_tac[z_seq_thm1] THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(all_var_elim_asm_tac1);
a(all_fc_tac [z_size_seq_thm]);
a(all_var_elim_asm_tac1);
(* *** Goal "2" *** *)
a(z_∃_tacⓩn⌝ THEN REPEAT strip_tac);
(* *** Goal "3" *** *)
a(all_fc_tac [z_size_seq_thm]);
save_pop_thm"z_size_seq_thm1"
);
=TEX
=SML
val ⦏z_size_seq_thm2⦎ = (
set_goal([], ⓩ∀n:ℕ; s : (seq _)⦁ #s = n ⇔ dom s = 1 .. n⌝);
a(rewrite_tac[z_seq_thm1] THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(all_var_elim_asm_tac1);
a(all_fc_tac [z_size_seq_thm]);
a(all_var_elim_asm_tac1);
a(all_fc_tac[z_fun_dom_clauses]);
(* *** Goal "2" *** *)
a(LEMMA_Tⓩs ∈ dom s → 𝕌⌝ ante_tac THEN1
	(POP_ASM_T discard_tac THEN ALL_FC_T asm_rewrite_tac[z_→_thm]));
a(LIST_DROP_NTH_ASM_T [1,2,3] rewrite_tac);
a(REPEAT strip_tac THEN all_fc_tac [z_size_seq_thm]);
save_pop_thm"z_size_seq_thm2"
);
=TEX
=SML
val ⦏z_size_seq_ℕ_thm⦎ = (
set_goal([], ⓩ∀s : (seq _)⦁ #s ∈ ℕ⌝);
a(rewrite_tac [z_seq_thm1] THEN REPEAT strip_tac);
a(all_fc_tac [z_size_seq_thm] THEN all_var_elim_asm_tac1 THEN REPEAT strip_tac);
save_pop_thm"z_size_seq_ℕ_thm"
);
=TEX
=SML
val ⦏z_singleton_seq_thm⦎ = (
set_goal([], ⓩ∀x : 𝕌⦁
	⟨x⟩ ∈ (seq _) ∧ dom ⟨x⟩ = {1} ∧ ran ⟨x⟩ = {x} ∧ ⟨x⟩ 1 = x⌝);
a(rewrite_tac[z_seq_thm1] THEN REPEAT_UNTIL is_∧ strip_tac);
a(conv_tac (ONCE_MAP_C z_⟨⟩_conv));
a(rewrite_tac[z_singleton_app_thm]);
a(strip_tac THEN_LIST [id_tac, PC_T1 "z_rel_ext" prove_tac[]]);
a(z_∃_tacⓩ1⌝ THEN REPEAT strip_tac);
a(LEMMA_Tⓩ1 .. 1 = {1}⌝ rewrite_thm_tac);
(* *** Goal "1" *** *)
a(PC_T "z_sets_ext" strip_tac THEN REPEAT strip_tac);
(* *** Goal "2" *** *)
a(PC_T1 "z_fun_ext" asm_prove_tac[]);
save_pop_thm"z_singleton_seq_thm"
);
=TEX
=SML
val ⦏z_seq_u_thm⦎ = (
set_goal([], ⓩ∀X:𝕌⦁ ∀ s:seq X⦁s ∈ (seq _)⌝);
a(rewrite_tac[z_seq_thm1]);
a(REPEAT strip_tac);
a(z_∃_tacⓩn⌝ THEN REPEAT strip_tac);
a(FC_T bc_tac [z_ran_mono_thm] THEN REPEAT strip_tac);
save_pop_thm"z_seq_u_thm"
);
=TEX
=SML
val z_⁀_thm = (
set_goal([],
	ⓩ∀X, Y:𝕌⦁ ∀ s:seq X; t:seq Y⦁s ⁀ t  = s ∪ {n : dom t ⦁ n + # s ↦ t n}⌝);
a(REPEAT strip_tac);
a(all_fc_tac[z_seq_u_thm]);
a(ALL_FC_T rewrite_tac[z_get_specⓩ(_⁀_)⌝]);
save_pop_thm"z_⁀_thm"
);
=TEX
=SML
val ⦏z_⁀_∈_seq_thm⦎ = (
set_goal([], ⓩ∀X, Y:𝕌⦁ ∀ s:seq X; t:seq Y⦁s ⁀ t ∈ (seq _)⌝);
a(REPEAT strip_tac);
a(all_fc_tac[z_seq_u_thm]);
a(bc_tac(fc_rule(fc_canon z_fun_∈_clauses)
	(strip_∧_rule (all_∀_elim (z_get_specⓩ(_⁀_)⌝)))));
a(REPEAT strip_tac);
save_pop_thm"z_⁀_∈_seq_thm"
);
=TEX
=SML
val ⦏z_⁀_∈_seq_thm1⦎ = save_thm(
	"z_⁀_∈_seq_thm1",
	rewrite_rule[](z_∀_elimⓩ(X≜(𝕌 ⦂ ℙ X), Y≜(𝕌 ⦂ ℙ X))⌝ z_⁀_∈_seq_thm));
=TEX
=SML
val ⦏z_⁀_def_thm⦎ = (
set_goal([], ⓩ∀i : 𝕌; t : (seq _)⦁
		{n : dom t ⦁ n + i ↦ t n}
	=	{n : 𝕌; x : 𝕌 | (n, x) ∈ t ⦁ (n + i, x)}⌝);
a(PC_T1 "z_fun_ext" REPEAT strip_tac);
(* *** Goal "1" *** *)
a(GET_ASM_T ⓩt ∈ (seq _)⌝ (strip_asm_tac o rewrite_rule[z_seq_thm1]));
a(z_∃_tacⓩ(n≜ n, x≜ x2)⌝ THEN all_var_elim_asm_tac1 THEN REPEAT strip_tac);
a(all_fc_tac[z_fun_app_clauses]);
a(asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(z_∃_tacⓩ(n≜ n)⌝ THEN all_var_elim_asm_tac1 THEN
	PC_T1 "z_rel_ext" REPEAT strip_tac);
(* *** Goal "2.1" *** *)
a(z_∃_tacⓩx2⌝ THEN  REPEAT strip_tac);
(* *** Goal "2.2" *** *)
a(GET_ASM_T ⓩt ∈ (seq _)⌝ (strip_asm_tac o rewrite_rule[z_seq_thm1]));
a(all_fc_tac[z_fun_app_clauses]);
save_pop_thm"z_⁀_def_thm"
);
=TEX
=SML
val ⦏z_⁀_singleton_thm⦎ = (
set_goal([], ⓩ[X](∀s : seq X; x: X⦁ s ⁀ ⟨x⟩ = s ∪ {(#s + 1, x)})⌝);
a(REPEAT strip_tac);
a(lemma_tacⓩ⟨x⟩ ∈ (seq _)⌝ THEN1 rewrite_tac[z_singleton_seq_thm]);
a(ALL_FC_T rewrite_tac [z_⁀_thm, z_⁀_def_thm]);
a(LEMMA_Tⓩ{n : 𝕌; x' : 𝕌 | n = 1 ∧ x' = x ⦁ (n + # s, x')} = {(# s + 1, x)}⌝
	rewrite_thm_tac);
a(rewrite_tac[z_∀_elimⓩ1⌝ z_plus_order_thm]);
a(PC_T1 "z_sets_ext" prove_tac[] THEN asm_rewrite_tac[]);
save_pop_thm"z_⁀_singleton_thm"
);
=TEX
=SML
val ⦏z_⁀_singleton_thm1⦎ = save_thm("z_⁀_singleton_thm1",
					∀_elimⓩ𝕌⌝ z_⁀_singleton_thm);
=TEX
=SML
val z_⟨⟩_thm= (
set_goal([], ⓩ⟨⟩ = {}⌝);
a(rewrite_tac(map get_spec[ⓩ⟨⟩⌝, ⌜Z'NumList⌝]));
a(PC_T1"z_sets_ext" REPEAT strip_tac);
a(PC_T1 "sets_ext" asm_prove_tac[]);
save_pop_thm"z_⟨⟩_thm"
);
=TEX
=SML
val ⦏z_⟨⟩_seq_thm⦎ = (
set_goal([], ⓩ∀X:𝕌⦁ ⟨⟩ ∈ seq X⌝);
a(rewrite_tac[z_⟨⟩_thm, z_seq_thm1]);
a(REPEAT strip_tac);
a(z_∃_tac ⓩ0⌝ THEN REPEAT strip_tac);
a(LEMMA_Tⓩ 1 .. 0 = {}⌝ rewrite_thm_tac THEN1 rewrite_tac[z_dot_dot_clauses]);
a(rewrite_tac[pc_rule1"z_fun_ext"prove_rule[]ⓩ[X]({} → X = {{}})⌝]);
save_pop_thm"z_⟨⟩_seq_thm"
);
=TEX
Now we prove the HOL theorem which will justify the pattern of induction on sequences in which a singleton sequence is tacked on at the end of a sequence.
=SML
val ⦏z_seq_induction_thm⦎ = (
set_goal([],
	⌜∀ X p ⦁
		p ⓩ⟨⟩⌝
	∧	(∀ x s⦁
			ⓩx ∈ X⌝ ∧ ⓩs ∈ seq X⌝ ∧ p ⓩs⌝
		⇒	p ⓩs ⁀ ⟨x⟩⌝)
      ⇒ (∀ s⦁ ⓩs ∈ (seq X)⌝ ⇒ p s)⌝);
a(rewrite_tac[z_⟨⟩_thm] THEN REPEAT_N 3 strip_tac);
a(bc_tac[z_prim_seq_induction_thm] THEN REPEAT strip_tac);
a(lemma_tacⓩs ∈ seq X⌝ THEN1
	(rewrite_tac[z_seq_thm1] THEN contr_tac THEN all_asm_fc_tac[]));
a(lemma_tacⓩs ∪ {(#s + 1, x)} = s ⁀ ⟨x⟩⌝ THEN1
	(ALL_FC_T rewrite_tac[z_⁀_singleton_thm]));
a(lemma_tacⓩ#s = n⌝ THEN1 all_fc_tac[z_size_seq_thm]);
a(all_var_elim_asm_tac1 THEN asm_rewrite_tac[]);
a(all_asm_fc_tac[]);
save_pop_thm"z_seq_induction_thm"
);
=TEX
=SML
local
val ZGVar (seq_name, _, _) = dest_z_term ⓩseq X⌝;

fun ⦏dest_∈_seq⦎ (tm : TERM) : TERM * TERM = (
	let	val (x, seqa) = dest_z_∈ tm;
		val (seq, _, a) = dest_z_gvar seqa;
	in	if	seq = seq_name
		then	(x, hd a)
		else	fail "dest_∈_seq" 0 []	(* always caught below *)
	end
);
in
fun ⦏gen_z_seq_induction_tac⦎
	(tac_name : string)
	(ind_thm : THM)
	(tm : TERM) : TACTIC = (
	if not (is_var tm)
	then term_fail tac_name 107032 [tm]
	else ( fn(asms, conc) =>
	let	fun d t = (dest_∈_seq t, t);
		val ((x, a), asm) = find
			(mapfilter d asms) (fn ((x, _), _) => x =$ tm)
			handle Fail _ => fail tac_name 107031 [];
		val thm = ∀_elim a ind_thm;
	in	if not (is_free_in tm conc)
			then term_fail tac_name 86404 [tm]
		else if any (asms drop (fn t => t =$ asm)) (is_free_in tm)
			then term_fail tac_name 86403 [tm]
		else	(asm_ante_tac asm THEN gen_induction_tac1 thm) (asms, conc)
	end
	)
);
end;
val ⦏z_seq_induction_tac⦎ : TERM -> TACTIC =
	gen_z_seq_induction_tac "z_seq_induction_tac" z_seq_induction_thm;
=TEX
=SML
val ⦏z_⁀_⟨⟩_thm⦎ = (
set_goal([], ⓩ∀ X : 𝕌
    ⦁ ∀ s : seq X ⦁
		s ⁀ ⟨⟩ = s⌝);
a(REPEAT strip_tac);
a(strip_asm_tac(z_∀_elim(z_type_ofⓩs x⌝) z_⟨⟩_seq_thm));
a(ALL_FC_T rewrite_tac[z_⁀_thm]);
a(rewrite_tac[z_⟨⟩_thm, pc_rule1"z_rel_ext"prove_rule[]ⓩdom {} = {}⌝]);
a(PC_T1 "z_sets_ext" prove_tac[]);
save_pop_thm"z_⁀_⟨⟩_thm"
);
=TEX
=SML
val ⦏z_⟨⟩_⁀_thm⦎ = (
set_goal([], ⓩ∀ X : 𝕌
    ⦁ ∀ s : seq X ⦁
		⟨⟩ ⁀ s = s⌝);
a(REPEAT strip_tac);
a(strip_asm_tac(z_∀_elim(z_type_ofⓩs x⌝) z_⟨⟩_seq_thm));
a(all_fc_tac [z_seq_u_thm]);
a(ALL_FC_T rewrite_tac[z_⁀_thm, z_⁀_def_thm]);
a(rewrite_tac[z_⟨⟩_thm, z_size_empty_thm]);
a(PC_T1 "z_sets_ext" prove_tac[]);
save_pop_thm"z_⟨⟩_⁀_thm"
);
=TEX
=SML
val ⦏z_dom_seq_thm⦎ = (
set_goal([], ⓩ∀ s : (seq _) ⦁ dom s = 1 .. #s⌝);
a(REPEAT strip_tac);
a(GET_ASMS_T (MAP_EVERY (strip_asm_tac o rewrite_rule[z_seq_thm1])));
a(all_fc_tac[z_fun_dom_clauses]);
a(all_fc_tac [z_size_seq_thm] THEN all_var_elim_asm_tac1);
save_pop_thm"z_dom_seq_thm"
);
=TEX
=SML
val ⦏z_dom_⁀_thm⦎ = (
set_goal([], ⓩ∀ s : (seq _); t : (seq _) ⦁ dom(s ⁀ t) = 1 .. (#s + #t)⌝);
a(REPEAT strip_tac);
a(GET_ASMS_T (MAP_EVERY (strip_asm_tac o rewrite_rule[z_seq_thm1])));
a(all_fc_tac [z_size_seq_thm] THEN all_var_elim_asm_tac1);
a(ALL_FC_T rewrite_tac [z_⁀_thm]);
a(rewrite_tac[pc_rule1"z_rel_ext"
	prove_rule[]ⓩ∀r1, r2:𝕌⦁dom(r1 ∪ r2) = dom r1 ∪ dom r2⌝]);
a(ALL_FC_T rewrite_tac [z_dom_seq_thm, z_⁀_def_thm]);
a(LEMMA_T ⓩdom {n : 𝕌; x : 𝕌 | (n, x) ∈ t ⦁ (n + # s, x)}
	= {i : dom t⦁ (i + #s)}⌝ rewrite_thm_tac THEN1
	(MERGE_PCS_T1 ["z_rel_ext", "'z_fc"] prove_tac[]));
a(ALL_FC_T rewrite_tac [z_dom_seq_thm]);
a(asm_rewrite_tac[z_dot_dot_plus_thm,
	z_dot_dot_clauses,
	pc_rule1"z_rel_ext"
	prove_rule[]ⓩ∀a, b, c:𝕌⦁a ∪ b = c ⇔ a ⊆ c ∧ b ⊆ c ∧ c ⊆ a ∪ b⌝]);
a(PC_T "z_sets_ext" strip_tac);
a(rewrite_tac[] THEN z_strip_tac THEN strip_tac);
a(rewrite_tac[z_∀_elimⓩ#s⌝z_plus_order_thm]);
a(PC_T1 "z_sets_alg" REPEAT strip_tac);
a(POP_ASM_T (ante_tac o once_rewrite_rule[z_get_specⓩ(_<_)⌝] o rewrite_rule[]));
a(REPEAT strip_tac);
save_pop_thm"z_dom_⁀_thm"
);
=TEX
=SML
val ⦏z_ran_⊆_thm⦎ = (
set_goal([], ⓩ∀X:𝕌; Y:𝕌; f : 𝕌⦁ f ∈ X → 𝕌 ∧ ran f ⊆ Y ⇔ f ∈ X → Y⌝);
a(PC_T1 "z_fun_ext" z_fc_prove_tac[]);
pop_thm()
);
=TEX
=SML
val ⦏z_seq_seq_x_thm⦎ = (
set_goal([], ⓩ∀ X :𝕌; s : (seq _) ⦁ s ∈ seq X ⇔ ran s ⊆ X⌝);
a(rewrite_tac[z_seq_thm1] THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(POP_ASM_T ante_tac THEN PC_T1 "z_fun_ext" prove_tac[]);
(* *** Goal "2" *** *)
a(z_∃_tacⓩn⌝ THEN ALL_FC_T asm_rewrite_tac [z_ran_⊆_thm]);
save_pop_thm"z_seq_seq_x_thm"
);
=TEX
=SML
val ⦏z_singleton_seq_x_thm⦎ = (
set_goal([], ⓩ∀ X :𝕌⦁∀x:𝕌⦁ ⟨x⟩ ∈ seq X ⇔ x ∈ X⌝);
a(REPEAT_UNTIL is_⇔  strip_tac);
a(lemma_tacⓩ⟨x⟩ ∈ (seq _)⌝ THEN1 rewrite_tac[z_singleton_seq_thm]);
a(ALL_FC_T1 fc_⇔_canon rewrite_tac [z_seq_seq_x_thm]);
a(rewrite_tac[z_singleton_seq_thm]);
a(PC_T1"z_sets_ext" asm_prove_tac[]);
save_pop_thm "z_singleton_seq_x_thm"
);
=TEX
=SML
val ⦏z_⁀_seq_x_thm⦎ = (
set_goal([], ⓩ∀ X :𝕌; s1, s2:(seq _)⦁ s1 ⁀ s2 ∈ seq X ⇔ s1 ∈ seq X ∧ s2 ∈ seq X⌝);
a(REPEAT_UNTIL is_⇔ strip_tac);
a(LEMMA_T ⓩs1 ⁀ s2 ∈ (seq _)⌝ ante_tac THEN1 all_fc_tac[z_⁀_∈_seq_thm]);
a(ALL_FC_T rewrite_tac[z_⁀_thm, z_⁀_def_thm]);
a(strip_tac THEN ALL_FC_T1 fc_⇔_canon  rewrite_tac [z_seq_seq_x_thm]);
a(rewrite_tac[pc_rule1 "z_rel_ext" prove_rule[]ⓩ∀f, g:𝕌⦁ran (f ∪ g) = ran f ∪ ran g⌝]);
a(LEMMA_T ⓩ ran {n : 𝕌; x : 𝕌 | (n, x) ∈ s2 ⦁ (n + # s1, x)} = ran s2⌝ rewrite_thm_tac
	THEN1 PC_T1 "z_rel_ext" prove_tac[]);
a(PC_T1 "z_sets_ext" prove_tac[]);
save_pop_thm "z_⁀_seq_x_thm"
);
=TEX
=SML
val ⦏z_size_⁀_thm⦎ = (
set_goal([], ⓩ∀ s, t : (seq _); x:𝕌 ⦁#(s ⁀ t) = #s + #t⌝);
a(REPEAT strip_tac);
a(lemma_tac ⓩs ⁀ t ∈ (seq _)⌝ THEN1 all_fc_tac[z_⁀_∈_seq_thm]);
a(all_fc_tac[z_size_seq_ℕ_thm]);
a(lemma_tac ⓩ#s + #t ∈ ℕ⌝ THEN1 (all_fc_tac[z_ℕ_plus_thm] THEN REPEAT strip_tac));
a(lemma_tac ⓩdom(s ⁀ t) = 1 .. # s + # t⌝ THEN1 all_fc_tac[z_dom_⁀_thm]);
a(strip_asm_tac (z_∀_elimⓩ(n≜ # s + # t, s≜ s ⁀ t)⌝ z_size_seq_thm2));
a(all_fc_tac[z_less_≤_trans_thm]);
save_pop_thm"z_size_⁀_thm"
);
=TEX
=SML
val ⦏z_size_singleton_seq_thm⦎ = (
set_goal([], ⓩ∀ x:𝕌 ⦁#⟨x⟩ = 1⌝);
a(conv_tac(ONCE_MAP_C z_⟨⟩_conv));
a(rewrite_tac[z_size_singleton_thm]);
save_pop_thm"z_size_singleton_seq_thm"
);
=TEX
=SML
val ⦏z_seq_cases_thm⦎ = (
set_goal([], ⓩ∀ s : (seq _)⦁
		s = ⟨⟩ ∨ (∃s1 : (seq _); x:𝕌⦁ s = s1 ⁀ ⟨x⟩)⌝);
a(z_∀_tac THEN ⇒_tac);
a(z_seq_induction_tacⓩs⌝ THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(z_∃_tacⓩ(s1≜ s, x'≜ x)⌝ THEN REPEAT strip_tac);
(* *** Goal "2" *** *)
a(z_∃_tacⓩ(s1≜ s, x'≜ x)⌝ THEN REPEAT strip_tac);
save_pop_thm"z_seq_cases_thm"
);
=TEX
=SML
val ⦏z_¬_⁀_empty_thm⦎ = (
set_goal([], ⓩ∀ s : (seq _); x:𝕌⦁ ¬s ⁀ ⟨x⟩ = ⟨⟩⌝);
a(REPEAT strip_tac);
a(ALL_FC_T rewrite_tac[z_⁀_singleton_thm1]);
a(PC_T1 "z_sets_ext" prove_tac[z_⟨⟩_thm]);
save_pop_thm"z_¬_⁀_empty_thm"
);
=TEX
=SML
val ⦏z_⁀_one_one_thm⦎ = (
set_goal([], ⓩ∀ s : (seq _); t : (seq _); x, y:𝕌 ⦁
		s ⁀ ⟨x⟩ = t ⁀ ⟨y⟩ ⇔ s = t ∧ x = y⌝);
a(REPEAT_UNTIL is_⇔ strip_tac THEN ⇔_tac
	THEN_LIST [id_tac, REPEAT strip_tac THEN asm_rewrite_tac[]]);
a(lemma_tacⓩ#s = #t⌝);
(* *** Goal "1" *** *)
a(LEMMA_Tⓩ#(s ⁀ ⟨x⟩) = #(t ⁀ ⟨y⟩)⌝ ante_tac THEN1 asm_rewrite_tac[]);
a(lemma_tacⓩ⟨x⟩ ∈ (seq _) ∧ ⟨y⟩ ∈ (seq _)⌝
	THEN1 rewrite_tac[z_singleton_seq_thm]);
a(rename_tac[(ⓩt⌝, "u")] THEN ALL_FC_T rewrite_tac[z_size_⁀_thm]);
a(rewrite_tac[z_size_⁀_thm, z_size_singleton_seq_thm]);
(* *** Goal "2" *** *)
a(GET_ASM_T ⓩs ∈ (seq _)⌝ (strip_asm_tac o rewrite_rule[z_seq_thm1]));
a(GET_ASM_T ⓩt ∈ (seq _)⌝ (strip_asm_tac o rewrite_rule[z_seq_thm1]));
a(all_fc_tac [z_size_seq_thm] THEN all_var_elim_asm_tac1);
a(DROP_ASM_T ⓩs ⁀ ⟨x⟩ = t ⁀ ⟨y⟩⌝ ante_tac);
a(strip_asm_tac(z_∀_elimⓩ(s≜s, x≜x)⌝
	(z_gen_pred_elim[ⓩ𝕌⌝] z_⁀_singleton_thm)));
a(strip_asm_tac(z_∀_elimⓩ(s≜t, x≜y)⌝
	(z_gen_pred_elim[ⓩ𝕌⌝] z_⁀_singleton_thm)));
a(asm_rewrite_tac[]);
a(PC_T1 "z_sets_ext" REPEAT strip_tac);
(* *** Goal "2.1" *** *)
a(all_fc_tac[z_∈_→_thm]);
a(POP_ASM_T ante_tac THEN asm_rewrite_tac[] THEN strip_tac);
a(lemma_tacⓩ¬x1 = #t + 1⌝ THEN1 (contr_tac THEN all_var_elim_asm_tac1));
a(DROP_NTH_ASM_T 5 (ante_tac o z_∀_elimⓩ(x1≜ x1, x2≜ x2)⌝));
a(asm_rewrite_tac[]);
(* *** Goal "2.2" *** *)
a(all_fc_tac[z_∈_→_thm]);
a(lemma_tacⓩ¬x1 = #t + 1⌝ THEN1
	(contr_tac THEN all_var_elim_asm_tac1));
a(DROP_NTH_ASM_T 5 (ante_tac o z_∀_elimⓩ(x1≜ x1, x2≜ x2)⌝));
a(asm_rewrite_tac[]);
(* *** Goal "2.3" *** *)
a(POP_ASM_T (ante_tac o z_∀_elimⓩ(x1≜ # t + 1, x2≜ y)⌝));
a(asm_rewrite_tac[]);
a(LEMMA_Tⓩ¬ (# t + 1, y) ∈ s⌝ (fn th => prove_tac[th]));
a(contr_tac THEN all_fc_tac[z_∈_→_thm]);
a(POP_ASM_T ante_tac THEN asm_rewrite_tac[]);
save_pop_thm"z_⁀_one_one_thm"
);
=TEX
=SML
val ⦏z_⁀_assoc_thm⦎ = (
set_goal([], ⓩ∀ s1, s2, s3 : (seq _)⦁ (s1 ⁀ s2) ⁀ s3 = s1 ⁀ (s2 ⁀ s3)⌝);
a(REPEAT strip_tac);
a(lemma_tacⓩs1 ⁀ s2 ∈ (seq _) ∧ s2 ⁀ s3 ∈ (seq _)⌝
	THEN1 ALL_FC_T rewrite_tac [z_⁀_∈_seq_thm]);
a(ALL_FC_T once_rewrite_tac [z_⁀_thm]);
a(ALL_FC_T rewrite_tac [z_⁀_def_thm]);
a(ALL_FC_T rewrite_tac [z_size_⁀_thm]);
a(ALL_FC_T rewrite_tac [z_⁀_thm, z_⁀_def_thm]);
a(rewrite_tac[pc_rule1"z_sets_ext"
	prove_rule[]ⓩ∀a, b, c:𝕌⦁(a ∪ b) ∪ c = a ∪ (b ∪ c)⌝]);
a(LEMMA_Tⓩ
		{n : 𝕌; x : 𝕌 | (n, x) ∈ s2 ⦁ (n + # s1, x)}
	∪	{n : 𝕌; x : 𝕌 | (n, x) ∈ s3 ⦁ (n + (# s1 + # s2), x)}
	=	{n : 𝕌; x : 𝕌 |
		(n, x) ∈ s2 ∨
		(∃ n' : 𝕌; x' : 𝕌 | (n', x') ∈ s3 ⦁ n' + # s2 = n ∧ x' = x)
                 ⦁ (n + # s1, x)}⌝rewrite_thm_tac);
a(PC_T "z_sets_ext" strip_tac THEN REPEAT strip_tac
	THEN_TRY all_var_elim_asm_tac1);
(* *** Goal "1" *** *)
a(z_∃_tacⓩ(n'≜ n, x≜ x2)⌝ THEN asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(z_∃_tacⓩ(n'≜ n + #s2, x ≜ x2)⌝ THEN
	asm_rewrite_tac[z_∀_elimⓩ#s1⌝z_plus_order_thm]);
a(∨_right_tac THEN z_∃_tacⓩ(n''≜ n, x' ≜ x2)⌝ THEN asm_rewrite_tac[]);
(* *** Goal "3" *** *)
a(LIST_DROP_NTH_ASM_T [1] fc_tac);
(* *** Goal "4" *** *)
a(contr_tac THEN LIST_DROP_NTH_ASM_T [1] fc_tac);
a(POP_ASM_T ante_tac THEN rewrite_tac[z_∀_elimⓩ#s1⌝z_plus_order_thm]);
save_pop_thm"z_⁀_assoc_thm"
);
=TEX
=SML
val ⦏z_⁀_assoc_thm1⦎ = (
	save_thm("z_⁀_assoc_thm1",
		conv_rule (ONCE_MAP_C eq_sym_conv) z_⁀_assoc_thm)
);
=TEX
=SML
val ⦏z_seq_u_induction_thm1⦎ = (
set_goal([], ⌜∀ p⦁
	p ⓩ⟨⟩⌝
∧	(∀ x s⦁ s ∈ ⓩ(seq _)⌝ ∧ p s ⇒ p ⓩ⟨x⟩ ⁀ s⌝)
⇒	(∀ s⦁ s ∈ ⓩ(seq _)⌝ ⇒ p s)⌝);
a(REPEAT strip_tac);
a(lemma_tac⌜∀x⦁ p ⓩ⟨x⟩⌝⌝ THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(strip_asm_tac (z_∀_elimⓩx⌝ z_singleton_seq_thm));
a(LEMMA_T ⓩ⟨x⟩ = ⟨x⟩ ⁀ ⟨⟩⌝ once_rewrite_thm_tac THEN1 ALL_FC_T rewrite_tac [z_⁀_⟨⟩_thm]);
a(GET_NTH_ASM_T 6 bc_thm_tac);
a(asm_rewrite_tac[z_⟨⟩_seq_thm]);
(* *** Goal "2" *** *)
a(lemma_tac⌜∀s1⦁ s1 ∈ ⓩ(seq _)⌝ ⇒ (p s1 ∧ ∀s2⦁ s2 ∈ ⓩ(seq _)⌝ ∧ p s2 ⇒ p ⓩs1 ⁀ s2⌝)⌝ );
(* *** Goal "2.1" *** *)
a(REPEAT_N 2 strip_tac);
a(z_seq_induction_tacⓩs1⌝ THEN REPEAT strip_tac);
(* *** Goal "2.1.1" *** *)
a(ALL_FC_T asm_rewrite_tac [z_⟨⟩_⁀_thm]);
(* *** Goal "2.1.2" *** *)
a(TOP_ASM_T bc_thm_tac);
a(asm_rewrite_tac[z_singleton_seq_thm]);
(* *** Goal "2.1.3" *** *)
a(lemma_tacⓩ⟨x⟩ ∈ (seq _)⌝ THEN1 rewrite_tac[z_singleton_seq_thm]);
a(ALL_FC_T rewrite_tac[z_⁀_assoc_thm]);
a(lemma_tac⌜pⓩ⟨x⟩ ⁀ s12⌝⌝ THEN1 (GET_NTH_ASM_T 9 bc_thm_tac THEN REPEAT strip_tac));
a(GET_NTH_ASM_T 5 bc_thm_tac THEN REPEAT strip_tac);
a(ALL_FC_T rewrite_tac[z_⁀_∈_seq_thm]);
(* *** Goal "2.2" *** *)
a(ALL_ASM_FC_T rewrite_tac[]);
pop_thm()
);
=TEX
=SML
val ⦏z_seq_induction_thm1⦎ = (
set_goal([], ⌜∀ X p⦁
	p ⓩ⟨⟩⌝
∧	(∀ x s⦁ x ∈ X ∧ s ∈ ⓩseq X⌝ ∧ p s ⇒ p ⓩ⟨x⟩ ⁀ s⌝)
⇒	(∀ s⦁ s ∈ ⓩseq X⌝ ⇒ p s)⌝);
a(REPEAT strip_tac);
a(strip_asm_tac(conv_rule(MAP_C β_conv)(∀_elim⌜λs⦁ⓩs ∈ seq X⌝ ⇒ p s⌝z_seq_u_induction_thm1)));
(* *** Goal "1" *** *)
a(POP_ASM_T discard_tac THEN i_contr_tac);
a(swap_nth_asm_concl_tac 2 THEN REPEAT strip_tac);
a(POP_ASM_T ante_tac);
a(lemma_tac ⓩ⟨x⟩ ∈ (seq _)⌝ THEN1 rewrite_tac[z_singleton_seq_thm]);
a(ALL_FC_T1 fc_⇔_canon rewrite_tac [z_⁀_seq_x_thm] THEN taut_tac);
(* *** Goal "2" *** *)
a(swap_nth_asm_concl_tac 1 THEN REPEAT strip_tac);
a(DROP_NTH_ASM_T 6 bc_thm_tac);
a(lemma_tac ⓩ⟨x⟩ ∈ (seq _)⌝ THEN1 rewrite_tac[z_singleton_seq_thm]);
a(DROP_NTH_ASM_T 3 ante_tac);
a(ALL_FC_T1 fc_⇔_canon  rewrite_tac [z_⁀_seq_x_thm]);
a(rewrite_tac[z_singleton_seq_x_thm] THEN REPEAT strip_tac);
(* *** Goal "3" *** *)
a(all_fc_tac[z_seq_u_thm] THEN all_asm_fc_tac[]);
save_pop_thm"z_seq_induction_thm1"
);
=TEX
=SML
val ⦏z_seq_induction_tac1⦎ =
	gen_z_seq_induction_tac "z_seq_induction_tac1" z_seq_induction_thm1;
=TEX
\subsection{Sequence Displays}
=SML
val _ = set_merge_pcs["z_sets_alg", "'z_rel_alg", "'z_numbers1", "'ℕ"];
=TEX
=SML
val hol_∪_z_∪_lemma = (
set_goal([], ⌜∀a b⦁ a ∪ b = ⓩa ∪ b⌝⌝);
a(MERGE_PCS_T1 ["z_sets_ext", "sets_ext"] prove_tac[]);
pop_thm()
);
=TEX
=SML
val ⦏hol_setd_z_setd_lemma⦎ = (
set_goal([], ⌜∀x⦁ {x} = ⓩ{x}⌝⌝);
a(MERGE_PCS_T1 ["z_sets_ext", "sets_ext"] prove_tac[]);
pop_thm()
);
=TEX
=SML
val ⦏z_num_list_thm⦎ = save_thm ("z_num_list_thm", (
set_goal([], ⌜∀l:'a LIST; n⦁
	Z'NumList(l, n) =
	ⓩ{i:𝕌; x:𝕌 | (i, x) ∈ ⌜$"Z'⟨⟩" l⌝ ⦁ (i+⌜Z'Int n⌝, x)}⌝⌝);
a(rewrite_tac[get_specⓩ⟨⟩⌝]);
a(∀_tac THEN list_induction_tac⌜l:'a LIST⌝);
(* *** Goal "1" *** *)
a(rewrite_tac[get_spec⌜Z'NumList⌝]);
a(PC_T1 "z_rel_ext" rewrite_tac[]);
a(PC_T1 "sets_ext" rewrite_tac[] THEN REPEAT strip_tac);
(* *** Goal "2" *** *)
a(rewrite_tac[get_spec⌜Z'NumList⌝]);
a(REPEAT strip_tac);
a(POP_ASM_T once_rewrite_thm_tac);
a(PC_T1 "z_rel_ext" REPEAT strip_tac);
(* *** Goal "2.1" *** *)
a(z_∃_tacⓩ(i ≜ x1 + ~⌜Z'Int n⌝, x' ≜ x2)⌝ THEN PC_T1 "z_rel_ext" rewrite_tac[]);
a(rewrite_tac[z_plus_assoc_thm]);
a(POP_ASM_T ante_tac THEN PC_T1 "sets_ext" rewrite_tac[]);
a(rewrite_tac[z_int_homomorphism_thm]);
a(once_rewrite_tac[z_ℤ_eq_thm]);
a(conv_tac(ONCE_MAP_C z_anf_conv));
a(rewrite_tac[]);
(* *** Goal "2.2" *** *)
a(all_var_elim_asm_tac1);
a(POP_ASM_T ante_tac THEN PC_T1 "sets_ext" rewrite_tac[]);
a(rewrite_tac[z_int_homomorphism_thm]);
a(once_rewrite_tac[z_ℤ_eq_thm]);
a(conv_tac(ONCE_MAP_C z_anf_conv));
a(rewrite_tac[]);
pop_thm()
));
=TEX
=SML
val ⦏z_seqd_∈_seq_thm⦎ = save_thm ("z_seqd_∈_seq_thm", (
set_goal([], ⌜∀l: 'a LIST⦁ⓩ⌜$"Z'⟨⟩" l⌝ ∈ (seq _)⌝⌝);
a(∀_tac THEN list_induction_tac⌜l:'a LIST⌝);
(* *** Goal "1" *** *)
a(rewrite_tac[z_⟨⟩_seq_thm]);
(* *** Goal "2" *** *)
a(rewrite_tac[get_spec⌜$"Z'⟨⟩"⌝, get_spec⌜Z'NumList⌝, hol_∪_z_∪_lemma]);
a(∀_tac);
a(lemma_tacⓩ⟨x⟩ ∈ (seq _)⌝ THEN1 rewrite_tac[z_singleton_seq_thm]);
a(LEMMA_T ⓩ
	⌜Z'NumList (l, 1)⌝ ∪ ⌜{ⓩ(1, x)⌝}⌝ =
	⟨x⟩ ⁀ ⌜$"Z'⟨⟩" l⌝⌝ rewrite_thm_tac);
(* *** Goal "2.1" *** *)
a(ALL_FC_T rewrite_tac[z_⁀_thm]);
a(rewrite_tac[z_num_list_thm]);
a(rewrite_tac[z_size_singleton_seq_thm, hol_setd_z_setd_lemma]);
a(ALL_FC_T rewrite_tac[z_⁀_def_thm]);
a(conv_tac (ONCE_MAP_C z_⟨⟩_conv));
a(PC_T1 "z_rel_ext" prove_tac[]);
(* *** Goal "2.2" *** *)
a(ALL_FC_T rewrite_tac[z_⁀_∈_seq_thm]);
pop_thm()
));
=TEX
=SML
val ⦏z_seqd_⁀_thm⦎ = save_thm ("z_seqd_⁀_thm", (
set_goal([], ⌜∀a :'a; l⦁$"Z'⟨⟩" (Cons a l) = ⓩ⟨a⟩ ⁀ ⌜$"Z'⟨⟩" l⌝⌝⌝);
a(REPEAT strip_tac);
a(conv_tac (LEFT_C (rewrite_conv[get_spec⌜$"Z'⟨⟩"⌝])));
a(once_rewrite_tac[get_spec⌜Z'NumList⌝] THEN rewrite_tac[]);
a(lemma_tacⓩ⟨a⟩ ∈ (seq _)⌝ THEN1 rewrite_tac[z_singleton_seq_thm]);
a(strip_asm_tac (∀_elim⌜l⌝z_seqd_∈_seq_thm));
a(ALL_FC_T rewrite_tac[z_⁀_thm]);
a(rewrite_tac[z_num_list_thm]);
a(rewrite_tac[z_size_singleton_seq_thm, hol_setd_z_setd_lemma]);
a(ALL_FC_T rewrite_tac[z_⁀_def_thm]);
a(conv_tac (ONCE_MAP_C z_⟨⟩_conv));
a(rewrite_tac[hol_∪_z_∪_lemma]);
a(PC_T1 "z_rel_ext" prove_tac[]);
pop_thm()
));
=TEX
=SML
=TEX
=SML
val ⦏z_seqd_⁀_rw_thm⦎ = save_thm ("z_seqd_⁀_rw_thm", (
set_goal([], ⌜∀a b :'a; l⦁$"Z'⟨⟩" (Cons a (Cons b l)) = ⓩ⟨a⟩ ⁀ (⟨b⟩ ⁀ ⌜$"Z'⟨⟩" l⌝)⌝⌝);
a(REPEAT ∀_tac);
a(rewrite_tac[list_∀_elim [⌜a⌝, ⌜Cons b l⌝]z_seqd_⁀_thm,
	list_∀_elim [⌜b⌝, ⌜l⌝]z_seqd_⁀_thm]);
pop_thm()
));
=TEX
=SML
val ⦏z_∈_seq_app_eq_thm⦎ = save_thm ("z_∈_seq_app_eq_thm", (
set_goal([], ⓩ∀s : (seq _); m : 𝕌; x : 𝕌⦁ (m, x) ∈ s ⇒ s m = x⌝);
a(rewrite_tac[z_seq_thm] THEN REPEAT strip_tac);
a(all_var_elim_asm_tac1 THEN ALL_FC_T rewrite_tac[z_fun_app_clauses]);
pop_thm()
));
=TEX
=SML
val ⦏z_∈_seqd_app_eq_thm⦎ = save_thm ("z_∈_seqd_app_eq_thm", (
set_goal([], ⌜∀l m x⦁ ⓩ(m, x) ∈ ⌜$"Z'⟨⟩" l⌝ ⇒ ⌜$"Z'⟨⟩" l⌝ m = x⌝⌝);
a(REPEAT ∀_tac);
a(lemma_tacⓩ⌜$"Z'⟨⟩" l⌝ ∈ (seq _)⌝ THEN1 rewrite_tac[z_seqd_∈_seq_thm]);
a(REPEAT strip_tac THEN all_fc_tac[z_∈_seq_app_eq_thm]);
pop_thm()
));
=TEX
=SML
val ⦏z_seqd_app_conv⦎ : CONV = (fn tm =>
	let	val (s, itm) = dest_z_app tm
			handle Fail _ => term_fail "z_seqd_app_conv" 107011 [tm];
		val i = nat_of_string(dest_z_int itm)
			handle Fail _ => term_fail "z_seqd_app_conv" 107012 [itm];
		val ys = snd(dest_z_⟨⟩ s)
			handle Fail _ => term_fail "z_seqd_app_conv" 107011 [tm];
		val y = nth (i-1) ys
			handle Fail _ => term_fail "z_seqd_app_conv" 107013 [itm, s];
		val el = mk_z_tuple [itm, y];
		val cond = mk_z_∈ (el, s);
		val th1 = ⇔_t_elim
			((z_∈_⟨⟩_conv THEN_C z_∈_setd_conv THEN_C
				PC_C1 "predicates" rewrite_conv[]) cond);
	in	simple_⇒_match_mp_rule z_∈_seqd_app_eq_thm th1
	end
);
=TEX
=SML
val ⦏z_size_seqd_thm⦎ = save_thm ("z_size_seqd_thm", (
set_goal([], ⌜
	ⓩ#⟨⟩ = 0⌝
∧	∀a :'a; l⦁ⓩ#⌜$"Z'⟨⟩" (Cons a l)⌝⌝ = ⓩ1 + #⌜$"Z'⟨⟩" l⌝⌝⌝);
a(rewrite_tac[z_⟨⟩_thm, z_size_empty_thm]);
a(REPEAT strip_tac THEN once_rewrite_tac[z_seqd_⁀_thm]);
a(lemma_tac ⓩ⟨a⟩ ∈ (seq _) ∧ ⌜$"Z'⟨⟩" l⌝ ∈ (seq _)⌝
	THEN1 rewrite_tac[z_singleton_seq_thm, z_seqd_∈_seq_thm]);
a(ALL_FC_T rewrite_tac[z_size_⁀_thm]);
a(conv_tac (ONCE_MAP_C z_⟨⟩_conv) THEN
	rewrite_tac[z_size_empty_thm, z_size_singleton_thm]);
pop_thm()
));
=TEX
Having a conversion to compute sizes of sequence displays is easy to
code and is likely to be faster than doing it by rewriting.
=SML
local
	val base_conv = simple_eq_match_conv(∧_left_elim z_size_seqd_thm);
	fun STEP_C c = simple_eq_match_conv(∧_right_elim z_size_seqd_thm)
			THEN_C RAND_C (RIGHT_C c) THEN_C z_plus_conv;
in
	val rec ⦏z_size_seqd_conv⦎ : CONV = (fn tm =>
		(STEP_C z_size_seqd_conv ORELSE_C base_conv) tm
		handle Fail _ => term_fail "z_size_seqd_conv" 107021 [tm]
	);
end;
=TEX
=SML
val ⦏z_size_seqd_length_thm⦎ = save_thm ("z_size_seqd_length_thm", (
set_goal([], ⌜∀l: 'a LIST⦁ⓩ#⌜$"Z'⟨⟩" l⌝⌝ = Z'Int (Length l)⌝);
a(REPEAT strip_tac THEN list_induction_tac⌜l:'a LIST⌝ THEN
	asm_rewrite_tac[z_size_seqd_thm, length_def, z'int_def]);
pop_thm()
));
=TEX
=SML
val ⦏z_dom_seqd_thm⦎ = save_thm ("z_dom_seqd_thm", (
set_goal([], ⌜∀l: 'a LIST⦁ⓩdom ⌜$"Z'⟨⟩" l⌝ = 1 .. #⌜$"Z'⟨⟩" l⌝⌝⌝);
a(REPEAT strip_tac);
a(lemma_tac ⓩ⌜$"Z'⟨⟩" l⌝ ∈ (seq _)⌝ THEN1 rewrite_tac[z_seqd_∈_seq_thm]);
a(ALL_FC_T rewrite_tac[z_dom_seq_thm]);
pop_thm()
));
=TEX
=SML
val ⦏z_ran_seqd_thm⦎ = save_thm ("z_ran_seqd_thm", (
set_goal([], ⌜∀l: 'a LIST⦁ⓩran ⌜$"Z'⟨⟩" l⌝ = ⌜Z'Setd l⌝⌝⌝);
a(REPEAT strip_tac THEN list_induction_tac ⌜l : 'a LIST⌝);
(* *** Goal "1" *** *)
a(rewrite_tac[z_⟨⟩_thm]);
(* *** Goal "2" *** *)
a(once_rewrite_tac[z_seqd_⁀_thm, z'setd_def] THEN REPEAT strip_tac);
a(lemma_tac ⓩ⟨x⟩ ∈ (seq _) ∧ ⌜$"Z'⟨⟩" l⌝ ∈ (seq _)⌝
	THEN1 rewrite_tac[z_singleton_seq_thm, z_seqd_∈_seq_thm]);
a(ALL_FC_T rewrite_tac[z_⁀_thm, z_⁀_def_thm]);
a(GET_NTH_ASM_T 3 (rewrite_thm_tac o eq_sym_rule));
a(rewrite_tac[hol_∪_z_∪_lemma, hol_setd_z_setd_lemma]);
a(conv_tac (ONCE_MAP_C (z_⟨⟩_conv ORELSE_C z_size_seqd_conv)));
a(PC_T1 "z_rel_ext" prove_tac[]);
pop_thm()
));
=TEX
=SML
val ⦏z_seqd_⁀_⟨⟩_clauses⦎ = save_thm ("z_seqd_⁀_⟨⟩_clauses", (
set_goal([], ⌜∀l: 'a LIST⦁
	ⓩ⌜$"Z'⟨⟩" l⌝ ⁀ ⟨⟩ = ⌜$"Z'⟨⟩" l⌝⌝
∧	ⓩ⟨⟩ ⁀ ⌜$"Z'⟨⟩" l⌝  = ⌜$"Z'⟨⟩" l⌝⌝⌝);
a(REPEAT ∀_tac);
a(lemma_tac ⓩ⌜$"Z'⟨⟩" l⌝ ∈ (seq _)⌝ THEN1 rewrite_tac[z_seqd_∈_seq_thm]);
a(ALL_FC_T rewrite_tac[z_⁀_⟨⟩_thm, z_⟨⟩_⁀_thm]);
pop_thm()
));
=TEX
We now want to show that the representation of sequence displays defines a one-to-one
function from HOL lists to Z sequences.
The following lemma is the first useful fact about the representation of sequence displays.
It is saying in terms of the representation that there is no need to keep looking
for $(m, x)$ in a sequence display once you've got up to the $m$-th element.
=SML
val _ = set_pc"basic_hol";
val z_seqd_eq_lemma1 =(
set_goal([], ⌜∀l m x n⦁ ⓩ(⌜Z'Int m⌝, x)⌝ ∈ Z'NumList (l, n)  ⇒ n < m⌝);
a(∀_tac THEN rewrite_tac[get_spec⌜Z'Int⌝]);
a(list_induction_tac⌜l⌝ THEN REPEAT strip_tac
	THEN POP_ASM_T ante_tac THEN rewrite_tac[get_spec⌜Z'NumList⌝]);
(* *** Goal "1" *** *)
a(PC_T1 "sets_ext1" prove_tac[]);
(* *** Goal "2" *** *)
a(rewrite_tac[get_spec⌜Z'Int⌝]);
a(cases_tac⌜ⓩ(⌜ℕℤ m⌝, x')⌝ ∈ Z'NumList(l, n+1)⌝ THEN REPEAT strip_tac);
(* *** Goal "2.1" *** *)
a(all_asm_fc_tac[]);
a(POP_ASM_T ante_tac THEN PC_T1 "lin_arith" prove_tac[]);
(* *** Goal "2.2" *** *)
a(LEMMA_T⌜ⓩ(⌜ℕℤ m⌝, x')⌝ ∈  {ⓩ(⌜ℕℤ (n + 1)⌝, x)⌝}⌝ ante_tac
	THEN1 PC_T1 "sets_ext1" asm_prove_tac[]);
a(PC_T1"sets_ext1" rewrite_tac[]);
a(PC_T1 "z_language" REPEAT strip_tac);
a(all_fc_tac[ℕℤ_one_one_thm]);
a(asm_rewrite_tac[] THEN PC_T1 "lin_arith" prove_tac[]);
pop_thm()
);
=TEX
The next lemma is just  a convenience for the proof of the fact that $Z'NumList$ is
one-to-one.
=SML
val z_seqd_eq_lemma2 =(
set_goal([], ⌜∀A B x⦁ A ∪ {x} = B ∪ {x} ∧ ¬x ∈ A  ∧ ¬x ∈ B ⇒ A = B⌝);
a(PC_T1 "sets_ext1" rewrite_tac[] THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(spec_nth_asm_tac 4 ⌜x'⌝ THEN all_var_elim_asm_tac);
(* *** Goal "2" *** *)
a(spec_nth_asm_tac 4 ⌜x'⌝ THEN all_var_elim_asm_tac);
pop_thm()
);
=TEX
Now we show that $Z'NumList$ is one-to-one. The proof is by list induction
on the first of the two HOL lists in the statement of the theorem.
=SML
val z_seqd_eq_lemma3 = (
set_goal([], ⌜∀l1 l2 n⦁ Z'NumList (l1, n) = Z'NumList(l2, n) ⇒ l1 = l2⌝);
a(∀_tac);
a(list_induction_tac⌜l1⌝ THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(strip_asm_tac(∀_elim⌜l2⌝ list_cases_thm) THEN all_var_elim_asm_tac1
	THEN REPEAT strip_tac);
a(POP_ASM_T ante_tac THEN rewrite_tac[get_spec⌜Z'NumList⌝]);
a(PC_T1 "sets_ext1" prove_tac[]);
(* *** Goal "2" *** *)
a(strip_asm_tac(∀_elim⌜l2⌝ list_cases_thm) THEN all_var_elim_asm_tac1
	THEN PC_T1 "predicates" REPEAT strip_tac);
(* *** Goal "2.1" *** *)
a(POP_ASM_T ante_tac THEN rewrite_tac[get_spec⌜Z'NumList⌝]);
a(PC_T1 "sets_ext1" prove_tac[]);
(* *** Goal "2.2" *** *)
a(lemma_tac⌜x = x'⌝);
(* *** Goal "2.2.1" *** *)
a(POP_ASM_T ante_tac THEN rewrite_tac[get_spec⌜Z'NumList⌝]);
a(PC_T1 "sets_ext1" REPEAT strip_tac);
a(lemma_tac ⌜ⓩ(⌜Z'Int (n + 1)⌝, x)⌝ ∈ ⓩ⌜Z'NumList (l1, n + 1)⌝⌝ ∪ {ⓩ(⌜Z'Int (n + 1)⌝, x)⌝}⌝
	THEN1 PC_T1 "sets_ext1" prove_tac[]);
a(all_asm_fc_tac[]);
a(POP_ASM_T (PC_T1 "sets_ext1" strip_asm_tac));
(* *** Goal "2.2.1.1" *** *)
a(all_fc_tac[z_seqd_eq_lemma1]);
(* *** Goal "2.2.1.2" *** *)
a(POP_ASM_T (PC_T1 "z_language" strip_asm_tac));
(* *** Goal "2.2.2" *** *)
a(all_var_elim_asm_tac);
a(POP_ASM_T ante_tac THEN rewrite_tac[get_spec⌜Z'NumList⌝]);
a(REPEAT strip_tac);
a(GET_NTH_ASM_T 2 bc_thm_tac);
a(∃_tac⌜n+1⌝ THEN bc_thm_tac z_seqd_eq_lemma2);
a(∃_tac⌜ⓩ(⌜Z'Int (n + 1)⌝, x')⌝⌝);
a(asm_rewrite_tac[] THEN REPEAT strip_tac THEN contr_tac THEN all_fc_tac[z_seqd_eq_lemma1]);
pop_thm()
);
=TEX
The following theorem states the previous result in terms of the HOL constant $OneOne$.
=SML
val z'⟨⟩_one_one_lemma = (
set_goal([], ⌜OneOne $"Z'⟨⟩" ⌝);
a(rewrite_tac[one_one_def, get_specⓩ⟨⟩⌝] THEN REPEAT strip_tac);
a(all_fc_tac[z_seqd_eq_lemma3]);
pop_thm()
);
=TEX
The following theorem states that the semantic constant for Z sequence displays is one-to-one.
=SML
val ⦏z_seqd_one_one_thm⦎ = (
set_goal([], ⌜∀x y⦁ $"Z'⟨⟩" x = $"Z'⟨⟩" y ⇔ x = y ⌝);
a (accept_tac (⇔_match_mp_rule one_one_thm z'⟨⟩_one_one_lemma));
pop_thm ()
);
=TEX
The following recasts the previous result in the form we shall want in the conversion for
equality of sequence displays.
=SML
val ⦏z_seqd_eq_thm⦎ = (
set_goal ([], ⌜
	∀ x y l1 l2⦁
	$"Z'⟨⟩" (Cons x l1) = $"Z'⟨⟩" (Cons y l2) ⇔ x = y ∧ $"Z'⟨⟩" l1 = $"Z'⟨⟩" l2
⌝);
a (REPEAT ∀_tac);
a (rewrite_tac [z_seqd_one_one_thm]);
save_pop_thm "z_seqd_eq_thm"
);
=TEX
The following is for use in the conversion when the two display are not equal:
=SML
val ⦏z_seqd_¬_eq_⟨⟩_thm⦎ = (
set_goal ([], ⌜
	∀ x l
	  ⦁ ¬ ⓩ⟨⟩⌝ = ⌜$"Z'⟨⟩" (Cons x l)⌝
	      ∧ ¬ ⌜$"Z'⟨⟩" (Cons x l)⌝ = ⓩ⟨⟩⌝
⌝);
a (REPEAT ∀_tac);
a (MERGE_PCS_T1 ["z_language", "'list"] rewrite_tac [z_seqd_one_one_thm]);
pop_thm ()
);
=TEX
The following little lemma is used in the conversions to eliminate trivial equalities.
=SML
val ⦏z_x_eq_x_lemma⦎ = (
set_goal ([], ⌜∀x⦁ x = x ⇔ T⌝);
a (REPEAT strip_tac);
pop_thm ()
);
=TEX
Now we can give the conversion for equality of sequence displays. It eliminates
trivial equalities and simplifies $true$ and $false$ out of the resulting conjunction.
=SML
local
val ⦏z_seqd_eq_rw_thms⦎ =
	current_ad_rw_canon() z_seqd_eq_thm @
	current_ad_rw_canon() z_x_eq_x_lemma @
	current_ad_rw_canon() z_seqd_¬_eq_⟨⟩_thm;
val ⦏z_seqd_eq_convs⦎ = map simple_eq_match_conv z_seqd_eq_rw_thms;
val ⦏true_false_thms⦎ = z_x_eq_x_lemma ::
	(current_ad_rw_canon() o prove_rule[])
	⌜∀p⦁ (p ∧ T ⇔ p) ∧ (p ∧ F ⇔ F) ∧ (T ∧ p ⇔ p) ∧ (F ∧ p ⇔ F)⌝;
val ⦏true_false_convs⦎ = map simple_eq_match_conv true_false_thms;
in	
val ⦏z_seqd_eq_conv⦎ : CONV = (
	let	fun step tm = FIRST_C z_seqd_eq_convs tm handle
			Fail _	=> term_fail "z_seqd_eq_conv" 107020 [tm];
		val rec conv : CONV = fn tm => (
			step THEN_TRY_C (RIGHT_C conv)
			THEN_TRY_C FIRST_C true_false_convs
			THEN_TRY_C FIRST_C true_false_convs
			THEN_TRY_C LEFT_C (FIRST_C true_false_convs)
			THEN_TRY_C RIGHT_C (FIRST_C true_false_convs)
		) tm;

	in	conv
	end
);
end;

local
	val equal_string_conv = (simple_eq_match_conv o all_∀_intro o ⇔_t_intro o refl_conv) ⓩs ⦂ seq 𝕊⌝;
	val prop_simp_conv = (REPEAT_C o FIRST_C o map (simple_eq_match_conv o taut_rule))
								[⌜∀p⦁ T ∧ p ⇔ p⌝, ⌜∀p⦁ F ∧ p ⇔ F⌝];
in
	val z_string_eq_conv : CONV = (fn tm =>
		(((dest_z_string ** dest_z_string) o dest_eq) tm
			handle Fail _ => term_fail "z_string_eq_conv" 107030 [tm];
		(equal_string_conv
			ORELSE_C
				(RANDS_C z_string_conv THEN_C z_seqd_eq_conv
					THEN_TRY_C (ONCE_MAP_C char_eq_conv THEN_C prop_simp_conv))) tm)
);
end;

=TEX
\subsection{EPILOG OF ZSequences1}
=TEX
Final restoration of original proof context
=SML
val _ = pop_pc();
=SML
end (* of structure ZSequences1 *);
open ZSequences1;
=TEX
Now mke $z\_sequences1$ a parent of $z\_library$.
=SML
open_theory "z_library";
new_parent "z_sequences1";
=TEX
\twocolumn[\section{INDEX}]
\small
\printindex

\end{document}

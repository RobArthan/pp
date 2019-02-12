=IGN
********************************************************************************
imp028.doc: this file is part of the PPHol system

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

\def\Title{Implementation of Tactics II}

\def\AbstractText{This document gives a detailed design for the first group of tactics and tacticals in ICL HOL.}

\def\Reference{DS/FMU/IED/IMP028}

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
%% LaTeX2e port: \TPPtitle{Implementation of Tactics II}
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP028}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.48 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2011/02/19 17:03:10 $ %
%% LaTeX2e port: }}  %% Mandatory field
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{R.D. Arthan & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document gives a detailed design for the
%% LaTeX2e port: first group of tactics and tacticals in ICL HOL.}
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
\item [Issue 1.4 (1991/07/02) (2 July 1991)]
First draft version.
\item [Issue 1.5 (1991/07/03) (3 July 1991)]
Fixed $IF\_T$.
\item [Issue 1.9 (1991/08/12) (12th August 1991)]
Update reflecting issue 1.8 design changes.
\item [Issue 1.10 (1991/08/15) (\FormatDate{91/08/15%
})]
Renamings of functions containing the name atom $simple$,
and renaming of $aconv$.
\item [Issue 1.11 (1991/10/28) (25th October 1991)]
Re-implementation of stripping material,
and other changes in response to deskcheck ID0029.
\item [Issue 1.12 (1991/10/30) (29th October 1991)]
Made $eqn\_cxt\_conv$ ignore ``no change'' conversions.
\item [Issue 1.13 (1991/10/31) (31st October 1991)]
Changes during testing.
\item [Issue 1.15 (1991/11/18) (18th November 1991)]
Corrected $CONTR\_T$.
\item [Issue 1.16 (1991/11/19) (18th November 1991)]
Reacting to issue 1.5/6 of \cite{DS/FMU/IED/DTD051}.

\item[Issue 1.17 (1992/01/20), \FormatDate{92/01/20} ] Updated to use new fonts.

\item [Issue 1.18 (1992/02/05),1.19 (1992/02/05) (5th February 1992)]
Modified $strip\_tac$, added $swap\_asm\_concl\_tac$, et al.
\item [Issue 1.20 (1992/02/10),1.21 (1992/02/11) (10th,11th February 1992)]
Minor corrections.
\item [Issue 1.23 (1992/03/18) (11th March 1992)]
Various minor additions and extensions.
\item [Issue 1.24 (1992/03/26),1.25 (1992/03/26) (26th March 1992)]
Changed to use proof context material of issue 1.13 of \cite{DS/FMU/IED/DTD051}.
\item [Issue 1.26 (1992/04/09) (1st April 1992)]
Changes required by CR0016.
\item [Issue 1.27 (1992/04/14) (13th April 1992)]
Changes due to CR0017.
\item [Issue 1.28 (1992/05/14) (14th May 1992)]
Tidying up proof contexts.
\item [Issue 1.29 (1992/05/21) (20th May 1992)]
Rearranging proof contexts.
\item [Issue 1.30 (1992/05/26) (26th May 1992)]
Renamings from version 1.5 of DS/FMU/IED/WRK038.
\item [Issue 1.31 (1992/05/29) (29th May 1992)]
Gained $prove\_tac$, $prove\_∃\_tac$.
\item [Issue 1.32 (1992/06/02) (2nd June 1992)]
Corrected equality theorems in proof contexts.
\item [Issue 1.33 (1992/06/15)]
Added $intro\_∀\_tac$.
\item [Issue 1.34 (1992/06/23) (23rd June 1992)]
Corrected $prove(\_∃)\_tac$.
\item[Issue 1.35 (1992/06/24) (24th June 1992)]
Renamings from issue 1.6 of \cite{DS/FMU/IED/WRK038},
mostly proof context name changes.
\item[Issue 1.37 (1992/07/31) (31st July 1992)]
Extended error checking on $SIMPLE\_∃\_THEN$.
\item[Issue 1.38 (1992/08/05) (5th August 1992)]
Added message 28083.
\item [(Issue 1.39 (1992/08/13) (13th August 1992)]
Corrected error handling for interrupts.
\item [(Issue 1.40 (1992/09/07) (7th September 1992)]
Added $¬\_if\_thm$ to tautology prover mechanisms.
Enabled net version of $simple\_¬\_in\_conv$ which was
hidden by mistake.
\item [(Issue 1.42 (1992/12/07) (7th December 1992)]
Added $strip\_concl\_conv$, $strip\_asm\_conv$.
\item[Issue 1.43 (1993/02/12) (12th February 1993)]
Added tactics for equality symmetry in assumptions.
\item[Issue 1.44 (1999/02/11)]
Update for SML'97.
\item[Issue 1.45 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.46 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.47 (2005/12/12)] Added
=INLINEFT
intro_∀_tac1
=TEX
.
\item[Issue 1.48 (2011/02/19)] Minor rationalisations.
\item[Issue 1.49 (2014/02/28)] Added
=INLINEFT
IF_CASES_T
=TEX
\ and
=INLINEFT
if_cases_tac
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
This document contains the implementation for material
whose detailed design is given in \cite{DS/FMU/IED/DTD028}.
\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains the implementation for the
second group of tactics and tacticals for ICL HOL.
This group is mainly concerned with supplying support for predicate calculus
connectives (including boolean conditionals but not boolean $let$-expressions).

\subsubsection{Dependencies}
Loading this document is dependent on \cite{DS/FMU/IED/IMP009}
and \cite{DS/FMU/IED/IMP051}.
\subsubsection{Deficiencies}
None known.
\section{PREAMBLE}
=SML
structure ⦏Tactics2⦎ : Tactics2 = struct
=TEX
=SML
val ⦏was_theory⦎ = get_current_theory_name ();
val _ = open_theory "misc";
val _ = set_pc "initial";
=TEX
\section{TACTICALS FOR THE PREDICATE CALCULUS}
The following contain only those parts used in implementing
the stripping material.
\subsection{Concerning ∧}
=SML
fun ⦏∧_THEN2⦎ (ttac1 : THM -> TACTIC) (ttac2 : THM -> TACTIC)
						: THM -> TACTIC = (fn thm =>
	let	val thm1 = ∧_left_elim thm;
		val thm2 = ∧_right_elim thm;
	in	ttac1 thm1 THEN ttac2 thm2
	end
	handle ex => divert ex "∧_left_elim" "∧_THEN2" 28032
		[fn () => string_of_thm thm]
);
=TEX
=SML
fun ⦏∧_THEN⦎ (ttac : THM -> TACTIC) : THM -> TACTIC = (fn thm =>
	(∧_THEN2 ttac ttac thm)
	handle ex => pass_on ex "∧_THEN2" "∧_THEN"
);
=TEX
\subsection{Concerning ∨}
$∨\_LEFT\_T$ and $∨\_RIGHT\_T$ are deferred until we have support
to do them via $⇒\_T$.
=SML
fun ⦏∨_THEN2⦎ (ttac1 : THM -> TACTIC) (ttac2 : THM -> TACTIC)
						: THM -> TACTIC = (fn thm =>
	let	val (t1, t2) = dest_∨(concl thm);
	in	(fn (seqasms, conc) =>
			let	val (sgs1, pf1) = ttac1 (asm_rule t1) (seqasms, conc);
				val (sgs2, pf2) = ttac2 (asm_rule t2) (seqasms, conc);
			in	(sgs1 @ sgs2,
				(fn thl =>
					let	val len = length sgs1;
					in ∨_elim thm (pf1(thl to (len - 1)))
					  (pf2(thl from len))
					end
				))
			end)
	end
	handle ex => divert ex "dest_∨" "∨_THEN2" 28042
		[fn () => string_of_thm thm]
);
=TEX
=SML
fun ⦏∨_THEN⦎ (ttac : THM -> TACTIC) (thm : THM) : TACTIC = (
	∨_THEN2 ttac ttac thm
	handle complaint =>
	pass_on complaint "∨_THEN2" "∨_THEN"
);
=TEX
=SML
=TEX
=SML
fun ⦏CASES_T2⦎ (t1 : TERM) (ttac1 : THM -> TACTIC) (ttac2 : THM -> TACTIC)
					: TACTIC = (fn gl as (seqasms, conc) =>
	let	val (sgs1, pf1) = ttac1 (asm_rule t1) (seqasms, conc);
		val (sgs2, pf2) = ttac2 (asm_rule (mk_¬ t1)) (seqasms, conc);
	in	(sgs1 @ sgs2,
		(fn thl =>
			let	val len = length sgs1;
			in	asm_elim t1 (pf1(thl to (len - 1))) (pf2(thl from len))
			end
			))
	end
	handle ex => (
		if area_of ex = "asm_rule"
		then term_fail "CASES_T2" 28022 [t1]
		else raise ex
	)
);
=TEX
=SML
fun ⦏CASES_T⦎ (t1 : TERM) (ttac : THM -> TACTIC) : TACTIC = (fn gl =>
	((CASES_T2 t1 ttac ttac) gl)
	handle ex => pass_on ex "CASES_T2" "CASES_T"
);
=TEX
=IGN
fun ⦏asm_cases_tac⦎ (t1 : TERM) : TACTIC = (
	fn gl as (seqasms, conc) =>
	([(t1 :: seqasms, conc), (mk_¬ t1 :: seqasms, conc)],
	  fn [th1, th2] => asm_elim t1 th1 th2
	 | _ => bad_proof "asm_cases_tac")
	handle ex => divert ex "mk_¬" "asm_cases_tac" 28002 []
);
=TEX
\subsection{Concerning ⇒}
=SML
fun ⦏⇒_T⦎ (ttac : THM -> TACTIC) : TACTIC = (fn (seqasms, conc) =>
	let	val (t1, t2) = dest_⇒ conc;
		val (sgs, pf) = ttac (asm_rule t1) (seqasms, t2);
	in	(sgs, ⇒_intro t1 o pf)
	end
	handle ex => divert ex "dest_⇒" "⇒_T" 28051 []
);
=TEX
\subsection{Concerning ∃}
=SML
fun ⦏SIMPLE_∃_THEN⦎ (ttac : THM -> TACTIC) = (fn thm =>
	let	val (x, b) = dest_simple_∃(concl thm);
	in	(fn (seqasms, conc) =>
			let	val x' = variant (flat(map frees
				(conc :: concl thm :: asms thm @ seqasms))) x;
				val (sgs, pf) = ttac (asm_rule (var_subst[(x', x)] b))
					(seqasms, conc);
			in	(sgs,
				(fn thm1 =>
				simple_∃_elim x' thm thm1
				handle complaint =>
				divert complaint
					"simple_∃_elim"
					"SIMPLE_∃_THEN"
					28094
					[fn () => string_of_term x',
					fn () => string_of_thm thm1,
					fn () => string_of_term x]
					) o pf)
			end)
	end
	handle ex => divert ex "dest_simple_∃" "SIMPLE_∃_THEN" 28093
		[fn () => string_of_thm thm]
);
=TEX
\section{TACTICS FOR THE PREDICATE CALCULUS 1}
We now give the tactics which do not involve $strip\_asm\_tac$. These
will enable us to prove various simple theorems required to set up
the stripping tacticals.
\subsection{Concerning $T$}
=SML
val ⦏t_tac⦎ : TACTIC = (fn gl =>
	accept_tac t_thm gl
	handle complaint =>
	divert complaint "accept_tac" "t_tac" 28011 []
);
=TEX
=SML
val ⦏⇔_t_tac⦎ : TACTIC = (fn (seqasms, conc) =>
	let	val (lhs, rhs) = dest_eq conc;
	in	if rhs =$ mk_t
		then	([(seqasms, lhs)],
			 fn [th] => ⇔_t_intro th | _ => bad_proof "⇔_t_tac")
		else if lhs =$ mk_t
		then	([(seqasms, rhs)],
			 fn [th] => eq_sym_rule(⇔_t_intro th) | _ => bad_proof "⇔_t_tac")
		else fail "⇔_t_tac" 28012 []
	end	handle Fail _ => fail "⇔_t_tac" 28012 []
);
=TEX
\subsection{Concerning $F$}
=SML
val ⦏i_contr_tac⦎ : TACTIC = (fn (seqasms, conc) =>
	([(seqasms, mk_f)],
	 fn [th] => contr_rule conc th | _ => bad_proof "i_contr_tac")
);
=TEX
=SML
fun ⦏f_thm_tac⦎ (thm : THM) : TACTIC = (fn gl as (_, conc) =>
	let	val thm1 = contr_rule conc thm
	in	accept_tac thm1 gl
	end
	handle	ex => divert ex "contr_rule" "f_thm_tac" 28021
		[fn () => string_of_thm thm]
);
=TEX
\subsection{Concerning ∧}
=SML
val ⦏∧_tac⦎ : TACTIC = (fn (seqasms, conc) =>
	let	val (t1, t2) = dest_∧ conc
	in	([(seqasms, t1), (seqasms, t2)],
			 fn [th1, th2] => ∧_intro th1 th2
			 |   _ => bad_proof "∧_tac" )
	end handle ex => divert ex "dest_∧" "∧_tac" 28031 []
);
=TEX
\subsection{Concerning ∨}
=SML
val  ⦏∨_left_tac⦎ : TACTIC = (fn (seqasms, conc) =>
	let	val (a, b) = dest_∨ conc
	in	([(seqasms, a)],
			 fn [th] => ∨_right_intro b th
			 |   _ => bad_proof "∨_left_tac" )
	end handle ex => divert ex "dest_∨" "∨_left_tac" 28041 []
);
=TEX
=SML
val  ⦏∨_right_tac⦎ : TACTIC = (fn (seqasms, conc) =>
	let	val (a, b) = dest_∨ conc
	in	([(seqasms, b)],
			 fn [th] => ∨_left_intro a th
			 |   _ => bad_proof "∨_right_tac" )
	end handle ex => divert ex "dest_∨" "∨_right_tac" 28041 []
);
=TEX
\subsection{Concerning ⇔}
=SML
val ⦏⇔_thm⦎ = ( (* ⊢ ∀ a b ⦁ (a ⇔ b) ⇔ (a ⇒ b) ∧ (b ⇒ a) *)
save_thm("⇔_thm",
let
	val thm1 = asm_rule ⌜(a ⇒ b) ∧ (b ⇒ a)⌝;
	val thm2 = ⇔_intro(∧_left_elim thm1) (∧_right_elim thm1);
	val (thm3, thm4) = ⇔_elim(asm_rule⌜a ⇔ b⌝);
	val thm5 = ∧_intro thm3 thm4;
in
	list_simple_∀_intro[⌜a:BOOL⌝, ⌜b:BOOL⌝]
		(⇔_intro(all_⇒_intro thm5)(all_⇒_intro thm2))
end));
=TEX
\subsection{Concerning ⇒}
=SML
fun ⦏asm_ante_tac⦎ (t1 : TERM) : TACTIC = (fn (seqasms, conc) =>
	(if t1 term_mem seqasms
	then ([(seqasms term_less t1, mk_⇒(t1, conc))],
		(fn [thm] => undisch_rule thm | _ => bad_proof "asm_ante_tac"))
	else  term_fail "asm_ante_tac" 28052 [t1])
	handle ex => divert ex "mk_⇒" "asm_ante_tac" 28055 []
);
=TEX
When we undischarge more than one assumption we need to be careful not
to fail if the list of assumptions we are discharging contains repeats
which is allowed with the convention that the repeats are ignored.
=SML
local
	fun try_asm_ante_tac allasms asm : TACTIC = (fn (seqasms,conc) =>
	asm_ante_tac asm (seqasms,conc)
	handle complaint as (Fail _) =>
	if asm term_mem allasms andalso type_of asm =: BOOL
		andalso type_of conc =: BOOL
	then id_tac  (seqasms,conc)
	else pass_on complaint "asm_ante_tac" "list_asm_ante_tac"
	);
	fun try_asm_ante_tac1 asm : TACTIC = (fn (seqasms,conc) =>
	asm_ante_tac asm (seqasms,conc)
	handle complaint as (Fail _) =>
	if type_of asm =: BOOL andalso type_of conc =: BOOL
	then id_tac  (seqasms,conc)
	else pass_on complaint "asm_ante_tac" "all_asm_ante_tac"
	);
in
fun ⦏list_asm_ante_tac⦎ (lasms : TERM list):  TACTIC = (fn (seqasms,conc) =>
	MAP_EVERY (try_asm_ante_tac seqasms) (rev lasms) (seqasms,conc)
);

val ⦏all_asm_ante_tac⦎ :  TACTIC = (fn (seqasms,conc) =>
	MAP_EVERY (try_asm_ante_tac1) seqasms (seqasms,conc)
);
end;
=TEX
=SML
fun ⦏ante_tac⦎ (thm : THM) : TACTIC = (fn (seqasms, conc) =>
	([(seqasms, mk_⇒(concl thm, conc))],
	 fn [th] => ⇒_elim th thm | _ => bad_proof "ante_tac")
	handle ex => divert ex "mk_⇒" "ante_tac" 28027 []
);
=TEX
\subsection{Concerning ∀}
=SML
val ⦏simple_∀_tac⦎ : TACTIC = (fn (seqasms, conc) =>
	let	val (x, b) = dest_simple_∀ conc;
		val x' = variant (flat(map frees(conc::seqasms))) x;
	in
		([(seqasms, var_subst[(x', x)] b)],
		(fn [thm] => simple_∀_intro x' thm | _ => bad_proof "simple_∀_tac"))
	end handle ex => divert ex "dest_simple_∀" "simple_∀_tac" 28081 []
);
=TEX
=SML
fun ⦏intro_∀_tac⦎ ((t1, x) : (TERM * TERM)) : TACTIC = (fn (seqasms, conc) =>
	let	val dummy = if t1 =$ x orelse
			not(is_free_in x conc)
			then ()
			else term_fail "intro_∀_tac" 28083 [x,t1];
		val t' = subst[(x, t1)] conc;
	in	if if is_var t1 then not (is_free_in t1 conc) else t' =$ conc
		then	term_fail "intro_∀_tac" 28082 [t1]
		else	([(seqasms, mk_simple_∀(x, t'))],
			(fn [thm] => simple_∀_elim t1 thm | _ => bad_proof "intro_∀_tac"))
	end handle ex => (
		let val area = area_of ex;
		in	if area = "subst" orelse area = "mk_simple_∀"
			then reraise ex "intro_∀_tac"
			else raise ex
		end
	)
);
=TEX
=SML
fun ⦏intro_∀_tac1⦎ (x : TERM) : TACTIC = (
	intro_∀_tac (x, x)
);
=TEX
\subsection{Concerning ∃}
=SML
fun ⦏simple_∃_tac⦎ (tm : TERM) : TACTIC = (fn (seqasms, conc) =>
	let	val (x, b) = dest_simple_∃ conc;
	in
		([(seqasms, var_subst[(tm, x)] b)],
		(fn [thm] => simple_∃_intro conc thm | _ => bad_proof "simple_∃_tac"))
	end
	handle ex =>
	case area_of ex of
		"var_subst" => term_fail "simple_∃_tac" 28092 [tm]
	|	"dest_simple_∃" => fail "simple_∃_tac" 28091 []
	|	_ => raise ex
);
=TEX
\section{STRIPPING THEOREMS AND GOALS}
=SML
fun ⦏check_asm_tac⦎ (thm : THM) : TACTIC = (fn gl as (seqasms, conc) =>
	let	val t = concl thm;
	in	if t ~=$ conc
		then accept_tac thm
		else if is_t t
		then id_tac
		else if is_f t
		then f_thm_tac thm
		else if is_¬ t
		then	let	val t' = dest_¬ t;
				fun aux (asm :: more) = (
					if t ~=$ asm
					then id_tac
					else if asm ~=$ t'
					then accept_tac (¬_elim conc (asm_rule asm) thm)
					else if asm ~=$ conc
					then accept_tac (asm_rule asm)
					else aux more
				) | aux [] = asm_tac thm;
			in	aux seqasms
			end
		else	let	fun aux (asm :: more) = (
					if t ~=$ asm
					then id_tac
					else if is_¬ asm andalso (dest_¬ asm) ~=$ t
					then accept_tac (¬_elim conc thm (asm_rule asm))
					else if asm ~=$ conc
					then accept_tac (asm_rule asm)
					else aux more
					) | aux [] = asm_tac thm;
			in	aux seqasms
			end
	end	gl
);
=TEX
=SML
val ⦏concl_in_asms_tac⦎ : TACTIC = (fn gl as (seqasms, conc) =>
	if conc term_mem seqasms
	then accept_tac (asm_rule conc) gl
	else fail "concl_in_asms_tac" 28002 []
);
=TEX
We start off with theorem strippers and goal strippers which
have no values in their parameterisation.

Even if we didn't have the error message, we would still
use the $(fn\ =>\ \ldots)$ form, to prevent
$current\-\_ad\-\_st\-\_conv()$ being evaluated before point of use.
=SML
val ⦏STRIP_THM_THEN⦎ : THM_TACTICAL = (fn ttac:THM_TACTIC =>
	fn thm :THM =>
	(FIRST_TTCL[CONV_THEN (current_ad_st_conv()),
		∧_THEN,
		∨_THEN,
		SIMPLE_∃_THEN]
	ORELSE_TTCL
		FAIL_WITH_THEN "STRIP_THM_THEN" 28003
			[fn () => string_of_thm thm])
	ttac
	thm
);
=TEX

Even if we didn't have the error message, we would still
use the $(fn\ =>\ \ldots)$ form, to prevent
$current\-\_ad\-\_sc\- \_conv()$ being evaluated before point of use.
=SML
fun ⦏STRIP_CONCL_T⦎ (ttac : THM_TACTIC) : TACTIC = (fn gl =>
	(FIRST[ conv_tac(current_ad_sc_conv()),
		simple_∀_tac,
		∧_tac,
		⇒_T ttac,
		t_tac,
		concl_in_asms_tac]
	ORELSE_T
		fail_with_tac "STRIP_CONCL_T" 28003
		[fn () => string_of_term(snd gl)])
	gl
);
=TEX
=SML
val (⦏strip_concl_conv⦎ : CONV) = (fn (tm : TERM) =>
	current_ad_sc_conv() tm
	handle (Fail _) =>
	term_fail "strip_concl_conv" 28003 [tm]
);
val (⦏strip_asm_conv⦎ : CONV) = (fn (tm : TERM) =>
	current_ad_st_conv() tm
	handle (Fail _) =>
	term_fail "strip_asm_conv" 28003 [tm]
);
=TEX
=SML
val ⦏STRIP_T⦎ : THM_TACTIC -> TACTIC = STRIP_CONCL_T;
=TEX
=SML
val ⦏strip_asm_tac⦎ : THM_TACTIC =
	REPEAT_TTCL STRIP_THM_THEN check_asm_tac;
=TEX
=SML
val  ⦏strip_concl_tac⦎ : TACTIC = (fn gl =>
	STRIP_CONCL_T strip_asm_tac gl
	handle complaint =>
	pass_on complaint "STRIP_CONCL_T" "strip_tac");
val  ⦏strip_tac⦎ : TACTIC = strip_concl_tac;
=TEX
\subsection{Some Tautologies}
We now give a local context using $⇔\_thm$:
=SML
val ⦏local_strip_thm_thens⦎ : EQN_CXT =
	[ (thm_eqn_cxt ⇔_thm) ];
=TEX
=SML
val ⦏local_strip_concl_ts⦎ : EQN_CXT =
	[ (thm_eqn_cxt ⇔_thm) ];
=TEX
We give some temporary settings to ``propositions'',
before its final setting in this document.
=SML
val _ = new_pc ⦏"'propositions"⦎;
val _ = set_st_eqn_cxt local_strip_thm_thens "'propositions";
val _ = set_sc_eqn_cxt local_strip_concl_ts "'propositions";
val _ = set_pc "'propositions";
=TEX
We now have some machinery in place with which we can prove the tautologies
need for the tacticals which support $strip\_tac$:
=SML
val ⦏⇒_thm⦎ = save_thm("⇒_thm", tac_proof( ([], ⌜∀a b⦁(a ⇒ b) ⇔ (¬a ∨ b)⌝),
	REPEAT strip_tac
	THEN CASES_T ⌜a:BOOL⌝ asm_tac THEN_LIST
	[∨_right_tac THEN all_asm_ante_tac THEN REPEAT strip_tac,
	 ∨_left_tac THEN all_asm_ante_tac THEN REPEAT strip_tac]));
=TEX
=SML
val ⦏¬_¬_thm⦎ = save_thm("¬_¬_thm", tac_proof( ([], ⌜∀a⦁¬ ¬a ⇔ a⌝),
		REPEAT strip_tac THEN_LIST
	[accept_tac (¬_¬_elim (asm_rule ⌜¬¬a⌝)),
	 accept_tac (¬_¬_intro (asm_rule ⌜a:BOOL⌝))]));
=TEX
=SML
val ⦏¬_∨_thm⦎ = save_thm("¬_∨_thm", tac_proof( ([], ⌜∀a b⦁¬ (a ∨ b) ⇔ (¬a ∧ ¬b)⌝),
	conv_tac(MAP_C (simple_eq_match_conv ¬_thm)) THEN
	REPEAT strip_tac THEN_LIST
	[LEMMA_T ⌜a ∨ b⌝(accept_tac o ⇒_mp_rule (asm_rule ⌜a ∨ b ⇒ F⌝)) THEN
		∨_left_tac THEN accept_tac(asm_rule ⌜a:BOOL⌝),
	LEMMA_T ⌜a ∨ b⌝(accept_tac o ⇒_mp_rule (asm_rule ⌜a ∨ b ⇒ F⌝)) THEN
		∨_right_tac THEN accept_tac(asm_rule ⌜b:BOOL⌝),
	accept_tac(⇒_mp_rule (asm_rule ⌜a ⇒ F⌝) (asm_rule ⌜a:BOOL⌝)),
	accept_tac(⇒_mp_rule (asm_rule ⌜b ⇒ F⌝) (asm_rule ⌜b:BOOL⌝))] ));
=TEX
The following is not asked for in the detailed design (because it does
not fit into any general framework, or at least we do not provide
the general framework it would fit into --- namely conversion of propositional
terms into the fragment of propositional calculus generated by implication
and falsity (or negation)).

The proof only works for $strip\_tac$ without additional
equational context material.
=SML
val ⦏∨_¬_thm⦎ = tac_proof( ([], ⌜∀a b⦁(a ∨ ¬b) ⇔ (b ⇒ a)⌝),
	REPEAT strip_tac THEN
	CASES_T ⌜a:BOOL⌝ asm_tac THEN_LIST
	[∨_left_tac THEN all_asm_ante_tac THEN REPEAT strip_tac,
	∨_right_tac THEN accept_tac(modus_tollens_rule(asm_rule⌜b ⇒ a⌝)(asm_rule⌜¬a⌝))]);
=TEX
=SML
val ⦏¬_∧_thm⦎ = ( (* ⊢ ¬(a ∧ b) ⇔ (¬a ∨ ¬b) *)
save_thm("¬_∧_thm",
let	val thm1 = tac_proof( ([], ⌜¬(a ∧ b) ⇔ (a ⇒ ¬b)⌝),
	conv_tac(MAP_C (simple_eq_match_conv ¬_thm))
	THEN REPEAT strip_tac
	THEN_LIST
	[CASES_T⌜a:BOOL⌝ asm_tac
		THEN LEMMA_T ⌜a ∧ b⌝
		(fn th1 => accept_tac(⇒_mp_rule(asm_rule⌜a ∧ b ⇒ F⌝)(asm_rule⌜a ∧ b⌝)))
		THEN REPEAT strip_tac,
		accept_tac(⇒_mp_rule(⇒_mp_rule(asm_rule⌜a ⇒ b ⇒ F⌝)
					(asm_rule⌜a:BOOL⌝))(asm_rule⌜b:BOOL⌝))]);
		val thm2 = tac_proof( ([], ⌜(a ⇒ ¬b) ⇔ (¬a ∨ ¬b)⌝),
	conv_tac(MAP_C(FIRST_C(map simple_eq_match_conv
	[⇒_thm, ¬_¬_thm, ⇔_t_intro(refl_conv⌜x⌝)])))
	THEN t_tac);
in	list_simple_∀_intro[⌜a:BOOL⌝, ⌜b:BOOL⌝](eq_trans_rule thm1 thm2)
end));
=TEX
=SML
val ⦏¬_⇒_thm⦎ = save_thm("¬_⇒_thm", tac_proof( ([], ⌜∀a b⦁¬(a ⇒ b) ⇔ (a ∧ ¬b)⌝),
	conv_tac(TOP_MAP_C(FIRST_C (map simple_eq_match_conv
		[⇒_thm, ¬_∨_thm, ¬_¬_thm] )))
		THEN REPEAT strip_tac));
=TEX
=SML
val ⦏¬_⇔_thm⦎ = (* ⊢ ∀ a b ⦁ ¬ (a ⇔ b) ⇔ a ∧ ¬ b ∨ b ∧ ¬ a  *)
		save_thm("¬_⇔_thm",
		list_simple_∀_intro[⌜a:BOOL⌝, ⌜b:BOOL⌝]
		((RAND_C(simple_eq_match_conv ⇔_thm)
		THEN_C (simple_eq_match_conv ¬_∧_thm)
		THEN_C (MAP_C(simple_eq_match_conv ¬_⇒_thm)))
		⌜¬(a ⇔ b)⌝));
=TEX
=SML
val ⦏¬_f_thm⦎ = save_thm("¬_f_thm", tac_proof( ([], ⌜¬F ⇔ T⌝),
	⇔_t_tac THEN conv_tac (simple_eq_match_conv ¬_thm) THEN strip_tac));
=TEX
=SML
val ⦏¬_if_thm⦎ = (* ⊢ ∀ a b c⦁ ¬(if a then b else c) ⇔ (if a then ¬b else ¬c)  *)
	save_thm("¬_if_thm",
	list_simple_∀_intro[⌜a:BOOL⌝, ⌜b:BOOL⌝, ⌜c:BOOL⌝]
		(app_if_conv ⌜¬(if a then b else c)⌝));
=TEX
\subsection{Additional Conversions, Tactics and Tacticals}
\subsubsection{Concerning ∃$_1$}
=SML
val ⦏simple_∃⋎1_conv⦎ : CONV = (fn tm =>
	let	val (x, b) = dest_simple_∃⋎1 tm
		val s1 = ⇒_intro tm (simple_∃⋎1_elim (asm_rule tm));
		val y = variant (x :: frees b) x;
		val conj = mk_∧(b, mk_∀(y, mk_⇒(var_subst[(y, x)]b, mk_eq(y, x))));
		val exi = mk_∃(x, conj)
		val s2 = asm_rule conj;
		val s3 = simple_∃⋎1_intro (∧_left_elim s2) (∧_right_elim s2)
		val s4 = simple_∃_elim x (asm_rule exi) s3
		val s5 = ⇒_intro exi s4;
	in	⇔_intro s1 s5
	end handle ex => pass_on ex "dest_simple_∃⋎1" "simple_∃⋎1_conv"
);
val ⦏¬_simple_∃⋎1_conv⦎ : CONV = (fn tm =>
	((RAND_C simple_∃⋎1_conv THEN_C ¬_simple_∃_conv) tm)
	handle  Fail _ => term_fail "¬_simple_∃⋎1_conv" 28091 [tm]
);
=TEX
\subsubsection{Concerning ¬}
This requires proper testing against a ``try along list until fail''.
=SML
local
	val c = eqn_cxt_conv ((map thm_eqn_cxt
		[¬_¬_thm, ¬_∧_thm, ¬_∨_thm, ¬_⇒_thm,
		 ¬_⇔_thm, ¬_if_thm, ¬_t_thm, ¬_f_thm]) @
		[(⌜¬(∀ x ⦁ y)⌝, ¬_simple_∀_conv),
		(⌜¬(∃ x ⦁ y)⌝, ¬_simple_∃_conv),
		(⌜¬(∃⋎1 x ⦁ y)⌝, ¬_simple_∃⋎1_conv)]);
in
val ⦏simple_¬_in_conv⦎ : CONV = (fn tm =>
	c tm
	handle complaint =>
	divert complaint "eqn_cxt_conv" "simple_¬_in_conv" 28131
		[fn () => string_of_term tm]
);
end;
=TEX
=IGN
The following is a ``try along list until fail''
=IGN
val simple_¬_in_conv : CONV = FIRST_C(
		map simple_eq_match_conv
		[¬_¬_thm, ¬_∧_thm, ¬_∨_thm, ¬_⇒_thm,
		 ¬_⇔_thm, ¬_if_thm, ¬_t_thm, ¬_f_thm]
	@	[¬_simple_∀_conv, ¬_simple_∃_conv, ¬_simple_∃⋎1_conv])
	ORELSE_C (fn tm => term_fail "simple_¬_in_conv" 28131 [tm]);
=IGN
On the following list of test cases the $TRY\_C$ of the net version seems to run at twice the speed.

val test_simple_¬_in_conv = [
	⌜¬ (¬ a)⌝,
	⌜¬(a ∧ b)⌝,
	⌜¬(a ∨ b)⌝,
	⌜¬(a ⇒ b)⌝,
	⌜¬(a ⇔ b)⌝,
	⌜¬(if a then b else c)⌝,
	⌜¬ T⌝,
	⌜¬ F⌝,
	⌜¬(∀ x ⦁ f x y)⌝,
	⌜¬(∃ x ⦁ f x y)⌝,
	⌜¬(∃⋎1 x ⦁ f x y)⌝,
	⌜x⌝,
	⌜x ∧ y⌝,
	⌜¬ a⌝,
	⌜¬ (∀ (x,y) ⦁ x ∧ y)⌝];

Upon the following the net version is 33 times faster.
let
	val tm = ⌜f (g x y)⌝
in
(map (TRY_C simple_¬_in_conv) (map (fn _ => tm) (interval 1 1000));())
end;

=SML
val ⦏SIMPLE_¬_IN_THEN⦎ : THM_TACTICAL = (fn ttac => fn thm =>
	(ttac(⇔_mp_rule(simple_¬_in_conv(concl thm))thm))
	handle complaint =>
	divert complaint "simple_¬_in_conv" "SIMPLE_¬_IN_THEN" 28026 []
);
=TEX
=SML
val ⦏simple_¬_in_tac⦎ : TACTIC = (fn gl =>
	((conv_tac simple_¬_in_conv) gl)
	handle complaint =>
	divert complaint "simple_¬_in_conv" "simple_¬_in_tac" 28025 []
);
=TEX
\subsubsection{Concerning ⇒}
=SML
val ⦏⇒_THEN⦎ : THM_TACTICAL = (fn ttac => fn thm =>
	let	val (t1, t2) = dest_⇒ (concl thm)
	in	ttac(⇔_mp_rule(list_simple_∀_elim[t1, t2]⇒_thm)thm)
	end	handle ex =>
	divert ex "dest_⇒" "⇒_THEN" 28054 [fn () => string_of_thm thm]
);
=TEX
\subsubsection{Concerning ∨}
=SML
val a_∨_¬b_thm = ∨_¬_thm;

val ¬a_∨_b_thm = list_simple_∀_intro[⌜a:BOOL⌝, ⌜b:BOOL⌝]
	(eq_sym_rule(all_simple_∀_elim ⇒_thm));

val a_∨_b_thm = (
	conv_rule(MAP_C(simple_eq_match_conv ¬_¬_thm))
	(list_simple_∀_intro[⌜a:BOOL⌝, ⌜b:BOOL⌝]
	(eq_sym_rule(list_simple_∀_elim[⌜¬a⌝, ⌜b:BOOL⌝]⇒_thm)))
);

local
val ⦏∨_conv⦎ = FIRST_C(map simple_eq_match_conv
	[a_∨_¬b_thm,
	¬a_∨_b_thm,
	a_∨_b_thm]);
in
val ⦏∨_tac⦎ = conv_tac(∨_conv);
end;
=TEX
\subsubsection{Concerning if...then...else}
=GFT
⊢ ∀ a t1 t2⦁ (if a then t1 else t2) ⇔ (a ⇒ t1) ∧ (¬ a ⇒ t2)
=TEX
=SML
val ⦏local_if_thm⦎ =
let	val s1 = asm_rule ⌜(a ⇒ t1) ∧ (¬ a ⇒ t2)⌝;
	val s2 = ∧_left_elim s1;
	val s3 = ∧_right_elim s1;
	val s4 = undisch_rule s2;
	val s5 = undisch_rule s3;
	val s6 = if_intro ⌜a:BOOL⌝ s4 s5;
	val s7 = all_⇒_intro s6;
	val s8 = asm_rule ⌜if a then t1 else t2: BOOL⌝;
	val s9 = if_then_elim s8;
	val s10 = if_else_elim s8;
	val s11 = ∧_intro s9 s10;
	val s12 = all_⇒_intro s11;
	val s13 = ⇔_intro s12 s7;
	val s14 = all_∀_intro s13;
in	s14
end;
=TEX
=SML
local	val s1 = refl_conv ⌜x:'a⌝;
	val s2 = ⇔_t_intro s1;
	val s3 = app_fun_rule ⌜$¬⌝ s2;
	val s4 = eq_trans_rule s3 ¬_t_thm;
in
val ⦏local_eq_thm1⦎ = simple_∀_intro ⌜x:'a⌝ s2;
val ⦏local_eq_thm2⦎ = simple_∀_intro ⌜x:'a⌝ s4;
end;
=TEX
\section{Stripping Contexts}
We could expand out the call to $simple\_¬\_in\_conv$,
rather than have a two stage discrimination net.
Now extend the build proof contexts (which will be completed and commited in
\cite{DS/FMU/IED/IMP076}).
The following match the final settings of the relevent fields of
supplied proof context
``propositions''.
=SML
val ⦏propositions_st_eqn_cxt⦎ : EQN_CXT =
	[	(thm_eqn_cxt ⇒_thm),
		(thm_eqn_cxt ⇔_thm),
		(thm_eqn_cxt local_if_thm),
		(thm_eqn_cxt local_eq_thm1),
		(thm_eqn_cxt local_eq_thm2),
		(⌜∃⋎1 x ⦁ p⌝, simple_∃⋎1_conv)];
=TEX
=SML
val ⦏propositions_sc_eqn_cxt⦎ : EQN_CXT =
	[	(thm_eqn_cxt ⇔_thm),
		(thm_eqn_cxt a_∨_¬b_thm),
		(thm_eqn_cxt ¬a_∨_b_thm),
		(thm_eqn_cxt a_∨_b_thm),
		(thm_eqn_cxt local_eq_thm1),
		(thm_eqn_cxt local_eq_thm2),
		(thm_eqn_cxt local_if_thm)];
=TEX
Now we can set the proof context with its final values for this document.
=SML
val _ = set_st_eqn_cxt propositions_st_eqn_cxt "'propositions";
val _ = set_sc_eqn_cxt propositions_sc_eqn_cxt "'propositions";
=TEX
Now start the build version of proof context ``simple$\-\_$abstractions'', giving something that matched the final
``simple$\-\_$abstractions'' in the given fields.
=SML
val _ = new_pc ⦏"'simple_abstractions"⦎;
val _ = set_st_eqn_cxt [(⌜¬ x⌝, simple_¬_in_conv)] "'simple_abstractions";
val _ = set_sc_eqn_cxt [(⌜¬ x⌝, simple_¬_in_conv)] "'simple_abstractions";
=TEX
Now set the combination.
=SML
val _ = set_merge_pcs ["'propositions",
		"'simple_abstractions"];
=TEX
\subsection{Concerning $if ... then ... else ...$}
=SML
val ⦏if_thm⦎ = save_thm("if_thm",
	tac_proof( ([],
	⌜∀ a b c ⦁ (if a then b else c) ⇔
		(a ∧ b ∨ ¬ a ∧ c)⌝),
	REPEAT strip_tac));
=TEX
\section{TAUTOLOGY PROVER}
The tautology prover functions as a limited $strip\_tac$,
but is not an instantiation of it.
The following could perhaps be speeded up by further use of nets.
=SML
local
val ⦏taut_strip_thm_conv⦎ : CONV = (
	eqn_cxt_conv(
	map thm_eqn_cxt
	[¬_¬_thm, ¬_∧_thm, ¬_∨_thm, ¬_⇒_thm,
	 ¬_⇔_thm, ¬_t_thm, ¬_f_thm, ¬_if_thm,
	⇒_thm, ⇔_thm, local_if_thm
]));

val ⦏taut_strip_concl_conv⦎ : CONV = (
	eqn_cxt_conv(
	map thm_eqn_cxt
	[¬_¬_thm, ¬_∧_thm, ¬_∨_thm, ¬_⇒_thm,
	 ¬_⇔_thm, ¬_t_thm, ¬_f_thm, ¬_if_thm,
	⇔_thm, local_if_thm,
	a_∨_¬b_thm, ¬a_∨_b_thm, a_∨_b_thm]
));

val ⦏taut_strip_thm_thens⦎ : THM_TACTICAL list = [
	∧_THEN,
	∨_THEN,
	CONV_THEN taut_strip_thm_conv
];

val ⦏taut_strip_concl_ts⦎ : (THM_TACTIC -> TACTIC) list = [
	fn _ => ∧_tac,
	⇒_T,
	fn _ => t_tac,
	fn _ => conv_tac taut_strip_concl_conv,
	fn _ => concl_in_asms_tac
];

val ⦏taut_strip_tac⦎ : TACTIC = (
	FIRST
	(map(fn t => t(REPEAT_TTCL (FIRST_TTCL taut_strip_thm_thens)
			check_asm_tac))
		taut_strip_concl_ts)
);
in
val ⦏simple_taut_tac⦎ : TACTIC = (fn gl =>
	case REPEAT taut_strip_tac gl of
		done as ([], _) => done
	|	_ => fail "simple_taut_tac" 28121 []
);
end;
=TEX
The above should be properly compared to an implementation
that doesn't use nets, and one that tries to use them harder.
=IGN
The following is written avoiding nets:
local
val ⦏taut_¬_in_conv⦎ : CONV = FIRST_C(
		map simple_eq_match_conv
		[¬_¬_thm, ¬_∧_thm, ¬_∨_thm, ¬_⇒_thm,
		 ¬_⇔_thm, ¬_t_thm, ¬_f_thm, ¬_if_thm]);
val ⦏TAUT_¬_IN_THEN⦎ : THM_TACTICAL = (fn ttac => fn thm =>
	ttac(⇔_mp_rule(taut_¬_in_conv(concl thm))thm)
);
val ⦏taut_strip_thm_thens⦎ : THM_TACTICAL list =
	[	∧_THEN,
		⇒_THEN,
		∨_THEN,
		TAUT_¬_IN_THEN,
		⇔_THEN,
		IF_THEN];
val ⦏taut_strip_concl_ts⦎ : (THM_TACTIC -> TACTIC) list =
	[fn _ => ∧_tac,
		⇒_T,
		⇔_T,
		fn _ => conv_tac taut_¬_in_conv,
		fn _ => ∨_tac,
		IF_T,
		fn _ => t_tac,
		fn _ => concl_in_asms_tac];

val ⦏taut_strip_tac⦎ : TACTIC =
	FIRST
	(map(fn t => t(REPEAT_TTCL (FIRST_TTCL taut_strip_thm_thens) check_asm_tac))
		taut_strip_concl_ts);
in
val ⦏simple_taut_tac1⦎ : TACTIC = (fn gl =>
	case REPEAT taut_strip_tac gl of
		done as ([], _) => done
	|	_ => fail "simple_taut_tac1" 28121 []
);
end;
On the tautologies:

val tm = ⌜(a ∧ b ∧ c ∧ d ⇒ e) ⇔ (a ⇒b ⇒ c ⇒ d ⇒ e)⌝;
val tm1 = ⌜(if a then t1 else t2) ∧ (if a then t3 else t4) ⇔ if a then (t1 ∧ t3) else (t2 ∧ t4)⌝;

the net version runs in roughly a third of the time
of the above.
=TEX
\section{TACTICS FOR THE PREDICATE CALCULUS 2}
We now give the remaining tactics.
\subsection{Concerning $F$}
=SML
fun  ⦏CONTR_T⦎ (thmtac : THM -> TACTIC) : TACTIC = (fn gl as (seqasms, conc) =>
	let	val ¬_conc = mk_¬ conc;
		val (sgs, pf) =  (thmtac (asm_rule ¬_conc)) (seqasms, mk_f);
		fun rule thm = (
			if ¬_conc term_mem (asms thm)
			then c_contr_rule conc thm
			else contr_rule conc thm
		);
	in	(sgs, rule o pf)
	end
	handle ex => divert ex "mk_¬" "CONTR_T" 28027 []
);
=TEX
=SML
val ⦏contr_tac⦎ : TACTIC = (fn gl =>
	(CONTR_T strip_asm_tac gl)
	handle ex => pass_on ex "CONTR_T" "contr_tac"
);
=TEX
\subsection{Concerning ¬}
=SML
fun  ⦏¬_elim_tac⦎ (tm : TERM) : TACTIC = (
	if not(type_of tm =: BOOL)
	then term_fail "¬_elim_tac" 28022 [tm]
	else	(fn (seqasms, conc) =>
			([(seqasms, tm), (seqasms, mk_¬ tm)],
			 fn [th1, th2] => ¬_elim conc th1 th2
			 |   _ => bad_proof "¬_elim_tac" )
		)
);
=TEX
=SML
fun  ⦏¬_T2⦎ (t1 : TERM)
	(thmtac1 : THM -> TACTIC) (thmtac2 : THM -> TACTIC)
		: TACTIC = (fn gl as (seqasms, conc) =>
	let	val t2 = (dest_¬ conc)
			handle Fail _ => fail "¬_T2" 28023 [];
		val ¬_t1 = (mk_¬ t1)
			handle Fail _ => term_fail "¬_T2" 28022 [t1];
		val (sgs1, pf1) = (thmtac1 (asm_rule t2)) (seqasms, t1);
		val (sgs2, pf2) = (thmtac2 (asm_rule t2)) (seqasms, ¬_t1);
		fun rule [thm1, thm2] = ¬_intro t2 thm1 thm2
		|   rule _ = bad_proof "¬_T2";
	in	(sgs1 @ sgs2, rule o map_shape[(pf1, length sgs1),
			(pf2, length sgs2)])
	end	
);
=TEX
=SML
fun  ⦏¬_T⦎ (t1 : TERM) (thmtac : THM -> TACTIC) : TACTIC = (fn thm =>
	(¬_T2 t1 thmtac thmtac thm)
	handle ex => pass_on ex "¬_T2" "¬_T"
);
=TEX
=SML
fun ⦏¬_tac⦎ (t : TERM) : TACTIC = (fn gl =>
	(¬_T t strip_asm_tac gl)
	handle ex => pass_on ex "¬_T" "¬_tac"
);
=TEX
\subsection{Concerning ∨}
=SML
val ⦏∨_comm_thm⦎ : THM = tac_proof(([], ⌜∀a b⦁a ∨ b ⇔ b ∨ a⌝),
	REPEAT strip_tac);
=TEX
=SML
val ⦏swap_∨_tac⦎ : TACTIC = (fn gl =>
	((conv_tac(simple_eq_match_conv ∨_comm_thm)) gl)
	handle ex => divert ex "simple_eq_match_conv" "swap_∨_tac" 28041 []
);
=TEX
=SML
fun ⦏cases_tac⦎ (tm : TERM) : TACTIC = (fn gl =>
	(CASES_T tm strip_asm_tac gl)
	handle ex => pass_on ex "CASES_T" "cases_tac"
);
=TEX
\subsection{Concerning ⇒}
=SML
val ⦏⇒_tac⦎ : TACTIC = (fn gl =>
	(⇒_T strip_asm_tac gl)
	handle ex => pass_on ex "⇒_T" "⇒_tac"
);
=TEX
\subsection{Concerning ⇔}
=SML
fun ⦏⇔_THEN2⦎ (ttac1 : THM -> TACTIC) (ttac2 : THM -> TACTIC)
						: THM -> TACTIC = (fn thm =>
	let	val (thm1, thm2) = ⇔_elim thm;
	in	ttac1 thm1 THEN ttac2 thm2
	end
	handle ex => divert ex "⇔_elim" "⇔_THEN2" 28062
		[fn () => string_of_thm thm]
);
=TEX
=SML
fun ⦏⇔_THEN⦎ (ttac : THM -> TACTIC) : THM -> TACTIC = (fn thm =>
	(⇔_THEN2 ttac ttac thm)
	handle ex => pass_on ex "⇔_THEN2" "⇔_THEN"
);
=TEX
=SML
fun ⦏⇔_T2⦎ (ttac1 : THM -> TACTIC) (ttac2 : THM -> TACTIC)
						: TACTIC = (fn (seqasms, conc) =>
	let	val (t1, t2) = dest_⇔ conc;
		val (sgs1, pf1) = ttac1 (asm_rule t1) (seqasms, t2);
		val (sgs2, pf2) = ttac2 (asm_rule t2) (seqasms, t1);
		fun rule [thm1, thm2] = ⇔_intro (⇒_intro t1 thm1) (⇒_intro t2 thm2)
		|   rule _ = bad_proof "⇔_T2";
	in	(sgs1 @ sgs2, rule o map_shape[(pf1, length sgs1), (pf2, length sgs2)])
	end
	handle ex => divert ex "dest_⇔" "⇔_T2" 28061 []
);
=TEX
=SML
fun  ⦏⇔_T⦎ (ttac : THM -> TACTIC) : TACTIC = (fn thm =>
	(⇔_T2 ttac ttac thm)
	handle ex => pass_on ex "⇔_T2" "⇔_T"
);
=TEX
=SML
val ⦏⇔_tac⦎ : TACTIC = (fn gl =>
	(⇔_T strip_asm_tac gl)
	handle ex => pass_on ex "⇔_T" "⇔_tac"
);
=TEX
\subsection{Concerning $if \ldots then \ldots else \ldots$}
=SML
fun ⦏IF_THEN2⦎ (ttac1 : THM -> TACTIC) (ttac2 : THM -> TACTIC)
						: THM -> TACTIC = (fn thm =>
	let	val thm1 = if_then_elim thm;
		val thm2 = if_else_elim thm;
	in	ttac1 thm1 THEN ttac2 thm2
	end
	handle ex =>
	pass_on ex "if_then_elim" "IF_THEN2"
);
=TEX
=SML
fun ⦏IF_THEN⦎ (ttac : THM -> TACTIC) : THM -> TACTIC = (fn thm =>
	(IF_THEN2 ttac ttac thm)
	handle ex => pass_on ex "IF_THEN2" "IF_THEN"
);
=TEX
=SML
fun ⦏IF_T2⦎ (ttac1 : THM -> TACTIC) (ttac2 : THM -> TACTIC)
		: TACTIC = (fn (seqasms, conc) =>
	let	val (a, tt, et) = dest_if conc;
		val (tsgs, tpf) = ttac1 (asm_rule a) (seqasms, tt);
		val (esgs, epf) = ttac2 (asm_rule (mk_¬ a)) (seqasms, et);
		fun rule [thm1, thm2] = if_intro a thm1 thm2
		|   rule _ = bad_proof "¬IF_T2";

	in	(tsgs @ esgs, rule o map_shape[(tpf, length tsgs), (epf, length esgs)])
	end handle ex => divert ex "dest_if" "IF_T2" 28071 []
);
=TEX
=SML
fun  ⦏IF_T⦎ (ttac : THM -> TACTIC) : TACTIC = (fn thm =>
	(IF_T2 ttac ttac thm)
	handle ex => pass_on ex "IF_T2" "IF_T"
);
=TEX
=SML
val ⦏if_tac⦎ : TACTIC = (fn gl =>
	(IF_T strip_asm_tac gl)
	handle ex => pass_on ex "IF_T" "if_tac"
);
=TEX
=TEX

=SML
fun ⦏IF_CASES_T⦎ (ttac : THM -> TACTIC) : TACTIC = (fn gl as (_, tm) =>
	let	fun find_conds acc bvs t = (
			let	val (c, t, e) = dest_if t;
				val acc' = find_conds [] bvs c;
				val acc'' =
					case acc' of
						[] => (
							if any (frees c) (fn v => v mem bvs)
							then acc
							else acc term_grab c
					) |	cs => cs term_union acc;
			in	find_conds (find_conds acc'' bvs t) bvs e
			end	handle Fail _ =>
				let	val (f, x) = dest_app t;
				in	find_conds (find_conds acc bvs f) bvs x
				end	handle Fail _ =>
				let	val (bv, b) = dest_simple_λ t;
				in	find_conds acc (bv::bvs) b
				end	handle Fail _ => acc
		);
		fun case_split_tac c = (
			CASES_T c ttac
		);
	in	case find_conds [] [] tm of
			cs as (_::_) => MAP_EVERY case_split_tac cs
		|	[] => fail "IF_CASES_T" 28072 []
	end	gl
);
=TEX
=SML
val ⦏if_cases_tac⦎ : TACTIC = (fn gl =>
	IF_CASES_T strip_asm_tac gl
	handle complaint =>
	pass_on complaint "IF_CASES_T" "if_cases_tac");
=TEX
\subsection{Concerning ∃$_1$}
=SML
fun ⦏simple_∃⋎1_tac⦎ (tm : TERM) : TACTIC = (fn (seqasms, conc) =>
	let	val (x, b) = dest_simple_∃⋎1 conc;
		val x' = variant (frees tm) x;
		val b' = var_subst[(x',x)]b;
		val u = mk_∀(x', mk_⇒(b', mk_eq(x', tm)))
	in
		([(seqasms, var_subst[(tm, x')] b'), (seqasms, u)],
		(fn [th1, th2] => simple_∃⋎1_intro th1 th2
		| _ => bad_proof "simple_∃⋎1_tac"))
	end
	handle ex =>
	case area_of ex of
		"dest_simple_∃⋎1" => fail "simple_∃⋎1_tac" 28101 []
	|	"mk_eq" => term_fail "simple_∃⋎1_tac" 28092 [tm]
	|	_ => raise ex
);

fun ⦏SIMPLE_∃⋎1_THEN⦎ (ttac : THM -> TACTIC) = (fn thm =>
	(SIMPLE_∃_THEN ttac (simple_∃⋎1_elim thm))
	handle ex => divert ex "simple_∃⋎1_elim"
		"SIMPLE_∃⋎1_THEN" 28102
		[fn () => string_of_thm thm]
);
=TEX
\subsection{Swapping Assumptions and Conclusions}
=SML
local
	val thm1 = tac_proof(([], ⌜∀ f ⦁ (f ⇒ F) ⇔ ¬ f⌝),
		REPEAT strip_tac);
	val thm2 = tac_proof(([], ⌜∀ f ⦁ ((¬ f) ⇒ F) ⇔ f⌝),
		REPEAT strip_tac);
	val thm3 = tac_proof(([],
		⌜∀ f g ⦁ (f ⇒ g) ⇔ ((¬ f) ∨ g)⌝),
		REPEAT strip_tac);
	val thm4 = tac_proof(([],
		⌜∀ f g ⦁ ((¬ f) ⇒ g) ⇔ (f ∨ g)⌝),
		REPEAT strip_tac);
	val ⇒_F_conv = (fn ntm =>
		let	val tm = fst(dest_⇒ ntm);
		in
			if is_¬ tm
			then simple_∀_elim(dest_¬ tm) thm2
			else simple_∀_elim tm thm1
		end);
	fun local_conv (tm : TERM) : THM = (
	let	val (d1,d2) = dest_⇒ tm;
	in
		if d2 =$ mk_f
		then ⇒_F_conv tm
		else ((fn _ => if is_¬ d1
		then list_simple_∀_elim[dest_¬ d1, d2] thm4
		else list_simple_∀_elim[d1, d2] thm3)
			THEN_TRY_C (RAND_C local_conv)) tm
	end);
	fun local_tac ([] : THM list) : TACTIC = id_tac
	| local_tac thms = (
	let	val rthms = rev thms;
	in
		MAP_EVERY ante_tac rthms
		THEN conv_tac local_conv
	end);
	
	
in	
=TEX
=SML		
fun  ⦏SWAP_ASM_CONCL_T⦎ (asm:TERM) (thmtac:THM -> TACTIC)
	: TACTIC = (
fn gl as (seqasms, conc) =>
let	val ¬_conc = mk_¬ conc;
	val (sgs, pf) =  ((asm_ante_tac asm THEN
		conv_tac ⇒_F_conv THEN
		thmtac (asm_rule ¬_conc)) (seqasms, mk_f))
		handle complaint =>
		pass_on complaint "asm_ante_tac" "SWAP_ASM_CONCL_T";
	fun rule thm = (
		if ¬_conc term_mem (asms thm)
		then c_contr_rule conc thm
		else contr_rule conc thm
	);
in	(sgs, rule o pf)
end
handle complaint =>
divert complaint "mk_¬" "SWAP_ASM_CONCL_T" 28027 []
);
=TEX
=SML		
fun  ⦏LIST_SWAP_ASM_CONCL_T⦎ ([]:TERM list) (thmtac:THM -> TACTIC)
	: TACTIC = (
	CONTR_T thmtac
) | LIST_SWAP_ASM_CONCL_T lasms thmtac = (
fn gl as (seqasms, conc) =>
let	val ¬_conc = mk_¬ conc;
	val (sgs, pf) =  ((list_asm_ante_tac lasms THEN
		conv_tac (TRY_C local_conv) THEN
		thmtac (asm_rule ¬_conc)) (seqasms, mk_f))
		handle complaint =>
		pass_on complaint "list_asm_ante_tac" "LIST_SWAP_ASM_CONCL_T";
	fun rule thm = (
		if ¬_conc term_mem (asms thm)
		then c_contr_rule conc thm
		else contr_rule conc thm
	);
in	(sgs, rule o pf)
end
handle complaint =>
divert complaint "mk_¬" "LIST_SWAP_ASM_CONCL_T" 28027 []
);
=TEX
=SML
fun  ⦏SWAP_NTH_ASM_CONCL_T⦎ (n:int) (thmtac:THM -> TACTIC) : TACTIC = (
fn gl as (seqasms, conc) =>
let	val ¬_conc = mk_¬ conc;
	val (sgs, pf) =  (((DROP_NTH_ASM_T n ante_tac) THEN
		conv_tac ⇒_F_conv THEN
		thmtac (asm_rule ¬_conc)) (seqasms, mk_f))
		handle complaint =>
		pass_on complaint "DROP_NTH_ASM_T" "SWAP_NTH_ASM_CONCL_T";
	fun rule thm = (
		if ¬_conc term_mem (asms thm)
		then c_contr_rule conc thm
		else contr_rule conc thm
	);
in	(sgs, rule o pf)
end
handle complaint =>
divert complaint "mk_¬" "SWAP_NTH_ASM_CONCL_T" 28027 []
);
=TEX
=SML		
fun ⦏LIST_SWAP_NTH_ASM_CONCL_T⦎ ([]:int list) (thmtac:THM -> TACTIC)
	: TACTIC = (
	CONTR_T thmtac
) | LIST_SWAP_NTH_ASM_CONCL_T ns thmtac = (
fn gl as (seqasms, conc) =>
let	val ¬_conc = mk_¬ conc;
	val (sgs, pf) =  ((LIST_DROP_NTH_ASM_T ns local_tac THEN
		thmtac (asm_rule ¬_conc)) (seqasms, mk_f))
		handle complaint =>
		pass_on complaint "LIST_DROP_NTH_ASM_T"
			"LIST_SWAP_NTH_ASM_CONCL_T";
	fun rule thm = (
		if ¬_conc term_mem (asms thm)
		then c_contr_rule conc thm
		else contr_rule conc thm
	);
in	(sgs, rule o pf)
end
handle complaint =>
divert complaint "mk_¬" "LIST_SWAP_NTH_ASM_CONCL_T" 28027 []
);
=TEX
=SML
end;
=TEX
Now the standard forms:
=SML
fun ⦏swap_asm_concl_tac⦎ (tm : TERM) : TACTIC = (fn gl =>
	SWAP_ASM_CONCL_T tm strip_asm_tac gl
	handle complaint =>
	pass_on complaint "SWAP_ASM_CONCL_T" "swap_asm_concl_tac"
);
fun ⦏swap_nth_asm_concl_tac⦎ (n : int) : TACTIC = (fn gl =>
	SWAP_NTH_ASM_CONCL_T n strip_asm_tac gl
	handle complaint =>
	pass_on complaint "SWAP_NTH_ASM_CONCL_T" "swap_nth_asm_concl_tac"
);
fun ⦏list_swap_asm_concl_tac⦎ (tml : TERM list) : TACTIC = (fn gl =>
	LIST_SWAP_ASM_CONCL_T tml strip_asm_tac gl
	handle complaint =>
	pass_on complaint "LIST_SWAP_ASM_CONCL_T" "list_swap_asm_concl_tac"
);
fun ⦏list_swap_nth_asm_concl_tac⦎ (ns : int list) : TACTIC = (fn gl =>
	LIST_SWAP_NTH_ASM_CONCL_T ns strip_asm_tac gl
	handle complaint =>
	pass_on complaint "LIST_SWAP_NTH_ASM_CONCL_T"
		"list_swap_nth_asm_concl_tac"
);
=TEX
\subsection{Concerning Equations in Assumptions}
=SML
fun ⦏eq_sym_asm_tac⦎ (asm:TERM):TACTIC = (fn gl =>
	(DROP_ASM_T asm
	(strip_asm_tac o conv_rule(ONCE_MAP_C eq_sym_conv)))
	gl
	handle complaint =>
	list_divert complaint "eq_sym_asm_tac"
		[("DROP_ASM_T",9301,[fn () => string_of_term asm]),
		("ONCE_MAP_C",28053,[fn () => string_of_term asm])]
);
=TEX
=SML
fun ⦏eq_sym_nth_asm_tac⦎ (n:int):TACTIC = (fn (asms,cnc) =>
	(DROP_NTH_ASM_T n
	(strip_asm_tac o conv_rule(ONCE_MAP_C eq_sym_conv)))
	(asms,cnc)
	handle complaint =>
	list_divert complaint "eq_sym_nth_asm_tac"
		[("DROP_NTH_ASM_T",9303,[fn () => string_of_int n]),
		("ONCE_MAP_C",28053,[fn () => string_of_term (nth (n-1) asms)])]
);
=TEX

\subsection{$lemma\_tac$}
=SML
fun ⦏lemma_tac⦎ (sg : TERM) : TACTIC = (fn gl =>
	(LEMMA_T sg strip_asm_tac gl)
	handle ex => pass_on ex "LEMMA_T" "lemma_tac"
);
=TEX
\subsection{Automatic Proof Procedures}
=SML
fun ⦏prove_tac⦎ (thms: THM list) :  TACTIC = (
let	val otac = current_ad_pr_tac ()
		handle complaint =>
		pass_on complaint "current_ad_pr_tac" "prove_tac";
	val tac = case otac of Value f => f thms | Nil => fail_tac;
in
	DROP_ASMS_T(fn asms =>
	tac
	THEN MAP_EVERY check_asm_tac (rev asms))
end);
=TEX
=SML
val ⦏prove_∃_tac⦎ : TACTIC = (fn gl =>
	DROP_ASMS_T(fn asms =>
	conv_tac(current_ad_cs_∃_conv ())
	THEN MAP_EVERY check_asm_tac (rev asms)) gl
	handle complaint =>
	pass_on complaint "current_ad_cs_∃_conv" "prove_∃_tac"
);
=TEX

\subsection{End of Structure}
Restore the previous theory:
=SML
val _ = open_theory was_theory;
=TEX
=SML
end; (* of structure Tactics2 *)
open Tactics2;
=TEX
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}




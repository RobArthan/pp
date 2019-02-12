=IGN
********************************************************************************
imp029.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% imp029.doc   ℤ 2002/10/17 16:20:01 1.34 imp029.doc,v
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

\def\Title{Implementation for Tactics III}

\def\AbstractText{}

\def\Reference{DS/FMU/IED/IMP029}

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
%% LaTeX2e port: \TPPtitle{Implementation for Tactics III}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Implementation for Tactics III}
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP029}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{1.34 %
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{2002/10/17 16:20:01 %
%% LaTeX2e port: }}  %% Mandatory field
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.~Blackburn & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{}
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
\item [Issue 1.1 (1991/10/15)]
First draft: place holder for tautology material.
\item [Issue 1.2 (1991/11/12)]
Added rest of material.
\item [Issue 1.3 (1991/11/18)]
Modified $spec\_asm\_tac$, et al.
\item [Issue 1.4 (1991/11/19)]
Reacting to issue 1.5 of \cite{DS/FMU/IED/DTD051}.

\item[Issue 1.5 (1992/01/20), \FormatDate{92/01/20} ] Updated to use new fonts.
\item[Issue 1.6 (1992/01/27)]
Changed working theory.
\item [Issue 1.8 (1992/03/18)(11th March 1992)]
Various minor additions and extensions.
\item [Issue 1.9 (1992/03/18)(18th March 1992)]
Corrected ordering of implementation.
\item [Issue 1.10 (1992/03/26) (26th March 1992)]
Changed to use proof context material of issue 1.13 of \cite{DS/FMU/IED/DTD051}.
\item [Issue 1.11 (1992/03/31) (31st March 1992)]
Added understanding of double negation
to $¬\-\_rewrite\-\_canon$.
\item [Issue 1.12 (1992/04/09) (2nd April 1992)]
Changes required by CR0016.
\item [Issue 1.13 (1992/04/14) (14th April 1992)]
Changes due to CR0017.
\item [Issue 1.14 (1992/05/12) (12th May 1992)]
Changed theory.
\item [Issue 1.15 (1992/05/14) (14th May 1992)]
Tidying up proof contexts.
\item [Issue 1.16 (1992/05/21),1.17 (1992/05/21) (20th May 1992)]
Rearranging build proof contexts.
\item [Issue 1.18 (1992/05/26) (26th May 1992)]
Renamings from version 1.5 of DS/FMU/IED/WRK038.
\item [Issue 1.19 (1992/05/27) (27th May 1992)]
Added $all\_β\_tac$.
\item [Issue 1.20 (1992/06/02) (2nd June 1992)]
Changed ``native'' theory.
\item[Issue 1.21 (1992/06/24) (24th June 1992)]
Renamings from issue 1.6 of \cite{DS/FMU/IED/WRK038},
mostly proof context name changes.
\item [Issue 1.22 (1992/07/06) (5th July 1992)]
Added $step\_strip\_tac$ and $THEN1$.
\item [Issue 1.23 (1992/08/03),1.24 (1992/08/03) (3rd August 1992)]
Added chaining tactics.
\item[Issue 1.26 (1992/08/10) \FormatDate{92/08/10
})] Accomodated changes to $fc\_rule$.
\item[Issue 1.27 (1992/08/12)] Fixed bug in $bc\_thm\_tac$.
\item [Issue 1.28 (1992/08/13) (13th August 1992)]
Corrected error handling for interrupts.
\item [Issue 1.29 (1992/10/03) (3rd October 1992)]
Added $all\_$ variants of forward chaining tactics.
\item [Issue 1.30 (1992/11/30) (30th November 1992)]
Fixed bug (HAT 68) to do with renaming in induction tactics.
\item [Issue 1.31 (1993/02/02),1.32 (1993/02/03) (1st-3rd February 1993)]
Added variable elimination tactics.
\item[Issue 1.33 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.34 (2002/10/17)] PPHol-specific updates for open source release.
\item[1.35] Removal from GEN\_INDUCTION\_T and  GEN\_INDUCTION\_T1 of the check for emptyness of the assumption list on the induction theorem.
\item[Issue 1.36 (2008/10/30)] Added
=INLINEFT
list_simple_∃_tac
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
None known.
\section{GENERAL}
\subsection{Scope}
This document contains an implementation of third group of tactics.
This primarily concerns adding paired abstraction handling
to the functions of \cite{DS/FMU/IED/DTD028}.
This is called for in \cite{DS/FMU/IED/HLD012}.
The design is in \cite{DS/FMU/IED/DTD029},
and the functions tested in {DS/FMU/IED/MDT029}
\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains an implementation of the third group of tactics.
This primarily concerns adding paired abstraction handling
to the functions of \cite{DS/FMU/IED/DTD028}.
\subsubsection{Dependencies}
This documents signature is found in \cite{DS/FMU/IED/DTD029}.
\subsubsection{Deficiencies}
None known.
\subsubsection{Possible Enhancements}
None known.

\section{THE CODE}
=SML
structure ⦏Tactics3⦎ : Tactics3 = struct
=TEX
=SML
val ⦏was_theory⦎ = get_current_theory_name ();
val _ = open_theory "basic_hol";
val _ = set_merge_pcs ["'propositions",
	"'simple_abstractions"];
=TEX
\subsection{Utilities}
=SML
fun ⦏mk_fst⦎ tm = (
let	val ttm = type_of tm;
	val (ta,tb) = dest_×_type ttm;
in
	mk_app(mk_const("Fst", mk_→_type(ttm,ta)), tm)
end);
fun ⦏mk_snd⦎ tm = (
let	val ttm = type_of tm;
	val (ta,tb) = dest_×_type ttm;
in
	mk_app(mk_const("Snd", mk_→_type(ttm,tb)), tm)
end);
=TEX
The following makes a term follow the pairing structure  of a variant structure, using $Fst$ and $Snd$.
=SML
fun ⦏varstruct_match⦎ (caller : string) (fmsg : int) (tm : TERM) (vs : TERM) : TERM = (
let	val sideeffect = if not(type_of tm =: type_of vs)
		then term_fail caller fmsg [tm,vs]
		else ();
	fun aux (ltm : TERM) (lvs : TERM) = (
		if is_var lvs
		then ltm
		else let val (vs1,vs2) = dest_pair lvs;
			val (tm1,tm2) = if is_pair ltm
				then dest_pair ltm
				else (mk_fst ltm, mk_snd ltm);
		in
			mk_pair(aux tm1 vs1, aux tm2 vs2)
		end);
in
	aux tm vs
end
handle complaint =>
divert complaint "dest_pair" caller fmsg
	[fn () => string_of_term tm,
	 fn () => string_of_term vs]
);
=TEX
\subsection{Concerning ¬}
=SML
val ⦏¬_simple_∃⋎1_conv⦎ : CONV = (fn tm =>
	((RAND_C simple_∃⋎1_conv THEN_C ¬_simple_∃_conv) tm)
	handle  Fail _ => term_fail "¬_∃⋎1_conv" 28091 [tm]
);
val ⦏¬_∃⋎1_conv⦎ : CONV = (fn tm =>
	((RAND_C ∃⋎1_conv THEN_C ¬_∃_conv) tm)
	handle  Fail _ => term_fail "¬_∃⋎1_conv" 28091 [tm]
);
=TEX
=SML
local
	val c = eqn_cxt_conv ((map thm_eqn_cxt
		[¬_¬_thm, ¬_∧_thm, ¬_∨_thm, ¬_⇒_thm,
		 ¬_⇔_thm, ¬_if_thm, ¬_t_thm, ¬_f_thm]) @
		[(⌜¬(∀ x ⦁ y)⌝, ¬_simple_∀_conv),
		(⌜¬(∃ x ⦁ y)⌝, ¬_simple_∃_conv),
		(⌜¬(∃⋎1 x ⦁ y)⌝, ¬_simple_∃⋎1_conv),
		(⌜¬($∀ (Uncurry x))⌝, ¬_∀_conv),
		(⌜¬($∃ (Uncurry x))⌝, ¬_∃_conv),
		(⌜¬($∃⋎1 (Uncurry x))⌝, ¬_∃⋎1_conv)]);
in
val ⦏¬_in_conv⦎ : CONV = (fn tm =>
	c tm
	handle complaint =>
	divert complaint "eqn_cxt_conv" "¬_in_conv" 28131
		[fn () => string_of_term tm]
);
end;
=TEX
=SML
val ⦏¬_in_tac⦎ : TACTIC = (fn ag => conv_tac ¬_in_conv ag
	handle complaint =>
	divert complaint "¬_in_conv" "¬_in_tac" 28025 []
);
=TEX
=SML
val ⦏¬_IN_THEN⦎ : THM_TACTICAL = (fn ttac => fn thm =>
	(ttac(conv_rule ¬_in_conv thm))
	handle Fail _ => thm_fail "¬_IN_THEN" 29010 [thm]
);
=TEX
\subsection{Concerning ∀}
=SML
val ⦏∀_tac⦎ : TACTIC = (fn (seqasms, conc) =>
	let	val (x, b) = dest_∀ conc;
		val x' = varstruct_variant (flat(map frees(conc::seqasms))) x;
		val xtm = snd(term_match x' x);
	in
		([(seqasms, var_subst xtm b)],
		(fn [thm] => ∀_intro x' thm | _ => bad_proof "∀_tac"))
	end handle ex => divert ex "dest_∀" "∀_tac" 29001 []
);
=TEX
\subsection{Concerning ⇒ and ⇔}
=SML
fun ⦏⇒_thm_tac⦎ (th : THM) : TACTIC = (fn (gl as (asms, conc)) =>
	let	val (ant, suc) = (dest_⇒ (concl th))
			handle ex => reraise ex "⇒_thm_tac";
	in	if suc ~=$ conc
		then	([(asms, ant)],
		 	(fn [thm] => ⇒_mp_rule th thm
			| _ => bad_proof "⇒_thm_tac"))
		else	term_fail "⇒_thm_tac" 29013 [suc]
	end
);
=TEX
Given a theorem of the form
=INLINEFT
Γ ⊢ a ⇒ b
=TEX
\ the following rule returns one of the form
=INLINEFT
Γ ⊢ a' ⇒ b
=TEX
\ where $a'$ is obtained from $a$ by existentially quantifying over
all its free variables which do not appear free in $b$ or
=INLINEFT
Γ
=TEX
.
=SML
fun ⦏bc_rule⦎ (th : THM) : THM = (
	let	val (ant, suc) = dest_⇒ (concl th);
		fun aux (v :: vs) a th = (
			let	val (a', th') = aux vs a th;
				val a'' = mk_simple_∃ (v, a');
				val th1 = asm_rule a'';
				val th2 = simple_∃_elim v th1 th';
			in	(a'', th2)
			end
		) | aux [] a th = (a, th);
	in	case frees ant term_diff
		(flat(map frees(suc :: asms th))) of
		[] => th
		|	vs => (
			let	val (a,th1) = aux vs ant (undisch_rule th);
				val th2 = ⇒_intro a th1;
			in	th2
			end
		)
	end
);
=TEX
=SML
fun ⦏bc_thm_tac⦎ (thm : THM) : TACTIC = (
	let	val thm0 = all_∀_elim thm;
		val thm1 = all_∀_intro(
			if	is_⇒(concl thm0)
			then	thm0
			else	fst (⇔_elim thm0))
			handle Fail _ => thm_fail "bc_thm_tac" 29012 [thm];
		val (bvs, _) =  strip_∀(concl thm1);
	in
	fn gl as (_, conc) =>
	let	val nbvs = list_variant (frees conc) bvs;
		val thm2 = list_∀_elim nbvs thm1;
		val (_, suc) = dest_⇒(concl thm2);
		val (tym, tmm) = term_match conc suc
			handle Fail _ => term_fail "bc_thm_tac" 29011 [suc];
		val thm3 = asm_inst_term_rule tmm (asm_inst_type_rule tym thm2);
		val thm4 = bc_rule thm3;
	in	⇒_thm_tac thm4 gl
	end
	end
);
val ⦏back_chain_thm_tac⦎ = bc_thm_tac;
=TEX
=SML
local
	fun AUX_T acc ([]:TACTIC list) : TACTIC = id_tac
	|   AUX_T acc (tac :: more) = (fn gl =>
		(tac THEN AUX_T [] (rev acc @ more)) gl
		handle Fail _ => (AUX_T (tac :: acc) more) gl
	);
in	fun ⦏TRY_ALL_T⦎ (tacs : TACTIC list) : TACTIC = AUX_T [] tacs;
end;
=TEX
=SML
fun ⦏bc_tac⦎ (thms : THM list) : TACTIC = (
	(TRY_ALL_T(map(fn t => bc_thm_tac t THEN REPEAT(∀_tac ORELSE ∧_tac))thms))
	handle ex => reraise ex "bc_tac"
);
=TEX
=SML
val ⦏back_chain_tac⦎ = bc_tac;
=TEX
=SML
fun ⦏FC_T1⦎
	(can : THM -> THM list)
	(ttac : THM list -> TACTIC)
	(thms : THM list)
	: TACTIC = (fn gl as (asms, _) =>
	let	val asmthms = map asm_rule asms;
	in	ttac(fc_rule(flat(map can thms)) asmthms) gl
	end
);
=TEX
=SML
fun ⦏ASM_FC_T1⦎
	(can : THM -> THM list)
	(ttac : THM list -> TACTIC)
	(thms : THM list)
	: TACTIC = (fn gl as (asms, _) =>
	let	val asmthms = map asm_rule asms;
	in	ttac(fc_rule(flat(map can (thms@asmthms))) asmthms) gl
	end
);
=TEX
=SML
val ⦏FC_T⦎ = FC_T1 fc_canon;
=TEX
=SML
val ⦏ASM_FC_T⦎ = ASM_FC_T1 fc_canon;
=TEX
=SML
val ⦏fc_tac⦎ : THM list -> TACTIC = FC_T (MAP_EVERY strip_asm_tac);
=TEX
=SML
val ⦏asm_fc_tac⦎ : THM list -> TACTIC = ASM_FC_T (MAP_EVERY strip_asm_tac);
=TEX
=SML
fun ⦏ALL_FC_T1⦎ (can : CANON) (ttac : THM list -> TACTIC) (ths : THM list) : TACTIC = (
	let	fun aux1 acc [] = acc
		|   aux1 (imps, others) (th :: more) = (
			if is_⇒ (snd(strip_∀(concl th)))
			then aux1 (th :: imps, others) more
			else aux1 (imps, th :: others) more
		);
		fun aux2 acc imps = (
			FC_T1 id_canon (fn thl =>
				let	val (imps, others) = aux1 ([], acc) thl;
				in	if	is_nil imps
					then	ttac others
					else	aux2 others imps
				end
			) imps
		);
		val ths' = flat (map can ths);
	in	aux2 [] (ths' drop (not o is_⇒ o snd o strip_∀ o concl))
	end
);
=TEX
=SML
fun ⦏ALL_ASM_FC_T1⦎ (can : CANON) (ttac : THM list -> TACTIC) (thms : THM list) : TACTIC = (
	GET_ASMS_T (fn asm_thms => ALL_FC_T1 can ttac (thms @ asm_thms))
);
=TEX
=SML
val ALL_FC_T : (THM list -> TACTIC) -> THM list -> TACTIC = ALL_FC_T1 fc_canon;
=TEX
=SML
val ⦏all_fc_tac⦎ : THM list -> TACTIC = ALL_FC_T (MAP_EVERY strip_asm_tac);
=TEX
=SML
fun ⦏ALL_ASM_FC_T⦎ (ttac : THM list -> TACTIC) (ths : THM list) : TACTIC = (
	GET_ASMS_T (fn thl => ALL_FC_T ttac (thl @ ths))
);
=TEX
=SML
val ⦏all_asm_fc_tac⦎ : THM list -> TACTIC = ALL_ASM_FC_T (MAP_EVERY strip_asm_tac);
=TEX
=SML
=TEX
For the types of the following see the definitions of the aliases
above (this is a violation of the coding standards in the interest of brevity and
is considered harmless). The long names will not be used in this document.
=SML
val ⦏FORWARD_CHAIN_T1⦎ = FC_T1;
val ⦏ASM_FORWARD_CHAIN_T1⦎ = ASM_FC_T1;
val ⦏FORWARD_CHAIN_T⦎ = FC_T;
val ⦏ASM_FORWARD_CHAIN_T⦎ = ASM_FC_T;
val ⦏forward_chain_tac⦎ = fc_tac;
val ⦏asm_forward_chain_tac⦎ = asm_fc_tac;
val ⦏ALL_FORWARD_CHAIN_T1⦎ = ALL_FC_T1;
val ⦏ALL_ASM_FORWARD_CHAIN_T1⦎ = ALL_ASM_FC_T1;
val ⦏ALL_FORWARD_CHAIN_T⦎ = ALL_FC_T;
val ⦏ALL_ASM_FORWARD_CHAIN_T⦎ = ALL_ASM_FC_T;
val ⦏all_forward_chain_tac⦎ = all_fc_tac;
val ⦏all_asm_forward_chain_tac⦎ = all_asm_fc_tac;
=TEX
\subsection{Concerning ∃}
=SML
fun ⦏∃_tac⦎ (tm : TERM) : TACTIC = (fn (seqasms, conc) =>
let	val (x, b) = dest_∃ conc;
	val tym = type_match (type_of x) (type_of tm);
	val tm' = inst [] tym tm;
	val tm'' = varstruct_match "∃_tac" 29008 tm' x;
	val tmsubs = snd(term_match tm'' x);
in
		([(seqasms, var_subst tmsubs b)],
		(fn [thm] => ∃_intro conc thm | _ => bad_proof "∃_tac"))
end
handle ex =>
list_divert ex "∃_tac" [
	("type_match", 29008,
		[fn () => string_of_term tm,
		fn () => string_of_term (fst(dest_∃ conc))]),
	("dest_∃", 29002, [])]
);
=TEX
=SML
fun ⦏list_simple_∃_tac⦎ (wits : TERM list) : TACTIC = (fn (seqasms, conc) =>
let	val _ = case wits of [] => fail "list_simple_∃_tac" 29016[]
		| _ => ();
	val (x1, b1) = dest_simple_∃ conc
		handle Fail _ =>
		term_fail "list_simple_∃_tac"
		29017 [conc];
	fun match (w, x) = (
		let	val tym = type_match (type_of x) (type_of w);
			val w' = inst [] tym w;
		in	(w', x)
		end	handle Fail _ =>
			term_fail "list_simple_∃_tac"
			29008 [w, x]
	);
	fun matches acc [] tm = (acc, tm)
	|   matches acc (w::more_ws) tm = (
		let	val (x, tm') = dest_simple_∃ tm
				handle Fail _ =>
				term_fail "list_simple_∃_tac" 29015 [conc];
			val wx = match (w, x);
		in	matches (wx::acc) more_ws tm'
		end
	);
	val (tmsubs, b) = matches [] wits conc;
	val new_conc = var_subst tmsubs b;
in
		([(seqasms, new_conc)],
		(fn [thm] => list_simple_∃_intro wits conc thm
			| _ => bad_proof "list_simple_∃_tac"))
end);
=TEX
=SML
fun ⦏∃_THEN⦎ (ttac : THM -> TACTIC): THM -> TACTIC = (fn thm =>
let	val (x, b) = dest_∃(concl thm);
in	(fn (seqasms, conc) =>
	let	val x' = varstruct_variant (flat(map frees
			(conc :: concl thm :: asms thm @ seqasms))) x;
		val xtm = snd(term_match x' x);
		val (sgs, pf) = ttac (asm_rule (var_subst xtm b)) (seqasms, conc);
	in	(sgs, (∃_elim x' thm) o pf)
	end)
end
handle ex => divert ex "dest_∃" "∃_THEN" 29003
		[fn () => string_of_thm thm]
);
=TEX
\subsection{Concerning ∃$_1$}
=SML
fun ⦏∃⋎1_tac⦎ (tm : TERM): TACTIC = (fn (seqasms,gl) =>
	((conv_tac ∃⋎1_conv
	THEN ∃_tac tm)	(seqasms,gl)
	handle complaint =>
	pass_on complaint "∃_tac" "∃⋎1_tac")
	handle complaint =>
	divert complaint "∃⋎1_conv" "∃⋎1_tac" 29004 []
);
=TEX
=SML
fun ⦏∃⋎1_THEN⦎ (ttac : THM -> TACTIC): THM -> TACTIC = (fn thm =>
	∃_THEN ttac (conv_rule ∃⋎1_conv thm)
	handle complaint =>
	divert complaint "∃⋎1_conv" "∃⋎1_THEN"
		29005 [fn ()=> string_of_thm thm]
);
=TEX
\subsection{Concerning λ}
=SML
val ⦏all_β_tac⦎ : TACTIC = (fn gl =>
	conv_tac all_β_conv gl
	handle complaint =>
	pass_on complaint "all_β_conv" "all_β_tac"
);
=TEX
\subsection{Concerning Assumptions}
=SML
fun ⦏spec_asm_tac⦎ (asm : TERM) (instance : TERM)  :TACTIC = (
	GET_ASM_T asm (strip_asm_tac o ∀_elim instance)
);
fun ⦏list_spec_asm_tac⦎ (asm : TERM) (instances : TERM list)  :TACTIC = (
	GET_ASM_T asm (strip_asm_tac o list_∀_elim instances)
);
fun ⦏spec_nth_asm_tac⦎ (n : int) (instance : TERM)  :TACTIC = (
	GET_NTH_ASM_T n (strip_asm_tac o ∀_elim instance)
);
fun ⦏list_spec_nth_asm_tac⦎ (n : int) (instances : TERM list)  :TACTIC = (
	GET_NTH_ASM_T n (strip_asm_tac o list_∀_elim instances)
);
=TEX
=SML
fun ⦏SPEC_ASM_T⦎ (asm : TERM) (instance : TERM)
	(thmtac:THM -> TACTIC):TACTIC = (
	GET_ASM_T asm (thmtac o ∀_elim instance)
);
fun ⦏LIST_SPEC_ASM_T⦎ (asm : TERM) (instances : TERM list)
	(thmtac:THM -> TACTIC) :TACTIC = (
	GET_ASM_T asm (thmtac o list_∀_elim instances)
);
fun ⦏SPEC_NTH_ASM_T⦎ (n : int) (instance : TERM)
	(thmtac:THM -> TACTIC)  :TACTIC = (
	GET_NTH_ASM_T n (thmtac o ∀_elim instance)
);
fun ⦏LIST_SPEC_NTH_ASM_T⦎ (n : int) (instances : TERM list)
	(thmtac:THM -> TACTIC) :TACTIC = (
	GET_NTH_ASM_T n (thmtac o list_∀_elim instances)
);
=TEX
\subsection{Concerning ε}
=TEX
=SML
fun ⦏ε_T⦎ (tm : TERM) (ttac : THM -> TACTIC) : TACTIC = (
	case dest_term tm of
		Dε(x, px) =>  (
		let	val ∃_x_px = mk_∃(x, px);
			val thm1 = ∃_ε_rule (asm_rule ∃_x_px);
		in	LEMMA_T
			∃_x_px
			(fn th => ttac(prove_asm_rule th thm1))
		end
	) |	_ => term_fail "ε_T" 29050 [tm]
);
=TEX
=SML
fun ⦏ε_tac⦎ (tm : TERM) : TACTIC = (
	(ε_T tm strip_asm_tac)
	handle ex => reraise ex "ε_tac"
);
=TEX
=SML
fun term_ε_s (tm : TERM) = (
	case dest_simple_term tm of
		App (f, a) => (
			if is_ε tm
			then (term_ε_s f term_union term_ε_s a) term_grab tm
			else (term_ε_s f term_union term_ε_s a)
	) |	Simpleλ (_, b) => term_ε_s b
	|	_ => []
);
=TEX
=SML
fun ⦏ALL_ε_T⦎ (ttac : THM -> TACTIC) : TACTIC = (fn gl as (_, conc) =>
	((MAP_EVERY (switch ε_T ttac) (term_ε_s conc))
	handle ex => reraise ex "ALL_ε_T") gl
);
=TEX
=SML
val ⦏all_ε_tac⦎ : TACTIC = (
	(ALL_ε_T strip_asm_tac)
	handle ex => reraise ex "all_ε_tac"
);
=TEX
\subsection{Concerning Tautologies}
=SML
val ⦏taut_tac⦎ : TACTIC = (fn gl =>
	(REPEAT ∀_tac THEN simple_taut_tac) gl
	handle complaint =>
	if area_of complaint = "simple_taut_tac"
	then fail "taut_tac" 29020 []
	else reraise complaint (area_of complaint)
);
=TEX
=SML
fun ⦏taut_rule⦎ (tm : TERM) : THM = (
	tac_proof(([],tm),taut_tac)
handle complaint =>
divert complaint "tac_proof" "taut_rule" 27037 [fn () => string_of_term tm]
);
=TEX
=SML
val ⦏taut_conv⦎ : CONV = (fn (tm : TERM) =>
let	val thm = tac_proof(([],tm),taut_tac)
in
	⇔_t_intro thm
end
handle (Fail _) =>
term_fail "taut_conv" 27037 [tm]
);
=TEX
\subsection{Single Stepping $strip\_tac$}
=SML
fun ⦏right_strip_∧_rule⦎ (thm : THM) : THM list = (
let	val s1 = ∧_left_elim thm;
	val s2 = ∧_right_elim thm;
in
	(s1 :: right_strip_∧_rule s2)
end
handle (Fail _) => [thm]
);
=TEX
=SML
fun ⦏ante_∧_tac⦎ ([]:THM list) : TACTIC = id_tac
| ante_∧_tac x = ante_tac (list_∧_intro x);
=TEX
=SML
fun ⦏step_check_asm_tac⦎ (thm : THM) : TACTIC = (fn gl as (seqasms, conc) =>
let	val cnjs = right_strip_∧_rule thm;
	val t = concl (hd cnjs);
in	if t ~=$ conc
	then (accept_tac (hd cnjs))
	else if is_t t
	then ante_∧_tac (tl cnjs)
	else if is_f t
	then f_thm_tac (hd cnjs)
	else if is_¬ t
	then	let	val t' = dest_¬ t;
			fun aux (asm :: more) = (
				if t ~=$ asm
				then ante_∧_tac (tl cnjs)
				else if asm ~=$ t'
				then accept_tac (¬_elim conc (asm_rule asm) (hd cnjs))
				else if asm ~=$ conc
				then (accept_tac (asm_rule asm))
				else aux more
			) | aux [] = asm_tac (hd cnjs) THEN
				ante_∧_tac (tl cnjs);
		in	aux seqasms
		end
	else	let	fun aux (asm :: more) = (
				if t ~=$ asm
				then ante_∧_tac (tl cnjs)
				else if is_¬ asm andalso (dest_¬ asm) ~=$ t
				then accept_tac (¬_elim conc (hd cnjs) (asm_rule asm))
				else if asm ~=$ conc
				then (accept_tac (asm_rule asm))
				else aux more
				) | aux [] = asm_tac (hd cnjs) THEN
					ante_∧_tac (tl cnjs);
		in	aux seqasms
		end
end	gl
);
=TEX
=SML
fun ⦏step_conv_⇒_tac⦎ (cnv : CONV) : THM -> TACTIC = (fn thm =>
let	val cnjs = right_strip_∧_rule thm;
	val cnj1 = conv_rule (CHANGED_C cnv) (hd cnjs);
in
	ante_∧_tac (cnj1 :: tl cnjs)
end);
=TEX
=SML
val ⦏step_∨_⇒_tac⦎ : THM -> TACTIC = (fn thm =>
let	val cnjs = right_strip_∧_rule thm;
	val (t1,t2) = dest_∨ (concl (hd cnjs));
in	(fn (seqasms, conc) =>
	let	val (sgs1, pf1) = ante_∧_tac (asm_rule t1 :: tl cnjs) (seqasms, conc);
		val (sgs2, pf2) = ante_∧_tac (asm_rule t2 :: tl cnjs) (seqasms, conc);
	in	(sgs1 @ sgs2,
			(fn thl =>
			let	val len = length sgs1;
			in ∨_elim (hd cnjs) (pf1(thl to (len - 1)))
				(pf2(thl from len))
			end
			))
	end)
end
handle ex => divert ex "dest_∨" "step_∨_⇒_tac" 28042
	[fn () => string_of_thm thm]
);
=TEX

=SML
val ⦏step_∧_⇒_tac⦎ : THM -> TACTIC = (fn thm =>
let	val cnjs = right_strip_∧_rule thm;
	val thm1 = ∧_left_elim (hd cnjs);
	val thm2 = ∧_right_elim (hd cnjs);
in
	ante_∧_tac (thm1 :: thm2 :: tl cnjs)
end
handle ex => divert ex "∧_left_elim" "step_∧_⇒_tac" 28032
	[fn () => string_of_thm thm]
);
=TEX
=SML
val ⦏step_simple_∃_⇒_tac⦎ : THM_TACTIC = (fn thm =>
let	val cnjs = right_strip_∧_rule thm;
	val (x, b) = dest_simple_∃(concl (hd cnjs));
in	(fn (seqasms, conc) =>
	let	val x' = variant (flat(map frees
			(conc :: concl thm :: asms thm @ seqasms))) x;
		val (sgs, pf) = ante_∧_tac ((asm_rule (var_subst[(x', x)] b)) :: (tl cnjs))
			(seqasms, conc);
	in	
		(sgs, (simple_∃_elim x' (hd cnjs)) o pf)
	end)
end
handle ex => divert ex "dest_simple_∃" "step_simple_∃_⇒_tac" 28093
	[fn () => string_of_thm thm]
);
=TEX

=SML
fun MAP_FIRST1 [] v = (
	fail_with_tac "step_strip_asm_tac" 28003
		[fn () => string_of_thm v]
) | MAP_FIRST1 (a :: x) v = a v handle (Fail _) =>
	MAP_FIRST1 x v;
=TEX
If the theorem given is a conjunct then this
should operate on the first conjunct, returning the second
unchanged.
This may cause compatibility problems for a proof context conversion that
matches against conjuncts.
=SML
val ⦏step_strip_asm_tac⦎ : THM_TACTIC = (fn thm :THM =>
	MAP_FIRST1
	[step_conv_⇒_tac (current_ad_st_conv()),
		step_∧_⇒_tac,
		step_∨_⇒_tac,
		step_simple_∃_⇒_tac,
		step_check_asm_tac]
	thm
);
=TEX
=SML
val ⦏step_strip_tac⦎ : TACTIC = (fn gl =>
	(FIRST[ conv_tac(current_ad_sc_conv()),
		simple_∀_tac,
		∧_tac,
		⇒_T step_strip_asm_tac,
		t_tac,
		concl_in_asms_tac]
	ORELSE_T
		fail_with_tac "step_strip_tac" 28003
		[fn () => string_of_term(snd gl)])
	gl
);
=TEX
\subsection{Induction Tactics}
The following function is used to rename appearances of the induction
variable in the antecedent part of the induction theorem.
=SML
infix starts_with;
fun (s1 : string) ⦏starts_with⦎ (s2 : string) : bool = (
	let	fun aux (c1 :: more1) (c2 :: more2) = (
			if c1 = c2 then aux more1 more2 else false
		) | aux [] [] = true
		|   aux [] _ = false
		|   aux _ [] = true;
	in	aux (explode s1) (explode s2)
	end
);
=SML
fun ⦏induction_rename⦎ (old : string) (new : string) (tm : TERM) : TERM = (
	let	val sn = size old;
		fun aux t = (
		case dest_simple_term t of
				App(f, a) => (
				mk_app(aux f, aux a)
		) |	Simpleλ (v, b) => (
			let	val (n, ty) = dest_var v;
			in	if	n starts_with old
			then	let	val n' = new^(implode(explode n from sn));
					val v' = mk_var(n', ty);
					val b' = subst[(v', v)]b;						in	mk_simple_λ (v', aux b')
				end
			else	mk_simple_λ (v, aux b)
			end
		) |	_ => t
		);
	in	aux tm
	end
);
=TEX
In the following the term argument is the antecedent of the implication
in an induction principle. The tactic returned is the combination
of
=INLINEFT
∧_tac
=TEX
,
=INLINEFT
∀_tac
=TEX
\ and
=INLINEFT
⇒_tac
=TEX
\ mentioned in the detailed design.
=SML
fun ⦏induction_strip_tac⦎ (ttac : THM -> TACTIC) (tm : TERM) : TACTIC = (
	let	fun tac t = (
			case dest_term t of
				D∧ (t1, t2) => ∧_tac THEN_LIST [tac t1, tac t2]
			|	D∀ (_, b) => ∀_tac THEN tac b
			|	D⇒ _	=> ⇒_T ttac
			|	_	=> id_tac
		);
	in	tac tm
	end
);
=TEX
=SML
fun ⦏GEN_INDUCTION_T⦎ (thm : THM) (ttac : THM -> TACTIC) : TERM -> TACTIC = (
	let	fun bad_thm thm = thm_fail "GEN_INDUCTION_T" 29021 [thm];
		val (p, body) = (dest_simple_∀ (concl thm))
			handle Fail _ => bad_thm thm;
		val (ant, suc) = (dest_⇒ body)
			handle Fail _ => bad_thm thm;
		val (x, px) = (dest_simple_∀ suc)
			handle Fail _ => bad_thm thm;
		val (xn, xty) = dest_var x;
		val tac = induction_strip_tac ttac ant;
	in	if not (px ~=$ (mk_app(p, x))handle Fail _ => true)
		then bad_thm thm
		else
	fn t =>
	let	val (tn, tty) = (dest_var t)
			handle Fail _ => term_fail "GEN_INDUCTION_T" 29024 [t];
		val tym = (type_match tty xty)
			handle Fail _ => fail "GEN_INDUCTION_T" 29023
			[fn()=>string_of_term t, fn()=>string_of_type xty];
		val thm1 = inst_type_rule tym thm;
	in
	fn (gl as (asms, conc)) =>
		if not (is_free_in t conc)
		then term_fail "GEN_INDUCTION_T" 29026 [t]
		else if any asms (is_free_in t)
		then term_fail "GEN_INDUCTION_T" 29025 [t]
		else
	let	val actp = mk_simple_λ(t, conc);
		val is_actp =
			(fn t => is_app t andalso fst(dest_app t) ~=$ actp);
		val conv = (ONCE_MAP_C(COND_C is_actp simple_β_conv fail_conv));
		val thm2 = conv_rule conv (simple_∀_elim actp thm1);
		val new_conc = induction_rename xn tn (concl thm2);
		val thm3 = ⇔_mp_rule (refl_conv new_conc) thm2;
	in	(intro_∀_tac(t,t) THEN ⇒_thm_tac thm3 THEN tac) gl
	end
	end
	end
);
=TEX
=SML
fun ⦏gen_induction_tac⦎ (thm : THM) : TERM -> TACTIC = (
	let	val ttac = (GEN_INDUCTION_T thm strip_asm_tac)
			handle ex => reraise ex "gen_induction_tac";
	in
	fn tm =>
	let	val tac = (ttac tm) handle ex => reraise ex "gen_induction_tac";
	in	fn gl => ((tac gl) handle ex => reraise ex "gen_induction_tac")
	end
	end
);
=TEX
=SML
fun ⦏lrassoc1⦎ ((x, y) :: rest : (TERM * TERM) list) (what : TERM) : TERM = (
	if y =$ what
	then x
	else lrassoc1 rest what
) | lrassoc1 [] what = what;
=SML
fun ⦏GEN_INDUCTION_T1⦎ (thm : THM) (ttac : THM -> TACTIC) : TACTIC = (
	let	fun bad_thm thm = thm_fail "GEN_INDUCTION_T1" 29007 [thm];
		val (p, body) = (dest_simple_∀ (concl thm))
			handle Fail _ => bad_thm thm;
		val (ant, suc) = (dest_⇒ body)
			handle Fail _ => bad_thm thm;
		val (x, tpx) = (dest_simple_∀ suc)
			handle Fail _ => bad_thm thm;
		val (xn, _) = dest_var x;
		val px = (mk_app(p, x))
			handle Fail _ => bad_thm thm;
		val b = hd(gen_vars[BOOL] (x::p::frees body));
		val pat = (subst[(b, px)] tpx)
			handle Fail _ => bad_thm thm;
		val abs = mk_simple_λ(p, tpx);
	in	if not (is_free_in b pat) orelse not (is_free_in x pat)
		then	bad_thm thm
		else
	let	val tac = induction_strip_tac ttac ant;
	in
	fn (gl as (asms, conc)) =>
	let	val (tym, tmm) = (term_match conc pat)
			handle Fail _ => term_fail "GEN_INDUCTION_T1" 29009
			[mk_app(abs, mk_var("t", type_of p))];
		val actx = lrassoc1 tmm (inst [] tym x);
	in	if not (is_var actx)
		then term_fail "GEN_INDUCTION_T1" 29014 [actx]
		else
	let	val actb = lrassoc1 tmm (inst [] tym b);
		val actp = mk_simple_λ(actx, actb);
		val is_actp =
			(fn t => is_app t andalso fst(dest_app t) ~=$ actp);
		val conv = (ONCE_MAP_C(COND_C is_actp simple_β_conv fail_conv));
		val thm1 = inst_type_rule tym thm;
		val thm2 = conv_rule conv (simple_∀_elim actp thm1);
		val new_conc = induction_rename xn (fst(dest_var actx)) (concl thm2);
		val thm3 = ⇔_mp_rule (refl_conv new_conc) thm2;
	in	(intro_∀_tac(actx,actx) THEN ⇒_thm_tac thm3 THEN tac) gl
	end
	end
	end
	end
);
=TEX
=SML
fun ⦏gen_induction_tac1⦎ (thm : THM) : TACTIC = (
	let	val tac = (GEN_INDUCTION_T1 thm strip_asm_tac)
			handle ex => reraise ex "gen_induction_tac1";
	in	fn gl => ((tac gl) handle ex => reraise ex "gen_induction_tac1")
	end
);
=TEX
\section{VARIABLE ELIMINATION}
=SML
local
	val ord0 = ord "0";
	val ord9 = ord "9";
	fun is_digit a = (
	let val orda = ord a
	in
			ord0 <= orda andalso orda <= ord9
	end);
	fun discard vs (a::x) = if is_digit a orelse a = vs
		then discard vs x
		else length (a::x)
	| discard vs [] = 0;
in
	fun name_heuristic v1 v2 = (
	let	val vs = get_variant_suffix();
		val vs1 = discard vs (rev(explode(fst(dest_var v1))));
		val vs2 = discard vs(rev(explode(fst(dest_var v2))));
	in
		not (vs2 < vs1)
	end);
end;
=TEX
=SML
fun ⦏subst_rule1⦎ thm var value  = (
let	val bit1 = subst_rule [(thm,var)];
in
	(fn thm1 => bit1(concl thm1) thm1
	)
end);
=TEX
=SML
fun ⦏subst_rule2⦎ thm var value  = (
let	val bit1 = subst_rule [(thm,var)];
in
	(fn thm1 => if is_free_in var (concl thm1)
		then  bit1(concl thm1) thm1
		else thm1
	)
end);
=TEX
=SML
fun ⦏subst_tac1⦎ thm var value = (
conv_tac (fn cnc =>
	if is_free_in var cnc
	then (
let	val all_vars = map mk_var (term_vars cnc);
	val new_tvar = variant all_vars var;
	val trans = [(new_tvar,var)];
	val template' = subst trans cnc;
	val new_template = mk_eq(cnc,template');
	val s2 = refl_conv cnc;
	val s3 = subst_rule [(thm, new_tvar)] new_template s2;
	val s4 = eq_trans_rule s2 s3
		handle complaint =>
		pass_on complaint "eq_trans_rule" "subst_conv";
in
	s4
end)
	else refl_conv cnc
)
);
=TEX
=SML
fun ⦏subst_tac2⦎ thm  = (
conv_tac (fn cnc =>
let	val (var,value) = dest_eq(concl thm);
in
	if is_free_in var cnc
	then (
let	val all_vars = map mk_var (term_vars cnc);
	val new_tvar = variant all_vars var;
	val trans = [(new_tvar,var)];
	val template' = subst trans cnc;
	val new_template = mk_eq(cnc,template');
	val s2 = refl_conv cnc;
	val s3 = subst_rule [(thm, new_tvar)] new_template s2;
	val s4 = eq_trans_rule s2 s3
		handle complaint =>
		pass_on complaint "eq_trans_rule" "subst_conv";
in
	s4
end)
	else refl_conv cnc
end)
);
=TEX
=SML
fun ⦏ve_categorise⦎ lhs rhs tm = (
	if is_var lhs
	then (if is_var rhs
		then (if lhs =$ rhs
			then (lhs,rhs,0)
			else (if name_heuristic lhs rhs
				then (lhs,rhs,1)
				else (rhs,lhs,2)))
		else (if is_free_in lhs rhs
			then (lhs,rhs,3)
			else (lhs,rhs,1)))
	else (if is_var rhs
		then (if is_free_in rhs lhs
			then (lhs,rhs,3)
			else (rhs,lhs,2))
		else (lhs,rhs,3))
);
=TEX
=SML
fun ⦏ve_categorise1⦎ lhs rhs tm = (
	if is_var lhs
	then (if is_var rhs
		then (if lhs =$ rhs
			then (lhs,rhs,0)
			else (if name_heuristic lhs rhs
				then (lhs,rhs,1)
				else (rhs,lhs,2)))
		else (if not(is_const rhs)
			then (lhs,rhs,3)
			else (lhs,rhs,1)))
	else (if is_var rhs
		then (if not(is_const lhs)
			then (lhs,rhs,3)
			else (rhs,lhs,2))
		else (lhs,rhs,3))
);
=TEX
=SML
fun ⦏VAR_ELIM_ASM_T⦎ (tm : TERM) (thm_tac : THM_TACTIC) : TACTIC = (fn gl =>
let	val (lhs,rhs) = dest_eq tm
		handle (Fail _) =>
		term_fail "VAR_ELIM_ASM_T" 29027 [tm];
	val (var,value,this_case) = ve_categorise lhs rhs tm;
in
((DROP_ASM_T tm (fn thm =>
	case this_case of
	0 => id_tac
	| 1 => (let val sr = subst_rule1 thm var value ;
			fun return_tac thm1 = if is_free_in var (concl thm1)
				then thm_tac ( sr thm1)
				else check_asm_tac  thm1;
		in
		subst_tac1 thm var value THEN
		DROP_ASMS_T (MAP_EVERY return_tac o rev)
		end
	) | 2 => (let val thm' = eq_sym_rule thm;
			val sr = subst_rule1 thm' var value;
			fun return_tac thm1 = if is_free_in var (concl thm1)
				then thm_tac ( sr thm1)
				else check_asm_tac  thm1;

		in
		subst_tac1 thm' var value THEN
		DROP_ASMS_T (MAP_EVERY return_tac o rev)
		end
	) | _ => term_fail "VAR_ELIM_ASM_T" 29027 [tm]
	)
	gl)
	handle complaint =>
	pass_on complaint "DROP_ASM_T" "VAR_ELIM_ASM_T"
	)
end);
=TEX
=SML
fun ⦏var_elim_asm_tac⦎ (tm:TERM): TACTIC = (fn (asms,cnc) =>
	VAR_ELIM_ASM_T tm strip_asm_tac (asms,cnc)
	handle complaint =>
	pass_on complaint "VAR_ELIM_ASM_T" "var_elim_asm_tac"
);
=TEX
=SML
fun ⦏VAR_ELIM_NTH_ASM_T⦎ (n: int) (thm_tac:THM_TACTIC): TACTIC = (fn (asms,cnc) => (
let	val tm = nth (n-1) asms
		handle (Fail _) =>
		fail "VAR_ELIM_NTH_ASM_T" 9303 [fn () => string_of_int n];
	val (lhs,rhs) = dest_eq tm
		handle (Fail _) =>
		term_fail "VAR_ELIM_NTH_ASM_T" 29027 [tm];
	val (var,value,this_case) = ve_categorise lhs rhs tm;
in
(DROP_NTH_ASM_T n (fn thm =>
	case this_case of
	0 => id_tac
	| 1 => (let val sr = subst_rule1 thm var value
			fun return_tac thm1 = if is_free_in var (concl thm1)
				then thm_tac ( sr thm1)
				else check_asm_tac  thm1;
		in
		subst_tac1 thm var value THEN
		DROP_ASMS_T (MAP_EVERY return_tac o rev)
		end
	) | 2 => (let val thm' = eq_sym_rule thm;
			val sr = subst_rule1 thm' var value;
			fun return_tac thm1 = if is_free_in var (concl thm1)
				then thm_tac ( sr thm1)
				else check_asm_tac  thm1;
		in
		subst_tac1 thm' var value THEN
		DROP_ASMS_T (MAP_EVERY return_tac o rev)
		end
	) | _ => term_fail "VAR_ELIM_NTH_ASM_T" 29027 [tm]
	))
end)
(asms,cnc));
=TEX
=SML
fun ⦏var_elim_nth_asm_tac⦎ (n:int): TACTIC = (fn (asms,cnc) =>
	VAR_ELIM_NTH_ASM_T n strip_asm_tac (asms,cnc)
	handle complaint =>
	pass_on complaint "VAR_ELIM_NTH_ASM_T" "var_elim_nth_asm_tac"
);
=TEX

=SML
fun ave_process (flag1:bool) (thms : THM list) : (THM list * THM list)= (
let	fun aux pool subs [] = (rev pool, rev subs)
	| aux pool subs (a::x) = (
		if is_eq (concl a)
		then (
		let	val tm = concl a;
			val (lhs,rhs) = dest_eq tm;
			val (var,value,this_case) =
				if flag1
				then ve_categorise1 lhs rhs tm
				else ve_categorise lhs rhs tm;
		in
		case this_case of
		0 => aux pool subs x
		| 1 => (let val sr = subst_rule2 a var value;
			in
			aux (map sr pool) (a :: map sr subs) (map sr x)
			end)
		| 2 => (let val sr = subst_rule2 (eq_sym_rule a) var value;
			in
			aux (map sr pool) (eq_sym_rule a :: map sr subs) (map sr x)
			end)
		| _ => aux (a :: pool) subs x
		end)
		else aux (a :: pool) subs x
	);
in
	aux [] [] thms
end);

=TEX

=SML
fun ⦏LALL_VAR_ELIM_ASM_T⦎ (flag1:bool) (caller:string) (thm_tac: THM_TACTIC): TACTIC = (
DROP_ASMS_T (fn orig_thms =>
let	val rorig_thms = rev orig_thms;
	val (new_thms,subs) = ave_process flag1 rorig_thms;
	val dummy = if length new_thms = length orig_thms
		then fail caller 29028 []
		else ();
	val nt_tacs = map (fn thm => if present (op =|-) thm rorig_thms
		then check_asm_tac thm
		else thm_tac thm) new_thms;
in
	MAP_EVERY subst_tac2 subs THEN
	EVERY nt_tacs
end));
=TEX
=SML
fun ⦏ALL_VAR_ELIM_ASM_T⦎ (thm_tac: THM_TACTIC): TACTIC =
	LALL_VAR_ELIM_ASM_T true "ALL_VAR_ELIM_ASM_T" thm_tac;
=TEX
=SML
val ⦏all_var_elim_asm_tac⦎ : TACTIC =
	LALL_VAR_ELIM_ASM_T true
		"all_var_elim_asm_tac"
		strip_asm_tac;
=TEX
=SML
fun ⦏ALL_VAR_ELIM_ASM_T1⦎ (thm_tac: THM_TACTIC): TACTIC =
	LALL_VAR_ELIM_ASM_T false "ALL_VAR_ELIM_ASM_T1" thm_tac;
=TEX
=SML
val ⦏all_var_elim_asm_tac1⦎ : TACTIC =
	LALL_VAR_ELIM_ASM_T false
		"all_var_elim_asm_tac1"
		strip_asm_tac;
=TEX
=IGN
set_goal([⌜p ∨ q⌝, ⌜v = 2 ∧ ∀ v ⦁ v = 3⌝,⌜v=5⌝,⌜f v = f 6⌝],⌜h v = h 7⌝);
a(var_elim_asm_tac ⌜v = 5⌝);
undo 1;
a(var_elim_nth_asm_tac 3);
undo 1;
a(VAR_ELIM_ASM_T ⌜v = 5⌝ asm_tac);
undo 1;
a(VAR_ELIM_NTH_ASM_T 3 asm_tac);
undo 1;
a all_var_elim_asm_tac;
undo 1;
a all_var_elim_asm_tac1;
undo 1;
a (ALL_VAR_ELIM_ASM_T asm_tac);
undo 1;
a (ALL_VAR_ELIM_ASM_T1 asm_tac);
set_goal([⌜v = 2 ∧ ∀ v ⦁ v = 3⌝,⌜5 = v⌝,⌜f v = f 6⌝],⌜h v = h 7⌝);
a(var_elim_asm_tac ⌜5 = v⌝);
undo 1;
a(var_elim_nth_asm_tac 2);
undo 1;
a all_var_elim_asm_tac;
undo 1;
a all_var_elim_asm_tac1;
set_goal([⌜v = 2 ∧ ∀ v ⦁ v = 3⌝,⌜(v:ℕ) = v⌝,⌜f v = f 6⌝],⌜h v = h 7⌝);
a(var_elim_asm_tac ⌜(v:ℕ) = v⌝);
undo 1;
a(var_elim_nth_asm_tac 2);
undo 1;
a all_var_elim_asm_tac;
undo 1;
a all_var_elim_asm_tac1;
set_goal([⌜v = 2 ∧ ∀ v ⦁ v = 3⌝,⌜(v:ℕ) = j v⌝,⌜f v = f 6⌝],⌜h v = h 7⌝);
a(var_elim_asm_tac ⌜(v:ℕ) = j v⌝); (* fail *)
a(var_elim_nth_asm_tac 2); (* fail *)
a all_var_elim_asm_tac; (* fail *)
a all_var_elim_asm_tac1; (* fail *)
set_goal([⌜v = 2 ∧ ∀ v ⦁ v = 3⌝,⌜(v:ℕ) = i j⌝,⌜f v = f 6⌝],⌜h v = h 7⌝);
a(var_elim_asm_tac ⌜(v:ℕ) = i j⌝);
undo 1;
a(var_elim_nth_asm_tac 2);
undo 1;
a all_var_elim_asm_tac; (* fail *)
a all_var_elim_asm_tac1;
drop_main_goal();
set_goal([⌜c = d⌝,⌜a = b⌝,⌜b = c⌝,⌜e = f⌝,⌜d = e⌝],⌜f = a⌝);
a all_var_elim_asm_tac;
undo 1;
a all_var_elim_asm_tac1;
set_goal([⌜c = d⌝,⌜b = a⌝,⌜b = c⌝,⌜e = f⌝,⌜d = e⌝],⌜f = a⌝);
a all_var_elim_asm_tac;
undo 1;
a all_var_elim_asm_tac1;
set_goal([⌜c h = (d:'a)⌝,⌜a = b⌝,⌜(b:'a) = c h⌝,⌜e = f⌝,⌜d = e⌝],⌜f = a⌝);
a all_var_elim_asm_tac;
undo 1;
a all_var_elim_asm_tac1;

set_goal([⌜f 2 = f 1⌝,⌜y = 1⌝],⌜f 2 = f y⌝);
a(var_elim_asm_tac ⌜y = 1⌝); (* proves goal *)
undo 1;
a(var_elim_nth_asm_tac 2); (* proves goal *)
undo 1;
a all_var_elim_asm_tac; (* proves goal *)
undo 1;
a all_var_elim_asm_tac1; (* proves goal *)

=TEX

\section{TACTICALS}
=SML
fun ((tac1 : TACTIC) ⦏THEN_T1⦎ (tac2 : TACTIC)) : TACTIC = (fn gl =>
	let	val (sgs1, pf) = tac1 gl;
		val (sgs2pfs2) = case sgs1 of
			(a :: x) => (tac2 a :: map id_tac x)
			| _ => [];
	in	(flat (map fst sgs2pfs2),
		pf o map_shape (map (fn (sgs, pf) => (pf, length sgs))sgs2pfs2))
	end
);
=TEX
=SML
val op ⦏THEN1⦎ : (TACTIC * TACTIC) -> TACTIC = op THEN_T1;

=TEX
\section{CANONICALISATION}
=SML
fun ⦏¬_rewrite_canon⦎ (thm : THM) : THM list = (
	(dest_¬(concl thm);
	[conv_rule (FIRST_C[
		simple_eq_match_conv ¬_∨_thm,
		¬_∃_conv,
		¬_¬_conv,
		simple_eq_match_conv ¬_thm1])thm])
	handle (Fail _) =>
	fail_canon thm
);
=TEX
=SML
fun ⦏∀_rewrite_canon⦎ (thm : THM) : THM list = (
	if is_∀ (concl thm)
	then [all_∀_elim thm]
	else fail_canon thm
);
=TEX
=SML
val ⦏pair_rw_canon⦎ : CANON =
	REWRITE_CAN
	(REPEAT_CAN(FIRST_CAN [
	∀_rewrite_canon,
	∧_rewrite_canon,
	¬_rewrite_canon,
	f_rewrite_canon,
	⇔_t_rewrite_canon]));
=TEX
\section{PROOF CONTEXTS}
\subsection{Local Theorems}
=SML
fun ⦏sprove⦎ (tm : TERM) = tac_proof(([],tm),REPEAT strip_tac);
val ⦏lif_thm⦎ = sprove ⌜∀ a t1 t2⦁ (if a then t1 else t2) ⇔ (a ⇒ t1) ∧ (¬ a ⇒ t2)⌝;
val ⦏l∨_¬_thm⦎ = sprove ⌜∀ t1 t2 ⦁ (t1 ∨ ¬ t2) ⇔ (t2 ⇒ t1)⌝;
val ⦏l¬_∨_thm⦎ = sprove ⌜∀ t1 t2 ⦁ (¬ t1 ∨ t2) ⇔ (t1 ⇒ t2)⌝;
val ⦏l∨_thm⦎ = sprove ⌜∀ t1 t2 ⦁ (t1 ∨ t2) ⇔ (¬ t1 ⇒ t2)⌝;
=TEX
\subsection{The Contexts}
Now create a build proof contexts (which will be completed and commited in
\cite{DS/FMU/IED/IMP076}).
=SML
val _ = new_pc ⦏"'paired_abstractions"⦎;
val _ = set_st_eqn_cxt [
		 (⌜¬ x⌝, ¬_in_conv),
		 (⌜$∃⋎1(Uncurry f)⌝, ∃⋎1_conv),
		 (⌜$∀ (Uncurry f)⌝, ∀_uncurry_conv),
		 (⌜$∃ (Uncurry f)⌝, ∃_uncurry_conv)
		 ] "'paired_abstractions";
val _ = set_sc_eqn_cxt [(⌜¬ x⌝, ¬_in_conv),
		 (⌜$∀ (Uncurry f)⌝, ∀_uncurry_conv)] "'paired_abstractions";
val _ = set_rw_canons [∀_rewrite_canon,
		¬_rewrite_canon] "'paired_abstractions";
val _ = set_rw_eqn_cxt [(⌜Uncurry x y⌝, β_conv)]
	"'paired_abstractions";
=TEX
Now set this context plus ``build$\-\_$propositions''as the current ones:
=SML
val _ = set_merge_pcs ["'propositions",
	"'paired_abstractions"];
=TEX
Restore the previous theory:
=SML
val _ = open_theory was_theory;
=TEX
\section{END OF THE STRUCTURE}
=SML
end; (* of structure Tactics3 *)
open Tactics3;
=TEX
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}




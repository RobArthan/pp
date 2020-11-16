=IGN
********************************************************************************
imp083.doc: this file is part of the PPZed system

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

\def\Title{Implementation of the Z Library Relations}

\def\AbstractText{This document contains the implementation of the derived rules of inference, conversions and tactics for the ProofPower Z set theory, tuples and cartesian products.}

\def\Reference{DS/FMU/IED/IMP083}

\def\Author{D.J. King, K. Blackburn}


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
%% LaTeX2e port: \TPPtitle{Implementation of the Z Library Relations}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP083}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.23 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2005/08/11 12:13:04 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: %\TPPauthor{K.Blackburn & WIN01}
%% LaTeX2e port: \TPPauthors{D.J.~King & WIN01\\K.~Blackburn & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document contains the implementation
%% LaTeX2e port: of the derived rules of inference, conversions and tactics for the ProofPower Z set theory, tuples and cartesian products.}
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
\item [Issues 1.1 (1992/10/19)]
First version, derived from \cite{DS/FMU/IED/IMP042}.
\item [Issues 1.2 (1992/10/21) (21st October 1992)]
Corrected pre-processing in proof contexts,
added in $z\-\_rel\-\_inv\-\_thm$.
\item [Issues 1.3 (1992/10/21) (21st October 1992)]
Removed consistency function.
\item [Issues 1.4 (1992/10/22) (22nd October 1992)]
ML typo.
\item [Issues 1.5 (1992/10/22) (22nd October 1992)]
Improved use of $z\_rel\_inv\_thm$, changed $z\_id\_thm$.
\item [Issue 1.6 (1992/10/23) (22nd October 1992)]
Change of name and nature to Z Library Relations.
\item [Issue 1.7 (1992/10/28),1.8 (1992/10/30) (30th October 1992)]
Reorganising Z theory material.
\item [Issue 1.9 (1992/11/12), 12th November 1992]
Changes as a consequence of changes in dependences.
\item [Issue 1.9 (1992/11/12), 4th December 1992]
Bug fix after parser change.
\item[Issue 1.12 (1992/12/08) (8th December 1992)]
Removed mention of ``$'$z$\_$schemas$\_$ext''.
\item[Issue 1.13 (1992/12/11) (11th December 1992)]
Global rename from wrk038.doc issue 1.9.
\item[Issue 1.14 (1993/02/10) (5th February 1993)]
Rearranging proof contexts.
\item[Issue 1.15 (1993/02/11) (11th February 1993)]
Correcting ``$'$z$\_$elementwise$\_$eq''.
\item[Issue 1.16 (1993/02/11) (11th February 1993)]
Correcting ``$'$z$\_$tuples''.
\item[Issue 1.17 (1993/02/12) (12th February 1993)]
Correcting clauses. Rearranging proof contexts.
\item[Issue 1.18 (1997/04/23) (23rd April 1997)]
Added notes as to where $dest\_z\_term1$ not appropropriate.
\item[Issue 1.19 (1999/02/17) (17th February 1999)]
Updates for SML'97.
\item[Issue 1.20 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.21 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.22 (2004/01/19)] The Z universal set is now called 𝕌.
\item[Issue 1.23 (2005/08/11)] Corrected {\em z\_dom\_clauses} and {\em z\_ran\_clauses}.
\item[Issue 1.24 (2006/02/02)] Functional composition is now called ``∘''.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported PPZed to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
None.
\pagebreak
\section{GENERAL}
\subsection{Scope}
This document contains a implementation for the
derived rules of inference, conversions and tactics for
the ProofPower Z (see \cite{DS/FMU/IED/HLD015}) set theory, tuples and cartesian products.
This is called for in \cite{DS/FMU/IED/HLD016}.
The design is
given in \cite{DS/FMU/IED/DTD083}.
\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains an implementation for the
initial set of rules, conversions and tactics for the set theory, tuples and cartesian products of the ProofPower Z.
\subsubsection{Dependencies}
This document takes its signature from \cite{DS/FMU/IED/DTD083}.
\subsubsection{Deficiencies}
$z\_×\_conv$ is comparatively slow compared to like functions.
\subsubsection{Possible Enhancements}
None known.

\section{PREAMBLE}
Structure done in two parts.
=SML
structure ⦏ZRelations⦎ : ZRelations = struct
=TEX
=SML
open ZGeneratedConstants;
val lthy = get_current_theory_name();
val _ = open_theory ⦏"z_relations"⦎;
val _ = push_merge_pcs ["z_predicates","'z_∈_set_lang",
	"'z_bindings","'z_normal","'z_tuples_lang",
	"'z_∈_set_lib"];
val _ = set_flag("z_type_check_only",false);
=TEX
Get the definitions out:
=SML
	val z_↔_def = get_spec ⓩ(_ ↔ _)⌝;
	val z_↦_def = get_spec ⓩ(_ ↦ _)⌝;
	val z_dom_def = get_spec ⓩ(dom)⌝;
	val z_ran_def = get_spec ⓩ(ran)⌝;
	val z_id_def = get_spec ⓩ(id _)⌝;
	val z_⨾_def = get_spec ⓩ(_ ⨾ _)⌝;
	val z_∘_def = get_spec ⓩ(_ ∘ _ )⌝;
	val z_◁_def = get_spec ⓩ(_ ◁ _)⌝;
	val z_▷_def = get_spec ⓩ(_ ▷ _)⌝;
	val z_⩤_def = get_spec ⓩ(_ ⩤ _)⌝;
	val z_⩥_def = get_spec ⓩ(_ ⩥ _)⌝;
	val z_rel_inv_def = get_spec ⓩ(_ ↗~↕)⌝;
	val z_rel_image_def = get_spec ⓩ(_ ⦇ _ ⦈)⌝;
	val z_tc_def = get_spec ⓩ(_ ↗+↕)⌝;
	val z_rtc_def = get_spec ⓩ(_ ↗*↕)⌝;
	val z_⊕_def = get_spec ⓩ(_ ⊕ _)⌝;
=TEX

\section{THE CODE}
\subsection{Utilities}
A precaution, lost outside of structure:
=SML
fun ⦏save_thm⦎(a,b) = KernelInterface.save_thm(a, check_is_z_thm "save_thm" b);
fun ⦏list_save_thm⦎(a,b) = KernelInterface.list_save_thm(a, check_is_z_thm "list_save_thm" b);
=SML
fun ⦏list_eq⦎ (eq : 'a * 'a -> bool) (a :: x) (b :: y) =
	eq(a,b) andalso list_eq eq x y
| list_eq _ [] [] = true
| list_eq _ _ _ = false;
=TEX
Some universes:
=SML
val ⦏Ua⦎ = ⓩ𝕌⌝; (* type = 'a SET *)
val ⦏Ub⦎ = inst [] [(ⓣ'b⌝,ⓣ'a⌝)] Ua;
val ⦏Uc⦎ = inst [] [(ⓣ'c⌝,ⓣ'a⌝)] Ua;
=TEX
\subsubsection{Conversionals}
Apply through all $λ$'s.
=SML
val rec ⦏ALL_SIMPLE_λ_C⦎ : CONV -> CONV = (fn cnv => fn tm =>
	(SIMPLE_λ_C (ALL_SIMPLE_λ_C cnv)
	ORELSE_C cnv) tm
);
=TEX
Apply to the last $∀$ in a sequence.
=SML
fun ⦏LAST_SIMPLE_∀_C⦎ (conv:CONV): CONV = (fn tm =>
	if is_simple_∀ (snd(dest_simple_∀ tm))
	then (SIMPLE_BINDER_C (LAST_SIMPLE_∀_C conv)) tm
	else conv tm
);
=TEX
Diagnostic Conversional:
=SML
fun ⦏DIAG_C⦎ (caller:string) (conv:CONV):CONV = (fn tm =>
	(diag_string(caller ^ " " ^ string_of_term tm);
	conv tm)
);
=TEX
Apply a conversion to all conjuncts:
=SML
fun ⦏∧_C⦎ (cnv:CONV) :CONV = (fn tm =>
	if is_∧ tm
	then APP_C(RAND_C(∧_C cnv),∧_C cnv) tm
	else cnv tm
);
=TEX
Apply a list of conversions, on to each argument of a nested
sequence of operators:
=FRULE 1 Conversional
LIST_OP_C
[cnv1,cnv2,cnv3,...]
⌜op a1 (op a2 (op a3 ...))⌝
├
├
⊢ (op a1 (op a2 (op a3 ...))) =
   op a1' (op a2' (op a3' ...))
=TEX
where
=GFT
cnv1 a1 = ⊢ a1 = a1'
cnv2 a2 = ⊢ a2 = a2'
cnv3 a3 = ⊢ a3 = a3'
 ...
=TEX
=SML
fun ⦏LIST_OP_C⦎ [cnv] = cnv
| LIST_OP_C ((cnv:: cnvl):CONV list) :CONV =
	APP_C(RAND_C cnv, LIST_OP_C cnvl)
| LIST_OP_C [] = fail "LIST_∧_C" 0 [];
=TEX
Rename a sequence of quantified variables:
=SML
local
	fun simple_α_conv1 nm :CONV= (fn tm =>
		(simple_α_conv nm
		ORELSE_C
		simple_α_conv1 (nm ^ get_variant_suffix())) tm);
in
fun ⦏seq_binder_simple_α_conv⦎ [a]:CONV  = (
let	val nm = fst(dest_var a);
in
	RAND_C (simple_α_conv1 nm)
end
) | seq_binder_simple_α_conv (a::x) = (
let	val nm = fst(dest_var a);
in
	(RAND_C (simple_α_conv1 nm)) THEN_C BINDER_C (seq_binder_simple_α_conv x)
end
) | seq_binder_simple_α_conv [] = id_conv;
end;
=TEX
=SML
val rec ⦏seq_simple_β_conv⦎ :CONV = (fn tm =>
	(simple_β_conv
	ORELSE_C
	(RATOR_C seq_simple_β_conv THEN_C simple_β_conv)
	ORELSE_C
	(fn tm1 => term_fail "seq_simple_β_conv" 27008 [tm1]))
	tm
);
=TEX
Change a free variable name:
=SML
fun ⦏change_name_rule⦎ from_nm to_nm thm = (
let	val fvs = map dest_var (frees(concl thm));
	val ty = lassoc3 fvs from_nm;
in
	simple_∀_elim (mk_var(to_nm, ty))
	(simple_∀_intro (mk_var(from_nm, ty)) thm)
end);
=TEX

\subsubsection{Projection Conversions}
=SML
val ⦏dpvt_proj_thm⦎:THM = all_∀_intro(list_∧_intro
	(strip_∧_rule (all_∀_elim (get_spec ⌜$"Z'S[d,p,t,v]v"⌝))
		to 3));
local
	val cnjs = strip_∧_rule(all_∀_elim dpvt_proj_thm);
in
	val (⦏d_dptv_proj_conv⦎,⦏p_dptv_proj_conv⦎,
		⦏t_dptv_proj_conv⦎, ⦏v_dptv_proj_conv⦎) =
		case (map (fn t => simple_eq_match_conv
			(all_∀_intro t)) cnjs) of
		[a,b,c,d] => (a,b,c,d)
		| _ => fail "" 0 [];
end;
=TEX
=SML
val ⦏dpv_proj_thm⦎:THM = all_∀_intro(list_∧_intro
	(strip_∧_rule (all_∀_elim (get_spec ⌜$"Z'S[d,p,v]v"⌝))
		to 2));
local
	val cnjs = strip_∧_rule(all_∀_elim dpv_proj_thm);
in
	val ⦏d_dpv_proj_conv⦎ = simple_eq_match_conv1
		(all_∀_intro (hd cnjs));
	val ⦏p_dpv_proj_conv⦎ = simple_eq_match_conv1
		(all_∀_intro (hd (tl cnjs)));
	val ⦏v_dpv_proj_conv⦎ = simple_eq_match_conv1
		(all_∀_intro (hd (tl (tl cnjs))));
end;
=TEX
=SML
local
	val cnjs = strip_∧_rule(all_∀_elim (get_specⓩ(x,y).1⌝));
in
val ⦏tuple2_1_proj_conv⦎ = simple_eq_match_conv1 (all_∀_intro (hd cnjs));
val ⦏tuple2_2_proj_conv⦎ = simple_eq_match_conv1 (all_∀_intro (hd (tl cnjs)));
;
end;
=TEX
=SML
fun use_ext_pc () = push_merge_pcs ["z_predicates","'z_∈_set_lang",
	"'z_bindings","'z_normal","'z_tuples_lang",
	"'z_∈_set_lib","'z_sets_ext_lang","'z_sets_ext_lib", "'z_tuples_lang"];
=TEX
\section{THE IMPLEMENTATION}
=SML
local
	val spec = (rewrite_rule[]z_↔_def);
in
val ⦏z_↔_thm⦎ = save_thm("z_↔_thm",
	all_z_∀_intro(all_∀_elim
	(inst_type_rule[(ⓣ'b⌝,ⓣ'Y⌝),(ⓣ'a⌝,ⓣ'X⌝)]spec)));
end;
=TEX


\section{TUPLES}
=SML
local
	val spec = rewrite_rule[]
		(list_∀_elim[Ua,Ub]
		(rewrite_rule[]z_↦_def));
in
val ⦏z_↦_thm⦎ = save_thm("z_↦_thm",
	(nth 1 (strip_∧_rule spec)));
end;
=TEX
=SML
val ⦏z_↦_conv⦎ : CONV = simple_eq_match_conv1 (conv_rule
		z_∀_elim_conv1 z_↦_thm);
=TEX
=SML
local
	fun aux thm [] [] = thm
	| aux thm (a::x)(b::y) = aux (mk_app_rule thm (asm_rule (mk_z_eq (a, b)))) x y
	| aux _ _ _ = error "z_tuple_eq_conv" 0 [];
	
	fun aux1 tm [] [] = tm
	| aux1 tm (a::x)(b::y) = aux1 (mk_z_∧(mk_z_eq (a,b), tm)) x y
	|aux1 _ _ _ = error "z_tuple_eq_conv" 0 [];

	fun make_z_tuple_conv tm = (
		case dest_z_term tm of (* dest_z_term1 not appropriate here KB *)
		ZTuple _ => refl_conv tm
		| ZApp(maplet,_) => (case dest_z_term maplet of (* or here KB *)
			ZGVar("_ ↦ _",_,_) => z_↦_conv tm
			| _ => z_sel⋎t_intro_conv tm
		) | _ => z_sel⋎t_intro_conv tm
	);
in
val ⦏z_tuple_eq_conv⦎ : CONV = (fn tm =>
let	val (lhs,rhs) = dest_z_eq tm
		handle (Fail _) =>
		term_fail "z_tuple_eq_conv" 42003 [tm];
	val s0 = (if is_z_tuple lhs andalso is_z_tuple rhs
		then refl_conv tm
		else
		((LEFT_C z_↦_conv AND_OR_C RIGHT_C z_↦_conv)
		tm))
		handle (Fail _) =>
		term_fail "z_tuple_eq_conv" 42003 [tm];
	val tm' = snd(dest_eq(concl s0));
	val (lhs,rhs) = dest_z_eq tm';
	val dummy = if is_z_tuple lhs andalso is_z_tuple rhs
		then ()
		else term_fail "z_tuple_eq_conv" 42003 [tm];
	val spec = get_spec lhs;
	val proj_thms = map all_∀_intro
		(rev(tl(rev(strip_∧_rule(all_∀_elim spec)))));
	val (tcons,tproj) = get_tuple_info (type_of lhs);
	val lhs_bits = dest_z_tuple lhs;
	val rhs_bits = dest_z_tuple rhs;
	val tcons' = fst(strip_app lhs);
	val ty_insts = fst(term_match tcons' tcons);
	val s1 = aux (refl_conv tcons') lhs_bits rhs_bits;
	val rlhs_bits = rev lhs_bits;
	val rrhs_bits = rev rhs_bits;
	val res = aux1 (mk_z_eq(hd rlhs_bits, hd rrhs_bits))
		(tl rlhs_bits) (tl rrhs_bits);
	val s2 = strip_∧_rule (asm_rule res);
	val s3 = fold (uncurry prove_asm_rule) s2 s1;
	val s4 = asm_rule tm';
	val s5 = map (fn (x,xthm) =>
		conv_rule(APP_C(RAND_C(simple_eq_match_conv1 xthm),
			simple_eq_match_conv1 xthm))
		(app_fun_rule (inst [] ty_insts x) s4))
		(combine tproj proj_thms);
	val s6 = list_∧_intro s5;
	val s7 = ⇔_intro(all_⇒_intro s6) (all_⇒_intro s3);
in
	check_is_z_conv_result "z_tuple_eq_conv"
	(eq_trans_rule s0 s7)
end);
val ⦏z_tuple_eq_conv1⦎ : CONV = (fn tm =>
let	val (lhs,rhs) = dest_z_eq tm
		handle (Fail _) =>
		term_fail "z_tuple_eq_conv1" 83001 [tm];
	val s0 = (LEFT_C make_z_tuple_conv THEN_C RIGHT_C make_z_tuple_conv) tm
		handle (Fail _) =>
		term_fail "z_tuple_eq_conv1" 83001 [tm];
	val tm' = snd(dest_eq(concl s0));
	val (lhs,rhs) = dest_z_eq tm';
	val dummy = if is_z_tuple lhs andalso is_z_tuple rhs
		then ()
		else term_fail "z_tuple_eq_conv1" 83001 [tm];
	val spec = get_spec lhs;
	val proj_thms = map all_∀_intro
		(rev(tl(rev(strip_∧_rule(all_∀_elim spec)))));
	val (tcons,tproj) = get_tuple_info (type_of lhs);
	val lhs_bits = dest_z_tuple lhs;
	val rhs_bits = dest_z_tuple rhs;
	val tcons' = fst(strip_app lhs);
	val ty_insts = fst(term_match tcons' tcons);
	val s1 = aux (refl_conv tcons') lhs_bits rhs_bits;
	val rlhs_bits = rev lhs_bits;
	val rrhs_bits = rev rhs_bits;
	val res = aux1 (mk_z_eq(hd rlhs_bits, hd rrhs_bits))
		(tl rlhs_bits) (tl rrhs_bits);
	val s2 = strip_∧_rule (asm_rule res);
	val s3 = fold (uncurry prove_asm_rule) s2 s1;
	val s4 = asm_rule tm';
	val s5 = map (fn (x,xthm) =>
		conv_rule(APP_C(RAND_C(simple_eq_match_conv1 xthm),
			simple_eq_match_conv1 xthm))
		(app_fun_rule (inst [] ty_insts x) s4))
		(combine tproj proj_thms);
	val s6 = list_∧_intro s5;
	val s7 = ⇔_intro(all_⇒_intro s6) (all_⇒_intro s3);
in
	check_is_z_conv_result "z_tuple_eq_conv1"
	(eq_trans_rule s0 s7)
end);
end;
=TEX
=IGN
z_tuple_eq_conv ⓩ(1,2,3) = (p,q,r)⌝;
z_tuple_eq_conv ⓩ(1 ↦ 2) = (p,q)⌝;
=SML
val ⦏z_sel⋎t_conv⦎ : CONV = (fn tm =>
let	val (bdy,n) = dest_z_sel⋎t tm
		handle complaint =>
		pass_on complaint "dest_z_sel⋎t" "z_sel⋎t_conv";
	val spec = get_spec tm;
	val s0 = (if is_z_tuple bdy
		then refl_conv tm
		else (RAND_C z_↦_conv) tm)
		handle (Fail _) =>
		term_fail "z_sel⋎t_conv" 42006 [tm];
	val tm' = snd(dest_eq(concl s0));
	val (bdy,n) = dest_z_sel⋎t tm';
	val xi = dest_z_tuple bdy;
	val proj_thm = nth (n-1)
		(strip_∧_rule(list_∀_elim (bdy :: xi) spec));
in
	check_is_z_conv_result "z_sel⋎t_conv"
	(eq_trans_rule s0 proj_thm)
end);
=TEX
=IGN
z_sel⋎t_conv ⓩ(1,2,3,4).2⌝;
z_sel⋎t_conv ⓩ(1 ↦ 2).2⌝;
=SML
val ⦏z_tuple_intro_conv⦎ : CONV = (fn tm =>
let	val s0 = if is_z_tuple tm
		then refl_conv tm
		else (z_↦_conv ORELSE_C
		(fn _ => term_fail "z_tuple_intro_conv" 42005 [tm])) tm;
	val tm' = snd(dest_eq(concl s0));
	val xi = dest_z_tuple tm'
		handle (Fail _) =>
		term_fail "z_tuple_intro_conv" 42005 [tm];
	val tuple= fst(dest_z_sel⋎t(hd xi))
		handle (Fail _) =>
		term_fail "z_tuple_intro_conv" 42005 [tm];
	val spec = all_∀_elim (∀_elim tuple (get_spec tm'))		handle (Fail _) =>
		term_fail "z_tuple_intro_conv" 42005 [tm];
	val cthm = hd(rev(strip_∧_rule spec));
in
		check_is_z_conv_result "z_tuple_intro_conv"
		(eq_trans_rule s0 cthm
		handle complaint =>
		divert complaint "eq_trans_rule" "z_tuple_intro_conv" 42005
			[fn () => string_of_term tm])
end);
=TEX
=IGN
z_tuple_intro_conv ⓩ((1,2,3).1,(1,2,3).2,(1,2,3).3)⌝;
z_tuple_intro_conv ⓩ((1 ↦ 2).1,(1 ↦ 2).2)⌝;
=TEX
\section{RELATIONS}
=SML
val ⦏u_↔_u_thm⦎ = prove_rule [z_↔_def]  ⓩ𝕌 ↔ 𝕌 = 𝕌⌝;
=TEX
=SML
local
	val spec = rewrite_rule[u_↔_u_thm]
		(list_∀_elim[Ua,Ub]
		(rewrite_rule[]z_dom_def));
	val s1 = conv_rule z_∀_elim_conv1(∧_right_elim spec);
	val s2 = rewrite_rule [z_sets_ext_thm] s1;
	val s3 = conv_rule (ONCE_MAP_C (z_∃_elim_conv1 THEN_C
			prove_∃_conv THEN_C
			z_∃_intro_conv)) s2;
	val s4 = all_∀_elim s3;
in
val ⦏z_dom_thm⦎ = save_thm("z_dom_thm",
	pure_rewrite_rule[z_↦_thm]
	(all_z_∀_intro(all_∀_elim(conv_rule z_∀_elim_conv1(∧_left_elim s4)))));
val ⦏z_ran_thm⦎ = save_thm("z_ran_thm",
	pure_rewrite_rule[z_↦_thm]
	(inst_type_rule [(ⓣ'b⌝,ⓣ'a⌝),(ⓣ'a⌝,ⓣ'b⌝)]
	(all_z_∀_intro(all_∀_elim(conv_rule z_∀_elim_conv1(∧_right_elim s4))))));
end;
=TEX
=SML
val _ = use_ext_pc();
local
	val spec = all_z_∀_intro(all_∀_elim(rewrite_rule[]
		z_id_def));
in
val ⦏z_id_thm⦎ = save_thm("z_id_thm",(
push_goal([],ⓩ∀ X: 𝕌⦁ id X = {x : 𝕌 | x ∈ X ⦁ (x, x)}⌝);
a(rewrite_tac[spec, z_↦_thm]);
a(REPEAT strip_tac THEN prop_eq_prove_tac[]);
a(z_spec_nth_asm_tac 3 ⓩx1⌝);
pop_thm()));
end;
val _ = pop_pc();
=TEX
=SML
local
	val spec = rewrite_rule[u_↔_u_thm]
		(list_∀_elim[Ua,Ub,Uc]
		(rewrite_rule[]z_⨾_def));
	val s1 = conv_rule z_∀_elim_conv1(∧_right_elim spec);
	val s2 = rewrite_rule [z_sets_ext_thm]
		(∧_right_elim(all_∀_elim s1));
	val s3 = all_∀_elim(conv_rule z_∀_elim_conv1 s2);
	val s4 = conv_rule (RIGHT_C
		(z_∃_elim_conv1 THEN_C
		ALL_SIMPLE_∃_C(
		RIGHT_C (RIGHT_C z_sel⋎t_intro_conv THEN_C
			z_tuple_eq_conv))
		THEN_C prove_∃_conv
		THEN_C z_∃_intro_conv)) s3;
in
val ⦏z_⨾_thm⦎ = save_thm("z_⨾_thm",
	all_z_∀_intro(∧_left_elim(all_∀_elim s1)));
val ⦏z_∘_thm⦎ = save_thm("z_∘_thm",
	pure_rewrite_rule[z_↦_thm]
	(inst_type_rule[(ⓣ'b⌝,ⓣ'c⌝),(ⓣ'c⌝,ⓣ'b⌝)]
	(all_z_∀_intro (change_name_rule "z" "x" s4))));
end;
=TEX
=SML
local
	val spec = rewrite_rule[u_↔_u_thm]
		(list_∀_elim[Ua,Ub]
		(rewrite_rule[]z_◁_def));
	val s1 = conv_rule(MAP_C z_∀_elim_conv1)
		(rewrite_rule[z_sets_ext_thm]
		(∧_right_elim spec));
	val s2 = all_∀_elim(∧_left_elim s1);
	val s3 = conv_rule (RIGHT_C
		(z_∃_elim_conv1 THEN_C
		ALL_SIMPLE_∃_C(
		RIGHT_C (RIGHT_C z_sel⋎t_intro_conv
			THEN_C z_tuple_eq_conv))
		THEN_C (MAP_C prove_∃_conv))) s2;
	val s4 = conv_rule(RIGHT_C(RIGHT_C(LEFT_C z_tuple_intro_conv))) s3;
	val s5 = ∧_right_elim s1;
	val s6 = all_∀_elim (conv_rule (BINDER_C(RAND_C(simple_α_conv "S"))) s5);
	val s7 = conv_rule (RIGHT_C
		(z_∃_elim_conv1 THEN_C
		ALL_SIMPLE_∃_C(
		RIGHT_C (RIGHT_C z_sel⋎t_intro_conv
			THEN_C z_tuple_eq_conv))
		THEN_C (MAP_C prove_∃_conv))) s6;
	val s8 = conv_rule(RIGHT_C(LEFT_C(LEFT_C z_tuple_intro_conv))) s7;

in
val ⦏z_◁_thm⦎ = save_thm("z_◁_thm",
	all_z_∀_intro (change_name_rule "z" "x" s4));
val ⦏z_▷_thm⦎ = save_thm("z_▷_thm",
	all_z_∀_intro (change_name_rule "z" "x" s8));
end;
=TEX
=SML
local
	val spec = rewrite_rule[u_↔_u_thm]
		(list_∀_elim[Ua,Ub]
		(rewrite_rule[] z_⩤_def));
	val s1 = conv_rule(MAP_C z_∀_elim_conv1)
		(rewrite_rule[z_sets_ext_thm]
		(conv_rule(ONCE_MAP_C z_∀_elim_conv1)
		(∧_right_elim spec)));
	val s2 = all_∀_elim(∧_left_elim s1);
	val s3 = conv_rule (RIGHT_C
		(z_∃_elim_conv1 THEN_C
		ALL_SIMPLE_∃_C(
		RIGHT_C (RIGHT_C z_sel⋎t_intro_conv THEN_C
			z_tuple_eq_conv))
		THEN_C (MAP_C prove_∃_conv))) s2;
	val s4 = conv_rule(RIGHT_C(RIGHT_C(LEFT_C z_tuple_intro_conv))) s3;
	val s5 = ∧_right_elim s1;
	val s6 = all_∀_elim (conv_rule (BINDER_C(RAND_C(simple_α_conv "S"))) s5);
	val s7 = conv_rule (RIGHT_C
		(z_∃_elim_conv1 THEN_C
		ALL_SIMPLE_∃_C(
		RIGHT_C (RIGHT_C z_sel⋎t_intro_conv THEN_C
			z_tuple_eq_conv))
		THEN_C (MAP_C prove_∃_conv))) s6;
	val s8 = conv_rule(RIGHT_C(LEFT_C(LEFT_C z_tuple_intro_conv))) s7;

in
val ⦏z_⩤_thm⦎ = save_thm("z_⩤_thm",
	all_z_∀_intro (change_name_rule "z" "x" s4));
val ⦏z_⩥_thm⦎ = save_thm("z_⩥_thm",
	all_z_∀_intro (change_name_rule "z" "x" s8));
end;
=TEX

=SML
local
	val spec = rewrite_rule[u_↔_u_thm]
		(list_∀_elim[Ua,Ub]
		(rewrite_rule[]z_rel_inv_def));
	val s1 = conv_rule z_∀_elim_conv1
		(∧_right_elim spec);
	val p = mk_var("p",type_of ⓩ(p,q)⌝);
	val s2 = (pure_rewrite_conv [s1]  THEN_C z_∈_seta_conv)
		(snd(strip_∀ ⓩ[a,b] ((x ⦂ (a × b)).1,x.2) ∈ R ↗~↕⌝));
	val s3 = conv_rule (RIGHT_C
		(z_∃_elim_conv1 THEN_C
		ALL_SIMPLE_∃_C(
		RIGHT_C (LEFT_C (rewrite_conv [z_↦_thm]) THEN_C
			z_tuple_eq_conv))
		THEN_C (MAP_C prove_∃_conv))) s2;
	val s4 = conv_rule(MAP_C z_tuple_intro_conv) s3;
in
val ⦏z_rel_inv_thm⦎ = save_thm("z_rel_inv_thm",
	pure_rewrite_rule[z_↦_thm]
	(all_z_∀_intro s4));
end;
=TEX
=SML
local
	val spec = rewrite_rule[u_↔_u_thm]
		(list_∀_elim[Ua,Ub]
		(rewrite_rule[]z_rel_image_def));
	val s1 = all_∀_elim(conv_rule z_∀_elim_conv1
		(∧_right_elim spec));
	val s2 = (∀_elim ⌜y:'b⌝
		(conv_rule z_∀_elim_conv1
		(rewrite_rule[z_sets_ext_thm] s1)));
	val s3 = conv_rule (RIGHT_C
		(z_∃_elim_conv1 THEN_C
		prove_∃_conv)) s2;
	val ∧_t_∧_thm = taut_rule⌜∀ x y⦁ x ∧ y ⇔ x ∧ T ∧ y⌝;
	val s4 = conv_rule (RIGHT_C (BINDER_C(LEFT_C
		(Z_DECL_INTRO_C z_pred_dec_conv) THEN_C
		simple_eq_match_conv1 ∧_t_∧_thm)
		THEN_C z_∃_intro_conv1)) s3;
in
val ⦏z_rel_image_thm⦎ = save_thm("z_rel_image_thm",
	conv_rule ((ONCE_MAP_C
		(z_∃_elim_conv THEN_C z_∃_intro_conv THEN_C rewrite_conv[])))
	(inst_type_rule [(ⓣ'b⌝,ⓣ'a⌝),(ⓣ'a⌝,ⓣ'b⌝)]
	(pure_rewrite_rule[z_↦_thm]
	(all_z_∀_intro s4))));
end;
=TEX
=SML
local
	val spec = rewrite_rule[u_↔_u_thm]
		(list_∀_elim[Ua]
		(rewrite_rule[]z_tc_def));
	val s1 = all_∀_elim(conv_rule z_∀_elim_conv1
		(∧_right_elim spec));
in
val ⦏z_trans_closure_thm⦎ = save_thm("z_trans_closure_thm",
	all_z_∀_intro(∧_left_elim s1));
val ⦏z_reflex_trans_closure_thm⦎ =
	save_thm("z_reflex_trans_closure_thm",
		all_z_∀_intro(∧_right_elim s1));
end;
=TEX
=SML
local
	val spec = rewrite_rule[u_↔_u_thm]
		(list_∀_elim[Ua,Ub]
		(rewrite_rule[]z_⊕_def));
in
val ⦏z_⊕_thm⦎ = save_thm("z_⊕_thm",
	all_z_∀_intro(all_∀_elim(
	conv_rule z_∀_elim_conv1
	(nth 1 (strip_∧_rule spec)))));
end;
=TEX
\subsection{Elementwise Equality}
=SML
val ⦏z_binding_eq_conv3⦎ : CONV = (fn tm =>
let	val s1 =z_binding_eq_conv1 tm
		handle complaint =>
		pass_on complaint "z_binding_eq_conv1" "z_binding_eq_conv3";
	val (lhs,rhs) = dest_eq tm;
in
	case (is_z_θ lhs, is_z_θ rhs) of
	(false,false) => s1
	| (true,false) => (let val s2 = z_θ_conv lhs;
		val cnv1 = RAND_C(fn _ => s2) THEN_C z_sel⋎s_conv;
		val res =
		conv_rule(RIGHT_C(∧_C(LEFT_C cnv1))) s1;
	in
		check_is_z_conv_result "z_binding_eq_conv3"
		(eq_trans_rule(refl_conv tm) res)
	end)
	| (false,true) => (let val s2 = z_θ_conv rhs;
		val cnv1 = RAND_C(fn _ => s2) THEN_C z_sel⋎s_conv;
		val res =
		conv_rule(RIGHT_C(∧_C(RIGHT_C cnv1))) s1;
	in
		check_is_z_conv_result "z_binding_eq_conv3"
		(eq_trans_rule(refl_conv tm) res)
	end)
	| (true,true) =>  (let val s2 = z_θ_conv lhs;
		val s3 = z_θ_conv rhs;
		val cnv1 = RAND_C(fn _ => s2) THEN_C z_sel⋎s_conv;
		val cnv2 = RAND_C(fn _ => s3) THEN_C z_sel⋎s_conv;
		val res =
		conv_rule(RIGHT_C(∧_C(LEFT_C cnv1 THEN_C RIGHT_C cnv2))) s1;
	in
		check_is_z_conv_result "z_binding_eq_conv3"
		(eq_trans_rule(refl_conv tm) res)
	end)
end);
=IGN
z_binding_eq_conv3 ⓩ(a ≜ 1,b ≜ 2) = (a ≜ 3, b ≜ 4)⌝;
z_binding_eq_conv3 ⓩp = (a ≜ 3, b ≜ 4)⌝;
z_binding_eq_conv3 ⓩ(a ≜ 1,b ≜ 2) = q⌝;
z_binding_eq_conv3 ⓩ(p⦂[a,b:X]) = q⌝;
z_binding_eq_conv3 ⓩθ (S⦂ℙ [a,b:X| a=b]) = (a ≜ 3, b ≜ 4)⌝;
z_binding_eq_conv3 ⓩ(a ≜ 3, b ≜ 4) = θ (S⦂ℙ [a,b:X| a=b])⌝;
z_binding_eq_conv3 ⓩθ ([a,b:X]) ' = θ (S⦂ℙ [a,b:X| a=b])⌝;
=TEX
\section{PROOF CONTEXTS}
\subsection{Utilities}
The following is in recognition of the problems of
using Z generated constants with discrimination nets.
=SML
local
	val cnv1 = simple_eq_match_conv1 (
		conv_rule z_∀_elim_conv1 z_sets_ext_thm);
in
fun ⦏make_∈_rule⦎ thm = all_∀_intro
	(conv_rule z_∀_elim_conv1
	(conv_rule cnv1
	(all_∀_elim
	(conv_rule(TRY_C z_∀_elim_conv1) thm))));
end;
=TEX
=SML
fun ⦏make_pair_trio_rule⦎ thm = (
let	val s1 = all_∀_intro
		(conv_rule (MAP_C z_sel⋎t_conv)
		(∀_elim ⓩ(p1,p2)⌝
		(all_∀_intro
		(all_∀_elim
		(conv_rule z_∀_elim_conv1 thm)))));
	val s2 = all_∀_intro
		(conv_rule (MAP_C z_sel⋎t_conv)
		(∀_elim ⓩ(p1 ↦ p2)⌝ (all_∀_intro
		(all_∀_elim
		(conv_rule z_∀_elim_conv1 thm)))));
in
	list_∧_intro [thm, s1, s2]
end);
=TEX
=SML
val ⦏∈_operator_clauses1⦎ = [
	make_∈_rule z_⊕_thm,
	make_∈_rule z_trans_closure_thm,
	make_∈_rule z_reflex_trans_closure_thm,
	z_rel_image_thm,
	make_pair_trio_rule z_rel_inv_thm,
	make_pair_trio_rule z_⩤_thm,
	make_pair_trio_rule z_⩥_thm,
	make_pair_trio_rule z_◁_thm,
	make_pair_trio_rule z_▷_thm,
	make_pair_trio_rule z_∘_thm,
	make_∈_rule z_⨾_thm,
	make_∈_rule z_id_thm, z_ran_thm, z_dom_thm,
	make_∈_rule z_↔_thm];
=TEX
=SML
fun ⦏thms_to_eqn_cxt⦎ (thms:THM list) : EQN_CXT = (
	flat(map (cthm_eqn_cxt(current_ad_rw_canon())) thms)
);
=TEX	
\subsection{Treatment of Elementwise Equality}
In designing discrimination net indexes we are careful
to use the knowledge that a tuple must have at least 2 elements.
=SML
fun ⦏elementwise_eq_conv⦎ tm = (
let val (lhs,rhs) = dest_eq tm
in
	case dest_z_type (type_of lhs) of
	ZTupleType _ => z_tuple_eq_conv1 tm
	| ZSchemaType _ => z_binding_eq_conv3 tm
	| _ => fail "" 0 []
end);
=TEX
=SML
val _ = delete_pc "'z_elementwise_eq" handle Fail _ => ();
val _ = new_pc "'z_elementwise_eq";
val _ = set_rw_eqn_cxt [(ⓩx = y⌝,elementwise_eq_conv)]"'z_elementwise_eq";
val _ = add_rw_thms
	([]) "'z_elementwise_eq";

val pos = (thms_to_eqn_cxt []) @ [(ⓩx = y⌝,elementwise_eq_conv)];
val neg = map (mk_¬ ** RAND_C) pos;

val _ = set_st_eqn_cxt (pos @ neg) "'z_elementwise_eq";
val _ = set_sc_eqn_cxt (pos @ neg) "'z_elementwise_eq";
val _ = set_rw_canons [] "'z_elementwise_eq";
val _ = set_pr_tac z_basic_prove_tac "'z_elementwise_eq";
val _ = set_pr_conv z_basic_prove_conv "'z_elementwise_eq";
val _ = set_cs_∃_convs [] "'z_elementwise_eq";
val _ = set_∃_vs_thms [] "'z_elementwise_eq";
val _ = commit_pc "'z_elementwise_eq";
=TEX
\subsection{Treatment of Membership of Relations}
In designing discrimination net indexes we are careful
to use the knowledge that a tuple must have at least 2 elements.
=SML
val _ = delete_pc "'z_∈_rel" handle Fail _ => ();
val _ = new_pc "'z_∈_rel";
val _ = set_rw_eqn_cxt []"'z_∈_rel";
val _ = add_rw_thms
	([]
	@ ∈_operator_clauses1) "'z_∈_rel";

val pos = (thms_to_eqn_cxt ∈_operator_clauses1)
	@ [];
val neg = map (mk_¬ ** RAND_C) pos;

val _ = set_st_eqn_cxt (pos @ neg) "'z_∈_rel";
val _ = set_sc_eqn_cxt (pos @ neg) "'z_∈_rel";
val _ = set_rw_canons [] "'z_∈_rel";
val _ = set_pr_tac z_basic_prove_tac "'z_∈_rel";
val _ = set_pr_conv z_basic_prove_conv "'z_∈_rel";
val _ = set_cs_∃_convs [] "'z_∈_rel";
val _ = set_∃_vs_thms [] "'z_∈_rel";
val _ = commit_pc "'z_∈_rel";
=TEX
\subsection{Treatment of Tuples and Cartesian Products}
In designing discrimination net indexes we are careful
to use the knowledge that a tuple must have at least 2 elements.
=SML
val _ = delete_pc "'z_tuples" handle Fail _ => ();
val _ = new_pc "'z_tuples";
val _ = set_rw_eqn_cxt [(ⓩx ∈ ⌜y (z:'c):'b SET⌝⌝,z_∈_×_conv),
	(⌜a1 a2 a3 = b1 b2 b3⌝,z_tuple_eq_conv),
	(⌜f(a1 a2 a3)⌝,z_sel⋎t_conv)
	]"'z_tuples";
val _ = add_rw_thms
	([z_second_thm, z_first_thm]) "'z_tuples";

val pos = [(⌜a1 a2 a3 = b1 b2 b3⌝,z_tuple_eq_conv),
	(ⓩx ∈ ⌜f(a1 a2 a3)⌝⌝,∈_C z_sel⋎t_conv),
	(⌜f(a1 a2 a3):BOOL⌝,z_sel⋎t_conv),
	  (ⓩx ∈ ⌜y (z:'c):'b SET⌝⌝,z_∈_×_conv)];
val neg = map (mk_¬ ** RAND_C) pos;

val _ = set_st_eqn_cxt (pos @ neg) "'z_tuples";
val _ = set_sc_eqn_cxt (pos @ neg) "'z_tuples";
val _ = set_rw_canons [] "'z_tuples";
val _ = set_pr_tac z_basic_prove_tac "'z_tuples";
val _ = set_pr_conv z_basic_prove_conv "'z_tuples";
val _ = set_cs_∃_convs [] "'z_tuples";
val _ = set_∃_vs_thms [] "'z_tuples";
val _ = commit_pc "'z_tuples";
=TEX
\subsection{Treatment of Z Language}
=SML
val _ = delete_pc "z_language" handle (Fail _) => ();
val _ = new_pc "z_language";
val _ = merge_pcs ["z_predicates",
	"'z_∈_set_lang",
	"'z_bindings",
	"'z_schemas",
	"'z_tuples"] "z_language";
val _ = commit_pc "z_language";
=TEX
=SML
val _ = delete_pc "z_language_ext" handle (Fail _ ) => ();
val _ = new_pc "z_language_ext";
val _ = merge_pcs ["z_predicates",
	"'z_∈_set_lang",
	"'z_sets_ext_lang",
	"'z_bindings",
	"'z_schemas",
	"'z_tuples",
	"'z_elementwise_eq"] "z_language_ext";
val _ = commit_pc "z_language_ext";
=TEX
\subsection{Proof Contexts for Reasoning about Sets}
=SML
val _ = delete_pc "z_sets_ext" handle Fail _ => ();
val _ = new_pc "z_sets_ext";
val _ = merge_pcs ["z_language_ext","'z_normal",
	"'z_∈_set_lib", "'z_sets_ext_lib"] "z_sets_ext";
val _ = commit_pc "z_sets_ext";
=TEX

=SML
val _ = delete_pc "z_sets_alg" handle Fail _ => ();
val _ = new_pc "z_sets_alg";
val _ = merge_pcs ["z_language","'z_normal",
	"'z_∈_set_lib","'z_sets_alg"] "z_sets_alg";
val _ = commit_pc "z_sets_alg";

=TEX
\subsection{Algebraic Reasoning about Relations}
=SML
val _ = push_merge_pcs ["z_sets_ext","'z_∈_rel"];
val ⦏z_↔_clauses⦎ = save_thm("z_↔_clauses",
	prove_rule [] ⓩ∀ X: 𝕌⦁
	(X ↔ {} = {{}}) ∧
	({} ↔ X = {{}})⌝);
val ⦏z_dom_clauses⦎ = save_thm("z_dom_clauses",
	prove_rule [] ⓩ∀a:𝕌; b:𝕌 ⦁
	dom 𝕌 = 𝕌 ∧
	dom {} = {} ∧
	dom {a ↦ b} = {a} ∧
	dom {(a, b)} = {a}⌝);
val ⦏z_ran_clauses⦎ = save_thm("z_ran_clauses",
	prove_rule [] ⓩ∀ a:𝕌; b:𝕌 ⦁
	ran 𝕌 = 𝕌 ∧
	ran {} = {} ∧
	ran {a ↦ b} = {b} ∧
	ran {(a, b)} = {b}⌝);
val ⦏z_id_clauses⦎ = save_thm("z_id_clauses",
	prove_rule [] ⓩid {} = {}⌝);
val ⦏z_⨾_clauses⦎ = save_thm("z_⨾_clauses",
	prove_rule [] ⓩ∀ R: 𝕌 ⦁
	R ⨾ {} = {} ∧
	{} ⨾ R = {} ∧
	𝕌 ⨾ 𝕌 = 𝕌⌝);
val ⦏z_∘_clauses⦎ = save_thm("z_∘_clauses",
	prove_rule [] ⓩ∀ R: 𝕌 ⦁
	R ∘ {} = {} ∧
	{} ∘ R = {} ∧
	𝕌 ∘ 𝕌 = 𝕌⌝);
val ⦏z_◁_clauses⦎ = save_thm("z_◁_clauses",
	prove_rule [] ⓩ∀ R: 𝕌;S:𝕌 ⦁
	(𝕌 ◁ R = R) ∧
	({} ◁ R = {}) ∧
	(S ◁ {} = {})⌝);
val ⦏z_▷_clauses⦎ = save_thm("z_▷_clauses",
	prove_rule [] ⓩ∀ R: 𝕌;S:𝕌⦁
	(R ▷ 𝕌 = R) ∧
	({} ▷ S = {}) ∧
	(R ▷ {} = {})⌝);
val ⦏z_⩤_clauses⦎ = save_thm("z_⩤_clauses",
	prove_rule [] ⓩ∀ R: 𝕌; S:𝕌⦁
	(𝕌 ⩤ R = {}) ∧
	({} ⩤ R = R) ∧
	(S ⩤ {} = {})⌝);
val ⦏z_⩥_clauses⦎ = save_thm("z_⩥_clauses",
	prove_rule [] ⓩ∀ R: 𝕌; S:𝕌⦁
	(R ⩥ 𝕌 = {}) ∧
	({} ⩥ S = {}) ∧
	(R ⩥ {} = R)⌝);
val ⦏z_rel_inv_clauses⦎ = save_thm("z_rel_inv_clauses",
	prove_rule [] ⓩ𝕌 ↗~↕ = 𝕌 ∧
	{} ↗~↕ = {}⌝);
val ⦏z_rel_image_clauses⦎ = save_thm("z_rel_image_clauses",
	prove_rule [] ⓩ∀ R : 𝕌;S:𝕌 ⦁
	R ⦇ {} ⦈ = {} ∧
	{} ⦇ S ⦈ = {}⌝);
val ⦏z_trans_closure_clauses⦎ = save_thm("z_trans_closure_clauses",(
set_goal([],ⓩ
	𝕌 ↗+↕ = 𝕌 ∧
	{} ↗+↕ = {}⌝);
a(prove_tac[]);
a(z_∃_tac ⓩ{}⌝ THEN rewrite_tac[]);
pop_thm()
));
val ⦏z_reflex_closure_clauses⦎ = save_thm("z_reflex_closure_clauses",(
set_goal([],ⓩ
	𝕌 ↗*↕ = 𝕌 ∧
	{} ↗*↕ = id 𝕌⌝);
a(prove_tac[]);
a(z_spec_nth_asm_tac 1 ⓩ(id 𝕌) ⦂ ℙ({x1} × {x1})⌝);
a all_var_elim_asm_tac;
pop_thm()
));
val ⦏z_⊕_clauses⦎ = save_thm("z_⊕_clauses",
	prove_rule [] ⓩ∀ f : 𝕌⦁
	f ⊕ {} = f ∧
	{} ⊕ f = f ∧
	f ⊕ 𝕌 = 𝕌⌝);
=TEX
=SML
fun ⦏maybe_strip⦎ (index,cnv) = (
	if type_of index =: BOOL
	then (index,cnv)
	else fail "" 0 []
);
local
	val setty = type_of ⓩ{}⌝;
in
fun ⦏add_∈⦎ ((index,cnv)::rest) = (
	(let val tyms = type_match (type_of index) setty @ [(ⓣ'a⌝,ⓣ'a⌝)];
		val x = variant (frees index) (mk_var("x",fst(hd tyms)));
	in
		((mk_z_∈(x,index), ∈_C cnv) :: (index,cnv) :: add_∈ rest)
	end)
	handle (Fail _) =>
	((index,cnv) :: add_∈ rest)
) | add_∈ [] = [];
end;

val ⦏z_rel_alg_eqn_cxt⦎ = add_∈(thms_to_eqn_cxt [z_↔_clauses, z_dom_clauses, z_ran_clauses,
	z_id_clauses, z_⨾_clauses, z_∘_clauses,
	z_◁_clauses, z_▷_clauses, z_⩤_clauses, z_⩥_clauses,
	z_rel_inv_clauses, z_rel_image_clauses,
	z_trans_closure_clauses, z_reflex_closure_clauses]);

val ⦏z_rel_alg_eqn_cxt_for_strip⦎ = mapfilter maybe_strip z_rel_alg_eqn_cxt;
=TEX
=SML
val _ = delete_pc "'z_rel_alg" handle Fail _ => ();
val _ = new_pc "'z_rel_alg";
val _ = set_rw_eqn_cxt z_rel_alg_eqn_cxt"'z_rel_alg";
val _ = add_rw_thms
	([]) "'z_rel_alg";

val pos = z_rel_alg_eqn_cxt_for_strip;
val neg = map (mk_¬ ** RAND_C) pos;

val _ = set_st_eqn_cxt (pos @ neg) "'z_rel_alg";
val _ = set_sc_eqn_cxt (pos @ neg) "'z_rel_alg";
val _ = set_rw_canons [] "'z_rel_alg";
val _ = set_pr_tac z_basic_prove_tac "'z_rel_alg";
val _ = set_pr_conv z_basic_prove_conv "'z_rel_alg";
val _ = set_cs_∃_convs [] "'z_rel_alg";
val _ = set_∃_vs_thms [] "'z_rel_alg";
val _ = commit_pc "'z_rel_alg";
=TEX
=SML
val _ = delete_pc "z_rel_ext" handle Fail _ => ();
val _ = new_pc "z_rel_ext";
val _ = merge_pcs ["z_sets_ext","'z_∈_rel",
	"'z_rel_alg"] "z_rel_ext";
val _ = commit_pc "z_rel_ext";
=TEX

\section{EPILOGUE}
=SML
end; (* of structure ZRelations *)
open ZRelations;
=TEX
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}
=IGN

=IGN
********************************************************************************
imp043.doc: this file is part of the PPZed system

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

\def\Title{Implementation of the Z Schema Calculus}

\def\AbstractText{This document contains the implementation of the derived rules of inference, conversions and tactics for the ProofPower Z schema calculus.}

\def\Reference{DS/FMU/IED/IMP043}

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
%% LaTeX2e port: \TPPtitle{Implementation of the Z Schema Calculus}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP043}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.33 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2011/05/05 16:12:06 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.Blackburn & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document contains the implementation
%% LaTeX2e port: of the derived rules of inference, conversions and tactics for the ProofPower Z schema calculus.}
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
\item [Issue 1.1 (1992/10/02), 1.2 (1992/10/06)]
First versions.
\item[Issue 1.3 (1992/10/14) (14th October 1992)]
Changes in theory hierarchy.
\item[Issue 1.4 (1992/10/19) (19th October 1992)]
Tightened domain of $z\_schema\_ref\_conv$.
\item [Issue 1.7 (1992/11/12), 11th November 1992]
Changes as a consequence of changes in dependences.
\item [Issue 1.8 (1992/11/27), 20th+ November 1992]
Completing the Schema Calculus.
\item [Issue 1.9 (1992/11/30), 30th November 1992]
Further schema calculus additions.
\item[Issue 1.10 (1992/12/03) (2nd December 1992)]
Improved $𝕌$ simplification.
\item[Issue 1.11 (1992/12/03) (3rd December 1992)]
Lost $∈\_C$, and $Z\-\_∈\-\_ELIM\-\_C$.
\item[Issue 1.12 (1992/12/08) (8th December 1992)]
Improvements to handling of schemas as predicates, and bindings.
Removed proof context for extensional treatment of schemas.
\item[Issue 1.13 (1992/12/09) (9th December 1992)]
Bug fixing.
\item[Issue 1.14 (1992/12/11) (10th December 1992)]
Global rename from wrk038.doc issue 1.9.
\item[Issue 1.16 (1992/12/18) (17th December 1992)]
Renaming of local variables to defend against a change elsewhere.
\item[Issue 1.17 (1993/01/20) (20th January 1993)]
Gained $z\_strip\_tac$.
\item[Issue 1.18 (1993/02/10),1.19 (1993/02/11) (10th-11th February 1993)]
Changes to proof contexts, etc.
\item[Issue 1.20 (1994/11/04) (4th November 1994)]
Added new conversion for massaging ill-formed schemas-as-declarations back into Z.
\item[Issue 1.21 (1995/11/16)]
Bug fix (signature variable ordering).
\item[Issue 1.22 (1997/04/23)]
Added notes where $dest\_z\_term1$ not appropriate.
\item[Issue 1.23 (1997/04/24)]
Fixing renaming conversion.
\item[Issue 1.24 (1997/04/25)]
Adding checks for renames to own components.
\item[Issue 1.26 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.27 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.28 (2004/01/19)] The Z universal set is now called 𝕌.
\item[Issue 1.29 (2005/05/17)] Tidied up some confusing relics.
\item[Issue 1.30 (2006/01/25)] Now support decoration of fancyfix identifiers.
\item[Issue 1.31 (2006/01/25)] The name of the decoration operator is now based on the stem {\em decor} throughout, rather than {\em decor} in some places and {\em dec} in others.
\item[Issue 1.32 (2010/04/01)] Support for empty schemas.  $lz\_∈\_rename⋎s\_conv$ based on $lz\_∈\_decor⋎s\_conv$.
\item[Issue 1.33 (2011/05/05)] Allowed for extra parameter to primitive rewriting functions.
\item[Issue 1.34 (2011/08/05)] Resolves the forward reference in IMP041.
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
the ProofPower Z (see \cite{DS/FMU/IED/HLD015}) schema calculus.
This is called for in \cite{DS/FMU/IED/HLD016}.
The design is
given in \cite{DS/FMU/IED/DTD043}.
\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains an implementation for the
initial set of rules, conversions and tactics for the schema calculus of the ProofPower Z.
\subsubsection{Dependencies}
This document takes its signature from \cite{DS/FMU/IED/DTD043}.
\subsubsection{Deficiencies}
There is something wrong with
=INLINEFT
dest_z_term1 ⓩS'⌝;
=TEX
{}.
\subsubsection{Possible Enhancements}
None known.

\section{PREAMBLE}
=SML
structure ⦏ZSchemaCalculus⦎ : ZSchemaCalculus = struct
=TEX
=SML
open ZGeneratedConstants ZTypesAndTermsSupport ZPredicateCalculus;
val lthy = get_current_theory_name();
val _ = open_theory ⦏"z_language_ps"⦎;
val _ = set_merge_pcs ["z_predicates","'z_∈_set_lang", "'z_tuples_lang"];
val _ = set_flag("z_type_check_only",false);
=TEX

\section{THE CODE}
\subsection{Utilities}
=SML
fun ⦏list_eq⦎ (eq : 'a * 'a -> bool) (a :: x) (b :: y) =
	eq(a,b) andalso list_eq eq x y
| list_eq _ [] [] = true
| list_eq _ _ _ = false;
=TEX
Some universes:
=SML
val ⦏Ua⦎ = ⓩ𝕌⌝; (* type = 'a SET *)
val ⦏tva⦎ = ⓣ'a⌝;
=TEX
=SML
val sets_ext_thm = pc_rule1 "hol1" prove_rule[]
	⌜∀ r s ⦁ r = s ⇔ (∀ x ⦁ x ∈ r ⇔ x ∈ s)⌝;
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
Apply a list of $N$ conversions to the $N$ outermost operands,
working inwards from the outermost:
=FRULE 1 Conversional
LIST_RAND_C
[cnv1,cnv2,cnv3,...]
⌜f ... a3 a2 a1⌝
├
├
⊢ f ... a3 a2 a1 =
   f ... a3' a2' a1'
=TEX
where
=GFT
cnv1 a1 = ⊢ a1 = a1'
cnv2 a2 = ⊢ a2 = a2'
cnv3 a3 = ⊢ a3 = a3'
 ...
=TEX
=SML
fun ⦏LIST_RAND_C⦎ (cnvs : CONV list) : CONV =
	case cnvs of
		cnv::cnvs'	=> APP_C (LIST_RAND_C cnvs', cnv)
	|	[]		=> id_conv;
=TEX
=SML
fun ⦏LEFT_RIGHT_C⦎ (cnv1, cnv2) = LIST_RAND_C [cnv2, cnv1];
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
val rec ⦏seq_simple_β_conv⦎:CONV = fn tm => (
	(simple_β_conv
	ORELSE_C
	(RATOR_C seq_simple_β_conv THEN_C simple_β_conv)
	ORELSE_C
	refl_conv)
	tm
);
=TEX
=SML
val rec ⦏seq_simple_β_conv1⦎:CONV = (fn tm =>
	(TRY_C (RAND_C z_sel⋎s_conv)
	THEN_C
	(simple_β_conv
	ORELSE_C
	(RATOR_C seq_simple_β_conv1 THEN_C simple_β_conv)
	ORELSE_C
	refl_conv))
	tm
);
=TEX
=SML
fun ⦏list_∧_disch_rule⦎ (tms : TERM list) (t : THM) =
case rev tms of
	tm::tms	=> (
		foldl (⇒_∧_rule o uncurry disch_rule) (disch_rule tm t) tms
			handle ex => reraise ex "list_∧_disch_rule"
	)
|	[]		=> fail "list_∧_disch_rule" 7107 [];
=TEX
=SML
fun ⦏sort_∧_conv⦎ (order : TERM ORDER) : CONV = fn tm => (
case strip_∧ tm of
	tms1 as _::_::_	=>
	let
		val tms2 = sort order tms1;
		val t1 = list_∧_disch_rule tms1 (list_∧_intro (map asm_rule tms2));
		val t2 = list_∧_disch_rule tms2 (list_∧_intro (map asm_rule tms1));
	in
		⇔_intro t1 t2
	end

|	_		=> fail_conv tm
);
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
val ⦏dp_proj_thm⦎:THM = all_∀_intro(list_∧_intro
	(strip_∧_rule (all_∀_elim (get_spec ⌜$"Z'S[d,p]d"⌝))
		to 1));
local
	val cnjs = strip_∧_rule(all_∀_elim dp_proj_thm);
in
	val ⦏d_dp_proj_conv⦎ = simple_eq_match_conv1
		(all_∀_intro (hd cnjs));
	val ⦏p_dp_proj_conv⦎ = simple_eq_match_conv1
		(all_∀_intro (hd (tl cnjs)));
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

\section{THE IMPLEMENTATION}
=IGN
 ⓈZ
rel	px _,py _, pz _
 ■
 ╒[X]
px _ : ℙ X;
py _ : ℙ X;
pz _ : ℙ X
 └

 ┌S[X]─
x:X
 ├
px x
 └
 ┌DS[X]─
x:X;
x':X
 ├
px x ∧ px x'
 └
=TEX
\subsection{Duplicating Treatment of ∈ for Schema as Predicates}
=SML
local
	val cnv1 = simple_eq_match_conv1 z'schema_pred_def;
in	
fun ⦏DUP_SAP_C⦎ (cnv:CONV) : CONV =
	TRY_C (RATOR_C(RATOR_C cnv1)) THEN_C cnv;
end;
=TEX
\subsection{Local Existence Provers}
=SML
local
	val c1 = simple_eq_match_conv1 (prove_rule []⌜∀ x ⦁ (x = x) ⇔ T⌝);
	val c2 = simple_eq_match_conv1 (prove_rule []⌜∀ x ⦁ T ∧ x ⇔ x⌝);
	val c3 = simple_eq_match_conv1 (prove_rule []⌜∀ x ⦁ x ∧ T ⇔ x⌝);
	val ⇒_thm = tac_proof(([],⌜∀ x ⦁ x ⇒ x⌝),REPEAT strip_tac);
	fun local_rule thm gl = (
	let 	val (a,b) = dest_⇒ gl;
		val (x,bdy) = dest_eq(concl thm);
		val ithm = simple_∀_elim b ⇒_thm;
	in
		subst_rule[(eq_sym_rule thm,x)] gl ithm
	end);
	val rw_tac2_thm = tac_proof(([],
		⌜∀ t⦁ ¬ (F ∧ t) ∧ ¬ (t ∧ F) ∧
		((∃ x ⦁ F) ⇔ F) ∧ ¬(∀ x ⦁ F) ∧
		(∀ x⦁ x = x ⇔ T) ∧ (F ⇒ t) ∧
		(¬ T ⇔ F) ∧ (¬ F ⇔ T)⌝),
		PC_T1 "hol1" rewrite_tac[]);
	val rw_tac2 = (prim_rewrite_tac	
		(make_net(flat(map (cthm_eqn_cxt initial_rw_canon)
			[rw_tac2_thm])))
		initial_rw_canon
		Nil
		TOP_MAP_C
		[]);
in
fun ⦏local_prove_∃_conv⦎ (wit : TERM) : CONV = (fn tm =>
(let	val (x,bdy) = dest_simple_∃ tm;
	val res = var_subst [(wit,x)] bdy;
	val s1 = ALL_SIMPLE_∃_C (RIGHT_C(RIGHT_C (c1 ORELSE_C
		(LEFT_C c1 THEN_C c2)))) res;
	val new_term = snd(dest_eq(concl s1));
	val s2 = tac_proof(([],mk_eq(tm, new_term)),
		⇔_T2
		(fn thm =>
		t_tac ORELSE
		conv_tac(fn ag => eq_sym_rule s1)
		THEN
		SIMPLE_∃_THEN ante_tac thm
		THEN (
			let val x' = variant (frees(concl thm) @ frees (concl s1)) x;
			in
			CASES_T2 (mk_eq(x',wit))
			(fn thm1 => fn (seqasms,gl) =>
			accept_tac (local_rule thm1 gl)(seqasms,gl))
			(fn thm1 => rw_tac2[
				thm1])
			end)			
		)
		(fn thm =>
		simple_∃_tac wit THEN accept_tac
			(⇔_mp_rule (eq_sym_rule s1) thm)
		));
in
	s2
end)
handle (Fail _) =>
fail "local_prove_∃_conv" 0 []);
fun ⦏local_prove_∃_conv1⦎ (wit : TERM) : CONV = (fn tm =>
let	val (x,bdy) = dest_simple_∃ tm;
	val res = var_subst [(wit,x)] bdy;
	val s1 = ALL_SIMPLE_∃_C (RIGHT_C c1 THEN_C c3) res;
	val new_term = snd(dest_eq(concl s1));
	val s2 = tac_proof(([],mk_eq(tm, new_term)),
		⇔_T2
		(fn thm =>
		conv_tac(fn ag => eq_sym_rule s1)
		THEN
		SIMPLE_∃_THEN ante_tac thm
		THEN (
			let val x' = variant (frees(concl thm) @ frees (concl s1)) x;
			in
			CASES_T2 (mk_eq(x',wit))
			(fn thm1 => fn (seqasms,gl) =>
			accept_tac (local_rule thm1 gl)(seqasms,gl))
			(fn thm1 => rw_tac2[
				conv_rule(RAND_C eq_sym_conv) thm1])
			end)			
		)
		(fn thm =>
		simple_∃_tac wit THEN accept_tac
			(⇔_mp_rule (eq_sym_rule s1) thm)
		));
in
	s2
end);
end;

		
=TEX
=IGN
local_prove_∃_conv1 ⌜x:'a⌝ ⌜∃ y :'a⦁ p y ∧ x = y⌝;
=TEX
\subsection{New Names}
Return a ``pleasant'' name, so far unused in a term.
=SML
local
	val ordx = ord"x";
	fun xnames (nm,ty) = (if ord nm = ordx
		then nm
		else fail "" 0 []);
	fun lgive_n_name lst = (
	let	fun nextn n = (let val poss = "x" ^ string_of_int n
			in
			if poss mem lst
			then nextn (n+1)
			else poss
			end);
	in
		nextn 1
	end);
in
fun ⦏give_n_name⦎ (tm:TERM) : string = (
let	val names = mapfilter xnames (term_vars tm);
in
	lgive_n_name names
end)
end;
=TEX
Apply a conversion to each of the subterms bound by
a binding:
=SML
fun ⦏BINDING_C⦎ cnv1 = COND_C is_z_binding (RANDS_C cnv1) fail_conv;
=TEX

\subsection{θ Terms}
=SML
local
val cnv1 = simple_eq_match_conv1 z'θ_def;
in
val ⦏z_θ_conv⦎ : CONV = (fn tm => (
let	val s1 = cnv1 tm
in
	check_is_z_conv_result "z_θ_conv" s1
end)
handle complaint =>
divert complaint "simple_eq_match_conv1" "z_θ_conv" 43010
	[fn () => string_of_term tm]
);
val ⦏z_θ_conv1⦎ : CONV = (fn tm => (
let	val dummy = if is_bin_op "Z'θ" tm
		then (if ((is_z tm; true)handle (Fail _) => false)
		then term_fail "z_θ_conv1"  43011 [tm]
		else ())
		else term_fail "z_θ_conv1"  43011 [tm];
	val s1 = cnv1 tm;
in
	check_is_z_conv_result "z_θ_conv1" s1
end)
);
end;
=IGN
z_θ_conv ⓩθ DS⌝;
=TEX
=SML
val ⦏z_θ_eq_conv⦎ : CONV = (fn tm =>
(let	val (lhs,rhs) = dest_eq tm
		handle (Fail _) =>
		term_fail "z_θ_eq_conv" 43034 [tm];
in
	case (is_z_θ lhs, is_z_θ rhs) of
	(true,true) => (RANDS_C z_θ_conv THEN_C
		z_binding_eq_conv2) tm
	| (true,false) => (LEFT_C z_θ_conv THEN_C
		z_binding_eq_conv2) tm
	| (false,true) => (RIGHT_C z_θ_conv THEN_C
		z_binding_eq_conv2) tm
	| (false,false) => term_fail "z_θ_eq_conv" 43034 [tm]
end
handle complaint =>
divert complaint "z_binding_eq_conv2" "z_θ_eq_conv" 43034
	[fn () => string_of_term tm]));
=IGN
z_θ_eq_conv ⓩθ [a,b:𝕌] = (a ≜1, b ≜ 2)⌝;
z_θ_eq_conv ⓩ(a ≜1, b ≜ 2) = θ [a,b:𝕌]⌝;
z_θ_eq_conv ⓩ(a ≜1, b ≜ 2) = (a ≜1, b ≜ 2)⌝; (* fail *)
z_θ_eq_conv ⓩθ( [a,b:𝕌]) ' = θ ([a,b:𝕌])''⌝;
=TEX
=SML
local
val cnv1 = simple_eq_match_conv1 z'θ_def;
val cnv2 = simple_eq_match_conv1 z'schema_dec_def;
val cnv3 = simple_eq_match_conv1 (prove_rule[]⌜∀ x:'a ⦁ (x = x) ⇔ T⌝);
in
val ⦏z_θ_∈_schema_conv⦎ : CONV = (fn tm => (
let	val (θs,s) = dest_z_∈ tm;
	val (s',decor) = dest_z_θ θs;
	val dummy = if s' =$ s andalso decor = ""
		then ()
		else term_fail "z_θ_∈_schema_conv" 43002 [tm];
	val decs = mk_z_schema_dec(s',"");
	val res_tm = mk_eq(tm,decs);
in
	check_is_z_conv_result "z_θ_∈_schema_conv"
	(⇔_t_elim((APP_C(RAND_C(LEFT_C cnv1),
			RATOR_C(RATOR_C cnv2)) THEN_C
		cnv3) res_tm))
end)
handle complaint =>
list_divert complaint "z_θ_∈_schema_conv"
	[("dest_z_∈", 43002, [fn () => string_of_term tm]),
	("dest_z_θ", 43002, [fn () => string_of_term tm]),
	("simple_eq_match_conv1", 43002, [fn () => string_of_term tm])])
;
end;
=IGN
 z_θ_∈_schema_conv ⓩθS ∈ S⌝;
=TEX
The following is necessary because we may have, e.g., a variable
of a given binding type:
=SML
fun ⦏const_of_binding_type⦎ (ty : TYPE) : TERM = (
let	val (tyname,tys) = (dest_ctype ty);
	val (tcname,tysname,_) = dest_z_name tyname;
	val dummy = if length tysname <> 1 orelse tcname <> "Z'S"
		then fail "const_of_binding_type" 0 []
		else ();
	val cons_of_ty = ZTypesAndTermsSupport.bind_cterm
		(combine (hd tysname) tys);
in
	cons_of_ty
end);
=TEX
A local version of $z\_binding\_eq\_conv2$, that just processes the LHS binding,
which had better be present.
=SML
local
val z_empty_schema_type = mk_z_schema_type [];
in
val ⦏z_binding_eq_conv3⦎ : CONV = (fn tm => (
let	val (b1,b2) = dest_z_eq tm;
	val b1args = case dest_z_term b1 of
		ZBinding xs	=> map snd xs
	|	_		=> term_fail "z_binding_eq_conv3" 42021 [tm];
	val aconst = const_of_binding_type (type_of b1);
	val spec = binding_gen_semantic_const aconst
		handle (Fail _) =>
		(diag_string "binding_gen_semantic_const fail - z_binding_eq_conv3";
		get_spec aconst);
	val (bcons,bproj) = get_binding_info (type_of b1);
	val ty_insts = type_match (type_of b1) (type_of(fst(dest_∀(concl spec))));
	val bproj' = map (inst[] ty_insts) bproj;
	val bcons' = inst [] ty_insts bcons;
	val (s2, s4) = case bproj' of
		_::_	=>
		let
			val s1 = asm_rule tm;
			val s1s = map (fn x => app_fun_rule x s1) bproj';
			val s2 = list_∧_intro s1s;
			val s3s = strip_∧_rule(asm_rule(concl s2));
			val s4 = fold (fn (x,y) => mk_app_rule y x)
				(rev s3s) (refl_conv bcons');
		in
			(s2, s4)
		end
	|	[]	=>
		let
			val s2 = asm_intro tm t_thm;
			val s4 = asm_intro mk_z_true (refl_conv bcons');
		in
			(s2, s4)
		end;
	val s5 = all_∀_intro(hd(rev(strip_∧_rule(all_∀_elim spec))));
	val s6 = conv_rule (
		LEFT_RIGHT_C (fn _ => ∀_elim b1 s5, fn _ => ∀_elim b2 s5)) s4;
	val s7 = ⇔_intro (all_⇒_intro s2) (all_⇒_intro s6);
	val spec' = inst_type_rule ty_insts spec;
	val proj_thms = rev(tl(rev(strip_∧_rule(list_∀_elim (b1 :: b1args) spec'))));
	val s8 = case map (fn thm => LEFT_C (fn _ => thm)) proj_thms of
		[]	=> s7
	|	convs	=> conv_rule (RIGHT_C(LIST_OP_C convs)) s7;
in
	(eq_trans_rule (refl_conv tm) s8)
end
)
handle complaint =>
list_divert complaint "z_binding_eq_conv3"
	[("dest_z_eq", 43005, [fn () => string_of_term tm]),
	("get_spec", 43005, [fn () => string_of_term tm]),
	("const_of_binding_type", 43005, [fn () => string_of_term tm]),
	("eq_trans_rule", 43000, [fn () => string_of_term tm])])
;
end (* of local ... in ... *);
=TEX
=IGN
z_binding_eq_conv3 ⓩ(x ≜ 1, y ≜ 2, z ≜ 3) = (y ≜ 2, x ≜ 1, z ≜ 3)⌝; (* not in signature *)
=SML
local
	val c1 = simple_eq_match_conv1 z'θ_def;
	val c2 = simple_eq_match_conv1(taut_rule
		⌜∀ x ⦁ x ∧ T ⇔ x⌝);
in
val ⦏lz_∈_h_schema_conv1⦎ : CONV = (fn tm => (
let	val (x,s) = dest_z_∈ tm;
	val (d,p) = dest_z_h_schema s;
	val spec = schema_gen_semantic_const s;
	val s1 = (RAND_C(simple_eq_match_conv spec)
		THEN_C ∈_comp_conv) tm;
	val s2 = conv_rule(RAND_C(fn itm =>
		(let	val βred = snd(dest_app(fst(dest_∧ itm)));
			val βred_thm = seq_simple_β_conv βred
		in
			LEFT_C(RAND_C (fn _ => βred_thm)
			THEN_C d_dp_proj_conv) THEN_C
			RIGHT_C(RAND_C (fn _ => βred_thm)
			THEN_C p_dp_proj_conv)
		end) itm )) s1;
	val res = mk_z_∃(d, p,mk_z_eq(mk_z_θ(mk_z_h_schema(d,mk_t),""),x));
	val s3 = (z_∃_elim_conv2 THEN_C ALL_SIMPLE_∃_C
		(RIGHT_C(RIGHT_C (LEFT_C c1 THEN_C
			z_binding_eq_conv3)))) res;
	val eqtm = snd(dest_app(snd(dest_app(
			snd(strip_∃ (snd(dest_eq (concl s3))))))));
	val s4 =
		if is_z_true eqtm
		then s3
		else
		let
			val wits = map (snd o dest_eq) (strip_∧ eqtm);
		in
			conv_rule (RIGHT_C(EVERY_C (map local_prove_∃_conv wits))) s3
		end;
	val s5 = conv_rule (RIGHT_C (RIGHT_C c2)) s4;
	val s6 = eq_trans_rule s2 (eq_sym_rule s5);
in
	check_is_z_conv_result "z_∈_h_schema_conv1" s6
end
)
handle complaint =>
list_divert complaint "z_∈_h_schema_conv1"
	[("dest_z_∈", 43003, [fn () => string_of_term tm]),
	("dest_z_h_schema", 43003, [fn () => string_of_term tm]),
	("simple_eq_match_conv1", 43003, [fn () => string_of_term tm]),
	("eq_trans_rule", 43000, [fn () => string_of_term tm]),
	("local_prove_∃_conv", 43033, [fn () => string_of_term tm])])
;
end;
val ⦏z_∈_h_schema_conv1⦎ : CONV = DUP_SAP_C lz_∈_h_schema_conv1;
=IGN
z_∈_h_schema_conv1 ⓩy ∈ [z:X; S; S'| x = z]⌝;
=TEX
=SML
local
	val c1 = simple_eq_match_conv1 z'θ_def;
	val c2 = simple_eq_match_conv1(taut_rule
		⌜∀ x ⦁ x ∧ T ⇔ x⌝);
	val c3 = simple_eq_match_conv1 z'schema_pred_def;
in
val ⦏lz_∈_h_schema_conv⦎ : CONV = (fn tm => (
let	val (x,s) = dest_z_∈ tm;
	val (d,p) = dest_z_h_schema s;
	val spec = schema_gen_semantic_const s;
	val s1 = (RAND_C(simple_eq_match_conv spec)
		THEN_C ∈_comp_conv) tm;
	val s2 = conv_rule(RAND_C(fn itm =>
		(let	val βred = snd(dest_app(fst(dest_∧ itm)));
			val βred_thm = seq_simple_β_conv1 βred
		in
			LEFT_C(RAND_C (fn _ => βred_thm)
			THEN_C d_dp_proj_conv) THEN_C
			RIGHT_C(RAND_C (fn _ => βred_thm)
			THEN_C p_dp_proj_conv)
		end) itm )) s1;
	val s3 = conv_rule(RAND_C(LEFT_C(Z_DECL_C
		(z_dec_pred_conv THEN_TRY_C (RATOR_C(RATOR_C c3)))))) s2;
in
	check_is_z_conv_result "z_∈_h_schema_conv" s3
end
)
handle complaint =>
list_divert complaint "z_∈_h_schema_conv"
	[("dest_z_∈", 43003, [fn () => string_of_term tm]),
	("dest_z_h_schema", 43003, [fn () => string_of_term tm]),
	("simple_eq_match_conv1", 43003, [fn () => string_of_term tm])])
;
end;
val ⦏z_∈_h_schema_conv⦎ : CONV = DUP_SAP_C lz_∈_h_schema_conv;

=IGN
z_∈_h_schema_conv ⓩy ∈ [z:X; S; S'| x = z]⌝;

=TEX
=SML
local
	val thm1 = conv_rule z_∀_elim_conv1 z_sets_ext_thm;
in
val ⦏lz_sets_ext_conv⦎ :CONV = simple_eq_match_conv1  thm1;
end;
=TEX
Local variant of $z\_sel⋎s\_conv$, that is given the body of the selection
before hand.
If  $z\_sel⋎s\_conv$ is going to be used alot, with the same term
selected from, this will be much faster.
=SML
fun  ⦏z_sel⋎s_1_conv⦎ (body: TERM) : CONV = (
let
	val bits = dest_z_binding body;
	val spec = binding_gen_semantic_const body
		handle (Fail _) =>
		(diag_string "binding_gen_semantic_const fail - z_sel⋎s_1_conv";
		get_spec body);
	val cmps = tl(fst(strip_simple_∀(concl spec)));
	val thm1 = all_simple_∀_elim spec;
	val conjuncts = strip_∧_rule thm1;
	val tagged_conjuncts = mapfilter (fn thm =>
		(snd(dest_z_sel⋎s(fst(dest_eq(concl thm)))), thm))
		conjuncts;
	val cmpvals = map snd bits;
	val cmpvaltys = map type_of cmpvals
	val tym = combine cmpvaltys (map type_of cmps);
	val instcmps = map mk_var (combine (map (fst o dest_var) cmps) cmpvaltys);
	val tmm = combine cmpvals instcmps;
in
(fn tm => (
let	val (_,s) = dest_z_sel⋎s tm;
	fun get_conjunct ((tag,cnj) :: rest) = (
		if tag = s
		then cnj
		else get_conjunct rest
	) | get_conjunct _ = term_fail "z_sel⋎s_1_conv" 43000 [];
	val thm2 = get_conjunct tagged_conjuncts
		handle Fail _ => term_fail "z_sel⋎s_1_conv" 43000 [];
in
	check_is_z_conv_result "z_sel⋎s_1_conv"
	(eq_trans_rule (refl_conv tm)
	(inst_term_rule tmm (inst_type_rule tym thm2)))
end
)
handle complaint =>
list_divert complaint "z_sel⋎s_1_conv"
	[("dest_z_sel⋎s", 42014, [fn () => string_of_term tm]),
	("dest_z_binding", 42014, [fn () => string_of_term tm]),
	("get_spec", 42014, [fn () => string_of_term tm]),
	("eq_trans_rule", 43000, [fn () => string_of_term tm])]
)
end);
=TEX
=SML
local
	val c2 = simple_eq_match_conv1 (pc_rule1 "hol1" prove_rule []
		⌜∀ x ⦁ (x = x) ⇔ T⌝);
	val c3 = simple_eq_match_conv1
		(prove_rule[] ⓩ(∀ z:𝕌 ⦁ true) ⇔ true⌝);
in
val ⦏z_h_schema_conv⦎ : CONV = (fn tm => (
let	val (d,p) = dest_z_h_schema tm;
	val res = mk_z_seta(d, p,mk_z_θ(mk_z_h_schema(d,mk_t),""));
	val s1 = lz_sets_ext_conv (mk_eq (tm, res));
	val s2 = conv_rule(RAND_C(RAND_C(BINDER_C(RAND_C(
		LEFT_C z_∈_h_schema_conv1 THEN_C
		RIGHT_C z_∈_seta_conv
		THEN_C c2)))
		THEN_C c3)) s1;
	val s3 = ⇔_t_elim s2;
in
	check_is_z_conv_result "z_h_schema_conv"
	(eq_trans_rule (refl_conv tm) s3)
end
)
handle complaint =>
list_divert complaint "z_h_schema_conv"
	[("dest_z_h_schema", 43004, [fn () => string_of_term tm]),
	("simple_eq_match_conv1", 43004, [fn () => string_of_term tm]),
	("eq_trans_rule", 43000, [fn () => string_of_term tm])])
;
end;
=IGN
z_h_schema_conv ⓩ[z:X; S; S'| x = z]⌝;
=TEX
=SML
local
	fun mk_u_dec v = mk_z_dec([v],
		inst [] [(type_of v, tva)] Ua);
	val c1 = pure_rewrite_conv[taut_rule
		⌜∀ x ⦁ ((x ∧ T) ⇔ x) ∧ ((T ∧ x) ⇔ x)⌝];
	val c2 = pure_rewrite_conv[taut_rule
		⌜∀ x ⦁ ((T ∧ x) ⇔ x)⌝];
in
val ⦏z_norm_h_schema_conv⦎ : CONV = (fn tm => (
let	val (d,p) = dest_z_h_schema tm;
	val spec = schema_gen_semantic_const tm
		handle (Fail _) =>
		(diag_string "z_norm_h_schema_conv - semantic constant generator failed";
		get_spec tm);
	val s1 = simple_eq_match_conv spec tm;
	val dvars = fst(strip_λ(fst(strip_app(snd(dest_app
		(fst(dest_∧(snd(dest_set_comp (snd(dest_eq (concl s1))))))))))));
	val res_decl = mk_z_decl (map mk_u_dec dvars);
	val s2 = conv_rule(RAND_C(BINDER_C(fn itm =>
		(let	val βred = snd(dest_app(fst(dest_∧ itm)));
			val βred_thm = seq_simple_β_conv βred
		in
			LEFT_C(RAND_C (fn _ => βred_thm)
			THEN_C d_dp_proj_conv THEN_C
			Z_DECL_C (z_dec_pred_conv
				THEN_TRY_C z_∈_u_conv) THEN_TRY_C
			c1
			) THEN_C
			RIGHT_C(RAND_C (fn _ => βred_thm)
			THEN_C p_dp_proj_conv)
		end) itm ))) s1;
	val x_set_abs = fst(dest_set_comp (snd(dest_eq (concl s1))));
	val x_sels = map (fn y => mk_z_sel⋎s(x_set_abs,fst(dest_var y)))
		dvars;
	val res_pred = subst(combine dvars x_sels) (snd(dest_set_comp
		(snd(dest_eq (concl s2)))));
	val res = mk_z_h_schema(res_decl, res_pred);
	val s3 = simple_eq_match_conv spec res;
	val s4 = conv_rule(RAND_C(BINDER_C(fn itm =>
		(let	val βred = snd(dest_app(fst(dest_∧ itm)));
			val βred_thm = seq_simple_β_conv βred
		in
			LEFT_C(RAND_C (fn _ => βred_thm)
			THEN_C d_dp_proj_conv THEN_C
			Z_DECL_C (z_dec_pred_conv
				THEN_C z_∈_u_conv) THEN_TRY_C
			c1
			) THEN_C c2
			THEN_C (RAND_C (fn _ => βred_thm)
			THEN_C p_dp_proj_conv)
		end) itm ))) s3;
	val s5 = eq_trans_rule s2 (eq_sym_rule s4);
in
	check_is_z_conv_result "z_norm_h_schema_conv"
	(eq_trans_rule (refl_conv tm) s5)

end)
handle complaint =>
list_divert complaint "z_norm_h_schema_conv"
	[("dest_z_h_schema", 43004, [fn () => string_of_term tm]),
	("simple_eq_match_conv1", 43004, [fn () => string_of_term tm]),
	("eq_trans_rule", 43000, [fn () => string_of_term tm])])
;
end;
=IGN
z_norm_h_schema_conv ⓩ[x,y1:X; z: Y; p,q : 𝕌; r : 𝕌; S; S' | x1 = x]⌝;
=TEX
Due to the similar form of the semantic constants for renaming and decoration, the following code is also used for $lz\_∈\_rename⋎s\_conv$ below.
=SML
val ⦏lz_∈_decor⋎s_conv⦎ : CONV = (fn tm => (
let	val (x,sd) = dest_z_∈ tm;
	val (s,dec) = dest_z_decor⋎s sd;
	val spec = decor⋎s_gen_semantic_const sd
		handle (Fail _) =>
		(diag_string "decor⋎s_gen_semantic_const fail - z_∈_decor⋎s_conv";
		get_spec sd);
	val s1 = conv_rule(BINDER_C(RIGHT_C(BINDER_C(BINDER_C
		(RIGHT_C (z_binding_eq_conv1)))))) spec;
	val (bind, body) =
		dest_∃ (snd(dest_set_comp(snd(dest_eq (snd(dest_∀(concl s1)))))));
	val eqtm = snd(dest_app body);
	val wits =
		if is_z_true eqtm
		then []
		else map dest_eq (strip_∧ eqtm);
	val labs = map (snd o dest_z_sel⋎s o snd) wits;
	val vs = map fst wits;
	val wit = mk_z_binding(combine labs vs);
	val s2 = eq_sym_rule(z_binding_eq_conv3 (mk_eq(wit,bind)));
	val s3 = conv_rule(BINDER_C(RIGHT_C(BINDER_C(BINDER_C(RIGHT_C
		(fn _ => s2)))))) s1;
	val s4 = conv_rule (BINDER_C(RIGHT_C(BINDER_C(local_prove_∃_conv1 wit))))
			s3;
	val s5 = (RIGHT_C (simple_eq_match_conv1 s4)
		THEN_C ∈_comp_conv) tm;
	val s6 = conv_rule(RIGHT_C(LEFT_C(BINDING_C(TRY_C z_sel⋎s_conv)))) s5;
in
	check_is_z_conv_result "z_∈_decor⋎s_conv" s6
end)
handle complaint =>
list_divert complaint "z_∈_decor⋎s_conv"
	[("dest_z_decor⋎s", 43015, [fn () => string_of_term tm]),
	("dest_z_∈", 43015, [fn () => string_of_term tm]),
	("simple_eq_match_conv1", 43015, [fn () => string_of_term tm]),
	("eq_trans_rule", 43000, [fn () => string_of_term tm])])
;
val ⦏z_∈_decor⋎s_conv⦎ : CONV = DUP_SAP_C lz_∈_decor⋎s_conv;
=IGN
z_∈_decor⋎s_conv ⓩp ∈ ⓜ(mk_z_decor⋎s(ⓩ[z:X; S; S'| x = z]⌝,"'"))⌝⌝;
=TEX
=SML
val ⦏z_decor⋎s_conv⦎ = Z_∈_ELIM_C z_∈_decor⋎s_conv;
=TEX
=SML
local
	val c1 = RATOR_C(RATOR_C(simple_eq_match_conv1 z'schema_pred_def));
	val c2 = simple_eq_match_conv1 z'θ_def;
in
val ⦏z_θ_∈_schema_intro_conv⦎ : CONV = (fn tm => (
let	val (sd,dec) = dest_z_schema_pred tm;
	val s1 = c1 tm;
	val θ_tm = mk_z_θ(sd,dec);
	val s2 = c2 θ_tm;
	val s3 = conv_rule (RIGHT_C(LEFT_C (fn _ => eq_sym_rule s2))) s1;
in
	check_is_z_conv_result "z_θ_∈_schema_intro_conv"
	(eq_trans_rule (refl_conv tm) s3)
end)
handle complaint =>
list_divert complaint "z_θ_∈_schema_intro_conv"
	[("dest_z_schema_pred",43014,[fn () => string_of_term tm]),
	("eq_trans_rule",43000,[fn () => string_of_term tm])]
);
end;

val ⦏z_schema_pred_conv⦎ : CONV = z_θ_∈_schema_intro_conv;
=IGN
z_θ_∈_schema_intro_conv (mk_z_schema_pred( ⓩS⌝,""));
z_θ_∈_schema_intro_conv (mk_z_schema_pred( ⓩS⌝,"'"));
z_θ_∈_schema_intro_conv (mk_z_schema_pred( mk_z_decor⋎s(ⓩS⌝,"'"),""));
\subsubsection{Reintroucing Schema as Predicate Carefully}

=SML
local

open ZTypesAndTermsSupport;

local
	val aux = Sort.sort z_sig_order;
in
fun ⦏dest_sorted_strings⦎ (ss : string list) : string list = (
	if aux ss = ss
	then ss
	else fail "dest_sorted_strings" 0 []
);
end;
fun ⦏dest_bind_tname⦎ (nm : string) : string list = (
	case dest_z_name nm of
	("Z'S",[fid],Nil) => dest_sorted_strings fid
	| _ => fail "dest_bind_tname" 0 []
);
=TEX
=SML
fun ⦏dest_bind_type⦎ (ty : TYPE) : (string * TYPE) list = (
let	val (nm,tys) = dest_ctype ty;
	val fst_itym = dest_bind_tname nm;
in
	combine fst_itym tys
end);
=TEX
=SML
fun ⦏dest_bind_ctype⦎ (ty : TYPE) : (string * TYPE) list = (
let	val tys = rev(strip_→_type ty);
	val core_type = hd tys;
	val atypes = rev(tl tys);
	val itym = dest_bind_type core_type;
in
	if list_eq (op =:) atypes (map snd itym)
	then itym
	else fail "dest_bind_ctype" 0 []
end);
=TEX
=SML
fun ⦏dest_bind_cname⦎ (s : string) : string list = (
case dest_z_name s of
("Z'Mk_S",[fid],Nil) => dest_sorted_strings fid
| _ => fail "dest_bind_cname" 0 []
);
=TEX
=SML
fun ⦏dest_bind_cterm⦎ (tm : TERM) : (string * TYPE) list = (
let	val (cnm,cty) = dest_const tm;
	val nm_fst_itym = dest_bind_cname cnm;
	val ty_itym = dest_bind_ctype cty;
in
	if nm_fst_itym = map fst ty_itym
	then ty_itym
	else fail "dest_bind_cterm" 0 []
end);

val cnv1 = simple_eq_match_conv1 z'schema_pred_def;
in
val ⦏z_schema_pred_intro_conv⦎ : CONV = (fn tm =>(
let	val (bind,s) = dest_z_∈ tm;
	val (bcons,argl) = strip_app bind;
	val args_itym = map dest_var argl;
	val b_itym = dest_bind_cterm bcons;
	val d_args = case args_itym of
		(a :: x) => snd(unpack_ident (fst a))
		| _ => "";
	val d_ty = case b_itym of
		(a :: x) => snd(unpack_ident (fst a))
		| _ => "";
	val d = implode ((explode d_args) from (size d_ty));
	val dummy = if d_args = d_ty ^ d
		then ()
		else fail "z_schema_pred_intro_conv" 0 [];
	val dummy = (if list_eq (fn ((a,aty),(b,bty)) =>
		let	val (anm,ad) = unpack_ident a;
			val (bnm,bd) = unpack_ident b;
		in
		anm=bnm andalso ad = bd ^ d andalso (aty =: bty)
		end)
		args_itym b_itym
		then ()
		else fail "full_dest_binding" 0 []);
	val res = mk_z_schema_pred (s,d);
	val res_thm = eq_trans_rule (refl_conv tm) (eq_sym_rule
		(RATOR_C(RATOR_C cnv1) res));
	val check = case dest_z_term1 res of
		ZSchemaPred(s1,d1) => if (s1 =$ s) andalso (d = d1)
			then ()
			else term_fail "schema_pred_intro_conv" 43032 [tm]
		| _ => term_fail "schema_pred_intro_conv" 43032 [tm];
in
	res_thm
end)
handle (Fail _) =>
term_fail "z_schema_pred_intro_conv" 43032 [tm]
);
end;
=TEX
=SML
val ⦏z_strip_tac⦎ : TACTIC = (fn gl =>
	(CHECK_IS_Z_T "z_strip_tac"
	((z_∀_tac ORELSE_T strip_tac) THEN_TRY_T conv_tac z_schema_pred_intro_conv))
	gl
	handle complaint =>
	pass_on complaint "strip_tac" "z_strip_tac"
);
=TEX

\subsubsection{Back to the Rest}
=SML
local
	val c1 = RATOR_C(RATOR_C(simple_eq_match_conv1 z'schema_pred_def));
in
val ⦏z_h_schema_pred_conv⦎ : CONV = (fn tm => (
let	val (s,dec) = dest_z_schema_pred tm;
	val s1 = c1 tm;
	val res_thm =
	(if is_z_decor⋎s s
	then (
let	val s2 =  conv_rule (RIGHT_C (z_∈_decor⋎s_conv THEN_C
		LEFT_C(TRY_C(ONCE_MAP_C z_sel⋎s_conv)))) s1;
	val s3 = conv_rule(RIGHT_C z_∈_h_schema_conv) s2;
in
	s3
end)
else (
let	val s2 = conv_rule(RIGHT_C z_∈_h_schema_conv) s1;
in
	s2
end));
	val res_thm' = conv_rule(RIGHT_C(TRY_C(LEFT_C(∧_C(
		LEFT_C (ONCE_MAP_C z_sel⋎s_conv)))))) res_thm;

in
	check_is_z_conv_result "z_h_schema_pred_conv"
	(eq_trans_rule (refl_conv tm) res_thm')
end
)
handle complaint =>
list_divert complaint "z_h_schema_pred_conv"
	[("dest_z_schema_pred", 43012, [fn () => string_of_term tm]),
	("simple_eq_match_conv1", 43012, [fn () => string_of_term tm]),
	("z_∈_h_schema_conv", 43012, [fn () => string_of_term tm]),
	("eq_trans_rule", 43000, [fn () => string_of_term tm])])
;
end;
=IGN
z_h_schema_pred_conv (mk_z_schema_pred( ⓩ[z:X; S; S'| x = z]⌝,""));
z_h_schema_pred_conv (mk_z_schema_pred( ⓩ[zz,z:X; S; S'| x = z]⌝,"'"));
z_h_schema_pred_conv (mk_z_schema_pred( mk_z_decor⋎s(ⓩ[z:X; S; S'| x = z]⌝,"'"),""));
=TEX
=SML
val ⦏z_pre⋎s_conv⦎ : CONV = (fn tm => (
let	val s = dest_z_pre⋎s tm;
	val spec = pre⋎s_gen_semantic_const tm;
	val s1 = simple_eq_match_conv1 spec tm;
in
	check_is_z_conv_result "z_pre⋎s_conv" s1
end)
handle complaint =>
list_divert complaint "z_pre⋎s_conv"
	[("Z Term-Generator", 43009, [fn () => string_of_term tm]),
	("pre⋎s_gen_semantic_const", 43009, [fn () => string_of_term tm]),
	("dest_z_pre⋎s", 43007, [fn () => string_of_term tm])]);

=IGN
z_pre⋎s_conv ⓩpre DS⌝;
z_pre⋎s_conv (mk_z_pre⋎s ⓩS⌝) (* fails with 43009 *);
z_pre⋎s_conv ⓩpre (DS[Y])⌝;
z_pre⋎s_conv ⓩpre [a',b',c:ℤ]⌝;
=TEX
=SML
val ⦏z_∈_pre⋎s_conv⦎ = DUP_SAP_C(∈_C z_pre⋎s_conv);
=TEX
=SML
val ⦏z_Δ⋎s_conv⦎ : CONV = (fn tm => (
let	val s = dest_z_Δ⋎s tm;
	val spec = Δ⋎s_gen_semantic_const tm;
	val s1 = simple_eq_match_conv1 spec tm;
in
	check_is_z_conv_result "z_Δ⋎s_conv" s1
end)
handle complaint =>
list_divert complaint "z_Δ⋎s_conv"
	[("Δ⋎s_gen_semantic_const", 43022, [fn () => string_of_term tm]),
	("dest_z_Δ⋎s", 43022, [fn () => string_of_term tm])]);

val ⦏z_∈_Δ⋎s_conv⦎ = DUP_SAP_C(∈_C z_Δ⋎s_conv);
=TEX
=IGN
z_Δ⋎s_conv ⓩΔ [a',b,c:X]⌝;
z_∈_Δ⋎s_conv ⓩp ∈ (Δ [a',b,c:X])⌝;
=TEX
=SML
val ⦏z_Ξ⋎s_conv⦎ : CONV = (fn tm => (
let	val s = dest_z_Ξ⋎s tm;
	val spec = Ξ⋎s_gen_semantic_const tm;
	val s1 = simple_eq_match_conv1 spec tm;
in
	check_is_z_conv_result "z_Ξ⋎s_conv" s1
end)
handle complaint =>
list_divert complaint "z_Ξ⋎s_conv"
	[("Ξ⋎s_gen_semantic_const", 43023, [fn () => string_of_term tm]),
	("dest_z_Ξ⋎s", 43023, [fn () => string_of_term tm])]);

val ⦏z_∈_Ξ⋎s_conv⦎ = DUP_SAP_C(∈_C z_Ξ⋎s_conv);
=TEX
=IGN
z_Ξ⋎s_conv ⓩΞ [a',b,c:X]⌝;
z_∈_Ξ⋎s_conv ⓩp ∈ (Ξ [a',b,c:X])⌝;
=TEX
\section{PREDICATE CALCULUS WITH SCHEMAS}
=SML
fun ⦏DYOP_SOP_BINDING_C⦎ cnv1 = APP_C(
	RAND_C(LEFT_C(BINDING_C cnv1)),
	LEFT_C(BINDING_C cnv1));
val ⦏dyop_sop_binding_sel_conv⦎ = DYOP_SOP_BINDING_C (TRY_C z_sel⋎s_conv);
=SML
val ⦏lz_∈_∧⋎s_conv⦎ : CONV = (fn tm =>(
let	val (v,sc) = dest_z_∈ tm;
	val (r,s) = dest_z_∧⋎s sc
		handle complaint =>
		divert complaint "dest_z_∧⋎s" "z_∈_∧⋎s_conv" 43001
			[fn () => string_of_term tm];
	val spec = dyop⋎s_gen_semantic_const sc
		handle (Fail _) =>
		(diag_string "dyop⋎s_gen_semantic_const fail - z_∈_∧⋎s_conv";
		get_spec sc);
	val s1 = (RIGHT_C (simple_eq_match_conv spec)
		THEN_C ∈_comp_conv) tm;
	val s2 = conv_rule (RIGHT_C dyop_sop_binding_sel_conv) s1;
in
	check_is_z_conv_result "z_∈_∧⋎s_conv" s2
end)
handle complaint =>
list_divert complaint "z_∈_∧⋎s_conv" [
	("dest_z_∈",43001,[fn () => string_of_term tm]),
	("dest_z_∧⋎s",43001,[fn () => string_of_term tm])]
);
val ⦏z_∈_∧⋎s_conv⦎ : CONV = DUP_SAP_C lz_∈_∧⋎s_conv;
val ⦏z_∧⋎s_conv⦎ = Z_∈_ELIM_C z_∈_∧⋎s_conv;	
=IGN
z_∈_∧⋎s_convⓩp ∈ (([x:𝕌; y:𝕌| f x y] ∧ [y:𝕌;z:𝕌 | g y z]) ⦂ 𝕌)⌝;
z_∧⋎s_convⓩ(([x:𝕌; y:𝕌| f x y] ∧ [y:𝕌;z:𝕌 | g y z]) ⦂ 𝕌)⌝;
=TEX
=SML
val ⦏lz_∈_∨⋎s_conv⦎ : CONV = (fn tm =>(
let	val (v,sc) = dest_z_∈ tm;
	val (r,s) = dest_z_∨⋎s sc;
	val spec = dyop⋎s_gen_semantic_const sc
		handle (Fail _) =>
		(diag_string "dyop⋎s_gen_semantic_const fail - z_∈_∨⋎s_conv";
		get_spec sc);
	val s1 = (RIGHT_C (simple_eq_match_conv spec)
		THEN_C ∈_comp_conv) tm;
	val s2 = conv_rule (RIGHT_C dyop_sop_binding_sel_conv) s1;
in
	check_is_z_conv_result "z_∈_∨⋎s_conv" s2
end)
handle complaint =>
list_divert complaint "z_∈_∨⋎s_conv" [
	("dest_z_∈",43005,[fn () => string_of_term tm]),
	("dest_z_∨⋎s",43005,[fn () => string_of_term tm])]);
val ⦏z_∈_∨⋎s_conv⦎ : CONV = DUP_SAP_C lz_∈_∨⋎s_conv;
val ⦏z_∨⋎s_conv⦎ = Z_∈_ELIM_C z_∈_∨⋎s_conv;	
=IGN
z_∈_∨⋎s_convⓩp ∈ (([x:𝕌; y:𝕌| f x y] ∨ [y:𝕌;z:𝕌 | g y z]) ⦂ 𝕌)⌝;
z_∨⋎s_convⓩ(([x:𝕌; y:𝕌| f x y] ∨ [y:𝕌;z:𝕌 | g y z]) ⦂ 𝕌)⌝;
=TEX
=SML
val ⦏lz_∈_⇒⋎s_conv⦎ : CONV = (fn tm =>(
let	val (v,sc) = dest_z_∈ tm;
	val (r,s) = dest_z_⇒⋎s sc;
	val spec = dyop⋎s_gen_semantic_const sc
		handle (Fail _) =>
		(diag_string "dyop⋎s_gen_semantic_const fail - z_∈_⇒⋎s_conv";
		get_spec sc);
	val s1 = (RIGHT_C (simple_eq_match_conv spec)
		THEN_C ∈_comp_conv) tm;
	val s2 = conv_rule (RIGHT_C dyop_sop_binding_sel_conv) s1;
in
	check_is_z_conv_result "z_∈_⇒⋎s_conv" s2
end)
handle complaint =>
list_divert complaint "z_∈_⇒⋎s_conv" [
	("dest_z_∈",43006,[fn () => string_of_term tm]),
	("dest_z_⇒⋎s",43006,[fn () => string_of_term tm])]);
val ⦏z_∈_⇒⋎s_conv⦎ : CONV = DUP_SAP_C lz_∈_⇒⋎s_conv;
val ⦏z_⇒⋎s_conv⦎ = Z_∈_ELIM_C z_∈_⇒⋎s_conv;	
=IGN
z_∈_⇒⋎s_convⓩp ∈ (([x:𝕌; y:𝕌| f x y] ⇒ [y:𝕌;z:𝕌 | g y z]) ⦂ 𝕌)⌝;
z_⇒⋎s_convⓩ(([x:𝕌; y:𝕌| f x y] ⇒ [y:𝕌;z:𝕌 | g y z]) ⦂ 𝕌)⌝;
=TEX
=SML
val ⦏lz_∈_⇔⋎s_conv⦎ : CONV = (fn tm =>(
let	val (v,sc) = dest_z_∈ tm;
	val (r,s) = dest_z_⇔⋎s sc;
	val spec = dyop⋎s_gen_semantic_const sc
		handle (Fail _) =>
		(diag_string "dyop⋎s_gen_semantic_const fail - z_∈_⇔⋎s_conv";
		get_spec sc);
	val s1 = (RIGHT_C (simple_eq_match_conv spec)
		THEN_C ∈_comp_conv) tm;
	val s2 = conv_rule (RIGHT_C dyop_sop_binding_sel_conv) s1;
in
	check_is_z_conv_result "z_∈_⇔⋎s_conv" s2
end)
handle complaint =>
list_divert complaint "z_∈_⇔⋎s_conv" [
	("dest_z_∈",43016,[fn () => string_of_term tm]),
	("dest_z_⇔⋎s",43016,[fn () => string_of_term tm])]);
val ⦏z_∈_⇔⋎s_conv⦎ : CONV = DUP_SAP_C lz_∈_⇔⋎s_conv;
val ⦏z_⇔⋎s_conv⦎ = Z_∈_ELIM_C z_∈_⇔⋎s_conv;	
=IGN
z_∈_⇔⋎s_convⓩp ∈ (([x:𝕌; y:𝕌| f x y] ⇔ [y:𝕌;z:𝕌 | g y z]) ⦂ 𝕌)⌝;
z_⇔⋎s_convⓩ(([x:𝕌; y:𝕌| f x y] ⇔ [y:𝕌;z:𝕌 | g y z]) ⦂ 𝕌)⌝;
=TEX
=SML
local
	val cnv1 = simple_eq_match_conv1 z'¬⋎s_def;
in
val ⦏lz_∈_¬⋎s_conv⦎ : CONV = (fn tm =>(
let	val (v,sc) = dest_z_∈ tm;
	val r = dest_z_¬⋎s sc;
	val s1 = cnv1 tm;
in
	check_is_z_conv_result "z_∈_¬⋎s_conv" s1
end)
handle complaint =>
list_divert complaint "z_∈_¬⋎s_conv" [
	("dest_z_∈",43017,[fn () => string_of_term tm]),
	("dest_z_¬⋎s",43017,[fn () => string_of_term tm])]);
end;
val ⦏z_∈_¬⋎s_conv⦎ : CONV = DUP_SAP_C lz_∈_¬⋎s_conv;
val ⦏z_¬⋎s_conv⦎ = Z_∈_ELIM_C z_∈_¬⋎s_conv;	
=IGN
z_∈_¬⋎s_convⓩp ∈ ((¬[x:𝕌; y:𝕌| f x y]) ⦂ 𝕌)⌝;
z_¬⋎s_convⓩ(¬[x:𝕌; y:𝕌| f x y]) ⦂ 𝕌⌝;
=TEX
\section{SCHEMA QUANTIFICATION}
=SML
local
	fun OPT_SIMPLE_BINDER_C cnv = (SIMPLE_BINDER_C cnv) ORELSE_C cnv;
	val cnv1 =
		fn tm1 =>
		let	val βred = snd(dest_app(fst(dest_∧ tm1)));
			val βred_thm = seq_simple_β_conv βred;
		in
		APP_C (
		RAND_C(RAND_C (fn _ => βred_thm) THEN_C
			d_dp_proj_conv THEN_C z_decl_pred_conv),
		RAND_C (fn _ => βred_thm) THEN_C p_dp_proj_conv) tm1
		end;
in
val ⦏quant_sop_conv⦎ = OPT_SIMPLE_BINDER_C (
	LEFT_RIGHT_C (cnv1, LEFT_C (BINDING_C (TRY_C z_sel⋎s_conv)))
);
end (* of local ... in ... *);
=TEX
=SML
val ⦏lz_∈_∃⋎s_conv⦎ : CONV = (fn tm =>(
let	val (x,st) = dest_z_∈ tm;
	val (d,p,v) = dest_z_∃⋎s st;
	val xnm = give_n_name tm;
	val spec = quant⋎s_gen_semantic_const st;
	val spec' = conv_rule(TRY_C(ALL_SIMPLE_∀_C(RAND_C(BINDER_C
		(RAND_C(simple_α_conv xnm)))))) spec;
	val s1 = (
		RAND_C (simple_eq_match_conv1 spec')
		THEN_C ∈_comp_conv
		THEN_C quant_sop_conv
		THEN_TRY_C z_∃_intro_conv
	) tm;
in
	check_is_z_conv_result "z_∈_∃⋎s_conv"
		(eq_trans_rule (refl_conv tm) s1)
end)
handle complaint =>
list_divert complaint "z_∈_∃⋎s_conv"
	[("dest_z_∈", 43020, [fn () => string_of_term tm]),
	("dest_z_∃⋎s", 43020, [fn () => string_of_term tm])]);

val ⦏z_∈_∃⋎s_conv⦎ : CONV = DUP_SAP_C lz_∈_∃⋎s_conv;
val ⦏z_∃⋎s_conv⦎ = Z_∈_ELIM_C z_∈_∃⋎s_conv;
=IGN
z_∈_∃⋎s_conv ⓩv ∈ ((∃ x,y:X;z:𝕌 | p x z ⦁ ([w:W;x,y:X;z:𝕌 | q w x y z] ⦂ 𝕌))⦂ 𝕌)⌝;
z_∈_∃⋎s_conv ⓩ(x ≜ x1, y ≜ y1) ∈ (∃ z:𝕌 | g x y ⦁ [x,y:X;z:Y | f x y z])⌝;
z_∃⋎s_conv ⓩ((∃ x,y:X;z:𝕌 | p x z ⦁ ([w:W;x,y:X;z:𝕌 | q w x y z] ⦂ 𝕌))⦂ 𝕌)⌝;

=TEX
=SML
val ⦏lz_∈_∀⋎s_conv⦎ : CONV = (fn tm =>(
let	val (x,st) = dest_z_∈ tm;
	val (d,p,v) = dest_z_∀⋎s st;
	val xnm = give_n_name tm;
	val spec = quant⋎s_gen_semantic_const st;
	val spec' = conv_rule(TRY_C(ALL_SIMPLE_∀_C(RAND_C(BINDER_C
		(RAND_C(simple_α_conv xnm)))))) spec;
	val s1 = (
		RAND_C (simple_eq_match_conv1 spec')
		THEN_C ∈_comp_conv
		THEN_C quant_sop_conv
		THEN_TRY_C z_∀_intro_conv
	) tm;
in
	check_is_z_conv_result "z_∈_∀⋎s_conv"
		(eq_trans_rule (refl_conv tm) s1)
end)
handle complaint =>
list_divert complaint "z_∈_∀⋎s_conv"
	[("dest_z_∈", 43030, [fn () => string_of_term tm]),
	("dest_z_∀⋎s", 43030, [fn () => string_of_term tm])]);

val ⦏z_∈_∀⋎s_conv⦎ : CONV = DUP_SAP_C lz_∈_∀⋎s_conv;
val ⦏z_∀⋎s_conv⦎ :CONV = Z_∈_ELIM_C z_∈_∀⋎s_conv;

=IGN
z_∈_∀⋎s_conv ⓩw ∈ ((∀ x,y:X;z:𝕌 | p x z ⦁ ([w:W;x,y:X;z:𝕌 | q w x y z] ⦂ 𝕌))⦂ 𝕌)⌝;
z_∀⋎s_conv ⓩ((∀ x,y:X;z:𝕌 | p x z ⦁ ([w:W;x,y:X;z:𝕌 | q w x y z] ⦂ 𝕌))⦂ 𝕌)⌝;

=TEX
=SML
val ⦏lz_∈_∃⋎1⋎s_conv⦎ : CONV = (fn tm =>(
let	val (x,st) = dest_z_∈ tm;
	val (d,p,v) = dest_z_∃⋎1⋎s st;
	val xnm = give_n_name tm;
	val spec = quant⋎s_gen_semantic_const st;
	val spec' = conv_rule(TRY_C(ALL_SIMPLE_∀_C(RAND_C(BINDER_C
		(RAND_C(simple_α_conv xnm)))))) spec;
	val s1 = (
		RAND_C (simple_eq_match_conv1 spec')
		THEN_C ∈_comp_conv
		THEN_C quant_sop_conv
		THEN_TRY_C z_∃⋎1_intro_conv
	) tm;
in
	check_is_z_conv_result "z_∈_∃⋎1⋎s_conv"
		(eq_trans_rule (refl_conv tm) s1)
end)
handle complaint =>
list_divert complaint "z_∈_∃⋎1⋎s_conv"
	[("dest_z_∈", 43021, [fn () => string_of_term tm]),
	("dest_z_∃⋎1⋎s", 43021, [fn () => string_of_term tm])]);

val ⦏z_∈_∃⋎1⋎s_conv⦎ : CONV = DUP_SAP_C lz_∈_∃⋎1⋎s_conv;
val ⦏z_∃⋎1⋎s_conv⦎ = Z_∈_ELIM_C z_∈_∃⋎1⋎s_conv;
=IGN
z_∈_∃⋎1⋎s_conv ⓩv ∈ ((∃⋎1 x,y:X;z:𝕌 | p x z ⦁ ([w:W;x,y:X;z:𝕌 | q w x y z] ⦂ 𝕌))⦂ 𝕌)⌝;
z_∃⋎1⋎s_conv ⓩ((∃⋎1 x,y:X;z:𝕌 | p x z ⦁ ([w:W;x,y:X;z:𝕌 | q w x y z] ⦂ 𝕌))⦂ 𝕌)⌝;
=TEX
\section{OTHER SCHEMA CALCULUS OPERATORS}
=SML
val ⦏z_↾⋎s_conv⦎ : CONV = (fn tm =>
let	val (r,s) = dest_z_↾⋎s tm
		handle complaint =>
		divert complaint "dest_z_↾⋎s" "z_↾⋎s_conv" 43019 [fn () => string_of_term tm];
	val spec = ↾⋎s_gen_semantic_const tm
		handle (Fail _) =>
		(diag_string "z_↾⋎s_conv - semantic constant generator failed";
		get_spec tm);
	val s1 = simple_eq_match_conv1 spec tm;
in
	check_is_z_conv_result "z_↾⋎s_conv" s1
end);
val ⦏z_∈_↾⋎s_conv⦎ = DUP_SAP_C(∈_C z_↾⋎s_conv);
=IGN
z_∈_↾⋎s_convⓩp ∈ ([x:X; y,z:Y| f x z y] ↾⋎s [p:P;y:Y | g p y])⌝;
z_↾⋎s_convⓩ[x:X; y,z:Y| f x  zy] ↾⋎s [p:P;y:Y | g p y]⌝;
=TEX
=SML
val ⦏z_hide⋎s_conv⦎ : CONV = (fn tm =>
let	val (s,xs) = dest_z_hide⋎s tm
		handle complaint =>
		divert complaint "dest_z_hide⋎s" "z_hide⋎s_conv" 43018
			[fn () => string_of_term tm];
	val spec = hide⋎s_gen_semantic_const tm
		handle (Fail _) =>
		(diag_string "z_hide⋎s_conv - semantic constant generator failed";
		get_spec tm);
	val s1 = simple_eq_match_conv1 spec tm;
in
	check_is_z_conv_result "z_∈_hide⋎s_conv" s1
end);
val ⦏z_∈_hide⋎s_conv⦎ = DUP_SAP_C(∈_C z_hide⋎s_conv);
=IGN
z_∈_hide⋎s_convⓩp ∈ ([w,x:X; y,z:Y| f w x z y] \⋎s (x,z))⌝;
z_hide⋎s_convⓩ[w,x:X; y,z:Y| f w x z y] \⋎s (x,z)⌝;
=TEX
=SML
val ⦏z_⨾⋎s_conv⦎ : CONV = (fn tm =>
let	val (r,s) = dest_z_⨾⋎s tm
		handle complaint =>
		divert complaint "dest_z_⨾⋎s" "z_⨾⋎s_conv" 43025
			[fn () => string_of_term tm];
	val spec = ⨾⋎s_gen_semantic_const tm
		handle (Fail _) =>
		(diag_string "z_⨾⋎s_conv - semantic constant generator failed";
		get_spec tm);
	val s1 = simple_eq_match_conv1 spec tm;
in
	check_is_z_conv_result "z_∈_⨾⋎s_conv" s1
end);
val ⦏z_∈_⨾⋎s_conv⦎ = DUP_SAP_C (∈_C z_⨾⋎s_conv);
=IGN
z_∈_⨾⋎s_convⓩp ∈ ([x,x':X; y,z,w':Y| f w' x x' z y] ⨾⋎s [p:P;x:X;w,y:Y | g x p y])⌝;
z_⨾⋎s_convⓩ[x,x':X; y,z,w':Y| f x x' z y] ⨾⋎s [p:P;x:X;w,y:Y | g x p y]⌝;
=TEX
Due to the similar form of the semantic constants for renaming and decoration,
$lz\_∈\_rename⋎s\_conv$ is derived from $lz\_∈\_rename⋎s\_conv$ as follows:
\begin{enumerate}
\item All occurrences of $decor⋎s$ have been replaced by $rename⋎s$.
\item Error 43015 has been changed to 43031.
\item An extra failure handler has been added for $mk\_eq$ for error 43035.
\item The conjunction of equalities returned by $z\_binding\_eq\_conv3$ needs reordering as renaming can change the order of components, unlike decoration.
\end{enumerate}
=SML
local
	fun eq_order tm1 tm2 =
		let	fun key tm = #2 (dest_z_sel⋎s (#1 (dest_eq tm)));
		in	z_sig_order (key tm1) (key tm2)
		end;
in
val ⦏lz_∈_rename⋎s_conv⦎ : CONV = (fn tm => (
let	val (x,sd) = dest_z_∈ tm;
	val (s,dec) = dest_z_rename⋎s sd;
	val spec = rename⋎s_gen_semantic_const sd
		handle (Fail _) =>
		(diag_string "rename⋎s_gen_semantic_const fail - z_∈_rename⋎s_conv";
		get_spec sd);
	val s1 = conv_rule(BINDER_C(RIGHT_C(BINDER_C(BINDER_C
		(RIGHT_C (z_binding_eq_conv1)))))) spec;
	val (bind, body) =
		dest_∃ (snd(dest_set_comp(snd(dest_eq (snd(dest_∀(concl s1)))))));
	val eqtm = snd(dest_app body);
	val wits =
		if is_z_true eqtm
		then []
		else map dest_eq (strip_∧ eqtm);
	val labs = map (snd o dest_z_sel⋎s o snd) wits;
	val vs = map fst wits;
	val wit = mk_z_binding(combine labs vs);
	val s2 = eq_sym_rule(
		(z_binding_eq_conv3 THEN_TRY_C sort_∧_conv eq_order) (mk_eq(wit,bind)))
			handle (Fail _) => term_fail "z_∈_rename⋎s_conv" 43035 [sd];
	val s3 = conv_rule(BINDER_C(RIGHT_C(BINDER_C(BINDER_C(RIGHT_C
		(fn _ => s2)))))) s1;
	val s4 = conv_rule (BINDER_C(RIGHT_C(BINDER_C(local_prove_∃_conv1 wit))))
			s3;
	val s5 = (RIGHT_C (simple_eq_match_conv1 s4)
		THEN_C ∈_comp_conv) tm;
	val s6 = conv_rule(RIGHT_C(LEFT_C(BINDING_C(TRY_C z_sel⋎s_conv)))) s5;
in
	check_is_z_conv_result "z_∈_rename⋎s_conv" s6
end)
handle complaint =>
list_divert complaint "z_∈_rename⋎s_conv"
	[("dest_z_rename⋎s", 43031, [fn () => string_of_term tm]),
	("dest_z_∈", 43031, [fn () => string_of_term tm]),
	("simple_eq_match_conv1", 43031, [fn () => string_of_term tm]),
	("eq_trans_rule", 43000, [fn () => string_of_term tm])])
;
end (* of local ... in ... *);
val ⦏z_∈_rename⋎s_conv⦎ : CONV = DUP_SAP_C lz_∈_rename⋎s_conv;
val ⦏z_rename⋎s_conv⦎ : CONV = Z_∈_ELIM_C z_∈_rename⋎s_conv;
=IGN
z_∈_rename⋎s_conv ⓩv ∈ [x,x':X; y,z,w':Y| f w' x x' z y][p/x,q/x',r/s]⌝;
z_∈_rename⋎s_conv ⓩΠ( [x,x':X; y,z,w':Y| f w' x x' z y][p/x,q/x',r/s])⌝;
z_∈_rename⋎s_conv ⓩ(p ≜ p1, q ≜ q1, y ≜ y1, z ≜ z1, w' ≜ w1) ∈ [x,x':X; y,z,w':Y| f w' x x' z y][p/x,q/x',r/s]⌝;
z_rename⋎s_convⓩ[x,x':X; y,z,w':Y| f w' x x' z y][p/x,q/x',r/s]⌝;
z_rename⋎s_convⓩ[x,x':X; y,z,w':Y| f w' x x' z y][p/x,y/x',r/s]⌝;
z_∈_rename⋎s_convⓩp ∈ [x,x':X; y,z,w':Y| f w' x x' z y][p/x,y/x',r/s]⌝;
=TEX
\section{OTHERS}
=TEX
The following was a later addition and is put here for convenience.
=SML
val ⦏z_dec_rename⋎s_conv⦎ : CONV = (fn dec =>
	let	val (_, d) = dest_z_schema_dec dec;
		val (con_bdg, sch) = dest_app dec;
		val (_, bdg) = dest_app con_bdg;
		val ntms = dest_z_binding bdg;
	in	if	any ntms (fn (n, t) => pack_ident(n, d) <> fst(dest_var t))
		then
	let	fun aux ((n, v) :: more) = (
			let	val n' = fst(dest_var v);
			in	if	n = n'
				then	aux more
				else	(n', n) :: aux more
			end
		) | aux [] = [];
		val renames = aux ntms;
		val sch' = mk_z_rename⋎s(sch, renames);
		val dec' = mk_z_schema_dec(sch', "");
		val thm1 = z_dec_pred_conv dec;
		val thm2 = eq_sym_rule
			((z_dec_pred_conv THEN_C z_∈_rename⋎s_conv) dec');
	in	eq_trans_rule thm1 thm2
	end	else	term_fail "z_dec_rename⋎s_conv" 43060 [dec]
	end	handle ex => reraise ex "z_dec_rename⋎s_conv"
);
=TEX
\section{PROOF CONTEXTS}
=SML
val ⦏z_schema_∈_conv⦎ : CONV = (fn tm =>
let	val (x,s) = dest_z_∈ tm;
in
	case (dest_z_term s) of (* dest_z_term1 not appropriate here KB *)
	Z¬⋎s _ => z_∈_¬⋎s_conv tm
	| Z∧⋎s _ => z_∈_∧⋎s_conv tm
	| Z∨⋎s _ => z_∈_∨⋎s_conv tm
	| Z⇒⋎s _ => z_∈_⇒⋎s_conv tm
	| Z⇔⋎s _ => z_∈_⇔⋎s_conv tm
	| Z∃⋎s _ => z_∈_∃⋎s_conv tm
	| Z∃⋎1⋎s _ => z_∈_∃⋎1⋎s_conv tm
	| Z∀⋎s _ => z_∈_∀⋎s_conv tm
	| ZHSchema _ => z_∈_h_schema_conv tm
	| ZDecor⋎s _ => z_∈_decor⋎s_conv tm
	| ZPre⋎s _ => z_∈_pre⋎s_conv tm
	| Z↾⋎s _ => z_∈_↾⋎s_conv tm
	| ZHide⋎s _ => z_∈_hide⋎s_conv tm
	| ZΔ⋎s _ => z_∈_Δ⋎s_conv tm
	| ZΞ⋎s _ => z_∈_Ξ⋎s_conv tm
	| Z⨾⋎s _ => z_∈_⨾⋎s_conv tm
	| ZRename⋎s _ => z_∈_rename⋎s_conv tm
	| _ => z_schema_pred_intro_conv tm
end);
=TEX
=SML
val ⦏z_schema_pred_∈_conv⦎ : CONV = (fn tm =>
let	val (x,s) = dest_bin_op "z_schema_pred_∈_conv" 0 "Z'SchemaPred" tm;
in
	case (dest_z_term s) of  (* dest_z_term1 not appropriate here KB *)
	Z¬⋎s _ => z_∈_¬⋎s_conv tm
	| Z∧⋎s _ => z_∈_∧⋎s_conv tm
	| Z∨⋎s _ => z_∈_∨⋎s_conv tm
	| Z⇒⋎s _ => z_∈_⇒⋎s_conv tm
	| Z⇔⋎s _ => z_∈_⇔⋎s_conv tm
	| Z∃⋎s _ => z_∈_∃⋎s_conv tm
	| Z∃⋎1⋎s _ => z_∈_∃⋎1⋎s_conv tm
	| Z∀⋎s _ => z_∈_∀⋎s_conv tm
	| ZHSchema _ => z_∈_h_schema_conv tm
	| ZDecor⋎s _ => z_∈_decor⋎s_conv tm
	| ZPre⋎s _ => z_∈_pre⋎s_conv tm
	| Z↾⋎s _ => z_∈_↾⋎s_conv tm
	| ZHide⋎s _ => z_∈_hide⋎s_conv tm
	| ZΔ⋎s _ => z_∈_Δ⋎s_conv tm
	| ZΞ⋎s _ => z_∈_Ξ⋎s_conv tm
	| Z⨾⋎s _ => z_∈_⨾⋎s_conv tm
	| ZRename⋎s _ => z_∈_rename⋎s_conv tm
	| _ => fail "" 0 []
end);
=TEX
=SML
val sp_conv = simple_eq_match_conv1 z'schema_pred_def;
val ⦏sel_θ_conv⦎ = (fn tm =>
	if is_z_sel⋎s tm
	then (RAND_C z_θ_conv THEN_C z_sel⋎s_conv) tm
	else fail "" 0 []
);
val ⦏schema_ec⦎ = [(ⓩx ∈ y⌝,z_schema_∈_conv),
	(⌜Z'SchemaPred x y⌝,z_schema_pred_∈_conv),
	(⌜$"Z'θ" x x1 = y⌝, z_θ_eq_conv),
	(⌜y = $"Z'θ" x x1⌝, z_θ_eq_conv),
	(⌜f($"Z'θ" x x1):BOOL⌝,sel_θ_conv),
	(ⓩp ∈ ⌜f($"Z'θ" x x1)⌝⌝,∈_C sel_θ_conv)
];
=IGN
sel_θ_conv ⓩ(θ [x,y,z:X|f x y z]) .y⌝;
=TEX
=SML
val _ = delete_pc "'z_schemas" handle (Fail _) => ();
val _ = new_pc "'z_schemas";
val _ = set_rw_eqn_cxt (schema_ec @
		[(⌜f($"Z'θ" x x1)⌝,sel_θ_conv),
		(⌜$"Z'θ" x x1 = y⌝, z_θ_eq_conv),
		(⌜y = $"Z'θ" x x1⌝, z_θ_eq_conv),
		(⌜$"Z'θ" x y⌝, z_θ_conv1)])"'z_schemas";
val _ = add_rw_thms ([]) "'z_schemas";
val _ = set_st_eqn_cxt (schema_ec @
		(map (mk_¬ ** RAND_C) schema_ec)) "'z_schemas";
val _ = add_st_thms ([]) "'z_schemas";
val _ = set_sc_eqn_cxt (schema_ec @
		(map (mk_¬ ** RAND_C) schema_ec)) "'z_schemas";
val _ =set_rw_canons [] "'z_schemas";
val _ =set_pr_tac z_basic_prove_tac "'z_schemas";
val _ =set_pr_conv z_basic_prove_conv "'z_schemas";
val _ =set_cs_∃_convs[]
	"'z_schemas";
val _ =set_∃_vs_thms [] "'z_schemas";
val _ = commit_pc "'z_schemas";
=TEX
\section{EPILOGUE}
=SML
end; (* of structure ZSchemaCalculus *)
open ZSchemaCalculus;
val _ = ZPredicateCalculus.resolve_forward_references
		{z_dec_rename⋎s_conv = z_dec_rename⋎s_conv};
structure ZPredicateCalculus : ZPredicateCalculus = ZPredicateCalculus;
open ZPredicateCalculus;
=TEX
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}

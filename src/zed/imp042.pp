=IGN
********************************************************************************
imp042.doc: this file is part of the PPZed system

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

\def\Title{Implementation of the Z Language Expressions}

\def\AbstractText{This document contains the implementation of the derived rules of inference, conversions and tactics for the ProofPower Z Language set theory, tuples and cartesian products.}

\def\Reference{DS/FMU/IED/IMP042}

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
%% LaTeX2e port: \TPPtitle{Implementation of the Z Language Expressions}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP042}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.54 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2012/12/30 15:10:33 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.Blackburn & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document contains the implementation
%% LaTeX2e port: of the derived rules of inference, conversions and tactics for the ProofPower Z Language set theory, tuples and cartesian products.}
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
\item [Issues 1.1 (1992/08/20) - 1.3 (1992/09/14)]
First versions.
\item [Issues 1.4 (1992/09/15) (15th September 1992)]
Changes to reflect  issue 1.6 of detailed design.
\item [Issues 1.5 (1992/10/05) (29th September 1992)]
Changes after comments, removal of HOL universals where
appropriate.
\item [Issues 1.7 (1992/10/12) (12th October 1992)]
Modified $z\_⋂\\⋃_thm$.
\item [Issues 1.8 (1992/10/19) (12th October 1992)]
Moved Library material to \cite{DS/FMU/IED/IMP083}.
\item [Issue 1.9 (1992/10/22) (26th October 1992)]
Changes after comments - rearrangement of material
amongst 041, 042 and 043.
\item [Issue 1.10 (1992/10/28) (10th November 1992)]
Changes to reflect changes in issue 1.18 of dtd041.
Changes to $z\-\_∈\-\_seta\-\_conv$.
\item [Issue 1.13 (1992/11/17) (17th November 1992)]
Fixed bug in Z bindings proof context.
\item[Issue 1.14 (1992/12/03) (2nd December 1992)]
Improved $𝕌$ simplification.
\item [Issue 1.15 (1992/12/03),1.16 (1992/12/04) (3rd December 1992)]
Gained $∈\_C$, and $Z\-\_∈\-\_ELIM\-\_C$, handling of sequences and $∈\_λ\_conv$.
\item [Issue 1.17 (1992/12/10) (9th December 1992)]
Added string literals.
\item[Issue 1.18 (1992/12/11) (10th December 1992)]
Global rename from wrk038.doc issue 1.9.
\item[Issue 1.19 (1992/12/14) (14th December 1992)]
Fix bug in $z\_string\_conv$.
\item[Issue 1.20 (1992/12/18) (17th December 1992)]
Extending treatment of bindings.
\item[Issue 1.21 (1993/01/20) (20th January 1993)]
Removed mention of $z\_strip\_tac$.
\item[Issue 1.22 (1993/01/21) (21th January 1993)]
Bug fix.
\item[Issue 1.25 (1993/01/25) (25th January 1993)]
Tinkering.
\item[Issue 1.26 (1993/01/25) (25th January 1993)]
Tiny bug fix.
\item[Issue 1.27 (1993/02/02) (2nd February 1993)]
Fixed proof context bug in ``$'$z$\_$binding''.
\item[Issue 1.28 (1993/02/10) (5th February 1993)]
Rearranging proof contexts.
\item[Issue 1.29 (1993/02/11)/1.30 (1993/02/12) (11th/2th February 1993)]
Improved $z\_β\_conv$.
\item[Issue 1.31 (1993/05/17) (17th March 1993)]
Improved performance of
=GFT
z_sel⋎s_conv
=TEX
\ (in response to bug 116).
\item[Issue 1.32 (1993/12/17) (17th December 1993)]
Fixed bug in z\_⟨⟩\_conv.  It now doesn't fail if the operand is empty.
\item[Issue 1.33 (1996/03/12) ]
Fixed bug 184 and related problems.
\item[Issue 1.34 (1997/04/23) ]
Corrected $z\_sets\_ext\_conv$.
\item[Issue 1.36 (1997/04/25) (25th April 1997)]
Fixing $Z\_∈_ELIM\_C$.
\item[Issue 1.37 (1999/02/17) (17th February 1999)]
\item[Issue 1.38 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.39 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.40 (2004/01/19)] The Z universal set is now called 𝕌.
\item[Issue 1.41 (2005/05/17)] Stopped it relying on accidental behaviour of {\em binding\_gen\_semantic\_const} when passed a variable of the right type as an argument (it has now been corrected to fail in this case as it should).
\item[Issues 1.42 (2005/09/06), 1.43 (2005/09/07)] Added support for let-expressions.
\item[Issue 1.44 (2006/04/20)] Added support for floating point literals
\item[Issues 1.45 (2006/08/11)--1.47 (2006/08/28)] Improved coverage of {\em z\_let\_conv}.
\item[Issue 1.48 (2008/04/13)] Fixed buf in {\em z\_let\_conv}.
\item[Issue 1.49 (2009/03/24)] Made handling of the {\em check\_is\_z} flag more efficient.
\item[Issue 1.50 (2010/04/05)] Support for empty schemas.  Improved $z\_∈\_seta\_conv1$.
\item[Issue 1.51 (2011/05/05)] Allowed for extra parameter to primitive rewriting functions.
\item[Issue 1.52 (2011/08/05)] Allowed for forward reference trick in IMP041.
\item[Issues 1.53 (2012/12/24)--1.55 (2012/12/30)] Bugfix and improved backwards compatibility for $z\_∈\_seta\_conv1$.
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
given in \cite{DS/FMU/IED/DTD042}.
\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains an implementation for the
initial set of rules, conversions and tactics for the set theory, tuples and cartesian products of the ProofPower Z.
\subsubsection{Dependencies}
This document takes its signature from \cite{DS/FMU/IED/DTD042}.
\subsubsection{Deficiencies}
$z\_×\_conv$ is comparatively slow compared to like functions.
\subsubsection{Possible Enhancements}
None known.

\section{PREAMBLE}
=SML
structure ⦏ZExpressions⦎ : ZExpressions = struct
=TEX
=SML
open ZGeneratedConstants ZPredicateCalculus;
val lthy = get_current_theory_name();
val _ = force_delete_theory"imp042" handle Fail _ => ();
val _ = open_theory ⦏"z_language_ps"⦎;
val _ =
	if	get_current_theory_status() <> TSNormal
	then	new_theory "imp042"
	else	();
val _ = set_pc "z_predicates";
val _ = set_flag("z_type_check_only",false);
=TEX

\section{THE CODE}
\subsection{Utilities}
A precaution, lost outside of structure:
=SML
fun ⦏save_thm⦎(a,b) = KernelInterface.save_thm(a, check_is_z_thm "save_thm" b)
	handle (Fail _) =>
	(let val thm = get_thm "z_language_ps" a;
	in
		if thm =|- b
		then b
		else fail "save_thm" 0 []
	end);

fun ⦏list_save_thm⦎(a,b) = KernelInterface.list_save_thm(a, check_is_z_thm "list_save_thm" b)
	handle (Fail _) =>
	(let val thm = get_thm "z_language_ps" (hd a);
	in
		if thm =|- b
		then b
		else fail "save_thm" 0 []
	end);
=SML
fun ⦏list_eq⦎ (eq : 'a * 'a -> bool) (a :: x) (b :: y) =
	eq(a,b) andalso list_eq eq x y
| list_eq _ [] [] = true
| list_eq _ _ _ = false;
=TEX
Some universes:
=SML
val ⦏Ua⦎ = ⓩ𝕌⌝; (* type = 'a SET *)
=TEX
Protected $α$ conversion:
=SML
fun ⦏prot_α_conv⦎ (nm:string) : CONV =
	simple_α_conv nm ORELSE_C (fn tm =>
	if is_simple_λ tm
	then (let	val newnm = string_variant(map (fst o dest_var) (frees tm)) nm;
	in
		simple_α_conv newnm tm
	end)
	else fail_conv tm);
=TEX
\subsubsection{Conversionals}
=SML
fun ⦏Z_LEFT_C⦎ (c : CONV) : CONV = RAND_C (LEFT_C c);
fun ⦏Z_RIGHT_C⦎ (c : CONV) : CONV = RAND_C (RIGHT_C c);
fun ⦏Z_RANDS_C⦎ (c : CONV) : CONV = RAND_C (RANDS_C c);
val ⦏Z_RAND_C⦎ : CONV -> CONV = RAND_C;
=TEX
Apply through all $λ$'s.
NJML doesn't let you specify the fact that it is a conversional properly.
=SML
fun ⦏ALL_SIMPLE_λ_C⦎ (cnv:CONV) (tm : TERM) : THM =
	(SIMPLE_λ_C (ALL_SIMPLE_λ_C cnv)
	ORELSE_C cnv) tm;
=TEX
Apply to the last $∀$ in a sequence.
=SML
fun ⦏LAST_SIMPLE_∀_C⦎ (conv:CONV): CONV = (fn tm =>
	if is_simple_∀ (snd(dest_simple_∀ tm))
	then (SIMPLE_BINDER_C (LAST_SIMPLE_∀_C conv)) tm
	else conv tm
);
=TEX
=SML
fun ⦏LAST_SIMPLE_∃_C⦎ (conv:CONV): CONV = (fn tm =>
	if is_simple_∃ (snd(dest_simple_∃ tm))
	then (SIMPLE_BINDER_C (LAST_SIMPLE_∃_C conv)) tm
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
| LIST_OP_C [] = fail "LIST_OP_C" 0 [];
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
fun ⦏seq_binder_simple_α_conv⦎ [a]:CONV  = (
let	val nm = fst(dest_var a);
in
	RAND_C (prot_α_conv nm)
end
) | seq_binder_simple_α_conv (a::x) = (
let	val nm = fst(dest_var a);
in
	(RAND_C (prot_α_conv nm)) THEN_C BINDER_C (seq_binder_simple_α_conv x)
end
) | seq_binder_simple_α_conv [] = id_conv;
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
val _ = ⓩ(d ≜ d, p ≜ p, t ≜ t, v ≜ v)⌝;
val _ = ⓩ(d ≜ d, p ≜ p, v ≜ v)⌝;
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
fun ⦏all_undisch_rule⦎ (thm:THM) : THM = (
	if is_⇒(concl thm)
	then all_undisch_rule (undisch_rule thm)
	else thm
);
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
\subsection{Conversionals for ∈}

\section{THE IMPLEMENTATION}

\subsection{Definite Description}
=FRULE 1 Conversion
ante_∃_⇒_conv
⌜(∃ x ⦁ p[x]) ⇒ y⌝
├
├
⊢ ((∃ x ⦁ p[x]) ⇒ y) ⇔ ∀ x ⦁ p[x] ⇒ y
=TEX
=SML
val ⦏ante_∃_⇒_thm⦎  = (
push_goal ([],⌜∀ p q ⦁ (($∃ p) ⇒ q) ⇔ ∀ x ⦁ p x ⇒ q⌝);
push_pc "hol1";
a(REPEAT ∀_tac);
a(pure_once_rewrite_tac[prove_rule[]⌜p = (λ y ⦁ p y)⌝]);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(POP_ASM_T (ante_tac o rewrite_rule[]));
a(asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(DROP_NTH_ASM_T 2 (asm_tac o rewrite_rule[]));
a(asm_fc_tac[]);
pop_pc();
pop_thm());

val ⦏ante_∃_⇒_conv⦎ : CONV = (fn tm =>
let	val (∃p,q) = dest_⇒ tm;
	val xnm = fst(dest_var(fst(dest_simple_∃ ∃p)));
	val p = snd(dest_app ∃p);
	val s1 = list_∀_elim[p,q] ante_∃_⇒_thm;
	val s2 = conv_rule(RIGHT_C(RAND_C(prot_α_conv xnm
		THEN_C SIMPLE_λ_C(LEFT_C simple_β_conv)))) s1;
in
	eq_trans_rule (refl_conv tm) s2
end);
=TEX
=SML
val rec seq_ante_∃_⇒_conv:CONV = fn tm:TERM => ((
	(ante_∃_⇒_conv THEN_C BINDER_C seq_ante_∃_⇒_conv)
	ORELSE_C id_conv)
	tm
);
=GFT Example
ante_∃_⇒_conv ⌜(∃ x y z ⦁ f x y z) ⇒ g⌝;
seq_ante_∃_⇒_conv ⌜(∃ x y z ⦁ f x y z) ⇒ g⌝;

=TEX
=INLINEFT
⌜$"Z'μ"⌝
=TEX
{} is a sort of marker function for Z $μ$ constructions.
=SML
val ⦏z'μ_thm⦎ = (
push_goal([],⌜∀ s x ⦁ (∀ y ⦁ y ∈ s ⇒ y = x) ∧ (x ∈ s) ⇒ ($"Z'μ" s = x)⌝);
push_pc "hol1";
a(REPEAT strip_tac);
a(LEMMA_T ⌜s = {x}⌝ (fn x => rewrite_tac [z'μ_def,x]));
a(asm_rewrite_tac[]);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(asm_fc_tac[]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[]);
pop_pc();
pop_thm());
=TEX
=SML
val ⦏hd_last_∀_conv⦎ : CONV = (fn tm =>
let 	val (hdv,bdy) = dest_simple_∀ tm;
	val (vs,bdy') = strip_simple_∀ bdy;
in
	∀_reorder_conv (list_mk_∀((vs @ [hdv]), bdy')) tm
end);
=TEX
=SML
local

val thm1 = (
push_goal([],⌜∀ a b c d ⦁
	(∀ y ⦁ (a ∧ b ∧ (c = y)) ⇒ (y = d)) ⇔
	(a ∧ b ⇒ (c = d))⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(DROP_NTH_ASM_T 3 (strip_asm_tac o ∀_elim ⌜c⌝));
(* *** Goal "2" *** *)
a(POP_ASM_T(asm_rewrite_thm_tac o eq_sym_rule));
pop_thm());

	val cnv1 = simple_eq_match_conv1 thm1;
in
fun ⦏z_μ_rule⦎ (tm : TERM) :THM = (
let	val (d,p,v) = dest_z_μ tm
		handle complaint =>
		pass_on complaint "dest_z_μ" "z_μ_rule";
	val vars =  map (fst o dest_var)
		(list_variant(map mk_var (term_vars tm))
		(map (fn x => mk_var(x,BOOL))["x","x","y"]));
	val var_x = hd (tl vars);
	val var_x1 = hd vars;
	val var_y = hd (tl(tl vars));
	val spec = conv_rule (BINDER_C(RIGHT_C(RAND_C(RAND_C
		(prot_α_conv var_x))))) (μ_gen_semantic_const tm);
	val s1 = simple_eq_match_conv1 spec tm;
	val s2 = conv_rule (RIGHT_C(RAND_C(BINDER_C
		(ALL_SIMPLE_∃_C(fn tm =>
		let	val βred = snd(dest_app(fst(dest_∧ tm)));
			val βred_thm = seq_simple_β_conv βred
		in
		LIST_OP_C [
		((RAND_C (fn _ => βred_thm)) THEN_C d_dpv_proj_conv),
		((RAND_C (fn _ => βred_thm)) THEN_C p_dpv_proj_conv),
		(LEFT_C((RAND_C (fn _ => βred_thm))THEN_C v_dpv_proj_conv))] tm
		end))))) s1;
	val was_sig = fst(strip_λ(snd(dest_app tm)));
	val s3 = conv_rule (RIGHT_C(RAND_C(BINDER_C
		(seq_binder_simple_α_conv was_sig)))) s2;
	val new_set = snd(dest_app(snd(dest_eq (concl s3))));
	val z'μ_thm' = conv_rule (BINDER_C
		(RAND_C (prot_α_conv var_x1 THEN_C
		SIMPLE_λ_C (LEFT_C(LEFT_C(RAND_C(prot_α_conv var_y)))))))
			z'μ_thm;
	val s4 = conv_rule (BINDER_C(RIGHT_C(LEFT_C(
		fn tm => (if tm =$ snd(dest_eq (concl s3))
			then eq_sym_rule s3
			else term_fail "z_μ_rule" 0 [])))))
		(∀_elim new_set z'μ_thm');
	val s5 = conv_rule(BINDER_C(LEFT_C(
		APP_C(RAND_C(BINDER_C((LEFT_C
				simple_∈_comp_conv)
			THEN_C seq_ante_∃_⇒_conv)),
			simple_∈_comp_conv THEN_C z_∃_intro_conv1)))) s4;
	val s6 = conv_rule(BINDER_C(LEFT_C(LEFT_C(
		hd_last_∀_conv THEN_C
		LAST_SIMPLE_∀_C cnv1 THEN_C
		z_∀_intro_conv1)
		))) s5;
	val s7 = conv_rule (TRY_C z_∀_intro_conv) s6;
in
	check_is_z_thm "z_μ_rule" s7
end);
end;
=TEX
=GFT Example
z_μ_rule ⓩμ x,y:X;z:Y;p:X | z ⦁ x = y⌝;
z_μ_rule ⓩμ x,y:X;z:Y;p:X | z ⦁ p(x = y)⌝;
=TEX
\subsection{Let-expressions}
=TEX
=SML
val ⦏z_let_conv1⦎ = (fn tm =>
	simple_eq_match_conv z'let_def tm
	handle Fail _ => term_fail "z_let_conv1" 47211 [tm]
);
=TEX
=SML
val ⦏z_let_conv⦎ = (fn tm =>
	let	val thm1 = z_let_conv1 tm
		handle Fail _ => term_fail "z_let_conv" 47211 [tm];
	in let	val (defs, b) = dest_z_let tm;
		fun expand_defs i ns vs tpl = (
			let	val subs = combine (dest_z_tuple tpl) vs;
				val tpl' = subst subs tpl;
				val i' = length(frees tpl' drop (fn v => not(v term_mem vs)));
			in	if	i' > 0
				andalso	(i = ~1 orelse i' < i)
				then	expand_defs i' ns vs tpl'
				else if	i' = 0
				then	let	val ts = dest_z_tuple tpl'
					in	(combine ts vs, combine ns ts)
					end
				else	term_fail "z_let_conv" 42029 [tm]
 			end
		);
		val ns = map fst defs;
		val vs = map (fn (n, t) => mk_var(n, type_of t)) defs;
		val tpl = mk_z_tuple(map snd defs);
		val (subs, edefs) = expand_defs ~1 ns vs tpl;
		val wit = mk_z_binding(
			Sort.sort (fn (s1, _) => fn (s2, _) => Sort.string_order s1 s2) edefs);
		val r = subst subs b;
		val mu_tm = snd(dest_eq(concl thm1));
		val thm2 = ∀_elim r (conv_rule (TRY_C z_∀_elim_conv1)(z_μ_rule mu_tm));
		val ant = fst(dest_⇒(concl thm2));
		val refl_tac = fn gl as (_, c) =>
			accept_tac(refl_conv(fst(dest_eq c))) gl;
		val tac =
			(∧_tac THEN_LIST
			[z_∀_tac
			THEN conv_tac (LEFT_C (ONCE_MAP_C z_∈_setd_conv))
			THEN ⇒_T (REPEAT_TTCL ∧_THEN asm_tac)
			THEN ALL_VAR_ELIM_ASM_T1 asm_tac
			THEN refl_tac
,
			z_∃_tac wit
			THEN REPEAT ∧_tac
			THEN REPEAT (FIRST [
				conv_tac z_∈_setd_conv,
				conv_tac (simple_eq_match_conv eq_rewrite_thm),
				accept_tac t_thm])]);
		val thm3 = tac_proof(([], ant), tac);
		val thm4 = ⇒_mp_rule thm2 thm3;
		val thm5 = eq_trans_rule thm1 thm4;
	in	thm5
	end	handle Fail _ =>
		term_fail "z_let_conv" 42029 [tm]
	end
);
=TEX
\subsection{Functional Application}
=SML
local
val _ = push_pc "hol1";
val thm1 = simple_eq_match_conv1 z'app_def ⓩf a⌝;
val thm2 = all_∀_intro(
		rewrite_rule[] (
		∀_elim ⌜{f_a:'b|ⓩ(⌜a:'a⌝,⌜f_a:'b⌝) ∈ f⌝}⌝
		z'μ_thm));
val thm3 = (push_goal([],ⓩ(∀ f_a:𝕌 | (a, f_a) ∈ f ⦁ f_a = x) ∧
	(a,x) ∈ f
	⇒
	(f a = x)⌝);
a(REPEAT strip_tac);
a(rewrite_tac[thm1]);
a(strip_asm_tac(list_∀_elim[⌜a⌝,⌜f⌝,⌜x⌝] thm2));
a(DROP_NTH_ASM_T 4 (strip_asm_tac o conv_rule z_∀_elim_conv1));
a(asm_fc_tac[]);
pop_thm());
val _ = pop_pc();		
in
val ⦏z_app_thm⦎ = save_thm("z_app_thm", all_z_∀_intro thm3);
end;

=SML
local
	val thm1 = conv_rule z_∀_elim_conv1 z_app_thm;
in
fun ⦏local_z_app_rule⦎ tm = (
let	val (f,a) = dest_z_app tm;
	val vs = map mk_var(term_vars tm);
	val x' = variant vs (mk_var("x",type_of tm));
in
	simple_∀_intro x' (list_∀_elim [a,f,x'] thm1)
end);
end;
=TEX
=SML
local
	val thm1 = taut_rule ⌜∀ x ⦁ x ⇔ (x ⇔ T)⌝;
	val thm2 = conv_rule z_∀_elim_conv1 z_app_thm;
	val cnv1 = simple_eq_match_conv1 thm1;
in
val rec ⦏z_app_eq_tac⦎ : TACTIC = (fn ((asms,conc):GOAL) =>
	if not(is_z_eq conc orelse is_z_⇔ conc) andalso is_z_app conc
	then (conv_tac cnv1 THEN z_app_eq_tac)(asms,conc)
	else
let	val (fa,v) = dest_z_eq conc
		handle complaint as (Fail _) =>
		(dest_z_⇔ conc
		handle complaint as (Fail _) =>
		(divert complaint "dest_z_⇔" "z_app_eq_tac" 42002 []));
in
	CHECK_IS_Z_T "z_app_eq_tac"
	(if is_z_app fa
	then (let val (f,a) = dest_z_app fa;
		in
		⇒_thm_tac (list_∀_elim [a,f,v] thm2)
	end)
	else if is_z_app v
	then (let val (f,a) = dest_z_app v;
		val v = fa
	in
		⇒_thm_tac (conv_rule(RIGHT_C eq_sym_conv)
			(list_∀_elim [a,f,v] thm2))
	end)
	else fail "z_app_eq_tac" 42002 [])(asms,conc)
end);
end;
=GFT Example
set_goal([],ⓩp 1 = 2⌝);
a(z_app_eq_tac);
set_goal([],ⓩ2 = p 1⌝);
a(z_app_eq_tac);
set_goal([],ⓩ⌜r:(ℤ, BOOL) $"Z'T[2]" SET⌝ 1⌝);
a(z_app_eq_tac);
drop_main_goal();
=TEX
=SML
=SML
local
val a_z_app_thm = (
push_goal([],⌜∀ (f:('a, 'b) $"Z'T[2]" SET) (a:'a) ⦁
	ⓩf a = (μ f_a :𝕌 | (a,f_a) ∈ f ⦁ f_a)⌝⌝);
push_pc "hol1";
a(REPEAT ∀_tac);
let val (lhs,rhs) = dest_eq(snd(top_goal()));
in
a(rewrite_tac[dpv_proj_thm, get_spec lhs, get_spec rhs])
end;
a(conv_tac (ONCE_MAP_C z_decl_pred_conv));
a(conv_tac (ONCE_MAP_C z_∈_u_conv));
a(rewrite_tac[]);
a(conv_tac (ONCE_MAP_C prove_∃_conv));
a(rewrite_tac[]);
pop_pc();
pop_thm());
in
val ⦏z_app_conv⦎ :CONV = simple_eq_match_conv1 a_z_app_thm
	ORELSE_C (fn tm => term_fail "z_app_conv" 47190 [tm]);
end;
=TEX
=GFT Example
z_app_conv ⓩ1 + 2⌝;
=TEX

\subsection{Concerning λ}
=SML
local
val x = mk_var("x",type_of ⓩ(x,y)⌝);
in
val ⦏p1_q2_thm⦎ = all_∀_intro(
push_goal([],ⓩ((p = ⓜx⌝.1) ∧ (q = ⓜx⌝.2)) ⇔ ((p,q) = ⓜx⌝)⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(asm_rewrite_tac[get_specⓩ(x,y)⌝]);
(* *** Goal "2" *** *)
a(POP_ASM_T (rewrite_thm_tac o eq_sym_rule));
a(rewrite_tac[get_specⓩ(x,y)⌝]);
(* *** Goal "3" *** *)
a(POP_ASM_T (rewrite_thm_tac o eq_sym_rule));
a(rewrite_tac[get_specⓩ(x,y)⌝]);
pop_thm());
end;
=TEX
=SML
local

	val z'λ_conv1 = BINDER_C(ALL_SIMPLE_∃_C
		((fn tm =>
		let	val βred = snd(dest_app(fst(dest_∧ tm)));
			val βred_thm = seq_simple_β_conv βred
		in
LIST_OP_C [
		RAND_C (fn _ => βred_thm) THEN_C d_dptv_proj_conv,
		RAND_C (fn _ => βred_thm) THEN_C p_dptv_proj_conv,
		LEFT_C(RAND_C (fn _ => βred_thm) THEN_C t_dptv_proj_conv),
		LEFT_C(RAND_C (fn _ => βred_thm) THEN_C v_dptv_proj_conv)
		] tm
		end)
		THEN_C RIGHT_C(RAND_C (simple_eq_match_conv1 p1_q2_thm))));

	val z'seta_conv1 = BINDER_C(ALL_SIMPLE_∃_C
		(fn tm =>
		let val βred = snd(dest_app(fst(dest_∧ tm)));
			val βred_thm = seq_simple_β_conv βred
		in
		LIST_OP_C [
		RAND_C (fn _ => βred_thm) THEN_C d_dpv_proj_conv,
		RAND_C (fn _ => βred_thm) THEN_C p_dpv_proj_conv,
		LEFT_C(RAND_C (fn _ => βred_thm) THEN_C v_dpv_proj_conv)
		] tm
		end
		));
in
val ⦏z_λ_conv⦎ : CONV = (fn tm =>
let	val (d,p,v) = dest_z_λ tm
		handle complaint =>
		pass_on complaint "dest_z_λ" "z_λ_conv";
	val was_sig = fst(strip_λ(snd(dest_app tm)));
	val s1 = λ_gen_semantic_const tm;
	val s2 = simple_eq_match_conv1 s1 tm;
	val s3 = conv_rule (RIGHT_C z'λ_conv1) s2;
	val s4 = conv_rule (RIGHT_C(BINDER_C
		(seq_binder_simple_α_conv was_sig))) s3;
	val v' = fst(dest_eq(snd(dest_∧(snd(dest_∧(snd(strip_∃
		(snd(dest_set_comp(snd(dest_eq(concl s4))))))))))));
	val tar_tm = mk_z_seta(d,p,v');
	val s5 = seta_gen_semantic_const tar_tm;
	val s6 = simple_eq_match_conv1 s5 tar_tm;
	val s7 = conv_rule(RIGHT_C z'seta_conv1) s6;
	val s8 = conv_rule (RIGHT_C(BINDER_C
		(seq_binder_simple_α_conv was_sig))) s7;
	val s9 = eq_trans_rule s4 (eq_sym_rule s8);
in
	check_is_z_thm "z_λ_conv" s9
end);
end;
=TEX
=GFT Example
z_λ_conv ⓩλ x,y:X;a:Y | f x ⦁ g y a⌝;
z_λ_conv ⓩ(λ [z:Y;x,y : X| x = y] | g x ⦁ f z x)⌝;
z_λ_conv ⓩ(λ [x,y : X | x = y] | g x ⦁ f x)⌝;
=TEX
Replace a single HOL universal by a single Z universal,
no declarations, etc, present.
=SML
local
	val thm1 = all_∀_intro(set_goal([], ⓩx ⇔ (((y ∈ 𝕌) ∧ true) ⇒ x)⌝);
		a(conv_tac (MAP_C z_∈_u_conv));
		a(PC_T1 "hol" rewrite_tac[]);
		pop_thm());
in
fun ⦏z_∀_intro_1_var⦎ thm = (
let	val (x,bdy) = dest_∀(concl thm);
	val s1 = simple_∀_elim x thm;
	val s2 = ⇔_mp_rule (list_∀_elim[concl s1,x] thm1) s1;
in
	z_∀_intro1 s2
end);
end;
=IGN
z_∀_intro_1_var (asm_rule ⌜∀ x ⦁ (x = ⓩ3⌝) ⇒ (x = ⓩ4⌝)⌝);
=SML
local
	val z'λ_conv1 = ALL_SIMPLE_∃_C
		(fn tm =>
		let	val βred = snd(dest_app(fst(dest_∧ tm)));
			val βred_thm = seq_simple_β_conv βred
		in
		LIST_OP_C [
		RAND_C (fn _ => βred_thm) THEN_C d_dptv_proj_conv,
		RAND_C (fn _ => βred_thm) THEN_C p_dptv_proj_conv,
		LEFT_C(RAND_C (fn _ => βred_thm) THEN_C t_dptv_proj_conv) THEN_C
		RIGHT_C tuple2_1_proj_conv,
		LEFT_C(RAND_C (fn _ => βred_thm) THEN_C v_dptv_proj_conv) THEN_C
		RIGHT_C tuple2_2_proj_conv
		] tm
		end)
		THEN_C z_∃_intro_conv1;
in
fun ⦏z_app_λ_rule⦎ (tm :TERM):THM  = (
let	val (lam,arg) = dest_z_app tm
		handle complaint =>
		divert complaint "dest_z_app" "z_app_λ_rule" 42008
			[fn () => string_of_term tm];
	val (d,p,v) = dest_z_λ lam
		handle complaint =>
		divert complaint "dest_z_λ" "z_app_λ_rule" 42008
			[fn () => string_of_term tm];
	val was_sig = fst(strip_λ(snd(dest_app lam)));
	val s1 = (local_z_app_rule tm);
	val s2 = λ_gen_semantic_const lam;
	val cnv1 = RIGHT_C (simple_eq_match_conv1 s2) THEN_C
		simple_∈_comp_conv THEN_C
		seq_binder_simple_α_conv was_sig THEN_C
		z'λ_conv1;
	val s3 = conv_rule(BINDER_C(LEFT_C(
		APP_C(RAND_C(RAND_C(BINDER_C(LEFT_C cnv1))),
		cnv1)))) s1;
	val s4 = z_∀_intro_1_var s3;
in
	check_is_z_thm "z_app_λ_rule" s4
end);
end;
=GFT Example
z_app_λ_rule ⓩ(λ x,y : X; z:Y | x = y ⦁ f z x) (1,2,g)⌝;
z_app_λ_rule ⓩ(λ x : X | f x ⦁ g x) y⌝;
z_app_λ_rule ⓩ(λ [x,y : X; z:Y| x = y] | g x ⦁ f z x) (x ≜ 1,y ≜ 2,z ≜ g)⌝;
z_app_λ_rule ⓩ(λ x : X ⦁ y) x⌝;
z_app_λ_rule ⓩ(λ x : X ⦁ y) z⌝;
z_app_λ_rule ⓩ(λ x : X ⦁( ∀ z : 𝕌 ⦁ f x y z)) z⌝;
=TEX
=SML
local
	val ⇒_thm = taut_rule⌜∀ x ⦁ x ⇒ x⌝;

	fun local_rule thm gl = (
	let 	val (a,b) = dest_⇒ gl;
		val (x,bdy) = dest_eq(concl thm);
		val ithm = simple_∀_elim b ⇒_thm;
	in
		subst_rule[(eq_sym_rule thm,x)] gl ithm
	end);
	val eq_cnv1 = simple_eq_match_conv1 (prove_rule [] ⌜∀ x ⦁ (x = x) ⇔ T⌝);
	val ∧_cnv1 = simple_eq_match_conv1 (prove_rule [] ⌜∀ x ⦁T ∧  x ⇔ x⌝);

	val rwc = RIGHT_C(RIGHT_C(LEFT_C eq_cnv1 THEN_C ∧_cnv1));
	val rw_tac2_thm = tac_proof(([],
		⌜∀ t⦁ ¬ (F ∧ t) ∧ ¬ (t ∧ F) ∧
		(∀ x⦁ x = x ⇔ T) ∧ (F ⇒ t) ∧
		(¬ T ⇔ F) ∧ (¬ F ⇔ T)⌝),
		rewrite_tac[]);
	val rw_rule = prim_rewrite_rule empty_net
		initial_rw_canon
		Nil
		TOP_MAP_C
		[]
		[rw_tac2_thm, ¬_⇔_thm];
	val rw_tac2 = (prim_rewrite_tac	
		(make_net(flat(map (cthm_eqn_cxt initial_rw_canon)
			[rw_tac2_thm])))
		initial_rw_canon
		Nil
		TOP_MAP_C
		[]);
in
fun local_simple_∃_equation_conv witness tm = (
let	val (x,bdy) = dest_simple_∃ tm;
	val (xnm,xty) = dest_var x;
	val new_term = var_subst [(witness,x)] bdy;
	val new_term_rw = rwc new_term;
	val new_term' = snd(dest_eq(concl new_term_rw));
	val thm = tac_proof(([],mk_⇔(tm,new_term')),
		⇔_T2 (fn thm =>
		t_tac ORELSE
		conv_tac(fn ag => eq_sym_rule new_term_rw)
		THEN
		SIMPLE_∃_THEN ante_tac thm
		THEN (
			let val x' = variant (frees(concl thm) @ frees new_term) x;
			in
			CASES_T2 (mk_eq(x',witness))
			(fn thm1 => fn (seqasms,gl) =>
			accept_tac (local_rule thm1 gl)(seqasms,gl))
			(fn thm1 => rw_tac2[
				thm1,
				((rw_rule thm1) handle (Fail _) => t_thm),
				¬_eq_sym_rule thm1])
			end)			
		)
		(fn thm =>
		simple_∃_tac witness THEN accept_tac
			(⇔_mp_rule (eq_sym_rule new_term_rw) thm)
		));
in
	eq_trans_rule (refl_conv tm) thm
end);
end;
=TEX
=SML
local
	val z'λ_conv1 = BINDER_C
		(fn tm =>
		let	val βred = snd(dest_app(fst(dest_∧ tm)));
			val βred_thm = seq_simple_β_conv βred
		in
		LIST_OP_C [
		RAND_C (fn _ => βred_thm) THEN_C d_dptv_proj_conv,
		RAND_C (fn _ => βred_thm) THEN_C p_dptv_proj_conv,
		LEFT_C(RAND_C (fn _ => βred_thm) THEN_C t_dptv_proj_conv) THEN_C
		RIGHT_C tuple2_1_proj_conv,
		LEFT_C(RAND_C (fn _ => βred_thm) THEN_C v_dptv_proj_conv) THEN_C
		RIGHT_C tuple2_2_proj_conv
		] tm
		end);
val cnv2_cnvs = map simple_eq_match_conv1 [
	(tac_proof(([],
		⌜∀ a b c d e ⦁
		(a ∧ b ∧ c ∧ (d = e) ⇒ (e = d)) ⇔ T⌝),
		REPEAT strip_tac THEN asm_rewrite_tac[])),
	(tac_proof(([],
		⌜∀ a b d e ⦁
		(a ∧ b ∧ (d = e) ⇒ (e = d)) ⇔ T⌝),
		REPEAT strip_tac THEN asm_rewrite_tac[]))];

val cnv2 = hd cnv2_cnvs ORELSE_C (hd(tl cnv2_cnvs));

val cnv3 = simple_eq_match_conv1 (prove_rule[]⌜(∀ x ⦁ T) ⇔ T⌝);
val cnv4 = simple_eq_match_conv1 (prove_rule[]⌜∀ x ⦁ (T ∧ x) ⇔ x⌝);
val cnv5_thms = [eq_rewrite_thm, ∧_rewrite_thm];

val cnv5a = (pure_rewrite_conv cnv5_thms);
val cnv5b_thms = [taut_rule ⌜∀ x ⦁ ((T ∧ T) ⇒ x) ⇔ x⌝,
	taut_rule ⌜∀ x y ⦁ ((T ∧ y) ⇒ x) ⇔ (y ⇒ x)⌝,
	taut_rule ⌜∀ x y ⦁ ((y ∧ T) ⇒ x) ⇔ (y ⇒ x)⌝,
	taut_rule ⌜∀ x y z ⦁ ((y ∧ z) ⇒ x) ⇔ (z ⇒ y ⇒ x)⌝,
	taut_rule ⌜∀ x ⦁ (T ⇒ x) ⇔ x⌝];

val cnv5b = (prim_rewrite_conv empty_net initial_rw_canon Nil
		(Combinators.I) [] cnv5b_thms);

val cnv5 = (LEFT_C (TRY_C cnv5a)) THEN_C(TRY_C cnv5b);
val λ1_def = get_spec ⓩ(λ p:𝕌⦁q)⌝;
val λ1_conv = simple_eq_match_conv1 λ1_def;
in
fun ⦏z_β_conv⦎ (tm :TERM):THM  = (
let	val (lam,arg) = dest_z_app tm;
	val (d,p,v) = dest_z_λ lam;
	val was_sig = fst(strip_λ(snd(dest_app lam)));
	val d' = dest_z_decl d;
	val dummy = if (length d' <> 1) orelse (not(is_z_dec (hd d'))) orelse
			length(fst(dest_z_dec (hd d'))) <> 1
		then term_fail "z_β_conv" 42012 [tm]
		else ();
	val (singx,aset) = (hd ** Combinators.I) (dest_z_dec (hd d'));
	val s1 = (local_z_app_rule tm);
	val cnv1 = RIGHT_C λ1_conv THEN_C
		simple_∈_comp_conv THEN_C
		seq_binder_simple_α_conv was_sig THEN_C
		z'λ_conv1;
	val s3 = conv_rule(BINDER_C(LEFT_C(
		APP_C(RAND_C(RAND_C(BINDER_C(LEFT_C cnv1))),
		cnv1)))) s1;
	val resu = var_subst[(arg,singx)] v;
	val s4 = simple_∀_elim resu s3;
	val ciz = set_check_is_z false;
	val s5 = (conv_rule(LEFT_C(APP_C(
		RAND_C (z_∀_elim_conv2 THEN_C
		BINDER_C(LEFT_C(RIGHT_C (local_simple_∃_equation_conv arg))
		THEN_C cnv2)
		THEN_C cnv3),
		(local_simple_∃_equation_conv arg) THEN_C
			((LEFT_C (Z_DECL_C (z_dec_pred_conv THEN_TRY_C z_∈_u_conv)))
		ORELSE_C (Z_DECL_C (z_dec_pred_conv THEN_TRY_C z_∈_u_conv))))
		THEN_C cnv4)) s4)
		handle complaint =>
		(set_check_is_z ciz; reraise complaint "z_β_conv");	
	val _ = set_check_is_z ciz;
	val s6 = all_undisch_rule(conv_rule cnv5 s5);
in
	check_is_z_thm "z_β_conv" (eq_trans_rule (refl_conv tm) s6)
end
handle complaint =>
list_divert complaint "z_β_conv" [
	("dest_z_app", 42012, [fn () => string_of_term tm]),
	("dest_z_λ", 42012, [fn () => string_of_term tm])]
);
end;
=TEX
=GFT Example
z_β_conv ⓩ(λ x : X | f x ⦁ g x) y⌝;
z_β_conv ⓩ(λ p : 𝕌 | f p ⦁ g p q) y⌝;
z_β_conv ⓩ(λ p : 𝕌  ⦁ g p q) y⌝;
z_β_conv ⓩ(λ p : 𝕌  ⦁ p = y) y⌝;
z_β_conv ⓩ(λ p : 𝕌  ⦁ y = p) y⌝;
z_β_conv ⓩ(λ p : 𝕌  | (true ∧ f p) ⦁ Π(true ∧ (y = p))) y⌝;
z_β_conv ⓩ(λ x : X ⦁ y) z⌝;
z_β_conv ⓩ(λ x : X ⦁ y) x⌝;
=TEX

\subsection{Sets}
=SML
val ⦏z_sets_ext_thm⦎ : THM = save_thm ("z_sets_ext_thm",
	all_z_∀_intro(
push_goal([],ⓩ(x = y) ⇔ (∀z: 𝕌 ⦁ ((z ∈ x) ⇔ (z ∈ y)))⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(DROP_NTH_ASM_T 2 (asm_rewrite_thm_tac o eq_sym_rule));
(* *** Goal "2" *** *)
a(asm_rewrite_tac[]);
(* *** Goal "3" *** *)
a(POP_ASM_T (ante_tac o conv_rule z_∀_elim_conv1));
a(PC_T1 "hol1" rewrite_tac[]);
pop_thm()));
=TEX
=SML
val ⦏z_∈_ℙ_thm1⦎ : THM = save_thm("z_∈_ℙ_thm1", all_z_∀_intro(
push_goal([],ⓩ(t ∈ ℙ u) ⇔ (∀z: 𝕌 ⦁ ((z ∈ t) ⇒ (z ∈ u)))⌝);
a(rewrite_tac[z'app_def, z'ℙ_def]);
a(PC_T1 "hol1" rewrite_tac[]);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(asm_fc_tac[]);
(* *** Goal "2" *** *)
a(asm_fc_tac[]);
pop_thm()));
local
	val z'seta_conv1 = BINDER_C(ALL_SIMPLE_∃_C
		(fn tm =>
		let val βred = snd(dest_app(fst(dest_∧ tm)));
			val βred_thm = seq_simple_β_conv βred
		in
		LIST_OP_C [
		RAND_C (fn _ => βred_thm) THEN_C d_dpv_proj_conv,
		RAND_C (fn _ => βred_thm) THEN_C p_dpv_proj_conv,
		LEFT_C(RAND_C (fn _ => βred_thm) THEN_C v_dpv_proj_conv)
		] tm
		end
		));
in
val ⦏z_∈_seta_conv⦎ : CONV = (fn tm =>
let	val (x,s) = dest_z_∈ tm;
	val was_sig = fst(strip_λ(snd(dest_app s)));
	val (d,p,t) = dest_z_seta s;
	val spec = seta_gen_semantic_const s;
	val s1 = (RAND_C
		((simple_eq_match_conv1 spec) THEN_C
		z'seta_conv1) THEN_C
		simple_∈_comp_conv) tm;
	val s2 = conv_rule (RIGHT_C
		((seq_binder_simple_α_conv was_sig)
		THEN_C z_∃_intro_conv1)) s1;
in
	check_is_z_conv_result "z_∈_seta_conv"
		(eq_trans_rule (refl_conv tm) s2)
end
handle complaint =>
list_divert complaint "z_∈_seta_conv"
	[("eq_trans_rule",42001,[fn () => string_of_term tm]),
	("dest_z_∈",42001,[fn () => string_of_term tm]),
	("dest_z_seta",42001,[fn () => string_of_term tm])]);
end;
=IGN
z_∈_seta_conv ⓩp ∈ {x:X⦁(x,x)}⌝;
z_∈_seta_conv ⓩ(1,2) ∈ {x:X;y:Y⦁(x,y)}⌝;
=TEX
=SML
local
	val thm1 = (
	push_goal([],⌜∀ (x:'a)⦁ ⓩ(x ∈ {} ⇔ false)⌝⌝);
	a(rewrite_tac[get_spec ⓩ{}⌝] THEN
	PC_T1 "hol1" rewrite_tac[]);
	pop_thm());
	val thm2 = (
	push_goal([],⌜∀ (x:'a) (h:'a) ⦁ ⓩ(x ∈ {h} ⇔ x = h)⌝⌝);
	a(rewrite_tac[get_spec ⓩ{}⌝] THEN
	PC_T1 "hol1" rewrite_tac[]);
	pop_thm());
	val thm3 = (
	push_goal([],⌜∀ (x:'a) (h:'a) (t:'a LIST) ⦁
	ⓩ(x ∈  ⌜Z'Setd (Cons h t)⌝) ⇔ (x = h ∨ x ∈ ⌜Z'Setd t⌝)⌝⌝);
	a(rewrite_tac[get_spec ⓩ{}⌝] THEN
	PC_T1 "hol1" rewrite_tac[]);
	a(REPEAT strip_tac);
	pop_thm());

	val cnv1 = simple_eq_match_conv1 thm1;
	val cnv2 = simple_eq_match_conv1 thm2;
	val cnv3 = simple_eq_match_conv1 thm3;
	fun cnv4 tm = (cnv2 ORELSE_C
		(cnv3 THEN_C RIGHT_C cnv4)
		ORELSE_C (fn tm => term_fail "z_∈_setd_conv"
			42008 [tm])) tm;
	val thm5 = pc_rule1 "hol1" prove_rule[] ⌜∀ x y ⦁ ((x = x) ∨ y) ⇔ T⌝;
	val cnv5 = simple_eq_match_conv1 thm5;
	val thm6 = taut_rule ⌜∀ x ⦁ (x ∨ T) ⇔ T⌝;
	val cnv6 = simple_eq_match_conv1 thm6;
	val thm7 = pc_rule1 "hol1" prove_rule [] ⌜∀ x ⦁ (x =x) ⇔ T⌝;
	val cnv7 = simple_eq_match_conv1 thm7;
	fun cnv8 tm = (
	let	val (p,q) = dest_∨ tm;
		val (x1,h) = dest_eq p;
	in
		if x1 ~=$ h
		then cnv5 tm
		else (RIGHT_C cnv8 THEN_C cnv6) tm
	end
	handle (Fail _) =>
	cnv7 tm);

in
val ⦏z_∈_setd_conv1⦎ : CONV = (fn tm =>
let	val (x,s) = dest_z_∈ tm;
	val (_,tml) = dest_z_setd s;
	val dummy = if x term_mem tml
		then ()
		else term_fail "z_∈_setd_conv1" 42009 [tm];
	val s1 = cnv4 tm
		handle complaint =>
		pass_on complaint "z_∈_setd_conv" "z_∈_setd_conv1";
	val s2 = conv_rule (RIGHT_C cnv8) s1;
in
	check_is_z_conv_result "z_∈_setd_conv1"
	s2
end
handle complaint =>
list_divert complaint "z_∈_setd_conv1"
	[("dest_z_∈",42009,[fn () => string_of_term tm]),
	("dest_z_setd",42009,[fn () => string_of_term tm])]);
end;


=IGN
z_∈_setd_conv ⓩ3 ∈ {2,3,4}⌝;
z_∈_setd_conv ⓩ3 ∈ {4}⌝;
z_∈_setd_conv ⓩ3 ∈ {}⌝;
z_∈_setd_conv1 ⓩ3 ∈ {2,3,4}⌝;
z_∈_setd_conv1 ⓩ3 ∈ {3}⌝;
=TEX
=SML
val _ = delete_pc "'build_z_sets" handle (Fail _) => ();
val _ = new_pc "'build_z_sets";
val _ = set_rw_eqn_cxt
	[(ⓩx ∈ ⌜y (λ z ⦁ w):'a SET⌝⌝,z_∈_seta_conv),
	 (ⓩx ∈ ⌜Z'Seta[0] y:'a SET⌝⌝,z_∈_seta_conv),
	 (⌜(λ x ⦁ y) z⌝,simple_β_conv),
	 (ⓩx ∈ ⌜Z'Setd y⌝⌝,z_∈_setd_conv1)] "'build_z_sets";
val _ = add_rw_thms [∀_rewrite_thm] "'build_z_sets";
val _ = set_pr_tac z_basic_prove_tac "'build_z_sets";
val _ = set_pr_conv z_basic_prove_conv "'build_z_sets";
=TEX
=SML
fun ⦏tt_to_∃_vs⦎  (ty : TYPE) : (string * (TERM list * THM)) = (
let	val (abs,cons) = get_tuple_info ty;
	val def_thm = get_spec (hd cons);
	val abs_nm = fst(dest_const abs);
in
	(abs_nm,(cons, def_thm))
end);
=TEX
=SML
val _ =set_∃_vs_thms [tt_to_∃_vs ⓣ'X SET $"Z'T[1]"⌝] "'build_z_sets";

val _ = set_merge_pcs ["z_predicates","'build_z_sets"];
=TEX
\section{TUPLES}
=SML
local
	fun aux thm [] [] = thm
	| aux thm (a::x)(b::y) = aux (mk_app_rule thm (asm_rule (mk_z_eq (a, b)))) x y
	| aux _ _ _ = error "z_tuple_lang_eq_conv" 0 [];
	
	fun aux1 tm [] [] = tm
	| aux1 tm (a::x)(b::y) = aux1 (mk_z_∧(mk_z_eq (a,b), tm)) x y
	|aux1 _ _ _ = error "z_tuple_lang_eq_conv" 0 [];
in
val ⦏z_tuple_lang_eq_conv⦎ : CONV = (fn tm =>
let	val (lhs,rhs) = dest_z_eq tm
		handle (Fail _) =>
		term_fail "z_tuple_lang_eq_conv" 42003 [tm];
	val s0 = if is_z_tuple lhs andalso is_z_tuple rhs
		then refl_conv tm
		else term_fail "z_tuple_lang_eq_conv" 42003 [tm];
	val tm' = snd(dest_eq(concl s0));
	val (lhs,rhs) = dest_z_eq tm';
	val dummy = if is_z_tuple lhs andalso is_z_tuple rhs
		then ()
		else term_fail "z_tuple_lang_eq_conv" 42003 [tm];
	val spec = tuple_gen_semantic_const lhs;
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
	check_is_z_conv_result "z_tuple_lang_eq_conv"
	(eq_trans_rule s0 s7)
end);
end;
=TEX
=IGN
z_tuple_lang_eq_conv ⓩ(1,2,3) = (p,q,r)⌝;
=SML
val ⦏z_sel⋎t_lang_conv⦎ : CONV = (fn tm =>
let	val (bdy,n) = dest_z_sel⋎t tm
		handle complaint =>
		pass_on complaint "dest_z_sel⋎t" "z_sel⋎t_lang_conv";
	val eg_tm = (mk_z_tuple o map (curry mk_var "x") o
			dest_z_tuple_type o type_of) bdy
		handle Fail _ => term_fail "z_sel⋎t_lang_conv" 42006 [tm];
	val spec = tuple_gen_semantic_const eg_tm;
	val s0 = (if is_z_tuple bdy
		then refl_conv tm
		else term_fail "z_sel⋎t_lang_conv" 42006 [tm]);
	val tm' = snd(dest_eq(concl s0));
	val (bdy,n) = dest_z_sel⋎t tm';
	val xi = dest_z_tuple bdy;
	val proj_thm = nth (n-1)
		(strip_∧_rule(list_∀_elim (bdy :: xi) spec));
in
	check_is_z_conv_result "z_sel⋎t_lang_conv"
	(eq_trans_rule s0 proj_thm)
end);
=TEX
=IGN
z_sel⋎t_lang_conv ⓩ(1,2,3,4).2⌝;
=SML
val ⦏z_tuple_lang_intro_conv⦎ : CONV = (fn tm =>
let	val s0 = if is_z_tuple tm
		then refl_conv tm
		else term_fail "z_tuple_lang_intro_conv" 42005 [tm];
	val tm' = snd(dest_eq(concl s0));
	val xi = dest_z_tuple tm'
		handle (Fail _) =>
		term_fail "z_tuple_lang_intro_conv" 42005 [tm];
	val tuple= fst(dest_z_sel⋎t(hd xi))
		handle (Fail _) =>
		term_fail "z_tuple_lang_intro_conv" 42005 [tm];
	val spec = all_∀_elim (∀_elim tuple (tuple_gen_semantic_const tm'))
		handle (Fail _) =>
		term_fail "z_tuple_lang_intro_conv" 42005 [tm];
	val cthm = hd(rev(strip_∧_rule spec));
in
		check_is_z_conv_result "z_tuple_lang_intro_conv"
		(eq_trans_rule s0 cthm
		handle complaint =>
		divert complaint "eq_trans_rule" "z_tuple_lang_intro_conv" 42005
			[fn () => string_of_term tm])
end);
=TEX
=IGN
z_tuple_lang_intro_conv ⓩ((1,2,3).1,(1,2,3).2,(1,2,3).3)⌝;
=SML
val ⦏z_sel⋎t_intro_conv⦎ : CONV = (fn tm =>
let	val eg_tm = (mk_z_tuple o map (curry mk_var "x") o
			dest_z_tuple_type o type_of) tm
		handle (Fail _) =>
		term_fail "z_sel⋎t_intro_conv" 42004 [tm];
	val spec = all_∀_elim (∀_elim tm (tuple_gen_semantic_const eg_tm));
	val cthm = eq_sym_rule(hd(rev(strip_∧_rule spec)));
in
		check_is_z_conv_result "z_sel⋎t_intro_conv"
		(eq_trans_rule (refl_conv tm) cthm
		handle complaint =>
		divert complaint "eq_trans_rule" "z_tuple_lang_intro_conv" 42004
			[fn () => string_of_term tm])
end);
=TEX
=IGN
z_sel⋎t_intro_conv ⓩ(1,2,3)⌝;
=TEX

\section{CARTESIAN PRODUCTS}

=SML
local
	fun aux count 0 avoid = []
	| aux count n avoid =
=SMLLITERAL
		if ("t⋎" ^ string_of_int count) mem avoid
		then aux (count + 1) n avoid
		else ("t⋎" ^ string_of_int count) :: aux (count + 1) (n-1) avoid;
=SML
	val t_∧_thm = taut_rule ⌜∀ x ⦁ T ∧ x ⇔ x⌝;
	val cnv1 :CONV = simple_eq_match_conv1
	(conv_rule z_∀_elim_conv1 z_sets_ext_thm);

in
=TEX
=SML
val ⦏z_×_conv⦎ : CONV = (fn tm =>
let	val si = dest_z_× tm
		handle complaint =>
		pass_on complaint "dest_z_×" "z_×_conv";
	val spec = list_∀_elim si (×_gen_semantic_const tm);
	val tis = aux 1 (length si) (map fst(term_vars tm));
	val elem_tys = map (fn x => hd(snd(dest_ctype(type_of x)))) si;
	val ti = map mk_var (combine tis elem_tys);
	val ti_decs = map (fn (x,y) => mk_z_dec([x],y)) (combine ti si);
	val res = mk_z_seta(mk_z_decl ti_decs,
		mk_t,
		mk_z_tuple ti);
	val _ = seta_gen_semantic_const res;
=TEX
=SML
	val ciz = set_check_is_z false;
	val s1 = tac_proof(([],mk_z_eq(tm,res)),
		conv_tac(cnv1 THEN_C z_∀_elim_conv1) THEN
		simple_∀_tac THEN
		(fn (asms,conc) => let	 val t = fst(dest_z_∈(snd(dest_z_⇔ conc)))
			val lthm = z_sel⋎t_intro_conv t;
		in
		conv_tac(APP_C(RAND_C(LEFT_C(fn _ => lthm)),
			LEFT_C(fn _ => lthm))) (asms,conc)
		end)
		THEN conv_tac (APP_C(RAND_C
			(RIGHT_C (fn _ => spec) THEN_C
			∈_comp_conv),
			z_∈_seta_conv))
		THEN conv_tac (APP_C(RAND_C
			(∧_C(LEFT_C z_sel⋎t_lang_conv)),
			z_∃_elim_conv2 THEN_C
			ALL_SIMPLE_∃_C
			(LEFT_C z_decl_pred_conv THEN_C
			RIGHT_C(
			simple_eq_match_conv1 t_∧_thm THEN_C
			 z_tuple_lang_eq_conv) )
			THEN_C basic_prove_∃_conv))
	THEN taut_tac);
	val _ = set_check_is_z ciz;
in
	check_is_z_conv_result "z_×_conv" s1
end)
end;
=IGN
z_×_conv ⓩX × Y × ℙ Y⌝;
=SML
val ⦏z_∈_×_conv⦎ : CONV = (fn tm =>
let	val (t,ct) = dest_z_∈ tm
		handle (Fail _) =>
		term_fail  "z_∈_×_conv" 42007 [tm];
	val si = dest_z_× ct
		handle (Fail _) =>
		term_fail  "z_∈_×_conv" 42007 [tm];
	val spec = list_∀_elim si (×_gen_semantic_const ct);
	val s1 = (RIGHT_C(fn _ => spec) THEN_C ∈_comp_conv) tm;
	val s2 = conv_rule(RIGHT_C (∧_C
		(TRY_C(LEFT_C z_sel⋎t_lang_conv)))) s1;
in
	check_is_z_conv_result "z_∈_×_conv"
	(eq_trans_rule (refl_conv tm) s2)
end);
=IGN
z_∈_×_conv ⓩ(1,2,3) ∈  X × X × X⌝;
z_∈_×_conv ⓩx ∈  X × X × X⌝;
=TEX
\subsection{Out of Place}
The following is necessary for $z\_sets\_ext\_conv$,
but is out of its proper section.
=SML
val ⦏z_bindingd_intro_conv⦎ : CONV = (fn tm =>
let	val eg_tm = (mk_z_binding o
		map (Combinators.I ** curry mk_var "x") o
		dest_z_schema_type o type_of) tm
		handle (Fail _) =>
		term_fail "z_bindingd_intro_conv" 42017 [tm];
	val spec = all_∀_elim (∀_elim tm (binding_gen_semantic_const eg_tm));
	val cthm = eq_sym_rule(hd(rev(strip_∧_rule spec)));
in
		check_is_z_conv_result "z_bindingd_intro_conv"
		(eq_trans_rule (refl_conv tm) cthm
		handle complaint =>
		divert complaint "eq_trans_rule" "z_bindingd_intro_conv" 42004
			[fn () => string_of_term tm])
end);
=IGN
z_bindingd_intro_conv ⓩ(x ≜ 1, y ≜ 2)⌝;
=TEX

\subsection{Extensionality of Sets II}
=TEX
The following returns four ``bits'' derived from a type
that may have nested bindings or tuples at the outer level,
and a term which is a source of variable names to avoid.
Returned is a theorem that explodes a variable $x$
into a construct formed by selecting from $x$,
a construct of the form as the RHS of the above, but formed from
$x1$, $x2$, ...,
the $x_i$ as a list,
and $x$ itself.
=SML
local
	val ordx = ord"x";
	fun xnames (nm,ty) = (if (ord nm = ordx) handle Ord => true
		then nm
		else fail "" 0 []);
	fun give_n_names nn lst = (
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

	fun explode_tm (tm : TERM) : THM = (
		(case dest_z_type (type_of tm) of
		ZSchemaType _ => z_bindingd_intro_conv THEN_C (RANDS_C explode_tm)
		| ZTupleType _ => z_sel⋎t_intro_conv THEN_C (RANDS_C explode_tm)
		| _ => refl_conv)
		tm
	);

	fun exploded_bits tm = (
		(case dest_z_term1 tm of (* was dest_z_term KB *)
		ZTuple bits => flat(map exploded_bits bits)
		| ZBinding bits1 => flat (map (exploded_bits o snd) bits1)
		| _ => [tm]) handle Fail _ => [tm]
	);
	val Ua = ⓩ𝕌⌝;
	fun uf ty = inst [] [(ty, ⓣ'a⌝)] Ua;

in
fun ⦏give_new_bits⦎ (ty:TYPE) (tm:TERM) = (
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
end;
=TEX
val tm = ⓩ{1,2,3} = {3,2,1}⌝;
=SML
local
	val sets_ext_thm = pc_rule1 "'sets_ext" rewrite_conv[] ⌜p:'a SET = q⌝;
	val sym_sets_ext_thm = all_∀_intro(eq_sym_rule sets_ext_thm);
	fun lmatch_order (to_order : TERM list) (orig_order : TERM list)
		(new_order : TERM list) (trm : TERM) = (
	let	fun aux (to_x :: to_rest : TERM list)
			(o_x :: o_rest : TERM list)
			(tm : TERM)
			(x : TERM) = (
			if (x =$ o_x)
			then to_x
			else aux to_rest o_rest tm x
		) | aux _ _ tm _ = fail "z_sets_ext_conv" 42010 [fn () => string_of_term tm];
	in
		map (aux to_order orig_order trm) new_order
	end);
=TEX
=SML
in
val ⦏z_sets_ext_conv⦎ : CONV = (fn tm =>
let	val (v,w) = dest_z_eq tm
		handle complaint =>
		divert complaint "dest_z_eq" "z_sets_ext_conv"
			42010 [fn () => string_of_term tm];
	val vty = type_of v;
	val elem_ty = case dest_ctype vty of
		("SET",[elem_ty]) => elem_ty
		| _ => term_fail "z_sets_ext_conv" 42010 [tm];
	val (explode_x_thm, construct, xs, explode_bits_x, x) =
		give_new_bits elem_ty tm;
	val s1 = asm_rule tm;
	val s2 = app_fun_rule
		(mk_app( (mk_const("∈",
			mk_→_type(elem_ty,
			mk_→_type(vty,BOOL)))),
			construct))
		s1;
	val s3 = z_∀_intro xs s2;
	val s4 = asm_rule (concl s3);
	val s6 = conv_rule z_∀_elim_conv1 s4;
		(* note that the above may put simple ∀ list in different order *)
	val ordered_explode_bits_x = lmatch_order explode_bits_x xs
		(fst(strip_∀ (concl s6))) tm;
	val s7 = list_∀_elim ordered_explode_bits_x s6;
	val s8 = conv_rule(RANDS_C (LEFT_C (fn _ => eq_sym_rule explode_x_thm))) s7;
	val s9 = simple_∀_intro x s8;
	val s10 = list_∀_elim[v,w] sym_sets_ext_thm;
	val s11 = ⇔_mp_rule s10 s9;
	val s12 = ⇔_intro (all_⇒_intro s3) (all_⇒_intro s11);	
	val res = eq_trans_rule (refl_conv tm) s12;
=TEX
=SML
in
	check_is_z_conv_result "z_sets_ext_conv" res
end);
end;
=IGN
z_sets_ext_conv ⓩ{1,2,3} = {3,2,1}⌝;
z_sets_ext_conv ⓩ{(1,2),(2,3)} = {(2,3),(1,2)}⌝;
z_sets_ext_conv ⓩ{(1,p,2,x2,x),(2,q,3,x2,x)} = {(2,q,3,x2,x),(1,p,2,x2,x)}⌝;
=TEX
=SML
local
	val cnv1 = simple_eq_match_conv1 (conv_rule z_∀_elim_conv1 z_∈_ℙ_thm1);
	fun cnv2 nm = cnv1 THEN_C
			z_∀_elim_conv2 THEN_C
			RAND_C(simple_α_conv nm) THEN_C
			z_∀_intro_conv1;
	val thm1 = taut_rule ⌜∀ x y ⦁ x ⇒ ((y ∧ T) ⇒ x)⌝;
	val thm2 = prove_rule[] ⌜∀ x y ⦁ x ⇒ ((y ∈ ⓩ𝕌⌝ ∧ T) ⇒ x)⌝;
=TEX
=SML
in
val ⦏z_∈_ℙ_conv⦎ : CONV = (fn tm =>
let	val (v,pw) = dest_z_∈ tm
		handle complaint =>
		divert complaint "dest_z_∈" "z_∈_ℙ_conv"
			42016 [fn () => string_of_term tm];
	val w = dest_z_ℙ pw
		handle complaint =>
		divert complaint "dest_z_ℙ" "z_∈_ℙ_conv"
			42016 [fn () => string_of_term tm];
	val wty = type_of w;
	val elem_ty = case dest_ctype wty of
		("SET",[elem_ty]) => elem_ty
		| _ => term_fail "z_∈_ℙ_conv" 42010 [tm];
	val s1 = cnv1 tm;
	val tm' = snd(dest_eq(concl s1));
	val (explode_x_thm, construct, xs, explode_bits_x, x) =
		give_new_bits elem_ty tm';
	val s2 = asm_rule tm';
	val s3 = simple_∀_elim construct(
			conv_rule z_∀_elim_conv1 s2);
	val s4 = z_∀_intro xs (⇒_intro mk_t s3);
	val s5 = asm_rule (concl s4);
	val s6 = conv_rule z_∀_elim_conv1 s5;
	val s7 = list_∀_elim explode_bits_x s6;
	val s8 = conv_rule(RANDS_C (LEFT_C (fn _ => eq_sym_rule explode_x_thm))) s7;
	val s9 = z_∀_intro [x] (⇒_intro mk_t s8);
	val s10 = ⇔_intro (all_⇒_intro s4) (all_⇒_intro s9);
	val s11 = eq_trans_rule s1 s10;
in
	check_is_z_conv_result "z_∈_ℙ_conv" s11
end);
end;
=IGN
z_∈_ℙ_conv ⓩp ∈ ℙ q⌝;
z_∈_ℙ_conv ⓩp ∈ ℙ (x × y)⌝;
z_∈_ℙ_conv ⓩp ∈ ℙ (ℙ u)⌝;
z_∈_ℙ_conv ⓩp ∈ ℙ [a : (X × Y);b:X]⌝;

=TEX
=SML
local
	val thm1 = (set_goal([],⌜∀ x y⦁ ⓩx ∈ ℙ y ⇔ x ⊆ y⌝⌝);
		a(REPEAT ∀_tac THEN
			conv_tac(ONCE_MAP_C z_∈_ℙ_conv) THEN
			rewrite_tac[get_spec ⌜$"z'_ ⊆ _"⌝,
		get_spec ⌜$"Z'T[1]1"⌝, get_spec ⌜$"Z'T[2]1"⌝]);
		a(PC_T1 "hol1" rewrite_tac[]);
		a(conv_tac(ONCE_MAP_C z_sel⋎t_lang_conv));
		a(rewrite_tac[]);
		a(prove_tac[]);
		pop_thm());
	val cnv1 = simple_eq_match_conv1 thm1;
in
val ⦏z_setd_∈_ℙ_conv⦎ : CONV = (fn tm =>
let	val s1 = (cnv1 THEN_C z_setd_⊆_conv) tm
		handle (Fail _) =>
		term_fail "z_setd_∈_ℙ_conv" 42019 [tm];
in
	check_is_z_conv_result "z_setd_∈_ℙ_conv" s1
end);
end;
=TEX
\section{BINDINGS}
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
=SML
val ⦏z_binding_eq_conv⦎ : CONV = (fn tm => (
let	val (b1,b2) = dest_z_eq tm;
	val aconst = const_of_binding_type (type_of b1);
	val spec = binding_gen_semantic_const aconst
		handle (Fail _) =>
		( diag_string "binding_gen_semantic_const fail - z_binding_eq_conv";
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
	val s6 = conv_rule(
		LEFT_RIGHT_C (fn _ => ∀_elim b1 s5, fn _ => ∀_elim b2 s5)) s4;
	val s7 = ⇔_intro (all_⇒_intro s2) (all_⇒_intro s6);
in
	check_is_z_conv_result "z_binding_eq_conv"
	(eq_trans_rule (refl_conv tm) s7)
end)
handle complaint =>
list_divert complaint "z_binding_eq_conv"
	[("const_of_binding_type", 42013, [fn () => string_of_term tm]),
	("dest_z_eq", 42013, [fn () => string_of_term tm]),
	("get_spec", 42013, [fn () => string_of_term tm]),
	("eq_trans_rule", 43000, [fn () => string_of_term tm])])
;
=IGN
z_binding_eq_conv ⓩθ S = (x ≜ y)⌝;
=TEX
=SML
val ⦏z_binding_eq_conv1⦎ : CONV = (fn tm => (
let	val (b1,b2) = dest_z_eq tm;
	val aconst = const_of_binding_type (type_of b1);
	val spec = binding_gen_semantic_const aconst
		handle (Fail _) =>
		(diag_string "binding_gen_semantic_const fail - z_binding_eq_conv1";
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
	val s6 = conv_rule(
		LEFT_RIGHT_C (fn _ => ∀_elim b1 s5, fn _ => ∀_elim b2 s5)) s4;
	val s7 = ⇔_intro (all_⇒_intro s2) (all_⇒_intro s6);
in
(check_is_z_conv_result "z_binding_eq_conv1"
(case (is_z_binding b1, is_z_binding b2) of
(false, false) => (eq_trans_rule (refl_conv tm) s7)
| (true, false) => (
let	val b1args = map snd(dest_z_binding b1);
	val proj_thms = rev(tl(rev
		(strip_∧_rule(list_∀_elim (b1 :: b1args)(inst_type_rule ty_insts spec)))));
	val s8 = case map (fn thm => LEFT_C (fn _ => thm)) proj_thms of
		[]	=> s7
	|	convs	=> conv_rule (RIGHT_C(LIST_OP_C convs)) s7;
in
	(eq_trans_rule (refl_conv tm) s8)
end)
| (false, true) => (
let	val b2args = map snd(dest_z_binding b2);
	val proj_thms = rev(tl(rev
		(strip_∧_rule(list_∀_elim (b2 :: b2args)(inst_type_rule ty_insts spec)))));
	val s8 = case map (fn thm => RIGHT_C (fn _ => thm)) proj_thms of
		[]	=> s7
	|	convs	=> conv_rule (RIGHT_C(LIST_OP_C convs)) s7;
in
	(eq_trans_rule (refl_conv tm) s8)
end)
| (true, true) => (
let	val spec' = inst_type_rule ty_insts spec;
	val b1args = map snd(dest_z_binding b1);
	val proj_thms1 = rev(tl(rev
		(strip_∧_rule(list_∀_elim (b1 :: b1args) spec'))));
	val b2args = map snd(dest_z_binding b2);
	val proj_thms2 = rev(tl(rev
		(strip_∧_rule(list_∀_elim (b2 :: b2args) spec'))));
	val s8 = case
		map (fn (thm1, thm2) => LEFT_RIGHT_C (fn _ => thm1, fn _ => thm2))
			(combine proj_thms1 proj_thms2)
	of
		[]	=> s7
	|	convs	=> conv_rule (RIGHT_C(LIST_OP_C convs)) s7;
in
	(eq_trans_rule (refl_conv tm) s8)
end)
))
end
)
handle complaint =>
list_divert complaint "z_binding_eq_conv1"
	[("dest_z_eq", 42013, [fn () => string_of_term tm]),
	("get_spec", 42013, [fn () => string_of_term tm]),
	("const_of_binding_type", 42013, [fn () => string_of_term tm]),
	("eq_trans_rule", 43000, [fn () => string_of_term tm])])
;
=IGN
z_binding_eq_conv1 ⓩ(x ≜ 1, y ≜ 2, z ≜ 3) = (y ≜ 2, x ≜ 1, z ≜ 3)⌝;
=TEX
=SML
local
val z_empty_schema_type = mk_z_schema_type [];
in
val ⦏z_binding_eq_conv2⦎ : CONV = (fn tm => (
let	val (b1,b2) = dest_z_eq tm;
	val (b1args, b2args) = (case (dest_z_term b1, dest_z_term b2) of
		(ZBinding xs, ZBinding ys)	=> (map snd xs, map snd ys)
	|	_				=> fail "" 0 [])
			handle Fail _ => (
				if type_of b1 = z_empty_schema_type
				then ([], [])
				else term_fail "z_binding_eq_conv2" 42021 [tm]
			);
	val aconst = const_of_binding_type (type_of b1);
	val spec = binding_gen_semantic_const aconst
		handle (Fail _) =>
		( diag_string "binding_gen_semantic_const fail - z_binding_eq_conv2";
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
	val s6 = conv_rule(
		LEFT_RIGHT_C (fn _ => ∀_elim b1 s5, fn _ => ∀_elim b2 s5)) s4;
	val s7 = ⇔_intro (all_⇒_intro s2) (all_⇒_intro s6);
	val spec' = inst_type_rule ty_insts spec;
	val proj_thms1 = rev(tl(rev(strip_∧_rule(list_∀_elim (b1 :: b1args) spec'))));
	val proj_thms2 = rev(tl(rev(strip_∧_rule(list_∀_elim (b2 :: b2args) spec'))));
	val s8 = case
		map (fn (thm1,thm2) => LEFT_RIGHT_C (fn _ => thm1, fn _ => thm2))
			(combine proj_thms1 proj_thms2)
	of
		[]	=> s7
	|	convs	=> conv_rule (RIGHT_C(LIST_OP_C convs)) s7;
in
	check_is_z_conv_result "z_binding_eq_conv2"
	(eq_trans_rule (refl_conv tm) s8)
end)
handle complaint =>
list_divert complaint "z_binding_eq_conv2"
	[("const_of_binding_type", 42021, [fn () => string_of_term tm]),
	("dest_z_eq", 42021, [fn () => string_of_term tm]),
	("get_spec", 42021, [fn () => string_of_term tm]),
	("eq_trans_rule", 43000, [fn () => string_of_term tm])])
;
end (* of local ... in ... *);
=IGN
z_binding_eq_conv2 ⓩ(x ≜ z,x1 ≜ z1) = (x ≜ y,x1 ≜ y1)⌝;
z_binding_eq_conv2 ⓩx ⦂ [] = y⌝;
=TEX
=SML
val  ⦏z_sel⋎s_conv⦎ : CONV = (fn tm => (
let	val (b,s) = dest_z_sel⋎s tm;
	val bits = dest_z_binding b;
	val spec = binding_gen_semantic_const b
		handle (Fail _) =>
		(diag_string "binding_gen_semantic_const fail - z_sel⋎s_conv";
		get_spec b);
	val cmps = tl(fst(strip_simple_∀(concl spec)));
	val thm1 = all_simple_∀_elim spec;
	fun get_conjunct th = (
		let	val (_, ths) =
				dest_z_sel⋎s(fst(dest_eq(fst(dest_∧(concl th)))));
		in	if ths = s
			then ∧_left_elim th
			else get_conjunct (∧_right_elim th)
		end
	);
	val thm2 = get_conjunct thm1
		handle Fail _ => term_fail "z_sel⋎s_conv" 43000 [];
	val cmpvals = map snd bits;
	val cmpvaltys = map type_of cmpvals
	val tym = combine cmpvaltys (map type_of cmps);
	val instcmps = map mk_var (combine (map (fst o dest_var) cmps) cmpvaltys);
	val tmm = combine cmpvals instcmps;
in
	check_is_z_conv_result "z_sel⋎s_conv"
	(eq_trans_rule (refl_conv tm)
	(inst_term_rule tmm (inst_type_rule tym thm2)))
end
)
handle complaint =>
list_divert complaint "z_sel⋎s_conv"
	[("dest_z_sel⋎s", 42014, [fn () => string_of_term tm]),
	("dest_z_binding", 42014, [fn () => string_of_term tm]),
	("get_spec", 42014, [fn () => string_of_term tm]),
	("eq_trans_rule", 43000, [fn () => string_of_term tm])]
);
=IGN
z_sel⋎s_conv ⓩ(x ≜ 1, y ≜ 2, z ≜ 3).y⌝;
=TEX
=SML
val ⦏z_bindingd_elim_conv⦎ : CONV = (fn tm =>
let	val xi = dest_z_binding tm
		handle (Fail _) =>
		term_fail "z_bindingd_elim_conv" 42018 [tm];
	val bind= fst(dest_z_sel⋎s(snd(hd xi)))
		handle (Fail _) =>
		term_fail "z_bindingd_elim_conv" 42018 [tm];
	val rspec = binding_gen_semantic_const tm;
	val spec = all_∀_elim (∀_elim bind rspec)
		handle (Fail _) =>
		term_fail "z_bindingd_elim_conv" 42018 [tm];
	val cthm = hd(rev(strip_∧_rule spec));
in
		check_is_z_conv_result "z_bindingd_elim_conv"
		(eq_trans_rule (refl_conv tm) cthm
		handle complaint =>
		divert complaint "eq_trans_rule" "z_bindingd_elim_conv" 42018
			[fn () => string_of_term tm])
end);
=IGN
z_bindingd_elim_conv ⓩ(x ≜ ⌜b:(ℤ, ℤ) $"Z'S[x,y]"⌝.x, y ≜ b.y)⌝;
z_bindingd_elim_conv ⓩ(x ≜ ⌜b:(ℤ, ℤ) $"Z'S[x,y]"⌝.x, y ≜ c)⌝; (* fails *)
=TEX

\section{SET ABSTRACTIONS REVISITED}
=SML
local
	val cnv1 = ALL_SIMPLE_∃_C (∧_C (TRY_C z_∈_u_conv));
	val cnv2 = pure_rewrite_conv[
		pc_rule1 "hol1" prove_rule[]⌜∀ t ⦁ (∃ x ⦁ t) ⇔ t⌝,
		taut_rule ⌜∀ x ⦁ x ∧ T ⇔ x⌝,
		taut_rule ⌜∀ x ⦁ T ∧ x ⇔ x⌝];
	val cnv3 = ALL_SIMPLE_∃_C (ALL_∧_C z_schema_pred_conv1);

	val z_tuple_eq_conv =
		(RIGHT_C (COND_C is_z_tuple id_conv z_sel⋎t_intro_conv)) THEN_C
			z_tuple_lang_eq_conv;
	val check_eqs_c = (
			COND_C (switch any is_var o map (fst o dest_eq) o strip_∧)
				id_conv fail_conv
		ORELSE_C
			COND_C is_t id_conv fail_conv
	);
	val cnv4 = TRY_C z_tuple_eq_conv
		THEN_C
			ALL_∧_C (TRY_C(LEFT_C (simple_eq_match_conv1 z'θ_def)
					AND_OR_C (z_binding_eq_conv1
							THEN_C check_eqs_c)));
in
val ⦏z_∈_seta_conv1⦎ : CONV = (fn tm =>
let	val ciz = set_check_is_z false;
	val s1 = z_∈_seta_conv tm
		handle complaint =>
		pass_on complaint "z_∈_seta_conv" "z_∈_seta_conv1";
	val rhs = snd(dest_eq(concl s1));
	val (d,p,v_eq_t) = dest_z_∃ rhs;
	val (v,t) = dest_eq v_eq_t;
	val res =
	if	(case dest_z_term v of
			ZTuple _	=> false
		|	ZBinding _	=> false
		|	Zθ _		=> false
		|	ZLVar _		=> false
		|	_		=> true)
			handle Fail _ => true
	then	s1
	else	let	val s2 = (z_∃_elim_conv THEN_TRY_C
				ALL_SIMPLE_∃_C (RIGHT_C (RIGHT_C cnv4))) rhs;
			val s3 = conv_rule (RIGHT_C(TRY_C cnv1 THEN_TRY_C cnv2
				THEN_C REPEAT_C (LAST_SIMPLE_∃_C simple_∃_equation_conv)
				THEN_TRY_C cnv3)) s2;
			val s4 = eq_trans_rule s1 s3;
		in
			if is_∃(snd(dest_eq(concl s4))) then s1 else s4
		end	handle Fail _ => s1;
	val _ = set_check_is_z ciz;
in
	check_is_z_conv_result "z_∈_seta_conv1" res
end);
end;
=IGN
let	val s = ⓩ{x,y : X; p:Y; [z :𝕌]}⌝
in
z_∈_seta_conv1 ⓩt ∈ ⓜs⌝⌝
end;
z_∈_seta_conv1 ⓩp ∈ {x:X⦁(x,x)}⌝;
z_∈_seta_conv1 ⓩp ∈ {x:X}⌝;
z_∈_seta_conv1 ⓩ(1,2) ∈ {x:X;y:Y⦁(x,y)}⌝;
z_∈_seta_conv1 ⓩt ∈ {x:X;y:Y⦁(x,y)}⌝;
z_∈_seta_conv1 ⓩt ∈ {x,y:X;z:Y⦁(z,x,y)}⌝;
=TEX
\section{MISCELLANEOUS}
=SML
local
	val taut_thm = all_∀_intro
		(taut_rule⌜((a ⇒ b) ∧ ((b ∧ T) ⇒ ( a ⇔ c ))) = (a ⇔ (b ∧ c))⌝);
	val c1 = simple_eq_match_conv1 (conv_rule z_∀_elim_conv1 z_∈_ℙ_thm1);
	val c2 = simple_eq_match_conv1 taut_thm;
in
fun  ⦏z_defn_simp_rule⦎ (ithm : THM) : THM = ((
let	val qthm = conv_rule (TRY_C z_para_pred_conv) ithm;
	val (vs,_) = strip_simple_∀(concl qthm);
	val thm = all_∀_elim qthm;
	val tm = concl thm;
	val (tm1,tm2) = dest_∧ tm;
	val thm1 = conv_rule
		(c1 THEN_C z_∀_elim_conv1)
		(∧_left_elim thm);
	val thm2 = ∧_right_elim thm;
	val (d,p,v) = dest_z_∀(concl thm2);
	val dvar = hd(fst(dest_z_dec(hd(dest_z_decl d))));
	val thm'' = ∧_intro(∀_elim dvar thm1)
			(z_∀_elim dvar thm2);
in
	check_is_z_thm "z_defn_simp_rule"
	(list_simple_∀_intro vs
	(z_∀_intro [dvar] (conv_rule c2 thm'')))
end)
handle complaint =>
list_divert complaint "z_defn_simp_rule"
	[("dest_∧", 42011, [fn () => string_of_thm ithm]),
	("simple_eq_match_conv1", 42011, [fn () => string_of_thm ithm]),
	("dest_z_decl", 42011, [fn () => string_of_thm ithm]),
	("dest_z_dec", 42011, [fn () => string_of_thm ithm]),
	("z_∀_elim", 42011, [fn () => string_of_thm ithm])]);
end;
=TEX
=IGN
z_defn_simp_rule
	(asm_rule ⌜Z'AbbDef ⓩp ∈ ℙ(X × Y) ∧ (∀ q : X × Y ⦁ q ∈ p ⇔ first q = q.1)⌝⌝);
z_defn_simp_rule
	(conv_rule
	(RAND_C(LEFT_C (Z_DECL_INTRO_C z_pred_dec_conv)))
(asm_rule ⌜Z'AbbDef ⓩp ∈ ℙ(X × Y) ∧ (∀ q : X × Y ⦁ q ∈ p
	⇔ first q = q.1)⌝⌝));
=TEX
\subsection{Sequence Displays}
=SML
local
	val cnv1 = simple_eq_match_conv1 z'⟨⟩_def;
	val cnv2 = pure_once_rewrite_conv[ z'num_list_def];
	fun cnv3 tm = (cnv2 THEN_TRY_C
		(LEFT_C((RAND_C(RIGHT_C plus_conv))
			THEN_C cnv3)
		THEN_C
		(RIGHT_C(LEFT_C(LEFT_C(RAND_C plus_conv)))))) tm;
	val cnv4 = simple_eq_match_conv1
		(eq_sym_rule(∧_left_elim z'setd_def));
	val cnv5 = simple_eq_match_conv1
		(conv_rule(ONCE_MAP_C eq_sym_conv)
		(∧_right_elim z'setd_def));
	fun cnv6 tm = ((LEFT_C (cnv6 ORELSE_C cnv4) THEN_C cnv5)
		ORELSE_C cnv4) tm;
in
val ⦏z_⟨⟩_conv⦎ :CONV = (fn tm =>
let	val s1 = (cnv1 THEN_C cnv3 THEN_C cnv6) tm;
in
	check_is_z_conv_result "z_⟨⟩_conv" s1
end);
end;
=TEX
\subsection{Conversionals}
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
let	val (x,bdy) = dest_simple_∃ tm;
	val res = var_subst [(wit,x)] bdy;
	val s1 = ALL_SIMPLE_∃_C (RIGHT_C(RIGHT_C
		(c1 ORELSE_C (LEFT_C c1 THEN_C c2)))) res;
	val new_term = snd(dest_eq(concl s1));
	val s2 = tac_proof(([],mk_eq(tm, new_term)),
		⇔_T2
		(fn thm =>
		t_tac ORELSE
		conv_tac(fn ag => eq_sym_rule s1)
		THEN
		SIMPLE_∃_THEN ante_tac thm
		THEN (
			let val x' = variant (frees(concl thm) @
				frees (concl s1)) x;
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
end);
end;
=TEX
=SML
fun ⦏∈_C⦎ (cnv:CONV) : CONV = (fn tm =>
	if is_bin_op "∈" tm
	then RAND_C cnv tm
	else term_fail "∈_C" 42028 [tm]
);
=TEX
=SML
local
	val Ua = ⓩ𝕌⌝;
	fun uf ty = inst [] [(ty, ⓣ'a⌝)] Ua;
	fun mk_u_dec tm = mk_z_dec([tm], mk_u(mk_z_power_type(type_of tm)));
	fun mk_u_decl tml = mk_z_decl(map mk_u_dec tml);
	val thm1 = prove_rule [] ⌜∀ x ⦁ (x = x) ⇔ T⌝;
	fun lmatch_order (to_order : TERM list) (orig_order : TERM list)
		(new_order : TERM list) (trm : TERM) = (
	let	fun aux (to_x :: to_rest : TERM list)
			(o_x :: o_rest : TERM list)
			(x : TERM) = (
			if (x =$ o_x)
			then to_x
			else aux to_rest o_rest x
		) | aux _ _ _ = fail "Z_∈_ELIM_C" 42027 [fn () => string_of_term trm];
	in
		map (aux to_order orig_order) new_order
	end);
=TEX
=SML
in
fun ⦏Z_∈_ELIM_C⦎  (cnv:CONV) : CONV = (fn tm =>
let	val vty = type_of tm;
	val elem_ty = case dest_ctype vty of
		("SET",[elem_ty]) => elem_ty
		| _ => term_fail "Z_∈_ELIM_C" 42027 [tm];
	val (explode_x_thm, construct, xi, explode_bits_x, x) = give_new_bits elem_ty tm;
	val tm' = mk_z_∈(construct,tm);
	val s1 = cnv tm';
	val tm_as_set = mk_z_seta(mk_u_decl xi, tm', construct);
	val s2 = tac_proof(([],mk_eq(tm,tm_as_set)),
		conv_tac z_sets_ext_conv THEN
		(fn (asm,conc) => (
		let val xi2 = map (hd o fst o dest_z_dec)
			(dest_z_decl(#1(dest_z_∀ conc)));
		in
		z_∀_tac THEN
		⇒_T (fn _ => id_tac) THEN
		conv_tac(RIGHT_C (z_∈_seta_conv THEN_C z_∃_elim_conv1)) THEN
		⇔_T2
		(fn thm =>
		(fn (asm1, conc1) =>
		let val xi3 = lmatch_order xi2 xi (fst(strip_∃ (conc1))) tm;
		in
		((MAP_EVERY simple_∃_tac xi3 THEN
			∧_tac THEN_LIST [
				accept_tac thm,
				pure_rewrite_tac [thm1]])
		 (asm1, conc1)
		)
		end))
		(fn thm =>
		(REPEAT_TTCL SIMPLE_∃_THEN) ante_tac thm
		THEN ⇒_T(fn thm' =>
		let val thma = ∧_left_elim thm';
			val thmb = ∧_right_elim thm';
		in
			conv_tac(LEFT_C(fn _ => eq_sym_rule thmb))
			THEN accept_tac thma
		end
		))
		end)(asm,conc)));
	val s3 = conv_rule(RIGHT_C(RAND_C(ALL_SIMPLE_λ_C(LEFT_C
		(simple_eq_match_conv1 s1))))) s2;
in
	eq_trans_rule (refl_conv tm) s3
end);
end;
=TEX

Now we can do:
=SML
val ⦏z_∈_λ_conv⦎ :CONV = ∈_C z_λ_conv;
val ⦏z_∈_⟨⟩_conv⦎ :CONV = ∈_C z_⟨⟩_conv;
=TEX
\subsection{Strings}
=SML
local
	val cnv1 = RATOR_C(simple_eq_match_conv1 z'string_def);
	fun cnv2 tm = (string_conv THEN_TRY_C(RIGHT_C cnv2)) tm;
in
val ⦏z_string_conv⦎ : CONV = (fn tm =>
	(cnv1 THEN_C (RAND_C cnv2)) tm
	handle (Fail _) =>
	term_fail "z_string_conv" 42015 [tm]
);
end;
val ⦏z_∈_string_conv⦎ :CONV = ∈_C z_string_conv;

=TEX

\section{PROOF CONTEXTS}
\subsection{Utilities}
=SML
fun ⦏limited_z_β_conv⦎ tm = (
let	val res = z_β_conv tm
in
	if is_nil(asms res)
	then res
	else term_fail "limited_z_β_conv" 0 [tm]
end);
=TEX
=SML
fun ⦏thms_to_eqn_cxt⦎ (thms:THM list) : EQN_CXT = (
	flat(map (cthm_eqn_cxt(current_ad_rw_canon())) thms)
);
=TEX	
\subsection{Treatment of Membership of Sets in Z Language}
In designing discrimination net indices we are careful
to use the knowledge that a tuple must have at least 2 elements.
=SML
val _ = delete_pc "'z_∈_set_lang" handle Fail _ => ();
val _ = new_pc "'z_∈_set_lang";
val _ = set_rw_eqn_cxt [(ⓩx ∈ ⌜y (λ w:'c ⦁ z):'b SET⌝⌝,z_∈_seta_conv1),
	(ⓩx ∈ ⌜Z'Seta[0] y:'a SET⌝⌝,z_∈_seta_conv1),
	(ⓩx ∈ ⌜y (Cons (p:'b) q):'b SET⌝⌝,z_∈_setd_conv),
	(ⓩx ∈ ⌜y Nil:'b SET⌝⌝,z_∈_setd_conv),
	(ⓩx ∈ ⌜y (λ p ⦁ q)⌝⌝,z_∈_λ_conv),
	(ⓩx ∈ ⌜y z⌝⌝,z_∈_⟨⟩_conv),
	(ⓩ(λ x : 𝕌 | true ⦁ y) z⌝,limited_z_β_conv)]
		"'z_∈_set_lang";
val _ = add_rw_thms [] "'z_∈_set_lang";

val pos = (thms_to_eqn_cxt [])
	@ [(ⓩx ∈ ⌜y (λ w ⦁ z):'b SET⌝⌝,z_∈_seta_conv1),
	(ⓩx ∈ ⌜y (λ p ⦁ q)⌝⌝,z_∈_λ_conv),
	(ⓩx ∈ ⌜Z'Seta[0] y:'a SET⌝⌝,z_∈_seta_conv1),
	(ⓩx ∈ ⌜y (Cons (p:'b) q):'b SET⌝⌝,z_∈_setd_conv),
	(ⓩx ∈ ⌜y z⌝⌝,z_∈_⟨⟩_conv),
	(ⓩx ∈ (λ x : 𝕌 ⦁ y) z⌝, ∈_C limited_z_β_conv),
	(ⓩx ∈ ⌜y Nil:'b SET⌝⌝,z_∈_setd_conv)];
val neg = map (mk_¬ ** RAND_C) pos;
val neither = [(ⓩ(λ x : 𝕌 ⦁ y) z⌝, limited_z_β_conv)];
val _ = set_st_eqn_cxt (pos @ neg @ neither) "'z_∈_set_lang";
val _ = set_sc_eqn_cxt (pos @ neg @ neither) "'z_∈_set_lang";
val _ = set_rw_canons [] "'z_∈_set_lang";
val _ = set_pr_tac z_basic_prove_tac "'z_∈_set_lang";
val _ = set_pr_conv z_basic_prove_conv "'z_∈_set_lang";
val _ = set_cs_∃_convs [] "'z_∈_set_lang";
val _ = set_∃_vs_thms [] "'z_∈_set_lang";
val _ = commit_pc "'z_∈_set_lang";
=TEX
\subsection{Extensionality Treatment of Sets}
=SML
val _ = delete_pc "'z_sets_ext_lang" handle Fail _ => ();
val _ = new_pc "'z_sets_ext_lang";
val _ = set_rw_eqn_cxt [
	(ⓩ⌜Z'Setd x⌝ ∈ ℙ y⌝,z_setd_∈_ℙ_conv),
	(ⓩx ∈ ℙ y⌝,z_∈_ℙ_conv),
	(ⓩx = y⌝,z_sets_ext_conv)]
	"'z_sets_ext_lang";
val _ = add_rw_thms
	[] "'z_sets_ext_lang";

val pos = [
	(ⓩx ∈ ℙ y⌝,z_∈_ℙ_conv),
	(ⓩ⌜Z'Setd x⌝ ∈ ℙ y⌝,z_setd_∈_ℙ_conv),
	(ⓩx = y⌝,z_sets_ext_conv)]
	@ thms_to_eqn_cxt [];
val neg = map (mk_¬ ** RAND_C) pos;

val _ = set_st_eqn_cxt (pos @ neg) "'z_sets_ext_lang";
val _ = set_sc_eqn_cxt (pos @ neg) "'z_sets_ext_lang";
val _ = set_rw_canons [] "'z_sets_ext_lang";
val _ = set_pr_tac z_basic_prove_tac "'z_sets_ext_lang";
val _ = set_pr_conv z_basic_prove_conv "'z_sets_ext_lang";
val _ = set_cs_∃_convs [] "'z_sets_ext_lang";
val _ = set_∃_vs_thms [] "'z_sets_ext_lang";
val _ = commit_pc "'z_sets_ext_lang";
=TEX
=SML
val _ = delete_pc "'build_z_sets";
=TEX
\subsection{Treatment of Tuples and Cartesian Products}
In designing discrimination net indexes we are careful
to use the knowledge that a tuple must have at least 2 elements.
=SML
val _ = delete_pc "'z_tuples_lang" handle Fail _ => ();
val _ = new_pc "'z_tuples_lang";
val _ = set_rw_eqn_cxt [(ⓩx ∈ ⌜y (z:'c):'b SET⌝⌝,z_∈_×_conv),
	(⌜a1 a2 a3 = b1 b2 b3⌝,z_tuple_lang_eq_conv),
	(⌜f(a1 a2 a3)⌝,z_sel⋎t_lang_conv)
	]"'z_tuples_lang";

val pos = [(⌜a1 a2 a3 = b1 b2 b3⌝,z_tuple_lang_eq_conv),
	  (ⓩx ∈ ⌜y (z:'c):'b SET⌝⌝,z_∈_×_conv),
	  (⌜f(a1 a2 a3):BOOL⌝,z_sel⋎t_lang_conv),
	  (ⓩx ∈ ⌜f(a1 a2 a3)⌝⌝,∈_C z_sel⋎t_lang_conv)
	];
val neg = map (mk_¬ ** RAND_C) pos;

val _ = set_st_eqn_cxt (pos @ neg) "'z_tuples_lang";
val _ = set_sc_eqn_cxt (pos @ neg) "'z_tuples_lang";
val _ = set_rw_canons [] "'z_tuples_lang";
val _ = set_pr_tac z_basic_prove_tac "'z_tuples_lang";
val _ = set_pr_conv z_basic_prove_conv "'z_tuples_lang";
val _ = set_cs_∃_convs [] "'z_tuples_lang";
val _ = set_∃_vs_thms [] "'z_tuples_lang";
val _ = commit_pc "'z_tuples_lang";
=TEX
\subsection{Treatment of Bindings}
=SML
val _ = delete_pc "'z_bindings" handle Fail _ => ();
val _ = new_pc "'z_bindings";
val _ = set_rw_eqn_cxt [(⌜f = g⌝,z_binding_eq_conv2),
	(⌜f(g x)⌝,z_sel⋎s_conv)
	]"'z_bindings";

val pos = [(⌜f = g⌝,z_binding_eq_conv2),
	(⌜f(g x):BOOL⌝,z_sel⋎s_conv),
	(ⓩy ∈ ⌜f(g x)⌝⌝,∈_C z_sel⋎s_conv)];
val neg = map (mk_¬ ** RAND_C) pos;

val _ = set_st_eqn_cxt (pos @ neg) "'z_bindings";
val _ = set_sc_eqn_cxt (pos @ neg) "'z_bindings";
val _ = set_rw_canons [] "'z_bindings";
val _ = set_pr_tac z_basic_prove_tac "'z_bindings";
val _ = set_pr_conv z_basic_prove_conv "'z_bindings";
val _ = set_cs_∃_convs [] "'z_bindings";
val _ = set_∃_vs_thms [] "'z_bindings";
val _ = commit_pc "'z_bindings";
=TEX
\section{FURTHER WORK}
=SML
val ⦏z_∈_app_thm⦎ = (
push_merge_pcs ["z_predicates","'z_∈_set_lang",
	"'z_sets_ext_lang"];
set_goal([],ⓩ∀ a:𝕌; x:𝕌; f: 𝕌⦁
	(∃ f_x : 𝕌 ⦁ a ∈ f_x ∧ (x, f_x) ∈ f ∧
	(∀ f_x1 :𝕌 ⦁ (x, f_x1) ∈ f ⇒ f_x1 = f_x)) ⇒ a ∈ f x⌝);
a(REPEAT strip_tac);
a(lemma_tac ⓩf_x = ⌜f⌝ ⌜x⌝⌝);
(* *** Goal "1" *** *)
a(z_app_eq_tac);
a(asm_prove_tac[]);
(* *** Goal "2" *** *)
a(asm_prove_tac[]);
pop_pc();
save_thm("z_∈_app_thm",(pop_thm())));
=TEX
=SML
val ⦏z_app_∈_thm⦎ = (
push_merge_pcs ["z_predicates","'z_∈_set_lang",
	"'z_sets_ext_lang"];
set_goal([],ⓩ∀ a:𝕌; x:𝕌; f: 𝕌⦁
	(∃ f_x : 𝕌 ⦁ f_x ∈ a ∧ (x, f_x) ∈ f ∧
	(∀ f_x1 :𝕌 ⦁ (x, f_x1) ∈ f ⇒ f_x1 = f_x)) ⇒ f x ∈ a⌝);
a(REPEAT strip_tac);
a(lemma_tac ⓩf_x = ⌜f⌝ ⌜x⌝⌝);
(* *** Goal "1" *** *)
a(z_app_eq_tac);
a(asm_prove_tac[]);
(* *** Goal "2" *** *)
a(POP_ASM_T (asm_rewrite_thm_tac o eq_sym_rule));
pop_pc();
save_thm("z_app_∈_thm",(pop_thm())));
=TEX
\section{EPILOGUE}
=SML
end; (* of structure ZExpressions *)
open ZExpressions;
=TEX
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}

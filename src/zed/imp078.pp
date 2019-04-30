=IGN
********************************************************************************
imp078.doc: this file is part of the PPZed system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% imp078.doc   ℤ $Date: 2011/07/19 12:49:36 $ $Revision: 1.29 $ $RCSfile: imp078.doc,v $
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

\def\Title{Implementation of the Z Library Set Theory}

\def\AbstractText{This document contains the implementation of the Z Library Set Theory and its proof support.}

\def\Reference{DS/FMU/IED/IMP078}

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
%% LaTeX2e port: % TQtemplate.tex
%% LaTeX2e port: \documentstyle[hol1,11pt,TQ]{article}
%% LaTeX2e port: \ftlinepenalty=9999
\def\Hide#1{}
%% LaTeX2e port: \def\Bool{``$\it{:}bool\,$''}
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{FST PROJECT}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Implementation of the Z Library Set Theory}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP078}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.29 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2011/07/19 12:49:36 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: % \TPPauthor{D.J.~King & WIN01}  %% Mandatory field
%% LaTeX2e port: \TPPauthors{D.J.~King & WIN01&WIN01\\K.~Blackburn & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document contains the implementation of
%% LaTeX2e port: the Z Library Set Theory and its proof support.}
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

\item[Issue 1.1 (1992/06/09), \FormatDate{92/03/19} ] Initial Draft.

\item [Issue 1.6 (1992/07/28) (28th July 1992)]
Bug fixing.
\item [Issue 1.7 (1992/10/15) (12th October 1992)]
Moved $⊆$ definition to \cite{DS/FMU/IED/DTD052}.
\item [Issue 1.8 (1992/10/28) (23rd October 1992)]
Change of name and nature to Z Library Set Theory.
\item [Issue 1.9 (1992/10/30), 11th November 1992]
Changes as a consequence of changes in dependences.
Added proof contexts ``z$\_$sets$\_$ext'',
``z$\_$sets$\_$alg''
and supporting material.
\item [Issue 1.11 (1992/12/03), 3rd December 1992]
Changed $U$ simplification.
\item [Issue 1.12 (1992/12/03), 3rd December 1992]
Added Π.
\item[Issue 1.13 (1992/12/11) (10th December 1992)]
Global rename from wrk038.doc issue 1.9.
\item[Issue 1.14 (1993/01/19) (19th January 1993)]
Added $z\_sets\_ext\_clauses$.
\item[Issue 1.16 (1993/02/10) (10th February 1993)]
Changes to proof contexts, etc.
\item[Issue 1.17 (1993/02/12) (16th February 1999)]
Update for SML'97.
\item[Issue 1.19 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.20 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.21 (2004/01/19)] The Z universal set is now called 𝕌.
\item[Issue 1.22 (2005/09/09)] Allowed for new forms of template and added conditional.
\item[Issues 1.23 (2005/09/10), 1.24 (2005/09/13)] Added support for conditionals.
\item[Issues 1.25 (2005/12/06)] Added symmetric difference.
\item[Issues 1.26 (2010/08/18)] Added syntax functions for subset terms.
\item[Issue 1.27 (2011/07/11)] Allowed for changes to type-checking of conditionals.
\item[Issues 1.28 (2011/07/19),1.29 (2011/07/19)] Added ≪\_≫.
\item[Issue 1.30 (2011/07/22)] Added underlining brackets operator.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported PPZed to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
None.
\section{GENERAL}
\subsection{Scope}
This document contains the implementation
of the mathematical toolkit for HOL/Z meeting the detailed design
given in \cite{DS/FMU/IED/DTD078}.
\subsection{Introduction}
\subsection{Purpose and Background}
See \cite{DS/FMU/IED/DTD078}.
\subsection{Dependencies}
The mathematical toolkit is introduced within the structure
$ZSets$ which is constrained by the signature of the same name, specified
in \cite{DS/FMU/IED/DTD078}.

\subsection{Interface}
The interface for the structure is defined by the signature $ZSets$
(see\cite{DS/FMU/IED/DTD078}).

\subsection{Possible Enhancements}
The names of some of the global variables will change once an mechanism for
introducing Z names which do not clash with existing HOL constant
names into the theory database.
For the time being, names common to the toolkit and to HOL have here been
subscripted with $L$ (for library).

\subsection{Deficiencies}
None known.

\section{THE STRUCTURE $ZSets$}

=SML
structure ⦏ZSets⦎ : ZSets = struct
=TEX
=SML
open ZGeneratedConstants;
val lthy = get_current_theory_name();
val _ = open_theory ⦏"z_sets"⦎;
val _ = push_merge_pcs ["z_predicates","'z_∈_set_lang", "'propositions", "'z_tuples_lang"];
val _ = set_flag("z_type_check_only",false);
=TEX
Get the definitions out:
=SML
	val z_→_def = get_spec ⌜$"z'_ → _"⌝;
	val z_↔_def = get_spec ⌜$"z'_ ↔ _"⌝;
	val z_≠_def = get_spec ⌜$"z'_ ≠ _"⌝;
	val z_∉_def = get_spec ⌜$"z'_ ∉ _"⌝;
	val z_∅_def = get_spec ⌜$"z'∅"⌝;
	val z_⊂_def = get_spec ⌜$"z'_ ⊂ _"⌝;
	val z_ℙ⋎1_def = get_spec ⌜$"z'ℙ⋎1 _"⌝;
	val z_∪_def = get_spec ⌜$"z'_ ∪ _"⌝;
	val z_∩_def = get_spec ⌜$"z'_ ∩ _"⌝;
	val z_setdif_def = get_spec ⌜$"z'_ ⊖ _"⌝;
	val z_⊖_def = get_spec ⌜$"z'_ \\ _"⌝;
	val z_⋃_def = get_spec ⌜$"z'⋃"⌝;
	val z_⋂_def = get_spec ⌜$"z'⋂"⌝;
	val z_first_def = get_spec ⌜$"z'first"⌝;
	val z_second_def = get_spec ⌜$"z'second"⌝;
	val z_⦂_def = get_spec ⌜$"z'_ ⦂ _"⌝;
	val z'Π_def = get_spec ⌜$"z'Π _?"⌝;
	val z'if_def = get_spec ⌜$"z'if _? then _! else _!"⌝;
	val z'guillemets_def = get_spec ⌜$"z'≪ _! ≫"⌝;
	val z'underlining_brackets_def = get_spec ⌜$"z'_ ⨽ _ ⨼ _"⌝;
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
	"'z_sets_ext_lang","'propositions", "'z_tuples_lang"];
=TEX
\section{THE IMPLEMENTATION}
\subsection{Set Theorems From the Z Mathematical Toolkit}
=SML
local
	val spec = rewrite_rule[]
		(list_∀_elim[Ua](conv_rule z_para_pred_conv z_≠_def));
in
val ⦏z_≠_thm⦎ = save_thm("z_≠_thm",
	all_z_∀_intro
	(all_∀_elim(
	(conv_rule z_∀_elim_conv1
	(nth 2 (strip_∧_rule spec))))));
val ⦏z_∉_thm⦎ = save_thm("z_∉_thm",
	(nth 3 (strip_∧_rule spec)));
end;
=TEX
=SML
local	val _ = use_ext_pc();
	val spec =
		(list_∀_elim[Ua]
		(rewrite_rule[]z_∅_def));
	val _ = pop_pc();
in
val ⦏z_∅_thm⦎ = save_thm("z_∅_thm",spec);
end;
=TEX
=SML
val ⦏z_∅_thm1⦎ = save_thm("z_∅_thm1",
	merge_pcs_rule1 ["z_predicates","'z_∈_set_lang",
		"'propositions","'z_sets_ext_lang"]
		prove_rule[z_∅_def] ⓩ∅ = {}⌝);

=TEX
=SML
local
	val spec = all_z_∀_intro
		(all_∀_elim
		(conv_rule z_para_pred_conv z_ℙ⋎1_def));
in
val ⦏z_ℙ⋎1_thm⦎ = save_thm("z_ℙ⋎1_thm",
	spec);
end;
=TEX
=SML
local
	val spec = rewrite_rule[z_sets_ext_thm]
		(list_∀_elim[Ua]
		(rewrite_rule[]z_∪_def));
	val s1 = list_∀_elim[⌜s:'a SET⌝,⌜t:'a SET⌝]
		(conv_rule z_∀_elim_conv1
		(nth 1 (strip_∧_rule spec)));
in
val ⦏z_∪_thm⦎ = save_thm("z_∪_thm",
	all_z_∀_intro(all_∀_elim(conv_rule z_∀_elim_conv1(nth 0 (strip_∧_rule s1)))));
val ⦏z_∩_thm⦎ = save_thm("z_∩_thm",
	all_z_∀_intro(all_∀_elim(conv_rule z_∀_elim_conv1	(nth 1 (strip_∧_rule s1)))));
val ⦏z_set_dif_thm⦎ = save_thm("z_set_dif_thm",
	all_z_∀_intro(all_∀_elim(conv_rule z_∀_elim_conv1	(nth 2 (strip_∧_rule s1)))));
val ⦏z_⊖_thm⦎ = save_thm("z_⊖_thm",
	all_z_∀_intro(all_∀_elim(conv_rule z_∀_elim_conv1	(nth 3 (strip_∧_rule s1)))));
end;
=TEX
=SML
local
	val spec = (rewrite_rule[]z_↔_def);
in
val ⦏local_z_↔_thm⦎ =
	all_z_∀_intro(all_∀_elim
	(inst_type_rule[(ⓣ'b⌝,ⓣ'Y⌝),(ⓣ'a⌝,ⓣ'X⌝)]spec));
end;
=TEX
=SML
val ⦏z_⊆_thm1⦎ = save_thm("z_⊆_thm1", (
set_goal([], ⌜∀ X:'a SET⦁
	ⓩ((_ ⊆ _)[X]) ∈ (ℙ X ↔ ℙ X) ∧
	(∀ S, T : ℙ X
            ⦁ ((S, T) ∈ (_ ⊆ _)[X] ⇔ (∀ x : X ⦁ x ∈ S ⇒ x ∈ T)))⌝⌝) ;
use_ext_pc();
a(rewrite_tac[z_⊆_def, local_z_↔_thm]);
a(PC_T1 "sets_ext" rewrite_tac[]);
a(prove_tac[]);
pop_pc();
pop_thm()));
=TEX
=SML
local
	val spec =
		(list_∀_elim[Ua]
		z_⊆_thm1);
	val s1 = list_∀_elim[⌜s:'a SET⌝,⌜t:'a SET⌝]
		(conv_rule z_∀_elim_conv1
		(nth 1 (strip_∧_rule spec)));
in
val ⦏z_⊆_thm⦎ = save_thm("z_⊆_thm",
	all_z_∀_intro s1);
end;
=TEX

=SML
local
	val thm1 = pc_rule1 "z_predicates" prove_rule
		[z_⊆_thm, all_∀_intro(z_∈_ℙ_conv ⓩp ∈ ℙ q⌝)]
		⌜∀ p q ⦁ ⓩp ⊆ q ⇔ p ∈ ℙ q⌝⌝;
	val cnv1 = simple_eq_match_conv1 thm1;
	val a_⊆ = ⓩ(_ ⊆ _)⌝;
in
val ⦏z_⊆_conv⦎ : CONV = (fn tm =>
let	val (vw,⊆) = dest_z_∈ tm
		handle complaint =>
		divert complaint "dest_z_∈" "z_⊆_conv"
			78001 [fn () => string_of_term tm];
	val (v,w) = case dest_z_tuple vw of
		[v,w] => (v,w)
		| _ => term_fail "z_⊆_conv" 78001 [tm];
	val side = term_match ⊆ a_⊆
		handle (Fail _) =>
		term_fail "z_⊆_conv" 78001 [tm];
	val check_is_z = set_flag("check_is_z",false);
	val s1 = (cnv1 THEN_C z_∈_ℙ_conv) tm
		handle complaint =>
		term_fail "z_⊆_conv" 78001 [tm];
	val dummy = set_flag("check_is_z",check_is_z);
	val s2 = eq_trans_rule (refl_conv tm) s1;
in
	check_is_z_conv_result "z_⊆_conv" s2
end);
end;
=IGN
z_⊆_conv ⓩp ⊆ q⌝;
z_⊆_conv ⓩp ⊆ r × s × x2⌝;
z_⊆_conv ⓩp ⊆ r × [a,b:X] × x2⌝;
=TEX
=SML
val _ = use_ext_pc();
val ⦏z_∈_ℙ_thm⦎ = save_thm ("z_∈_ℙ_thm",(
set_goal([], ⓩ∀ s:𝕌;t:𝕌 ⦁ s ∈ ℙ t ⇔ s ⊆ t⌝);
a(REPEAT_N 4 strip_tac THEN rewrite_tac[z_⊆_thm] THEN
	conv_tac(ONCE_MAP_C z_∈_ℙ_conv) THEN
	rewrite_tac[]);
pop_thm ()));

val _ = pop_pc();
=TEX

=SML
local
	val spec = rewrite_rule[]
		(list_∀_elim[Ua]
		(conv_rule z_para_pred_conv z_⊂_def));
	val s1 = list_∀_elim[⌜s:'a SET⌝,⌜t:'a SET⌝]
		(conv_rule z_∀_elim_conv1
		(nth 1 (strip_∧_rule spec)));
in
val ⦏z_⊂_thm⦎ = save_thm("z_⊂_thm",
	all_z_∀_intro s1);
end;
=TEX
=SML
local
	val spec = rewrite_rule[]
		(list_∀_elim[Ua]
		(rewrite_rule[]z_⋃_def));
	val s1 = list_∀_elim[⌜a:'a SET SET⌝]
		(conv_rule z_∀_elim_conv1
		(nth 1 (strip_∧_rule spec)));
	val s2 = rewrite_rule[z_sets_ext_thm] s1;
	val s4 = prove_rule [all_∀_intro s2] ⓩ(∀ z:𝕌; a:𝕌 ⦁
		z ∈ ⋃ a ⇔ (∃ S : 𝕌 ⦁ S ∈ a ∧ z ∈ S)) ∧
		(∀ z:𝕌; a:𝕌 ⦁
		z ∈ ⋂ a ⇔ (∀ S : 𝕌 ⦁ S ∈ a ⇒ z ∈ S))⌝;
		
in
val ⦏z_⋃_thm⦎ = save_thm("z_⋃_thm", ∧_left_elim s4);
val ⦏z_⋂_thm⦎ = save_thm("z_⋂_thm",
	inst_type_rule [(ⓣ'a⌝,ⓣ'b⌝)]
		(∧_right_elim s4));
end;
=TEX
\subsection{Tuple Theorems From the Z Mathematical Toolkit}
=SML
local
	val spec = rewrite_rule[]
		(list_∀_elim[Ua,Ub]
		(rewrite_rule[]z_first_def));
	val x = mk_var("x",type_of ⓩ(p,q)⌝);
	val s1 = rewrite_rule[]
		(conv_rule(MAP_C z_tuple_lang_intro_conv)
		(z_∀_elimⓩ(x ≜ ⓩⓜx⌝.1⌝, y ≜ ⓩⓜx⌝.2⌝)⌝
		(nth 1 (strip_∧_rule spec))));
in
val ⦏z_first_thm⦎ = save_thm("z_first_thm",
	all_z_∀_intro(∧_left_elim s1));
val ⦏z_second_thm⦎ = save_thm("z_second_thm",
	all_z_∀_intro(∧_right_elim s1));
end;
=TEX
=SML
val ⦏z_if_thm⦎ = save_thm ("z_if_thm",
	inst_type_rule[(ⓣ'a⌝, ⓣ'X⌝)]
	(∧_right_elim(z_gen_pred_u_elim
	(z_get_specⓩ(if _? then _! else _!)⌝))));
=TEX
=SML
val ⦏z_pred_if_thm⦎ =
	∧_right_elim(z_gen_pred_elim[mk_u (type_of ⓩ𝔹⌝)]
	(z_get_specⓩ(if _? then _! else _!)⌝));
=TEX
=SML
val ⦏z_guillemets_thm⦎ = save_thm ("z_guillemets_thm",
	inst_type_rule[(ⓣ'a⌝, ⓣ'X⌝)]
	(∧_right_elim(z_gen_pred_u_elim(z_get_spec ⓩ(≪ _! ≫)⌝))));
=TEX
=SML
val ⦏z_underlining_brackets_thm⦎ = save_thm ("z_underlining_brackets_thm",
	rewrite_rule[]
	(inst_type_rule[(ⓣ'a⌝, ⓣ'X⌝), (ⓣ'b⌝, ⓣ'Y⌝)]
	(∧_right_elim(z_gen_pred_u_elim(z_get_spec ⓩ(_ ⨽ _ ⨼ _)⌝)))));


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
		(conv_rule (MAP_C z_sel⋎t_lang_conv)
		(∀_elim ⓩ(p1,p2)⌝
		(all_∀_intro
		(all_∀_elim
		(conv_rule z_∀_elim_conv1 thm)))));
	val s2 = all_∀_intro
		(conv_rule (MAP_C z_sel⋎t_lang_conv)
		(∀_elim ⓩ(p1 ↦ p2)⌝ (all_∀_intro
		(all_∀_elim
		(conv_rule z_∀_elim_conv1 thm)))));
in
	list_∧_intro [thm, s1, s2]
end);
=TEX
=SML
val ⦏∈_operator_clauses⦎ = [
	z_⋃_thm, z_⋂_thm,
	z_∪_thm, z_∩_thm, z_set_dif_thm, z_⊖_thm,
	rewrite_rule[z_∈_ℙ_thm](make_∈_rule z_ℙ⋎1_thm),
	z_∅_thm, z_∈_ℙ_thm];
=TEX
=SML
fun ⦏thms_to_eqn_cxt⦎ (thms:THM list) : EQN_CXT = (
	flat(map (cthm_eqn_cxt(current_ad_rw_canon())) thms)
);
=TEX
\subsection{Treatment of Membership of Sets in Z Library}
In designing discrimination net indexes we are careful
to use the knowledge that a tuple must have at least 2 elements.
=SML
val _ = delete_pc "'z_∈_set_lib" handle Fail _ => ();
val _ = new_pc "'z_∈_set_lib";
val _ = set_rw_eqn_cxt []"'z_∈_set_lib";
val _ = add_rw_thms
	(∈_operator_clauses @ [z_∅_thm1]) "'z_∈_set_lib";

val pos = (thms_to_eqn_cxt ∈_operator_clauses)
	@ [];
val neg = map (mk_¬ ** RAND_C) pos;

val _ = set_st_eqn_cxt (pos @ neg) "'z_∈_set_lib";
val _ = set_sc_eqn_cxt (pos @ neg) "'z_∈_set_lib";
val _ = set_rw_canons [] "'z_∈_set_lib";
val _ = set_pr_tac z_basic_prove_tac "'z_∈_set_lib";
val _ = set_pr_conv z_basic_prove_conv "'z_∈_set_lib";
val _ = set_cs_∃_convs [] "'z_∈_set_lib";
val _ = set_∃_vs_thms [] "'z_∈_set_lib";
val _ = set_u_simp_eqn_cxt (u_simp_eqn_cxt [z_↔_def]) "'z_∈_set_lib";
val _ = commit_pc "'z_∈_set_lib";
=TEX
\subsection{Z Normalisation}
In designing discrimination net indexes we are careful
to use the knowledge that a tuple must have at least 2 elements.
=SML
val _ = delete_pc "'z_normal" handle Fail _ => ();
val _ = new_pc "'z_normal";
val _ = set_rw_eqn_cxt []"'z_normal";
val _ = add_rw_thms
	([z_∉_thm, z_≠_thm, z_∈_ℙ_thm, z_∅_thm1, z_if_thm]) "'z_normal";

val pos = (thms_to_eqn_cxt [z_∉_thm, z_∅_thm, z_≠_thm, z_∈_ℙ_thm, z_pred_if_thm])
	@ [];
val neg = map (mk_¬ ** RAND_C) pos;

val _ = set_st_eqn_cxt (pos @ neg) "'z_normal";
val _ = set_sc_eqn_cxt (pos @ neg) "'z_normal";
val _ = set_rw_canons [] "'z_normal";
val _ = set_pr_tac z_basic_prove_tac "'z_normal";
val _ = set_pr_conv z_basic_prove_conv "'z_normal";
val _ = set_cs_∃_convs [] "'z_normal";
val _ = set_∃_vs_thms [] "'z_normal";
val _ = commit_pc "'z_normal";
=TEX
\subsection{Extensionality Treatment of Sets}
=SML
val _ = delete_pc "'z_sets_ext_lib" handle Fail _ => ();
val _ = new_pc "'z_sets_ext_lib";
val _ = set_rw_eqn_cxt [(ⓩa ⊆ b⌝, z_⊆_conv),
		(ⓩ⌜Z'Setd a⌝ ⊆ b⌝, z_setd_⊆_conv)]
	"'z_sets_ext_lib";
val _ = add_rw_thms
	[z_⊂_thm] "'z_sets_ext_lib";

val pos = [(ⓩa ⊆ b⌝, z_⊆_conv),
		(ⓩ⌜Z'Setd a⌝ ⊆ b⌝, z_setd_⊆_conv)]
	@ thms_to_eqn_cxt [z_⊂_thm];
val neg = map (mk_¬ ** RAND_C) pos;

val _ = set_st_eqn_cxt (pos @ neg) "'z_sets_ext_lib";
val _ = set_sc_eqn_cxt (pos @ neg) "'z_sets_ext_lib";
val _ = set_rw_canons [] "'z_sets_ext_lib";
val _ = set_pr_tac z_basic_prove_tac "'z_sets_ext_lib";
val _ = set_pr_conv z_basic_prove_conv "'z_sets_ext_lib";
val _ = set_cs_∃_convs [] "'z_sets_ext_lib";
val _ = set_∃_vs_thms [] "'z_sets_ext_lib";
val _ = commit_pc "'z_sets_ext_lib";
=TEX
	
=IGN
push_merge_pcs ["z_predicates","'z_∈_set_lang","'z_normal",
	"'z_sets_ext_lang", "'z_bindings",
	"'z_∈_set_lib", "'z_sets_ext_lib"];
push_goal([],ⓩA ≠ ∅ ⇒ (⋂ A) \ S = ⋂ {T1 : A ⦁ T1 \ S}⌝);
a(REPEAT z_strip_tac);
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 1 ⌜x1'⌝);
a(z_spec_nth_asm_tac 6 ⌜T1⌝);
(* *** Goal "2" *** *)
a(z_spec_nth_asm_tac 2 ⓩS' \ S⌝);
a(z_spec_nth_asm_tac 1 ⌜S'⌝);
(* *** Goal "3" *** *)
a(z_spec_nth_asm_tac 1 ⓩx1 \ S⌝);
a(z_spec_nth_asm_tac 1 ⌜x1⌝);
pop_thm();
=TEX
\section{ALGEBRAIC TREATMENT OF SETS}
\subsection{Supporting Theorems}
=SML
val _ = push_merge_pcs ["z_predicates","'z_∈_set_lang","'z_normal",
	"'z_sets_ext_lang", "'z_bindings",
	"'z_∈_set_lib", "'z_tuples_lang","'z_sets_ext_lib"];
val ⦏z_∪_clauses⦎ = save_thm("z_∪_clauses",(
push_goal([], ⓩ
	∀ a : 𝕌 ⦁
		(a ∪ {} = a)
	∧	({} ∪ a = a)
	∧	(a ∪ 𝕌 = 𝕌)
	∧	(𝕌 ∪ a = 𝕌)
	∧	(a ∪ a = a)⌝);
a(REPEAT z_strip_tac);
pop_thm ()));
=TEX
=SML
val ⦏z_∩_clauses⦎ = save_thm("z_∩_clauses",(
push_goal([], ⓩ
	∀ a : 𝕌 ⦁
		(a ∩ {} = {})
	∧	({} ∩ a = {})
	∧	(a ∩ 𝕌 = a)
	∧	(𝕌 ∩ a = a)
	∧	(a ∩ a = a)⌝);
a(REPEAT z_strip_tac);
pop_thm ()));
=TEX
=SML
val ⦏z_set_dif_clauses⦎ = save_thm("z_set_dif_clauses",(
push_goal([], ⓩ
	∀ a : 𝕌⦁
		(a \ {} = a)
	∧	({} \ a = {})
	∧	(a \ 𝕌 = {})
	∧	(a \ a = {})⌝);
a(REPEAT z_strip_tac);
pop_thm ()));
=TEX
=SML
val ⦏z_⊖_clauses⦎ = save_thm("z_⊖_clauses",(
push_goal([], ⓩ
	∀ a : 𝕌 ⦁
		(a ⊖ {} = a)
	∧	({} ⊖ a = a)
	∧	(a ⊖ 𝕌 = 𝕌 \ a)
	∧	(𝕌 ⊖ a = 𝕌 \ a)
	∧	(a ⊖ a = {})⌝);
a(REPEAT z_strip_tac);
pop_thm ()));
=TEX
=SML
val ⦏z_⊆_clauses⦎ = save_thm("z_⊆_clauses",(
push_goal([], ⓩ
	∀ a : 𝕌 ⦁
		(a ⊆ a)
	∧	({} ⊆ a)
	∧	(a ⊆ 𝕌)⌝);
a(REPEAT z_strip_tac);
pop_thm ()));
=TEX
=SML
val ⦏z_⊂_clauses⦎ = save_thm("z_⊂_clauses",(
push_goal([], ⓩ
	∀ a : 𝕌 ⦁
		¬ (a ⊂ a)
	∧	¬ (a ⊂ {})
	∧	({} ⊂ 𝕌)⌝);
a(prove_tac[]);
pop_thm ()));
=TEX
=SML
val ⦏z_⋂_clauses⦎ = save_thm("z_⋂_clauses",(
push_goal([], ⓩ
	(⋂ {} = 𝕌)
	∧	(⋂ 𝕌 = {})⌝);
a(REPEAT z_strip_tac);
a(POP_ASM_T ante_tac THEN rewrite_tac[]);
a(strip_tac);
a(z_∃_tacⓩ{}⌝);
a(REPEAT strip_tac);
pop_thm ()));
=TEX
=SML
val ⦏z_⋃_clauses⦎ = save_thm("z_⋃_clauses",(
push_goal([], ⓩ
	(⋃ {} = {})
	∧	(⋃ 𝕌 = 𝕌)⌝);
a(REPEAT z_strip_tac);
a(z_∃_tacⓩ{x1}⌝);
a(REPEAT strip_tac);
pop_thm ()));
=TEX
=SML
val ⦏z_ℙ_clauses⦎ = save_thm("z_ℙ_clauses",(
push_goal([], ⓩ
	∀ a : 𝕌 ⦁
		(ℙ {} = {{}})
	∧	(ℙ 𝕌 = 𝕌)
	∧	a ∈ ℙ a
	∧	{} ∈ ℙ a⌝);
a(REPEAT z_strip_tac THEN asm_fc_tac[]);
pop_thm ()));
=TEX
=SML
val ⦏z_ℙ⋎1_clauses⦎ = save_thm("z_ℙ⋎1_clauses",(
push_goal([], ⓩ
	∀ a : 𝕌 ⦁
		(ℙ⋎1 {} = {})
	∧	(a ∈ ℙ⋎1 a ⇔ a ≠ {})
	∧	¬({} ∈ ℙ⋎1 a)⌝);
a(REPEAT z_strip_tac);
(* *** Goal "1" *** *)
a(asm_fc_tac[]);
(* *** Goal "2" *** *)
a(z_∃_tac ⓩx1⌝);
a(REPEAT strip_tac);
(* *** Goal "3" *** *)
a(z_∃_tac ⓩx1⌝);
a(REPEAT strip_tac);
pop_thm ()));
=TEX
=SML
val ⦏z_×_clauses⦎ = save_thm("z_×_clauses",
	prove_rule[] ⓩ
	∀ a : 𝕌 ⦁
		(a × {} = {})
	∧	({} × a = {})
	∧	(𝕌 × 𝕌 = 𝕌)⌝);
=TEX
=SML
local
	val cnv1 = pure_once_rewrite_conv [z_sets_ext_thm];
	val cnv2 = pure_rewrite_conv [taut_rule
		⌜∀ x ⦁ (x ∧ F ⇔ F) ∧
			(F ∧ x ⇔ F) ∧
			((F ⇔ F) ⇔ T)⌝];
in
val ⦏z_seta_false_conv⦎ : CONV = (fn tm =>
let	val (d,p,v) = dest_z_seta tm
			handle (Fail _) =>
			term_fail "z_seta_false_conv" 78002 [tm];
	val dummy = if p =$ mk_f
		then ()
		else term_fail "z_seta_false_conv" 78002 [tm];
	val s1 = tac_proof(([],mk_z_eq(tm,
			mk_z_setd(dest_z_power_type (type_of tm),[]))),
		conv_tac (cnv1) THEN
		z_∀_tac THEN
		⇒_T (fn _ => id_tac) THEN
		conv_tac(LEFT_C (z_∈_seta_conv THEN_C
			z_∃_inv_conv) THEN_C
		RIGHT_C z_∈_setd_conv
		THEN_C cnv2))
in
	s1
end);
end;		
=TEX	
		
\subsection{Proof Contexts}

=SML
val z_sets_alg_thms = [
	z_∪_clauses, z_∩_clauses, z_set_dif_clauses, z_⊖_clauses,
	z_⊆_clauses, z_⊂_clauses, z_⋃_clauses, z_⋂_clauses,
	z_ℙ_clauses, z_ℙ⋎1_clauses, z_×_clauses];

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

val z_sets_alg_eqn_cxt = add_∈(thms_to_eqn_cxt z_sets_alg_thms);

fun ⦏maybe_strip⦎ (index,cnv) = (
	if type_of index =: BOOL
	then (index,cnv)
	else fail "" 0 []
);

val z_sets_alg_eqn_cxt_for_strip = mapfilter maybe_strip z_sets_alg_eqn_cxt;

val _ = delete_pc "'z_sets_alg" handle Fail _ => ();
val _ = new_pc "'z_sets_alg";
val _ = set_rw_eqn_cxt ([(⌜y (λ z ⦁ w):'a SET⌝, z_seta_false_conv),
		(⌜Z'Seta[0] y:'a SET⌝, z_seta_false_conv)]
	@ z_sets_alg_eqn_cxt)
	"'z_sets_alg";
val _ = add_rw_thms [] "'z_sets_alg";

val pos = z_sets_alg_eqn_cxt_for_strip;
val neg = map (mk_¬ ** RAND_C) pos;

val _ = set_st_eqn_cxt (pos @ neg) "'z_sets_alg";
val _ = set_sc_eqn_cxt (pos @ neg) "'z_sets_alg";
val _ = set_rw_canons [] "'z_sets_alg";
val _ = set_pr_tac z_basic_prove_tac "'z_sets_alg";
val _ = set_pr_conv z_basic_prove_conv "'z_sets_alg";
val _ = set_cs_∃_convs [] "'z_sets_alg";
val _ = set_∃_vs_thms [] "'z_sets_alg";
val _ = commit_pc "'z_sets_alg";
=TEX
=SML
val _ = pop_pc();
val _ = push_merge_pcs ["z_predicates","'z_∈_set_lang",
	"'z_bindings","'z_normal",
	"'z_∈_set_lib","'z_sets_alg"];
=TEX
=SML
val ⦏z_sets_ext_clauses⦎ = save_thm("z_sets_ext_clauses",
	merge_pcs_rule1 ["z_predicates","'z_∈_set_lang",
	"'z_bindings","'z_normal",
	"'z_∈_set_lib","'z_sets_ext_lang","'z_sets_ext_lib"] prove_rule []
	ⓩ∀ s,t : 𝕌 ⦁
	((s = t) ⇔ (∀ x : 𝕌 ⦁ x ∈ s ⇔ x ∈ t))
	∧
	((s ⊆ t) ⇔ (∀ x : 𝕌 ⦁ x ∈ s ⇒ x ∈ t))
	∧
	((s ⊂ t) ⇔ ((∀ x : 𝕌 ⦁ x ∈ s ⇒ x ∈ t) ∧ (∃ y : 𝕌 ⦁ y ∈ t ∧ ¬(y ∈ s))))
	⌝);
=TEX
\section{SYNTAX FUNCTIONS}
=SML
local
	val pattern = ⓩa ⊆ s⌝;
	val gvar = #2 (dest_z_∈ pattern);
in
fun ⦏dest_z_⊆⦎ (tm : TERM) : (TERM * TERM) = (
	let	val (args, f) = dest_z_∈ tm;
		val _ = (term_match f gvar);
	in	case dest_z_tuple args of
			[a, s] => (a, s)
		|	_ => fail "" 0 []
	end	handle Fail _ =>
		term_fail "dest_z_⊆" 78006 [tm]
);
fun ⦏is_z_⊆⦎ (tm : TERM) = (
	(dest_z_⊆ tm; true) handle Fail _ => false
);
local
	val (av, sv) = dest_z_⊆ pattern;
	val av_elem_ty = dest_z_power_type (type_of av);
in
fun ⦏mk_z_⊆⦎ (a, s) =
	let
		val a_ty = type_of a;
		val a_elem_ty = dest_z_power_type a_ty
			handle Fail _ => term_fail "mk_z_⊆" 78007 [a];
		val inst1 = inst [] [(a_elem_ty, av_elem_ty)];
	in	if a_ty =: type_of s
		then	subst [(a, inst1 av), (s, inst1 sv)] (inst1 pattern)
		else	term_fail "mk_z_⊆" 78004 [a, s]
	end;
end (* of local ... in ... *);
end (* of local ... in ... *);
=TEX
=SML
local
	val pattern = ⓩ (if c then x else y) ⦂ 𝕌 ⌝;
	val cv = ⌜c : BOOL⌝;
	val xv = ⌜x ⌝;
	val yv = ⌜ y ⌝;
	val vty = type_of xv;
	val gv = fst(dest_z_app pattern);
in
fun ⦏mk_z_if⦎ (c : TERM, x : TERM, y : TERM) = (
	let	val xty = type_of x;
		val yty = type_of y;
	in	if	not(type_of c =: BOOL)
		then	term_fail "mk_z_if" 78005 [c]
		else if	not(xty =: yty)
		then	term_fail "mk_z_if" 78004 [x, y]
		else 	subst[	(c, cv),
				(x, inst[][(xty, vty)]xv),
				(y, inst[][(xty, vty)]yv)]
		(inst[][(xty, vty)] pattern)
	end
);
fun ⦏dest_z_if⦎ (tm : TERM) : (TERM * TERM * TERM) = (
	let	val (f, args) = dest_z_app tm;
		val _ = (term_match f gv);
	in	case dest_z_tuple args of
			[c, x, y] => (c, x, y)
		|	_ => fail "" 0 []
	end	handle Fail _ =>
		term_fail "dest_z_if" 78003 [tm]
);
fun ⦏is_z_if⦎ (tm : TERM) = (
	(dest_z_if tm; true) handle Fail _ => false
);
end (* local .. in .. end *);
=TEX
\section{EPILOG}
=SML
end (* of struct ZSets *);
open ZSets;
=TEX
\twocolumn[\section{INDEX}]
\small
\printindex

\end{document}

=IGN
********************************************************************************
imp041.doc: this file is part of the PPZed system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% ℤ $Date: 2011/05/05 16:12:06 $ $Revision: 1.60 $ $RCSfile: imp041.doc,v $

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

\def\Title{Implementation of the Z Language Predicates}

\def\AbstractText{This document contains the implementation of the derived rules of inference, conversions and tactics for the ProofPower Z language Predicates.}

\def\Reference{DS/FMU/IED/IMP041}

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
%% LaTeX2e port: \TPPtitle{Implementation of the Z Language Predicates}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP041}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.60 $%
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
%% LaTeX2e port: of the derived rules of inference, conversions and tactics for the ProofPower Z language Predicates.}
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
\item [Issues 1.1 (1992/07/28) - 1.6 (1992/08/18)]
First versions.
\item [Issue 1.7 (1992/08/19) (19th August 1992)]
Strengthened $β$ reduction test in rewriting,
fixed a bug introduced by parsing changes.
\item [Issue 1.8 (1992/08/20) (19th August 1992)]
Binding error fixed, improved checks of being Z.
\item [Issue 1.9 (1992/08/20) (20th August 1992)]
Bug in $full\_dest\_binding$.
\item [Issue 1.10 (1992/08/27) (26th August 1992)]
Split structure into two parts to make it compile successfully on a Sun~3.
\item [Issue 1.11 (1992/09/09) (8th September 1992)]
Minor corrections. Added $z\_∃\_intro\_conv$.
\item [Issue 1.12 (1992/09/14) (10th September 1992)]
Changes after comments.
\item [Issue 1.13 (1992/09/21),1.14 (1992/10/05) (21st September 1992)]
Modified $full\-\_dest\-\_binding$, which is now less demanding,
which ripples up to $dest\-\_z\-\_term1$.
\item [Issue 1.15 (1992/10/07) (7th October 1992)]
Proof context shuffling.
\item [Issue 1.16 (1992/10/08) (8th October 1992)]
Corrected position of $z\_∃\_elim\_conv$.
\item [Issue 1.17 (1992/10/08),1.18 (1992/10/12) (8th October 1992)]
Corrected $z\_quantifiers\_elim\_tac$.
\item [Issue 1.19 (1992/10/19) (12th October 1992)]
Changed to depends only on Z langauge.
\item [Issue 1.19 (1992/10/19) (22nd October 1992)]
Stopped Z checking in $z\_basic\_prove\_conv$ after
moved into mixed HOL/Z.
\item [Issue 1.20 (1992/10/22) (26th October 1992)]
Changes after comments - rearrangement of material
amongst 041, 042 and 043.
\item [Issue 1.22 (1992/11/12),1.23 (1992/11/13) (13th November 1992)]
Changes after comments - proof context changes,
added $z\_∀\_tac$, etc, replaced $z\_defn\_conv$ by $z\_para\_pred\_conv$, etc, added $z\_decl\_pred\_conv$.
\item [Issue 1.24 (1992/11/13) (13th Novemember 1992)]
Correcting error message numbers.
\item [Issue 1.25 (1992/11/17) (17th Novemember 1992)]
Added $z\_term\_of\_type$
\item [Issue 1.26 (1992/11/27) (17th Novemember 1992)]
Added $z\_type\_of$
Changes after comments, includes: $z\-\_pred\-\_dec\-\_conv$ checks more carefuly,
$z\_∀\_intro1(1)$ made less flexible.
\item [Issue 1.27 (1992/11/30) (27th Novemember 1992)]
Bug fixing issue 1.26.
\item [Issue 1.28 (1992/12/01) (1st December 1992)]
Changed treatment of $⊆$ in proof contexts.
\item [Issue 1.29 (1992/12/01) (1st December 1992)]
Changed treatment of ill-formed schemas as predicates in $z\-\_dec\-\_pred\-\_conv$.
\item [Issue 1.30 (1992/12/03) (2nd December 1992)]
Improved $𝕌$ simplification.
Added 3-tuples to 16-tuples to existence prover.
\item [Issue 1.31 (1992/12/04) (4th December 1992)]
Added $z\_schema\_pred\_conv1$.
\item [Issue 1.32 (1992/12/08) (8th December 1992)]
Fixed consequence of changes elsewhere.
\item[Issue 1.33 (1992/12/10) (10th December 1992)]
Global rename from wrk038.doc issue 1.9.
\item[Issue 1.34 (1992/12/18) (18th December 1992)]
Added $z\_pred\_decl\_conv$.
\item[Issue 1.35 (1993/01/15) (14th January 1993)]
Added treatment of generic predicates.
\item[Issue 1.36 (1993/01/20) (20th January 1993)]
Lost $z\_strip\_tac$.
\item[Issue 1.37 (1993/02/03) (2nd February 1993)]
Added variable elimination to proof tactics.
\item[Issue 1.38 (1993/02/05) (2nd February 1993)]
Fixed bug in $z\_basic\_prove\_conv$.
\item[Issue 1.39 (1993/02/10) (8th February 1993)]
Further checks of being in Z, changes in proof contexts.
\item[Issue 1.33 (1992/12/10) (15th February 1993)]
Added $z\_push\_consistency\_goal$.
\item[Issue 1.33 (1992/12/10)-1.41 (1995/11/16)] Maintenance.
\item[Issue 1.42 (1997/04/23)] Added $is\_z\_term1$.
\item[Issue 1.43 (1999/02/17)] Updates for SML'97.
\item[Issue 1.44 (2000/07/01)] Added
=INLINEFT
z_gen_pred_elim1
=TEX
.
\item[Issue 1.45 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.46 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.47 (2004/01/19)] The Z universal set is now called 𝕌.
\item[Issue 1.48 (2005/08/05)] Liberalised schema quantification.
\item[Issue 1.49 (2005/09/08)] Type constructors for given sets are now in Z namespace.
\item[Issue 1.50 (2005/09/09)] Allowed for let-expressions.
\item[Issue 1.51 (2005/09/10)] Added {\em z\_gen\_pred\_u\_elim}.
\item[Issue 1.52 (2005/09/11)] Enhanced {\em z\_type\_of\_term}.
\item[Issue 1.53 (2005/12/16)] Private names are now prefixed with $pp'$ rather than $icl'$.
\item[Issue 1.54 (2006/04/20)] Added support for floating point literals.
\item[Issue 1.55 (2008/10/30)] Now uses
=INLINEFT
list_simple_∃_tac
=TEX
.
\item[Issue 1.56 (2009/03/24)] Eliminated non-exhaustive match and made the
handling of tthe flag {\em check\_is\_z} more efficient.
\item[Issue 1.57 (2010/04/05)] Support for empty schemas.  Improved $z\_∈\_u\_conv$ to work for schema declarations in the declarative part of set abstractions and horizontal schemas.
\item[Issue 1.58 (2010/04/05)] Fixed $z\_∈\_u\_conv$ ($seta\_u\_conv$) to work for set abstractions with declaration variables not in Z~signature order.
\item[Issue 1.59 (2011/02/06)] Allowed for changes to forward chaining.
\item[Issue 1.60 (2011/05/05)] Allowed for extra parameter to primitive rewriting functions.
\item[Issue 1.61 (2011/08/05)] Made $z\_∀\_intro\_conv1$ and $z\_∃\_intro\_conv1$ more accommodating with terms in which bound variables have been renamed.
This is done via a forward reference to $z\_dec\_rename_s\_conv$ which is resolved once that has been defined.
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
the Z (see \cite{DS/FMU/IED/HLD015}) language predicate calculus.
This is called for in \cite{DS/FMU/IED/HLD016}.
The design is
given in \cite{DS/FMU/IED/DTD041}.
\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains an implementation for the
initial set of rules, conversions and tactics for the predicate calculus of the Z language.
\subsubsection{Dependencies}
This document takes its signature from \cite{DS/FMU/IED/DTD041}.
\subsubsection{Deficiencies}
Could give knowledge of $𝕌.lab$.

$inst$ (and perhaps others) do renaming even without a list
of type instantiations. These renamings have been prevented
when the list is empty, but not when the renamings are irrelevant to the type instantiation.
This can lead to terms outside of Z.

$CHECK\_IS\_Z\_T$ and $check\_is\_z\_conv\_result$ are not module tested.

In some cases $Z'SchemaPred$ needs to be expanded into $∈$
to maintain being within the Z language.
\subsubsection{Possible Enhancements}
None known.

\section{PREAMBLE}
=SML
structure ⦏ZPredicateCalculus⦎ :
	sig
		include ZPredicateCalculus;
		val ⦏resolve_forward_references⦎
			: {z_dec_rename⋎s_conv: CONV} -> unit;
	end = struct
=TEX
=SML
open Resolution;
open ZTypesAndTermsSupport;
open ZGeneratedConstants;
=SML
val lthy = get_current_theory_name();
val _ = open_theory "z_language";
val _ = delete_theory "z_language_ps" handle Fail _ => ();
val _ = new_theory ⦏"z_language_ps"⦎;
val _ = push_pc "hol";
val _ = set_flag("z_type_check_only",false);
val _ = push_pc "hol1";
val _ = delete_pc "'z_predicate_calculus_build" handle Fail _ => ();
val _ = new_pc "'z_predicate_calculus_build";
val _ = set_pr_tac basic_prove_tac "'z_predicate_calculus_build";
val _ = set_pr_conv basic_prove_conv "'z_predicate_calculus_build";
=TEX

\section{THE CODE}
\subsection{Forward References}
=TEX
Some of the conversion etc. are made more powerful by using tools that are not available until later in the build.
=SML
val ⦏forward_references⦎ : { z_dec_rename⋎s_conv : CONV } ref =
	ref { z_dec_rename⋎s_conv = fail_conv };
=TEX
=SML
fun ⦏resolve_forward_references⦎ (rf : { z_dec_rename⋎s_conv : CONV }) : unit = (
	forward_references := rf
);
=TEX
\subsection{Utilities}
=SML
fun ⦏list_eq⦎ (eq : 'a * 'a -> bool) (a :: x) (b :: y) =
	eq(a,b) andalso list_eq eq x y
| list_eq _ [] [] = true
| list_eq _ _ _ = false;
=TEX
=SML
fun ⦏FIRST_CHANGED_C⦎ [] = fail "" 0 []
| FIRST_CHANGED_C (a :: x) = (fn tm =>
	(CHANGED_C a tm)
	handle (Fail _) =>
	FIRST_CHANGED_C x tm
);	
=TEX
\subsubsection{Universes}
=SML
val ⦏Ua⦎ = ⓩ𝕌⌝; (* type = 'a SET *)
=TEX
\subsubsection{Inference Rules}
Swap a universally quanitifed equation around:
=SML
fun ⦏eqn_sym_rule⦎ (thm : THM) = (
let 	val (vs,bdy) = strip_∀(concl thm);
	val s1 = eq_sym_rule (list_∀_elim vs thm);
in
	list_∀_intro vs s1
end);
=TEX
Sort a list of destroyed variables, by name, returning the
sorted variables as terms.
=SML
fun ⦏var_sort⦎ (itym: (string * TYPE)list) : TERM list = (
let	val sl = idsetseq(fst(split itym));
	val vs = map (fn nm => mk_var(nm, lassoc3 itym nm)) sl;
in
	vs
end);
=TEX
=FRULE 1
∃_⇔_rule
⌜x⌝
├
Γ ⊢ s ⇔ t
├
Γ ⊢ (∃ x ⦁ s) ⇔ (∃ x ⦁ t)
=TEX
=SML
fun ⦏∃_⇔_rule⦎ x t = app_fun_rule
	(mk_const("∃",mk_→_type(mk_→_type(type_of x,BOOL),BOOL)))
	(λ_eq_rule x t);
=TEX
=SML
local
=TEX
Protected $α$ conversion:
=SML
fun prot_α_conv (nm:string) : CONV =
	simple_α_conv nm ORELSE_C (fn tm =>
	if is_simple_λ tm
	then (let	val newnm = string_variant(map (fst o dest_var) (frees tm)) nm;
	in
		simple_α_conv newnm tm
	end)
	else fail_conv tm);
in
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
end;
=TEX
The following is used to map a conversion over the elements of a HOL list display. Its behaviour is suited to the specific uses in this document.
=SML
fun ⦏LIST_C⦎ (conv : CONV) : CONV = (fn tm =>
	(COND_C	is_app
		(LEFT_C conv THEN_C RIGHT_C (LIST_C conv))
		id_conv) tm
);
=TEX
\subsubsection{Conversionals}
Apply through all $λ$'s.
=SML
fun ⦏ALL_SIMPLE_λ_C⦎ (cnv:CONV) : CONV = (fn tm =>
	(SIMPLE_λ_C (ALL_SIMPLE_λ_C cnv)
	ORELSE_C cnv) tm
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
\subsubsection{Projection Conversions}
Force the generation of semantic constants, if necessary:
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

\subsection{Recognising Z}
\subsubsection{Destroying Bindings}
Could the term in question have been formed by $mk\_binding$?
=SML
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
In the following the results are ordered by the strings.
=SML
fun ⦏dest_bind_type⦎ (ty : TYPE) : (string * TYPE) list = (
let	val (nm,tys) = dest_ctype ty;
	val fst_itym = dest_bind_tname nm;
in
	combine fst_itym tys
end);
=TEX
In the following the results are ordered by the strings.
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
=TEX
The following returns the list of original bound variables, paired
with their types, and the decoration to be applied to them.
the originally input schema cannot be recreated.

Notice the following is NOT the inverse of
=INLINEFT
mk_z_binding
=TEX
 just
=INLINEFT
mk_binding
=TEX
=SML
fun ⦏full_dest_binding⦎ (tm : TERM) : (string * TYPE)list * string = (
let	val (bcons,argl) = strip_app tm;
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
		else fail "full_dest_binding" 0 [];
in
	if list_eq (fn ((a,aty),(b,bty)) =>
		let	val (anm,ad) = unpack_ident a;
			val (bnm,bd) = unpack_ident b;
		in
		anm=bnm andalso ad = bd ^ d andalso (aty =: bty)
		end)
		args_itym b_itym
	then (b_itym, d)
	else fail "full_dest_binding" 0 []
end);
=TEX
\subsubsection{Utilities of Destruction}
The following function produces a type map from a declaration.
=SML
local
fun	f ([] :TERM list) :(string * TYPE)list = []
|	f (h::t) = (
		map dest_var (fst(dest_z_dec h))
		handle Fail _ =>
		let val (sch,d) = dest_z_schema_dec h
		in
			map 	(fn(s,ty)=>(pack_ident(s,d),ty))
				(dest_z_schema_type(dest_z_power_type(type_of sch)))
		end) @ (f t);
in
fun	⦏dest_decl⦎ (t:TERM) :(string * TYPE)list =
		f (dest_z_decl t)
	handle Fail _ => term_fail "dest_decl" 47912 [t]
end;
=TEX
=SML
fun ⦏strip_simple_λ⦎ (itm: TERM) : TERM list * TERM = (
let	fun aux acc tm = (let val (v,bdy) = dest_λ tm;
		in
		aux (v::acc) bdy
		end)
		handle (Fail _) => (rev acc, tm);
in
	aux [] itm
end);
=TEX
=SML
fun ⦏dest_schema_abs⦎ (tm : TERM) : (string * TYPE) list * TERM = (
let	val (vs,bdy) = strip_simple_λ tm;
	val itym = map dest_var vs;
	val dummy = dest_sorted_strings(map fst itym);
in
	(itym, bdy)
end);
=TEX
=SML
fun ⦏dest_g3_abs⦎ (tm : TERM)
	: TERM * TERM * TERM * TERM * (string * TYPE) list = (
let	val (itym,bdy) = dest_schema_abs tm;
	val (root,args) = strip_app bdy;
	val sg = dest_bind_cterm root;
	val to_ft1 = snd(nth 2 sg);
	val to_ft4 = snd(nth 3 sg);
in
	if to_ft4 =: type_of (nth 3 args) andalso
		to_ft1 =: type_of (nth 2 args)
	then (case args of
	[ft2,ft3,ft1,ft4] => (ft1,ft2,ft3,ft4,itym)
	| _ => fail "dest_g2_abs" 0 [])
	else fail "dest_g2_abs" 0 []
end);
=TEX
=SML
fun ⦏dest_g2_abs⦎ (tm : TERM) : TERM * TERM * TERM * (string * TYPE) list = (
let	val (itym,bdy) = dest_schema_abs tm;
	val (root,args) = strip_app bdy;
	val sg = dest_bind_cterm root;
	val to_ft4 = snd(nth 2 sg);
in
	if to_ft4 =: type_of (nth 2 args)
	then (case args of
	[ft2,ft3,ft4] => (ft2,ft3,ft4,itym)
	| _ => fail "dest_g2_abs" 0 [])
	else fail "dest_g2_abs" 0 []
end);
=TEX
=SML
fun ⦏dest_g1_abs⦎ (tm : TERM) : TERM * TERM * (string * TYPE) list = (
let	val (itym,bdy) = dest_schema_abs tm;
	val (root,args) = strip_app bdy;
	val dummy = if root =$ g1_bind_cterm
		then ()
		else fail "dest_g1_abs" 0 [];
in
	(case args of
	[ft2,ft3] => (ft2,ft3,itym)
	| _ => fail "dest_g1_abs" 0 [])
end);
=TEX
=SML
local
val rt = g2_bind_type BOOL;

fun ⦏dest_∃⋎1_bterm⦎ (tm : TERM) : TYPE list = (
let	val (bnm,bty) = dest_const tm;
	val lfid = case (dest_z_name bnm) of
		("Z'∃⋎1",[[n]],Nil) => nat_of_string n
		| _ => fail "dest_∃⋎1_bterm" 0 [];
	val (ty1,ty2) = dest_→_type bty;
	val tys = rev(strip_→_type ty1);
in
	if (ty2 =: BOOL) andalso (hd tys =: rt)
	then rev (tl tys)
	else fail "dest_∃⋎1_bterm" 0 []
end);
in
=TEX
=SML
fun ⦏full_dest_z_∃⋎1⦎
	(tm : TERM) : TERM * TERM * TERM = (
let	val (bterm1,term) = dest_app tm;
	val ity = dest_∃⋎1_bterm bterm1;
	val (d,p,v,itym) = dest_g2_abs term;
	val itym' = dest_decl d;
in
	if list_eq (op =:) ity (map snd itym) andalso
		all itym' (fn (nm,ty) => lassoc3 itym nm =: ty)
	then (d,p,v)
	else fail "full_dest_z_∃⋎1" 0 []
end);
end;
=TEX
=SML
fun ⦏dest_schema_type⦎ (ty : TYPE) : (string * TYPE) list = (
	case dest_ctype ty of
	("SET",[ty1]) => dest_bind_type ty1
	| _ => fail "dest_schema_type" 0 []
);
=TEX
\subsubsection{Top Level Destructors}
=SML
fun ⦏full_dest_z_binder2⦎ (binds:string) (bterm: TERM) (body_bterm: TERM)
	(tm : TERM) : TERM * TERM * TERM = (
let	val (bterm1,term) = dest_app tm;
	val dummy = if bterm =$ bterm1
		then ()
		else fail "full_dest_z_binder2" 0 [];
	val (vars, bdy) = strip_simple_binder binds term;
	val itym = map dest_var vars;
	val (sl,tyl) = (dest_sorted_strings ** Combinators.I)
			(split itym);
	val (body_bterm1,fts) = strip_app bdy;
	val dummy = if body_bterm1 =$ body_bterm
		then ()
		else fail "full_dest_z_binder2" 0 [];
	val (ft1,ft2,ft3) = case fts of
		[ft1,ft2,ft3] => (ft1,ft2,ft3)
		| _ => fail "full_dest_z_binder2" 0 [];
	val itym_us = dest_decl ft1;
	val dummy = if all itym_us (fn (nm,ty) =>
		lassoc3 itym nm =: ty)
		then ()
		else fail "full_dest_z_binder2" 0 [];
in
	(ft1,ft2,ft3)
end);

=TEX
=SML
fun ⦏dest_quant⋎s_bterm⦎
	(name : string) (tm : TERM)
	: (string * TYPE) list * (string * TYPE) list = (
let	val (nm,ty) = dest_const tm;
	val (fid1,fid2) = case (dest_z_name nm) of
		(cname,[a,b],Nil) => (
			if	cname = name
			then	(a,b)
			else	fail "dest_quant⋎s_bterm" 0 []
		) | _ => fail "dest_quant⋎s_bterm" 0 [];
	val fid2_diff_fid1 = fid2 diff fid1;
	val (ty1,ty2,ty3) = case strip_→_type ty of
		[t1,t2,t3] => (t1,t2,t3)
		| _ => fail "dest_quant⋎s_bterm" 0 [];
	val ty1' = rev(strip_→_type ty1);
	val ity1 = rev(tl ty1');
	val dummy = dest_sorted_strings fid1;
	val itym1 = combine fid1 ity1;
	val itym2 = dest_schema_type ty2;
	val itym2_diff_itym1 = dest_schema_type ty3;
	val dummy = if hd ty1' =: g1_bind_type andalso
		fid2 = map fst itym2 andalso
		fid2_diff_fid1 = map fst itym2_diff_itym1 andalso
		list_eq (fn ((a,b),(c,d)) => a = c andalso b =: d)
			itym2_diff_itym1 (diff' (itym2, itym1))
		then ()
		else fail "dest_quant⋎s_bterm" 0 [];
in
	(itym1, itym2)
end);
=TEX
=SML
fun ⦏full_dest_z_∃⋎s⦎ (tm : TERM) : TERM * TERM * TERM = (
let	val (∃⋎s_bterm1, g1, v) = case strip_app tm of
		(a,[b,c]) => (a,b,c)
		| _ => fail "full_dest_z_∃⋎s" 0 [];
	val (dtym, vtym) = dest_quant⋎s_bterm "Z'∃⋎s" ∃⋎s_bterm1;
	val (d,p,dtym1) = dest_g1_abs g1;
	val dtym' = dest_decl d;
	val vtym' = dest_z_schema_type(dest_z_power_type(type_of v));
in
	if list_eq (fn ((a,b),(c,d)) => a = c andalso b =: d) dtym dtym1 andalso
		all dtym' (fn (nm,ty) => lassoc3 dtym nm =: ty) andalso
		all vtym' (fn (nm,ty) => lassoc3 vtym nm =: ty)
	then (d,p,v)
	else fail "full_dest_z_∃⋎s" 0 []
end);
=TEX
=SML
=TEX
=SML
fun ⦏full_dest_z_∃⋎1⋎s⦎ (tm : TERM) : TERM * TERM * TERM = (
let	val (∃⋎1⋎s_bterm1, g1, v) = case strip_app tm of
		(a,[b,c]) => (a,b,c)
		| _ => fail "full_dest_z_∃⋎s" 0 [];
	val (dtym, vtym) = dest_quant⋎s_bterm "Z'∃⋎1⋎s" ∃⋎1⋎s_bterm1;
	val (d,p,dtym1) = dest_g1_abs g1;
	val dtym' = dest_decl d;
	val vtym' = dest_z_schema_type(dest_z_power_type(type_of v));
in
	if list_eq (fn ((a,b),(c,d)) => a = c andalso b =: d) dtym dtym1 andalso
		all dtym' (fn (nm,ty) => lassoc3 dtym nm =: ty) andalso
		all vtym' (fn (nm,ty) => lassoc3 vtym nm =: ty)
	then (d,p,v)
	else fail "full_dest_z_∃⋎1⋎s" 0 []
end);
=TEX
=SML
fun ⦏full_dest_z_∀⋎s⦎ (tm : TERM) : TERM * TERM * TERM = (
let	val (∀⋎s_bterm1, g1, v) = case strip_app tm of
		(a,[b,c]) => (a,b,c)
		| _ => fail "full_dest_z_∀⋎s" 0 [];
	val (dtym, vtym) = dest_quant⋎s_bterm "Z'∀⋎s" ∀⋎s_bterm1;
	val (d,p,dtym1) = dest_g1_abs g1;
	val dtym' = dest_decl d;
	val vtym' = dest_z_schema_type(dest_z_power_type(type_of v));
in
	if list_eq (fn ((a,b),(c,d)) => a = c andalso b =: d) dtym dtym1 andalso
		all dtym' (fn (nm,ty) => lassoc3 dtym nm =: ty) andalso
		all vtym' (fn (nm,ty) => lassoc3 vtym nm =: ty)
	then (d,p,v)
	else fail "full_dest_z_∀⋎s" 0 []
end);
=TEX
=SML
fun ⦏full_dest_z_schema_pred⦎ (tm : TERM) : TERM * string = (
let	val (con,args) = strip_app tm;
	val (bind,sch) = case args of
		[bind,sch] => (bind,sch)
		| _ => fail "full_dest_z_schema_pred" 0 [];
	val dummy = if (fst(dest_const con) = "Z'SchemaPred")
			andalso type_of tm =: BOOL
		then ()
		else fail "full_dest_z_schema_pred" 0 [];
	val stym = dest_z_schema_type(dest_z_power_type(type_of sch));
	val (itym,d) = full_dest_binding bind;
in	if all (combine itym stym)
			(fn ((inm,_),(snm,_)) => inm = snm)
	then (sch,d)
	else fail "full_dest_z_schema_pred" 0 []
end);
=TEX
=SML
local
fun ⦏dest_z_seta_bterm⦎ (tm :TERM) : TYPE list * TYPE = (
let	val (nm,ty) = dest_const tm;
	val litym = case (dest_z_name nm) of
		("Z'Seta",[[n]],Nil) => nat_of_string n
		| _ => fail "dest_z_seta_bterm" 0 [];
	val (ty1,ty2) = dest_→_type ty;
	val ty3 = case dest_ctype ty2 of
		("SET",[ty3]) => ty3
		| _ => fail "dest_z_seta_bterm" 0 [];
	val tys = rev(strip_→_type ty1);
	val g2bt = hd tys;
	val ity = rev(tl tys);
in
	if g2bt =: g2_bind_type ty3 andalso
		length ity = litym
	then (ity,ty3)
	else fail "dest_z_seta_bterm" 0 []
end);
in
=TEX
=SML
fun ⦏full_dest_z_seta⦎ (tm : TERM) : TERM * TERM * TERM = (
let	val (seta_bterm1, bdy) = dest_app tm;
	val (d,p,v,itym) = dest_g2_abs bdy;
	val (ity,vty) = dest_z_seta_bterm seta_bterm1;
	val itym' = dest_decl d;
in
	if list_eq(op =:) ity (map snd itym) andalso
		all itym' (fn (nm,ty) => lassoc3 itym nm =: ty)
	then (d,p,v)
	else fail "full_dest_z_seta" 0 []
end);
end;
=TEX
=SML
fun ⦏full_dest_z_θ⦎ (tm : TERM) : TERM * string = (
let	val (con,args) = strip_app tm;
	val (bind,sch) = case args of
		[a,b] => (a,b)
		| _ => fail "full_dest_z_θ" 0 [];
	val dummy = if (fst(dest_const con) = "Z'θ")
			andalso type_of tm =: type_of bind
		then ()
		else fail "full_dest_z_θ" 0 [];
	val stym = dest_z_schema_type(dest_z_power_type(type_of sch));
	val (itym,d) = full_dest_binding bind;
in	if all (combine itym stym)
			(fn ((inm,_),(snm,_)) => inm = snm)
	then (sch,d)
	else fail "full_dest_z_θ" 0 []
end);
=TEX
=SML
fun ⦏dest_tuple_type⦎ (ty : TYPE) : TYPE list = (
let	val (nm,args) = dest_ctype ty;
	val nfid = case dest_z_name nm of
		("Z'T",[[n]],Nil) => nat_of_string n
		| _ => fail "dest_tuple_type" 0 [];
in
	if nfid = length args
	then args
	else fail "dest_tuple_type" 0 []
end);
=TEX
=SML
local
fun ⦏dest_λ_bterm⦎ (tm : TERM) : TYPE list * TYPE * TYPE = (
let	val (nm,ty) =dest_const tm;
	val nfid = case dest_z_name nm of
		("Z'λ",[[n]],Nil) => nat_of_string n
		| _ => fail "dest_λ_bterm" 0 [];
	val (ty1,ty2) = dest_→_type ty;
	val ty3 = case dest_ctype ty2 of
		("SET",[ty3]) => ty3
		| _ => fail "dest_λ_bterm" 0 [];
	val (t_ty,v_ty) = case dest_tuple_type ty3 of
		[t1,t2] => (t1,t2)
		| _ => fail "dest_λ_bterm" 0 [];
	val ity = rev(tl(rev(strip_→_type ty1)));
in
	(ity, t_ty, v_ty)
end);
=TEX
=SML
fun	f ([]:Z_TERM list) :TERM list = []
|	f (ZDec(tml,_)::z_tml) = tml @ (f z_tml)
|	f (ZSchemaDec(sch,d)::z_tml) = (mk_z_θ(sch,d)) :: (f z_tml)
|	f _ = term_fail "mk_z_λ" 0 [];

fun	chartuple ((ZDecl tml):Z_TERM) :TERM = (
		case (f (map dest_z_term tml)) of
			[] => mk_z_binding []
		|	[tm] => tm
		|	tml' => mk_z_tuple tml'
		)
|	chartuple _ = fail "mk_z_λ" 0 [];
in
fun ⦏full_dest_z_λ⦎ (tm : TERM) : TERM * TERM * TERM = (
let	val (λ_bterm1, g3abs) = dest_app tm;
	val (ity,t_ty,v_ty) = dest_λ_bterm λ_bterm1;
	val (t,d,p,v,itym) = dest_g3_abs g3abs;
	val itym' = dest_decl d;
	val t' = chartuple(dest_z_term d);
in
	if list_eq (op =:) ity (map snd itym) andalso
		t_ty =: type_of t andalso
		v_ty =: type_of v andalso
		all itym' (fn (nm,ty) => lassoc3 itym nm =: ty) andalso
		t' =$ t
	then (d,p,v)
	else fail "full_dest_z_λ" 0 []
end);
end;
=TEX
=SML
local
fun ⦏dest_μ_bterm⦎ (tm :TERM) : TYPE list * TYPE = (
let	val (nm,ty) = dest_const tm;
	val litym = case (dest_z_name nm) of
		("Z'μ",[[n]],Nil) => nat_of_string n
		| _ => fail "dest_μ_bterm" 0 [];
	val (ty1,ty2) = dest_→_type ty;
	val tys = rev(strip_→_type ty1);
	val g2bt = hd tys;
	val ity = rev(tl tys);
in
	if g2bt =: g2_bind_type ty2 andalso
		length ity = litym
	then (ity,ty2)
	else fail "dest_μ_bterm" 0 []
end);
in
=TEX
=SML
fun ⦏full_dest_z_μ⦎ (tm : TERM) : TERM * TERM * TERM = (
let	val (μ_bterm1, bdy) = dest_app tm;
	val (d,p,v,itym) = dest_g2_abs bdy;
	val (ity,vty) = dest_μ_bterm μ_bterm1;
	val itym' = dest_decl d;
in
	if list_eq(op =:) ity (map snd itym) andalso
		all itym' (fn (nm,ty) => lassoc3 itym nm =: ty)
	then (d,p,v)
	else fail "full_dest_z_μ" 0 []
end);
end;
=TEX
=SML
local
fun ⦏dest_schema_bterm⦎ (tm:TERM): (string * TYPE) list = (
let	val (nm,ty) = dest_const tm;
	val fid = case (dest_z_name nm) of
		("Z'⋎s",[fid],Nil) => fid
		| _ => fail "dest_schema_bterm" 0 [];
	val (ty1,ty2) = dest_→_type ty;
	val itym = dest_schema_type ty2;
	val tys = rev(strip_→_type ty1);
	val g1bt = hd tys;
	val ity = rev(tl tys);
in
	if g1bt =: g1_bind_type andalso
		list_eq(op =:) ity (map snd itym)
	then itym
	else fail "dest_schema_bterm" 0 []
end);
in
=TEX
=SML
fun ⦏full_dest_z_h_schema⦎ (tm : TERM) : TERM * TERM = (
let	val (schema_bterm1, bdy) = dest_app tm;
	val (d,p,itym) = dest_g1_abs bdy;
	val itym' = dest_schema_bterm schema_bterm1;
	val itym'' = dest_decl d;
in
	if list_eq (fn ((a,b),(c,d)) => a = c andalso b =: d) itym itym'
		andalso
		all itym'' (fn (nm,ty) => lassoc3 itym nm =: ty)
	then (d,p)
	else fail "full_dest_z_h_schema" 0 []
end);
end;
=TEX
=SML
fun ⦏full_dest_z_schema_dec⦎ (tm : TERM) : TERM * string = (
let 	val (con,args) = (strip_app tm);
	val (bind,sch) = case args of
		[bind,sch] => (bind,sch)
		| _ => fail "full_dest_z_schema_dec" 0 [];
	val dummy = if (fst(dest_const con) = "Z'SchemaDec")
			andalso type_of tm =: BOOL
		then ()
		else fail "full_dest_z_schema_dec" 0 [];
	val stym = dest_z_schema_type(dest_z_power_type(type_of sch));
	val (itym,d) = full_dest_binding bind;
in	if all (combine itym stym)
			(fn ((inm,_),(snm,_)) => inm = snm)
	then (sch,d)
	else fail "full_dest_z_schema_dec" 0 []
end);

=TEX
=SML
fun ⦏full_dest_z_dec⦎ (tm: TERM) : TERM list * TERM = (
let	val (tml,s) = dest_z_dec tm;
	val tye = case tml of
		[] => fail "" 0 []
		| (a :: x) =>  type_of a;
	val tys = dest_z_power_type(type_of s);
in
	if (tye =: tys) andalso all tml is_var
	then (tml,s)
	else fail "" 0 []
end);
=TEX
=SML
fun ⦏full_dest_z_tuple⦎ (tm: TERM) : TERM list = (
let	val tml = dest_z_tuple tm;
	val (cons,rest) = strip_app tm;
	val (rt,nl,anil) = dest_z_name(fst(dest_const cons));
in
	if (rt = "Z'Mk_T") andalso length nl = 1
		andalso length (hd nl) = 1
		andalso nat_of_string (hd(hd nl)) = length rest
	then tml
	else fail "" 0 []
end);
=TEX
\subsubsection{Bringing it Together}
=SML
fun ⦏dest_z_term1⦎ (tm : TERM) : Z_TERM = (
let val dzt = dest_z_term tm;
in
case dzt of
ZSchemaDec(sch,d) => (full_dest_z_schema_dec tm; dzt)
| Z∃(d,p,v) => (full_dest_z_binder2 "∃" ∃_bterm ∃body_bterm tm; dzt)
| Z∀(d,p,v) => (full_dest_z_binder2 "∀" ∀_bterm ∀body_bterm tm; dzt)
| Z∃⋎1(d,p,v) => (full_dest_z_∃⋎1 tm; dzt)
| Z∃⋎s(d,p,v) => (full_dest_z_∃⋎s tm; dzt)
| Z∃⋎1⋎s(d,p,v) => (full_dest_z_∃⋎1⋎s tm; dzt)
| Z∀⋎s(d,p,v) => (full_dest_z_∀⋎s tm; dzt)
| ZSchemaPred(sch,d) => (full_dest_z_schema_pred tm; dzt)
| ZSeta(d,p,v) => (full_dest_z_seta tm; dzt)
| Zθ(sch,d) => (full_dest_z_θ tm; dzt)
| Zλ(d,p,v) => (full_dest_z_λ tm; dzt)
| Zμ(d,p,v) => (full_dest_z_μ tm; dzt)
| ZHSchema(d,p) => (full_dest_z_h_schema tm; dzt)
| ZDec(d,p) => (full_dest_z_dec tm; dzt)
| ZTuple tml => (full_dest_z_tuple tm; dzt)
| _ => dzt
end
handle (Fail _) =>
term_fail "dest_z_term1" 41002 [tm]
);
=TEX
The following cannot ``cheat'' $dest\_z\_term$, unless the constants
have been given types incompatible with their generated forms
from \cite{DS/FMU/IED/DTD047}.
=GFT
ZDecl, ZEq, Z∈, ZTrue, ZFalse, Z¬, Z∧, Z∨, Z⇒,
Z⇔, ZLVar, ZGVar, ZInt, ZString, Z⟨⟩, ZSetd, Zℙ,
ZBinding, Z×, ZSel⋎s, ZSel⋎t, ZApp, ZDecor⋎s, ZPre⋎s,
Z¬⋎s, Z∧⋎s, Z∨⋎s, Z⇒⋎s, Z⇔⋎s, Z↾⋎s, ZHide⋎s, ZΔ⋎s,
ZΞ⋎s, Z⨾⋎s, ZRename⋎s
=TEX
\subsection{Problems to be Caught}
=GFT
val tm = mk_z_schema_dec(ⓩ[z:X;x:Y;y:Z]⌝,"'");
val y' = nth 4 (frees tm);
val y'' = variant [y'] y';
val tm' = subst[(y'',y')] tm;
dest_z_term1 tm;
dest_z_term tm';
dest_z_term1 tm'; (* fails *)
=TEX
As ``!'' is before ```'' in ordering:
=GFT
val tm = ⓩ∀ x, x! : X ⦁ x = z⌝;
val z = hd(frees tm);
val x_ins = mk_var("x",type_of z);
val tm' = subst [(x_ins,z)] tm;
dest_z_term1 tm;
dest_z_term tm';
dest_z_term1 tm'; (* fails *)
=TEX
As ``!'' is before ```'' in ordering:
=GFT
val tm = ⓩ∃ x, x! : X ⦁ x = z⌝;
val z = hd(frees tm);
val x_ins = mk_var("x",type_of z);
val tm' = subst [(x_ins,z)] tm;
dest_z_term1 tm;
dest_z_term tm';
dest_z_term1 tm'; (* fails *)
=TEX
As ``!'' is before ```'' in ordering:
=GFT
val tm = ⓩ∃⋎1 x, x! : X ⦁ x = z⌝;
val z = hd(frees tm);
val x_ins = mk_var("x",type_of z);
val tm' = subst [(x_ins,z)] tm;
dest_z_term1 tm;
dest_z_term tm';
dest_z_term1 tm'; (* fails *)
=TEX
=GFT
val Z∃(a,b,c) = dest_z_term ⓩ∃ x, x! : X | x = z ⦁ [x,x! : X | true]⌝;
val tm = mk_z_∃⋎s(a,b,ⓩ[x,x! : X | true]⌝);
val z = hd(frees tm);
val x_ins = mk_var("x",type_of z);
val tm' = subst [(x_ins,z)] tm;
dest_z_term1 tm;
dest_z_term tm';
dest_z_term1 tm'; (* fails *)
=TEX
=GFT
val Z∃(xa,xb,xc) = dest_z_term ⓩ∃ x, x! : X | x = z ⦁ [x,x! : X | true]⌝;
val tm = mk_z_∃⋎1⋎s(xa,xb,ⓩ[x,x! : X | true]⌝);
val z = hd(frees tm);
val x_ins = mk_var("x",type_of z);
val tm' = subst [(x_ins,z)] tm;
dest_z_term1 tm;
dest_z_term tm';
dest_z_term1 tm'; (* fails *)
=TEX
=GFT
val Z∃(xa,xb,xc) = dest_z_term ⓩ∃ x, x! : X | x = z ⦁ [x,x! : X | true]⌝;
val tm = mk_z_∀⋎s(xa,xb,ⓩ[x,x! : X | true]⌝);
val z = hd(frees tm);
val x_ins = mk_var("x",type_of z);
val tm' = subst [(x_ins,z)] tm;
dest_z_term1 tm;
dest_z_term tm';
dest_z_term1 tm'; (* fails *)
=TEX
=GFT
val tm1 = ⓩ[x,x!:X | x = z] ∧ true⌝;
val tm = fst(dest_z_∧ tm1);
val z = hd(frees tm);
val x_ins = mk_var("x",type_of z);
val x_ins' = mk_var("x'",type_of z);
val tm' = subst [(x_ins',x_ins)] tm;
dest_z_term1 tm;
dest_z_term tm';
dest_z_term1 tm';
=TEX
=GFT
val tm = ⓩ{x, x! : X | x = z}⌝;
val z = hd(frees tm);
val x_ins = mk_var("x",type_of z);
val tm' = subst [(x_ins,z)] tm;
dest_z_term1 tm;
dest_z_term tm';
dest_z_term1 tm';
=TEX
=GFT
val tm = ⓩθ[x, x! : X | x = z]⌝;
val z = hd(frees tm);
val x_ins = mk_var("x",type_of z);
val x_ins' = mk_var("x'",type_of z);
val tm' = subst [(x_ins',x_ins)] tm;
dest_z_term1 tm;
dest_z_term tm';
dest_z_term1 tm';
=TEX
=GFT
val tm = ⓩ λ x, x! : X ⦁ x = z⌝;
val z = hd(frees tm);
val x_ins = mk_var("x",type_of z);
val tm' = subst [(x_ins,z)] tm;
dest_z_term1 tm;
dest_z_term tm';
dest_z_term1 tm';
=TEX
=GFT
val tm = ⓩ μ x, x! : X ⦁ x = z⌝;
val z = hd(frees tm);
val x_ins = mk_var("x",type_of z);
val tm' = subst [(x_ins,z)] tm;
dest_z_term1 tm;
dest_z_term tm';
dest_z_term1 tm';
=TEX
=GFT
val tm = ⓩ [x,x! : X | x = z]⌝;
val z = hd(frees tm);
val x_ins = mk_var("x",type_of z);
val tm' = subst [(x_ins,z)] tm;
dest_z_term1 tm;
dest_z_term tm';
dest_z_term1 tm';
=TEX
=SML
fun	⦏is_z_term1⦎ (t:TERM) :bool =
	let	val x = dest_z_term1 t
	in
		true
	end
	handle Fail _ => false;
=TEX

=SML
fun ⦏is_all_z_type⦎ (ty : TYPE) : bool = (
let
	fun aux (a :: x) = is_all_z_type a andalso aux x
	| aux [] = true;
	fun aux1 ((_,a) :: x) = is_all_z_type a andalso aux1 x
	| aux1 [] = true;
in
(case (dest_z_type ty
	handle (Fail _) =>
	type_fail "is_all_z_type"  41003 [ty]) of
ZGivenType _ => true
| ZVarType _ => true
| ZPowerType ty' => is_all_z_type ty'
| ZTupleType tyl => aux tyl
| ZSchemaType ltyl => aux1 ltyl)
end);
=TEX
Note the special case of $ⓩ𝕌⌝$, which parses to $ⓩ𝕌[⌜Totality⌝]$, is legal Z, for all $Totality$ is not a Z, but a HOL, constant.
=SML
fun ⦏is_z⦎ (tm : TERM) : bool = (
let fun aux (a :: x) = is_z a andalso aux x
	| aux _ = true;
in
case (dest_z_term1 tm
	handle (Fail _) =>
	term_fail "is_z" 41002 [tm]) of
ZLVar (_,ty,tml) => is_all_z_type ty andalso aux tml
| ZGVar (nm,ty,tml) => is_all_z_type ty andalso
		if (nm = "𝕌" andalso length tml = 1
			andalso is_const (hd tml) andalso
			fst(dest_const (hd tml)) = "Totality")
		then true
		else aux tml
| ZApp (tm1,tm2) => is_z tm1 andalso is_z tm2
| ZDec (tml,tm1) => aux tml andalso is_z tm1
| ZSchemaDec (tm1,_) => is_z tm1
| ZDecl tml => aux tml
| ZEq (tm1,tm2) => is_z tm1 andalso is_z tm2
| Z∈ (tm1, tm2) => is_z tm1 andalso is_z tm2
| ZTrue => true
| ZFalse => true
| Z¬ tm1 => is_z tm1
| Z¬⋎s tm1 => is_z tm1
| Z∧ (tm1, tm2) => is_z tm1 andalso is_z tm2
| Z∨ (tm1, tm2) => is_z tm1 andalso is_z tm2
| Z⇒ (tm1, tm2) => is_z tm1 andalso is_z tm2
| Z⇔ (tm1, tm2) => is_z tm1 andalso is_z tm2
| Z∧⋎s (tm1, tm2) => is_z tm1 andalso is_z tm2
| Z∨⋎s (tm1, tm2) => is_z tm1 andalso is_z tm2
| Z⇒⋎s (tm1, tm2) => is_z tm1 andalso is_z tm2
| Z⇔⋎s (tm1, tm2) => is_z tm1 andalso is_z tm2
| Z∃ (tm1,tm2,tm3) => is_z tm1 andalso is_z tm2 andalso is_z tm3
| Z∃⋎s (tm1,tm2,tm3) => is_z tm1 andalso is_z tm2 andalso is_z tm3
| Z∃⋎1 (tm1,tm2,tm3) => is_z tm1 andalso is_z tm2 andalso is_z tm3
| Z∃⋎1⋎s (tm1,tm2,tm3) => is_z tm1 andalso is_z tm2 andalso is_z tm3
| Z∀ (tm1,tm2,tm3) => is_z tm1 andalso is_z tm2 andalso is_z tm3
| Z∀⋎s (tm1,tm2,tm3) => is_z tm1 andalso is_z tm2 andalso is_z tm3
| ZSchemaPred (tm1,_) => is_z tm1
| ZInt _ => true
| ZString _ => true
| ZFloat _ => true
| Z⟨⟩ (ty,tml) => is_all_z_type ty andalso aux tml
| ZSetd (ty,tml) => is_all_z_type ty andalso aux tml
| ZSeta (tm1,tm2,tm3) => is_z tm1 andalso is_z tm2 andalso is_z tm3
| Zℙ tm1 => is_z tm1
| ZTuple tml => aux tml
| Z× tml => aux tml
| Zθ (tm1,_) => is_z tm1
| ZSel⋎s (tm1,_) => is_z tm1
| ZSel⋎t (tm1,_) => is_z tm1
| Zμ (tm1,tm2,tm3) => is_z tm1 andalso is_z tm2 andalso is_z tm3
| Zλ (tm1,tm2,tm3) => is_z tm1 andalso is_z tm2 andalso is_z tm3
| ZHSchema (tm1,tm2) => is_z tm1 andalso is_z tm2
| ZDecor⋎s (tm1,_) => is_z tm1
| ZPre⋎s tm1 => is_z tm1
| Z↾⋎s (tm1,tm2) => is_z tm1 andalso is_z tm2
| ZHide⋎s (tm1,_) => is_z tm1
| ZΔ⋎s tm1  => is_z tm1
| ZΞ⋎s tm1  => is_z tm1
| Z⨾⋎s (tm1,tm2) => is_z tm1 andalso is_z tm2
| ZRename⋎s (tm1,_) => is_z tm1
| ZBinding (stml) => aux (map snd stml)
| ZLet (stml, tm1) => aux (map snd stml) andalso is_z tm1
end);

=TEX
=SML
fun ⦏not_z_subterms⦎ (itm : TERM) : TERM list = (
let 	val acc = ref ([]:TERM list);
	fun aux1 tm ty = (if is_all_z_type ty
		then ()
		else acc := tm :: (!acc));

fun tz (tm : TERM) = (
let	fun aux (a :: x) = (tz a ; aux x)
	| aux _ = ();
in
case (dest_z_term1 tm
	handle (Fail _) =>
	(acc := tm :: (!acc); ZTrue)) of
ZLVar (_,ty,tml) => (aux1 tm ty ; aux tml)
| ZGVar (nm,ty,tml) => (aux1 tm ty ;
		if (nm = "𝕌" andalso length tml = 1
			andalso is_const (hd tml) andalso
			fst(dest_const (hd tml)) = "Totality")
		then ()
		else aux tml
) | ZApp (tm1,tm2) => (tz tm1 ; tz tm2)
| ZDec (tml,tm1) => (aux tml ; tz tm1)
| ZSchemaDec (tm1,_) => tz tm1
| ZDecl tml => aux tml
| ZEq (tm1,tm2) => (tz tm1 ; tz tm2)
| Z∈ (tm1, tm2) => (tz tm1 ; tz tm2)
| ZTrue => ()
| ZFalse => ()
| Z¬ tm1 => tz tm1
| Z¬⋎s tm1 => tz tm1
| Z∧ (tm1, tm2) => (tz tm1 ; tz tm2)
| Z∨ (tm1, tm2) => (tz tm1 ; tz tm2)
| Z⇒ (tm1, tm2) => (tz tm1 ; tz tm2)
| Z⇔ (tm1, tm2) => (tz tm1 ; tz tm2)
| Z∧⋎s (tm1, tm2) => (tz tm1 ; tz tm2)
| Z∨⋎s (tm1, tm2) => (tz tm1 ; tz tm2)
| Z⇒⋎s (tm1, tm2) => (tz tm1 ; tz tm2)
| Z⇔⋎s (tm1, tm2) => (tz tm1 ; tz tm2)
| Z∃ (tm1,tm2,tm3) => (tz tm1 ; tz tm2; tz tm3)
| Z∃⋎s (tm1,tm2,tm3) => (tz tm1 ; tz tm2; tz tm3)
| Z∃⋎1 (tm1,tm2,tm3) => (tz tm1 ; tz tm2; tz tm3)
| Z∃⋎1⋎s (tm1,tm2,tm3) => (tz tm1 ; tz tm2; tz tm3)
| Z∀ (tm1,tm2,tm3) => (tz tm1 ; tz tm2; tz tm3)
| Z∀⋎s (tm1,tm2,tm3) => (tz tm1 ; tz tm2; tz tm3)
| ZSchemaPred (tm1,_) => tz tm1
| ZInt _ => ()
| ZString _ => ()
| ZFloat _ => ()
| Z⟨⟩ (ty,tml) => (aux1 tm ty ; aux tml)
| ZSetd (ty,tml) => (aux1 tm ty ; aux tml)
| ZSeta (tm1,tm2,tm3) => (tz tm1 ; tz tm2; tz tm3)
| Zℙ tm1 => tz tm1
| ZTuple tml => aux tml
| Z× tml => aux tml
| Zθ (tm1,_) => tz tm1
| ZSel⋎s (tm1,_) => tz tm1
| ZSel⋎t (tm1,_) => tz tm1
| Zμ (tm1,tm2,tm3) => (tz tm1 ; tz tm2; tz tm3)
| Zλ (tm1,tm2,tm3) => (tz tm1 ; tz tm2; tz tm3)
| ZHSchema (tm1,tm2) => (tz tm1 ; tz tm2)
| ZDecor⋎s (tm1,_) => tz tm1
| ZPre⋎s tm1 => tz tm1
| Z↾⋎s (tm1,tm2) => (tz tm1 ; tz tm2)
| ZHide⋎s (tm1,_) => tz tm1
| ZΔ⋎s tm1  => tz tm1
| ZΞ⋎s tm1  => tz tm1
| Z⨾⋎s (tm1,tm2) => (tz tm1 ; tz tm2)
| ZRename⋎s (tm1,_) => tz tm1
| ZBinding (stml) => aux (map snd stml)
| ZLet (stml, tm1) => (aux (map snd stml); tz tm1)
end);
in
	(tz itm;
	(!acc))
end);
=TEX
\subsection{Using the Checks}
We handle failures from $new\_flag$ to allow repeated loadings of this function.
=SML
val ⦏check_is_z⦎ = ref true;
val _ = new_flag{name = "check_is_z",
	check = fun_true,
	control = check_is_z,
	default = (fn () => false)}
		handle (Fail _) => ();
=TEX
=SML
fun ⦏set_check_is_z⦎ (b : bool) : bool = (
	let	val old_ciz = !check_is_z;
	in	check_is_z := b;
		old_ciz
	end
);
=TEX
=SML
local
	fun not_z_subterms1 tm = not_z_subterms(snd(strip_simple_∀ tm));
in
fun ⦏check_is_z_term⦎ (caller : string) (tm : TERM): TERM = (
	if not(get_flag("check_is_z"))
	then tm
	else (
	case (not_z_subterms1 tm) of
	[] => tm
	| lst => (diag_string (get_error_message 41005
		[caller,(format_list string_of_term lst ", ")]);
		tm)
));
=TEX
=SML
fun ⦏check_is_z_thm⦎ (caller : string) (thm : THM): THM = (
	if not(get_flag("check_is_z"))
	then thm
	else (
let	val nZ = not_z_subterms1 (concl thm) @ flat (map not_z_subterms1 (asms thm));
in
	case nZ of
	[] => thm
	| lst => (diag_string (get_error_message 41005
		[caller,(format_list string_of_term lst ", ")]);
		thm)
end));
=TEX
=SML
fun ⦏check_is_z_goal⦎ (caller : string) ((gasms,conc): GOAL):GOAL = (
	if not(get_flag "check_is_z")
	then (gasms,conc)
	else (
let	val nZ = not_z_subterms1 conc @ flat (map not_z_subterms1 gasms);
in
	case nZ of
	[] => (gasms,conc)
	| lst => (diag_string (get_error_message 41005
		[caller,(format_list string_of_term lst ", ")]);
		(gasms,conc))
end));
=TEX
=SML
fun ⦏CHECK_IS_Z_T⦎ (caller:string) (tac:TACTIC) : TACTIC = (fn gl =>
let	val ciz = set_check_is_z false;
	val (sgs,prf) = tac gl;
	val _ = set_check_is_z ciz;
	val dummy = map (check_is_z_goal caller) sgs;
in
	(sgs,prf)
end);
end; (* of local not_z_subterms1 *)
=TEX
=SML
local
	fun not_z_subterms1 tm = not_z_subterms(snd(strip_simple_∀ tm));
in
fun ⦏check_is_z_conv_result⦎ (caller:string) (res:THM):THM = (
	if not(get_flag("check_is_z"))
	then res
	else (
let	val (lhs,rhs) = dest_eq (concl res)
		handle (Fail _) => (mk_t,concl res);
	val nZ = not_z_subterms1 rhs @
		flat (map not_z_subterms1 (asms res));
in
	case nZ of
	[] => res
	| lst => (diag_string (get_error_message 41005
		[caller,(format_list string_of_term lst ", ")]);
		res)
end));
end;
=TEX	
\subsubsection{Representing HOL Types as Z Terms}
The code of $z\_term\_of\_type$ is immediately after $z\_get\_spec$,
which it uses (perhaps it shouldn't, but that does ensure they recognise
the same things as $𝕌$, e.g. if a global variable has been defined equal
to $𝕌$ or a free type name).
\subsubsection{Adjustment after α-conversion}
=SML
fun ⦏α_to_z⦎ (tm : TERM):TERM =
	term_fail "α_to_z NOT YET IMPLEMENTED" 41100 [tm];
val ⦏α_to_z_conv⦎ : CONV = fail_with_conv "α_to_z NOT YET IMPLEMENTED";
=TEX
\subsection{Getting Things into the Existence Prover}
Tuple type ``varstruct'' constructions:
=SML
fun ⦏tt_to_∃_vs⦎  (ty : TYPE) : (string * (TERM list * THM)) = (
let	val (abs,cons) = get_tuple_info ty;
	val def_thm = get_spec (hd cons);
	val abs_nm = fst(dest_const abs);
in
	(abs_nm,(cons, def_thm))
end);

local
val tt_sofar : (string * (TERM list * THM)) list ref = ref [];
in
fun ⦏add_tt_to_pc⦎ (ty : TYPE) : unit = (
let	val (abs_nm,(cons, def_thm)) = tt_to_∃_vs ty;
in
	case lassoc5 (!tt_sofar) abs_nm of
	Nil => (tt_sofar := (abs_nm,(cons, def_thm)) :: (!tt_sofar);
		set_∃_vs_thms (!tt_sofar) "'z_predicate_calculus_build";
		set_merge_pcs ["hol1","'z_predicate_calculus_build"])
	| Value _ => ()
end);
end;

=TEX
Theorems to rewrite with before further existence proof:
=SML
local
val ∃_rw_thms : THM list ref = ref [];
in
fun ⦏add_∃_rw_thm⦎ (thm :THM) : unit = (
let	val dummy = (∃_rw_thms := thm :: (!∃_rw_thms));
	val ∃_conv = pure_rewrite_conv (!∃_rw_thms);
in
	(set_cs_∃_convs [∃_conv] "'z_predicate_calculus_build";
	set_merge_pcs ["hol1","'z_predicate_calculus_build"]
	)
end);
end;
=TEX
=SML
local
	val z'abb_def = get_spec ⌜$"Z'AbbDef"⌝;
	val dummy = set_rw_canons
		[fn thm => [conv_rule(simple_eq_match_conv1 z'abb_def) thm]]
		"'z_predicate_calculus_build";
in
val _ = set_merge_pcs ["hol1","'z_predicate_calculus_build"];
end;
=TEX
\section{Consistency Proofs I}
=SML
val _ = add_tt_to_pc (type_of ⓩ(x,y)⌝);
val _ = add_∃_rw_thm (get_spec ⌜$"Z'AbbDef"⌝);
=TEX
\section{Concerning The Universe, 𝕌}
=SML
val ⦏∈_u_thm⦎ = (
push_goal([],⌜∀ x ⦁ ⓩx ∈ 𝕌⌝⌝);
a(∀_tac);
set_current_language "HOL";
a(rewrite_tac[z_u_def, z_totality_def]);
a(rewrite_tac[get_spec ⌜$"Z'T[1]1"⌝, get_spec ⌜$"Z'Mk_T[1]"⌝]);
set_current_language "Z";
pop_thm());
val ⦏∈_u_thm1⦎ = prove_rule[∈_u_thm]⌜∀ x ⦁ ⓩx ∈ 𝕌⌝ ⇔ T⌝;
=TEX
=SML
val ⦏ℙ_u_thm⦎ =  (
push_goal([],⌜ⓩℙ 𝕌 = 𝕌⌝⌝);
a(rewrite_tac[∈_u_thm]);
a(rewrite_tac[z'app_def, z'ℙ_def, z_u_def, z_totality_def]);
a(rewrite_tac[get_spec ⌜$"Z'T[1]1"⌝, get_spec ⌜$"Z'Mk_T[1]"⌝]);
pop_thm());
=TEX
The following is not used in the general $𝕌$ simplification,
but helps get there.
(We start by forcing the generation of the semantic constant).
=SML
val _ = ⓩx × y⌝;
val ⦏u_×_u_thm⦎ = prove_rule
	[∈_u_thm, get_spec ⌜$"Z'×[2]"⌝]
	ⓩ (𝕌 × 𝕌) = 𝕌⌝;
=TEX

\section{Concerning Declarations}
\subsection{Theorems}
=SML
val adec = mk_z_dec([⌜x:'a⌝],⌜s:'a SET⌝);
val ⦏single_dec_thm⦎ = prove_rule
	[z'dec_def]
	⌜∀ x:'a; s:'a SET ⦁
	ⓩⓜadec⌝ = ⓩ⌜x:'a⌝ ∈ ⌜s:'a SET⌝⌝⌝⌝;
val ⦏sym_single_dec_thm⦎ = eqn_sym_rule single_dec_thm;
=TEX
=SML
local
	val cnv1 = simple_eq_match_conv1 z'∀_def;
	val cnv2 = simple_eq_match_conv1 z'∀_body_def;
in
val ⦏z_∀_elim_conv2⦎ :CONV = (
	(cnv1 THEN_C ALL_SIMPLE_∀_C cnv2)
	ORELSE_C (fn tm =>  term_fail "z_∀_elim_conv2" 41022 [tm])
);
end;
=IGN
z_∀_elim_conv2 ⓩ∀ a,b : 𝕌; [c,d:𝕌]; e:𝕌 | f ⦁ g⌝;
=SML
val ⦏z_⊆_thm⦎ = (all_∀_intro(
	set_goal([], ⓩ s ⊆ t ⇔ (∀ x : 𝕌 ⦁ x ∈ s ⇒ x ∈ t)⌝);
	a(rewrite_tac[get_spec ⌜$"z'_ ⊆ _"⌝,
		get_spec ⌜$"Z'T[1]1"⌝, get_spec ⌜$"Z'T[2]1"⌝]);
	a(conv_tac (MAP_C z_∀_elim_conv2));
	a(rewrite_tac[single_dec_thm, ℙ_u_thm, ∈_u_thm,z'decl_def]);
	pop_thm()));

val ⦏z_⊆_thm1⦎ = (all_∀_intro(
	set_goal([], ⌜ⓩ s ⊆ t⌝ ⇔ (∀ x⦁ x ∈ s ⇒ x ∈ t)⌝);
	a(rewrite_tac[get_spec ⌜$"z'_ ⊆ _"⌝,
		get_spec ⌜$"Z'T[1]1"⌝, get_spec ⌜$"Z'T[2]1"⌝]);
	a(rewrite_tac[single_dec_thm, ℙ_u_thm, ∈_u_thm,z'decl_def]);
	pop_thm()));
=TEX
=SML
val ⦏many_dec_thm⦎ =
(push_goal ([],⌜∀ xs:'a LIST; s:'a SET ⦁
	ⓩ⌜$"Z'Dec"((xs:'a LIST),(s:'a SET))⌝ =
	(⌜$"Z'Setd"(xs:'a LIST)⌝ ⊆ ⌜s:'a SET⌝)⌝⌝);
a(∀_tac);
a(rewrite_tac[z_⊆_thm1]);
a(LIST_INDUCTION_T ⌜xs:'a LIST⌝ asm_tac);
(* *** Goal "1" *** *)
a(rewrite_tac[z'setd_def,z'dec_def]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[z'setd_def,z'dec_def]);
a(REPEAT strip_tac);
(* *** Goal "2.1" *** *)
a(basic_res_tac 3 []);
(* *** Goal "2.2" *** *)
a(asm_rewrite_tac[]);
(* *** Goal "2.3" *** *)
a(basic_res_tac 1 []);
(* *** Goal "2.4" *** *)
a(basic_res_tac 1 []);
pop_thm());

val ⦏sym_many_dec_thm⦎ = eqn_sym_rule many_dec_thm;
=TEX
=SML
val ⦏decsexp_schema_pred_thm⦎ = prove_rule[z'schema_dec_def,
		z'schema_pred_def]
	⌜∀ x y ⦁ $"Z'SchemaDec" x y = $"Z'SchemaPred" x y⌝;
val ⦏predsexp_decsexp_thm⦎ = eqn_sym_rule decsexp_schema_pred_thm;
=TEX
\subsection{Functions}
=SML
local
	val cnv1 = RATOR_C(RATOR_C (simple_eq_match_conv1 z'schema_pred_def));
in
val ⦏z_schema_pred_conv1⦎ : CONV = (fn tm => (
	if is_bin_op "Z'SchemaPred" tm
	then (if
		((full_dest_z_schema_pred tm; true)
		 handle (Fail _) => false)
	then term_fail "z_schema_pred_conv1" 41018 [tm]
	else cnv1 tm
	)
	else term_fail "z_schema_pred_conv1" 41018 [tm]
));
end;
=TEX
=SML
local
val cnv1 = simple_eq_match_conv1 z'schema_pred_def;
val cnv2 = simple_eq_match_conv1 decsexp_schema_pred_thm;
val cnv3 = simple_eq_match_conv1 many_dec_thm;
val cnv4 = simple_eq_match_conv1 single_dec_thm;
val dp_schemapred_conv = (fn tm =>
let	val s1 = cnv2 tm;
in
	(full_dest_z_schema_pred (snd(dest_eq(concl s1))); s1)
	handle (Fail _) =>
	conv_rule (RAND_C(RATOR_C(RATOR_C cnv1))) s1
end);
in
val ⦏z_dec_pred_conv⦎ :CONV = (fn tm => (
	(cnv4 ORELSE_C cnv3 ORELSE_C
	dp_schemapred_conv ORELSE_C
	(fn tm1 => term_fail "z_dec_pred_conv" 41010 [tm1])
	) tm)
);
end;
=TEX
=SML
local
val cnv1 = simple_eq_match_conv1 z'θ_def;
val cnv2 = simple_eq_match_conv1 z'schema_dec_def;
val cnv3 = simple_eq_match_conv1 (prove_rule[]⌜∀ x:'a ⦁ (x = x) ⇔ T⌝);
in
val ⦏θ_s_∈_s_conv⦎ : CONV = (fn tm =>
let	val (θs,s) = dest_z_∈ tm;
	val (s',decor) = dest_z_θ θs;
	val dummy = if s' =$ s andalso decor = ""
		then ()
		else fail "θ_s_∈_s_conv" 0 [];
	val decs = mk_z_schema_dec(s',decor);
	val res_tm = mk_eq(tm,decs);
in
	⇔_t_elim((APP_C(RAND_C(LEFT_C cnv1),
			RATOR_C(RATOR_C cnv2)) THEN_C
		cnv3) res_tm)
end);
end;
=TEX
=SML
local
	val cnv2 = simple_eq_match_conv1 sym_many_dec_thm;
	val cnv3 = simple_eq_match_conv1 sym_single_dec_thm;
	val cnv4 = simple_eq_match_conv1 predsexp_decsexp_thm;
	val ec = [(ⓩ⌜Z'Setd y⌝ ⊆ x⌝, (fn tm =>
			let val (yx,ss) = dest_z_∈ tm;
				val (y,x) = (case dest_z_tuple yx of
					[y,x] => (y,x)
					| _ => fail "" 0 []);
				val ys = dest_z_setd y;
			in
				if (all (snd ys) is_var) andalso (length (snd ys) > 1)
				then cnv2 tm
				else term_fail "z_pred_dec_conv" 41011 [tm]
			end)),
		(ⓩ⌜Z'θ x⌝ ∈ y⌝, θ_s_∈_s_conv),
		(ⓩx ∈ y⌝, (fn tm =>
			let val (y,x) = dest_z_∈ tm;
			in
				if is_var y
				then cnv3 tm
				else term_fail "z_pred_dec_conv" 41011 [tm]
			end)),
		(⌜Z'SchemaPred x y⌝, cnv4)];
	val cnv1 = eqn_cxt_conv ec;
in
val ⦏z_pred_dec_conv⦎ : CONV = (cnv1 ORELSE_C
	(fn tm => term_fail "z_pred_dec_conv" 41011 [tm]));
end;
=TEX
=GFT Examples
val p = fst(dest_∧(ⓩ[a,b:X| a = b] ∧ true⌝));

=SML
local
	val decl_nil = ⇔_t_intro(∧_left_elim z'decl_def);
	val decl_cons = ∧_right_elim z'decl_def;
	val decl_cons_nil = rewrite_rule[decl_nil]
		(simple_∀_intro ⌜b:BOOL⌝
		(list_simple_∀_elim[⌜b:BOOL⌝,⌜[]:BOOL LIST⌝]
			decl_cons));
	val cnv_nil = simple_eq_match_conv1 decl_nil;
	val cnv_cons = simple_eq_match_conv1 decl_cons;
	val cnv_cons_nil = simple_eq_match_conv1 decl_cons_nil;
in
fun ⦏Z_DECL_C⦎ (cnv:CONV) : CONV = (fn tm1 =>
let	val dummy = dest_z_decl tm1
		handle complaint =>
		pass_on complaint "dest_z_decl" "Z_DECL_C";
	fun aux tm = ((cnv_cons_nil THEN_C cnv) ORELSE_C
		(cnv_cons THEN_C APP_C(RAND_C cnv,aux))
			ORELSE_C cnv_nil
			ORELSE_C (fn tm2 =>
			term_fail "Z_DECL_C" 41012 [tm1])
		) tm;
in
	aux tm1
end);
end;
=TEX
=GFT Example
val (d,p,v) = dest_z_∀
	ⓩ∀ x :X; y,z : Y; p,q,r : X; [a,b : Z | a = b] ⦁ true⌝;
Z_DECL_C z_dec_pred_conv d;
=TEX
=SML
val ⦏z_decl_pred_conv⦎ : CONV = (fn tm => (
	Z_DECL_C z_dec_pred_conv) tm
	handle complaint =>
	divert complaint "Z_DECL_C" "z_decl_pred_conv" 47912
		[fn () => string_of_term tm]
);
=TEX
=SML
local
	val cnv1 = simple_eq_match_conv1 z'∀_def;
	val cnv2 = simple_eq_match_conv1 z'∀_body_def;
in
val ⦏z_∀_tac⦎ :TACTIC = (fn gl =>
	(CHECK_IS_Z_T "z_∀_tac"
	(conv_tac cnv1 THEN
	REPEAT ∀_tac THEN
	conv_tac (cnv2 THEN_C LEFT_C (LEFT_C z_decl_pred_conv))))
	gl
	handle (Fail _) =>
	fail "z_∀_tac" 41030 []
);
end;
=TEX
The following applies a conversion to each member of a declaration,
without disturbing the declaration form.
=SML	
fun ⦏Z_DECL_C1⦎ (cnv:CONV) : CONV = (fn tm1 =>
let	val dummy = dest_z_decl tm1
		handle complaint =>
		pass_on complaint "dest_z_decl" "Z_DECL_C1";
	fun aux tm = ((LEFT_C cnv THEN_C RIGHT_C aux)
		ORELSE_C id_conv) tm;
in
	RAND_C aux tm1
end);
=GFT Example
val (d,p,v) = dest_z_∀ ⓩ∀ a,b : 𝕌; c : 𝕌 | true ⦁ true⌝;
Z_DECL_C1 id_conv d;

A conversional to apply something to the ``types'' of a ``dec'':
=SML
fun ⦏DEC_TYPES_C⦎ (cnv:CONV) : CONV = (fn tm =>
case dest_z_term tm of
ZDec _ => RAND_C(RIGHT_C cnv) tm
| ZSchemaDec _ => RAND_C cnv tm
| ZDecl _ => Z_DECL_C1 (DEC_TYPES_C cnv) tm
| _ => term_fail "DEC_TYPES_C" 0 [tm]);
=TEX

=SML
local
	val bons = ⌜Cons:BOOL → BOOL LIST  → BOOL LIST⌝;
	val bnil = ⌜[]:BOOL LIST⌝;
	val thm0 = (push_goal([],
		⌜T ⇔ $"Z'Decl" []⌝);
		a(rewrite_tac[z'decl_def]);
		pop_thm());
	val thm1 = (push_goal([],
		⌜∀ a b ⦁ (a ⇔ b) ⇒ (a ⇔ $"Z'Decl" [b])⌝);
		a(REPEAT ∀_tac THEN ⇒_T rewrite_thm_tac);
		a(rewrite_tac[z'decl_def]);
		pop_thm());
	fun thm1_rule thm = (
	let	val (a,b) = dest_⇔ (concl thm);
		val dummy = (if is_z_dec b orelse is_z_schema_dec b
			then ()
			else fail "thm1_rule" 0 [])
	in	⇒_elim (list_simple_∀_elim[a,b] thm1) thm
	end);
	val thm2 = (push_goal([],
		⌜∀ a v1 ⦁ (a = $"Z'Decl" v1) ⇒
		 ∀ b v2 ⦁ (b = $"Z'Decl" v2) ⇒
			((a ∧ b) = $"Z'Decl" (Append v1 v2))⌝);
		a(REPEAT ∀_tac THEN ⇒_T rewrite_thm_tac);
		a(REPEAT ∀_tac THEN ⇒_T rewrite_thm_tac);
		a(list_induction_tac ⌜v1:BOOL LIST⌝ THEN
		  asm_rewrite_tac[append_def, z'decl_def]);
		pop_thm());

	val athm1 = ∧_left_elim append_def;
	val athm2 = ∧_right_elim append_def;
	fun cnv3 tm = ((simple_eq_match_conv1 athm2 THEN_C
			RIGHT_C cnv3)
		ORELSE_C simple_eq_match_conv1 athm1) tm;
in
fun ⦏Z_DECL_INTRO_C⦎ (cnv:CONV) : CONV = (fn tm =>
let	fun cnv' tm2 = cnv tm2
		handle (Fail _) =>
		term_fail "Z_DECL_INTRO_C" 41013 [tm];
	fun aux tm1 = if is_∧ tm1
		then (
		let	val (v1,v2) = dest_∧ tm1;
			val v1_thm = aux v1;
			val v2_thm = aux v2;
			val append_v1_v2_thm =
			((simple_⇒_match_mp_rule
			(simple_⇒_match_mp_rule thm2 v1_thm)
			v2_thm));
		in
			conv_rule (RIGHT_C(RAND_C cnv3))
				append_v1_v2_thm			
		end)
		else if is_z_true tm1
		then thm0
		else (thm1_rule (cnv' tm1)
		handle complaint =>
		divert complaint "thm1_rule"
			"Z_DECL_INTRO_C" 41014 [
			fn () => string_of_term tm1,
			fn () => string_of_term((snd o dest_eq)
			(concl (cnv tm1)))]);
in
	aux tm
end);
end;

=TEX
=IGN
Z_DECL_INTRO_C id_conv ⌜(a ∧ b ∧ (c ∧ d) ∧ e) ∧ ((f ∧ g) ∧ h)⌝;	(* fail *)
Z_DECL_INTRO_C z_pred_dec_conv
	ⓩ(a ∈ X ∧ {b,b1} ⊆ X1 ∧
	(c ∈ X ∧ {d,d1,d2} ⊆ X2) ∧ [p,q:X | p = q]) ∧
	(({f} ⊆ X2 ∧ g ∈ X) ∧ h ∈ X1)⌝;
=TEX
=SML
val ⦏z_pred_decl_conv⦎ : CONV = (fn tm => (
	Z_DECL_INTRO_C z_pred_dec_conv) tm
	handle complaint =>
	divert complaint "Z_DECL_INTRO_C" "z_pred_decl_conv" 41011
		[fn () => string_of_term tm]
);
=TEX
=SML
val ⦏z_∀_elim_conv⦎ :CONV = (fn tm =>
	(z_∀_elim_conv2 THEN_C ALL_SIMPLE_∀_C(LEFT_C
		(LEFT_C z_decl_pred_conv)))
	tm
	handle complaint =>
	pass_on complaint "z_∀_elim_conv2" "z_∀_elim_conv"
);
=IGN
z_∀_elim_conv ⓩ∀ a,b : 𝕌; [c,d:𝕌]; e:𝕌 | f ⦁ g⌝;
=TEX
\section{Concerning The Universe, 𝕌, II}
=SML
val ⦏dec_u_thm⦎ = prove_rule[many_dec_thm, z_⊆_thm1, ∈_u_thm]
	⌜∀ xs:'a LIST ⦁
	ⓩ⌜$"Z'Dec"((xs:'a LIST),ⓩ𝕌⌝)⌝ = true⌝⌝;
val ⦏schema_dec_u_thm⦎ = prove_rule[z'schema_dec_def, ∈_u_thm]
	⌜∀ x:'a ⦁
	ⓩ⌜$"Z'SchemaDec" (x:'a) ⓩ𝕌⌝⌝ = true⌝⌝;
val ⦏dec_u_conv⦎ =
	simple_eq_match_conv1 dec_u_thm ORELSE_C
		simple_eq_match_conv1 schema_dec_u_thm;
=TEX
=SML
local val dummy = ⓩ[a ,b : 𝕌; c : 𝕌]⌝
in
val ⦏dp_proj_thm⦎ = all_∀_intro(list_∧_intro
	(strip_∧_rule (all_∀_elim (get_spec ⌜$"Z'S[d,p]p"⌝))
		to 1));
end;
=TEX
=SML
local
	fun wit_thms (a as ((tm, _), _)) =
	let
		fun aux_tuple_binding (tm_x, (vws, ots)) =
		let	val (vws', t') = tuple_binding_wit_thm (tm_x, vws);
		in	(vws', Value t'::ots)
		end;

		fun aux_var (tm_x, (vws, ots)) =
			(tm_x::vws, if is_nil ots then ots else Nil::ots);
	in
		case
			#1 (dest_z_name1 (#1 (dest_const (#1 (strip_app tm)))))
				handle Fail _ => ""
		of
			"Z'Mk_T"	=> aux_tuple_binding a
		|	"Z'Mk_S"	=> aux_tuple_binding a
		|	_		=> aux_var a
	end

	and tuple_binding_wit_thm ((tm, x), vws) =
	let
		val (hdtm, tms) = strip_app tm;
		val spec1 = case tms of
			[]	=> ∀_elim x z'empty_binding_labelled_product_spec
		|	_::_	=>
				iterate ∧_right_elim (
					all_∀_elim (∀_elim x (get_spec hdtm))
				);
		val xtms = #2 (strip_app (#1 (dest_eq (concl spec1))));
		val (vws', ots) = foldl wit_thms (vws, []) (combine tms xtms);
		val t' = conv_rule (
			LEFT_C (LIST_RAND_C (
				map (
					fn	Nil	=> id_conv
					|	Value t	=> eq_match_conv1 (eq_sym_rule t)
				) ots
			))
		) spec1;
	in
		(vws', t')
	end;

	fun wit_thm (tm_x as (tm, x)) =
	case
		#1 (dest_z_name1 (#1 (dest_const (#1 (strip_app tm)))))
			handle Fail _ => ""
	of
		"Z'Mk_T"	=> tuple_binding_wit_thm (tm_x, [])
	|	"Z'Mk_S"	=> tuple_binding_wit_thm (tm_x, [])
	|	_		=> ([tm_x], refl_conv x);
=IGN
wit_thm (dest_eq ⓩa = x⌝);
wit_thm (dest_eq ⓩ() = x⌝);
wit_thm (dest_eq ⓩ(a ≜ a1, b ≜ a2) = x⌝);
wit_thm (dest_eq ⓩ(a1, a2, a3, (), (d ≜ a4, e ≜ a5, f ≜ a6), (g ≜ a7)) = x⌝);

=SML
	val cnv1 = dec_u_conv;
	val cnv2 = simple_eq_match_conv1(taut_rule ⌜∀x ⦁ T ∧ x ⇔ x⌝);
	fun cnv3 tm = ((cnv2 THEN_C cnv3) ORELSE_C id_conv) tm;
	val cnv4 = LEFT_C (
		simple_eq_match_conv1 z'θ_def ORELSE_C
			RANDS_C (TRY_C (simple_eq_match_conv1 z'θ_def)));
	fun cnv5 tm =
	let
		val (vs, body) = strip_∃ tm;
		val (vws, t1) = wit_thm (dest_eq body);
		val ws = map (lassoc3 vws) vs;
		val t2 = list_simple_∃_intro ws tm t1;
	in	⇔_t_intro t2
	end;
=IGN
cnv5 ⌜∃ a1 a2 a3 a4 a5 a6 a7⦁ ⓩ(a1, a2, a3, (), (d ≜ a4, e ≜ a5, f ≜ a6), (g ≜ a7))⌝ = x⌝;
cnv5 ⌜∃ a1 a2 a3 a4 a5 a6 a7⦁ ⓩ(a3, a4, a1, (), (d ≜ a2, e ≜ a6, f ≜ a7), (g ≜ a5))⌝ = x⌝;
cnv5 ⓩ((), (d ≜ (), e ≜ (), f ≜ ()), (g ≜ ())) = x⌝;

=SML
	val cnv6 = simple_eq_match_conv1 (prove_rule[∈_u_thm]
		⌜{x|T} = ⓩ𝕌⌝⌝);
in
val ⦏decl_u_lang_conv⦎ : CONV = Z_DECL_C cnv1 THEN_C cnv3;
=GFT Example
val (d,p,v) = dest_z_∀ ⓩ∀ a,b : 𝕌; c : 𝕌; 𝕌 ⦂ ℙ []; 𝕌 ⦂ ℙ [d : ℤ] | true ⦁ true⌝;

decl_u_lang_conv d;
=TEX
=SML
fun ⦏seta_u_conv⦎ (tm : TERM) : THM = (
let	val (decl,pred,vl) = dest_z_seta tm;
	val s1 = simple_eq_match_conv1 (get_spec tm) tm;
	val s2 = conv_rule(RIGHT_C(TRY_C all_β_conv THEN_C
		pure_rewrite_conv [dpv_proj_thm] THEN_C
		(BINDER_C
		(ALL_SIMPLE_∃_C (
			(LEFT_C decl_u_lang_conv)
			THEN_C cnv2 THEN_C cnv2 THEN_TRY_C cnv4)))
			)) s1;
in
	conv_rule (RIGHT_C ((RAND_C (λ_C cnv5)) THEN_C cnv6)) s2
end);
=IGN
seta_u_conv ⓩ{ | true}⌝;
seta_u_conv ⓩ{a : 𝕌 | true}⌝;
seta_u_conv ⓩ{a, b : 𝕌; c : 𝕌}⌝;
seta_u_conv ⓩ{c, b : 𝕌; a : 𝕌}⌝;
seta_u_conv ⓩ{𝕌 ⦂ ℙ [] | true}⌝;
seta_u_conv ⓩ{𝕌 ⦂ ℙ [d : 𝕌] | true}⌝;
seta_u_conv ⓩ{a ,b : 𝕌; c : 𝕌; 𝕌 ⦂ ℙ []; 𝕌 ⦂ ℙ [d, e : 𝕌]; 𝕌 ⦂ ℙ []}⌝;
seta_u_conv ⓩ{a ,b : 𝕌; c : 𝕌; 𝕌 ⦂ ℙ []; 𝕌 ⦂ ℙ [d : 𝕌; e : 𝕌 ⦂ ℙ [e1, e2 : 𝕌]; 𝕌 ⦂ ℙ []; 𝕌 ⦂ ℙ [f : 𝕌]]; 𝕌 ⦂ ℙ [g : 𝕌]}⌝;

seta_u_conv ⓩ{a : 𝕌; a : 𝕌}⌝;  (* should fail: this is not 𝕌, it is ⓩ{a : 𝕌; b : 𝕌 | a = b}⌝! *)
seta_u_conv ⓩ{𝕌 ⦂ ℙ [d : 𝕌]; 𝕌 ⦂ ℙ [d : 𝕌] | true}⌝;  (* should fail: same reason as above *)
=TEX
=SML
fun ⦏decsexp_u_conv⦎ (tm : TERM) : THM = (
let	val (decl,pred) = dest_z_h_schema tm;
	val s1 = simple_eq_match_conv1 (get_spec tm) tm;
	val s2 = conv_rule(RIGHT_C(TRY_C all_β_conv THEN_C
		pure_rewrite_conv [dp_proj_thm] THEN_C
		(BINDER_C
			((LEFT_C decl_u_lang_conv)
			THEN_C cnv2)) THEN_C
		cnv6
		)) s1;
in
	s2
end);
=IGN
decsexp_u_conv ⓩ[]⌝;
decsexp_u_conv ⓩ[a : 𝕌; a : 𝕌]⌝;
decsexp_u_conv ⓩ[a, b : 𝕌; c : 𝕌; 𝕌 ⦂ ℙ []; 𝕌 ⦂ ℙ [d : ℤ]]⌝;
=TEX
=SML
end; (* local *)
=TEX
=SML
local
	val thm1 = prove_rule[∈_u_thm]
		⌜∀ x y ⦁ ⓩx ∈ 𝕌 ∧ y⌝ ⇔ y⌝;
	val cnv1 = simple_eq_match_conv1 thm1;
	val cnv2 = simple_eq_match_conv1 ∈_u_thm1;
	fun cnv3 tm = ((cnv1 THEN_C cnv3) ORELSE_C cnv2) tm;
	val cnv4 = simple_eq_match_conv1 (prove_rule[∈_u_thm]
		⌜{x|T} = ⓩ𝕌⌝⌝);
in
val ⦏×_u_conv⦎ : CONV = (fn tm =>
let	val dummy = dest_z_× tm;
	val s1 = simple_eq_match_conv1 (get_spec tm) tm;
	val s2 = conv_rule(RIGHT_C((BINDER_C cnv3) THEN_C cnv4)) s1;
in
	s2
end);
end;
=IGN
×_u_conv ⓩ𝕌 × 𝕌 × 𝕌 × 𝕌⌝;
=TEX
=SML
local
	val cnv1 = simple_eq_match_conv1 ℙ_u_thm;
	val cnv2 = simple_eq_match_conv1 ∈_u_thm1;
	val thm1 = prove_rule [z_⊆_thm1,∈_u_thm]
		⌜∀x:'a SET ⦁ ⓩ(⌜x:'a SET⌝ ⊆ 𝕌) = true⌝⌝;
	val cnv5 = simple_eq_match_conv1 thm1;
	val thm2 = prove_rule [z'schema_pred_def,∈_u_thm]
		⌜∀ x ⦁ $"Z'SchemaPred" x ⓩ𝕌⌝ ⇔ T⌝;
	val cnv6 = simple_eq_match_conv1 thm2;
	
	fun dest_z_⊆ tm = (
	let 	val (x,y) = dest_z_∈ tm;
		val dummy = case dest_z_term y of
			ZGVar("_ ⊆ _",_,_) => ()
			| _ => term_fail "dest_z_⊆" 0 [tm];
		val (a1,a2) = case dest_z_term x of
			ZTuple[a1,a2] => (a1,a2)
			| _ => term_fail "dest_z_⊆" 0 [tm];
	in
		(a1,a2)
	end);
in
val ⦏z_∈_u_conv⦎ : CONV = (fn tm =>
let	val cse = (dest_z_⊆ tm; 0)
		handle (Fail _) =>
		(dest_z_∈ tm; 1)
		handle (Fail _) =>
		(dest_z_schema_pred tm; 2)
		handle (Fail _) =>
		term_fail "z_∈_u_conv" 41062 [tm];
	val pc_u_simps = current_ad_nd_net "pp'u_simp";
	fun pc_u_simp_conv tm1 = FIRST_CHANGED_C(net_lookup pc_u_simps tm1) tm1;
	fun aux tm1 =
	((case dest_z_term tm1 of
	Zℙ _ => (RAND_C aux THEN_C cnv1) tm1
	| Z× _ => (RANDS_C aux THEN_C ×_u_conv) tm1
	| ZSeta _ => ((RAND_C(ALL_SIMPLE_λ_C(RATOR_C(LEFT_C
			(Z_DECL_C1 (DEC_TYPES_C aux))))))
		THEN_C seta_u_conv) tm1
	| ZHSchema _ =>(RAND_C (ALL_SIMPLE_λ_C(LEFT_C (Z_DECL_C1
			(DEC_TYPES_C aux)))) THEN_C decsexp_u_conv) tm1
	| ZGVar ("𝕌",_,_) => id_conv tm1
	| _ => fail "" 0 [])
	handle (Fail _) => (pc_u_simp_conv THEN_C aux) tm1);
in
	(case cse of
	0 => (LEFT_C(RAND_C aux) THEN_C cnv5) tm
	| 1 => (RIGHT_C aux THEN_C cnv2) tm
	| _ => (RIGHT_C aux THEN_C cnv6) tm)
	handle (Fail _) =>
	term_fail "z_∈_u_conv" 41061 [tm]
end);
end;
=GFT
z_∈_u_conv ⓩx ∈ 𝕌⌝;
z_∈_u_conv ⓩx ⊆ 𝕌⌝;
RIGHT_C z_∈_u_conv ⓩtrue ∧ [a: 𝕌]⌝;
z_∈_u_conv ⓩx ∈ ℙ 𝕌⌝;
z_∈_u_conv ⓩx ∈ ℙ (𝕌 × 𝕌)⌝;
z_∈_u_conv ⓩx ∈ {x:𝕌; y: 𝕌}⌝;
z_∈_u_conv ⓩx ∈ ℙ {x:𝕌; y: 𝕌 × 𝕌}⌝;
z_∈_u_conv ⓩx ∈ []⌝;
z_∈_u_conv ⓩx ∈ [[]]⌝;
z_∈_u_conv ⓩx ∈ [[]; [[]]]⌝;
z_∈_u_conv ⓩx ∈ [a ,b : 𝕌; c : 𝕌]⌝;
z_∈_u_conv ⓩx ∈ [a ,b : 𝕌; c : []]⌝;
z_∈_u_conv ⓩx ∈ ℙ (𝕌 × 𝕌) × [a ,b : 𝕌; c : 𝕌]⌝;
z_∈_u_conv ⓩ{x,y} ⊆ ℙ (𝕌 × 𝕌) × [a ,b : 𝕌; c : 𝕌]⌝;
RIGHT_C z_∈_u_conv ⓩtrue ∧ [a ,b : 𝕌 × [a ,b : 𝕌; c : 𝕌]; c : ℙ 𝕌]⌝;
z_∈_u_conv ⓩtrue⌝; (* fails *)
z_∈_u_conv ⓩx ∈ ℙ (𝕌 × X)⌝; (* fails *)
z_∈_u_conv ⓩ{x,y} ⊆ ℙ (𝕌 × X)⌝; (* fails *)
=TEX
=SML
local
	fun ftr thm = if is_z_power_type(type_of(fst(dest_eq(snd(strip_∀(concl thm))))))
		then thm_eqn_cxt thm
		else fail "" 0 [];
in	
fun ⦏u_simp_eqn_cxt⦎ (lst : THM list) : EQN_CXT = (
let	val cc = current_ad_rw_canon ();
	fun aux ((a :: x) :THM list) : EQN_CXT = (
	let	val ca = cc a;
		val fca = mapfilter ftr ca;
	in
		fca @ u_simp_eqn_cxt x
	end)
	| aux [] = [];
in
	aux lst
end);
end;
=TEX
=SML
local
	val au = ⓩ𝕌⌝;
	fun ftr thm = (
	let	val (l,r) = dest_eq(snd(strip_∀(concl thm)));
	in
		(term_match r au; thm_eqn_cxt thm)
		handle (Fail _) =>
		(term_match l au; thm_eqn_cxt (conv_rule (ONCE_MAP_C eq_sym_conv) thm))
	end);
in	
fun ⦏theory_u_simp_eqn_cxt⦎ (thy : string) : EQN_CXT = (
let	val thms = map snd (get_defns thy @ get_thms thy @ get_axioms thy)
		handle complaint =>
		pass_on complaint "get_defns" "theory_u_simp_eqn_cxt";
	val cc = current_ad_rw_canon ();
	fun aux ((a :: x) :THM list) : EQN_CXT = (
	let	val ca = cc a;
		val fca = mapfilter ftr ca;
	in
		fca @ aux x
	end)
	| aux [] = [];
in
	aux thms
end);
end;
=TEX
=SML
fun ⦏set_u_simp_eqn_cxt⦎ (ec : EQN_CXT) (pcn : string) : unit = (
	set_nd_entry "pp'u_simp" ec pcn
	handle complaint =>
	pass_on complaint "set_nd_entry" "set_u_simp_eqn_cxt"
);
=TEX
=SML
fun ⦏get_u_simp_eqn_cxt⦎ (pcn : string) : (EQN_CXT * string)list = (
	get_nd_entry "pp'u_simp" pcn
	handle complaint =>
	pass_on complaint "get_nd_entry" "get_u_simp_eqn_cxt"
);
=TEX
\subsection{Quantifiers}
=SML
local
	val cnv1 = simple_eq_match_conv1 z'∀_def;
	val cnv2 = simple_eq_match_conv1 z'∀_body_def;
	val cnv3 = simple_eq_match_conv1 (taut_rule⌜∀ x ⦁ T ∧ x ⇔ x⌝);
	fun cnv4 tm = ((cnv3 THEN_C cnv4) ORELSE_C id_conv) tm;
	val cnv5 = (simple_eq_match_conv1 (taut_rule⌜∀ x ⦁ T ⇒ x ⇔ x⌝) AND_OR_C
		simple_eq_match_conv1 (taut_rule⌜∀ x ⦁ F ⇒ x ⇔ T⌝) AND_OR_C
		simple_eq_match_conv1 (taut_rule⌜∀ x ⦁ x ⇒ F ⇔ ¬ x⌝) AND_OR_C
		simple_eq_match_conv1 (taut_rule⌜∀ x ⦁ x ⇒ T ⇔ T⌝) ORELSE_C
		id_conv);
in
val ⦏z_∀_elim_conv1⦎ :CONV = (fn tm =>
let	val cnv1' = (fn t => cnv1 t
		handle (Fail _) =>
		term_fail "z_∀_elim_conv1" 41022 [tm]);
	val cnv2' = (fn t => cnv2 t
		handle (Fail _) =>
		term_fail "z_∀_elim_conv1" 41022 [tm]);
	val cnv3' = (fn t => cnv3 t
		handle (Fail _) =>
		term_fail "z_∀_elim_conv1" 41071 [tm]);
in
	check_is_z_conv_result "z_∀_elim_conv1"
	((cnv1' THEN_C ALL_SIMPLE_∀_C (cnv2' THEN_C LEFT_C(LEFT_C
		((Z_DECL_C (z_dec_pred_conv THEN_C z_∈_u_conv)
		 ORELSE_C (fn tm1 => term_fail "z_∀_elim_conv1" 41071 [tm]))
		THEN_C cnv4)
		THEN_C cnv3')
		THEN_C cnv5))tm)
end);
end;
=GFT Example
z_∀_elim_conv1 ⓩ∀ a,b : 𝕌; [c,d:𝕌]; e:𝕌 | f ⦁ g⌝;
z_∀_elim_conv1 ⓩ∀ a,b : 𝕌; [c,d:𝕌]; e:𝕌 | true ⦁ g⌝;
z_∀_elim_conv1 ⓩ∀ a,b : 𝕌; [c,d:𝕌]; e:𝕌 | x ⦁ true⌝;
z_∀_elim_conv1 ⓩ∀ a,b : 𝕌; [c,d:𝕌]; e:𝕌 | true ⦁ false⌝;
=TEX
\section{Concerning Z Universal Quantification}
=SML
local
	val cnv1 = simple_eq_match_conv1 z'∀_def;
	val cnv2 = simple_eq_match_conv1 z'∀_body_def;
	val cnv3 = simple_eq_match_conv1 (eqn_sym_rule z'∀_body_def);
	val cnv4 = simple_eq_match_conv1 (eqn_sym_rule z'∀_def);

fun ⦏cnv5⦎ (recurring : bool) : CONV = (fn tm =>
let	val (vs,bdy) = strip_simple_∀ tm;
	val ((d,p),v) = (dest_∧ ** Combinators.I)(dest_⇒ bdy);
	val dbind =  dest_decl d;
	val vs' = map dest_var vs;
	val vnames = map fst vs';
in	if	vnames ~= (map fst dbind)
	then	let	val dummy = if all vs' (fn (nm,ty) => lassoc3 dbind nm =: ty)
				then ()
				else term_fail "z_∀_intro_conv1" 41024 [tm];
			val s1 = cnv3 bdy;
			val s2 = fold (fn (x,t) => ∀_⇔_rule x t) vs s1;
			val svs = var_sort vs';
			val rs2 = snd(dest_eq(concl s2));
			val rbs2 = snd(strip_simple_∀ rs2);
			val s3 = ∀_reorder_conv (list_mk_simple_∀ (svs,rbs2)) rs2;
			val s4 = eq_trans_rule s2 s3;
			val s5 = conv_rule(RIGHT_C cnv4) s4;
			val dummy = check_is_z_term "z_∀_intro_conv1"
				(snd(dest_eq(concl s5)));
		in
			s5
		end
	else if	not recurring
	then	let	val dec_rename⋎s_conv = #z_dec_rename⋎s_conv(!forward_references);
			val fix_conv = ALL_SIMPLE_∀_C (LEFT_C(LEFT_C(RAND_C
					(LIST_C (TRY_C dec_rename⋎s_conv)))))
					ORELSE_C (fn _ => term_fail "z_∀_intro_conv1" 41024 [tm]);
		in	(fix_conv THEN_C cnv5 true) tm
		end
	else	term_fail "z_∀_intro_conv1" 41024 [tm]
end	handle complaint =>
		list_divert complaint "z_∀_intro_conv1"
		[("dest_∧", 41023, [fn () => string_of_term tm]),
		("dest_⇒", 41023, [fn () => string_of_term tm]),
		("dest_decl", 41023, [fn () => string_of_term tm])]
);
in
val ⦏z_∀_elim_conv2⦎ :CONV =
	(cnv1 THEN_C ALL_SIMPLE_∀_C cnv2)
	ORELSE_C (fn tm =>
	term_fail "z_∀_elim_conv2" 41022 [tm]
	);
val ⦏z_∀_intro_conv1⦎ : CONV = cnv5 false;
end;
=TEX
Examples:
=GFT
val thm1 = z_∀_elim_conv2 ⓩ∀ z:X; x,y : ℕ  ⦁ (x = 0) ∨ (y = 0) ∨ (z = z)⌝;
val tmr = snd(dest_eq(concl thm1));
z_∀_intro_conv1 tmr;
val (d,p,v) = dest_z_∀ ⓩ∀ z:X; x,y : ℕ  ⦁ (x = 0) ∨ (y = 0) ∨ (z = z)⌝;
z_∀_intro_conv1 ⌜∀ x:ℤ⦁ ∀ z:'a⦁∀ y:ℤ ⦁ ⓜd⌝ ∧ ⓜp⌝ ⇒ ⓜv⌝⌝;
=TEX

Compose a list of type instantiations, checking that we
are not send one type variable to two different types.
=SML
local
	fun lrassoc5 ((a1,a2) :: x) v = (if a2 =: v
		then Value a1
		else lrassoc5 x v
	) | lrassoc5 [] v = Nil;
in
fun ⦏compose_tyi⦎ (tys : (TYPE * TYPE) list list) : (TYPE * TYPE) list = (
let	fun aux1 acc ((tyn,tyo) :: x) = (
		case lrassoc5 acc tyo of
		Nil => aux1 ((tyn,tyo) :: acc) x
		| Value tyn' => (if tyn =: tyn'
			then aux1 acc x
			else fail "compose_tyi" 0 [])
	) | aux1 acc [] = acc;

	fun aux acc [] = acc
	| aux acc (a :: x) = aux (aux1 acc a) x;
in
	aux [] tys
end);
end;
=TEX
If the type of the first, function, term, can be instantiated
to it can be applied to the second term,
then the instantiation is done, and the application made.
=SML
fun ⦏match_mk_app⦎(ftm:TERM, xtm:TERM) : TERM = (
let	val (fty1,_) = dest_→_type (type_of ftm);
	val tyinsts = type_match (type_of xtm) fty1 ;
in
	mk_app(inst [] tyinsts ftm, xtm)
end
handle complaint =>
list_divert complaint "match_mk_app"
	[("dest_→_type",3006,[fn () => string_of_term ftm]),
	 ("type_match",3005,[fn () => string_of_term ftm,
		fn () => string_of_term xtm])]);
=IGN
match_mk_app(⌜Fst⌝,⌜(T,F)⌝);
=TEX

The following copes with three forms of $bind$ -
a true binding, a single value, or an object with a binding type.
It returns the required specialisations and type instantiations for the decl.
=SML
fun ⦏match_decl_tm⦎ (caller : string) (decl : TERM) (tm: TERM)
	: (string * TERM) list * (TYPE * TYPE) list = (
let	val dbinds = dest_decl decl
		handle complaint =>
		pass_on complaint "dest_decl" caller;
	val dnms = map fst dbinds;
in
=TEX
Conventional binding:
=SML
(let	val tbinds = dest_z_binding tm;
	val dummy = if dnms ~= map fst tbinds
		then ()
		else fail "" 0 [];
	fun aux (nm,ty) = (
	let val v = lassoc3 tbinds nm;
		val tyi = type_match (type_of v) ty;
	in
		tyi
	end);
	val tys = map aux dbinds;
in
	(tbinds,compose_tyi tys)
end
handle (Fail _) =>
=TEX
Single variable in declaration:
=SML
	(case dbinds of
	[(nm,ty)] => ([(nm,tm)],type_match (type_of tm) ty)
	| _ => fail "" 0 [])
handle (Fail _) =>
=TEX
Term has a binding type:
=SML
let	val to_tm = type_of tm;
	val dbt_tm = dest_bind_type to_tm;
	val (_,projs) = get_binding_info to_tm;
	val projs' = map (fn f => match_mk_app(f,tm)) projs;
	val tbinds = combine(fst (split dbt_tm)) projs';
	val dummy = if dnms ~= map fst tbinds
		then ()
		else fail "" 0 [];
	fun aux (nm,ty) = (
	let val v = lassoc3 tbinds nm;
		val tyi = type_match (type_of v) ty;
	in
		tyi
	end);
	val tys = map aux dbinds;
in
	(tbinds,compose_tyi tys)
end
handle (Fail _) =>
term_fail caller 41021 [tm,decl]
)
end);
=TEX
Tests:
=GFT
val (d,_,_) = dest_z_∀ ⓩ∀x,y : Z; z : Y ⦁ true⌝;
val (d1,_,_) = dest_z_∀ ⓩ∀x : Z⦁ true⌝;
val tm1 = ⓩ(y ≜ 1, x ≜ 2, z ≜ y)⌝;

match_decl_tm "hello" d tm1;
match_decl_tm "hello" d (mk_var("B",type_of tm1));
match_decl_tm "hello" d1 ⌜1⌝;
=TEX
=SML
fun ⦏∀_elim_by_template⦎ (template : (string * TERM)list)(thm : THM) : THM = (
let	val (vs,_) = strip_simple_∀ (concl thm);
	val exps = map (lassoc3 template) (map (fst o dest_var) vs);
in
	list_simple_∀_elim exps thm
end);
=SML
local
	val cnv1 = simple_eq_match_conv1 z'∀_def;
	val cnv2 = simple_eq_match_conv1 z'∀_body_def;
in
fun ⦏z_∀_elim⦎ (tm : TERM) (thm : THM) : THM = (
let	val (d,p,v) = dest_z_∀ (concl thm)
		handle complaint =>
		pass_on complaint "dest_z_∀" "z_∀_elim";
	val (specs,insts) = match_decl_tm "z_∀_elim" d tm;
	val s1 = conv_rule cnv1 thm;
	val s2 = inst_type_rule insts s1
		handle complaint =>
		pass_on complaint "inst_type_rule" "z_∀_elim";
	val s3 = ∀_elim_by_template specs s2;
	val s4 = conv_rule cnv2 s3;
	val s5 = conv_rule (LEFT_C(LEFT_C  z_decl_pred_conv)) s4;
	val s6 = check_is_z_thm "z_∀_elim" s5;
		(* should actually make any renaming changes
		   the declaration to the thm *)
in
	s6
end);
end;
=TEX
=GFT
z_∀_elim ⓩ(x ≜ ⌜q:'a⌝, y ≜ ⌜r:'b⌝, z ≜ ⌜p:'a⌝)⌝
	(asm_ruleⓩ∀ x:X; y:Y; z:X | f x ⦁ g y z⌝);

z_∀_elim  ⓩ(x ≜ ⌜q:'a⌝, y ≜ ⌜r:'b⌝, z ≜ ⌜p:'a⌝)⌝
	(asm_rule ⓩ∀ x:X; y:Y; z:X | f x ⦁ g ⌜a + b⌝ z⌝);
=TEX
=SML
local
	val sym_z'∀_body_def = eqn_sym_rule z'∀_body_def;
	val sym_z'∀_def = eqn_sym_rule z'∀_def;
	val cnv1 = simple_eq_match_conv1
		(taut_rule ⌜∀ x y ⦁ (x ⇒ y) ⇔ ((x ∧ T) ⇒ y)⌝);
in
fun ⦏z_∀_intro1⦎ (thm : THM) : THM = (
let	val (dp,v) = dest_⇒ (concl thm)
		handle complaint =>
		divert complaint "dest_⇒" "z_∀_intro1"
			41026 [fn () => string_of_thm thm];
	val (d,p) = dest_∧ dp
		handle complaint =>
		divert complaint "dest_∧" "z_∀_intro1"
			41026 [fn () => string_of_thm thm];
	val s1 = conv_rule (LEFT_C(LEFT_C  z_pred_decl_conv)) thm
		handle (Fail _) =>
		term_fail "z_∀_intro1" 41027 [d];
	val ((d',_),_) = (dest_∧ ** Combinators.I)(dest_⇒ (concl s1));
	val dest_vs = dest_decl d';
	val s2 = ⇔_mp_rule (list_simple_∀_elim[d',p,v]
		sym_z'∀_body_def) s1;
	val sl = idsetseq(fst(split dest_vs));
	val vs = map (fn nm => mk_var(nm,lassoc3 dest_vs nm)) sl;
	val s3 = list_simple_∀_intro vs s2
		handle complaint =>
		pass_on complaint "list_simple_∀_intro" "z_∀_intro1";
	val s4 = ⇔_mp_rule  (simple_∀_elim(concl s3) sym_z'∀_def) s3;
in
	check_is_z_thm "z_∀_intro1" s4
end)
end;
=TEX
Examples
=GFT
let val tm1 = ⓩ((x ∈ W ∧ y ∈ X) ∧ (w ∈ Y) ∧ (z ∈ Z)) ∧ f x ⇒ g w y z⌝
in
z_∀_intro1 (all_∀_elim (asm_rule
	(list_mk_∀(frees tm1, tm1))
	))
end;

z_∀_intro1 (all_∀_elim (asm_rule
	⌜∀ w x z ⦁
	((x ∈ W ∧ y ∈ X) ∧ (w ∈ Y) ∧ (z ∈ Z)) ∧ f x ⇒ g w y z⌝)); (* fails *)

=TEX
Our strategy in the following is to get something that
$z\_∀\_intro1$ will accept (perhaps) and then call that.
=SML
local
	val tya = ⓣ'a⌝;
	fun mk_∈_u tm = mk_z_∈(tm,inst [][(type_of tm,tya)] Ua);
	val thm1 = prove_rule[]⌜∀ d d' p v ⦁
		(d ∧ p ⇒ v) ⇒ ((d ∧ d') ∧ p ⇒ v)⌝;
	val thm2 = prove_rule[]⌜∀ dp d' v ⦁
		(dp ⇒ v) ⇒ (d' ∧ dp ⇒ v)⌝;
	val thm3 = prove_rule[]⌜∀ d' v ⦁
		(v) ⇒ (d' ∧ T ⇒ v)⌝;
in
fun ⦏z_∀_intro⦎ (tml: TERM list) (thm : THM) : THM = ((
let 	val cthm = concl thm;
	val dummy = map dest_var tml
		handle complaint =>
		pass_on complaint "dest_var" "z_∀_intro";
	val tml_∈ = if is_nil tml
		then mk_z_true
		else (list_mk_∧(map mk_∈_u tml));
in
	if is_⇒ cthm
	then (let val (dp,v) = dest_⇒ cthm;
	in
		z_∀_intro1 (⇒_elim(list_∀_elim[dp,tml_∈,v] thm2) thm)	
	end)
	else
	(z_∀_intro1 (⇒_elim(list_∀_elim[tml_∈,cthm] thm3) thm))
end)
handle complaint =>
pass_on complaint "z_∀_intro1" "z_∀_intro");
end;
=TEX
=GFT
z_∀_intro [ⓩx1⌝,ⓩp⌝] (all_∀_elim (asm_rule
	⌜∀ w x1 y z p ⦁
	((x1 ∈ W ∧ y ∈ X) ∧ (w ∈ Y) ∧ (z ∈ Z)) ∧ f p x ⇒ g w y z⌝));
z_∀_intro [ⓩx1⌝,ⓩp⌝] (all_∀_elim (asm_rule
	⌜∀ w x y z ⦁
	f x ⇒ g w y z⌝));
z_∀_intro [ⓩx1⌝,ⓩp⌝] (all_∀_elim (asm_rule
	⌜∀ x1 w y z p ⦁
	g x1 w y z p⌝));
=TEX
In the following we know we drop out of Z temporarily, and protect
against warnings of such.
=SML
local
fun Z_∀_V_C cnv = RAND_C(ALL_SIMPLE_∀_C(RIGHT_C cnv));
val cnv1 = simple_eq_match_conv1 comb_i_def;
in
fun ⦏all_z_∀_intro⦎ (thm : THM) : THM = (
let	val (asms,conc) = dest_thm thm;
	val fs = rev(frees conc term_diff (flat(map frees asms)));
	val () = if is_nil fs then fail "" 0 [] else ();
	val thm1 = ⇔_mp_rule (eq_sym_rule(∀_elim conc comb_i_def)) thm;
	val ciz = set_check_is_z false;
	val thm2 = z_∀_intro fs thm1;
	val _ = set_check_is_z ciz;
	val thm3 = conv_rule (Z_∀_V_C cnv1) thm2
in
	check_is_z_thm "all_z_∀_intro" thm3
end
handle (Fail _) => thm);
end;
=TEX
=GFT
all_z_∀_intro (refl_conv ⓩ(x,y)⌝);
all_z_∀_intro (⇒_intro ⓩa ∧ b⌝ (asm_rule ⓩa ∧ b⌝));
=SML
local
val cnv1 = simple_eq_match_conv1 (taut_rule ⌜∀ t ⦁ (t ⇔ (T ⇒ t)) ⇔ T⌝);
val cnv2 = simple_eq_match_conv1 (taut_rule ⌜∀ t ⦁ F ⇒ t ⇔ T⌝);
val thm1 = conv_rule(ALL_SIMPLE_∀_C (RIGHT_C (rewrite_conv[])))
	(simple_∀_intro ⌜d:BOOL⌝
	(list_simple_∀_elim[⌜d:BOOL⌝, mk_f] z'∀_body_def));
val cnv3 = simple_eq_match_conv1 thm1;
val tac1 = pure_rewrite_tac[z'∀_def,∀_rewrite_thm,
	eq_rewrite_thm];
val cnv4 = simple_eq_match_conv1 (taut_rule ⌜∀ t ⦁ (t ⇔ (t ∨ F)) ⇔ T⌝);
val cnv5 = simple_eq_match_conv1 (taut_rule ⌜∀ t ⦁ t ∨ T ⇔ T⌝);
val thm2 = conv_rule(ALL_SIMPLE_∀_C (RIGHT_C (rewrite_conv[])))
	(list_simple_∀_intro [⌜d:BOOL⌝,⌜p:BOOL⌝]
	(list_simple_∀_elim[⌜d:BOOL⌝, ⌜p:BOOL⌝, mk_t] z'∀_body_def));
val cnv6 = simple_eq_match_conv1 thm2;
val cnv7 = simple_eq_match_conv1 (taut_rule ⌜∀ s t ⦁ (t ⇒ (s ∨ T)) ⇔ T⌝);
val cnv8 = simple_eq_match_conv1 (taut_rule ⌜∀ t ⦁ (t ⇔ (T ⇒ (t ∨ F))) ⇔ T⌝);
fun Z_∀_P_C cnv = RAND_C(ALL_SIMPLE_∀_C(LEFT_C cnv));
fun Z_∀_V_C cnv = RAND_C(ALL_SIMPLE_∀_C(RIGHT_C cnv));

fun cnv9 thm = APP_C(RAND_C(Z_∀_P_C(fn _ => thm)),(LEFT_C(fn _ => thm)));
fun cnv10 thm = APP_C(RAND_C(Z_∀_V_C(fn _ => thm)),(RIGHT_C(fn _ => thm)));
fun cnv11 thm = APP_C(RAND_C(Z_∀_V_C(fn _ => thm)),
	RIGHT_C(RIGHT_C(fn _ => thm)));

in
val ⦏z_∀_inv_conv⦎ : CONV = (fn tm =>
let	val (d,p,v) = dest_z_∀ tm
		handle complaint =>
		pass_on complaint "dest_z_∀" "z_∀_inv_conv";
	val vs = fst(strip_simple_∀(snd(dest_app tm)));
in
	check_is_z_thm "z_∀_inv_conv"
	(case (any (frees p) (fn x => x term_mem vs) orelse (is_t p),
		any (frees v) (fn x => x term_mem vs) orelse (is_f v)) of
 	(true, true) => term_fail "z_∀_inv_conv" 41025 [tm]
	| (false, true) => tac_proof(([],mk_eq(tm,
			mk_⇒(p,mk_z_∀(d,mk_t,v)))),
		∨_THEN (conv_tac o cnv9) (∀_elim p bool_cases_axiom)
		THEN_LIST [
		conv_tac cnv1,
		conv_tac(APP_C ((RAND_C(RAND_C(ALL_SIMPLE_∀_C cnv3))), cnv2))
		THEN tac1] )
	| (true, false) =>  tac_proof(([],mk_eq(tm,
			mk_∨(mk_z_∀(d,p,mk_f),v))),
		∨_THEN (conv_tac o cnv10) (∀_elim v bool_cases_axiom)
		THEN_LIST [
		conv_tac(APP_C ((RAND_C(RAND_C(ALL_SIMPLE_∀_C cnv6))), cnv5))
		THEN tac1,
		conv_tac cnv4] )
	| (false,false) => tac_proof(([],mk_eq(tm,
			mk_⇒(p,mk_∨(mk_z_∀(d,mk_t,mk_f),v)))),
		∨_THEN (conv_tac o cnv9) (∀_elim p bool_cases_axiom) THEN
		∨_THEN (conv_tac o cnv11) (∀_elim v bool_cases_axiom)
		THEN_LIST [
		conv_tac(APP_C(RAND_C(RAND_C(ALL_SIMPLE_∀_C cnv6)), cnv7))
		THEN tac1,
		conv_tac cnv8,
		conv_tac(APP_C(RAND_C(RAND_C(ALL_SIMPLE_∀_C cnv6)), cnv7))
		THEN tac1,
		conv_tac(APP_C(RAND_C(RAND_C(ALL_SIMPLE_∀_C cnv3)), cnv2))
		THEN tac1		
		]))
end);
end;
=TEX
Examples:
=GFT
z_∀_inv_conv ⓩ∀ x ,y : X | f ⦁ g⌝;
z_∀_inv_conv ⓩ∀ x ,y : X | x > 0 ⦁ z⌝;
z_∀_inv_conv ⓩ∀ x,y : X | f ⦁ x = y⌝;
z_∀_inv_conv ⓩ∀ x,y : X ⦁ g⌝;
z_∀_inv_conv ⓩ∀ x,y : X | f⦁ false⌝;
=TEX

=SML
local
	fun ct args = (
	let	val ciz = set_check_is_z false;
		val res = conv_tac z_∀_intro_conv1 args;
		val _ = set_check_is_z ciz;
	in
		res
	end);	
in
fun ⦏z_intro_∀_tac⦎ (d: TERM) : TACTIC = (fn (asms,cnc) =>
let	val binds = (dest_z_binding d);
	val new_vars = gen_vars (map (type_of o snd) binds)
		(cnc :: asms);
	val proper_vars = map (fn (nm,bd) => mk_var(nm,type_of bd)) binds;
	val decl_as_pred_thm =
		case new_vars of
			_::_	=>
				list_∧_intro
				(map (fn x => ∀_elim x ∈_u_thm) new_vars)
		|	[]	=> t_thm;
	val decl_as_pred_thm' = conv_rule z_pred_decl_conv
		decl_as_pred_thm;
	val decl_as_pred_thm'' = ∧_intro decl_as_pred_thm' t_thm;
	val i∀_arg = map (fn ((x,y),b) => (y,b)) (combine binds new_vars);
	val i∀_arg1 = combine new_vars proper_vars;
in
	CHECK_IS_Z_T "z_intro_∀_tac"
	(MAP_EVERY intro_∀_tac i∀_arg THEN
	MAP_EVERY (fn _ => simple_∀_tac) i∀_arg THEN
	ante_tac decl_as_pred_thm'' THEN
	MAP_EVERY intro_∀_tac i∀_arg1 THEN
	ct)
	(asms,cnc)
end
handle complaint =>
if area_of complaint = "dest_z_binding"
then term_fail "z_intro_∀_tac" 41029 [d]
else pass_on complaint "intro_∀_tac" "z_intro_∀_tac"
);
end;
=GFT Examples
push_goal([],ⓩa ∧ b ∧ c⌝);
a(z_intro_∀_tac ⓩ(d ≜ ⌜b:BOOL⌝, e ≜ ⌜a:BOOL⌝)⌝);
undo 1;
a(z_intro_∀_tac ⓩ(c ≜ ⌜b:BOOL⌝, b ≜ ⌜c:BOOL⌝)⌝);
drop_main_goal();
(* To demonstrate wrecking a binding *)
push_goal([],ⓩ[X] a ∧ b ∧ [p,q:X| p = q]⌝);
a(z_intro_∀_tac ⓩ[X] (c ≜ b, d ≜ (p⦂X))⌝);
drop_main_goal();
=TEX
=SML
local
	val t_∧_t_thm = taut_rule ⌜T ∧ T ⇔ T⌝;
	val cnv1 = pure_rewrite_conv [t_∧_t_thm];
in
val ⦏z_∀_intro_conv⦎ : CONV = (fn tm =>
let	val (xs,bdy) = strip_simple_∀ tm;
	val dummy = if is_nil xs
		then term_fail "z_∀_intro_conv" 41047 [tm]
		else ();
	val Us = map (fn x => inst [] [(type_of x,ⓣ'a⌝)] Ua) xs;
	val decls = mk_z_decl(map (fn (x,y) => mk_z_dec([x],y))(combine xs Us));
	val s1 = (Z_DECL_C(z_dec_pred_conv THEN_C z_∈_u_conv) THEN_C
		TRY_C cnv1) decls;
	val s2 = taut_rule (mk_eq(bdy,(mk_⇒(mk_∧(mk_t,mk_t),bdy))));
	val s3 = conv_rule(RIGHT_C(LEFT_C(LEFT_C(fn _ => eq_sym_rule s1)))) s2;
	val s4 = ALL_SIMPLE_∀_C(fn _ => s3) tm;
	val s5 = conv_rule (RIGHT_C z_∀_intro_conv1) s4;
in
	check_is_z_conv_result "z_∀_intro_conv"
	(eq_trans_rule (refl_conv tm) s5)
end);
end;
=IGN
z_∀_intro_conv ⌜∀ a b c ⦁ⓩp a b c⌝⌝;
=TEX

\section{Concerning Z Existential Quantification}
=SML
local
val cnv1 = simple_eq_match_conv1 (taut_rule ⌜∀ t ⦁ (t ⇔ (T ∧ t)) ⇔ T⌝);
val cnv2 = simple_eq_match_conv1 (taut_rule ⌜∀ t ⦁ F ∧ t ⇔ F⌝);
val thm1 = conv_rule(ALL_SIMPLE_∀_C (RIGHT_C (rewrite_conv[])))
	(simple_∀_intro ⌜d:BOOL⌝
	(list_simple_∀_elim[⌜d:BOOL⌝, mk_f] z'∃_body_def));
val cnv3 = simple_eq_match_conv1 thm1;
val tac1 = pure_rewrite_tac[z'∃_def,∃_rewrite_thm,
	eq_rewrite_thm];
val cnv4 = simple_eq_match_conv1 (taut_rule ⌜∀ t ⦁ (t ⇔ (t ∧ T)) ⇔ T⌝);
val cnv5 = simple_eq_match_conv1 (taut_rule ⌜∀ t ⦁ t ∧ F ⇔ F⌝);
val thm2 = conv_rule(ALL_SIMPLE_∀_C (RIGHT_C (rewrite_conv[])))
	(list_simple_∀_intro [⌜d:BOOL⌝,⌜p:BOOL⌝]
	(list_simple_∀_elim[⌜d:BOOL⌝, ⌜p:BOOL⌝, mk_f] z'∃_body_def));
val cnv6 = simple_eq_match_conv1 thm2;
val cnv7 = simple_eq_match_conv1 (taut_rule ⌜∀ s t ⦁ (t ∧ s ∧ F) ⇔ F⌝);
val cnv8 = simple_eq_match_conv1 (taut_rule ⌜∀ t ⦁ (t ⇔ (T ∧ t ∧ T)) ⇔ T⌝);
fun Z_∃_P_C cnv = RAND_C(ALL_SIMPLE_∃_C(LEFT_C cnv));
fun Z_∃_V_C cnv = RAND_C(ALL_SIMPLE_∃_C(RIGHT_C cnv));

fun cnv9 thm = APP_C(RAND_C(Z_∃_P_C(fn _ => thm)),(LEFT_C(fn _ => thm)));
fun cnv10 thm = APP_C(RAND_C(Z_∃_V_C(fn _ => thm)),(RIGHT_C(fn _ => thm)));
fun cnv11 thm = APP_C(RAND_C(Z_∃_V_C(fn _ => thm)),
		RIGHT_C(RIGHT_C(fn _ => thm)));

in
val ⦏z_∃_inv_conv⦎ : CONV = (fn tm =>
let	val (d,p,v) = dest_z_∃ tm
		handle complaint =>
		pass_on complaint "dest_z_∃" "z_∃_inv_conv";
	val vs = fst(strip_simple_∃(snd(dest_app tm)));
in
	check_is_z_thm "z_∃_inv_conv" (
	case (any (frees p) (fn x => x term_mem vs) orelse  (is_t p),
		any (frees v) (fn x => x term_mem vs) orelse (is_t v)) of
 	(true, true) => term_fail "z_∃_inv_conv" 41040 [tm]
	| (false, true) => tac_proof(([],mk_eq(tm,
			mk_∧(p,mk_z_∃(d,mk_t,v)))),
		∨_THEN (conv_tac o cnv9) (∀_elim p bool_cases_axiom)
		THEN_LIST [
		conv_tac cnv1,
		conv_tac(APP_C ((RAND_C(RAND_C(ALL_SIMPLE_∃_C cnv3))), cnv2))
		THEN tac1] )
	| (true, false) =>  tac_proof(([],mk_eq(tm,
			mk_∧(mk_z_∃(d,p,mk_t),v))),
		∨_THEN (conv_tac o cnv10) (∀_elim v bool_cases_axiom)
		THEN_LIST [
		conv_tac cnv4,
		conv_tac(APP_C ((RAND_C(RAND_C(ALL_SIMPLE_∃_C cnv6))), cnv5))
		THEN tac1] )
	| (false,false) => tac_proof(([],mk_eq(tm,
			mk_∧(p,mk_∧(mk_z_∃(d,mk_t,mk_t),v)))),
		∨_THEN (conv_tac o cnv9) (∀_elim p bool_cases_axiom) THEN
		∨_THEN (conv_tac o cnv11) (∀_elim v bool_cases_axiom)
		THEN_LIST [
		conv_tac cnv8,
		conv_tac(APP_C(RAND_C(RAND_C(ALL_SIMPLE_∃_C cnv6)), cnv7))
		THEN tac1,
		conv_tac(APP_C(RAND_C(RAND_C(ALL_SIMPLE_∃_C cnv3)), cnv2))
		THEN tac1,
		conv_tac(APP_C(RAND_C(RAND_C(ALL_SIMPLE_∃_C cnv6)), cnv7))
		THEN tac1
		]))
end);
end;
=TEX
=IGN
Examples:
z_∃_inv_conv ⓩ∃ x ,y : X | f ⦁ g⌝;
z_∃_inv_conv ⓩ∃ x ,y : X | x > 0 ⦁ z⌝;
z_∃_inv_conv ⓩ∃ x,y : X | f ⦁ x = y⌝;
=TEX
=SML
local
	val cnv1 = simple_eq_match_conv1 z'∃_def;
	val cnv2 = simple_eq_match_conv1 z'∃_body_def;
	val cnv3 = simple_eq_match_conv1 (eqn_sym_rule z'∃_body_def);
	val cnv4 = simple_eq_match_conv1 (eqn_sym_rule z'∃_def);

fun ⦏cnv5⦎ (recurring : bool) : CONV = (fn tm =>
let	val (vs,bdy) = strip_simple_∃ tm;
	val (d,(p,v)) = (Combinators.I ** dest_∧)(dest_∧ bdy)
		handle complaint =>
		divert complaint "dest_∧" "z_∃_intro_conv1"  41045
			[fn () => string_of_term tm];
	val dbind =  dest_decl d;
	val vs' = map dest_var vs;
	val vnames = map fst vs';
in	if	vnames ~= (map fst dbind)
	then	let	val dummy = if all vs' (fn (nm,ty) => lassoc3 dbind nm =: ty)
				then ()
				else term_fail "z_∃_intro_conv1" 41041 [tm];
			val s1 = cnv3 bdy;
			val s2 = fold (fn (x,t) => ∃_⇔_rule x t) vs s1;
			val svs = var_sort vs';
			val rs2 = snd(dest_eq(concl s2));
			val rbs2 = snd(strip_simple_∃ rs2);
			val s3 = ∃_reorder_conv (list_mk_simple_∃ (svs,rbs2)) rs2;
			val s4 = eq_trans_rule s2 s3;
			val s5 = conv_rule(RIGHT_C cnv4) s4;
			val dummy = check_is_z_term "z_∃_intro_conv1" (snd(dest_eq(concl s5)));
		in
			s5
		end
	else if	not recurring
	then	let	val dec_rename⋎s_conv = #z_dec_rename⋎s_conv(!forward_references);
			val fix_conv = ALL_SIMPLE_∃_C (LEFT_C(RAND_C
					(LIST_C (TRY_C dec_rename⋎s_conv))))
					ORELSE_C (fn _ => term_fail "z_∃_intro_conv1" 41041 [tm]);
		in	(fix_conv THEN_C cnv5 true) tm
		end
	else term_fail "z_∃_intro_conv1" 41041 [tm]
end);

in
val ⦏z_∃_elim_conv2⦎ :CONV =
	(cnv1 THEN_C ALL_SIMPLE_∃_C cnv2)
	ORELSE_C (fn tm =>
	term_fail "z_∃_elim_conv2" 41044 [tm]);
val ⦏z_∃_intro_conv1⦎ : CONV = cnv5 false;
end;
=IGN
Examples:
val thm1 = z_∃_elim_conv2 ⓩ∃ z:X; x,y : ℕ  ⦁ (x = 0) ∨ (y = 0) ∨ (z = z)⌝;
val tmr = snd(dest_eq(concl thm1));
z_∃_intro_conv1 tmr;
val (d,p,v) = dest_z_∃ ⓩ∃ z:X; x,y : ℕ  ⦁ (x = 0) ∨ (y = 0) ∨ (z = z)⌝;
z_∃_intro_conv1 ⌜∃ x:ℤ⦁ ∃ z:'a⦁∃ y:ℤ ⦁ ⓜd⌝ ∧ ⓜp⌝ ∧ ⓜv⌝⌝;
=TEX
=SML
val ⦏z_∃_elim_conv⦎ :CONV = (fn tm =>
	((z_∃_elim_conv2 THEN_C ALL_SIMPLE_∃_C(LEFT_C z_decl_pred_conv))
	tm)
	handle complaint =>
	pass_on complaint "z_∃_elim_conv2" "z_∃_elim_conv"
);
=IGN
z_∃_elim_conv ⓩ∃ z:X; x,y : ℕ  ⦁ (x = 0) ∨ (y = 0) ∨ (z = z)⌝;
=TEX
=SML
local
	val t_∧_t_thm = taut_rule ⌜T ∧ T ⇔ T⌝;
in
val ⦏z_∃_intro_conv⦎ : CONV = (fn tm =>
let	val (xs,bdy) = strip_simple_∃ tm;
	val dummy = if is_nil xs
		then term_fail "z_∃_intro_conv" 41046 [tm]
		else ();
	val Us = map (fn x => inst [] [(type_of x,ⓣ'a⌝)] Ua) xs;
	val decls = mk_z_decl(map (fn (x,y) => mk_z_dec([x],y))(combine xs Us));
	val s1 = (Z_DECL_C(z_dec_pred_conv THEN_C z_∈_u_conv) THEN_C
		TRY_C(pure_rewrite_conv [t_∧_t_thm])) decls;
	val s2 = taut_rule (mk_eq(bdy,(mk_∧(mk_t,mk_∧(mk_t,bdy)))));
	val s3 = conv_rule(RIGHT_C(LEFT_C(fn _ => eq_sym_rule s1))) s2;
	val s4 = ALL_SIMPLE_∃_C(fn _ => s3) tm;
	val s5 = conv_rule (RIGHT_C z_∃_intro_conv1) s4;
in
	check_is_z_conv_result "z_∃_intro_conv"
	(eq_trans_rule (refl_conv tm) s5)
end);
end;
=TEX
=SML

local
	val cnv1 = simple_eq_match_conv1 z'∃_def;
	val cnv2 = simple_eq_match_conv1 z'∃_body_def;
	val cnv3 = simple_eq_match_conv1 (taut_rule⌜∀ x ⦁ T ∧ x ⇔ x⌝);
	fun cnv4 tm = ((cnv3 THEN_C cnv4) ORELSE_C id_conv) tm;
	val cnv5 = cnv3 AND_OR_C
		simple_eq_match_conv1 (taut_rule⌜∀ x ⦁ x ∧ T ⇔ x⌝) AND_OR_C
		simple_eq_match_conv1 (taut_rule⌜∀ x ⦁ F ∧ x ⇔ F⌝) AND_OR_C
		simple_eq_match_conv1 (taut_rule⌜∀ x ⦁ x ∧ F ⇔ F⌝) ORELSE_C
		id_conv
in
val ⦏z_∃_elim_conv1⦎ :CONV = (fn tm =>
let	val cnv1' = (fn t => cnv1 t
		handle (Fail _) =>
		term_fail "z_∃_elim_conv1" 41042 [tm]);
	val cnv2' = (fn t => cnv2 t
		handle (Fail _) =>
		term_fail "z_∃_elim_conv1" 41042 [tm]);
	val cnv3' = (fn t => cnv3 t
		handle (Fail _) =>
		term_fail "z_∃_elim_conv1" 41043 [tm]);
in
	((cnv1' THEN_C ALL_SIMPLE_∃_C (cnv2' THEN_C LEFT_C
		((Z_DECL_C (z_dec_pred_conv THEN_C z_∈_u_conv)
		 ORELSE_C (fn tm1 => term_fail "z_∃_elim_conv1" 41043 [tm]))
		THEN_C cnv4)
		THEN_C cnv3'
		THEN_C cnv5))tm)
end);
end;
=IGN
z_∃_elim_conv1 ⓩ∃ a,b : 𝕌; [c,d:𝕌]; e:𝕌 | f ⦁ g⌝;
z_∃_elim_conv1 ⓩ∃ a,b : 𝕌; [c,d:𝕌]; e:𝕌  ⦁ g⌝;
=TEX
The following copes with three forms of $bind$ -
a true binding, a single value, or an object with a binding type.
It returns the association of names to required type instantiated terms.
It is very similar to $match\_decl\_tm$ above.
=SML
fun ⦏match_tm_decl⦎ (caller : string) (decl : TERM) (tm: TERM) :
		(string * TERM) list = (
let	val dbinds = dest_decl decl
		handle complaint =>
		pass_on complaint "dest_decl" caller;
	val dnms = map fst dbinds;
in
=TEX
Conventional binding:
=SML
(let	val tbinds = dest_z_binding tm;
	val dummy = if dnms ~= map fst tbinds
		then ()
		else fail "" 0 [];
	fun aux (nm,ty) = (
	let val v = lassoc3 tbinds nm;
		val tyi = type_match ty (type_of v);
	in
		tyi
	end);
	val tys = map aux dbinds;
	val ctys = compose_tyi tys;
in
	if is_nil ctys
	then tbinds
	else map (fn (nm,tm) => (nm, inst [] ctys tm)) tbinds
end
handle (Fail _) =>
=TEX
Single variable in declaration:
=SML
	(case dbinds of
	[(nm,ty)] => (let val tyms = (type_match ty (type_of tm))
		in
			if is_nil tyms
			then [(nm,tm)]
			else [(nm,inst [] tyms tm)]
		end)
	| _ => fail "" 0 [])
handle (Fail _) =>
=TEX
Term has a binding type:
=SML
let	val to_tm = type_of tm;
	val dbt_tm = dest_bind_type to_tm;
	val (_,projs) = get_binding_info to_tm;
	val projs' = map (fn f => match_mk_app(f,tm)) projs;
	val tbinds = combine(fst (split dbt_tm)) projs';
	val dummy = if dnms ~= map fst tbinds
		then ()
		else fail "" 0 [];
	fun aux (nm,ty) = (
	let val v = lassoc3 tbinds nm;
		val tyi = type_match ty (type_of v);
	in
		tyi
	end);
	val tys = map aux dbinds;
	val ctys = compose_tyi tys;
in
	if is_nil ctys
	then tbinds
	else map (fn (nm,tm) => (nm, inst [] ctys tm)) tbinds
end
handle (Fail _) =>
term_fail caller 41021 [tm,decl]
)
end);
=TEX
=GFT Examples
val (d,_,_) = dest_z_∀ ⓩ∀x,y : ℕ; z : X ⦁ true⌝;
val (d1,_,_) = dest_z_∀ ⓩ∀x : ℤ ⦁ true⌝;
val tm1 = ⓩ(y ≜ ⌜a:'a⌝, x ≜ 1, z ≜ ⌜b:'a⌝)⌝;
fun aux (nm,tm) = (nm,tm,type_of tm);
map aux (match_tm_decl "hello" d tm1);
map aux (match_tm_decl "hello" d (mk_var("B",type_of tm1)));
map aux (match_tm_decl "hello" d1 ⓩ1⌝);
=TEX
=SML
fun ⦏∃_by_template_tac⦎ (template : (string * TERM)list) :TACTIC = (
fn (asms,conc) =>
let	val (xs,bdy) = strip_simple_∃ conc;
	val wits = map (fn x => lassoc3 template (fst(dest_var x))) xs;
in
	if is_nil xs
	then id_tac (asms,conc)
	else list_simple_∃_tac wits (asms,conc)
end);
=SML
local
	val cnv1 = simple_eq_match_conv1 z'∃_def;
	val cnv2 = simple_eq_match_conv1 z'∃_body_def;
in
fun ⦏z_∃_tac⦎ (tm : TERM): TACTIC = (fn (asms,conc) =>
let	val (d,p,v) = dest_z_∃ conc
		handle complaint =>
		pass_on complaint "dest_z_∃" "z_∃_tac";
	val wittemp = match_tm_decl "z_∃_tac" d tm;
in
	CHECK_IS_Z_T "z_∃_tac" (conv_tac cnv1 THEN
	∃_by_template_tac wittemp THEN
	conv_tac cnv2 THEN
	conv_tac (LEFT_C  z_decl_pred_conv)) (asms,conc)
end);
end;
=GFT Examples
(* in which [p,q:ℕ | p = q] ceases to be Z when specialised *)
push_goal([],ⓩ∃ a,b : ℕ; c : X; [p,q:ℕ | p = q] ⦁
	(a = p) ∧ (b = q) ∧ (c = c)⌝);
val tm = ⓩ(b ≜ ⌜b:'a⌝, a ≜ ⌜a:'a⌝, c ≜ ⌜cc:'z⌝, p ≜ 5, q ≜ 6)⌝;
a(z_∃_tac tm);
undo 1;
a(z_∃_tac (mk_var("w",type_of tm)));
drop_main_goal();
push_goal([],ⓩ∃ p :ℕ ⦁ p = 1⌝);
a(z_∃_tac ⓩ1⌝);
a(rewrite_tac[]);
drop_main_goal();
=TEX

\subsection{Concerning Unique Existence}
\subsubsection{Utilities}
The following is a conversion, but NJML seems to make it impossible
to say so in the definition.
=SML
fun seq_simple_β_conv (tm : TERM) : THM = (
	(simple_β_conv
	ORELSE_C
	(RATOR_C seq_simple_β_conv THEN_C simple_β_conv)
	ORELSE_C
	(fn tm1 => term_fail "seq_simple_β_conv" 27008 [tm1]))
	tm
);
=TEX
=SML
local
val pair_eq_thm = prove_rule[pair_clauses]
	⌜∀ a b c d⦁ ((a,b) = (c,d)) ⇔ ((a = c) ∧ (b = d))⌝;
val cnv1 = simple_eq_match_conv1 pair_eq_thm;
in
fun ⦏pair_eq_conv⦎ tm = (
let	val (a,b) = dest_eq tm;
in
	if is_pair a
	then (cnv1 THEN_C RIGHT_C pair_eq_conv) tm
	else id_conv tm
end);
end;
=TEX
A variant on $list\_variant$ which will only add the same
decoration to each variable.
=SML
fun ⦏list_variant_same_dec⦎ avoid new = (
let	val avoid_nms = map (fst o dest_var) avoid;
	val new_nms = map (fst o dest_var) new;
	val vsuffix = get_variant_suffix();
in
	if any new_nms (fn x => x mem avoid_nms)
	then list_variant_same_dec avoid
		(map (fn x => let val (nm,ty) = dest_var x
		in
			mk_var(nm ^ vsuffix,ty)
		end) new)
	else new
end);
=TEX
\subsubsection{Main Act}
=SML
local
val cnv1 = simple_eq_match_conv1 (taut_rule ⌜∀ x y z⦁
	((x ∧ y) ∧ z) = (x ∧ y ∧ z)⌝);
val ∃⋎1_empty_conv = simple_eq_match_conv1 (taut_rule ⌜∀ x ⦁ x ⇔ x ∧ (x ⇒ T)⌝);
val ∃⋎1_uncurry_empty_conv = (
	∃⋎1_conv THEN_C (
		(TRY_C ∃_uncurry_conv) THEN_C
		ALL_SIMPLE_∃_C (RIGHT_C (TRY_C ∀_uncurry_conv))
	)
) ORELSE_C ∃⋎1_empty_conv;
fun LEFT_RIGHT_C (cl, cr) = APP_C (RAND_C cl, cr);
in
val ⦏z_∃⋎1_conv⦎ : CONV =  (fn tm =>
let	val (d,p,v) = dest_z_∃⋎1 tm
		handle complaint =>
		term_fail "z_∃⋎1_conv" 41122 [tm];
	val was_sig = fst(strip_λ(snd(dest_app tm)));
	val was_sig' = list_variant_same_dec (frees tm @ was_sig) was_sig;	
	val s1 = (
		eq_match_conv1 (get_spec tm) THEN_C ∃⋎1_uncurry_empty_conv
	) tm;
	val s2 = conv_rule(RIGHT_C(ALL_SIMPLE_∃_C(
		LEFT_RIGHT_C(
			TRY_C (RAND_C seq_simple_β_conv) THEN_C
			simple_β_conv THEN_C
			LIST_OP_C[d_dpv_proj_conv,p_dpv_proj_conv,v_dpv_proj_conv],

		 	ALL_SIMPLE_∀_C(LEFT_C(
				TRY_C (RAND_C seq_simple_β_conv) THEN_C
				simple_β_conv THEN_C
				LIST_OP_C[d_dpv_proj_conv,p_dpv_proj_conv,v_dpv_proj_conv]
			))
		)
	))) s1;
	val ciz = set_check_is_z false;
	val s3 = conv_rule(RIGHT_C(
		seq_binder_simple_α_conv was_sig THEN_C
		ALL_SIMPLE_∃_C (
			RIGHT_C (
				seq_binder_simple_α_conv was_sig' THEN_C
				ALL_SIMPLE_∀_C (
					RIGHT_C (TRY_C pair_eq_conv)
				) THEN_C
				z_∀_intro_conv1
			) THEN_C
			cnv1
		) THEN_C
		z_∃_intro_conv1
	)) s2;
	val _ = set_check_is_z ciz;
in
	check_is_z_thm "z_∃⋎1_conv" s3
end);
end;
=GFT Example
z_∃⋎1_conv ⓩ ∃⋎1 x : X | x = y ⦁ z = f x⌝;
z_∃⋎1_conv ⓩ ∃⋎1 x,y : X; z:Y | x = y ⦁ z = f x⌝;
z_∃⋎1_conv ⓩ ∃⋎1 [x,y : X; z:Y] | x = x' y y'' ⦁ z = f x⌝;
=TEX
=SML
local
	val cnv1 = simple_eq_match_conv1 (taut_rule ⌜∀ x ⦁ (T ∧ x) ⇔ x⌝);
	val cnv2 = BINDER_C (simple_eq_match_conv1
	(taut_rule ⌜∀ x y z ⦁ ((x ∧ T) ⇒ y ⇒ z)⇔ ((x ∧ y) ⇒ z)⌝));
	val cnv3 = BINDER_C (simple_eq_match_conv1
	(taut_rule ⌜∀ x y z ⦁ (x ∧ T ∧ y ∧ z)⇔ (x ∧ y ∧ z)⌝));
in
val ⦏z_∃⋎1_intro_conv⦎ : CONV = (fn tm =>(
let	val (x,bdy) = dest_∃⋎1 tm;
	val s1 = ∃⋎1_conv tm;
	val s2 = conv_rule(RAND_C(BINDER_C(RIGHT_C z_∀_intro_conv)
		THEN_C z_∃_intro_conv)) s1;
	val res = mk_z_∃⋎1(mk_z_decl[mk_z_dec([x],mk_u(mk_z_power_type(type_of x)))],
			mk_t,
			bdy);
	val s3 = (z_∃⋎1_conv THEN_C
			RAND_C(BINDER_C(
			(LEFT_C cnv1 THEN_C RAND_C (RAND_C(BINDER_C
			(LEFT_C cnv1))))))) res;
	val s2∀ = snd(dest_∧(#3(dest_z_∃ (snd(dest_eq(concl s2))))));
	val s3∀ = #3(dest_z_∃ (snd(dest_eq(concl s3))));
	val s4 = eq_trans_rule(z_∀_elim_conv2 s3∀)
		(eq_sym_rule((z_∀_elim_conv2 THEN_C cnv2)s2∀));
	val s5 = conv_rule(RIGHT_C(RAND_C(BINDER_C(RAND_C (fn _ => s4))))) s3;
	val s5∃ = snd(dest_eq(concl s5));
	val s2∃ = snd(dest_eq(concl s2));
	val s6 = eq_trans_rule(z_∃_elim_conv2 s5∃)
		(eq_sym_rule((z_∃_elim_conv2 THEN_C cnv3)s2∃));
	val s7 = eq_sym_rule(eq_trans_rule(eq_trans_rule s5 s6) (eq_sym_rule s2));
in
	check_is_z_conv_result "z_∃⋎1_intro_conv"
		(eq_trans_rule(refl_conv tm) s7)
end)
handle complaint =>
list_divert complaint "z_∃⋎1_intro_conv"
	[("dest_∃⋎1",41048,[fn () => string_of_term tm])]
);
end;


=IGN
z_∃⋎1_intro_conv ⌜∃⋎1 y ⦁ ⓩq y⌝⌝;
=TEX
=SML
fun ⦏z_∃⋎1_tac⦎ (wit:TERM) : TACTIC = (fn gl =>
	((conv_tac z_∃⋎1_conv THEN
	z_∃_tac wit) gl)
	handle complaint =>
	list_divert complaint "z_∃⋎1_tac" [
		("z_∃⋎1_conv", 41123, []),
		("z_∃_tac", 41021, [fn () => string_of_term wit,
		fn () => string_of_term (#1(dest_z_∃⋎1(snd gl)))])
	]
);
=TEX
\subsection{Concerning Assumptions}
=SML
fun ⦏z_spec_asm_tac⦎ (asm:TERM) (bind:TERM):TACTIC =
	GET_ASM_T asm (strip_asm_tac o z_∀_elim bind);
fun ⦏z_spec_nth_asm_tac⦎ (n:int) (bind:TERM):TACTIC =
	GET_NTH_ASM_T n (strip_asm_tac o z_∀_elim bind);

=TEX
\subsection{Conversions between Z Universal and Existential Quantifications}
=SML
local
val thm1 = prove_rule [z'∀_def, z'∃_def]
	⌜∀ x ⦁ (¬ ($"Z'∀" x)) ⇔ $"Z'∃" (¬ x)⌝;

val cnv1 = simple_eq_match_conv1 thm1;

val thm2 = prove_rule [z'∀_body_def, z'∃_body_def]
	⌜∀ x y z ⦁ (¬($"Z'∀Body" x y z)) ⇔ $"Z'∃Body" x y (¬ z)⌝;

val cnv2 = simple_eq_match_conv1 thm2;
=TEX
Yes, the following is a conversion, but the NJML compiler won't
allow any way of expressing that.
=TEX
=SML
fun ⦏lall_¬_simple_∀_conv⦎ (tm : TERM) : THM = (
	((¬_simple_∀_conv THEN_C
		BINDER_C lall_¬_simple_∀_conv)
			ORELSE_C cnv2) tm
);

val thm3 = prove_rule [z'∀_def, z'∃_def]
	⌜∀ x ⦁ (¬ ($"Z'∃" x)) ⇔ $"Z'∀" (¬ x)⌝;

val cnv3 = simple_eq_match_conv1 thm3;

val thm4 = prove_rule [z'∀_body_def, z'∃_body_def]
	⌜∀ x y z ⦁ (¬($"Z'∃Body" x y z)) ⇔ $"Z'∀Body" x y (¬ z)⌝;

val cnv4 = simple_eq_match_conv1 thm4;
=TEX
Another conversion that NJML won't let me describe as such:
=SML
fun ⦏lall_¬_simple_∃_conv⦎ tm = (
	((¬_simple_∃_conv THEN_C
		BINDER_C lall_¬_simple_∃_conv) ORELSE_C
		cnv4) tm
);

in
val ⦏z_¬_∀_conv⦎ : CONV = ((cnv1 THEN_C
	(RAND_C lall_¬_simple_∀_conv))
	ORELSE_C (fn tm => term_fail "z_¬_∀_conv" 41050 [tm]));
val ⦏z_¬_∃_conv⦎ : CONV = ((cnv3 THEN_C
	(RAND_C lall_¬_simple_∃_conv))
	ORELSE_C (fn tm => term_fail "z_¬_∃_conv" 41051 [tm]));
end;
=GFT
z_¬_∀_conv ⓩ ¬(∀ x, y : X; z : Y | f x ⦁ g y z)⌝;
z_¬_∃_conv ⓩ ¬(∃ x, y : X; z : Y | f x ⦁ g y z)⌝;
=TEX

\subsection{Negations}
=SML
local
	val tva = ⓣ'a⌝;
	val thm1 = taut_rule ⌜∀ x ⦁ ¬ ¬ x ⇔ x⌝;
	val thm2 = taut_rule ⌜∀ x y ⦁ ¬(x ∧ y) ⇔ ¬x ∨ ¬y⌝;
	val thm3 = taut_rule ⌜∀ x y ⦁ ¬(x ∨ y) ⇔ ¬x ∧ ¬y⌝;
	val thm4 = taut_rule ⌜∀ x y ⦁ ¬(x ⇒ y) ⇔ x ∧ ¬y⌝;
	val thm5 = taut_rule ⌜¬ T ⇔ F⌝;
	val thm6 = taut_rule ⌜¬ F ⇔ T⌝;
	val thm7 = prove_rule [] ⌜∀ x :'a ⦁ ¬(x = x) ⇔ F⌝;
	val thm9 = prove_rule [] ⌜∀ x ⦁ ¬(x ⇔ x) ⇔ F⌝;
	val thm8 = taut_rule ⌜∀ x y ⦁ ¬(x ⇔ y) ⇔
		((x ∧ ¬ y) ∨ (y ∧ ¬ x))⌝;
in
val ⦏z_¬_in_conv⦎ : CONV = (fn tm =>
let	val tm' = dest_z_¬ tm
		handle complaint =>
		pass_on complaint "dest_z_¬" "z_¬_in_conv";
in
	check_is_z_thm "z_¬_in_conv"
	(case (dest_z_term tm') of
	Z¬ tm'' => simple_∀_elim tm'' thm1
	| Z∧ (a,b) => list_simple_∀_elim [a,b] thm2
	| Z∨ (a,b) => list_simple_∀_elim [a,b] thm3
	| Z⇒ (a,b) => list_simple_∀_elim [a,b] thm4
	| ZEq (a,b) => (if a =$ b
		then simple_∀_elim a (inst_type_rule [(type_of a, tva)] thm7)
		else  term_fail "z_¬_in_conv" 28131 [tm]
	) | Z⇔ (a,b) => (if a =$ b
		then simple_∀_elim a thm9
		else list_simple_∀_elim [a,b] thm8
	) | Z∀ _ => z_¬_∀_conv tm
	| Z∃ _ => z_¬_∃_conv tm
	| Z∃⋎1 _ => ((RAND_C z_∃⋎1_conv) THEN_C z_¬_∃_conv) tm
	| ZTrue => thm5
	| ZFalse => thm6
	| _ => term_fail "z_¬_in_conv" 28131 [tm])
end);
end;
=TEX
\subsection{Canonicalisation}
=SML
val ⦏z_para_pred_marker_thms⦎ = 	
		[get_spec ⌜$"Z'Constraint"⌝,
		get_spec ⌜$"Z'FreeTypeDef"⌝,
		get_spec ⌜$"Z'GivenSet"⌝,
		get_spec ⌜$"Z'AxDes"⌝,
		get_spec ⌜$"Z'SchBox"⌝,
		get_spec ⌜$"Z'AbbDef"⌝
		];

local
	val indicators = map simple_eq_match_conv1 z_para_pred_marker_thms;
	
in
val ⦏z_para_pred_conv⦎ : CONV = (
	FIRST_C (indicators @
	[fn tm => term_fail "z_para_pred_conv" 41082 [tm]])
	THEN_TRY_C
	ALL_SIMPLE_∀_C(LEFT_C z_decl_pred_conv)
);

fun ⦏z_para_pred_canon⦎ (thm : THM) : THM list = (
	[conv_rule (FIRST_C (indicators
	@ [fn _ => thm_fail "z_para_pred_canon" 41080 [thm]])
		THEN_TRY_C
		ALL_SIMPLE_∀_C(LEFT_C z_decl_pred_conv)) thm]
);
end;
=GFT Example
Only if library available.
z_para_pred_canon (get_spec ⌜$"z'_ ↔ _"⌝);
=TEX
=SML
fun ⦏z_get_spec⦎ (cst : TERM) : THM = (
	conv_rule (TRY_C z_para_pred_conv)
	(get_spec cst)
	handle complaint =>
	pass_on complaint "get_spec" "z_get_spec"
);
=TEX
See earlier remarks about $z\_term\_of\_type$ for the location in this
document of the following:
=SML
fun ⦏z_term_of_type⦎ (ty : TYPE) : TERM = (
	let	val member_type = dest_z_power_type ty;
	in	(case dest_z_tuple_type member_type of
			[ty1, ty2] =>
				mk_z_gvar
				("_ ↔ _", mk_z_power_type ty,
				 [z_term_of_type ty1, z_term_of_type ty2])
		|	_ => mk_z_ℙ (z_term_of_type member_type))
		handle Fail _ =>
		mk_z_ℙ (z_term_of_type member_type)
	end	handle Fail _ =>
	let	val component_types = dest_z_tuple_type ty;
	in	mk_z_× (map z_term_of_type component_types)
	end	handle Fail _ =>
	let	val component_names_types = dest_z_schema_type ty;
		fun do_dec (ns, cty) = (
			mk_z_dec
			(map(fn n => mk_var(n, cty)) ns,
				z_term_of_type cty)
		);
		fun get_a_batch acc [] = (acc, [])
		|   get_a_batch (acc as (ns, ty1)) (what as ((n, ty) :: more)) = (
				if	ty1 =: ty
				then	get_a_batch (ns@[n], ty1) more
				else	(acc, what)
		);
		fun get_batches [] = []
		|   get_batches ((n, ty) :: more) = (
			let	val (batch, rest) = get_a_batch ([n], ty) more;
			in	batch :: get_batches rest
			end
		);
		val decl = mk_z_decl (map do_dec (get_batches component_names_types));
	in	mk_z_h_schema (decl, mk_z_true)
	end	handle Fail _ => ((
			case dest_ctype ty of
				(s, []) => (
				let	val n = unbind_gvar_name s
					handle Fail _ => (
					case s of
						"BOOL" => "𝔹"
					|	"CHAR" => "𝕊"
					|	_ => s);
					val tm = mk_z_gvar(n, mk_z_power_type ty, []);
					val chk = concl (z_get_spec tm);
				in	if	is_u (snd(dest_eq chk))
					then	tm
					else	mk_u (mk_z_power_type ty)
				end
			) |	_ => mk_u (mk_z_power_type ty)
		) handle Fail _ => (
			mk_u (mk_z_power_type ty)
		))
);
=TEX
=SML
val ⦏z_type_of⦎ : TERM -> TERM = z_term_of_type o type_of;
=TEX
=SML
fun ⦏z_∀_rewrite_canon⦎ (thm : THM) : THM list = (
let	val s1 = conv_rule z_∀_elim_conv thm
in
	[s1]
end
handle complaint =>
divert complaint "z_∀_elim_conv" "z_∀_rewrite_canon" 41081
	[fn () => string_of_thm thm]);
=GFT Examples
z_∀_rewrite_canon (asm_rule ⓩ∀ x,y :X | x = z ⦁ x = y⌝);
=TEX
=SML
local
	val cnv1 = simple_eq_match_conv1 (taut_rule⌜∀ x ⦁ T ⇒ x ⇔ x⌝);
	val cnv2 = pure_rewrite_conv[taut_rule⌜∀ x ⦁ T ∧ x ⇔ x⌝,
			taut_rule⌜∀ x ⦁ x ∧ T ⇔ x⌝];
in
fun ⦏z_⇒_rewrite_canon⦎ (thm : THM) : THM list = (
let	val s1 = if is_⇒ (concl thm)
		then conv_rule(
			LEFT_C (∧_C (TRY_C z_∈_u_conv)
			THEN_TRY_C cnv2)
			THEN_TRY_C cnv1)
			thm
		else thm_fail "z_⇒_rewrite_canon" 41083 [thm];
	val dummy = if concl s1 ~=$ concl thm
		then thm_fail "z_⇒_rewrite_canon" 41084 [thm]
		else ()
in
	[s1]
end);
end;
=GFT Examples
(z_∀_rewrite_canon THEN_CAN(REPEAT_CAN ∀_rewrite_canon)
	THEN_CAN z_⇒_rewrite_canon)
	 (asm_rule ⓩ∀ x,y :𝕌;z:𝕌 | true ⦁ x = y⌝);
(z_∀_rewrite_canon THEN_CAN(REPEAT_CAN ∀_rewrite_canon)
	THEN_CAN z_⇒_rewrite_canon)
	 (asm_rule ⓩ∀ x,y :X;z:Y | true ⦁ x = y⌝);
(z_∀_rewrite_canon THEN_CAN(REPEAT_CAN ∀_rewrite_canon)
	THEN_CAN z_⇒_rewrite_canon)
	 (asm_rule ⓩ∀ x,y :X;z:Y | x = z ⦁ x = y⌝); (* fail - no change *)
=TEX
=SML
local
	val cnv1 = simple_eq_match_conv ¬_∨_thm;
	val cnv2 = simple_eq_match_conv ¬_thm1;
in
fun ⦏z_¬_rewrite_canon⦎ (thm : THM) : THM list = (
	(dest_z_¬(concl thm);
	[conv_rule (FIRST_C[
		cnv1,
		z_¬_∃_conv,
		¬_¬_conv,
		cnv2])thm])
	handle complaint =>
	fail_canon thm
);
end;
=TEX
\subsection{Set Displays and Membership}
=SML
local
	val thm1 =
	tac_proof(([],⌜∀ (x:'a)⦁ ⓩ(x ∈ {} ⇔ false)⌝⌝),
	rewrite_tac[get_spec ⓩ{}⌝]);
	val thm2 =
	tac_proof(([],⌜∀ (x:'a) (h:'a) ⦁ ⓩ(x ∈ {h} ⇔ x = h)⌝⌝),
	rewrite_tac[get_spec ⓩ{}⌝]);
	val thm3 = (
	push_goal([],⌜∀ (x:'a) (h:'a) (t:'a LIST) ⦁
	ⓩ(x ∈  ⌜Z'Setd (Cons h t)⌝) ⇔ (x = h ∨ x ∈ ⌜Z'Setd t⌝)⌝⌝);
	a(rewrite_tac[get_spec ⓩ{}⌝]);
	a(REPEAT strip_tac);
	pop_thm());
	val cnv1 = simple_eq_match_conv1 thm1;
	val cnv2 = simple_eq_match_conv1 thm2;
	val cnv3 = simple_eq_match_conv1 thm3;
	fun cnv4 tm = (cnv2 ORELSE_C
		(cnv3 THEN_C RIGHT_C cnv4)
		ORELSE_C (fn tm => term_fail "z_∈_setd_conv"
			41016 [tm])) tm;
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
val ⦏z_∈_setd_conv⦎ : CONV = (fn tm =>
let	val (x,s) = dest_z_∈ tm;
	val (_,tml) = dest_z_setd s;
in
	check_is_z_conv_result "z_∈_setd_conv"
	(case tml of
	[] => cnv1 tm
	| [_] => cnv2 tm
	| _ => cnv4 tm)
end
handle complaint =>
list_divert complaint "z_∈_setd_conv"
	[("dest_z_∈",41015,[fn () => string_of_term tm]),
	("dest_z_setd",41015,[fn () => string_of_term tm])]);
end;
=TEX
=SML
local
	val a_⊆ = ⓩ(_ ⊆ _)⌝;
	val c1 = simple_eq_match_conv z_⊆_thm1;
	val clauses1 = pc_rule1 "hol1" prove_rule [] ⌜∀ x y ⦁
		((T ⇒ x) ⇔ x) ∧
		((y = y) ∨ x ⇔ T) ∧
		(x ∨ T ⇔ T) ∧
		(x ∨ (y = y) ⇔ T) ∧
		(((y = y) ⇒ x) ⇔ x)⌝;
	val c2 = TRY_C(pure_rewrite_conv [clauses1]);
	val c3 = tac_proof(([], ⌜∀ a X ⦁ (a ∈ X) ⇒ ∀ x ⦁ (x = a) ⇒ x ∈ X⌝),
		REPEAT strip_tac THEN asm_rewrite_tac[]);
	val c4 = simple_eq_match_conv1
		(taut_rule⌜∀ x y z ⦁ ((x ⇒ z) ∧ (y ⇒ z)) ⇔ (x ∨ y ⇒ z)⌝);
	val thm1 = all_∀_intro (
		tac_proof(([],ⓩ({} ⊆ X) ⇔ true⌝),
		rewrite_tac ([z_⊆_thm1, get_spec ⓩ{}⌝]) THEN
		conv_tac z_∀_elim_conv1 THEN
		∀_tac THEN accept_tac t_thm));
	val c5 =simple_eq_match_conv1 thm1;
in
val ⦏z_setd_⊆_conv⦎ : CONV = (fn tm =>
(let	val (set1set2,⊆) = dest_z_∈ tm;
	val dummy = term_match ⊆ a_⊆;
	val (set1,set2) = case dest_z_tuple set1set2 of
		[set1,set2] => (set1,set2)
		| _ => term_fail "z_setd_⊆_conv" 41017 [tm];
	val (ty,si) = dest_z_setd set1;
=TEX
Now redo with simplifier
=SML
	val s0 = c2 tm;
	val tm' = snd(dest_eq(concl s0));
	val (set1set2,⊆) = dest_z_∈ tm';
	val (set1,set2) = case dest_z_tuple set1set2 of
		[set1,set2] => (set1,set2)
		| _ => term_fail "z_setd_⊆_conv" 41017 [tm];
	val (ty,si) = dest_z_setd set1;
in
	case si of
	[] => c5 tm
	| _ => (
let
	val s1 = (c1 THEN_C BINDER_C(LEFT_C z_∈_setd_conv)) tm';
	val new_res = (map (fn x => mk_z_∈(x,set2)) si);
	val inter = snd(dest_eq(concl s1));
	val s2 = asm_rule inter;
	val s3 = all_⇒_intro(list_∧_intro(map (fn x => conv_rule c2(∀_elim x s2)) si));
	val xvar = variant (frees tm) (mk_var ("x",ty));
	val s4 = map (fn x => ∀_elim xvar(undisch_rule (list_∀_elim [x,set2] c3))) si;
	val s5 = fold (fn (x,y) => conv_rule c4
		(∧_intro x y)) (rev(tl(rev s4))) (hd(rev s4));
	val s6 = simple_∀_intro xvar s5;
	val s7 = strip_∧_rule(asm_rule(list_mk_∧ new_res));
	val s8 = fold (fn (x,y) => prove_asm_rule x y) s7 s6;
	val s9 = ⇔_intro s3 (all_⇒_intro s8);
in
	check_is_z_conv_result "z_setd_⊆_conv"
	(eq_trans_rule s0 (eq_trans_rule s1 s9))
end)
end)
handle complaint =>
list_divert complaint "z_setd_⊆_conv"
	[("dest_z_∈", 41017,[fn ()=> string_of_term tm]),
	("term_match", 41017,[fn ()=> string_of_term tm]),
	("eq_trans_rule", 41017,[fn ()=> string_of_term tm])]);
end;
=IGN
z_setd_⊆_conv ⓩ{1,2,3} ⊆ p⌝;
z_setd_⊆_conv ⓩ{} ⊆ p⌝;
=TEX
\subsection{Eliminating Z Quantifiers}
Something that only applies if the set display is only
of variables (also used in proof context ``$'$z$\_$decl''):
=SML
val ⦏local_z_setd_⊆_conv⦎ : CONV =
	COND_C (fn tm => ((all (snd(dest_z_setd(hd
			(dest_z_tuple(fst(dest_z_∈ tm)))))) is_var)
		handle (Fail _) => false))
		z_setd_⊆_conv
		fail_conv;
=TEX
=SML
local
val rw_conv = TRY_C(prim_rewrite_conv empty_net id_canon Nil
	(REWRITE_MAP_C "z_quantifiers_elim_tac")
	[(⌜$"Z'∀" x⌝,z_∀_elim_conv2 THEN_C
	   ALL_SIMPLE_∀_C
	   (LEFT_C(LEFT_C(Z_DECL_C (z_dec_pred_conv THEN_C
		(TRY_C z_∈_u_conv)))))),
	(⌜$"Z'∃" x⌝,z_∃_elim_conv2 THEN_C
	   ALL_SIMPLE_∃_C
	   (LEFT_C(Z_DECL_C (z_dec_pred_conv THEN_C
		(TRY_C z_∈_u_conv))))),
	(⌜x (λ y ⦁ z)⌝,z_∃⋎1_conv),
	(⌜T ∧ x⌝, simple_eq_match_conv1 (taut_rule ⌜∀ x ⦁ (T ∧ x) ⇔ x⌝)),
	(⌜x ∧ T⌝, simple_eq_match_conv1 (taut_rule ⌜∀ x ⦁ (x ∧ T) ⇔ x⌝)),
	(⌜x ⇒ T⌝, simple_eq_match_conv1 (taut_rule ⌜∀ x ⦁ (x ⇒ T) ⇔ T⌝)),
	(ⓩ⌜Z'Setd x⌝ ⊆ y⌝,local_z_setd_⊆_conv)]
	[]);
in
val ⦏z_quantifiers_elim_tac⦎ : TACTIC = (
	DROP_ASMS_T (MAP_EVERY(strip_asm_tac o conv_rule rw_conv))
	THEN conv_tac rw_conv
)
end;
=TEX
\subsection{Generic Predicates}
=SML
fun ⦏mk_var_gen_formal⦎ (caller:string) (tm:TERM) : TERM = (
let	val (nm,ty) = dest_var tm
		handle complaint =>
		pass_on complaint "dest_var" caller;
	val ty' = mk_z_power_type(mk_vartype("'" ^ nm));
in
	mk_var(nm,ty')
end);
=TEX
=SML
local
fun aux tm = (¬_simple_∀_conv THEN_TRY_C
	(BINDER_C aux)) tm;
in
val ⦏z_¬_gen_pred_conv⦎ : CONV = (fn tm =>
	(aux THEN_C
	z_∃_intro_conv) tm
	handle (Fail _) =>
	term_fail "z_¬_gen_pred_conv" 41031 [tm]
);
end;
=TEX
=SML
fun ⦏z_gen_pred_intro⦎ (tml : TERM list) (thm:THM) : THM = (
let	val tml' = map (mk_var_gen_formal "z_gen_pred_intro") tml;
in
	list_simple_∀_intro tml' thm
	handle complaint =>
	pass_on complaint "list_simple_∀_intro" "z_gen_pred_intro"
end);
=TEX
=SML
fun ⦏z_gen_pred_elim⦎ (tml : TERM list) (thm : THM):THM = (
	list_∀_elim tml thm
	handle (Fail _) =>
(let	val	nvars = length(fst(strip_∀ (concl thm)));
in
	if nvars < length tml
	then thm_fail "z_gen_pred_elim" 41034 [thm]
	else thm_fail "z_gen_pred_elim" 41033 [thm]
end)
);
=TEX
=SML
fun ⦏z_gen_pred_elim1⦎ (tm :TERM) (thm : THM) = (
	let	val tml = dest_z_tuple tm handle Fail _ => [tm];
	in	z_gen_pred_elim tml thm
		handle complaint =>
		pass_on complaint "z_gen_pred_elim" "z_gen_pred_elim1"
	end
);
=TEX
=SML
fun ⦏z_gen_pred_u_elim⦎ (thm : THM) : THM = (
	z_gen_pred_elim
	((map (mk_u o type_of) o fst o strip_∀ o concl) thm)
	thm
);
=TEX
=SML
val ⦏z_gen_pred_tac⦎ :TACTIC = (fn (asms,conc) =>
	if is_simple_∀ conc
	then REPEAT_T simple_∀_tac (asms,conc)
	else fail "z_gen_pred_tac" 41035 []
);
=TEX
=SML
fun ⦏is_gen_formal⦎ tm = (
let	val (nm,ty) = dest_var tm;
	val nm' = dest_vartype(dest_z_power_type ty)
in
	("'" ^ nm = nm')
end
handle (Fail _) => false);
=TEX
=SML
fun ⦏z_intro_gen_pred_tac⦎ (tt : (TERM * TERM) list) : TACTIC = (fn (asms,conc) =>
let	val dummy = map (fn (res,x) =>
		if is_gen_formal x
		then (if type_of res =: type_of x
			then (res,x)
			else term_fail "z_intro_gen_pred_tac" 41036 [x,res])
		else term_fail "z_intro_gen_pred_tac" 41032 [x]) tt;
in
	(MAP_EVERY intro_∀_tac (rev tt)(asms,conc))
	handle complaint =>
	pass_on complaint "intro_∀_tac" "z_intro_gen_pred_tac"
end);
=TEX
\subsection{Consistency Proofs}
=IGN
open_theory "z_bags";
new_theory "temp";
val _ = set_flag ("z_type_check_only", false);
val _ = set_flag ("z_use_axioms", false);
 ╒[X]═
f: (X → X) → X → X
 ├
∀ x:X; g:X → X ⦁ f g x =  g(g x)
 └
 ╒[X,Y]═
f2: (X ↔ Y);
f3: (X ↔ Y)
 ├
∀ x:X; y:Y ⦁ (x,y) ∈ f2 ⇔ (x,y) ∉ f3
 └

 ⓈZAX
ff: (ℤ → ℤ) → ℤ → ℤ
 ├
∀ x:ℤ; g:ℤ → ℤ ⦁ ff g x =  g(g x)
 ■

 ⓈZAX
ff2: (ℤ ↔ ℤ);
ff3: (ℤ ↔ ℤ)
 ├
∀ x:ℤ; y:ℤ ⦁ (x,y) ∈ ff2 ⇔ (x,y) ∉ ff3
 ■

z_push_consistency_goal ⓩf⌝;
z_push_consistency_goal ⓩf2⌝;
z_push_consistency_goal ⓩf3⌝;
z_push_consistency_goal ⓩff⌝;
z_push_consistency_goal ⓩff2⌝;
z_push_consistency_goal ⓩff3⌝;
=SML
fun ⦏seq_simple_binder_α_conv⦎ [] = id_conv
| seq_simple_binder_α_conv (a :: x) = (
	RAND_C (simple_α_conv (fst(dest_var a))) THEN_C
	BINDER_C(seq_simple_binder_α_conv x)
);

local
	val consistent_thm = pure_rewrite_rule [η_axiom] consistent_def;
	val rw_cnv1 = simple_eq_match_conv1 consistent_thm;
	val para_conv = FIRST_C(map simple_eq_match_conv1 z_para_pred_marker_thms);
	val and_conv = simple_eq_match_conv1 (taut_rule ⌜∀ a b ⦁ a ∧ b ⇔ a ∧ T ∧ b⌝);
	fun rename_conv tm = (let val old_names = fst(strip_∃  tm);
		val try_new = map (fn nm => case (explode (fst(dest_var nm))) of
			("z" :: "'" :: rest) => mk_var(implode rest, type_of nm)
			| _ => nm) old_names;
		val avoid = (map mk_var (term_vars tm) ) term_diff old_names;
		val newish = list_variant (map mk_var (term_vars tm) ) try_new;
	in
		(seq_simple_binder_α_conv newish) tm
	end);
in
fun ⦏z_push_consistency_goal⦎ (const : TERM) : unit = (
let	val spec = z_get_spec const
		handle complaint =>
		pass_on complaint "z_get_spec" "z_push_consistency_goal";
	val cnc = (hd(asms spec)
		handle (Fail _) =>
		fail "z_push_consistency_goal" 46007 [fn () => fst(dest_const (fst(strip_app const)))]);
in
	if is_mon_op "Consistent" cnc
	then (push_goal([],cnc);
		a(conv_tac (rw_cnv1 THEN_C
			(TRY_C ∃_uncurry_conv) THEN_C
			rename_conv THEN_C
			TRY_C ((ALL_SIMPLE_∃_C para_conv)) THEN_C
		TRY_C ((ALL_SIMPLE_∃_C and_conv THEN_C z_∃_intro_conv1) ORELSE_C
		(ALL_SIMPLE_∃_C (ALL_SIMPLE_∀_C (LEFT_C z_decl_pred_conv) THEN_C
			z_∀_intro_conv) THEN_C
		z_∃_intro_conv))) ))
	else fail "z_push_consistency_goal" 46007 [fn () => fst(dest_const (fst(strip_app const)))]
end);
end;
=TEX

\subsection{Proof Contexts}
\subsubsection{Contents for Proof Contexts - Automatic Proof a la HOL}
=SML
local
open Resolution;
val xvar = mk_var("x",mk_vartype "'a");
val eq_refl_thm = simple_∀_intro xvar (refl_conv xvar);
in
fun ⦏z_basic_prove_tac⦎ (thms: THM list) : TACTIC = (
	TRY_T all_var_elim_asm_tac THEN
	DROP_ASMS_T (MAP_EVERY (strip_asm_tac o
	(fn thm => rewrite_rule thms thm
		handle (Fail _) => thm)) o rev) THEN
	(TRY_T (rewrite_tac thms)) THEN
	REPEAT strip_tac THEN
	TRY_T all_var_elim_asm_tac THEN_TRY
	(z_quantifiers_elim_tac THEN
	(fn gl =>
	let	val ciz = set_check_is_z false;
		val res =
	 	(EXTEND_PC_T1 "'mmp1" all_asm_fc_tac[] THEN
	 	(basic_res_tac2 3 [eq_refl_thm]
	 	ORELSE_T basic_res_tac3 3 [eq_refl_thm]))
		gl;
		val _ = set_check_is_z ciz;
	in
		res
	end))
);
=TEX
=SML
fun ⦏z_basic_prove_conv⦎ (thms: THM list) : CONV = (
let val tac = rewrite_tac thms;
in
(fn tm =>
(⇔_t_intro (
tac_proof(([],tm),
	TRY_T tac  THEN
	REPEAT strip_tac THEN
	TRY_T all_var_elim_asm_tac THEN_TRY
	(z_quantifiers_elim_tac THEN
	(fn gl =>
	let	val ciz = set_check_is_z false;
		val res =
	 	(EXTEND_PC_T1 "'mmp1" all_asm_fc_tac[] THEN
		 (basic_res_tac2 3 [eq_refl_thm]
		 ORELSE_T basic_res_tac3 3 [eq_refl_thm])) gl;
		val _ = set_check_is_z ciz;
	in
		res
	end))
)
handle complaint =>
divert complaint "tac_proof" "z_basic_prove_conv" 76001 [fn () => string_of_term tm])))
end);
end;
=TEX
\subsubsection{Contents for Proof Contexts - Automatic Proof by Chaining}
=SML
fun ⦏fc_prove_fc_tac⦎ (ct : int) : TACTIC = (
	let	fun aux2 ct ths = (
			if ct > 0
			then	FC_T1 id_canon (fn thl =>
				let	val canned = flat (map fc_canon1 thl);
				in	MAP_EVERY strip_asm_tac thl THEN
					aux2 (ct-1) (thl @ ths)
				end
				) ths
			else	fail_tac
		);
	in	GET_ASMS_T (fn ths => aux2 ct (flat (map fc_canon1 ths)))
	end
);
=TEX
=SML
fun ⦏z_fc_prove_tac⦎ (thms: THM list) : TACTIC = (
	TRY_T all_var_elim_asm_tac THEN
	(DROP_ASMS_T (MAP_EVERY (strip_asm_tac o
	(fn thm => rewrite_rule thms thm
		handle (Fail _) => thm)) o rev) THEN
	(TRY_T (rewrite_tac thms)) THEN
	TRY_T all_var_elim_asm_tac THEN
	SOLVED_T (
		contr_tac THEN
		z_quantifiers_elim_tac THEN
		EXTEND_PC_T1 "'mmp1" all_asm_fc_tac[] THEN fc_prove_fc_tac 4
	))
	ORELSE (fn (_, cc) => term_fail "z_fc_prove_tac" 76001 [cc])
);
fun ⦏z_fc_prove_conv⦎ (thms: THM list) : CONV = (
(fn tm =>
(⇔_t_intro (
tac_proof(([],tm),z_fc_prove_tac thms))
)
handle complaint =>
divert complaint "tac_proof" "z_fc_prove_conv" 76001 [fn () => string_of_term tm]));
=TEX
\subsubsection{Implementation of Proof Contexts}
Basic language reasoning about predicates in a prof context:
=SML
val _ = delete_pc "'z_predicates" handle Fail _ => ();
val _ = new_pc "'z_predicates";
val _ = set_rw_eqn_cxt [(⌜p q r⌝, z_∈_u_conv),
	(⌜p q r⌝, ×_u_conv),
	(⌜p (λ x ⦁ q)⌝, seta_u_conv),
	(⌜$"Z'∀" x⌝,z_∀_inv_conv),
	(⌜$"Z'∃" x⌝,z_∃_inv_conv),
	(⌜Z'SchemaPred b s⌝, z_schema_pred_conv1)
	]"'z_predicates";
val _ = add_rw_thms ([⇔_rewrite_thm,
	¬_rewrite_thm,
	eq_rewrite_thm,
	∧_rewrite_thm,
	∨_rewrite_thm,
	∀_rewrite_thm,
	⇒_rewrite_thm,
	ℙ_u_thm]
	@ z_para_pred_marker_thms) "'z_predicates";
val _ = set_st_eqn_cxt [(⌜¬ x⌝,z_¬_in_conv),
	(⌜¬ (∀ x ⦁ y)⌝,z_¬_gen_pred_conv),
	(⌜$"Z'∃" x⌝,z_∃_elim_conv),
	(⌜$"Z'∃⋎1" x⌝,z_∃⋎1_conv),
	(⌜x ∈ y⌝,z_∈_u_conv),
	(⌜¬(x ∈ y)⌝, RAND_C z_∈_u_conv),
	(⌜$"Z'∀" x⌝,z_∀_inv_conv),
	(⌜Z'SchemaPred b s⌝, z_schema_pred_conv1),
	(⌜¬(Z'SchemaPred b s)⌝, RAND_C z_schema_pred_conv1)
	] "'z_predicates";
val _ = add_st_thms ([⇒_thm,
	⇔_thm,
	∀_rewrite_thm,
	eq_rewrite_thm]
	@ z_para_pred_marker_thms) "'z_predicates";
val _ = set_sc_eqn_cxt [(⌜$"Z'∀" x⌝,z_∀_elim_conv),
	(⌜¬ x⌝,z_¬_in_conv),
	(⌜¬ (∀ x ⦁ y)⌝,z_¬_gen_pred_conv),
	(⌜x ∈ y⌝,z_∈_u_conv),
	(⌜¬(x ∈ y)⌝, RAND_C z_∈_u_conv),
	(⌜$"Z'∀" x⌝,z_∃_inv_conv),
	(⌜Z'SchemaPred b s⌝, z_schema_pred_conv1),
	(⌜¬(Z'SchemaPred b s)⌝, RAND_C z_schema_pred_conv1)
	] "'z_predicates";
val _ = (let
	val thm1 = taut_rule ⌜∀a b⦁(a ∨ ¬b) ⇔ (b ⇒ a)⌝;
	val thm2 = taut_rule ⌜∀a b⦁¬ a ∨ b ⇔ a ⇒ b⌝;
	val thm3 = taut_rule ⌜∀a b⦁a ∨ b ⇔ ¬ a ⇒ b⌝;
in
add_sc_thms ([⇔_thm,
	eq_rewrite_thm,
	thm1,thm2,thm3]
	@ z_para_pred_marker_thms) "'z_predicates"
end);

val _ =set_rw_canons [
	∀_rewrite_canon, z_¬_rewrite_canon,
	∧_rewrite_canon, f_rewrite_canon,
	z_∀_rewrite_canon, z_para_pred_canon,
	z_⇒_rewrite_canon] "'z_predicates";
val _ =set_pr_tac z_basic_prove_tac "'z_predicates";
val _ =set_pr_conv z_basic_prove_conv "'z_predicates";
val _ =set_cs_∃_convs[basic_prove_∃_conv,
	ALL_SIMPLE_∃_C z_para_pred_conv,
	z_∃_elim_conv2]
	"'z_predicates";
val _ =set_∃_vs_thms [
		tt_to_∃_vs (type_of ⓩ(x,y)⌝),
		tt_to_∃_vs (type_of (mk_z_tuple [ⓩwit⌝])),
		tt_to_∃_vs (type_of ⓩ(a,b,c)⌝),
		tt_to_∃_vs (type_of ⓩ(a,b,c,d)⌝),
		tt_to_∃_vs (type_of ⓩ(a,b,c,d,e)⌝),
		tt_to_∃_vs (type_of ⓩ(a,b,c,d,e,f)⌝),
		tt_to_∃_vs (type_of ⓩ(a,b,c,d,e,f,g)⌝),
		tt_to_∃_vs (type_of ⓩ(a,b,c,d,e,f,g,h)⌝),
		tt_to_∃_vs (type_of ⓩ(a,b,c,d,e,f,g,h,i)⌝),
		tt_to_∃_vs (type_of ⓩ(a,b,c,d,e,f,g,h,i,j)⌝),
		tt_to_∃_vs (type_of ⓩ(a,b,c,d,e,f,g,h,i,j,k)⌝),
		tt_to_∃_vs (type_of ⓩ(a,b,c,d,e,f,g,h,i,j,k,l)⌝),
		tt_to_∃_vs (type_of ⓩ(a,b,c,d,e,f,g,h,i,j,k,l,m)⌝),
		tt_to_∃_vs (type_of ⓩ(a,b,c,d,e,f,g,h,i,j,k,l,m,n)⌝),
		tt_to_∃_vs (type_of ⓩ(a,b,c,d,e,f,g,h,i,j,k,l,m,n,o)⌝),
		tt_to_∃_vs (type_of ⓩ(a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p)⌝)
	] "'z_predicates";
val _ = commit_pc "'z_predicates";
=TEX
Split off non-language  proof context:
=SML

val _ = delete_pc "'z_decl" handle Fail _ => ();
val _ = new_pc "'z_decl";
val _ = set_rw_eqn_cxt []"'z_decl";
val _ = add_rw_thms ([]) "'z_decl";
val _ = set_st_eqn_cxt [
	(ⓩ⌜Z'Setd x⌝ ⊆ y⌝,z_setd_⊆_conv),
	(ⓩ¬(⌜Z'Setd x⌝ ⊆ y)⌝,RAND_C z_setd_⊆_conv)] "'z_decl";
val _ = add_st_thms ([]) "'z_decl";
val _ = set_sc_eqn_cxt [
	(ⓩ⌜Z'Setd x⌝ ⊆ y⌝,z_setd_⊆_conv),
	(ⓩ¬(⌜Z'Setd x⌝ ⊆ y)⌝,RAND_C z_setd_⊆_conv)] "'z_decl";
val _ =set_rw_canons [] "'z_decl";
val _ =set_pr_tac z_basic_prove_tac "'z_decl";
val _ =set_pr_conv z_basic_prove_conv "'z_decl";
val _ =set_cs_∃_convs[]
	"'z_decl";
val _ =set_∃_vs_thms [] "'z_decl";
val _ = commit_pc "'z_decl";
=TEX
Complete proof context based on above:
=SML
val _ = delete_pc "z_predicates" handle Fail _ => ();
val _ = new_pc "z_predicates";
val _ = merge_pcs ["'z_predicates","'z_decl"] "z_predicates";
val _ = commit_pc "z_predicates";
=TEX
Forwarding chaining proof context:
=SML
val _ = delete_pc "'z_fc" handle Fail _ => ();
val _ = new_pc ⦏"'z_fc"⦎;
val _ = set_pr_tac z_fc_prove_tac "'z_fc";
val _ = set_pr_conv z_fc_prove_conv "'z_fc";
val _ = commit_pc ⦏"'z_fc"⦎;
=TEX
=SML
val _ = repeat pop_pc;
val _ = push_pc "z_predicates";
val _ = delete_pc "'z_predicate_calculus_build";
=GFT
push_goal([],ⓩ∀ x, y:𝕌 ⦁ (x ∧ y) = (y ∧ x)⌝);
a(step_strip_tac);
=TEX
\section{EPILOGUE}
=SML
end; (* of structure ZPredicateCalculus --- part 2 *)
=TEX
The structure is not opened at the top level until the forward reference has been resolved and the function for resolving it can be hidden (in IMP043).
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}

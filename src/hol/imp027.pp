=IGN
********************************************************************************
imp027.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% imp027.doc   ℤ $Date: 2011/07/11 11:05:38 $ $Revision: 1.44 $ $RCSfile: imp027.doc,v $
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

\def\Title{Implementation for the Derived Rules of Inference II}

\def\AbstractText{The implementation of the second group of derived rules of inference is given in this document. They mainly concern handling paired abstractions.}

\def\Reference{DS/FMU/IED/IMP027}

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
%% LaTeX2e port: \TPPtitle{Implementation for the Derived Rules of Inference II}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Implementation for the \cr Derived Rules of Inference II}
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP027}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.44 $ %
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2011/07/11 11:05:38 $ %
%% LaTeX2e port: }}  %% Mandatory field
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.~Blackburn & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{The implementation of the second group of derived rules of inference is given in this document.
%% LaTeX2e port: They mainly concern handling paired abstractions.}
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
\item [Issue 1.1 (1991/10/10),1.2 (1991/10/16),1.3 (1991/10/16)]
First drafts.
\item [Issue 1.4 (1991/11/12)]
Changes to match issue 1.8 of \cite{DS/FMU/IED/DTD027}.
\item [Issue 1.5 (1991/11/19)]
``Minimised'' theory in which work is done.

\item[Issue 1.6 (1992/01/20), \FormatDate{92/01/20} ] Updated to use new fonts.
\item[Issue 1.7 (1992/02/07)]
Changed theory in which work is done.
\item[Issue 1.8 (1992/02/13),1.9 (1992/02/14)(13th February 1992)]
Moving material from 058 to 027.
\item [Issue 1.10 (1992/03/18)(11th March 1992)]
Various minor additions and extensions.
\item [Issue 1.11 (1992/04/01)(1st April 1992)]
Removed sets material.
\item [Issue 1.12 (1992/04/09) (13th April 1992)]
Changes due to CR0017.
\item [Issue 1.14 (1992/04/28) (28th April 1992)]
Removed uses of "prof".
\item [Issue 1.15 (1992/05/12) (11th May 1992)]
Made $∀\_elim$ matching.
\item [Issue 1.16 (1992/05/12) (12th May 1992)]
Changed theory.
\item[Issue 1.17 (1992/05/15) (15 May 1992)] Use correct quotation symbols.
\item [Issue 1.18 (1992/05/21),1.19 (1992/05/21),1.20 (1992/05/22) (20th May 1992)]
Rearranging build proof contexts.
\item [Issue 1.21 (1992/05/26) (26th May 1992)]
Renamings from version 1.5 of DS/FMU/IED/WRK038.
\item [Issue 1.22 (1992/06/02) (2nd June 1992)]
Changed ``native'' theory.
\item[Issue 1.23 (1992/06/24) (24th June 1992)]
Renamings from issue 1.6 of \cite{DS/FMU/IED/WRK038},
mostly proof context name changes.
\item[Issue 1.24 (1992/07/02) (2nd July 1992)]
The $?\_reorder\_conv$ and $λ\_varstruct\_conv$ functions are improved to notice ``no change''.
\item[Issue 1.25 (1992/07/03) (3rd July 1992)]
Changed some uses of $subst$ to $var\_subst$.
\item [Issue 1.26 (1992/07/30)] Added forward chaining rules and minor mods to matching modus
ponens (to accomodate changes to the simple versions).
\item[Issue 1.27 (1992/08/04) (4th August 1992)]
Slightly improved error handling.
\item[Issue 1.28 (1992/08/10)] Changed $fc\_rule$ in light of comments on first version.
\item[Issue 1.29 (1992/08/13)(13th August 1992)]
Fixed bug caused by recent changes to $simple\_¬\_∀\_conv$.
\item [(Issue 1.30 (1992/08/13) (13th August 1992)]
Corrected error handling for interrupts.
\item [(Issue 1.31 (1992/10/28) (27th October 1992)]
Corrected error handling for $∃⋎1\_intro$.
\item [(Issue 1.32 (1992/11/11) (11th November 1992)]
Added fancy variants on $fc\_canon$.
\item [(Issue 1.33 (1993/02/16),1.34 (1993/02/16) (16th February 1993)]
Modified forward chaining.
\item [Issue 1.35 (1996/02/15)]
New forward chaining canon.
\item [Issue 1.36 (1997/05/02)]
$FORWARD\_CHAIN\_CAN$ very slighting tweaked for speed.
\item[Issue 1.37 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.38 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.39 (2008/08/06)] Added
=INLINEFT
λ_pair_conv
=TEX
.
\item[Issue 1.40 (2008/10/30)] Added
=INLINEFT
list_simple_∃_intro
=TEX
.
\item[Issues 1.41 (2011/02/05)--1.43 (2011/02/06)] Added
=INLINEFT
⇒_match_mp_rule2
=TEX
.
\item[Issue 1.44 (2011/07/11)] Performance improvement to
=INLINEFT
v_∃_intro
=TEX
.
\item[Issue 1.45 (2012/03/19)] Added
=INLINEFT
λ_unpair_conv
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
More detailed descriptions of the tricky algorithms.
\section{GENERAL}
\subsection{Scope}
This document contains an implementation of the derived rules of inference part II.
This primarily concerns adding paired abstraction handling
to the functions of \cite{DS/FMU/IED/DTD007}.
This is called for in \cite{DS/FMU/IED/HLD012}.
The design is in \cite{DS/FMU/IED/DTD027},
and the functions tested in \cite{DS/FMU/IED/MDT027}
\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains an implementation of the derived rules of inference part II.
This primarily concerns adding paired abstraction handling
to the functions of \cite{DS/FMU/IED/DTD007}.
\subsubsection{Dependencies}
This document takes its signature from \cite{DS/FMU/IED/DTD027}.
\subsubsection{Deficiencies}
Some of the coding could be tightened - e.g. eliminating uses of
$simple\-\_eq\-\_match\-\_conv$.
\subsubsection{Possible Enhancements}
None known.

\section{THE CODE}
=SML
structure ⦏DerivedRules2⦎ : DerivedRules2 = struct
=TEX
=SML
val ⦏was_theory⦎ = get_current_theory_name ();
val _ = open_theory "basic_hol";
val _ = set_merge_pcs ["'propositions",
	"'simple_abstractions"];
=TEX
\subsection{Local Theorems}
We will need these in various places:
=SML
val ∀_uncurry_thm = (push_goal([],⌜∀ f :'a → 'b → BOOL ⦁ $∀ (Uncurry f) ⇔
		∀ x ⦁ f (Fst x) (Snd x)⌝);
	a simple_∀_tac;
	a(rewrite_tac[∀_def]);
	a(rewrite_tac[ext_thm, pair_clauses]);
	pop_thm());
val fst_thm = tac_proof(([],⌜∀ a b ⦁ Fst (a,b) = a⌝),
	rewrite_tac[pair_clauses]);
val snd_thm = tac_proof(([],⌜∀ a b ⦁ Snd (a,b) = b⌝),
	rewrite_tac[pair_clauses]);
val s∀_uncurry_thm = (push_goal([],⌜∀ f :'a → 'b → BOOL ⦁
		(∀ x ⦁ f (Fst x) (Snd x)) ⇔ $
		∀ (Uncurry f)⌝);
	a simple_∀_tac;
	a(rewrite_tac[∀_def]);
	a(rewrite_tac[ext_thm, pair_clauses]);
	pop_thm());
val sfst_thm = tac_proof(([],⌜∀ a b ⦁ a = Fst (a,b)⌝),
	rewrite_tac[pair_clauses]);
val ssnd_thm = tac_proof(([],⌜∀ a b ⦁ b = Snd (a,b)⌝),
	rewrite_tac[pair_clauses]);
val sfst_snd_thm = tac_proof(([],⌜∀ x ⦁ (Fst x,Snd x) = x⌝),
	rewrite_tac[pair_clauses]);
val ∃_uncurry_thm = (push_goal([],
		⌜∀ f ⦁ $∃ (Uncurry f) = ∃ x ⦁ f (Fst x) (Snd x)⌝);
	a simple_∀_tac;
	a(rewrite_tac[pair_clauses, ∃_def]);
	a(LEMMA_T ⌜Uncurry f = λ x ⦁ f (Fst x) (Snd x)⌝
		(fn x => rewrite_tac[x]));
	a(rewrite_tac[ext_thm, pair_clauses]);
	pop_thm());
val s∃_uncurry_thm = (push_goal([],
		⌜∀ f ⦁ (∃ x ⦁ f (Fst x) (Snd x)) = $∃ (Uncurry f)⌝);
	a simple_∀_tac;
	a(rewrite_tac[pair_clauses, ∃_def]);
	a(LEMMA_T ⌜Uncurry f = λ x ⦁ f (Fst x) (Snd x)⌝
		(fn x => rewrite_tac[x]));
	a(rewrite_tac[ext_thm, pair_clauses]);
	pop_thm());
val uc_thm = tac_proof(([],⌜∀ f ⦁ Uncurry f =
	λ x ⦁ f (Fst x) (Snd x)⌝),
	rewrite_tac[ext_thm, pair_clauses]);
val ¬_∀_uncurry_thm = (push_goal([],
		⌜∀ f ⦁ (¬($∀(Uncurry f))) = ∃ p q ⦁ ¬ f p q⌝);
	a (strip_tac THEN rewrite_tac[uc_thm]);
	a (REPEAT strip_tac);
	(* *** Goal "1" *** *)
	a(MAP_EVERY_T simple_∃_tac [⌜Fst x⌝,⌜Snd x⌝] THEN
		asm_rewrite_tac[]);
	(* *** Goal "2" *** *)
	a(simple_∃_tac ⌜(p,q)⌝ THEN
		asm_rewrite_tac[pair_clauses]);
	pop_thm());
=TEX
\subsection{Local Functions}
Note that $flat\_vs$ should not be capable of failing
on , e.g., the first part of the result of a $dest\_∀$
=SML
fun ⦏flat_vs⦎ (caller : string) (tm1:TERM) : TERM list = (
let	fun aux tm = (
	if is_var tm
	then [tm]
	else ( let val (tm1,tm2) = dest_pair tm
		handle complaint =>
		divert complaint "dest_pair" caller 4016 [
			fn () => string_of_term tm];
	in
		(aux tm1 @ aux tm2)
	end));
in
	aux tm1
end);
=TEX
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
The following are used in getting type instantiations.
=SML
val ⦏tva⦎ = ⓣ'a⌝;
val ⦏tvb⦎ = ⓣ'b⌝;
val ⦏tvc⦎ = ⓣ'c⌝;
=TEX
=SML
fun ⦏two_the_same⦎ ((a:TERM) :: x) : TERM OPT = (
	if present (op =$) a x
 	then Value a
 	else two_the_same x
) | two_the_same [] = Nil;
=TEX
The following function makes a variant variable structure
from a given list of frees, and duplicates within.
The conditional is given to prevent a new term being incorporated
that is equal to the old one.
=SML
fun ⦏varstruct_variant⦎ (na : TERM list) (tm : TERM) : TERM = (
let	val nms = (map (fst o dest_var) na) cup []
		handle complaint =>
		pass_on complaint "dest_var" "varstruct_variant";
	fun aux anms tm = (
		if is_var tm
		then (let val (nm,ty) = dest_var tm;
			val nm' = string_variant anms nm;
		in
			((nm' :: anms), mk_var(nm', ty))
		end)
		else (let val (v1,v2) = dest_pair tm;
			val (anms',v2') = aux anms v2;
			val (anms'',v1') = aux anms' v1;
		in
			(anms'', mk_pair(v1',v2'))
		end)
	);
	val tm' = snd(aux nms tm)
in
	if tm' =$ tm
	then tm
	else tm'
end
handle complaint =>
divert complaint "dest_pair" "varstruct_variant" 4016
	[fn () => string_of_term tm]);
=TEX
Rename duplicate variables in a variable structure:
note this will fail on items that are not variable structures.
It must only rename name {\em and} type duplicates,
not just naming duplicates.
It must not rename any variable that was not initially duplicated.
I.e. the avoid list is only for new names, not current ones.
In these conditions it differs from $varstruct\_variant$,
and should only be used when these conditions are appropriate.
=SML
fun  ⦏rename_dups⦎ (av: TERM list) (tm : TERM) = (
let	val orig_vars = frees tm;
	val av_nms = list_cup [(map (fst o dest_var) (orig_vars @ av))];
	fun rd_aux av seen tm1 = (
		if is_var tm1
		then (if present (op =$) tm1 seen
			then (let
			val (nm,ty) = dest_var tm1;
			val new_nm = string_variant av nm;
			val new = mk_var(new_nm,ty);
			in
			(((new_nm :: av),seen),new)
			end)
			else ((av, (tm1 :: seen)), tm1)
		) else (let val (ftm,stm) = dest_pair tm1;
			val ((av',seen'),stm') = rd_aux av seen stm;
			val ((av'',seen''),ftm') = rd_aux av' seen' ftm;
		in
			((av'', seen''), mk_pair(ftm',stm'))
		end)
	);
in
	snd(rd_aux av_nms [] tm)
end
handle complaint =>
divert complaint "dest_pair" "rename_dups" 4016
	[fn () => string_of_term tm]);
=IGN
Tests:
rename_dups [] ⌜(x,y)⌝; (* ⌜(x,y)⌝ *)
rename_dups [] (mk_pair(⌜x:'a⌝,⌜x:'b⌝)); (* ⌜(x,x)⌝ *)
rename_dups [] ⌜(x,x)⌝; (* ⌜(x',x)⌝ *)
rename_dups [] ⌜(x',x,x)⌝; (* ⌜(x',x'',x)⌝ *)
=TEX
\subsection{Core Paired Abstraction Functions}
The following functions provide a core, around which,
in combination with the rules for \cite{DS/FMU/IED/DTD007},
we can implement the other rules of \cite{DS/FMU/IED/DTD027}.

In the following we try to fail as fast as possible:
we could instead immediately try $simple\_β\_conv$,
and only be clever if we fail.
\subsubsection{Concerning λ}
We do $λ\_varstruct\_conv$ in with $β\_conv$ for a little
extra speed (as we have some of the necessary preprocessing
done).
It can be written as a derived rule, if so desired.
=SML
local
val uncurry_def = get_defn "pair" "Uncurry";
val fst_snd_thm = tac_proof(([],⌜∀ p ⦁ p = (Fst p, Snd p)⌝),
	rewrite_tac[pair_clauses]);
val prc = TRY_C(pure_rewrite_conv [sfst_snd_thm]);

fun match_simple_∀_elim (tm:TERM) (thm:THM) = (
let	val (v,_) = dest_simple_∀ (concl thm);
	val thm1 = inst_type_rule (fst(term_match tm v)) thm;
	val thm2 = simple_∀_elim tm thm1
in
	thm2
end);

fun aux (vs: TERM) (vl : TERM) : CONV = (
	if is_var vs
	then simple_β_conv
	else if is_pair vl
	then (let  	val (vs1,vs2) = dest_pair vs;
			val (vl1,vl2) = dest_pair vl;
		in
			simple_eq_match_conv1 uncurry_def THEN_C
			RATOR_C (aux vs1 vl1) THEN_C
			aux vs2 vl2
		end
	) else (let	val vl_thm = match_simple_∀_elim vl fst_snd_thm;
			val vl' = snd(dest_eq(concl vl_thm));
		in
		RAND_C (fn x => vl_thm) THEN_C aux vs vl'
		end
	)
);
in
val ⦏β_conv⦎ : CONV = (fn (tm : TERM) =>
let	val (br,vl) = dest_app tm
		handle complaint =>
		divert complaint "dest_app" "β_conv" 27008
			[fn () => string_of_term tm];
	val res = (simple_β_conv tm
		handle (Fail _) =>
		(let	val (vs,_) = (dest_λ br
			handle complaint =>
			divert complaint "dest_app" "β_conv" 27008
			[fn () => string_of_term tm]);
		in
			aux vs vl tm
		end));
in
	res
end);
=TEX
If pulling together $Fst$ and $Snd$ can solve a failure,
then it will, in step $s4$.
=SML
fun ⦏λ_varstruct_conv⦎ (tm1 : TERM) : CONV = (fn (tm2:TERM) =>
	α_conv tm1 tm2
	handle (Fail _) =>
let	val totm1 = type_of tm1;
	val (dom,ran) = dest_→_type totm1;
	val x = hd(gen_vars [dom] [tm1, tm2]);
	val tm1' = mk_app(tm1,x);
	val tm2' = mk_app(tm2,x);
	val (vs1,_) = dest_λ tm1;
	val (vs2,_) = dest_λ tm2;
	val s1 = aux vs1 x tm1';
	val s2 = aux vs2 x tm2';
	val s3 = eq_sym_rule s1;
	val s4 = eq_trans_rule s2 s3
		handle (Fail _) =>
		eq_trans_rule (conv_rule (RAND_C prc) s2)
		(conv_rule (RATOR_C prc) s3);
	val s5 = simple_∀_intro x s4;
	val s6 = inst_type_rule [(dom,tva),(ran,tvb)] ext_thm;
	val s7 = list_simple_∀_elim [tm2, tm1] s6;
	val s8 = eq_sym_rule s7;
	val s9 = ⇔_mp_rule s8 s5;
in
	s9
end
handle (Fail _) =>
term_fail "λ_varstruct_conv" 27050 [tm1,tm2]
);
end;
=TEX
=SML
local
val ⦏fst_conv⦎ : CONV = simple_eq_match_conv
	(all_∀_intro(rewrite_conv[pair_ops_def]⌜Fst (x, y)⌝));
val ⦏snd_conv⦎ : CONV = simple_eq_match_conv
	(all_∀_intro(rewrite_conv[pair_ops_def]⌜Snd (x, y)⌝));
in
val ⦏λ_pair_conv⦎ : CONV = (fn tm =>
let	val (v, _) = dest_λ tm
		handle Fail _ => term_fail "λ_pair_conv" 27007 [tm];
	val av = map (fst o dest_var) (frees v);
	fun n_comps ty = (
		let	val (lty, rty) = dest_×_type ty;
		in	n_comps lty + n_comps rty
		end	handle Fail _ => 1
	);
	val _ =	if length av < n_comps (type_of v) then ()
		else term_fail "λ_pair_conv" 27055 [v]
	fun do_var var_name n ty = (
		let	val (lty, rty) = dest_×_type ty;
			val (lvs, n1) = do_var var_name n lty;
			val (rvs, n2) = do_var var_name n1 rty;
		in	(mk_pair (lvs, rvs), n2)
		end	handle Fail _ =>
			let	val vn = string_variant av  (var_name ^ string_of_int n);
			in	(mk_var(vn, ty), n + 1)
			end			
	);
	fun do_vs x = (
		let	val (lv, rv) = dest_pair x;
		in	mk_pair(do_vs lv, do_vs rv)
		end	handle Fail _ =>
			let	val (var_name, ty) = dest_var x;
			in	fst(do_var var_name 1 ty)
			end
	);
	val vs = do_vs v;
	val app = mk_app (tm , vs);
	val new_b = snd(dest_eq(concl(β_conv app)));
	val new_tm = mk_λ(vs, new_b);
	val fst_snd_conv = TRY_C(ONCE_MAP_C (fst_conv ORELSE_C snd_conv));
in	(λ_varstruct_conv new_tm THEN_C fst_snd_conv) tm
end);

end;
=TEX
=SML
local
val ⦏ext_thm1⦎ = conv_rule (ONCE_MAP_C eq_sym_conv) ext_thm;
in
val ⦏λ_unpair_conv⦎ : CONV = (fn tm =>
	let	val (vs, b) = dest_λ tm
			handle ex as Fail _ => reraise ex "λ_unpair_conv";
		val _= dest_pair vs
			handle Fail _ => term_fail "λ_unpair_conv" 27056 [tm];
		fun names acc vs = (
			fst(dest_var vs)::acc
			handle Fail _ =>
				let	val (lvs, rvs) = dest_pair vs;
				in	names (names acc rvs) lvs
				end
		);
		val bv = variant (frees b) (mk_var (implode(names [] vs), type_of vs));
		val app1 = mk_app (tm, bv);
		val thm1 = β_conv app1;
		val b' = snd(dest_eq(concl thm1));
		val tm' = mk_simple_λ(bv, b');
		val app2 = mk_app (tm', bv);
		val thm2 = eq_sym_rule (simple_β_conv app2);
		val thm3 = simple_∀_intro bv (eq_trans_rule thm1 thm2);
		val thm4 = conv_rule (simple_eq_match_conv ext_thm1) thm3;
	in	thm4
	end		
);
end;

=TEX
=SML
local
	val uc_type = ⓣ('a → 'b → 'c) → 'a × 'b → 'c⌝;
in
fun ⦏λ_eq_rule⦎ (x : TERM) (thm : THM) : THM = (
let	val side_effect = if is_eq(concl thm)
		then ()
		else thm_fail "λ_eq_rule" 6020 [thm];
	fun aux x1 thm1 = (
	if is_var x1
	then (simple_λ_eq_rule x1 thm1
		handle complaint =>
		pass_on complaint "simple_λ_eq_rule" "λ_eq_rule")
	else (let	val (p,q) = dest_pair x1
			handle (Fail _) =>
			term_fail "λ_eq_rule" 4016 [x];
		val s1 = aux q thm1;
		val s2 = aux p s1;
		val uct = inst_type[(type_of p,tva),
			(type_of q,tvb),
			(type_of (fst(dest_eq(concl thm1))),tvc)]
			uc_type;
		val uc = mk_const("Uncurry", uct);
		val s3 = app_fun_rule uc s2;
	in
		s3
	end));
in
	aux x thm
end);
end;		
=TEX
=SML
fun ⦏λ_C⦎ (cnv : CONV) : CONV = (fn (tm : TERM) =>
let	val (x,b) = dest_λ tm
		handle complaint =>
		pass_on complaint "dest_λ" "λ_C";
	val s1 = cnv b;
	val s2 = λ_eq_rule x s1
		handle complaint =>
		divert complaint "λ_eq_rule" "λ_C" 7104
			[fn () => string_of_thm s1];
in
	s2
end);
=TEX
This could be implemented by $RAND\_C\ o\ λ\_C$ but the
following gives better diagnostics:
=SML
fun ⦏BINDER_C⦎ (cnv :  CONV): CONV = (fn (tm : TERM) =>
let	val (binder,abs) = dest_app tm;
	val (x,b) = dest_λ abs;
	val s1 = cnv b;
	val s2 = app_fun_rule binder (λ_eq_rule x s1)
		handle complaint =>
		list_divert complaint "BINDER_C" [
			("λ_eq_rule",7104,[fn () => string_of_thm s1]),
			("app_fun_rule",7104,[fn () => string_of_thm s1])];	
in
	s2
end
handle complaint =>
list_divert complaint "BINDER_C" [
	("dest_λ",27035,[fn () => string_of_term tm]),
	("dest_app",27035,[fn () => string_of_term tm])]
);
=TEX
\subsubsection{Concerning ∀}
=SML
fun ⦏∀_elim⦎ (tm : TERM) (thm : THM) : THM = (
let	val (vs,bdy) = dest_∀(concl thm)
		handle complaint =>
		divert complaint "dest_∀" "∀_elim" 27011
			[fn () => string_of_thm thm];
	val tis = type_match (type_of tm) (type_of vs)
		handle complaint =>
		divert complaint "type_match" "∀_elim" 27012
			[fn () => string_of_thm thm,
			fn () => string_of_term tm];
	val thm' = case tis of
		[] => thm
		| _ => (inst_type_rule tis thm
		handle complaint =>
		divert complaint "inst_type_rule" "∀_elim" 27013
			[fn () => string_of_thm thm,
			fn () => string_of_term tm]);
in
	if is_var vs
	then simple_∀_elim tm thm'
	else
(let	val s1 = conv_rule(simple_eq_match_conv ∀_uncurry_thm)
				thm';
	val s2 = simple_∀_elim tm s1;
	val s3 = if is_pair tm
		then conv_rule
		(APP_C (RAND_C (simple_eq_match_conv fst_thm),
			simple_eq_match_conv snd_thm)) s2
		else s2;
	val s4 = conv_rule(RATOR_C β_conv THEN_C β_conv)
				s3;
in
	s4
end)
end);
=TEX
=SML
local
	fun one_type tml = list_mk_→_type (BOOL :: map type_of tml);
in
fun ⦏list_∀_elim⦎ (tml : TERM list) (thm : THM): THM = (
	list_simple_∀_elim tml thm
handle (Fail _) =>
let	val (vsl,bdy) = strip_∀(concl thm);
	val ltml = length tml;
	val sideeffect = if length vsl < ltml
		then fail "list_∀_elim" 27014
			[fn () => string_of_thm thm,
			fn () => string_of_int ltml]
		else ();
	val vsl' = vsl to (ltml -1);
	val tis = type_match (one_type tml) (one_type vsl')
		handle complaint =>
		divert complaint "type_match" "list_∀_elim" 27015
			[fn () => string_of_thm thm,
			fn () => format_list string_of_term tml ","];
	val thm' = case tis of
		[] => thm
		| _ => (inst_type_rule tis thm
		handle complaint =>
		divert complaint "inst_type_rule" "list_∀_elim" 27016
			[fn () => string_of_thm thm,
			fn () => format_list string_of_term tml ","]);
fun aux [] [] thm1 = thm1
| aux (tm :: resttm) (vs :: restvs) thm1 = (
	if is_var vs
	then  aux resttm restvs (simple_∀_elim tm thm1)
	else
(let	val s1 = conv_rule(simple_eq_match_conv ∀_uncurry_thm)
				thm1;
	val s2 = simple_∀_elim tm s1;
	val s3 = if is_pair tm
		then conv_rule
		(APP_C (RAND_C (simple_eq_match_conv fst_thm),
			simple_eq_match_conv snd_thm)) s2
		else s2;
	val s4 = conv_rule(RATOR_C β_conv THEN_C β_conv)
				s3;
in
	aux resttm restvs s4
end))
| aux _ _ _ = error "list_∀_elim" 27017 [];
in
	aux tml vsl' thm'
end);
end;
=TEX
The algorithm to introduce a universally quantified $tm$ to $thm$ in the following is:
\begin{enumerate}
\item
Try $simple\_∀\_intro$ $tm$ $Γ\ ⊢\ conc$. If that succeeds then stop, otherwise:
\item
Rename any duplicate variables in $tm$, avoiding variables found
free in the conclusion or assumptions.
\item
For the invocation to be correct $tm$ must be of the form $(p,\ q)$.
Convert the theorem into $Γ\ ⊢\ (λ\ p\ q\ ⦁\ conc)\ p\ q$.
\item
Instantiate each variable of $tm$ with the matching components of variable $x$ (created by $Fst$ and $Snd$)
where $x$ has the same type as $tm$.
\item
Rewrite any introduced instances of $Fst\ y,\ Snd\ y$ with $y$.
\item
Generalise for $x$.
\item
Match the result with the theorem
=GFT HOL
⊢ ∀ f⦁ (∀ x⦁ f (Fst x) (Snd x)) ⇔ $∀ (Uncurry f)
=TEX
\item
This should leave a theorem in the desired form, because
the replacement for $f$ should be of the right form for the result to
be displayed as $∀\ tm\ ⦁\ conc$.
\end{enumerate}
We needn't avoid variables in $tm$ because they have to be of
a ``smaller'' type than the $x$ we create.
=SML
local
fun aux (av: TERM list) (tm : TERM) : (TERM * (TERM * TERM) list) = (
let 	val x = hd(gen_vars [type_of tm] av);
	fun aux1 x1 tm1 = (
		if is_var tm1
		then [(x1,tm1)]
		else  (let val (ftm1,stm1) = dest_pair tm1;
			val snms = aux1 (mk_snd x1) stm1;
			val fnms = aux1 (mk_fst x1) ftm1;
		in
			(fnms @ snms)
		end)
	);
in
	(x, aux1 x tm)
end);
val prc = pure_rewrite_conv [sfst_snd_thm];
in
fun ⦏∀_intro⦎ (tm : TERM) (thm : THM) : THM = (
	simple_∀_intro tm thm
handle (Fail _) =>
let	val conc = concl thm;
	val cf = frees conc;
	val tf = frees tm;
	val hf = list_union (op =$) (map frees (asms thm));
	val side_effect = if (any tf (fn x => present (op =$) x hf))
		then term_fail "∀_intro" 6005 [find tf (fn x => present (op =$) x hf)]
		else ();
	val unbound_cf = cf drop (fn x => present (op =$) x tf);
	val avoid = (unbound_cf @ hf);
	val tm' = rename_dups avoid tm
		handle complaint =>
		pass_on complaint "rename_dups" "∀_intro";
	val (vs1,vs2) = dest_pair tm';
	val s1 = conv_rule (fn x:TERM => eq_sym_rule
		((RATOR_C β_conv THEN_C β_conv)
		(list_mk_app(list_mk_λ([vs1,vs2],conc),
		[vs1,vs2])))) thm;
	val (x, insts) = aux avoid tm';
	val s2 = inst_term_rule insts s1;
	val s4 = conv_rule (TRY_C(RATOR_C(RAND_C prc)
		AND_OR_C RAND_C prc)) s2;
	val s5 = simple_∀_intro x s4;
	val s6 = conv_rule(simple_eq_match_conv s∀_uncurry_thm) s5;
in
	s6
end);
end;
val ⦏∀_uncurry_conv⦎ : CONV = (fn (tm : TERM) =>
let	val (vs,bdy) = dest_∀ tm;
	val side_effect = if is_pair vs
		then ()
		else term_fail "∀_uncurry_conv" 27038 [tm];
	val fvs = flat_vs "∀_uncurry_conv"  vs;
	val res_tm = list_mk_simple_∀ (fvs, bdy);
	val s1 = asm_rule tm;
	val s2 = ∀_elim vs s1;
	val s3 = list_simple_∀_intro fvs s2;
	val s4 = disch_rule tm s3;
	val s5 = asm_rule res_tm;
	val s6 = list_simple_∀_elim fvs s5;
	val s7 = ∀_intro vs s6;
	val s8 = disch_rule res_tm s7;
	val s9 = ⇔_intro s4 s8;
in
	s9
end
handle complaint =>
list_divert complaint "∀_uncurry_conv" [
	("dest_∀", 27038, [fn () => string_of_term tm])
	]
);
=TEX
=SML
val ⦏all_∀_uncurry_conv⦎ : CONV = (fn tm =>
let fun aux tm' = (
	let val (tm1,tm2) = dest_app tm';
	in
	(if fst(dest_const tm1) = "∀"
	then (if is_simple_λ tm2
		then SIMPLE_BINDER_C aux
		else (BINDER_C aux AND_OR_C ∀_uncurry_conv)
	) else fail_conv) tm'
	end);
in
	aux tm
end
handle complaint =>
list_divert  complaint "all_∀_uncurry_conv" [
	("fail_conv",27041,[fn () => string_of_term tm]),
	("dest_const",27041,[fn () => string_of_term tm]),
	("dest_app",27041,[fn () => string_of_term tm]),
	("∀_uncurry_conv",27041,[fn () => string_of_term tm])]
);

val ⦏all_∀_uncurry_rule⦎ = conv_rule(TRY_C all_∀_uncurry_conv);
=TEX
=SML
fun ⦏all_∀_elim⦎ (thm: THM): THM = (
	all_simple_∀_elim thm
handle (Fail _) =>
let	val thm' = all_∀_uncurry_rule thm;
in
	all_simple_∀_elim thm'
end);
=TEX
\subsubsection{Concerning ε}
=SML
local
	val pfs = pure_rewrite_conv[sfst_snd_thm];
in
fun ⦏ε_elim_rule⦎ (vs :TERM) (cthm : THM) (wthm : THM) : THM = (
	simple_ε_elim_rule vs cthm wthm
handle (Fail _) =>
let	val fvs = flat_vs "ε_elim_rule" vs;
	val side_effect = case (two_the_same fvs) of
		Value x => term_fail "ε_elim_rule" 27043 [x,vs]
		| Nil => ();
	val wconc = concl wthm;
	val cconc = concl cthm;
	val fwconc = frees wconc;
	val fcconc = frees cconc;
	val (t,ct) = dest_app cconc;
	val asm = mk_app (t,vs);
	val side_effect = if any fvs (fn x => present (op =$) x fcconc)
		then fail "ε_elim_rule" 27051 [
			fn () => string_of_term vs,
			fn () => string_of_thm cthm]
		else if any fvs (fn x => present (op =$) x fwconc)
		then fail "ε_elim_rule" 27051 [
			fn () => string_of_term vs,
			fn () => string_of_thm wthm]
		else ();
	val x = (case gen_vars [type_of vs] (fwconc @ fcconc @ fvs
		@ asms cthm @ asms wthm) of
		[term] => term
		| _ => error "ε_elim_rule" 6032 [])
		handle complaint =>
		pass_on complaint "gen_vars" "ε_elim_rule";
	val s1 = ⇒_intro asm wthm;
	val s2 = ∀_intro vs s1
		handle complaint =>
		if area_of complaint <> "∀_intro"
		then reraise complaint (area_of complaint)
		else fail "ε_elim_rule" 27052 [
			fn () => string_of_term vs,
			fn () => string_of_thm wthm,
			fn () => string_of_term asm];
	val s3 = ∀_elim x s2;
	val s4 = conv_rule(RATOR_C(RAND_C pfs)) s3;
	val s5 = undisch_rule s4;
	val s6 = simple_ε_elim_rule x cthm s5;
in
	s6
end
handle complaint =>
list_divert complaint "ε_elim_rule" [
	("dest_app", 7019, [fn () => string_of_thm cthm]),
	("mk_app", 7054, [fn () => string_of_term vs]),
	("pure_rewrite_conv", 27045, [fn () => string_of_term vs,
			fn () => string_of_thm cthm,
			fn () => string_of_thm wthm
		])
	]);
end;
=TEX
\subsubsection{Concerning ∃}
$v\_∃\_intro$ originally used a very different approach from that of $∃\_intro$
that was faster than the more general rule. Changes to performance
characteristics mean that is now faster just to follow
the approach of $simple\_∃\_intro$ using $β\_conv$ instead of $simple\_β\_conv$.
=SML
local
	val tva = mk_vartype "'a";
in
fun ⦏v_∃_intro⦎ (v : TERM) (thm : THM) : THM = (
let
	val conc = concl thm;
	val abs = mk_λ (v,conc)
		handle complaint =>
		pass_on complaint "mk_λ" "v_∃_intro";
	val s1 = inst_type_rule[(type_of v, tva)]∃_intro_thm;
	val s2 = list_simple_∀_elim[abs,v]s1;
	val absv = fst(dest_⇒(concl s2));
	val s3 = β_conv absv;
	val s4 = eq_sym_rule s3;
	val s5 = ⇔_mp_rule s4 thm;
	val s6 = ⇒_elim s2 s5;
in
	s6
end);
end;
=TEX
=TEX
The algorithm we use is:
\begin{enumerate}
\item
Try $simple\_∃\_intro$ $tm$ $Γ\ ⊢\ conc$. If that succeeds then stop, otherwise:
\item
For the remaining calls $tm$ must be of the form
$∃\ (vs1,vs2)\ ⦁\ bdy$.
We rename any duplicate variables in $(vs1,vs2)$, avoiding variables found
free in the conclusion or assumptions.
\item
We determine what the variables in $(vs1,vs2)$ must match
in the conclusion of $thm$.
\item
From these matches we determine the matching structures to $(vs1,vs2)$, say $(ivs1,ivs2)$
\item
Convert the theorem into $Γ\ ⊢\ (λ\ vs1\ vs2\ ⦁\ conc)\ ivs1\ ivs2$.
\item
Convert the theorem to the form
$Γ\ ⊢\ (λ\ vs1\ vs2\ ⦁\ conc)\ (Fst(ivs1,ivs2))\ (Snd(ivs1,ivs2))$.
\item
Use $simple\_∃\_intro$ to get
$Γ\ ⊢\ ∃\ x⦁\ (λ\ vs1\ vs2\ ⦁\ conc)\ (Fst x)\ (Snd x)$.
\item
Match the result with the theorem
=GFT HOL
⊢ ∀ f⦁ (∃ x⦁ f (Fst x) (Snd x)) ⇔ $∃ (Uncurry f)
=TEX
\item
This should leave a theorem in the desired form, because
the replacement for $f$ should be of the right form for the result to
be displayed as $∃\ tm\ ⦁\ conc$.
\end{enumerate}
There is a certain amount of trickery involving removing
duplicate names in the variable structure in the below.
=SML
fun ⦏∃_intro⦎ (tm : TERM) (thm : THM) = (
	simple_∃_intro tm thm
handle (Fail _) =>
let	val (vs,bdy) = dest_∃ tm
		handle complaint =>
		pass_on complaint "dest_∃" "∃_intro";
	val conc = concl thm;
	val (tys,einsts) = term_match conc bdy;
	val side_effect = case tys of
		[] => ()
		| _ => fail "∃_intro" 7047 [
			fn () =>string_of_term tm,
			fn () => string_of_thm thm];
	val cf = frees conc;
	val tf = frees tm;
	val vs' = rename_dups (cf @ tf) vs;
	val (vs1',vs2') = dest_pair vs';
	val (vs1,vs2) = dest_pair vs;
	val ivs1 = var_subst einsts vs1;
	val ivs2 = var_subst einsts vs2;
	val ivs = mk_pair(ivs1,ivs2);
	val λbit = list_mk_λ([vs1',vs2'],bdy);
	val s1 = conv_rule (fn x:TERM => eq_sym_rule
		((RATOR_C β_conv THEN_C β_conv)
		(list_mk_app(λbit,[ivs1,ivs2])))) thm;
	val ty_inst = [(type_of vs1,tva),(type_of vs2,tvb)];
	val ivs1_thm = list_simple_∀_elim [ivs1,ivs2]
		(inst_type_rule ty_inst sfst_thm);
	val ivs2_thm = list_simple_∀_elim [ivs1,ivs2]
		(inst_type_rule ty_inst ssnd_thm);
	val s2 = conv_rule (APP_C((RAND_C (fn x => ivs1_thm),
			(fn x => ivs2_thm)))) s1;
	val hf = list_union (op =$) (map frees (asms thm));
	val x = hd(gen_vars [type_of vs] (cf @ hf));
	val template = mk_simple_∃(x,
		list_mk_app(λbit,[mk_fst x, mk_snd x]));
	val s3 = simple_∃_intro template s2;
	val s4 = conv_rule(simple_eq_match_conv s∃_uncurry_thm) s3;
in
	s4
end
handle complaint =>
list_divert complaint "∃_intro" [
	("term_match", 7047, [fn () => string_of_term tm,
		fn () => string_of_thm thm])
	]);
=TEX
=SML
fun ⦏list_simple_∃_intro⦎
		(wits : TERM list)
		(tm : TERM)
		(thm1 : THM) : THM = (
	let	val tm1 = concl thm1;
		val (bvs1, body1) = strip_simple_∃ tm1;
		val (bvs, body) = strip_simple_∃ tm;
		val ¬_tm = mk_¬ tm;
		val thm2 = asm_rule ¬_tm;
		fun aux_conv n = (
			if	n = 0
			then	refl_conv
			else if	n = 1
			then	¬_simple_∃_conv
			else	¬_simple_∃_conv THEN_C
				SIMPLE_BINDER_C (aux_conv (n-1))
		);
		val thm3 = conv_rule (aux_conv(length wits)) thm2
			handle ex as (Fail _) =>
			reraise ex "list_simple_∃_intro";
		val thm4 = list_simple_∀_elim wits thm3
			handle ex as Fail _ => reraise ex "list_simple_∃_intro";
		val thm5 = ¬_intro ¬_tm thm1 thm4
			handle Fail _ =>
 			fail "list_simple_∃_intro" 7047 [
			fn () => string_of_term tm,
			fn () => string_of_thm thm1];
		val thm6 = simple_⇔_match_mp_rule ¬_¬_thm thm5;
	in	thm6
	end
);
=TEX
=SML
fun ⦏∃_elim⦎ (vs : TERM) (thm1 : THM) (thm2 : THM) : THM = (
	simple_∃_elim vs thm1 thm2
handle (Fail _) =>
let	val cthm1 = concl thm1;
	val cthm2 = concl thm2;
	val (vsx,tx) = dest_∃ cthm1;
	val (tys,subs) = term_match vsx vs;
	val side_effect = if is_nil tys
		then ()
		else fail "∃_elim" 27042 [
		fn () => string_of_term vs,
		fn () => string_of_thm thm1];
	val t1 = snd(dest_app cthm1);
	val fvs = frees vs;
	val fs_thm1 = list_union (op =$) (frees cthm1 :: (map frees (asms thm1)));
	val fs_cthm2 = frees cthm2;
	val all_frees = list_union (op =$) (fs_thm1:: fs_cthm2 ::
		 (map frees (asms thm2)));
	val vs' = rename_dups (all_frees drop (fn x => present (op =$) x fvs)) vs;
	val t1v = mk_app (t1, vs');
	val tvx = (case gen_vars [BOOL] (all_frees @ (frees vs')) of
		[term] => term
		| _ => error "∃_elim" 6032 [])
		handle complaint =>
		pass_on complaint "gen_vars" "∃_elim";
	val s1 = inst_type_rule [(type_of vs, tva)] ∃_def;
	val s2 = app_arg_rule t1 s1;
	val s3 = ⇔_mp_rule s2 thm1;
	val s5 = conv_rule simple_β_conv s3;
	val s6 = β_conv t1v;
	val s7 = eq_sym_rule s6;
	val asm = fst(dest_eq(concl s7));
	val fs_thm2_less = list_union (op =$) (fs_cthm2 ::
		map frees (asms thm2 drop (fn x => x =$ asm)));
	val s8 = ⇒_intro asm thm2;
	val template = mk_⇒ (tvx, cthm2);
	val s10 = subst_rule [(s7, tvx)] template s8;
	val s11 = undisch_rule s10;
	val s12 = (ε_elim_rule vs' s5 s11)
		handle complaint as (Fail _) =>
		(if any fvs (fn x => present (op =$) x fs_thm1)
		then fail "∃_elim" 27051 [
			fn () => string_of_term vs,
			fn () => string_of_thm thm1]
		else if any fvs (fn x => present (op =$) x fs_thm2_less)
		then fail "∃_elim" 27052 [
			fn () => string_of_term vs,
			fn () => string_of_thm thm2,
			fn () => string_of_term asm]
		else
		pass_on complaint "ε_elim_rule" "∃_elim");
in
	s12
end
handle complaint =>
list_divert complaint "∃_elim" [
	("term_match", 27042, [
		fn () => string_of_term vs,
		fn () => string_of_thm thm1]),
	("dest_∃", 27046, [fn () => string_of_thm thm1])
	]);
=TEX
=SML
local
	fun list_v_∃_intro tml thm = fold (uncurry v_∃_intro) tml thm;
	fun list_simple_∃_elim [] tm wthm = wthm
	| list_simple_∃_elim (v :: rest) tm wthm = (
		let	val tm' = mk_simple_∃(v, tm);
		in
		list_simple_∃_elim rest tm'
			(simple_∃_elim v (asm_rule tm') wthm)
		end);
		
in
val ⦏∃_uncurry_conv⦎ : CONV = (fn (tm : TERM) =>
let	val (vs,bdy) = dest_∃ tm;
	val side_effect = if is_pair vs
		then ()
		else term_fail "∃_uncurry_conv" 27047 [tm];
	val fvs = flat_vs "∃_uncurry_conv" vs;
	val res_tm = list_mk_simple_∃ (fvs, bdy);
	val s1 = asm_rule tm;
	val s2 = asm_rule bdy;
	val s3 = list_v_∃_intro fvs s2;
	val s4 = ∃_elim vs s1 s3;
	val s5 = disch_rule tm s4;

	val s6 = asm_rule res_tm;
	val s7 = v_∃_intro vs s2;
	val s8 = list_simple_∃_elim (rev fvs) bdy s7;
	val s9 = disch_rule res_tm s8;
	val s10 = ⇔_intro s5 s9;
in
	s10
end
handle complaint =>
list_divert complaint "∃_uncurry_conv" [
	("dest_∃", 27047, [fn () => string_of_term tm])
	]
);
end;
=TEX
=SML
val ⦏all_∃_uncurry_conv⦎ : CONV = (fn tm =>
let fun aux tm' = (
	let val (tm1,tm2) = dest_app tm';
	in
	(if fst(dest_const tm1) = "∃"
	then (if is_simple_λ tm2
		then SIMPLE_BINDER_C aux
		else (BINDER_C aux AND_OR_C ∃_uncurry_conv)
	) else fail_conv) tm'
	end);
in
	aux tm
end
handle complaint =>
list_divert  complaint "all_∃_uncurry_conv" [
	("fail_conv",27048,[fn () => string_of_term tm]),
	("dest_const",27048,[fn () => string_of_term tm]),
	("dest_app",27048,[fn () => string_of_term tm]),
	("∃_uncurry_conv",27048,[fn () => string_of_term tm])]
);
val ⦏all_∃_uncurry_rule⦎ = conv_rule(TRY_C all_∃_uncurry_conv);
=TEX
\subsection{Derived Rules}
\subsection{Concerning ⇒}
N.B. the error handling on $simple\_⇒\_match\_mp\_rule$
is currently spurious, as it doesn't partially evaluate.
=SML
fun ⦏⇒_match_mp_rule⦎ (thm1 : THM) : THM -> THM = (
let	val thm1' = all_∀_uncurry_rule thm1;
	val r' = simple_⇒_match_mp_rule thm1'
		handle complaint =>
		pass_on complaint "simple_⇒_match_mp_rule"
			"⇒_match_mp_rule";
in
	(fn (thm2 : THM) =>
	r' thm2
	handle (Fail _) =>
	thm_fail "⇒_match_mp_rule" 7044 [thm1, thm2])
end);
=TEX
=SML
fun ⦏⇒_match_mp_rule1⦎ (thm1 : THM) : THM -> THM = (
let	val thm1' = all_∀_uncurry_rule thm1;
	val r' = simple_⇒_match_mp_rule1 thm1'
		handle complaint =>
		pass_on complaint "simple_⇒_match_mp_rule1"
			"⇒_match_mp_rule1";
in
	(fn (thm2 : THM) =>
	r' thm2
	handle complaint => reraise complaint "⇒_match_mp_rule1")
end);
=TEX
=SML
fun ⦏⇒_match_mp_rule2⦎ (thm1 : THM) : THM -> THM = (
let	val thm1' = all_∀_uncurry_rule thm1;
	val r' = simple_⇒_match_mp_rule2 thm1'
		handle complaint =>
		pass_on complaint "simple_⇒_match_mp_rule2"
			"⇒_match_mp_rule2";
in
	(fn (thm2 : THM) =>
	r' thm2
	handle complaint => reraise complaint "⇒_match_mp_rule2")
end);
=TEX
In the following, note that $aux2$ is coded so that it only uses $asm\_rule$
in cases where the transformation is not required. This is intended to avoid
taking the theorem apart and putting it back together unnecessarily via
inference.

Note, we do not directly use the matching modus ponens rule as the
detailed design would have it, but arrange to uncurry
all the implications but once.
=SML
local
val ⦏¬_convs⦎ = map
	(fn t => simple_eq_match_conv1
		(all_∀_intro (tac_proof(([], t), simple_taut_tac))))
	[⌜¬t ⇒ F ⇔ t⌝, ⌜t ⇒ F ⇔ ¬t⌝];
in
fun ⦏forward_chain_rule⦎ (imps : THM list) (ants : THM list) : THM list = (
let	val match_mp_rule =
		case current_ad_mmp_rule() of
			Value r => r
		|	Nil => ⇒_match_mp_rule2;
	val imp_rules = mapfilter match_mp_rule imps;
	fun aux1 acc _ [] = (acc
	) | aux1 acc (i :: il) (al as (a :: _)) = (
		(let val res = i a
		in
		if concl res =$ mk_f
		then [res]
		else
		(aux1 (res::acc) il al)
		end)
		handle Fail _ => aux1 acc il al
	) | aux1 acc [] (_ :: al) = (aux1 acc imp_rules al
	);
	fun aux2 thm = (
		case dest_term (concl thm) of
			D∀ (x, b) => (
				let val th = aux2 (asm_rule b);
				in ∀_intro x (prove_asm_rule (∀_elim x thm) th)
				end
		) |	D⇒ (a, b) => (
				(conv_rule(FIRST_C ¬_convs) thm)
				handle Fail _ =>
				let val th = aux2 (asm_rule b);
				in ⇒_intro a (prove_asm_rule(undisch_rule thm) th)
				end
		) |	_ => fail "" 99999 []
	);
	fun aux3 th = all_∀_intro (aux2 th handle Fail _ => th);
in	map aux3 (aux1 [] imp_rules ants)
end);
end;
val ⦏fc_rule⦎ : THM list -> THM list -> THM list = forward_chain_rule;
=TEX
=SML
fun CHANGED_CAN (can : CANON) : CANON = (fn thm =>
	case can thm of
		[thm1] => (
			if	dest_thm thm ~=# dest_thm thm1
			then	fail_canon thm
			else	[thm1]
	) |	[]	=> []
	|	more	=> more
);
=TEX
Note that
=INLINEFT
∀_rewrite_canon
=TEX
\ is not available when this document is compiled so we cannot
use it in $cans$ below.
=SML
fun ∀_fc_canon (th : THM) : THM list  = (dest_∀(concl th); [all_∀_elim th]);
fun ∨_fc_canon (th : THM) : THM list = (
	let	val (ant, _) = dest_⇒ (concl th);
		val (a, b) = dest_∨ ant;
		val th1 = ∨_left_intro a (asm_rule b);
		val th2 = ∨_right_intro b (asm_rule a);
		val th3 = disch_rule b (⇒_elim th th1);
		val th4 = disch_rule a (⇒_elim th th2);
	in	[th3, th4]
	end
);
fun ∃_fc_canon (th : THM) : THM list = (
	let	val c = concl th;
		val (ant, _) = dest_⇒ c;
		val (x, b) = dest_∃ ant;
		val x' = varstruct_variant
			(flat(map frees(c::asms th))) x;
		val b' = subst[(x',x)]b;
		val th1 = ∃_intro ant (asm_rule b');
		val th2 = disch_rule b' (⇒_elim th th1);
	in	[th2]
	end
);
fun ⦏FORWARD_CHAIN_CAN⦎ (cans : CANON list) (thm : THM) : THM list = (
let	val st = current_ad_st_conv();
	val sc = current_ad_sc_conv();
	fun fc_disch_rule tm th = (
		let	val th1 = disch_rule tm th;
		in	(conv_rule (LEFT_C st) th1)
			handle Fail _ => th1
		end	handle Fail _ => th
	);
	fun ⇔_fc_canon th =[fst(⇔_elim th)];
	fun sc_canon th = [conv_rule sc th];
	fun other_canon th = (
	let	val c = concl th;
	in	case dest_term c of
			D⇒ _ => fail_canon th
		|	DF => fail_canon th
		|	DT => []
		|	_ =>
			let	val ¬_c = mk_¬ c;
				val th1 = ¬_elim mk_f (asm_rule ¬_c) th;
				val th2 = ⇒_intro ¬_c th1;
			in	[th2]
			end
		end
	);
	fun aux_canon thm = (
	let	fun ∧_fc_canon th = (
		let	val (ant, _) = dest_⇒ (concl th);
			val (a, _) = dest_∧ ant;
			val th1 = ∧_⇒_rule th;
			val th2 = undisch_rule th1;
		in	map (fc_disch_rule a) (aux_canon th2)
		end);
		fun ⇒_fc_canon th = (
			let	val (ant, _) = dest_⇒ (concl th);
			in	case dest_term ant of
					DT => [⇒_elim th t_thm]
				|	DF => []
				|	_	=>
					if (is_¬ ant
					andalso dest_¬ ant term_mem asms th)
					orelse (mk_¬ ant term_mem asms th)
					then	[]
					else
			let
				val th1 = undisch_rule th;
			in	map (fc_disch_rule ant) (aux_canon th1)
			end
			end
		);
	in	REPEAT_CAN(CHANGED_CAN(FIRST_CAN(cans @ [
			∧_rewrite_canon, ∀_fc_canon, ∧_fc_canon,
			∨_fc_canon, ∃_fc_canon,
			⇒_fc_canon,
			⇔_fc_canon, sc_canon, other_canon]))) thm
	end
);
in	(REWRITE_CAN aux_canon) thm
end
);
=TEX
=SML
val ⦏FC_CAN⦎ : CANON list -> CANON = FORWARD_CHAIN_CAN;
val ⦏forward_chain_canon⦎ : CANON = FC_CAN [];
val ⦏fc_canon⦎ : CANON = forward_chain_canon;
val ⦏⇔_canon⦎ : CANON = ((fn (x, y) => [x,y]) o ⇔_elim);
val ⦏forward_chain_canon1⦎ : CANON = FC_CAN [⇔_canon];
val ⦏fc_canon1⦎ : CANON = forward_chain_canon1;
=TEX
=SML
fun ⦏FORWARD_CHAIN_⇔_CAN⦎ (cans : CANON list) (thm : THM) : THM list = (
let	fun aux_canon thm = (
	let	fun is_opt_¬_⇔ tm = (
			(dest_⇔ tm; true)
				handle Fail _ => (
					(dest_⇔ (dest_¬ tm); true)
						handle Fail _ => false)
		);
		val st = COND_C (not o is_opt_¬_⇔) (current_ad_st_conv()) fail_conv;
		val sc = COND_C (not o is_opt_¬_⇔) (current_ad_sc_conv()) fail_conv;
		fun fc_disch_rule tm th = (
			let	val th1 = disch_rule tm th;
			in	(conv_rule (LEFT_C st) th1)
				handle Fail _ => th1
			end	handle Fail _ => th
		);
		fun ∧_fc_canon th = (
			let	val (ant, _) = dest_⇒ (concl th);
				val (a, _) = dest_∧ ant;
				val th1 = ∧_⇒_rule th;
				val th2 = undisch_rule th1;
			in	map (fc_disch_rule a) (aux_canon th2)
			end
		);
		fun ⇒_fc_canon th = (
			let	val (ant, _) = dest_⇒ (concl th);
			in	case dest_term ant of
					DT => [⇒_elim th t_thm]
				|	DF => []
				|	_	=>
					if (is_¬ ant
					andalso dest_¬ ant term_mem asms th)
					orelse (mk_¬ ant term_mem asms th)
					then	[]
					else
			let
				val th1 = undisch_rule th;
			in	map (fc_disch_rule ant) (aux_canon th1)
			end
			end
		);
		fun sc_canon th = [conv_rule sc th];
		fun other_canon th = (
			let	val c = concl th;
			in	case dest_term c of
				D⇒ _ => fail_canon th
			|	DF => fail_canon th
			|	DT => []
			|	_ =>
				let	val ¬_c = mk_¬ c;
					val th1 = ¬_elim mk_f (asm_rule ¬_c) th;
					val th2 = ⇒_intro ¬_c th1;
				in	[th2]
				end
			end
		);
	in	REPEAT_CAN(CHANGED_CAN(FIRST_CAN(cans @ [
			∧_rewrite_canon, ∀_fc_canon, ∧_fc_canon,
			∨_fc_canon, ∃_fc_canon,
			⇒_fc_canon, sc_canon, other_canon]))) thm
	end
);
in	(REWRITE_CAN aux_canon) thm
end
);
=SML
val ⦏FC_⇔_CAN⦎ : CANON list -> CANON = FORWARD_CHAIN_⇔_CAN;
val ⦏forward_chain_⇔_canon⦎ : CANON = FC_⇔_CAN [];
val ⦏fc_⇔_canon⦎ : CANON = forward_chain_⇔_canon;
=TEX
\subsection{Concerning ⇔}
N.B. the error handling on $simple\_⇔\_match\_mp\_rule$
is currently spurious, as it doesn't partially evaluate.
=SML
fun ⦏⇔_match_mp_rule⦎ (thm1 : THM) : THM -> THM = (
let	val thm1' = all_∀_uncurry_rule thm1;
	val r' = simple_⇔_match_mp_rule thm1'
		handle complaint =>
		pass_on complaint "simple_⇔_match_mp_rule"
			"⇔_match_mp_rule";
in
	(fn (thm2 : THM) =>
	r' thm2
	handle (Fail _) =>
	thm_fail "⇔_match_mp_rule" 7044 [thm1, thm2])
end);
=TEX
=SML
fun ⦏⇔_match_mp_rule1⦎ (thm1 : THM) : THM -> THM = (
let	val thm1' = all_∀_uncurry_rule thm1;
	val r' = simple_⇔_match_mp_rule1 thm1'
		handle complaint =>
		pass_on complaint "simple_⇔_match_mp_rule1"
			"⇔_match_mp_rule1";
in
	(fn (thm2 : THM) =>
	r' thm2
	handle complaint => reraise complaint "⇔_match_mp_rule1")
end);
=TEX
\subsection{Concerning =}
=SML
fun ⦏eq_match_conv⦎ (thm: THM): CONV = (
let	val thm' = all_∀_uncurry_rule thm;
	val c' = simple_eq_match_conv thm';
in
	(fn tm => c' tm
	handle (Fail _) =>
	fail "eq_match_conv" 7044 [
		fn () => string_of_term tm,	
		fn () => string_of_thm thm])
end);
=TEX
=SML
fun ⦏eq_match_conv1⦎ (thm: THM): CONV = (
let	val thm' = all_∀_uncurry_rule thm;
	val c' = simple_eq_match_conv1 thm'
		handle complaint =>
		if area_of complaint <> "simple_eq_match_conv1"
		then reraise complaint (area_of complaint)
		else thm_fail "eq_match_conv1" 27003 [thm];
in
	(fn tm => c' tm
	handle (Fail _) =>
	fail "eq_match_conv1" 7044 [
		fn () => string_of_term tm,	
		fn () => string_of_thm thm])
end);
=TEX
\subsection{Concerning λ}
=SML
fun ⦏β_rule⦎ (thm : THM): THM = (
	conv_rule β_conv thm
	handle complaint =>
	divert complaint "β_conv" "β_rule" 27007
		[fn () => string_of_thm thm]
);
=TEX
The below follows the pattern of $all\_simple\_β\_conv$,
except that arguments to $λ$-abstractions must be checked for
$λ$-abstractions within pairs:
we do not try to work out whether such
paired abstractions will be exposed - we assume they will be.
=SML
local
	fun is_paired_λ tm = (
	let	val (tm1,tm2) = dest_pair tm;
	in
		is_paired_λ tm1 orelse is_paired_λ tm2
	end
	handle (Fail _) => is_λ tm
	);
in	
val ⦏all_β_conv⦎ : CONV = (
let
fun rhs (thm: THM) : TERM = snd(dest_eq(concl thm));
fun asbc (tm : TERM) : THM OPT = (
let	val dt = dest_simple_term tm;

	fun aux1 thm1 thm2 = (
	let	val s1 = mk_app_rule thm1 thm2
	in
		Value (
		if not(is_λ(rhs thm1))
		then s1
		else (let val s2 = conv_rule (RAND_C β_conv) s1;
		in
		if is_paired_λ(rhs thm2)
		then (
			case (asbc (rhs s2)) of
			Nil => s2
			| Value s3 => eq_trans_rule s2 s3
		) else s2
		end)
		)
	end);

	fun aux2 (f : TERM) (x : TERM) : THM OPT = (
	if is_λ f
	then 	(Value(
		if is_paired_λ x
		then ((β_conv THEN_TRY_C(fn tm1 =>
			force_value (asbc tm1))) tm)
		else (β_conv tm)
		))
	else Nil);

	fun aux (App (f, x)) = (
	let	val fr = asbc f;
		val xr = asbc x;
	in
		case (fr,xr) of
		(Nil, Nil) => aux2 f x
		| (Value frt,Nil) => aux1 frt (refl_conv x)
		| (Nil, Value xrt) => aux1 (refl_conv f) xrt
		| (Value frt, Value xrt) => aux1 frt xrt
	end
	) | aux (Simpleλ (x, b)) = (
	let	val br = asbc b
	in
		case br of
		Nil => Nil
		| (Value brt) => Value(simple_λ_eq_rule x brt)
	end
	) | aux _ = Nil;
in
	aux dt
end);
in
	(fn (tm:TERM) => case (asbc tm) of
		Value red => red
		| Nil => term_fail "all_β_conv" 27049 [tm])
end);
end;
=TEX
=SML
fun ⦏all_β_rule⦎ (thm : THM) =(
	conv_rule all_β_conv thm
	handle complaint =>
	divert complaint "all_β_conv"
		"all_β_rule" 27049 [fn () => string_of_thm thm]
);
=TEX
=SML
val ⦏η_conv⦎ : CONV = (fn (tm : TERM) =>
	simple_eq_match_conv η_axiom tm
handle (Fail _) =>
let	val (vs,tvs') = dest_λ tm;
	val (t,vs') = dest_app tvs';
in
	if is_pair vs andalso (vs =$ vs')
	then (simple_eq_match_conv uc_thm THEN_C
		λ_C(RATOR_C β_conv THEN_C β_conv THEN_C
		RAND_C (MAP_C(simple_eq_match_conv sfst_snd_thm))) THEN_C
		simple_eq_match_conv η_axiom)
		tm
	else term_fail "η_conv" 27023 [tm]
end
handle complaint =>
list_divert complaint "η_conv" [
	("dest_λ", 27018, [fn () => string_of_term tm]),
	("dest_app", 27018, [fn () => string_of_term tm]),
	("MAP_C", 27023, [fn () => string_of_term tm]),
	("simple_eq_match_conv", 27023, [fn () => string_of_term tm])]
);
=TEX
=SML
=TEX
\subsection{Concerning ∀}
As $list\_simple\_∀\_intro$ has the same pattern,
we don't attempt to use that function and fail, but go
straight into the complex form.
=SML
fun ⦏list_∀_intro⦎ (tml : TERM list) (thm : THM) : THM = (
	fold (uncurry ∀_intro) tml thm
	handle complaint =>
	pass_on complaint "∀_intro" "list_∀_intro"
);
=TEX
=SML
local
	fun aux 1 = ¬_simple_∀_conv
	| aux n = ¬_simple_∀_conv THEN_C (SIMPLE_BINDER_C (aux(n-1)));
in
val ⦏¬_∀_conv⦎ : CONV = (fn (tm : TERM) =>
	¬_simple_∀_conv tm
handle (Fail _) =>
let	val (vs,bdy) = dest_∀(dest_¬ tm);
	val lvs = length(flat_vs "¬_∀_conv" vs);
in
	(RAND_C ∀_uncurry_conv THEN_C
	aux lvs THEN_C
	(fn x => eq_sym_rule(∃_uncurry_conv (mk_∃(vs,mk_¬ bdy))))) tm
end
handle complaint =>
list_divert complaint "¬_∀_conv" [
	("dest_¬",27019,[fn () => string_of_term tm]),
	("dest_∀",27019,[fn () => string_of_term tm])]
);
end;
=TEX
=SML
fun ⦏∀_⇔_rule⦎ (vs : TERM) (thm : THM)  : THM = (
	app_fun_rule (quantifier "∀" (type_of vs) BOOL)
	(λ_eq_rule vs thm
	handle complaint =>
	pass_on complaint "λ_eq_rule" "∀_⇔_rule")
handle complaint =>
divert complaint "app_fun_rule" "∀_⇔_rule" 7062 [fn () => string_of_thm thm]
);
=TEX
=IGN
fun mimic_vs vs froml = (
let	fun aux vs' froml' = (
		if is_pair vs'
		then (let val (vs1,vs2) = dest_pair vs';
			val (vs1',frml) = aux vs1 froml';
			val (vs2',frml') = aux vs2 frml;
		in
			(mk_pair(vs1',vs2'),frml')
		end)
		else (hd froml', tl froml)
	)
in
	hd(aux vs froml)
end);
fun arb_vs vs avoid = (
let	val fvs = flat_vs vs;
in
	mimic_vs vs (gen_vars (map type_of fvs) (fvs @ avoid))
end);
=TEX
The following is meant to be fast:
=SML
fun ⦏∀_arb_elim⦎ (thm : THM) :THM = (
let	val (seqasms,conc) = dest_thm thm;
	val (vs,bdy) = dest_∀ conc;
	val (thm',fvs) = if is_var vs
		then (thm, [vs])
		else (conv_rule ∀_uncurry_conv thm,
			flat_vs "∀_arb_elim" vs);
	val fvs' = gen_vars (map type_of fvs) (conc :: (fvs @ seqasms));
in
	list_simple_∀_elim fvs' thm'
end
handle complaint =>
divert complaint "dest_∀" "∀_arb_elim" 27011 [fn () => string_of_thm thm]
);
=TEX
The following is meant to be fast:
=SML
fun ⦏all_∀_arb_elim⦎ (thm : THM) :THM = (
let	val thm' = all_∀_uncurry_rule thm;
	val (seqasms,conc) = dest_thm thm';
	val vl = fst(strip_simple_∀ conc);
	val vl' = gen_vars (map type_of vl) (conc :: (vl @ seqasms));
in
	list_simple_∀_elim vl' thm'
end);
=TEX
=SML
fun ⦏∀_asm_rule⦎ (vs : TERM) (asm : TERM) (thm :THM) : THM = (
let	val s1 = asm_rule (mk_∀(vs,asm));
	val s2 = ∀_elim vs s1;
	val s3 = prove_asm_rule s2 thm;
in
	s3
end
handle complaint =>
pass_on complaint "mk_∀" "∀_asm_rule"
);
=TEX
=SML
fun ⦏llassoc3⦎ ((x, y) :: rest : (TERM * 'b) list) (what : TERM) : 'b = (
	if x =$ what
	then y
	else llassoc3 rest what
) | llassoc3 [] _ = fail "llassoc3" 1005 [];
=TEX
=SML
fun ⦏lrassoc3⦎ ((x, y) :: rest : ('a * TERM) list)(what : TERM) : 'a = (
	if y =$ what
	then x
	else lrassoc3 rest what
) | lrassoc3 [] _ = fail "lrassoc3" 1005 [];

=TEX
=SML
fun  ⦏∀_reorder_conv⦎ (tm1 : TERM) : CONV = (fn (tm2 : TERM) =>
	α_conv tm1 tm2
	handle (Fail _) =>
let	val (vsl1,bdy1) = strip_∀ tm1;
	val (vsl2,bdy2) = strip_∀ tm2;
	val (tys,insts) = term_match bdy1 bdy2;
	val vsl1' = map (term_map(fn x=>llassoc3 insts)) vsl1;
	val vsl2' = map (term_map(fn x=>lrassoc3 insts)) vsl2;
	val s1 = asm_rule tm1;
	val s2 = list_∀_elim vsl1' s1;
	val s3 = list_∀_intro vsl2 s2;
	val s4 = disch_rule tm1 s3;
	val s5 = asm_rule tm2;
	val s6 = list_∀_elim vsl2' s5;
	val s7 = list_∀_intro vsl1 s6;
	val s8 = disch_rule tm2 s7;
	val s9 = ⇔_intro s8 s4;
	val s10 = eq_trans_rule (refl_conv tm2) s9;
	val s11 = eq_trans_rule s10 (refl_conv tm1);
in
	s11
end
handle (Fail _) =>
term_fail "∀_reorder_conv" 27050 [tm1,tm2]
);

=TEX
\subsection{Concerning ∃}
=SML
local
	fun aux 1 = ¬_simple_∃_conv
	| aux n = ¬_simple_∃_conv THEN_C (SIMPLE_BINDER_C (aux(n-1)));
in
val ⦏¬_∃_conv⦎ : CONV = (fn (tm : TERM) =>
	¬_simple_∃_conv tm
handle (Fail _) =>
let	val (vs,bdy) = dest_∃(dest_¬ tm);
	val lvs = length(flat_vs "¬_∃_conv" vs);
in
	(RAND_C ∃_uncurry_conv THEN_C
	aux lvs THEN_C
	(fn x => eq_sym_rule(∀_uncurry_conv (mk_∀(vs,mk_¬ bdy))))) tm
end
handle complaint =>
list_divert complaint "¬_∃_conv" [
	("dest_¬",27020,[fn () => string_of_term tm]),
	("dest_∃",27020,[fn () => string_of_term tm])]
);
end;
=TEX
=SML
local
	fun list_v_∃_intro tml thm = fold (uncurry v_∃_intro) tml thm;
	fun list_∃_elim [] tm wthm = wthm
	| list_∃_elim (v :: rest) tm wthm = (
		let	val tm' = mk_∃(v, tm);
		in
		list_∃_elim rest tm'
			(∃_elim v (asm_rule tm') wthm)
		end);
		
in
fun  ⦏∃_reorder_conv⦎ (tm1 : TERM) : CONV = (fn (tm2 : TERM) =>
	α_conv tm1 tm2
	handle (Fail _) =>
let	val (vsl1,bdy1) = strip_∃ tm1;
	val (vsl2,bdy2) = strip_∃ tm2;
	val (tys,insts) = term_match bdy1 bdy2;
	val vsl1' = map (term_map(fn x=>llassoc3 insts)) vsl1;
	val vsl2' = map (term_map(fn x=>lrassoc3 insts)) vsl2;
	val s1 = asm_rule tm1;
	val s2 = asm_rule bdy1;
	val s3 = list_v_∃_intro vsl2' s2;
	val s4 = list_∃_elim (rev vsl1) bdy1 s3;
	val s5 = disch_rule tm1 s4;
	val s6 = asm_rule tm2;
	val s7 = asm_rule bdy2;
	val s8 = list_v_∃_intro vsl1' s7;
	val s9 = list_∃_elim (rev vsl2) bdy2 s8;
	val s10 = disch_rule tm2 s9;
	val s11 = ⇔_intro s10 s5;
	val s12 = eq_trans_rule (refl_conv tm2) s11;
	val s13 = eq_trans_rule s12 (refl_conv tm1);
in
	s13
end
handle (Fail _) =>
term_fail "∃_reorder_conv" 27050 [tm1,tm2]
);
end;
=TEX
=SML
fun ⦏∃_asm_rule⦎ (vs : TERM) (asm : TERM) (thm : THM) : THM = (
let	val tm' = mk_∃(vs, asm)
		handle complaint =>
		pass_on complaint "mk_∃" "∃_asm_rule";
in
	∃_elim vs (asm_rule tm') thm
	handle complaint =>
	pass_on complaint "∃_elim" "∃_asm_rule"

end);
=TEX
\subsection{Concerning ∃$_1$}
These follow the same pattern as the simple rules.
=SML
local
	val prc = TRY_C(pure_rewrite_conv [sfst_snd_thm]);
in
fun ⦏∃⋎1_intro⦎ (thm1 : THM) (thm2 : THM) : THM = (
let	val (x,rest) = dest_∀ (concl thm2);
	val (Px,(x',t)) = (Combinators.I ** dest_eq)(dest_⇒ rest);
	val side_effect = if x =$ x'
		then ()
		else thm_fail "∃⋎1_intro" 27054 [thm2];
	val insts = case (term_match (concl thm1) Px) of
		([],is) => is
		| _ => thm_fail "∃⋎1_intro" 27021 [thm1,thm2];
	val witness = term_map (fn x => lrassoc3 insts) x;
	val abs = mk_λ(x,Px);
	val P_t = mk_app(abs, witness);
	val P_x = mk_app(abs, x);
	val s1 = β_conv P_t;
	val s2 = eq_sym_rule s1;
	val s3 = ⇔_mp_rule s2 thm1;
	val s4 = β_conv P_x;
	val s5 = eq_sym_rule s4;
	val mgvs = gen_vars [BOOL, type_of x, type_of x] (rest :: asms thm2);
	val mgv = hd mgvs;
	val mgv1 = hd(tl mgvs);
	val mgv2 = hd(tl(tl mgvs));
	val s6 = all_∀_elim thm2;
	val template = mk_⇒(mgv,mk_eq(x,t));
	val s7 = subst_rule [(s5,mgv)] template s6;
	val s8 = ∀_intro x s7;
	val s9 = ∀_elim mgv2 s8;
	val s10 = conv_rule (RAND_C(RATOR_C(RAND_C prc)) THEN_C
		RATOR_C(RAND_C(RAND_C prc))) s9;
	val s11 = simple_∀_intro mgv2 s10;
	val s12 = ∧_intro s3 s11;
	val template2 = mk_∃(mgv1,
		mk_∧(mk_app(abs,mgv1),
		mk_∀(mgv2,
		mk_⇒(
		mk_app(abs,mgv2), mk_eq(mgv2,mgv1)))));
	val s13 = ∃_intro template2 s12;
	val s14 = inst_type_rule[(type_of x,mk_vartype "'a")]
		∃⋎1_thm;
	val s15 = ∀_elim abs s14;
	val s16 = eq_sym_rule s15;
	val s17 = ⇔_mp_rule s16 s13;
	val s18 = conv_rule(RAND_C (α_conv abs)) s17;
in
	s18
end
handle complaint =>
list_divert complaint "∃⋎1_intro" [
	("term_match",27021,[fn () => string_of_thm thm1,
		fn () => string_of_thm thm2]),
	("subst_rule",27021,[fn () => string_of_thm thm1,
		fn () => string_of_thm thm2]),
	("∀_intro",27021,[fn () => string_of_thm thm1,
		fn () => string_of_thm thm2]),
	("simple_∀_intro",27021,[fn () => string_of_thm thm1,
		fn () => string_of_thm thm2]),
	("dest_∀",27054,[fn () => string_of_thm thm2]),
	("dest_⇒",27054,[fn () => string_of_thm thm2])
]
);
end;
=IGN
A nasty:
val thm1 = asm_rule ⌜f x:BOOL⌝;
val thm2 = asm_rule ⌜∀ y ⦁ f y ⇒ y = x⌝;
val thm2' = asm_intro ⌜f y : BOOL⌝ thm2;
∃⋎1_intro thm1 thm2';
=TEX
=SML
fun ⦏∃⋎1_elim⦎ (thm : THM) : THM = (
let	val conc = concl thm;
	val sideffect = if not (is_∃⋎1 conc)
		then thm_fail "∃⋎1_elim" 27022 [thm]
		else ();
	val (_,bdy) = dest_app conc;
	val (x,bdy') = dest_λ bdy;
	val y = varstruct_variant (frees x @ frees bdy') x;
	val tmt = snd(term_match y x);
	val tm1 = mk_eq(y,x);
	val tm2 = var_subst tmt bdy';
	val tm3_λ = mk_λ(y,mk_⇒(tm2,tm1));
	val tm3 = mk_∀(y,mk_⇒(tm2,tm1));
	val target_tm = mk_∃(x,mk_∧(bdy',tm3));
	val (xt,bt) = dest_→_type(type_of bdy);
	val s1 = inst_type_rule [(xt,mk_vartype "'a")]
		∃⋎1_thm;
	val s2 = simple_∀_elim bdy s1;
	val s3 = ⇔_mp_rule s2 thm;
	val s4 = conv_rule (BINDER_C
		((RAND_C(BINDER_C(RATOR_C(RAND_C β_conv))))
		THEN_C
		(RATOR_C(RAND_C β_conv)))) s3;
	val (quant,abs) = dest_app (concl s4);
	val (t,∃_bdy) = dest_simple_λ abs;
	val ∀_bit = snd(dest_∧ ∃_bdy);
	val ∀_bit' = var_subst[(x,t)] ∀_bit;
	val bdy'' = mk_λ(x,mk_∧(bdy',∀_bit'));
	val s5 = conv_rule (RAND_C (λ_varstruct_conv bdy'')) s4;
	val s6 = conv_rule (BINDER_C(RAND_C(RAND_C (λ_varstruct_conv tm3_λ)))) s5;
in
	s6
end
handle complaint =>
list_divert complaint "∃⋎1_elim" [
	("dest_app",27022,[fn () => string_of_thm thm]),
	("dest_λ",27022,[fn () => string_of_thm thm]),
	("dest_fun",27022,[fn () => string_of_thm thm]),
	("⇔_mp_rule",27022,[fn () => string_of_thm thm])]
);
=TEX
The following is very similar to the implementation of $∃_1\_elim$, and could have been used to code that function.
=SML
val ⦏∃⋎1_conv⦎ : CONV = (fn tm =>
let	val sideffect = if not (is_∃⋎1 tm)
		then term_fail "∃⋎1_conv" 27053 [tm]
		else ();
	val (_,bdy) = dest_app tm;
	val (x,bdy') = dest_λ bdy;
	val y = varstruct_variant (frees x @ frees bdy') x;
	val tmt = snd(term_match y x);
	val tm1 = mk_eq(y,x);
	val tm2 = var_subst tmt bdy';
	val tm3_λ = mk_λ(y,mk_⇒(tm2,tm1));
	val tm3 = mk_∀(y,mk_⇒(tm2,tm1));
	val target_tm = mk_∃(x,mk_∧(bdy',tm3));
	val (xt,bt) = dest_→_type(type_of bdy);
	val s1 = inst_type_rule [(xt,mk_vartype "'a")] ∃⋎1_thm;
	val s2 = simple_∀_elim bdy s1;
	val s3 = eq_trans_rule (refl_conv tm) s2;
	val s4 = conv_rule (RAND_C(BINDER_C
		((RAND_C(BINDER_C(RATOR_C(RAND_C β_conv))))
		THEN_C
		(RATOR_C(RAND_C β_conv))))) s3;
	val (quant,abs) = dest_app (snd(dest_eq(concl s4)));
	val (t,∃_bdy) = dest_simple_λ abs;
	val ∀_bit = snd(dest_∧ ∃_bdy);
	val ∀_bit' = subst[(x,t)] ∀_bit;
	val bdy'' = mk_λ(x,mk_∧(bdy',∀_bit'));
	val s5 = conv_rule (RAND_C(RAND_C (λ_varstruct_conv bdy''))) s4;
	val s6 = conv_rule (RAND_C(BINDER_C(RAND_C
		(RAND_C (λ_varstruct_conv tm3_λ))))) s5;
in
	s6
end
handle complaint =>
list_divert complaint "∃⋎1_conv" [
	("dest_app",27022,[fn () => string_of_term tm]),
	("dest_λ",27022,[fn () => string_of_term tm]),
	("dest_fun",27022,[fn () => string_of_term tm]),
	("⇔_mp_rule",27022,[fn () => string_of_term tm])]
);
=TEX

\subsection{Concerning ε}
=SML
val ⦏∃_ε_conv⦎ : CONV = (fn (tm:TERM) =>
let	val (x, tx) = (dest_∃ tm)
		handle complaint =>
		pass_on complaint "dest_∃" "∃_ε_conv";
	val t1 = mk_λ (x, tx);
	val s1 = inst_type_rule [(type_of x, mk_vartype "'a")] ∃_def;
	val s2 = app_arg_rule t1 s1;
	val s3 = concl s2;
	val conv1 = (RAND_C β_conv THEN_C
			RAND_C β_conv)
	val s4 = conv1 s3;
	val s5 = ⇔_mp_rule s4 s2;
in
	s5
end);
=TEX

=SML
fun ⦏∃_ε_rule⦎ (thm : THM) : THM = (
let	val s1 = conv_rule ∃_ε_conv thm
in
	s1
end
	handle complaint =>
	divert complaint "∃_ε_conv" "∃_ε_rule" 27024
		[fn () => string_of_thm thm]
);
=TEX
\subsection{Concerning Local Definitions}
=SML
local
	val tLet = type_of ⌜Let⌝;
	fun aux tm = (RATOR_C (RATOR_C(fn x =>
		inst_type_rule (type_match (type_of x) tLet) let_def))
		THEN_C
		RATOR_C simple_β_conv THEN_C
		simple_β_conv THEN_C
		(RATOR_C aux AND_OR_C
		β_conv)) tm;
in
val ⦏let_conv⦎ : CONV = (fn tm =>
	aux tm
	handle (Fail _) =>
	term_fail "let_conv" 4009 [tm]);
end;
=TEX
\subsection{Term Manipulation}
A number of functions in this document are
concerned with detailed term manipulation, rather
than just providing ``paired'' coverage of simple functions.

These are implemented together:
\subsubsection{Working Through ∀ Binders}
To work through an arbitrary number of simple universals:
=SML
fun ⦏ALL_SIMPLE_∀_C⦎ (conv:CONV): CONV = (fn tm =>
	if is_simple_∀ tm
	then (SIMPLE_BINDER_C (ALL_SIMPLE_∀_C conv)) tm
	else conv tm
);
=TEX
\subsubsection{Working Through ∃ Binders}
To work through an arbitrary number of simple existentials:
=SML
fun ⦏ALL_SIMPLE_∃_C⦎ (conv:CONV): CONV = (fn tm =>
	if is_simple_∃ tm
	then (SIMPLE_BINDER_C (ALL_SIMPLE_∃_C conv)) tm
	else conv tm
);
=TEX
\subsubsection{Working Through ∧}
A variant on $APP\_C$, but which will happily fail on one ``side'' of the application, and complete
successfully if the other ``side'' works:
=SML
fun ⦏APP_C1⦎ (cnv1 : CONV, cnv2 : CONV) : CONV = (fn (tm:TERM) =>
let	val (f,x) = dest_app tm
		handle complaint =>
		pass_on complaint "dest_app" "APP_C1";
in
	(let val thm1 = cnv1 f
	in
	(let val thm2 = (cnv2 x
		handle (Fail _) => refl_conv x)
	 in
		mk_app_rule thm1 thm2
	 end)
	end)
	handle (Fail _) =>
	(let val thm2 = cnv2 x
	in
		(app_fun_rule f thm2
		handle complaint =>
		divert complaint "app_fun_rule" "APP_1C" 7104
		[fn () => string_of_thm thm2])
	end)
end);
=TEX
To work through an arbitrary number of conjunctions:
=SML
local
	val rw_conv= eqn_cxt_conv(map thm_eqn_cxt (initial_rw_canon ∧_rewrite_thm));
in
fun ⦏ALL_∧_C⦎ (conv:CONV): CONV = (fn tm =>
	if is_∧ tm
	then ((APP_C1(RAND_C (ALL_∧_C conv),
		(ALL_∧_C conv))) THEN_TRY_C rw_conv) tm
	else conv tm
);
end;
=TEX
\subsubsection{Working Through ∨}
To work through an arbitrary number of conjunctions:
=SML
local
	val rw_conv= eqn_cxt_conv( map thm_eqn_cxt (initial_rw_canon ∨_rewrite_thm));
in
fun ⦏ALL_∨_C⦎ (conv:CONV): CONV = (fn tm =>
	if is_∨ tm
	then ((APP_C1(RAND_C (ALL_∨_C conv),
		(ALL_∨_C conv))) THEN_TRY_C rw_conv) tm
	else conv tm
);
end;
=TEX
=TEX
\subsection{Swapping ∀ and ∃}
The following two theorems speed the swapping of $∀$ and $∃$.
=SML
val ⦏∀_∃_thm⦎ = (
push_goal([], ⌜∀P⦁(∀x⦁∃y⦁P x y) ⇔ (∃f:'a → 'b⦁∀x⦁P x (f x))⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(simple_∃_tac⌜λa⦁εb⦁P a b⌝ THEN REPEAT strip_tac THEN rewrite_tac[]);
a(POP_ASM_T (accept_tac o ∃_ε_rule o all_∀_elim));
(* *** Goal "2" *** *)
a(simple_∃_tac⌜f x⌝ THEN asm_rewrite_tac[]);

pop_thm());
=TEX
=SML
val ⦏∃_∀_thm⦎ = (
push_goal([], ⌜∀P⦁(∃x⦁∀y⦁P x y) ⇔ (∀f:'a → 'b⦁∃x⦁P x (f x))⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(simple_∃_tac⌜x⌝ THEN asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(CONTR_T (asm_tac o conv_rule (TOP_MAP_C(¬_∀_conv ORELSE_C ¬_∃_conv))));
a(asm_ante_tac⌜∀ f⦁ ∃ x⦁ P x (f x)⌝ THEN rewrite_tac[]);
a(strip_tac);
a(simple_∃_tac⌜λx⦁εy⦁¬P x y⌝ THEN rewrite_tac[] THEN REPEAT strip_tac);
a(POP_ASM_T (accept_tac o ∃_ε_rule o ∀_elim⌜x⌝));
pop_thm());
=TEX
In the following we are careful to maintain naming,
using $eq\_trans\_rule$ and $simple\_\alpha\_conv$.
=SML
val ⦏simple_∀_∃_conv⦎ :CONV = (fn tm =>
let	val (x, t) = dest_simple_∀ tm;
	val (y, body) = dest_simple_∃ t;
	val abs = mk_simple_λ(x, mk_simple_λ(y, body));
	val thm1 = simple_∀_elim abs(inst_type_rule
			[(type_of x, tva), (type_of y, tvb)] ∀_∃_thm);
	val newy = string_variant (map fst(term_vars tm)) (fst(dest_var y));
	val conv0 = RAND_C(RAND_C (simple_α_conv newy
		THEN_C λ_C(RAND_C(simple_α_conv (fst(dest_var x))))));
	val conv1 = RATOR_C (simple_β_conv) THEN_C simple_β_conv;
	val conv2 = SIMPLE_BINDER_C(SIMPLE_BINDER_C conv1);
	val conv3 = conv0 THEN_C APP_C(RAND_C conv2, conv2);
	val thm2 = conv_rule conv3 thm1;
in
	eq_trans_rule (refl_conv tm) thm2
end
handle complaint =>
list_divert complaint "simple_∀_∃_conv"
	[("dest_simple_∀", 27031,[fn () => string_of_term tm]),
	("dest_simple_∃", 27031,[fn () => string_of_term tm]),
	("eq_trans_rule", 27034,[fn () => string_of_term tm])
]);
=IGN
simple_∀_∃_conv ⌜∀ p:'c ⦁ ∃ q : BOOL ⦁ q ∨ f p⌝;
simple_∀_∃_conv ⌜∀ x:'a ⦁ ∃ y:'b ⦁ g y x⌝;
=TEX
=SML
val ⦏simple_∃_∀_conv⦎ :CONV = (fn tm =>
let	val (x, t) = dest_simple_∃ tm;
	val (y, body) = dest_simple_∀ t;
	val abs = mk_simple_λ(x, mk_simple_λ(y, body));
	val thm1 = simple_∀_elim abs(inst_type_rule
			[(type_of x, tva), (type_of y, tvb)] ∃_∀_thm);
	val newy = string_variant (map fst(term_vars tm))
		(fst(dest_var y));
	val conv0 = RAND_C(RAND_C (simple_α_conv newy
		THEN_C λ_C(RAND_C(simple_α_conv
			(fst(dest_var x))))));
	val conv1 = RATOR_C (simple_β_conv) THEN_C simple_β_conv;
	val conv2 = SIMPLE_BINDER_C(SIMPLE_BINDER_C conv1);
	val conv3 = conv0 THEN_C APP_C(RAND_C conv2, conv2);
	val thm2 = conv_rule conv3 thm1
in
	eq_trans_rule (refl_conv tm) thm2
end
handle complaint =>
list_divert complaint "simple_∃_∀_conv"
	[("dest_simple_∀", 27032,[fn () => string_of_term tm]),
	("dest_simple_∃", 27032,[fn () => string_of_term tm]),
	("eq_trans_rule", 27033,[fn () => string_of_term tm])
]);
=IGN
simple_∃_∀_conv ⌜∃ p:'c ⦁ ∀ q : BOOL ⦁ q ∨ f p⌝;
simple_∃_∀_conv ⌜∃ p:'c ⦁ ∀ q : BOOL ⦁ f (g q) p⌝;
simple_∃_∀_conv ⌜∃ x:'a ⦁ ∀ y:'b ⦁ g y x⌝;
=TEX
=SML
val ⦏∃_∀_thm1⦎ = (
push_goal([],⌜∀ P ⦁ (∃ f ⦁ ∀ x ⦁ P(f x) x) ⇔ (∀ x ⦁ ∃ f'⦁P f' x)⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(simple_∃_tac⌜f x⌝ THEN asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(POP_ASM_T(strip_asm_tac o conv_rule simple_∀_∃_conv));
a(simple_∃_tac ⌜f''⌝ THEN asm_rewrite_tac[]);
pop_thm());
=TEX

=FRULE 1 Conversion
simple_∃_∀_conv1
⌜∃ f ⦁ ∀ x ⦁ P[f x, x]⌝
├
├
(∃ f ⦁ ∀ x ⦁ P[f x, x]) ⇔
	(∀ x ⦁ ∃ f' ⦁ P[f', x])
=TEX
=SML
val ⦏simple_∃_∀_conv1⦎ :CONV = (fn tm =>
let	val (f, t) = dest_simple_∃ tm;
	val (x, body) = dest_simple_∀ t;
	val fx = mk_app (f, x);
	val newfnm = string_variant (map fst(term_vars tm)) (fst(dest_var f));
	val newf = mk_var(newfnm, type_of fx);
	val body' = subst[(newf, fx)] body;
	val sideeffect = if is_free_in f body'
		then term_fail "simple_∃_∀_conv1" 27033 [tm]
		else ();
	val abs = mk_simple_λ(newf, mk_simple_λ(x, body'));
	val thm1 = simple_∀_elim abs(inst_type_rule
			[(snd(dest_→_type(type_of f)), tva), (type_of x, tvb)] ∃_∀_thm1);
	val conv0 = RAND_C(RAND_C (simple_α_conv (fst(dest_var x))
		THEN_C λ_C(RAND_C(simple_α_conv newfnm))));
	val conv1 = RATOR_C (simple_β_conv) THEN_C simple_β_conv;
	val conv2 = SIMPLE_BINDER_C(SIMPLE_BINDER_C conv1);
	val conv3 = conv0 THEN_C APP_C(RAND_C conv2, conv2);
	val thm2 = conv_rule conv3 thm1;
in
	eq_trans_rule (refl_conv tm) thm2
end
handle complaint =>
list_divert complaint "simple_∃_∀_conv1"
	[("mk_app", 27033,[fn () => string_of_term tm]),
	("dest_simple_∀", 27033,[fn () => string_of_term tm]),
	("dest_simple_∃", 27033,[fn () => string_of_term tm]),
	("eq_trans_rule", 27034,[fn () => string_of_term tm])
]);
=IGN
simple_∃_∀_conv1 ⌜∃ p ⦁ ∀ q : BOOL ⦁ f q (p q) q (p q) ⌝;
simple_∃_∀_conv1 ⌜∃ f ⦁ ∀ x ⦁ x ∧ f x⌝;
=TEX


=SML
=TEX
\section{END OF THE STRUCTURE}
Restore the previous theory:
=SML
val _ = open_theory was_theory;
=TEX
=SML
end; (* of structure DerivedRules2 *)
open DerivedRules2;
=TEX
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}



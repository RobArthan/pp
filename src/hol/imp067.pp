=IGN
********************************************************************************
imp067.doc: this file is part of the PPHol system

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

\def\Title{Implementation of the Resolution Facilities}

\def\AbstractText{This document contains the implementation of the resolution facilities in ICL HOL.}

\def\Reference{DS/FMU/IED/IMP067}

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
%% LaTeX2e port: \TPPtitle{Implementation of the Resolution Facilities}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP067}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.20 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2002/10/17 15:10:58 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.Blackburn & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document contains the implementation
%% LaTeX2e port: of the resolution facilities in ICL HOL.}
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
\item [Issues 1.1 (1992/02/21),1.4 (1992/02/28)]
First versions.
\item [Issue 1.5 (1992/03/11)]
Issued for experimental use.
\item [Issue 1.6 (1992/03/18)]
Use $strip\_leaves$.
\item [Issue 1.7 (1992/03/27) (26th March 1992)]
Changed to use proof context material of issue 1.13 of \cite{DS/FMU/IED/DTD051}.
\item [Issue 1.8 (1992/04/09) (9th April 1992)]
Changes required by CR0016.
\item [Issue 1.9 (1992/04/14) (13th April 1992)]
Changes due to CR0017.
\item [Issue 1.10 (1992/05/12) (12th May 1992)]
Changed theory required.
\item [Issue 1.11 (1992/05/14) (14th May 1992)]
Tidying up proof contexts.
\item [Issue 1.13 (1992/06/02) (2nd June 1992)]
Changed ``native'' theory.
\item[Issue 1.14 (1992/06/24) (24th June 1992)]
Renamings from issue 1.6 of \cite{DS/FMU/IED/WRK038},
mostly proof context name changes.
\item[Issue 1.15 (1992/06/30) (30th June 1992)]
Moved some text into message database.
\item[Issue 1.16 (1992/07/03) (3rd July 1992)]
Changed some uses of $subst$ to $var\_subst$.
\item [Issue 1.17 (1992/08/13) (13th August 1992)]
Corrected error handling for interrupts.
\item [Issue 1.18 (1992/10/08) (8th October 1992)]
Stopped redundant calculations of diagnostic strings.
\item [Issue 1.19 (1993/02/17) (17th February 1993)]
Hid rest of diagnostic lines behind $give\_diag$.
\item[Issue 1.20 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.21 (2002/10/17)] PPHol-specific updates for open source release
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
None.
\pagebreak
\section{GENERAL}
\subsection{Scope}
Tools giving some sort of resolution facility
are called for in \cite{DS/FMU/IED/HLD012}.
This document provides an implementation for these tools.
A design for such tools is given in \cite{DS/FMU/IED/DTD067}.
This document provides an implementations for them.
\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains an implementation for the
resolution tools.
\subsubsection{Dependencies}
This document takes its signature from \cite{DS/FMU/IED/DTD067}.
\subsubsection{Deficiencies}
None known.
\subsubsection{Possible Enhancements}
None known.

\section{PREAMBLE}
=SML
structure ⦏Resolution⦎ : Resolution = struct
=TEX
=SML
val lthy = get_current_theory_name();
val _ = open_theory "basic_hol";
val _ = push_merge_pcs ["'propositions",
	"'simple_abstractions"];
open Unification;
=TEX
\section{THE CODE}
\subsection{Utilities}
=SML
fun ⦏list_string_variant⦎ (av:string list) ([]:string list) : string list = []
| list_string_variant av (h:: t) = (
let	val h' = string_variant av h;
in
	h' :: list_string_variant (h'::av) t
end);
=IGN
list_string_variant ["p","q''","r'","r"] ["q", "q'", "q'''", "r''", "s"];
=TEX
=SML
val ⦏strip_pair⦎ : TERM -> TERM list = strip_leaves dest_pair;
=TEX
=SML
fun ⦏list_is_free_in⦎ (inlst:TERM list) (tm:TERM): bool = (
let	val fs = frees tm;
in
	any fs (fn x => present (op =$) x inlst)
end);
=TEX
=SML
fun ⦏int_max⦎ (a:int,b) = if a < b then b else a;
=TEX
=SML
fun ⦏int_min⦎ (a:int,b) = if a > b then b else a;
=TEX
=SML
fun ⦏thm_frees⦎ (thm :THM) : TERM list = (
let	val (seqasms,cl) = dest_thm thm;
in
	list_union (op =$) (frees cl :: map frees seqasms)
end);
=TEX
=SML
fun ⦏thm_less⦎ thms thm = (
let	val dthm = dest_thm thm
in
	thms drop (fn x => dest_thm x =#  dthm)
end);
=TEX
=SML
fun rev_append [] lst = lst
| rev_append (a :: x) lst = rev_append x (a :: lst);
=TEX
=SML
fun ⦏thm_diff⦎ thms thms' = (
let	val dthms' = map dest_thm thms';
in
	thms drop (fn x => present (op =#) (dest_thm x) dthms')
end);
=TEX
The following assignable variable is only available
within the structure, or via the flag handling.
=SML

val ⦏give_diag⦎ = ref false;
val _ = new_flag{name="resolution_diagnostics",
	check=(fn _ => true),
	control=give_diag,
	default=(fn _ => false)};
=TEX
Pass through a binder, ensuring that the binder won't capture
any free variable in the term argument.
=SML
fun ⦏SAFE_SIMPLE_BINDER_C⦎ (av:TERM): CONV -> CONV = (
let	val avs = frees av
in
(fn cnv => fn tm =>
let	val (binder,abs) = dest_app tm;
	val (v,b) = dest_simple_λ abs;
in
	if present (op =$) v avs
	then (let val v' = variant (avs @ frees b) v;
		val s1 = simple_α_conv (fst(dest_var v')) abs;
		val b' = snd(dest_simple_λ(snd(dest_eq(concl s1))));
		val s2 = cnv b';
	in (let
		val s3 = (simple_λ_eq_rule v' s2);
		val s4 = eq_trans_rule s1 s3;
		val s5 = app_fun_rule binder s4
	in
		s5
	end
		handle complaint =>
		list_divert complaint "SAFE_SIMPLE_BINDER_C" [
		("simple_λ_eq_rule",7104,[fn () => string_of_thm s2]),
		("eq_trans_rule",7104,[fn () => string_of_thm s2]),

		("app_fun_rule",7104,[fn () => string_of_thm s2])])	
	end)	
	else
	(let	val s1 = cnv b;
		val s2 = app_fun_rule binder (simple_λ_eq_rule v s1)
			handle complaint =>
			list_divert complaint "SAFE_SIMPLE_BINDER_C" [
			("simple_λ_eq_rule",7104,[fn () => string_of_thm s1]),
			("app_fun_rule",7104,[fn () => string_of_thm s1])];	
	in
		s2
	end)
end
handle complaint =>
list_divert complaint "SAFE_SIMPLE_BINDER_C" [
	("dest_simple_λ",7059,[fn () => string_of_term tm]),
	("dest_app",7059,[fn () => string_of_term tm])]
)
end);
=IGN
SAFE_SIMPLE_BINDER_C ⌜x⌝ (RAND_C (fn _ => asm_rule ⌜p:'a = x⌝))
	⌜∀ x:'a ⦁ f (p:'a)⌝;
SAFE_SIMPLE_BINDER_C ⌜x⌝ (RAND_C (fn _ => asm_rule ⌜p:'a = x⌝))
	⌜∀ y:'a ⦁ f (p:'a)⌝;

=TEX

\subsection{Primary Code}
Using $rewrite\_rule$ as a simplifier is crude!
=SML
local
	val simp_rewrites_thm =
	tac_proof(([],
	⌜(∀ x:'a⦁ T) ∧ (∃ x :'a⦁ T) ∧
	¬(∀ x:'a⦁ F) ∧ ¬(∃ x :'a⦁ F) ∧
	((∃⋎1 x:'a⦁T) ⇔ (∃ x ⦁∀ y:'a ⦁ y = x)) ∧
	(¬(∃⋎1 x:'a⦁F)) ∧
	(∀ t1 t2⦁ (if T then t1 else t2) = t1 ∧ (if F then t1 else t2) = t2)
	∧
	(∀ t⦁ (T ⇒ t ⇔ t) ∧ (F ⇒ t ⇔ T) ∧ (t ⇒ T ⇔ T) ∧
                  (t ⇒ F ⇔ ¬ t))
	∧
	(∀ t⦁ (T ∨ t) ∧ (t ∨ T) ∧ (F ∨ t ⇔ t) ∧ (t ∨ F ⇔ t) ∧
         (t ∨ t ⇔ t) ∧ (t ∨ ¬ t ⇔ T) ∧ (¬ t ∨ t ⇔ T))
	∧
	(∀ x y ⦁ ((x ∨ y ∨ y) ⇔ (x ∨ y)) ∧ (((x ∨ y) ∨ y) ⇔ (x ∨ y)) ∧
	 ((x ∨ x ∨ y) ⇔ (x ∨ y)) ∧ ((x ∨ y ∨ x) ⇔ (x ∨ y)) ∧
	 (((x ∨ y) ∨ y) ⇔ (x ∨ y)))
	∧
	(∀ t⦁ (T ∧ t ⇔ t) ∧ (t ∧ T ⇔ t) ∧ ¬ (F ∧ t) ∧ ¬ (t ∧ F) ∧
        (t ∧ t ⇔ t))
	∧
	(∀ t⦁ (¬ T ⇔ F) ∧ (¬ F ⇔ T) ∧ ((¬ ¬ t) ⇔ t))
	∧
	(∀ t⦁ ((T ⇔ t) ⇔ t) ∧ ((t ⇔ T) ⇔ t) ∧ ((F ⇔ t) ⇔ ¬ t) ∧
        ((t ⇔ F) ⇔ ¬ t))⌝),
	rewrite_tac[∃⋎1_thm] THEN REPEAT strip_tac);
	val rw = pure_rewrite_rule[simp_rewrites_thm];
in
fun ⦏basic_resolve_rule⦎ (subterm:TERM) (pthm:THM) (nthm:THM) : THM = (
let	val cases_thm = (simple_∀_elim subterm bool_cases_axiom)
		handle complaint =>
		divert complaint "simple_∀_elim" "basic_resolve_rule"
		3031 [fn () => string_of_term subterm];
	val (⇔_T,⇔_F) = dest_∨(concl cases_thm);
	val pF = subst[(mk_f,subterm)] (concl pthm);
	val nT = subst[(mk_t,subterm)] (concl nthm);
	val pthm' = pure_once_rewrite_rule[asm_rule ⇔_F]
		(∨_right_intro nT pthm)
		handle complaint =>
		divert complaint "pure_once_rewrite_rule" "basic_resolve_rule"
		67009 [fn () => string_of_term subterm,
			fn () => string_of_term (concl pthm)];
	val nthm' = pure_once_rewrite_rule[asm_rule ⇔_T]
		(∨_left_intro pF nthm)
		handle complaint =>
		divert complaint "pure_once_rewrite_rule" "basic_resolve_rule"
		67009 [fn () => string_of_term subterm,
			fn () => string_of_term (concl nthm)];
	val base_thm = ∨_elim cases_thm nthm' pthm';
in
	all_∀_intro(rw base_thm)
	handle complaint =>
	if area_of complaint = "rewrite_rule"
	then base_thm
	else reraise complaint (area_of complaint)
end);
end; (* of local simp_rewrites_thm *)
=TEX
\subsection{Term Unification}

An algorithm for term unification:
\begin{enumerate}
\item
Substitute term variables not found at all in either term
for the specialisable term variables in either term.
\item
Substitute type variables not found at all in either term
for the specialisable type variables in either term.
(This prevents having to do this for the individual type unifications).
\item
Initialise the bound variable matching, to empty,
specialisation to mapping the variables to $Nil$,
and initialise the type unification scratchpad.
\item
Consider what the first term is:
\begin{description}
\item[Variable]
Determine its actual type, and consider that:
\begin{description}
\item[If a bound variable]
Then the second term must be the corresponding bound variable of the other term,
and the other type, when expanded out, must already be equal.
\item[Else if already specialised]
(i.e. mapped to $Value$ of something in the specialisation map)
Then unify what it is specialised to, and the second term.
\item[Else if it may be specialised]
(i.e. mapped to $Nil$ in the specialisation map)
Then unify its type to the type of the second term,
then expand out the second term, looking for
occurs checks, bound variables, etc,
then record the first term as specialised to the $Value$ of the second term.
\item[Else]
(i.e. not mapped in the specialisation map)
The second term must, after expansion, be either
\begin{itemize}
\item
the same named variable, with a type unifiable to the first.
\item
or a unbound, specialisable variable, with a type unifiable to
the first,
in which case record the second term as specialised to the first term.
\end{itemize}
\end{description}

\item[Constant]
Consider what the second term is:
\begin{description}
\item[Variable]
Determine its actual type, and consider that:
\begin{description}
\item[If a bound variable]
Fail.
\item[Else if already specialised]
Then unify what it is specialised to, and the first term.
\item[Else if it may be specialised]
Then unify its type to the type of the constant,
then record the second term as specialised to the first term.
\item[Else]
Fail.
\end{description}

\item[Constant]
The second term must be the same name, with
a type unifiable to the first.
\item[Application]
Fail
\item[Abstraction]
Fail
\end{description}

\item[Application]
Consider what the second term is:
\begin{description}
\item[Variable]
Determine its actual type, and consider that:
\begin{description}
\item[If a bound variable]
Fail.
\item[Else if already specialised]
Then unify what it is specialised to, and the first term.
\item[Else if it may be specialised]
Then unify its type to the type of the application,
then record the second term as specialised to the first term.
\item[Else]
Fail.
\end{description}
\item[Application]
Unify the two arguments, and then the two functions
(the order is based on the grounds the types and subterms of the arguments are likely
to be smaller).
\item[Abstraction]
Fail
\end{description}

\item[Abstraction]
Consider what the second term is:
\begin{description}
\item[Variable]
Determine its actual type, and consider that:
\begin{description}
\item[If a bound variable]
Fail.
\item[Else if already specialised]
Then unify what it is specialised to, and the first term.
\item[Else if it may be specialised]
Then unify its type to the type of the abstraction,
then record the second term as specialised to the first term.
\item[Else]
Fail.
\end{description}
\item[Application]
Fail.
\item[Abstraction]
Unify the types of the abstractions.
Then record the fact that the two bound variables are indeed
such while traversing the body.
Then unify the two bodies.
The undo the recording of the bound variables.
\end{description}

\end{description}
\end{enumerate}
=SML
fun ⦏term_tytm_vars⦎ (tm : TERM) : TERM list * string list = (
let	fun aux _ (App (f, a)) = (
	let	val (tv1,ty1) = aux f (dest_simple_term f);
		val (tv2,ty2) = aux a (dest_simple_term a);
	in
		((union (op =$) tv1 tv2), (ty1 cup ty2))
	end
	) | aux _ (Const (_, ty)) = ([],type_tyvars ty)
	  | aux tm (Var (_,ty)) = ([tm],type_tyvars ty)
	  | aux _ (Simpleλ (v, b)) = (
	let val (tv1,ty1) = aux b (dest_simple_term b);
	in
		(insert (op =$) tv1 v, ty1 cup type_tyvars (type_of v))
	end)
in
	aux tm (dest_simple_term tm)
end);

=TEX
=TEX
To make the specialisable term and instantiable type variables unique in two terms:
=SML
fun ⦏uniquify⦎ (avty : TYPE list) (avtm : TERM list)
	(((tm1:TERM) ,(ms1: TERM list), (mi1:TYPE list)),
	((tm2:TERM), (ms2:TERM list), (mi2:TYPE list))) :
	((TERM * TERM list * TYPE list) * (TERM * TERM list * TYPE list) *
		(int * string) list) = (
let	val (tv_tm1, ty_tm1) = term_tytm_vars tm1;
	val (tv_tm2, ty_tm2) = term_tytm_vars tm2;
	val tv1_fixed = tv_tm1 drop (fn x => present (op =$) x ms1);
	val tv2_fixed = tv_tm2 drop (fn x => present (op =$) x ms2);
	val tv2_avoid = tv1_fixed @ tv2_fixed @ avtm;
	val tv2' = list_variant tv2_avoid ms2;
	val tv1_avoid = tv2_avoid @ tv2';
	val tv1' = list_variant tv1_avoid ms1;
	val tm1' = var_subst(combine tv1' ms1) tm1;
	val tm2' = var_subst(combine tv2' ms2) tm2;
	val nm_mi1 = map dest_vartype mi1;
	val nm_mi2 = map dest_vartype mi2;
	val ty_ms1 = list_cup(map (type_tyvars o type_of) ms1);
	val ty_ms2 = list_cup(map (type_tyvars o type_of) ms2);
	val ty1_fixed = (ty_tm1 cup ty_ms1) diff nm_mi1;
	val ty2_fixed = (ty_tm2 cup ty_ms2) diff nm_mi2;
	val ty2_avoid = ty1_fixed @ ty2_fixed @ map dest_vartype avty;
	val mi2s' = list_string_variant ty2_avoid nm_mi2;
	val mi2' = map mk_vartype mi2s';
	val ty1_avoid = ty2_avoid @ mi2s';
	val mi1s' = list_string_variant ty1_avoid nm_mi1;
	val mi1' = map mk_vartype mi1s'
	val mi1mi2s = mi1s' @ mi2s';
	val esubs = combine (interval 1 (length mi1mi2s)) mi1mi2s;
	val ty1_insts = (combine mi1' mi1);
	val ty2_insts = (combine mi2' mi2);
	val tm1'' = inst [] ty1_insts tm1';
	val tm2'' = inst [] ty2_insts tm2';
	val ms1' = map (inst [] ty1_insts) tv1';
	val ms2' = map (inst [] ty2_insts) tv2';
in
	((tm1'',ms1',mi1'),(tm2'',ms2',mi2'), esubs)
end
handle complaint =>
case (area_of complaint) of
"dest_vartype" => reraise complaint "term_unify"
| "dest_var" => reraise complaint "term_unify"
| other => reraise complaint other
);
=IGN
uniquify [] [] ⌜a ∧ (∀ b:'a⦁ f b ∨ c) ∨ g (b:'a) ∧ h (d:'d)⌝ [⌜a:BOOL⌝,⌜b:'a⌝,⌜c:BOOL⌝]
	 [ⓣ'a⌝,ⓣ'd⌝]
⌜a ∧ (∀ b:'a⦁ f b ∨ c) ∨ g (b:'a) ∧ h (d:'d)⌝ [⌜a:BOOL⌝,⌜d:'d⌝] [ⓣ'a⌝,ⓣ'd⌝];
=TEX
Local form of converting a type to an extended type:
=SML
fun ⦏ltype_to_extype⦎ (esubs: (int * string)list) (ty:TYPE):EXTYPE = (
let	fun aux (Ctype (nm,tys)) = ExType(nm,map (aux o dest_simple_type) tys)
	| aux (Vartype nm) = (
		case rassoc5 esubs nm of
		Value n => ExVartype (Unknown n)
		| _ => ExVartype (Known nm)
	);
in
	aux (dest_simple_type ty)
end);
=TEX
=SML
fun ⦏expand_type⦎ (subs:SUBS)
	(esubs:(int * string)list)
	(ty: TYPE): TYPE = (
let	fun aux (Ctype (nm,tys)) = mk_ctype(nm,map (aux o dest_simple_type) tys)
	| aux (Vartype nm) = (
		case rassoc5 esubs nm of
		Value n => extype_to_type subs esubs (ExVartype (Unknown n))
		| _ => mk_vartype nm
	);
in
	aux (dest_simple_type ty)
end);
=TEX
We do a very cheap and cheerful bound variable hider in the
following.
The optional terms in $ifvmatch$ have the original typing.
=SML
fun ⦏llassoc5⦎ ((x, y) :: rest : (TERM * 'b) list) (what : TERM) : 'b OPT = (
	if x =$ what
	then Value y
	else llassoc5 rest what
) | llassoc5 [] _ = Nil;
=TEX
=SML
fun ⦏expand_term⦎ (subs:SUBS)
	(esubs:(int * string)list)
	(ifvmatch: (TERM * TERM OPT)list)
	(tm:TERM):TERM = (
let	fun aux fvmatch _ (App(f,a)) = mk_app(
		aux fvmatch f (dest_simple_term f),
		aux fvmatch a (dest_simple_term a))
	| aux fvmatch _ (Const(nm,ty)) = mk_const(nm, expand_type subs esubs ty)
	| aux fvmatch v (Var (nm,ty)) = (case llassoc5 fvmatch v of
		Nil => mk_var(nm, expand_type subs esubs ty)
		| Value Nil => mk_var(nm, expand_type subs esubs ty)
		| Value(Value tm') =>
			if v =$ tm'
			then error "expand_term" 67013 [
				(fn () => string_of_term v)]
			else aux fvmatch tm' (dest_simple_term tm')
	) | aux fvmatch _ (Simpleλ(v,bdy)) = mk_simple_λ (
		let val (nm,ty) = dest_var v
		in
		mk_var(nm, expand_type subs esubs ty)
		end,
		aux (fvmatch drop (fn(x,_)=> x =$ v)) bdy
			(dest_simple_term bdy));
in
	aux ifvmatch tm (dest_simple_term tm)
end);
=TEX
Expand out a term, checking for the presence of an instantiable (but not yet instantiated) term
variable as you go (an ``occurs'' check).
It is OK for the result to equal $mv$, but not to contain it.
It returns true if $mv$ term is to be equated to itself.
=SML
fun ⦏occurs_check_term⦎
	(ifvmatch: (TERM * TERM OPT)list)
	(mv:TERM)
	(tm:TERM):bool = (
let	fun aux _ _ fvmatch (App(f,a)) = (
		aux true f fvmatch (dest_simple_term f);
		aux true a fvmatch (dest_simple_term a);
		false)
	| aux _ _  fvmatch (Const(nm,ty)) = (false)
	| aux inside v fvmatch (Var (nm,ty)) = (case llassoc5 fvmatch v of
		Nil => (false)
		| Value Nil => (
			if inside andalso mv =$ v
			then term_fail "term_unify" 67012 [mv, tm]
			else (not inside andalso (mv =$ v))
		) | Value(Value tm') =>
			if v =$ tm'
			then error "occurs_check_term" 67013
				[fn () => string_of_term v]
			else aux inside tm' fvmatch (dest_simple_term tm')
	) | aux _  _ fvmatch (Simpleλ(v,bdy)) = (
			aux true bdy (fvmatch drop (fn (x,_)=> x =$ v))
			(dest_simple_term bdy);
		false);
in
	aux false tm ifvmatch (dest_simple_term tm)
end);
=TEX
Unify two types using material from \cite{DS/FMU/IED/DTD014}.
=SML
fun ⦏type_unify⦎ (subs:SUBS) (esubs: (int * string)list)
		(ty1:TYPE) (ty2: TYPE): unit = (
let	val ty1' = ltype_to_extype esubs ty1;
	val ty2' = ltype_to_extype esubs ty2;
in
	unify subs (ty1',ty2')
end
handle complaint =>
pass_on complaint "unify" "type_unify"
);
=TEX
=SML
fun ⦏lrassoc5⦎ ((x, y) :: rest : ('a * TERM) list)(what : TERM) : 'a OPT = (
	if y =$ what
	then Value x
	else lrassoc5 rest what
) | lrassoc5 [] _ = Nil;
=TEX
=IGN
term_unify ((⌜a ∧ (∀ b:'a⦁ f b ∨ c) ∨ g (b:'a) ∧ h (d:'d)⌝,
	[⌜a:BOOL⌝,⌜b:'a⌝,⌜c:BOOL⌝], [ⓣ'a⌝,ⓣ'd⌝]),
	(⌜a ∧ (∀ b:'a⦁ f b ∨ c) ∨ g (b:'a) ∧ h (d:'d)⌝,
	[⌜a:BOOL⌝,⌜d:'d⌝], [ⓣ'a⌝,ⓣ'd⌝]));
=TEX
=SML
fun ⦏tylassoc3⦎ ((x, y) :: rest : (TYPE * 'b) list) (what : TYPE) : 'b = (
	if x =: what
	then y
	else tylassoc3 rest what
) | tylassoc3 [] _ = fail "tylassoc3" 1005 [];
=TEX
=SML
fun ⦏llassoc3⦎ ((x, y) :: rest : (TERM * 'b) list) (what : TERM) : 'b = (
	if x =$ what
	then y
	else llassoc3 rest what
) | llassoc3 [] _ = fail "llassoc3" 1005 [];
=TEX
=SML
fun ⦏loverwrite⦎ (((a, b) :: abs) : (TERM * 'b) list) ((x, y) : TERM * 'b)
		: (TERM * 'b) list = (
	if a =$ x
	then (x, y) :: abs
	else (a, b) :: (loverwrite abs (x, y))
) | loverwrite  [] (x, y) = [(x, y)];
=TEX
Unify two terms:
note that because of bound variable matching we cannot swap the two terms about to exploit symmetry.
=SML
fun  ⦏term_unify⦎ (subs:SUBS)
	(avty : TYPE list) (avtm: TERM list)
	((itm1: TERM, ims1: TERM list, imi1: TYPE list),
	(itm2: TERM, ims2: TERM list, imi2: TYPE list))
	:
	((TYPE * TYPE) list * (TERM * TERM) list) *
	((TYPE * TYPE) list * (TERM * TERM) list) = (
let	
=TEX
Initialisation:
=SML
	val ((tm1,ms1,mi1),(tm2,ms2,mi2),esubs) = (
		uniquify avty avtm ((itm1, ims1, imi1), (itm2, ims2, imi2))
	);
	val dummy = init_subs subs;
	val ifvmatch = map (fn tm => (tm,Nil)) (ms1 @ ms2);
	val trans_ms1 = combine ims1 ms1;
	val trans_ms2 = combine ims2 ms2;
	val trans_mi1 = combine imi1 mi1;
	val trans_mi2 = combine imi2 mi2;
=TEX
=SML
	fun tmaux2 fvmatch bvmatch (App(f1, a1)) (App(f2, a2)) = (
		tmaux2 (tmaux2 fvmatch bvmatch
				(dest_simple_term a1) (dest_simple_term a2))
			bvmatch
			(dest_simple_term f1)
			(dest_simple_term f2)
	) | tmaux2 fvmatch bvmatch (Const(s1,ty1))(Const(s2,ty2)) = (
		if (s1 = s2)
		then (type_unify subs esubs ty1 ty2; fvmatch)
		else term_fail "term_unify" 67005 [itm1,itm2]
	) | tmaux2 fvmatch bvmatch (Simpleλ(v1,b1))(Simpleλ(v2,b2)) = (
		
		let	val bvmatch' = (v1, v2) :: bvmatch;
			val dummy = type_unify subs esubs (type_of v1) (type_of v2);
		in	tmaux2 fvmatch bvmatch'
			(dest_simple_term b1) (dest_simple_term b2)
		end
	) | tmaux2 fvmatch bvmatch stm1 stm2 = (
let
=TEX
Auxiliary functions handling variables:
=SML
	fun tmaux0 (fvmatch:(TERM * TERM OPT)list)
			bvmatch (tm1:TERM) (v2: TERM) = (
		case lrassoc5 bvmatch v2 of
		Nil => (
			if any (frees tm1) (fn x => any bvmatch (fn (x1, _) => (x =$ x1)))
			then term_fail "term_unify" 67005 [itm1,itm2]

			else case llassoc5 fvmatch v2 of
			Value(Value tm1') => (
				tmaux2 fvmatch bvmatch
					(dest_simple_term tm1)
					(dest_simple_term tm1')
			) | Value Nil => (
				let	val dummy =
					type_unify subs esubs (type_of tm1) (type_of v2);
				in	if (occurs_check_term
					 fvmatch v2 tm1)
					then fvmatch
					else loverwrite fvmatch
					(v2, Value tm1)
				end
			) | Nil => (
			if is_var tm1
			then (case llassoc5 fvmatch tm1 of
			Value(Value tm1') => (
				tmaux2 fvmatch bvmatch
				(dest_simple_term tm1)
				(dest_simple_term tm1')
			) | Value Nil => (
				let	val dummy =
					type_unify subs esubs (type_of tm1) (type_of v2);
				in	loverwrite fvmatch (tm1, Value v2)
				end
			) | Nil => (
			let	val (nm1,vty1) = dest_var tm1;
				val (nm2,vty2) = dest_var v2;
			in
				(if nm1 = nm2
				then (type_unify subs esubs vty1 vty2; fvmatch)
				else term_fail "term_unify" 67006 [itm1,itm2,tm1])
			end
			))
			else term_fail "term_unify" 67005 [itm1,itm2])			
		) |	Value _ => term_fail "term_unify" 67005 [itm1,itm2]
	);
=TEX
=SML
	fun tmaux1 fvmatch (bvmatch : (TERM * TERM) list)
			tm1 v2 = (
		if is_var tm1
		then	(case llassoc5 bvmatch tm1 of
				Value v2' => (
					if v2' =$ v2 andalso
					(case lrassoc5 bvmatch v2' of
					Value vv => vv =$ tm1
					| _ => false)
					then fvmatch
					else term_fail "term_unify" 67005 [itm1,itm2]
			) |	Nil => tmaux0 fvmatch bvmatch tm1 v2
			)
		else 	tmaux0 fvmatch bvmatch tm1 v2
	);

=TEX
Now the analogues to the above two, except the variable is the first term
(done to keep bound variables straight)
=SML
	fun tmaux0' (fvmatch:(TERM * TERM OPT)list)
			bvmatch (tm2:TERM) (v1: TERM) = (
		case llassoc5 bvmatch v1 of
		Nil => (
			if any (frees tm2) (fn x => any bvmatch (fn (_, x1) => (x =$ x1)))
			then term_fail "term_unify" 67005 [itm2,itm2]

			else case llassoc5 fvmatch v1 of
			Value(Value tm1') => (
				tmaux2 fvmatch bvmatch
				(dest_simple_term tm1')
				(dest_simple_term tm2)
			) | Value Nil => (
				let	val dummy =
					type_unify subs esubs (type_of v1) (type_of tm2);
					in	
						if (occurs_check_term
						 fvmatch v1 tm2)
						then fvmatch
						else loverwrite fvmatch
						(v1, Value tm2)
					end
			) | Nil => (
			if is_var tm2
			then (case llassoc5 fvmatch tm2 of
			Value(Value tm2') => (
				tmaux2 fvmatch bvmatch
				(dest_simple_term v1)
				(dest_simple_term tm2')
			) | Value Nil => (
				let	val dummy =
					type_unify subs esubs (type_of v1) (type_of tm2);
				in	loverwrite fvmatch (tm2, Value v1)
				end
			) | Nil => (
			let	val (nm1,vty1) = dest_var tm2;
				val (nm2,vty2) = dest_var v1;
			in
				(if nm1 = nm2
				then (type_unify subs esubs vty1 vty2; fvmatch)
				else term_fail "term_unify" 67006 [itm1,itm2,tm2])
			end
			))
			else term_fail "term_unify" 67005 [itm1,itm2])			
		) |	Value _ => term_fail "term_unify" 67005 [itm1,itm2]
	);
=TEX
=SML
	fun tmaux1' fvmatch (bvmatch : (TERM * TERM) list)
			tm2 v1 = (
		if is_var tm2
		then	(case lrassoc5 bvmatch tm2 of
				Value v1' => (
					if v1' =$ v1 andalso
					(case llassoc5 bvmatch v1' of
					Value vv => vv =$ tm2
					| _ => false)
					then fvmatch
					else term_fail "term_unify" 67005 [itm1,itm2]
			) |	Nil => tmaux0' fvmatch bvmatch tm2 v1
			)
		else 	tmaux0' fvmatch bvmatch tm2 v1
	);

=TEX
Back to the body of tmaux2
=SML
in
		case stm1 of
		(Var v1) =>
		tmaux1' fvmatch bvmatch (mk_simple_term stm2) (mk_var v1)
		| _ => case stm2 of
		(Var v2) =>
		tmaux1 fvmatch bvmatch (mk_simple_term stm1) (mk_var v2)
		| _ => term_fail "term_unify" 67005 [itm1,itm2]
end);
=TEX
=SML
	val ofvmatch = tmaux2 ifvmatch []
		(dest_simple_term tm1)
		(dest_simple_term tm2);
	fun get_ty_inst trans_mi ty = (
	let	val used_ty = tylassoc3 trans_mi ty;
		val sendto = expand_type subs esubs used_ty;
	in
		if sendto =: ty
		then fail "get_ty_inst" 0 []
		else (sendto, ty)
	end);
	val omi1 = mapfilter (get_ty_inst trans_mi1) imi1;
	val omi2 = mapfilter (get_ty_inst trans_mi2) imi2;
	fun get_tm_subst trans_ms tm = (
	let	val used_tm = llassoc3 trans_ms tm;
		val sendto = expand_term subs esubs ofvmatch used_tm;
	in
		(sendto, tm)
	end);
	val oms1 = mapfilter (get_tm_subst trans_ms1) ims1;
	val oms2 = mapfilter (get_tm_subst trans_ms2) ims2;
in
	((omi1,oms1),(omi2,oms2))
end
handle complaint =>
pass_on complaint "type_unify" "term_unify");
=IGN
val scratchpad = (new_subs 100);
term_unify scratchpad [] [] ((⌜a⌝,[],[]),(⌜a⌝,[],[]));
term_unify scratchpad [] [] ((⌜a⌝,[],[]),(⌜b⌝,[],[])); (* fails *)
term_unify scratchpad [] [] ((⌜a⌝,[⌜a⌝],[]),(⌜b⌝,[⌜b⌝],[]));
term_unify scratchpad [] [] ((⌜a⌝,[⌜a⌝],[]),(⌜b⌝,[],[]));
term_unify scratchpad [] [] ((⌜a⌝,[⌜a⌝],[]),(⌜a⌝,[⌜a⌝],[]));
term_unify scratchpad [] [] ((⌜a⌝,[],[]),(⌜b⌝,[⌜b⌝],[]));
term_unify scratchpad [] [] ((⌜a:'a⌝,[⌜a:'a⌝],[ⓣ'a⌝]),(⌜b:'b⌝,[⌜b:'b⌝],[ⓣ'b⌝]));
term_unify scratchpad [] [] ((⌜a:'a⌝,[⌜a:'a⌝],[ⓣ'a⌝]),(⌜b:'b⌝,[⌜b:'b⌝],[]));
term_unify scratchpad [] [] ((⌜a:'a⌝,[⌜a:'a⌝],[]),(⌜b:'b⌝,[⌜b:'b⌝],[ⓣ'b⌝]));
term_unify scratchpad [] [] ((⌜f (x (f:'a → 'b):'a)⌝,[⌜f:'a → 'b⌝,⌜x:('a → 'b) → 'a⌝],[ⓣ'a⌝,ⓣ'b⌝]),
	(⌜y (g:'a → 'b) g:'b⌝,[⌜y:('a → 'b) → ('a → 'b) → 'b⌝,⌜g:'a → 'b⌝],[ⓣ'a⌝,ⓣ'b⌝]));
term_unify scratchpad [] [] ((⌜R (x:'a) (y:'a):BOOL⌝,[⌜x:'a⌝, ⌜y:'a⌝, ⌜z:'a⌝],[]),(⌜R (x:'a) (z:'a):BOOL⌝,[⌜x:'a⌝, ⌜y:'a⌝, ⌜z:'a⌝],[]));
term_unify scratchpad [] [] ((⌜⌝,[],[]),(⌜⌝,[],[]));
term_unify scratchpad [] [] ((⌜⌝,[],[]),(⌜⌝,[],[]));

fun free_unify tm1 tm2 = (term_unify scratchpad [] []
	((tm1,frees tm1,map mk_vartype(term_tyvars tm1)),
	(tm2,frees tm2,map mk_vartype(term_tyvars tm2)))
);
fun setup_unify tm1 tm2 =
	((tm1,frees tm1,map mk_vartype(term_tyvars tm1)),
	(tm2,frees tm2,map mk_vartype(term_tyvars tm2)));
free_unify ⌜f:'a → 'b⌝ ⌜g:'a → 'b⌝;
free_unify ⌜f x⌝ ⌜g y⌝;
free_unify ⌜λ x ⦁ f⌝ ⌜λ y ⦁ g⌝;
free_unify ⌜λ x ⦁ f x⌝ ⌜λ y ⦁ g y⌝;
free_unify ⌜λ x ⦁ f p⌝ ⌜λ y ⦁ g q⌝;

free_unify ⌜f x⌝ ⌜g (y:'c)⌝;

=TEX
\subsection{Resolution Tools Proper}
The arguments are:
\begin{enumerate}
\item
The term is a subterm of the theorem argument(5),
reached through outer universal quantifications and
all propositional connectives.
\item
The bool is false if and only if the subterm occurs ``negatively'' in the conclusion of the theorem.
\item
The following list is the specialisable variables of the subterm,
paired with functions that will instantiate the theorems as necessary.
\item
The type list is the instantiable type variables of the subterm.
\item
The theorem is the source of the fragment.
\item
The next term list is the term variables that may not be used
in unifying the fragment
\item
The next type list is the type variables that may not be used
in unifying the fragment
\end{enumerate}
=SML
datatype ⦏FRAG_PRIORITY⦎ = FragSubsumesProcessed | FragOther;

type ⦏BASIC_RES_TYPE⦎ = TERM * bool * (TERM * (TERM -> THM -> THM))list
	* TYPE list * THM * TERM list * TYPE list * int * FRAG_PRIORITY;
type ⦏RES_DB_TYPE⦎ = BASIC_RES_TYPE list * BASIC_RES_TYPE list *
	BASIC_RES_TYPE list * THM list;
=TEX
=SML
fun ⦏simple_∀_expand_conv⦎ x tm = (
let	val atm = asm_rule tm;
	val xtm = simple_∀_elim x atm;
	val axtm = ∧_intro atm xtm;
	val axtm' = ⇒_intro tm axtm;
	val aax = asm_rule (concl axtm);
	val aa = ∧_left_elim aax;
	val aa' = ⇒_intro (concl axtm) aa;
in
	⇔_intro axtm' aa'
end);
=IGN
simple_∀_expand_conv ⌜g x : 'a⌝ ⌜∀ y : 'a ⦁ f y⌝;
=TEX
=SML
fun ⦏simple_∃_expand_conv⦎ x tm = (
let	val atm = asm_rule tm;
	val (y,t) = dest_simple_∃ tm;
	val xtm = var_subst[(x,y)]t;
	val s1 = ∨_right_intro xtm atm;
	val s2 = ⇒_intro tm s1;
	val s3 = asm_rule (concl s1);
	val s4 = asm_rule tm;
	val s5 = simple_∃_intro tm (asm_rule xtm);
	val s6 = ∨_elim s3 s4 s5;
	val s7 = ⇒_intro (concl s1) s6;
in
	⇔_intro s2 s7
end);
=IGN
simple_∃_expand_conv ⌜g x : 'a⌝ ⌜∃ y : 'a ⦁ f y⌝;
=TEX
=SML
fun ⦏simple_∃⋎1_expand_conv⦎ x tm = (
let	val atm = asm_rule tm;
	val s0 = simple_∃⋎1_conv tm;
	val etm = snd(dest_eq (concl s0));
	val (y,t) = dest_simple_∃ etm;
	val xtm = var_subst[(x,y)]t;
	val s1 = ∨_right_intro xtm atm;
	val s2 = ⇒_intro tm s1;
	val s3 = asm_rule (concl s1);
	val s4 = asm_rule tm;
	val s5 = simple_∃_intro etm (asm_rule xtm);
	val s6 = ⇔_mp_rule  (eq_sym_rule s0) s5;
	val s7 = ∨_elim s3 s4 s6;
	val s8 = ⇒_intro (concl s1) s7;
in
	⇔_intro s2 s8
end);
=IGN
simple_∃⋎1_expand_conv ⌜g x : 'a⌝ ⌜∃⋎1 y : 'a ⦁ f y⌝;
=TEX
=SML
local
	datatype OCCURS = Positive | Negative | Both;
	fun not_occurs Positive = Negative
	| not_occurs Negative = Positive
	| not_occurs Both = Both;

	fun rev_pos (a,t,bd,fnvs) = (a, not t,bd,fnvs);

	fun get_getme (getme:(TERM -> CONV -> CONV)list) cnv
		: TERM -> CONV = (
	let	val getme' = rev getme;
	in
		(fn x => fold (fn (cvl,cv) => cvl x cv) getme' (cnv x))
	end);

	fun simple_get_getme ([]:(TERM -> CONV -> CONV)list) = simple_∀_elim
	| simple_get_getme getme =  (
		(fn y =>  simple_∀_elim y o
			conv_rule (fold (fn (cvl,cv) => cvl y cv)
				(rev getme) id_conv))
	);
	fun if_is_not_free not_free (tm,pos,bd,fnvs) lst = (
		if list_is_free_in not_free tm
		then lst
		else (case pos of
		Positive => ((tm,true,bd,fnvs) :: lst)
		| Negative => ((tm,false,bd,fnvs) :: lst)
		| Both => ((tm,true,bd,fnvs) :: (tm,false,bd,fnvs) :: lst)
		)
	);
=TEX
Throw away the first argument:
=SML
val K = Combinators.K;
=TEX
The following is the key auxiliary function to fragment term.
The $fnvs$ guide a conversion that will introduce a term,
and must both ensure the introduction, as well as prevent
undesired variable capture.
The $TERM$ argument to a member of the $getme$ list
is present to allow renaming.
=SML
	fun aux (pos:OCCURS) (bd:TERM list) (not_free : TERM list)
		(fnvs: (TERM * (TERM -> THM -> THM))list)
		(getme:(TERM -> CONV -> CONV)list) (tm:TERM) (dtm : DEST_TERM)
		: (TERM * bool * TERM list *
		   (TERM * (TERM -> THM -> THM)) list) list = (
	case dtm of
	D⇒(a,b) => (
		aux (not_occurs pos) bd not_free fnvs (K LEFT_C :: getme) a (dest_term a) @
		aux pos bd not_free fnvs (K RIGHT_C :: getme) b (dest_term b))
	| (D¬ a) => (aux (not_occurs pos) bd not_free fnvs (K RAND_C :: getme)
		a (dest_term a)
	) | (D∧(a,b)) => (
		aux pos bd not_free fnvs (K LEFT_C :: getme) a (dest_term a) @
		aux pos bd not_free fnvs (K RIGHT_C :: getme) b (dest_term b)
	) | (D∨(a,b)) => (
		aux pos bd not_free fnvs (K LEFT_C :: getme) a (dest_term a) @
		aux pos bd not_free fnvs (K RIGHT_C :: getme) b (dest_term b)
	) | (D⇔(a,b)) => (
		let 	val a' = (aux Both bd not_free fnvs (K LEFT_C :: getme)
				a (dest_term a));
			val b' = (aux Both bd not_free fnvs (K RIGHT_C :: getme)
				b (dest_term b));
		in
			a' @ b'
		end
=TEX
It would be nice to see whether equality $DEq$ could
be made into an $⇔$ when the sides have type variables for their types, but the $fnvs$ parameter isn't
given enough information (e.g. the other type instantiations)
to do this.
=SML
	) | DT => (case pos of
		Negative => [(mk_t,false,bd,rev fnvs)]
		| Both => [(mk_t,false,bd,rev fnvs)]
		| Positive => []
	) | DF => (case pos of
		Positive => [(mk_f,true,bd,rev fnvs)]
		| Both => [(mk_f,true,bd,rev fnvs)]
		| Negative => []
	) | (D∀ (x,t)) => (
		if is_pair x
		then let val tm' = snd(dest_eq(concl(∀_uncurry_conv tm)))
		in
		aux pos bd not_free fnvs (K (fn c => ∀_uncurry_conv THEN_C c)
			:: getme) tm' (dest_term tm')
		end else if present (op =$) x bd
		then let val x' = variant bd x;
			val tm' = mk_simple_∀(x',var_subst[(x',x)]t)
		in
		aux pos bd not_free fnvs getme tm' (dest_term tm')
		end else
		(if_is_not_free not_free
		(tm,pos,bd,rev fnvs)
		(if not(pos = Negative)
		then (
		aux Positive (x :: bd) not_free (
			(x,fn y => conv_rule(get_getme getme simple_∀_expand_conv y))
				:: fnvs)
			(K RIGHT_C :: getme)
			t (dest_term t))
		else (
		aux pos bd (x::not_free) fnvs
			(SAFE_SIMPLE_BINDER_C :: getme)
			t (dest_term t))))
	) | (D∃ (x,t)) => (
		if is_pair x
		then let val tm' = snd(dest_eq(concl(∃_uncurry_conv tm)))
		in
		aux pos bd not_free fnvs (K (fn c => ∃_uncurry_conv THEN_C c):: getme)
			tm' (dest_term tm')
		end else if present (op =$) x bd
		then let val x' = variant bd x;
			val tm' = mk_simple_∃(x',var_subst[(x',x)]t)
		in
		aux pos bd not_free fnvs getme tm' (dest_term tm')
		end else
		(if_is_not_free not_free
		(tm,pos,bd,rev fnvs)
		(if not(pos = Positive)
		then (
		aux Negative (x :: bd) not_free (
			(x,fn y => conv_rule(get_getme getme simple_∃_expand_conv y))
				:: fnvs)
			(K RIGHT_C :: getme)
			t (dest_term t))
		else (
		aux pos bd (x::not_free) fnvs
			(SAFE_SIMPLE_BINDER_C :: getme)
			t (dest_term t))))
	) | (D∃⋎1 (x,t)) => (
		if is_pair x
		then (case pos of
		Positive => [(tm, true, bd, rev fnvs)]
		| Negative => [(tm, false, bd, rev fnvs)]
		| Both => [(tm, true, bd, rev fnvs),(tm, false, bd, rev fnvs)]
		) else if present (op =$) x bd
		then let val x' = variant bd x;
			val tm' = mk_simple_∃⋎1(x',var_subst[(x',x)]t)
		in
		aux pos bd not_free fnvs getme tm' (dest_term tm')
		end else
		(if_is_not_free not_free
		(tm,pos,bd,rev fnvs)
		(let	val tm' = snd(dest_eq(concl(simple_∃⋎1_conv tm)));
		in
			aux pos bd not_free fnvs
			(K (fn x => simple_∃⋎1_conv THEN_C x):: getme)
			tm' (dest_term tm')
		end))
	) | (DIf(cnd,th,el)) => (
	let	val cnd' = aux Both bd not_free fnvs
			(K (RATOR_C o RATOR_C o RAND_C)
			:: getme)
			cnd (dest_term cnd);
	in
		cnd' @
		aux pos bd not_free fnvs (K LEFT_C :: getme) th (dest_term th) @
		aux pos bd not_free fnvs (K RIGHT_C :: getme) el (dest_term el)
	end
	) | _ => (
		if_is_not_free not_free (tm, pos, bd, rev fnvs) []
	));

	fun aux1 (bd:TERM list) (fnvs: (TERM * (TERM -> THM -> THM))list)
		(getme:(TERM -> CONV -> CONV)list) (tm:TERM)
		: (TERM * bool * TERM list * (TERM *
		  (TERM -> THM -> THM)) list) list = (
	let val (x,t) = dest_∀ tm;
	in	
		if is_pair x
		then (let val tm' = snd(dest_eq(concl(∀_uncurry_conv tm)))
		in
		aux1 bd fnvs (K (fn c => ∀_uncurry_conv THEN_C c) :: getme) tm'
		end) else if present (op =$) x bd
		then let val x' = variant bd x;
			val tm' = mk_simple_∀(x',var_subst[(x',x)]t)
		in
		aux1 bd fnvs getme tm'
		end else
		((tm,true,bd,rev fnvs) ::
		aux1 (x :: bd) (
			(x,simple_get_getme getme) :: fnvs)
			getme
			t)
	end
	handle Fail _ =>
	(aux Positive bd [] fnvs getme tm (dest_term tm)
	));
in
fun ⦏fragment_term⦎ (tm : TERM) : (TERM * bool * TERM list *
		((TERM * (TERM -> THM -> THM))list)) list = (
	aux1 [] [] [] tm
);
end;
=IGN
fragment_term ⌜∀ a ⦁ a ∧ ¬ b ⇒ (∀ e ⦁ e ∧ c) ∧ f d⌝;
fragment_term ⌜∀ f ⦁ (∀ x ⦁ f x ⇔ g x) ⇒ (f = g)⌝;
fragment_term ⌜∀ f ⦁ (∀ x ⦁ f x ⇔ g x) ⇔ (f = g)⌝;
=TEX
``Specialise'' the noted quantified variables in a theorem,
leave the rest specialised to the bound variable
(presumably what the caller intended).
Specialisation is done by the supplied function.
=SML
fun ⦏lrassoc1⦎ ((x, y) :: rest : (TERM * TERM) list) (what : TERM) : TERM = (
	if y =$ what
	then x
	else lrassoc1 rest what
) | lrassoc1 [] what = what;
=TEX
=SML
fun ⦏local_specialise_rule⦎ (subs:(TERM * TERM)list)
	(fnvs : (TERM * (TERM -> THM -> THM))list) (thm:THM) : THM = (
let	fun aux [] thm = thm
	| aux ((ix,fnv) :: rest) thm =
		aux rest (fnv (lrassoc1 subs ix) thm)
in
	aux fnvs thm
end);
=TEX
This returns $1$ if the conclusion of the first theorem equals
the second's, or is
a less general form than the second
(i.e. could be produced only by specialising the second theorem).
It returns $2$ if the second theorem's conclusion
is a less general form than the first,
and otherwise returns $0$.

In checking, one must either gain a successful term match
of the two conclusions, which can be used to generate
the other theorem.
The requirement is that the type instantiation
affects no type variables in the assumptions,
any specialised variable in the second theorem was bound,
and that any variable bound in the first theorem
is not free in the second.

(using inference in a check is crude).
=SML
fun ⦏basic_res_subsumption⦎ (thm1 : THM) (thm2 :THM) : int = (
let	val (vs1,c1) = strip_∀(concl thm1);
	val (vs2,c2) = strip_∀(concl thm2);
	val vs1' = flat(map strip_pair vs1);
	val vs2' = flat(map strip_pair vs2);
in
(let	val (tym,tvm) = term_match c1 c2;
	val cthm2' = concl(inst_type_rule tym thm2);
	val fthm2' = frees cthm2';
	val aux_val = (flat(map strip_pair (fst(strip_∀ cthm2'))));
in
	if all (map snd tvm) (fn xx => present (op =$) xx aux_val)
		andalso not(any vs1' (fn x => present (op =$) x fthm2'))
	then 1
	else fail "" 0 []
end
handle (Fail _) =>
(let	val (tym,tvm) = term_match c2 c1;
	val cthm1' = concl(inst_type_rule tym thm1);
	val fthm1' = frees cthm1';
	val aux_val = (flat(map strip_pair (fst(strip_∀ cthm1'))));
in
	if all (map snd tvm) (fn xx => present (op =$) xx aux_val)
		andalso not(any vs2' (fn x => present (op =$) x fthm1'))
	then 2
	else 0
end
handle (Fail _) => 0))
end);
=IGN
basic_res_subsumption t_thm f_thm;
basic_res_subsumption t_thm t_thm;
basic_res_subsumption ∧_thm (all_simple_∀_elim ∧_thm);
basic_res_subsumption (all_simple_∀_elim ∧_thm) ∧_thm ;
let 	val thma = tac_proof(([],⌜∀ x : 'a ⦁ x = x⌝), rewrite_tac[]);
	val thmb = tac_proof(([],⌜∀ x : BOOL ⦁ x = x⌝), rewrite_tac[]);
in
(basic_res_subsumption thma thmb,
basic_res_subsumption thmb thma)
end;
let 	val thma = tac_proof(([],⌜∀ x : 'a ⦁ x = x⌝), rewrite_tac[]);
	val thmb = asm_rule ⌜∀ x : 'b ⦁ x = x⌝;
in
(basic_res_subsumption thma thmb,
basic_res_subsumption thmb thma)
end;
basic_res_subsumption (asm_rule ⌜∀ x y z⦁ R x y ∧ R y z ⇒ R x z⌝)
	(asm_rule ⌜∀ x y z⦁ R x y ∧ R y z ⇒ R x z⌝);

basic_res_subsumption (asm_rule ⌜∀ x y z⦁ R x y ∧ R y z ⇒ R x z⌝)
	(asm_rule ⌜∀ p q r⦁ R p q ∧ R q r ⇒ R p r⌝);


=TEX
I believe the only things one shouldn't specialise to
are free variables in the conclusion or assumptions.
Thus we ignore the $bd$ result of fragment term.
=SML
fun ⦏aux_basic_res_pre⦎ (gen:int) (fp:FRAG_PRIORITY) ([] : THM list)
	: BASIC_RES_TYPE list = []
| aux_basic_res_pre (gen:int) fp (a :: x) = (
let	val (seqasms,cl) = dest_thm a;
	val ctyvars = term_tyvars cl;
	val atyvars = list_cup (map term_tyvars seqasms);
	val fvs = list_union (op =$) (frees cl :: map frees seqasms);
	val ityvars = map mk_vartype (ctyvars diff atyvars);
	val frags = fragment_term cl;
in
	map (fn (frag,pos,bd,fnvs) => (frag,pos,fnvs,ityvars,a,
		fvs,
		map mk_vartype atyvars,gen,fp)) frags @
	aux_basic_res_pre gen fp x
end);
=TEX
=SML
fun ⦏basic_res_pre⦎ (sos:THM list) (rest:THM list) : RES_DB_TYPE = (
let	val prest = aux_basic_res_pre 0 FragOther rest;
	val psos = aux_basic_res_pre 0 FragOther sos;
in
	if is_nil psos
	then (prest, [], psos, rest @ sos)
	else (prest @ [hd psos], [], psos, rest @ sos)
end);

=TEX
Try an instantiation or substitution, but don't fail.
=SML
fun ⦏try_var_subst⦎ (ts : (TERM * TERM) list) (tm : TERM): TERM = (
	var_subst ts tm
	handle complaint =>
	if area_of complaint = "var_subst"
	then tm
	else reraise complaint (area_of complaint)
);
fun ⦏try_inst⦎ (av:TERM list) (ts : (TYPE * TYPE) list) (tm : TERM): TERM = (
	inst av ts tm
	handle complaint =>
	if area_of complaint = "inst"
	then tm
	else reraise complaint (area_of complaint)
);
=TEX
Function $aux$ determines what the limiting condition is.
As stated it is number of resolutions to gain result,
if it was recoded as
=INLINEFT
fun aux (nres1,nres2) = (int_max(nres1, nres2) + 1);
=TEX
then the limit would be the number of cycles of resolving everything present against everything else present.
=SML
local
	fun aux (nres1,nres2) = (nres1 + nres2 + 1);
in
fun ⦏basic_res_resolver⦎ (subs:SUBS) (limit:int)
	((frag1,pos1,fnvs1,tyvars1,thm1,nsvs1,nivs1,nres1,status1):BASIC_RES_TYPE)
	((frag2,pos2,fnvs2,tyvars2,thm2,nsvs2,nivs2,nres2,status2):BASIC_RES_TYPE)
		: THM list * int = (
	if (pos1 = pos2) orelse (aux(nres1, nres2) > limit)
	then ([],0)
	else ((
	let	(* val dummy = diag_string("Try :"^string_of_term frag1^
		" of "^string_of_term (concl thm1)^" against "^string_of_term frag2
		^" of "^string_of_term (concl thm2)); *)
		val ((ti1,ts1),(ti2,ts2)) = term_unify subs
		(nivs1 @ nivs2) (nsvs1 @ nsvs2)
		((frag1,(map fst fnvs1),tyvars1),(frag2,(map fst fnvs2),tyvars2));
		val thm1' = local_specialise_rule ts1 fnvs1
			(inst_type_rule ti1 thm1);
		val thm2' = local_specialise_rule ts2 fnvs2
			(inst_type_rule ti2 thm2);
		val subterm = try_var_subst (map (fn(x,y) =>
				(x,try_inst [] ti1 y)) ts1)
			(try_inst [] ti1 frag1);
	in
		if pos1
		then ([basic_resolve_rule subterm thm1' thm2'], aux(nres1,nres2))
		else ([basic_resolve_rule subterm thm2' thm1'], aux(nres2,nres1))
	end)
	handle complaint =>
	(if area_of complaint = "term_unify"
	then ([]:THM list,0)
	else reraise complaint (area_of complaint)))
);
end;
=TEX
=SML
local
=SML
fun keep_lose_thms new_thms old_thms = (
=TEX
The arguments to this are:
\begin{itemize}
\item
Theorems perhaps to be added
\item
Theorems to be added, checked against new theorem and the rest, paired with pre-existing theorems they subsume.
\item
Theorems to be added, and the rest, paired with pre-existing theorems they subsume.
\item
Discarded theorems for this theorem.
\item
Discarded theorems.
\item
Pre-existing theorems to check against for new added theorem.
\item
Pre-existing theorems checked against new added theorem.
\end{itemize}
=SML
let	fun aux [] added added' llost lost old old' = (
		added,(map fst added) @ old, lost
	) | aux (a :: x) added [] llost lost old [] = (
		aux x ((a,llost) :: added) ((a,llost) :: added) [] lost old old
	) | aux (a :: x) added ((a',llost') :: x') llost lost old [] = (
		case (basic_res_subsumption a a') of
		1 => (if (!give_diag)
		      then diag_string (get_error_message 67100 [string_of_thm a])
		      else();
			aux x added added [] lost old old
		) | 2 => (if (!give_diag)
			then diag_string(get_error_message 67100 [string_of_thm a'])
			else ();
			aux (a :: x)
			(added drop (fn(ea,_) => (dest_thm ea =# dest_thm a')))
			 x' (llost @ llost') lost old []
		) | _ => aux (a :: x) added x' llost lost old []
	) | aux (a :: x) added added' llost lost old (a' :: x') = (
		case (basic_res_subsumption a a') of
		1 => (
		aux x added added' [] lost old old
		) | 2 => (
		aux (a :: x) added added' (a' :: llost) (a' :: lost) (thm_less old a') x'
		) | _ => aux (a :: x) added added' llost lost old x'
	);
in
	aux new_thms [] [] [] [] old_thms old_thms
end);
=TEX
Drop any fragments whose theorems are in a given list.
=SML
fun frag_drop thms : int -> BASIC_RES_TYPE list ->
	BASIC_RES_TYPE list * bool * int = (
let	val cthml = map dest_thm thms;
	fun aux dropped acc lgen [] = (rev acc,dropped,lgen)
	| aux dropped acc lgen ((frag as (_,_,_,_,thm,_,_,gen,_))::x) = (
		if present (op =#) (dest_thm thm) cthml
		then aux true acc (int_min(lgen,gen)) x
		else aux dropped (frag :: acc) lgen x
	)
in
	aux false []
end);
=TEX
We assume the input new fragments are free of the theorems to be removed.
=SML
fun remove_subsumed_thms nres ((new_thm,sthms),
	(against, tried, hdtoprocess, tltoprocess,new_frags)) =
(let	val dummy =  if (!give_diag)
		then
		(if is_nil sthms
		then (diag_line (get_error_message 67102 [string_of_thm new_thm]))
		else (diag_line (get_error_message 67103 [string_of_thm new_thm,
			format_list string_of_thm sthms ", "])))
		else ();
	val fd = frag_drop sthms;
	val (against',agdrop,nres') = fd nres against;
	val (tried',trdrop,nres'') = fd nres' tried;
	val (hdtoprocess',hddrop,nres''') =  fd nres'' hdtoprocess;
	val (tltoprocess',tldrop,nres'''') = (fd nres''' tltoprocess);
	val new_frags' = if agdrop orelse trdrop
		then aux_basic_res_pre nres'''' FragSubsumesProcessed [new_thm]
		else aux_basic_res_pre nres'''' FragOther [new_thm];
in
	(against', tried', hdtoprocess', tltoprocess',new_frags @ new_frags')
end);
=TEX
=SML
in
fun ⦏basic_res_post⦎ (subsum:THM -> THM -> int)
	(((res,nres), (against, tried, toprocess, using_thms))
		:(THM list * int) * RES_DB_TYPE)
	: (RES_DB_TYPE * bool) = (
let	val res' = flat(map strip_∧_rule res) drop (fn thm =>
		is_t(concl thm));
in
	if any res' (fn thm => is_f(concl thm))
	then ((against, tried, toprocess, res' @ using_thms),true)
	else (let	val (new_thms, keep_thms, lose_thms) = keep_lose_thms res' using_thms;
		val (against',tried',hdtoprocess',tltoprocess', new_frags) =
		fold (remove_subsumed_thms nres) new_thms (tl against,
			((hd against) :: tried),
			[hd toprocess],
			(tl toprocess),
			[]);
	in
		if is_nil hdtoprocess'
		then (([], rev_append against' tried, tltoprocess' @ new_frags, keep_thms),
			false)
		else if is_nil against'
		then (([], tried', tltoprocess' @ new_frags, keep_thms), false)
		else
		((against', tried', hdtoprocess' @ tltoprocess' @ new_frags, keep_thms),
			false)
	end)
end);
end;
=TEX
=SML
fun ⦏basic_res_extract⦎ ((_,_,_,thml):RES_DB_TYPE) : THM list = thml;

=TEX
=SML
fun ⦏basic_res_next_to_process⦎ (frags:BASIC_RES_TYPE list)
	: BASIC_RES_TYPE list = (
let	fun move_to_head [] _ = frags
	| move_to_head ((frag as (_,_,_,_,_,_,_,_,status)) :: x) acc = (
		if status = FragSubsumesProcessed
		then (frag :: (rev_append acc x))
		else move_to_head x (frag :: acc)
	);
in
	move_to_head frags []
end);
=SML
fun ⦏prim_res_rule⦎ (prep : THM list -> THM list -> ('a list * 'a list * 'a list * 'b))
	(reso:'a -> 'a -> 'c)
	(postp:('c * ('a list * 'a list * 'a list * 'b)) ->
		(('a list * 'a list * 'a list * 'b) * bool))
	(next_to_process:'a list -> 'a list)
	(extract:('a list * 'a list * 'a list * 'b) -> THM list)
	(sos : THM list)
	(rest : THM list) : THM list = (
	if any sos (fn thm => is_f(concl thm)) orelse
		any rest (fn thm => is_f(concl thm))
	then [find (sos @ rest) (fn thm => is_f(concl thm))]
	else
let	val init_db = prep sos rest;
	fun aux (db as (against, tried, toprocess, dbdata)) = (
		if is_nil toprocess
		then extract db
		else if is_nil against
		then (let val toprocess' = next_to_process toprocess;
		in
			aux(rev (hd toprocess'::tried),[],toprocess',dbdata)
		end)
		else (let
			val res_thms = reso (hd toprocess) (hd against);
			val (db',halt) = postp (res_thms,db);
		in
			if halt
			then extract db'
			else aux db'
		end)
	);
in
	aux init_db
end);
=IGN
val (db as (against, tried, toprocess, dbdata)) = init_db;
local val toprocess' = next_to_process toprocess;
in
val (db as (against, tried, toprocess, dbdata)) =
	(rev (hd toprocess'::tried),[],toprocess',dbdata);
end;


val res_thms = reso (hd toprocess) (hd against);
val (db',halt) = postp (res_thms,db);
val (db as (against, tried, toprocess, dbdata)) = db';
=TEX
=SML
fun ⦏basic_res_rule⦎ (limit:int) (sos:THM list) (rest:THM list): THM list =
	if limit > 0
	then
	(prim_res_rule
		basic_res_pre
		(basic_res_resolver (new_subs 100) limit)
		(basic_res_post basic_res_subsumption)
		basic_res_next_to_process
		basic_res_extract
		sos
		rest)
	else fail "basic_res_rule" 67003 [fn () => string_of_int limit];
=IGN
val prep = basic_res_pre;
val reso = basic_res_resolver (new_subs 100) limit;
val postp = (basic_res_post basic_res_subsumption);
val next_to_process = basic_res_next_to_process;
val extract = basic_res_extract;

val limit = 1;
val sos = [(asm_rule ⌜(∀ x y z ⦁ R x y ∧ R y z ⇒ R x z)⌝)];
val rest = [];

=IGN
basic_res_rule 10 [] [];

basic_res_rule 0
	[asm_rule ⌜a ⇒ b⌝, asm_rule ⌜a:BOOL⌝] [];

basic_res_rule 1
	[asm_rule ⌜a ⇒ b⌝, asm_rule ⌜a:BOOL⌝] [];

basic_res_rule 10
	[asm_rule ⌜a ⇒ b⌝, asm_rule ⌜a:BOOL⌝] [];

basic_res_rule 1
	[asm_rule ⌜a ⇒ b⇒ c⌝, asm_rule ⌜a:BOOL⌝,asm_rule ⌜b:BOOL⌝] [];

basic_res_rule 2
	[asm_rule ⌜a ⇒ b⇒ c⌝, asm_rule ⌜a:BOOL⌝,asm_rule ⌜b:BOOL⌝] [];

basic_res_rule 1
	[
	(asm_rule ⌜(∀ x y :'a⦁ R x y ⇒ R y x)⌝)]
	[]; (* no addition *)
basic_res_rule 1
	[
	(asm_rule ⌜(∀ x y z:'a ⦁ R x y ∧ R y z ⇒ R x z)⌝)]
	[];
basic_res_rule 1
	[
	(asm_rule ⌜(∀ x y z :'a⦁ R x y ∧ R y z ⇒ R x z)⌝),
	(asm_rule ⌜(∀ x y :'a⦁ R x y ⇒ R y x)⌝)]
	[];
basic_res_rule 2 (* slow? - 44 thms - 78.8s *)
	[
	(asm_rule ⌜(∀ x y z :'a⦁ R x y ∧ R y z ⇒ R x z)⌝),
	(asm_rule ⌜(∀ x y :'a⦁ R x y ⇒ R y x)⌝)]
	[];
basic_res_rule 5 (* 221 sec, 167 thms *)
	[
	(asm_rule ⌜(∀ x y z :'a⦁ R x y ∧ R y z ⇒ R x z)⌝),
	(asm_rule ⌜(∀ x y:'a ⦁ R x y ⇒ R y x)⌝),
	(asm_rule ⌜∀ x :'a⦁ R x (f x:'a)⌝),
	(asm_rule ⌜(¬ R (x:'a) x)⌝)]
	[];
basic_res_rule 5 (* 8.3 sec, 12 thms *)
	[(asm_rule ⌜(¬ R (x:'a) x)⌝)]
	[(asm_rule ⌜(∀ x y z :'a⦁ R x y ∧ R y z ⇒ R x z)⌝),
	(asm_rule ⌜(∀ x y:'a ⦁ R x y ⇒ R y x)⌝),
	(asm_rule ⌜∀ x :'a⦁ R x (f x:'a)⌝)
	];

basic_res_rule 5
	[(asm_rule ⌜∀ x :'a⦁ R x (f x:'a)⌝),
	(asm_rule ⌜(∀ x y:'a ⦁ R x y ⇒ R y x)⌝)
	]
	[];
basic_res_rule 10
	[(asm_rule ⌜∀ x ⦁ p (f x) ∧ ¬ p x⌝)]
	[];
(* Moore's three blocks problem *)
basic_res_rule 5 (* 74.2 secs, 87 thms *)
	[
	(asm_rule ⌜on(A:'box,B:'box):BOOL⌝),
	(asm_rule ⌜on(B:'box,C:'box):BOOL⌝),
	(asm_rule ⌜green(A:'box):BOOL⌝),
	(asm_rule ⌜¬ green(C:'box)⌝),
	(asm_rule ⌜∀ x y:'box⦁ (green x ∧ on(x,y)) ⇒ green y⌝)
	]
	[];
basic_res_rule 5 (* 44.1 secs, 65 thms *)
	[
	(asm_rule ⌜on(A:'box,B:'box):BOOL⌝),
	(asm_rule ⌜on(B:'box,C:'box):BOOL⌝),
	(asm_rule ⌜green(A:'box):BOOL⌝),
	(asm_rule ⌜¬ green(C:'box)⌝)
	]
	[(asm_rule ⌜∀ x y:'box⦁ (green x ∧ on(x,y)) ⇒ green y⌝)];

basic_res_rule 5
	[
	(asm_rule ⌜(∀ x ⦁ f x ⇔ g x) ⇒ (f = g)⌝)
	]
	[];
basic_res_rule 4
	[
	(asm_rule ⌜(∀ y:'a ⦁ f y ⇔ g y)⌝)
	]
	[(asm_rule ⌜(∀ x:'a ⦁ f x ⇔ g x) ⇒ (f = g)⌝),
	(asm_rule ⌜¬(f:'a → BOOL = g)⌝)];
basic_res_rule 2 (* slow! *)
	[
	(asm_rule ⌜¬(f (p:'a) ⇔ g p)⌝)
	]
	[(asm_rule ⌜(f = g) ⇒ (∀ x:'a ⦁ f x ⇔ g x)⌝),
	(asm_rule ⌜(f = g)⌝)];
basic_res_rule 1
	[
	(asm_rule ⌜¬ f p⌝)
	]
	[(asm_rule ⌜(f = g) ⇒ (∀ x ⦁ f x)⌝)];
basic_res_rule 1
	[
	(asm_rule ⌜f p:BOOL⌝)
	]
	[(asm_rule ⌜(f = g) ⇒ ¬(∃ x ⦁ f x)⌝)];
basic_res_rule 1
	[
	(asm_rule ⌜f p:BOOL⌝)
	]
	[(asm_rule ⌜(f = g) ⇒ ¬(∃⋎1 x ⦁ f x)⌝)];
basic_res_rule 2
	[
	(asm_rule ⌜f p:BOOL⌝)
	]
	[(asm_rule ⌜(f = g) ⇒ ¬(∃⋎1 x ⦁ f x)⌝)];
basic_res_rule 3 (* demonstrates can't get very far *)
	[
	(asm_rule ⌜f (p:'a):BOOL⌝),
	(asm_rule ⌜f (q:'a):BOOL⌝)
	]
	[(asm_rule ⌜¬(∃⋎1 x:'a ⦁ f x)⌝)];
basic_res_rule 10
	[
	(asm_rule ⌜f p:BOOL⌝)
	]
	[(asm_rule ⌜(∀ x ⦁ f x) ⇒ (f = g)⌝)];
basic_res_rule 10
	[
	(asm_rule ⌜¬ f p⌝)
	]
	[(asm_rule ⌜¬(∃ x ⦁ f x) ⇒ (f = g)⌝)];
basic_res_rule 2
	[
	(asm_rule ⌜f p:BOOL⌝)
	]
	[(asm_rule ⌜(∃⋎1 x ⦁ f x)⌝)];
basic_res_rule 3 (* need 3 minimum! *)
	[
	(asm_rule ⌜(f x ⇔ g x)⌝),
	(asm_rule ⌜¬(f x ⇔ g x)⌝)
	]
	[];
val app_eq_thm = tac_proof(([],⌜∀ f g x y ⦁ ((f = g) ∧ (x = y)) ⇒ (f x = g y)⌝),
	REPEAT strip_tac THEN asm_rewrite_tac[]);
basic_res_rule 1
	[
	(asm_rule ⌜¬(s x = s t)⌝)
	]
	[app_eq_thm];
(* the following is interesting as the type of a specialisable
, but not present, variable contains a type variable that
needs instantiation.
The second also demonstrates certain type instantiation effects *)
let
val app_eq_thm = tac_proof(([],⌜∀ f g x y ⦁ ((f = g) ∧ (x = y)) ⇒ (f x = g y)⌝),
	REPEAT strip_tac THEN asm_rewrite_tac[]);
in
basic_res_rule 1 [asm_rule ⌜∀ x⦁ r (k:ℕ) (x:'a) ⇒ x = t⌝]
	[app_eq_thm]
end;
let
val app_eq_thm = tac_proof(([],⌜∀ f g x y ⦁ ((f = g) ∧ (x = y)) ⇒ (f x = g y)⌝),
	REPEAT strip_tac THEN asm_rewrite_tac[]);
in
basic_res_rule 2 [asm_rule ⌜Suc k = Suc n⌝] [app_eq_thm]
end;

let
val app_eq_thm1 = tac_proof(([],⌜∀ s x y ⦁ (x = y) ⇒ (s x = s y)⌝),
	REPEAT strip_tac THEN asm_rewrite_tac[]);
in
basic_res_rule 1 [asm_rule ⌜∀ y⦁ s t = y ⇒ ¬ s x = y⌝] [app_eq_thm1]
end;
(* the following demonstrates bound variable capture *)
basic_res_rule 1 [asm_rule ⌜∃ x ⦁ x ∨ ∀ y :BOOL⦁ f y ∨ g y⌝]
	[asm_rule ⌜¬ f (x:BOOL):BOOL⌝];
basic_res_rule 1 [asm_rule ⌜∃ x ⦁ x ∨ ∀ y :BOOL⦁ f y⌝]
	[asm_rule ⌜¬ f (x:BOOL):BOOL⌝];

basic_res_rule 10
	[
	(asm_rule ⌜⌝),
	]
	[];
basic_res_rule 10
	[
	(asm_rule ⌜⌝),
	]
	[];
basic_res_rule 10
	[
	(asm_rule ⌜⌝),
	]
	[];
basic_res_rule 10
	[
	(asm_rule ⌜⌝),
	]
	[];

=TEX
\section{DERIVED RESOLUTION TOOLS}
=SML
local
	val thm = tac_proof(([],⌜∀ a ⦁ a ⇔ (¬ a ⇒ a)⌝),
		REPEAT strip_tac);
in
val rec ⦏all_¬_∃_conv⦎ = (fn tm =>
	(¬_∃_conv THEN_TRY_C
	SIMPLE_BINDER_C all_¬_∃_conv) tm
);

val ⦏contr_tac1⦎ : TACTIC = (
	conv_tac(fn a => simple_∀_elim a thm)
	THEN
	⇒_T (strip_asm_tac o conv_rule (TRY_C all_¬_∃_conv))
);

fun ⦏CONTR_T1⦎ (thmtac: THM -> TACTIC): TACTIC = (
	conv_tac(fn a => simple_∀_elim a thm)
	THEN
	⇒_T thmtac
);
end;
=SML
fun ⦏BASIC_RESOLUTION_T⦎ (limit:int) (thml:THM list) (thmtac1: THM -> TACTIC)
	(thmtac2: THM -> TACTIC) : TACTIC = (fn (seqasms,gl) =>
let	val (sgs,prf) = CONTR_T1 thmtac1 (seqasms,gl);
	val lasms = length seqasms;
	fun	aux (seqasms',gl') = (
	let	val lasms' = length seqasms';
		val new_asms = seqasms' to (lasms' - (1 + lasms));
		val new_asm_thms = map asm_rule new_asms;
		val old_asm_thms = map asm_rule seqasms;
		val res_thms = basic_res_rule limit
			new_asm_thms
			(thml @ old_asm_thms);
		val res_thms' = thm_diff res_thms (thml @ new_asm_thms @ old_asm_thms);
	in
		if is_nil res_thms'
		then fail "BASIC_RESOLUTION_T" 67004 []
		else if any res_thms (fn thm => is_f(concl thm))
		then f_thm_tac (find res_thms (fn thm => is_f(concl thm))) (seqasms',gl')
		else
		(MAP_EVERY thmtac2 res_thms') (seqasms',gl')
	end);
	val sgs2pfs2 = map aux sgs;
in
	(flat (map fst sgs2pfs2),
	prf o map_shape (map (fn (sgs, pf) => (pf, length sgs))sgs2pfs2))
end
handle complaint =>
pass_on complaint "basic_res_rule" "BASIC_RESOLUTION_T");
=TEX
=SML
fun ⦏basic_res_tac⦎ (limit:int) (thml:THM list) : TACTIC = (fn (asms_gl) =>
	BASIC_RESOLUTION_T limit thml (strip_asm_tac o conv_rule
		(TRY_C all_¬_∃_conv))
 	strip_asm_tac
	asms_gl
	handle complaint =>
	pass_on complaint "BASIC_RESOLUTION_T" "basic_res_tac"
);
=TEX
=SML
fun ⦏basic_res_tac2⦎ (limit:int) (thml:THM list) : TACTIC = (
	fn (asms_gl) =>
	BASIC_RESOLUTION_T limit thml (strip_asm_tac o conv_rule
		(TRY_C all_¬_∃_conv))
	(fn _ => fail_with_tac "basic_res_tac2" 67014 [])
	asms_gl
	handle complaint =>
	pass_on complaint "BASIC_RESOLUTION_T" "basic_res_tac2"
);
=TEX
=SML
fun ⦏BASIC_RESOLUTION_T1⦎ (limit:int) (thml:THM list)
	(thmtac: THM -> TACTIC) : TACTIC = (
	fn asms_gl =>
	GET_ASMS_T (fn thms =>
	let val res_thms = basic_res_rule limit thms thml;
		val res_thms' = thm_diff res_thms (thml @ thms);

	in
		if is_nil res_thms'
		then fail "BASIC_RESOLUTION_T1" 67004 []
		else if any res_thms (fn thm => is_f(concl thm))
		then f_thm_tac (find res_thms (fn thm => is_f(concl thm)))
		else MAP_EVERY thmtac res_thms'
	end)
	asms_gl
	handle complaint =>
	pass_on complaint "basic_res_rule" "BASIC_RESOLUTION_T1"
);

=TEX
=SML
fun ⦏basic_res_tac1⦎ (limit:int) (thml:THM list) : TACTIC = (fn asms_gl =>
	BASIC_RESOLUTION_T1 limit thml strip_asm_tac asms_gl
	handle complaint =>
	pass_on complaint "BASIC_RESOLUTION_T1" "basic_res_tac1"
);
=TEX
=SML
fun ⦏basic_res_tac3⦎ (limit:int) (thml:THM list) : TACTIC = (fn asms_gl =>
	BASIC_RESOLUTION_T1 limit thml
	(fn _ => fail_with_tac "basic_res_tac3" 67014[])
	asms_gl
	handle complaint =>
	pass_on complaint "BASIC_RESOLUTION_T1" "basic_res_tac3"
);
=TEX
=SML
fun ⦏basic_res_tac4⦎ (limit:int) (sos:int list)
	(rest:int list) (sos_thms: THM list) (rest_thms: THM list) = (
	LIST_GET_NTH_ASM_T sos (fn sos_asms =>
	LIST_GET_NTH_ASM_T rest (fn rest_asms =>
	let val res_thms = basic_res_rule limit (sos_asms @ sos_thms) (rest_asms @ rest_thms);
		val res_thms' = thm_diff res_thms (sos_asms @ rest_asms @ rest_thms);
	in
		if is_nil res_thms'
		then fail "basic_res_tac4" 67004 []
		else if any res_thms (fn thm => is_f(concl thm))
		then f_thm_tac (find res_thms (fn thm => is_f(concl thm)))
		else MAP_EVERY strip_asm_tac res_thms'
	end))
	handle complaint =>
	pass_on complaint "LIST_GET_NTH_ASM_T" "basic_res_tac4"
	handle complaint =>
	pass_on complaint "basic_res_rule" "basic_res_tac4"
);
=TEX

\section{EPILOGUE}
=SML
val _ = open_theory lthy;
val _ = pop_pc();
end; (* of structure Resolution *)
=TEX
Structure is not currently opened, as it is unclear whether it should be
in the build.
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}

=IGN
fun basic_resolve_tac (subterm : TERM)
	(asm1 : TERM, subs1 : TERM list)

	(asm2: TERM, subs2 : TERM list) : TACTIC = (fn (seqasms,gl) =>
	LIST_GET_ASM_T [asm1,asm2]
		(fn lst =>
		let	val thm1 = list_simple_∀_elim subs1 (hd lst);
			val thm2 = list_simple_∀_elim subs2 (hd(tl lst));
			val thm3 = basic_resolve_rule subterm thm1 thm2;
			val cthm3 = concl thm3;
		in
			if (is_f cthm3) orelse (is_t cthm3)
				orelse (cthm3 term_mem seqasms)
			then strip_asm_tac thm3
			else asm_tac thm3
		end)
		(seqasms,gl)
);
=TEX
=IGN
push_goal([],⌜(∀ x y z ⦁ R x y ∧ R y z ⇒ R x z) ∧
 (∀ x y ⦁ R x y ⇒ R y x) ∧
 (∀ x ⦁ ∃ y ⦁ R x y) ⇒
 (∀ x ⦁ R x x)⌝);
 a(contr_tac);
a(list_spec_nth_asm_tac 3 [⌜x⌝,⌜x⌝]); (* useless *)

(* comparing 2 vs 3 suggests need preprocessing, or embedded
   skolemisation *)

push_goal([],⌜(∀ x y z ⦁ R x y ∧ R y z ⇒ R x z) ∧
 (∀ x y ⦁ R x y ⇒ R y x) ∧
 (∃ f ⦁ ∀ x :'a⦁ R x (f x:'a)) ⇒
 (∀ x ⦁ R x x)⌝);
 a(contr_tac);
a(list_spec_nth_asm_tac 3 [⌜x⌝,⌜x⌝]); (* useless *)
a(list_spec_asm_tac ⌜∀ x y⦁ R x y ⇒ R y x⌝ [⌜x'⌝,⌜f x'⌝]);
(* *** Goal "1" *** *)
a(spec_asm_tac ⌜∀ x⦁ R x (f x)⌝ ⌜x'⌝);


(* *** Goal "2" *** *)
a(spec_asm_tac ⌜∀ x⦁ R x (f x)⌝ ⌜x'⌝);
a(list_spec_asm_tac ⌜∀ x y⦁ R x y ⇒ R y x⌝ [⌜x''⌝,⌜x''⌝]);
(* *** Goal "2.1" *** *)
a(list_spec_asm_tac ⌜∀ x y z⦁ R x y ∧ R y z ⇒ R x z⌝ [⌜x⌝,⌜y''⌝,⌜x⌝]);

(* *** Goal "2.1.1" *** *)
a(list_spec_asm_tac ⌜∀ x y z⦁ R x y ∧ R y z ⇒ R x z⌝ [⌜x'''⌝,⌜y'''⌝,⌜f x'''⌝]);
(* *** Goal "2.1.1.1" *** *)
a(spec_asm_tac  ⌜∀ x⦁ R x (f x)⌝ ⌜x'''⌝);
a(list_spec_asm_tac ⌜∀ x y z⦁ R x y ∧ R y z ⇒ R x z⌝ [⌜x''''⌝,⌜x'''''⌝,⌜f x'''''⌝]);
(* *** Goal "2.1.1.1.1" *** *)
a(spec_asm_tac  ⌜∀ x⦁ R x (f x)⌝ ⌜x'''''⌝);


a(basic_resolve_tac ⌜⌝
	(⌜⌝,[])
	(⌜⌝,[]));

push_goal([],⌜(∀ x y z ⦁ R x y ∧ R y z ⇒ R x z) ∧
 (∀ x y ⦁ R x y ⇒ R y x) ∧
 (∃ f ⦁ ∀ x :'a⦁ R x (f x:'a)) ⇒
 (∀ x ⦁ R x x)⌝);
a(contr_tac);
a(basic_resolve_tac ⌜R x x⌝
	(⌜∀ x y⦁ R x y ⇒ R y x⌝,[⌜x⌝,⌜x⌝])
	(⌜¬ R x x⌝,[]));
a(basic_resolve_tac ⌜R x' (f x')⌝
	(⌜∀ x⦁ R x (f x)⌝,[⌜x'⌝])
	(⌜∀ x y⦁ R x y ⇒ R y x⌝,[⌜x'⌝,⌜f x'⌝]));
a(basic_resolve_tac ⌜R x' x'⌝
	(⌜∀ x y⦁ R x y ⇒ R y x⌝,[⌜x'⌝,⌜x'⌝])
	(⌜∀ x y⦁ R x y ⇒ R y x⌝,[⌜x'⌝,⌜x'⌝]));
a(basic_resolve_tac ⌜R x x⌝
	(⌜∀ x y z⦁ R x y ∧ R y z ⇒ R x z⌝,[⌜x⌝,⌜y⌝,⌜x⌝])
	(⌜¬ R x x⌝,[]));
a(basic_resolve_tac ⌜R x' (f x')⌝
	(⌜∀ x⦁ R x (f x)⌝,[⌜x'⌝])
	(⌜∀ x y z⦁ R x y ∧ R y z ⇒ R x z⌝,[⌜x'⌝,⌜f x'⌝,⌜z⌝]));
a(basic_resolve_tac ⌜R x' (f x')⌝
	(⌜∀ x⦁ R x (f x)⌝,[⌜x'⌝])
	(⌜∀ x y z⦁ R x y ∧ R y z ⇒ R x z⌝,[⌜z⌝,⌜x'⌝,⌜f x'⌝]));
a(basic_resolve_tac ⌜R y x'⌝
	(⌜∀ x y⦁ R x y ⇒ R y x⌝,[⌜x'⌝,⌜y⌝])
	(⌜∀ x y z⦁ R x y ∧ R y z ⇒ R x z⌝,[⌜y⌝,⌜x'⌝,⌜z⌝]));
	(* best to do all specialisation *)
a(basic_resolve_tac ⌜R y x'⌝
	(⌜∀ x y⦁ R x y ⇒ R y x⌝,[⌜x'⌝,⌜y⌝])
	(⌜∀ x y z⦁ R x y ∧ R y z ⇒ R x z⌝,[⌜z⌝,⌜y⌝,⌜x'⌝]));
a(basic_resolve_tac ⌜R x' z⌝
	(⌜∀ x y z⦁ R x y ∧ R y z ⇒ R x z⌝,[⌜x'⌝,⌜y⌝,⌜z⌝])
	(⌜∀ x y⦁ R x y ⇒ R y x⌝,[⌜z⌝,⌜x'⌝]));
a(basic_resolve_tac ⌜R x' y⌝
	(⌜∀ x y z⦁ R x y ∧ R y z ⇒ R x z⌝,[⌜x'⌝,⌜y⌝,⌜z⌝])
	(⌜∀ x y z⦁ R x y ∧ R y z ⇒ R x z⌝,[⌜x'⌝,⌜z⌝,⌜y⌝]));
a(basic_resolve_tac ⌜R y z⌝
	(⌜∀ x y z⦁ R x y ∧ R y z ⇒ R x z⌝,[⌜x'⌝,⌜y⌝,⌜z⌝])
	(⌜∀ x y z⦁ R x y ∧ R y z ⇒ R x z⌝,[⌜y⌝,⌜x'⌝,⌜z⌝]));
a(basic_resolve_tac ⌜R (f x') x'⌝
	(⌜∀ x'⦁ R (f x') x'⌝,[⌜x'⌝])
	(⌜∀ x y⦁ R x y ⇒ R y x⌝,[⌜f x'⌝, ⌜x'⌝]));
a(basic_resolve_tac ⌜R (f x') x'⌝
	(⌜∀ x'⦁ R (f x') x'⌝,[⌜x'⌝])
	(⌜∀ x y z⦁ R x y ∧ R y z ⇒ R x z⌝,[⌜f x'⌝,⌜x'⌝,⌜z⌝]));
a(basic_resolve_tac ⌜R (f x') x'⌝
	(⌜∀ x'⦁ R (f x') x'⌝,[⌜x'⌝])
	(⌜∀ x y z⦁ R x y ∧ R y z ⇒ R x z⌝,[⌜z⌝,⌜f x'⌝,⌜x'⌝]));
a(basic_resolve_tac ⌜R x (f x)⌝
	(⌜∀ x⦁ R x (f x)⌝,[⌜x⌝])
	(⌜∀ y⦁ ¬ (R x y ∧ R y x)⌝,[⌜f x⌝]));
a(basic_resolve_tac ⌜R x y⌝
	(⌜∀ x y⦁ R x y ⇒ R y x⌝,[⌜y⌝,⌜x⌝])
	(⌜∀ y⦁ ¬ (R x y ∧ R y x)⌝,[⌜y⌝]));
a(basic_resolve_tac ⌜R x y⌝
	(⌜∀ x y z⦁ R x y ∧ R y z ⇒ R x z⌝,[⌜x⌝,⌜z⌝,⌜y⌝])
	(⌜∀ y⦁ ¬ (R x y ∧ R y x)⌝,[⌜y⌝]));
a(basic_resolve_tac ⌜R y x⌝
	(⌜∀ x y z⦁ R x y ∧ R y z ⇒ R x z⌝,[⌜y⌝,⌜z⌝,⌜x⌝])
	(⌜∀ y⦁ ¬ (R x y ∧ R y x)⌝,[⌜y⌝]));

a(basic_resolve_tac ⌜R (f x) x⌝
	(⌜∀ x'⦁ R (f x') x'⌝,[⌜x⌝])
	(⌜∀ y⦁ ¬ (R x y ∧ R y x)⌝,[⌜f x⌝]));
a(basic_resolve_tac ⌜R x x⌝
	(⌜∀ x' z⦁ R (f x') z ⇒ R x' z⌝,[⌜x⌝,⌜x⌝])
	(⌜¬ R x x⌝,[]));
a(basic_resolve_tac ⌜R(f x') (f(f x'))⌝
	(⌜∀ x⦁ R x (f x)⌝,[⌜f x'⌝])
	(⌜∀ x' z⦁ R (f x') z ⇒ R x' z⌝,[⌜x'⌝,⌜f(f x')⌝]));
a(basic_resolve_tac ⌜R(f x') z⌝
	(⌜∀ x y⦁ R x y ⇒ R y x⌝,[⌜z⌝,⌜f x'⌝])
	(⌜∀ x' z⦁ R (f x') z ⇒ R x' z⌝,[⌜x'⌝,⌜z⌝]));
a(basic_resolve_tac ⌜R x' z⌝
	(⌜∀ x' z⦁ R (f x') z ⇒ R x' z⌝,[⌜x'⌝,⌜z⌝])
	(⌜∀ x y⦁ R x y ⇒ R y x⌝,[⌜x'⌝,⌜z⌝]));
a(basic_resolve_tac ⌜R(f x') z⌝
	(⌜∀ x y z⦁ R x y ∧ R y z ⇒ R x z⌝,[⌜f x'⌝,⌜y⌝,⌜z⌝])
	(⌜∀ x' z⦁ R (f x') z ⇒ R x' z⌝,[⌜x'⌝,⌜z⌝]));
a(basic_resolve_tac ⌜R (f x') x'⌝
	(⌜∀ x'⦁ R (f x') x'⌝,[⌜x'⌝])
	(⌜∀ x' z⦁ R (f x') z ⇒ R x' z⌝,[⌜x'⌝,⌜x'⌝]));
a(basic_resolve_tac ⌜R x y⌝
	(⌜∀ x' z⦁ R (f x') z ⇒ R x' z⌝,[⌜x⌝,⌜y⌝])
	(⌜∀ y⦁ ¬ (R x y ∧ R y x)⌝,[⌜y⌝]));
a(basic_resolve_tac ⌜R y x⌝
	(⌜∀ x' z⦁ R (f x') z ⇒ R x' z⌝,[⌜y⌝,⌜x⌝])
	(⌜∀ y⦁ ¬ (R x y ∧ R y x)⌝,[⌜y⌝]));
a(basic_resolve_tac ⌜R x' (f x')⌝
	(⌜∀ x⦁ R x (f x)⌝,[⌜x'⌝])
	(⌜∀ z x'⦁ R z x' ⇒ R z (f x')⌝,[⌜x'⌝,⌜f x'⌝]));
a(basic_resolve_tac ⌜R y x'⌝
	(⌜∀ x y⦁ R x y ⇒ R y x⌝,[⌜x'⌝,⌜y⌝])
	(⌜∀ z x'⦁ R z x' ⇒ R z (f x')⌝,[⌜y⌝,⌜x'⌝]));
a(basic_resolve_tac ⌜R z (f x')⌝
	(⌜∀ z x'⦁ R z x' ⇒ R z (f x')⌝,[⌜z⌝,⌜x'⌝])
	(⌜∀ x y⦁ R x y ⇒ R y x⌝,[⌜z⌝,⌜(f x')⌝]));

etc until

a(basic_resolve_tac ⌜R (f x) x⌝
	(⌜∀ x'⦁ R (f x') x'⌝,[⌜x⌝])
	(⌜¬ R (f x) x⌝,[]));
pop_thm();

(* set of support just being  ⌜¬ R x x⌝ *)
push_goal([],⌜(∀ x y z ⦁ R x y ∧ R y z ⇒ R x z) ∧
 (∀ x y ⦁ R x y ⇒ R y x) ∧
 (∃ f ⦁ ∀ x :'a⦁ R x (f x:'a)) ⇒
 (∀ x ⦁ R x x)⌝);
a(contr_tac);
a(basic_resolve_tac ⌜R x x⌝
	(⌜∀ x y⦁ R x y ⇒ R y x⌝,[⌜x⌝,⌜x⌝])
	(⌜¬ R x x⌝,[]));
a(basic_resolve_tac ⌜R x x⌝
	(⌜∀ x y z⦁ R x y ∧ R y z ⇒ R x z⌝,[⌜x⌝,⌜y⌝,⌜x⌝])
	(⌜¬ R x x⌝,[]));
a(basic_resolve_tac ⌜R x (f x)⌝
	(⌜∀ x⦁ R x (f x)⌝,[⌜x⌝])
	(⌜∀ y⦁ ¬ (R x y ∧ R y x)⌝,[⌜f x⌝]));

a(basic_resolve_tac ⌜R x y⌝
	(⌜∀ x y⦁ R x y ⇒ R y x⌝,[⌜y⌝,⌜x⌝])
	(⌜∀ y⦁ ¬ (R x y ∧ R y x)⌝,[⌜y⌝]));
a(basic_resolve_tac ⌜R x y⌝
	(⌜∀ x y z⦁ R x y ∧ R y z ⇒ R x z⌝,[⌜x⌝,⌜z⌝,⌜y⌝])
	(⌜∀ y⦁ ¬ (R x y ∧ R y x)⌝,[⌜y⌝]));
a(basic_resolve_tac ⌜R y x⌝
	(⌜∀ x y z⦁ R x y ∧ R y z ⇒ R x z⌝,[⌜y⌝,⌜z⌝,⌜x⌝])
	(⌜∀ y⦁ ¬ (R x y ∧ R y x)⌝,[⌜y⌝]));
a(basic_resolve_tac ⌜R (f x) x⌝
	(⌜∀ x y⦁ R x y ⇒ R y x⌝,[⌜x⌝,⌜f x⌝])
	(⌜¬ R (f x) x⌝,[]));
a(basic_resolve_tac ⌜R (f x) x⌝
	(⌜∀ x y z⦁ R x y ∧ R y z ⇒ R x z⌝,[⌜f x⌝,⌜y⌝,⌜x⌝])
	(⌜¬ R (f x) x⌝,[]));
a(basic_resolve_tac ⌜R y x⌝
	(⌜∀ x y⦁ R x y ⇒ R y x⌝,[⌜x⌝,⌜y⌝])
	(⌜∀ y⦁ ¬ R y x⌝,[⌜y⌝]));
a(basic_resolve_tac ⌜R y x⌝
	(⌜∀ x y z⦁ R x y ∧ R y z ⇒ R x z⌝,[⌜y⌝,⌜z⌝,⌜x⌝])
	(⌜∀ y⦁ ¬ R y x⌝,[⌜y⌝]));
a(basic_resolve_tac ⌜R x (f x)⌝
	(⌜∀ x⦁ R x (f x)⌝,[⌜x⌝])
	(⌜∀ z y⦁ ¬ (R x z ∧ R z y) ∨ ¬ R y x⌝,[⌜f x⌝,⌜y⌝]));
a(basic_resolve_tac ⌜R z (f z)⌝
	(⌜∀ x⦁ R x (f x)⌝,[⌜z⌝])
	(⌜∀ z y⦁ ¬ (R x z ∧ R z y) ∨ ¬ R y x⌝,[⌜z⌝,⌜f z⌝]));
a(basic_resolve_tac ⌜R x z⌝
	(⌜∀ x y⦁ R x y ⇒ R y x⌝,[⌜z⌝,⌜x⌝])
	(⌜∀ z y⦁ ¬ (R x z ∧ R z y) ∨ ¬ R y x⌝,[⌜z⌝,⌜y⌝]));
a(basic_resolve_tac ⌜R z y⌝
	(⌜∀ x y⦁ R x y ⇒ R y x⌝,[⌜z⌝,⌜y⌝])
	(⌜∀ z y⦁ ¬ (R x z ∧ R z y) ∨ ¬ R y x⌝,[⌜z⌝,⌜y⌝]));
a(basic_resolve_tac ⌜R y x⌝
	(⌜∀ x y⦁ R x y ⇒ R y x⌝,[⌜y⌝,⌜x⌝])
	(⌜∀ z y⦁ ¬ (R x z ∧ R z y) ∨ ¬ R y x⌝,[⌜z⌝,⌜y⌝]));



a(basic_resolve_tac ⌜⌝
	(⌜⌝,[])
	(⌜⌝,[]));
a(basic_resolve_tac ⌜⌝
	(⌜⌝,[])
	(⌜⌝,[]));






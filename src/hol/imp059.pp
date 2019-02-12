=IGN
********************************************************************************
imp059.doc: this file is part of the PPHol system

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

\def\Title{Implementation of Product Types}

\def\AbstractText{This document contains the implementation of the tools for introducing HOL product types.}

\def\Reference{DS/FMU/IED/IMP059}

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
%% LaTeX2e port: \TPPtitle{Implementation of Product Types}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP059}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.40 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2005/12/16 09:59:36 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.Blackburn & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document contains the implementation
%% LaTeX2e port: of the tools for introducing HOL product types.}
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
\item [Issue 1.1 (1991/12/20)]
First version.
\item [Issues 1.2 (1992/01/07),1.3 (1992/01/14)]
Try based on cacheing implications.
\item [Issue 1.4 (1992/01/15)]
Split cacheing into two.

\item[Issue 1.5 (1992/01/20), \FormatDate{92/01/20} ] Updated to use new fonts.
\item[Issue 1.6 (1992/01/27) (23rd January 1992)]
$new\_axiom$, $simple\_new\_type\_defn$, $new\-\_type\-\_defn$
all changed to take lists of keys, rather than single ones.
\item[Issue 1.7 (1992/02/07) (7th February 1992)]
Changed working theory.

\item[Issue 1.10 (1992/02/12) (12 February 1992)]
Added the function $HOL\_lab\_prod\_recogniser$.
\item[Issue 1.11 (1992/02/13),1.12 (1992/02/27) (12 February 1992)]
Stopped using message 59012/3, minor corrections.
\item[Issue 1.12 (1992/02/27) (28th February 1992)]
Minor correction.
\item [Issue 1.13 (1992/03/26) (26th March 1992)]
Changed to use proof context material of issue 1.13 of \cite{DS/FMU/IED/DTD051}.
\item [Issue 1.14 (1992/04/09) (3rd April 1992)]
Changes required by CR0016.
\item [Issue 1.15 (1992/04/14) (13th April 1992)]
Changes due to CR0017.
\item [Issue 1.16 (1992/04/15) (15th April 1992)]
Changed names in
=INLINEFT
∃_λ_x_t_thm
=TEX
\item [Issue 1.17 (1992/05/14) (14th May 1992)]
Tidying up proof contexts.
\item [Issue 1.18 (1992/05/20),1.19 (1992/05/21) (20th May 1992)]
Improved checks of theory caching,
changed $∧$ structure in results.
\item [Issue 1.20 (1992/05/22) (22nd May 1992)]
Bug fixing.
\item [Issue 1.21 (1992/05/26) (26th May 1992)]
Renamings from version 1.5 of DS/FMU/IED/WRK038.
\item[Issue 1.22 (1992/06/24) (24th June 1992)]
Renamings from issue 1.6 of \cite{DS/FMU/IED/WRK038},
mostly proof context name changes.
\item [Issue 1.23 (1992/07/07) (6th July 1992)]
Added error 59018.
\item [Issue 1.25 (1992/08/04) (4th August 1992)]
Bug fix.
\item [Issue 1.26 (1992/08/13) (13th August 1992)]
Corrected error handling for interrupts.
\item [Issue 1.27 (1992/11/20),1.28 (1992/11/20) (20th November 1992)]
Make cache mechanisms more robust.
\item [Issue 1.29 (1992/12/18) (18th December 1992)]
Added $get\_valid\_cache\_theories$.
\item [Issue 1.30 (1993/08/17) (17th August 1993)]
Now need to turn off type compactification.
\item [Issue 1.31 (1993/09/08) (8th September 1993)]
Fixed bug 134.
\item [Issue 1.32 (1997/06/12) (12th June 1997)]
Another attempt to speed $cached\_labelled\_product\_rule$.
\item [Issue 1.33 (1999/02/12)]
Update for SML'97 port.
\item[Issue 1.36 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.37 (2002/10/17)] PPHol-specific updates for open source release
\item[Issues 1.38 (2005/12/14), 1.39 (2005/12/16)] Allowed for kernel interface and symbol table reform.
\item[Issue 1.40 (2005/12/16)] {\em force\_get\_cache\_theory} now creates a new cache theory rather than using the current theory if existing cache theories are all unusable.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
Anyone doing any extra work on this code should seriously consider
reorganising it to separate the proof stuff from the manipulation of
cache theories. As things are some local functions appear in two places
in virtually identical guises and as things get changed its slowly wearing
out.
\pagebreak
\section{GENERAL}
\subsection{Scope}
Tools introducing HOL product types are called for in \cite{DS/FMU/IED/HLD010}.
A design for such tools is given in \cite{DS/FMU/IED/DTD059}.
This document provides an implementations for them.
\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains an implementation for the
tools introducing HOL product types.

$labelled\_product\_spec$ and $unlabelled\-\_product\-\_spec$
are implemented in terms of the subsidiary functions $cached\-\_(un)labelled\-\_product\-\_rule$,
and, should they require a new invocation of those function,
will take longer.
With the current implementation (January 1992) the timings for proving labelled and unlabelled cacheing theorems assuming that the $n - 1^{th}$ theorem is cached, and
labelled and unlabelled product types assuming the required cached theories are present,
are as follows:

\begin{tabular} {l | l l l l l l l l l l l}
n = & 2 & 3 & 4 & 5 & 6 & 7 & 8 & 9 & 10 & 11 & 12 \\ \hline
lab. cache & 1.1 & 1.1 & 1.9 & 2.5 & 3.3 & 4.8 & 6.7 & 9.4 & 12.3 & 16.4 & 21.3 \\
unlab. cache & 0.8 & 1.0 & 1.5 & 2.0 & 2.1 & 2.8 & 4.0 & 4.8 & 6.0 & 7.4 &  9.3 \\
lab. & 0.4  & 0.9 & 1.1 & 1.5 & 2.3 & 3.3 & 4.3 & 5.8 & 7.3 & 9.5 & 12.1 \\
unlab. & 0.4 & 0.6 & 1.1 & 1.5 & 1.9 & 2.9 & 3.8 & 4.6 & 6.2 & 7.4 & 9.3 \\
\end{tabular}

\subsubsection{Dependencies}
This document takes its signature from \cite{DS/FMU/IED/DTD059}.
\subsubsection{Deficiencies}
In particular circumstances a function might add material into theories
but not complete the requested additions, leving an untidy state.
This would be particularly unfortunate in a cache theory,
where the partial effort cannot be deleted.
Some effort is made to prevent this, but it is not completely secured.
\subsubsection{Possible Enhancements}
None known.

\section{PREAMBLE}
=SML
structure ⦏ProductTypes⦎ : ProductTypes = struct
=TEX
We need to work in some cache theory, probably set aside for that purpose alone.
=SML
val lthy = get_current_theory_name ();
val _ = open_theory "basic_hol";
val _ = push_merge_pcs ["'propositions","'paired_abstractions"];
=TEX
\section{UTILITIES}
We want to do the theory updates with type compactification turned off:

=SML
fun ⦏no_compact⦎ (f : 'a -> 'b) (x : 'a) : 'b = (
	let	val oldmask = set_int_control("compactification_mask", 63);
	in let	val ans = f x;
	in	set_int_control("compactification_mask", oldmask);
		ans
	end	handle ex => (
			set_int_control("compactification_mask", oldmask);
			raise ex
		)
	end
);
=TEX
Some type variables:
=SML
val ⦏tva⦎ = ⓣ'a⌝;
val ⦏tvb⦎ = ⓣ'b⌝;
val ⦏tvc⦎ = ⓣ'c⌝;
val ⦏tv1⦎ = ⓣ'1⌝;
val ⦏tv2⦎ = ⓣ'2⌝;
=TEX
Create $:(...((ty1 × ty2) × ty3) ...)$:
=SML
fun ⦏rlist_mk_×_type⦎ tys = (
let	fun aux [ty] = ty
	| aux (ty :: rest) = mk_×_type(aux rest,ty)
	| aux _ = fail "rlist_mk_×_type" 0 [];
in
	aux (rev tys)
end);
=TEX
Create $(...((c1\ ∧\ c2)\ ∧\ c3)...)$:
=SML
fun ⦏rlist_mk_∧⦎ cnjs = (
let	fun aux [cnj] = cnj
	| aux (cnj :: rest) = mk_∧(aux rest,cnj)
	| aux _ = fail "rlist_mk_∧" 0 [];
in
	aux (rev cnjs)
end);
=TEX

\subsection{Timing}
These facilities are not exported at the user interface to this document;
nor are they used in this document. They have therefore been removed
as part of the port to SML'97.

The following value allows timing to be invoked as on one off
(false invokes timing).
A reference variable is inappropriate.
These functions are not currently used in the document,
but would become useful if further tuning is required.
=IGN
val ⦏notiming⦎ = true;
=TEX
Time the application of a tactic to a goal, and its resulting proof to its
arguments.
=IGN
fun ⦏TIME_T⦎ (name:string) (tac : TACTIC) : TACTIC = (
	if notiming
	then tac
	else (fn (asms_gl) =>
let	val t1 = System.processtime ();
	val (sgs,prf) = tac asms_gl;
	val sideeffect = diag_string("Tactic setting for "^
		name^" took:"^
		string_of_int(System.processtime ()-t1));
in
	(sgs,(fn x =>
	let	val t2 = System.processtime ();
		val res = prf x;
		val sideeffect = diag_string("Tactic proof for "^
			name^" took:"^
			string_of_int(System.processtime ()-t2));
	in
		res
	end))
end));
=TEX
Time the application of a rule to a theorem.
=IGN
fun ⦏time_rule⦎ (name:string) (rule : THM -> THM) : THM -> THM = (
	if notiming
	then rule
	else (fn (thm : THM) =>
let	val t1 = System.processtime ();
	val s1 = rule thm;
	val sideeffect = diag_string("Rule "^
			name^" took:"^
			string_of_int(System.processtime ()-t1));
in
	s1
end));
=TEX
Time the application of a theorem tactical:
=IGN
fun ⦏TIME_TTCL⦎ (name:string) ttcl (ttac:THM -> TACTIC)(thm : THM) : TACTIC = (
	if notiming
	then ttcl ttac thm
	else
	(fn (asms_gl) =>
let	val t1 = System.processtime ();
	val (sgs,prf) = ttcl ttac thm asms_gl;
	val sideeffect = diag_string("Ttcl setting for "^
		name^" took:"^
		string_of_int(System.processtime ()-t1));
in
	(sgs,(fn x =>
	let	val t2 = System.processtime ();
		val res = prf x;
		val sideeffect = diag_string("Ttcl proof for "^
			name^" took:"^
			string_of_int(System.processtime ()-t2));
	in
		res
	end))
end));
=TEX

\subsection{Conversionals}
Distribute two always successful conversions over a conjunction:
=SML
fun ⦏∧_C2⦎ conv1 conv2 tm = (
let	val (cnjt1,t2) = dest_app tm;
	val (cnj,t1) = dest_app cnjt1;
in
	mk_app_rule(app_fun_rule cnj (conv1 t1))(conv2 t2)
end);
=TEX
Apply a conversion to the leftmost conjunction.
=SML
fun ⦏LEFTMOST_∧_C⦎ conv : CONV = (fn tm =>
	if is_∧ tm
	then RATOR_C(RAND_C(LEFTMOST_∧_C conv)) tm
	else conv tm
);
=TEX
Apply a conversion to all conjuncts nested by $((...(c1 ∧ c2) ∧ c3 ...)$.
=SML
fun ⦏LALL_∧_C⦎ conv : CONV = (fn tm =>
	if is_∧ tm
	then APP_C ((RAND_C(LALL_∧_C conv)), conv) tm
	else conv tm
);
=TEX
\subsection{Rules}
A limited form of matching $type\_lemmas\_thm$:
=FRULE 1 Rule
simple_match_type_lemmas_thm
├
⊢ ∃ f: ty1 → ty2 ⦁ TypeDefn (λ x ⦁ T) f
├
⊢ ∃ abs rep⦁ (∀ a:ty1⦁ abs (rep a) = a) ∧
	(∀ r:ty2⦁ rep (abs r) = r)
=TEX
=SML
local
	val s1 = simple_∀_elim ⌜(λ x:'b ⦁ T)⌝
		type_lemmas_thm;
	val s2 = rewrite_rule [] s1;
	val atype = ⓣ'a → 'b⌝;
in
fun ⦏simple_match_type_lemmas_thm⦎ (thm : THM) : THM = (
let	val (f,_) = dest_simple_∃(concl thm);
	val (ty1,ty2) = dest_→_type (type_of f);
	val tyinsts = [(ty1,tva),(ty2,tvb)];
in
	⇒_elim (inst_type_rule tyinsts s2) thm
end
handle complaint =>
reraise complaint "simple_match_type_lemmas_thm");
end;
=TEX
\subsection{Theorems}
=SML
val ⦏pair_eq_thm⦎ = tac_proof(([],
	⌜∀ x y p q⦁ ((x,y) = (p,q)) ⇔ ((x = p) ∧ (y = q))⌝),
		rewrite_tac[pair_clauses]);
=TEX
=SML
val ⦏∃_λ_x_t_thm⦎ = tac_proof(([],⌜∃ f:'a ⦁ (λ x ⦁ T) f⌝),
	rewrite_tac[]);
=TEX
The rule is a bit crude given that we know in more detail the
form of the theorem being rewritten.
=SML
val ⦏∧_assoc_thm⦎ = taut_rule ⌜∀ a b c ⦁ ((a ∧ b) ∧ c) ⇔ (a ∧ b ∧ c)⌝;
val ⦏rw_∧_assoc_thm_rule⦎ = pure_rewrite_rule [∧_assoc_thm];
fun ⦏try_rule⦎ (rule : THM -> THM) (thm : THM) = (
	rule thm
	handle Fail _ => thm
);
=TEX
Each theorem in the below is associated with a ``matching''
conversion.
=SML
val ⦏lpair_∀_thm⦎ = (
	push_goal([],⌜∀ f ⦁ (∀ p : '1 × '2 ⦁ f p)
		⇔
		(∀ p1 p2 ⦁ f (p1,p2))⌝);
	a(REPEAT strip_tac);
	(* *** Goal "1" *** *)
	a(asm_rewrite_tac[]);
	(* *** Goal "2" *** *)
	a(LEMMA_T ⌜p = (Fst p,Snd p)⌝ once_rewrite_thm_tac);
	(* *** Goal "2.1" *** *)
	a(rewrite_tac[pair_clauses]);
	(* *** Goal "2.2" *** *)
	a(asm_rewrite_tac[]);
	rewrite_rule[η_axiom](pop_thm()));
=TEX
=FRULE 1 Conversion
lpair_∀_conv
⌜∀ p : '1 × '2 ⦁ f[p]⌝
├
├
⊢ (∀ p : '1 × '2 ⦁ f[p]) ⇔
	(∀ p1 p2 ⦁ f [(p1, p2)])
=TEX
=SML
local
	val atype = ⓣ'1 × '2⌝;
in
fun ⦏lpair_∀_conv⦎ tm = (
let	val (_,abs) = dest_app tm;
	val ptype = fst(dest_→_type(type_of abs));
	val tyinsts = type_match ptype atype;
	val s1 = simple_∀_elim abs
		(inst_type_rule tyinsts lpair_∀_thm);
	val s2 = conv_rule(RAND_C(SIMPLE_BINDER_C
		(SIMPLE_BINDER_C simple_β_conv))) s1;
in
	s2
end
handle complaint =>
reraise complaint "lpair_∀_conv");
end; (* of local *)
=TEX
=SML
val lpair_∃_thm = (
	push_goal([],⌜∀ f ⦁ (∃ p : '1 × '2 ⦁ f p)
		⇔
		(∃ p1 p2 ⦁ f (p1,p2))⌝);
	a(REPEAT strip_tac);
	(* *** Goal "1" *** *)
	a(simple_∃_tac ⌜Fst p⌝ THEN simple_∃_tac ⌜Snd p⌝);
	a(pure_rewrite_tac[pair_clauses] THEN concl_in_asms_tac);
	(* *** Goal "2" *** *)
	a(simple_∃_tac ⌜(p1,p2)⌝ THEN concl_in_asms_tac);
	rewrite_rule[η_axiom](pop_thm()));
=TEX
=FRULE 1 Conversion
lpair_∃_conv
⌜∃ p : '1 × '2 ⦁ f[p]⌝
├
├
⊢ (∃ p : '1 × '2 ⦁ f[p]) ⇔
	(∃ p1 p2 ⦁ f [(p1, p2)])
=TEX
=SML
local
	val atype = ⓣ'1 × '2⌝;
in
fun ⦏lpair_∃_conv⦎ tm = (
let	val (_,abs) = dest_app tm;
	val ptype = fst(dest_→_type(type_of abs));
	val tyinsts = type_match ptype atype;
	val s1 = simple_∀_elim abs (inst_type_rule tyinsts lpair_∃_thm);
	val s2 = conv_rule(RAND_C(SIMPLE_BINDER_C
		(SIMPLE_BINDER_C simple_β_conv))) s1;
in
	s2
end
handle complaint =>
reraise complaint "lpair_∃_conv");
end; (* of local *)
=TEX
=SML
val lpair_∃_thm1 = (
	push_goal([],⌜∀ f ⦁ (∃ p : 'a → '1 × '2 ⦁ f p)
		⇔
		(∃ p1 p2 ⦁ f (λ x ⦁ (p1 x,p2 x)))⌝);
	a(REPEAT strip_tac);
	(* *** Goal "1" *** *)
	a(simple_∃_tac ⌜(λ x ⦁ Fst (p x))⌝ THEN
	  simple_∃_tac ⌜(λ x ⦁ Snd (p x))⌝);
	a(rewrite_tac[pair_clauses, η_axiom] THEN concl_in_asms_tac);
	(* *** Goal "2" *** *)
	a(simple_∃_tac ⌜(λ x⦁ (p1 x, p2 x))⌝ THEN concl_in_asms_tac);
	rewrite_rule[η_axiom](pop_thm()));
=TEX
=FRULE 1 Conversion
lpair_∃_conv1
⌜∃ p : 'a → '1 × '2 ⦁ f[p]⌝
├
├
⊢ (∃ p : 'a → '1 × '2 ⦁ f[p]) ⇔
	(∃ p1 p2⦁ f [(λ x ⦁ (p1 x, p2 x))])
=TEX
=SML
local
	val atype = ⓣ 'a → '1 × '2⌝;
in
fun ⦏lpair_∃_conv1⦎ tm = (
let	val (_,abs) = dest_app tm;
	val ptype = fst(dest_→_type(type_of abs));
	val tyinsts = type_match ptype atype;
	val s1 = simple_∀_elim abs
		(inst_type_rule tyinsts lpair_∃_thm1);
	val s2 = conv_rule(RAND_C(SIMPLE_BINDER_C
		(SIMPLE_BINDER_C simple_β_conv)))
		s1;
in
	s2
end
handle complaint =>
reraise complaint "lpair_∃_conv1");
end; (* of local *)
=TEX
=SML
val ⦏∃_pair_conv_thm⦎ = (
	push_goal([],⌜∀ f ⦁($∃ (f: (('1 × '2) → 'a) → BOOL)) ⇔
		(∃ con' ⦁ f (λ (x, y) ⦁  con' x y))⌝);
	a(once_rewrite_tac[eq_sym_rule
		(simple_∀_elim ⌜f:(('1 × '2) → 'a) → BOOL⌝
		(inst_type_rule [(ⓣ(('1 × '2) → 'a)⌝,ⓣ'a⌝),
			(ⓣBOOL⌝,ⓣ'b⌝)] η_axiom))]);
	a(rewrite_tac[]);
	a(REPEAT strip_tac);
	(* *** Goal "1" *** *)
	a(simple_∃_tac ⌜λ p q ⦁ x (p,q)⌝);
	a(rewrite_tac[η_axiom]);
	a(LEMMA_T ⌜(λ (x',q) ⦁ x(x',q)) = (λ y ⦁ x y)⌝
		(fn x => asm_rewrite_tac[x,η_axiom]));
	a (rewrite_tac[ext_thm, pair_clauses]);
	(* *** Goal "2" *** *)
	a(simple_∃_tac ⌜(λ (x, y)⦁ con' x y)⌝ THEN concl_in_asms_tac);
	pop_thm());
=TEX
=FRULE 1 Conversion
l∃_pair_conv
⌜∃ p : '1 × '2 → 'a ⦁ f[p]⌝
├
├
⊢ (∃ p : '1 × '2 → 'a ⦁ f[p]) ⇔
	(∃ p' ⦁ f [(λ(x,y) ⦁ p' x y)])
=TEX
=SML
local
	val atype = ⓣ'1 × '2 → 'a⌝;
in
fun ⦏l∃_pair_conv⦎ tm = (
let	val (_,abs) = dest_app tm;
	val ptype = fst(dest_→_type(type_of abs));
	val tyinsts = type_match ptype atype;
	val s1 = simple_∀_elim abs (inst_type_rule tyinsts ∃_pair_conv_thm);
	val s2 = conv_rule(RAND_C(SIMPLE_BINDER_C simple_β_conv)) s1;
in
	s2
end
handle complaint =>
reraise complaint "l∃_pair_conv");
end; (* of local *)
=TEX
=SML
local
	val uncurry_def = (get_defn "pair" "Uncurry");
in
val ⦏l_β_conv⦎ : CONV = (fn tm =>
let	val (p,q) = dest_app tm;
	val (uc,p') = dest_app p;
	val sideeffect = if fst(dest_const uc) <> "Uncurry"
		then fail "l_β_conv" 0 []
		else ();
	val (q1,q2) = dest_pair q;
	val tyinsts = [(type_of q1,tva),(type_of q2,tvb),
		(snd(dest_→_type(snd(dest_→_type(type_of p')))),tvc)];
	val s1 = inst_type_rule tyinsts uncurry_def;
	val s2 = list_simple_∀_elim[p',q1,q2] s1;
	val s3 = conv_rule(RAND_C((RATOR_C simple_β_conv) THEN_C
		simple_β_conv)) s2;
in
	s3
end);
end;
=TEX
\section{MAIN FUNCTIONS}
\subsection{Theory Caches}
We must have an initial cache theory to allow the special case
of $cached\_product\_rule$ $1$ to be saved.
We currently assume it is the current theory.
=SML
local
	val cache_theories: string list ref = ref [];
in
fun ⦏set_cache_theories⦎ (slst: string list) : string list = (
let	val old = (!cache_theories);
in
	(cache_theories := slst;
	old)
end);
fun ⦏get_cache_theories⦎ (():unit) : string list = (!cache_theories);
end;
=TEX
Now the derived cache theory functions:
=SML
local
	fun find_usable_cache_theories [] = []
	| find_usable_cache_theories (a :: x) = ((
	let	val {inscope = inscope, ...} = get_theory_info a;
	in
		if inscope
		then a :: find_usable_cache_theories x
		else find_usable_cache_theories x
	end)
	handle (Fail _) => find_usable_cache_theories x);
in	
fun ⦏get_valid_cache_theories⦎ () = (
	find_usable_cache_theories(get_cache_theories ())
);
end;
=TEX
=SML
local
	fun find_usable_cache_theory [] = Nil
	| find_usable_cache_theory (a :: x) = (
	let	val {status = status, inscope = inscope, ...} = get_theory_info a;
	in
		if status = TSNormal andalso inscope
		then (let val pt = pp'Kernel.pp'get_pervasive_theory_name();
			in
				if (pt = a) orelse not(a mem (get_ancestors pt))
				then Value a
				else find_usable_cache_theory x
			end)
		else find_usable_cache_theory x
	end	handle (Fail _) => find_usable_cache_theory x
	);

	fun make_new_cache_theory () = (
	let	val cur_thy = get_current_theory_name();
		val all_thys = get_theory_names();
		fun make_name i = (
			let	val n = "cache'" ^ string_of_int i;
			in	if	not(n mem all_thys)
				then	n
				else	make_name (i+1)
			end
		);
		val new_thy = make_name 0;
	in let	val par_thy = hd(get_cache_theories())
		handle Fail _ =>
		pp'Kernel.pp'get_pervasive_theory_name();
	in
		open_theory par_thy;
		new_theory new_thy;
		open_theory cur_thy;
		new_parent new_thy;
		set_cache_theories (new_thy :: get_cache_theories ());
		comment "force_get_cache_theory" 59020 [fn _ => new_thy];
		new_thy
	end	handle Fail _ => (
		open_theory cur_thy;
		delete_theory new_thy handle Fail _ => ();
		fail "force_get_cache_theory" 59008 [fn _ => cur_thy]
		)
	end
	);
	fun get_new_cache_theory [] = (
		make_new_cache_theory ()
	) | get_new_cache_theory (a :: x) = (
	let	val {status = status, inscope = inscope, ...} = get_theory_info a;
	in
		if status = TSNormal
		then (let val pt = pp'Kernel.pp'get_pervasive_theory_name();
			in
				if (pt = a) orelse not(a mem (get_ancestors pt))
				then (new_parent a; a)
				else get_new_cache_theory x
			end)
		else get_new_cache_theory x
	end	handle (Fail _) => get_new_cache_theory x
	);
in	
fun ⦏get_cache_theory⦎ () = (
	case find_usable_cache_theory(get_cache_theories ()) of
	Value a => a
	| _ => fail "get_cache_theory" 59002 [get_current_theory_name]
);

fun ⦏force_get_cache_theory⦎ () = (
	case find_usable_cache_theory(get_cache_theories ()) of
	Value a => a
	| _ => get_new_cache_theory(get_cache_theories ())
);
end;
=TEX
=SML
=TEX
\subsection{Defining n-tuples}
We will declare the method of getting the two keys
for saving cached theorems once for all.
=SML
fun ⦏clp_key⦎ (num:int):string = string_of_int num ^ "CachedLabelledProduct";
fun ⦏cup_key⦎ (num:int):string = string_of_int num ^ "CachedUnlabelledProduct";
=TEX
=SML
val ⦏cache_labelled_thm1⦎ = (
	push_goal([],
	⌜(∃ abs : '1 → 'a ⦁
	 ∃ rep : 'a → '1 ⦁
	 (∀ a⦁ abs(rep a) = a) ∧ (∀ r ⦁ rep(abs r) = r))
	⇒
	∃ 1Tuple:'1 → 'a ⦁
	(∃ Lab1_1⦁ ∀ t x1⦁ Lab1_1 (1Tuple x1) = x1 ∧ 1Tuple (Lab1_1 t) = t)⌝);
	a strip_tac;
	a(simple_∃_tac ⌜abs : '1 → 'a⌝);
	a(simple_∃_tac ⌜rep:'a → '1⌝ THEN asm_rewrite_tac[]);
	pop_thm());
=TEX
=SML
val ⦏cache_unlabelled_thm1⦎ = (
	push_goal([],
	⌜(∃ abs : '1 → 'a ⦁
	 ∃ rep : 'a → '1 ⦁
	 (∀ a⦁ abs(rep a) = a) ∧ (∀ r ⦁ rep(abs r) = r))
	⇒
	∃ 1Tuple:'1 → 'a ⦁
	(∀ x1 y1⦁ 1Tuple x1 = 1Tuple y1 ⇔ x1 = y1) ∧
		(∀ t⦁ ∃ x1⦁ t = 1Tuple x1)⌝);
	a strip_tac;
	a(simple_∃_tac ⌜abs : '1 → 'a⌝);
	a(REPEAT ∧_tac);
	a(REPEAT simple_∀_tac THEN ⇔_T2
		(fn thm => ante_tac(app_fun_rule ⌜rep:'a → '1⌝  thm) THEN
		asm_rewrite_tac[])
		(fn thm => pure_rewrite_tac[thm, eq_rewrite_thm]));
	a(simple_∀_tac THEN simple_∃_tac ⌜(rep:'a → '1) t⌝
		THEN asm_rewrite_tac[]);
	pop_thm());
=TEX
The following maximizes the sharing of the type variables.
=SML
fun ⦏clpr_aux⦎ (labstr : string) (in_n : int) = (
let fun aux (tyvars, xis, labs) (n : int) = (
	if (n <= 0)
	then (tyvars, xis, labs)
	else (let
		val inter = string_of_int n;
		val tyvar = mk_vartype("'"^ inter);
		val xi = mk_var("x"^inter,tyvar);
		val lab = mk_var(labstr^inter, mk_→_type(tva,tyvar));
	in
		aux ((tyvar :: tyvars), (xi :: xis), (lab :: labs))
			 (n-1)
	end)
	);
in
	aux ([],[],[]) in_n
end);
=TEX
A heavily used pair of variables:
=SML
val ⦏t_tva⦎ =	mk_var("t",tva);
val ⦏a_tva⦎ = mk_var("a",tva);
=TEX
The following finds pre-existing copies of the $cached\_product\_rule$
theorem, should they exist.
=SML
fun ⦏clpr_find_n_tuple⦎ (n:int):THM OPT = (
let	val key = clp_key n;
	fun aux [] = Nil
	| aux (thy :: rest) = (Value(get_thm thy key)
		handle (Fail _) => aux rest);
in
		aux (get_valid_cache_theories())
end);
=TEX
=SML
val ⦏l_pair_eq_thm_cnv⦎ = simple_eq_match_conv1 pair_eq_thm;
=TEX
Now we can define $cached\_labelled\_product\_rule$ itself.
=SML
fun ⦏cached_labelled_product_rule⦎ (arg: int) : THM = (
let
	val was_thy = get_current_theory_name();
=TEX
The following declares a new n-tuple type, given
the name of the cache theory knowing that the type isn't
in scope.
=SML
fun ⦏declare_n_tuple⦎ (cache_thy : string) (n:int) :THM = (
let	val sideeffect = if is_theory_ancestor cache_thy was_thy
		then ()
		else error "cached_labelled_product_rule" 59009
			[fn () => cache_thy];
	val last_thm = cached_labelled_product_rule (n-1);
in let
	val nstr = string_of_int n;
	val key = clp_key n;
	val labstr = "Lab"^nstr^"_";
	val (tyvars, xi, labs) = clpr_aux labstr n;
	val ntuple = mk_var(nstr^ "Tuple",list_mk_→_type (tyvars @ [tva]));
	val ntuple_args = list_mk_app(ntuple,xi);
	val succedent = mk_simple_∃(ntuple,
		list_mk_simple_∃(labs,
		list_mk_simple_∀((t_tva :: xi),
		rlist_mk_∧(
		map (fn (lab,x) =>
		mk_eq(mk_app(lab,ntuple_args),x))
		(combine labs xi)
		@ [mk_eq(
		list_mk_app(ntuple,
		map (fn lab => mk_app(lab,t_tva)) labs),
		t_tva)])))
			);
	val ntuple_type = rlist_mk_×_type tyvars;
	val abs = mk_var("abs",mk_→_type(ntuple_type,tva));
	val rep = mk_var("rep",mk_→_type(tva,ntuple_type));
	val rvar = mk_var("r",ntuple_type);
	val antecedent = (
		list_mk_simple_∃([abs,rep],
		mk_∧
		(mk_simple_∀(a_tva,
		mk_eq(mk_app(abs,mk_app(rep,a_tva)),a_tva)),
		mk_simple_∀(rvar,
		mk_eq(mk_app(rep,mk_app(abs,rvar)),rvar))))
	);
	val thm_concl = mk_⇒(antecedent, succedent);
=TEX
We now have the theorems conclusion, $thm\_concl$: now to prove it.
We do so by instantiating the $n-1^{th}$ theorem.
=SML
	val old_tyvars = rev(tl(rev tyvars));
	val tyinsts = ((mk_×_type(tv1,tv2),tv1) ::
		combine  (tl(tl tyvars)) (tl old_tyvars));
	fun do_in_cache () = (let
	val s1 = inst_type_rule tyinsts last_thm;
	val s2 = conv_rule (RAND_C(((SIMPLE_BINDER_C
		((ALL_SIMPLE_∃_C (SIMPLE_BINDER_C lpair_∀_conv))
			THEN_C lpair_∃_conv1
			THEN_C ALL_SIMPLE_∃_C
			(ALL_SIMPLE_∀_C
			(∧_C2
			(LEFTMOST_∧_C((RATOR_C(RAND_C simple_β_conv))
				THEN_C l_pair_eq_thm_cnv)
			)
			(ONCE_MAP_C simple_β_conv))
))
			)
		THEN_C l∃_pair_conv THEN_C ONCE_MAP_C l_β_conv)
		) THEN_C
		α_conv thm_concl) s1;
	val sideeffect = no_compact save_thm(key,s2)
		handle complaint =>
		pass_on complaint "save_thm" "cached_labelled_product_rule";
	in
		s2
	end);
in
	do_in_theory cache_thy do_in_cache ()
end
handle (complaint as (Fail _)) =>
(if area_of complaint = "cached_labelled_product_rule"
then reraise complaint "cached_labelled_product_rule"
else fail "cached_labelled_product_rule" 59003 [fn () => string_of_int n])
end
);
=TEX
Main function:
=SML
in
	if arg < 1
	then fail "cached_labelled_product_rule" 59001
		[fn () => string_of_int arg]
	else if arg = 1
	then (if is_theory_ancestor "basic_hol" was_thy
		then cache_labelled_thm1
		else fail "cached_labelled_product_rule" 59017 [get_current_theory_name])
	else (case (clpr_find_n_tuple arg) of
	Value thm => thm
	| Nil => let	val cache_thy = force_get_cache_theory()
			handle complaint =>
			pass_on complaint "force_get_cache_theory"
			"cached_labelled_product_rule";
		in	case (clpr_find_n_tuple arg) of
				Value thm => thm
			|	Nil => declare_n_tuple cache_thy arg
		end)

end); (* of cached_labelled_product_rule *)
=TEX
The following maximizes the sharing of the type variables.
=SML
fun ⦏cupr_aux⦎ (in_n : int) = (
let fun aux (tyvars, xis, yis) (n : int) = (
	if (n <= 0)
	then (tyvars, xis, yis)
	else (let
		val inter = string_of_int n;
		val tyvar = mk_vartype("'"^ inter);
		val xi = mk_var("x"^inter,tyvar);
		val yi = mk_var("y"^inter,tyvar);
	in
		aux ((tyvar :: tyvars), (xi :: xis), (yi :: yis))
			 (n-1)
	end)
	);
in
	aux ([],[],[]) in_n
end);
=TEX
The following finds pre-existing copies of the $cached\_product\_rule$
theorem, should they exist.
=SML
fun ⦏cupr_find_n_tuple⦎ (n:int):THM OPT = (
let	val key = cup_key n;
	fun aux [] = Nil
	| aux (thy :: rest) = (Value(get_thm thy key)
		handle (Fail _) => aux rest);
in
		aux (get_valid_cache_theories())
end);
=TEX

We define $cached\_unlabelled\_product\_rule$ in a similar manner.
=SML
fun ⦏cached_unlabelled_product_rule⦎ (arg: int) : THM = (
let
	val was_thy = get_current_theory_name();
=TEX
The following declares a new n-tuple type, given
the name of the cache theory knowing that the type isn't
in scope.
=SML
fun ⦏declare_n_tuple⦎ (cache_thy : string) (n:int) :THM = (
let	val sideeffect = if is_theory_ancestor cache_thy was_thy
		then ()
		else error "cached_unlabelled_product_rule" 59009
			[fn () => cache_thy];
	val last_thm = cached_unlabelled_product_rule (n-1);
in let
	val nstr = string_of_int n;
	val key = cup_key n;
	val (tyvars, xi, yi) = cupr_aux n;
	val ntuple = mk_var(nstr^ "Tuple",list_mk_→_type (tyvars @ [tva]));
	val ntuple_args = list_mk_app(ntuple,xi);
	val succedent = mk_simple_∃(ntuple,
		mk_∧(
		 (list_mk_simple_∀(xi @ yi,mk_⇔(
			mk_eq(ntuple_args,list_mk_app(ntuple,yi)),
			rlist_mk_∧(map (fn (x,y) => mk_eq(x,y)) (combine xi yi))))),
		 (mk_simple_∀(t_tva,
		 list_mk_simple_∃(xi,
			 mk_eq(t_tva,ntuple_args))))
		)
	);
	val ntuple_type = rlist_mk_×_type tyvars;
	val abs = mk_var("abs",mk_→_type(ntuple_type,tva));
	val rep = mk_var("rep",mk_→_type(tva,ntuple_type));
	val rvar = mk_var("r",ntuple_type);
	val antecedent = (
		list_mk_simple_∃([abs,rep],
		mk_∧
		(mk_simple_∀(a_tva,
		mk_eq(mk_app(abs,mk_app(rep,a_tva)),a_tva)),
		mk_simple_∀(rvar,
		mk_eq(mk_app(rep,mk_app(abs,rvar)),rvar))))
	);
	val thm_concl = mk_⇒(antecedent, succedent);
=TEX
We now have the theorems conclusion, $thm\_concl$: now to prove it.
We do so by instantiating the $n-1^{th}$ theorem.
=SML
	val old_tyvars = rev(tl(rev tyvars));
	val tyinsts = ((mk_×_type(tv1,tv2),tv1) ::
		combine  (tl(tl tyvars)) (tl old_tyvars));
	fun do_in_cache () = (
	let
	val s1 = inst_type_rule tyinsts last_thm;
	val s2 = conv_rule ((RAND_C((SIMPLE_BINDER_C
		(∧_C2 (lpair_∀_conv THEN_C
				ONCE_MAP_C lpair_∀_conv THEN_C
				ALL_SIMPLE_∀_C (RAND_C(LEFTMOST_∧_C
					(l_pair_eq_thm_cnv))))
				(SIMPLE_BINDER_C lpair_∃_conv))
		) THEN_C
		l∃_pair_conv THEN_C ONCE_MAP_C l_β_conv))
		THEN_C α_conv thm_concl)
		 s1;
	val sideeffect = no_compact save_thm(key,s2)
		handle complaint =>
		pass_on complaint "save_thm" "cached_unlabelled_product_rule";
	in
		s2
	end);
in
	do_in_theory cache_thy do_in_cache ()
end
handle (complaint as (Fail _)) =>
(if area_of complaint = "cached_unlabelled_product_rule"
then reraise complaint "cached_unlabelled_product_rule"
else fail "cached_unlabelled_product_rule" 59004 [fn () => string_of_int n])
end);
=TEX
Main function:
=SML
in
	if arg < 1
	then fail "cached_unlabelled_product_rule" 59001
		[fn () => string_of_int arg]
	else if arg = 1
	then (if is_theory_ancestor "basic_hol" was_thy
		then cache_unlabelled_thm1
		else fail "cached_unlabelled_product_rule" 59017 [get_current_theory_name])
	else (case (cupr_find_n_tuple arg) of
	Value thm => thm
	| Nil => let	val cache_thy = force_get_cache_theory()
			handle complaint =>
			pass_on complaint "force_get_cache_theory"
			"cached_unlabelled_product_rule";
		in	case (cupr_find_n_tuple arg) of
				Value thm => thm
			|	Nil => declare_n_tuple cache_thy arg
		end)

end); (* of cached_unlabelled_product_rule *)
=TEX
\subsection{Labelled Products}
=IGN
new_theory "first_cache_theory";
new_theory "temp";
new_parent "ℕ";

val inp2 = {tyname = "HOLD2",tykey = "HOLD2",conname = "Hold2",
	constkeys= ["Hold2","First2","Second2"],
	labels = [("First2",ℕ),("Second2",ⓣ'1⌝)],
	tyvars = Value[ⓣ'1⌝,ⓣ'2⌝]};
val inp3 = {tyname = "HOLD3",tykey = "HOLD3",conname = "Hold3",
	constkeys= ["Hold3","First3","Second3","Third3"],
	labels = [("First3",ℕ),("Second3",ⓣ'1⌝),("Third3",ⓣ'2⌝)],
	tyvars = Value[ⓣ'1⌝,ⓣ'2⌝]};
val inp4 = {tyname = "HOLD4",tykey = "HOLD4",conname = "Hold4",
	constkeys= ["Hold4","First","Second","Third","Fourth"],
	labels = [("First",ℕ),("Second",ⓣ'1⌝),("Third",ⓣ'2⌝),("Fourth",ⓣ'1 × '2⌝)],
	tyvars = Value[ⓣ'1⌝,ⓣ'2⌝]};

val inp5 = {tyname = "HOLD5",tykey = "HOLD5",conname = "Hold5",
	constkeys= ["Hold5","First5","Second5","Third5","Fourth5","Fifth5"],
	labels = [("First5",ℕ),("Second5",ⓣ'1⌝),("Third5",ⓣ'2⌝),
		("Fourth5",ⓣ'1 × '2⌝),("Fifth5",ⓣ'3⌝)],
	tyvars = Value[ⓣ'1⌝,ⓣ'2⌝,ⓣ'3⌝]};
val inp6 = {tyname = "HOLD6",tykey = "HOLD6",conname = "Hold6",
	constkeys= ["Hold6","First6","Second6","Third6","Fourth6",
		"Fifth6","Sixth6"],
	labels = [("First6",ℕ),("Second6",ⓣ'1⌝),("Third6",ⓣ'2⌝),
		("Fourth6",ⓣ'1 × '2⌝),("Fifth6",ⓣ'3⌝),("Sixth6",ⓣ'1⌝)],
	tyvars = Value[ⓣ'1⌝,ⓣ'2⌝,ⓣ'3⌝]};
val inp7 = {tyname = "HOLD7",tykey = "HOLD7",conname = "Hold7",
	constkeys= ["Hold7","First7","Second7","Third7","Fourth7",
		"Fifth7","Sixth7","Seventh"],
	labels = [("First7",ℕ),("Second7",ⓣ'1⌝),("Third7",ⓣ'2⌝),
		("Fourth7",ⓣ'1 × '2⌝),("Fifth7",ⓣ'3⌝),("Sixth7",ⓣ'1⌝),
	("Seventh7",ⓣ'1 × '3⌝)],
	tyvars = Value[ⓣ'1⌝,ⓣ'2⌝,ⓣ'3⌝]};
val inp8 = {tyname = "HOLD8",tykey = "HOLD8",conname = "Hold8",
	constkeys= ["Hold8","First8","Second8","Third8","Fourth8",
		"Fifth8","Sixth8","Seventh8","Eighth8"],
	labels = [("First8",ℕ),("Second8",ⓣ'1⌝),("Third8",ⓣ'2⌝),
		("Fourth8",ⓣ'1 × '2⌝),("Fifth8",ⓣ'3⌝),("Sixth8",ⓣ'1⌝),
	("Seventh8",ⓣ'1 × '3⌝),("Eighth8",ⓣ'3 × '2⌝)],
	tyvars = Value[ⓣ'1⌝,ⓣ'2⌝,ⓣ'3⌝]};
=SML
fun ⦏labelled_product_spec⦎ {tyname:string, tykey:string, conname:string,
	constkeys:string list, labels:(string*TYPE)list,
		tyvars:(TYPE list)OPT} : THM = (
let	val sideeffect = if is_nil constkeys
		then fail "labelled_product_spec" 6031 []
		else if is_nil labels
		then fail "labelled_product_spec" 59010 []
		else();
	val sideeffect = if tykey mem constkeys
		then fail "labelled_product_spec" 59018 [fn () => tykey]
		else();
	val nlabels = length labels;
	val tuple_thm = cached_labelled_product_rule nlabels
		handle complaint =>
		pass_on complaint "cached_labelled_product_rule"
			"labelled_product_spec";
	val tuple_type = fst(dest_→_type(type_of(fst(dest_simple_∃(
		fst(dest_⇒ (concl tuple_thm)))))));
	val (lab_nms,lab_types) = split labels;
	val rep_type = rlist_mk_×_type lab_types;
	val lab_tyvars = map mk_vartype(list_cup (map type_tyvars lab_types));
	val used_tyvars = case tyvars of
		Nil => lab_tyvars
		| Value tys => (if all lab_tyvars (fn xx => present (op =:) xx tys)
			then (map dest_vartype tys
				handle complaint =>
				pass_on complaint "dest_vartype"
					"labelled_product_spec"; tys)
			else fail "labelled_product_spec" 59015 [
			fn () => format_list(dest_vartype)
				(lab_tyvars drop (fn xx => present (op =:) xx tys)) ", "]);
	val abs_type = mk_ctype(tyname, used_tyvars);
	val ∃_thm = inst_type_rule[(rep_type, tva)] ∃_λ_x_t_thm;
=TEX
Before we actually declare the new type we attempt to ensure that we will be able to introduce the new constants
as requested.
We do not catch the failure of constants being already defined in child theories,
nor are we very good at presenting all the errors we know.
=SML
	val used_keys = mapfilter (fn x => (get_defn "-" x;x))
		(tykey :: constkeys);
	val sideeffect = if is_nil used_keys
		then ()
		else fail "labelled_product_spec" 6052 [fn () => hd used_keys,
			fn () => get_current_theory_name ()];
	val used_constants = mapfilter (fn x => (force_value(get_const_type x);x))
		(conname :: lab_nms);
	val sideeffect = if is_nil used_constants
		then ()
		else fail "labelled_product_spec" 6049
			[fn () => hd used_constants];
=TEX
Now the definition itself, which will flush out any writability problems that constant specification will have.
=SML
	val type_def = no_compact new_type_defn ([tyname],tykey,map dest_vartype used_tyvars, ∃_thm)
		handle complaint =>
		pass_on complaint "new_type_defn" "labelled_product_spec";
	val inters = map string_of_int (interval 1 nlabels);
	val tyinsts = (abs_type,tva) :: (combine lab_types
		(map (fn s => mk_vartype ("'"^s)) inters));
	val tuple_thm' = inst_type_rule tyinsts	tuple_thm;
	val s1 = simple_match_type_lemmas_thm type_def;
	val s2 = ⇒_elim tuple_thm' s1;
	val labs = map (fn (x,ty) => mk_var(x,mk_→_type(abs_type,ty))) labels;
	val xi = map mk_var(combine (map (fn x => "x"^x) inters) lab_types);
	val con = mk_var(conname,list_mk_→_type (lab_types @ [abs_type]));
	val t = mk_var("t",abs_type);
	val con_args = list_mk_app(con,xi);
	val abs = mk_var("abs",mk_→_type(rep_type,abs_type));
	val rep = mk_var("rep",mk_→_type(abs_type,rep_type));
	val thm_concl = mk_simple_∃(con,
		list_mk_simple_∃(labs,
		list_mk_simple_∀((t :: xi),
		rlist_mk_∧(
		map (fn (lab,x) =>
		mk_eq(mk_app(lab,con_args),x))
		(combine labs xi)
		@ [mk_eq(
		list_mk_app(con,
		map (fn lab => mk_app(lab,t)) labs),
		t)]))));
	val s3 = conv_rule (α_conv thm_concl) s2;
	val s4 = try_rule rw_∧_assoc_thm_rule s3;
in
	(no_compact new_spec(constkeys,1+nlabels,s4)
		handle complaint =>
		pass_on complaint "new_spec"
			"labelled_product_spec")
end
handle (complaint as (Fail _)) =>
if area_of complaint = "labelled_product_spec"
then reraise complaint "labelled_product_spec"
else fail "labelled_product_spec" 59014 [fn () => tyname]
); (* labelled_product_spec *)
=TEX
\subsubsection{Recogniser for labelled products}
=SML
local
	open ReaderWriterSupport Lex Parser TypeInference;
	open PrettyNames;
in

fun ⦏HOL_lab_prod_recogniser⦎
	(x:string, y:string, label:string,
		toks:Lex.INPUT list, z:string:string) : THM = (
	let	val sideeffect = if is_same_symbol(x, "Ⓢ")
			andalso	is_same_symbol(z, "■")
			andalso	(y = "HOLLABPROD")
			then ()
			else fail "HOL_lab_prod_recogniser" 59000 [];
		val toks1 = toks@[Lex.Separator"⦁T"];
		val tm = (lex (get_current_terminators()) get_fixity) toks1;
		val tm1 = HTBinder "∃"::tm;
		val tm2 = (make_term o HOL_parser) tm1;
		val tykey = label;
		val (vars, _) = strip_∃ tm2;
		val labels = (map dest_var vars) handle complaint =>
			pass_on complaint "dest_var" "HOL_lab_prod_recogniser";
		val tyname = tykey;
		val ft = list_cup(map term_tyvars vars);
		val ft1 = Sort.sort Sort.string_order ft;
		val ft2 = map mk_vartype ft1;
		val tyvars = if ft = [] then Nil else Value ft2;
		val conname = "Mk"^label;
		val constkeys = conname::(map fst labels);
=TEX
=SML
	in	
		labelled_product_spec {
			tykey=tykey,
			labels=labels,
			tyname=tyname,
			tyvars=tyvars,
			conname=conname,
			constkeys=constkeys
		}
	end
	handle complaint =>
	divert complaint "HOL-Parser" "HOL_lab_prod_recogniser" 59000 []
);
end (* local ... in *);
=IGN
   ⓈHOLLABPROD THING1
thing1 thing2:'b;
thing3 thing4:'a
   ■
=TEX
\subsection{Unlabelled Products}
=IGN
val ulp2 = {tyname="ULP2", tykey="ULP2", conname="Ulp2",
	conkeys=["Ulp2"], tyi=[ⓣ'a × 'b⌝,ⓣ'a × 'b⌝],
	tyvars = Value [ⓣ'a⌝,ⓣ'b⌝]};
val ulp3 = {tyname="ULP3", tykey="ULP3", conname="Ulp3",
	conkeys=["Ulp3"], tyi=[ⓣ'a × 'b⌝,ⓣ'a × 'b⌝,ⓣℕ⌝],
	tyvars = Value [ⓣ'a⌝,ⓣ'b⌝]};
val ulp4 = {tyname="ULP4", tykey="ULP4", conname="Ulp4",
	conkeys=["Ulp4"], tyi=[ⓣ'a × 'b⌝,ⓣ'a × 'b⌝,ⓣℕ⌝,ⓣ'c × 'a⌝],
	tyvars = Value [ⓣ'a⌝,ⓣ'b⌝,ⓣ'c⌝]};
val ulp5 = {tyname="ULP5", tykey="ULP5", conname="Ulp5",
	conkeys=["Ulp5"], tyi=[ⓣ'a × 'b⌝,ⓣ'a × 'b⌝,ⓣℕ⌝,ⓣ'c × 'a⌝,BOOL],
	tyvars = Nil};
val ulp6 = {tyname="ULP6", tykey="ULP6", conname="Ulp6",
	conkeys=["Ulp6"], tyi=[ⓣ'a × 'b⌝,ⓣ'a × 'b⌝,ⓣℕ⌝,ⓣ'c × 'a⌝,BOOL,ⓣ'1⌝],
	tyvars = Nil};
val ulp7 = {tyname="ULP7", tykey="ULP7", conname="Ulp7",
	conkeys=["Ulp7"], tyi=[ⓣ'd × BOOL⌝,ⓣ'a × 'b⌝,ⓣ'a × 'b⌝,
		ⓣℕ⌝,ⓣ'c × 'a⌝,BOOL,ⓣ'1⌝],
	tyvars = Nil};
val ulp8 = {tyname="ULP8", tykey="ULP8", conname="Ulp8",
	conkeys=["Ulp8"], tyi=[ⓣ'd × BOOL⌝,ⓣ'a × 'b⌝,ⓣ'a × 'b⌝,
		ⓣℕ⌝,ⓣ'c × 'a⌝,BOOL,ⓣ'1⌝,ⓣ'4⌝],
	tyvars = Nil};
=SML
fun ⦏unlabelled_product_spec⦎ {tyname:string, tykey:string, conname:string,
	conkeys:string list, tyi: TYPE list, tyvars:(TYPE list)OPT} : THM = (
let	val sideeffect = if is_nil conkeys
		then fail "unlabelled_product_spec" 6031 []
		else if is_nil tyi
		then fail "unlabelled_product_spec" 59011 []
		else();
	val sideeffect = if tykey mem conkeys
		then fail "unlabelled_product_spec" 59018 [fn () => tykey]
		else();
	val nlabels = length tyi;
	val tuple_thm = cached_unlabelled_product_rule nlabels
		handle complaint =>
		pass_on complaint "cached_unlabelled_product_rule"
			"unlabelled_product_spec";
	val rep_type = rlist_mk_×_type tyi;
	val lab_tyvars = map mk_vartype (list_cup(map type_tyvars tyi));
	val used_tyvars = case tyvars of
		Nil => lab_tyvars
		| Value tys => (if all lab_tyvars (fn xx => present (op =:) xx tys)
			then (map dest_vartype tys
				handle complaint =>
				pass_on complaint "dest_vartype"
					"unlabelled_product_spec"; tys)
			else fail "unlabelled_product_spec" 59016 [
				fn () => format_list(dest_vartype)
				(lab_tyvars drop (fn xx => present (op =:) xx tys)) ", "]);
	val abs_type = mk_ctype(tyname, used_tyvars);
	val ∃_thm = inst_type_rule[(rep_type, tva)] ∃_λ_x_t_thm;
=TEX
Before we actually declare the new type we attempt to ensure that we will be able to introduce the new constants
as requested.
We do not catch the failure of constants being already defined in child theories,
nor are we very good at presenting all the errors we know.
=SML
	val used_keys = mapfilter (fn x => (get_defn "-" x;x))
		(tykey :: conkeys);
	val sideeffect = if is_nil used_keys
		then ()
		else fail "unlabelled_product_spec" 6052 [fn () => hd used_keys,
			fn () => get_current_theory_name ()];
	val sideeffect = case (get_const_type conname) of
		Value _ =>fail "unlabelled_product_spec" 6049 [fn () => conname]
		| Nil => ();
=TEX
Now the definition itself, which will flush out any writability problems that constant specification will have.
=SML
	val type_def = no_compact new_type_defn ([tyname],tykey,
			map dest_vartype used_tyvars, ∃_thm)
		handle complaint =>
		pass_on complaint "new_type_defn" "unlabelled_product_spec";
	val inters = map string_of_int (interval 1 nlabels);
	val tyinsts = (abs_type,tva) :: combine tyi
		(map (fn s => mk_vartype ("'"^s)) inters);
	val tuple_thm' = (inst_type_rule tyinsts tuple_thm);
	val s1 = simple_match_type_lemmas_thm type_def;
	val s2 = ⇒_elim tuple_thm' s1;
	val s3 = conv_rule(RAND_C (simple_α_conv conname))
		s2;
	val s4 = try_rule rw_∧_assoc_thm_rule s3;
in
	(no_compact new_spec(conkeys,1,s4)
		handle complaint =>
		pass_on complaint "new_spec" "unlabelled_product_spec")
end
handle (complaint as (Fail _)) =>
if area_of complaint = "unlabelled_product_spec"
then reraise complaint "unlabelled_product_spec"
else fail "unlabelled_product_spec" 59014 [fn () => tyname]
); (* of unlabelled_product_spec *)
=TEX
\section{EPILOGUE}
=SML
val _ = open_theory lthy;
val _ = pop_pc();
end; (* of structure ProductTypes *)
open ProductTypes;
=TEX
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}
=IGN
fun stat_sort (nm1,x1) (nm2,x2) = if x1 = x2
	then string_order nm1 nm2
	else x1 - x2;




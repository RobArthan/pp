=IGN
********************************************************************************
imp058.doc: this file is part of the PPHol system

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

\def\Title{Implementation of Automatic Existence Proofs}

\def\AbstractText{This document contains the implementation of the tools supporting automatic existence proofs.}

\def\Reference{DS/FMU/IED/IMP058}

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
%% LaTeX2e port: \TPPtitle{Implementation of Automatic Existence Proofs}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP058}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.33 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2011/05/05 15:41:01 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.Blackburn & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document contains the implementation
%% LaTeX2e port: of the tools supporting automatic existence proofs.}
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
\item [Issues 1.1 (1991/12/10)]
First version.

\item[Issue 1.2 (1992/01/20), \FormatDate{92/01/20} ] Updated to use new fonts.
\item[Issue 1.3 (1992/02/11)]
Removed an implementation of $list\_mk\_→\_type$.
\item[Issue 1.4 (1992/02/13),1.5 (1992/02/14)(13th February 1992)]
Moving material from 058 to 027.
\item [Issue 1.6 (1992/03/03) (27th February 1992)]
Trying to speed things up.
\item [Issue 1.7 (1992/03/18) (16th March 1992)]
Using $strip\_leaves$, etc.
\item [Issue 1.8 (1992/03/18) (18th March 1992)]
Fixing typos.
\item [Issue 1.9 (1992/03/26) (26th March 1992)]
Changed to use proof context material of issue 1.13 of \cite{DS/FMU/IED/DTD051}.
\item [Issue 1.10 (1992/03/26) (27th March 1992)]
Split up $prove\_∃$.
\item [Issue 1.12 (1992/04/09) (3rd April 1992)]
Changes required by CR0016.
\item [Issue 1.13 (1992/04/14) (13th April 1992)]
Changes due to CR0017.
\item [Issue 1.14 (1992/05/11) (7th May 1992)]
Used $pp'TS$ instead of $CombI$.
\item [Issue 1.15 (1992/05/12) (12th May 1992)]
Change theory and names.
\item [Issue 1.16 (1992/05/14),1.17 (1992/05/18) (14th May 1992)]
Tidying up proof contexts.
\item [Issue 1.18 (1992/05/21) (20th May 1992)]
Removed proof context ``prove$\_∃$''.
\item [Issue 1.19 (1992/05/22) (21st May 1992)]
Bug in ``build$\_$predicates''.
\item [Issue 1.20 (1992/05/26) (26th May 1992)]
Renamings from version 1.5 of DS/FMU/IED/WRK038.
\item [Issue 1.21 (1992/06/02) (2nd June 1992)]
Changed ``native'' theory.
\item[Issue 1.22 (1992/06/24) (24th June 1992)]
Renamings from issue 1.6 of \cite{DS/FMU/IED/WRK038},
mostly proof context name changes.
\item[Issue 1.23 (1992/06/30) (29th June 1992)]
Tinkering to improve performance.
\item[Issue 1.24 (1992/07/02) (2nd July 1992)]
Tinkering to improve performance.
\item[Issue 1.25 (1992/07/03) (3rd July 1992)]
Changed some uses of $subst$ to $var\_subst$.
\item [Issue 1.26 (1992/08/13) (13th August 1992)]
Corrected error handling for interrupts.
\item [Issue 1.26 (1992/08/13) (7th November 1992)]
Improved variable structure handling.
\item [Issue 1.27 (1992/12/07)]
Update for SML'97.
\item[Issue 1.29 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.30 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.31 (2005/12/16)] The prefix for private interfaces is now $pp'$ rather than $icl'$.
\item[Issue 1.32 (2010/09/10)] Existence theorems no longer need to have unique existentials.
Improved error-handling.
\item[Issue 1.33 (2011/05/05)] Allowed for new parameter to primitive rewriting functions.
\item[Issue 1.33 (2011/05/05)] Made the rewriting done by the existence prover
independent of the proof context.
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
Tools providing automatic existence proofs
are a supporting tools for the specification of constants
and are called for in \cite{DS/FMU/IED/HLD010}.
This document provides an implementation for these tools.
A design for such tools is given in \cite{DS/FMU/IED/DTD058}.
This document provides an implementations for them.
\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains an implementation for the
tools supporting automatic existence proofs.
\subsubsection{Dependencies}
This document takes its signature from \cite{DS/FMU/IED/DTD058}.
\subsubsection{Deficiencies}
None known.
\subsubsection{Possible Enhancements}
None known.

\section{PREAMBLE}
=SML
structure ⦏ExistenceProofs⦎ : ExistenceProofs = struct
=TEX
=SML
val lthy = get_current_theory_name ();
val _ = open_theory "basic_hol";
val _ = push_merge_pcs ["'propositions","'paired_abstractions"];
=TEX
To make certain functions independent of proof context changes we need to create a (temporary) build proof context equivalent
to the supplied ``predicates'', in the fields that matter.
As we have not commited the sources, we have to do this the hard way:
=SML
fun lget x = fst(hd x);
val _ = new_pc "build_predicates";
val _ = set_rw_eqn_cxt ((lget o get_rw_eqn_cxt) "'propositions" @
		(lget o get_rw_eqn_cxt) "'paired_abstractions")
		"build_predicates";
val _ = set_sc_eqn_cxt ((lget o get_sc_eqn_cxt) "'propositions" @
		(lget o get_sc_eqn_cxt) "'paired_abstractions")
		"build_predicates";
val _ = set_st_eqn_cxt ((lget o get_st_eqn_cxt) "'propositions" @
		(lget o get_st_eqn_cxt) "'paired_abstractions")
		"build_predicates";
val _ = set_rw_canons ((lget o get_rw_canons) "'propositions" @
		(lget o get_rw_canons) "'paired_abstractions")
		"build_predicates";
=TEX
\section{THEOREMS}
=IGN
val ⦏local_⇒_thm⦎ = taut_rule ⌜∀ x y ⦁ (x ⇒ y) = (¬ x ∨ y)⌝;
=TEX
The following are just to extract particular clause from the standard
rewriting theorems:
=SML
val ⦏pp'ts_def⦎ = get_defn "misc" "pp'ts_def";
val ⦏∃_not_binding_thm⦎ = tac_proof(([],⌜∀ p:BOOL ⦁ (∃ x:'a⦁ p) = p⌝),
	rewrite_tac[]);
=TEX
=SML
val ⦏∀_not_binding_thm⦎ = tac_proof(([],⌜∀ p:BOOL ⦁ (∀ x:'a⦁ p) = p⌝),
	rewrite_tac[]);
=TEX
=SML
val ⦏uncurry_curry_thm⦎ = (
push_goal([],⌜∀ f f' ⦁ (Uncurry(Curry f) = f) ∧ (Curry(Uncurry f') = f')⌝);
a(rewrite_tac[ext_thm, pair_clauses]);
pop_thm());
=TEX
=SML
val ⦏∃_uncurry_thm⦎ = (
push_goal([],⌜∀ P ⦁ (∃ f ⦁ P f) ⇔ (∃ f' ⦁ P(Uncurry f'))⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(∃_tac⌜Curry f⌝ THEN asm_rewrite_tac[uncurry_curry_thm]);
(* *** Goal "2" *** *)
a(∃_tac⌜Uncurry f'⌝ THEN asm_rewrite_tac[]);
pop_thm());
=TEX
\section{UTILITIES}
\subsection{General}
Return the minimum value of a (non-empty) list of integers:
=SML
fun ⦏list_min⦎ ([]:int list) = fail "list_min" 0 []
| list_min (a :: x) = (
let	fun aux (sofar:int) [] = sofar
	| aux sofar (a1 :: x1) = (
		if a1 < sofar
		then aux a1 x1
		else aux sofar x1);
in
	aux a x
end);
=TEX
Split a list into two, all members satisfying the supplied predicate
into the first list, the rest into the other list.
The internal order of the lists is maintains (thus the $rev$).
=SML
fun ⦏two_way⦎ (f:'a -> bool) (lst : 'a list) : 'a list * 'a list = (
let	fun aux lst1 lst2 [] = (rev lst1,rev lst2)
	| aux lst1 lst2 (a :: x) = (
		if f a
		then aux (a :: lst1) lst2 x
		else aux lst1 (a :: lst2) x
	);
in
	aux [] [] lst
end);
=TEX

\subsection{Terms and Types}
To save on repeated parsing we bind these two type variables to ML variables:
=SML
val ⦏tva⦎ = ⓣ'a⌝;
val ⦏tvb⦎ = ⓣ'b⌝;
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
Flatten a paired structure:
=SML
val ⦏strip_pair⦎ :TERM -> TERM list = strip_leaves dest_pair;
=TEX
Flatten a conjunction structure ($strip_∧$ only flattens to the right):
=SML
val ⦏full_strip_∧⦎ : TERM -> TERM list = strip_leaves dest_∧;
=TEX
Flatten a disjunction structure ($strip_∨$ only flattens to the right):
=SML
val ⦏full_strip_∨⦎ : TERM -> TERM list = strip_leaves dest_∨;
=TEX
Remove $n$ simple universal quantifiers:
=SML
fun ⦏strip_n_simple_∀⦎ 0 tm = tm
| strip_n_simple_∀ n tm = strip_n_simple_∀ (n - 1)(snd(dest_simple_∀ tm));
=TEX

Place an order on two variables, to allow them to be sorted:
=SML
local
	open Sort;
in
fun	⦏var_order⦎ (v1:TERM) (v2:TERM) : int = (
let	val (v1n,v1t) = dest_var v1;
	val (v2n,v2t) = dest_var v2;
	val no = string_order v1n v2n
in
	if no <> 0
	then no
	else string_order (string_of_type v1t) (string_of_type v2t)
end);
end;
=TEX

\subsection{Conversionals and Tacticals}
We want a variant on $SIMPLE\_∃\_THEN$ that refuses
to rename the introduced variable (failing only if the new variable
equals the old in name and type).
=SML
fun ⦏NR_SIMPLE_∃_THEN⦎ (ttac : THM -> TACTIC) = (fn thm =>
	let	val (x, b) = dest_simple_∃(concl thm);
	in	(fn (seqasms, conc) =>
			let	val sideffect = if present (op =$) x
					(flat(map frees
					(conc :: asms thm @ seqasms)))	
				then term_fail "NR_SIMPLE_∃_THEN" 0 [x]
				else ();
				val (sgs, pf) = ttac (asm_rule b) (seqasms, conc);
			in	(sgs, (simple_∃_elim x thm) o pf)
			end)
	end
	handle ex => divert ex "dest_simple_∃" "NR_SIMPLE_∃_THEN" 28093
		[fn () => string_of_thm thm]
);
=TEX

\subsubsection{``Working Through'' Operators}
We wish to work within the body(bodies) of certain operators.
The following are a collection of conversionals used to this end within this document.
\subsubsection{Working Through a Stated Number of Binders}
Apply a conversions within the body of $n$ simple binders:
=SML
fun ⦏N_SIMPLE_BINDER_C⦎ (0:int) (conv : CONV) :CONV = conv
| N_SIMPLE_BINDER_C n conv = SIMPLE_BINDER_C
	(N_SIMPLE_BINDER_C(n-1) conv);
=TEX
Notice the assumption that when called $n$ will be a suitable number.

Working through all but the last one of a sequence of existential
quantifiers:
=SML
fun ⦏LAST_SIMPLE_∃_C⦎ (conv:CONV): CONV = (fn tm =>
	if is_simple_∃ (snd(dest_simple_∃ tm))
	then (SIMPLE_BINDER_C (LAST_SIMPLE_∃_C conv)) tm
	else conv tm
);
=TEX

\subsection{Marking and Unmarking}
We wish to ``mark'' some terms, to prevent stripping going too far.
We use $pp'TS$ as a marker.

``mark'' a term:
=SML
local
	val ci = ⌜pp'TS:BOOL → BOOL⌝;
in
fun ⦏mark⦎ (tm:TERM):TERM = mk_app(ci,tm)
end;
=TEX
We also wish to unmark them, and so need to prove the
unmarked form equal to the marked one.
The first form does not bother checking whether
the conversion applies, the second, $check\_unmark\_conv$, does.
=SML
local
	val thm = tac_proof(([],⌜∀ t:BOOL ⦁ pp'TS t ⇔ t⌝),
		rewrite_tac[get_defn "misc" "pp'ts_def"]);
in
val ⦏unmark_conv⦎ : CONV = (fn tm =>
let	val (c,t) = dest_app tm
in
	simple_∀_elim t thm
end);
=TEX

=SML
val ⦏check_unmark_conv⦎ : CONV = (fn tm =>
let	val t = dest_mon_op "check_unmark_conv" 0 "pp'TS" tm
in
	simple_∀_elim t thm
end)

end;
=TEX
\subsection{Rewriting}
A vanilla flavoured rewriting conversion independent of the proof context is useful:
=SML
val ⦏local_pure_rewrite_conv⦎ : THM list -> CONV = (
	prim_rewrite_conv
	empty_net
	initial_rw_canon
	Nil
	TOP_MAP_C
	[]
);
=TEX
\section{MAIN FUNCTIONS}
We will work by providing some processing conversions,
and applying them in a particular manner.
This is a little inefficient, but clearer to present.
We also presume that we immediately go through any universal quantifiers, and ``stay there'',
until complete, and then we attempt to remove any redundant
universal quantifiers before finishing off.
\subsection{Uncurrying}
For uncurrying we can just use $∃\_uncurry\_conv$ ``straight''.
\subsection{Removing Redundant ∃ Binders}
To remove redundant binders we use $∃\_not\_binding\_thm$.
We wish to descend down the $∃$ binders until there are no
more.
=FRULE 1 Conversion
redundant_simple_∃_conv
⌜∃ x1 ... xn ⦁ P [y1 ... ym]⌝
├
├
⊢ (∃ x1 ... xn ⦁ P [y1 ... ym]) ⇔
	(∃ y1 ... ym ⦁ P [y1 ... ym])
=TEX
where $\{y1...ym\}\ ⊂\ \{x1 ... xn\}$.
=SML
local
	val tc = simple_eq_match_conv1 ∃_not_binding_thm;
in
val rec ⦏redundant_simple_∃_conv⦎: CONV = (fn tm =>
let	val (exs,bdy) = strip_simple_∃ tm;
	val bdy_frees = frees bdy;
	fun aux [] = false
	| aux (x :: rest) = (
		(present (op =$) x rest) orelse not(present (op =$) x bdy_frees)
		orelse aux rest
	);
	fun aux1 [] tm = fail "redundant_simple_∃_conv" 0 []
	| aux1 (x :: rest) tm = (
		if (present (op =$) x rest) orelse not(present (op =$) x bdy_frees)
		then (tc THEN_TRY_C (aux1 rest)) tm
		else SIMPLE_BINDER_C (aux1 rest) tm
	);
in
	if aux exs
	then aux1 exs tm
	else fail "redundant_simple_∃_conv" 0 []
end);
end;
=TEX
\subsection{Removing Redundant ∀ Binders}
To remove redundant binders we use $∀\_not\_binding\_thm$.
We wish to descend down the $∀$ binders until there are no
more.
=FRULE 1 Conversion
redundant_simple_∀_conv
⌜∀ x1 ... xn ⦁ P [y1 ... ym]⌝
├
├
⊢ (∀ x1 ... xn ⦁ P [y1 ... ym]) ⇔
	(∀ y1 ... ym ⦁ P [y1 ... ym])
=TEX
where $\{y1...ym\}\ ⊂\ \{x1 ... xn\}$.
=SML
local
	val tc = simple_eq_match_conv1 ∀_not_binding_thm;
in
val rec ⦏redundant_simple_∀_conv⦎: CONV = (fn tm =>
let	val (exs,bdy) = strip_simple_∀ tm;
	val bdy_frees = frees bdy;
	fun aux [] = false
	| aux (x :: rest) = (
		(present (op =$) x rest) orelse not(present (op =$) x bdy_frees)
		orelse (aux rest)
	);
	fun aux1 [] tm = fail "redundant_simple_∀_conv" 0 []
	| aux1 (x :: rest) tm = (
		if (present (op =$) x rest) orelse not(present (op =$) x bdy_frees)
		then (tc THEN_TRY_C (aux1 rest)) tm
		else SIMPLE_BINDER_C (aux1 rest) tm
	);
in
	if aux exs
	then aux1 exs tm
	else fail "redundant_simple_∀_conv" 0 []
end);
end;
=TEX

\subsection{Pushing In ∃}
We wish to be able to push $∃$ into conjuncts and disjuncts as far as possible.
We will not distribute $∨$ over $∧$, though this may lead to
simpler terms (by allowing more pushing in), as simplification is not certain, and
may be difficult to judge.
None of the other predicate calculus operators seem to be useful candidates for ``pushing in'' gaining any simplification.

If pushing in occurs we will also ``flatten'' the disjunct
or conjunct structure.
\subsubsection{Over ∨}
=FRULE 1 Conversion
simple_∃_∨_conv
⌜∃ x1 ... xn ⦁ P [y1 ... ym] ∨ Q [z1 ...zo]⌝
├
├
⊢ (∃ x1 ... ⦁
	P [y1 ... ym] ∨ Q [z1 ...zo])
	⇔
	(∃ y1 ... ym ⦁ P [y1 ... ym]) ∨
	(∃ z1 ... zo ⦁ P [z1 ... zo])
=TEX
where $\{y1...ym\}\ ⊂\ \{x1 ... xn\}$, and
$\{z1...zo\}\ ⊂\ \{x1 ... xn\}$.
The conversion will actualy distribute over an arbitrary disjunctive
structure, though the result is ``flattened''.
=SML
local
	val rw_tac = (prim_rewrite_tac
		(make_net( map thm_eqn_cxt ((initial_rw_canon ∨_rewrite_thm) to 1)))
		id_canon
		Nil
		TOP_MAP_C
		[]);
in
val ⦏simple_∃_∨_conv⦎: CONV = (fn (tm : TERM) =>
let	val (vs,bdy) = strip_simple_∃ tm
		handle complaint =>
		divert complaint "strip_simple_∃" "simple_∃_∨_conv"
			58010 [fn () => string_of_term tm];
	val sideeffect = if is_nil vs orelse (not(is_∨ bdy))
		then term_fail "simple_∃_∨_conv" 58010 [tm]
		else ();
	val tm_frees = frees tm;
	val disjs = map mark (full_strip_∨ bdy);
	val disj_frees = map (fn x => rev(frees x drop
		(fn xx => present (op =$) xx tm_frees))) disjs;
	val new_term = list_mk_∨(map list_mk_simple_∃ (combine disj_frees disjs));
in
	conv_rule(RAND_C (ONCE_MAP_C check_unmark_conv))
	(tac_proof(([],mk_⇔(tm,new_term)),
		⇔_T2
		(fn thm1 => ((REPEAT_TTCL NR_SIMPLE_∃_THEN THEN_TTCL
			REPEAT_TTCL ∨_THEN) asm_tac) thm1 THEN
		 (fn (seqasms,gl) => let val asm = hd seqasms;
			val asm_frees = rev(frees asm drop
				(fn xx => present (op =$) xx tm_frees));
		in
			(LEMMA_T (list_mk_∃(asm_frees,mark asm))
			(fn thm => rw_tac[⇔_t_intro thm])
			THEN MAP_EVERY_T simple_∃_tac asm_frees
			THEN conv_tac unmark_conv
			THEN concl_in_asms_tac)
			(seqasms,gl)
		end))
		(fn thm2 => ((REPEAT_TTCL ∨_THEN THEN_TTCL
			REPEAT_TTCL NR_SIMPLE_∃_THEN THEN_TTCL
			CONV_THEN unmark_conv) asm_tac) thm2 THEN
		MAP_EVERY_T simple_∃_tac vs THEN
		POP_ASM_T (fn thm => rw_tac[⇔_t_intro thm]))
		))
end
handle complaint =>
divert complaint "tac_proof" "simple_∃_∨_conv" 58015 [fn () => string_of_term tm]);
end;
=IGN
simple_∃_∨_conv  ⌜∃ a b c d ⦁ ((a ∧ c) ∨ b) ∨ ((a ∧ d) ∨ e ∨ f)⌝;
simple_∃_∨_conv  ⌜∃ a b c d ⦁ ((a ∧ c) ∨ b) ∨ (∃ a ⦁ a ∧ d) ∨ ((a ∧ d) ∨ e ∨ f)⌝;

=TEX

\subsubsection{Over ∧}
This auxiliary function counts, for each member of the first argument, the number of sublists in the second argument which contain it.
=SML
fun ⦏count_mem⦎ ([] : TERM list) (fls : (TERM list) list):(int * TERM) list = []
| count_mem (v :: rest) fls = (
let	fun aux [] n = (n,v)
	| aux (fl :: flrest) n = if present (op =$) v fl
		then aux flrest (n+1)
		else aux flrest n;
in
	(aux fls 0 :: count_mem rest fls)
end);
=TEX
This conversion will push simple existential quantifiers
into a term body that consists of nested conjunctions
when not all the conjuncts have all of the quantified
variables free in them.
=SML
local
	open Sort;
=TEX
This auxiliary function sorts a list of numbers paired with variables,
the order of the numbers having precedence over variables.
=SML
	val sorted_bound_n = sort (fn (m,tm1) => fn(n,tm2) =>
		if m = n
		then var_order tm1 tm2
		else m - n);
=TEX
This auxiliary function  recombines a list of existentially
quantified conjuncts with reference to the presence
of a given variable within the conjuncts.
=SML
	fun recombine_conjs [] conjs = list_mk_∧ conjs
	| recombine_conjs ((_,v) :: rest) conjs = (
	let	val (withit,without) = two_way (fn x => is_free_in v x) conjs;
	in
		recombine_conjs rest (mk_simple_∃(v,list_mk_∧ withit) :: without)
	end);

in
val ⦏simple_∃_∧_conv⦎ = (fn (tm : TERM) =>
let	val (vs,bdy) = strip_simple_∃ tm
		handle complaint =>
		divert complaint "strip_simple_∃" "simple_∃_∧_conv"
			58012 [fn () => string_of_term tm];
	val sideeffect = if is_nil vs orelse (not(is_∧ bdy))
		then term_fail "simple_∃_∧_conv" 58012 [tm]
		else ();
	val tm_frees = frees tm;
	val conjs = map mark (full_strip_∧ bdy);
	val conj_frees = map
		(fn x => rev(frees x drop (fn xx => present (op =$) xx tm_frees)))
		conjs;
	val length_vs = length vs;
	val sideeffect = if any conj_frees (fn x => length x < length_vs)
		then ()
		else term_fail "simple_∃_∧_conv" 58014 [tm];
=TEX
We take a simplistic approach to forming the resulting term:
we first bind conjuncts with quantifiers which only apply to
one conjunct.
Then we bind pairs of conjuncts, then triples, etc.
Within this ordering we make no attempt to optimise,
nor recalculate sets of frees.
=SML
	val bound_n = count_mem vs conj_frees;

	val new_term = recombine_conjs (sorted_bound_n  bound_n) conjs;
in
	conv_rule (RAND_C(ONCE_MAP_C check_unmark_conv))
	(tac_proof(([],mk_⇔(tm,new_term)),
		⇔_T2
		(fn thm1 => ((REPEAT_TTCL NR_SIMPLE_∃_THEN
			THEN_TTCL
			REPEAT_TTCL ∧_THEN) asm_tac) thm1
			THEN
		SOLVED_T(REPEAT_T
			(FIRST_T[
			(fn (seqasms,gl) => let val (v,b) = dest_simple_∃ gl;
				in simple_∃_tac v(seqasms,gl)
				end),
			∧_tac,
			(conv_tac check_unmark_conv THEN
			 concl_in_asms_tac)])))
		(fn thm2 => ((REPEAT_TTCL(NR_SIMPLE_∃_THEN
				ORELSE_TTCL ∧_THEN)
			THEN_TTCL (CONV_THEN unmark_conv))asm_tac) thm2
		THEN
		REPEAT_T (fn (seqasms,gl) => let val (v,b) = dest_simple_∃ gl;
				in simple_∃_tac v(seqasms,gl)
				end)
		THEN
		REPEAT_T ∧_tac
		THEN
		concl_in_asms_tac)))
end
handle complaint =>
divert complaint "tac_proof" "simple_∃_∧_conv" 58015
	[fn () => string_of_term tm]);
end; (* local open Sort *)
=IGN
simple_∃_∧_conv  ⌜∃ a b c d ⦁ ((a ∨ c) ∧ b) ∧ ((d ∨ a) ∧ e ∧ f)⌝;
simple_∃_∧_conv  ⌜∃ a b c d ⦁ ((a ∨ c) ∧ b) ∧ (∃ a ⦁a ∧ d) ∧ ((d ∨ a) ∧ e ∧ f)⌝;
simple_∃_∧_conv  ⌜∃ a b c d ⦁ ((a ∨ c) ∧ b) ∧ ((a ∨ d) ∧ (e  ∨ c) ∧ f)⌝;
simple_∃_∧_conv  (subst[(⌜a:'a⌝,⌜h:'a⌝)]
	(⌜∃ a b c d ⦁ ((a ∨ c) ∧ b ∧ g h) ∧ ((a ∨ d) ∧ (e  ∨ c) ∧ f)⌝));

simple_∃_∧_conv
	(⌜∃ a b c d ⦁ ((a ∨ c) ∧ b ∧ g ⓜmk_var("a",ⓣ'a⌝)⌝) ∧ ((a ∨ d) ∧ (e  ∨ c) ∧ f)⌝);
simple_∃_∧_conv
	(⌜∃ a b c d ⦁ ((a ∨ c) ∧ b ∧ (a ∨ g ⓜmk_var("a",ⓣ'a⌝)⌝)) ∧ ((a ∨ d) ∧ (e  ∨ c) ∧ f)⌝);

=TEX
\subsection{Pushing In ∀}
We wish to be able to push $∀$ into conjuncts and disjuncts as far as possible.
We will not distribute $∨$ over $∧$, though this may lead to
simpler terms (by allowing more pushing in), as simplification is not certain, and
may be difficult to judge.
None of the other predicate calculus operators seem to be useful candidates for ``pushing in'' gaining any simplification.

If pushing in occurs we will also ``flatten'' the disjunct
or conjunct structure.
\subsubsection{Over ∧}
=FRULE 1 Conversion
∀_∧_conv
⌜∀ x1 ... xn ⦁ P [y1 ... ym] ∧ Q [z1 ...zo]⌝
├
├
⊢ (∀ x1 ... xn ⦁
	P [y1 ... ym] ∧ Q [z1 ...zo]) ⇔
	(∀ y1 ... ym ⦁ P [y1 ... ym]) ∧
	(∀ z1 ... zo ⦁ P [z1 ... zo])
=TEX
where $\{y1...ym\}\ ⊂\ \{x1 ... xn\}$, and
$\{z1...zo\}\ ⊂\ \{x1 ... xn\}$.
The conversion will actually distribute over an arbitrary conjunctive
structure, though the result is ``flattened''.

Note that in the below $conv\_tac\ unmark\_conv$ can solve a conjunct $pp'TS\ T$,
and therefore needs pushing into the $THEN\_LIST\_T$ to preserve the right number of tactics in its ``to do'' list.
=SML
local
	fun ∀_∧_canon thm = (
		strip_∧_rule (all_∀_elim thm));
	fun ∧_∀_canon thm = (
		map  (fn x => conv_rule unmark_conv
			(all_∀_elim x))
		(strip_∧_rule thm));
in
val ⦏∀_∧_conv⦎: CONV = (fn (tm : TERM) =>
let	val (vs,bdy) = strip_∀ tm;
in
	if is_nil vs
		then term_fail "∀_∧_conv" 58020 [tm]
		else if (not(is_∧ bdy))
		then (all_∀_uncurry_conv tm handle (Fail _) =>
			term_fail "∀_∧_conv" 58020 [tm])
		else (
let	val tm_frees = frees tm;
	val conjs = map mark (full_strip_∧ bdy);
	val conj_frees = map (fn x => rev(frees x drop
		(fn xx => present (op =$) xx tm_frees))) conjs;
	val new_term = list_mk_∧(map list_mk_∀ (combine conj_frees conjs));
in
	conv_rule(RAND_C (ONCE_MAP_C check_unmark_conv))
	(tac_proof(([],mk_⇔(tm,new_term)),
		⇔_T2
		(fn thm1 =>
		let val thm1_can = ∀_∧_canon thm1
		in
		REPEAT ∧_tac THEN REPEAT ∀_tac
		THEN_LIST_T (map (fn thm => conv_tac unmark_conv
			THEN accept_tac thm) thm1_can)
		end)
		(fn thm2 =>
		let val thm2_can = ∧_∀_canon thm2
		in
		REPEAT ∀_tac THEN REPEAT ∧_tac
		THEN_LIST_T (map accept_tac thm2_can)
		end)
		))
end
handle complaint =>
divert complaint "tac_proof" "∀_∧_conv" 58015 [fn () => string_of_term tm])
end);
end;
=IGN
∀_∧_conv  ⌜∀ a b c d ⦁ ((a ∨ c) ∧ b) ∧ ((a ∨ d) ∧ e ∧ f)⌝;
∀_∧_conv  ⌜∀ a b c d ⦁ ((a ∨ c) ∧ b) ∧ (∀ a ⦁ a ∧ d) ∧ ((a ∨ d) ∧ e ∧ f)⌝;
∀_∧_conv  ⌜∀ a (b,c) d ⦁ ((a ∨ c) ∧ b) ∧ (∀ a ⦁ a ∧ d) ∧ ((a ∨ d) ∧ e ∧ f)⌝;
∀_∧_conv  ⌜∀ (a, (b,c), d) ⦁ ((a ∨ c) ∧ b) ∧ (∀ a ⦁ a ∧ d) ∧ ((a ∨ d) ∧ e ∧ f)⌝;
∀_∧_conv  ⌜∀ (a, (b,c), d) ⦁ f a b c d⌝;
∀_∧_conv  ⌜∀ a (b,c) d ⦁ f a b c d⌝;

=TEX

\subsubsection{Over ∨}
This is difficult to do efficiently!
=IGN
local
	open Sort;
in
val ∀_∨_conv = (fn (tm : TERM) =>
let	val (vs,bdy) = strip_∀ tm;
	val sideeffect = if is_nil vs orelse (not(is_∨ bdy))
		then term_fail "∀_∨_conv" 58012 [tm]
		else ();
	val tm_frees = frees tm;
	val disjs = map mark (full_strip_∨ bdy);
	val disj_frees = map (fn x => rev(frees x drop (fn xx => present (op =$) xx tm_frees))) disjs;
	val length_vs = length vs;
	val sideeffect = if any disj_frees (fn x => length x < length_vs)
		then ()
		else term_fail "∀_∨_conv" 58014 [tm];
We take a simplistic approach to forming the resulting term:
we first bind disjuncts with quantifiers which only apply to
one disjunct.
Then we bind pairs of disjuncts, then triples, etc.
Within this ordering we make no attempt to optimise,
nor recalculate sets of frees.
	val bound_n = count_mem vs disj_frees;
	val sorted_bound_n = sort (fn (m,tm1) => fn(n,tm2) =>
		if m = n
		then var_order tm1 tm2
		else m - n) bound_n;

	fun aux [] disjs = list_mk_∨ disjs
	| aux ((_,v) :: rest) disjs = (
	let	val (withit,without) = two_way (fn x => is_free_in v x) disjs;
	in
		aux rest (mk_simple_∀(v,list_mk_∨ withit) :: without)
	end);

	val new_term = aux sorted_bound_n disjs;
in
	conv_rule (RAND_C(ONCE_MAP_C check_unmark_conv))
	(tac_proof(([],mk_⇔(tm,new_term)),
		⇔_T2
		(????)
		(????)
		))
end
handle complaint =>
divert complaint "tac_proof" "∀_∨_conv" 58015 [fn () => string_of_term tm]);
end; (* local open Sort *)
∀_∨_conv  ⌜∀ a b c d ⦁ ((a ∧ c) ∨ b) ∨ ((d ∧ a) ∨ e ∨ f)⌝;
∀_∨_conv  ⌜∀ a b c d ⦁ ((a ∨ c) ∨ b) ∨ (∀ a ⦁a ∨ d) ∨ ((d ∨ a) ∨ e ∨ f)⌝;
∀_∨_conv  ⌜∀ a b c d ⦁ ((a ∨ c) ∨ b) ∨ ((a ∨ d) ∨ (e  ∨ c) ∨ f)⌝;
∀_∨_conv  (subst[(⌜a:'a⌝,⌜h:'a⌝)]
	(⌜∀ a b c d ⦁ ((a ∨ c) ∨ b ∨ g h) ∨ ((a ∨ d) ∨ (e  ∨ c) ∨ f)⌝));

∀_∨_conv
	(⌜∀ a b c d ⦁ ((a ∨ c) ∨ b ∨ g ⓜmk_var("a",ⓣ'a⌝)⌝) ∨ ((a ∨ d) ∨ (e  ∨ c) ∨ f)⌝);
∀_∨_conv
	(⌜∀ a b c d ⦁ ((a ∨ c) ∨ b ∨ (a ∨ g ⓜmk_var("a",ⓣ'a⌝)⌝)) ∨ ((a ∨ d) ∨ (e  ∨ c) ∨ f)⌝);

Do as many calls of $all\_simple\_∃\_∀_conv1$ as will work.
=SML
val rec ⦏all_simple_∃_∀_conv1⦎ :CONV = (fn tm =>
	(simple_∃_∀_conv1 THEN_TRY_C
	(SIMPLE_BINDER_C all_simple_∃_∀_conv1)) tm
);
=TEX
\subsection{Context of Existentially Quantified Variables}
We can attempt to handle a number of different contexts for an existentially quantified variable $f$ in the term $∃\ f\ ⦁\ ...$.

We presume that universal quantifiers have already been pushed through and conjunctions in the body.
\begin{enumerate}
\item
Somewhere in the body, reached only through $∃$, $∀$ or $∧$
is a subterm of the form $f\ =\ P[x_1,...,x_n]$
or $P[x_1,...,x_n]\ =\ f$ where the $x_i$, the free variables of
$P[x_1,...,x_n]$ are not bound by any quantifier ``between'' he binding of $f$ and this conjunct.
If so, $f$ can be eliminated from the term, with $P[x_1,...,x_n]$ being used instead.
A variant on this is to find $f$ alone, where it may be taken to be $f\ ⇔ T$, and similarly $¬\ f$ to be $f\ ⇔\ F$.
\item
The term can be rearranged to the form
=GFT
∃ x1 ... xn ⦁ ∃ f ⦁ ∀ y1 ... ym ⦁ P[f y1...ym, y1...ym, x1, ..., xn]
=TEX
In this case we can use $(all\_)simple\_∃\_∀\_conv1$,
and we may often find the $y_i$ becoming redundant quantifiers
($simple\_∃\_∀\_conv$ cannot itself be considered to simplify
a term, so we don't automatically use it, only its special case).
\item
The term can be rearranged to the form:
=GFT
∃ x1 ... xn ⦁ ∃ f ⦁ ∀ y1 ... ym ⦁ P[f c1, ..., f cm, y1,...ym,...,x1, ..., xn]
=TEX
where the $c_i$ are distinct data constructors applied to the $y_i$.
In this case we may be able to appeal to an appropriate
inductive theorem to recast the term via step (2)
to:
=GFT
∃ x1 ... xn ⦁ ∀ y ⦁ ∃ f' ⦁ ∀ y1 ... ym ⦁ P[f',y1,...,ym,x1, ..., xn]
=TEX
In the case of pairs, and any other type with a single
data constructor, we can consider variables and constructions
as interchangeable.
In some cases the rearranged term may contain applications of $f$ to a variable as well as to data constructions.
\item
The term can be rearranged by using $f'$ with the same arguments, but
in a different order, to gain the state of case (2) or case (3).
(We do not currently cater for this.)
\end{enumerate}

We give an approach that is only interested in handling a single
 existential quantifier.
This avoids complexity, at the cost of multiple passes
for multiple quantifiers.
\subsubsection{Equations of the Existential Quantifier}
The following auxiliary knows that embedded in $tm$,
through operators that ``respect'' $F$,
is an equality of on of the outer existentially quantified variables
with $witness$.

Crudely:
=FRULE 1 Conversion
simple_∃_equation_conv
⌜∃ f ⦁ ...f... (f = witness) ...f...
├
├
(∃ f ⦁ ...f... (f = witness) ...f...) ⇔
 (...witness...T...witness...)
=TEX
In fact, various forms of equation can be handled,
and the $T$ is eliminated by rewriting.

We do not handle the special cases of, e.g.,
$⌜∃\ f⦁\ f\ x\ ⇔\ T⌝$,
where $x$ is a redundant argument, because more
general cases don't work - e.g. consider:

=GFT
∀ p x ⦁ ∃ f ⦁ (f x ⇔ T) ∧ p x f

which is not equal to (but only implied by):

∀ p x ⦁ p x (λ y ⦁ T)
=TEX
=SML
local
	val ⇒_thm = tac_proof(([],⌜∀ x ⦁ x ⇒ x⌝),REPEAT strip_tac);
in
fun local_rule thm gl = (
let 	val (a,b) = dest_⇒ gl;
	val (x,bdy) = dest_eq(concl thm);
	val ithm = simple_∀_elim b ⇒_thm;
in
	subst_rule[(eq_sym_rule thm,x)] gl ithm
end);
end;
=TEX
=SML
local
	val ¬_⇔_thm = tac_proof(([],⌜∀ x ⦁
		(¬(x ⇔ T) ⇔ (¬ x)) ∧
		(¬(x ⇔ F) ⇔ x)⌝),
		REPEAT strip_tac THEN asm_rewrite_tac[]);
	val rwc = local_pure_rewrite_conv
		[∧_rewrite_thm, ∃_rewrite_thm,
		∀_rewrite_thm, eq_rewrite_thm, ⇒_rewrite_thm,
			 ¬_rewrite_thm];
	val rw_tac1 = (prim_rewrite_tac	
		(make_net(flat(map (cthm_eqn_cxt
			initial_rw_canon)
			[⇒_rewrite_thm])))
		initial_rw_canon
		Nil
		TOP_MAP_C
		[]);
	val rw_tac2_thm = tac_proof(([],
		⌜∀ t⦁ ¬ (F ∧ t) ∧ ¬ (t ∧ F) ∧
		¬(∃ x ⦁ F) ∧ ¬(∀ x ⦁ F) ∧
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
=TEX
After the auxiliary rewriting stuff:
=SML
val ⦏simple_∃_equation_conv⦎ : CONV = (fn mtm =>	
let	val (x,bdy) = dest_simple_∃ mtm
		handle complaint =>
		pass_on complaint "dest_simple_∃" "simple_∃_equation_conv";
	val (xnm,xty) = dest_var x;
	val (following_∃, bdy') = strip_simple_∃ bdy;
	val rhs_ok = frees bdy' drop (fn xx => xx =$ x);
	fun aux_eq_usage binders tm = (
		case (dest_term tm) of
		DEq (tm1,tm2) => (if tm1 =$ x andalso
				(all (frees tm2) (fn xx => present (op =$) xx rhs_ok))
			then Value tm2
			else if tm2 =$ x andalso
				(all (frees tm1) (fn xx => present (op =$) xx rhs_ok))
			then Value tm1
			else Nil)
		| D⇔ (tm1,tm2) => (if tm1 =$ x andalso
				(all (frees tm2) (fn xx => present (op =$) xx rhs_ok))
			then Value tm2
			else if tm2 =$ x andalso
				(all (frees tm1) (fn xx => present (op =$) xx rhs_ok))
			then Value tm1
			else Nil)
		| D∃(vs,bdy) => (let val vss = strip_pair vs
			in
			if present (op =$) x vss
			then Nil
			else aux_eq_usage (vss @ binders) bdy
			end)
		| D∀(vs,bdy) => (let val vss = strip_pair vs
			in
			if present (op =$) x vss
			then Nil
			else aux_eq_usage (vss @ binders) bdy
			end)
		| D∧(tm1,tm2) => (case (aux_eq_usage binders tm1) of
			Nil => aux_eq_usage binders tm2
			| vx => vx)
		| DVar (anm,aty) => (if anm = xnm andalso aty =: xty
			then Value mk_t
			else Nil)
		| D¬ arg =>  (if arg =$ x
			then Value mk_f
			else Nil)
		| _ => Nil
		);
	val witness = case (aux_eq_usage [] bdy') of
		Value wit => wit
		| Nil => term_fail "simple_∃_equation_conv" 58013 [mtm];
	val frees_witness = frees witness;
	val (move_out,keep_in) = two_way (fn y => present (op =$) y frees_witness) following_∃;
in
=TEX
We need some manipulations if the existentials require reordering:
=SML
	(
	(fn cnv =>
	if not (is_nil move_out)
	then ((∃_reorder_conv (list_mk_simple_∃((move_out @ [x] @ keep_in), bdy'))
		THEN_C (N_SIMPLE_BINDER_C(length move_out) cnv )))
	else cnv)
=TEX
Now the bit that assumes the existentials are in the right order:
=SML
(fn mtm' =>
let	val work_on_bdy = list_mk_simple_∃(keep_in, bdy');
	val work_on_tm = mk_simple_∃ (x, work_on_bdy);
	val side_effect = if mtm' =$ work_on_tm
		then ()
		else term_fail "oops-simple_∃_equation_conv" 0 [mtm];
	val new_term = var_subst [(witness,x)] work_on_bdy;
	val new_term_rw = (TRY_C rwc) new_term;
	val new_term' = snd(dest_eq(concl new_term_rw));
	val thm = tac_proof(([],mk_⇔(work_on_tm,new_term')),
		⇔_T2 (fn thm =>
		t_tac ORELSE
		conv_tac(fn ag => eq_sym_rule new_term_rw)
		THEN
		SIMPLE_∃_THEN ante_tac thm
		THEN (
=TEX
we know what the introduced variable is by the following means
(based on implementation of $SIMPLE\_∃\_THEN$):
=SML
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
		))
		handle complaint =>
		if area_of complaint = "tac_proof"
		then term_fail "simple_∃_equation_conv" 58022 [mtm,witness]
		else reraise complaint (area_of complaint);
in
	eq_trans_rule (refl_conv mtm') thm
end)
)
mtm
end
handle complaint =>
divert complaint "tac_proof" "simple_∃_equation_conv" 58013
	[fn () => string_of_term mtm]);
end;
=IGN
simple_∃_equation_conv ⌜∃ f ⦁ f ⇔ T⌝;
simple_∃_equation_conv ⌜∃ f ⦁ x ⇔ f⌝;
simple_∃_equation_conv ⌜∃ f ⦁ a = f⌝;
simple_∃_equation_conv ⌜∃ f ⦁ f = a⌝;
simple_∃_equation_conv ⌜∃ f ⦁ (a = f) ∧ f g⌝;
simple_∃_equation_conv ⌜∃ f ⦁ ∀ z ⦁ (z h ∧ (a = f) ∧ z f) ∧ f g⌝;
simple_∃_equation_conv ⌜∃ f ⦁ ∀ z x ⦁ (z h ∧ (a = f) ∧ z (f x)) ∧ (∀ g ⦁ f g) ⌝;
simple_∃_equation_conv ⌜∃ f g h ⦁ (f = g x) ∧ h x⌝; (* fail *)
simple_∃_equation_conv ⌜∃ f h g ⦁ (f = g x) ∧ h x⌝; (* fail *)
simple_∃_equation_conv ⌜∃ f ⦁ (f x = g) ∧ h x⌝; (* fail *)
simple_∃_equation_conv ⌜∃ f ⦁ f ∧ p x⌝;
simple_∃_equation_conv ⌜∃ f ⦁ ¬ f ∧ p x⌝;
=TEX
\subsubsection{Special Cases of Equations}
$∃\_equation\_conv$ does not handle the special cases of, e.g., $⌜∃\ f⦁\ f\ x\ ⇔\ T⌝$, where $x$ is a redundant argument, because more
general cases don't work - e.g. consider:
=GFT
∃ f ⦁ (f x ⇔ T) ∧ p x f

which is not equal to (but only implied by):

p x (λ y ⦁ T)
=TEX
The following conversion handles a few of these special
cases, namely those in which the body is
(perhaps implicitly) only an equation.
=SML
local
	val rw_tac = (prim_rewrite_tac	
	(make_net(flat(map (cthm_eqn_cxt initial_rw_canon)
		[eq_rewrite_thm, ¬_rewrite_thm, ∃_rewrite_thm, ∀_rewrite_thm])))
		initial_rw_canon
		Nil
		TOP_MAP_C
		[(⌜(λ x ⦁ y)z⌝,simple_β_conv)]
		[]);

	fun is_redundant_args frees_bdy tm1 tm2 x = (
	let	val (x',args) = strip_app tm1;
	in
		x' =$ x andalso
		(let	val ftm2 = frees tm2
		in
		not(any (frees tm1) (fn x => present (op =$) x ftm2))
		andalso
		all ftm2 (fn xx => present (op =$) xx frees_bdy)
		end)
	end);

	fun do_redundant_args tm1 tm2 x = (
	let	val (x',args) = strip_app tm1;
	in
		list_mk_simple_λ(gen_vars(map type_of args) [tm2], tm2)
	end);
=TEX
=SML
in
val simple_∃_equation_conv1: CONV = (fn mtm =>
let	val (x,bdy) = dest_simple_∃ mtm;
	val (following_∃, bdy') = strip_simple_∃ bdy;
	val frees_bdy = frees bdy';
	fun  aux tm = (case (dest_term tm) of
		DEq (tm1,tm2) => (
			if is_redundant_args frees_bdy tm1 tm2 x
			then do_redundant_args tm1 tm2 x
			else if is_redundant_args frees_bdy tm2 tm1 x
			then do_redundant_args tm2 tm1 x
			else term_fail "simple_∃_equation_conv1" 0 [mtm]
		) | D⇔ (tm1,tm2) => (
			if is_redundant_args frees_bdy tm1 tm2 x
			then do_redundant_args tm1 tm2 x
			else if is_redundant_args frees_bdy tm2 tm1 x
			then do_redundant_args tm2 tm1 x
			else term_fail "simple_∃_equation_conv1" 0 [mtm]
		) | D∃(vs,bdy) => (let val vss = strip_pair vs
			in
			if present (op =$) x vss
			then term_fail "simple_∃_equation_conv1" 0 [mtm]
			else aux bdy
			end
		) | D∀(vs,bdy) => (let val vss = strip_pair vs
			in
			if present (op =$) x vss
			then term_fail "simple_∃_equation_conv1" 0 [mtm]
			else aux bdy
			end
		) | D¬ arg => (
			if is_redundant_args frees_bdy arg mk_f x
			then do_redundant_args arg mk_f x
			else term_fail "simple_∃_equation_conv1" 0 [mtm]
		) | DApp _ => (
			if is_redundant_args frees_bdy tm mk_t x
			then do_redundant_args tm mk_t x
			else term_fail "simple_∃_equation_conv1" 0 [mtm]
		) | DVar _ => (
			if is_redundant_args frees_bdy tm mk_t x
			then do_redundant_args tm mk_t x
			else term_fail "simple_∃_equation_conv1" 0 [mtm]
		) | _ => term_fail "simple_∃_equation_conv1" 0 [mtm]);
	val witness = aux bdy';
in
	((∃_reorder_conv (list_mk_simple_∃(following_∃ @ [x], bdy')))
	THEN_C
	(LAST_SIMPLE_∃_C (fn mtm' =>
		tac_proof(([],mk_⇔(mtm',mk_t)),
		⇔_t_tac THEN
		simple_∃_tac witness THEN
		(rw_tac ORELSE_T t_tac))))
	THEN_TRY_C
	(local_pure_rewrite_conv [∃_rewrite_thm]))
	mtm
end);
end;
=IGN
simple_∃_equation_conv1 ⌜∃ f g ⦁ f x = T⌝;
simple_∃_equation_conv1 ⌜∃ f ⦁ T = f x⌝;
simple_∃_equation_conv1 ⌜∃ f h ⦁ f h⌝;
simple_∃_equation_conv1 ⌜∃ f h ⦁ ¬ f h⌝;
simple_∃_equation_conv1 ⌜∃ f ⦁ f⌝;
simple_∃_equation_conv1 ⌜∃ f ⦁ ¬ f⌝;
simple_∃_equation_conv1 ⌜∃ f ⦁ ∀ a ⦁ ∃ b ⦁ f a b⌝;
simple_∃_equation_conv1 ⌜∃ f ⦁ ∀ a ⦁ ∃ b ⦁ g = f a b⌝;
simple_∃_equation_conv1 ⌜∃ f g ⦁ ∀ a ⦁ ∃ b ⦁ g = f a b⌝;
simple_∃_equation_conv1 ⌜∃ f ⦁ ∀ a ⦁f = a⌝; (* fails, as is proper *)
=TEX
\subsubsection{Pulling out the Argument to the Existential Quantifier}
A call to the following function by $∃\_proof\_by\_body\_conv$ merely
indicates the possibility of success, and the maximum level of
success achievable (i.e. how many arguments may be removed).

In this version we will assume the term is of the form:
=GFT
∃ f ⦁ ∃ x1 ... xn ⦁
	(∀ ... a ... ⦁ P(f a, a)) ∧
	(∀ ... b ... ⦁ Q(f b, b)) ∧
	...
=TEX
This may be achieved, if at all, by $∃\_C$ $simple\_∀\_∧\_conv$,
and may be done in the calling function.

We wish to reach the form:
=GFT
∃ x1 ... xn ⦁ ∃ f ⦁ ∀ x ⦁
	(∀ ... ... ⦁ P(f x, x)) ∧
	(∀ ... ... ⦁ Q(f x, x)) ∧
	...
=TEX
at which point we can use $simple\_∃\_∀\_conv1$.

We will go a few steps further and manage types with only a single data constructor ($×$ is the only immediately obvious case), if we have a theorem and projection functions of the form:
=GFT
⊢ ∀ x ⦁ DataConstructor (Proj1 x) (Proj2 x) ... = x
⊢ ∀ x1 ... ⦁ Proj1(DataConstructor x1 ...) = x1
⊢ ∀ x1 x2 ... ⦁ Proj2(DataConstructor x1 x2 ...) = x2
=TEX
Incorporate $×$ into the functions knowledge space:
=SML
val ⦏pair_rewrite_thm⦎ = tac_proof(([],⌜∀ x y p ⦁
	Fst (x, y) = x ∧ Snd (x, y) = y ∧
	(Fst p, Snd p) = p⌝),
	rewrite_tac[pair_clauses]);


=TEX
Process the functions knowledge space:
=SML
fun ⦏dc_simps⦎ (foc : string list) = (
	flat(map (fn (_,(_,thm)) =>
	initial_rw_canon thm)
	(filter (fn (nm,_) => nm mem foc)
	(current_ad_∃_vs_thms())))
);
=TEX
This auxiliary function tests that we can handle the argument
provided, with the current $SDCS$:
=SML
fun ⦏can_handle⦎ tm = (
	is_var tm orelse
	(let val (dc,args) = strip_app tm
	in
	is_const dc andalso
	(let val nmdc = fst(dest_const dc)
	in
	any (current_ad_∃_vs_thms()) (fn (nm,_) => nm = nmdc)
	end) andalso
	all args can_handle
	end)
);
=TEX
Given a list of boolean values, how many initial $true$'s are there:
=SML
fun ⦏n_true⦎ [] = 0
| n_true (true :: x) = 1 + n_true x
| n_true _ = 0;
=TEX
Find the first usage of $f$ in term $mtm$.
The context $mcxt$ is the current usage of $f$, if $mtm$
should prove to be of the form $f$ $arg_1$ $arg_2$ $\ldots$
(with possibly 0 arguments).
=SML
fun ⦏an_f⦎ f mcxt mtm = (
let 	val (fnm,fty) = dest_var f
	fun aux cxt tm  = (
	case (dest_simple_term tm) of
	Var (anm,aty) => (if anm = fnm andalso aty =: fty
		then Value cxt
		else Nil
	) | Const _ => Nil
	| App (tm1,tm2) => (
		let val cxts1 = aux cxt tm1
		in
			case cxts1 of
			Value _ => cxts1
			| Nil => aux tm2 tm2
		end)
	| Simpleλ(y,tm1) => (if y =$ f
		then Nil
		else aux tm1 tm1)
	)
in
	aux mcxt mtm
end);

=TEX
Find the first usage of $f$ in term $mtm$, where it
is applied to either a constant or an application.
The context $mcxt$ is the current usage of $f$, if $mtm$
should prove to be of the form $f$ $arg_1$ $arg_2$ $\ldots$
(with possibly 0 arguments).
=SML
local
	fun is_fst_arg_dc tm = (
	let	val (_,args) = strip_app tm;
		val fst_arg = hd args;
	in
		is_app fst_arg orelse is_const fst_arg
	end);
in
fun ⦏an_f_dc⦎ f mcxt mtm = (
let 	val (fnm,fty) = dest_var f
	fun aux cxt tm  = (
	case (dest_simple_term tm) of
	Var (anm,aty) => (if anm = fnm andalso aty =: fty
			andalso is_fst_arg_dc cxt
		then Value cxt
		else Nil
	) | Const _ => Nil
	| App (tm1,tm2) => (
		let val cxts1 = aux cxt tm1
		in
			case cxts1 of
			Value _ => cxts1
			| Nil => aux tm2 tm2
		end)
	| Simpleλ(y,tm1) => (if y =$ f
		then Nil
		else aux tm1 tm1)
	)
in
	aux mcxt mtm
end);
end;
=TEX
This function expands any ``new'' arguments using projection functions stored in $SDCS$ to match the variables in the list of ``old'' arguments,
that may be embedded in data constructions.
It results in a substitution list (i.e. for $var\_subst$) for the old variables, in terms
of the new ones.
=SML
fun ⦏match_f_args⦎ (tml1:TERM list) (tml2:TERM list):(TERM * TERM) list = (
let	val cavs = current_ad_∃_vs_thms();
	fun aux ([]:TERM list) ([]:TERM list):(TERM * TERM) list = []
	| aux (new :: nrest) (old :: orest) = (
	if is_var old
	then (new, old) :: aux nrest orest
	else (let val (dc,bits) = strip_app old;
		val (projs,thm) = lassoc3 cavs
			(fst(dest_const dc));
	in
		aux ((map (fn x => match_mk_app(x,new)) projs)
			@ nrest)
			(bits @ orest)
	end)
	)| aux _ _ = fail "match_f_args" 0 [];
in
	aux tml1 tml2
end);
=TEX
The following handles the case of a first argument being a pair that has constants embedded
in as well.
=SML
local
	val gen_f = ⓣ'a × 'b → 'c⌝;
	val rwc = local_pure_rewrite_conv [
		tac_proof(([],⌜∀ x y f a ⦁
			(Uncurry f (x,y) = f x y) ∧
			(Uncurry f a = f (Fst a) (Snd a))⌝),
		rewrite_tac[pair_clauses])];
in
fun ⦏simple_∃_paired_arg_conv⦎ (usages: TERM list):CONV = (fn mtm =>
let	val sideeffect = if any usages (fn tm => is_pair(snd(dest_app tm)))
		then ()
		else term_fail"simple_∃_paired_arg_conv" 0 [];
	val (f,bdy) = dest_simple_∃ mtm;
	val P = mk_simple_λ(f, bdy);
	val s1 = inst_type_rule(type_match (type_of f) gen_f) ∃_uncurry_thm;
	val s2 = simple_∀_elim P s1;
	val f' = variant (frees bdy) f;
	val s3 = conv_rule(RAND_C(RAND_C (simple_α_conv
			(fst(dest_var f')))) THEN_C
		ONCE_MAP_C simple_β_conv THEN_C
		rwc) s2;
in
	eq_trans_rule (refl_conv mtm) s3
end);
end;
=TEX
This auxiliary function eliminates $∀$'s with either the
value associated with the bound variable in $alist$, or just
the bound variable itself.
=SML
local
fun lrassoc1 ((x, y) :: rest : (TERM * TERM) list) (what : TERM) : TERM = (
	if y =$ what
	then x
	else lrassoc1 rest what
) | lrassoc1 [] what = what;

in
fun ⦏opt_list_simple_∀_elim⦎ (alist:(TERM * TERM) list) (thm:THM): THM = (
let 	val (vs,_) = strip_simple_∀ (concl thm);
	val vs' = map (lrassoc1 alist) vs;
in
	list_simple_∀_elim vs' thm
end);
end;
=TEX
The following rearranges universals and conjunctions
(though the order of the conjunctions must not change),
to match a new term.
It handles certain forms of changing in paired structure of quantifiers.
=SML
fun ⦏local_rearrange_conv⦎ (f:TERM) (new_term:TERM) : CONV = (fn tm =>
	if tm ~=$ new_term
	then α_conv new_term tm
	else tac_proof(([],mk_⇔(tm,new_term)),
		let 	val cnsts = ((map fst (term_consts tm)) cup (map fst (term_consts new_term)));
			val ldc_simps = dc_simps cnsts;
			val prwc = local_pure_rewrite_conv ldc_simps;
			val prwr = conv_rule prwc;
			val prwt = conv_tac prwc;
		in
		⇔_T2
		(fn thm1 =>
		let val thm1s = strip_∧_rule thm1
		in
		REPEAT simple_∀_tac THEN
		COND_T(fn _ => length thm1s > 1)
			(REPEAT ∧_tac THEN REPEAT simple_∀_tac )
			(id_tac)
		THEN_LIST_T
		(map (fn thm => fn (seqasms,gl) =>
		let 	val conc = concl thm;
			val thm_fuse = case(an_f f conc conc) of
				Value tm => tm
				| Nil => mk_t;
			val gl_fuse = case(an_f f gl gl) of
				Value tm => tm
				| Nil => mk_t;
			val (_,match1) = term_match thm_fuse gl_fuse;
			val (omatch1,nmatch1) = split match1;
			val match2 = match_f_args nmatch1 omatch1;
			val thm' = opt_list_simple_∀_elim match2 thm;
			val thm'' = (prwr thm'
				handle (Fail _) => thm');
		in
			(TRY_T prwt THEN
			accept_tac thm'') (seqasms,gl)
		end)
		thm1s)
		end)
		(fn thm2 =>
		let val (ivs,bdy) = strip_simple_∀(concl thm2);
			val thm2s = if is_∧ tm
				then (map (list_simple_∀_intro ivs)
					(strip_∧_rule (all_simple_∀_elim thm2)))
				else [thm2];
		in
			REPEAT ∧_tac THEN
			REPEAT simple_∀_tac THEN_LIST_T
		(map (fn thm => fn (seqasms,gl) =>
		let 	val conc = concl thm;
			val thm_fuse = case(an_f f conc conc) of
				Value tm => tm
				| Nil => mk_t;
			val gl_fuse = case(an_f f gl gl) of
				Value tm => tm
				| Nil => mk_t;
			val (_,match1) = term_match gl_fuse thm_fuse;
			val thm' = opt_list_simple_∀_elim match1 thm;
			val thm'' = (prwr thm'
				handle (Fail _) => thm');
		in
			(TRY_T  prwt
			THEN accept_tac thm'') (seqasms, gl)
		end)
		thm2s)	
		end)
		end)
);
=IGN
local_rearrange_conv ⌜f:'a × 'b → 'a⌝ ⌜∀ x :'a × 'b ⦁ (f x = Fst x) ∧ (f x = Fst x) ∧ z⌝
⌜(∀ a b ⦁ f (a,b) = a) ∧ (∀ y ⦁ f y = Fst y) ∧ z⌝;

local_rearrange_conv ⌜f:'a × 'b → 'a⌝
	⌜∀ x :'a × 'b ⦁ (f x = Fst x)⌝
	⌜(∀ a b ⦁ f (a,b) = a)⌝;

=TEX
Given a list of usages of variable $f$, pull as many as possible universals
out of the body to which $f$ is existentially bound.

We make no attempt to determine which of the outer most existentials would make the best candidate to work on,
and the lack of this attempt
can mean the ordering of quantifiers affects how far $basic\_prove\_∃\_conv$ can progress.
=SML
fun ⦏simple_∃_varstruct_arg_conv⦎ (usages: TERM list): CONV = (
	fn (mtm: TERM) =>
let	val (f,bdy) = dest_simple_∃ mtm;
	val dest_f = dest_var f;
	val (following_∃, bdy') = strip_simple_∃ bdy;
	val stripped_usages = map (snd o strip_app) usages;
	val ch = map (map can_handle) stripped_usages;
	val tryupto = list_min(map n_true ch);
in
	if tryupto < 1
	then simple_∃_paired_arg_conv usages mtm
	else
(let	val base_xs = (hd stripped_usages) to (tryupto -1);
	val base_xs' = map (fn y => if is_var y
			then y
			else mk_var("x",type_of y)) base_xs;
=TEX
$xs$ will be the variables we pull out through $f$.
=SML
	val xs = list_variant (map mk_var(term_vars mtm)) base_xs';
=TEX
Now we form the new term:
=SML
	val conjs = full_strip_∧ bdy';

	fun process_conj conj = (
	let	val (vs, cbody) = strip_simple_∀ conj;
	in
		case (an_f f conj conj) of
		Nil => conj
		| Value fuse => (let val (f,args) = strip_app fuse;
			val args' = args to (tryupto -1);
			val substs = match_f_args xs args';
=TEX
The following conflates two substituitions (and not just variables as second of pairs), on the
grounds that the new (left) terms of the first substituition
do not contain the next initial (right) terms.
Note that in is the first matching substituition in a list
that is used.
=SML
			val ncbody = subst (combine xs args'@ substs) cbody;
			val fl_fs = (flat(map frees args'));
			val vs' = vs drop (fn xx => present (op =$) xx fl_fs);
		in
			list_mk_simple_∀(vs',ncbody)
		end)
	end);

	val new_conjs = map process_conj conjs;
	val new_body = list_mk_∧ new_conjs;
	val new_term = list_mk_simple_∀(xs,new_body);
=TEX
As we have a reasonable hope of succeeding, we shuffle
the existential quantifiers:
=SML
	val s1 = ∃_reorder_conv (list_mk_simple_∃(following_∃ @ [f], bdy'))
		mtm;
	val s2 = conv_rule(RAND_C(ALL_SIMPLE_∃_C
		(local_rearrange_conv f new_term))) s1;
	val s3 = conv_rule(RAND_C(LAST_SIMPLE_∃_C
		(all_simple_∃_∀_conv1 THEN_TRY_C redundant_simple_∀_conv))) s2;
in
	s3
end)
end);
=TEX
\subsubsection{Handling Clausal Definitions}
This auxiliary adds a value to the head of the last of a list of lists.
=SML
fun ⦏add_to_last⦎ vl [a] = [(vl :: a)]
| add_to_last vl (a :: x) = a :: add_to_last vl x
| add_to_last vl [] = fail "add_to_last" 0 [];
=TEX
In the following we are passed the applications of the function
applied to an argument which is either a constant
or an application.
One of these must either be ``recognised'' (by matching a member of the $dc\_recog$ list), or we assume that we cannot
handle this case.
=SML
fun ⦏add_to_named⦎ (dc_recog :: dc_recogs) (conjs :: conjsl) fst_arg conj = (
	if ((term_match fst_arg dc_recog;true)
		handle Fail _ => false)
	then ((conj :: conjs) :: conjsl)
	else (conjs :: add_to_named dc_recogs conjsl fst_arg conj)
)
| add_to_named _ _ _ conj = term_fail "add_to_named" 0 [conj];
=TEX
For each item of clausal definition material we hold:
\begin{enumerate}
\item
The list of data constructor recognisers.
These are the generic terms which must be matchable to the actual argument.
\item
The number of free variables there should be in the use of the constructor (e.g. 2 for $Cons$, 0 for $Nil$).
\item
An instance of the most general type of the function's argument.
\item
A list of dummy arguments for each ``constructor'', to allow dummy
conjuncts to be created.
\item
The actual theorem.
The theorem is an equation, whose LHS is of the form:
\begin{itemize}
\item
Universally quantify by one predicate per ``constructor'',
\item
Existentially quantify by function, $f$,
\item
one conjunct per constructor, in same order as predicates.
\item
Each conjunct will universally quantified in the order that
the free variables of the subterm to which $f$ is first applied, that is a recognised argument by the data constructor
recogniser.
\item
The body of the conjunct will be the associated predicate
applied to each available use of $f$ and its arguments,
the first being the recognised argument.
\end{itemize}

\end{enumerate}
These are calculated from a clausal definition theorem by:
=SML
local
	val aux_thm = tac_proof(([],⌜∀ p q ⦁ (p ⇔ (q ∨ pp'TS p)) ⇔ (q ⇒ p)⌝),
		rewrite_tac[pp'ts_def] THEN
		REPEAT strip_tac);
	val stored_build_predicates_pc = pending_push_pc "build_predicates";
in
fun ⦏evaluate_∃_cd_thm⦎ (thm : THM) = (
let	val (new_fns,ue) = strip_∀ (concl thm);
	val all_nf = flat(map strip_pair new_fns);
	val (f,bdy) = dest_simple_∃ ue handle _ => dest_simple_∃⋎1 ue;
	val conjs = full_strip_∧ bdy;
	fun aux conj = (
	let	val (vs,bdy) = strip_∀ conj;
		val (lhs,rhs) = dest_eq bdy;
		val (f',recog) = dest_app lhs;
		val sideeffect = if f =$ f'
			then ()
			else thm_fail "evaluate_∃_cd_thm" 58009 [thm];
		val (nf,args) = strip_app rhs;
		val sideeffect = if present (op =$) nf all_nf
			then ()
			else thm_fail "evaluate_∃_cd_thm" 58023 [thm];
	in
		(recog, (lhs :: args), nf)
	end);
	val proc_conjs = map aux conjs;
	val preds = gen_vars (BOOL :: (map (fn (_,xs,_) =>
		list_mk_→_type(map type_of xs @ [BOOL]))
		proc_conjs))
 		[concl thm];
	val other_pred = hd preds;
	val preds' = tl preds;
	val preds_conjs = combine preds' proc_conjs;
	val tm1 = list_mk_∧(map (fn (pred,(recog,args,_)) =>
		list_mk_simple_∀(rev(frees recog),
			list_mk_app(pred,args)))
		preds_conjs
		@ [other_pred]);
	val tm2 = mk_simple_∃(f, tm1);
	fun aux1 (pred,(recog,args,_)) = (
	let	val gvs = gen_vars (map type_of args) (pred :: args);
	in
		list_mk_simple_∀(tl gvs,
			mk_simple_∃(hd gvs,
			list_mk_app(pred, gvs)))
	end);
	val tm3 = list_mk_∧((map aux1 preds_conjs) @ [other_pred]);
	val tm4 = mk_∨(tm3, mark tm2);
	val tm5 = list_mk_simple_∀(preds' @ [other_pred],
		mk_eq(tm2,tm4));
	fun mk_spec (pred,(recog,args,_)) = (
	let	val gvs_args = gen_vars(map type_of args)[pred];
	in
		list_mk_simple_λ(tl gvs_args,
		mk_ε(hd gvs_args,
		list_mk_app(pred,gvs_args)))
	end);
	val thm_specs = map (fn bdr =>
		mk_spec(find preds_conjs (fn (_,(_,_,abdr)) => bdr =$ abdr)))
		new_fns
		handle Fail _ => thm_fail "evaluate_∃_cd_thm" 58024 [thm];
=TEX
Now prove the theorem whose conclusion we have just generated.
Do this in the (temporary) proof context ``build$\_$predicates'', not the current one.
=SML
	val dummy = stored_build_predicates_pc();
	val cd_thm = tac_proof((asms thm,tm5),
		pure_rewrite_tac[aux_thm] THEN
		REPEAT ∀_tac THEN
		⇒_T(fn athm => MAP_EVERY_T asm_tac (strip_∧_rule athm)) THEN
		strip_asm_tac (list_simple_∀_elim thm_specs thm) THEN
		simple_∃_tac f THEN asm_rewrite_tac[] THEN
		REPEAT (∧_tac ORELSE_T simple_∀_tac) THEN
		(fn (seqasms,gl) =>
		(let val (pred,args) = strip_app gl;
		in
		DROP_ASM_T (find seqasms (fn asm =>
			let val (_,bdy) = strip_∀ asm;
				val (_,bdy') = dest_simple_∃ bdy;
				val (pred',_) = strip_app bdy'
			in
				pred =$ pred'
			end
			handle Fail _ => false))
			(rewrite_thm_tac o ∃_ε_rule o
			list_simple_∀_elim(tl args))
		end) (seqasms,gl)))
		handle complaint =>
		(pop_pc();
		raise complaint);
	val dummy = pop_pc();
	val recogs = map (fn (x,_,_) => x) proc_conjs;
	val nfrees_recogs = map (length o frees) recogs;
	val gen_f = type_of f;
	val dummies = map (rev o frees) recogs;
in
	(recogs, nfrees_recogs, gen_f, dummies, cd_thm)
end
handle complaint =>
list_divert complaint "evaluate_∃_cd_thm"
	[("dest_simple_∃⋎1",58007,[fn () => string_of_thm thm]),
	("dest_app",58008,[fn () => string_of_thm thm]),
	("dest_eq",58008,[fn () => string_of_thm thm]),
	("tac_proof",58021,[fn () => string_of_thm thm])
	]
);
end;
=TEX
We now extend the evaluation of proof contexts with this function:
=SML
val _ = pp'set_eval_ad_∃_cd_thms (map evaluate_∃_cd_thm);
=TEX
Now continue with the main strand of the document:
=SML
fun ⦏find_recursion_candidate⦎ (usages : TERM list) = (
let	val good_use = find usages
		(fn tm =>
		((let val fst_arg = hd(snd(strip_app tm));
		in
		is_app fst_arg orelse is_const fst_arg
		end)
		handle Fail _ => false));
	val rarg = hd(snd(strip_app good_use));
	val poss_cand = find (current_ad_∃_cd_thms())
		(fn (recogs,_,_,_,_) =>
		any recogs (fn recog =>
			((term_match rarg recog; true) handle Fail _ => false)));
in
	poss_cand
end
handle complaint =>
list_divert complaint "find_recursion_candidate"
	[("hd",0,[]),
	 ("find",0,[])]
);
=TEX
Given a recursion theorem of our desired particular form, and a term modified to be in the right
form, get the theorem instantiated to the right form to serve as a
result of a conversion.
=SML
fun ⦏simple_∃_cd_thm_conv⦎ (rthm : THM) : CONV = (fn tm =>
let	val (f,bdy) = dest_simple_∃ tm;
	val fname = fst(dest_var f);
	val conjs = strip_∧ bdy;
	val (lhs,rhs) = dest_eq(snd(strip_simple_∀(concl rthm)));
	val (ft,bdyt) = dest_simple_∃ lhs;
	val ftname = fst(dest_var ft);
	val new_rthm = inst_type_rule (fst(term_match f ft)) rthm;
	val new_rthm' = conv_rule (ONCE_MAP_C
		(COND_C (fn tm => is_simple_λ tm andalso
			fst(dest_var(fst(dest_simple_λ tm))) = ftname)
		(simple_α_conv fname)
		(fail_conv))) new_rthm;
	val (lhs',rhs') = dest_eq(snd(strip_simple_∀(concl new_rthm')));
	val (ft',bdyt') = dest_simple_∃ lhs';
	val conjst = strip_∧ bdyt';
	val sideeffect = if f =$ ft'
		then ()
		else term_fail "simple_∃_cd_thm_conv" 0 [tm];
=TEX
Get the predicates by matching the conjuncts:
=SML
	val avoid = map mk_var (term_vars tm);
	fun get_pred (conj, conjt) = (
	let	val (vs,cbdy) = strip_simple_∀ conj;
		val (vst,cbdyt) = strip_simple_∀ conjt;
		val renames = combine (vs to (length vst -1)) vst;
		val conj' = strip_n_simple_∀ (length vst) conj;
		val args = snd(strip_app cbdyt);
		val rnargs = map (var_subst renames) args;
		val gvs = gen_vars (map type_of args) avoid;
	in
		list_mk_simple_λ (gvs,subst (combine gvs rnargs) conj')
	end);
	val preds = map get_pred (combine conjs conjst);
	val snd_thm = conv_rule(TRY_C all_simple_β_conv)
		 (list_simple_∀_elim preds new_rthm');
	val fst_thm = TRY_C all_simple_β_conv tm;
in
	eq_trans_rule fst_thm snd_thm
end);

=TEX
We will wish to prove something that is pretty much an arbitrary
redistribution of conjunctions and simple universals:
=SML
local
	val lrrc_canon = REWRITE_CAN
		(REPEAT_CAN
		(simple_∀_rewrite_canon ORELSE_CAN ∧_rewrite_canon)
		THEN_CAN (fn thm => [⇔_t_intro thm]));
	val rw_tac = (prim_rewrite_tac (make_net
		(map thm_eqn_cxt (initial_rw_canon ∧_rewrite_thm)))
		lrrc_canon
		Nil
		Combinators.I
		[]);
in
fun ⦏local_recursion_rearrange_conv⦎ (new_tm : TERM) : CONV = (fn tm =>
	tac_proof(([],mk_⇔(tm,new_tm)),
	⇔_T(fn thm =>
	let val rw_tac' = rw_tac [thm]
	in
	(REPEAT (∧_tac ORELSE_T ∀_tac)
	THEN (TRY_T rw_tac') THEN t_tac)
	end))
);
end;
=TEX
We now come to the main function for handling recursion and case splits.

When looking for a use of $f$ for $simplify\_∃\_by\_recursion$ that is applied to an argument we may be looking
at a recursive call, or at the results of the call:
e.g. in:

=GFT
∀ x ⦁ f (n + 1) = n * f n
=TEX

$⌜f(n+1)⌝$ is the recursive call, and $⌜f n⌝$ the result.
These multiple possibilities makes it pretty much impossible to do a cheap check on the usages of $f$:
we just ``suck it and see''.
=IGN
val usages = [⌜(f : 'a LIST → BOOL) (Cons a x)⌝,
	⌜(f : 'a LIST → BOOL) x⌝,
	⌜(f : 'a LIST → BOOL) Nil⌝];
val mtm = ⌜∃ f ⦁ (∀ a x ⦁ f (Cons a x) ⇔ (g a x ∧ f x))
	∧ (∃ a x ⦁g a x) ∧ (T = f Nil)⌝;

val usages = [⌜(ff : 'c LIST → BOOL) (Cons r q)⌝,
	⌜(ff : 'c LIST → BOOL) q⌝,
	⌜(ff : 'c LIST → BOOL) Nil⌝];
val mtm = ⌜∃ ff⦁ (∀ p q r⦁ ff (Cons r q) ⇔ g p q r ∧ ff q) ∧
	(∀ s ⦁ ∃ a x s⦁ g a x s) ∧ (∀ t ⦁ t ⇔ ff [])⌝;

=SML
fun ⦏simple_∃_rec_arg_conv⦎ (usages: TERM list) = (fn (mtm: TERM) =>
let	val (f,bdy) = dest_simple_∃ mtm;
	val dest_f = dest_var f;
	val (following_∃, bdy') = strip_simple_∃ bdy;
	val (dc_recogs,nvars_list,generic_f,dummy_vars_list,cand_thm) =
		(find_recursion_candidate usages);
=TEX
Now we form the new term:
=SML
	val conjs = full_strip_∧ bdy';
=TEX
We wish to partition the conjuncts by data constructor,
while moving the quantifiers around, so that the free variables in the arguments
to the data constructor are on the outside.
The last partition is for conjuncts not containing
any uses of the quantified variable.
=SML
	val init_conj_lists = [] :: map (fn x => []) dc_recogs;

	fun process_conjs conj_lists [] = conj_lists
	| process_conjs conj_lists (conj :: rest) = (
	process_conjs (
	let	val (vs, cbody) = strip_simple_∀ conj;
	in
		case (an_f_dc f conj conj) of
		Nil => add_to_last conj conj_lists
		| Value fuse => (
		let 	val (f,args) = strip_app fuse;
			val fst_arg = hd args;
			val fst_arg_frees = rev(frees fst_arg);
			val new_conj = list_mk_simple_∀(fst_arg_frees @
				(vs drop (fn xx => present (op =$) xx fst_arg_frees)), cbody);
		in
			add_to_named dc_recogs
				conj_lists
				fst_arg
				new_conj
		end)
	end)
	rest);
	val new_conjs = process_conjs init_conj_lists conjs;
=TEX
Group together the partitioned conjuncts, bring out the ``common'' quantified
variables.
=SML
	val specific_types = type_match (type_of f) generic_f;

	fun group_conjs (nvars :: nvarsl) (dummy_vars:: dummy_varsl) (conjs :: conjsl) = (
		(
		if is_nil conjs
		then list_mk_simple_∀ ((map (inst [] specific_types) dummy_vars),mk_t)
		else (let val (vs1,_) = strip_simple_∀ (hd conjs);
			val initial_vs = vs1 to (nvars -1);
			fun rename_conj conj = (
			let val (vs,bdy) = strip_simple_∀ conj;
				val init_vs = vs to (nvars -1);
			in
				var_subst(combine initial_vs init_vs)
					(list_mk_simple_∀(vs from nvars,bdy))
			end);
			val nconjs = map rename_conj conjs;
		in
			list_mk_simple_∀(initial_vs,list_mk_∧ nconjs)
		end)) ::
		group_conjs nvarsl dummy_varsl conjsl
	)
	| group_conjs _ _ [no_fs] = (
		if is_nil no_fs
		then [mk_t]
		else [list_mk_∧ no_fs]
	) | group_conjs _ _ _ = fail "group_conjs" 0 [];
	val new_conjs1 = group_conjs nvars_list dummy_vars_list new_conjs;	
	val new_body = list_mk_∧ new_conjs1;
	val new_term = mk_simple_∃(f,new_body);
=TEX
As we have a reasonable hope of succeeding, we shuffle
the existential quantifiers:
=SML
	val s1 = ∃_reorder_conv (list_mk_simple_∃(following_∃ @ [f], bdy'))
		mtm;
	val s2 = conv_rule(RAND_C(ALL_SIMPLE_∃_C
		(local_recursion_rearrange_conv new_body))) s1;
	val s3 = conv_rule(RAND_C(LAST_SIMPLE_∃_C
		(simple_∃_cd_thm_conv cand_thm))) s2;
in
	s3
end);
=TEX

\subsubsection{Controlling Function for Quantifier Context}
This function calls the appropriate subsidiary function,
based on the uses of the existentially
quantified variable within the body of the term.

Incidentally, successful looking for usage is bound to fail
if an equality is available for $∃\-\_equation\-\_conv$.
Note that if any usage is not applied to some argument
then the approach cannot succeed, so we fail immediately.
=SML
val ⦏simple_∃_arg_conv⦎ : CONV = (fn mtm =>	
let	val (x,bdy) = dest_simple_∃ mtm;
	val (xnm,xty) = dest_var x;
	fun aux_usage cxt tm = (
		case (dest_simple_term tm) of
		Var (anm,aty) => (if xnm = anm andalso xty =: aty
			then [cxt]
			else []
		) | Const arg => []
		| App (tm1,tm2) => (
			let val cxts1 = aux_usage cxt tm1
			in
				cxts1 @ aux_usage tm2 tm2
			end)
		| Simpleλ(y,tm1) => (if y =$ x
			then []
			else aux_usage tm1 tm1)
	);
	val usages = aux_usage mtm bdy;
in
	((COND_C (fn _ => present (op =$) x usages) (fail_conv)
		(simple_∃_varstruct_arg_conv usages))
	AND_OR_C
	(simple_∃_rec_arg_conv usages)
	AND_OR_C
	(fn _ => term_fail "simple_∃_arg_conv" 0 [mtm]))
	mtm
end
handle complaint =>
divert complaint "dest_simple_∃ mtm" "simple_∃_arg_conv" 0
	[fn () => string_of_term mtm]);
=IGN
simple_∃_arg_conv ⌜∃ f ⦁ ∀ x ⦁ f x⌝;
simple_∃_arg_conv ⌜∃ f ⦁ (∀ x ⦁ f x = g) ∧ (∀ y ⦁ h (f  y))⌝;
simple_∃_arg_conv ⌜∃ f g h ⦁ (∀ x ⦁ f x = g) ∧ (∀ y ⦁ h (f  y))⌝;
simple_∃_arg_conv ⌜∃ f h ⦁ (∀ x g ⦁ f x = g) ∧ (∀ z y ⦁ h (f  y z))⌝;
simple_∃_arg_conv ⌜∃ f g h ⦁ (∀ x y z ⦁ f x y z = g y z x) ∧ (∀ a b c ⦁ h (f c a) b)⌝;
simple_∃_arg_conv ⌜∃ f ⦁ (∀ a b c p ⦁ f (a,(b,c)) p ⇔ Fst a ∧ c ∧ p) ∧
		(∀ d e g p ⦁ f ((d,e),g) p ⇔ Snd g ∧ p ∧ d)  ∧
		(∀ a g q ⦁ f(a,g) q ⇔ q ∧ Snd g ∧ Fst a)⌝;
simple_∃_arg_conv ⌜∃ f ⦁ (∀ a b c p ⦁ (f (a,(b,c)) p ⇔ Fst a) ∧ c ∧ p)⌝;

simple_∃_arg_conv ⌜∃ f⦁ (∀ a x⦁ f (Cons a x) ⇔ g a x ∧ f x) ∧
	(∃ a x⦁ g a x) ∧ (T ⇔ f [])⌝;
simple_∃_arg_conv ⌜∃ ff⦁ (∀ p q r⦁ ff (Cons r q) ⇔ g p q r ∧ ff q) ∧
	(∀ s ⦁ ∃ a x s⦁ g a x s) ∧ (∀ t ⦁ t ⇔ ff [])⌝;
simple_∃_arg_conv ⌜∃ f ⦁∀ a x ⦁ f (Cons a x) = a⌝;
simple_∃_arg_conv ⌜∃ f ⦁∀ x ⦁ f (0,x) = x⌝;

=TEX

\subsection{The Main Function}
When implementing the following we use our knowledge of
when it is worth reapplying processors, and when
things are ``once off''.

Note that $simple\_∃\_∧\_conv$ can spoil $∃\-\_proof\-\_by\-\_body\-\_conv$,
by masking conjunctions.
=SML
val (⦏basic_prove_∃_conv⦎ : CONV) = (fn (tm : TERM) =>
let	fun aux tm = (
let	fun move_in_conv ltm = (case (dest_term ltm) of
		D∃ _ => aux ltm
		| D∀ (vs,_) => (
			(COND_C (fn _ => is_pair vs)
			 all_∀_uncurry_conv fail_conv)
			AND_OR_C
			(∀_∧_conv THEN_TRY_C move_in_conv)
			ORELSE_C
			(ALL_SIMPLE_∀_C move_in_conv
			THEN_TRY_C redundant_simple_∀_conv)) ltm
		| D∧ _ => ALL_∧_C move_in_conv ltm
		| D∨ _ => ALL_∨_C move_in_conv ltm
=IGN
		| D⇒ _ => ((simple_eq_match_conv local_⇒_thm)
			THEN_C move_in_conv) ltm
=SML
		| _ => fail_with_conv "aux-pass through" ltm);
in
(
	(if is_∃ tm
	then
	(all_∃_uncurry_conv
	AND_OR_C
	(redundant_simple_∃_conv
=IGN
	AND_OR_C
	(ALL_SIMPLE_∃_C (simple_eq_match_conv local_⇒_thm))
=SML
	AND_OR_C
	(simple_∃_∨_conv THEN_TRY_C move_in_conv)
	ORELSE_C
	((REPEAT_C1 simple_∃_equation_conv)
	AND_OR_C
	(simple_∃_equation_conv1
	ORELSE_C
	(ALL_SIMPLE_∃_C ∀_∧_conv
	AND_OR_C
	((simple_∃_arg_conv THEN_TRY_C move_in_conv)
	ORELSE_C
	((simple_∃_∧_conv THEN_TRY_C move_in_conv)
	ORELSE_C
	((SIMPLE_BINDER_C move_in_conv THEN_TRY_C aux)
	ORELSE_C (fn _ => term_fail "basic_prove_∃_conv" 58002 [tm])))))))))
		(* we know its an ∃ *)
	else term_fail "basic_prove_∃_conv" 58001 [tm])
	tm
)
end);
in
	(aux THEN_TRY_C local_pure_rewrite_conv[pp'ts_def]) tm
end);

=TEX
Now a rule and tactic that will only succeed if its term argument
can be proven.
=SML
fun ⦏basic_prove_∃_rule⦎ (tm : TERM) : THM = (
let	val s1 = basic_prove_∃_conv tm
		handle complaint =>
		pass_on complaint "basic_prove_∃_conv" "basic_prove_∃_rule";
in
	if snd(dest_⇔(concl s1)) =$ mk_t
	then ⇔_t_elim s1
	else term_fail "basic_prove_∃_rule" 58003 [tm]
end);
=TEX
=SML
val ⦏basic_prove_∃_tac⦎ :TACTIC = (fn (seqasms, gl) =>
let	val s1 = basic_prove_∃_conv gl
		handle complaint as (Fail _) =>
		if is_∃ gl
		then fail "basic_prove_∃_tac" 58005 []
		else fail "basic_prove_∃_tac" 58004 [];
in
	if snd(dest_⇔(concl s1)) =$ mk_t
	then accept_tac (⇔_t_elim s1) (seqasms,gl)
	else fail "basic_prove_∃_tac" 58006 []
end);
=TEX
=IGN
basic_prove_∃_rule ⌜∃ a (b, c) d e ⦁ (a = b) ∧ (a = d) ∧ (b = 1) ∧ (c = d) ∧ (e = c)⌝;
basic_prove_∃_rule ⌜∃ f ⦁f⌝;
basic_prove_∃_rule ⌜∃ f ⦁ f ⇔ T⌝;
basic_prove_∃_rule ⌜∃ f ⦁ a = f⌝;
basic_prove_∃_conv ⌜∃ f ⦁ (a = f) ∧ f g⌝;
basic_prove_∃_conv ⌜∃ f ⦁ ∀ z ⦁ (z h ∧ (a = f) ∧ z f) ∧ f g⌝;
basic_prove_∃_conv ⌜∃ f ⦁ ∀ z x ⦁ (z h ∧ (a = f) ∧ z (f x)) ∧ (∀ g ⦁ f g) ⌝;
basic_prove_∃_conv ⌜∃ f ⦁ ∀ (z, x) ⦁ (z h ∧ (a = f) ∧ z (f x)) ∧ (∀ g ⦁ f g) ⌝;
basic_prove_∃_conv ⌜∃ f ⦁ ∀ x ⦁ f = x⌝; (* fails *)
basic_prove_∃_conv ⌜T⌝; (* fails *)
basic_prove_∃_rule ⌜∃ f ⦁ ∀ x ⦁ f x⌝;
basic_prove_∃_conv ⌜∃ f ⦁ (∀ x ⦁ f x = g) ∧ (∀ y ⦁ h (f  y))⌝;
basic_prove_∃_rule ⌜∃ f g h ⦁ (∀ x ⦁ f x = g) ∧ (∀ y ⦁ h (f  y))⌝;
basic_prove_∃_conv ⌜∃ f h ⦁ (∀ x g ⦁ f x = g) ∧ (∀ z y ⦁ h (f  y z))⌝;
Sadly only one of the two following works ``well'': ordering still matters.
basic_prove_∃_conv ⌜∃ f g h ⦁ (∀ x y z ⦁ f x y z = g y z x) ∧ (∀ a b c ⦁ h (f c a) b)⌝;
basic_prove_∃_rule ⌜∃ g h f ⦁ (∀ x y z ⦁ f x y z = g y z x) ∧ (∀ a b c ⦁ h (f c a) b)⌝;
basic_prove_∃_conv ⌜∃ f g h ⦁ (∀ x (y, z) ⦁ f x y z = g y z x) ∧ (∀ a b c ⦁ h (f c a) b)⌝;
basic_prove_∃_conv ⌜∃ f ⦁ (∀ a b c p ⦁ f (a,(b,c)) p ⇔ Fst a ∧ c ∧ p) ∧
		(∀ d e g p ⦁ f ((d,e),g) p ⇔ Snd g ∧ p ∧ d)  ∧
		(∀ a g q ⦁ f(a,g) q ⇔ q ∧ Snd g ∧ Fst a)⌝;
basic_prove_∃_conv ⌜∃ f ⦁ (∀ a b c p ⦁ (f (a,(b,c)) p ⇔ Fst a) ∧ c ∧ p)⌝;
basic_prove_∃_rule ⌜∃ fst snd ⦁ ∀ x y ⦁ (fst(x,y) = x) ∧ (snd(x,y) = y)⌝;
basic_prove_∃_conv ⌜∃ f⦁ (∀ a x⦁ f (Cons a x) ⇔ g a x ∧ f x) ∧
	(∃ a x⦁ g a x) ∧ (T ⇔ f [])⌝;
basic_prove_∃_conv ⌜∃ ff⦁ (∀ p q r⦁ (ff (Cons r q) ⇔ g k q r ∧ ff q) ∧ p) ∧
	(∀ s ⦁ ∃ a x s⦁ g a x s) ∧ (∀ t ⦁ t ⇔ ff [])⌝;
basic_prove_∃_rule ⌜∃ app ⦁ ∀ p q r ⦁ (app [] q = q) ∧
	(app (Cons p q) r = (Cons p (app q r))) ∧ T⌝;
basic_prove_∃_rule ⌜∃ app ⦁ (∀ q ⦁ (app [] q = q)) ∧
	(∀ p q r ⦁ (app (Cons p q) r = (Cons p (app q r))))⌝;
basic_prove_∃_rule ⌜∃ app ⦁ (∀ q ⦁ (app q [] = q)) ∧
	(∀ p q r ⦁ (app r (Cons p q) = (Cons p (app r q))))⌝;
basic_prove_∃_rule ⌜∃ mp ⦁ ∀ f ⦁ (mp f [] = []) ∧ (∀ p q ⦁ mp f (Cons p q) = Cons (f p) (mp f q))⌝;
basic_prove_∃_rule ⌜∃ ce ⦁∀ p q r s ⦁
	(ce (Cons p r) (Cons q s) ⇔ (p = q) ∧ (ce r s)) ∧
	(ce [] []) ∧
	(¬ ce (Cons p r) []) ∧
	(¬ ce [] (Cons p r))⌝;
basic_prove_∃_rule ⌜∃ fact ⦁ ∀ n ⦁ (fact 0 = 1) ∧ (fact (n+1) = (n + 1) *  fact n)⌝;
basic_prove_∃_rule ⌜∃ limit_it ⦁ ∀ n a x ⦁
	(limit_it (n + 1) (Cons a x) = Cons a (limit_it n x)) ∧
	(limit_it (n + 1) [] = []) ∧
	(limit_it 0 [] = []) ∧
	(limit_it 0 (Cons a x) = [])⌝;
basic_prove_∃_rule ⌜∃ limit_it ⦁ ∀ n a x ⦁
	(limit_it (n + 1) (Cons a x) = Cons a (limit_it n x)) ∧
	(limit_it (n + 1) [] = []) ∧
	(limit_it 0 x = []) ⌝;
basic_prove_∃_conv ⌜∃ len ⦁ ∀ n x t ⦁(len n [] = n) ∧
	(len n (Cons x t) = len (n + 1) t)⌝; (* doesn't do much *)
basic_prove_∃_conv ⌜∃ len ⦁ ∀ n x t ⦁(len (n+1) [] = (n+1)) ∧
	(len 0 [] = 0) ∧
	(len n (Cons x t) = len (n + 1) t)⌝; (* doesan unlikely step *)
basic_prove_∃_rule ⌜∃ f ⦁ ∀ x y ⦁ (f(InL x) = g x)∧ (f(InR y) = h y)⌝;
basic_prove_∃_rule ⌜∃ f ⦁f [] = 1⌝;
basic_prove_∃_rule ⌜∃ f ⦁∀ x a ⦁ f (Cons a x) = a⌝;
basic_prove_∃_conv ⌜∃ f ⦁∀ x a b ⦁ f (Cons a (Cons b x)) = b⌝; (* fails *)
basic_prove_∃_rule ⌜∃ f ⦁∀ x a ⦁ f (a+1) = a⌝;
basic_prove_∃_rule ⌜∃ f ⦁f 0 = a ⌝;
basic_prove_∃_conv ⌜∃ f ⦁p ∧ f 0 = a ⌝;
basic_prove_∃_rule ⌜∃ f ⦁∀ x ⦁ f (0,x) = x⌝;
basic_prove_∃_rule ⌜∃ ce ⦁∀ p q r s ⦁
	(ce (Cons p r, Cons q s) ⇔ (p = q) ∧ (ce (r, s))) ∧
	(ce ([], [])) ∧
	(¬ ce (Cons p r,[])) ∧
	(¬ ce ([], Cons p r))⌝;
new_type ("OPS",1);
new_const("Op1",ⓣ'a OPS → 'a OPS → 'a OPS⌝);
new_const("Op2",ⓣ'a OPS → 'a OPS → 'a OPS⌝);
new_const("Atom",ⓣ'a → 'a OPS⌝);
val ops_axiom = new_axiom("ops_axiom",
	⌜∀ a op1 op2 ⦁ ∃⋎1 f ⦁
	(∀ x ⦁ f (Atom x) = a x) ∧
	(∀ p q ⦁ f (Op1 p q) = op1 p q (f p) (f q)) ∧
	(∀ p q ⦁ f (Op2 p q) = op2 (f p) (f q) p q)⌝);
basic_prove_∃_rule ⌜∃ g ⦁ ∀ p q a ⦁ (g (Op2 p q) ⇔ h p ∧ g q)
	∧
	(g (Op1 p q) ⇔ h q ∧ g p)
	∧
	g(Atom a) = (a=0)⌝;
basic_prove_∃_conv ⌜∃ g ⦁ ∀ p q a ⦁ (g (Op2  p q) ⇔ h p ∧ g q)
	∧
	(g (Op1 p q) ⇔ h q ∧ g p)
	∧
	(g(Atom a) = (a=0))
	∧
	(i p ⇒ g(Op2 p q))⌝;

new_type ("NARY",1);
new_const("NNode",ⓣ('a NARY)LIST → 'a NARY⌝);
new_const("NLeaf",ⓣ'a → 'a NARY⌝);
val nary_axiom = new_axiom("nary_axiom",
	⌜∀ node leaf ⦁ ∃⋎1 f ⦁
	(∀ n ⦁ f (NLeaf n) = leaf n) ∧
	(∀ l ⦁ f (NNode l) = node l (Map f l))⌝);
basic_prove_∃_rule ⌜∃ sum_tree ⦁
	(∀ n ⦁ sum_tree (NLeaf n) = n) ∧
	(∀ l ⦁ sum_tree (NNode l) = Fold ($+) (Map sum_tree l) 0)⌝;
basic_prove_∃_rule ⌜∃ map_tree ⦁ ∀ f ⦁
	(∀ l ⦁ map_tree f (NNode l) = NNode (Map (map_tree f) l))
	∧
	(∀ n ⦁ map_tree f (NLeaf n) = NLeaf (f n))
⌝;

new_type("TRIPLE",3);
val triple = new_const("Triple",ⓣ'a → 'b → 'c → ('a, 'b, 'c)TRIPLE⌝);
val tripe1 = new_const("Tripe1",ⓣ('a, 'b, 'c)TRIPLE → 'a⌝);
val tripe2 = new_const("Tripe2",ⓣ('a, 'b, 'c)TRIPLE → 'b⌝);
val tripe3 = new_const("Tripe3",ⓣ('a, 'b, 'c)TRIPLE → 'c⌝);
val tripe_rw = new_axiom("tripe_rw",
	⌜∀ a b c x ⦁
	(Triple(Tripe1 x)(Tripe2 x)(Tripe3 x) = x)
	∧
	(Tripe1(Triple a b c) = a)
	∧
	(Tripe2(Triple a b c) = b)
	∧
	(Tripe3(Triple a b c) = c)⌝);

basic_prove_∃_rule ⌜∃ f ⦁ ∀ a b c n x ⦁ (f 0 (Triple a b c) ⇔ a ∧ b ∧ c) ∧
		(f (n+1) x ⇔ h n ∧ f n x)⌝;
=TEX
\section{EPILOGUE}
=SML
val _ = delete_pc "build_predicates";
val _ = pop_pc();
val _ = open_theory lthy;
=TEX
=SML
end; (* of structure ExistenceProofs *)
open ExistenceProofs;
=TEX
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}


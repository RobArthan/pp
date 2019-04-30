=IGN
********************************************************************************
imp518.doc: this file is part of the PPDaz system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  imp518.doc ℤ $Date: 2005/12/16 13:46:01 $ $Revision: 1.20 $ $RCSfile: imp518.doc,v $
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

\def\Title{Detailed Design: Compliance Notation Tactics Etc.}

\def\AbstractText{This document implements custom tactics and other proof procedures for use with the Compliance Tool.}

\def\Reference{ISS/HAT/DAZ/IMP518}

\def\Author{R.D. Arthan}


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
%% LaTeX2e port: 
\def\DRASpecs{\cite{DRA/CIS/CSE3/TR/94/27/3.0}}
\def\Volume#1{\cite[volume #1]{DRA/CIS/CSE3/TR/94/27/3.0}\/}
\def\VolumeOne{\Volume 1}
\def\VolumeTwo{\Volume 2}
\def\VolumeThree{\Volume 3}
%% LaTeX2e port: 
\def\Hide#1{}
\def\Bool{``$\it{:}bool\,$''}
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{DAZ PROJECT}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Detailed Design: Compliance Notation Tactics Etc.}  %% Mandatory field
%% LaTeX2e port: \TPPref{ISS/HAT/DAZ/IMP518}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.20 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2005/12/16 13:46:01 $%
%% LaTeX2e port: }}
%% LaTeX2e port: %\TPPstatus{Approved}
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: %\TPPkeywords{SPARK}
%% LaTeX2e port: \TPPauthors{R.D.~Arthan&WIN01\\R.D.~Arthan&WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & Manager HAT}
%% LaTeX2e port: \TPPabstract{
%% LaTeX2e port: This document implements custom tactics and other proof procedures for use with the Compliance Tool.}
%% LaTeX2e port: %\TPPabstractB{}
%% LaTeX2e port: %\TPPabstractC{}
%% LaTeX2e port: %\TPPabstractD{}
%% LaTeX2e port: %\TPPabstractE{}
%% LaTeX2e port: %\TPPabstractF{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	A.~Smith, DRA \\
%% LaTeX2e port: 	Library}}
%% LaTeX2e port: %\TPPclass{CLASSIFICATION}
%% LaTeX2e port: %\def\TPPheadlhs{}
%% LaTeX2e port: %\def\TPPheadcentre{}
%% LaTeX2e port: %def\TPPheadrhs{}
%% LaTeX2e port: \def\TPPheadlhs{Lemma 1 Ltd.}
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
\bibliography{daz,fmu}

\subsection{Changes History}  % to get section number `0.3'
\begin{description}
\item[Issue 1.1 (1996/03/08)-1.11 (1996/03/26)] Initial Drafts.
\item [Issue 1.12 (1996/03/27)] Changed from $cn\_hc\_tac$ to $cn\_∈\_type\_tac$.
\item [Issue 1.13 (1997/07/21)] Attempt to improve robustness in different build/test environments.
\item[Issue 1.14 (1997/08/18)] Updated references.
\item[Issue 1.15 (2002/08/23)] Removed use of ICL logo font and corrected {\LaTeX} errors.
\item[Issue 1.16 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.17 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.18 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.19 (2004/01/19)] The Z universal set is now called 𝕌
\item[Issue 1.20 (2005/12/16)] Private names are now prefixed with $pp'$.
\item[Issue 1.21 (2008/02/10)] Allowed for change to lexical rules for underscores in Z.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported daz source documents onto the Lemma 1 document template
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
None.
\pagebreak
\section{GENERAL}
\subsection{Scope}
This document responds to the detailed design in \cite{ISS/HAT/DAZ/DTD518}.
\subsection{Introduction}

\subsubsection{Purpose and Background}
See \cite{ISS/HAT/DAZ/DTD518}.

=TEX
\pagebreak
\section{HOL TACTICS}\label{HT}
=SML
structure ⦏CNHOLTactics⦎ : CNHOLTactics = struct
=TEX
=SML
val _ = open_theory "basic_hol" handle Fail _ => ();
val _ = set_pc"basic_hol";
open Unification Resolution;
=TEX
A frequent phenomenon in Z is that we have facts of the form:
=GFT
f ∈ X → Y
x ∈ X
=TEX
and we need a theorem of the form:
=GFT
f x ∈ Y
=TEX
Such a theorem is easy enough to solve in simple cases by forward chaining.
However, in more complex examples forward chaining can produce too many irrelevant results and still fail to find what we're looking for.
In such cases the resolution theorem prover (i.e., the $prove\_tac$ in most proof contexts) will also tend to follow far too many blind alleys.
An approach which works backwards from the desired theorem has a good chance of being more successful.

A goal-directed approach which promises to have the right characteristics is the horn clause proof procedure used in the pure prolog execution model.
This approach uses a database of horn clauses, i.e., predicates of the form
=INLINEFT
∀x⋎1 .. x⋎k⦁ R⋎1 ∧ ... ∧ R⋎k ⇒ R
=TEX
.
In what follows we will call the members of this database the {\em facts}.
The horn clauses are used to prove queries of the general form
=INLINEFT
∃y⋎1 .. y⋎m⦁ Q
=TEX
\ essentially by systematically searching for witnesses.
This search is carried out using a set, $S$, of intermediate queries.
At each stage in the search, $S$ will contain a set of predicates of the form
=INLINEFT
∀z⋎1 .. z⋎j⦁ Q⋎1 ∧ ... ∧ Q⋎j ⇒ Q'
=TEX
\ where $Q'$ is an instance of $Q$ obtained by specialising zero or more of the existentially quantified variables
=INLINEFT
y⋎1 .. y⋎k
=TEX
.
If some member of $S$ has $j = 0$, i.e. if the antecedent of one of the implications in $S$ becomes true, then we have found a true instance of $Q$, which provides witnesses to the truth of the original existentially quantified query.
The (non-deterministic) algorithm to carry out the search is as follows:

\begin{enumerate}
\item
Set
=INLINEFT
S = {∀⋎1 .. y⋎m⦁ Q ⇒ Q}
=TEX
.
This makes the only member of $S$ a (universally quantified) tautology, which is certainly a consequence of the facts.
\item
Now make three choices:
{\em(i)} pick a member of $S$, say
=INLINEFT
∀z⋎1 .. z⋎a⦁ Q⋎1 ∧ ... ∧ Q⋎b ⇒ Q'
=TEX
; {\em(ii)} pick a fact, say
=INLINEFT
∀x⋎1 .. x⋎k⦁ R⋎1 ∧ ... ∧ R⋎m ⇒ R
=TEX
; {\em(iii)} pick some $Q_j$.
\item
Attempt to unify $Q_j$ and $R$.
If there is no unifier then go back to step 2.
\item
We now have a unifier for $Q_j$ and $R$.
Specialise the $R_i$, giving $R'_i$ say, using this unifier and replace $Q_j$
by
=INLINEFT
R'⋎1 ∧ ... ∧ R'⋎k
=TEX
.
\item
If $a = 1$ and $m = 0$, we are done, the element of $S$ made in the previous step is the desired instance of $Q$.
Otherwise go back to step 2.
\end{enumerate}

The following type is used for the implicative facts we use in the prolog-like search.
The implication
=INLINEFT
∀x1 .. xk⦁ R1 ∧ ... ∧ Rk ⇒ R
=TEX
\ is represented as a theorem with assumptions:
=INLINEFT
R1, ..., Rk ⊢ R
=TEX
. The free variables of this theorem (including the $xi$) are remembered since they are needed when we do unification.

The same type is used for the queries we are trying to solve in the prolog-like search.
A query is represented as a theorem with assumptions:
=INLINEFT
Q1, ..., Qk ⊢ Q
=TEX
.
=SML
type ⦏MARKED_THM⦎ = {fvs : TERM list, fts : TYPE list, thm : THM};
=TEX
=SML
=TEX
=SML
infix 4 type_mem;
infix 4 type_diff;
fun (ty : TYPE) ⦏type_mem⦎ (tyl : TYPE list) : bool = (
let	fun test (h :: t) =  (ty =: h) orelse test t
	| test [] = false
in
	test tyl
end);
=TEX
=SML
fun ([] : TYPE list) ⦏type_diff⦎ (tyl2 : TYPE list) : TYPE list = []
| (ty :: rest) type_diff tyl2 = (if ty type_mem tyl2
	then rest type_diff tyl2
	else( ty :: (rest type_diff tyl2))
);
=TEX
=SML
fun ⦏thm_frees⦎ (th : THM) : TERM list = (
	list_term_union (map frees (concl th :: asms th))
);
=TEX
=SML
infix 4 type_union;
val op ⦏type_union⦎ : TYPE list * TYPE list -> TYPE list =
	uncurry (union (op =:));
val ⦏list_type_union⦎ : TYPE list list -> TYPE list = list_union (op =:);

=TEX
=SML
fun ⦏thm_tyvars⦎ (th : THM) : TYPE list = (
	list_type_union
	(map (map mk_vartype o term_tyvars)
	(concl th :: asms th))
);
=TEX
=SML
fun ⦏list_string_variant⦎ (avoid : string list) ([] : string list) = []
|    list_string_variant avoid (x :: more) = (
	let	val x' = string_variant avoid x;
	in	x' :: list_string_variant (x' :: avoid) more
	end
);
=TEX
=SML
fun ⦏list_type_variant⦎ (avoid : TYPE list) (tyvs : TYPE list) : TYPE list = (
	let	val avns = list_cup (map type_tyvars avoid);
		val ns = map dest_vartype tyvs;
	in	map mk_vartype (list_string_variant avns ns)
	end
);
=IGN
list_type_variant [ⓣ'1 → 'b → ('c × '2)⌝] [ⓣ'b⌝, ⓣ'c⌝, ⓣ'3⌝];
=TEX
\newpage
The rule $asm\_spec\_rule$ is intended to meet the following requirements:
\begin{enumerate}
\item
$tysubs$ and $tmsubs$ are type and term substitutions which unify the conclusion of $thm$ with some term of interest $t$, say.
The theorem returned by $asm\_spec\_rule$ must have the same conclusion as would be obtained by instantiating the conclusion of $thm$ using these substitutions.
\item
The type and term variables given by the ``hyp'' parameters should not be renamed.
\item
$tysubs$ and $tmsubs$ are as returned by $term\_unify$; in particular, the  variables in the second components of the pairs in $tmsubs$ have the same types as in $thm$ --- they have not yet been instantiated according to $tysubs$.
\item
The theorem returned by $asm\_spec\_rule$ should be as general as possible as regards the names of type and term variables, subject to requirements 1 and 2.
\item
The type and term variables given by the ``avoid'' parameters should not appear in the resulting theorem, except where this is dictated by requirements 1 and 2.
\end{enumerate}
=SML
fun ⦏asm_spec_rule⦎
	(hyp_tyvars : TYPE list)
	(hyp_tmvars : TERM list)
	(avoid_tys : TYPE list)
	(avoid_tms : TERM list)
	(tysubs : (TYPE*TYPE) list)
	(tmsubs : (TERM * TERM) list)
	(thm : THM) : THM = (
	let	val tyvs = map mk_vartype (term_tyvars (concl thm));
		val avoid_tys' = map fst tysubs type_union avoid_tys;
		val rename_tys = (thm_tyvars thm drop (fn ty => ty type_mem tyvs))
						type_diff hyp_tyvars;
		val rename_tys' = list_type_variant avoid_tys' rename_tys;
		val ty_rename_subs = combine rename_tys' rename_tys drop (op =:);
		val tysubs' = ty_rename_subs @ tysubs;
		val thm' = asm_inst_type_rule tysubs' thm;
		val tmvs = frees (concl thm);
		val avoid_tms' = list_term_union(avoid_tms::map(frees o fst) tmsubs);
		val rename_tms = (thm_frees thm drop (fn tm => tm term_mem tmvs))
					term_diff hyp_tmvars;
		val rename_tms' = map (inst[]ty_rename_subs)
					(list_variant avoid_tms' rename_tms);
		val tm_rename_subs = combine rename_tms' rename_tms drop (op =$);
		val tmsubs' = map (fn (t1, t2) => (t1, inst[]tysubs' t2))
					(tmsubs @ tm_rename_subs);
	in	asm_inst_term_rule tmsubs' thm'
	end
);
=IGN
asm_spec_rule[ⓣ'b'⌝] [⌜b:'b⌝] [(ⓣ'a → 'b → 'c⌝, ⓣ'a⌝)] []
	(asm_intro ⌜(b:'b) = b⌝
		(asm_intro ⌜(c:'c) = c⌝(prove_rule[]⌜(a:'a) = a⌝)));
asm_spec_rule [ⓣ'c⌝] [⌜d⌝] [] [(⌜a + b⌝, ⌜a:ℕ⌝)]
	(asm_intro ⌜(d:'b→'c) = d⌝(prove_rule[]⌜(a:ℕ) = a ∧ (b:ℕ)=b ∧ (c:ℕ) = c⌝));
asm_spec_rule [] [⌜Y⌝] [] [](asm_rule⌜y ∈ Y⌝);
=TEX
=SML
fun ⦏all_undisch_rule⦎ (thm : THM) : THM = (
	let	val thm' = undisch_rule thm;
	in	all_undisch_rule thm'
	end	handle	Fail _ => thm
);
val ⦏res_subs⦎ = new_subs 100;
=TEX
=SML
fun check_prove_asm_rule (athm : THM) (rthm : THM) = (
	let	val cnc = concl athm;
	in	(find (asms rthm) (fn t => t ~=$ cnc));
		prove_asm_rule athm rthm
	end
);
=TEX
The following is the resolution part of the prolog-like search.
=SML
fun ⦏thm_resolve⦎
	(hyp_tyvars : TYPE list)
	(hyp_tmvars : TERM list)
	(query as {fvs=q_fvs, fts=q_fts, thm=q_thm}: MARKED_THM)
	(asm : TERM)
	(fact as {fvs=f_fvs, fts=f_fts, thm=f_thm}: MARKED_THM)
	: MARKED_THM = (
	let	val side = init_subs res_subs;
		val avvs = frees (concl q_thm)
				term_union hyp_tmvars;
		val avts = map mk_vartype(term_tyvars (concl q_thm))
				type_union hyp_tyvars;
		val q_uvs = q_fvs term_diff avvs;
		val q_uts = q_fts type_diff avts;
		val ((f_tysubs, f_tmsubs), (q_tysubs, q_tmsubs)) =
			term_unify res_subs (f_fts @ q_fts) (f_fvs @ q_fvs)
			((concl f_thm, f_fvs, f_fts), (asm, q_uvs, q_uts));
		val q_thm' = asm_spec_rule hyp_tyvars hyp_tmvars [] []
				q_tysubs q_tmsubs q_thm;
		val asravtms = thm_frees q_thm';
		val asravtys = thm_tyvars q_thm';
		val f_thm' = asm_spec_rule hyp_tyvars hyp_tmvars asravtys asravtms
					f_tysubs f_tmsubs f_thm;
		val r_thm = check_prove_asm_rule f_thm' q_thm';
		val r_fvs = thm_frees r_thm;
		val r_fts = thm_tyvars r_thm;
	in	{fvs = r_fvs, fts = r_fts, thm = r_thm}
	end
);
=TEX
The following functions uses a rule which given a term $tm$ is expected either to fail or to prove zero or more theorems of the form
=INLINEFT
Δ ⊢ tm
=TEX
. Such a rule can be used in much the same way as a fact theorem.
In the following, we allow (as an exceptional case) for the theorem
to have the form
=INLINEFT
Δ ⊢ tm'
=TEX
, where $tm'$ can be unified with $tm$ using $thm\_resolve$.
=SML
fun ⦏rule_resolve⦎
	(hyp_tyvars : TYPE list)
	(hyp_tmvars : TERM list)
	(query as
	{fvs=q_fvs, fts=q_fts, thm=q_thm}: MARKED_THM)
	(asm : TERM)
	(rule : TERM -> THM list)
	: MARKED_THM list = (
	let	val f_thms = rule asm;
		fun freshen f_thm = (
			let	val avtms = thm_frees q_thm;
				val avtys = thm_tyvars q_thm;
			in	asm_spec_rule hyp_tyvars hyp_tmvars
						avtys avtms [] [] f_thm
			end
		);
		fun apply f_thm = (
			let	val fthm1 = freshen f_thm;
			in let	val r_thm = check_prove_asm_rule f_thm q_thm;
				val r_fvs = thm_frees r_thm;
				val r_fts = thm_tyvars r_thm;
			in	{fvs = r_fvs, fts = r_fts, thm = r_thm}
			end	handle Fail _ => (
				let	val mfthm = {
						fvs = thm_frees fthm1,
						fts = thm_tyvars fthm1,
						thm = fthm1
					};
				in	thm_resolve hyp_tyvars hyp_tmvars
						query asm mfthm
				end
				)
			end
		);
	in	mapfilter apply f_thms
	end
);
=TEX
=SML
fun ⦏make_fact⦎
	(thm : THM) : MARKED_THM = (
	let	val asm_tyvars = list_cup (map term_tyvars (asms thm));
		val asm_vars = list_term_union (map frees (asms thm));
		val thm1 = all_∀_arb_elim thm;
		val thm2 = all_undisch_rule thm1;
	in	{fvs = thm_frees thm2 term_diff asm_vars,
		fts = thm_tyvars thm2 type_diff map mk_vartype asm_tyvars,
		thm = thm2}
	end
);
=TEX
=SML
fun ⦏make_query⦎ (tm : TERM) : MARKED_THM = (
	let	val thm = asm_rule tm;
	in	{fvs = thm_frees thm, fts = thm_tyvars thm, thm = thm}
	end
);
=SML
fun ⦏hc_diag⦎ (msg : string OPT) (pass : int) (thms : THM list) : unit = (
	(case msg of
		Nil => diag_line
		("Horn clause prover - resolution pass " ^ string_of_int pass)
	|	Value x => diag_line("Horn clause prover - " ^ x));
	map (map diag_line o PrettyPrinter.format_thm) thms;
	()
);
=TEX
=SML
local
exception GotIt of THM;
fun ⦏hc_aux⦎ (diag : bool) (sel : TERM list -> TERM)
	(hyps : TERM list)
	(hyp_tyvars : TYPE list)
	(hyp_tmvars : TERM list)
	(fact_rules : (TERM -> THM list) list)
	(fact_thms : MARKED_THM list)
	(limit : int)
	(pass : int)
	(queries : MARKED_THM list) : THM = (
	let	val recur = hc_aux diag sel hyps hyp_tyvars hyp_tmvars
					fact_rules fact_thms limit (pass+1);
		fun	chk (mthm as {thm, fvs, fts}:MARKED_THM) : MARKED_THM = (
			let	val thm' = check_prove_asm_rule t_thm thm
						handle Fail _ => thm;
			in	if	all (asms thm') (fn t => t term_mem hyps)
				then	raise GotIt thm'
				else	{thm=thm', fvs=fvs, fts=fts}
			end
		);
		fun do_rules_facts (q : MARKED_THM): MARKED_THM list = (
			(case asms (#thm q) term_diff hyps of
			ts as _::_ => (
			let	val t = sel ts;
			in		flat
				(mapfilter
				(map chk o rule_resolve hyp_tyvars hyp_tmvars q t)
				fact_rules) @
				mapfilter
				(chk o thm_resolve hyp_tyvars hyp_tmvars q t)
					fact_thms
			end
			) | 	[] => [])
			drop (fn mthm => (mk_f term_mem asms (#thm mthm)))
		);
		val new_queries = flat(map do_rules_facts queries);
		val side = if diag then hc_diag Nil pass (map #thm new_queries) else();
	in	case new_queries of
		[] => (
			let	fun rpt() = (
					(if	not diag
					then	hc_diag Nil pass (map #thm queries)
					else	());
					string_of_term (concl (#thm(hd (queries))))
				);
			in	fail "hc_tac" 518002	[rpt]
			end
		) | _ => (
			if	pass >= limit
			then	let	fun rpt() = (
					(if	not diag
					then	hc_diag Nil pass (map #thm queries)
					else	());
					string_of_int limit
				);
				in	fail "hc_tac" 518001
					[rpt, fn _ =>
					string_of_term (concl (#thm(hd (queries))))]
				end
			else	recur new_queries
		)
	end
);
in
fun ⦏hc_rule⦎ (diag : bool) (limit : int) (sel : TERM list -> TERM)
	(hyps : TERM list)
	(fact_rules : (TERM -> THM list) list)
	(facts : THM list)
	(query : TERM) : THM = (
	let	val q = [make_query query];
		val hyp_vars = list_term_union (map frees hyps);
		val hyp_tyvars = map mk_vartype(list_cup(map term_tyvars hyps));
		val fs = map make_fact facts;
	in	
		(if diag then hc_diag (Value "query:") 0 (map #thm q) else());
		(if diag then hc_diag (Value "facts:") 0 (map #thm fs) else());
		(if diag then hc_diag (Value "hypotheses:") 0 (map asm_rule hyps) else());
		hc_aux diag sel hyps hyp_tyvars hyp_vars fact_rules fs limit 1 q
	end	handle GotIt thm => thm
);
end;
=TEX
=SML
fun ⦏basic_hc_tac⦎
	(diag : bool) (limit : int)  (sel : TERM list -> TERM)
	(can : THM -> THM list)
	(rules : (TERM -> THM list) list)
	(thms : THM list)
	: TACTIC = (fn gl as (asms, cnc) =>
	let	val asmthms = map asm_rule asms;
	in	accept_tac(hc_rule diag limit sel asms
			rules (flat(map can (asmthms @ thms))) cnc) gl
	end
);
=TEX
=SML
val ¬_⇒_f_thm = pc_rule1"predicates"prove_rule[]⌜∀p⦁(¬p ⇒ F) ⇔ p⌝;
val ¬_⇒_f_conv = TRY_C (ONCE_MAP_C (simple_eq_match_conv ¬_⇒_f_thm));
=TEX
=SML
fun ⦏hc_rule_of_conv⦎ (conv : CONV) : TERM -> THM list = (fn tm =>
	let	val th = conv tm;
	in	[⇔_t_elim th
		handle Fail _ => (undisch_rule o snd o ⇔_elim) th]
	end
);
=TEX
=SML
val ⦏hc_∧_rule⦎ : TERM -> THM list = (fn tm =>
	let	val (p, q) = dest_∧ tm;
	in	[∧_intro (asm_rule p) (asm_rule q)]
	end
);
=TEX
=SML
val ⦏hc_∨_rule⦎ : TERM -> THM list = (fn tm =>
	let	val (p, q) = dest_∨ tm;
	in	[∨_left_intro p (asm_rule q),
		∨_right_intro q (asm_rule p)]
	end
);
=TEX
=SML
val ⦏hc_∃_rule⦎ : TERM -> THM list = (fn tm =>
	let	val(v, m) = dest_∃ tm;
	in	[∃_intro tm (asm_rule m)]
	end
);
=TEX
=SML
fun HC_CAN (can : THM -> THM list) (thm : THM) : THM list = (
	case (map (conv_rule ¬_⇒_f_conv) o can) thm of
		[] => [thm]
	|	some => some
);
=TEX
=SML
val ⦏hc_canon⦎ = HC_CAN fc_canon1;
val ⦏hc_tac⦎ : THM list -> TACTIC = (fn ths =>
	basic_hc_tac false 100 hd hc_canon
		[hc_rule_of_conv (current_ad_st_conv()),
			hc_∧_rule, hc_∨_rule, hc_∃_rule]
		ths
);
=TEX
=SML
fun ⦏conv_then_hc_rule⦎ (conv : CONV) (rule : TERM -> THM list)
		: TERM -> THM list = (
	fn tm =>
	let	val thm = eq_sym_rule (conv tm);
		val lhs = fst(dest_eq (concl thm));
		val thms = rule lhs;
	in	map (⇔_mp_rule thm) thms
	end	handle Fail _ => rule tm
);
=TEX
=SML
end (* of structure CNHOLTactics *);
open CNHOLTactics;
=TEX
\section{Z TACTICS}\label{ZT}
=SML
structure ⦏CNZTactics⦎ : CNZTactics = struct
=TEX
=SML
val _ = open_theory"z_library" handle Fail _ => ();
val _ = if	get_current_theory_status ()<> TSNormal
	then	open_theory"cn"
		handle Fail _ =>
		((force_delete_theory "IMP518" handle Fail _ => ());
		new_theory"IMP518")
	else ();
=SML
fun ⦏z_sel⋎s_∈_rule⦎ (tm : TERM) : THM = (
	let	val (lhs, rhs) = dest_z_∈ tm;
		val (bdg, cmp) = dest_z_sel⋎s lhs;
	in	if is_z_binding bdg
		then	undisch_rule(snd(⇔_elim(LEFT_C z_sel⋎s_conv tm)))
		else
	let	val styl = dest_z_schema_type(type_of bdg);
		val gvl = gen_vars (map (mk_z_power_type o snd) styl) (frees tm);		
		val stygvl = combine styl gvl;
		val decs = map (fn(vty, s) => mk_z_dec([mk_var vty], s)) stygvl;
		val bdgmem = mk_z_∈ (bdg, mk_z_h_schema(mk_z_decl decs, mk_t));
		val thm1 = z_∈_h_schema_conv bdgmem;
		val thm2 = ∧_left_elim(undisch_rule(fst(⇔_elim thm1)));
		fun aux_rule th = (
			if (snd o dest_z_sel⋎s o fst o
				dest_z_∈ o fst o dest_∧ o concl) th = cmp
			then	∧_left_elim th
			else	aux_rule (∧_right_elim th)
		) handle Fail _ => th;
		val thm3 = aux_rule thm2;
		val v = (snd o dest_z_∈ o concl) thm3;
	in	asm_inst_term_rule[(rhs, v)] thm3
	end
	end	handle ex => reraise ex "z_sel⋎s_∈_rule"
);
=TEX
=SML
fun ⦏z_sel⋎t_∈_rule⦎ (tm : TERM) : THM = (
	let	val (lhs, rhs) = dest_z_∈ tm;
		val (tpl, cmp) = dest_z_sel⋎t lhs;
	in	if is_z_tuple tpl
		then	undisch_rule(snd(⇔_elim(LEFT_C z_sel⋎t_conv tm)))
		else
	let	val tyl = dest_z_tuple_type(type_of tpl);
		val gvl = gen_vars (map mk_z_power_type tyl) (frees tm);		
		val tplmem = mk_z_∈ (tpl, mk_z_× gvl);
		val thm1 = z_∈_×_conv tplmem;
		val thm2 = undisch_rule(fst(⇔_elim thm1));
		fun aux_rule th = (
			if (snd o dest_z_sel⋎t o fst o
				dest_z_∈ o fst o dest_∧ o concl) th = cmp
			then	∧_left_elim th
			else	aux_rule (∧_right_elim th)
		) handle Fail _ => th;
		val thm3 = aux_rule thm2;
		val v = (snd o dest_z_∈ o concl) thm3;
	in	asm_inst_term_rule[(rhs, v)] thm3
	end
	end	handle ex => reraise ex "z_sel⋎s_∈_rule"
);
=TEX
=SML
val _ = set_pc"z_predicates";
val z_app_hc_thm = (
	set_goal([], ⌜∀A; B; f; x⦁ⓩf ∈ A → B ⇒ x ∈ A ⇒ f x ∈ B⌝⌝);
	a(REPEAT strip_tac);
	a(all_fc_tac[z_fun_∈_clauses]);
	pop_thm()
);
=TEX
=SML
fun ⦏z_app_∈_rule⦎ (tm : TERM) : THM = (
	let	val (lhs, rhs) = dest_z_∈ tm;
		val (fnc, arg) = dest_z_app lhs;
		val gv = hd(gen_vars [mk_z_power_type (type_of arg)] (frees tm));		
		val thm1 = list_∀_elim[gv, rhs, fnc, arg] z_app_hc_thm;
	in	undisch_rule (undisch_rule thm1)
	end	handle ex => reraise ex "z_app_∈_rule"
);
=TEX
=SML
end (* of structure CNZTactics *);
open CNZTactics;
=TEX


\section{COMPLIANCE NOTATION TACTICS}\label{CNT}
\subsection{Preamble}
=SML
open_theory "cn";
force_delete_theory "IMP518" handle _ => ();
if get_current_theory_status() <> TSNormal
then new_theory "IMP518"
else ();
set_pc"cn";
=TEX
=SML
structure ⦏CNTactics⦎ : CNTactics = struct
=SML
val ⦏old_cur_thy⦎ = get_current_theory_name();
=TEX
\subsection{Propositional Simplification Etc.}
=SML
fun ⦏conjuncts⦎ (tm : TERM) : TERM list = (
	let	fun aux (ts : TERM list) (t : TERM): TERM list = (
			let	val (t1, t2) = dest_∧ t;
			in	aux (aux ts t1) t2
			end	handle Fail _ => (
				if	is_t t
				then	ts
				else	ts term_grab t
			)				
		);
	in	rev(aux [] tm)
	end
);
=TEX
=SML
val ⦏⇒_simp_conv⦎ : CONV = (fn t => (
	let	val tm = if is_⇒ t then t else mk_⇒(mk_t, t);
		val (t1, t2) = dest_⇒ tm;
		val ts1 = conjuncts t1;
		val ts2 = conjuncts t2 drop (fn t => t term_mem ts1);
		val ts = ts2 @ ts1;
		val vs = gen_vars (map (Combinators.K BOOL) ts) ts;
		val lts2 = length ts2;
		val vs1 = vs from lts2;
		val vs2 = vs to (lts2 - 1);
		val vt = subst (combine vs ts) t;
		val vthm = taut_rule (
			if	is_nil ts2 orelse mk_f term_mem ts1
			then	(mk_⇔(vt, mk_t))
			else if is_nil ts1
			then	(mk_⇔(vt, list_mk_∧ vs2))
			else	(mk_⇔(vt, mk_⇒(list_mk_∧ vs1, list_mk_∧ vs2))));
		val thm = inst_term_rule (combine ts vs) vthm;
	in	eq_trans_rule (refl_conv t) thm
	end
));
=TEX
=SML
val ⦏z_∀_⇒_simp_tac⦎ = (
	REPEAT z_∀_tac THEN conv_tac ⇒_simp_conv
);
=TEX
=SML
fun ⦏cn_vc_simp_tac⦎ (thms : THM list) : TACTIC = (fn gl => (
	let	val assoc_thms = [z_plus_assoc_thm, z_times_assoc_thm];
	in	CHANGED_T (
			TRY(rewrite_tac(thms @ assoc_thms)) THEN z_∀_⇒_simp_tac) gl
	end	handle ex as (Fail _) =>
		term_fail "cn_vc_simp_tac" 518003 [snd gl]
));
=TEX
\subsection{Tools for Proof Context Building}
=SML
fun make_∈_rules (thm : THM) : THM list = (
	let	val thm1 = all_∀_arb_elim thm;
		val thms1 = strip_∧_rule thm1 drop (not o is_z_∈ o concl);
	in	map(conv_rule (TRY_C(RAND_C(rewrite_conv[]))))thms1
	end
);
=TEX
=SML
fun ⦏list_make_∈_rules⦎ (pcs : string list) (thms : THM list) :  THM list = (
	let	val side1 = push_merge_pcs pcs;
		val result = flat (mapfilter make_∈_rules thms);
		val side2 = pop_pc();
	in	result
	end
);
=TEX
=SML
fun ⦏pc_z_∈_rules_of_thms⦎(pcs : string list) (thms : THM list)
		: (TERM * (TERM -> THM)) list = (
	let	val thms1 = list_make_∈_rules pcs thms;
		fun net_key th = (
			let	val (lhs, rhs) = dest_z_∈ (concl th);
				val gvar = hd(gen_vars [type_of rhs] []);
			in	mk_z_∈(lhs, gvar)
			end
		);
	in	map (fn th => (net_key th, fn _ => th)) thms1
	end
);
=TEX
=SML
fun ⦏set_pc_z_∈_rules⦎ (rules : (TERM * (TERM -> THM)) list) (pc : string) : unit = (
	set_nd_entry "pp'z_∈" rules pc
	handle ex => pass_on ex "set_nd_entry" "set_z_∈_pc_rules"
);
=TEX
=SML
fun ⦏get_pc_z_∈_rules⦎ (pc : string) :
	((TERM * (TERM -> THM)) list * string) list = (
	get_nd_entry "pp'z_∈"  pc
	handle ex => pass_on ex "get_nd_entry" "get_z_∈_pc_rules"
);
fun ⦏current_pc_z_∈_net⦎ (():unit) : (TERM -> THM) NET = (
	current_ad_nd_net "pp'z_∈"
);
=TEX
\subsection{The Proof Contexts $'cn1$, $cn1$, and $cn1\_exct$}
=SML
val ⦏cn_z_∈_thm⦎ = (
set_goal([], ⌜∀x; y; A; i; j; p⦁ⓩ
	(not _) ∈ BOOLEAN → BOOLEAN ∧
	(_ and _) ∈ BOOLEAN × BOOLEAN → BOOLEAN ∧
	(_ or _) ∈ BOOLEAN × BOOLEAN → BOOLEAN ∧
	(_ xor _) ∈ BOOLEAN × BOOLEAN → BOOLEAN ∧
	(x mem A) ∈ BOOLEAN ∧
	(x notmem A) ∈ BOOLEAN ∧
	(x eq y) ∈ BOOLEAN ∧
	(x noteq y) ∈ BOOLEAN ∧
	(i less j) ∈ BOOLEAN ∧
	(i less_eq j) ∈ BOOLEAN ∧
	(i greater j) ∈ BOOLEAN ∧
	(i greater_eq j) ∈ BOOLEAN ∧
	Boolean p ∈ BOOLEAN
⌝⌝);
push_pc"z_predicates";
a(REPEAT ∀_tac THEN rewrite_tac
			(map (rewrite_rule[])(fc_canon(z_get_specⓩ(not _)⌝))));
pop_pc();
a(rewrite_tac[] THEN REPEAT strip_tac);
pop_thm()
);

=TEX
=SML
val ⦏old_cn_cxt⦎ = fst(hd(get_rw_eqn_cxt "'cn"))
	drop (fn (t, _) => t ~=$ ⓩBOOLEAN⌝);
val ⦏cn1_cxt⦎ =
	(cthm_eqn_cxt (current_ad_rw_canon())) cn_boolean_∈_boolean_thm
	@ [(ⓩsize( a .. b)⌝, z_size_dot_dot_conv)]
	@ old_cn_cxt;
val ⦏cn_u_thms⦎ = mapfilter
	(fn (_ , th) => (term_match (concl th) ⓩXXX = 𝕌⌝; th)) (get_defns"cn");
=SML
val _ = delete_pc "'cn1" handle Fail _ => ();
val _ = new_pc ⦏"'cn1"⦎;
val _ = set_rw_eqn_cxt cn1_cxt "'cn1";
val _ = set_st_eqn_cxt [] "'cn1";
val _ = set_sc_eqn_cxt [] "'cn1";
val _ = set_u_simp_eqn_cxt (u_simp_eqn_cxt cn_u_thms) "'cn1";
val _ = set_pc_z_∈_rules
	(pc_z_∈_rules_of_thms ["'cn1", "z_library1"] [cn_z_∈_thm]) "'cn1";
val _ = commit_pc "'cn1";
=TEX
=SML
val _ = delete_pc "cn1" handle Fail _ => ();
val _ = new_pc ⦏"cn1"⦎;
val _ = merge_pcs ["'cn1","z_library1"] "cn1";
val _ = commit_pc "cn1";
=TEX
=SML
val _ = delete_pc "cn1_ext" handle Fail _ => ();
val _ = new_pc ⦏"cn1_ext"⦎;
val _ = merge_pcs ["'cn1","z_library1_ext"] "cn1_ext";
val _ = commit_pc "cn1_ext";
=TEX
\subsection{The Horn-Clause Type-Membership Prover}
=TEX
=SML
val conv1 = simple_eq_match_conv (pc_rule1"z_library" prove_rule[]
		⌜∀x⦁ ⓩ0 ≤ x ⇔ x ∈ ℕ⌝⌝);
val conv2 = simple_eq_match_conv (pc_rule1"z_library" prove_rule[]
		⌜∀i j k⦁ⓩj ≤ i ∧ i ≤ k ⇔ i ∈ j .. k⌝⌝);
val ⦏z_⊕_↦_∈_thm⦎ = (
	set_pc"z_library_ext";
	set_goal([], ⌜∀X; Y; f; x; y⦁
		ⓩf ∈ X → Y ∧ x ∈ X ∧ y ∈ Y ⇒ f ⊕ {x ↦ y} ∈ X → Y⌝⌝);
	a(REPEAT strip_tac THEN_TRY
		all_asm_fc_tac[] THEN_TRY
		all_var_elim_asm_tac1 THEN
		REPEAT strip_tac);
	a(cases_tacⓩx1 = x⌝ THEN1 all_var_elim_asm_tac1);
	(* *** Goal "1" *** *)
	a(z_∃_tacⓩy⌝ THEN REPEAT strip_tac);
	(* *** Goal "2" *** *)
	a(z_spec_nth_asm_tac 5 ⓩx1⌝ THEN all_asm_fc_tac[]);
	a(z_∃_tacⓩy'⌝ THEN REPEAT strip_tac);
	pop_thm()
);
val z_rules = map
	(conv_then_hc_rule (conv2 ORELSE_C conv1) o curry (op o) (switch (curry (op::)) nil))
	[z_sel⋎t_∈_rule, z_sel⋎s_∈_rule, z_app_∈_rule];
=TEX
=SML
fun ⦏cn_hc_canon⦎ (thm : THM) : THM list = (
	let	fun rw th = (
			(	conv_rule (RANDS_C (TRY_C(rewrite_conv[]))) th
			) handle Fail _ => th
		);
	in	if	is_z_∈ (concl thm)
		then	let	val ths = hc_canon (rw thm);
			in	if	any ths (fn th => concl th ~=$ concl thm)
				then	ths
				else	thm :: ths
			end
		else	hc_canon thm
	end
);
=TEX
=SML
fun ⦏cn_hc_sel⦎ (tms : TERM list) : TERM = (
	let	fun nice tm = (
			case dest_z_term tm of
				ZGVar _ => true
			|	ZLVar _ => true
			|	ZApp _ => true
			|	_ => false
		);
		fun aux tm = (
			let	val (lhs, _) = dest_z_∈ tm;
			in	nice lhs
			end	handle Fail _ => false
		);
	in	find tms aux handle Fail _ => hd tms
	end
);
=TEX
=SML
fun ⦏cn_pc_nd_rule⦎ () : TERM -> THM list = (
	let	val nlu = net_lookup (current_pc_z_∈_net());
	in	fn tm => map (fn r => r tm) (nlu tm)
	end
);
=IGN
set_pc"'cn1";
cn_pc_nd_rule()ⓩ(not _) ∈ x → y⌝;
=TEX
=SML
fun ⦏PRESERVE_∈_C⦎ (conv : CONV) : CONV = (
	COND_C (fn tm => (is_z_app (fst (dest_z_∈ tm))) handle Fail _ => false)
		(RAND_C conv)
		conv
);
=TEX
=SML
val ⦏cn_∈_type_tac⦎ : THM list -> TACTIC = (fn ths =>
	let	val pcrule = cn_pc_nd_rule();
		val rw_conv = PRESERVE_∈_C (rewrite_conv[]);
	in	basic_hc_tac false 100 cn_hc_sel cn_hc_canon
		(hc_∧_rule :: hc_∨_rule:: pcrule ::hc_rule_of_conv rw_conv ::z_rules)
		(z_⊕_↦_∈_thm::ths)
	end
);
=TEX
\subsection{Epilogue}
=SML
val _ = open_theory old_cur_thy;
end (* end of structure CNTactics *);
open CNTactics;
=TEX
\small
\twocolumn[\section{INDEX}]
\printindex

\end{document}

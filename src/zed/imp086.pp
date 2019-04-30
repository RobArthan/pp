=IGN
********************************************************************************
imp086.doc: this file is part of the PPZed system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% imp086.doc   ℤ $Date: 2008/02/10 15:28:07 $ $Revision: 1.23 $ $RCSfile: imp086.doc,v $
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

\def\Title{Implementation of the Z Library Numbers and Finiteness}

\def\AbstractText{This document contains the implementation of the Z Library Numbers and Finiteness and their proof support.}

\def\Reference{DS/FMU/IED/IMP086}

\def\Author{D.J. King, K. Blackburn, R.D. Arthan}


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
%% LaTeX2e port: \TPPtitle{Implementation of the Z Library Numbers and Finiteness}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP086}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.23 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2008/02/10 15:28:07 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: %\TPPauthor{D.J.~King & WIN01}  %% Mandatory field
%% LaTeX2e port: \TPPauthors{D.J.~King & WIN01\\K.~Blackburn & WIN01\\R.D.~Arthan & WIN01}
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document contains the implementation of
%% LaTeX2e port: the Z Library Numbers and Finiteness and their proof support.}
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

\item[Issue 1.1 (1992/10/28)] Initial Draft.
\item[Issue 1.2 (1992/11/16)] Added theorems.
\item[Issue 1.3 (1992/12/08)] Added conversions, proof contexts etc..
\item[Issue 1.4 (1992/12/09)] Tidied up error handling etc..
\item[Issue 1.5 (1992/12/11) (11th December 1992)]
Global rename from wrk038.doc issue 1.9.
\item[Issue 1.6 (1993/02/10),1.7 (1993/02/11) (10th-11th February 1993)]
Rearranging proof contexts, etc.
\item[Issue 1.8 (1993/02/22) (22nd February 1993)]
Working in a =IGN section only.
\item[Issue 1.9 (1993/08/12) (11th August 1993)]
Addition of friendly induction theorem.
\item[Issue 1.10 (1993/08/18) (17th August 1993)]
Addition of course of values induction theorem and tactic.
\item [Issue 1.11 (1993/08/19)]
Added proof context $z\_numbers1$.
\item [Issue 1.12 (1996/03/07)]
Updates for SML'97.
\item[Issue 1.13 (1999/02/17)]
Update for new INTEGER type.
\item[Issue 1.14 (1999/03/07)]
No longer relies on undeclaring the aliases for the HOL integer operations.
\item[Issue 1.16 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.17 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.18 (2004/01/19)] The Z universal set is now called 𝕌.
\item[Issue 1.19 (2005/02/26)] Precedences and associativity of toolkit operators now follow \cite{ISO02}.
\item[Issue 1.20 (2007/05/28)] Fixed conversions for intervals.
\item[Issue 1.21 (2007/08/04)] The integer range operator is now referred to as {\em dot\_dot} in all cases.
\item[Issue 1.22 (2007/09/11)] Standardised on {\em z\_simple} rather than {\em simple\_z}.
\item[Issue 1.23 (2008/02/10)] Allowed for changes to lexical rules for underscores.
\item[Issue 1.24 (2011/08/07)] Added ISO Z-like symbol as an alias for monadic minus.
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
of the Z Library numbers and finiteness, meeting the detailed design
given in \cite{DS/FMU/IED/DTD086}.
\subsection{Introduction}
\subsection{Purpose and Background}
See \cite{DS/FMU/IED/DTD086}.
\subsection{Dependencies}
The mathematical toolkit for Z Library numbers and finiteness is introduced within the structure
$ZNumbers$ which is constrained by the signature of the same name, specified
in \cite{DS/FMU/IED/DTD086}.

\subsection{Interface}
The interface for the structure is defined by the signature $ZNumbers$
(see\cite{DS/FMU/IED/DTD086}).

\subsection{Possible Enhancements}
None known.

\subsection{Deficiencies}
None known.

\section{PROLOGUE}

=SML
structure ⦏ZNumbers⦎ : ZNumbers = struct
=TEX
=SML
	val dummy = open_theory "z_numbers";
=TEX
\section{ML BINDINGS}
=TEX
Get the definitions:
=SML
	val z_ℤ_def = get_spec ⓩ(ℤ)⌝;
	val z_ℕ_def = get_spec ⓩ(ℕ)⌝;
	val z_arith_def = get_spec ⓩ(_ + _)⌝;
	val z_inequality_def = get_spec ⓩ(_ < _)⌝;
	val z_ℕ⋎1_def = get_spec ⓩ(ℕ⋎1)⌝;
	val z_succ_def = get_spec ⓩ(succ)⌝;
	val z_iter_def = get_spec ⓩ(iter)⌝;
	val z_dot_dot_def = get_spec ⓩ(_ .. _)⌝;
	val z_𝔽_def = get_spec ⓩ(𝔽 _)⌝;
	val z_𝔽⋎1_def = get_spec ⓩ(𝔽⋎1 _)⌝;
	val z_hash_def = get_spec ⓩ(#)⌝;
	val z_⇻_def = get_spec ⓩ(_ ⇻ _)⌝;
	val z_⤕_def = get_spec ⓩ(_ ⤕ _)⌝;
	val z_min_def = get_spec ⓩ(min)⌝;
	val z_max_def = get_spec ⓩ(max)⌝;
	val z'int_def = get_axiom "-" "Z'Int";
=TEX
\section{SYNTAX FUNCTIONS}
=TEX
=SML
val ⦏ℤ⦎ = ⓣℤ⌝;
local
val ⦏zintn⦎ = (fst o dest_const o fst o dest_app) ⓩ42⌝;
val ⦏zint⦎ = ⌜ⓜmk_const(zintn, ⓣℕ → ⌜↘SML:↕ mk_ctype("ℤ", [])⌝⌝)⌝⌝;
val ⦏minus⦎ = (fst o dest_z_app) ⓩ~42⌝;
val ⦏minusn⦎ = (fst o dest_const) minus;
val ⦏zabs⦎ = (fst o dest_z_app) ⓩabs 42⌝;
val ⦏zabsn⦎ = (fst o dest_const) zabs;
in
fun ⦏dest_z_minus⦎ (tm : TERM) : TERM = (
	let	val (sgn, a) = dest_z_app tm;
		val (s, _) = dest_const sgn;
	in	if s = minusn
		then a
		else term_fail "dest_z_minus" 86107 [tm]
	end	handle Fail _ => term_fail "dest_z_minus" 86107 [tm]
);
=TEX
=SML
fun ⦏is_z_minus⦎ (tm : TERM) : bool = (
	(dest_z_minus tm; true) handle Fail _ => false
);
=TEX
=SML
fun ⦏mk_z_minus⦎ (tm : TERM) : TERM = (
	if	type_of tm =: ℤ
	then	mk_z_app (minus, tm)
	else	term_fail "mk_z_minus"  86201 [tm]
);
=TEX
=SML
fun ⦏dest_z_abs⦎ (tm : TERM) : TERM = (
	let	val (sgn, a) = dest_z_app tm;
		val (s, _) = dest_const sgn;
	in	if s = zabsn
		then a
		else term_fail "dest_z_abs" 86103 [tm]
	end	handle Fail _ => term_fail "dest_z_abs" 86103 [tm]
);
=TEX
=SML
fun ⦏is_z_abs⦎ (tm : TERM) : bool = (
	(dest_z_abs tm; true) handle Fail _ => false
);
=TEX
=SML
fun ⦏mk_z_abs⦎ (tm : TERM) : TERM = (
	if	type_of tm =: ℤ
	then	mk_z_app (zabs, tm)
	else	term_fail "mk_z_abs"  86201 [tm]
);
=TEX
=SML
fun ⦏dest_z_signed_int⦎ (tm : TERM) : INTEGER = (
	let	val (f, a) = dest_app tm;
		val (n, _) = dest_const f;
	in	if n = zintn
		then dest_ℕ a
		else	term_fail "dest_z_signed_int" 86110 [tm]
	end	handle Fail _ => (
	let	val (sgn, a) = dest_z_app tm;
		val (s, _) = dest_const sgn;
		val (g, b) = dest_app a;
		val (n, _) = dest_const g;
	in	if s = minusn andalso n = zintn
		then	@~(dest_ℕ b)
		else	term_fail "dest_z_signed_int" 86110 [tm]
	end
	)	handle Fail _ => (
		term_fail "dest_z_signed_int" 86110 [tm]
	)
);
=TEX
=SML
fun ⦏is_z_signed_int⦎ (tm : TERM) : bool = (
	(dest_z_signed_int tm; true) handle Fail _ => false
);
=TEX
=SML
fun ⦏mk_z_signed_int⦎ (i : INTEGER) : TERM = (
	(mk_app (zint, (mk_ℕ i)))
	handle ex => mk_z_app(minus, mk_app (zint, (mk_ℕ (@~i))))
);
end;
=TEX
=SML
fun ⦏dest_z_bin_op⦎ (area : string) (msg : int)
	(n : string) : TERM -> TERM * TERM = (fn tm =>
	let	val (f, args) = (dest_z_app tm);
		val (cn, _) = dest_const f;
		val ops = dest_z_tuple args;
	in	if n = cn
		then (hd ops, hd(tl ops))
		else term_fail area msg [tm]
	end	handle Fail _ => term_fail area msg [tm]
);
=TEX
=SML
fun is_z_bin_op (n : string) : TERM -> bool = (
	let	val dest = dest_z_bin_op "is_z_bin_op" 0 n
	in	(fn tm =>
			(dest tm; true) handle Fail _ => false
		)
	end
);
=TEX
=SML
fun mk_z_simple_bin_op (tm : TERM) : TERM * TERM -> TERM = (fn (a1, a2) =>
	mk_z_app(tm, mk_z_tuple [a1, a2])
);
=TEX
=SML
fun ⦏dest_z_bin_rel⦎ (area : string) (msg : int)
	(n : string) : TERM -> TERM * TERM = (fn tm =>
	let	val (args, r) = (dest_z_∈ tm);
		val (cn, _) = dest_const r;
		val ops = dest_z_tuple args;
	in	if n = cn
		then (hd ops, hd(tl ops))
		else term_fail area msg [tm]
	end	handle Fail _ => term_fail area msg [tm]
);
=TEX
=SML
fun is_z_bin_rel (n : string) : TERM -> bool = (
	let	val dest = dest_z_bin_rel "is_z_bin_rel" 0 n
	in	(fn tm =>
			(dest tm; true) handle Fail _ => false
		)
	end
);
=TEX
=SML
fun mk_z_simple_bin_rel (tm : TERM) : TERM * TERM -> TERM = (fn (a1, a2) =>
	mk_z_∈(mk_z_tuple [a1, a2], tm)
);
=TEX
=SML
val ⦏dest_z_plus⦎ = dest_z_bin_op "dest_plus" 86109 (fst(dest_constⓩ(_ + _)⌝));
val ⦏dest_z_subtract⦎ = dest_z_bin_op "dest_subtract" 86111 (fst(dest_constⓩ(_ - _)⌝));
val ⦏dest_z_times⦎ = dest_z_bin_op "dest_z_times" 86112 (fst(dest_constⓩ(_ * _)⌝));
val ⦏dest_z_mod⦎ = dest_z_bin_op "dest_z_mod" 86108 (fst(dest_constⓩ(_ mod _)⌝));
val ⦏dest_z_div⦎ = dest_z_bin_op "dest_z_div" 86104 (fst(dest_constⓩ(_ div _)⌝));

val ⦏dest_z_less⦎ = dest_z_bin_rel "dest_z_less" 86106 (fst(dest_constⓩ(_ < _)⌝));
val ⦏dest_z_≤⦎ = dest_z_bin_rel "dest_z_≤" 86101 (fst(dest_constⓩ(_ ≤ _)⌝));
val ⦏dest_z_greater⦎ = dest_z_bin_rel "dest_z_greater" 86105
	(fst(dest_constⓩ(_ > _)⌝));
val ⦏dest_z_≥⦎ = dest_z_bin_rel "dest_z_≥" 86102 (fst(dest_constⓩ(_ ≥ _)⌝));

val ⦏is_z_plus⦎ = is_z_bin_op (fst(dest_constⓩ(_ + _)⌝));
val ⦏is_z_subtract⦎ = is_z_bin_op (fst(dest_constⓩ(_ - _)⌝));
val ⦏is_z_times⦎ = is_z_bin_op (fst(dest_constⓩ(_ * _)⌝));
val ⦏is_z_mod⦎ = is_z_bin_op (fst(dest_constⓩ(_ mod _)⌝));
val ⦏is_z_div⦎ = is_z_bin_op (fst(dest_constⓩ(_ div _)⌝));

val ⦏is_z_less⦎ = is_z_bin_rel (fst(dest_constⓩ(_ < _)⌝));
val ⦏is_z_≤⦎ = is_z_bin_rel (fst(dest_constⓩ(_ ≤ _)⌝));
val ⦏is_z_greater⦎ = is_z_bin_rel (fst(dest_constⓩ(_ > _)⌝));
val ⦏is_z_≥⦎ = is_z_bin_rel (fst(dest_constⓩ(_ ≥ _)⌝));
=TEX
=SML
fun ⦏mk_ℤ_bin_op⦎ (area : string) (tm : TERM) : (TERM * TERM) -> TERM = (
	let	val f = mk_z_simple_bin_op tm;
	in	(fn tt as (t1, t2) => (
			if	type_of t1 =: ℤ
			then	if	type_of t2 =: ℤ
				then	f tt
				else	term_fail area 86201 [t2]
			else	term_fail area 86201 [t1]
		))
	end
);
=TEX
=SML
val ⦏mk_z_plus⦎ = mk_ℤ_bin_op "mk_z_plus" ⓩ(_ + _)⌝;
val ⦏mk_z_subtract⦎ = mk_ℤ_bin_op "mk_z_subtract" ⓩ(_ - _)⌝;
val ⦏mk_z_times⦎ = mk_ℤ_bin_op	"mk_z_times" ⓩ(_ * _)⌝;
val ⦏mk_z_mod⦎ = mk_ℤ_bin_op "mk_z_mod" ⓩ(_ mod _)⌝;
val ⦏mk_z_div⦎ = mk_ℤ_bin_op "mk_z_div" ⓩ(_ div _)⌝;
=TEX
=SML
fun ⦏mk_ℤ_bin_rel⦎ (area : string) (tm : TERM) : (TERM * TERM) -> TERM = (
	let	val f = mk_z_simple_bin_rel tm;
	in	(fn tt as (t1, t2) => (
			if	type_of t1 =: ℤ
			then	if	type_of t2 =: ℤ
				then	f tt
				else	term_fail area 86201 [t2]
			else	term_fail area 86201 [t1]
		))
	end
);
=TEX
=SML
val ⦏mk_z_less⦎ = mk_ℤ_bin_rel "mk_z_less" ⓩ(_ < _)⌝;
val ⦏mk_z_≤⦎ = mk_ℤ_bin_rel "mk_z_≤" ⓩ(_ ≤ _)⌝;
val ⦏mk_z_greater⦎ = mk_ℤ_bin_rel "mk_z_greater" ⓩ(_ > _)⌝;
val ⦏mk_z_≥⦎ = mk_ℤ_bin_rel "mk_z_≥" ⓩ(_ ≥ _)⌝;
=TEX
=SML
val ⦏Z_FUN_RAND_C⦎ = RAND_C;
val ⦏Z_FUN_RATOR_C⦎ = RATOR_C o RAND_C;

val ⦏Z_REL_LEFT_C⦎ = RATOR_C o RAND_C o RATOR_C o RAND_C;
val ⦏Z_REL_RIGHT_C⦎ = RATOR_C o RAND_C o RAND_C;
val ⦏Z_REL_RANDS_C⦎ = RATOR_C o RAND_C o RANDS_C;

val ⦏Z_FUN_LEFT_C⦎ = RAND_C o RATOR_C o RAND_C;
val ⦏Z_FUN_RIGHT_C⦎ = RAND_C o RAND_C;
val ⦏Z_FUN_RANDS_C⦎ = RAND_C o RANDS_C;

=TEX
=SML
fun ⦏accept_conv⦎ (thm : THM) : CONV = (fn tm =>
	if	(fst(dest_eq (concl thm)) =$ tm) handle Fail _ => false
	then	 thm
	else	fail_conv tm
);
=TEX
\section{THEOREMS}
=SML
val _ = push_pc"z_predicates";
=TEX
=SML
val ⦏z_more_pcs⦎ = ["'z_tuples", "'z_∈_fun", "'z_∈_rel", "z_sets_ext"];
=TEX
Now we begin the proofs. First of all the following little lemma is required
in the absence of more powerful means for eliminating declarations
involving quantification over a given set. (Such a means now exists, but
time has not permitted exploiting it, yet).
=SML
val ⦏ℤ_thm⦎ = (
push_goal([], ⓩℤ = 𝕌⌝);
a(rewrite_tac[get_specⓩℤ⌝]);
pop_thm()
);
=TEX

=TEX
\subsection{The Additive Structure}
=SML
val ⦏z_plus_def⦎ = rewrite_rule[ℤ_thm, z_∉_thm] (z_get_spec ⓩ(_ + _)⌝);
=TEX
=SML
val ⦏z_plus_comm_thm⦎ = save_thm("z_plus_comm_thm", (
push_goal ([], ⓩ∀i, j : 𝕌⦁ i + j = j + i⌝);
a(strip_asm_tac z_plus_def);
a(asm_prove_tac[]);
pop_thm()
));
=TEX
=SML
val ⦏z_plus_assoc_thm⦎ = save_thm("z_plus_assoc_thm", (
push_goal ([], ⓩ∀i, j, k : 𝕌⦁ (i + j) + k = i + (j + k)⌝);
a(strip_asm_tac z_plus_def);
a(asm_prove_tac[]);
pop_thm()
));
=TEX
=SML
val ⦏z_plus_assoc_thm1⦎ = save_thm("z_plus_assoc_thm1", (
push_goal ([], ⓩ∀i, j, k : 𝕌⦁ i + (j + k) = (i + j) + k⌝);
a(conv_tac (ONCE_MAP_C eq_sym_conv));
a(accept_tac z_plus_assoc_thm);
pop_thm()
));
=TEX
=SML
val ⦏z_plus_order_thm⦎ = save_thm("z_plus_order_thm", (
push_goal ([], ⓩ∀i : 𝕌⦁ ∀ j, k : 𝕌⦁
		j + i = i + j
	∧	(i + j) + k = i + (j + k)
	∧	j + (i + k) = i + (j + k)⌝);
a(strip_asm_tac z_plus_def);
a(asm_prove_tac[]);
a(rewrite_tac[z_plus_assoc_thm1, z_∀_elimⓩ(i≜j, j≜i)⌝z_plus_comm_thm]);
pop_thm()
));
=TEX
=SML
val ⦏z_plus0_thm⦎ = save_thm("z_plus0_thm", (
push_goal ([], ⓩ∀i : 𝕌⦁
		i + 0 = i
	∧	0 + i = i⌝);
a(strip_asm_tac z_plus_def);
a(rewrite_tac[z_∀_elimⓩ(i≜0, j≜i⦂ℤ)⌝z_plus_comm_thm]);
a(asm_prove_tac[]);
pop_thm()
));
=TEX
=SML
val ⦏z_plus_minus_thm⦎ = save_thm("z_plus_minus_thm", (
push_goal ([], ⓩ∀i : 𝕌⦁
		i + ~i = 0
	∧	~i + i = 0⌝);
a(strip_asm_tac z_plus_def);
a(rewrite_tac[z_∀_elimⓩ(i≜ ~i, j≜i)⌝z_plus_comm_thm]);
a(asm_prove_tac[]);
pop_thm()
));
=TEX
=SML
val ⦏z_ℕ_thm⦎ = save_thm("z_ℕ_thm", (
push_goal ([], ⓩℕ = ⋂ {s : 𝕌 | 0 ∈ s ∧ {i : s ⦁ i + 1} ⊆ s} ∧ ¬ ~1 ∈ ℕ⌝);
a(REPEAT strip_tac THEN strip_asm_tac z_plus_def);
pop_thm()
));
=TEX
=SML
val ⦏z_plus_cyclic_group_thm⦎ = save_thm("z_plus_cyclic_group_thm", (
push_goal ([], ⓩ∀ h : 𝕌 ⦁ 1 ∈ h ∧ (∀ i, j : h ⦁ i + j ∈ h ∧ ~ i ∈ h) ⇒ h = 𝕌⌝);
a(strip_asm_tac z_plus_def);
pop_thm()
));
=TEX
=SML
val  ⦏z_int_homomorphism_thm⦎ = save_thm("z_int_homomorphism_thm", (
push_goal([], ⌜∀i j⦁ Z'Int (i + j) = ⓩ⌜Z'Int i⌝ + ⌜Z'Int j⌝⌝⌝);
a(strip_tac);
a(induction_tac ⌜i⌝);
(* *** Goal "1" *** *)
a(PC_T1"hol1"rewrite_tac[] THEN rewrite_tac[z_plus0_thm]);
(* *** Goal "2" *** *)
a(strip_tac THEN
	LEMMA_T ⌜(i + 1) + j = (i + j) + 1⌝ rewrite_thm_tac THEN1
	PC_T1"lin_arith" prove_tac[]);
a(asm_rewrite_tac[get_axiom"-""z'int_def"]);
a(rewrite_tac[z_plus_assoc_thm, z_∀_elimⓩ1⌝z_plus_order_thm]);
pop_thm()
));
=TEX
\subsection{Induction and Positive/Negative Case Analysis}
The results in the section need the more aggressive proof context.
=SML
val _ = push_merge_pcs z_more_pcs;
val  ⦏z_ℤ_induction_thm⦎ = save_thm("z_ℤ_induction_thm", (
push_goal([], ⌜∀p : ℤ → BOOL⦁
		p ⓩ1⌝
	∧	(∀i⦁ p i ⇒ p ⓩ~i⌝)
	∧	(∀i j⦁ p i ∧ p j ⇒ p ⓩi + j⌝)
	⇒	(∀m : ℤ⦁ p m)
⌝);
a(REPEAT strip_tac);
a(lemma_tacⓩ{x : 𝕌 | ⌜p x⌝} = 𝕌⌝);
(* *** Goal "1" *** *)
a(bc_tac[conv_rule z_∀_elim_conv1 z_plus_cyclic_group_thm] THEN asm_prove_tac[]);
(* *** Goal "2" *** *)
a(asm_prove_tac[]);
pop_thm()
));
=TEX
=SML
val ⦏z_ℤ_induction_tac⦎ = gen_induction_tac z_ℤ_induction_thm;
=TEX
=SML
val  ⦏z_ℕ_induction_lemma⦎ = (
push_goal([], ⌜∀p : ℤ → BOOL⦁
		p ⓩ0⌝
	∧	(∀i⦁ p i ⇒ p ⓩi + 1⌝)
	⇒	∀m⦁ ⓩm ∈ ℕ⌝ ⇒ p m
⌝);
a(rewrite_tac[z_ℕ_thm] THEN REPEAT strip_tac);
a(POP_ASM_T (strip_asm_tac o  z_∀_elimⓩ{m:𝕌|⌜p m⌝}⌝));
a(all_asm_fc_tac[]);
a(PC_T1"prop_eq" asm_prove_tac[]);
pop_thm()
);
=TEX
=SML
val  ⦏z_ℕ_plus1_thm⦎ = save_thm("z_ℕ_plus1_thm", (
push_goal([], ⓩ∀i:ℕ⦁i + 1 ∈ ℕ⌝);
a(rewrite_tac[z_ℕ_thm, ℤ_thm]);
a(REPEAT strip_tac);
a(all_asm_fc_tac[]);
a(DROP_NTH_ASM_T 2 (strip_asm_tac o z_∀_elim ⓩi+1⌝));
a(POP_ASM_T (strip_asm_tac o z_∀_elim ⓩi⌝));
pop_thm()
));
=TEX
=SML
val  ⦏z_0_ℕ_thm⦎ = save_thm("z_0_ℕ_thm", (
push_goal([], ⓩ0 ∈ ℕ⌝);
a(asm_prove_tac[z_ℕ_thm, ℤ_thm]);
pop_thm()
));
=TEX
=SML
val  ⦏z_ℕ_induction_thm⦎ = save_thm("z_ℕ_induction_thm", (
push_goal([], ⌜∀p : ℤ → BOOL⦁
		p ⓩ0⌝
	∧	(∀i⦁ ⓩi ∈ ℕ⌝ ∧ p i ⇒ p ⓩi + 1⌝)
	⇒	∀m⦁ ⓩm ∈ ℕ⌝ ⇒ p m
⌝);
a(REPEAT strip_tac);
a(PC_T1 "hol1" strip_asm_tac
	(pc_rule1"hol"rewrite_rule[]
		(∀_elim⌜λj⦁j ∈ ⓩℕ⌝ ∧ p j⌝ z_ℕ_induction_lemma))
	THEN (SOLVED_T (asm_prove_tac[z_0_ℕ_thm]) ORELSE
		all_fc_tac[z_ℕ_plus1_thm]));
pop_thm()
));
=TEX
=SML
val ⦏z_ℕ_induction_tac⦎ = gen_induction_tac1 z_ℕ_induction_thm;
=TEX
=SML
val  ⦏z_ℕ_plus_thm⦎ = save_thm("z_ℕ_plus_thm", (
push_goal([], ⓩ∀i, j:ℕ⦁i + j ∈ ℕ⌝);
a(REPEAT strip_tac);
a(POP_ASM_T ante_tac THEN z_ℕ_induction_tac);
(* *** Goal "1" *** *)
a(asm_rewrite_tac[z_plus0_thm]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[z_plus_assoc_thm1]);
a(all_fc_tac[z_ℕ_plus1_thm]);
pop_thm()
));
=TEX
=SML
val ⦏z_ℤ_eq_thm⦎ = save_thm("z_ℤ_eq_thm", (
push_goal([], ⓩ∀i, j:𝕌⦁i = j ⇔ i + ~j = 0⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(asm_rewrite_tac[z_plus_minus_thm]);
(* *** Goal "2" *** *)
a(LEMMA_T ⓩ(i + ~j) + j = j⌝ ante_tac THEN1 asm_rewrite_tac[z_plus0_thm]);
a(rewrite_tac[z_plus_assoc_thm, z_plus_minus_thm, z_plus0_thm]);
pop_thm()
));
=TEX
=SML
val ⦏z_﹣_minus_thm⦎ = save_thm("z_﹣_minus_thm", z_get_specⓩ(﹣ _)⌝);
=TEX
=SML
val ⦏z_minus_thm⦎ = save_thm("z_minus_thm", (
push_goal([], ⓩ∀i, j:𝕌⦁~ ~i = i ∧ i + ~i = 0 ∧ ~i + i = 0 ∧ ~(i + j) =
		~i + ~j ∧ ~0 = 0⌝);
a(rewrite_tac[z_plus_minus_thm]);
a(LEMMA_Tⓩ∀i, j:𝕌⦁~ ~i = i⌝ (fn th => rewrite_tac[th] THEN asm_tac th)
	THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(once_rewrite_tac[z_ℤ_eq_thm] THEN rewrite_tac[z_plus_minus_thm]);
(* *** Goal "2" *** *)
a(conv_tac eq_sym_conv THEN once_rewrite_tac[z_ℤ_eq_thm]);
a(asm_rewrite_tac[]);
a(rewrite_tac[z_∀_elimⓩ~i⌝z_plus_order_thm] THEN rewrite_tac[z_∀_elimⓩi⌝z_plus_order_thm]);
a(rewrite_tac[z_plus_minus_thm, z_plus0_thm]);
(* *** Goal "3" *** *)
a(LEMMA_Tⓩ0 + ~0 = 0⌝ (accept_tac o rewrite_rule[z_plus0_thm]));
a(rewrite_tac[z_plus_minus_thm]);
pop_thm()
));
=TEX
=SML
val ⦏z_minus_clauses⦎ = save_thm("z_minus_clauses",(
push_goal([], ⓩ∀i : 𝕌⦁ ~ ~ i = i ∧ ~0 = 0 ∧ (i + ~i = 0) ∧ (~i + i = 0)⌝);
a(rewrite_tac[z_minus_thm]);
pop_thm()
));
=TEX
=SML
val ⦏z_ℕ_cases_thm⦎ = save_thm("z_ℕ_cases_thm", (
push_goal([], ⓩ∀i:ℕ⦁i = 0 ∨ (∃j:ℕ⦁i = j + 1)⌝);
a(REPEAT strip_tac THEN all_asm_ante_tac);
a(z_ℕ_induction_tac THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(z_∃_tacⓩ0⌝ THEN asm_rewrite_tac[]);
a(accept_tac z_0_ℕ_thm);
(* *** Goal "2" *** *)
a(z_∃_tacⓩi⌝ THEN asm_rewrite_tac[]);
pop_thm()
));
=TEX
=SML
val ⦏z_ℤ_cases_lemma⦎ = (
push_goal([], ⓩ∀i, j: 𝕌| i ∈ ℕ ∧ ~j ∈ ℕ ∧ ¬i + j ∈ ℕ ⦁ ~(i + j) ∈ ℕ⌝);
a(REPEAT strip_tac);
a(all_asm_ante_tac);
a(z_ℕ_induction_tac);
(* *** Goal "1" *** *)
a(rewrite_tac[z_plus0_thm] THEN REPEAT strip_tac);
(* *** Goal "2" *** *)
a(strip_tac);
(* *** Goal "3" *** *)
a(rewrite_tac[z_∀_elim ⓩj⌝ z_plus_order_thm]);
a(rewrite_tac[z_∀_elim ⓩi⌝ z_plus_order_thm] THEN rewrite_tac[z_plus_assoc_thm1]);
a(REPEAT strip_tac THEN all_asm_fc_tac[z_ℕ_plus1_thm]);
(* *** Goal "4" *** *)
a(all_asm_ante_tac THEN rewrite_tac[z_minus_thm] THEN REPEAT strip_tac);
a(lemma_tacⓩ¬ ~i + ~j = 0⌝);
(* *** Goal "4.1" *** *)
a(conv_tac (RAND_C eq_sym_conv) THEN once_rewrite_tac[z_ℤ_eq_thm]);
a(rewrite_tac[z_plus0_thm, z_minus_thm]);
a(swap_nth_asm_concl_tac 1 THEN rewrite_tac[z_∀_elimⓩj⌝z_plus_order_thm]);
a(rewrite_tac[z_∀_elimⓩi⌝z_plus_order_thm]);
a(asm_rewrite_tac[z_plus_assoc_thm1]);
a(strip_asm_tac z_0_ℕ_thm THEN all_fc_tac[z_ℕ_plus1_thm]);
(* *** Goal "4.2" *** *)
a(all_fc_tac[z_ℕ_cases_thm]);
a(rewrite_tac[z_∀_elimⓩ~j⌝z_plus_order_thm]);
a(rewrite_tac[z_∀_elimⓩ~i⌝z_plus_order_thm]);
a(asm_rewrite_tac[z_plus_assoc_thm1]);
a(asm_rewrite_tac[z_plus_assoc_thm, z_plus_minus_thm, z_plus0_thm]);
pop_thm()
);
=TEX
=SML
val ⦏z_¬_ℕ_thm⦎ = save_thm("z_¬_ℕ_thm", (
push_goal([], ⓩ∀i:𝕌⦁¬i ∈ ℕ ⇒ ~i ∈ ℕ⌝);
a(strip_tac THEN strip_tac);
a(z_ℤ_induction_tac ⓩi⌝ THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(LEMMA_Tⓩ0 + 1 ∈ ℕ ⌝ (strip_asm_tac o rewrite_rule[z_plus0_thm]));
a(strip_asm_tac z_0_ℕ_thm THEN asm_fc_tac [z_ℕ_plus1_thm]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[z_minus_thm]);
(* *** Goal "3" *** *)
a(all_asm_fc_tac[z_ℕ_plus_thm]);
(* *** Goal "4" *** *)
a(all_asm_fc_tac[z_ℤ_cases_lemma]);
(* *** Goal "5" *** *)
a(POP_ASM_T ante_tac THEN once_rewrite_tac[z_plus_comm_thm] THEN strip_tac);
a(strip_asm_tac(z_∀_elimⓩ(i≜j, j≜i)⌝z_ℤ_cases_lemma));
(* *** Goal "6" *** *)
a(rewrite_tac[z_minus_thm]);
a(all_asm_fc_tac[z_ℕ_plus_thm]);
pop_thm()
));
=TEX
=SML
val ⦏z_ℤ_cases_lemma⦎ = (
push_goal([], ⓩℤ = ℕ ∪ {s:ℕ⦁~s}⌝);
a(asm_tac z_¬_ℕ_thm);
a(rewrite_tac[ℤ_thm] THEN REPEAT strip_tac);
a(z_∃_tacⓩ~ x1⌝);
a(all_asm_fc_tac[]);
a(REPEAT strip_tac);
a(rewrite_tac[z_minus_thm]);
pop_thm()
);
=TEX
=SML
val ⦏z_ℤ_cases_lemma1⦎ = (
push_goal([], ⓩℤ = ℕ ∪ {s:ℕ \ {0}⦁~s}⌝);
a(rewrite_tac[z_ℤ_cases_lemma] THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(z_∃_tacⓩs⌝ THEN REPEAT strip_tac);
a(CONTR_T (fn th => all_asm_ante_tac THEN rewrite_thm_tac th));
a(rewrite_tac[z_0_ℕ_thm, z_minus_thm]);
a(STRIP_CONCL_T (asm_tac o eq_sym_rule));
a(asm_rewrite_tac[z_0_ℕ_thm]);
(* *** Goal "2" *** *)
a(z_∃_tacⓩs⌝ THEN REPEAT strip_tac);
pop_thm()
);
=TEX
=SML
val ⦏z_ℤ_cases_thm⦎ = save_thm("z_ℤ_cases_thm", (
push_goal([], ⓩ∀i : 𝕌⦁∃j:ℕ⦁i = j ∨ i = ~j⌝);
a(once_rewrite_tac [eq_sym_rule ℤ_thm]);
a(rewrite_tac[z_ℤ_cases_lemma] THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(asm_prove_tac[]);
(* *** Goal "2" *** *)
a(z_∃_tacⓩs⌝ THEN asm_rewrite_tac[]);
pop_thm()
));
=TEX
=SML
val ⦏z_ℕ_¬_plus1_thm⦎ = save_thm("z_ℕ_¬_plus1_thm", (
push_goal([], ⓩ∀i:ℕ ⦁ ¬i + 1 = 0⌝);
a(REPEAT strip_tac);
a(swap_nth_asm_concl_tac 1);
a(lemma_tac ⓩi = ~1⌝);
(* *** Goal "1" *** *)
a(once_rewrite_tac[z_ℤ_eq_thm]);
a(asm_rewrite_tac[z_minus_thm]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[∧_right_elim z_ℕ_thm]);
pop_thm()
));
=TEX
=SML
val ⦏z_ℤ_cases_thm1⦎ = save_thm("z_ℤ_cases_thm1", (
push_goal([], ⓩ∀i:𝕌⦁i ∈ ℕ ∨ (∃j:ℕ⦁ i = ~(j+1))⌝);
a(strip_tac THEN strip_tac);
a(conv_tac (LEFT_C(LEFT_C(pure_once_rewrite_conv
	[pure_once_rewrite_rule[ℤ_thm]z_ℤ_cases_lemma1]))));
a(REPEAT strip_tac);
a(all_fc_tac[z_ℕ_cases_thm]);
a(z_∃_tacⓩj⌝ THEN REPEAT strip_tac);
a(DROP_NTH_ASM_T 4 (asm_rewrite_thm_tac o eq_sym_rule));
pop_thm()
));
=TEX
=SML
val ⦏z_ℕ_¬_minus_thm⦎ = save_thm("z_ℕ_¬_minus_thm", (
push_goal([], ⓩ∀i:ℕ ⦁ i = 0 ∨ ¬ ~i ∈ ℕ⌝);
a(REPEAT strip_tac);
a(strip_asm_tac(z_∀_elimⓩi⌝z_ℕ_cases_thm));
a(LIST_DROP_NTH_ASM_T [3,4] (MAP_EVERY ante_tac));
a(POP_ASM_T rewrite_thm_tac);
a(REPEAT strip_tac);
a(lemma_tacⓩ(j + ~(j + 1)) + 1 = 0⌝);
a(rewrite_tac[z_∀_elimⓩ1⌝z_plus_order_thm]);
a(rewrite_tac[z_plus_assoc_thm1, z_minus_thm]);
a(strip_asm_tac(z_∀_elimⓩ(i≜j, j≜ ~(j+1))⌝z_ℕ_plus_thm));
a(strip_asm_tac(z_∀_elimⓩj + ~ (j + 1)⌝z_ℕ_plus1_thm));
a(all_fc_tac[z_ℕ_¬_plus1_thm]);
pop_thm()
));
val _ = pop_pc();
=TEX
=SML
val ⦏z_plus_clauses⦎ = save_thm("z_plus_clauses", (
push_goal([], ⓩ∀i, j, k : 𝕌⦁
	(i + k = j + k ⇔ i = j)
∧	(k + i = j + k ⇔ i = j)
∧	(i + k = k + j ⇔ i = j)
∧	(k + i = k + j ⇔ i = j)
∧	(i + k = k ⇔ i = 0)
∧	(k + i = k ⇔ i = 0)
∧	(k = k + j ⇔ j = 0)
∧	(k = j + k ⇔ j = 0)
∧	(i + 0 = i)
∧	(0 + i = i)
∧	¬1 = 0
∧	¬0 = 1
⌝);
a(z_∀_tac);
let val th = rewrite_rule[z_0_ℕ_thm, z_plus0_thm](z_∀_elimⓩ0⌝z_ℕ_¬_plus1_thm);
in
	a(rewrite_tac [th, conv_rule (RAND_C eq_sym_conv) th,
			z_plus0_thm, z_minus_thm])
end;
a(once_rewrite_tac[z_ℤ_eq_thm]);
a(rewrite_tac[z_minus_thm, z_plus_assoc_thm, z_plus0_thm]);
a(rewrite_tac [z_∀_elimⓩi⌝z_plus_order_thm]);
a(rewrite_tac [z_∀_elimⓩ~j⌝z_plus_order_thm]);
a(rewrite_tac[z_minus_thm, z_plus0_thm]);
a(conv_tac(LEFT_C (ONCE_MAP_C eq_sym_conv)));
a(conv_tac(LEFT_C (once_rewrite_conv[z_ℤ_eq_thm])));
a(rewrite_tac[z_minus_thm, z_plus0_thm]);
pop_thm()
));
=TEX
\subsection{Multiplicative Structure}
=SML
val ⦏z_times_def⦎ = rewrite_rule[ℤ_thm] (z_get_spec ⓩ(_ * _)⌝);
=TEX
=SML
val ⦏z_times_comm_thm⦎ = save_thm("z_times_comm_thm", (
push_goal ([], ⓩ∀i, j : 𝕌⦁ i * j = j * i⌝);
a(strip_asm_tac z_times_def);
a(asm_prove_tac[]);
pop_thm()
));
=TEX
=SML
val ⦏z_times_assoc_thm⦎ = save_thm("z_times_assoc_thm", (
push_goal ([], ⓩ∀i, j, k : 𝕌⦁ (i * j) * k = i * (j * k)⌝);
a(strip_asm_tac z_times_def);
a(asm_prove_tac[]);
pop_thm()
));
=TEX
=SML
val ⦏z_times_assoc_thm1⦎ = save_thm("z_times_assoc_thm1", (
push_goal ([], ⓩ∀i, j, k : 𝕌⦁ i * (j * k) = (i * j) * k⌝);
a(conv_tac (ONCE_MAP_C eq_sym_conv));
a(accept_tac z_times_assoc_thm);
pop_thm()
));
=TEX
=SML
val ⦏z_times_order_thm⦎ = save_thm("z_times_order_thm", (
push_goal ([], ⓩ∀i : 𝕌⦁ ∀ j, k : 𝕌⦁
		j * i = i * j
	∧	(i * j) * k = i * (j * k)
	∧	j * (i * k) = i * (j * k)⌝);
a(strip_asm_tac z_times_def);
a(asm_prove_tac[]);
a(rewrite_tac[z_times_assoc_thm1, z_∀_elimⓩ(i≜j, j≜i)⌝z_times_comm_thm]);
pop_thm()
));
=TEX
=SML
val ⦏z_times1_thm⦎ = save_thm("z_times1_thm", (
push_goal ([], ⓩ∀i : 𝕌⦁
		i * 1 = i
	∧	1 * i = i⌝);
a(strip_asm_tac z_times_def);
a(rewrite_tac[z_∀_elimⓩ(i≜i⦂ℤ, j≜1)⌝z_times_comm_thm]);
a(asm_prove_tac[]);
pop_thm()
));
=TEX
=SML
val ⦏z_times_plus_distrib_thm⦎ = save_thm("z_times_plus_distrib_thm", (
push_goal ([], ⓩ∀i, j, k : 𝕌⦁
		i*(j + k) = i*j + i*k
	∧	(i + j)*k = i*k + j*k⌝);
a(strip_asm_tac z_times_def);
a(asm_prove_tac[]);
a(once_rewrite_tac[z_times_comm_thm] THEN asm_prove_tac[]);
pop_thm()
));
=TEX
=SML
val ⦏z_times0_thm⦎ = save_thm("z_times0_thm", (
push_goal([], ⓩ∀i:𝕌⦁0*i = 0 ∧ i*0 = 0⌝);
a(rewrite_tac[z_∀_elimⓩi⦂ℤ⌝z_times_order_thm]);
a(REPEAT strip_tac);
a(LEMMA_T ⓩi*(0 + 1) = i⌝ (strip_asm_tac o
	rewrite_rule[z_times1_thm, z_plus_assoc_thm, z_plus_minus_thm, z_plus0_thm] o
	once_rewrite_rule[z_ℤ_eq_thm] o
	rewrite_rule[z_times_plus_distrib_thm]));
a(rewrite_tac[z_plus0_thm, z_times1_thm]);
pop_thm()
));
=TEX
=SML
val ⦏z_minus_times_thm⦎ = save_thm("z_minus_times_thm", (
push_goal([], ⓩ∀i, j:𝕌⦁(~i)*j = ~(i*j) ∧ i*(~j) = ~(i*j) ∧ (~i)*(~j) = i*j⌝);
a(lemma_tacⓩ∀i, j:𝕌⦁(~i)*j = ~(i*j)⌝);
(* *** Goal "1" *** *)
a(REPEAT strip_tac);
a(once_rewrite_tac[z_ℤ_eq_thm] THEN rewrite_tac[z_minus_thm]);
a(LEMMA_Tⓩ~ i * j + i * j = (~i + i) * j⌝ rewrite_thm_tac
	THEN1 rewrite_tac[z_times_plus_distrib_thm]);
a(rewrite_tac[z_plus_minus_thm, z_times0_thm]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[]);
a(lemma_tacⓩ∀i, j:𝕌⦁i*(~j) = ~(i*j)⌝);
(* *** Goal "2.1" *** *)
a(REPEAT strip_tac);
a(rewrite_tac[z_∀_elimⓩj⌝z_times_order_thm]);
a(asm_rewrite_tac[z_∀_elimⓩ~j⌝z_times_order_thm]);
(* *** Goal "2.2" *** *)
a(asm_rewrite_tac[z_minus_thm]);
pop_thm()
));
=TEX
=SML
val ⦏z_ℕ_times_thm⦎ = save_thm("z_ℕ_times_thm", (
push_goal([], ⓩ∀i, j:ℕ⦁i*j ∈ ℕ⌝);
a(REPEAT strip_tac THEN POP_ASM_T ante_tac);
a(z_ℕ_induction_tac);
(* *** Goal "1" *** *)
a(rewrite_tac[z_times0_thm, z_0_ℕ_thm]);
(* *** Goal "2" *** *)
a(rewrite_tac[z_times_plus_distrib_thm, z_times1_thm]);
a(all_asm_fc_tac[z_ℕ_plus_thm]);
pop_thm()
));
=TEX
=SML
val ⦏z_times_eq_0_thm⦎ = save_thm("z_times_eq_0_thm", (
push_goal([], ⓩ∀i, j:𝕌⦁i*j = 0 ⇔ i = 0 ∨ j = 0⌝);
a(lemma_tacⓩ∀a, b:ℕ ⦁ a*b = 0 ⇒ a = 0 ∨ b = 0⌝);
(* *** Goal "1" *** *)
a(REPEAT strip_tac);
a(strip_asm_tac (z_∀_elimⓩa⌝z_ℕ_cases_thm));
a(strip_asm_tac (z_∀_elimⓩb⌝z_ℕ_cases_thm));
a(asm_ante_tac ⓩa * b = 0⌝ THEN
	asm_rewrite_tac[z_times_plus_distrib_thm, z_times1_thm, z_plus_assoc_thm1]);
a(LIST_DROP_NTH_ASM_T [7,6,5,3,1] (fn _ => id_tac));
a(rename_tac[(ⓩj⌝, "m"), (⌜j'⌝, "n")] THEN all_fc_tac [z_ℕ_times_thm]);
a(LIST_DROP_NTH_ASM_T [4,2,1] (fn _ => id_tac));
a(all_fc_tac[z_ℕ_plus_thm]);
a(LIST_DROP_NTH_ASM_T [10,9,8,7,5,4,3,2,1] (fn _ => id_tac));
a(all_fc_tac[z_ℕ_plus_thm]);
a(LIST_DROP_NTH_ASM_T [12,11,10,9,8,7,6,5,4,2,1] (fn _ => id_tac));
a(all_fc_tac[z_ℕ_plus1_thm]);
a(strip_tac THEN all_fc_tac[z_ℕ_¬_plus1_thm]);
(* *** Goal "2" *** *)
a(REPEAT strip_tac THEN TRY_T (asm_rewrite_tac[z_times0_thm]));
a(strip_asm_tac (z_∀_elimⓩi⌝z_ℤ_cases_thm)
	THEN strip_asm_tac (z_∀_elimⓩj⌝z_ℤ_cases_thm));
(* *** Goal "2.1" *** *)
a(PC_T1"prop_eq"asm_prove_tac[]);
a(all_asm_fc_tac[]);
(* *** Goal "2.2" *** *)
a(asm_ante_tac ⓩi*j=0⌝ THEN asm_rewrite_tac[z_minus_times_thm]);
a(conv_tac(ONCE_MAP_C eq_sym_conv)THEN once_rewrite_tac[z_ℤ_eq_thm]);
a(rewrite_tac[z_minus_thm, z_plus0_thm] THEN REPEAT strip_tac);
a(z_spec_nth_asm_tac 7 ⓩ(a≜j',b≜j'')⌝);
a(PC_T1"prop_eq"asm_prove_tac[]);
(* *** Goal "2.3" *** *)
a(asm_ante_tac ⓩi*j=0⌝ THEN asm_rewrite_tac[z_minus_times_thm]);
a(conv_tac(LEFT_C(ONCE_MAP_C eq_sym_conv))THEN once_rewrite_tac[z_ℤ_eq_thm]);
a(rewrite_tac[z_minus_thm, z_plus0_thm] THEN REPEAT strip_tac);
a(z_spec_nth_asm_tac 7 ⓩ(a≜j',b≜j'')⌝);
a(asm_ante_tac ⓩ¬ i = 0⌝ THEN asm_rewrite_tac[z_minus_thm]);
(* *** Goal "2.4" *** *)
a(asm_ante_tac ⓩi*j=0⌝ THEN asm_rewrite_tac[z_minus_times_thm]);
a(REPEAT strip_tac);
a(asm_ante_tac ⓩ¬i=0⌝ THEN asm_rewrite_tac[]);
a(conv_tac(ONCE_MAP_C eq_sym_conv)THEN once_rewrite_tac[z_ℤ_eq_thm]);
a(rewrite_tac[z_minus_thm, z_plus0_thm]);
a(strip_tac);
a(all_asm_fc_tac[]);
pop_thm()
));
=TEX
=SML
val ⦏z_times_clauses⦎ = save_thm("z_times_clauses",(
push_goal([], ⓩ∀i, j : 𝕌⦁
	0 * i = 0 ∧ i * 0 = 0 ∧
	i * 1 = i ∧ 1 * i = i⌝);
a(rewrite_tac[z_times0_thm, z_times1_thm]);
pop_thm()
));
=TEX
\subsection{Inequalities}
=SML
val  ⦏z_≤_trans_thm⦎ = save_thm("z_≤_trans_thm", (
push_goal([], ⓩ∀i, j, k : 𝕌 | i ≤ j ≤ k ⦁ i ≤ k⌝);
a(rewrite_tac[rewrite_rule[ℤ_thm](z_get_specⓩ(_ ≤ _)⌝)] THEN REPEAT strip_tac);
a(rename_tac[(ⓩi⌝, "m"), (ⓩj⌝, "n")]  THEN all_fc_tac [z_ℕ_plus_thm]);
a(asm_ante_tac ⓩ(k - n) + (n - m) ∈ ℕ⌝);
a(rewrite_tac[rewrite_rule[ℤ_thm](z_get_specⓩ(_ - _)⌝)]);
a(rewrite_tac[
	prove_rule[z_plus_assoc_thm]
		ⓩ∀a,b,c,d:𝕌⦁(a + b) + (c + d) = (a + (b + c)) + d⌝,
	z_minus_thm, z_plus0_thm]);
pop_thm()
));
=TEX
=SML
val  ⦏z_less_trans_thm⦎ = save_thm("z_less_trans_thm", (
push_goal([], ⓩ∀i, j, k : 𝕌 | i < j < k ⦁ i < k⌝);
a(once_rewrite_tac[rewrite_rule[ℤ_thm](z_get_specⓩ(_ ≤ _)⌝)] THEN REPEAT strip_tac);
a(lemma_tacⓩj ≤ j + 1⌝ THEN rename_tac[(ⓩi⌝, "m"), (ⓩj⌝, "n"), (ⓩk⌝, "l")]
	THEN fc_tac [z_≤_trans_thm] THEN asm_fc_tac[] THEN asm_fc_tac[]);
a(rewrite_tac[rewrite_rule[ℤ_thm](z_get_specⓩ(_ ≤ _)⌝),
	rewrite_rule[ℤ_thm](z_get_specⓩ(_ - _)⌝)]);
a(rewrite_tac[z_∀_elim ⓩ~n⌝ z_plus_order_thm]);
a(rewrite_tac[z_plus_assoc_thm1, z_minus_thm]);
a(strip_asm_tac z_0_ℕ_thm THEN all_fc_tac [z_ℕ_plus1_thm]);
pop_thm()
));
=TEX
=SML
val  ⦏z_less_≤_trans_thm⦎ = save_thm("z_less_≤_trans_thm", (
push_goal([], ⓩ∀i, j, k : 𝕌 | i < j ≤ k ⦁ i < k⌝);
a(REPEAT strip_tac);
a(asm_ante_tac ⓩi < j⌝ THEN
	once_rewrite_tac[rewrite_rule[ℤ_thm](z_get_specⓩ(_ ≤ _)⌝)] THEN
	REPEAT strip_tac);
a(rename_tac[(ⓩi⌝, "m"), (ⓩj⌝, "n"), (ⓩk⌝, "l")]
	THEN fc_tac [z_≤_trans_thm] THEN asm_fc_tac[] THEN asm_fc_tac[]);
pop_thm()
));
=TEX
=SML
val  ⦏z_≤_less_trans_thm⦎ = save_thm("z_≤_less_trans_thm", (
push_goal([], ⓩ∀i, j, k : 𝕌 | i ≤ j < k ⦁ i < k⌝);
a(rewrite_tac[rewrite_rule[ℤ_thm](z_get_specⓩ(_ ≤ _)⌝),
	rewrite_rule[ℤ_thm](z_get_specⓩ(_ - _)⌝)]
		THEN REPEAT strip_tac);
a(rename_tac[(ⓩi⌝, "m"), (ⓩj⌝, "n")]  THEN all_fc_tac [z_ℕ_plus_thm]);
a(asm_ante_tacⓩ(k + ~ (n + 1)) + (n + ~ m) ∈ ℕ⌝ THEN rewrite_tac[z_minus_thm]);
a(rewrite_tac[z_∀_elim ⓩ~n⌝ z_plus_order_thm]);
a(rewrite_tac[z_∀_elim ⓩn⌝ z_plus_order_thm]);
a(rewrite_tac[z_plus_assoc_thm1, z_minus_thm, z_plus0_thm]);
a(rewrite_tac[z_∀_elim ⓩ~1⌝ z_plus_order_thm]);
pop_thm()
));
=TEX
=SML
val  ⦏z_minus_ℕ_≤_thm⦎ = save_thm("z_minus_ℕ_≤_thm", (
push_goal([], ⓩ∀i : 𝕌; j : ℕ ⦁ i + ~j ≤ i⌝);
a(rewrite_tac[rewrite_rule[ℤ_thm](z_get_specⓩ(_ ≤ _)⌝),
	rewrite_rule[ℤ_thm](z_get_specⓩ(_ - _)⌝), z_plus_assoc_thm1,
	z_minus_thm, z_plus0_thm] THEN REPEAT strip_tac);
pop_thm()
));
=TEX
=SML
val  ⦏z_≤_plus_ℕ_thm⦎ = save_thm("z_≤_plus_ℕ_thm", (
push_goal([], ⓩ∀i : 𝕌; j : ℕ ⦁ i  ≤ i + j⌝);
a(REPEAT strip_tac);
a(asm_rewrite_tac[rewrite_rule[ℤ_thm](z_get_specⓩ(_ ≤ _)⌝),
	rewrite_rule[ℤ_thm](z_get_specⓩ(_ - _)⌝),
	z_∀_elimⓩj⌝z_plus_order_thm, z_minus_thm, z_plus0_thm]);
pop_thm()
));
=TEX
=SML
val  ⦏z_≤_cases_thm⦎ = save_thm("z_≤_cases_thm", (
push_goal([], ⓩ∀i, j : 𝕌 ⦁ i ≤ j ∨ j ≤ i⌝);
a(rewrite_tac[rewrite_rule[ℤ_thm](z_get_specⓩ(_ ≤ _)⌝),
	rewrite_rule[ℤ_thm](z_get_specⓩ(_ - _)⌝)]);
a(REPEAT strip_tac);
a(all_fc_tac[z_¬_ℕ_thm]);
a(POP_ASM_T (strip_asm_tac o rewrite_rule[z_minus_thm] o
	once_rewrite_rule[z_plus_comm_thm]));
pop_thm()
));
=TEX
=SML
val  ⦏z_≤_refl_thm⦎ = save_thm("z_≤_refl_thm", (
push_goal([], ⓩ∀i : 𝕌 ⦁ i ≤ i⌝);
a(rewrite_tac[rewrite_rule[ℤ_thm](z_get_specⓩ(_ ≤ _)⌝),
	rewrite_rule[ℤ_thm](z_get_specⓩ(_ - _)⌝), z_minus_thm, z_0_ℕ_thm]);
pop_thm()
));
=TEX
=SML
val  ⦏z_∈_ℕ_thm⦎ = save_thm("z_∈_ℕ_thm", (
push_goal([], ⓩ∀i : 𝕌 ⦁ i ∈ ℕ ⇔ 0 ≤ i⌝);
a(rewrite_tac[rewrite_rule[ℤ_thm](z_get_specⓩ(_ ≤ _)⌝),
	rewrite_rule[ℤ_thm](z_get_specⓩ(_ - _)⌝), z_minus_thm, z_plus0_thm]);
pop_thm()
));
val  ⦏z_0_≤_ℕ_thm⦎ = conv_rule (ONCE_MAP_C eq_sym_conv) z_∈_ℕ_thm;
=TEX
=SML
val  ⦏z_≤_≤_0_thm⦎ = save_thm("z_≤_≤_0_thm", (
push_goal([], ⓩ∀i, j : 𝕌 ⦁ i ≤ j ⇔ i + ~j ≤ 0⌝);
a(rewrite_tac[rewrite_rule[ℤ_thm](z_get_specⓩ(_ ≤ _)⌝),
	rewrite_rule[ℤ_thm](z_get_specⓩ(_ - _)⌝), z_plus0_thm]);
a(rewrite_tac[z_minus_thm]);
a(rewrite_tac[z_∀_elimⓩ~i⌝z_plus_order_thm]);
pop_thm()
));
=TEX
=SML
val  ⦏z_≤_antisym_lemma⦎ = (
push_goal([], ⓩ∀i : 𝕌 | i ≤ 0 ∧ ~i ≤ 0 ⦁ i = 0⌝);
a(rewrite_tac[rewrite_rule[ℤ_thm](z_get_specⓩ(_ ≤ _)⌝),
	rewrite_rule[ℤ_thm](z_get_specⓩ(_ - _)⌝), z_plus0_thm, z_minus_thm]);
a(REPEAT strip_tac);
a(fc_tac[z_ℕ_¬_minus_thm]);
pop_thm()
);
=TEX
=SML
val ⦏z_≤_antisym_thm⦎ = save_thm("z_≤_antisym_thm", (
push_goal([], ⓩ∀i, j : 𝕌 | i ≤ j ∧ j ≤ i ⦁ i = j⌝);
a(once_rewrite_tac[z_≤_≤_0_thm]);
a(z_∀_tac);
a(rewrite_tac[prove_rule[z_minus_thm, z_∀_elimⓩj⌝z_plus_order_thm]
	ⓩj+ ~i = ~(i+ ~j)⌝]);
a(REPEAT strip_tac);
a(all_fc_tac[z_≤_antisym_lemma]);
a(once_rewrite_tac[z_ℤ_eq_thm] THEN strip_tac);
pop_thm()
));
=TEX
=SML
val ⦏z_¬_less_thm⦎ = save_thm("z_¬_less_thm", (
push_goal([], ⓩ∀i, j : 𝕌⦁ ¬i < j ⇔ j ≤ i⌝);
a(rewrite_tac[rewrite_rule[z_get_specⓩℤ⌝] (z_get_specⓩ(_ ≤ _)⌝),
	rewrite_rule[z_get_specⓩℤ⌝] (z_get_specⓩ(_ - _)⌝), z_minus_thm]);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(all_fc_tac[z_¬_ℕ_thm]);
a(fc_tac[z_ℕ_cases_thm]);
(* *** Goal "1.1" *** *)
a(swap_asm_concl_tac ⓩ¬ j + (~ i + ~ 1) ∈ ℕ⌝ );
a(LEMMA_T ⓩ~ ~(j + (~ i + ~ 1)) = 0⌝ (asm_tac o rewrite_rule[z_minus_thm])
	THEN (asm_rewrite_tac[] THEN rewrite_tac[z_minus_thm, z_0_ℕ_thm]));
(* *** Goal "1.2" *** *)
a(once_rewrite_tac[z_plus_comm_thm]);
a(LEMMA_Tⓩ~ (j + (~ i + ~ 1)) + ~1 = j' + (1 + ~1)⌝
	(asm_rewrite_thm_tac o
		rewrite_rule [z_plus_assoc_thm, z_minus_thm, z_plus0_thm]));
a(asm_rewrite_tac [z_plus_assoc_thm, z_minus_thm, z_plus0_thm]);
(* *** Goal "2" *** *)
a(asm_tac z_ℕ_plus_thm);
a(contr_tac THEN
	strip_asm_tac( z_∀_elimⓩ(i≜i + ~ j, j≜j + (~ i + ~ 1))⌝z_ℕ_plus_thm));
a(asm_ante_tac ⓩ(i + ~ j) + (j + (~ i + ~ 1)) ∈ ℕ⌝
	THEN rewrite_tac[z_∀_elimⓩ~i⌝z_plus_order_thm]);
a(rewrite_tac[z_∀_elimⓩ~1⌝z_plus_order_thm,
	z_plus_assoc_thm, z_minus_thm, z_plus0_thm, ∧_right_elim z_ℕ_thm]);
pop_thm()
));
=TEX
=SML
val ⦏z_¬_≤_thm⦎ = save_thm("z_¬_≤_thm", (
push_goal([], ⓩ∀i, j : 𝕌⦁ ¬i ≤ j ⇔ j < i⌝);
a(rewrite_tac[conv_rule(ONCE_MAP_C eq_sym_conv) z_¬_less_thm]);
pop_thm()
));
=TEX
The following lemma is useful in proving $z\_≤\_clauses$. But as the automatic
proof procedure in the proof context will readily prove such trivia, it
is not saved.
=SML
val ⦏z_≤_plus_thm⦎ = ((
push_goal([], ⓩ∀i, j, k : 𝕌⦁ i + k ≤ j + k ⇔ i ≤ j⌝);
a(z_∀_tac THEN pure_once_rewrite_tac [z_≤_≤_0_thm]);
a(rewrite_tac[z_minus_thm, z_∀_elimⓩ~j⌝ z_plus_order_thm,
	z_plus0_thm, z_plus_assoc_thm]);
pop_thm()
));
=TEX
=SML
val ⦏z_≤_clauses⦎ = save_thm("z_≤_clauses", (
push_goal([], ⓩ∀i, j, k : 𝕌⦁
	(i + k ≤ j + k ⇔ i ≤ j)
∧	(k + i ≤ j + k ⇔ i ≤ j)
∧	(i + k ≤ k + j ⇔ i ≤ j)
∧	(k + i ≤ k + j ⇔ i ≤ j)
∧	(i + k ≤ k ⇔ i ≤ 0)
∧	(k + i ≤ k ⇔ i ≤ 0)
∧	(i ≤ k + i ⇔ 0 ≤ k)
∧	(i ≤ i + k ⇔ 0 ≤ k)
∧	i ≤ i
∧ 	¬1 ≤ 0
∧ 	0 ≤ 1
⌝);
a(z_∀_tac);
a(rewrite_tac [z_∀_elimⓩi⌝z_plus_order_thm]);
a(rewrite_tac[prove_rule[z_plus0_thm]
	ⓩ∀x:𝕌⦁(x ≤ k ⇔ x ≤ k + 0) ∧ (i ≤ x ⇔ i + 0 ≤ x)⌝]);
a(rewrite_tac [z_∀_elimⓩj⌝z_plus_order_thm]);
a(rewrite_tac [prove_rule[z_plus0_thm]ⓩk + 0 = 0 + k⌝,
		z_≤_refl_thm, z_≤_plus_thm]);
a(rewrite_tac [prove_rule[z_plus0_thm]ⓩi + 0 = 0 + i⌝,
		z_∀_elimⓩk⌝z_plus_order_thm, z_≤_refl_thm, z_≤_plus_thm]);
a(rewrite_tac[z_plus0_thm, z_≤_refl_thm]);
a(rewrite_tac[rewrite_rule[z_get_specⓩℤ⌝] (z_get_specⓩ(_ ≤ _)⌝),
	rewrite_rule[z_get_specⓩℤ⌝] (z_get_specⓩ(_ - _)⌝), z_plus0_thm,
	∧_right_elim z_ℕ_thm]);
a(rewrite_tac[z_minus_thm, z_plus0_thm]);
a(rewrite_tac[rewrite_rule[z_0_ℕ_thm, z_plus0_thm](z_∀_elimⓩ0⌝z_ℕ_plus1_thm)]);
pop_thm()
));
=TEX
=SML
val ⦏z_less_clauses⦎ = save_thm("z_less_clauses", (
push_goal([], ⓩ∀i, j, k : 𝕌⦁
	(i + k < j + k ⇔ i < j)
∧	(k + i < j + k ⇔ i < j)
∧	(i + k < k + j ⇔ i < j)
∧	(k + i < k + j ⇔ i < j)
∧	(i + k < k ⇔ i < 0)
∧	(k + i < k ⇔ i < 0)
∧	(i < k + i ⇔ 0 < k)
∧	(i < i + k ⇔ 0 < k)
∧	¬i < i
∧	0 < 1
∧	¬1 < 0
⌝);
a(z_∀_tac);
a(once_rewrite_tac[rewrite_rule[z_get_specⓩℤ⌝] (z_get_specⓩ(_ < _)⌝)]);
a(rewrite_tac [z_≤_clauses, z_plus_assoc_thm]);
a(rewrite_tac [z_∀_elimⓩk⌝z_plus_order_thm]);
a(rewrite_tac [z_≤_clauses, z_plus0_thm]);
a(rewrite_tac [z_¬_≤_thm]);
a(once_rewrite_tac[rewrite_rule[z_get_specⓩℤ⌝] (z_get_specⓩ(_ < _)⌝)]);
a(rewrite_tac [z_≤_clauses, z_plus0_thm]);
pop_thm()
));
=TEX
=SML
val ⦏z_less_irrefl_thm⦎ = save_thm("z_less_irrefl_thm", (
push_goal([], ⓩ∀i, j : 𝕌⦁ ¬(i < j ∧ j < i)⌝);
a(REPEAT strip_tac);
a(once_rewrite_tac[rewrite_rule[z_get_specⓩℤ⌝] (z_get_specⓩ(_ < _)⌝)]
	THEN contr_tac);
a(asm_tac(prove_rule[z_less_clauses]ⓩi < i + 1⌝));
a(strip_asm_tac(z_∀_elimⓩ(i≜j,j≜i,k≜i+1)⌝z_less_trans_thm));
a(strip_asm_tac(z_∀_elimⓩ(i≜j,j≜i+1,k≜j)⌝z_less_≤_trans_thm));
a(POP_ASM_T (strip_asm_tac o rewrite_rule[z_less_clauses]));
pop_thm()
));
=TEX
\subsection{Theorems about $abs$}
=SML
val  ⦏z_abs_thm⦎ = save_thm("z_abs_thm", (
push_goal([], ⓩ∀i:ℕ⦁abs i = i ∧ abs ~i = i⌝);
a(strip_asm_tac (z_get_specⓩ(abs _)⌝));
a(strip_asm_tac (nth 1 (strip_∧_rule (z_get_specⓩ(~_)⌝))));
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(lemma_tacⓩi ∈ ℤ⌝ THEN1 rewrite_tac[ℤ_thm]);
a(fc_tac[z_→_∈_rel_⇔_app_eq_thm] THEN asm_fc_tac[]);
a(LEMMA_T ⓩ(i, i) ∈ (abs _)⌝ (fn th => asm_tac th THEN asm_fc_tac[]));
a(asm_rewrite_tac[] THEN MERGE_PCS_T1 z_more_pcs asm_prove_tac[]);
(* *** Goal "2" *** *)
a(lemma_tacⓩ~i ∈ ℤ⌝ THEN1 rewrite_tac[ℤ_thm]);
a(fc_tac[z_→_∈_rel_⇔_app_eq_thm] THEN asm_fc_tac[]);
a(LEMMA_T ⓩ(~i, i) ∈ (abs _)⌝ (fn th => asm_tac th THEN asm_fc_tac[]));
a(asm_rewrite_tac[] THEN MERGE_PCS_T1 z_more_pcs REPEAT strip_tac);
(* *** Goal "2.1" *** *)
a(ALL_FC_T rewrite_tac [z_ℕ_¬_minus_thm]);
a(rewrite_tac[z_0_ℕ_thm, z_minus_thm]);
(* *** Goal "2.2" *** *)
a(i_contr_tac THEN POP_ASM_T ante_tac);
a(LIST_DROP_NTH_ASM_T [9,8,6,5,4,3,2,1] (fn _=> id_tac));
a(lemma_tacⓩ~i ∈ ℤ ∧ ~ ~i = i⌝ THEN1 rewrite_tac[z_minus_thm, ℤ_thm]);
a(all_fc_tac[z_→_app_eq_⇔_∈_rel_thm] THEN REPEAT strip_tac);
(* *** Goal "2.3" *** *)
a(i_contr_tac THEN POP_ASM_T ante_tac);
a(LIST_DROP_NTH_ASM_T [9,8,6,4,3,2,1] (fn _=> id_tac));
a(lemma_tacⓩ~i ∈ ℤ ∧ ~ ~i = i⌝ THEN1 rewrite_tac[z_minus_thm, ℤ_thm]);
a(all_fc_tac[z_→_app_eq_⇔_∈_rel_thm] THEN REPEAT strip_tac);
pop_thm()
));
=TEX
=SML
val  ⦏z_abs_minus_thm⦎ = save_thm("z_abs_minus_thm", (
push_goal([], ⓩ∀i:𝕌⦁abs ~i = abs i⌝);
a(REPEAT strip_tac);
a(strip_asm_tac (z_∀_elim ⓩi⌝ z_ℤ_cases_thm) THEN asm_rewrite_tac[]);
(* *** Goal "1" *** *)
a(ALL_FC_T rewrite_tac[z_abs_thm]);
(* *** Goal "2" *** *)
a(rewrite_tac[z_minus_thm]);
a(ALL_FC_T rewrite_tac[z_abs_thm]);
(* *** Goal "2" *** *)
pop_thm()
));
=TEX
=SML
val  ⦏z_abs_ℕ_thm⦎ = save_thm("z_abs_ℕ_thm", (
push_goal([], ⓩ∀i:𝕌⦁abs i ∈ ℕ⌝);
a(REPEAT strip_tac THEN strip_asm_tac (z_∀_elimⓩi⦂ℤ⌝z_ℤ_cases_thm)
	THEN asm_rewrite_tac[] THEN ALL_FC_T asm_rewrite_tac[z_abs_thm]);
pop_thm()
));
=TEX
=SML
val  ⦏z_abs_times_thm⦎ = save_thm("z_abs_times_thm", (
push_goal([], ⓩ∀i, j:𝕌⦁abs (i * j) = abs i * abs j⌝);
a(REPEAT strip_tac);
a(strip_asm_tac (z_∀_elim ⓩi⌝ z_ℤ_cases_thm)
	THEN strip_asm_tac (z_∀_elim ⓩj⌝ z_ℤ_cases_thm)
	THEN asm_rewrite_tac[z_minus_times_thm, z_abs_minus_thm]
	THEN all_fc_tac[z_ℕ_times_thm]
	THEN ALL_FC_T rewrite_tac[z_abs_thm]);
pop_thm()
));
=TEX
In the following proof of the triangle inequality,
the second and third cases (subgoals 2.3 and 2.4)
of the main case split are virtually the same (as in
fact are the first and fourth, but their proofs are short). The lemma in
the second line of the proof is the second case.
=SML
val  ⦏z_abs_plus_thm⦎ = save_thm("z_abs_plus_thm", (
push_goal([], ⓩ∀i, j:𝕌⦁abs (i + j) ≤ abs i + abs j⌝);
a(REPEAT strip_tac);
a(lemma_tacⓩ∀i, j, j', j'': 𝕌⦁
		j' ∈ ℕ ⇒ i = j' ⇒ j'' ∈ ℕ ⇒ j = ~ j''
	⇒	abs (j' + ~ j'') ≤ abs j' + abs ~ j''⌝);
(* *** Goal "1" *** *)
a(REPEAT strip_tac);
a(strip_asm_tac (z_∀_elim ⓩj' + ~j''⌝ z_ℤ_cases_thm) THEN asm_rewrite_tac[]);
(* *** Goal "1.1" *** *)
a(ALL_FC_T rewrite_tac[z_abs_thm]);
a(POP_ASM_T (rewrite_thm_tac o eq_sym_rule));
a(bc_tac[conv_rule z_∀_elim_conv1 z_≤_trans_thm]);
a(∃_tacⓩj'⌝);
a(all_fc_tac[z_minus_ℕ_≤_thm, z_≤_plus_ℕ_thm]);
a(asm_prove_tac[]);
(* *** Goal "1.2" *** *)
a(ALL_FC_T rewrite_tac[z_abs_thm]);
a(LEMMA_T ⓩ~ ~j''' = ~(j' + ~ j'')⌝
	(rewrite_thm_tac o rewrite_rule[z_minus_thm])
	THEN1 POP_ASM_T (rewrite_thm_tac o eq_sym_rule));
a(bc_tac[conv_rule z_∀_elim_conv1 z_≤_trans_thm]);
a(∃_tacⓩj''⌝);
a(all_fc_tac[z_minus_ℕ_≤_thm, z_≤_plus_ℕ_thm]);
a(once_rewrite_tac [z_plus_comm_thm]);
a(asm_prove_tac[]);
(* *** Goal "2" *** *)
a(strip_asm_tac (z_∀_elim ⓩi⌝ z_ℤ_cases_thm)
	THEN strip_asm_tac (z_∀_elim ⓩj⌝ z_ℤ_cases_thm)
	THEN asm_rewrite_tac[]
	THEN_LIST [id_tac, id_tac, once_rewrite_tac [z_plus_comm_thm], id_tac]);
(* *** Goal "2.1" *** *)
a(all_fc_tac[z_ℕ_plus_thm] THEN ALL_FC_T rewrite_tac[z_abs_thm]
	THEN rewrite_tac[z_≤_refl_thm]);
(* *** Goal "2.2" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "2.3" *** *)
a(rename_tac[] THEN all_asm_fc_tac[]);
(* *** Goal "2.4" *** *)
a(rewrite_tac[prove_rule[z_minus_thm]ⓩ~j' + ~j'' = ~(j' + j'')⌝,
	z_abs_minus_thm]);
a(all_fc_tac[z_ℕ_plus_thm] THEN ALL_FC_T rewrite_tac[z_abs_thm]
	THEN rewrite_tac[z_≤_refl_thm]);
pop_thm()
));
=TEX
=SML
val  ⦏z_abs_eq_0_thm⦎ = save_thm("z_abs_eq_0_thm", (
push_goal([], ⓩ∀i:𝕌⦁abs i = 0 ⇔ i = 0⌝);
a(REPEAT strip_tac);
a(strip_asm_tac (z_∀_elim ⓩi⌝ z_ℤ_cases_thm));
(* *** Goal "1.1" *** *)
a(PC_T1"prop_eq" asm_prove_tac[]);
a(all_fc_tac[z_abs_thm]);
a(PC_T1"prop_eq" asm_prove_tac[]);
(* *** Goal "1.2" *** *)
a(asm_ante_tac ⓩabs i = 0⌝ THEN POP_ASM_T rewrite_thm_tac);
a(all_fc_tac[z_abs_thm]);
a(asm_rewrite_tac[] THEN strip_tac THEN asm_rewrite_tac[z_minus_thm]);
(* *** Goal "2" *** *)
a(strip_asm_tac z_0_ℕ_thm THEN all_fc_tac[z_abs_thm]);
a(asm_rewrite_tac[]);
pop_thm()
));
=TEX
=SML
val  ⦏z_ℕ_abs_minus_thm⦎ = save_thm("z_ℕ_abs_minus_thm", (
push_goal([], ⓩ∀i, j:ℕ | j ≤ i ⦁abs (i + ~j) ≤ i⌝);
a(rewrite_tac[rewrite_rule[ℤ_thm](z_get_specⓩ(_ ≤ _)⌝),
	rewrite_rule[ℤ_thm](z_get_specⓩ(_ - _)⌝)]);
a(REPEAT strip_tac);
a(ALL_FC_T rewrite_tac[z_abs_thm]);
a(asm_rewrite_tac[z_minus_thm, z_plus_assoc_thm1, z_plus0_thm]);
pop_thm()
));
=TEX
=SML
val ⦏z_≤_induction_thm⦎ = save_thm("z_≤_induction_thm", (
push_goal([], ⌜∀ j : ℤ ⦁ ∀ p : ℤ → BOOL ⦁ p j
	∧	(∀ i : ℤ ⦁ ⓩj ≤ i⌝ ∧ p i ⇒ p ⓩi + 1⌝)
	⇒	(∀ m : ℤ ⦁ ⓩj ≤ m⌝ ⇒ p m)⌝);
a (REPEAT z_strip_tac);
a (lemma_tac ⓩ∃ k : ℕ ⦁ k = m - j⌝);
a (z_∃_tac ⓩm - j⌝);
a (REPEAT z_strip_tac);
a (lemma_tac ⓩj ≤ m ⇒ 0 ≤ m - j⌝);
a (asm_rewrite_tac[rewrite_rule[ℤ_thm](z_get_specⓩ(_ - _)⌝)]);
a (asm_ante_tacⓩj ≤ m⌝);
a (once_rewrite_tac[z_≤_≤_0_thm]);
a (rewrite_tac[z_minus_thm, z_plus_clauses]);
a (rewrite_tac[z_∀_elim ⓩj⌝ z_plus_order_thm]);
a (rewrite_tac[z_∈_ℕ_thm]);
a (asm_rewrite_tac[]);
a (lemma_tac ⓩm = k + j⌝);
a (asm_rewrite_tac[rewrite_rule[ℤ_thm](z_get_specⓩ(_ - _)⌝)]);
a (rewrite_tac[z_plus_assoc_thm, z_plus_clauses, z_minus_clauses]);
a (var_elim_asm_tac ⓩm = k + j⌝);
a (GET_ASM_T ⓩk ∈ ℕ⌝ ante_tac);
a (z_ℕ_induction_tac);
a (asm_rewrite_tac [z_plus_clauses]);
a (lemma_tac ⓩj ≤ i + j⌝);
a (asm_ante_tacⓩi ∈ ℕ⌝);
a (asm_rewrite_tac [z_≤_clauses, z_∈_ℕ_thm]);
a (all_asm_fc_tac[]);
a (POP_ASM_T ante_tac);
a (rewrite_tac [z_∀_elim ⌜j : ℤ⌝ z_plus_order_thm]);
pop_thm()
));
=TEX
=SML
fun ⦏z_≤_induction_tac⦎ (tm : TERM) : TACTIC = (
	if not (is_var tm andalso type_of tm =: ⓣℤ⌝)
	then term_fail "z_≤_induction_tac" 86401 [tm]
	else ( fn(asms, conc) =>
	let	val asm = find asms (fn t => is_z_≤ t andalso snd(dest_z_≤ t) =$ tm)
			handle Fail _ => fail "z_≤_induction_tac" 86402 [];
		val thm = ∀_elim (fst(dest_z_≤ asm)) z_≤_induction_thm;
	in	if not (is_free_in tm conc)
			then term_fail "z_≤_induction_tac" 86404 [tm]
		else if any (asms drop (fn t => t =$ asm)) (is_free_in tm)
			then term_fail "z_≤_induction_tac" 86403 [tm]
		else	(asm_ante_tac asm THEN gen_induction_tac1 thm) (asms, conc)
	end
	)
);
=TEX
=SML
val z_less_plus1_thm = save_thm("z_less_plus1_thm", (
push_goal([], ⓩ∀ m, n : 𝕌 ⦁ m < n + 1 ⇔ m = n ∨ m < n⌝);
a (rewrite_tac[rewrite_rule[ℤ_thm](z_get_specⓩ(_ < _)⌝)]);
a (rewrite_tac[rewrite_rule[ℤ_thm](z_get_specⓩ(_ - _)⌝)]);
a (rewrite_tac[z_minus_thm, z_plus_assoc_thm]);
a (rewrite_tac[z_∀_elim ⓩ~ m⌝ z_plus_order_thm]);
a (rewrite_tac[z_minus_clauses, z_plus_clauses]);
a (REPEAT strip_tac);
(* *** Goal "1" *** *)
a (eq_sym_asm_tac ⓩ¬ m = n⌝);
a (GET_ASM_T ⓩ¬ n = m⌝ ante_tac);
a (once_rewrite_tac[z_ℤ_eq_thm]);
a (rewrite_tac[z_∀_elimⓩ~ m⌝ z_plus_order_thm]);
a (REPEAT strip_tac);
a (strip_asm_tac (z_∀_elim ⓩ~ m + n⌝ z_ℕ_cases_thm));
a (lemma_tac ⓩ~ m + (n + ~ 1) = j⌝);
(* *** Goal "1.1" *** *)
a (asm_ante_tacⓩ~ m + n = j + 1⌝);
a (once_rewrite_tac[z_ℤ_eq_thm]);
a (rewrite_tac[z_minus_thm, z_plus_assoc_thm]);
a (rewrite_tac [z_∀_elim ⓩ~ j⌝ z_plus_order_thm]);
(* *** Goal "1.2" *** *)
a (asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a (asm_rewrite_tac[]);
a (rewrite_tac[z_minus_clauses]);
a (rewrite_tac[z_0_ℕ_thm]);
(* *** Goal "3" *** *)
a (ante_tac (z_∀_elim ⓩ~ m + (n + ~ 1)⌝ z_ℕ_plus1_thm));
a (strip_tac THEN POP_ASM_T ante_tac);
a (rewrite_tac[z_plus_assoc_thm, z_minus_clauses, z_plus_clauses]);
pop_thm()
));
=TEX
=SML
val ⦏z_cov_induction_thm⦎ = save_thm("z_cov_induction_thm", (
set_goal([], ⌜∀ (j:ℤ) (p:ℤ→BOOL) ⦁
	(∀ i ⦁ ⓩj ≤ i⌝ ∧ ⓩ∀ k : ℤ⦁ j ≤ k ∧ k < i ⇒ ⌜p k⌝⌝ ⇒ p i)
	⇒ (∀ i ⦁ ⓩj ≤ i⌝ ⇒ p i)⌝);
a (REPEAT z_strip_tac);
a (lemma_tac ⌜ⓩ∀ k : ℤ⦁ j ≤ k ∧ k < i ⇒ ⌜p k⌝⌝⌝);
(* *** Goal "1" *** *)
a (z_≤_induction_tac ⓩi⌝);
(* *** Goal "1.1" *** *)
a (REPEAT z_strip_tac);
a (lemma_tac ⓩj ≤ k ⇔ ¬ k < j⌝);
a (rewrite_tac[z_¬_less_thm]);
(* *** Goal "1.2" *** *)
a (rewrite_tac [z_less_plus1_thm] THEN REPEAT z_strip_tac);
(* *** Goal "1.2.1" *** *)
a (POP_ASM_T rewrite_thm_tac);
a (all_asm_fc_tac[]);
(* *** Goal "1.2.2" *** *)
a (all_asm_fc_tac[]);
(* *** Goal "2" *** *)
a (all_asm_fc_tac[]);
pop_thm()
));
=TEX
=SML
fun ⦏z_cov_induction_tac⦎ (tm : TERM) : TACTIC = (
	if not (is_var tm andalso type_of tm =: ⓣℤ⌝)
	then term_fail "z_cov_induction_tac" 86401 [tm]
	else ( fn(asms, conc) =>
	let	val asm = find asms (fn t => is_z_≤ t andalso snd(dest_z_≤ t) =$ tm)
			handle Fail _ => fail "z_cov_induction_tac" 86402 [];
		val thm = ∀_elim (fst(dest_z_≤ asm)) z_cov_induction_thm;
	in	if not (is_free_in tm conc)
			then term_fail "z_cov_induction_tac" 86404 [tm]
		else if any (asms drop (fn t => t =$ asm)) (is_free_in tm)
			then term_fail "z_cov_induction_tac" 86403 [tm]
		else	(asm_ante_tac asm THEN gen_induction_tac1 thm) (asms, conc)
	end
	)
);
=TEX
\subsection{Theorems about $div$ and $mod$}
=TEX
=SML
val  ⦏z_div_mod_unique_lemma1⦎ = (
push_goal([], ⓩ∀i, j : ℕ ⦁ i*j < j ⇒ i = 0⌝);
a(REPEAT strip_tac);
a(strip_asm_tac (z_∀_elim ⓩi⌝ z_ℕ_cases_thm));
a(asm_ante_tacⓩi * j < j⌝ THEN asm_rewrite_tac[z_times_plus_distrib_thm, z_times1_thm]);
a(rewrite_tac[rewrite_rule[ℤ_thm](z_get_specⓩ(_ ≤ _)⌝),
	rewrite_rule[ℤ_thm](z_get_specⓩ(_ - _)⌝),
	z_minus_thm]);
a(rewrite_tac[z_∀_elim ⓩ~j⌝z_plus_order_thm]);
a(rewrite_tac[z_plus_assoc_thm1, z_minus_thm, z_plus0_thm]);
a(LIST_DROP_NTH_ASM_T [1,4] (fn _ => id_tac));
a(all_fc_tac[z_ℕ_times_thm]);
a(LIST_DROP_NTH_ASM_T [1,3,4,5] (fn _ => id_tac));
a(rename_tac[(ⓩj⌝, "m")]);
a(strip_tac THEN all_fc_tac[z_ℕ_plus_thm]);
a(asm_ante_tacⓩj' * m + (~ (j' * m) + ~ 1) ∈ ℕ⌝);
a(rewrite_tac[z_plus_assoc_thm1, z_minus_thm, z_plus0_thm,
	∧_right_elim z_ℕ_thm]);
pop_thm()
);
=SML
val  ⦏z_div_mod_unique_lemma2⦎ = (
push_goal([], ⓩ∀j, d, r:𝕌 | ¬j = 0 ⦁
		(d*j + r = 0 ∧ 0 ≤ r < abs j)
	⇒	d = 0 ∧ r = 0⌝);
a(REPEAT_UNTIL is_∧ strip_tac);
a(LEMMA_T ⓩd = 0⌝ (
	fn th => asm_ante_tac ⓩd * j + r = 0⌝ THEN
	rewrite_tac[th, z_times0_thm, z_plus0_thm]));
a(LEMMA_T ⓩabs(d*j) = 0⌝
	(strip_asm_tac o rewrite_rule[z_abs_times_thm, z_abs_eq_0_thm, z_times_eq_0_thm]));
a(LEMMA_T ⓩabs(d*j) < abs j⌝ (strip_asm_tac o rewrite_rule[z_abs_times_thm]));
(* *** Goal "1" *** *)
a(once_rewrite_tac[
	prove_rule[z_plus_assoc_thm,
		z_minus_thm, z_plus0_thm]ⓩd*j = (d*j + r) + ~r⌝]);
a(bc_tac[conv_rule z_∀_elim_conv1 z_≤_less_trans_thm]);
a(∃_tacⓩr⌝);
a(asm_ante_tac ⓩ0 ≤ r⌝ THEN asm_rewrite_tac[z_0_≤_ℕ_thm, z_plus0_thm]);
a(strip_tac THEN ALL_FC_T rewrite_tac [z_abs_thm]);
a(rewrite_tac[z_≤_refl_thm]);
(* *** Goal "2" *** *)
a(rewrite_tac[z_abs_times_thm]);
a(strip_asm_tac (z_∀_elimⓩd⌝ z_abs_ℕ_thm));
a(strip_asm_tac (z_∀_elimⓩj⌝ z_abs_ℕ_thm));
a(all_fc_tac [z_ℕ_times_thm]);
a(ALL_FC_T rewrite_tac [z_div_mod_unique_lemma1]);
a(rewrite_tac[z_times0_thm]);
pop_thm()
);
=TEX
=SML
val  ⦏z_div_mod_unique_lemma3⦎ = (
push_goal([], ⓩ∀i, j, d, r, D, R:𝕌 | ¬j = 0 ⦁
		(D*j + R = d*j + r ∧ 0 ≤ r ≤ R < abs j)
	⇒	D = d ∧ R = r⌝);
a(REPEAT_UNTIL is_∧ strip_tac);
a(GET_ASM_TⓩD*j + R = d*j + r⌝ (ante_tac o once_rewrite_rule[z_ℤ_eq_thm]));
a(LEMMA_Tⓩ(D * j + R) + ~ (d * j + r) = (D + ~d)*j + (R + ~r)⌝
	rewrite_thm_tac);
(* *** Goal "1" *** *)
a(rewrite_tac[z_minus_thm, z_times_plus_distrib_thm, z_minus_times_thm,
	z_plus_assoc_thm]);
a(rewrite_tac[z_∀_elim ⓩR⌝ z_plus_order_thm]);
(* *** Goal "2" *** *)
a(GET_ASM_Tⓩ0 ≤ r⌝(asm_tac o rewrite_rule [z_0_≤_ℕ_thm]));
a(LEMMA_Tⓩ0 ≤ R⌝ (fn th => asm_tac(rewrite_rule[z_0_≤_ℕ_thm] th)
	THEN asm_tac th)
	THEN1 all_fc_tac[z_≤_trans_thm]);
a(strip_asm_tac (z_∀_elimⓩ(i≜R,j≜r)⌝ z_ℕ_abs_minus_thm));
a(GET_ASM_Tⓩr ≤ R⌝ (asm_tac o rewrite_rule[
	rewrite_rule[ℤ_thm](z_get_specⓩ(_ ≤ _)⌝),
	rewrite_rule[ℤ_thm](z_get_specⓩ(_ - _)⌝)]));
a(strip_asm_tac(z_∀_elimⓩR + ~ r⌝ z_abs_thm));
a(POP_ASM_T(fn _ => POP_ASM_T (fn th => GET_NTH_ASM_T 2
	(asm_tac o rewrite_rule[th]))));
a(GET_ASM_T ⓩR + ~ r ∈ ℕ⌝
	(asm_tac o rewrite_rule[conv_rule (ONCE_MAP_C eq_sym_conv)
	z_0_≤_ℕ_thm]));
a(strip_asm_tac (z_∀_elimⓩ(i≜R + ~ r,j≜R,k≜abs j)⌝ z_≤_less_trans_thm));
a(strip_tac THEN
	strip_asm_tac (z_∀_elimⓩ(j≜j,d≜D+ ~d,r≜R + ~r)⌝
	z_div_mod_unique_lemma2));
a(once_rewrite_tac[z_ℤ_eq_thm] THEN REPEAT strip_tac);
pop_thm()
);
=TEX
=SML
val  ⦏z_div_mod_unique_thm⦎ = save_thm("z_div_mod_unique_thm", (
push_goal([], ⓩ∀i, j, d, r:𝕌 | ¬j = 0 ⦁
		(i = d*j + r ∧ 0 ≤ r < abs j)
	⇔	(d = i div j ∧ r = i mod j)⌝);
a(REPEAT_N 9 strip_tac);
a(MERGE_PCS_T1 z_more_pcs strip_asm_tac (z_∀_elim ⓩ(i≜i,j≜j)⌝
	(rewrite_rule[ℤ_thm](∧_right_elim(z_get_specⓩ(_ div _)⌝)))));
a(strip_asm_tac (z_∀_elim ⓩ(i≜r,j≜i mod j)⌝z_≤_cases_thm));
(* *** Goal "1.1" *** *)
a(strip_asm_tac z_div_mod_unique_lemma3);
a(DROP_ASM_T ⓩi = d * j + r⌝ (fn th1 => DROP_ASM_T
	ⓩi = (i div j) * j + i mod j⌝
	(fn th2 => asm_tac(eq_trans_rule(eq_sym_rule th2) th1))));
a(all_asm_fc_tac[]);
a(asm_rewrite_tac[]);
(* *** Goal "1.2" *** *)
a(strip_asm_tac z_div_mod_unique_lemma3);
a(DROP_ASM_T ⓩi = d * j + r⌝ (fn th1 => DROP_ASM_Tⓩi = (i div j) * j + i mod j⌝
	(fn th2 => asm_tac(eq_trans_rule(eq_sym_rule th1) th2))));
a(all_asm_fc_tac[]);
a(asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(MERGE_PCS_T1 z_more_pcs strip_asm_tac (z_∀_elim ⓩ(i≜i,j≜j)⌝
	(rewrite_rule[ℤ_thm](∧_right_elim(z_get_specⓩ(_ div _)⌝)))));
a(DROP_ASM_T ⓩi = (i div j) * j + i mod j⌝ once_rewrite_thm_tac);
a(asm_rewrite_tac[]);
pop_thm()
));
=TEX
\section{CONVERSIONS}
=SML
val _ = set_pc"z_predicates";
val ⦏z_ℕ_plus_conv_thm⦎ = ((
push_goal([], ⌜∀ m n k⦁
	m + n = k ⇒ ⓩ⌜Z'Int m⌝ + ⌜Z'Int n⌝ = ⌜Z'Int k⌝⌝
⌝);
a(REPEAT strip_tac THEN
	asm_rewrite_tac[conv_rule(ONCE_MAP_C eq_sym_conv) z_int_homomorphism_thm]);
pop_thm()
));
=TEX
=SML
val ⦏z_plus_eg⦎ = ⓩi + j⌝;
val ⦏z_times_eg⦎ = ⓩi * j⌝;
val ⦏z_subtract_eg⦎ = ⓩi - j⌝;
val ⦏z_greater_eg⦎ = ⓩi > j⌝;
val ⦏z_≥_eg⦎ = ⓩi ≥ j⌝;
val ⦏z_∈_ℕ_eg⦎ = ⓩi ∈ ℕ⌝;
val ⦏z_abs_eg⦎ = ⓩabs i⌝;
val ⦏z_mod_eg⦎ = ⓩi mod j⌝;
val ⦏z_less_eg⦎ = ⓩi < j⌝;
val ⦏z_div_eg⦎ = ⓩi div j⌝;
val ⦏z_≤_eg⦎ = ⓩi ≤ j⌝;
val ⦏z_eq_eg⦎ = ⓩi = j⌝;
=TEX
=SML
val ⦏z_ℕ_plus_conv⦎ : CONV = (fn tm =>
	let	val ((_, hol_op1), (_, hol_op2)) =
			((dest_app ** dest_app)(dest_z_plus tm))
			handle Fail _ => term_fail "z_ℕ_plus_conv" 86303 [tm, z_plus_eg];
		val thm1 = (plus_conv (mk_plus (hol_op1, hol_op2)))
			handle Fail _ => term_fail "z_ℕ_plus_conv" 86303 [tm, z_plus_eg];
		val thm2 = simple_⇒_match_mp_rule z_ℕ_plus_conv_thm thm1
			handle ex => reraise ex "z_ℕ_plus_conv";
	in	(accept_conv thm2 tm)
		handle Fail _ => term_fail "z_ℕ_plus_conv" 86303 [tm, z_plus_eg]
	end
);
=TEX
=SML
val ⦏z_subtract_minus_conv_thm⦎ = ((
push_goal([], ⌜∀ m n⦁ⓩm - n = m + ~n⌝⌝);
a(rewrite_tac[rewrite_rule[z_get_specⓩℤ⌝](z_get_specⓩ(_ - _)⌝)]);
pop_thm()
));
=TEX
=SML
val ⦏z_subtract_minus_conv⦎ : CONV = (fn tm =>
	(simple_eq_match_conv z_subtract_minus_conv_thm tm)
	handle Fail _ => term_fail "z_subtract_minus_conv" 86302 [tm, z_subtract_eg]
);
=TEX
The order of the conjuncts in the following is crucial to the somewhat
contrived coding of $z\_add\_conv$, hence the two dummy entries.
=SML
val z_plus_conv_thm = ((
push_goal([], ⌜∀ k m n⦁
	(m + n = k ⇒ ⓩ⌜Z'Int m⌝ + ⌜Z'Int n⌝ = ⌜Z'Int k⌝⌝)
∧	T
∧	(n + k = m ⇒ ⓩ⌜Z'Int m⌝ + ~⌜Z'Int n⌝ = ⌜Z'Int k⌝⌝)
∧	(m + k = n ⇒ ⓩ⌜Z'Int m⌝ + ~⌜Z'Int n⌝ = ~⌜Z'Int k⌝⌝)
∧	(m + k = n ⇒ ⓩ~⌜Z'Int m⌝ + ⌜Z'Int n⌝ = ⌜Z'Int k⌝⌝)
∧	(n + k = m ⇒ ⓩ~⌜Z'Int m⌝ + ⌜Z'Int n⌝ = ~⌜Z'Int k⌝⌝)
∧	T
∧	(m + n = k ⇒ ⓩ~⌜Z'Int m⌝ + ~⌜Z'Int n⌝ = ~⌜Z'Int k⌝⌝)
⌝);
a(rewrite_tac[z_ℕ_plus_conv_thm]);
a(conv_tac (ONCE_MAP_C (LEFT_C eq_sym_conv)));
a(REPEAT strip_tac THEN POP_ASM_T rewrite_thm_tac THEN
	rewrite_tac[z_int_homomorphism_thm, z_minus_thm]
	THEN once_rewrite_tac[z_ℤ_eq_thm]
	THEN rewrite_tac[z_plus_assoc_thm, z_minus_thm, z_plus0_thm]);
(* *** Goal "1" *** *)
a(rewrite_tac[z_∀_elimⓩ~⌜Z'Int n⌝⌝ z_plus_order_thm] THEN
	rewrite_tac[z_plus_assoc_thm, z_minus_thm, z_plus0_thm]);
(* *** Goal "2" *** *)
a(rewrite_tac[z_∀_elim⌜Z'Int n⌝ z_plus_order_thm] THEN
	rewrite_tac[z_plus_assoc_thm, z_minus_thm, z_plus0_thm]);
pop_thm()
));
=TEX
=SML
local
open PPVector;
val ⦏plus_conv_thms_forms⦎ : (THM * (INTEGER*INTEGER->INTEGER)) vector = vector(combine
	(map (list_∀_intro [⌜m : ℕ⌝, ⌜n : ℕ⌝, ⌜k : ℕ⌝])
		(strip_∧_rule (all_∀_elim z_plus_conv_thm)))
	([op @+, op @+, op @-, op @- o swap, op @- o swap, op @-, op @+, op @+]
			: (INTEGER*INTEGER->INTEGER)list)
);
val plus_minus0_thm = prove_rule[z_plus0_thm, z_minus_thm]⌜∀i⦁ⓩi + ~0 = i⌝⌝;
val minus0_plus_thm = prove_rule[z_plus0_thm, z_minus_thm]⌜∀j⦁ⓩ~0 + j = j⌝⌝;
fun ⦏make_plus_conv_thm⦎ (i : INTEGER)  (j : INTEGER) : THM = (
	let	val m = iabs i;
		val n = iabs j;
		val ix =	(if i @< zero then 4 else 0) +
				(if j @< zero then 2 else 0) +
				(if i @+ j @< zero then 1 else 0);
		val (thm1, f) = sub(plus_conv_thms_forms, ix);
		val mt = mk_ℕ m;
		val nt = mk_ℕ n;
		val kt = mk_ℕ (f(m,n));
		val thm2 = list_simple_∀_elim[mt, nt, kt] thm1;
		val tm = (fst o dest_eq o fst o dest_⇒ o concl) thm2;
	in	⇒_mp_rule thm2 (plus_conv tm)
	end
);
in
val ⦏z_plus_conv⦎ : CONV = (fn tm =>
	let	val (itm, jtm) = (dest_z_plus tm);
		val i = dest_z_signed_int itm;
		val j = dest_z_signed_int jtm;
	in	(accept_conv (make_plus_conv_thm i j)
		ORELSE_C
		(fn t =>
		(if	j = zero
		then	accept_conv (simple_∀_elim itm plus_minus0_thm)
		else	fail_conv) t)
		ORELSE_C
		(fn t =>
		(if	i = zero
		then	accept_conv (simple_∀_elim jtm minus0_plus_thm)
		else	fail_conv) t)) tm
	end	handle Fail _ => term_fail "z_plus_conv" 86303 [tm, z_plus_eg]
);
end;
=TEX
=SML
val ⦏z_int_times_homomorphism_thm⦎ = ((
push_goal([], ⌜∀ m n⦁
	ⓩ⌜Z'Int (m * n)⌝ = ⌜Z'Int m⌝ * ⌜Z'Int n⌝⌝
⌝);
a(strip_tac THEN induction_tac⌜m:ℕ⌝ THEN REPEAT strip_tac
	THEN asm_rewrite_tac[plus_clauses, z_times0_thm, times_clauses,
		times_plus_distrib_thm, z_times_plus_distrib_thm,
		z_int_homomorphism_thm, z_times1_thm]);
pop_thm()
));
=TEX
=SML
val ⦏z_ℕ_times_conv_thm⦎ = ((
push_goal([], ⌜∀ m n⦁
	m * n = k ⇒ ⓩ⌜Z'Int m⌝ * ⌜Z'Int n⌝ = ⌜Z'Int k⌝⌝
⌝);
a(REPEAT strip_tac);
a(LEMMA_T ⓩ⌜Z'Int m⌝ * ⌜Z'Int n⌝ = ⌜Z'Int(m*n)⌝⌝ ante_tac THEN_LIST
	[rewrite_tac[z_int_times_homomorphism_thm], asm_rewrite_tac[]]);
pop_thm()
));
=TEX
=SML
val ⦏z_ℕ_times_conv⦎ : CONV = (fn tm =>
	let	val ((_, hol_op1), (_, hol_op2)) =
			((dest_app ** dest_app)(dest_z_times tm))
			handle Fail _ => term_fail "z_ℕ_times_conv" 86301
				[tm, z_times_eg];
		val thm1 = (times_conv (mk_times (hol_op1, hol_op2)))
			handle Fail _ => term_fail "z_ℕ_times_conv" 86301
				[tm, z_times_eg];
		val thm2 = simple_⇒_match_mp_rule z_ℕ_times_conv_thm thm1
			handle ex => reraise ex "z_ℕ_times_conv";
	in	(accept_conv thm2 tm)
		handle Fail _ => term_fail "z_ℕ_times_conv" 86301
			[tm, z_times_eg]
	end
);
=TEX
=SML
local
open PPVector;
val ⦏times_convs⦎ : ((CONV -> CONV) * CONV) vector = vector(
	combine
	[Z_FUN_RAND_C, Z_FUN_RAND_C, Combinators.I]
	(map (simple_eq_match_conv o prove_rule[z_minus_times_thm])
		[⌜∀i j⦁ ⓩi * ~ j = ~ (i * j)⌝⌝,
		⌜∀i j⦁ ⓩ~i * j = ~ (i * j)⌝⌝,
		⌜∀i j⦁ ⓩ~i * ~j = i * j⌝⌝]));
in
val ⦏z_times_conv⦎ : CONV = (fn tm =>
	let	val (itm, jtm) = (dest_z_times tm);
		val ix = (if is_z_minus itm then 2 else 0) +
			(if is_z_minus jtm then 1 else 0);
	in	(if ix = 0
		then z_ℕ_times_conv
		else	let val (f, c) = sub(times_convs, ix - 1)
			in	c THEN_C f z_ℕ_times_conv
			end) tm
	end	handle Fail _ => term_fail "z_times_conv" 86303 [tm, z_times_eg]
);
end;
=TEX
=SML
val ⦏z_int_ℕ_thm⦎ = ((
push_goal([], ⌜∀ m⦁ ⓩ⌜Z'Int m⌝ ∈ ℕ⌝⌝);
a(REPEAT strip_tac);
a(induction_tacⓩm⌝);
(* *** Goal "1" *** *)
a(rewrite_tac[z_0_ℕ_thm]);
(* *** Goal "2" *** *)
a(all_fc_tac [z_ℕ_plus1_thm]);
a(asm_rewrite_tac[z_int_homomorphism_thm]);
pop_thm()
));
=TEX
=SML
local
val ⦏z_abs_conv_lemma⦎ = prove_rule [z_int_ℕ_thm] ⌜∀ m⦁ ⓩ⌜Z'Int m⌝ ∈ ℕ ∧ true⌝⌝;
in
val ⦏z_abs_conv⦎ : CONV = (fn tm =>
	let	val arg_tm = hd(tl(snd(strip_app tm)));
		val (itm, is_neg) = (dest_z_minus arg_tm, true)
				handle Fail _ => (arg_tm, false);
		val i = snd(dest_app itm);
		val chk = dest_ℕ i;
		val thm1 = z_∀_elim itm z_abs_thm;
		val thm2 = simple_∀_elim i z_abs_conv_lemma;
		val thm3 = ⇒_mp_rule thm1 thm2;
	in	accept_conv
		(if is_neg
		then ∧_right_elim thm3
		else ∧_left_elim thm3)
		tm
	end	handle Fail _ => term_fail "z_abs_conv" 86303 [tm, z_abs_eg]
);
end;
=TEX
=SML
val ⦏z_int_onto_ℕ_thm⦎ = ((
push_goal([], ⓩ∀ i : ℕ ⦁ ⌜∃m⦁ Z'Int m = i⌝⌝);
a(z_∀_tac THEN rewrite_tac[] THEN z_ℕ_induction_tac);
(* *** Goal "1" *** *)
a(∃_tac⌜0⌝ THEN strip_tac);
(* *** Goal "2" *** *)
a(∃_tac⌜i'+1⌝ THEN asm_rewrite_tac[z_int_homomorphism_thm]);
pop_thm()
));
=TEX
=SML
val ⦏z_int_one_one_thm⦎ = ((
push_goal([], ⌜∀ m n ⦁ m = n ⇔ Z'Int m = Z'Int n⌝);
a(REPEAT strip_tac THEN_TRY asm_rewrite_tac[]);
a(strip_asm_tac(list_∀_elim[⌜m⌝, ⌜n⌝] less_cases_thm));
(* *** Goal "1" *** *)
a(POP_ASM_T (strip_asm_tac o rewrite_rule[less_def, ≤_def]));
a(i_contr_tac THEN swap_nth_asm_concl_tac 2);
a(POP_ASM_T (rewrite_thm_tac o eq_sym_rule));
a(rewrite_tac[z_int_homomorphism_thm]);
a(conv_tac (RAND_C eq_sym_conv));
a(once_rewrite_tac[z_ℤ_eq_thm]);
a(once_rewrite_tac[z_plus_comm_thm]);
a(rewrite_tac[z_plus_assoc_thm1, z_minus_thm, z_plus0_thm]);
a(once_rewrite_tac[z_plus_comm_thm]);
a(asm_tac (∀_elim⌜i:ℕ⌝ z_int_ℕ_thm));
a(all_fc_tac[z_ℕ_¬_plus1_thm]);
(* *** Goal "2" *** *)
a(POP_ASM_T (strip_asm_tac o rewrite_rule[less_def, ≤_def]));
a(i_contr_tac THEN swap_nth_asm_concl_tac 2);
a(POP_ASM_T (rewrite_thm_tac o eq_sym_rule));
a(rewrite_tac[z_int_homomorphism_thm]);
a(once_rewrite_tac[z_ℤ_eq_thm]);
a(once_rewrite_tac[z_plus_comm_thm]);
a(rewrite_tac[z_plus_assoc_thm1, z_minus_thm, z_plus0_thm]);
a(once_rewrite_tac[z_plus_comm_thm]);
a(asm_tac (∀_elim⌜i:ℕ⌝ z_int_ℕ_thm));
a(all_fc_tac[z_ℕ_¬_plus1_thm]);
pop_thm()
));
=TEX
=SML
val ⦏z_≤_conv_thm1⦎ = ((
push_goal([], ⌜∀ m n⦁
	ⓩ⌜Z'Int m⌝ ≤ ⌜Z'Int n⌝⌝ ⇔  m ≤ n
⌝);
a(rewrite_tac[get_spec⌜$≤:ℕ→ℕ→BOOL⌝] THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(all_asm_ante_tac THEN rewrite_tac[
	rewrite_rule[z_get_specⓩℤ⌝](z_get_specⓩ(_ ≤ _)⌝),
	rewrite_rule[z_get_specⓩℤ⌝](z_get_specⓩ(_ - _)⌝)]);
a(strip_tac THEN all_fc_tac [z_int_onto_ℕ_thm]);
a(rewrite_tac[z_int_one_one_thm, z_int_homomorphism_thm]);
a(∃_tacⓩm'⌝ THEN asm_rewrite_tac[]);
a(rewrite_tac[z_∀_elimⓩ⌜Z'Int n⌝⌝ z_plus_order_thm, z_minus_thm, z_plus0_thm]);
(* *** Goal "2" *** *)
a(POP_ASM_T (rewrite_thm_tac o eq_sym_rule)
	THEN rewrite_tac[z_int_homomorphism_thm]);
a(strip_asm_tac(∀_elimⓩi⌝ z_int_ℕ_thm));
a(strip_asm_tac(z_∀_elimⓩ(i≜⌜Z'Int m⌝, j≜⌜Z'Int i⌝)⌝ z_≤_plus_ℕ_thm));
pop_thm()
));
=TEX
N.b. in the following it is important that we don't try to be
clever with the case
when both operands are non-negative, since the uses of $z\_plus\_conv$
then handle operands of the form
=INLINEFT
~ 0
=TEX
.
=SML
val ⦏z_≤_conv_thm2⦎ = ((
push_goal([], ⌜∀ i j k⦁ⓩi ≤ j ⇔ i + k ≤ j + k⌝⌝);
a(REPEAT ∀_tac);
a(rewrite_tac[conv_rule (ONCE_MAP_C eq_sym_conv)
		(z_∀_elimⓩ(i≜i,j≜j,k≜k)⌝z_≤_plus_thm)]);
pop_thm()
));
=TEX
=SML
val ⦏z_≤_conv⦎ : CONV = (fn tm =>
	let	val (itm, jtm) = dest_z_≤ tm;
		val i = dest_z_signed_int itm;
		val j = dest_z_signed_int jtm;
		val min = if i @< j then i else j;
		val k = if min @< zero then iabs min else zero;
		val ktm = mk_z_signed_int k;
	in	(accept_conv(list_simple_∀_elim[itm, jtm, ktm] z_≤_conv_thm2)
		THEN_C	Z_REL_RANDS_C z_plus_conv
		THEN_C	simple_eq_match_conv z_≤_conv_thm1
		THEN_C	≤_conv) tm
	end	handle Fail _ => term_fail "z_≤_conv" 86303 [tm, z_≤_eg]
);
=TEX
=SML
val ⦏z_less_conv_thm⦎ = ((
push_goal([], ⌜∀ i j⦁ⓩi < j ⇔ i + 1 ≤ j⌝⌝);
a(REPEAT ∀_tac);
a(conv_tac(LEFT_C(once_rewrite_conv[
	rewrite_rule[z_get_specⓩℤ⌝](z_get_specⓩ(_ ≤ _)⌝)])));
a(REPEAT strip_tac);
pop_thm()
));
=TEX
=SML
val ⦏z_less_conv⦎ : CONV = (fn tm =>
	((simple_eq_match_conv z_less_conv_thm
	THEN_C Z_REL_LEFT_C z_plus_conv
	THEN_C z_≤_conv) tm)
	handle Fail _ => term_fail "z_less_conv" 86303 [tm, z_less_eg]
);
=TEX
=SML
val ⦏z_greater_less_conv_thm⦎ = ((
push_goal([], ⌜∀ i j⦁ⓩi > j ⇔ j < i⌝⌝);
a(REPEAT ∀_tac);
a(conv_tac(LEFT_C(once_rewrite_conv[
	rewrite_rule[z_get_specⓩℤ⌝](z_get_specⓩ(_ ≤ _)⌝)])));
a(REPEAT strip_tac);
pop_thm()
));
=TEX
=SML
val ⦏z_greater_less_conv⦎ : CONV = (fn tm =>
	((simple_eq_match_conv z_greater_less_conv_thm) tm)
	handle Fail _ => term_fail "z_greater_less_conv" 86302 [tm, z_greater_eg]
);
=TEX
=SML
val ⦏z_≥_≤_conv_thm⦎ = ((
push_goal([], ⌜∀ i j⦁ⓩi ≥ j ⇔ j ≤ i⌝⌝);
a(REPEAT ∀_tac);
a(conv_tac(LEFT_C(once_rewrite_conv[
	rewrite_rule[z_get_specⓩℤ⌝](z_get_specⓩ(_ ≤ _)⌝)])));
a(REPEAT strip_tac);
pop_thm()
));
=TEX
=SML
val ⦏z_≥_≤_conv⦎ : CONV = (fn tm =>
	((simple_eq_match_conv z_≥_≤_conv_thm) tm)
	handle Fail _ => term_fail "z_≥_≤_conv" 86302 [tm, z_≥_eg]
);
=TEX
=SML
val ⦏z_minus0_thm⦎ = ((
push_goal([], ⓩ~0 = 0⌝);
a(rewrite_tac[z_minus_thm]);
pop_thm()
));
=TEX
=SML
val ⦏z_ℤ_eq_conv_thm⦎ = ((
push_goal([], ⌜∀ i j⦁ⓩi < j ⇒ (i = j ⇔ false)⌝⌝);
a(REPEAT strip_tac);
a(asm_ante_tacⓩi < j⌝ THEN asm_rewrite_tac[z_less_clauses]);
pop_thm()
));
=TEX
=SML
val ⦏z_ℤ_eq_conv⦎ : CONV = (fn tm =>
	let	val (itm, jtm) = dest_eq tm;
		val i = dest_z_signed_int itm;
		val j = dest_z_signed_int jtm;
	in	(if	i @< j
		then	accept_conv(simple_⇒_match_mp_rule z_ℤ_eq_conv_thm
				(⇔_t_elim(z_less_conv(mk_z_less(itm, jtm)))))
		else if	i = j
		then		LEFT_C (simple_eq_match_conv z_minus0_thm)
			AND_OR_C RIGHT_C (simple_eq_match_conv z_minus0_thm)
			AND_OR_C accept_conv (⇔_t_intro(refl_conv (mk_z_signed_int i)))
		else	(* i > j *)
				eq_sym_conv
			THEN_C	accept_conv(simple_⇒_match_mp_rule z_ℤ_eq_conv_thm
				(⇔_t_elim(z_less_conv(mk_z_less(jtm, itm))))))
		tm
	end
);
=TEX
=SML
val ⦏z_div_mod_conv_thm⦎ = ((
push_goal([], ⌜∀ i j d r ⦁ ⓩ
		d * j + r = i  ∧ 0 ≤ r ∧ r < abs j
	⇒	i div j = d ∧ i mod j = r
⌝⌝);
a(conv_tac (ONCE_MAP_C eq_sym_conv) THEN REPEAT_UNTIL is_∧ strip_tac);
a(lemma_tac ⓩ¬j = 0⌝);
(* *** Goal "1" *** *)
a(swap_asm_concl_tac ⓩr < abs j⌝ THEN asm_rewrite_tac[]);
a(conv_tac (MAP_C z_abs_conv));
a(asm_rewrite_tac[z_¬_less_thm]);
(* *** Goal "2" *** *)
a(ALL_FC_T rewrite_tac [z_div_mod_unique_thm]);
pop_thm()
));
=TEX
=SML
local
val ⦏mk_ℤ0⦎ = ⓩ0⌝;
infix 7 zdiv zmod;
fun (i : INTEGER) ⦏zmod⦎ (j : INTEGER) : INTEGER = (
	let	val mlm = i imod j;
	in	if mlm @>= zero

		then mlm
		else mlm @- j
	end
);
fun (i : INTEGER) ⦏zdiv⦎ (j : INTEGER) : INTEGER = (
	let	val zm = i zmod j;
	in	(i @- zm) idiv j
	end
);
fun ⦏z_div_mod_conv⦎ (is_div : bool): TERM * TERM -> THM = (fn (itm, jtm) =>
	let	val i = dest_z_signed_int itm;
		val j = dest_z_signed_int jtm;
		val dtm = mk_z_signed_int (i zdiv j);
		val rtm = mk_z_signed_int (i zmod j);
		val thm1 = (Z_FUN_LEFT_C z_times_conv THEN_C z_plus_conv)
			(mk_z_plus(mk_z_times (dtm, jtm), rtm));
		val thm2 = ⇔_t_elim
			(z_≤_conv(mk_z_≤(mk_ℤ0
, rtm)));
		val thm3 = ⇔_t_elim
			((Z_REL_RIGHT_C z_abs_conv THEN_C z_less_conv)
			(mk_z_less(rtm, mk_z_abs jtm)));
		val thm4 = ⇒_mp_rule
			(list_simple_∀_elim[itm, jtm, dtm, rtm]z_div_mod_conv_thm)
			(list_∧_intro [thm1, thm2, thm3]);
	in	(if is_div
		then ∧_left_elim
		else ∧_right_elim) thm4
	end
);
in
val ⦏z_div_conv⦎ : CONV = (fn tm =>
	let	val (itm, jtm) = dest_z_div tm;
	in	if jtm =$ mk_ℤ0

		then	term_fail "z_div_conv" 86303 [tm, z_div_eg]
		else	(accept_conv (z_div_mod_conv true (dest_z_div tm)) tm)
			handle Fail _ => term_fail "z_div_conv" 57003 [tm]
	end
);
val ⦏z_mod_conv⦎ : CONV = (fn tm =>
	let	val (itm, jtm) = dest_z_mod tm;
	in	if jtm =$ mk_ℤ0

		then	term_fail "z_mod_conv" 86303 [tm, z_mod_eg]
		else	(accept_conv (z_div_mod_conv false (dest_z_mod tm)) tm)
			handle Fail _ => term_fail "z_mod_conv" 57007 [tm]
	end
);
end;
=TEX
=SML
val ⦏z_∈_ℕ_conv_thm⦎ = conv_rule z_∀_elim_conv1 z_∈_ℕ_thm;
=TEX
=SML
val ⦏z_∈_ℕ_conv⦎ : CONV = (fn tm =>
	(simple_eq_match_conv z_∈_ℕ_conv_thm tm)
	handle Fail _ => term_fail "z_∈_ℕ_conv" 86302 [tm, z_∈_ℕ_eg]
);
=TEX
=SML
val ⦏z_≤_less_eq_thm⦎ : THM = save_thm("z_≤_less_eq_thm",(
push_pc "z_sets_ext";
set_goal([],ⓩ∀ x, y : 𝕌 ⦁ x ≤ y ⇔ (x < y ∨ x = y)⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(swap_nth_asm_concl_tac 1);
a(rewrite_tac[eq_sym_rule(rewrite_rule[](z_∀_elim ⓩ(i ≜ y, j ≜ x)⌝ z_¬_≤_thm))]);
a(contr_tac THEN asm_fc_tac [z_≤_antisym_thm]);
(* *** Goal "2" *** *)
a(rewrite_tac[eq_sym_rule(rewrite_rule[](z_∀_elim ⓩ(i ≜ y, j ≜ x)⌝ z_¬_less_thm))]);
a(contr_tac THEN asm_fc_tac [z_less_irrefl_thm]);
(* *** Goal "3" *** *)
a(asm_rewrite_tac[z_≤_refl_thm]);
pop_pc();
pop_thm()
));
=TEX
=SML
val ⦏z_∈_ℕ⋎1_thm⦎ : THM = save_thm("z_∈_ℕ⋎1_thm", (
push_pc "z_sets_ext";
set_goal([],ⓩ∀ x:𝕌 ⦁ x ∈ ℕ⋎1 ⇔ 0 < x⌝);
a(z_∀_tac THEN strip_tac THEN rewrite_tac[z_ℕ⋎1_def, z_∈_ℕ_thm]);
a(rewrite_tac[z_≤_less_eq_thm]);
a(prove_tac[]);
(* *** Goal "1" *** *)
a(all_var_elim_asm_tac1);
(* *** Goal "2" *** *)
a(contr_tac);
a(all_var_elim_asm_tac1);
a(POP_ASM_T ante_tac THEN rewrite_tac[z_less_clauses]);
pop_pc();
pop_thm()
));
=TEX
\subsection{Concerning ..}
=SML
val ⦏z_high_dot_dot_low_thm⦎ = (
set_goal([],⌜∀ low high ⦁ ⓩlow < high ⇒ high .. low = {}⌝⌝);
push_merge_pcs ["z_sets_ext","'z_∈_rel"];
a(rewrite_tac[rewrite_rule[z_ℤ_def]z_dot_dot_def, z_≤_less_eq_thm]);
a(prove_tac[]);
(* *** Goal "1" *** *)
a(all_asm_fc_tac[z_less_trans_thm]);
a(contr_tac THEN all_asm_fc_tac [z_less_irrefl_thm]);
(* *** Goal "2" *** *)
a(contr_tac THEN all_var_elim_asm_tac);
a( all_asm_fc_tac [z_less_irrefl_thm]);
(* *** Goal "3" *** *)
a(contr_tac THEN all_asm_fc_tac [z_less_irrefl_thm]);
(* *** Goal "4" *** *)
a(contr_tac THEN all_var_elim_asm_tac);
a(contr_tac THEN all_asm_fc_tac [z_less_irrefl_thm]);
pop_thm());
=TEX
=SML
val ⦏z_x_dot_dot_x_thm⦎ = (
set_goal([],⌜∀ x ⦁ ⓩx .. x = {x}⌝⌝);
a(rewrite_tac[rewrite_rule[z_ℤ_def]z_dot_dot_def]);
a(prove_tac[]);
(* *** Goal "1" *** *)
a(all_asm_fc_tac [z_≤_antisym_thm]);
(* *** Goal "2" *** *)
a(rewrite_tac[z_≤_refl_thm]);
pop_pc();
pop_thm());
=TEX
=SML
local
	val cnv1 = simple_eq_match_conv1 z_x_dot_dot_x_thm;
in
val ⦏z_simple_dot_dot_conv⦎ : CONV = (fn tm =>
let	val (low,high) = dest_z_bin_op "z_simple_dot_dot_conv" 86001 (fst(dest_constⓩ(_.._)⌝)) tm;
	val res = (
	if low =$ high
	then cnv1 tm
	else (if is_z_signed_int low andalso is_z_signed_int high
	then ((let val s1 = ⇔_t_elim(z_less_conv (mk_z_less(high,low)));
	in
		⇒_elim (list_simple_∀_elim[high,low]z_high_dot_dot_low_thm) s1
	end)
	handle (Fail _) =>
	term_fail "z_simple_dot_dot_conv" 86001 [tm])
	else term_fail "z_simple_dot_dot_conv" 86001 [tm]));
in
	check_is_z_conv_result "z_simple_dot_dot_conv" res
end);
end;
=IGN
z_simple_dot_dot_conv ⓩ5 .. 5⌝;
z_simple_dot_dot_conv ⓩ7 .. 5⌝;
z_simple_dot_dot_conv ⓩtrue⌝; (* fail *)
=TEX
=SML
local
	val cnv1 = simple_eq_match_conv1 z_x_dot_dot_x_thm;
	val thm1 = all_∀_intro(PC_C1 "z_sets_ext"
		rewrite_conv[rewrite_rule[z_ℤ_def]z_dot_dot_def] ⓩx ∈ y .. z⌝);
	val cnv2 = simple_eq_match_conv1 thm1;
in
val ⦏z_∈_dot_dot_conv⦎ : CONV = (fn tm =>
let	val (x,dots) = dest_z_∈ tm
		handle (Fail _) =>
		term_fail "z_∈_dot_dot_conv" 86002 [tm];
	val (low,high) = dest_z_bin_op "z_∈_dot_dot_conv" 86002 (fst(dest_constⓩ(_.._)⌝)) dots;
	val res = (
	if low =$ high
	then ((RIGHT_C cnv1) THEN_C z_∈_setd_conv) tm
	else (if is_z_signed_int low andalso is_z_signed_int high
	then ((let val s1 = ⇔_t_elim(z_less_conv (mk_z_less(high,low)));
		val s2 = ⇒_elim (list_simple_∀_elim[high,low]z_high_dot_dot_low_thm) s1;
	in
		(RIGHT_C (fn _ => s2)  THEN_C z_∈_setd_conv) tm
	end)
	handle (Fail _) =>
	cnv2 tm)
	else cnv2 tm));
in
	check_is_z_conv_result "z_∈_dot_dot_conv" res
end);
end;
=IGN
z_∈_dot_dot_conv ⓩp ∈ 1 .. 0⌝;
z_∈_dot_dot_conv ⓩp ∈ f z .. f z⌝;
z_∈_dot_dot_conv ⓩp ∈ f z .. g z⌝;
=TEX
\section{PROOF CONTEXTS}
=SML
fun ⦏thms_to_eqn_cxt⦎ (thms:THM list) : EQN_CXT = (
	flat(map (cthm_eqn_cxt(current_ad_rw_canon())) thms)
);
=TEX	
=SML
val _ = delete_pc "'z_numbers" handle Fail _ => ();
val _ = new_pc "'z_numbers";
val _ = set_rw_eqn_cxt	
		[	(ⓩi + j⌝, z_plus_conv),
			(ⓩi * j⌝, z_times_conv),
			(ⓩi - j⌝, z_subtract_minus_conv),
			(ⓩabs i⌝, z_abs_conv),
			(ⓩi div j⌝, z_div_conv),
			(ⓩi mod j⌝, z_mod_conv),
			(ⓩi = j⌝, z_ℤ_eq_conv),
			(ⓩi ≤ j⌝, z_≤_conv),
			(ⓩi < j⌝, z_less_conv),
			(ⓩi ≥ j⌝, z_≥_≤_conv),
			(ⓩi > j⌝, z_greater_less_conv),
			(ⓩi ∈ ℕ⌝, z_∈_ℕ_conv),
			(ⓩx .. y⌝, z_simple_dot_dot_conv),
			(ⓩp ∈ x .. y⌝, z_∈_dot_dot_conv)
		] "'z_numbers";
val _ = add_rw_thms [z_plus_clauses, z_minus_clauses, z_≤_clauses,
	 z_less_clauses, z_times_clauses, z_¬_≤_thm,
	 z_∈_ℕ⋎1_thm, z_¬_less_thm, z_﹣_minus_thm]
	"'z_numbers";
val pos = (thms_to_eqn_cxt[z_∈_ℕ⋎1_thm,
		z_minus_clauses,
		z_≤_clauses,
		z_less_clauses]) @
	[(ⓩi = j⌝, z_ℤ_eq_conv),
	(ⓩi ∈ ℕ⌝, z_∈_ℕ_conv),
	(ⓩi ≥ j⌝, z_≥_≤_conv),
	(ⓩi > j⌝, z_greater_less_conv),
	(ⓩx ∈ y .. z⌝, z_∈_dot_dot_conv)];
val neg = mapfilter (mk_¬ ** RAND_C) pos;
val neutral = thms_to_eqn_cxt[z_¬_≤_thm, z_¬_less_thm] @
	[(ⓩi ≤ j⌝, z_≤_conv),
	(ⓩi < j⌝, z_less_conv)];

val ⦏strip_eqn_cxt⦎ = neutral @ pos @ neg;

val _ = set_st_eqn_cxt strip_eqn_cxt "'z_numbers";
val _ = set_sc_eqn_cxt strip_eqn_cxt "'z_numbers";
val _ = set_u_simp_eqn_cxt (theory_u_simp_eqn_cxt"z_numbers") "'z_numbers";
val _ = set_pr_tac z_basic_prove_tac "'z_numbers";
val _ = set_pr_conv z_basic_prove_conv "'z_numbers";
val _ = commit_pc "'z_numbers";
=TEX
=SML
val ⦏z_elim_less_thm⦎ = conv_rule (ONCE_MAP_C eq_sym_conv) z_¬_≤_thm;

val _ = delete_pc "'z_numbers1" handle Fail _ => ();
val _ = new_pc "'z_numbers1";
val _ = set_rw_eqn_cxt	
		[	(ⓩi + j⌝, z_plus_conv),
			(ⓩi * j⌝, z_times_conv),
			(ⓩi - j⌝, z_subtract_minus_conv),
			(ⓩabs i⌝, z_abs_conv),
			(ⓩi div j⌝, z_div_conv),
			(ⓩi mod j⌝, z_mod_conv),
			(ⓩi = j⌝, z_ℤ_eq_conv),
			(ⓩi ≤ j⌝, z_≤_conv),
			(ⓩi < j⌝, z_less_conv),
			(ⓩi ≥ j⌝, z_≥_≤_conv),
			(ⓩi > j⌝, z_greater_less_conv),
			(ⓩi ∈ ℕ⌝, z_∈_ℕ_conv),
			(ⓩx .. y⌝, z_simple_dot_dot_conv),
			(ⓩp ∈ x .. y⌝, z_∈_dot_dot_conv)
		] "'z_numbers1";
val _ = add_rw_thms [z_plus_clauses, z_minus_clauses, z_≤_clauses,
	 z_less_clauses, z_times_clauses,
	 z_∈_ℕ⋎1_thm, z_¬_less_thm, z_elim_less_thm,
	 z_﹣_minus_thm
	]
	"'z_numbers1";
val pos = (thms_to_eqn_cxt[z_∈_ℕ⋎1_thm,
		z_minus_clauses,
		z_≤_clauses,
		z_less_clauses]) @
	[(ⓩi = j⌝, z_ℤ_eq_conv),
	(ⓩi ∈ ℕ⌝, z_∈_ℕ_conv),
	(ⓩi ≥ j⌝, z_≥_≤_conv),
	(ⓩi > j⌝, z_greater_less_conv),
	(ⓩx ∈ y .. z⌝, z_∈_dot_dot_conv),
	(ⓩi ≤ j⌝, z_≤_conv),
	(ⓩi < j⌝, z_less_conv)
];
val neg = mapfilter (mk_¬ ** RAND_C) pos;
val neutral = thms_to_eqn_cxt[z_elim_less_thm, z_¬_less_thm];

val ⦏strip_eqn_cxt⦎ = pos @ neg @ neutral;

val _ = set_st_eqn_cxt strip_eqn_cxt "'z_numbers1";
val _ = set_sc_eqn_cxt strip_eqn_cxt "'z_numbers1";
val _ = set_u_simp_eqn_cxt (theory_u_simp_eqn_cxt"z_numbers") "'z_numbers1";
val _ = set_pr_tac z_basic_prove_tac "'z_numbers1";
val _ = set_pr_conv z_basic_prove_conv "'z_numbers1";
val _ = commit_pc "'z_numbers1";
=TEX
\section{FINITENESS}
=SML
local
	val s1 = (pure_rewrite_conv [z_𝔽_def]) ⓩ𝔽 X⌝;
in
val ⦏z_𝔽_thm⦎ = save_thm("z_𝔽_thm",(all_z_∀_intro s1));
end;
=TEX
=SML
local
	val s1 = (pure_rewrite_conv [z_𝔽⋎1_def]) ⓩ𝔽⋎1 X⌝;
in
val ⦏z_𝔽⋎1_thm⦎ = save_thm("z_𝔽⋎1_thm",(all_z_∀_intro s1));
end;
=TEX
=SML
val ⦏z_𝔽_empty_thm⦎ = save_thm("z_𝔽_empty_thm",(
push_merge_pcs ["z_sets_ext","'z_∈_rel","'z_fun_alg","'z_numbers"];
set_goal([],ⓩ𝔽 {} = ℙ {}⌝);
a (prove_tac[z_𝔽_thm]);
a(asm_rewrite_tac[]);
a(z_∃_tac ⓩ0⌝ THEN rewrite_tac[]);
a(z_∃_tac ⓩ{}⌝ THEN rewrite_tac[]);
pop_pc();
pop_thm()
));
=TEX
=IGN
The following is not exposed or used, but is left "in case".
=IGN
val ⦏z_≤_plus_1_thm⦎ = (
push_merge_pcs ["z_sets_ext","'z_∈_rel","'z_numbers"];
set_goal([],ⓩ∀ x, n:𝕌⦁ x ≤ n + 1 ⇔ x ≤ n ∨ x = n+1⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(POP_ASM_T (asm_tac o once_rewrite_rule[z_get_spec ⓩ(_ < _)⌝]));
a(all_asm_fc_tac [z_≤_antisym_thm]);
(* *** Goal "2" *** *)
a(asm_tac (prove_rule []ⓩn ≤ n + 1⌝));
a(all_asm_fc_tac [z_≤_trans_thm]);
(* *** Goal "3" *** *)
a(asm_rewrite_tac[]);
pop_pc();
pop_thm()
);
=TEX
=IGN
push_merge_pcs ["z_rel_ext","'z_numbers"];
set_goal([],ⓩ∀ x : 𝕌⦁ 𝔽 ⌜Z'Setd x⌝ = ℙ ⌜Z'Setd x⌝⌝);
a(z_strip_tac THEN strip_tac);
a(rewrite_tac[z_𝔽_thm]);
a(rewrite_tac[taut_rule ⌜∀ x y ⦁ (x ∧ y ⇔ x) ⇔ (x ⇒ y)⌝]);
a(list_induction_tac ⌜x⌝);
(* *** Goal "1" *** *)
a(rewrite_tac[]);
a(REPEAT strip_tac);
a(asm_rewrite_tac[]);
a(z_∃_tac ⓩ0⌝ THEN rewrite_tac[]);
a(z_∃_tac ⓩ{}⌝ THEN rewrite_tac[]);
a(PC_T1 "z_fun_ext" rewrite_tac[]);
(* *** Goal "2" *** *)
a(REPEAT_N 3 z_strip_tac);
a(rewrite_tac[z'setd_def]);
a(PC_T1 "hol1" rewrite_tac[]);
a(strip_tac);
a(cases_tac ⓩx' ∈ ⌜Z'Setd x⌝⌝);
(* *** Goal "2.1" *** *)
a(lemma_tac ⓩ(∀ x2 : 𝕌 ⦁ x2 ∈ x1 ⇒ x2 ∈ ⌜Z'Setd x⌝)⌝);
(* *** Goal "2.1.1" *** *)
a(REPEAT strip_tac);
a(asm_fc_tac[]);
a(all_var_elim_asm_tac);
(* *** Goal "2.1.2" *** *)
a(ASM_FC_T (MAP_EVERY asm_tac) []);
a(POP_ASM_T (rewrite_thm_tac o rewrite_rule[] o conv_rule z_¬_∀_conv));
(* *** Goal "2.2" *** *)
a(cases_tac ⓩ¬ x' ∈ x1⌝);
(* *** Goal "2.2.1" *** *)
a(lemma_tac ⓩ∀ x2 : 𝕌 ⦁ x2 ∈ x1 ⇒ x2 ∈ ⌜Z'Setd x⌝⌝);
(* *** Goal "2.2.1.1" *** *)
a(REPEAT strip_tac);
a(asm_fc_tac[]);
a(all_var_elim_asm_tac);
(* *** Goal "2.2.1.2" *** *)
a(ASM_FC_T (MAP_EVERY asm_tac) []);
a(POP_ASM_T (rewrite_thm_tac o rewrite_rule[] o conv_rule z_¬_∀_conv));
(* *** Goal "2.2.2" *** *)
a(z_spec_nth_asm_tac 4 ⓩx1 \ {x'}⌝);
(* *** Goal "2.2.2.1" *** *)
a(DROP_NTH_ASM_T 7 (fn _ => id_tac));
a(all_asm_fc_tac[]);
(* *** Goal "2.2.2.2" *** *)
a(DROP_NTH_ASM_T 7 (fn _ => id_tac));
a(z_∃_tac ⓩn+1⌝);
a(rewrite_tac[]);
a(lemma_tac ⓩ0 ≤ n+1⌝);
(* *** Goal "2.2.2.2.1" *** *)
a(asm_tac (prove_rule [] ⓩn ≤ n+1⌝));
a(all_fc_tac[z_≤_trans_thm]);
(* *** Goal "2.2.2.2.2" *** *)
a(REPEAT strip_tac);
a(z_∃_tac ⓩf ∪ {(n+1,x')}⌝);
a(rewrite_tac[]);
a(strip_tac);
(* *** Goal "2.2.2.2.2.1" *** *)
a(DROP_NTH_ASM_T 3 ante_tac);
(* nasty *)
set_labelled_goal "2.2.2.2.2.2";
(* *** Goal "2.2.2.2.2.2" *** *)
a(REPEAT strip_tac THEN_TRY_T all_var_elim_asm_tac1);
a(z_spec_nth_asm_tac 3 ⓩx1'⌝);
(* *** Goal "2.2.2.2.2.2.1.1" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "2.2.2.2.2.2.1.2" *** *)
a(all_var_elim_asm_tac1);
(* *** Goal "2.2.2.2.2.2.1.3" *** *)
a(all_asm_fc_tac[]);
(* *** Goal "2.2.2.2.2.2.2" *** *)
a(z_spec_nth_asm_tac 3 ⓩx1'⌝);
(* *** Goal "2.2.2.2.2.2.2.1" *** *)
a(all_var_elim_asm_tac1);
a(z_∃_tacⓩn+1⌝ THEN rewrite_tac[]);
(* *** Goal "2.2.2.2.2.2.2.2" *** *)
a(z_∃_tacⓩx''⌝ THEN asm_rewrite_tac[]);
(* *** Goal "2.2.2.2.2.2.2.3" *** *)
a(z_∃_tacⓩx''⌝ THEN asm_rewrite_tac[]);
(* *** Goal "2.2.2.2.2.1" *** *)
(* back to nasty *)
WANT:
⊢ ∀ a, b, c:𝕌 ⦁ (a ∪ b) ⊆ c ⇔ (a ⊆ c) ∧ (b ⊆ c)
⊢ ∀ a, b:𝕌 ⦁ dom (a ∪ b) = dom a ∪ dom b
⊢ ∀ m n ⦁ m ≤ n + 1 ⇒ (m .. n+1) = (m .. n) ∪ {n+1}
and more work!
=TEX
\section{EPILOG}
=SML
end (* of structure ZNumbers *) ;
structure ⦏ZNumbers⦎ : ZNumbers = ZNumbers;
open ZNumbers;
=TEX
\twocolumn[\section{INDEX}]
\small
\printindex

\end{document}

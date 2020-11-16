=IGN
********************************************************************************
imp105.doc: this file is part of the PPHol system

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

\def\Title{Implementation of Arithmetic Proof Procedures for HOL Integers}

\def\AbstractText{This document contains the implementation of proof procedures the HOL integers. These include arithmetic normalisation and a linear arithmetic prover.}

\def\Reference{DS/FMU/IED/IMP105}

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
%% LaTeX2e port: \documentstyle[hol1,11pt,TQ]{article}
%% LaTeX2e port: \ftlinepenalty=9999
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{FST PROJECT}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \def\TPPheadtitle{Integer Arithmetic}
%% LaTeX2e port: \TPPtitle{Implementation of Arithmetic Proof Procedures for HOL Integers}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP105}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.11 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2005/04/24 16:01:30 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{R.D.~Arthan & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.B.~Jones & FMU Manager}
%% LaTeX2e port: \TPPabstract{This document contains the implementation of proof
%% LaTeX2e port: procedures the HOL integers.
%% LaTeX2e port: These include arithmetic normalisation and a linear arithmetic prover.}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	    Library
%% LaTeX2e port: }}
%% LaTeX2e port: \begin{document}
%% LaTeX2e port: \makeTPPfrontpage
%% LaTeX2e port: \vfill
%% LaTeX2e port: \begin{centering}
%% LaTeX2e port: \bf Copyright \copyright\ : Lemma 1 Ltd. \number\year
%% LaTeX2e port: \end{centering}

\begin{document}

\headsep=0mm
\FrontPage
\headsep=10mm

\setcounter{section}{-1}
\pagebreak
\section{Document control}
\subsection{Contents list}
\tableofcontents
\subsection{Document cross references}
\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes history}
\begin{description}
\item[1.1-1.3] First drafts.
\item[1.4] First product version.
\item[1.5] Update for new INTEGER type.
\item[1.6] Removed premature end of document.
\item[1.7] Fixed bug in {\it add\_simp\_conv}.
\item[1.8] Fixed {\LaTeX} errors.
\item[Issue 1.9 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.10 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.11 (2005/04/24)] Now uses {\tt app} rather than {\tt map} when appropriate.
\item[Issue 1.12 (2005/05/31)] Now allow for adding theorems into the theory ℤ here.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes forecast}
As determined by comment and review.
\section{GENERAL}
\subsection{Scope}
This document contains the implementation of part of the \ProductHOL\ system.
The document responds to \cite{DS/FMU/IED/DTD105}.
\subsection{Introduction}
\subsubsection{Purpose and Background}
\subsubsection{Dependencies}
This document depends on the theory $basic\_hol$ defined in
\cite{DS/FMU/IED/DTD045}, on the conversions in
\cite{DS/FMU/IED/DTD081}, and on the tactics and rules of
\cite{DS/FMU/IED/DTD027,DS/FMU/IED/DTD029}.
\subsubsection{Algorithms}
See the detailed design document \cite{DS/FMU/IED/DTD105} for
a general description of the algorithm and the remarks between code
fragments below for
more detailed discussion of implementation techniques, such as the
representation of the problems.

The arithmetic normaliser is similar to, but more complex  than, that in \cite{DS/FMU/IED/IMP082}.
The linear arithmetic prover is similar to, but simpler than, that in \cite{DS/FMU/IED/IMP082}.
In both cases, the difference in complexity is due to negation, which leads to more cases in normalisation, but a simpler normal form, and hence fewer cases, in the linear arithmetic prover.
\subsubsection{Known Deficiencies}
See \cite{DS/FMU/IED/DTD105}.
\subsubsection{Possible Enhancements}
See \cite{DS/FMU/IED/DTD105}.
\section{PREAMBLE}
=SML
structure ⦏ℤArithmeticTools⦎ : ℤArithmeticTools = struct
=TEX
\section{PREAMBLE}
=SML
open ℤ;
val ⦏old_theory⦎ = get_current_theory_name();
val _ = open_theory"ℤ";
val _ = push_merge_pcs ["'ℤ", "'ℕ", "predicates"];
=TEX
\section{TERM NORMALISATION}
The material in this section implements the treatment of polynomial
normalisation for the integers and is modelled quite closely on the
treatment for the natural numbers given in \cite{DS/FMU/IED/DTD081}.
\subsection{Discussion}
The normal form we use applies to the set of terms described informally
by the following (ambiguous) BNF grammar, in which, of course, all the operations are the
integer versions:
=GFT
	IntTerm		= IntTerm, "*", IntTerm
			| IntTerm, "-", IntTerm
			| IntTerm, "+", IntTerm
			| "~", IntTerm
			| IntAtom;
	IntAtom		= ? Anything not of the form IntTerm ?;
=TEX
Such a term is normalised by ``multiplying out and collecting like terms'' to
give a normal form described by the following grammar:
=GFT
	NormIntTerm	= Monomial, {"+", Monomial};
	Monomial	= HeadFactor, {"*", TailFactor};
	HeadFactor	= ["~"], (IntLit | TailFactor);
	TailFactor	= IntAtom - IntLit;
=TEX
The above grammar is intended to be interpreted with the usual HOL rules
for precedence and assocation. Thus, the monadic minus in a head factor
has as its argument the rest of the head factor (not including the product of
the tail factors).

All the tail factors in a normalised monomial are ordered with respect to a fixed total ordering of HOL terms as are the monomials within a $NormIntTerm$.
This ordering is defined in the next section.
An $IntLit$ as the head factor of a normalised monomial is never $0$, $1$ or
=INLINEFT
~1
=TEX
\ unless the monomial contains no tail factors.

Like monomials are ``collected'' in the sense that there are no repetitions
amongst the monomials obtainable from a $NormIntTerm$ by deleting any
monadic minuses and $IntLit$s which appear in it.
(I.e. terms like
=INLINEFT
~x + x
=TEX
\ or
=INLINEFT
~x + y + ~2*x
=TEX
\ do not arise).
A $NormIntTerm$ will contain at most one monomial comprising of a single
signed literal. The $IntLit$s in a monomial are never zero unless the
whole $NormIntTerm$ consists of the single literal zero (i.e. ⌜ℕℤ\,0⌝).
\section{TERM ORDERING FOR ℤ}
The ordering must bring together signed literals and like monomials.
We arrange things so that a monomial with a sign comes immediately after the monomial, and with a literal multiplier immediately after that, e.g.:

=GFT
	a*b < ~a * b < 0 * a * b < ~1 * a * b < 1 * a * b < ....
=TEX
.
=SML
local
val ⦏bottom⦎ : TERM = mk_const("", mk_vartype "");
val ⦏mk_0⦎ = ⌜0⌝;
val two = @@"2";
fun int_to_nat (i : INTEGER) : INTEGER = (
	if i @>= zero
	then two@*i @+ two
	else (two @* @~i) @+ one
)
fun ⦏pervert⦎ (tm : TERM) : TERM * INTEGER = (
	let	val (a, b) = dest_ℤ_times tm
	in	(b, int_to_nat(dest_ℤ_signed_int a))
		handle Fail _ => (mk_ℤ_times(dest_ℤ_minus a, b), one)
		handle Fail _ => (tm, zero)
	end	handle Fail _ => (bottom, int_to_nat(dest_ℤ_signed_int tm))
		handle Fail _ => (dest_ℤ_minus tm, one)
		handle Fail _ => (tm, zero)
);
in
val ⦏ℤ_term_order⦎ : TERM -> TERM -> int = gen_term_order pervert;
end;

=TEX
\section{ANF FOR ℤ}
We need conversions and supporting theorems which do collection of
like terms.
First of all we need to provide conversions which, given a (sorted) sum,
=INLINEFT
m⋎1 + m⋎2
=TEX
\ of two normalised monomials will do all applicable simplifications which can reduce the sum to a single monomial.
We find the following cases, in which $c$d and $d$ denote literals, and where, on the right hand-side of the equations, literal arithmetic expressions are intended to have been evaluated:
=GFT
1.	c*m +d*m 	=	(c + d)*m
2.	m +d*m 		=	(1 + d)*m
3.	0 + m		=	m
4.	c + d		=	c + d
5.	m + m 		=	2*m
6.	m + ~m 		=	0
7.	m*n + ~m*n	=	0
8.	~m + d*m	=	(~1 + d)*m	
9.	~m*n + d*m*n	=	(~1 + d)*m*n
10.	m + 0		=	0
=TEX
Here case 4 is directly supported by $plus\_conv$ (note that the order
here is important since case 4 overlaps case 5).
Note that case 5 may introduce a monadic minus in the wrong place.
The others will not do this unless their input has the same flaw.
Note also that cases 1, 2, 8 and 9 may introduce multiplication
by $1$,
=INLINEFT
~1
=TEX
, or $0$ which must be simplified away.
Case 10 only arises when cancellation during in the polynomial normalisation has caused a sub-polynomial to become $0$.
=SML
val ⦏case1_thm⦎ = tac_proof(([], ⌜∀c d m:ℤ⦁c*m + d*m = (c + d)*m⌝),
	rewrite_tac[ℤ_times_plus_distrib_thm]);
val ⦏case2_thm⦎ = tac_proof(([], ⌜∀d m:ℤ⦁m + d*m = (ℕℤ 1 + d)*m⌝),
	rewrite_tac[ℤ_times_plus_distrib_thm, ℤ_plus_assoc_thm]);
val ⦏case3_thm⦎ = tac_proof(([], ⌜∀m⦁ℕℤ 0 + m = m⌝),
	rewrite_tac[]);
val ⦏case5_thm⦎ = tac_proof(([], ⌜∀m:ℤ⦁m + m = ℕℤ 2*m⌝),
	pure_rewrite_tac[prove_rule[]⌜ℕℤ 2 = ℕℤ 1 + ℕℤ 1⌝,
		 ℤ_times_plus_distrib_thm]
	THEN rewrite_tac[]);
val ⦏case5a_thm⦎ = tac_proof(([], ⌜∀m n:ℤ⦁m * ~ n= ~m * n⌝),
	rewrite_tac[ℤ_times_minus_thm]);
val ⦏case5b_thm⦎ = tac_proof(([], ⌜∀m n p:ℤ⦁m * ~ n * p = ~m * n *p⌝),
	rewrite_tac[ℤ_times_minus_thm]);
val ⦏case6_thm⦎ = tac_proof(([], ⌜∀m:ℤ⦁m + ~m = ℕℤ 0⌝),
	rewrite_tac[ℤ_minus_clauses]);
val ⦏case7_thm⦎ = tac_proof(([], ⌜∀m n:ℤ⦁m*n + ~m*n = ℕℤ 0⌝),
	rewrite_tac[ℤ_minus_clauses, ℤ_times_minus_thm]);
val ⦏case8_thm⦎ = tac_proof(([], ⌜∀m:ℤ⦁~m + d*m = (~(ℕℤ 1) + d)*m⌝),
	rewrite_tac[ℤ_times_minus_thm,
		ℤ_times1_thm, ℤ_times_plus_distrib_thm]);
val ⦏case9_thm⦎ = tac_proof(([], ⌜∀m n:ℤ⦁~m*n + d*m*n = (~(ℕℤ 1) + d)*m*n⌝),
	rewrite_tac[ℤ_times_minus_thm,
		ℤ_times1_thm, ℤ_times_plus_distrib_thm]);
val ⦏case10_thm⦎ = tac_proof(([], ⌜∀m:ℤ⦁m + ℕℤ 0 = m⌝),
	rewrite_tac[ℤ_plus0_thm]);
val ⦏case1289a_thm⦎ = tac_proof(([], ⌜∀m:ℤ⦁ℕℤ 1 *m = m⌝),
	rewrite_tac[ℤ_times1_thm]);
val ⦏case1289b_thm⦎ = tac_proof(([], ⌜∀m:ℤ⦁~(ℕℤ 1) * m = ~m⌝),
	rewrite_tac[ℤ_times1_thm, ℤ_times_minus_thm]);
val ⦏case1289c_thm⦎ = tac_proof(([], ⌜∀m:ℤ⦁(ℕℤ 0) * m = ℕℤ 0⌝),
	rewrite_tac[ℤ_times0_thm]);
=TEX
Now we provide the conversions to support the 8 cases:
=SML
val ⦏case1289_conv⦎ : CONV = (
	(simple_eq_match_conv case1289a_thm ORELSE_C
		simple_eq_match_conv case1289b_thm ORELSE_C
		simple_eq_match_conv case1289c_thm)
);
val ⦏case1_conv⦎ : CONV = (fn tm => (
	(((dest_ℤ_signed_int o fst o dest_ℤ_times) **
		(dest_ℤ_signed_int o fst o dest_ℤ_times))
		o dest_ℤ_plus) tm;
	(simple_eq_match_conv case1_thm THEN_C LEFT_C ℤ_plus_conv
		THEN_TRY_C case1289_conv) tm
));
val ⦏case2_conv⦎ : CONV = (fn tm => (
	(dest_ℤ_signed_int o fst o dest_ℤ_times o snd o dest_ℤ_plus) tm;
	(simple_eq_match_conv case2_thm THEN_C LEFT_C ℤ_plus_conv
		THEN_TRY_C case1289_conv) tm
));
val ⦏case3_conv⦎ : CONV = (fn tm =>
	if (dest_ℤ_signed_int o fst o dest_ℤ_plus) tm = zero
	then (simple_eq_match_conv case3_thm) tm
	else fail_conv tm
);
val ⦏case4_conv⦎ = ℤ_plus_conv;
val ⦏case5_conv⦎ = simple_eq_match_conv case5_thm
	THEN_TRY_C (simple_eq_match_conv case5a_thm ORELSE_C
			simple_eq_match_conv case5b_thm);
val ⦏case6_conv⦎ = simple_eq_match_conv case6_thm;
val ⦏case7_conv⦎ = simple_eq_match_conv case7_thm;
val ⦏case8_conv⦎ : CONV = (fn tm => (
	(dest_ℤ_signed_int o fst o dest_ℤ_times o snd o dest_ℤ_plus) tm;
	(simple_eq_match_conv case8_thm THEN_C LEFT_C ℤ_plus_conv
		THEN_TRY_C case1289_conv) tm
));
val ⦏case9_conv⦎ : CONV = (fn tm => (
	(dest_ℤ_signed_int o fst o dest_ℤ_times o snd o dest_ℤ_plus) tm;
	(simple_eq_match_conv case9_thm THEN_C LEFT_C ℤ_plus_conv
		THEN_TRY_C case1289_conv) tm
));
val ⦏case10_conv⦎ = simple_eq_match_conv case10_thm;
=TEX
=SML
=TEX
The following conversional converts a conversion acting on $x + y$, say,
to one which will also act on $x + y + z$ (by rewriting it as $(x + y) + z$
and then applying the conversion to the subterm $x + y$).
=SML
val ⦏ℤ_plus⦎ = ⌜$+⋎Z⌝;
fun ⦏A_C⦎ (c : CONV) : CONV = (fn tm =>
	let	val (ltm, rtm) = dest_ℤ_plus tm;
		exception BaseCase;
	in let	val (rtm1, rtm2) = dest_ℤ_plus rtm handle Fail _ => raise BaseCase;
		val thm = c (mk_ℤ_plus(ltm, rtm1));
	in	eq_trans_rule
		(list_∀_elim[ltm, rtm1, rtm2] ℤ_plus_assoc_thm1)
		(app_arg_rule rtm2 (app_fun_rule ℤ_plus thm))
	end 	handle BaseCase => c tm
	end
);
=TEX
We want to simplify multiplication according to the following scheme, where $x$ and $y$ denotes atoms (and other variables are as in the list of simplifications for addition):
=GFT
1.	c*d		= c*d
2.	0*x		= 0
3.	1*x		= x
4.	~1*~x		= x
5.	~1*x		= ~x
6.	~x*~y		= x*y
7.	x*~y		= ~x*y
=TEX
=SML
val ⦏times234567_thm⦎ = tac_proof(([],
	⌜∀x y:ℤ⦁ℕℤ
		0 * x = ℕℤ 0
	∧	ℕℤ 1 * x = x
	∧	~(ℕℤ 1) * ~x = x
	∧	~(ℕℤ 1) * x = ~x
	∧	~x * ~y = x*y
	∧	x * ~y = ~x*y ⌝),
		rewrite_tac[ℤ_times_clauses, ℤ_times_minus_thm]);
=TEX
=SML
val ⦏times1234567_conv⦎ : CONV =
	FIRST_C (ℤ_times_conv :: map simple_eq_match_conv (current_ad_rw_canon() times234567_thm));
=TEX
$M\_C$ is analogous to $A\_C$ but for multiplication rather than addition.
There are additional cases to worry about.
=SML
val ⦏times0_thm⦎ = tac_proof(([],
	⌜∀x:ℤ⦁ℕℤ 0 * x = ℕℤ 0⌝),
		rewrite_tac[ℤ_times_clauses]);

val ⦏ℤ_times⦎ = ⌜$*⋎Z⌝;
fun ⦏M_C1⦎ (c : CONV) : CONV = (fn tm =>
	let	val (ltm, rtm) = dest_ℤ_times tm;
		exception BaseCase;
	in let	val (rtm1, rtm2) = dest_ℤ_times rtm handle Fail _ => raise BaseCase;
		val thm = c (mk_ℤ_times(ltm, rtm1));
	in	eq_trans_rule
		(list_∀_elim[ltm, rtm1, rtm2] ℤ_times_assoc_thm1)
		(app_arg_rule rtm2 (app_fun_rule ℤ_times thm))
	end 	handle BaseCase => c tm
	end
);
fun ⦏M_C⦎ (c : CONV) : CONV =
	M_C1 c THEN_TRY_C
	FIRST_C (map simple_eq_match_conv [times0_thm, ℤ_times_assoc_thm]
);
=TEX
Pulling these bits together we get the following:.
=SML
val ⦏add_simp_conv⦎ =
	FIRST_C(map A_C[
		case1_conv, case2_conv, case3_conv, case4_conv,
		case5_conv, case6_conv, case7_conv, case8_conv,
		case9_conv, case10_conv]) THEN_C TRY_C case3_conv;
val ⦏times_simp_conv⦎ = M_C times1234567_conv;

=TEX
Unlike the natural number case, we have some  non-trivial work to
do trying to make non-atoms from what $poly\_conv$ will see as
atoms if we don't push monadic and dyadic minus around.
The transformation is done according to the following schema:
=GFT
1. ~ (~ m)		= m			(repeatedly)
2. ~(m + n)		= ~m + ~n
3. ~(m * n)		= ~m * n
4. (m - n)		= m + ~n
5. ~(m - n)		= ~m + n
6. ~0			= 0
=TEX
Note that the first of these must be performed repeatedly, since $poly\_conv$
will only apply it once, and, if there are more than four monadic minuses
this may be insufficient to reveal a non-atom for $poly\_conv$ to attack.
=SML
val ⦏minus1_thm⦎ = tac_proof(([], ⌜∀m:ℤ⦁~ (~ m) = m⌝),
	rewrite_tac[ℤ_minus_thm]);
val ⦏minus23456_thm⦎ = tac_proof(([],
	⌜∀m:ℤ⦁~(m + n) =~m + ~n
	∧	~(m * n) = ~m * n
	∧	m - n = m + ~n
	∧	~(m - n) = ~m + n
	∧	~(ℕℤ 0) = ℕℤ 0⌝),
	rewrite_tac[ℤ_minus_thm, ℤ_times_minus_thm, get_spec⌜$-⋎Z⌝]);
=TEX
=SML
val ⦏minus1_conv⦎ = REPEAT_C1 (simple_eq_match_conv minus1_thm);
val ⦏minus23456_convs⦎ = map simple_eq_match_conv (current_ad_rw_canon()minus23456_thm);
val ⦏minus_simp_conv⦎ = minus1_conv AND_OR_C FIRST_C minus23456_convs;
=TEX
We need the following theorem:
=SML
val ⦏ℤ_left_times_plus_distrib_thm⦎ =
	all_∀_intro(∧_left_elim(all_∀_elim ℤ_times_plus_distrib_thm));
=TEX
Now we can define the external interfaces:
=SML
local
val  ⦏ℤ_ANF_C_AUX⦎ : CONV -> CONV = (
	poly_conv
	ℤ_term_order
	ℤ_plus_comm_thm
	ℤ_plus_assoc_thm
	ℤ_times_comm_thm
	ℤ_times_assoc_thm
	ℤ_left_times_plus_distrib_thm
	(add_simp_conv)
	(times_simp_conv)
);
in
fun  ⦏ℤ_ANF_C⦎ (conv : CONV) : CONV = (fn tm =>
	(ℤ_ANF_C_AUX (conv ORELSE_C minus_simp_conv) tm)
	handle Fail _ => term_fail "ℤ_ANF_C" 105032 [tm]
);
val ⦏ℤ_anf_conv⦎ : CONV = (fn tm =>
	(ℤ_ANF_C fail_conv tm)
		handle ex => (
			if area_of ex = "ℤ_ANF_C"
			then reraise ex "ℤ_anf_conv"
			else raise ex
	)
);
end;
=TEX
\section{LINEAR ARITHMETIC DECISION PROCEDURE}
The material in this section implements the linear
arithmetic decision procedure for integers and is modelled  on the
treatment for the natural numbers given in \cite{DS/FMU/IED/DTD082}.
\subsection{Preliminaries}
=IGN
open LinearArithmeticTools;
=TEX
We need lots of theorems:
=SML
val ⦏ℤ_¬_eq_thm⦎ = tac_proof(([], ⌜∀m n : ℤ⦁¬m = n ⇔ m < n ∨ n < m⌝),
		REPEAT ∀_tac THEN rewrite_tac[taut_rule⌜∀a b⦁(¬a⇔b)⇔(a⇔¬b)⌝]
		THEN REPEAT strip_tac THEN_LIST
	[asm_rewrite_tac[],
	asm_rewrite_tac[],
	strip_asm_tac(list_∀_elim[⌜m:ℤ⌝, ⌜n:ℤ⌝]ℤ_less_cases_thm)
	THEN all_fc_tac [ℤ_≤_antisym_thm]]);
val ⦏add_eq_eq_thm⦎ = tac_proof(([],
	⌜∀m n i j:ℤ⦁m = n ∧ i = j ⇒ m + i = n + j⌝),
	REPEAT strip_tac THEN asm_rewrite_tac[]);
val ⦏add_eq_≤_thm⦎ = tac_proof(([],
	⌜∀m n i j:ℤ⦁m = n ∧ i ≤ j ⇒ m + i ≤ n + j⌝),
	REPEAT strip_tac THEN asm_rewrite_tac[]);
=TEX
=SML
val ⦏add_≤_≤_thm⦎ = tac_proof(
	([], ⌜∀m n i j:ℤ⦁m ≤ n ∧ i ≤ j ⇒ m + i ≤ n + j⌝),
	REPEAT ∀_tac THEN STRIP_T (strip_asm_tac o pure_rewrite_rule[ℤ_≤_def])
THEN	all_var_elim_asm_tac1
THEN	rewrite_tac[∀_elim⌜i:ℤ⌝ ℤ_plus_order_thm, ℤ_plus_assoc_thm,
		conv_rule (ONCE_MAP_C eq_sym_conv) ℕℤ_plus_homomorphism_thm,
		ℕℤ_≤_thm]);
=TEX
=SML
val ⦏minus_in_thm⦎ = tac_proof(
	([], ⌜∀i j:ℤ⦁~(i*j) = ~i*j⌝),
	rewrite_tac[ℤ_times_minus_thm]);
=TEX
=SML
val ⦏scale_eq_thm⦎  = tac_proof(
	([], ⌜∀k:ℤ; i j:ℤ⦁i = j ⇒ k * i = k * j⌝),
	REPEAT strip_tac THEN asm_rewrite_tac[]);
val ⦏pos_scale_≤_thm⦎ = tac_proof(
	([], ⌜∀m:ℕ; i j:ℤ⦁i ≤ j ⇒ ℕℤ m * i ≤ ℕℤ m * j⌝),
	rewrite_tac[ℤ_≤_def] THEN REPEAT strip_tac
	THEN ∃_tac⌜m:ℕ * m'⌝ THEN all_var_elim_asm_tac1
	THEN rewrite_tac[ℤ_times_plus_distrib_thm, ℕℤ_times_homomorphism_thm]);
=TEX
=SML
fun ⦏sum2_rule_aux⦎ (th1 : THM) (th2: THM) : THM = (
	let	val rator1 = (fst o dest_const o fst o strip_app o concl) th1;
		val rator2 = (fst o dest_const o fst o strip_app o concl) th2;
		val (add_th, conj_th) = (
			case (rator1, rator2) of
				("=", "=") => (add_eq_eq_thm, ∧_intro th1 th2)
			|	("=", "≤⋎Z") => (add_eq_≤_thm, ∧_intro th1 th2)
			|	("≤⋎Z", "≤⋎Z") => (add_≤_≤_thm, ∧_intro th1 th2)
			|	("≤⋎Z", "=") => (add_eq_≤_thm, ∧_intro th2 th1)
			|	_ => thm_fail "sum2_rule" 999 [th1, th2]
		);
	in	(conv_rule (RAND_C ℤ_plus_conv) o ⇒_match_mp_rule add_th)
		conj_th
	end
	handle Fail _ => thm_fail "sum2_rule" 999 [th1, th2]
(* ?0 and ?1 are not both of the form ⊢ a = b, ⊢ a < b, ⊢ a ≤ b ⊢ a > b or ⊢a ≥ b *)
);
=IGN
val th1 = asm_rule ⌜x + y = ℕℤ 5⌝;
val th2 = asm_rule ⌜a + b ≤ ℕℤ 12⌝;
sum2_rule_aux th1 th1;
sum2_rule_aux th1 th2;
sum2_rule_aux th2 th1;
sum2_rule_aux th2 th2;
=TEX
Note: notwithstanding the rather complex coding of the version of these functions
for the natural numbers, Hodes' algorithm as implemented in \cite{DS/FMU/IED/IMP082} produces a polynomial in which the only negative coefficients correspond to equations in the original input.
The following function does not therefore need a case for negating a ≤.
=SML
fun ⦏lit_scale_rule⦎ (a : INTEGER) (th : THM) : THM = (
	let	val scale_th =  (
			case (fst o dest_const o fst o strip_app o concl) th of
				"≤⋎Z" => (
				simple_∀_elim (mk_ℕ a) pos_scale_≤_thm
			) |	_ => (
				simple_∀_elim (mk_ℤ_signed_int a) scale_eq_thm
			)
		);
	in	(conv_rule (RAND_C ℤ_times_conv) o ⇒_match_mp_rule scale_th) th
	end
);
=IGN
lit_scale_rule one th1;
lit_scale_rule (@@"2") th1;
lit_scale_rule (@@"~3") th1;
lit_scale_rule (@@"2") th2;
=TEX
=SML
fun ⦏scale_and_sum2_rule⦎ (a1 : INTEGER) (th1 : THM) (th2: THM) : THM = (
	sum2_rule_aux (lit_scale_rule a1 th1) th2
);
=TEX
=SML
fun ⦏scaled_sum_rule⦎ (aths : (INTEGER * THM) list) : THM = (
	let 	fun r aths = (
			case aths of
				[] => fail "sum2_rule" 9089 []
			|	[(a, th)] =>
					lit_scale_rule a th
			|	(a, th) :: more =>
					scale_and_sum2_rule a th (r more)
		);
	in	conv_rule (TRY_C (LEFT_C ℤ_anf_conv)
			THEN_C TRY_C (ℤ_≤_conv ORELSE_C ℤ_eq_conv)) (r aths)
	end
);
=IGN
val th3 = asm_rule ⌜(x + ℕℤ 1) * (x - ℕℤ 1) = ℕℤ 20⌝;
val th4 = asm_rule ⌜(x + ℕℤ 1) * ~(x - ℕℤ 1) = ℕℤ 20⌝;
scaled_sum_rule [(@@"42", th1)];
scaled_sum_rule [(@@"42", th2)];
scaled_sum_rule [(@@"42", th1), (@@"9", th2), (@@"5", th3)];
scaled_sum_rule [(@@"6", th3), (@@"6", th4)];
scaled_sum_rule [(@@"6", th3), (@@"~6", th4)];
scaled_sum_rule [(@@"1", th3)];
scaled_sum_rule [(@@"~1", th3)];
=TEX
\subsection{The Linear Arithmetic Rule}
=TEX
We use the following type to represent a scaled sum of linear arithmetic
atoms:
=SML
open LinearArithmeticTools;
type ⦏SCALED_SUM⦎ = (INTEGER * TERM) list;
=TEX
=SML
fun ⦏strip_ℤ_plus⦎ (tm : TERM) : TERM list = (
	((op :: o (Combinators.I ** strip_ℤ_plus) o dest_ℤ_plus) tm)
	handle Fail _ => [tm]
);
=IGN
strip_ℤ_plus⌜x:ℤ⌝;
strip_ℤ_plus⌜x:ℤ + y + ℕℤ 42 * v + q⌝;
=TEX
Note that the following is intended to operate on a term which is either
in additive normal form.
=SML
val ⦏minus_one⦎ = @~one;
fun ⦏dest_summand⦎ (tm : TERM) : INTEGER * TERM = (
	let val nt = ((dest_ℤ_signed_int ** Combinators.I) o dest_ℤ_times) tm;
	in	if (fst nt) = one
		then (one, tm)
		else nt
	end	handle Fail _ => (
			let 	val (x, y) = (dest_ℤ_times tm);
				val x' = dest_ℤ_minus x;
			in	(minus_one, mk_ℤ_times(x', y))
			end
		)
		handle Fail _ => (minus_one, dest_ℤ_minus tm)
		handle Fail _ => (one, tm)
);
=IGN
(string_of_integer ** Combinators.I o dest_summand)⌜~(x:ℤ)⌝;
(string_of_integer ** Combinators.I o dest_summand)⌜ℕℤ 42 * v⌝;
(string_of_integer ** Combinators.I o dest_summand)⌜~(ℕℤ 42) * v⌝;
(string_of_integer ** Combinators.I o dest_summand)⌜~(ℕℤ 42) * v⌝;
(string_of_integer ** Combinators.I o dest_summand)⌜~(x:ℤ) * v⌝;
=TEX
=SML
val ⦏dest_sum⦎ : TERM -> SCALED_SUM = map dest_summand o strip_ℤ_plus;
=TEX
=SML
val ⦏mk_ℤ0⦎ = ⌜ℕℤ 0⌝;
fun ⦏mk_sum⦎ ([] : SCALED_SUM) = mk_ℤ0
|   mk_sum [(i, t)] = (
	if i = one
	then t
	else if i = minus_one
	then mk_ℤ_minus t
	else mk_ℤ_times(mk_ℤ_signed_int i, t)
) | mk_sum ((i, t) :: more) = (
	if i = one
	then mk_ℤ_plus(t, mk_sum more)
	else if i = minus_one
	then mk_ℤ_plus(mk_ℤ_minus t, mk_sum more)
	else mk_ℤ_plus(mk_ℤ_times(mk_ℤ_signed_int i, t), mk_sum more)
);
=IGN
mk_sum(dest_sum⌜ℕℤ 42 * v + a * b + c + ~(ℕℤ 5) * d⌝);
=TEX
=TEX
We use the following type to represent a constraint (with HOL terms rather
than variables as its atoms):
=SML
type ⦏TERM_CONSTRAINT⦎ = SCALED_SUM * TERM * INTEGER;
=TEX
The next function extracts a term constraint from an equation
or a ≤.
=SML
val ℤ = ⓣℤ⌝;
fun ⦏dest_constraint⦎ (tm : TERM) : TERM_CONSTRAINT OPT = (
	let	val ((rel, l), r) =
			((dest_app ** Combinators.I) o dest_app)tm;
	in	case fst(dest_const rel) of
			"=" => (
				if type_of l =: ℤ
				then Value (dest_sum l, rel, dest_ℤ_signed_int r)
				else Nil
		) |	"≤⋎Z" => (Value (dest_sum l, rel, dest_ℤ_signed_int r)
		) |	_ => Nil
	end	handle Fail _ => Nil
);
=IGN
dest_constraint⌜a + ℕℤ 7 * b + ~(ℕℤ 5) * c = ℕℤ 9⌝;
dest_constraint⌜~a = ℕℤ 9⌝;
=TEX
Given a term constraint, the following function assigns variables numbers
for $lin\_arith\_contr$ to the atoms:
=SML
fun ⦏atom_map⦎
	(x : TERM_CONSTRAINT list)
	: (int * TERM) list = (
	let	fun aux1 acc [] = acc
		|   aux1 acc ((i, t) :: more) = (
			aux1 (acc term_grab t) more
		);
		fun aux2 acc [] = acc
		|   aux2 acc ((s1, _, _) :: more) = (
			aux2 (aux1 acc s1) more
		);
		val tms = aux2 [] x;
	in	combine (interval 1 (length tms)) tms
	end
);
=IGN
atom_map [force_value (dest_constraint
		⌜a + ℕℤ 7 * b + ~(ℕℤ 5) * c * d = ℕℤ 9⌝),
	force_value (dest_constraint
		⌜a*b + ℕℤ 7 * b + ~(ℕℤ 5) * c * d = ℕℤ 9⌝)];
=TEX
=SML
fun ⦏term_rassoc⦎
	((i, t) :: more : ('a * TERM) list)
	(tm : TERM) : 'a = (
	if t ~=$ tm then i else term_rassoc more tm
) | ⦏term_rassoc⦎ [] _ = (
	fail "term_rassoc" 9090 []
);
=TEX
=SML
fun ⦏term_lassoc⦎
	((t, i) :: more : (TERM * 'a) list)
	(tm : TERM) : 'a = (
	if t ~=$ tm then i else term_lassoc more tm
) | ⦏term_lassoc⦎ [] _ = (
	fail "term_lassoc" 9090 []
);
=TEX
Given the mapping of variable numbers to HOL terms and
a scaled sum, the following
function computes the corresponding polynomial for $lin\_arith\_contr$
=SML
fun ⦏make_poly⦎ (inds : (int * TERM) list) (ss : SCALED_SUM) : POLY = (
	let	fun collect p ((i, tm) :: more) = (
			collect ((i, term_rassoc inds tm) :: p) more
		) | collect acc [] = acc;
	in	normalise_poly (collect [] ss)
	end
);
=TEX
The following function makes a constraint for $lin\_arith\_contr$,
given the mapping of variable numbers to HOL terms and
a term constraint:
=SML
fun ⦏make_constraint⦎ (inds : (int * TERM) list)
		((ind, (l, rel, r)) : int * TERM_CONSTRAINT)
		: CONSTRAINT = (
	let	val rator = (
			case fst(dest_const rel) of
				"=" => Eq
			|	"≤⋎Z" => LessEq
			|	_ => error "make_constraint" 9090 []
(* Unexpected error *)
		);
	in	(make_poly inds l, rator,  r, [(one, ind)])
	end
);
=TEX
Given a list of terms, the following function extracts all the information
needed by $lin\_arith\_contr$ and subsequently to process its output.
Note we generate variable names for each of the linear arithmetic atoms
to speed up proof of the theorem after a successful call of $lin\_arith\_contr$.
=SML
fun ⦏make_problem⦎ (tml : TERM list) :
		((int * TERM) * TERM) list
	*	((	CONSTRAINT
		*	(int * TERM_CONSTRAINT)) list) = (
	let	fun aux1 [] = []
		|   aux1 (Nil :: more) = aux1 more
		|   aux1 (Value v :: more) = v :: aux1 more;
		val stsl = aux1(map dest_constraint tml);
		val inds = atom_map stsl;
		val istsl = combine (interval 1 (length stsl)) stsl;
		val ctl = map (make_constraint inds) istsl;
	in	(map(fn (i, t)=> ((i, mk_var("@_"^string_of_int i, ℤ)), t)) inds,
			combine ctl istsl)
	end
);
=TEX
Given the relevant information about variable numbers and generated
variable names and a scaled sum the following function computes the
corresponding term:
=SML
fun ⦏make_var_sum⦎ (ivtl : ((int * TERM) * TERM) list) (ss : SCALED_SUM) : TERM = (
	let	fun name t = (
			snd(term_rassoc ivtl t)
		);
		fun aux1 (i, t) = (
			if i = one
			then name t
			else if i = minus_one
			then mk_ℤ_minus (name t)
			else mk_ℤ_times(mk_ℤ_signed_int i, name t)
		);
		fun aux2 [] = mk_ℤ_signed_int zero
		|   aux2 [s] = aux1 s
		|   aux2 (s :: more) = mk_ℤ_plus(aux1 s, aux2 more);
	in	aux2 ss
	end
);
=TEX
We are now concerned with
proving the theorem corresponding to one of the constraints passed
as input to $lin\_arith\_contr$.
=SML
fun ⦏make_var_thm⦎
	(ivtl : ((int * TERM) * TERM) list)
	((l, rel, r) : TERM_CONSTRAINT) : THM = (
	asm_rule(mk_app(mk_app(rel, make_var_sum ivtl l),
			mk_ℤ_signed_int r))
);
=TEX
The following function uses the results of $lin\_arith\_contr$ and
the substitution implicit in the results of $make\_problem$ to prove
the actual theorem that the assumptions entail $F$.
We have to patch up things of the form
=INLINEFT
~(x*y)
=TEX
the code below attempts to do this with reasonable efficiency and
simplicity, although more work and longer code would enable it to be done even faster.
=SML
fun ⦏make_actual_thm⦎
	(ivtl : ((int * TERM) * TERM) list)
	(p : POLY)
	(ts : (int * TERM_CONSTRAINT) list)
	: THM = (
	let	fun aux (i, t) = (i, make_var_thm ivtl (lassoc3 ts t));
		val subs = map (fn ((_, v), t) => (t, v)) ivtl;
		val thm = asm_inst_term_rule subs (scaled_sum_rule (map aux p));
		val conv = (fn tm =>
			if	type_of tm =: ℤ
				andalso not (is_ℤ_plus tm)
			then	TRY_C (simple_eq_match_conv minus_in_thm) tm
			else	fail_conv tm
		);
		fun rule th = rule (undisch_rule th) handle Fail _ => th;
	in	(rule (conv_rule (ONCE_MAP_C conv) 	(all_⇒_intro thm)))
		handle Fail _ => thm
	end
);

=TEX
=SML
fun ⦏diagnose⦎
	(who : string)
	(tml : TERM list)
	(ivtl : ((int * TERM) * TERM) list)
	(cts : CONSTRAINT list) : 'a = (
	let	fun format_ivt ((i,_), tm) = (
			"X" ^ string_of_int i ^ " = " ^ string_of_term tm
		);
		fun diag () = (
			diag_string(get_error_message 82100 []);
			(map diag_line o flat)
			(map (PrettyPrinter.format_term true) tml);
			case ivtl of [] => () | _ => (
				diag_string(get_error_message 82101 []);
				(app (diag_string o format_ivt) ivtl)
			);
			diag_string(get_error_message 82102 []);
			map (diag_string o format_constraint) cts;
				""
		);
	in	if	is_nil tml
		then	fail who 82111 []
		else	if is_nil cts
		then	fail who 105112 []
		else 	fail who 82110 [diag]
	end
);
fun ⦏ℤ_lin_arith_rule_aux⦎ (who : string) (tml : TERM list) : THM = (
	let	val (ivtl, ctetcl) = make_problem tml;
		val cts = (map fst ctetcl);
		val p =	(lin_arith_contr cts)
			handle Fail _ => diagnose who tml ivtl cts;
	in	make_actual_thm ivtl p (map snd ctetcl)
	end
);
=TEX
=SML
val ⦏ℤ_lin_arith_rule⦎ : TERM list -> THM = ℤ_lin_arith_rule_aux "ℤ_lin_arith_rule";
=IGN
ℤ_lin_arith_rule [
	⌜a + b = ℕℤ 0⌝
];
val tml = [
	⌜a + b = ℕℤ 0⌝,
	⌜a = ℕℤ 1⌝,
	⌜b = ℕℤ 1⌝
];
ℤ_lin_arith_rule[
	⌜a + b = ℕℤ 0⌝,
	⌜a = ℕℤ 1⌝,
	⌜b = ℕℤ 1⌝
];
ℤ_lin_arith_rule [
	⌜a + b ≤ ℕℤ 0⌝,
	⌜~a ≤ ~(ℕℤ 1)⌝,
	⌜~b ≤ ~(ℕℤ 1)⌝
];
val th20 = ℤ_lin_arith_rule [
	⌜a*a + b = ℕℤ 0⌝,
	⌜~a*a ≤ ~(ℕℤ 1)⌝,
	⌜~b ≤ ~(ℕℤ 1)⌝
];
val th20 = ℤ_lin_arith_rule [
	⌜a*a + b = ℕℤ 1⌝,
	⌜~a*a ≤ ~(ℕℤ 98765443210)⌝,
	⌜~b ≤ ~(ℕℤ 1)⌝
];
=TEX
=SML
val ⦏ℤ_lin_arith_tac⦎ : TACTIC = (fn gl =>
	(GET_ASMS_T (f_thm_tac o ℤ_lin_arith_rule o map concl) gl)
	handle ex => reraise ex "ℤ_lin_arith_tac"
);
=TEX
Now the tactic which is the automatic proof tactic
=SML
val ⦏ℤ_lin_arith_prove_tac⦎ : THM list -> TACTIC = (fn thl => fn gl =>
	((	DROP_ASMS_T (MAP_EVERY strip_asm_tac)
	THEN	MAP_EVERY  strip_asm_tac thl
	THEN	contr_tac
	THEN	ℤ_lin_arith_tac) gl)
	handle	Fail msg => fail "ℤ_lin_arith_prove_tac" 82200
			[(fn () =>get_message msg),
			 (fn () => string_of_term (snd gl))]
);
=TEX
and the associated conversion:
=SML
val ⦏ℤ_lin_arith_prove_conv⦎ : THM list -> CONV = (fn thl => fn tm =>
	let	val th = tac_proof(([], tm), ℤ_lin_arith_prove_tac thl);
	in	⇔_t_intro  th
	end	handle ex => reraise ex "ℤ_lin_arith_prove_conv"
);
=TEX
\section{OTHER RULES}
=TEX
=SML
val ⦏ℤ_eq⦎ = ⌜$=:ℤ→ℤ→BOOL⌝;
val ℤ_cancel_conv_thm1 = ℤ_eq_thm;
val ℤ_cancel_conv_thm2 = tac_proof(
	([], ⌜∀m : ℕ; j k:ℤ⦁ℕℤ m + j = k ⇔ j = k + ~ (ℕℤ m)⌝),
	REPEAT strip_tac THEN all_var_elim_asm_tac1 THEN
	rewrite_tac[∀_elim⌜k:ℤ⌝ℤ_plus_order_thm, ∀_elim⌜j:ℤ⌝ℤ_plus_order_thm]);
val ℤ_cancel_conv_thm3 = tac_proof(
	([], ⌜∀m:ℕ; j k:ℤ⦁~(ℕℤ m) + j = k ⇔ j = k + ℕℤ m⌝),
	REPEAT strip_tac THEN all_var_elim_asm_tac1 THEN
	rewrite_tac[∀_elim⌜k:ℤ⌝ℤ_plus_order_thm, ∀_elim⌜j:ℤ⌝ℤ_plus_order_thm]);
=TEX
=SML
val ⦏ℤ_≤⦎ = ⌜$≤:ℤ→ℤ→BOOL⌝;
val ℤ_≤_cancel_conv_thm1 = ℤ_≤_≤_0_thm;
val ℤ_≤_cancel_conv_thm2 = tac_proof(
	([], ⌜∀m : ℕ; j k:ℤ⦁ℕℤ m + j ≤ k ⇔ j ≤ k + ~ (ℕℤ m)⌝),
	once_rewrite_tac[ℤ_≤_≤_0_thm]
	THEN rewrite_tac[∀_elim⌜~k:ℤ⌝ ℤ_plus_order_thm]
	THEN rewrite_tac[∀_elim⌜j:ℤ⌝ ℤ_plus_order_thm]);
val ℤ_≤_cancel_conv_thm3 = tac_proof(
	([], ⌜∀m:ℕ; j k:ℤ⦁~(ℕℤ m) + j ≤ k ⇔ j ≤ k + ℕℤ m⌝),
	once_rewrite_tac[ℤ_≤_≤_0_thm]
	THEN rewrite_tac[∀_elim⌜~k:ℤ⌝ ℤ_plus_order_thm]
	THEN rewrite_tac[∀_elim⌜j:ℤ⌝ ℤ_plus_order_thm]);
=TEX
=SML
fun ⦏gen_cancel_conv⦎ (r : TERM) (conv_thm1 : THM) (conv_thm2 : THM) (conv_thm3: THM)
	: CONV = (fn tm =>
	let	val (rela, b) = dest_app tm;
		val (rel, a) = dest_app rela;
	in 	if rel =$ r
		then
	let	val thm1 = (
			if	is_ℤ_signed_int b
			then	Nil
			else	Value (list_∀_elim[a, b] conv_thm1)
		);
		val arb1 =
			case thm1 of
				Value thm => snd(dest_app(concl thm))
			|	Nil => tm;
		val thm2 = Value (RATOR_C (RAND_C ℤ_anf_conv) arb1)
				handle Fail _ => Nil;
		val arb2 =
			case thm2 of
				Value th => snd(dest_eq (concl th))
		|	_ => arb1;
		val (_, a2) = dest_app (fst(dest_app arb2));
		val thm3 = (
			let	val c = dest_ℤ_signed_int(fst (dest_ℤ_plus a2));
			in	Value
				(if	c @>= zero
				then	(simple_eq_match_conv conv_thm2
					THEN_C RIGHT_C ℤ_plus_conv) arb2
				else	(simple_eq_match_conv conv_thm3
					THEN_C RIGHT_C ℤ_plus_conv) arb2)
			end	handle Fail _ => Nil
		);
		fun chain (Value th1) (Value th2)= Value(eq_trans_rule th1 th2)
		|   chain (Value th1) Nil = Value th1
		|   chain Nil (Value th2) = Value th2
		|   chain Nil Nil = Nil;
	in	case chain thm1 (chain thm2 thm3)of
			Value th => th
		|	Nil => fail_conv tm
	end	else	fail_conv tm
	end
);
=TEX
=SML
val ⦏ℤ_eq_cancel_conv⦎ : CONV = (fn tm =>
	(gen_cancel_conv
		ℤ_eq ℤ_cancel_conv_thm1 ℤ_cancel_conv_thm2
			ℤ_cancel_conv_thm3 tm)
	handle Fail _ => term_fail "ℤ_eq_cancel_conv" 105120 [tm]
);
=TEX
=SML
val ⦏ℤ_≤_cancel_conv⦎ : CONV = (fn tm =>
	(gen_cancel_conv
		ℤ_≤ ℤ_≤_cancel_conv_thm1 ℤ_≤_cancel_conv_thm2
			ℤ_≤_cancel_conv_thm3 tm)
	handle Fail _ => term_fail "ℤ_eq_cancel_conv" 105121 [tm]
);
=IGN
ℤ_eq_cancel_conv⌜a + b + ℕℤ 4 = ℕℤ 9 + y⌝;
ℤ_eq_cancel_conv⌜a + b + ℕℤ 20 = ℕℤ 9 + y⌝;
ℤ_eq_cancel_conv⌜b + a = ℕℤ 9 + y⌝;
ℤ_eq_cancel_conv⌜b + a = ℕℤ 9⌝;
ℤ_eq_cancel_conv⌜a + b = ℕℤ 9⌝   (* should fail *);
ℤ_eq_cancel_conv⌜ℕℤ 0 = ℕℤ 9⌝   (* should fail *);
ℤ_eq_cancel_conv⌜T = F⌝   (* should fail *);
ℤ_eq_cancel_conv⌜T ∨ F⌝   (* should fail *);
ℤ_≤_cancel_conv⌜a + b + ℕℤ 4 ≤ ℕℤ 9 + y⌝;
ℤ_≤_cancel_conv⌜a + b + ℕℤ 20 ≤ ℕℤ 9 + y⌝;
ℤ_≤_cancel_conv⌜b + a ≤ ℕℤ 9 + y⌝;
ℤ_≤_cancel_conv⌜b + a ≤ ℕℤ 9⌝;
ℤ_≤_cancel_conv⌜a + b ≤ ℕℤ 9⌝   (* should fail *);
ℤ_≤_cancel_conv⌜ℕℤ 0 ≤ ℕℤ 9⌝   (* should fail *);
ℤ_≤_cancel_conv⌜T = F⌝   (* should fail *);
ℤ_≤_cancel_conv⌜T ∨ F⌝   (* should fail *);
=TEX
\section{THE PROOF CONTEXTS}
The equational contexts required are the same for stripping goals and stripping
theorems. We take numeric $=$ and $≤$ as the atomic
predicates which we will deal with. The possibilities are:
{\em(i)} put the a ground atomic predicate into normal form with the appropriate canncellation conversion;
{\em(ii)} convert a negated atomic predicate into an atomic one;
{\em(iii)} convert a predicate formed with $<$, $≥$ or $>$ into an atomic one;
{\em(iv)} convert the negation of a predicate formed with $<$, $≥$ or $>$ into an atomic one;
and
{\em(v)} attempt to evaluate ground inequalities.
=TEX
The following is a little bit more leisurely than the natural numbers versions;
it does the conversion into atomic predicates in easy stages.
=SML
val strip_cxt = [

	(⌜(x:ℤ) = y⌝, ℤ_eq_conv),
	(⌜(x:ℤ) ≤ y⌝, ℤ_≤_conv),

	(⌜¬(x:ℤ) = y⌝, simple_eq_match_conv ℤ_¬_eq_thm),
	(⌜¬(x:ℤ) ≤ y⌝, simple_eq_match_conv ℤ_¬_≤_thm),

	(⌜(x:ℤ) < y⌝, simple_eq_match_conv ℤ_less_def),
	(⌜(x:ℤ) ≥ y⌝, simple_eq_match_conv ℤ_≥_def),
	(⌜(x:ℤ) > y⌝, simple_eq_match_conv ℤ_greater_def),

	(⌜¬ (x:ℤ) < y⌝, simple_eq_match_conv ℤ_¬_less_thm),
	(⌜¬ (x:ℤ) ≥ y⌝, RAND_C(simple_eq_match_conv ℤ_≥_def)),
	(⌜¬ (x:ℤ) > y⌝, RAND_C(simple_eq_match_conv ℤ_greater_def)),


	(⌜(x:ℤ) = y⌝, ℤ_eq_cancel_conv),
	(⌜(x:ℤ) ≤ y⌝, ℤ_≤_cancel_conv)];
=IGN
map (fn (t, c) => TRY_C c t) strip_cxt;
=TEX
=SML
val _ = delete_pc "'ℤ_lin_arith" handle Fail _ => ();
val _ = new_pc ⦏"'ℤ_lin_arith"⦎;
val _ = set_rw_eqn_cxt strip_cxt "'ℤ_lin_arith";
val _ = set_st_eqn_cxt strip_cxt "'ℤ_lin_arith";
val _ = set_sc_eqn_cxt strip_cxt "'ℤ_lin_arith";
val _ = set_pr_tac ℤ_lin_arith_prove_tac "'ℤ_lin_arith";
val _ = set_pr_conv ℤ_lin_arith_prove_conv "'ℤ_lin_arith";
val _ = commit_pc "'ℤ_lin_arith";
=TEX
=SML
val _ = delete_pc "ℤ_lin_arith" handle Fail _ => ();
val _ = new_pc ⦏"ℤ_lin_arith"⦎;
val _ = merge_pcs ["predicates","'ℤ_lin_arith"] "ℤ_lin_arith";
val _ = commit_pc "ℤ_lin_arith";
=TEX
=IGN
map (PC_C1 "ℤ_lin_arith" rewrite_conv[]) [
	⌜ℕℤ 1 = ℕℤ 2⌝, ⌜ℕℤ 3 ≤ ℕℤ 2⌝, ⌜ℕℤ 2 = ℕℤ 2⌝, ⌜ℕℤ 1 ≤ ℕℤ 2⌝
,	⌜a + b = b + a + ℕℤ 1⌝, ⌜a + ℕℤ 20 + b = (a+ ℕℤ 10)+(b+ ℕℤ 10)⌝
,	⌜a + b ≤ b + a - ℕℤ 1⌝, ⌜a + ℕℤ 20 + b ≤ (a+ ℕℤ 14)+(b+ ℕℤ 10)⌝
,	⌜¬ℕℤ 10 = ℕℤ 20⌝, ⌜¬(a:ℤ) + b = b + a⌝
,	⌜¬ℕℤ 10 ≤ ℕℤ 20⌝, ⌜¬(a:ℤ) + b ≤ b + a⌝
,	⌜ℕℤ 10 < ℕℤ 20⌝, ⌜(a:ℤ) + b ≥ b + a⌝, ⌜(a:ℤ) + b > b + a⌝
,	⌜¬ℕℤ 10 < ℕℤ 20⌝, ⌜¬(a:ℤ) + b ≥ b + a⌝, ⌜¬(a:ℤ) + b > b + a⌝
,	⌜(a:ℤ +b)*(a-b) = a*a - b*b⌝, ⌜(a:ℤ +b)*(a-b) = a*a - b*b ⌝
];
map (PC_C1 "ℤ_lin_arith" prove_rule[]) [
	⌜a*a ≥ ℕℤ 0 ∧ b*b ≥ ℕℤ 0 ⇒ (a+b)*(a+b) ≥ ℕℤ 2 * a * b⌝
];
map (PC_C1 "ℤ_lin_arith" rewrite_conv[]) [
	⌜a*a ≥ ℕℤ 0 ∧ b*b ≥ ℕℤ 0 ⇒ (a+b)*(a+b) ≥ ℕℤ 2 * a * b⌝
];
=SML
val _ = pop_pc();
end (* of structure ℤArithmeticTools *);
open ℤArithmeticTools;
=TEX
\section{MORE THEOREMS THE THEORY OF INTEGERS}
This section contains theorems required in DTD093 which are more conveniently proved using the tools introduced here.
=SML
structure ⦏ℤ⦎ : ℤ = struct;
=TEX
=SML
open ℤ;
val _ =  push_merge_pcs["basic_hol1", "'ℤ"];
=TEX
=SML
val ⦏ℤ_fun_∃_thm⦎ = (
set_goal([], ⌜∀f g : 'a → 'a; z: 'a⦁
	(∀x⦁ g(f x) = x)
∧	(∀y⦁ f(g y) = y)
⇒	∃⋎1h : ℤ → 'a⦁
	h(ℕℤ 0) = z
∧	(∀i⦁h(i + ℕℤ 1) = f(h i))
∧	(∀i⦁h(i - ℕℤ 1) = g(h i))
⌝);
a(lemma_tac⌜
	(∃p⦁∀m⦁p(ℕℤ m) = m)
∧	(∃n⦁∀m⦁n(~(ℕℤ m)) = m)⌝
	THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(∃_tac⌜λi⦁(ε n⦁i = ℕℤ n)⌝ THEN rewrite_tac[] THEN REPEAT strip_tac);
a(ε_tac⌜ε n⦁ ℕℤ m = ℕℤ n⌝ THEN prove_tac[]);
a(POP_ASM_T ante_tac THEN rewrite_tac[ℕℤ_one_one_thm]);
a(STRIP_T (fn th => conv_tac(RIGHT_C (once_rewrite_conv[th]))) THEN REPEAT strip_tac);
(* *** Goal "2" *** *)
a(∃_tac⌜λi⦁(ε n⦁i = ~(ℕℤ n))⌝ THEN rewrite_tac[] THEN REPEAT strip_tac);
a(ε_tac⌜ε n⦁ ~(ℕℤ m) = ~(ℕℤ n)⌝ THEN prove_tac[]);
a(POP_ASM_T ante_tac THEN rewrite_tac[
	pc_rule1"ℤ_lin_arith" prove_rule[] ⌜∀a b:ℤ⦁~a = ~b ⇔ a = b⌝,
	ℕℤ_one_one_thm]);
a(STRIP_T (fn th => conv_tac(RIGHT_C (once_rewrite_conv[th]))) THEN REPEAT strip_tac);
(* *** Goal "3" *** *)
a(lemma_tac⌜
	(∃hp⦁ hp 0 = z ∧ ∀m⦁hp (m+1) = f(hp m))
∧	(∃hn⦁ hn 0 = z ∧ ∀m⦁hn (m+1) = g(hn m))
⌝ THEN1 (REPEAT strip_tac THEN prove_∃_tac));
a(∃⋎1_tac⌜λi⦁if ℕℤ 0 ≤ i then hp(p i) else hn(n i)⌝ THEN asm_rewrite_tac[]);
a(REPEAT strip_tac);
(* *** Goal "3.1" *** *)
a(cases_tac⌜ℕℤ 0 ≤ i⌝);
(* *** Goal "3.1.1" *** *)
a(all_fc_tac[ℤ_∈_ℕ_thm] THEN all_var_elim_asm_tac1);
a(lemma_tac⌜ℕℤ 0 ≤ ℕℤ m + ℕℤ 1⌝ THEN1 PC_T1 "ℤ_lin_arith" asm_prove_tac[]);
a(asm_rewrite_tac[] THEN asm_rewrite_tac[ℕℤ_plus_homomorphism_thm1]);
(* *** Goal "3.1.2" *** *)
a(lemma_tac⌜ℕℤ 0 ≤ ~i⌝ THEN1 PC_T1 "ℤ_lin_arith" asm_prove_tac[]);
a(all_fc_tac[ℤ_∈_ℕ_thm] THEN all_var_elim_asm_tac1);
a(POP_ASM_T (strip_asm_tac o rewrite_rule[
	pc_rule1 "ℤ_lin_arith" prove_rule[]⌜~i  = ℕℤ m ⇔ i = ~(ℕℤ m)⌝])
	THEN all_var_elim_asm_tac1);
a(POP_ASM_T discard_tac);
a(LEMMA_T ⌜¬ℕℤ 0 ≤ ~(ℕℤ m)⌝ rewrite_thm_tac THEN1 PC_T1 "ℤ_lin_arith" asm_prove_tac[]);
a(cases_tac⌜ℕℤ m = ℕℤ 0⌝ THEN1 asm_rewrite_tac[]);
(* *** Goal "3.1.2.1" *** *)
a(POP_ASM_T (strip_asm_tac o rewrite_rule[ℕℤ_one_one_thm]) THEN all_var_elim_asm_tac1);
(* *** Goal "3.1.2.2" *** *)
a(cases_tac⌜ℕℤ m = ℕℤ 1⌝ THEN1 asm_rewrite_tac[]);
(* *** Goal "3.1.2.2.1" *** *)
a(POP_ASM_T (strip_asm_tac o rewrite_rule[ℕℤ_one_one_thm]) THEN all_var_elim_asm_tac1);
a(SPEC_NTH_ASM_T 1⌜0⌝ ante_tac THEN rewrite_tac[] THEN STRIP_T asm_rewrite_thm_tac);
(* *** Goal "3.1.2.2.2" *** *)
a(LEMMA_T⌜¬ℕℤ 0 ≤ ~ (ℕℤ m) + ℕℤ 1⌝rewrite_thm_tac THEN1
	PC_T1 "ℤ_lin_arith" asm_prove_tac[]);
a(asm_rewrite_tac[]);
a(DROP_NTH_ASM_T 2 (strip_asm_tac o rewrite_rule[ℕℤ_one_one_thm]));
a(strip_asm_tac (∀_elim⌜m⌝ ℕ_cases_thm));
a(DROP_NTH_ASM_T 2 discard_tac THEN all_var_elim_asm_tac1);
a(asm_rewrite_tac[ℕℤ_plus_homomorphism_thm]);
a(conv_tac (ONCE_MAP_C ℤ_anf_conv) THEN asm_rewrite_tac[]);
(* *** Goal "3.2" *** *)
a(cases_tac⌜ℕℤ 0 ≤ i⌝);
(* *** Goal "3.2.1" *** *)
a(all_fc_tac[ℤ_∈_ℕ_thm] THEN all_var_elim_asm_tac1);
a(cases_tac⌜ ℕℤ m = ℕℤ 0⌝ THEN asm_rewrite_tac[]);
(* *** Goal "3.2.1.1" *** *)
a(POP_ASM_T (strip_asm_tac o rewrite_rule[ℕℤ_one_one_thm]) THEN all_var_elim_asm_tac1);
a(SPEC_NTH_ASM_T 1 ⌜0⌝ ante_tac THEN rewrite_tac[] THEN STRIP_T asm_rewrite_thm_tac);
(* *** Goal "3.2.1.2" *** *)
a(cases_tac⌜ ℕℤ m = ℕℤ 1⌝ THEN1 asm_rewrite_tac[]);
(* *** Goal "3.2.1.2.1" *** *)
a(POP_ASM_T (strip_asm_tac o rewrite_rule[ℕℤ_one_one_thm]) THEN all_var_elim_asm_tac1);
a(SPEC_NTH_ASM_T 3 ⌜0⌝ ante_tac THEN rewrite_tac[] THEN STRIP_T asm_rewrite_thm_tac);
(* *** Goal "3.2.1.2.2" *** *)
a(LEMMA_T⌜ℕℤ 0 ≤ ℕℤ m + ~(ℕℤ 1)⌝rewrite_thm_tac THEN1
	PC_T1 "ℤ_lin_arith" asm_prove_tac[]);
a(DROP_NTH_ASM_T 2 (strip_asm_tac o rewrite_rule[ℕℤ_one_one_thm]));
a(strip_asm_tac (∀_elim⌜m⌝ ℕ_cases_thm));
a(DROP_NTH_ASM_T 2 discard_tac THEN all_var_elim_asm_tac1);
a(asm_rewrite_tac[ℕℤ_plus_homomorphism_thm]);
a(conv_tac (ONCE_MAP_C ℤ_anf_conv) THEN asm_rewrite_tac[]);
(* *** Goal "3.2.2" *** *)
a(LEMMA_T⌜¬ℕℤ 0 ≤ i + ~(ℕℤ 1) ∧ ¬ℕℤ 0 ≤ i⌝rewrite_thm_tac THEN1
	PC_T1 "ℤ_lin_arith" asm_prove_tac[]);
a(lemma_tac⌜ℕℤ 0 ≤ ~i⌝ THEN1 PC_T1 "ℤ_lin_arith" asm_prove_tac[]);
a(all_fc_tac[ℤ_∈_ℕ_thm]);
a(POP_ASM_T (strip_asm_tac o rewrite_rule[
	pc_rule1 "ℤ_lin_arith" prove_rule[]⌜~i  = ℕℤ m ⇔ i = ~(ℕℤ m)⌝])
	THEN all_var_elim_asm_tac1);
a(POP_ASM_T discard_tac);
a(pure_asm_rewrite_tac[
	pc_rule1 "ℤ_lin_arith" prove_rule[]⌜∀a b:ℤ⦁~a + ~b = ~(a+b)⌝,
	ℕℤ_plus_homomorphism_thm1]);
a(REPEAT strip_tac);
(* *** Goal "3.3" *** *)
a(strip_asm_tac (∀_elim ⌜x⌝ ℤ_cases_thm)
	THEN all_var_elim_asm_tac1);
(* *** Goal "3.3.1" *** *)
a(rewrite_tac[ℕℤ_≤_thm]);
a(induction_tac⌜m⌝ THEN
	asm_rewrite_tac[ℕℤ_plus_homomorphism_thm]);
(* *** Goal "3.3.2" *** *)
a(cases_tac⌜m = 0⌝ THEN1
	asm_rewrite_tac[]);
a(asm_rewrite_tac[pc_rule1"ℤ_lin_arith"
	prove_rule[]
	⌜∀b:ℤ⦁ ℕℤ 0 ≤ ~b ⇔ b ≤ ℕℤ 0⌝,
	ℕℤ_≤_thm]);
a(POP_ASM_T discard_tac THEN
	induction_tac⌜m⌝ THEN asm_rewrite_tac[ℕℤ_plus_homomorphism_thm]);
save_pop_thm "ℤ_fun_∃_thm"
);
=TEX
=SML
val _ = pop_pc();
=TEX
=SML
end (* of structure ℤ *)
open ℤ;


=TEX
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}



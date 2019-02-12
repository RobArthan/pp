=IGN
********************************************************************************
imp082.doc: this file is part of the PPHol system

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

\def\Title{Implementation of Linear Arithmetic Proof Procedures}

\def\AbstractText{This document contains the implementation of proof procedures for linear arithmetic.}

\def\Reference{DS/FMU/IED/IMP082}

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
%% LaTeX2e port: \TPPtitle{Implementation of Linear Arithmetic Proof Procedures}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP082}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.11 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2002/10/17 16:20:01 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{R.D.~Arthan & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.B.~Jones & FMU Manager}
%% LaTeX2e port: \TPPabstract{This document contains the implementation of proof
%% LaTeX2e port: procedures for linear arithmetic.}
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
\item[1.1-1.7] Initial drafts.
\item[1.8,1.9] Update for new INTEGER type.
\item[Issue 1.10 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.11 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.12 (2005/04/24)] Now uses {\tt app} rather than {\tt map} when appropriate.
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
The document responds to \cite{DS/FMU/IED/DTD082}.
\subsection{Introduction}
\subsubsection{Purpose and Background}
\subsubsection{Dependencies}
This document depends on the theory $basic\_hol$ defined in
\cite{DS/FMU/IED/DTD045}, on the conversions in
\cite{DS/FMU/IED/DTD081}, and on the tactics and rules of
\cite{DS/FMU/IED/DTD027,DS/FMU/IED/DTD029}.
\subsubsection{Algorithms}
See the detailed design document \cite{DS/FMU/IED/DTD082} for
a general description of the algorithm and the remarks between code
fragments below for
more detailed discussion of implementation techniques, such as the
representation of the problems.
\subsubsection{Known Deficiencies}
See \cite{DS/FMU/IED/DTD082}.
\subsubsection{Possible Enhancements}
There is some scope for increasing the efficiency of the
cancellation conversions based on
=INLINEFT
gen_cancel_conv
=TEX
.
These currently make heavier use of the additive normal form normaliser
=INLINEFT
anf_conv
=TEX
\ than is really needed. However, there has not been time to code up
a more efficient version because of the plethora of special cases which arise
in implementing the ``obvious'' merge of two normalised terms collecting
like terms as you go. It is also felt more likely to
be cost effective to work harder on the efficiency
=INLINEFT
anf_conv
=TEX
\ before expending further effort here.

\section{PREAMBLE}
=SML
structure ⦏LinearArithmetic⦎ : LinearArithmetic = struct
open Sort;
=TEX
\section{THE LINEAR ARITHMETIC PROOF PROCEDURE}
\subsection{Representing Constraints}
=SML
structure ⦏LinearArithmeticTools⦎ = struct
=TEX
We represent degree one polynomials in many variables $x_1$, $x_2$, ...
(henceforth, just {\em polynomials}) using
lists of pairs of integers, a pair $(a, i)$ indicating that the $i$-th variable
has coefficient $a$. We always arrange for the variables to occur in strictly
increasing order and for pairs with zero coefficients to be omitted.
=SML
type ⦏POLY⦎ = (INTEGER * int) list;
=TEX
Equations, inequalities and strict inequalities are distingushed using:
=SML
datatype ⦏CONSTRAINT_TYPE⦎ = Eq | LessEq | Less;
=TEX
We assume the input constraint are labelled with variables, given
as polynomials of the form $x_j$.
The provenance of a generated constraint is then represented using a polynomial,
where e.g. $2x_1 + 3x_2$ means add twice the polynomial labelled with
$x_1$ to thrice that labelled $x_2$.
=SML
type ⦏ORIGIN⦎ = POLY;
=TEX
A constraint is then represented by:
=SML
type ⦏CONSTRAINT⦎ = POLY * CONSTRAINT_TYPE * INTEGER * ORIGIN;
=TEX
The following functions may be used to ensure that the polynomials in a constraint
are in increasing order of variable name and have no entries with
zero coefficients:
=SML
fun ⦏normalise_poly⦎ (p : POLY) : POLY = (
	let
		fun aux [] = []
		|   aux ((a1, i1)::(more1 as ((a2, i2) :: more2))) = (
			if a1 = zero
			then aux more1
			else if i1 = i2
			then aux ((a1@+a2,i1)::more2)
			else (a1, i1) :: aux more1
		) | aux (p as [(a, i)]) = (
			if	a = zero
			then	[]
			else	p
		);
		 fun order ((i1,j1):INTEGER*int) (i2,j2) = (
			if j1 <> j2
			then j1 - j2
			else 1
		);
	in aux (sort order p)
	end
);
fun ⦏normalise_constraint⦎ ((p, ct, c, o1) : CONSTRAINT) : CONSTRAINT = (
	(normalise_poly p, ct, c, normalise_poly o1)
);
=TEX
\subsection{Formatting Functions}
=SML
fun ⦏format_poly⦎ (p : POLY) : string = (
	let	fun s i = (
			if i @< zero
			then string_of_integer i
			else "+" ^ string_of_integer i
		);
		fun aux1(a, i) = (
			if a = one
			then "+X" ^ string_of_int i
			else if a = @~ one
			then "-X" ^ string_of_int i
			else s a ^ "X" ^ string_of_int i
		);
	in	case p of
			[] => "0"
		|	_ => format_list aux1 p " "
	end
);
=TEX
=SML
fun ⦏format_origin⦎ (p : ORIGIN) : string = (
	let
		fun aux1(a, i) = (
			if a = one
			then "+" ^ string_of_int i ^ "'"
			else if a = @~ one
			then "-" ^ string_of_int i  ^ "'"
			else (string_of_integer a) ^ "*" ^ string_of_int i ^"'"
		);
	in	format_list aux1 p " "
	end
);
=TEX
=SML
fun ⦏format_constraint_type⦎ Eq = "="
|   format_constraint_type Less = "<"
|   format_constraint_type LessEq = "≤";
=TEX
=SML
fun ⦏format_constraint⦎ ((p, ty, c, o1 as [(d, i)]): CONSTRAINT) : string = (
	(if d = one
	then string_of_int i
	else format_origin o1)
	^ ": " ^ format_poly p ^ " " ^
	format_constraint_type ty ^ " " ^ string_of_integer c
) | ⦏format_constraint⦎ ((p, ty, c, o1): CONSTRAINT) : string = (
	format_origin o1 ^ ": " ^
	format_poly p ^ " " ^ format_constraint_type ty ^ " " ^ string_of_integer c
);
=TEX
\subsection{Cross-multiplication and adding}
=SML
fun ⦏mult_and_add_poly⦎ (b1 : INTEGER) (p1 : POLY) (b2 : INTEGER) (p2 : POLY) : POLY = (
	let
		fun aux (p1 as ((a1, i1) :: more1):POLY) (p2 as ((a2, i2) :: more2):POLY) = (
			if i1 = i2
			then	let val x = b1@*a1 @+ b2@*a2;
				in	if x = zero
					then aux more1 more2
					else (x, i1) :: aux more1 more2
				end
			else if i1 < i2
			then (b1@*a1, i1) :: aux more1 p2
			else (b2@*a2, i2) :: aux p1 more2
		) | aux [] ((a2, i2) :: more2) = (
			(b2@*a2, i2) :: aux [] more2
		) | aux ((a1, i1) :: more1) [] = (
			(b1@*a1, i1) :: aux more1 []
		) | aux [] [] = [];
	in	aux p1 p2
	end
);
=TEX
=SML
fun ⦏mult_and_add_ct⦎
		(b1 : INTEGER) (ct1  : CONSTRAINT_TYPE)
		(b2 : INTEGER) (ct2 : CONSTRAINT_TYPE) : CONSTRAINT_TYPE = (
	case (ct1, ct2) of
		(Eq, _) => ct2
	|	(_, Eq) => ct1
	|	(Less, _) => Less
	|	(_, Less) => Less
	| _ => LessEq
);
=TEX
=SML
val ⦏mult_and_add_o⦎ : INTEGER -> ORIGIN -> INTEGER -> ORIGIN -> ORIGIN = mult_and_add_poly;
=TEX
=SML
fun ⦏mult_and_add_constraint⦎
		(b1 : INTEGER) ((p1, ct1, c1, o1) : CONSTRAINT)
		(b2 : INTEGER) ((p2, ct2, c2, o2) : CONSTRAINT) : CONSTRAINT = (
		(mult_and_add_poly b1 p1 b2 p2,
		 mult_and_add_ct b1 ct1 b2 ct2,
		 b1@*c1 @+ b2@*c2,
		 mult_and_add_o b1 o1 b2 o2)
);
=TEX
\subsection{Checking new constraints}
As new constraints are generated we check whether each constraint is
ground (i.e. its polynomial is zero). The truth or impossibility of a ground
constraint may be checked directly. If the ground constraint is true, then
we may discard it; if false, then we have found the desired contradictory
consequence of the original set of constraints. To simplify the control
flow, we raise an exception containing the contradictory ground constraint
when this latter condition occurs.
=SML
exception ⦏Contradiction⦎ of CONSTRAINT;
=TEX
The following datatype and function are used to classify constraints
as ground truths, ground falsehoods or not ground:
=SML
datatype ⦏CONSTRAINT_VALUE⦎ = Truth | Falsehood | NotGround;
=TEX
=SML
fun ⦏check_constraint⦎ (([], ct, c, _) : CONSTRAINT) = (
	if
		case ct of
			Eq => zero = c
		|	Less => zero @< c
		|	LessEq => zero @<= c
	then Truth
	else Falsehood
) | check_constraint _ = NotGround;
=TEX
The following function is used to accumulate new constraints as they
are generated and to raise Contradiction when a contradictory constraint
is found.
=SML
fun ⦏acc_constraint⦎ (cs : CONSTRAINT) (acc : CONSTRAINT list)
		: CONSTRAINT list = (
	case check_constraint cs of
		NotGround => cs :: acc
	|	Truth => acc
	|	Falsehood => raise Contradiction cs
);
=TEX
The following functions are used to compute cross-multipliers.
=SML
fun ⦏gcd⦎ (a1 : INTEGER) (a2 : INTEGER) : INTEGER = (
	let fun aux x1 x2 = (
			if x1 @< x2
			then aux x2 x1
			else if x2 = zero
			then x1
			else aux x2 (x1 imod x2)
		);
	in
		if a1 @< zero
		then gcd (@~a1) a2
		else if a2 @< zero
		then gcd a1 (@~a2)
		else aux a1 a2
	end
);
=TEX
=SML
fun ⦏sgn⦎ (i : INTEGER) : int = if i @< zero then ~1 else if i = zero then 0 else 1;
=TEX
=SML
fun ⦏x_multipliers⦎ (i : INTEGER) (j : INTEGER) : (INTEGER * INTEGER) = (
	let	val d = gcd i j;
		val m = iabs j idiv d;
		val n = iabs i idiv d;	 (* so m*abs i = n*abs j *)
	in
		if sgn i = sgn j
		then (m, @~n)
		else (m, n)
	end
);
=TEX
=SML
fun ⦏coeff_of⦎ (i : int) (p : POLY) : INTEGER = (
	case p of
		[] => zero
	| (a, j) :: more => if j > i then zero else if j = i then a else coeff_of i more
);
=TEX
The following replaces all equations in a system by a pair of inequalities.
=SML
fun ⦏all_eq_eliminate⦎ (csl : CONSTRAINT list) : CONSTRAINT list = (
	let	fun aux ((cs as (p, Eq, c:INTEGER, o1)) :: more) = (
			(p, LessEq, c, o1) ::
			(map (fn (i:INTEGER, j) => (@~i, j)) p,
			 LessEq,
			 @~c,
			 mult_and_add_o (@~one) o1 zero [])
			:: aux more
		) | aux (cs :: more) = cs :: aux more
		|  aux [] = [];
	in	aux csl
	end
);
=TEX
The following function is assumes that any equations have been eliminated.
It is given a variable to be eliminated, a list of inequalities in which
that variable occurs positively and a list of inequalities in which it occurs
negatively. It returns the list of all non-ground inequalities obtainable
by taking an inequality from each of the two lists and cross-multiplying
and adding to eliminate the variable.
=SML
fun ⦏ineq_eliminate⦎ (i : int) (posl : CONSTRAINT list)
		(negl : CONSTRAINT list) : CONSTRAINT list = (
	let
		fun aux1 poscs xma ((negcs as (negp, _, _, _)) :: more) = (
			let
				val b = coeff_of i negp;
				val (m, n) = xma b;
			in
				acc_constraint
				(mult_and_add_constraint m poscs n negcs)
				(aux1 poscs xma more)
			end
		) | aux1 _ _ [] = [];
		fun aux2 (poscs as (p, _, _, _)) = (
			aux1 poscs (x_multipliers (coeff_of i p)) negl
		);
	in	flat (map aux2 posl)
	end
);
=TEX
The following functions uses the previous one to eliminate all non-ground
inequalities from a system (again on the assumption that the equations
have already been eliminated). Note that the returned value is of no real
interest: it will always be []. The only interesting ``return'' value  is when
a ground inequality is found which is contradictory as signalled by the
raising of the exception Contradiction.
=SML
fun ⦏all_ineq_eliminate⦎ (csl : CONSTRAINT list) : CONSTRAINT list = (
	let
		fun group_by_sign i negl zerol posl [] = (rev negl, rev zerol, rev posl)
		|   group_by_sign i negl zerol posl ((cs as (p, _, _, _)) :: more) = (
			case sgn (coeff_of i p) of
				~1 => group_by_sign i (cs::negl) zerol posl more
			|	0 => group_by_sign i negl (cs::zerol) posl more
			|	_ => group_by_sign i negl zerol (cs::posl) more
		);
	in	case csl of
			[] => []
		|	(((_, i)::_, _, _, _) :: _) => (
				let val (negl, zerol, posl) = group_by_sign i [] [] [] csl;
				in	all_ineq_eliminate (zerol @ ineq_eliminate i posl negl)
				end
		) | (ground :: more) => all_ineq_eliminate (acc_constraint ground more)
	end
);
=TEX
We now have all the pieces required to code the decision procedure as
a function to test the unsatisfiability of a system of linear constraints.
If the system is unsatisfiable, the function returns a ground constraint
which is contradictory, otherwise an exception is raised. For an
 unsatisfiable system, the caller may then use the ORIGIN component of
the return value to derive a contradiction from the input data.
It is the caller's responsibility to ensure that the input constraints have
appropriate ORIGIN values. However, the function does arrange for the
polynomials in the constraints to be in increasing order and to have no
entries with zero coefficients (as required for the polynomial operations
to work correctly).
=SML
fun ⦏lin_arith_contr⦎ (csl : CONSTRAINT list) : POLY = (
	(all_ineq_eliminate (all_eq_eliminate(map normalise_constraint csl));
	fail "lin_arith_contr" 82110 [])
	handle Contradiction (cs as (_, _, _, org)) => org
);
=SML
end (* of structure LinearArithmeticTools *);
=TEX
=SML
open LinearArithmeticTools;
val ⦏old_theory⦎ = get_current_theory_name();
val _ = open_theory"basic_hol";
val _ = push_pc"basic_hol";
=TEX
\section{RULES}
=TEX
We need lots of theorems:
=SML
val ⦏¬_eq_thm⦎ = tac_proof(([], ⌜∀m n : ℕ⦁¬m = n ⇔ m < n ∨ n < m⌝),
		REPEAT ∀_tac THEN rewrite_tac[taut_rule⌜∀a b⦁(¬a⇔b)⇔(a⇔¬b)⌝]
		THEN REPEAT strip_tac THEN (asm_rewrite_tac[] ORELSE
			strip_asm_tac(list_∀_elim[⌜m:ℕ⌝, ⌜n:ℕ⌝]less_cases_thm)));

val ⦏add_eq_eq_thm⦎ = tac_proof(([], ⌜∀m n i j⦁m = n ∧ i = j ⇒ m + i = n + j⌝),
	REPEAT strip_tac THEN asm_rewrite_tac[]);
val ⦏add_eq_≤_thm⦎ = tac_proof(([], ⌜∀m n i j⦁m = n ∧ i ≤ j ⇒ m + i ≤ n + j⌝),
	REPEAT strip_tac THEN asm_rewrite_tac[]);
val ⦏add_≤_≤_thm⦎ = tac_proof(
	([], ⌜∀m n i j⦁m ≤ n ∧ i ≤ j ⇒ m + i ≤ n + j⌝),
	rewrite_tac[less_def, ≤_def] THEN REPEAT strip_tac
	THEN ∃_tac⌜i'+i''⌝ THEN DROP_ASMS_T (rewrite_tac o map eq_sym_rule)
	THEN rewrite_tac[plus_assoc_thm, ∀_elim⌜i:ℕ⌝plus_order_thm]);
val ⦏add_eq_≥_thm⦎ = tac_proof(([], ⌜∀m n i j⦁m = n ∧ i ≥ j ⇒ m + i ≥ n + j⌝),
	REPEAT strip_tac THEN asm_rewrite_tac[]);
val ⦏add_≥_≥_thm⦎ = tac_proof(
	([], ⌜∀m n i j⦁m ≥ n ∧ i ≥ j ⇒ m + i ≥ n + j⌝),
	rewrite_tac[≥_def] THEN REPEAT strip_tac
	THEN bc_tac[add_≤_≤_thm] THEN REPEAT strip_tac);
=TEX
=SML
val ⦏pos_scale_eq_thm⦎  = tac_proof(
	([], ⌜∀i m n⦁m = n ⇒ i * m = i * n⌝),
	REPEAT strip_tac THEN asm_rewrite_tac[]);
val ⦏neg_scale_eq_thm⦎  = tac_proof(
	([], ⌜∀i m n⦁m = n ⇒ i * n = i * m⌝),
	REPEAT strip_tac THEN asm_rewrite_tac[]);
val ⦏pos_scale_≤_thm⦎ = tac_proof(
	([], ⌜∀i m n⦁m ≤ n ⇒ i * m ≤ i * n⌝),
	rewrite_tac[≤_def] THEN REPEAT strip_tac
	THEN ∃_tac⌜i*i'⌝ THEN POP_ASM_T (rewrite_thm_tac o eq_sym_rule)
	THEN rewrite_tac[times_plus_distrib_thm]);
val ⦏neg_scale_≤_thm⦎ = tac_proof(
	([], ⌜∀i m n⦁m ≤ n ⇒ i * n ≥ i * m⌝),
	rewrite_tac[≥_def] THEN rewrite_tac[pos_scale_≤_thm]);
val ⦏pos_scale_≥_thm⦎ = tac_proof(
	([], ⌜∀i m n⦁m ≥ n ⇒ i * m ≥ i * n⌝),
	rewrite_tac[≥_def] THEN rewrite_tac[pos_scale_≤_thm]);
val ⦏neg_scale_≥_thm⦎ = tac_proof(
	([], ⌜∀i m n⦁m ≥ n ⇒ i * n ≤ i * m⌝),
	rewrite_tac[≥_def] THEN rewrite_tac[pos_scale_≤_thm]);
=TEX
=SML
val ⦏eq_cancel_thm1⦎ = tac_proof(
	([], ⌜∀c d m⦁c + m = d + m ⇔ c = d⌝),
	rewrite_tac[plus_clauses]);
val ⦏eq_cancel_thm2⦎ = tac_proof(
	([], ⌜∀c m⦁c + m = m ⇔ c = 0⌝),
	rewrite_tac[plus_clauses]);
val ⦏eq_cancel_thm3⦎ = tac_proof(
	([], ⌜∀d m⦁m = d + m ⇔ d = 0⌝),
	rewrite_tac[plus_clauses]);


val ⦏≤_cancel_thm1⦎ = tac_proof(
	([], ⌜∀c d m⦁c + m ≤ d + m ⇔ c ≤ d⌝),
	rewrite_tac[≤_clauses]);
val ⦏≤_cancel_thm2⦎ = tac_proof(
	([], ⌜∀c d m⦁c + m ≤ m ⇔ c ≤ 0⌝),
	rewrite_tac[≤_clauses]);
val ⦏≥_cancel_thm1⦎ = tac_proof(
	([], ⌜∀c d m⦁c + m ≥ d + m ⇔ c ≥ d⌝),
	rewrite_tac[≥_def, ≤_clauses]);
val ⦏≥_cancel_thm2⦎ = tac_proof(
	([], ⌜∀c d m⦁m ≥ d + m ⇔ 0 ≥ d⌝),
	rewrite_tac[≥_def, ≤_clauses]);
=TEX
=SML
val ⦏non_neg_thm⦎ = tac_proof(([],⌜∀t⦁0 ≤ t⌝), REPEAT strip_tac);
val ⦏eq_cancel_conv_thm⦎ = tac_proof(
	([],⌜∀x a m x⦁ x + a = m ⇒ ∀b n⦁ x + b = n ⇒ (m = n ⇔ a = b)⌝),
	REPEAT (∀_tac ORELSE ⇒_tac)
	 THEN DROP_ASMS_T (MAP_EVERY (asm_tac o eq_sym_rule))
	THEN asm_rewrite_tac[]);
val ⦏≤_cancel_conv_thm⦎ = tac_proof(
	([],⌜∀x a m x⦁ x + a = m ⇒ ∀b n⦁x + b = n ⇒ (m ≤ n ⇔ a ≤ b)⌝),
	REPEAT (∀_tac ORELSE ⇒_tac)
	 THEN DROP_ASMS_T (MAP_EVERY (asm_tac o eq_sym_rule))
	THEN asm_rewrite_tac[]);
=TEX
=SML
val ⦏term_times_thm⦎ = (tac_proof(([], ⌜
	(t1 = t2 ⇒ t*t1 = t*t2)
∧	(t1 ≤ t2 ⇒ t*t1 ≤ t*t2)
∧	(t1 < t2 ⇒ t*t1 + t ≤ t*t2)
∧	(t1 ≥ t2 ⇒ t*t2 ≤ t*t1)
∧	(t1 > t2 ⇒ t*t2 + t ≤ t*t1)

∧	(¬t1 = t2 ⇒ t*t1 + t ≤ t*t2 ∨ t*t2 + t ≤ t*t1)
∧	(¬t1 ≤ t2 ⇒ t*t2 + t ≤ t*t1)
∧	(¬t1 < t2 ⇒ t*t2 ≤ t*t1)
∧	(¬t1 ≥ t2 ⇒ t*t1 + t ≤ t*t2)
∧	(¬t1 > t2 ⇒ t*t1 ≤ t*t2)
⌝),
	rewrite_tac[greater_def, ≥_def, less_def, ¬_≤_thm, ¬_eq_thm,
	prove_rule[times_plus_distrib_thm]⌜∀t t1⦁t*t1 + t = t*(t1 + 1)⌝,
	pos_scale_eq_thm, pos_scale_≤_thm]
	THEN REPEAT strip_tac
	THEN strip_asm_tac(list_∀_elim[⌜t:ℕ⌝, ⌜t2+1⌝, ⌜t1:ℕ⌝]pos_scale_≤_thm)
	THEN strip_asm_tac(list_∀_elim[⌜t:ℕ⌝, ⌜t1+1⌝, ⌜t2:ℕ⌝]pos_scale_≤_thm)));
=TEX
=SML
val ⦏make_≤_thm⦎ = (tac_proof(([], ⌜
	(t1 < t2 ⇔ t1 + 1 ≤ t2)
∧	(t1 ≥ t2 ⇔ t2 ≤ t1)
∧	(t1 > t2 ⇔ t2 + 1 ≤ t1)

∧	(¬t1 = t2 ⇔ t1 + 1 ≤ t2 ∨ t2 + 1 ≤ t1)
∧	(¬t1 ≤ t2 ⇔ t2 + 1 ≤ t1)
∧	(¬t1 < t2 ⇔ t2 ≤ t1)
∧	(¬t1 ≥ t2 ⇔ t1 + 1 ≤ t2)
∧	(¬t1 > t2 ⇔ t1 ≤ t2)
⌝),
	rewrite_tac[greater_def, ≥_def, less_def, ¬_≤_thm, ¬_eq_thm]));
=TEX
Now $scale\_rule$ which we implement using nets:
=SML
local
val ⦏term_times_net⦎ = (
	let	fun entry th = (fst(dest_⇒(concl th)), th);
	in	make_net (map entry (strip_∧_rule term_times_thm))
	end
);
val ⦏t⦎ = ⌜t:ℕ⌝;
in
fun ⦏scale_rule⦎ (tm : TERM) : THM -> THM = (
	if type_of tm =: ℕ
	then	(fn th =>
		let	val thm = (case net_lookup term_times_net (concl th) of
					[th] => th
				| 	_=> thm_fail"scale_rule" 82011 [th]
			);
		in	(simple_⇒_match_mp_rule (inst_term_rule [(tm, t)] thm) th)
			handle Fail _ => thm_fail"scale_rule" 82011 [th]
		end)
	else	term_fail "scale_rule" 82010 [tm]
);
end;
=TEX
Now $make\_≤\_rule$ and $make\_≤_conv$
which we also implement using nets:
=SML
local
val ⦏make_≤_net⦎ = (
	let	fun entry th = (fst(dest_⇔(concl th)), th);
	in	make_net (map entry (strip_∧_rule make_≤_thm))
	end
);
in
fun ⦏make_≤_rule⦎ (thm : THM) : THM = (
	let	val cnc = concl thm;
	in	if (is_eq cnc andalso type_of (fst(dest_eq cnc)) =: ℕ)
		orelse is_≤ cnc
		then thm
		else  (case net_lookup make_≤_net cnc of
				[th] => ((simple_⇔_match_mp_rule th thm)
		handle Fail _ => thm_fail"make_≤_rule" 82012 [thm])
			| 	_=> thm_fail"make_≤_rule" 82012 [thm]
		)
	end
);
val ⦏make_≤_conv⦎ : CONV = (fn tm =>
	case net_lookup make_≤_net tm of
			[th] => ((simple_eq_match_conv th tm)
	handle Fail _ => term_fail"make_≤_conv" 82012 [tm])
		| 	_=> term_fail"make_≤_conv" 82012 [tm]
);
end;
=TEX
Note that the following rule needs to cater for ≥, since that
is what we use to stand for a negated ≤.
=SML
fun ⦏sum2_rule_aux⦎ (th1 : THM) (th2: THM) : THM = (
	let	val rator1 = (fst o dest_const o fst o strip_app o concl) th1;
		val rator2 = (fst o dest_const o fst o strip_app o concl) th2;
		val (add_th, conj_th) = (
			case (rator1, rator2) of
				("=", "=") => (add_eq_eq_thm, ∧_intro th1 th2)
			|	("=", "≤") => (add_eq_≤_thm, ∧_intro th1 th2)
			|	("=", "≥") => (add_eq_≥_thm, ∧_intro th1 th2)
			|	("≤", "≤") => (add_≤_≤_thm, ∧_intro th1 th2)
			|	("≤", "=") => (add_eq_≤_thm, ∧_intro th2 th1)
			|	("≥", "≥") => (add_≥_≥_thm, ∧_intro th1 th2)
			|	("≥", "=") => (add_eq_≥_thm, ∧_intro th2 th1)
			|	_ => thm_fail "sum2_rule" 82113 [th1, th2]
		);
	in	⇒_match_mp_rule add_th conj_th
	end
	handle Fail _ => thm_fail "sum2_rule" 82113 [th1, th2]
(* ?0 and ?1 are not both of the form ⊢ a = b, ⊢ a < b, ⊢ a ≤ b ⊢ a > b or ⊢a ≥ b *)
);
=TEX
=SML
fun ⦏lit_scale_rule⦎ (a : INTEGER) (th : THM) : THM = (
	let	val th1 = make_≤_rule th;
		val scale_th = simple_∀_elim (mk_ℕ(iabs a)) (
			case
			(a @>= zero, (fst o dest_const o fst o strip_app o concl) th1)
			of	(true, "=") => pos_scale_eq_thm
			|	(true, "≤") => pos_scale_≤_thm
			|	(true, "≥") => pos_scale_≥_thm
			|	(false, "=") => neg_scale_eq_thm
			|	(false, "≤") => neg_scale_≤_thm
			|	(false, "≥") => neg_scale_≥_thm
			|	_ => thm_fail "lit_scale_rule" 82114 [th]
		);
	in	⇒_match_mp_rule scale_th th1
	end
);
=TEX
=SML
fun ⦏scale_and_sum2_rule⦎ (a1 : INTEGER) (th1 : THM) (th2: THM) : THM = (
	sum2_rule_aux (lit_scale_rule a1 th1) (make_≤_rule th2)
);
=TEX
=SML
fun ⦏scaled_sum_rule⦎ (aths : (INTEGER * THM) list) : THM = (
	conv_rule (RANDS_C (TRY_C anf_conv))
	(case aths of
		[] => fail "scaled_sum_rule" 82115 []
	|	[(a, th)] => lit_scale_rule a th
	|	(a, th) :: more => scale_and_sum2_rule a th(scaled_sum_rule more))
);
=TEX
=SML
fun ⦏la_rule⦎ (aths : (INTEGER * THM) list) : THM = (
	let	val th = scaled_sum_rule aths;
	in	conv_rule (
		FIRST_C (map eq_match_conv
		[eq_cancel_thm1, eq_cancel_thm2, eq_cancel_thm3,
		 ≤_cancel_thm1, ≤_cancel_thm2,
		 ≥_cancel_thm1, ≥_cancel_thm2])
		AND_OR_C
		FIRST_C [ℕ_eq_conv, ≤_conv, ≥_conv]
		) th
	end
);
=TEX
\section{THE LINEAR ARITHMETIC TACTICS}
=TEX
We use the following type to represent a scaled sum of linear arithmetic
atoms:
=SML
type ⦏SCALED_SUM⦎ = (INTEGER * TERM) list;
=TEX
=SML
fun ⦏strip_plus⦎ (tm : TERM) : TERM list = (
	((op :: o (Combinators.I ** strip_plus) o dest_plus) tm)
	handle Fail _ => [tm]
);
=TEX
Note that the following is intended to operate on a term which is either
in additive normal form, or otherwise has been deliberately written as
a scaled sum of things which are not in normal form to gain some special
effect. If the user generates an assumption which
contains summands of the form $1*x$ then these will
not be treated as equal to $x$ (the alternatives would either require a special
representation for this case or would lead to possible
circumstances in which the
contradiction produced by $la\_rule$ has assumptions which are different
from the assumptions in the original goal).
=SML
fun ⦏dest_summand⦎ (tm : TERM) : INTEGER * TERM = (
	let val nt = (((dest_ℕ ** Combinators.I) o dest_times) tm);
	in	if (fst nt) = one
		then (one, tm)
		else nt
	end	handle Fail _ => (one, tm)
);
=TEX
=SML
val ⦏dest_sum⦎ : TERM -> SCALED_SUM = map dest_summand o strip_plus;
=TEX
=SML
val mk_0 = ⌜0⌝;
fun ⦏mk_sum⦎ ([] : SCALED_SUM) = mk_0
|   mk_sum [(i, t)] = if i = one then t else mk_times(mk_ℕ i, t)
|   mk_sum ((i, t) :: more) =
	if i = one
	then mk_plus(t, mk_sum more)
	else mk_plus(mk_times(mk_ℕ i, t), mk_sum more);
=TEX
We use the following type to represent a constraint (with HOL terms rather
than variables as its atoms):
=SML
type ⦏TERM_CONSTRAINT⦎ = SCALED_SUM * TERM * SCALED_SUM;
=TEX
The next function extracts a term constraint from an equation
or a ≤.
=SML
fun ⦏dest_constraint⦎ (tm : TERM) : TERM_CONSTRAINT OPT = (
	let	val ((rel, l), r) =
			((dest_app ** Combinators.I) o dest_app)tm;
	in	case fst(dest_const rel) of
			"=" => (
				if type_of l =: ℕ
				then Value (dest_sum l, rel, dest_sum r)
				else Nil
		) |	"≤" => (Value (dest_sum l, rel, dest_sum r)
		) |	_ => Nil
	end	handle Fail _ => Nil
);
=TEX
Given a term constraint, the following function assigns variables numbers
for $lin\_arith\_contr$ to the atoms:
=SML
fun ⦏atom_map⦎
	(x : TERM_CONSTRAINT list)
	: (int * TERM) list = (
	let	fun aux1 acc [] = acc
		|   aux1 acc ((i, t) :: more) = (
			if	i = one andalso is_ℕ t
			then	aux1 acc more
			else	aux1 (acc term_grab t) more
		);
		fun aux2 acc [] = acc
		|   aux2 acc ((s1, _, s2) :: more) = (
			aux2 (aux1 (aux1 acc s1) s2) more
		);
		val tms = aux2 [] x
	in	combine (interval 1 (length tms)) tms
	end
);
=TEX
=SML
fun ⦏term_rassoc⦎
	((i, t) :: more : ('a * TERM) list)
	(tm : TERM) : 'a = (
	if t ~=$ tm then i else term_rassoc more tm
) | ⦏term_rassoc⦎ [] tm = (
	term_fail "term_rassoc" 82116 [tm]
);
=TEX
=SML
fun ⦏term_lassoc⦎
	((t, i) :: more : (TERM * 'a) list)
	(tm : TERM) : 'a = (
	if t ~=$ tm then i else term_lassoc more tm
) | ⦏term_lassoc⦎ [] tm = (
	term_fail "term_lassoc" 82116 [tm]
);
=TEX
Given the mapping of variable numbers to HOL terms and
a scaled sum, the following
function computes the corresponding polynomial and constant
right hand side of the constraint for $lin\_arith\_contr$
=SML
fun ⦏make_poly⦎ (inds : (int * TERM) list) (ss : SCALED_SUM) : POLY * INTEGER = (
	let	fun collect (acc as (p, c)) ((i, tm) :: more) = (
			(collect (p, c @+ i@*dest_ℕ tm) more)
			handle Fail _ => collect ((i, term_rassoc inds tm) :: p, c) more
		) | collect acc [] = acc;
		val (p, c) = collect ([], zero) ss;
	in	(normalise_poly p, c)
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
			|	"≤" => LessEq
			|	_ => error "make_constraint" 9090 []
(* Unexpected error *)
		);
		val (lp, lc) = make_poly inds l;
		val (rp, rc) = make_poly inds r;
	in	(mult_and_add_poly one lp (@~one) rp, rator,  rc @- lc, [(one, ind)])
	end
);
=TEX
Given a list of terms, the following function extracts all the information
needed by $lin\_arith\_contr$ and subsequently to process its output.
Note we generate variable names for each of the linear arithmetic atoms
to speed up proof of the theorem after a successful call of $lin\_arith\_contr$.
The flag parameter indicates whether or not we are to add in constraints asserting
that each atom is non-negative.
=SML
val ⦏le⦎ = ⌜$≤⌝;
fun ⦏make_problem⦎ (addlwbs : bool) (tml : TERM list) :
		((int * TERM) * TERM) list
	*	((	CONSTRAINT
		*	(int * TERM_CONSTRAINT)) list) = (
	let	fun aux1 [] = []
		|   aux1 (Nil :: more) = aux1 more
		|   aux1 (Value v :: more) = v :: aux1 more;
		val stsl = aux1(map dest_constraint tml);
		val inds = atom_map stsl;
		val extras = (
			if addlwbs
			then map (fn (i,tm) =>  ([], le, [(one,tm)])) inds
			else []
		);
		val stsl' = stsl @ extras;
		val istsl = combine (interval 1 (length stsl')) stsl';
		val ctl = map (make_constraint inds) istsl;
	in	(map(fn (i, t)=> ((i, mk_var("@_"^string_of_int i, ℕ)), t)) inds,
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
			if is_ℕ t
			then t
			else snd (term_rassoc ivtl t)
		);
		fun aux1 (i, t) = if i = one then name t else mk_times(mk_ℕ i, name t);
		fun aux2 [] = mk_ℕ zero
		|   aux2 [s] = aux1 s
		|   aux2 (s :: more) = mk_plus(aux1 s, aux2 more);
	in	aux2 ss
	end
);
=TEX
We are now concerned with
proving the theorem corresponding to one of the constraints passed
as input to $lin\_arith\_contr$.
We must detect theorems of the from $0 ≤ t$, which may have been
just be planted by $make\_problem$ and so must be proved rather
than just assumed, since there may be no assumption in the goal
to justify them.
=SML
fun ⦏make_var_thm⦎
	(ivtl : ((int * TERM) * TERM) list)
	(l : SCALED_SUM, rel : TERM, r : SCALED_SUM) : THM = (
	if is_nil l andalso rel =$ le
	then	simple_∀_elim (make_var_sum ivtl r) non_neg_thm
	else	asm_rule(mk_app(mk_app(rel, make_var_sum ivtl l),
			make_var_sum ivtl r))
);
=TEX
The following function uses the results of $lin\_arith\_contr$ and
the substitution implicit in the results of $make\_problem$ to prove
the actual theorem that the assumptions entail $F$.
=SML
fun ⦏make_actual_thm⦎
	(ivtl : ((int * TERM) * TERM) list)
	(p : ORIGIN)
	(ts : (int * TERM_CONSTRAINT) list)
	: THM = (
	let	fun aux (i, t) = (i, make_var_thm ivtl (lassoc3 ts t));
		val subs = map (fn ((_, v), t) => (t, v)) ivtl;
	in	asm_inst_term_rule subs (la_rule (map aux p))
	end
);
=TEX
=SML
local
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
		then	fail who 82112 []
		else 	fail who 82110 [diag]
	end
);
fun ⦏lin_arith_rule_aux⦎ (who : string) (addlwbs : bool) (tml : TERM list) : THM = (
	let	val (ivtl, ctetcl) = make_problem addlwbs tml;
		val cts = (map fst ctetcl)
		val p =	(lin_arith_contr cts)
			handle Fail _ => diagnose who tml ivtl cts;
	in	make_actual_thm ivtl p (map snd ctetcl)
	end
);
in
val ⦏lin_arith_rule⦎ = lin_arith_rule_aux "lin_arith_rule" false;
val ⦏lin_arith_rule1⦎ = lin_arith_rule_aux "lin_arith_rule1" true;
end;
=TEX
=SML
val ⦏lin_arith_tac⦎ : TACTIC = (fn gl =>
	(GET_ASMS_T (f_thm_tac o lin_arith_rule o map concl) gl)
	handle ex => reraise ex "lin_arith_tac"
);
=TEX
=SML
val ⦏lin_arith_tac1⦎ : TACTIC = (fn gl =>
	(GET_ASMS_T (f_thm_tac o lin_arith_rule1 o map concl) gl)
	handle ex => reraise ex "lin_arith_tac1"
);
=TEX
Now the tactic which is the automatic proof tactic
=SML
val ⦏lin_arith_prove_tac⦎ : THM list -> TACTIC = (fn thl => fn gl =>
	((	DROP_ASMS_T (MAP_EVERY strip_asm_tac)
	THEN	MAP_EVERY  strip_asm_tac thl
	THEN	contr_tac
	THEN	lin_arith_tac1) gl)
	handle	Fail msg => fail "lin_arith_prove_tac" 82200
			[(fn () =>get_message msg),
			 (fn () => string_of_term (snd gl))]
);
=TEX
and the associated conversion:
=SML
val ⦏lin_arith_prove_conv⦎ : THM list -> CONV = (fn thl => fn tm =>
	let	val th = tac_proof(([], tm), lin_arith_prove_tac thl);
	in	⇔_t_intro  th
	end	handle ex => reraise ex "lin_arith_prove_conv"
);
=TEX
\section{OTHER RULES}
We wish to define the cancellation conversions which take terms of
the formsw $a = b$ or $a ≤ b$, put $a$ and $b$ in additive normal
form and then cancel like terms.

Given $a$ and $b$ in additive normal form as scaled sums, the following computes
$x$, $a'$ and $b'$ such that $x + a' = x + b'$ and $a'$ and $b'$ have no
atoms in common and returns $x + a'$ and $x + b'$. It fails if $x$ would be
$0$.
(Note the error numbers used here do not actually matter, the error is
always caught.)

GOT HERE
=SML
fun ⦏cancel_part1⦎ (a : TERM) (b : TERM) : TERM * TERM= (
	let	fun aux1 (x, a', b') ((i:INTEGER,t)::more) bb = (
			let	val j = term_rassoc bb t;
				fun f l = l drop (fn (_, t') => t =$ t');
			in	if i = j
				then aux1 ((i, t)::x, a', b') more (f bb)
				else if i @> j
				then aux1 ((j, t)::x, (i@-j,t)::a', b') more (f bb)
				else aux1 ((i, t)::x, a', (j@-i,t)::b') more (f bb)
			end	handle Fail _ => (
				aux1 (x, (i, t)::a', b') more bb
			)
		) | aux1 (x, a', b') [] bb = ((rev x, rev a', rev b' @ bb));
		fun aux2 ([], a', b') = (
			fail "cancel_part1" 82120 []
		) | aux2 (x, a', b') = (
			(mk_plus(mk_sum x, mk_sum a'),
				mk_plus(mk_sum x, mk_sum b'))
		);
		val ssa = dest_sum a drop (fn (_, t) => t =$ mk_0);
		val ssb = dest_sum b drop (fn (_, t) => t =$ mk_0);
	in	aux2(
		case (ssa, ssb) of
			([], _) => fail "cancel_part1" 82120 []
		|	(_, []) => fail "cancel_part1" 82120 []
		|	((sm as (x, cat))::ssa', (y, cbt)::ssb') => (
			if x = one andalso y = one
			then	let	val ca = dest_ℕ cat;
					val cb = dest_ℕ cbt;
				in	if ca = cb
					then aux1 ([sm], [], []) ssa' ssb'
					else if ca @> cb
					then aux1 ([(one, mk_ℕ cb)],
						[(one,mk_ℕ (ca @- cb))], []) ssa' ssb'
					else aux1 ([(one, mk_ℕ ca)],
						[], [(one,mk_ℕ (cb @- ca))]) ssa' ssb'
				end	handle Fail _ =>
					aux1 ([], [], []) ssa ssb
			else	aux1 ([], [], []) ssa ssb
		))
	end
);
=TEX

=TEX
=SML
fun ⦏gen_cancel_conv⦎ (rel : TERM) (th : THM) : CONV = (fn tm =>
	let	val (rela1, b1) = dest_app tm;
		val (r1, a1) = dest_app rela1;
	in 	if rel =$ r1
		then
	let	val thm1 = Value (
			let	val thm = app_fun_rule r1(anf_conv a1);
			in	(mk_app_rule thm (anf_conv b1))
				handle Fail _ =>
				(app_arg_rule b1 thm)
			end	handle Fail _ =>
				(app_fun_rule rela1 (anf_conv b1))
		)	handle Fail _ => Nil;
		val tm1 =
			case thm1 of
				Value thm => snd(dest_app(concl thm))
			|	Nil => tm;
		val (rela2, b2) = dest_app tm1;
		val (r2, a2) = dest_app rela2;
	in	(let val (xa, xb) = cancel_part1 a2 b2;
			val thm2 = TRY_C anf_conv xa;
			val thm3 = TRY_C anf_conv xb;
			val thm4 = simple_⇒_match_mp_rule th thm2;
			val thm5 = (simple_⇒_match_mp_rule thm4 thm3);
		in	case thm1 of
				Value thm => (
				 Combinators.K thm THEN_C Combinators.K thm5				) |	Nil => Combinators.K thm5
		end	handle Fail _ => (
			case thm1 of
				Value thm => (Combinators.K thm
			) |	Nil => fail_conv
		)) tm
	end	else	fail_conv tm
	end
);
=TEX
=SML
val ⦏ℕ_eq_cancel_conv⦎ : CONV = (fn tm =>
	(gen_cancel_conv ⌜$=:ℕ→ℕ→BOOL⌝ eq_cancel_conv_thm tm)
	handle Fail _ => term_fail "ℕ_eq_cancel_conv" 82120 [tm]
);
=TEX
=SML
val ⦏≤_cancel_conv⦎ : CONV = (fn tm =>
	(gen_cancel_conv ⌜$≤:ℕ→ℕ→BOOL⌝ ≤_cancel_conv_thm tm)
	handle Fail _ => term_fail "≤_cancel_conv" 82121 [tm]
);
=TEX
\section{THE PROOF CONTEXTS}
The equational contexts required are the same for stripping goals and stripping
theorems. We take numeric $=$ and $≤$ as the atomic
predicates which we will deal with. The possibilities are:
{\em(i)} put the operands a ground atomic predicate in A.N.F. and cancel like terms;
{\em(ii)} convert a negated atomic predicate into an atomic one;
{\em(iii)} convert a predicate formed with $<$, $≥$ or $>$ into an atomic one;
{\em(iv)} convert the negation of a predicate formed with $<$, $≥$ or $>$ into an atomic one;
and
{\em(v)} attempt to evaluate ground inequalities.
=SML
val strip_cxt = [

	(⌜x = y⌝, ℕ_eq_conv),
	(⌜x ≤ y⌝, ≤_conv),

	(⌜¬x = y⌝, make_≤_conv THEN_C RANDS_C (TRY_C ≤_cancel_conv)),
	(⌜¬x ≤ y⌝, make_≤_conv THEN_TRY_C ≤_cancel_conv),

	(⌜x < y⌝, make_≤_conv THEN_TRY_C ≤_cancel_conv),
	(⌜x ≥ y⌝, make_≤_conv THEN_TRY_C ≤_cancel_conv),
	(⌜x > y⌝, make_≤_conv THEN_TRY_C ≤_cancel_conv),

	(⌜¬x < y⌝, make_≤_conv THEN_TRY_C ≤_cancel_conv),
	(⌜¬x ≥ y⌝, make_≤_conv THEN_TRY_C ≤_cancel_conv),
	(⌜¬x > y⌝, make_≤_conv THEN_TRY_C ≤_cancel_conv),

	(⌜x = y⌝, ℕ_eq_cancel_conv),
	(⌜x ≤ y⌝, ≤_cancel_conv)];
=TEX
=SML
val _ = new_pc ⦏"'lin_arith"⦎;
val _ = set_rw_eqn_cxt strip_cxt "'lin_arith";
val _ = set_st_eqn_cxt strip_cxt "'lin_arith";
val _ = set_sc_eqn_cxt strip_cxt "'lin_arith";
val _ = set_pr_tac lin_arith_prove_tac "'lin_arith";
val _ = set_pr_conv lin_arith_prove_conv "'lin_arith";
val _ = commit_pc "'lin_arith";
=TEX
=SML
val _ = new_pc ⦏"lin_arith"⦎;
val _ = merge_pcs ["predicates","'lin_arith"] "lin_arith";
val _ = commit_pc "lin_arith";
=TEX
\section{OTHER TACTICS}
=SML
fun ⦏scale_asm_tac⦎ (t : TERM) (asm : TERM) : TACTIC = (fn gl =>
	(DROP_ASM_T asm (fn th => strip_asm_tac (scale_rule t th)) gl)
	handle ex => reraise ex "scale_asm_tac"
);
=TEX
=SML
fun ⦏scale_nth_asm_tac⦎ (t : TERM) (n : int) : TACTIC = (fn gl =>
	(DROP_NTH_ASM_T n (fn th => strip_asm_tac (scale_rule t th)) gl)
	handle ex => reraise ex "scale_nth_asm_tac"
);
=TEX
=SML
fun ⦏list_scale_nth_asm_tac⦎ (tns : (TERM * int) list) : TACTIC = (fn gl =>
	let	val (ts, ns) = split tns;
	in	LIST_DROP_NTH_ASM_T ns (EVERY o zip (map (fn t => strip_asm_tac o scale_rule t) ts)) gl
	end handle ex => reraise ex "list_scale_nth_asm_tac"
);
=TEX
\section{EPILOGUE}
=SML
val _ = open_theory old_theory;
val _ = pop_pc();
end (* of structure LinearArithmetic *);
open LinearArithmetic;
=TEX
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}


=IGN
fun qp_rule (tm : TERM) = (
	⇔_t_elim
	((RANDS_C anf_conv THEN_C PC_C1 "hol1" rewrite_conv []) tm)
);
val qp_rule = prove_rule[];

val eq_th1 = qp_rule⌜x + 2*y = y + x + y⌝;
val eq_th2 = qp_rule⌜2*x + 2*y = y + x + y + x⌝;
val ≤_th1 = qp_rule⌜x + y ≤ z + y + x⌝;
val ≤_th2 = qp_rule⌜w ≤ 1 + w⌝;
val ≥_th1 = qp_rule⌜x + 2*y ≥ x⌝;
val ≥_th2 = qp_rule⌜x + 2*y ≥ 2*y⌝;
val less_th1 = qp_rule⌜x + y < 1 + y + x⌝;
val less_th2 = qp_rule⌜w < 1 + w⌝;
val greater_th1 = qp_rule⌜x + 2 > x⌝;
val greater_th2 = qp_rule⌜44 + x + y ≥ 10 + y + x⌝;


sum2_rule_aux eq_th1 eq_th2;
sum2_rule_aux eq_th1 ≤_th1;
sum2_rule_aux eq_th1 ≥_th1;
sum2_rule_aux ≤_th1 ≤_th2;
sum2_rule_aux ≤_th1 eq_th1;
sum2_rule_aux ≥_th1 ≥_th2;
sum2_rule_aux ≥_th1 eq_th1;


lit_scale_rule 9 eq_th1;
lit_scale_rule ~42 eq_th1;
lit_scale_rule 11 ≤_th1;
lit_scale_rule ~1 ≤_th1;
lit_scale_rule 1001 ≥_th1;
lit_scale_rule ~666 ≥_th1;

make_≤_rule eq_th1;
make_≤_rule ≤_th1;
make_≤_rule ≥_th1;
make_≤_rule less_th1;
make_≤_rule greater_th1;



scaled_sum_rule [
	(1, eq_th1),
	(~2, eq_th2),
	(3, ≤_th1),
	(~4, ≥_th1),
	(5, less_th1),
	(~6, greater_th1)
];



val th1_1 = asm_rule⌜x0 ≤ x1⌝;
val th1_2 = asm_rule⌜x1 ≤ x0⌝;
val th1_3 = asm_rule⌜x1 + 2 ≤ x0 + 1⌝;


la_rule[(1, th1_1), (1, th1_3)];


val th2_1 = asm_rule ⌜x1 + x2 = 1⌝;
val th2_2 = asm_rule ⌜x1 = 1 + x2⌝;
val th2_3 = asm_rule ⌜x2 < x3 ⌝;
val th2_4 = asm_rule ⌜x3 = 0⌝;

val aths = [(~1, th2_1), (1, th2_2), (2, th2_3), (2, th2_4)];


scaled_sum_rule aths;


la_rule aths;


set_goal([], ⌜¬∃x1 x2 x3⦁ x1 + x2 = 1 ∧ x1 = 1 + x2 ∧ x2 < x3 ∧ x3 = 0⌝);

a(contr_tac THEN DROP_ASMS_T (MAP_EVERY (strip_asm_tac o make_≤_rule)));

a lin_arith_tac;

pop_thm();
set_flag("subgoal_package_quiet", false);

set_goal([], ⌜¬∃x1 x2 x3⦁x1 + x2 + x3 ≤ x2 ∧ x1 > 0⌝);
a(contr_tac);
a(PC_T1"lin_arith"asm_prove_tac[]);

a(contr_tac);
 THEN DROP_ASMS_T (MAP_EVERY (strip_asm_tac o make_≤_rule)));

a lin_arith_tac;

pop_thm();


set_goal([], ⌜x1 + x2 + x3 ≤ x2 ⇒ x1 = 0⌝);

a(PC_T1"lin_arith"prove_tac[]);

pop_thm();

set_goal([], ⌜x1 + x2 + x3 ≤ x4 ⇒ x1 = 0⌝);

a(PC_T1"lin_arith"prove_tac[]);
a(TRY_T (PC_T1"lin_arith"prove_tac[]) );

pop_thm();

qp_rule ⌜¬∃x1 x2 x3⦁ x1 + x2 = 1 ∧ x1 = 1 + x2 ∧ x2 < x3 ∧ x3 = 0⌝;
qp_rule ⌜¬∃x1 x2 x3⦁x1 + x2 + x3 ≤ x2 ∧ x1 > 0⌝;

fail "foo" 19001 [
	fn _ => (
		diag_line "";
		diag_line "Test Diagnostic Print out";
		diag_line  "";
		"aardvark")
];

merge_pcs_rule1 ["sets_ext", "lin_arith"] prove_rule [] ⌜{x | x < 0} = {}⌝;

merge_pcs_rule1 ["hol1", "lin_arith"] prove_rule []
	⌜{(x, y) | x = y + x ∧ x + y = y } = {(0,0)}⌝;

set_goal([], ⌜X1 +X2 = X3 +X4 ∧ X3 +X5 = X6 + X2 ⇒ X1 +X5 = X4 + X6⌝);


set_goal([], ⌜x1 * x2 = 0 ∧ x1 = x2 ⇒ x1 = 0⌝);

a(PC_T1"lin_arith"REPEAT strip_tac);

a(asm_rewrite_tac[]);

set_goal([], ⌜x1 + 0 = x1⌝);

a(PC_T"lin_arith" strip_tac);

set_goal([], ⌜x1 + 0 ≥ x1⌝);
set_goal([], ⌜x1 ≤ x1 + x2 ⇒ x1 + 0 ≥ x1⌝);
a(PC_T"lin_arith" step_strip_tac);
set_goal([], ⌜x1 < x1 ⇒ X⌝);
a(PC_T"lin_arith" step_strip_tac);

set_goal([], ⌜∀x y⦁¬(2*x + y = 4 ∧ 4*x + 2*y = 7)⌝);



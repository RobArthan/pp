=IGN
********************************************************************************
imp081.doc: this file is part of the PPHol system

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

\def\Title{Implementation of Algebraic Normalisation Conversions}

\def\AbstractText{This document defines various normalisation procedures and associated utilities (such as an ordering function for HOL terms).}

\def\Reference{DS/FMU/IED/IMP081}

\def\Author{R.D. Arthan, K. Blackburn}


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
%% LaTeX2e port: \TPPtitle{Implementation of Algebraic Normalisation Conversions}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP081}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{1.10
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{2002/10/17 16:20:01%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: %\TPPauthor{R.D.~Arthan & WIN01}  %% Mandatory field
%% LaTeX2e port: \TPPauthors{R.D.~Arthan & WIN01\\K.~Blackburn & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.B.~Jones & FMU Manager}
%% LaTeX2e port: \TPPabstract{This document defines
%% LaTeX2e port: various normalisation procedures and
%% LaTeX2e port: associated utilities (such as an ordering function
%% LaTeX2e port: for HOL terms).}
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
\item[1.1 (\FormatDate{92/09/11
})])] First draft.
\item[1.2 (\FormatDate{92/09/21%
})])] Fixed bug in $anf\_conv$ (it used to prove $1 + 1 = 2*1$, not $1 + 1 = 2$).
\item[1.3 (\FormatDate{%92/09/24%%
})])] Improved efficiency of $anf\_conv$.
\item[1.4 (\FormatDate{%92/09/24%%
})])] Further work on efficiency of $anf\_conv$.
\item[1.5 (\FormatDate{%92/10/06%%
})])] Normalisations now fail when nothing to do.
\item[1.6 (\FormatDate{92/10/09
})])] Various bug fixes.
\item[1.7 (1992/10/09)] Corrected over-accomodating handlers.
\item[1.8 (1999/03/06)] Allowed for new INTEGER type.
\item[Issue 1.9 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.10 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.11 (2007/08/15)] Added {\em gen\_term\_order1}.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes forecast}
None.
\section{GENERAL}
\subsection{Scope}
This document implements the facilities defined in the detailed
design document \cite{DS/FMU/IED/DTD081}.
\subsection{Introduction}
\subsubsection{Purpose and Background}
See \cite{DS/FMU/IED/DTD081}.
\subsubsection{Algorithms}
These are described in the body of the document.
Some of the normalisation procedures involve sorting
which is done by two-way merge sorting
(see \cite{Knuth73}). Background information on
conjunctive and disjunctive normal forms may be found
in e.g. \cite{Manna74}.
\subsubsection{Dependendencies}
\subsubsection{Known Deficiencies}
\subsubsection{Possible Enhancements}
\subsubsection{Possible Enhancements}
\subsubsection{Deficiencies}
\subsection{Preamble}
=TEX
\section{PREAMBLE}
=SML
structure ⦏Normalisation⦎ : Normalisation = struct
val old_thy = get_current_theory_name();
val _ = open_theory"basic_hol";
val _ = push_pc"basic_hol";
=TEX
Some odds and ends are needed:
=SML
fun ⦏lhs_thm⦎ (thm: THM): TERM = (fst(dest_eq(snd(strip_∀(concl thm)))));

fun ⦏rhs_thm⦎ (thm: THM): TERM = (snd(dest_eq(snd(strip_∀(concl thm)))));
=TEX
We sometimes wish to string conversion-like effects together in situations where we cannot use $THEN_C$.
The following function takes a theorem of the form $⊢ a = b$, and a conversion, which, if given $b$, returns $⊢ b = c$.
In this case the function returns $⊢ a = c$.
If the conversion fails then $⊢ a = b$ is returned (thus the function
should only be called in cases where it is known that failure of the
conversion should not lead to overall failure).
=SML
fun  ⦏conv_rhs_rule⦎ (thm : THM) (conv : CONV) : THM = (
	(eq_trans_rule thm (conv (rhs_thm thm)))
	handle Fail _ => thm
);
=TEX
To get around problems with proof contexts changing the rewriting canonicalisation
we use the following simple function to make rewriting with a single theorem
easier:
=SML
fun ⦏simple_rewrite⦎ (thm : THM) : CONV = (fn tm =>
	(ONCE_MAP_C (simple_eq_match_conv(all_∀_intro thm))) tm
);
=TEX
\section{ORDERING TYPES AND TERMS}
=TEX
The conjunctive (or disjunctive) normal form for a term
of the propositional calculus is unique up to the order
of appearance of certain subterms.
We will use orderings for object language
types and terms to select a representative normal form.
Different problems will place different requirements
on the ordering used. Consequently, we give a function
for ordering terms which has a hook for a user supplied
function to tailor the ordering to the requirements.
Provided this function satisfies some constraints
discussed below, the resulting ordering
is a well-ordering
(i.e. it is transitive, any two terms are
related by it, and any set of terms contains a least
element with respect to it)

We specify the ordering with the technique used
for the sorting utilities of \cite{DS/FMU/IED/SML007}.
I.e. to give an order on objects of type $'a$ we give
a function, $f$, of type $'a→'a→int$.
$f\,x\,y$ is intended to be negative, zero or positive
according as x and y are in order as written, equal,
or out of order respectively. (The motivating example
of such an $f$ is arithmetic subtraction).

=TEX
We can now define an order on types:
=SML
fun ⦏type_order⦎ (ty1 : TYPE) (ty2 : TYPE) : int = (
	case (dest_simple_type ty1, dest_simple_type ty2) of
		(Vartype s1, Vartype s2) =>
			Sort.string_order s1 s2
	|	(Vartype _, _) => ~1
	|	(_, Vartype _) => 1
	|	(Ctype c1ps, Ctype c2ps) =>
			pair_order
			Sort.string_order
			(Sort.lexicographic type_order)
			c1ps c2ps

);
=TEX
For efficiency we will use the top-level structure
of the terms to settle the ordering whenever possible.
To assist in doing
this we use the following function to compute a key
based on the top-level structure.
=SML
fun ⦏term_class⦎ (tm : TERM) : int = (
	case dest_simple_term tm of
		App _ => 4
	|	Const _ => 1
	|	Var _ => 2
	|	_ => 3
);
=TEX
We can now define a general ordering on terms, which
is parametrised by a function of type
$TERM → (TERM*int)$. This parameter may be used to effect
various special purpose orderings. E.g. in working
with integer arithmetic one might use it to arrange
the order so that the terms $0,\,1,\,2,\,\ldots$
were consecutive, so as to facilitate simplification
of terms such as $1 + x -1 + 2 + y + 3$.

The idea is that whenever two terms, $tm1$ and $tm2$ say,
are compared, $special$ is applied to them to produce
two pairs, $(tm1,\,k1)$ and ($(tm2,\,k2)$ say. These
pairs are then compared lexicographically (using the
ordering recursively for the first components).
In the example mentioned above one would
supply for $special$ a function which sends a decimal
numeric term, $⌜k⌝$, to $(⌜0⌝,\,k)$ and any other
term, $tm$, to $(tm,\,0)$.

(It is not very easy to describe necessary and sufficient
conditions on $special$ for $GEN\_TERM\_order$ to terminate and give a well-ordering. A sufficient condition
is to work with functions
$special$ with the property that for some
disjoint sets of terms $X_1$, $X_2$, \ldots, we have that
$special\,tm=(tm,\,0)$ if $tm \not\in X_i$ for any $i$
and that $special\,tm=(x_i,\,f_i tm)$ if $tm \in X_i$,
where $x_i$ is a fixed element of $X_i$ and $f_i$
is a fixed injection of $X_i$ into the natural numbers.)
=SML
fun ⦏gen_term_order⦎ (special : TERM -> (TERM * INTEGER))
	(tm1 : TERM) (tm2 : TERM) : int = (
	let	fun aux t1 t2 = (
		let	val cl1 = term_class t1;
			val cl2 = term_class t2;
			val order = gen_term_order special
		in	case cl1 - cl2 of
				0 =>	(case cl1 of
		4 => pair_order order order (dest_app t1)(dest_app t2)
	|	3 => pair_order order order (dest_simple_λ t1)(dest_simple_λ t2)
	|	2 => pair_order Sort.string_order type_order (dest_var t1) (dest_var t2)
	|	1 => pair_order Sort.string_order type_order (dest_const t1) (dest_const t2)
	|	_ => error "gen_term_order" 81029 []
			) |	not_zero => not_zero
		end);
		fun compare a b = (
			if	a = b
			then	0
			else if		a @< b
			then	~1
			else	1
		);
	in	pair_order
		aux compare
		(special tm1) (special tm2)
	end
);
=TEX
The following generalisation of the above allows it to be used, for example, to order
rational real literals in numeric order (and many other purposes).
=SML
fun ⦏gen_term_order1⦎ (po as (f : TERM -> (TERM * 'a), oa : 'a -> 'a -> int))
	(tm1 : TERM) (tm2 : TERM) : int = (
	let	val recur = gen_term_order1 po;
		fun aux t1 t2 = (
		let	val cl1 = term_class t1;
			val cl2 = term_class t2;
		in	case cl1 - cl2 of
				0 =>	(case cl1 of
		4 => pair_order recur recur (dest_app t1)(dest_app t2)
	|	3 => pair_order recur recur (dest_simple_λ t1)(dest_simple_λ t2)
	|	2 => pair_order Sort.string_order type_order (dest_var t1) (dest_var t2)
	|	1 => pair_order Sort.string_order type_order (dest_const t1) (dest_const t2)
	|	_ => error "gen_term_order1" 81029 []
			) |	not_zero => not_zero
		end);
	in	pair_order aux oa (f tm1) (f tm2)
	end
);
=TEX
The following term comes first in the orderings generated by
$gen\_term\_order$ providing $special$ does nothing to it:
=SML
val ⦏bottom⦎ : TERM = mk_const("", mk_vartype "");
=TEX
In this document we are often interested in
working with numbers boolean operators, so the order we will
usually use is given by $TERM\_order$ below.
Its most important features are that the
immediate successor of any boolean term in the ordering is
its negation and that the numeric literals are in numeric rather than
alphabetic order.  This makes it easier to eliminate operations
on literals terms during normalisation.
The ordering also arranges for terms of the form $a*c$ and $b*c$ where
$a$ and $b$ are numeric literals to be grouped together, this just looks
nicer in $anf\_conv$.

The following function is used to give the special
treatment of negations:
=SML
local
val ⦏mk_0⦎ = ⌜0⌝;
fun ⦏pervert⦎ (tm : TERM) : TERM * INTEGER = (
	let val (a, b) = dest_times tm
	in (b, dest_ℕ a @+ one)
	end handle Fail _ =>
	if is_¬ tm
	then	let	val (i, tm) = (dest_multi_¬ tm);
		in	(tm, integer_of_int i)
		end
	else if is_ℕ tm
	then (bottom, dest_ℕ tm)
	else (tm, zero)
);
in
val ⦏term_order⦎ : TERM -> TERM -> int = gen_term_order pervert;
end;
=TEX
=SML
fun ⦏make_term_order⦎
	(fs : (TERM ORDER -> TERM ORDER) list)
	: TERM ORDER = (fn tm1 => fn tm2 =>
	let	val recur = make_term_order fs;
		fun base t1 t2 = (
		let	val cl1 = term_class t1;
			val cl2 = term_class t2;
		in	case cl1 - cl2 of
				0 =>	(case cl1 of
		4 => pair_order recur recur (dest_app t1)(dest_app t2)
	|	3 => pair_order recur recur (dest_simple_λ t1) (dest_simple_λ t2)
	|	2 => pair_order ascii_order type_order (dest_var t1) (dest_var t2)
	|	1 => pair_order ascii_order type_order (dest_const t1) (dest_const t2)
	|	_ => error "make_term_order" 81029 []
			) |	not_zero => not_zero
		end);
		fun aux [] = base
		|   aux (f::more)  = f(aux more);
	in	aux fs tm1 tm2
	end
);
=TEX
\section{ASYMMETRIC REWRITING}
For experimentation with normalisation procedures, it
is often possible to produce a simple, although slow,
implementation by rewriting with appropriate
theorems. However, one often wishes to work with properties
such as commutativity which are expressed by equations
which give non-terminating rewrite rules. Termination
can be assured by using an asymmetric technique which
only changes subterms which are made smaller with
respect to some well-ordering by the rewriting.

The following function implements the above ideas:
=SML
fun ⦏GEN_ASYM_C⦎ (order : TERM -> TERM -> int) (conv : CONV) : CONV = (fn tm =>
	let	val thm = conv tm;
		val (lhs, rhs) = dest_eq(concl thm)
		handle Fail _ => term_fail "GEN_ASYM_C" 81011 [tm, concl thm];
(* the conversion did not return an equation (given ?0 it returned a theorem with conclusion ?1) *)
	in	if order lhs rhs > 0
		then thm
		else fail "GEN_ASYM_C" 81010 []
	(* the conversion did not decrease the order of the term,*)
	end
);
=TEX
The following applications of $GEN\_ASYM\_C$ are
likely to be of use (but the analogues of $gen\_rewrite\ldots$ are not available yet):
=SML
val ⦏ASYM_C⦎ : CONV -> CONV = GEN_ASYM_C term_order;
=TEX
\section{MONOMIAL NORMALISATION}
In this section we take as given an associative and
commutative (infix) operator, $op$. We will define
a conversion, $sort\_CONV$, which will prove theorems
of the form:
=GFT Examples
	⊢ C op (B op A) = A op (B op C)
	⊢ (D op C) op (A op B) = A op (B op (C op D))
=TEX
and so on. A more precise description is most easily
given together with the following sketch of the
algorithm used.
\subsection{Algorithm}
We assume given selector and destructor
functions for the operator $op$ and theorems which
assert that $op$ is associative and commutative.
(In fact the selector and destructor functions may be
computed from the form of these theorems.)
We are given a term,
$tm$ say, and we wish to return a theorem of the
form
=GFT Example
	⊢ tm = A1 op A2 op ... op Ak
=TEX
where the $A_i$ are what we shall call {\em literals},
by which we mean that the selector function returns
$false$ when applied to them (in typical applications this
will mean that the $A_i$ are not of the form $x\,op\,y$).
We also assume given an ordering on terms (such as the one
given in the previous section) and the $A_i$ above
will be in ascending order.

The simplest way of computing the theorem is by a
bubble sort (or more accurately an insertion sort).
This may be done simply by repeatedly rewriting
(using the asymmetric rewriting technique) with
the following theorems;
=GFT Example Theorems
	⊢ (A op B) op C = A op (B op C)
	⊢ Y op X = X op Y
	⊢ Y op (X op Z) = X op (Y op Z)
=TEX
This approach would be rather inefficient.
Moreover its run-time is heavily data-dependent.
Some simple tests gave the following comparisons
with the merge sort technique we actually use.
Here we show the best and worse case figures
(in CPU seconds on a Sun 3/160)
tried for the two algorithms.

\begin{tabular}{|l|l|l|}\hline
Number of Literals & Bubble Sort Time & Merge Sort time \\ \hline
6 & 4.9 -- 9.7 & 2 -- 2.4 \\ \hline
12 & 12.3 -- 29.2 & 4.9 -- 5.3 \\ \hline
24 & 36 -- 143 & 16.9 -- 17.9 \\ \hline
\end{tabular}

In the merge sort technique we recursively sort the immediate
subterms of $tm$ to derive a theorem of the form
=GFT Example Theorem
	⊢ tm = (A1 op A2 op ... Am) op (B1 op B2 op ... Bn)
=TEX
We then merge the $A_i$ and the $B_j$ to give the
desired theorem. The merge takes between $m$ and $n$ steps
and each step is performed using one of
the following theorems:
=GFT Example Theorems
(i)	⊢ A op B  = B op A
(ii)	⊢ A op (B op Y) = B op (A op Y)
(iii)	⊢ (A op X) op (B op Y) = A op (X op (B op Y))
=TEX
These are used according to the following table, in
which $(*)$ indicates that the term is already in
the desired form and no theorem is needed and where the
symbol \dag\ indicates a case in which after the theorem
has been applied the table should be used again to find another
theorem to apply immediately.

\begin{tabular}{|l|l|l|l|} \hline
$m$ & $n$ & Condition & Theorem \\ \hline
$1$ & $1$ & $A_1 > B_1$ & (i) \\ \hline
$1$ & $1$ & $A_1 \leq B_1$ & (*)\\ \hline
$>1$ & $1$ & $true$ & (i) \dag\\ \hline
$1$ & $>1$ & $A_1 > B_1$ & (ii) \\ \hline
$1$ & $>1$ & $A_1 \leq B_1$ & (*) \\ \hline
$>1$ & $>1$ & $A_1 > B_1$ & (i)\dag \\ \hline
$>1$ & $>1$ & $A_1 \leq B_1$ & (iii) \\ \hline
\end{tabular}

It is not hard to see that the result of the above
is a theorem of the form
=GFT Example Theorem
	⊢ tm = X op (Y op Z)
or	⊢ tm = X op Y
=TEX
Here $X$ is the smaller of $A_1$ and $B_1$ and
in the second case $Y$ is the larger of $A_1$ and $B_1$.
In the first case we may recursively apply the merge
operation to $Y\,op\,Z$. Note that this is simply
applying the procedure to the operand of the
combination $X\,op\,(Y\,op\,Z)$
In the second case the merge is complete,

Our monomial sorting conversion is relatively easy
to implement in terms of the merge operation. If the
term we wish to sort is a literal, we are done. If not
we decompose it as $A\,op\,B$, recursively normalise
$A$ and $B$, then merge the results.

An additional feature we will implement is application
of arbitrary conversions supplied as parameters, one at
the end of each merge phase, and one in the ``base case''
where we have ``sorted'' a literal. This will typically
be done to make use of any special equations we have
for the operator $op$, e.g. equations expressing
the properties of an identity or an inverse operation.
In the latter case one would use an ordering for
terms which ensured that any term was the immediate
predecessor of its negation (or vice versa).

Finally, we wish to make the conversion fail if the input is already
sorted and if the conversions supplied as parameters failed every time
they were applied. Thus, the cases marked with $(*)$ must result in
failure and we must use $AND\_OR\_C$ to compose the recursive calls
of merging with the conversions supplied as parameters.
In addition, when make the two recursive calls before each merge phase
if one of the calls fails but not both we must treat the failing call
if $id\_conv$ had been used instead; and if both calls fail then we
must just apply the merge operation to the original input.


\subsection{The Merge Conversion}
For reasons of efficiency the merge conversion
expects the three theorems to have been precomputed.
We give a function that takes two conversions as arguments, to be used in later function declarations.
The first conversion is to be applied once to each normalised sub-term  constructed using the operator, in a depth first manner,
the second is to be applied to any literal, and then we test whether the sorting conversion can be applied, in case we have converted the literal into something processable.

These conversions are applied during the course of the merging, not as a separate phase of the conversion.
=SML
fun ⦏merge_conv⦎
	(sel : TERM -> bool)
	(dest : TERM -> (TERM * TERM))
	(order : TERM -> TERM -> int)
	(conv_i : CONV)
	(conv_ii : CONV)
	(conv_iii : CONV)
	(op_extra_conv: CONV)
	(base_extra_conv: CONV): CONV = (fn tm =>
let	fun case_1_1 As Bs = (
		if order As Bs > 0
		then (conv_i, false)
		else (fail_conv, false)
	);
	fun case_m_1 _ _ = (conv_i, true);
	fun case_1_n As Bs = (
		let	val (B1, _) = dest Bs
		in	if order As B1 > 0
			then (conv_ii, false)
			else  (fail_conv, false)
		end
	);
	fun case_m_n As Bs = (
		let	val (A1, _) = dest As
			val (B1, _) = dest Bs
		in	if order A1 B1 > 0
			then (conv_i, true)
			else (conv_iii, false)
		end
	);
	fun convert_op_conv tm =
	let	val (As, Bs) = dest tm;
			val (conv, again) = (
		case (sel As, sel Bs) of
			(false, false) => (case_1_1 As Bs)
		|	(true, false) => (case_m_1 As Bs)
		|	(false, true) => (case_1_n As Bs)
		|	(true, true) => (case_m_n As Bs));
	in	(conv AND_OR_C (if again then Combinators.I else RAND_C)
			(merge_conv sel dest order conv_i conv_ii conv_iii
			op_extra_conv base_extra_conv)) tm
	end;
in
	if not(sel tm)
	then (let val thm1 = base_extra_conv tm
		in
		if sel (rhs_thm thm1)
		then conv_rhs_rule thm1 (convert_op_conv AND_OR_C op_extra_conv)
		else thm1
		end handle Fail _ => fail_conv tm)
	else (convert_op_conv AND_OR_C op_extra_conv) tm
end
);
=TEX
\subsection{The Sort Conversion}
It is now fairly straightforward to code our sorting
normalisation function --- most of the work is just
parameter validation and tailoring.

We code some utilities first:
=SML
fun ⦏selector⦎ (rator : TERM) (tm : TERM) : bool = (
	is_app tm andalso
	(let	val Aop = fst(dest_app tm);
	in	is_app Aop andalso
		rator ~=$ (fst(dest_app Aop))
	end)
);
=TEX
=SML
fun ⦏destructor⦎ (rator : TERM) (tm : TERM) : TERM * TERM = (
	let	val ((rator', a), b) = (dest_app ** Combinators.I) (dest_app tm);
	in	if rator ~=$ rator'
		then (a, b)
		else fail "sort_conv" 81021 []
(* "destructor function applied invalidly (internal error?)" *)
	end	handle msg => divert msg "dest_app"
		"sort_conv" 81021 []
);
=TEX
We now give functions to compute the theorems
required by $merge\_CONV$ from associativity and
commutativity theorems. Called in order, as they
are in $sort\_CONV$ these theorems will also check
that the theorems have an appropriate form.
=SML
val ⦏op_var⦎ = ⌜op:'a→'a→'a⌝;
fun ⦏check_thm⦎ (rator : TERM) (template : TERM) (thm : THM)  : THM = (
	let	val (tym, tmm) = term_match(snd(strip_∀(concl thm)))template;
	in
		if (fst(find tmm
			(curry (op =$) (inst [] tym op_var) o snd)))
			=$ rator
		then thm
		else fail "sort_conv" 81021 []
(* error number doesn't matter; always trapped. *)
	end
);
=TEX
=SML
val ⦏template1⦎ = ⌜(op:'a→'a→'a) A B = op B A⌝;
fun ⦏thm_i⦎ (rator : TERM) (comm : THM) (assoc : THM) : THM = (

	(all_∀_intro(check_thm rator template1 comm))
	handle Fail _ => thm_fail "sort_conv" 81021 [comm]
(* "?0 does not have the form `|- op A B = op B A''" *)
);
=TEX
=SML
val ⦏template2⦎ = ⌜(op:'a→'a→'a) (op A B) C = op A (op B C)⌝;
val ⦏template3⦎ = ⌜(op:'a→'a→'a) A (op B C) = op B (op A C)⌝;
=TEX
In the next function we assume that the commutativity
theorem has already been checked.
=SML
fun ⦏thm_ii⦎ (rator : TERM) (comm : THM) (assoc : THM) : THM = (
	let	val ty = (fst o dest_→_type o type_of) rator;
		val thm1 = app_arg_rule
			(hd(gen_vars[ty](concl comm::concl assoc::asms comm@asms assoc)))
			(app_fun_rule rator comm);
	in	all_∀_intro(check_thm rator template3
		(conv_rule(RANDS_C(simple_eq_match_conv (all_∀_intro assoc))) thm1))
	end
	handle Fail _ => thm_fail "sort_conv" 81022 [assoc]
(* ?0 does not have the form ⊢ (A op B) op C = A op B op C" *)
);
=TEX
In the next function we assume that both
theorems have been checked. We still check the outcome
of the inference in case of obscure problems (which might
arise for example if the theorems are insufficiently
general, e.g., if they contain constants were they should
have variables).
=SML
val ⦏template4⦎ = ⌜(op:'a→'a→'a) (op A X) (op B Y) = op A (op X (op B Y))⌝;
fun ⦏thm_iii⦎ (rator : TERM) (comm : THM) (assoc : THM) : THM = (
	let	val (tym, tmm) = term_match rator op_var;
		val tm = subst tmm (inst [] tym(fst(dest_eq template4)));
	in	all_∀_intro(check_thm rator template4
		(MAP_C (simple_eq_match_conv (all_∀_intro assoc))tm))
	end
	handle Fail _ => thm_fail "sort_conv" 81022 [assoc]
(* ?0 does not have the form ⊢ (A op B) op C = A op (B op C)" *)
);
=TEX
The following function is used to do the failure processing when
the sorting conversion is called recursively. It fails only if both
recursive calls do.
=SML
fun ⦏sort_rec⦎
	(sorter : CONV)
	((a, b) : TERM * TERM) : THM * THM = (
	let	val a_thm = sorter a;
	in	let	val b_thm = sorter b;
		in	(a_thm, b_thm)
		end	handle Fail _ =>  (a_thm, id_conv b)	(* b failed *)
	end	handle Fail _ => (				(* a failed *)
		let	val b_thm = sorter b;
		in	(id_conv a, b_thm)
		end
	)
);
=TEX
The main bulk of the processing is done by $sort\_conv\_aux$.
$sort\_conv$ itself is just a front end which mops up after failures.

Once again, we provide two conversions, one that applies to any normalised sub-term constructed by the operator, and the other applied to any literal, before further processing by $sort\_conv\_aux$.
=SML
fun ⦏sort_conv_aux⦎ (order : TERM -> TERM -> int) (comm : THM)
	(assoc : THM) : CONV -> CONV -> CONV = (
	let	val Scomm = all_∀_elim comm;
		val Sassoc = all_∀_elim assoc;
		val rator = ((fst o dest_app o fst o dest_app o fst o dest_eq
			 o concl) Scomm)
		handle Fail _ => thm_fail "sort_conv" 81021 [comm];
(* "?0 is not of the form ⊢ op A B = op B A' *)
		val conv_i = simple_eq_match_conv (thm_i rator Scomm Sassoc);
		val conv_ii = simple_eq_match_conv (thm_ii rator Scomm Sassoc);
		val conv_iii = simple_eq_match_conv (thm_iii rator Scomm Sassoc);
		val sel = selector rator;
		val dest = destructor rator
	in
	fn (op_extra_conv : CONV) =>
	fn (base_extra_conv : CONV) =>
	let
		val merger = merge_conv sel dest order conv_i conv_ii conv_iii
			op_extra_conv base_extra_conv;
		fun sorter tm = (
		let
			fun convert_op_conv tm' =
			(let	val (lthm, rthm) = sort_rec sorter (dest tm');
				val thm1 = mk_app_rule(app_fun_rule rator lthm) rthm;
			in	
				conv_rhs_rule thm1 merger
			end handle Fail _ => merger tm');
		in
			if not(sel tm)
			then (let val thm1 = base_extra_conv tm
				in
				if sel(rhs_thm thm1)
				then (conv_rhs_rule thm1 convert_op_conv)
				else thm1
				end handle Fail _ => fail_conv tm)
			else convert_op_conv tm
		end);

	in	sorter
	end
	end
);
=TEX
=SML
fun ⦏sort_conv⦎ (order : TERM -> TERM -> int) (comm : THM)
	(assoc : THM) : CONV -> CONV -> CONV = (
	let val sorter = sort_conv_aux order comm assoc;
	in	fn (op_extra_conv : CONV) =>
		fn (base_extra_conv : CONV) =>
		(fn tm => (sorter op_extra_conv base_extra_conv tm)
			handle Fail _ => term_fail "sort_conv" 81025 [tm])
	end
);
=TEX
\section{POLYNOMIAL NORMALISATION}
In this section we consider two binary (infix) operators,
$+$, $\times$, which are assumed both to be associative
and commutative and such that $\times$ distributes
over $+$ in the sense that
=GFT
	⊢ A × (B + C) = (A × B) + (A × C)
=TEX
We shall give a conversion which computes theorems
of the form:
=GFT
	⊢ tm = (A1 × A2 ...) + (B1 × B2 ...) + ...
=TEX
where $tm$ is an arbitrary term and the $A_i$,
$B_i$ etc. are {\em literals} in the sense that
they are not of the form $A + B$ or $A \times B$.

In the above polynomial normal form the literals in
each ``summand'' will be sorted according to some ordering
on terms supplied as an argument to the conversion
as will the ``summands'' within the sum.
\subsection{Algorithm}
This is quite similar to that used for monomial
normalisation.

If the term we have to normalise is a literal we are done.
Given a term $tm$ which is not a literal, one of
the following will hold for some $A$ and $B$:
=GFT
	⊢ tm = A + B
	⊢ tm = A × B
=TEX
In the first case we normalise $A$ and $B$ recursively
using the merge conversion (with the theorems for $+$)
and we are done.

In the second case we again normalise $A$ and $B$ recursively. This will give:
=GFT
	⊢ A = M1 + M2 + ... + Mm
	⊢ B = N1 + N2 + ... + Nn
=TEX
where the $M_i$ and $N_j$ are normalised
monomials over $\times$.

Depending on $m$ and $n$, we use one of the following
theorems:
=GFT
(iv)	⊢ (X + Y)×(U + W) = (X×U) + (X×W) + (Y×U) + (Y×W)
(v)	⊢ (X + Y)×U = (X×U) + (Y×U)
(vi)	⊢ Y×(U + W) = (Y×U) + (Y×W)
=TEX
Here $X$ and $U$ are normalised monomials over $\times$
and $X\times U$ may be written as a normalised term
by a single merge (with the theorems for $\times$).
The summands other than $X\times U$ may be normalised
(as polynomials)
recursively giving $A\times B$ as the sum of a
normalised monomial and one or three normalised
polynomials. These may be merged by one or three
applications of the merge operation (with the
theorems for $+$) to give the desired polynomial
normal form for $A\times B$
\subsection{The Code}
Templates for the theorems $(iv), (v), (vi)$:
=SML
val ⦏template5⦎ = ⌜(m_op:'a→'a→'a) ((a_op:'a→'a→'a) A B) (a_op C D) =
	a_op (m_op A C) (a_op(m_op A D) (a_op (m_op B C) (m_op B D)))⌝;
val ⦏template6⦎ = ⌜(m_op:'a→'a→'a) ((a_op:'a→'a→'a) A B) C =
	a_op (m_op A C) (m_op B C)⌝;
val ⦏template7⦎ = ⌜(m_op:'a→'a→'a) A ((a_op:'a→'a→'a) B C) =
	a_op (m_op A B) (m_op A C)⌝;
=TEX
=SML
val m_op_var = ⌜m_op:'a→'a→'a⌝;
val a_op_var = ⌜a_op:'a→'a→'a⌝;
=TEX
=SML
fun ⦏check_2_thm⦎ (m_op : TERM) (a_op : TERM) (template : TERM) (thm : THM)  : THM = (
	let	val (tym, tmm) = term_match(snd(strip_∀(concl thm)))template;
	in
		if ((fst(find tmm
			(curry (op =$) (inst [] tym m_op_var) o snd)))
			=$ m_op) andalso
			((fst(find tmm
			(curry (op =$) (inst [] tym a_op_var) o snd)))
			=$ a_op)
		then thm
		else fail "poly_conv" 81029 []
(* doesn't matter; always caught *)
	end
);
=TEX
Now generate the theorems according to these templates:
=SML
fun ⦏thm_v⦎ (m_op : TERM) (a_op : TERM) (left_distrib : THM) (right_distrib : THM) : THM = (

	(all_∀_intro(check_2_thm m_op a_op template6 right_distrib))
	handle Fail _ => thm_fail "sort_conv" 81023 [left_distrib]
(* ?0 is not of the form ⊢ (a + b) * c = (a * c) + (b * c) *)
);
=TEX
=SML
fun ⦏thm_vi⦎ (m_op : TERM) (a_op : TERM) (left_distrib : THM) (right_distrib : THM) : THM = (

	(all_∀_intro(check_2_thm m_op a_op template7 left_distrib))
	handle Fail _ => thm_fail "sort_conv" 81023 [left_distrib]
(* ?0 is not of  the form ⊢ a * (b + c) = (a * b) + (a * c) *)
);
=TEX
=SML
fun ⦏thm_iv⦎ (m_op : TERM) (a_op : TERM) (add_assoc: THM)
	(left_distrib : THM) (right_distrib : THM) : THM = (
let
	val v = thm_v m_op a_op left_distrib right_distrib;
	val vi = thm_vi m_op a_op left_distrib right_distrib;
	val var_ty = fst(dest_→_type(type_of m_op));
	val gvs = gen_vars [var_ty, var_ty, var_ty, var_ty]
		(concl add_assoc :: concl left_distrib :: concl right_distrib::
		asms add_assoc @ asms left_distrib @ asms right_distrib);
in
	case gvs of
	[gv1, gv2, gv3, gv4] =>
		all_∀_intro(check_2_thm m_op a_op template5
		((simple_rewrite v THEN_C
		 simple_rewrite vi THEN_C
		 simple_rewrite add_assoc)
		(list_mk_app(m_op,
			[list_mk_app(a_op, [gv1, gv2]),
				list_mk_app(a_op, [gv3, gv4])]))))
	|	_ => error "thm_iv" 81029 []
(* unexpected value returned by gen_vars *)
end
);
=TEX
As with monomial sorting an auxiliary function does all the work except for the
outer exception handling.

Here we want three conversions: one for normalised sub-terms constructed with the add operator, one for those constructed with the multiply operator, and one for literals, which, as with $sort\_CONV$, is to be applied and the result checked to see if it can now be processed.
=SML
fun ⦏poly_conv_aux⦎ (order: TERM -> TERM -> int)
	(add_comm: THM) (add_assoc: THM)
	(mult_comm: THM) (mult_assoc: THM)
	(left_distrib: THM)
	: CONV -> CONV -> CONV -> CONV = (
let
	val Sadd_comm = all_∀_elim add_comm;
	val Sadd_assoc = all_∀_elim add_assoc;
	val Smult_comm = all_∀_elim mult_comm;
	val Smult_assoc = all_∀_elim mult_assoc;
	val Sleft_distrib = all_∀_elim left_distrib;
	val right_distrib = conv_rule(simple_rewrite mult_comm)Sleft_distrib

		handle Fail _ =>
		thm_fail "poly_conv" 81024 [mult_comm, left_distrib];
	val add_op = ((fst o dest_app o fst o dest_app o lhs_thm) Sadd_comm)
		handle Fail _ =>
		thm_fail "poly_conv" 81021 [add_comm];
	val mult_op = ((fst o dest_app o fst o dest_app o lhs_thm) Smult_comm)
		handle Fail _ =>
		thm_fail "poly_conv" 81021 [mult_comm];
	val add_conv_i = simple_eq_match_conv (thm_i add_op Sadd_comm Sadd_assoc);
	val add_conv_ii = simple_eq_match_conv (thm_ii add_op Sadd_comm Sadd_assoc);
	val add_conv_iii = simple_eq_match_conv (thm_iii add_op Sadd_comm Sadd_assoc);
	val mult_conv_i = simple_eq_match_conv (thm_i mult_op Smult_comm Smult_assoc);
	val mult_conv_ii = simple_eq_match_conv (thm_ii mult_op Smult_comm Smult_assoc);
	val mult_conv_iii = simple_eq_match_conv (thm_iii mult_op Smult_comm Smult_assoc);
	val conv_iv = simple_eq_match_conv(thm_iv mult_op add_op Sadd_assoc
		Sleft_distrib right_distrib);
	val conv_v = simple_eq_match_conv(thm_v mult_op add_op
		Sleft_distrib right_distrib);
	val conv_vi = simple_eq_match_conv(thm_vi mult_op add_op
		Sleft_distrib right_distrib);
	val add_sel = selector add_op;
	val mult_sel = selector mult_op;
	val add_dest = destructor add_op;
	val mult_dest = destructor mult_op;
in	fn add_extra_conv => fn mult_extra_conv => fn base_extra_conv =>
let
	val add_sort_conv = sort_conv_aux order Sadd_comm Sadd_assoc
		add_extra_conv fail_conv;
	val add_merge_conv = merge_conv add_sel add_dest order
		add_conv_i add_conv_ii add_conv_iii
		add_extra_conv fail_conv;
	val mult_merge_conv = merge_conv mult_sel mult_dest order
		mult_conv_i mult_conv_ii mult_conv_iii
		mult_extra_conv fail_conv;
=TEX
Given a term that has two normalised sub-terms, combined by $m\_Op$,
normalise the result.
Actually, we know that in all but the first case below the first argument in the sequence of ``adds'' will be the ``multiplication'' of two normalised ``multiplications'', and so could be normalised by $mult\_merge\_conv$ directly.
However, there is little waste in the slightly lazier approach taken, which does a few additional tests in reaching this conclusion.
Notice also that the $ONCE\_MAP\_C$'s will always ``catch'' on redexes after traversing only top-level ``additions'' - they cannot directly reach into the bodies of already normalised subterms.
=SML
	val rec mult_normal_conv: CONV =
	(fn tm =>
	(let val (lft, rht) = mult_dest tm
	in
	case(add_sel lft, add_sel rht) of
	(false, false) =>
		mult_merge_conv tm
	| (false, true) =>
		(conv_vi
		AND_OR_C (ONCE_MAP_C mult_normal_conv)
		AND_OR_C add_sort_conv) tm
	| (true, false) =>
		(conv_v
		AND_OR_C (ONCE_MAP_C mult_normal_conv)
		AND_OR_C add_sort_conv) tm
	| (true, true) =>
		(conv_iv
		AND_OR_C (ONCE_MAP_C mult_normal_conv)
		AND_OR_C add_sort_conv) tm
	end));
=TEX
The core of the conversion:
=SML
	val rec poly_sort: CONV =
	(fn  (tm: TERM) =>
	if add_sel tm (* tm = A + B *)
	then (let
			val (sorted_A, sorted_B) = sort_rec poly_sort (add_dest tm);
			val thm1 = mk_app_rule (app_fun_rule add_op sorted_A) sorted_B;
		in
			conv_rhs_rule thm1 add_merge_conv
		end	handle Fail _ => add_merge_conv tm)
	else if mult_sel tm (* tm = A * B *)
	then (let
		val (sorted_A, sorted_B) = sort_rec poly_sort (mult_dest tm);
		val thm1 = mk_app_rule (app_fun_rule mult_op sorted_A) sorted_B
	in
		conv_rhs_rule thm1 mult_normal_conv
	end	handle Fail _ => mult_normal_conv tm)
	else (let val thm1 = base_extra_conv tm;
		val rhs_thm1 = rhs_thm thm1
		in
		if (add_sel rhs_thm1) orelse (mult_sel rhs_thm1)
		then conv_rhs_rule thm1 poly_sort
		else thm1
		end handle Fail _ => fail_conv tm))
in
	poly_sort
end
end
);
=TEX
=SML
fun ⦏poly_conv⦎ (order: TERM -> TERM -> int)
	(add_comm: THM) (add_assoc: THM)
	(mult_comm: THM) (mult_assoc: THM)
	(left_distrib: THM)
	: CONV -> CONV -> CONV -> CONV = (
	let val sorter = (poly_conv_aux order add_comm add_assoc
				mult_comm mult_assoc left_distrib)
		handle ex => (
			if area_of ex = "sort_conv"
			then reraise ex "poly_conv"
			else raise ex
		);
	in	fn add_extra_conv => fn mult_extra_conv => fn base_extra_conv =>
		(fn tm => (sorter add_extra_conv mult_extra_conv
				base_extra_conv tm)
			handle Fail _ => term_fail "poly_conv" 81025 [tm])
	end
);
=TEX
\section{DNF and CNF}
First we need some theorems:
=SML
val ⦏∧_comm_thm⦎ = tac_proof(([], ⌜∀a b⦁ a ∧ b ⇔ b ∧ a⌝), taut_tac);
val ⦏∨_comm_thm⦎ = tac_proof(([], ⌜∀a b⦁ a ∨ b ⇔ b ∨ a⌝), taut_tac);
val ⦏∧_assoc_thm⦎ = tac_proof(([], ⌜∀a b c⦁ (a ∧ b) ∧ c ⇔ a ∧ b ∧ c⌝), taut_tac);
val ⦏∨_assoc_thm⦎ = tac_proof(([], ⌜∀a b c⦁ (a ∨ b) ∨ c ⇔ a ∨ b ∨ c⌝), taut_tac);
val ⦏∧_assoc_thm1⦎ = tac_proof(([], ⌜∀a b c⦁ a ∧ b ∧ c ⇔ (a ∧ b) ∧ c⌝), taut_tac);
val ⦏∨_assoc_thm1⦎ = tac_proof(([], ⌜∀a b c⦁ a ∨ b ∨ c ⇔ (a ∨ b) ∨ c⌝), taut_tac);
val ⦏∧_∨_distrib_thm⦎ = tac_proof(([], ⌜∀a b c⦁ a ∧ (b ∨ c) ⇔ (a ∧ b) ∨ (a ∧ c)⌝), taut_tac);
val ⦏∨_∧_distrib_thm⦎ = tac_proof(([], ⌜∀a b c⦁ a ∨ (b ∧ c) ⇔ (a ∨ b) ∧ (a ∨ c)⌝), taut_tac);
=TEX
=SML
val ⦏∧_simp_thm⦎ = tac_proof(([], ⌜
	∀a b c⦁	(a ∧ T ⇔ a)
	∧	(T ∧ a ⇔ a)
	∧	(F ∧ a ⇔ F)
	∧	(a ∧ F ⇔ F)
	∧	(a ∧ a ⇔ a)
	∧	(a ∧ ¬a ⇔ F)
⌝), taut_tac);
val ⦏∨_simp_thm⦎ = tac_proof(([], ⌜
	∀a⦁	(a ∨ T ⇔ T)
	∧	(T ∨ a ⇔ T)
	∧	(F ∨ a ⇔ a)
	∧	(a ∨ F ⇔ a)
	∧	(a ∨ a ⇔ a)
	∧	(a ∨ ¬a ⇔ T)
⌝), taut_tac);
=TEX
=SML
val ⦏∧_∨_¬_reduce_thm⦎ = tac_proof(([], ⌜
	∀a b c⦁	((a ⇒ b) ⇔ ¬a ∨ b)
	∧	((a ⇔ b) ⇔ (a ∧ b) ∨ (¬a ∧ ¬b))
	∧	((if a then b else c) ⇔ (a ∧ b) ∨ (¬a ∧ c))
	∧	(¬(a ∧ b) ⇔ ¬a ∨ ¬ b)
	∧	(¬(a ∨ b) ⇔ ¬a ∧ ¬ b)
	∧	(¬(a ⇒ b) ⇔ a ∧ ¬b)
	∧	(¬(a ⇔ b) ⇔ (a ∧ ¬b) ∨ (¬a ∧ b))
	∧	(¬(if a then b else c) ⇔ (a ∧ ¬b) ∨ (¬a ∧ ¬c))
	∧	(¬F ⇔ T)
	∧	(¬T ⇔ F)
⌝), REPEAT strip_tac);
=TEX
Now we can define the conversions needed as parameters to
$poly\_conv$:
=SML
val ⦏prop_lit_conv⦎ = FIRST_C (map simple_eq_match_conv (initial_rw_canon ∧_∨_¬_reduce_thm));

val ⦏∧_simp_conv⦎ = FIRST_C (map simple_eq_match_conv (initial_rw_canon ∧_simp_thm));
val ⦏∨_simp_conv⦎ = FIRST_C (map simple_eq_match_conv (initial_rw_canon ∨_simp_thm));

fun ⦏∧_C⦎ c = REPEAT_C1(c ORELSE_C (simple_eq_match_conv ∧_assoc_thm1 THEN_C LEFT_C c));

fun ⦏∨_C⦎ c = REPEAT_C1(c ORELSE_C (simple_eq_match_conv ∨_assoc_thm1 THEN_C LEFT_C c));
=TEX
Now the external interfaces:
=SML
local
val ⦏cnf_conv_aux : CONV⦎ =
	poly_conv term_order
	∧_comm_thm ∧_assoc_thm ∨_comm_thm ∨_assoc_thm ∨_∧_distrib_thm
	(∧_C ∧_simp_conv) (∨_C ∨_simp_conv) prop_lit_conv;

val ⦏dnf_conv_aux⦎ =
	poly_conv term_order
	∨_comm_thm ∨_assoc_thm ∧_comm_thm ∧_assoc_thm ∧_∨_distrib_thm
	(∨_C ∨_simp_conv) (∧_C ∧_simp_conv) prop_lit_conv;
in
val cnf_conv : CONV = (fn tm =>
	(cnf_conv_aux tm)
	handle Fail _ => term_fail "cnf_conv" 81030 [tm]
);
val dnf_conv : CONV = (fn tm =>
	(dnf_conv_aux tm)
	handle Fail _ => term_fail "dnf_conv" 81031 [tm]
);
end;
=TEX
\section{ANF}
We need conversions and supporting theorems which do collection of
like terms. Since $term\_order$ brings the like terms together and puts
$m$ before $c*m$ for $c$ literal, there are several cases to consider:
=GFT
1.	c*m +d*m 	=	(c + d)*m
2.	m +d*m 		=	(c + d)*m
3.	0 + m		=	d
4.	c + d		=	c + d
5.	m + m 		=	2*m
=TEX
where case 3 is directly supported by $plus\_conv$ (note that the order
here is important since case 4 overlaps case 3).
The naive coding of all of this proved to be somewhat inefficient
and the following is more finely tuned.
=SML
val ⦏case1_thm⦎ = tac_proof(([], ⌜∀c d m⦁c*m + d*m = (c + d)*m⌝),
	rewrite_tac[times_plus_distrib_thm]);
val ⦏case2_thm⦎ = tac_proof(([], ⌜∀d m⦁m + d*m = (1 + d)*m⌝),
	rewrite_tac[times_plus_distrib_thm, plus_assoc_thm]);
val ⦏case3_thm⦎ = tac_proof(([], ⌜∀m⦁0 + m = m⌝),
	rewrite_tac[]);
val ⦏case5_thm⦎ = tac_proof(([], ⌜∀m⦁m + m = 2*m⌝),
	pure_rewrite_tac[pc_rule1 "'ℕ_lit"prove_rule[]⌜2 = 1 + 1⌝, times_plus_distrib_thm]
	THEN rewrite_tac[]);
val ⦏case1_conv⦎ : CONV = (fn tm =>
	((((dest_ℕ o fst o dest_times) ** (dest_ℕ o fst o dest_times))
		o dest_plus) tm;
	(simple_eq_match_conv case1_thm THEN_C LEFT_C plus_conv) tm)
);
val ⦏case2_conv⦎ : CONV = (fn tm =>
	((dest_ℕ o fst o dest_times o snd o dest_plus) tm;
	(simple_eq_match_conv case2_thm THEN_C LEFT_C plus_conv) tm)
);
val ⦏case3_conv⦎ : CONV = (fn tm =>
	if (dest_ℕ o fst o dest_plus) tm = zero
	then (simple_eq_match_conv case3_thm) tm
	else fail_conv tm
);
val ⦏case4_conv⦎ = plus_conv;
val ⦏case5_conv⦎ = simple_eq_match_conv case5_thm;
=TEX
The following conversional converts a conversion acting on $x + y$, say,
to one which will also act on $x + y + z$ (by rewriting it as $(x + y) + z$
and then applying the conversion to the subterm $x + y$).
=SML
val ⦏plus⦎ = ⌜$+⌝;
fun ⦏A_C⦎ (c : CONV) : CONV = (fn tm =>
	let	val (ltm, rtm) = dest_plus tm;
		exception BaseCase;
	in let	val (rtm1, rtm2) = dest_plus rtm handle Fail _ => raise BaseCase;
		val thm = c (mk_plus(ltm, rtm1));
	in	eq_trans_rule
		(list_∀_elim[ltm, rtm1, rtm2] plus_assoc_thm1)
		(app_arg_rule rtm2 (app_fun_rule plus thm))
	end 	handle BaseCase => c tm
	end
);
=TEX
$M\_C$ is analogous to $A\_C$ but for multiplication rather than addition.
=SML
val times_assoc_thm1 = tac_proof(([], ⌜∀i m n⦁ i * m * n = (i * m) * n⌝),
	rewrite_tac[times_assoc_thm]);
val ⦏times⦎ = ⌜$*⌝;
fun ⦏M_C⦎ (c : CONV) : CONV = (fn tm =>
	let	val (ltm, rtm) = dest_times tm;
		exception BaseCase;
	in let	val (rtm1, rtm2) = dest_times rtm handle Fail _ => raise BaseCase;
		val thm = c (mk_times(ltm, rtm1));
	in	eq_trans_rule
		(list_∀_elim[ltm, rtm1, rtm2] times_assoc_thm1)
		(app_arg_rule rtm2 (app_fun_rule times thm))
	end 	handle BaseCase => c tm
	end
);

fun ⦏M_C⦎ c = c ORELSE_C (simple_eq_match_conv times_assoc_thm1 THEN_C LEFT_C c);
=TEX
We want to simplify multiplication by $0$ and by $1$:
=SML
val ⦏times0_thm⦎ = tac_proof(([], ⌜∀m⦁0*m = 0⌝), rewrite_tac[times_clauses]);
val ⦏times1_thm⦎ = tac_proof(([], ⌜∀m⦁1*m = m⌝), rewrite_tac[times_clauses]);
val ⦏times0_conv⦎ = simple_eq_match_conv times0_thm;
val ⦏times1_conv⦎ = simple_eq_match_conv times1_thm;
=TEX
Pulling these bits together we get:
=SML
val ⦏add_simp_conv⦎ =
	FIRST_C(map A_C[case1_conv, case2_conv, case3_conv, case4_conv, case5_conv]);
val ⦏times_simp_conv⦎ =
	FIRST_C(map M_C[times0_conv, times1_conv, times_conv]);
=TEX
We need the following theorem:
=SML
val ⦏left_times_plus_distrib_thm⦎ =
	all_∀_intro(∧_right_elim(all_∀_elim times_plus_distrib_thm));
=TEX
Now we can define the external interfaces:
=SML
local
val  ⦏ANF_C_AUX⦎ : CONV -> CONV = (
	poly_conv
	term_order
	plus_comm_thm
	plus_assoc_thm
	times_comm_thm
	times_assoc_thm
	left_times_plus_distrib_thm
	add_simp_conv
	times_simp_conv
);
in
fun  ⦏ANF_C⦎ (conv : CONV) : CONV = (fn tm =>
	(ANF_C_AUX conv tm)
	handle Fail _ => term_fail "ANF_C" 81032 [tm]
);
val ⦏anf_conv⦎ : CONV = (fn tm =>
	(ANF_C fail_conv tm)
		handle ex => (
			if area_of ex = "ANF_C"
			then reraise ex "anf_conv"
			else raise ex
	)
);
end;
=TEX
\section{EPILOGUE}
=SML
val _ = open_theory old_thy;
val _ = pop_pc();
end	(* of structure Normalisation *);
open Normalisation;
=TEX
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}

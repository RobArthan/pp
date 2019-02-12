=IGN
********************************************************************************
imp120.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
=TEX
\documentclass[a4paper,12pt]{article}

%%%%% YOU CAN ADD OTHER PACKAGES AS NEEDED BELOW:
\usepackage{A4}
\usepackage{Lemma1}
\usepackage{ProofPower}
\usepackage{epsf}
\makeindex

\def\Title{ Higher-Order Matching: Implementation }

\def\Abstract{\begin{center}
{\bf Abstract}\par\parbox{0.7\hsize}
{\small This document gives the implementation of a higher-order matching function for HOL terms.}
\end{center}}

\def\Reference{LEMMA1/HOL/IMP120}

\def\Author{R.D. Arthan}

\def\EMail{{\tt rda@lemma-one.com}}

\def\Phone{+44 118 958 4409}

\def\Fax{+44 118 956 1920}

%%%%% YOU MAY WANT TO CHANGE THE FOLLOWING TO GET A NICE FRONT PAGE:
\def\FrontPageTitle{ {\huge \Title } }
\def\FrontPageHeader{\raisebox{16ex}{\begin{tabular}[t]{c}
\bf Copyright \copyright\ : Lemma 1 Ltd \number\year\\\strut\\
\end{tabular}}}
\begin{centering}



\end{centering}

%%%%% THE FOLLOWING DEFAULTS WILL GENERALLY BE RIGHT:

\def\Version{\VCVersion}
\def\Date{\FormatDate{\VCDate}}

%%%%% NOW BEGIN THE DOCUMENT AND MAKE THE FRONT PAGE

\begin{document}
\headsep=0mm
\FrontPage
\headsep=10mm

%%%%% STANDARD RED-TAPE SECTIONS (MAY WANT TO INTERLEAVE SOME \newpage COMMANDS IN THESE)

%%%%% CONTENTS:

\subsection{Contents}

\tableofcontents

%%%%% REFERENCES:

\newpage
\subsection{References}

\bibliographystyle{fmu}

%%%%% CHANGE THE FOLLOWING AS NECESSARY (E.G., TO PICK UP daz.bib):
{\raggedright
\bibliography{fmu}
}
%%%%% CHANGES HISTORY:
\subsection{Changes History}
\begin{description}
\item[Issue 1.1 (2009/09/11)-1.3 (2010/10/16)] Initial drafts.
\item[Issue 1.4 (2010/11/17)] Moved conversions out into \cite{DS/FMU/IED/IMP007}.
\item[Issue 1.5 (2011/02/20), 1.6 (2011/02/20)] Fixed problems in cases where the pattern contains $\eta$-redexes.
\item[Issue 1.7 (2011/02/26), 1.8 (2011/05/05)] Renamed $ho\_match$ on $simple\_ho\_match$ to make
way for an implementation of the Fettig/L\"{o}chner algorithm or similar later.
\item[Issue 1.9 (2012/02/21)] Fixed type variable capture problem.
\item[Issues 1.10 (2012/05/06)] You can now specify a list of ``rigid'' variables that will not be instantiated.
\item[Issues 1.11 (2012/06/05)] Fixed incorrect treatment of rigid variables in the rigid-flex case (where they must not be treated as bound variables).
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.
\item[2015/04/15]
Now uses new date and version macros from doctex
%%%% END OF CHANGES HISTORY %%%%
\end{description}

%%%%%  CHANGES FORECAST:

\subsection{Changes Forecast}

None.

%%%%% DISTRIBUTION LIST

\subsection{Distribution}

Lemma 1 build system.

\newpage

\section{Introduction}
\subsection{Scope}
This document gives the implementation of higher-order matching for HOL terms and
of proof procedures based on it.

\subsection{Purpose and Background}
See \cite{LEMMA1/HOL/DTD120}.

\subsection{Algorithms}
We follow Nipkow's
``Functional Unification of Higher-Order Patterns''
\cite{Nipkow93}.
As Nipkow says matching turns out to be significantly
easier than unification.

\section{THE STRUCTURE}
=TEX
=SML
structure ⦏HigherOrderMatching⦎ : HigherOrderMatching = struct
=TEX
The narrative here refers mainly to the implementation
of unification given in figures 9 and 10 in Nipkow's paper.
Equivalents of the functional programming utilities of his figure 7
and the term manipulation functions of his figure 8
are provided with {\Product}.
=TEX
Nipkow's {\tt foldl} is our {\tt revfold} and
his {\tt foldr} is our {\tt fold}.

Nipkow distinguishes between free variables and loose bound variables in his syntax, the free variables being the variables that are subject to substitution, while the loose bound variables are treated as constants.
We work in an environment containing the current substitution and the list of loose bound variables.
Here and throughout we follow the {\Product}
convention of putting things relating to the target of the match to the left of things relating to the pattern:
so we represent a substition $[t_1/F_1, \ldots, t_k/F_k]$
using the pairs $(t_i, F_i)$ not $(F_i, t_i)$ as Nipkow does.

We carry around the type instantiation $\sigma$ and
term substitution $\theta$ (which becomes {\tt S}
in Nipkow's final code).
Each free variable appearing on the right-hand
side of a pair $(t_i, F_i)$ in $\theta$ has already been
instantiated to its final target type when it is
put in $\theta$ and no further instantation can apply to it.
The bound variables never need instantiation.
We also have the list of rigid variables passed in as a parameter.
The rigid variables are treated as monomorphic constants (i.e., type variables in their types are not instantiated).
=SML
type ⦏HOM_ENV⦎ = {
	theta : (TERM * TERM) list,
	sigma : (TYPE * TYPE) list,
	bvars : TERM list,
	rvars : TERM list
};
=TEX
=SML
fun ⦏env_assoc⦎ ({theta, ...} : HOM_ENV) (f : TERM) : TERM OPT = (
	rassoc5 theta f
);
=TEX
=SML
fun ⦏red⦎ (s : TERM) ([] : TERM list) : TERM = s
|   red (t : TERM) (yys as (y :: ys)) = (
	let	val (x, s) = dest_simple_λ t;
	in	red (subst [(y, x)] s) ys
	end	handle Fail _ => list_mk_app (t, yys)
);
=TEX
In the following we do not need to test whether $t$ is a free variable: if it is in the domain of $\sigma$ it must be a free variable.
=SML
fun ⦏devar⦎ (env : HOM_ENV) (t : TERM) = (
	let	val (f, ys) = strip_app t;
	in	case env_assoc env f of
			Value t => devar env (red t ys)
		|	Nil => t
	end
);
=TEX
We use the following local exception in place of Nipkow's {\tt Unif}.
=SML
exception HOMatch;
=TEX
We implement a preprocessing phase that $\eta$-normalises
the constituents of a function application $f\,y_1\,\ldots y_n$ in the pattern.
Nipkow mentions an $\eta$-normalisation phase on the $y_m$ as a possibility, and there seems to be no reason not do $f$ as well, thereby making our notion of
a linear pattern closed under $\eta$-conversion.
=SML
fun η_norm_fun_arg tm = (
	case dest_simple_term tm of
		Simpleλ(x, b) => (
			let	val (g, y) = dest_app b;
			in	if	x = y
				then	η_norm_fun_arg g
				else	tm
			end	handle Fail _ => tm
		) |	_ => tm
);
=TEX
To keep the pattern to the right of the target, we do {\tt rigidflex} rather than {\tt flexrigid}.
=SML
fun ⦏rigidflex⦎ ({theta, sigma, bvars, rvars} : HOM_ENV)
	(t : TERM) (f : TERM, ym : TERM list) : HOM_ENV = (
	let	fun ok v = v mem ym orelse not(v mem bvars);
	in	case frees t drop ok of
			[] => (
				let	val ym' = map η_norm_fun_arg ym;
					val s = list_mk_λ(ym', t);
					val theta' = (s, f)::theta;
				in	{theta = theta',
					 sigma = sigma,
					 bvars = bvars,
					 rvars = rvars}
				end
		) |	_ =>	raise HOMatch
	end
);
=TEX
{\tt matchtypes} is used in the rigid-rigid case to
maintain the invariant that the two terms have the
same type.
We arrange for $\sigma$ to give the complete correspondence
between type variables in the target $a$ and the pattern $b$, including
type variables that are matched with themselves.
This prevents us further instantiating type variables in the type of $a$.
Before actually using $\sigma'$ to do an instantiation, we drop pairs of
identical type variables from $\sigma'$ to avoid the instantiations doing
unnecessary copying.
=SML
fun ⦏matchtypes⦎ ({theta, sigma, bvars, rvars} : HOM_ENV)
	(a : TERM, ss : TERM list)
	(b : TERM, ts : TERM list) : HOM_ENV * TERM list = (
	let	val ty_a = type_of a;
		val ty_b = type_of b;
		val sigma'= type_match1 sigma ty_a ty_b;
		val env' = {
			theta = theta,
			sigma = sigma',
			bvars = bvars,
			rvars = rvars};
	in	if	a ~=$ b
		then	(env', ts)
		else if	fst(dest_const a) = fst(dest_const b)
		then	let	val i = inst [] (sigma' drop (op =));
				val ts' = map i ts;
			in	(env', ts')
			end
		else	raise HOMatch
	end	handle Fail _ => raise HOMatch	
);
=TEX
=SML
fun ⦏pushbvar⦎ ({theta, sigma, bvars, rvars} : HOM_ENV)
	(x : TERM) : HOM_ENV = (
	{theta = theta,
	 sigma = sigma,
	 bvars = x :: bvars,
	 rvars = rvars}
);
=TEX
=SML
fun ⦏popbvar⦎ ({theta, sigma, bvars, rvars} : HOM_ENV) : HOM_ENV = (
	{theta = theta,
	 sigma = sigma,
	 bvars = tl bvars,
	 rvars = rvars}
);
=TEX
{\tt hom} is Nipkow's {\tt unif} simplified to do matching rather than unification.
It assumes caller has ensured that $s$ and $t$ have the same type and has recorded the type instantiation
used to do this in $\sigma$.

We have to deal with the cases when a bound variable in the pattern $t$
hides one of the rigid variables and when the bound variable in the
target $s$ should not hide it.
=SML
fun ⦏hom⦎ ((s : TERM, t : TERM), env : HOM_ENV) : HOM_ENV = (
	let	val t1 = devar env t;
	in	case (dest_simple_term s, dest_simple_term t1) of
			(Simpleλ(x, bs), Simpleλ(y, bt)) => (
				let	val bt1 =
					if	x = y
					then	bt
					else	subst [(x, y)] bt;
					val env1 = pushbvar env x;
					val env2 = hom ((bs, bt1), env1);
				in	popbvar env2
				end
		) |	(Simpleλ(x, bs), _) => (
				let	val t_x = mk_app(t1, x);
					val env1 = pushbvar env x;
					val env2 = hom ((bs, t_x), env1);
				in	popbvar env2
				end
		) |	(_, Simpleλ(y, bt)) => (
				let	val s_y = mk_app(s, y);
					val env1 = pushbvar env y;
					val env2 = hom((s_y, bt), env1);
				in	popbvar env2
				end
		) |	_ => cases ((s, t1), env)
	end
)
(*
=TEX
=SML
*)
and ⦏cases⦎ ((s : TERM, t : TERM), env : HOM_ENV) : HOM_ENV = (
	let	val (g, zn) = strip_app t;
		val g' = η_norm_fun_arg g;
	in	if	is_var g'
		andalso	not(g' mem #bvars env)
		andalso	not(g' mem #rvars env)
		then	rigidflex env s (g', zn)
		else	rigidrigid env (strip_app s) (g', zn)
	end
)
(*
=TEX
=SML
*)
and ⦏rigidrigid⦎ (env : HOM_ENV)
	(a_ss as (_, ss) : TERM * TERM list)
	(b_ts : TERM * TERM list) : HOM_ENV = (
	let	val (env1, ts) = matchtypes env a_ss b_ts;
		val ss_ts = combine ss ts;
	in	revfold hom ss_ts env1
	end	handle Fail _ => raise HOMatch
);
=TEX
We implement the input list of rigid variables by treating them as outer bound variables and matching their type variables with themselves in the initial value of $\sigma$.

To avoid problems with type variables being captured, we preprocess
the pattern to make its type variables distinct from the type variables
of the target term.
Without this, the terms
=INLINEFT
⌜λab: 'a × 'b⦁ Snd ab⌝
=TEX
\ and
=INLINEFT
⌜λx:'b⦁ Snd ((t : 'b → 'c × 'd) x)⌝;
=TEX
\ would fail to match.
=IGN
val rvars = [⌜f:'a → 'b⌝, ⌜x:'z⌝];
val s = ⌜λa⦁ (f : 'a → 'b)(q x a)⌝;
val t = ⌜λx⦁ (f : 'a → 'b)(t x)⌝;
=TEX

=SML
fun ⦏simple_ho_match⦎ (rvars : TERM list) (s : TERM) (t : TERM)
	: (TYPE * TYPE) list * (TERM * TERM) list = (
	let	val _ = case Value (find rvars (not o is_var))
				handle Fail _ => Nil of
			Nil => ()
		|	Value t => term_fail "simple_ho_match" 120002 [t];
		val r_tyvars = list_cup (map term_tyvars rvars);
		val s_tyvars = term_tyvars s;
		val t_tyvars = term_tyvars t;
		val ok = (t_tyvars diff s_tyvars) cup r_tyvars;
		val common = t_tyvars diff ok;
		val new = list_string_variant (ok @ s_tyvars) common;
		val sigma0 = combine (map mk_vartype new) (map mk_vartype common);
		val t1 = inst [] sigma0 t;
		val s_ty = type_of s;
		val t_ty = type_of t1;
		val r_tys = map mk_vartype r_tyvars;
		val r_tym = combine r_tys r_tys;
		val sigma1 = type_match1 r_tym s_ty t_ty;
		val t2 = inst [] sigma1 t1;
		val env = {
			theta = [],
			sigma = sigma1,
			bvars = [],
			rvars = rvars
		};
		val {theta = theta , sigma = sigma2, ...} = hom ((s, t2), env);
		fun sigma02 tv = (rassoc1 sigma2 (rassoc1 sigma0 tv), tv);
		val sigma3 = map sigma02 (map mk_vartype t_tyvars);
	in	(sigma3 drop (op =), theta drop (op =))
	end	handle HOMatch => (
			term_fail "simple_ho_match" 120001 [s, t]
		) | Fail _ => term_fail "simple_ho_match" 120001 [s, t]
);
=TEX
=SML
end (* of structure HigherOrderMatching *);
open HigherOrderMatching;
=TEX

\twocolumn[\section{INDEX}]
\small
\printindex

\end{document}


=IGN


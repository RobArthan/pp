=IGN
********************************************************************************
mdt105.doc: this file is part of the PPHol system

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

\def\Title{Module Tests for Integer Arithmetic Proof Procedure}

\def\AbstractText{This document contains tests for the material defined in DS/FMU/IED/DTD105\cite{DS/FMU/IED/DTD105}.}

\def\Reference{DS/FMU/IED/MDT105}

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
%% LaTeX2e port: \TPPtitle{Module Tests for Integer Arithmetic Proof Procedure}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/MDT105}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.5 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2002/10/17 15:10:58 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: %\TPPauthor{R.D.~Arthan & WIN01}  %% Mandatory field
%% LaTeX2e port: \TPPauthors{R.D.~Arthan & WIN01\\K.~Blackburn & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.B.~Jones & FMU Manager}
%% LaTeX2e port: \TPPabstract{This document contains tests for the material defined
%% LaTeX2e port: in DS/FMU/IED/DTD105\cite{DS/FMU/IED/DTD105}.}
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
\item[1.1,1.2]
First drafts.
\item[1.3] Update for new INTEGER type.
\item[1.4] Fixed {\LaTeX} errors.
\item[Issue 1.5 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.6 (2002/10/17)] PPHol-specific updates for open source release
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
This document contains module tests for the module defined
in \cite{DS/FMU/IED/DTD105}.
\subsection{Introduction}
\subsubsection{Background and Purpose}
See \cite{DS/FMU/IED/DTD105}. The tests are intended to meet
the requirements for module tests identified in the quality plan
\cite{DS/FMU/IED/PLN008}.
\subsubsection{Dependencies}
These tests depend on
the test harness as implemented in DS/FMU/IED/IMP013, and
its corresponding detailed design document, DS/FMU/IED/DTD013.
\subsubsection{Possible Enhancements}
None known.
\subsubsection{Deficiencies}
None known.
\section{PREAMBLE}
=SML
use_file "dtd013.sml";
use_file "imp013.sml";
open_theory"ℤ";
push_merge_pcs["'ℤ", "'ℕ", "predicates"];
new_theory"mdt105";
=TEX
\section{TEST CASES}
We identify the following test cases:

\begin{description}
\item[anf.1]
Miscellaneous black box tests (correct operation).
\item[anf.2]
White box test of simplification of sums (correct operation).
\item[anf.3]
White box test of simplification of products (correct operation).
\item[anf.4]
White box test of treatment of atoms (correct operation).
\item[anf.5]
Arithmetic normaliser (error cases).
\item[la.1]
$ℤ\_lin\_arith\_rule$ (successful operation)
\item[la.2]
$ℤ\_lin\_arith\_rule$ (error cases)
\item[la.3]
$ℤ\_lin\_arith\_tac$ (successful operation)
\item[la.4]
$ℤ\_lin\_arith\_tac$ (error cases)
\item[pc.1]
The proof contexts (successful operation)
\item[pc.2]
The proof contexts (error cases)
\end{description}

The conversional $ℤ\_ANF\_C$ is only tested in anf.4 and anf.5 (as is justifed by the structure of the implementation).



\section{THE TESTS}
\subsection{Tools}
For testing, it is convenient to have functions to check the salient features of the normal forms.
=SML
fun ⦏strip_dyop⦎ (dest : TERM -> TERM * TERM) (tm : TERM) : TERM list = (
	let	val (x, y) = dest tm;
	in	x :: (strip_dyop dest y)
	end	handle Fail _ => [tm]
);
=TEX
=SML
fun ⦏is_atom⦎ (tm : TERM) : bool = (
	(dest_ℤ_times tm; false)
	handle Fail _ => (
		(dest_ℤ_subtract tm; false)
		handle Fail _ => (
			(dest_ℤ_plus tm; false)
			handle Fail _ => (
				(dest_ℤ_minus tm; false)
					handle Fail _ => true
			)
		)
	)
);
=TEX
=SML
fun ⦏test_dest_monomial⦎ (tm : TERM) : (bool * (INTEGER * (TERM list))) = (
	let	val ts = strip_dyop dest_ℤ_times tm;
	in let	val i = dest_ℤ_signed_int (hd ts);
	in	if	(((i = one) orelse (i = zero)) andalso not (is_nil (tl ts)))
		orelse	 not (all (tl ts) is_atom)
		then	(false, (i, tl ts))
		else	(true, (i, tl ts))
	end	handle Fail _ => (
			let	val t = dest_ℤ_minus (hd ts);
				val ts' = t :: tl ts;
			in	(all ts' is_atom, (@~one, ts'))
			end	handle Fail _ =>
				(all ts is_atom, (one, ts))
		)
	end
);
=TEX
=SML
fun ⦏test_poly⦎ (tm : TERM) : bool * string = (
	let	val (oks,( _, ms)) =
		((Combinators.I ** split) o split o map test_dest_monomial o
			strip_dyop dest_ℤ_plus) tm;
		fun f a b = (
			if a =$ b
			then 1
			else term_order a b
		)
		val sms = map (Sort.sort f) ms;
		fun eq_ms (m1, m2) = (
			(all (combine m1 m2) (op =$))
			handle Fail _ => false
		);
	in	(all oks Combinators.I andalso all_distinct eq_ms sms,
		string_of_term tm)
	end
);
=TEX
=SML
fun ⦏test_anf⦎ (thm : THM) : bool * string = (
	let	val concl = concl thm;
		val (t1, t2) = dest_eq concl;
	in	if	not(is_nil (asms thm))
		then	(false, string_of_thm thm)
		else	test_poly t2
	end	handle Fail _ =>
		(false, string_of_thm thm)
);
=TEX
=SML
fun ⦏anf_results⦎ (grp : string) (rs : (bool * string) list)
	: unit -> (string * bool) list = (
	let	fun label i = grp ^ "." ^ string_of_int i;
		val lrs = combine (map label (interval 1 (length rs))) rs;
		fun chk (flg, _) = flg;
		fun test (lab, r) = (lab, chk, r, true);
	in	fn () => mt_run (map test lrs)
	end
);
=TEX
=SML
fun ⦏ripple⦎ (xs : 'a list) : 'a list = (
	let	val mid = length xs div 2;
		fun r (x :: xs) (y :: ys) = x :: y :: r xs ys
		|   r [] ys = ys
		|   r xs [] = xs;
	in	r (xs from mid) (xs to (mid - 1))
	end
);
fun ⦏shuffle⦎ (i : int) (xs : 'a list) = (
	if	i <= 0
	then	xs
	else	shuffle (i-1) (ripple xs)
);

=TEX
=SML
fun list_mk_dyop (unit : TERM) (mk : TERM * TERM -> TERM)
		(tms : TERM list) : TERM = (
	case tms of
		tm :: (more as _ :: _) => mk(tm, list_mk_dyop unit mk more)
	|	[tm] => tm
	|	[] => unit
);
=TEX
\subsection{Case anf.1}
A miscellany:
=SML
val ts1_1 = [
	⌜ℕℤ 1 + ℕℤ 2⌝,
	⌜(x:ℤ) + x⌝,
	⌜(x:ℤ) - x⌝,
	⌜((x:ℤ) - ℕℤ 1)*(x + ℕℤ 1)⌝,
	⌜((x:ℤ) - ℕℤ 1)*(x + y)⌝,
	⌜((x:ℤ) + y + z)*(x + y + z)⌝,
	⌜((x1:ℤ) + ~ x2 + x3 + ~ x4)*(x1 + x2 + x3 + x4)⌝,
	⌜(x - ℕℤ 1)*(x*x + x + ℕℤ 1)⌝,
	⌜(x - ℕℤ 1)*(x*x*x*x + x*x*x + x*x + x + ℕℤ 1)⌝,
	⌜~ (ℕℤ 1)*x*x⌝,
	⌜~ (y:ℤ)*  x * ~ x⌝,
	⌜~ (y:ℤ)* ~ (~ (~ (~ x)))* ~ (~ (~ (~ (~ (~ (~ (~ (~ (~ x)))))))))⌝,
	⌜~(ℕℤ 0)⌝,
	⌜~(ℕℤ 0) * x⌝,
	⌜(a:ℤ - b) * (a + b)⌝,
	⌜~ a * a * c + ℕℤ 2 * a * a * c⌝,
	⌜ℕℤ 2 * m + ~(ℕℤ 1) * m⌝,
	⌜((a:ℤ - b) + c) * ((a + b) - c) * ((~a + b) + c)⌝];
val rs1_1 = map (test_anf o ℤ_anf_conv) ts1_1;
store_mt_results (anf_results "anf.1.1" rs1_1) ();
=TEX
\subsection{Case anf.2}
Simplification of sums:
=SML
val ts2_1 = [
	⌜ℕℤ 35 *M*O*N*O + ℕℤ 47 *M*O*O*N⌝,			(* 1 *)
	⌜ℕℤ 99 *M*O*N*O + ~(ℕℤ 99) *M*O*O*N⌝,
	⌜M*O*N*O + ~(ℕℤ 35) *M*O*O*N⌝,			(* 2 *)
	⌜ℕℤ 0 + M*O*O*N⌝,					(* 3 *)
	⌜ℕℤ 0 + ℕℤ 99⌝,					(* 4 *)
	⌜(M:ℤ)*O*N*O + M*O*O*N⌝,				(* 5 *)
	⌜(M:ℤ) + ~M⌝,						(* 6 *)
	⌜(M:ℤ)*O*N*O + ~M*O*O*N⌝,				(* 7 *)
	⌜(M:ℤ)*O*N*O + ~(M*O*O*N)⌝,
	⌜~M + ℕℤ 42 * M⌝,					(* 8 *)
	⌜~M*O*N*O + ℕℤ 42 *M*O*O*N⌝				(* 9 *) ];
=TEX
=SML
val rs2_1 = map (test_anf o ℤ_anf_conv) ts2_1;
store_mt_results (anf_results "anf.2.1" rs2_1) ();
=TEX
=SML
val decorate = (fn (t1, t2) =>
	mk_ℤ_plus(⌜SUN:ℤ *PLUTO⌝,
		mk_ℤ_plus(mk_ℤ_plus(⌜ℕℤ 99⌝, t1),
				mk_ℤ_plus(⌜ℕℤ 100*PLUTO*SUN⌝,
					mk_ℤ_plus(mk_ℤ_plus(⌜EARTH:ℤ⌝, t2),
							⌜ℕℤ 66⌝)))));
val ts2_2 = map (decorate o dest_ℤ_plus) ts2_1;
val rs2_2 = map (test_anf o ℤ_anf_conv) ts2_2;
store_mt_results (anf_results "anf.2.2" rs2_2) ();
=TEX
=SML
val ts2_3 = map (decorate o swap o dest_ℤ_plus) ts2_1;
val rs2_3 = map (test_anf o ℤ_anf_conv) ts2_3;
store_mt_results (anf_results "anf.2.3" rs2_3) ();
val ts2_4 = map (list_mk_dyop ⌜ℕℤ 0⌝ mk_ℤ_plus o shuffle 7 o
			strip_dyop dest_ℤ_plus) ts2_2;
val rs2_4 = map (test_anf o ℤ_anf_conv) ts2_4;
store_mt_results (anf_results "anf.2.4" rs2_4) ();
=TEX
\subsection{Case anf.3}
Simplification of products.
=SML
val ts3_1 = [
	⌜ℕℤ 2 * ~(ℕℤ 5)⌝,			(* 1 *)
	⌜ℕℤ 0 * ℕℤ 5⌝,
	⌜ℕℤ 5 * ℕℤ 0⌝,
	⌜ℕℤ 1 * ℕℤ 1⌝,
	⌜ℕℤ 1 * ~(ℕℤ 1)⌝,
	⌜~(ℕℤ 1) * ℕℤ 1⌝,
	⌜~(ℕℤ 1) * ~(ℕℤ 1)⌝,
	⌜ℕℤ 0 * factor⌝,			(* 2 *)
	⌜ℕℤ 1 * factor⌝,			(* 3 *)
	⌜~(ℕℤ 1) * ~factor⌝,			(* 4 *)
	⌜~(ℕℤ 1) * factor⌝,			(* 5 *)
	⌜~(fac:ℤ) * ~tor⌝,			(* 6 *)
	⌜(fac:ℤ) * ~tor⌝			(* 7 *)
];
val rs3_1 = map (test_anf o ℤ_anf_conv) ts3_1;
store_mt_results (anf_results "anf.3.1" rs3_1) ();
val decorate1 = (fn (t1, t2) =>
	mk_ℤ_times(⌜tinker:ℤ *tailor⌝,
		mk_ℤ_times(mk_ℤ_times(t1, ⌜ℕℤ 99⌝),
				mk_ℤ_times(⌜ℕℤ 100*tailor*tinker⌝,
					mk_ℤ_times(t2,
						mk_ℤ_times(⌜soldier:ℤ⌝,
							(⌜ℕℤ 66⌝)))))));
val ts3_2 = map (decorate1 o dest_ℤ_times) ts3_1;
val rs3_2 = map (test_anf o ℤ_anf_conv) ts3_2;
store_mt_results (anf_results "anf.3.2" rs3_2) ();
val ts3_3 = map (decorate1 o swap o dest_ℤ_times) ts3_1;
val rs3_3 = map (test_anf o ℤ_anf_conv) ts3_3;
store_mt_results (anf_results "anf.3.3" rs3_3) ();
val ts3_4 = map (list_mk_dyop ⌜ℕℤ 1⌝ mk_ℤ_times o shuffle 4 o
			strip_dyop dest_ℤ_times) ts3_2;
val rs3_4 = map (test_anf o ℤ_anf_conv) ts3_4;
store_mt_results (anf_results "anf.3.4" rs3_4) ();
=TEX
\subsection{Case anf.4}
Treatment of atoms:
=SML
val ts4_1 = [
	⌜ℕℤ 1 + (λx⦁x) (ℕℤ 2 + ℕℤ 1)⌝,
	⌜(λx⦁x)(((x:ℤ) + y + z)*(x + y + z))⌝,
	⌜(λx⦁x)(((x:ℤ) + y + z))*(x + y + z)⌝
];
fun test_ANF_I (th : THM) : bool * string = (
	let	val (ok, s) = test_anf th;
		val ok2 = (
			MAP_C β_conv (snd (dest_eq(concl th))); false
		) handle Fail _ => true
	in	(ok andalso ok2, s)
	end
);
val rs4_1 = map (test_ANF_I o ℤ_ANF_C β_conv) ts4_1;
store_mt_results (anf_results "anf.4.1" rs4_1) ();
val ts4_2 = [
	⌜~(~(m:ℤ))⌝,					(* 1 *)
	⌜~(~(~(~(~(~(~(~(m:ℤ))))))))⌝,
	⌜~(~(~(~(~(~(~(~(~(m:ℤ)))))))))⌝,
	⌜~(m+n:ℤ)⌝,					(* 2 *)
	⌜~(~(~(~(~(m+n:ℤ)))))⌝,
	⌜~(m+n:ℤ)⌝,
	⌜~(m*n:ℤ)⌝,					(* 3 *)
	⌜(m-n:ℤ)⌝,					(* 4 *)
	⌜~(~((m-n:ℤ)))⌝,	
	⌜~(~((m- ~(ℕℤ 0):ℤ)))⌝			(* 5 *)	
];
val rs4_2 = map (test_anf o ℤ_anf_conv) ts4_2;
store_mt_results (anf_results "anf.4.2" rs4_2) ();

=TEX
\subsection{Case anf.5}
Arithmetic normaliser error cases.
=SML
store_mt_results_show mt_run_fail [
("anf.5.1", ℤ_ANF_C fail_conv, ⌜(a:ℤ) + b⌝,
		gen_fail_msg"ℤ_ANF_C" 105032 [string_of_term⌜(a:ℤ) + b⌝]),
("anf.5.2", ℤ_anf_conv, mk_f,
		gen_fail_msg"ℤ_anf_conv" 105032 [string_of_term mk_f]),
("anf.5.3", ℤ_ANF_C fail_conv, mk_t,
		gen_fail_msg"ℤ_ANF_C" 105032 [string_of_term mk_t]),
("anf.5.4", ℤ_anf_conv, ⌜ℕℤ 42⌝,
		gen_fail_msg"ℤ_anf_conv" 105032 [string_of_term⌜ℕℤ 42⌝])
];
=TEX
\subsection{Group la.1}
$ℤ\_lin\_arith\_rule$ (successful operation)
=SML
fun t (s, f, a) = (s, dest_thm o f, a, (a, mk_f));
store_mt_results_show (mt_runf (op ~=#) o map t) [
	("la.1.1", ℤ_lin_arith_rule,
		[⌜~ x ≤ ~(ℕℤ 1)⌝,
		⌜x + y + ~ z:ℤ = ℕℤ 0⌝,
		⌜y + ~z:ℤ = ℕℤ 0⌝]),
	("la.1.2", ℤ_lin_arith_rule,
		[⌜f(x, y) ≤ ℕℤ 0⌝,
		⌜~(g(x, y)) ≤ ℕℤ 0⌝,
		⌜~(f(x, y)) + g(x, y)  ≤ ~(ℕℤ 1)⌝])
];
store_mt_results_show (mt_runf (op ~=#) o map t) [
	("la.1.3", ℤ_lin_arith_rule,
		[⌜a + b = ℕℤ 0⌝, ⌜a = ℕℤ 1⌝, ⌜b = ℕℤ 1⌝]),
	("la.1.4", ℤ_lin_arith_rule,
		[⌜a*a + b = ℕℤ 0⌝, ⌜~a*a ≤ ~(ℕℤ 1)⌝, ⌜~b ≤ ~(ℕℤ 1)⌝])
];

=TEX
\subsection{Group la.2}
$ℤ\_lin\_arith\_rule$ (error cases).

N.b. these generate message on the standard output as well as just raising
exceptions.
=SML
store_mt_results_show mt_run_fail [
	("la.2.1", ℤ_lin_arith_rule,
		[⌜X ≤ ℕℤ 0⌝],
		gen_fail_msg"ℤ_lin_arith_rule" 82110 []),
	("la.2.3", ℤ_lin_arith_rule,
		[],
		gen_fail_msg"ℤ_lin_arith_rule" 82111 []),
	("la.2.4", ℤ_lin_arith_rule,
		[⌜f(a, b) + g(x, y):ℤ⌝],
		gen_fail_msg"ℤ_lin_arith_rule" 105112 [])
];
=TEX
\subsection{Group la.3}
$lin\_arith\_tac$ (successful operation)
=SML
fun check_tac (tac, gl) = (
	set_goal gl;
	a tac;
	(dest_thm o pop_thm) () ~=# gl
);
=TEX
=SML
store_mt_results_show mt_run [
("la.3.1", check_tac,
	(ℤ_lin_arith_tac, ([⌜a*a + b = ℕℤ 0⌝,
		⌜~a*a ≤ ~(ℕℤ 1)⌝, ⌜~b ≤ ~(ℕℤ 1)⌝], mk_f)), true)
];
=TEX
\subsection{Group la.4}
$lin\_arith\_tac$ (error cases)
=SML
store_mt_results_show mt_run_fail [
("la.4.1", ℤ_lin_arith_tac, ([⌜ℕℤ 1 + x  ≤ ℕℤ 0⌝], mk_f),
		gen_fail_msg"ℤ_lin_arith_tac" 82110 [])
];
=TEX
\subsection{Group pc.1}
The proof contexts (successful operation)
=SML
store_mt_results_show mt_run [
("pc.1.1.1", check_tac,
	(PC_T1"ℤ_lin_arith"asm_prove_tac[], ([], ⌜x + y ≤ y ⇒ x ≤ ℕℤ 0⌝)), true),
("pc.1.1.2", check_tac,
	(PC_T1"ℤ_lin_arith"asm_prove_tac[], ([], ⌜¬∃x y:ℤ⦁x > ℕℤ 0 ∧ x + a + b + y < b + y + a⌝)), true)
];
=TEX
Now try the examples from the detailed design for the natural numbers version:
=SML
store_mt_results_show mt_run [
("pc.1.2.1", check_tac, (PC_T1"ℤ_lin_arith"prove_tac[],
		([], ⌜∀a b c:ℤ⦁a ≤ b ∧ (a + b < c + a) ⇒ a < c⌝)
			), true),
("pc.1.2.2", check_tac, (PC_T1"ℤ_lin_arith"prove_tac[],
	([], ⌜∀a b c:ℤ⦁a ≥ b ∧ ¬ b < c ⇒ a ≥ c⌝)
			), true),
("pc.1.2.3", check_tac, (PC_T1"ℤ_lin_arith"prove_tac[],
	([], ⌜∀a b c:ℤ⦁a + ℕℤ 2*b < ℕℤ 2*a ⇒ b + b < a⌝)
			), true),
("pc.1.2.4", check_tac, (PC_T1"ℤ_lin_arith"prove_tac[],
	([], ⌜∀ x y:ℤ⦁ ¬ (ℕℤ 2*x + y = ℕℤ 4 ∧ℕℤ  4*x + ℕℤ 2*y = ℕℤ 7)⌝)
			), true)
];
=TEX
Now try out the component proof context:
=SML
new_parent"sets";
store_mt_results_show mt_run [
("pc.1.3.1", check_tac, (MERGE_PCS_T1["sets_ext", "'ℤ_lin_arith"]prove_tac[],
	([], ⌜∀m:ℤ⦁ {i | m ≤ i ∧ i < m+ ℕℤ 3} = {m; m+ ℕℤ 1; m+ ℕℤ 2}⌝)
			), true),
("pc.1.3.2", check_tac, (MERGE_PCS_T1["sets_ext", "'ℤ_lin_arith"]prove_tac[],
	([], ⌜{(i, j) | ℕℤ 30*i = ℕℤ 105*j} = {(i, j) | ℕℤ 2*i = ℕℤ 7*j}⌝)
			), true),
("pc.1.3.3", check_tac, (MERGE_PCS_T1["sets_ext", "'ℤ_lin_arith"]prove_tac[],
	([], ⌜{i | ℕℤ 5*i = ℕℤ 6*i} = {ℕℤ 0}⌝)
			), true)
];
=TEX
Now a case to show that the arguments to the automatic proof tactic are
not ignored.
=SML
ⓈHOLCONST
│	q : ℤ → ℤ → ℤ
├
│	∀i j:ℤ⦁ q i j = i - j + ℕℤ 1
■
=SML
store_mt_results_show mt_run [
("pc.1.5.1", check_tac, (
	REPEAT strip_tac THEN PC_T1"ℤ_lin_arith"asm_prove_tac
	[list_∀_elim[⌜x:ℤ⌝, ⌜y:ℤ⌝] (get_spec⌜q⌝)],
	([], ⌜∀x y⦁ q x y ≥ ℕℤ 1 ⇒ x ≥ y⌝)
			), true)
];
=TEX
Check the rewriting, using the examples from the detailed design:
=SML
fun check_pc_1_6 t1 t2 = (
	let	val (l, r) = (dest_⇔ o concl o PC_C1"ℤ_lin_arith"rewrite_conv[]) t1;
	in	l =$ t1 andalso r =$ t2
	end
);
=SML
store_mt_results_show mt_run [
("pc.1.6.1", check_pc_1_6 ⌜¬x + ℕℤ 2*y + x + ℕℤ 3 = y + ℕℤ 2 + ℕℤ 2*x + y⌝, ⌜T⌝, true),
("pc.1.6.2", check_pc_1_6 ⌜x + ℕℤ 2*y + x + ℕℤ 3 ≤ y + ℕℤ 2 + ℕℤ 2*x + y⌝, ⌜F⌝, true)
];
=TEX
\subsection{Group pc.2}
The proof contexts (error cases)
=SML
store_mt_results_show mt_run_fail [
("pc.2.1", PC_T1"ℤ_lin_arith"asm_prove_tac[], ([⌜x + y ≤ y:ℤ⌝, ⌜ℕℤ 1 ≤ y⌝], mk_f),
		gen_fail_msg"ℤ_lin_arith_prove_tac" 82200
			[get_message(fail "ℤ_lin_arith_tac" 82110 [] handle Fail msg => msg),
			string_of_term ⌜F⌝])
];
=TEX

=TEX
\section{SUMMARY OF RESULTS}
=SML
diag_string(summarize_mt_results());
=TEX

\end{document}



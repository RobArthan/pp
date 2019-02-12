=IGN
********************************************************************************
imp057.doc: this file is part of the PPHol system

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

\def\Title{Implementation of Computational Conversions}

\def\AbstractText{This document contains the implementation of conversions which perform arithmetic computations on literals.}

\def\Reference{DS/FMU/IED/IMP057}

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
\def\Hide#1{}
%% LaTeX2e port: \def\Bool{``$\it{:}bool\,$''}
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{FST PROJECT}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Implementation of Computational Conversions}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP057}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.17 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2002/10/17 16:20:01 $%
%% LaTeX2e port: }}  %% Mandatory field (with sensible default)
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{R.D.~Arthan & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.B.Jones & HAT Team Leader}
%% LaTeX2e port: \TPPabstract{This document contains the implementation of conversions
%% LaTeX2e port: which perform arithmetic computations on literals.}
%% LaTeX2e port: %\TPPabstractB{}
%% LaTeX2e port: %\TPPabstractC{}
%% LaTeX2e port: %\TPPabstractD{}
%% LaTeX2e port: %\TPPabstractE{}
%% LaTeX2e port: %\TPPabstractF{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	Library}}
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
\item [Issue 1.4 (1992/03/06)\ (\FormatDate{91/10/16%
})]
First drafts.
\item [Issue 1.5 (1992/03/26),1.6 (1992/03/26) (26th March 1992)]
Changed to use proof context material of issue 1.13 of \cite{DS/FMU/IED/DTD051}.
Now work in theory ``$basic\_hol$'', not ``$ℕ$'' and ``$char$''.
\item [Issue 1.7 (1992/04/14) (14th April 1992)]
Changes due to CR0017.
\item [Issue 1.8 (1992/05/12),1.9 (1992/05/13) (12th May 1992)]
Changed theory.
\item [Issue 1.10 (1992/05/14) (14th May 1992)]
Tidying up proof contexts.
\item [Issue 1.11 (1992/05/18) (18th May 1992)]
Changed proof context material.
\item [Issue 1.12 (1992/05/21) (20th May 1992)]
Removed proof context "comp".
\item [Issue 1.13 (1992/06/02) (2nd June 1992)]
Changed ``native'' theory.
\item[Issue 1.14 (1992/06/24) (24th June 1992)]
Renamings from issue 1.6 of \cite{DS/FMU/IED/WRK038},
mostly proof context name changes.
\item[Issue 1.15 (1999/03/06)] Update for new INTEGER type.
\item[Issue 1.16 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.17 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.18 (2006/01/03)] Performance tweak in {\em times\_conv}.
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
This document implements the material whose detailed design is given
in \cite{DS/FMU/IED/DTD057}.
\subsection{Introduction}
\subsubsection{Purpose and Background}
See \cite{DS/FMU/IED/DTD057}.
\subsubsection{Dependencies}
This document depends on the theory and proof procedures defined
in \cite{DS/FMU/IED/DTD038,DS/FMU/IED/IMP038} and on the proof context defined
in \cite{DS/FMU/IED/DTD029,DS/FMU/IED/IMP029}.
\subsubsection{Algorithms}
The implementation begins with some miscellaneous functions which
are used throughout the sequel. Thereafter,
for ease of development and maintenance, the conversions are implemented
following a standard pattern: for each
conversion we first prove one or
more theorems which capture the essence of the arithmetic computation
to be supported; then we define an auxiliary function which is parameterised
by the operands of the operation to be computed; and, finally we define
an interface function which calls the auxiliary, handles errors and
does any additional error-case detection which is not covered by the
auxiliary. The only exceptions are $gt\_conv$ and
$ge\_conv$ which are able to use the auxiliary functions supporting
$lt\_conv$ and $le\_conv$ fairly directly after rewriting the argument
term with the appropriate definition.

This style of implementation has the additional benefit that by formulating
the supporting theorems so as to minimise the amount of inference required
to use them, the resulting implementations can be made quite efficient.
\subsubsection{Possible Enhancements}
None known.
\subsubsection{Deficiencies}
None known.
\section{PROLOGUE}
=SML
structure ⦏CompConv⦎  : CompConv = struct
val ⦏old_theory⦎ = get_current_theory_name();
=TEX
\section{ARITHMETIC}
=SML
val ⦏side_effect⦎ = open_theory"basic_hol";
val _ = push_merge_pcs ["'propositions",
	"'simple_abstractions"];
=TEX
\subsection{DERIVED SYNTAX FUNCTIONS}
=SML
val ⦏dest_≤⦎ : TERM -> TERM*TERM = dest_bin_op "dest_≤" 57501 "≤";
val ⦏dest_≥⦎ : TERM -> TERM*TERM = dest_bin_op "dest_≥" 57502 "≥";
val ⦏dest_div⦎ : TERM -> TERM*TERM = dest_bin_op "dest_div" 57503 "Div";
val ⦏dest_greater⦎ : TERM -> TERM*TERM = dest_bin_op "dest_greater" 57504 ">";
val ⦏dest_less⦎ : TERM -> TERM*TERM = dest_bin_op "dest_less" 57505 "<";
val ⦏dest_minus⦎ : TERM -> TERM*TERM = dest_bin_op "dest_minus" 57506 "-";
val ⦏dest_mod⦎ : TERM -> TERM*TERM = dest_bin_op "dest_mod" 57507 "Mod";
val ⦏dest_plus⦎ : TERM -> TERM*TERM = dest_bin_op "dest_plus" 57508 "+";
val ⦏dest_times⦎ : TERM -> TERM*TERM = dest_bin_op "dest_times" 57509 "*";
=TEX
=SML
val ⦏is_≤⦎ : TERM -> bool = is_bin_op "≤";
val ⦏is_≥⦎ : TERM -> bool = is_bin_op "≥";
val ⦏is_div⦎ : TERM -> bool = is_bin_op "Div";
val ⦏is_greater⦎ : TERM -> bool = is_bin_op ">";
val ⦏is_less⦎ : TERM -> bool = is_bin_op "<";
val ⦏is_minus⦎ : TERM -> bool = is_bin_op "-";
val ⦏is_mod⦎ : TERM -> bool = is_bin_op "Mod";
val ⦏is_plus⦎ : TERM -> bool = is_bin_op "+";
val ⦏is_times⦎ : TERM -> bool = is_bin_op "*";
=TEX
N.b. Care has been taken in the following to ensure that all the
parser calls are made at compile-time.
=SML
fun ⦏rator_ty⦎ ty = (mk_→_type(ⓣℕ⌝, mk_→_type(ⓣℕ⌝, ty)));
fun ⦏rator_fn⦎ (nm : string) (ty : TYPE) : TYPE -> TYPE -> TERM = (
	let val act_ty = rator_ty ty;
	in	(fn _ => fn _ => mk_const (nm, act_ty))
	end
);
=TEX
=SML
val ⦏mk_≤⦎ : TERM*TERM -> TERM =
	mk_bin_op "mk_≤" 57510 57511 (rator_fn"≤"ⓣBOOL⌝);
val ⦏mk_≥⦎ : TERM*TERM -> TERM =
	mk_bin_op "mk_≥" 57510 57511 (rator_fn"≥"ⓣBOOL⌝);
val ⦏mk_div⦎ : TERM*TERM -> TERM =
	mk_bin_op "mk_div" 57510 57511 (rator_fn"Div"ⓣℕ⌝);
val ⦏mk_greater⦎ : TERM*TERM -> TERM =
	mk_bin_op "mk_greater" 57510 57511 (rator_fn">"ⓣBOOL⌝);
val ⦏mk_less⦎ : TERM*TERM -> TERM =
	mk_bin_op "mk_less" 57510 57511 (rator_fn"<"ⓣBOOL⌝);
val ⦏mk_minus⦎ : TERM*TERM -> TERM =
	mk_bin_op "mk_minus" 57510 57511 (rator_fn"-"ⓣℕ⌝);
val ⦏mk_mod⦎ : TERM*TERM -> TERM =
	mk_bin_op "mk_mod" 57510 57511 (rator_fn"Mod"ⓣℕ⌝);
val ⦏mk_plus⦎ : TERM*TERM -> TERM =
	mk_bin_op "mk_plus" 57510 57511 (rator_fn"+"ⓣℕ⌝);
val ⦏mk_times⦎ : TERM*TERM -> TERM =
	mk_bin_op "mk_times" 57510 57511 (rator_fn"*"ⓣℕ⌝);
=TEX
\subsection{MISCELLANEOUS FUNCTIONS}
=SML
fun term_divert (ex : exn)
		(fromarea : string)
		(toarea : string)
		(msg : int)
		(tms : TERM list) : 'a = (
	divert ex fromarea toarea msg (map (fn t => (fn () => string_of_term t)) tms)
);
=SML
val ⦏LEFT_C⦎ =  RATOR_C o RAND_C;
val ⦏RIGHT_C⦎ = RAND_C;
val ⦏RANDS_C⦎ = APP_C o (RAND_C ** Combinators.I);
=TEX
These functions do not do any error handling, it is the caller's
responsibility to ensure that arguments are in range.
=SML
val ⦏hol_one⦎ = ⌜1⌝;
=TEX
$aux\_conv1$ proves any theorem of the form $x = q + q$, where
$x$ and $q$ are numeric literals. It is caller's responsibility
to supply an even $x$.
=SML
val two = @@"2";
val ⦏aux_conv1⦎ : CONV = (fn tm =>
	let	val x = dest_ℕ tm;
		val xdiv2 = mk_ℕ(x idiv two);
	in	eq_sym_rule
		(plus_conv (mk_plus(xdiv2, xdiv2)))
	end
);
=TEX
=SML
val ⦏list_⇒_mp_rule⦎ = revfold (uncurry(switch ⇒_mp_rule));
=TEX
=IGN
list_⇒_mp_rule [asm_rule⌜A:BOOL⌝, asm_rule⌜B:BOOL⌝, asm_rule⌜C:BOOL⌝]
	(asm_rule⌜A ⇒ B ⇒ C ⇒ D⌝);
=TEX
\subsection{RELATIONS}
\subsubsection{≤}
We use the following lemmas to assist in $le\_conv$:
=SML
val ⦏≤_t_lemma⦎ = tac_proof(
	([], ⌜∀x y a⦁x + a = y ⇒ (x ≤ y ⇔ T)⌝),
	REPEAT strip_tac THEN rewrite_tac[≤_def]
	THEN ∃_tac⌜a:ℕ⌝ THEN asm_rewrite_tac[]);
=TEX
=SML
val ⦏≤_f_lemma⦎ = tac_proof(
	([], ⌜∀x y a⦁y + a + 1 = x ⇒ (x ≤ y ⇔ F)⌝),
	rewrite_tac[¬_≤_thm, less_def, ≤_def] THEN REPEAT strip_tac
	THEN ∃_tac⌜a:ℕ⌝ THEN POP_ASM_T (rewrite_thm_tac o eq_sym_rule)
	THEN rewrite_tac[plus_clauses, plus_assoc_thm]);
=TEX
=SML
fun ⦏≤_conv_aux⦎ (tmx : TERM) (tmy : TERM) = (
	let	val x = dest_ℕ tmx;
		val y = dest_ℕ tmy;
	in	if x @<= y
		then	let	val a = y @- x;
				val tma = mk_ℕ a;
				val thm1 = plus_conv(mk_plus(tmx, tma));
				val thm2 = list_∀_elim[tmx, tmy, tma]
						≤_t_lemma;
			in	⇒_mp_rule thm2 thm1
		end else let	val a = x @- (y @+ one);
				val tma = mk_ℕ a;
				val thm1 = (RAND_C plus_conv THEN_C plus_conv)
					(mk_plus(tmy, mk_plus(tma, hol_one)));
				val thm2 = list_∀_elim[tmx, tmy, tma]
						≤_f_lemma;
			in	⇒_mp_rule thm2 thm1
		end
	end
);
=TEX
=IGN
val ⦏tmx⦎ = ⌜10⌝;
val ⦏tmy⦎ = ⌜20⌝;
=SML
val ⦏≤_conv⦎ : CONV = (fn aopb =>
	let	val (a, b) = dest_bin_op "≤_conv" 57001  "≤" aopb;
	in	≤_conv_aux  a b
	end	handle ex => term_divert ex "dest_ℕ" "≤_conv" 57001 [aopb]
);
=TEX
\subsubsection{$<$}
We use the following lemmas to assist in $le\_conv$:
=SML
val ⦏less_t_lemma⦎ = tac_proof(
	([], ⌜∀x y a⦁x + a + 1 = y ⇒ (x < y ⇔ T)⌝),
	rewrite_tac[less_def, ≤_def] THEN REPEAT strip_tac
	THEN ∃_tac⌜a:ℕ⌝ THEN POP_ASM_T (rewrite_thm_tac o eq_sym_rule)
	THEN rewrite_tac[plus_clauses, plus_assoc_thm]);
=TEX
=SML
val ⦏less_f_lemma⦎ = tac_proof(
	([], ⌜∀x y a⦁y + a = x ⇒ (x < y ⇔ F)⌝),
	rewrite_tac[¬_less_thm, ≤_def] THEN REPEAT strip_tac
	THEN ∃_tac⌜a:ℕ⌝ THEN POP_ASM_T (rewrite_thm_tac o eq_sym_rule)
	THEN rewrite_tac[plus_clauses, plus_assoc_thm]);
=TEX
=SML
fun ⦏less_conv_aux⦎ (tmx : TERM) (tmy : TERM) = (
	let	val x = dest_ℕ tmx;
		val y = dest_ℕ tmy;
	in	if x @< y
		then	let	val a = y @- (x @+ one);
				val tma = mk_ℕ a;
				val thm1 = (RAND_C plus_conv THEN_C plus_conv)
					(mk_plus(tmx, mk_plus(tma, hol_one)));
				val thm2 = list_∀_elim[tmx, tmy, tma]
						less_t_lemma;
			in	⇒_mp_rule thm2 thm1
		end else let	val a = x @- y;
				val tma = mk_ℕ a;
				val thm1 = plus_conv(mk_plus(tmy, tma));
				val thm2 = list_∀_elim[tmx, tmy, tma]
						less_f_lemma;
			in	⇒_mp_rule thm2 thm1
		end
	end
);
=TEX
=SML
val ⦏less_conv⦎ : CONV = (fn aopb =>
	let	val (a, b) = dest_bin_op "less_conv" 57005  "<" aopb;
	in	less_conv_aux  a b
	end	handle ex => term_divert ex "dest_ℕ" "less_conv" 57005 [aopb]
);
=TEX
\subsubsection{≥}
=SML
val ⦏≥_conv⦎ : CONV = (fn aopb =>
	let	val check = dest_bin_op "≥_conv" 57002  "≥" aopb;
	in	(eq_match_conv ≥_def THEN_C ≤_conv) aopb
	end	handle ex => term_divert ex "≤_conv" "≥_conv" 57002 [aopb]
);
=TEX
\subsubsection{$>$}
=SML
val ⦏greater_conv⦎ : CONV = (fn aopb =>
	let	val check = dest_bin_op "greater_conv" 57004  ">" aopb;
	in	(eq_match_conv greater_def THEN_C less_conv) aopb
	end	handle ex => term_divert ex "less_conv" "greater_conv" 57004 [aopb]
);
=TEX
\subsubsection{Numerical Equality}
=SML
=TEX
=SML
val ⦏ℕ_eq_lemma1⦎ = tac_proof(
	([], ⌜∀x y⦁x < y ⇒ (x = y ⇔ F)⌝),
	REPEAT strip_tac
	THEN asm_ante_tac ⌜x < y⌝
	THEN asm_rewrite_tac[]
	THEN strip_asm_tac (list_∀_elim[⌜y:ℕ⌝, ⌜y:ℕ⌝] less_irrefl_thm)
);
=TEX
=SML
val ⦏ℕ_eq_lemma2⦎ = tac_proof(
	([], ⌜∀x y⦁y < x ⇒ (x = y ⇔ F)⌝),
	REPEAT strip_tac
	THEN strip_asm_tac (list_∀_elim[⌜y:ℕ⌝, ⌜x:ℕ⌝] ℕ_eq_lemma1)
	THEN asm_ante_tac⌜¬ (y:ℕ) = x⌝
	THEN asm_rewrite_tac[]
);
=TEX
=SML
fun ⦏ℕ_eq_conv_aux⦎ (tmx : TERM) (tmy : TERM) = (
	let	val x = dest_ℕ tmx;
		val y = dest_ℕ tmy;
	in	if x = y
		then	⇔_t_intro(refl_conv tmx)
		else if x @< y
		then let	val thm1 = ⇔_t_elim(less_conv_aux tmx tmy);
				val thm2 = list_∀_elim[tmx, tmy]
						ℕ_eq_lemma1;
			in	⇒_mp_rule thm2 thm1
		end else let	val thm1 = ⇔_t_elim(less_conv_aux tmy tmx);
				val thm2 = list_∀_elim[tmx, tmy]
						ℕ_eq_lemma2;
			in	⇒_mp_rule thm2 thm1
		end
	end
);
=TEX
=SML
val ⦏ℕ_eq_conv⦎ : CONV = (fn aopb =>
	let	val (a, b) = dest_bin_op "ℕ_eq_conv" 57100  "=" aopb;
	in	ℕ_eq_conv_aux  a b
	end	handle ex => term_divert ex "dest_ℕ" "ℕ_eq_conv" 57100 [aopb]
);
=TEX
\subsection{ADDITION}
This is quite easy!
=SML
val ⦏plus_conv⦎ = DerivedRules1.plus_conv;
=TEX
\subsection{SUBTRACTION}
\subsubsection{Lemma}
=SML
val ⦏minus_lemma⦎ = tac_proof(
	([], ⌜∀x y a⦁a + y = x ⇒ (x - y = a)⌝),
	REPEAT strip_tac THEN POP_ASM_T (rewrite_thm_tac o eq_sym_rule)
	THEN rewrite_tac[minus_def]);
=TEX
=SML
fun ⦏minus_conv_aux⦎ (aopb :TERM) (tmx : TERM) (tmy : TERM) = (
	let	val x = dest_ℕ tmx;
		val y = dest_ℕ tmy;
	in	if x @>= y
		then	let	val a = x @- y;
				val tma = mk_ℕ a;
				val thm1 = plus_conv(mk_plus(tma, tmy));
				val thm2 = list_∀_elim[tmx, tmy, tma]
						minus_lemma;
			in	⇒_mp_rule thm2 thm1
		 end else 	term_fail "minus_conv" 57010 [aopb]
	end
);
=TEX
=SML
val ⦏minus_conv⦎ : CONV = (fn aopb =>
	let	val (a, b) = dest_bin_op "minus_conv" 57006  "-" aopb;
	in	minus_conv_aux aopb a b
	end	handle ex => term_divert ex "dest_ℕ" "minus_conv" 57006 [aopb]
);
=TEX
\subsection{MULTIPLICATION}
\subsubsection{Lemmas}
=SML
val ⦏times_0_x⦎ = tac_proof(([], ⌜∀x⦁0 * x = 0⌝), rewrite_tac[times_clauses]);
val ⦏times_1_x⦎ = tac_proof(([], ⌜∀x⦁1 * x = x⌝), rewrite_tac[times_clauses]);
=TEX
\subsubsection{The Multiplier}
Our algorithm computes $x * y$ by iterated halving of the first operand, so we first interchange $x$ and $y$ if necessary to give $x \le y$ to minimise the number of iterations.
We then compute $x * y$ where $x > 1$ is even as follows:
=GFT Example
1.	⊢ x = a + a			aux_conv1
2.	⊢ x*y = (a + a)*y		1
3.	⊢ (a + a)*y = a*y + a*y	2, distributivity
4.	⊢ a*y = z			recursive call
5.	⊢ a*y + a*y = z + z		4
6.	⊢ u = z + z			aux_conv1
7.	⊢ x*y = u			2, 3, 5, 6
=TEX
If $x > 1$ is odd we work as follows:
=GFT Example
1.	⊢ x = b + 1			plus1_conv
2.	⊢ b*y = z			recursive call
3.	⊢ x*y = (b + 1)*y		1
4.	⊢ (b + 1)*y = b*y + 1*y		3, distributivity
5.	⊢ b*y + 1*y = z + y		2, times_1_x
6.	⊢ z + y = u			plus_conv
7.	⊢ x*y = u			3, 4, 5, 6
=TEX
=TEX
We capture the above arguments in two theorems:
=SML
val ⦏evenx_times_y_thm⦎ = (
push_goal([],⌜∀x y a z u⦁
		x = a + a
	⇒	a * y = z
	⇒	u = z + z
	⇒	x * y = u⌝);
a(REPEAT strip_tac);
a(asm_rewrite_tac[times_plus_distrib_thm]);
pop_thm()
);
=TEX
=SML
val ⦏oddx_times_y_thm⦎ = (
push_goal([],⌜∀x y b z u⦁
		x = b + 1
	⇒	b * y = z
	⇒	z + y = u
	⇒	x * y = u⌝);
a(REPEAT strip_tac);
a(asm_rewrite_tac[times_plus_distrib_thm, times_clauses]);
pop_thm()
);
=TEX
=SML
fun ⦏times_conv_aux⦎ (x : INTEGER) (y : INTEGER) = (
let	val tmy = mk_ℕ y;
	fun aux x = (
		case string_of_integer x of
			"0" => ∀_elim tmy times_0_x
		|	"1" => ∀_elim tmy times_1_x
		|	_ =>
			if x imod two = zero
			then	let	val a = x idiv two;
					val z = a @* y;
					val u = z @+ z;
					val tmx = mk_ℕ x;
					val tma = mk_ℕ a;
					val tmz = mk_ℕ z;
					val tmu = mk_ℕ u;
					val thm1 = aux_conv1 tmx;
					val thm2 = aux a;
					val thm3 = aux_conv1 tmu
				in	list_⇒_mp_rule [thm1, thm2, thm3]
					(list_∀_elim[tmx, tmy, tma, tmz, tmu]
					evenx_times_y_thm)
			end else let	val b = x @- one;
					val z = b @* y;
					val u = z @+ y;
					val tmx = mk_ℕ x;
					val tmb = mk_ℕ b;
					val tmz = mk_ℕ z;
					val tmu = mk_ℕ u;
					val thm1 = plus1_conv tmx;
					val thm2 = aux b;
					val thm3 = plus_conv (mk_plus(tmz, tmy))
				in	list_⇒_mp_rule [thm1, thm2, thm3]
					(list_∀_elim[tmx, tmy, tmb, tmz, tmu]
					oddx_times_y_thm)
				end
	);
in	aux x
end
);
=TEX
=SML
val ⦏times_conv⦎ : CONV = (fn aopb =>
	let	val (tmx, tmy) = dest_bin_op "times_conv" 57009  "*" aopb;
		val x = dest_ℕ tmx;
		val y = dest_ℕ tmy;

	in	if	x @<= y
		then	times_conv_aux x y
		else	let	val thm1 = list_∀_elim[tmx, tmy] times_comm_thm;
				val thm2 = times_conv_aux y x;
			in	eq_trans_rule thm1 thm2
			end
	end	handle ex => term_divert ex "dest_ℕ" "times_conv" 57009 [aopb]
);
=IGN
fun test_times (m : int) (n : int) = (
	let	val range = interval m n;
		fun aux1 i j = list_mk_app(⌜$*⌝, [mk_ℕ i, mk_ℕ j]);
		fun aux2 i = map (aux1 i) range;
		val tab = map aux2 range;
	in	map (map times_conv) tab
	end
);
=TEX
\subsection{DIVISION AND MODULUS}
\subsubsection{Lemmas}
=SML
val ⦏div_lemma⦎ = (
push_goal([], ⌜∀x y d r⦁ r < y ⇒ d * y + r = x ⇒ x Div y = d⌝);
a(conv_tac (ONCE_MAP_C eq_sym_conv) THEN REPEAT strip_tac);
a(strip_asm_tac(list_∀_elim[⌜x⌝, ⌜y⌝, ⌜d⌝, ⌜r⌝]div_mod_unique_thm));
pop_thm()
);
=TEX
=SML
val ⦏mod_lemma⦎ = (
push_goal([], ⌜∀x y d r⦁ r < y ⇒ d * y + r = x ⇒ x Mod y = r⌝);
a(conv_tac (ONCE_MAP_C eq_sym_conv) THEN REPEAT strip_tac);
a(strip_asm_tac(list_∀_elim[⌜x⌝, ⌜y⌝, ⌜d⌝, ⌜r⌝]div_mod_unique_thm));
pop_thm()
);
=TEX
\subsection{The Divider}
=SML
fun ⦏div_mod_conv_aux⦎ (thm : THM) (tmx : TERM) (tmy : TERM) : THM OPT = (
	let	val x = dest_ℕ tmx;
		val y = dest_ℕ tmy;
	in	if y <> zero
		then	let	val d = x idiv y;
				val r = x imod y;
				val tmd = mk_ℕ d;
				val tmr = mk_ℕ r;
				val thm1 = ⇔_t_elim(less_conv(mk_less(tmr, tmy)));
				val thm2 =
	(RATOR_C(RAND_C times_conv) THEN_C plus_conv)
					(mk_plus(mk_times(tmd, tmy), tmr));
				val thm3 = list_∀_elim[tmx, tmy, tmd, tmr]
						thm;
			in	Value(list_⇒_mp_rule [thm1, thm2] thm3)
		 end else 	Nil
	end
);
=TEX
=SML
val ⦏div_conv⦎ : CONV = (fn aopb =>
	let	val (a, b) = dest_bin_op "div_conv" 57003  "Div" aopb;
	in	case div_mod_conv_aux div_lemma a b of
			Value thm => thm
		|	Nil => term_fail "div_conv" 57011 [aopb]
	end	handle ex => term_divert ex "dest_ℕ" "div_conv" 57003 [aopb]
);
=TEX
=SML
val ⦏mod_conv⦎ : CONV = (fn aopb =>
	let	val (a, b) = dest_bin_op "mod_conv" 57007  "Mod" aopb;
	in	case div_mod_conv_aux mod_lemma a b of
			Value thm => thm
		|	Nil => term_fail "mod_conv" 57012 [aopb]
	end	handle ex => term_divert ex "dest_ℕ" "mod_conv" 57007 [aopb]
);
=TEX
\section{CHARACTERS}
\subsection{Lemma}
=SML
val ⦏char_lemma⦎ = (
	push_goal([], ⌜∀c d : CHAR; x y : ℕ⦁
		c = AbsChar x ⇒ d = AbsChar y ⇒ x < 256 ⇒ y < 256 ⇒
			(c = d ⇔ x = y)⌝);
a(REPEAT strip_tac THEN TRY_T(asm_rewrite_tac[]));
a(LEMMA_T ⌜x = RepChar c ∧ y = RepChar d⌝ rewrite_thm_tac);
a(strip_asm_tac(∀_elim⌜x⌝(rewrite_rule[is_char_rep_def]
	(∧_right_elim abs_char_rep_char_def))));
a(strip_asm_tac(∀_elim⌜y⌝(rewrite_rule[is_char_rep_def]
	(∧_right_elim abs_char_rep_char_def))));
a(LIST_DROP_NTH_ASM_T [1, 2, 6, 7] rewrite_tac);
a(POP_ASM_T rewrite_thm_tac);
pop_thm()
);
=TEX
\subsection{The Conversion}
=SML
val lit256 = ⌜256⌝;

fun ⦏char_eq_conv_aux⦎ (tmc : TERM) (tmd : TERM) = (
	let	val thm1 = char_conv tmc;
		val thm2 = char_conv tmd;
		val tmx = snd(dest_app(snd(dest_eq(concl thm1))));
		val tmy = snd(dest_app(snd(dest_eq(concl thm2))));
		val thm3 = ⇔_t_elim(less_conv (mk_less(tmx, lit256)));
		val thm4 = ⇔_t_elim(less_conv (mk_less(tmy, lit256)));
	in	list_⇒_mp_rule [thm1, thm2, thm3, thm4]
		(list_∀_elim[tmc, tmd, tmx, tmy] char_lemma)
	end
);
=TEX
=SML
val ⦏char_eq_aux_conv⦎ : CONV = (fn aopb =>
	let	val (a, b) = dest_bin_op "char_eq_conv" 57200  "=" aopb;
	in	char_eq_conv_aux a b
	end	handle ex => term_divert ex "char_conv" "char_eq_conv" 57200 [aopb]
);
=TEX
=SML
val ⦏char_eq_conv⦎ : CONV = char_eq_aux_conv THEN_C ℕ_eq_conv;
=TEX
\section{STRINGS}
=SML
val ⦏blipa⦎ = ⓣ'a⌝;
=TEX
=SML
val ⦏string_lemma1⦎ = tac_proof( ([], ⌜"" = "" ⇔ T⌝), rewrite_tac[]);
=TEX
=SML
val ⦏string_lemma2⦎ = (
	push_goal([], ⌜∀x; t⦁"" = Cons x t ⇔ F⌝);
a(rewrite_tac[list_clauses, string_conv ⌜""⌝]);
pop_thm()
);
=TEX
=SML
val ⦏string_lemma3⦎ = (
	push_goal([], ⌜∀x; t⦁Cons x t = "" ⇔ F⌝);
a(rewrite_tac[list_clauses, string_conv ⌜""⌝]);
pop_thm()
);
=TEX
=SML
val ⦏string_lemma4⦎ = (
	push_goal([], ⌜∀x y: CHAR; t u⦁Cons x t = Cons y u ⇔ x = y ∧ t = u⌝);
a(rewrite_tac[list_clauses]);
pop_thm()
);
=TEX
=SML
val ⦏string_lemma5⦎ = tac_proof( ([], ⌜∀q⦁F ∧ q ⇔ F⌝), rewrite_tac[]);
=TEX
=SML
val ⦏string_lemma6⦎ = tac_proof( ([], ⌜∀q⦁T ∧ q ⇔ q⌝), rewrite_tac[]);
val rec ⦏string_eq_conv⦎ : CONV = (fn tm =>
	let	val (tmx, tmy) = dest_bin_op "string_eq_conv" 57300  "=" tm;
	in	case (dest_string tmx, dest_string tmy) of
			("", "") => (string_lemma1
		) |	("", _) => (
			(RIGHT_C string_conv THEN_C eq_match_conv string_lemma2) tm
		) |	(_, "") => (
			(LEFT_C string_conv THEN_C eq_match_conv string_lemma3)tm
		) |	(_, _) => (
			(	RANDS_C(string_conv, string_conv)
			THEN_C	eq_match_conv string_lemma4
			THEN_C LEFT_C char_eq_conv
			THEN_C (	eq_match_conv string_lemma5
				ORELSE_C	(eq_match_conv string_lemma6
					THEN_C string_eq_conv))) tm
		)
	end
	handle ex => term_divert ex "dest_string" "string_eq_conv" 57300 [tm]
);
=TEX

\section{EPILOGUE}
=SML
val ⦏side_effect⦎ = open_theory old_theory;
val _ = pop_pc();
end; (* of structure CompConv *)
open CompConv;
=TEX
\twocolumn[\section{INDEX}]\label{Index}
\printindex
\end{document}
=IGN
fun test_div (m : int) (n : int) = (
	let	val range = interval m n;
		fun aux1 i j = list_mk_app(⌜$Div⌝, [mk_ℕ i, mk_ℕ j]);
		fun aux2 i = map (aux1 i) range;
		val tab = map aux2 range;
	in	map (map div_conv) tab
	end
);
=TEX
=IGN
fun test_mod (m : int) (n : int) = (
	let	val range = interval m n;
		fun aux1 i j = list_mk_app(⌜$Mod⌝, [mk_ℕ i, mk_ℕ j]);
		fun aux2 i = map (aux1 i) range;
		val tab = map aux2 range;
	in	map (map mod_conv) tab
	end
);
=TEX
=IGN
new_theory"temp";
declare_postfix(400, "!");
=TEX
=IGN
push_goal([], ⌜∃$!⦁∀m⦁
		0! = 1
	∧	(m + 1)! = (m + 1) * m!		⌝);
a(strip_asm_tac (conv_rule all_β_conv
	(list_∀_elim
	[⌜1⌝, ⌜λn⦁λm⦁(m + 1) * n⌝]
	(inst_type_rule[(ⓣℕ⌝, ⓣ'a⌝)]prim_rec_thm))));
a(∃_tac ⌜f⌝);
a(asm_rewrite_tac[]);
=TEX
=IGN
val fact_exists_thm = pop_thm();
=TEX
=IGN
val ⦏fact_def⦎ = new_spec(["fact_def", "!"], 1, fact_exists_thm);
=TEX
=IGN
push_goal([], ⌜∀m⦁m! = if 0 < m then m * (m-1)! else 1⌝);
a(strip_tac);
a(induction_tac⌜m:ℕ⌝);
(* *** Goal "1" *** *)
a(rewrite_tac[fact_def]);
(* *** Goal "2" *** *)
a(rewrite_tac[fact_def, less_clauses, minus_def]);
=TEX
=IGN
val fact_thm = pop_thm();
=TEX
=IGN
val fact_conv = COND_C (is_ℕ o snd o dest_app)
	(eq_match_conv fact_thm) fail_conv;
=TEX
=IGN
fact_conv ⌜6!⌝;
fact_conv ⌜x!⌝;
=TEX


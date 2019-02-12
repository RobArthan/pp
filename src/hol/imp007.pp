=IGN
********************************************************************************
imp007.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% imp007.doc   ℤ $Date: 2011/07/11 11:05:38 $ $Revision: 1.60 $ $RCSfile: imp007.doc,v $
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

\def\Title{Implementation for the Derived Rules of Inference}

\def\AbstractText{}

\def\Reference{DS/FMU/IED/IMP007}

\def\Author{K. Blackburn}


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
%% LaTeX2e port: \TPPtitle{Implementation for the Derived Rules of Inference}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Implementation for the Derived Rules of Inference}
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP007}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.60 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2011/07/11 11:05:38 $ %
%% LaTeX2e port: }}  %% Mandatory field
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.~Blackburn & WIN01}  %% Mandatory field
%% LaTeX2e port: % \TPPauthors{K.~Blackburn & WIN01\\D.J.~King & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	    Project Library
%% LaTeX2e port: }}
%% LaTeX2e port: %\TPPclass{CLASSIFICATION}
%% LaTeX2e port: %\def\TPPheadlhs{}
%% LaTeX2e port: %\def\TPPheadcentre{}
%% LaTeX2e port: %def\TPPheadrhs{}
%% LaTeX2e port: %\def\TPPfootlhs{}
%% LaTeX2e port: %\def\TPPfootcentre{}
%% LaTeX2e port: %\def\TPPfootrhs{}
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
\section{DOCUMENT CONTROL}
\subsection{Contents List}
\tableofcontents
\subsection{Document Cross References}
\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes History}
\begin{description}

\item [29 May 1991 Issue 1.1 (1991/05/29)]
First version.
Primitive and built-in inference rules, and conversionals
all module tested to these implementations.

\item [30 May 1991 Issue 1.2 (1991/05/30)] Added material up to $∧$.

\item [31 May 1991 Issue 1.3 (1991/05/31)] Added up to $⇒\_trans\_rule$, corrected $⌜¬⌝$.

\item [7 June 1991 Issue 1.4 (1991/06/07)] Added up to $¬\_eq\_sym\_rule$, and DJK work.

\item [7 June 1991 Issue 1.5 (1991/06/07)]
Corrected the description of $¬\_thm1$,
and corrected $list\_simple\_∀\_intro$.
Added material up to $asm\_inst\_type\_rule$.

\item [10 June 1991 Issue 1.6 (1991/06/10)] Corrected $simple\_∃_elim$.

\item [10 June 1991 Issue 1.7 (1991/06/10)] Added most of the rest.

\item [17 June 1991 Issue 1.8 (1991/06/17)] Added the rest.

\item [18 June 1991 Issue 1.9 (1991/06/18)]
Renamed $LIST\_THEN\_C$ to $EVERY\_C$, $LIST\-\_ORELSE\-\_C$ to $FIRST\-\_C$,
and added $COMB\-\_C$.
Tidying up, profiling put about successful calls.

\item [18 June 1991 Issue 1.10 (1991/06/18)] Added author's names.

\item [19 June 1991 Issue 1.12 (1991/06/19)]
Bought $TOP\_TRAVERSE\_C$ into line with prototype's
$TOP\-\_DEPTH\-\_CONV$.
$prove\-\_asm\-\_rule$ doesn't worry about missing assumptions.
Corrected $\_match$ functions.

\item [19 June 1991 Issue 1.13 (1991/06/19)] Corrected a use of $all\_simple\_∀\_elim$.

\item [21 June 1991 Issue 1.14 (1991/06/21)]
Corrected $apply\_matches\_rule$.
Corrected various error messages.
Corrected $¬\_intro$ and $¬\_elim$.

\item [24 June 1991 Issue 1.15 (1991/06/24)] Corrected $COMB\_C$ error message.

\item [27 June 1991 Issue 1.16 (1991/06/27)]
Corrected indexing of saved theorems.
Changed $\_TRAVERSE\_C$ to $\_MAP\_C$.
Removed informal test material from ``=IGN'' sections.
$?\_MAP\_C$ all have failure 7005 added.
The prefix $simple$ is moved to being the first prefix, bar $pp'$.
Changed order of $all\_∀\_intro$ introduced variables.

\item[03 July 1991 Issue 1.17 (1991/07/03)] $simple\_∃\_elim$ changed in accord with issue 1.15 detailed design change.

\item[03 July 1991 Issue 1.18 (1991/07/03)] Added $id\_conv$.

\item[25 July 1991 Issue 1.19 (1991/07/25)] Split into two structures, see section~\ref{SplitStructure}.

\item [29 July 1991 Issue 1.20 (1991/07/29)]
Changed as result of changes caused by IR0016.

\item [5 August 1991 Issue 1.21 (1991/08/07)]
Reacting to issue 1.18 of \cite{DS/FMU/IED/DTD006}.

\item [8 August 1991 Issue 1.22 (1991/08/14)]
Reacting to changes from ID0021.

\item [15th August 1991 Issue 1.23 (1991/08/15)]
Renamings of functions containing the name atom $simple$,
and renaming of $aconv$.

\item [5th September 1991 Issue 1.24 (1991/09/05)]
Tidying up.
\item [24th September 1991 Issue 1.25 (1991/09/25)]
Changes in reaction to issue 1.25 of \cite{DS/FMU/IED/DTD007}.
\item [14th October 1991 Issue 1.26 (1991/10/16)]
Corrected a bug in $simple\-\_ε\-\_elim\-\_rule$.
\item [8th November 1991 Issue 1.27 (1991/11/11)]
Added $plus\_conv$, removed $div2\_conv$ and $mod2\_conv$,
following change request CR007.
\item [20th Decemember 1991 Issue 1.28 (1991/12/20)]
Changed implementation of $simple\-\_∃\-\_intro$ and $simple\-\_∃\-\_elim$.

\item[Issue 1.29 (1992/01/20), \FormatDate{92/01/20} ] Updated to use new fonts.
\item[Issue 1.30 (1992/01/27)]
Change to profile only primitive and built-in inference rules with $prof$.
\item [Issue 1.31 (1992/03/18) (12th March 1992)] Various minor additions and extensions.
\item [Issue 1.33 (1992/04/14) (13th April 1992)]
Changes due to CR0017.
\item [Issue 1.34 (1992/05/12),1.35 (1992/05/12) (12th May 1992)]
``Protected'' some uses of $inst\_type\_rule$ against
being run with empty lists.
\item [Issue 1.36 (1992/05/26) (26th May 1992)]
Renamings from version 1.5 of DS/FMU/IED/WRK038.
\item [Issue 1.37 (1992/07/03) (3rd July 1992)]
Replaced a $subst$ with a $var\_subst$.
\item[Issue 1.38 (1992/07/29)] $match\_mp\_rule1$s now don't specialise free variables.
\item[Issue 1.39 (1992/08/11) (11 August 1992)]
Changed $¬\_simple\_∀\_conv$ et al to prevent an unnecessary
renaming.
\item [(Issue 1.40 (1992/08/13) (13th August 1992)]
Corrected error handling for interrupts.
\item [(Issue 1.41 (1992/10/28) (27th October 1992)]
Corrected error handling for $simple\_∃⋎1\_intro$.
\item [(Issue 1.42 (1993/02/02) (1st February 1993)]
Correct $subst\_conv$.
\item [Issue 1.43 (1999/03/06)] Adapted for new INTEGER type.
\item [Issue 1.44 (2001/07/24)] Performance improvements in
=INLINEFT
¬_simple_∃_conv
=TEX
\ and
=INLINEFT
¬_simple_∀_conv
=TEX
.
\item[Issue 1.45 (2001/07/30)] Further performance improvements.
\item[Issue 1.46 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.47 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.48 (2005/04/18)] Interfaces to the kernel inference rules are now in the kernel interface module.
\item[Issue 1.49 (2005/12/16)] The prefix for private interfaces is now $pp'$ rather than $icl'$.
\item[Issue 1.50 (2010/11/17)] Added conversions for higher-order matching.
\item[Issue 1.51 (2011/02/05)--1.53 (2011/02/11)] Added {simple\_⇒\_match\_mp\_rule2}.
\item[Issue 1.54 (2011/02/20)] Fixed silly error in
=INLINEFT
simple_ho_eq_match_conv
=TEX
.
\item[Issue 1.55 (2011/02/20)] Fixed error-handling for {simple\_ho\_eq\_match\_conv} and
added {simple\_ho\_eq\_match\_conv1}.
\item[Issues 1.56 (2011/02/23)--1.58 (2011/02/23)] Implemented a version of John Harrison's heuristic for renaming bound variables in the higher-order matching conversions.
\item[Issue 1.59 (2011/02/26)] Renamed $ho\_match$ on $simple\_ho\_match$ to make
way for a future implementation of the Fettig/L\"{o}chner algborithm later.
\item[Issue 1.60 (2011/07/11)] Renamed
=INLINEFT
simple_∃_intro_thm
=TEX
{} to
=INLINEFT
∃_intro_thm
=TEX
.
\item[Issue 1.61 (2012/05/06)] Allowed for new parameter to $simple\_ho\_match$.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
The conversions
=INLINEFT
¬_simple_∃_conv
=TEX
\ and
=INLINEFT
¬_simple_∀_conv
=TEX
\ used to work by instantiating a template theorem,
specialising the result and then doing $\alpha$-conversion
to get bound variable names right.
It is much more efficient to do the $\alpha$-conversion
before specialising (since then the $\alpha$-conversion
is done on a term of constant and small size).
The same technique could perhaps be used in other rules
that do $\alpha$-conversion.
\section{GENERAL}
\subsection{Scope}
This document contains an implementation of the derived rules of inference.
This includes user versions of the
primitive and built-in inference rules.
The design is in \cite{DS/FMU/IED/DTD007}.
\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains an implementation of the
This includes user versions of the
primitive and built-in inference rules.
A ``primitive'' inference rule is considered to be part of the logic,
whereas a ``built-in'' rule is one that, though it could be coded in terms
of the primitive rules, will actually be part of the abstract data type $THM$, and thus taken as holding true without checking.
These functions will be profiled with $prof$.
Inference rules other than these are called ``derived'' rules
(derived from primitive and built-in rules).
\subsubsection{Dependencies}
This document takes its signature from \cite{DS/FMU/IED/DTD007},
and also requires those files indicated as preceding it in the
rel001 makefile.
\subsubsection{Deficiencies}
None known.
\subsubsection{Possible Enhancements}
None known.
\subsubsection{Compilation Note}
\label{SplitStructure}

Issues~1.18 and earlier of this document declared a single structure,
by issue~1.18 this had almost~2300 lines of Standard~ML. Unfortunately
this structure failed to compile on Sun~3 computers although it did
compile on Sun~4 computers. Investigations failed to find the exact
cause of the compilation failure apart from a code generation limit was
exceeded.

The resolution of the compilation failure was to divide the structure
into two pieces, as follows.

=GFT SML example
structure DerivedInferenceRules = struct
	(* First set of declarations *)
	...
end;

structure ⦏DerivedInferenceRules⦎ : DerivedInferenceRules = struct
	(* Second set of declarations *)
	open DerivedInferenceRules;
	...
end;

open DerivedInferenceRules;
=TEX

Here the two structures have the same name, there is a signature
constraint only on the second, the first structure is opened within the
second, the second structure declaration hides the first. The effect
is to create one structure having the required signature.

\section{THE ABSTRACT DATA TYPE $THM$}
=SML
structure ⦏DerivedRules1⦎ = struct
=TEX
\subsection{Kernel Inference Rules}
These are just picked up from the kernel interface module:
=SML
open KernelInterface;

=TEX
=SML

local
	val N0 = mk_ℕ zero;
in
val ⦏suc_conv⦎ : CONV = (fn (tm:TERM) =>
let	val s1 = if tm =$ N0
		then term_fail "suc_conv" 7100 [tm]
		else prim_suc_conv tm
in	s1
end);
end;

=TEX
\subsection{Inference Rules For Conversions}
=FRULE 1 Rule
simple_∀_elim
⌜t1⌝
├
Γ ⊢ ∀ x ⦁ t2[x]
├
Γ ⊢ t2'[t1]
=TEX
where $x$ is a simple variables.
=SML
fun ⦏simple_∀_elim⦎ (tm: TERM) (thm:THM) = (
let	val s1 = list_simple_∀_elim [tm] thm
in
	(prof "simple_∀_elim";
	s1)
end
handle complaint =>
let	val efrom = area_of complaint
in
	if efrom = "list_simple_∀_elim"
	then (if not(is_simple_∀ (concl thm))
		then thm_fail "simple_∀_elim" 7039 [thm]
		else let val (v,_) = dest_simple_∀ (concl thm)
		in
			if not(type_of v =: type_of tm)
			then term_fail "simple_∀_elim" 3012 [v,tm]
			else reraise complaint "simple_∀_elim"
		end)
	else reraise complaint efrom
end);
=TEX
Two "proper" failures come from $mk\-\_app\-\_rule$,
each with their own failure message from
$app\-\_fun\-\_rule$.
We need to do some calculation to determine which error
is given: but we only do this if we get a failure.
=SML
fun ⦏app_fun_rule⦎ (tm : TERM) (thm : THM) : THM = ((
let	val s1 = refl_conv tm;
	val s2 = mk_app_rule s1 thm
in
	s2
end)
handle complaint =>
if is_eq(concl thm)
then divert complaint "mk_app_rule" "app_fun_rule" 7024 [fn () => string_of_term tm]
else divert complaint "mk_app_rule" "app_fun_rule" 6020 [fn () => string_of_thm thm]
);
=TEX
Two "proper" failures come from $mk\-\_app\-\_rule$,
each with their own failure message from
$app\-\_arg\-\_rule$.
We need to do some calculation to determine which error
is given: but we only do this if we get a failure.
=SML
fun ⦏app_arg_rule⦎ (tm : TERM) (thm : THM) : THM = (
let	val s1 = refl_conv tm;
	val s2 = mk_app_rule thm s1;
in
	s2
end
handle complaint =>
if is_eq(concl thm)
then divert complaint "mk_app_rule" "app_arg_rule" 7025 [fn () => string_of_term tm]
else divert complaint "mk_app_rule" "app_arg_rule" 6020 [fn () => string_of_thm thm]
);
=TEX

\subsection{Conversions}
\subsubsection{Building Blocks}
=SML
val ⦏id_conv⦎ : CONV = refl_conv;

val ⦏fail_conv⦎ : CONV = (fn (tm:TERM) => fail "fail_conv" 7061 []);

fun ⦏fail_with_conv⦎ (str : string) : CONV = (
	fn (tm:TERM) => fail "fail_with_conv" 7075 [fn () => str]
);
=TEX
\subsubsection{Conversionals}
=SML
fun (cnv1 : CONV) ⦏THEN_C⦎ (cnv2 : CONV) : CONV = (fn (tm: TERM) =>
let	val s1 = cnv1 tm;
	val rhs_s1 = snd(dest_eq (concl s1))
		handle complaint =>
		divert complaint "dest_eq" "THEN_C" 7101 [fn () => string_of_thm s1];
	val s2 = cnv2 rhs_s1;
	val s3 = eq_trans_rule s1 s2
		handle complaint =>
		divert complaint "eq_trans_rule" "THEN_C" 7102 [fn () => string_of_thm s2,
			fn () => string_of_thm s1];
in
	s3
end);

=TEX
=SML

fun (cnv1 : CONV) ⦏THEN_TRY_C⦎ (cnv2 : CONV) : CONV = (fn (tm: TERM) =>
let	val s1 = cnv1 tm
in
	(let
		val rhs_s1 = snd(dest_eq (concl s1));
		val s2 = cnv2 rhs_s1;
		val s3 = eq_trans_rule s1 s2
	in
		s3
	end
	handle (Fail _) => s1)
end);

=TEX
=SML

fun (cnv1 : CONV) ⦏ORELSE_C⦎ (cnv2 : CONV) : CONV = (fn (tm: TERM) =>
	cnv1 tm
handle (Fail _) =>
	cnv2 tm
);

=TEX
=SML

fun (cnv1 : CONV) ⦏AND_OR_C⦎ (cnv2 : CONV) : CONV = (fn (tm: TERM) =>
(let	val s1 = cnv1 tm
in
	(let
		val rhs_s1 = snd(dest_eq (concl s1));
		val s2 = cnv2 rhs_s1;
		val s3 = eq_trans_rule s1 s2;
	in
		s3
	end
	handle (Fail _) => s1)
end
handle (Fail _) => cnv2 tm)
);

=TEX
=SML

fun ⦏TRY_C⦎ (cnv : CONV) : CONV = (fn (tm:TERM) =>
	cnv tm
	handle (Fail _) =>
	refl_conv tm
);

=TEX
=SML

fun ⦏COND_C⦎ (pred:TERM -> bool) (cnv1 : CONV) (cnv2:CONV) : CONV =
(fn (tm:TERM) =>
	if pred tm
	then cnv1 tm
	else cnv2 tm
);

=TEX
=SML

fun ⦏REPEAT_C1⦎ (cnv : CONV) : CONV = (fn (tm:TERM) =>
	(cnv THEN_TRY_C (REPEAT_C1 cnv)) tm
);
=TEX
Notice that the following is carefully coded to avoid
redundant $refl\_conv$'s.
There is a minor partial evaluation effect with
only the conversion argument.
=SML
fun ⦏REPEAT_C⦎ (cnv : CONV) : CONV = (fn (tm:TERM) =>
	TRY_C (REPEAT_C1 cnv) tm
);
=TEX
Partially evaluated given only a list.
=SML
fun ⦏EVERY_C⦎ ([cnv] : CONV list) : CONV = cnv
| EVERY_C (cnv :: crest) = cnv THEN_C (EVERY_C crest)
| EVERY_C [] = fail "EVERY_C" 7103 [];
=TEX
Partially evaluated given only a list.
=SML
fun ⦏FIRST_C⦎ ([cnv] : CONV list) : CONV = cnv
| FIRST_C (cnv :: crest) = cnv ORELSE_C (FIRST_C crest)
| FIRST_C [] = fail "FIRST_C" 7103 [];

=TEX
=SML

fun ⦏CHANGED_C⦎ (cnv : CONV) : CONV = (fn (tm:TERM) =>
let	val s1 = cnv tm;
	val rhs_s1 = (snd o dest_eq o concl) s1
		handle complaint =>
		divert complaint "dest_eq" "CHANGED_C" 7104
			[fn () => string_of_thm s1]
in
	if not(rhs_s1 =$ tm)
	then s1
	else fail "CHANGED_C" 7032 []
end);
=TEX
\subsubsection{Term Traversal Algorithms for Conversions}
=SML
fun ⦏RAND_C⦎ (cnv : CONV) : CONV = (fn (tm:TERM) =>
let	val (f,x) = dest_app tm
		handle complaint =>
		pass_on complaint "dest_app" "RAND_C";
	val s1 = cnv x;
	val s2 = app_fun_rule f s1
		handle complaint =>
		divert complaint "app_fun_rule" "RAND_C" 7104
			[fn () => string_of_thm s1];
in
	s2
end);

=TEX
=SML

fun ⦏RIGHT_C⦎ (cnv : CONV) : CONV = (fn (tm:TERM) =>
let	val (fa,b) = (dest_app tm)
		handle (Fail _) =>
		term_fail "RIGHT_C" 3013 [tm];
	val dummy = if is_app fa
		then ()
		else term_fail "RIGHT_C" 3013 [tm];
	val s1 = cnv b;
	val s2 = app_fun_rule fa s1
		handle complaint =>
		divert complaint "app_fun_rule" "RIGHT_C" 7104
			[fn () => string_of_thm s1];
in
	s2
end);

=TEX
=SML

fun ⦏LEFT_C⦎ (cnv : CONV) : CONV = (fn (tm:TERM) =>
let	val ((f,a),b) = (dest_app ** Combinators.I)(dest_app tm)
		handle (Fail _) =>
		term_fail "LEFT_C" 3013 [tm];
	val s1 = cnv a;
	val s2 = app_arg_rule b(app_fun_rule f s1)
		handle complaint =>
		divert complaint "app_fun_rule" "LEFT_C" 7104
			[fn () => string_of_thm s1];
in
	s2
end);

=TEX
=SML

local
fun list_mk_app_rule thm [] = thm
| list_mk_app_rule thm (a :: x) = (list_mk_app_rule (mk_app_rule thm a) x
	handle complaint =>
	divert complaint "mk_app_rule" "RANDS_C" 7104
			[fn () => string_of_thm a]);
in
fun ⦏RANDS_C⦎ (cnv : CONV) : CONV = (fn (tm:TERM) =>
let	val (f,xs) = strip_app tm;
	val xs' = map cnv xs;
	val s2 = (if is_nil xs
		then refl_conv f
		else list_mk_app_rule (app_fun_rule f (hd xs')) (tl xs')
		handle complaint =>
		divert complaint "app_fun_rule" "RANDS_C" 7104
			[fn () => string_of_thm (hd xs')]);
in
	s2
end);
end;

=TEX
=SML

fun ⦏RATOR_C⦎ (cnv : CONV) : CONV = (fn (tm:TERM) =>
let	val (f,x) = dest_app tm
		handle complaint =>
		pass_on complaint "dest_app" "RATOR_C";
	val s1 = cnv f;
	val s2 = app_arg_rule x s1
		handle complaint =>
		divert complaint "app_arg_rule" "RATOR_C" 7104
			[fn () => string_of_thm s1];
in
	s2
end);

=TEX
=SML

fun ⦏APP_C⦎ (cnv1 : CONV, cnv2 : CONV) : CONV = (fn (tm:TERM) =>
let	val (f,x) = dest_app tm
		handle complaint =>
		pass_on complaint "dest_app" "APP_C";
	val s1 = cnv1 f;
	val s2 = cnv2 x;
	val s3 = mk_app_rule s1 s2
		handle complaint =>
		divert complaint "mk_app_rule" "APP_C" 7110
			[fn () => string_of_thm s1,
			 fn () => string_of_thm s2];
in
	s3
end);

=TEX
=SML

fun ⦏SIMPLE_λ_C⦎ (cnv : CONV) : CONV = (fn (tm:TERM) =>
let	val (x,b) = dest_simple_λ tm
		handle complaint =>
		pass_on complaint "dest_simple_λ" "SIMPLE_λ_C";
	val s1 = cnv b;
	val s2 = simple_λ_eq_rule x s1
		handle complaint =>
		divert complaint "simple_λ_eq_rule" "SIMPLE_λ_C" 7104
			[fn () => string_of_thm s1];
in
	s2
end);
=TEX
We do the following in full to be able to determine the
correct error message, if necessary.
It could just be $RAND\_C\ o\ SIMPLE\_λ\_C$.
=SML
fun ⦏SIMPLE_BINDER_C⦎ (cnv : CONV) : CONV = (fn (tm:TERM) =>
let	val (binder,abs) = dest_app tm;
	val (x,b) = dest_simple_λ abs;
	val s1 = cnv b;
	val s2 = app_fun_rule binder (simple_λ_eq_rule x s1)
		handle complaint =>
		list_divert complaint "SIMPLE_BINDER_C" [
			("simple_λ_eq_rule",7104,[fn () => string_of_thm s1]),
			("app_fun_rule",7104,[fn () => string_of_thm s1])];	
in
	s2
end
handle complaint =>
list_divert complaint "SIMPLE_BINDER_C" [
	("dest_simple_λ",7059,[fn () => string_of_term tm]),
	("dest_app",7059,[fn () => string_of_term tm])]
);
=TEX
We could build the following using the above building blocks,
but prefer to keep it fast.
=SML
fun ⦏SUB_C⦎ (cnv : CONV) : CONV = (fn (tm:TERM) =>
let	fun aux (Var _) = refl_conv tm
	| aux (Const _) = refl_conv tm
	| aux (App (f,x)) = (
		((let val thm1 = cnv f
		in
		 (let val thm2 = cnv x
		 in
			mk_app_rule thm1 thm2
		 end
		 handle (Fail _) =>
		 app_arg_rule x thm1)
		end)
		handle (Fail _) =>
		(let val thm2 = cnv x
		in
			app_fun_rule f thm2
		end))
		handle (Fail _) => refl_conv tm
	) | aux (Simpleλ (x,b)) = (
		let val thm1 = cnv b
		in
			simple_λ_eq_rule x thm1
		end
		handle (Fail _) =>
		refl_conv tm
	);
in
	aux(dest_simple_term tm)
end);
=TEX
There is a mild partial evaluation with only a conversion.
=SML
fun ⦏SUB_C1⦎ (cnv : CONV) : CONV = (fn (tm:TERM) =>
let	fun aux (Var _) = term_fail "SUB_C1" 7105 [tm]
	| aux (Const _) = term_fail "SUB_C1" 7105 [tm]
	| aux (App (f,x)) = (
		let val thm1 = cnv f
		in
		 (let val thm2 = (cnv x
			handle (Fail _) => refl_conv x)
		 in
			mk_app_rule thm1 thm2
		 end)
		end
		handle (Fail _) =>
		(let val thm2 = cnv x
		in
			(app_fun_rule f thm2
			handle complaint =>
			divert complaint "app_fun_rule" "SUB_C1" 7104
			[fn () => string_of_thm thm2])
		end)
	) | aux (Simpleλ (x,b)) = (
		let val thm1 = cnv b
		in
			(simple_λ_eq_rule x thm1
			handle complaint =>
			divert complaint "simple_λ_eq_rule" "SUB_C1" 7104
			[fn () => string_of_thm thm1])
		end
	);
in
	aux(dest_simple_term tm)
end);
=TEX
N.B. the $fn\ (tm: TERM) \ldots tm$ might look $\eta$-convertible away, but actually prevents an infinite loop.
=SML
fun ⦏ONCE_MAP_C⦎ (cnv : CONV) : CONV = (fn (tm: TERM) =>
let	fun aux (tm : TERM) = (cnv ORELSE_C (SUB_C1 aux)) tm
in
	aux tm
end
handle (Fail _) => fail "ONCE_MAP_C" 7005 []
);

=TEX
=SML

fun ⦏MAP_C⦎ (cnv : CONV) : CONV = (fn (tm: TERM) =>
let	fun aux (tm : TERM) = (
		(SUB_C1 (MAP_C cnv))
		AND_OR_C (REPEAT_C1 cnv)) tm
in
	(aux tm)
end
handle (Fail _) => fail "MAP_C" 7005 []
);

=TEX
=SML

fun ⦏REPEAT_MAP_C⦎ (cnv : CONV) : CONV = (fn (tm: TERM) =>
let	fun aux (tm : TERM) = ((SUB_C1 (REPEAT_MAP_C cnv))
	AND_OR_C (cnv THEN_TRY_C (REPEAT_MAP_C cnv))) tm
in
	(aux tm)
end
handle (Fail _) => fail "REPEAT_MAP_C" 7005 []
);

=TEX
=SML

fun ⦏TOP_MAP_C⦎ (cnv : CONV) : CONV = (fn (tm: TERM) =>
let	fun aux (tm : TERM) = ((REPEAT_C1 cnv) AND_OR_C
	((CHANGED_C (SUB_C1(TOP_MAP_C cnv)))
		THEN_TRY_C
		(cnv THEN_TRY_C (TOP_MAP_C cnv)))) tm
in
	(aux tm)
end
handle (Fail _) => fail "TOP_MAP_C" 7005 []
);
=TEX
\subsubsection{Conversions as Rules}
=SML
fun ⦏conv_rule⦎ (cnv : CONV) (thm : THM) : THM = (
let	val s1 = cnv(concl thm);
	val s2 = ⇔_mp_rule s1 thm
		handle complaint =>
		divert complaint "⇔_mp_rule" "conv_rule" 7104
		[fn () => string_of_thm s1];
in
	s2
end);
=TEX
\section{DERIVED INFERENCE RULES}
We will be saving theorems as we go along, so we need to ensure we are saving them into theory misc:
=SML
val sideeffect = open_theory "misc";
=TEX
An alias:
=SML
val ⦏⇒_mp_rule⦎ : THM -> THM -> THM = ⇒_elim;
=TEX
The following is out of place, but useful if declared immediately:
=SML
fun ⦏undisch_rule⦎ (thm : THM) : THM = (
let	val (a,b) = dest_⇒(concl thm);
	val s1 = asm_rule a;
	val s2 = ⇒_elim thm s1
in
	s2
end
handle complaint =>
divert complaint "dest_⇒" "undisch_rule" 7011 [fn () => string_of_thm thm]
);
=TEX
Something else out of sequence:
=SML
fun ⦏disch_rule⦎ (tm : TERM) (thm : THM) : THM = (
	if tm term_mem (asms thm)
	then (let val s1 = ⇒_intro tm thm
		in
			s1
		end
		handle complaint =>
		pass_on complaint "⇒_intro" "disch_rule")
	else fail "disch_rule" 7031 [fn () => string_of_term tm]
);
=TEX
		
\subsection{Concerning $T$}
Proof of $T$ (as 12.3.9)
=SML
local
	val s1 = t_def;
	val s2 = eq_sym_rule s1;
	val s3 = refl_conv ⌜λ x : BOOL ⦁ x⌝;
	val s4 = ⇔_mp_rule s2 s3;
in
	val ⦏t_thm⦎ = save_thm("t_thm",s4)
end;
=TEX
We could work by a local theorem:
=GFT
⊢ ∀ x ⦁ x ⇔ (x ⇔ T)
=TEX
but choose to work by the more primitive route of 12.3.12
=SML
fun ⦏⇔_t_intro⦎ (thm : THM) : THM = (
let	val t = concl thm;
	val s3 = list_simple_∀_elim [t, mk_t] ⇒_antisym_axiom;
	val s5 = ⇒_intro t t_thm;
	val s5 = ⇒_elim s3 s5;
	val s8 = ⇒_intro mk_t thm;
	val s9 = ⇒_elim s5 s8;
in
	s9
end);
=TEX
In the following we could chose to try eliminating
all outermost $\ldots ⇔ T$ and $T ⇔ \ldots$.
D.I.Y. form:
=SML
fun ⦏⇔_t_elim⦎ (thm : THM) : THM = (
let	val s1 = eq_sym_rule thm;
	val s2 = ⇔_mp_rule s1 t_thm;
in
	s2
end
handle complaint =>
list_divert complaint "⇔_t_elim" [
	("eq_sym_rule",7106,[fn () => string_of_thm thm]),
	("⇔_mp_rule",7106,[fn () => string_of_thm thm])]);
=TEX
D.I.Y. form:
=SML
fun ⦏contr_rule⦎ (tm : TERM) (thm : THM) : THM = (
let	val s1 = ⇔_mp_rule f_def thm;
	val s2 = simple_∀_elim tm s1;
in
	s2
end
handle complaint =>
list_divert complaint "contr_rule" [
	("⇔_mp_rule", 7001, [fn () => string_of_thm thm]),
	("simple_∀_elim",3031,[fn () => string_of_term tm])]
);
=TEX
The following is out of sequence, but necessary at this point:
we first prove theorem:
=GFT
∨_thm = ⊢ ∀ t1 t2 ⦁ (t1 ∨ t2) = (∀ b ⦁ (t1 ⇒ b) ⇒ (t2 ⇒ b) ⇒ b)

=TEX
=SML

local
	val s1 = app_arg_rule ⌜t1 : BOOL⌝ ∨_def;
	val s2 = app_arg_rule ⌜t2 : BOOL⌝ s1;
	val s3 = conv_rule (MAP_C simple_β_conv) s2;
	val s4 = simple_∀_intro ⌜t2 : BOOL⌝ s3;
	val s5 = simple_∀_intro ⌜t1 : BOOL⌝ s4;
in
	val ⦏∨_thm⦎ = save_thm("∨_thm",s5)
end;
=TEX
Then the out of place rule
(roughly as \cite{DS/FMU/IED/SML009} 5.14):
=SML
fun ⦏∨_elim⦎ (a_∨_b : THM) (a_thm : THM) (b_thm : THM) = (
let	val (a,b) = dest_∨(concl a_∨_b);
	val s1 = ⇒_intro a a_thm;
	val s2 = ⇒_intro b b_thm;
	val s3 = list_simple_∀_elim [a, b] ∨_thm;
	val s4 = ⇔_mp_rule s3 a_∨_b;
	val s5 = simple_∀_elim (concl a_thm) s4;
	val s6 = ⇒_elim s5 s1;
	val s7 = ⇒_elim s6 s2;
in
	s7
end
handle complaint =>
list_divert complaint "∨_elim" [
	("dest_∨",7010,[fn () => string_of_thm a_∨_b]),
	("⇒_elim",7083,[fn () => string_of_thm a_∨_b,
		fn () => string_of_thm a_thm, fn () => string_of_thm b_thm])]
);
=TEX
Then another out of place theorem:
=GFT
¬_thm = ⊢ ∀ t ⦁ (¬ t) = (t ⇒ F)

=TEX
=SML

local
	val s1 = app_arg_rule ⌜t : BOOL⌝ ¬_def;
	val s2 = conv_rule (MAP_C simple_β_conv) s1;
	val s3 = simple_∀_intro ⌜t : BOOL⌝ s2;
in
	val ⦏¬_thm⦎ = save_thm("¬_thm", s3)
end;
=TEX
Roughly as 5.17 of \cite{DS/FMU/IED/SML009}:
First prove the local theorem:
=GFT
∀ t ⦁ (¬ t ⇒ F) ⇒ t

=TEX
=SML

local
	val s1 = asm_rule ⌜(t ⇒ F) ⇒ F⌝;
	val s2 = asm_rule ⌜t ⇔ F⌝;
	val s4 = subst_rule[(s2,⌜t : BOOL⌝)] (concl s1) s1;
	val s5 = asm_rule mk_f;
	val s6 = ⇒_intro mk_f s5;
	val s7 = ⇒_elim s4 s6;
	val s8 = eq_sym_rule s2;
	val s9 = ⇔_mp_rule s8 s7;
	val s10 = asm_rule ⌜t = T⌝;
	val s11 = ⇔_t_elim s10;
	val s13 = simple_∀_elim ⌜t : BOOL⌝ bool_cases_axiom;
	val s14 = ∨_elim s13 s11 s9;
	val s15 = ⇒_intro ⌜(t ⇒ F) ⇒ F⌝ s14;
	val s16 = simple_∀_elim ⌜t : BOOL⌝ ¬_thm;
	val s17 = eq_sym_rule s16;
	val s18 = conv_rule (ONCE_MAP_C (fn x =>
		if x =$ ⌜t ⇒ F⌝ then s17 else (fail_conv x))) s15;
	val s19 = simple_∀_intro ⌜t : BOOL⌝ s18;
in
=TEX
now the main function:
=SML
fun ⦏c_contr_rule⦎ (tm : TERM) (thm : THM) : THM = (
let	val mf_s1 = simple_∀_elim tm s19;
	val ¬_tm = mk_¬ tm;
	val mf_s2 = disch_rule ¬_tm thm;
	val mf_s3 = ⇒_elim mf_s1 mf_s2
in
	mf_s3
end
handle complaint =>
list_divert complaint "c_contr_rule" [
	("⇒_elim", 7001, [fn () => string_of_thm thm]),
	("simple_∀_elim", 3031, [fn () => string_of_term tm]),
	("disch_rule", 7003, [fn () => string_of_term tm])]
);
end;
=TEX
\subsection{Concerning Negation}
This is entirely new:
we first prove the local theorem:
=GFT
⊢ ∀ a ⦁ (¬ a) ⇔ (a ⇒ ∀ b ⦁ b)

=TEX
=SML

local
	val s1 = conv_rule(ONCE_MAP_C(fn x =>
		if x =$ mk_f then f_def else fail_conv x))
		¬_thm;
in
fun ⦏¬_elim⦎ (tm : TERM) (thm1 : THM) (thm2 : THM) : THM = (
let	val sideeffect = if type_of tm =: BOOL
		then ()
		else term_fail "¬_elim" 3031 [tm];
in
(let
	val s2 = simple_∀_elim (concl thm1) s1;
	val s3 = ⇔_mp_rule s2 thm2;
	val s4 = ⇒_elim s3 thm1;
	val s5 = simple_∀_elim tm s4
in
	s5
end
handle (Fail _) =>
let	val s2 = simple_∀_elim (concl thm2) s1;
	val s3 = ⇔_mp_rule s2 thm1;
	val s4 = ⇒_elim s3 thm2;
	val s5 = simple_∀_elim tm s4
in
	s5
end
handle complaint =>
list_divert complaint "¬_elim" [
	("⇔_mp_rule",7004,[fn () => string_of_thm thm1, fn () => string_of_thm thm2]),
	("⇒_elim",7004,[fn () => string_of_thm thm1, fn () => string_of_thm thm2])
	]
)
end
);
end;
=TEX
	
This is entirely new:
we first prove:
=GFT
s13 = ⊢ ∀ a b ⦁ (a ⇒ b) ⇒ (a ⇒ ¬b) ⇒ ¬a

=TEX
=SML

local
	val s1 = asm_rule ⌜a ⇒ b⌝;
	val s2 = undisch_rule s1;
	val s3 = asm_rule ⌜a ⇒ ¬ b⌝;
	val s4 = undisch_rule s3;
	val s5 = ¬_elim mk_f s2 s4;
	val s6 = ⇒_intro ⌜a : BOOL⌝ s5;
	val s7 = simple_∀_elim ⌜a : BOOL⌝ ¬_thm;
	val s8 = eq_sym_rule s7;
	val s9 = conv_rule (ONCE_MAP_C (fn x =>
		if x =$ ⌜a ⇒ F⌝ then s8 else (fail_conv x))) s6;
	val s10 = ⇒_intro ⌜a ⇒ ¬ b⌝ s9;
	val s11 = ⇒_intro ⌜a ⇒ b⌝ s10;
	val s12 = simple_∀_intro ⌜b : BOOL⌝ s11;
	val s13 = simple_∀_intro ⌜a : BOOL⌝ s12;
in
=TEX
Main function:
=SML
fun ⦏¬_intro⦎ (tm : TERM) (thm1 : THM) (thm2 : THM) : THM = (
let	val mf_s1 = ⇒_intro tm thm1;
	val mf_s2 = ⇒_intro tm thm2;
in
((let
	val mf_s3 = list_simple_∀_elim [tm, concl thm1] s13;
	val mf_s4 = ⇒_elim mf_s3 mf_s1;
	val mf_s5 = ⇒_elim mf_s4 mf_s2
in
	mf_s5
end)
handle (Fail _) =>
(let
	val mf_s3 = list_simple_∀_elim [tm, concl thm2] s13;
	val mf_s4 = ⇒_elim mf_s3 mf_s2;
	val mf_s5 = ⇒_elim mf_s4 mf_s1
in
	mf_s5
end))
end
handle complaint =>
list_divert complaint "¬_intro" [
	("⇒_elim", 7004, [fn () => string_of_thm thm1, fn () => string_of_thm thm2]),
	("⇒_intro", 3031, [fn () => string_of_term tm]),
	("simple_∀_elim", 3031, [fn () => string_of_term tm])
	]
);
end;
=TEX
Prove the following (out of sequence)
=GFT
f_thm = ⊢ ¬ F

=TEX
=SML

local
	val s1 = asm_rule mk_f;
	val s2 = ⇒_intro mk_f s1;
	val s3 = simple_∀_elim mk_f ¬_thm;
	val s4 = eq_sym_rule s3;
	val s5 = ⇔_mp_rule s4 s2;
in
	val ⦏f_thm⦎ = save_thm("f_thm",s5)
end;
=TEX
Prove the following (out of sequence)
=GFT
¬_t_thm = ⊢ ¬ T ⇔ F

=TEX
=SML

local
	val s1 = simple_∀_elim ⌜¬ T⌝ bool_cases_axiom;
	val s2 = asm_rule ⌜(¬ T) ⇔ F⌝;
	val s3 = asm_rule ⌜¬ T ⇔ T⌝;
	val s4 = ⇔_t_elim s3;
	val s5 = ¬_elim ⌜¬ T ⇔ F⌝ t_thm s4;
	val s6 = ∨_elim s1 s5 s2;
in
	val ⦏¬_t_thm⦎ = save_thm("¬_t_thm",s6)
end;
=TEX
We prove the local theorems:
=GFT
s14 = ⊢ ¬(¬ t) ⇔ t
s16 = ⊢ t ⇔ ¬(¬ t)

=TEX
=SML

local
	val s1 = ⇔_t_intro f_thm;
	val s2 = app_fun_rule ⌜$¬⌝ s1;
	val s3 = eq_trans_rule s2 ¬_t_thm;
	val s4 = app_fun_rule ⌜$¬⌝ ¬_t_thm;
	val s5 = eq_trans_rule s4 s1;
	val s6 = asm_rule ⌜t ⇔ T⌝;
	val s7 = eq_sym_rule s6;
	val s8 = subst_rule [(s7,⌜x : BOOL⌝)] ⌜¬(¬ x) ⇔ x⌝ s5;
	val s9 = asm_rule ⌜t ⇔ F⌝;
	val s10 = eq_sym_rule s9;
	val s11 = subst_rule [(s10,⌜x : BOOL⌝)] ⌜¬(¬ x) ⇔ x⌝ s3;
	val s12 = simple_∀_elim ⌜t : BOOL⌝ bool_cases_axiom;
	val s13 = ∨_elim s12 s8 s11;
	val s14 = simple_∀_intro ⌜t : BOOL⌝ s13;
	val s15 = eq_sym_rule s13;
	val s16 = simple_∀_intro ⌜t : BOOL⌝ s15;
in
=TEX
Main functions:
=SML
fun ⦏¬_¬_intro⦎ (thm : THM) : THM = (
let	val mf_s1 = simple_∀_elim (concl thm) s16;
	val mf_s2 = ⇔_mp_rule mf_s1 thm
in
	mf_s2
end);

fun ⦏¬_¬_elim⦎ (thm : THM) : THM = (
let	val bdy = dest_¬(dest_¬(concl thm));
	val mf_s1 = simple_∀_elim bdy s14;
	val mf_s2 = ⇔_mp_rule mf_s1 thm
in
	mf_s2
end
handle complaint =>
divert complaint "dest_¬" "¬_¬_elim" 7006 [fn () => string_of_thm thm]
);
end; (* local *)
=TEX
\subsection{Concerning ∧}
=GFT
∧_thm = ⊢ ∀ t1 t2 ⦁ (t1 ∧ t2) = (∀ b ⦁ (t1 ⇒ t2 ⇒ b) ⇒ b)

=TEX
=SML

local
	val s1 = app_arg_rule ⌜t1 : BOOL⌝ ∧_def;
	val s2 = app_arg_rule ⌜t2 : BOOL⌝ s1;
	val s3 = conv_rule (MAP_C simple_β_conv) s2;
	val s4 = simple_∀_intro ⌜t2 : BOOL⌝ s3;
	val s5 = simple_∀_intro ⌜t1 : BOOL⌝ s4;
in
	val ⦏∧_thm⦎ = save_thm("∧_thm",s5)
end;
=TEX
Following \cite{DS/FMU/IED/SML009} 5.10:
We prove the local theorem:
=GFT
s14 = ∀ t1 t2 ⦁ t1 ⇒ t2 ⇒ (t1 ∧ t2)

=TEX
=SML

local
	val s1 = asm_rule ⌜t1 ⇒ t2 ⇒ b⌝;
	val s3 = undisch_rule s1;
	val s5 = undisch_rule s3;
	val s6 = ⇒_intro ⌜t1 ⇒ t2 ⇒ b⌝ s5;
	val s7 = simple_∀_intro ⌜b : BOOL⌝ s6;
	val s8 = list_simple_∀_elim [⌜t1 : BOOL⌝, ⌜t2 : BOOL⌝] ∧_thm;
	val s9 = eq_sym_rule s8;
	val s10 = ⇔_mp_rule s9 s7;
	val s11 = ⇒_intro ⌜t2 : BOOL⌝ s10;
	val s12 = ⇒_intro ⌜t1 : BOOL⌝ s11;
	val s13 = simple_∀_intro ⌜t2 : BOOL⌝ s12;
	val s14 = simple_∀_intro ⌜t1 : BOOL⌝ s13;
in
fun ⦏∧_intro⦎ (thm1 : THM) (thm2 : THM) : THM = (
let	val mf_s1 = list_simple_∀_elim[concl thm1, concl thm2] s14;
	val mf_s2 = ⇒_elim mf_s1 thm1;
	val mf_s3 = ⇒_elim mf_s2 thm2;
in
	mf_s3
end);
end;
=TEX
We prove the local theorem:
=GFT
s11 = ∀ t1 t2 ⦁ (t1 ∧ t2) ⇒ t1

=TEX
=SML

local
	val s1 = list_simple_∀_elim [⌜t1 : BOOL⌝, ⌜t2 : BOOL⌝] ∧_thm;
	val s2 = asm_rule ⌜t1 ∧ t2⌝;
	val s3 = ⇔_mp_rule s1 s2;
	val s4 = simple_∀_elim ⌜t1 : BOOL⌝ s3;
	val s5 = asm_rule ⌜t1 : BOOL⌝;
	val s6 = ⇒_intro ⌜t2 : BOOL⌝ s5;
	val s7 = ⇒_intro ⌜t1 : BOOL⌝ s6;
	val s8 = ⇒_elim s4 s7;
	val s9 = ⇒_intro ⌜t1 ∧ t2⌝ s8;
	val s10 = simple_∀_intro ⌜t2 : BOOL⌝ s9;
	val s11 = simple_∀_intro ⌜t1 : BOOL⌝ s10;
in
fun ⦏∧_left_elim⦎ (thm :THM) : THM = (
let	val (t1,t2) = dest_∧(concl thm);
	val mf_s1 = list_simple_∀_elim [t1, t2] s11;
	val mf_s2 = ⇒_elim mf_s1 thm;
in
	mf_s2
end
handle complaint =>
divert complaint "dest_∧" "∧_left_elim" 7007 [fn () => string_of_thm thm]
);
end;
=TEX
We prove the local theorem:
=GFT
s11 = ∀ t1 t2 ⦁ (t1 ∧ t2) ⇒ t2

=TEX
=SML

local
	val s1 = list_simple_∀_elim [⌜t1 : BOOL⌝, ⌜t2 : BOOL⌝] ∧_thm;
	val s2 = asm_rule ⌜t1 ∧ t2⌝;
	val s3 = ⇔_mp_rule s1 s2;
	val s4 = simple_∀_elim ⌜t2 : BOOL⌝ s3;
	val s5 = asm_rule ⌜t2 : BOOL⌝;
	val s6 = ⇒_intro ⌜t2 : BOOL⌝ s5;
	val s7 = ⇒_intro ⌜t1 : BOOL⌝ s6;
	val s8 = ⇒_elim s4 s7;
	val s9 = ⇒_intro ⌜t1 ∧ t2⌝ s8;
	val s10 = simple_∀_intro ⌜t2 : BOOL⌝ s9;
	val s11 = simple_∀_intro ⌜t1 : BOOL⌝ s10;
in
fun ⦏∧_right_elim⦎ (thm :THM) : THM = (
let	val (t1,t2) = dest_∧(concl thm);
	val mf_s1 = list_simple_∀_elim [t1, t2] s11;
	val mf_s2 = ⇒_elim mf_s1 thm;
in
	mf_s2
end
handle complaint =>
divert complaint "dest_∧" "∧_right_elim" 7007 [fn () => string_of_thm thm]
);
end;

=TEX
=SML

fun ⦏list_∧_intro⦎ ([] : THM list) : THM = (
	fail "list_∧_intro" 7107 []
) | list_∧_intro thm_lst = (
let	fun aux [thm] = thm
	| aux (thm :: rest) = ∧_intro thm (aux rest)
	| aux _ = error "list_∧_intro" 0000 [];
	val s1 = aux thm_lst;
in
	s1
end);


=TEX
=SML

fun ⦏strip_∧_rule⦎ (thm : THM) : THM list = (
let	fun aux thm1 = (
	let	val s1 = ∧_left_elim thm1;
		val s2 = ∧_right_elim thm1;
	in
		aux s1 @ aux s2
	end
	handle (Fail _) => [thm1]
	);
	val s1 = aux thm;
in
	s1
end);
=TEX
\subsection{Concerning ∨}
As \cite{DS/FMU/IED/SML009} 5.13.
We prove the local theorem:
=GFT
s12 ⊢ ∀ t1 t2 ⦁ t1 ⇒ (t1 ∨ t2)

=TEX
=SML

local
	val s1 = asm_rule ⌜t1 ⇒ b⌝;
	val s3 = undisch_rule s1;
	val s4 = ⇒_intro ⌜t2 ⇒ b⌝ s3;
	val s5 = ⇒_intro ⌜t1 ⇒ b⌝ s4;
	val s6 = simple_∀_intro ⌜b :BOOL⌝ s5;
	val s7 = list_simple_∀_elim [⌜t1 : BOOL⌝,⌜t2 : BOOL⌝] ∨_thm;
	val s8 = eq_sym_rule s7;
	val s9 = ⇔_mp_rule s8 s6;
	val s10 = ⇒_intro ⌜t1 : BOOL⌝ s9;
	val s11 = simple_∀_intro ⌜t2 : BOOL⌝ s10;
	val s12 = simple_∀_intro ⌜t1 : BOOL⌝ s11;
in
fun ⦏∨_right_intro⦎ (tm : TERM) (thm : THM) : THM = (
let	val mf_s1 = list_simple_∀_elim [concl thm, tm] s12 ;
	val mf_s2 = ⇒_elim mf_s1 thm
in
	mf_s2
end
handle complaint =>
divert complaint "list_simple_∀_elim" "∨_right_intro" 3031 [fn () => string_of_term tm]
);
end;
=TEX
We prove the local theorem:
=GFT
s12 ⊢ ∀ t1 t2 ⦁ t2 ⇒ (t1 ∨ t2)

=TEX
=SML

local
	val s1 = asm_rule ⌜t2 ⇒ b⌝;
	val s3 = undisch_rule s1;
	val s4 = ⇒_intro ⌜t2 ⇒ b⌝ s3;
	val s5 = ⇒_intro ⌜t1 ⇒ b⌝ s4;
	val s6 = simple_∀_intro ⌜b :BOOL⌝ s5;
	val s7 = list_simple_∀_elim [⌜t1 : BOOL⌝,⌜t2 : BOOL⌝] ∨_thm;
	val s8 = eq_sym_rule s7;
	val s9 = ⇔_mp_rule s8 s6;
	val s10 = ⇒_intro ⌜t2 : BOOL⌝ s9;
	val s11 = simple_∀_intro ⌜t2 : BOOL⌝ s10;
	val s12 = simple_∀_intro ⌜t1 : BOOL⌝ s11;
in
fun ⦏∨_left_intro⦎ (tm : TERM) (thm : THM) : THM = (
let	val mf_s1 = list_simple_∀_elim [tm, concl thm] s12 ;
	val mf_s2 = ⇒_elim mf_s1 thm
in
	mf_s2
end
handle complaint =>
divert complaint "list_simple_∀_elim" "∨_left_intro" 3031 [fn () => string_of_term tm]
);
end;
=TEX
Entirely new:
We prove the prove the local theorem:
=GFT
¬_thm1 = ⊢ ∀ t ⦁ (¬ t) ⇔ (t ⇔ F)

=TEX
=SML

local
	val s1 = asm_rule mk_f;
	val s2 = contr_rule ⌜t : BOOL⌝ s1;
	val s3 = ⇒_intro mk_f s2;
	val s4 = asm_rule ⌜t ⇒ F⌝;
	val s5 = list_simple_∀_elim [⌜t : BOOL⌝, mk_f] ⇒_antisym_axiom;
	val s6 = ⇒_elim s5 s4;
	val s7 = ⇒_elim s6 s3;
	val s8 = ⇒_intro ⌜t ⇒ F⌝ s7;
	val s9 = simple_∀_elim ⌜t : BOOL⌝ ¬_thm;
	val s10 = eq_sym_rule s9;
	val s11 = subst_rule[(s10,⌜x : BOOL⌝)] ⌜x ⇒ (t ⇔ F)⌝ s8;
	val s12 = asm_rule ⌜t ⇔ F⌝;
	val s13 = eq_sym_rule s12;
	val s14 = subst_rule[(s13,⌜x : BOOL⌝)]⌜¬ x⌝ f_thm;
	val s15 = ⇒_intro ⌜t ⇔ F⌝ s14;
	val s16 = list_simple_∀_elim [⌜¬ t⌝, ⌜t ⇔ F⌝] ⇒_antisym_axiom;
	val s17 = ⇒_elim s16 s11;
	val s18 = ⇒_elim s17 s15;
	val s19 = simple_∀_intro ⌜t : BOOL⌝ s18;
in
val ⦏¬_thm1⦎ = save_thm("¬_thm1",s19);
end;
=TEX
We then locally prove:
=GFT
s10 ⊢ ∀ t1 t2 ⦁ (t1 ∨ t2) ⇒ (¬ t2) ⇒ t1
s17 ⊢ ∀ t1 t2 ⦁ (t1 ∨ t2) ⇒ (¬ t1) ⇒ t2

=TEX
=SML

local
	val s1 = asm_rule ⌜t1 ∨ t2⌝;
	val s2 = asm_rule ⌜t1 : BOOL⌝;
	val s3 = asm_rule ⌜t2 : BOOL⌝;
	val s4 = asm_rule ⌜¬ t2⌝;
	val s5 = ¬_elim ⌜t1 : BOOL⌝ s3 s4;
	val s6 = ∨_elim s1 s2 s5;
	val s7 = ⇒_intro ⌜¬ t2⌝ s6;
	val s8 = ⇒_intro ⌜t1 ∨ t2⌝ s7;
	val s9 = simple_∀_intro ⌜t2 : BOOL⌝ s8;
	val s10 = simple_∀_intro ⌜t1 : BOOL⌝ s9;

	val s11 = asm_rule ⌜¬ t1⌝;
	val s12 = ¬_elim ⌜t2 : BOOL⌝ s2 s11;
	val s13 = ∨_elim s1 s12 s3;
	val s14 = ⇒_intro ⌜¬ t1⌝ s13;
	val s15 = ⇒_intro ⌜t1 ∨ t2⌝ s14;
	val s16 = simple_∀_intro ⌜t2 : BOOL⌝ s15;
	val s17 = simple_∀_intro ⌜t1 : BOOL⌝ s16;
in
fun ⦏∨_cancel_rule⦎ (thm1 : THM) (thm2 : THM) : THM = (
let	val (t1,t2) = dest_∨ (concl thm1);
in
(let
	val mf_s1 = list_simple_∀_elim [t1,t2] s10;
	val mf_s2 = ⇒_elim mf_s1 thm1;
	val mf_s2 = ⇒_elim mf_s2 thm2;
in
	mf_s2
end
handle Fail _ =>
let	val mf_s1 = list_simple_∀_elim [t1,t2] s17;
	val mf_s2 = ⇒_elim mf_s1 thm1;
	val mf_s2 = ⇒_elim mf_s2 thm2;
in
	mf_s2
end)
end
handle complaint =>
list_divert complaint "∨_cancel_rule" [
	("dest_∨",7010,[fn () => string_of_thm thm1]),
	("⇒_elim",7050,[fn () => string_of_thm thm1, fn () => string_of_thm thm2])]
);
end;
=TEX
\subsection{Concerning ⇒}
Can only do $⇒\_match\_mp\_rule$ after we have $∀\_elim$.
=SML
fun ⦏strip_⇒_rule⦎ (thm : THM) : THM = (
let	val (p, q) = dest_⇒ (concl thm);
	val s1 = asm_rule p;
	val s2 = ⇒_elim thm s1;
in
	strip_⇒_rule s2
end
handle (Fail _) => thm
);

=TEX
=SML

fun ⦏all_⇒_intro⦎ (thm : THM) : THM = (
let	
	val hs = asms thm;
	val s1 = fold (uncurry ⇒_intro) hs thm;
in
	s1
end);
=TEX
Local theorem:
=GFT
s10 ⊢ ∀ t1 t2 t3 ⦁ (t1 ⇒ t2) ⇒ (t2 ⇒ t3) ⇒ (t1 ⇒ t3)

=TEX
=SML

local
	val s1 = asm_rule ⌜t1 ⇒ t2⌝;
	val s2 = asm_rule ⌜t2 ⇒ t3⌝;
	val s3 = undisch_rule s1;
	val s4 = ⇒_elim s2 s3;
	val s5 = ⇒_intro ⌜t1 : BOOL⌝ s4;
	val s6 = ⇒_intro ⌜t2 ⇒ t3⌝ s5;
	val s7 = ⇒_intro ⌜t1 ⇒ t2⌝ s6;
	val s8 = simple_∀_intro ⌜t3 : BOOL⌝ s7;
	val s9 = simple_∀_intro ⌜t2 : BOOL⌝ s8;
	val s10 = simple_∀_intro ⌜t1 : BOOL⌝ s9;
in
fun ⦏⇒_trans_rule⦎ (thm1 : THM) (thm2 : THM) : THM = (
let	val (t1,t2) = dest_⇒(concl thm1)
		handle complaint =>
		divert complaint "dest_⇒" "⇒_trans_rule" 7040
			[fn () => string_of_thm thm1];
	val (t2',t3) = dest_⇒(concl thm2)
		handle complaint =>
		divert complaint "dest_⇒" "⇒_trans_rule" 7040
			[fn () => string_of_thm thm2];
	val mf_s1 = list_simple_∀_elim[t1, t2, t3] s10;
	val mf_s2 = ⇒_elim mf_s1 thm1;
	val mf_s3 = ⇒_elim mf_s2 thm2
		handle complaint =>
		divert complaint "⇒_elim" "⇒_trans_rule" 7042
			[fn () => string_of_thm thm1, fn () => string_of_thm thm2];
in
	mf_s3
end);
end;
=TEX
=GFT
s13 ⊢ ∀ t1 t2 ⦁ (t1 ⇒ t2) ⇒ (¬ t2) ⇒ (¬ t1)

=TEX
=SML

local
	val s1 = asm_rule ⌜t1 : BOOL⌝;
	val s2 = asm_rule ⌜t1 ⇒ t2⌝;
	val s3 = ⇒_elim s2 s1;
	val s4 = asm_rule ⌜¬ t2⌝;
	val s5 = ¬_elim mk_f s3 s4;
	val s6 = ⇒_intro ⌜t1 : BOOL⌝ s5;
	val s7 = simple_∀_elim ⌜t1 : BOOL⌝ ¬_thm;
	val s8 = eq_sym_rule s7;
	val s9 = ⇔_mp_rule s8 s6;
	val s10 = ⇒_intro ⌜¬ t2⌝ s9;
	val s11 = ⇒_intro ⌜t1 ⇒ t2⌝ s10;
	val s12 = simple_∀_intro ⌜t2 : BOOL⌝ s11;
	val s13 = simple_∀_intro ⌜t1 : BOOL⌝ s12;
in
fun ⦏modus_tollens_rule⦎ (thm1 : THM) (thm2 : THM) : THM = (
let	val (t1,t2) = dest_⇒(concl thm1);
	val mf_s1 = list_simple_∀_elim[t1,t2] s13;
	val mf_s2 = ⇒_elim mf_s1 thm1;
	val mf_s3 = ⇒_elim mf_s2 thm2;
in
	mf_s3
end
handle complaint =>
list_divert complaint "modus_tollens_rule" [
	("dest_⇒",7040,[fn () => string_of_thm thm1]),
	("⇒_elim",7051,[fn () => string_of_thm thm1, fn () => string_of_thm thm2])]
);
end;
=TEX
\subsection{Concerning ⇔}
=SML
fun ⦏⇔_intro⦎ (thm1 : THM) (thm2 : THM) : THM = (
let	val (t1,t2) = dest_⇒ (concl thm1)
		handle complaint =>
		divert complaint "dest_⇒" "⇔_intro" 7040
		[fn () => string_of_thm thm1];
	val (t2',t1') = dest_⇒ (concl thm2) (* dummy test *)
		handle complaint =>
		divert complaint "dest_⇒" "⇔_intro" 7040
		[fn () => string_of_thm thm2];
	val s1 = list_simple_∀_elim[t1,t2] ⇒_antisym_axiom;
	val s2 = ⇒_elim s1 thm1;
	val s3 = ⇒_elim s2 thm2
		handle complaint =>
		divert complaint "⇒_elim" "⇔_intro" 7064
		[fn () => string_of_thm thm1,
		 fn () => string_of_thm thm2];
in
	s3
end);
=TEX
We prove the local theorems (two of them because getting
the two conjuncts if we did one would take similar, if not greater effort)
=GFT
s8 ⊢ (t1 ⇔ t2) ⇒ (t1 ⇒ t2)
s14 ⊢ (t1 ⇔ t2) ⇒ (t2 ⇒ t1)

=TEX
=SML

local
	val s1 = asm_rule ⌜t1 ⇔ t2⌝;
	val s2 = asm_rule ⌜t1 : BOOL⌝;
	val s3 = asm_rule ⌜t2 : BOOL⌝;
	val s4 = ⇔_mp_rule s1 s2;
	val s5 = ⇒_intro ⌜t1 : BOOL⌝ s4;
	val s6 = ⇒_intro ⌜t1 ⇔ t2⌝ s5;
	val s7 = simple_∀_intro⌜t2 : BOOL⌝ s6;
	val s8 = simple_∀_intro⌜t1 : BOOL⌝ s7;
	
	val s9 = eq_sym_rule s1;
	val s10 = ⇔_mp_rule s9 s3;
	val s11 = ⇒_intro ⌜t2 : BOOL⌝ s10;
	val s12 = ⇒_intro ⌜t1 ⇔ t2⌝ s11;
	val s13 = simple_∀_intro⌜t2 : BOOL⌝ s12;
	val s14 = simple_∀_intro⌜t1 : BOOL⌝ s13;
in
fun ⦏⇔_elim⦎ (thm : THM) : (THM * THM) = (
let	val (t1,t2) = dest_⇔(concl thm);
	val mf_s1 = list_simple_∀_elim[t1,t2]s8;
	val mf_s2 = ⇒_elim mf_s1 thm;
	val mf_s3 = list_simple_∀_elim[t1,t2]s14;
	val mf_s4 = ⇒_elim mf_s3 thm;
in
	(mf_s2, mf_s4)
end
handle complaint =>
divert complaint "dest_⇔" "⇔_elim" 7062
	[fn () => string_of_thm thm]
);
end;
=TEX
\subsection{Concerning =}
=SML
fun ⦏subst_conv⦎ (thm_lst : (THM * TERM) list) :
	(TERM -> CONV) = (
let		val s1 = subst_rule thm_lst
			handle complaint =>
			pass_on complaint "subst_rule" "subst_conv";
in
	(fn (template : TERM) =>
	(fn (tm:TERM) =>
	let	val all_vars = map mk_var (term_vars tm);
		val old_tvars = (map snd thm_lst);
		val new_tvars = list_variant all_vars old_tvars;
		val trans = combine new_tvars old_tvars;
		val template' = subst trans template;
		val new_template = mk_eq(tm,template')
			handle complaint =>
			divert complaint "mk_eq" "subst_conv" 3012
			[fn () => string_of_term tm,
			 fn () => string_of_term template];
		val s2 = refl_conv tm;
		val s3 = subst_rule (combine (map fst thm_lst) new_tvars) new_template s2
			handle complaint =>
			pass_on complaint "subst_rule" "subst_conv";
		val s4 = eq_trans_rule s2 s3
			handle complaint =>
			pass_on complaint "eq_trans_rule" "subst_conv";
	in
		s4
	end))
end);
=TEX
=IGN
subst_conv [(asm_rule ⌜v = 5⌝,⌜x:ℕ⌝)]
	⌜f x = f 6 ∧ f v = f 7⌝
	⌜f v = f 6 ∧ f v = f 7⌝;
subst_conv [(asm_rule ⌜v = 5⌝,⌜v:ℕ⌝)]
	⌜f v = f 6 ∧ f v = f 7⌝
	⌜f v = f 6 ∧ f v = f 7⌝;
subst_conv [(asm_rule ⌜v = v'' + 5⌝,⌜v:ℕ⌝)]
	⌜f v = f 6 ∧ f v = f v'⌝
	⌜f v = f 6 ∧ f v = f v'⌝;
=TEX
We prove a local theorem:
=GFT
s9 ⊢ ∀ t1 t2 ⦁ (t1 = t2) ⇔ (t2 = t1)

=TEX
=SML

local
	val s1 = asm_rule ⌜(t1 : 'a) = t2⌝;
	val s2 = eq_sym_rule s1;
	val s3 = ⇒_intro ⌜(t1 : 'a) = t2⌝ s2;
	val s4 = asm_rule ⌜(t2 : 'a) = t1⌝;
	val s5 = eq_sym_rule s4;
	val s6 = ⇒_intro ⌜(t2 : 'a) = t1⌝ s5;
	val s7 = ⇔_intro s3 s6;
	val s8 = simple_∀_intro ⌜t2 : 'a⌝ s7;
	val s9 = simple_∀_intro ⌜t1 : 'a⌝ s8;
in
val ⦏eq_sym_conv⦎ : CONV = (fn (tm:TERM) =>
let	val (t1,t2) = dest_eq tm;
	val mf_s1 = inst_type_rule[(type_of t1,mk_vartype"'a")] s9;
	val mf_s2 = list_simple_∀_elim[t1,t2] mf_s1;
in
	mf_s2
end
handle complaint =>
pass_on complaint "dest_eq" "eq_sym_conv"
);
end;
=TEX
We prove a local theorem:
=GFT
s ⊢ ∀ t1 t2 :'a ⦁ ¬(t1 = t2) ⇔ ¬(t2 = t1)

=TEX
=SML

local
	val s1 = eq_sym_conv ⌜(t1 : 'a) = t2⌝;
	val s2 = app_fun_rule ⌜$¬⌝ s1;
	val s3 = simple_∀_intro ⌜t2 : 'a⌝ s2;
	val s4 = simple_∀_intro ⌜t1 : 'a⌝ s3;
in
fun ⦏¬_eq_sym_rule⦎ (thm : THM) : THM = (
let	val (t1,t2) = dest_eq(dest_¬(concl thm));
	val mf_s1 = inst_type_rule[(type_of t1,mk_vartype "'a")] s4;
	val mf_s2 = list_simple_∀_elim [t1,t2] mf_s1;
	val mf_s3 = ⇔_mp_rule mf_s2 thm;
in
	mf_s3
end
handle complaint =>
list_divert complaint "¬_eq_sym_rule" [
	("dest_eq",7091,[fn () => string_of_thm thm]),
	("dest_¬",7091,[fn () => string_of_thm thm])]
);
end;
=TEX

\subsection{Concerning ∀}
=FRULE 1 Rule
list_simple_∀_intro
[⌜x1⌝, ..., ⌜xn⌝]
├
Γ ⊢ t[x1, ..., xn]
├
Γ ⊢ ∀ x1 ... xn ⦁ t[x1, ..., xn]

=TEX
=SML

fun ⦏list_simple_∀_intro⦎ (tml : TERM list) (thm :THM) : THM = (
	fold (uncurry simple_∀_intro) tml thm
	handle complaint =>
	pass_on complaint "simple_∀_intro" "list_simple_∀_intro"
);

=TEX
=SML

fun ⦏all_∀_intro⦎ (thm : THM) : THM = (
let	val cfrees = rev(frees(concl thm));
	val afrees = list_union (op =$) (map frees (asms thm));
	val nfrees = cfrees drop (fn x => present (op =$) x afrees);
	val s1 = list_simple_∀_intro nfrees thm;
in
	s1
end);

=TEX
=SML

fun ⦏all_simple_∀_elim⦎ (thm : THM) : THM = (
let	val c = concl thm;
	val cfrees = frees c;
	val all_frees = list_union (op =$)( cfrees :: ( (map frees (asms thm))));
	val qvs = fst(strip_∀ c);
	val qvs' = list_variant all_frees qvs;
	val s1 = list_simple_∀_elim qvs' thm;
in
	s1
end);
=TEX
\subsection{Concerning ε}
=SML
fun ⦏ε_intro_rule⦎ (thm : THM) : THM = (
let	val (tm1, tm2) = dest_app (concl thm);
	val s1 = inst_type_rule [(type_of tm2, mk_vartype "'a")] ε_axiom;
	val s2 = simple_∀_elim tm1 s1;
	val s3 = simple_∀_elim tm2 s2;
	val s4 = ⇒_elim s3 thm;
in
	s4
end
handle complaint =>
divert complaint "dest_app" "ε_intro_rule" 7016 [fn () => string_of_thm thm]
);
=TEX

=SML
fun ⦏simple_ε_elim_rule⦎ (tm : TERM) (thm1 : THM) (thm2 : THM) : THM = (
let	val sideeffect = dest_var tm
		handle complaint =>
		pass_on complaint "dest_var" "simple_ε_elim_rule";
	val sideeffect = if is_free_in tm (concl thm2)
		then fail "simple_ε_elim_rule" 7120 [
			fn () => string_of_term tm,
			fn () => string_of_thm thm2]
		else ();
	val (tm1, ctm1) = dest_app (concl thm1);
	val sideeffect = if is_free_in tm tm1
		then fail "simple_ε_elim_rule" 7122 [
			fn () => string_of_term tm,
			fn () => string_of_thm thm1]
		else ();
	val tm1tm = mk_app (tm1, tm);
	val s1 = disch_rule tm1tm thm2;
	val s2 = simple_∀_intro tm s1
		handle complaint =>
		if area_of complaint = "simple_∀_intro"
		then fail "simple_ε_elim_rule" 7121 [
			fn () => string_of_term tm,
			fn () => string_of_thm thm2,
			fn () => string_of_term tm1tm]
		else reraise complaint (area_of complaint);
	val s3 = simple_∀_elim ctm1 s2;
	val s4 = ⇒_elim s3 thm1;
in
	s4
end
handle complaint =>
list_divert complaint "simple_ε_elim_rule" [
	("dest_app",7019,[fn () => string_of_thm thm1]),
	("mk_app",7054,[fn () => string_of_term tm]),
	("disch_rule",7108,[fn () => fst(dest_var tm)])
	]
);
=TEX
\subsection{Concerning ∃}
=GFT
val ∃_intro_thm = ⊢ ∀ P x⦁ P x ⇒ $∃ P
=TEX
=SML
local
	val tva = mk_vartype "'a";
	val tvb = mk_vartype "'b";
	val P = mk_var("P",mk_→_type(tva,BOOL));
	val x = mk_var("x",tva);
	val Px = mk_app(P, x);
	val s1 = asm_rule Px;
	val s2 = ε_intro_rule s1;
	val abs = mk_simple_λ(x,Px);
	val s3 = app_arg_rule P ∃_def;
	val s4 = simple_β_conv (snd(dest_eq(concl s3)));
	val s5 = eq_trans_rule s3 s4;
	val s6 = eq_sym_rule s5;
	val s7 = ⇔_mp_rule s6 s2;
	val s8 = ⇒_intro Px s7;
	val s9 = simple_∀_intro x s8;
	val s10 = simple_∀_intro P s9;
in
	val ⦏∃_intro_thm⦎ = save_thm ("∃_intro_thm", s10);
end;
=TEX
=SML
local
	val tva = mk_vartype "'a";
in
fun ⦏simple_∃_intro⦎ (tm : TERM) (thm : THM) : THM = (
let	val (x, t1x) = dest_simple_∃ tm
		handle complaint =>
		pass_on complaint "dest_simple_∃" "simple_∃_intro";
	val abs = snd(dest_app tm);
	val t2 = (case term_match (concl thm) t1x of
		(_, [(ltm, _)]) => ltm
		|(_, []) => x
		|Other => fail "simple_∃_intro" 7047 [
			fn () => string_of_term tm,
			fn () => string_of_thm thm])
		handle complaint =>
		divert complaint "term_match" "simple_∃_intro" 7047 [
			fn () => string_of_term tm,
			fn () => string_of_thm thm];
	val s1 = inst_type_rule[(type_of x, tva)]∃_intro_thm;
	val s2 = list_simple_∀_elim[abs,t2]s1;
	val abst2 = fst(dest_⇒(concl s2));
	val s3 = simple_β_conv abst2;
	val s4 = eq_sym_rule s3;
	val s5 = ⇔_mp_rule s4 thm;
	val s6 = ⇒_elim s2 s5;
in
	s6
end);
end;
=TEX

=IGN
Old style implementation:
fun ⦏simple_∃_intro⦎ (tm : TERM) (thm : THM) : THM = (
let	val (x, t1x) = dest_simple_∃ tm
		handle complaint =>
		pass_on complaint "dest_simple_∃" "simple_∃_intro";
	val abs = snd(dest_app tm);
	val t2 = (case term_match (concl thm) t1x of
		(_, [(ltm, _)]) => ltm
		|(_, []) => x
		|Other => fail "simple_∃_intro" 7047 [
			fn () => string_of_term tm,
			fn () => string_of_thm thm])
		handle complaint =>
		divert complaint "term_match" "simple_∃_intro" 7047 [
			fn () => string_of_term tm,
			fn () => string_of_thm thm];
	val abst2 = mk_app (abs, t2);
	val s1 = simple_β_conv abst2;
	val s2 = eq_sym_rule s1;
	val s3 = ⇔_mp_rule s2 thm;
	val s4 = ε_intro_rule s3;
	val s5 = inst_type_rule [(type_of x, mk_vartype "'a")] ∃_def;
	val s6 = app_arg_rule abs s5;
	val s7 = simple_β_conv (snd(dest_eq(concl s6)));
	val s8 = eq_trans_rule s6 s7;
	val s9 = eq_sym_rule s8;
	val s10 = ⇔_mp_rule s9 s4;
in
	s10
end);
=TEX
=GFT
val simple_∃_elim_thm = ⊢ ∀ t1 t2⦁ $∃ t1 ⇒
	(∀ y⦁ t1 y ⇒ t2) ⇒ t2

=TEX
=SML

val ⦏simple_∃_elim_thm⦎ = (let
	val tva = mk_vartype "'a";
	val tvb = mk_vartype "'b";
	val t1 = mk_var("t1",mk_→_type(tva,BOOL));
	val t2 = mk_var("t2",BOOL);
	val y = mk_var("y",tva);
	val ∀t1y = mk_simple_∀(y,mk_⇒(mk_app(t1,y),t2));
	
	val ∃t1 = mk_app(mk_const("∃",mk_→_type(mk_→_type
		(tva,BOOL),BOOL)),t1);
	
	val s1 = asm_rule ∃t1;
	val s2 = app_arg_rule t1 ∃_def;
	val s3 = ⇔_mp_rule s2 s1;
	val s4 = simple_β_conv (concl s3);
	val s5 = ⇔_mp_rule s4 s3;
	val s6 = asm_rule ∀t1y;
	val s7 = simple_∀_elim (snd(dest_app(concl s5))) s6;
	val s8 = ⇒_elim s7 s5;
	val s9 = ⇒_intro ∀t1y s8;
	val s10 = ⇒_intro ∃t1 s9;
	val s11 = simple_∀_intro t2 s10;
	val s12 = simple_∀_intro t1 s11;
in
	s12
end);

=TEX
=SML

local
	val tva = mk_vartype "'a";
in
fun ⦏simple_∃_elim⦎ (v : TERM) (thm1 : THM) (thm2 : THM) : THM = (
let	val sideeffect = if is_var v
		then ()
		else term_fail "simple_∃_elim" 3007 [v];
	val cthm1 = concl thm1;
	val (x, tx) = dest_simple_∃ cthm1;
	val t1 = snd(dest_app cthm1);
	val t1v = mk_app (t1, v);
	val t2 = concl thm2;
	val sideeffect = if is_free_in v t2
		then fail "simple_∃_elim" 7120 [
			fn () => string_of_term v,
			fn () => string_of_thm thm2]
		else if is_free_in v cthm1
		then fail "simple_∃_elim" 7120 [
			fn () => string_of_term v,
			fn () => string_of_thm thm1]
		else ();
	val s1 = inst_type_rule [(type_of x,tva)] simple_∃_elim_thm;
	val s2 = list_simple_∀_elim[t1,t2] s1;
	val s3 = ⇒_elim s2 thm1;
	val s4 = simple_β_conv t1v;
	val t1y = snd(dest_eq(concl s4));
	val s5 = asm_rule t1v; (* fst(⇔_elim...) *)
	val s6 = ⇔_mp_rule s4 s5;
	val s8 = ⇒_intro t1y thm2;
	val s9 = ⇒_elim s8 s6;
	val s10 = ⇒_intro t1v s9;
	val s11 = simple_∀_intro v s10
		handle complaint =>
		divert complaint "simple_∀_intro" "simple_∃_elim" 7121 [
			fn () => string_of_term v,
			fn () => string_of_thm thm2,
			fn () => string_of_term t1y];
	val s12 = ⇒_elim s3 s11;
in
	s12
end
handle complaint =>
list_divert complaint "simple_∃_elim" [
	("dest_simple_∃",7109,[fn () => string_of_thm thm1]),
	("mk_app",7014,[fn () => string_of_term v])
	]
);
end;
=TEX

=IGN
Old style implementation:
fun ⦏simple_∃_elim⦎ (v : TERM) (thm1 : THM) (thm2 : THM)
	: THM = (
let	val sideeffect = if is_var v
		then ()
		else term_fail "simple_∃_elim" 3007 [v];
	val cthm1 = concl thm1;
	val (x, tx) = dest_simple_∃ cthm1;
	val t1 = snd(dest_app cthm1);
	val t1v = mk_app (t1, v);
	val tvx = (case gen_vars [BOOL] ([(concl thm1), (concl thm2), v]
		@ asms thm1 @ asms thm2) of
		[term] => term
		| _ => error "simple_∃_elim" 6032 [])
		handle complaint =>
		pass_on complaint "gen_vars" "simple_∃_elim";
	val s1 = inst_type_rule [(type_of x, mk_vartype "'a")] ∃_def;
	val s2 = app_arg_rule t1 s1;
	val s3 = ⇔_mp_rule s2 thm1;
	val s5 = conv_rule simple_β_conv s3;
	val s6 = simple_β_conv t1v;
	val s7 = eq_sym_rule s6;
	val asm = fst(dest_eq(concl s7))
	val s8 = ⇒_intro asm thm2;
	val s9 = mk_⇒ (tvx, concl thm2);
	val s10 = subst_rule [(s7, tvx)] s9 s8;
	val s11 = undisch_rule s10;
	val s12 = (simple_ε_elim_rule v s5 s11)
		handle complaint =>
		if area_of complaint <> "simple_ε_elim_rule"
		then reraise complaint (area_of complaint)
		else if if_free_in v cthm1
		then fail "simple_∃_elim" 7120 [
			fn () => string_of_term v,
			fn () => string_of_thm thm1]
		else if is_free_in v (concl thm2)
		then fail "simple_∃_elim" 7120 [
			fn () => string_of_term v,
			fn () => string_of_thm thm2]
		else fail "simple_∃_elim" 7121 [
			fn () => string_of_term v,
			fn () => string_of_thm thm2,
			fn () => string_of_term asm];
in
	s12
end
handle complaint =>
list_divert complaint "simple_∃_elim" [
	("dest_simple_∃",7109,[fn () => string_of_thm thm1]),
	("mk_app",7014,[fn () => string_of_term v])
	]
);
=TEX

=SML
val ⦏simple_∃_ε_conv⦎ : CONV = (fn (tm:TERM) =>
let	val (x, tx) = (dest_simple_∃ tm)
		handle complaint =>
		pass_on complaint "dest_simple_∃" "simple_∃_ε_conv";
	val t1 = mk_simple_λ (x, tx);
	val s1 = inst_type_rule [(type_of x, mk_vartype "'a")] ∃_def;
	
	val s2 = app_arg_rule t1 s1;
	val s3 = concl s2;
	val conv1 = (RAND_C simple_β_conv THEN_C
			RAND_C simple_β_conv)
	val s4 = conv1 s3;
	val s5 = ⇔_mp_rule s4 s2;
in
	s5
end);
=TEX

=SML
fun ⦏simple_∃_ε_rule⦎ (thm : THM) : THM = (
let	val s1 = conv_rule simple_∃_ε_conv thm
in
	s1
end
	handle complaint =>
	divert complaint "simple_∃_ε_conv" "simple_∃_ε_rule" 7092
	[fn () => string_of_thm thm]
);
=TEX

See section~\ref{SplitStructure} for an explanation of the
structure declarations in the next piece of Standard~ML.

=SML
end; (* of structure DerivedRules1 *)

structure ⦏DerivedRules1⦎ : DerivedRules1 = struct

open DerivedRules1;
=TEX

\subsection{Concerning $if\ldots then\ldots else \ldots$}
=SML
local
	val s1 = app_arg_rule ⌜a : BOOL⌝ cond_def;
	val s2 = app_arg_rule ⌜t1 : 'a⌝ s1;
	val s3 = app_arg_rule ⌜t2 : 'a⌝ s2;
	val s4 = conv_rule (MAP_C simple_β_conv) s3;
	val s5 = simple_∀_intro ⌜t2 : 'a⌝ s4;
	val s6 = simple_∀_intro ⌜t1 : 'a⌝ s5;
	val s7 = simple_∀_intro ⌜a : BOOL⌝ s6;

in
	val ⦏cond_thm⦎ = save_thm("cond_thm", s7);
end;
=TEX
A local function:
=FRULE 1 Rule
if_intro_rule
⌜a⌝
├
Γ1, a ⊢ x = tt ; Γ2, ¬a' ⊢ x = et
├
Γ1 ∪ Γ2 ⊢ x = if a then tt else et
=TEX
=GFT
s35 ⊢ ∀ x a t1 t2 ⦁ (a ⇒ (x = t1)) ⇒ (¬ a ⇒ (x = t2)) ⇒
	(x = if a then t1 else t2)

=TEX
=SML

local
	val s1 = asm_rule ⌜a ⇒ ((x:'a) = t1)⌝;
	val s2 = asm_rule ⌜a ⇔ T⌝;
	val s3 = ⇔_t_elim s2;
	val s4 = ⇒_elim s1 s3;
	val s5 = ⇒_intro ⌜a ⇔ T⌝ s4;
	val s6 = asm_rule ⌜¬ a ⇒ ((x:'a) = t2)⌝;
	val s7 = asm_rule ⌜a ⇔ F⌝;
	val s8 = simple_∀_elim ⌜a : BOOL⌝ ¬_thm1;
	val s9 = eq_sym_rule s8;
	val s10 = ⇔_mp_rule s9 s7;
	val s11 = ⇒_elim s6 s10;
	val s12 = ⇒_intro ⌜a ⇔ F⌝ s11;
	val s13 = ∧_intro s5 s12;
	val s14 = simple_β_conv
		(mk_app(
		(mk_simple_λ(⌜x : 'a⌝, concl s13),
		⌜x : 'a⌝)));
	val s15 = eq_sym_rule s14;
	val s16 = ⇔_mp_rule s15 s13;
	val s17 = ε_intro_rule s16;
	val s18 = list_simple_∀_elim[⌜a : BOOL⌝, ⌜t1 : 'a⌝, ⌜t2 : 'a⌝] cond_thm;
	val s19 = eq_sym_rule s18;
	val s20 = subst_rule[(s19,⌜y : 'a⌝)]
		(mk_app(fst(dest_app(concl s17)),⌜y : 'a⌝))
		s17;
	val s21 = conv_rule simple_β_conv s20;

	val s22 = ∧_left_elim s21;
	val s23 = undisch_rule s22;
	val s24 = eq_sym_rule s4;
	val s25 = subst_rule[(s24,⌜y : 'a⌝)]
		(mk_app(fst(dest_app(concl s23)),⌜y : 'a⌝))
		s23;
	
	val s26 = ∧_right_elim s21;
	val s27 = undisch_rule s26;
	val s28 = eq_sym_rule s11;
	val s29 = subst_rule[(s28,⌜y : 'a⌝)]
		(mk_app(fst(dest_app(concl s27)),⌜y : 'a⌝))
		s27;

	val s30 = simple_∀_elim ⌜a : BOOL⌝ bool_cases_axiom;
	val s31 = ∨_elim s30 s25 s29;
	val s32 = eq_sym_rule s31;
	val s33 = ⇒_intro ⌜¬ a ⇒ ((x:'a) = t2)⌝ s32;
	val s34 = ⇒_intro ⌜a ⇒ ((x:'a) = t1)⌝ s33;
	val s35 = list_simple_∀_intro[⌜x : 'a⌝, ⌜a : BOOL⌝, ⌜t1 : 'a⌝, ⌜t2 : 'a⌝] s34;
in
fun ⦏if_intro_rule⦎ (a : TERM) (thm1 : THM) (thm2 : THM) : THM = (
let	val (x,t1) = dest_eq(concl thm1)
		handle complaint =>
		divert complaint "dest_eq" "if_intro_rule" 6020
			[fn () => string_of_thm thm1];
	val (x',t2) = dest_eq(concl thm2)
		handle complaint =>
		divert complaint "dest_eq" "if_intro_rule" 6020
			[fn () => string_of_thm thm2];
	val mf_s1 = ⇒_intro a thm1
		handle complaint =>
		divert complaint "⇒_intro" "if_intro_rule" 3031
			[fn () => string_of_term a];
	val mf_s2 = ⇒_intro (mk_¬ a) thm2;
	val mf_s3 = inst_type_rule[(type_of x,mk_vartype"'a")]
		s35;
	val mf_s4 = list_simple_∀_elim[x,a,t1,t2]mf_s3;
	val mf_s5 = ⇒_elim mf_s4 mf_s1;
	val mf_s6 = ⇒_elim mf_s5 mf_s2;
in
	mf_s6
end);
end; (* of local val s1 ... *)
=TEX
=FRULE 1 Rule
if_then_elim_rule
├
Γ ⊢ x = if tc then tt else te
├
Γ ⊢ tc ⇒ x = tt
=TEX
Prove the local theorem:
=GFT
s28 ⊢ ∀ x a t1 t2 ⦁ (x = if a then t1 else t2) ⇒ (a ⇒ x = t1)

=TEX
=SML

local
	val s1 = asm_rule ⌜a : BOOL⌝;
	val s2 = asm_rule ⌜a ⇔ F⌝;
	val s3 = simple_∀_elim ⌜a : BOOL⌝ ¬_thm1;
	val s4 = eq_sym_rule s3;
	val s5 = ⇔_mp_rule s4 s2;
	val s6 = ¬_elim ⌜(t1 : 'a) = t2⌝ s1 s5;
	val s7 = ⇒_intro ⌜a ⇔ F⌝ s6;
	val s8 = refl_conv ⌜t1 : 'a⌝;
	val s9 = ⇒_intro ⌜a ⇔ T⌝ s8;
	val s10 = ∧_intro s9 s7;

	val s11 = simple_β_conv
		⌜(λ y: 'a ⦁ ((a ⇔ T) ⇒ y = t1) ∧ ((a ⇔ F) ⇒ y = t2)) t1⌝;
	val s12 = eq_sym_rule s11;
	val s13 = ⇔_mp_rule s12 s10;
	val s14 = ε_intro_rule s13;
	val s15 = list_simple_∀_elim [⌜a : BOOL⌝, ⌜t1 : 'a⌝, ⌜t2 : 'a⌝] cond_thm;
	val s16 = eq_sym_rule s15;
	val s17 = subst_rule[(s16,⌜z : 'a⌝)]
		(mk_app(fst(dest_app(concl s14)),⌜z : 'a⌝))
		s14;
	val s18 = asm_rule ⌜(x:'a) = if a then t1 else t2⌝;
	val s19 = eq_sym_rule s18;
	val s20 = subst_rule[(s19,⌜z : 'a⌝)]
		(mk_app(fst(dest_app(concl s17)),⌜z : 'a⌝))
		s17;
	val s21 = conv_rule simple_β_conv s20;
	val s22 = ∧_left_elim s21;
	val s23 = ⇔_t_intro s1;
	val s25 = ⇒_elim s22 s23;
	val s26 = ⇒_intro ⌜a : BOOL⌝ s25;
	val s27 = ⇒_intro ⌜(x:'a) = if a then t1 else t2⌝ s26;
	val s28 = list_simple_∀_intro[⌜x : 'a⌝, ⌜a : BOOL⌝, ⌜t1 : 'a⌝, ⌜t2 : 'a⌝] s27;
in
fun ⦏if_then_elim_rule⦎ (thm : THM) = (
let	val (x,ifa)= dest_eq(concl thm)
		handle complaint =>
		pass_on complaint "dest_eq" "if_then_elim_rule";
	val (a,t1,t2) = dest_if ifa
		handle complaint =>
		pass_on complaint "dest_if" "if_then_elim_rule";
	val mf_s1 = inst_type_rule[(type_of x,mk_vartype "'a")] s28;
	val mf_s2 = list_simple_∀_elim[x,a,t1,t2] mf_s1;
	val mf_s3 = ⇒_elim mf_s2 thm;
in
	mf_s3
end);
end; (* of local val s1 = ... *)
=TEX
=FRULE 1 Rule
if_else_elim_rule
├
Γ ⊢ x = if tc then tt else te
├
Γ ⊢ ¬ tc ⇒ x = te
=TEX
=GFT
s29 ⊢ ∀ x a t1 t2 ⦁ x = (if a then t1 else t2) ⇒ ¬ a ⇒ x = t2

=TEX
=SML

local
	val s1 = asm_rule ⌜¬ a ⌝;
	val s2 = asm_rule ⌜a ⇔ T⌝;
	val s4 = ⇔_t_elim s2;
	val s6 = ¬_elim ⌜(t2 : 'a) = t1⌝ s4 s1;
	val s7 = ⇒_intro ⌜a ⇔ T⌝ s6;
	val s8 = refl_conv ⌜t2 : 'a⌝;
	val s9 = ⇒_intro ⌜a ⇔ F⌝ s8;
	val s10 = ∧_intro s7 s9;

	val s11 = simple_β_conv
		⌜(λ y: 'a ⦁ ((a ⇔ T) ⇒ y = t1) ∧ ((a ⇔ F) ⇒ y = t2)) t2⌝;
	val s12 = eq_sym_rule s11;
	val s13 = ⇔_mp_rule s12 s10;
	val s14 = ε_intro_rule s13;
	val s15 = list_simple_∀_elim [⌜a : BOOL⌝, ⌜t1 : 'a⌝, ⌜t2 : 'a⌝] cond_thm;
	val s16 = eq_sym_rule s15;
	val s17 = subst_rule[(s16,⌜z : 'a⌝)]
		(mk_app(fst(dest_app(concl s14)),⌜z : 'a⌝))
		s14;
	val s18 = asm_rule ⌜(x:'a) = if a then t1 else t2⌝;
	val s19 = eq_sym_rule s18;
	val s20 = subst_rule[(s19,⌜z : 'a⌝)]
		(mk_app(fst(dest_app(concl s17)),⌜z : 'a⌝))
		s17;
	val s21 = conv_rule simple_β_conv s20;
	val s22 = ∧_right_elim s21;
	val s23 = simple_∀_elim ⌜a : BOOL⌝ ¬_thm1;
	val s24 = fst(⇔_elim s23);
	val s25 = ⇒_trans_rule s24 s22;
	val s26 = ⇒_elim s25 s1;
	val s27 = ⇒_intro ⌜¬ a⌝ s26;
	val s28 = ⇒_intro ⌜(x:'a) = if a then t1 else t2⌝ s27;
	val s29 = list_simple_∀_intro[⌜x : 'a⌝, ⌜a : BOOL⌝, ⌜t1 : 'a⌝, ⌜t2 : 'a⌝] s28;
in
fun ⦏if_else_elim_rule⦎ (thm : THM) = (
let	val (x,ifa)= dest_eq(concl thm)
		handle complaint =>
		pass_on complaint "dest_eq" "if_else_elim_rule";
	val (a,t1,t2) = dest_if ifa
		handle complaint =>
		pass_on complaint "dest_if" "if_else_elim_rule";
	val mf_s1 = inst_type_rule[(type_of x,mk_vartype "'a")] s29;
	val mf_s2 = list_simple_∀_elim[x,a,t1,t2] mf_s1;
	val mf_s3 = ⇒_elim mf_s2 thm;
in
	mf_s3
end);
end; (* of local val s1 = ... *)
=TEX
=GFT
s9 ⊢ ∀ f a t1 t2 ⦁ f(if a then t1 else t2) =
	if a then (f t1) else (f t2)
s11 ⊢ ∀ f a t1 t2 ⦁ if a then (f t1) else (f t2) =
	f(if a then t1 else t2)

=TEX
=SML

local
	val s1 = refl_conv ⌜if a then (t1:'a) else t2⌝;
	val s2 = if_then_elim_rule s1;
	val s3 = undisch_rule s2;
	val s4 = app_fun_rule ⌜f : 'a → 'b⌝ s3;
	val s5 = if_else_elim_rule s1;
	val s6 = undisch_rule s5;
	val s7 = app_fun_rule ⌜f : 'a → 'b⌝ s6;
	val s8 = if_intro_rule ⌜a : BOOL⌝ s4 s7;
	val s9 = list_simple_∀_intro[⌜f : 'a → 'b⌝, ⌜a : BOOL⌝, ⌜t1 : 'a⌝, ⌜t2 : 'a⌝] s8;
	val s10 = eq_sym_rule s8;
	val s11 = list_simple_∀_intro[⌜f : 'a → 'b⌝, ⌜a : BOOL⌝, ⌜t1 : 'a⌝, ⌜t2 : 'a⌝] s10;
in
val ⦏app_if_conv⦎ : CONV = (fn (tm:TERM) =>
let	val (f,ifa) = dest_app tm;
	val (a,t1,t2) = dest_if ifa;
	val (aty,bty) = dest_→_type(type_of f);
	val mf_s1 = inst_type_rule[(aty,mk_vartype"'a"),(bty,mk_vartype"'b")]s9;
	val mf_s2 = list_simple_∀_elim[f,a,t1,t2] mf_s1;
in
	mf_s2
end
handle complaint =>
list_divert complaint "app_if_conv" [
	("dest_app",7098,[fn () => string_of_term tm]),
	("dest_if",7098,[fn () => string_of_term tm])]
);
val ⦏if_app_conv⦎ : CONV = (fn (tm:TERM) =>
let	val (a,ft1,ft2) = dest_if tm;
	val (f,t1) = dest_app ft1;
	val (f',t2) = dest_app ft2;
	val (aty,bty) = dest_→_type(type_of f);
	val mf_s1 = inst_type_rule[(aty,mk_vartype"'a"),(bty,mk_vartype"'b")]s11;
	val mf_s2 = list_simple_∀_elim[f,a,t1,t2] mf_s1;
	val mf_s3 = refl_conv tm;
	val mf_s4 = eq_trans_rule mf_s3 mf_s2;
in
	mf_s4
end
handle complaint =>
list_divert complaint "if_app_conv" [
	("dest_app",7037,[fn () => string_of_term tm]),
	("dest_if",7037,[fn () => string_of_term tm]),
	("eq_trans_rule",7038,[fn () => string_of_term tm])]
);
end; (* local val s1 = ... *)
=TEX
We prove the local theorem:
=GFT
s12 ⊢ ∀ a t1 t2 ⦁ (a ⇒ t1) ⇒ (¬ a ⇒ t2) ⇒
	(if a then t1 else t2)

=TEX
=SML

local
	val s1 = asm_rule ⌜a ⇒ t1⌝;
	val s2 = undisch_rule s1;
	val s3 = ⇔_t_intro s2;
	val s4 = eq_sym_rule s3;

	val s5 = asm_rule ⌜¬ a ⇒ t2⌝;
	val s6 = undisch_rule s5;
	val s7 = ⇔_t_intro s6;
	val s8 = eq_sym_rule s7;

	val s9 = if_intro_rule ⌜a:BOOL⌝ s4 s8;
	val s10 = eq_sym_rule s9;
	val s11 = ⇔_t_elim s10;
	val s12 = ⇒_intro ⌜¬ a ⇒ t2⌝ s11;
	val s13 = ⇒_intro ⌜a ⇒ t1⌝ s12;
	val s14= list_simple_∀_intro[⌜a : BOOL⌝, ⌜t1 : BOOL⌝, ⌜t2 : BOOL⌝] s13;
in
fun ⦏if_intro⦎ (a : TERM) (thm1 : THM) (thm2 : THM) : THM = (
let	val mf_s1 = ⇒_intro a thm1
		handle complaint =>
		divert complaint "⇒_intro" "if_intro" 3031 [fn () => string_of_term a];
	val mf_s2 = ⇒_intro (mk_¬ a) thm2;
	val mf_s3 = list_simple_∀_elim[a,concl thm1, concl thm2]s14
		handle complaint =>
		divert complaint "list_simple_∀_elim" "if_intro" 3031
			[fn () => string_of_term a];
	val mf_s4 = ⇒_elim mf_s3 mf_s1;
	val mf_s5 = ⇒_elim mf_s4 mf_s2;
in
	mf_s5
end);
end; (* of local val s1 ... *)
=TEX
Prove the local theorem:
=GFT
s10 ⊢ ∀ a t1 t2 ⦁ (if a then t1 else t2) ⇒ (a ⇒ t1)

=TEX
=SML

local
	val s1 = asm_rule ⌜if a then (t1:BOOL) else t2⌝;
	val s2 = ⇔_t_intro s1;
	val s3 = eq_sym_rule s2;
	val s4 = if_then_elim_rule s3;
	val s5 = undisch_rule s4;
	val s6 = eq_sym_rule s5;
	val s7 = ⇔_t_elim s6;
	val s8 = ⇒_intro ⌜a : BOOL⌝ s7;
	val s9 = ⇒_intro ⌜if a then (t1:BOOL) else t2⌝ s8;
	val s10 = list_simple_∀_intro[⌜a : BOOL⌝, ⌜t1 : BOOL⌝, ⌜t2 : BOOL⌝] s9;
in
fun ⦏if_then_elim⦎ (thm : THM) : THM = (
let	val (a,t1,t2) = dest_if (concl thm);
	val mf_s2 = list_simple_∀_elim[a,t1,t2] s10;
	val mf_s3 = ⇒_elim mf_s2 thm;
in
	mf_s3
end
handle complaint =>
list_divert complaint "if_then_elim" [
	("dest_if",7012,[fn () => string_of_thm thm])]
);
end; (* of local val s1 = ... *)
=TEX
=GFT
s10 ⊢ ∀ a t1 t2 ⦁ (if a then t1 else t2) ⇒ ¬ a ⇒ t2

=TEX
=SML

local
	val s1 = asm_rule ⌜if a then (t1:BOOL) else t2⌝;
	val s2 = ⇔_t_intro s1;
	val s3 = eq_sym_rule s2;
	val s4 = if_else_elim_rule s3;
	val s5 = undisch_rule s4;
	val s6 = eq_sym_rule s5;
	val s7 = ⇔_t_elim s6;
	val s8 = ⇒_intro ⌜¬ a⌝ s7;
	val s9 = ⇒_intro ⌜if a then (t1:BOOL) else t2⌝ s8;
	val s10 = list_simple_∀_intro[⌜a : BOOL⌝, ⌜t1 : BOOL⌝, ⌜t2 : BOOL⌝] s9;
in
fun ⦏if_else_elim⦎ (thm : THM) : THM = (
let	val (a,t1,t2) = dest_if (concl thm);
	val mf_s2 = list_simple_∀_elim[a,t1,t2] s10;
	val mf_s3 = ⇒_elim mf_s2 thm;
in
	mf_s3
end
handle complaint =>
list_divert complaint "if_else_elim" [
	("dest_if",7012,[fn () => string_of_thm thm])]
);
end; (* of local val s1 = ... *)
=TEX
\subsection{Concerning Functional Application}
=SML
fun ⦏ext_rule⦎ (thm : THM): THM  = (
let	val (h,c) =dest_thm thm;
	val (f,g) = dest_eq c;
	val mgv = hd(gen_vars [fst(dest_→_type(type_of f))]
		(c :: h));
	val s1 = app_arg_rule mgv thm;
	val s2 = simple_∀_intro mgv s1;
in
	s2
end
handle complaint =>
list_divert complaint "ext_rule" [
	("dest_eq",6020,[fn () => string_of_thm thm]),
	("dest_→_type",7026,[fn () => string_of_thm thm])]
);
=TEX
\subsection{Concerning Assumptions}
=SML
fun ⦏asm_intro⦎ (tm : TERM) (thm : THM) : THM = (
let	val s1 = ⇒_intro tm thm
		handle complaint =>
		pass_on complaint "⇒_intro" "asm_intro";
	val s2 = asm_rule tm;
	val s3 = ⇒_elim s1 s2;
in
	s3
end);
=TEX
=GFT
s15 ⊢ ∀ a t ⦁ (a ⇒ t) ⇒ (¬ a ⇒ t) ⇒ t

=TEX
=SML

local
	val s1 = simple_∀_elim ⌜a : BOOL⌝ bool_cases_axiom;
	val s2 = asm_rule ⌜a ⇒ t⌝;
	val s3 = asm_rule ⌜a ⇔ T⌝;
	val s4 = ⇔_t_elim s3;
	val s5 = ⇒_elim s2 s4;
	val s6 = asm_rule ⌜¬a ⇒ t⌝;
	val s7 = asm_rule ⌜a ⇔ F⌝;
	val s8 = simple_∀_elim ⌜a : BOOL⌝ ¬_thm1;
	val s9 = eq_sym_rule s8;
	val s10 = ⇔_mp_rule s9 s7;
	val s11 = ⇒_elim s6 s10;
	val s12 = ∨_elim s1 s5 s11;
	val s13 = ⇒_intro ⌜¬a ⇒ t⌝ s12;
	val s14 = ⇒_intro ⌜a ⇒ t⌝ s13;
	val s15 = list_simple_∀_intro[⌜a : BOOL⌝,⌜t : BOOL⌝] s14;
in
fun ⦏asm_elim⦎ (tm : TERM) (thm1 : THM) (thm2 : THM) : THM = (
let	val t = concl thm1;
	val mf_s1 = list_simple_∀_elim [tm,t] s15;
	val mf_s2 = ⇒_intro tm thm1;
	val mf_s3 = ⇒_intro (mk_¬ tm) thm2;
	val mf_s4 = ⇒_elim mf_s1 mf_s2;
	val mf_s5 = ⇒_elim mf_s4 mf_s3;
in
	mf_s5
end
handle complaint =>
list_divert complaint "asm_elim" [
	("list_simple_∀_elim", 3031, [fn () => string_of_term tm]),
	("⇒_elim",7029,[fn () => string_of_thm thm1, fn () => string_of_thm thm2])]
);
end; (* local val s1 = ... *)

=TEX
=SML

fun ⦏prove_asm_rule⦎ (thm1 : THM) (thm2 : THM) : THM = (
let	val c1 = concl thm1;
	val s1 = ⇒_intro c1 thm2;
	val s2 = ⇒_elim s1 thm1;
in
	s2
end);

=TEX
=SML

fun ⦏asm_inst_term_rule⦎ (tml : (TERM * TERM) list) (thm : THM) : THM = (
let	val nhyps = length(strip_⇒ (concl thm));
	val s1 = all_⇒_intro thm;
	val nhyps1 = length(strip_⇒ (concl s1));
	val s2 = inst_term_rule tml s1;
	val s3 = fold (fn (_,x) => undisch_rule x)
		(interval 1 (nhyps1 - nhyps)) s2;
in
	s3
end
handle complaint =>
pass_on complaint "inst_term_rule" "asm_inst_term_rule"
);

=TEX
=SML

fun ⦏asm_inst_type_rule⦎ (tyl : (TYPE * TYPE) list) (thm : THM) : THM = (
let	val nhyps = length(strip_⇒ (concl thm));
	val s1 = all_⇒_intro thm;
	val nhyps1 = length(strip_⇒ (concl s1));
	val s2 = inst_type_rule tyl s1;
	val s3 = fold (fn (_,x) => undisch_rule x)
		(interval 1 (nhyps1 - nhyps)) s2;
in
	s3
end
handle complaint =>
pass_on complaint "inst_type_rule" "asm_inst_type_rule"
);
=TEX
\subsection{Concerning Matching Functions}
The function $apply\_matches\_rule$ encodes the matching attempt, should
a simple use of the rule fail.
It is given a term to match against,
a method of extracting the part to match,and the theorem
that is to be instantiated.
It presumes that the theorem it is passed is stripped
of all outer universal quantifers.
It brings up to the conclusion all the hypotheses.
It instantiates types to the minimum required,
instantiates free variables to the minimum required
(notice that we must not instantiate the universally quantified variables of $thm$ that occur free in the assumptions:
thus $tmm'$)
and then returns are the hypotheses to the assumption list.

The order of arguments to $@$ in $subs\_for$ is closely
tied to whether we do $inst\-\_term\-\_rule$
or $list\-\_simple\-\_∀\-\_elim$ first.

Note that $term\_match$ is not infallible.
=SML
local
	fun strip_n_⇒ 0 tm = tm
	| strip_n_⇒ n tm = strip_n_⇒ (n-1) (snd(dest_⇒ tm));
in
fun ⦏apply_matches_rule⦎ (caller : string)
	(match_against : TERM)
	(extract : TERM -> TERM)
	(thm : THM) : THM = (
let	val cnc = concl thm;
	val cfrees = frees cnc;
	val all_frees = list_union (op =$) (cfrees ::  (map frees (asms thm)));
	val qvs = fst(strip_∀ cnc);
	val subs_for = all_frees @ qvs;
	val subs_with = list_variant [] subs_for;
	val length_all_frees = length all_frees;
	val qvs' = subs_with from length_all_frees;
	val all_frees' = subs_with to (length_all_frees - 1);
	val s1 = list_simple_∀_elim qvs' thm;
	val c = concl s1;
	val nhyps = length(strip_⇒ c);
	val s2 = all_⇒_intro s1;
	val nhyps1 = length(strip_⇒ (concl s2));
	val s3 = inst_term_rule(combine all_frees' all_frees) s2;
	val t1 = extract (strip_n_⇒ (nhyps1 - nhyps)(concl s3));
	val (tym,tmm) = term_match match_against t1;
	val s4 = case tym of
		[] => s3
		| _ => inst_type_rule tym s3;
	val s5 = inst_term_rule tmm s4;
	val s6 = fold (fn (_,x) => undisch_rule x)
		(interval 1 (nhyps1 - nhyps)) s5;
in
	s6
end
handle (Fail _) => fail caller 7044 [fn () => string_of_term match_against,
		fn () => string_of_thm thm]
);
end;
=TEX
Now we use the above in the various forms of matching.
=SML
local
fun aux (thm1 : THM) (thm2 : THM) : THM = (
let	val s1 = apply_matches_rule "simple_⇒_match_mp_rule"
		(concl thm2) (fst o dest_⇒) thm1;
	val s2 = ⇒_elim s1 thm2;
in
	s2
end
handle complaint =>
list_divert complaint "simple_⇒_match_mp_rule" [
	("⇒_elim", 7044, [fn () => string_of_thm thm1, fn () => string_of_thm thm2])]
);
in
fun ⦏simple_⇒_match_mp_rule⦎ (thm1 : THM) (thm2 : THM) : THM = (	
let	val s1 = ⇒_elim thm1 thm2;
in
	s1
end
	handle (Fail _) =>
	aux thm1 thm2
);
end;

=TEX
=SML

fun ⦏simple_⇒_match_mp_rule1⦎ (thm1 : THM) : THM -> THM = (
let	val (qvs,body) = strip_∀ (concl thm1);
	val (t1,_) = dest_⇒ body;
in
(fn (thm2 : THM) =>
let	val tm = concl thm2;
in let	val (tym,tmm) = term_match tm t1;
	val (s2, inst_fun)  = case tym of
		[] => (thm1, fn tm => tm)
		| _ => (inst_type_rule tym thm1, inst [] tym);
	fun aux1 (qv :: rest) : TERM list = (
	let	val qv' = inst_fun qv;
	in
		(rassoc1 tmm qv') :: aux1 rest
	end
	) | aux1 [] = [];

	val s3 = list_simple_∀_elim (aux1 qvs) s2;
	val s4 = ⇒_elim s3 thm2;
in
	s4
end
handle (Fail _) => term_fail "simple_⇒_match_mp_rule1" 7044 [tm, t1]
end)
end
handle complaint =>
divert complaint "dest_⇒" "simple_⇒_match_mp_rule1" 7045
	[fn () => string_of_thm thm1]
);
=TEX
The following is complicated by the desire not to calculate type variable sets
and free variable sets more than is necessary.
The case where the theorems have large
number of assumptions with lots of free variables is likely to be common
(in tactic proofs) as is the case where all the bound variables do appear
free in $t1$ (after type instantiation) but do not appear in the results
of the term matching because the variable is matched to itself. Thus we
should avoid calculating the free variables of the assumptions unless
we know we need them.

Note that type variables that only occur in the bound variables of
the major premiss are irrelevant.
=SML

fun ⦏simple_⇒_match_mp_rule2⦎ (thm1 : THM) : THM -> THM = (
let	val (qvs,body) = strip_∀ (concl thm1);
	val (t1, t2) = dest_⇒ body;
in
(fn (thm2 : THM) =>
let	val tm = concl thm2;
in let	val (tym, tmm) = term_match tm t1;
	type TYPE_CAPTURE_DATA = {avoid : string list OPT, fixed_tyvs : string list OPT};
	val body_tyvs = term_tyvars body;
	fun is_fixed_tyv (tyv, {avoid, fixed_tyvs as Nil}) : bool * TYPE_CAPTURE_DATA = (
		let	val tyvs = term_tyvars t1 cup
				list_cup (map term_tyvars (asms thm1));
		in	(tyv mem tyvs, {avoid = avoid, fixed_tyvs = Value tyvs})
		end
	) | is_fixed_tyv (tyv, cd as {avoid, fixed_tyvs as Value tyvs}) = (
		(tyv mem tyvs, cd)
	);
	fun rename_tyv (tyv, {avoid as Nil, fixed_tyvs as Value tyvs}) : string * TYPE_CAPTURE_DATA = (
		let	val av = tyvs cup
				list_cup (map term_tyvars (asms thm2));
			val tyv' = string_variant av tyv;
		in	(tyv', {avoid = Value (tyv' :: av), fixed_tyvs = fixed_tyvs})
		end
	) | rename_tyv (tyv, {avoid as Value av, fixed_tyvs}) = (
		let	val tyv' = string_variant av tyv;
		in	(tyv', {avoid = Value (tyv' :: av), fixed_tyvs = fixed_tyvs})
		end
	) | rename_tyv (tyv, {avoid, fixed_tyvs as Nil}) = (
		rename_tyv (tyv, {avoid = avoid, fixed_tyvs = Value (term_tyvars t1)})
	);
	fun make_inst (acc : (TYPE * TYPE) list) (cd : TYPE_CAPTURE_DATA) (tyv :: rest) = (
	let	val ty = mk_vartype tyv;
		val (acc', cd') = ((rassoc3 tym ty, ty)::acc, cd)
		handle Fail _ =>
		let	val (fixed, cd') = is_fixed_tyv (tyv, cd);
		in	if	fixed
			then	(acc, cd')
			else	let	val (tyv', cd'') = rename_tyv (tyv, cd');
				in	((mk_vartype tyv', ty)::acc, cd'')
				end
		end;		
	in	make_inst acc' cd' rest
	end
	) | make_inst acc _ [] = acc;
	val init_type_cd = {avoid = Nil, fixed_tyvs = Nil};
	val tym' = make_inst [] init_type_cd (term_tyvars body);
	val (s2, inst_fun)  = case tym' of
		[] => (thm1, fn tm => tm)
		| _ => (inst_type_rule tym' thm1, inst [] tym');
	type TERM_CAPTURE_DATA = {avoid : TERM list OPT, t1_frees : TERM list OPT};
	fun is_free_in_t1 (v, {avoid, t1_frees as Nil}) : bool * TERM_CAPTURE_DATA = (
		let	val vs = map inst_fun (frees t1);
		in	(v mem vs, {avoid = avoid, t1_frees = Value vs})
		end
	) | is_free_in_t1 (v, cd as {t1_frees as Value vs, ...}) = (
			(v mem vs, cd)
	);
	fun rename_bv (v, {avoid as Nil, t1_frees as Value t1_fvs}) : TERM * TERM_CAPTURE_DATA = (
		let	val av = t1_fvs term_union
				list_term_union (map frees (asms thm1)) term_union
				list_term_union (map frees (asms thm2));
			val v' = variant av v;
		in	(v', {avoid = Value (v' :: av), t1_frees = t1_frees})
		end
	) | rename_bv (v, {avoid as Value av, t1_frees}) = (
		let	val v' = variant av v;
		in	(v', {avoid = Value (v' :: av), t1_frees = t1_frees})
		end
	) | rename_bv (v, {avoid, t1_frees as Nil}) = (
		rename_bv(v, {avoid = avoid, t1_frees = Value (map inst_fun (frees t1))})
	);
	fun make_subs (acc : TERM list) (cd : TERM_CAPTURE_DATA) (qv :: rest) : TERM list = (
	let	val qv' = inst_fun qv;
		val (tm, cd') = (rassoc3 tmm qv', cd)
		handle Fail _ =>
		let	val (free_in_t1, cd') = is_free_in_t1 (qv', cd);
		in	if	free_in_t1
			then	(qv', cd')
			else	rename_bv (qv', cd')
		end;		
	in	make_subs (tm :: acc) cd' rest
	end
	) | make_subs acc _ [] = rev acc;
	val init_term_cd = {avoid = Nil, t1_frees = Nil};
	val s3 = list_simple_∀_elim (make_subs [] init_term_cd qvs) s2;
	val s4 = ⇒_elim s3 thm2;
in
	s4
end
handle (Fail _) => term_fail "simple_⇒_match_mp_rule2" 7044 [tm, t1]
end)
end
handle complaint =>
divert complaint "dest_⇒" "simple_⇒_match_mp_rule2" 7045
	[fn () => string_of_thm thm1]
);


=TEX
=SML

local
fun aux (thm1 : THM) (thm2 : THM) : THM = (
let	val s1 = apply_matches_rule "simple_⇔_match_mp_rule"
		(concl thm2) (fst o dest_⇔) thm1;
	val s2 = ⇔_mp_rule s1 thm2;
in
	s2
end
handle complaint =>
list_divert complaint "simple_⇔_match_mp_rule" [
	("⇔_mp_rule", 7044, [fn () => string_of_thm thm1, fn () => string_of_thm thm2])]
);
in
fun ⦏simple_⇔_match_mp_rule⦎ (thm1 : THM) (thm2 : THM) : THM = (
let	val s1 = ⇔_mp_rule thm1 thm2;
in
	s1
end
	handle (Fail _) =>
	aux thm1 thm2
);
end;

=TEX
=SML

fun ⦏simple_⇔_match_mp_rule1⦎ (thm1 : THM) : THM -> THM = (
let	val (qvs,body) = strip_∀ (concl thm1);
	val (t1,_) = dest_⇔ body;
in
(fn (thm2 : THM) =>
let	val tm = concl thm2;
in let	val (tym,tmm) = term_match tm t1;
	val s2 = case tym of
		[] => thm1
		| _ => inst_type_rule tym thm1;
	fun aux1 (qv :: rest) : TERM list = (
	let	val qv' = inst [] tym qv;
	in
		(rassoc1 tmm qv') :: aux1 rest
	end
	) | aux1 [] = [];

	val s3 = list_simple_∀_elim (aux1 qvs) s2;
	val s4 = ⇔_mp_rule s3 thm2;
in
	s4
end
handle (Fail _) => term_fail "simple_⇔_match_mp_rule1" 7044 [tm, t1]
end)
end
handle complaint =>
divert complaint "dest_⇔" "simple_⇔_match_mp_rule1" 7046
	[fn () => string_of_thm thm1]
);

=TEX
=SML

local
fun aux (thm : THM) : CONV = (fn (tm :TERM) =>
let	val s1 = apply_matches_rule "simple_eq_match_conv" tm (fst o dest_eq) thm;
	val s2 = eq_trans_rule (refl_conv tm) s1;
in
	s2
end
handle complaint =>
list_divert complaint "simple_eq_match_conv" [
	("eq_trans_rule", 7076, [fn () => string_of_term tm,
		fn () => string_of_thm thm])]
);
in
fun ⦏simple_eq_match_conv⦎ (thm : THM) : CONV = (fn (tm :TERM) =>
let	val s1 = eq_trans_rule (refl_conv tm) thm;
in
	s1
end
	handle (Fail _) =>
	aux thm tm
);
end;
=TEX
In the following we just map all failures bar $dest\_eq$
onto 7076, without working out whether the error is
an ``expected'' one.
This is because we want this function to fail fast as well are succeed fast.
=SML
fun ⦏simple_eq_match_conv1⦎ (thm : THM) : CONV = (
let	val (qvs,body) = strip_∀ (concl thm);
	val (t1,_) = dest_eq body;
in
(fn (tm :TERM) =>
let	val (tym,tmm) = term_match tm t1;
	val s2 = case tym of
		[] => thm
		| _ => inst_type_rule tym thm;
	fun aux1 (qv :: rest) : TERM list = (
	let	val qv' = inst [] tym qv;
	in
		(rassoc1 tmm qv') :: aux1 rest
	end
	) | aux1 [] = [];

	val s3 = list_simple_∀_elim (aux1 qvs) s2;
	val s4 = eq_trans_rule (refl_conv tm) s3;
in
	s4
end
handle (Fail _) => fail "simple_eq_match_conv1" 7076 [fn () => string_of_term tm,
	fn () => string_of_thm thm]
)
end
handle complaint =>
divert complaint "dest_eq" "simple_eq_match_conv1" 7095
	[fn () => string_of_thm thm]
);
=TEX
\subsection{Concerning λ}
=SML
fun ⦏λ_rule⦎ (tm : TERM) (thm : THM) : THM = (
let	val mgv = hd(gen_vars [type_of tm] [tm]);
	val sx = subst [(mgv,tm)] (concl thm);
	val mgv_sx = mk_app(mk_simple_λ(mgv,sx),tm)
	val s1 = simple_β_conv mgv_sx;
	val s2 = eq_sym_rule s1;
	val s3 = ⇔_mp_rule s2 thm
in
	s3
end);
=TEX
In assessing the following, note that requesting, say, $app\_arg\_rule$
is equivalent to requesting a $refl\_conv$ and a $mk\_app\_rule$ as far as efficiency goes.
In addition, note that the original term, $tm$ is in the sco[pe of $aux2$, saving a $mk\_app$.
=SML
val ⦏all_simple_β_conv⦎ : CONV = (
let
fun rhs (thm: THM) : TERM = snd(dest_eq(concl thm));
fun asbc (tm : TERM) : THM OPT = (
let	val dt = dest_simple_term tm;

	fun aux1 thm1 thm2 = (
	let	val s1 = mk_app_rule thm1 thm2
	in
		Value (
		if not(is_simple_λ(rhs thm1))
		then s1
		else (let val s2 = conv_rule (RAND_C simple_β_conv) s1;
		in
		if is_simple_λ(rhs thm2)
		then (
			case (asbc (rhs s2)) of
			Nil => s2
			| Value s3 => eq_trans_rule s2 s3
		) else s2
		end)
		)
	end);

	fun aux2 (f : TERM) (x : TERM) : THM OPT = (
	if is_simple_λ f
	then 	(Value(
		if is_simple_λ x
		then ((simple_β_conv THEN_TRY_C(fn tm1 =>
			force_value (asbc tm1))) tm)
		else (simple_β_conv tm)
		))
	else Nil);

	fun aux (App (f, x)) = (
	let	val fr = asbc f;
		val xr = asbc x;
	in
		case (fr,xr) of
		(Nil, Nil) => aux2 f x
		| (Value frt,Nil) => aux1 frt (refl_conv x)
		| (Nil, Value xrt) => aux1 (refl_conv f) xrt
		| (Value frt, Value xrt) => aux1 frt xrt
	end
	) | aux (Simpleλ (x, b)) = (
	let	val br = asbc b
	in
		case br of
		Nil => Nil
		| (Value brt) => Value(simple_λ_eq_rule x brt)
	end
	) | aux _ = Nil;
in
	aux dt
end);
in
	(fn (tm:TERM) => case (asbc tm) of
		Value red => red
		| Nil => term_fail "all_simple_β_conv" 7020 [tm])
end);

=TEX
=SML

fun ⦏all_simple_β_rule⦎ (thm : THM) =(
	conv_rule all_simple_β_conv thm
	handle complaint =>
	divert complaint "all_simple_β_conv"
		"all_simple_β_rule" 7020 [fn () => string_of_thm thm]
);
=TEX

\subsection{Concerning $\alpha$-conversion}
=SML
val ⦏α_conv⦎ : TERM -> CONV = (
let	val ar = subst_rule [];
in
(fn (tm1 : TERM) =>
 fn (tm2 : TERM) =>
let	val new_template = mk_eq(tm2, tm1)
		handle complaint =>
		pass_on complaint "mk_eq" "α_conv"
	val s2 = refl_conv tm2;
	val s3 = ar new_template s2;
in
	s3
end
handle complaint =>
list_divert complaint "α_conv" [
	("subst_rule",7034,[fn () => string_of_term tm1,
		fn () => string_of_term tm2])]
)
end);

=TEX
=SML

val ⦏simple_α_conv⦎ : string -> CONV = (
let	val ar = subst_rule [];
in
(fn (v : string) =>
 fn (tm:TERM) =>
let	val (x,b) = dest_simple_λ tm
		handle complaint =>
		pass_on complaint "dest_simple_λ" "simple_α_conv";
	val vtm = mk_var(v, type_of x);
	val abs = mk_simple_λ(vtm,var_subst[(vtm,x)]b);
	val new_template = mk_eq(tm, abs);
	val s2 = refl_conv tm;
	val s3 = ar new_template s2
		handle complaint =>
		divert complaint "subst_rule" "simple_α_conv" 7035
		[fn () => string_of_term x,(fn () => v)];
in
	s3
end)
end);
=TEX
\subsection{Concerning ¬ (part II)}
We prove the local theorem:
=GFT
s8 ⊢ ∀ p ⦁ ¬(¬ p) = p

=TEX
=SML

local
	val s1 = asm_rule ⌜p : BOOL⌝;
	val s2 = ¬_¬_intro s1;
	val s3 = ⇒_intro ⌜p : BOOL⌝ s2;
	val s4 = asm_rule ⌜¬(¬ p)⌝;
	val s5 = ¬_¬_elim s4;
	val s6 = ⇒_intro ⌜¬(¬ p)⌝ s5;
	val s7 = ⇔_intro s6 s3;
	val s8 = simple_∀_intro ⌜p : BOOL⌝ s7;
in
val ¬_¬_conv : CONV = (fn (tm:TERM) =>
let	val p = dest_¬(dest_¬ tm);
	val mf_s1 = simple_∀_elim p s8;
in
	mf_s1
end
handle complaint =>
divert complaint "dest_¬" "¬_¬_conv" 7022 [fn () => string_of_term tm]
);
end;
=TEX
Local theorems:
=GFT
s22 ⊢ ∀ p ⦁ ¬ (∃ x ⦁ ¬ (p x)) ⇔ (∀ x ⦁ p x)

s27 ⊢ ¬ (∀ x ⦁ ¬ (p x)) ⇔ (∃ x ⦁ p x)

s33 ⊢ ∀ p⦁ ¬ $∀ p ⇔ (∃ x⦁ ¬ p x)

s38 ⊢ ∀ p⦁ ¬ $∃ p ⇔ (∀ x⦁ ¬ p x)

=TEX
=SML

local
val s1 = asm_rule ⌜(λ x : 'a ⦁ ¬(p x)) x⌝;
val s2 = simple_∃_intro ⌜∃ x : 'a ⦁ (λ x ⦁ ¬(p x)) x⌝ s1;
val s3 = all_⇒_intro s2;
val s4 = all_simple_β_rule s3;
val s5 = asm_rule ⌜¬(∃ x ⦁ ¬ (p x))⌝;
val s6 = modus_tollens_rule s4 s5;
val s7 = ¬_¬_elim s6;
val s8 = simple_∀_intro ⌜x : 'a⌝ s7;
val s9 = all_⇒_intro s8;

val s10 = asm_rule ⌜∀ x : 'a ⦁ p x⌝;
val s11 = all_simple_∀_elim s10;
val s12 = asm_rule ⌜¬(p (x : 'a))⌝;
val s13 = asm_rule ⌜∃ x : 'a ⦁ ¬(p x)⌝;
val s14 = ¬_elim ⌜F⌝ s11 s12;
val s15 = simple_∃_elim ⌜x : 'a⌝ s13 s14;
val s16 = ⇒_intro ⌜∃ x : 'a ⦁ ¬(p x)⌝ s15;
val s17 = simple_∀_elim ⌜∃ x : 'a ⦁ ¬(p x)⌝ ¬_thm;
val s18 = eq_sym_rule s17;
val s19 = ⇔_mp_rule s18 s16;
val s20 = all_⇒_intro s19;
val s21 = ⇔_intro s9 s20;
val s22 = all_∀_intro s21;

val s23 = simple_∀_elim ⌜(λ x : 'a ⦁ ¬(p x))⌝ s22;
val s24 = all_simple_β_rule s23;
val s25 = app_fun_rule ⌜$¬⌝ s24;
val s26 = conv_rule (TOP_MAP_C ¬_¬_conv) s25;
val s27 = eq_sym_rule s26;

val s28 = app_fun_rule ⌜$¬⌝ s21;
val s29 = conv_rule (TOP_MAP_C ¬_¬_conv) s28;
val s30 = eq_sym_rule s29;
val s31 = simple_∀_elim ⌜p:'a → BOOL⌝ (inst_type_rule[(BOOL,mk_vartype"'b")]η_axiom);
val lxpx = fst(dest_eq(concl s31));
val s32 = conv_rule(ONCE_MAP_C (fn tm => if tm =$ lxpx
		then s31
		else fail "" 0 [])) s30;
val s33 = all_∀_intro s32; (* ¬_∀_thm *)

val s34 = app_fun_rule ⌜$¬⌝ s27;
val s35 = conv_rule (TOP_MAP_C ¬_¬_conv) s34;
val s36 = eq_sym_rule s35;
val s37 = conv_rule(ONCE_MAP_C (fn tm => if tm =$ lxpx
		then s31
		else fail "" 0 [])) s36;
val s38 = all_∀_intro s37; (* ¬_∃_thm *)

=TEX
Now the main functions:
=SML
in
val ⦏¬_∀_thm⦎ = save_thm("¬_∀_thm",s33);
val ⦏¬_∃_thm⦎ = save_thm("¬_∃_thm",s38);

val ⦏¬_simple_∀_conv⦎ : CONV = (fn (tm:TERM) =>
let	val neg = (dest_¬ tm);
	val (v,b) = dest_simple_∀ neg;
	val vstr = fst(dest_var v);
	val abs = snd(dest_app neg);
	val mf_s1 = inst_type_rule[(type_of v,mk_vartype "'a")] ¬_∀_thm;
	val mf_s2 = conv_rule(RAND_C (SIMPLE_λ_C (RAND_C(RAND_C
		(simple_α_conv vstr)))))mf_s1;
	val mf_s3 = simple_∀_elim abs mf_s2;
	val mf_s4 = conv_rule(RAND_C(RAND_C(
		(SIMPLE_λ_C(RAND_C simple_β_conv)
		)))) mf_s3;
in
	mf_s4
end
handle complaint =>
list_divert complaint "¬_simple_∀_conv" [
	("dest_¬",7036,[fn () => string_of_term tm]),
	("dest_∀",7036,[fn () => string_of_term tm])]
);

val ⦏¬_simple_∃_conv⦎ : CONV = (fn (tm:TERM) =>
let	val neg = (dest_¬ tm);
	val (v,b) = dest_simple_∃ neg;
	val vstr = fst(dest_var v);
	val abs = snd(dest_app neg);
	val mf_s1 = inst_type_rule[(type_of v,mk_vartype "'a")] ¬_∃_thm;
	val mf_s2 = conv_rule(RAND_C (SIMPLE_λ_C (RAND_C(RAND_C
		(simple_α_conv vstr)))))mf_s1;
	val mf_s3 = simple_∀_elim abs mf_s2;
	val mf_s4 = conv_rule(RAND_C(RAND_C(
		(SIMPLE_λ_C(RAND_C simple_β_conv))
		))) mf_s3;
in
	mf_s4
end
handle complaint =>
list_divert complaint "¬_simple_∃_conv" [
	("dest_¬",7058,[fn () => string_of_term tm]),
	("dest_∃",7058,[fn () => string_of_term tm])]
);
end; (* of local val s1 = ... *)
=TEX
\subsection{Concerning ∧ and ⇒}
=GFT
s ⊢ ∀ a b c ⦁ ((a ∧ b) ⇒ c) ⇔ (a ⇒ b ⇒ c)
s ⊢ ∀ a b c ⦁ (a ⇒ b ⇒ c) ⇔ ((a ∧ b) ⇒ c)

=TEX
=SML

local
	val s1 = asm_rule ⌜a ∧ b⌝;
	val s2 = ∧_left_elim s1;
	val s3 = ∧_right_elim s1;
	val s4 = asm_rule ⌜a : BOOL⌝;
	val s5 = asm_rule ⌜b : BOOL⌝;
	val s6 = ∧_intro s4 s5;
	val s7 = asm_rule ⌜(a ∧ b) ⇒ c⌝;
	val s8 = ⇒_elim s7 s6;
	val s9 = ⇒_intro ⌜b : BOOL⌝ s8;
	val s10 = ⇒_intro ⌜a : BOOL⌝ s9;
	val s11 = ⇒_intro ⌜(a ∧ b) ⇒ c⌝ s10;

	val s12 = asm_rule ⌜a ⇒ b ⇒ c⌝;
	val s13 = ⇒_elim s12 s2;
	val s14 = ⇒_elim s13 s3;
	val s15 = ⇒_intro ⌜a ∧ b⌝ s14;
	val s16 = ⇒_intro ⌜a ⇒ b ⇒ c⌝ s15;
	
	val s17 = ⇔_intro s11 s16;
	val s18 = list_simple_∀_intro [⌜a : BOOL⌝, ⌜b : BOOL⌝, ⌜c : BOOL⌝] s17;
	val s19 = eq_sym_rule s17;
	val s20 = list_simple_∀_intro [⌜a : BOOL⌝, ⌜b : BOOL⌝, ⌜c : BOOL⌝] s19;
in
fun ⦏⇒_∧_rule⦎ (thm : THM) : THM = (
let val (a,(b,c)) = (Combinators.I ** dest_⇒)(dest_⇒ (concl thm));
	val mf_s1 = list_simple_∀_elim [a,b,c] s20;
	val mf_s2 = ⇔_mp_rule mf_s1 thm;
in
	mf_s2
end
handle complaint =>
divert complaint "dest_⇒" "⇒_∧_rule" 7008 [fn () => string_of_thm thm]
);

fun ⦏∧_⇒_rule⦎ (thm : THM) : THM = (
let val ((a,b),c) = (dest_∧ ** Combinators.I)(dest_⇒ (concl thm));
	val mf_s1 = list_simple_∀_elim [a,b,c] s18;
	val mf_s2 = ⇔_mp_rule mf_s1 thm;
in
	mf_s2
end
handle complaint =>
list_divert complaint "∧_⇒_rule" [
	("dest_∧",7009,[fn () => string_of_thm thm]),
	("dest_⇒",7009,[fn () => string_of_thm thm])]
);
end;
=TEX
\subsection{Concerning ∃$_1$}
=SML
local
	val s1 = app_arg_rule ⌜P : 'a → BOOL⌝ ∃⋎1_def;
	val s2 = all_simple_β_rule s1;
	val s3 = simple_∀_intro ⌜P : 'a → BOOL⌝ s2;
in
	val ⦏∃⋎1_thm⦎ = save_thm("∃⋎1_thm",s3)
end;

=TEX
=SML

fun simple_∃⋎1_intro (thm1 : THM) (thm2 : THM) : THM = (
let	val (x,rest) = dest_simple_∀ (concl thm2);
	val (Px,(x',t)) = (Combinators.I ** dest_eq)(dest_⇒ rest);
	val sideeffect = if x =$ x'
		then ()
		else fail "simple_∃⋎1_intro" 7066 [];
	val witness = case (term_match (concl thm1) Px) of
		([],[(w,_)]) => w
		| ([],[]) => t
		| _ => fail "simple_∃⋎1_intro" 7067 [];
	val abs = mk_simple_λ(x,Px);
	val P_t = mk_app(abs, witness);
	val P_x = mk_app(abs, x);
	val s1 = simple_β_conv P_t;
	val s2 = eq_sym_rule s1;
	val s3 = ⇔_mp_rule s2 thm1;
	val s4 = simple_β_conv P_x;
	val s5 = eq_sym_rule s4;
	val mgvs = gen_vars [BOOL, type_of x] (rest :: asms thm2);
	val mgv = hd mgvs;
	val mgv1 = hd(tl mgvs);
	val s6 = all_simple_∀_elim thm2;
	val template = mk_⇒(mgv,mk_eq(x,t));
	val s7 = subst_rule [(s5,mgv)] template s6;
	val s8 = simple_∀_intro x s7;
	val s9 = ∧_intro s3 s8;
	val template2 = mk_simple_∃(mgv1,
		mk_∧(mk_app(abs,mgv1),
		mk_simple_∀(x,
		mk_⇒(
		P_x, mk_eq(x,mgv1)))));
	val s10 = simple_∃_intro template2 s9;
	val s11 = inst_type_rule[(type_of x,mk_vartype "'a")] ∃⋎1_thm;
	val s12 = simple_∀_elim abs s11;
	val s13 = eq_sym_rule s12;
	val s14 = ⇔_mp_rule s13 s10;
	val s15 = conv_rule(RAND_C (simple_α_conv (fst(dest_var x)))) s14;
in
	s15
end
handle complaint =>
list_divert complaint "simple_∃⋎1_intro" [
	("term_match",7067,[fn () => string_of_thm thm1, fn () => string_of_thm thm2]),
	("subst_rule",7067,[fn () => string_of_thm thm1, fn () => string_of_thm thm2]),
	("simple_∀_intro",7067,[fn () => string_of_thm thm1, fn () => string_of_thm thm2]),
	("dest_simple_∀",7066,[fn () => string_of_thm thm2]),
	("dest_⇒",7066,[fn () => string_of_thm thm2])
]
);
=TEX
=IGN
A nasty:
val thm1 = asm_rule ⌜f x:BOOL⌝;
val thm2 = asm_rule ⌜∀ y ⦁ f y ⇒ y = x⌝;
val thm2' = asm_intro ⌜f y : BOOL⌝;
simple_∃⋎1_intro thm1 thm2';
=SML
fun ⦏simple_∃⋎1_elim⦎ (thm : THM) : THM = (
let	val (_,bdy) = dest_app (concl thm);
	val (x,_) = dest_simple_λ bdy;
	val (xt,bt) = dest_→_type(type_of bdy);
	val s1 = inst_type_rule [(xt,mk_vartype "'a")] ∃⋎1_thm;
	val s2 = simple_∀_elim bdy s1;
	val s3 = ⇔_mp_rule s2 thm;
	val s4 = conv_rule (SIMPLE_BINDER_C
		((RAND_C(SIMPLE_BINDER_C(RATOR_C(RAND_C simple_β_conv))))
		THEN_C
		(RATOR_C(RAND_C simple_β_conv)))) s3;
	val s5 = conv_rule(RAND_C (simple_α_conv (fst(dest_var x)))) s4;
in
	s5
end
handle complaint =>
list_divert complaint "simple_∃⋎1_elim" [
	("dest_app",7015,[fn () => string_of_thm thm]),
	("dest_simple_λ",7015,[fn () => string_of_thm thm]),
	("dest_fun",7015,[fn () => string_of_thm thm]),
	("⇔_mp_rule",7015,[fn () => string_of_thm thm])]
);
=TEX
\subsection{Concerning Higher-Order Matching}

=TEX
The following puts a term in $\beta$-$\eta$-normal form, failing if it is already normalised.
=SML

local
val rec ⦏aux_conv⦎ : CONV = (fn tm =>
	(case dest_simple_term tm of
		Var _ => term_fail "simple_β_η_norm_conv" 7130 [tm]
	|	Const _ => term_fail "simple_β_η_norm_conv" 7130 [tm]
	|	Simpleλ _ => (
			SIMPLE_λ_C aux_conv AND_OR_C
			simple_eq_match_conv η_axiom
	) |	App _ => (
			RAND_C aux_conv AND_OR_C
			RATOR_C aux_conv AND_OR_C
			(simple_β_conv THEN_TRY_C aux_conv)
	)) tm
);
in
val  ⦏simple_β_η_norm_conv⦎ : CONV = (fn tm =>
	aux_conv tm handle Fail _ => term_fail "simple_β_η_norm_conv" 7130 [tm]
);
end;
=TEX
If $s$ and $t$ are $\beta$-$\eta$-equivalent,
the following proves $s = t$.
=SML

fun ⦏simple_β_η_conv⦎ (t : TERM) : CONV = (
	let	val thm1 = TRY_C simple_β_η_norm_conv t;
		val thm2 = eq_sym_rule thm1;
	in	fn s =>
		let	val thm3 = TRY_C simple_β_η_norm_conv s;
			val thm4 = eq_trans_rule thm3 thm2;
		in	thm4
		end
		handle Fail _ =>
			term_fail "simple_β_η_conv" 7131 [t, s]
	end
);

=TEX
The following function is a heuristic (due to John Harrison) that makes higher-order rewriting give more understandable results.
It builds an association lists matching bound variables in a pattern term to bound variables in an instance term and returns a conversion that uses this association list
to rename bound variables (e.g., in an equation having the pattern as its left-hand side, as in rewriting).

Even though patterns tend to be small, it is little extra work to avoid unnecessary copying by the usual
approach of failing on subterms that are not changed by the renaming.
The case when the same bound variable appears several times in a pattern is likely to be quite common so
the code caters for that case by not adding entries to the association list for bound variables in the
pattern that have been encountered before.

=SML

fun ⦏match_bound_vars_conv⦎ (itm : TERM) (pat : TERM) : CONV = (
	let	fun aux1 alist i p = (
			case (dest_simple_term i, dest_simple_term p) of
				(Simpleλ(iv, ib), Simpleλ(pv, pb)) => (
				if	any alist (fn (_, v) => v = pv)
				then	aux1 alist ib pb
				else	aux1 ((iv, pv)::alist) ib pb
			) |	(App(ig, iy), App(pg, py)) => (
				aux1 (aux1 alist ig pg) iy py
			) |	_ => alist
		);
		val alist = aux1 [] itm pat;
		fun aux2 bvm p = (
			case dest_simple_term p of
				Simpleλ(pv, pb) => (
					let	val iv_pv as (iv, _) = find alist (fn (_, v) => v = pv)
						handle Fail _ => (pv, pv);
					in	mk_simple_λ(iv, aux2 (iv_pv::bvm) pb)
					end
			) |	App(pf, px) => (
				let	val (pf', c1) = (aux2 bvm pf, true)
					handle Fail _ => (pf, false);
					val (px', c2) = (aux2 bvm px, true)
					handle Fail _ => (px, false);
				in	if	c1 orelse c2
					then	mk_app(pf', px')
					else	fail "" 0 []
				end
			) |	Var _ => (
				let	val v = rassoc1 bvm p;
				in	if	v = p
					then	fail "" 0 []
					else	v
				end
			) |	Const _ => fail "" 0 []
		);
	in	fn tm =>
		α_conv (aux2 [] tm) tm
		handle Fail _ => refl_conv tm
	end	handle Fail _ => id_conv
);

=TEX
=SML

fun ⦏simple_ho_eq_match_conv⦎ (thm : THM) : CONV = (
	let	val thm1 = all_simple_∀_elim thm;
		val pat = fst(dest_eq(concl thm1))
			handle Fail _ =>
			thm_fail "simple_ho_eq_match_conv" 7095 [thm];
	in	fn tm =>
		let	val (ty_m, tm_m) = simple_ho_match [] tm pat;
			val thm2 = asm_inst_type_rule ty_m thm1;
			val thm3 = asm_inst_term_rule tm_m thm2;
			val ipat = fst(dest_eq(concl thm3));
			val thm4 = simple_β_η_conv ipat tm;
			val thm5 = eq_trans_rule thm4 thm3;
			val thm6 = conv_rule(RIGHT_C(TRY_C(simple_β_η_norm_conv))) thm5;
			val conv = match_bound_vars_conv tm ipat;
			val thm7 = conv_rule conv thm6;
		in	thm7
		end
		handle Fail _ =>
			fail "simple_ho_eq_match_conv" 7076
			[fn _ => string_of_term tm,
			 fn _ => string_of_thm thm]
	end
);


=TEX
=SML

fun ⦏simple_ho_eq_match_conv1⦎ (thm : THM) : CONV = (
	let	val cthm = concl thm;
		val (qvs, body) = strip_∀ cthm;
		val rvars = frees cthm;
		val pat = fst(dest_eq body)
			handle Fail _ =>
			thm_fail "simple_ho_eq_match_conv1" 7095 [thm];
	in	fn tm =>
		let	val (ty_m, tm_m) = simple_ho_match rvars tm pat;
			val thm2 = case ty_m of
				[] => thm
				| _ => inst_type_rule ty_m thm;
			fun aux1 (qv :: rest) : TERM list = (
				let	val qv' = inst [] ty_m qv;
				in
					(rassoc1 tm_m qv') :: aux1 rest
				end
			) | aux1 [] = [];
			val thm3 = list_simple_∀_elim (aux1 qvs) thm2;
			val ipat = fst(dest_eq(concl thm3));
			val thm4 = simple_β_η_conv ipat tm;
			val thm5 = eq_trans_rule thm4 thm3;
			val thm6 = conv_rule(RIGHT_C(TRY_C(simple_β_η_norm_conv))) thm5;
			val conv = match_bound_vars_conv tm ipat;
			val thm7 = conv_rule conv thm6;
		in	thm7
		end
		handle Fail _ =>
			fail "simple_ho_eq_match_conv1" 7076
			[fn _ => string_of_term tm,
			 fn _ => string_of_thm thm]
	end
);

=TEX
\section{END OF THE STRUCTURE}
=SML
end; (* of structure DerivedRules1 *)
open DerivedRules1;
=TEX
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}
=IGN
Statistics:

open Sort;
fun comp_stats (s1,n1) (s2,n2) = (
	if n1 = n2
	then string_order s1 s2
	else (n1 - n2)
);

sort comp_stats (get_stats ());




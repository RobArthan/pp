=IGN
********************************************************************************
mdt007.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% mdt007.doc   ℤ $Date: 2011/02/11 16:38:44 $ $Revision: 1.38 $ $RCSfile: mdt007.doc,v $
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

\def\Title{Module Tests for the Derived Rules of Inference}

\def\AbstractText{A set of module tests are given for the the derived inference rules.}

\def\Reference{DS/FMU/IED/MDT007}

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
%% LaTeX2e port: \TPPtitle{Module Tests for the Derived Rules of Inference}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Module Tests for the Derived Rules of Inference}
%% LaTeX2e port: \TPPref{DS/FMU/IED/MDT007}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.38 $ %
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2011/02/11 16:38:44 $ %
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{ML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.Blackburn & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{K.Blackburn & WIN01\\D.J.~King & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & Project Manager}
%% LaTeX2e port: \TPPabstract{A set of module tests are given for the
%% LaTeX2e port: the derived inference rules.}
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
\section{DOCUMENT CONTROL}
\subsection{Contents List}
\tableofcontents
\subsection{Document Cross References}
\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes History}
\begin{description}
\item [Issue 1.1 (1991/05/29)]
First draft version.
Primitive and built-in inference rules, and conversionals
all module tested.
\item [Issue 1.2 (1991/06/17)]
Corrected the test ``simple$\-\_$abs$\-\_$rule 6025'',
removed printing utilities (as unused),
and changed the test theory names used.
\item [Issue 1.3 (1991/06/18)]
Added a test for $list\_simple\_∀\_elim$ with duplicate quantifiers.
\item [1.4, 1.5, 1.6]
Corrected some tests.
Issue 1.6 provides full coverage of functions and errors
noted in issue 1.13 of \cite{DS/FMU/IED/DTD007}.
\item [1.7]
Reacted to errors 6036, 6065, 6066 now coming from $error$.
Changed $\_TRAVERSE\_C$ to $\_MAP\_C$.
Changed error tests of $?\_MAP\_C$.
The prefix $simple$ is moved to being the first prefix, bar $pp'$.
Order of $all\_∀\_intro$ quantifiers checked.
\item[Issue 1.8 (1991/06/27)]
$simple\_∃\_elim$ changed in accord with issue 1.15 detailed design change.
\item[Issue 1.9 (1991/07/03)]
Added $id\_conv$.
\item [Issue 1.10 (1991/07/15)]
Reacted to change in representation of character literals.
\item [Issue 1.11 (1991/07/29),1.12 (1991/07/31)]
Changes due to changes from ID0016.
\item [Issue 1.13 (1991/08/07)]
Reacting to issue 1.18 of \cite{DS/FMU/IED/DTD006}.
\item [Issue 1.14 (1991/08/15)]
Renamings of functions containing the name atom $simple$,
and renaming of $aconv$.
\item [Issue 1.15 (1991/09/05)]
Tidying up prior to a desk check.
\item [Issue 1.16 (1991/09/25)]
Reacting to changes in issue 1.25 of \cite{DS/FMU/IED/DTD007}.
\item [Issue 1.17 (1991/10/16)]
Reacting to issue 1.27 of \cite{DS/FMU/IED/DTD007}.
\item [Issue 1.18 (1991/10/17)]
Corrected for fixity of $Div$ and $Mod$.
\item [Issue 1.19 (1991/11/11)]
Added $plus\_conv$, removed $div2\_conv$ and $mod2\_conv$,
following change request CR007.
\item [Issue 1.20 (1991/12/20)]
Added infix call for "+",
reacted to changes in $simple\_∃\_elim/intro$,
removed duplicate label $TRY\_C\ a$.

\item[Issue 1.21 (1992/01/20), \FormatDate{92/01/20} ] Updated to use new fonts.
\item[Issue 1.22 (1992/01/27) (23rd January 1992)]
$new\_axiom$, $simple\_new\-\_type\-\_defn$, $new\-\_type\-\_defn$
all changed to take lists of keys, rather than single ones.
\item[Issue 1.24 (1992/03/19)]
Removed some percent keywords.
\item [Issue 1.25 (1992/04/09) (8th April 1992)]
Changes required by CR0016.
\item [Issue 1.26 (1992/04/14) (13th April 1992)]
Changes due to CR0017.
\item [Issue 1.27 (1992/04/21) (21 April 1992)]
Reduce dependency upon the exact format of the pretty printer's outputs.
\item[Issue 1.28 (1992/05/15) (15 May 1992)] Use correct quotation symbols.
\item [Issue 1.29 (1992/05/26) (26th May 1992)]
Renamings from version 1.5 of DS/FMU/IED/WRK038.
\item [Issue 1.30 (1992/07/29)] Update for new INTEGER type.
\item[Issue 1.33 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.34 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.35 (2005/04/18)] Allowed for new policy on kernel inference rule names as error message sources.
\item[Issue 1.36 (2005/12/16)] The prefix for private interfaces is now $pp'$ rather than $icl'$.
\item[Issue 1.37 (2011/02/05), 1.38 (2011/02/11)] Added {\em simple\_⇒\_match\_mp\_rule2}.
\item[Issue 1.39 (2011/02/20)] Added tests for {\em simple\_β\_η\_norm\_conv},
{\em simple\_ho\_eq\_match\_conv} and {\em simple\_ho\_eq\_match\_conv1}.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
None.
\section{GENERAL}
\subsection{Scope}
This document contains the module testing of the Derived Rules of Inference, required by \cite{DS/FMU/IED/HLD009}.
The design is in \cite{DS/FMU/IED/DTD007}
and it is
implemented in \cite{DS/FMU/IED/IMP007}.

\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains the module testing of the material given a design in \cite{DS/FMU/IED/DTD007},
following the test policy given in that document and the general policy given in \cite{DS/FMU/IED/PLN008}.

\subsubsection{Dependencies}
This document is derived from the detailed design in \cite{DS/FMU/IED/DTD007},
and is further influenced by the implementation, in  \cite{DS/FMU/IED/IMP007}.
\subsubsection{Deficiencies}
The coverage of the tests, as called for by the test specification, may currently be incomplete.
\section{INITIALISATION}
Get a new theory to work in:
=SML
val start_theory = get_current_theory_name();
new_theory "test_mdt007";
=TEX
Initialise the test package:
=SML
use_file "dtd013.sml";
use_file "imp013.sml";
init_mt_results();
=TEX

Some functions to isolate this test material from the precise details
of the pretty printer's output.  These functions are used when testing
error conditions where the error message contains a formatted type or
term.  These routines might use the HOL pretty printer (via routines
$format\-\_term1$ and $format\-\_type1$ from $PrettyPrinter$) however they
might not be installed, so instead we use the $string\_of\_XXX$ functions.

=SML
fun pr_term(tm:TERM) : string = (
	string_of_term tm
);

fun pr_type(ty:TYPE) : string = (
	string_of_type ty
);

fun pr_thm(th:THM) : string = (
	string_of_thm th
);
=TEX

=IGN
Or, we could use the printer formatting routines, in which case:

The pretty printer formatting routines return a list of strings
of up to some given line length.  Here we are dealing with short
printed texts that should fit onto one line, to encourage this we ask
for an excessively large line length.

..=SML
fun pr_term(tm:TERM) : string = (
	implode(PrettyPrinter.format_term1 true 10000 tm)
);

fun pr_type(ty:TYPE) : string = (
	implode(PrettyPrinter.format_type1 true 10000 ty)
);
=TEX

\section{VALUE BINDINGS}
=SML
val v1 = mk_var("v1", BOOL);
val v2 = mk_var("v2", BOOL);
val tv1 = mk_vartype "'1";
val tv2 = mk_vartype "'2";
val tva = mk_vartype "'a";
val N0 = (mk_ℕ o integer_of_int) 0;
val N1 = (mk_ℕ o integer_of_int) 1;
val N2 = (mk_ℕ o integer_of_int) 2;
=TEX
Test scopes:
=SML
val Deleted = new_const ("Deleted",BOOL);
val const_deleted_thm = asm_rule ⌜p = q⌝;
val ignore_warnings = set_flag("ignore_warnings",true);
val side_effect = delete_const Deleted;
val side_effect = set_flag("ignore_warnings",ignore_warnings);
val side_effect = new_theory "out_of_scope_mdt007";
val out_of_scope_thm = asm_rule ⌜p = q⌝;
val side_effect = open_theory "test_mdt007";
val side_effect = new_theory "deleted_theory_mdt007";
val del_theory_index = (string_of_int (pp'Kernel.pp'get_current_theory_name()));

val deleted_thm = asm_rule ⌜p = q⌝;
val side_effect = open_theory "test_mdt007";
val side_effect = delete_theory "deleted_theory_mdt007";

val p_eq_q_thm = asm_rule ⌜p = q⌝;
val pq_thm = asm_rule ⌜∃ p ⦁ q⌝;
val pq_ax = new_axiom(["pq_ax"], ⌜∃ p ⦁ q⌝);
val t_eq_f = asm_rule ⌜T = F⌝;
val q_eq_F = new_axiom(["q_eq_F"],⌜q = F⌝);
val T = ⌜T⌝;
val F = ⌜F⌝;
val so_isso_axiom = new_axiom(["so_isso_axiom"], ⌜∃ So IsSo ⦁ So ⇒ IsSo⌝);
val so_isso_def = new_spec(["So","IsSo"],2,so_isso_axiom);
val so_axiom = new_axiom(["so_axiom"],⌜So⌝);
val ℕ = new_type("ℕ",0) handle _ => ℕ;
val tplus = mk_const("+",mk_→_type(ℕ,mk_→_type(ℕ,ℕ)));
declare_infix (300,"+");
val Suc = new_const("Suc",mk_→_type(ℕ, ℕ))
	handle _ => mk_const("Suc",mk_→_type(ℕ, ℕ));

val strip_∧_T_conv: CONV = ( fn (tm : TERM) =>
	if is_∧ tm
	then let val (p,q) = dest_∧ tm
		in
		if q =$ T
		then asm_rule(mk_eq (tm, p))
		else fail_with_conv "strip_∧_T_conv" tm
	end
	else fail_with_conv "strip_∧_T_conv" tm
);

val sample = ⌜(λ f x y ⦁ (f x ∧ y) ∧ (λ p ⦁ p) q)(λ x ⦁ ¬ x) T ((λ p ⦁ p) q)⌝;
=TEX
=SML
fun list_eq (eq:'a * 'a -> bool) ((a :: x), (b :: y)) : bool = (
	eq(a,b) andalso list_eq eq (x, y)
) | list_eq eq ([], []) = true
| list_eq _ _ = false;
=TEX
=SML
infix 3 =**$;
infix 3 =**:;
infix 3 =**#;
infix 3 =*$;
infix 3 =*:;
=TEX
=SML
fun (a,b) =**$ (c,d) = (a =$ c) andalso (b =$ d);
fun  (a,b) =**: (c,d) = (a =: c) andalso (b =: d);
fun  (a,b) =**# (c,d) = (a =# c) andalso (b =# d);
fun (a,b) =*$ (c,d) = (a = c) andalso (b =$ d);
fun (a,b) =*: (c,d) = (a = c) andalso (b =: d);
=TEX

\section{THE TESTS - PRIMITVES AND BUILT-IN}
The tests proper:
\subsection{subst\_rule}
=SML
store_mt_results mt_run_fail[
	("subst_rule 6001 1",
	subst_rule [] ⌜∃ p ⦁ q1⌝,
	pq_thm,
	gen_fail_msg "subst_rule" 6001 ["⌜∃ p⦁ q1⌝","⌜∃ p⦁ q⌝"]),
	("subst_rule 6001 2",
	subst_rule [(t_eq_f, ⌜q:BOOL⌝)] ⌜T ⇔ q⌝,
	t_eq_f,
	gen_fail_msg "subst_rule" 6001 ["⌜T ⇔ T⌝","⌜T ⇔ F⌝"])];
store_mt_results mt_run_error [("subst_rule 6036 1",
	subst_rule [] ⌜∃ p ⦁ q⌝,
	deleted_thm,
	gen_fail_msg "subst_rule" 6036 ["p = q ⊢ p = q",
		"deleted_theory_mdt007",del_theory_index]),
	("subst_rule 6065 1",
	subst_rule [] ⌜∃ p ⦁ q⌝,
	const_deleted_thm,
	gen_fail_msg "subst_rule" 6065 ["p = q ⊢ p = q",
		"test_mdt007"]),
	("subst_rule 6066 1",
	subst_rule [] ⌜∃ p ⦁ q⌝,
	out_of_scope_thm,
	gen_fail_msg "subst_rule" 6066 ["p = q ⊢ p = q",
		"out_of_scope_mdt007"]),
	("subst_rule 6036 2",
	subst_rule [(deleted_thm,⌜q :'a⌝)] ⌜T = F⌝,
	t_eq_f,
	gen_fail_msg "subst_rule" 6036 ["p = q ⊢ p = q",
		"deleted_theory_mdt007",del_theory_index]),
	("subst_rule 6065 2",
	subst_rule [(const_deleted_thm,⌜q :'a⌝)] ⌜T = F⌝,
	t_eq_f,
	gen_fail_msg "subst_rule" 6065 ["p = q ⊢ p = q",
		"test_mdt007"]),
	("subst_rule 6066 2",
	subst_rule [(out_of_scope_thm,⌜q :'a⌝)] ⌜T = F⌝,
	t_eq_f,
	gen_fail_msg "subst_rule" 6066 ["p = q ⊢ p = q",
		"out_of_scope_mdt007"])];

store_mt_results mt_run_fail [("subst_rule 6002",
	subst_rule,
	[(asm_rule T, ⌜p:BOOL⌝)],
	gen_fail_msg "subst_rule" 6002 ["T ⊢ T"]),
	("subst_rule 3007",
	subst_rule,
	[(t_def, ⌜T⌝)],
	gen_fail_msg "subst_rule" 3007 ["⌜T⌝"]),
	("subst_rule 6029",
	subst_rule,
	[(t_def, ⌜q : ℕ⌝)],
	gen_fail_msg "subst_rule" 6029 ["⊢ T ⇔ (λ x⦁ x) = (λ x⦁ x)","⌜q⌝"])];

store_mt_results (mt_runf (op =#)) [("subst_rule_1",
	dest_thm o subst_rule [] ⌜∃ p ⦁ q⌝,
	pq_thm,
	dest_thm pq_thm),
	("subst_rule_2",
	dest_thm o subst_rule [] ⌜∃ p1 ⦁ q⌝,
	pq_thm,
	([⌜∃ p ⦁ q⌝],⌜∃ p1 ⦁ q⌝)),
	("subst_rule_3",
	dest_thm o subst_rule [(t_eq_f, ⌜q : BOOL⌝)] ⌜q = F⌝,
	t_eq_f,
	([⌜T = F⌝],⌜F = F⌝)),
	("subst_rule_4",
	dest_thm o subst_rule [(t_def, ⌜q : BOOL⌝)] ⌜q = F⌝,
	t_eq_f,
	([⌜T = F⌝],⌜((λ x:BOOL⦁x)=(λ x ⦁x)) = F⌝))];

=TEX
\subsection{simple\_λ\_eq\_rule}
=SML
store_mt_results (mt_runf (op =#)) [("simple_λ_eq_rule",
	dest_thm o simple_λ_eq_rule ⌜q : BOOL⌝,
	q_eq_F,
	([],⌜(λ q:BOOL ⦁ q) = (λ q ⦁ F)⌝))];

store_mt_results mt_run_fail[
	("simple_λ_eq_rule 3007",
	simple_λ_eq_rule T,
	q_eq_F,
	gen_fail_msg "simple_λ_eq_rule" 3007 ["⌜T⌝"]),
	("simple_λ_eq_rule 6005",
	simple_λ_eq_rule ⌜q : BOOL⌝,
	asm_rule ⌜q = F⌝,
	gen_fail_msg "simple_λ_eq_rule" 6005 ["⌜q⌝"]),
	("simple_λ_eq_rule 6020",
	simple_λ_eq_rule ⌜q : BOOL⌝,
	pq_ax,
	gen_fail_msg "simple_λ_eq_rule" 6020 ["⊢ ∃ p⦁ q"])];
store_mt_results mt_run_error [("simple_λ_eq_rule 6036",
	simple_λ_eq_rule ⌜q : BOOL⌝,
	deleted_thm,
	gen_fail_msg "simple_λ_eq_rule" 6036 ["p = q ⊢ p = q",
		"deleted_theory_mdt007",del_theory_index]),
	("simple_λ_eq_rule 6065",
	simple_λ_eq_rule ⌜q : BOOL⌝,
	const_deleted_thm,
	gen_fail_msg "simple_λ_eq_rule" 6065 ["p = q ⊢ p = q",
		"test_mdt007"]),
	("simple_λ_eq_rule 6066",
	simple_λ_eq_rule ⌜q : BOOL⌝,
	out_of_scope_thm,
	gen_fail_msg "simple_λ_eq_rule" 6066 ["p = q ⊢ p = q",
		"out_of_scope_mdt007"])];
=TEX
\subsection{inst\_type\_rule}
So far unconverted tests:
=SML
store_mt_results (mt_runf (op =#)) [("inst_type_rule_1",
	dest_thm o inst_type_rule [(BOOL, tva)],
	pq_ax,
	([],⌜∃ p : BOOL ⦁ q⌝)),
	("inst_type_rule_2",
	dest_thm o inst_type_rule [(BOOL, tv1)],
	pq_ax,
	([],⌜∃ p : 'a ⦁ q⌝))];

store_mt_results mt_run_fail [("inst_type_rule 6006",
	inst_type_rule [(BOOL, tva)],
	(asm_rule ⌜v = v⌝),
	gen_fail_msg "inst_type_rule" 6006 ["'a"]),
	("inst_type_rule 3019",
	inst_type_rule [(BOOL, BOOL)],
	pq_ax,
	gen_fail_msg "inst_type_rule" 3019 ["ⓣBOOL⌝"])];
store_mt_results mt_run_error [("inst_type_rule 6036",
	inst_type_rule [(BOOL, tva)],
	deleted_thm,
	gen_fail_msg "inst_type_rule" 6036 ["p = q ⊢ p = q",
		"deleted_theory_mdt007",del_theory_index]),
	("inst_type_rule 6065",
	inst_type_rule [(BOOL, tva)],
	const_deleted_thm,
	gen_fail_msg "inst_type_rule" 6065 ["p = q ⊢ p = q",
		"test_mdt007"]),
	("inst_type_rule 6066",
	inst_type_rule [(BOOL, tva)],
	out_of_scope_thm,
	gen_fail_msg "inst_type_rule" 6066 ["p = q ⊢ p = q",
		"out_of_scope_mdt007"])
];
=TEX
\subsection{⇒\_intro}
=SML
store_mt_results (mt_runf (op =#)) [("⇒_intro 1",
	dest_thm o ⇒_intro v1,
	pq_ax,
	([],⌜v1 ⇒ ∃ p ⦁ q⌝)),
	("⇒_intro 2",
	dest_thm o ⇒_intro v1,
	asm_rule v1,
	([],⌜v1 ⇒ v1⌝))];

store_mt_results mt_run_fail [("⇒_intro 3031",
	⇒_intro N1,
	pq_ax,
	gen_fail_msg "⇒_intro" 3031 ["⌜1⌝"])];
store_mt_results mt_run_error [("⇒_intro 6036",
	⇒_intro v1,
	deleted_thm,
	gen_fail_msg "⇒_intro" 6036 ["p = q ⊢ p = q",
		"deleted_theory_mdt007",del_theory_index]),
	("⇒_intro 6065",
	⇒_intro v1,
	const_deleted_thm,
	gen_fail_msg "⇒_intro" 6065 ["p = q ⊢ p = q",
		"test_mdt007"]),
	("⇒_intro 6066",
	⇒_intro v1,
	out_of_scope_thm,
	gen_fail_msg "⇒_intro" 6066 ["p = q ⊢ p = q",
		"out_of_scope_mdt007"])];
=TEX
\subsection{⇒\_elim}
=SML
store_mt_results (mt_runf (op =#)) [("⇒_elim_1",
	dest_thm o ⇒_elim  so_isso_def,
	so_axiom,
	([],⌜IsSo⌝))];

store_mt_results (mt_runf (op =#)) [("⇒_mp_rule",
	dest_thm o ⇒_mp_rule  so_isso_def,
	so_axiom,
	([],⌜IsSo⌝))];

store_mt_results mt_run_fail [("⇒_elim 6010",
	⇒_elim so_isso_axiom,
	so_axiom,
	gen_fail_msg "⇒_elim" 6010 [pr_thm so_isso_axiom]),
	("⇒_elim 6011",
	⇒_elim so_isso_def,
	t_thm,
	gen_fail_msg "⇒_elim" 6011 ["⊢ So ⇒ IsSo","⊢ T"])];
store_mt_results mt_run_error [("⇒_elim 6036 1",
	⇒_elim so_isso_def,
	deleted_thm,
	gen_fail_msg "⇒_elim" 6036 ["p = q ⊢ p = q",
		"deleted_theory_mdt007",del_theory_index]),
	("⇒_elim 6065 1",
	⇒_elim so_isso_def,
	const_deleted_thm,
	gen_fail_msg "⇒_elim" 6065 ["p = q ⊢ p = q",
		"test_mdt007"]),
	("⇒_elim 6066 1",
	⇒_elim so_isso_def,
	out_of_scope_thm,
	gen_fail_msg "⇒_elim" 6066 ["p = q ⊢ p = q",
		"out_of_scope_mdt007"]),
	("⇒_elim 6036 2",
	⇒_elim deleted_thm,
	so_axiom,
	gen_fail_msg "⇒_elim" 6036 ["p = q ⊢ p = q",
		"deleted_theory_mdt007",del_theory_index]),
	("⇒_elim 6065 2",
	⇒_elim const_deleted_thm,
	so_axiom,
	gen_fail_msg "⇒_elim" 6065 ["p = q ⊢ p = q",
		"test_mdt007"]),
	("⇒_elim 6066 2",
	⇒_elim out_of_scope_thm,
	so_axiom,
	gen_fail_msg "⇒_elim" 6066 ["p = q ⊢ p = q",
		"out_of_scope_mdt007"])];
=TEX
\subsection{asm\_rule}
=SML
store_mt_results (mt_runf (op =#)) [("asm_rule 1",
	dest_thm o asm_rule,
	mk_const("rubbish",BOOL),
	([mk_const("rubbish",BOOL)],mk_const("rubbish",BOOL)))];

store_mt_results mt_run_fail [("asm_rule 3031",
	asm_rule,
	N0,
	gen_fail_msg "asm_rule" 3031 ["⌜0⌝"])];
=TEX
\subsection{refl\_conv}
=SML
store_mt_results (mt_runf (op =#)) [("refl_conv 1",
	dest_thm o refl_conv,
	mk_const("rubbish",BOOL),
	([],mk_eq(mk_const("rubbish",BOOL), mk_const("rubbish",BOOL)))),
	("refl_conv 2",
	dest_thm o refl_conv,
	mk_const("rubbish",ℕ),
	([],mk_eq(mk_const("rubbish",ℕ), mk_const("rubbish",ℕ))))];
=TEX
\subsection{simple\_$\beta$\_conv}
=SML
store_mt_results (mt_runf (op =#)) [("simple_β_conv 1",
	dest_thm o simple_β_conv,
	⌜(λ p : 'a ⦁ f p) q⌝,
	([],⌜((λ p : 'a ⦁ f p) q) = f q⌝)),
	("simple_β_conv 2",
	dest_thm o simple_β_conv,
	⌜(λ p q: '1 ⦁ f p q) q⌝,
	([],⌜((λ p q: '1 ⦁ f p q) q) = (λ q': '1 ⦁ f q q')⌝))];

store_mt_results mt_run_fail [("simple_β_conv 6012",
	simple_β_conv,
	⌜(λ p q: '1 ⦁ f p q)⌝,
	gen_fail_msg "simple_β_conv" 6012 ["⌜λ p q⦁ f p q⌝"])];
=TEX
\subsection{suc\_conv}
=SML
store_mt_results (mt_runf (op =#)) [("suc_conv 1",
	dest_thm o suc_conv,
	⌜3⌝,
	([],⌜3 = Suc 2⌝))];

store_mt_results mt_run_fail [("suc_conv 3026",
	suc_conv,
	mk_const("Number",ℕ),
	gen_fail_msg "suc_conv" 3026 [pr_term (mk_const("Number",ℕ))]),
	("suc_conv 7100",
	suc_conv,
	⌜0⌝,
	gen_fail_msg "suc_conv" 7100 ["⌜0⌝"])];
=TEX
\subsection{string\_conv}
=SML
store_mt_results (mt_runf (op =#)) [("string_conv_1",
	dest_thm o string_conv,
	⌜"abc"⌝,
	([],⌜"abc" = ⓜmk_const("Cons",
		mk_→_type(CHAR,mk_→_type(STRING,STRING)))⌝
		ⓜmk_char "a"⌝ "bc"⌝)),
	("string_conv_2",
	dest_thm o string_conv,
	⌜""⌝,
	([],⌜"" = ⓜmk_const("Nil",STRING)⌝⌝))];

store_mt_results mt_run_fail [("string_conv 3025",
	string_conv,
	N0,
	gen_fail_msg "string_conv" 3025 ["⌜0⌝"])];
=TEX
\subsection{char\_conv}
=SML
store_mt_results (mt_runf (op =#)) [("char_conv_1",
	dest_thm o char_conv,
	mk_char "a",
	([],⌜ⓜmk_char "a"⌝ = ⓜmk_const("AbsChar",
		mk_→_type(ℕ,CHAR))⌝ 97⌝)),
	("char_conv_2",
	dest_thm o char_conv,
	mk_char "ℕ",
	([],⌜ⓜmk_char "ℕ"⌝ =
		ⓜmk_const("AbsChar",mk_→_type(ℕ,CHAR))⌝ 238⌝))];

store_mt_results mt_run_fail [("char_conv 3024",
	char_conv,
	mk_const("he",CHAR),
	gen_fail_msg "char_conv" 3024 [pr_term(mk_const("he",CHAR))])];

=TEX
\subsection{eq\_sym\_rule}
=SML
store_mt_results (mt_runf (op =#)) [
	("eq_sym_rule_1",
	dest_thm o eq_sym_rule,
	asm_rule⌜0=1⌝,
	([⌜0=1⌝],⌜1=0⌝)),
	("eq_sym_rule_2",
	dest_thm o eq_sym_rule,
	asm_rule⌜T=F⌝,
	([⌜T=F⌝],⌜F=T⌝))];

store_mt_results mt_run_fail[
	("eq_sym_rule 6020",
	eq_sym_rule,
	pq_ax,
	gen_fail_msg "eq_sym_rule" 6020 ["⊢ ∃ p⦁ q"])];
store_mt_results mt_run_error [("eq_sym_rule 6036",
	eq_sym_rule,
	deleted_thm,
	gen_fail_msg "eq_sym_rule" 6036 ["p = q ⊢ p = q",
		"deleted_theory_mdt007",del_theory_index]),
	("eq_sym_rule 6065",
	eq_sym_rule,
	const_deleted_thm,
	gen_fail_msg "eq_sym_rule" 6065 ["p = q ⊢ p = q",
		"test_mdt007"]),
	("eq_sym_rule 6066",
	eq_sym_rule,
	out_of_scope_thm,
	gen_fail_msg "eq_sym_rule" 6066 ["p = q ⊢ p = q",
		"out_of_scope_mdt007"])];
=TEX
\subsection{list\_simple\_∀\_elim}
=SML
store_mt_results (mt_runf (op =#)) [
	("list_simple_∀_elim_1",
	dest_thm o list_simple_∀_elim [F],
	asm_rule ⌜∀ v1 ⦁ v1 ⇒ T⌝,
	([⌜∀ v1 ⦁ v1 ⇒ T⌝],⌜F ⇒ T⌝)),
	("list_simple_∀_elim_2",
	dest_thm o list_simple_∀_elim [⌜v2 : BOOL⌝],
	asm_rule⌜∀ v1 ⦁ (λ v2: BOOL ⦁ v1) T⌝,
	([⌜∀ v1 ⦁ (λ v2: BOOL ⦁ v1) T⌝],⌜(λ v2': BOOL ⦁ v2) T : BOOL⌝)),
	("list_simple_∀_elim_3",
	dest_thm o list_simple_∀_elim [⌜v2 : BOOL⌝,⌜v2 : BOOL⌝],
	asm_rule⌜∀ v1 v2 ⦁ v1 ∧ v2⌝,
	([⌜∀ v1 v2 ⦁ v1 ∧ v2⌝],⌜v2 ∧ v2⌝)),
	("list_simple_∀_elim_4",
	dest_thm o list_simple_∀_elim [⌜v1 : BOOL⌝,⌜v1 : BOOL⌝],
	asm_rule⌜∀ v1 v2 ⦁ v1 ∧ v2⌝,
	([⌜∀ v1 v2 ⦁ v1 ∧ v2⌝],⌜v1 ∧ v1⌝)),
	("list_simple_∀_elim_5",
	dest_thm o list_simple_∀_elim [mk_t,mk_f],
	asm_rule⌜∀ x x : BOOL ⦁ x⌝,
	([⌜∀ x x : BOOL ⦁ x⌝],⌜F⌝))];

store_mt_results mt_run_fail[
	("list_simple_∀_elim 6018",
	list_simple_∀_elim [T],
	pq_ax,
	gen_fail_msg "list_simple_∀_elim" 6018 ["⊢ ∃ p⦁ q","1"]),
	("list_simple_∀_elim 3012",
	list_simple_∀_elim [N0],
	asm_rule⌜∀ v1 ⦁ v1 ⇒ T⌝,
	gen_fail_msg "list_simple_∀_elim" 3012 ["⌜0⌝","⌜v1⌝"])];
store_mt_results mt_run_error [("list_simple_∀_elim 6036",
	list_simple_∀_elim [v1],
	deleted_thm,
	gen_fail_msg "list_simple_∀_elim" 6036 ["p = q ⊢ p = q",
		"deleted_theory_mdt007",del_theory_index]),
	("list_simple_∀_elim 6065",
	list_simple_∀_elim [v1],
	const_deleted_thm,
	gen_fail_msg "list_simple_∀_elim" 6065 ["p = q ⊢ p = q",
		"test_mdt007"]),
	("list_simple_∀_elim 6066",
	list_simple_∀_elim [v1],
	out_of_scope_thm,
	gen_fail_msg "list_simple_∀_elim" 6066 ["p = q ⊢ p = q",
		"out_of_scope_mdt007"])];
=TEX
\subsection{simple\_∀\_elim}
=SML
store_mt_results (mt_runf (op =#)) [
	("simple_∀_elim_1",
	dest_thm o simple_∀_elim F,
	asm_rule ⌜∀ v1 ⦁ v1 ⇒ T⌝,
	([⌜∀ v1 ⦁ v1 ⇒ T⌝],⌜F ⇒ T⌝)),
	("simple_∀_elim_2",
	dest_thm o simple_∀_elim ⌜v2 : BOOL⌝,
	asm_rule⌜∀ v1 ⦁ (λ v2: BOOL ⦁ v1) T⌝,
	([⌜∀ v1 ⦁ (λ v2: BOOL ⦁ v1) T⌝],⌜(λ v2': BOOL ⦁ v2) T : BOOL⌝))];

store_mt_results mt_run_fail[
	("simple_∀_elim 7039",
	simple_∀_elim T,
	pq_ax,
	gen_fail_msg "simple_∀_elim" 7039 ["⊢ ∃ p⦁ q"]),
	("simple_∀_elim 3012",
	simple_∀_elim N0,
	asm_rule⌜∀ v1 ⦁ v1 ⇒ T⌝,
	gen_fail_msg "simple_∀_elim" 3012 ["⌜v1⌝","⌜0⌝"])];
=TEX
\subsection{eq\_trans\_rule}
=SML
store_mt_results (mt_runf (op =#)) [
	("eq_trans_rule_1",
	dest_thm o eq_trans_rule (asm_rule ⌜0=1⌝),
	asm_rule ⌜1 = 2⌝,
	([⌜0=1⌝, ⌜1 = 2⌝],⌜0 = 2⌝))];

store_mt_results mt_run_fail[
	("eq_trans_rule 6020 a",
	eq_trans_rule pq_ax,
	asm_rule⌜1=2⌝,
	gen_fail_msg "eq_trans_rule" 6020 ["⊢ ∃ p⦁ q"]),
	("eq_trans_rule 6020 b",
	eq_trans_rule (asm_rule⌜1=2⌝),
	pq_ax,
	gen_fail_msg "eq_trans_rule" 6020 ["⊢ ∃ p⦁ q"]),
	("eq_trans_rule 6022 a",
	eq_trans_rule (asm_rule ⌜0=1⌝),
	p_eq_q_thm,
	gen_fail_msg "eq_trans_rule" 6022 ["0 = 1 ⊢ 0 = 1", "p = q ⊢ p = q"]),
	("eq_trans_rule 6022 b",
	eq_trans_rule (asm_rule ⌜0=1⌝),
	asm_rule ⌜0 = 2⌝,
	gen_fail_msg "eq_trans_rule" 6022 ["0 = 1 ⊢ 0 = 1", "0 = 2 ⊢ 0 = 2"])];
store_mt_results mt_run_error [("eq_trans_rule 6036 a",
	eq_trans_rule so_isso_axiom,
	deleted_thm,
	gen_fail_msg "eq_trans_rule" 6036 ["p = q ⊢ p = q",
		"deleted_theory_mdt007",del_theory_index]),
	("eq_trans_rule 6065 a",
	eq_trans_rule so_isso_axiom,
	const_deleted_thm,
	gen_fail_msg "eq_trans_rule" 6065 ["p = q ⊢ p = q",
		"test_mdt007"]),
	("eq_trans_rule 6066 a",
	eq_trans_rule so_isso_axiom,
	out_of_scope_thm,
	gen_fail_msg "eq_trans_rule" 6066 ["p = q ⊢ p = q",
		"out_of_scope_mdt007"]),
	("eq_trans_rule 6036 b",
	eq_trans_rule deleted_thm,
	so_isso_axiom,
	gen_fail_msg "eq_trans_rule" 6036 ["p = q ⊢ p = q",
		"deleted_theory_mdt007",del_theory_index]),
	("eq_trans_rule 6065 b",
	eq_trans_rule const_deleted_thm,
	so_isso_axiom,
	gen_fail_msg "eq_trans_rule" 6065 ["p = q ⊢ p = q",
		"test_mdt007"]),
	("eq_trans_rule 6066 b",
	eq_trans_rule out_of_scope_thm,
	so_isso_axiom,
	gen_fail_msg "eq_trans_rule" 6066 ["p = q ⊢ p = q",
		"out_of_scope_mdt007"])];
=TEX
\subsection{mk\_app\_rule}
=SML
store_mt_results (mt_runf (op =#)) [
	("mk_app_rule_1",
	dest_thm o mk_app_rule (asm_rule⌜(f : ℕ → ℕ) = g⌝),
	asm_rule ⌜1 = 2⌝,
	([⌜(f : ℕ → ℕ) = g⌝,⌜1 = 2⌝],⌜(f 1 : ℕ) = g 2⌝))];

store_mt_results mt_run_fail[
	("mk_app_rule 6020 a",
	mk_app_rule pq_ax,
	asm_rule ⌜1 = 2⌝,
	gen_fail_msg "mk_app_rule" 6020 ["⊢ ∃ p⦁ q"]),
	("mk_app_rule 6020 b",
	mk_app_rule (asm_rule ⌜1=2⌝),
	pq_ax,
	gen_fail_msg "mk_app_rule" 6020 ["⊢ ∃ p⦁ q"]),
	("mk_app_rule 6023 a",
	mk_app_rule (refl_conv T ),
	(asm_rule ⌜1=2⌝),
	gen_fail_msg "mk_app_rule" 6023 ["⊢ T ⇔ T", "1 = 2 ⊢ 1 = 2"]),
	("mk_app_rule 6023 b",
	mk_app_rule (asm_rule ⌜0=1⌝),
	(asm_rule ⌜0=2⌝),
	gen_fail_msg "mk_app_rule" 6023 ["0 = 1 ⊢ 0 = 1", "0 = 2 ⊢ 0 = 2"])];
store_mt_results mt_run_error [("mk_app_rule 6036 a",
	mk_app_rule so_isso_axiom,
	deleted_thm,
	gen_fail_msg "mk_app_rule" 6036 ["p = q ⊢ p = q",
		"deleted_theory_mdt007",del_theory_index]),
	("mk_app_rule 6065 a",
	mk_app_rule so_isso_axiom,
	const_deleted_thm,
	gen_fail_msg "mk_app_rule" 6065 ["p = q ⊢ p = q",
		"test_mdt007"]),
	("mk_app_rule 6066 a",
	mk_app_rule so_isso_axiom,
	out_of_scope_thm,
	gen_fail_msg "mk_app_rule" 6066 ["p = q ⊢ p = q",
		"out_of_scope_mdt007"]),
	("mk_app_rule 6036 b",
	mk_app_rule deleted_thm,
	so_isso_axiom,
	gen_fail_msg "mk_app_rule" 6036 ["p = q ⊢ p = q",
		"deleted_theory_mdt007",del_theory_index]),
	("mk_app_rule 6065 b",
	mk_app_rule const_deleted_thm,
	so_isso_axiom,
	gen_fail_msg "mk_app_rule" 6065 ["p = q ⊢ p = q",
		"test_mdt007"]),
	("mk_app_rule 6066 b",
	mk_app_rule out_of_scope_thm,
	so_isso_axiom,
	gen_fail_msg "mk_app_rule" 6066 ["p = q ⊢ p = q",
		"out_of_scope_mdt007"])];
=TEX
\subsection{⇔\_mp\_rule}
=SML
store_mt_results (mt_runf (op =#)) [
	("⇔_mp_rule_1",
	dest_thm o ⇔_mp_rule t_eq_f,
	asm_rule ⌜T⌝,
	([⌜T = F⌝,⌜T⌝],⌜F⌝))];

store_mt_results mt_run_fail[
	("⇔_mp_rule 6024",
	⇔_mp_rule t_eq_f,
	(asm_rule ⌜F⌝),
	gen_fail_msg "⇔_mp_rule" 6024 ["T ⇔ F ⊢ T ⇔ F", "F ⊢ F"]),
	("⇔_mp_rule 6030",
	⇔_mp_rule (asm_rule ⌜T⌝),
	t_eq_f,
	gen_fail_msg "⇔_mp_rule" 6030 ["T ⊢ T"])];
store_mt_results mt_run_error [("⇔_mp_rule 6036 a",
	⇔_mp_rule so_isso_axiom,
	deleted_thm,
	gen_fail_msg "⇔_mp_rule" 6036 ["p = q ⊢ p = q",
		"deleted_theory_mdt007",del_theory_index]),
	("⇔_mp_rule 6065 a",
	⇔_mp_rule so_isso_axiom,
	const_deleted_thm,
	gen_fail_msg "⇔_mp_rule" 6065 ["p = q ⊢ p = q",
		"test_mdt007"]),
	("⇔_mp_rule 6066 a",
	⇔_mp_rule so_isso_axiom,
	out_of_scope_thm,
	gen_fail_msg "⇔_mp_rule" 6066 ["p = q ⊢ p = q",
		"out_of_scope_mdt007"]),
	("⇔_mp_rule 6036 b",
	⇔_mp_rule deleted_thm,
	so_isso_axiom,
	gen_fail_msg "⇔_mp_rule" 6036 ["p = q ⊢ p = q",
		"deleted_theory_mdt007",del_theory_index]),
	("⇔_mp_rule 6065 b",
	⇔_mp_rule const_deleted_thm,
	so_isso_axiom,
	gen_fail_msg "⇔_mp_rule" 6065 ["p = q ⊢ p = q",
		"test_mdt007"]),
	("⇔_mp_rule 6066 b",
	⇔_mp_rule out_of_scope_thm,
	so_isso_axiom,
	gen_fail_msg "⇔_mp_rule" 6066 ["p = q ⊢ p = q",
		"out_of_scope_mdt007"])];

=TEX
\subsection{simple\_∀\_intro}
=SML
store_mt_results (mt_runf (op =#)) [
	("simple_∀_intro_1",
	dest_thm o simple_∀_intro v1,
	t_eq_f,
	([⌜T = F⌝],⌜∀ v1 : BOOL ⦁ T = F⌝)),
	("simple_∀_intro_2",
	dest_thm o simple_∀_intro ⌜q : BOOL⌝,
	pq_ax,
	([],⌜∀ q : BOOL ⦁ ∃ p : 'a ⦁ q⌝))];

store_mt_results mt_run_fail[
	("simple_∀_intro 3007",
	simple_∀_intro T,
	t_eq_f,
	gen_fail_msg "simple_∀_intro" 3007 ["⌜T⌝"]),
	("simple_∀_intro 6005",
	simple_∀_intro v1,
	(asm_rule v1),
	gen_fail_msg "simple_∀_intro" 6005 ["⌜v1⌝"])];
store_mt_results mt_run_error [("simple_∀_intro 6036",
	simple_∀_intro v1,
	deleted_thm,
	gen_fail_msg "simple_∀_intro" 6036 ["p = q ⊢ p = q",
		"deleted_theory_mdt007",del_theory_index]),
	("simple_∀_intro 6065",
	simple_∀_intro v1,
	const_deleted_thm,
	gen_fail_msg "simple_∀_intro" 6065 ["p = q ⊢ p = q",
		"test_mdt007"]),
	("simple_∀_intro 6066",
	simple_∀_intro v1,
	out_of_scope_thm,
	gen_fail_msg "simple_∀_intro" 6066 ["p = q ⊢ p = q",
		"out_of_scope_mdt007"])	];

=TEX
\subsection{inst\_term\_rule}
=SML
store_mt_results (mt_runf (op =#)) [
	("inst_term_rule_1",
	dest_thm o inst_term_rule [(T,v1),(F,v2)],
	simple_∀_elim v2
		(simple_∀_elim v1 (
		(asm_rule ⌜∀ v1 v2 : BOOL ⦁ v1 = v2⌝))),
	([⌜∀ v1 v2 : BOOL ⦁ v1 = v2⌝],⌜T = F⌝)),
	("inst_term_rule_2",
	dest_thm o inst_term_rule [(v2,v1),(v1,v2)],
	simple_∀_elim v2
		(simple_∀_elim v1 (
		(asm_rule ⌜∀ v1 v2 : BOOL ⦁ v1 = v2⌝))),
	([⌜∀ v1 v2 : BOOL ⦁ v1 = v2⌝],⌜(v2:BOOL) = v1⌝)),
	("inst_term_rule_3",
	dest_thm o inst_term_rule [],
	simple_∀_elim v2
		(simple_∀_elim v1 (
		(asm_rule ⌜∀ v1 v2 : BOOL ⦁ v1 = v2⌝))),
	([⌜∀ v1 v2 : BOOL ⦁ v1 = v2⌝],⌜(v1:BOOL) = v2⌝))];

store_mt_results mt_run_fail[
	("inst_term_rule 3007",
	inst_term_rule [(v2,T)],
	(asm_rule v1),
	gen_fail_msg "inst_term_rule" 3007 ["⌜T⌝"]),
	("inst_term_rule 6027",
	inst_term_rule [(N0,v1)],
	(asm_rule v1),
	gen_fail_msg "inst_term_rule" 6027 ["⌜0⌝","⌜v1⌝"]),
	("inst_term_rule 6028",
	inst_term_rule [(v2,v1)],
	(asm_rule v1),
	gen_fail_msg "inst_term_rule" 6028 ["⌜v1⌝"])];
store_mt_results mt_run_error [("inst_term_rule 6036",
	inst_term_rule [],
	deleted_thm,
	gen_fail_msg "inst_term_rule" 6036 ["p = q ⊢ p = q",
		"deleted_theory_mdt007",del_theory_index]),
	("inst_term_rule 6065",
	inst_term_rule [],
	const_deleted_thm,
	gen_fail_msg "inst_term_rule" 6065 ["p = q ⊢ p = q",
		"test_mdt007"]),
	("inst_term_rule 6066",
	inst_term_rule [],
	out_of_scope_thm,
	gen_fail_msg "inst_term_rule" 6066 ["p = q ⊢ p = q",
		"out_of_scope_mdt007"])	];
=TEX
\subsection{plus\_conv}
=SML
store_mt_results (mt_runf (op =#)) [("plus_conv 1",
	dest_thm o plus_conv,
	list_mk_app(tplus,[⌜7⌝,⌜2⌝]),
	([],mk_eq(list_mk_app(tplus,[⌜7⌝,⌜2⌝]),⌜9⌝))),
	("plus_conv 2",
	dest_thm o plus_conv,
	list_mk_app(tplus,[⌜0⌝,⌜2⌝]),
	([],mk_eq(list_mk_app(tplus,[⌜0⌝,⌜2⌝]),⌜2⌝)))];
=TEX
The following assumes that $+$ has been declared infix.
=SML
store_mt_results mt_run_fail [("plus_conv 6085 a",
	plus_conv,
	list_mk_app(tplus,[mk_var("n",ℕ),N1]),
	gen_fail_msg "plus_conv" 6085 ["⌜n + 1⌝"]),
	("plus_conv 6085 b",
	plus_conv,
	mk_var("n",ℕ),
	gen_fail_msg "plus_conv" 6085 ["⌜n⌝"])];
=TEX
\section{DERIVED INFERENCE RULES}
We will from now on assume that out of scope or invalid
theorems will have been properly handled, by being
caught by the interfaces to the primitive and built-in inference rules.
\subsection{app\_fun\_rule}
=SML
store_mt_results (mt_runf (op =#)) [("app_fun_rule",
	dest_thm o app_fun_rule ⌜f : ℕ → ℕ⌝,
	asm_rule ⌜ 0 = 1 ⌝,
	([⌜ 0 = 1 ⌝], ⌜ (f 0 : ℕ) = f 1 ⌝))];

store_mt_results mt_run_fail [("app_fun_rule 6020",
	app_fun_rule  ⌜f : ℕ → ℕ⌝,
	pq_ax,
	gen_fail_msg "app_fun_rule" 6020 ["⊢ ∃ p⦁ q"]),
	("app_fun_rule 7024",
	app_fun_rule  ⌜f : ℕ → ℕ⌝,
	t_eq_f,
	gen_fail_msg "app_fun_rule" 7024 ["⌜f⌝"])];

=TEX
\subsection{app\_arg\_rule}
=SML
store_mt_results (mt_runf (op =#)) [("app_arg_rule",
	dest_thm o app_arg_rule ⌜2⌝,
	asm_rule ⌜ (f : ℕ → ℕ)  = g⌝,
	([⌜ (f : ℕ → ℕ)  = g⌝], ⌜ (f 2 : ℕ) = g 2 ⌝))];

store_mt_results mt_run_fail [("app_arg_rule 6020",
	app_arg_rule  ⌜2⌝,
	pq_ax,
	gen_fail_msg "app_arg_rule" 6020 ["⊢ ∃ p⦁ q"]),
	("app_arg_rule 7025",
	app_arg_rule  ⌜f : ℕ → ℕ⌝,
	t_eq_f,
	gen_fail_msg "app_arg_rule" 7025 ["⌜f⌝"])];

=TEX
\subsection{⇔\_t\_intro}
=SML
store_mt_results (mt_runf (op =#)) [("⇔_t_intro",
	dest_thm o ⇔_t_intro,
	f_thm,
	([],⌜¬ F ⇔ T⌝))];
=TEX
\subsection{⇔\_t\_elim}
=SML
store_mt_results (mt_runf (op =#)) [("⇔_t_elim",
	dest_thm o ⇔_t_elim,
	(⇔_t_intro f_thm),
	([],⌜¬ F⌝))];

store_mt_results mt_run_fail [("⇔_t_elim 7106",
	⇔_t_elim,
	t_thm,
	gen_fail_msg "⇔_t_elim" 7106 ["⊢ T"])];
=TEX
\subsection{contr\_rule}
=SML
store_mt_results (mt_runf (op =#)) [("contr_rule",
	dest_thm o contr_rule ⌜0 = 1⌝,
	(asm_rule mk_f),
	([mk_f],⌜0 = 1⌝))];

store_mt_results mt_run_fail [("contr_rule 7001",
	contr_rule mk_t,
	t_thm,
	gen_fail_msg "contr_rule" 7001 ["⊢ T"]),
	("contr_rule 3031",
	contr_rule ⌜0⌝,
	(asm_rule mk_f),
	gen_fail_msg "contr_rule" 3031 ["⌜0⌝"])];
=TEX
\subsection{c\_contr\_rule}
=SML
store_mt_results (mt_runf (op =#)) [("c_contr_rule 1",
	dest_thm o c_contr_rule ⌜0 = 1⌝,
	undisch_rule(⇒_intro ⌜¬(0 = 1)⌝(asm_rule mk_f)),
	([mk_f],⌜0 = 1⌝)),
	("c_contr_rule 2",
	dest_thm o c_contr_rule ⌜(λ x : BOOL ⦁ x) x⌝,
	undisch_rule(⇒_intro ⌜¬((λ y:BOOL ⦁ y)x)⌝(asm_rule mk_f)),
	([mk_f],⌜(λ x ⦁ x) x : BOOL⌝))];

store_mt_results mt_run_fail [("c_contr_rule 7001",
	c_contr_rule ⌜0 = 1⌝,
	undisch_rule(⇒_intro ⌜¬(0 = 1)⌝ t_thm),
	gen_fail_msg "c_contr_rule" 7001  ["¬ 0 = 1 ⊢ T"]),
	("c_contr_rule 3031",
	c_contr_rule ⌜0⌝,
	asm_rule mk_f,
	gen_fail_msg "c_contr_rule" 3031  ["⌜0⌝"]),
	("c_contr_rule 7003",
	c_contr_rule ⌜0 = 1⌝,
	asm_rule mk_f,
	gen_fail_msg "c_contr_rule" 7003  ["⌜0 = 1⌝"])];
=TEX
\subsection{¬\_intro}
=SML
store_mt_results (mt_runf (op =#)) [("¬_intro 1",
	dest_thm o ¬_intro ⌜0 = 1⌝ (asm_rule mk_f),
	f_thm,
	([mk_f],⌜¬(0 = 1)⌝)),
	("¬_intro 2",
	dest_thm o ¬_intro ⌜0 = 1⌝ f_thm,
	(asm_rule mk_f),
	([mk_f],⌜¬(0 = 1)⌝)),
	("¬_intro 3",
	dest_thm o ¬_intro ⌜¬(0 = 1)⌝ (asm_rule ⌜0 = 1⌝),
	(asm_rule  ⌜¬(0 = 1)⌝),
	([⌜0 = 1⌝],⌜¬(¬(0 = 1))⌝)),
	("¬_intro 4",
	dest_thm o ¬_intro ⌜(λ z : BOOL ⦁ z) x⌝ (asm_rule ⌜(λ x : BOOL ⦁ x) x⌝),
	(asm_rule  ⌜¬(λ y : BOOL ⦁ y) x⌝),
	([⌜¬(λ y : BOOL ⦁ y) x⌝],⌜¬(λ z : BOOL ⦁ z) x⌝))];

store_mt_results mt_run_fail [("¬_intro 3031",
	¬_intro ⌜0⌝ (asm_rule mk_f),
	f_thm,
	gen_fail_msg "¬_intro" 3031 ["⌜0⌝"]),
	("¬_intro 7004",
	¬_intro mk_f f_thm,
	t_thm,
	gen_fail_msg "¬_intro" 7004 ["⊢ ¬ F", "⊢ T"])];
=TEX
\subsection{¬\_elim}
=SML
store_mt_results (mt_runf (op =#)) [("¬_elim 1",
	dest_thm o ¬_elim ⌜0 = 1⌝ (asm_rule mk_f),
	f_thm,
	([mk_f],⌜(0 = 1)⌝)),
	("¬_elim 2",
	dest_thm o ¬_elim ⌜0 = 1⌝ f_thm,
	(asm_rule mk_f),
	([mk_f],⌜(0 = 1)⌝)),
	("¬_elim 3",
	dest_thm o ¬_elim ⌜¬(0 = 1)⌝ (asm_rule ⌜0 = 1⌝),
	(asm_rule  ⌜¬(0 = 1)⌝),
	([⌜¬(0 = 1)⌝,⌜0 = 1⌝],⌜¬(0 = 1)⌝)),
	("¬_elim 4",
	dest_thm o ¬_elim mk_f (asm_rule ⌜(λ x : BOOL ⦁ x) x⌝),
	(asm_rule  ⌜¬(λ y : BOOL ⦁ y) x⌝),
	([⌜¬(λ y : BOOL ⦁ y) x⌝,⌜(λ x : BOOL ⦁ x) x⌝],mk_f))];

store_mt_results mt_run_fail [("¬_elim 3031",
	¬_elim ⌜0⌝ (asm_rule mk_f),
	f_thm,
	gen_fail_msg "¬_elim" 3031 ["⌜0⌝"]),
	("¬_elim 7004",
	¬_elim mk_f f_thm,
	t_thm,
	gen_fail_msg "¬_elim" 7004 ["⊢ ¬ F", "⊢ T"])];
=TEX
\subsection{¬\_¬\_intro}
=SML
store_mt_results (mt_runf (op =#)) [("¬_¬_intro",
	dest_thm o ¬_¬_intro,
	t_thm,
	([],⌜¬(¬ T)⌝))];
=TEX
\subsection{¬\_¬\_elim}
=SML
store_mt_results (mt_runf (op =#)) [("¬_¬_elim",
	dest_thm o ¬_¬_elim,
	(asm_rule ⌜¬(¬ T)⌝),
	([ ⌜¬(¬ T)⌝],mk_t))];

store_mt_results mt_run_fail [("¬_¬_elim 7006",
	¬_¬_elim,
	t_thm,
	gen_fail_msg "¬_¬_elim" 7006 ["⊢ T"])];
=TEX
\subsection{¬\_¬\_conv}
=SML
store_mt_results (mt_runf (op =#)) [("¬_¬_conv",
	dest_thm o ¬_¬_conv,
	⌜¬(¬ T)⌝,
	([],⌜¬(¬ T) ⇔ T⌝))];

store_mt_results mt_run_fail [("¬_¬_conv 7022",
	¬_¬_conv,
	mk_t,
	gen_fail_msg "¬_¬_conv" 7022 ["⌜T⌝"])];
=TEX
\subsection{∧\_intro}
=SML
store_mt_results (mt_runf (op =#)) [("∧_intro 1",
	dest_thm o ∧_intro t_thm,
	f_thm,
	([],⌜T ∧ ¬ F⌝)),
	("∧_intro 2",
	dest_thm o ∧_intro (asm_rule ⌜x : BOOL⌝),
	 (asm_rule ⌜x : BOOL⌝),
	([⌜x : BOOL⌝],⌜x ∧ x⌝))];
=TEX
\subsection{∧\_left\_elim}
=SML
store_mt_results (mt_runf (op =#)) [("∧_left_elim",
	dest_thm o ∧_left_elim,
	asm_rule⌜T ∧ F⌝,
	([⌜T ∧ F⌝],mk_t))];

store_mt_results mt_run_fail [("∧_left_elim 7007",
	∧_left_elim,
	t_thm,
	gen_fail_msg "∧_left_elim" 7007 ["⊢ T"])];
=TEX
\subsection{∧\_right\_elim}
=SML
store_mt_results (mt_runf (op =#)) [("∧_right_elim",
	dest_thm o ∧_right_elim,
	asm_rule⌜T ∧ F⌝,
	([⌜T ∧ F⌝],mk_f))];

store_mt_results mt_run_fail [("∧_right_elim 7007",
	∧_right_elim,
	t_thm,
	gen_fail_msg "∧_right_elim" 7007 ["⊢ T"])];
=TEX
\subsection{list\_∧\_intro}
=SML
store_mt_results (mt_runf (op =#)) [("list_∧_intro",
	dest_thm o list_∧_intro,
	[t_thm,f_thm,t_thm],
	([],⌜T ∧ ¬F ∧ T⌝))];

store_mt_results mt_run_fail [("list_∧_intro 7107",
	list_∧_intro,
	[],
	gen_fail_msg "list_∧_intro" 7107 [])];
=TEX
\subsection{strip\_∧\_rule}
=SML
store_mt_results(mt_runf (list_eq(op =#))) [("strip_∧_rule 1",
	map dest_thm o strip_∧_rule,
	asm_rule ⌜(T ∧ F) ∧ (F ∧ T)⌝,
	[([⌜(T ∧ F) ∧ (F ∧ T)⌝],mk_t),
	([⌜(T ∧ F) ∧ (F ∧ T)⌝],mk_f),
	([⌜(T ∧ F) ∧ (F ∧ T)⌝],mk_f),
	([⌜(T ∧ F) ∧ (F ∧ T)⌝],mk_t)]
),
	("strip_∧_rule 2",
	map dest_thm o strip_∧_rule,
	t_thm,
	[([],mk_t)])];
=TEX
\subsection{⇒\_∧\_rule}
=SML
store_mt_results (mt_runf (op =#)) [("⇒_∧_rule",
	dest_thm o ⇒_∧_rule,
	asm_rule ⌜a ⇒ b ⇒ c⌝,
	([⌜a ⇒ b ⇒ c⌝],⌜(a ∧ b) ⇒ c⌝))];

store_mt_results mt_run_fail [("⇒_∧_rule 7008",
	⇒_∧_rule,
	t_thm,
	gen_fail_msg "⇒_∧_rule" 7008 ["⊢ T"])];
=TEX
\subsection{∧\_⇒\_rule}
=SML
store_mt_results (mt_runf (op =#)) [("∧_⇒_rule",
	dest_thm o ∧_⇒_rule,
	asm_rule ⌜(a ∧ b) ⇒ c⌝,
	([⌜(a ∧ b) ⇒ c⌝],⌜a ⇒ b ⇒ c⌝))];

store_mt_results mt_run_fail [("∧_⇒_rule 7009",
	∧_⇒_rule,
	t_thm,
	gen_fail_msg "∧_⇒_rule" 7009 ["⊢ T"])];
=TEX
\subsection{∨\_left\_intro}
=SML
store_mt_results (mt_runf (op =#)) [("∨_left_intro",
	dest_thm o ∨_left_intro mk_f,
	t_thm,
	([],⌜F ∨ T⌝))];

store_mt_results mt_run_fail [("∨_left_intro 3031",
	∨_left_intro ⌜0⌝,
	t_thm,
	gen_fail_msg "∨_left_intro" 3031 ["⌜0⌝"])];
=TEX
\subsection{∨\_right\_intro}
=SML
store_mt_results (mt_runf (op =#)) [("∨_right_intro",
	dest_thm o ∨_right_intro mk_f,
	t_thm,
	([],⌜T ∨ F⌝))];

store_mt_results mt_run_fail [("∨_right_intro 3031",
	∨_right_intro ⌜0⌝,
	t_thm,
	gen_fail_msg "∨_right_intro" 3031 ["⌜0⌝"])];
=TEX
\subsection{∨\_elim}
=SML
store_mt_results (mt_runf (op =#)) [("∨_elim",
	dest_thm o ∨_elim (asm_rule ⌜x ∨ y⌝) (asm_rule ⌜x:BOOL⌝),
	undisch_rule(asm_rule⌜y ⇒ x⌝),
	([⌜x ∨ y⌝, ⌜y ⇒ x⌝],⌜x : BOOL⌝))];

store_mt_results mt_run_fail [("∨_elim 7010",
	∨_elim t_thm (asm_rule ⌜x:BOOL⌝),
	undisch_rule(asm_rule⌜y ⇒ x⌝),
	gen_fail_msg "∨_elim" 7010 ["⊢ T"]),
	("∨_elim 7083",
	∨_elim (asm_rule ⌜x ∨ y⌝) (asm_rule ⌜x :BOOL⌝),
	(asm_rule⌜y : BOOL⌝),
	gen_fail_msg "∨_elim" 7083 ["x ∨ y ⊢ x ∨ y",
		"x ⊢ x", "y ⊢ y"])];
=TEX
\subsection{∨\_cancel\_rule}
=SML
store_mt_results (mt_runf (op =#)) [("∨_cancel_rule 1",
	dest_thm o ∨_cancel_rule (asm_rule ⌜T ∨ F⌝),
	f_thm,
	([⌜T ∨ F⌝],mk_t)),
	("∨_cancel_rule 2",
	dest_thm o ∨_cancel_rule (asm_rule ⌜F ∨ T⌝),
	f_thm,
	([⌜F ∨ T⌝],mk_t)),
	("∨_cancel_rule 3",
	dest_thm o ∨_cancel_rule (asm_rule ⌜(λ x:BOOL ⦁ x)p ∨ (λ y:BOOL ⦁ y)p⌝),
	asm_rule ⌜¬((λ z:BOOL ⦁ z)p)⌝,
	([⌜(λ x:BOOL ⦁ x)p ∨ (λ y:BOOL ⦁ y)p⌝, ⌜¬((λ z:BOOL ⦁ z)p)⌝],⌜(λ x:BOOL ⦁ x)p⌝))];

store_mt_results mt_run_fail [("∨_cancel_rule 7010",
	∨_cancel_rule t_thm,
	t_thm,
	gen_fail_msg "∨_cancel_rule" 7010 ["⊢ T"]),
	("∨_cancel_rule 7050",
	∨_cancel_rule (asm_rule⌜x ∨ y⌝),
	t_thm,
	gen_fail_msg "∨_cancel_rule" 7050 ["x ∨ y ⊢ x ∨ y", "⊢ T"])];
=TEX
\subsection{disch\_rule}
=SML
store_mt_results (mt_runf (op =#)) [("disch_rule",
	dest_thm o disch_rule⌜x : BOOL⌝,
	asm_rule⌜x : BOOL⌝,
	([],⌜x ⇒ x⌝))];

store_mt_results mt_run_fail [("disch_rule 7031",
	disch_rule⌜x : BOOL⌝,
	t_thm,
	gen_fail_msg "disch_rule" 7031 ["⌜x⌝"])];
=TEX
\subsection{simple\_⇒\_match\_mp\_rule}
=SML
let
val x1 = ⌜x : 'a⌝;
val x2 = ⌜x : 'b⌝;
val tm1 = list_mk_simple_∀([x1,x2],
	mk_⇒(
	list_mk_app(mk_var("f",mk_→_type(tva,
		mk_→_type(mk_vartype"'b",BOOL))),
		[x1,x2]),
	⌜b:BOOL⌝));
val tm2 = mk_⇒(
	list_mk_app(mk_var("f",mk_→_type(tva,
		mk_→_type(mk_vartype"'b",BOOL))),
		[x1,x2]),
	⌜b:BOOL⌝);
in
(store_mt_results (mt_runf (op =#)) [("simple_⇒_match_mp_rule 1",
	dest_thm o simple_⇒_match_mp_rule
		(simple_∀_elim ⌜x : 'a⌝ (asm_rule ⌜∀ x y ⦁ f x y ⇒ b⌝)),
	asm_rule ⌜f 1 2 : BOOL⌝,
	([⌜∀ x y: ℕ ⦁ f x y ⇒ b⌝, ⌜f 1 2 : BOOL⌝],⌜b : BOOL⌝)),
	("simple_⇒_match_mp_rule 2",
	dest_thm o simple_⇒_match_mp_rule
		(simple_∀_elim ⌜x : 'a⌝ (asm_rule ⌜∀ x y ⦁ f x y ⇒ b ⇒ c⌝)),
	asm_rule ⌜f 1 2 : BOOL⌝,
	([⌜∀ x y: ℕ ⦁ f x y ⇒ b ⇒ c⌝, ⌜f 1 2 : BOOL⌝],⌜b ⇒ c⌝)),
	("simple_⇒_match_mp_rule 3",
	dest_thm o simple_⇒_match_mp_rule
		(asm_rule tm1),
	asm_rule ⌜f 1 2 : BOOL⌝,
	([⌜∀ x x' :ℕ ⦁ f x x' ⇒ b⌝, ⌜f 1 2 : BOOL⌝],⌜b : BOOL⌝)),
	("simple_⇒_match_mp_rule 4",
	dest_thm o simple_⇒_match_mp_rule
		(asm_rule tm2),
	asm_rule ⌜f 1 2 : BOOL⌝,
	([⌜f 1 2 ⇒ b⌝, ⌜f 1 2 : BOOL⌝],⌜b : BOOL⌝))

	])
end;

store_mt_results (mt_runf (op =#)) [("simple_⇒_match_mp_rule1 1",
	dest_thm o simple_⇒_match_mp_rule1
		(simple_∀_intro⌜x : 'a⌝ (all_⇒_intro
		(asm_intro (⌜x : 'a = x⌝) (refl_conv ⌜f (x : 'a)⌝)))),
	refl_conv ⌜1⌝,
	([],⌜f 1:'b = f 1⌝)),
	("simple_⇒_match_mp_rule1 2",
	dest_thm o simple_⇒_match_mp_rule1
		(all_∀_intro
		(all_⇒_intro
		(asm_intro (⌜x : 'a = x⌝) (refl_conv ⌜f (x : 'a)⌝)))),
	refl_conv ⌜1⌝,
	([],⌜f 1:'b = f 1⌝))
	];

store_mt_results (mt_runf (op =#)) [("simple_⇒_match_mp_rule2 1",
	dest_thm o simple_⇒_match_mp_rule2
		(simple_∀_intro⌜x : 'a⌝ (all_⇒_intro
		(asm_intro (⌜x : 'a = x⌝) (refl_conv ⌜f (x : 'a)⌝)))),
	refl_conv ⌜1⌝,
	([],⌜f 1:'b = f 1⌝)),
	("simple_⇒_match_mp_rule2 2",
	dest_thm o simple_⇒_match_mp_rule2
		(all_∀_intro
		(all_⇒_intro
		(asm_intro (⌜x : 'a = x⌝) (refl_conv ⌜f (x : 'a) (y : 'b) : 'c⌝)))),
	(asm_intro ⌜y:'b = y⌝ (refl_conv ⌜1⌝)),
	([⌜y : 'b = y⌝],⌜f 1 (y' : 'b') : 'c = f 1 y'⌝)),
	("simple_⇒_match_mp_rule2 3",
	dest_thm o simple_⇒_match_mp_rule2
		(asm_intro ⌜y:'b = y⌝
		(all_∀_intro
		(all_⇒_intro
		(asm_intro (⌜x : 'a = x⌝) (refl_conv ⌜f (x : 'a) (y : 'b) : 'c⌝))))),
	(refl_conv ⌜1⌝),
	([⌜y : 'b = y⌝],⌜f 1 (y' : 'b) : 'c = f 1 y'⌝)),
	("simple_⇒_match_mp_rule2 4",
	dest_thm o simple_⇒_match_mp_rule2
		(asm_intro ⌜x:'a = x⌝
		(all_∀_intro
		(all_⇒_intro
		(asm_intro (⌜x : 'a = x⌝) (refl_conv ⌜f (x : 'a) : 'c⌝))))),
	(refl_conv ⌜x : 'a⌝),
	([⌜x : 'a = x⌝],⌜f (x : 'a) : 'c = f x⌝))
	];

store_mt_results mt_run_fail [("simple_⇒_match_mp_rule 7044 a",
	simple_⇒_match_mp_rule t_thm,
	t_thm,
	gen_fail_msg "simple_⇒_match_mp_rule" 7044 ["⌜T⌝", "⊢ T"]),
	("simple_⇒_match_mp_rule 7044 b",
	simple_⇒_match_mp_rule (asm_rule⌜(1 = 1) ⇒ x⌝),
	t_thm,
	gen_fail_msg "simple_⇒_match_mp_rule" 7044 ["⌜T⌝","1 = 1 ⇒ x ⊢ 1 = 1 ⇒ x"])];

store_mt_results mt_run_fail [("simple_⇒_match_mp_rule1 7045 a",
	simple_⇒_match_mp_rule1,
	t_thm,
	gen_fail_msg "simple_⇒_match_mp_rule1" 7045 ["⊢ T"])];
store_mt_results mt_run_fail [("simple_⇒_match_mp_rule1 7044 b",
	simple_⇒_match_mp_rule1 (asm_rule⌜(1 = 1) ⇒ x⌝),
	(asm_rule ⌜(x:'a) =x⌝),
	gen_fail_msg "simple_⇒_match_mp_rule1" 7044
	["⌜x = x⌝","⌜1 = 1⌝"])];


store_mt_results mt_run_fail [("simple_⇒_match_mp_rule2 7045 a",
	simple_⇒_match_mp_rule2,
	t_thm,
	gen_fail_msg "simple_⇒_match_mp_rule2" 7045 ["⊢ T"])];
store_mt_results mt_run_fail [("simple_⇒_match_mp_rule2 7044 b",
	simple_⇒_match_mp_rule2 (asm_rule⌜(1 = 1) ⇒ x⌝),
	(asm_rule ⌜(x:'a) =x⌝),
	gen_fail_msg "simple_⇒_match_mp_rule2" 7044
	["⌜x = x⌝","⌜1 = 1⌝"])];
=TEX
\subsection{undisch\_rule}
=SML
store_mt_results (mt_runf (op =#)) [("undisch_rule",
	dest_thm o undisch_rule,
	asm_rule ⌜x ⇒ y⌝,
	([⌜x ⇒ y⌝,⌜x : BOOL⌝],⌜y : BOOL⌝))];

store_mt_results mt_run_fail [("undisch_rule 7011",
	undisch_rule,
	t_thm,
	gen_fail_msg "undisch_rule" 7011 ["⊢ T"])];
=TEX
\subsection{strip\_⇒\_rule}
=SML
store_mt_results (mt_runf (op =#)) [("strip_⇒_rule 1",
	dest_thm o strip_⇒_rule,
	asm_rule⌜T ⇒ F ⇒ T ⇒ F⌝,
	([⌜T ⇒ F ⇒ T ⇒ F⌝,mk_f,mk_t],mk_f)),
	("strip_⇒_rule 2",
	dest_thm o strip_⇒_rule,
	asm_rule⌜T ⇒ F ⇒ x⌝,
	([⌜T ⇒ F ⇒ x⌝,mk_t,mk_f],⌜x : BOOL⌝)),
	("strip_⇒_rule 3",
	dest_thm o strip_⇒_rule,
	t_thm,
	([],mk_t))];
=TEX
\subsection{all\_⇒\_intro}
=SML
store_mt_results (mt_runf (op =#)) [("all_⇒_intro 1",
	dest_thm o all_⇒_intro,
	∧_intro (asm_rule mk_t)(asm_rule mk_f),
	([],⌜T ⇒ F ⇒ (T ∧ F)⌝)),
	("all_⇒_intro 2",
	dest_thm o all_⇒_intro,
	t_thm,
	([],mk_t))];
=TEX
\subsection{⇒\_trans\_rule}
=SML
store_mt_results (mt_runf (op =#)) [("⇒_trans_rule 1",
	dest_thm o ⇒_trans_rule (asm_rule⌜x ⇒ y⌝),
	(asm_rule⌜y ⇒ z⌝),
	([⌜x ⇒ y⌝, ⌜y ⇒ z⌝],⌜x ⇒ z⌝)),
	("⇒_trans_rule 2",
	dest_thm o ⇒_trans_rule (asm_rule⌜x ⇒ (λ p ⦁ p)y⌝),
	(asm_rule⌜(λ q ⦁ q)y ⇒ z⌝),
	([⌜x ⇒ (λ p ⦁ p)y⌝, ⌜(λ q ⦁ q)y ⇒ z⌝],⌜x ⇒ z⌝))];

store_mt_results mt_run_fail [("⇒_trans_rule 7040 a",
	⇒_trans_rule t_thm,
	t_thm,
	gen_fail_msg "⇒_trans_rule" 7040 ["⊢ T"]),
	("⇒_trans_rule 7040 b",
	⇒_trans_rule (asm_rule⌜x ⇒ y⌝),
	t_thm,
	gen_fail_msg "⇒_trans_rule" 7040 ["⊢ T"]),
	("⇒_trans_rule 7042",
	⇒_trans_rule (asm_rule⌜x ⇒ y⌝),
	(asm_rule⌜x ⇒ z⌝),
	gen_fail_msg "⇒_trans_rule" 7042 ["x ⇒ y ⊢ x ⇒ y",
		"x ⇒ z ⊢ x ⇒ z"])];
=TEX
\subsection{modus\_tollens\_rule}
=SML
store_mt_results (mt_runf (op =#)) [("modus_tollens_rule",
	dest_thm o modus_tollens_rule (asm_rule ⌜x ⇒ y⌝),
	(asm_rule ⌜¬ y⌝),
	([⌜x ⇒ y⌝, ⌜¬ y⌝],⌜¬ x⌝))];

store_mt_results mt_run_fail [("modus_tollens_rule 7040",
	modus_tollens_rule t_thm,
	t_thm,
	gen_fail_msg "modus_tollens_rule" 7040 ["⊢ T"]),
	("modus_tollens_rule 7051",
	modus_tollens_rule  (asm_rule ⌜x ⇒ y⌝),
	f_thm,
	gen_fail_msg "modus_tollens_rule" 7051 ["x ⇒ y ⊢ x ⇒ y","⊢ ¬ F"])];
=TEX
\subsection{⇔\_intro}
=SML
store_mt_results (mt_runf (op =#)) [("⇔_intro",
	dest_thm o ⇔_intro (asm_rule⌜x ⇒ y⌝),
	(asm_rule⌜y ⇒ x⌝),
	([⌜x ⇒ y⌝, ⌜y ⇒ x⌝],⌜x ⇔ y⌝))];

store_mt_results mt_run_fail [("⇔_intro 7040 a",
	⇔_intro t_thm,
	f_thm,
	gen_fail_msg "⇔_intro" 7040 ["⊢ T"]),
	("⇔_intro 7040 b",
	⇔_intro (asm_rule⌜x ⇒ y⌝),
	t_thm,
	gen_fail_msg "⇔_intro" 7040 ["⊢ T"]),
	("⇔_intro 7064",
	⇔_intro (asm_rule⌜x ⇒ y⌝),
	(asm_rule⌜x ⇒ z⌝),
	gen_fail_msg "⇔_intro" 7064 ["x ⇒ y ⊢ x ⇒ y",
		"x ⇒ z ⊢ x ⇒ z"])];
=TEX
\subsection{⇔\_elim}
=SML
store_mt_results (mt_runf (op =**#)) [("⇔_elim",
	(dest_thm ** dest_thm) o ⇔_elim,
	asm_rule ⌜x ⇔ y⌝,
	(([⌜x ⇔ y⌝],⌜x ⇒ y⌝),([⌜x ⇔ y⌝],⌜y ⇒ x⌝)))];

store_mt_results mt_run_fail [("⇔_elim 7062",
	⇔_elim,
	t_thm,
	gen_fail_msg "⇔_elim" 7062 ["⊢ T"])];
=TEX
\subsection{simple\_⇔\_match\_mp\_rule}
=SML
let
val x1 = ⌜x : 'a⌝;
val x2 = ⌜x : 'b⌝;
val tm1 = list_mk_simple_∀([x1,x2],
	mk_⇔(
	list_mk_app(mk_var("f",mk_→_type(tva,
		mk_→_type(mk_vartype"'b",BOOL))),
		[x1,x2]),
	⌜b:BOOL⌝));
val tm2 = mk_⇔(
	list_mk_app(mk_var("f",mk_→_type(tva,
		mk_→_type(mk_vartype"'b",BOOL))),
		[x1,x2]),
	⌜b:BOOL⌝);
in
store_mt_results (mt_runf (op =#)) [("simple_⇔_match_mp_rule 1",
	dest_thm o simple_⇔_match_mp_rule
		(simple_∀_elim ⌜x : 'a⌝ (asm_rule ⌜∀ x y ⦁ f x y ⇔ b⌝)),
	asm_rule ⌜f 1 2 : BOOL⌝,
	([⌜∀ x y: ℕ ⦁ f x y ⇔ b⌝, ⌜f 1 2 : BOOL⌝],⌜b : BOOL⌝)),
	("simple_⇔_match_mp_rule 2",
	dest_thm o simple_⇔_match_mp_rule
		(simple_∀_elim ⌜x : 'a⌝ (asm_rule ⌜∀ x y ⦁ f x y ⇔ b ⇒ c⌝)),
	asm_rule ⌜f 1 2 : BOOL⌝,
	([⌜∀ x y: ℕ ⦁ f x y ⇔ b ⇒ c⌝, ⌜f 1 2 : BOOL⌝],⌜b ⇒ c⌝)),
	("simple_⇔_match_mp_rule 3",
	dest_thm o simple_⇔_match_mp_rule
		(asm_rule tm1),
	asm_rule ⌜f 1 2 : BOOL⌝,
	([⌜∀ x x' :ℕ ⦁ f x x' ⇔ b⌝, ⌜f 1 2 : BOOL⌝],⌜b : BOOL⌝)),
	("simple_⇔_match_mp_rule 4",
	dest_thm o simple_⇔_match_mp_rule
		(asm_rule tm2),
	asm_rule ⌜f 1 2 : BOOL⌝,
	([⌜f 1 2 ⇔ b⌝, ⌜f 1 2 : BOOL⌝],⌜b : BOOL⌝))
	]
end;
store_mt_results mt_run_fail [("simple_⇔_match_mp_rule 7044 a",
	simple_⇔_match_mp_rule t_thm,
	f_thm,
	gen_fail_msg "simple_⇔_match_mp_rule" 7044 ["⌜¬ F⌝","⊢ T"]),
	("simple_⇔_match_mp_rule 7044 b",
	simple_⇔_match_mp_rule (asm_rule⌜(1 = 1) ⇔ x⌝),
	t_thm,
	gen_fail_msg "simple_⇔_match_mp_rule" 7044 ["⌜T⌝","1 = 1 ⇔ x ⊢ 1 = 1 ⇔ x"])];
store_mt_results (mt_runf (op =#)) [("simple_⇔_match_mp_rule1",
	dest_thm o simple_⇔_match_mp_rule1 (simple_∀_intro⌜x : 'a⌝(refl_conv ⌜f x:BOOL⌝)),
	asm_rule ⌜f 1:BOOL⌝,
	([⌜f 1:BOOL⌝],⌜f 1:BOOL⌝))];
store_mt_results mt_run_fail [("simple_⇔_match_mp_rule1 7046 a",
	simple_⇔_match_mp_rule1,
	t_thm,
	gen_fail_msg "simple_⇔_match_mp_rule1" 7046 ["⊢ T"])];
store_mt_results mt_run_fail [("simple_⇔_match_mp_rule1 7044 b",
	simple_⇔_match_mp_rule1 (asm_rule⌜(1 = 1) ⇔ x⌝),
	(asm_rule ⌜(x:'a) =x⌝),
	gen_fail_msg "simple_⇔_match_mp_rule1" 7044
	["⌜x = x⌝","⌜1 = 1⌝"])];
=TEX
\subsection{subst\_conv}
=SML
store_mt_results mt_run_fail[
	("subst_conv 6001 1",
	subst_conv [] ⌜∃ p ⦁ q1⌝,
	⌜∃ p ⦁ q⌝,
	gen_fail_msg "subst_conv" 6001 ["⌜(∃ p⦁ q) ⇔ (∃ p⦁ q1)⌝","⌜(∃ p⦁ q) ⇔ (∃ p⦁ q)⌝"]),
	("subst_conv 6001 2",
	subst_conv [(t_eq_f, ⌜q:BOOL⌝)] ⌜T ⇔ q⌝,
	⌜T ⇔ F⌝,
	gen_fail_msg "subst_conv" 6001 ["⌜(T ⇔ F) ⇔ T ⇔ T⌝","⌜(T ⇔ F) ⇔ T ⇔ F⌝"]),
	("subst_conv 3012",
	subst_conv [(t_eq_f, ⌜q:BOOL⌝)] ⌜1⌝,
	⌜T ⇔ F⌝,
	gen_fail_msg "subst_conv" 3012 ["⌜T ⇔ F⌝","⌜1⌝"])];

store_mt_results mt_run_fail [("subst_conv 6002",
	subst_conv,
	[(t_thm, ⌜p:BOOL⌝)],
	gen_fail_msg "subst_conv" 6002 ["⊢ T"]),
	("subst_conv 3007",
	subst_conv,
	[(t_def, ⌜T⌝)],
	gen_fail_msg "subst_conv" 3007 ["⌜T⌝"]),
	("subst_conv 6029",
	subst_conv,
	[(t_def, ⌜q : ℕ⌝)],
	gen_fail_msg "subst_conv" 6029 ["⊢ T ⇔ (λ x⦁ x) = (λ x⦁ x)","⌜q⌝"])];

store_mt_results (mt_runf (op =#)) [("subst_conv_1",
	dest_thm o subst_conv [] ⌜∃ p ⦁ q⌝,
	⌜∃ p ⦁ q⌝,
	([],mk_eq(⌜∃ p ⦁ q⌝,⌜∃ p ⦁ q⌝))),
	("subst_conv_2",
	dest_thm o subst_conv [] ⌜∃ p1 ⦁ q⌝,
	⌜∃ p ⦁ q⌝,
	([],mk_eq(⌜∃ p ⦁ q⌝,⌜∃ p1 ⦁ q⌝))),
	("subst_conv_3",
	dest_thm o subst_conv [(t_eq_f, ⌜q : BOOL⌝)] ⌜q = F⌝,
	⌜T = F⌝,
	([⌜T = F⌝],mk_⇔(⌜(T = F)⌝,⌜(F = F)⌝))),
	("subst_conv_4",
	dest_thm o subst_conv [(t_def, ⌜q : BOOL⌝)] ⌜q = F⌝,
	⌜T = F⌝,
	([],mk_eq(⌜T = F⌝,⌜((λ x:BOOL⦁x)=(λ x ⦁x)) = F⌝)))];
=TEX
\subsection{eq\_sym\_conv}
=SML
store_mt_results (mt_runf (op =#)) [("eq_sym_conv a",
	dest_thm o eq_sym_conv,
	⌜x = y⌝,
	([],⌜(x = y) = (y = x)⌝)),
	("eq_sym_conv b",
	dest_thm o eq_sym_conv,
	⌜T ⇔ F⌝,
	([],⌜(T ⇔ F) = (F ⇔ T)⌝))];

store_mt_results mt_run_fail [("eq_sym_conv 3014",
	eq_sym_conv,
	mk_t,
	gen_fail_msg "eq_sym_conv" 3014 ["⌜T⌝"])];
=TEX
\subsection{¬\_eq\_sym\_rule}
=SML
store_mt_results (mt_runf (op =#)) [("¬_eq_sym_rule",
	dest_thm o ¬_eq_sym_rule,
	(asm_rule⌜¬((x:'a) = y)⌝),
	([⌜¬((x:'a) = y)⌝],⌜¬((y:'a) = x)⌝))];

store_mt_results mt_run_fail [("¬_eq_sym_rule 7091",
	¬_eq_sym_rule,
	t_thm,
	gen_fail_msg "¬_eq_sym_rule" 7091 ["⊢ T"])];
=TEX
\subsection{simple\_⇔\_match\_mp\_rule}
=SML
let
val x1 = ⌜x : 'a⌝;
val x2 = ⌜x : 'b⌝;
val tm1 = list_mk_simple_∀([x1,x2],
	mk_eq(
	list_mk_app(mk_var("f",mk_→_type(tva,
		mk_→_type(mk_vartype"'b",mk_vartype"'c"))),
		[x1,x2]),
	⌜b:'c⌝));
val tm2 = mk_eq(
	list_mk_app(mk_var("f",mk_→_type(tva,
		mk_→_type(mk_vartype"'b",mk_vartype"'c"))),
		[x1,x2]),
	⌜b:'c⌝);
in
store_mt_results (mt_runf (op =#)) [("simple_eq_match_conv 1",
	dest_thm o simple_eq_match_conv
		(simple_∀_elim ⌜x : 'a⌝ (asm_rule ⌜∀ x y ⦁ f x y = b⌝)),
	⌜f 1 2 : BOOL⌝,
	([⌜∀ x y: ℕ ⦁ f x y ⇔ b⌝],⌜f 1 2 ⇔ b⌝)),
	("simple_eq_match_conv 2",
	dest_thm o simple_eq_match_conv
		(asm_rule tm1),
	⌜f 1 2 : BOOL⌝,
	([⌜∀ x x' :ℕ ⦁ f x x' ⇔ b⌝],⌜f 1 2 ⇔ b⌝)),
	("simple_eq_match_conv 3",
	dest_thm o simple_eq_match_conv
		(asm_rule tm2),
	⌜f 1 2 : BOOL⌝,
	([⌜f 1 2 ⇔ b⌝],⌜f 1 2 ⇔ b⌝))
	]
end;
store_mt_results mt_run_fail [("simple_eq_match_conv 7044 a",
	simple_eq_match_conv t_thm,
	mk_f,
	gen_fail_msg "simple_eq_match_conv" 7044 ["⌜F⌝","⊢ T"]),
	("simple_eq_match_conv 7044 b",
	simple_eq_match_conv (asm_rule⌜(1 = 1) ⇔ x⌝),
	mk_t,
	gen_fail_msg "simple_eq_match_conv" 7044 ["⌜T⌝","1 = 1 ⇔ x ⊢ 1 = 1 ⇔ x"])];
=TEX
\subsection{simple\_eq\_match\_conv1}
=SML
store_mt_results (mt_runf (op =#)) [("simple_eq_match_conv1 1",
	dest_thm o simple_eq_match_conv1
		(simple_∀_elim ⌜x : ℕ⌝ (asm_rule ⌜∀ x y :ℕ ⦁ f x y ⇔ b⌝)),
	⌜f (x:ℕ) 2 : BOOL⌝,
	([⌜∀ x y :ℕ ⦁ f x y ⇔ b⌝],⌜(f (x:ℕ) 2) ⇔ b⌝)),
	("simple_eq_match_conv1 2",
	dest_thm o simple_eq_match_conv1
		(asm_rule ⌜∀ x y :ℕ ⦁ f x y ⇔ b⌝),
	⌜f (x:ℕ) 2 : BOOL⌝,
	([⌜∀ x y :ℕ ⦁ f x y ⇔ b⌝],⌜(f (x:ℕ) 2) ⇔ b⌝)),
	("simple_eq_match_conv1 3",
	dest_thm o simple_eq_match_conv1
		(simple_∀_elim ⌜x : ℕ⌝ (asm_rule ⌜∀ x y :ℕ ⦁ f x y ⇔ b⌝)),
	⌜f (x:ℕ) (y:ℕ) : BOOL⌝,
	([⌜∀ x y :ℕ ⦁ f x y ⇔ b⌝],⌜f (x:ℕ) (y:ℕ) ⇔ b⌝)),
	("simple_eq_match_conv1 4",
	dest_thm o simple_eq_match_conv1
		(asm_rule ⌜∀ x y :ℕ ⦁ f x y ⇔ b⌝),
	⌜f 1 2 : BOOL⌝,
	([⌜∀ x y :ℕ ⦁ f x y ⇔ b⌝],⌜(f 1 2) ⇔ b⌝)),
	("simple_eq_match_conv1 5",
	dest_thm o simple_eq_match_conv1
		(asm_rule ⌜∀ x y :ℕ ⦁ ((λ f ⦁f)f) x y ⇔ b⌝),
	⌜(λ g ⦁g)f 1 2 : BOOL⌝,
	([⌜∀ x y :ℕ ⦁ (λ f ⦁f)f x y ⇔ b⌝],⌜((λ g ⦁g)f 1 2) ⇔ b⌝)),
	("simple_eq_match_conv1 6",
	dest_thm o simple_eq_match_conv1
		(simple_∀_intro⌜f : BOOL → 'a⌝
		 (app_fun_rule ⌜f : BOOL → 'a⌝
		 (asm_rule ⌜(x:BOOL) = y⌝))),
	⌜p (x:BOOL) : ℕ⌝,
	([⌜(x:BOOL) = y⌝],⌜(p (x:BOOL):ℕ) = p y⌝))];

store_mt_results mt_run_fail [("simple_eq_match_conv1 7095",
	simple_eq_match_conv1,
	t_thm,
	gen_fail_msg "simple_eq_match_conv1" 7095 ["⊢ T"])];

store_mt_results mt_run_fail [("simple_eq_match_conv1 7076 a",
	simple_eq_match_conv1
		(simple_∀_elim ⌜x : 'a⌝ (asm_rule ⌜∀ x y ⦁ f x y ⇔ b⌝)),
	⌜f 1 2 : BOOL⌝,
	gen_fail_msg "simple_eq_match_conv1" 7076 ["⌜f 1 2⌝",
		"∀ x y⦁ f x y ⇔ b ⊢ ∀ y⦁ f x y ⇔ b"]),
	("simple_eq_match_conv1 7076 b",
	simple_eq_match_conv1
		(simple_∀_elim ⌜x : ℕ⌝ (asm_rule ⌜∀ x y: ℕ ⦁ f x y ⇔ b⌝)),
	⌜f 1 2 : BOOL⌝,
	gen_fail_msg "simple_eq_match_conv1" 7076 ["⌜f 1 2⌝",
		"∀ x y⦁ f x y ⇔ b ⊢ ∀ y⦁ f x y ⇔ b"])];
=TEX
\subsection{simple\_β\_η\_norm\_conv}
=SML
store_mt_results
mt_run [("simple_β_η_norm_conv 1",
	dest_thm o simple_β_η_norm_conv, ⌜λx⦁(f : 'a → 'b) x⌝,
		([], ⌜(λx⦁(f : 'a → 'b) x) = f⌝)),
("simple_β_η_norm_conv 2",
	dest_thm o simple_β_η_norm_conv, ⌜λx⦁(f : 'a → 'b) ((λy⦁x) 99)⌝,
		([], ⌜(λx⦁(f : 'a → 'b) ((λy⦁x) 99)) = f⌝)),
("simple_β_η_norm_conv 3",
	dest_thm o simple_β_η_norm_conv, ⌜λx⦁(f : 'a → 'b) ((λy⦁y) x)⌝,
		([], ⌜(λx⦁(f : 'a → 'b) ((λy⦁y) x)) = f⌝))];

store_mt_results
mt_run_fail [("simple_β_η_norm_conv 7130",
	simple_β_η_norm_conv, ⌜f 1 2 : BOOL⌝,
	gen_fail_msg "simple_β_η_norm_conv" 7130 ["⌜f 1 2⌝"])];
=TEX
\subsection{simple\_ho\_eq\_match\_conv}
=SML
store_mt_results
mt_run [("simple_ho_eq_match_conv 1",
	dest_thm o simple_ho_eq_match_conv
			(asm_rule ⌜∀P⦁ (∀x⦁P x) ⇔ P T ∧ P F⌝),
			⌜∀y⦁y ⇔ T⌝,
		([⌜∀ P⦁ (∀ x⦁ P x) ⇔ P T ∧ P F⌝],
				⌜ (∀ y⦁ y ⇔ T) ⇔ (T ⇔ T) ∧ (F ⇔ T)⌝)),
("simple_ho_eq_match_conv 2",
	dest_thm o simple_ho_eq_match_conv
			(asm_rule ⌜(∀x⦁P x) ⇔ P T ∧ P F⌝),
			⌜∀y⦁y ⇔ T⌝,
		([⌜(∀ x⦁ (λ y⦁ y ⇔ T) x) ⇔ (λ y⦁ y ⇔ T) T ∧ (λ y⦁ y ⇔ T) F⌝],
				⌜ (∀ y⦁ y ⇔ T) ⇔ (T ⇔ T) ∧ (F ⇔ T)⌝)),
("simple_ho_eq_match_conv 3",
	dest_thm o simple_ho_eq_match_conv
			(asm_rule ⌜∀P; Q : 'a → 'b → BOOL; x⦁(P x) ⇔ ∃y⦁Q x y⌝),
			⌜1 = 2⌝,
		([⌜∀ P; Q : 'a → 'b → BOOL; x⦁ P x ⇔ (∃ y⦁ Q x y)⌝],
				⌜1 = 2 ⇔ $∃ ((Q : 'a → 'b → BOOL) x)⌝))];

store_mt_results
mt_run_fail [("simple_ho_eq_match_conv 7095",
	simple_ho_eq_match_conv,
	t_thm,
	gen_fail_msg "simple_ho_eq_match_conv" 7095 ["⊢ T"])];

store_mt_results
mt_run_fail [("simple_ho_eq_match_conv 7076",
	simple_ho_eq_match_conv (asm_rule⌜(1 = 1) ⇔ x⌝),
	mk_t,
	gen_fail_msg "simple_ho_eq_match_conv" 7076 ["⌜T⌝","1 = 1 ⇔ x ⊢ 1 = 1 ⇔ x"])];
=TEX
\subsection{simple\_ho\_eq\_match\_conv1}
=SML
store_mt_results
mt_run [("simple_ho_eq_match_conv1 1",
	dest_thm o simple_ho_eq_match_conv1
			(asm_rule ⌜∀P⦁ (∀x⦁P x) ⇔ P T ∧ P F⌝),
			⌜∀y⦁y ⇔ T⌝,
		([⌜∀ P⦁ (∀ x⦁ P x) ⇔ P T ∧ P F⌝],
				⌜ (∀ y⦁ y ⇔ T) ⇔ (T ⇔ T) ∧ (F ⇔ T)⌝)),
("simple_ho_eq_match_conv1 2",
	dest_thm o simple_ho_eq_match_conv1
			(asm_rule ⌜∀P; Q : 'a → 'b → BOOL; x⦁(P x) ⇔ ∃y⦁Q x y⌝),
			⌜1 = 2⌝,
		([⌜∀ P; Q : 'a → 'b → BOOL; x⦁ P x ⇔ (∃ y⦁ Q x y)⌝],
				⌜1 = 2 ⇔ $∃ ((Q : 'a → 'b → BOOL) x)⌝))];

store_mt_results
mt_run_fail [("simple_ho_eq_match_conv1 7095",
	simple_ho_eq_match_conv1,
	t_thm,
	gen_fail_msg "simple_ho_eq_match_conv1" 7095 ["⊢ T"])];

store_mt_results
mt_run_fail [("simple_ho_eq_match_conv1 7076",
	simple_ho_eq_match_conv1 (asm_rule ⌜(∀ x⦁ P x) ⇔ P T ∧ P F⌝),
	⌜∀y⦁y ⇔ T⌝,
	gen_fail_msg "simple_ho_eq_match_conv1" 7076 ["⌜∀ y⦁ y ⇔ T⌝","(∀ x⦁ P x) ⇔ P T ∧ P F ⊢ (∀ x⦁ P x) ⇔ P T ∧ P F"])];


=TEX
\subsection{if\_intro}
=SML
store_mt_results (mt_runf (op =#)) [("if_intro 1",
	dest_thm o if_intro ⌜a : BOOL⌝ (asm_rule ⌜x  = p1⌝),
	(asm_rule ⌜x = p2⌝),
	([⌜x  = p1⌝,⌜x = p2⌝],⌜(if a then (x = p1) else (x = p2))⌝)),
	("if_intro 2",
	dest_thm o if_intro ⌜b : BOOL⌝ (undisch_rule(asm_rule ⌜b ⇒ p1⌝)),
	(undisch_rule (asm_rule ⌜¬ b ⇒ p2⌝)),
	([⌜b ⇒ p1⌝,⌜¬ b ⇒ p2⌝],⌜(if b then (p1:BOOL) else p2)⌝))];

store_mt_results mt_run_fail [("if_intro 3031",
	if_intro N1 t_thm,
	t_thm,
	gen_fail_msg "if_intro" 3031 ["⌜1⌝"])];

=TEX
\subsection{if\_then\_elim}
=SML
store_mt_results (mt_runf (op =#)) [("if_then_elim",
	dest_thm o if_then_elim,
	asm_rule ⌜if a then (tt : BOOL) else te⌝,
	([⌜if a then (tt : BOOL) else te⌝],⌜a ⇒ tt⌝))];

store_mt_results mt_run_fail [("if_then_elim 7012",
	if_then_elim,
	t_thm,
	gen_fail_msg "if_then_elim" 7012 ["⊢ T"])];
=TEX
\subsection{if\_else\_elim}
=SML
store_mt_results (mt_runf (op =#)) [("if_else_elim",
	dest_thm o if_else_elim,
	asm_rule ⌜if a then (tt : BOOL) else te⌝,
	([⌜if a then (tt : BOOL) else te⌝],⌜¬ a ⇒ te⌝))];

store_mt_results mt_run_fail [("if_else_elim 7012",
	if_else_elim,
	t_thm,
	gen_fail_msg "if_else_elim" 7012 ["⊢ T"])];
=TEX
\subsection{if\_app\_conv}
=SML
store_mt_results (mt_runf (op =#)) [("if_app_conv",
	dest_thm o if_app_conv,
	⌜(if T then (λ x ⦁ x = 1)3 else (λ y ⦁ y = 1)4)⌝,
	([],⌜(if T then (λ x ⦁ x = 1)3 else (λ y ⦁ y = 1)4) =
		((λ x ⦁ x = 1)(if T then 3 else 4))⌝))];

store_mt_results mt_run_fail [("if_app_conv 7037",
	if_app_conv,
	mk_t,
	gen_fail_msg "if_app_conv" 7037 ["⌜T⌝"]),
	("if_app_conv 7038",
	if_app_conv,
	⌜(if T then (λ x ⦁ x = 1)3 else (λ y ⦁ y = 2)4)⌝,
	gen_fail_msg "if_app_conv" 7038 [
		"⌜if T then (λ x⦁ x = 1) 3 else (λ y⦁ y = 2) 4⌝"])];
=TEX
\subsection{app\_if\_conv}
=SML
store_mt_results (mt_runf (op =#)) [("app_if_conv",
	dest_thm o app_if_conv,
	⌜f(if T then 3 else 4)⌝,
	([],⌜(f(if T then 3 else 4)) = if T then f 3 else f 4⌝))];

store_mt_results mt_run_fail [("app_if_conv 7098",
	app_if_conv,
	mk_t,
	gen_fail_msg "app_if_conv" 7098 ["⌜T⌝"])];
=TEX
\subsection{λ\_rule}
=SML
store_mt_results (mt_runf (op =#)) [("λ_rule",
	dest_thm o λ_rule ⌜1⌝,
	asm_rule⌜1 = 2⌝,
	([⌜1 = 2⌝],⌜(λ @_1 ⦁ @_1 = 2) 1⌝))];
=TEX
\subsection{all\_simple\_$\beta$\_conv}
=SML
store_mt_results (mt_runf (op =#)) [("all_simple_β_conv 1",
	dest_thm o all_simple_β_conv,
	⌜ (λ x ⦁ (plus x y)) 1:ℕ⌝,
	([],⌜(λ x ⦁ (plus x y)) 1 = (plus 1 y:ℕ)⌝)),
	("all_simple_β_conv 2",
	dest_thm o all_simple_β_conv,
	⌜ (λ x ⦁ (plus x x)) 1⌝,
	([],⌜(λ x ⦁ (plus x x)) 1 = plus 1 1⌝)),
	("all_simple_β_conv 3",
	dest_thm o all_simple_β_conv,
	sample,
	([],mk_eq(sample, ⌜(¬ T ∧ q) ∧ q⌝))),
	("all_simple_β_conv 4",
	dest_thm o all_simple_β_conv,
	⌜ (λ y x : BOOL ⦁ x  ∧ y)(plus(x :ℕ) 1 ) ⌝,
	([],mk_eq(⌜ (λ y x : BOOL ⦁ x  ∧ y)(plus(x :ℕ) 1 ) ⌝,
		⌜(λ x' ⦁ x' ∧ (plus (x:ℕ) 1))⌝)))];

store_mt_results mt_run_fail [("all_simple_β_conv 7020",
	all_simple_β_conv,
	⌜1⌝,
	gen_fail_msg "all_simple_β_conv" 7020 ["⌜1⌝"])];
=TEX
\subsection{all\_simple\_$\beta$\_conv}
=SML
store_mt_results (mt_runf (op =#)) [("all_simple_β_rule 1",
	dest_thm o all_simple_β_rule,
	asm_rule⌜ (λ x ⦁ (plus x y)) 1:BOOL⌝,
	([⌜ (λ x ⦁ (plus x y)) 1:BOOL⌝],⌜(plus 1 y:BOOL)⌝)),
	("all_simple_β_rule 2",
	dest_thm o all_simple_β_rule,
	asm_rule ⌜ (λ x ⦁ (plus x x)) 1:BOOL⌝,
	([ ⌜ (λ x ⦁ (plus x x)) 1:BOOL⌝],⌜plus 1 1 :BOOL⌝)),
	("all_simple_β_rule 3",
	dest_thm o all_simple_β_rule,
	asm_rule sample,
	([sample],⌜(¬ T ∧ q) ∧ q⌝)),
	("all_simple_β_rule 4",
	dest_thm o all_simple_β_rule,
	asm_rule ⌜ f = (λ y x : BOOL ⦁ x  ∧ y)(plus(x :ℕ) 1 ) ⌝,
	([⌜ f = (λ y x : BOOL ⦁ x  ∧ y)(plus(x :ℕ) 1 ) ⌝],
		⌜f = (λ x' ⦁ x' ∧ (plus (x:ℕ) 1))⌝))];

store_mt_results mt_run_fail [("all_simple_β_rule 7020",
	all_simple_β_rule,
	t_thm,
	gen_fail_msg "all_simple_β_rule" 7020 ["⊢ T"])];
=TEX
\subsection{list\_simple\_∀\_intro}
=SML
store_mt_results (mt_runf (op =#)) [("list_simple_∀_intro 1",
	dest_thm o list_simple_∀_intro [],
	t_thm,
	([],⌜T⌝)),
	("list_simple_∀_intro 2",
	dest_thm o list_simple_∀_intro [⌜x : BOOL⌝, ⌜y : BOOL⌝],
	∧_intro(refl_conv ⌜x : BOOL⌝)(refl_conv ⌜y : BOOL⌝),
	([],⌜∀ x y ⦁ (x ⇔ x) ∧ (y ⇔ y)⌝))];

store_mt_results mt_run_fail [("list_simple_∀_intro 3007",
	list_simple_∀_intro [mk_t],
	t_thm,
	gen_fail_msg "list_simple_∀_intro" 3007 ["⌜T⌝"]),
	("list_simple_∀_intro 6005",
	list_simple_∀_intro [⌜x : BOOL⌝],
	asm_rule ⌜x : BOOL⌝,
	gen_fail_msg "list_simple_∀_intro" 6005 ["⌜x⌝"])];
=TEX
\subsection{all\_∀\_intro}
=SML
store_mt_results (mt_runf (op =#)) [("all_∀_intro",
	dest_thm o all_∀_intro,
	∧_intro(∧_intro(refl_conv ⌜x:ℕ⌝)(asm_rule ⌜y:BOOL⌝))
		(refl_conv ⌜z:BOOL⌝),
	([⌜y:BOOL⌝],⌜∀ (x : ℕ) (z : BOOL) ⦁ ((x = x) ∧ y) ∧ (z ⇔ z)⌝))];
=TEX
\subsection{all\_simple\_∀\_elim}
=SML
store_mt_results (mt_runf (op =#)) [("all_simple_∀_elim",
	dest_thm o all_simple_∀_elim,
	undisch_rule(⇒_intro ⌜y : BOOL⌝
		(asm_rule ⌜∀ x y z: ℕ ⦁ plus x y z⌝)),
	([⌜∀ x y z: ℕ ⦁ plus x y z⌝, ⌜y : BOOL⌝],
		⌜plus (x:ℕ) (y':ℕ)(z:ℕ):BOOL⌝))];
=TEX
\subsection{¬\_simple\_∀\_conv}
=SML
store_mt_results (mt_runf (op =#)) [("¬_simple_∀_conv",
	dest_thm o ¬_simple_∀_conv,
	⌜¬ (∀ x :'a⦁ T)⌝,
	([],⌜(¬ (∀ x:'a ⦁ T)) ⇔ ∃ x:'a ⦁ ¬ T⌝))];

store_mt_results mt_run_fail [("¬_simple_∀_conv 7036",
	¬_simple_∀_conv,
	mk_t,
	gen_fail_msg "¬_simple_∀_conv" 7036 ["⌜T⌝"])];
=TEX
\subsection{simple\_∃\_intro}
=SML
store_mt_results (mt_runf (op =#)) [("simple_∃_intro",
	dest_thm o simple_∃_intro ⌜∃ p:BOOL ⦁ p ⇔ ((λ x:BOOL ⦁ x) = (λ x:BOOL ⦁ x))⌝,
	t_def,
	([],⌜∃ p:BOOL ⦁ p ⇔ ((λ x:BOOL ⦁ x) = (λ x:BOOL ⦁ x))⌝))];

store_mt_results mt_run_fail [("simple_∃_intro 3034",
	simple_∃_intro mk_t,
	t_thm,
	gen_fail_msg "simple_∃_intro" 3034 ["⌜T⌝"]),
	("simple_∃_intro 7047",
	simple_∃_intro ⌜∃ x ⦁ F⌝,
	t_thm,
	gen_fail_msg "simple_∃_intro" 7047 ["⌜∃ x⦁ F⌝","⊢ T"])];
=TEX
\subsection{simple\_∃\_elim}
=SML
store_mt_results (mt_runf (op =#)) [("simple_∃_elim a",
	dest_thm o simple_∃_elim ⌜x:BOOL⌝ (asm_rule ⌜∃ r ⦁ r ∨ F⌝),
	(undisch_rule(simple_∀_elim ⌜x:BOOL⌝ (asm_rule
		⌜∀ x : BOOL ⦁ x ∨ F ⇒ rubbish⌝))),
	([⌜∃ r ⦁ r ∨ F⌝,⌜∀ x : BOOL ⦁ x ∨ F ⇒ rubbish⌝],⌜rubbish : BOOL⌝)),
	("simple_∃_elim b",
	dest_thm o simple_∃_elim ⌜y:BOOL⌝ (asm_rule ⌜∃ r ⦁ r ∨ F⌝),
	(undisch_rule(simple_∀_elim ⌜x:BOOL⌝ (asm_rule
		⌜∀ x : BOOL ⦁ x ∨ T ⇒ rubbish⌝))),
	([⌜∃ r ⦁ r ∨ F⌝,⌜∀ x : BOOL ⦁ x ∨ T ⇒ rubbish⌝,⌜x ∨ T⌝],⌜rubbish : BOOL⌝))];

store_mt_results mt_run_fail [("simple_∃_elim 3007",
	simple_∃_elim ⌜x ∨ F⌝ (asm_rule ⌜∃ r ⦁ F ∨ r⌝),
	(undisch_rule(simple_∀_elim ⌜x:BOOL⌝ (asm_rule
		⌜∀ x : BOOL ⦁ x ∨ F ⇒ rubbish⌝))),
	gen_fail_msg "simple_∃_elim" 3007 ["⌜x ∨ F⌝"]),
	("simple_∃_elim 7014",
	simple_∃_elim ⌜x:BOOL→BOOL⌝ (asm_rule ⌜∃ r ⦁ r ∨ F⌝),
	(undisch_rule(simple_∀_elim ⌜x:BOOL⌝ (asm_rule
		⌜∀ x : BOOL ⦁ x ∨ F ⇒ rubbish⌝))),
	gen_fail_msg "simple_∃_elim" 7014 ["⌜x⌝"]),
	("simple_∃_elim 7109",
	simple_∃_elim ⌜x:BOOL⌝ (asm_rule ⌜∀ r ⦁ r ∨ F⌝),
	(undisch_rule(simple_∀_elim ⌜x:BOOL⌝ (asm_rule
		⌜∀ x : BOOL ⦁ x ∨ F ⇒ rubbish⌝))),
	gen_fail_msg "simple_∃_elim" 7109 ["∀ r⦁ r ∨ F ⊢ ∀ r⦁ r ∨ F"]),
	("simple_∃_elim 7120 a",
	simple_∃_elim ⌜x:BOOL⌝ (asm_rule ⌜∃ r ⦁ r ∨ x⌝),
	(undisch_rule(simple_∀_elim ⌜x:BOOL⌝ (asm_rule
		⌜∀ x : BOOL ⦁ x ∨ F ⇒ rubbish⌝))),
	gen_fail_msg "simple_∃_elim" 7120 ["⌜x⌝",
		"∃ r⦁ r ∨ x ⊢ ∃ r⦁ r ∨ x"]),
	("simple_∃_elim 7120 b",
	simple_∃_elim ⌜x:BOOL⌝ (asm_rule ⌜∃ r ⦁ r ∨ F⌝),
	(undisch_rule(simple_∀_elim ⌜x:BOOL⌝ (asm_rule
		⌜∀ x : BOOL ⦁ x ∨ F ⇒ rubbish x⌝))),
	gen_fail_msg "simple_∃_elim" 7120 ["⌜x⌝",
		"∀ x⦁ x ∨ F ⇒ rubbish x, x ∨ F ⊢ rubbish x"]),
	("simple_∃_elim 7121",
	simple_∃_elim ⌜x:BOOL⌝ (asm_rule ⌜∃ r ⦁ r ∨ F⌝),
	(asm_intro ⌜x:BOOL⌝(undisch_rule(simple_∀_elim ⌜x:BOOL⌝ (asm_rule
		⌜∀ x : BOOL ⦁ x ∨ F ⇒ rubbish⌝)))),
	gen_fail_msg "simple_∃_elim" 7121 ["⌜x⌝",
		"∀ x⦁ x ∨ F ⇒ rubbish, x ∨ F, x ⊢ rubbish",
		"⌜x ∨ F⌝"])
	];
=TEX
\subsection{¬\_simple\_∃\_conv}
=SML
store_mt_results (mt_runf (op =#)) [("¬_simple_∃_conv",
	dest_thm o ¬_simple_∃_conv,
	⌜¬ (∃ x :'a⦁ T)⌝,
	([],⌜(¬ (∃ x:'a ⦁ T)) ⇔ ∀ x:'a ⦁ ¬ T⌝))];

store_mt_results mt_run_fail [("¬_simple_∃_conv 7058",
	¬_simple_∃_conv,
	mk_t,
	gen_fail_msg "¬_simple_∃_conv" 7058 ["⌜T⌝"])];
=TEX
\subsection{simple\_∃$_1$\_intro}
=SML
store_mt_results (mt_runf (op =#)) [("simple_∃⋎1_intro 1",
	dest_thm o simple_∃⋎1_intro (α_conv ⌜(λ x : ℕ ⦁ x)⌝ ⌜(λ y : ℕ ⦁ y)⌝),
	asm_rule ⌜∀ tt ⦁ (tt = (λ y : ℕ ⦁ y)) ⇒ (tt = (λ z : ℕ ⦁ z))⌝,
	([⌜∀ tt ⦁ (tt = (λ y : ℕ ⦁ y)) ⇒ (tt = (λ z : ℕ ⦁ z))⌝],
		⌜∃⋎1 tt ⦁ tt = (λ y:ℕ ⦁ y)⌝)),
	("simple_∃⋎1_intro 2",
	dest_thm o simple_∃⋎1_intro (asm_rule ⌜q 3 (y:'a) :BOOL⌝),
	asm_rule ⌜∀ tt : ℕ ⦁ q tt (y : 'a) ⇒ tt = 3⌝,
	([⌜q 3 (y:'a) :BOOL⌝,⌜∀ tt : ℕ ⦁ q tt (y : 'a) ⇒ tt = 3⌝],⌜∃⋎1 tt : ℕ ⦁ q tt (y:'a)⌝))];

store_mt_results mt_run_fail [("simple_∃⋎1_intro 7067",
	simple_∃⋎1_intro t_thm,
	asm_rule ⌜∀ tt : ℕ ⦁ q tt (y : 'a) ⇒ tt = 3⌝,
	gen_fail_msg "simple_∃⋎1_intro" 7067 ["⊢ T",
		"∀ tt⦁ q tt y ⇒ tt = 3 ⊢ ∀ tt⦁ q tt y ⇒ tt = 3"]),
	("simple_∃⋎1_intro 7066",
	simple_∃⋎1_intro f_thm,
	t_thm,
	gen_fail_msg "simple_∃⋎1_intro" 7066 ["⊢ T"])];
=TEX
\subsection{simple\_∃$_1$1\_elim}
=SML
store_mt_results (mt_runf (op =#)) [("simple_∃⋎1_elim",
	dest_thm o simple_∃⋎1_elim,
	asm_rule ⌜∃⋎1 tt ⦁ tt = (λ y:ℕ ⦁ y)⌝,
	([ ⌜∃⋎1 tt ⦁ tt = (λ y:ℕ ⦁ y)⌝],
		⌜∃ tt ⦁ tt = (λ y :ℕ⦁ y) ∧ (∀ x ⦁ x = (λ y ⦁ y) ⇒ x = tt)⌝))];

store_mt_results mt_run_fail [("simple_∃⋎1_elim 7015",
	simple_∃⋎1_elim,
	t_thm,
	gen_fail_msg "simple_∃⋎1_elim" 7015 ["⊢ T"])];
=TEX
\subsection{ε\_intro\_rule}
=SML
store_mt_results (mt_runf (op =#)) [("ε_intro_rule",
	dest_thm o ε_intro_rule,
	f_thm,
	([],⌜¬($ε $¬)⌝))];

store_mt_results mt_run_fail [("ε_intro_rule 7016",
	ε_intro_rule,
	t_thm,
	gen_fail_msg "ε_intro_rule" 7016 ["⊢ T"])];
=TEX
\subsection{simple\-\_ε\-\_elim\-\_rule}
=SML
store_mt_results (mt_runf (op =#)) [("simple_ε_elim_rule",
	dest_thm o simple_ε_elim_rule ⌜x : BOOL → BOOL⌝
	(asm_rule ⌜(λ f ⦁ f T)(ε f ⦁ f T)⌝),
	(undisch_rule(simple_∀_elim ⌜x:BOOL → BOOL⌝ (asm_rule
		⌜∀ x : BOOL → BOOL ⦁  (λ f ⦁ f T) x ⇒ rubbish⌝))),
	([⌜∀ x : BOOL → BOOL ⦁  (λ f ⦁ f T) x ⇒ rubbish⌝,⌜(λ f ⦁ f T)(ε f ⦁ f T)⌝],
		⌜rubbish : BOOL⌝))];

store_mt_results mt_run_fail [("simple_ε_elim_rule 3007",
	simple_ε_elim_rule ⌜f x : BOOL → BOOL⌝ (asm_rule ⌜(λ f ⦁ f T)(ε f ⦁ f T)⌝),
	(undisch_rule(simple_∀_elim ⌜x:BOOL → BOOL⌝ (asm_rule
		⌜∀ x : BOOL → BOOL ⦁  (λ f ⦁ f T) x ⇒ rubbish⌝))),
	gen_fail_msg "simple_ε_elim_rule" 3007 ["⌜f x⌝"]),
	("simple_ε_elim_rule 7019",
	simple_ε_elim_rule ⌜x : BOOL → BOOL⌝ t_thm,
	(undisch_rule(simple_∀_elim ⌜x:BOOL → BOOL⌝ (asm_rule
		⌜∀ x : BOOL → BOOL ⦁  (λ f ⦁ f T) x ⇒ rubbish⌝))),
	gen_fail_msg "simple_ε_elim_rule" 7019 ["⊢ T"]),
	("simple_ε_elim_rule 7054",
	simple_ε_elim_rule ⌜x : BOOL⌝ (asm_rule ⌜(λ f ⦁ f T)(ε f ⦁ f T)⌝),
	(undisch_rule(simple_∀_elim ⌜x:BOOL → BOOL⌝ (asm_rule
		⌜∀ x : BOOL → BOOL ⦁  (λ f ⦁ f T) x ⇒ rubbish⌝))),
	gen_fail_msg "simple_ε_elim_rule" 7054 ["⌜x⌝"]),
	("simple_ε_elim_rule 7108",
	simple_ε_elim_rule ⌜y : BOOL → BOOL⌝ (asm_rule ⌜(λ f ⦁ f T)(ε f ⦁ f T)⌝),
	(undisch_rule(simple_∀_elim ⌜x:BOOL → BOOL⌝ (asm_rule
		⌜∀ x : BOOL → BOOL ⦁  (λ f ⦁ f T) x ⇒ rubbish⌝))),
	gen_fail_msg "simple_ε_elim_rule" 7108 ["y"]),
	("simple_ε_elim_rule 7120",
	simple_ε_elim_rule ⌜x : BOOL → BOOL⌝ (asm_rule ⌜(λ f ⦁ f T)(ε f ⦁ f T)⌝),
	(undisch_rule(all_simple_∀_elim(asm_rule
		⌜∀ x ⦁ (λ f ⦁ f T) x ⇒ rubbish x⌝))),
	gen_fail_msg "simple_ε_elim_rule" 7120 ["⌜x⌝",
		"∀ x⦁ (λ f⦁ f T) x ⇒ rubbish x, (λ f⦁ f T) x ⊢ rubbish x"]),
	("simple_ε_elim_rule 7121",
	simple_ε_elim_rule ⌜x : BOOL → BOOL⌝ (asm_rule ⌜(λ f ⦁ f T)(ε f ⦁ f T)⌝),
	(undisch_rule(asm_rule
		⌜(λ f ⦁ f T) x ⇒ rubbish⌝)),
	gen_fail_msg "simple_ε_elim_rule" 7121 ["⌜x⌝",
		"(λ f⦁ f T) x ⇒ rubbish, (λ f⦁ f T) x ⊢ rubbish",
		"⌜(λ f⦁ f T) x⌝"]),
	("simple_ε_elim_rule 7122",
	simple_ε_elim_rule ⌜x : BOOL → BOOL⌝ (asm_rule ⌜(λ f ⦁ x T:BOOL)(ε f ⦁ f T)⌝),
	(undisch_rule(all_simple_∀_elim(asm_rule
		⌜∀ x ⦁ (λ f ⦁ f T) x ⇒ rubbish⌝))),
	gen_fail_msg "simple_ε_elim_rule" 7122 ["⌜x⌝",
		"(λ f⦁ x T) (ε f⦁ f T) ⊢ (λ f⦁ x T) (ε f⦁ f T)"])
	];
=TEX
\subsection{simple\_∃\_ε\_rule}
=SML
store_mt_results (mt_runf (op =#)) [("simple_∃_ε_rule",
	dest_thm o simple_∃_ε_rule,
	asm_rule ⌜∃ x ⦁ f x y⌝,
	([⌜∃ x ⦁ f x y⌝],⌜f(ε x ⦁ f x y) y⌝))];

store_mt_results mt_run_fail [("simple_∃_ε_rule 7092",
	simple_∃_ε_rule,
	t_thm,
	gen_fail_msg "simple_∃_ε_rule" 7092 ["⊢ T"])];
=TEX
\subsection{simple\_∃\_ε\_conv}
=SML
store_mt_results (mt_runf (op =#)) [("simple_∃_ε_conv",
	dest_thm o simple_∃_ε_conv,
	⌜∃ x ⦁ f x y⌝,
	([],mk_eq(⌜∃ x ⦁ f x y⌝,⌜f(ε x ⦁ f x y) y⌝)))];

store_mt_results mt_run_fail [("simple_∃_ε_conv 3034",
	simple_∃_ε_conv,
	mk_t,
	gen_fail_msg "simple_∃_ε_conv" 3034 ["⌜T⌝"])];
=TEX
\subsection{ext\_rule}
=SML
store_mt_results (mt_runf (op =#)) [("ext_rule",
	dest_thm o ext_rule,
	asm_rule ⌜(f : 'a → 'b) = g⌝,
	([⌜(f : 'a → 'b) = g⌝],⌜∀ @_1 : 'a ⦁ (f @_1 : 'b) = g @_1⌝))];

store_mt_results mt_run_fail [("ext_rule 6020",
	ext_rule,
	t_thm,
	gen_fail_msg "ext_rule" 6020 ["⊢ T"]),
	("ext_rule 7026",
	ext_rule,
	refl_conv mk_t,
	gen_fail_msg "ext_rule" 7026["⊢ T ⇔ T"])];
=TEX
\subsection{asm\_intro}
=SML
store_mt_results (mt_runf (op =#)) [("asm_intro 1",
	dest_thm o asm_intro mk_t,
	t_thm,
	([mk_t],⌜T⌝)),
	("asm_intro 2",
	dest_thm o asm_intro mk_t,
	(asm_rule mk_t),
	([mk_t],⌜T⌝))];

store_mt_results mt_run_fail [("asm_intro 3031",
	asm_intro ⌜0⌝,
	t_thm,
	gen_fail_msg "asm_intro" 3031 ["⌜0⌝"])];
=TEX
\subsection{asm\_elim}
=SML
store_mt_results (mt_runf (op =#)) [("asm_elim",
	dest_thm o asm_elim⌜a : BOOL⌝(undisch_rule (asm_rule ⌜a ⇒ b⌝)),
	(undisch_rule (asm_rule ⌜¬a ⇒ b⌝)),
	([⌜a ⇒ b⌝,⌜¬a ⇒ b⌝],⌜b:BOOL⌝))];

store_mt_results mt_run_fail [("asm_elim 3031",
	asm_elim ⌜0⌝ t_thm,
	t_thm,
	gen_fail_msg "asm_elim" 3031 ["⌜0⌝"]),
	("asm_elim 7029",
	asm_elim ⌜a:BOOL⌝ t_thm,
	f_thm,
	gen_fail_msg "asm_elim" 7029 ["⊢ T", "⊢ ¬ F"])];
=TEX
\subsection{prove\_asm\_rule}
=SML
store_mt_results (mt_runf (op =#)) [("prove_asm_rule",
	dest_thm o prove_asm_rule t_thm,
	asm_rule mk_t,
	([],⌜T⌝))];
=TEX
\subsection{asm\_inst\_term\_rule}
=SML
store_mt_results (mt_runf (op =#)) [
	("asm_inst_term_rule_1",
	dest_thm o asm_inst_term_rule [(T,v1),(F,v2)],
	simple_∀_elim v2
		(simple_∀_elim v1 (
		(asm_rule ⌜∀ v1 v2 : BOOL ⦁ v1 = v2⌝))),
	([⌜∀ v1 v2 : BOOL ⦁ v1 = v2⌝],⌜T = F⌝)),
	("asm_inst_term_rule_2",
	dest_thm o asm_inst_term_rule [(v2,v1),(v1,v2)],
	simple_∀_elim v2
		(simple_∀_elim v1 (
		(asm_rule ⌜∀ v1 v2 : BOOL ⦁ v1 = v2⌝))),
	([⌜∀ v1 v2 : BOOL ⦁ v1 = v2⌝],⌜(v2:BOOL) = v1⌝)),
	("asm_inst_term_rule_3",
	dest_thm o asm_inst_term_rule [],
	simple_∀_elim v2
		(simple_∀_elim v1 (
		(asm_rule ⌜∀ v1 v2 : BOOL ⦁ v1 = v2⌝))),
	([⌜∀ v1 v2 : BOOL ⦁ v1 = v2⌝],⌜(v1:BOOL) = v2⌝)),
	("asm_inst_term_rule_4",
	dest_thm o asm_inst_term_rule [(v2,v1)],
	(asm_rule v1),
	([v2],v2))
	];

store_mt_results mt_run_fail[
	("asm_inst_term_rule 3007",
	asm_inst_term_rule [(v2,T)],
	(asm_rule v1),
	gen_fail_msg "asm_inst_term_rule" 3007 ["⌜T⌝"]),
	("asm_inst_term_rule 6027",
	asm_inst_term_rule [(N0,v1)],
	(asm_rule v1),
	gen_fail_msg "asm_inst_term_rule" 6027 ["⌜0⌝","⌜v1⌝"])];
=TEX
\subsection{asm\_inst\_type\_rule}
=SML
store_mt_results (mt_runf (op =#)) [("asm_inst_type_rule 1",
	dest_thm o asm_inst_type_rule [(BOOL, tva)],
	pq_ax,
	([],⌜∃ p : BOOL ⦁ q⌝)),
	("asm_inst_type_rule 2",
	dest_thm o asm_inst_type_rule [(BOOL, tv1)],
	pq_ax,
	([],⌜∃ p : 'a ⦁ q⌝)),
	("asm_inst_type_rule 3",
	dest_thm o asm_inst_type_rule [(BOOL, tva)],
	(asm_rule ⌜v = v⌝),
	([⌜(v:BOOL) = v⌝],⌜(v:BOOL) = v⌝))];

store_mt_results mt_run_fail [("asm_inst_type_rule 3019",
	asm_inst_type_rule [(BOOL, BOOL)],
	pq_ax,
	gen_fail_msg "asm_inst_type_rule" 3019 ["ⓣBOOL⌝"])
];
=TEX
\subsection{$\alpha$\_conv}
=SML
store_mt_results (mt_runf (op =#)) [("α_conv 1",
	dest_thm o α_conv ⌜plus 1 2⌝,
	⌜plus 1 2⌝,
	([],⌜(plus 1 2) = plus 1 2⌝)),
	("α_conv 2",
	dest_thm o α_conv ⌜(λ x ⦁ f x)⌝,
	⌜(λ y ⦁ f y)⌝,
	([],⌜(λ y ⦁ f y) = λ x ⦁ f x⌝))];

store_mt_results mt_run_fail [("α_conv 3012",
	α_conv ⌜1⌝,
	mk_t,
	gen_fail_msg "α_conv" 3012 ["⌜T⌝","⌜1⌝"]),
	("α_conv 7034",
	α_conv mk_f,
	mk_t,
	gen_fail_msg "α_conv" 7034 ["⌜F⌝","⌜T⌝"])];
=TEX
\subsection{simple\_$\alpha$\_conv}
=SML
store_mt_results (mt_runf (op =#)) [("simple_α_conv a",
	dest_thm o simple_α_conv "new",
	⌜λ x ⦁x⌝,
	([],⌜(λ x :'a⦁x) = (λ new :'a ⦁ new)⌝)),
	("simple_α_conv b",
	dest_thm o simple_α_conv "new",
	⌜λ x new : 'a⦁ x⌝,
	([],⌜(λ x new :'a⦁x) = (λ new new' :'a ⦁ new)⌝))];

store_mt_results mt_run_fail [("simple_α_conv 3011",
	simple_α_conv "new",
	mk_t,
	gen_fail_msg "simple_α_conv" 3011 ["⌜T⌝"]),
	("simple_α_conv 7035",
	simple_α_conv "new",
	⌜λ x : 'a⦁ x = new⌝,
	gen_fail_msg "simple_α_conv" 7035 ["⌜x⌝","new"])];
=TEX
\section{CONVERSIONS AND CONVERSIONALS}
\subsection{id\_conv}
=SML
store_mt_results (mt_runf (op =#)) [("id_conv a",
	dest_thm o id_conv,
	⌜3⌝,
	([],⌜3 = 3⌝))];
=TEX
\subsection{fail\_conv}
=SML
store_mt_results mt_run_fail [("fail_conv",
	fail_conv,
	T,
	gen_fail_msg "fail_conv" 7061 [])];

=TEX
\subsection{fail\_with\_conv}
=SML
store_mt_results mt_run_fail [("fail_with_conv",
	fail_with_conv "testing",
	T,
	gen_fail_msg "fail_with_conv" 7075 ["testing"])];
=TEX
\subsection{THEN\_C}
=SML
store_mt_results (mt_runf (op =#)) [("THEN_C",
	dest_thm o suc_conv THEN_C (RAND_C suc_conv),
	⌜3⌝,
	([],⌜3 = Suc(Suc 1)⌝))];

store_mt_results mt_run_fail [("THEN_C 7101",
	(fn x => pq_ax) THEN_C suc_conv,
	⌜3⌝,
	gen_fail_msg "THEN_C" 7101 ["⊢ ∃ p⦁ q"]),
	("THEN_C 7102",
	suc_conv THEN_C (fn x => pq_ax),
	⌜3⌝,
	gen_fail_msg "THEN_C" 7102 ["⊢ ∃ p⦁ q", "⊢ 3 = Suc 2"]),
	("THEN_C 1st fails",
	(fail_with_conv "testing THEN_C") THEN_C suc_conv,
	⌜3⌝,
	gen_fail_msg "fail_with_conv" 7075 ["testing THEN_C"]),
	("THEN_C 2nd fails",
	suc_conv THEN_C (fail_with_conv "testing THEN_C"),
	⌜3⌝,
	gen_fail_msg "fail_with_conv" 7075 ["testing THEN_C"])];

=TEX
\subsection{APP\_C}
=SML
store_mt_results (mt_runf (op =#)) [("APP_C 1",
	dest_thm o APP_C (simple_β_conv, suc_conv),
	⌜(λ f ⦁ f) p 2⌝,
	([],⌜((λ f ⦁ f) p 2) = p (Suc 1)⌝))];

store_mt_results mt_run_fail [("APP_C f1",
	APP_C (simple_β_conv, suc_conv),
	⌜p 2⌝,
	gen_fail_msg "simple_β_conv" 6012 ["⌜p⌝"]),
	("APP_C f2",
	APP_C (simple_β_conv, suc_conv),
	⌜(λ f ⦁ f) p 0⌝,
	gen_fail_msg "suc_conv" 7100 ["⌜0⌝"]),
	("APP_C f3",
	APP_C (simple_β_conv, suc_conv),
	⌜p 0⌝,
	gen_fail_msg "simple_β_conv" 6012 ["⌜p⌝"]),
	("APP_C f4",
	APP_C (simple_β_conv, suc_conv),
	⌜0⌝,
	gen_fail_msg "APP_C" 3010 ["⌜0⌝"]),
	("APP_C 7110 a",
	APP_C ((fn x => t_thm), suc_conv),
	⌜p 1⌝,
	gen_fail_msg "APP_C" 7110 ["⊢ T","⊢ 1 = Suc 0"]),
	("APP_C 7110 b",
	APP_C (refl_conv, (fn x => t_thm)),
	⌜p 1⌝,
	gen_fail_msg "APP_C" 7110 ["⊢ p = p","⊢ T"])];


=TEX
\subsection{THEN\-\_TRY\-\_C}
=SML
store_mt_results (mt_runf (op =#)) [("THEN_TRY_C a",
	dest_thm o suc_conv THEN_TRY_C (RAND_C suc_conv),
	⌜3⌝,
	([],⌜3 = Suc(Suc 1)⌝)),
	("THEN_TRY_C b",
	dest_thm o suc_conv THEN_TRY_C (fail_with_conv "testing THEN_TRY_C"),
	⌜3⌝,
	([],⌜3 = Suc 2⌝)),
	("THEN_TRY_C c",
	dest_thm o suc_conv THEN_TRY_C (fn x => pq_ax),
	⌜3⌝,
	([],⌜3 = Suc 2⌝)),
	("THEN_TRY_C d",
	dest_thm o (fn x => pq_ax) THEN_TRY_C suc_conv,
	⌜3⌝,
	([],⌜∃ p : 'a ⦁ q⌝))];

store_mt_results mt_run_fail [("THEN_TRY_C 1st fails",
	(fail_with_conv "testing THEN_TRY_C") THEN_TRY_C suc_conv,
	⌜3⌝,
	gen_fail_msg "fail_with_conv" 7075 ["testing THEN_TRY_C"])];

=TEX
\subsection{ORELSE\_C}
=SML
store_mt_results (mt_runf (op =#)) [("ORELSE_C a",
	dest_thm o suc_conv ORELSE_C refl_conv,
	⌜3⌝,
	([],⌜3 = Suc 2⌝)),
	("ORELSE_C b",
	dest_thm o (fail_with_conv "testing ORELSE_C") ORELSE_C suc_conv,
	⌜3⌝,
	([],⌜3 = Suc 2⌝))];

store_mt_results mt_run_fail [("ORELSE_C both fail",
	(fail_with_conv "testing ORELSE_C a") ORELSE_C
		(fail_with_conv "testing ORELSE_C b"),
	⌜3⌝,
	gen_fail_msg "fail_with_conv" 7075 ["testing ORELSE_C b"])];

=TEX
\subsection{AND\-\_OR\-\_C}
=SML
store_mt_results (mt_runf (op =#)) [("AND_OR_C a",
	dest_thm o suc_conv AND_OR_C (RAND_C suc_conv),
	⌜3⌝,
	([],⌜3 = Suc(Suc 1)⌝)),
	("AND_OR_C b",
	dest_thm o suc_conv AND_OR_C (fail_with_conv "testing AND_OR_C"),
	⌜3⌝,
	([],⌜3 = Suc 2⌝)),
	("AND_OR_C c",
	dest_thm o suc_conv AND_OR_C (fn x => pq_ax),
	⌜3⌝,
	([],⌜3 = Suc 2⌝)),
	("AND_OR_C d",
	dest_thm o (fn x => pq_ax) AND_OR_C suc_conv,
	⌜3⌝,
	([],⌜∃ p : 'a ⦁ q⌝)),
	("AND_OR_C e",
	dest_thm o (fail_with_conv "testing AND_OR_C") AND_OR_C suc_conv,
	⌜3⌝,
	([],⌜3 = Suc 2⌝))];

store_mt_results mt_run_fail [("AND_OR_C both fail",
	(fail_with_conv "testing AND_OR_C a") AND_OR_C
		(fail_with_conv "testing AND_OR_C b"),
	⌜3⌝,
	gen_fail_msg "fail_with_conv" 7075 ["testing AND_OR_C b"])];

=TEX
\subsection{REPEAT\_C}
=SML
store_mt_results (mt_runf (op =#)) [("REPEAT_C a",
	dest_thm o REPEAT_C strip_∧_T_conv,
	⌜((a ∧ T) ∧ T) ∧ T⌝,
	([⌜(((a ∧ T) ∧ T) ∧ T) = ((a ∧ T) ∧ T)⌝,
		⌜((a ∧ T) ∧ T) = (a ∧ T)⌝,
		⌜(a ∧ T) = a⌝],
	⌜(((a ∧ T) ∧ T) ∧ T) = a⌝)),
	("REPEAT_C b",
	dest_thm o REPEAT_C strip_∧_T_conv,
	⌜a: BOOL⌝,
	([],⌜(a:BOOL) = a⌝))	];

=TEX
\subsection{REPEAT\_C1}
=SML
store_mt_results (mt_runf (op =#)) [("REPEAT_C1",
	dest_thm o REPEAT_C1 strip_∧_T_conv,
	⌜((a ∧ T) ∧ T) ∧ T⌝,
	([⌜(((a ∧ T) ∧ T) ∧ T) = ((a ∧ T) ∧ T)⌝,
		⌜((a ∧ T) ∧ T) = (a ∧ T)⌝,
		⌜(a ∧ T) = a⌝],
	⌜(((a ∧ T) ∧ T) ∧ T) = a⌝))];

store_mt_results mt_run_fail [("REPEAT_C1 7075",
	REPEAT_C1 strip_∧_T_conv,
	⌜a : BOOL⌝,
	gen_fail_msg "fail_with_conv" 7075 ["strip_∧_T_conv"])];

=TEX
\subsection{LIST\_THEN\_C}
=SML
store_mt_results (mt_runf (op =#)) [("EVERY_C a",
	dest_thm o EVERY_C [strip_∧_T_conv],
	⌜((a ∧ T) ∧ T) ∧ T⌝,
	([⌜(((a ∧ T) ∧ T) ∧ T) = ((a ∧ T) ∧ T)⌝],
	⌜(((a ∧ T) ∧ T) ∧ T) = ((a ∧ T) ∧ T)⌝)),
	("EVERY_C b",
	dest_thm o EVERY_C [strip_∧_T_conv, strip_∧_T_conv, strip_∧_T_conv],
	⌜((a ∧ T) ∧ T) ∧ T⌝,
	([⌜(((a ∧ T) ∧ T) ∧ T) = ((a ∧ T) ∧ T)⌝,
		⌜((a ∧ T) ∧ T) = (a ∧ T)⌝,
		⌜(a ∧ T) = a⌝],
	⌜(((a ∧ T) ∧ T) ∧ T) = a⌝))];

store_mt_results mt_run_fail [("EVERY_C too many",
	EVERY_C [strip_∧_T_conv, strip_∧_T_conv,
		strip_∧_T_conv, strip_∧_T_conv],
	⌜((a ∧ T) ∧ T) ∧ T⌝,
	gen_fail_msg "fail_with_conv" 7075 ["strip_∧_T_conv"]),
	("EVERY_C one fails",
	EVERY_C [strip_∧_T_conv, strip_∧_T_conv,
		fail_with_conv "testing EVERY_C", strip_∧_T_conv],
	⌜((a ∧ T) ∧ T) ∧ T⌝,
	gen_fail_msg "fail_with_conv" 7075 ["testing EVERY_C"])];

store_mt_results mt_run_fail[
	("EVERY_C 7103",
	EVERY_C,
	[],
	gen_fail_msg "EVERY_C" 7103 [])];
=TEX
\subsection{LIST\_ORELSE\_C}
=SML
store_mt_results (mt_runf (op =#)) [("FIRST_C a",
	dest_thm o FIRST_C [strip_∧_T_conv],
	⌜((a ∧ T) ∧ T) ∧ T⌝,
	([⌜(((a ∧ T) ∧ T) ∧ T) = ((a ∧ T) ∧ T)⌝],
	⌜(((a ∧ T) ∧ T) ∧ T) = ((a ∧ T) ∧ T)⌝)),
	("FIRST_C b",
	dest_thm o FIRST_C [strip_∧_T_conv, strip_∧_T_conv, strip_∧_T_conv],
	⌜((a ∧ T) ∧ T) ∧ T⌝,
	([⌜(((a ∧ T) ∧ T) ∧ T) = ((a ∧ T) ∧ T)⌝],
	⌜(((a ∧ T) ∧ T) ∧ T) = ((a ∧ T) ∧ T)⌝)),
	("FIRST_C c",
	dest_thm o FIRST_C [strip_∧_T_conv,
		fail_with_conv "testing FIRST_C"],
	⌜((a ∧ T) ∧ T) ∧ T⌝,
	([⌜(((a ∧ T) ∧ T) ∧ T) = ((a ∧ T) ∧ T)⌝],
	⌜(((a ∧ T) ∧ T) ∧ T) = ((a ∧ T) ∧ T)⌝))];

store_mt_results mt_run_fail[
	("FIRST_C 7103",
	FIRST_C,
	[],
	gen_fail_msg "FIRST_C" 7103 [])];
=TEX
\subsection{CHANGED\_C}
=SML
store_mt_results (mt_runf (op =#)) [("CHANGED_C",
	dest_thm o CHANGED_C suc_conv,
	⌜3⌝,
	([],⌜3 = Suc 2⌝))];

store_mt_results mt_run_fail [("CHANGED_C 7032",
	CHANGED_C refl_conv,
	⌜3⌝,
	gen_fail_msg "CHANGED_C" 7032 []),
	("CHANGED_C 7104",
	CHANGED_C (fn x => t_thm),
	⌜3⌝,
	gen_fail_msg "CHANGED_C" 7104 ["⊢ T"])];

=TEX
\subsection{TRY\_C}
=SML
store_mt_results (mt_runf (op =#)) [("TRY_C a",
	dest_thm o TRY_C suc_conv,
	⌜3⌝,
	([],⌜3 = Suc 2⌝)),
	("TRY_C b",
	dest_thm o TRY_C fail_conv,
	⌜3⌝,
	([],⌜3 = 3⌝))];

=TEX
\subsection{COND\_C}
=SML
store_mt_results (mt_runf (op =#)) [("COND_C a",
	dest_thm o COND_C (fn x=> type_of x =: ⓣℕ⌝)
		suc_conv id_conv,
	⌜3⌝,
	([],⌜3 = Suc 2⌝)),
	("COND_C b",
	dest_thm o COND_C (fn x=> type_of x =: ⓣℕ⌝)
		suc_conv id_conv,
	⌜T⌝,
	([],⌜T = T⌝))];

=TEX
\subsection{RAND\_C}
=SML
store_mt_results (mt_runf (op =#)) [("RAND_C",
	dest_thm o RAND_C suc_conv,
	⌜Suc 3⌝,
	([],⌜Suc 3 = Suc(Suc 2)⌝))];

store_mt_results mt_run_fail [("RAND_C conv fails",
	RAND_C (fail_with_conv "testing RAND_C"),
	⌜Suc 3⌝,
	gen_fail_msg "fail_with_conv" 7075 ["testing RAND_C"]),
	("RAND_C conv 3010",
	RAND_C suc_conv,
	⌜3⌝,
	gen_fail_msg "RAND_C" 3010 ["⌜3⌝"]),
	("RAND_C conv 7104",
	RAND_C (fn x => t_thm),
	⌜Suc 3⌝,
	gen_fail_msg "RAND_C" 7104 ["⊢ T"])];
=TEX
\subsection{RIGHT\_C}
=SML
store_mt_results (mt_runf (op =#)) [("RIGHT_C 1",
	dest_thm o RIGHT_C suc_conv,
	⌜1 + 3⌝,
	([],⌜(1 + 3) = 1 + (Suc 2)⌝)),
	("RIGHT_C 2",
	dest_thm o RIGHT_C suc_conv,
	⌜f 1 2 3⌝,
	([],⌜(f 1 2 3) = f 1 2 (Suc 2)⌝))];

store_mt_results mt_run_fail [("RIGHT_C conv fails",
	RIGHT_C (fail_with_conv "testing RIGHT_C"),
	⌜1 + 2⌝,
	gen_fail_msg "fail_with_conv" 7075 ["testing RIGHT_C"]),
	("RIGHT_C conv 3013 a",
	RIGHT_C suc_conv,
	⌜3⌝,
	gen_fail_msg "RIGHT_C" 3013 ["⌜3⌝"]),
	("RIGHT_C conv 3013 b",
	RIGHT_C suc_conv,
	⌜f 3⌝,
	gen_fail_msg "RIGHT_C" 3013 ["⌜f 3⌝"]),
	("RIGHT_C conv 7104",
	RIGHT_C (fn x => t_thm),
	⌜1 + 3⌝,
	gen_fail_msg "RIGHT_C" 7104 ["⊢ T"])];
=TEX
\subsection{RATOR\_C}
=SML
store_mt_results (mt_runf (op =#)) [("RATOR_C",
	dest_thm o RATOR_C simple_β_conv,
	⌜(λ x y : ℕ ⦁ plus x y) 3 4 : ℕ⌝,
	([],⌜(λ x y : ℕ ⦁ plus x y) 3 4  = ((λ y : ℕ ⦁ plus 3 y) 4 : ℕ)⌝))];

store_mt_results mt_run_fail [("RATOR_C conv fails",
	RATOR_C (fail_with_conv "testing RATOR_C"),
	⌜Suc 3⌝,
	gen_fail_msg "fail_with_conv" 7075 ["testing RATOR_C"]),
	("RATOR_C conv 3010",
	RATOR_C suc_conv,
	⌜3⌝,
	gen_fail_msg "RATOR_C" 3010 ["⌜3⌝"]),
	("RATOR_C conv 7104",
	RATOR_C (fn x => t_thm),
	⌜Suc 3⌝,
	gen_fail_msg "RATOR_C" 7104 ["⊢ T"])];
	
=TEX
\subsection{LEFT\_C}
=SML
store_mt_results (mt_runf (op =#)) [("LEFT_C 1",
	dest_thm o LEFT_C suc_conv,
	⌜1 + 3⌝,
	([],⌜(1 + 3) = (Suc 0) + 3⌝)),
	("LEFT_C 2",
	dest_thm o LEFT_C suc_conv,
	⌜f 1 2 3⌝,
	([],⌜(f 1 2 3) = f 1 (Suc 1) 3⌝))];

store_mt_results mt_run_fail [("LEFT_C conv fails",
	LEFT_C (fail_with_conv "testing LEFT_C"),
	⌜1 + 2⌝,
	gen_fail_msg "fail_with_conv" 7075 ["testing LEFT_C"]),
	("LEFT_C conv 3013 a",
	LEFT_C suc_conv,
	⌜3⌝,
	gen_fail_msg "LEFT_C" 3013 ["⌜3⌝"]),
	("LEFT_C conv 3013 b",
	LEFT_C suc_conv,
	⌜f 3⌝,
	gen_fail_msg "LEFT_C" 3013 ["⌜f 3⌝"]),
	("LEFT_C conv 7104",
	LEFT_C (fn x => t_thm),
	⌜1 + 3⌝,
	gen_fail_msg "LEFT_C" 7104 ["⊢ T"])];
=TEX
\subsection{RANDS\_C}
=SML
store_mt_results (mt_runf (op =#)) [("RANDS_C 1",
	dest_thm o RANDS_C suc_conv,
	⌜1 + 3⌝,
	([],⌜(1 + 3) = (Suc 0) + (Suc 2)⌝)),
	("RANDS_C 2",
	dest_thm o RANDS_C suc_conv,
	⌜f 1 2 3⌝,
	([],⌜(f 1 2 3) = f (Suc 0) (Suc 1) (Suc 2)⌝)),
	("RANDS_C 3",
	dest_thm o RANDS_C suc_conv,
	⌜f 1⌝,
	([],⌜(f 1) = f (Suc 0)⌝)),
	("RANDS_C 4",
	dest_thm o RANDS_C suc_conv,
	⌜f⌝,
	([],⌜f = f⌝))];

store_mt_results mt_run_fail [("RANDS_C conv fails",
	RANDS_C (fail_with_conv "testing RANDS_C"),
	⌜1 + 2⌝,
	gen_fail_msg "fail_with_conv" 7075 ["testing RANDS_C"]),
	("RANDS_C conv 7104 a",
	RANDS_C (fn x => t_thm),
	⌜1 + 3⌝,
	gen_fail_msg "RANDS_C" 7104 ["⊢ T"]),
	("RANDS_C conv 7104 b",
	RANDS_C (fn x => refl_conv ⌜1⌝),
	⌜f 1 a⌝,
	gen_fail_msg "RANDS_C" 7104 ["⊢ 1 = 1"])];
=TEX

\subsection{SIMPLE\_λ\_C}
=SML
store_mt_results (mt_runf (op =#)) [("SIMPLE_λ_C",
	dest_thm o SIMPLE_λ_C suc_conv,
	⌜λ x ⦁ 3⌝,
	([],⌜(λ x ⦁ 3) = (λ x ⦁ Suc 2)⌝))];

store_mt_results mt_run_fail [("SIMPLE_λ_C conv fails",
	SIMPLE_λ_C (fail_with_conv "testing SIMPLE_λ_C"),
	⌜λ x ⦁ Suc 3⌝,
	gen_fail_msg "fail_with_conv" 7075 ["testing SIMPLE_λ_C"]),
	("SIMPLE_λ_C conv 3011",
	SIMPLE_λ_C suc_conv,
	⌜3⌝,
	gen_fail_msg "SIMPLE_λ_C" 3011 ["⌜3⌝"]),
	("SIMPLE_λ_C conv 7104",
	SIMPLE_λ_C (fn x => t_thm),
	⌜λ x ⦁ Suc 3⌝,
	gen_fail_msg "SIMPLE_λ_C" 7104 ["⊢ T"])];

=TEX
\subsection{SIMPLE\-\_BINDER\-\_C}
=SML
store_mt_results (mt_runf (op =#)) [("SIMPLE_BINDER_C",
	dest_thm o SIMPLE_BINDER_C (RAND_C suc_conv),
	⌜∀ x ⦁ x = 3⌝ ,
	([],⌜(∀ x ⦁ x = 3) = (∀ x ⦁ x = Suc 2)⌝))];

store_mt_results mt_run_fail [("SIMPLE_BINDER_C conv fails",
	SIMPLE_BINDER_C (fail_with_conv "testing SIMPLE_BINDER_C"),
	⌜∀ x ⦁ x = 3⌝,
	gen_fail_msg "fail_with_conv" 7075 ["testing SIMPLE_BINDER_C"]),
	("SIMPLE_BINDER_C conv 7059",
	SIMPLE_BINDER_C suc_conv,
	⌜3⌝,
	gen_fail_msg "SIMPLE_BINDER_C" 7059 ["⌜3⌝"]),
	("SIMPLE_BINDER_C conv 7104",
	SIMPLE_BINDER_C (fn x => t_thm),
	⌜∀ x ⦁ x = 3⌝,
	gen_fail_msg "SIMPLE_BINDER_C" 7104 ["⊢ T"])];

=TEX
\subsection{SUB\_C}
=SML
store_mt_results (mt_runf (op =#)) [("SUB_C a",
	dest_thm o SUB_C suc_conv,
	v1,
	([],⌜(v1:BOOL) = v1⌝)),
	("SUB_C b",
	dest_thm o SUB_C suc_conv,
	T,
	([],⌜T = T⌝)),
	("SUB_C c",
	dest_thm o SUB_C suc_conv,
	⌜f 3⌝,
	([],⌜f 3 = f (Suc 2)⌝)),
	("SUB_C d",
	dest_thm o SUB_C (RAND_C suc_conv),
	⌜f 3 4⌝,
	([],⌜f 3 4 = f (Suc 2) 4⌝)),
	("SUB_C e",
	dest_thm o SUB_C (RAND_C suc_conv ORELSE_C suc_conv),
	⌜f 3 4⌝,
	([],⌜f 3 4 = f (Suc 2) (Suc 3)⌝)),
	("SUB_C f",
	dest_thm o SUB_C suc_conv,
	⌜λ x ⦁ 3⌝,
	([],⌜(λ x ⦁ 3) = (λ x ⦁ (Suc 2))⌝)),
	("SUB_C g",
	dest_thm o SUB_C (fail_with_conv "testing SUB_C"),
	⌜f x : BOOL⌝,
	([],⌜(f x : BOOL) = (f x)⌝)),
	("SUB_C h",
	dest_thm o SUB_C (fn x => pq_ax),
	⌜f x : BOOL⌝,
	([],⌜(f x : BOOL) = (f x)⌝))];
=TEX
\subsection{SUB\_C1}
=SML
store_mt_results (mt_runf (op =#)) [("SUB_C1 a",
	dest_thm o SUB_C1 suc_conv,
	⌜f 3⌝,
	([],⌜f 3 = f (Suc 2)⌝)),
	("SUB_C1 b",
	dest_thm o SUB_C1 (RAND_C suc_conv),
	⌜f 3 4⌝,
	([],⌜f 3 4 = f (Suc 2) 4⌝)),
	("SUB_C1 c",
	dest_thm o SUB_C1 (RAND_C suc_conv ORELSE_C suc_conv),
	⌜f 3 4⌝,
	([],⌜f 3 4 = f (Suc 2) (Suc 3)⌝)),
	("SUB_C1 d",
	dest_thm o SUB_C1 suc_conv,
	⌜λ x ⦁ 3⌝,
	([],⌜(λ x ⦁ 3) = (λ x ⦁ (Suc 2))⌝)),
	("SUB_C1 e",
	dest_thm o SUB_C1 (fn x => if is_app x
		then pq_ax
		else suc_conv x),
	⌜f 3 4⌝,
	([],⌜f 3 4 = f 3 (Suc 3)⌝))];

store_mt_results mt_run_fail [("SUB_C1 7104 a",
	SUB_C1 (fn x => t_thm),
	⌜f 3⌝,
	gen_fail_msg "SUB_C1" 7104 ["⊢ T"]),
	("SUB_C1 7104 b",
	SUB_C1 (RAND_C (fn x => pq_ax) ORELSE_C (fn x => pq_ax)),
	⌜f 3 4⌝,
	gen_fail_msg "SUB_C1" 7104 ["⊢ ∃ p⦁ q"]),
	("SUB_C1 7104 c",
	SUB_C1 (fn x => t_thm),
	⌜λ x ⦁ 3⌝,
	gen_fail_msg "SUB_C1" 7104 ["⊢ T"]),
	("SUB_C1 7105 a",
	SUB_C1 suc_conv,
	v1,
	gen_fail_msg "SUB_C1" 7105 ["⌜v1⌝"]),
	("SUB_C1 7105 b",
	SUB_C1 suc_conv,
	T,
	gen_fail_msg "SUB_C1" 7105 ["⌜T⌝"]),
	("SUB_C1 conv fails",
	SUB_C1 (fail_with_conv "testing SUB_C1"),
	⌜f x⌝,
	gen_fail_msg "fail_with_conv" 7075 ["testing SUB_C1"])];
=TEX
\subsection{ONCE\_MAP\_C}
=SML
store_mt_results (mt_runf (op =#)) [("ONCE_MAP_C",
	dest_thm o ONCE_MAP_C simple_β_conv,
	sample,
	([],mk_eq(sample,
	⌜(λ x y ⦁ ((λ x ⦁ ¬ x) x ∧ y) ∧ (λ p ⦁ p) q) T q⌝)))];
=TEX
=SML
store_mt_results mt_run_fail [("ONCE_MAP_C cnv fails everywhere",
	ONCE_MAP_C (fail_with_conv "testing ONCE_MAP_C"),
	sample,
	gen_fail_msg "ONCE_MAP_C" 7005 [])];
=TEX
\subsection{MAP\_C}
=SML
store_mt_results (mt_runf (op =#)) [("MAP_C",
	dest_thm o MAP_C simple_β_conv,
	sample,
	([],mk_eq(sample,
	⌜((λ x ⦁ ¬ x) T ∧ q) ∧ q⌝)))];
=TEX
=SML
store_mt_results mt_run_fail [("MAP_C cnv fails everywhere",
	MAP_C (fail_with_conv "testing MAP_C"),
	sample,
	gen_fail_msg "MAP_C" 7005 [])];
=TEX
\subsection{REPEAT\_MAP\_C}
=SML
store_mt_results (mt_runf (op =#)) [("REPEAT_MAP_C",
	dest_thm o REPEAT_MAP_C simple_β_conv,
	sample,
	([],mk_eq(sample,
	⌜((¬ T) ∧ q) ∧ q⌝)))];
=TEX
=SML
store_mt_results mt_run_fail [("REPEAT_MAP_C cnv fails everywhere",
	REPEAT_MAP_C (fail_with_conv "testing REPEAT_MAP_C"),
	sample,
	gen_fail_msg "REPEAT_MAP_C" 7005 [])];
=TEX
\subsection{TOP\_MAP\_C}
This will receive much heavier testing in the rewriting inference rules tests in \cite{DS/FMU/IED/MDT026}.
=SML
store_mt_results (mt_runf (op =#)) [("TOP_MAP_C",
	dest_thm o TOP_MAP_C simple_β_conv,
	sample,
	([],mk_eq(sample,
	⌜((¬ T) ∧ q) ∧ q⌝)))];
=TEX
=SML
store_mt_results mt_run_fail [("TOP_MAP_C cnv fails everywhere",
	TOP_MAP_C (fail_with_conv "testing TOP_MAP_C"),
	sample,
	gen_fail_msg "TOP_MAP_C" 7005 [])];
=TEX
\subsection{conv\_rule}
=SML
store_mt_results (mt_runf (op =#)) [("conv_rule",
	dest_thm o conv_rule (REPEAT_MAP_C suc_conv),
	plus_conv (list_mk_app(tplus,[⌜3⌝,⌜2⌝])),
	([],mk_eq(list_mk_app(tplus,[⌜Suc(Suc(Suc 0))⌝,⌜(Suc(Suc 0))⌝]),
		⌜Suc(Suc(Suc(Suc(Suc 0))))⌝)))];

store_mt_results mt_run_fail [("conv_rule 7104",
	conv_rule (fn x => t_thm),
	asm_rule T,
	gen_fail_msg "conv_rule" 7104 ["⊢ T"]),
	("conv_rule cnv fails",
	conv_rule (fail_with_conv "testing conv_rule"),
	asm_rule T,
	gen_fail_msg "fail_with_conv" 7075 ["testing conv_rule"])];

=TEX
\section{END OF TESTS}
=SML
diag_string(summarize_mt_results());
=IGN
To undo theory creation, etc:

open_theory start_theory;
delete_theory "out_of_scope_mdt007";
delete_theory "test_mdt007";
=TEX
=IGN
\section{UNTESTED ERROR MESSAGES}
The following are not tested for various reasons:

\begin{tabular}{| l | p{4.5in} |}\hline
Test & Comment \\ \hline
\hline
\end{tabular}
=TEX
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}




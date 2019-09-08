=IGN
********************************************************************************
int003.doc: this file is part of the PPZed system

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

\def\Title{Further Integration Tests for the ProofPower-Z System}

\def\AbstractText{This document provides a description of the {\ProductZ} system integration tests.}

\def\Reference{DS/FMU/IED/INT003}

\def\Author{R.D.Arthan}


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
%% LaTeX2e port: \TPPproject{FST Project}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Further Integration Tests for the ProofPower-Z System}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/INT003}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.13 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2011/08/05 15:19:09 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{R.D.Arthan & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & Project Manager}
%% LaTeX2e port: \TPPabstract{This document provides a description of the \ProductZ{} system integration tests.}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	    Library
%% LaTeX2e port: }}
%% LaTeX2e port: \begin{document}
%% LaTeX2e port: \makeTPPfrontpage
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
\pagebreak
\section{DOCUMENT CONTROL}
\subsection{Contents List}
\tableofcontents
\subsection{Document Cross References}
\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes History}
\begin{description}
\item[Issue 1.1 (2005/08/08),1.2 (2005/08/09)]
First drafts with a miscellany of regression tests for recent bug fixes relating to term generation for schema operators.
\item[Issue 1.3 (2006/01/12)]
Added tests for new \verb!$"..."! syntax.
\item[Issue 1.4 (2006/01/14)]
Added test for bugfix in term generation for let expressions.
\item[Issue 1.5 (2006/01/24)]
Revised tests for new \verb!$"..."! syntax.
\item[Issue 1.6 (2006/01/25), 1.7 (2006/01/26)]
Tests for decorated fancyfix identifiers.
\item[Issue 1.8 (2006/02/08)] Added pretty-printer loopback tests as regression tests for recent fix.
\item[Issue 1.9 (2008/02/10)] Allowed for changes to lexical rules for underscores.
\item[Issue 1.10 (2010/04/01)] Updated for empty schemas.
\item[Issue 1.10 (2010/04/01)] Tested fix to calculation of characteristic tuples.
\item[Issue 1.11 (2011/07/10),1.12 (2011/08/05)] Added tests for fix to$\alpha$-conversion and conversion of HOL quantifiers to Z.
\item[Issue 1.13 (2011/08/05)] More on characteristic tuples.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.
\item[2014/08/08]
Made it follow the convention that temporary ML files have a ``.sml'' extension.

\item[2015/04/17]
Ported PPZed to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
%\subsection{Changes Forecast}
\section{GENERAL}
\subsection{Scope}\label{Scope}
This document provides some additional system integration tests for {\ProductZ}.
\subsection{Introduction}
\subsubsection{Purpose and Background}
This document gives additional integration tests for the \ProductZ{} system, excluding the generic HOL support tools.
It either describes the tests to be made, or gives a reference
to the test documents.

It mainly comprises regression tests relating to fixes that are either most easily carried out using the full facilities of the system or which do not have a natural home in the module test documents.

\subsubsection{Dependencies}
The usual test harness of \cite{DS/FMU/IED/DTD013,DS/FMU/IED/IMP013} is used.

\subsubsection{Deficiencies}
None known.
\subsubsection{Changes Forecast}
N/A
\section{TEST CASES}
There are currently the following batches of tests
corresponding to the subsections of section~\ref{THETESTS} below.
The test cases may be further subdivided in those subsections.

\begin{description}
\item[Schema Operations] This tests a number of potentially anomalous cases of term generation for schema operations(e.g., unlikely combinations of signatures).
\item[Duplicate Declarations] This tests Z constructs in which a signature variable appears more than once in a declaration.
\item[Nonstandard Identifiers] This tests the feature supporting names containing arbitrary strings.
\item[Term Generation for Let Expressions] Regression tests
for a bug.
\item[Decorated Fancyfix Operators] Tests for an enhancement.
\item[Pretty-printer Loopback Tests] Regression tests for pretty-printing that are nicer to conduct with the Z library in place.
\end{description}

\section{PRELIMINARIES}
=SML
val ⦏orig_thys⦎ = get_descendants "min";
val ⦏clean_up⦎ : unit -> unit = (fn () =>
	let	val to_go = get_descendants "min" diff orig_thys;
		fun kill thy = force_delete_theory thy handle Fail _ => ();
	in	app kill to_go
	end
);
use_file "dtd013.sml";
use_file "imp013.sml";
=TEX
=SML
fun ⦏check_conv⦎ (conv : CONV)
	(expected_rhs : TERM -> bool)
	: TERM -> bool = (
	expected_rhs o snd o dest_eq o concl o conv
);
=TEX
=SML
fun ⦏check_fail⦎ f = (f (); false) handle Fail _ => true;
=TEX
\section{THE TESTS}\label{THETESTS}
\subsection{Schema Operators}
In this batch, there are test cases as follows:
\begin{description}
\item[Block 1] Edge cases for schema projection.
\item[Block 2] Edge cases for schema quantification.
\item[Block 3] Error cases for schema hiding.
\item[Block 4] Unusual cases for schema composition.
\end{description}
=SML
clean_up();
open_theory "z_library";
new_theory "block_1";
ⓈZ
│ rel P _, Q _, R _
■
╒[ X ]═══════════
│ P _, Q _, R _: ℙX
└──────────────
┌ A ───────────
│ a, ab, ac, abc : ℤ
├──────
│ P(a, ab, ac, abc)
└──────────────
┌ B ───────────
│ b, ab, bc, abc : ℤ
├──────
│ P(b, ab, bc, abc)
└──────────────
┌ C ───────────
│ c, ac, bc, abc : ℤ
├──────
│ P(c, ac, bc, abc)
└──────────────

=TEX

=SML
store_mt_results
(mt_run o map (fn (n, t) => (n, check_conv z_↾⋎s_conv is_z_∧⋎s, t, true))) [
("so.1.1", ⓩA ↾⋎s A⌝),
("so.1.2", ⓩA ↾⋎s (A ∧ B)⌝),
("so.1.3", ⓩA ↾⋎s (A ∧ B ∧ C)⌝)
];

=TEX
=SML
store_mt_results
(mt_run o map (fn (n, t) => (n, check_conv z_∀⋎s_conv is_z_seta, t, true))) [
("so.2.1", ⓩ(∀A ⦁ A ∧ B ) ⦂ 𝕌⌝),
("so.2.2", ⓩ(∀A ⦁ A ∧ B ) ⦂ 𝕌⌝)
];
=TEX
=SML
store_mt_results
mt_run [
("so.3.1", check_fail, (fn () => ⓩA \⋎s (x, y, z)⌝), true)
];
store_mt_results
mt_run [
("so.3.2", fn tm => dest_z_schema_type (dest_z_power_type (type_of tm)) = [], ⓩA \⋎s (a, ab, ac, abc)⌝, true)
];
=TEX
=TEX
=SML
store_mt_results
(mt_run o map (fn (n, t) => (n, check_conv z_⨾⋎s_conv is_z_h_schema, t, true))) [
("so.4.1",  ⓩ[a,a',b,b':ℤ| P(a, a')] ⨾⋎s [a,a',c:ℤ| R(a, a')]⌝),
("so.4.2", ⓩ[a:ℤ| P(a, a')] ⨾⋎s [a:ℤ| R(a, a')]⌝),
("so.4.3", ⓩ[a:ℤ;b,b':ℤ;a:ℤ| P(b, b')] ⨾⋎s [a:ℤ| R(a, a')]⌝)
];
=TEX
\subsection{Duplicate Declarations}

=TEX
=SML
store_mt_results
(mt_run o map (fn (n, t) => (n, check_conv z_∃⋎1_conv is_z_∃, t, true))) [
("dd.2.1", ⓩ∃⋎1 x:X; x:X⦁P(x, y)⌝)
];
=TEX
=SML
store_mt_results
(mt_run o map (fn (n, t) => (n, check_conv z_∈_seta_conv is_z_∃, t, true))) [
("dd.2.2", ⓩa ∈ {x : X; x : X  | P(x, x) ⦁ f (x, x)}⌝)
];
=TEX
=SML
store_mt_results
(mt_run o map (fn (n, t) => (n, check_conv z_∈_λ_conv is_z_∈, t, true))) [
("dd.2.3", ⓩa ∈ (λx : X; x : X  | P(x, y) ⦁ f (x, y))⌝),
("dd.2.4", ⓩa ∈ (λx : X; [a, b: X]; x : X  | P(x, y) ⦁ f (x, y))⌝)
];
=TEX
=SML
fun all_undisch_rule thm =
	all_undisch_rule (undisch_rule thm) handle Fail _ => thm;
val ⦏z_μ_conv⦎ : CONV = all_undisch_rule o all_∀_elim o conv_rule z_∀_elim_conv o z_μ_rule;
=TEX
=SML
store_mt_results
(mt_run o map (fn (n, t) => (n, check_conv z_μ_conv is_z_lvar, t, true))) [
("dd.2.5", ⓩ(μx : X; x : X  | P(x, y) ⦁ f (x, y))⌝)
];
=TEX
\subsection{Support for Nonstandard Identifiers}
The new \verb!$"..."! syntax allows an arbitrary string to be used as the identifier part of a name.
=SML
store_mt_results
mt_run [
("ni.1.1", fst o dest_var, ⓩ $"abc"⌝, "$\"abc\""),
("ni.1.2", fst o dest_var, ⓩ $" a b c "⌝, "$\" a b c \""),
("ni.1.3", fst o dest_var, ⓩ $""⌝, "$\"\""),
("ni.1.4", fst o dest_var, ⓩ $"!!!"⌝, "$\"!!!\"")
];
=TEX
As part of the support for the new syntax, {\em unpack\_ident} has been redesigned so that it treats any string as legal and only takes trailing decoration characters as decoration.
=SML
val upi = ZTypesAndTermsSupport.unpack_ident;
store_mt_results
mt_run [
("ni.2.1", upi, "abc", ("abc", "")),
("ni.2.2", upi, "a'b'c", ("a'b'c", "")),
("ni.2.3", upi, "a'b'c'", ("a'b'c", "'")),
("ni.2.4", upi, "a'b'c'!?", ("a'b'c", "'!?")),
("ni.2.5", upi, "'!?", ("", "'!?")),
("ni.2.6", upi, "", ("", ""))
];
=TEX
The pretty-printer should use the new syntax when it can to print non-standard terms.
=SML
val pp_s = string_of_termⓩ∀ $"a'b'c'" : X ⦁ $"a'b'c'" = x⌝;
val my_s = "ⓩ∀ $\"a'b'c'\" : X ⦁ $\"a'b'c'\" = x⌝";
store_mt_results
mt_run [
("ni.3.1", (op =), (explode pp_s less " ", explode my_s less " "), true)
];
=TEX
\subsection{Term Generation for Let Expressions}
The following should not fail:
┌ S_LET2 ───────────
│ A : ℤ
├──────
│ let X ≜ 4; Y ≜ 7 ⦁ true
└──────────────
┌ S_LET5 ───────────
│ A : ℤ
├──────
│ let X ≜ 4; Y ≜ 7; Z ≜ 10; A ≜ 13; B ≜ 16 ⦁ true
└──────────────
=TEX
\subsection{Decorated Fancyfix Operators}
=TEX
As part of the support for the new syntax, {\em unpack\_ident}  and  {\em pack\_ident} have been redesigned to put the decoration in the right place.
=SML
val upi = ZTypesAndTermsSupport.unpack_ident;
store_mt_results
mt_run [
("ffo.1.1", upi, "abc' _", ("abc _", "'")),
("ffo.1.2", upi, "_ +!?' _", ("_ + _", "!?'"))
];
=TEX
=SML
val pi = ZTypesAndTermsSupport.pack_ident;
store_mt_results
mt_run [
("ffo.2.1", pi, ("abc _", "!"), "abc! _"),
("ffo.2.2", pi, ("_ + _", "!?'"), "_ +!?' _")
];
=SML
clean_up();
open_theory "z_library" ;
new_theory "fancyfix" ;
ⓈZ
│ function 10 _--_, _++_
■
┌ OPS ───────────
│ _--_ : ℤ × ℤ → ℤ;
│ _++_ : ℤ × ℤ → ℤ
├──────
│ ∀x, y: ℤ⦁(x ++ y) -- y = x
└──────────────
=TEX
=SML
store_mt_results
(mt_runf (op =$)) [
("ffo.3.1", z_type_of, ⓩOPS⌝, ⓩℙ[_ ++ _, _ -- _ : ℤ × ℤ ↔ ℤ]⌝),
("ffo.3.2", z_type_of, ⓩOPS!⌝, ⓩℙ[_ ++! _, _ --! _ : ℤ × ℤ ↔ ℤ]⌝),
("ffo.3.3", z_type_of, ⓩ[OPS; OPS']⌝, ⓩℙ[_ ++ _, _ ++' _, _ -- _, _ --' _ : ℤ × ℤ ↔ ℤ]⌝),
("ffo.3.4", z_type_of, ⓩ[OPS; OPS'] ⨾⋎s [OPS; OPS']⌝, ⓩℙ[_ ++ _, _ ++' _, _ -- _, _ --' _ : ℤ × ℤ ↔ ℤ]⌝)
];
ⓈZ
│ relation Known _
■

┌ ST ───────────
│ Known _ : ℙℤ
└──────────────
┌ Learn ───────────
│ ΔST;
│ what? : ℤ
├
│ ¬Known what?;
│ (Known' _) = (Known _) ∪ {what?}
└──────────────
=SML
fun check_pop_thm () = (
	(pop_thm(); true) handle Fail _ => false
);
set_pc"z_library";
set_goal([], ⓩpre Learn ⇔ ¬Known what?⌝);
a(rewrite_tac(map z_get_spec[ⓩST⌝, ⓩLearn⌝]));
a(cases_tacⓩ¬Known what?⌝ THEN asm_rewrite_tac[]);
a(z_∃_tacⓩ(Known _) ∪ {what?}⌝ THEN rewrite_tac[]);
store_mt_results
mt_run [
("ffo.4.1", check_pop_thm, (), true)
];
=TEX
=SML
set_goal([], ⓩST! = {a : ℙℤ⦁ (Known! _ ≜ a)}⌝);
a(PC_T1 "z_library_ext" rewrite_tac(map z_get_spec[ⓩST⌝]));
store_mt_results
mt_run [
("ffo.4.2", check_pop_thm, (), true)
];
=TEX
=SML
set_goal([], ⓩ(ΔST) = {a, b : ℙℤ⦁ (Known _ ≜ a, Known'_ ≜ b)}⌝);
a(PC_T1 "z_library_ext" rewrite_tac(map z_get_spec[ⓩST⌝]));
store_mt_results
mt_run [
("ffo.4.3", check_pop_thm, (), true)
];
=TEX
=SML
set_goal([], ⓩ(ΞST) = {a : ℙℤ⦁ (Known _ ≜ a, Known'_ ≜ a)}⌝);
a(PC_T1 "z_library_ext" rewrite_tac(map z_get_spec[ⓩST⌝]));
store_mt_results
mt_run [
("ffo.4.4", check_pop_thm, (), true)
];
=TEX
\subsection{Pretty-printer Loopback Tests}
=SML
val test_cases1 =
[	(1, ⓩseq X × Y⌝),
	(2, ⓩseq (X × Y)⌝),
	(3, ⓩid (A ∪ B)⌝),
	(4, ⓩ~ (A + B) + C + (D + E) + (F + G)⌝),
	(5, ⓩ(A ∪ B) × C⌝),
	(6, ⓩA ∪ (B × C)⌝),
	(7, ⓩA → (B × C)⌝),
	(8, ⓩA → B × C⌝),
	(9, ⓩ(A → B) × C⌝),
	(10, ⓩ(A → B) × (C → D)⌝),
	(11, ⓩ𝔽 (A × B) × (A × B)⌝),
	(12, ⓩ(A × B × C) × (D × E × F) × G⌝),
	(13, ⓩA ∪ B × C ∪ D⌝),
	(14, ⓩA ∪ (B × C) ∪ D⌝),
	(15, ⓩid A ∪ (B × C) ∪ D⌝)];

=TEX
=SML
val returned : (int * TERM) list ref = ref [];
=TEX
=SML
fun loopback (file : string) (tcs : (int * TERM) list)
	: (int * TERM) list = (
	let	val strm = open_out file;
		fun fmt1 (i, t) = "(" ^ string_of_int i ^ ", " ^ (translate_for_output(string_of_term t)) ^ ")";
		fun do1 p = (
			output(strm, "returned := ");
			output(strm, fmt1 p);
			output(strm, " :: !returned;\n")
		);
	in	app do1 (rev tcs);
		close_out strm;
		returned := [];
		use_file file;
		!returned
	end
);
=TEX
=SML
fun check_pairs [] [] = true
|   check_pairs [] _ = false
|   check_pairs _ [] = false
|   check_pairs ((i1, tm1)::more1) ((i2, tm2)::more2) = (
	i1 = i2 andalso tm1 =$ tm2 andalso check_pairs more1 more2
);
=TEX
=SML
val results1 = loopback "int004A.sml" test_cases1;
=TEX
=SML
store_mt_results
mt_run [
("pp_loopback.1", check_pairs test_cases1, results1, true)
];
=TEX
\subsection{Characteristic Tuples}
=SML
clean_up();
open_theory "z_library";
new_theory "t";
=TEX
ⓈZ
│ S ≜ [X : ℤ]
■
=TEX
=SML
store_mt_results
mt_run [
	("chartuple.1.1", fn _ => z_type_of ⓩ {S; S'} ⌝, (),
			ⓩ[X : ℤ] ↔ [X : ℤ]⌝),
	("chartuple.1.2", fn _ => z_type_of ⓩ (λ S; S' ⦁ 0) ⌝, (),
			ⓩ [X : ℤ] × [X : ℤ] ↔ ℤ ⌝ ),
	("chartuple.1.3", fn _ => z_type_of ⓩ (μ S; S') ⌝, (),
			ⓩ [X : ℤ] × [X : ℤ] ⌝ ),
	("chartuple.1.4", fn _ => z_type_of ⓩ {{ S; S' }} ⌝, (),
			ⓩ ℙ([X : ℤ] ↔ [X : ℤ]) ⌝ )
];
=TEX
The following are regression tests for a bug that appeared as a result
of the corrections to the handling of characteristic tuples. All we need
to check is that the term quotations do not raise an exception.
=SML
store_mt_results
mt_run [
	("chartuple.2.1", fn _ => (ⓩθ {x : 𝕌 | x ∈ [A : 𝕌]}⌝; true),
			(), true),
	("chartuple.2.2", fn _ => (ⓩΠ {x : 𝕌 | x ∈ [A : 𝕌]}⌝; true),
			(), true),
	("chartuple.2.3", fn _ => (ⓩ(μ x : SS | SS ∈ ℙ [A : 𝕌]).A⌝; true),
			(), true),
	("chartuple.2.4", fn _ => (ⓩ(μ x : SS | SS ∈ ℙ [A : 𝕌] ⦁ x).A⌝; true),
			(), true)
];
=TEX
\subsection{$\alpha$-conversion and conversion of HOL quantifiers to Z}
=SML
clean_up();
open_theory "z_library";
new_theory "t";
set_pc "z_predicates";
=TEX
=SML
val tm1 = (snd o dest_eq o concl o z_∀_elim_conv2) ⓩ∀ [a : X; x : X] ⦁ y = x⌝;
val tm2 = subst[(⌜x:'a⌝, ⌜y:'a⌝)] tm1;
val tm3 = (snd o dest_eq o concl o z_∃_elim_conv2) ⓩ∃ [a : X; x : X] ⦁ y = x⌝;
val tm4 = subst[(⌜x:'a⌝, ⌜y:'a⌝)] tm3;
fun check_no_asms thm = (
	case dest_thm thm of
		([], tm) => tm
	|	_ => fail "check_no_asms" 7061 []
);
=TEX
=SML
store_mt_results
mt_run [
	("alpha-conv.1.1", fst o dest_eq o check_no_asms o z_∀_intro_conv1, tm2,
			tm2),
	("alpha-conv.1.2", snd o dest_eq o check_no_asms o z_∀_intro_conv1, tm2,
			ⓩ∀ ([a : X; x : X] [x'/x]) ⦁ x = x'⌝),
	("alpha-conv.1.3", fst o dest_eq o check_no_asms o z_∃_intro_conv1, tm4,
			tm4),
	("alpha-conv.1.4", snd o dest_eq o check_no_asms o z_∃_intro_conv1, tm4,
			ⓩ∃ ([a : X; x : X] [x'/x]) ⦁ x = x'⌝)
];
=TEX
=SML
val tm5 = ⓩb ∈ { a : ℤ; b : ℤ  ⦁ a}⌝;
val tm6 = ⓩb ∈ {[a : ℤ; b : ℤ] ⦁ a}⌝;
store_mt_results
mt_run [
	("alpha-conv.2.1", fst o dest_eq o check_no_asms o z_∈_seta_conv, tm5,
			tm5),
	("alpha-conv.2.2", snd o dest_eq o check_no_asms o z_∈_seta_conv, tm5,
			ⓩ∃ a : ℤ; b' : ℤ ⦁ a = b⌝),
	("alpha-conv.2.3", fst o dest_eq o check_no_asms o z_∈_seta_conv, tm6,
			tm6),
	("alpha-conv.2.4", snd o dest_eq o check_no_asms o z_∈_seta_conv, tm6,
			ⓩ∃ ([a : ℤ; b : ℤ] [b'/b]) ⦁ a = b⌝)
];
=SML
val tm7 =  ⓩ [X] (∀ A : ℙ X; f : ℙ [x : X; y : Y]⦁
		{f ⦁ (x, y)} ⦇ A ⦈ = {f | x ∈ A ⦁ y})⌝;
set_goal ([], tm7);
a (PC_T1 "z_rel_ext" REPEAT z_strip_tac);
(* *** Goal "1" *** *)
a (z_∃_tac ⓩ(x ≜ x, y ≜ x1)⌝ THEN asm_rewrite_tac []);
(* *** Goal "2" *** *)
a all_var_elim_asm_tac;
a (z_∃_tac ⓩx⌝ THEN asm_rewrite_tac []);
a (PC_T1 "z_rel_ext" REPEAT z_strip_tac);
store_mt_results
mt_run [("alpha-conv.3.1", check_no_asms o pop_thm, (), tm7)];
=TEX
=SML
=TEX
\section{EPILOGUE}
=SML
val _ = diag_line(summarize_mt_results());

=TEX
\end{document}

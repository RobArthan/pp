=IGN
********************************************************************************
mdt003.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% mdt003.doc   ℤ $Date: 2009/09/13 12:06:27 $ $Revision: 2.13 $ $RCSfile: mdt003.doc,v $
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

\def\Title{Module Tests for Types and Terms}

\def\AbstractText{A set of module tests are given for the the types of HOL terms and types, namely $TERM$ and $TYPE$, and then upon some utility functions about these.}

\def\Reference{DS/FMU/IED/MDT003}

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
%% LaTeX2e port: \TPPtitle{Module Tests for Types and Terms}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Module Tests for Types and Terms}
%% LaTeX2e port: \TPPref{DS/FMU/IED/MDT003}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 2.13 $ %
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2009/09/13 12:06:27 $ %
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: %\TPPstatus{Approved}
%% LaTeX2e port: \TPPtype{ML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.Blackburn & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{A set of module tests are given for the
%% LaTeX2e port: the types of HOL terms and types, namely $TERM$ and $TYPE$,
%% LaTeX2e port: and then upon some utility functions about these.}
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
\item [Issues 1.1 (1991/02/07) to 1.18 (1991/09/04)]
First drafts.
\item [Issue 1.19 (1991/11/07)]
Changes in reaction to deskcheck ID0089.
\item [Issue 2.1 (1991/11/11) (11th November 1991)]
Approved version of issue 1.19.
\item [Issue 2.2 (1991/12/11) (11th December 1991)]
Extended the test coverage of some functions.

\item[Issue 2.3 (1992/01/20), \FormatDate{92/01/20} ] Updated to use new fonts.
\item [Issue 2.4 (1992/04/09) (1st April 1992)]
Changes required by CR0016.
\item [Issue 2.9 (1999/03/09) (13th April 1992)]
Update for new INTEGER type.
Changes due to CR0017.
\item [Issue 2.6 (1992/04/21) (21 April 1992)]
Reduce dependency upon the exact format of the pretty printer's outputs.
\item [Issue 2.7 (1992/12/15) (14th December 1992)]
Changed to allow to run on a parent database.
\item [Issue 2.8 (1999/02/22)]
Update for SML97.
\item [Issue 2.8 (1999/02/22)]
\item[Issue 2.10 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 2.11 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 2.12 (2005/03/20)] Tested fix for {\em inst}.
\item[Issue 2.13 (2009/09/13)] Added tests for $type\_match1$.
\item[Issue 2.14 (2012/02/21)] Added tests for $list\_string\_variant$.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
%\subsection{Changes Forecast}
\section{GENERAL}
\subsection{Scope}
This document contains the module testing of the types and terms of ICL HOL, and utilities to handle them, required by Release 1 ICL HOL Product Requirement Specification \cite{DS/FMU/IED/DEF004}.
The design is in \cite{DS/FMU/IED/DTD003}
and it is
implemented in \cite{DS/FMU/IED/IMP003}.

\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains the module testing of the material given a design in \cite{DS/FMU/IED/DTD003},
following the test policy given in that document and the general policy given in \cite{DS/FMU/IED/PLN008}.

\subsubsection{Dependencies}
This document is derived from the detailed design in \cite{DS/FMU/IED/DTD003},
and is further influenced by the implementation, in  \cite{DS/FMU/IED/IMP003}.
It relies on a term pretty-printer being present to format
the results of error messages.
\subsubsection{Deficiencies}
None known.
\section{TEST CASES}
We test each function of the signature of \cite{DS/FMU/IED/DTD003}
in turn, where possible in the same order as in the design document,
except for those exceptions noted in section \ref{untested}.
\section{TEST HARNESS MATERIAL}
=SML
use_file "dtd013.sml";
use_file "imp013.sml";
init_mt_results ();
=TEX
\section{INFIX DECLARATIONS}
=SML
infix 6 cross;
infix 6 comma;
=TEX
\section{TEST DATA}
This section contains data used in the test, that
in themselves are not part of the tests.
However, they may fail if the functions tested are ill-formed.
=SML
open_theory "basic_hol";
new_theory "mdt003_thy";
val I = Combinators.I;
declare_infix (80,"×");
fun (t1 :TYPE) cross (t2: TYPE) : TYPE = mk_ctype("×",[t1,t2]);
val BN = BOOL cross ℕ;
val BtoN = mk_→_type(BOOL, ℕ);
val tv1 = mk_vartype "'tv1";
val tv2 = mk_vartype "'tv2";
val tv3 = mk_vartype "'tv3";
fun t1 comma t2 = mk_const(",", (mk_→_type(t1,mk_→_type(t2,(t1 cross t2)))));
val Comma = tv1 comma tv2;
val vtv1 = mk_var("vtv1",tv1);
val vtv2 = mk_var("vtv2",tv2);
val vtv3 = mk_var("vtv3",tv3);
val v1 = mk_var("v1",BOOL);
val av1 = mk_var("av1",BOOL);
val v2 = mk_var("v2",mk_ctype("triple",[tv1,tv2,tv3]));
val v3 = mk_var("v2",mk_ctype("triple",[tv3,BOOL,tv1]));
val iv1 = mk_var(" a b c = F",tv1);
val iv2 = mk_var(" a b c = T",BOOL);
val c1 = mk_const("c1",BOOL);
val c2 = mk_const("c2",mk_ctype("triple",[tv1,tv2,tv3]));
val c3 = mk_const("c3",mk_ctype("triple",[tv3,BOOL,tv1]));
val c4 = mk_const("c4",mk_→_type(BOOL,mk_→_type(tv2,tv3)));
val c5 = mk_const("c5",mk_→_type(tv1,mk_→_type(tv2,BOOL)));
val c6 = mk_const("c6",mk_→_type(tv1,mk_→_type(tv2,mk_→_type(tv3,
	mk_ctype("triple",[tv1,tv2,tv3])))));
val c7 = mk_const(" starts with space",BOOL);
val cm1 = mk_app(c6,vtv1);
val cm2 = mk_app(cm1,vtv2);
val cm3 = mk_app(cm2,vtv3);
val a1 = mk_simple_λ(v1, cm3);
val a2 = mk_simple_λ(v2,v2);
val a3 = mk_simple_λ(hd(gen_vars [tv1][]), c2);
val a4 = mk_simple_λ(iv1, c2);
val eq1 = mk_eq(c1,v1);
val BeqB = equality BOOL BOOL;
val T = mk_const("T",BOOL);
val F = mk_const("F",BOOL);
val mk_t = T;
val mk_f = F;
val ⇒ = mk_const("⇒",mk_→_type(BOOL,mk_→_type(BOOL,BOOL)));
val N0 = (mk_ℕ o integer_of_int) 0;
val N2 = (mk_ℕ o integer_of_int) 2;
val cca = mk_char "a";
val ccc = mk_char "c";
val sc_abc = mk_string "abc";
val ftv1 = mk_var("f",mk_→_type(tv1,BOOL));
val ftv2 = mk_var("f",mk_→_type(tv2,BOOL));
fun replace_with_const l x = (
	if present (op =$) x l
	then fail "replace_with_const" 0 []
	else (let val (n,ty) = dest_var x
	in mk_const("rwc_" ^ n, ty) end));
=TEX
=SML
fun list_eq (eq:'a * 'a -> bool) ((a :: x), (b :: y)) : bool = (
	eq(a,b) andalso list_eq eq (x, y)
) | list_eq eq ([], []) = true
| list_eq _ _ = false;
=TEX
=SML
fun =**$ ((a,b), (c,d)) = (a =$ c) andalso (b =$ d);
fun =**: ((a,b), (c,d)) = (a =: c) andalso (b =: d);
fun =*$ ((a,b), (c,d)) = (a = c) andalso (b =$ d);
fun =*: ((a,b), (c,d)) = (a = c) andalso (b =: d);
=TEX
=SML
fun ⦏dest_simple_type_eq⦎ ((Ctype(nm1,lst1)), (Ctype(nm2,lst2))) = (
	nm1 = nm2 andalso list_eq(op =:) (lst1, lst2)
) | dest_simple_type_eq ((Vartype nm1), (Vartype nm2)) = nm1 = nm2
| dest_simple_type_eq _ = false;

=TEX
=SML
fun dest_simple_term_eq (Var (nm1,ty1), Var (nm2,ty2)) = (
	nm1 = nm2 andalso (ty1 =: ty2)
) | dest_simple_term_eq (Const (nm1,ty1), Const (nm2,ty2)) = (
	nm1 = nm2 andalso (ty1 =: ty2)
) | dest_simple_term_eq (App (f1,a1), App (f2,a2)) = (
	(f1 =$ f2) andalso (a1 =$ a2)
) | dest_simple_term_eq (Simpleλ (f1,a1), Simpleλ (f2,a2)) = (
	(f1 =$ f2) andalso (a1 =$ a2)
) | dest_simple_term_eq _ = false;
=TEX

Some functions to isolate this test material from the precise details
of the pretty printer's output.  These functions are used when testing
error conditions where the error message contains a formatted type or
term.  These routines might use the HOL pretty printer (via routines
$format_term1$ and $format_type1$ from $PrettyPrinter$) however they
might not be installed, but $string\_of\_XXX$ sorts this out.

=SML
fun pr_term(tm:TERM) : string = (
	string_of_term tm
);

fun pr_type(ty:TYPE) : string = (
	string_of_type ty
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

\section{THE TESTS}
\subsection{Tests on Types}
\subsection{=:}
=SML
store_mt_results mt_run[(
	"=: 1",
	(op =:),
	(tv1,tv1),
	true),
	(
	"=: 2",
	(op =:),
	(tv1,BOOL),
	false)];
=TEX
\subsubsection{dest\_simple\_type}
=SML
store_mt_results (mt_runf dest_simple_type_eq) [(
	"dest_simple_type 1",
	dest_simple_type,
	BtoN,
	Ctype("→",[BOOL,ℕ])),
	("dest_simple_type 2",
	dest_simple_type,
	tv1,
	Vartype "'tv1")];
=TEX
\subsubsection{mk\_simple\_type}
=SML
store_mt_results (mt_runf (op =:))[(
	"mk_simple_type 1",
	mk_simple_type,
	Ctype("→",[BOOL,ℕ]),
	BtoN),
	("mk_simple_type 2",
	mk_simple_type,
	Vartype "'tv1",
	tv1)];
=TEX
\subsubsection{dest\_ctype}
We test the destructor function out of order, as the constructor
tests require that the destructor function acts correctly.
This reordering is common within this document.
=SML
let
fun aux ((a,b), (c,d)) = (a = c) andalso list_eq (op =:) (b, d);
in
store_mt_results (mt_runf aux)[("dest_ctype 1",
	dest_ctype,
	ℕ,
	("ℕ",[])),
	("dest_ctype 2",
	dest_ctype,
	ℕ,
	("ℕ",[])),
	("dest_ctype 3",
	dest_ctype,
	mk_→_type(BOOL,ℕ),
	("→",[BOOL,ℕ])),
	("dest_ctype 4",
	dest_ctype,
	BOOL cross ℕ,
	("×",[BOOL,ℕ]))
	]
end;
store_mt_results mt_run_fail[("dest_ctype 3001",
	dest_ctype,
	tv1,
	gen_fail_msg "dest_ctype" 3001 [pr_type tv1])];
=TEX
\subsubsection{mk\_ctype}
=SML
let
fun aux ((a,b), (c,d)) = (a = c) andalso list_eq (op =:) (b, d);
in
store_mt_results (mt_runf aux)[
	("mk_ctype 1",
	dest_ctype o mk_ctype,
	("UNIT",[]),
	("UNIT",[])),
	("mk_ctype 2",
	dest_ctype o mk_ctype,
	("THREE",[BOOL,ℕ,BN]),
	("THREE",[BOOL,ℕ,BN])),
	("mk_ctype 3",
	dest_ctype o mk_ctype,
	("",[BOOL,ℕ,BN]),
	("",[BOOL,ℕ,BN]))
	]
end;
=TEX
\subsubsection{is\_ctype}
=SML
store_mt_results mt_run[
	("is_ctype 1",
	is_ctype,
	BN,
	true),
	("is_ctype 2",
	is_ctype,
	BtoN,
	true),
	("is_ctype 3",
	is_ctype,
	tv1,
	false)
	];
=TEX
\subsubsection{dest\_vartype}	
=SML
store_mt_results mt_run[
	("dest_vartype 1",
	dest_vartype,
	tv1,
	"'tv1"),
	("dest_vartype 2",
	dest_vartype,
	mk_vartype "",
	"")
	];

store_mt_results mt_run_fail [
	("dest_vartype 3019 a",
	dest_vartype,
	BOOL,
	gen_fail_msg "dest_vartype" 3019 [pr_type BOOL]),
	("dest_vartype 3019 b",
	dest_vartype,
	BtoN,
	gen_fail_msg "dest_vartype" 3019 [pr_type BtoN])
	];
=TEX
\subsubsection{mk\_vartype}
=SML
store_mt_results mt_run[
	("mk_vartype 1",
	dest_vartype o mk_vartype,
	"'tv1",
	"'tv1"),
	("mk_vartype 2",
	dest_vartype o mk_vartype,
	"",
	""),
	("mk_vartype 3",
	dest_vartype o mk_vartype,
	"BOOL",
	"BOOL")
	];
=TEX
\subsubsection{is\_vartype}
=SML
store_mt_results mt_run[
	("is_vartype 1",
	is_vartype,
	BN,
	false),
	("is_vartype 2",
	is_vartype,
	BtoN,
	false),
	("is_vartype 3",
	is_vartype,
	tv1,
	true)
	];
=TEX
\subsubsection{dest\_→\_type}
=SML
store_mt_results (mt_runf =**:)[
	("dest_→_type 1",
	dest_→_type o mk_→_type,
	(BOOL,ℕ),
	(BOOL,ℕ)),
	("dest_→_type 2",
	dest_→_type o mk_→_type,
	(BOOL,tv1),
	(BOOL,tv1))
	];

store_mt_results mt_run_fail [
	("dest_→_type 3022 a",
	dest_→_type,
	tv1,
	gen_fail_msg "dest_→_type" 3022 [pr_type tv1]),
	("dest_→_type 3022 b",
	dest_→_type,
	BN,
	gen_fail_msg "dest_→_type" 3022 [pr_type BN])
	];
=TEX
\subsubsection{mk\_→\_type}
=SML
store_mt_results (mt_runf (op =:)) [
	("mk_→_type 1",
	mk_→_type,
	(BOOL,ℕ),
	mk_ctype("→",[BOOL,ℕ])),
	("mk_→_type 2",
	mk_→_type,
	(BOOL,tv1),
	mk_ctype("→",[BOOL,tv1]))
	];
=TEX
\subsubsection{is\_→\_type}
=SML
store_mt_results mt_run[
	("is_→_type 1",
	is_→_type,
	BN,
	false),
	("is_→_type 2",
	is_→_type,
	BtoN,
	true),
	("is_→_type 3",
	is_→_type,
	tv1,
	false)
	];
=TEX
\subsubsection{inst\_type}
=SML
store_mt_results (mt_runf (op =:)) [
	("inst_type 1",
	uncurry inst_type,
	([(BOOL, tv1),(BN,tv3)], mk_→_type(tv1,BOOL)),
	mk_→_type(BOOL,BOOL)),
	("inst_type 2",
	uncurry inst_type,
	([(BOOL, tv1),(BN,tv3)], mk_→_type(BOOL,tv2)),
	mk_→_type(BOOL,tv2)),
	("inst_type 3",
	uncurry inst_type,
	([(BOOL, tv1),(BN,tv3)], tv3 cross BOOL),
	BN cross BOOL),
	("inst_type 4",
	uncurry inst_type,
	([(BOOL, tv1),(BN,tv1)], tv1),
	BOOL),
	("inst_type 5",
	uncurry inst_type,
	([(tv3, tv1),(BN,tv3)], tv1),
	tv3),
	("inst_type 6",
	uncurry inst_type,
	([(BtoN, tv1),(BN,tv3)], tv3 cross tv1),
	BN cross BtoN),
	("inst_type 7",
	uncurry inst_type,
	([(BtoN, tv1),(BN,tv3)], tv2 cross tv1),
	tv2 cross BtoN),
	("inst_type 8",
	uncurry inst_type,
	([(BtoN, tv1),(BN,tv3)],
	(tv1 cross tv2) cross (tv1 cross tv3)),
	(BtoN cross tv2) cross (BtoN cross BN)),
	("inst_type 9",
	uncurry inst_type,
	([(BtoN, tv1)],
	(tv3 cross tv2) cross (tv3 cross tv3)),
	(tv3 cross tv2) cross (tv3 cross tv3)),
	("inst_type 10",
	uncurry inst_type,
	([],
	(tv1 cross tv2) cross (tv1 cross tv3)),
	(tv1 cross tv2) cross (tv1 cross tv3))
	];
store_mt_results mt_run_fail [
	("inst_type 3019",
	inst_type [(BOOL,BOOL)],
	tv1,
	gen_fail_msg "inst_type" 3019 [pr_type BOOL])
	];
=TEX
\subsubsection{type\_tycons}
Notice the ordering of test 4's results.
=SML
store_mt_results mt_run[
	("type_tycons 1",
	type_tycons,
	tv1,
	[]),
	("type_tycons 2",
	type_tycons,
	BOOL,
	[("BOOL",0)]),
	("type_tycons 3",
	type_tycons,
	BtoN,
	[("→",2),("BOOL",0),("ℕ",0)]),
	("type_tycons 4",
	type_tycons,
	BtoN cross (mk_→_type(ℕ,BOOL)),
	[("×",2),("→",2),("ℕ",0),("BOOL",0)]),
	("type_tycons 5",
	type_tycons,
	tv1 cross BtoN,
	[("×",2),("→",2),("BOOL",0),("ℕ",0)])
	];
=TEX
\subsubsection{type\_tyvars}
Notice the ordering of test 5's results.
=SML
store_mt_results mt_run[
	("type_tyvars 1",
	type_tyvars,
	tv1,
	["'tv1"]),
	("type_tyvars 2",
	type_tyvars,
	BOOL,
	[]),
	("type_tyvars 3",
	type_tyvars,
	BtoN,
	[]),
	("type_tyvars 4",
	type_tyvars,
	tv1 cross BtoN,
	["'tv1"]),
	("type_tyvars 5",
	type_tyvars,
	tv1 cross (tv2 cross tv1),
	["'tv2","'tv1"])
	];
=TEX
\subsubsection{type\_any}
=SML
store_mt_results mt_run[
	("type_any 1",
	type_any (fn x => is_vartype x andalso ord(dest_vartype x) = ord "T"),
	(tv1 cross tv2),
	false),
	("type_any 2",
	type_any (fn x => is_vartype x andalso ord(dest_vartype x) = ord "T"),
	(mk_vartype "TV1" cross tv2),
	true)
	];
=TEX
\subsubsection{type\_map}
=SML
store_mt_results (mt_runf (op =:)) [
	("type_map 1",
	type_map (fn t => mk_vartype(dest_vartype t ^ "@")),
	mk_→_type(tv1,tv2),
	mk_→_type(mk_vartype "'tv1@",mk_vartype "'tv2@")),
	("type_map 2",
	type_map (fn t => mk_vartype(dest_vartype t ^ "@")),
	BOOL,
	BOOL),
	("type_map 3",
	type_map (fn t => if t =: tv1
		then fail "test" 0 []
		else mk_vartype(dest_vartype t ^ "@")),
	mk_→_type(mk_→_type(tv2,tv1),tv2),
	mk_→_type(mk_→_type(mk_vartype "'tv2@",tv1),mk_vartype "'tv2@"))
	];
=TEX
\subsection{Tests on Terms}
\subsubsection{=$\$$}
=SML
store_mt_results mt_run[
	("=$ 1",
	(op =$),
	(vtv2,vtv2),
	true),
	("=$ 2",
	(op =$),
	(vtv2,c1),
	false)];
=TEX
\subsubsection{dest\_simple\_term}
=SML
store_mt_results (mt_runf dest_simple_term_eq) [
	("dest_simple_term 1",
	dest_simple_term,
	vtv2,
	(Var("vtv2",tv2))),
	("dest_simple_term 2",
	dest_simple_term,
	c1,
	(Const("c1",BOOL))),
	("dest_simple_term 3",
	dest_simple_term,
	cm1,
	(App(c6,vtv1))),
	("dest_simple_term 4",
	dest_simple_term,
	a1,
	(Simpleλ(v1,cm3)))
	];
=TEX
\subsubsection{mk\_simple\_term}
=SML
store_mt_results (mt_runf (op =$)) [
	("mk_simple_term 1",
	mk_simple_term,
	(Var("vtv2",tv2)),
	vtv2),
	("mk_simple_term 2",
	mk_simple_term,
	(Const("c1",BOOL)),
	c1),
	("mk_simple_term 3",
	mk_simple_term,
	(App(c6,vtv1)),
	cm1),
	("mk_simple_term 4",
	mk_simple_term,
	(Simpleλ(v1,cm3)),
	a1)
	];

store_mt_results mt_run_fail [
	("mk_simple_term 3005",
	mk_simple_term,
	App(c6, c6),
	gen_fail_msg "mk_simple_term" 3005 [pr_term c6,pr_term c6]),
	("mk_simple_term 3006",
	mk_simple_term,
	App(c1, c1),
	gen_fail_msg "mk_simple_term" 3006 [pr_term c1]),
	("mk_simple_term 3007 a",
	mk_simple_term,
	Simpleλ(c1, c1),
	gen_fail_msg "mk_simple_term" 3007 [pr_term c1]),
	("mk_simple_term 3007 b",
	mk_simple_term,
	Simpleλ(cm1, c1),
	gen_fail_msg "mk_simple_term" 3007 [pr_term(mk_app(c6,vtv1))]),
	("mk_simple_term 3007 c",
	mk_simple_term,
	Simpleλ(a1, c1),
	gen_fail_msg "mk_simple_term" 3007 [pr_term a1])
	];


=TEX
\subsubsection{type\_of}
=SML
store_mt_results (mt_runf (op =:)) [
	("type_of 1",
	type_of,
	c1,
	BOOL),
	("type_of 2",
	type_of,
	vtv1,
	tv1),
	("type_of 3",
	type_of,
	cm3,
	mk_ctype("triple",[tv1,tv2,tv3])),
	("type_of 4",
	type_of,
	a1,
	mk_→_type(BOOL,mk_ctype("triple",[tv1,tv2,tv3])))
	];
=TEX
\subsubsection{dest\_var}
=SML
store_mt_results (mt_runf =*:)[
	("dest_var 1",
	dest_var,
	vtv1,
	("vtv1",tv1)),
	("dest_var 2",
	dest_var,
	mk_var("",BOOL),
	("",BOOL))
	];

store_mt_results mt_run_fail [
	("dest_var 3007 a",
	dest_var,
	c1,
	gen_fail_msg "dest_var" 3007 [pr_term c1]),
	("dest_var 3007 b",
	dest_var,
	a1,
	gen_fail_msg "dest_var" 3007 [pr_term a1]),
	("dest_var 3007 c",
	dest_var,
	cm1,
	gen_fail_msg "dest_var" 3007 [pr_term(mk_app(c6,vtv1))])
	];
=TEX
\subsubsection{mk\_var}
=SML
store_mt_results (mt_runf =*:)[
	("mk_var 1",
	dest_var o mk_var,
	("vtv1",tv1),
	("vtv1",tv1)),
	("mk_var 2",
	dest_var o mk_var,
	(" vtv1",BOOL),
	(" vtv1",BOOL)),
	("mk_var 3",
	dest_var o mk_var,
	("",BtoN),
	("",BtoN))
	];
=TEX
\subsubsection{is\_var}
=SML
store_mt_results mt_run[
	("is_var 1",
	is_var,
	v1,
	true),
	("is_var 2",
	is_var,
	c1,
	false),
	("is_var 3",
	is_var,
	cm1,
	false),
	("is_var 4",
	is_var,
	a1,
	false)
	];
=TEX
\subsubsection{dest\_const}
=SML
store_mt_results (mt_runf =*:)[
	("dest_const 1",
	dest_const,
	c1,
	("c1",BOOL)),
	("dest_const 2",
	dest_const,
	mk_const("",BOOL),
	("",BOOL))
	];

store_mt_results mt_run_fail [
	("dest_const 3009 a",
	dest_const,
	v1,
	gen_fail_msg "dest_const" 3009 [pr_term v1]),
	("dest_const 3009 b",
	dest_const,
	a1,
	gen_fail_msg "dest_const" 3009 [pr_term a1]),
	("dest_const 3009 c",
	dest_const,
	cm1,
	gen_fail_msg "dest_const" 3009 [pr_term(mk_app(c6,vtv1))])
	];
=TEX
\subsubsection{mk\_const}
=SML
store_mt_results (mt_runf =*:)[
	("mk_const 1",
	dest_const o mk_const,
	("cn1",tv1),
	("cn1",tv1)),
	("mk_const 2",
	dest_const o mk_const,
	(" cn1",BOOL),
	(" cn1",BOOL)),
	("mk_const 3",
	dest_const o mk_const,
	("",BtoN),
	("",BtoN))
	];
store_mt_results mt_run_fail [
	("mk_const 3002",
	mk_const,
	("=",BOOL),
	gen_fail_msg "mk_const" 3002 []),
	("mk_const 3003",
	mk_const,
	("⇒",BOOL),
	gen_fail_msg "mk_const" 3003 []),
	("mk_const 3004 a",
	mk_const,
	("∀",BOOL),
	gen_fail_msg "mk_const" 3004 ["∀"]),
	("mk_const 3004 b",
	mk_const,
	("∃",BOOL),
	gen_fail_msg "mk_const" 3004 ["∃"])];

=TEX
\subsubsection{is\_const}
=SML
store_mt_results mt_run[
	("is_const 1",
	is_const,
	v1,
	false),
	("is_const 2",
	is_const,
	c1,
	true),
	("is_const 3",
	is_const,
	cm1,
	false),
	("is_const 4",
	is_const,
	a1,
	false)
	];
=TEX
\subsubsection{dest\_app}
=SML
store_mt_results (mt_runf =**$)[
	("dest_app 1",
	dest_app,
	cm1,
	(c6,vtv1)),
	("dest_app 2",
	dest_app,
	cm3,
	(cm2,vtv3))
	];

store_mt_results mt_run_fail [
	("dest_app 3010 a",
	dest_app,
	v1,
	gen_fail_msg "dest_app" 3010 [pr_term v1]),
	("dest_app 3010 b",
	dest_app,
	a1,
	gen_fail_msg "dest_app" 3010 [pr_term a1]),
	("dest_app 3010 c",
	dest_app,
	c1,
	gen_fail_msg "dest_app" 3010 [pr_term c1])
	];
=TEX
\subsubsection{mk\_app}
=SML
store_mt_results (mt_runf =**$)[
	("mk_app 1",
	dest_app o mk_app,
	(c6,vtv1),
	(c6,vtv1)),
	("mk_app 2",
	dest_app o mk_app,
	(cm2,vtv3),
	(cm2,vtv3))
	];

store_mt_results mt_run_fail [
	("mk_app 3005",
	mk_app,
	(c6,c1),
	gen_fail_msg "mk_app" 3005 [pr_term c6,pr_term c1]),
	("mk_app 3006",
	mk_app,
	(c1,c1),
	gen_fail_msg "mk_app" 3006 [pr_term c1])
	];

=TEX
\subsubsection{is\_app}
=SML
store_mt_results mt_run[
	("is_app 1",
	is_app,
	v1,
	false),
	("is_app 2",
	is_app,
	c1,
	false),
	("is_app 3",
	is_app,
	cm1,
	true),
	("is_app 4",
	is_app,
	a1,
	false)
	];
=TEX
\subsubsection{list\_mk\_app}
=SML
store_mt_results (mt_runf (op =$)) [
	("list_mk_app 1",
	list_mk_app,
	(c6, [vtv1, vtv2, vtv3]),
	cm3),
	("list_mk_app 2",
	list_mk_app,
	(c6, []),
	c6),
	("list_mk_app 3",
	list_mk_app,
	(c1, []),
	c1)
	];

store_mt_results mt_run_fail [
	("list_mk_app 3005",
	list_mk_app,
	(c6,[vtv1, c6,vtv3]),
	gen_fail_msg "mk_app" 3005 [pr_term(mk_app(c6,vtv1)),pr_term c6]),
	("list_mk_app 3006",
	list_mk_app,
	(c6,[vtv1, vtv2, vtv3, c1]),
	gen_fail_msg "mk_app" 3006 [pr_term cm3])
	];
=TEX
\subsubsection{strip\_app}
=SML
fun =*$$ ((a,b),(c,d)) = (a =$ c) andalso list_eq (op =$) (b, d);

store_mt_results (mt_runf =*$$)[
	("strip_app 1",
	strip_app,
	cm3,
	(c6, [vtv1, vtv2, vtv3])),
	("strip_app 2",
	strip_app,
	c1,
	(c1, []))
	];
=TEX
\subsubsection{dest\_simple\_λ}
=SML
store_mt_results (mt_runf =**$)[
	("dest_simple_λ 1",
	dest_simple_λ,
	a1,
	(v1,cm3)),
	("dest_simple_λ 2",
	dest_simple_λ,
	a4,
	(iv1,c2))
	];

store_mt_results mt_run_fail [
	("dest_simple_λ 3011 a",
	dest_simple_λ,
	v1,
	gen_fail_msg "dest_simple_λ" 3011 [pr_term v1]),
	("dest_simple_λ 3011 b",
	dest_simple_λ,
	cm1,
	gen_fail_msg "dest_simple_λ" 3011 [pr_term(mk_app(c6,vtv1))]),
	("dest_simple_λ 3011 c",
	dest_simple_λ,
	c1,
	gen_fail_msg "dest_simple_λ" 3011 [pr_term c1])
	];
=TEX
\subsubsection{mk\_simple\_λ}
=SML
store_mt_results (mt_runf =**$)[
	("mk_simple_λ 1",
	dest_simple_λ o mk_simple_λ,
	(v1, cm3),
	(v1, cm3)),
	("mk_λ 2",
	dest_simple_λ o mk_simple_λ,
	(iv1, c2),
	(iv1, c2))
	];

store_mt_results mt_run_fail [
	("mk_simple_λ 3007 a",
	mk_simple_λ,
	(c6,c6),
	gen_fail_msg "mk_simple_λ" 3007 [pr_term c6]),
	("mk_simple_λ 3007 b",
	mk_simple_λ,
	(a1,c6),
	gen_fail_msg "mk_simple_λ" 3007 [pr_term a1]),
	("mk_simple_λ 3007 c",
	mk_simple_λ,
	(cm1,c6),
	gen_fail_msg "mk_simple_λ" 3007 [pr_term(mk_app(c6,vtv1))])
	];

=TEX
\subsubsection{is\_simple\_λ}
=SML
store_mt_results mt_run[
	("is_simple_λ 1",
	is_simple_λ,
	v1,
	false),
	("is_simple_λ 2",
	is_simple_λ,
	c1,
	false),
	("is_simple_λ 3",
	is_simple_λ,
	cm1,
	false),
	("is_simple_λ 4",
	is_simple_λ,
	a1,
	true)
	];
=TEX
\subsubsection{list\_mk\_simple\_λ}
=SML
store_mt_results (mt_runf (op =$)) [
	("list_mk_simple_λ 1",
	list_mk_simple_λ,
	([vtv1, vtv2, vtv3], c6),
	mk_simple_λ(vtv1,mk_simple_λ(vtv2,mk_simple_λ(vtv3,c6)))),
	("list_mk_simple_λ 2",
	list_mk_simple_λ,
	([], c6),
	c6)
	];

store_mt_results mt_run_fail [
	("list_mk_simple_λ 3007",
	list_mk_simple_λ,
	([vtv1, c6,vtv3],c6),
	gen_fail_msg "mk_simple_λ" 3007 [pr_term c6])
	];
=TEX
\subsubsection{frees}
=SML
store_mt_results (mt_runf (list_eq (op =$))) [
	("frees 1",
	frees,
	cm3,
	[vtv3, vtv2, vtv1]),
	("frees 2",
	frees,
	mk_simple_λ(vtv2,cm3),
	[vtv3, vtv1]),
	("frees 3",
	frees,
	mk_eq(vtv1,vtv1),
	[vtv1])
	];
=TEX
\subsubsection{is\_free\_var\_in}
Test 2 fails for issue 1.7 of \cite{DS/FMU/IED/IMP003} due to a bug in the implementation,
but correct thereafter.
=SML
store_mt_results mt_run[
	("is_free_var_in 1",
	is_free_var_in (dest_var vtv2),
	cm3,
	true),
	("is_free_var_in 2",
	is_free_var_in (dest_var vtv2),
	mk_simple_λ(vtv2,cm3),
	false),
	("is_free_var_in 3",
	is_free_var_in (dest_var vtv2),
	mk_app(mk_simple_λ(vtv2,cm3), vtv2),
	true),
	("is_free_var_in 4",
	is_free_var_in (dest_var vtv2),
	mk_eq(vtv2,vtv2),
	true)
	];
=TEX
\subsubsection{Generic Monotone Functions}
=SML
let
	val not_fn = mk_mon_op "not" 3007 (
		fn ty => mk_var("not",mk_→_type(BOOL,BOOL)));
in	
(store_mt_results (mt_runf (op =$)) [
	("mk_mon_op 1",
	not_fn,
	mk_t,
	mk_app(mk_var("not",mk_→_type(BOOL,BOOL)), mk_t))
	];
store_mt_results mt_run_fail [
	("mk_mon_op fail",
	not_fn,
	vtv1,
	gen_fail_msg "not" 3007 [pr_term vtv1])
	])
end;
=TEX
=SML
let
	val dest_not = dest_mon_op "dest_not" 3007 "not";
in	
(store_mt_results (mt_runf (op =$)) [
	("dest_mon_op 1",
	dest_not,
	mk_app(mk_const("not",mk_→_type(BOOL,BOOL)), mk_t),
	mk_t)
	];
store_mt_results mt_run_fail [
	("dest_mon_op fail",
	dest_not,
	vtv1,
	gen_fail_msg "dest_not" 3007 [pr_term vtv1])
	])
end;
=TEX
=SML
store_mt_results mt_run[
	("is_mon_op 1",
	is_mon_op "not",
	mk_app(mk_const("not",mk_→_type(BOOL,BOOL)), mk_t),
	true),
	("is_mon_op 2",
	is_mon_op "not",
	c1,
	false)
	];
=TEX
We leave the testing of generic functions $mk\_bin\_op$, $equality$, $quantifier$ and their like to the testing
of the functions that use them in their implementation.
\subsubsection{Concerning Equality}
=SML
store_mt_results (mt_runf (op =$)) [
	("mk_eq 1",
	mk_eq,
	(c1,v1),
	list_mk_app (BeqB, [c1,v1])),
	("mk_eq 2",
	mk_eq,
	(c1,c1),
	list_mk_app (BeqB, [c1,c1]))
	];

store_mt_results mt_run_fail [
	("mk_eq 3012",
	mk_eq,
	(c1, c2),
	gen_fail_msg "mk_eq" 3012 [pr_term c1,pr_term c2])
	];

store_mt_results (mt_runf =**$)[
	("dest_eq 1",
	dest_eq o mk_eq,
	(c1,v1),
	(c1,v1)),
	("dest_eq 2",
	dest_eq o mk_eq,
	(c1,c1),
	(c1,c1))
	];

store_mt_results mt_run_fail [
	("dest_eq 3014",
	dest_eq,
	c1,
	gen_fail_msg "dest_eq" 3014 [pr_term c1])
	];

store_mt_results mt_run[
	("is_eq 1",
	is_eq,
	eq1,
	true),
	("is_eq 2",
	is_eq,
	c1,
	false)
	];
=TEX
\subsubsection{Concerning ⇒}
=SML
store_mt_results (mt_runf (op =$)) [
	("mk_⇒",
	mk_⇒,
	(T,F),
	list_mk_app(⇒,[T,F]))
	];

store_mt_results mt_run_fail [
	("mk_⇒ 3015",
	mk_⇒,
	(mk_t,c3),
	gen_fail_msg "mk_⇒" 3015 ["",pr_term c3]),
	("mk_⇒ 3031",
	mk_⇒,
	(c3,mk_t),
	gen_fail_msg "mk_⇒" 3031 [pr_term c3])
	];

store_mt_results (mt_runf =**$)[
	("dest_⇒",
	dest_⇒ o mk_⇒,
	(T,F),
	(T,F))
	];

store_mt_results mt_run_fail [
	("dest_⇒ 3016",
	dest_⇒,
	c1,
	gen_fail_msg "dest_⇒" 3016 [pr_term c1])
	];

store_mt_results mt_run[
	("is_⇒ 1",
	is_⇒,
	mk_⇒(T,F),
	true),
	("is_⇒ 2",
	is_⇒,
	c1,
	false)
	];

store_mt_results (mt_runf (op =$)) [
	("list_mk_⇒ 1",
	list_mk_⇒,
	[T],
	T),
	("list_mk_⇒ 2",
	list_mk_⇒,
	[T,F],
	mk_⇒(T,F)),
	("list_mk_⇒ 3",
	list_mk_⇒,
	[T,F,c1],
	mk_⇒(T,mk_⇒(F,c1)))
	];

store_mt_results mt_run_fail [
	("list_mk_⇒ 3017",
	list_mk_⇒,
	[],
	gen_fail_msg "list_mk_⇒" 3017 []),
	("list_mk_⇒ 3031",
	list_mk_⇒,
	[vtv1, mk_t],
	gen_fail_msg "list_mk_⇒" 3031 [pr_term vtv1]),
	("list_mk_⇒ 3015",
	list_mk_⇒,
	[mk_t, vtv1],
	gen_fail_msg "list_mk_⇒" 3015 ["",pr_term vtv1])
	];

store_mt_results (mt_runf (list_eq (op =$))) [
	("strip_⇒ 1",
	strip_⇒,
	mk_⇒(T,F),
	[T,F]),
	("strip_⇒ 2",
	strip_⇒,
	vtv1,
	[vtv1])];
=TEX
\subsubsection{Concerning ∀}
=SML
store_mt_results (mt_runf (op =$)) [
	("mk_simple_∀",
	mk_simple_∀,
	(vtv1, c1),
	mk_app(quantifier "∀" tv1 BOOL,
		mk_simple_λ(vtv1, c1)))
	];

store_mt_results mt_run_fail [
	("mk_simple_∀ 3007",
	mk_simple_∀,
	(c1,c1),
	gen_fail_msg "mk_simple_∀" 3007 [pr_term c1]),
	("mk_simple_∀ 3015",
	mk_simple_∀,
	(v1,c2),
	gen_fail_msg "mk_simple_∀" 3015 ["",pr_term c2])
	];

store_mt_results (mt_runf =**$)[
	("dest_simple_∀",
	dest_simple_∀ o mk_simple_∀,
	(vtv1, c1),
	(vtv1, c1))
	];

store_mt_results mt_run_fail [
	("dest_simple_∀ 3032",
	dest_simple_∀,
	c1,
	gen_fail_msg "dest_simple_∀" 3032 [pr_term c1])
	];

store_mt_results mt_run[
	("is_simple_∀ 1",
	is_simple_∀,
	mk_simple_∀ (v1,F),
	true),
	("is_simple_∀ 2",
	is_simple_∀,
	c1,
	false)
	];

store_mt_results (mt_runf (op =$)) [
	("list_mk_simple_∀ 1",
	list_mk_simple_∀,
	([vtv1, vtv2], c1),
	mk_simple_∀(vtv1,mk_simple_∀(vtv2,c1))),
	("list_mk_simple_∀ 2",
	list_mk_simple_∀,
	([], c1),
	c1)
	];

store_mt_results mt_run_fail [
	("list_mk_simple_∀ 3007",
	list_mk_simple_∀,
	([v1,c1],c1),
	gen_fail_msg "mk_simple_∀" 3007 [pr_term c1]),
	("list_mk_simple_∀ 3015",
	list_mk_simple_∀,
	([v1],c2),
	gen_fail_msg "mk_simple_∀" 3015 ["",pr_term c2])
	];

=TEX
\subsubsection{Concerning ∃}
=SML
store_mt_results (mt_runf (op =$)) [
	("mk_simple_∃",
	mk_simple_∃,
	(vtv1, c1),
	mk_app(quantifier "∃" tv1 BOOL,
		mk_simple_λ(vtv1, c1)))
	];

store_mt_results mt_run_fail [
	("mk_simple_∃ 3007",
	mk_simple_∃,
	(c1,c1),
	gen_fail_msg "mk_simple_∃" 3007 [pr_term c1]),
	("mk_simple_∃ 3015",
	mk_simple_∃,
	(v1,c2),
	gen_fail_msg "mk_simple_∃" 3015 ["",pr_term c2])
	];

store_mt_results (mt_runf =**$) [
	("dest_simple_∃",
	dest_simple_∃ o mk_simple_∃,
	(vtv1, c1),
	(vtv1, c1))
	];

store_mt_results mt_run_fail [
	("dest_simple_∃ 3034",
	dest_simple_∃,
	c1,
	gen_fail_msg "dest_simple_∃" 3034 [pr_term c1])
	];

store_mt_results mt_run[
	("is_simple_∃ 1",
	is_simple_∃,
	mk_simple_∃ (v1,F),
	true),
	("is_simple_∃ 2",
	is_simple_∃,
	c1,
	false)
	];

store_mt_results (mt_runf (op =$)) [
	("list_mk_simple_∃ 1",
	list_mk_simple_∃,
	([vtv1, vtv2], c1),
	mk_simple_∃(vtv1,mk_simple_∃(vtv2,c1))),
	("list_mk_simple_∃ 2",
	list_mk_simple_∃,
	([], c1),
	c1)
	];

store_mt_results mt_run_fail [
	("list_mk_simple_∃ 3007",
	list_mk_simple_∃,
	([v1,c1],c1),
	gen_fail_msg "mk_simple_∃" 3007 [pr_term c1]),
	("list_mk_simple_∃ 3015",
	list_mk_simple_∃,
	([v1],c2),
	gen_fail_msg "mk_simple_∃" 3015 ["",pr_term c2])
	];

=TEX
\subsubsection{Concerning Numbers}
=SML
store_mt_results (mt_runf (op =$)) [
	("mk_ℕ 2",
	(mk_ℕ o integer_of_int),
	2,
	mk_const("2",ℕ))
	];

store_mt_results mt_run_fail [
	("mk_ℕ 3021",
	(mk_ℕ o integer_of_int),
	~3,
	gen_fail_msg "mk_ℕ" 3021 [string_of_int ~3])
	];

store_mt_results mt_run[
	("is_ℕ 1",
	is_ℕ,
	N0,
	true),
	("is_ℕ 2",
	is_ℕ,
	mk_const("N0",ℕ),
	false)
	];

store_mt_results mt_run[
	("dest_ℕ 1",
	dest_ℕ,
	N2,
	@@"2")
	];

store_mt_results mt_run_fail [
	("dest_ℕ 3026 a",
	dest_ℕ,
	mk_const("N0",ℕ),
	gen_fail_msg "dest_ℕ" 3026 [pr_term(mk_const("N0",ℕ))]),
	("dest_ℕ 3026 b",
	dest_ℕ,
	v1,
	gen_fail_msg "dest_ℕ" 3026 [pr_term v1])
	];

=TEX
\subsubsection{Concerning Characters}
=SML
store_mt_results (mt_runf (op =$)) [
	("mk_char 1",
	mk_char,
	"a",
	mk_const("`a",CHAR))
	];

store_mt_results mt_run_fail [
	("mk_char 3023 a",
	mk_char,
	"abc",
	gen_fail_msg "mk_char" 3023 ["abc"]),
	("mk_char 3023 b",
	mk_char,
	"",
	gen_fail_msg "mk_char" 3023 [""])
	];

store_mt_results mt_run[
	("is_char 1",
	is_char,
	ccc,
	true),
	("is_char 2",
	is_char,
	mk_const("ab",CHAR),
	false),
	("is_char 3",
	is_char,
	mk_const("'ab",CHAR),
	false),
	("is_char 4",
	is_char,
	mk_const("`ab",CHAR),
	false)
	];

store_mt_results mt_run[
	("dest_char 1",
	dest_char,
	ccc,
	"c")
	];

store_mt_results mt_run_fail [
	("dest_char 3024 a",
	dest_char,
	mk_const("N0",CHAR),
	gen_fail_msg "dest_char" 3024 [pr_term(mk_const("N0",CHAR))]),
	("dest_char 3024 b",
	dest_char,
	mk_const("'ab",CHAR),
	gen_fail_msg "dest_char" 3024 [pr_term(mk_const("'ab",CHAR))]),
	("dest_char 3024 c",
	dest_char,
	v1,
	gen_fail_msg "dest_char" 3024 [pr_term v1])
	];

=TEX
\subsubsection{Concerning Strings}
Note that tests for $dest\_string$ fail for issue 1.7
of \cite{DS/FMU/IED/IMP003}, due to a bug in the implementation, fixed in later verisons.
=SML
store_mt_results (mt_runf (op =$)) [
	("mk_string 1",
	mk_string,
	"abc",
	mk_const("\"abc",STRING)),
	("mk_string 2",
	mk_string,
	"",
	mk_const("\"",STRING))
	];

store_mt_results mt_run[
	("is_string 1",
	is_string,
	sc_abc,
	true),
	("is_string 2",
	is_string,
	mk_const("ab",STRING),
	false)
	];

store_mt_results mt_run[
	("dest_string 1",
	dest_string,
	sc_abc,
	"abc")
	];

store_mt_results mt_run_fail [
	("dest_string 3025 a",
	dest_string,
	mk_const("N0",STRING),
	gen_fail_msg "dest_string" 3025 [pr_term(mk_const("N0",STRING))]),
	("dest_string 3025 b",
	dest_string,
	v1,
	gen_fail_msg "dest_string" 3025 [pr_term v1])
	];


=TEX
\subsubsection{~=$\$$}
=SML
store_mt_results mt_run[
	("~=$ 1",
	(op ~=$),
	(vtv1, c1),
	false),
	("~=$ 2",
	(op ~=$),
	(vtv1, vtv1),
	true),
	("~=$ 3",
	(op ~=$),
	(mk_simple_λ(v1,c1), mk_simple_λ(av1,c1)),
	true),
	("~=$ 4",
	(op ~=$),
	(mk_simple_λ(v1,v1), mk_simple_λ(av1,av1)),
	true),
	("~=$ 5",
	(op ~=$),
	(mk_simple_λ(v1,v1), mk_simple_λ(av1,v1)),
	false),
	("~=$ 6",
	(op ~=$),
	(mk_simple_λ(v1,v1), mk_simple_λ(v1,av1)),
	false),
	("~=$ 7",
	(op ~=$),
	(mk_simple_λ(v1,v1), mk_simple_λ(vtv1,vtv1)),
	false)
	];

=TEX
\subsubsection{string\_variant}
=SML
store_mt_results mt_run[
	("string_variant 1",
	string_variant [],
	"s1",
	"s1"),
	("string_variant 2",
	string_variant ["s1","s2","s3"],
	"s2",
	"s2'"),
	("string_variant 3",
	string_variant ["s2'","s1","s2","s3"],
	"s2",
	"s2''")	];

store_mt_results mt_run[
	("get_variant_suffix 1",
	get_variant_suffix,
	(),
	"'")];

store_mt_results mt_run[
	("set_variant_suffix 1",
	set_variant_suffix,
	"_var",
	"'")];

store_mt_results mt_run[
	("get_variant_suffix 2",
	get_variant_suffix,
	(),
	"_var")];

store_mt_results mt_run_fail [
	("set_variant_suffix 3028",
	set_variant_suffix,
	"",
	gen_fail_msg "variant_suffix" 3028 [])
	];

store_mt_results mt_run[
	("string_variant 4",
	string_variant ["s1","s2","s3","s2'"],
	"s2",
	"s2_var"),
	("string_variant 5",
	string_variant ["s1","s2","s3","s2_var"],
	"s2",
	"s2_var_var")
	];

store_mt_results mt_run[
	("set_variant_suffix 2",
	set_variant_suffix,
	"'",
	"_var")
	];

=TEX
\subsubsection{rename}
=SML
store_mt_results (mt_runf (op =$)) [
	("rename 1",
	rename ("v1",BOOL) "renamed_v1",
	mk_simple_∃(v1, av1),
	mk_simple_∃(v1, av1)),
	("rename 2",
	rename ("v1",BOOL) "renamed_v1",
	mk_⇒(v1,mk_simple_∃(v1, v1)),
	mk_⇒(mk_var("renamed_v1",BOOL),mk_simple_∃(v1, v1))),
	("rename 3",
	rename ("v1",BOOL) "renamed_v1",
	mk_simple_∃(av1, v1),
	mk_simple_∃(av1, (mk_var("renamed_v1",BOOL))))
	];
=TEX
\subsubsection{list\_string\_variant}
=SML
store_mt_results mt_run[
	("list_string_variant 1",
	list_string_variant [],
	["s1", "s2"],
	["s1", "s2"]),
	("list_string_variant 2",
	list_string_variant ["s1","s2","s3"],
	["s3", "s2"],
	["s3'", "s2'"]),
	("list_string_variant 3",
	list_string_variant ["s2'","s1","s2","s3"],
	["s1", "s2", "s2'", "s1'"],
	["s1'", "s2''", "s2'''", "s1''"])	];
=TEX
\subsubsection{term\_types}
=SML
store_mt_results (mt_runf (list_eq (op =:)))[
	("term_types 1",
	term_types,
	cm3,
	[type_of c6, tv1, tv2, tv3]),
	("term_types 2",
	term_types,
	a1,
	[BOOL, type_of c6, tv1, tv2, tv3])
	];
=TEX
\subsubsection{term\_tyvars}
=SML
store_mt_results mt_run[
	("term_tyvars 1",
	term_tyvars,
	cm3,
	["'tv1", "'tv2", "'tv3"])
	];
=TEX
\subsubsection{term\_tycons}
=SML
store_mt_results mt_run[
	("term_tycons 1",
	term_tycons,
	cm3,
	[("→", 2), ("triple", 3)]),
	("term_tycons 2",
	term_tycons,
	vtv1,
	[])
	];
=TEX
\subsubsection{term\_consts}
=SML
store_mt_results (mt_runf (list_eq (op =*:))) [
	("term_consts 1",
	term_consts,
	cm3,
	[dest_const c6]),
	("term_consts 2",
	term_consts,
	mk_eq(T,T),
	[("=",mk_→_type(BOOL,mk_→_type(BOOL,BOOL))), ("T",BOOL)])
	];
=TEX
\subsubsection{term\_vars}
=SML
store_mt_results (mt_runf (list_eq =*:))[
	("term_vars 1",
	term_vars,
	cm3,
	map dest_var [vtv1,vtv2,vtv3]),
	("term_vars 2",
	term_vars,
	mk_eq(T,T),
	[])
	];
=TEX
\subsubsection{type\_match}
=SML
store_mt_results (mt_runf (list_eq =**:))[
	("type_match 1",
	type_match BOOL,
	tv1,
	[(BOOL,tv1)]),
	("type_match 2",
	type_match BtoN,
	mk_→_type(tv1,tv2),
	[(ℕ,tv2),(BOOL,tv1)]),
	("type_match 3",
	type_match (mk_→_type(tv1,tv2)),
	mk_→_type(tv2,tv1),
	[(tv2,tv1),(tv1,tv2)]),
	("type_match 4",
	type_match (mk_→_type(tv1,mk_→_type(tv2,tv1))),
	mk_→_type(tv2,mk_→_type(tv1,tv2)),
	[(tv2,tv1),(tv1,tv2)]),
	("type_match 5",
	type_match (mk_→_type(tv2,mk_→_type(tv2,tv2))),
	mk_→_type(tv2,mk_→_type(tv1,tv2)),
	[(tv2,tv1)]),
	("type_match 6",
	type_match BtoN,
	BtoN,
	[]),
	("type_match 7",
	type_match (tv2 cross tv2),
	(tv1 cross tv2),
	[(tv2,tv1)])
	];

let
	val tv1_tv1 = mk_→_type(tv1,tv1);
	val tv1_tv2_tv1 = mk_→_type(tv1,mk_→_type(tv2,tv1));

	val BOOL_tv2_BN = mk_→_type(BOOL,mk_→_type(tv2,BN));
in
store_mt_results mt_run_fail [
	("type_match 3053 a",
	type_match BOOL,
	BN,
	gen_fail_msg "type_match" 3053 [pr_type BOOL,pr_type BN]),
	("type_match 3053 b",
	type_match BtoN,
	tv1_tv1,
	gen_fail_msg "type_match" 3053 [pr_type BtoN,pr_type tv1_tv1]),
	("type_match 3053 c",
	type_match BOOL_tv2_BN,
	tv1_tv2_tv1,
	gen_fail_msg "type_match" 3053 [pr_type BOOL_tv2_BN,
		pr_type tv1_tv2_tv1])
	]
end;
=TEX
\subsubsection{type\_match1}
=SML
store_mt_results (mt_runf (list_eq =**:))[
	("type_match1 1",
	type_match1 [] BtoN,
	mk_→_type(tv1,tv2),
	[(ℕ,tv2),(BOOL,tv1)]),
	("type_match1 2",
	type_match1 [(BOOL,tv1)] BtoN,
	mk_→_type(tv1,tv2),
	[(ℕ,tv2),(BOOL,tv1)])
	];
=TEX
=SML
store_mt_results mt_run_fail [
	("type_match 3055 a",
	type_match1 [] BtoN,
	BN,
	gen_fail_msg "type_match1" 3055 [pr_type BtoN,pr_type BN]),
	("type_match 3055 b",
	type_match1 [(ℕ,tv1)] BtoN,
	mk_→_type(tv1,tv2),
	gen_fail_msg "type_match1" 3055 [pr_type BtoN,pr_type (mk_→_type(tv1,tv2))])
	];
=TEX
=SML
store_mt_results mt_run_fail [
	("type_match 3019 a",
	type_match1,
	[(tv1,ℕ)],
	gen_fail_msg "type_match1" 3019 [pr_type ℕ])
	];
=TEX
\subsubsection{term\_match}
=SML
let
fun aux ((a,b),(c,d)) = list_eq (op =**:) (a, c) andalso list_eq (op =**$) (b, d);
in
store_mt_results (mt_runf aux)[
	("term_match 1",
	term_match v1,
	v1,
	([],[])),
	("term_match 2",
	term_match v2,
	vtv1,
	([(mk_ctype("triple",[tv1,tv2,tv3]),tv1)],[(v2,
		mk_var("vtv1",mk_ctype("triple",[tv1,tv2,tv3])))])),
	("term_match 3",
	term_match (list_mk_app (mk_const("trio",mk_→_type(BOOL,mk_→_type(tv2,
		mk_→_type(tv3, (BOOL cross tv2))))),[v1, vtv2,vtv3])),
	list_mk_app ((mk_const("trio",mk_→_type(tv1,mk_→_type(tv2,mk_→_type(tv3,
	(tv1 cross tv2)))))),
	[vtv1, vtv2,vtv3]),	
	([(BOOL, tv1)],[(v1, mk_var("vtv1",BOOL))])),
	("term_match 4",
	term_match (mk_eq(T,F)),
	mk_eq(v1,av1),
	([],[(F,av1),(T,v1)])),
	("term_match 5",
	term_match (mk_var("v",tv2 cross tv2)),
	mk_var("v",tv1 cross tv2),
	([(tv2,tv1)],[])),
	("term_match 6",
	term_match (mk_simple_∃(v1,mk_⇒(v1,mk_var("a",BOOL)))),
	(mk_simple_∃(av1,mk_⇒(av1,mk_var("b",BOOL)))),
	([],[(mk_var("a",BOOL),mk_var("b",BOOL))])),
	("term_match 7",
	term_match (mk_app(ftv2,vtv2)),
	mk_app(ftv1,vtv1),
	([(tv2,tv1)],[(vtv2,mk_var("vtv1",tv2))]))

	]
end;
store_mt_results mt_run_fail [
	("term_match 3054 a",
	term_match mk_t,
	mk_f,
	gen_fail_msg "term_match" 3054 [pr_term T,pr_term F]),
	("term_match 3054 b",
	term_match a1,
	a2,
	gen_fail_msg "term_match" 3054 [pr_term a1,
		pr_term a2]),
	("term_match 3054 c",
	term_match (mk_eq(T,F)),
	mk_eq(v1,v1),
	gen_fail_msg "term_match" 3054 [pr_term(mk_eq(T,F)), pr_term(mk_eq(v1,v1))])
	];
=TEX
\subsubsection{is\_type\_instance}
=SML
store_mt_results mt_run[
	("is_type_instance 1",
	is_type_instance tv1,
	BOOL,
	false),
	("is_type_instance 2",
	is_type_instance BOOL,
	tv1,
	true)
	];
=TEX
\subsubsection{gen\_vars}
=SML
store_mt_results (mt_runf (list_eq (op =$))) [
	("gen_vars",
	gen_vars [BOOL, mk_→_type(BOOL,tv1),tv1,BOOL],
	[mk_var("@_2",tv1), mk_var("@_1",mk_→_type(tv1,BOOL)),
	(list_mk_app ((mk_const("@trio",mk_→_type(tv1,mk_→_type(tv2,mk_→_type(tv3,
	(tv1 cross tv2)))))),
	[vtv1, mk_var("@_4",tv2),vtv3])),
	mk_const("@_3",BOOL)],
	[mk_var("@_3",BOOL), mk_var("@_5",mk_→_type(BOOL,tv1)),
		mk_var("@_6",tv1),mk_var("@_7",BOOL)])
	];
=TEX
\subsubsection{variant}
=SML
store_mt_results (mt_runf (op =$)) [
	("variant 1",
	variant [],
	vtv1,
	vtv1),
	("variant 2",
	variant [vtv1],
	vtv1,
	mk_var("vtv1'",tv1)),
	("variant 3",
	variant [(vtv1),(mk_var("vtv1'",tv1))],
	vtv1,
	mk_var("vtv1''",tv1)),
	("variant 4",
	variant [mk_var("vtv1",tv2)],
	vtv1,
	mk_var("vtv1'",tv1))
	];

store_mt_results mt_run_fail [
	("variant 3007 a",
	variant[],
	c1,
	gen_fail_msg "variant" 3007 [pr_term c1]),
	("variant 3007 b",
	variant[c1],
	vtv1,
	gen_fail_msg "variant" 3007 [pr_term c1])
	];
=TEX
\subsubsection{list$\_$variant}
=SML
store_mt_results (mt_runf (list_eq (op =$))) [
	("list_variant 1",
	list_variant [],
	[vtv1],
	[vtv1]),
	("list_variant 2",
	list_variant [vtv1],
	[vtv1,vtv1],
	[mk_var("vtv1'",tv1), mk_var("vtv1''",tv1)]),
	("list_variant 3",
	list_variant [(vtv1),(mk_var("vtv1'",tv1))],
	[vtv1],
	[mk_var("vtv1''",tv1)]),
	("list_variant 4",
	list_variant [mk_var("vtv1",tv2)],
	[vtv1],
	[mk_var("vtv1'",tv1)])
	];

store_mt_results mt_run_fail [
	("list_variant 3007 a",
	list_variant[],
	[c1],
	gen_fail_msg "list_variant" 3007 [pr_term c1]),
	("list_variant 3007 b",
	list_variant[c1],
	[vtv1],
	gen_fail_msg "list_variant" 3007 [pr_term c1])
	];
=TEX
\subsubsection{is\_free\_in}
=SML
store_mt_results mt_run[
	("is_free_in 1",
	is_free_in vtv2,
	cm3,
	true),
	("is_free_in 2",
	is_free_in vtv2,
	mk_simple_λ(vtv2,cm3),
	false),
	("is_free_in 3",
	is_free_in vtv2,
	mk_app(mk_simple_λ(vtv2,cm3), vtv2),
	true),
	("is_free_in 4",
	is_free_in vtv2,
	mk_eq(vtv2,vtv2),
	true)
	];

store_mt_results mt_run_fail [
	("is_free_in 3007",
	is_free_in c1,
	c1,
	gen_fail_msg "is_free_in" 3007 [pr_term c1])
	];

=TEX
\subsubsection{var\_subst}
=SML
store_mt_results (mt_runf (op =$)) [
	("var_subst 1",
	var_subst [(T,v1)],
	c1,
	c1),
	("var_subst 2",
	var_subst [(T,v1)],
	v1,
	T),
	("var_subst 3",
	var_subst [(T,v1),(F,av1)],
	mk_eq(v1,av1),
	mk_eq(T,F)),
	("var_subst 4",
	var_subst [(T,v1),(F,v1)],
	mk_eq(v1,av1),
	mk_eq(T,av1)),
	("var_subst 5",
	var_subst [(T,v1),(F,av1)],
	mk_simple_∃(v1,av1),
	mk_simple_∃(v1,F)),
	("var_subst 6",
	var_subst [(T,v1),(F,av1)],
	mk_simple_∃(v1,v1),
	mk_simple_∃(v1,v1)),
	("var_subst 7",
	var_subst [(T,v1),(F,av1)],
	mk_simple_∃(mk_var("v1",ℕ),v1),
	mk_simple_∃(mk_var("v1",ℕ),T)),
	("var_subst 8",
	var_subst [(av1,v1)],
	mk_simple_∃(mk_var("av1",ℕ),v1),
	mk_simple_∃(mk_var("av1'",ℕ),av1)),
	("var_subst 9",
	var_subst [(T,v1),(F,av1)],
	mk_simple_∃(v1,mk_⇒(av1,v1)),
	mk_simple_∃(v1,mk_⇒(F,v1))),
	("var_subst 10",
	var_subst [(T,v1),(F,av1)],
	mk_simple_∃(v1,mk_⇒(v1,av1)),
	mk_simple_∃(v1,mk_⇒(v1,F)))

	];

store_mt_results mt_run_fail [
	("var_subst 3012",
	var_subst [(T,vtv1)],
	c1,
	gen_fail_msg "var_subst" 3012 [pr_term T,pr_term vtv1]),
	("var_subst 3007",
	var_subst [(T,c1)],
	c1,
	gen_fail_msg "var_subst" 3007 [pr_term c1])
	];
=TEX
\subsubsection{subst}
=SML
store_mt_results (mt_runf (op =$)) [
	("subst 1",
	subst [(T,v1)],
	c1,
	c1),
	("subst 2",
	subst [(T,v1)],
	v1,
	T),
	("subst 3",
	subst [(T,v1),(F,av1)],
	mk_eq(v1,av1),
	mk_eq(T,F)),
	("subst 4",
	subst [(T,v1),(F,v1)],
	mk_eq(v1,av1),
	mk_eq(T,av1)),
	("subst 5",
	subst [(T,v1),(F,av1)],
	mk_simple_∃(v1,av1),
	mk_simple_∃(v1,F)),
	("subst 6",
	subst [(T,v1),(F,av1)],
	mk_simple_∃(v1,v1),
	mk_simple_∃(v1,v1)),
	("subst 7",
	subst [(T,v1),(F,av1)],
	mk_simple_∃(mk_var("v1",ℕ),v1),
	mk_simple_∃(mk_var("v1",ℕ),T)),
	("subst 8",
	subst [(v1,mk_⇒(T,F))],
	(list_mk_⇒[T,F,T,F]),
	(list_mk_⇒[T,F,v1])),
	("subst 9",
	subst [(v1,mk_⇒(T,F))],
	mk_simple_λ(v1,list_mk_⇒[T,F,T,F]),
	(mk_simple_λ(mk_var("v1'",BOOL),list_mk_⇒[T,F,v1]))),
	("subst 10",
	subst [(T,v1),(F,av1)],
	mk_simple_∃(v1,mk_⇒(av1,v1)),
	mk_simple_∃(v1,mk_⇒(F,v1))),
	("subst 11",
	subst [],
	mk_simple_∃(v1,mk_⇒(av1,v1)),
	mk_simple_∃(v1,mk_⇒(av1,v1)))

	];

store_mt_results mt_run_fail [
	("subst 3012",
	subst [(T,vtv1)],
	c1,
	gen_fail_msg "subst" 3012 [pr_term T,pr_term vtv1])
	];
=TEX
\subsubsection{term\_map}
=SML
store_mt_results (mt_runf (op =$)) [
	("term_map 1",
	term_map replace_with_const,
	cm3,
	list_mk_app(c6,[mk_const("rwc_vtv1",tv1),
		mk_const("rwc_vtv2",tv2),
		mk_const("rwc_vtv3",tv3)])),
	("term_map 2",
	term_map replace_with_const,
	mk_⇒(T,F),
	mk_⇒(T,F)),
	("term_map 3",
	term_map replace_with_const,
	mk_⇒(v1,F),
	mk_⇒(mk_const("rwc_v1",BOOL),F)),
	("term_map 4",
	term_map replace_with_const,
	mk_simple_∃(vtv1,mk_app(ftv1,vtv1)),
	mk_simple_∃(vtv1,mk_app(mk_const("rwc_f",mk_→_type(tv1,BOOL)),vtv1)))
	];
=TEX
\subsubsection{term\_any}
=SML
store_mt_results mt_run[
	("term_any 1",
	term_any (fn x => is_const x andalso fst(dest_const x) = "T"),
	cm3,
	false),
	("term_any 2",
	term_any (fn x => is_const x andalso fst(dest_const x) = "c6"),
	cm3,
	true)
	];
=TEX
\subsubsection{inst}
=SML
store_mt_results (mt_runf (op =$)) [
	("inst 1",
	inst [mk_var("av1",tv1),mk_var("av2",tv2)] [(BOOL,tv1),(tv1,tv2)],
	cm3,
	list_mk_app(mk_const("c6", mk_→_type(BOOL,mk_→_type(tv1,
		mk_→_type(tv3,mk_ctype("triple",[BOOL,tv1,tv3]))))),
		[mk_var("vtv1",BOOL),
		 mk_var("vtv2",tv1),
		vtv3])),
	("inst 2",
	inst [mk_var("vtv2",tv1),mk_var("av2",tv2)] [(BOOL,tv1),(tv1,tv2)],
	cm3,
	list_mk_app(mk_const("c6", mk_→_type(BOOL,mk_→_type(tv1,
		mk_→_type(tv3,mk_ctype("triple",[BOOL,tv1,tv3]))))),
		[mk_var("vtv1",BOOL),
		 mk_var("vtv2'",tv1),
		vtv3])),
	("inst 3",
	inst [mk_var("vtv2",tv1),mk_var("av2",tv2)] [(BOOL,tv1),(tv1,tv2)],
	T,
	T),
	("inst 4",
	inst [mk_var("vtv2",tv1),mk_var("av2",tv2)] [],
	vtv1,
	vtv1),
	("inst 5",
	inst [mk_var("vtv2",tv1),mk_var("av2",tv2)] [(tv2,tv1)],
	mk_⇒(mk_app(ftv1,vtv1),mk_t),
	mk_⇒(mk_app(ftv2,mk_var("vtv1",tv2)),mk_t)),
	("inst 6",
	inst [mk_var("vtv2",tv1),mk_var("av2",tv2)] [(tv2,tv1)],
	mk_⇒(mk_t,mk_app(ftv1,vtv1)),
	mk_⇒(mk_t,mk_app(ftv2,mk_var("vtv1",tv2))))
,
	("inst 7",
	inst [mk_var("vtv2",tv1),mk_var("av2",tv2)] [(tv1,tv2)],
	mk_⇒(mk_app(ftv2,mk_var("vtv1",tv2)),mk_app(ftv1,vtv1)),
	mk_⇒(mk_app(mk_var("f'",mk_→_type(tv1,BOOL)),
	mk_var("vtv1'",tv1)),mk_app(ftv1,mk_var("vtv1",tv1))))
,
	("inst 8",
	inst[] [(BOOL, mk_vartype "'a")],
	mk_simple_λ(mk_var("x", BOOL), mk_var("x", mk_vartype "'a" )),
	mk_simple_λ(mk_var("x'", BOOL), mk_var("x", BOOL)))
	];
=TEX

=SML

store_mt_results mt_run_fail [
	("inst 3007",
	inst [c1],
	[],
	gen_fail_msg "inst" 3007 [pr_term c1]),
	("inst 3019",
	inst [],
	[(BOOL,BOOL)],
	gen_fail_msg "inst" 3019 [pr_type BOOL])
	];
=TEX
\subsubsection{term\_mem}
=SML
store_mt_results mt_run[
	("term_mem 1",
	(curry(op term_mem)) v1,
	[v2,v1],
	true),
	("term_mem 2",
	(curry(op term_mem)) (mk_simple_λ(v1,v1)),
	[mk_simple_λ(av1,av1),v2],
	true),
	("term_mem 3",
	(curry(op term_mem)) v1,
	[mk_simple_λ(av1,av1),v2],
	false)
	];
=TEX
\subsubsection{term\_less}
=SML
store_mt_results (mt_runf (list_eq (op =$))) [
	("term_less 1",
	(curry(op term_less)) [v2,v1],
	v1,
	[v2]),
	("term_less 2",
	(curry(op term_less)) [mk_simple_λ(av1,av1),v2],
	(mk_simple_λ(v1,v1)),
	[v2]),
	("term_less 3",
	(curry(op term_less)) [mk_simple_λ(av1,av1),v2],
	v1,
	[mk_simple_λ(av1,av1),v2])
	];
=TEX
\subsubsection{term\_grab}
=SML
store_mt_results (mt_runf (list_eq (op =$))) [
	("term_grab 1",
	(curry(op term_grab)) [v2,v1],
	v1,
	[v2,v1]),
	("term_grab 2",
	(curry(op term_grab)) [mk_simple_λ(av1,av1),v2],
	(mk_simple_λ(v1,v1)),
	[mk_simple_λ(av1,av1),v2]),
	("term_grab 3",
	(curry(op term_grab)) [mk_simple_λ(av1,av1),v2],
	v1,
	[v1,mk_simple_λ(av1,av1),v2])
	];

=TEX
\subsubsection{term\_union}
=SML
store_mt_results (mt_runf (list_eq (op =$))) [
	("term_union 1",
	(curry(op term_union)) [v2,v1],
	[v1],
	[v2,v1]),
	("term_union 2",
	(curry(op term_union)) [mk_simple_λ(av1,av1),v2],
	[(mk_simple_λ(v1,v1))],
	[v2,mk_simple_λ(v1,v1)]),
	("term_union 3",
	(curry(op term_union)) [mk_simple_λ(av1,av1),v2],
	[v1],
	[mk_simple_λ(av1,av1),v2,v1]),
	("term_union 4",
	(curry(op term_union)) [F,mk_simple_λ(av1,av1),v2],
	[v1,T,v2],
	[F,mk_simple_λ(av1,av1),v1,T,v2])
	];

=TEX
\subsubsection{list\_term\_union}
=SML
store_mt_results (mt_runf (list_eq (op =$))) [
	("list_term_union 1",
	list_term_union,
	[[v2,v1],[v1]],
	[v2,v1]),
	("list_term_union 2",
	list_term_union,
	[[mk_simple_λ(av1,av1),v2],[(mk_simple_λ(v1,v1))]],
	[v2,mk_simple_λ(v1,v1)]),
	("list_term_union 3",
	list_term_union,
	[[mk_simple_λ(av1,av1),v2],[v1]],
	[mk_simple_λ(av1,av1),v2,v1]),
	("list_term_union 4",
	list_term_union,
	[[F,mk_simple_λ(av1,av1),v2],[v1,T,v2]],
	[F,mk_simple_λ(av1,av1),v1,T,v2]),
	("list_term_union 5",
	list_term_union,
	[],
	[]),
	("list_term_union 6",
	list_term_union,
	[[T],[F,v2],[v1,F]],
	[T,v2,v1,F])
	];
=TEX
\subsection{Strings}
\subsubsection{string\_of\_term}
This will fail if the pretty-printer is not yet installed.
=SML
store_mt_results mt_run[
	("string_of_term",
	string_of_term,
	mk_eq(T,F),
	pr_term(mk_eq(T,F)))
	];
=TEX
\subsubsection{string\_of\_type}
This will fail if the pretty-printer is not yet installed.
=SML
store_mt_results mt_run[
	("string_of_type",
	string_of_type,
	mk_→_type(BOOL, BOOL),
	pr_type(mk_→_type(BOOL, BOOL)))
	];
=TEX
\subsubsection{term\_fail}
This will fail if the pretty-printer is not yet installed.
=SML
store_mt_results mt_run_fail [
	("term_fail",
	term_fail "term_fail" 3001,
	[mk_eq(T,F)],
	gen_fail_msg "term_fail" 3001 [pr_term(mk_eq(T,F))])
	];

=TEX
\subsubsection{type\_fail}
This will fail if the pretty-printer is not yet installed.
=SML
store_mt_results mt_run_fail [
	("type_fail",
	type_fail "type_fail" 3001,
	[BtoN],
	gen_fail_msg "type_fail" 3001 [pr_type BtoN])
	];

=TEX
\subsection{End of Tests}
=SML
diag_string(summarize_mt_results ());
=TEX
\section{UNTESTED ERROR MESSAGES}
\label{untested}
The following functions are not tested, on the assumption they are
each used to implement a function tested in this document,
which can be checked in \cite{DS/FMU/IED/IMP003}.
=GFT
mk_bin_op
dest_bin_op
is_bin_op
list_mk_bin_op
strip_bin_op
bin_bool_op
mk_simple_binder
dest_simple_binder
is_simple_binder
equality
=TEX
\end{document}



=IGN
********************************************************************************
mdt016.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  mdt016.doc ℤ $Date: 2006/12/09 15:37:32 $ $Revision: 2.19 $ $RCSfile: mdt016.doc,v $

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

\def\Title{Module Tests for Type Inference}

\def\AbstractText{This document comprises test cases and test data for the type inference mechanism.}

\def\Reference{DS/FMU/IED/MDT016}

\def\Author{D.J. King}


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
%% LaTeX2e port: \TPPtitle{Module Tests for Type Inference}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/MDT016}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 2.19 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2006/12/09 15:37:32 $%
%% LaTeX2e port: }}  %% Mandatory field (with sensible default)
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: %\TPPstatus{Approved}
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{D.J.~King & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{
%% LaTeX2e port: This document comprises test cases and test data for
%% LaTeX2e port: the type inference mechanism.}
%% LaTeX2e port: %\TPPabstractB{}
%% LaTeX2e port: %\TPPabstractC{}
%% LaTeX2e port: %\TPPabstractD{}
%% LaTeX2e port: %\TPPabstractE{}
%% LaTeX2e port: %\TPPabstractF{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port:       Library \\ R.D. Arthan\\ D.J. King}}
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

\pagebreak
\section{DOCUMENT CONTROL}
\subsection{Contents List}
\tableofcontents
\subsection{Document Cross References}
\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes History}  % to get section number `0.3'
\begin{description}

\item[Issue 1.1 (1991/05/30) - 1.6 (1991/08/07)]
Initial drafts.

\item[Issue 1.7 (1991/09/27)]
Changes made as required by desk check report ID0084.

\item[Issue 2.1 (1991/09/30)]
This is an approved version of issue 1.7.

\item[Issue 2.2 (1991/11/25) 21 November 1991]
Modified as a result of changes to the implementation
of type inference (Re: new unification algorithm). Also
renamed $ty\_to\_type$ to $make\_type$.

\item[Issue 2.3 (1991/11/29) (29 November 1991)]
Added additional miscellaneous tests which are known
to highlight various classes of problems in unification.


\item[Issue 2.4 (1992/01/20) (\FormatDate{92/01/20}) ] Updated to use new fonts.

\item[Issue 2.5 (1992/02/25) (\FormatDate{92/02/25}) ]
Change the function $mt\_run\_fail1$ to bring into
line with the new exception message when a
type checking error occurs.

\item [Issue 2.6 (1992/02/26) (8th April 1992)]
Changes required by CR0016.

\item [Issue 2.7 (1992/04/09) (14th April 1992)]
Changes required by CR0017.

\item [Issue 2.9 (1992/05/13) (13th May 1992)]
Added tests to test for handling of overloaded alises.

\item[Issue 2.10 (1992/05/15) (15 May 1992)] Use correct quotation symbols.
\item[Issue 2.11 (1992/10/27) (27 October 1992)] Rules for nested quotations now different.

\item[Issue 2.12 (1996/01/25) (22nd January 1995)] Made test output messages compatible with build process.
\item[Issue 2.13 (1999/02/24)]
Update for SML'97.
\item[Issue 2.14 (1999/03/09)] Update for new INTEGER type.
\item[Issue 2.15 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 2.16 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 2.17 (2004/06/16)] Tests for new efficient type inference contexts.
\item[Issue 2.18 (2006/12/02)] NumLit now called NatLit.
\item[Issue 2.19 (2006/12/09)] Added tests for floating point literals.
\item[Issue 2.20 (2009/12/19)] Added regression test for fix to type inference for binders.
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

This document comprises tests of the functions
$is\_varstruct$, $make\_type$ and $make\_term$
which are specified in \cite{DS/FMU/IED/IMP016}.

\subsection{Introduction}

\subsubsection{Background and Purpose}

The purpose of this document is to test
the functions in accordance with the test policy in
\cite{DS/FMU/IED/DTD016} and the guidelines laid out in the
quality plan, \cite{DS/FMU/IED/PLN008}.

\subsubsection{Dependencies}

This document depends on the signature $TypeInference$ specified
in \cite{DS/FMU/IED/DTD016}, and the structure $TypeInference$
specified in \cite{DS/FMU/IED/IMP016}. It makes use of the
module test harness described in \cite{DS/FMU/IED/DTD013} and
\cite{DS/FMU/IED/IMP013}.

\subsubsection{Possible Enhancements}

None.

\subsubsection{Deficiencies}

None Known.

\section{MODULE TEST DESIGN}

The module tests provided in this document test the
type inference mechanism defined in \cite{DS/FMU/IED/DTD016}.

In general, in this document, later tests make use
of test data of earlier tests, and this principle
has to some extent determined the order in which
the tests appear, and is the justification for
testing constructs in a different order from which
they are introduced in other documents
\cite{DS/FMU/IED/DTD016}\cite{DS/FMU/IED/DTD019}.
It therefore follows, failure of earlier tests will
probably cause later tests to fail.

Test data is stored in ML variables which follow the
naming
convention $i\_casename\_1$, $i\_casename\_2$ and
so on for input data, and $o\_casename\_1$, $o\_casename\_2$
for expected results.

The description of test cases is in each case followed
by the corresponding test data.

\section{TEST CASES AND TEST DATA}

\subsection{Initialisation}

Initialise the test harness.

=SML
use_file "dtd013.sml";
use_file "imp013.sml";
init_mt_results ();
=TEX

First, we print a message to indicate to the user to expect
error messages to appear. Using the error message subsystem
\cite{DS/FMU/IED/DTD002}, it is not possible to suppress
nor re-route the messages which are printed when an failure
message is generated.

=SML
map diag_line ["Successful execution of these tests will cause error",
"messages to be generated. You should check visually that",
"the error messages are sensible since the harness itself",
"is incapable of doing this. You can consider that the",
"Module tests have run successfully provided that",
"\ta) you are satisfied with the error messages and",
"\tb) that the report states that all Module tests have",
"\t   passed."];
=TEX
Next, we make the parser and type inference interfaces
directly available to the tests.
=SML
open Parser TypeInference;
=TEX
Now set up a theory to contain any definitions we may need to make.
=SML
new_theory"mdt016_test";
=TEX

The following runs a set of module tests and expects
an exception constructed with ``QuotationError'' to be raised. Since
it is not possible to check the output, we don't bother.

=SML
fun ⦏mt_run_fail1⦎ ([] : (string * ('a -> 'b) * 'a) list)
	: (string * bool) list = []
  | mt_run_fail1 ((tcase, f, arg)::rest) = (
	let val res = f arg
	in
		(tcase, false)::mt_run_fail1 rest
	end

	handle	Fail msg => (tcase,true)::mt_run_fail1 rest
	|	ANY => (tcase,false)::mt_run_fail1 rest
);

=TEX

To test the mechanism, we have to define some constants. The
following function will enter various useful constants into
the symbol table.

=SML
fun ⦏load_symtab⦎() = (
let
val vartype_a = mk_vartype "'a";
val vartype_b = mk_vartype "'b";

val _ = new_type ("→", 2);
val _ = new_type ("×", 2);
val _ = new_const (",", mk_→_type (vartype_a, mk_→_type (vartype_b,
	mk_ctype ("×", [vartype_a, vartype_b]))));
val _ = map declare_infix [(100, "→"), (200, "×")];
val _ = map declare_terminator ["→", "×"];


val _ = new_type ("BOOL", 0);
val _ = new_const ("T", BOOL);
val _ = new_const ("F", BOOL);

val _ = new_const ("=", mk_→_type (vartype_a,mk_→_type (vartype_a, BOOL)));
val _ = new_const ("¬", mk_→_type (BOOL, BOOL));

val _ = new_const ("∀", mk_→_type (mk_→_type (vartype_a, BOOL), BOOL));
val _ = new_const ("∃", mk_→_type (mk_→_type (vartype_a, BOOL), BOOL));

val _ = map declare_binder ["λ", "∀", "∃"];
val _ = map declare_prefix [(300, "¬")];
val _ = declare_infix (50, "=");
val _ = map declare_terminator ["¬", "="];

val _ = new_type ("ℕ", 0);
val _ = new_const (">", mk_→_type (ℕ, mk_→_type (ℕ, BOOL)));
val _ = map declare_infix [(60, ">"), (100, ",")];
val _ = declare_terminator ">";

val CHAR = new_type ("CHAR", 1);
val SET = new_type ("SET", 1);
val LIST = new_type ("LIST", 1);

val _ = new_const ("ε", mk_→_type (mk_→_type (mk_vartype "'a", BOOL),
	mk_vartype "'a"));
val _ = declare_binder "ε";
val _ = declare_terminator "ε";

in
	"Symbol Table Now Loaded"
end);
=TEX
We only load the symbol table of it has not already been
loaded.
=SML
val report = case (get_const_info "T") of
Value _	=> "Symbol Table Already Present"
|Nil		=> load_symtab();

val report = case (get_type_info "ℕ") of
Value _	=>	"Type ℕ is already present"
|Nil	=>
let	val _ = new_type ("ℕ", 0);
in
	"Type ℕ is now defined"
end;

val report = case (get_const_info ">") of
Value _	=>	"Constant > is already present"
|Nil	=>
let	val _ = new_const (">", mk_→_type (ℕ, mk_→_type (ℕ, BOOL)));
	val _ = map declare_infix [(60, ">"), (100, ",")];
	val _ = declare_terminator ">";
in
	"Constant > is now defined"
end;

val report = case (get_type_info "×") of
Value _	=>	"Constant × is already present"
|Nil	=>
let	val _ = new_type ("×", 2);
	val _ = declare_infix (200, "×");
	val _ = declare_terminator "×";
in
	"Constant × is now defined"
end;

val report = case (get_const_info ",") of
Value _	=>	"Constant , is already present"
|Nil	=>
let	val _ = new_const (",", mk_→_type (mk_vartype "'a",
		mk_→_type (mk_vartype "'b",
		mk_ctype ("×", [mk_vartype "'a", mk_vartype "'b"]))));
	val _ = declare_infix (120, ",");
in
	"Constant , is now defined"
end;

val report = case (get_const_info "Uncurry") of
Value _	=>	"Constant Uncurry is already present"
|Nil	=>
let	val tya = mk_→_type (mk_vartype "'a",
		  mk_→_type (mk_vartype "'b", mk_vartype "'c"));
	val tyb = mk_→_type (mk_ctype ("×",[mk_vartype "'a",
		mk_vartype "'b"]), mk_vartype "'c");
	val tyc = mk_→_type (tya, tyb);
	val _ = new_const ("Uncurry", tyc);
in
	"Constant Uncurry is now defined"
end;

=TEX
The following function is used to find out the type of
a constant defined in the symbol table.
=SML
exception Type_of_c of string;
fun ⦏type_of_c⦎ s = (
	case get_const_info s of
	Value (t, _) => t
	|	 Nil => raise Type_of_c s
);
=TEX
=SML
val m = make_term;
=TEX
First we define some Standard ML constants which will
be useful throughout the tests.
=SML
val fixity = Lex.Nonfix;

val ε = Id "ε" and
    T = Id "T" and
    F = Id "F" and
    ¬ = Id "¬" and
    eq = Id "=" and
    gt = Id ">" and
    lt = Id "<" and
    ∀ = Id "∀" and
    ∃ = Id "∃" and
    comma = Id ",";

val free_1 = Id "free_1" and
    free_2 = Id "free_2" and
    free_3 = Id "free_3" and
    free_4 = Id "free_4" and
    free_5 = Id "free_5" and
    free_6 = Id "free_6";

val typevar_a = TyAq (mk_vartype "'a") and
    typevar_b = TyAq (mk_vartype "'b") and
    typevar_c = TyAq (mk_vartype "'c");

val flag = TmTyped (Id "flag", TyAq BOOL);

val x = TmTyped (Id "x", TyAq ℕ) and
    y = TmTyped (Id "y", TyAq ℕ) and
    z = TmTyped (Id "z", TyAq ℕ);

val two = one @+ one;
val n0 = NatLit zero and
    n1 = NatLit one and
    n2 = NatLit two;

val s0 = StringLit "0" and
    s1 = StringLit "1" and
    s2 = StringLit "2";

val c0 = CharLit "0" and
    c1 = CharLit "1" and
    c2 = CharLit "2";

val fl0 = (zero, one, zero) and
    fl1 = (one, one, zero) and
    fl2e1 = (two, one, one);


=TEX

=SML
val o_flag = mk_var ("flag", BOOL);

val o_typevar_a = mk_vartype "'a" and
    o_typevar_b = mk_vartype "'b" and
    o_typevar_c = mk_vartype "'c";

val o_free_1a = mk_var("free_1", o_typevar_a) and
    o_free_1b = mk_var("free_1", o_typevar_b) and
    o_free_1c = mk_var("free_1", o_typevar_c) and
    o_free_2a = mk_var("free_2", o_typevar_a) and
    o_free_2b = mk_var("free_2", o_typevar_b) and
    o_free_2c = mk_var("free_2", o_typevar_c) and
    o_free_3a = mk_var("free_3", o_typevar_a) and
    o_free_3b = mk_var("free_3", o_typevar_b) and
    o_free_3c = mk_var("free_3", o_typevar_c) and
    o_free_1BOOL = mk_var("free_1", BOOL) and
    o_free_2BOOL = mk_var("free_2", BOOL) and
    o_free_3BOOL = mk_var("free_3", BOOL);

val o_x = mk_var ("x", ℕ) and
    o_y = mk_var ("y", ℕ) and
    o_z = mk_var ("z", ℕ);


val o_ε = mk_const ("ε", mk_→_type (mk_→_type (o_typevar_a, BOOL), o_typevar_a)) and
    o_T = mk_const ("T", type_of_c "T") and
    o_F = mk_const ("F", type_of_c "F") and
    o_¬ = mk_const ("¬", type_of_c "¬") and
    o_eq = mk_const ("=", mk_→_type (ℕ, mk_→_type (ℕ, BOOL))) and
    o_eqb = mk_const ("=", mk_→_type (BOOL, mk_→_type (BOOL, BOOL))) and
    o_gt = mk_const (">", mk_→_type (ℕ, mk_→_type (ℕ, BOOL))) and
    o_lt = mk_const ("<", mk_→_type (ℕ, mk_→_type (ℕ, BOOL))) and
    o_∀ = mk_const ("∀", type_of_c "∀") and
    o_∀n = mk_const ("∀", mk_→_type (mk_→_type (ℕ, BOOL), BOOL)) and
    o_∃ = mk_const ("∃", mk_→_type (mk_→_type (ℕ, BOOL), BOOL)) and
    o_comma = mk_const (",", mk_→_type (o_typevar_a, mk_→_type (o_typevar_b,
		mk_ctype ("×", [o_typevar_a, o_typevar_b]))));
=TEX

\subsection{Identifiers}

We need to test that variables
translate to variables with a free type and that
constants (denoted by their presence in the symbol table)
translate to constants.

=SML
val i_id_1 = free_1;
val o_id_1 = o_free_1a;
val i_id_2 = T;
val o_id_2 = mk_const ("T", BOOL);

val _ = store_mt_results (mt_runf (op =$)) [
("ti.id.1", m, i_id_1, o_id_1),
("ti.id.2", m, i_id_2, o_id_2)
];
=TEX
=SML
set_ti_context[o_free_1BOOL];
val i_id_3 = free_1;
val o_id_3 = o_free_1BOOL;
val i_id_4 = free_1;
val o_id_4 = o_free_1a;

val _ = store_mt_results (mt_runf (op =$)) [
("ti.id.3", m, i_id_3, o_id_3)];

val cxt1 = e_flatten (e_get_ti_context());
val cxt2 = get_ti_context();

val _ = store_mt_results (mt_runf (op =$)) [
("ti.context.1", mk_var, hd cxt1, o_free_1BOOL),
("ti.context.2", mk_var, dest_var(hd cxt2), o_free_1BOOL)];

e_set_ti_context initial_e_dict;
val _ = store_mt_results (mt_runf (op =$)) [
("ti.id.4", m, i_id_4, o_id_4)];
=TEX
\subsection{Literals}

For literals, we need to check the translation of
each type of literal and that it is correctly typed.
(Note that some of the values defined will be used later).

=SML
val i_n0 = n0 and
    i_n1 = n1 and
    i_n2 = n2;
val i_s0 = s0 and
    i_s1 = s1 and
    i_s2 = s2;
val i_c0 = c0 and
    i_c1 = c1 and
    i_c2 = c2;

val i_fl0 = Float fl0 and
    i_fl1 = Float fl1 and
    i_fl2e1 = Float fl2e1;

val o_n0 = (mk_ℕ o integer_of_int) 0 and
    o_n1 = (mk_ℕ o integer_of_int) 1 and
    o_n2 = (mk_ℕ o integer_of_int) 2;
val o_s0 = mk_string "0" and
    o_s1 = mk_string "1" and
    o_s2 = mk_string "2";
val o_c0 = mk_char "0" and
    o_c1 = mk_char "1" and
    o_c2 = mk_char "2";
val o_fl0 = mk_float fl0 and
    o_fl1 = mk_float fl1 and
    o_fl2e1 = mk_float fl2e1;


val _ = store_mt_results (mt_runf (op =$)) [
("ti.numlit1", m, i_n0, o_n0),
("ti.stringlit1", m, i_s0, o_s0),
("ti.charlit1", m, i_c0, o_c0),
("ti.numlit2", m, i_n1, o_n1),
("ti.stringlit2", m, i_s1, o_s1),
("ti.charlit2", m, i_c1, o_c1),
("ti.numlit3", m, i_n2, o_n2),
("ti.stringlit3", m, i_s2, o_s2),
("ti.charlit3", m, i_c2, o_c2)
];
=TEX
=SML
val _ = store_mt_results mt_run_fail1 [
("ti.tmfloat_fl0", m, i_fl1),
("ti.tmfloat_fl1", m, i_fl1)
];
=TEX
=SML
val old_thy = get_current_theory_name();
val new_thy = new_theory "mdt016_float_tests";
val report = (new_parent "ℝ";
		"Theory ℝ now a parent")
	handle Fail _ =>
		"Theory ℝ not present";
val report = case (get_type_info "ℝ") of
Value _	=>	"Type ℝ is already present"
|Nil	=>
let	val _ = new_type ("ℝ", 0);
in
	"Type ℝ is now defined"
end;

val report = case (get_type_info "ℤ") of
Value _	=>	"Type ℤ is already present"
|Nil	=>
let	val _ = new_type ("ℤ", 0);
in
	"Type ℤ is now defined"
end;

val report = case (get_const_info "Float") of
Value _	=>	"Constant Float is already present"
|Nil	=>
let	val _ = new_const ("Float", list_mk_→_type [
		mk_ctype("ℕ", []),
		mk_ctype("ℤ", []),
		mk_ctype("ℤ", []),
		mk_ctype("ℝ", [])]);
in
	"Constant Float is now defined"
end;
=TEX
Now test correct operation of floating point literals:
=SML
val _ = store_mt_results (mt_runf (op =$)) [
("ti.float_fl0", m, i_fl0, o_fl0),
("ti.float_fl1", m, i_fl1, o_fl1),
("ti.float_fl2e1", m, i_fl2e1, o_fl2e1)
];
=TEX
Revert to old theory.
=SML
val _ = open_theory old_thy;
=TEX
\subsection{Types}

There are three value constructors which form types.
Each of these is tested in turn using the interface
$make\_type$. This interface is itself used by
the type inference mechanism.

\begin{description}

\item[Atomic Types]
Test that a type atom which begins with a ``\'\/''
translates to a corresponding $Vartype$, and that a
type atom which begins with any other character
translates to a corresponding $Type$ with an
empty parameter list.

\item[Antiquoted Types]
Test that an antiquoted type translated yields the
type which is antiquoted.

\item[Compound Types]
Test that a type compound translates correctly to
a $Type$. This needs to be tested when the type
has no parameters, one parameter and more than one
parameter.

\end{description}

=SML
val report = case (get_type_info "XXX") of
Value _	=>	"Type XXX is already present"
|Nil	=>
let	val _ = new_type ("XXX", 0);
	val _ = new_type("ZZZ", 0);
	val _ = new_type("WWW", 1);
	val _ = new_type("SSS", 3);
in
	"Types XXX, ZZZ, WWW and SSS are now defined"
end;

val i_tyatom_1 = TyAtom "XXX";
val o_tyatom_1 = mk_ctype ("XXX",[]);
val i_tyatom_2 = TyAtom "'YYY";
val o_tyatom_2 = mk_vartype "'YYY";
val i_tyaq_1 = TyAq (mk_ctype ("XXX",[]));
val o_tyaq_1 = mk_ctype ("XXX",[]);
val i_tyaq_2 = TyAq (mk_vartype "YYY");
val o_tyaq_2 = mk_vartype "YYY";
val i_tyaq_3 = TyAq (mk_vartype "'RRR");
val o_tyaq_3 = mk_vartype "'RRR";
val i_tycompound_1 = TyCompound ([],"ZZZ",fixity);
val o_tycompound_1 = mk_ctype ("ZZZ",[]);
val i_tycompound_2 = TyCompound ([i_tyatom_1],"WWW", fixity);
val o_tycompound_2 = mk_ctype ("WWW",[o_tyatom_1]);

val i_tycompound_3 = TyCompound ([i_tycompound_1,
	i_tycompound_2, i_tyatom_2],"SSS", fixity);
val o_tycompound_3 = mk_ctype ("SSS",[o_tycompound_1,
	o_tycompound_2, o_tyatom_2]);

val _ = store_mt_results (mt_runf (op =:)) [
("make_type.tyatom_1", make_type, i_tyatom_1, o_tyatom_1),
("make_type.tyatom_2", make_type, i_tyatom_2, o_tyatom_2),
("make_type.tyaq_1", make_type, i_tyaq_1, o_tyaq_1),
("make_type.tyaq_2", make_type, i_tyaq_2, o_tyaq_2),
("make_type.tyaq_3", make_type, i_tyaq_3, o_tyaq_3),
("make_type.tycompound_1",make_type, i_tycompound_1, o_tycompound_1),
("make_type.tycompound_2",make_type, i_tycompound_2, o_tycompound_2),
("make_type.tycompound_3",make_type, i_tycompound_3, o_tycompound_3)
];
=TEX

\subsection{Binding Types to Identifiers and Literals}

We need to test that a free variable which
is typed is correctly typed when type-inferred. A typed
constant when explicitly typed should yield a constant of
the correct type. A typed constant which is explicitly typed
with a different type should yeild a type checking error.

=SML

val i_tmtyped_1 = TmTyped (free_1, TyAq ℕ);
val o_tmtyped_1 = mk_var ("free_1", ℕ);
val i_tmtyped_2 = TmTyped (T, TyAq BOOL);
val o_tmtyped_2 = mk_const ("T", BOOL);
val i_tmtyped_3 = TmTyped (c0, TyAq CHAR);
val o_tmtyped_3 = mk_char "0";
val i_tmtyped_4 = TmTyped (c0, TyAtom "CHAR");
val o_tmtyped_4 = mk_char "0";

val i_tmtyped_1f = TmTyped (c0, TyAq STRING);
val i_tmtyped_2f = TmTyped (T, TyAq ℕ);

val _ = store_mt_results (mt_runf (op =$)) [
("ti.tmtyped_1", m, i_tmtyped_1, o_tmtyped_1),
("ti.tmtyped_2", m, i_tmtyped_2, o_tmtyped_2),
("ti.tmtyped_3", m, i_tmtyped_3, o_tmtyped_3),
("ti.tmtyped_4", m, i_tmtyped_4, o_tmtyped_4)
];

val _ = store_mt_results mt_run_fail1 [
("ti.tmtyped_1f", m, i_tmtyped_1f),
("ti.tmtyped_2f", m, i_tmtyped_2f)
];
=TEX

\subsection{Nested Quotations}

The following cases should be tested:

\begin{enumerate}

\item
nested quotation of a typed variable

\item
nested quotation of a constant

\item
nested quotation of a free variable

\item
that the type of an nested quotation of a free variable is
that which is expected

\item
that the type of an nested quotation of a typed variable is
that which is expected

\item
that the type of an nested quotation of a typed variable is
that which is expected

\item
cases in which type instantiation of the nested quotation is required

\item
the error case where the type of some free variable in the nested
quotation is incompatible with the context

\item
the error case where the nested
quotation contains two variables with the same name but different types
\end{enumerate}




=SML
val i_tmaq_1 = TmAq o_x;
val o_tmaq_1 = o_x;
val i_tmaq_2 = TmAq o_T;
val o_tmaq_2 = o_T;
val i_tmaq_3 = TmAq o_free_1a;
val o_tmaq_3 = o_free_1a;
val i_tmaq_4 = TmTyped (TmAq (o_free_1a), typevar_a);
val o_tmaq_4 = o_free_1a;
val i_tmaq_5 = TmTyped (TmAq (o_n0), TyAq ℕ);
val o_tmaq_5 = o_n0;
val i_tmaq_6 = TmTyped (TmAq (o_free_1a), TyAq BOOL);
val o_tmaq_6 = o_free_1BOOL;
val i_tmaq_7 = App (App (comma, TmTyped (free_1, TyAq BOOL), fixity), TmAq (o_free_1a), fixity);
val o_tmaq_7 = mk_pair(o_free_1BOOL, o_free_1BOOL);

val i_tmaq_8 = App (App (comma, TmAq (o_free_1a), fixity), TmTyped (free_1, TyAq BOOL), fixity);
val o_tmaq_8 = mk_pair(o_free_1BOOL, o_free_1BOOL);

val _ = store_mt_results (mt_runf (op =$)) [
("ti.tmaq_1", m, i_tmaq_1, o_tmaq_1),
("ti.tmaq_2", m, i_tmaq_2, o_tmaq_2),
("ti.tmaq_3", m, i_tmaq_3, o_tmaq_3),
("ti.tmaq_4", m, i_tmaq_4, o_tmaq_4),
("ti.tmaq_5", m, i_tmaq_5, o_tmaq_5),
("ti.tmaq_6", m, i_tmaq_6, o_tmaq_6),
("ti.tmaq_7", m, i_tmaq_7, o_tmaq_7),
("ti.tmaq_8", m, i_tmaq_8, o_tmaq_8)
];

val i_tmaq_1f = App (App (comma, TmTyped (free_1, TyAq ℕ), fixity), TmAq (o_free_1BOOL), fixity);
val i_tmaq_2f = TmTyped (TmAq (mk_pair(o_free_1BOOL, o_free_1a)), TyAq ℕ);

val _ = store_mt_results mt_run_fail1 [
("ti.tmaq_1f", m, i_tmaq_1f),
("ti.tmaq_2f", m, i_tmaq_2f)
];

=TEX
\subsection{Variable Structures}

We need to test that the type inference mechanism recognises
variable structures. These tests test the function
$is_varstruct$. The following cases should be tested:

\begin{enumerate}

\item
that a free variable is a valid varstruct

\item
that a typed free variable is a valid varstruct

\item
that a pair of free variables is a valid varstruct

\item
that a typed pair of free variables is a valid varstruct

\item
that a typed pair of typed variables is a valid varstruct

\item
that a constant is not a valid varstruct

\item
that a conditional clause is not a valid varstruct

\item
that a function application (other that the pair constructor)
is not a valid varstruct

\item
that a set display is not a valid varstruct

\item
that a list display is not a valid varstruct

\item
that a set comprehension is not a valid varstruct

\item
that a numeric literal is not a valid varstruct

\item
that a string literal is not a valid varstruct

\item
that a character literal is not a valid varstruct

\item
that an nested quotation is treated as a valid varstruct if it is one

\item
that a binder clause is not a valid varstruct

\item
that a let clause is not a valid varstruct

\end{enumerate}

=SML
val i_varstruct_1 = free_1;
val i_varstruct_2 = x;
val i_varstruct_3 = App (App (comma, free_1, fixity), free_2, fixity);
val i_varstruct_4 = TmTyped (App (App (comma, free_1, fixity), free_2, fixity),
	TyAq (mk_ctype ("×", [o_typevar_a, o_typevar_b])));
val i_varstruct_5 = TmTyped (App (App (comma, x, fixity), y, fixity),
	TyAq (mk_ctype ("×", [ℕ, ℕ])));
val i_varstruct_6 = T;
val i_varstruct_7 = Cond (T, T, F);
val i_varstruct_8 = App (¬, T, fixity);
val i_varstruct_9 = SetDisplay [T,T];
val i_varstruct_10 = ListDisplay [T,T];
val i_varstruct_11 = SetComprehension (x, T);
val i_varstruct_12 = n0;
val i_varstruct_13 = s0;
val i_varstruct_14 = c0;
val i_varstruct_15a = TmAq o_x;
fun i_varstruct_15b () = TmAq (mk_pair(mk_pair(o_x, o_y), mk_pair(o_x, o_z)));
val i_varstruct_15c = TmAq o_T;
val i_varstruct_16 = Binder ("∀", x, T);
val i_varstruct_17 = Let ([], T);

val _ = store_mt_results mt_run [
("varstruct_1", is_varstruct, i_varstruct_1, true),
("varstruct_2", is_varstruct, i_varstruct_2, true),
("varstruct_3", is_varstruct, i_varstruct_3, true),
("varstruct_4", is_varstruct, i_varstruct_4, true),
("varstruct_5", is_varstruct, i_varstruct_5, true),
("varstruct_6", is_varstruct, i_varstruct_6, false),
("varstruct_7", is_varstruct, i_varstruct_7, false),
("varstruct_8", is_varstruct, i_varstruct_8, false),
("varstruct_9", is_varstruct, i_varstruct_9, false),
("varstruct_10", is_varstruct, i_varstruct_10, false),
("varstruct_11", is_varstruct, i_varstruct_11, false),
("varstruct_12", is_varstruct, i_varstruct_12, false),
("varstruct_13", is_varstruct, i_varstruct_13, false),
("varstruct_14", is_varstruct, i_varstruct_14, false),
("varstruct_15a", is_varstruct, i_varstruct_15a, true),
("varstruct_15b", is_varstruct, i_varstruct_15b (), true),
("varstruct_15c", is_varstruct, i_varstruct_15c, false),
("varstruct_16", is_varstruct, i_varstruct_16, false),
("varstruct_17", is_varstruct, i_varstruct_17, false)
];
=TEX

\subsection{Binder Construction with lambda}

The following cases should be tested for the construct
$ λ x ⦁ p$.

\begin{enumerate}

\item
when x and p are both free variables

\item
when x is a free variable and p is a boolean variable

\item
when x is a free variable and p is a boolean constant

\item
when x is a typed variable and p is a boolean constant

\item
when x is a typed variable and p is a boolean expression
containing x.

\item
that the type of the resulting expression matches a set of type
x.

\item
when x is a pair and p is a boolean constant.

\item
when x is a pair containing a nested quotation.

\end{enumerate}

We should also check
that a type checking error is raised when
x is not a well formed variable.

=SML
val i_binderλ_1 = Binder ("λ", free_1, free_2);
val o_binderλ_1 = mk_λ (o_free_1a, o_free_2b);
val i_binderλ_2 = Binder ("λ", free_1, flag);
val o_binderλ_2 = mk_λ (o_free_1a, o_flag);
val i_binderλ_3 = Binder ("λ", free_1, T);
val o_binderλ_3 = mk_λ (o_free_1a, o_T);
val i_binderλ_4 = Binder ("λ", x, T);
val o_binderλ_4 = mk_λ (o_x, o_T);

val i_binderλ_5 = Binder ("λ", x, App (App (gt, x, fixity), y, fixity));
val o_binderλ_5 = mk_λ (o_x, mk_app (mk_app (o_gt, o_x), o_y));
val i_binderλ_6 =TmTyped (Binder ("λ", x, T),
	TyAq (mk_→_type (ℕ, BOOL)));
val o_binderλ_6 = mk_λ (o_x, o_T);
val i_binderλ_7 =Binder ("λ", i_varstruct_5, T);
local
	val o_varstruct_5 = make_term i_varstruct_5
in
	val o_binderλ_7 = mk_λ (o_varstruct_5, o_T)
end;
fun i_binderλ_8 () = Binder ("λ", i_varstruct_15b (), T);
local
	val o_varstruct_15b = make_term (i_varstruct_15b());
in
	val o_binderλ_8 = mk_λ (o_varstruct_15b, o_T)
end;

val i_binderλ_1f = Binder ("λ", T, T);
val i_binderλ_2f = Binder ("λ", i_varstruct_10, T);

val _ = store_mt_results (mt_runf (op =$)) [
("ti.binderλ_1", m, i_binderλ_1, o_binderλ_1),
("ti.binderλ_2", m, i_binderλ_2, o_binderλ_2),
("ti.binderλ_3", m, i_binderλ_3, o_binderλ_3),
("ti.binderλ_4", m, i_binderλ_4, o_binderλ_4),
("ti.binderλ_5", m, i_binderλ_5, o_binderλ_5),
("ti.binderλ_6", m, i_binderλ_6, o_binderλ_6),
("ti.binderλ_7", m, i_binderλ_7, o_binderλ_7),
("ti.binderλ_8", m, i_binderλ_8 (), o_binderλ_8)
];

val _ = store_mt_results mt_run_fail1 [
("ti.binderλ_1f", m, i_binderλ_1f),
("ti.binderλ_2f", m, i_binderλ_2f)
];
=TEX

\subsection{Other Binder Constructions}

The following cases should be tested for the construct
$bnd\ x ⦁ p$.

\begin{enumerate}

\item
when bnd is a constant, x and p are free variables

\item
when bnd is a constant, x and p are typed variables

\item
when bnd is a constant, x is a typed variable and
p is a constant

\item
when bnd is not a constant, x is a variable
and p is a constant

\end{enumerate}

We should also check
that a type checking error is raised when
x is not a well formed variable.


=SML
val i_binder_1 = Binder ("∀", free_1, free_2);
val o_binder_1 = mk_app (o_∀, mk_λ (o_free_1a, mk_var ("free_2", BOOL)));
val i_binder_2 = Binder ("∀", x, flag);
val o_binder_2 = mk_app (o_∀n, mk_λ (o_x, o_flag));
val i_binder_3 = Binder ("∀", x, T);
val o_binder_3 = mk_app (o_∀n, mk_λ (o_x, o_T));
val i_binder_4 = Binder ("Aardvark", free_1, T);
val o_binder_4 = mk_app (mk_var("Aardvark",mk_→_type (mk_→_type (o_typevar_b, BOOL),
	o_typevar_a)), mk_λ (o_free_1b, o_T));

val i_binder_1f = Binder ("∀", T, T);
val i_binder_2f = Binder ("∃", i_varstruct_10, T);

val _ = store_mt_results (mt_runf (op =$)) [
("ti.binder_1", m, i_binder_1, o_binder_1),
("ti.binder_2", m, i_binder_2, o_binder_2),
("ti.binder_3", m, i_binder_3, o_binder_3),
("ti.binder_4", m, i_binder_4, o_binder_4)
];

val _ = store_mt_results mt_run_fail1 [
("ti.binder_1f", m, i_binder_1f),
("ti.binder_2f", m, i_binder_2f)
];
=TEX

\subsection{Let Statements}

The following cases should be tested for clauses of the form:
$Let\ ([\ ],\ p)$;

\begin{enumerate}

\item
when p is a free variable

\item
when p is a typed variable

\item
when p is a constant

\item
that the clause has the same type as the type of p

\end{enumerate}

The following cases should be tested for clauses of the form:
$Let\ ([(x, y)],\ p)$;

\begin{enumerate}

\item
when p is a constant, and y is a free variable

\item
when p is the variable x, and y is a constant

\item
that when p is an expression containing and denoting the
type of x, and y is a free variable, that the type of y
is correctly type-inferred

\end{enumerate}

We also need to check that
when x is not a varstruct then an type checking error
occurs.

Finally we need to check that a clause of the form
$Let\ ([(x1,\ y1),\ (x2,\ y2)]),\ p$ to check that
the types of y1 can be inferred from y2 and vice-versa.

=SML
val i_let_empty_1 = Let ([], free_1);
val o_let_empty_1 = mk_let ([],o_free_1a);
val i_let_empty_2 = Let ([], x);
val o_let_empty_2 = mk_let ([],o_x);
val i_let_empty_3 = Let ([], T);
val o_let_empty_3 = mk_let ([], o_T);
val i_let_empty_4 = TmTyped (Let ([], T), TyAq BOOL);
val o_let_empty_4 = mk_let ([], o_T);

val i_let_one_1 = Let ([(free_1, free_2)], T);
val o_let_one_1 = mk_let ([(o_free_1a, o_free_2a)], o_T);
val i_let_one_2 = Let ([(free_1, T)], free_1);
val o_let_one_2 = mk_let ([(o_free_1BOOL, o_T)], o_free_1BOOL);
val i_let_one_3 = Let ([(free_1, free_2)], App (¬, free_1, fixity));
val o_let_one_3 = mk_let ([(o_free_1BOOL, o_free_2BOOL)], mk_app (o_¬, o_free_1BOOL));
val i_let_two_1 = Let ([(free_1, free_2), (free_3, T)],
	App (App (eq, free_1, fixity), flag, fixity));
val o_let_two_1 = mk_let ([(o_free_1BOOL, o_free_2BOOL),
	(o_free_3BOOL, o_T)], mk_app (mk_app (o_eqb, o_free_1BOOL), o_flag));
val i_let_two_2 = Let ([(free_3, T), (free_1, free_2)],
	App (App (eq, free_1, fixity), flag, fixity));
val o_let_two_2 = mk_let ([(o_free_3BOOL, o_T), (o_free_1BOOL, o_free_2BOOL)],
	mk_app (mk_app (o_eqb, o_free_1BOOL), o_flag));

val i_let_one_1f = Let ([(i_varstruct_10, free_1)], free_2);

val _ = store_mt_results (mt_runf (op =$)) [
("ti.let_empty_1", m, i_let_empty_1, o_let_empty_1),
("ti.let_empty_2", m, i_let_empty_2, o_let_empty_2),
("ti.let_empty_3", m, i_let_empty_3, o_let_empty_3),
("ti.let_one_1", m, i_let_one_1, o_let_one_1),
("ti.let_one_2", m, i_let_one_2, o_let_one_2),
("ti.let_one_3", m, i_let_one_3, o_let_one_3),
("ti.let_two_1", m, i_let_two_1, o_let_two_1),
("ti.let_two_2", m, i_let_two_2, o_let_two_2)
];

val _ = store_mt_results mt_run_fail1 [
("ti.let_1f", m, i_let_one_1f)
];
=TEX

\subsection{Function Application}

The following cases should be tested:

\begin{enumerate}

\item
The application of a free variable to a free variable

\item
The application of a free variable to a constant

\item
The application of a constant to a free variable

\item
The application of a constant to a constant

\item
That the type resulting from an application of a function
is that which is expected

\end{enumerate}

We also need to check
that constants with non-function types applied to anything
causes a type checking error.

=SML
val i_app_1 = App (free_1, free_2, fixity);
val o_app_1 = mk_app (mk_var ("free_1", mk_→_type(mk_vartype "'b", mk_vartype "'a")),
	o_free_2b);
val i_app_2 = App (free_1, T, fixity);
val o_app_2 = mk_app (mk_var ("free_1", mk_→_type(BOOL, mk_vartype "'a")), o_T);
val i_app_3 = App (¬, free_1, fixity);
val o_app_3 = mk_app (o_¬, o_free_1BOOL);
val i_app_4 = App (¬, T, fixity);
val o_app_4 = mk_app (o_¬, o_T);
val i_app_5 = TmTyped (App (Id "¬", flag, fixity), TyAq BOOL);
val o_app_5 = mk_app (o_¬, o_flag);

val i_app_1f = App (T, T, fixity);
val i_app_2f = App (T, x, fixity);
val i_app_3f = App (Id ">", T, fixity);

val _ = store_mt_results (mt_runf (op =$)) [
("ti.app_1", m, i_app_1, o_app_1),
("ti.app_2", m, i_app_2, o_app_2),
("ti.app_3", m, i_app_3, o_app_3),
("ti.app_4", m, i_app_4, o_app_4),
("ti.app_5", m, i_app_4, o_app_4)
];

val _ = store_mt_results mt_run_fail1 [
("ti.app_1f", m, i_app_1f),
("ti.app_2f", m, i_app_2f),
("ti.app_3f", m, i_app_3f)
];
=TEX

\subsection{Conditional Statements}

The following cases should be tested for $Cond\ (c,\ a,\ b)$:

\begin{enumerate}

\item
when c, a and b are all free variables

\item
when c is a boolean constant and a and b are free variables

\item
when c is a free variable, and a and b are constants

\item
when c is a free variable and a and b are typed variables

\item
when c, a and b are all typed variables

\item
when c, a and b are all constants

\item
that the types of a are correctly inferred from b when c is a typed variable

\item
that the types of b are correctly inferred from a when c is a typed variable

\item
that the type of the expression matches the type of a
and b

\end{enumerate}

We also need to check the following:

\begin{enumerate}

\item
when c is not of type BOOL, that a type checking error occurs

\item
when a and b are not of the same type that a type checking
error occurs

\end{enumerate}

=SML
val i_cond_1 = Cond (free_1, free_2, free_3);
val o_cond_1 = mk_if (o_free_1BOOL, o_free_2a, o_free_3a);
val i_cond_2 = Cond (T, free_2, free_3);
val o_cond_2 = mk_if (o_T, o_free_2a, o_free_3a);
val i_cond_3 = Cond (free_1, ε, ε);
val o_cond_3 = mk_if (o_free_1BOOL, o_ε, o_ε);
val i_cond_4 = Cond (free_1, x, y);
val o_cond_4 = mk_if (o_free_1BOOL, o_x, o_y);
val i_cond_5 = Cond (flag, x, y);
val o_cond_5 = mk_if (o_flag, o_x, o_y);
val i_cond_6 = Cond (T, T, F);
val o_cond_6 = mk_if (o_T, o_T, o_F);
val i_cond_7 = Cond (T, free_1, i_app_5);
val o_cond_7 = mk_if (o_T, o_free_1BOOL, o_app_5);
val i_cond_8 = Cond (T, i_app_5, free_1);
val o_cond_8 = mk_if (o_T, o_app_5, o_free_1BOOL);
val i_cond_9 = TmTyped (Cond (T, T, F), TyAq BOOL);
val o_cond_9 = mk_if (o_T, o_T, o_F);

val i_cond_1f = Cond (NatLit zero, T, T);
val i_cond_2f = Cond (T, NatLit zero, F);
val i_cond_3f = Cond (T, T, NatLit zero);

val _ = store_mt_results (mt_runf (op =$)) [
("ti.cond_1", m, i_cond_1, o_cond_1),
("ti.cond_2", m, i_cond_2, o_cond_2),
("ti.cond_3", m, i_cond_3, o_cond_3),
("ti.cond_4", m, i_cond_4, o_cond_4),
("ti.cond_5", m, i_cond_5, o_cond_5),
("ti.cond_6", m, i_cond_6, o_cond_6),
("ti.cond_7", m, i_cond_7, o_cond_7),
("ti.cond_8", m, i_cond_8, o_cond_8),
("ti.cond_9", m, i_cond_9, o_cond_9)
];

val _ = store_mt_results mt_run_fail1 [
("ti.cond_1f", m, i_cond_1f),
("ti.cond_2f", m, i_cond_2f),
("ti.cond_3f", m, i_cond_3f)
];
=TEX

\subsection{Sets}

The following cases should be tested:

\begin{enumerate}

\item
an empty set of an unknown type

\item
an empty set of a fixed type

\item
a set with one element

\item
a set with more than one element

\item
that a set containing elements of a particular type has
the correct overall type

\item
that in a set containing variables of known types and a free
variable that the free
variable is correctly type-inferred

\end{enumerate}

We also need to check
that a set containing elements of different types causes a
type checking error.

=SML
val i_setdisplay_1 = SetDisplay [];
val o_setdisplay_1 = mk_∅ (o_typevar_a);
val i_setdisplay_2 = TmTyped (SetDisplay [], TyAq (mk_ctype ("SET", [BOOL])));
val o_setdisplay_2 = mk_∅ (BOOL);
val i_setdisplay_3 = SetDisplay [x];
val o_setdisplay_3 = mk_enum_set [o_x];
val i_setdisplay_4 = SetDisplay [x,y,z];
val o_setdisplay_4 = mk_enum_set [o_x, o_y, o_z];
val i_setdisplay_5 = TmTyped (SetDisplay [T],
	TyAq (mk_ctype ("SET", [BOOL])));
val o_setdisplay_5 = mk_enum_set [o_T];
val i_setdisplay_6 = SetDisplay [T, F, free_1];
val o_setdisplay_6 = mk_enum_set [o_T, o_F, o_free_1BOOL];

val i_setdisplay_1f = SetDisplay [T, n0];
val i_setdisplay_2f = SetDisplay [T, F, T, n0];

val _ = store_mt_results (mt_runf (op =$)) [
("ti.setdisplay_1", m, i_setdisplay_1, o_setdisplay_1),
("ti.setdisplay_2", m, i_setdisplay_2, o_setdisplay_2),
("ti.setdisplay_3", m, i_setdisplay_3, o_setdisplay_3),
("ti.setdisplay_4", m, i_setdisplay_4, o_setdisplay_4),
("ti.setdisplay_5", m, i_setdisplay_5, o_setdisplay_5),
("ti.setdisplay_6", m, i_setdisplay_6, o_setdisplay_6)
];

val _ = store_mt_results mt_run_fail1 [
("ti.setdisplay_1f", m, i_setdisplay_1f),
("ti.setdisplay_2f", m, i_setdisplay_2f)
];
=TEX


\subsection{Set Comprehension}

The following cases should be tested for terms of the
form $\{x\ |\ p\}$:

\begin{enumerate}

\item
when x and p are both free variables

\item
when x is a free variable and p is a boolean variable

\item
when x is a free variable and p is a boolean constant

\item
when x is a typed variable and p is a boolean constant

\item
when x is a typed variable and p is a boolean expression
containing x

\item
that the type of the resulting expression matches a set of type
x

\item
when x is a pair and p is a boolean constant

\end{enumerate}

We also need to check
that a type checking error is raised when either p is not
boolean or x is not a well formed variable.

=SML
val i_setcomp_1 = SetComprehension (free_1, free_2);
val o_setcomp_1 = mk_set_comp (o_free_1a, o_free_2BOOL);
val i_setcomp_2 = SetComprehension (free_1, flag);
val o_setcomp_2 = mk_set_comp (o_free_1a, o_flag);
val i_setcomp_3 = SetComprehension (free_1, T);
val o_setcomp_3 = mk_set_comp (o_free_1a, o_T);
val i_setcomp_4 = SetComprehension (x, T);
val o_setcomp_4 = mk_set_comp (o_x, o_T);

val i_setcomp_5 = SetComprehension (x, App (App (gt, x, fixity), y, fixity));
val o_setcomp_5 = mk_set_comp (o_x, mk_app (mk_app (o_gt, o_x), o_y));
val i_setcomp_6 =TmTyped (SetComprehension (x, T),
	TyAq (mk_ctype ("SET", [ℕ])));
val o_setcomp_6 = mk_set_comp (o_x, o_T);
val i_setcomp_7 =SetComprehension (i_varstruct_5, T);
local
	val o_varstruct_5 = make_term i_varstruct_5
in
	val o_setcomp_7 = mk_set_comp (o_varstruct_5, o_T)
end;

val i_setcomp_1f = SetComprehension (x, n0);
val i_setcomp_2f = SetComprehension (T, T);
val i_setcomp_3f = SetComprehension (i_varstruct_10, T);

val _ = store_mt_results (mt_runf (op =$)) [
("ti.setcomp_1", m, i_setcomp_1, o_setcomp_1),
("ti.setcomp_2", m, i_setcomp_2, o_setcomp_2),
("ti.setcomp_3", m, i_setcomp_3, o_setcomp_3),
("ti.setcomp_4", m, i_setcomp_4, o_setcomp_4),
("ti.setcomp_5", m, i_setcomp_5, o_setcomp_5),
("ti.setcomp_6", m, i_setcomp_6, o_setcomp_6),
("ti.setcomp_7", m, i_setcomp_7, o_setcomp_7)
];

val _ = store_mt_results mt_run_fail1 [
("ti.setcomp_1f", m, i_setcomp_1f),
("ti.setcomp_2f", m, i_setcomp_2f),
("ti.setcomp_3f", m, i_setcomp_3f)
];
=TEX

\subsection{Lists}

The following cases should be tested:

\begin{enumerate}

\item
an empty list of an unknown type

\item
an empty list of a fixed type

\item
a list with one element

\item
a list with more than one element

\item
that a list containing elements of a particular type has
the correct overall type

\item
that in a set containing variables of known types and a free
variable that the free
variable is correctly type-inferred

\end{enumerate}

We also need to check
that a list containing elements of different types causes a
type checking error.

=SML
val i_listdisplay_1 = ListDisplay [];
val o_listdisplay_1 = mk_empty_list (o_typevar_a);
val i_listdisplay_2 = TmTyped (ListDisplay [], TyAq (mk_ctype ("LIST", [BOOL])));
val o_listdisplay_2 = mk_empty_list (BOOL);
val i_listdisplay_3 = ListDisplay [x];
val o_listdisplay_3 = mk_list [o_x];
val i_listdisplay_4 = ListDisplay [x,y,z];
val o_listdisplay_4 = mk_list [o_x, o_y, o_z];
val i_listdisplay_5 = TmTyped (ListDisplay [T],
	TyAq (mk_ctype ("LIST", [BOOL])));
val o_listdisplay_5 = mk_list [o_T];
val i_listdisplay_6 = ListDisplay [T, F, free_1];
val o_listdisplay_6 = mk_list [o_T, o_F, o_free_1BOOL];

val i_listdisplay_1f = ListDisplay [T, n0];
val i_listdisplay_2f = ListDisplay [T, F, T, n0];

val _ = store_mt_results (mt_runf (op =$)) [
("ti.listdisplay_1", m, i_listdisplay_1, o_listdisplay_1),
("ti.listdisplay_2", m, i_listdisplay_2, o_listdisplay_2),
("ti.listdisplay_3", m, i_listdisplay_3, o_listdisplay_3),
("ti.listdisplay_4", m, i_listdisplay_4, o_listdisplay_4),
("ti.listdisplay_5", m, i_listdisplay_5, o_listdisplay_5),
("ti.listdisplay_6", m, i_listdisplay_6, o_listdisplay_6)
];

val _ = store_mt_results mt_run_fail1 [
("ti.listdisplay_1f", m, i_listdisplay_1f),
("ti.listdisplay_2f", m, i_listdisplay_2f)
];
=TEX
\subsection{Alias Overloading}
=SML
val _ = if get_current_theory_name() = "test_mdt016"
	then
		(open_theory ((hd o tl o rev) (get_ancestors "-"));
			delete_theory "test_mdt016")
	else ();
val _ = new_theory "test_mdt016";


val ty1 = mk_→_type (BOOL,BOOL);
val ty2 = mk_→_type (ℕ,BOOL);
val _ = new_const ("T1", ty1);
val _ = new_const ("T2", ty2);
val _ = declare_alias ("A", mk_const ("T1", ty1));
val _ = declare_alias ("A", mk_const ("T2", ty2));

val i_alias_1 = App (TmTyped (Id "A", TyAq ty1), TmTyped (Id "T", TyAq BOOL), Lex.Nonfix);
val i_alias_2 = App (TmTyped (Id "A", TyAq ty2), (NatLit o integer_of_int) 0, Lex.Nonfix);
val i_alias_1f = Id "A";
val i_alias_2f = App (Id "A", CharLit "x", Lex.Nonfix);
=TEX
=SML
val _ = store_mt_results (mt_runf (op =$)) [
("ti.alias_1", m, i_alias_1, ⌜T1 T⌝),
("ti.alias_2", m, i_alias_2, ⌜T2 0⌝)
];
val _ = store_mt_results mt_run_fail1 [
("ti.alias_1f", m, i_alias_1f),
("ti.alias_2f", m, i_alias_2f)
];

=TEX

\subsection{Regression Tests}

These tests comprise a miscellaneous collection of tests
which have been known to cause the type inferrer (unification)
to fail in past instances of the implementation.
=SML
val _ = store_mt_results (mt_runf (op =:)) [
("ti.misc_1", type_of, ⌜Uncurry f = λ x ⦁ f (Fst x) (Snd x)⌝, ⓣBOOL⌝)
];
=TEX
=SML
declare_binder"BBB";
val _ = store_mt_results mt_run [
("ti.misc_2", length, frees ⌜($BBB, (BBB x⦁ x = 1) : ℕ)⌝, 1)
];
=IGN
The following terms should fail on the occurs check. It
has been the case that type inference on these terms has not
terminated. The problem has been corrected. (Try them).
⌜Uncurry f = λ y ⦁ f y y⌝;
⌜Uncurry f = λ y ⦁ f y⌝;
=TEX
\section{END OF TESTS}
=SML
	val _ = diag_string(summarize_mt_results())

=TEX




%\newpage
%\twocolumn[\section{INDEX OF DEFINED TERMS}]
%\printindex
\end{document}



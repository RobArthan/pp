=IGN
********************************************************************************
mdt006.doc: this file is part of the ProofPower system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% ℤ $Id: mdt006.doc,v 1.48 2014/04/12 16:03:18 rda Exp rda $
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

\def\Title{Module Tests for the Abstract Data Type $THM$}

\def\AbstractText{A set of module tests are given for the the abstract data type $THM$.}

\def\Reference{DS/FMU/IED/MDT006}

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
%% LaTeX2e port: \TPPtitle{Module Tests for the Abstract Data Type $THM$}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Module Tests for the Abstract Data Type $THM$}
%% LaTeX2e port: \TPPref{DS/FMU/IED/MDT006}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.48 $ %
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2014/04/12 16:03:18 $ %
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{ML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.Blackburn & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & Project Manager}
%% LaTeX2e port: \TPPabstract{A set of module tests are given for the
%% LaTeX2e port: the abstract data type $THM$.}
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
\item [Issue 1.1 (1991/05/15)]
First draft version.
\item [Issue 1.2 (1991/05/16)]
Corrected typos, slight improvement to layout.
\item [Issue 1.3 (1991/05/20)]
Changed to match issue 1.9 of \cite{DS/FMU/IED/DTD006}.
\item [Issue 1.4 (1991/05/20)]
Testing corrections made to implementation.
\item [Issue 1.5 (1991/06/06)]
Now reloads ``imp006.sml'' to start off from an empty ``min'' theory.
\item [Issue 1.6 (1991/06/17),1.7 (1991/06/17)]
Changed to match issue 1.11 of \cite{DS/FMU/IED/DTD006}.
\item [Issue 1.8 (1991/06/17)]
Changed a $list\_mk\_∃$ to $list\_mk\_simple\_∃$.
\item [Issue 1.8 (1991/06/17)]
Changed a $mk\_∃$ to $mk\_simple\_∃$.
\item [Issue 1.9 (1991/06/17)]
Added a test for $pp'list\_simple\_∀\_elim$ with duplicate quantifiers.
\item [Issue 1.10 (1991/06/19)]
The prefix $simple$ is moved to being the first prefix, bar $pp'$.
Changed to match issue 1.12 of \cite{DS/FMU/IED/DTD006}.
\item [Issue 1.11 (1991/06/27)]
Clears out theory hierarchy, rather than reloading imp006.
\item [Issue 1.12 (1991/06/27),1.13 (1991/06/27)]
Deals with some glitches.
\item [Issue 1.14 (1991/06/28)]
Initial use of material from \cite{DS/FMU/IED/DTD013}.
\item [Issue 1.15 (1991/07/12)]
Further use of material from \cite{DS/FMU/IED/DTD013}.
Stopped using parser.
\item [Issue 1.16 (1991/07/29),1.17 (1991/07/29)]
Changed as result of changes caused by IR0016.
\item [Issue 1.18 (1991/08/07)]
Changes in reaction to issue 1.19 of \cite{DS/FMU/IED/DTD006}.
\item [Issue 1.19 (1991/08/14)]
Fixed two minor mismatches.
\item [Issue 1.20 (1991/08/15)]
Correcting what used to be 6038 tests.
\item [Issue 1.21 (1991/08/15)]
Renamings of functions containing the name atom $simple$,
and renaming of $aconv$.
\item [Issue 1.22 (1991/09/03)]
Added futher tests for error 6067. Made some duplicated test labels unique.
\item [Issue 1.23 (1991/09/04), 1.24 (1991/10/08)]
Tidying up prior to desk check.
\item [Issue 1.25 (1991/10/17)]
Corrected for fixity of $Div$ and $Mod$.
\item [Issue 1.26 (1991/11/07)]
Added instructions for testing of hierarchy facilities.
\item [Issue 1.27 (1991/11/08)]
Corrected test ``$pp'load\_hierarchy\ 6033$''.
\item [Issue 1.28 (1991/11/11)]
Added $pp'plus\_conv$, removed $pp'div2\_conv$ and $pp'mod2\_conv$,
following change request CR007.

\item[Issue 1.29 (1992/01/20), \FormatDate{92/01/20} ] Updated to use new fonts.
\item [Issue 1.30 (1992/02/07)]
Added new scope test.
\item [Issue 1.31 (1992/04/09) (8th April 1992)]
Changes required by CR0016.
\item [Issue 1.32 (1992/04/14) (13th April 1992)]
Changes due to CR0017.
\item [Issue 1.33 (1992/04/21) (21 April 1992)]
Reduce dependency upon the exact format of the pretty printer's outputs.
\item[Issue 1.34 (1992/05/15) (15 May 1992)] Use correct quotation symbols.
\item [Issue 1.35 (1992/05/20) (20th May 1992)]
Added $pp'get\_pervasive\_theory\_name$.
\item [Issue 1.36 (1992/05/21),1.37 (1992/05/22) (21st May 1992)]
Improved 6056.
\item [Issue 1.38 (1992/07/14) (14th July 1992)]
Collapsed error 6052 into 6051.
\item [Issue 1.39 (1999/02/22) (22nd February 1999)]
Update for SML97.
\item [Issue 1.40 (1999/03/08)] Update for new INTEGER type.
\item[Issue 1.41 (2002/06/03)]
Allowed for use of efficient dictionaries in THEORY type.
\item[Issue 1.42 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.43 (2005/04/18)] Allowed for new policy on names of inference rules in error message sources.
\item[Issue 1.44 (2005/12/15)] Allowed for reformed kernel interface.
\item[Issue 1.45 (2005/12/16)] The prefix for private interfaces is now $pp'$ rather than $icl'$.
\item[Issue 1.46 (2006/01/26)] Added tests for $pp'step\_current\_level$.
\item[Issue 1.47 (2014/04/12)] Allowed for rationalisation of error handling.
\item[Issue 1.48 (2014/04/12)] Accommodated replacement of
=INLINEFT
simple_new_defn
=TEX
\ by
=INLINEFT
gen_new_spec
=TEX
.
\item[Issue 1.49 (2014/04/14)] Added specific tests for
=INLINEFT
gen_new_spec
=TEX
.
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
This document contains the module testing of the Abstract Data Type $THM$, required by Release 1 ICL HOL Product Requirement Specification \cite{DS/FMU/IED/DEF004}.
The design is in \cite{DS/FMU/IED/DTD006}
and it is
implemented in \cite{DS/FMU/IED/IMP006}.

\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains the module testing of the material given a design in \cite{DS/FMU/IED/DTD006},
following the test policy given in that document and the general policy given in \cite{DS/FMU/IED/PLN008}.

\subsubsection{Dependencies}
This document is derived from the detailed design in \cite{DS/FMU/IED/DTD006},
and is further influenced by the implementation, in  \cite{DS/FMU/IED/IMP006}.
It does not depend on the ICL HOL parser, and only incidentally
on the pretty printer.
This is because these tools rely on the correct setting of
scopes by functions relying on those of this document.
\subsubsection{Deficiencies}
None known, except as detailed in section \ref{untested}.
\section{TEST CASES}
We test each function of the signature of \cite{DS/FMU/IED/DTD003},
both for correct function, and all error cases given messages
in the detailed design,
except for those exceptions noted in section \ref{untested}.
Due to the interdependencies of the functions tested the order of the tests is not the order of the detailed design
document.

The correct handling of the hierarchy material is primarily tested ``by hand'', rather than with the test harness, as described
in section \ref{hierarchy}.
\section{UTILITIES}
=SML
PPCompiler.print_depth 10;
=TEX
Initialise the test package:
=SML
use_file "dtd013.sml";
use_file "imp013.sml";
init_mt_results();
=TEX
We want to test in the context of empty theories,
and at least the pp'Kernel so:
=SML
open pp'Kernel;
pp'open_theory 0;
=TEX
The following functions help us recycle the tests originally
designed to test the old pp'new\_defn function and to test
its replacement $gen\_new\_spec$.
=SML
fun mk_def (deflhs : string, defrhs : TERM) : TERM = (
	mk_eq(mk_var(deflhs, type_of defrhs), defrhs)
);
fun eq_defn (keys, deflhs, defrhs) = (
	pp'gen_new_spec(keys, asm_rule(mk_def(deflhs, defrhs)))
);
fun add_def_to_asms (deflhs : string, defrhs : TERM) (thm : THM) : THM = (
	let	val def = mk_def(deflhs, defrhs);
		val template = concl thm;
		val var = mk_var("do_not_use_this_name_anywhere_else_1", type_of defrhs);
	in	subst_rule [(asm_rule def, var)] template thm
	end
);
=TEX
Some functions to isolate this test material from the precise details
of the pretty printer's output.  These functions are used when testing
error conditions where the error message contains a formatted type or
term.  These routines might use the HOL pretty printer (via routines
$format_term1$ and $format_type1$ from $PrettyPrinter$) however they
might not be installed, the $sting\_of\_XXX$ functions defend us from this.

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

=SML
fun ⦏theory_names⦎ ((): unit) : string list = (
let	val hier = pp'get_hierarchy();
in
	map fst (hier drop
		(fn (_,{status = status,...}) => status = TSDeleted))
end);

fun ⦏internal_name⦎ (n : string) : int = (
let	val hier = pp'get_hierarchy();
	val {contents = {name, ...}, ...} = force_value(s_lookup n hier);
in	name
end);


map (fn x => pp'delete_theory (internal_name x)
	handle (Fail _) => ()) (theory_names());

repeat pp'delete_extension;
=TEX
We provide a list of diagnostic printing functions.
Those called $string\_of\_\ldots$ turn objects of various significant types ($THM$, etc)
into strings appropriate for our needs,
those called $print\_\ldots$ apply $diag\_string$ to the output
of the associated $string\_of\_\ldots$.

We also provide a pair of functions on $TERM$ that don't give the type information.
=SML
fun ⦏string_of_seq⦎ ((tml , tm): SEQ) : string = (
	format_list string_of_term tml ", " ^
	"⊢ " ^ string_of_term tm
);
=TEX
The following functions, apart from displaying
the contents of various Kernel objects, test, by side effect,
two kernel access functions: $pp'dest\_thm$ and $pp'get\_hierarchy$.
=SML
fun ⦏string_of_thm1⦎ (key:string) (them : THM) : string = (
let val {level=level,theory={name=iname,...},sequent=sequent} =
		pp'dest_thm them
	in
		"In theory "^ string_of_int iname ^
		", at level "^ string_of_int level ^
		", with key "^ key ^
		"\n" ^
		string_of_seq sequent
end);

fun ⦏string_of_thy⦎ ({name = iname,
		ty_env = ty_env,
		con_env = con_env,
		parents = parents,
		del_levels = del_levels,
		axiom_dict = axiom_dict,
		defn_dict = defn_dict,
		thm_dict = thm_dict,
		current_level = current_level,
		user_data = user_data} : THEORY) : string = (
	"Internal name " ^ string_of_int iname ^
	", Current Level " ^ string_of_int current_level^
	", Parents " ^ format_list string_of_int parents ", " ^
	"\n***Types***\n" ^
	implode (map (fn (nm,{arity=arity,level=level}) =>
		("     " ^ nm ^
		": arity="^string_of_int arity ^
		", level="^string_of_int level ^ "\n"))
		(oe_flatten ty_env) )^
	"***Constants***\n" ^
	implode (map (fn (nm,{ty=ty,level=level}) =>
		("     " ^ nm ^
		": ty="^string_of_type ty ^
		", level="^string_of_int level ^ "\n"))
		(oe_flatten con_env)) ^
	(format_list (Combinators.I)
	(["***Theorems***"] @
	(map (uncurry string_of_thm1) (oe_flatten thm_dict)) @
	["***Definitions***"] @
	(map (uncurry string_of_thm1) (oe_flatten defn_dict)) @
	["***Axioms***"] @
	(map (uncurry string_of_thm1) (oe_flatten axiom_dict))) "\n")
);

fun ⦏string_of_ti⦎ ({status : THEORY_STATUS,
	inscope : bool,
	contents : THEORY,
	children : int list,
	name : string}:THEORY_INFO) : string = (
	"Theory " ^ name ^ "\n" ^
	(if inscope then "In Scope, " else "Out of Scope, ") ^
	(case status of
	TSNormal => "Status: Normal, "
	| TSDeleted => "Status: Deleted, "
	| TSLocked => "Status: Locked, "
	| TSAncestor => "Status: Ancestor, ") ^
	"Children:" ^ (format_list string_of_int children ", ") ^ "\n" ^

	string_of_thy contents
);

fun ⦏print_ti⦎ (ti : THEORY_INFO) : unit = diag_line(string_of_ti ti);

fun ⦏string_of_hierarchy⦎ (():unit) : string = (
	implode(map (fn (p,q) => ("------ti key: "^p^"------\n" ^
		string_of_ti q ^ "\n"))
	(pp'get_hierarchy ())));

fun ⦏print_hierarchy⦎ (():unit) : unit = diag_line(string_of_hierarchy ());

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
infix 3 =*$;
infix 3 =*:;
=TEX
=SML
fun (a,b) =**$ (c,d) = (a =$ c) andalso (b =$ d);
fun  (a,b) =**: (c,d) = (a =: c) andalso (b =: d);
fun (a,b) =*$ (c,d) = (a = c) andalso (b =$ d);
fun (a,b) =*: (c,d) = (a = c) andalso (b =: d);
=TEX

\section{VALUE BINDINGS}
Such as can be given here:
=SML
val v1 = mk_var("v1", BOOL);
val v2 = mk_var("v2", BOOL);
val tv1 = mk_vartype "'tv1";
val tva = mk_vartype "'a";
val tv'1 = mk_vartype "'1";
val tv'2 = mk_vartype "'2";
val vtv1 = mk_var("vtv1",tv1);
val v1 = mk_var("v1", BOOL);
val v2 = mk_var("v2", BOOL);
val N0 = (mk_ℕ o integer_of_int) 0;
val N1 = (mk_ℕ o integer_of_int) 1;
val N2 = (mk_ℕ o integer_of_int) 2;
val N3 = (mk_ℕ o integer_of_int) 3;
val N7 = (mk_ℕ o integer_of_int) 7;
val N9 = (mk_ℕ o integer_of_int) 9;
val pB = mk_var("p",BOOL);
val qB = mk_var("q",BOOL);
val xB = mk_var("x",BOOL);
val p1 = mk_var("p",tv'1);
val q1 = mk_var("q",tv'1);
val pa = mk_var("p",tva);
val qa = mk_var("q",tva);
val qa' = mk_var("q'",tva);
val p11 = mk_var("p1",tv'1);
val q1B = mk_var("q1",BOOL);
val pa = mk_var("p",tva);
val exists_p_q = mk_∃(p1, qB);
val exists_pB_q = mk_∃(pB, qB);
val exists_pa_q = mk_∃(pa, qB);
val exists_p_q1 = mk_∃(p1,q1B);
val exists_p1_q = mk_∃(p11, qB);
val So = mk_const("So",BOOL);
val IsSo = mk_const("IsSo",BOOL);
val vSo = mk_var("So",BOOL);
val vIsSo = mk_var("IsSo",BOOL);
=TEX

\section{THE TESTS}
Our initial hierarchy of (empty) theories.
All theories bar ``min'' should have status $Deleted$, and ``min'' should be
 empty.
=SML
print_hierarchy ();
=TEX
\subsection{Basic Theory Handling}
=SML
val next_index = pp'new_theory "next";
store_mt_results mt_run [("pp'new_theory 1",
	pp'new_theory,
	"another",
	next_index+1)];
val another_index = next_index+1;
store_mt_results mt_run [("pp'open_theory 1 a",
	pp'open_theory,
	next_index,
	([next_index],[]))];
store_mt_results mt_run [("pp'get_current_theory_name",
	pp'get_current_theory_name,
	(),
	next_index)];
store_mt_results mt_run [("pp'new_theory a",
	pp'new_theory,
	"yet_again",
	next_index+2)];
val yet_again_index = next_index+2;
store_mt_results mt_run_fail [("pp'new_theory 6040",
	pp'new_theory,
	"yet_again",
	gen_fail_msg "pp'new_theory" 6040 ["yet_again"])];
store_mt_results mt_run_fail [("pp'open_theory 6035 a",
	pp'open_theory,
	(next_index+3),
	gen_fail_msg "pp'open_theory" 6043 [string_of_int(next_index+3)])];

print_hierarchy ();
=TEX
\subsection{Changing Scopes}
While we build up our basic test theories we also give a test of scopes: an older version of imp006 would give a failure, if the following executes at all the bug has gone.
The failure was to do with scopes not being completely cleared of that what was going out of scope before new material was added.
=SML
pp'open_theory next_index;
pp'new_type("ScopeTest",1);
pp'open_theory another_index;
pp'new_type("ScopeTest",2);
pp'open_theory next_index;
pp'open_theory another_index;
pp'open_theory next_index;
=TEX
=SML
store_mt_results (mt_runf (op =:)) [("pp'new_type 1",
	pp'new_type,
	("BOOL",0),
	mk_ctype("BOOL",[]))];
=TEX
Another test, that earlier versions of the system would fail on (giving design errors) is:
=SML

pp'open_theory 0;
val scopetest1_index = pp'new_theory "scopetest1";
pp'open_theory scopetest1_index;
val scopetest2_index = pp'new_theory "scopetest2";
pp'open_theory scopetest1_index;
val scopetest3_index = pp'new_theory "scopetest3";
pp'open_theory scopetest3_index;
val scopetest4_index = pp'new_theory "scopetest4";
pp'open_theory scopetest4_index;
pp'new_const("scopetest4",tva);
pp'open_theory scopetest2_index;
val scopetest5_index = pp'new_theory "scopetest5";
pp'open_theory scopetest5_index;
pp'new_parent scopetest4_index;
pp'get_theory_info scopetest2_index;
pp'get_theory_info scopetest3_index;
pp'get_theory_info scopetest4_index;
pp'get_theory_info scopetest5_index;
pp'get_theory_info scopetest1_index;

pp'open_theory scopetest5_index;
pp'open_theory 0;
map pp'delete_theory [scopetest5_index, scopetest4_index, scopetest3_index,
	scopetest2_index, scopetest1_index];
pp'open_theory next_index;
=TEX
No failures = successful test.
\subsection{Theory Names}
=SML
store_mt_results mt_run [("pp'get_theory_name 1",
	pp'get_theory_name,
	next_index,
	"next")];
store_mt_results mt_run_fail [("pp'get_theory_name 6043 a",
	pp'get_theory_name,
	100,
	gen_fail_msg "pp'get_theory_name" 6043 ["100"]),
	("pp'get_theory_name 6043 b",
	pp'get_theory_name,
	~1,
	gen_fail_msg "pp'get_theory_name" 6043 ["-1"])];
=TEX
\subsection{Theory Information}
=SML
print_ti(pp'get_theory_info next_index);
store_mt_results mt_run_fail [("pp'get_theory_info 6035 a",
	pp'get_theory_info,
	(scopetest5_index+1),
	gen_fail_msg "pp'get_theory_info" 6043 [string_of_int(scopetest5_index+1)])];
=TEX
\subsection{Introducing Types}
=SML
store_mt_results (mt_runf (op =:)) [("pp'new_type 2",
	pp'new_type,
	("ℕ",0),
	mk_ctype("ℕ",[])),
	("pp'new_type 4",
	pp'new_type,
	("→",2),
	mk_ctype("→",[tv'1,tv'2]))];
store_mt_results mt_run_fail [("pp'new_type 6045",
	pp'new_type,
	("ℕ",0),
	gen_fail_msg "pp'new_type" 6045 ["ℕ"])];

print_ti(pp'get_theory_info next_index);
=TEX
The following ensures that we cannot have a negative arity:
=SML
store_mt_results mt_run_fail [("pp'new_type 6088",
	pp'new_type,
	("rubbish",~1),
	gen_fail_msg "pp'new_type" 6088 [])];
=TEX
\subsection{Introducing Constants}
We first test that ill-formed constants cannot be declared.
=SML
store_mt_results mt_run_fail [("pp'new_const 3002",
	pp'new_const,
	("=",BOOL),
	gen_fail_msg "pp'new_const" 3002 []),
	("pp'new_const 3003",
	pp'new_const,
	("⇒",BOOL),
	gen_fail_msg "pp'new_const" 3003 []),
	("pp'new_const 3004",
	pp'new_const,
	("∀",BOOL),
	gen_fail_msg "pp'new_const" 3004 ["∀"])
	];
=TEX
Now a test to ensure that constants cannot be introduced
with unknown types.
=SML
store_mt_results mt_run_fail [("pp'new_const 6013",
	pp'new_const,
	("TypeWrong",mk_ctype("TYPEWRONG",[])),
	gen_fail_msg "pp'new_const" 6013 [pr_type(mk_ctype("TYPEWRONG",[])),"TYPEWRONG"])];
=TEX
Then a proper instance of one of these constants:
=SML
pp'new_const("=",mk_→_type(tv1, mk_→_type(tv1, BOOL)));
=TEX
\subsection{Stepping the Level Counter}
=SML
val ⦏get_current_level⦎ : unit -> int = (fn () =>
	(#level o
	pp'dest_thm o
	refl_conv o
	mk_var)
	("x", mk_vartype "'a")
);
val lv = get_current_level();
pp'step_current_level();
store_mt_results
mt_run[
	("pp'step_current_level 1", get_current_level, (), lv + 1)
];
=TEX
\subsection{Failures When Saving Theorems}
=SML
val n1 = pp'list_save_thm(["n1"], pp'asm_rule v1);
store_mt_results mt_run_fail [("pp'list_save_thm 6039",
	pp'list_save_thm,
	(["n1"], pp'asm_rule v1),
	gen_fail_msg "pp'list_save_thm" 6039 ["n1","next"]),
	("pp'list_save_thm 6031",
	pp'list_save_thm,
	([], pp'asm_rule v1),
	gen_fail_msg "pp'list_save_thm" 6031 []),
	("pp'list_save_thm 6013",
	pp'list_save_thm,
	(["n2"], pp'refl_conv (mk_var("rv",mk_ctype("rubbish",[])))),
	gen_fail_msg "pp'list_save_thm" 6013 ["⊢ rv = rv","rubbish"])
	];
let val irc = pp'Kernel.pp'refl_conv (mk_var("rv",mk_ctype("BOOL",[BOOL])));
in
store_mt_results mt_run_fail [
	("pp'list_save_thm 6014",
	pp'list_save_thm,
	(["n2"], irc),
	gen_fail_msg "pp'list_save_thm" 6014 [pr_thm irc,"BOOL"])
	]
end;
let val irc = pp'refl_conv (mk_const("rv",BOOL));
in
store_mt_results mt_run_fail [
	("pp'list_save_thm 6015",
	pp'list_save_thm,
	(["n2"], irc),
	gen_fail_msg "pp'list_save_thm" 6015 [pr_thm irc,"rv"])
	]
end;
let val irc = pp'refl_conv (mk_const("1",BOOL));
in
store_mt_results mt_run_fail [
	("pp'list_save_thm 6038",
	pp'list_save_thm,
	(["n2"], irc),
	gen_fail_msg "pp'list_save_thm" 6038 [pr_thm irc,"1"])
	]
end;
store_mt_results mt_run [("pp'open_theory 2 a",
	pp'open_theory,
	another_index,
	([next_index+1],[next_index])),
	("pp'open_theory 2 b",
	pp'open_theory,
	another_index,
	([],[]))];
store_mt_results mt_run_fail [("pp'list_save_thm 6013 b",
	pp'list_save_thm,
	(["n2"], pp'asm_rule v1),
	gen_fail_msg "pp'list_save_thm" 6013 ["v1 ⊢ v1","BOOL"])
	];
=TEX
\subsection{Introducing Types and Constants 2}
=SML
store_mt_results mt_run [("pp'open_theory 1 b",
	pp'open_theory,
	next_index,
	([next_index],[next_index+1]))];
store_mt_results (mt_runf (op =$)) [
	("pp'new_const 3",
	pp'new_const,
	("T",BOOL),
	mk_t),
	("pp'new_const 4",
	pp'new_const,
	("F",BOOL),
	mk_f)
	];
store_mt_results (mt_runf (op =$)) [("pp'new_const 7",
	pp'new_const,
	("Test",BOOL),
	mk_const("Test",BOOL))];
=TEX
We can now see whether types can be introduced that are
already in the descendants:
=SML
store_mt_results (mt_runf (op =:)) [("pp'new_type 3",
	pp'new_type,
	("×",2),
	mk_ctype("×",[tv'1,tv'2]))];

print_ti(pp'get_theory_info next_index);
store_mt_results mt_run [("pp'open_theory 3 a",
	pp'open_theory,
	0,
	([],[next_index]))];

store_mt_results mt_run_fail [("pp'new_type 6034",
	pp'new_type,
	("×",2),
	gen_fail_msg "pp'new_type" 6034 ["×"])];
=TEX
Then the same for constants:
=SML
val UNIT = pp'new_type ("UNIT",0);
val Unit = pp'new_const("Unit",UNIT);
print_ti(pp'get_theory_info 0);
store_mt_results mt_run [("pp'open_theory 1 c",
	pp'open_theory,
	next_index,
	([next_index],[]))];
val AlsoUnit = pp'new_const("AlsoUnit",UNIT);
store_mt_results mt_run [("pp'open_theory 3 b",
	pp'open_theory,
	0,
	([],[next_index]))];
store_mt_results mt_run_fail [("pp'new_const 6063",
	pp'new_const,
	("AlsoUnit",UNIT),
	gen_fail_msg "pp'new_const" 6063 ["AlsoUnit"])];
store_mt_results mt_run_fail [("pp'gen_new_spec 6063",
	eq_defn,
	(["AlsoUnit"],"AlsoUnit", Unit),
	gen_fail_msg "pp'gen_new_spec" 6063 ["AlsoUnit"])];
store_mt_results mt_run [("pp'open_theory 4 a",
	pp'open_theory,
	yet_again_index,
	([next_index,next_index+2],[]))];
=TEX
\subsection{Deleting Extensions and Theorems}
=SML
store_mt_results mt_run [("pp'open_theory 2 c",
	pp'open_theory,
	another_index,
	([next_index+1],[next_index,next_index+2]))];
store_mt_results (mt_runf (op =:)) [("pp'new_type 5",
	pp'new_type,
	("BOOL",0),
	mk_ctype("BOOL",[]))];
store_mt_results (mt_runf (op =$)) [
	("pp'new_const 1",
	pp'new_const,
	("T",BOOL),
	mk_t),
	("pp'new_const 2",
	pp'new_const,
	("F",BOOL),
	mk_f)
	];

print_ti(pp'get_theory_info another_index);
store_mt_results mt_run [("pp'delete_extension 1",
	pp'delete_extension,
	(),
	4)];
print_ti(pp'get_theory_info (pp'get_current_theory_name()));
val s1 = pp'list_save_thm(["s1"], pp'asm_rule v1);
store_mt_results mt_run_fail [("pp'delete_extension 6077",
	pp'delete_extension,
	(),
	gen_fail_msg "pp'delete_extension" 6077 ["another","s1"])];
store_mt_results (mt_runf (op =|-)) [("pp'delete_thm 1",
	pp'delete_thm,
	"s1",
	s1)];
store_mt_results mt_run [("pp'delete_extension 2",
	pp'delete_extension,
	(),
	3)];
val TorF = pp'new_const("TorF",BOOL);
print_ti(pp'get_theory_info (pp'get_current_theory_name()));
fun pp'delete_extension (u:unit): int = (
let val n = pp'Kernel.pp'delete_extension u
in
	(diag_line("pp'delete_extension @ "^string_of_int n);
	n)
end);
store_mt_results mt_run [("pp'delete_extension 3",
	pp'delete_extension,
	(),
	7),
	("pp'delete_extension 4",
	pp'delete_extension,
	(),
	2),
	("pp'delete_extension 5",
	pp'delete_extension,
	(),
	1)];
store_mt_results mt_run_fail [("pp'delete_extension 6050",
	pp'delete_extension,
	(),
	gen_fail_msg "pp'delete_extension" 6050 ["another"])];
store_mt_results mt_run [("pp'open_theory 4 b",
	pp'open_theory,
	yet_again_index,
	([next_index,next_index+2],[next_index+1]))];
=TEX
\subsection{New Axioms}
=SML
store_mt_results (mt_runf (op =#)) [("pp'new_axiom 1",
	dest_thm o pp'new_axiom,
	(["truth_axiom"],mk_t),
	([],mk_t)),
	("pp'new_axiom 2",
	dest_thm o pp'new_axiom,
	(["not so", "No way!"], mk_f),
	([], mk_f)),
	("pp'new_axiom 3",
	dest_thm o pp'new_axiom,
	(["testing"],mk_app(mk_var("f",mk_→_type(BOOL,BOOL)), mk_t)),
	([],mk_app(mk_var("f",mk_→_type(BOOL,BOOL)), mk_t)))
	];

let
	val twa_mk_eq = mk_eq(mk_var("v",mk_ctype("BOOL",[BOOL])),
		mk_var("v",mk_ctype("BOOL",[BOOL])));
in
store_mt_results mt_run_fail [("pp'new_axiom 6047",
	pp'new_axiom,
	(["truth_axiom"],mk_t),
	gen_fail_msg "pp'new_axiom" 6047 ["truth_axiom","yet_again"]),
	("pp'new_axiom 6014 a",
	pp'new_axiom,
	(["type_wrong_axiom"],twa_mk_eq),
	gen_fail_msg "pp'new_axiom" 6014 [pr_term twa_mk_eq,"BOOL"]),
	("pp'new_axiom 6031",
	pp'new_axiom,
	([],mk_t),
	gen_fail_msg "pp'new_axiom" 6031 []),
	("pp'new_axiom 3031",
	pp'new_axiom,
	(["Not Bool"],N0),
	gen_fail_msg "pp'new_axiom" 3031 [pr_term N0])]
end;

store_mt_results mt_run [("pp'open_theory 2 d",
	pp'open_theory,
	another_index,
	([next_index+1],[next_index, next_index+2]))];
store_mt_results mt_run_fail [("pp'new_axiom 6013",
	pp'new_axiom,
	(["truth_axiom1"],mk_t),
	gen_fail_msg "pp'new_axiom" 6013 [pr_term mk_t,"BOOL"])];
store_mt_results mt_run [("pp'open_theory 4 c",
	pp'open_theory,
	yet_again_index,
	([next_index,next_index+2],[next_index+1]))];
store_mt_results (mt_runf (op =#)) [("pp'list_save_thm 1",
	dest_thm o pp'list_save_thm,
	(["tbd"],pp'asm_rule mk_t),
	([mk_t],mk_t))];
=TEX
\subsection{Locking Theories}
We first lock a theory, check that nothing can change it,
and then unlock it.
=SML
pp'lock_theory yet_again_index;
print_ti(pp'get_theory_info yet_again_index);
store_mt_results mt_run_fail [("pp'lock_theory 1",
	pp'new_axiom,
	(["Truth_axiom"],mk_t),
	gen_fail_msg "pp'new_axiom" 6037 ["yet_again"])];
store_mt_results mt_run_fail [("pp'lock_theory 2",
	pp'list_save_thm,
	(["Example"],pp'asm_rule v1),
	gen_fail_msg "pp'list_save_thm" 6037 ["yet_again"])];
store_mt_results mt_run_fail [("pp'lock_theory 3",
	pp'new_const,
	("ForT",BOOL),
	gen_fail_msg "pp'new_const" 6037 ["yet_again"])];
store_mt_results mt_run_fail [("pp'lock_theory 4",
	pp'new_type,
	("SOMETHING",3),
	gen_fail_msg "pp'new_type" 6037 ["yet_again"])];
store_mt_results mt_run_fail [("pp'lock_theory 5",
	pp'delete_extension,
	(),
	gen_fail_msg "pp'delete_extension" 6037 ["yet_again"])];
store_mt_results mt_run_fail [("pp'lock_theory 6",
	pp'delete_thm,
	"tba",
	gen_fail_msg "pp'delete_thm" 6037 ["yet_again"])];
store_mt_results mt_run_fail [("pp'lock_theory 7",
	eq_defn,
	(["SomeWhere"],"SomeWhere", mk_f),
	gen_fail_msg "pp'gen_new_spec" 6037 ["yet_again"])];
store_mt_results mt_run_fail [("pp'lock_theory 8",
	pp'new_type_defn,
	( [ "TestType"], "TestType", ["'2"], pp'asm_rule mk_t),
	gen_fail_msg "pp'new_type_defn" 6037 ["yet_again"])];
store_mt_results mt_run_fail [("pp'lock_theory 9",
	pp'new_spec,
	( [ "TestSpec"], 1, pp'asm_rule mk_t),
	gen_fail_msg "pp'new_spec" 6037 ["yet_again"])];
store_mt_results mt_run_fail [("pp'lock_theory 10",
	pp'new_parent,
	another_index,
	gen_fail_msg "pp'new_parent" 6037 ["yet_again"])];
store_mt_results mt_run [("pp'lock_theory 11",
	get_current_theory_status,
	(),
	TSLocked)];
store_mt_results mt_run_fail [("pp'lock_theory 12",
	pp'step_current_level,
	(),
	gen_fail_msg "pp'step_current_level" 6037 ["yet_again"])];

pp'unlock_theory yet_again_index;
=TEX
=SML
store_mt_results mt_run [("pp'unlock_theory 13",
	get_current_theory_status,
	(),
	TSNormal)];
=TEX
\subsection{Scope and Deletions}
We test various aspects of deletion: where we can do it,
what effect deletion has, etc.
=SML
store_mt_results mt_run [("pp'open_theory 3 c",
	pp'open_theory,
	0,
	([],[next_index, next_index+2]))];
store_mt_results mt_run_fail [("pp'delete_extension 6076",
	pp'delete_extension,
	(),
	gen_fail_msg "pp'delete_extension" 6076 ["min"])];
store_mt_results mt_run [("pp'open_theory 1 d",
	pp'open_theory,
	next_index,
	([next_index],[]))];
val tbd_index = pp'new_theory "to_be_deleted";
store_mt_results mt_run [("pp'open_theory 5",
	pp'open_theory,
	tbd_index,
	([tbd_index],[]))];
val thy_deleted_thm = pp'list_save_thm(["thy_deleted_thm"],
	pp'asm_rule v1);
store_mt_results mt_run [("pp'open_theory 1 e",
	pp'open_theory,
	next_index,
	([],[tbd_index]))];
pp'delete_theory tbd_index;
print_hierarchy();
store_mt_results mt_run_fail [("pp'get_theory_info 6089",
	pp'get_theory_info,
	tbd_index,
	gen_fail_msg "pp'get_theory_info" 6089 [string_of_int tbd_index])];
store_mt_results mt_run_fail [("pp'get_theory_name 6089",
	pp'get_theory_name,
	tbd_index,
	gen_fail_msg "pp'get_theory_name" 6089 [string_of_int tbd_index])];

store_mt_results mt_run_fail [("pp'open_theory 6089",
	pp'open_theory,
	tbd_index,
	gen_fail_msg "pp'open_theory" 6089 [string_of_int tbd_index])];


store_mt_results mt_run_fail [("pp'delete_theory 6089 b",
	pp'delete_theory,
	tbd_index,
	gen_fail_msg "pp'delete_theory" 6089 [string_of_int tbd_index])];
store_mt_results mt_run_fail [("pp'lock_theory 6089 a",
	pp'lock_theory,
	tbd_index,
	gen_fail_msg "pp'lock_theory" 6089 [string_of_int tbd_index]),
	("pp'lock_theory 6043 b",
	pp'lock_theory,
	tbd_index+100,
	gen_fail_msg "pp'lock_theory" 6043 [string_of_int(tbd_index+100)])];
store_mt_results mt_run [("pp'new_theory 3",
	pp'new_theory,
	"to_be_deleted",
	tbd_index+1)];
pp'delete_theory (tbd_index+1);
store_mt_results mt_run_fail [("pp'delete_theory 6076",
	pp'delete_theory,
	0,
	gen_fail_msg "pp'delete_theory" 6076 ["min"])];

pp'lock_theory yet_again_index;
store_mt_results mt_run_fail [("pp'lock_theory 13",
	pp'delete_theory,
	yet_again_index,
	gen_fail_msg "pp'delete_theory" 6037 ["yet_again"])];
pp'unlock_theory yet_again_index;
store_mt_results mt_run [("pp'open_theory 4 d",
	pp'open_theory,
	yet_again_index,
	([next_index+2],[]))];
store_mt_results mt_run_fail [("pp'delete_theory 6069",
	pp'delete_theory,
	yet_again_index,
	gen_fail_msg "pp'delete_theory" 6069 ["yet_again"])];
store_mt_results mt_run_fail [("pp'unlock_theory 6089 a",
	pp'unlock_theory,
	tbd_index,
	gen_fail_msg "pp'unlock_theory" 6089 [string_of_int tbd_index]),
	("pp'lock_theory 6035 c",
	pp'unlock_theory,
	tbd_index+1,
	gen_fail_msg "pp'unlock_theory" 6089 [string_of_int(tbd_index+1)]),
	("pp'lock_theory 6068",
	pp'unlock_theory,
	yet_again_index,
	gen_fail_msg "pp'unlock_theory" 6068 ["yet_again"])];
=TEX
=SML
store_mt_results mt_run_fail [("pp'delete_thm 6046",
	pp'delete_thm,
	"rubbish",
	gen_fail_msg "pp'delete_thm" 6046 ["rubbish","yet_again"])];
store_mt_results mt_run_error [("pp'list_save_thm 6036",
	pp'list_save_thm,
	(["s2"], thy_deleted_thm),
	gen_fail_msg "pp'list_save_thm" 6036
	["v1 ⊢ v1","to_be_deleted",string_of_int tbd_index])];
=TEX
\subsection{Duplicating Theories}
$pp'duplicate\_theory$ is tested by visual checking
of the display of the resulting duplicate theory.
=SML
print_ti(pp'get_theory_info next_index);
val copy_of_next_index = pp'duplicate_theory next_index "copy_of_next";
print_ti(pp'get_theory_info copy_of_next_index);

store_mt_results mt_run_fail [("pp'duplicate_theory 6040",
	pp'duplicate_theory (copy_of_next_index+1),
	"copy_of_next",
	gen_fail_msg "pp'duplicate_theory" 6040 ["copy_of_next"]),
	("pp'duplicate_theory 6035 a",
	pp'duplicate_theory (copy_of_next_index+1),
	"copy_of_rubbish",
	gen_fail_msg "pp'duplicate_theory" 6043 [string_of_int(copy_of_next_index+1)]),
	("pp'duplicate_theory 6089 b",
	pp'duplicate_theory tbd_index,
	"copy_of_rubbish",
	gen_fail_msg "pp'duplicate_theory" 6089 [string_of_int(tbd_index)])
];
=TEX
\subsubsection{pp'gen\_new\_spec}
We first need a number of constants to allow theorems to
be saved with declared constants and types.
=SML
pp'open_theory next_index;
pp'new_const("∃",mk_→_type(mk_→_type(tv1,BOOL),BOOL));
pp'new_const("∀",mk_→_type(mk_→_type(tv1,BOOL),BOOL));
pp'new_const("⇒",mk_→_type(BOOL,mk_→_type(BOOL,BOOL)));
pp'new_const("∧",mk_→_type(BOOL,mk_→_type(BOOL,BOOL)))
	handle _ => mk_t;
pp'new_const("∨",mk_→_type(BOOL,mk_→_type(BOOL,BOOL)))
	handle _ => mk_t;
pp'new_const("¬",mk_→_type(BOOL,BOOL))
	handle _ => mk_t;
pp'open_theory yet_again_index;
=TEX
Now the tests:
=SML
store_mt_results (mt_runf (op =#)) [
	("pp'gen_new_spec 1",
	dest_thm o eq_defn,
	(["True"],"True",mk_t),
	([],mk_⇔(mk_const("True",BOOL),mk_t))),
	("pp'gen_new_spec 2",
	dest_thm o eq_defn,
	(["False"],"False",mk_f),
	([],mk_⇔(mk_const("False",BOOL),mk_f)))
	];
=TEX
=SML
store_mt_results (mt_runf (op =#)) [
	("pp'gen_new_spec 3",
	dest_thm o pp'gen_new_spec,
	(["xyz1"], asm_rule (mk_def("xyz1", mk_t))),
	([], mk_⇔(mk_const("xyz1",BOOL), mk_t))),
	("pp'gen_new_spec 4",
	dest_thm o pp'gen_new_spec,
	(["xyz2", "xyz3"], add_def_to_asms ("xyz3", mk_f) (asm_rule (mk_def("xyz2", mk_f)))),
	([], mk_⇔(mk_const("xyz2",BOOL), mk_f)))
	];
store_mt_results mt_run [
	("pp'gen_new_spec 5", curry (op mem) "xyz1" o map (fst o dest_const) o get_consts, "-", true),
	("pp'gen_new_spec 5", curry (op mem) "xyz2" o map (fst o dest_const) o get_consts, "-", true),
	("pp'gen_new_spec 5", curry (op mem) "xyz3" o map (fst o dest_const) o get_consts, "-", true)
	];
=SML
print_ti(pp'get_theory_info (pp'get_current_theory_name()));
store_mt_results mt_run_fail [
	("pp'gen_new_spec 6031",
	eq_defn,
	([],"True1",mk_t),
	gen_fail_msg "pp'gen_new_spec" 6031 []),
	("pp'gen_new_spec 6013",
	eq_defn,
	(["x"],"Rubbish",mk_var("v",mk_ctype("RUBBISH",[]))),
	gen_fail_msg "pp'gen_new_spec" 6013 [pr_term(mk_var("v",mk_ctype("RUBBISH",[]))),"RUBBISH"]),
	("pp'gen_new_spec 6049 a",
	eq_defn,
	(["True"],"True",mk_t),
	gen_fail_msg "pp'gen_new_spec" 6049 ["True"]),
	("pp'gen_new_spec 6049 b",
	eq_defn,
	(["0"],"0",N0),
	gen_fail_msg "pp'gen_new_spec" 6049 ["0"]),
	("pp'gen_new_spec 6051",
	eq_defn,
	(["True"],"True1",mk_t),
	gen_fail_msg "pp'gen_new_spec" 6051 ["True","yet_again"]),
	("pp'gen_new_spec 6058",
	eq_defn,
	(["Maybe1"],"Maybe1",mk_∀(vtv1,mk_eq(vtv1,vtv1))),
	gen_fail_msg "pp'gen_new_spec" 6058 [pr_term(mk_∀(vtv1,mk_eq(vtv1,vtv1))),"'tv1", "⌜Maybe1⌝"]),
	("pp'gen_new_spec 6059",
	eq_defn,
	(["Maybe"],"Maybe",v1),
	gen_fail_msg "pp'gen_new_spec" 6059 ["term", pr_term v1, "", "v1"])
	];
=TEX
=SML
val gen_new_spec_6019_thm = add_def_to_asms ("xyz", mk_t) (asm_rule (mk_def("xyz", mk_f)));
store_mt_results mt_run_fail [
	("pp'gen_new_spec 6019",
	pp'gen_new_spec,
	(["xyz"], gen_new_spec_6019_thm),
	gen_fail_msg "pp'gen_new_spec" 6019 ["xyz", string_of_thm gen_new_spec_6019_thm])
];
=TEX
=SML
val zero_def = eq_defn (["ZeRo"],"ZeRo",N0);
val ZeRo = mk_const("ZeRo",ℕ);
print_ti(pp'get_theory_info (pp'get_current_theory_name()));
pp'delete_extension ();
print_ti(pp'get_theory_info (pp'get_current_theory_name()));
=TEX
\subsection{Type Definitions}
Again, we need two new constants to make certain theorems valid:
=SML
pp'new_const("TypeDefn",mk_→_type(mk_→_type(tv1,BOOL),
	mk_→_type(mk_→_type(tv'2,tv1),BOOL)));
val Tv1Pred = pp'new_const("Tv1Pred",mk_→_type(tv1,BOOL));
=TEX
The actual tests:
=SML
val etype_ax = pp'new_axiom(["etype_ax"],
	mk_simple_∃(vtv1,mk_app(Tv1Pred,vtv1)));

local val x= mk_var("x",tv'2)
in
val etype2_exax = pp'new_axiom(["etype2_exax"],
	mk_simple_∃(x,mk_app(inst [] [(tv'2,tv1)]Tv1Pred,x)))
end;
val etype_def = pp'new_type_defn(["ETYPE"], "ETYPE",
	["'tv1"], etype_ax);
val etype2_def = pp'new_type_defn( [ "ETYPE2"], "ETYPE2", ["'2"], etype2_exax);
print_ti(pp'get_theory_info (pp'get_current_theory_name()));
let
	fun f t1 t2 = mk_var("f",mk_→_type(t1,t2));
in
store_mt_results (mt_runf (op =#)) [
	("pp'new_type_defn 1",
	dest_thm,
	etype_def,
	([], mk_∃(f (mk_ctype("ETYPE",[tv1])) tv1,
		list_mk_app(
		mk_const("TypeDefn",mk_→_type(mk_→_type(tv1,BOOL),
			mk_→_type(mk_→_type(mk_ctype("ETYPE",[tv1]),tv1),BOOL))),
		[inst [] [] Tv1Pred,f (mk_ctype("ETYPE",[tv1])) tv1])))),
	("pp'new_type_defn 2",
	dest_thm,
	etype2_def,
	([], mk_∃(f (mk_ctype("ETYPE2",[tv'2])) (tv'2),
		list_mk_app(
		mk_const("TypeDefn",mk_→_type(mk_→_type(tv'2,BOOL),
			mk_→_type(mk_→_type(mk_ctype("ETYPE2",[tv'2]),tv'2),BOOL))),
		[inst [] [(tv'2,tv1)] Tv1Pred,
		f (mk_ctype("ETYPE2",[tv'2])) (tv'2)]))))
	]
end;
val etype_ax_6054 = pp'new_axiom(["etype_ax_6054"], mk_t);
val etype_ax_6055 = pp'new_axiom(["etype_ax_6055"],
	mk_∃(mk_var("x",tv1),mk_t));
val etype_ax_6056 = pp'new_axiom(["etype_ax_6056"],
	mk_∃(mk_var("x",tv1),
		mk_app(mk_var("p",mk_→_type(tv1,BOOL)), mk_var("x",tv1))));
val etype_ax_6062 = pp'new_axiom(["etype_ax_6062"],
	mk_∃(mk_var("x",tv1),
		mk_app(mk_var("q",mk_→_type(BOOL,BOOL)),
		mk_app(mk_var("p",mk_→_type(tv1,BOOL)), mk_var("x",tv1)))));
val etype_ax_6080 = pp'new_axiom(["etype_ax_6080"],
	mk_∃(mk_var("x",tv1),
mk_app(mk_const("¬",mk_→_type(BOOL,BOOL)), mk_t)));
val _ = kernel_interface_diagnostics true;
store_mt_results mt_run_fail [
	("pp'new_type_defn 6031",
	pp'new_type_defn,
	([], "ETYPE1", ["'tv1"], etype_ax),
	gen_fail_msg "pp'new_type_defn" 6031 []),
	("pp'new_type_defn 6045",
	pp'new_type_defn,
	(["ETYPE1"], "ETYPE", ["'tv1"], etype_ax),
	gen_fail_msg "pp'new_type_defn" 6045 ["ETYPE"]),
	("pp'new_type_defn 6051",
	pp'new_type_defn,
	(["ETYPE"], "ETYPE1", ["'tv1"], etype_ax),
	gen_fail_msg "pp'new_type_defn" 6051 ["ETYPE","yet_again"]),
	("pp'new_type_defn 6053",
	pp'new_type_defn,
	(["ETYPE1"], "ETYPE1", ["'tv1"], pp'asm_rule mk_t),
	gen_fail_msg "pp'new_type_defn" 6053 ["T ⊢ T"]),
	("pp'new_type_defn 6054",
	pp'new_type_defn,
	(["ETYPE1"], "ETYPE1", ["'tv1"], etype_ax_6054),
	gen_fail_msg "pp'new_type_defn" 6054 ["⊢ T"]),
	("pp'new_type_defn 6055",
	pp'new_type_defn,
	(["ETYPE1"], "ETYPE1", ["'tv1"], etype_ax_6055),
	gen_fail_msg "pp'new_type_defn" 6055 ["⊢ ∃ x⦁ T"]),
	("pp'new_type_defn 6056",
	pp'new_type_defn,
	(["ETYPE1"], "ETYPE1", ["'tv1"], etype_ax_6056),
	gen_fail_msg "pp'new_type_defn" 6059 ["theorem", "⊢ ∃ x⦁ p x", "", "p"]),
	("pp'new_type_defn 6062",
	pp'new_type_defn,
	(["ETYPE1"], "ETYPE1", ["'tv1"], etype_ax_6062),
	gen_fail_msg "pp'new_type_defn" 6059 ["theorem", "⊢ ∃ x⦁ q (p x)", "s", "p, q"]),
	("pp'new_type_defn 6057",
	pp'new_type_defn,
	(["ETYPE1"], "ETYPE1", ["'not_there"], etype_ax),
	gen_fail_msg "pp'new_type_defn" 6057 ["⊢ ∃ vtv1⦁ Tv1Pred vtv1", "'tv1"]),
	("pp'new_type_defn 6079",
	pp'new_type_defn,
	(["ETYPE1"], "ETYPE1", ["'tv1","'tv1"], etype_ax),
	gen_fail_msg "pp'new_type_defn" 6079 ["'tv1"]),	("pp'new_type_defn 6080",
	pp'new_type_defn,
	(["ETYPE1"], "ETYPE1", ["'tv1"], etype_ax_6080),
	gen_fail_msg "pp'new_type_defn" 6080 ["⊢ ∃ x⦁ ¬ T"])
	];
store_mt_results mt_run_error [
	("pp'new_type_defn 6036",
	pp'new_type_defn,
	( ["rubbish"], "rubbish", [], thy_deleted_thm),
	gen_fail_msg "pp'new_type_defn" 6036 ["v1 ⊢ v1",
		"to_be_deleted",string_of_int tbd_index])
	];

store_mt_results mt_run [("pp'open_theory 3 e",
	pp'open_theory,
	0,
	([],[next_index, next_index+2]))];
store_mt_results mt_run_fail [
	("pp'new_type_defn 6034",
	pp'new_type_defn,
	( [ "rubbish"], "BOOL", [], etype2_exax),
	gen_fail_msg "pp'new_type_defn" 6034 ["BOOL"])
	];

store_mt_results mt_run [("pp'open_theory 4 f",
	pp'open_theory,
	yet_again_index,
	([next_index,next_index+2],[]))];
=TEX
\subsection{pp'new\_spec}
=SML
val so_isso_axiom = pp'new_axiom(["so_isso_axiom"],
	list_mk_simple_∃([vSo,vIsSo],mk_⇒(vSo,vIsSo)));
val so_isso_def = pp'new_spec (["So","IsSo"],2,so_isso_axiom);
store_mt_results (mt_runf (op =#)) [
	("pp'new_spec",
	dest_thm,
	so_isso_def,
	([],mk_⇒(So,IsSo)))
	];
val spec_ax_6016 = pp'new_axiom(["spec_ax_6016"],
	list_mk_∃([mk_var("x",BOOL),mk_var("x",BOOL)],
		mk_∧(mk_var("x",BOOL),mk_var("x",BOOL))));
val spec_ax_6051 = pp'new_axiom(["spec_ax_6051"],
	mk_∃(mk_var("x",BOOL),mk_var("x",BOOL)));
val spec_ax_6056 = pp'new_axiom(["spec_ax_6056"],
	mk_∃(mk_var("x",BOOL),mk_eq(mk_var("x",BOOL),v1)));
val spec_ax_6062 = pp'new_axiom(["spec_ax_6062"],
	mk_∃(mk_var("x",BOOL),
		mk_eq(mk_var("y",BOOL),
		mk_eq(mk_var("x",BOOL),v1))));
val spec_ax_6061 = pp'new_axiom(["spec_ax_6061"],
	mk_∃(mk_var("x",BOOL),mk_eq(mk_var("x",BOOL),
		mk_∀(mk_var("y",tv1), mk_t))));
val spec_ax_6081 = pp'new_axiom(["spec_ax_6081"],
	list_mk_∃([mk_var("y",tv'2),mk_var("x",BOOL)],
		mk_∧(mk_var("x",BOOL),mk_var("x",BOOL))));
store_mt_results mt_run_fail [
	("pp'new_spec 6016",
	pp'new_spec,
	(["x1","x2"],2,spec_ax_6016),
	gen_fail_msg "pp'new_spec" 6016 ["x","⊢ ∃ x x⦁ x ∧ x"]),
	("pp'new_spec 6031",
	pp'new_spec,
	([],2,so_isso_axiom),
	gen_fail_msg "pp'new_spec" 6031 []),
	("pp'new_spec 6044",
	pp'new_spec,
	(["nowhere"],0,so_isso_axiom),
	gen_fail_msg "pp'new_spec" 6044 []),
	("pp'new_spec 6049",
	pp'new_spec,
	(["Soa","IsSoa"],2,so_isso_axiom),
	gen_fail_msg "pp'new_spec" 6049 ["So"]),
	("pp'new_spec 6051",
	pp'new_spec,
	(["So","IsSo"],1,spec_ax_6051),
	gen_fail_msg "pp'new_spec" 6051 ["IsSo","yet_again"]),
	("pp'new_spec 6053",
	pp'new_spec,
	(["So","IsSo"],2,pp'asm_rule mk_t),
	gen_fail_msg "pp'new_spec" 6053 ["T ⊢ T"]),
	("pp'new_spec 6056",
	pp'new_spec,
	(["x"],1,spec_ax_6056),
	gen_fail_msg "pp'new_spec" 6059 ["theorem", "⊢ ∃ x⦁ x ⇔ v1", "", "v1"]),
	("pp'new_spec 6062",
	pp'new_spec,
	(["x"],1,spec_ax_6062),
	gen_fail_msg "pp'new_spec" 6059 ["theorem", "⊢ ∃ x⦁ y ⇔ x ⇔ v1", "s", "v1, y"]),
	("pp'new_spec 6060",
	pp'new_spec,
	(["Some"],3,so_isso_axiom),
	gen_fail_msg "pp'new_spec" 6060 [pr_thm so_isso_axiom, "3"]),
	("pp'new_spec 6061",
	pp'new_spec,
	(["x"],1,spec_ax_6061),
	gen_fail_msg "pp'new_spec" 6061 [pr_thm spec_ax_6061, "'tv1"]),
	("pp'new_spec 6081",
	pp'new_spec,
	(["x"],2,spec_ax_6081),
	gen_fail_msg "pp'new_spec" 6081 [pr_term(mk_var("y",tv'2)),pr_term(mk_var("x",BOOL))])
	];
store_mt_results mt_run_error [
	("pp'new_spec 6036",
	pp'new_spec,
	([],2,thy_deleted_thm),
	gen_fail_msg "pp'new_spec" 6036 [pr_thm thy_deleted_thm,
		"to_be_deleted",string_of_int tbd_index])
	];
store_mt_results mt_run [("pp'open_theory 1 h",
	pp'open_theory,
	next_index,
	([],[next_index+2]))];
local
	val So = mk_var("So",BOOL);
	val IsSo = mk_var("IsSo",BOOL)
in
	val so_isso_axiom1 = pp'new_axiom(["so_isso_axiom"],
		list_mk_simple_∃([So,IsSo],mk_⇒(So,IsSo)));
end;
store_mt_results mt_run_fail [
	("pp'new_spec 6063",
	pp'new_spec,
	(["Soa","IsSoa"],2,so_isso_axiom1),
	gen_fail_msg "pp'new_spec" 6063 ["So"])
	];
=TEX
\subsection{pp'new\_parent}
We first set things up so that $pp'new\_parent$ should add
material into the scope:
=SML
store_mt_results mt_run [("pp'open_theory 4 h",
	pp'open_theory,
	yet_again_index,
	([next_index+2],[]))];

store_mt_results mt_run [("pp'open_theory 2 e",
	pp'open_theory,
	another_index,
	([next_index+1],[next_index,next_index+2]))];
val NEWTYPE = pp'new_type("NEWTYPE",1);
val NewThing = pp'new_const("NewThing",NEWTYPE);
store_mt_results mt_run [("pp'open_theory 4 i",
	pp'open_theory,
	yet_again_index,
	([next_index,next_index+2],[next_index+1]))];
=TEX
We then show that the material is not immediately in scope:
=SML
let val iar = pp'asm_rule(mk_eq(NewThing, NewThing));
in
store_mt_results mt_run_fail [
	("pp'list_save_thm 6013 c",
	pp'list_save_thm,
	(["new_parent_test"],iar),
	gen_fail_msg "pp'list_save_thm" 6013
		[pr_thm iar,"NEWTYPE"])
	]
end;
store_mt_results mt_run [
	("pp'new_parent 1",
	pp'new_parent,
	another_index,
	[next_index+1])
	];
store_mt_results mt_run_fail [
	("pp'new_parent 6043",
	pp'new_parent,
	~1,
	gen_fail_msg "pp'new_parent" 6043 ["-1"])
	];
=TEX
And finally that the new material is now in scope:
=SML
store_mt_results (mt_runf (op =#)) [
	("pp'new_parent 2",
	dest_thm o pp'list_save_thm,
	(["new_parent_test"],pp'asm_rule(mk_eq(NewThing, NewThing))),
	([mk_eq(NewThing, NewThing)],mk_eq(NewThing, NewThing)))
	];

print_hierarchy();
=TEX
We now test whether clashes are detected by $pp'new\_parent$.
=SML
store_mt_results mt_run [("pp'open_theory 3 f",
	pp'open_theory,
	0,
	([],[next_index,next_index+1, next_index+2]))];
val test_index = pp'new_theory "test";
store_mt_results mt_run [("pp'open_theory 5 a",
	pp'open_theory,
	test_index,
	([test_index],[]))];
val F' = pp'new_const("F",UNIT);
store_mt_results mt_run [("pp'open_theory 4 j",
	pp'open_theory,
	yet_again_index,
	([next_index,next_index+1,next_index+2],[test_index]))];
store_mt_results mt_run_fail [
	("pp'new_parent 6067 a",
	pp'new_parent,
	test_index,
	gen_fail_msg "pp'new_parent" 6067 ["test"]),
	("pp'new_parent 6082",
	pp'new_parent,
	next_index,
	gen_fail_msg "pp'new_parent" 6082 ["next"])
	];

store_mt_results mt_run [("pp'open_theory 3 g",
	pp'open_theory,
	0,
	([],[next_index,next_index+1,next_index+2]))];
store_mt_results mt_run_fail [
	("pp'new_parent 6084",
	pp'new_parent,
	yet_again_index,
	gen_fail_msg "pp'new_parent" 6084 ["yet_again"])
	];
=TEX
\subsection{pp'get\_theory et al}
The test of $pp'get\_theory$ requires checking the result by eye.
=SML
pp'get_theory 0;
store_mt_results mt_run_fail [
	("pp'get_theory 6043",
	pp'get_theory,
	~2,
	gen_fail_msg "pp'get_theory" 6043 ["-2"])
	];
store_mt_results mt_run [
	("get_current_theory_status",
	get_current_theory_status,
	(),
	TSNormal)
	];
=TEX
\section{INFERENCE RULES}
Test scopes:
=SML
pp'open_theory yet_again_index;
val Deleted = pp'new_const ("Deleted",BOOL);
val const_deleted_thm = pp'asm_rule (mk_eq(p1,q1));
val side_effect = pp'delete_extension();
val out_of_scope_mdt006_index = pp'new_theory "out_of_scope_mdt006";
val _ = pp'open_theory out_of_scope_mdt006_index;
val out_of_scope_thm = pp'asm_rule (mk_eq(p1,q1));
val side_effect = pp'open_theory yet_again_index;
val deleted_theory_mdt006_index = pp'new_theory "deleted_theory_mdt006";
val side_effect = pp'open_theory deleted_theory_mdt006_index;
val deleted_thm = pp'asm_rule (mk_eq(p1,q1));
val side_effect = pp'open_theory yet_again_index;
val side_effect = pp'delete_theory deleted_theory_mdt006_index;

val p_eq_q_thm = pp'asm_rule (mk_eq(p1,q1));
val pq_thm = pp'asm_rule (exists_p_q);
val pq_ax = pp'new_axiom(["pq_ax"], exists_p_q);
val t_eq_f = pp'asm_rule (mk_eq(mk_t,mk_f));
val q_eq_F = pp'new_axiom(["q_eq_F"],(mk_eq(qB,mk_f)));
val so_axiom = pp'new_axiom(["so_axiom"],So);
val ℕ = pp'new_type("ℕ",0) handle _ => ℕ;
val tplus = mk_const("+",mk_→_type(ℕ,mk_→_type(ℕ,ℕ)));
val Suc = pp'new_const("Suc",mk_→_type(ℕ, ℕ))
	handle _ => mk_const("Suc",mk_→_type(ℕ, ℕ));
val strip_∧_T_conv : CONV = ( fn (tm : TERM) =>
	if is_∧ tm
	then let val (p,q) = dest_∧ tm
		in
		if q =$ mk_t
		then pp'asm_rule(mk_eq (tm, p))
		else fail "strip_∧_T_conv" 0 []
	end
	else fail "strip_∧_T_conv" 0 []
);
val t_def = pp'new_axiom(["t_def"],
	mk_eq(mk_t,mk_eq(mk_simple_λ(xB,xB),mk_simple_λ(xB,xB))));
=TEX
\subsection{Valid Theorems}
=SML
store_mt_results mt_run [
	("valid_thm 1",
	valid_thm,
	pq_thm,
	true),
	("valid_thm 2",
	valid_thm,
	const_deleted_thm,
	false),
	("valid_thm 3",
	valid_thm,
	out_of_scope_thm,
	false),
	("valid_thm 4",
	valid_thm,
	deleted_thm,
	false)
	];
=TEX
\subsection{Outputing Theorems}
=SML
store_mt_results mt_run [
	("string_of_thm",
	string_of_thm,
	pq_thm,
	"∃ p⦁ q ⊢ ∃ p⦁ q")];
store_mt_results mt_run_fail [
	("thm_fail",
	thm_fail "test" 6053,
	[pq_thm],
	gen_fail_msg "test" 6053 ["∃ p⦁ q ⊢ ∃ p⦁ q"])];
store_mt_results (mt_runf (op =#)) [
	("dest_thm",
	dest_thm,
	pq_thm,
	([exists_p_q],exists_p_q))
	];
=TEX
\section{THE TESTS - PRIMITVES AND BUILT-IN}
The tests proper:
\subsection{pp'subst\_rule}
=SML
store_mt_results mt_run_fail[
	("pp'subst_rule 6001 1",
	pp'subst_rule [] (exists_p_q1),
	pq_thm,
	gen_fail_msg "subst_rule" 6001 ["⌜∃ p⦁ q1⌝","⌜∃ p⦁ q⌝"]),
	("pp'subst_rule 6001 2",
	pp'subst_rule [(t_eq_f, qB)] (mk_eq(mk_t,qB)),
	t_eq_f,
	gen_fail_msg "subst_rule" 6001 ["⌜T ⇔ T⌝","⌜T ⇔ F⌝"])
	];
store_mt_results mt_run_error [
	("pp'subst_rule 6036 1",
	pp'subst_rule [] exists_p_q,
	deleted_thm,
	gen_fail_msg "subst_rule" 6036 ["p = q ⊢ p = q",
		"deleted_theory_mdt006", string_of_int deleted_theory_mdt006_index]),
	("pp'subst_rule 6065 1",
	pp'subst_rule [] exists_p_q,
	const_deleted_thm,
	gen_fail_msg "subst_rule" 6065 ["p = q ⊢ p = q",
		"yet_again"]),
	("pp'subst_rule 6066 1",
	pp'subst_rule [] exists_p_q,
	out_of_scope_thm,
	gen_fail_msg "subst_rule" 6066 ["p = q ⊢ p = q",
		"out_of_scope_mdt006"]),
	("pp'subst_rule 6036 2",
	pp'subst_rule [(deleted_thm, q1)] (mk_eq(mk_t,mk_f)),
	t_eq_f,
	gen_fail_msg "subst_rule" 6036 ["p = q ⊢ p = q",
		"deleted_theory_mdt006", string_of_int deleted_theory_mdt006_index]),
	("pp'subst_rule 6065 2",
	pp'subst_rule [(const_deleted_thm, q1)] (mk_eq(mk_t,mk_f)),
	t_eq_f,
	gen_fail_msg "subst_rule" 6065 ["p = q ⊢ p = q",
		"yet_again"]),
	("pp'subst_rule 6066 2",
	pp'subst_rule [(out_of_scope_thm, q1)] (mk_eq(mk_t,mk_f)),
	t_eq_f,
	gen_fail_msg "subst_rule" 6066 ["p = q ⊢ p = q",
		"out_of_scope_mdt006"])
	];

store_mt_results mt_run_fail [
	("pp'subst_rule 6002",
	pp'subst_rule,
	[(pp'asm_rule mk_t, pB)],
	gen_fail_msg "subst_rule" 6002 ["T ⊢ T"]),
	("pp'subst_rule 3007",
	pp'subst_rule,
	[(t_def, mk_t)],
	gen_fail_msg "subst_rule" 3007 [pr_term mk_t]),
	("pp'subst_rule 6029",
	pp'subst_rule,
	[(t_def, (mk_var("q",ℕ)))],
	gen_fail_msg "subst_rule" 6029 ["⊢ T ⇔ (λ x⦁ x) = (λ x⦁ x)","⌜q⌝"])
	];

store_mt_results (mt_runf (op =#)) [("pp'subst_rule_1",
	dest_thm o pp'subst_rule [] exists_p_q,
	pq_thm,
	dest_thm pq_thm),
	("pp'subst_rule_2",
	dest_thm o pp'subst_rule [] exists_p1_q,
	pq_thm,
	([exists_p_q],exists_p1_q)),
	("pp'subst_rule_3",
	dest_thm o pp'subst_rule [(t_eq_f, qB)] (mk_eq(qB,mk_f)),
	t_eq_f,
	([(mk_eq(mk_t,mk_f))],mk_⇔(mk_f,mk_f))),
	("pp'subst_rule_4",
	dest_thm o pp'subst_rule [(t_def, qB)] (mk_eq(qB,mk_f)),
	t_eq_f,
	([(mk_eq(mk_t,mk_f))],
	mk_eq(mk_eq(mk_simple_λ(xB,xB),mk_simple_λ(xB,xB)),mk_f)))];

=TEX
\subsection{pp'simple\_λ\_eq\_rule}
=SML
store_mt_results (mt_runf (op =#)) [("pp'simple_λ_eq_rule",
	dest_thm o pp'simple_λ_eq_rule qB,
	q_eq_F,
	([],mk_eq(mk_simple_λ(qB,qB),mk_simple_λ(qB,mk_f))))
	];

store_mt_results mt_run_fail[
	("pp'simple_λ_eq_rule 3007",
	pp'simple_λ_eq_rule mk_t,
	q_eq_F,
	gen_fail_msg "simple_λ_eq_rule" 3007 [pr_term mk_t]),
	("pp'simple_λ_eq_rule 6005",
	pp'simple_λ_eq_rule qB,
	pp'asm_rule (mk_eq(qB,mk_f)),
	gen_fail_msg "simple_λ_eq_rule" 6005 ["⌜q⌝"]),
	("pp'simple_λ_eq_rule 6020",
	pp'simple_λ_eq_rule qB,
	pq_ax,
	gen_fail_msg "simple_λ_eq_rule" 6020 ["⊢ ∃ p⦁ q"])
	];
store_mt_results mt_run_error [
	("pp'simple_λ_eq_rule 6036",
	pp'simple_λ_eq_rule qB,
	deleted_thm,
	gen_fail_msg "simple_λ_eq_rule" 6036 ["p = q ⊢ p = q",
		"deleted_theory_mdt006",string_of_int deleted_theory_mdt006_index]),
	("pp'simple_λ_eq_rule 6065",
	pp'simple_λ_eq_rule qB,
	const_deleted_thm,
	gen_fail_msg "simple_λ_eq_rule" 6065 ["p = q ⊢ p = q",
		"yet_again"]),
	("pp'simple_λ_eq_rule 6066",
	pp'simple_λ_eq_rule qB,
	out_of_scope_thm,
	gen_fail_msg "simple_λ_eq_rule" 6066 ["p = q ⊢ p = q",
		"out_of_scope_mdt006"])
	];
=TEX
\subsection{pp'inst\_type\_rule}
=SML
store_mt_results (mt_runf (op =#)) [("pp'inst_type_rule_1",
	dest_thm o pp'inst_type_rule [(BOOL, tva)],
	pq_ax,
	([],exists_p_q)),
	("pp'inst_type_rule_2",
	dest_thm o pp'inst_type_rule [(BOOL, tv'1)],
	pq_ax,
	([],exists_pB_q))
	];

store_mt_results mt_run_fail [
	("pp'inst_type_rule 6006",
	pp'inst_type_rule [(BOOL, tva)],
	(pp'asm_rule (mk_eq(qa,qa))),
	gen_fail_msg "inst_type_rule" 6006 ["'a"]),
	("pp'inst_type_rule 3019",
	pp'inst_type_rule [(BOOL, BOOL)],
	pq_ax,
	gen_fail_msg "inst_type_rule" 3019 ["ⓣBOOL⌝"])
	];
store_mt_results mt_run_error [
	("pp'inst_type_rule 6036",
	pp'inst_type_rule [(BOOL, tva)],
	deleted_thm,
	gen_fail_msg "inst_type_rule" 6036 ["p = q ⊢ p = q",
		"deleted_theory_mdt006",string_of_int deleted_theory_mdt006_index]),
	("pp'inst_type_rule 6065",
	pp'inst_type_rule [(BOOL, tva)],
	const_deleted_thm,
	gen_fail_msg "inst_type_rule" 6065 ["p = q ⊢ p = q",
		"yet_again"]),
	("pp'inst_type_rule 6066",
	pp'inst_type_rule [(BOOL, tva)],
	out_of_scope_thm,
	gen_fail_msg "inst_type_rule" 6066 ["p = q ⊢ p = q",
		"out_of_scope_mdt006"])
	];
=TEX
\subsection{pp'⇒\_intro}
=SML
store_mt_results (mt_runf (op =#)) [
	("pp'⇒_intro 1",
	dest_thm o pp'⇒_intro v1,
	pq_ax,
	([],mk_⇒(v1,exists_p_q))),
	("pp'⇒_intro 2",
	dest_thm o pp'⇒_intro v1,
	pp'asm_rule v1,
	([],mk_⇒(v1,v1)))
	];

store_mt_results mt_run_fail [
	("pp'⇒_intro 3031",
	pp'⇒_intro N1,
	pq_ax,
	gen_fail_msg "⇒_intro" 3031 ["⌜1⌝"])
	];
store_mt_results mt_run_error [
	("pp'⇒_intro 6036",
	pp'⇒_intro v1,
	deleted_thm,
	gen_fail_msg "⇒_intro" 6036 ["p = q ⊢ p = q",
		"deleted_theory_mdt006",string_of_int deleted_theory_mdt006_index]),
	("pp'⇒_intro 6065",
	pp'⇒_intro v1,
	const_deleted_thm,
	gen_fail_msg "⇒_intro" 6065 ["p = q ⊢ p = q",
		"yet_again"]),
	("pp'⇒_intro 6066",
	pp'⇒_intro v1,
	out_of_scope_thm,
	gen_fail_msg "⇒_intro" 6066 ["p = q ⊢ p = q",
		"out_of_scope_mdt006"])
	];
=TEX
\subsection{pp'⇒\_elim}
=SML
store_mt_results (mt_runf (op =#)) [("pp'⇒_elim_1",
	dest_thm o pp'⇒_elim  so_isso_def,
	so_axiom,
	([],IsSo))
	];

store_mt_results mt_run_fail [
	("pp'⇒_elim 6010",
	pp'⇒_elim so_isso_axiom,
	so_axiom,
	gen_fail_msg "⇒_elim" 6010 [pr_thm so_isso_axiom]),
	("pp'⇒_elim 6011",
	pp'⇒_elim so_isso_def,
	so_isso_def,
	gen_fail_msg "⇒_elim" 6011 [pr_thm so_isso_def, pr_thm so_isso_def ])
	];
store_mt_results mt_run_error [
	("pp'⇒_elim 6036 1",
	pp'⇒_elim so_isso_def,
	deleted_thm,
	gen_fail_msg "⇒_elim" 6036 ["p = q ⊢ p = q",
		"deleted_theory_mdt006",string_of_int deleted_theory_mdt006_index]),
	("pp'⇒_elim 6065 1",
	pp'⇒_elim so_isso_def,
	const_deleted_thm,
	gen_fail_msg "⇒_elim" 6065 ["p = q ⊢ p = q",
		"yet_again"]),
	("pp'⇒_elim 6066 1",
	pp'⇒_elim so_isso_def,
	out_of_scope_thm,
	gen_fail_msg "⇒_elim" 6066 ["p = q ⊢ p = q",
		"out_of_scope_mdt006"]),
	("pp'⇒_elim 6036 2",
	pp'⇒_elim deleted_thm,
	so_axiom,
	gen_fail_msg "⇒_elim" 6036 ["p = q ⊢ p = q",
		"deleted_theory_mdt006",string_of_int deleted_theory_mdt006_index]),
	("pp'⇒_elim 6065 2",
	pp'⇒_elim const_deleted_thm,
	so_axiom,
	gen_fail_msg "⇒_elim" 6065 ["p = q ⊢ p = q",
		"yet_again"]),
	("pp'⇒_elim 6066 2",
	pp'⇒_elim out_of_scope_thm,
	so_axiom,
	gen_fail_msg "⇒_elim" 6066 ["p = q ⊢ p = q",
		"out_of_scope_mdt006"])
	];
=TEX
\subsection{pp'asm\_rule}
=SML
store_mt_results (mt_runf (op =#)) [
	("pp'asm_rule 1",
	dest_thm o pp'asm_rule,
	mk_const("rubbish",BOOL),
	([mk_const("rubbish",BOOL)],mk_const("rubbish",BOOL)))
	];

store_mt_results mt_run_fail [
	("pp'asm_rule 3031",
	pp'asm_rule,
	N0,
	gen_fail_msg "asm_rule" 3031 [pr_term N0])
	];
=TEX
\subsection{pp'refl\_conv}
=SML
store_mt_results (mt_runf (op =#)) [
	("pp'refl_conv 1",
	dest_thm o pp'refl_conv,
	mk_const("rubbish",BOOL),
	([],mk_eq(mk_const("rubbish",BOOL), mk_const("rubbish",BOOL)))),
	("pp'refl_conv 2",
	dest_thm o pp'refl_conv,
	mk_const("rubbish",ℕ),
	([],mk_eq(mk_const("rubbish",ℕ), mk_const("rubbish",ℕ))))
	];
=TEX
\subsection{pp'simple\_$\beta$\_conv}
=SML
store_mt_results (mt_runf (op =#)) [
	("pp'simple_β_conv 1",
	dest_thm o pp'simple_β_conv,
	mk_app(mk_simple_λ(pa,mk_app(mk_var("f",mk_→_type(tva,tv1)),pa)),qa),
	([],mk_eq(mk_app(mk_simple_λ(pa,mk_app(
		mk_var("f",mk_→_type(tva,tv1)),pa)),
		qa),
		mk_app(mk_var("f",mk_→_type(tva,tv1)), qa)))),
	("pp'simple_β_conv 2",
	dest_thm o pp'simple_β_conv,
	mk_app(mk_simple_λ(pa,mk_simple_λ(qa,mk_app(mk_app(mk_var("f",
		mk_→_type(tva,mk_→_type(tva,tv1))),
		pa),qa))),qa),
	([],mk_eq(mk_app(mk_simple_λ(pa,mk_simple_λ(qa,mk_app(mk_app(mk_var("f",
		mk_→_type(tva,mk_→_type(tva,tv1))),
		pa),qa))),qa),
	mk_simple_λ(qa',mk_app(mk_app(mk_var("f",
		mk_→_type(tva,mk_→_type(tva,tv1))),
		qa),qa')))))
	];

store_mt_results mt_run_fail [
	("pp'simple_β_conv 6012",
	pp'simple_β_conv,
	mk_simple_λ(pa,mk_simple_λ(qa,mk_app(mk_app(mk_var("f",
		mk_→_type(tva,mk_→_type(tva,tv1))),
		pa),qa))),
	gen_fail_msg "simple_β_conv" 6012 ["⌜λ p q⦁ f p q⌝"])
	];
=TEX
\subsection{pp'suc\_conv}
=SML
store_mt_results (mt_runf (op =#)) [
	("pp'suc_conv 1",
	dest_thm o pp'suc_conv,
	N3,
	([],mk_eq(N3,mk_app(Suc,N2)))),
	("pp'suc_conv 2",
	dest_thm o pp'suc_conv,
	N0,
	([],mk_eq(N0,mk_const("Zero",ℕ))))
	];

store_mt_results mt_run_fail [
	("pp'suc_conv 3026",
	pp'suc_conv,
	mk_const("Number",ℕ),
	gen_fail_msg "suc_conv" 3026 [pr_term(mk_const("Number",ℕ))])
	];
=TEX
\subsection{pp'string\_conv}
=SML
store_mt_results (mt_runf (op =#)) [
	("pp'string_conv_1",
	dest_thm o pp'string_conv,
	mk_string "abc",
	([],mk_eq(mk_string "abc",
		list_mk_app(mk_const("Cons",
			mk_→_type(CHAR,mk_→_type(STRING,STRING))),
		[mk_char "a", mk_string "bc"])))),
	("pp'string_conv_2",
	dest_thm o pp'string_conv,
	mk_string "",
	([],mk_eq(mk_string "",mk_const("Nil",STRING))))
	];

store_mt_results mt_run_fail [
	("pp'string_conv 3025",
	pp'string_conv,
	N0,
	gen_fail_msg "string_conv" 3025 [pr_term N0])
	];
=TEX
\subsection{pp'char\_conv}
=SML
store_mt_results (mt_runf (op =#)) [
	("pp'char_conv_1",
	dest_thm o pp'char_conv,
	mk_char "a",
	([],mk_eq(mk_char "a",mk_app(mk_const("AbsChar",mk_→_type(ℕ,CHAR)),
		(mk_ℕ o integer_of_int) (ord "a") )))),
	("pp'char_conv_2",
	dest_thm o pp'char_conv,
	mk_char "ℕ",
	([],mk_eq(mk_char "ℕ",
		mk_app(mk_const("AbsChar",mk_→_type(ℕ,CHAR)),
		(mk_ℕ o integer_of_int) (ord "ℕ") ))))
	];

store_mt_results mt_run_fail [
	("pp'char_conv 3024",
	pp'char_conv,
	mk_const("he",CHAR),
	gen_fail_msg "char_conv" 3024 [pr_term(mk_const("he",CHAR))])
	];

=TEX
\subsection{pp'eq\_sym\_rule}
=SML
store_mt_results (mt_runf (op =#)) [
	("pp'eq_sym_rule_1",
	dest_thm o pp'eq_sym_rule,
	pp'asm_rule(mk_eq(N0,N1)),
	([(mk_eq(N0,N1))],mk_eq(N1,N0))),
	("pp'eq_sym_rule_2",
	dest_thm o pp'eq_sym_rule,
	pp'asm_rule(mk_eq(mk_t,mk_f)),
	([(mk_eq(mk_t,mk_f))],mk_eq(mk_f,mk_t)))
	];

store_mt_results mt_run_fail[
	("pp'eq_sym_rule 6020",
	pp'eq_sym_rule,
	pq_ax,
	gen_fail_msg "eq_sym_rule" 6020 ["⊢ ∃ p⦁ q"])
	];
store_mt_results mt_run_error [
	("pp'eq_sym_rule 6036",
	pp'eq_sym_rule,
	deleted_thm,
	gen_fail_msg "eq_sym_rule" 6036 ["p = q ⊢ p = q",
		"deleted_theory_mdt006",string_of_int deleted_theory_mdt006_index]),
	("pp'eq_sym_rule 6065",
	pp'eq_sym_rule,
	const_deleted_thm,
	gen_fail_msg "eq_sym_rule" 6065 ["p = q ⊢ p = q",
		"yet_again"]),
	("pp'eq_sym_rule 6066",
	pp'eq_sym_rule,
	out_of_scope_thm,
	gen_fail_msg "eq_sym_rule" 6066 ["p = q ⊢ p = q",
		"out_of_scope_mdt006"])
	];
=TEX
\subsection{pp'list\_simple\_∀\_elim}
=SML
store_mt_results (mt_runf (op =#)) [
	("pp'list_simple_∀_elim_1",
	dest_thm o pp'list_simple_∀_elim [mk_f],
	pp'asm_rule (mk_∀(v1,mk_⇒(v1,mk_t))),
	([(mk_∀(v1,mk_⇒(v1,mk_t)))],mk_⇒(mk_f,mk_t))),
	("pp'list_simple_∀_elim_2",
	dest_thm o pp'list_simple_∀_elim [v2],
	pp'asm_rule(mk_∀(v1,mk_app(mk_simple_λ(v2,v1),mk_t))),
	([mk_∀(v1,mk_app(mk_simple_λ(v2,v1),mk_t))],
		mk_app(mk_simple_λ(mk_var("v2'",BOOL),v2),mk_t))),
	("pp'list_simple_∀_elim_3",
	dest_thm o pp'list_simple_∀_elim [v2,v2],
	pp'asm_rule(list_mk_∀([v1,v2],mk_∧(v1,v2))),
	([(list_mk_∀([v1,v2],mk_∧(v1,v2)))],mk_∧(v2,v2))),
	("pp'list_simple_∀_elim_4",
	dest_thm o pp'list_simple_∀_elim [v1,v1],
	pp'asm_rule(list_mk_∀([v1,v2],mk_∧(v1,v2))),
	([list_mk_∀([v1,v2],mk_∧(v1,v2))],mk_∧(v1,v1))),
	("pp'list_simple_∀_elim_5",
	dest_thm o pp'list_simple_∀_elim [mk_t,mk_f],
	pp'asm_rule(list_mk_∀([v1,v1],v1)),
	([list_mk_∀([v1,v1],v1)],mk_f))
	];

store_mt_results mt_run_fail[
	("pp'list_simple_∀_elim 6018",
	pp'list_simple_∀_elim [mk_t],
	pq_ax,
	gen_fail_msg "list_simple_∀_elim" 6018 ["⊢ ∃ p⦁ q", "1"]),
	("pp'list_simple_∀_elim 3012",
	pp'list_simple_∀_elim [N0],
	pp'asm_rule(mk_∀(v1,mk_⇒(v1,mk_t))),
	gen_fail_msg "list_simple_∀_elim" 3012 [pr_term N0, pr_term v1])
	];
store_mt_results mt_run_error [
	("pp'list_simple_∀_elim 6036",
	pp'list_simple_∀_elim [v1],
	deleted_thm,
	gen_fail_msg "list_simple_∀_elim" 6036 ["p = q ⊢ p = q",
		"deleted_theory_mdt006",string_of_int deleted_theory_mdt006_index]),
	("pp'list_simple_∀_elim 6065",
	pp'list_simple_∀_elim [v1],
	const_deleted_thm,
	gen_fail_msg "list_simple_∀_elim" 6065 ["p = q ⊢ p = q",
		"yet_again"]),
	("pp'list_simple_∀_elim 6066",
	pp'list_simple_∀_elim [v1],
	out_of_scope_thm,
	gen_fail_msg "list_simple_∀_elim" 6066 ["p = q ⊢ p = q",
		"out_of_scope_mdt006"])
	];
=TEX
\subsection{pp'eq\_trans\_rule}
=SML
store_mt_results (mt_runf (op =#)) [
	("pp'eq_trans_rule_1",
	dest_thm o pp'eq_trans_rule (pp'asm_rule (mk_eq(N0,N1))),
	pp'asm_rule (mk_eq(N1,N2)),
	([(mk_eq(N0,N1)), (mk_eq(N1,N2))],(mk_eq(N0,N2))))
	];

store_mt_results mt_run_fail[
	("pp'eq_trans_rule 6020 a",
	pp'eq_trans_rule pq_ax,
	pp'asm_rule (mk_eq(N1,N2)),
	gen_fail_msg "eq_trans_rule" 6020 ["⊢ ∃ p⦁ q"]),
	("pp'eq_trans_rule 6020 b",
	pp'eq_trans_rule (pp'asm_rule (mk_eq(N1,N2))),
	pq_ax,
	gen_fail_msg "eq_trans_rule" 6020 ["⊢ ∃ p⦁ q"]),
	("pp'eq_trans_rule 6022 a",
	pp'eq_trans_rule (pp'asm_rule (mk_eq(N0,N1))),
	p_eq_q_thm,
	gen_fail_msg "eq_trans_rule" 6022 ["0 = 1 ⊢ 0 = 1", "p = q ⊢ p = q"]),
	("pp'eq_trans_rule 6022 b",
	pp'eq_trans_rule (pp'asm_rule (mk_eq(N0,N1))),
	pp'asm_rule (mk_eq(N0,N2)),
	gen_fail_msg "eq_trans_rule" 6022 ["0 = 1 ⊢ 0 = 1", "0 = 2 ⊢ 0 = 2"])
	];
store_mt_results mt_run_error [
	("pp'eq_trans_rule 6036 a",
	pp'eq_trans_rule so_isso_axiom,
	deleted_thm,
	gen_fail_msg "eq_trans_rule" 6036 ["p = q ⊢ p = q",
		"deleted_theory_mdt006",string_of_int deleted_theory_mdt006_index]),
	("pp'eq_trans_rule 6065 a",
	pp'eq_trans_rule so_isso_axiom,
	const_deleted_thm,
	gen_fail_msg "eq_trans_rule" 6065 ["p = q ⊢ p = q",
		"yet_again"]),
	("pp'eq_trans_rule 6066 a",
	pp'eq_trans_rule so_isso_axiom,
	out_of_scope_thm,
	gen_fail_msg "eq_trans_rule" 6066 ["p = q ⊢ p = q",
		"out_of_scope_mdt006"]),
	("pp'eq_trans_rule 6036 b",
	pp'eq_trans_rule deleted_thm,
	so_isso_axiom,
	gen_fail_msg "eq_trans_rule" 6036 ["p = q ⊢ p = q",
		"deleted_theory_mdt006",string_of_int deleted_theory_mdt006_index]),
	("pp'eq_trans_rule 6065 b",
	pp'eq_trans_rule const_deleted_thm,
	so_isso_axiom,
	gen_fail_msg "eq_trans_rule" 6065 ["p = q ⊢ p = q",
		"yet_again"]),
	("pp'eq_trans_rule 6066 b",
	pp'eq_trans_rule out_of_scope_thm,
	so_isso_axiom,
	gen_fail_msg "eq_trans_rule" 6066 ["p = q ⊢ p = q",
		"out_of_scope_mdt006"])
	];
=TEX
\subsection{pp'mk\_app\_rule}
=SML
store_mt_results (mt_runf (op =#)) [
	("pp'mk_app_rule_1",
	dest_thm o pp'mk_app_rule (pp'asm_rule
		(mk_eq(mk_var("f",mk_→_type(ℕ,ℕ)),mk_var("g",mk_→_type(ℕ,ℕ))))),
	pp'asm_rule (mk_eq(N1,N2)),
	([mk_eq(mk_var("f",mk_→_type(ℕ,ℕ)),mk_var("g",mk_→_type(ℕ,ℕ))),
		(mk_eq(N1,N2))],
		mk_eq(mk_app(mk_var("f",mk_→_type(ℕ,ℕ)),N1),
		mk_app(mk_var("g",mk_→_type(ℕ,ℕ)),N2))))
	];

store_mt_results mt_run_fail[
	("pp'mk_app_rule 6020 a",
	pp'mk_app_rule pq_ax,
	pp'asm_rule (mk_eq(N1,N2)),
	gen_fail_msg "mk_app_rule" 6020 ["⊢ ∃ p⦁ q"]),
	("pp'mk_app_rule 6020 b",
	pp'mk_app_rule (pp'asm_rule  (mk_eq(N1,N2))),
	pq_ax,
	gen_fail_msg "mk_app_rule" 6020 ["⊢ ∃ p⦁ q"]),
	("pp'mk_app_rule 6023",
	pp'mk_app_rule (pp'refl_conv mk_t ),
	(pp'asm_rule  (mk_eq(N1,N2))),
	gen_fail_msg "mk_app_rule" 6023 ["⊢ T ⇔ T","1 = 2 ⊢ 1 = 2"])
	];
store_mt_results mt_run_error [
	("pp'mk_app_rule 6036 a",
	pp'mk_app_rule so_isso_axiom,
	deleted_thm,
	gen_fail_msg "mk_app_rule" 6036 ["p = q ⊢ p = q",
		"deleted_theory_mdt006",string_of_int deleted_theory_mdt006_index]),
	("pp'mk_app_rule 6065 a",
	pp'mk_app_rule so_isso_axiom,
	const_deleted_thm,
	gen_fail_msg "mk_app_rule" 6065 ["p = q ⊢ p = q",
		"yet_again"]),
	("pp'mk_app_rule 6066 a",
	pp'mk_app_rule so_isso_axiom,
	out_of_scope_thm,
	gen_fail_msg "mk_app_rule" 6066 ["p = q ⊢ p = q",
		"out_of_scope_mdt006"]),
	("pp'mk_app_rule 6036 b",
	pp'mk_app_rule deleted_thm,
	so_isso_axiom,
	gen_fail_msg "mk_app_rule" 6036 ["p = q ⊢ p = q",
		"deleted_theory_mdt006",string_of_int deleted_theory_mdt006_index]),
	("pp'mk_app_rule 6065 b",
	pp'mk_app_rule const_deleted_thm,
	so_isso_axiom,
	gen_fail_msg "mk_app_rule" 6065 ["p = q ⊢ p = q",
		"yet_again"]),
	("pp'mk_app_rule 6066 b",
	pp'mk_app_rule out_of_scope_thm,
	so_isso_axiom,
	gen_fail_msg "mk_app_rule" 6066 ["p = q ⊢ p = q",
		"out_of_scope_mdt006"])
	];
=TEX
\subsection{pp'⇔\_mp\_rule}
=SML
store_mt_results (mt_runf (op =#)) [
	("pp'⇔_mp_rule_1",
	dest_thm o pp'⇔_mp_rule t_eq_f,
	pp'asm_rule mk_t,
	([(mk_eq(mk_t,mk_f)),mk_t],mk_f))
	];

store_mt_results mt_run_fail[
	("pp'⇔_mp_rule 6024",
	pp'⇔_mp_rule t_eq_f,
	(pp'asm_rule mk_f),
	gen_fail_msg "⇔_mp_rule" 6024 ["T ⇔ F ⊢ T ⇔ F", "F ⊢ F"]),
	("pp'⇔_mp_rule 6030 a",
	pp'⇔_mp_rule (pp'asm_rule mk_t),
	t_eq_f,
	gen_fail_msg "⇔_mp_rule" 6030 ["T ⊢ T"]),
	("pp'⇔_mp_rule 6030 b",
	pp'⇔_mp_rule (pp'asm_rule (mk_eq(N0,N1))),
	t_eq_f,
	gen_fail_msg "⇔_mp_rule" 6030 ["0 = 1 ⊢ 0 = 1"])
	];
store_mt_results mt_run_error [
	("pp'⇔_mp_rule 6036 a",
	pp'⇔_mp_rule so_isso_axiom,
	deleted_thm,
	gen_fail_msg "⇔_mp_rule" 6036 ["p = q ⊢ p = q",
		"deleted_theory_mdt006",string_of_int deleted_theory_mdt006_index]),
	("pp'⇔_mp_rule 6065 a",
	pp'⇔_mp_rule so_isso_axiom,
	const_deleted_thm,
	gen_fail_msg "⇔_mp_rule" 6065 ["p = q ⊢ p = q",
		"yet_again"]),
	("pp'⇔_mp_rule 6066 a",
	pp'⇔_mp_rule so_isso_axiom,
	out_of_scope_thm,
	gen_fail_msg "⇔_mp_rule" 6066 ["p = q ⊢ p = q",
		"out_of_scope_mdt006"]),
	("pp'⇔_mp_rule 6036 b",
	pp'⇔_mp_rule deleted_thm,
	so_isso_axiom,
	gen_fail_msg "⇔_mp_rule" 6036 ["p = q ⊢ p = q",
		"deleted_theory_mdt006",string_of_int deleted_theory_mdt006_index]),
	("pp'⇔_mp_rule 6065 b",
	pp'⇔_mp_rule const_deleted_thm,
	so_isso_axiom,
	gen_fail_msg "⇔_mp_rule" 6065 ["p = q ⊢ p = q",
		"yet_again"]),
	("pp'⇔_mp_rule 6066 b",
	pp'⇔_mp_rule out_of_scope_thm,
	so_isso_axiom,
	gen_fail_msg "⇔_mp_rule" 6066 ["p = q ⊢ p = q",
		"out_of_scope_mdt006"])
	];

=TEX
\subsection{pp'simple\_∀\_intro}
=SML
store_mt_results (mt_runf (op =#)) [
	("pp'simple_∀_intro 1",
	dest_thm o pp'simple_∀_intro v1,
	t_eq_f,
	([(mk_eq(mk_t,mk_f))],mk_∀(v1,(mk_eq(mk_t,mk_f))))),
	("pp'simple_∀_intro 2",
	dest_thm o pp'simple_∀_intro qB,
	pq_ax,
	([],mk_∀( qB,exists_p_q)))
	];

store_mt_results mt_run_fail[
	("pp'simple_∀_intro 3007",
	pp'simple_∀_intro mk_t,
	t_eq_f,
	gen_fail_msg "simple_∀_intro" 3007 [pr_term mk_t]),
	("pp'simple_∀_intro 6005",
	pp'simple_∀_intro v1,
	(pp'asm_rule v1),
	gen_fail_msg "simple_∀_intro" 6005 [pr_term v1])
	];
store_mt_results mt_run_error [
	("pp'simple_∀_intro 6036",
	pp'simple_∀_intro v1,
	deleted_thm,
	gen_fail_msg "simple_∀_intro" 6036 ["p = q ⊢ p = q",
		"deleted_theory_mdt006",string_of_int deleted_theory_mdt006_index]),
	("pp'simple_∀_intro 6065",
	pp'simple_∀_intro v1,
	const_deleted_thm,
	gen_fail_msg "simple_∀_intro" 6065 ["p = q ⊢ p = q",
		"yet_again"]),
	("pp'simple_∀_intro 6066",
	pp'simple_∀_intro v1,
	out_of_scope_thm,
	gen_fail_msg "simple_∀_intro" 6066 ["p = q ⊢ p = q",
		"out_of_scope_mdt006"])
	];

=TEX
\subsection{pp'inst\_term\_rule}
=SML
store_mt_results (mt_runf (op =#)) [
	("pp'inst_term_rule_1",
	dest_thm o pp'inst_term_rule [(mk_t,v1),(mk_f,v2)],
	pp'list_simple_∀_elim [v1,v2]
		(pp'asm_rule (list_mk_∀([v1,v2],mk_eq(v1,v2)))),
	([(list_mk_∀([v1,v2],mk_eq(v1,v2)))],(mk_eq(mk_t,mk_f)))),
	("pp'inst_term_rule_2",
	dest_thm o pp'inst_term_rule [(v2,v1),(v1,v2)],
	pp'list_simple_∀_elim [v1,v2]
		(pp'asm_rule (list_mk_∀([v1,v2],mk_eq(v1,v2)))),
	([(list_mk_∀([v1,v2],mk_eq(v1,v2)))],mk_eq(v2,v1))),
	("pp'inst_term_rule_3",
	dest_thm o pp'inst_term_rule [],
	pp'list_simple_∀_elim [v1,v2 ]
		(pp'asm_rule (list_mk_∀([v1,v2],mk_eq(v1,v2)))),
	([(list_mk_∀([v1,v2],mk_eq(v1,v2)))],mk_eq(v1,v2)))
	];

store_mt_results mt_run_fail[
	("pp'inst_term_rule 3007",
	pp'inst_term_rule [(v2,mk_t)],
	(pp'asm_rule v1),
	gen_fail_msg "inst_term_rule" 3007 [pr_term mk_t]),
	("pp'inst_term_rule 6027",
	pp'inst_term_rule [(N0,v1)],
	(pp'asm_rule v1),
	gen_fail_msg "inst_term_rule" 6027 [pr_term N0,pr_term v1]),
	("pp'inst_term_rule 6028",
	pp'inst_term_rule [(v2,v1)],
	(pp'asm_rule v1),
	gen_fail_msg "inst_term_rule" 6028 [pr_term v1])
	];
store_mt_results mt_run_error [
	("pp'inst_term_rule 6036",
	pp'inst_term_rule [],
	deleted_thm,
	gen_fail_msg "inst_term_rule" 6036 ["p = q ⊢ p = q",
		"deleted_theory_mdt006",string_of_int deleted_theory_mdt006_index]),
	("pp'inst_term_rule 6065",
	pp'inst_term_rule [],
	const_deleted_thm,
	gen_fail_msg "inst_term_rule" 6065 ["p = q ⊢ p = q",
		"yet_again"]),
	("pp'inst_term_rule 6066",
	pp'inst_term_rule [],
	out_of_scope_thm,
	gen_fail_msg "inst_term_rule" 6066 ["p = q ⊢ p = q",
		"out_of_scope_mdt006"])
	];
=TEX
\subsection{pp'plus\_conv}
=SML
store_mt_results (mt_runf (op =#)) [
	("pp'plus_conv 1",
	dest_thm o pp'plus_conv,
	list_mk_app(tplus,[N7,N2]),
	([],mk_eq(list_mk_app(tplus,[N7,N2]),N9))),
	("pp'plus_conv 2",
	dest_thm o pp'plus_conv,
	list_mk_app(tplus,[N0,N2]),
	([],mk_eq(list_mk_app(tplus,[N0,N2]),N2)))
	];
=TEX
The following test assumes $+$ has been declared infix.
=SML
store_mt_results mt_run_fail [
	("pp'plus_conv 6085 a",
	pp'plus_conv,
	list_mk_app(tplus,[mk_var("n",ℕ),N1]),
	gen_fail_msg "plus_conv" 6085 ["⌜n + 1⌝"]),
	("pp'plus_conv 6085 b",
	pp'plus_conv,
	mk_var("n",ℕ),
	gen_fail_msg "plus_conv" 6085 ["⌜n⌝"])
	];
=TEX
\section{FUTHER THEORY FUNCTIONS}
Test hooks into environments.
=SML
let
fun aux (Value a, Value b) = a =: b
| aux (Nil, Nil) = true
| aux _ = false;
in
store_mt_results (mt_runf aux) [
	("get_const_type 1",
	get_const_type,
	"5",
	Value ℕ),
	("get_const_type 2",
	get_const_type,
	"",
	Nil),
	("get_const_type 3",
	get_const_type,
	"T",
	Value BOOL),
	("get_const_type 4",
	get_const_type,
	"TorF",
	Nil),
	("get_const_type 5",
	get_const_type,
	"rubbish",
	Nil)
	]
end;
store_mt_results mt_run [
	("get_type_arity 1",
	get_type_arity,
	"BOOL",
	Value 0),
	("get_type_arity 2",
	get_type_arity,
	"ℕ",
	Value 0),
	("get_type_arity 3",
	get_type_arity,
	"",
	Nil),
	("get_type_arity 4",
	get_type_arity,
	"→",
	Value 2),
	("get_type_arity 5",
	get_type_arity,
	"RUBBISH",
	Nil)
	];
=TEX
Test the built in scopes:
=SML
store_mt_results (mt_runf (op =$)) [
	("pp'new_const 5",
	pp'new_const,
	("12a",BOOL),
	mk_const("12a",BOOL)),
	("pp'new_const 6",
	pp'new_const,
	("`12",BOOL),
	mk_const("`12",BOOL))
	];
store_mt_results mt_run_fail [
	("pp'new_const 6049 a",
	pp'new_const,
	("1",BOOL),
	gen_fail_msg "pp'new_const" 6049 ["1"]),
	("pp'new_const 6049 b",
	pp'new_const,
	("123",BOOL),
	gen_fail_msg "pp'new_const" 6049 ["123"]),
	("pp'new_const 6049 c",
	pp'new_const,
	("`a",BOOL),
	gen_fail_msg "pp'new_const" 6049 ["`a"]),
	("pp'new_const 6049 d",
	pp'new_const,
	("\"abc",BOOL),
	gen_fail_msg "pp'new_const" 6049 ["\"abc"])
	];
=TEX
\subsection{Sealing Theories}
=SML
store_mt_results mt_run [("pp'get_pervasive_theory_name 1",
	pp'get_pervasive_theory_name,
	(),
	"min")];
store_mt_results mt_run [("pp'open_theory 1 i",
	pp'open_theory,
	next_index,
	([],[next_index+1,next_index+2]))];
store_mt_results mt_run_fail [(
	"pp'seal_hierarchy 6004",
	pp'seal_hierarchy,
	(),
	gen_fail_msg "pp'seal_hierarchy" 6004 ["another"])];
pp'new_parent another_index;
pp'delete_theory copy_of_next_index;
pp'delete_theory test_index;
pp'seal_hierarchy();
store_mt_results mt_run [("pp'get_pervasive_theory_name 2",
	pp'get_pervasive_theory_name,
	(),
	"next")];
store_mt_results mt_run [("pp'open_theory 1 j",
	pp'open_theory,
	next_index,
	([],[]))];
store_mt_results mt_run_fail [
	("pp'seal_hierarchy 1",
	pp'open_theory,
	0,
	gen_fail_msg "pp'open_theory" 6017 ["min","next"]),
	("pp'seal_hierarchy 2",
	pp'open_theory,
	another_index,
	gen_fail_msg "pp'open_theory" 6017 ["another","next"])
	];
store_mt_results mt_run [("pp'open_theory 4 l",
	pp'open_theory,
	yet_again_index,
	([next_index+2],[]))];
=TEX
\subsection{Test Harness Testing of Hierarchies}
Tests on hierarchies : do after all others, as theories are made read only by these tests.
See also section \ref{hierarchy} for tests ``by hand''.
Most of the hierarchy functions are tested by side effect.
=SML
store_mt_results mt_run_fail [
	("pp'new_hierarchy 6090",
	pp'new_hierarchy,
	(),
	gen_fail_msg "pp'new_hierarchy" 6090 ["0"])
	];
pp'freeze_hierarchy();
print_hierarchy();
store_mt_results mt_run_fail [
	("pp'new_axiom 6071",
	pp'new_axiom,
	(["Truth_axiom1"],mk_t),
	gen_fail_msg "pp'new_axiom" 6071 ["yet_again"])
	];
store_mt_results mt_run_fail [
	("pp'new_const 6071",
	pp'new_const,
	("ForT1",BOOL),
	gen_fail_msg "pp'new_const" 6071 ["yet_again"])
	];
store_mt_results mt_run_fail [
	("pp'new_type 6071",
	pp'new_type,
	("SOMETHING1",3),
	gen_fail_msg "pp'new_type" 6071 ["yet_again"])
	];
store_mt_results mt_run_fail [
	("pp'gen_new_spec 6071",
	eq_defn,
	(["True1"],"True1",mk_t),
	gen_fail_msg "pp'gen_new_spec" 6071 ["yet_again"])
	];
store_mt_results mt_run_fail [
	("pp'delete_extension 6071",
	pp'delete_extension,
	(),
	gen_fail_msg "pp'delete_extension" 6071 ["yet_again"])
	];
store_mt_results mt_run_fail [
	("pp'list_save_thm 6071",
	pp'list_save_thm,
	(["Example1"],pp'asm_rule v1),
	gen_fail_msg "pp'list_save_thm" 6071 ["yet_again"])
	];
store_mt_results mt_run_fail [
	("pp'delete_thm 6071",
	pp'delete_thm,
	"Example",
	gen_fail_msg "pp'delete_thm" 6071 ["yet_again"])
	];
store_mt_results mt_run_fail [
	("pp'delete_theory 6071",
	pp'delete_theory,
	another_index,
	gen_fail_msg "pp'delete_theory" 6071 ["another"])
	];
store_mt_results mt_run_fail [
	("pp'lock_theory 6071",
	pp'lock_theory,
	yet_again_index,
	gen_fail_msg "pp'lock_theory" 6071 ["yet_again"])
	];
store_mt_results mt_run_fail [
	("pp'new_parent 6071",
	pp'new_parent,
	another_index,
	gen_fail_msg "pp'new_parent" 6071 ["yet_again"])
	];
store_mt_results mt_run_fail [
	("pp'new_type_defn 6071",
	pp'new_type_defn,
	( [ "ETYPE7"], "ETYPE7", ["'1"], etype_ax),
	gen_fail_msg "pp'new_type_defn" 6071 ["yet_again"])
	];
store_mt_results mt_run_fail [
	("pp'new_spec 6071",
	pp'new_spec,
	(["So1","IsSo1"],2,so_isso_axiom),
	gen_fail_msg "pp'new_spec" 6071 ["yet_again"])
	];

val newhier1 = pp'new_hierarchy();
val newhier2 = pp'new_hierarchy();
pp'open_theory next_index;
pp'load_hierarchy newhier1;
pp'new_theory "another_test";
store_mt_results mt_run_fail [
	("pp'load_hierarchy 6033",
	pp'load_hierarchy,
	newhier2,
	gen_fail_msg "pp'load_hierarchy" 6033 [])
	];
=TEX
\subsection{Scopes and $pp'new\_parent$}
Further tests for $pp'new\_parent$ clashes in children:
=SML
pp'open_theory next_index;
val np_test1_index = pp'new_theory "np_test1";
val np_test2_index = pp'new_theory "np_test2";
val np_test4_index = pp'new_theory "np_test4";
pp'open_theory np_test1_index;
val np_test3_index = pp'new_theory "np_test3";
pp'open_theory np_test3_index;
pp'new_const("np_test",BOOL);
pp'new_type("np_test_t",0);
pp'open_theory np_test2_index;
pp'new_const("np_test",BOOL);
pp'open_theory np_test4_index;
pp'new_type("np_test_t",0);
pp'open_theory np_test1_index;
store_mt_results mt_run_fail [
	("pp'new_parent 6067 b",
	pp'new_parent,
	np_test2_index,
	gen_fail_msg "pp'new_parent" 6067 ["np_test2"]),
	("pp'new_parent 6067 c",
	pp'new_parent,
	np_test4_index,
	gen_fail_msg "pp'new_parent" 6067 ["np_test4"])
	];

=TEX
\section{END OF TEST HARNESS TESTS}
=SML
diag_line(summarize_mt_results());
=TEX
\section{TESTING HIERARCHIES}
\label{hierarchy}
It is not really possible to test the hierarchy features,
and whether everything else ``respects'' them, within a module test document.
However, the following commented sequence should be input, by hand,
and the required textual identity checked.

Note that the database the tests start on will change,
so a copy should be made, to allow the restoration of the original.
=GFT csh
cp sun4hol.db testhol.db
poly $cwd/testhol.db
=TEX
or
=GFT csh
cp sun3hol.db testhol.db
poly $cwd/testhol.db
=TEX
as appropriate.
=GFT ML Source
open pp'Kernel;
pp'open_theory 0;

fun theory_names ((): unit) : string list = (
let	val hier = pp'get_hierarchy();
in
	map fst (hier drop
		(fn (_,{status = status,...}) => status = TSDeleted))
end);
map (fn x => pp'delete_theory x
	handle (Fail _) => ()) (theory_names());
map (fn x => pp'delete_theory x
	handle (Fail _) => ()) (theory_names());
repeat pp'delete_extension;
val _ = pp'seal_hierarchy();
val _ = pp'freeze_hierarchy();
pp'get_hierarchy();
abandon_reader_writer();
PolyML.make_database "test.db";
PolyML.commit();
PolyML.quit();
=TEX
Note that it is correct to see in the output from the above the message
=GFT
:> Exception- AbandonReaderWriter raised
Abandoning reader writer
val it = () : unit
=TEX
Now run the following on the new database `test.db':
=GFT csh
poly $cwd/test.db
=TEX
Prepare for tests
=GFT ML Source
use_terminal();
BasicError.pp'error_init();
PrettyPrinter.pp_init();
val hierarchy = pp'new_hierarchy();
val _ = pp'load_hierarchy hierarchy;
pp'get_hierarchy();
=TEX
Carry out activities to be tested:
these should be all functions which change the theory state.
=GFT ML Source
pp'new_theory "test";
pp'open_theory "test";
pp'new_theory "test1";
pp'open_theory "test1";
val BOOL = pp'new_type("BOOL",0);
val →_type = pp'new_type("→",2);
val v1 = mk_var("v1",BOOL);
val mk_t = mk_const("T",BOOL);
pp'new_parent 0;
pp'new_theory "test2";
pp'open_theory "test2";
pp'new_theory "test3";
pp'lock_theory "test1";
pp'lock_theory "test2";
pp'unlock_theory "test2";
pp'delete_theory "test3";
pp'list_save_thm (["test_thm"],pp'asm_rule v1);
pp'list_save_thm (["del_test_thm"],pp'asm_rule v1);
pp'delete_thm "del_test_thm";
pp'new_axiom(["test_axiom"], v1);
pp'new_const("T",BOOL);
pp'new_const("delete_T",BOOL);
pp'delete_extension();
val tv1 = mk_vartype "'tv1";
val tv2 = mk_vartype "'tv2";
val vtv1 = mk_var("vtv1",tv1);
pp'new_const("=",mk_→_type(tv1, mk_→_type(tv1, BOOL)));
pp'new_const("∃",mk_→_type(mk_→_type(tv1,BOOL),BOOL));
pp'new_const("∀",mk_→_type(mk_→_type(tv1,BOOL),BOOL));
pp'new_const("⇒",mk_→_type(BOOL,mk_→_type(BOOL,BOOL)));
pp'new_const("∧",mk_→_type(BOOL,mk_→_type(BOOL,BOOL)))
	handle _ => mk_t;
pp'new_const("∨",mk_→_type(BOOL,mk_→_type(BOOL,BOOL)))
	handle _ => mk_t;
pp'new_const("¬",mk_→_type(BOOL,BOOL))
	handle _ => mk_t;
eq_defn(["True"],"True",mk_t);
pp'new_const("TypeDefn",mk_→_type(mk_→_type(tv1,BOOL),
	mk_→_type(mk_→_type(tv2,tv1),BOOL)));
val Tv1Pred = pp'new_const("Tv1Pred",mk_→_type(tv1,BOOL));
val etype_ax = pp'new_axiom(["etype_ax"],
	mk_simple_∃(vtv1,mk_app(Tv1Pred,vtv1)));

val etype_def = pp'new_type_defn(["ETYPE"], "ETYPE",
	["'tv1"], etype_ax);
pp'open_theory "test1";
pp'duplicate_theory "test2" "test2a";
pp'seal_hierarchy();
pp'freeze_hierarchy();
=TEX
Test for the correct (i.e. created) state:
=GFT ML Source
pp'get_hierarchy ();
=TEX
Commit the database - this will cause the state of the ADT THM to revert to what is stored in the parent database.
=GFT ML Source
PolyML.commit();
=TEX
Test for the correct (i.e. initial) state.
That should be an empty theory ``min'' and a number of
empty theories with status $TSDeleted$.
=GFT ML Source
pp'get_hierarchy ();
=TEX
Now reload the new hierarchy:
=GFT ML Source
val _ = pp'load_hierarchy hierarchy;
=TEX
Test for the correct (i.e. created, once more) state:
The output from this should be identical (by textual comparison) to the output of $pp'get_hierarchy$ for the original created state output.
=GFT ML Source
pp'get_hierarchy ();
=TEX
Tidy up:
=GFT ML Source
PolyML.quit();
=TEX
=GFT csh
rm testhol.db test.db
=TEX
\section{UNTESTED ERROR MESSAGES}
\label{untested}
The following are not tested for various reasons:

\begin{tabular}{| l | p{4.5in} |}\hline
Test & Comment \\ \hline
6072 & This is where a theorem has a duff theory pointer: difficult to recreate. \\
3002 & Difficult to test for definitions and specifications \\
3003 & Difficult to test for definitions and specifications \\
3004 & Difficult to test for definitions and specifications \\
6013 & Not done for all relevent functions \\
6014 & Not done for all relevent functions \\
6015 & Not done for all relevent functions \\
6038 & Not done for all relevent functions \\
\hline
\end{tabular}
=TEX
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}



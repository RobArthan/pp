=IGN
********************************************************************************
mdt012.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% mdt012.doc   ℤ $Date: 2014/04/12 13:20:19 $ $Revision: 2.41 $ $RCSfile: mdt012.doc,v $
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

\def\Reference{DS/FMU/IED/MDT012}

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
%% LaTeX2e port: \def\TPPheadtitle{Module Tests for the Interface \cr to the Abstract Data Type $THM$}
%% LaTeX2e port: \TPPref{DS/FMU/IED/MDT012}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 2.41 $ %
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2014/04/12 13:20:19 $ %
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: %\TPPstatus{Approved}
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
\item [Issues 1.1 (1991/05/21) to 1.18 (1991/09/27)]
First draft, leading up to desk check report ID0082, and responses.
\item [Issue 2.1 (1991/09/27) (27 September 1991)]
Approved version of issue 1.18.
\item [Issue 2.2 (1991/10/31)]
Changed so that it works properly in batch mode, but
$delete\_...$ errors will go wrong interactively.

\item[Issue 2.3 (1992/01/20), \FormatDate{92/01/20} ] Updated to use new fonts.
\item[Issue 2.4 (1992/01/27) (23rd January 1992)]
$new\_axiom$, $simple\_new\_type\_defn$, $new\_type\_defn$
all changed to take lists of keys, rather than single ones.
\item [Issue 2.5 (1992/01/28) (8th April 1992)]
Changes required by CR0016.
\item [Issue 2.6 (1992/04/09) (14th April 1992)]
Changes required by CR0017.
\item [Issue 2.7 (1992/04/14) (21 April 1992)]
Reduce dependency upon the exact format of the pretty printer's outputs.
\item[Issue 2.9 (1992/05/15) (15 May 1992)] Use correct quotation symbols.
\item [Issue 2.10 (1992/05/21),2.11 (1992/05/22) (21st May 1992)]
Improved 6056.
\item [Issue 2.12 (1992/05/26) (26th May 1992)]
Renamings from version 1.5 of DS/FMU/IED/WRK038.
\item [Issue 2.13 (1992/07/14) (14th July 1992)]
Collapsed error 6052 into 6051.
\item [Issue 2.14 (1992/07/31),2.15 (1992/07/31) (31st July 1992)]
Added $do\_in\_theory$.
\item [Issue 2.16 (1992/08/05) (31st July 1992)]
Removed spurious bracket.
\item [Issue 2.17 (1992/11/24) (24th November 1992)]
Improve $do\_in\_theory\ fail$.
\item [Issue 2.18 (1992/12/15) (14th December 1992)]
Added $pending\_reset\_ksc\_functions$.
\item [Issue 2.19 (1993/02/18) (18th February 1993)]
$delete\_const$ will now delete constant at head of application.
\item [Issue 2.20 (1993/02/22),2.21 (1993/02/23),2.22 (1993/02/24) (22nd-24th February 1993)]
Bug fix.
\item [Issue 2.23 (1993/08/16)-2.25 (1993/08/18) (16th-18th August 1993)]
Added type, term and theorem compactification.
\item [Issue 2.26 (1993/12/09) (8th December 1993)]
Replaced $theory\_names$ by $get\_theory\_names$.
\item [Issue 2.27 (1999/02/22)]
Update for SML97.
\item [Issue 2.28 (1999/03/08)]
Update for new INTEGER type.
\item[Issue 2.30 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 2.31 (2002/10/17)] PPHol-specific updates for open source release
\item[Issues 2.32 (2002/12/13) -- 2.34 (2002/12/14)] Tests for checkpoints.
\item[Issue 2.35 (2003/01/17)] Relaxed restrictions on checkpointing.
\item[Issue 2.36 (2005/04/18), 2.37 (2005/12/15)] Allowed for changes to kernel inference errors and introduced test for kernel interface monitor functions.
\item[Issue 2.39 (2005/12/16)] The prefix for private interfaces is now $pp'$ rather than $icl'$.
\item[Issue 2.40 (2013/11/21)] Added tests for {\em delete\_kernel\_inference\_fun}.
\item[Issue 2.41 (2014/04/12)] Allowed for rationalisation of error handling.
\item[Issue 2.42 (2014/04/12)] Accommodated replacement of
=INLINEFT
simple_new_defn
=TEX
\ by
=INLINEFT
gen_new_spec
=TEX
.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.

\item[2015/08/03]
Tests for new rollback function.

%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
None.
\section{GENERAL}
\subsection{Scope}
This document contains the module testing of the Abstract Data Type $THM$, required by Release 1 ICL HOL Product Requirement Specification \cite{DS/FMU/IED/DEF004}.
The design is in \cite{DS/FMU/IED/DTD012}
and it is
implemented in \cite{DS/FMU/IED/IMP012}.

\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains the module testing of the material given a design in \cite{DS/FMU/IED/DTD012},
following the test policy given in that document and the general policy given in \cite{DS/FMU/IED/PLN008}.
It uses the test harness material of \cite{DS/FMU/IED/DTD013}
where appropriate.

In addition to the error messages explicitly mentioned in
\cite{DS/FMU/IED/DTD012} we also test for some of the errors
that may arise from their underlying functions.
These include messages 6013, 6014, 6015, 6036 and 6038.
\subsubsection{Dependencies}
This document is derived from the detailed design in \cite{DS/FMU/IED/DTD012},
and is further influenced by the implementation, in  \cite{DS/FMU/IED/IMP012}.
It requires a HOL prettyprinter to be installed before
it will successfully match the output of some error tests
with the required output.
\subsubsection{Deficiencies}
None known, except as detailed in section \ref{untested}.
\section{UTILITIES}
We do not wish to fail on warning messages (for the
most part):
=SML
set_flag("ignore_warnings",true);
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
store_mt_results mt_run [("startup 1",
	open_theory,
	"min",
	())];
map (fn x => delete_theory x
	handle (Fail _) => ()) (get_theory_names());
store_mt_results mt_run [("startup 2",
	(fn lst => (map (fn x => delete_theory x) lst;())),
	get_theory_names() less "min",
	())];
store_mt_results mt_run [("startup 3",
	delete_type,
	"→",
	())];
=TEX
N.B. theories used in this document become read-only ancestors,
and so cannot be deleted by the above.

We provide a list of diagnostic printing functions.
Those called $string\_of\_\ldots$ turn objects of various significant types ($TERM$, $THM$, etc)
into strings,
those called $print\_\ldots$ apply $diag\_string$ to the output
of the associated $string\_of\_\ldots$.
=SML
local
	fun simple_print_dest_term (App(t1,t2)) = (
	"App (" ^ simple_print_dest_term(dest_simple_term t1) ^", " ^
		simple_print_dest_term(dest_simple_term t2) ^ ")"
) | simple_print_dest_term (Const(s,ty)) = s ^ string_of_type ty
| simple_print_dest_term (Var(s,ty)) = s ^ string_of_type ty
| simple_print_dest_term (Simpleλ(v,b)) = (
	let val (vs,vt) = dest_var v
	in
	"λ " ^ vs ^ string_of_type vt ^ " ⦁ " ^ simple_print_dest_term (dest_simple_term b)
	end);
in

fun ⦏string_of_term1⦎ (tm : TERM) = simple_print_dest_term (dest_simple_term tm);
end;
=TEX
The following tests, by side effect, $get\-\_parents$, $get\-\_children$, $get\-\_theory\-\_status$, $get\-\_types$, $get\-\_consts$, $get\-\_thms$, $get\-\_defns$, and $get\-\_axioms$.
=SML
local
	val I = Combinators.I;
in
fun ⦏string_of_thy⦎ (nm : string) : string = (
	"\nName: " ^ (if nm = "-"
		then get_current_theory_name ()
		else nm) ^ ", " ^
	(case (get_theory_status nm) of
	TSNormal => "Status: Normal, "
	| TSDeleted => "Status: Deleted, "
	| TSLocked => "Status: Locked, "
	| TSAncestor => "Status: Ancestor, ") ^ "\n" ^
	"Parents: " ^ format_list I (get_parents nm) ", "  ^
	"; Children: " ^ format_list I (get_children nm) ", " ^
	"\n" ^
	format_list I (
	["***Types***"] @
	map string_of_type (get_types nm) @
	["***Constants***"] @
	map string_of_term1 (get_consts nm) @
	["***Theorems***"] @
	(map (fn (nl,thm) => format_list I nl ", " ^ ":" ^ string_of_thm thm)
		(get_thms nm)) @
	["***Definitions***"] @
	(map (fn (nl,thm) => format_list I nl ", " ^ ":" ^ string_of_thm thm)
		(get_defns nm)) @
	["***Axioms***"] @
	(map (fn (nl,thm) => format_list I nl ", " ^ ":" ^ string_of_thm thm)
		(get_axioms nm))) "\n");
end;

fun ⦏print_thy⦎ (nm : string) : unit = diag_line(string_of_thy nm);

fun ⦏print_all_thy⦎ (():unit) : unit = (
	map print_thy (get_theory_names());
	()
);
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
infix 3 =*#;
infix 3 =*:;
=TEX
=SML
fun (a,b) =**$ (c,d) = (a =$ c) andalso (b =$ d);
fun  (a,b) =**: (c,d) = (a =: c) andalso (b =: d);
fun (a,b) =*$ (c,d) = (a = c) andalso (b =$ d);
fun (a,b) =*: (c,d) = (a = c) andalso (b =: d);
fun (a,b) =*# (c,d) = (a = c) andalso (b =# d);
=TEX

Some functions to isolate this test material from the precise details
of the pretty printer's output.  These functions are used when testing
error conditions where the error message contains a formatted type or
term.  These routines might use the HOL pretty printer (via routines
$format\-\_term1$ and $format\-\_type1$ from $PrettyPrinter$) however they
might not be installed; the $string\_of\_XXX$ functions defend us from this.

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
The following function lets us recycle the tests originally
designed to test the old pp'new\_defn function.
=SML
fun ⦏eq_defn⦎ (keys, deflhs, defrhs) = (
	gen_new_spec(keys, asm_rule(mk_eq(mk_var(deflhs, type_of defrhs), defrhs)))
);
=TEX

\section{VALUE BINDINGS}
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
val thm1 = pp'Kernel.pp'list_simple_∀_elim [v1]
	(pp'Kernel.pp'asm_rule(mk_simple_∀(v2,v2)));
val h_thm1 = [mk_simple_∀(v2,v2)];
val c_thm1 = v1;
val thm2 = pp'Kernel.pp'asm_rule v1;
val h_thm2 = [v1];
val c_thm2 = v1;
val thm3 = pp'Kernel.pp'asm_rule v2;
val h_thm3 = [v2];
val c_thm3 = v2;
val pB_thm = pp'Kernel.pp'asm_rule pB;
=TEX
$ε$ is not declared as a new constant.
=SML
val ill_formed_thm = pp'Kernel.pp'asm_rule (mk_ε(v1,v1));
=TEX
\section{THE TESTS}
\subsection{Kernel State Change Notifiers}
The following material tests $on\_kernel\_state\_change$ and $before\-\_kernel\-\_state\-\_change$,
by defining a notifier function, $tell\_ksc$,
and then requesting that it be called before and on every state change.

Put in a kernel state change notifier that prints a message:
=SML
local val I = Combinators.I;
in
fun ⦏tell_ksc⦎ (caller : string) ((OpenTheory (ot,(intos,outofs)))
	: KERNEL_STATE_CHANGE) : unit = (
	diag_string(caller ^ "OpenTheory:" ^ ot ^"((" ^
		format_list I intos ", " ^"),("^
		format_list I outofs ", " ^"))")
) | tell_ksc caller (DeleteTheory thy) = (
	diag_string(caller ^ "DeleteTheory:"^thy)
) | tell_ksc caller (NewTheory thy) = (
	diag_string(caller ^ "NewTheory:"^thy)
) | tell_ksc caller (NewParent (thy, intos)) = (
	diag_string(caller ^ "NewParent:" ^ thy ^"(" ^
		format_list I intos ", " ^")")
) |tell_ksc caller (LockTheory thy) = (
	diag_string(caller ^ "LockTheory:"^thy)
) | tell_ksc caller (UnlockTheory thy) = (
	diag_string(caller ^ "UnlockTheory:"^thy)
) | tell_ksc caller (DuplicateTheory (thy1,thy2)) = (
	diag_string(caller ^ "DuplicateTheory:"^thy1^" , "^thy2)
) | tell_ksc caller (SaveThm (key,thm)) = (
	diag_string(caller ^ "SaveThm:"^key^":"^string_of_thm thm)
) | tell_ksc caller (ListSaveThm (keys,thm)) = (
	diag_string(caller ^ "ListSaveThm:"^
		format_list I keys ", " ^":"^string_of_thm thm)
) | tell_ksc caller (DeleteConst tm) = (
	diag_string(caller ^ "DeleteConst:"^string_of_term1 tm)
) | tell_ksc caller (DeleteType ty) = (
	diag_string(caller ^ "DeleteType:"^ty)
) | tell_ksc caller (DeleteAxiom ty) = (
	diag_string(caller ^ "DeleteAxiom:"^ty)
) | tell_ksc caller (DeleteThm nm) = (
	diag_string(caller ^ "DeleteThm:"^nm)
) | tell_ksc caller (NewConst (nm,ty)) = (
	diag_string(caller ^ "NewConst:"^nm^":"^string_of_type ty)
) | tell_ksc caller (NewType (nm,ar)) = (
	diag_string(caller ^ "NewType:"^nm^":"^string_of_int ar)
) | tell_ksc caller (GenNewSpec((keys, defthm), thm)) = (
	diag_string(caller ^ "GenNewSpec:"^
		(format_list (Combinators.I) keys ", ")^":"^string_of_thm defthm^
		":" ^ string_of_thm thm)
) | tell_ksc caller (NewTypeDefn((keys, tnm,typars,dthm),thm)) = (
	diag_string(caller ^ "NewTypeDefn:"^
		(format_list (Combinators.I) keys ", ")^":"^tnm^":"^
		format_list I typars ", " ^
		":" ^ string_of_thm thm)
) | tell_ksc caller (NewSpec((keys, n, dthm),thm)) = (
	diag_string(caller ^ "NewSpec:"^
		format_list I keys ", " ^
		":" ^ string_of_int n^ ":" ^string_of_thm dthm ^
		":" ^ string_of_thm thm)
) | tell_ksc caller (NewAxiom((keys, tm),thm)) = (
	diag_string(caller ^ "NewAxiom:"^
		(format_list (Combinators.I) keys ", ")^":"^string_of_term tm^
		":" ^ string_of_thm thm)
) | tell_ksc caller (SetUserDatum (nm,ud)) = (
	diag_string(caller ^ "SetUserDatum:"^nm)
);
end;
val before_tell_ksc = pending_reset_kernel_interface();
on_kernel_state_change (tell_ksc "OnKSC:" );
before_kernel_state_change (tell_ksc "BeforeKSC:");
=TEX
We rely on visual inspection of the results to check the
correct functioning of these notifiers.

\subsection{Initialisation of Theories}
We consider that the successful operation of $open\_theory$ and $new\_theory$ are tested implicitly through out the tests.
Our initial hierarchy of (empty) theories:
=SML
print_all_thy ();
store_mt_results mt_run [("get_current_theory_name 1",
	get_current_theory_name,
	(),
	"min")];
new_theory "next";
store_mt_results mt_run [("get_current_theory_name 2",
	get_current_theory_name,
	(),
	"next")];
print_thy "-";
open_theory "min";
new_theory "another";
open_theory "next";
new_theory "yet_again";
store_mt_results mt_run_fail [("new_theory 6040",
	new_theory,
	"yet_again",
	gen_fail_msg "new_theory" 6040 ["yet_again"])];
open_theory "next";

print_all_thy ();
store_mt_results mt_run [("get_theory_names",
	get_theory_names,
	(),
	["yet_again","another","next","min"])];
=TEX
\subsection{do$\_$in$\_$theory}
=SML
open_theory "next";
store_mt_results mt_run [(
	"do_in_theory",
	do_in_theory "min" get_current_theory_name,
	(),
	"min")];
let
	val dummy = (open_theory "min" handle (Fail _) =>());
	val mk_t_s = string_of_term mk_t;
	val dummy = open_theory "next";
in
store_mt_results mt_run_fail [(
	"do_in_theory fail",
	do_in_theory "min" dest_var,
	mk_t,
	gen_fail_msg "dest_var" 3007 [mk_t_s])]
end;
store_mt_results mt_run_error [
	("do_in_theory 12011",
	do_in_theory "min" open_theory,
	"another",
	gen_fail_msg "do_in_theory" 12011 [])];
store_mt_results mt_run [(
	"do_in_theory theory",
	get_current_theory_name,
	(),
	"next")];
open_theory "next";
=TEX
\subsection{The tests proper}
=SML
store_mt_results mt_run_fail [
	("open_theory 12035",
	open_theory,
	"rubbish",
	gen_fail_msg "open_theory" 12035 ["rubbish"])
	];
store_mt_results (mt_runf (list_eq(op =$))) [("asms 1",
	asms,
	thm1,
	h_thm1),
	("asms 2",
	asms,
	pp'Kernel.pp'refl_conv mk_t,
	[])];
store_mt_results (mt_runf (op =$)) [("concl 1",
	concl,
	thm1,
	v1),
	("concl 2",
	concl,
	pp'Kernel.pp'refl_conv mk_t,
	mk_⇔(mk_t,mk_t))];
store_mt_results (mt_runf (op =:)) [("new_type 1",
	new_type,
	("BOOL",0),
	BOOL),
	("new_type 2",
	new_type,
	("ℕ",0),
	ℕ),
	("new_type 3",
	new_type,
	("→",2),
	mk_→_type(tv'1, tv'2))];
declare_infix (100, "→");
print_thy("next");
store_mt_results mt_run_fail [
	("new_type 6045 a",
	new_type,
	("ℕ",0),
	gen_fail_msg "new_type" 6045 ["ℕ"]),
	("new_type 6088",
	new_type,
	("RUBBISH",~1),
	gen_fail_msg "new_type" 6088 [])
	];
store_mt_results (mt_runf (op =$)) [
	("new_const 6",
	new_const,
	("∀",mk_→_type(mk_→_type(tv'1,BOOL),BOOL)),
	mk_const(("∀",mk_→_type(mk_→_type(tv'1,BOOL),BOOL)))),
	("new_const 7",
	new_const,
	("∃",mk_→_type(mk_→_type(tv'1,BOOL),BOOL)),
	mk_const(("∃",mk_→_type(mk_→_type(tv'1,BOOL),BOOL))))
	];
declare_binder "∀";
declare_terminator "∀" handle _ => ();
declare_binder "∃";
declare_terminator "∃" handle _ => ();

val ∀_spec = new_axiom(["∀_spec"],mk_∃(mk_var("∀",BOOL),mk_∀(v1,v1)));
store_mt_results mt_run_fail [
	("new_const 6049 e",
	new_const,
	("∀",mk_→_type(mk_→_type(tv'1,BOOL),BOOL)),
	gen_fail_msg "new_const" 6049 ["∀"]),
	("new_const 6013",
	new_const,
	("Rubbish",mk_ctype("RUBBISH",[])),
	gen_fail_msg "new_const" 6013 ["ⓣRUBBISH⌝","RUBBISH"]),
	("new_const 6014",
	new_const,
	("Rubbish",mk_ctype("BOOL",[BOOL])),
	gen_fail_msg "new_const" 6014 ["ⓣBOOL BOOL⌝","BOOL"])	];
store_mt_results mt_run_fail [
	("gen_new_spec 6049 a",
	eq_defn,
	(["∀_def"],"∀", ⌜$∀⌝),
	gen_fail_msg "gen_new_spec" 6049 ["∀"])
	];
store_mt_results mt_run_fail [
	("new_spec 6049 a",
	new_spec,
	(["∀"],1,∀_spec),
	gen_fail_msg "new_spec" 6049 ["∀"])
	];

store_mt_results (mt_runf (op =#)) [
	("list_save_thm 1",
	dest_thm o list_save_thm,
	(["thm1"], thm1),
	(h_thm1,c_thm1)),
	("list_save_thm 2",
	dest_thm o list_save_thm,
	(["thm1a","thm1b"], thm1),
	(h_thm1,c_thm1))
	];
store_mt_results (mt_runf (list_eq(op =*#))) [
	("get_thms 1",
	map (Combinators.I ** dest_thm) o get_thms,
	"-",
	[(["thm1a","thm1b","thm1"],(h_thm1,c_thm1))])
	];

let
	val const_rv_BOOL = mk_const("rv",BOOL);
	val lsm_6015 = pp'Kernel.pp'asm_rule const_rv_BOOL;

	val const_1_BOOL = mk_const("1",BOOL);
	val lst_6038 = pp'Kernel.pp'asm_rule const_1_BOOL;
in
store_mt_results mt_run_fail [
	("list_save_thm 6031",
	list_save_thm,
	([], thm2),
	gen_fail_msg "list_save_thm" 6031 []),
	("list_save_thm 6013",
	list_save_thm,
	(["n2"], pp'Kernel.pp'refl_conv (mk_var("rv",mk_ctype("rubbish",[])))),
	gen_fail_msg "list_save_thm" 6013 ["⊢ rv = rv","rubbish"]),
	("list_save_thm 6014",
	list_save_thm,
	(["n2"], pp'Kernel.pp'refl_conv (mk_var("rv",mk_ctype("BOOL",[BOOL])))),
	gen_fail_msg "list_save_thm" 6014 ["⊢ rv = rv","BOOL"]),
	("list_save_thm 6015",
	list_save_thm,
	(["n2"], lsm_6015),
	gen_fail_msg "list_save_thm" 6015 [pr_thm lsm_6015,"rv"]),
	("list_save_thm 6038",
	list_save_thm,
	(["n2"], lst_6038),
	gen_fail_msg "list_save_thm" 6038 [pr_thm lst_6038,"1"]),
	("list_save_thm 6039 a",
	list_save_thm,
	(["thm1"], thm2),
	gen_fail_msg "list_save_thm" 6039 ["thm1","next"]),
	("list_save_thm 6039 b",
	list_save_thm,
	(["thm2","thm1","thm2a"], thm2),
	gen_fail_msg "list_save_thm" 6039 ["thm1","next"])
	]
end;

store_mt_results mt_run_fail [
	("save_thm 6039",
	save_thm,
	("thm1", thm2),
	gen_fail_msg "save_thm" 6039 ["thm1","next"])];
store_mt_results (mt_runf (op =#)) [
	("list_save_thm 3",
	dest_thm o list_save_thm,
	(["thm2a","thm2b"], thm2),
	(h_thm2,c_thm2))
	];
store_mt_results (mt_runf (list_eq(op =*#))) [
	("get_thms 2",
	map (Combinators.I ** dest_thm) o get_thms,
	"-",
	[(["thm2a","thm2b"],(h_thm2,c_thm2)),
	(["thm1a","thm1b","thm1"],(h_thm1,c_thm1))])
	];
store_mt_results (mt_runf (op =#)) [
	("save_thm",
	dest_thm o save_thm,
	("thm3", thm3),
	(h_thm3,c_thm3))
	];
=TEX
Test out a theory in which BOOL is not defined.
=SML
open_theory "another";
store_mt_results mt_run_fail [
	("list_save_thm 6013 b",
	list_save_thm,
	(["thm2"], thm2),
	gen_fail_msg "list_save_thm" 6013 ["v1 ⊢ v1","BOOL"])
	];
store_mt_results mt_run_fail [
	("save_thm 6013 c",
	save_thm,
	("thm2", thm2),
	gen_fail_msg "save_thm" 6013 ["v1 ⊢ v1","BOOL"])
	];
=TEX
Test for reaction to things already defined in the descendants.
=SML
open_theory"another";
new_const("Func", ⓣ'a → 'a⌝);
open_theory "min";
store_mt_results mt_run_fail [
	("new_type 6034",
	new_type,
	("→",2),
	gen_fail_msg "new_type" 6034 ["→"])
	];
store_mt_results mt_run_fail [
	("new_const 6063",
	new_const,
	("∀",tv'1),
	gen_fail_msg "new_const" 6063 ["∀"])
	];
store_mt_results mt_run_fail [
	("new_type_defn 6034",
	new_type_defn,
	(["→_def"],"→",[],thm1),
	gen_fail_msg "new_type_defn" 6034 ["→"])
	];
store_mt_results mt_run_fail [
	("gen_new_spec 6063",
	eq_defn,
	(["func_def"],"Func",⌜λx⦁ x⌝),
	gen_fail_msg "gen_new_spec" 6063 ["Func"])
	];
=TEX
Unfortunately for our testing $new\_spec$ requires a valid theorem, so:
=SML
open_theory "yet_again";
new_const ("test_spec",BOOL);
open_theory "next";
val test_spec_ax = new_axiom(["test_spec_ax"],mk_∃(mk_var("test_spec",BOOL),mk_∀(v1,v1)));
store_mt_results mt_run_fail [
	("new_spec 6063",
	new_spec,
	(["test_spec_def"],1,test_spec_ax),
	gen_fail_msg "new_spec" 6063 ["test_spec"])
	];
=TEX
Now test reaction to presence in ancestors:
=SML
open_theory "yet_again";
store_mt_results mt_run_fail [
	("new_type 6045 c",
	new_type,
	("→",2),
	gen_fail_msg "new_type" 6045 ["→"])
	];
store_mt_results mt_run_fail [
	("new_const 6049 c",
	new_const,
	("∀",tv'1),
	gen_fail_msg "new_const" 6049 ["∀"])
	];
store_mt_results mt_run_fail [
	("new_type_defn 6045 c",
	new_type_defn,
	(["→_def"],"→",[],thm1),
	gen_fail_msg "new_type_defn" 6045 ["→"])
	];
store_mt_results mt_run_fail [
	("gen_new_spec 6049 b",
	eq_defn,
	(["∀_def"],"∀", ⌜$∀⌝),
	gen_fail_msg "gen_new_spec" 6049 ["∀"])
	];
store_mt_results mt_run_fail [
	("new_spec 6049 b",
	new_spec,
	(["∀_def"],1,∀_spec),
	gen_fail_msg "new_spec" 6049 ["∀"])
	];
=TEX
Test out deletions($delete\_const$, $delete\_type$ and $delete\_axiom$, $delete\_thm$) by side effect:
=SML
open_theory "another";
store_mt_results (mt_runf (op =:)) [("new_type 4",
	new_type,
	("BOOL",0),
	BOOL)
	];
save_thm("example_delete_thm",pB_thm);
store_mt_results (mt_runf (op =|-)) [("delete_thm",
	delete_thm,
	"example_delete_thm",
	pB_thm)];
store_mt_results (mt_runf (op =$)) [
	("new_const 3",
	new_const,
	("T",BOOL),
	mk_const("T",BOOL)),
	("new_const 4",
	new_const,
	("F",BOOL),
	mk_const("F",BOOL))
	];
print_thy("another");
delete_const mk_f;
=TEX
Test compactification:
=SML
open_theory"another";
new_theory"compactification";
new_type("type0", 0);
new_type("type2", 2);
new_type("type3", 3);
fun comp_test (n, f, x) = (n, f, x, x);
store_mt_results (mt_runf (op =:)) (map comp_test[
	("compact_type 1",
	compact_type,
	mk_ctype("type2", [mk_vartype "'xyz", mk_vartype "'xyz"])),
	("compact_type 2",
	compact_type,
	mk_ctype("type3", [mk_vartype "'xyz", mk_vartype "'abc", mk_vartype "'xyz"]))
]);
val type0 = mk_ctype("type0", []);
store_mt_results (mt_runf (op =$)) (map comp_test[
	("compact_term 1",
	compact_term,
	mk_var("Var", type0)),
	("compact_term 2",
	compact_term,
	mk_const("Const", type0)),
	("compact_term 3",
	compact_term,
	mk_app(mk_const("Func", mk_→_type(type0, type0)),
		mk_const("Const", type0))),
	("compact_term 4",
	compact_term,
	mk_simple_λ(mk_var("BoundVar", type0),
		mk_const("Const", type0)))
]);
=TEX
=SML
store_mt_results (mt_runf (op =|-)) (map comp_test[
	("compact_thm 1",
	compact_thm,
	pB_thm)
]);
open_theory"another";
delete_theory"compactification";
=TEX
Test for deletion of constant with same type up to renaming of type variables.
=SML
new_const ("test_delete_const",mk_vartype "'a");
delete_const (mk_const("test_delete_const",mk_vartype "'b"));
=TEX
Test for deletion of constant applied to args:
=SML
new_type ("→",2) handle (Fail _) => mk_vartype "'rubbish";
new_const ("test_delete_const",mk_→_type (mk_vartype "'a",mk_vartype "'b"));
delete_const (mk_app(
	mk_const("test_delete_const",mk_→_type (mk_vartype "'b", mk_vartype "'a")),
	mk_var("x",mk_vartype "'b")));
delete_type "→" handle (Fail _) => ();
=TEX
The following will only work if above two bits successful.
=SML
new_const ("test_delete_const",mk_vartype "'a");
delete_const (mk_const("test_delete_const",mk_vartype "'b"));
=TEX
=SML
print_thy("-");
store_mt_results (mt_runf (op =$)) [
	("new_const 5",
	new_const,
	("F",BOOL),
	mk_const("F",BOOL))
	];
val s1 = list_save_thm(["s1"], pp'Kernel.pp'asm_rule v1);
print_thy("another");
store_mt_results mt_run_fail [
	("delete_const 12001",
	delete_const,
	(mk_const("F",tv1)),
	gen_fail_msg "delete_const" 12001 ["another","F"]),
	("delete_const 12014",
	delete_const,
	(mk_var("F",tv1)),
	gen_fail_msg "delete_const" 12014 [pr_term(mk_var("F",tv1))])
	];
=TEX
The following test only works in batch mode: $warn$ differs
in the exception returned for interactive use.
(Answer "n" in interactive mode).
=SML
diag_line
"Answer n to the next question if running this test interactively";
set_flag("ignore_warnings",false);
store_mt_results mt_run_fail [
	("delete_const 12012 a",
	delete_const,
	mk_f,
	gen_fail_msg "delete_const" 12012 ["F","Constant:F; Theorem:s1"])
	];
set_flag("ignore_warnings",true);
delete_const mk_f;
print_thy("-");
delete_const mk_t;
print_thy("-");
val TorF = new_const("TorF",BOOL);
print_thy("-");
store_mt_results mt_run_fail [
	("delete_type 12002",
	delete_type,
	"rubbish",
	gen_fail_msg "delete_type" 12002 ["another","rubbish"])];
store_mt_results mt_run_fail [
	("delete_axiom 12003",
	delete_axiom,
	"rubbish",
	gen_fail_msg "delete_axiom" 12003 ["another","rubbish"])];
store_mt_results mt_run_fail [
	("delete_thm 6046",
	delete_thm,
	"rubbish",
	gen_fail_msg "delete_thm" 6046 ["rubbish","another"])];

delete_type "BOOL";
print_thy("-");

open_theory "yet_again";
store_mt_results (mt_runf (op =#)) [
	("new_axiom",
	dest_thm o new_axiom,
	(["∀_axiom"],mk_∀(v1,v1)),
	([],mk_∀(v1,v1)))
	];
print_thy("yet_again");
=TEX
N.B. the constant $⌜test_spec:BOOL⌝$ just happens to be
in scope, for testing empty key lists.
=SML
store_mt_results mt_run_fail [
	("new_axiom 6047",
	new_axiom,
	(["∀_axiom"],mk_∀(v1,v1)),
	gen_fail_msg "new_axiom" 6047 ["∀_axiom","yet_again"]),
	("new_axiom 6015",
	new_axiom,
	(["t_axiom"],mk_t),
	gen_fail_msg "new_axiom" 6015 [pr_term mk_t,"T"]),
	("new_axiom 3031",
	new_axiom,
	(["t_axiom"],N0),
	gen_fail_msg "new_axiom" 3031 ["⌜0⌝"]),
	("new_axiom 6031",
	new_axiom,
	([],mk_const("test_spec",BOOL)),
	gen_fail_msg "new_axiom" 6031 [])
	];

print_thy("yet_again");

=TEX
Test $lock\_theory$ and $unlock\_theory$ by side effect:
=SML
new_type ("SOMETHING",3);
new_const ("Something",BOOL);
lock_theory "yet_again";
store_mt_results mt_run_fail [("delete_theory 6037",
	delete_theory,
	"yet_again",
	gen_fail_msg "delete_theory" 6037 ["yet_again"])];
store_mt_results mt_run_fail [("new_axiom 6037",
	new_axiom,
	(["Truth_Axiom"],mk_t),
	gen_fail_msg "new_axiom" 6037 ["yet_again"])];
store_mt_results mt_run_fail [("new_const 6037",
	new_const,
	("ForT",BOOL),
	gen_fail_msg "new_const" 6037 ["yet_again"])];
store_mt_results mt_run_fail [("new_type_defn 6037",
	new_type_defn,
	(["→_def"],"→",[],thm1),
	gen_fail_msg "new_type_defn" 6037 ["yet_again"])];
store_mt_results mt_run_fail [("gen_new_spec 6037",
	eq_defn,
	(["∀_def"],"∀", ⌜$∀⌝),
	gen_fail_msg "gen_new_spec" 6037 ["yet_again"])];
store_mt_results mt_run_fail [("new_spec 6037",
	new_spec,
	(["∀_def"],1,∀_spec),
	gen_fail_msg "new_spec" 6037 ["yet_again"])];
store_mt_results mt_run_fail [("new_type 6037",
	new_type,
	("SOMETHING",3),
	gen_fail_msg "new_type" 6037 ["yet_again"])
	];
store_mt_results mt_run_fail [("list_save_thm 6037",
	list_save_thm,
	(["Example"],thm1),
	gen_fail_msg "list_save_thm" 6037 ["yet_again"])];
store_mt_results mt_run_fail [("save_thm 6037",
	save_thm,
	("Example1",thm1),
	gen_fail_msg "save_thm" 6037 ["yet_again"])];
store_mt_results mt_run_fail [("delete_axiom 6037",
	delete_axiom,
	"∀_axiom",
	gen_fail_msg "delete_axiom" 6037 ["yet_again"])];
store_mt_results mt_run_fail [("delete_thm 6037",
	delete_thm,
	"Example",
	gen_fail_msg "delete_thm" 6037 ["yet_again"])];
store_mt_results mt_run_fail [("delete_type 6037",
	delete_type,
	"SOMETHING",
	gen_fail_msg "delete_type" 6037 ["yet_again"])];
store_mt_results mt_run_fail [("delete_const 6037",
	delete_const,
	mk_const("Something",BOOL),
	gen_fail_msg "delete_const" 6037 ["yet_again"])];
store_mt_results mt_run_fail [("set_user_datum 6037",
	set_user_datum,
	("testing",UD_String ("a test",[])),
	gen_fail_msg "set_user_datum" 6037 ["yet_again"])];
store_mt_results mt_run_fail [("lock_theory 6037",
	lock_theory,
	"yet_again",
	gen_fail_msg "lock_theory" 6037 ["yet_again"])];
store_mt_results mt_run_fail [("new_parent 6037",
	new_parent,
	"another",
	gen_fail_msg "new_parent" 6037 ["yet_again"])];
store_mt_results mt_run [
	("get_theory_status 1",
	get_theory_status,
	"yet_again",
	TSLocked)
	];
store_mt_results mt_run [
	("get_current_theory_status 1",
	get_current_theory_status,
	(),
	TSLocked)
	];

unlock_theory "yet_again";
store_mt_results mt_run [
	("get_theory_status 2",
	get_theory_status,
	"yet_again",
	TSNormal)
	];
=TEX
Test user data features of $set\_user\_data$ by side effect:
=SML
set_user_datum ("testing",UD_String ("a test",[]));
let
fun aux (UD_String (nm1,[]),UD_String (nm2,[])) = nm1 = nm2
| aux _ = false;
in
store_mt_results (mt_runf aux) [
	("get_user_datum 1",
	get_user_datum "-",
	"testing",
	UD_String ("a test",[])),
	("get_user_datum 2",
	get_user_datum "yet_again",
	"testing",
	UD_String ("a test",[]))
	]
end;

store_mt_results mt_run_fail [
	("get_user_datum 12035",
	get_user_datum "rubbish",
	"testing",
	gen_fail_msg "get_user_datum" 12035 ["rubbish"]),
	("get_user_datum 12009",
	get_user_datum "-",
	"rubbish",
	gen_fail_msg "get_user_datum" 12009 ["rubbish","-"])
	];
store_mt_results mt_run_fail [
	("lock_theory 12035",
	lock_theory,
	"rubbish",
	gen_fail_msg "lock_theory" 12035 ["rubbish"]),
	("unlock_theory 12035 a",
	unlock_theory,
	"rubbish",
	gen_fail_msg "unlock_theory" 12035 ["rubbish"])
	];
=TEX
Test the multiple deletion effects of the delete extension
functions.
=SML
val ForT = new_const("ForT",BOOL);
val just_passing = new_const("just_passing",BOOL);
=TEX
The following three tests only work in batch mode: $warn$ differs
in the exception returned for interactive use.
(Answer "n" in interactive mode).
=SML
diag_line
"Answer n to the next question if running this test interactively";
set_flag("ignore_warnings",false);
store_mt_results mt_run_fail [
	("delete_const 12012 b",
	delete_const,
	just_passing,
	gen_fail_msg "delete_const" 12012 ["just_passing","Constant:just_passing"])
	];
set_flag("ignore_warnings",true);
delete_const ForT;
new_type("just_passing2",1);
=TEX
The following test in part relies on the visual inspection of the warning message given.
(Answer "n" in interactive mode).
=SML
diag_line
"Answer n to the next question if running this test interactively";
set_flag("ignore_warnings",false);
store_mt_results mt_run_fail [
	("delete_type 12012",
	delete_type,
	"just_passing2",
	gen_fail_msg "delete_type" 12012 ["just_passing2","Type:just_passing2"])
	];
set_flag("ignore_warnings",true);
delete_type "just_passing2";
new_axiom(["just_passing3"],v1);
=TEX
The following test in part relies on the visual inspection of the warning message given.
(Answer "n" in interactive mode).
=SML
diag_line
"Answer n to the next question if running this test interactively";
set_flag("ignore_warnings",false);
store_mt_results mt_run_fail [
	("delete_axiom 12012",
	delete_axiom,
	"just_passing3",
	gen_fail_msg "delete_axiom" 12012 ["just_passing3","Axiom:just_passing3"])
	];
set_flag("ignore_warnings",true);
delete_axiom "just_passing3";
=TEX
Can't delete if theory has children:
=SML
open_theory "next";
store_mt_results mt_run_fail [("delete_const 6076",
	delete_const,
	(mk_const("∀",mk_→_type(mk_→_type(tv'1,BOOL),BOOL))),
	gen_fail_msg "delete_const" 6076 ["next"])];
store_mt_results mt_run_fail [("delete_type 6076",
	delete_type,
	"BOOL",
	gen_fail_msg "delete_type" 6076 ["next"])];
store_mt_results mt_run_fail [("delete_axiom 6076",
	delete_axiom,
	"∀_spec",
	gen_fail_msg "delete_axiom" 6076 ["next"])];
open_theory "next";
store_mt_results mt_run [
	("thm_theory 1",
	thm_theory,
	thm1,
	"min"),
	("thm_theory 2",
	thm_theory,
	pp'Kernel.pp'asm_rule v1,
	"next")
	];
=TEX
Test $delete\_theory$ by side effect, rather than explicit test.
=SML
new_theory "to_be_deleted";
val del_thy_name = string_of_int(pp'Kernel.pp'get_current_theory_name());
print_thy("to_be_deleted");
val thy_deleted_thm = save_thm("thy_deleted_thm",pp'Kernel.pp'asm_rule v1);
open_theory "next";
delete_theory "to_be_deleted";

store_mt_results mt_run_fail [
	("thm_theory 12007",
	thm_theory,
	thy_deleted_thm,
	gen_fail_msg "thm_theory" 12007 ["v1 ⊢ v1",del_thy_name])
	];
store_mt_results mt_run_fail [
	("get_theory_status 12035 a",
	get_theory_status,
	"to_be_deleted",
	gen_fail_msg "get_theory_status" 12035 ["to_be_deleted"]),
	("get_theory_status 12035 b",
	get_theory_status,
	"rubbish",
	gen_fail_msg "get_theory_status" 12035 ["rubbish"])
	];

print_all_thy();
store_mt_results mt_run_fail [
	("open_theory 12035 b",
	open_theory,
	"to_be_deleted",
	gen_fail_msg "open_theory" 12035 ["to_be_deleted"])
	];
store_mt_results mt_run_fail [
	("delete_theory 12035 b",
	delete_theory,
	"to_be_deleted",
	gen_fail_msg "delete_theory" 12035 ["to_be_deleted"])
	];
store_mt_results mt_run_fail [
	("lock_theory 12035 b",
	lock_theory,
	"to_be_deleted",
	gen_fail_msg "lock_theory" 12035 ["to_be_deleted"]),
	("unlock_theory 12035 b",
	unlock_theory,
	"to_be_deleted",
	gen_fail_msg "unlock_theory" 12035 ["to_be_deleted"]),
	("unlock_theory 6068",
	unlock_theory,
	"yet_again",
	gen_fail_msg "unlock_theory" 6068 ["yet_again"])
	];

new_theory "to_be_deleted"; (* succeeds! *)
print_thy("to_be_deleted");
open_theory "yet_again";
delete_theory "to_be_deleted";
store_mt_results mt_run_fail [
	("delete_theory 6076",
	delete_theory,
	"min",
	gen_fail_msg "delete_theory" 6076 ["min"]),
	("delete_theory 6069",
	delete_theory,
	"yet_again",
	gen_fail_msg "delete_theory" 6069 ["yet_again"])
	];
=TEX
The correct operation of $duplicate\_theory$ should be checked
by visually inspecting the following output.
=SML
print_thy("next");
duplicate_theory ("next", "copy_of_next");
print_thy("copy_of_next");

store_mt_results mt_run_fail [
	("duplicate_theory 6026",
	duplicate_theory,
	("min", "copy_of_min"),
	gen_fail_msg "duplicate_theory" 6026 ["min"]),
	("duplicate_theory 12035 a",
	duplicate_theory,
	("rubbish", "copy_of_rubbish"),
	gen_fail_msg "duplicate_theory" 12035 ["rubbish"]),
	("duplicate_theory 12035 b",
	duplicate_theory,
	("to_be_deleted", "copy_of_rubbish"),
	gen_fail_msg "duplicate_theory" 12035 ["to_be_deleted"]),
	("duplicate_theory 6040",
	duplicate_theory,
	("next", "copy_of_next"),
	gen_fail_msg "duplicate_theory" 6040 ["copy_of_next"])
	];
store_mt_results mt_run_error [
	("list_save_thm 6036",
	list_save_thm,
	(["s2"], thy_deleted_thm),
	gen_fail_msg "⇒_intro" 6036 ["v1 ⊢ v1","to_be_deleted",del_thy_name])
	];
=TEX
Definitional mechanisms:
=SML
open_theory "next";
declare_binder "λ";
declare_terminator "λ" handle _ => ();
new_const("T",BOOL);
new_const("F",BOOL);
new_const("=",mk_→_type(tv1, mk_→_type(tv1, BOOL)));
declare_infix (200, "=");
declare_terminator "=" handle _ => ();
declare_alias ("⇔", ⌜$=:BOOL→BOOL→BOOL⌝) handle _ => ();
declare_infix (200, "⇔") handle _ => ();
new_const("⇒",mk_→_type(BOOL,mk_→_type(BOOL,BOOL)));
declare_infix (20, "⇒");
declare_terminator "⇒" handle _ => ();
new_const("∧",mk_→_type(BOOL,mk_→_type(BOOL,BOOL)));
declare_infix (40, "∧");
declare_terminator "∧" handle _ => ();
new_const("∨",mk_→_type(BOOL,mk_→_type(BOOL,BOOL)));
declare_infix (30, "∨");
declare_terminator "∨" handle _ => ();
new_const("¬",mk_→_type(BOOL,BOOL));
declare_prefix (50, "¬");
new_const("TypeDefn",mk_→_type(mk_→_type(tv1,BOOL),
	mk_→_type(mk_→_type(tv'2,tv1),BOOL)));
val Tv1Pred = new_const("Tv1Pred",mk_→_type(tv1,BOOL));
open_theory "yet_again";
store_mt_results (mt_runf (op =#)) [
	("gen_new_spec 1",
	dest_thm o eq_defn,
	(["True"],"True",mk_t),
	([],mk_⇔(mk_const("True",BOOL),mk_t))),
	("gen_new_spec 2",
	dest_thm o eq_defn,
	(["False"],"False",mk_f),
	([],mk_⇔(mk_const("False",BOOL),mk_f)))
	];
store_mt_results mt_run_fail [
	("gen_new_spec 6013",
	eq_defn,
	(["x"],"Rubbish",mk_var("v",mk_ctype("RUBBISH",[]))),
	gen_fail_msg "gen_new_spec" 6013 ["⌜v⌝","RUBBISH"]),
	("gen_new_spec 6049 c",
	eq_defn,
	(["True"],"True",mk_t),
	gen_fail_msg "gen_new_spec" 6049 ["True"]),
	("gen_new_spec 6049 d",
	eq_defn,
	(["0"],"0",N0),
	gen_fail_msg "gen_new_spec" 6049 ["0"]),
	("gen_new_spec 6051",
	eq_defn,
	(["True"],"True1",mk_t),
	gen_fail_msg "gen_new_spec" 6051 ["True","yet_again"]),
	("gen_new_spec 6058",
	eq_defn,
	(["Maybe1"],"Maybe1",mk_∀(vtv1,mk_eq(vtv1,vtv1))),
	gen_fail_msg "gen_new_spec" 6058 ["⌜∀ vtv1⦁ vtv1 = vtv1⌝","'tv1", "⌜Maybe1⌝"]),
	("gen_new_spec 6059",
	eq_defn,
	(["Maybe"],"Maybe",v1),
	gen_fail_msg "gen_new_spec" 6059 ["term", "⌜v1⌝", "", "v1"]),
	("gen_new_spec 6031",
	eq_defn,
	([],"Maybe",mk_t),
	gen_fail_msg "gen_new_spec" 6031 [])
	];
val etype_ax = new_axiom(["etype_ax"],
	mk_simple_∃(vtv1,mk_app(Tv1Pred,vtv1)));

local val x= mk_var("x",tv'2)
in
val etype2_exax = new_axiom(["etype2_exax"],
	mk_simple_∃(x,mk_app(inst [] [(tv'2,tv1)]Tv1Pred,x)))
end;
val etype_def = new_type_defn(["ETYPE"], "ETYPE", ["'tv1"], etype_ax);
val etype2_def = new_type_defn(["ETYPE2"], "ETYPE2", ["'2"], etype2_exax);
let
	fun f t1 t2 = mk_var("f",mk_→_type(t1,t2));
in
store_mt_results (mt_runf (op =#)) [
	("new_type_defn 1",
	dest_thm,
	etype_def,
	([], mk_∃(f (mk_ctype("ETYPE",[tv1])) tv1,
		list_mk_app(
		mk_const("TypeDefn",mk_→_type(mk_→_type(tv1,BOOL),
			mk_→_type(mk_→_type(mk_ctype("ETYPE",[tv1]),tv1),BOOL))),
		[inst [] [] Tv1Pred,f (mk_ctype("ETYPE",[tv1])) tv1])))),
	("new_type_defn 2",
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
val etype_ax_6054 = new_axiom(["etype_ax_6054"], mk_t);
val etype_ax_6055 = new_axiom(["etype_ax_6055"],
	mk_∃(mk_var("x",tv1),mk_t));
val etype_ax_6056 = new_axiom(["etype_ax_6056"],
	mk_∃(mk_var("x",tv1),mk_app(mk_var("p",mk_→_type(tv1,BOOL)),
		mk_var("x",tv1))));
val etype_ax_6062 = new_axiom(["etype_ax_6062"],
	mk_∃(mk_var("x",tv1),
		mk_app(mk_var("q",mk_→_type(BOOL,BOOL)),
		mk_app(mk_var("p",mk_→_type(tv1,BOOL)), mk_var("x",tv1)))));
val etype_ax_6080 = new_axiom(["etype_ax_6080"],
	mk_∃(mk_var("x",tv1),mk_app(mk_const("¬",mk_→_type(BOOL,BOOL)),
		mk_t)));
store_mt_results mt_run_fail [
	("new_type_defn 6045",
	new_type_defn,
	(["ETYPE1"], "ETYPE", ["'tv1"], etype_ax),
	gen_fail_msg "new_type_defn" 6045 ["ETYPE"]),
	("new_type_defn 6051",
	new_type_defn,
	(["ETYPE"], "ETYPE1", ["'tv1"], etype_ax),
	gen_fail_msg "new_type_defn" 6051 ["ETYPE","yet_again"]),
	("new_type_defn 6053",
	new_type_defn,
	(["ETYPE1"], "ETYPE1", ["'tv1"], pp'Kernel.pp'asm_rule mk_t),
	gen_fail_msg "new_type_defn" 6053 ["T ⊢ T"]),
	("new_type_defn 6054",
	new_type_defn,
	(["ETYPE1"], "ETYPE1", ["'tv1"], etype_ax_6054),
	gen_fail_msg "new_type_defn" 6054 ["⊢ T"]),
	("new_type_defn 6055",
	new_type_defn,
	(["ETYPE1"], "ETYPE1", ["'tv1"], etype_ax_6055),
	gen_fail_msg "new_type_defn" 6055 ["⊢ ∃ x⦁ T"]),
	("new_type_defn 6056",
	new_type_defn,
	(["ETYPE1"], "ETYPE1", ["'tv1"], etype_ax_6056),
	gen_fail_msg "new_type_defn" 6059 ["theorem" ,"⊢ ∃ x⦁ p x", "", "p"]),
	("new_type_defn 6062",
	new_type_defn,
	(["ETYPE1"], "ETYPE1", ["'tv1"], etype_ax_6062),
	gen_fail_msg "new_type_defn" 6059 ["theorem", "⊢ ∃ x⦁ q (p x)", "s", "p, q"]),
	("new_type_defn 6057",
	new_type_defn,
	(["ETYPE1"], "ETYPE1", ["'not_there"], etype_ax),
	gen_fail_msg "new_type_defn" 6057 ["⊢ ∃ vtv1⦁ Tv1Pred vtv1","'tv1"]),
	("new_type_defn 6079",
	new_type_defn,
	(["ETYPE1"], "ETYPE1", ["'tv1","'tv1"], etype_ax),
	gen_fail_msg "new_type_defn" 6079 ["'tv1"]),
	("new_type_defn 6080",
	new_type_defn,
	(["ETYPE1"], "ETYPE1", ["'tv1"], etype_ax_6080),
	gen_fail_msg "new_type_defn" 6080 ["⊢ ∃ x⦁ ¬ T"]),
	("new_type_defn 6031",
	new_type_defn,
	([], "ETYPE1", ["'tv1"], etype_ax),
	gen_fail_msg "new_type_defn" 6031 [])
	];
store_mt_results mt_run_error [
	("new_type_defn 6036",
	new_type_defn,
	( ["rubbish"], "rubbish", [], thy_deleted_thm),
	gen_fail_msg "⇒_intro" 6036 ["v1 ⊢ v1","to_be_deleted",del_thy_name])
	];
=TEX
\subsection{new\_spec}
=SML
val So = mk_const("So",BOOL);
val IsSo = mk_const("IsSo",BOOL);
val vSo = mk_var("So",BOOL);
val vIsSo = mk_var("IsSo",BOOL);
val so_isso_axiom = new_axiom(["so_isso_axiom"],
	list_mk_simple_∃([vSo,vIsSo],mk_⇒(vSo,vIsSo)));
val so_isso_def = new_spec (["So","IsSo"],2,so_isso_axiom);
store_mt_results (mt_runf (op =#)) [
	("new_spec",
	dest_thm,
	so_isso_def,
	([],mk_⇒(So,IsSo)))
	];
val spec_ax_6016 = new_axiom(["spec_ax_6016"],
	list_mk_∃([mk_var("x",BOOL),mk_var("x",BOOL)],
		mk_∧(mk_var("x",BOOL),mk_var("x",BOOL))));
val spec_ax_6051 = new_axiom(["spec_ax_6051"],
	mk_∃(mk_var("x",BOOL),mk_var("x",BOOL)));
val spec_ax_6056 = new_axiom(["spec_ax_6056"],
	mk_∃(mk_var("x",BOOL),mk_eq(mk_var("x",BOOL),v1)));
val spec_ax_6062 = new_axiom(["spec_ax_6062"],
	mk_∃(mk_var("x",BOOL),
		mk_eq(mk_var("y",BOOL),
		mk_eq(mk_var("x",BOOL),v1))));
val spec_ax_6061 = new_axiom(["spec_ax_6061"],
	mk_∃(mk_var("x",BOOL),mk_eq(mk_var("x",BOOL),
		mk_∀(mk_var("y",tv1), mk_t))));
val spec_ax_6081 = new_axiom(["spec_ax_6081"],
	list_mk_∃([mk_var("y",tv'2),mk_var("x",BOOL)],
		mk_∧(mk_var("x",BOOL),mk_var("x",BOOL))));
store_mt_results mt_run_fail [
	("new_spec 6016",
	new_spec,
	(["x1","x2"],2,spec_ax_6016),
	gen_fail_msg "new_spec" 6016 ["x","⊢ ∃ x x⦁ x ∧ x"]),
	("new_spec 6031",
	new_spec,
	([],2,so_isso_axiom),
	gen_fail_msg "new_spec" 6031 []),
	("new_spec 6044",
	new_spec,
	(["nowhere"],0,so_isso_axiom),
	gen_fail_msg "new_spec" 6044 []),
	("new_spec 6049",
	new_spec,
	(["Soa","IsSoa"],2,so_isso_axiom),
	gen_fail_msg "new_spec" 6049 ["So"]),
	("new_spec 6051",
	new_spec,
	(["So","IsSo"],1,spec_ax_6051),
	gen_fail_msg "new_spec" 6051 ["IsSo","yet_again"]),
	("new_spec 6053",
	new_spec,
	(["So","IsSo"],2,pp'Kernel.pp'asm_rule mk_t),
	gen_fail_msg "new_spec" 6053 ["T ⊢ T"]),
	("new_spec 6056",
	new_spec,
	(["x"],1,spec_ax_6056),
	gen_fail_msg "new_spec" 6059 ["theorem", "⊢ ∃ x⦁ x ⇔ v1", "", "v1"]),
	("new_spec 6062",
	new_spec,
	(["x"],1,spec_ax_6062),
	gen_fail_msg "new_spec" 6059 ["theorem", "⊢ ∃ x⦁ y ⇔ x ⇔ v1", "s", "v1, y"]),
	("new_spec 6060",
	new_spec,
	(["Some"],3,so_isso_axiom),
	gen_fail_msg "new_spec" 6060 [pr_thm so_isso_axiom, "3"]),
	("new_spec 6061",
	new_spec,
	(["x"],1,spec_ax_6061),
	gen_fail_msg "new_spec" 6061 ["⊢ ∃ x⦁ x ⇔ (∀ y⦁ T)", "'tv1"]),
	("new_spec 6081",
	new_spec,
	(["x"],2,spec_ax_6081),
	gen_fail_msg "new_spec" 6081 ["⌜y⌝","⌜x⌝"])
	];
store_mt_results mt_run_error [
	("new_spec 6036",
	new_spec,
	([],2,thy_deleted_thm),
	gen_fail_msg "⇒_intro" 6036 ["v1 ⊢ v1","to_be_deleted",del_thy_name])
	];
=TEX
\subsection{Theory Functions}
We test $new\_parent$'s successful operation by side effect (observing the print of the current theory).
=SML
new_parent "another";
print_thy "-";
open_theory "min";
val UNIT = new_type ("UNIT",0);
new_theory "tester";
val F' = new_const("F",UNIT);
open_theory "yet_again";
store_mt_results mt_run_fail [
	("new_parent 6067 a",
	new_parent,
	"tester",
	gen_fail_msg "new_parent" 6067 ["tester"]),
	("new_parent 12035 a",
	new_parent,
	"rubbish",
	gen_fail_msg "new_parent" 12035 ["rubbish"]),
	("new_parent 12035 b",
	new_parent,
	"to_be_deleted",
	gen_fail_msg "new_parent" 12035 ["to_be_deleted"]),
	("new_parent 6082",
	new_parent,
	"next",
	gen_fail_msg "new_parent" 6082 ["next"])
	];
open_theory "min";
store_mt_results mt_run_fail [
	("new_parent 6084",
	new_parent,
	"yet_again",
	gen_fail_msg "new_parent" 6084 ["yet_again"])];
store_mt_results mt_run [
	("get_current_theory_status 2",
	get_current_theory_status,
	(),
	TSNormal)
	];
=TEX
\section{FUTHER THEORY FUNCTIONS}
Test hooks into environments.
=SML
open_theory "yet_again";
let
fun aux (Value a,Value b) = a =:b
| aux (Nil, Nil) = true
| aux _ = false;
in
store_mt_results (mt_runf aux)  [
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
open_theory  "yet_again";
store_mt_results (mt_runf (op =$)) [
	("new_const 1",
	new_const,
	("12a",BOOL),
	mk_const("12a",BOOL)),
	("new_const 2",
	new_const,
	("`12",BOOL),
	mk_const("`12",BOOL))
	];
store_mt_results mt_run_fail [
	("new_const 6049 a",
	new_const,
	("1",BOOL),
	gen_fail_msg "new_const" 6049 ["1"]),
	("new_const 6049 b",
	new_const,
	("123",BOOL),
	gen_fail_msg "new_const" 6049 ["123"]),
	("new_const 6049 f",
	new_const,
	("`a",BOOL),
	gen_fail_msg "new_const" 6049 ["`a"]),
	("new_const 6049 d",
	new_const,
	("\"abc",BOOL),
	gen_fail_msg "new_const" 6049 ["\"abc"])
	];
=TEX
We can presume successful uses of $get\-\_thms$, $get\-\_axioms$, $get\-\_defns$, $get\_types$, $get\_consts$, $get\-\_parents$, $get\-\_children$,
$get\_theory\_names$
are all well tested by $print\_(all\_)theory$.
The remainder of their kin are tested as follows:
=SML
open_theory "yet_again";
val out_of_scope_thm = save_thm("not_in_scope",pp'Kernel.pp'asm_rule v1);
open_theory "yet_again";
=TEX
\subsection{Valid Theorems}
=SML
store_mt_results mt_run [
	("valid_thm 1",
	valid_thm,
	thm1,
	true),
	("valid_thm 2",
	valid_thm,
	thy_deleted_thm,
	false)
	];
=TEX
\subsection{Output of Theorems}
=SML
store_mt_results mt_run [
	("string_of_thm",
	string_of_thm,
	pB_thm,
	"p ⊢ p")];
store_mt_results mt_run_fail [
	("thm_fail",
	thm_fail "test" 6053,
	[pB_thm],
	gen_fail_msg "test" 6053 ["p ⊢ p"])];
store_mt_results (mt_runf (op =#)) [
	("dest_thm",
	dest_thm,
	pB_thm,
	([pB],pB))
	];
=TEX
\subsection{Some More Theory Access Functions}
=SML
store_mt_results (mt_runf (op =#)) [
	("get_thm",
	dest_thm o get_thm "next",
	"thm1",
	(h_thm1,c_thm1)),
	("get_defn",
	dest_thm o get_defn "yet_again",
	"So",
	([],mk_⇒(So,IsSo))),
	("get_axiom",
	dest_thm o get_axiom "yet_again",
	"etype_ax",
	(dest_thm etype_ax))
	];
=TEX
=SML
store_mt_results (mt_runf (op =#)) [
	("get_thm_dict",
	dest_thm o force_value o (fn n => oe_lookup n (get_thm_dict "next")),
	"thm1",
	(h_thm1,c_thm1)),
	("get_defn_dict",
	dest_thm o force_value o (fn n => oe_lookup n (get_defn_dict "yet_again")),
	"So",
	([],mk_⇒(So,IsSo))),
	("get_axiom_dict",
	dest_thm o force_value o (fn n => oe_lookup n (get_axiom_dict "yet_again")),
	"etype_ax",
	(dest_thm etype_ax))
	];
=TEX
=SML
open_theory "next";
store_mt_results mt_run_fail [
	("get_thm 12035",
	get_thm "rubbish",
	"thm1",
	gen_fail_msg "get_thm" 12035 ["rubbish"]),
	("get_thm 12006",
	get_thm "next",
	"rubbish",
	gen_fail_msg "get_thm" 12006 ["next","rubbish"]),
	("get_thm 12010",
	get_thm "yet_again",
	"not_in_scope",
	gen_fail_msg "get_thm" 12010 ["yet_again"])
	];
store_mt_results mt_run_fail [
	("get_defn 12035",
	get_defn "rubbish",
	"def1",
	gen_fail_msg "get_defn" 12035 ["rubbish"]),
	("get_defn 12004",
	get_defn "next",
	"rubbish",
	gen_fail_msg "get_defn" 12004 ["next","rubbish"]),
	("get_defn 12010",
	get_defn "yet_again",
	"not_in_scope",
	gen_fail_msg "get_defn" 12010 ["yet_again"])
	];
store_mt_results mt_run_fail [
	("get_axiom 12035",
	get_axiom "rubbish",
	"def1",
	gen_fail_msg "get_axiom" 12035 ["rubbish"]),
	("get_axiom 12005",
	get_axiom "next",
	"rubbish",
	gen_fail_msg "get_axiom" 12005 ["next","rubbish"]),
	("get_axiom 12010",
	get_axiom "yet_again",
	"not_in_scope",
	gen_fail_msg "get_axiom" 12010 ["yet_again"])
	];
=TEX
=SML
open_theory "yet_again";
store_mt_results mt_run [
	("get_ancestors 1",
	Sort.sort Sort.string_order o get_ancestors,
	"yet_again",
	Sort.sort Sort.string_order["another", "min", "next", "yet_again"]),
	("get_ancestors 2",
	get_ancestors,
	"min",
	["min"])
	];
store_mt_results mt_run_fail [
	("get_ancestors 12035",
	get_ancestors,
	"rubbish",
	gen_fail_msg "get_ancestors" 12035 ["rubbish"])
	];
store_mt_results mt_run [
	("is_theory_ancestor 1",
	is_theory_ancestor "min",
	"-",
	true),
	("is_theory_ancestor 2",
	is_theory_ancestor "min",
	"yet_again",
	true),
	("is_theory_ancestor 3",
	is_theory_ancestor "yet_again",
	"min",
	false),
	("is_theory_ancestor 4",
	is_theory_ancestor "-",
	"min",
	false),
	("is_theory_ancestor 5",
	is_theory_ancestor "yet_again",
	"yet_again",
	true)
	];
store_mt_results mt_run_fail [
	("is_theory_ancestor 12035 a",
	is_theory_ancestor "rubbish",
	"min",
	gen_fail_msg "is_theory_ancestor" 12035 ["rubbish"]),
	("is_theory_ancestor 12035 b",
	is_theory_ancestor "-",
	"rubbish",
	gen_fail_msg "is_theory_ancestor" 12035 ["rubbish"]),
	("is_theory_ancestor 12035 c",
	is_theory_ancestor "rubbish",
	"rubbish",
	gen_fail_msg "is_theory_ancestor" 12035 ["rubbish"])
	];
store_mt_results mt_run [
	("get_descendants",
	Sort.sort Sort.string_order o get_descendants,
	"next",
	Sort.sort Sort.string_order["yet_again", "next"])
	];
store_mt_results mt_run_fail [
	("get_descendants 12035",
	get_descendants,
	 "rubbish",
	gen_fail_msg "get_descendants" 12035 ["rubbish"])];
store_mt_results mt_run_fail [
	("get_parents 12035",
	get_parents,
	 "rubbish",
	gen_fail_msg "get_parents" 12035 ["rubbish"])];
store_mt_results mt_run_fail [
	("get_children 12035",
	get_children,
	 "rubbish",
	gen_fail_msg "get_children" 12035 ["rubbish"])];
store_mt_results mt_run_fail [
	("get_thms 12035",
	get_thms,
	 "rubbish",
	gen_fail_msg "get_thms" 12035 ["rubbish"])];
store_mt_results mt_run_fail [
	("get_thm_dict 12035",
	get_thm_dict,
	 "rubbish",
	gen_fail_msg "get_thm_dict" 12035 ["rubbish"])];
store_mt_results mt_run_fail [
	("get_axioms 12035",
	get_axioms,
	 "rubbish",
	gen_fail_msg "get_axioms" 12035 ["rubbish"])];
store_mt_results mt_run_fail [
	("get_axiom_dict 12035",
	get_axiom_dict,
	 "rubbish",
	gen_fail_msg "get_axiom_dict" 12035 ["rubbish"])];
store_mt_results mt_run_fail [
	("get_defns 12035",
	get_defns,
	 "rubbish",
	gen_fail_msg "get_defns" 12035 ["rubbish"])];
store_mt_results mt_run_fail [
	("get_defn_dict 12035",
	get_defn_dict,
	 "rubbish",
	gen_fail_msg "get_defn_dict" 12035 ["rubbish"])];
store_mt_results mt_run_fail [
	("get_consts 12035",
	get_consts,
	"rubbish",
	gen_fail_msg "get_consts" 12035 ["rubbish"])];
store_mt_results mt_run_fail [
	("get_types 12035",
	get_types,
	 "rubbish",
	gen_fail_msg "get_types" 12035 ["rubbish"])];
=TEX
Tests on hierarchies : do after all others, as things are made read only.
=SML
pp'Kernel.pp'freeze_hierarchy();
open_theory "yet_again";
store_mt_results mt_run [
	("get_current_theory_status 3",
	get_current_theory_status,
	(),
	TSAncestor)
	];
store_mt_results mt_run [
	("get_theory_status",
	get_theory_status,
	"next",
	TSAncestor)
	];
store_mt_results mt_run_fail [
	("set_user_datum 6071",
	set_user_datum,
	("testing1",UD_String ("a test",[])),
	gen_fail_msg "set_user_datum" 6071 ["yet_again"])
	];
store_mt_results mt_run_fail [
	("new_axiom 6071",
	new_axiom,
	(["Truth_axiom1"],mk_t),
	gen_fail_msg "new_axiom" 6071 ["yet_again"])
	];
store_mt_results mt_run_fail [
	("new_const 6071",
	new_const,
	("ForT1",BOOL),
	gen_fail_msg "new_const" 6071 ["yet_again"])
	];
store_mt_results mt_run_fail [
	("new_type 6071",
	new_type,
	("SOMETHING1",3),
	gen_fail_msg "new_type" 6071 ["yet_again"])
	];
store_mt_results mt_run_fail [
	("gen_new_spec 6071",
	eq_defn,
	(["True1"],"True1",mk_t),
	gen_fail_msg "gen_new_spec" 6071 ["yet_again"])
	];
store_mt_results mt_run_fail [
	("delete_const 6071",
	delete_const,
	mk_const("test_spec",BOOL),
	gen_fail_msg "delete_const" 6071 ["yet_again"])
	];
store_mt_results mt_run_fail [
	("delete_axiom 6071",
	delete_axiom,
	"so_isso_axiom",
	gen_fail_msg "delete_axiom" 6071 ["yet_again"])
	];
store_mt_results mt_run_fail [
	("delete_type 6071",
	delete_type,
	"ETYPE",
	gen_fail_msg "delete_type" 6071 ["yet_again"])
	];
store_mt_results mt_run_fail [
	("list_save_thm 6071",
	list_save_thm,
	(["Example1"],thm1),
	gen_fail_msg "list_save_thm" 6071 ["yet_again"])
	];
store_mt_results mt_run_fail [
	("save_thm 6071",
	save_thm,
	("Example1",thm1),
	gen_fail_msg "save_thm" 6071 ["yet_again"])
	];
store_mt_results mt_run_fail [
	("delete_thm 6071",
	delete_thm,
	"Example",
	gen_fail_msg "delete_thm" 6071 ["yet_again"])
	];
store_mt_results mt_run_fail [
	("delete_theory 6071",
	delete_theory,
	"another",
	gen_fail_msg "delete_theory" 6071 ["another"])
	];
store_mt_results mt_run_fail [
	("lock_theory 6071",
	lock_theory,
	"yet_again",
	gen_fail_msg "lock_theory" 6071 ["yet_again"])
	];
store_mt_results mt_run_fail [
	("new_parent 6071",
	new_parent,
	"another",
	gen_fail_msg "new_parent" 6071 ["yet_again"])
	];
store_mt_results mt_run_fail [
	("new_type_defn 6071",
	new_type_defn,
	(  ["ETYPE7"], "ETYPE7", ["'1"], etype_ax),
	gen_fail_msg "new_type_defn" 6071 ["yet_again"])
	];
store_mt_results mt_run_fail [
	("new_spec 6071",
	new_spec,
	(["So1","IsSo1"],2,so_isso_axiom),
	gen_fail_msg "new_spec" 6071 ["yet_again"])
	];
=TEX
Test for clashes in children theories for $new\_parent$:
=SML
open_theory "next";
new_theory "np_test1";
new_theory "np_test3";
open_theory "next";
new_theory "np_test2";
new_const("np_test",BOOL);
open_theory "next";
new_theory "np_test4";
new_type("np_test_t",0);
open_theory "np_test3";
new_const("np_test",BOOL);
new_type("np_test_t",0);
open_theory "np_test1";
store_mt_results mt_run_fail [
	("new_parent 6067 b",
	new_parent,
	"np_test2",
	gen_fail_msg "new_parent" 6067 ["np_test2"]),
	("new_parent 6067 c",
	new_parent,
	"np_test4",
	gen_fail_msg "new_parent" 6067 ["np_test4"])
	];
=TEX
=SML
diag_string"Test resetting of Kernel State Change functions";
diag_string "With";
new_const("KSC_test1",BOOL);
diag_string "Without";
before_tell_ksc ();
new_const("KSC_test2",BOOL);
=SML
diag_string"End of testing resetting of Kernel State Change functions";
=TEX
=TEX
\section{CHECKPOINTING}
=TEX
First we get the checkpoint failures out of the way:
=SML
val _ = kernel_interface_diagnostics true;
lock_theory"np_test3";
open_theory"np_test2";
new_theory"cp1";
new_theory"cp2";
=TEX
=SML
open_theory"cp2";
new_type("CP2a", 0);
val before_types = get_types"-";
new_const("CCC", ⓣCP2a⌝);
save_thm("thm1", refl_conv⌜np_test⌝);
set_user_datum("key", UD_Int(42, []));

val before_consts = get_consts"-";
val before_thms = get_thms"-";
open_theory "np_test2";
val before_descs = get_descendants"np_test2";
val cp1 = checkpoint "np_test2";
new_theory"cp4";
open_theory"cp2";
save_thm("thm2", refl_conv⌜np_test⌝);
new_type("CP2b", 0);
set_user_datum("key", UD_Int(99, []));
=TEX
=SML
rollback cp1;
open_theory "cp2";
val after_consts = get_consts"-";
val after_thms = get_thms"-";
val after_types = get_types"-";
val after_descs = get_descendants"np_test2";
store_mt_results
mt_run [
	("rollback 1",
	(fn _ => ()) o combine before_consts,
	after_consts,
	())
];

store_mt_results
mt_run [
	("rollback 2",
	(fn _ => ()) o combine before_thms,
	after_thms,
	())
];
store_mt_results
mt_run [
	("rollback 3",
	(fn _ => ()) o combine before_types,
	after_types,
	())
];
store_mt_results
mt_run [
	("rollback 4",
	(fn _ => ()) o combine before_descs,
	after_descs,
	())
];

store_mt_results
mt_run [
	("rollback 5",
	(fn (UD_Int (n, []))  => n | _ => 1000) o get_user_datum "-",
	"key",
	42)
];

open_theory"np_test2";
new_theory"cp4";
val cp2 = checkpoint "np_test2";
open_theory"np_test2";
delete_theory"cp4";
=TEX
Now roll back. There should be a comment 12017 since we have deleted cp2.
=SML
rollback cp2;
=TEX
Now for {\tt rollback1}, but first check that {\tt rollback} fails if
it would need to delete something from a theory with children.
=SML
new_theory"cp3";
new_theory"cp3a";
open_theory"cp3";
val cp3 = checkpoint "cp3";
new_const("XXX", BOOL);
store_mt_results
mt_run_fail [
	("rollback 6",
	rollback,
	cp3,
	gen_fail_msg "rollback" 12018 ["theory", "cp3a", "cp3"])
];
=TEX
{\tt rollback1} should do it:
=SML
rollback1 cp3;
store_mt_results
mt_run [
	("rollback 7",
	get_consts,
	"cp3",
	[])
];
=TEX
\section{KERNEL INFERENCE RULES}
The functional tests on the rules themselves is done in \cite{DS/FMU/IED/MDT007}.
We are just testing the ``On Kernel Inference'' functionality here.

=SML
val ki_count : int ref = ref 0;
val k1 = on_kernel_inference (fn _ => ki_count := !ki_count + 1);
refl_conv (mk_var("a", BOOL));
refl_conv (mk_var("a", BOOL));
=TEX
=SML
val ki_flag : bool ref = ref false;
val k2 = on_kernel_inference (fn _ => ki_flag := not(!ki_flag));
refl_conv (mk_var("a", BOOL));
mt_run [
	("delete_kernel_inference 1",
	!,
	ki_flag,
	true)
];
val _ = delete_kernel_inference_fun k2;
refl_conv (mk_var("a", BOOL));
mt_run [
	("delete_kernel_inference 2",
	!,
	ki_flag,
	true)
];
=TEX
=SML
refl_conv (mk_var("a", BOOL));
store_mt_results
mt_run [
	("on_kernel_inference 1",
	!,
	ki_count,
	5)
];
=TEX
=SML
val prki = pending_reset_kernel_interface();
val last_refl_conv : (TERM * THM) OPT ref = ref Nil;
on_kernel_inference (fn
		KIReflConv tm_thm => last_refl_conv:= Value tm_thm
	|	_ => ()
);
refl_conv (mk_var("a", BOOL));
store_mt_results
mt_run [
	("on_kernel_inference 2",
	fst o dest_var o fst o force_value o !,
	last_refl_conv,
	"a")
];
refl_conv (mk_var("abcd", BOOL));
store_mt_results
mt_run [
	("on_kernel_inference 3",
	fst o dest_var o fst o force_value o !,
	last_refl_conv,
	"abcd")
];
=TEX
Now reset:
=SML
prki();
refl_conv (mk_var("a", BOOL));
store_mt_results
mt_run [
	("on_kernel_inference 4",
	fst o dest_var o fst o force_value o !,
	last_refl_conv,
	"abcd")
];
=TEX
\subsection{End of Tests}
=SML
diag_string(summarize_mt_results());
=TEX
\section{UNTESTED ERROR MESSAGES}
\label{untested}
Error 6017 of $open\_theory$, concerning sealed theories,
as a full testing of sealing theories was carried out in \cite{DS/FMU/IED/MDT006}, and no sealing material occurs in
\cite{DS/FMU/IED/DTD012} bar this error message.

Errors 6013, 6014, 6015 and 6038 of various functions, concerning ill-formed theorems are not tested for all their occurrences: they are raised by the underlying functions,
and are fully tested in \cite{DS/FMU/IED/MDT006}.

Error 6042 of $duplicate\_theory$ is not tested as we
do not wish to use $pp'seal\_hierarchy$ in these tests.
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}
=IGN



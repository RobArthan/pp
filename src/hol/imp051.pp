=IGN
********************************************************************************
imp051.doc: this file is part of the PPHol system

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

\def\Title{Implementation of Proof Contexts}

\def\AbstractText{This document gives an implementation providing proof contexts.}

\def\Reference{DS/FMU/IED/IMP051}

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
%% LaTeX2e port: \TPPtitle{Implementation of Proof Contexts}
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP051}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.40 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2011/05/07 12:50:24 $ %
%% LaTeX2e port: }}  %% Mandatory field
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.Blackburn & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document gives an implementation providing proof contexts.}
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
\item [Issue 1.1 (1991/10/25)]
First draft version.
\item [Issue 1.2 (1991/10/30)]
Made default conversions $fail\_conv$.
Reacted to $NetTools$ being open.
\item [Issue 1.3 (1991/11/19)]
Moved to using abstract data types.
\item [Issue 1.4 (1991/11/19)]
Added $cs\_∃\_conv$ material.
\item [Issue 1.5 (1991/11/22)]
Added existence prover parameterisation.

\item[Issue 1.6 (1991/12/06), \FormatDate{92/01/20} ] Updated to use new fonts.
\item[Issue 1.7 (1992/01/20)]
Changes to reflect issue 1.12 of \cite{DS/FMU/IED/DTD051}.
\item [Issue 1.8 (1992/03/25) (1st April 1992)]
Changes required by CR0016.
\item [Issue 1.11 (1992/04/14) (13th April 1992)]
Changes due to CR0017.
\item [Issue 1.17 (1992/05/21) (15th April 1992)]
Change to $get\_stack\_pcs$, added $delete\_pc\_fields$.
\item [Issue 1.18 (1992/05/26) (8th May 1992)]
Reorganised after RBJ comments.
\item [Issue 1.19 (1992/05/26),1.20 (1992/05/27) (12th May 1992)]
Changed some names.
\item [Issue 1.18 (1992/05/26),1.19 (1992/05/26) (26th May 1992)]
Renamings from version 1.5 of DS/FMU/IED/WRK038.
\item [Issue 1.20 (1992/05/27) (28th May 1992)]
Corrected merging of $pr\_conv$ and $pr\_tac$,
added $prove\-\_tac$ and $prove\-\_∃\-\_tac$.
\item [Issue 1.21 (1992/05/28) (29th May 1992)]
And then took out $prove\_tac$, $prove\_∃\_tac$.
\item [Issue 1.23 (1992/06/04) (3rd June 1992)]
Improved design of $add\_?\_thms$.
\item [Issue 1.24 (1992/06/29) (29th June 1992)]
Added $PCS\_MERGE\_T$, etc.
\item [Issue 1.25 (1992/08/13) (13th August 1992)]
Corrected error handling for interrupts.
\item  [Issue 1.26 (1992/12/01) (30th November 1992)]
Added ``additional nets'' field to proof contexts.
\item  [Issue 1.27 (1992/12/14) (14th December 1992)]
Added $pending\_reset\_pc\_stack/evaluators$.
\item  [Issue 1.27 (1992/12/14) (9th February 1993)]
Corrected $pending\_reset\_pc\_stack$.
\item [Issue 1.28 (1993/02/09)-1.30 (1993/02/22) (22nd February 1993)]
$force\_delete\_theory$ (and trial runs for it).
\item[Issue 1.31 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.32 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.33 (2005/04/18)] Stopped it calling kernel inference rules directly.
\item[Issue 1.34 (2005/12/14)] Allowed for kernel interface and symbol table reform.
\item[Issue 1.35 (2005/12/16)] The prefix for private interfaces is now $pp'$ rather than $icl'$.
\item[Issue 1.36 (2011/02/06)] Added matching modus ponens field and facilities for extending the current proof context.
\item[Issue 1.37 (2011/02/19)] $pr\_conv$ and $pr\_tac$ are now optional
fields and these and $mmp\_rule$ are now handled uniformly when proof contexts
are merged, by taking the merge of a list of optional values to be the last non-nil value. Rationalised merging and extending operations to exploit this.
\item[Issue 1.38 (2011/05/05)] Fixed handling of the names field when merging into a proof
context stored in the database.
\item[Issues 1.39 (2011/05/05)--1.41 (2011/07/11)] Added equation matcher field and function for building
equation contexts that do higher-order matching.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
As detailed design.
\section{GENERAL}
\subsection{Scope}
This document contains the implementation for material
whose detailed design is given in \cite{DS/FMU/IED/DTD051}.
It is module tested in \cite{DS/FMU/IED/MDT051}
\subsection{Introduction}
\subsubsection{Purpose and Background}
A proof context is a setting of various configurable
parameters of proof tools to support a particular mode of proof.
For instance, both $rewrite\_tac$ and $strip\_tac$
are configurable proof tools.
In particular, proof contexts will be later made available,
through the tools supplied here,
that supply a good environment to reason about Z,
or within a particular theory (e.g. set theory),
and alter the default environment.

\subsubsection{Dependencies}
This document is dependent on \cite{DS/FMU/IED/DTD051}.
\subsubsection{Deficiencies}
None known.
\subsubsection{Possible Enhancements}
As detailed design.
\section{PREAMBLE}
=SML
structure ⦏ProofContext⦎ : ProofContext = struct
=SML
val lthy = get_current_theory_name();

val dummy = open_theory "min"
	handle (Fail _) => open_theory "basic_hol";
=TEX
\section{UTILITIES}
=SML
val ⦏thm_union⦎ : THM list -> THM list -> THM list =
	union (op =|-);
=TEX
As $roverwrite$ but prefix, and putting new entries at the head:
=SML
fun ⦏roverwrite1⦎ lst (a,b) = (
let fun aux [] = fail "" 0 []
| aux ((x,y) :: rest) = (
	if b = y
	then ((a,b) :: rest)
	else ((x,y) :: aux rest)
);
in
	aux lst
	handle (Fail _) =>
	((a,b) :: lst)
end);
=TEX
=SML
fun ⦏list_roverwrite1⦎ (abs : ('a * ''b) list) (xys : ('a * ''b) list) : ('a * ''b) list = (
	fold (fn (l1, l2) => roverwrite1 l2 l1) abs xys
);
=IGN
list_roverwrite1 [(1,"1"),(3,"3"),(4,"3"),(5,"5")] [(2,"2"),(0,"5"),(4,"4")];
=TEX
\section{EQUATIONAL CONTEXTS}
An equational context is a list of conversions,
each paired with term index. It represents a statement of
how to
rewrite a term to result in an equational theorem,
guided by the outermost form of the term to be rewritten,
which is matched against the term index of each conversion.
=SML
type ⦏EQN_CXT⦎ = (TERM * CONV) list;
=TEX
In the following, if $simple\_eq\_match\_conv1$
is successfully applied, then the term destruction
must be successful.
=SML
fun ⦏thm_eqn_cxt⦎ (thm : THM) : TERM * CONV = (
let	val cnv =  simple_eq_match_conv1 thm
		handle complaint =>
		pass_on complaint "simple_eq_match_conv1" "thm_eqn_cxt";
	val lhs = fst(dest_eq(snd(strip_∀ (concl thm))));
in
	(lhs, cnv)
end);
=TEX
=SML
fun ⦏ho_template⦎ (tm : TERM) : TERM = (
	let	fun aux t = (
			let	val _ = dest_app t;
				val (f, args) = strip_app t;
			in	if	is_var f
				then	mk_var(fst(dest_var f), type_of t)
				else	list_mk_app (aux f, map aux args)
			end	handle Fail _ => (
				let	val (v, b) = dest_simple_λ t;
				in	mk_simple_λ(v, aux b)
				end	handle Fail _ => t
			)
		);
	in	aux tm
	end
);
=TEX
=SML
fun ⦏simple_ho_thm_eqn_cxt⦎ (thm : THM) : TERM * CONV = (
	let	val cnv =  simple_ho_eq_match_conv1 thm
			handle complaint =>
			pass_on complaint "simple_ho_eq_match_conv1" "simple_ho_thm_eqn_cxt";
		val lhs = fst(dest_eq(snd(strip_∀ (concl thm))));
		val lhs' = ho_template lhs;
	in
		(lhs', cnv)
	end
);
=TEX
=SML
local
	fun FIRST_CHANGED_C (cv :: rest) tm =
		(CHANGED_C cv ORELSE_C FIRST_CHANGED_C rest) tm
	| FIRST_CHANGED_C [] tm = term_fail "eqn_cxt_conv" 51005 [tm];
in
fun ⦏eqn_cxt_conv⦎ (ec : EQN_CXT) : CONV = (
let	val net = make_net ec;
in
	(fn tm => FIRST_CHANGED_C(net_lookup net tm)tm
	)
end);
end;
=TEX

\section{TYPES}
The following is the object stored in the stack and database of proof contexts.
=SML
type ⦏PROOF_CONTEXT⦎ = {
	rw_eqn_cxt: (EQN_CXT * string)list,
	rw_canons: ((THM -> THM list) list * string)list,
				(* CANON list * ... *)
	rw_eqm_rule : (THM -> TERM * CONV) OPT,
	st_eqn_cxt: (EQN_CXT * string) list,
	sc_eqn_cxt: (EQN_CXT * string) list,
	nd_entries: (((TERM * (TERM -> THM))list * string)list * string) list,
	cs_∃_convs: (CONV list * string) list,
	∃_cd_thms: THM list,
	∃_vs_thms: (string * (TERM list * THM))list,
	pr_tac : (THM list -> TACTIC) OPT,
	pr_conv : (THM list -> CONV) OPT,
	mmp_rule : (THM -> THM -> THM) OPT,
(*
=TEX
Now the evaluated parts:
=SML
*)
	rw_net: CONV NET,
	rw_canon: THM -> THM list,	(* CANON *)
	st_conv: CONV,
	sc_conv: CONV,
	nd_nets: ((TERM -> THM)NET * string)list,
	cs_∃_conv: TERM -> THM,
	∃_ad_cd_thms:  (TERM list * int list * TYPE * (TERM list)list * THM) list,
	∃_ad_vs_thms:  (string * (TERM list * THM))list,
(*
=TEX
And finally the committal data
=SML
*)
	names : string list,
	theoryname : string,
	a_valid_thm : THM,
	committed : bool
	};
=TEX
$a\_valid\_thm$ is intended to be set to a theorem generated
at the creation of the proof context, and if that is not valid (by $valid\_thm$) then the proof context itself is considered ``stale''.
\section{DATA STRUCTURES AND ABSTRACT DATA TYPES}
\subsection{Proof Context ``initial''}
=SML
fun ⦏empty_pc⦎ (committed : bool)(names : string list): PROOF_CONTEXT = {
	rw_eqn_cxt = [],
	rw_canons = [],
	rw_eqm_rule = Nil,
	st_eqn_cxt = [],
	sc_eqn_cxt = [],
	nd_entries = [],
	cs_∃_convs = [],
	∃_cd_thms = [],
	∃_vs_thms = [],
	pr_tac = Nil,
	pr_conv = Nil,
	mmp_rule = Nil,
(*
=TEX
Now the evaluated parts:
=SML
*)
	rw_net = empty_net,
	rw_canon = (fn thm => [thm]),	(* CANON *)
	st_conv = fail_conv,
	sc_conv = fail_conv,
	nd_nets = [],
	cs_∃_conv = (fn _ => fail "pp'set_eval_ad_cs_∃_convs" 51015 []),
	∃_ad_cd_thms = [],
	∃_ad_vs_thms = [],
(*
=TEX
And finally the committal data
=SML
*)
	names = names,
	theoryname = get_current_theory_name(),
	a_valid_thm = refl_conv (mk_var("a",BOOL)),
	committed = committed
	};
=TEX
Now the initial proof context (local only):
=SML
val ⦏initial_pc⦎ : PROOF_CONTEXT = empty_pc true ["initial"];
=TEX
\subsection{Database of Proof Contexts}
Unsurprisingly, this is a simple dictionary, stored in an assignable variable.
=SML
local
	val pc_db : (PROOF_CONTEXT S_DICT) ref = ref (
		s_enter "initial" initial_pc initial_s_dict);
in
(*
=TEX
The pending resetter stores the current state and returns a function that
will return the database to that state.
=SML
*)
fun ⦏pending_reset_pc_database⦎ () : unit -> unit = (
let val temp_db = (!pc_db)
in
    (fn () => pc_db := temp_db)
end);
(*
=TEX
Local declarations:
=SML
*)
fun ⦏get_pc⦎ (caller: string) (key : string) : PROOF_CONTEXT = (
	case s_lookup key (!pc_db) of
	Value (pc as {a_valid_thm = a_valid_thm,theoryname=theoryname,...}) => (
		if valid_thm a_valid_thm
		then pc
		else fail caller 51014 [(fn () => key),(fn () => theoryname)]
	) | Nil => fail caller 51010 [fn () => key]
);

fun ⦏extend_pc⦎ (caller: string) (key : string) (pc : PROOF_CONTEXT) : unit = ((
	pc_db := s_extend key pc (!pc_db);
	())
	handle (Fail _) =>
	fail caller 51011 [fn () => key]
);

fun ⦏change_pc⦎ (caller: string) (key : string)
	(pcf : PROOF_CONTEXT -> PROOF_CONTEXT) : unit = (
let	val opc as {committed = committed,...} = get_pc caller key;
	val sideeeffect = if committed
		then fail caller 51016 [fn () => key]
		else ();
in
	(pc_db := s_enter key (pcf opc) (!pc_db);
	())
end);
(*
=TEX
Seen in signature:
=SML
*)
local
	fun detail (key,({theoryname = theoryname,
		a_valid_thm = a_valid_thm, ...}:PROOF_CONTEXT)) = (
		if valid_thm a_valid_thm
		then (key,theoryname)
		else (key,get_error_message 51018 [theoryname])
	);
in
fun ⦏get_pcs⦎ () : (string * string)list = (
	map detail (!pc_db)
);
end;
(*
=TEX
Seen in signature:
=SML
*)
fun ⦏delete_pc⦎ (key : string) :unit = (
	if key = "initial"
	then fail "delete_pc" 51012 []
	else (
	case s_lookup key (!pc_db) of
	Value _ => (
		pc_db := s_delete key (!pc_db);
		()
	) | Nil => fail "delete_pc" 51010 [fn () => key])
);
(*
=TEX
Seen in signature:
=SML
*)
fun ⦏new_pc⦎ (new: string) : unit = (
	extend_pc "new_pc" new (empty_pc false [new])
);
(*
=TEX
End of database functions
=SML
*)
end;
=TEX
\subsection{Proof Context Stack}
The current proof context is not actually on the proof context
stack, but separate.
=SML
local
	val pc_stack : (PROOF_CONTEXT list) ref = ref [];
in
fun push_pc_stack pc = (pc_stack := (pc :: (!pc_stack));());
fun pop_pc_stack caller = (
	case (!pc_stack) of
	[] => fail caller 51001 []
	| (a :: x) => (pc_stack := x; a)
);
(*
=TEX
\subsection{Current Proof Context}
=SML
*)
local
	val current_pc : PROOF_CONTEXT ref = ref initial_pc;
in
(*
=TEX
Set the current proof context:
=SML
*)
fun set_current_pc (pc : PROOF_CONTEXT) : unit = (
	current_pc := pc;
	()
);
(*
=TEX
Access the current proof context:
=SML
*)
fun ⦏current_ad_rw_net⦎ ():CONV NET =
	if valid_thm (#a_valid_thm (!current_pc))
	then (#rw_net (!current_pc))
	else fail "current_ad_rw_net" 51021 [fn () => (#theoryname (!current_pc))];
fun ⦏current_ad_rw_canon⦎ () : THM -> THM list =
	if valid_thm (#a_valid_thm (!current_pc))
	then (#rw_canon (!current_pc))
	else fail "current_ad_rw_canon" 51021 [fn () => (#theoryname (!current_pc))];
fun ⦏current_ad_st_conv⦎ ():CONV =
	if valid_thm (#a_valid_thm (!current_pc))
	then (#st_conv (!current_pc))
	else fail "current_ad_st_conv" 51021 [fn () => (#theoryname (!current_pc))];
fun ⦏current_ad_nd_net⦎ (dict_key:string):(TERM -> THM) NET =
	if valid_thm (#a_valid_thm (!current_pc))
	then (rassoc4 (#nd_nets (!current_pc)) empty_net dict_key)
	else fail "current_ad_nd_net" 51021 [fn () => (#theoryname (!current_pc))];
fun ⦏current_ad_sc_conv⦎ ():CONV =
	if valid_thm (#a_valid_thm (!current_pc))
	then (#sc_conv (!current_pc))
	else fail "current_ad_sc_conv" 51021 [fn () => (#theoryname (!current_pc))];
fun ⦏current_ad_cs_∃_conv⦎ ():CONV =
	if valid_thm (#a_valid_thm (!current_pc))
	then (#cs_∃_conv (!current_pc))
	else fail "current_ad_cs_∃_conv" 51021 [fn () => (#theoryname (!current_pc))];
fun ⦏current_ad_∃_cd_thms⦎ ()
	: (TERM list * int list * TYPE * (TERM list)list * THM) list
	=
	if valid_thm (#a_valid_thm (!current_pc))
	then (#∃_ad_cd_thms (!current_pc))
	else fail "current_ad_∃_cd_thms" 51021 [fn () => (#theoryname (!current_pc))];
fun ⦏current_ad_∃_vs_thms⦎ ():(string * (TERM list * THM)) list
	=
	if valid_thm (#a_valid_thm (!current_pc))
	then (#∃_ad_vs_thms (!current_pc))
	else fail "current_ad_∃_vs_thms" 51021 [fn () => (#theoryname (!current_pc))];
fun ⦏current_ad_pr_tac⦎ () : (THM list -> TACTIC) OPT
	=
	if valid_thm (#a_valid_thm (!current_pc))
	then (#pr_tac (!current_pc))
	else fail "current_ad_pr_tac" 51021 [fn () => (#theoryname (!current_pc))];
fun ⦏current_ad_pr_conv⦎ () : (THM list -> CONV) OPT
	=
	if valid_thm (#a_valid_thm (!current_pc))
	then (#pr_conv (!current_pc))
	else fail "current_ad_pr_conv" 51021 [fn () => (#theoryname (!current_pc))];
fun ⦏current_ad_mmp_rule⦎ (): (THM -> THM -> THM) OPT =
	if valid_thm (#a_valid_thm (!current_pc))
	then (#mmp_rule (!current_pc))
	else fail "current_ad_mmp_rule" 51021 [fn () => (#theoryname (!current_pc))];
fun ⦏current_ad_rw_eqm_rule⦎ (): (THM -> TERM * CONV) OPT =
	if valid_thm (#a_valid_thm (!current_pc))
	then (#rw_eqm_rule (!current_pc))
	else fail "current_ad_rw_eqm_rule" 51021 [fn () => (#theoryname (!current_pc))];

fun ⦏get_current_pc⦎ () : (string list * string) = (
	if valid_thm (#a_valid_thm (!current_pc))
	then ((#names (!current_pc)),(#theoryname (!current_pc)))
	else ((#names (!current_pc)),get_error_message 51018 [(#theoryname (!current_pc))])
);

fun ⦏lget_current_pc⦎ () = (!current_pc);
(*
=TEX
=SML
*)
fun ⦏pending_reset_pc_stack⦎ () : unit -> unit = (
let	val temp_stack = (!pc_stack);
	val temp_current_pc = (!current_pc);
in
	(fn () => (pc_stack := temp_stack; set_current_pc temp_current_pc))
end);
(*
=TEX
End of current proof context stuff:
=SML
*)
end; (* current proof context *)
(*
=TEX
=SML
*)
local
	fun detail (({theoryname = theoryname,
		a_valid_thm = a_valid_thm, names = names, ...}:PROOF_CONTEXT)) = (
		if valid_thm a_valid_thm
		then (names,theoryname)
		else (names,get_error_message 51018 [theoryname])
	);
in
fun ⦏get_stack_pcs⦎ () : (string list * string)list = (
	get_current_pc () ::
	map detail (!pc_stack)
);
end;
end; (* of local pc_stack *)
=TEX
\subsection{Evaluation Functions}
A default evaluator for additional nets:
=SML
fun ⦏basic_eval_nd_net⦎ (dict_key:string)
	(source : (TERM * (TERM ->  THM)) list):(TERM ->  THM) NET = (
	make_net source
);
=TEX
=SML
local
	fun aux nm [] = []
	| aux nm (a :: x) = rassoc4 a [] nm @ aux nm x;
in
fun ⦏use_nd_eval⦎ (do_entry: string -> (TERM * (TERM ->  THM)) list -> (TERM ->  THM) NET)
	(entries: (((TERM * (TERM -> THM))list * string)list * string) list)
	: ((TERM ->  THM) NET * string) list = (
let 	val strip_pc_names = map fst entries;
	val dict_names = list_cup (map (map snd) strip_pc_names);
	val dicts = map (fn n => (do_entry n (aux n strip_pc_names), n)) dict_names;
in
	dicts
end);
end;
=TEX
	
We cannot express $eval\_ad\_rw\_canon$ properly yet.
=SML
local
val eval_ad_rw_net : (EQN_CXT -> CONV NET) ref = ref make_net;
val eval_ad_rw_canon : ((THM -> THM list) list -> (THM -> THM list)) ref =
	ref (fn _ => fn thm => [thm]);
val eval_ad_st_conv : (EQN_CXT -> CONV) ref = ref eqn_cxt_conv;
val eval_ad_sc_conv : (EQN_CXT -> CONV) ref = ref eqn_cxt_conv;

local
	fun try_all [] = (fn tm => fail "current_ad_cs_∃_conv" 51015 [])
	| try_all (afun :: []) = afun
	| try_all (afun :: rest) = afun AND_OR_C (try_all rest) ;
in
val eval_ad_cs_∃_convs : (CONV list -> CONV) ref = ref (try_all o rev);
end;
	
val eval_ad_∃_ad_cd_thms : (THM list ->
	(TERM list * int list * TYPE * (TERM list)list * THM) list) ref =
	ref (fn _ => []);
val eval_ad_∃_ad_vs_thms : ((string * (TERM list * THM)) list ->
	(string * (TERM list * THM)) list) ref = ref Combinators.I;
val eval_ad_nd_net :(string -> (TERM * (TERM ->  THM)) list ->
		(TERM ->  THM) NET) ref =
	ref basic_eval_nd_net;
in
fun ⦏pp'set_eval_ad_rw_net⦎ (f:(EQN_CXT -> CONV NET)) : unit =
	(eval_ad_rw_net := f; ());
fun ⦏pp'set_eval_ad_rw_canon⦎ (f:((THM -> THM list) list ->
	(THM -> THM list))) : unit =
	(eval_ad_rw_canon := f; ());
fun ⦏pp'set_eval_ad_st_conv⦎ (f:(EQN_CXT -> CONV)) : unit =
	(eval_ad_st_conv := f; ());
fun ⦏pp'set_eval_ad_sc_conv⦎ (f:(EQN_CXT -> CONV)) : unit =
	(eval_ad_sc_conv := f; ());
fun ⦏pp'set_eval_ad_cs_∃_convs⦎ (f:(CONV list -> CONV)) =
	(eval_ad_cs_∃_convs := f; ());
fun ⦏pp'set_eval_ad_∃_cd_thms⦎ (f:(THM list ->
	(TERM list * int list * TYPE * (TERM list)list * THM) list)) =
	(eval_ad_∃_ad_cd_thms := f; ());
fun ⦏pp'set_eval_ad_∃_vs_thms⦎ (f:((string * (TERM list * THM)) list ->
	(string * (TERM list * THM)) list)) =
	(eval_ad_∃_ad_vs_thms := f; ());
fun ⦏pp'set_eval_ad_nd_net⦎ (f:(string -> (TERM * (TERM ->  THM)) list ->
		(TERM ->  THM) NET)) =
	(eval_ad_nd_net := f; ());
(*
=TEX
Now a method of saving all the evaluators:
=SML
*)
fun ⦏pending_reset_pc_evaluators⦎ () : unit -> unit =(
let	val e1 = (!eval_ad_rw_net);
	val e2 = (!eval_ad_rw_canon);
	val e3 = (!eval_ad_st_conv);
	val e4 = (!eval_ad_sc_conv);
	val e5 = (!eval_ad_cs_∃_convs);
	val e6 = (!eval_ad_∃_ad_cd_thms);
	val e7 = (!eval_ad_∃_ad_vs_thms);
	val e8 = (!eval_ad_nd_net);
in
	fn () => (
	eval_ad_rw_net := e1;
	eval_ad_rw_canon := e2;
	eval_ad_st_conv := e3;
	eval_ad_sc_conv := e4;
	eval_ad_cs_∃_convs := e5;
	eval_ad_∃_ad_cd_thms := e6;
	eval_ad_∃_ad_vs_thms := e7;
	eval_ad_nd_net := e8;
	()
	)
end);
(*
=TEX
Now the method of evaluating a proof context:
=SML
*)
fun ⦏evaluate_proof_context⦎ (
	{
	rw_eqn_cxt = rw_eqn_cxt, rw_canons = rw_canons, rw_eqm_rule = rw_eqm_rule,
	st_eqn_cxt = st_eqn_cxt, sc_eqn_cxt = sc_eqn_cxt,
	nd_entries=nd_entries,nd_nets=nd_nets,
	cs_∃_convs = cs_∃_convs, ∃_cd_thms = ∃_cd_thms,
	∃_vs_thms = ∃_vs_thms, pr_tac = pr_tac, pr_conv = pr_conv,
	mmp_rule = mmp_rule,
	rw_net = rw_net,
	rw_canon = rw_canon, st_conv = st_conv,
	sc_conv = sc_conv, cs_∃_conv = cs_∃_conv,
	∃_ad_cd_thms = ∃_ad_cd_thms, ∃_ad_vs_thms = ∃_ad_vs_thms,
	names = names, theoryname = theoryname,
	a_valid_thm = a_valid_thm, committed = committed}
	: PROOF_CONTEXT) : PROOF_CONTEXT =
	{
	rw_eqn_cxt = rw_eqn_cxt,
	rw_canons = rw_canons,
	rw_eqm_rule = rw_eqm_rule,
	st_eqn_cxt = st_eqn_cxt,
	sc_eqn_cxt = sc_eqn_cxt,
	nd_entries=nd_entries,
	cs_∃_convs = cs_∃_convs,
	∃_cd_thms = ∃_cd_thms,
	∃_vs_thms = ∃_vs_thms,
	pr_tac = pr_tac,
	pr_conv = pr_conv,
	mmp_rule = mmp_rule,
	rw_net = (!eval_ad_rw_net) (flat(map fst rw_eqn_cxt)),
	rw_canon = (!eval_ad_rw_canon) (flat(map fst rw_canons)),
	st_conv = (!eval_ad_st_conv) (flat(map fst st_eqn_cxt)),
	sc_conv = (!eval_ad_sc_conv) (flat(map fst sc_eqn_cxt)),
	cs_∃_conv = (!eval_ad_cs_∃_convs) (flat(map fst cs_∃_convs)),
	∃_ad_cd_thms = (!eval_ad_∃_ad_cd_thms) ∃_cd_thms,
	∃_ad_vs_thms  = (!eval_ad_∃_ad_vs_thms) ∃_vs_thms,
	nd_nets = use_nd_eval (!eval_ad_nd_net) nd_entries,
	names = names,
	theoryname = theoryname,
	a_valid_thm = a_valid_thm,
	committed = committed};
(*
=TEX
End of evaluating things.
=SML
*)
end;
=TEX
\section{OTHER FUNCTIONS}
\subsection{Setting and Getting User Data}
\subsubsection{Rewriting: Equations Context}
=SML
fun ⦏set_rw_eqn_cxt⦎ (ec:EQN_CXT) (key:string) : unit =  (
change_pc "set_rw_eqn_cxt" key
(fn
	{
	rw_eqn_cxt = rw_eqn_cxt, rw_canons = rw_canons,
	rw_eqm_rule = rw_eqm_rule,
	st_eqn_cxt = st_eqn_cxt, sc_eqn_cxt = sc_eqn_cxt,
	cs_∃_convs = cs_∃_convs, ∃_cd_thms = ∃_cd_thms,
	∃_vs_thms = ∃_vs_thms,
	nd_entries=nd_entries,nd_nets=nd_nets,
	pr_conv = pr_conv, pr_tac = pr_tac, mmp_rule = mmp_rule,
	rw_net = rw_net,
	rw_canon = rw_canon, st_conv = st_conv,
	sc_conv = sc_conv, cs_∃_conv = cs_∃_conv,
	∃_ad_cd_thms = ∃_ad_cd_thms, ∃_ad_vs_thms  = ∃_ad_vs_thms,
	names = names, theoryname = theoryname,
	a_valid_thm = a_valid_thm, committed = committed}
 =>
	{
	rw_eqn_cxt = roverwrite1 rw_eqn_cxt (ec,key), rw_canons = rw_canons,
	rw_eqm_rule = rw_eqm_rule,
	st_eqn_cxt = st_eqn_cxt, sc_eqn_cxt = sc_eqn_cxt,
	cs_∃_convs = cs_∃_convs, ∃_cd_thms = ∃_cd_thms,
	∃_vs_thms = ∃_vs_thms,
	nd_entries=nd_entries,nd_nets=nd_nets,	
	pr_conv = pr_conv, pr_tac = pr_tac, mmp_rule = mmp_rule,
	rw_net = rw_net,
	rw_canon = rw_canon, st_conv = st_conv,
	sc_conv = sc_conv, cs_∃_conv = cs_∃_conv,
	∃_ad_cd_thms = ∃_ad_cd_thms, ∃_ad_vs_thms  = ∃_ad_vs_thms,
	names = names, theoryname = theoryname,
	a_valid_thm = a_valid_thm, committed = committed})
);
fun ⦏get_rw_eqn_cxt⦎ (key:string) : (EQN_CXT * string) list = (
	#rw_eqn_cxt (get_pc "get_rw_eqn_cxt" key)
);
=TEX
In adding the theorems we use the canonicalisation and equation
matcher from the current proof context.
=SML
fun ⦏add_rw_thms⦎ (thms:THM list) (key:string) : unit =  (
change_pc "add_rw_thms" key
((fn
	{
	rw_eqn_cxt = rw_eqn_cxt, rw_canons = rw_canons,
	rw_eqm_rule = rw_eqm_rule,
	st_eqn_cxt = st_eqn_cxt, sc_eqn_cxt = sc_eqn_cxt,
	cs_∃_convs = cs_∃_convs, ∃_cd_thms = ∃_cd_thms,
	∃_vs_thms = ∃_vs_thms,
	nd_entries=nd_entries,nd_nets=nd_nets,
	pr_conv = pr_conv, pr_tac = pr_tac, mmp_rule = mmp_rule,
	rw_net = rw_net,
	rw_canon = rw_canon, st_conv = st_conv,
	sc_conv = sc_conv, cs_∃_conv = cs_∃_conv,
	∃_ad_cd_thms = ∃_ad_cd_thms, ∃_ad_vs_thms  = ∃_ad_vs_thms,
	names = names, theoryname = theoryname,
	a_valid_thm = a_valid_thm, committed = committed}:PROOF_CONTEXT
 =>
	let	val tf = case current_ad_rw_eqm_rule() of
				Nil => thm_eqn_cxt
			|	Value tf => tf;
		val cthms = map tf(flat (map (current_ad_rw_canon()) thms));
	in
	{
	rw_eqn_cxt = (case rassoc5 rw_eqn_cxt key of
		Value x => roverwrite1 rw_eqn_cxt ((cthms @ x),key)
		| Nil =>  ((cthms, key) :: rw_eqn_cxt)),
	rw_canons = rw_canons,
	rw_eqm_rule = rw_eqm_rule,
	st_eqn_cxt = st_eqn_cxt, sc_eqn_cxt = sc_eqn_cxt,
	cs_∃_convs = cs_∃_convs, ∃_cd_thms = ∃_cd_thms,
	∃_vs_thms = ∃_vs_thms,
	nd_entries=nd_entries,nd_nets=nd_nets,
	pr_conv = pr_conv, pr_tac = pr_tac, mmp_rule = mmp_rule,
	rw_net = rw_net,
	rw_canon = rw_canon, st_conv = st_conv,
	sc_conv = sc_conv, cs_∃_conv = cs_∃_conv,
	∃_ad_cd_thms = ∃_ad_cd_thms, ∃_ad_vs_thms  = ∃_ad_vs_thms,
	names = names, theoryname = theoryname,
	a_valid_thm = a_valid_thm, committed = committed}
	end)
o
evaluate_proof_context)
);
=TEX
\subsubsection{Rewriting: Canonicalisation}
=SML
fun ⦏set_rw_canons⦎ (can: (THM -> THM list) list) (key:string) : unit =  (
change_pc "set_rw_canons" key
(fn
	{
	rw_eqn_cxt = rw_eqn_cxt, rw_canons = rw_canons,
	rw_eqm_rule = rw_eqm_rule,
	st_eqn_cxt = st_eqn_cxt, sc_eqn_cxt = sc_eqn_cxt,
	cs_∃_convs = cs_∃_convs, ∃_cd_thms = ∃_cd_thms,
	∃_vs_thms = ∃_vs_thms,
	nd_entries=nd_entries,nd_nets=nd_nets,
	pr_conv = pr_conv, pr_tac = pr_tac, mmp_rule = mmp_rule,
	rw_net = rw_net,
	rw_canon = rw_canon, st_conv = st_conv,
	sc_conv = sc_conv, cs_∃_conv = cs_∃_conv,
	∃_ad_cd_thms = ∃_ad_cd_thms, ∃_ad_vs_thms  = ∃_ad_vs_thms,
	names = names, theoryname = theoryname,
	a_valid_thm = a_valid_thm, committed = committed}
 =>
	{
	rw_eqn_cxt = rw_eqn_cxt, rw_canons = roverwrite1 rw_canons (can,key),
	rw_eqm_rule = rw_eqm_rule,
	st_eqn_cxt = st_eqn_cxt, sc_eqn_cxt = sc_eqn_cxt,
	cs_∃_convs = cs_∃_convs, ∃_cd_thms = ∃_cd_thms,
	∃_vs_thms = ∃_vs_thms,
	nd_entries=nd_entries,nd_nets=nd_nets,
	pr_conv = pr_conv, pr_tac = pr_tac, mmp_rule = mmp_rule,
	rw_net = rw_net,
	rw_canon = rw_canon, st_conv = st_conv,
	sc_conv = sc_conv, cs_∃_conv = cs_∃_conv,
	∃_ad_cd_thms = ∃_ad_cd_thms, ∃_ad_vs_thms  = ∃_ad_vs_thms,
	names = names, theoryname = theoryname,
	a_valid_thm = a_valid_thm, committed = committed})
);
fun ⦏get_rw_canons⦎ (key:string) : ((THM -> THM list) list * string) list = (
	#rw_canons (get_pc "get_rw_canons" key)
);
=TEX
=TEX
\subsubsection{Rewriting: Equation Preprocessing Function}
=SML
fun ⦏set_rw_eqm_rule⦎ (eqm_rule : THM -> TERM * CONV) (key:string) : unit =  (
change_pc "set_rw_eqm_rule" key
(fn
	{
	rw_eqn_cxt = rw_eqn_cxt, rw_canons = rw_canons,
	rw_eqm_rule = rw_eqm_rule,
	st_eqn_cxt = st_eqn_cxt, sc_eqn_cxt = sc_eqn_cxt,
	cs_∃_convs = cs_∃_convs, ∃_cd_thms = ∃_cd_thms,
	∃_vs_thms = ∃_vs_thms,
	nd_entries=nd_entries,nd_nets=nd_nets,
	pr_conv = pr_conv, pr_tac = pr_tac, mmp_rule = mmp_rule,
	rw_net = rw_net,
	rw_canon = rw_canon, st_conv = st_conv,
	sc_conv = sc_conv, cs_∃_conv = cs_∃_conv,
	∃_ad_cd_thms = ∃_ad_cd_thms, ∃_ad_vs_thms  = ∃_ad_vs_thms,
	names = names, theoryname = theoryname,
	a_valid_thm = a_valid_thm, committed = committed}
 =>
	{
	rw_eqn_cxt = rw_eqn_cxt, rw_canons = rw_canons,
	rw_eqm_rule = Value eqm_rule,
	st_eqn_cxt = st_eqn_cxt, sc_eqn_cxt = sc_eqn_cxt,
	cs_∃_convs = cs_∃_convs, ∃_cd_thms = ∃_cd_thms,
	∃_vs_thms = ∃_vs_thms,
	nd_entries=nd_entries,nd_nets=nd_nets,
	pr_conv = pr_conv, pr_tac = pr_tac, mmp_rule = mmp_rule,
	rw_net = rw_net,
	rw_canon = rw_canon, st_conv = st_conv,
	sc_conv = sc_conv, cs_∃_conv = cs_∃_conv,
	∃_ad_cd_thms = ∃_ad_cd_thms, ∃_ad_vs_thms  = ∃_ad_vs_thms,
	names = names, theoryname = theoryname,
	a_valid_thm = a_valid_thm, committed = committed})
);
fun ⦏get_rw_eqm_rule⦎ (key:string) : (THM -> TERM * CONV) OPT = (
	#rw_eqm_rule (get_pc "get_rw_eqm_rule" key)
);
=TEX
\subsubsection{Theorem Stripping Equational Context}
=SML
fun ⦏set_st_eqn_cxt⦎ (ec:EQN_CXT) (key:string) : unit =  (
change_pc "set_st_eqn_cxt" key
(fn
	{
	rw_eqn_cxt = rw_eqn_cxt, rw_canons = rw_canons,
	rw_eqm_rule = rw_eqm_rule,
	st_eqn_cxt = st_eqn_cxt, sc_eqn_cxt = sc_eqn_cxt,
	cs_∃_convs = cs_∃_convs, ∃_cd_thms = ∃_cd_thms,
	∃_vs_thms = ∃_vs_thms,
	nd_entries=nd_entries,nd_nets=nd_nets,
	pr_conv = pr_conv, pr_tac = pr_tac, mmp_rule = mmp_rule,
	rw_net = rw_net,
	rw_canon = rw_canon, st_conv = st_conv,
	sc_conv = sc_conv, cs_∃_conv = cs_∃_conv,
	∃_ad_cd_thms = ∃_ad_cd_thms, ∃_ad_vs_thms  = ∃_ad_vs_thms,
	names = names, theoryname = theoryname,
	a_valid_thm = a_valid_thm, committed = committed}
 =>
	{
	rw_eqn_cxt = rw_eqn_cxt, rw_canons = rw_canons,
	rw_eqm_rule = rw_eqm_rule,
	st_eqn_cxt = roverwrite1 st_eqn_cxt (ec,key), sc_eqn_cxt = sc_eqn_cxt,
	cs_∃_convs = cs_∃_convs, ∃_cd_thms = ∃_cd_thms,
	∃_vs_thms = ∃_vs_thms,
	nd_entries=nd_entries,nd_nets=nd_nets,
	pr_conv = pr_conv, pr_tac = pr_tac, mmp_rule = mmp_rule,
	rw_net = rw_net,
	rw_canon = rw_canon, st_conv = st_conv,
	sc_conv = sc_conv, cs_∃_conv = cs_∃_conv,
	∃_ad_cd_thms = ∃_ad_cd_thms, ∃_ad_vs_thms  = ∃_ad_vs_thms,
	names = names, theoryname = theoryname,
	a_valid_thm = a_valid_thm, committed = committed})
);
fun ⦏get_st_eqn_cxt⦎ (key:string) : (EQN_CXT * string) list = (
	#st_eqn_cxt (get_pc "get_st_eqn_cxt" key)
);
=TEX
In adding the theorems we canonicalise them by what the
proof context would evaluate as its current canonicalisation.
=SML
fun ⦏add_st_thms⦎ (thms:THM list) (key:string) : unit =  (
change_pc "add_st_thms" key
((fn
	{
	rw_eqn_cxt = rw_eqn_cxt, rw_canons = rw_canons,
	rw_eqm_rule = rw_eqm_rule,
	st_eqn_cxt = st_eqn_cxt, sc_eqn_cxt = sc_eqn_cxt,
	cs_∃_convs = cs_∃_convs, ∃_cd_thms = ∃_cd_thms,
	∃_vs_thms = ∃_vs_thms,
	nd_entries=nd_entries,nd_nets=nd_nets,
	pr_conv = pr_conv, pr_tac = pr_tac, mmp_rule = mmp_rule,
	rw_net = rw_net,
	rw_canon = rw_canon, st_conv = st_conv,
	sc_conv = sc_conv, cs_∃_conv = cs_∃_conv,
	∃_ad_cd_thms = ∃_ad_cd_thms, ∃_ad_vs_thms  = ∃_ad_vs_thms,
	names = names, theoryname = theoryname,
	a_valid_thm = a_valid_thm, committed = committed}:PROOF_CONTEXT
 =>
	let val cthms = map thm_eqn_cxt(flat (map (current_ad_rw_canon()) thms));
	in
	{
	rw_eqn_cxt = rw_eqn_cxt,
	rw_canons = rw_canons,
	rw_eqm_rule = rw_eqm_rule,
	st_eqn_cxt = (case rassoc5 st_eqn_cxt key of
		Value x => roverwrite1 st_eqn_cxt ((cthms @ x),key)
		| Nil =>  ((cthms, key) :: st_eqn_cxt)),
	sc_eqn_cxt = sc_eqn_cxt,
	cs_∃_convs = cs_∃_convs, ∃_cd_thms = ∃_cd_thms,
	∃_vs_thms = ∃_vs_thms,
	nd_entries=nd_entries,nd_nets=nd_nets,
	pr_conv = pr_conv, pr_tac = pr_tac, mmp_rule = mmp_rule,
	rw_net = rw_net,
	rw_canon = rw_canon, st_conv = st_conv,
	sc_conv = sc_conv, cs_∃_conv = cs_∃_conv,
	∃_ad_cd_thms = ∃_ad_cd_thms, ∃_ad_vs_thms  = ∃_ad_vs_thms,
	names = names, theoryname = theoryname,
	a_valid_thm = a_valid_thm, committed = committed}
	end)
o
evaluate_proof_context)
);
=TEX
\subsubsection{Goal Stripping Equational Context}
=SML
fun ⦏set_sc_eqn_cxt⦎ (ec:EQN_CXT) (key:string) : unit =  (
change_pc "set_sc_eqn_cxt" key
(fn
	{
	rw_eqn_cxt = rw_eqn_cxt, rw_canons = rw_canons,
	rw_eqm_rule = rw_eqm_rule,
	st_eqn_cxt = st_eqn_cxt, sc_eqn_cxt = sc_eqn_cxt,
	cs_∃_convs = cs_∃_convs, ∃_cd_thms = ∃_cd_thms,
	∃_vs_thms = ∃_vs_thms,
	nd_entries=nd_entries,nd_nets=nd_nets,
	pr_conv = pr_conv, pr_tac = pr_tac, mmp_rule = mmp_rule,
	rw_net = rw_net,
	rw_canon = rw_canon, st_conv = st_conv,
	sc_conv = sc_conv, cs_∃_conv = cs_∃_conv,
	∃_ad_cd_thms = ∃_ad_cd_thms, ∃_ad_vs_thms  = ∃_ad_vs_thms,
	names = names, theoryname = theoryname,
	a_valid_thm = a_valid_thm, committed = committed}
 =>
	{
	rw_eqn_cxt = rw_eqn_cxt, rw_canons = rw_canons,
	rw_eqm_rule = rw_eqm_rule,
	st_eqn_cxt = st_eqn_cxt, sc_eqn_cxt = roverwrite1 sc_eqn_cxt (ec,key),
	cs_∃_convs = cs_∃_convs, ∃_cd_thms = ∃_cd_thms,
	∃_vs_thms = ∃_vs_thms,
	nd_entries=nd_entries,nd_nets=nd_nets,
	pr_conv = pr_conv, pr_tac = pr_tac, mmp_rule = mmp_rule,
	rw_net = rw_net,
	rw_canon = rw_canon, st_conv = st_conv,
	sc_conv = sc_conv, cs_∃_conv = cs_∃_conv,
	∃_ad_cd_thms = ∃_ad_cd_thms, ∃_ad_vs_thms  = ∃_ad_vs_thms,
	names = names, theoryname = theoryname,
	a_valid_thm = a_valid_thm, committed = committed})
);
fun ⦏get_sc_eqn_cxt⦎ (key:string) : (EQN_CXT * string) list = (
	#sc_eqn_cxt (get_pc "get_sc_eqn_cxt" key)
);
=TEX
=SML
fun ⦏add_sc_thms⦎ (thms:THM list) (key:string) : unit =  (
change_pc "add_sc_thms" key
((fn
	{
	rw_eqn_cxt = rw_eqn_cxt, rw_canons = rw_canons,
	rw_eqm_rule = rw_eqm_rule,
	st_eqn_cxt = st_eqn_cxt, sc_eqn_cxt = sc_eqn_cxt,
	cs_∃_convs = cs_∃_convs, ∃_cd_thms = ∃_cd_thms,
	∃_vs_thms = ∃_vs_thms,
	nd_entries=nd_entries,nd_nets=nd_nets,
	pr_conv = pr_conv, pr_tac = pr_tac, mmp_rule = mmp_rule,
	rw_net = rw_net,
	rw_canon = rw_canon, st_conv = st_conv,
	sc_conv = sc_conv, cs_∃_conv = cs_∃_conv,
	∃_ad_cd_thms = ∃_ad_cd_thms, ∃_ad_vs_thms  = ∃_ad_vs_thms,
	names = names, theoryname = theoryname,
	a_valid_thm = a_valid_thm, committed = committed}:PROOF_CONTEXT
 =>
	let val cthms = map thm_eqn_cxt(flat (map (current_ad_rw_canon()) thms));
	in
	{
	rw_eqn_cxt = rw_eqn_cxt,
	rw_canons = rw_canons,
	rw_eqm_rule = rw_eqm_rule,
	st_eqn_cxt = st_eqn_cxt,
	sc_eqn_cxt = (case rassoc5 sc_eqn_cxt key of
		Value x => roverwrite1 sc_eqn_cxt ((cthms @ x),key)
		| Nil =>  ((cthms, key) :: sc_eqn_cxt)),
	cs_∃_convs = cs_∃_convs, ∃_cd_thms = ∃_cd_thms,
	∃_vs_thms = ∃_vs_thms,
	nd_entries=nd_entries,nd_nets=nd_nets,
	pr_conv = pr_conv, pr_tac = pr_tac, mmp_rule = mmp_rule,
	rw_net = rw_net,
	rw_canon = rw_canon, st_conv = st_conv,
	sc_conv = sc_conv, cs_∃_conv = cs_∃_conv,
	∃_ad_cd_thms = ∃_ad_cd_thms, ∃_ad_vs_thms  = ∃_ad_vs_thms,
	names = names, theoryname = theoryname,
	a_valid_thm = a_valid_thm, committed = committed}
	end)
o
evaluate_proof_context)
);
=TEX
\subsubsection{Dictionary of Discrimation Nets}
=SML
fun ⦏set_nd_entry⦎ (dict_key:string)
	(entry: (TERM * (TERM -> THM))list)
	(key:string) : unit =  (
change_pc "set_nd_entry" key
(fn
	{
	rw_eqn_cxt = rw_eqn_cxt, rw_canons = rw_canons,
	rw_eqm_rule = rw_eqm_rule,
	st_eqn_cxt = st_eqn_cxt, sc_eqn_cxt = sc_eqn_cxt,
	cs_∃_convs = cs_∃_convs, ∃_cd_thms = ∃_cd_thms,
	∃_vs_thms = ∃_vs_thms,
	nd_entries=nd_entries,nd_nets=nd_nets,
	pr_conv = pr_conv, pr_tac = pr_tac, mmp_rule = mmp_rule,
	rw_net = rw_net,
	rw_canon = rw_canon, st_conv = st_conv,
	sc_conv = sc_conv, cs_∃_conv = cs_∃_conv,
	∃_ad_cd_thms = ∃_ad_cd_thms, ∃_ad_vs_thms  = ∃_ad_vs_thms,
	names = names, theoryname = theoryname,
	a_valid_thm = a_valid_thm, committed = committed}
 =>
	{
	rw_eqn_cxt = rw_eqn_cxt, rw_canons = rw_canons,
	rw_eqm_rule = rw_eqm_rule,
	st_eqn_cxt = st_eqn_cxt, sc_eqn_cxt = sc_eqn_cxt,
	cs_∃_convs = cs_∃_convs, ∃_cd_thms = ∃_cd_thms,
	∃_vs_thms = ∃_vs_thms,
	nd_entries=(let	val old_field = rassoc4 nd_entries [] key;
		in
		roverwrite1 nd_entries ((roverwrite1 old_field  (entry,dict_key)), key)
		end),
	nd_nets=nd_nets,
	pr_conv = pr_conv, pr_tac = pr_tac, mmp_rule = mmp_rule,
	rw_net = rw_net,
	rw_canon = rw_canon, st_conv = st_conv,
	sc_conv = sc_conv, cs_∃_conv = cs_∃_conv,
	∃_ad_cd_thms = ∃_ad_cd_thms, ∃_ad_vs_thms  = ∃_ad_vs_thms,
	names = names, theoryname = theoryname,
	a_valid_thm = a_valid_thm, committed = committed})
);
local
	fun aux dk ((a,pcn) :: x) = (case (rassoc5 a dk) of
		Value entry => (entry,pcn) :: aux dk x
		| Nil => aux dk x)
	| aux _ [] = [];
in
fun ⦏get_nd_entry⦎ (dict_key : string) (key:string) : ((TERM * (TERM -> THM))list * string) list = (
let 	val all_entries = #nd_entries (get_pc "get_nd_entry" key);
	val all_dict_entries = aux dict_key all_entries
in
	all_dict_entries
end);
end;
=TEX

\subsubsection{Automated Existence Provers}
=SML
fun ⦏set_cs_∃_convs⦎ (rls : CONV list) (key:string) : unit =  (
change_pc "set_cs_∃_convs" key
(fn
	{
	rw_eqn_cxt = rw_eqn_cxt, rw_canons = rw_canons,
	rw_eqm_rule = rw_eqm_rule,
	st_eqn_cxt = st_eqn_cxt, sc_eqn_cxt = sc_eqn_cxt,
	cs_∃_convs = cs_∃_convs, ∃_cd_thms = ∃_cd_thms,
	∃_vs_thms = ∃_vs_thms,
	nd_entries=nd_entries,nd_nets=nd_nets,
	pr_conv = pr_conv, pr_tac = pr_tac, mmp_rule = mmp_rule,
	rw_net = rw_net,
	rw_canon = rw_canon, st_conv = st_conv,
	sc_conv = sc_conv, cs_∃_conv = cs_∃_conv,
	∃_ad_cd_thms = ∃_ad_cd_thms, ∃_ad_vs_thms  = ∃_ad_vs_thms,
	names = names, theoryname = theoryname,
	a_valid_thm = a_valid_thm, committed = committed}
 =>
	{
	rw_eqn_cxt = rw_eqn_cxt, rw_canons = rw_canons,
	rw_eqm_rule = rw_eqm_rule,
	st_eqn_cxt = st_eqn_cxt, sc_eqn_cxt = sc_eqn_cxt,
	cs_∃_convs = roverwrite1 cs_∃_convs (rls,key), ∃_cd_thms = ∃_cd_thms,
	∃_vs_thms = ∃_vs_thms,
	nd_entries=nd_entries,nd_nets=nd_nets,
	pr_conv = pr_conv, pr_tac = pr_tac, mmp_rule = mmp_rule,
	rw_net = rw_net,
	rw_canon = rw_canon, st_conv = st_conv,
	sc_conv = sc_conv, cs_∃_conv = cs_∃_conv,
	∃_ad_cd_thms = ∃_ad_cd_thms, ∃_ad_vs_thms  = ∃_ad_vs_thms,
	names = names, theoryname = theoryname,
	a_valid_thm = a_valid_thm, committed = committed})
);
fun ⦏get_cs_∃_convs⦎ (key:string) : (CONV list * string) list = (
	#cs_∃_convs (get_pc "get_cs_∃_convs" key)
);
=TEX
\subsubsection{Clausal Definition Theorems}
=SML
fun ⦏set_∃_cd_thms⦎ (cd : THM list) (key:string) : unit =  (
change_pc "set_∃_cd_thms" key
(fn
	{
	rw_eqn_cxt = rw_eqn_cxt, rw_canons = rw_canons,
	rw_eqm_rule = rw_eqm_rule,
	st_eqn_cxt = st_eqn_cxt, sc_eqn_cxt = sc_eqn_cxt,
	cs_∃_convs = cs_∃_convs, ∃_cd_thms = ∃_cd_thms,
	∃_vs_thms = ∃_vs_thms,
	nd_entries=nd_entries,nd_nets=nd_nets,
	pr_conv = pr_conv, pr_tac = pr_tac, mmp_rule = mmp_rule,
	rw_net = rw_net,
	rw_canon = rw_canon, st_conv = st_conv,
	sc_conv = sc_conv, cs_∃_conv = cs_∃_conv,
	∃_ad_cd_thms = ∃_ad_cd_thms, ∃_ad_vs_thms  = ∃_ad_vs_thms,
	names = names, theoryname = theoryname,
	a_valid_thm = a_valid_thm, committed = committed}
 =>
	{
	rw_eqn_cxt = rw_eqn_cxt, rw_canons = rw_canons,
	rw_eqm_rule = rw_eqm_rule,
	st_eqn_cxt = st_eqn_cxt, sc_eqn_cxt = sc_eqn_cxt,
	cs_∃_convs = cs_∃_convs, ∃_cd_thms = cd,
	∃_vs_thms = ∃_vs_thms,
	nd_entries=nd_entries,nd_nets=nd_nets,
	pr_conv = pr_conv, pr_tac = pr_tac, mmp_rule = mmp_rule,
	rw_net = rw_net,
	rw_canon = rw_canon, st_conv = st_conv,
	sc_conv = sc_conv, cs_∃_conv = cs_∃_conv,
	∃_ad_cd_thms = ∃_ad_cd_thms, ∃_ad_vs_thms  = ∃_ad_vs_thms,
	names = names, theoryname = theoryname,
	a_valid_thm = a_valid_thm, committed = committed})
);
fun ⦏get_∃_cd_thms⦎ (key:string) : THM list = (
	#∃_cd_thms (get_pc "get_∃_cd_thms" key)
);
=TEX
=SML
fun ⦏add_∃_cd_thms⦎ (thms:THM list) (key:string) : unit =  (
change_pc "add_∃_cd_thms" key
(fn
	{
	rw_eqn_cxt = rw_eqn_cxt, rw_canons = rw_canons,
	rw_eqm_rule = rw_eqm_rule,
	st_eqn_cxt = st_eqn_cxt, sc_eqn_cxt = sc_eqn_cxt,
	cs_∃_convs = cs_∃_convs, ∃_cd_thms = ∃_cd_thms,
	∃_vs_thms = ∃_vs_thms,
	nd_entries=nd_entries,nd_nets=nd_nets,
	pr_conv = pr_conv, pr_tac = pr_tac, mmp_rule = mmp_rule,
	rw_net = rw_net,
	rw_canon = rw_canon, st_conv = st_conv,
	sc_conv = sc_conv, cs_∃_conv = cs_∃_conv,
	∃_ad_cd_thms = ∃_ad_cd_thms, ∃_ad_vs_thms  = ∃_ad_vs_thms,
	names = names, theoryname = theoryname,
	a_valid_thm = a_valid_thm, committed = committed}:PROOF_CONTEXT
 =>
	{
	rw_eqn_cxt = rw_eqn_cxt,
	rw_canons = rw_canons,
	rw_eqm_rule = rw_eqm_rule,
	st_eqn_cxt = st_eqn_cxt,
	sc_eqn_cxt = sc_eqn_cxt,
	cs_∃_convs = cs_∃_convs,
	∃_cd_thms = thm_union thms ∃_cd_thms,
	∃_vs_thms = ∃_vs_thms,
	nd_entries=nd_entries,nd_nets=nd_nets,
	pr_conv = pr_conv, pr_tac = pr_tac, mmp_rule = mmp_rule,
	rw_net = rw_net,
	rw_canon = rw_canon, st_conv = st_conv,
	sc_conv = sc_conv, cs_∃_conv = cs_∃_conv,
	∃_ad_cd_thms = ∃_ad_cd_thms, ∃_ad_vs_thms  = ∃_ad_vs_thms,
	names = names, theoryname = theoryname,
	a_valid_thm = a_valid_thm, committed = committed}
	)
);
=TEX
\subsubsection{Variable Structure Theorems}
=SML
local
fun list_eq (a :: x) (b :: y) = a =$ b andalso list_eq x y
| list_eq [] [] = true
| list_eq _ _ = false;

val union_bits = union (fn ((str1,(tml1,thm1)) ,(str2,(tml2,thm2))) =>
	str1 = str2 andalso (list_eq tml1 tml2) andalso (thm1 =|- thm2))
in
fun ⦏set_∃_vs_thms⦎ (vs : (string * (TERM list * THM))list) (key:string) : unit =  (
change_pc "set_∃_vs_thms" key
(fn
	{
	rw_eqn_cxt = rw_eqn_cxt, rw_canons = rw_canons,
	rw_eqm_rule = rw_eqm_rule,
	st_eqn_cxt = st_eqn_cxt, sc_eqn_cxt = sc_eqn_cxt,
	cs_∃_convs = cs_∃_convs, ∃_cd_thms = ∃_cd_thms,
	∃_vs_thms = ∃_vs_thms,
	nd_entries=nd_entries,nd_nets=nd_nets,
	pr_conv = pr_conv, pr_tac = pr_tac, mmp_rule = mmp_rule,
	rw_net = rw_net,
	rw_canon = rw_canon, st_conv = st_conv,
	sc_conv = sc_conv, cs_∃_conv = cs_∃_conv,
	∃_ad_cd_thms = ∃_ad_cd_thms, ∃_ad_vs_thms  = ∃_ad_vs_thms,
	names = names, theoryname = theoryname,
	a_valid_thm = a_valid_thm, committed = committed}
 =>
	{
	rw_eqn_cxt = rw_eqn_cxt, rw_canons = rw_canons,
	rw_eqm_rule = rw_eqm_rule,
	st_eqn_cxt = st_eqn_cxt, sc_eqn_cxt = sc_eqn_cxt,
	cs_∃_convs = cs_∃_convs, ∃_cd_thms = ∃_cd_thms,
	∃_vs_thms = union_bits ∃_vs_thms vs,
	nd_entries=nd_entries,nd_nets=nd_nets,
	pr_conv = pr_conv, pr_tac = pr_tac, mmp_rule = mmp_rule,
	rw_net = rw_net,
	rw_canon = rw_canon, st_conv = st_conv,
	sc_conv = sc_conv, cs_∃_conv = cs_∃_conv,
	∃_ad_cd_thms = ∃_ad_cd_thms, ∃_ad_vs_thms  = ∃_ad_vs_thms,
	names = names, theoryname = theoryname,
	a_valid_thm = a_valid_thm, committed = committed})
);
end;
fun ⦏get_∃_vs_thms⦎ (key:string) : (string * (TERM list * THM))  list = (
	#∃_vs_thms (get_pc "get_∃_vs_thms" key)
);
=TEX
\subsubsection{Automatic Proof: Tactics}
=SML
fun ⦏set_pr_tac⦎ (tac : THM list -> TACTIC) (key:string) : unit =  (
change_pc "set_pr_tac" key
(fn
	{
	rw_eqn_cxt = rw_eqn_cxt, rw_canons = rw_canons,
	rw_eqm_rule = rw_eqm_rule,
	st_eqn_cxt = st_eqn_cxt, sc_eqn_cxt = sc_eqn_cxt,
	cs_∃_convs = cs_∃_convs, ∃_cd_thms = ∃_cd_thms,
	∃_vs_thms = ∃_vs_thms,
	nd_entries=nd_entries,nd_nets=nd_nets,
	pr_conv = pr_conv, pr_tac = pr_tac, mmp_rule = mmp_rule,
	rw_net = rw_net,
	rw_canon = rw_canon, st_conv = st_conv,
	sc_conv = sc_conv, cs_∃_conv = cs_∃_conv,
	∃_ad_cd_thms = ∃_ad_cd_thms, ∃_ad_vs_thms  = ∃_ad_vs_thms,
	names = names, theoryname = theoryname,
	a_valid_thm = a_valid_thm, committed = committed}
 =>
	{
	rw_eqn_cxt = rw_eqn_cxt, rw_canons = rw_canons,
	rw_eqm_rule = rw_eqm_rule,
	st_eqn_cxt = st_eqn_cxt, sc_eqn_cxt = sc_eqn_cxt,
	cs_∃_convs = cs_∃_convs, ∃_cd_thms = ∃_cd_thms,
	∃_vs_thms = ∃_vs_thms,
	nd_entries=nd_entries,nd_nets=nd_nets,
	pr_conv = pr_conv, pr_tac = Value tac, mmp_rule = mmp_rule,
	rw_net = rw_net,
	rw_canon = rw_canon, st_conv = st_conv,
	sc_conv = sc_conv, cs_∃_conv = cs_∃_conv,
	∃_ad_cd_thms = ∃_ad_cd_thms, ∃_ad_vs_thms  = ∃_ad_vs_thms,
	names = names, theoryname = theoryname,
	a_valid_thm = a_valid_thm, committed = committed})
);
fun ⦏get_pr_tac1⦎ (key:string) : (THM list -> TACTIC) OPT = (
	#pr_tac (get_pc "get_pr_tac1" key)
);
fun ⦏get_pr_tac⦎ (key:string) : THM list -> TACTIC = (
	(case #pr_tac (get_pc "get_pr_tac" key) of
		Value tac => tac
	|	Nil => fn _ => fail_tac)
);
=TEX
\subsubsection{Automatic Proof: Conversions}
=SML
fun ⦏set_pr_conv⦎ (conv : THM list -> CONV) (key:string) : unit =  (
change_pc "set_pr_conv" key
(fn
	{
	rw_eqn_cxt = rw_eqn_cxt, rw_canons = rw_canons,
	rw_eqm_rule = rw_eqm_rule,
	st_eqn_cxt = st_eqn_cxt, sc_eqn_cxt = sc_eqn_cxt,
	cs_∃_convs = cs_∃_convs, ∃_cd_thms = ∃_cd_thms,
	∃_vs_thms = ∃_vs_thms,
	nd_entries=nd_entries,nd_nets=nd_nets,
	pr_conv = pr_conv, pr_tac = pr_tac, mmp_rule = mmp_rule,
	rw_net = rw_net,
	rw_canon = rw_canon, st_conv = st_conv,
	sc_conv = sc_conv, cs_∃_conv = cs_∃_conv,
	∃_ad_cd_thms = ∃_ad_cd_thms, ∃_ad_vs_thms  = ∃_ad_vs_thms,
	names = names, theoryname = theoryname,
	a_valid_thm = a_valid_thm, committed = committed}
 =>
	{
	rw_eqn_cxt = rw_eqn_cxt, rw_canons = rw_canons,
	rw_eqm_rule = rw_eqm_rule,
	st_eqn_cxt = st_eqn_cxt, sc_eqn_cxt = sc_eqn_cxt,
	cs_∃_convs = cs_∃_convs, ∃_cd_thms = ∃_cd_thms,
	∃_vs_thms = ∃_vs_thms,
	nd_entries=nd_entries,nd_nets=nd_nets,
	pr_conv = Value conv, pr_tac = pr_tac, mmp_rule = mmp_rule,
	rw_net = rw_net,
	rw_canon = rw_canon, st_conv = st_conv,
	sc_conv = sc_conv, cs_∃_conv = cs_∃_conv,
	∃_ad_cd_thms = ∃_ad_cd_thms, ∃_ad_vs_thms  = ∃_ad_vs_thms,
	names = names, theoryname = theoryname,
	a_valid_thm = a_valid_thm, committed = committed})
);
fun ⦏get_pr_conv1⦎ (key:string) : (THM list -> CONV) OPT = (
	#pr_conv (get_pc "get_pr_conv1" key)
);
fun ⦏get_pr_conv⦎ (key:string) : THM list -> CONV = (
	case #pr_conv (get_pc "get_pr_conv" key) of
		Value conv => conv
	|	Nil => fn _ => fail_conv
);
=TEX
=TEX
\subsubsection{Forward Chaining: Matching Modus Ponens Rule}
=SML
fun ⦏set_mmp_rule⦎ (rule : THM -> THM -> THM) (key:string) : unit =  (
change_pc "set_mmp_rule" key
(fn
	{
	rw_eqn_cxt = rw_eqn_cxt, rw_canons = rw_canons,
	rw_eqm_rule = rw_eqm_rule,
	st_eqn_cxt = st_eqn_cxt, sc_eqn_cxt = sc_eqn_cxt,
	cs_∃_convs = cs_∃_convs, ∃_cd_thms = ∃_cd_thms,
	∃_vs_thms = ∃_vs_thms,
	nd_entries=nd_entries,nd_nets=nd_nets,
	pr_conv = pr_conv, pr_tac = pr_tac, mmp_rule = mmp_rule,
	rw_net = rw_net,
	rw_canon = rw_canon, st_conv = st_conv,
	sc_conv = sc_conv, cs_∃_conv = cs_∃_conv,
	∃_ad_cd_thms = ∃_ad_cd_thms, ∃_ad_vs_thms  = ∃_ad_vs_thms,
	names = names, theoryname = theoryname,
	a_valid_thm = a_valid_thm, committed = committed}
 =>
	{
	rw_eqn_cxt = rw_eqn_cxt, rw_canons = rw_canons,
	rw_eqm_rule = rw_eqm_rule,
	st_eqn_cxt = st_eqn_cxt, sc_eqn_cxt = sc_eqn_cxt,
	cs_∃_convs = cs_∃_convs, ∃_cd_thms = ∃_cd_thms,
	∃_vs_thms = ∃_vs_thms,
	nd_entries=nd_entries,nd_nets=nd_nets,
	pr_conv = pr_conv, pr_tac = pr_tac, mmp_rule = Value rule,
	rw_net = rw_net,
	rw_canon = rw_canon, st_conv = st_conv,
	sc_conv = sc_conv, cs_∃_conv = cs_∃_conv,
	∃_ad_cd_thms = ∃_ad_cd_thms, ∃_ad_vs_thms  = ∃_ad_vs_thms,
	names = names, theoryname = theoryname,
	a_valid_thm = a_valid_thm, committed = committed})
);
fun ⦏get_mmp_rule⦎ (key:string) : (THM -> THM -> THM) OPT = (
	#mmp_rule (get_pc "get_mmp_rule" key)
);
=TEX
\subsection{Functions upon Proof Contexts}
=SML
fun ⦏commit_pc⦎ (key:string) : unit =  (
change_pc "commit_pc" key
((fn
	{
	rw_eqn_cxt = rw_eqn_cxt, rw_canons = rw_canons,
	rw_eqm_rule = rw_eqm_rule,
	st_eqn_cxt = st_eqn_cxt, sc_eqn_cxt = sc_eqn_cxt,
	cs_∃_convs = cs_∃_convs, ∃_cd_thms = ∃_cd_thms,
	∃_vs_thms = ∃_vs_thms,
	nd_entries=nd_entries,nd_nets=nd_nets,
	pr_conv = pr_conv, pr_tac = pr_tac, mmp_rule = mmp_rule,
	rw_net = rw_net,
	rw_canon = rw_canon, st_conv = st_conv,
	sc_conv = sc_conv, cs_∃_conv = cs_∃_conv,
	∃_ad_cd_thms = ∃_ad_cd_thms, ∃_ad_vs_thms  = ∃_ad_vs_thms,
	names = names, theoryname = theoryname,
	a_valid_thm = a_valid_thm, committed = committed}
 =>
	{
	rw_eqn_cxt = rw_eqn_cxt, rw_canons = rw_canons,
	rw_eqm_rule = rw_eqm_rule,
	st_eqn_cxt = st_eqn_cxt, sc_eqn_cxt = sc_eqn_cxt,
	cs_∃_convs = cs_∃_convs, ∃_cd_thms = ∃_cd_thms,
	∃_vs_thms = ∃_vs_thms,
	nd_entries=nd_entries,nd_nets=nd_nets,
	pr_conv = pr_conv, pr_tac = pr_tac, mmp_rule = mmp_rule,
	rw_net = rw_net,
	rw_canon = rw_canon, st_conv = st_conv,
	sc_conv = sc_conv, cs_∃_conv = cs_∃_conv,
	∃_ad_cd_thms = ∃_ad_cd_thms, ∃_ad_vs_thms  = ∃_ad_vs_thms,
	names = names, theoryname = get_current_theory_name(),
	a_valid_thm = refl_conv (mk_var("a",BOOL)),
	committed = true})
o evaluate_proof_context)
);
=TEX
We now give a function for merging two proof contexts. The behaviour is slightly different
when we are creating a dynamic proof context to be put on the stack from when we are
creating a proof context to be stored in the database.
Where relevant, e.g., in creating the names field for a proof context stored in the
database, the second of the pair is ``the master'', to which the first is added in.
The additional ``override''arguments are the source for $pr\_tac$ and $pr\_conv$.
=SML
local
fun list_eq (a :: x) (b :: y) = a =$ b andalso list_eq x y
| list_eq [] [] = true
| list_eq _ _ = false;

val union_bits = union (fn ((str1 : string,(tml1,thm1)) ,(str2,(tml2,thm2))) =>
	str1 = str2 andalso (list_eq tml1 tml2) andalso (thm1 =|- thm2));

fun merge_opt _ (y as Value _) = y
|   merge_opt x Nil = x;

in
fun ⦏local_merge_pc⦎ (caller:string) (making_stored_pc:bool)
	(({
	rw_eqn_cxt = rw_eqn_cxt, rw_canons = rw_canons,
	rw_eqm_rule = rw_eqm_rule,
	st_eqn_cxt = st_eqn_cxt, sc_eqn_cxt = sc_eqn_cxt,
	cs_∃_convs = cs_∃_convs, ∃_cd_thms = ∃_cd_thms,
	∃_vs_thms = ∃_vs_thms,
	nd_entries=nd_entries,nd_nets=nd_nets,
	pr_conv = pr_conv, pr_tac = pr_tac, mmp_rule = mmp_rule,
	rw_net = rw_net,
	rw_canon = rw_canon, st_conv = st_conv,
	sc_conv = sc_conv, cs_∃_conv = cs_∃_conv,
	∃_ad_cd_thms = ∃_ad_cd_thms, ∃_ad_vs_thms  = ∃_ad_vs_thms,
	names = names, theoryname = theoryname,
	a_valid_thm = a_valid_thm, committed = committed}:PROOF_CONTEXT),
	({
	rw_eqn_cxt = rw_eqn_cxt1, rw_canons = rw_canons1,
	rw_eqm_rule = rw_eqm_rule1,
	st_eqn_cxt = st_eqn_cxt1, sc_eqn_cxt = sc_eqn_cxt1,
	cs_∃_convs = cs_∃_convs1, ∃_cd_thms = ∃_cd_thms1,
	∃_vs_thms = ∃_vs_thms1,
	nd_entries=nd_entries1,nd_nets=nd_nets1,
	pr_conv = pr_conv1, pr_tac = pr_tac1, mmp_rule = mmp_rule1,
	rw_net = rw_net1,
	rw_canon = rw_canon1, st_conv = st_conv1,
	sc_conv = sc_conv1, cs_∃_conv = cs_∃_conv1,
	∃_ad_cd_thms = ∃_ad_cd_thms1, ∃_ad_vs_thms  = ∃_ad_vs_thms1,
	names = names1, theoryname = theoryname1,
	a_valid_thm = a_valid_thm1, committed = committed1}:PROOF_CONTEXT
)) : PROOF_CONTEXT = (
	if making_stored_pc andalso not committed
	then fail caller 51017 [fn () => hd names]
	else
	{
	rw_eqn_cxt = list_roverwrite1 rw_eqn_cxt rw_eqn_cxt1,
	rw_canons = list_roverwrite1 rw_canons rw_canons1,
	rw_eqm_rule = merge_opt rw_eqm_rule rw_eqm_rule1,
	st_eqn_cxt = list_roverwrite1 st_eqn_cxt st_eqn_cxt1,
	sc_eqn_cxt = list_roverwrite1 sc_eqn_cxt sc_eqn_cxt1,
	cs_∃_convs = list_roverwrite1 cs_∃_convs cs_∃_convs1,
	nd_entries = list_roverwrite1 nd_entries nd_entries1,
	∃_cd_thms = thm_union ∃_cd_thms ∃_cd_thms1,
	∃_vs_thms = union_bits ∃_vs_thms ∃_vs_thms1,
	pr_tac = merge_opt pr_tac pr_tac1,
	pr_conv = merge_opt pr_conv pr_conv1,
	mmp_rule = merge_opt mmp_rule mmp_rule1,
	rw_net = rw_net1,
	rw_canon = rw_canon1,
	st_conv = st_conv1,
	sc_conv = sc_conv1,
	cs_∃_conv = cs_∃_conv1,
	∃_ad_cd_thms = ∃_ad_cd_thms1,
	∃_ad_vs_thms  = ∃_ad_vs_thms1,
	nd_nets = nd_nets1,
	names = if making_stored_pc then names1 else (names @ names1),
	theoryname = theoryname1,
	a_valid_thm = a_valid_thm1,
	committed = false}
);
end;
=TEX
=SML
fun ⦏merge_pcs⦎ (keys:string list) (key : string) : unit = (
let	val pcs = map (get_pc "merge_pcs") keys;
in
	change_pc "merge_pcs" key
	(fn pc => fold (local_merge_pc "merge_pcs" true) pcs pc)
end);
=TEX
The following empties all but selected fields of proof contexts.
This is used directly in $delete\-\_pc\-\_fields$,
and indirectly in merging proof context fields.
=SML
val valid_fields = ["rw_eqn_cxt","rw_canons", "rw_eqm_rule", "st_eqn_cxt",
	"sc_eqn_cxt","cs_∃_convs","∃_cd_thms","∃_vs_thms",
	"pr_tac","pr_conv", "mmp_rule", "nd_entries"];
=TEX
=SML
fun ⦏prune_pc⦎ (caller : string) (fields : string list) ({
	rw_eqn_cxt = rw_eqn_cxt, rw_canons = rw_canons,
	rw_eqm_rule = rw_eqm_rule,
	st_eqn_cxt = st_eqn_cxt, sc_eqn_cxt = sc_eqn_cxt,
	cs_∃_convs = cs_∃_convs, ∃_cd_thms = ∃_cd_thms,
	∃_vs_thms = ∃_vs_thms,
	nd_entries=nd_entries,nd_nets=nd_nets,
	pr_conv = pr_conv, pr_tac = pr_tac, mmp_rule = mmp_rule,
	rw_net = rw_net,
	rw_canon = rw_canon, st_conv = st_conv,
	sc_conv = sc_conv, cs_∃_conv = cs_∃_conv,
	∃_ad_cd_thms = ∃_ad_cd_thms, ∃_ad_vs_thms  = ∃_ad_vs_thms,
	names = names, theoryname = theoryname,
	a_valid_thm = a_valid_thm, committed = committed}: PROOF_CONTEXT)
	: PROOF_CONTEXT = (
	if not(fields subset valid_fields)
	then fail caller 51019 [fn () => hd(fields diff valid_fields)]
	else
	{
	rw_eqn_cxt = if "rw_eqn_cxt" mem fields then rw_eqn_cxt else [],
	rw_canons = if "rw_canons" mem fields then rw_canons else [],
	rw_eqm_rule = if "rw_eqm_rule" mem fields then rw_eqm_rule else Nil,
	st_eqn_cxt = if "st_eqn_cxt" mem fields then st_eqn_cxt else [],
	sc_eqn_cxt = if "sc_eqn_cxt" mem fields then sc_eqn_cxt else [],
	cs_∃_convs = if "cs_∃_convs" mem fields then cs_∃_convs else [],
	∃_cd_thms = if "∃_cd_thms" mem fields then ∃_cd_thms else [],
	∃_vs_thms = if "∃_vs_thms" mem fields then ∃_vs_thms else [],
	nd_entries = if "nd_entries" mem fields then nd_entries else [],
	pr_conv = if "pr_conv" mem fields then pr_conv else Nil,
	pr_tac = if "pr_tac" mem fields then pr_tac else Nil,
	mmp_rule = if "mmp_rule" mem fields then mmp_rule else Nil,
	rw_net = rw_net,
	rw_canon = rw_canon,
	st_conv = st_conv,
	sc_conv = sc_conv,
	cs_∃_conv = cs_∃_conv,
	nd_nets = nd_nets,
	∃_ad_cd_thms = ∃_ad_cd_thms,
	∃_ad_vs_thms  = ∃_ad_vs_thms,
	names = names,
	theoryname = theoryname,
	a_valid_thm = a_valid_thm,
	committed = committed}
);
=TEX
=SML
local
	fun get_stuff {context:string,fields:string list}:PROOF_CONTEXT = (
	let	val pc = get_pc "merge_pc_fields" context;
	in
		prune_pc "merge_pc_fields" fields pc
	end);
in
fun ⦏merge_pc_fields⦎ (lst : {context:string,fields:string list}list)
	(key :string) : unit = (
let	val pcs = map get_stuff lst;
in
	change_pc "merge_pc_fields" key
	(fn pc => fold (local_merge_pc "merge_pc_fields" true) pcs pc)
end);
end;
=TEX
=SML
fun ⦏delete_pc_fields⦎ (fields: string list) (key: string) : unit = (
	if not(fields subset valid_fields)
	then fail "delete_pc_fields" 51019 [fn () => hd(fields diff valid_fields)]
	else (change_pc "delete_pc_fields" key
		(prune_pc "delete_pc_fields" (valid_fields diff fields)))
);
=TEX
=SML
fun ⦏push_pc⦎ (key : string): unit = (
let	val pc = get_pc "push_pc" key;
	val epc = if #committed pc
		then pc
		else evaluate_proof_context pc;
in
	(push_pc_stack (lget_current_pc());
	set_current_pc epc)
end);
=TEX
=SML
fun ⦏pending_push_pc⦎ (key : string): unit -> unit = (
let	val pc = get_pc "pending_push_pc" key;
	val epc = if #committed pc
		then pc
		else evaluate_proof_context pc;
in
	(fn () =>
	((if valid_thm (#a_valid_thm pc)
	then ()
	else fail "pending_push_pc" 51014 [
		(fn () => format_list (Combinators.I) (#names pc) ","),
		(fn () => (#theoryname pc))]);
	push_pc_stack (lget_current_pc());
	set_current_pc epc))
end);
=TEX
=SML
fun ⦏pop_pc⦎ (): unit = (
let	val pc = pop_pc_stack "pop_pc";
in
	set_current_pc pc
end);
=TEX
=SML
fun ⦏set_pc⦎ (key : string): unit = (
let	val pc = get_pc "set_pc" key;
	val epc = if #committed pc
		then pc
		else evaluate_proof_context pc;
in
	set_current_pc epc
end);
=TEX
=SML
fun ⦏push_merge_pcs⦎ ([]: string list): unit = fail "push_merge_pcs" 51020 []
| push_merge_pcs keys = (
let	val pcs = map (get_pc "push_merge_pcs") keys;
	val fullpc = fold (local_merge_pc "push_merge_pcs" false)
		pcs (empty_pc false []);
	val epc = evaluate_proof_context fullpc;
in	(push_pc_stack (lget_current_pc());
	set_current_pc epc)
end);
=TEX
=SML
fun ⦏push_extend_pcs⦎ ([]: string list): unit = fail "push_extend_pcs" 51020 []
| push_extend_pcs keys = (
let	val cur_pc = lget_current_pc();
	val pcs = cur_pc :: map (get_pc "push_extend_pcs") keys;
	val fullpc = fold (local_merge_pc "push_extend_pcs" false)
		pcs (empty_pc false []);
	val epc = evaluate_proof_context fullpc;
in
	(push_pc_stack (lget_current_pc());
	set_current_pc epc)
end);
=TEX
=SML
fun ⦏push_extend_pc⦎ (key : string) : unit = (
	push_extend_pcs [key]
	handle ex => pass_on ex "push_extend_pcs" "push_extend_pc"
);
=TEX
=SML
fun ⦏set_merge_pcs⦎ ([]: string list): unit = fail "set_merge_pcs" 51020 []
| set_merge_pcs keys = (
let	val pcs = map (get_pc "set_merge_pcs") keys;
	val fullpc = fold (local_merge_pc "set_merge_pcs" false)
		pcs (empty_pc false []);
	val epc = evaluate_proof_context fullpc;
in
	set_current_pc epc
end);
=TEX
=SML
fun ⦏set_extend_pcs⦎ ([]: string list): unit = fail "set_extend_pcs" 51020 []
| set_extend_pcs keys = (
let	val cur_pc = lget_current_pc();
	val pcs = cur_pc :: map (get_pc "set_extend_pcs") keys;
	val fullpc = fold (local_merge_pc "set_extend_pcs" false)
		pcs (empty_pc false []);
	val epc = evaluate_proof_context fullpc;
in
	set_current_pc epc
end);
=TEX
=SML
fun ⦏set_extend_pc⦎ (key : string) : unit = (
	set_extend_pcs [key]
	handle ex => pass_on ex "set_extend_pcs" "set_extend_pc"
);
=TEX
=SML
fun ⦏pending_push_merge_pcs⦎ ([]: string list): unit -> unit =
	fail "pending_push_merge_pcs" 51020 []
| pending_push_merge_pcs keys = (
let	val pcs = map (get_pc "pending_push_merge_pcs") keys;
	val fullpc = fold (local_merge_pc "pending_push_merge_pcs" false)
		pcs (empty_pc false []);
	val epc = evaluate_proof_context fullpc;
in
	(fn () =>
	((if valid_thm (#a_valid_thm fullpc)
	then ()
	else fail "pending_push_merge_pcs" 51014 [
		(fn () => format_list (Combinators.I) (#names fullpc) ","),
		(fn () => (#theoryname fullpc))]);
	push_pc_stack (lget_current_pc());
	set_current_pc epc))
end);
=TEX
=SML
fun ⦏pending_push_extend_pcs⦎ ([]: string list): unit -> unit =
	fail "pending_push_extend_pcs" 51020 []
| pending_push_extend_pcs keys = (
let	val cur_pc = lget_current_pc();
	val pcs = cur_pc :: map (get_pc "pending_push_extend_pcs") keys;
	val fullpc = fold (local_merge_pc "pending_push_extend_pcs" false)
		pcs (empty_pc false []);
	val epc = evaluate_proof_context fullpc;
in
	(fn () =>
	((if valid_thm (#a_valid_thm fullpc)
	then ()
	else fail "pending_push_merge_pcs" 51014 [
		(fn () => format_list (Combinators.I) (#names fullpc) ","),
		(fn () => (#theoryname fullpc))]);
	push_pc_stack (lget_current_pc());
	set_current_pc epc))
end);
=TEX
=SML
fun ⦏pending_push_extend_pc⦎ (key : string) : unit -> unit = (
	pending_push_extend_pcs [key]
	handle ex => pass_on ex "pending_push_extend_pcs" "pending_push_extend_pc"
);
=TEX
\section{USING THE PROOF CONTEXTS}
=SML
fun ⦏GEN_PC_T⦎
	(caller : string) (callee : string)
	(pending_push : string -> unit -> unit)
	(key : string) (tac: TACTIC): TACTIC = (fn gl =>
let	val ppc = pending_push key
		handle complaint =>
		pass_on complaint callee caller;
	val dummy = ppc()
		 handle complaint =>
		pass_on complaint callee caller;
	val (sgs,prf) = (tac gl
		handle complaint =>
		(pop_pc();
		reraise complaint (area_of complaint)));
	val dummy = pop_pc();
	val prf' = (fn x =>
		let val p1 = ppc()
			handle complaint =>
			pass_on complaint callee caller;
		val p2 = prf x
			handle complaint =>
			(pop_pc();
			reraise complaint (area_of complaint));
		in
			(pop_pc();
			p2)
		end);
in
	(sgs, prf')
end);
=TEX
=SML
val ⦏PC_T⦎ : string -> TACTIC -> TACTIC =
	GEN_PC_T "PC_T" "pending_push_pc" pending_push_pc;
val ⦏EXTEND_PC_T⦎ : string -> TACTIC -> TACTIC =
	GEN_PC_T "EXTEND_PC_T" "pending_push_extend_pc" pending_push_extend_pc;
=TEX
=SML
fun ⦏GEN_PCS_T⦎
	(caller : string) (callee : string)
	(pending_push : string list -> unit -> unit)
	(keys : string list) (tac: TACTIC): TACTIC = (fn gl =>
let	val ppc = pending_push keys
		handle complaint =>
		pass_on complaint callee caller;
	val dummy = ppc()
		 handle complaint =>
		pass_on complaint callee caller;
	val (sgs,prf) = (tac gl
		handle complaint =>
		(pop_pc();
		reraise complaint (area_of complaint)));
	val dummy = pop_pc();
	val prf' = (fn x =>
		let val p1 = ppc()
			handle complaint =>
			pass_on complaint callee caller;
		val p2 = prf x
			handle complaint =>
			(pop_pc();
			reraise complaint (area_of complaint));
		in
			(pop_pc();
			p2)
		end);
in
	(sgs,prf')
end);
=TEX
=SML
val ⦏MERGE_PCS_T⦎ : string list -> TACTIC -> TACTIC =
	GEN_PCS_T "MERGE_PCS_T" "pending_push_merge_pcs" pending_push_merge_pcs;
val ⦏EXTEND_PCS_T⦎ : string list -> TACTIC -> TACTIC =
	GEN_PCS_T "EXTEND_PCS_T" "pending_push_extend_pcs" pending_push_extend_pcs;
=TEX
=SML
fun ⦏GEN_PC_T1⦎
	(caller : string) (callee : string)
	(pending_push : string -> unit -> unit)
	(key : string) (tac: 'a -> TACTIC) (arg : 'a):  TACTIC = (fn gl =>
let	val ppc = pending_push key
		handle complaint =>
		pass_on complaint callee caller;
	val dummy = ppc()
		 handle complaint =>
		pass_on complaint callee caller;
	val (sgs,prf) = (tac arg gl
		handle complaint =>
		(pop_pc();
		reraise complaint (area_of complaint)));
	val dummy = pop_pc();
	val prf' = (fn x =>
		let val p1 = ppc()
			handle complaint =>
			pass_on complaint callee caller;
		val p2 = prf x
			handle complaint =>
			(pop_pc();
			reraise complaint (area_of complaint));
		in
			(pop_pc();
			p2)
		end);
in
	(sgs,prf')
end);
=TEX
=SML
val ⦏PC_T1⦎ : string -> ('a -> TACTIC) -> ('a -> TACTIC) = fn key => fn tac =>
	GEN_PC_T1 "PC_T1" "pending_push_pc" pending_push_pc key tac;
val ⦏EXTEND_PC_T1⦎ : string -> ('a -> TACTIC) -> ('a -> TACTIC) = fn key => fn tac =>
	GEN_PC_T1 "EXTEND_PC_T1" "pending_push_extend_pc" pending_push_extend_pc key tac;
=TEX
=SML
fun ⦏GEN_PCS_T1⦎
	(caller : string) (callee : string)
	(pending_push : string list -> unit -> unit)
	(keys : string list) (tac: 'a -> TACTIC) (arg : 'a):  TACTIC = (fn gl =>
let	val ppc = pending_push keys
		handle complaint =>
		pass_on complaint callee caller;
	val dummy = ppc()
		 handle complaint =>
		pass_on complaint callee caller;
	val (sgs,prf) = (tac arg gl
		handle complaint =>
		(pop_pc();
		reraise complaint (area_of complaint)));
	val dummy = pop_pc();
	val prf' = (fn x =>
		let val p1 = ppc()
			handle complaint =>
			pass_on complaint callee caller;
		val p2 = prf x
			handle complaint =>
			(pop_pc();
			reraise complaint (area_of complaint));
		in
			(pop_pc();
			p2)
		end);
in
	(sgs,prf')
end);
=TEX
=SML
val ⦏MERGE_PCS_T1⦎ : string list -> ('a -> TACTIC) -> ('a -> TACTIC) = fn keys => fn tac =>
	GEN_PCS_T1 "MERGE_PCS_T1" "pending_push_merge_pcs" pending_push_merge_pcs keys tac;
val ⦏EXTEND_PCS_T1⦎ : string list -> ('a -> TACTIC) -> ('a -> TACTIC) = fn keys => fn tac =>
	GEN_PCS_T1 "EXTEND_PCS_T1" "pending_push_extend_pcs" pending_push_extend_pcs keys tac;
=TEX
=SML
fun ⦏GEN_PC_C⦎
	(caller : string) (callee : string)
	(push : string -> unit)
	(key : string) (conv: CONV) :  CONV = (fn tm =>
let	val dummy = push key
		handle complaint => pass_on complaint callee caller;
	val res = (conv tm
		handle complaint =>
		(pop_pc();
		reraise complaint (area_of complaint)));
	val dummy = pop_pc();
in
	res
end);
=TEX
=SML
val ⦏PC_C⦎ : string -> CONV -> CONV =
	GEN_PC_C "PC_C" "push_pc" push_pc;
val ⦏EXTEND_PC_C⦎ : string -> CONV -> CONV =
	GEN_PC_C "EXTEND_PC_C" "push_extend_pc" push_extend_pc;
=TEX
=SML
fun ⦏GEN_PCS_C⦎
	(caller : string) (callee : string)
	(push : string list -> unit)
	(keys : string list) (conv: CONV) :  CONV = (fn tm =>
let	val dummy = push keys
	handle complaint =>
	pass_on complaint callee caller;
	val res = (conv tm
		handle complaint =>
		(pop_pc();
		reraise complaint (area_of complaint)));
	val dummy = pop_pc();
in
	res
end);
=TEX
=SML
val ⦏MERGE_PCS_C⦎ : string list -> CONV -> CONV =
	GEN_PCS_C "MERGE_PCS_C" "push_merge_pcs" push_merge_pcs;
val ⦏EXTEND_PCS_C⦎ : string list -> CONV -> CONV =
	GEN_PCS_C "EXTEND_PCS_C" "push_extend_pcs" push_extend_pcs;
=TEX
=SML
fun ⦏GEN_PC_C1⦎
	(caller : string) (callee : string)
	(push : string -> unit)
	(key : string) (conv: 'a -> CONV) (arg : 'a):  CONV = (fn tm =>
let	val dummy = push key handle complaint =>
		pass_on complaint callee caller;
	val res = (conv arg tm
		handle complaint =>
		(pop_pc();
		reraise complaint (area_of complaint)));
	val dummy = pop_pc();
in
	res
end);
=TEX
=SML
val ⦏PC_C1⦎ : string -> ('a -> CONV) -> ('a -> CONV) = fn key => fn conv =>
	GEN_PC_C1 "PC_C1" "push_pc" push_pc key conv;
val ⦏EXTEND_PC_C1⦎ : string -> ('a -> CONV) -> ('a -> CONV) = fn key => fn conv =>
	GEN_PC_C1 "EXTEND_PC_C1" "push_extend_pc" push_extend_pc key conv;
=TEX
=SML
fun ⦏GEN_PCS_C1⦎
	(caller : string) (callee : string)
	(push : string list -> unit)
	(keys : string list) (conv: 'a -> CONV) (arg : 'a):  CONV = (fn tm =>
let	val dummy = push keys handle complaint =>
		pass_on complaint callee caller;
	val res = (conv arg tm
		handle complaint =>
		(pop_pc();
		reraise complaint (area_of complaint)));
	val dummy = pop_pc();
in
	res
end);
=TEX
=SML
val ⦏MERGE_PCS_C1⦎ : string list -> ('a -> CONV) -> ('a -> CONV) = fn keys => fn conv =>
	GEN_PCS_C1 "MERGE_PCS_C1" "push_merge_pcs" push_merge_pcs keys conv;
val ⦏EXTEND_PCS_C1⦎ : string list -> ('a -> CONV) -> ('a -> CONV) = fn keys => fn conv =>
	GEN_PCS_C1 "EXTEND_PCS_C1" "push_extend_pcs" push_extend_pcs keys conv;
=TEX
=SML
fun ⦏gen_pc_rule⦎
	(caller : string) (callee : string)
	(push : string -> unit)
	(key : string) (rule: 'a -> THM) (x : 'a) : THM = (
let	val dummy = push key handle complaint =>
		pass_on complaint callee caller;
	val res = (rule x
		handle complaint =>
		(pop_pc();
		reraise complaint (area_of complaint)));
	val dummy = pop_pc();
in
	res
end);
=TEX
=SML
val ⦏pc_rule⦎ : string -> ('a -> THM) -> ('a -> THM) = fn key => fn r =>
	gen_pc_rule "pc_rule" "push_pc" push_pc key r;
val ⦏extend_pc_rule⦎ : string -> ('a -> THM) -> ('a -> THM) = fn key => fn r =>
	gen_pc_rule "extend_pc_rule" "push_extend_pc" push_extend_pc key r;
=TEX
=SML
fun ⦏gen_pcs_rule⦎
	(caller : string) (callee : string)
	(push : string list -> unit)
	(keys : string list) (rule: 'a -> THM) (x : 'a) : THM = (
let	val dummy = push keys handle complaint =>
		pass_on complaint callee caller;
	val res = (rule x
		handle complaint =>
		(pop_pc();
		reraise complaint (area_of complaint)));
	val dummy = pop_pc();
in
	res
end);
=TEX
=SML
val ⦏merge_pcs_rule⦎ : string list -> ('a -> THM) -> ('a -> THM) = fn keys => fn r =>
	gen_pcs_rule "merge_pcs_rule" "push_merge_pcs" push_merge_pcs keys r;
val ⦏extend_pcs_rule⦎ : string list -> ('a -> THM) -> ('a -> THM) = fn keys => fn r =>
	gen_pcs_rule "extend_pcs_rule" "push_extend_pcs" push_extend_pcs keys r;
=TEX
=SML
fun ⦏gen_pc_rule1⦎
	(caller : string) (callee : string)
	(push : string -> unit)
	(key : string) (rule: 'a -> 'b -> THM)
	(arg1 : 'a) (arg2 : 'b) : THM = (
let	val dummy = push key
		handle complaint =>
		pass_on complaint callee caller;
	val res = (rule arg1 arg2
		handle complaint =>
		(pop_pc();
		reraise complaint (area_of complaint)));
	val dummy = pop_pc();
in
	res
end);
=TEX
=SML
val ⦏pc_rule1⦎ : string -> ('a -> 'b -> THM) -> ('a -> 'b -> THM) = fn key => fn r =>
	gen_pc_rule1 "pc_rule1" "push_pc" push_pc key r;
val ⦏extend_pc_rule1⦎ : string -> ('a -> 'b -> THM) -> ('a -> 'b -> THM) = fn key => fn r =>
	gen_pc_rule1 "extend_pc_rule1" "push_extend_pc" push_extend_pc key r;
=TEX
=SML
fun ⦏gen_pcs_rule1⦎
	(caller : string) (callee : string)
	(push : string list -> unit)
	(keys : string list) (rule: 'a -> 'b -> THM)
	(arg1 : 'a) (arg2 : 'b) : THM = (
let	val dummy = push keys
		handle complaint =>
		pass_on complaint callee caller;
	val res = (rule arg1 arg2
		handle complaint =>
		(pop_pc();
		reraise complaint (area_of complaint)));
	val dummy = pop_pc();
in
	res
end);
=TEX
=SML
val ⦏merge_pcs_rule1⦎ : string list -> ('a -> 'b -> THM) -> ('a -> 'b -> THM) =
	fn keys => fn r =>
	gen_pcs_rule1 "merge_pcs_rule1" "push_merge_pcs" push_merge_pcs keys r;
val ⦏extend_pcs_rule1⦎ : string list -> ('a -> 'b -> THM) -> ('a -> 'b -> THM) =
	fn keys => fn r =>
	gen_pcs_rule1 "extend_pcs_rule1" "push_extend_pcs" push_extend_pcs keys r;
=TEX
=SML
fun nil_to_default (Value x) _ = x
|   nil_to_default Nil y = y;

fun ⦏asm_prove_tac⦎ (thms: THM list) :  TACTIC = (
	nil_to_default (current_ad_pr_tac ()) (fn _ => fail_tac) thms
	handle complaint =>
	pass_on complaint "current_ad_pr_tac" "asm_prove_tac"
);
=TEX
=SML
fun ⦏prove_conv⦎ (thms: THM list) :  CONV = (
	nil_to_default (current_ad_pr_conv ()) (fn _ => fail_conv) thms
	handle complaint =>
	pass_on complaint "current_ad_pr_conv" "prove_conv"
);
=TEX
=SML
fun ⦏prove_rule⦎ (thms: THM list) : TERM -> THM = (
let	val res1 = nil_to_default (current_ad_pr_conv ()) (fn _ => fail_conv) thms
		handle complaint =>
		pass_on complaint "current_ad_pr_conv" "prove_rule";
in
	(fn tm =>
let
	val res = res1 tm;
	val dummy = if is_nil (asms res)
		then ()
		else fail "prove_rule" 51022 [
			fn () => string_of_term tm,
			fn () => string_of_thm res];
	val (lhs,rhs) = dest_⇔ (concl res)
		handle complaint =>
		divert complaint "dest_⇔" "prove_rule" 51022 [
			fn () => string_of_term tm,
			fn () => string_of_thm res];
in
	if (rhs =$ mk_t) andalso (lhs ~=$ tm)
	then ⇔_t_elim(eq_trans_rule (refl_conv tm) res)
	else fail "prove_rule" 51022 [
			fn () => string_of_term tm,
			fn () => string_of_thm res]
end)
end);
=TEX
=SML
val ⦏asm_prove_∃_tac⦎ : TACTIC = (fn gl =>
	conv_tac(current_ad_cs_∃_conv ()) gl
	handle complaint =>
	pass_on complaint "current_ad_cs_∃_conv" "asm_prove_∃_tac"
);
=TEX
=SML
val ⦏prove_∃_conv⦎ :  CONV = (fn tm =>
	current_ad_cs_∃_conv () tm
	handle complaint =>
	pass_on complaint "current_ad_cs_∃_conv" "prove_∃_conv"
);
=TEX
=SML
fun ⦏prove_∃_rule⦎ (tm : TERM) : THM = (
let	val res = current_ad_cs_∃_conv () tm
		handle complaint =>
		pass_on complaint "current_ad_cs_∃_conv" "prove_∃_rule";
	val dummy = if is_nil (asms res)
		then ()
		else fail "prove_∃_rule" 51022 [
			fn () => string_of_term tm,
			fn () => string_of_thm res];
	val (lhs,rhs) = dest_⇔ (concl res)
		handle complaint =>
		divert complaint "dest_⇔" "prove_∃_rule" 51022 [
			fn () => string_of_term tm,
			fn () => string_of_thm res];
in
	if (rhs =$ mk_t) andalso (lhs ~=$ tm)
	then ⇔_t_elim(eq_trans_rule (refl_conv tm) res)
	else fail "prove_∃_rule" 51022 [
			fn () => string_of_term tm,
			fn () => string_of_thm res]
end);
=TEX
\subsection {Pruning the Theory Hierarchy}
=SML
local
	fun aux [] = fail "" 0 []
	| aux (a::x) = (open_theory a; a)
		handle (Fail _) => aux x;
	fun inscope athy = (
	let 	val {inscope = inscope,...} =
		get_theory_info athy;
	in
		inscope
	end
	handle complaint =>
	pass_on complaint "pp'get_theory_info" "force_delete_theory");

	fun cannot_delete athy = (
	let 	val {status = status, inscope = inscope,...} =
		get_theory_info athy;
	in
		inscope orelse not(status = TSNormal)
	end);
	fun delete_loop [] = ()
	| delete_loop td = (
	let val deleted = mapfilter (fn nm => (delete_theory nm;nm)) td;
	in
		if is_nil deleted
		then error "force_delete_theory" 51004 [fn () =>
			format_list (Combinators.I)
			td ", "]
		else delete_loop (td diff deleted)
	end);
in
fun ⦏force_delete_theory⦎ (thy : string) = (
let	val dthy = if thy = "-"
		then get_current_theory_name()
		else thy;
	val ctn = get_current_theory_name();
	val ct_changes = if inscope dthy
		then (let val par = get_parents dthy;
		in
			(Value (aux par))
			handle (Fail _) =>
			(case par of
			[] => fail "force_delete_theory" 51008 [fn () => dthy]
			| [nm] => fail "force_delete_theory" 51006 [fn () => nm, fn () => dthy]
			| _ => fail "force_delete_theory" 51002
				[fn () => (format_list (Combinators.I) par ", "),
				 fn () => dthy])
		end)
		else Nil;
	val to_delete = get_descendants dthy
		handle complaint =>
		pass_on complaint "get_descendants" "force_delete_theory";
	val dummy = (case (filter cannot_delete to_delete) of
		[] => ()
		| [nm] => (open_theory ctn;
			fail "force_delete_theory" 51007 [fn () => nm])
		| nd => (open_theory ctn;
			fail "force_delete_theory" 51003 [fn () =>
			format_list (Combinators.I) nd ", "]));
	val dummy = (case ct_changes of
		Nil => (if to_delete = [thy]
			then ()
			else (diag_line(get_error_message 51013 [
			format_list (Combinators.I) to_delete ", "])))
		| Value nct => diag_line(get_error_message 51009 [
			format_list (Combinators.I) to_delete ", ",
			ctn,
			nct]));

	val dummy = delete_loop to_delete;
	val to_delete_mod = map (fn nm => get_error_message 51018 [nm]) to_delete;

	fun delete_pcs [] = ()
	| delete_pcs ((nm,thy) :: x) = (
		if thy mem to_delete_mod
		then (delete_pc nm; delete_pcs x)
		else delete_pcs x
	);
	val dummy = delete_pcs (get_pcs());
in
	()
end);
end;
=TEX	
\section{END OF SIGNATURE}
=SML
val _ = open_theory lthy;
end; (* of structure ProofContext *)
open ProofContext;
=TEX
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}

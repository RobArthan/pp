=IGN
********************************************************************************
imp012.doc: this file is part of the PPHol system

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

\def\Title{Implementation for the Interface to the Abstract Data Type $THM$}

\def\AbstractText{}

\def\Reference{DS/FMU/IED/IMP012}

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
%% LaTeX2e port: \TPPtitle{Implementation for the Interface to the Abstract Data Type $THM$}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Implementation for the \cr Interface to the Abstract Data Type $THM$}
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP012}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 2.46 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2014/04/12 16:03:18 $ %
%% LaTeX2e port: }}  %% Mandatory field
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: %\TPPstatus{Approved}
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.~Blackburn & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
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
\item [Issues 1.1 (1991/05/20) to 1.17 (1991/09/27)]
First drafts, leading up to desk check ID0083, and responses.
\item [Issue 2.1 (1991/09/27) (27th September 1991)]
Approved version of issue 1.17.

\item[Issue 2.2 (1992/01/20), \FormatDate{92/01/20} ] Updated to use new fonts.

\item[Issue 2.3 (1992/01/27) (23rd January 1992)]
$new\_axiom$, $simple\_new\_type\_defn$, $new\-\_type\-\_defn$
all changed to take lists of keys, rather than single ones.
\item [Issue 2.4 (1992/04/09) (1st April 1992)]
Changes required by CR0016.
\item [Issue 2.5 (1992/04/14) (13th April 1992)]
Changes due to CR0017.
\item [Issue 2.6 (1992/05/26)(26th May 1992)]
Renamings from version 1.5 of DS/FMU/IED/WRK038.
\item [Issue 2.7 (1992/07/31),2.8 (1992/08/03) (31st July 1992)]
Added $do\_in\_theory$.
\item [Issue 2.9 (1992/12/15) (14th December 1992)]
Added $pending\_reset\_ksc\_functions$.
\item [Issue 2.10 (1993/02/18) (18th February 1993)]
$delete\_const$ will now delete constant at head of application.
\item [Issues 2.11 (1993/08/16)-2.12 (1993/08/16) (16th August 1993)]
Added type, term and theorem compactification.
\item [Issue 2.13 (1993/12/09) (8th December 1993)]
Added $get\_theory\_names$.
\item [Issue 2.14 (2001/08/09) (9th August 2001)]
Implemented caching for {\it get\_defn}, {\it get\_thm} and {\it get\_axiom}.
\item[Issue 2.15 (2002/06/03)]
Allowed for use of ordered efficient dictionaries in theory data type.
\item[Issue 2.16 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 2.17 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 2.18 (2002/12/11)] Removed unnecessary level of indirection from the {\it USER\_DATA} data type.
\item[Issues 2.19 (2002/12/13)--2.22 (2002/12/15)] Introduced checkpointing.
\item[Issue 2.23 (2003/01/17)] Relaxed restrictions on checkpointing.
\item[Issue 2.24 (2005/04/18)] Interfaces to the kernel inference rules are now here in the kernel interface module.
\item[Issue 2.25 (2005/04/24)] Now uses {\tt app} rather than {\tt map} when appropriate.
\item[Issue 2.26 (2005/09/02)] Recoded {\em get\_descendants} along the lines of {\em get\_ancestors} for efficiency.
Tidied up some aspects of {\em get\_ancestors} and {\em rollback}.
\item[Issue 2.27 (2005/09/05)] Now exploits new {\em key\_mk\_const} {\em key\_mk\_ctype} functions.
\item[Issue 2.28 (2005/09/07)] Added functions {\em get\_const\_keys} and {\em get\_type\_keys}.
\item[Issue 2.29 (2005/09/21)] Adjustments for SML/NJ.
\item[Issues 2.30 (2005/12/14)--2.32 (2005/12/15)] Kernel interface and symbol table reform.
\item[Issue 2.33 (2005/12/16)] Now using $pp'$ instead of $pp'$ to prefix private interface names.
\item[Issues 2,34, 2.35 (2005/12/16)] The prefix for private interfaces is now $pp'$ rather than $icl'$.
\item[Issue 2.36 (2005/12/16)] Fixed {\em duplicate\_theory} and made {\em delete\_to\_level} available for external use.
\item[Issue 2.37 (2005/12/16)] Interface tables are now implemented as a list of dictionaries, one for each ancestor.
\item[Issue 2.38 (2006/01/26)] Fixed silly in {\em new\_spec}.
\item[Issues 2.39 (2006/02/06), 2.40 (2007/05/21)] Default compactification mask is now compiler-dependent (Poly/ML is better without compactification these days).
\item[Issue 2.41 (2007/05/28)] Fixes for SML/NJ build.
\item[Issue 2.42 (2009/11/25)] Suppressed pretty-printing of the abstype.
\item[Issue 2.43 (2013/11/21)] Added {\em delete\_kernel\_inference\_fun}.
\item[Issue 2.44 (2014/01/10)] Can now delete kernel state change monitoring functions.
\item[Issue 2.45 (2014/03/09)] Fixed silly design error in {\em register}: we don't want it to recycle keys.
\item[Issues 2.46 (2014/04/12)]
=INLINEFT
simple_new_defn
=TEX
\ has been replaced by
=INLINEFT
gen_new_spec
=TEX
.
\item[Issue 2.47 (2014/04/14)] Added
=INLINEFT
new_spec1
=TEX
\ so that we can demonstrate that
=INLINEFT
gen_new_spec
=TEX
\ is capable of simulating the functionality of
=INLINEFT
new_spec
=TEX
.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.
\item[2014/09/07]
The rollback function now makes the rollback theory current on exit (as the design says it should).
Note: the fix is tested in \cite{LEMMA/IED/INT008}.

\item[2015/04/17]
Ported to Lemma 1 document template.

\item[2015/08/03]
Added more aggressive rollback function.

%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
None.
\section{GENERAL}
\subsection{Scope}
This document contains an implementation of the interface to the abstract data type $THM$, in particular the theory management material.
This does not however include the
primitive and built-in inference rules, which may be found in
\cite{DS/FMU/IED/DTD007}.
This is called for in section 4 of \cite{DS/FMU/IED/HLD007}.
The high-level specification for the code is
given in \cite{DS/FMU/IED/SPC003}, \cite{DS/FMU/IED/SPC004} and \cite{DS/FMU/IED/SPC005}.
The design is in \cite{DS/FMU/IED/DTD012}.
\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains an implementation of the interface to the abstract data type $THM$, in particular the theory management material.
The interface is to provide a user- and implementor- friendly
interface to the Kernel of the system, as the kernel is designed
with only correctness, functionality and compactness in mind.
\subsubsection{Dependencies}
This document takes its signature from \cite{DS/FMU/IED/DTD012},
and also requires those files indicated as preceding it in the
rel001 makefile.
\subsubsection{Deficiencies}
None known.
\subsubsection{Possible Enhancements}
None known.
\newpage
\section{PREAMBLE}
We first start the structure:
=SML
structure KernelInterface : KernelInterface = struct
=TEX
Then we open up the Kernel:
=SML
open pp'Kernel;
=TEX
It is convenient to provide the following function ``out of order'':
=SML
fun ⦏get_current_theory_name⦎ (() : unit) : string = (
	pp'get_theory_name(pp'get_current_theory_name ())
);
=TEX
\subsection{GLOBAL TABLES}
We maintain several tables that give information about the whole theory hierarchy.
These must be kept in step with the actual theory hierarchy.
If operations of various sorts are interrupted, then these tables must be rebuilt.
The tables comprise the following imperative components:
\begin{itemize}
\item a flag indicating whether or not the information is clean,
\item a dictionary mapping constant names to the internal names of theories that contain a constant of that name,
\item a dictionary mapping type names to the internal names of theories that contain a type of that name,
\item a dictionary mapping theory names to the internal theory numbers,
\item an array (indexed by internal theory numbers) of flags indicating which theories are in scope.
\end{itemize}

The clean flag must be set false before a kernel state changing operation is invoked and also before making multiple updates to the tables (including updates to the in-scope array).
=SML
type ⦏MASTER_TABLES⦎ = {
	clean_flag : bool ref,
	const_thys : int list E_DICT list ref,
	type_thys: int list E_DICT list ref,
	int_thy_names : int E_DICT ref,
	in_scope : bool DynamicArray.DYNAMIC_ARRAY};
=TEX
=SML	
val ⦏global_tables⦎ : MASTER_TABLES = {
	clean_flag = ref false,
	const_thys = ref [initial_e_dict],
	type_thys = ref [initial_e_dict],
	int_thy_names = ref initial_e_dict,
	in_scope = DynamicArray.array 100};
=TEX
=SML
fun ⦏scratch_global_tables⦎ (():unit) : unit = (
	#clean_flag global_tables := false;
	#const_thys global_tables := [];
	#type_thys global_tables := [];
	#int_thy_names global_tables := initial_e_dict;
	DynamicArray.scratch(#in_scope global_tables)
);
=TEX
=SML
fun ⦏pp'new_kernel_interface_tables⦎ (():unit) : unit = (
	#const_thys global_tables :=
		initial_e_dict :: !(#const_thys global_tables);
	#type_thys global_tables :=
		initial_e_dict :: !(#type_thys global_tables)
);
=TEX
=SML
fun ⦏set_clean_flag⦎ (b : bool)  : bool = (
	let	val old = !(#clean_flag global_tables);
	in	#clean_flag global_tables := b;
		old
	end
);
=TEX
=SML
fun ⦏le_lookup⦎
	(key : string)
	([] : 'a E_DICT list) : 'a OPT = Nil
|   le_lookup key (dict :: dicts) = (
	case e_lookup key dict of
		Nil => le_lookup key dicts
	|	got_it => got_it
);
=TEX
=SML
fun ⦏le_enter⦎
	(key : string)
	(what : 'a)
	(dicts : 'a E_DICT list) : 'a E_DICT list = (
	case dicts of
		(dict::more) => e_enter key what dict::more
	|	[] => [e_enter key what initial_e_dict]
);
=TEX
=SML
fun ⦏le_delete⦎
	(key : string)
	(dicts : 'a E_DICT list) : 'a E_DICT list = (
	let	fun check_delete d = (
			case e_lookup key d of
				Nil => d
			|	Value _ => e_delete key d
		);
	in	case dicts of
			(dict::more) => e_delete key dict :: map check_delete more
		|	_ => []
	end
);
=TEX
Registering a constant involves a single update:
=SML
fun ⦏register_const⦎ (thyn : int) (cname : string) : unit = (
	#const_thys global_tables :=
	le_enter cname
	(case le_lookup cname (!(#const_thys global_tables)) of
		Value thyns => thyns grab thyn
	|	Nil => [thyn])
	(!(#const_thys global_tables))
);
=TEX
=SML
fun ⦏register_new_const⦎ (cname : string) : unit = (
	register_const (pp'get_current_theory_name()) cname
);
=TEX
Unregistering a constant involves a single update:
=SML
fun ⦏unregister_const⦎ (thyn : int) (cname : string) : unit = (
	#const_thys global_tables :=
	le_enter cname
	(case le_lookup cname (!(#const_thys global_tables)) of
		Value thyns => thyns less thyn
	|	Nil => [thyn])
	(!(#const_thys global_tables))
);
=TEX
=SML
fun ⦏register_delete_const⦎ (cname : string) : unit = (
	unregister_const (pp'get_current_theory_name()) cname
);
=TEX
Registering a type involves a single update:
=SML
fun ⦏register_type⦎ (thyn : int) (tyname : string) : unit = (
	#type_thys global_tables :=
	le_enter tyname
	(case le_lookup tyname (!(#type_thys global_tables)) of
		Value thyns => thyns grab thyn
	|	Nil => [thyn])
	(!(#type_thys global_tables))
);
=TEX
=SML
fun ⦏register_new_type⦎ (tyname : string) : unit = (
	register_type (pp'get_current_theory_name()) tyname
);
=TEX
Unregistering a type involves a single update:
=SML
fun ⦏unregister_type⦎ (thyn : int) (tyname : string) : unit = (
	#type_thys global_tables :=
	le_enter tyname
	(case le_lookup tyname (!(#type_thys global_tables)) of
		Value thyns => thyns less thyn
	|	Nil => [thyn])
	(!(#type_thys global_tables))
);
=TEX
=SML
fun ⦏register_delete_type⦎ (tyname : string) : unit = (
	unregister_type (pp'get_current_theory_name()) tyname
);
=TEX
Registering a theory involves a single update:
=SML
fun ⦏register_theory⦎ (name : string, iname : int) : unit = (
	#int_thy_names global_tables :=
	e_enter name iname (!(#int_thy_names global_tables))
);
=TEX
Reetting the in-scope array involves a multiple update:
=SML
fun ⦏reset_in_scope⦎ (() : unit) : unit = (
	let	val old  = set_clean_flag false;
		val top = DynamicArray.uindex (#in_scope global_tables);
		fun aux1 i = (
			if	i <= top
			then	(DynamicArray.update(#in_scope global_tables, i, false);
				aux1 (i+1))
			else	()
		);
		fun aux2 [] = ()
		|   aux2 (i::more) = (
			DynamicArray.update(#in_scope global_tables, i, true);
			aux2 more
		);
		val cur_thy = pp'get_current_theory_name();
	in	aux1 0;
		aux2 (pp'get_ancestors cur_thy);
		set_clean_flag old;
		()
	end
);
=TEX
Updating the in-scope array involves a multiple update:
=SML
fun ⦏update_in_scope⦎ (inthyl : int list, outthyl : int list)
	: unit = (
	let	val old = set_clean_flag false;
		fun aux _ [] = ()
		|   aux b (i::more) = (
			DynamicArray.update(#in_scope global_tables, i, b);
			aux b more
		);
	in	aux true inthyl;
		aux false outthyl;
		set_clean_flag old;
		()
	end
);
=TEX
=SML
fun ⦏rebuild_global_tables⦎ (():unit) : unit = (
	let	val _ = scratch_global_tables();
		val thys = 0 :: pp'get_descendants 0;
		fun do_thy thyn = (
			let	val {con_env, ty_env, ...} = pp'get_theory thyn;
				val {name, ...} = pp'get_theory_info thyn;
				val do_const = register_const thyn;
				val do_type = register_type thyn;
			in	app (fn (n, _) => do_const n)
				(oe_flatten con_env);
				app (fn (n, _) => do_type n)
				(oe_flatten ty_env);
				register_theory (name, thyn)
			end
		);
	in	reset_in_scope();
		app do_thy thys;
		set_clean_flag true;
		()
	end
);
=TEX
=SML
fun ⦏build_global_tables_from_theory⦎ (thyn : int) : unit = (
	let	val {con_env, ty_env, ...} = pp'get_theory thyn;
		val {name, ...} = pp'get_theory_info thyn;
		val do_const = register_const thyn;
		val do_type = register_type thyn;
	in	app (fn (n, _) => do_const n)
		(oe_flatten con_env);
		app (fn (n, _) => do_type n)
		(oe_flatten ty_env);
		register_theory (name, thyn)
	end
);
=TEX
=SML
fun ⦏rebuild_global_tables_from_current_theory⦎ (():unit) : unit = (
	build_global_tables_from_theory(pp'get_current_theory_name())
);
=TEX
It is caller's responsibility to manipulate the clean flag appropriately around a call to the following function:
=SML
fun ⦏delete_theory_from_global_tables⦎ (thyn : int) : unit = (
	let	val {con_env, ty_env, ...} = pp'get_theory thyn;
		val {name, ...} = pp'get_theory_info thyn;
		val consts = map fst(oe_flatten con_env);
		val types = map fst(oe_flatten con_env);
		fun folder (n, dicts) = (
			case le_lookup n dicts of
				Nil => dicts
			|	Value thyns => (
				case thyns less thyn of
					[] => (
					le_delete n dicts
				) |	some => (
					le_enter n some dicts
				)
			)
		);
	in	#const_thys global_tables :=
			fold folder consts
				(!(#const_thys global_tables));
		#type_thys global_tables :=
			fold folder consts
				(!(#type_thys global_tables));
		#int_thy_names global_tables :=
			e_delete name (!(#int_thy_names global_tables));
		()
	end
);
=TEX
=SML
fun ⦏check_clean⦎ (caller : string) : unit = (
	if	! (#clean_flag global_tables)
	then	()
	else	(comment caller 12203 [];
		rebuild_global_tables())
);
=TEX
=SML
fun ⦏get_internal_theory_name⦎ (_ : string)
	("-" : string) : int = (
	pp'get_current_theory_name()
) | get_internal_theory_name caller thy = (
	let	val _ = check_clean caller;
	in	case e_lookup thy (!(#int_thy_names global_tables)) of
			Value thyn => thyn
		|	Nil => fail caller 12035 [fn () => thy]
	end
);
=TEX
\section{NOTIFICATION OF STATE CHANGES}
As any operation that changes the kernel state must notify
the list of functions managed by the functions $on\_kernel\_state\_change$,
we need to provide that material first.

First the type itself:
=SML
datatype ⦏KERNEL_STATE_CHANGE⦎
		=	⦏OpenTheory⦎ of string * ((string list) * (string list))
		|	⦏DeleteTheory⦎ of string
		|	⦏NewTheory⦎ of string
		|	⦏NewParent⦎ of string * (string list)
		|	⦏LockTheory⦎ of string
		|	⦏UnlockTheory⦎ of string
		|	⦏DuplicateTheory⦎ of string * string
		|	⦏SaveThm⦎ of string * THM
		|	⦏ListSaveThm⦎ of string list * THM
		|	⦏DeleteConst⦎ of TERM
		|	⦏DeleteType⦎ of string
		|	⦏DeleteAxiom⦎ of string
		|	⦏DeleteThm⦎ of string
		|	⦏NewAxiom⦎ of ((string list * TERM)*THM)
		|	⦏NewConst⦎ of string * TYPE
		|	⦏NewType⦎ of string * int
		|	⦏GenNewSpec⦎ of (string list * THM) * THM
		|	⦏NewTypeDefn⦎ of (string list * string * (string list) * THM) * THM
		|	⦏NewSpec⦎ of (string list * int * THM) * THM
		|	⦏SetUserDatum⦎ of string * USER_DATUM;

=TEX
The following functions manage registration and unregistrations of the various
monitor functions.
=SML
fun ⦏register⦎ (r : {tidemark : int, funs : (int * 'a) list} ref) (f : 'a) : int = (
	let	val {tidemark, funs} = !r;
		val k = tidemark + 1;
	in	r := {tidemark = k, funs = funs @ [(k, f)]};
		k
	end
);
=TEX
=SML
fun ⦏unregister⦎ (caller : string) (errno : int)
	(r : {tidemark : int, funs : (int * 'a) list} ref) (k : int) : unit = (
	let	val  {tidemark, funs} = !r;
	in	if	any funs (fn (i, _) => i = k)
		then	r := {tidemark = tidemark, funs = funs drop (fn (i, _) => i = k)}
		else	fail caller errno []
	end
);
=TEX
=SML
val ⦏on_ksc_functions⦎ : {tidemark : int, funs : (int * (KERNEL_STATE_CHANGE -> unit)) list} ref =
	ref {tidemark = ~1, funs = []};
datatype ⦏OKSC_KEY⦎ = ⦏OKSCKey⦎ of int;
=TEX
=SML
fun ⦏on_kernel_state_change⦎ (to_notify : KERNEL_STATE_CHANGE -> unit)
	: OKSC_KEY = (
	OKSCKey(register on_ksc_functions to_notify)
);
=TEX
=SML
fun ⦏delete_on_kernel_state_change_fun⦎ (OKSCKey k : OKSC_KEY)
	: unit = (
	unregister "delete_on_kernel_state_change_fun" 12050 on_ksc_functions k
);
=TEX
=SML
fun ⦏notify_on_ksc⦎ (ksc : KERNEL_STATE_CHANGE) : unit = (
	(app (fn (_, f) => f ksc) o #funs o !) on_ksc_functions
);
=SML
val ⦏before_ksc_functions⦎ : {tidemark : int, funs : (int * (KERNEL_STATE_CHANGE -> unit)) list} ref =
	ref {tidemark = ~1, funs = []};
datatype ⦏BKSC_KEY⦎ = ⦏BKSCKey⦎ of int;
=TEX
=SML
fun ⦏before_kernel_state_change⦎ (to_notify : KERNEL_STATE_CHANGE -> unit)
	: BKSC_KEY = (
	BKSCKey(register before_ksc_functions to_notify)
);
=TEX
=SML
fun ⦏delete_before_kernel_state_change_fun⦎ (BKSCKey k : BKSC_KEY)
	: unit = (
	unregister "delete_before_kernel_state_change_fun" 12051 before_ksc_functions k
);
=TEX
=SML
fun ⦏notify_before_ksc⦎ (ksc : KERNEL_STATE_CHANGE) : unit = (
	(app (fn (_, f) => f ksc) o #funs o !) before_ksc_functions
);
=TEX
\subsection{Temporary Working in Other Theories}
Note the multiple attempts to catch errors that are not from $fail$ or $error$ (e.g., worth trying if tere are several interrupts queued, perhaps).
=SML
fun ⦏do_in_theory⦎ (thy: string) (f : 'a -> 'b) (arg : 'a) : 'b = (
let	val curr_theory = pp'get_current_theory_name();
	val thyn = get_internal_theory_name "do_in_theory" thy;
	val was_before_ksc_functions = (!before_ksc_functions);
	fun stop_theory_change (OpenTheory _: KERNEL_STATE_CHANGE): unit = (
		error "do_in_theory" 12011 []
	) | stop_theory_change (NewTheory _) = (
		error "do_in_theory" 12011 []
	) | stop_theory_change (DeleteTheory _) = (
		error "do_in_theory" 12011 []
	) | stop_theory_change _ = ();
	fun go_back_to_curr_theory () = (
		let	val _ = check_clean "do_in_theory";
			val side = (before_ksc_functions := was_before_ksc_functions);
			val _ = set_clean_flag false;
			val ot_res2 = (pp'open_theory curr_theory
				handle (Error _) =>
				error "do_in_theory" 12013 []
				handle (Fail _) =>
				error "do_in_theory" 12013 []);
			val _ = update_in_scope ot_res2;
			val _ = set_clean_flag true;
		in	()
		end
	);

in
	let	val _ = check_clean "do_in_theory";
		val _ = set_clean_flag false;
		val ot_res1 = pp'open_theory thyn;
		val _ = update_in_scope ot_res1;
		val _ = set_clean_flag true;
		val side = before_kernel_state_change stop_theory_change;
		val result = f arg;
		val _ = go_back_to_curr_theory ()
	in
		result
	end
	handle ex => (
		go_back_to_curr_theory ();
		raise ex)
	handle ex => (case ex of
		(Fail _) => raise ex
		| (Error _) => raise ex
		| _ => (
		go_back_to_curr_theory ();
		raise ex))
	handle ex => (case ex of
		(Fail _) => raise ex
		| (Error _) => raise ex
		| _ => (
		go_back_to_curr_theory ();
		raise ex))
	handle ex => (case ex of
		(Fail _) => raise ex
		| (Error _) => raise ex
		| _ => (
		go_back_to_curr_theory ();
		raise ex))
	end);
=TEX
\section{THEORY MANAGEMENT OPERATIONS}
=TEX
\subsection{Operations on Theory Attributes}

=SML
fun ⦏open_theory⦎ (nm : string) : unit = (
let	val _ = notify_before_ksc (OpenTheory (nm, ([],[])));
	val thyn = get_internal_theory_name "open_theory" nm;
	val _ = check_clean "open_theory";
	val _ = set_clean_flag false;
	val ot_res = pp'open_theory thyn
		handle ex => (set_clean_flag true; raise ex);
	val _ = update_in_scope ot_res;
	val _ = set_clean_flag true;
	val ot_res' = (map pp'get_theory_name ** map pp'get_theory_name) ot_res;
in
	notify_on_ksc (OpenTheory (nm, ot_res'));
	()
end
handle complaint => pass_on complaint "pp'open_theory" "open_theory");
=TEX
=SML
fun ⦏delete_theory⦎ (nm : string) : unit = (
let	val _ = notify_before_ksc (DeleteTheory nm);
	val thyn = get_internal_theory_name "delete_theory" nm;
	val _ = check_clean "delete_theory" ;
	val _ = set_clean_flag false;
	val _ = delete_theory_from_global_tables thyn;
	val _ = pp'delete_theory thyn;
	val _ = set_clean_flag true;
in
	notify_on_ksc (DeleteTheory nm);
	()
end
handle complaint => pass_on complaint "pp'delete_theory" "delete_theory");
=TEX
=SML
fun ⦏new_theory⦎ (nm : string) : unit = (
let	val _ = notify_before_ksc (NewTheory nm);
	val _ = check_clean "new_theory";
	val _ = set_clean_flag false;
	val thyn = pp'new_theory nm
		handle ex => (set_clean_flag true; raise ex);
	val _ = register_theory(nm, thyn);
	val ot_res = pp'open_theory thyn;
	val _ = update_in_scope ot_res;
	val _ = set_clean_flag true;
in
	notify_on_ksc (NewTheory nm);
	()
end
handle complaint => pass_on complaint "pp'new_theory" "new_theory");
=TEX
=SML
fun ⦏new_parent⦎ (nm : string) : unit = (
let	val _ = notify_before_ksc (NewParent (nm, []));
	val thyn = get_internal_theory_name "new_parent" nm;
	val _ = check_clean "new_parent";
	val _ = set_clean_flag false;
	val np_res = pp'new_parent thyn
		handle ex => (set_clean_flag true; raise ex);
	val _ = update_in_scope(np_res, []);
	val _ = set_clean_flag true;
	val np_res' = map pp'get_theory_name np_res;
in
	notify_on_ksc (NewParent (nm, np_res'));
	()
end
handle complaint => pass_on complaint "pp'new_parent" "new_parent");
=TEX
=SML
fun ⦏lock_theory⦎ (nm : string) : unit = (
let	val _ = notify_before_ksc (LockTheory nm);
	val thyn = get_internal_theory_name "lock_theory" nm;
	val _ = pp'lock_theory thyn;
in
	notify_on_ksc (LockTheory nm);
	()
end
handle complaint => pass_on complaint "pp'lock_theory" "lock_theory");
=TEX
=SML
fun ⦏unlock_theory⦎ (nm : string) : unit = (
let	val _ = notify_before_ksc (UnlockTheory nm);
	val thyn = get_internal_theory_name "unlock_theory" nm;
	val _ = pp'unlock_theory thyn;
in
	notify_on_ksc (UnlockTheory nm);
	()
end
handle complaint => pass_on complaint "pp'unlock_theory" "unlock_theory");
=TEX
=SML
fun ⦏duplicate_theory⦎ (fromnm : string, tonm : string) : unit = (
let	val _ = notify_before_ksc (DuplicateTheory (fromnm, ""));
	val fromn = get_internal_theory_name "duplicate_theory" fromnm;
	val _ = check_clean "duplicate_theory";
	val _ = set_clean_flag false;
	val ton = pp'duplicate_theory fromn tonm
		handle ex => (set_clean_flag true; raise ex);
	val _ = register_theory(tonm, ton);
	val _ = build_global_tables_from_theory ton;
	val _ = set_clean_flag true;
in
	notify_on_ksc (DuplicateTheory (fromnm, tonm));
	()
end
handle complaint => pass_on complaint "pp'duplicate_theory" "duplicate_theory");
=TEX
\section{INFERENCE RULES}
=SML
datatype ⦏KERNEL_INFERENCE⦎ =
		⦏KISubstRule⦎ of (THM * TERM) list * TERM * THM * THM
	|	⦏KISimpleλEqRule⦎ of TERM * THM * THM
	|	⦏KIInstTypeRule⦎ of (TYPE * TYPE) list * THM * THM
	|	⦏KI⇒Intro⦎ of TERM * THM * THM
	|	⦏KI⇒Elim⦎ of THM * THM * THM
	|	⦏KIAsmRule⦎ of TERM * THM
	|	⦏KIReflConv⦎ of TERM * THM
	|	⦏KISimpleβConv⦎ of TERM * THM
	|	⦏KISucConv⦎ of TERM * THM
	|	⦏KIStringConv⦎ of TERM * THM
	|	⦏KICharConv⦎ of TERM * THM
	|	⦏KIEqSymRule⦎ of THM * THM
	|	⦏KIListSimple∀Elim⦎ of TERM list * THM * THM
	|	⦏KIEqTransRule⦎ of THM * THM * THM
	|	⦏KIMkAppRule⦎ of THM * THM * THM
	|	⦏KI⇔MPRule⦎ of THM * THM * THM
	|	⦏KISimple∀Intro⦎ of TERM * THM * THM
	|	⦏KIInstTermRule⦎ of (TERM * TERM) list * THM * THM
	|	⦏KIPlusConv⦎ of TERM * THM;
=TEX
=SML
val ⦏kernel_inference_funs⦎ : {tidemark : int, funs : (int * (KERNEL_INFERENCE -> unit)) list} ref =
	ref {tidemark = ~1, funs = []};
datatype ⦏KI_KEY⦎ = ⦏KIKey⦎ of int;
=TEX
=SML
fun ⦏on_kernel_inference⦎ (f : KERNEL_INFERENCE -> unit) : KI_KEY = (
	KIKey(register kernel_inference_funs f)
);
=TEX
=SML
fun ⦏delete_kernel_inference_fun⦎ (KIKey k : KI_KEY) : unit = (
	unregister "delete_kernel_inference_fun" 12301 kernel_inference_funs k
);
=TEX
=SML
fun ⦏ki_notify⦎ (ki : KERNEL_INFERENCE) : unit = (
	(app (fn (_, f) => f ki) o #funs o !) kernel_inference_funs
);
=TEX
=SML
val ⦏subst_rule⦎ : (THM * TERM) list -> TERM -> THM -> THM = (
	fn thm_var_list =>
	let	val rule = pp'subst_rule thm_var_list
	in	fn template =>
		fn ithm =>
		let	val res = rule template ithm;
		in	prof "subst_rule";
			ki_notify(KISubstRule (thm_var_list, template, ithm, res));
			res
		end
	end
);
=TEX
=SML
val ⦏simple_λ_eq_rule⦎ : TERM -> THM -> THM = (
	fn absvar =>
	fn thrm =>
	let	val res = pp'simple_λ_eq_rule absvar thrm;
	in	prof "simple_λ_eq_rule";
		ki_notify(KISimpleλEqRule(absvar, thrm, res));
		res
	end
);
=TEX
=SML
val ⦏inst_type_rule⦎ : (TYPE * TYPE) list -> THM -> THM = (
	fn talist =>
	fn thrm =>
	let	val res = pp'inst_type_rule talist thrm;
	in	prof "inst_type_rule";
		ki_notify(KIInstTypeRule(talist, thrm, res));
		res
	end
);
=TEX
=SML
val ⦏⇒_intro⦎ : TERM -> THM -> THM = (
	fn asm =>
	fn thrm =>
	let	val res = pp'⇒_intro asm thrm;
	in	prof "⇒_intro";
		ki_notify(KI⇒Intro(asm, thrm, res));
		res
	end
);
=TEX
=SML
val ⦏⇒_elim⦎ : THM -> THM -> THM = (
	fn thrm1 =>
	fn thrm2 =>
	let	val res = pp'⇒_elim thrm1 thrm2;
	in	prof "⇒_elim";
		ki_notify(KI⇒Elim(thrm1, thrm2, res));
		res
	end
);
=TEX
=SML
val ⦏asm_rule⦎ : TERM -> THM = (
	fn tm =>
	let	val res = pp'asm_rule tm;
	in	prof "asm_rule";
		ki_notify(KIAsmRule(tm, res));
		res
	end
);
=TEX
=SML
val ⦏refl_conv⦎ : CONV = (
	fn tm =>
	let	val res = pp'refl_conv tm;
	in	prof "refl_conv";
		ki_notify(KIReflConv(tm, res));
		res
	end
);
=TEX
=SML
val ⦏simple_β_conv⦎ : CONV = (
	fn tm =>
	let	val res = pp'simple_β_conv tm;
	in	prof "simple_β_conv";
		ki_notify(KISimpleβConv(tm, res));
		res
	end
);
=TEX
=SML
val ⦏prim_suc_conv⦎ : CONV = (
	fn tm =>
	let	val res = pp'suc_conv tm;
	in	prof "prim_suc_conv";
		ki_notify(KISucConv(tm, res));
		res
	end
);
=TEX
=SML
val ⦏string_conv⦎ : CONV = (
	fn tm =>
	let	val res = pp'string_conv tm;
	in	prof "string_conv";
		ki_notify(KIStringConv(tm, res));
		res
	end
);
=TEX
=SML
val ⦏char_conv⦎ : CONV = (
	fn tm =>
	let	val res = pp'char_conv tm;
	in	prof "char_conv";
		ki_notify(KICharConv(tm, res));
		res
	end
);
=TEX
=SML
val ⦏eq_sym_rule⦎ : THM -> THM = (
	fn thrm =>
	let	val res = pp'eq_sym_rule thrm;
	in	prof "eq_sym_rule";
		ki_notify(KIEqSymRule(thrm, res));
		res
	end
);
=TEX
=SML
val ⦏list_simple_∀_elim⦎ : TERM list -> THM -> THM = (
	fn tml =>
	fn thrm =>
	let	val res = pp'list_simple_∀_elim tml thrm;
	in	prof "list_simple_∀_elim";
		ki_notify(KIListSimple∀Elim(tml, thrm, res));
		res
	end
);
=TEX
=SML
val ⦏eq_trans_rule⦎ : THM -> THM -> THM = (
	fn thrm1 =>
	fn thrm2 =>
	let	val res = pp'eq_trans_rule thrm1 thrm2;
	in	prof "eq_trans_rule";
		ki_notify(KIEqTransRule(thrm1, thrm2, res));
		res
	end
);
=TEX
=SML
val ⦏mk_app_rule⦎ : THM -> THM -> THM = (
	fn thrm1 =>
	fn thrm2 =>
	let	val res = pp'mk_app_rule thrm1 thrm2;
	in	prof "mk_app_rule";
		ki_notify(KIMkAppRule(thrm1, thrm2, res));
		res
	end
);
=TEX
=SML
val ⦏⇔_mp_rule⦎ : THM -> THM -> THM = (
	fn thrm1 =>
	fn thrm2 =>
	let	val res = pp'⇔_mp_rule thrm1 thrm2;
	in	prof "⇔_mp_rule";
		ki_notify(KI⇔MPRule(thrm1, thrm2, res));
		res
	end
);
=TEX
=SML
val ⦏simple_∀_intro⦎ : TERM -> THM -> THM = (
	fn tm =>
	fn thrm =>
	let	val res = pp'simple_∀_intro tm thrm;
	in	prof "simple_∀_intro";
		ki_notify(KISimple∀Intro(tm, thrm, res));
		res
	end
);
=TEX
=SML
val ⦏inst_term_rule⦎ : (TERM * TERM) list -> THM -> THM = (
	fn tvl =>
	fn thrm =>
	let	val res = pp'inst_term_rule tvl thrm;
	in	prof "inst_term_rule";
		ki_notify(KIInstTermRule(tvl, thrm, res));
		res
	end
);
=TEX
=SML
val ⦏plus_conv⦎ : CONV = (
	fn tm =>
	let	val res = pp'plus_conv tm;
	in	prof "plus_conv";
		ki_notify(KIPlusConv(tm, res));
		res
	end
);
=TEX
\section{COMPACTIFICATION}
This material is required in $save\_thm$ and thereafter and so is given next.
=TEX
Throughout the following we consider type variables just as a distinguished
sort of nullary constructors. Constructors in general are represented
as pairs: the name and its arity. The arity is required because deletion
of types allows the user to define the same constructor with different
arities at different times and we do not wish to have the extra complexity
of restructuring the database when a type is deleted. The arities are
not actually used in the algorithms except when two constructors are
compared. We may therefore adopt the convention of distinguishing type
variables from nullary constructors by pretending that their arity is $-1$.
From now on, the discussion of the algorithm will usually use the term
``constructor'' to include both type variables and constructors together
with their arities. The following ML type definition reflects this convention.
=SML
type ⦏CON⦎ = string * int;
=TEX

We use search trees to represent partial functions from types to
elements of type $'a$. The search trees are arbitrarily branching finite
trees whose edges are labelled with constructors and whose nodes are optionally
labelled with values of type $'a$.

For any type, $\tau$ consider the list, $c\sb{\tau}$ of constructors
one encounters in a post-order (a.k.a. reverse Polish) traversal of the
type. Since we consider constructors with the same name but different
arities to be different, the function sending $\tau$ to $c\sb{\tau}$ is
an injection (indeed, there is an obvious ``parsing'' function which is
a left inverse to it). To look up the value associated with $\tau$ in
a search tree, $T$, one looks for a path starting at the root of the tree
whose sequence of edge labels is $c\sb{\tau}$; if there is such a path,
then it ends at some node of the tree and the value associated
with $\tau$ is the label on that node, if any; if there is no label, then
$\tau$ is not in the domain of the function represented by $T$;
in fact, the trees we will use are so constructed that unlabelled nodes
only appear in positions which cannot be reached by such a path, so that
there always will be a label on the node if the path to it exists.

We will frequently need to carry out {\it in situ} updates of
the children of a node. We therefore use the following ML data type to
represent the trees.

=SML
datatype '_a ⦏S_TREE⦎ = ⦏Node⦎ of ('_a OPT * (CON * '_a S_TREE) list) ref;
=TEX
Given a constructor and a reference to a node, $follow$ finds the
edge leading out of the node labelled with the constructor (creating it if
necessary) and updates the reference to refer to the node which that
edge points to.
=SML
fun	⦏follow⦎
	(c : CON)
	(r as (ref (Node (n as (ref (lab, nodes))))) : '_a S_TREE ref)
	: unit = (
	(	r := lassoc3 nodes c
	)	handle	Fail _ =>
	let	val new_node = Node (ref(Nil, []));
	in	n := (lab, (c, new_node) :: nodes);
		r := new_node
	end
);
=TEX
Mainly for clarity of exposition and for testing purposes, we have formulated
the search trees to store an arbitrary imperative type. In practice,
this type will be the type $TYPE$ of HOL types.

Now we define the function to establish a value in a search tree.  In
essence, by ``establishing'' a value in a tree, we mean the operation,
parameterised by a type, $\tau$, and a value, $v$, which computes the
value associated with $\tau$ in a search tree and returns that value if
there is one, and otherwise, installs $\tau \mapsto v$ in the tree and
returns $v$. In fact, we wish to install simultaneously values to
be associated with $\tau$ and all its subtypes, and so,
the operation is parameterised by a function
which computes the values to be installed from a list of values
retrieved from the tree and a constructor. In practice, this function
will be essentially the constructor function $mk\_ctype$. For testing purposes, we
cater for an arbitrary function so that the internals of the algorithm can
be monitored more easily.

The work of the function, $establish$ is done by an auxiliary function
$aux$, which has a parameter which is a stack recording the
nodes in the tree which have been reached for each of the super-types
of the type, $\tau$, we are working on. Initially this is empty.  The
root of the tree in which we are establishing values is supplied as a
parameter.  As we pass through a constructor, a new entry
referencing the root is pushed onto the stack to allow each recursive
invocation of $establish$ to push forward the traversal for $\tau$ as
well as the component type it is working on, so that when the component
types have been processed by the recursive invocations, we are in the
right position to find, or install, the value for $\tau$ in the tree.
=SML
fun ⦏establish⦎
	(mk_v : (CON * '_a list) -> '_a) (root : '_a S_TREE) (ty : TYPE) : '_a = (
let	fun aux (stk : '_a S_TREE ref list) (ty : TYPE) : '_a = (
		let	val (con, args) = (
				case dest_simple_type ty of
					Vartype n => ((n, ~1), [])
				|	Ctype(n, args) => ((n, length args), args)
			);
			val newpath = ref root;
			val newstk = newpath :: stk;
			val rs = map (aux newstk) args;
			val side_effect = map (follow con) newstk;
			val Node(n as (ref(v, nodes))) = !newpath;
		in	case v of
				Value x => x
			|	Nil =>
					let	val res = mk_v(con, rs);
					in	n := (Value res, nodes);
						res
					end
		end
	);
in	aux [] ty
end
);
=TEX
=SML
val compactification_cache : TYPE S_TREE = Node(ref (Nil, []));
=TEX
N.b. the following assumes a check that the cache is an acyclic
graph, and might loop, if not; this should never happen in practice
given the way that the trees are constructed by $establish$ and
by $set\_compatification\_cache$.
The algorithm only delivers the types stored in the leaf nodes of the tree.
This is because types stored at internal nodes are necessarily duplicated
elsewhere in the tree.
=SML
fun ⦏get_compactification_cache⦎ () : TYPE list = (
	let	fun aux (Node (ref(_, (cts as (_ :: _))))) = (
			flat (map (aux o snd) cts)
		) | aux (Node (ref(Value ty, []))) = [ty]
		|   aux (Node (ref(Nil, []))) = [];	(* shouldn't happen *)
	in	aux compactification_cache
	end
);
=TEX
=SML
fun ⦏mk_ty⦎ ((n, i), tys) = (
	if i = ~1
	then mk_vartype n
	else mk_ctype(n, tys)
);
=TEX
=SML
val ⦏compact_type⦎ : TYPE -> TYPE = establish mk_ty compactification_cache;
=TEX
=SML
fun ⦏clear_compactification_cache⦎ () : unit = (
	let	val Node rv = compactification_cache;
	in	rv := (Nil, [])
	end
);
=TEX
=SML
fun ⦏set_compactification_cache⦎ (tys : TYPE list) : unit = (
	app (fn ty => (compact_type ty; ())) tys
);
=TEX
=SML
fun ⦏compact_term⦎ (tm : TERM) = (
	case dest_simple_term tm of
		App(f, a) => mk_app(compact_term f, compact_term a)
	|	Const (n, ty) => mk_const (n, compact_type ty)
	|	Var (n, ty) => mk_var(n, compact_type ty)
	|	Simpleλ(v, b) => mk_simple_λ(compact_term v, compact_term b)
);
=TEX
Perhaps, the following should profile the inference it does. At the moment
it does not. It assumes two things about the implementation of the primitive
rules: {\em(i)} $⇒\_intro$ must construct the conclusion of its result theorem
using the argument rather than the eliminated assumption (this is virtually
guaranteed by its specification); and, {\em(ii)}, $subst\_rule$ should
take the conclusion of its result theorem to be the template argument
if the list of substitutions is empty (the current implementation does
indeed do this).
=SML
fun ⦏compact_thm⦎ (thm : THM) : THM = (
	let	val (asms, conc) = dest_thm thm;
		val newasms = map compact_term asms;
		val newconc = compact_term conc;
		val thm2 = fold (uncurry pp'⇒_intro) newasms thm;
		fun aux [] th = th
		|   aux (asm :: more) th = aux more (pp'⇒_elim th (pp'asm_rule asm));
		val thm3 = aux newasms thm2;
		val thm4 = pp'subst_rule [] newconc thm3;
	in	thm4
	end	handle Fail _ => thm
);
=TEX
=SML
val ⦏compactification_mask⦎ : int ref = ref 0;
val side_effect =
	(new_int_control{name = "compactification_mask",
		check = fun_true,
		control=compactification_mask,
		default =
=NJML
		(fn () => 0)
=POLYML
		(fn () => 63)
=SML
}) handle Fail _ => ();
=TEX
=SML
fun ⦏compactification_mask_bit⦎ (i : int) : bool = (
	(!compactification_mask div i) mod 2 = 1
);
=TEX
=SML
fun ⦏cond_compact⦎ (i : int) (f : 'a -> 'a) (x : 'a) : 'a = (
	if	compactification_mask_bit i
	then	x
	else	f x
);
=TEX
\section{THEORY MANAGEMENT CONTINUED}
\subsection{Operations on Theory Contents}

$dest\_thm$ passes through without problem.
=SML
val ⦏asms⦎ : THM -> TERM list = fst o dest_thm;
val ⦏concl⦎ : THM -> TERM = snd o dest_thm;
=TEX
=SML
fun ⦏thm_theory⦎ (thm : THM) : string = (
let	val {theory = {name = iname,...},...} = pp'dest_thm thm;
in
	pp'get_theory_name iname
	handle complaint =>
	divert complaint "pp'get_theory_name" "thm_theory" 12007
		[fn () => string_of_thm thm,fn () => string_of_int iname]	
end);
=TEX
=SML
fun ⦏save_thm⦎ (key : string, thm : THM) : THM = (
let	val sideeffect = notify_before_ksc (SaveThm (key, thm));
	val thm' = cond_compact 16 compact_thm thm;
	val saved = pp'list_save_thm ([key], thm');
in
	notify_on_ksc (SaveThm (key, thm'));
	saved
end
handle complaint => pass_on complaint "pp'list_save_thm" "save_thm");
=TEX
=SML
fun ⦏list_save_thm⦎ (keys : string list, thm : THM) : THM = (
let	val sideeffect = notify_before_ksc (ListSaveThm (keys, thm));
	val thm' = cond_compact 16 compact_thm thm;
	val saved = pp'list_save_thm (keys, thm');
in
	notify_on_ksc (ListSaveThm (keys, thm'));
	saved
end
handle complaint => pass_on complaint "pp'list_save_thm" "list_save_thm");
=TEX
=SML
fun ⦏delete_thm⦎ (key : string) : THM = (
let	val sideeffect = notify_before_ksc (DeleteThm key);
	val thm = pp'delete_thm key;
in
	notify_on_ksc (DeleteThm key);
	thm
end
handle complaint => pass_on complaint "pp'delete_thm" "delete_thm");
=TEX
Given a level, give a list of the levels that need deleting.
We presume a well-formed $del\_levels$ list.
=SML
fun ⦏deleted_levels⦎ (level : int) : int list = (
let	val {del_levels = del_levels,current_level = current_level, ...} = pp'get_theory (pp'get_current_theory_name());

	fun get_levels llevel ((lb,ub) :: lst) = (
		if llevel < lb
		then (interval llevel (lb -1) @
			get_levels (ub+1) lst)
		else (get_levels (ub+1) lst)
	) | get_levels llevel [] = interval llevel current_level;

in
	get_levels level del_levels
end);
=TEX
For the following $delete\_$ functions we need an auxiliary ``delete to level'' function.
This delete everything whose level is greater than or equal to the level supplied
as an argument.
This will find out what is to be deleted, and do all the
kernel and, if {\it do\_warn} is true, user notification required.
If {\it do\_warn} is false, the kernel notifications are done, but there is
no feedback to the user.

=SML
fun ⦏delete_to_level⦎
	{do_warn : bool,
	 caller : string,
	 target : string,
	 level : int} :
	(string * int) list * (string * TYPE) list = (
let	val dummy = case (get_current_theory_status()) of
		TSNormal => ()
		| TSDeleted => error caller 6008
			[fn () => get_current_theory_name()]
		| TSLocked => fail caller 6037
			[fn () => get_current_theory_name()]
		| TSAncestor => fail caller 6071
			[fn () => get_current_theory_name()];

	val {children = children,...} =
		pp'get_theory_info (pp'get_current_theory_name());

	val dummy = if children <> []
		then fail caller 6076 [fn () => get_current_theory_name()]
		else ();

	val {con_env = oe_con_env,ty_env = oe_ty_env,
		axiom_dict = oe_axiom_dict, thm_dict = oe_thm_dict,
		defn_dict = oe_defn_dict,...} =
			pp'get_theory (pp'get_current_theory_name());

	val con_env = oe_flatten oe_con_env;

	val ty_env = oe_flatten oe_ty_env;

	val axiom_dict = oe_flatten oe_axiom_dict;

	val thm_dict = oe_flatten oe_thm_dict;

	val defn_dict = oe_flatten oe_defn_dict;

	val (del_con,del_lev1) = split (map (fn (name,{ty = ty,level = lev,...}) =>
			((name, ty),lev))
		(con_env drop (fn (_,{level = lev,...}) => lev < level)));

	val (del_type, del_lev2) = split(map (fn (name,{level = lev, arity = ar}) => ((name, ar),lev))
		(ty_env drop (fn (_,{level = lev,...}) => lev < level)));

	val del_thms = map (fn (key,_) => key)
		(thm_dict drop (fn (_,thm) =>
			let val {level = lev,...} = pp'dest_thm thm
			in lev < level end));

	val (del_axioms, del_lev3) = split(map (fn (key,thm) => (key,
			let val {level = lev,...} = pp'dest_thm thm
			in lev end))
		(axiom_dict drop (fn (_,thm) =>
			let val {level = lev,...} = pp'dest_thm thm
			in lev < level end)));

	val (del_defns, del_lev4) = split(map (fn (key,thm) => (key,
			let val {level = lev,...} = pp'dest_thm thm
			in lev end))
		(defn_dict drop (fn (_,thm) =>
			let val {level = lev,...} = pp'dest_thm thm
			in lev < level end)));

	val to_be_d = (
		format_list Combinators.I
		(flat [
		if is_nil del_con
		then []
		else [get_error_message 12100
			[if length del_con = 1 then "" else "s"] ^
			(format_list fst del_con ", ")],
		if is_nil del_type
		then []
		else [get_error_message 12101
			[if length del_type = 1 then "" else "s"] ^
			(format_list fst del_type ", ")],
		if is_nil del_thms
		then []
		else [get_error_message 12102
			[if length del_thms = 1 then "" else "s"] ^
			(format_list Combinators.I del_thms ", ")],
		if is_nil del_axioms
		then []
		else [get_error_message 12103
			[if length del_axioms = 1 then "" else "s"] ^
			(format_list Combinators.I del_axioms ", ")],
		if is_nil del_defns
		then []
		else [get_error_message 12104
			[if length del_defns = 1 then "" else "s"] ^
			(format_list Combinators.I del_defns ", ")]])
		) "; ";
(*
=TEX
We now ask the interactive user whether he wishes everything
necessary to be deleted.
=SML
*)
	val dummy =
		if	do_warn
		then	warn caller 12012 [(fn () => target),(fn () => to_be_d)]
		else	();
(*
=TEX
We now have permission to proceed:
=SML
*)
	val dl = list_cup[del_lev1, del_lev2, del_lev3, del_lev4];
in
	app (fn xt => notify_before_ksc (DeleteConst (mk_const xt))) del_con;
	app (fn (t, _) => notify_before_ksc (DeleteType t)) del_type;
	app (fn ax => notify_before_ksc (DeleteAxiom ax)) del_axioms;
	app (fn thm => notify_before_ksc (DeleteThm thm)) del_thms;
	map pp'delete_thm del_thms;
	check_clean caller;
	set_clean_flag false;
	app (fn x => (pp'delete_extension (); ())) dl;
	app (register_delete_const o fst) del_con;
	app (register_delete_type o fst) del_type;
	set_clean_flag true;
	app (fn xt => notify_on_ksc (DeleteConst (mk_const xt))) del_con;
	app (fn (t, _) => notify_on_ksc (DeleteType t)) del_type;
	app (fn ax => notify_on_ksc (DeleteAxiom ax)) 			del_axioms;
	app (fn thm => notify_on_ksc (DeleteThm thm)) del_thms;
	(del_type, del_con)
end);
=TEX
We can now give the deletion functions:
=SML
fun ⦏delete_const⦎ (icnt : TERM) : unit = (
let	val cnt = fst(strip_app icnt);
	val (cnm, cty) = dest_const cnt
		handle complaint =>
		term_fail "delete_const" 12014 [icnt];
	val {con_env = con_env,...} = pp'get_theory
		(pp'get_current_theory_name());

	val {level = level, ty = ty} = force_value(oe_lookup cnm con_env)
		handle complaint =>
		divert complaint "force_value" "delete_const" 12001
			[fn () => get_current_theory_name (),
			 fn () => cnm];

	val _ = if not(is_type_instance ty cty andalso
			is_type_instance cty ty)
		then fail "delete_const" 12001
			[fn () => get_current_theory_name (),
			 fn () => cnm]
		else ();
	val _ =	delete_to_level {
		do_warn = true,
		caller = "delete_const",
		target = cnm,
		level = level};
in	()
end);
=TEX
=SML
fun ⦏delete_type⦎ (tnm : string) : unit = (
let	val {ty_env = ty_env,...} = pp'get_theory (pp'get_current_theory_name());

	val {level = level, ...} = force_value(oe_lookup tnm ty_env)
		handle complaint =>
		divert complaint "force_value" "delete_type" 12002
			[fn () => get_current_theory_name (),
			 fn () => tnm];
	val _ =	delete_to_level  {
		do_warn = true,
		caller = "delete_type",
		target = tnm,
		level = level}
in	()
end);
=TEX
=SML
fun ⦏thm_level⦎ (thm :THM) : int = (
	#level (pp'dest_thm thm)
);
=TEX
=SML
fun ⦏delete_axiom⦎ (anm : string) : unit = (
let	val {axiom_dict = axiom_dict,...} = pp'get_theory (pp'get_current_theory_name());

	val ax = force_value(oe_lookup anm axiom_dict)
		handle complaint =>
		divert complaint "force_value" "delete_axiom" 12003
			[fn () => get_current_theory_name (),
			 fn () => anm];

	val level = thm_level ax;
	val _ =	delete_to_level  {
		do_warn = true,
		caller = "delete_axiom",
		target = anm,
		level = level}
in	()
end);
=TEX
=SML
fun ⦏new_axiom⦎ (keys : string list, tm : TERM) : THM = (
let	val _ = notify_before_ksc (NewAxiom ((keys, tm),
		(pp'Kernel.pp'asm_rule mk_t)));
	val tm' = cond_compact 1 compact_term tm;
	val saved = pp'new_axiom (keys, tm');
in
	notify_on_ksc (NewAxiom ((keys, tm'),saved));
	saved
end
handle complaint => pass_on complaint "pp'new_axiom" "new_axiom");
=TEX
=SML
fun ⦏new_const⦎ (cnm : string, ty : TYPE) : TERM = (
let	val _ = notify_before_ksc (NewConst (cnm, ty));
	val ty' = cond_compact 4 compact_type ty;
	val _ = check_clean "new_const";
	val _ = set_clean_flag false;
	val saved = pp'new_const (cnm, ty')
		handle ex => (set_clean_flag true; raise ex);
	val _ = register_new_const cnm;
	val _ = set_clean_flag true;
in
	notify_on_ksc (NewConst (cnm, ty'));
	saved
end
handle complaint => pass_on complaint "pp'new_const" "new_const");
=TEX
=SML
fun ⦏new_type⦎ (tynm : string, arity : int) : TYPE = (
let	val _ = notify_before_ksc (NewType (tynm, arity));
	val _ = check_clean "new_type";
	val _ = set_clean_flag false;
	val saved = pp'new_type (tynm, arity)
		handle ex => (set_clean_flag true; raise ex);
	val _ = register_new_type tynm;
	val _ = set_clean_flag true;
in
	notify_on_ksc (NewType (tynm, arity));
	saved
end
handle complaint => pass_on complaint "pp'new_type" "new_type");
=TEX
=SML
fun ⦏set_user_datum⦎ (key : string, ud : USER_DATUM) : unit = (
let	val sideeffect = notify_before_ksc (SetUserDatum (key,ud));
	val {user_data = user_data,...} =
		pp'get_theory (pp'get_current_theory_name());

	val dummy = case (get_current_theory_status()) of
		TSNormal => ()
		| TSDeleted => error "set_user_datum" 6008
			[fn () => get_current_theory_name()]
		| TSLocked => fail "set_user_datum" 6037
			[fn () => get_current_theory_name()]
		| TSAncestor => fail "set_user_datum" 6071
			[fn () => get_current_theory_name()];

	val dummy = (user_data := s_enter key ud (!user_data);
		());
in
	notify_on_ksc (SetUserDatum (key,ud))
end);
=TEX
=SML
fun ⦏get_user_datum⦎ (thynm : string) (key : string) : USER_DATUM = (
let	val thyn = get_internal_theory_name "get_user_datum" thynm;
	val {user_data = user_data,...} = pp'get_theory thyn
		handle complaint =>
		pass_on complaint "pp'get_theory" "get_user_datum";

	val res = s_lookup key (!user_data);
in
	case res of
	Value ud => ud
	| _ => fail "get_user_datum" 12009 [(fn () => key),
		(fn () => thynm)]
end);
=TEX
\subsection{Primitive Definitional Mechanisms}
=TEX
=SML
fun ⦏new_type_defn⦎ (keys : string list, name : string,
	typars : string list, defthm : THM): THM = (
let	val _ = notify_before_ksc (NewTypeDefn ((keys, name, typars, defthm),
		(pp'Kernel.pp'asm_rule mk_t)));
	val _ = check_clean "new_type_defn";
	val _ = set_clean_flag false;
	val defthm' = cond_compact 4 compact_thm defthm;
	val saved = pp'new_type_defn (keys, name, typars, defthm')
		handle ex => (set_clean_flag true; raise ex);
	val _ = register_new_type name;
	val _ = set_clean_flag true;
in
	notify_on_ksc (NewTypeDefn ((keys, name, typars, defthm'), saved));
	saved
end
handle complaint => pass_on complaint "pp'new_type_defn" "new_type_defn");
=TEX
=SML
fun ⦏gen_new_spec⦎ (keys : string list, defthm : THM) : THM = (
let	val _ = notify_before_ksc (GenNewSpec ((keys, defthm),
		(pp'Kernel.pp'asm_rule mk_t)));
	val defthm' = cond_compact 32 compact_thm defthm;
	val _ = check_clean "gen_new_spec";
	val _ = set_clean_flag false;
	val saved = pp'gen_new_spec (keys, defthm')
		handle ex => (set_clean_flag true; raise ex);
	val names = (map (fst o dest_var o fst o dest_eq) o asms) defthm;
	val _ = app register_new_const names;
	val _ = set_clean_flag true;
in
	notify_on_ksc (GenNewSpec ((keys, defthm'), saved));
	saved
end
handle complaint => pass_on complaint "pp'gen_new_spec" "gen_new_spec");
=TEX
=SML
fun ⦏new_spec⦎ (keys : string list, ndef : int, defthm : THM) : THM = (
let	val _ = notify_before_ksc (NewSpec ((keys, ndef, defthm),
		(pp'Kernel.pp'asm_rule mk_t)));
	val defthm' = cond_compact 8 compact_thm defthm;
	val _ = check_clean "new_spec";
	val _ = set_clean_flag false;
	val saved = pp'new_spec (keys, ndef, defthm')
		handle ex => (set_clean_flag true; raise ex);
	val names = map (fst o dest_var)(fst(strip_∃(concl defthm))) to ndef - 1;
	val _ = app register_new_const names;
	val _ = set_clean_flag true;
in
	notify_on_ksc (NewSpec ((keys, ndef, defthm'), saved));
	saved
end
handle complaint => pass_on complaint "pp'new_spec" "new_spec");
=TEX
=SML
fun ⦏new_spec1⦎ (keys : string list, cnames : string list, defthm: THM) : THM = (
	error "new_spec1" 12043 []
);
=TEX
\subsection{Theory Access Functions}

\subsubsection{Accessing Individual Theorems}
The functions in this section become time-critical in applications like
{\ProductZ} where definition and axiom schemata are implemented by
demand-driven introduction of types and constants. To make them efficient
the definitions, theorems and axioms are cached. This is considered to
be worthwhile even now that efficient dictionaries are used within the
individual theories, since the current theory may have many ancestors and
the average number of types and constants etc. in each ancestor is likely
to be fairly small.


If the theorem being sought
is not in the cache, the following uncached versions of the functions are used.
=SML
fun ⦏uncached_get_defn⦎ (thynm : string) ( key : string) : THM = (
let	val thyn = get_internal_theory_name "get_defn" thynm;
	val {defn_dict = defn_dict,...} = pp'get_theory thyn
		handle complaint =>
		pass_on complaint "pp'get_theory" "get_defn";

	val {inscope = inscope,...} = pp'get_theory_info thyn;

	val dummy = if not inscope
		then fail "get_defn" 12010 [(fn () => thynm)]
		else ();

	val res = oe_lookup key defn_dict;
in
	case res of
	Value thm => thm
	| _ => fail "get_defn" 12004 [(fn () => thynm),(fn () => key)]
end);
=TEX
=SML
fun ⦏uncached_get_axiom⦎ (thynm : string) ( key : string) : THM = (
let	val thyn = get_internal_theory_name "get_axiom" thynm;
	val {axiom_dict = axiom_dict,...} = pp'get_theory thyn
		handle complaint =>
		pass_on complaint "pp'get_theory" "get_axiom";

	val {inscope = inscope,...} = pp'get_theory_info thyn;

	val dummy = if not inscope
		then fail "get_axiom" 12010 [(fn () => thynm)]
		else ();

	val res = oe_lookup key axiom_dict;
in
	case res of
	Value thm => thm
	| _ => fail "get_axiom" 12005 [(fn () => thynm),(fn () => key)]
end);
=TEX
=SML
fun ⦏uncached_get_thm⦎ (thynm : string) ( key : string) : THM = (
let	val thyn = get_internal_theory_name "get_thm" thynm;
	val {thm_dict = thm_dict,...} = pp'get_theory thyn
		handle complaint =>
		pass_on complaint "pp'get_theory" "get_thm";

	val {inscope = inscope,...} = pp'get_theory_info thyn;

	val dummy = if not inscope
		then fail "get_thm" 12010 [(fn () => thynm)]
		else ();

	val res = oe_lookup key thm_dict;
in
	case res of
	Value thm => thm
	| _ => fail "get_thm" 12006 [(fn () => thynm),(fn () => key)]
end);
=TEX
Now for the caching. Because the signatures of the three {\it get\_XXX} functions
are the same, we can do most of the work generically. The caches are efficient
dictionaries indexed by the definition, theorem or axiom keys whose entries
are simple look-up tables mapping theory names to the definitions, theorems
or axioms in question. In typical use, it will be rare for the same key to
be used for a definition (or whatever) in two different theories, so the simple
look-up tables will usually have just one entry.
=SML
type ⦏THM_CACHE⦎ = THM S_DICT E_DICT;
type ⦏GETTER⦎ = string -> string -> THM;
=TEX
{\it cached\_get} does the look-up. It is parameterised by a {\it GETTER}, which
will be the uncached version of the look-up function. The uncached getter is
intended to have made all necessary checks on the validity of the theorem it returns.
However, the cached copies of the theorems could be invalid because of an
unnotified change of theory, or because a constant or a type has been deleted. In this
case, the entry for this key is cleared from the cache and we try again --- the
uncached getter function will then either fail or, in the case of a definition that
has been deleted and then remade, fix the problem.
This case is expected to be rare, so we do not optimise for it.
=SML
fun ⦏cached_get⦎ (ug : GETTER) (cache : THM_CACHE ref) : GETTER = (fn thynm => fn key =>
	let	fun cache_it sd = (
			let	val thm = ug thynm key;
				val sd' = (thynm, thm) :: sd;
				val cache' = e_enter key sd' (!cache);
			in	cache := cache'; thm
			end
		);
		fun uncache_and_retry() = (
			cache := e_delete key (!cache);
			cached_get ug cache thynm key
		);
	in	case e_lookup key (!cache) of
			Value sd => (
				case s_lookup thynm sd of
					Nil => cache_it sd
				|	Value thm =>
						if	valid_thm thm
						then	thm
						else	uncache_and_retry()
		) |	Nil => cache_it []
	end
);
=TEX
The cache is rebuilt when an {\it open\_theory} is notified.
Based on the (currently true) assumption that {\it valid\_thm} is a fast function
the cache is rebuilt simply by removing theorems that are no longer valid.
Note that according to the above algorithm, this is not functionally necessary,
but it will reclaim space.
=SML
fun ⦏rebuild_cache⦎ (cache : THM_CACHE) : THM_CACHE = (
	let	val entries = e_flatten cache;
		val unwanted1 = not o valid_thm o snd;
		val unwanted2 = is_nil o snd;
		val entries' = map (fn (k, e) => (k, e drop unwanted1)) entries drop unwanted2;
	in	list_e_merge initial_e_dict entries'
	end
);
=TEX
Now we can define the caches and the notify function:
=SML
val ⦏get_defn_cache⦎ : THM_CACHE ref = ref initial_e_dict;
val ⦏get_axiom_cache⦎ : THM_CACHE ref = ref initial_e_dict;
val ⦏get_thm_cache⦎ : THM_CACHE ref = ref initial_e_dict;
=TEX
=SML
fun ⦏rebuild_caches_on_open_theory⦎ (OpenTheory _) = (
	get_defn_cache := rebuild_cache (!get_defn_cache);
	get_axiom_cache := rebuild_cache (!get_axiom_cache);
	get_thm_cache := rebuild_cache (!get_thm_cache)
) | rebuild_caches_on_open_theory _ = ();

val _ = on_kernel_state_change rebuild_caches_on_open_theory;
=TEX
Finally, we can define the interface functions:
=SML
val ⦏get_defn⦎ : string -> string -> THM = cached_get uncached_get_defn get_defn_cache;
val ⦏get_axiom⦎ : string -> string -> THM = cached_get uncached_get_axiom get_axiom_cache;
val ⦏get_thm⦎ : string -> string -> THM = cached_get uncached_get_thm get_thm_cache;
=TEX
=SML
fun ⦏not_in_scope⦎ (thyn : int) : bool = (
	case DynamicArray.sub_opt(#in_scope global_tables, thyn) of
		Value true => false
	|	_ => true
);
=TEX
=SML
fun ⦏get_const_theory⦎ (c : string) : string = (
	let	val _ = check_clean "get_const_theory";
	in	case le_lookup c (!(#const_thys global_tables)) of
		Value thyns => (
		case thyns drop not_in_scope of
			[thyn] => pp'get_theory_name thyn
		|	_ => fail "get_const_theory" 12201 [fn()=>c]
	) |	Nil => fail "get_const_theory" 12201 [fn()=>c]
	end
);
=TEX
=SML
fun ⦏get_type_theory⦎ (ty : string) : string = (
	let	val _ = check_clean "get_type_theory";
	in	case le_lookup ty (!(#type_thys global_tables)) of
		Value thyns => (
		case thyns drop not_in_scope of
			[thyn] => pp'get_theory_name thyn
		|	_ => fail "get_type_theory" 12202 [fn()=>ty]
	) |	Nil => fail "get_type_theory" 12202 [fn()=>ty]
	end
);
=TEX
In the following, we allow for the constant being a literal by looking for it in the initial theory if it is not in the tables.
=SML
fun ⦏get_const_type⦎ (c : string) : TYPE OPT = (
	let	val _ = check_clean "get_const_type";
	in	case le_lookup c (!(#const_thys global_tables)) of
		Value thyns => (
		case thyns drop not_in_scope of
			[thyn] => pp'get_const_type thyn c
		|	_ => pp'get_const_type 0 c
	) |	Nil => pp'get_const_type 0 c
	end
);
=TEX
=SML
fun ⦏get_type_arity⦎ (ty : string) : int OPT = (
	let	val _ = check_clean "get_type_arity";
	in	case le_lookup ty (!(#type_thys global_tables)) of
		Value thyns => (
		case thyns drop not_in_scope of
			[thyn] => pp'get_type_arity thyn ty
		|	_ => Nil
	) |	Nil => Nil
	end
);
=TEX
\subsubsection{Theory Names and Ancestry}
=SML
fun ⦏get_theory_names⦎ ((): unit) : string list = (
let	val hier = pp'get_hierarchy();
in
	map fst (hier drop
		(fn (_,{status = status,...}) => status = TSDeleted))
end);
fun ⦏theory_names⦎ ((): unit) : string list = get_theory_names();
=TEX
=SML
fun ⦏get_ancestors⦎ (thynm : string) : string list = (
let	val thyn = get_internal_theory_name "get_ancestors" thynm;
in	map pp'get_theory_name (pp'get_ancestors thyn)
end
);
=TEX
=SML
fun ⦏is_theory_ancestor⦎ (thy1 : string) (thy2 : string) : bool = (
let	val hier = pp'get_hierarchy();
	val nm1 = (if thy1 = "-"
		then get_current_theory_name ()
		else thy1);
	val nm2 = (if thy2 = "-"
		then get_current_theory_name ()
		else thy2);
	val sideeffect = case (s_lookup nm1 hier) of
		Value _ => ()
		| _ => fail "is_theory_ancestor" 12035 [fn () => nm1];

	fun aux (nm :string) = (
	(nm1 = nm) orelse
	(let	val parents = case (s_lookup nm hier) of
			Value {contents={parents=pnts,...},...} => pnts
			| _ => fail "is_theory_ancestor" 12035 [fn () => nm];
		val nmparents = map pp'get_theory_name parents
	in
		nm1 mem nmparents
		orelse
		(any nmparents aux)
	end));
in
	aux nm2
end);
=TEX
=SML
fun ⦏get_parents⦎ (thynm : string) : string list = (
let	val thyn = get_internal_theory_name "get_parents" thynm;
	val {parents = parents,...} = pp'get_theory thyn
		handle complaint =>
		pass_on complaint "pp'get_theory" "get_parents";
in
	map pp'get_theory_name parents
end);
=TEX
=SML
fun ⦏get_children⦎ (thynm : string) : string list = (
let	val thyn = get_internal_theory_name "get_children" thynm;
	val {children=children,...} = pp'get_theory_info thyn
		handle complaint =>
		pass_on complaint "pp'get_theory_info" "get_children";
in
	map pp'get_theory_name children
end);
=TEX
=SML
fun ⦏get_descendants⦎ (thynm : string) : string list = (
let	val thyn = get_internal_theory_name "get_descendants" thynm;
in	map pp'get_theory_name (pp'get_descendants thyn) @
	[if thynm = "-" then get_current_theory_name() else thynm]
end
);
=TEX
\subsection{Accessing Theory Contents}
We want something to compact a dictionary of theorems:
=SML
fun ⦏compact_tsd⦎ ([] : THM S_DICT) : (string list * THM) list = []
| compact_tsd ((nm, thm) :: tsd_list) = (
let	fun compact (accnms: string list) (accthm: THM)
			(((nm1,thm1) :: rest): THM S_DICT) :
			(string list * THM) list = (
		if accthm =|- thm1
		then compact (nm1 :: accnms) accthm rest
		else (((rev accnms), accthm) ::
			compact [nm1] thm1 rest)
	) | compact accnms accthm [] = [((rev accnms), accthm)];
in
	compact [nm] thm tsd_list
end);
=TEX

=SML
fun ⦏get_defns⦎ (thynm : string) : (string list * THM) list = (
let	val thyn = get_internal_theory_name "get_defns" thynm;
	val {defn_dict = defn_dict,...} = pp'get_theory thyn
		handle complaint =>
		pass_on complaint "pp'get_theory" "get_defns";

in
	compact_tsd (oe_flatten defn_dict)
end);
=TEX
=SML
fun ⦏get_defn_dict⦎ (thynm : string) : THM OE_DICT = (
let	val thyn = get_internal_theory_name "get_defn_dict" thynm;
	val {defn_dict = defn_dict,...} = pp'get_theory thyn
		handle complaint =>
		pass_on complaint "pp'get_theory" "get_defn_dict";

in
	defn_dict
end);
=TEX
=SML
fun ⦏get_axioms⦎ (thynm : string) : (string list * THM) list = (
let	val thyn = get_internal_theory_name "get_axioms" thynm;
	val {axiom_dict = axiom_dict,...} = pp'get_theory thyn		handle complaint =>
		pass_on complaint "pp'get_theory" "get_axioms";

in
	compact_tsd (oe_flatten axiom_dict)
end);
=TEX
=SML
fun ⦏get_axiom_dict⦎ (thynm : string) : THM OE_DICT = (
let	val thyn = get_internal_theory_name "get_axiom_dict" thynm;
	val {axiom_dict = axiom_dict,...} = pp'get_theory thyn
		handle complaint =>
		pass_on complaint "pp'get_theory" "get_axiom_dict";

in
	axiom_dict
end);
=TEX
=SML
fun ⦏get_thms⦎ (thynm : string) : (string list * THM) list = (
let	val thyn = get_internal_theory_name "get_thms" thynm;
	val {thm_dict = thm_dict,...} = pp'get_theory thyn
		handle complaint =>
		pass_on complaint "pp'get_theory" "get_thms";

in
	compact_tsd (oe_flatten thm_dict)
end);
=TEX
=SML
fun ⦏get_thm_dict⦎ (thynm : string) : THM OE_DICT = (
let	val thyn = get_internal_theory_name "get_thm_dict" thynm;
	val {thm_dict = thm_dict,...} = pp'get_theory thyn
		handle complaint =>
		pass_on complaint "pp'get_theory" "get_thm_dict";

in
	thm_dict
end);
=TEX
=SML
fun ⦏get_consts⦎ (thynm : string) : TERM list = (
let	val thyn = get_internal_theory_name "get_consts" thynm;
	val {con_env = con_env,...} = pp'get_theory thyn
		handle complaint =>
		pass_on complaint "pp'get_theory" "get_consts";

	fun env_to_term (_, ({ty=ty, level}, k)) = key_mk_const(k,ty);
in	map env_to_term (oe_key_flatten con_env)
end);
=TEX
=SML
fun ⦏get_const_keys⦎ (thynm : string) : E_KEY list = (
let	val thyn = get_internal_theory_name "get_const_keys" thynm;
	val {con_env = con_env,...} = pp'get_theory thyn
		handle complaint =>
		pass_on complaint "pp'get_theory" "get_const_keys";

in	map (snd o snd) (oe_key_flatten con_env)
end);
=TEX
=SML
fun ⦏get_types⦎ (thynm : string) : TYPE list = (
let	val thyn = get_internal_theory_name "get_types" thynm;
	val {ty_env = ty_env,...} = pp'get_theory thyn
		handle complaint =>
		pass_on complaint "pp'get_theory" "get_types";

	fun env_to_type (_, ({arity = arity, level}, k)) = key_mk_ctype(k,
		map (fn n => mk_vartype("'" ^ string_of_int n))(interval 1 arity));
in	map env_to_type (oe_key_flatten ty_env)
end);
=TEX
=SML
fun ⦏get_type_keys⦎ (thynm : string) : E_KEY list = (
let	val thyn = get_internal_theory_name "get_type_keys" thynm;
	val {ty_env = ty_env,...} = pp'get_theory thyn
		handle complaint =>
		pass_on complaint "pp'get_theory" "get_type_keys";
in	map (snd o snd) (oe_key_flatten ty_env)
end);
=TEX
=SML
fun ⦏get_theory_status⦎ (thynm : string) : THEORY_STATUS = (
let	val thyn = get_internal_theory_name "get_theory_status" thynm;
	val {status = status,...} = pp'get_theory_info thyn
		handle complaint =>
		pass_on complaint "pp'get_theory_info" "get_theory_status";
in
	status
end);
=TEX
\subsubsection{Accessing Theory Data Structures}
=TEX
=SML

fun ⦏get_theory⦎ (thynm : string) : THEORY = (
let	val thyn = get_internal_theory_name "get_theory" thynm;
	val theory = pp'get_theory thyn
		handle complaint =>
		pass_on complaint "pp'get_theory_info" "get_theory_status";
in
	theory
end);
=TEX
=SML
fun ⦏get_theory_info⦎ (thynm : string) : THEORY_INFO = (
let	val thyn = get_internal_theory_name "get_theory_info" thynm;
	val info = pp'get_theory_info thyn
		handle complaint =>
		pass_on complaint "pp'get_theory_info" "get_theory_status";
in
	info
end);
=TEX
\section{CHECKPOINTING}
=TEX
The representation of the checkpoint data type is
the theory name together with a dictionary mapping
theory names to pairs each comprising a level number and the user data.
We make it an abstype so that the compiler won't print the values.
=SML
type ⦏CP_INFO⦎ = {
	name : string,
	int_name : int,
	level : int,
	user_data : USER_DATA,
	read_only : bool,
	thms : string list
};

abstype ⦏CHECKPOINT⦎ =
	Checkpoint of string * CP_INFO list
with
	fun ⦏mk_checkpoint⦎
	(d : string * CP_INFO list) : CHECKPOINT = (
		Checkpoint d
	);
	fun ⦏dest_checkpoint⦎
	(Checkpoint d : CHECKPOINT) :  string * CP_INFO list = (
		d
	);
=TEX
We suppress pretty-printing of the type under Poly/ML.
=POLYML
local
    fun pp _ _ (_: CHECKPOINT) = PolyML.PrettyString "?"
in
    val _ = PolyML.addPrettyPrinter pp
end;
=SML
end;
=TEX
=SML
fun ⦏checkpoint⦎ (cp_thy : string) : CHECKPOINT = (
	let	val thys = get_descendants cp_thy
			handle ex => pass_on ex "get_descendants" "checkpoint";
		fun aux t : CP_INFO = (
			let	val int_name = get_internal_theory_name "checkpoint" t;
				val {	contents = {
						current_level = level,
						user_data = ref user_data,
						thm_dict = thm_dict,
						...},
					children = children,
					status, ...} = pp'get_theory_info int_name;
				val read_only = children <> [] orelse status = TSAncestor;
				val thms = if read_only then [] else map fst (oe_flatten thm_dict);
			in {	name = t,
				int_name = int_name,
				level = level,
				user_data = user_data,
				read_only = read_only,
				thms = thms }
			end
		);
		val real_name = if cp_thy = "-" then get_current_theory_name() else cp_thy;
	in	mk_checkpoint (cp_thy, map aux thys)
	end
);
=TEX
Now for {\it rollback} and {\tt rollback1}. In the function  {\it rec\_del} the outermost handler
is for the {\it get\_descendants} call and is trapping the situation where
the theory has already been deleted by an earlier call.
=SML
fun ⦏rollback_aux⦎ (caller : string) (force : bool) (cp : CHECKPOINT) : unit = (
	let	val (cp_thy, infos) = dest_checkpoint cp;
		fun check_internal_names (acc :  string list)
			({name, int_name, ...} :: more : CP_INFO list) = (
			let	val new_int_name = get_internal_theory_name caller name
					handle Fail _ => int_name;
			in	if	int_name <> new_int_name
				then	if	not force orelse name = cp_thy
					then 	fail caller 12020 [fn () => name]
					else	check_internal_names (name :: acc) more
				else	check_internal_names acc more
			end
		) | check_internal_names acc [] = acc;
		fun children_blocking_deletions (acc : string list)
			 ({name, int_name, level, ...} :: more: CP_INFO list) = (
			let	val new_level =
					(#current_level o #contents o pp'get_theory_info) int_name
					handle Fail _ => level;
			in	if new_level = level
				then children_blocking_deletions acc more
				else children_blocking_deletions (get_children name cup acc) more
			end
		) | children_blocking_deletions acc [] = acc;
		fun rec_del thy = (
			let	val _ = unlock_theory thy handle Fail _ => ();
				val thys = get_descendants thy less thy;
			in	map rec_del thys;
				delete_theory thy
				handle Fail _ =>
				comment caller 12015
				[fn () => thy]
			end	handle Fail _ => ()
		);
		val old_descs = map #name infos;
		val new_descs = get_descendants cp_thy
			handle Fail _ =>
			(comment caller 12016 [fn  () => cp_thy]; []);
		fun get_ancs thy = (
			get_ancestors thy
			handle Fail _ =>
			(comment caller 12016 [fn () => thy]; [])
		);
		val ancs = flat (map get_ancs old_descs);
		val children_to_delete =
			case children_blocking_deletions (check_internal_names [] infos) infos of
				[] => []
			|	cthys => (
				if force
				then (comment caller 12019
					[fn () => case cthys of [_] => "theory" | _ => "theories",
					 fn () => format_list (fn t => t) cthys ", ",
					 fn () => cp_thy];
					cthys)
				else  fail caller 12018
					[fn () => case cthys of [_] => "theory" | _ => "theories",
					 fn () => format_list (fn t => t) cthys ", ",
					 fn () => cp_thy]);
		val infos' = infos drop (fn {name, ...} => name mem children_to_delete);
	in	case new_descs of
			[] => ()
		|	_ =>
	let	val to_delete = children_to_delete cup (new_descs diff ancs);
		val _ = open_theory cp_thy
			handle ex => pass_on ex "open_theory" caller;
		val _ = app rec_del to_delete;
		fun restore ({name, int_name, level, thms, read_only, user_data, ...} : CP_INFO ) = (
			if read_only andalso not force
			then	()
			else
			let	val _ = open_theory name;
				val _ = unlock_theory name handle Fail _ => ();
				val {user_data = ud,...} = pp'get_theory int_name;
				val _ = delete_to_level {
					do_warn = false,
					caller = caller,
					target = name,
					level = level+1} ;
				val new_thms = flat (map fst (get_thms name));
				val thms_to_go = new_thms diff thms;
				fun del_thm n = (delete_thm n; ()) handle Fail _ => ();
			in	map del_thm thms_to_go;
				ud := user_data
			end	handle  Fail msg =>
				comment caller 12017 [
					fn  () => name,
					fn () =>  get_message_text msg]

		);
		val _ = app restore infos';
		val _ = open_theory cp_thy;
	in	()
	end
	end
);
=TEX
=SML
val ⦏rollback⦎ : CHECKPOINT -> unit = rollback_aux "rollback" false; 
val ⦏rollback1⦎ : CHECKPOINT -> unit = rollback_aux "rollback1" true; 
=TEX
\section{STATE MANAGEMENT}
=SML
fun ⦏pending_reset_kernel_interface⦎ () : unit -> unit =(
let	val f1 = !on_ksc_functions;
	val f2 = !before_ksc_functions;
	val f3 = !kernel_inference_funs;
	val {clean_flag, const_thys, type_thys,
			int_thy_names, in_scope} = global_tables;
	val f4 = !clean_flag;
	val f5 = !const_thys;
	val f6 = !type_thys;
	val f7 = !int_thy_names;
in	fn () => (
		on_ksc_functions := f1;
		before_ksc_functions := f2;
		kernel_inference_funs := f3;
		clean_flag := f4;
		const_thys := f5;
		type_thys := f6;
		int_thy_names := f7;
		reset_in_scope();
		()
	)
end);
=TEX
\subsection{Kernel Interface Diagnostics}
=SML
fun ⦏kernel_interface_diagnostics⦎ (reset : bool) :
	{clean_flag : bool,
	const_thys : int list E_DICT list,
	type_thys: int list E_DICT list,
	int_thy_names : int E_DICT,
	in_scope : int list} = (
	let	val {clean_flag, const_thys, type_thys,
			int_thy_names, in_scope} = global_tables;
		fun aux i = (
			case DynamicArray.sub_opt(in_scope, i) of
				Value true => false
			|	_ => true
		);
		val result =
			{clean_flag = !clean_flag,
			const_thys = !const_thys,
			type_thys = !type_thys,
			int_thy_names = !int_thy_names,
			in_scope = interval 0 (DynamicArray.uindex in_scope) drop aux};
	in	(if reset then set_clean_flag false else false);
		result
	end
);
=TEX

\section{EPILOGUE}
=SML
end; (* structure KernelInterface *)

open KernelInterface;
=TEX
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}



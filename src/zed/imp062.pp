=IGN
********************************************************************************
imp062.doc: this file is part of the PPZed system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  ℤ 1.61 imp062.doc,v 2004/06/18 13:18:13
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

\def\Title{Implementation of Z Type Inferrer}

\def\AbstractText{This document contains the Standard ML code for the type inferrer for HOL/Z.}

\def\Reference{DS/FMU/IED/IMP062}

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
%% LaTeX2e port: % TQtemplatetex
%% LaTeX2e port: \documentstyle[hol1,11pt,TQ]{article}
%% LaTeX2e port: \makeindex
%% LaTeX2e port: % The following macro is used to insert temporary notes
%% LaTeX2e port: % in the document.
%% LaTeX2e port: \def\TempNote#1{{\tiny#1}}
%% LaTeX2e port: \TPPproject{FST PROJECT}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Implementation of Z Type Inferrer}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP062}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{1.61%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{2004/06/18 13:18:13%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}                    %% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{Z, HOL}
%% LaTeX2e port: \TPPauthor{D.J.~King&WIN01}
%% LaTeX2e port: %\TPPauthors{R.D.~Arthan&WIN01\\D.J.~King&WIN01\\G.T.~Scullard&MAN05}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & FMU Manager}
%% LaTeX2e port: \TPPabstract{This document contains the Standard ML code for the type
%% LaTeX2e port: inferrer for HOL/Z.}
%% LaTeX2e port: %\TPPabstractB{}
%% LaTeX2e port: %\TPPabstractC{}
%% LaTeX2e port: %\TPPabstractD{}
%% LaTeX2e port: %\TPPabstractE{}
%% LaTeX2e port: %\TPPabstractF{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	  R.D.~Arthan \\ R.B.~Jones \\ G.T. Scullard
%% LaTeX2e port: }}
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
\subsection{Contents List} \tableofcontents
\subsection{Document Cross References}\bibliographystyle{fmu}
\bibliography{fmu}
\subsection{Changes History}
\begin{description}
\item[Issues 1.1--.21] Initial versions.

\item[Issue 1.22 (1992/07/10) (10 July 1992)]
	Fixed bug in decoration of components of schemas which appear
	as declarations (and Δ and Ξ expressions).
\item[Issue 1.28 (1992/07/24) (20 July 1992)]
	Version which passes the module tests. (Fixed type of theta expressions
	and added checking for uniqueness of free type variables with respect
	to free type variables in term quotations).

\item[Issue 1.29 (1992/07/27) (27 July 1992)]
	Fixed a bug in the handling of unary-tupled arguments to functions. Fixed
	an error message in ti\_z\_tm (ZTmFancyApp).

\item[Issue 1.31 (1992/07/31) (31st July 1992)]
	Removed function $val\_setIDENT$ and the caller now
	calls $val\_set\_ident$ in $ZTypesAndTermsSupport$.
\item[Issue 1.32 (1992/08/06) (4th August 1992)]
	Migrated $format\_z\_type$ to \cite{DS/FMU/IED/imp079}.
\item[Issue 1.34 (1992/08/18) (18th August 1992)]
Added Support for sequences of binary relations.

\item[Issue 1.35 (1992/08/19) (19th August 1992)]
Added support for Type Constraints.

\item[Issue 1.36 (1992/09/03) (3rd September 1992)]
Corrected a bug in the processing of free type definitions.

\item[Issue 1.37 (1992/10/23) (22nd October 1992)]
Made the initial type environment sensitive to the type context;
Fixed problem in treatment of the predicate part of a schema text.

\item[Issue 1.38 (1992/10/28),1.39 (1992/10/28) (28th October 1992)]
Amended treatment of term quotations (and a bug fix to same).
\item[Issue 1.40 (1992/11/03),1.39 (1992/10/28) (4 November 1992)]
Fixed problem in treatment of free variables in $bind\_zenv$.
\item[Issue 1.41 (1992/12/03) (2 December 1992)]
New  treatment of standardness.
\item[Issue 1.42 (1992/12/10) (10th December 1992)]
Restore SCCS keywords.
\item[Issue 1.43 (1993/02/17) (17th February 1993)]
Modified so as to use original input in errors where possible.
\item[Issue 1.44 (1993/03/01) (1st March 1993)]
Fix for bug 109.
\item[Issue 1.45 (1993/03/02) (2nd March 1993)]
Fix for bug 110.
\item[Issue 1.46 (1995/09/26)]
Fix for bug 175.
\item[Issue 1.47 (1996/01/03)]
Fix for bug 177.
\item[Issue 1.48 (1996/07/18)]
Fix for compliance tool bug 5 (V0.7).
\item[Issue 1.49 (1997/07/29)]
Fixed bug in type inference for $\theta$-terms.
\item[Issue 1.50 (1997/07/30)]
Restored lost SCCS keywords.
\item[Issues 1.51 (2001/07/17),1.52 (2001/07/18),1.53 (2001/07/18)]
Substitutions in the Unification structure are now dynamic arrays.
\item[Issues 1.54 (2001/07/20), 1.55 (2001/07/26)]
Enhanced representation of the environment.
\item[Issue 1.56 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.57 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.58 (2004/01/19)] The Z universal set is now called 𝕌.
\item[Issues 1.59 (2004/01/25), 1.60 (2004/01/25)] Fixed bug in treatment of decorated free variables.
\item[Issue 1.61 (2004/06/18)] Adapted to exploit new efficient type inference contexts.
\item[Issues 1.62 (2004/07/29), 1.63 (2004/08/08)] Added interface for term generation performance enhancements.
\item[Issue 1.64 (2004/08/10)] Type constructors for given sets are now in Z namespace.
Corrected treatment of given set paragraph with a constraint.
\item[Issue 1.64 (2004/08/10)] Allowed for new forms of stubs in templates.
\item[Issue 1.65 (2005/08/05)] Option to require distinguishing subscripts on all schema operations.
\item[Issue 1.66 (2005/09/08), 1.67 (2005/09/09)] Added some missing index brackets and fixed {\em ident\_of\_string}.
\item[Issue 1.68 (2005/09/13)] Added {\em diag\_free\_vars} hook for the Compliance Tool, plus major tidy-up to pass flags around by parameter rather than through global variables.
\item[Issue 1.71 (2006/04/20)] Added support for floating point literals
\item[Issues 1.72 (2006/08/11), 1.73 (2006/08/28)] Fixed type-checking of let expressions.
\item[Issue 1.74 (2010/04/01)] Support for empty schemas.
\item[Issue 1.75 (2011/07/10)] Fixed bug caused by working with characteristic tuples of
schema texts that had not been type-checked.
\item[Issue 1.76 (2011/07/11)] Support for predicate contexts flagged by the parser.
\item[Issue 1.77 (2011/08/04)] Fixed bug with decorations in forming characteristic tuples.
\item[Issue 1.78 (2011/09/03)] Fixed bug caused by returning type variables for types of characteristic tuples.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported PPZed to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
None.
\pagebreak
\section{GENERAL}
\subsection{Scope}
This document contains an implementation of the Z type inferrer described in
\cite{DS/FMU/IED/DTD062}, and responds to that document. The type inferrer
comprises part of the Z user interface which is overviewed in \cite{DS/FMU/IED/HLD018}.

\subsection{Introduction}
\subsubsection{Purpose and Background}
The purpose of the Z type inferrer is check Z paragraphs as produced by the
Z parser \cite{DS/FMU/IED/DTD061}, according to the typing rules written down in
the detailed design for the type inferrer \cite{DS/FMU/IED/DTD062}. The type inferrer
yields a correctly typed term, and a substitution function containing all the necessary
typing information for the paragraph. If the paragraph is ill-typed, then error
information is returned, for subsequent printing out by a function provided in the
type inferrer structure.

\subsubsection{Dependencies}

The type inferrer is contained within the structure $ZTypeInference$, which is
constrained by the signature of the same name, specified in \cite{DS/FMU/IED/DTD062}.

\subsubsection{Interface}

The following interfaces to the type inferrer module are made public:

\begin{itemize}

\item[1.]
Functions which permit formatting of the abstract syntax tree for Z paragraphs and
their components.

\item[2.]
A function for formatting error information returned by the type inferrer.

\item[3.]
The function which type infers Z paragraphs $type\_check\_z\_para$.

\end{itemize}

\subsubsection{Algorithms}
\subsubsection{Possible Enhancements}

The coding of the variable environment as a combination of pure functional overriding,
and imperative programming could be made more elegant by implementating environment
frame stack as a list of frames.

\subsubsection{Deficiencies}

There is no decent error handling for a case of generic actuals being incompatible
with the type of the defined constant.


\section{PREAMBLE}
First we introduce the structure for Z type inference.

=SML
structure ⦏ZTypeInference⦎ : ZTypeInference = struct
=TEX
=SML
	open Unification ZLex ZUserInterfaceSupport;
	open ZTypesAndTermsSupport;
=TEX

\section{SUPPORTING MATERIAL}

=SML
fun ⦏scream⦎ (s : string) : 'a = (
	fail "Z-Parser" 62901 [fn()=>s]
);
=TEX

=SML
fun ⦏ex_set⦎ t = ExType ("SET", [t]);
val ⦏ex_ℤ⦎ = ExType ("ℤ", []);
val ⦏ex_ℝ⦎ = ExType ("ℝ", []);
val ⦏ex_char⦎ = ExType ("CHAR",[]);
fun ⦏ex_→⦎ (f, a) = ExType ("→", [f, a]);
val ⦏ex_bool⦎ = ExType ("BOOL", []);
=TEX
=SML
fun ⦏get_repeats⦎ (idl : ''a list) : ''a list = (
let	fun aux (id::rest) = (
		if id mem rest
		then [id]::(aux rest)
		else aux rest
	) | aux [] = [];
in
	list_cup (aux idl)
end);
=TEX
=SML
fun ⦏ident_of_string⦎ (s : string) : IDENT = (
let	val (n, d) = unpack_ident s;
in	(template_of_string n, d)
end
);
=TEX

=SML
val ⦏zti_compactify_z_terms⦎ = ref true;
=TEX
=SML
val _ = if contains (map fst (get_flags()))
			"compactify_z_terms"
	then	()
	else	new_flag{name = "compactify_z_terms",
			control = zti_compactify_z_terms,
			default = fun_true,
			check = fun_true
	};
=TEX
=TEX

The following declarations provide initial space for the substitution function.
=SML
val ⦏zarray_size⦎ = 100;
val ⦏zti_subs⦎ = new_subs zarray_size;
=TEX


\section{FORMATTING Z SCHEMA TEXT AND TERMS}

The functions introduced in this section permit the formatting of Z paragraphs
represented as an abstract syntax tree, and the parts which comprise
Z paragraphs. These interfaces are intended to be public as they will no
doubt prove useful to applications programmers and testers.

First a few of auxiliary functions which will be useful.

=SML
fun ⦏type_of_extype⦎ (phi : SUBS) (f : int -> string) ty = (
let	fun aux (ExVartype(Known x)) = (
		mk_vartype x
	) | aux (ExVartype(Unknown x)) = (
		case DynamicArray.sub_opt (phi, x) of
			Nil => (mk_vartype (f x))
			| Value y => aux y
	) | aux (ExType(s, l)) = (
		mk_ctype(s, map aux l)
	);
in	if	!zti_compactify_z_terms
	then	compact_type (aux ty)
	else	aux ty
end);
=TEX
The following variable keeps a note of free type variables encountered
in HOL quotations, so that the type variable names generated by $type\_of\_z\_extype$
are unique with respect to those occurring in quotations.
Type variable names start with "'a", "'b" ... and so on.

=SML
val ⦏known_term_tyvars⦎ : string list ref = ref [];
=TEX

The following code and the reference variables ensure that names are generated
only when they need to be printed, thus ensuring no gaps
in the sequence of names.

=SML
local
	val ⦏tyvar_map⦎ : (int * string) list ref = ref [];
	val ⦏next_tyvar⦎ : int ref = ref 1;
in
=TEX
=SML
fun ⦏reset_freetype_names⦎ (() : unit) : unit = (
	known_term_tyvars := [];
	tyvar_map := [];
	next_tyvar := 1
);
=TEX
=SML
fun ⦏mk_freetype_name⦎ (tvar : int) : string = (
let	fun mk_tyvar_name i =
		if i > 0 andalso i <= 26
		then
			"'"^(chr (i+96))
		else
			"'"^(string_of_int i);
	fun next_unique () = (
	let	val name = mk_tyvar_name (!next_tyvar);
		val side = (next_tyvar := (!next_tyvar) + 1);
	in
		if name mem (!known_term_tyvars)
		then
			next_unique ()
		else
			name
	end);
in
	lassoc3 (!tyvar_map) tvar
		handle Fail _ => (
			let	val name = next_unique();
				val side = (tyvar_map := (tvar, name)::(!tyvar_map));
			in
				name
			end)
end);
end (* local ... in ... *);
=TEX

=SML
fun ⦏type_of_z_extype⦎ (ty : EXTYPE) : TYPE = (
	type_of_extype zti_subs mk_freetype_name ty
);
=TEX
=SML
fun ⦏format_z_extype⦎ (ty : EXTYPE) : string = (
	format_z_type (type_of_extype zti_subs mk_freetype_name ty)
);
=TEX
\section{ENVIRONMENT DATA TYPES}
These are declared here since the are used in the error-handling
data types of the next section.

The environment maps identifiers to the following type which represents
the three different possibilities for a variable:
=SML
datatype Z_VAR_TYPE =
		GlobalVar of EXTYPE
	|	BoundVar of EXTYPE
	|	FreeVar of EXTYPE OPT;
=TEX
The environment is then a dictionary as follows (which allows for the outside possibility
that turning an identifier into a string might not be a one-to-one function):
=SML
type ⦏Z_ENV⦎ = (IDENT * Z_VAR_TYPE) list E_DICT;
=TEX
The main type inference functions use the following type for a parameter containing certain more static environmental information.
=SML
type ⦏Z_TI_PARS⦎ =
	{	allow_frees : bool,
		standard : bool};
=TEX
\section{ERROR HANDLING AND REPORTING}

=SML
datatype ⦏Z_DETAILS⦎	=
		Failed⟨⟩ of Z_TM list * EXTYPE list
	|	FailedSetd of Z_TM list * EXTYPE list
	|	FailedSeta of Z_TM * EXTYPE * int
	|	Failedset of Z_TM * EXTYPE
	|	Failed× of Z_TM list * EXTYPE list
	|	Failedθ of Z_TM * EXTYPE
	|	FailedSel⋎T1 of int * int
	|	FailedSel⋎T2 of Z_TM * EXTYPE
	|	FailedSel⋎B1 of Z_TM * IDENT
	|	FailedSel⋎B2 of Z_TM * EXTYPE
	|	FailedApp of Z_TM * Z_TM * EXTYPE * EXTYPE
	|	FailedFancyApp of IDENT * Z_TM * EXTYPE * EXTYPE
	|	Failed¬⋎F of Z_TM * EXTYPE
	|	FailedLogInOp⋎F of Z_LOG_IN_OP * Z_TM * EXTYPE
	|	FailedQuant⋎F of Z_QUANT * Z_TM * EXTYPE
	|	FailedDecor of Z_TM * EXTYPE
	|	FailedPre of Z_TM * EXTYPE
	|	Failed¬⋎S of Z_TM * EXTYPE
	|	FailedLogInOp⋎S1 of Z_LOG_IN_OP * Z_TM * Z_TM
			* (IDENT * EXTYPE) list * (IDENT * EXTYPE) list
	|	FailedLogInOp⋎S2 of Z_LOG_IN_OP * Z_TM * EXTYPE
	|	Failed↾1 of Z_TM * Z_TM * (IDENT * EXTYPE) list
			* (IDENT * EXTYPE) list
	|	Failed↾2 of Z_TM * EXTYPE
	|	FailedHide of Z_TM * EXTYPE
	|	FailedQuant⋎S1 of Z_QUANT * Z_TM * (IDENT * EXTYPE) list
			* (IDENT * EXTYPE) list
	|	FailedQuant⋎S2 of Z_QUANT * Z_TM * EXTYPE
	|	FailedΔ of Z_TM * EXTYPE
	|	FailedΞ of Z_TM * EXTYPE
	|	FailedEq of Z_TM * Z_TM * EXTYPE * EXTYPE
	|	Failed∈1 of Z_TM * EXTYPE
	|	Failed∈2 of Z_TM * EXTYPE * Z_TM * EXTYPE
	|	Failed⨾1 of Z_TM * Z_TM * (IDENT * EXTYPE) list
			* (IDENT * EXTYPE) list
	|	Failed⨾2 of Z_TM * EXTYPE
	|	FailedPipe1 of Z_TM * Z_TM * (IDENT * EXTYPE) list
			* (IDENT * EXTYPE) list
	|	FailedPipe2 of Z_TM * EXTYPE
(*
=TEX
=SML
*)
	|	FailedRename1 of Z_TM * EXTYPE
	|	FailedRename2 of IDENT list
	|	FailedRename3 of IDENT list
	|	FailedBinding of IDENT list
	|	FailedGlobalVar of IDENT
	|	FailedFreeVar of IDENT
	|	FailedLet of IDENT * EXTYPE * EXTYPE
	|	FailedActual1 of IDENT * int
	|	FailedActual2 of Z_TM list * EXTYPE list
	|	FailedConstrained of Z_TM * EXTYPE * Z_TM
	|	FailedPredCast of Z_TM * EXTYPE
	|	FailedPredContext of Z_TM * EXTYPE
	|	FailedTmQuotation1 of (TERM*string*EXTYPE*EXTYPE)
	|	FailedTmQuotation2 of (TERM*(string*TYPE) list)
	|	FailedNonStandardZ of int
	|	FailedEnv of Z_TM * IDENT * EXTYPE * EXTYPE;

=TEX
=SML
datatype ⦏Z_PARA_DETAILS⦎ =
		FailedZPGiven
	|	FailedZPConstraint
	|	FailedZPConjecture
	|	FailedZPGenericTerm;
=TEX
The following type definition is visible via the signature
$ZTypeInference$.
=SML
datatype ⦏Z_ERROR_INFO⦎ =
		FailedZTm of Z_TM * Z_ENV * Z_DETAILS
	|	FailedZSchText of Z_SCH_TEXT * Z_ENV * Z_TM * EXTYPE
	|	FailedZDDec1 of Z_DEC * Z_ENV * Z_TM * EXTYPE
	|	FailedZDDec2 of Z_DEC * Z_ENV * Z_TM * EXTYPE
	|	FailedZDDec3 of Z_DEC * Z_ENV * (IDENT * EXTYPE) list
			* (IDENT * EXTYPE) list
	|	FailedZCompat of (IDENT * EXTYPE) list
			* (IDENT * EXTYPE) list
	|	FailedZPara of Z_TM * EXTYPE * Z_PARA_DETAILS
	|	FailedZFreeVar of IDENT;
=TEX
=SML
exception ⦏ZExn⦎ of Z_ERROR_INFO;
=TEX

=SML
fun ⦏report⦎ (msg : int) (inserts : string list) : unit = (
	diag_string (get_error_message msg inserts)
);
=TEX

=SML
fun ⦏not_a_set⦎ (tm : Z_TM) (ty : EXTYPE) = (
	report 62700 [];
	report 62003 [format_z_tm tm, format_z_extype ty]
);
=TEX

=SML
fun ⦏not_a_sequence⦎ (tm : Z_TM) (ty : EXTYPE) = (
	report 62701 [];
	report 62003 [format_z_tm tm, format_z_extype ty]
);
=TEX

=SML
fun ⦏not_a_predicate⦎ (tm : Z_TM) (ty : EXTYPE) = (
	report 62702 [];
	report 62003 [format_z_tm tm, format_z_extype ty]
);
=TEX

=SML
fun ⦏not_a_schema⦎ (tm : Z_TM) (ty : EXTYPE) = (
	report 62703 [];
	report 62003 [format_z_tm tm, format_z_extype ty]
);
=TEX

=SML
fun ⦏not_a_binding⦎ (tm : Z_TM) (ty : EXTYPE) = (
	report 62704 [];
	report 62003 [format_z_tm tm, format_z_extype ty]
);
=TEX

=SML
fun ⦏not_a_tuple⦎ (tm : Z_TM) (ty : EXTYPE) = (
	report 62705 [];
	report 62003 [format_z_tm tm, format_z_extype ty]
);
=TEX

=SML
fun ⦏not_a_globvar⦎ (id : IDENT) = (
	report 62706 [];
	report 62004 [format_ident id]
);
=TEX

=SML
fun ⦏print_zerrlistinfo⦎ (tml : Z_TM list) (tyl : EXTYPE list) : unit = (
let	
	fun plu (x1::x2::rest) = "s"
	  | plu _ = "";
	fun sort1 (i1 : int, (tm1:string, ty1:string)) (i2, (tm2, ty2)) =
		if ty1 = ty2 then
			if tm1 = tm2 then 0
			else i1 - i2
		else	Sort.string_order ty1 ty2;
	fun grpaux ((ty1, tmlist1)::rest1) ((tm2, ty2)::rest2) =
		if ty1 = ty2
		then grpaux ((ty1, tmlist1@[[tm2]])::rest1) rest2
		else grpaux ((ty2, [[tm2]])::(ty1,tmlist1)::rest1) rest2
	  | grpaux res _ = res;	

	fun grp ((tm, ty)::rest) = grpaux [(ty, [[tm]])] rest
	  | grp _ = scream "Problem in formatting a list of terms in an error report";
	fun do_errmsgs ((ty, tmlist)::rest) = (
		report 62005 [ty, plu tmlist];
		map (report 62004) tmlist;
		do_errmsgs rest
	) | do_errmsgs nil = nil;
	val stml = map format_z_tm tml;
	val styl = map format_z_extype tyl;
	val tmty = (combine stml styl);
	val itmty = combine (interval 1 (length styl)) tmty;
	val stmty = (map snd) (Sort.sort sort1 (rev itmty));
in
	(do_errmsgs (grp stmty);()
	)
end);
=TEX

=SML
fun ⦏incompatible_schemas⦎ (tm1 : Z_TM) (tm2 : Z_TM) (idtyl1 : (IDENT * EXTYPE) list)
		(idtyl2 : (IDENT * EXTYPE) list) : unit = (
	report 62622 [];
	report 62601 [format_z_tm tm1];
	map (fn (id, ty) => report 62003 [format_ident id, format_z_extype ty]) idtyl1;
	report 62601 [format_z_tm tm2];
	map (fn (id, ty) => report 62003 [format_ident id, format_z_extype ty]) idtyl2;
	()
);
=TEX
=SML
fun ⦏incompatible_quant⦎ (tm : Z_TM) (idtyl1 : (IDENT * EXTYPE) list)
		(idtyl2 : (IDENT * EXTYPE) list) : unit = (
	report 62622 [];
	report 62602 [];
	map (fn (id, ty) => report 62003 [format_ident id, format_z_extype ty]) idtyl1;
	report 62601 [format_z_tm tm];
	map (fn (id, ty) => report 62003 [format_ident id, format_z_extype ty]) idtyl2;
	()
);
=TEX
=SML
fun ⦏incompatible_comps⦎ (idtyl1 : (IDENT * EXTYPE) list)
		(idtyl2 : (IDENT * EXTYPE) list) : unit = (
	report 62622 [];
	map (fn (id, ty) => report 62003 [format_ident id, format_z_extype ty]) idtyl1;
	map (fn (id, ty) => report 62003 [format_ident id, format_z_extype ty]) idtyl2;
	()
);
=TEX
=SML
fun ⦏dup_vars_in_quotation⦎ (tm : TERM) (fvs : (string * TYPE) list) : unit = (
	let	fun order (s1, ty1) (s2, ty2) = (
			case Sort.string_order s1 s2 of
				0 => ~1
			|	other => other
		);
		val newfvs = Sort.sort order fvs;
		fun do1_fv (s, ty) = (
			report 62896 [s, format_z_extype (type_to_extype ty)]
		);
	in	report 62894 [];
		report 62895 [string_of_term tm];
		map do1_fv newfvs; ()
	end
);
=TEX
=SML
fun ⦏print_z_error⦎ ((FailedZTm (term, env, details)) : Z_ERROR_INFO) = (
	report 62001 [format_z_tm term];
	(case details of

	Failed⟨⟩ (tml, tyl) => (
		report 62011 []; print_zerrlistinfo tml tyl
	) | FailedSetd (tml, tyl) => (
		report 62021 []; print_zerrlistinfo tml tyl
	) | FailedSeta (tm, ty, ierr) => (
		report ierr []; not_a_predicate tm ty
	) | Failedset (tm, ty) => (
		report 62041 []; not_a_set tm ty
	) | Failed× (tml, tyl) => (
		report 62071 []; print_zerrlistinfo tml tyl
	) | Failedθ (tm, ty) => (
		report 62081 []; not_a_schema tm ty
	) | FailedSel⋎T1 (i, j) => (
		report 62096 []; report 62097 [string_of_int i, string_of_int j]
	) | FailedSel⋎T2 (tm, ty) => (
		report 62098 []; not_a_tuple tm ty
	) | FailedSel⋎B1 (tm, id) => (
		report 62101 []; report 62102 [format_ident id];
		report 62103 [format_z_tm tm]
	) | FailedSel⋎B2 (tm, ty) => (
		report 62104 []; not_a_binding tm ty
(*
=TEX
=SML
*)
	) | FailedApp (tm1, tm2, ty1, ty2) => (
		report 62111 [];
		report 62112 [format_z_tm tm1, format_z_extype ty1];
		report 62113 [format_z_tm tm2, format_z_extype ty2]
	) | FailedFancyApp (id, tm, ty1, ty2) => (
		report 62111 [];
		report 62112 [format_ident id, format_z_extype ty1];
		report 62113 [format_z_tm tm, format_z_extype ty2]
	) | Failed¬⋎F (tm, ty) => (
		report 62151 []; not_a_predicate tm ty
	) | FailedLogInOp⋎F (inop, tm, ty) => (
		report 62161 [format_z_in_op inop];
		not_a_predicate tm ty
	) | FailedQuant⋎F (quant, tm, ty) => (
		report 62171 [format_quant quant]; not_a_predicate tm ty
	) | FailedDecor (tm, ty) => (
		report 62201 []; not_a_schema tm ty
	) | FailedPre (tm, ty) => (
		report 62211 []; not_a_schema tm ty
	) | Failed¬⋎S (tm, ty) => (
		report 62221 []; not_a_schema tm ty
	) | FailedLogInOp⋎S1 (inop, tm1, tm2, idtyl1, idtyl2) => (
		report 62232 [format_z_in_op inop];
		incompatible_schemas tm1 tm2 idtyl1 idtyl2
	) | FailedLogInOp⋎S2 (inop, tm, ty) => (
		report 62231 [format_z_in_op inop];not_a_schema tm ty
	) | Failed↾1 (tm1, tm2, idtyl1, idtyl2) => (
		report 62242 [];
		incompatible_schemas tm1 tm2 idtyl1 idtyl2
(*
=TEX
=SML
*)
	) | Failed↾2 (tm, ty) => (
		report 62241 []; not_a_schema tm ty
	) | FailedHide (tm, ty) => (
		report 62251 []; not_a_schema tm ty
	) | FailedQuant⋎S1 (quant, tm, idtyl1, idtyl2) => (
		report 62262 [format_quant quant];
		report 62263 [];
		incompatible_quant tm idtyl1 idtyl2
	) | FailedQuant⋎S2 (quant, tm, ty) => (
		report 62261 [format_quant quant];
		not_a_schema tm ty
	) | FailedΔ (tm, ty) => (
		report 62270 []; not_a_schema tm ty
	) | FailedΞ (tm, ty) => (
		report 62271 []; not_a_schema tm ty
	) | FailedEq (tm1, tm2, ty1, ty2) => (
		report 62281 [];
		report 62007 [];
		report 62003 [format_z_tm tm1, format_z_extype ty1];
		report 62003 [format_z_tm tm2, format_z_extype ty2]
	) | Failed⨾1 (tm1, tm2, idtyl1, idtyl2) => (
		report 62291 [];
		report 62292 [];
		report 62293 [];
		incompatible_schemas tm1 tm2 idtyl1 idtyl2
	) | Failed⨾2 (tm, ty) => (
		report 62290 [];
		not_a_schema tm ty
	) | FailedPipe1 (tm1, tm2, idtyl1, idtyl2) => (
		report 62301 [];
		report 62302 [];
		report 62303 [];
		incompatible_schemas tm1 tm2 idtyl1 idtyl2
(*
=TEX
=SML
*)
	) | FailedPipe2 (tm, ty) => (
		report 62300 [];
		not_a_schema tm ty
	) | Failed∈1 (tm, ty) => (
		report 62282 []; not_a_set tm ty
	) | Failed∈2 (ltm, lty, rtm, rty) => (
		report 62283 [];
		report 62007 [];
		report 62003 [format_z_tm ltm, format_z_extype lty];
		report 62003 [format_z_tm rtm, format_z_extype rty]
	) | FailedRename1 (tm, ty) => (
		report 62361 []; not_a_schema tm ty
	) | FailedRename2 idl => (
		report 62362 []; report 62363 [];
		(case idl of
		[_] => report 62611 []
		|_ => report 62612 []);
		map (fn id => report 62004 [format_ident id]) idl;
		()
	) | FailedRename3 idl => (
		report 62362 []; report 62364 [];
		(case idl of
		[_] => report 62611 []
		|_ => report 62612 []);
		map (fn id => report 62004 [format_ident id]) idl;
		()
(*
=TEX
=SML
*)
	) | FailedBinding idl => (
		report 62051 []; report 62052 [];
		(case idl of
		[_] => report 62611 []
		|_ => report 62612 []);
		map (fn id => report 62004 [format_ident id]) idl;
		()
	) | FailedGlobalVar id => (
		report 62341 []; not_a_globvar id
	) | FailedLet (id, ty1, ty2) => (
		report 62351 [format_ident id];
		incompatible_comps [(id, ty1)] [(id, ty2)]
	) | FailedFreeVar id => (
		report 62631 []; report 62632 [];
		report 62004 [format_ident id]
	) | FailedActual1 (id, len) => (
		report 62342 []; report 62343 [];
		report 62344 [format_ident id, string_of_int len,
				if len  >1 then "s" else ""]
	) | FailedActual2 (tml, tyl) => (
		report 62345 [];
		report 62007 [];
		map
		(fn (tm, ty)=>report 62003 [format_z_tm tm, format_z_extype ty])
		(combine tml tyl); ()
	) | FailedConstrained (tm1, ty, tm2) => (
		report 62321 [];
		report 62322 [format_z_tm tm1, format_z_extype ty];
		report 62323 [format_z_tm tm2]
	) | FailedPredCast (tm, ty) => (
		report 62325 [];
		report 62326 [format_z_tm tm, format_z_extype ty]
	) | FailedPredContext (tm, ty) => (
		report 62327 [];
		report 62326 [format_z_tm tm, format_z_extype ty]
	) | FailedTmQuotation1 (tm, s, ty1, ty2) => (
		report 62890 [];
		report 62891 [string_of_term tm];
		report 62892 [s, format_z_extype ty1];
		report 62893 [format_z_extype ty2]
	) | FailedTmQuotation2 (tm, fvs) => (
		dup_vars_in_quotation tm fvs
	) | FailedEnv (tm, id, ty1, ty2) => (
		report 62503 []; report 62504 [];
		report 62601 [format_z_tm tm];
		report 62003 [format_ident id, format_z_extype ty1];
		report 62603 [];
		report 62003 [format_ident id, format_z_extype ty2]
	) | FailedNonStandardZ msg => (
		report msg []
	) (* end case *)
	);
	fail "Z-Parser" 62000 []
(*
=TEX
=SML
*)
) | print_z_error (FailedZSchText (schtext, env, tm, ty)) = (
	report 62001 [format_z_schtext schtext];
	report 62510 [];
	not_a_predicate tm ty;
	fail "Z-Parser" 62000 []
) | print_z_error (FailedZDDec1 (dec, env, tm, ty)) = (
	report 62001 [format_z_dec dec];
	report 62501 [];
	not_a_set tm ty;
	fail "Z-Parser" 62000 []
) | print_z_error (FailedZDDec2 (dec, env, tm, ty)) = (
	report 62001 [format_z_dec dec];
	report 62502 [];
	not_a_schema tm ty;
	fail "Z-Parser" 62000 []
) | print_z_error (FailedZDDec3 (dec, env, idtyl1, idtyl2)) = (
	report 62001 [format_z_dec dec];
	report 62505 [];
	report 62506 [];
	incompatible_comps idtyl1 idtyl2;
	fail "Z-Parser" 62000 []
(*
=TEX
=SML
*)
) | print_z_error (FailedZCompat (idtyl1,idtyl2)) = (
	report 62623 [];
	fail "Z-Parser" 62000 []
) | print_z_error (FailedZPara (tm, ty, det)) = (
	report 62002 []; (
		case det of
		FailedZPGiven => (report 62801 []; report 62802 [];())
		|FailedZPConstraint => (report 62803 [])
		|FailedZPConjecture => (report 62804 [])
		|FailedZPGenericTerm => (report 62805 [])
		);
	not_a_predicate tm ty;
	fail "Z-Parser" 62000 []
) | print_z_error (FailedZFreeVar id) = (
	report 62631 []; report 62632 [];
	report 62004 [format_ident id];
	fail "Z-Parser" 62000 []
);
=TEX

\subsection{The Environment}
Free variables are recorded in an assignable table as they are encountered (assuming
free variables are allowed by the options passed in by the caller).
Generic formal parameters are also held in this table.
=SML
val ⦏freevar_env⦎ : Z_ENV ref = ref initial_e_dict;
=TEX
=SML
fun ⦏diag_free_vars⦎ (():unit) : string list = (
	map fst (e_flatten (!freevar_env))
);
=TEX
=SML
fun ⦏get_zconst_type⦎ ("Totality" : string) : TYPE OPT = get_const_type "Totality"
  | get_zconst_type s = get_const_type (bind_gvar_name s);
=TEX
=SML
fun ⦏env_lookup⦎ (env : Z_ENV) (id : IDENT) : Z_VAR_TYPE = (
	let	val key = string_of_ident id;
		val thats_it = fn (i, _) => i = id;
		fun aux e = (
			snd(find(force_value(e_lookup key e)) thats_it)
		);
	in	(aux env handle Fail _ => aux (!freevar_env))
		handle Fail _ => (
			let	val dict = TypeInference.e_get_ti_context();
				val ty = force_value(e_lookup key dict);
			in	BoundVar(type_to_extype ty)
			end
		) handle Fail _ =>  (
			case get_zconst_type (string_of_ident id) of
				Value ty => GlobalVar (replaced ty)
			|	Nil => FreeVar Nil
		)
	end
);
=TEX
=SML
fun ⦏env_enter⦎ (env : Z_ENV) (id : IDENT) (ty : Z_VAR_TYPE): Z_ENV = (
	let	val key = string_of_ident id;
		val thats_it = fn (i, _) => i = id;
		val new_entry =
			case e_lookup key env of
				Nil => [(id, ty)]
			|	Value some => (id, ty) :: (some drop thats_it);
	in	e_enter key new_entry env
	end
);
=TEX
=SML
fun ⦏list_env_enter⦎ (env : Z_ENV) (idtys : (IDENT * Z_VAR_TYPE) list) : Z_ENV = (
	let	fun aux e [] = e
		|   aux e ((id, ty)::more) = aux (env_enter e id ty) more;
	in	aux env idtys
	end
);
=TEX
=SML
fun ⦏init_z_env⦎
	{givensets : IDENT list, genformals : IDENT list} : Z_ENV = (
let	val dummy = start_again();
	fun givenset id = (id, BoundVar (ex_set (ExType (bind_gvar_name (string_of_ident id), []))));
	fun formal id = (id, BoundVar (ex_set (ExVartype(Known("'"^(string_of_ident id))))));
	val gs = map givenset givensets;
	val fs = map formal genformals;
	val _ = freevar_env :=
		list_env_enter (list_env_enter initial_e_dict gs) fs;
in	initial_e_dict
end
);
=TEX
=SML
fun ⦏update_fv_env⦎ ({allow_frees, ...} : Z_TI_PARS)
	(env : Z_ENV) (id : IDENT) : unit = (
	case env_lookup env id of
		FreeVar Nil => (
			let	val ty = FreeVar
				(Value (ExVartype(Unknown (next_name()))));
			in	freevar_env := env_enter (!freevar_env) id ty
			end;
			if	not allow_frees
			then	raise ZExn (FailedZFreeVar id)
			else	()
	) |	_ => ()
);
=TEX
=SML
fun ⦏bind_zenv⦎
	({allow_frees, ...} : Z_TI_PARS)
	(env : Z_ENV) (term : Z_TM) (tm : Z_TM)
		(idtyl : (IDENT * EXTYPE) list) : Z_ENV = (
let	fun bz_unify id (ty1, ty2) = (
		unify zti_subs (ty1, ty2)
			handle Fail _ =>
			raise ZExn (FailedZTm (term, env, FailedEnv (tm, id, ty1, ty2)))
	);
	fun aux (id, ty) = (
		case env_lookup env id of
			FreeVar Nil => (
				freevar_env :=
					env_enter (!freevar_env) id (FreeVar (Value ty));
				if	not allow_frees
				then	raise ZExn (FailedZFreeVar id)
				else	()
		)
		|	FreeVar (Value ty') => (bz_unify id (ty, ty'); ())
		|	BoundVar ty' => (bz_unify id (ty, ty'); ())
		|	GlobalVar ty' => (
			case ty' of
				ExType("→", [_,t]) => bz_unify id (ty, t)
			|	_ => (bz_unify id (ty, ty'); ())
		)
	);
	val _ = map aux idtyl;
in	env
end
);
=TEX
=SML
fun ⦏dec_boundvars⦎ (env : Z_ENV) (idtyl : (IDENT * EXTYPE) list) : Z_ENV = (
	list_env_enter env (map (fn (id, ty) => (id, BoundVar ty)) idtyl)
);
=TEX


\section{SUPPORT FOR SCHEMA TYPES AND TUPLE TYPES}
The type inferrer may insert binding types or tuple types in a term that have not been declared.
A record of the types inserted is kept so that the term generator can ensure that all the required
type constructors are in scope.
=SML
val ⦏types_to_define⦎ : EXTYPE E_DICT ref = ref initial_e_dict;
=SML
datatype ⦏MANIFEST_EXTYPE⦎ =
		⦏NotManifest⦎
	|	⦏TupleType⦎ of EXTYPE list
	|	⦏BindingType⦎ of (IDENT * EXTYPE) list
	|	⦏SchemaType⦎ of (IDENT * EXTYPE) list;
=TEX

=SML
fun	 ⦏iextymfunseq⦎ (itym:(string * EXTYPE)list) :EXTYPE list =
	map (lassoc3 itym) (idsetseq(fst(split itym)));
=TEX

=SML
fun	⦏bind_exname⦎ (fid :IDENT list) :string = (
let	val sl = map string_of_ident fid;
in	
	"Z'S" ^ (val_set_ident sl)
end);

fun 	⦏bind_extype⦎ (itym :(IDENT * EXTYPE) list) :EXTYPE = (
let	val itym' = map (fn (id, ty) => (string_of_ident id, ty)) itym;
	val tycon = bind_exname(fst(split itym));
	val ety = ExType (tycon, iextymfunseq itym');
in	types_to_define := e_enter tycon ety (!types_to_define);
	ety
end);
=TEX
=SML
fun ⦏unbind_extype⦎ (ty : EXTYPE) : (IDENT * EXTYPE) list = (
	case ty of
	ExType (s, tyl) => (
		let	val (mani, sll, _) = dest_z_name s;
		in
			case mani of
			"Z'S" => (
				case sll of
				[sl] => combine (map ident_of_string sl) tyl
				|_ => scream "Strange value returned from dest_z_name"
				)
			| _ => scream "Type is not a Binding type"
			
		end)
	|_ => scream "Type is not a binding type"
);
=TEX

The following makes use of the Z mapping \cite{DS/FMU/IED/ZED003}
and \cite{DS/FMU/IED/ZED002}.
=SML
fun	⦏tuple_exname⦎ (tyl: EXTYPE list) :string = "Z'T[" ^ string_of_int(length tyl) ^ "]";
fun	⦏tuple_extype⦎ (tyl: EXTYPE list) :EXTYPE = (
let	val tycon = tuple_exname tyl;
	val ety = ExType (tycon, tyl);
in	types_to_define := e_enter tycon ety (!types_to_define);
	ety
end);
=TEX

=SML
fun ⦏untuple_extype⦎ (ty : EXTYPE) : EXTYPE list = (
	case ty of
	ExType (s, tyl) => (
		let	val (mani, sll, _) = dest_z_name s;
		in
			case mani of
			"Z'T" => tyl
			| _ => scream "Type is not a Tuple"
			
		end)
	|_ => scream "Type is not a tuple"
);
=TEX

=SML
fun  ⦏manifest⦎ (ty:EXTYPE) : MANIFEST_EXTYPE = (
	case ty of

	ExType("SET",[ty']) => (
	   	SchemaType (unbind_extype ty')
		handle Fail _ => NotManifest

	)|ExType(_,_) => (
		TupleType (untuple_extype ty)
		handle Fail _ =>
			BindingType (unbind_extype ty)
			handle Fail _ => NotManifest
	)|_ => NotManifest
);
=TEX
The following function is also used by the term generator.

=SML
fun ⦏make_chartuple⦎ ((decls, _, _) : Z_SCH_TEXT) : Z_TM * EXTYPE = (
let	fun f (ZDDec(ids, tm, Value ty)) = (
		(map (fn id => (ZTmLVar(id, Value ty, []), ty)) ids)
	) | f (ZDSchemaDec (ZTmDecor (tm, d, Value ty), _)) = (
	let	val ty' = case sub_type zti_subs ty of
				ExType ("SET", [ty'']) => ty''
				| _ => fail "make_chartuple" 62903 [];
	in
		[(ZTmθ(tm, d), ty')]
	end
	) | f (ZDSchemaDec (tm, Value ty)) = (
	let	val ty' = case sub_type zti_subs ty of
				ExType ("SET", [ty'']) => ty''
				| _ => fail "make_chartuple" 62903 [];
	in
		[(ZTmθ(tm, ""), ty')]
	end
	) | f _ = fail "make_chartuple" 62904 [];
in
	case decls of
	[] => (ZTmBinding [], bind_extype [])
	|decls =>
		let	val (tml, tyl) = split (flat (map f decls));
		in
			case (tml, tyl) of
			([tm], [ty]) => (tm, ty)
			|_ => (ZTmTuple tml, tuple_extype tyl)
		end
end);
=TEX


=SML
fun ⦏aux_compatibility⦎ [] tym1 tym2 = ([], [], [])
  | aux_compatibility (c::cl) tym1 tym2 = (
let	val 	(tym, idtyl1, idtyl2) = aux_compatibility cl tym1 tym2;
in
	case (lassoc5 tym1 c,lassoc5 tym2 c) of
	(Nil,Value ty) => ((c,ty)::tym, idtyl1, idtyl2)
	|(Value ty,Nil) => ((c,ty)::tym, idtyl1, idtyl2)
	|(Value ty1, Value ty2) => (
			(unify zti_subs (ty1, ty2);
				((c,sub_type zti_subs ty1)::tym, idtyl1, idtyl2))
			handle Fail msg =>
				(tym, (c,sub_type zti_subs ty1)::idtyl1,
					(c,sub_type zti_subs ty2)::idtyl2)

		)
	|_ => (tym, idtyl1, idtyl2)
end);

=TEX
=SML
fun ⦏compatible⦎ ((idtyl1, idtyl2):((IDENT * EXTYPE) list) * ((IDENT * EXTYPE) list))
		: (IDENT * EXTYPE) list = (
let	val cl = (list_cup o (map(map fst))) [idtyl1,idtyl2];
in
	case aux_compatibility cl idtyl1 idtyl2 of
	(tym, [], []) => (
		 tym
	) | (_, idtyl1, idtyl2) => (
		raise ZExn (FailedZCompat
 (idtyl1, idtyl2))
	)
end);
=TEX
=SML
fun ⦏map_compatible⦎ (env : Z_ENV)
	(dec_etcs : (Z_DEC * (IDENT * EXTYPE) list) list)
	: (IDENT * EXTYPE) list = (
	let	fun aux [] res = res
		|   aux ((dec, idtyl) :: more) res = (
			let	val idtyl' = compatible (idtyl, res)
					handle ZExn (FailedZCompat (idtyl1, idtyl2)) =>
					raise ZExn (FailedZDDec3 (dec, env, idtyl1, idtyl2));

			in	aux more (idtyl' cup res)
			end
		);
 	in	aux dec_etcs []
	end
);
=TEX
=SML
fun ⦏sch_quant_type⦎ ((idtyl1, idtyl2):((IDENT * EXTYPE) list) * ((IDENT * EXTYPE) list))
		: (IDENT * EXTYPE) list = (
	compatible (idtyl1, idtyl2)
	drop (fn (s,_) => any idtyl1 (fn (s', _) => s = s'))
);
=TEX
\subsection{Utilities for Function Application}
=SML
fun ⦏is_binrel⦎ (r as (n, _) : IDENT) : bool = (
	case get_zfixity_info (first_tmpl_id n) of
	Value((ZFFInOp, ZClRel),_) => true
	|_ => false
);
=TEX
=SML
fun ⦏tlu1⦎ (tm as ZTmFancyApp (r, _): Z_TM) : Z_TM = (
let	fun aux1 a0 r1 a1 = (
		case r1 of
		(TmplIn (StubUS, ("∈", Nil), StubUS), "") =>
			ZTm∈ (a0, a1)
		|(TmplIn (StubUS, ("=", Nil), StubUS), "") =>
			ZTmEq (a0, a1)
		|_ =>
			ZTm∈(ZTmTuple [a0, a1], ZTmLVar (r1, Nil, []))
	);
	fun aux (ZTmFancyApp (r1, ZTmTuple [a0, rest])) = (
		case rest of
		ZTmFancyApp (r2 as (n, _), ZTmTuple [a1, _]) =>
			if is_binrel r2
			then
				ZTmLogInOp⋎F (ZLogInOp∧ false,
					aux1 a0 r1 a1,aux rest)
			else
				aux1 a0 r1 rest
		|_ =>
			aux1 a0 r1 rest
		)
	  | aux tm = tm;
in
	if is_binrel r
	then aux tm
	else tm
end
) | tlu1 tm = tm;

=TEX
\section{INFERRING TYPES IN Z DECLARATIONS}

The first thing we need to do is to type infer schema as declarations which
appear in a group of declarations. Note that the
environment is not extended at this point.
The following function achieves this; it type infers each
declaration  in the outer environment, where necessary,
with a view to finding out its signature variables.

=TEX
=SML
fun ⦏ti_dec_pass_1⦎ (pars : Z_TI_PARS) (env : Z_ENV) (z_dec as ZDSchemaDec (tm, _) : Z_DEC)
				: Z_DEC * (IDENT * EXTYPE) list = (
let	val (tm', ty') = ti_z_tm pars env tm;
in
	case manifest ty' of
	SchemaType idtyl => (ZDSchemaDec (tm', Value ty'), idtyl)
	|_ => raise ZExn (FailedZDDec2 (z_dec, env, tm, ty'))
end)
  | ti_dec_pass_1 _ env (z_dec as ZDDec (ids, tm, _)) = (
let	val unk = ExVartype (Unknown (next_name()));
	val idtyl = map (fn id => (id, unk)) ids;
in
	(ZDDec (ids, tm, Nil), idtyl)
end)
(*
=TEX

=SML
*)
and ⦏ti_z_dec_pass_2⦎ (_ : Z_TI_PARS) (_ : Z_ENV) ((z_dec as ZDSchemaDec (tm, _)) : Z_DEC, idtyl) = (
	(z_dec, idtyl)
)
  | ti_z_dec_pass_2 pars env (z_dec as ZDDec (ids, tm, _), idtyl) = (
let	val (tm', ty') = ti_z_tm pars env tm;
	val ty'' = ExVartype (Unknown (next_name()));
	val side = unify zti_subs (ExType ("SET", [ty'']), ty')
			handle Fail _ =>
			raise ZExn (FailedZDDec1 (z_dec, env, tm, ty'));
	val setidtyl = map (fn (id, ty) => (id, ty'')) idtyl;
	val side = compatible (setidtyl, idtyl)
			handle ZExn (FailedZCompat (idtyl1, idtyl2)) =>
			raise ZExn (FailedZDDec3 (z_dec, env, idtyl2, idtyl1));
in
	(ZDDec (ids, tm', Value (sub_type zti_subs ty'')), idtyl)
end)
(*
=TEX

=SML
*)
and ⦏list_ti_z_dec⦎ (pars : Z_TI_PARS) (env : Z_ENV) (z_decl : Z_DEC list) : (Z_DEC list * Z_ENV
		* (IDENT * EXTYPE) list) = (
let	val pass1  = map (ti_dec_pass_1 pars env) z_decl;
	val idtyl =  map_compatible env pass1;
	val env' = dec_boundvars env (flat (map snd pass1));
	val pass2 = map (ti_z_dec_pass_2 pars env') pass1;
	val idtyl' = map (fn (id,ty) => (id, sub_type zti_subs ty)) idtyl;
in
	(map fst pass2, env', idtyl')
end)
(*
=TEX
\section{INFERRING TYPES IN Z SCHEMAS}

Note that if the predicate part of a schema text is
not boolean, then this constitutes a type checking error.
The caller of $ti\_z_schtext$ should make this check, as
it is likely
to have more contextual information for reporting informative
error messages than $ti\_z_schtext$.

=SML
*)
and ⦏ti_z_schtext⦎ (pars : Z_TI_PARS) (env : Z_ENV) (schtext : Z_SCH_TEXT as (ds, otm, oty))
			: Z_SCH_TEXT * Z_ENV * (IDENT * EXTYPE) list = (
let	val (ds', env', idtyl) = list_ti_z_dec pars env ds;
in
	case otm of
	Nil =>		((ds', Nil, Nil), env', idtyl)
	|Value tm => (
		let	val (tm', ty') = ti_z_tm pars env' tm;
 			val (tm'', ty'') = (
				case manifest ty' of
				SchemaType idtyl =>	(
					bind_zenv pars env' tm tm' idtyl;
					(ZTmSchemaPred tm', ex_bool))
				|_ => (tm', ty')
			);
			val side = unify zti_subs (ty'', ex_bool)
				handle Fail msg =>
				raise ZExn (FailedZSchText (schtext, env, tm'', ty''));
		in
			((ds', Value tm'', Value ty''), env', idtyl)
		end)
end)
(*
=TEX

\section{INFERRING TYPES IN Z TERMS}

\subsection{Sequence Display}

=SML
*)
and ⦏ti_z_tm⦎ (pars : Z_TI_PARS) (env : Z_ENV) (term as ZTm⟨⟩ (_, tl)) : Z_TM * EXTYPE = (
let	val tmlist = list_ti_z_tm pars env tl;
	val (tml, tyl) = split tmlist;
	val side = list_unify zti_subs tyl
		handle Fail msg =>
		raise ZExn (FailedZTm (term, env, Failed⟨⟩(tl, tyl)));
	val ty =
		(case tyl of
		  [] => ExVartype(Unknown(next_name()))
		  | _ => hd tyl
		);
	val resty = (tuple_extype [ex_ℤ, sub_type zti_subs ty]);
in
	(ZTm⟨⟩ (Value resty, tml), ex_set resty)
end)
(*
=TEX
\subsection{Set Display}
=SML
*)
  | ti_z_tm pars env (term as ZTmSetd (_, tl)) = (
let	val tmlist = list_ti_z_tm pars env tl;
	val (tml, tyl) = split tmlist;
	val side = list_unify zti_subs tyl
		handle Fail msg =>
		raise ZExn (FailedZTm (term, env, FailedSetd(tl, tyl)));
	val ty =
		(case tyl of
		  [] => ExVartype(Unknown(next_name()))
		  | _ => hd tyl
		);
	val resty = sub_type zti_subs ty;
in
	(ZTmSetd (Value resty, tml), ex_set resty)
end)
(*
=TEX

\subsection{Set Abstraction}
=SML
*)
  | ti_z_tm pars env (term as ZTmSeta1 schtext) = (
let	val (schtext', env', _) = ti_z_schtext pars env schtext
		handle ZExn (FailedZSchText (_, env, tm', ty')) =>
		raise ZExn (FailedZTm (term, env, FailedSeta(tm',ty',62031)));
	val (_, ty') = make_chartuple schtext';
in
	(ZTmSeta1 schtext', ex_set (sub_type zti_subs ty'))
end)
(*
=TEX
=SML
*)
  | ti_z_tm pars env (term as ZTmSeta2 (schtext, tm)) = (
let	val (schtext', env', _) = ti_z_schtext pars env schtext
		handle ZExn (FailedZSchText (_, env, tm', ty')) =>
		raise ZExn (FailedZTm (term, env, FailedSeta(tm',ty',62032)));
	val (tm', ty') = ti_z_tm pars env' tm;
in
	(ZTmSeta2(schtext', tm'), ex_set (sub_type zti_subs ty'))
end)
(*
=TEX

\subsection{Powerset}
=SML
*)
  | ti_z_tm pars env (term as ZTmℙ tm) = (
let	val (tm', ty') = ti_z_tm pars env tm;
	val tya = ex_set (ExVartype (Unknown (next_name())));
	val side = unify zti_subs (ty', tya)
		handle Fail _ =>
		raise ZExn (FailedZTm (term, env, Failedset (tm, ty')));
in
	(ZTmℙ tm', ex_set (sub_type zti_subs tya))
end)
(*
=TEX

\subsection{Tuple Display}
=SML
*)
  | ti_z_tm pars env (ZTmTuple []) =
	scream "The paragraph may not contain a zero length tuple"
  | ti_z_tm pars env (ZTmTuple tml) = (
let	val tmlist = list_ti_z_tm pars env tml;
	val (tml', tyl') = split tmlist;
	val ty = tuple_extype (map (sub_type zti_subs) tyl');
in
	(ZTmTuple tml', ty)
end)
(*
=TEX
\subsection{Binding Display}
=SML
*)
  | ti_z_tm pars env (term as (ZTmBinding eds)) = (
let	val (idl, tml) = split eds;
	val rep = get_repeats idl;
	val side = case rep of
		[] => ()
		| _ =>	raise ZExn (FailedZTm (term, env, FailedBinding rep));
	val (tml', tyl') = split(list_ti_z_tm pars env tml);
	val ty = bind_extype (combine idl tyl');
	val eds' = combine idl tml';
in
	(ZTmBinding eds', ty)
end)
(*
=TEX
\subsection{Product}
=SML
*)
  | ti_z_tm pars env (ZTm× []) =
	scream "The paragraph may not contain a zero length product type"
  | ti_z_tm pars env (term as ZTm× tml) = (
let	fun get_unify_failures ((tm, (ty1, ty2))::rest) = (
	let	val res = (unify zti_subs (ty1, ty2);true)
			handle Fail msg => false;
	in
		if res then get_unify_failures rest
		else (tm,ty2)::get_unify_failures rest
	end
	) | get_unify_failures [] = [];
	val tmlist = list_ti_z_tm pars env tml;
	val (tml', tyl') = split tmlist;
	val unkl = map (fn x => (ExVartype (Unknown(next_name())))) tml';
	val punkl = map (fn x => ex_set x) unkl;
	val typairs = combine punkl tyl';
	val side = case get_unify_failures (combine tml' typairs) of
		[] => ()
		|failures =>
		   (let	val(ftml, ftyl) = split failures;
		   in
			raise ZExn (FailedZTm (term, env, Failed× (ftml, ftyl)))
		   end);
	val ty =  ex_set (tuple_extype (map (sub_type zti_subs) unkl));

in
	(ZTm× tml', ty)
end)
(*
=TEX
\subsection{Theta}
=SML
*)
  | ti_z_tm pars env (term as ZTmθ (tm, decor)) = (
let	val (tm', ty') = ti_z_tm pars env tm;
in
	case manifest ty' of
	SchemaType idtyl => (
		let	val idtyl' =
			map (fn ((t, d), ty) => ((t, d ^ decor), ty)) idtyl;
		in	bind_zenv pars env term tm' idtyl';
			(ZTmθ(tm', decor), bind_extype idtyl)
		end
	)|_ => raise ZExn (FailedZTm (term, env, Failedθ (tm, ty')))
end)
(*
=TEX

\subsection{Tuple Selection}

=SML
*)
  | ti_z_tm pars env (term as ZTmSel⋎T (tm, i)) = (
let	val (tm', ty') = ti_z_tm pars env tm;
in
	case manifest ty' of
	TupleType tyl => (
		let	val sz = length tyl;
			val ty'' = nth (i-1) tyl
				handle Fail _ =>
				raise ZExn (FailedZTm  (term, env, FailedSel⋎T1 (i, sz)));
		in
			(ZTmSel⋎T(tm', i), sub_type zti_subs ty'')
		end)
	|_ => raise ZExn (FailedZTm (term, env, FailedSel⋎T2 (tm, ty')))
end)
(*
=TEX

\subsection{Binding Selection}

=SML
*)
  | ti_z_tm pars env (term as ZTmSel⋎B (tm, id)) = (
let	val (tm', ty') = ti_z_tm pars env tm;
in
	case manifest ty' of
	BindingType idtyl => (
		case lassoc5 idtyl id of
		Nil => raise ZExn (FailedZTm  (term, env, FailedSel⋎B1 (tm, id)))
		|Value ty'' =>
			(ZTmSel⋎B(tm', id), sub_type zti_subs ty'')
		)
	|_ => raise ZExn (FailedZTm (term, env, FailedSel⋎B2 (tm, ty')))
end)
(*
=TEX

\subsection{Application}
=SML
*)
  | ti_z_tm pars env (term as ZTmApp (ZTmLVar ((TmplIn (StubUS, ("=", Nil),
		StubUS), ""), Nil, []), ZTmTuple [tm1, tm2])) = (
	ti_z_tm pars env (ZTmEq (tm1, tm2))
)
(*
=TEX
=SML
*)
  | ti_z_tm pars env (term as ZTmApp (ZTmLVar ((TmplIn (StubUS, ("∈", Nil),
		StubUS), ""), Nil, []), ZTmTuple [tm1, tm2])) = (
	ti_z_tm pars env (ZTm∈ (tm1, tm2))
)
(*
=TEX
=SML
*)
  | ti_z_tm pars env (term as ZTmApp (tmf, tma)) = (
let	val (tmf', tyf) = ti_z_tm pars env tmf;
	val (tma', tya) = ti_z_tm pars env tma;
	val tvn = next_name();
	val tyr = ExVartype(Unknown tvn);
	val side = unify zti_subs (tyf, ex_set (tuple_extype([tya,tyr])))
			handle Fail _ =>
			raise ZExn (FailedZTm (term, env,
				FailedApp (tmf, tma, tyf, tya)));

in
		(ZTmApp(tmf',tma'), sub_type zti_subs tyr)
end)
(*
=TEX
=SML
*)
  | ti_z_tm (pars as {standard, ...}) env (term as ZTmFancyApp (id as (TmplIn (StubUS, ("⦂", Nil), StubUS), ""), ZTmTuple[tm1, tm2])) = (
if	standard
then raise ZExn (FailedZTm (term, env, FailedNonStandardZ 62324))
else
let	val (tm1', ty1') = ti_z_tm pars env tm1;
	val (tm2', ty2') = ti_z_tm pars env tm2;
	val side = unify zti_subs (ex_set ty1', ty2')
		handle Fail msg =>
		raise ZExn (FailedZTm (term, env, FailedConstrained
				(tm1, ty1', tm2)));
in	(tm1', sub_type zti_subs ty1')
end
)
(*
=TEX
N.b., if modifying the following, please check whether the very similar code for predicate contexts needs modifying too.
=SML
*)
  | ti_z_tm (pars as {standard, ...}) env (term as ZTmFancyApp (id as (TmplPre (("Π", Nil), _), ""), ZTmTuple[tm])) = (
if	standard
then raise ZExn (FailedZTm (term, env, FailedNonStandardZ 62324))
else
let	val (tm', ty') = ti_z_tm pars env tm;
	val (tm'', ty'') = (
		case manifest ty' of
			SchemaType idtyl =>	(
			bind_zenv pars env tm tm' idtyl;
			(ZTmSchemaPred tm', ex_bool))
		|_ => (tm', ty')
	);
	val side = unify zti_subs (ty'', ex_bool)
		handle Fail msg =>
		raise ZExn (FailedZTm (term, env, FailedPredCast
				(tm, ty')));
in	(tm'', sub_type zti_subs ty'')
end
)
(*
=TEX
=SML
*)
  | ti_z_tm pars env (term as ZTmFancyApp (id as (n, d), tma)) = (
	case get_zfixity_info (first_tmpl_id n) of
	Value((_, ZClGen _),_) => (
		case tma of
		ZTmTuple tml => ti_z_tm pars env (ZTmLVar (id, Nil, tml))
		| _ => scream "Argument to a generic must be a tuple"
	) |Value((ZFFInOp, ZClRel),_) => (
		ti_z_tm pars env (tlu1 term)
	) |Value((_, ZClRel),_) => (
	let	val tma' = case tma of
			ZTmTuple [tma'] => tma'
			| _ => tma;
	in
			ti_z_tm pars env (ZTmFancyApp ((TmplIn (StubUS, ("∈", Nil), StubUS), ""),
				ZTmTuple [tma', (ZTmLVar (id, Nil, []))]))
	end)
	|_ =>
	let	val (tmf', tyf) = ti_z_tm pars env (ZTmLVar (id, Nil, []));
		val tma' = case tma of
			ZTmTuple [tma'] => tma'
			| _ => tma;
		val (tma'', tya') = ti_z_tm pars env tma';
		val tvn = next_name();
		val tyr = ExVartype(Unknown tvn);
		val side = unify zti_subs (tyf, ex_set (tuple_extype([tya',tyr])))
				handle Fail _ =>
				raise ZExn (FailedZTm (term, env,
					FailedFancyApp (id, tma', tyf, tya')));
	in	(ZTmApp(tmf', tma''), sub_type zti_subs tyr)
	end)
(*
=TEX

\subsection{λ-abstraction}
=SML
*)
 | ti_z_tm pars env (term as ZTmλ (sch, tm)) = (
let	val (sch', env', _) = ti_z_schtext pars env sch;
	val (_, arg_ty) = make_chartuple sch';
	val (tm', res_ty) = ti_z_tm pars env' tm;
	val fun_ty = ex_set (tuple_extype [arg_ty, res_ty]);
in
	(ZTmλ (sch', tm'), fun_ty)
end)
(*
=TEX

\subsubsection{Definite Description}
=SML
*)
 | ti_z_tm pars env (ZTmμ1 sch) = (
let	val (sch',env', _) = ti_z_schtext pars env sch;
	val (_, ty') = make_chartuple sch';
in
	(ZTmμ1 sch', sub_type zti_subs ty')
end)
(*
=TEX
=SML
*)
 | ti_z_tm pars env (ZTmμ2 (sch, tm)) = (
let	val (sch',env', _) = ti_z_schtext pars env sch;
	val (tm', ty') = ti_z_tm pars env' tm;
in
	(ZTmμ2 (sch', tm'), sub_type zti_subs ty')
end)
(*
=TEX
\subsection{Predicate Contexts}

N.b., if modifying the following, please check whether the very similar code for applications of Π needs modifying too.
=SML
*)
  | ti_z_tm pars env (ZTmPredContext tm) = (
let	val (tm', ty') = ti_z_tm pars env tm;
	val (tm'', ty'') = (
		case manifest ty' of
			SchemaType idtyl =>	(
			bind_zenv pars env tm tm' idtyl;
			(ZTmSchemaPred tm', ex_bool))
		|_ => (tm', ty')
	);
	val side = unify zti_subs (ty'', ex_bool)
		handle Fail msg =>
		raise ZExn (FailedZTm (tm, env, FailedPredContext
				(tm, ty')));
in	(tm'', sub_type zti_subs ty'')
end
)
(*
=SML
\subsection{Truth}

ZTmTruth is not expected by the parser, but we pass it on anyway.
=SML
*)
  | ti_z_tm pars env (ZTmTruth truth) = (
	(ZTmTruth truth, ex_bool)
)
(*
=TEX

\subsection{Predicate Negation}

=SML
*)
 | ti_z_tm pars env (term as ZTm¬⋎F tm) = (
let	val (tm', ty') = ti_z_tm pars env tm;
	val (tm'', ty'') = (
		case manifest ty' of
		SchemaType idtyl => (
			bind_zenv pars env term tm' idtyl;
			(ZTmSchemaPred tm', ex_bool))
		|_ => (tm', ty')
		);
	val side = (unify zti_subs (ty'', ex_bool)
			handle Fail msg =>
			raise ZExn (FailedZTm (term, env, Failed¬⋎F (tm, ty')))
		);
in
	(ZTm¬⋎F tm'', ty'')
end)
(*
=TEX

\subsection{Logical Infix Operators for Predicates}

=SML
*)
 | ti_z_tm pars env (term as ZTmLogInOp⋎F (inop, tm1, tm2)) = (
let	val (tm1', ty1') = ti_z_tm pars env tm1;
	val (tm1'', ty1'') = (
		case manifest ty1' of
		SchemaType idtyl => (
			bind_zenv pars env term tm1' idtyl;
			(ZTmSchemaPred tm1', ex_bool))
		|_ => (tm1', ty1')
		);
	val (tm2', ty2') = ti_z_tm pars env tm2;
	val (tm2'', ty2'') = (
		case manifest ty2' of
		SchemaType idtyl => (
			bind_zenv pars env term tm2' idtyl;
			(ZTmSchemaPred tm2', ex_bool))
		|_ => (tm2', ty2')
		);
	val side = unify zti_subs (ty1'', ex_bool)
		handle Fail _ =>
		raise ZExn (FailedZTm (term, env, FailedLogInOp⋎F (inop, tm1'', ty1'')));
	val side = unify zti_subs (ty2'', ex_bool)
		handle Fail _ =>
		raise ZExn (FailedZTm (term, env, FailedLogInOp⋎F (inop, tm2'', ty2'')));
in
	(ZTmLogInOp⋎F(inop, tm1'' ,tm2''), ex_bool)
end
)
(*
=TEX

\subsection{Predicate Quantification}
=SML
*)
  | ti_z_tm pars env (term as ZTmQuant⋎F (quant, sch, tm)) = (
let	val (sch', env', _) = ti_z_schtext pars env sch;
	val (tm', ty') = ti_z_tm pars env' tm;
	val (tm'', ty'') = (
		case manifest ty' of
		SchemaType idtyl =>	(
			bind_zenv pars env' term tm' idtyl;
			(ZTmSchemaPred tm', ex_bool))
		|_ => (tm', ty')
		);
	val side = (unify zti_subs (ty'', ex_bool)
			handle Fail msg =>
			raise ZExn (FailedZTm (term, env, FailedQuant⋎F (quant, tm'', ty'')))
		);
in
	(ZTmQuant⋎F (quant, sch', tm''), sub_type zti_subs ty'')
end
)
(*
=TEX


\subsection{Schemas as Predicates}

ZTmSchemaPred is not expected from the parser, but we pass it on anyway.
=SML
*)
  | ti_z_tm pars env (term as ZTmSchemaPred tm) = (
	(ZTmSchemaPred tm, ex_bool)
)
(*
=TEX

\subsection{Horizontal Schemas}

=SML
*)
  | ti_z_tm pars env (term as ZTmHorizSchema sch) = (
let	val (sch', env', idtyl) = ti_z_schtext pars env sch;
	val ty = ex_set (bind_extype idtyl);
in
	(ZTmHorizSchema sch', ty)
end)
(*
=TEX

\subsubsection{Decoration}
=SML
*)
 | ti_z_tm pars env (term as ZTmDecor (tm, d, _)) = (
let	val (tm', ty') = ti_z_tm pars env tm;
in
	case manifest ty' of
	SchemaType idtyl => (
		let	val idtyl' = map (fn ((t, dec), ty) => ((t, dec^d), ty)) idtyl;
			val ty'' = ex_set (bind_extype idtyl');
		in
			(ZTmDecor(tm', d, Value ty'), ty'')
		end
	) | _ => raise ZExn (FailedZTm (term, env, FailedDecor (tm, ty')))
end)
(*
=TEX
\subsubsection{Precondition}
=SML
*)
  | ti_z_tm pars env (term as ZTmPre tm) = (
let	val (tm', ty') = ti_z_tm pars env tm;
	fun is_post (n, d) =
		case (rev o explode) d of
		("!"::rest) => true
		|("'"::rest) => true
		|_ => false;
in
	case manifest ty' of
	SchemaType idtyl => (
		let	val idtyl' = idtyl drop (fn(id, ty) => is_post id);
			val ty'' = ex_set (bind_extype idtyl');
		in
			(ZTmPre tm', ty'')
		end)
	| _ => raise ZExn (FailedZTm (term, env, FailedPre (tm, ty')))
end)
(*
=TEX
\subsubsection{Schema Negation}
=SML
*)
 | ti_z_tm pars env (term as ZTm¬⋎S tm) = (
let	val (tm', ty') = ti_z_tm pars env tm
	val side = (
		case manifest ty' of
		SchemaType _ 	=> ()
		|_ => 	raise ZExn (FailedZTm (term, env, Failed¬⋎S (tm, ty')))
		)
in
	(ZTm¬⋎S tm', ty')
end)
(*
=TEX

\subsection{Logical Infix Operators for Schemas}

=SML
*)
 | ti_z_tm pars env (term as ZTmLogInOp⋎S (inop, tm1, tm2)) = (
let	val (tm1', ty1') = ti_z_tm pars env tm1;
	val (tm2', ty2') = ti_z_tm pars env tm2;
in
	case (manifest ty1', manifest ty2') of
	(SchemaType idtyl1, SchemaType idtyl2) => (
		let	
			val idtyl' = compatible (idtyl1, idtyl2)
				handle ZExn (FailedZCompat (idtyl1, idtyl2)) =>
				raise ZExn (FailedZTm (term, env,
					FailedLogInOp⋎S1 (inop, tm1, tm2, idtyl1, idtyl2)))
		in
			(ZTmLogInOp⋎S(inop, tm1',tm2'), ex_set (bind_extype idtyl'))
		end
	) | (SchemaType _, _) => (
		raise ZExn (FailedZTm (term, env, FailedLogInOp⋎S2 (inop, tm2, ty2')))
	) | (_, _) => (
		raise ZExn (FailedZTm (term, env, FailedLogInOp⋎S2 (inop, tm1, ty1')))
	)
end
)
(*
=TEX

\subsubsection{Schema Projection}

=SML
*)
  | ti_z_tm pars env (term as ZTm↾ (tm1, tm2)) = (
let	val (tm1', ty1') = ti_z_tm pars env tm1;
	val (tm2', ty2') = ti_z_tm pars env tm2;
in
	case (manifest ty1', manifest ty2') of
	(SchemaType idtyl1, SchemaType idtyl2) => (
		let	val idtyl1' = map (fn ((n,d),t) => ((n,""),t)) idtyl1;
			val idtyl2' = map (fn ((n,d),t) => ((n,""),t)) idtyl2;
			val idtyl' = compatible (idtyl1', idtyl2')
				handle ZExn (FailedZCompat (idtyl1'', idtyl2'')) =>
				raise ZExn (FailedZTm (term, env,
					Failed↾1 (tm1, tm2, idtyl1'', idtyl2'')))
		in
			(ZTm↾(tm1',tm2'), ty2')
		end
	) | (SchemaType _, _) => (
		raise ZExn(FailedZTm(term, env, Failed↾2 (tm2, ty2')))
	) | (_, _) => (
		raise ZExn(FailedZTm(term, env, Failed↾2 (tm1, ty1')))
	)
end
)
(*
=TEX
\subsubsection{Schema Hiding}

=SML
*)
  | ti_z_tm pars env (term as ZTmHide (tm, idl)) = (
let	val (tm', ty') = ti_z_tm pars env tm;
in
	case manifest ty' of
	SchemaType idtyl => (
		let	val idm = idtyl drop (fn(id,ty) => (id mem idl));
			val ty'' = ex_set (bind_extype idm);
		in
			(ZTmHide(tm',idl), ty'')
		end)
	| _ => raise ZExn(FailedZTm(term, env, FailedHide (tm, ty')))
end
)
(*
=TEX

\subsubsection{Schema Quantification}

=SML
*)
  | ti_z_tm pars env (term as ZTmQuant⋎S (quant, sch, tm)) = (
let	val (sch', _, idtyl1) = ti_z_schtext pars env sch;
	val (tm2', ty2') = ti_z_tm pars env tm;
in
	case manifest ty2' of
	SchemaType idtyl2 => (
		let	val idtyl' = sch_quant_type (idtyl1, idtyl2)
				handle
				ZExn (FailedZCompat (idtyl2'', idtyl1'')) => (
					raise ZExn (FailedZTm (term, env,
					FailedQuant⋎S1 (quant, tm, idtyl1'', idtyl2''))));
		in
			(ZTmQuant⋎S(quant, sch', tm2'), ex_set (bind_extype idtyl'))
		end
	) |_ => raise ZExn(FailedZTm(term, env, FailedQuant⋎S2 (quant, tm, ty2')))
end)
(*
=TEX

\subsubsection{Δ and Ξ}

=SML
*)
  | ti_z_tm pars env (term as ZTmΔ tm) = (
let	val(tm', ty') = ti_z_tm pars env tm;
in
	case manifest ty' of
	SchemaType idtyl => (
		let	val idtyl' = map (fn ((t, d), ty) => ((t, d^"'"), ty)) idtyl;
			val ty'' = ex_set (bind_extype (idtyl@idtyl'));
		in
			(ZTmΔ tm', ty'')
		end
	) | _ => raise ZExn (FailedZTm (term, env, FailedΔ (tm, ty')))
end)
(*
=TEX

=SML
*)
  | ti_z_tm pars env (term as ZTmΞ tm) = (
let	val(tm', ty') = ti_z_tm pars env tm;
in
	case manifest ty' of
	SchemaType idtyl => (
		let	val idtyl' = map (fn ((t, d), ty) => ((t, d^"'"), ty)) idtyl;
			val ty'' = ex_set (bind_extype (idtyl@idtyl'));
		in
			(ZTmΞ tm', ty'')
		end
	) | _ => raise ZExn (FailedZTm (term, env, FailedΞ (tm, ty')))
end)
(*
=TEX

\subsection{Set Membership and Equality}

=SML
*)
  | ti_z_tm pars env (term as ZTmEq (tm1, tm2)) = (
let	val (tm1', ty1') = ti_z_tm pars env tm1;
	val (tm2', ty2') = ti_z_tm pars env tm2;
	val side = unify zti_subs (ty1', ty2')
		handle Fail _ =>
			raise ZExn (FailedZTm (term, env, FailedEq (tm1, tm2, ty1', ty2')));
in
	(ZTmEq (tm1', tm2'), ex_bool)
end)
(*
=TEX
=SML
*)
  | ti_z_tm pars env (term as ZTm∈ (tm1, tm2)) = (
let	val (tm1', ty1') = ti_z_tm pars env tm1;
	val (tm2', ty2') = ti_z_tm pars env tm2;
	val unk = ExVartype (Unknown (next_name()));
	val side = unify zti_subs (ex_set unk, ty2')
		handle Fail _ =>
			raise ZExn (FailedZTm (term, env, Failed∈1(tm2, ty2')));
	val side = unify zti_subs (ty1', sub_type zti_subs unk)
		handle Fail _ =>
			raise ZExn (FailedZTm (term, env, Failed∈2(tm1, ty1', tm2, ty2')));
in
	(ZTm∈ (tm1', tm2'), ex_bool)
end)
(*
=TEX

\subsection{Schema Composition}

=SML
*)
 | ti_z_tm pars env (term as ZTm⨾ (tm1, tm2)) = (
let	fun add_prime (id as (n, d)) =
		(n, d^"'");
	fun f tym1 [] = ([], [], [])
	  | f tym1 ((id2, ty2)::t) = (
		let	val id2' = add_prime id2;
		in
			case lassoc5 tym1 id2' of
			Value ty1 => (
				let	val (dl, idtyl1, idtyl2) = f tym1 t;
				in
					(unify zti_subs (ty1, ty2); (id2::dl, idtyl1, idtyl2))
					handle Fail _ => (dl, (id2',ty1)::idtyl1, (id2,ty2)::idtyl2)
				end)
			| Nil => f tym1 t
		end);
	val (tm1', ty1') = ti_z_tm pars env tm1;
	val (tm2', ty2') = ti_z_tm pars env tm2;
(*
=TEX
=SML
*)
in
	case (manifest ty1', manifest ty2') of
	(SchemaType idtyl1,SchemaType idtyl2) =>
		let	val (dropl, fidtyl1, fidtyl2) = f idtyl1 idtyl2;
			val pdropl = map add_prime dropl;
		in
			case (fidtyl1, fidtyl2) of
			([], []) => (
				let	val idtyl1' = idtyl1 drop
						 (fn (id,ty) => id mem pdropl);
					val idtyl2' = idtyl2 drop
						(fn (id,ty) => id mem dropl);
					val idtyl' = compatible (idtyl1', idtyl2')

						handle ZExn (FailedZCompat (idtyl1'', idtyl2'')) =>
						raise ZExn (FailedZTm (term, env,
						Failed⨾1 (tm1, tm2, idtyl1'', idtyl2'')))
				in
					(ZTm⨾(tm1',tm2'), ex_set (bind_extype idtyl'))
				end)
			|_ => raise ZExn (FailedZTm (term, env,
					Failed⨾1 (tm1, tm2, fidtyl1, fidtyl2)))
		end
	| (SchemaType _, _) => raise ZExn (FailedZTm (term, env, Failed⨾2 (tm2, ty2')))
	| _ => raise ZExn (FailedZTm (term, env, Failed⨾2 (tm1, ty1')))
end)
(*
=TEX

\subsection{Schema Piping}
=SML
*)
 | ti_z_tm pars env (term as ZTmPipe (tm1, tm2)) = (
let	fun change_q (id as (n, d)) = (
		case (rev o explode) d of
		"?"::rest => (n, (implode o rev) ("!"::rest))
		|_ => id);
	fun f tym1 [] = ([], [], [])
	  | f tym1 ((id2, ty2)::t) = (
		let	val id2' = change_q id2;
		in
			case lassoc5 tym1 id2' of
			Value ty1 => (
				let	val (dl, idtyl1, idtyl2) = f tym1 t;
				in
					(unify zti_subs (ty1, ty2); (id2::dl, idtyl1, idtyl2))
					handle Fail _ => (dl, (id2',ty1)::idtyl1, (id2,ty2)::idtyl2)
				end)
			| Nil => f tym1 t
		end);
	val (tm1', ty1') = ti_z_tm pars env tm1;
	val (tm2', ty2') = ti_z_tm pars env tm2;
(*
=TEX
=SML
*)
in
	case (manifest ty1', manifest ty2') of
	(SchemaType idtyl1,SchemaType idtyl2) =>
		let	val (dropl, fidtyl1, fidtyl2) = f idtyl1 idtyl2;
			val bang_dropl = map change_q dropl;
		in
			case (fidtyl1, fidtyl2) of
			([], []) => (
				let	val idtyl1' = idtyl1 drop
						 (fn (id,ty) => id mem bang_dropl);
					val idtyl2' = idtyl2 drop
						(fn (id,ty) => id mem dropl);
					val idtyl' = compatible (idtyl1', idtyl2')

						handle ZExn (FailedZCompat (idtyl1'', idtyl2'')) =>
						raise ZExn (FailedZTm (term, env,
						FailedPipe1 (tm1, tm2, idtyl1'', idtyl2'')))
				in
					(ZTmPipe(tm1',tm2'), ex_set (bind_extype idtyl'))
				end)
			|_ => raise ZExn (FailedZTm (term, env,
					FailedPipe1 (tm1, tm2, fidtyl1, fidtyl2)))
		end
	| (SchemaType _, _) => raise ZExn (FailedZTm (term, env, FailedPipe2 (tm2, ty2')))
	| _ => raise ZExn (FailedZTm (term, env, FailedPipe2 (tm1, ty1')))
end)
(*
=TEX



\subsection{Integer, String and Floating Point Literals}
=SML
*)
  | ti_z_tm pars env (ZTmℤ i) = (ZTmℤ i, ex_ℤ)
  | ti_z_tm pars env (ZTmString s ) = (ZTmString s, ex_set (tuple_extype [ex_ℤ, ex_char]))
  | ti_z_tm pars env (ZTmFloat xpe) = (ZTmFloat xpe, ex_ℝ)
(*
=TEX

\subsection{Type Constraints}

(HISTORICAL)

This section is a placeholder to ensure the correspondence between error
numbers and subsection numbers.

\subsection{Local Variables}
=SML
*)
 | ti_z_tm pars env (ZTmLVar ((TmplNon ("true", Nil), ""), Nil, tml)) = (
	(ZTmTruth true, ex_bool)
)| ti_z_tm pars env (ZTmLVar ((TmplNon ("false", Nil), ""), Nil, tml)) = (
	(ZTmTruth false, ex_bool)
)| ti_z_tm pars env (term as ZTmLVar (id as (n, d), _, tml)) = (
let	fun find_in_scope (ident as (n, d)) = (
	let
		val exd = (rev o explode) d;
		fun aux (decor as (d0::rest)) res =
		let	val sd = (implode o rev) decor;
		in
			case env_lookup env (n, sd) of
			GlobalVar ty => ((n, sd), GlobalVar (sub_type zti_subs ty), res)
			|BoundVar ty => ((n, sd), BoundVar (sub_type zti_subs ty), res)
			|_ => aux rest (d0::res)
		end
		  | aux [] res = (
			case env_lookup env (n, "") of
			GlobalVar ty => ((n, ""), GlobalVar (sub_type zti_subs ty), res)
			|BoundVar ty => ((n, ""), BoundVar (sub_type zti_subs ty), res)
			|FreeVar (Value ty) => ((n, ""), FreeVar (Value (sub_type zti_subs ty)), res)
			|free_var_nil => ((n, ""), free_var_nil, res)
			);
	in
		case aux exd [] of
		(id, GlobalVar ty, res) => (id, GlobalVar ty, implode res)
		|(id, BoundVar ty, res) => (id, BoundVar ty, implode res)
		|(id, FreeVar ty, res) => (id, FreeVar ty, implode res)
	end);
(*
=TEX
=SML
*)
	fun local_variable id ty = (
		case tml of
		[] => (
			(ZTmLVar(id, Value ty, []), ty)
		)|_ => (
			raise ZExn (FailedZTm (term, env, FailedGlobalVar id))
		)
	);
	fun setup_new_var id = (
	let	val _ = update_fv_env pars env id
			handle ZExn (FailedZFreeVar id) =>
			raise ZExn (FailedZTm (term, env, FailedFreeVar id));
	in	case env_lookup env id of
			FreeVar (Value ty) => ty
		|	_ =>  scream "Bound or global variable went undetected"
	end);
(*
=TEX
=SML
*)
in
	case find_in_scope id of
	(id', GlobalVar ty', "") => (
		ti_z_tm pars env (ZTmGVar (id', Nil, tml))
	)|(id', BoundVar ty', "") => (
		local_variable id ty'
	)|(id', FreeVar (Value ty'), "") => (
		local_variable id ty'
	)|(id', GlobalVar ty', d') => (
		case manifest ((fn (ExType("→", [_,t])) => t | t => t) ty') of
		SchemaType _ => (
			ti_z_tm pars env (ZTmDecor (ZTmGVar (id', Nil, tml), d', Nil))
		) |_ =>
			let	val ty'' = setup_new_var id;
			in	local_variable id ty''
			end
	)|(id', BoundVar ty', d') => (
		case manifest ((fn (ExType ("→", [_,t])) => t | t => t) ty') of
		SchemaType _ => (
			ti_z_tm pars env (ZTmDecor (ZTmLVar (id', Nil, tml), d', Nil))
		) |_ =>
			let	val ty'' = setup_new_var id;
			in	local_variable id ty''
			end
	)|(id', FreeVar (Value ty'), d') => (
		case manifest ((fn (ExType ("→", [_,t])) => t | t => t) ty') of
		SchemaType _ => (
			ti_z_tm pars env (ZTmDecor (ZTmLVar (id', Nil, tml), d', Nil))
		) |_ =>
			let	val ty'' = setup_new_var id;
			in	local_variable id ty''
			end
	)|(_, FreeVar Nil, _) => (
		let	val ty' = setup_new_var id;
		in
			local_variable id ty'
		end
	)
end
)
(*
=TEX

\subsection{Global Variables}

=SML
*)
 | ti_z_tm pars env (term as ZTmGVar (id as (n, d), _, tml)) = (
	case (env_lookup env id, tml, id) of
	(GlobalVar (ExType ("→",[domty, _])), [], (TmplNon ("𝕌", Nil),"")) =>
		let	val gentyl = untuple_extype domty
				handle Fail _ => [domty];
			val z_tml' = map (fn x => ZTmGVar((TmplNon
					("Totality",Nil),""), Nil, [])) gentyl;
		in
			ti_z_tm pars env (ZTmGVar(id, Nil, z_tml'))
		end
	| (GlobalVar (ExType ("→",[domty, _])),[],_) =>
		let	val gentyl = untuple_extype domty
				handle Fail _ => [domty];
			val z_tml' = map (fn x => ZTmGVar((TmplNon("𝕌",Nil), ""),Nil, []))
									 gentyl;
		in
			ti_z_tm pars env (ZTmGVar(id, Nil, z_tml'))
		end
	| (GlobalVar (ty as ExType("→",[domty,ranty])), _, _) =>
		let	val (tml', tyl') = split (list_ti_z_tm pars env tml);
			val argty = tuple_extype tyl';
			val resty = ExVartype(Unknown (next_name()));
			val side = unify zti_subs (ExType ("→",[domty, ranty]),
					ExType ("→", [argty, resty]))
				handle Fail _ =>
				let	val len = case manifest domty of
						TupleType tyl => length tyl
						| _ => scream
						  "Generic actual parameter is badly formed";
				in	if length tml <> len
					then
					raise ZExn (FailedZTm (term, env, FailedActual1 (id, len)))
					else
					raise ZExn (FailedZTm (term, env, FailedActual2 (tml, tyl')))

				end;
			val vty = sub_type zti_subs resty;
			in
				(ZTmGVar(id, Value vty, tml'), vty)
			end
	| (GlobalVar ty, [], _) =>	(ZTmGVar(id, Value ty, []), ty)
	| (GlobalVar ty, _, _) => (
		raise ZExn (FailedZTm (term, env, FailedGlobalVar id))
	) |_ => scream "The environment has no knowledge of a constant in the theory"
)
(*
=TEX

\subsection{Let Expressions}
N.b., the list {\em idl} below can contain duplicates.
{\em idl'} has the duplicates removed.
=SML
*)
| ti_z_tm pars env (term as ZTmLet (eqdefl, tm)) = (
let	val (idl, vall) = split eqdefl;
	val idl1 = idl cup [];
	val tyl = map (fn i => ExVartype(Unknown(next_name()))) idl1;
	val idtyl1 = combine idl1 tyl;
	val env' = dec_boundvars env idtyl1;
	val (vall', tyl') = split (list_ti_z_tm pars env' vall);
	val eqdefl' = combine idl vall';
	fun aux(i, ty2) = (
		let	val ty1 = lassoc3 idtyl1 i;
		in	unify zti_subs (ty1, ty2)
			handle Fail _ =>
			raise ZExn (FailedZTm (term, env', FailedLet (i, ty1, ty2)))
		end
	);
	val _ = app aux (combine idl tyl');
	val (tm', ty') = ti_z_tm pars env' tm;
in	(ZTmLet (eqdefl', tm'), ty')
end
)
(*
=TEX

\subsection{Renaming}
=SML
*)
 | ti_z_tm pars env (term as ZTmRename (tm, ididl)) = (
let	val (tm', ty') = ti_z_tm pars env tm;
	val (idnewl, idoldl) = split ididl;
	val rep1 = get_repeats idnewl;
	val rep2 = get_repeats idoldl;
	val side = case rep1 of
		[] => ()
		|_ =>	raise ZExn (FailedZTm (term, env, FailedRename2 rep1));
	val side = case rep2 of
		[] => ()
		|_ =>	raise ZExn (FailedZTm (term, env, FailedRename3 rep2));
in
	case manifest ty' of
	SchemaType idtyl =>
		(ZTmRename(tm', ididl), ex_set(bind_extype (map (fn (id, ty) =>
			(rassoc4 ididl id id, ty)) idtyl)))
	|_ => raise ZExn (FailedZTm (term, env, FailedRename1 (tm, ty')))
end
)
(*
=TEX

\subsection{Bracketed Terms}
=SML
*)
 | ti_z_tm pars env (term as ZTmBracketed tm) = (
let	val (tm', ty') = ti_z_tm pars env tm
in
	(ZTmBracketed tm', ty')
end
)
(*
=TEX

\subsection{Term Quotation}
=SML
*)
  | ti_z_tm (pars as {standard, ...}) env (term as ZTmQuotation (tm, _)) = (
	if	standard
	then	raise ZExn (FailedZTm (term, env, FailedNonStandardZ 62897))
	else
	let	val side = (known_term_tyvars :=
			term_tyvars tm cup (!known_term_tyvars));
		val nltyl = map dest_var (frees tm);
		val (nl, tyl) = split (map dest_var (frees tm));
		val ty = mk_ctype("", type_of tm :: tyl);
		val chk = (
			if	all_different  nl
			then	()
			else	raise ZExn
				(FailedZTm (term, env, FailedTmQuotation2(tm, combine nl tyl))));
		val exty = replaced ty;
		val (tmty, netyl) = (
			case exty of
				ExType(_, t::tl) => (t, combine nl tl)
			|	_	=> scream
						"Unexpected result from replaced"
		);
		fun do_vars [] = ()
		|   do_vars ((n, vty) :: more) = (
			(let	val (tmplstr, decor) = unpack_ident n;
				val tmpl = (template_of_string tmplstr);
			in case (ti_z_tm pars env (ZTmLVar((tmpl, decor), Nil, [])))
				handle ZExn _ => scream
					"Error from call to ti_ztm"
			of
				(ZTmGVar _, _) => ()
			|	(_, ety) => (
				(unify zti_subs (ety, vty))
				handle Fail msg =>
				raise ZExn
				(FailedZTm (term, env, FailedTmQuotation1(tm, n, vty, ety)))
			) end handle Fail _ => ());
			do_vars more
		);
		val sd = do_vars netyl;
	in	(ZTmQuotation (tm, Value exty), tmty)
	end)
(*
=TEX
\subsection{Type Inferring Lists of Z Terms}
=SML
*)
and ⦏list_ti_z_tm⦎ (pars : Z_TI_PARS) (env : Z_ENV) (tml : Z_TM list) : (Z_TM * EXTYPE) list = (
	map (ti_z_tm pars env) tml
);
=TEX

\section{INFERRING TYPES IN Z PARAGRAPHS}

The paragraph datatype includes a constructor for
Z terms. This is a convenient place to include Z terms,
and avoids having another data type which comprises
paragraphs or Z terms.
=SML
datatype ⦏Z_INFERRED⦎ =	ZInferred of Z_PARA
		|	ZTypeError of Z_ERROR_INFO;
=TEX
=SML
fun ⦏format_zinferred⦎ inf = (
	case inf of
	ZInferred p => format_z_para p
	|ZTypeError errinfo => print_z_error errinfo
);
=TEX
=SML
fun ⦏ti_z_para⦎ (pars : Z_TI_PARS) (p as ZParaAbbDef (id, formals, tm, _): Z_PARA) : Z_INFERRED = (
let	val env = init_z_env {givensets = [], genformals = formals};
	val (tm', ty') = ti_z_tm pars env tm;
in
	ZInferred (ZParaAbbDef (id, formals, tm', Value ty'))

end
) | ti_z_para pars (p as ZParaSchBox (id, formals, sch, _)) = (
let	val env = init_z_env {givensets = [], genformals = formals};
	val (sch', env', idtyl) = ti_z_schtext pars env sch;
	val ty = ex_set (bind_extype idtyl);
in
	ZInferred (ZParaSchBox (id, formals, sch', Value ty))
end
) | ti_z_para pars (ZParaAxDes (formals, sch, _)) = (
let	val env = init_z_env {givensets = [], genformals = formals};
	val (sch', env', idtyl) = ti_z_schtext pars env sch;
in
	ZInferred (ZParaAxDes (formals, sch', Value idtyl))
end
(*
=TEX
=SML
*)
) | ti_z_para pars (p as ZParaFreeType ftdef) = (
let	val env = init_z_env {givensets = map fst ftdef, genformals = []};
	fun ftbranch ftid (id, _, Nil) = (id, Nil, Nil)
	  | ftbranch ftid (id, _, Value tm) = (
	let	fun aux (ZTm⟨⟩ (_, [subtm])) = subtm
		  | aux tm = tm;
		val tm' =
			case tm of
			ZTmTuple [tm] => aux tm
			|ZTmTuple tml => ZTm× (map aux tml)
			|_ => aux tm;
		val (tm'', ty'') = ti_z_tm pars env tm';
		val ty''' = case ty'' of
			ExType ("SET",[ty]) => ty
			|_ => ty'';
	in
		(id, Value ty''', Value tm'')
	end);
	fun ftprod (id, idotytml) =
		(id, map (ftbranch id) idotytml);
in
	ZInferred (ZParaFreeType (map ftprod ftdef))
end
(*
=TEX
=SML
*)
) | ti_z_para _ (p as ZParaGivenSet (idl, Nil)) = (
	ZInferred p
) | ti_z_para pars (p as ZParaGivenSet (idl, Value (formals, tm))) = (
let	val env = init_z_env {givensets = idl, genformals = formals};
	val (tm', ty') = ti_z_tm pars env tm;
	val side = unify zti_subs (ty', ex_bool)
		handle Fail msg =>
		raise ZExn (FailedZPara (tm, ty', FailedZPGiven));
in
	ZInferred (ZParaGivenSet (idl, Value (formals, tm')))
end
(*
=TEX
=SML
*)
) | ti_z_para pars (p as ZParaConstraint (idl, tm)) = (
let	val env = init_z_env {givensets = [], genformals = idl};
	val (tm', ty') = ti_z_tm pars env tm;
	val side = unify zti_subs (ty', ex_bool)
		handle Fail msg =>
		raise ZExn (FailedZPara (tm, ty', FailedZPConstraint));
in
	ZInferred (ZParaConstraint (idl, tm'))
end
(*
=TEX
=SML
*)
) | ti_z_para pars (p as ZParaConjecture (id, formals, tm)) = (
let	val env = init_z_env {givensets = [], genformals = formals};
	val (tm', ty') = ti_z_tm pars env tm;
	val side = unify zti_subs (ty', ex_bool)
		handle Fail msg =>
		raise ZExn (FailedZPara (tm, ty', FailedZPConjecture));
in
	ZInferred (ZParaConjecture (id, formals, tm'))
end
(*
=TEX
=SML
*)
) | ti_z_para pars (p as ZParaTerm (formals, tm, _)) = (
let	val env = init_z_env {givensets = [], genformals = formals};
	val (tm', ty') = ti_z_tm pars env tm;
	val side = case formals of
		[] => ()
	|	_ => unify zti_subs (ty', ex_bool)
		handle Fail msg =>
		raise ZExn (FailedZPara (tm, ty', FailedZPGenericTerm));

in
	ZInferred (ZParaTerm (formals, tm', Value ty'))
end
(*
=TEX
=SML
*)
) | ti_z_para _ (p as ZParaFixity _) = (
	ZInferred p
);
=TEX
=SML
fun ⦏type_check_z_para⦎
	(pars : Z_TI_PARS)
	(p:Z_PARA) : Z_INFERRED = (
let	val _ = init_subs zti_subs;
	val _ = reset_freetype_names();
	val _ = types_to_define := initial_e_dict;
	val res = ti_z_para pars p handle ZExn info => ZTypeError(info);
in	res
end);
=TEX
=SML
fun ⦏get_types_to_define⦎ (():unit) : EXTYPE list = (
	map snd (e_flatten(!types_to_define))
);
=TEX
\section{EPILOGUE}
=SML
end (* of structure ZTypeInference *);
=TEX
\pagebreak

\twocolumn[\section{INDEX}]
{	\footnotesize
	\printindex
}
\onecolumn


\end{document}


=IGN

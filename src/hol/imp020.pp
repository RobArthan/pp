=IGN
********************************************************************************
imp020.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% imp020.doc   ℤ $Date: 2012/03/17 17:14:26 $ $Revision: 1.37 $ $RCSfile: imp020.doc,v $
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

\def\Title{Implementation for ICL HOL Symbol Table}

\def\AbstractText{This document contains the implementation for the symbol table module for ICL HOL.}

\def\Reference{DS/FMU/IED/IMP020}

\def\Author{R.D. Arthan}


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
\def\Hide#1{}
%% LaTeX2e port: \def\Bool{``$\it{:}bool\,$''}
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{FST PROJECT}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Implementation for ICL HOL Symbol Table}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP020}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.37 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2012/03/17 17:14:26 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{R.D.~Arthan & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.B.~Jones & HAT Manager}
%% LaTeX2e port: \TPPabstract{
%% LaTeX2e port: This document contains the implementation for the
%% LaTeX2e port: symbol table module for ICL HOL.}
%% LaTeX2e port: %\TPPabstractB{}
%% LaTeX2e port: %\TPPabstractC{}
%% LaTeX2e port: %\TPPabstractD{}
%% LaTeX2e port: %\TPPabstractE{}
%% LaTeX2e port: %\TPPabstractF{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	Library\\RDA\\AJH\\DJK}}
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

\newpage
\section{DOCUMENT CONTROL}
\subsection{Contents List}
\tableofcontents
\subsection{Document Cross References}
\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes History}
\begin{description}
\item[Issue 1.3 (1991/05/22)]
First draft for comment.
\item [Issue 1.4 (1991/06/17)]
Corrected a use of $get\_const\_type$.
\item [Issue 1.5 (1991/06/27)]
The name atom  ``definition(s)'' changed to ``defn(s)'', and
``constant(s)'' to ``const(s)''.
\item [Issue 1.7 (1991/07/04) (22 May 1991)]
Added $get\_alias$. Corrected handling of languages.
\item [Issue 1.8 (1991/07/25) (25 July 1991)] Added $get\-\_language$. {}
Function $get\-\_terminators$ renamed to become
$get\-\_current\-\_terminators$ then function
$get\-\_terminators$ added as theory
access function. Slight reorganisation of last part of document.
\item [Issue 1.9 (1991/07/25) (25 July 1991)]
Delete $FIXITY$ (moved to lexical analyser~\cite{DS/FMU/IED/DTD015}).
\item [Issue 1.10 (1991/07/26) (26 July 1991)]
Rework of theory access and type abbreviation interfaces.
\item [Issue 1.15 (1991/08/16) (\FormatDate{91/08/16%
})]
Changed names of syntax functions.
\item [Issue 1.16 (1992/01/20) (1st April 1992)]
Changes required by CR0016.


\item[Issue 1.17 (1992/04/09), \FormatDate{92/01/20} ] Updated to use new fonts.
\item [Issue 1.19 (1992/05/26) (26th May 1992)]
Renamings from version 1.5 of DS/FMU/IED/WRK038.

\item[Issue 1.20 (1992/07/07)~(\FormatDate{92/07/07
}) ]
	Allow multiple languages per constant.
\item[Issues 1.21]
	Made languages of new theories be inherited from the parent.
\item[Issues 1.22]
	Use error code 20501 in $declare_const_language$, was 20502.
\item[Issue 1.23 (1992/07/24), 1.24 (1992/08/20)]
Fixed {\it undeclare\_alias} and added {\it get\_alias\_info}
\item[Issue 1.25 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.26 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.27 (2005/04/24)] Now uses {\tt app} rather than {\tt map} when appropriate.
\item[Issue 1.28 (2005/05/07)] HOL now supports left-associative operators.
\item[Issue 1.29 (2005/09/05)] Now uses {\em key\_dest\_const} and {\em key\_dest\_ctype}.
\item[Issue 1.30 (2005/09/07)] Now uses {\em get\_const\_keys} and {\em get\_type\_keys}.
\item[Issues 1.31 (2005/12/14)--1.33 (2005/12/15)] Kernel interface and symbol table reform.
\item[Issue 1.35 (2005/12/16)] The prefix for private interfaces is now $pp'$ rather than $icl'$.
\item[Issue 1.36 (2012/03/17)] Support for using type abbreviations in pretty printing.
\item[Issues 1.37 (2012/03/17), 1.38 (2012/05/06)] Symbol table interfaces now return lists in declaration order.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
\pagebreak
\section{GENERAL}
\subsection{Scope}
This document contains the implementation for the symbol table module for ICL HOL.
The detailed design for this material is given in \cite{DS/FMU/IED/DTD020}.
\subsection{Introduction}
\subsection{Dependencies}
The symbol table module is dependent on the interface to the
abstract data type $THM$, \cite{DS/FMU/IED/IMP012}
and on the lexical analyser module, \cite{DS/FMU/IED/IMP015}.
\subsection{Algorithms}
The most straightforward implementation of the
design would simply define an encoding allowing finite functions
from identifiers to an appropriate record type to
be stored in a theory (as $USER\_DATA$) and would implement the various
access functions by direct access to the information stored in the theory.
However, this approach would be slow (since it would imply
linear table searches to find the information pertaining to an identifier)
and would also consume unnecessary space (since ``most'' identifiers do
not have any special properties, all we need to know about them is
already stored in the theory database).

{\sloppy
For the purposes of parsing, type inferring and pretty printing, the interrogative
functions:
$get\-\_terminators$, $get\-\_fixity$, $get\-\_const\-\_info$,
$get\-\_const\-\_type$, $resolve\-\_alias$, $get\-\_alias$, $get\-\_type\-\_info$,
$expand\-\_type\-\_abbrev$, $get\-\_language$
and, perhaps, $get\-\_sym\-\_tab\-\_info$, need to be quite fast.
Consequently, we maintain caches containing the
information required to compute these functions
in the current context. As an optimisation (to the space usage) we do
not keep records for identifiers with no special properties. The relevant
symbol table information for such an identifier may readily be computed
from the theory database as necessary.

}

We store in each theory an encoding of the
declarative operations ($declare\_terminator$, $declare\_infix$ etc.) which
have been made in the context of that theory.
Then, in essence, corresponding to each
declarative operation we define an operation on the cache and an operation
on the current theory. Thus a context change is effected by replaying
a sequence of operations on the caches which correspond to the declarations
which apply in that context. The declarative operations performed by the
user are implemented by performing the corresponding operations on both
the current theory and the caches,

\subsection{Possible Enhancements}
It is not yet known whether the encoding of symbol table information
in the theory database is adequately compact.
\subsection{Deficiencies}
It would be desirable for the symbol table module to check before
a type or constant was deleted whether or not there was an abbreviation
or alias in force relating to the type or constant. Implementing this would
require extensions to dtd012.

\section{PREAMBLE}
=SML
structure SymbolTable : SymbolTable = struct
open Lex Antiunify;
=TEX
\subsection{Utilities}
$is\_same\_type\,ty1,\,ty2$ is true iff. $ty1$ and $ty2$ are the same
type modulo renaming of type variables.
=SML
fun ⦏is_same_type⦎ (ty1:TYPE) (ty2:TYPE) : bool = (
	is_type_instance ty1 ty2 andalso is_type_instance ty2 ty1
);
=TEX
In the following, the branch for the empty list is just a placeholder.
The function should not be called with an empty list argument.
=SML
fun ⦏list_antiunify⦎ (tyl: TYPE list) : TYPE = (
	let	fun aux [] = mk_vartype "'0"
		|   aux [ty] = ty
		|   aux (ty::more) = antiunify(ty, aux more);
	in	aux tyl
	end
);
=TEX
\section{TYPES}\label{TYPES}
In this section we give the Standard ML types used in the symbol table module.

%\subsection{Visible Types}
%\subsection{Private Types}
The following datatype is used to encode the various declarative operations.
Note that:

\begin{enumerate}
\item
the various fixity operations are merged into a single case parameterised
by a $FIXITY$;
\item
there is no $UnDeclFixity$ --- this operation corresponds to a nonfix
declaration;
\item
the $set\_language$ operation is not catered for here.
\end{enumerate}
=SML
datatype ⦏DECL⦎	=	⦏DeclTerminator⦎ of string
			|	⦏UnDeclTerminator⦎ of string
			|	⦏DeclFixity⦎ of string * FIXITY
			|	⦏DeclAlias⦎ of string * (string * TYPE)
			|	⦏UnDeclAlias⦎ of string * (string * TYPE)
			|	⦏DeclTypeAbbrev⦎ of string * (string list * TYPE)
			|	⦏UnDeclTypeAbbrev⦎ of string
			|	⦏SetLanguage⦎ of string
			|	⦏DeclConstLanguage⦎ of string * string
			;
=TEX
\section{THEORY DATABASE ACCESS FUNCTIONS}
\label{ThyDb1}

There are two groups of functions for accessing the theory database,
they are split to allow for the proper declare before use requirements
of Standard~ML.  The other group is in section~\ref{ThyDb2}.

The symbol table module uses a single slot in the theory user data
under the key ``pp'st'' to hold the declarations which apply
to the theory. The declarations are held as a fairly direct encoding
of a list of $DECL$s.

\subsection{Utilities For Accessing the User Data}
In this section we define the functions we use to fetch and store the
lists of $USER\_DATUM$s belonging to the symbol table held in theories.
=SML
val ⦏ud_key⦎ = "pp'st";
=TEX
The following function is the only place at which we pass an unknown
theory name to the kernel interface.
=SML
fun ⦏fetch_sym_tab_data⦎ (thy : string) : USER_DATUM list = (
	if thy mem theory_names () orelse thy = "-"
	then	case get_user_datum thy ud_key handle Fail _ => UD_Int(0, []) of
			(UD_Int(0, uds)) => uds
		|	_ => fail "fetch_sym_tab_data" 20001 [fn()=>thy]
	else	fail "fetch_sym_tab_data" 20601 [fn()=>thy]
);
=TEX
The theory name argument to $store\_sym\_tab\_datum$ and
$delete\_sym\_tab\_datum$ are only used in error messages.
=SML
fun ⦏store_sym_tab_datum⦎ (ud : USER_DATUM) : unit = (
	let	val uds = (
			case get_user_datum "-" ud_key handle Fail _ => UD_Int(0, []) of
				(UD_Int(0, uds)) => uds
			|	_ => fail "fetch_sym_tab_data" 20001 [fn()=>"-"]);
	in 	set_user_datum(ud_key, UD_Int(0, ud :: uds))
	end
);
=TEX
We sometimes need to delete entries. $delete\_sym\_tab\_datum$
does this (and does nothing if the entry to be deleted is not there).
=SML
fun ⦏list_eq⦎ eq (a :: x) (b :: y) = eq (a,b) andalso list_eq eq x y
| list_eq eq [] [] = true
| list_eq eq _ _ = false;

fun ⦏ud_equals⦎ (UD_Term (tm,udl):USER_DATUM) : USER_DATUM -> bool = (fn ud2 =>
	case ud2 of
	UD_Term (tm1,udl1) => (tm =$ tm1) andalso list_eq (uncurry ud_equals) udl udl1
	| _ => false
) | ud_equals (UD_Type(ty,udl)) = (fn ud2 =>
	case ud2 of
	UD_Type (ty1,udl1) => (ty =: ty1) andalso list_eq (uncurry ud_equals) udl udl1
	| _ => false
) | ud_equals (UD_String(st,udl)) = (fn ud2 =>
	case ud2 of
	UD_String (st1,udl1) => (st = st1) andalso list_eq (uncurry ud_equals) udl udl1
	| _ => false
) | ud_equals (UD_Int(n,udl)) = (fn ud2 =>
	case ud2 of
	UD_Int (n1,udl1) => (n = n1) andalso list_eq (uncurry ud_equals) udl udl1
	| _ => false
);
=TEX
=SML
fun ⦏delete_sym_tab_datum⦎ (ud : USER_DATUM) : unit = (
	let	val uds = (
			case get_user_datum "-" ud_key handle Fail _ => UD_Int(0, []) of
				(UD_Int(0, uds)) => uds
			|	_ => fail "fetch_sym_tab_data" 20001 [fn()=>"-"]);
		val ud_equals_ud = ud_equals ud;
	in 	set_user_datum(ud_key, UD_Int(0, uds drop ud_equals_ud))
	end
);
=TEX
\subsection{Encoding and Decoding Functions}
First of all we give an encoding for $FIXITY$ values.
We encode constructors as small numbers, since on most Standard ML compilers
these are held in a single word of storage.
=SML
fun ⦏encode_fixity⦎ (fix : FIXITY) : USER_DATUM = (
	case fix of
		Nonfix => UD_Int(0, [])
	|	Binder => UD_Int(1, [])
	|	Infix (LeftAssoc, n) => UD_Int(2, [UD_Int(n, [])])
	|	Infix (RightAssoc, n) => UD_Int(3, [UD_Int(n, [])])
	|	Prefix p => UD_Int(4, [UD_Int(p, [])])
	|	Postfix p => UD_Int(5, [UD_Int(p, [])])
);
=TEX
=SML
fun ⦏decode_fixity⦎ (ud : USER_DATUM) : FIXITY = (
	case ud of
		UD_Int(0, []) => Nonfix
	|	UD_Int(1, []) => Binder
	|	UD_Int(2, [UD_Int(n, [])]) => Infix (LeftAssoc, n)
	|	UD_Int(3, [UD_Int(n, [])]) => Infix (RightAssoc, n)
	|	UD_Int(4, [UD_Int(p, [])]) => Prefix p
	|	UD_Int(5, [UD_Int(p, [])]) => Postfix p
	|	_ => fail "decode_fixity" 20001 []
);
=TEX
=SML
fun ⦏encode_decl⦎ (dec : DECL) : USER_DATUM = (
	case dec of
		DeclTerminator t => UD_Int(0, [UD_String(t, [])])
	|	UnDeclTerminator t => UD_Int(1, [UD_String(t, [])])
	|	DeclFixity (s, fix)  => UD_Int(2, [UD_String(s, [encode_fixity fix])])
	|	DeclAlias (a, (s, ty)) =>
			UD_Int(3, [UD_String(a, [UD_String(s, [UD_Type(ty, [])])])])
	|	UnDeclAlias (a, (s, ty)) =>
			UD_Int(4, [UD_String(a, [UD_String(s, [UD_Type(ty, [])])])])
	|	DeclTypeAbbrev (a, (args, ty)) =>
			UD_Int(5, [UD_String(a, [UD_Type(ty, map
			 ((switch(curry UD_String))[]) args)])])
	|	UnDeclTypeAbbrev a => UD_Int(6, [UD_String(a, [])])
	|	SetLanguage lang => UD_Int(7, [UD_String(lang, [])])
	|	DeclConstLanguage (const, lang) =>
			UD_Int(8, [UD_String(const, [UD_String(lang, [])])])
);
=TEX
=SML
fun ⦏decode_decl⦎ (thy : string) (ud : USER_DATUM) : DECL = (
	case ud of
		UD_Int(0, [UD_String(t, [])]) => DeclTerminator t
	|	UD_Int(1, [UD_String(t, [])]) => UnDeclTerminator t
	|	UD_Int(2, [UD_String(s, [fix])]) => DeclFixity (s, decode_fixity fix)
	|	UD_Int(3, [UD_String(a, [UD_String(s, [UD_Type(ty, [])])])]) =>
				DeclAlias (a, (s, ty))
	|	UD_Int(4, [UD_String(a, [UD_String(s, [UD_Type(ty, [])])])]) =>
				UnDeclAlias (a, (s, ty))
	|	UD_Int(5, [UD_String(a, [UD_Type(ty, args)])]) =>
			DeclTypeAbbrev (a, (map
				(fn UD_String(arg, []) => arg
				| _ => fail "decode_decl" 20001 [fn()=> thy]) args, ty))
	|	UD_Int(6, [UD_String(a, [])]) => UnDeclTypeAbbrev a
	|	UD_Int(7, [UD_String(lang, [])]) => SetLanguage lang
	|	UD_Int(8, [UD_String(const, [UD_String(lang, [])])]) =>
			DeclConstLanguage (const, lang)
	|	_ => fail "decode_decl" 20001 [fn()=> thy]
);
=TEX
The following function is used to extract selected declarations from
a theory.
=SML
fun ⦏get_selected_decls⦎ (thy : string) (sel : DECL -> bool) : DECL list = (
	let	fun aux acc [] = acc
		|   aux acc (ud :: more) = (
			let	val dec = decode_decl thy ud;
			in	if sel dec
				then 	aux (dec :: acc) more
				else aux acc more
			end
		);
	in	aux [] (fetch_sym_tab_data thy)
	end
);
=TEX
\section{THE CACHES AND THEIR ACCESS FUNCTIONS}
In this section we define the caches in which symbol table information relating
to the current context is stored for rapid access. We also define the
functions which read and write these caches (the read functions are part of
the visible interface).

\subsection{The Caches}
The type information cache contains a field for each type
abbreviation or constructor giving
the information returned by $get\_type\_info$ in the detailed design
(this is the information needed when parsing a type)
and a field for a constructor
giving any type abbreviations for instances of the type
(this is the field used by $get\_type\_abbrev$).
(With the current use of this, exactly one of the two fields will
be present.)
=SML
val ⦏ty_info_cache⦎ : (
	(int * (string list * TYPE) OPT) *
	(string * string list * TYPE) list ) E_DICT ref = ref initial_e_dict;
=TEX
The constant information cache contains a field for each
name which gives the
information returned by $get\_const\_info$
(this is the field used by $resolve\_alias$)
and a field giving any aliases which may resolve to the name
(this is the field used by $get\_alias$).
=SML
val ⦏const_info_cache⦎ : ((TYPE * ((string * TYPE)list)) * ((string * TYPE)list))E_DICT ref
					= ref initial_e_dict;
=TEX
=SML
val ⦏fixity_cache⦎ : FIXITY E_DICT ref = ref initial_e_dict;
=TEX
=SML
val ⦏terminators⦎ : string list list ref = ref[];
=TEX
For uniformity, the current language is held in an assignable variable
(although it may fairly rapidly be computed from the theory database).
=SML
val ⦏language⦎ : string ref = ref "HOL";
=TEX
=TEX
The next cache gives the language or languages associated with a constant.
=SML
val ⦏const_language_cache⦎ : string list E_DICT ref = ref initial_e_dict;
=TEX
\subsection{The Cache Access Functions}
The following function restores the caches to their initial state:
=SML
fun ⦏clear_caches⦎ (():unit) : unit = (
	ty_info_cache := initial_e_dict;
	const_info_cache := initial_e_dict;
	fixity_cache := initial_e_dict;
	terminators := [];
	const_language_cache := initial_e_dict;
	language := "HOL"
);
=TEX
It is actually more convenient to have a single update function
parameterised by the type of declaration being made. This requires a few
local utilities to cope with the more complex cases:
=TEX
=SML
fun ⦏cache_terminator⦎ (t : string) = (
	let	val et = explode t;
		val len = length et;
		fun aux [] = [et]
		|   aux (h :: more) = (
			if length h > len
			then h :: aux more
			else et :: h :: more
		);
	in	terminators := aux(!terminators)
	end
);
=TEX
=SML
fun ⦏uncache_terminator⦎ (t : string) = (
	terminators := !terminators less explode t
);
=TEX
=SML
fun ⦏cache_fixity⦎ (s : string, fix : FIXITY) = (
	case fix of
		Nonfix => fixity_cache := e_delete s (!fixity_cache)
	|	_ => fixity_cache := e_enter s fix (!fixity_cache)
);
=TEX
=SML
fun ⦏cache_alias⦎ (thy : string) (a : string, (s:string, ty : TYPE)) : unit = (
	let
val cache1 =
	e_enter
	a
	(case e_lookup a (!const_info_cache) of
		Value((ty', alinfs), atys) => (
			 ((antiunify(ty, ty'), (s, ty) :: alinfs), atys)
	) |	Nil => (
			case get_const_type a of
				Value ty' => ((antiunify(ty, ty'), [(s, ty), (a, ty')]), [])
			|	_ => ((ty, [(s, ty)]), [])
	))
	(!const_info_cache);
val cache2 =
	e_enter
	s
	(case e_lookup s (!const_info_cache) of
		Value((ty', alinfs), atys) => (
			 ((ty', alinfs), (a, ty) :: atys)
	) |	Nil => (
			case get_const_type s of
				Value ty' => ((ty', [(s, ty')]), [(a, ty), (s, ty')])
			|	Nil => fail "cache_alias" 20001 [fn()=>thy]
	))
	cache1;
	in	const_info_cache := cache2
	end
);
=TEX
=SML
fun ⦏uncache_alias⦎ (thy : string) (a : string, (s:string, ty : TYPE)) : unit = (
	let
val cache0 = !const_info_cache;
val cache1 =
	case e_lookup a cache0 of
		Value((_, alinfs), atys) => (
			case (alinfs drop
				(fn(s', ty') => s = s'
					andalso is_same_type ty ty'), atys) of
				([], []) => ( e_delete a cache0
			) |	(ctys, _) => (
				let	val ty' = list_antiunify (map snd ctys);
				in	e_enter a ((ty', ctys), atys) cache0
				end
			)
	) |	Nil => ( cache0
	);
val cache2 =
	case e_lookup s cache1 of
		Value(ty_alinfs, atys) => (
			e_enter s
			(ty_alinfs, atys drop
				(fn(a', ty') => a = a' andalso is_same_type ty ty'))
			cache1
	) |	Nil => ( if	a = s
			then	e_enter s
				((force_value(get_const_type s) handle Fail _ => ty, []),
				 [])
				cache1
			else	cache1
	);
	in	const_info_cache := cache2
	end
);
=TEX
The handler below is defensive against the odd but permitted
case when $ty$ is a type variable.
=SML
fun ⦏cache_type_abbrev⦎(a : string, (pars : string list, ty : TYPE)) : unit = (
	let	val cache1 = e_enter a ((length pars, Value (pars, ty)), []) (!ty_info_cache);
		val cache2 =
			let	val (con, args) = dest_ctype ty;
				val (info, tyabs) =
					case e_lookup con cache1 of
						Value i_ta => i_ta
					|	Nil => ((length args, Nil), []);
			in	e_enter con (info, (a, pars, ty)::tyabs) cache1
			end	handle Fail _ => cache1;
	in	ty_info_cache := cache2
	end
);
=TEX
Again we have a handler to defend against an unusual case.
=SML
fun ⦏uncache_type_abbrev⦎ (a : string) : unit = (
	case e_lookup a (!ty_info_cache) of
		Value ((_, Value (_, ty)), _) => (
		let	val cache1 = e_delete a (!ty_info_cache);
			val cache2 =
			let	val con = fst(dest_ctype ty);
				val (info, tyabs) =
					case e_lookup con cache1 of
						Value i_ta => i_ta
					|	Nil => ((0, Nil), []);
				val tyabs' = tyabs drop (fn (n, _, _) => n = a);
			in	case tyabs' of
					[] => e_delete con cache1
				|	_ => e_enter con (info, tyabs') cache1
			end	handle Fail _ => cache1;
		in	ty_info_cache := cache2
		end
	) |	_ => ()
);
=TEX
The following is required here for use in {\em cache\_const\_language}.
=SML
fun ⦏get_language⦎ (thy : string) : string = (
	let	fun sel (SetLanguage _) = true
		|   sel _ = false;
	in	case get_selected_decls thy sel of
			SetLanguage lang :: _ => lang
		|	_ => "HOL"
	end	handle X => reraise X "get_language"
);
=TEX
In the following, the parameter is true if we are also to add in the language associated with the theory of the constant (which we need to do when we are processing a language declaration, but not when we are just caching the language of a regular constant for efficient access).

=SML
fun ⦏cache_const_language⦎ (add_thylang : bool)
	(s : string, newlang : string) = (
	const_language_cache :=
	e_enter s
	(case e_lookup s (!const_language_cache) of
		Value langs => (
		if	contains langs newlang
		then	langs
		else	langs @ [newlang]
	) |	Nil => (
		if	add_thylang
		then	let	val thy = get_const_theory s;
				val thylang = get_language thy;
			in	[newlang] grab thylang
			end	handle Fail _ => [newlang]
		else	[newlang]))
	(!const_language_cache)
);
=TEX
=SML
fun ⦏cache_language⦎ (thy : string) (lang : string) : unit = (
	language := lang
);
=TEX
=SML
fun ⦏cache_decl⦎ (thy : string) (dec : DECL) : unit = (
	case dec of
		DeclTerminator t => cache_terminator t
	|	UnDeclTerminator t => uncache_terminator t
	|	DeclFixity sfix  => cache_fixity sfix
	|	DeclAlias asty => cache_alias thy asty
	|	UnDeclAlias asty => uncache_alias thy asty
	|	DeclTypeAbbrev aargsty => cache_type_abbrev aargsty
	|	UnDeclTypeAbbrev  a => uncache_type_abbrev a
	|	SetLanguage lang => cache_language thy lang
	|	DeclConstLanguage const_lang => cache_const_language true const_lang
);
=TEX
\section{THEORY DATABASE ACCESS FUNCTIONS}
\label{ThyDb2}

This is the second group of theory database access functions,
the first group was given in section~\ref{ThyDb1}.

\subsection{Extracting Data}
Occasionally we need to extract from a theory the
declarations relating to a particular name.
=SML
fun ⦏get_id_data⦎ (id : string) (thy : string) : USER_DATUM list = (
		fetch_sym_tab_data thy
	drop	(fn UD_Int(_, [UD_String(s, _)]) => s <> id | _ => true)
);
=TEX
When a declaration is undone, we must often adjust the appropriate caches to redo
any declarations in the context which the undone declaration may have
overridden. The following function is used to do this, and is given a
predicate on $DECL$s to filter the declarations which will be redone.
=SML
fun ⦏recache_theory⦎ (current : string) (sel : DECL -> bool) : unit = (
	map
	(fn thy => map (cache_decl thy) (get_selected_decls thy sel))
	(get_ancestors current);
	()
);
=TEX

\subsection{Update Functions}
As with the cache update functions, it is convenient to have a single update
function parameterised by the type of declaration being made.
As theory updates are never done without also updating the cache the theory
update function calls the cache update function when its own work is complete.
Again we have a selection of local utilities to assist:
=TEX
=SML
fun ⦏store_terminator⦎ (thy : string) (s : string) : unit = (
	delete_sym_tab_datum (encode_decl(UnDeclTerminator s));
	store_sym_tab_datum (encode_decl(DeclTerminator s))
);
=TEX
=SML
fun ⦏unstore_terminator⦎ (thy : string) (s : string) : unit = (
	let	val uds = get_id_data s thy;
		fun aux ud = (
			case decode_decl thy ud of
				DeclTerminator s' => s' = s
			|	_ => false
		);
	in	if any uds aux
		then	delete_sym_tab_datum (find uds aux)
		else	store_sym_tab_datum (encode_decl(UnDeclTerminator s))
	end
);
=TEX
=SML
fun ⦏store_fixity⦎ (thy : string) (s : string, fix : FIXITY) : unit = (
	let	val uds = get_id_data s thy;
		fun aux ud = (
			case decode_decl thy ud of
				DeclFixity(s', _) => s' = s
			|	_ => false
		);
	in	if any uds aux
		then 	case fix of
				Nonfix => delete_sym_tab_datum (find uds aux)
			|	_ => (
					delete_sym_tab_datum (find uds aux);
					store_sym_tab_datum (encode_decl(DeclFixity (s, fix)))
			)
		else	store_sym_tab_datum (encode_decl(DeclFixity (s, fix)))
	end
);
=TEX
=SML
fun ⦏store_alias⦎ (thy : string) (a : string, (s:string, ty:TYPE)) : unit = (
	store_sym_tab_datum (encode_decl(DeclAlias (a, (s, ty))))
);
=TEX
=SML
fun ⦏unstore_alias⦎ (thy : string) (a : string, (s:string, ty:TYPE)) : unit = (
	let	val uds = get_id_data a thy;
		fun aux ud = (
			case decode_decl thy ud of
				DeclAlias(a', (s', ty')) => a = a' andalso s = s'
					andalso is_same_type ty ty'
			|	_ => false
		);
	in	if any uds aux
		then	delete_sym_tab_datum (find uds aux)
		else	store_sym_tab_datum (encode_decl(UnDeclAlias (a, (s, ty))))
	end
);
=TEX
=SML
fun ⦏store_type_abbrev⦎ (thy : string) (a : string, (args:string list, ty:TYPE)) : unit = (
	let	val uds = get_id_data a thy;
		fun aux ud = (
			case decode_decl thy ud of
				DeclTypeAbbrev(a', _) => a = a'
			|	_ => false
		);
	in	if any uds aux
		then	delete_sym_tab_datum (find uds aux)
		else	()
	end;
	store_sym_tab_datum (encode_decl(DeclTypeAbbrev (a, (args, ty))))
);
=TEX
=SML
fun ⦏unstore_type_abbrev⦎ (thy : string) (a : string) : unit = (
	let	val uds = get_id_data a thy;
		fun aux ud = (
			case decode_decl thy ud of
				DeclTypeAbbrev(a', _) => a = a'
			|	_ => false
		);
	in	if any uds aux
		then	delete_sym_tab_datum (find uds aux)
		else	store_sym_tab_datum (encode_decl(UnDeclTypeAbbrev a))
	end
);
=TEX
=SML
fun ⦏store_language⦎ (thy : string) (lang : string) : unit = (
	let	val uds = fetch_sym_tab_data thy;
		fun aux ud = (
			case decode_decl thy ud of
				SetLanguage _ => true
			|	_ => false
		);
	in	if any uds aux
		then	delete_sym_tab_datum (find uds aux)
		else	()
	end;
	store_sym_tab_datum (encode_decl(SetLanguage lang))
);
=TEX
=SML
fun ⦏store_const_language⦎ (thy : string) (const_lang : string * string) : unit = (
	let	val uds = fetch_sym_tab_data thy;
		fun aux ud = (
			case decode_decl thy ud of
				DeclConstLanguage x => x = const_lang
			|	_ => false
		);
	in	if any uds aux
		then	delete_sym_tab_datum (find uds aux)
		else	()
	end;
	store_sym_tab_datum (encode_decl(DeclConstLanguage const_lang))
);
=TEX
=SML
fun ⦏store_decl⦎ (area : string) (dec : DECL) : unit = (
	let	val thy = get_current_theory_name();
	in
		case get_current_theory_status() of
			TSNormal => (
				(case dec of
					DeclTerminator t => store_terminator thy t
				|	UnDeclTerminator t => unstore_terminator thy t
				|	DeclFixity sfix  => store_fixity thy sfix
				|	DeclAlias asty => store_alias thy asty
				|	UnDeclAlias asty => unstore_alias thy asty
				|	DeclTypeAbbrev aargsty => store_type_abbrev thy aargsty
				|	UnDeclTypeAbbrev  a => unstore_type_abbrev thy a
				|	SetLanguage lang => store_language thy lang
				|	DeclConstLanguage const_lang =>
						store_const_language thy const_lang
				);
				cache_decl thy dec
		) |	_ => fail area 20002 [fn () => thy]
	end
);
=TEX
\section{ACCESS FUNCTIONS}
\subsection{Terminators}
=SML
fun ⦏get_current_terminators⦎ (():unit) : string list list =(
	!terminators
);
=TEX
The following function checks that a string obeys the rules for terminators
identified in \cite{DS/FMU/IED/DEF001}.
=SML
fun ⦏is_ok_terminator⦎ (s : string) = (
	let	fun strip_macro (s :: more) = (
			if is_macro s
			then more
			else strip_macro more
		) | strip_macro [] = [];

		fun ok_rest (s :: more) = (
			(is_alnum s orelse is_symbolic s orelse is_copula s)
			andalso ok_rest more
		) | ok_rest [] = true;
	in	case explode s of
			s :: more => (
				if is_macro s
				then ok_rest(strip_macro more)
				else is_symbolic s andalso ok_rest more
		) |	[] => false
	end
);
fun ⦏declare_terminator⦎ (s :  string) : unit = (
	if not(is_ok_terminator s)
	then fail "declare_terminator" 20101 [fn()=>s]
	else if explode s mem (!terminators)
	then fail "declare_terminator" 20102 [fn()=>s]
	else store_decl "declare_terminator" (DeclTerminator s)
);
=TEX
=SML
fun ⦏undeclare_terminator⦎ (s : string) : unit = (
	let	fun sel (UnDeclTerminator s') = s = s'
		|   sel (DeclTerminator s') = s = s'
		|   sel _ = false;
	in	if not(explode s mem !terminators)
		then fail "undeclare_terminator" 20103 [fn()=>s]
		else (
			store_decl "undeclare_terminator" (UnDeclTerminator s);
			recache_theory (get_current_theory_name()) sel
		)
	end
);
=TEX
\subsection{Fixity}
=SML
fun ⦏get_fixity⦎ (s : string) : FIXITY = (
	case e_lookup s (!fixity_cache) of
		Value fix => fix
	| 	_ => Nonfix
);
=TEX
$check\_id$ checks whether a string is a valid identifier and reports
an error as given by its first two arguments if not.
=SML
fun ⦏check_id⦎ (area : string) (msg : int) (s : string) : unit = (
	(case (lex (get_current_terminators()) (fn _ => Nonfix) [Text s])
		handle Fail _ => fail area 20201 [fn()=>s]
	 of
		[HTName s', HTEos] => (()
	) |	_ => fail area msg [fn()=>s])
	handle Fail _ => fail area msg [fn()=>s]
);
=TEX
$check\_not\_comma$ checks whether a string is a comma, and if so reports
error 20202 as required by $declare\_prefix$ etc.
=SML
fun ⦏check_id_not_comma⦎ (area : string) (s : string) : unit = (
	if s = ","
	then fail area 20202 []
	else ()
);
=TEX
=SML
fun ⦏declare_binder⦎ (s : string) = (
	check_id "declare_binder" 20201 s;
	check_id_not_comma "declare_binder" s;
	store_decl "declare_binder" (DeclFixity(s, Binder))
);
=TEX
=SML
fun ⦏declare_left_infix⦎ (prec : int, s : string) : unit = (
	check_id "declare_left_infix" 20201 s;
	store_decl "declare_left_infix" (DeclFixity(s, Infix (LeftAssoc, prec)))
);
=TEX
=SML
fun ⦏declare_right_infix⦎ (prec : int, s : string) : unit = (
	check_id "declare_right_infix" 20201 s;
	store_decl "declare_right_infix" (DeclFixity(s, Infix (RightAssoc, prec)))
);
=TEX
=SML
val ⦏declare_infix⦎  : (int * string) -> unit = declare_right_infix;
=TEX
=SML
fun ⦏declare_prefix⦎ (prec : int, s : string) : unit = (
	check_id "declare_prefix" 20201 s;
	check_id_not_comma "declare_prefix" s;
	store_decl "declare_prefix" (DeclFixity(s, Prefix prec))
);
=TEX
=SML
fun ⦏declare_postfix⦎ (prec : int, s : string) : unit = (
	check_id "declare_postfix" 20201 s;
	check_id_not_comma "declare_postfix" s;
	store_decl "declare_postfix" (DeclFixity(s, Postfix prec))
);
=TEX
=SML
fun ⦏declare_nonfix⦎ (s : string) : unit = (
	check_id "declare_nonfix" 20201 s;
	check_id_not_comma "declare_nonfix" s;
	let	fun sel (DeclFixity (s', _)) = s = s'
		|   sel _ = false;
	in	case get_fixity s of
			Nonfix => fail "declare_nonfix" 20203 [fn()=>s]
		|	_ => (
			store_decl "declare_nonfix" (DeclFixity(s, Nonfix));
			recache_theory (get_current_theory_name()) sel
		)
	end
);
=TEX
\subsection{Constants and Aliases}
=SML
fun ⦏get_const_info⦎ (c : string) : (TYPE * ((string * TYPE)list)) OPT = (
	case e_lookup c (!const_info_cache) of
		Nil => (
			case get_const_type c of
				Value ty => Value(ty, [(c, ty)])
			|	Nil => Nil
	) |	Value (v, _) => Value v
);
=TEX
\subsection{Constants and Aliases}
=SML
fun ⦏get_alias_info⦎ (a : string) : (string * TYPE)list OPT = (
	case e_lookup a (!const_info_cache) of
		Nil => ( Nil
	) |	Value (_, atys) => Value atys
);
=TEX

=SML
fun ⦏declare_alias⦎ (s : string, tm : TERM) : unit = (
	check_id "declare_alias" 20306 s;
	if not (is_const tm)
	then term_fail "declare_alias" 20301 [tm]
	else	let	val (c, ty) = dest_const tm
		in	if is_Nil(get_const_type c)
			then term_fail "declare_alias" 20305 [tm]
			else case get_const_info s of
				Nil => store_decl"declare_alias"(DeclAlias(s, (c, ty)))
			|	Value (_, stys) => (
					if any stys (fn (c', ty') => c = c' andalso
					 is_same_type ty ty')
					then fail "declare_alias" 20302 [fn()=>s, fn()=>c]
					else store_decl"declare_alias"(DeclAlias(s, (c, ty)))
			)
		end
);
=TEX
{\it uncache\_alias} gets the cache just right, so we don't have to recache the
theory.
=SML
fun ⦏undeclare_alias⦎ (s : string, tm : TERM) : unit = (
	if not (is_const tm)
	then term_fail "undeclare_alias" 20301 [tm]
	else	let	val (c, ty) = dest_const tm;
		in	case get_const_info s of
				Nil => store_decl"undeclare_alias"(UnDeclAlias(s, (c, ty)))
			|	Value (_, stys) => (
					if not(any stys (fn (c', ty') => c = c' andalso
					 is_same_type ty ty'))
					then fail "undeclare_alias" 20303 [fn()=>s, fn()=>c]
					else store_decl"undeclare_alias"
						(UnDeclAlias(s, (c, ty)))
			)
		end
);
=TEX
=SML
fun ⦏resolve_alias⦎ (s : string, ty : TYPE) : TERM = (
	case get_const_info s of
		Nil => fail "resolve_alias" 20304 [fn()=>s]
	|	Value (_, stys) => (
			(mk_const(fst(find stys (fn(s', ty') => is_type_instance ty ty')), ty))
			handle Fail _ => fail "resolve_alias" 20304 [fn()=>s]
	)
);
=TEX
=SML
fun ⦏get_alias⦎ (s : string, ty : TYPE) : string = (
	case e_lookup s (!const_info_cache) of
		Value (_, atys) => (
			(fst(find atys (fn(a, ty') => is_type_instance ty ty')))
			handle Fail _ => s
		) |	Nil => s
);
=TEX
\subsection{Types and Type Abbreviations}
=SML
fun ⦏get_type_info⦎ (t : string) : (int * (string list * TYPE) OPT) OPT = (
	case e_lookup t (!ty_info_cache) of
		 Value((info as (_, Value _)), _) => (
			Value info
	) | 	_ => (
			case get_type_arity t of
				Value a => Value(a, Nil)
			|	Nil => Nil
	)
);
=TEX
=SML
fun ⦏declare_type_abbrev⦎ (a : string, args : string list, ty : TYPE) : unit = (
	check_id "declare_type_abbrev" 20408 a;
	if not(all_different args)
	then fail "declare_type_abbrev" 20407 [fn()=>format_list Combinators.I args ", "]
	else case get_type_info a of
		Nil => (
			store_decl"declare_type_abbrev"(DeclTypeAbbrev (a, (args, ty)))
	) |	Value(_, Value _) => (
			warn "declare_type_abbrev" 20401 [fn()=>a];
			store_decl"declare_type_abbrev"(DeclTypeAbbrev (a, (args, ty)))
	) |	Value(_, Nil) => (
			warn "declare_type_abbrev" 20402 [fn()=>a];
			store_decl"declare_type_abbrev"(DeclTypeAbbrev (a, (args, ty)))
	)
);
=TEX
=SML
fun ⦏undeclare_type_abbrev⦎ (a : string) : unit = (
	let	fun sel (DeclTypeAbbrev(a', _)) = a' = a
		|   sel (UnDeclTypeAbbrev a') = a' = a
		|   sel _ = false;
	in	case get_type_info a of
			Value(_, Value _) => (
				store_decl"undeclare_type_abbrev"
				(UnDeclTypeAbbrev a);
				recache_theory (get_current_theory_name()) sel
		) |	_ => fail "undeclare_type_abbrev" 20403 [fn()=>a]
	end
);
=TEX
=SML
fun ⦏is_type_abbrev⦎ (a : string) : bool =(
	case get_type_info a of
		Value(_, Value _) => true
	|	_ => false
);
=TEX
=SML
fun ⦏get_type_abbrev⦎ (ty : TYPE) : (string * TYPE list) OPT = (
	let	val con = fst(dest_ctype ty);
		val (_, tyabs) = force_value(e_lookup con (!ty_info_cache));
		fun aux [] = Nil
		|   aux ((n, pars, typat)::more) = (
			let	val subs = type_match ty typat;
				fun maplet par = (
					let	val vty = mk_vartype par;
					in	(rassoc1 subs vty, vty)
					end
				);
				val parsubs = map maplet pars;
				val test_ty = inst_type parsubs typat;
			in	if	test_ty = ty
				then	Value(n, map fst parsubs)
				else	aux more
			end	handle Fail _ => aux more
		);
	in	aux tyabs
	end	handle	Fail _ => Nil
);
=TEX
=SML
fun ⦏expand_type_abbrev⦎ (a : string, actuals : TYPE list) : TYPE = (
	case get_type_info a of
		Value(_, Value (formals, ty)) => (
			let	val subs = (combine actuals (map mk_vartype formals))
					handle X =>
						divert X "combine" "expand_type_abbrev"
						(if length formals = 1 then 20405 else 20406)
						[fn()=> a,
						 fn()=>string_of_int(length formals),
						 fn()=>string_of_int(length actuals)];
			in	inst_type subs ty
			end
	) |	_ => fail "expand_type_abbrev" 20404 [fn()=>a]
);
=TEX
\subsection{Languages}
=SML
fun ⦏set_current_language⦎ (lang : string) : unit = (
	let	fun sel (DeclConstLanguage _) = true
		|   sel (SetLanguage _) = true
		|   sel _ = false;
	in	const_language_cache := initial_e_dict;
		store_decl "set_current_language" (SetLanguage lang);
		recache_theory (get_current_theory_name()) sel
	end
);
=TEX
=SML
fun ⦏get_current_language⦎ (() : unit) : string = (
	!language
);
=TEX

Certain constants are always HOL.  Note that in the uses of $ord$ below we
do not need to explode the string to get the first character since ord is
defined to look at the first of the string.  Note further that $ord$ of an
empty string yeilds an exception but the tests of $size$ will protect it.

=SML
local
	val ordquote = ord "`";
	val orddquote = ord "\"";
in
fun ⦏get_const_language⦎ (s : string) : string list = (
	case e_lookup s (!const_language_cache) of
		Value lang => lang
	|	Nil => [
			if is_all_decimal s
			orelse (size s = 2 andalso ordquote = ord s)
			orelse (size s > 1 andalso orddquote = ord s)
			then "HOL"
			else
			let	val thy = get_const_theory s;
				val lang = get_language thy;
			in	cache_const_language false (s, lang);
				lang
			end	handle Fail _ =>
				get_current_language()
		]
);
end (* of local *);
=TEX
=SML
fun ⦏declare_const_language⦎ (const_lang as (s : string, l : string)) : unit = (
	case get_const_type s of
		Nil => fail "declare_const_language" 20501 [fn() => s]
	|	Value _ => (
			store_decl "declare_const_language" (DeclConstLanguage const_lang)
	)
);
=TEX
\subsection{Theory Access Functions}
=SML
fun ⦏get_terminators⦎ (thy : string) : string list = (
	let	fun sel (DeclTerminator _) = true
		|   sel _ = false;
		fun coerce(DeclTerminator t) = t
		|   coerce _ = fail "get_terminators" 20003 [fn()=> "coercion failed"];
	in	map coerce(get_selected_decls thy sel)
	end	handle X => reraise X "get_terminators"
);
=TEX
=SML
fun ⦏get_undeclared_terminators⦎ (thy : string) : string list = (
	let	fun sel (UnDeclTerminator _) = true
		|   sel _ = false;
		fun coerce(UnDeclTerminator t) = t
		|   coerce _ = fail "get_undeclared_terminators" 20003
			[fn()=> "coercion failed"];
	in	map coerce(get_selected_decls thy sel)
	end	handle X => reraise X "get_terminators"
);
=TEX
=SML
fun ⦏get_binders⦎ (thy : string) : string list = (
	let	fun sel (DeclFixity(_, Binder)) = true
		|   sel _ = false;
		fun coerce(DeclFixity(s, Binder)) = s
		|   coerce _ = fail "get_binders" 20003 [fn()=> "coercion failed"];
	in	map coerce(get_selected_decls thy sel)
	end	handle X => reraise X "get_binders"
);
=TEX
=SML
fun ⦏get_left_infixes⦎ (thy : string) : (int * string) list = (
	let	fun sel (DeclFixity(_, Infix (LeftAssoc, _))) = true
		|   sel _ = false;
		fun coerce(DeclFixity(s, Infix (_, p))) = (p, s)
		|   coerce _ = fail "get_infixes" 20003 [fn()=> "coercion failed"];
	in	map coerce(get_selected_decls thy sel)
	end	handle X => reraise X "get_infixes"
);
=TEX
=SML
fun ⦏get_right_infixes⦎ (thy : string) : (int * string) list = (
	let	fun sel (DeclFixity(_, Infix (RightAssoc, _))) = true
		|   sel _ = false;
		fun coerce(DeclFixity(s, Infix (_, p))) = (p, s)
		|   coerce _ = fail "get_infixes" 20003 [fn()=> "coercion failed"];
	in	map coerce(get_selected_decls thy sel)
	end	handle X => reraise X "get_infixes"
);
=TEX
=SML
fun ⦏get_prefixes⦎ (thy : string) : (int * string) list = (
	let	fun sel (DeclFixity(_, Prefix _)) = true
		|   sel _ = false;
		fun coerce(DeclFixity(s, Prefix p)) = (p, s)
		|   coerce _ = fail "get_prefixes" 20003 [fn()=> "coercion failed"];
	in	map coerce(get_selected_decls thy sel)
	end	handle X => reraise X "get_prefixes"
);
=TEX
=SML
fun ⦏get_postfixes⦎ (thy : string) : (int * string) list = (
	let	fun sel (DeclFixity(_, Postfix _)) = true
		|   sel _ = false;
		fun coerce(DeclFixity(s, Postfix p)) = (p, s)
		|   coerce _ = fail "get_postfixes" 20003 [fn()=> "coercion failed"];
	in	map coerce(get_selected_decls thy sel)
	end	handle X => reraise X "get_postfixes"
);
=TEX
=SML
fun ⦏get_nonfixes⦎ (thy : string) : string list = (
	let	fun sel (DeclFixity(_, Nonfix)) = true
		|   sel _ = false;
		fun coerce(DeclFixity(s, Nonfix)) = s
		|   coerce _ = fail "get_nonfixes" 20003 [fn()=> "coercion failed"];
	in	map coerce(get_selected_decls thy sel)
	end	handle X => reraise X "get_nonfixes"
);
=TEX
=SML
fun ⦏get_type_abbrevs⦎ (thy : string) : (string * (string list * TYPE)) list = (
	let	fun sel (DeclTypeAbbrev _) = true
		|   sel _ = false;
		fun coerce(DeclTypeAbbrev tyab) = tyab
		|   coerce _ = fail "get_type_abbrevs" 20003 [fn()=> "coercion failed"];
	in	map coerce(get_selected_decls thy sel)
	end	handle X => reraise X "get_type_abbrevs"
);
=TEX
=SML
fun ⦏get_undeclared_type_abbrevs⦎ (thy : string) : string list = (
	let	fun sel (UnDeclTypeAbbrev _) = true
		|   sel _ = false;
		fun coerce(UnDeclTypeAbbrev tyab) = tyab
		|   coerce _ = fail "get_undeclared_type_abbrevs" 20003
			[fn()=> "coercion failed"];
	in	map coerce(get_selected_decls thy sel)
	end	handle X => reraise X "get_undeclared_type_abbrevs"
);
=TEX
=SML
fun ⦏get_aliases⦎ (thy : string) : (string * TERM) list = (
	let	fun sel (DeclAlias _) = true
		|   sel _ = false;
		fun coerce(DeclAlias (a, sty)) = (a, mk_const sty)
		|   coerce _ = fail "get_aliases" 20003 [fn()=> "coercion failed"];
	in	map coerce(get_selected_decls thy sel)
	end	handle X => reraise X "get_aliases"
);
=TEX
=SML
fun ⦏get_undeclared_aliases⦎ (thy : string) : (string * TERM) list = (
	let	fun sel (UnDeclAlias _) = true
		|   sel _ = false;
		fun coerce(UnDeclAlias (a, sty)) = (a, mk_const sty)
		|   coerce _ = fail "get_undeclared_aliases" 20003 [fn()=> "coercion failed"];
	in	map coerce(get_selected_decls thy sel)
	end	handle X => reraise X "get_undeclared_aliases"
);
=TEX
\section{HANDLING CONTEXT CHANGES}
When a theory is opened, we rebuild the caches from scratch. Schemes which
attempted to preserve the information from theories which have not been
unloaded have been considered, but seem to be too complex, because of the
need to ``undo undeclarations'' e.g. if theory $thy1$ has $thy2$ as an ancestor
and $thy1$ contains a nonfix declaration overriding a binder declaration
in $thy2$, then when we change context from $thy1$ to $thy2$ we must
undo the nonfix declaration.
=TEX
=SML
fun ⦏build_theory_caches⦎ (thy : string) : unit = (
	cache_decl thy (SetLanguage(get_language thy))
);
=TEX
When a constant is deleted we delete all aliases for it.
=SML
fun ⦏uncache_const⦎ (t : TERM) : unit = (
	let	val s = fst(dest_const t);
		val aliases = (
			case e_lookup s (!const_info_cache) of
				Value (_, atys) => atys
			|	Nil => []);
		fun aux ((a, ty) :: more) = (
			undeclare_alias (a, mk_const(s, ty));
			aux more
		) | aux [] = ();
	in	(aux aliases;
		const_language_cache := e_delete s (!const_language_cache))
	end
	handle Fail X => error "uncache_const" 20003 [fn()=>get_message X]
);
=TEX
When a type is deleted we delete all type abbreviations involving it.
=SML
fun ⦏uncache_ty⦎
		(tycon : string) : unit = (
	let	val thy = get_current_theory_name();
		fun sel (DeclTypeAbbrev (_, (_, ty))) =
			tycon mem map fst (type_tycons ty)
		|   sel _ = false;
		fun nameof(DeclTypeAbbrev (a, _)) = a
		|   nameof _ = fail "get_type_abbrevs" 20003 [fn()=> "coercion failed"];
		val to_delete = map nameof(get_selected_decls thy sel);
	in	app undeclare_type_abbrev to_delete
	end
);
=TEX
$cache\_theory$ loads the symbol table information contained in a
theory and all its ancestors into the caches.  The order of events is
important.  Function $build_theory_caches$ sets up cache entries for
all of the constants based upon the theory's language then the
$cache_decl$ adds further information for some of the constants.  Note
that the theory's language should only be processed once, this is so
that the original ordering of actions is properly maintained.
=SML
fun ⦏cache_theory⦎ (current : string) : unit = (
	clear_caches();
	map
		(fn thy => (
				build_theory_caches thy
				;
				map	(cache_decl thy)
					(get_selected_decls thy
						(fn (SetLanguage _) => false | _ => true)
					)
			)
		)
		(get_ancestors current);
	()
);
=TEX
The following function sets things up when a new theory has been
introduced. It woudl be very strange, but not impossible, either for
there to be more than one parent or for there to be some constants
or types etc. in the theory as a result of another kernel state change
routine.
=SML
fun ⦏cache_new_theory⦎ (thy : string) : unit = (
	(case (rev (get_parents thy)) of
		parent :: _ => (
			case get_language parent of
			"HOL" => ()
		|	other => set_current_language other
	)|	[]	=> ());
	cache_theory thy
);
=TEX
Of the various classes of kernel state change, identified in
\cite{DS/FMU/IED/DTD012}, only $open\_theory$, $new\_parent$ and the
operations which introduce or
delete types or constants are currently of relevance
to the symbol table module.
We declare our interest in kernel state changes using
the interface defined in \cite{DS/FMU/IED/DTD012}:
=SML
val ⦏On_kernel_state_change⦎ = on_kernel_state_change
	(fn	OpenTheory (current, (_, _)) => cache_theory current
	|	NewTheory thy => cache_new_theory thy
	|	NewParent _ => cache_theory(get_current_theory_name())
	|	DeleteConst c => uncache_const c
	|	DeleteType ty => uncache_ty ty
	|	_ => ()
);
=TEX
\section{MISCELLANEOUS}
=TEX
=SML
fun ⦏restore_defaults⦎ (():unit) : unit = (
	warn "restore_defaults" 20703 [get_current_theory_name];
	set_user_datum(ud_key, UD_Int(0, []));
	cache_theory(get_current_theory_name())
);
=TEX
\section{EPILOGUE}
=SML
end; (* of structure SymbolTable *)
=TEX
=SML
open SymbolTable;
=TEX
\small
\twocolumn[\section{INDEX}]
\printindex

\end{document}



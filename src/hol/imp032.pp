=IGN
********************************************************************************
imp032.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% imp032.doc   ℤ $Date: 2007/03/04 14:17:49 $ $Revision: 2.23 $ $RCSfile: imp032.doc,v $

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

\def\Title{Implementation of the HOL Pretty Printer}

\def\AbstractText{This document contains the HOL pretty printing functions.}

\def\Reference{DS/FMU/IED/IMP032}

\def\Author{A.J. Hammon}


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
%% LaTeX2e port: % imp032.doc   ℤ $Date: 2007/03/04 14:17:49 $ $Revision: 2.23 $ $RCSfile: imp032.doc,v $
%% LaTeX2e port: \documentstyle[hol1,11pt,TQ]{article}
%% LaTeX2e port: 
%% LaTeX2e port: \TPPtitle{Implementation of the HOL Pretty Printer}
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP032}
%% LaTeX2e port: \def\SCCSissue{$Revision: 2.23 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSissue}
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2007/03/04 14:17:49 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPproject{FST PROJECT}
%% LaTeX2e port: 
%% LaTeX2e port: =IGN
%% LaTeX2e port: 
%% LaTeX2e port: Commands to process this document in various ways.
%% LaTeX2e port: 
%% LaTeX2e port: make -f rel001.mkf imp032.dvi
%% LaTeX2e port: doctex imp032
%% LaTeX2e port: texdvi imp032
%% LaTeX2e port: bibtex imp032
%% LaTeX2e port: doctex imp032 ; texdvi imp032
%% LaTeX2e port: doctex imp032 ; texdvi imp032 ; bibtex imp032
%% LaTeX2e port: dvipage imp032 &
%% LaTeX2e port: 
%% LaTeX2e port: docsml imp032
%% LaTeX2e port: use_file "imp032.sml";
%% LaTeX2e port: 
%% LaTeX2e port: lasp -s imp032.doc > zz1
%% LaTeX2e port: lasp -s -u imp032.OKwords imp032.doc > zz1
%% LaTeX2e port: 
%% LaTeX2e port: =TEX
%% LaTeX2e port: %\TPPstatus{Approved}
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{A.J. Hammon & WIN01}  %% Mandatory field
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document contains the HOL pretty
%% LaTeX2e port: 	printing functions.}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	Library
%% LaTeX2e port: }}
%% LaTeX2e port: 
%% LaTeX2e port: %\ftlinepenalty=9999
%% LaTeX2e port: \makeindex
%% LaTeX2e port: 
%% LaTeX2e port: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LaTeX2e port: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LaTeX2e port: 
\catcode`\_=\active
\def\_{\kern.06em\vbox{\hrule height.1ex width.3em}\hskip0.1em\relax}
%% LaTeX2e port: 
%% LaTeX2e port: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LaTeX2e port: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LaTeX2e port: 
%% LaTeX2e port: \begin{document}
%% LaTeX2e port: \makeTPPfrontpage
%% LaTeX2e port: 
%% LaTeX2e port: \vfill
%% LaTeX2e port: \begin{center}
%% LaTeX2e port: \bf Copyright \copyright\ : Lemma 1 Ltd. \number\year
%% LaTeX2e port: \end{center}

\begin{document}

\headsep=0mm
\FrontPage
\headsep=10mm

\setcounter{section}{-1}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
\section{DOCUMENT CONTROL}

%********************************************************************

\subsection{Contents List}
\tableofcontents
% \listoftables

%********************************************************************

\subsection{Document Cross References}

\bibliographystyle{fmu}
\bibliography{fmu}

%********************************************************************

\subsection{Changes History}

\begin{description}

\item[Issues 1.1 (1991/07/10) to 1.10 (1991/09/11) ] Initial drafts.

\item[\FormatDate{91/09/12}, issue 2.1 ] First approved version.

\item[Issue 2.2 (1992/01/20), \FormatDate{92/01/20} ] Updated to use new fonts.
\item[9 April 1992, issue 2.3, ] Changes required by CR0016.
\item[14 April 1992, issue 2.4 ] Changes due to CR0017.

\item[Issue 2.5]
	Many detailed changes to spacing, line breaking and Oppen
		blocks used in the printing.
	Fix non-terminating loop in printing non-standard let clauses.
	Changes forecast moved into~\cite{DS/FMU/IED/DTD032}.
	Add support for $pe_depth$ field of the $PP_ENV$ type.
	Make $HOL_do_app$ pass the precedance on when there are no arguments.
	Enclose types with a single argument in a block.
	Removed use of $dest\_term$.
	Follow changes to~\cite{DS/FMU/IED/DTD031} with changes to
		some function signatures.
	Improve alias handling.
	Include index characters at top level of terms and types.

\item[Issues 2.12 (1996/03/25), 2.13 (1996/03/26)]
	Fixed a mismatch of beginb/endb in treatment of HOL lets.
%\item[\FormatDate{$Date: 2007/03/04 14:17:49 $%
%}, issue \SCCSissue~]

\item[Issue 2.14 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 2.15 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 2.16 (2004/07/09)] Aliases are now handled here, not in DTD031.
\item[Issue 2.17 (2004/08/24)] Accommodated the new data types for operator precedence that support left-associative operators properly.
\item[Issue 2.18 (2005/05/07)] HOL now supports left-associative operators.
\item[Issue 2.19 (2005/06/22)] It now uses SML escapes where necessary to make strings print properly \ldots
\item[Issue 2.20 (2006/01/23)] \ldots but only optionally for the extended character set.
\item[Issue 2.21 (2006/08/09)] Added support for floating point literals.
\item[Issue 2.22 (2006/12/02)] Floating point literals with no mantisssa or exponent are now supported.
\item[Issue 2.23 (2007/03/04)] Now have option (turned on by default) to use type abbreviations when types are printed.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}

%********************************************************************

\subsection{Changes Forecast} \label{ChangesForecast}

See~\cite{DS/FMU/IED/DTD032}.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
\section{GENERAL}

%********************************************************************

\subsection{Scope}

This document contains the HOL pretty printing routines
for Release~1 of the ICL HOL system.
These routines are specified in the detailed design~\cite{DS/FMU/IED/DTD032}.

%********************************************************************

\subsection{Introduction}

Part of the pretty printer comprises the routines that format terms and
types according to the HOL concrete syntax
of~\cite{DS/FMU/IED/DEF001}.  These routines are registered with the
pretty printing support system of~\cite{DS/FMU/IED/DTD031} and
~\cite{DS/FMU/IED/IMP031}.

%********************************************************************

\subsection{Purpose and Background}

Pretty printing requires understanding uses of HOL constants which
correspond to the various syntactic productions of HOL.  The pretty
printer support~\cite{DS/FMU/IED/DTD031} decodes applications of
constants and variables, it then invokes one of the main
routines (namely $HOL_fun_const$ or $HOL_fun_var$)
in this document.  Other, more primitive, types of HOL term are printed
by other routines in this document.

%********************************************************************

\subsection{Dependencies}

Basic output mechanisms are provided by the Oppen style printing
routines in~\cite{DS/FMU/IED/DTD024} and by the PolyML function
$PolyML.install_pp$, although they are provided via the pretty printer
in~\cite{DS/FMU/IED/DTD025}.

%********************************************************************

\subsection{Interface}

There is only one visible interfaces to this structure, namely that for
formatting HOL types.

Most of this structure is concerned with installing functions into the
pretty printer of~\cite{DS/FMU/IED/DTD031}.  These functions are
thereafter are only called by that pretty printer.

%********************************************************************

%\subsection{Algorithms}
%\subsection{Possible Enhancements}
%\subsection{Deficiencies}
%\subsection{Terminology}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\newpage

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
\section{PRELUDE}

The HOL printing functions are contained in a structure.  All of the
definitions of the main pretty printer are made available.

=SML
structure ⦏HOLPrettyPrinter⦎ (* : HOLPrettyPrinter *) = struct

open PrettyPrinterSupport;
infix gt_prec;
=TEX

%********************************************************************

\subsection{Precedences}

A number of precedence values are defined.  They are used rather than
the numeric values based $PcNormal$ and $PcVeryLow$ to make the
allocation of HOL precedences easier to understand.

=SML
val ⦏pc_h_post_type⦎			: OP_PREC = PcNormal(60, 0, Lex.RightAssoc);
val ⦏pc_h_apply⦎			: OP_PREC = PcNormal(50, 0, Lex.LeftAssoc);
fun ⦏pc_h_oper⦎(op_prec, assoc)	: OP_PREC = PcNormal(40, op_prec, assoc);
val ⦏pc_h_if_let_bind⦎		: OP_PREC = PcNormal(30, 0, Lex.RightAssoc);
val ⦏pc_h_if_let_bind_last⦎		: OP_PREC = PcNormal(20, 0, Lex.RightAssoc);
val ⦏pc_h_typing⦎			: OP_PREC = PcNormal(10, 0, Lex.RightAssoc);
=TEX

=TEX

%********************************************************************

\subsection{Controls}

When printing HOL terms types are selected by the following
control flag.

=SML
val pp_show_HOL_types : bool ref = ref false;
val _ =
new_flag {name = "⦏pp_show_HOL_types⦎",  control=pp_show_HOL_types,
		check=fun_true, default=fun_false};
=TEX

=IGN
set_flag("pp_show_HOL_types", true);
set_flag("pp_show_HOL_types", false);
=TEX
Alias processing is optional:

=SML
val pp_use_alias : bool ref = ref true;
val _ =
new_flag {name = "⦏pp_use_alias⦎",  control=pp_use_alias,
		check=fun_true, default=fun_true};
=TEX

Using type abbreviations is optional:
=SML
val pp_use_type_abbrev : bool ref = ref true;
val _ =
new_flag {name = "⦏pp_use_type_abbrev⦎",  control=pp_use_type_abbrev,
		check=fun_true, default=fun_true};
=TEX

Additional controls are anticipated so that finer control may be placed
upon where types are printed.  Such controls may require additions
to type $PP_ENV$.

\bigskip

Identifiers may need to be enclosed in indexing brackets.

The indexing brackets themselves.

=SML
val (⦏index_start_char⦎, ⦏index_end_char⦎) =
=SMLLITERAL
	("⦏", "⦎");
=TEX

%********************************************************************

\subsection{Printing String and Character Literals}

Strings and character literals may contain a variety of strange
characters.  They may arise from two sources: first from string and
character literals.  Second from the strings used in the primitive HOL
constant and variable constructors.  In each case they must be printed
in a fashion which preserves their meaning.
=TEX
=SML
val ⦏sml_escape_table⦎ : string PPVector.vector = PPVector.vector
	let	fun sml_escape (code : int) : string = (
			case chr code of
				"\a" => "\\a"
			|	"\b" => "\\b"
			|	"\t" => "\\t"
			|	"\n" => "\\n"
			|	"\v" => "\\v"
			|	"\r" => "\\r"
			|	"\\" => "\\\\"
			|	"\"" => "\\\""
			|	"\017" => "\\017"
			|	"\028" => "\\028"
			|	_ =>
				if	code < ord " "
				then	"\\^" ^ chr(code + 64)
				else if	code < 127
				then	chr code
				else	"\\" ^ string_of_int code
		);
	in	map sml_escape (interval 0 255)
	end;
=TEX
=SML
fun ⦏escape_sml_string⦎  (s:string) : string = (
let	val escape =
		if	get_use_extended_chars_flag()
		then	(fn ch =>
			if	ord ch < 128
			then	PPVector.sub(sml_escape_table, ord ch)
			else	ch)
		else	(fn ch =>
			PPVector.sub(sml_escape_table, ord ch));
in	implode (map escape (explode s))
end
);
=TEX
=SML
fun ⦏print_string⦎ (addstring:string -> unit) (s:string) : unit = (
	addstring (escape_sml_string s)
);
=TEX

%********************************************************************

\subsection{Printing Identifiers}
\label{PrintingIdentifiers}

HOL variables and constants may contain arbitrary text as their
identifiers.  Simple identifiers are printed as themselves, more
complex cases are printed with a leading dollar plus string quote and a
trailing string quote.  The symbol table~\cite{DS/FMU/IED/DTD020}
prevents the complex form of identifiers from being used as binder or
operator names.

A name can be printed as itself if it can be lexically analysed
into a single token, namely itself.  To determine this the lexical
analyser~\cite{DS/FMU/IED/DTD015} is used.  Several error conditions
are detected by the lexical analyser, all of these denote that the
identifier is not simple.

=SML
fun ⦏is_simple_name⦎ (identifier:string) : bool = (
let
	val lex_input = [Lex.Text identifier];
	val terminators = SymbolTable.get_current_terminators();
	fun fixity_classifier (_:string) = Lex.Nonfix;

	val lex_ans =	Lex.lex
			terminators
			fixity_classifier
			lex_input;
in
	case lex_ans
	of [Lex.HTName n, Lex.HTEos] => n = identifier
	| _ => false
end
handle Fail _ => false
| Error _ => false
);
=TEX

%********************************************************************

\subsection{Printing Lists of Objects}

We commonly need to print a list of objects but want to truncate
the printing at the print depth.

Function $pr_list_with_env$ does much like a $map$ over the list, but
the $env$ changes as the list is traversed. The second argument
is for when the first argument has a side effect(such as an unbalanced
beginb or endb), but cannot be used because it does printing
(this apparently only happens when handling lets).
Function
$pr_list_revfold_with_env$ is much like a $revfold$ over the list, but
in this case both the $env$ and the supplied value (of type ``~$'b$~'')
change.

=IGN
pr_list_with_env : ('a * PP_ENV -> unit) -> (unit -> unit) -> 'a list -> PP_ENV -> unit
pr_list_revfold_with_env : ('a * 'b * PP_ENV -> 'b) -> 'a list -> 'b -> PP_ENV -> 'b
=TEX

=SML
fun ⦏pr_list_revfold_with_env⦎
			(what:('a * 'b * PP_ENV) -> 'b)
			(nil:'a list)
			(b : 'b)
			(env:PP_ENV)
		:	'b =
	b
| pr_list_revfold_with_env what (h::t) (b : 'b) env = (
let
	val PpEnv{pe_depth = depth, pe_addstring = addstring, pe_space = space, ...} = env;
in
	if case depth of Nil => true | Value d => d >= 0
	then
		pr_list_revfold_with_env what t (what(h, b, env)) (decrement_depth env)
	else(
		addstring "...";
		space(1,0);
		b
	)
end
);
=TEX

=SML
fun ⦏pr_list_with_env⦎
			(what:('a * PP_ENV) -> unit)
			(do_side_effect :unit -> unit)
			(nil:'a list)
			(env:PP_ENV)
		:	unit = ()
| pr_list_with_env what do_side_effect (h::t) env = (
let
	val PpEnv{pe_depth = depth, pe_addstring = addstring, pe_space = space, ...} = env;
in
	if case depth of Nil => true | Value d => d >= 0
	then(
		what(h, env);
		pr_list_with_env what do_side_effect t (decrement_depth env)
	) else(
		map (fn _ => do_side_effect()) (h :: t);
			(* do map as no point to recursive call *)
		addstring "...";
		space(1,0)
	)
end
);
=TEX
As a generic ``no effect'' for the above:
=SML
fun ⦏no_side_effect⦎ () : unit = ();
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
\section{PRINTING TYPES}

{\ftlinepenalty=9999
=SML
fun ⦏main_type_pp⦎ (cur_env:PP_ENV) (ty:TYPE) : unit = (
let
	val PpEnv{pe_prec = prec, pe_addstring = addstring, pe_beginb = beginb,
		pe_depth = cur_depth,
		pe_show_index = show_index,
		pe_endb = endb, pe_space = space, ...} = cur_env;

	val new_env = decrement_depth cur_env;

	fun ty_p prec t = main_type_pp (set_show_index false(set_prec prec new_env)) t;

	fun name_p n = (
		if is_simple_name n
		then(
			if show_index then addstring index_start_char else ();
			addstring n;
			if show_index then addstring index_end_char else ()
		)else(
			addstring "$\"";
			if show_index then addstring index_start_char else ();
			print_string addstring n;
			if show_index then addstring index_end_char else ();
			addstring "\""
		)
	);

	fun print_list_aux(ty, env) = (
		addstring ",";
		space(1,0);
		main_type_pp env ty
	);

	fun print_list name t rest = (
		beginb(0, false);
		case rest
		of nil => (
			beginb(2, true);
			ty_p (pc_h_post_type, Lex.LeftAssoc) t;
			endb()
		) | _ => (
			addstring "("; (*=)=*)
			beginb(2, true);
			ty_p (PcLowest, Lex.LeftAssoc) t;
			pr_list_with_env print_list_aux no_side_effect rest
				(set_show_index false(set_prec (PcLowest, Lex.LeftAssoc)
				(decrement_depth new_env)));
			endb();
			(*=(=*) addstring ")"
		);

		space(1,0);
		name_p name;
		endb()
	);
in
	if case cur_depth of Nil => true | Value d => d >= 0
	then
	let	val (name, args) =
			case get_type_abbrev ty of
				Value n_as => n_as
			|	Nil => dest_ctype ty handle Fail _ => (dest_vartype ty, []);
	in	case args of
			[] => 		name_p name
		| 	[t1] =>		print_list name t1 nil
		| 	[t1, t2] => (
			if is_simple_name name
			then
			case get_fixity name
			of Lex.Infix (assoc, n) =>
				let
					val pc_op_prec = pc_h_oper(n, assoc);
					val br = prec gt_prec pc_op_prec;
					val blk = fst prec = pc_op_prec;
				in(
					if br
					then	(addstring "(" (*=)=*); beginb(2, true))
					else	if blk
						then ()
						else beginb(2, true);

					ty_p (pc_op_prec, Lex.LeftAssoc) t1;
					space(1,0);
					if show_index then addstring index_start_char else ();
					addstring name;
					if show_index then addstring index_end_char else ();
					addstring " ";
					ty_p (pc_op_prec, Lex.RightAssoc) t2;

					if br
					then	(endb(); (*=(=*) addstring ")")
					else	if blk
						then ()
						else endb()
				)end
			| _ => print_list name t1 [t2]
			else print_list name t1 [t2]
		) |	(t1 :: rest) => print_list name t1 rest
	end
	else (addstring "..."; space(1, 0))
end
);
=TEX
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
\section{SIMPLE HOL CONSTRUCTORS}

%********************************************************************

\subsection{Variables and Constants}

=SML
fun ⦏pr_mk_var_or_const⦎ (cur_env:PP_ENV) (constr:string)
			(name:string) (ty:TYPE) : unit = (
let
	val PpEnv{pe_addstring=addstring,
		pe_show_index = show_index,
		...} = cur_env;
in
	addstring("ⓜ" ^ constr ^ "(\"" (*=")=*));
	if show_index then addstring index_start_char else ();
	print_string addstring name;
	if show_index then addstring index_end_char else ();
	addstring "\", ⓣ" (*="=*);
	main_type_pp (set_show_index false cur_env) ty;
	addstring (*=(=*)"⌝)⌝"
end
);
=TEX

=SML
fun ⦏do_var_const⦎ (cur_env:PP_ENV) (name:string) (ty:TYPE) : unit = (
let
	val PpEnv{pe_prec=prec, pe_addstring=addstring, pe_beginb=beginb,
		pe_show_index = show_index,
		pe_space=space, pe_endb=endb, ...} = cur_env;

	val br = !pp_show_HOL_types andalso prec gt_prec pc_h_typing;
in
	if br then (addstring "(" (*=)=*); beginb(2, true)) else ();
	if is_simple_name name
	then(
		if get_fixity name <> Lex.Nonfix
		then addstring "$"
		else ();
		if show_index then addstring index_start_char else ();
		addstring name;
		if show_index then addstring index_end_char else ()
	)else(
		addstring "$\"";
		if show_index then addstring index_start_char else ();
		print_string addstring name;
		if show_index then addstring index_end_char else ();
		addstring "\""
	);
	if !pp_show_HOL_types
	then (
		space(1, 2);
		addstring ": ";
		main_type_pp (set_show_index false(set_prec (PcLowest, Lex.LeftAssoc) cur_env)) ty;
		if br then (endb(); (*=(=*) addstring ")") else ()
	) else () (* br = !pp_show_HOL_types and ... so beginb always matched *)
end
);
=TEX

Variables may have the same name as declared or aliased constants, they
must be printed in a manner that allows them to be recognised as a
$mk_var$ term.

=SML
fun ⦏HOL_do_var⦎ (cur_env:PP_ENV) (orig:TERM) (name:string)
		(ty:TYPE) : PFUN_ANS = (
let
	val PpEnv{pe_addstring=addstring, ...} = cur_env;
in
	case(get_const_info name, get_const_type name)
	of (Nil, Nil) =>
			do_var_const cur_env name ty
	| (_, _) =>
			pr_mk_var_or_const cur_env "mk_var" name ty
	;
	PfOk
end
);
=TEX

HOL constants representing strings and character literals include
the leading quote character.
The arguments are such that ``$orig = mk_const(n, ty)$'' where $n$
is the constant derived from the alias name $name$, thus we might
have ``$n="="$'' and ``$name="⇔"$''. {}  We must be careful to
print out $mk_const$ terms where the constant is not declared, or
is an alias for a not declared constant, in a manner that allows
it to be recognised as a $mk_const$ term.

{\ftlinepenalty=9999
=SML
fun ⦏HOL_do_const⦎ (cur_env:PP_ENV) (orig:TERM) (const_name:string)
		(ty:TYPE) : PFUN_ANS = (
let
	val PpEnv{pe_addstring=addstring, ...} = cur_env;

	fun check_type tyx : bool = (
		case explode const_name
		of "\"" :: _ => STRING =: tyx
		| "`" :: _ => CHAR =: tyx
		| _ => is_all_decimal const_name andalso (ℕ =: tyx)
	);

	val name = 	if !pp_use_alias
			then	SymbolTable.get_alias(const_name, ty)
			else	const_name;

in
	if is_char orig
	then
		let
			val ch = dest_char orig;
		in
			if name = "`" ^ ch
			then	(addstring "`"; print_string addstring ch; addstring "`")
			else	do_var_const cur_env name ty
		end
	else if is_string orig
	then
		let
			val ch = dest_string orig;
		in
			if name = "\"" ^ ch
			then	(addstring "\""; print_string addstring ch; addstring "\"")
			else	do_var_const cur_env name ty
		end
	else if is_ℕ orig
	then
		(let val str = fst(dest_const orig)
		in
			if name = str
			then	addstring str
			else	do_var_const cur_env name ty
		end)
	else
		if	case (get_const_info name, get_const_type name)
			of (Nil, Nil) => true
			| (Value(ty1, _), _) => check_type ty1
			| (_, Value ty2) => check_type ty2
		then
			pr_mk_var_or_const cur_env "mk_const" name ty
		else
			do_var_const cur_env name ty
	;
	PfOk
end
);
=TEX
}

%********************************************************************
\newpage
\subsection{Applications}

These are applications of the function $head_fn$ to a list
of arguments in $args$ which may be empty.  Function application is
left associative, thus the brackets may be omitted in the HOL fragment
``$((f\;\;a)\;\;b)\;\;c$''.  {} Value $pc_h_apply$ is set
with this associativity,

Bracket elimination works as follows.  On entry to this routine we have
the function and each of its arguments, we know that function
application is left associative and therefore we know we do not need
any brackets with the whole application.  Brackets may be required
around the whole application:  when it is used as the argument of
another application the associativity rule indicates that brackets are
wanted.

If this application were required to be produced with all the brackets
added (i.e., perhaps when flag $pp_add_brackets$
of~\cite{DS/FMU/IED/DTD031} is set) then one opening bracket would need
to be output for each argument before outputting any of the arguments
and one closing bracket after each argument.

=SML
fun ⦏HOL_do_app⦎ (cur_env:PP_ENV) (head_fn:TERM) (args:TERM list) : PFUN_ANS = (
let
	val PpEnv{pe_prec=prec, pe_addstring=addstring,
		pe_space=space, pe_beginb=beginb, pe_endb=endb, pe_const=do_const,
		pe_var=do_var, ...} = cur_env;

	val br = prec gt_prec pc_h_apply;

	val arg_env = set_prec (pc_h_apply, Lex.RightAssoc) cur_env;

	fun print_head p tm = (
		case  dest_simple_term tm
		of	Var(str, ty) =>	(do_var (set_prec p cur_env) tm str ty; ())
		|	Const(str, ty) =>	(do_const (set_prec p cur_env) tm str ty; ())
		|	_  =>			main_term_pp (set_prec p cur_env) tm
	);

	fun print_args(tm, env) = (
		endb();
		space(1, 0);
		beginb(2, true);
		main_term_pp env tm
	);

in
	case args
	of nil =>	print_head prec head_fn
	| _ => 		(	if br then addstring "(" (*=)=*) else ();
				beginb(2, true);
				beginb(0, true);
				print_head (pc_h_apply, Lex.LeftAssoc) head_fn;
				pr_list_with_env print_args no_side_effect
					args arg_env;
				endb();
				endb();
				if br then (*=(=*) addstring ")" else ()
			)
	;
	PfOk
end
);
=TEX

%********************************************************************
\newpage
\subsection{Abstractions and Binders}

Abstractions or lambda terms have the same syntax as binders.  They
have different term structures and thus need different decoding
routines.  Abstractions are decoded by function $HOL_do_λ$, whereas
function $do_binder$ decodes binders.  Both function produce three
components: the abstraction or binder name; the list of declared items,
these may be complex paired items; and, the term that is the scope of
the item.  In the following discussion we consider abstractions to be a
form of binder term.

When these terms do not require types to be shown, the syntax allows a
simple space separated list of declarations, prefixed with the binder
name and followed by a `fat dot'.  When types are required the number
shown should be minimised by use of production $Block$
in~\cite{DS/FMU/IED/DEF001}.  To do this the declarations are grouped
into sets having the same type.

Control flag $pp_types_on_binders$ is provided to request that
types be shown on binder terms.

=SML
val pp_types_on_binders : bool ref = ref false;
val _ =
new_flag {name = "⦏pp_types_on_binders⦎",  control=pp_types_on_binders,
		check=fun_true, default=fun_false};
=TEX

=IGN
set_flag("pp_types_on_binders", true);
set_flag("pp_types_on_binders", false);
=TEX

Function $group_declarations$ takes a list of declarations and finds
the groups of declarations that have the same type.

=SML
fun ⦏group_declarations⦎ (nil:TERM list) : (TERM list * TYPE) list = nil
| group_declarations (head::rest) = (
let
	val head_ty = type_of head;

	fun split (prev, nil) = (prev, nil)
	| split (prev, h::t) =	if head_ty =: type_of h
				then	split(h::prev, t)
				else	(prev, h::t);

	val (decs, to_do) = split([head], rest);

	val gp = (rev decs, head_ty);
in
	gp :: (group_declarations to_do)
end
);
=TEX

The caller of $display_binder$ is responsible for ensuring that the
name may be printed as a binder.

{\ftlinepenalty=9999
=SML
fun ⦏display_binder⦎ (cur_env:PP_ENV) (name:string) (decls:TERM list)
			(body:TERM) : unit = (
let
	val PpEnv{pe_prec=prec, pe_addstring=addstring, pe_beginb=beginb,
		pe_show_index = show_index,
		pe_space=space, pe_endb=endb, ...} = cur_env;

	val new_env = set_show_index false cur_env;

	fun vs_printer(vs:TERM, env:PP_ENV) : unit = (
		space(1, 0);
		beginb(2, true);
		main_term_pp (set_prec (pc_h_post_type, Lex.RightAssoc) env) vs;
		endb()
	);

	fun pr_decls (decs:TERM list, ty:TYPE) (env:PP_ENV) : unit = (
		beginb(0, false);
		pr_list_with_env vs_printer no_side_effect decs env;
		space(1, 0);
		addstring ": ";
		main_type_pp env ty;
		endb()
	);

	fun pr_semi_decls (decs_ty:TERM list * TYPE, env:PP_ENV) : unit = (
		addstring ";";
		space(0, 0);
		endb();
		beginb(2, true);
		pr_decls decs_ty env
	);

	val br = prec gt_prec pc_h_if_let_bind;
in
	beginb(0, true);
	if br then addstring "(" (*=)=*) else ();
	if show_index then addstring index_start_char else ();
	addstring name;
	if show_index then addstring index_end_char else ();

	if !pp_types_on_binders
	then	(	beginb(2, true);
			case group_declarations decls
			of nil => ()
			| h::nil => pr_decls h new_env
			| h::t => (
				pr_decls h new_env;
				pr_list_with_env pr_semi_decls no_side_effect t
					(decrement_depth new_env);
				())
			;
			()
		)
	else	(
		beginb(2, false);
		pr_list_with_env vs_printer no_side_effect decls new_env;
		())
	;
	endb();
	space(0, 0);
	addstring "⦁ ";
	beginb(2, true);
	main_term_pp (set_prec (pc_h_if_let_bind_last, Lex.RightAssoc) new_env) body;
	endb();
	if br then (*=(=*) addstring ")" else ();
	endb()
end
);
=TEX
}

=SML
fun ⦏HOL_do_λ⦎ (cur_env:PP_ENV) (tm1:TERM) (tm2:TERM) : PFUN_ANS = (
let
	val (l_decls, l_body) = strip_λ(mk_λ(tm1, tm2));
in
	display_binder cur_env "λ" l_decls l_body;
	PfOk
end
);
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
\section{PRINTERS FOR HOL CONSTANTS}

%********************************************************************

\subsection{Conditionals}

Treat a cascaded set of if clauses as a unit, this involves recursively
breaking open the else clause until finding something that is not an
if expression.  The result is a list of tuples.  The first element
if the label (i.e., the part of the if clause), the second is the
condition which is absent for the final else clause and the third
is the consequence.

=SML
fun ⦏open_up_if⦎ (prev:(string * TERM OPT * TERM) list) (tm:TERM)
		: (string * TERM OPT * TERM) list = (
	if is_if tm
	then
		let
			val (cond, conseq, alt) = dest_if tm;
		in
			open_up_if (("else if", Value cond, conseq) :: prev) alt
		end
	else
		("else", Nil, tm) :: prev
);
=TEX

=SML
fun ⦏HOL_conditional⦎ (cur_env:PP_ENV) (orig:TERM) (name:string) (ty:TYPE)
		(args:TERM list) : PFUN_ANS = (
	case args
	of cond :: then_part :: else_part :: nil =>
		let
			val PpEnv{pe_prec = prec, pe_addstring = addstring, pe_beginb = beginb,
				pe_endb = endb, pe_space = space, ...} = cur_env;

			val br = prec gt_prec pc_h_if_let_bind;

			fun aux str env tm = (
				beginb(2, false);
				addstring str;
				space(1, 0);
				beginb(0, true);
				main_term_pp env tm;
				endb();
				endb()
			);

			fun aux2 ((label, Value if_bit, then_bit), env) = (
				aux label	(set_prec (PcLowest, Lex.RightAssoc) env) if_bit;	space(1, 0);
				aux "then"	(set_prec (PcLowest, Lex.RightAssoc) env) then_bit;	space(1, 0)
			)
			| aux2 ((label, Nil, else_bit), env) = (
				aux "else"	(set_prec (pc_h_if_let_bind_last, Lex.RightAssoc) env) else_bit
			);

			val if_clause =
				open_up_if
					[("if", Value cond, then_part)]
					else_part;
		in
			if br then (addstring "(" (*=)=*); beginb(2, true)) else beginb(0, true);
			pr_list_with_env aux2 no_side_effect (rev if_clause)
				cur_env;
			endb();
			if br then (*=(=*) addstring ")" else ();
			PfOk
		end
	| _ => (	if length args < 3
		then	PfNotPossible
		else	PfFewer 3
	)
);
=TEX
\newpage
\subsection{Floating Point Literals}

=SML
fun ⦏HOL_float⦎ (cur_env:PP_ENV) (orig:TERM)
		(name:string) (ty:TYPE) (args:TERM list) : PFUN_ANS = (
	let	val PpEnv{pe_addstring = addstring, ...} = cur_env;
		val token= string_of_float (dest_float (list_mk_app(orig, args)));
	in	addstring token;
		PfOk
	end	handle Fail _ => PfNotPossible
);
=TEX

%********************************************************************
\newpage
\subsection{Lists and Sets}

Enumerated sets have the same syntax as lists, apart from the shape of
their brackets.

Empty lists and sets are achieved by outputting a fixed string.

=SML
fun ⦏HOL_empty_list_set⦎ (token:string) (cur_env:PP_ENV) (orig:TERM)
		(name:string) (ty:TYPE) (args:TERM list) : PFUN_ANS = (
	case args
	of nil =>	let
				val PpEnv{pe_addstring = addstring, ...} = cur_env;
			in
				addstring token;
				PfOk
			end
	| _ => PfNotPossible
);
=TEX

Non-empty lists (respectively sets) are formed by the repeated
application of $Cons$ (respectively $Insert$) to a head value and the
tail of the list.  The last application is of the final element and the
constant $Nil$ (respectively $Empty$).

Lists are self bracketing, they never need enclosing in round brackets,
so there is no test of precedences.

=SML
fun ⦏print_list_or_set⦎ (cur_env:PP_ENV) (opener:string) (body:TERM list)
			(closer:string) : PFUN_ANS = (
let
	val PpEnv{pe_prec=prec, pe_addstring=addstring, pe_beginb=beginb,
		pe_space=space, pe_endb=endb, ...} = cur_env;

	val new_env = set_prec (PcLowest, Lex.RightAssoc)  cur_env;

	fun later_elem(t, env) = (
		addstring ";";
		endb();
		space(1, 2);
		beginb(2, true);
		main_term_pp env t
	);
in(
	beginb(0, false);
	addstring opener;
	beginb(2, true);
	case body
	of one_tm::nil =>	main_term_pp new_env one_tm
	| hd_tm::rest => (	main_term_pp new_env hd_tm;
				pr_list_with_env later_elem no_side_effect
					rest
					(decrement_depth new_env);
				())
	| nil => ();
	endb();
	addstring closer;
	endb();
	PfOk
)end
);
=TEX

{\hfuzz 3pt
=SML
fun ⦏HOL_list⦎ (cur_env:PP_ENV) (orig:TERM) (name:string) (ty:TYPE)
		([a1, a2]:TERM list) : PFUN_ANS = (
let
	val tail = dest_list a2;
	val body = a1::tail;
in
	print_list_or_set cur_env "[" body "]"
end
handle Fail _ => PfNotPossible
)
| HOL_list _ _ _ _ args = if length args > 2 then PfFewer 2 else PfNotPossible;
=TEX
}

{\hfuzz 3pt
=SML
fun ⦏HOL_set⦎ (cur_env:PP_ENV) (orig:TERM) (name:string) (ty:TYPE)
		([a1, a2]:TERM list) : PFUN_ANS = (
let
	val tail = dest_enum_set a2;
	val body = a1::tail;
in
	print_list_or_set cur_env "{" body "}"
end
handle Fail _ => PfNotPossible
)
| HOL_set _ _ _ _ args = if length args > 2 then PfFewer 2 else PfNotPossible;
=TEX
}

Set comprehensions are formed by the application of a constant to an
abstraction.

=SML
fun ⦏HOL_set_comp⦎ (cur_env:PP_ENV) (orig:TERM) (name:string) (ty:TYPE)
		([a1]:TERM list) : PFUN_ANS = (
let
	val PpEnv{pe_prec=prec, pe_addstring=addstring, pe_beginb=beginb,
		pe_space=space, pe_endb=endb, ...} = cur_env;

	val new_env = set_prec (PcLowest, Lex.RightAssoc)  cur_env;

	val (decs, pred) = dest_set_comp(mk_app(orig, a1));
in(
	beginb(0, false);
	addstring "{";
	beginb(2, true);
	main_term_pp new_env decs;
	endb();
	space(0, 0);
	addstring"|";
	beginb(2, true);
	main_term_pp new_env pred;
	endb();
	addstring "}";
	endb();
	PfOk
)end
handle Fail _ => PfNotPossible
)
| HOL_set_comp _ _ _ _ args = if length args > 1 then PfFewer 1 else PfNotPossible;
=TEX

%********************************************************************
\newpage
\subsection{Local Definitions}

HOL `let' terms are printed as if their syntax is of the form ``{\tt
let $term$ in $term$}'' or ``{\tt let $term$ and $term$ in $term$}'',
which is almost what the concrete syntax allows.  This general form
allows easy handling of the fixity of the locally declared items.

Printing out a HOL let term is done in several stages, function
$HOL_let$ conducts the process.  First (in function $get_let_pieces$)
the let term is broken open into the component pieces for printing.
This includes rebuilding the components into a form
compatible with the syntax shown above.
Function $print_list_of_lets$ prints the individual let terms.

Breaking open local definitions to get their constituents works as
follows.

Function $strip_let$ yields a pair: the ``let'' declarations and a
term.  The declarations comprise a list with one entry per ``let''
term.  Each ``let'' term entry is a list with one entry per definition
within the ``let'' term.  Each definition is a pair with the variable
and its defining term.

=GFT SML Examples
strip_let ⌜let a = b in c⌝
		= ([[(⌜a⌝, ⌜b⌝)]], ⌜c⌝)
strip_let ⌜let a = b in let c = d in let e = f in g⌝
		= ([[(⌜a⌝, ⌜b⌝)], [(⌜c⌝, ⌜d⌝)], [(⌜e⌝, ⌜f⌝)]], ⌜g⌝)
strip_let ⌜let (a1,a2) = b in let (c1,c2) = d in e⌝
		= ([[(⌜(a1, a2)⌝, ⌜b⌝)], [(⌜(c1, c2)⌝, ⌜d⌝)]], ⌜e⌝)
strip_let ⌜let af (a1,a2) = b in let cf (c1,c2) = d in e⌝
		= ([[(⌜af⌝, ⌜λ (a1, a2)⦁ b⌝)], [(⌜cf⌝, ⌜λ (c1, c2)⦁ d⌝)]], ⌜e⌝)
strip_let ⌜let af (a1,(a2,a3)) ((b1,b2),b3) (c1,c2,c3) = d in e⌝
		= ([[(⌜af⌝, ⌜λ (a1, a2, a3) ((b1, b2), b3) (c1, c2, c3)⦁ d⌝)]], ⌜e⌝)
strip_let ⌜let ff a b c d = e in f⌝
		= ([[(⌜ff⌝, ⌜λ a b c d⦁ e⌝)]], ⌜f⌝)
strip_let ⌜let a = b and c = d and e = f in g⌝
		= ([[(⌜a⌝, ⌜b⌝), (⌜c⌝, ⌜d⌝), (⌜e⌝, ⌜f⌝)]], ⌜g⌝)
=TEX

The last three examples above show local function definitions.  They
are represented as defining a single variable as a lambda term.  To
show these functions in their original form we do a $strip_λ$ on the
defining term which yields the original arguments.

=GFT SML Examples
strip_λ ⌜λ (a1, a2)⦁ b⌝
		= ([⌜(a1, a2)⌝], ⌜b⌝)
strip_λ ⌜λ (a1, a2, a3) ((b1, b2), b3) (c1, c2, c3)⦁ d⌝
		= ([⌜(a1, a2, a3)⌝, ⌜((b1, b2), b3)⌝, ⌜(c1, c2, c3)⌝], ⌜d⌝)
strip_λ ⌜λ a b c d⦁ e⌝
		= ([⌜a⌝, ⌜b⌝, ⌜c⌝, ⌜d⌝], ⌜e⌝)
=TEX

During input of a HOL term some information is lost, e.g., the terms
`$let\;f\;a=b\;in\;c$' and `$let\;f=\lambda\;a\bullet
b\;in\;c$' are indistinguishable.  A control flag is provided to
allow users a choice over which style is used for output.

=SML
val pp_let_as_lambda : bool ref = ref false;
val _ =
new_flag {name = "⦏pp_let_as_lambda⦎",  control=pp_let_as_lambda,
		check=fun_true, default=fun_false};
=TEX

=IGN
set_flag("pp_let_as_lambda", true);
set_flag("pp_let_as_lambda", false);
=TEX

In $get_let_pieces$ a complex value is returned, as follows.  The value
is a pair comprising (in $fst$ element) a list of the declarative parts
of the nested let terms and (in $snd$ element) the innermost term over
which the ``lets'' are defined.  Each declarative part is itself a
list, with one element per definition, i.e., one element per `$=$'
symbol, which is one more than the number of {\tt and} symbols.  Each
definition is a term formed as an equality between the left and right
sides of the `$=$' symbol.

=SML
fun ⦏get_let_pieces⦎ (orig_tm:TERM) : TERM list list * TERM = (
let
	fun aux_as_fn(t1:TERM, t2:TERM) =
		let
			val (decs, value) = strip_λ t2
		in
			mk_eq(list_mk_app(t1, decs), value)
		end;

	fun aux_as_lambda(t1:TERM, t2:TERM) = mk_eq(t1, t2);

	val aux =	if ! pp_let_as_lambda
			then	aux_as_lambda
			else	aux_as_fn;

	val (decls, tm) = strip_let orig_tm;

	val fulldecls = map (map aux) decls;
in
	(fulldecls, tm)
end
);
=TEX

=SML
fun ⦏print_list_of_lets⦎ (cur_env:PP_ENV)
			(let_clauses : TERM list list, tm : TERM)
			: unit = (
let
	val PpEnv{pe_prec=prec, pe_addstring=addstring, pe_beginb=beginb,
		pe_space=space, pe_endb=endb, ...} = cur_env;

	val br = prec gt_prec PcLowest;

	fun aux(definer, (add_space, prefix), env) = (
		if add_space then space(1,0) else ();
		beginb(2, true);
		addstring prefix;
		main_term_pp env definer;
		endb();
		(true, "and ")
	);

	fun print_definer (let_clause : TERM list, env) : unit = (
		beginb(2, false); (* matched in main body of fn *)
		beginb(0, true);
		pr_list_revfold_with_env aux let_clause (false, "let ") env;
		endb();
		space(1, ~2);
		addstring "in "
	);

	fun no_print_definer  () : unit = (
		beginb(0, false) (* matched in main body of fn *)
	);

in(
	beginb(0, true);
	if br then addstring "(" (*=)=*) else ();

	pr_list_with_env print_definer no_print_definer let_clauses
		(set_prec (PcLowest, Lex.RightAssoc) cur_env);

	beginb(0, true);
	main_term_pp (set_prec (pc_h_if_let_bind_last, Lex.RightAssoc) cur_env) tm;
	endb();

	map (fn _ => endb()) let_clauses; (* matching from (no_)print_definer *)

	if br then (*=(=*) addstring ")" else ();
	endb()
)end
);
=TEX

To process the let term first the whole let term is rebuilt.  It is too
complex a task to partially expand the calls of $dest_let$ or
$strip_let$ to accommodate the four components passed that comprise the
whole term.  The components of the term are found.

=SML
fun ⦏HOL_let⦎ (cur_env:PP_ENV) (orig:TERM) (name:string) (ty:TYPE)
		([a1, a2]:TERM list) : PFUN_ANS = (
let
	val orig_tm = mk_app(mk_app(orig, a1), a2);
in
	case get_let_pieces orig_tm
	of (nil, _) => PfNotPossible
	| let_term => (
		print_list_of_lets cur_env let_term;
		PfOk
	)
end
)
| HOL_let _ _ _ _ args = if length args > 2 then PfFewer 2 else PfNotPossible;
=TEX

%********************************************************************
\newpage
\subsection{Pairs}

This routine should be provided by dtd004.

=SML
fun ⦏strip_pair⦎ (tm : TERM) : (TERM list * TERM) = (
	let
		val (t1, rhs) = dest_pair tm;
		val (t2l, t3) = strip_pair rhs;
	in
		(t1 :: t2l, t3)
	end
	handle (Fail _) => (nil, tm)
);
=TEX

=SML
fun ⦏HOL_comma⦎ (cur_env:PP_ENV) (orig:TERM) (_ : string) (ty:TYPE)
		([a1, a2]:TERM list) : PFUN_ANS = (
case get_fixity ","
of Lex.Infix (assoc, n) =>
let
	val PpEnv{pe_prec=prec, pe_addstring=addstring, pe_beginb=beginb,
		pe_space=space, pe_endb=endb, ...} = cur_env;

	fun tm_p env b t = (
		beginb(2, true);
		main_term_pp (set_prec(pc_h_oper(n, assoc), b) env) t;
		endb()
	);

	fun pr_comma_el ((b, t), env) = (
		addstring ",";
		space(1,0);
		tm_p env b t
	);

	val br = true;

	val (head_val, last) = strip_pair a2;

	val tail_tms = map (fn x => (Lex.LeftAssoc, x)) head_val @ [(Lex.RightAssoc, last)];
in(
	beginb(2, false);
	if br then addstring "(" (*=)=*) else ();

	tm_p cur_env Lex.RightAssoc a1;
	pr_list_with_env pr_comma_el no_side_effect
		tail_tms (decrement_depth cur_env);

	if br then (*=(=*) addstring ")" else ();
	endb();
	PfOk
)end
| _ => PfNotPossible
)
| HOL_comma _ _ _ _ args = if length args > 2 then PfFewer 2 else PfNotPossible;
=TEX

=SML
fun ⦏HOL_uncurry⦎ (cur_env:PP_ENV) (orig:TERM) (name:string) (ty:TYPE)
		([arg]:TERM list) : PFUN_ANS = (
	case strip_λ (mk_app(orig, arg))
	of (nil, _) => PfNotPossible
	| (u_decls, u_body) => (	display_binder cur_env "λ" u_decls u_body;
					PfOk
				)
)
| HOL_uncurry _ _ _ _ nil = PfNotPossible
| HOL_uncurry _ _ _ _ _ = PfFewer 1;
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
\section{OPERATORS: PREFIX, INFIX AND POSTFIX}
=TEX

All infix, prefix and postfix operators are very similar, the
distinction being the presence or absence of the arguments.  In each
case the operator has the given $name$ and $op_prec$ gives its
precedence.

The caller of each of these routines is responsible for
ensuring that the name may be printed as an operator.

=SML
fun ⦏do_prefix⦎ (cur_env:PP_ENV) (name:string) (op_prec:int)
		((a1::nil):TERM list) : PFUN_ANS = (
let
	val PpEnv{pe_prec=prec, pe_addstring=addstring, pe_beginb=beginb,
		pe_show_index = show_index,
		pe_space=space, pe_endb=endb, ...} = cur_env;

	val pc_op_prec = pc_h_oper(op_prec, Lex.RightAssoc);
	val br = prec gt_prec pc_op_prec;
	val blk = fst prec = pc_op_prec;
in(
	if blk then () else beginb(2, true);
	if br then addstring "(" (*=)=*) else ();

	if show_index then addstring index_start_char else ();
	addstring name;
	if show_index then addstring index_end_char else ();
	if blk then space(1, 0) else addstring " ";

	main_term_pp (set_show_index false(set_prec (pc_op_prec, Lex.RightAssoc) cur_env)) a1;

	if br then (*=(=*) addstring ")" else ();
	if blk then () else endb();
	PfOk
)end
)
| do_prefix _ _ _ nil = PfNotPossible
| do_prefix _ _ _ _ = PfFewer 1
;
=TEX

=SML
fun ⦏do_postfix⦎ (cur_env:PP_ENV) (name:string) (op_prec:int)
		((a1::nil):TERM list) : PFUN_ANS = (
let
	val PpEnv{pe_prec=prec, pe_addstring=addstring, pe_beginb=beginb,
		pe_show_index = show_index,
		pe_space=space, pe_endb=endb, ...} = cur_env;

	val pc_op_prec = pc_h_oper(op_prec, Lex.LeftAssoc);
	val br = prec gt_prec pc_op_prec;
	val blk = fst prec = pc_op_prec;
in(
	if blk then () else beginb(2, true);
	if br then addstring "(" (*=)=*) else ();

	main_term_pp (set_show_index false(set_prec (pc_op_prec, Lex.LeftAssoc) cur_env)) a1;

	if blk then space(1, 0) else addstring " ";
	if show_index then addstring index_start_char else ();
	addstring name;
	if show_index then addstring index_end_char else ();

	if br then (*=(=*) addstring ")" else ();
	if blk then () else endb();
	PfOk
)end
)
| do_postfix _ _ _ nil = PfNotPossible
| do_postfix _ _ _ _ = PfFewer 1
;
=TEX

HOL infix operators are right associative thus the following
terms are equivalent.

=GFT
⌜(a ∧ b) ∧ (c ∧ d)⌝
⌜(a ∧ b) ∧ c ∧ d⌝
=TEX

=SML
fun ⦏do_infix⦎ (cur_env:PP_ENV) (name:string)
		((assoc, n):Lex.ASSOC * int)
		((a1::a2::nil):TERM list) : PFUN_ANS = (
let
	val PpEnv{pe_prec=prec, pe_addstring=addstring, pe_beginb=beginb,
		pe_show_index = show_index,
		pe_space=space, pe_endb=endb, ...} = cur_env;

	fun tm_p p t = main_term_pp (set_show_index false(set_prec p cur_env)) t;

	val pc_op_prec = pc_h_oper(n, assoc);
	val br = prec gt_prec pc_op_prec;
	val blk = fst prec = pc_op_prec;
in(
	if br
	then	(addstring "(" (*=)=*); beginb(2, true))
	else	if blk
		then ()
		else beginb(2, true);

	tm_p (pc_op_prec, Lex.LeftAssoc) a1;
	space(1,0);
	if show_index then addstring index_start_char else ();
	addstring name;
	if show_index then addstring index_end_char else ();
	addstring " ";
	tm_p (pc_op_prec, Lex.RightAssoc) a2;

	if br
	then	(endb(); (*=(=*) addstring ")")
	else	if blk
		then ()
		else endb();
	PfOk
)end
)
| do_infix _ _ _ args =
	if length args < 2 then PfNotPossible else PfFewer 2
;
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
\subsection{Binders}

The caller of $do_binder$ is responsible for ensuring that the
name may be printed as a binder.

=SML
fun ⦏do_binder⦎ (cur_env:PP_ENV) (name:string) (ty:TYPE)
		((arg::nil):TERM list) : PFUN_ANS = (
 let
	fun dest_my_name (btm:TERM) : (TERM * TERM) OPT = (
		let
			val (binder, abs) = dest_app btm;		(* might fail *)
			val (var, body) = dest_λ abs;			(* might fail *)
			val (const_name, _) = dest_const binder;	(* might fail *)
		in
			if const_name = name
			then	Value(var, body)
			else	Nil
		end
		handle (Fail _) => Nil
	);

	fun strip_binder(tm : TERM) : TERM list * TERM = (
	let
		fun aux prev_decls tm1 = (
			case dest_my_name tm1
			of Value(decl, tm2) => aux (decl::prev_decls) tm2
			| _ => (rev prev_decls, tm1)
		);
	in
		aux nil tm
	end
	);

	val outermost = ((Value(dest_λ arg)) handle (Fail _) => Nil);
in
	case outermost
	of Nil => PfNotPossible
	| Value(first_decl, first_body) =>
		let
			val (more_decls, body) = strip_binder first_body;
		in
			display_binder cur_env name (first_decl :: more_decls) body;
			PfOk
		end
end
)
| do_binder _ _ _ _ = PfFewer 1
;
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
\section{FUNCTION APPLICATION OF CONSTANTS AND VARIABLES}

=SML
local
open Lex;

fun ⦏do_fixity⦎ (cur_env:PP_ENV) (orig:TERM) (name:string) (ty:TYPE)
		(args:TERM list) : PFUN_ANS = (
    if is_simple_name name
    then
	case get_fixity name
	of Nonfix => (
		let
			val head_tm = (	case dest_simple_term orig
					of Var _ => mk_var(name, ty)
					| Const _ => mk_const(name, ty)
					| _ => orig
				) handle Fail _ => orig;
		in
			HOL_do_app cur_env head_tm args;
			PfOk
		end
		)
	| Prefix op_prec	=> do_prefix	cur_env name op_prec args
	| Infix op_prec		=> do_infix	cur_env name op_prec args
	| Postfix op_prec	=> do_postfix	cur_env name op_prec args
	| Binder		=> do_binder	cur_env name ty args
    else
	PfNotPossible
);

in

fun ⦏HOL_fun_const⦎ (cur_env:PP_ENV) (orig:TERM) (name:string) (ty:TYPE)
		(args:TERM list) : PFUN_ANS = (
	case
		case name
		of "Cond"	=> Value HOL_conditional
		| "Cons"	=> Value HOL_list
		| "Empty"	=> Value (HOL_empty_list_set "{}")
		| "Float"	=> Value HOL_float
		| "ℕℝ"		=> Value HOL_float
		| "Insert"	=> Value HOL_set
		| "Let"		=> Value HOL_let
		| "Nil"		=> Value (HOL_empty_list_set "[]")
		| "SetComp"	=> Value HOL_set_comp
		| "Uncurry"	=> Value HOL_uncurry
		| ","		=> Value HOL_comma
		| _		=> Nil
	of Value printer => printer cur_env orig name ty args
	| Nil =>  (
		let
			val alias = 	if !pp_use_alias
					then	SymbolTable.get_alias(name, ty)
					else	name;
		in	do_fixity cur_env orig alias ty args
		end
	)
);
=TEX

=SML
fun ⦏HOL_fun_var⦎ (cur_env:PP_ENV) (orig:TERM) (name:string) (ty:TYPE)
		(args:TERM list) : PFUN_ANS = (
	do_fixity cur_env orig name ty args
);

end;
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
\section{FINALE}

%********************************************************************

\subsection{Install the HOL Printing Functions}

%********************************************************************

\subsection{End of HOL Pretty Printer Structure}

=SML
end (* of structure HOLPrettyPrinter *);
local
open HOLPrettyPrinter;
in
val _ =
PrettyPrinterSupport.set_printers
("HOL",
	(HOL_do_λ, HOL_do_app, HOL_do_const, HOL_fun_const,
		HOL_fun_var, HOL_do_var));
end;
structure HOLPrettyPrinter : HOLPrettyPrinter = HOLPrettyPrinter;
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%********************************************************************
%--------------------------------------------------------------------

\newpage

\makeatletter
\def\refstepcounter#1{\stepcounter{#1}\global\edef\@currentlabel{\csname
	p@#1\endcsname\csname the#1\endcsname}}
\makeatother

\twocolumn[\section{INDEX}] \label{Index}

\footnotesize
\printindex

\onecolumn

\end{document}


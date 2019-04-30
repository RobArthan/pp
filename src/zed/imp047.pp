=IGN
********************************************************************************
imp047.doc: this file is part of the PPZed system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% imp047.doc  ℤ $Date: 2008/02/15 11:54:36 $ $Revision: 1.64 $ $RCSfile: imp047.doc,v $

doctex imp047 ; texdvi imp047
bibtex imp047

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

\def\Title{Implementation for Z Types and Terms}

\def\AbstractText{}

\def\Reference{DS/FMU/IED/IMP047}

\def\Author{G.T. Scullard}


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
%% LaTeX2e port: % imp047.doc  ℤ $Date: 2008/02/15 11:54:36 $ $Revision: 1.64 $ $RCSfile: imp047.doc,v $
%% LaTeX2e port: \documentstyle[hol1,11pt,TQ]{article}
%% LaTeX2e port: \ftlinepenalty=9999
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{FST Project}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Implementation for Z Types and Terms}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Implementation for Z Types and Terms}
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP047}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.64 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2008/02/15 11:54:36 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{G.T.Scullard & MAN05}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.B.Jones & Project Manager}
%% LaTeX2e port: \TPPabstract{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	    Library
%% LaTeX2e port: }}
%% LaTeX2e port: \begin{document}
%% LaTeX2e port: \makeTPPfrontpage
%% LaTeX2e port: \vfill
%% LaTeX2e port: \begin{center}
%% LaTeX2e port: \bf Copyright \copyright\ : Lemma 1 Ltd. \number\year
%% LaTeX2e port: \end{center}

\begin{document}

\headsep=0mm
\FrontPage
\headsep=10mm

\setcounter{section}{-1}
\pagebreak
\section{Document Control}
\subsection{Contents List}
\tableofcontents
\subsection{Document Cross References}
\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes History}
\begin{description}
\item [Issue 1.19 (1992/03/03)]
First draft version.

\item [Issue 1.20 (1992/06/11) to 1.31 (1992/07/16)]
	Restructure function $dest\_z\_term$ to meet the needs of the
	pretty printer.  This is done by adding function
	$basic\_dest\_z\_term$ to do the actual destruction or production
	of error message arguments, this function is used by
	$dest\_z\_term$ and by the pretty printer. Changed handling for naming of
	projection functions (including a change to the interface of
	dest\_z\_name).
\item [Issue 1.32 (1992/07/17) (July 16th 1992)]
Added support for schema renaming.
$dest\_z\_name$ given protection from subscripted punctuation.
\item [Issue 1.33 (1992/07/20)] Added binding display.
\item [Issue 1.34 (1992/07/28) (July 28th 1992)]
Corrected $θ$ stuff.
Removed local definition of $list\_mk\_→\_type$
\item[Issue 1.37 (1992/07/30) (30th July 1992)]
Corrected a bug in $mk\_z\_binding$.
\item[Issue 1.38 (1992/07/31) (31st July 1992)]
Removed redundant code of $split\_on\_bar$.
\item [Issue 1.39 (1992/08/13) (13th August 1992)]
Corrected error handling for interrupts.
\item [Issue 1.40 (1992/09/09) (9th September 1992)]
Added some necessary brackets for error handlers.
\item [Issue 1.41 (1992/11/03)]
	Added treatment of $U$ and binding of global variables.
\item [Issue 1.42 (1992/11/13) (13th November 1992)]
Corrected $mk\_u$ et al.
\item[Issue 1.43 (1992/12/10)  (10th December 1992)]
Global rename from wrk038.doc issue 1.9.
\item[Issue 1.44 (1993/01/14)  (13th January 1993)]
Improved checking of $mk\_z\_int$, and efficiency of
\item[Issue 1.45 (1993/05/17)  (17th March 1993)]
Fixed bug in $mk\_z\_binding$.
\item[Issue 1.45 (1993/05/17)  (17th March 1993)]
Fixed error-checking in $mk\_z\_app$ (i.e., it does some now!).
\item[Issue 1.47 (1997/04/23)-1.48 (1997/04/24) (23rd April 1997)]
$basic\_dest\_z\_term$ checks schema predicates more carefully now.
\item[Issue 1.49 (1999/03/07)] Update for new INTEGER type.
\item[Issue 1.50 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.51 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.52 (2003/07/16)] Made it follow the parser (term generator) in allowing θ-terms
and schemas-as-predicates in which a signature variable is bound to a global variable.
The destructor for θ-terms now checks the operand more carefully.
\item[Issue 1.53 (2004/01/19)] The Z universal set is now called 𝕌.
\item[Issue 1.54 (2004/09/06)] Performance improvements to {\em dest\_z\_name}.
\item[Issue 1.55 (2004/10/06)] Performance improvements in {\em basic\_dest\_z\_term}.
\item[Issue 1.56 (2005/09/06)] Added let-expressions.
\item[Issue 1.57 (2005/09/08)] Type constructors for given sets are now in Z namespace.
\item[Issue 1.58 (2006/01/25)] Now support decoration of fancyfix identifiers.
\item[Issue 1.59 (2006/01/25)] The name of the decoration operator is now based on the stem {\em decor} throughout, rather than {\em decor} in some places and {\em dec} in others.
\item[Issue 1.60 (2006/04/20)] Added support for floating point literals.
\item[Issues 1.61 (2007/08/02), 1.62 (2007/08/03)] Now support dollar-quoted identifiers as schema component names.
\item[Issues 1.63 (2007/09/11)] Fixed broken error message.
\item[Issue 1.64 (2008/02/15)] Added discriminator function for dollar-quoted identifiers.
\item[Issue 1.65 (2010/04/01)] Support for empty schemas.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported PPZed to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
%\subsection{Changes Forecast}
\newpage
\section{GENERAL}
\subsection{Scope}
This document contains the implementation of the constructor, discriminator and destructor functions corresponding to the primitive constructors of Z.
The detailed design of these is found in \cite{DS/FMU/IED/DTD047}.
\subsection{Introduction}
\subsubsection{Purpose and Background}
This document gives the implementation of the functions mentioned above.
Additional functions, which are used in other parts of the Z system, may also be included here for convenience.
\subsubsection{Dependencies}
The functions in this document are dependent on the Release 1 HOL System.
\subsubsection{Deficiencies}
\section{ERROR REPORTING}
For performance reasons, the arguments of the various constructors below are not checked for well-formedness or suitability and
it will therefore be possible, indeed easy, to construct terms which are not legal in our extended Z syntax.
(The constructors might be bypassed entirely and the HOL constructors
used to generate terms with the names of Z~constants.) Such terms must
be handled by the pretty printer~\cite{DS/FMU/IED/DTD031} in a way that allows them to
be read back by the HOL and Z parsers and generate a term with the same
meaning.
Of course, where the term construction fails due to some error detected in the underlying HOL or ML, it is intecepted and reported as helpfully as possible.
\section{STRUCTURE PREAMBLE}
=SML
structure ⦏ZTypesAndTerms⦎ : ZTypesAndTerms = struct
=TEX
We open the structure containing the support package (see \cite{DS/FMU/IED/IMP048}).
=SML
open ZTypesAndTermsSupport;
=TEX
Any type-checking done in this document should be done in the context
of the theory ``hol'':
=SML
val _ = open_theory "hol";
=TEX
\section{AUXILIARY FUNCTIONS}
\subsection{Name Destruction}
We need the inverse of the name construction functions (defined in
\cite{DS/FMU/IED/DTD048}).  Given a name formed as a simple identifier
followed by a sequence of name lists with each name list in square
brackets function $dest\_z\_name$ returns the identifier name plus a
list of lists.  Thus a name like

=GFT
	"abc[de,fg,hi][jk,lm][no][p,r,s]"
=TEX

is split into the following pieces

=GFT
	("abc",
	[	["de", "fg", "hi"],
		["jk", "lm"],
		["no"],
		["p", "r", "s"]
	], Nil)
=TEX

Projections are of the form
=GFT
	"abc[de,fg,hi]jk"
=TEX

which is split into the following:

=GFT
	("abc",
	[	["de", "fg", "hi"]
	], Value "jk")
=TEX

The Z parser supports the use of arbitrary names as identifiers, by enclosing them in a dollar quotation:
=INLINEFT
$"x_[]"
=TEX
\ and so we do not split on commas and square brackets enclosed in such quotations.



Function $dest\_z\_name$ splits up well formed names by interpreting the
square brackets and commas, it complains about mal-formed names.

The implementation of function $dest\_z\_name$ merits some discussion.
Their intention is to split a Z~identifier into its component pieces
whilst detecting malformed Z~identifiers.
Function $get\_id$ extracts any leading name then
function $get\_boxed\_lists$ does the work of splitting at square brackets and
commas.

The rules implemented are that the Z constant name comprises a possibly empty
``head'', followed by zero or more ``boxed lists'',  followed by an optional ``projector''.
Each boxed list is a comma-delimited list of arguments enclosed in square brackets.
The head is delimited by the opening square bracket of the first boxed list or by the end
of the name if there are no boxed lists.
Commas and square brackets can only appear in the head, the arguments or the projector if they are escaped by a subscript character or inside an arbitrary identifier.
A subscript character may not be followed by another subscript character.
Boxed lists do not nest so an opening square bracket can only appear escaped in a boxed list.
=SML
local
	exception ⦏BadName⦎;
fun ⦏skip_arbitrary_identifier⦎ (s : string) (start : int) : int = (
	let	val size_s = size s;
		fun aux ix = (
			if	ix = size_s
			then	raise BadName
			else	case String.sub(s, ix) of
				#"\\" => (
				if	ix + 1 = size_s
				then	raise BadName
				else	aux (ix + 2)
			) |	#"\"" => (
				ix + 1
			) |	_ => (
				aux (ix + 1)
			)
		);
	in	if	size_s - start < 2
		orelse	substring(s, start, 2) <> "$\""
		then	start + 1
		else	aux (start + 2)
	end
);
=IGN
skip_arbitrary_identifier "abc" 0;
skip_arbitrary_identifier "$\"abc\"" 0;
=SML
fun ⦏get_id⦎ (s : string) : string * string OPT  = (
(*
=SMLLITERAL
*)
	let	val size_s = size s;
		fun aux ix = (		
			if	ix = size_s
			then	(s, Nil)
			else	case String.sub(s, ix) of
					#"["	=> (
					(substring(s, 0, ix), Value(String.extract(s, ix, NONE)))
				) |	#"]" => raise BadName
				|	#"," => raise BadName
				|	#"⋎" => 	(
					if	ix = 0
					then	raise BadName
					else if	ix + 1 = size_s
					then	raise BadName
					else if	String.sub(s, ix + 1) = #"⋎"
					then	raise BadName
					else	aux (ix + 2)
				) |	_ => (
					aux (skip_arbitrary_identifier s ix)
				)
		);
	in	aux 0
	end
);
=IGN
get_id "abc[";
get_id "abc";
get_id "[][][";
get_id "abc[xyz, abc][a][c]";
(get_id "ab]c" ; fail "" 0 []) handle Badname => ();
(get_id "ab⋎" ; fail "" 0 []) handle Badname => ();
(get_id "ab⋎⋎" ; fail "" 0 []) handle Badname => ();
(get_id "⋎abc" ; fail "" 0 []) handle Badname => ();
get_id "_ $\"xyz[\" _[xyz, abc][a][c]";
get_id "_ $\"xyz\" _ $\"\\\" [[\" [xyz, abc][a][c]";


=SML
fun ⦏get_boxed_lists⦎ (s : string) : string list list * string OPT = (
(*
=SMLLITERAL
*)
	let	fun add_name (s, sz) acc = (
			if	sz = 0
			then	acc
			else	substring(s, 0, sz)::acc
		);
		fun aux1 acc ix s = (		
			if	ix = size s
			then	raise BadName
			else	case String.sub(s, ix) of
					#"["	=> raise BadName
				|	#"]" =>  (
					if	ix + 1 = size s
					then	(rev(add_name(s,  ix) acc), "")
					else	(rev(add_name(s, ix) acc),
						(String.extract(s, ix+1, NONE)))
				) |	#"," => (
					if	ix + 1 =size s
					then	raise BadName
					else	aux1 (add_name(s, ix) acc)
						0 (String.extract(s, ix + 1, NONE))
				) |	#"⋎" => 	(
					if	ix + 1 = size s
					then	raise BadName
					else if	String.sub(s, ix + 1) = #"⋎"
					then	raise BadName
					else	aux1 acc (ix + 2) s
				) |	_ => (
					aux1 acc (skip_arbitrary_identifier s ix) s
				)
		);
		fun aux2 acc ix s = (
			if	ix = size s
			then	raise BadName
			else	case String.sub(s, ix) of
					#"[" =>  (
					if	ix + 1 = size s
					then	raise BadName
					else	let	val (sl, rest) =
						aux1 [] 0 (String.extract(s, 1, NONE));
						in	if	size rest = 0
							then	(rev (sl::acc), Nil)
							else if	String.sub(rest, 0) = #"["
							then	aux2 (sl::acc) 0 rest
							else
		let	val (head, tail) = get_id rest;
		in	case tail of
			 	Nil => (
				(rev (sl::acc), if head = "" then Nil else Value head)
			) | 	Value _ => raise BadName
		end
						end
				) |	_ => raise BadName
		);
	in	aux2 [] 0 s
	end
);
=IGN
get_boxed_lists "[abc]";
get_boxed_lists "[abc,d,e]";
get_boxed_lists "[abc⋎,d,e]";
get_boxed_lists "[abc⋎,d,e][]";
get_boxed_lists "[]";
get_boxed_lists "[][]abc";
get_boxed_lists "[aa][bb⋎,x]abc";
get_boxed_lists "[$\"]\"][bb⋎,x]abc";
get_boxed_lists "[$\"]\"][a,$\",\",b]abc";
get_boxed_lists "[$\"]\"][a,$\",\",b]abc";
get_boxed_lists "[]abc";
get_boxed_lists "[]$\"[\"";
=SML
in
fun ⦏dest_z_name1⦎ (s : string) : string * string OPT = (
	get_id s handle BadName => fail "dest_z_name1" 47000 [fn _ => s]
);

fun ⦏dest_z_name2⦎ (orig_name : string) (Value s : string OPT) : string list list * string OPT = (
	get_boxed_lists s handle BadName => fail "dest_z_name2" 47000 [fn _ => orig_name]
) | dest_z_name2 _ Nil = ([], Nil);

fun	⦏dest_z_name⦎ (s:string) :string * string list list * string OPT = (
	(case get_id s of
		(head, Nil) => (head, [], Nil)
	|	(head, Value tail) =>
		let	val (boxed_lists, projector) = get_boxed_lists tail;
		in	(head, boxed_lists, projector)
		end
	)	handle Fail _ => fail "dest_z_name" 47000 [fn () => s]
	|	BadName => fail "dest_z_name" 47000 [fn () => s]
);
end;
=IGN
dest_z_name "Abcd[]";
dest_z_name "abc[d,,,,]";
dest_z_name "abc[d,]";
dest_z_name "Z'Decl";
get_id "Z'Decl";
dest_z_name "xxx[abc]def";
=TEX
=SML
fun ⦏mk_dollar_quoted_string⦎ (s : string) : string = (
	let	fun aux acc [] = implode (rev ("\""::acc))
		|   aux acc ("\""::more) = aux ("\""::"\\"::acc) more
		|   aux acc ("\\"::more) = aux ("\\"::"\\"::acc) more
		|   aux acc (ch::more) = aux (ch::acc) more;
	in	aux ["\"", "$"] (explode s)
	end
);
=TEX
=SML
fun ⦏dest_dollar_quoted_string⦎ (s : string) : string = (
	let	fun aux _ [] = fail "dest_dollar_quoted_string" 47001 [fn () => s]
		|   aux acc ["\""] = implode (rev acc)
		|   aux acc ("\\"::ch::more) = aux (ch::acc) more
		|   aux acc (ch::more) = aux (ch::acc) more;
	in	case explode s of
			"$"::"\""::rest => aux [] rest
		|	_ => fail "dest_dollar_quoted_string" 47001 [fn () => s]
	end
);
=SML
fun ⦏is_dollar_quoted_string⦎ (s : string) : bool = (
	(dest_dollar_quoted_string s; true) handle Fail _ => false
);
=TEX
The following function tests for multiple occurrences of a string in a list
of same.
=SML
fun moccurs (area : string) (msg : int) (a :: x : string list) : unit = (
	if	a mem x
	then	fail area msg [fn () => a]
	else	moccurs area msg x
) | moccurs _ _ [] = ();
=TEX
\section{Z TYPES}
The following sections describe the constructor, discriminator and destructor functions for each of the five Z type constructors.
\subsection{The Datatype $Z\_TYPE$}

The general mapping functions $mk\_z\_type$, $is\_z\_type$ and
$dest\_z\_type$, which are declared later in this document, use this
datatype.

=SML
datatype	⦏Z_TYPE⦎ = 	⦏ZGivenType⦎ of string
		|		⦏ZVarType⦎ of string
		|		⦏ZPowerType⦎ of TYPE
		|		⦏ZTupleType⦎ of TYPE list
		|		⦏ZSchemaType⦎ of (string * TYPE) list;
=TEX
\subsection{The General Destructor Function}
This function converts a HOL type to the appropriate form of the above datatype (providing, of course, that it represents a valid Z type).
=SML
fun	⦏dest_z_type⦎ (ty:TYPE) :Z_TYPE =
	case dest_simple_type ty of
		Vartype s => (
			case explode s of
				("'"::t) => ZVarType(implode t)
			|	_ => fail "" 0 []
		)
	|	Ctype("SET",[ty1]) => ZPowerType ty1
	|	Ctype(s,tyl) => (
			case (dest_z_name s,tyl) of
				(("Z'T",[[n]], Nil),tyl) =>
					if string_of_int(length tyl) = n
					then ZTupleType tyl
					else fail "" 0 []
			|	(("Z'S",[cl], Nil),tyl) =>
					ZSchemaType(combine cl tyl)
			|	(_,[]) => ZGivenType s
			|	_ => fail "" 0 []
		)
	handle Fail _ => type_fail "dest_z_type" 47800 [ty];
=TEX
\subsection{The General Discriminator Function}
=SML
fun	⦏is_z_type⦎ (t:TYPE) :bool =
	(dest_z_type t; true)
	handle Fail _ => false;
=TEX
\subsection{Given Sets}
=SML
fun	⦏mk_z_given_type⦎ (s:string) :TYPE = mk_ctype(s,[]);

fun	⦏is_z_given_type⦎ (ty :TYPE) :bool = (
	case dest_z_type ty of	
		ZGivenType _ => true
	|	_ => false
	)
	handle Fail _ => false;

fun	⦏dest_z_given_type⦎ (ty :TYPE) :string = (
	case dest_z_type ty of
		ZGivenType s => s
	|	_ => fail "" 0 []
	)
	handle Fail _ => type_fail "dest_z_given_type" 47010 [ty];
=TEX
\subsection{Generic Variables}
=SML
fun	⦏mk_z_var_type⦎ (s:string) :TYPE = mk_vartype("'" ^ s);

fun	⦏is_z_var_type⦎ (ty :TYPE) :bool = (
	case dest_z_type ty of	
		ZVarType _ => true
	|	_ => false
	)
	handle Fail _ => false;

fun	⦏dest_z_var_type⦎ (ty :TYPE) :string = (
	case dest_z_type ty of
		ZVarType s => s
	|	_ => fail "" 0 []
	)
	handle Fail _ => type_fail "dest_z_var_type" 47020 [ty];
=TEX
\subsection{Set Types}
=SML
fun	⦏mk_z_power_type⦎ (ty:TYPE) :TYPE = mk_ctype("SET",[ty]);

fun	⦏is_z_power_type⦎ (ty :TYPE) :bool = (
	case dest_z_type ty of	
		ZPowerType _ => true
	|	_ => false
	)
	handle Fail _ => false;
=TEX
=IGN
(* A very proper way to do it, but a bit slow for something so key *)
fun	⦏dest_z_power_type⦎ (ty :TYPE) :TYPE = (
	case dest_z_type ty of
		ZPowerType t => t
	|	_ => fail "" 0 []
	)
	handle Fail _ => type_fail "dest_z_power_type" 47030 [ty];
=TEX
=SML
fun	⦏dest_z_power_type⦎ (ty :TYPE) :TYPE = (
	case dest_ctype ty of
		("SET",[t]) => t
	|	_ => fail "" 0 []
	)
	handle Fail _ => type_fail "dest_z_power_type" 47030 [ty];
=TEX
\subsection{Cartesian Product Types}
=SML
fun	⦏mk_z_tuple_type⦎ (tyl:TYPE list) :TYPE =
		tuple_type tyl;

fun	⦏is_z_tuple_type⦎ (ty :TYPE) :bool = (
	case dest_z_type ty of	
		ZTupleType _ => true
	|	_ => false
	)
	handle Fail _ => false;

fun	⦏dest_z_tuple_type⦎ (ty :TYPE) :TYPE list = (
	case dest_z_type ty of
		ZTupleType tyl => tyl
	|	_ => fail "" 0 []
	)
	handle Fail _ => type_fail "dest_z_tuple_type" 47040 [ty];
=TEX
\subsection{Binding Types}
=SML
fun	⦏mk_z_schema_type⦎ (itym:(string * TYPE) list) :TYPE =
		bind_type itym;

fun	⦏is_z_schema_type⦎ (ty :TYPE) :bool = (
	case dest_z_type ty of	
		ZSchemaType _ => true
	|	_ => false
	)
	handle Fail _ => false;

fun	⦏dest_z_schema_type⦎ (ty :TYPE) :(string * TYPE) list = (
	case dest_z_type ty of
		ZSchemaType itym => itym
	|	_ => fail "" 0 []
	)
	handle Fail _ => type_fail "dest_z_schema_type" 47050 [ty];
=TEX
\subsection{The General Constructor Function}
This function uses the constructors defined above to convert a $Z\_TERM$ to the corresponding $TERM$.
=SML
fun	⦏mk_z_type⦎	(ZGivenType(s:string) :Z_TYPE) :TYPE = mk_z_given_type s
|	mk_z_type	(ZVarType(s:string)) = mk_z_var_type s
|	mk_z_type	(ZPowerType(ty:TYPE)) = mk_z_power_type ty
|	mk_z_type	(ZTupleType(tyl:TYPE list)) = mk_z_tuple_type tyl
|	mk_z_type	(ZSchemaType(itym:(string * TYPE)list)) = mk_z_schema_type itym;
=TEX
\section{Z TERMS}
The following describes the constructor, discriminator and destructor functions for Z terms.
\subsection{The Datatype Z\_TERM}

The general mapping functions $mk\_z\_term$, $is\_z\_term$ and
$dest\_z\_term$, which are declared later in this document, use this
datatype.

=SML
datatype	⦏Z_TERM⦎
		=	 	⦏ZDec⦎ of TERM list * TERM
		|		⦏ZSchemaDec⦎ of TERM * string
		|		⦏ZDecl⦎ of TERM list
		|		⦏ZEq⦎ of TERM * TERM
		|		⦏Z∈⦎ of TERM * TERM
		|		⦏ZTrue⦎
		|		⦏ZFalse⦎
		|		⦏Z¬⦎ of TERM
		|		⦏Z∧⦎ of TERM * TERM
		|		⦏Z∨⦎ of TERM * TERM
		|		⦏Z⇒⦎ of TERM * TERM
		|		⦏Z⇔⦎ of TERM * TERM
		|		⦏Z∃⦎ of TERM * TERM * TERM
		|		⦏Z∃⋎1⦎ of TERM * TERM * TERM
		|		⦏Z∀⦎ of TERM * TERM * TERM
		|		⦏ZSchemaPred⦎ of TERM * string
		|		⦏ZLVar⦎ of string * TYPE * TERM list
		|		⦏ZGVar⦎ of string * TYPE * TERM list
		|		⦏ZInt⦎ of string
		|		⦏ZString⦎ of string
		|		⦏ZFloat⦎ of TERM * TERM * TERM
		|		⦏Z⟨⟩⦎ of TYPE * TERM list
		|		⦏ZSetd⦎ of TYPE * TERM list
		|		⦏ZSeta⦎ of TERM * TERM * TERM
		|		⦏Zℙ⦎ of TERM
		|		⦏ZTuple⦎ of TERM list
		|		⦏ZBinding⦎ of (string * TERM) list
		|		⦏Z×⦎ of TERM list
		|		⦏Zθ⦎ of TERM * string
		|		⦏ZSel⋎s⦎ of TERM * string
		|		⦏ZSel⋎t⦎ of TERM * int
		|		⦏ZApp⦎ of TERM * TERM
		|		⦏Zλ⦎ of TERM * TERM * TERM
		|		⦏Zμ⦎ of TERM * TERM * TERM
		|		⦏ZLet⦎ of (string * TERM) list * TERM
		|		⦏ZHSchema⦎ of TERM * TERM
		|		⦏ZDecor⋎s⦎ of TERM * string
		|		⦏ZPre⋎s⦎ of TERM
		|		⦏Z¬⋎s⦎ of TERM
		|		⦏Z∧⋎s⦎ of TERM * TERM
		|		⦏Z∨⋎s⦎ of TERM * TERM
		|		⦏Z⇒⋎s⦎ of TERM * TERM
		|		⦏Z⇔⋎s⦎ of TERM * TERM
		|		⦏Z↾⋎s⦎ of TERM * TERM
		|		⦏ZHide⋎s⦎ of TERM * string list
		|		⦏Z∃⋎s⦎ of TERM * TERM * TERM
		|		⦏Z∃⋎1⋎s⦎ of TERM * TERM * TERM
		|		⦏Z∀⋎s⦎ of TERM * TERM * TERM
		|		⦏ZΔ⋎s⦎ of TERM
		|		⦏ZΞ⋎s⦎ of TERM
		|		⦏Z⨾⋎s⦎ of TERM * TERM
		| 		⦏ZRename⋎s⦎ of TERM * (string * string) list
		;
=TEX

\subsection{Result of Basic Destructor Function}

This function converts a HOL term to the appropriate form of the
datatype $Z\_TERM$, or to an encoding of why it could not be converted.
The encoded failure value is intended for use by the pretty
printer~\cite{DS/FMU/IED/DTD031,DS/FMU/IED/DTD064}, it contains values
showing how (in some cases) the term might be HOL if it were modified
slightly.  The return value from the basic destructor function is
in type $BDZ$ (named for `Basic Destroy Z').

=SML
datatype ⦏BDZ⦎
	=	⦏BdzOk⦎	of Z_TERM
	|	⦏BdzNotZ⦎	of int
	|	⦏BdzFail⦎	of {
			⦏BdzFCode⦎	: int,
			⦏BdzFCompc⦎	: int,
			⦏BdzFArgc⦎	: int
		}
	;
=TEX

Successful destruction returns $BdzOk$ with the Z term.  Value
$BdzFail$ is returned when the term is similar to a Z~term (i.e., it
has a known constructor but the wrong number of arguments).  In this
case the $BdzFCompc$ and $BdzFArgc$ fields tell how many component
lists and arguments (respectively) are allowed in a well formed
Z~term.  Value $BdzNotZ$ is returned when the term is not
recognisable as a Z~term.  In cases where insufficient component lists
or arguments are given to a known constructor either $BdzFail$ or
$BdzNotZ$ may be returned.

\subsection{Destructor Utilities}

=SML
fun ⦏zdest_0_0⦎(nil, nil, _, v) = BdzOk v
| zdest_0_0(_, _, e, _) = BdzNotZ 47900
;

fun ⦏zdest_1_gt0⦎(_, nil, e, _) = BdzNotZ 47900
| zdest_1_gt0(_::_, a, _, v) = BdzOk(v a)
| zdest_1_gt0(_, _, e, _) = BdzNotZ 47900
;

fun ⦏zdest_0_1⦎(nil, [x], _, v) = BdzOk(v x)
| zdest_0_1 (_, _::_::_, e, _) =
	BdzFail{BdzFCode=e, BdzFCompc=0, BdzFArgc=1}
| zdest_0_1(_, _, e, _) = BdzNotZ 47900
;

fun ⦏zdest_0_2⦎(nil, [x, y], _, v) = BdzOk(v(x,y))
| zdest_0_2 (_, _::_::_::_, e, _) =
	BdzFail{BdzFCode=e, BdzFCompc=0, BdzFArgc=2}
| zdest_0_2(_, _, e, _) = BdzNotZ 47900
;

fun ⦏zdest_1_1⦎([_], [x], _, v) = BdzOk(v x)
| zdest_1_1 (_, _::_::_, e, _) =
	BdzFail{BdzFCode=e, BdzFCompc=1, BdzFArgc=1}
| zdest_1_1(_, _, e, _) = BdzNotZ 47900
;

fun ⦏zdest_2_2⦎([_, _], [x, y], _, v) = BdzOk(v(x, y))
| zdest_2_2 (_, _::_::_::_, e, _) =
	BdzFail{BdzFCode=e, BdzFCompc=2, BdzFArgc=2}
| zdest_2_2(_, _, e, _) = BdzNotZ 47900
;
=IGN
fun ⦏zdest_gt0_0⦎(nil, nil, e, _) = BdzNotZ 47900
| zdest_gt0_0(_, nil, _, v) = BdzOk v
| zdest_gt0_0(_, _, e, _) = BdzNotZ 47900
;
=TEX

=SML
fun ⦏dest_val_tuple⦎(name:string, ty: TYPE, constr:string * TYPE * TERM list -> Z_TERM,
		arg_tm:TERM, e:int) : BDZ = (
	let
		val (arg_fn, args) = strip_app arg_tm;
		val (arg_name, arg_ty) = dest_const arg_fn;
	in
		case dest_z_name arg_name
		of ("Z'Mk_T", [_], Nil) =>
			BdzOk(constr(name, snd(dest_→_type ty), args))
		| _ =>
			BdzFail{BdzFCode=e,
				BdzFCompc=0, BdzFArgc=0}
	end
	handle Fail _ =>
		BdzFail{BdzFCode=e, BdzFCompc=0, BdzFArgc=0}
);
=TEX

=SML
fun	⦏dest_abstraction⦎ (t:TERM) :TERM list =
		snd(strip_app(snd(strip_λ t)))
	handle Fail _ => term_fail "dest_z_term" 47901 [t];
=TEX

=SML
fun	⦏dest_∃body⦎ (t:TERM) :TERM list =
		snd(strip_app(snd(strip_∃ t)))
	handle Fail _ => term_fail "dest_z_term" 47901 [t];
=TEX

=SML
fun	⦏dest_∀body⦎ (t:TERM) :TERM list =
		snd(strip_app(snd(strip_∀ t)))
	handle Fail _ => term_fail "dest_z_term" 47901 [t];
=TEX
$split\_on\_bar$ undoes the encoding of two identifers as one
string, and is found in \cite{DS/FMU/IED/DTD048}.
=SML
fun ⦏zdest_rename⦎(comp_list, args, n, v) = (
	if length comp_list = 2
	then if length args = 1
		then (let val a2 = map split_on_bar (hd(tl comp_list))
		in
		BdzOk (v(hd args, a2))
		end
		handle (Fail _) =>
		BdzFail{BdzFCode=n, BdzFCompc=2, BdzFArgc=1})
		else BdzFail{BdzFCode=n, BdzFCompc=2, BdzFArgc=1}
	else BdzNotZ 47900
);
=TEX	
\subsection{Binding Construction}
There are three constructors below which generate systematically decorated bindings from schemas: schema references as declarations, schema references as predicates and theta terms.
We therefore provide the following general function for doing this.
=SML
local open ZTypesAndTermsSupport in
fun	⦏mk_binding⦎ ((sch,d):TERM * string) :TERM =
	let	val itym = dest_z_schema_type(dest_z_power_type(type_of sch));
		val itym' = map (fn(s,t) => (pack_ident(s,d),t)) itym;
		val bcons = bind_cterm itym;
		val argl = map mk_var itym';
	in
		list_mk_app(bcons,argl)
	end
	handle Fail _ => term_fail "mk_binding" 47940 [sch];
end;
=TEX
\subsection{Making Z Schemas as Predicates and θ-Terms}
These are given out of order to allow a thorough check of the otherwise rather fragile
destruction of Z Schemas as Predicates and of θ-terms.
=SML
fun	⦏mk_z_schema_pred⦎ ((sch,d):TERM * string) :TERM =
	let	val bind = mk_binding(sch,d);
		val bty = type_of bind;
		val sty = type_of sch;
		val cty = list_mk_→_type[bty,sty,BOOL];
		val con = mk_const("Z'SchemaPred",cty);
	in
		list_mk_app(con,[bind,sch])
	end;
=TEX
=SML
fun	⦏mk_z_θ⦎ ((sch,d):TERM * string) :TERM =
	let	val bind = mk_binding(sch,d);
		val bty = type_of bind;
		val sty = type_of sch;
		val cty = list_mk_→_type[bty,sty,bty];
		val con = mk_const("Z'θ",cty);
	in
		list_mk_app(con,[bind,sch])
	end;
=TEX
\subsection{The Basic Destructor Function}

Function $basic\_dest\_z\_term$ does the work of destroying a term to
yield its Z~structure.  The arguments are in the result of applying
$strip\_app$ to a term.  (This parameterisation is of benefit to the
pretty printer~\cite{DS/FMU/IED/DTD031}.)

The main part of this function is a large case clause which switches
depending on the name of the constant at the head of the stripped
application, the other cases are simple and dealt with in the
immedaitely following block of code.

=SML
fun ⦏basic_dest_z_term⦎ (hdterm:TERM, args:TERM list) : BDZ = (
let	fun gvar_to_lvar v = (
		case basic_dest_z_term (strip_app v) of
			BdzOk(ZGVar (n, ty, _)) =>  mk_var(n, ty)
		|	BdzOk(ZLVar _) =>  v
		|	_ => fail "" 0 [] (* must be caught by caller *)
	);
in
	case dest_simple_term hdterm
	of App _ => BdzNotZ 47900
	| Simpleλ _ => BdzNotZ 47900
	| Var (name, ty) => (
		case args
		of nil => BdzOk(ZLVar(name, ty,[]))
		| [tm] => dest_val_tuple(name, ty, ZLVar, tm, 47090)
		| _ => BdzFail{BdzFCode=47090,
				BdzFCompc=0, BdzFArgc=1}
	)
	| Const (name, ty) => (
		let
			val (identifier, rest) = dest_z_name1 name;
		in
			case identifier of
			"Z'S"=> (
				case (args, dest_z_name2 name rest) of
				([x], (_, Value s)) => BdzOk(ZSel⋎s(x,s))
				| _ => BdzFail{BdzFCode=47180, BdzFCompc=2,
								BdzFArgc=1}
				)
			|"Z'T" => (
				case (args, dest_z_name2 name rest) of
				([x], (_, Value s)) => BdzOk(ZSel⋎t(x,nat_of_string s))
				| _ => BdzFail{BdzFCode=47185, BdzFCompc=2,
								BdzFArgc=1}
				)
			| _  => (
				let	val (comp_list, projector) = dest_z_name2 name rest;
				in	case identifier
(*
=TEX
The $case$ clause started on the line above opens up the Z~term based
on the names of the constant.  The various options are catered for in
the following sections, the end of the function is in
section~\ref{EndOfFunctionBDZ}.
=TEX

\subsubsection{Declarations}
First we look for declarations, beginning with variables.
=SML
*)
of "Z'Dec" => (
	case (comp_list, args)
	of ([],[x]) => (
		BdzOk(ZDec((dest_list ** Combinators.I)(dest_pair x)))
		handle Fail _ => BdzNotZ 47900
	)
	| _ => BdzFail{BdzFCode=47910, BdzFCompc=0, BdzFArgc=1}
)
(*
=TEX
Then schema declarations. Note that unlike θ-terms and schemas-as-predicates
it would not be valid to have a global variable in the binding.
An empty schema declaration always returns no decoration even though
the declaration could have had a decoration.
=SML
*)
| "Z'SchemaDec" => (
	case (comp_list, args)
	of ([],[bind, sch]) => (
		let	val btym = map dest_var (snd(strip_app bind));
			val stym = dest_z_schema_type(dest_z_power_type(type_of sch));
		in
			case (btym, stym) of
				((bname, _)::_, (sname, _)::_)	=>
				let
					val (_, bdec) = unpack_ident bname;
					val (_, sdec) = unpack_ident sname;
					val sz_bdec = size bdec;
					val sz_sdec = size sdec;
				in	if	sz_sdec <= sz_bdec
					then	BdzOk(ZSchemaDec(sch,String.extract(bdec, sz_sdec, NONE)))
					else	BdzNotZ 47911
				end
			|	([], [])	=> BdzOk(ZSchemaDec(sch, ""))
			|	_		=> BdzNotZ 47911
		end
		)
	| _ => BdzFail{BdzFCode=47911, BdzFCompc=0, BdzFArgc=1}
)
(*
=TEX
And composite declarations.
Note that all declarations used in other constructs must be of this
form, even if only one of the above forms is used (it is even possible
to have an empty declaration under certain circumstances).
=SML
*)
| "Z'Decl" => (
	case (comp_list, args)
	of ([],[x]) => (
		BdzOk(ZDecl(dest_list x))
		handle Fail _ => BdzNotZ 47912
	)
	| _ => BdzFail{BdzFCode=47912, BdzFCompc=0, BdzFArgc=1}
)
(*
=TEX
\subsubsection{Predicates}

The logical connectives, `true' and `false', map directly on to the
equivalent HOL constants.

=SML
*)
| "T"	=> zdest_0_0(comp_list, args, 47900, ZTrue)
| "F"	=> zdest_0_0(comp_list, args, 47900, ZFalse)
(*
=TEX

Equality and equivalence both use the HOL `$=$' constant, they are distinguished by the
types of their operands.  Equivalence has both arguments of type $BOOL$.

=IGN
| "="	=> zdest_0_2(comp_list, args, 47220, ZEq)
| "⇔"	=> zdest_0_2(comp_list, args, 47280, Z⇔)
=SML
*)
| "="	=> (
	case (comp_list, args)
	of (nil,[x, y]) => (
		BdzOk(	(if type_of x =: BOOL andalso type_of y =: BOOL
			then Z⇔
			else ZEq
			)(x,y)
		)
	)
	| (_, _::_::_::_) =>
		BdzFail{BdzFCode=47220, BdzFCompc=0, BdzFArgc=2}
	| _ => BdzNotZ 47900
)
(*
=TEX

=SML
*)
| "∈"	=> zdest_0_2(comp_list, args, 47230, Z∈)
| "¬"	=> zdest_0_1(comp_list, args, 47240, Z¬)
| "∧"	=> zdest_0_2(comp_list, args, 47250, Z∧)
| "∨"	=> zdest_0_2(comp_list, args, 47260, Z∨)
| "⇒"	=> zdest_0_2(comp_list, args, 47270, Z⇒)
(*
=TEX
=SML
*)
| "Z'∃" => (
	case (comp_list, args)
	of ([],[x]) => (
		(case dest_∃body x
		of	[d,p,v] => BdzOk(Z∃(d,p,v))
		|	_ => fail "" 0 [])
		handle Fail _ => BdzNotZ 47920
	)
	| _ => BdzFail{BdzFCode=47920, BdzFCompc=0, BdzFArgc=1}
)
(*
=TEX
=SML
*)
| "Z'∃⋎1" => (
	case (comp_list, args)
	of ([_],[x]) => (
		(case dest_abstraction x of
			[d,p,v] => BdzOk(Z∃⋎1(d,p,v))
		|	_ => fail "" 0 [])
		handle Fail _ => BdzNotZ 47921
	)
	| _ => BdzFail{BdzFCode=47921, BdzFCompc=0, BdzFArgc=1}
)
(*
=TEX
=SML
*)
| "Z'∀" => (
	case (comp_list, args)
	of ([],[x]) => (
		(case dest_∀body x of
			[d,p,v] => BdzOk(Z∀(d,p,v))
		|	_ => fail "" 0 [])
		handle Fail _ => BdzNotZ 47922
	)
	| _ => BdzFail{BdzFCode=47922, BdzFCompc=0, BdzFArgc=1}
)
(*
=TEX
=SML
*)
| "Z'SchemaPred" => (
	case (comp_list, args)
	of ([],[bind, sch]) => (
		let	val vars = snd (strip_app bind);
			val lvars = map gvar_to_lvar vars;
			val btym = map dest_var lvars;
			val stym = dest_z_schema_type(dest_z_power_type(type_of sch));
			val d =
				case (btym, stym) of
					((bname, _)::_, (sname, _)::_)	=>
						implode(
						(explode bname) from
						(length(explode sname)))
				|	([], [])			=> ""
				|	_				=> fail "" 0 [];
			val orig_term = list_mk_app(hdterm, args);
			val reverse_term = subst(combine vars lvars) (mk_z_schema_pred(sch, d));
			val dummy = if (orig_term =$ reverse_term)
				then ()
				else fail "" 0 [];
		in
			BdzOk(ZSchemaPred(sch,d))
		end
		handle Fail _ => BdzNotZ 47923
	)
	| _ => BdzFail{BdzFCode=47923, BdzFCompc=0, BdzFArgc=1}
)
(*
=TEX
\subsubsection{Terms}

We must postpone the handling of local and global variables until the
end of the case clause because they do not have an easily identifiable
constant part.

=SML
*)
| "Z'Int" => (
	case (comp_list, args)
	of ([],[tm]) => (
		BdzOk(ZInt(fst(dest_const tm)))
		handle Fail _ => BdzNotZ 47105
	)
	| _ => BdzFail{BdzFCode=47105, BdzFCompc=0, BdzFArgc=1}
)
(*
=TEX
=SML
*)
| "Z'String" => (
	case (comp_list, args)
	of ([],[tm]) => (
		BdzOk(ZString(dest_string tm))
		handle Fail _ => BdzNotZ 47105
	)
	| _ => BdzFail{BdzFCode=47105, BdzFCompc=0, BdzFArgc=1}
)
(*
=TEX
=SML
*)
| "Z'Float" => (
	case (comp_list, args)
	of ([],[tm1, tm2, tm3]) => (

		BdzOk(ZFloat(tm1, tm2, tm3))
		handle Fail _ => BdzNotZ 47107
	)
	| _ => BdzFail{BdzFCode=47107, BdzFCompc=0, BdzFArgc=1}
)
(*
=TEX
=SML
*)
| "Z'⟨⟩" => (
	case (comp_list, args)
	of ([],[x]) => (
		(case dest_ctype(type_of x) of
			("LIST",[t]) => BdzOk(Z⟨⟩(t,dest_list x))
		|	_ => fail "" 0 [])
		handle Fail _ => BdzNotZ 47110
	)
	| _ => BdzFail{BdzFCode=47110, BdzFCompc=0, BdzFArgc=1}
)
(*
=TEX
=SML
*)
| "Z'Setd" => (
	case (comp_list, args)
	of ([],[x]) => (
		(case dest_ctype(type_of x) of
			("LIST",[t]) => BdzOk(ZSetd(t,dest_list x))
		|	_ => fail "" 0 [])
		handle Fail _ => BdzNotZ 47120
	)
	| _ => BdzFail{BdzFCode=47120, BdzFCompc=0, BdzFArgc=1}
)
(*
=TEX
=SML
*)
| "Z'Seta" => (
	case (comp_list, args)
	of ([_],[x]) => (
		(case dest_abstraction x of
			[d,p,v] => BdzOk(ZSeta(d,p,v))
		|	_ => fail "" 0 [])
		handle Fail _ => BdzNotZ 47130
	)
	| _ => BdzFail{BdzFCode=47130, BdzFCompc=1, BdzFArgc=1}
)
(*
=TEX
=SML
*)
| "Z'ℙ"	=> zdest_0_1	(comp_list, args, 47140, Zℙ)
| "Z'Mk_T"	=> zdest_1_gt0	(comp_list, args, 47150, ZTuple)
| "Z'Mk_S"	=> (
	case comp_list
	of [comps] => (
		(BdzOk(ZBinding(combine comps args)))
		handle Fail _ =>
		BdzFail{BdzFCode=47130, BdzFCompc=1, BdzFArgc=length comps}
	)
	| _ => BdzNotZ 47900
)
| "Z'×"	=> zdest_1_gt0	(comp_list, args, 47160, Z×)
(*
=TEX
=SML
*)
| "Z'θ" => (
	case (comp_list, args)
	of ([],[bind,sch]) => (
		let	val vars = snd(strip_app bind);
			val lvars =map gvar_to_lvar vars;
			val btym = map dest_var lvars;
			val stym = dest_z_schema_type(dest_z_power_type(type_of sch));
			val d =
				case (btym, stym) of
					((bname, _)::_, (sname, _)::_)	=>
						implode(
						(explode bname) from
						(length(explode sname)))
				|	([], [])			=> ""
				|	_				=> fail "" 0 [];
			val orig_term = list_mk_app(hdterm, args);
			val reverse_term = subst(combine vars lvars) (mk_z_θ(sch, d));
			val dummy = if (orig_term =$ reverse_term)
				then ()
				else fail "" 0 [];
		in
			BdzOk(Zθ(sch,d))
		end
		handle Fail _ => BdzNotZ 47170
	)
	| _ => BdzFail{BdzFCode=47170, BdzFCompc=0, BdzFArgc=1}
)
(*
=TEX
=SML
*)
| "Z'App"	=> zdest_0_2(comp_list, args, 47190, ZApp)
(*
=TEX
=SML
*)
| "Z'λ" => (
	case (comp_list, args)
	of ([_],[x]) => (
		(case dest_abstraction x of
			[d,p,t,v] => BdzOk(Zλ(d,p,v))
		|	_ => fail "" 0 [])
		handle Fail _ => BdzNotZ 47200
	)
	| _ => BdzFail{BdzFCode=47200, BdzFCompc=0, BdzFArgc=1}
)
(*
=TEX
=SML
*)
| "Z'μ" => (
	case (comp_list, args)
	of ([_],[x]) => (
		(case dest_abstraction x of
			[d,p,v] => BdzOk(Zμ(d,p,v))
		|	_ => fail "" 0 [])
		handle Fail _ => BdzNotZ 47936
	)
	| _ => BdzFail{BdzFCode=47936, BdzFCompc=0, BdzFArgc=1}
)
(*
=TEX
=SML
*)
| "Z'Let" => (
	case (comp_list, args)
	of ([],[mu]) => (
		case basic_dest_z_term (strip_app mu) of
			BdzOk(Zμ(d,p,v)) => (
		case basic_dest_z_term(strip_app d) of

			BdzOk(ZDecl decs) => (
			let	fun aux dec = (
	case basic_dest_z_term (strip_app dec) of
		BdzOk(ZDec ([i], t)) => (
	case basic_dest_z_term (strip_app t) of
		BdzOk(ZSetd(_, [e])) => (fst(dest_var i), e)
	|	_ => fail "" 0 [])
	|	_ => fail "" 0 []
				);
				val iddefs = map aux decs;
			in	if	is_t p
				then	BdzOk(ZLet(iddefs, v))
				else	fail "" 0 []
			end
		) |	_ => fail "" 0 []
		) |	_ => fail "" 0 []
		handle Fail _ => BdzNotZ 47937
	)
	| _ => BdzFail{BdzFCode=47937, BdzFCompc=0, BdzFArgc=1}
)
(*
=TEX
\subsubsection{Schemas}
=SML
*)
| "Z'⋎s" => (
	case (comp_list, args)
	of ([_],[x]) => (
		(case dest_abstraction x of
			[d,p] => BdzOk(ZHSchema(d,p))
		|	_ => fail "" 0 [])
		handle Fail _ => BdzNotZ 47940
	)
	| _ => BdzFail{BdzFCode=47940, BdzFCompc=0, BdzFArgc=1}
)
(*
=TEX
=SML
*)
| "Z'Decor⋎s" => (
	case (comp_list, args)
	of ([_,[]],[x]) => BdzOk(ZDecor⋎s(x,""))
	| ([_,[s]],[x]) => BdzOk(ZDecor⋎s(x,s))
	| _ => BdzFail{BdzFCode=47340, BdzFCompc=1, BdzFArgc=1}
)
(*
=TEX
=SML
*)
| "Z'Pre⋎s"	=> zdest_1_1(comp_list, args, 47350, ZPre⋎s)
| "Z'¬⋎s"	=> zdest_0_1(comp_list, args, 47360, Z¬⋎s)
| "Z'∧⋎s"	=> zdest_2_2(comp_list, args, 47370, Z∧⋎s)
| "Z'∨⋎s"	=> zdest_2_2(comp_list, args, 47380, Z∨⋎s)
| "Z'⇒⋎s"	=> zdest_2_2(comp_list, args, 47390, Z⇒⋎s)
| "Z'⇔⋎s"	=> zdest_2_2(comp_list, args, 47400, Z⇔⋎s)
| "Z'↾⋎s"	=> zdest_2_2(comp_list, args, 47410, Z↾⋎s)
(*
=TEX
=SML
*)
| "Z'Hide⋎s" => (
	case (comp_list, args)
	of ([_,sl],[x]) => BdzOk(ZHide⋎s(x,sl))
	| _ => BdzFail{BdzFCode=47420, BdzFCompc=2, BdzFArgc=1}
)
(*
=TEX
=SML
*)
| "Z'∃⋎s" => (
	case (comp_list, args)
	of ([_,_],[x,y]) => (
		(case dest_abstraction x of
			[d,p] => BdzOk(Z∃⋎s(d,p,y))
		|	_ => fail "" 0 [])
		handle Fail _ => BdzNotZ 47941
	)
	| _ => BdzFail{BdzFCode=47941, BdzFCompc=2, BdzFArgc=2}
)
(*
=TEX
=SML
*)
| "Z'∃⋎1⋎s" => (
	case (comp_list, args)
	of ([_,_],[x,y]) => (
		(case dest_abstraction x of
			[d,p] => BdzOk(Z∃⋎1⋎s(d,p,y))
		|	_ => fail "" 0 [])
		handle Fail _ => BdzNotZ 47942
	)
	| _ => BdzFail{BdzFCode=47942, BdzFCompc=2, BdzFArgc=2}
)
(*
=TEX
=SML
*)
| "Z'∀⋎s" => (
	case (comp_list, args)
	of ([_,_],[x,y]) => (
		(case dest_abstraction x of
			[d,p] => BdzOk(Z∀⋎s(d,p,y))
		|	_ => fail "" 0 [])
		handle Fail _ => BdzNotZ 47943
	)
	| _ => BdzFail{BdzFCode=47943, BdzFCompc=2, BdzFArgc=2}
)
(*
=TEX
=SML
*)
| "Z'Δ⋎s"	=> zdest_1_1(comp_list, args, 47460, ZΔ⋎s)
| "Z'Ξ⋎s"	=> zdest_1_1(comp_list, args, 47470, ZΞ⋎s)
| "Z'⨾⋎s"	=> zdest_2_2(comp_list, args, 47480, Z⨾⋎s)
| "Z'Rename⋎s"	=> zdest_rename(comp_list, args, 47461, ZRename⋎s)
(*	
=TEX
\subsubsection{Local and Global Variables}
=SML
*)
| _ => (
	case (comp_list, args)
	of (nil, nil) => (
		(	case unbind_gvar_name name
			of n => BdzOk(ZGVar(n, ty,[]))
		) handle Fail _ => BdzNotZ 47100
		)
	| (nil, [tm]) => (
		(	case unbind_gvar_name name
			of n => dest_val_tuple(n, ty, ZGVar, tm, 47100)
		) handle Fail _ => BdzNotZ 47100
		)
	| _ => BdzFail{BdzFCode=47100, BdzFCompc=0, BdzFArgc=1}
)
(*
=TEX

\subsubsection{End of the Basic Destructor Function}
\label{EndOfFunctionBDZ}

=SML
*)
				end (* of let in case (x, Nil) *)
			)
		end (* of let in case Const *)
	) (* end of case Const (name, ty) => ... *)
	(* end of case dest_simple_term hdterm ... *)
	handle (Fail _) => BdzNotZ 47100
end
) (* end of function basic_dest_z_term *);
=TEX

\subsection{The General Z Destructor Function}

Function $dest\_z\_term$ provides the normal interface for
destroying arbitrary Z~terms.

=SML
fun	⦏dest_z_term⦎ (t:TERM) :Z_TERM = (
let
	val bdz_ans = basic_dest_z_term (strip_app t);
(*	fun sh(s, v) = diag_string("dest_z_term: ans is " ^ s ^ " " ^ (string_of_int v)); *)
in
	case bdz_ans
	of BdzOk zt => zt
	| BdzNotZ e => term_fail "dest_z_term" e [t]
	| BdzFail{BdzFCode=e, ...} => term_fail "dest_z_term" e [t]
end
);
=TEX

\subsection{The General Z Discriminator Function}
=SML
fun	⦏is_z_term⦎ (t:TERM) :bool =
	let	val x = dest_z_term t
	in
		true
	end
	handle Fail _ => false;
=TEX
\section{Constructor, Destructor and Discriminator Functions}

\subsection{Declaration Destructors}
=SML
fun	⦏dest_z_dec⦎ (t:TERM) :(TERM list * TERM) =
	(case dest_z_term t of
		ZDec(tml,tm) => (tml,tm)
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_dec" 47061 [t];

fun	⦏dest_z_schema_dec⦎ (t:TERM) :TERM * string =
	(case dest_z_term t of
		ZSchemaDec(tm,s) => (tm,s)
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_schema_dec" 47071 [t];

fun	⦏dest_z_decl⦎ (t:TERM) :TERM list =
	(case dest_z_term t of
		ZDecl tml => tml
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_decl" 47912 [t];
=TEX
The following function, which produces a type map from a declaration, will frequently be required below.
=SML
local
fun	f ([] :TERM list) :(string * TYPE)list = []
|	f (h::t) = (
		map dest_var (fst(dest_z_dec h))
		handle Fail _ =>
		let val (sch,d) = dest_z_schema_dec h
		in
			map 	(fn(s,ty)=>(pack_ident(s,d),ty))
				(dest_z_schema_type(dest_z_power_type(type_of sch)))
		end) @ (f t);
in
fun	⦏dest_decl⦎ (t:TERM) :(string * TYPE)list =
		f (dest_z_decl t)
	handle Fail _ => term_fail "dest_decl" 47912 [t]
end;
=TEX
\subsection{Declaration Discriminators}
=SML
fun	⦏is_z_dec⦎ (t:TERM) :bool =
	(case dest_z_term t of
		ZDec(tml,tm) => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_schema_dec⦎ (t:TERM) :bool =
	(case dest_z_term t of
		ZSchemaDec(tm,s) => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_decl⦎ (t:TERM) :bool =
	(case dest_z_term t of
		ZDecl tml => true
	|	_ => false)
	handle Fail _ => false;
=TEX
\subsection{Predicate Destructors}
=SML
fun	⦏dest_z_eq⦎ (t:TERM) :TERM * TERM =
	(case dest_z_term t of
		ZEq tm1_tm2 => tm1_tm2
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_eq" 47220 [t];

fun	⦏dest_z_∈⦎ (t:TERM) :TERM * TERM =
	(case dest_z_term t of
		Z∈ tm1_tm2 => tm1_tm2
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_∈" 47230 [t];

fun	⦏dest_z_¬⦎ (t:TERM) :TERM =
	(case dest_z_term t of
		Z¬(tm1) => (tm1)
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_¬" 47240 [t];

fun	⦏dest_z_∧⦎ (t:TERM) :TERM * TERM =
	(case dest_z_term t of
		Z∧ tm1_tm2 => tm1_tm2
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_∧" 47250 [t];

fun	⦏dest_z_∨⦎ (t:TERM) :TERM * TERM =
	(case dest_z_term t of
		Z∨ tm1_tm2 => tm1_tm2
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_∨" 47260 [t];

fun	⦏dest_z_⇒⦎ (t:TERM) :TERM * TERM =
	(case dest_z_term t of
		Z⇒ tm1_tm2 => tm1_tm2
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_⇒" 47270 [t];

fun	⦏dest_z_⇔⦎ (t:TERM) :TERM * TERM =
	(case dest_z_term t of
		Z⇔ tm1_tm2 => tm1_tm2
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_⇔" 47280 [t];

fun	⦏dest_z_∃⦎ (t:TERM) :TERM * TERM * TERM =
	(case dest_z_term t of
		Z∃(d,p,v) => (d,p,v)
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_∃" 47290 [t];

fun	⦏dest_z_∃⋎1⦎ (t:TERM) :TERM * TERM * TERM =
	(case dest_z_term t of
		Z∃⋎1(d,p,v) => (d,p,v)
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_∃⋎1" 47300 [t];

fun	⦏dest_z_∀⦎ (t:TERM) :TERM * TERM * TERM =
	(case dest_z_term t of
		Z∀(d,p,v) => (d,p,v)
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_∀" 47310 [t];

fun	⦏dest_z_schema_pred⦎ (t:TERM) :TERM * string =
	(case dest_z_term t of
		ZSchemaPred(tm1,s) => (tm1,s)
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_schema_pred" 47320 [t];
=TEX
\subsection{Predicate Discriminators}
=SML
fun	⦏is_z_eq⦎ (t:TERM) :bool =
	(case dest_z_term t of
		ZEq _ => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_∈⦎ (t:TERM) :bool =
	(case dest_z_term t of
		Z∈ _ => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_true⦎ (t:TERM) :bool =
	(case dest_z_term t of
		ZTrue => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_false⦎ (t:TERM) :bool =
	(case dest_z_term t of
		ZFalse => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_¬⦎ (t:TERM) :bool =
	(case dest_z_term t of
		Z¬ _ => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_∧⦎ (t:TERM) :bool =
	(case dest_z_term t of
		Z∧ _ => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_∨⦎ (t:TERM) :bool =
	(case dest_z_term t of
		Z∨ _ => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_⇒⦎ (t:TERM) :bool =
	(case dest_z_term t of
		Z⇒ _ => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_⇔⦎ (t:TERM) :bool =
	(case dest_z_term t of
		Z⇔ _ => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_∃⦎ (t:TERM) :bool =
	(case dest_z_term t of
		Z∃ _ => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_∃⋎1⦎ (t:TERM) :bool =
	(case dest_z_term t of
		Z∃⋎1 _ => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_∀⦎ (t:TERM) :bool =
	(case dest_z_term t of
		Z∀ _ => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_schema_pred⦎ (t:TERM) :bool =
	(case dest_z_term t of
		ZSchemaPred _ => true
	|	_ => false)
	handle Fail _ => false;
=TEX
\subsection{Term Destructors}
=SML
fun	⦏dest_z_lvar⦎ (t:TERM) :string * TYPE * TERM list =
	(case dest_z_term t of
		ZLVar s_ty_tml => s_ty_tml
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_lvar" 47090 [t];

fun	⦏dest_z_gvar⦎ (t:TERM) :string * TYPE * TERM list =
	(case dest_z_term t of
		ZGVar s_ty_tml => s_ty_tml
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_gvar" 47100 [t];

fun	⦏dest_z_int⦎ (t:TERM) :string =
	(case dest_z_term t of
		ZInt(s) => (s)
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_int" 47105 [t];

fun	⦏dest_z_string⦎ (t:TERM) :string =
	(case dest_z_term t of
		ZString(s) => (s)
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_string" 47106 [t];

fun	⦏dest_z_float⦎ (t:TERM) : TERM * TERM * TERM =
	(case dest_z_term t of
		ZFloat(xpe) => (xpe)
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_float" 47107 [t];

fun	⦏dest_z_⟨⟩⦎ (t:TERM) :TYPE * TERM list =
	(case dest_z_term t of
		Z⟨⟩ ty_tml =>  ty_tml
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_⟨⟩" 47110 [t];

fun	⦏dest_z_setd⦎ (t:TERM) :TYPE * TERM list =
	(case dest_z_term t of
		ZSetd ty_tml =>  ty_tml
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_setd" 47120 [t];

fun	⦏dest_z_seta⦎ (t:TERM) :TERM * TERM * TERM =
	(case dest_z_term t of
		ZSeta d_p_v =>  d_p_v
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_seta" 47130 [t];

fun	⦏dest_z_ℙ⦎ (t:TERM) :TERM =
	(case dest_z_term t of
		Zℙ(tm) => (tm)
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_ℙ" 47140 [t];

fun	⦏dest_z_tuple⦎ (t:TERM) :TERM list =
	(case dest_z_term t of
		ZTuple(tml) => (tml)
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_tuple" 47150 [t];

fun	⦏dest_z_binding⦎ (t:TERM) :(string * TERM) list =
	(case dest_z_term t of
		ZBinding stl => stl
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_binding" 47151 [t];

fun	⦏dest_z_×⦎ (t:TERM) :TERM list =
	(case dest_z_term t of
		Z×(tml) => (tml)
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_×" 47160 [t];

fun	⦏dest_z_θ⦎ (t:TERM) :TERM * string =
	(case dest_z_term t of
		Zθ tm_s =>  tm_s
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_θ" 47170 [t];

fun	⦏dest_z_sel⋎s⦎ (t:TERM) :TERM * string =
	(case dest_z_term t of
		ZSel⋎s tm_s =>  tm_s
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_sel⋎s" 47180 [t];

fun	⦏dest_z_sel⋎t⦎ (t:TERM) :TERM * int =
	(case dest_z_term t of
		ZSel⋎t tm_i =>  tm_i
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_sel⋎t" 47185 [t];

fun	⦏dest_z_app⦎ (t:TERM) :TERM * TERM =
	(case dest_z_term t of
		ZApp f_a =>  f_a
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_app" 47190 [t];

fun	⦏dest_z_λ⦎ (t:TERM) :TERM * TERM * TERM =
	(case dest_z_term t of
		Zλ d_p_v =>  d_p_v
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_λ" 47200 [t];

fun	⦏dest_z_μ⦎ (t:TERM) :TERM * TERM * TERM =
	(case dest_z_term t of
		Zμ d_p_v =>  d_p_v
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_μ" 47210 [t];

fun	⦏dest_z_let⦎ (t:TERM) : (string * TERM) list * TERM =
	(case dest_z_term t of
		ZLet iddefs_tm =>  iddefs_tm
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_let" 47211 [t];
=TEX
\subsection{Term Discriminators}
=SML
fun	⦏is_z_lvar⦎ (t:TERM) :bool =
	(case dest_z_term t of
		ZLVar _ => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_gvar⦎ (t:TERM) :bool =
	(case dest_z_term t of
		ZGVar _ => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_int⦎ (t:TERM) :bool =
	(case dest_z_term t of
		ZInt _ => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_string⦎ (t:TERM) :bool =
	(case dest_z_term t of
		ZString _ => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_float⦎ (t:TERM) :bool =
	(case dest_z_term t of
		ZFloat _ => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_⟨⟩⦎ (t:TERM) :bool =
	(case dest_z_term t of
		Z⟨⟩ _ => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_setd⦎ (t:TERM) :bool =
	(case dest_z_term t of
		ZSetd _ => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_seta⦎ (t:TERM) :bool =
	(case dest_z_term t of
		ZSeta _ => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_ℙ⦎ (t:TERM) :bool =
	(case dest_z_term t of
		Zℙ _ => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_tuple⦎ (t:TERM) :bool =
	(case dest_z_term t of
		ZTuple _ => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_binding⦎ (t:TERM) :bool =
	(case dest_z_term t of
		ZBinding _ => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_×⦎ (t:TERM) :bool =
	(case dest_z_term t of
		Z× _ => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_θ⦎ (t:TERM) :bool =
	(case dest_z_term t of
		Zθ _ => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_sel⋎s⦎ (t:TERM) :bool =
	(case dest_z_term t of
		ZSel⋎s _ => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_sel⋎t⦎ (t:TERM) :bool =
	(case dest_z_term t of
		ZSel⋎t _ => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_app⦎ (t:TERM) :bool =
	(case dest_z_term t of
		ZApp _ => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_λ⦎ (t:TERM) :bool =
	(case dest_z_term t of
		Zλ _ => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_μ⦎ (t:TERM) :bool =
	(case dest_z_term t of
		Zμ _ => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_let⦎ (t:TERM) :bool =
	(case dest_z_term t of
		ZLet _ => true
	|	_ => false)
	handle Fail _ => false;
=TEX
\subsection{Destructors for the Schema Calculus}
=SML
fun	⦏dest_z_h_schema⦎ (t:TERM) :TERM * TERM =
	(case dest_z_term t of
		ZHSchema d_p => d_p
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_h_schema" 47940 [t];

fun	⦏dest_z_decor⋎s⦎ (t:TERM) :TERM * string =
	(case dest_z_term t of
		ZDecor⋎s tm_s =>  tm_s
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_decor⋎s" 47340 [t];

fun	⦏dest_z_pre⋎s⦎ (t:TERM) :TERM =
	(case dest_z_term t of
		ZPre⋎s(tm) => (tm)
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_pre⋎s" 47350 [t];

fun	⦏dest_z_¬⋎s⦎ (t:TERM) :TERM =
	(case dest_z_term t of
		Z¬⋎s(tm) => (tm)
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_¬⋎s" 47360 [t];

fun	⦏dest_z_∧⋎s⦎ (t:TERM) :TERM * TERM =
	(case dest_z_term t of
		Z∧⋎s tm1_tm2 =>  tm1_tm2
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_∧⋎s" 47370 [t];

fun	⦏dest_z_∨⋎s⦎ (t:TERM) :TERM * TERM =
	(case dest_z_term t of
		Z∨⋎s tm1_tm2 =>  tm1_tm2
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_∨⋎s" 47380 [t];

fun	⦏dest_z_⇒⋎s⦎ (t:TERM) :TERM * TERM =
	(case dest_z_term t of
		Z⇒⋎s tm1_tm2 =>  tm1_tm2
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_⇒⋎s" 47390 [t];

fun	⦏dest_z_⇔⋎s⦎ (t:TERM) :TERM * TERM =
	(case dest_z_term t of
		Z⇔⋎s tm1_tm2 =>  tm1_tm2
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_⇔⋎s" 47400 [t];

fun	⦏dest_z_↾⋎s⦎ (t:TERM) :TERM * TERM =
	(case dest_z_term t of
		Z↾⋎s tm1_tm2 =>  tm1_tm2
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_↾⋎s" 47410 [t];

fun	⦏dest_z_hide⋎s⦎ (t:TERM) :TERM * string list =
	(case dest_z_term t of
		ZHide⋎s tm_sl =>  tm_sl
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_hide⋎s" 47420 [t];

fun	⦏dest_z_∃⋎s⦎ (t:TERM) :TERM * TERM * TERM =
	(case dest_z_term t of
		Z∃⋎s d_p_v =>  d_p_v
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_∃⋎s" 47430 [t];

fun	⦏dest_z_∃⋎1⋎s⦎ (t:TERM) :TERM * TERM * TERM =
	(case dest_z_term t of
		Z∃⋎1⋎s d_p_v =>  d_p_v
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_∃⋎1⋎s" 47440 [t];

fun	⦏dest_z_∀⋎s⦎ (t:TERM) :TERM * TERM * TERM =
	(case dest_z_term t of
		Z∀⋎s d_p_v =>  d_p_v
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_∀⋎s" 47450 [t];

fun	⦏dest_z_Δ⋎s⦎ (t:TERM) :TERM =
	(case dest_z_term t of
		ZΔ⋎s(tm) => (tm)
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_Δ⋎s" 47460 [t];

fun	⦏dest_z_Ξ⋎s⦎ (t:TERM) :TERM =
	(case dest_z_term t of
		ZΞ⋎s(tm) => (tm)
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_Ξ⋎s" 47470 [t];

fun	⦏dest_z_⨾⋎s⦎ (t:TERM) :TERM * TERM =
	(case dest_z_term t of
		Z⨾⋎s tm1_tm2 =>  tm1_tm2
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_⨾⋎s" 47480 [t];
fun	⦏dest_z_rename⋎s⦎ (t:TERM) :TERM * (string * string)list =
	(case dest_z_term t of
		ZRename⋎s(args) => (args)
	|	_ => fail "" 0 [])
	handle Fail _ => term_fail "dest_z_rename⋎s" 47461 [t];

=TEX
\subsection{Discriminators for the Schema Calculus}
=SML
fun	⦏is_z_h_schema⦎ (t:TERM) :bool =
	(case dest_z_term t of
		ZHSchema _ => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_decor⋎s⦎ (t:TERM) :bool =
	(case dest_z_term t of
		ZDecor⋎s _ => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_pre⋎s⦎ (t:TERM) :bool =
	(case dest_z_term t of
		ZPre⋎s _ => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_¬⋎s⦎ (t:TERM) :bool =
	(case dest_z_term t of
		Z¬⋎s _ => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_∧⋎s⦎ (t:TERM) :bool =
	(case dest_z_term t of
		Z∧⋎s _ => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_∨⋎s⦎ (t:TERM) :bool =
	(case dest_z_term t of
		Z∨⋎s _ => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_⇒⋎s⦎ (t:TERM) :bool =
	(case dest_z_term t of
		Z⇒⋎s _ => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_⇔⋎s⦎ (t:TERM) :bool =
	(case dest_z_term t of
		Z⇔⋎s _ => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_↾⋎s⦎ (t:TERM) :bool =
	(case dest_z_term t of
		Z↾⋎s _ => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_hide⋎s⦎ (t:TERM) :bool =
	(case dest_z_term t of
		ZHide⋎s _ => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_∃⋎s⦎ (t:TERM) :bool =
	(case dest_z_term t of
		Z∃⋎s _ => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_∃⋎1⋎s⦎ (t:TERM) :bool =
	(case dest_z_term t of
		Z∃⋎1⋎s _ => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_∀⋎s⦎ (t:TERM) :bool =
	(case dest_z_term t of
		Z∀⋎s _ => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_Δ⋎s⦎ (t:TERM) :bool =
	(case dest_z_term t of
		ZΔ⋎s _ => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_Ξ⋎s⦎ (t:TERM) :bool =
	(case dest_z_term t of
		ZΞ⋎s _ => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_⨾⋎s⦎ (t:TERM) :bool =
	(case dest_z_term t of
		Z⨾⋎s _ => true
	|	_ => false)
	handle Fail _ => false;

fun	⦏is_z_rename⋎s⦎ (t:TERM) :bool =
	(case dest_z_term t of
		ZRename⋎s _ => true
	|	_ => false)
	handle Fail _ => false;
=TEX
\subsection{Declaration Constructors}
=SML
fun 	⦏mk_z_dec⦎ ((varl,set):TERM list * TERM) :TERM =
	let	val sty = type_of set;
		val ety = dest_z_power_type sty;
		val vl = mk_list varl
			handle X => reraise X "mk_z_dec";
		val decty = mk_→_type(mk_×_type(type_of vl,sty),⌜:BOOL⌝);
		val dec = mk_const("Z'Dec",decty);
	in
		mk_app(dec,mk_pair(vl,set))
	end
	handle X => (divert X "mk_z_dec"
			"dest_z_power_type" 47060 [fn() => string_of_term set]

	);
=TEX
=SML
fun	⦏mk_z_schema_dec⦎ ((sch,d):TERM * string) :TERM =
	let	val bind = mk_binding(sch,d);
		val bty = type_of bind;
		val sty = type_of sch;
		val cty = list_mk_→_type[bty,sty,BOOL];
		val con = mk_const("Z'SchemaDec",cty);
	in
		list_mk_app(con,[bind,sch])
	end;
=TEX
=SML
fun	⦏mk_z_decl⦎ (tml:TERM list) :TERM =
	let	val lis =
			case tml of
				_::_	=> mk_list tml
			|	[]	=> mk_empty_list BOOL;
		val decl = mk_const("Z'Decl",mk_→_type(type_of lis,BOOL));
	in
		mk_app(decl,lis)
	end
	handle X => pass_on X "mk_list" "mk_z_decl";
=TEX
\subsection{Predicate Constructors}
=SML
val	⦏mk_z_eq⦎ :(TERM * TERM) -> TERM = mk_eq
	handle X => pass_on X "mk_eq" "mk_z_eq";
=TEX
=SML
fun	⦏mk_z_∈⦎ ((tm1,tm2):TERM * TERM) :TERM =
	let	val ty = list_mk_→_type[type_of tm1, mk_z_power_type (type_of tm1),BOOL];
	in
		list_mk_app(mk_const("∈",ty),[tm1,tm2])
	end
	handle X => pass_on X "mk_app" "mk_z_∈";
=TEX
True and False and the logical connectives in Z map directly into the corresponding HOL constants.
=SML
val	⦏mk_z_true⦎ :TERM = mk_t;

val	⦏mk_z_false⦎ :TERM = mk_f;

val	⦏mk_z_¬⦎ :TERM -> TERM = mk_¬
	handle X => pass_on X "mk_¬" "mk_z_¬";

val	⦏mk_z_∧⦎ :(TERM * TERM) -> TERM = mk_∧
	handle X => pass_on X "mk_∧" "mk_z_∧";

val	⦏mk_z_∨⦎ :(TERM * TERM) -> TERM = mk_∨
	handle X => pass_on X "mk_∨" "mk_z_∨";

val	⦏mk_z_⇒⦎ :(TERM * TERM) -> TERM = mk_⇒
	handle X => pass_on X "mk_⇒" "mk_z_⇒";

val	⦏mk_z_⇔⦎ :(TERM * TERM) -> TERM = mk_⇔
	handle X => pass_on X "mk_⇔" "mk_z_⇔";

fun	⦏mk_z_∃⦎ ((d,p,v):TERM * TERM * TERM) :TERM =
	let	val itym = dest_decl d
	in
		g2_∃ (d,p,v,itym)
	end
	handle X => reraise X "mk_z_∃";

fun	⦏mk_z_∃⋎1⦎ ((d,p,v):TERM * TERM * TERM) :TERM =
	let	val itym = dest_decl d
	in
		mk_app(∃⋎1_bterm itym,g2_abs(d,p,v,itym))
	end
	handle X => reraise X "mk_z_∃⋎1";

fun	⦏mk_z_∀⦎ ((d,p,v):TERM * TERM * TERM) :TERM =
	let	val itym = dest_decl d
	in
		g2_∀ (d,p,v,itym)
	end
	handle X => reraise X "mk_z_∀";

=TEX
\subsection{Term Constructors}
=SML
local
	val zgt_ℤ = mk_z_given_type "ℤ";
in
fun	⦏mk_z_⟨⟩⦎ ((ty,tml):TYPE * TERM list) :TERM =
	let	val listy = mk_ctype("LIST",[ty]);
		val seqty = mk_z_power_type(mk_z_tuple_type[zgt_ℤ,ty]);
		val zseqty = mk_→_type(listy,seqty);
		val zseq = mk_const("Z'⟨⟩",zseqty);
	in
		case tml of
			[] => mk_app(zseq,mk_empty_list ty)
		|	_ => mk_app(zseq,mk_list tml)
	end;
end;
fun	⦏mk_z_setd⦎ ((ty,tml):TYPE * TERM list) :TERM =
	let	val listy = mk_ctype("LIST",[ty]);
		val setty = mk_z_power_type ty;
		val zsetty = mk_→_type(listy,setty);
		val zset = mk_const("Z'Setd",zsetty);
	in
		case tml of
			[] => mk_app(zset,mk_empty_list ty)
		|	_ => mk_app(zset,mk_list tml)
	end;

fun	⦏mk_z_seta⦎ ((d,p,v):TERM * TERM * TERM) :TERM =
	let	val itym = dest_decl d;
		val vty = type_of v;
	in
		mk_app (seta_bterm itym vty, g2_abs(d,p,v,itym))
	end;
=TEX
$mk\_z\_ℙ$ only makes sense if its argument is a set, but we do not bother to check that here, since the type checker should catch this kind of thing and the definition of the constant $Zℙ$ will prevent us from doing any damage.
=SML
fun	⦏mk_z_ℙ⦎ (tm:TERM) :TERM =
	let	val ty = type_of tm;
		val psetty = mk_z_power_type ty;
		val zpsetty = mk_→_type(ty,psetty);
		val zpset = mk_const("Z'ℙ",zpsetty);
	in
		mk_app(zpset,tm)
	end;

fun	⦏mk_z_tuple⦎ (tml:TERM list) :TERM =
	let	val tyl = map type_of tml;
	in
		list_mk_app(tuple_cterm tyl,tml)
	end;

fun	⦏mk_z_binding⦎ (stl:(string * TERM) list) :TERM = (
	let	val (nl, tl) = split stl;
		val side =  moccurs "mk_z_binding" 47152 nl;
		val sortnl = idsetseq nl;
	in
		list_mk_app (
			bind_cterm (combine nl (map type_of tl)),
			map (lassoc3 stl) sortnl
		)
	end
);

fun	⦏mk_z_×⦎ (tml:TERM list) :TERM =
	let	val tyl = map (dest_z_power_type o type_of) tml;
	in
		list_mk_app(prod_cterm tyl,tml)
	end;

fun	⦏mk_z_sel⋎s⦎ ((tm,s):TERM * string) :TERM =
	let	val tym = dest_z_schema_type(type_of tm);
	in
		mk_app(bind_pterm tym s,tm)
	end;

fun	⦏mk_z_sel⋎t⦎ ((tm,i):TERM * int) :TERM =
	let	val tyl = dest_z_tuple_type(type_of tm);
	in
		mk_app(tuple_pterm tyl i, tm)
	end;

fun	⦏mk_z_app⦎ ((tm1,tm2):TERM * TERM) :TERM =
	let	val fty = type_of tm1;
		val aty = type_of tm2;
		val rty =
			case dest_z_tuple_type(dest_z_power_type fty) of
				[x,r] =>
					if x =: aty
					then r
					else term_fail "mk_z_app" 47192 [tm1, tm2]
			|	_ => term_fail "mk_z_app" 47191 [tm1];
		val zappty = list_mk_→_type[fty,aty,rty];
		val zapp = mk_const("Z'App",zappty);
	in
		list_mk_app (zapp, [tm1, tm2])
	end;
=TEX
=SML
local
fun	f ([]:Z_TERM list) :TERM list = []
|	f (ZDec(tml,_)::z_tml) = tml @ (f z_tml)
|	f (ZSchemaDec(sch,d)::z_tml) = (mk_z_θ(sch,d)) :: (f z_tml)
|	f _ = term_fail "mk_z_λ" 0 [];

fun	chartuple ((ZDecl tml):Z_TERM) :TERM = (
		case (f (map dest_z_term tml)) of
			[] => mk_z_binding []
		|	[tm] => tm
		|	tml' => mk_z_tuple tml'
		)
|	chartuple _ = fail "mk_z_λ" 0 [];
in
fun	⦏mk_z_λ⦎ ((d,p,v):TERM * TERM * TERM) :TERM =
	let	val t = chartuple(dest_z_term d);
		val tym = dest_decl d;
		val tty = type_of t;
		val vty = type_of v;
	in
		mk_app(λ_bterm tym tty vty,g3_abs(t,d,p,v,tym))
	end
	handle	Fail _ => term_fail "mk_z_λ" 47201 [d,p,v]
end;
=TEX
=SML
fun	⦏mk_z_μ⦎ ((d,p,v):TERM * TERM * TERM) :TERM =
	let	val tym = dest_decl d;
		val vty = type_of v;
	in
		mk_app(μ_bterm tym vty,g2_abs(d,p,v,tym))
	end;
=TEX
=SML
fun	⦏mk_z_let⦎
	(vardefs : (string * TERM) list, tm : TERM) :TERM = (
	let	fun aux (v, d)  = (
			let	val ty = type_of d;
			in	mk_z_dec([mk_var(v, ty)], mk_z_setd(ty, [d]))
			end
		);
		val mu = mk_z_μ(mk_z_decl(map aux vardefs), mk_z_true, tm);
		val muty = type_of mu;
		val cty = mk_→_type(muty, muty);
		val con = mk_const("Z'Let", cty);
	in	mk_app(con, mu)
	end
);
=TEX
=SML

fun	⦏mk_z_lvar⦎ ((s,ty,tml):string * TYPE * TERM list) :TERM =
		case tml of [] 	=> mk_var(s,ty)
		| _		=>
			let	val cty = mk_→_type(mk_z_tuple_type(map type_of tml),ty);
			in
				mk_app(mk_var(s,cty),mk_z_tuple tml)
			end;

fun	⦏mk_z_gvar⦎ ((s,ty,tml):string * TYPE * TERM list) :TERM =
		case tml of [] 	=> bind_gvar_term (s,ty)
		| _		=>
			let	val cty = mk_→_type(mk_z_tuple_type(map type_of tml),ty);
			in
				mk_app(bind_gvar_term (s,cty),mk_z_tuple tml)
			end;
local
	val nty = mk_ctype("ℕ",[]);
	val zty = mk_ctype("ℤ",[]);
	val zint = mk_const("Z'Int",mk_→_type(nty,zty));
in
fun	⦏mk_z_int⦎ (s:string) :TERM =
	let	val i = natural_of_string s
			handle complaint =>
			pass_on complaint "nat_of_string" "mk_z_int" ;
	in
		mk_app(zint,mk_ℕ i)
	end;
end;
local
	val aty = mk_ctype("LIST",[mk_ctype ("CHAR", [])]);
	val rty = mk_z_power_type (mk_z_tuple_type[
		mk_ctype("ℤ",[]),mk_ctype("CHAR",[])]);
	val zs = mk_const("Z'String",mk_→_type(aty,rty));
in
fun	⦏mk_z_string⦎ (s:string) :TERM = mk_app(zs,mk_string s);
end;

local
	val aty = mk_ctype("ℤ",[]);
	val rty = mk_ctype("ℝ",[]);
	val zfty = list_mk_→_type[aty, aty, aty, rty];
	val zf = mk_const("Z'Float", zfty);
	fun check tm = (
		if	type_of tm =: aty
		then	tm
		else	term_fail "mk_z_float" 47108 [tm]
	);
in
fun	⦏mk_z_float⦎ ((x, p, e):TERM*TERM*TERM) :TERM =
		 list_mk_app(zf, map check [x, p, e]);
end;
=TEX
\subsection{Constructors for the Schema Calculus}
=SML
fun	⦏mk_z_h_schema⦎ ((d,p):TERM * TERM) :TERM =
	let	val itym = dest_decl d;
	in
		mk_app (schema_bterm itym, g1_abs(d,p,itym))
	end;

fun	⦏mk_z_decor⋎s⦎ ((tm,d):TERM * string) :TERM =
	let	val tym = dest_z_schema_type(dest_z_power_type(type_of tm));
	in
		mk_app(bind_decor_term tym d,tm)
	end;

fun	⦏mk_z_pre⋎s⦎ (tm:TERM) :TERM =
	let	val tym = dest_z_schema_type(dest_z_power_type(type_of tm));
	in
		mk_app(bind_pre_term tym,tm)
	end;

fun	⦏mk_z_¬⋎s⦎ (tm:TERM) :TERM =
	let	val tym = dest_z_schema_type(dest_z_power_type(type_of tm));
	in
		mk_app(bind_¬_term tym,tm)
	end;

fun	⦏mk_z_∧⋎s⦎ ((tm1,tm2):TERM * TERM) :TERM =
	let	val tym1 = dest_z_schema_type(dest_z_power_type(type_of tm1));
		val tym2 = dest_z_schema_type(dest_z_power_type(type_of tm2));
	in
		list_mk_app(bind_∧_term tym1 tym2,[tm1,tm2])
	end;

fun	⦏mk_z_∨⋎s⦎ ((tm1,tm2):TERM * TERM) :TERM =
	let	val tym1 = dest_z_schema_type(dest_z_power_type(type_of tm1));
		val tym2 = dest_z_schema_type(dest_z_power_type(type_of tm2));
	in
		list_mk_app(bind_∨_term tym1 tym2,[tm1,tm2])
	end;

fun	⦏mk_z_⇒⋎s⦎ ((tm1,tm2):TERM * TERM) :TERM =
	let	val tym1 = dest_z_schema_type(dest_z_power_type(type_of tm1));
		val tym2 = dest_z_schema_type(dest_z_power_type(type_of tm2));
	in
		list_mk_app(bind_⇒_term tym1 tym2,[tm1,tm2])
	end;

fun	⦏mk_z_⇔⋎s⦎ ((tm1,tm2):TERM * TERM) :TERM =
	let	val tym1 = dest_z_schema_type(dest_z_power_type(type_of tm1));
		val tym2 = dest_z_schema_type(dest_z_power_type(type_of tm2));
	in
		list_mk_app(bind_⇔_term tym1 tym2,[tm1,tm2])
	end;

fun	⦏mk_z_↾⋎s⦎ ((tm1,tm2):TERM * TERM) :TERM =
	let	val tym1 = dest_z_schema_type(dest_z_power_type(type_of tm1));
		val tym2 = dest_z_schema_type(dest_z_power_type(type_of tm2));
	in
		list_mk_app(bind_↾_term tym1 tym2,[tm1,tm2])
	end;

fun	⦏mk_z_hide⋎s⦎ ((tm,sl):TERM * string list) :TERM =
	let	val tym = dest_z_schema_type(dest_z_power_type(type_of tm));
	in
		mk_app(bind_hide_term tym sl,tm)
	end;

fun	⦏mk_z_∃⋎s⦎ ((d,p,v):TERM * TERM * TERM) :TERM =
	let	val dtym = dest_decl d;
		val vtym = dest_z_schema_type(dest_z_power_type(type_of v));
	in
		list_mk_app(∃⋎s_bterm dtym vtym,[g1_abs(d,p,dtym),v])
	end;

fun	⦏mk_z_∃⋎1⋎s⦎ ((d,p,v):TERM * TERM * TERM) :TERM =
	let	val dtym = dest_decl d;
		val vtym = dest_z_schema_type(dest_z_power_type(type_of v));
	in
		list_mk_app(∃⋎1⋎s_bterm dtym vtym,[g1_abs(d,p,dtym),v])
	end;

fun	⦏mk_z_∀⋎s⦎ ((d,p,v):TERM * TERM * TERM) :TERM =
	let	val dtym = dest_decl d;
		val vtym = dest_z_schema_type(dest_z_power_type(type_of v));
	in
		list_mk_app(∀⋎s_bterm dtym vtym,[g1_abs(d,p,dtym),v])
	end;

fun	⦏mk_z_Δ⋎s⦎ (tm:TERM) :TERM =
	let	val tym = dest_z_schema_type(dest_z_power_type(type_of tm));
	in
		mk_app(bind_Δ_term tym,tm)
	end;

fun	⦏mk_z_Ξ⋎s⦎ (tm:TERM) :TERM =
	let	val tym = dest_z_schema_type(dest_z_power_type(type_of tm));
	in
		mk_app(bind_Ξ_term tym,tm)
	end;

fun	⦏mk_z_⨾⋎s⦎ ((tm1,tm2):TERM * TERM) :TERM =
	let	val tym1 = dest_z_schema_type(dest_z_power_type(type_of tm1));
		val tym2 = dest_z_schema_type(dest_z_power_type(type_of tm2));
	in
		list_mk_app(bind_⨾_term tym1 tym2,[tm1,tm2])
	end;

fun	⦏mk_z_rename⋎s⦎ (tm:TERM, ididl : (string * string) list) :TERM = (
	let	val tym = dest_z_schema_type(dest_z_power_type(type_of tm));
		val (xs,ys) = split ididl;
		val dummy = (moccurs "mk_z_rename⋎s" 47463 xs;
				moccurs "mk_z_rename⋎s" 47462 ys);
	in
		mk_app(bind_rename_term tym ididl, tm)
	end);
=TEX
Can renaming collapse two distinct components onto one,
by renaming one component to be the same as another?
=TEX
\subsection{𝕌}
We create the $𝕌$-terms by instantiation rather than with the constructor
functions (which is intended to optimise for space rather than speed).
=SML
local
	val ZT1 = mk_ctype("Z'T[1]",[ⓣ'a SET⌝]);
	val u = ⌜ⓜmk_const("z'𝕌", mk_→_type(ZT1,ⓣ'a SET⌝))⌝
  (ⓜmk_const("Z'Mk_T[1]", mk_→_type(ⓣ'a SET⌝,ZT1))⌝
      ⓜmk_const("Totality", ⓣ'a SET⌝)⌝)⌝;
	val ty = type_of u;
in	fun ⦏mk_u⦎ (tyi : TYPE) : TERM = (
		let	val tym = (type_match tyi ty)
			handle Fail _ => type_fail "mk_u" 47951 [tyi];
		in	inst [] tym u
		end
	);
	fun ⦏dest_u⦎ (tm : TERM) : TYPE = (
		(term_match tm u; type_of tm)
		handle Fail _ => term_fail "dest_u" 47950 [tm]
	);
	fun ⦏is_u⦎ (tm : TERM) : bool = (
		(term_match tm u; true)
		handle Fail _ => false
	);
end;
=TEX
\subsection{Binding of Global Variables}
=SML
fun ⦏gvar_subst⦎ (tm : TERM) : (TERM * TERM) list = (
	let	fun do_gvar v tyi n ty = (
			case dest_simple_type ty of
				Ctype("→", [aty, rty]) => (
				let	val tym = type_match tyi rty
					val aty' = inst_type tym aty;
					val us = map mk_u (dest_z_tuple_type aty');
				in	(mk_z_gvar(n, tyi, us), v)
				end
			) |	_ => (
				let	val chk = type_match tyi ty;
				in	(mk_z_gvar(n, tyi, []), v)
				end
			)
		);
		fun do_gvars [] = []
		|   do_gvars (v :: vs) = (
			(let	val (n, tyi) = dest_var v;
				val zn = bind_gvar_name n
			in case get_const_type zn of
				Nil => do_gvars vs
			|	Value ty => do_gvar v tyi n ty:: do_gvars vs
			end)
			handle Fail _ => do_gvars vs
		);
	in	do_gvars (frees tm)
	end
);
=TEX

\subsection{The General Constructor Function}
This function uses the constructors defined above to convert a $Z\_TERM$ to the corresponding $TERM$.
=SML
fun	⦏mk_z_term⦎	(ZDec(tml:TERM list,tm:TERM) :Z_TERM) :TERM = mk_z_dec(tml,tm)
|	mk_z_term	(ZSchemaDec(tm:TERM,s:string)) = mk_z_schema_dec(tm,s)
|	mk_z_term	(ZDecl(tml:TERM list)) = mk_z_decl tml
|	mk_z_term	(ZEq(tm1:TERM,tm2:TERM)) = mk_z_eq(tm1,tm2)
|	mk_z_term	(Z∈(tm1:TERM,tm2:TERM)) = mk_z_∈(tm1,tm2)
|	mk_z_term	(ZTrue) = mk_z_true
|	mk_z_term	(ZFalse) = mk_z_false
|	mk_z_term	(Z¬(tm:TERM)) = mk_z_¬ tm
|	mk_z_term	(Z∧(tm1:TERM,tm2:TERM)) = mk_z_∧(tm1,tm2)
|	mk_z_term	(Z∨(tm1:TERM,tm2:TERM)) = mk_z_∨(tm1,tm2)
|	mk_z_term	(Z⇒(tm1:TERM,tm2:TERM)) = mk_z_⇒(tm1,tm2)
|	mk_z_term	(Z⇔(tm1:TERM,tm2:TERM)) = mk_z_⇔(tm1,tm2)
|	mk_z_term	(Z∃(tm1:TERM,tm2:TERM,tm3:TERM)) = mk_z_∃(tm1,tm2,tm3)
|	mk_z_term	(Z∃⋎1(tm1:TERM,tm2:TERM,tm3:TERM)) = mk_z_∃⋎1(tm1,tm2,tm3)
|	mk_z_term	(Z∀(tm1:TERM,tm2:TERM,tm3:TERM)) = mk_z_∀(tm1,tm2,tm3)
|	mk_z_term	(ZSchemaPred(tm:TERM,s:string)) = mk_z_schema_pred(tm,s)
|	mk_z_term	(ZLVar(s:string,ty:TYPE,tml:TERM list)) = mk_z_lvar(s,ty,tml)
|	mk_z_term	(ZGVar(s:string,ty:TYPE,tml:TERM list)) = mk_z_gvar(s,ty,tml)
|	mk_z_term	(ZInt(s:string)) = mk_z_int(s)
|	mk_z_term	(ZString(s:string)) = mk_z_string(s)
|	mk_z_term	(ZFloat(xpe:TERM*TERM*TERM)) = mk_z_float(xpe)
|	mk_z_term	(Z⟨⟩(ty:TYPE,tml:TERM list)) = mk_z_⟨⟩(ty,tml)
|	mk_z_term	(ZSetd(ty:TYPE,tml:TERM list)) = mk_z_setd(ty,tml)
|	mk_z_term	(ZSeta(tm1:TERM,tm2:TERM,tm3:TERM)) = mk_z_seta(tm1,tm2,tm3)
|	mk_z_term	(Zℙ(tm:TERM)) = mk_z_ℙ tm
|	mk_z_term	(ZTuple(tml:TERM list)) = mk_z_tuple tml
|	mk_z_term	(ZBinding(stl:(string * TERM) list)) = mk_z_binding stl
|	mk_z_term	(Z×(tml:TERM list)) = mk_z_× tml
|	mk_z_term	(Zθ(tm:TERM,s:string)) = mk_z_θ(tm,s)
|	mk_z_term	(ZSel⋎s(tm:TERM,s:string)) = mk_z_sel⋎s(tm,s)
|	mk_z_term	(ZSel⋎t(tm:TERM,i:int)) = mk_z_sel⋎t(tm,i)
|	mk_z_term	(ZApp(tm1:TERM,tm2:TERM)) = mk_z_app(tm1,tm2)
|	mk_z_term	(Zλ(tm1:TERM,tm2:TERM,tm3:TERM)) = mk_z_λ(tm1,tm2,tm3)
|	mk_z_term	(Zμ(tm1:TERM,tm2:TERM,tm3:TERM)) = mk_z_μ(tm1,tm2,tm3)
|	mk_z_term	(ZLet(iddefs:(string*TERM)list,tm:TERM)) = mk_z_let(iddefs,tm)
|	mk_z_term	(ZHSchema(tm1:TERM,tm2:TERM)) = mk_z_h_schema(tm1,tm2)
|	mk_z_term	(ZDecor⋎s(tm:TERM,s:string)) = mk_z_decor⋎s(tm,s)
|	mk_z_term	(ZPre⋎s(tm:TERM)) = mk_z_pre⋎s tm
|	mk_z_term	(Z¬⋎s(tm:TERM)) = mk_z_¬⋎s tm
|	mk_z_term	(Z∧⋎s(tm1:TERM,tm2:TERM)) = mk_z_∧⋎s(tm1,tm2)
|	mk_z_term	(Z∨⋎s(tm1:TERM,tm2:TERM)) = mk_z_∨⋎s(tm1,tm2)
|	mk_z_term	(Z⇒⋎s(tm1:TERM,tm2:TERM)) = mk_z_⇒⋎s(tm1,tm2)
|	mk_z_term	(Z⇔⋎s(tm1:TERM,tm2:TERM)) = mk_z_⇔⋎s(tm1,tm2)
|	mk_z_term	(Z↾⋎s(tm1:TERM,tm2:TERM)) = mk_z_↾⋎s(tm1,tm2)
|	mk_z_term	(ZHide⋎s(tm:TERM,sl:string list)) = mk_z_hide⋎s(tm,sl)
|	mk_z_term	(Z∃⋎s(tm1:TERM,tm2:TERM,tm3:TERM)) = mk_z_∃⋎s(tm1,tm2,tm3)
|	mk_z_term	(Z∃⋎1⋎s(tm1:TERM,tm2:TERM,tm3:TERM)) = mk_z_∃⋎1⋎s(tm1,tm2,tm3)
|	mk_z_term	(Z∀⋎s(tm1:TERM,tm2:TERM,tm3:TERM)) = mk_z_∀⋎s(tm1,tm2,tm3)
|	mk_z_term	(ZΔ⋎s(tm:TERM)) = mk_z_Δ⋎s tm
|	mk_z_term	(ZΞ⋎s(tm:TERM)) = mk_z_Ξ⋎s tm
|	mk_z_term	(Z⨾⋎s(tm1:TERM,tm2:TERM)) = mk_z_⨾⋎s(tm1,tm2)
|	mk_z_term	(ZRename⋎s(tm:TERM,ididl:(string * string)list)) = mk_z_rename⋎s(tm,ididl)

;
=TEX
Finally, we leave the structure open.
=SML
end (* of structure ZTypesAndTerms *);
open ZTypesAndTerms;
=TEX
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}

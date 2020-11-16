=IGN
********************************************************************************
imp002.doc: this file is part of the PPDev system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% imp002.doc   ℤ $Date: 2005/12/16 10:34:27 $ $Revision: 1.27 $ $RCSfile: imp002.doc,v $
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

\def\Title{Implementation of System Control and Basic Error Reporting}

\def\AbstractText{This document contains the implementation of the system control and basic error reporting subsystem for the ICL HOL system.}

\def\Reference{DS/FMU/IED/IMP002}

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
%% LaTeX2e port: \TPPtitle{Implementation of System Control and Basic Error Reporting}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP002}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.27 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2005/12/16 10:34:27 $%
%% LaTeX2e port: }}  %% Mandatory field (with sensible default)
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{R.D.~Arthan & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{
%% LaTeX2e port: This document contains the implementation of the
%% LaTeX2e port: system control and basic
%% LaTeX2e port: error reporting subsystem for the ICL HOL system.}
%% LaTeX2e port: %\TPPabstractB{}
%% LaTeX2e port: %\TPPabstractC{}
%% LaTeX2e port: %\TPPabstractD{}
%% LaTeX2e port: %\TPPabstractE{}
%% LaTeX2e port: %\TPPabstractF{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port:       Library\\ R.D. Arthan\\ K. Blackburn}}
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

\subsection{Changes History}  % to get section number `0.3'
\begin{description}
\item[Issue 1.1 (1991/01/15)]
First draft for comment.
\item[Issue 1.4 (1991/01/18)]
$set\_flag$ and associated functions changed, to return previous value of control variable.
\item [Issue 1.6 (1991/01/24)]
Modified $new\_error\_message$ to only give an error if given a duplicate $id$, but also a differing $text$.
\item [Issue 1.11 (1991/06/26)]
Added $pass\_on$.
\item [Issue 1.12 (1991/07/04) (4 July 1991)]
$new\_error\_message$ no longer raises exceptions.
\item [Issue 1.14 (1991/08/12) (\FormatDate{91/08/12%
})] Rework after inspection (ID0019) of DTD002.

\item[Issue 1.15 (1992/01/20), \FormatDate{92/01/20} ] Updated to use new fonts.

\item[Issue 1.16 (1992/02/25), \FormatDate{92/02/21} ] Error
messages are not contained in ``***'' anymore.

\item[Issue 1.18 (1992/06/01), \FormatDate{92/02/26} ] Minor
change to error message format.
Avoid use of $PolyML.makestring$ by adding $string_of_int$. {}
Make $setup_pp$ print error messages a word at a time.
\item[Issue 1.19 (1992/12/14) (14th December 1992)]
Changed to allow uniform saving of controls and error messages.
\item[Issue 1.20 (1999/02/06) (6th February 1999)] SML97/NJML compatibility mods.
\item[Issue 1.21 (2002/03/19)] New function {\it pending\_reset\_control\_state}.

\item[Issue 1.23 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.24 (2002/10/17)] PPDev-specific updates for open source release
\item[Issue 1.25 (2005/04/16)] Added pending reset function for the error messages.
\item[Issue 1.26 (2005/08/17)] Added $elaborate$.
\item[Issue 1.27 (2005/12/16)] The prefix for private interfaces is now $pp'$ rather than $icl'$.
\item[Issue 1.28 (2009/02/04)] {\em get\_message\_text} now catches and reports on failures raised by the insertion functions.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.

\item[2015/11/19]
Fixed problem with SML/NJ and infix operators.

%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
\section{GENERAL}
\subsection{Scope}
This document contains part of the implementation of
the ICL HOL system.
\subsection{Introduction}
\subsubsection{Background and Purpose}
This document contains the implementation of the
material whose detailed design may be found in
\cite{DS/FMU/IED/DTD002}.
\subsection{Dependencies}
The use of $PolyML.install\_pp$
immediately after the definition of $give\_message$ is
also compiler-specific.
\subsection{Interface}
See \cite{DS/FMU/IED/DTD002}.
\subsection{Algorithms}
There are no complex algorithms in this document.
The most difficult problem is finding an interleaving
of the system control and error functions compatible
with declaration before use.
Since this structure is compiled before the utilities
defined in \cite{DS/FMU/IED/DTD001} it has to be self-sufficient
as regards table lookup algorithms etc.

\subsection{Possible Enhancements}
\subsection{Deficiencies}
\section{MINIMAL ERROR REPORTING}
\subsection{Preamble}
=SML
structure ⦏BasicError⦎ : BasicError = struct
=TEX
\subsection{Types}
=SML
datatype ⦏MESSAGE⦎ = ⦏Message⦎ of {area:string, id:int, inserters:(unit -> string) list};
=TEX
\subsection{Formatting Numbers}

Rather than use $PolyML.makestring$ we have
$string\_of\_int$ which converts an integer into a decimal
string. (SML's library function $makestring$ would
nearly do, but we want negative numbers to be shown
with a minus sign, and we do not want
to be affected by $PolyML.print\-\_depth$ being set to 0.)

=SML
local
	val ord0 = ord "0"
in
fun ⦏string_of_int⦎ (n : int) : string = (
	let	fun aux m = ( (* assumes m > 0 *)
			case m div 10 of
				0 => chr(ord0 + (m mod 10))
			|	mdiv10 => aux mdiv10 ^ chr(ord0 + (m mod 10))
		);
	in	if n > 0
		then aux n
		else if n = 0
		then "0"
		else "-" ^ aux (~n)
	end
);
end;
=TEX

\subsection{Exceptions}
=SML
exception ⦏Fail⦎ of MESSAGE;
exception ⦏Error⦎ of MESSAGE;
=TEX
\subsection{Error Message Database}
The database is represented by an assignable variable
holding a table of identifier-entry pairs .
(Experiments show an average access time of 2msecs. (on a
SPARC 1) to
do a look up in a table of 1000 entries. This seems
acceptable for an operation which is only performed when
an error message is actually printed.)
=SML
val ⦏message_db⦎ : {id:int, text:string} list ref = ref [];
=TEX
Some of the database access functions
can give rise to errors. None of these errors is recoverable
or trappable.
We therefore need the following simple function to raise errors.
=SML
fun ⦏scream⦎ (area : string) (msg : int) (inserts : string list): 'a = (
	raise (Error(Message({area=area, id=msg,
		inserters=map (fn x => (fn () => x))inserts})))
);
=TEX
=SML
fun ⦏get_error_message⦎ (id:int) (inserts:string list) : string = (
	let	fun aux1 ({id=id', text=text'} :: rest) = (
			if id' = id
			then text'
			else aux1 rest
		) | aux1 [] = scream "get_error_message" 2002 [string_of_int id];
		fun aux2 [] i = "?" ^ string_of_int i
		|   aux2 (h::t) i = (if i <= 0 then h else aux2 t (i-1));
		fun aux3 chs = (
			case chs of
				("?"::c::cs) => (
					if c = "?"
					then "?" :: aux3 cs
					else	let val num = ord c - ord "0"
						in	if num >= 0 andalso num <= 9
							then aux2 inserts num :: aux3 cs
							else "?" :: c :: aux3 cs
						end
			) |	c :: cs => (c :: aux3 cs
			) |	[] => []
		);
	in	implode(aux3(explode(aux1 (!message_db))))
	end
);
fun ⦏new_error_message⦎ (arg as {id:int, text: string}) : unit = (
	let	fun aux ((arg' as {id=id', text=text'}) :: rest) = (
			if id' = id
			then 	if text = text'
				then aux rest
				else let val msg = get_error_message 2001 [string_of_int id];
				in
	output(std_out, "* " ^ msg ^ "\n [new_error_message.2001] *");
					arg' :: rest
				end
			else arg' :: aux rest
		) | aux [] = [arg]
	in	message_db := aux(!message_db)
	end
);
fun ⦏get_error_messages⦎ () : {id:int, text:string} list = (
	!message_db
);
fun ⦏set_error_messages⦎ (lst : {id:int, text:string} list): unit = (
	map new_error_message lst;
	()
);
fun ⦏pp'change_error_message⦎ (arg as {id:int, text: string}) : unit = (
	let	fun aux ((arg' as {id=id', text=text'}) :: rest) = (
			if id' = id
			then arg :: rest
			else arg' :: aux rest
		) | aux [] = [arg]
	in	message_db := aux(!message_db)
	end
);
=TEX
\subsection{Simple Error Reporting 1}
=SML
fun ⦏report⦎ (area : string) (id : int) (inserters : (unit -> string) list) : MESSAGE = (
	Message ({
		area=area,
		id=id,
		inserters = inserters})
);
fun ⦏fail⦎ (area : string) (id : int) (inserters : (unit -> string) list) : 'a = (
	raise Fail(report area id inserters)
);
fun ⦏error⦎ (area : string) (id : int) (inserters : (unit -> string) list) : 'a = (
	raise Error(report area id inserters)
);
=TEX
\subsection{Printing Errors}

=SML
fun ⦏get_message_text⦎ (Message msg:MESSAGE) : string = (
	let	val {area:string, id:int, inserters:(unit->string)list} = msg;
		fun aux acc ok [] = (ok, rev acc)
		|   aux acc ok (f::fs) = (
			let	val (success, res) =
				(true, f())
				handle Fail (Message{area, id, ...}) =>
				(false, get_error_message 2005 [area, string_of_int id])
			in	aux (res :: acc) (ok andalso success) fs
			end
		);
		val (ok, inserts) = aux [] true inserters;
		val res = (get_error_message id inserts)
			handle Error _ => ("* " ^
			(get_error_message 2002 [string_of_int id]) ^ "[get_error_message.2002]  *");
	in	if	ok
		then	res
		else	get_error_message 2004 [res]
	end
);
=TEX
=SML
fun ⦏get_message⦎ ((arg as (Message msg)):MESSAGE) : string = (
	let	val {area:string, id:int, ...} = msg;
		val text = get_message_text arg;
		val number = string_of_int id;
	in	(get_error_message 2003 [number, area, text])
		handle Error _ => ("* " ^
			(get_error_message 2002 [string_of_int id]) ^ "[get_error_message.2002] *")
	end
);
=TEX
=SML
fun ⦏get_message1⦎ (msg : MESSAGE) : string = (
	get_message msg
	handle ex => string_of_exn ex
);
=TEX
We arrange to format error reports automatically using the following function.
A simplistic coding here would process each space character
with a call on the Oppen formatting routine $space$ and each
other character with $addstring$, however this causes the
reader writer~\cite{DS/FMU/IED/DTD005} to output text having
capital letter~`Q's wrongly.  To avoid the reader writer
problem the characters are gathered together, spaces are
counted (via $p_int:PREV$) and non-spaces are assembled
(via $p_str:PREV$); then these gathered items are output.
=MLTON
(* MLton does not support pretty-printing exceptions in this way.
=SML
fun ⦏setup_pp⦎ (():unit) : unit = (
	let
		fun error_pp (addstring, beginb, space, endb) (msg:MESSAGE) = (
			let
				datatype PREV	= p_str of string list
						| p_int of int;

				fun op_str nil = ()
				| op_str ss = addstring(implode(rev ss));

				fun aux (p_str ss) nil = op_str ss
				| aux (p_int n) nil = space(n, 0)
				| aux (p_str prev) (" " :: more) =
					(op_str prev; aux (p_int 1) more)
				| aux (p_str prev) (ch :: more) =
					aux (p_str(ch :: prev)) more
				| aux (p_int n) (" " :: more) =
					aux (p_int(n+1)) more
				| aux (p_int n) (ch :: more) =
					(space(n, 0); aux (p_str[ch]) more)
				;
			in
				beginb(0, false);
				aux (p_str nil) (explode(get_message msg));
				endb()
			end
		);
	in
=INSTALLPP
		(PPCompiler.make_pp ["BasicError", "MESSAGE"] error_pp)
	end
);
=MLTON
end of code commented out for MLton *)
val setup_pp : unit -> unit = fn () => ();
=TEX
\subsection{Support for Error Handling}
=SML
nonfix from to;
=SML
fun ⦏divert⦎ (exn : exn) (from : string) (to: string) (new_id:int) (new_inserters:(unit->string)list): 'a = (
	case exn of
		Fail (Message {area, ...}) => (
			raise (
			if area = from
			then Fail(Message {area=to, id=new_id, inserters = new_inserters})
			else exn
		)) | Other => raise Other
);
=TEX
=SML
fun ⦏list_divert⦎ (exn : exn) (to : string)
	(triples :(string * int * ((unit -> string) list))list): 'a = (
	case exn of
		Fail (Message {area, ...}) => (
			raise (
	let	fun aux [] = exn
		|  aux ((from, new_id, inserters)::rest) = (
			if area = from
			then Fail(Message{area=to, id=new_id, inserters = inserters})
			else aux rest
		);
	in	aux triples
	end		)
		) | Other => raise Other
);
=TEX
=SML
fun ⦏elaborate⦎ (exn : exn) (old_id : int)
	(new_area: string) (new_id:int) (new_inserters:(unit->string)list): 'a = (
	case exn of
		Fail (Message {id, inserters, ...}) => (
			raise (
			if id = old_id
			then Fail(Message{area=new_area, id=new_id,
				inserters = inserters@new_inserters})
			else exn
		)) | Other => raise Other
);
=TEX
=SML
fun ⦏area_of⦎ ((Fail(Message {area, ...})) : exn) : string= area
|   area_of Other = raise Other;
=TEX
=SML
fun ⦏reraise⦎ ((Fail(Message {area, id, inserters})) : exn) (new_area: string) : 'a = (
	raise (Fail(Message{area=new_area, id=id, inserters=inserters}))
)
|   reraise Other _ = raise Other;
=TEX
=SML
fun ⦏pass_on⦎ (e : exn) (fromnm : string) (tonm : string) : 'a = (
let 	val efrom = area_of e
in
	if efrom = fromnm
	then reraise e tonm
	else reraise e efrom
end);
=TEX
\subsection{Initialisation}
=TEX
=SML
val ⦏pp'error_init⦎ : unit -> unit = setup_pp;
=TEX
=SML
fun ⦏pending_reset_error_messages⦎ ((): unit) : unit -> unit = (
	let	val saved_message_db = !message_db;
	in	fn () => (
			message_db := saved_message_db
		)
	end
);
=TEX
=SML
end; (* Of structure BasicError *)
open BasicError;
val _ = pp'error_init();
=TEX
\section{SYSTEM CONTROL}
=SML
structure ⦏SystemControl⦎  = struct
=TEX
As discussed in the detailed the signature constraint is applied in IMP010.
\subsection{Support Functions}
By including a check function even for the flags we
can handle all of the functions polymorphically.
=SML
type 'a ⦏CONTROL_REC⦎ = {name:string, control:'a ref, default:unit->'a, check:'a -> bool};
=SML
val ⦏sc_warn⦎ : (string -> int -> (unit -> string) list -> unit) ref = ref fail;
=TEX
These functions are not performance critical, so we use
very simple table access algorithms:
=SML
fun ⦏lookup⦎ (func_name : string) (table : 'a CONTROL_REC list)
		(what : string) : 'a CONTROL_REC = (
	case table of
		(record as {name, ...}) :: rest => (
			if name = what
			then record
			else lookup func_name rest what
		) | [] => fail func_name 2011 [fn()=>what]
);
=TEX
Caller of the following should always arrange for the error case not to happen.
=SML
fun ⦏rename⦎ (func_name : string)
	(table :'a CONTROL_REC list) (what : string)  : 'a CONTROL_REC list = (
	let	fun decorate w = (
			let	val w' = w ^ "'";
			in	(lookup func_name table w'; decorate w')
				handle Fail _ => w'
			end
		);
		val what' = decorate what;
		fun update acc ((record as {name, control, default, check})::rest) = (
			if name = what
			then	rev acc @
				({name = what', control = control,
				 default = default, check = check} :: rest)
			else	update (record::acc) rest
		)  | update acc [] = error func_name 2011 [fn () => what];
	in	update [] table
	end
);
fun ⦏new_control⦎
	(func_name : string)
	(var : 'a CONTROL_REC list ref)
	(record as {name, ...}:'a CONTROL_REC) : unit = (
	if ((lookup "" (!var) name; true) handle Fail _ => false)
	then	(!sc_warn func_name 2010 [fn()=>name];
		 var := rename func_name (!var) name;
		new_control func_name var record)
	else	(var := record :: (!var))
);
fun ⦏set_control⦎
	(func_name : string)
	(var : 'a CONTROL_REC list ref)
	(name : string, value : 'a) : 'a = (
	let	val {name, control, check, ...} = lookup func_name (!var) name;
		val old = !control
	in	if (check value)
		then control := value
		else fail func_name 2012 [fn()=>name];
		old
	end
);
fun ⦏reset_control⦎
	(func_name : string)
	(var : 'a CONTROL_REC list ref)
	(name : string)
	: 'a = (
	let	val {name, control, default, ...} = lookup func_name (!var) name
		val old = !control
	in	control := default();
		old
	end
);
fun ⦏get_control⦎
	(func_name : string)
	(var : 'a CONTROL_REC list ref)
	(name : string)
	: 'a = (
	let	val {control,...} = lookup func_name (!var) name
	in	!control
	end
);
fun ⦏get_controls⦎
	(func_name : string)
	(var : 'a CONTROL_REC list ref)
	(():unit) : (string * 'a) list = (
	map (fn {name, control, ...} => (name, !control)) (!var)
);
fun ⦏set_controls⦎
	(func_name : string)
	(var : 'a CONTROL_REC list ref)
	(lst : (string * 'a) list) : unit = (
	map (set_control func_name var) lst;
	()
);
fun ⦏reset_controls⦎
	(func_name : string)
	(var : 'a CONTROL_REC list ref)
	: unit = (
	map (fn {name,...} => reset_control func_name var name) (!var);
	()
);
=TEX
\subsection{State Variables}
=SML
	val ⦏flags⦎ : bool CONTROL_REC list ref = ref[];
	val ⦏int_controls⦎ : int CONTROL_REC list ref = ref[];
	val ⦏string_controls⦎ : string CONTROL_REC list ref = ref[];
=TEX
\subsection{Visible Functions}
The function for introducing flags is the odd man out,
in that its parameter record does not have the $check$ field.
=SML
val ⦏new_flag⦎ : {name:string, control:bool ref, default:unit->bool, check:bool->bool} -> unit = (
	new_control
	"new_flag"
	flags
);
val ⦏new_int_control⦎ : {name:string, control:int ref, default:unit->int, check:int->bool} -> unit
	 = new_control "new_int_control" int_controls;
val ⦏new_string_control⦎ :
	{name:string, control:string ref, default:unit->string, check:string->bool} -> unit
	 = new_control "new_string_control" string_controls;
val ⦏set_flag⦎ : (string * bool) -> bool
	= set_control "set_flag" flags;
val ⦏set_int_control⦎ : (string * int) -> int
	 = set_control "set_int_control" int_controls;
val ⦏set_string_control⦎ : (string * string) -> string
	= set_control "set_string_control" string_controls;
val ⦏reset_flag⦎ : string -> bool
	= reset_control "reset_flag" flags;
val ⦏reset_int_control⦎ : string -> int
	= reset_control "reset_int_control" int_controls;
val ⦏reset_string_control⦎ : string -> string
	= reset_control "reset_string_control" string_controls;
val ⦏get_flag⦎ : string -> bool
	= get_control "get_flag" flags;
val ⦏get_int_control⦎ : string -> int
	= get_control "get_int_control" int_controls;
val ⦏get_string_control⦎ : string -> string
	= get_control "get_string_control" string_controls;
val ⦏get_flags⦎ : unit -> (string * bool) list
	= get_controls "get_flag" flags;
val ⦏set_flags⦎ : (string * bool) list -> unit
	= set_controls "set_flags" flags;
fun ⦏reset_flags⦎ (): unit
	= reset_controls "reset_flags" flags;
val ⦏get_int_controls⦎ : unit -> (string * int) list
	= get_controls "get_int_controls" int_controls;
val ⦏set_int_controls⦎ : (string * int) list -> unit
	= set_controls "set_int_controls" int_controls;
fun ⦏reset_int_controls⦎ (): unit
	= reset_controls "reset_int_controls" int_controls;
val ⦏get_string_controls⦎ : unit -> (string * string) list
	= get_controls "get_string_control" string_controls;
val ⦏set_string_controls⦎ : (string * string) list -> unit
	= set_controls "set_string_control" string_controls;
fun ⦏reset_string_controls⦎ (): unit
	= reset_controls "reset_string_controls" string_controls;
fun ⦏get_controls⦎ ((): unit)
	:	((string * bool) list *
		(string * int) list *
		(string * string) list) = (
	(get_flags(), get_int_controls(), get_string_controls())
);
fun ⦏set_controls⦎ (sf : (string * bool) list,
		si : (string * int) list,
		ss : (string * string) list): unit = (
	(set_flags sf, set_int_controls si, set_string_controls ss);
	()
);
fun ⦏reset_controls⦎ (): unit = (
	(reset_flags(), reset_int_controls(), reset_string_controls());
	()
);
=TEX
=SML
fun ⦏pending_reset_control_state⦎ ((): unit) : unit -> unit = (
	let	val flag_state = !flags;
		val int_control_state = !int_controls;
		val string_control_state = !string_controls;
	in	fn () => (
			flags := flag_state;
			int_controls := int_control_state;
			string_controls := string_control_state
		)
	end
);
=TEX
That completes the structure:
=SML
end; (* of structure SystemControl *)
open SystemControl;
=TEX
\twocolumn[\section{INDEX OF DEFINED TERMS}]
\printindex
\end{document}




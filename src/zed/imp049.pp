=IGN
********************************************************************************
imp049.doc: this file is part of the PPZed system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% imp049.doc   ℤ $Date: 2013/11/02 16:46:13 $ $Revision: 1.61 $ $RCSfile: imp049.doc,v $
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

\def\Title{Implementation of Z Paragraphs}

\def\AbstractText{This document contains the implementation of the interface used to input Z specifications into the Z Proof Support System.}

\def\Reference{DS/FMU/IED/IMP049}

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
%% LaTeX2e port: \documentstyle[hol1,11pt,TQ]{article}
%% LaTeX2e port: \ftlinepenalty=9999
\def\Hide#1{}
%% LaTeX2e port: \def\Bool{``$\it{:}bool\,$''}
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{FST PROJECT}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Implementation of Z Paragraphs}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP049}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.61 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2013/11/02 16:46:13 $%
%% LaTeX2e port: }}  %% Mandatory field (with sensible default)
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: %\TPPstatus{Approved}
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{D.J.~King & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document contains the implementation of the interface used to input Z specifications into the Z Proof Support System.}
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

\item[Issue 1.10 (1992/06/09) (9 June 1992)] First stable issue.
\item[Issue 1.28 (1992/10/06) (6th October 1992)]
Changed $simple\_z\_type\_defn$ to define unconstrained given sets
equal to $ⓩU⌝$.
\item[Issue 1.29 (1992/11/03)~(\FormatDate{92/11/03
})] Fixed bug in treatment of $Q$ in $get\_Z\_any$.
\item[Issue 1.30 (1992/11/19)] Renamed system control flags.
\item[Issue 1.31 (1992/11/20) (20th November 1992)]
Changes in cache theory handling.
\item[Issue 1.31 (1992/11/20) (20th November 1992)]
Changes in cache theory handling.
\item[Issues 1.32 (1992/11/27)-1.34 (1992/12/03) (27th November-3 December 1992)]
Major sort out. Conservative axiomatic descriptions now possible.
Generic terms are variable binding constructs. Generic constraints
have the right quantification. Free type definitions now supported
(at least axiomatically).
\item[Issues 1.35 (1992/12/04) (4th December 1992)]
Removed undesired keys, and ``local'' proof context.
\item[Issue 1.36 (1992/12/10) (10th December 1992)]
Global rename from wrk038.doc issue 1.9.
\item[Issue 1.37 (1993/07/12) (12th July 1993)]
Corrected names of quotation keywords.
\item[Issue 1.38 (1994/05/07) (4th May 1994)]
Combined the structures $ZTypeCheckOnly$ and $ZProofMode$. Also restructured code and added $update\_theory\_db\_with\_parainfo$.
\item[Issue 1.39 (1994/05/08) (8th May 1994)]
Fixed a bug inadvertantly introduced in last set of changes (attempted opening of structure $ZTypeCheckOnlyMode$ in structure $ZParagraphs$).
\item[Issue 1.40 (1994/10/31) (31st October 1994)]
Now saves conjectures in the theory database.
\item[Issue 1.41 (1994/12/18)] $z\_type\_check\_only$ mode now defaults to false.
\item[Issue 1.42 (1994/12/22)] Some buffoon set the check function for the type check only flag to $fun\_false$ which prevents the flag being changed.
\item[Issue 1.43 (1996/02/29)] Escaped character must be 3 digits in PolyML 3.0 (and Standard ML Standard).
\item[Issue 1.44 (1997/04/18)-45] Preventing free variables in axioms saved by this documents tools.
\item[Issues 1.46 (1997/07/10)-47] Fixing treatment of mutually recursive free types.
\item[Issues 1.48 (1997/07/30)] New, faster type-check-only mode and rationalisation
of flags.
\item [Issue 1.49 (1999/02/16)] Update for SML'97.
\item [Issue 1.50 (2001/12/12)] Fixes for Poly/ML port.
\item [Issue 1.51 (2002/06/03)] Allowed for change to type THEORY.
\item[Issue 1.52 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.53 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.54 (2003/07/16)] Removed unwanted dips into the cache theory --- the semantic constant
generator is supposed to do all that for itself.
\item[Issue 1.55 (2003/07/17)] Removed unwanted debugging code (it is easier just to recompile a copy
of the paragraph recognizer code with any required hooks inserted).
\item[Issue 1.56 (2004/01/19)] The Z universal set is now called 𝕌.
\item[Issue 1.57 (2005/09/08)] Type constructors for given sets are now in Z namespace;
Corrections to {\em new\_z\_type} and some general tidying up.
\item[Issues 1.58 (2005/12/16), 1.59 (2005/12/16)] Allowed for kernel interface reforms.
\item[Issue 1.60 (2011/07/11)] Support for empty schemas in paragraphs.
\item[Issue 1.61 (2013/11/02)] Made `ⓩ' into a general reader so that it can have dialects (like Z declarations).
\item[Issue 1.62 (2014/01/07)] Added support for parsing declarations.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported PPZed to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}

\subsection{Changes Forecast}
When a Z lexical analyser and a Z lexis is available
\cite{DS/FMU/IED/DTD060}, the
implementation will be modified to use that. Also, the
Z term representation which is used by the parser for
parsed terms will be modified to be brought into line
when the representation has been agreed and made available
in the Z term/schematext parser design \cite{DS/FMU/IED/DTD061}.
\pagebreak
\section{GENERAL}
\subsection{Scope}
The implementation contained in this document corresponds
to the design of Z paragraphs in \cite{DS/FMU/IED/DTD049}.
\subsection{Introduction}
\subsubsection{Background and Purpose}

This is the Z paragraph processor which is described in \cite{DS/FMU/IED/DTD049}.
In order to recognize fragments of Z, a Z reader is required. This
reader is very similar to the HOL reader of \cite{DS/FMU/IED/IMP005}
and is changed to recognize the end of the first line of Z boxes, and
generate a lexeme to indicate this. This is required by the Z grammar
\cite{DS/FMU/IED/DEF007}.

\subsubsection{Dependencies}
The structure $ZParagraphRecognizers$ is constrained by the signature
of the same name, which is specified in \cite{DS/FMU/IED/DTD049}.

\subsubsection{Possible Enhancements}

Changes to this document will be required when the backend to the user
interface has been implemented.

\subsubsection{Deficiencies}

None known.

\section{Z READER WRITER}

=SMLPLAIN SML
structure ⦏ZReaderWriter⦎ : ZReaderWriter = struct
local
open ReaderWriterSupport HOLReaderWriter ZTypesAndTermsSupport;
in
=TEX
\subsection{Warning Messages}

Faults detected in the embedded text are reported via $local_error$ as
they occur, they are also noted in the generated output using these
two functions.

=SMLPLAIN SML
fun ⦏lex_error_code⦎ (id : int, prev:string list) : string list = (
	", Lex.Text\"" :: (*="=*)
	"Lex.Error " ^ (string_of_int id) ::
	"\", " :: (*="=*)
	prev
);

fun	⦏lex_error_codes⦎ (nil : int list, prev:string list) : string list =
		prev
|	lex_error_codes (errnos, prev) =
		fold lex_error_code errnos prev
;
=TEX

\subsection{Recursive Z Parser}

Brackets within Z text need only be examined to see if they relate to
comments, all the other forms of bracket can simple be passed on for
the Z lexical analyser and parser to deal with.

Since the following gets processed by both SCCS and by the HOL reader/writer
of \cite{DS/FMU/IED/IMP005}, care has to be taken with strings containing
upper case $Q$s. The ASCII code for a $Q$ is $81$.

{\ftlinepenalty=9999
=SMLPLAIN SML
fun ⦏get_Z_any⦎ (R:READER_ENV) (prevA:string list) (sep_symbol : string)
			: string list= (
let
	open PrettyNames;

	fun	do_keyword _ (_,Value ch,Simple) p =
			get_Z_any R ((to_ML_string ch) :: p) sep_symbol
	|	do_keyword _ (names,Nil,Simple) p =
			get_Z_any R ("%%" ^ (hd names) ^ "%%" :: p) sep_symbol
	|	do_keyword k (info as (_,_, (Starting(proc, str)))) p =
			get_Z_any R (proc R k str false p) sep_symbol
	|	do_keyword _ (_,_,Middle str) p =
			get_Z_any R (str :: p) sep_symbol
	|	do_keyword (k, _) (_,ch_opt,Ending str) p =
			((*=[(("=*)	"\"))" :: to_ML_string k ::
				"\"], \"" :: to_ML_string str :: p)
	|	do_keyword _ (_,_,Ignore) p =
			get_Z_any R p sep_symbol
	|	do_keyword (k, is_keyword) (names,_,Invalid) p = (
			local_error "get_Z_any" 5007
				[fn () => if is_keyword then "%%" ^ k ^ "%%" else k];
			get_Z_any R (lex_error_code(5007, p)) sep_symbol);

	fun do_string ML_string = (
		let	val (read_string, ol_name) =
				if ML_string
				then	(get_ML_string, "Lex.String")
				else	(get_primed_string, "Lex.Char");
			val (str, errnos) = read_string R (ol_name :: "\", " :: prevA); (*="=*)
			val text_so_far = ", Lex.Text\"" (*="=*) :: str;
		in
			get_Z_any R (lex_error_codes(errnos, text_so_far)) sep_symbol
		end
	);

	val next = #look_at_next R ()
in
	case read_symbol R
	of	SymCharacter ch => (
			case ch
			of "("	=>	(	if #look_at_next R () = "*"
						then
							(skip_comment R;
							get_Z_any R (" " :: prevA) sep_symbol)
						else
							get_Z_any R ( "(" ::  prevA) sep_symbol)
			|  "\""	=>	do_string true (*="=*)
			|  "`"	=>	do_string false
			|  "\^D" =>	prevA
			|  "\081"	=>	get_Z_any R ("\081\081\081\081" :: prevA) sep_symbol
			|  "\\"	=>	get_Z_any R ("\\\\" :: prevA) sep_symbol
			|  _ => 	get_Z_any R (ch :: prevA) sep_symbol
		)
	|	SymEndOfInput => prevA
	|	SymWhite xs =>
			if contains xs "\n"
			then	to_ML_string sep_symbol :: prevA
			else	get_Z_any R (" " :: prevA) sep_symbol
	|	SymKnown(sym, is_keyword, info) => do_keyword (sym, is_keyword) info prevA
	|	SymDoublePercent => get_Z_any R ("%%%%" :: prevA) sep_symbol
	|	SymUnknownKw(sym, is_closed) => (
			local_error "get_Z_any" 5003 [fn () => sym, fn () =>
							implode(rev(" ... " :: (prevA to 20)))];
			get_Z_any R (lex_error_code(5003, prevA)) sep_symbol
		)
	|	SymUnknownChar ch => (
			local_error "get_Z_any" 5005
						[fn () => ch,
						fn () => string_of_int(ord ch),
						fn () => implode(" ... " :: (rev(prevA to 20)))];
				get_Z_any R (lex_error_code(5005, prevA)) sep_symbol
		)
end);
=TEX
}

\subsection{Outer Level of the Z Reader}

Z text is to be read, the opening symbol and language name are
given.  Produce Standard~ML text as follows to add onto the left
hand context.

=GFT SML
( recogniser ( "starting symbol", "language name", quoted_text, "closing symbol" ))
=TEX

When the $add_semi$ argument is true then add, additionaly, a semi-colon
to indicate the end of an outermost Standard~ML expression.

Where the $quoted_text$ is a list of values of type $Lex.INPUT$, see
section\ref{DatatypeForParserInterface}.  Function $Z\_reader$ is
responsible for building the opening part of the Standard~ML text,
function $get\_Z\_any$ reads and assembles the quoted text (i.e., the
body of the quotation) and the closing text.

=SMLPLAIN SML
fun ⦏Z_reader⦎ (recogniser:string) (add_semi:bool) (sep_symbol : string)
		(R:READER_ENV) (start:string, is_keyword:bool)
		(lang:string) (opening:string) (prevA:string list) : string list = (
let
	val prevB =
		opening ::
		"\", [Lex.Text\"" ::
		to_ML_string lang ::
		"\", \"" ::
		to_ML_string start ::
		"(\"" (*=")=*) ::
		recogniser ::
		"(" ::
		prevA;

	val read_text = get_HOL_any R (get_Z_any R prevB sep_symbol);
in
	if add_semi
	then
		";" :: read_text
	else
		read_text
end
);
=TEX


=SMLPLAIN SML
end (* local ... in *);
end (* of structure ZReaderWriter *);
=TEX

\section{THE STRUCTURE $ZParagraphs$}
=SML
structure ⦏ZParagraphs⦎ : ZParagraphs = struct
local
	open	Unification
		ZUserInterfaceSupport
		ZTypesAndTermsSupport
		ZTypeInference
		ZGeneratedConstants
		ZTermGenerator;
in
=TEX
\section{SUPPORT FOR TYPE CHECK ONLY MODE}

\subsection{Saving Types and Constants in the Theory}

=SML
fun ⦏new_type_clashes⦎ ((tyname, arity) : (string * int)) : (string * int) list = (
	case get_type_arity tyname of
	Nil => []
	|Value arity' => if (arity = arity')
			then	[]
			else	[(tyname, arity)]
);

fun ⦏new_type_nofail⦎ ((tyname, arity) : (string * int)) : unit = (
	case get_type_arity tyname of
	Nil => (new_type (tyname, arity);())
	|Value arity' =>
		if arity = arity'
		then ()
		else fail "new_type_nofail" 62998 []
);
=TEX
We can now give the deletion functions:
=SML
fun ⦏tco_delete_const⦎ (cnt : TERM) : (string * int) list * (string * TYPE) list = (
let	val (cnm, cty) = dest_const cnt
		handle complaint =>
		pass_on complaint "dest_const" "delete_const";

	val {con_env = con_env,...} = get_theory "-";

	val {level = level, ty = ty} = force_value(oe_lookup cnm con_env)
		handle complaint =>
		divert complaint "force_value" "delete_const" 12001
			[fn () => get_current_theory_name (),
			 fn () => cnm];

	val dummy = if not(is_type_instance ty cty andalso
			is_type_instance cty ty)
		then fail "delete_const" 12001
			[fn () => get_current_theory_name (),
			 fn () => cnm]
		else ();
in	delete_to_level {
		do_warn = true,
		caller = "tco_delete_const",
		target = cnm,
		level = level}
end);
=TEX
=SML
fun ⦏tco_replace_const⦎ ((name, ty) : (string * TYPE)) : TERM = (
	case get_const_info name of
	Nil => new_const (name, ty)
	|Value (ty', _) => (
		if ty' =: ty
		then	mk_const (name,ty)
		else	let
				val (tylist, clist) = tco_delete_const (mk_const (name, ty'));
				val side = map new_type (tylist drop (fn(n,_) => n=name));
				val side = map new_const (clist drop (fn(n,_) => n=name));

			in
				new_const (name,ty)
			end
	)
);
=TEX
=SML
fun ⦏z_replace_consts⦎ (idtyl : (string * TYPE) list) : unit = (
let	val idtyl' = map (fn (n, ty) => (bind_gvar_name n, ty)) idtyl;
	val side = map tco_replace_const idtyl';
in
	()
end);
=TEX
=SML
fun ⦏type_of_formal⦎ (id : IDENT) : TYPE = (
	mk_vartype ("'"^(string_of_ident id))
);
=TEX

\section{PROOF SUPPORT MODE}

=SML
val ⦏z_type_check_only⦎ = ref false;
val _ = if contains (map fst (get_flags()))
			"z_type_check_only"
	then	()
	else	new_flag{name = "z_type_check_only",
			control = z_type_check_only,
			default = fun_false,
			check = fun_true
	};
=TEX
=SML
val ⦏z_use_axioms⦎ = ref true;
val _ = if contains (map fst (get_flags()))
			"z_use_axioms"
	then	()
	else	new_flag{name = "z_use_axioms",
			control = z_use_axioms,
			default = fun_true,
			check = fun_true
	};
=TEX
=SML
datatype ⦏PARAINFO⦎ =
	⦏FixityInfo⦎ of FIXITY
	|⦏AbbDefInfo⦎ of string * string list * TERM
	|⦏SchBoxInfo⦎ of string * string list * TERM
	|⦏AxDesInfo⦎ of string list * TERM * TERM OPT * (string * TYPE) list
	|⦏FreeTypeInfo⦎ of (string * (string * TERM OPT) list) list
	|⦏GivenSetInfo⦎ of string list * (string list * TERM) OPT
	|⦏ConstraintInfo⦎ of string list * TERM
	|⦏ConjectureInfo⦎ of string OPT * string list * TERM
	|⦏TypeCheckInfo⦎ of (string * TYPE) list * (string * int) list;
=TEX
=SML
fun ⦏mk_fixity_info⦎ (fixinfo : FIXITY) = (
	FixityInfo fixinfo
);
=TEX
=SML
fun ⦏mk_abbdef_info⦎ ((id, idl, z_tm, oty)
	: IDENT * IDENT list * Z_TM * EXTYPE OPT) = (
	AbbDefInfo (string_of_ident id, map string_of_ident idl, term_of_z_tm z_tm)
);
=TEX
=SML
fun ⦏mk_schbox_info⦎ ((id,idl,sch, _)
	: IDENT * IDENT list * Z_SCH_TEXT * EXTYPE OPT) : PARAINFO = (
let	val tm = term_of_z_tm (ZTmHorizSchema sch);
in
	SchBoxInfo (string_of_ident id, map string_of_ident idl, tm)
end);
=TEX
=SML
fun ⦏mk_axdes_info⦎ ((idl, sch, Value idtyl) : IDENT list * Z_SCH_TEXT *
				(IDENT * EXTYPE) list OPT) : PARAINFO = (
let	val (tm, otm) = term_of_z_schtext sch;
	val idtyl' = map (fn (id, ty) => (string_of_ident id, type_of_z_extype ty)) idtyl;
in
	AxDesInfo (map string_of_ident idl, tm, otm, idtyl')
end
) | ⦏mk_axdes_info⦎ (_, _, Nil) = (
	fail "mk_axdes_info" 49000 []
);
=TEX
=SML
fun ⦏mk_freetype_info⦎ (ftdeflist : (IDENT * (IDENT * EXTYPE OPT * Z_TM OPT) list) list)
	: PARAINFO= (
let	fun aux (id, _, Value z_tm) =
		(string_of_ident id, Value (term_of_z_tm z_tm))
	  | aux (id, _, Nil) = (string_of_ident id, Nil);
	fun aux1 (id, branch) = (string_of_ident id, map aux branch);
in
	FreeTypeInfo (map aux1 ftdeflist)
end);
=TEX
=SML
fun ⦏mk_givenset_info⦎ ((idl, Value (gens, z_tm)) : IDENT list * (IDENT list * Z_TM) OPT)
	: PARAINFO = (
	GivenSetInfo (map string_of_ident idl,
		Value (map string_of_ident gens,term_of_z_tm z_tm))
) | mk_givenset_info (idl, Nil) =
	GivenSetInfo (map string_of_ident idl, Nil);

=TEX
=SML
fun ⦏mk_constraint_info⦎ ((idl, z_tm) : (IDENT list * Z_TM)) : PARAINFO = (
		ConstraintInfo (map string_of_ident idl, term_of_z_tm z_tm)
);
=TEX
=SML
fun ⦏mk_conjecture_info⦎ ((Value id, idl, z_tm) : (IDENT OPT * IDENT list * Z_TM))
	: PARAINFO = (
		ConjectureInfo (Value (string_of_ident id),
			map string_of_ident idl, term_of_z_tm z_tm)
) | mk_conjecture_info (Nil, idl, z_tm) = (
		ConjectureInfo (Nil, map string_of_ident idl, term_of_z_tm z_tm)
);
=TEX
=SML
fun ⦏typecheck_info_of_z_para⦎ (p : Z_PARA) : PARAINFO = (

	case p of
	ZParaFixity pbody => (
		mk_fixity_info pbody
	)|ZParaAbbDef (id, [], _, Value ty) => (
		TypeCheckInfo
		([(string_of_ident id, type_of_z_extype ty)], [])
	)|ZParaAbbDef (id, formals, z_tm, Value ty) => (
	let	val fty = mk_z_tuple_type (map mk_z_power_type
				(map type_of_formal formals));
		val aty = type_of_z_extype ty;
		val ty' = mk_→_type (fty, aty);
	in
		TypeCheckInfo([(string_of_ident id, ty')], [])
	end
	)|ZParaAbbDef (_, _, _, Nil) => (
			fail "consts_in_zinferred" 62998
				[fn()=>"Insufficient type info"]
	)|ZParaSchBox (id, [], z_sch, Value ty) => (
		TypeCheckInfo
		([(string_of_ident id, type_of_z_extype ty)], [])
	)|ZParaSchBox (id, formals, z_sch, Value ty) => (
	let	val fty = mk_z_tuple_type (map mk_z_power_type
				(map type_of_formal formals));
		val aty = type_of_z_extype ty;
		val ty' = mk_→_type (fty, aty);
	in
		TypeCheckInfo
		([(string_of_ident id, ty')], [])
	end
	)|ZParaSchBox (_, _, _, Nil) => (
		fail "consts_in_zinferred" 62998
				[fn()=>"Insufficient type info"]
	)|ZParaAxDes ([], z_sch, Value idtyl) => (
		TypeCheckInfo
		((map (string_of_ident ** type_of_z_extype) idtyl), [])
	)|ZParaAxDes (formals, z_sch, Value idtyl) => (
	let	val fty = mk_z_tuple_type (map mk_z_power_type
				(map type_of_formal formals));
		val idtyl' = map (fn (id, ty) => (string_of_ident id,
			mk_→_type (fty, (type_of_z_extype ty)))) idtyl;
	in
		TypeCheckInfo(idtyl', [])
	end
	)|ZParaGivenSet (ids, _) => (
	let	fun aux id = (
			((id, mk_z_power_type(mk_ctype(bind_gvar_name id,[]))), (id, 0))
		);
	in
		(TypeCheckInfo o split o map (aux o string_of_ident)) ids
	end
	)| ZParaFreeType tdl => (
	let	fun aux id = (
			((id, mk_z_power_type(mk_ctype(bind_gvar_name id,[]))), (id, 0))
		);
		fun make_con_ty ty (id, oty, _) = (
			(string_of_ident id,
			  case oty of
			  Value ety =>
				mk_z_power_type(mk_z_tuple_type
					[type_of_z_extype ety,ty])
			  |Nil => ty
			)
		);
		fun constructors (id, con_tys) = (
			map (make_con_ty (mk_ctype (bind_gvar_name(string_of_ident id), []))) con_tys
		);
		val (cs, ts) = (split o map (aux o string_of_ident o fst)) tdl
	in
		TypeCheckInfo(cs @ (flat o map constructors) tdl, ts)
	end
	)| _ => (TypeCheckInfo([], [])
	)
);
=TEX
=SML
fun ⦏parainfo_of_z_para⦎ (para : Z_PARA) : PARAINFO = (
	if get_flag("z_type_check_only")
	then
		typecheck_info_of_z_para para
	else case para of
		ZParaFixity pbody => mk_fixity_info pbody
	|	ZParaAbbDef pbody => mk_abbdef_info pbody
	|	ZParaSchBox pbody => mk_schbox_info pbody
	|	ZParaAxDes pbody => mk_axdes_info pbody
	|	ZParaFreeType pbody => mk_freetype_info pbody
	|	ZParaGivenSet pbody => mk_givenset_info pbody
	|	ZParaConstraint pbody => mk_constraint_info pbody
	|	ZParaConjecture pbody => mk_conjecture_info pbody
	|	 _ => fail "parainfo_of_z_para" 49999 []
);
=TEX
\subsection{Dummy Caller of const$\_$spec}
The following could have something to force a good proof
context (e.g. one containing ``$'$z$\_$predicates'')
to be added, but it seems redundant and inefficient.
=SML
fun ⦏paragraph_const_spec⦎ (args : string list * TERM list * TERM) : THM = (
	const_spec args
);

=TEX
\subsection{Checks}
For given sets we (including free types), we must check that the
name is not in use as a type name and that the z-ified name is
not in use as a constant name:
=SML
fun check_gset_name (s : string) : unit = (
	let	val zn = bind_gvar_name s;
	in	case (get_type_arity zn, get_const_type zn) of
			(_, Value _) => fail "check_gset_name" 49003 [fn _ => s]
		|	(Value _, _) => fail "check_gset_name" 49002 [fn _ => s]
		|	_ => ()
	end
);
=TEX
For other global variables we only need to check the use of the
z-ified name:
=SML
fun check_gvar_name (s : string) : unit = (
	case get_const_type (bind_gvar_name s) of
		Value _ => fail "check_gvar_name" 49003 [fn _ => s]
	|	_ => ()
);
=TEX
\section{DEFINITIONS BY AXIOM}
=SML
val ⦏z_allow_free_vars_in_axioms⦎ = ref false;

val _ = if contains (map fst (get_flags()))
			"z_allow_free_vars_in_axioms"
	then	()
	else	new_flag{name = "z_allow_free_vars_in_axioms",
			control = z_allow_free_vars_in_axioms,
			default = fun_false,
			check = fun_true
	};
=TEX
=SML
fun ⦏abbdef_defn⦎ (flag : bool) ((name, gen_formals, tm) : string * string list * TERM) : unit = (
let	val wrap = if flag then ⌜$"Z'SchBox"⌝ else ⌜$"Z'AbbDef"⌝;
	val side_effect = check_gvar_name name;
	val name' = bind_gvar_name name;
	val ty = type_of tm;
in
	case map (mk_z_power_type o mk_z_var_type) gen_formals of
	[] => (
		let	val var = mk_var(name, ty);
			val var' = mk_var(name', ty) ;
			val tm' = subst [(var', var)] tm;
			val defn1 = mk_eq(var', tm');
			val defn2 = mk_app (wrap, defn1);
			val side = paragraph_const_spec ([name],[var'], defn2);
		in
			()
		end)
	| gftyl => (
		let	val ty' = mk_→_type(mk_z_tuple_type gftyl,ty);
			val var = mk_var(name, ty');
			val var' = mk_var (name', ty');
			val tm' = subst [(var', var)] tm;
			val gfl = map mk_var (combine gen_formals gftyl);
			val arg = mk_z_tuple gfl;
			val side = tuple_gen_semantic_const arg;
			val defn1 = mk_eq(mk_app(var', arg), tm');
			val defn2 = list_mk_∀ (gfl, defn1);
			val defn3 = mk_app (wrap, defn2);
			val side = paragraph_const_spec ([name], [var'], defn3);
		in
			()
		end)
end

);

=TEX
=SML
fun ⦏ax_axdes_defn⦎ ((gen_formals, tm1, otm, idtyl)
	: string list * TERM * TERM OPT * (string * TYPE) list) : unit = (
let	val def_tm = case otm of
		Value tm2 => mk_∧ (tm1, tm2)
		|Nil => mk_∧ (tm1, mk_t);
	val gens = map (fn id => mk_var (id, (mk_z_power_type o mk_z_var_type) id)) gen_formals;
	val vars = map mk_var idtyl;
	val side_effect = (map (check_gvar_name o fst) idtyl; ());
	val zidtyl = map (fn (id, ty) => (bind_gvar_name id, ty)) idtyl;
	val zconsts = map mk_const zidtyl;
	val generify = (
		case gens of
		[] => Combinators.I
		|_ => (
			let	val pval = mk_z_tuple gens;
				val side = tuple_gen_semantic_const pval;
				val ptype = type_of pval;
			in	(fn v =>
					let	val (s, ty) = dest_const v;
						val v' = mk_const(s, mk_→_type (ptype, ty));
					in
						mk_app(v', pval)
					end)
			end
			)
	);

	val constsubs = map (fn (v1, v2) => (generify v1, v2)) (combine zconsts vars);
	val newconsts = map (fst o strip_app o fst) constsubs;
	val def_tm' = subst constsubs def_tm;
	val defn1 = list_mk_∀ (gens, def_tm');
	val defn2 = mk_app(⌜$"Z'AxDes"⌝, defn1);
	val side = map (new_const o dest_const) newconsts;
	val dummy =
	let	val fs = frees defn2;
		val inform = if !z_allow_free_vars_in_axioms then warn else fail;
	in 	if	is_nil fs
		then	()
		else	inform
			"update_theory_db_with_parainfo" 49006
			[fn () => format_list (fst) idtyl ", ",
			 fn () => format_list (fst o dest_var) fs ", "]
	end;
	val _ = new_axiom ((map fst idtyl), defn2);
in	()
end);
=TEX
=SML
fun ⦏cons_axdes_defn⦎ ((gen_formals, tm1, otm, idtyl)
	: string list * TERM * TERM OPT * (string * TYPE) list) : unit = (
let	val def_tm = case otm of
		Value tm2 => mk_∧ (tm1, tm2)
		|Nil => mk_∧ (tm1, mk_t);
	val gens = map (fn id => mk_var (id,
		(mk_z_power_type o mk_z_var_type) id)) gen_formals;
	val vars = map mk_var idtyl;
	val side_effect = (map (check_gvar_name o fst) idtyl; ());
	val zidtyl = map (fn (id, ty) => (bind_gvar_name id, ty)) idtyl;
	val zvars = map mk_var zidtyl;
	val generify = (
		case gens of
		[] => Combinators.I
		|_ => (
			let	val pval = mk_z_tuple gens;
				val side = tuple_gen_semantic_const pval;
				val ptype = type_of pval;
			in	(fn v =>
					let	val (s, ty) = dest_var v;
						val v' = mk_var(s, mk_→_type (ptype, ty));
					in
						mk_app(v', pval)
					end)
			end
			)
	);

	val varsubs = map (fn (v1, v2) => (generify v1, v2)) (combine zvars vars);
	val newvars = map (fst o strip_app o fst) varsubs;
	val def_tm' = subst varsubs def_tm;
	val defn1 = list_mk_∀ (gens, def_tm');
	val defn2 = mk_app(⌜$"Z'AxDes"⌝, defn1);
	val side = paragraph_const_spec ((map fst idtyl), newvars, defn2);
in
	()
end);
=TEX
=SML
fun ⦏simple_new_z_type⦎ (s : string) : THM = (
let	val side_effect = check_gset_name s;
	val zs = bind_gvar_name s;
	val ty = new_type (zs, 0);
	val var = mk_var (zs, mk_z_power_type ty);
	val totty = mk_z_power_type ty;
	val tot = mk_const("Totality",totty);
	val U = mk_const("z'𝕌",mk_→_type(mk_z_tuple_type[totty],totty));
	val tm = mk_eq (var, mk_app(U,mk_z_tuple[tot]));
in
	paragraph_const_spec ([s], [var], tm)
end);
=TEX

=SML
fun ⦏new_z_type⦎ (sl : string list) (fmls: string list, tm : TERM) : THM = (
let	val _ = map check_gset_name sl;
	val fs1 = map dest_var (frees tm) drop (fn vty => fst vty mem fmls);
	val xfs = fs1 drop (fn vty => fst vty mem sl);
	val dummy =
	let	val inform = if !z_allow_free_vars_in_axioms then warn else fail;
	in	if	is_nil xfs
		then	()
		else	inform
			"update_theory_db_with_parainfo" 49006
			 [fn () => format_list (Combinators.I) sl ", ",
			  fn () => format_list fst xfs ", "]
	end;
	val _ = map simple_new_z_type sl;
	val fs2 = fs1 drop (fn vty => not(fst vty mem sl));
	val subs = map (fn (v, ty) => (mk_z_gvar(v, ty, []), mk_var (v, ty))) fs2;
	val gens = map (fn id => mk_var (id,
		(mk_z_power_type o mk_z_var_type) id)) fmls;
	val ax = list_mk_∀ (gens, (subst subs tm));
in	new_axiom (sl, ax)
end);
=TEX

=SML
fun ⦏givenset_defn⦎ ((idl, Nil) : string list * (string list * TERM) OPT) : unit = (
	map simple_new_z_type idl; ()
) | givenset_defn (idl, Value (fmls, tm)) = (
	new_z_type idl (fmls, tm); ()
);
=TEX
Free type definition processing involves rather more messing about than
the other sorts of paragraph. We have to build apparatus to construct
the defining property for the free type from the syntax of its constructors.
The following tiresome code does this.
=SML
local
=TEX
We need the following types:
=SML
	val a = ⓣ'a⌝;
	val ⦏ℙ'a⦎ : TYPE = mk_z_power_type a;
	val b = ⓣ 'b⌝;
	val ⦏ℙ'b⦎ : TYPE = mk_z_power_type b;
	val ℤ = mk_ctype("ℤ", []);
=TEX
We need to be able to construct terms formed with $ran$ ...
=SML
	val ⦏ran_ty⦎ = mk_z_power_type(mk_z_tuple_type[
				mk_z_power_type(mk_z_tuple_type[a, b]) , ℙ'b]);
	val ⦏ran⦎ = mk_z_gvar("ran", ran_ty,  [mk_u ℙ'a, mk_u ℙ'b]);
	fun ⦏make_ran⦎ (f : TERM) : TERM = (
		let 	val tys = dest_z_tuple_type (dest_z_power_type (type_of f));
			val ty1 = hd tys;
			val ty2 = hd(tl tys);
			val iran = inst [] [(ty1, a), (ty2, b)] ran;
		in	mk_z_app(iran, f)
		end
	);
=TEX
... and $disjoint$ ...
=SML
	val ⦏disjoint_ty⦎ : TYPE = mk_z_power_type(mk_z_power_type(mk_z_tuple_type[a, ℙ'b]));
	val ⦏disjoint⦎ = mk_z_gvar("disjoint _", disjoint_ty, [mk_u ℙ'a, mk_u ℙ'b]);
	fun ⦏mk_disjoint⦎ (ty : TYPE) (sl : TERM list) = (
		let	val idisjoint = inst [] [(ℤ, a), (ty, b)] disjoint;
		in	mk_z_∈(mk_z_⟨⟩ (mk_z_power_type ty, sl), idisjoint)
		end
	);
=TEX
... and $∪$ ...
=SML
	val ⦏∪_ty⦎ : TYPE = mk_z_power_type(mk_z_tuple_type[mk_z_tuple_type[ℙ'a, ℙ'a], ℙ'a]);
	val ⦏∪⦎ : TERM = mk_z_gvar("_ ∪ _", ∪_ty, [mk_u ℙ'a]);
	fun ⦏list_∪⦎ (ty : TYPE) (ts : TERM list) : TERM = (
		let	val i∪ = inst [] [(ty,  a)] ∪;
			fun make_∪ t1 t2 = mk_z_app(i∪, mk_z_tuple[t1, t2]);
			fun aux []  = mk_z_setd (ty, [])
			|   aux [t] = t
			|   aux (t::more) = make_∪ t (aux more);
		in	aux ts
		end
	);
=TEX
... and $⊆$ ...
=SML
	val ⦏⊆_ty⦎ : TYPE = mk_z_power_type(mk_z_tuple_type[ℙ'a, ℙ'a]);
	val ⦏⊆⦎ : TERM = mk_z_gvar("_ ⊆ _", ⊆_ty, [mk_u ℙ'a]);
	fun ⦏make_⊆⦎ (ty : TYPE) (t1 : TERM) (t2 : TERM) : TERM = (
		let	val i⊆ = inst [] [(ty,  a)] ⊆;
		in	mk_z_∈(mk_z_tuple[t1, t2], i⊆)
		end
	);
=TEX
... and relational image ...
=SML
	val ⦏rel_image_ty⦎ : TYPE = mk_z_power_type(mk_z_tuple_type[
			mk_z_tuple_type[mk_z_power_type(
				mk_z_tuple_type[a, b]), ℙ'a] , ℙ'b]);
	val ⦏rel_image⦎ : TERM = mk_z_gvar("_ ⦇ _ ⦈", rel_image_ty, [mk_u ℙ'a, mk_u ℙ'b]);
	fun ⦏make_rel_image⦎ (f : TERM) (t : TERM): TERM = (
		let 	val tys = dest_z_tuple_type (dest_z_power_type (type_of f));
			val ty1 = hd tys;
			val ty2 = hd(tl tys);
			val irel_image = inst [] [(ty1, a), (ty2, b)] rel_image;
		in	mk_z_app(irel_image, mk_z_tuple[f, t])
		end
	);
=TEX
... and $↣$.
=SML
	val ⦏↣_ty⦎ : TYPE = mk_z_power_type(mk_z_power_type(mk_z_tuple_type[a, b]));
	fun ⦏make_↣⦎ (ty1 : TYPE) (t1 : TERM) (ty2 : TYPE) (t2 : TERM) : TERM = (
		let	val i↣_ty = inst_type [(ty1,  a), (ty2,  b)] ↣_ty;
		in	mk_z_gvar("_ ↣ _", i↣_ty, [t1, t2])
		end
	);
=TEX
=TEX
Now we can define functions to compute the bits of the defining property.
The incoming free type definition has the form:
=GFT
T⋏i ::= B⋏i⋎1 | B⋏i⋎2 | ...(1 ≤ i ≤ r)
=TEX
where each branch
=INLINEFT
B⋏i⋎j
=TEX
\ is either a nullary constructor,
=INLINEFT
C⋏i⋎j
=TEX
, or a unary constructor with its argument set:
=INLINEFT
D⋏i⋎j (E⋏i⋎j)
=TEX
The defining property has $r + 1$ parts.
The first $r$ parts assert that the ranges of the constructors for each
=INLINEFT
T⋏i
=TEX
\ are disjoint:
=GFT
	disjoint⟨R⋏i⋎1, R⋏i⋎1, ...⟩
=TEX
, where
=INLINEFT
R⋏i⋎j
=TEX
\ is either
=INLINEFT
{C⋏i⋎j}
=TEX
or
=INLINEFT
ran D⋏i⋎j
=TEX
\ according to the form of the corresponding constructor.
The final part of the defining property is the induction principle and
has (essentially) the form:
=GFT
∀	W⋏1:ℙT⋏1; W⋏2:ℙT⋏2; ....
|	S⋏1⋎1[W⋏1/T⋏1] ∪ S⋏1⋎1[W⋏1/T⋏1] ∪ ... ⊆ W⋏1
∧	S⋏2⋎1[W⋏1/T⋏1] ∪ S⋏2⋎1[W⋏1/T⋏1] ∪ ... ⊆ W⋏2
∧	...
⦁	T⋏1 ⊆ W⋏1 ∧ T⋏2 ⊆ W⋏2 ∧ ...
=TEX
, where
=INLINEFT
S⋏i⋎j
=TEX
\ is either
=INLINEFT
{C⋏i⋎j}
=TEX
or
=INLINEFT
D⋏i⋎j ⦇E⋏i⋎j⦈
=TEX
\ according to the form of the corresponding constructor.

In fact, to abbreviate this, we collect together the nullary constructors
for each row in the hypothesis into a set display.

In the following, as we generate parts of the predicate:

\begin{description}
\item[$ty$] is the type of the constituent free type being processed
\item[$tyn$] is the name of the constituent free type being processed
\item[$fty$] is the global variable formed from $ty$ and $tyn$
\item[$bs$] is the branches of the free type, with the constructors as
local variables (HOL variables) of the appropriate type, and the argument sets
of the constructors with instances of the free types being  the
local variables which the type inferrer will have planted
\item[$gsubs$] is the substitution which replaces the local variable for each constituent free type with the corresponding global variable.
\item[$wsubs$] is the substitution which replaces the local variable for each constituent free type with the corresponding bound variable in the induction principle.
\end{description}

The two substitutions must be free of repetitions and in the same order
as the constituents of the free type definition.


Note that the constructor names need to be local variables here
not globals, (since they will be passed on to $axdes\_defn$, which expects
the variables to be defined to be local).

First a function to construct the disjointness assertions ...
=SML
	fun ⦏make_ft_disjoint⦎
		(gsubs : (TERM * TERM) list)
		((ty : TYPE), (bs : (TERM * TERM OPT) list)) : TERM = (
		let	fun aux [] = []
			|   aux ((f, Value t) :: more) = (
				make_ran f :: aux more
			) | aux ((c, Nil) :: more) = (
				mk_z_setd (ty, [c]) :: aux more
			);
		in	subst gsubs (mk_disjoint ty (aux bs))
		end
	);
=TEX
... then the set displays
=SML
	fun ⦏make_ft_setd⦎ (ty : TYPE) (bs : (TERM * TERM OPT) list) : TERM OPT = (
		case map fst (bs drop (not o is_Nil o snd)) of
			[] => Nil
		|	ts => Value (mk_z_setd (ty, ts))
		
	);
=TEX
... then the union ...
=SML
	fun ⦏make_ft_∪⦎ (ty : TYPE) (bs : (TERM * TERM OPT) list)
			(wsubs : (TERM * TERM) list) : TERM = (
		let	fun aux [] = []
			|   aux ((f, Value t) :: more) = (
				let	val t' = subst wsubs t;
				in	make_rel_image f t'
				end :: aux more
			) | aux (_ :: more) = aux more;
		in	case make_ft_setd ty bs of
				Nil => list_∪ ty (aux bs)
			|	Value t => list_∪ ty (t :: aux bs)
		end
	);
=TEX
... and to form the induction principle ...
=SML
	fun ⦏make_ft_ind_pred⦎
			(ftys : TERM list)
			(tys : TYPE list)
			(wsubs : (TERM * TERM) list)
			(bss : (TERM * TERM OPT) list list) : TERM = (
		let	val portmanteau =
				combine ftys
					(combine tys
						(combine wsubs bss));
			fun make_hyp_⊆ (_, (ty, ((w, _), bs))) = (
				make_⊆ ty (make_ft_∪ ty bs wsubs) w
			);
			fun make_conc_⊆ (fty, (ty, ((w, _), _))) = (
				make_⊆ ty fty w
			);
			fun make_dec (fty, (_, ((w, _), _))) = (
				mk_z_dec([w], mk_z_ℙ fty)
			);
			val decl = mk_z_decl(map make_dec portmanteau);
			val hyp = list_mk_∧ (map make_hyp_⊆ portmanteau);
			val conc = list_mk_∧ (map make_conc_⊆ portmanteau);
		in	mk_z_∀(decl, hyp, conc)
		end
	);
=TEX
... and, finally, form the declaration part of the definition (the substitution
of globals for locals is not done here).
=SML
	fun ⦏make_ft_decs⦎
		(fty : TERM, (ty : TYPE, bs : (TERM * TERM OPT) list))
		: TERM list = (
		let	val cs = map fst (bs drop (not o is_Nil o snd));
			val ds = map (Combinators.I ** force_value)
						(bs drop (is_Nil o snd));
			fun aux [] = []
			|   aux ((f, t) :: more) = (
				mk_z_dec
				([f],
				make_↣
				((dest_z_power_type o type_of) t)
				t
				ty
				fty)
				:: aux more
			);
		in	case cs of
				[] =>  (aux ds)
			|	_ =>  ((mk_z_dec(cs, fty)) :: aux ds)
		end
	);
=TEX
Now a function to construct the constructors from the information
passed on by the type inferrer.
=SML
	fun ⦏make_constructors⦎
		(tyn : string, (ty : TYPE, (fty : TERM,
		(pars : (string * TERM OPT) list))))
		: (TERM * TERM OPT) list = (
		let	fun make_con_ty t = (
				mk_z_power_type(
					mk_z_tuple_type[
						dest_z_power_type(type_of t),ty])
			);
			fun aux (n, Nil) = (mk_var(n, ty), Nil)
			|   aux (n, Value t) = (
					(mk_var(n, make_con_ty t),
					Value t)
			);
		in	map aux pars
		end
	);
=TEX
We need to check that all of the library objects we use are in scope:
=SML
	val things_to_check = [
		dest_const (fst (strip_app ran)),
		dest_const (fst (strip_app disjoint)),
		dest_const (fst (strip_app ∪)),
		dest_const (fst (strip_app ⊆)),
		dest_const (fst (strip_app rel_image)),
		dest_const (fst (strip_app (make_↣ a (mk_u (ℙ'a)) b (mk_u ℙ'b))))
	];
	fun ⦏fty_scope_check⦎ () : unit = (
		let	fun same_ty ty1 ty2 = (
				(type_match ty1 ty2;
				type_match ty2 ty1;
				true)
				handle Fail _ => false
			);
			fun chk [] = []
			|   chk ((s, ty) :: more) = (
				case get_const_type s of
					Value t => (
						if same_ty ty t
						then chk more
						else mk_const (s, ty) :: chk more
				) |	Nil => mk_const (s, ty) :: chk more
			);
		in	case chk things_to_check of
				[] => ()
			|	tms =>
				fail "freetype_defn" 49005
				[fn () => format_list string_of_term tms " "]
		end
	);
=TEX
And, at long last, the function to bring all the above together.
=SML
in
fun ⦏freetype_defn⦎ ([] : (string * ((string * TERM OPT)list))list) : unit = (
	error "freetype_defn" 49004 [fn()=>"unexpected empty list"]
) | ⦏freetype_defn⦎ ftyl : unit = (
let	val (tynames, parss) = split ftyl;
	val side_effect = fty_scope_check();
	val side_effect = map (map (check_gvar_name o fst)) parss;
	val tys = map (fn tyn => mk_ctype(bind_gvar_name tyn, [])) tynames;
	val ptys = (map mk_z_power_type) tys;
	val nptys = combine tynames ptys;
	val ftys = map (fn (n, t) => mk_z_gvar(n, t, [])) nptys;
	val lvs = map mk_var nptys;
	val wns = map (fn s => "W"^s)
		(case ftyl of [_] => [""]
		| _ => map string_of_int (interval 1 (length ftyl)));
	val gsubs = combine ftys lvs;
	val bss = map make_constructors
		(combine tynames (combine tys (combine ftys parss)));
	val decs = flat (map make_ft_decs (combine ftys (combine tys bss)));
	val disjs = map (make_ft_disjoint gsubs) (combine tys bss);
	val ws = list_variant (lvs @ flat (map frees disjs))
			 (map mk_var (combine wns ptys));
	val wsubs = combine ws lvs;
	val ind_pred = make_ft_ind_pred ftys tys wsubs bss;
	val decl = subst gsubs (mk_z_decl decs);
	val pred = list_mk_∧ (disjs @ [ind_pred]);
	val vs = map (dest_var o fst) (flat bss);
in	givenset_defn (tynames, Nil);
	ax_axdes_defn ([], decl, Value pred, vs)
end);
end (* of local ... in ... end *)
=TEX
=SML
fun ⦏next_axiom_name⦎ (s : string) : string = (
let	val axiom_names = flat (map fst (get_axioms "-"));
	fun aux i =
	let	val si = s^(string_of_int i);
	in	if si mem axiom_names
		then	aux (i+1)
		else	si
	end;
in
	aux 1
end);
=TEX
=SML
fun ⦏constraint_defn⦎  ((gpars, tm) : string list * TERM) : unit = (
let	val vs = map (fn n => mk_var(n, mk_z_power_type(mk_vartype("'" ^ n)))) gpars;
	val tm1 = list_mk_∀(vs, tm);
	val con_nm = next_axiom_name "Constraint ";
	val dummy =
	let	val fs = frees tm1;
		val inform = if !z_allow_free_vars_in_axioms then warn else fail;
	in 	if	is_nil fs
		then	()
		else	inform
			"update_theory_db_with_parainfo" 49006
			[fn () => con_nm,
			 fn () => format_list (fst o dest_var) fs ", "]

	end;
in	new_axiom([con_nm], tm1); ()
end);
=TEX
=SML
fun ⦏axdes_or_constraint_defn⦎
	(axdes_defn : string list * TERM * TERM OPT * (string * TYPE) list -> unit)
	(pars as (gen_formals, _, otm, idtyl)
		: string list * TERM * TERM OPT * (string * TYPE) list) : unit = (
case idtyl of
	[]	=> (
		let	val tm = case otm of
			  Value tm	=> tm
			| _		=> mk_z_true;
		in	constraint_defn (gen_formals, tm)
		end
	)
|	_::_	=> axdes_defn pars
);
=SML
fun ⦏next_conjecture_name⦎ (s : string) : string = (
let	val conjecture_names = flat (map fst (get_conjectures "-"));
	fun aux i =
	let	val si = s^(string_of_int i);
	in	if si mem conjecture_names
		then	aux (i+1)
		else	si
	end;
in
	aux 1
end);
=TEX
=SML
fun ⦏conjecture_defn⦎  ((nopt, gpars, tm) : string OPT * string list * TERM) : unit = (
let	val vs = map (fn n => mk_var(n, mk_z_power_type(mk_vartype("'" ^ n)))) gpars;
	val gtm = list_mk_∀(vs, tm);
	val conj_nm = case nopt of
		Value n => n
	|	Nil => next_conjecture_name "Conjecture ";
	val dummy =
	let	val fs = frees gtm;
		val inform = if !z_allow_free_vars_in_axioms then warn else fail;
	in 	if	is_nil fs
		then	()
		else	inform
			"update_theory_db_with_parainfo" 49006
			[fn () => conj_nm,
			 fn () => format_list (fst o dest_var) fs ", "]

	end;
in	
	new_conjecture([conj_nm], gtm)
end);
=TEX
=SML
fun ⦏typecheck_info_defn⦎ (consts : (string * TYPE) list, tys : (string * int) list)
			: unit = (
let	fun tco_gen_z_semantic_types (ty : TYPE) = (
		let	val (tyn, tyargs) = dest_ctype ty;
		in	(new_type(tyn, length tyargs); ()) handle Fail _ => ();
			map tco_gen_z_semantic_types tyargs;
			()
		end	handle Fail _ => ()
	);
	val side1 = map (tco_gen_z_semantic_types o snd) consts;
	val side2 =
		case list_cup (map (fn ty => new_type_clashes ty) tys) of
		[] => map new_type_nofail tys
		|failures => fail "update_theory_db" 62998
=POLYML
				[fn ()=>PolyML.makestring failures];
=NJML
				[fn ()=>"attempt to redefine type"];
=SML
in
	z_replace_consts consts
end
);
=TEX
=SML
fun ⦏ax_update_theory_db⦎ (para : PARAINFO) : unit = (
	case para of
	FixityInfo fixinfo => set_zfixity_info fixinfo
	|AbbDefInfo pbody => abbdef_defn false pbody
	|SchBoxInfo pbody => abbdef_defn true pbody
	|AxDesInfo pbody => axdes_or_constraint_defn ax_axdes_defn pbody
	|GivenSetInfo pbody => givenset_defn pbody
	|FreeTypeInfo pbody => freetype_defn pbody
	|ConstraintInfo pbody => constraint_defn pbody
	|ConjectureInfo pbody => conjecture_defn pbody
	|TypeCheckInfo t => typecheck_info_defn t
);
=TEX
=SML
fun ⦏cons_update_theory_db⦎ (para : PARAINFO) : unit = (
	case para of
	FixityInfo fixinfo => set_zfixity_info fixinfo
	|AbbDefInfo pbody => abbdef_defn false pbody
	|SchBoxInfo pbody => abbdef_defn true pbody
	|AxDesInfo pbody => axdes_or_constraint_defn cons_axdes_defn pbody
	|GivenSetInfo pbody => givenset_defn pbody
	|FreeTypeInfo pbody => freetype_defn pbody
	|ConstraintInfo pbody => constraint_defn pbody
	|ConjectureInfo pbody => conjecture_defn pbody
	|TypeCheckInfo t => typecheck_info_defn t
);
=TEX
The following function returns the current level for the specified theory.
This is used to undo partial theory updates.

=SML
val ⦏current_level⦎ : unit -> int =
	(#current_level o #contents o get_theory_info o
		get_current_theory_name);
=TEX
Delete anything in the current theory with a level greater than the given
value, assuming deletion is possible.
=SML
fun ⦏delete_top_theory_past_level⦎  (level : int) : unit = (
let	val dummy = case (get_current_theory_status()) of
		TSNormal => ()
		| TSDeleted => error "update_theory_db_with_parainfo" 6008
			[fn () => get_current_theory_name()]
		| TSLocked => fail "update_theory_db_with_parainfo" 6037
			[fn () => get_current_theory_name()]
		| TSAncestor => fail "update_theory_db_with_parainfo" 6071
			[fn () => get_current_theory_name()];

	val {children = children,...} = get_theory_info "-";

	val {con_env = oe_con_env,ty_env = oe_ty_env,
		axiom_dict = oe_axiom_dict, thm_dict = oe_thm_dict,
		defn_dict = oe_defn_dict,...} = get_theory "-";

	val con_env = oe_flatten oe_con_env;

	val ty_env = oe_flatten oe_ty_env;

	val axiom_dict = oe_flatten oe_axiom_dict;

	val thm_dict = oe_flatten oe_thm_dict;

	val defn_dict = oe_flatten oe_defn_dict;

	val (del_con,del_lev1) = split (map (fn (name,{ty = ty,level = lev,...}) =>
			((name, ty),lev))
		(con_env drop (fn (_,{level = lev,...}) => lev <= level)));

	val (del_type,del_lev2) = split(map (fn (name,{level = lev,...}) => (name,lev))
		(ty_env drop (fn (_,{level = lev,...}) => lev <= level)));

	val del_type_arities = map (fn ty =>
		case get_type_info ty of
		Nil => error "update_theory_db_with_parainfo" 49999 []
		|Value (ar, _) => (ty, ar)) del_type;

	val del_thms = map (fn (key,_) => key)
		(thm_dict drop (fn (_,thm) =>
			let val {level = lev,...} = pp'Kernel.pp'dest_thm thm
			in lev <= level end));

	val (del_axioms, del_lev3) = split(map (fn (key,thm) => (key,
			let val {level = lev,...} = pp'Kernel.pp'dest_thm thm
			in lev end))
		(axiom_dict drop (fn (_,thm) =>
			let val {level = lev,...} = pp'Kernel.pp'dest_thm thm
			in lev <= level end)));

	val (del_defns, del_lev4) = split(map (fn (key,thm) => (key,
			let val {level = lev,...} = pp'Kernel.pp'dest_thm thm
			in lev end))
		(defn_dict drop (fn (_,thm) =>
			let val {level = lev,...} = pp'Kernel.pp'dest_thm thm
			in lev <= level end)));

	val dl = list_cup[del_lev1, del_lev2, del_lev3, del_lev4];
	val dummy = map delete_thm del_thms;
in
	if (is_nil dl)
	then ()
	else if children <> []
	then fail "update_theory_db_with_parainfo"
		 6076 [fn () => get_current_theory_name()]
	else ( map (fn x => pp'Kernel.pp'delete_extension ()) dl;
		kernel_interface_diagnostics true;
		open_theory"-";
		())
end);
=TEX

=SML
fun ⦏update_theory_db_with_parainfo⦎ (para : PARAINFO) : unit = (
let val curr_level = current_level ();
in
	((if get_flag "z_use_axioms"
	then ax_update_theory_db
	else cons_update_theory_db) para
	handle (exn as Fail f) =>
	(
        delete_top_theory_past_level curr_level
	 handle (exn1 as Fail f) =>
	  (diag_line (get_error_message 49007 [get_message f]));
	 raise exn
	))
end);
=TEX
=SML
val ⦏update_theory_db⦎ : Z_PARA -> unit = (
	(update_theory_db_with_parainfo o parainfo_of_z_para)
);
=TEX

=SML
end (* of local ... in *);
end (* of structure ZParagraphs *);
=TEX


\section{THE STRUCTURE FOR Z PARAGRAPH PROCESSORS}

=SML
structure ⦏ZParagraphRecognizers⦎ : ZParagraphRecognizers = struct
=TEX
=SML
local
	open Lex SymbolTable ReaderWriterSupport;
	open HOLReaderWriter PrettyNames;
	open ZReaderWriter;
	open ZUserInterfaceSupport ZLex ZParser ZTypeInference ZTermGenerator;
in

val ⦏standard_z_paras⦎ = ref true;

val _ = if contains (map fst (get_flags()))
			"standard_z_paras"
	then	()
	else	new_flag{name = "standard_z_paras",
			control = standard_z_paras,
			default = fun_true,
			check = fun_true
	};

val ⦏standard_z_terms⦎ = ref false;

val _ = if contains (map fst (get_flags()))
			"standard_z_terms"
	then	()
	else	new_flag{name = "standard_z_terms",
			control = standard_z_terms,
			default = fun_false,
			check = fun_true
	};
=TEX


\subsection{Processing Z Terms}

=SML
fun ⦏term_of_z_para⦎ ((ZParaTerm (gpars, tm, _)) : Z_PARA) : TERM = (
let	val vns = map string_of_ident gpars;
	val vs = map (fn vn => mk_var(vn, mk_z_power_type(mk_vartype ("'" ^ vn))))
			vns;
in	list_mk_∀(vs, term_of_z_tm tm)
end
) | term_of_z_para _ = (
fail "z_term_recogniser" 49001 []
);
=TEX

=SML
fun ⦏z_para_of_zinferred⦎ ((ZInferred p) : Z_INFERRED) : Z_PARA = (
	p
) | z_para_of_zinferred (ZTypeError inf) = (
	print_z_error inf
);
=TEX


\section{THE STRUCTURE FOR Z PARAGRAPHS}


The first thing to do is to tell the reader/writer about the
Z paragraph delimiting symbols.

=SMLLITERAL

val _ = add_new_symbols [
	([	"SZG"],	Value "╒", Starting(specific_quotation, "")),
	([	"SZS"],	Value "┌", Starting(specific_quotation, "")),
	([	"EZ"],		Value "└", Ending ""),
	([	"SZT"],	Value "ⓩ", Starting(general_quotation, ""))
] handle (Fail _) => ();
=TEX
The true box recognizers (generic constants and schema boxes) use the
new Z reader. The other boxes can use the HOL reader.
=SML
val ⦏z_axbox_reader⦎ = HOL_reader "z_axbox_recogniser" true;
val ⦏z_genbox_reader⦎ = Z_reader "z_genbox_recogniser" true "═";
val ⦏z_schbox_reader⦎ = Z_reader "z_schbox_recogniser" true "─";
val ⦏z_term_reader⦎ = HOL_reader "z_term_recogniser" false;
val ⦏z_decl_reader⦎ = HOL_reader "z_decl_recogniser" false;
val ⦏z_other_reader⦎ = HOL_reader "z_other_recogniser" true;
=TEX
=SMLLITERAL
val _ = map add_named_reader [
	("Ⓢ", "ZAX", "Lex.Term", z_axbox_reader),
	("Ⓢ", "Z", "Lex.Term", z_other_reader)
	] handle (Fail _) => [];

val _ = map add_specific_reader [
	("╒", "Lex.Term", z_genbox_reader),
	("┌", "Lex.Term", z_schbox_reader)
	] handle Fail _ => [];
val _ = map add_general_reader [
	("⌜", "Z", "Lex.Term", z_term_reader),
	("ⓩ", "", "Lex.Term", z_term_reader)
	] handle Fail _ => [];
val _ = add_general_reader("ⓩ", ":", "Lex.Term", z_decl_reader);
=TEX
\section{PARAGRAPH RECOGNIZERS}

\subsection{Z Axiomatic Box Recogniser}

=SML
fun ⦏z_axbox_recogniser⦎ (start:string, lang:string, value:INPUT list, finish:string) = (
let	val side_effect =
		if	is_same_symbol(start, "Ⓢ")
			andalso	is_same_symbol(finish, "■")
			andalso	(lang = "ZAX")
		then	()
		else
			fail "z_axbox_recogniser" 49001 [
				fn () => start,
				fn () => lang,
				fn () => finish];
	val standard = get_flag "standard_z_paras";
	val zafvia = get_flag "z_allow_free_vars_in_axioms";
	val tokens = ZTAx::(z_lex value);
	val parsed = z_parser {is_quot = false} tokens;
	val type_checked = type_check_z_para
				{standard = standard, allow_frees = zafvia} parsed;
	val para = z_para_of_zinferred type_checked;
in
	(ZParagraphs.update_theory_db para)
	handle ex => reraise ex "z_axbox_recogniser"
end);

=TEX
\subsection{Z Generic Box Recogniser}
=SML
fun ⦏z_genbox_recogniser⦎ (start:string, lang:string, value:INPUT list, finish:string) = (
let	val side_effect =
		if	is_same_symbol(start, "SZG")
			andalso	is_same_symbol(finish, "EZ")
			andalso	(lang = "")
		then	()
		else
			fail "z_genbox_recogniser" 49002 [
				fn () => start,
				fn () => lang,
				fn () => finish];
	val standard = get_flag "standard_z_paras";
	val zafvia = get_flag "z_allow_free_vars_in_axioms";
	val tokens = ZTAx::(z_lex value);
	val parsed = z_parser {is_quot = false} tokens;
	val type_checked = type_check_z_para
				{standard = standard, allow_frees = zafvia} parsed;
	val para = z_para_of_zinferred type_checked;
in
	(ZParagraphs.update_theory_db para)
	handle ex => reraise ex "z_genbox_recogniser"
end);

=TEX
\subsection{Z Schema Box Recogniser}
=SML
fun ⦏z_schbox_recogniser⦎ (start:string, lang:string, value:INPUT list, finish:string) = (
let	val side_effect =
		if	is_same_symbol(start, "SZS")
			andalso	is_same_symbol(finish, "EZ")
			andalso	(lang = "")
		then	()
		else
			fail "z_schbox_recogniser" 49003 [
				fn () => start,
				fn () => lang,
				fn () => finish];
	val standard = get_flag "standard_z_paras";
	val zafvia = get_flag "z_allow_free_vars_in_axioms";
	val tokens = ZTSch::(z_lex value);
	val parsed = z_parser {is_quot = false} tokens;
	val type_checked = type_check_z_para
				{standard = standard, allow_frees = zafvia} parsed;
	val para = z_para_of_zinferred type_checked;
in
	(ZParagraphs.update_theory_db para)
	handle ex => reraise ex "z_schbox_recogniser"
end);
=TEX
\subsection{Z General Text Recogniser}
=SML
fun ⦏z_other_recogniser⦎ (start:string, lang:string, value:INPUT list, finish:string) = (
let	val side_effect =
		if	is_same_symbol(start, "Ⓢ")
			andalso	is_same_symbol(finish, "■")
			andalso	(lang = "Z")
		then	()
		else
			fail "z_other_recogniser" 49004 [
				fn () => start,
				fn () => lang,
				fn () => finish];
	val standard = get_flag "standard_z_paras";
	val zafvia = get_flag "z_allow_free_vars_in_axioms";
	val tokens = z_lex value;
	val parsed = z_parser {is_quot = false} tokens;
	val type_checked = type_check_z_para
				{standard = standard, allow_frees = zafvia} parsed;
	val para = z_para_of_zinferred type_checked;
in
	(ZParagraphs.update_theory_db para)
	handle ex => reraise ex "z_other_recogniser"
end);
=TEX
\section{RECOGNIZING Z TERMS}

=SML
fun ⦏z_term_recogniser⦎ (start:string, lang:string, value:INPUT list, finish:string) = (
let	val side_effect =
		if(	is_same_symbol(start, "SZT")
			andalso	is_same_symbol(finish, ">")
			andalso	(lang = "")
		) orelse (
			is_same_symbol(start, "<")
			andalso	is_same_symbol(finish, ">")
			andalso	lang = "Z"
		)
		then	()
		else
			fail "z_term_recogniser" 49010 [
				fn () => start,
				fn () => lang,
				fn () => finish];
	val standard = get_flag "standard_z_terms";
	val tokens = z_lex value;
	val parsed = z_parser {is_quot = true} tokens;
	val side = case parsed of
		ZParaTerm _ => ()
		|_ => fail "z_term_recogniser" 49001 [];
	val type_checked = type_check_z_para
				{standard = standard, allow_frees = true} parsed;
	val para = z_para_of_zinferred type_checked;
in	term_of_z_para para
end);

=TEX
\section{RECOGNIZING Z DECLARATIONS}
=TEX
Declarations are parsed by wrapping the declaration up as the declaration
part of a horizontal schema, parsing that as a term and then extracting
the declaration:
=SML
fun ⦏z_decl_recogniser⦎ (start:string, lang:string, value:INPUT list, finish:string) = (
let	val side_effect =
		if(	is_same_symbol(start, "SZT")
			andalso	is_same_symbol(finish, ">")
			andalso	(lang = ":")
		) orelse (
			is_same_symbol(start, "<")
			andalso	is_same_symbol(finish, ">")
			andalso	lang = "Z"
		)
		then	()
		else
			fail "z_decl_recogniser" 49010 [
				fn () => start,
				fn () => lang,
				fn () => finish];
	val standard = get_flag "standard_z_terms";
	val tokens = ZTLsqbrack:: (rev o tl o rev o z_lex) value @
			[ZTVert, ZTId "true", ZTRsqbrack, ZTEos];
	val parsed = z_parser {is_quot = true} tokens;
	val side = case parsed of
		ZParaTerm _ => ()
		|_ => fail "z_decl_recogniser" 49001 [];
	val type_checked = type_check_z_para
				{standard = standard, allow_frees = true} parsed;
	val para = z_para_of_zinferred type_checked;

	val hschema = term_of_z_para para;
in	(fst o dest_z_h_schema) hschema
end);


=TEX

\section{EPILOGUE}

The structure for Z paragraphs is required to be open for use by the
reader/writer.

=SML
end (* of local ... in *);
end (* of structure ZParagraphRecognizers *);
open ZParagraphRecognizers;
=TEX

\twocolumn[\section{INDEX OF DEFINED TERMS}]
\printindex
\end{document}


=IGN

val x= mk_z_app (ⓩ{(a,b)}⌝, ⓩy⌝);

new_axiom(["thing"],x);

PolyML.cd"../ied";
use_file"dtd050";
use_file"imp050";
use_file"imp063";
use_file"dtd049";
use_file"imp049";
open_theory"z_library";
force_delete_theory"mdt049_tco";
force_delete_theory"mdt049_ax";
force_delete_theory"mdt049_cons";
set_pc"z_predicates";
use_file"mdt049";
get_types"cache'daz";
get_types"mdt049_tco";
get_types"mdt049_ax";
get_types"mdt049_cons";

get_consts"cache'daz";
get_consts"mdt049_tco";
open_theory"cache'daz";
delete_type"Z'S[x,y,z]";
open ZGeneratedConstants;
binding_type_spec ((dest_z_power_type o type_of) ⓩ[x,y,z : ℕ]⌝);


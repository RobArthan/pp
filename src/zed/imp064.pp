=IGN
********************************************************************************
imp064.doc: this file is part of the PPZed system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% imp064.doc   ℤ $Date: 2011/07/16 15:14:20 $ $Revision: 1.63 $ $RCSfile: imp064.doc,v $

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

\def\Title{Implementation of the Z Pretty Printer}

\def\AbstractText{This document contains the implementation of the Z pretty printer.}

\def\Reference{DS/FMU/IED/IMP064}

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
%% LaTeX2e port: % imp064.doc   ℤ $Date: 2011/07/16 15:14:20 $ $Revision: 1.63 $ $RCSfile: imp064.doc,v $
%% LaTeX2e port: \documentstyle[hol1,11pt,TQ]{article}
%% LaTeX2e port: 
%% LaTeX2e port: \TPPtitle{Implementation of the Z Pretty Printer}
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP064}
%% LaTeX2e port: \def\SCCSissue{$Revision: 1.63 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSissue}
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2011/07/16 15:14:20 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPproject{FST PROJECT}
%% LaTeX2e port: 
%% LaTeX2e port: =IGN
%% LaTeX2e port: 
%% LaTeX2e port: Commands to process this document in various ways.
%% LaTeX2e port: 
%% LaTeX2e port: make -f rel001.mkf imp064.dvi
%% LaTeX2e port: doctex imp064
%% LaTeX2e port: texdvi imp064
%% LaTeX2e port: bibtex imp064
%% LaTeX2e port: doctex imp064 ; texdvi imp064
%% LaTeX2e port: doctex imp064 ; texdvi imp064 ; bibtex imp064
%% LaTeX2e port: dvipage imp064 &
%% LaTeX2e port: 
%% LaTeX2e port: 
%% LaTeX2e port: docsml imp064
%% LaTeX2e port: use_file "imp064.sml";
%% LaTeX2e port: 
%% LaTeX2e port: lasp -s imp064.doc > zz1
%% LaTeX2e port: lasp -s -u imp064.OKwords imp064.doc > zz1
%% LaTeX2e port: 
%% LaTeX2e port: =TEX
%% LaTeX2e port: %\TPPstatus{Approved}
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: \TPPtype{Standard}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{A.J. Hammon & WIN01}  %% Mandatory field
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document contains the implementation of the
%% LaTeX2e port: 	Z~pretty printer.}
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
\underscoreoff
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

\item[Issues 1.1 (1992/07/08) to 1.12 (1992/08/07) ]
	Initial drafts.

\item[\FormatDate{92/08/24}, issue 1.14]
	Bring precedences into line with~\cite{DS/FMU/IED/DEF007}.
	Omit references to $Totality$ and $U[Totality]$ as generic arguments.
	Omit the `$|true$' in schema texts.
	Output correct Z term quotation symbol.

\item[\FormatDate{92/10/30}, issue 1.16]
	Reissue after basic testing.
\item[\FormatDate{92/11/02}, issue 1.17]
	Corrected treatment of fancyfix forms.
\item[\FormatDate{92/11/30}, issue 1.18]
	Corrected bracketing of cartesian products.
\item[\FormatDate{92/12/03}, issue 1.19]
	First attempt at handling of generic predicates.
\item[issue 1.20]
	Fixed two bugs.
\item[Issue 1.21 (1992/12/10) (10th December 1992)]
	Global rename from wrk038.doc issue 1.9.
\item[Issue 1.22 (1993/02/18) (18th February 1993)]
	Fixed bug HAT 97.
\item[Issue 1.23 (1994/06/22) (23rd June 1994)]
	Fixed bug HAT 162.
\item[Issue 1.24 (1997/04/23) (1st May 1997)]
	Fixing bug HAT 64 (printing set abstractions with single schema in declaration).
\item[Issue 1.25 (1997/05/02)--1.27 (2000/06/30)]
	Addressed need to handle $\mu$-expressions with the part after the bullet omitted.
\item[Issue 1.28 (2002/01/23)] Support for left associative operators.
\item[Issue 1.29 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.30 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.32 (2004/01/19)] The Z universal set is now called 𝕌.
\item[Issue 1.33 (2004/01/25)] Addressed problem with left associative operators of equal precedence.
\item[Issue 1.34 (2004/07/09)] Allowed for rationalisation of the pretty-printer support interface.
\item[Issue 1.35 (2004/08/26)] Accomodated new data types for representing precedences and so fixed problem with pretty-printing of the tuple and binding selection operator `.' (which is left-associative).
\item[Issue 1.36 (2004/10/10)] Fixed precedence of $\theta$-operator relative to application.
\item[Issue 1.37 (2005/02/21)] Fixed problem with relation symbols like {\it\_partition\_} which should not be treated as infix generics.
\item[Issue 1.38 (2005/05/07)] Allowed for changes to fixity datatypes.
\item[Issue 1.39 (2005/05/18)] Improved bracket-elimination for tuple and binding selection.
\item[Issue 1.40 (2005/06/17)] Fixed bracket-elimination for curried function application.
\item[Issue 1.41 (2005/08/03)] Schema projection is now left-associative.
\item[Issue 1.42 (2005/09/06)] Added let-expressions.
\item[Issue 1.43 (2005/09/09)] Allowed for new forms of stubs in templates.
\item[Issue 1.44 (2005/09/10)] Allowed for \$-feature (and fixed infelicities in identifying genuine Z variable names).
\item[Issue 1.45 (2005/09/13)] Option to require all schema operators to be distinguished with a subscript `s'.
\item[Issue 1.46 (2006/01/12)] Allowed for correction to let-expression syntax.
\item[Issue 1.47 (2006/01/23)] Now uses proper SML escape sequences in string displays.
\item[Issue 1.48 (2006/01/24)] New improved \$-feature; now uses HOL quotations to print invalid variable names.
\item[Issue 1.49 (2006/01/24), 1.50 (2006/01/25)] Now have full support for decorated fancyfix identifiers (e.g., as signature variables).
\item[Issue 1.52 (2006/04/20)] Added support for floating point literals.
\item[Issue 1.53 (2006/08/08)] Now allows for possibility of the calls to {\em z\_lex} failing.
\item[Issue 1.54 (2006/12/02)] {\em string\_of\_float} renamed as {\em z\_string\_of\_float}.
\item[Issues 1.55 (2007/08/03), 1.56 (2007/08/03)] Fixed and improved support for dollar-quoted identifiers.
\item[Issue 1.57 (2008/07/24)] Added flag that lets the Compliance Tool have Quine corners around Z strings.
\item[Issue 1.58 (2008/09/05)] Quine corners are now only around Z strings that contain control or escape characters \ldots
\item[Issue 1.59 (2009/03/24)] \ldots or the letter `Q'.
\item[Issue 1.60 (2010/04/05)] Support for empty schemas.
\item[Issue 1.61 (2010/04/05)] Horizontal schema with single schema reference declaration always has predicate part printed.
\item[Issue 1.62 (2011/07/14)] Fixed bugs in {\em do\_generic} and {\em do\_decor}.
\item[Issue 1.63 (2011/07/16)] Fixed bug with %\mu$- and %\lambda$-expressions.
\item[Issue 1.64 (2014/01/07)] Made it use the new support for parsing declarations.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported PPZed to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}

%********************************************************************

\subsection{Changes Forecast} \label{ChangesForecast}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\section{GENERAL}

%********************************************************************

\subsection{Scope}

This document contains the pretty printer for the Z proof support
system.  The detailed level design for this document
in~\cite{DS/FMU/IED/DTD064}.

%********************************************************************

\subsection{Introduction}

%--------------------------------------------------------------------

\subsubsection{Purpose and Background}

%--------------------------------------------------------------------

\subsubsection{Dependencies}

%--------------------------------------------------------------------

\subsubsection{Interface}

%--------------------------------------------------------------------

\subsubsection{Algorithms}

%--------------------------------------------------------------------

%\subsubsection{Possible Enhancements}
%\subsubsection{Deficiencies}
%\subsubsection{Terminology}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%\newpage
\section{STRUCTURE} \label{StartStructure}

=SML
structure ⦏ZPrettyPrinter⦎ : ZPrettyPrinter = struct
=TEX

=SML
open PrettyPrinterSupport ZTypesAndTermsSupport;
infix gt_prec;
open ZUserInterfaceSupport;
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\section{UTILITIES}

=SML
fun ⦏show_comma_list_of_strings⦎ (addstring : string -> unit)
		(space : int * int -> unit) (strs : string list) : unit = (
let
	fun aux [] = ()
	| aux (t1::[]) = addstring t1
	| aux (t1::more) = (
		addstring t1;
		addstring ",";
		space(1, 0);
		aux more
	)
in
	aux strs
end
);
=TEX
=SML
fun ⦏sub_schema_op⦎ (so : string) : string = (
	if	subscript_z_schema_ops ()
	then	so ^ "⋎s"
	else	so
);
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\section{PRECEDENCES}

Rather than place lots of numeric precedence codes in the code we
declare several precedence codes here.  Syntax rules refer to
productions from the Z~grammar of~\cite{DS/FMU/IED/DEF007}.
Precedence value names are based upon the names of syntax
rules from~\cite{DS/FMU/IED/DEF007}.
These declarations are given in order with the loosely
binding first and most tightly binding at the end.

=SML
val pc_sch0_quant : OP_PREC = PcNormal(0, 10, Lex.RightAssoc);
=TEX

All schema infix operators are left associative.

=SML
val pc_sch2_⨾ : OP_PREC = PcNormal(20, 40, Lex.RightAssoc);
val pc_sch2_↾ : OP_PREC = PcNormal(20, 50, Lex.LeftAssoc);
val pc_sch2_⇔ : OP_PREC = PcNormal(20, 60, Lex.RightAssoc);
val pc_sch2_⇒ : OP_PREC = PcNormal(20, 70, Lex.RightAssoc);
val pc_sch2_∨ : OP_PREC = PcNormal(20, 80, Lex.RightAssoc);
val pc_sch2_∧ : OP_PREC = PcNormal(20, 100, Lex.RightAssoc);

val pc_sch3_pre : OP_PREC = PcNormal(30, 0, Lex.RightAssoc);
val pc_sch4_ref : OP_PREC = PcNormal(40, 0, Lex.RightAssoc);
val pc_sch4_hide : OP_PREC = PcNormal(40, 10, Lex.RightAssoc);
=TEX

=SML
val pc_pred1 : OP_PREC = PcNormal(100, 0, Lex.RightAssoc);
val pc_pred1_quant : OP_PREC = PcNormal(100, 10, Lex.RightAssoc);
=TEX

=SML
val pc_pred2_⇔ : OP_PREC = PcNormal(150, 10, Lex.RightAssoc);
val pc_pred2_⇒ : OP_PREC = PcNormal(150, 20, Lex.RightAssoc);
val pc_pred2_∨ : OP_PREC = PcNormal(150, 30, Lex.RightAssoc);
val pc_pred2_∧ : OP_PREC = PcNormal(150, 40, Lex.RightAssoc);

val pc_pred3_¬ : OP_PREC = PcNormal(150, 50, Lex.RightAssoc);

=SML
val pc_expr0_λ_μ_let : OP_PREC = PcNormal(160, 0, Lex.RightAssoc);
=TEX
Relational operators have, in effect, the same precedence as $=$ and $∈$.
=SML
val pc_pred4_eq : OP_PREC = PcNormal(170, 0, Lex.RightAssoc);
val pc_pred4_∈ : OP_PREC = PcNormal(170, 0, Lex.RightAssoc);
val pc_pred4_rel : OP_PREC = PcNormal(170, 0, Lex.LeftAssoc);
=TEX
Cartesian product symbol behaves like an infix operator with precedence 8 from the parsing point of view.
(Earlier versions of {\ProductZ} were more complicated in this area. The current approach is similar to the ISO Standard for Z).



Syntax rule $Expr1$ captures the fancy fix generic and function operators and also the Cartesian product.
Cartesian product symbol behaves like an infix operator with precedence 8 from the phrase recognition point of view.
However a Cartesian product must always be bracketed when it appears as the operand of an outer Cartesian product.

(Earlier versions of {\ProductZ} were more complicated in this area. The current approach is similar to the ISO Standard for Z).

Hence we have special cases for the Cartesian product as an operand
of something else and one for one of its operands.

=SML
fun pc_expr1_normal (p:int, assoc : ASSOC) : OP_PREC = PcNormal(206, p,
	if assoc = RightAssoc then Lex.RightAssoc else Lex.LeftAssoc);
val pc_expr1_×_low : OP_PREC = PcNormal(205, 0, Lex.RightAssoc);
val pc_expr1_×_normal : OP_PREC = PcNormal(206, 8, Lex.RightAssoc);

=TEX

=SML
val pc_expr2_ℙ : OP_PREC = PcNormal(210, 20, Lex.RightAssoc);
=TEX

=SML
val pc_expr3 : OP_PREC = PcNormal(220, 0, Lex.LeftAssoc);
val pc_expr3_lhs : OP_PREC = pc_expr3;
val pc_expr3_rhs : OP_PREC = PcNormal(220, 20, Lex.RightAssoc);
val pc_expr3_θ : OP_PREC = PcNormal(220, 10, Lex.LeftAssoc);
=TEX

=SML
val pc_expr4 : OP_PREC = PcNormal(230, 0, Lex.RightAssoc);
val pc_expr4_gvar : OP_PREC = PcNormal(230, 10, Lex.RightAssoc);
val pc_expr4_schref : OP_PREC = PcNormal(230, 20, Lex.RightAssoc);
val pc_expr4_sel : OP_PREC = PcNormal(230, 30, Lex.LeftAssoc);
=TEX
$pc_decor_op$ is the context for the operand of a decoration operation.
$pc_decor$ is the context for the decoration operation itself.

=SML
val pc_decor : OP_PREC = PcNormal(250, 0, Lex.RightAssoc);
val pc_decor_op : OP_PREC = PcNormal(250, 1, Lex.RightAssoc);
=TEX
=SML
val pc_schema_name : OP_PREC = PcNormal(300, 10, Lex.RightAssoc);
val pc_dec_name : OP_PREC = PcNormal(300, 20, Lex.RightAssoc);
val pc_dec_var_name : OP_PREC = PcNormal(300, 30, Lex.RightAssoc);
val pc_var_name : OP_PREC = PcNormal(300, 40, Lex.RightAssoc);
=TEX

=SML
val pc_force_brackets : OP_PREC = PcLowest;
=TEX

Need some further functions for manipulating precedences.
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\section{OUTPUT SUPPORT FUNCTIONS}
=TEX
The following has been superseded by the
=INLINEFT
ⓩ: ... ⌝
=TEX
\ syntax for entering declarations but is retained for backwards compatibility.
=SML
fun ⦏decl_of⦎ (tm : TERM) = (
	(fst (dest_z_h_schema tm)) handle ex => reraise ex "decl_of"
);
=TEX
The following is still used.
=SML
fun ⦏dec_of⦎ (tm : TERM) = (
	case dest_z_decl (decl_of tm) handle ex => reraise ex "dec_of" of
		[] => term_fail "dec_of" 64001 [tm]
	|	(h :: _) => h
);
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
=TEX
\subsection{GENERIC PREDICATES}
Generic predicates are represented as HOL universals. There are two
problems associated with them: {\em(i)} not all HOL universals
represent a generic predicate (in fact, a HOL universal is only
a generic predicate if it only binds simple variables (not varstructs)
and if each variable, $X$, has type, $'X\,SET$; {\em(ii)} the generic
parameter list which begins a generic predicate is only allowed immediately
after a start of quotation symbol.
We solve these problems by
applying a higher-order function to $main\_term\_pp$ which ensures that
the nested calls will revert to HOL where necessary and will in
any case be enclosed in the appropriate Quine corners.

THe approach chosen is seems to be the best which can be done without
some form of modification to the pretty printer support structure
of \cite{DS/FMU/IED/DTD031}. The main disadvantage is that at the outermost
level of quotation, a HOL universal which is not a generic predicate
will get printed as $ⓩ⌜...⌝⌝$, because the Z pretty printer is unable to
prevent $main\_term\_pp$ from inserting the Z corners once it has decided
that $∀$ is in the Z language.
=SML
fun ⦏is_gen_par⦎ (v : TERM) : bool = (
	let	val (n, ty) = dest_var v;
		val tyvn = dest_vartype (dest_z_power_type ty);
	in	"'" ^ n = tyvn
	end	handle Fail _ => false
);
=TEX
=SML
fun ⦏recur_pp⦎ (env : PP_ENV) (tm : TERM) = (
	let	val (v, _) = dest_simple_∀ tm;
	in	if is_gen_par (fst (dest_simple_∀ tm))
		then (
			start_new_language env "Z";
			main_term_pp env tm;
			conclude_new_language env "Z"
		) else
			let	val  new_env = set_env_for_language "HOL" env;
			in	start_new_language new_env "HOL";
				main_term_pp new_env tm;
				conclude_new_language new_env "HOL"
			end
	end	handle Fail _ => main_term_pp env tm
);
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
=TEX

\section{BRACKET GENERATION}

We have many small sections of code which need to enclose something
in round brackets if the precedences require.  Function $bracket$
does this for us.

Argument $block$ indicates whether an Oppen block is required or may be
omitted, if brackets are inserted then a block is always generated.
Argument $how$ is a function that does the actual printing of the
enclosed text.

The precedence of the enclosed text is not $PcLowest$ as might be
expected between the brackets.  This is because we are providing the
precedence enclosure for any complex expression.  If the enclosed text
requires special treatment of the precedences within itself then the
$how$ function must set the precedences appropraitely.

=SML
fun ⦏bracket⦎ (cur_env:PP_ENV, enclosed_prec: OP_PREC,
		block:bool, how: PP_ENV -> unit) : PFUN_ANS = (
let
	val PpEnv{pe_prec=enclosing_prec as(_, side), pe_addstring=addstring,
		pe_beginb=beginb, pe_endb=endb, ...} = cur_env;

	val br = enclosing_prec gt_prec enclosed_prec;

	val bl = block orelse br;

	val inner_env = set_prec (enclosed_prec, side) cur_env;
in
	if br then addstring "(" (*=)=*) else ();
	if bl then beginb(2, true) else ();

	how inner_env;

	if bl then endb() else ();
	if br then (*=(=*) addstring ")" else ();

	PfOk
end
);
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\section{AUXILIARY PRINTING FUNCTIONS}

\subsection{Names}
In the following, the return value is just a convenience for some callers
and is always $PfOk$.
The function attempts to recover if passed an ill-formed name by using a nested HOL quotation.
=SML
fun ⦏do_dec_var_name⦎ (cur_env:PP_ENV, name:string, enclosed_prec: OP_PREC) : PFUN_ANS = (
	let	val PpEnv{pe_addstring=addstring, ...} = cur_env;
	in let
		fun check_id nm = (
			case ZLex.z_lex[Lex.Text nm] handle Fail _ => [] of
				[ZLex.ZTId _, ZLex.ZTEos] => true
			|	_ => false
		);
		fun check_tmpl n i = (
			case get_zfixity_info i of
			Value(_, [t]) => string_of_template t = n
			|	_ => false
		);

		val (n, d) = unpack_ident name;

		val szn = size n;

		val (is_escaped, sml_str) =
			(true, dest_dollar_quoted_string n)
			handle Fail _ => (false, "")

		fun use_hol () = (
			addstring "⌜$\"";
			addstring (HOLPrettyPrinter.escape_sml_string name);
			addstring "\"⌝"
		);

	in	if	is_escaped
		then
	let	val es = HOLPrettyPrinter.escape_sml_string sml_str;
	in	addstring "$\"";
		addstring es;
		addstring "\"";
		addstring d
	end
		else
	let
		val tmpl = template_of_string n;

		val fti = first_tmpl_id tmpl handle Fail _ => n;
	in
		if	n = fti	
		then	if	check_id n
			then	addstring name
			else	use_hol()
		else	if	check_tmpl n fti
			then	(bracket(cur_env, enclosed_prec, false,
				fn e => addstring (string_of_ident (tmpl, d)));
				())
			else	use_hol()
	end	handle Fail _ => use_hol() (* e.g., template_of_string failed *)
	end
	end;
	PfOk
);
=TEX

\subsection{Floating Point Numbers}
=TEX
=SML
local
val zminus = bind_gvar_name "~ _";
fun dest_minus t = (
	let	val (f, a) = dest_z_app t;
		val fs = fst(dest_const f);
	in	if	fs =  zminus
		then	a
		else	fail "" 0 [] (* must catch *)
	end
);
in
fun ⦏do_float⦎ ((x, p, e) : TERM * TERM * TERM) : string OPT = (
	let	val xi = integer_of_string (dest_z_int x);
		val pi = integer_of_string (dest_z_int p);
		val ei = integer_of_string (dest_z_int e)
			handle Fail _ =>
			@~(integer_of_string (dest_z_int(dest_minus e)));
	in	Value (z_string_of_float(xi, pi, ei))
	end	handle Fail _ => Nil
);
end;
=TEX
\subsection{Simple Infix, Prefix and Postfix Operators}

No precedence change is needed for prefix operators.

=SML
fun ⦏do_prefix⦎ (oper: string, tm:TERM) (cur_env:PP_ENV) : unit = (
let
	val PpEnv{pe_addstring=addstring,
		pe_beginb=beginb, pe_space=space, pe_endb=endb, ...} = cur_env;
in
	addstring oper;
	space(1, 0);
	beginb(2, true);
	recur_pp cur_env tm;
	endb()
end
);
=TEX

=SML
fun ⦏do_infix⦎ (cur_env:PP_ENV, oper: string, (l:TERM, r:TERM),
		op_prec: OP_PREC) : PFUN_ANS = (
let
	val PpEnv{pe_prec=enclosing_prec, pe_addstring=addstring,
		pe_beginb=beginb, pe_endb=endb,
		pe_space=space, ...} = cur_env;

	val br = enclosing_prec gt_prec op_prec;

	val bl =fst enclosing_prec <>  op_prec;
in
	if br then addstring "(" (*=)=*) else ();
	if bl then beginb(2, true) else ();

	recur_pp (set_prec (op_prec, Lex.LeftAssoc) cur_env) l;
	space(1, 0);
	addstring oper;
	addstring " ";
	recur_pp (set_prec (op_prec, Lex.RightAssoc) cur_env) r;

	if bl then endb() else ();
	if br then (*=(=*) addstring ")" else ();

	PfOk
end
);
=TEX
\subsection{Lists of Terms}

There are several variations on lists.

Some lists (typically those separated by commas or semicolons)
have the separator plus a space token come between values.
Others lists have the space token before the separator.

=SML
fun ⦏do_list⦎ (after:bool, sep:string, tms:TERM list) (cur_env:PP_ENV) : unit = (
let
	val PpEnv{pe_addstring=addstring, pe_space=space, pe_prec = (op_prec, _),
		...} = cur_env;

	val e = set_prec (op_prec, Lex.LeftAssoc) cur_env;

	fun aux _ [] = ()
	| aux e (t1::[]) = recur_pp e t1
	| aux e (t1::more) = (
		recur_pp e t1;
		if after then () else space(1, 0);
		addstring sep;
		if after then space(1, 0) else ();
		aux (set_prec (op_prec, Lex.RightAssoc) e) more
	)
	;
in
	aux e tms
end
);
=TEX

=SML
fun ⦏do_wrapped_list⦎ (opener:string, sep:string, closer:string, tms:TERM list)
		(cur_env:PP_ENV) : unit = (
let
	val PpEnv{pe_addstring=addstring, pe_space=space, ...} = cur_env;
in
	addstring opener;
	do_list(true, sep, tms) (set_prec (PcLowest, Lex.RightAssoc) cur_env);
	addstring closer
end
);
=TEX
\section{Decoration}
An oddity about decoration is that you must put brackets around a decorated
expression which is itself decorated, and you must not put unnecessary
brackets around it when it appears as a declaration.
Moreover, the operand must be bracketed unless it is just a variable,
or (as coded below) if it is also decorated so that the recursive call
will add the brackets.
If the operand is a local variable (rare) we put the brackets in, but
if it is a global variable (common), we only put them in if the type
inferrer would need them, i.e., in the (rare) case when the user has
declared say S and S! both with a schema type and writes S!?, which the
type inferrer will treat as (S!)?.
Since this needs to be done in
several different contexts we common up the code to do it.
The precedence should be set to $PcLowest$ on entry in declaration
processing to ensure that
the outermost decoration is not bracketed.

=SML
fun ⦏do_decor⦎ (tm : TERM, d : string) (cur_env:PP_ENV) : PFUN_ANS = (
	let	val PpEnv{pe_addstring=addstring, pe_prec, ...} = cur_env;
		fun gvar_needs_brackets holname "" = false
		|   gvar_needs_brackets holname dec  = (
			case get_const_type (holname ^ dec) of
				Value _ => true
			|	Nil => gvar_needs_brackets
					holname
					(substring(dec, 0, size dec - 1))
		);
		fun is_decor s = s mem  ["'", "!", "?"];
		val need_brackets = (
			case dest_z_term tm of
				ZLVar _ => true
			|	ZGVar (n, _, _) =>
					n = ""
				orelse	is_decor(substring(n, size n - 1, 1))
				orelse	gvar_needs_brackets (bind_gvar_name n) d
			|	_ => true
		);
		val new_env = (
			if fst pe_prec = PcLowest
			then cur_env
			else set_prec (pc_decor_op, Lex.LeftAssoc) cur_env
		);
		fun new_e e = if need_brackets then set_prec (PcLowest, Lex.RightAssoc) e else e;
	in	bracket(new_env, pc_decor, false,
			(fn e => (
				if need_brackets then addstring "(" else ();
					recur_pp (new_e e) tm;
				if need_brackets then addstring ")" else ();
					addstring d
			)))
	end
);
=TEX
\section{Declarations}
We have to be careful to check out all the constituents of a declaration
before printing it or the enclosing construct.
Note that a declaration on its own is not reparseable ---
the parser of \cite{DS/FMU/IED/DTD061} does not provide a quotation form for
declarations.
The protocol to be followed in functions printing constructs containing
declarations is as follows. First call
=INLINEFT
make_a_dec_list
=TEX
; if this returns $Nil$, the declaration is invalid, so do not attempt
to print the enclosing construct as Z; otherwise, it returns
=INLINEFT
Value ts
=TEX
, say, print $ts$ with
=INLINEFT
do_decl
=TEX
.

The check to be made on the declaration is that it is a
list of things which are either schemas-as-declarations or variable
declarations in which the variables are Z local variables (i.e. HOL variables)
with valid Z names (the test in $test\_var\_name$ raises an exception if not,
to be caught in $make\_a\_dec\_list$).
The abstract machine is too lax with schemas-as-declarations so we also have to check that the variables bound by the declaration are actually the signature variables of the schema.
=SML
datatype ⦏A_DEC⦎ = ⦏Colon⦎ of string list * TERM | ⦏Schema⦎ of TERM * string;
local
	exception ⦏NotADecl⦎;
	fun test_var_name (s : string) : string = (
		unpack_ident s;
		s
	);
	fun ⦏do_vars⦎ ([] : TERM list) : string list = []
	|   do_vars (t :: more) = (
		(case dest_z_term t of
			ZLVar (s, _, _) => test_var_name s
		|	ZGVar (s, _, _) => test_var_name s
		|	_ => raise NotADecl) ::
		do_vars more
	);
	fun ⦏make_a_dec⦎ (t : TERM) : A_DEC = (
		case dest_z_term t of
			ZSchemaDec (ts as (_, d)) => (
			let	val (con_b, _) =  dest_app t;
				val nvs = (dest_z_binding o snd o dest_app) con_b;
			in	if	all
					nvs
					(fn (n, v) => pack_ident(n, d) = fst(dest_var v))
				then	Schema ts
				else	raise NotADecl
			end	handle Fail _ => raise NotADecl
		) |	ZDec ([], t) => raise NotADecl
		|	ZDec (ts, t) => Colon (do_vars ts, t)
		|	_ => raise NotADecl
	);
=TEX
=SML
in
fun ⦏make_a_dec_list⦎ (t : TERM) : (A_DEC list) OPT = (
	(case dest_z_term t of
		ZDecl ts => (Value (map make_a_dec ts) handle NotADecl => Nil)
	|	_ => Nil)
	handle Fail _ => Nil
);
=TEX
=SML
fun ⦏do_decl⦎ (decl : A_DEC list)
		(cur_env:PP_ENV) : unit = (
	let	val PpEnv{pe_prec=prec, pe_addstring=addstring,
			pe_beginb=beginb, pe_space=space, pe_endb=endb, ...}
			= cur_env;
		fun aux [] = ()
		| aux (s::[]) = (do_dec_var_name (cur_env, s, fst prec); ())
		| aux (s::more) = (
			do_dec_var_name (cur_env, s, fst prec);
			addstring ",";
			space(1, 0);
			aux more
		);
		fun print_a_dec (Schema (s, "")) = (
			recur_pp (set_prec (pc_decor_op, Lex.LeftAssoc) cur_env) s; ()
		) | print_a_dec (Schema sd) = (
			do_decor sd cur_env; ()
		) | print_a_dec (Colon (ts, t)) = (
			beginb(2, false);
			beginb(0, false);
			aux ts;
			endb();
			space(1, 2);
			addstring ": ";
			recur_pp cur_env t;
			endb()
		);
		fun print_a_dec_list [] = ()
		|   print_a_dec_list [t] = print_a_dec t
		|   print_a_dec_list (t::more) = (
			print_a_dec t;
			addstring ";";
			space(1, 0);
			print_a_dec_list more
		);
	in	beginb(2, true);
		print_a_dec_list decl;
		endb()
	end
);
end;
=TEX
\section{Characteristic Tuples}
When processing set abstractions, we wish to be able to test whether
the term after the ⦁ is equal to the characteristic tuple of the
declaration (in which case it can be elided). The following makes the test:
=SML
fun ⦏is_chartuple⦎ (tm : TERM) (decs : A_DEC list) : bool = (
let	fun chk (tm :: tms) (Colon(v :: vs, t) :: decl) = (
		(case dest_z_term tm of
			ZLVar (s, _, _) => s = v
		|	ZGVar (s, _, _) => s = v
		|	_ => false)
		andalso chk tms (Colon(vs, t) :: decl)
	) | chk tms (Colon([], _) :: decl) = (chk tms decl
	) | chk (tm :: tms) (Schema (s, d) :: decl) = (
		let	val (t, e) = dest_z_θ tm;
		in	t =$ s andalso e = d andalso chk tms decl
		end	handle Fail _ => false
	) | chk [] [] = (true
	) | chk _ _ = false;
	val tms =
		case dest_z_term tm of
			ZTuple tms	=> tms
		|	ZBinding []	=> []
		|	_		=> [tm];
in	chk tms decs
end
);
=TEX
\subsection{$is\_empty\_or\_single\_schema\_decl$}
If we are outputing a set abstraction whose delcaration is either empty or consists of a single schema we need to output the ``|'' and second part, regardless of whether
the second part is true.
This is to ensure that a set abstraction is not formatted with the syntax of a set display.
We thus have to test for this condition:
=SML
fun ⦏is_empty_or_single_schema_decl⦎ (d : TERM) : bool = (
	case dest_z_term d of
	ZDecl [] => true
	| ZDecl [d1] => (
		case dest_z_term d1 of
		ZSchemaDec _ => true
		| _ => false
	) | _ => false
);
=TEX
\subsection{$is\_single\_schema\_ref\_decl$}
If we are outputing a horizontal schema whose delcaration consists of a single schema reference we need to output the ``|'' and predicate part, regardless of whether
the predicate part is true.
This is to ensure that a horizontal schema is not formatted with the syntax of a generic actual parameter.
We thus have to test for this condition:
=SML
fun ⦏is_single_schema_ref_decl⦎ (d : TERM) : bool = (
	case dest_z_term d of
	ZDecl [d1] => (
		case dest_z_term d1 of
		ZSchemaDec (s, _) => (
			case dest_z_term s of
			ZGVar _ => true
			| _ => false
		) | _ => false
	) | _ => false
);
=TEX
\section{Binders}
All of the cases where forms like HOL
binders are used in~\cite{DS/FMU/IED/DEF007} have
a BNF syntax of one of the forms below.  Thus they are all directly recursive
(the indirection in the case of $Expr0$ which renames $Expr$ can be
ignored) and so the precedences of the enclosing and enclosed text (the
$xxx$ below) are the same.  If this changes then function $do_binder$
will need an extra argument for the enclosed precedence.

=GFT BNF
xxx	=	...
	|	Quant, SchemaText, `⦁`, ee
	...;
yyy	=	...
	|	Quant, SchemaText, [`⦁`, ee]
	...;
=TEX
The
=INLINEFT
check_char_tuple
=TEX
\ flag is used to indicate the second form (where the bullet and the final flag are optional).
If the bullet and the expression after it
are omitted, then the expression must be enclossed in brackets (only happens for μ).
=SML
local
fun ⦏do_binder_aux⦎ (is_quant : bool) (omit_t2 : bool) (omit_t3 : bool)
		(oper: string, ds:A_DEC list, t2:TERM, t3:TERM)
		(cur_env:PP_ENV) : unit = (
let	val PpEnv{pe_addstring=addstring, pe_space=space, ...} = cur_env;
	val new_env =
			if	is_quant
			then	set_prec (PcLowest, Lex.RightAssoc) cur_env
			else	cur_env;
in	(if omit_t3 then addstring "(" else ());
	addstring oper;
	addstring " ";
	do_decl ds new_env;
	if omit_t2
	then	()
	else	(
		if is_nil ds then () else space(1, 0);
		addstring "| ";
		recur_pp new_env t2
	);
	if omit_t3
	then	(addstring ")")
	else	(
		if is_nil ds andalso omit_t2 then () else space(1, 0);
		addstring "⦁ ";
		recur_pp new_env t3
	)
end
);
in
fun ⦏do_binder⦎ (is_quant : bool) (check_char_tuple : bool)
	(oper: string, (t1:TERM, t2:TERM, t3:TERM), op_prec : OP_PREC)
		(cur_env:PP_ENV) : PFUN_ANS = (
	case make_a_dec_list t1 of
		Value ds => (
		let	val omit_t2 = is_z_true t2;
			val omit_t3 = check_char_tuple andalso is_chartuple t3 ds;
			val opdst2t3 = (oper, ds, t2, t3);
			val new_env = if omit_t3 then set_prec (PcLowest, Lex.RightAssoc) cur_env else cur_env;
		in

			bracket(new_env, op_prec, true,
				do_binder_aux is_quant omit_t2 omit_t3 opdst2t3);
			PfOk
		end
	) |	Nil => PfNotPossible
);
end;
=TEX
=TEX
\section{Let-expressions}
=SML
local
fun ⦏do_let_aux⦎
		(defs : (string * TERM) list, b : TERM)
		(cur_env:PP_ENV) : unit = (
let	val PpEnv{pe_addstring=addstring, pe_space=space,
		pe_beginb = beginb, pe_endb = endb, ...} = cur_env;
	val new_env = set_prec (PcLowest, Lex.RightAssoc) cur_env;
	fun do_def(s, t) = (
		beginb(2, true);
		do_dec_var_name(new_env, s, pc_dec_var_name);
		addstring " ≜";
		space(1, 2);
		recur_pp new_env t;
		endb()
	);
	fun do_defs [] = ()
	|   do_defs [st] = do_def st
	|   do_defs (st :: more) = (
		do_def st;
		addstring ";";
		space(1, 2);
		do_defs more
	);

in	addstring "let";
	addstring " ";
	do_defs defs;
	space(1, 0);
	addstring "⦁ ";
	recur_pp new_env b
end
);
in
fun ⦏do_let⦎
		(defsb : (string * TERM) list * TERM)
		(cur_env:PP_ENV) : PFUN_ANS = (
	bracket(cur_env, pc_expr0_λ_μ_let, true, do_let_aux defsb)
);
end;
=TEX

=TEX

\subsection{Delta Schemas}

=SML
fun ⦏do_schema_prefix⦎ (cur_env:PP_ENV, name:string, tm:TERM) : PFUN_ANS = (
	bracket(cur_env, pc_sch3_pre, false,
		fn e => (do_prefix(name, tm) (set_prec (pc_schema_name, Lex.RightAssoc) e))
	)
);
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\section{FANCY-FIX TERMS}

A fancy fix expression is viewed as a list of terms and strings.  The
terms are the subexpresions or arguments of the fancy fix expression,
the strings are the parts of the identifier.  The goal is to take an
identifier and its arguments and reformat them as a list of values of
data type $Z_PIECE$ which contains the necessary terms and strings.
Most of the functions involved in fancy fix formatting manipulate a
optional list of these values, where an empty list is not expected, it
would represent some sort of internal error.  The $Nil$ value is used
to show that a routine has been unable to perform its part of the
formatting and so the expression cannot be shown in a fancy fix form.

=SML
datatype ⦏Z_PIECE⦎
	=	⦏ZpTerm⦎	of TERM
	|	⦏ZpTerms⦎	of TERM list
	|	⦏ZpString⦎	of string * ZFIXITY;
=TEX

After the pieces have been assembled we must decide upon how to format
them.  This involves deciding (1)~where to output spaces; (2)~which
spaces may be line breaks; (3)~where Oppen begin and end tokens are
placed within the text; (4)~what sort of Oppen begin tokens are
wanted.  To hold the results of these decisions we need another data
structure.  Function $make_print_tokens$ makes the necessary decisions
by converting lists of $Z_PIECE$s into $PRINT_TOKEN$s.

=SML
datatype ⦏PRINT_TOKEN⦎
	=	⦏PtTerm⦎	of TERM
	|	⦏PtTerms⦎	of TERM list
	|	⦏PtString⦎	of string
	|	⦏PtSpace⦎	of int * int
	|	⦏PtBeginb⦎	of int * bool
	|	⦏PtEndb⦎;
=TEX

%********************************************************************

\subsection{Creation of the Pieces to Print}

Function $format_fancy_fix$ basically merges its $tmpl$ and $args$
arguments to form a single list which comprises the pieces of the fancy
fix expression ready for printing.  If the merge is successful then the
pretty printer can commit itself to printing the original term in fancy
fix form, which is done in function $print_pieces$.  An unsuccessful
merge is indicated by returning a $Nil$ value.

This function is closly based upon a function of the same name
from ``Z User Interface Support'~\cite{DS/FMU/IED/IMP079}.

=SML
fun ⦏format_fancy_fix⦎
	(class:CLASS)
	(tmpl : TEMPLATE)
	(decor : string)
	(args : TERM list)
	: Z_PIECE list OPT = (
let	val rids = rev(tmpl_ids tmpl class);
	val ids = rev(case rids of (i, f) :: t => (i^decor, f) :: t | _ => rids);
	val stubs = tmpl_stubs tmpl;
	
	fun aux1 names tms = (
		fold	(fn ((n, t), prev) => (ZpString n) :: t :: prev)
			(combine names tms)
			[]
	);

	fun aux2 names tms = (
		fold	(fn ((t, n), prev) => t :: (ZpString n) :: prev)
			(combine tms names)
			[]
	);

	fun aux3 stubs tms = (
		map (fn (StubEll, t) => ZpTerms (snd (dest_z_⟨⟩ t))
			| (_, t) => ZpTerm t)
			(combine stubs tms)
	);

	val args' = aux3 stubs args;
in
	Value(	case tmpl
		of TmplNon _ => (ZpString(hd ids)) :: (aux2 (tl ids) args')
		| TmplIn _ => hd args' :: (aux1 ids (tl args'))
		| TmplPre _ => aux1 ids args'
		| TmplPost _ => aux2 ids args'
	)
end
handle Fail _ => Nil
);
=TEX

%********************************************************************

\subsection{Identifying the Template}

In determining whether a Z~identifier has some fancy fix form we make
several consistency checks, these aim to ensure that the text printed
is compatible with the various symbol table information and so the
parser can read back the text to generate the same term.

The $name$ argument here has already had any leading ``{\tt z'}''
and trailing decoration discarded.

=SML
fun ⦏get_template_info⦎(name:string) : (TEMPLATE * CLASS * STUB list) OPT = (
let
	val tmpl = template_of_string name handle Fail _ => TmplNon(name, Nil);
	val fst_tmpl_name = first_tmpl_id tmpl;
in
	if name = fst_tmpl_name
	then
		Nil
	else
		case get_zfixity_info fst_tmpl_name
		of Value((_, class), [tmpl2]) =>
			if tmpl = tmpl2
			then
				Value(tmpl, class, tmpl_stubs tmpl)
			else
				Nil
		| _ => Nil
end
);
=TEX

%********************************************************************

\subsection{Printing the Pieces}

Some analysis and modification must be done to the $Z_PIECE$s before
printing.

Function $analyse_prec$ determines the precedence of the fancy-fix
term.  This is the enclosed precedence of the term which will be used
as the right hand argument of $gt_prec$ when the need for brackets is
being determined.

=SML
local
	fun class_p(ZClFun p) = pc_expr1_normal p
	| class_p ZClRel = pc_pred4_rel
	| class_p(ZClGen p) = pc_expr1_normal p
	;

	fun  get_p(ZpString(_, (ff, cl))) = (
		case ff
		of ZFFBeginOp		=> PcHighest
		| ZFFEndOp		=> PcHighest
		| ZFFInOp		=> class_p cl
		| ZFFPostBeginOp	=> class_p cl
		| ZFFThenOp		=> PcHighest
		| ZFFPostOp		=> class_p cl
		| ZFFPreEndOp		=> class_p cl
		| ZFFPreOp		=> class_p cl
	) | get_p _ = PcHighest;

	fun aux(p, prev) = if p <> PcHighest then p else prev;
in

fun ⦏analyse_prec⦎ (pieces:Z_PIECE list) : OP_PREC =(
	fold aux (map get_p pieces) PcHighest
);

end;
=TEX

Function $make_print_tokens$ decides how to format various types of
fancy fix expression.  There are special cases for the three main
forms, namely infix, postfix and prefix.  Note the enclosing text
is responsible for adding Oppen begin and end tokens at the ends.

=SML
local
	val hsp = PtString " ";
	val ssp = PtSpace(1, 2);

	fun aux [] = []
	| aux (ZpTerm t1 :: ZpString(s1, _) :: []) =
		ssp :: PtTerm t1 :: hsp :: PtString s1 :: []
	| aux (ZpString(s1, _) :: []) = hsp :: PtString s1 :: []
	| aux (ZpTerm t1 :: []) = ssp :: PtTerm t1 :: []
	| aux (ZpString(s1, _) :: more) = hsp :: PtString s1 :: aux more
	| aux (ZpTerm t1 :: more) = ssp :: PtTerm t1 :: aux more
	| aux (ZpTerms t1 :: more) = ssp :: PtTerms t1 :: aux more
	;
in

fun ⦏make_print_tokens⦎ (pieces:Z_PIECE list) : PRINT_TOKEN list = (
	case pieces
	of (ZpTerm t1 :: ZpString(s1, _) :: ZpTerm t2 :: []) => (
		(* Infix *)
		PtTerm t1 :: ssp :: PtString s1 :: hsp :: PtTerm t2 :: []
		)
	| (ZpTerm t1 :: ZpString(s1, _) :: []) => (
		(* Postfix *)
		PtTerm t1 :: hsp :: PtString s1 :: []
		)
	| (ZpString(s1, _) :: ZpTerm t2 :: []) => (
		(* Prefix *)
		PtString s1 :: hsp :: PtTerm t2 :: []
		)
	| (ZpTerm t1 :: more) => (
		PtTerm t1 :: aux more
		)
	| (ZpTerms t1 :: more) => (
		PtTerms t1 :: aux more
		)
	| (ZpString(s1, _) :: more) => (
		PtString s1 :: aux more
		)
	| [] => []
);

end;
=TEX

Finally, function $print_pieces$ combines the various modifiers and
prints out the fancy fix expresion.  Note that whilst this
function returns a value of type $PFUN_ANS$ it may only return the
value $PfOk$ (which is done by function $bracket$ here) because at
this stage in the processing it is been decided that the expression
will be printed in a fancy fix fashion.

=SML
fun ⦏print_pieces⦎ (cur_env:PP_ENV) (pieces:Z_PIECE list) : PFUN_ANS = (
let
	val tm_prec = analyse_prec pieces;
	fun do_tok tok prec env = (
		let	val PpEnv{pe_addstring=addstring,
				pe_beginb=beginb, pe_space=space,
				pe_endb=endb, ...} = env;
		in	case tok of
			PtTerm t => recur_pp (set_prec prec env) t
		|	PtTerms ts => do_list (true, ",", ts) (set_prec prec env)
		|	PtString s => addstring s
		|	PtSpace ss => space ss
		|	PtBeginb ss => beginb ss
		|	PtEndb => endb()
		end
	);
	fun do_rest [] _ = ()
	|   do_rest ((tok as (PtTerm _)) :: []) env = (
		do_tok tok (tm_prec, Lex.RightAssoc) env
	) | do_rest (tok :: more) env = (do_tok tok (PcLowest, Lex.RightAssoc) env; do_rest more env);
	fun do_start ((tok as (PtTerm _)) :: more) env = (
		(do_tok tok (tm_prec, Lex.LeftAssoc) env; do_rest more env)
	) | do_start other env = do_rest other env;
in	bracket(cur_env, tm_prec, true, do_start (make_print_tokens pieces))
end
);
=TEX

%********************************************************************

\subsection{Dealing with Functional Applications}

=SML
fun ⦏get_fancy_fix⦎(fullname:string, arg_tm:TERM, ch_class:CLASS -> bool) : Z_PIECE list OPT = (
let
	val (name, decor) = unpack_ident fullname;
in
	case get_template_info name
	of Nil => Nil
	| Value(tmpl, class, stubs) => (
		if ch_class class
		then
		if length stubs = 1
		then
			format_fancy_fix class tmpl decor [arg_tm]
		else
			let
				val args = dest_z_tuple arg_tm (* may fail *);
			in
				if length args = length stubs
				then
					format_fancy_fix class tmpl decor args
				else
					Nil
			end handle Fail _ => Nil
		else
			Nil
	)
end
);
=TEX
=SML
local
val ⦏u⦎ = mk_z_gvar("𝕌", ⓣ'1 SET⌝, [mk_const("Totality", ⓣ'1 SET⌝)]);
in
fun ⦏is_u⦎ tm = (term_match tm u; true) handle Fail _ => false;
end;

fun ⦏get_fancy_fix1⦎(tm:TERM, arg_tm:TERM, ch_class:CLASS -> bool) : Z_PIECE list OPT = (
	(
	case dest_z_term tm of
		ZGVar (name, _, args) => (
			if	all args is_u
			then	get_fancy_fix (name, arg_tm, ch_class)
			else	Nil
	) |	ZLVar (name, _, args) => (
			if	all args is_u
			then	get_fancy_fix (name, arg_tm, ch_class)
			else	Nil
	) |	_ => Nil
	) handle Fail _ => Nil
);
=TEX
=SML
fun ⦏do_Z_app⦎ (cur_env:PP_ENV) (hd_term:TERM, arg_tm:TERM) : PFUN_ANS = (
let
	val PpEnv{pe_space=space, ...} = cur_env;
in
	case get_fancy_fix1(hd_term, arg_tm, fun_true)
	of Nil => bracket(cur_env, pc_expr3, true,
			fn e => (
				recur_pp (set_prec (pc_expr3_lhs, Lex.LeftAssoc) e) hd_term;
				space(1, 2);
				recur_pp (set_prec (pc_expr3_rhs, Lex.RightAssoc) e) arg_tm
			)
		)
	| Value pieces => print_pieces cur_env pieces
end
);
=TEX

%********************************************************************

\subsection{Dealing with Generics}

=SML
fun ⦏do_generic⦎ (cur_env:PP_ENV) (fullname:string, _:TYPE, tms:TERM list)
		: PFUN_ANS = (
let
	val (name, decor) = unpack_ident fullname;
	val not_all_u = not(all tms is_u);
	val PpEnv{pe_prec = (_, side), ...} = cur_env;
	val pc = (pc_var_name, side);
in
	case
		case get_template_info name
		of Value(tmpl, class as ZClGen _, stubs) => (
			if length tms = length stubs
			andalso not_all_u
			then	format_fancy_fix class tmpl decor tms
			else	Nil
		) | _ => (
			Nil
		)
	of Value pieces => print_pieces cur_env pieces
	| Nil => (
		if not_all_u
		then	bracket(cur_env, pc_expr4_gvar, true,
			fn e => (
				do_dec_var_name(set_prec pc cur_env, fullname, pc_dec_var_name);
				do_wrapped_list("[", ",", "]", tms) e
			))
		else do_dec_var_name(set_prec pc cur_env, fullname, pc_dec_var_name)
	)
end
);
=TEX

%********************************************************************

\subsection{Dealing with Relations}
=SML
fun ⦏do_relation⦎ (cur_env:PP_ENV, lr as (l:TERM, r:TERM)) : PFUN_ANS = (
let
	fun is_rel_class ZClRel = true | is_rel_class _ = false;
in
	case	get_fancy_fix1 (r, l, is_rel_class)
	of Value pieces => print_pieces cur_env pieces
	| Nil => do_infix(cur_env, "∈", lr, pc_pred4_∈)
end
);
=TEX
\subsection{Dealing with Generic Predicates}
=SML
fun ⦏try_do_gen_pred⦎ (cur_env:PP_ENV) (tm : TERM) : PFUN_ANS = (
let	fun aux t = (
		let	val (v, b) = dest_simple_∀ t;
		in	if is_gen_par v
			then	let	val (vs, b') = aux b;
				in	(v :: vs, b')
				end
			else	([], t)
		end	handle Fail _ => ([], t)
	);
in	case	aux tm
	of ([], _) => PfNotPossible
	| (vs, b) => (
		do_wrapped_list("[", ",", "]", vs) cur_env;
		recur_pp (set_prec (pc_expr3_rhs, Lex.RightAssoc) cur_env) b;
		PfOk
	)
end
);
=TEX
\subsection{Dealing with Horizontal Schemas}
=SML
fun ⦏try_do_schema⦎ (cur_env:PP_ENV) (tm1 : TERM) (tm2 : TERM) : PFUN_ANS = (
	let	val new_env = set_prec (PcLowest, Lex.RightAssoc) cur_env;
		val PpEnv{pe_addstring=addstring, pe_space = space, ...} = new_env;
	in	case make_a_dec_list tm1 of
		Value ds => (
			addstring "[";
			do_decl ds new_env;
			if is_z_true tm2 andalso not (is_single_schema_ref_decl tm1)
			then ()
			else(
				space(1, 2);
				addstring "| ";
				recur_pp new_env tm2
			);
			addstring "]";
			PfOk
		) |	Nil => PfNotPossible
	end
);
=TEX
=TEX
\subsection{Dealing with Isolated Declarations}
=SML
fun ⦏do_isol_dec⦎ (cur_env:PP_ENV) (tms : TERM list) : PFUN_ANS = (
	let	val new_env = set_prec (PcLowest, Lex.RightAssoc) cur_env;
		val PpEnv{pe_addstring=addstring, pe_space = space, ...} = new_env;
		val tm = mk_z_decl tms;
	in	case make_a_dec_list tm of
		Value ds => (
			addstring ("ⓜdec_ofⓩ" ^ "[");
			do_decl ds new_env;
			addstring ("]" ^ "⌝" ^ "⌝");
			PfOk
		) |	Nil => PfNotPossible
	end
);
=TEX
=SML
fun ⦏do_isol_decl⦎ (cur_env:PP_ENV) (tms : TERM list) : PFUN_ANS = (
	let	val new_env = set_prec (PcLowest, Lex.RightAssoc) cur_env;
		val PpEnv{pe_addstring=addstring, pe_space = space, ...} = new_env;
		val tm = mk_z_decl tms;
	in	case make_a_dec_list tm of
		Value ds => (
			addstring ("ⓩ:");
			do_decl ds new_env;
			addstring ("⌝");
			PfOk
		) |	Nil => PfNotPossible
	end
);
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\section{APPLICATION OF CONSTANT OR VARIABLE}
=SML
val ⦏pp_quote_z_strings⦎ = ref false;
val _ = if contains (map fst (get_flags()))
			"pp_quote_z_strings"
	then	()
	else	new_flag{name = "pp_quote_z_strings",
			control = pp_quote_z_strings,
			default = fun_false,
			check = fun_true
	};
=TEX
=SML
fun ⦏string_any⦎ (s : string) (test : char -> bool) : bool = (
	let	val sz = size s;
		fun aux i = (
			if	i >= sz
			then	false
			else	test (String.sub(s, i))
			orelse	aux (i+1)
		);
	in	aux 0
	end
);
=TEX
=SMLPLAIN
fun ⦏needs_quoting⦎ (s : string) : bool = (
	let	fun test c = (
				c = #"\""
			orelse	c = #"\\"
			orelse	c < #" "
			orelse	c = #"%Q%"
			orelse	c >= #"\127"
		);
	in	!pp_quote_z_strings andalso string_any s test
	end
);
=TEX
Function $Z_fun_app$ deals with the functional application of
constants.  The first term $orig_tm$ is the constant
and $ty$ is its type.  The term list $args$ holds the arguments that the constant is
applied to.  The original term may be recreated by $list_mk_app$
applied to the term and the term list.

=SML
fun ⦏Z_fun_app⦎ (cur_env:PP_ENV) (orig_tm:TERM) (name : string)
		(ty:TYPE) (args:TERM list) : PFUN_ANS = (
let
	val PpEnv{pe_prec=prec, pe_addstring=addstring,
		pe_beginb=beginb, pe_space=space, pe_endb=endb, ...} = cur_env;
in
	case basic_dest_z_term(orig_tm, args)
	of BdzNotZ _ =>
		(try_do_gen_pred cur_env (list_mk_app(orig_tm, args)))
	| BdzFail{BdzFArgc=c, ...}  => PfFewer c
	| BdzOk dzt => (
		case dzt of
(*
=TEX

The next part of this function is a big case clause with one branch for each
of the forms of Z~term.  These branch are spread over several blocks of
Standard~ML code, the function finishes in section~\ref{EndZFunApp}
on page~\pageref{EndZFunApp}.

\subsection{Declarations}
=SML
*)
  ZDec(vs, t) => do_isol_dec cur_env [mk_z_dec (vs, t)]
| ZSchemaDec(t, d) => do_isol_dec cur_env [mk_z_schema_dec (t, d)]
| ZDecl ts => do_isol_decl cur_env ts
(*
=TEX
\subsection{Predicates}

=SML
*)
| ZEq tms => do_infix(cur_env, "=", tms, pc_pred4_eq)
| Z∈ lr => do_relation(cur_env, lr)
| ZTrue => (addstring "true"; PfOk)
| ZFalse => (addstring "false"; PfOk)
| Z¬ tm => bracket(cur_env, pc_pred3_¬, false, do_prefix("¬", tm))
| Z∧ tms => do_infix(cur_env, "∧", tms, pc_pred2_∧)
| Z∨ tms => do_infix(cur_env, "∨", tms, pc_pred2_∨)
| Z⇒ tms => do_infix(cur_env, "⇒", tms, pc_pred2_⇒)
| Z⇔ tms => do_infix(cur_env, "⇔", tms, pc_pred2_⇔)
| Z∃ tms => do_binder true false ("∃", tms, pc_pred1_quant) cur_env
| Z∃⋎1 tms => do_binder true false ("∃⋎1", tms, pc_pred1_quant) cur_env
| Z∀ tms => do_binder true false ("∀", tms, pc_pred1_quant) cur_env
(*
=TEX

Constructor $ZSchemaPred$ is for a schema used as a predicate.

=SML
*)
| ZSchemaPred(decl, "") => bracket(cur_env, pc_expr4_schref, false,
	fn e => (
		recur_pp e decl
	)
)
| ZSchemaPred(decl, decor) => bracket(cur_env, pc_force_brackets, false,
	fn e => (
		recur_pp e decl;
		addstring decor
	)
)
(*
=TEX

\subsection{Variables}

Local variables, $ZLVar$. These aren't Z if there are generic parameters

=SML
*)
| ZLVar(name, var_ty, []) => (
	do_dec_var_name(set_prec (pc_var_name, Lex.RightAssoc) cur_env, name, pc_dec_var_name)
)
| ZLVar(name, var_ty, tms) => (
	PfNotPossible
)
(*
=TEX

Global variables, $ZGVar$, have their generic parameters in the list.
In the special case of generic $𝕌$ with parameter $Totality$ the
generic parameter is suppressed.

=SML
*)
| ZGVar (name_args as (name, var_ty, args)) => (
	if is_nil args orelse ((is_u(mk_z_gvar name_args)) handle Fail _ => false)
	then	do_dec_var_name(set_prec  (pc_var_name, Lex.RightAssoc) cur_env, name, pc_dec_var_name)
	else	do_generic cur_env name_args
)
(*
=TEX

=SML
*)
| ZInt n => (
	addstring n;
	PfOk
)
(*
=TEX

=SML
*)
| ZString s => (
	(if	needs_quoting s
	then	(addstring "ⓩ";
		 addstring ("\"" ^ HOLPrettyPrinter.escape_sml_string s ^ "\"");
		 addstring "⌝")
	else	addstring ("\"" ^ HOLPrettyPrinter.escape_sml_string s ^ "\""));
	PfOk
)
(*
=TEX

=SML
*)
| ZFloat xpe => (
	case do_float xpe of
		Value s => (addstring s; PfOk)
	|	Nil => PfNotPossible
)
(*
=TEX
\subsection{Lists, Sets, Etc.}

We could compare the $t1$ and $t3$ arguments of the $ZSeta$ and if
equivalent then suppress the $t3$ part.  However, the equivalence test is
not easy.

=SML
*)
| Z⟨⟩(_:TYPE, tms) => bracket(cur_env, PcHighest, true,
	do_wrapped_list("⟨", ",", "⟩", tms)
)
| ZSetd(_:TYPE, tms) => bracket(cur_env, PcHighest, true,
	do_wrapped_list("{", ",", "}", tms)
)
| ZSeta(t1, t2, t3) => (
	let	val new_env = set_prec (PcLowest, Lex.RightAssoc) cur_env;
	in	case make_a_dec_list t1 of
		Value ds => (
		let val ict = is_chartuple t3 ds;
		in
			addstring "{";
			do_decl ds new_env;
			if is_z_true t2 andalso
				(not ict orelse
				not(is_empty_or_single_schema_decl t1))
			then ()
			else (	space(1, 2);
				addstring "| ";
				recur_pp new_env t2
			);
			if	ict
			then	()
			else	(space(1, 2);
				addstring "⦁ ";
				recur_pp new_env t3);
			addstring "}";
			PfOk
		end
	) |	Nil => PfNotPossible
	end
)
| Zℙ tm => bracket(cur_env, pc_expr2_ℙ, false, do_prefix("ℙ", tm))
| ZTuple tms => bracket(cur_env, PcHighest, true, do_wrapped_list("(", ",", ")", tms))
| Z× tms => (
	let	fun do_ops arg env = (
			do_list arg (set_prec (pc_expr1_×_normal, Lex.RightAssoc) env)
		);
		val prec =
			let	val PpEnv{pe_prec, ...} = cur_env;
			in	if	fst pe_prec = pc_expr1_×_normal
				then	pc_expr1_×_low
				else	pc_expr1_×_normal
			end;
	in	bracket(cur_env, prec, true, do_ops(false, "× ", tms))
	end
)
(*
=TEX

=SML
*)
| Zθ(td as (tm, "")) => bracket(cur_env, pc_expr3_θ, true,
	fn e => (
		addstring "θ";
		recur_pp e tm
	)
)
| Zθ td => bracket(cur_env, pc_expr3_θ, true,
	fn e => (
		addstring "θ";
		do_decor td (set_prec (PcLowest, Lex.RightAssoc) e); ()
	)
)
| ZSel⋎s(tm, sel) => bracket(cur_env, pc_expr4_sel, true,
	fn e => (
		recur_pp (set_prec (pc_expr4_sel, Lex.LeftAssoc) e) tm;
		addstring ".";  (* full stop "." for selection *)
		do_dec_var_name(set_prec (pc_var_name, Lex.RightAssoc) cur_env, sel, pc_dec_var_name);
		()
	)
)| ZSel⋎t(tm, i) => bracket(cur_env, pc_expr4_sel, true,
	fn e => (
		recur_pp (set_prec (pc_expr4_sel, Lex.LeftAssoc) e) tm;
		addstring ".";  (* full stop "." for selection *)
		addstring (string_of_int i)
	)
)
(*
=TEX

Applications, here we must think about templates for fancy-fix
operator invocations.

=SML
*)
| ZApp tms => do_Z_app cur_env tms
| Zλ tms => do_binder false false ("λ", tms, pc_expr0_λ_μ_let) cur_env
| Zμ tms => do_binder false true ("μ", tms, pc_expr0_λ_μ_let) cur_env
| ZLet defs_tm => do_let defs_tm cur_env
(*
=TEX

\subsection{Schema Expressions}

Horizontal schemas.

=SML
*)
| ZHSchema(tm1, tm2) => (try_do_schema cur_env tm1 tm2
)
(*
=TEX
Decoration without decoration is not Z:

=SML
*)
| ZDecor⋎s(tm, "") => PfNotPossible

| ZDecor⋎s tmdecor => (do_decor tmdecor cur_env
)
(*
=TEX

=SML
*)
| ZPre⋎s tm => do_schema_prefix(cur_env, "pre", tm)
| Z¬⋎s tm => do_schema_prefix(cur_env, "¬", tm)
| Z∧⋎s tms => do_infix(cur_env, sub_schema_op "∧", tms, pc_sch2_∧)
| Z∨⋎s tms => do_infix(cur_env, sub_schema_op "∨", tms, pc_sch2_∨)
| Z⇒⋎s tms => do_infix(cur_env, sub_schema_op "⇒", tms, pc_sch2_⇒)
| Z⇔⋎s tms => do_infix(cur_env, sub_schema_op "⇔", tms, pc_sch2_⇔)
| Z↾⋎s tms => do_infix(cur_env, "↾⋎s", tms, pc_sch2_↾)
| Z∃⋎s tms => do_binder true false (sub_schema_op "∃", tms, pc_sch0_quant) cur_env
| Z∃⋎1⋎s tms => do_binder true false (sub_schema_op "∃⋎1", tms, pc_sch0_quant) cur_env
| Z∀⋎s tms => do_binder true false (sub_schema_op "∀", tms, pc_sch0_quant) cur_env
| Z⨾⋎s tms => do_infix(cur_env, "⨾⋎s", tms, pc_sch2_⨾)
(*
=TEX

=SML
*)
| ZHide⋎s(tm, strs) => bracket(cur_env, pc_sch4_hide, true,
	fn e => (
		recur_pp e tm;
		space(1, 2);
		addstring "\\⋎s (";
		show_comma_list_of_strings addstring space strs;
		addstring ")"
	)
)
(*
=TEX

=SML
*)
| ZΔ⋎s tm => do_schema_prefix(cur_env, "Δ", tm)
| ZΞ⋎s tm => do_schema_prefix(cur_env, "Ξ", tm)
(*
=TEX

According to the grammar in~\cite{Spivey92} renaming is just an
optional component of a schema reference, we therefore use the same
precedence.

=SML
*)
| ZRename⋎s (tm, ididl) => (
	let
		val new_env = set_prec (pc_dec_name, Lex.LeftAssoc) cur_env;

		fun pr_2ids(i1, i2) = (
			do_dec_var_name(new_env, i1, pc_dec_var_name);
			addstring "/";
			do_dec_var_name(new_env, i2, pc_dec_var_name);
			()
		);

		fun pr_comma_2ids ids = (addstring ","; space(1, 2); pr_2ids ids)
	in
		bracket(cur_env, pc_sch4_ref, true,
			fn e => (
				recur_pp e tm;
				space(1, 2);
				addstring "[";
				case ididl
				of ids::[] => pr_2ids ids
				| ids::more => (pr_2ids ids; map pr_comma_2ids more; ())
				| [] => ();
				addstring "]"
			)
		)
	end
)
(*
=TEX

\subsection{Bindings}

=SML
*)
| ZBinding binders => (
	let
		val new_env = set_prec (PcLowest, Lex.RightAssoc) cur_env;

		fun aux1(s, t) = (
			beginb(2, true);
			do_dec_var_name(new_env, s, pc_dec_var_name);
			addstring " ≜";
			space(1, 2);
			recur_pp new_env t;
			endb()
		);

		fun aux2 b = (
			addstring ",";
			space(1, 2);
			aux1 b
		);
	in
		beginb(2, false);
		addstring "(";
		case binders
		of b :: [] => aux1 b
		| b :: more => (
			aux1 b;
			map aux2 more;
			()
		)
		| [] => ();
		addstring ")";
		endb();
		PfOk
	end
)
(*
=TEX

\subsection{End of Function} \label{EndZFunApp}

=SML
*)
	)
	(* end of case basic_dest_z_term ... *)
end (* of let in fun Z_fun_app *)
handle Fail _ => PfNotPossible
) (* of fun Z_fun_app *);
=TEX

Functional application of constants and variables are treated the same
here in the Z printer.  However, they functions pased the pretty
printer support~\cite{DS/FMU/IED/DTD031} must have different
signatures.

=SML
fun ⦏Z_var_app⦎ (cur_env:PP_ENV) (orig_tm:TERM) (orig_name:string)
		(ty:TYPE) (args:TERM list) : PFUN_ANS = (
	Z_fun_app cur_env orig_tm orig_name ty args
);
=TEX


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\section{ISOLATED CONSTANT OR VARIABLE}

The term value is the constant or variable, the string and type are
from its destroyed form.

=SML
fun ⦏Z_do_const_var⦎ (cur_env:PP_ENV) (orig_tm:TERM) (name : string)
		(ty:TYPE) : PFUN_ANS = (
	Z_fun_app cur_env orig_tm name ty []
);
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%\newpage
\subsection{LAMBDA AND APPLICATION TERMS}

Isolated `$mk_λ$' and `$mk_app$' terms are not expected in Z.

=SML
fun ⦏Z_do_λ⦎ (_:PP_ENV) (_:TERM) (_:TERM) : PFUN_ANS = PfNotPossible;

fun ⦏Z_do_app⦎ (_:PP_ENV) (_:TERM) (_:TERM list) : PFUN_ANS = PfNotPossible;
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%\newpage
\section{FINALE}

%********************************************************************

\subsection{Install the Z Printing Functions}

=SML
val side_effect =
set_printers("Z",
	(Z_do_λ, Z_do_app, Z_do_const_var, Z_var_app,
		Z_fun_app, Z_do_const_var));

val side_effect =
	set_start_quote("Z", "ⓩ" (*=⌝=*) );
=TEX

%********************************************************************

\subsection{End of Structure}

=SML
end (* of structure ZPrettyPrinter *);
open ZPrettyPrinter;
=TEX


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%********************************************************************
%--------------------------------------------------------------------

\makeatletter
\def\refstepcounter#1{\stepcounter{#1}\global\edef\@currentlabel{\csname
	p@#1\endcsname\csname the#1\endcsname}}
\makeatother

\newpage
%\twocolumn[\section{INDEX}] \label{Index}
\section{INDEX}

\footnotesize
\printindex

\onecolumn

\end{document}

=IGN
val my_oppen_funs :OppenFormatting.OPPEN_FUNS = (
	(fn s => output(std_out, s)),
	(fn _ => ()),
	(fn _ => output(std_out, " ")),
	(fn _ => ())
);

val my_env = PrettyPrinterSupport.initial_env "Z" Nil my_oppen_funs;
	fun ⦏do_vars⦎ ([] : TERM list) : string = ()
	|   do_vars (t :: more) = (
		(case dest_z_term t of
			ZLVar (s, _, _) => s
		|	ZGVar (s, _, _) => s
		|	_ => raise NotADecl);
		do_vars more
	);
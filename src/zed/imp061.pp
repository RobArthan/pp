=IGN
********************************************************************************
imp061.doc: this file is part of the PPZed system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% imp061.doc   ℤ $Date: 2011/07/11 11:44:45 $ $Revision: 1.50 $ $RCSfile: imp061.doc,v $
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

\def\Title{Implementation of the Z Parser}

\def\AbstractText{This document contains the implementation for the parser for HOL/Z.}

\def\Reference{DS/FMU/IED/IMP061}

\def\Author{D.J. King,  R.D. Arthan}


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
%% LaTeX2e port: \TPPtitle{Implementation of the Z Parser}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP061}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.50 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2011/07/11 11:44:45 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{D.J.~King & WIN01 \\ R.D. Arthan & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{
%% LaTeX2e port: This document contains the implementation for the
%% LaTeX2e port: parser for HOL/Z.}
%% LaTeX2e port: %\TPPabstractB{}
%% LaTeX2e port: %\TPPabstractC{}
%% LaTeX2e port: %\TPPabstractD{}
%% LaTeX2e port: %\TPPabstractE{}
%% LaTeX2e port: %\TPPabstractF{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	Library}}
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

\item[Issues 1.8 (1992/05/01)-1.20 (1992/07/29), \FormatDate{92/05/01}-\FormatDate{92/07/29}]
Initial Drafts.
\item[Issue 1.21 (1992/10/28) \FormatDate{92/10/28}]
Changed treatment of term quotation. Various bug fixes.
\item[Issue 1.23 (1992/12/03)]
Now no longer sensitive to difference between standard and extended Z.
\item[Issue 1.24 (1992/12/10)  (10th December 1992)]
Global rename from wrk038.doc issue 1.9.
\item[Issue 1.25 (1994/03/17) (17th March 1994)]
Added structure ZParserInternals.
\item[Issue 1.26 (1999/02/16) (16th February 1999)]
Relaxed dependency on makestring.
\item[Issue 1.27 (1999/03/07)] Update for new INTEGER type.
\item[Issue 1.28 (2002/01/23)] Support for left associative operators.
\item[Issue 1.29 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.30 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.31 (2005/02/26)] Precedences for cartesian product and user-defined operators now closer to \cite{ISO02}.
\item[Issue 1.32 (2005/08/03)] Increased maximum numeric precedence (in line with likely future direction of ISO standard).
\item[Issue 1.33 (2005/08/03)] Schema projection is now left-associative.
\item[Issue 1.34 (2005/08/05)] Fixed bug in x\_pred.
\item[Issue 1.35 (2005/09/09)] New forms of stub in templates.
\item[Issue 1.36 (2005/09/13)] Option to require distinguishing subscripts on all schema operations.
\item[Issue 1.37 (2005/09/15)] Fixed bug in {\em x\_def\_lhs}.
\item[Issue 1.38 (2005/12/16)] Private names are now prefixed with $pp'$ rather than $icl'$.
\item[Issue 1.39 (2006/01/24)] An appropriate nested quotation can now be used as a VarName or DecName.
\item[Issue 1.40 (2006/01/24)] Now support decoration of fancyfix names.
\item[Issue 1.41 (2006/02/08)] Fixed version numbers in this changes history.
\item[Issue 1.42 (2006/04/20)] Added support for floating point literals
\item[Issue 1.43 (2006/12/02)] {\em string\_of\_float} renamed as {\em z\_string\_of\_float}.
\item[Issue 1.44 (2006/12/08)] Fixed messy format produced by {\em format\_core\_expr}.
\item[Issue 1.45 (2007/05/28)] Made errors in phase 2 raise the standard failure exception.
\item[Issue 1.46 (2007/08/03)] Quoted identifiers are not allowed in templates.
\item[Issue 1.47 (2010/04/01)] Support for empty schemas.  Updated for change to SLRP grammar for declarations, obviating error 61104 from phase 2 syntax check.
\item[Issue 1.48 (2011/07/10)] Separated parsing of lambda and mu expressions.
\item[Issue 1.49 (2011/07/11)] Now flags predicate contexts to the type-checker.
\item[Issue 1.50 (2011/07/11)] Support for empty schemas in paragraphs.
\item[Issue 1.51 (2011/08/04)] Fixed bug with decorations in forming characteristic tuples.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported PPZed to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
\pagebreak
\section{GENERAL}
\subsection{Scope}
This document contains the implementation for the parser for
HOL/Z.
The detailed design for this material is in \cite{DS/FMU/IED/DTD061}.
\subsection{Introduction}

\subsection{Purpose and Background}
See \cite{DS/FMU/IED/DTD061}.

\subsection{Algorithms}

The parser operates in two phases. Phase 1 does a context free parse
according to the grammar of \cite{DS/FMU/IED/DTD061} to produce
an intermediate of type $PP$ (which type is private to this module).
Phase 2 converts appropriate values of type $PP$ into the data type
$Z\_PARA$ as needed for input to the type inferrer.

Phase 1 is a reasonably straightforward, if lengthy, application of
the SLRP parser generator (see \cite{DS/FMU/IED/DTD019}).

Phase 2 involves a traversal of the data structure produced in phase 1
essentially to reconcile the grammar of \cite{DS/FMU/IED/DTD061} with
that of \cite{DS/FMU/IED/DEF007}. This involves both additional checks
and a certain amount of re-organisation of the data structure to make
up for the deficiencies in the precedences implicit
in the grammar of \cite{DS/FMU/IED/DTD061} (arising from the need to have
an SLR(1) grammar).
\subsection{Dependencies}
The parser is dependent on the Z lexical analyser, \cite{DS/FMU/IED/DTD060},
and on the HOL symbol table, \cite{DS/FMU/IED/DTD020}.

\subsection{Known Deficencies}
\begin{enumerate}
\item
The relative precedence of renaming is not right yet. This
would seem to be most easily fixed by an extra pass in phase 1
to float the renamings out around ℙ etc. (such a pass need only be
executed if there are any renamings in the input).

\item
The phase 2 error message in the case when a placeholder ($\_$ or $...$) appears
alone is not likely to be very helpful (it just says ``$\_$'' or ``$...$'' is
``not a valid expression''). A simple fudge to cope with this would be
to have an error handler on the surrounding call of $x\_pred$ to catch
an exception dedicated to this purpose.

\item
$get\_gpars$, which extracts a initial list of generic formals from
a parsed $PRED$ should probably handle the case when the $PRED$ begins
with something of the form $[S]$ where $S$ is not a variable more neatly.

\item
The handling of θ in phase 2 is not right yet. The decoration only floats
out properly if the operand is an $Expr4$. This just requires a little
pre-pass to go and hunt for trailing decorations in the operand.

\item
The special rule in \cite{DS/FMU/IED/DTD061} for the operand of `⦂' in extended Z
is not yet implemented.

\end{enumerate}
\subsection{Possible Enhancements}
By including some form of unique tag in each alternative of the
data type $PRED$, it would be possible for the phase 2 functions to print
the left context of an invalid sub-term in the diagnostic output.
\section{PREAMBLE}\label{PREAMBLE}
=SML
structure ⦏ZParser⦎ = struct
=TEX
We need to include the SLRP driver code at this point:
=INCLUDE
imp018.sml
=TEX
=SML
local
open ZUserInterfaceSupport;
open ZLex;
open Unification;
in
open SlrpDriver;
=TEX
\section{PHASE 1 DATA TYPES}\label{PHASE1DATATYPES}
We require data types to represent the result of a context-free parse
using the grammar of \cite{DS/FMU/IED/DTD061}. Most of these are defined
for us in \cite{DS/FMU/IED/DTD061}.
=TEX
The partially parsed input as held on the parsing stack is of the
type $PP$, for which we use an additional type abbreviation for the
values obtained by reducing either of the two alternatives for the
non-terminal $CoreExpr$.
=SML
type ⦏CORE_EXPR⦎		= PRED list * ((ID * (PRED list))list);

datatype ⦏PP⦎		= PPParagraph of PARAGRAPH
			| PPTemplates of TEMPLATE list
			| PPTemplate of TEMPLATE
			| PPEqDef of EQ_DEF
			| PPEqDefs of EQ_DEF list
			| PPPred of PRED
			| PPDecl of DECL
			| PPSchText of SCH_TEXT
			| PPCoreExpr of CORE_EXPR
			| PPSomeExprs of PRED list
			| PPIdDec of (ID * DECOR)
			| PPDecor of DECOR;
=TEX
\section{TEMPLATE FUNCTIONS}\label{TEMPLATEFUNCTIONS}
=TEX
Given a template (typically taken from the input to the parser), the
following function delivers the corresponding stored template.
It is the caller's responsibility to ensure that there is a stored
template with the same first identifier as the argument (as will be
the case for templates parsed from the input provided the fixity database
is kept up-to-date).
=SML
fun ⦏get_stored_tmpl⦎ (tmpl : TEMPLATE) : TEMPLATE = (
	case get_zfixity_info(first_tmpl_id tmpl) of
		Value(_, [t]) => t
	|	_ => raise PARSER_ERROR "template database corrupt"
);
=TEX
\section{FORMATTING FUNCTIONS}\label{FORMATTINGFUNCTIONS}
If errors are detected during the transformation to $ZTM$, then values
of type $PP$ etc. have to be printed in the diagnostic report.
In addition to the functions supplied in \cite{DS/FMU/IED/DTD079}
the following functions are used to do this:
=TEX
\ShowBoxes
\let\crossbar=\BigTurnstile
=TEX
=SML
fun ⦏format_core_expr⦎ ((preds, idpreds) : CORE_EXPR) : string = (
	let	fun aux (id, ps) = (
			id ^ " " ^ format_list format_pred ps ", "
		);
	in	format_list format_pred preds ", " ^ " " ^ format_list aux idpreds " "
	end
);
=TEX
=SML
fun ⦏format_pp⦎ (pp : PP) : string = (
	case pp of
		PPParagraph para => format_paragraph para
	|	PPTemplates tmpls => format_list format_template tmpls ", "
	|	PPTemplate tmpl => format_template tmpl
	|	PPEqDef eqdef => format_eq_def eqdef
	|	PPEqDefs eqdefs => format_list format_eq_def eqdefs ", "
	|	PPPred pred => format_pred pred
	|	PPDecl decl => format_decl decl
	|	PPSchText st => format_sch_text st
	|	PPCoreExpr ce =>  format_core_expr ce
	|	PPSomeExprs es => format_list format_pred es ", "
	|	PPIdDec (id, dec) => id ^ dec
	|	PPDecor dec => dec
);
=TEX
\section{LEXICAL CLASSES}\label{LEXICALCLASSES}
The following data type represents the lexical classes which are the
terminals of the grammar:
=SML
datatype Z_LEX_CLASS	= Ampersand
			| Assoc
			| Quotation
			| Ax
			| BBoldP
			| BackSlash
			| Bar
			| Bars
			| BeginOp
			| Colon
			| ColonsEq
			| Comma
			| Cross
			| Decor
			| Dot
			| EndOp
			| Eos
			| EqHat
			| FixityClass
			| Float
			| Id
			| InOp
			| Is
			| LBrace
			| LBrk
			| LSeqBrk
			| LSqBrk
			| Let
			| LogInOp
			| Lambda
			| Mu
			| Not
			| Number
			| PostBeginOp
			| PostOp
			| PreEndOp
			| PreOp
			| Quant
			| RBrace
			| RBrk
			| RSeqBrk
			| RSqBrk
			| Sch
			| SchInOp
			| SchPreOp
			| Semi
			| Slash
			| Spot
			| St
			| String
			| Stub
			| ThenOp
			| Theta
			| TurnStile
			| UnderBar;
=TEX
=SML
fun ⦏classify_id⦎  (id : string) : Z_LEX_CLASS = (
	case get_zfixity_info id of
		Nil => Id
	|	Value ((ZFFBeginOp, _), _) => BeginOp
	|	Value ((ZFFEndOp, _), _) => EndOp
	|	Value ((ZFFInOp, _), _) => InOp
	|	Value ((ZFFPostBeginOp, _), _) => PostBeginOp
	|	Value ((ZFFPostOp, _), _) => PostOp
	|	Value ((ZFFPreEndOp, _), _) => PreEndOp
	|	Value ((ZFFPreOp, _), _) => PreOp
	|	Value ((ZFFThenOp, _), _) => ThenOp
);
=TEX
=SML
fun ⦏classify⦎  (use_fix_db : bool) (tok : Z_TOKEN) : Z_LEX_CLASS = (
	case tok of
		ZTAqTm _	=>	Quotation
	|	ZTId "ℙ"	=> 	BBoldP
	|	ZTId id		=> 	if use_fix_db then classify_id id else Id
	|	ZTDecor _	=>	Decor
	|	ZTChar	_	=>	raise PARSER_ERROR "unexpected token"
	|	ZTString _	=>	String
	|	ZTNumber _	=>	Number
	|	ZTFloat _	=>	Float
	|	ZTAx		=>	Ax
	|	ZTSch		=>	Sch
	|	ZTEnd		=>	raise PARSER_ERROR "unexpected token"
	|	ZTIs		=>	Is
	|	ZTSt		=>	St
	|	ZTBar		=>	Bars
	|	ZTAmpersand	=>	Ampersand
	|	ZTλ		=>	Lambda
	|	ZTμ		=>	Mu
	|	ZT∀ _		=>	Quant
	|	ZT∃ _		=>	Quant
	|	ZT∃⋎1 _		=>	Quant
	|	ZT¬ _		=>	Not
	|	ZT∧ _		=>	LogInOp
	|	ZT∨ _		=>	LogInOp
	|	ZT⇔ _		=>	LogInOp
	|	ZT⇒ _		=>	LogInOp
	|	ZTPre		=>	SchPreOp
	|	ZTΔ		=>	SchPreOp
	|	ZTΞ		=>	SchPreOp
	|	ZTPipe		=>	SchInOp
	|	ZT↾		=>	SchInOp
	|	ZT⨾		=>	SchInOp
	|	ZTLet		=>	Let
	|	ZTFun		=>	FixityClass
	|	ZTGen		=>	FixityClass
	|	ZTRel		=>	FixityClass
	|	ZTLeftAssoc	=>	Assoc
	|	ZTRightAssoc	=>	Assoc
	|	ZTLbrace	=>	LBrace
	|	ZTRbrace	=>	RBrace
	|	ZTLbrack	=>	LBrk
	|	ZTRbrack	=>	RBrk
	|	ZTLsqbrack	=>	LSqBrk
	|	ZTRsqbrack	=>	RSqBrk
	|	ZT⟨		=>	LSeqBrk
	|	ZT⟩		=>	RSeqBrk
	|	ZTComma		=>	Comma
	|	ZTUnderScore	=> 	Stub
	|	ZTUnderScoreQuery	=> 	Stub
	|	ZTUnderScoreExclam=> 	Stub
	|	ZTDots		=>	Stub
	|	ZTDot		=>	Dot
	|	ZTSlash		=>	Slash
	|	ZTBSlash	=>	BackSlash
	|	ZTFreeTyDef	=>	ColonsEq
	|	ZTColon		=>	Colon
	|	ZTSemi		=>	Semi
	|	ZTVert		=>	Bar
	|	ZTConjecture	=>	TurnStile
	|	ZT≜		=>	EqHat
	|	ZT⦁		=>	Spot
	|	ZT×		=>	Cross
	|	ZTθ		=>	Theta
	|	ZTEos		=>	Eos
);
=TEX
When processing fixity paragraphs, we do not make the distinction
between differents sorts of name. The following functions is used
to achieve this.
\section{PHASE 1 ERROR HANDLING}\label{PHASE1ERRORHANDLING}
=SML
fun ⦏format_z_token⦎  (tok : Z_TOKEN) : string = (
	case tok of
		ZTAqTm _	=>	"<term-quotation>"
	|	ZTId s		=> 	s
	|	ZTDecor s	=>	s
	|	ZTChar s	=>	"<unexpected token: " ^ s ^ ">"
	|	ZTString s	=>	"\"" ^ s ^ "\""
	|	ZTNumber n	=>	string_of_integer n
	|	ZTFloat xpe	=>	z_string_of_float xpe
	|	ZTAx		=>	"ⓈZAX"
	|	ZTSch		=>	"┌"
	|	ZTEnd		=>	"<unexpected token: ZTEnd>"
	|	ZTIs		=>	"<Is>"
	|	ZTSt		=>	"├"
	|	ZTBar		=>	"═"
	|	ZTAmpersand	=>	"&"
	|	ZTλ		=>	"λ"
	|	ZTμ		=>	"μ"
	|	ZT∀ false	=>	"∀"
	|	ZT∃ false	=>	"∃"
	|	ZT∃⋎1 false	=>	"∃⋎1"
	|	ZT¬ false	=>	"¬"
	|	ZT∧ false	=>	"∧"
	|	ZT∨ false	=>	"∨"
	|	ZT⇔ false	=>	"⇔"
	|	ZT⇒ false	=>	"⇒"
	|	ZT∀ true		=>	"∀⋎s"
	|	ZT∃ true		=>	"∃⋎s"
	|	ZT∃⋎1 true	=>	"∃⋎1⋎s"
	|	ZT¬ true		=>	"¬⋎s"
	|	ZT∧ true		=>	"∧⋎s"
	|	ZT∨ true		=>	"∨⋎s"
	|	ZT⇔ true		=>	"⇔⋎s"
	|	ZT⇒ true		=>	"⇒⋎s"
	|	ZTPre		=>	"pre"
	|	ZTΔ		=>	"Δ"
	|	ZTΞ		=>	"Ξ"
	|	ZTPipe		=>	">>"
	|	ZT↾		=>	"↾⋎s"
	|	ZT⨾		=>	"⨾⋎s"
	|	ZTLet		=>	"let"
	|	ZTFun		=>	"fun"
	|	ZTGen		=>	"gen"
	|	ZTRel		=>	"rel"
	|	ZTLeftAssoc	=>	"leftassoc"
	|	ZTRightAssoc	=>	"rightassoc"
	|	ZTLbrace	=>	"{"
	|	ZTRbrace	=>	"}"
	|	ZTLbrack	=>	"("
	|	ZTRbrack	=>	")"
	|	ZTLsqbrack	=>	"["
	|	ZTRsqbrack	=>	"]"
	|	ZT⟨		=>	"⟨"
	|	ZT⟩		=>	"⟩"
	|	ZTComma		=>	","
	|	ZTUnderScore	=>	"_"
	|	ZTUnderScoreQuery	=>	"_?"
	|	ZTUnderScoreExclam=>	"_!"
	|	ZTDots		=>	"..."
	|	ZTDot		=>	"."
	|	ZTSlash		=>	"/"
	|	ZTBSlash	=>	"\\⋎s"
	|	ZTFreeTyDef	=>	"::="
	|	ZTColon		=>	":"
	|	ZTSemi		=>	";"
	|	ZTVert		=>	"|"
	|	ZTConjecture	=>	"⊢"
	|	ZT≜		=>	"≜"
	|	ZT⦁		=>	"⦁"
	|	ZT×		=>	"×"
	|	ZTθ		=>	"θ"
	|	ZTEos		=>	"<end-of-input>"
);
=TEX
=SML
fun ⦏format_parse_stack⦎ (stk : (Z_TOKEN, Z_LEX_CLASS, PP)INPUT_STACK) : string = (
	let	fun aux (Parsed pp) = format_pp pp
		|   aux (Token (tok, _)) = format_z_token tok;
	in	format_list aux (rev stk) " "
	end
);
=TEX
$red\_error$ is for use during context-free parsing when a user-error is detected.
The first two arguments give the two inserts for message 61001.
The other two parameters give the message to print after the 61001 lines.
After the diagnostic print-out the function fails with message 61000
and area "Z-Parser".
=SML
fun ⦏red_error⦎
	(okpart : (Z_TOKEN, Z_LEX_CLASS, PP)INPUT_STACK)
	(badpart : (Z_TOKEN, Z_LEX_CLASS, PP)INPUT_STACK)
	(msg : int)
	(inserts : string list) : 'a = (
	diag_string (get_error_message
			61001
			[format_parse_stack okpart,  format_parse_stack badpart]);
	diag_string (get_error_message msg inserts);
	fail "Z-Parser" 61000 []
);
=TEX
$stack\_error$ is for use during context-free parsing when the parsing stack
is corrupt.
=SML
fun ⦏stack_error⦎ (insert : string)
	(stk : (Z_TOKEN, Z_LEX_CLASS, PP)INPUT_STACK) : 'a = (
	diag_string("Internal error in Z-parser"
=POLYML
		^ ": stack print:" ^ PolyML.makestring stk
=SML
);
	error "Z-Parser"  19005 [fn() => insert]
);
=TEX
The following function produces the error reports for the unexpected
token type of error:
=SML
val ⦏phase_1_error⦎ : (Z_TOKEN, Z_LEX_CLASS, PP, 'd) ERROR_ROUTINE =
			(fn (tok, stk, _, _) => (
	diag_string (get_error_message 61001 [format_parse_stack stk,
				format_z_token tok]);
	diag_string (get_error_message 61003 [format_z_token tok,
				format_stack format_z_token stk]);
	raise SYNTAX_ERROR
));
=TEX
=SML
end (* of local ... in *);
end (* of structure *);
structure ZParser = struct
local
open ZUserInterfaceSupport;
open ZLex;
in
open ZParser;
=TEX
\section{REDUCTION FUNCTIONS}\label{REDUCTIONFUNCTIONS}
As with the HOL parser, adding type constraints to the reductions functions
would be both unhelpful and very time-consuming and so in this section
we deliberately suspend that aspect of the coding standards of
\cite{DS/FMU/IED/PLN007}.

We give the reduction functions in the order of their appearance
in the grammar of \cite{DS/FMU/IED/DTD061}. When several reduction
functions would be the same, we use $val$ bindings for the various
instances.
=TEX
=SML
fun ⦏red_accept⦎ (Parsed x) _ = (x
) | red_accept x1 stk =
		stack_error "red_accept" (x1::stk);
=TEX
=SML
val ⦏red_fixity⦎ = red_accept;
val ⦏red_general_term⦎ = red_accept;
val ⦏red_abb_def⦎ = red_accept;
val ⦏red_free_type_def⦎ = red_accept;
val ⦏red_ax_des⦎ = red_accept;
val ⦏red_conjecture⦎ = red_accept;
=TEX
=SML
fun ⦏red_templates⦎ (Token (tk, _)) (Parsed (PPTemplates tmpls)) stk = (
	PPParagraph
	(case tk of
		ZTFun => ParFixity(ZClFun (0, RightAssoc), tmpls)
	|	ZTGen => ParFixity(ZClGen (0, RightAssoc), tmpls)
	|	ZTRel => ParFixity(ZClRel, tmpls)
	|	_ => raise PARSER_ERROR "red_templates")
) | red_templates x1 x2 stk =
		stack_error "red_templates(2)" (x1::x2::stk);
=TEX
Following is largest power of 10 less than $2^{30}-1$ (which is max. int. on SML/NJ).
=SML
val max_prec : INTEGER = @@"1000000000";
=TEX
=SML
fun ⦏red_prec_templates⦎ (Token (tk, c1)) (Token (ZTNumber p, c2))
	(Parsed (PPTemplates tmpls)) stk = (
if	p @<= max_prec
then
	PPParagraph
	(case tk of
		ZTFun => ParFixity(ZClFun (int_of_integer p, RightAssoc), tmpls)
	|	ZTGen => ParFixity(ZClGen (int_of_integer p, RightAssoc), tmpls)
	|	ZTRel =>
			red_error
			((Token (tk, c1)) :: stk) [Token (ZTNumber p, c2)]
			61011 []
	|	other => raise PARSER_ERROR "red_prec_templates")
else	red_error ((Token (tk, c1)) :: stk) [Token (ZTNumber p, c2)]
	61013 [string_of_integer p, string_of_integer max_prec]
) | red_prec_templates x1 x2 x3 stk =
		stack_error "red_prec_templates(2)" (x1::x2::x3::stk);
=TEX
In the following, we know from the grammar that the token will be the
left or right associativity token, so there is no need for an error case.
=SML
fun ⦏convert_assoc⦎ (ZTRightAssoc : Z_TOKEN) : ASSOC = RightAssoc
|    convert_assoc _ = LeftAssoc;
=TEX
=SML
fun ⦏red_prec_assoc_templates⦎ (Token (tk, c1)) (Token (ZTNumber p, c2)) (Token(astk, _))
	(Parsed (PPTemplates tmpls)) stk = (
if	p @<= max_prec
then
	PPParagraph
	(case tk of
		ZTFun => ParFixity(ZClFun (int_of_integer p, convert_assoc astk), tmpls)
	|	ZTGen => ParFixity(ZClGen (int_of_integer p, convert_assoc astk), tmpls)
	|	ZTRel =>
			red_error
			((Token (tk, c1)) :: stk) [Token (ZTNumber p, c2)]
			61011 []
	|	other => raise PARSER_ERROR "red_prec_templates")
else	red_error ((Token (tk, c1)) :: stk) [Token (ZTNumber p, c2)]
	61013 [string_of_integer p, string_of_integer max_prec]
) | red_prec_assoc_templates x1 x2 x3 x4 stk =
		stack_error "red_prec_templates(2)" (x1::x2::x3::stk);
=TEX
=SML
fun ⦏red_accept⦎ (Parsed pp) _ = (pp
) | red_accept x1 stk =
		stack_error "red_accept" (x1::stk);
=TEX
=SML
val ⦏red_template⦎ = red_accept;
=TEX
=SML
fun ⦏red_template_templates⦎
	(Parsed(PPTemplates [tmpl])) _ (Parsed(PPTemplates tmpls)) _ = (
	PPTemplates (tmpl :: tmpls)
) | red_template_templates x1 x2 x3 stk =
		stack_error "red_template_templates" (x1::x2::x3::stk);
=TEX
=TEX
=SML
val ⦏red_stub_ids⦎ = red_accept;
=TEX
=SML
val ⦏red_id_stubs⦎ = red_accept;
=TEX
=SML
fun dest_stub (ZTDots : Z_TOKEN) = StubEll
|   dest_stub (ZTUnderScore) = StubUS
|   dest_stub (ZTUnderScoreQuery) = StubUSQ
|   dest_stub (ZTIUnderScoreQuery) = StubUSE;
=TEX
=SML
fun ⦏red_stub_id⦎ (Token(st, _)) (Parsed(PPIdDec(nm, _))) _ = (
	PPTemplates[TmplPost(dest_stub st, (nm, Nil))]
) | red_stub_id x1 x2 stk =
		stack_error "red_stub_id" (x1::x2::stk);
=TEX
=SML
fun ⦏red_stub_id_stub⦎
	(Token(st1, _))
	(Parsed(PPIdDec(nm, _)))
	(Token(st2, _)) _ = (
	PPTemplates[TmplIn(dest_stub st1, (nm, Nil), dest_stub st2)]
) |   red_stub_id_stub x1 x2 x3 stk =
		stack_error "red_stub_id_stub" (x1::x2::x3::stk);
=TEX
=SML
fun ⦏red_stub_id_stub_ids⦎ (Token(st1, _)) (Parsed(PPIdDec(nm, _)))
		(Parsed(PPTemplates[(TmplIn(st2, (nm2, Nil), st3))])) _ = (
	PPTemplates[TmplIn(dest_stub st1, (nm, Value([], (st2, nm2))), st3)]
) | red_stub_id_stub_ids (Token(st1, _)) (Parsed(PPIdDec(nm1, _)))
		(Parsed(PPTemplates[(TmplIn(st2, (nm2, Value (stids, stid)), st3))])) _ = (
	PPTemplates[TmplIn(dest_stub st1, (nm1, Value((st2, nm2) :: stids, stid)), st3)]
) | red_stub_id_stub_ids (Token(st1, _)) (Parsed(PPIdDec(nm1, _)))
		(Parsed(PPTemplates[(TmplPost(st2, (nm2, Nil)))])) _ = (
	PPTemplates[TmplPost(dest_stub st1, (nm1, Value([], (st2, nm2))))]
) | red_stub_id_stub_ids (Token(st1, _)) (Parsed(PPIdDec(nm1, _)))
		(Parsed(PPTemplates[(TmplPost(st2, (nm2, Value (stids, stid))))])) _ = (
	PPTemplates[TmplPost(dest_stub st1, (nm1, Value((st2, nm2) :: stids, stid)))]
) | red_stub_id_stub_ids x1 x2 x3 stk =
		stack_error "red_stub_id_stub_ids" (x1::x2::x3::stk);
=TEX
=SML
fun ⦏red_id_stub⦎ (Parsed(PPIdDec(nm, _))) (Token(st, _)) _ =  (
	PPTemplates[TmplPre((nm, Nil), dest_stub st)]
) | red_id_stub x1 x2 stk =
		stack_error "red_id_stub" (x1::x2::stk);
=TEX
=SML
fun ⦏red_id_stub_id⦎ (Parsed(PPIdDec(nm1, _))) (Token(st, _)) (Parsed(PPIdDec(nm2, _))) _ = (
	PPTemplates[TmplNon((nm1, Value([], (dest_stub st, nm2))))]
) | red_id_stub_id x1 x2 x3 stk =
		stack_error "red_id_stub_id" (x1::x2::x3::stk);
=TEX
=SML
fun red_id_stub_id_stubs (Parsed(PPIdDec(nm1, _))) (Token(st1, _))
		(Parsed(PPTemplates[(TmplPre((nm2, Nil), st2))])) _ = (
	PPTemplates[TmplPre((nm1, Value([], (dest_stub st1, nm2))), st2)]
) | red_id_stub_id_stubs (Parsed(PPIdDec(nm1, _))) (Token(st1, _))
		(Parsed(PPTemplates[(TmplPre((nm2, Value(stids, stid)), st2))])) _ = (
	PPTemplates[TmplPre((nm1, Value((dest_stub st1, nm2) :: stids, stid)), st2)]
) | red_id_stub_id_stubs (Parsed(PPIdDec(nm1, _))) (Token(st1, _))
		(Parsed(PPTemplates[(TmplNon((nm2, Nil)))])) _ = (
	PPTemplates[TmplNon(nm1, Value([], (dest_stub st1, nm2)))]
) | red_id_stub_id_stubs (Parsed(PPIdDec(nm1, _))) (Token(st1, _))
		(Parsed(PPTemplates[(TmplNon((nm2, Value(stids, stid))))])) _ = (
	PPTemplates[TmplNon(nm1, Value((dest_stub st1, nm2) :: stids, stid))]
) | red_id_stub_id_stubs x1 x2 x3 stk =
		stack_error "red_id_stub_id_stubs" (x1::x2::x3::stk);
=TEX
=SML
fun ⦏red_tmpl_id⦎ (Token((ZTId nm), cl)) stk = (
	if	(dest_dollar_quoted_string nm; false)
			handle Fail _ => true
	then	PPIdDec (nm, "")
	else	red_error stk [Token((ZTId nm), cl)] 61019 []
) | red_tmpl_id x1 stk = stack_error "red_tmpl_id" (x1::stk);
=TEX
=SML
fun ⦏red_pred⦎ (Parsed (PPPred p)) _ = (
	PPParagraph(ParGeneralTerm (p, Nil))
) | red_pred x1 stk =
		stack_error "red_pred" (x1::stk);
=TEX
=SML
fun ⦏red_pred_constraint⦎ (Parsed (PPPred p1)) _ (Parsed (PPPred p2)) _ = (
	PPParagraph(ParGeneralTerm (p1, Value p2))
) | red_pred_constraint x1 x2 x3 stk =
		stack_error "red_pred_constraint" (x1::x2::x3::stk);
=TEX
=SML
fun ⦏red_eq_def⦎ (Parsed (PPEqDef d)) _ = (
	PPParagraph(ParAbbDef(ADEqDef d))
) | red_eq_def x1 stk =
		stack_error "red_eq_def" (x1::stk);
=TEX
=SML
fun ⦏red_schema_box⦎
	_ (Parsed (PPPred s))
	_ (Parsed (PPSchText st)) _ = (
	PPParagraph(ParAbbDef(ADSchemaBox(s, st)))
) | red_schema_box x1 x2 x3 x4 stk =
		stack_error "red_schema" (x1::x2::x3::x4::stk);
=TEX
=SML
fun ⦏red_deflhs_pred⦎ (Parsed (PPPred d)) _ (Parsed (PPPred p)) _ = (
	PPEqDef(d, p)
) | red_deflhs_pred x1 x2 x3 stk =
		stack_error "red_deflhs_pred" (x1::x2::x3::stk);
=TEX
=SML
val ⦏red_expr1_as_def_lhs⦎ = red_accept;
=TEX
=SML
fun ⦏red_a_free_type⦎ (Parsed (PPPred t)) _ (Parsed (PPSomeExprs bs)) _ = (
	PPParagraph(ParFreeTypeDef[(t, bs)])
) | red_a_free_type x1 x2 x3 stk =
		stack_error "red_a_free_type" (x1::x2::x3::stk);
=TEX
=SML
fun ⦏red_free_types⦎
	(Parsed (PPPred t)) _
	(Parsed (PPSomeExprs bs)) _
	(Parsed (PPParagraph(ParFreeTypeDef fts))) _ = (
	PPParagraph(ParFreeTypeDef((t, bs) :: fts))
) | red_free_types x1 x2 x3 x4 x5 stk =
		stack_error "red_free_types" (x1::x2::x3::x4::x5::stk);
=TEX
=SML
fun ⦏red_accept_pred_as_list ⦎ (Parsed (PPPred p)) _ = (
	PPSomeExprs [p]
) | red_accept_pred_as_list x1 stk =
		stack_error "red_accept_pred_as_list" (x1::stk);
=TEX
=SML
val ⦏red_pred_as_branch⦎ = red_accept_pred_as_list;
=TEX
The following auxiliary is not itself ever used directly as a reduction
function (since constructs giving rise to predicate lists in the abstract
syntax have a variety of styles for separating the predicates)
=SML
fun ⦏add_pred_to_list_aux⦎ (Parsed (PPPred p)) (Parsed (PPSomeExprs ps)) stk = (
	PPSomeExprs (p :: ps)
) | add_pred_to_list_aux x1 x2 stk =
		stack_error "add_pred_to_list_aux" (x1::x2::stk);
=TEX
=SML
fun ⦏red_branches⦎ pp _ pb stk  = (
	add_pred_to_list_aux pp pb stk
);
=TEX
=SML
fun ⦏red_ax_box⦎
	_ (Parsed (PPSchText st)) _ = (
	PPParagraph(ParAxDes([], st))
) | red_ax_box x1 x2 stk =
		stack_error "red_ax_box" (x1::x2::stk);
=TEX
=SML
fun ⦏red_gen_ax_box⦎
	_ _ (Parsed (PPSomeExprs ps))
	_ _ (Parsed (PPSchText st)) _ = (
	PPParagraph(ParAxDes(ps, st))
) | red_gen_ax_box x1 x2 x3 x4 x5 x6  stk =
		stack_error "red_gen_ax_box" (x1::x2::x3::x4::x5::x6::stk);
=TEX
=SML
fun ⦏red_no_id_conjecture⦎ _ (Parsed(PPPred p)) _ = (
	PPParagraph(ParConjecture(Nil, p))
) | red_no_id_conjecture x1 x2 stk =
		stack_error "red_no_id_conjecture" (x1::x2::stk);
=TEX
=SML
fun ⦏red_id_conjecture⦎ (Token(ZTId i, _)) _ (Parsed(PPPred p)) _ = (
	PPParagraph(ParConjecture(Value i, p))
) | red_id_conjecture x1 x2 x3 stk =
		stack_error "red_id_conjecture" (x1::x2::x3::stk);
=TEX
=SML
val ⦏red_pred1_as_pred⦎ = red_accept;
=TEX
=SML
fun ⦏red_pred_semi_pred⦎ (Parsed(PPPred p1)) _ (Parsed(PPPred p2)) _ = (
	PPPred (PredLogInOp (p1, ZLogInOpSemi, p2))
) | red_pred_semi_pred x1 x2 x3 stk =
		stack_error "red_pred_semi_pred" (x1::x2::x3::stk);
=TEX
=SML
val ⦏red_pred2_as_pred1⦎ = red_accept;
=TEX
=SML
fun ⦏quant_aux⦎ (Token (ZT∀ b, _)) = ZQuant∀ b
|   quant_aux (Token (ZT∃ b, _)) = ZQuant∃ b
|   quant_aux (Token (ZT∃⋎1 b, _)) = ZQuant∃⋎1 b
|   quant_aux stk = raise PARSER_ERROR "quant_aux";
=TEX
=SML
fun ⦏red_quant⦎
	q (Parsed(PPSchText st))
	_ (Parsed(PPPred p)) _ = (
	PPPred(PredQuantifier(quant_aux q, st, p))
) | red_quant x1 x2 x3 x4 stk =
		stack_error "red_quant" (x1::x2::x3::x4::stk);
=TEX
=SML
fun ⦏red_let⦎ _ (Parsed(PPEqDefs e)) _ (Parsed(PPPred p)) _ = (
	PPPred(PredLet(e, p))
) | red_let x1 x2 x3 x4 stk =
		stack_error "red_let" (x1::x2::x3::x4::stk);
=TEX
=SML
val ⦏red_pred3_as_pred2⦎ = red_accept;
=TEX
=SML
fun ⦏log_in_op_aux⦎ (Token (ZT∧ b, _)) = ZLogInOp∧ b
|   log_in_op_aux (Token (ZT∨ b, _)) = ZLogInOp∨ b
|   log_in_op_aux (Token (ZT⇒ b, _)) = ZLogInOp⇒ b
|   log_in_op_aux (Token (ZT⇔ b, _)) = ZLogInOp⇔ b
|   log_in_op_aux stk = raise PARSER_ERROR "log_in_op_aux";
=TEX
=SML
fun ⦏red_log_in_op⦎ (Parsed(PPPred p1)) lop (Parsed(PPPred p2)) _ = (
	PPPred (PredLogInOp (p1, log_in_op_aux lop, p2))
) | red_log_in_op x1 x2 x3 stk =
		stack_error "red_log_in_op" (x1::x2::x3::stk);
=TEX
=SML
val ⦏red_schema2_as_pred3⦎ = red_accept;
=TEX
=SML
fun ⦏red_neg⦎ (Token (ZT¬ b, _)) (Parsed(PPPred p)) _ = (
	PPPred(PredNot (b, p))
) | red_neg x1 x2 stk =
		stack_error "red_neg" (x1::x2::stk);
=TEX
=SML
fun ⦏sch_in_op_aux⦎ (Token (ZTPipe, _)) = Pipe
|   sch_in_op_aux (Token (ZT↾, _)) = Filter
|   sch_in_op_aux (Token (ZT⨾, _)) = Comp
|   sch_in_op_aux _ = raise PARSER_ERROR "sch_in_op_aux";
=TEX
=SML
fun ⦏red_sch_in_op⦎ (Parsed(PPPred p1)) sop (Parsed(PPPred p2)) _ = (
	PPPred (PredSchInOp (p1, sch_in_op_aux sop, p2))
) | red_sch_in_op x1 x2 x3 stk =
		stack_error "red_sch_in_op" (x1::x2::x3::stk);
=TEX
=SML
val ⦏red_schema4_as_schema3⦎ = red_accept;
=TEX
=SML
fun ⦏sch_pre_op_aux⦎ (Token (ZTPre, _)) = Pre
|   sch_pre_op_aux (Token (ZTΔ, _)) = Delta
|   sch_pre_op_aux (Token (ZTΞ, _)) = Xi
|   sch_pre_op_aux _ = raise PARSER_ERROR "sch_pre_op_aux";
=TEX
=SML
fun ⦏red_sch_pre_op⦎ pop (Parsed(PPPred p)) _ = (
	PPPred (PredSchPreOp (sch_pre_op_aux pop, p))
) | red_sch_pre_op x1 x2 stk =
		stack_error "red_sch_pre_op" (x1::x2::stk);
=TEX
=SML
val ⦏red_expr0_as_schema4⦎ = red_accept;
=TEX
=SML
fun ⦏red_schema_hiding⦎ (Parsed(PPPred p)) _ _ (Parsed(PPSomeExprs ps)) _ _ = (
	PPPred (PredSchemaHiding (p, ps))
) | red_schema_hiding x1 x2 x3 x4 x5 stk =
		stack_error "red_schema_hiding" (x1::x2::x3::x4::x5::stk);
=TEX
=SML
fun ⦏red_rename_list⦎ _ (Parsed r) _ _ = (
	r
) | red_rename_list x1 x2 x3 stk =
		stack_error "red_rename_list" (x1::x2::x3::stk);
=TEX
=SML
fun ⦏red_rename⦎ (Parsed(PPPred p1)) _ (Parsed(PPPred p2)) _ = (
	PPPred (PredRenameList[(p1, p2)])
) | red_rename x1 x2 x3 stk =
		stack_error "red_rename" (x1::x2::x3::stk);
=TEX
=SML
fun ⦏red_renames⦎
	(Parsed(PPPred p1)) _
	(Parsed(PPPred p2)) _
	(Parsed(PPPred(PredRenameList rs))) _ = (
	PPPred (PredRenameList((p1, p2)::rs))
) | red_renames x1 x2 x3 x4 x5 stk =
		stack_error "red_renames" (x1::x2::x3::x4::x5::stk);
=TEX
=SML
fun ⦏red_sch_text_minus_pred⦎ (Parsed(PPSchText st)) _ = (
	PPSchText st
) | red_sch_text_minus_pred x1 stk =
		stack_error "red_sch_text_minus_pred" (x1::stk);
=TEX
=SML
fun ⦏red_pred1_as_sch_text⦎
	(Parsed(PPPred p)) _ = (
	PPSchText ([([], p)], Nil)
) | red_pred1_as_sch_text x1 stk =
		stack_error "red_pred1_as_sch_text" (x1::stk);
=TEX
=SML
fun ⦏red_sch_text_minus_empty_minus_pred⦎ (Parsed(PPSchText st)) _ = (
	PPSchText st
) | red_sch_text_minus_empty_minus_pred x1 stk =
		stack_error "red_sch_text_minus_empty_minus_pred" (x1::stk);
=TEX
=SML
fun ⦏red_no_sch_text⦎ _ = PPSchText ([], Nil);
=TEX
=SML
fun ⦏red_decl_minus_pred_as_sch_text⦎
	(Parsed(PPDecl rd)) _ = (
	PPSchText (rd, Nil)
) | red_decl_minus_pred_as_sch_text x1 stk =
		stack_error "red_decl_minus_pred_as_sch_text" (x1::stk);
=TEX
=SML
fun ⦏red_decl_as_sch_text⦎
	(Parsed(PPDecl d)) _ = (
	PPSchText (d, Nil)
) | red_decl_as_sch_text x1 stk =
		stack_error "red_decl_as_sch_text" (x1::stk);
=TEX
=SML
fun ⦏red_decl_bar_pred_as_sch_text⦎
	(Parsed(PPDecl rd)) _
	(Parsed(PPPred p)) _ = (
	PPSchText (rd, Value p)
) | red_decl_bar_pred_as_sch_text x1 x2 x3 stk =
		stack_error "red_decl_bar_pred_as_sch_text" (x1::x2::x3::stk);
=TEX
=SML
fun ⦏red_bar_pred_as_sch_text⦎
	_ (Parsed(PPPred p)) _ = (
	PPSchText ([], Value p)
) | red_bar_pred_as_sch_text x1 x2 stk =
		stack_error "red_bar_pred_as_sch_text" (x1::x2::stk);
=TEX
=SML
fun ⦏red_decl_minus_pred⦎ (Parsed(PPDecl rd)) _ = (
	PPDecl rd
) | red_decl_minus_pred x1 stk =
		stack_error "red_decl_minus_pred" (x1::stk);
=TEX
=SML
fun ⦏red_pred1_as_decl⦎
	(Parsed(PPPred p)) _ = (
	PPDecl [([], p)]
) | red_pred1_as_decl x1 stk =
		stack_error "red_pred1_as_decl" (x1::stk);
=TEX
=SML
fun ⦏red_decl_semi_var_decs_pred1⦎
	(Parsed(PPDecl rd))
	(Parsed(PPSomeExprs es)) _
	(Parsed(PPPred p)) _ = (
	PPDecl (rd @ [(es, p)])
) | red_decl_semi_var_decs_pred1 x1 x2 x3 x4 stk =
		stack_error "red_decl_semi_var_decs_pred1" (x1::x2::x3::x4::stk);
=TEX
=SML
fun ⦏red_decl_semi_pred1⦎
	(Parsed(PPDecl rd))
	(Parsed(PPPred p)) _ = (
	PPDecl (rd @ [([], p)])
) | red_decl_semi_pred1 x1 x2 stk =
		stack_error "red_decl_semi_pred1" (x1::x2::stk);
=TEX
=SML
fun ⦏red_var_decs_pred1⦎
	(Parsed(PPSomeExprs es)) _
	(Parsed(PPPred p)) _ = (
	PPDecl [(es, p)]
) | red_var_decs_pred1 x1 x2 x3 stk =
		stack_error "red_var_decs_pred1" (x1::x2::x3::stk);
=TEX
=SML
fun ⦏red_var_decs_pred1_semi⦎ x1 x2 x3 _ stk = (
	red_var_decs_pred1 x1 x2 x3 stk
);
=TEX
=SML
fun ⦏red_pred1_as_decl_semi⦎ (Parsed(PPPred p)) _ _ = (
		PPDecl [([], p)]
) | red_pred1_as_decl_semi x1 x2 stk =
		stack_error "red_pred1_as_decl_semi" (x1::x2::stk);
=TEX
=SML
=SML
fun ⦏red_decl_semi_var_decs_pred1_semi⦎ x1 x2 x3 x4 _ stk= (
	red_decl_semi_var_decs_pred1 x1 x2 x3 x4 stk
);
=TEX
=SML
fun ⦏red_decl_semi_pred1_semi⦎ x1 x2 _ stk = (
	red_decl_semi_pred1 x1 x2 stk
);
=TEX
=SML
val ⦏red_expr1_as_expr0⦎ = red_accept;
=TEX
=SML
fun ⦏red_lambda⦎
	_
	(Parsed(PPSchText st)) _
	(Parsed(PPPred p)) _ = (
	 PPPred(PredLambda (st, p))
) | red_lambda x1 x2 x3 x4 stk =
		stack_error "red_lambda" (x1::x2::x3::x4::stk);
=TEX
=SML
fun ⦏red_mu⦎
	_
	(Parsed(PPSchText st)) _
	(Parsed(PPPred p)) _ = (
	 PPPred(PredMu (st, Value p))
) | red_mu x1 x2 x3 x4 stk =
		stack_error "red_mu" (x1::x2::x3::x4::stk);
=TEX
=SML
fun ⦏red_mu_no_spot⦎
	_ _
	(Parsed(PPSchText st)) _ _ = (
	 PPPred(PredMu (st, Nil))
) | red_mu_no_spot x1 x2 x3 x4 stk =
		stack_error "red_mu_no_spot" (x1::x2::x3::x4::stk);
=TEX
=SML
fun ⦏red_no_eq_defs⦎ _ = PPEqDefs [];
=TEX
=SML
fun ⦏red_some_eq_defs⦎ (Parsed(PPEqDefs eds)) _ = (
	PPEqDefs eds
) | red_some_eq_defs x1 stk =
		stack_error "red_some_eq_defs" (x1::stk);
=TEX
=SML
fun ⦏red_eq_def_as_eq_defs⦎ (Parsed(PPEqDef ed)) _ = (
	PPEqDefs [ed]
) | red_eq_def_as_eq_defs x1 stk =
		stack_error "red_eq_def_as_eq_defs" (x1::stk);
=TEX
=SML
fun ⦏red_eq_defs⦎
	(Parsed(PPEqDef ed)) _
	(Parsed(PPEqDefs eds)) _ = (
	PPEqDefs (ed :: eds)
) | red_eq_defs x1 x2 x3 stk =
		stack_error "red_eq_defs" (x1::x2::x3::stk);
=TEX
=SML
val ⦏red_expr2_as_expr1⦎ = red_accept;
=TEX
This phase fills in all stubs in templates as underscores. It is left to
the second phase to check the templates and fill in the correct stubs.
=SML
fun ⦏red_pre_op⦎ (Token (ZTId i, _)) (Parsed(PPDecor d)) (Parsed(PPPred p)) _ = (
	PPPred(PredFancyFix(TmplPre((i,Nil), StubUS), d, [[p]]))
) | red_pre_op x1 x2 x3 stk =
		stack_error "red_pre_op" (x1::x2::x3::stk);
=TEX
=SML
fun ⦏red_post_op⦎ (Parsed(PPPred p)) (Token (ZTId i, _)) (Parsed(PPDecor d)) _ = (
	PPPred(PredFancyFix(TmplPost(StubUS, (i,Nil)), d, [[p]]))
) | red_post_op x1 x2 x3 stk =
		stack_error "red_post_op" (x1::x2::x3::stk);
=TEX
=SML
=TEX
=SML
fun ⦏red_in_op⦎ (Parsed(PPPred p1)) (Token (ZTId i, _)) (Parsed(PPDecor d))
		(Parsed(PPPred p2)) _ = (
	PPPred(PredFancyFix(TmplIn(StubUS, (i,Nil), StubUS), d, [[p1], [p2]]))
) | red_in_op x1 x2 x3 x4 stk =
		stack_error "red_in_op" (x1::x2::x3::x4::stk);
=TEX
=SML
fun ⦏core_aux⦎ (i1 : ID) ((arg1, rest) : CORE_EXPR) (i2 : ID)
	: CORE * ((PRED list) list) = (
	(	(i1, Value (map (fn (i, _) => (StubUS, i)) rest, (StubUS, i2))),
		arg1 :: map (fn (_, arg) => arg)  rest)
);
=TEX
=SML
fun ⦏red_bo_ce_eo⦎ (Token (ZTId b, _))
		(Parsed(PPCoreExpr ce)) (Token (ZTId e, _)) (Parsed(PPDecor d)) _ = (
	let	val (c, args) = core_aux b ce e;
	in	PPPred(PredFancyFix(TmplNon c, d, args))
	end
) | red_bo_ce_eo x1 x2 x3 x4 stk =
		stack_error "red_bo_ce_eo" (x1::x2::x3::x4::stk);
=TEX
=SML
fun ⦏red_bo_ce_peo⦎ (Token (ZTId b, _))
		(Parsed(PPCoreExpr ce))
		(Token (ZTId e, _)) (Parsed(PPDecor d))
		(Parsed(PPPred p)) _ = (
	let	val (c, args) = core_aux b ce e;
	in	PPPred(PredFancyFix(TmplPre(c, StubUS), d, args @ [[p]]))
	end
) | red_bo_ce_peo x1 x2 x3 x4 x5 stk =
		stack_error "red_bo_ce_peo" (x1::x2::x3::x4::x5::stk);
=TEX
=SML
fun ⦏red_pbo_ce_eo⦎ (Parsed(PPPred p))
		(Token (ZTId b, _))
		(Parsed(PPCoreExpr ce))
		(Token (ZTId e, _))  (Parsed(PPDecor d)) _ = (
	let	val (c, args) = core_aux b ce e;
	in	PPPred(PredFancyFix(TmplPost(StubUS, c), d, [p] :: args))
	end
) | red_pbo_ce_eo x1 x2 x3 x4 x5 stk =
		stack_error "red_pbo_ce_eo" (x1::x2::x3::x4::x5::stk);
=TEX
=SML
fun ⦏red_pbo_ce_peo⦎ (Parsed(PPPred p1))
		(Token (ZTId b, _))
		(Parsed(PPCoreExpr ce))
		(Token (ZTId e, _)) (Parsed(PPDecor d))
		(Parsed(PPPred p2)) _ = (
	let	val (c, args) = core_aux b ce e;
	in	PPPred(PredFancyFix(TmplIn(StubUS, c, StubUS), d, [p1]::args@[[p2]]))
	end
) | red_pbo_ce_peo x1 x2 x3 x4 x5 x6 stk =
		stack_error "red_pbo_ce_peo" (x1::x2::x3::x4::x5::x6::stk);
=TEX
=SML
fun ⦏red_cross⦎ (Parsed(PPPred p1)) _ (Parsed(PPPred p2)) _ = (
	PPPred(PredCrossProduct(
		case (p1, p2) of
			(PredCrossProduct ps1, PredCrossProduct ps2) => ps1 @ ps2
		|	(PredCrossProduct ps1, _) => ps1 @ [p2]
		|	(_, PredCrossProduct ps2) => p1 :: ps2
		|	(_, _) => [p1, p2]))
) | red_cross x1 x2 x3 stk =
		stack_error "red_cross" (x1::x2::x3::stk);
=TEX
=SML
fun ⦏red_exprs⦎ (Parsed (PPSomeExprs ps)) _ = (
	PPCoreExpr(ps, [])
) | red_exprs x1 stk =
		stack_error "red_exprs" (x1::stk);
=TEX
=SML
fun ⦏red_es_to_ce⦎
		(Parsed (PPSomeExprs ps))
		(Token (ZTId e, _))
		(Parsed (PPCoreExpr (a, r))) _ = (
	PPCoreExpr(ps, (e, a) :: r)
) | red_es_to_ce x1 x2 x3 stk =
		stack_error "red_es_to_ce" (x1::x2::x3::stk);
=TEX
=SML
fun ⦏red_no_exprs⦎ _ = (
	PPSomeExprs []
);
=TEX
=SML
val ⦏red_some_exprs⦎ = red_accept;
=TEX
=SML
val ⦏red_pred1_as_some_exprs⦎ = red_accept_pred_as_list;
=TEX
=SML
fun ⦏red_pred1_comma_some_exprs⦎ p _ ps stk = (
	add_pred_to_list_aux p ps stk
);
=TEX
=SML
val ⦏red_expr3_as_expr2⦎ = red_accept;
=TEX
=SML
fun ⦏red_pow⦎ _ (Parsed (PPPred p)) _ = (
	PPPred(PredPow p)
) | red_pow x1 x2 stk =
		stack_error "red_pow" (x1::x2::stk);
=TEX
=SML
val ⦏red_expr4_as_expr3⦎ = red_accept;
=TEX
=SML
fun ⦏red_expr3_expr4⦎ (Parsed(PPPred p1)) (Parsed(PPPred p2)) _ = (
	PPPred(PredApplication(p1, p2))
) | red_expr3_expr4 x1 x2 stk =
		stack_error "red_expr3_expr4" (x1::x2::stk);
=TEX
=SML
fun ⦏red_theta⦎ _ (Parsed(PPPred p)) _ = (
	PPPred(PredTheta p)
) | red_theta x1 x2 stk =
		stack_error "red_theta" (x1::x2::stk);
=TEX
=SML
val ⦏red_expr4_as_expr4a⦎ = red_accept;
=TEX
=SML
fun ⦏red_expr4a_dot_expr4⦎ (Parsed(PPPred p1)) _ (Parsed(PPPred p2)) _ = (
	PPPred(PredSelection(p1, p2))
) | red_expr4a_dot_expr4 x1 x2 x3 stk =
		stack_error "red_expr4a_dot_expr4" (x1::x2::x3::stk);
=TEX
=SML
fun ⦏red_id_dec_as_exp⦎ (Parsed(PPIdDec id)) _ = (
	PPPred(PredIdDec id)
) | red_id_dec_as_exp x1 stk =
		stack_error "red_id_dec_as_exp" (x1::stk);
=TEX
=SML
fun ⦏red_quotation⦎ (Token(ZTAqTm tm, _)) _ = (
	PPPred(PredQuotation tm)
) | red_quotation x1 stk =
		stack_error "red_quotation" (x1::stk);
=TEX
=SML
fun ⦏stub_aux⦎ (Token (ZTUnderScore, _)) = StubUS
|   stub_aux (Token (ZTDots, _)) = StubEll
|   stub_aux (Token (ZTUnderScoreQuery, _)) = StubUSQ
|   stub_aux (Token (ZTUnderScoreExclam, _)) = StubUSE
|   stub_aux _ = raise PARSER_ERROR "stub_aux";
=TEX
=SML
fun ⦏red_stub⦎ tk _ = (
	PPPred(PredPlaceHolder(stub_aux tk))
);
=TEX
=SML
fun ⦏red_number⦎ (Token (ZTNumber n, _)) _ = (
	PPPred(PredNumber n)
) | red_number x1 stk =
		stack_error "red_number" (x1::stk);
=TEX
=SML
fun ⦏red_float⦎ (Token (ZTFloat xpe, _)) _ = (
	PPPred(PredFloat xpe)
) | red_float x1 stk =
		stack_error "red_float" (x1::stk);
=TEX
=SML
fun ⦏red_string⦎ (Token (ZTString s, _)) _ = (
	PPPred(PredString s)
) | red_string x1 stk =
		stack_error "red_string" (x1::stk);
=TEX
=SML
fun ⦏red_tuple⦎ _ (Parsed(PPPred p)) _ (Parsed(PPSomeExprs ps)) _ _ = (
	PPPred(PredTuple(p :: ps))
) | red_tuple x1 x2 x3 x4 x5 stk =
		stack_error "red_tuple" (x1::x2::x3::stk);
=TEX
=SML
fun ⦏red_binding⦎ _ (Parsed(PPEqDefs eds)) _ _ = (
	PPPred(PredBinding eds)
) | red_binding x1 x2 x3 stk =
		stack_error "red_binding" (x1::x2::x3::stk);
=TEX
=SML
fun ⦏red_set_display⦎ _ (Parsed(PPSomeExprs ps)) _ _ = (
	PPPred(PredSetDisplay ps)
) | red_set_display x1 x2 x3 stk =
		stack_error "red_set_display" (x1::x2::x3::stk);
=TEX
=SML
fun ⦏red_seq_display⦎ _ (Parsed(PPSomeExprs ps)) _ _ = (
	PPPred(PredSeqDisplay ps)
) | red_seq_display x1 x2 x3 stk =
		stack_error "red_seq_display" (x1::x2::x3::stk);
=TEX
=SML
fun ⦏red_set_comp_no_spot⦎
	_ (Parsed(PPSchText st)) _ _ = (
	PPPred(PredSetComp(st, Nil))
) | red_set_comp_no_spot x1 x2 x3 stk =
		stack_error "red_set_comp_no_spot" (x1::x2::x3::stk);
=TEX
=SML
fun ⦏red_set_comp⦎
	_ (Parsed(PPSchText st))
	_ (Parsed(PPPred p)) _ _ = (
	PPPred(PredSetComp(st, Value p))
) | red_set_comp x1 x2 x3 x4 x5 stk =
		stack_error "red_set_comp" (x1::x2::x3::x4::x5::stk);
=TEX
=SML
fun ⦏red_h_schema⦎
	_ (Parsed(PPSchText st)) _ _ = (
	PPPred(PredHorizSchema st)
) | red_h_schema x1 x2 x3 stk =
		stack_error "red_h_schema" (x1::x2::x3::stk);
=TEX
=SML
fun ⦏red_gen_inst⦎ _ (Parsed(PPSomeExprs ps)) _ _ = (
	PPPred(PredGenInst ps)
) | red_gen_inst x1 x2 x3 stk =
		stack_error "red_gen_inst" (x1::x2::x3::stk);
=TEX
=SML
val ⦏red_rename_list_as_expr⦎ = red_accept;
=TEX
=SML
fun ⦏red_brk_pred⦎ _ (Parsed(PPPred p)) _ _ = (
	PPPred(PredBracketed (p, ""))
) | red_brk_pred x1 x2 x3 stk =
		stack_error "red_brk_pred" (x1::x2::x3::stk);
=TEX
=SML
fun ⦏red_pred_decor⦎ _ (Parsed(PPPred p)) _ (Token (ZTDecor d, _)) _ = (
	PPPred(PredBracketed (p, d))
) | red_pred_decor x1 x2 x3 x4 stk =
		stack_error "red_pred_decor" (x1::x2::x3::x4::stk);
=TEX
=SML
fun ⦏red_id_dec⦎ (Token (ZTId i, _)) (Parsed(PPDecor d)) _ = (
	PPIdDec (i, d)
) | red_id_dec x1 x2 stk =
		stack_error "red_id_dec" (x1::x2::stk);
=TEX
=SML
fun ⦏red_no_decor⦎ _ = PPDecor "";
=TEX
=SML
fun ⦏red_decor⦎  (Token (ZTDecor d, _)) _ = (
	PPDecor d
) | red_decor x1 stk =
		stack_error "red_decor" (x1::stk);

=TEX
\section{THE GENERATED PARSER}\label{THEGENERATEDPARSER}
We can now load the code generated by SLRP from the grammar
of \cite{DS/FMU/IED/DTD061}.
=TEX
=SML
end (* of local ... in *);
end (* of structure *);
structure ZParser = struct
local
open ZParser;
open ZUserInterfaceSupport;
open ZLex;
open Unification;
=SML
=INCLUDE
dtd061.grm.sml
=TEX
=SML
in
open ZParser;

val slrp'gen_parser = slrp'gen_parser;
=TEX
=SML
end (* of local ... in *);
end (* of structure *);
structure ZParser = struct
local
open ZParser;
open ZUserInterfaceSupport;
open ZLex;
open Unification;
=TEX
\section{CONFLICT RESOLUTION}\label{CONFLICTRESOLUTION}
The simple conflict resolution technique is adequate, i.e. just
using $simple\_resolver$ from \cite{DS/FMU/IED/DTD017}. To do this
we just need to define a function to compare the precedence of
two fancyfix operators. We have to bear in mind the various
rules of \cite{DS/FMU/IED/DEF007}.

There are 24 shift/reduce conflicts to attend to. We can reconcile
this with the grammar of \cite{DS/FMU/IED/DTD061} as shown in the
following table (in which we use the names of the reduction functions,
with the leading $red\_$ dropped
to identify the alternatives in the productions):

\begin{tabular}{|l|l|l|l|}\hline
Alternative & No. of Conflicts & First Token & Second Token(s) \\\hline
$log\_in\_op$	& 1	& $LogInOp$	& $LogInOp$ \\\hline
$sch\_in\_op$	& 1	& $SchInOp$	& $SchInOp$ \\\hline
$log\_in\_op$	& 1	& $LogInOp$	& $SchInOp$ \\\hline
$sch\_in\_op$	& 1	& $SchInOp$	& $LogInOp$ \\\hline
$pre\_op$	& 4	& $PreOp$	& $Cross$, $PostBeginOp$, $InOp$, $PostOp$\\\hline
$in\_op$	& 4	& $InOp$	& $Cross$, $PostBeginOp$, $InOp$, $PostOp$\\\hline
$bo\_ce\_peo$	& 4	& $PreEndOp$	& $Cross$, $PostBeginOp$, $InOp$, $PostOp$\\\hline
$pbo\_ce\_peo$	& 4	& $PreEndOp$	& $Cross$, $PostBeginOp$, $InOp$, $PostOp$\\\hline
$cross$		& 4	& $Cross$	& $Cross$, $PostBeginOp$, $InOp$, $PostOp$\\\hline
\end{tabular}

We encode the precedence using int-int-ASSOC triples so that we can implement
the three-tiered rules given for the fancy-fix forms (in which all the
$rel$s have (equal) lowest precedence and all the $gen$s have lower
precedence than $Cross$ which has lower precedence than all the $fun$s).
The second component of the triple is 0 in the case of
$LogInOp$ and $SchInOp$.
The third component gives the associativity.
The following table describes the first two components of the triple:

\begin{tabular}{|l|l|l|}\hline
Symbol		& $fst$ & $snd$ \\\hline
$LogInOp$	& 0	& $⇔ ↦ 10$, $⇒ ↦ 11$, $∨ ↦ 12$, $∧ ↦ 13$\\\hline
$SchInOp$	& 0	& $⨾ ↦ 0$, $↾ ↦ 1$, ${>}{>} ↦ 2$ \\\hline
$rel$		& 2	& 0 (only relevant in extended Z) \\\hline
$gen$		& 3	& user-defined \\\hline
$Cross$		& 4	& 0 \\\hline
$fun$		& 5 	& user-defined \\\hline
\end{tabular}

Given a token, the following function computes the precedence gfipld
=SML
fun  ⦏give_class_prec⦎ (cl : CLASS) : (int * int * ASSOC) = (
	case cl of
		(ZClFun (prc, assoc)) => (5, prc, assoc)
	|	(ZClGen (prc, assoc)) => (3, prc, assoc)
	|	ZClRel => (2, 0, RightAssoc)
);
=TEX
=SML
fun ⦏id_prec⦎  (id : string) : (int * int * ASSOC) = (
	case get_zfixity_info id of
		Value ((_, (ZClFun (prc, assoc))), _) => (5, prc, assoc)
	|	Value ((_, (ZClGen (prc, assoc))), _) => (5, prc, assoc)
	|	Value ((_, ZClRel), _) => (2, 0, RightAssoc)
	|	_ => raise PARSER_ERROR "invalid argument to classify_id"
);
fun ⦏give_prec⦎  (tok : Z_TOKEN) : (int * int * ASSOC) = (
	case tok of
		ZTId id			=>	id_prec id
	|	ZT×			=>	(5, 8, RightAssoc)
	|	ZT∧ _			=>	(0, 13, RightAssoc)
	|	ZT∨ _			=>	(0, 12, RightAssoc)
	|	ZT⇒ _			=>	(0, 11, RightAssoc)
	|	ZT⇔ _			=>	(0, 10, RightAssoc)
	|	ZTPipe			=>	(0, 2, RightAssoc)
	|	ZT↾			=>	(0, 1, LeftAssoc)
	|	ZT⨾			=>	(0, 0, RightAssoc)
	|	_			=>	(0, 0, RightAssoc)
);
=TEX
The following function compares two token-class pairs and gives the appropriate
resolution as required by the function $simple\_resolver$.
Note that there is an anomalous case when the numeric precedences are equal
but the associativities are different. We report this as an error.
=SML
fun ⦏z_resolver⦎
	(((toka, _), (tokb, _)) : (Z_TOKEN * Z_LEX_CLASS) * (Z_TOKEN * Z_LEX_CLASS))
	: RESOLUTION = (
	let	val (a1, a2, a_assoc) = give_prec toka;
		val (b1, b2, b_assoc) = give_prec tokb;
		fun resolver_error msg_id = (
			let val inserts = [format_z_token toka, format_z_token tokb];
			in	diag_string (get_error_message 61015 inserts);
				diag_string (get_error_message msg_id inserts);
				diag_string (get_error_message 61018 []);
				raise SYNTAX_ERROR
			end
		);
	in	if	a1 < b1 orelse (a1 = b1 andalso a2 <  b2)
		then	DoShift
		else if	(a1 = b1 andalso a2 = b2)
		then	case (a_assoc, b_assoc) of
				(RightAssoc, RightAssoc) => DoShift
			|	(LeftAssoc, LeftAssoc) => DoReduce
			|	(RightAssoc, LeftAssoc) => resolver_error 61016
			|	(LeftAssoc, RightAssoc) => resolver_error 61017		else	DoReduce
	end
);
=TEX
\section{READER FUNCTION}\label{READERFUNCTION}
The following function is used to ``read'' a token off a list of same:
=SML
fun ⦏z_reader⦎ (ip : Z_TOKEN list) : Z_TOKEN * (Z_TOKEN list) = (
	case ip of
		(h :: more) => (h, more)
	|	[] => (ZTEos, [])
);
=TEX
\section{PHASE 1 INTERFACE}\label{PHASE1INTERFACE}
=SML
in
open ZParser;
fun ⦏phase_1⦎ (tokens : Z_TOKEN list) : PP = (
	let	val myclassify = classify
			(is_nil tokens orelse
			 classify true (hd tokens) <> FixityClass);
		val res = (Value(slrp'gen_parser
					(simple_resolver z_resolver) myclassify
					phase_1_error
					z_reader tokens))
			handle	SYNTAX_ERROR => Nil
			|	PARSER_ERROR msg => (
					error "Z-Parser" 61007 [fn()=>msg]
				);
	in	case res of
			Value thing => thing
		|	Nil => fail "Z-Parser" 61000 []
	end
);
=TEX
=SML
end (* of local ... in *);
end (* of structure *);
structure ZParser = struct
open ZParser;
open ZUserInterfaceSupport;
open ZLex;
open Unification;
=TEX
\newpage
\section{PHASE 2 ERROR REPORTING}\label{PHASE2ERRORREPORTING}
The following function is used to report a phase 2 error:
=TEX
=SML
fun  ⦏phase_2_error⦎ (msg_no : int) (inserts : string list) : 'a = (
	let	val msg = get_error_message msg_no inserts;
	in	diag_string msg;
		fail "Z-Parser" 61000 []
	end
);
=TEX
\section{PHASE 2 TRANSFORMATION FUNCTIONS}\label{PHASE2TRANSFORMATIONFUNCTIONS}
=SML
fun ⦏is_dec_name⦎ (p : PRED) : bool = (
	case p of
		PredFancyFix (tmpl, decor, args) => (
			all args (fn [PredPlaceHolder _] => true | _ => false)
	) |	PredIdDec (id, decor) => true
	|	_ => false
);
=TEX
=SML
fun ⦏is_var_name⦎ (p : PRED) : bool = (
	case p of
		PredBracketed(PredFancyFix (tmpl, _, args), "") => (
			all args (fn [PredPlaceHolder _] => true | _ => false)
	) |	PredIdDec (id, _) => true
	|	_ => false
);
=TEX
$check\_template$ is used to check a fancy-fix application.
N.b. it is not used for DecNames or VarNames (for which the placeholder
must match as well as the identifiers).
=SML
fun ⦏check_template⦎ (tmpl : TEMPLATE) : TEMPLATE = (
	let	val stored_tmpl = get_stored_tmpl tmpl;
		fun aux t = map fst(tmpl_ids t ZClRel);
	in	if aux tmpl = aux stored_tmpl
		then	stored_tmpl
		else	phase_2_error
			61004
			[format_template tmpl,
			get_error_message 61101 [],
			format_template stored_tmpl]
	end
);
=TEX
=SML
fun ⦏x_id_dec⦎ (iddec as (id, decor) : ID * DECOR) : TEMPLATE * DECOR = (
	(TmplNon(id, Nil), decor)
);
=TEX
=SML
fun ⦏x_var_dec_name⦎
	(msg_no : int)
	(act_p : PRED)
	((PredFancyFix (tmpl, decor, args)) : PRED) : TEMPLATE * DECOR = (
	let	fun aux [PredPlaceHolder st] = Value st
		|   aux _ = Nil;
		val stored_tmpl = get_stored_tmpl tmpl;
	in
		if	tmpl_ids tmpl ZClRel <> tmpl_ids stored_tmpl ZClRel
		orelse	map aux args <> map Value (tmpl_stubs stored_tmpl)
		then	phase_2_error
			61004
			[format_pred act_p,
			get_error_message msg_no [],
			format_template stored_tmpl]
		else 	(stored_tmpl, decor)
	end
) | x_var_dec_name msg_no act_p (p as PredQuotation tm) = (
	let	val (nm, _) = dest_var tm handle Fail _ => dest_const tm;
	in	(TmplNon(nm, Nil), "")
	end	handle Fail _ => (
			phase_2_error
			61012
			[format_pred act_p, get_error_message msg_no []]
		)
) | x_var_dec_name _ _ (PredIdDec iddec) = (
	x_id_dec iddec
) | x_var_dec_name msg_no act_p p = (
	phase_2_error
	61012
	[format_pred act_p, get_error_message msg_no []]
);
=TEX
=SML
fun ⦏x_dec_name⦎ (p : PRED) : TEMPLATE * DECOR = (
	x_var_dec_name 61103 p p
);
=TEX
=SML
fun ⦏x_var_name⦎ (act_p as (PredBracketed (p, "")) : PRED) : TEMPLATE * DECOR = (
	x_var_dec_name 61103 act_p p
) | x_var_name (p as (PredIdDec _)) = (
	x_var_dec_name 61103 p p
) | x_var_name p  = (
	phase_2_error
	61012
	[format_pred p, get_error_message 61103 []]
);
=TEX
=SML
fun ⦏x_fancyfix_args⦎
	(expr : bool)
	(xp : bool -> PRED -> Z_TM)
	(tmpl : TEMPLATE)
	(decor : DECOR)
	(args : PRED list list) : Z_TM = (
	let	val stored_tmpl = check_template tmpl;
		val stubs = tmpl_stubs stored_tmpl;
		fun do1 (StubEll, ps) = ZTm⟨⟩(Nil, map (xp true) ps)
		|   do1 (StubUS, [p]) = xp true p
		|   do1 (StubUSQ, [p]) = ZTmPredContext(xp false p)
		|   do1 (StubUSE, [p]) = (
			if	expr
			then	xp true p
			else	ZTmPredContext(xp false p)
		) | do1 (_, ps) = (
			phase_2_error
			61005
			[format_list format_pred ps ", ",
			format_template  stored_tmpl]
		);
		val stubs_args = (combine stubs args)
			handle Fail _ => raise PARSER_ERROR "invalid fancyfix application";
	in	ZTmFancyApp((stored_tmpl, decor), ZTmTuple (map do1 stubs_args))
	end
);
=TEX
=SML
fun ⦏x_gen_inst_as_schema⦎
	(xp : bool -> PRED -> Z_TM)
	(ps : PRED list) : Z_TM = (
	case ps of
		[p] => ZTmHorizSchema ([ZDSchemaDec((xp true p), Nil)], Nil, Nil)
	|	_ =>
		phase_2_error
		61006
		[format_pred (PredGenInst ps),
		get_error_message 61105 []]
);
=TEX
=SML
fun ⦏x_pred_gen_inst⦎
	(xp : bool -> PRED -> Z_TM)
	(p : PRED)
	(ps : PRED list) : Z_TM = (
	case p of
		PredApplication(p1, p2) => (
			if is_var_name p2
			then ZTmApp(xp true p1,ZTmLVar(x_var_name p2, Nil, map (xp true) ps))
			else ZTmApp(xp true p, x_gen_inst_as_schema xp ps)
	) |	_ =>  (
			if is_var_name p
			then ZTmLVar(x_var_name p, Nil, map (xp true) ps)
			else ZTmApp(xp true p, x_gen_inst_as_schema xp ps)
	)
);
=TEX
=SML
fun ⦏x_sch_in_op⦎ (Pipe : SCH_IN_OP) : (Z_TM * Z_TM) -> Z_TM = ZTmPipe
|   x_sch_in_op Filter = ZTm↾
|   x_sch_in_op Comp = ZTm⨾;
=TEX
=SML
fun ⦏check_for_semis⦎ (true : bool)
	(p as (PredLogInOp(_, ZLogInOpSemi, _)) : PRED) : unit = (
	phase_2_error
	61008
	[format_pred p]
) | check_for_semis _ _ = ( ()
);
=TEX
=SML
fun ⦏x_sch_pre_op⦎ (Pre : SCH_PRE_OP) : Z_TM -> Z_TM = ZTmPre
|   x_sch_pre_op Delta = ZTmΔ
|   x_sch_pre_op Xi = ZTmΞ;
=TEX
=SML
fun ⦏quant_expr⦎ (ZQuant∀ b : Z_QUANT) : bool = b
|   quant_expr (ZQuant∃ b) = b
|   quant_expr (ZQuant∃⋎1 b) = b;
=TEX
=SML
fun ⦏log_in_op_expr⦎ (ZLogInOp∧ b : Z_LOG_IN_OP) : bool = b
|   log_in_op_expr (ZLogInOp∨ b) = b
|   log_in_op_expr (ZLogInOp⇒ b) = b
|   log_in_op_expr (ZLogInOp⇔ b) = b
|   log_in_op_expr _ = false;
=TEX
The following implements the logic of the non-standard requirement to subscript schema operators.
If the non-standard option is turned on, the form of the operator
determines the interpretation of a construct as an expression or a predicate.
If the option is turned off, the context influences the decision as well as the form of the operator.
=SML
fun ⦏schema_op_expr⦎ (expr : bool) (is_sub : bool) : bool = (
	if	subscript_z_schema_ops()
	then	is_sub
	else	expr orelse is_sub
);
=TEX
The main function for transforming $PRED$s is parameterised by
a flag indicating whether the context demands an expression.
The flag is true if an expression is required and false if
a predicate is allowed.
=SML
val ⦏max_selector⦎ : INTEGER = @@"1000000";
fun ⦏x_pred⦎ (expr : bool) (p : PRED) : Z_TM = (
	case p of
		PredQuantifier (q, st, p) =>
			let	val expr' = schema_op_expr expr (quant_expr q);
				val xst = x_sch_text st;
				val xp = x_pred expr' p
			in	if expr'
				then ZTmQuant⋎S(q, xst, xp)
				else ZTmQuant⋎F(q, xst, xp)
			end
	|	PredLet (eqdefs, p) =>
			ZTmLet(map x_loc_eq_def eqdefs, x_pred expr p)
	|	PredLogInOp (p1, rator, p2) =>
			let	val expr' = schema_op_expr expr (log_in_op_expr rator);
				val xp1 = x_pred expr' p1;
				val xp2 = x_pred expr' p2;
				val side_effect = check_for_semis expr' p;
			in	if expr'
				then ZTmLogInOp⋎S(rator, xp1, xp2)
				else ZTmLogInOp⋎F(rator, xp1, xp2)
			end
	|	PredNot (b, p) =>
			if schema_op_expr expr b
			then ZTm¬⋎S(x_pred true p)
			else ZTm¬⋎F(x_pred false p)
	|	PredSchInOp (p1, rator, p2) =>
			x_sch_in_op rator (x_pred true p1, x_pred true p2)
	|	PredSchPreOp (rator, p) =>
			x_sch_pre_op rator (x_pred true p)
	|	PredSchemaHiding (p, ps) =>
			ZTmHide(x_pred true p, map x_dec_name ps)
	|	PredMu (st, Value p) =>
			ZTmμ2 (x_sch_text st, x_pred true p)
	|	PredMu (st, Nil) =>
			ZTmμ1 (x_sch_text st)
	|	PredLambda (st, p) =>
			ZTmλ (x_sch_text st, x_pred true p)
	|	PredFancyFix (tmpl, decor, args) =>
			x_fancyfix_args expr x_pred tmpl decor args
	|	PredCrossProduct ps =>
			ZTm×(map (x_pred true) ps)
	|	PredPow p => ZTmℙ (x_pred true p)
	|	PredApplication (p, PredGenInst ps) =>
			x_pred_gen_inst x_pred p ps
	|	PredApplication (p, PredRenameList pps) =>
			let	val xp = x_pred true p;
				val xpps = map (x_dec_name ** x_dec_name) pps
			in	ZTmRename(xp, xpps)
			end
	|	PredApplication (p1, p2) =>
			ZTmApp(x_pred true p1, x_pred true p2)
	|	PredTheta (PredIdDec (id, dec)) =>
			ZTmθ(ZTmLVar(x_var_name (PredIdDec (id, "")), Nil, []), dec)
	|	PredTheta (PredBracketed (p, dec)) =>
			ZTmθ(ZTmBracketed(x_pred true p), dec)
	|	PredTheta p =>
			ZTmθ(x_pred true p, "")
	|	PredSelection (p1, p2) =>
			if is_var_name p2
			then	ZTmSel⋎B(x_pred true p1, x_var_name p2)
			else (case p2 of
				PredNumber n =>
					if n @<= max_selector
					then ZTmSel⋎T
						(x_pred true p1,
						 int_of_integer n)
					else phase_2_error 61014
						[string_of_integer n,
						 string_of_integer max_selector]
			| 	_ => phase_2_error 61007 [format_pred p2]
			)		
	|	PredIdDec _ => ZTmLVar(x_var_name p, Nil, [])
	|	PredQuotation tm => ZTmQuotation (tm, Nil)
	|	PredPlaceHolder _ =>
			phase_2_error 61008 [format_pred p]
	|	PredNumber n =>
			ZTmℤ n
	|	PredString s =>
			ZTmString s
	|	PredFloat xpe =>
			ZTmFloat xpe
	|	PredTuple ps =>
			ZTmTuple (map (x_pred true) ps)
	|	PredBinding eqdefs =>
			ZTmBinding(map x_loc_eq_def eqdefs)
	|	PredSetDisplay ps  =>
			ZTmSetd (Nil, map (x_pred true) ps)
	|	PredSeqDisplay ps  =>
			ZTm⟨⟩ (Nil, map (x_pred true) ps)
	|	PredSetComp (st, Value p) =>
			ZTmSeta2 (x_sch_text st, x_pred true p)
	|	PredSetComp (st, Nil) =>
			ZTmSeta1 (x_sch_text st)
	|	PredHorizSchema st =>
			ZTmHorizSchema (x_sch_text st)
	|	PredGenInst ps =>
			x_gen_inst_as_schema x_pred ps
	|	PredRenameList renames =>
			phase_2_error 61010
			[format_pred p,
			get_error_message 61109[],
			get_error_message 61110 []]
	|	PredBracketed (p1, "") =>
			if is_var_name p
			then ZTmLVar(x_var_name p, Nil, [])
			else ZTmBracketed(x_pred expr p1)
	|	PredBracketed (p1, decor) =>
			if is_var_name p
			then ZTmDecor(ZTmLVar(x_var_name p, Nil, []), decor, Nil)
			else ZTmDecor(x_pred true(PredBracketed(p1, "")), decor, Nil)
)
and ⦏x_sch_text⦎ ((decl, popt) : SCH_TEXT) = (x_decl decl, x_pred_opt false popt, Nil)
and ⦏x_pred_opt⦎ (expr : bool)(Value p : PRED OPT) = Value (x_pred expr p)
|    x_pred_opt _ Nil = Nil
and ⦏x_decl⦎ (decl : DECL) : (Z_DEC list) = (
	let	fun x_dec (ps, p) = (
			case ps of
				_::_	=>
					let	val xps = map x_dec_name ps;
						val xp = x_pred true p;
					in	ZDDec (xps, xp, Nil)
					end
			|	[]	=> ZDSchemaDec (x_pred true p, Nil)
		);
	in	map x_dec decl
	end		
)
and ⦏x_loc_eq_def⦎ ((lp, rp) : EQ_DEF) : Z_EQ_DEF = (
	(x_dec_name lp, x_pred true rp)
);
=TEX
The following function extracts any leading generic formal parameter list
from a $PRED$.
=SML
fun ⦏get_gpars⦎ (p : PRED) : (IDENT list * PRED) = (
	case p of
		PredLogInOp (p1, rator, p2) =>
			let val (pars, p1') = get_gpars p1
			in	(pars, PredLogInOp (p1', rator, p2))
			end
	|	PredSchInOp (p1, rator, p2) =>
			let val (pars, p1') = get_gpars p1
			in	(pars, PredSchInOp (p1', rator, p2))
			end
	|	PredSchemaHiding (p, ps) =>
			let val (pars, p') = get_gpars p
			in	(pars, PredSchemaHiding (p', ps))
			end
	|	PredFancyFix (TmplPost s, decor, (p::ps) :: more) =>
			let val (pars, p') = get_gpars p
			in	(pars, PredFancyFix(TmplPost s, decor, (p'::ps) :: more))
			end
	|	PredFancyFix (TmplIn s, decor, (p::ps) :: more) =>
			let val (pars, p') = get_gpars p
			in	(pars, PredFancyFix(TmplIn s, decor, (p'::ps) :: more))
			end
	|	PredCrossProduct (p :: ps) =>
			let val (pars, p') = get_gpars p
			in	(pars, PredCrossProduct (p' :: ps))
			end
	|	PredApplication (PredGenInst ps, p2) =>
			if all ps is_dec_name
			then (map x_dec_name ps, p2)
			else ([], p)
	|	PredApplication (p1, p2) =>
			let val (pars, p1') = get_gpars p1
			in	(pars, PredApplication (p1', p2))
			end
	|	PredSelection (p1, p2) =>
			let val (pars, p1') = get_gpars p1
			in	(pars, PredSelection (p1', p2))
			end
	|	_ => ([], p)
);
=TEX
=SML
fun ⦏x_def_lhs⦎ (p : PRED) : IDENT * IDENT list = (
	if is_dec_name p
	then	(x_dec_name p, [])
	else case p of
		PredApplication(p, PredGenInst ps) => (
			(x_var_name p, map x_dec_name ps)
	) |	PredFancyFix (tmpl, decor, preds) => (
			let	fun check_par [_] = true
				|   check_par _ = false;
				val do_pars = map (x_dec_name o hd);
			in	case x_pred false p of
					ZTmFancyApp(id, _) =>
						if	all preds check_par
						then	(id,  do_pars preds)
						else
		phase_2_error 61012
		[format_pred p, get_error_message 61107[]]
				|	_ =>
					phase_2_error 61012
					[format_pred p, get_error_message 61107[]]
			end
	) |	_ => phase_2_error 61012
				[format_pred p, get_error_message 61107[]]
);
=TEX
=SML
fun ⦏x_eq_def⦎ ((lp, rp) : EQ_DEF) : IDENT * IDENT list * Z_TM * EXTYPE OPT = (
	let	val (id, ids) = x_def_lhs lp;
	in	(id, ids, x_pred true rp, Nil)
	end
);
=TEX
=SML
fun ⦏x_branch⦎ (p : PRED) : (IDENT * EXTYPE OPT * (Z_TM OPT))  = (
	case p of
		PredApplication(p1, p2) => (
			(x_var_name p1, Nil, Value(x_pred true p2))
	) |	PredFancyFix (tmpl, decor, preds) => (
			case x_pred false p of
				ZTmFancyApp(id, t) =>
					(id, Nil, Value t)
			|	_ =>
				phase_2_error 61012
				[format_pred p, get_error_message 61108[]]
	) |	_ =>	if is_dec_name p
			then	(x_dec_name p, Nil, Nil)
			else	phase_2_error 61012
				[format_pred p, get_error_message 61108[]]
);
=TEX
=SML
val ⦏x_fixity⦎ : FIXITY -> Z_PARA = ZParaFixity;
=TEX
=SML
fun ⦏x_general_term⦎ (is_quot : bool) (gt : GENERAL_TERM) : Z_PARA = (
	case gt of
		(PredGenInst ps, Value p) =>
			let	val gs = map x_dec_name ps;
				val (ids, p') = get_gpars p;
			in	ZParaGivenSet(gs, Value(ids, x_pred false p'))
			end
	|	(p, Value _) =>
			phase_2_error
			61009 [format_pred p, get_error_message 61106 []]
	|	(PredGenInst [p], Nil) =>
			if is_quot
			then ZParaTerm([], x_gen_inst_as_schema x_pred [p], Nil)
			else if is_dec_name p
			then ZParaGivenSet([x_dec_name p], Nil)
			else ZParaConstraint([], x_gen_inst_as_schema x_pred [p])
	|	(PredGenInst ps, Nil) =>
			ZParaGivenSet(map x_dec_name ps, Nil)
	|	(p, Nil) =>
			let	val (ids, p') = get_gpars p;
			in	if is_quot
				then ZParaTerm(ids, x_pred false p', Nil)
				else ZParaConstraint(ids, x_pred false p')
			end
 );
=TEX
=SML
fun ⦏x_abb_def⦎ (ad : ABB_DEF) : Z_PARA = (
	case ad of
		ADEqDef eqdef => ZParaAbbDef (x_eq_def eqdef)
	|	ADSchemaBox(p, st) =>
			let	val (id, ids) = x_def_lhs p;
			in	ZParaSchBox(id, ids, x_sch_text st, Nil)
			end
		
);
=TEX
=SML
fun ⦏x_free_type_def⦎ (fts : FREE_TYPE_DEF) : Z_PARA = (
	let	fun do1 (p, ps) = (x_dec_name p, map x_branch ps);
	in	ZParaFreeType(map do1 fts)
	end			
);
=TEX
=SML
fun ⦏x_ax_des⦎ ((gps, st): AX_DES) : Z_PARA = (
	ZParaAxDes(map x_dec_name gps, x_sch_text st, Nil)
);
=TEX
=SML
fun ⦏x_conjecture⦎ ((idopt, p) : CONJECTURE) : Z_PARA = (
	let	val (gps, p') = get_gpars p;
		val identopt = case idopt of Value id =>
			Value((TmplNon(id, Nil), ""))
			| Nil => Nil;
	in	ZParaConjecture(identopt, gps, x_pred false p')
	end
);
=TEX
\section{PHASE 2 INTERFACE}\label{PHASE2INTERFACE}
=SML
fun ⦏x_para⦎ (is_quot : bool) (para : PARAGRAPH) : Z_PARA = (
	case para of
		ParFixity fix => x_fixity fix
	|	ParGeneralTerm gt => x_general_term is_quot gt
	|	ParAbbDef ad => x_abb_def ad
	|	ParFreeTypeDef sb => x_free_type_def sb
	|	ParAxDes ab => x_ax_des ab
	|	ParConjecture c => x_conjecture c
);
end (* of structure *);
=TEX
=SML
structure ZParser : ZParser = struct
open ZParser;
open ZLex;
open ZUserInterfaceSupport;
=TEX
=SML
fun ⦏convert_fixity_class⦎ (tok : Z_TOKEN) = (
	case tok of
		ZTId "fun" => Value ZTFun
	|	ZTId "function" => Value ZTFun
	|	ZTId "gen" => Value ZTGen
	|	ZTId "generic" => Value ZTGen
	|	ZTId "rel" => Value ZTRel
	|	ZTId "relation" => Value ZTRel
	|	_ => Nil
);
=TEX
=SML
fun ⦏preprocess_for_fixity_para⦎ (toks as (tok :: more) : Z_TOKEN list) : Z_TOKEN list = (
	case convert_fixity_class tok of
		Value fix_cl_tk => (
			case more of
				((num_tok as ZTNumber _)::ZTId "leftassoc"::more) => (
					fix_cl_tk::num_tok::ZTLeftAssoc::more
			) |	((num_tok as ZTNumber _)::ZTId "rightassoc"::more) => (
					fix_cl_tk::num_tok::ZTRightAssoc::more
			) | 	_ => fix_cl_tk::more
		)
	|	Nil => toks
) | preprocess_for_fixity_para [] = [];
=TEX
\section{Z PARSER INTERNALS INTERFACE}\label{ZPARSERINTERNALS}

=SML
structure ⦏ZParserInternals⦎ = struct
=TEX
=SML
fun ⦏z_parser_pass_1⦎ (tokens : Z_TOKEN list) : PARAGRAPH = (
	(case (phase_1 o preprocess_for_fixity_para) tokens of
		PPParagraph para => para
	|	_ => raise PARSER_ERROR "weird result from phase 1")
	handle	SYNTAX_ERROR => (fail "Z Parser" 61000 [])
	|	PARSER_ERROR msg => (
			diag_string(get_error_message 61201 [msg]);
			fail "Z Parser" 61000 []
	)
);
=TEX
=SML
fun ⦏z_parser_pass_2⦎  {is_quot : bool} (p : PARAGRAPH) : Z_PARA  = (
	x_para is_quot p
);

end (* structure ZParserInternals *);
=TEX
\section{MAIN INTERFACE}\label{MAININTERFACE}
=SML
open ZParserInternals;
fun ⦏z_parser⦎  (flag : {is_quot : bool}) : Z_TOKEN list -> Z_PARA = (
	z_parser_pass_2 flag o z_parser_pass_1
);
=TEX
\section{EPILOGUE}
=SML
end (* of structure Parser *);
=TEX
\small
\twocolumn[\section{INDEX}]
\printindex
\end{document}
=IGN
val new_error_message =  pp'change_error_message;

val phase_1_in : Z_TOKEN list ref = ref [];

val phase_2_in : PP ref = ref (PPIdDec ("Dummy IdDec", ""));

=IGN
var_z_parser := real_z_parser;

=IGN
val var_z_parser : (bool -> Z_TOKEN list -> Z_PARA) ref = ref real_z_parser;

fun z_parser is_quot tokens = !var_z_parser is_quot tokens;


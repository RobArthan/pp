=IGN
********************************************************************************
imp503.doc: this file is part of the PPDaz system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% imp503.doc   @(#) 97/08/01 1.76 imp503.doc
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

\def\Title{Implementation of the Compliance Notation Parser}

\def\AbstractText{This document contains the implementation for the Compliance Notation Parser to meet the DRA's requirements for a Compliance Tool.}

\def\Reference{ISS/HAT/DAZ/IMP503}

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
\def\Bool{``$\it{:}bool\,$''}
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{DAZ PROJECT}	%% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Implementation of the Compliance Notation Parser}  %% Mandatory field
%% LaTeX2e port: \TPPref{ISS/HAT/DAZ/IMP503}	%% Mandatory field
%% LaTeX2e port: \def\SCCSversion{1.76%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}	%% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{97/08/01%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}		%% Mandatory field
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{D.J.~King & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{D.J.~King & DAZ Team Leader}
%% LaTeX2e port: \TPPabstract{
%% LaTeX2e port: This document contains the implementation for the Compliance Notation Parser to meet the DRA's requirements for a Compliance Tool.}
%% LaTeX2e port: %\TPPabstractB{}
%% LaTeX2e port: %\TPPabstractC{}
%% LaTeX2e port: %\TPPabstractD{}
%% LaTeX2e port: %\TPPabstractE{}
%% LaTeX2e port: %\TPPabstractF{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port:     Library}}
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
\bibliography{fmu,daz}

\subsection{Changes History}  % to get section number `0.3'
\begin{description}

\item[Issue 1.1 (1994/01/28)-1.55 (1994/12/08)] Initial Drafts.
\item[Issue 1.1 (1994/01/28)-1.55 (1994/12/08)] Initial Drafts.
\item[Issue 1.55 (1994/12/08)-1.59 (1995/03/31)] Bug fixes.
\item[Issue 1.60 (1995/04/04)-1.64 (1995/10/10)] Enhancements 1, 6 and 20.
\item[Issue 1.60 (1995/04/04)-1.65 (1995/10/11)] Enhancement 10.
\item[Issue 1.60 (1995/04/04)-1.65 (1995/10/11)] Enhancement 10.
\item[Issue 1.66 (1995/10/18)] Bug 19 (batch 2).
\item[Issue 1.67 (1995/10/25)] Operator associativity bug.
\item[Issue 1.68 (1995/11/29)] Enhancement 3.
\item[Issue 1.69 (1996/07/14)-1.71 (1996/07/16)] Syntax changes for k-slots as annotations.
\item[Issue 1.72 (1997/04/23)] Change a $stack\_error$ to a $parse\_error$ in $red\_subtype\_indication2\_a$.
\item[Issue 1.73 (1997/05/29)] IUCT WP 7 enhancements.
\item[Issue 1.74 (1997/06/17)] IUCT WP 3 changes.
\item[Issue 1.75 (1997/07/18)] IUCT WP 4 changes.
\item[Issue 1.75 (1997/07/18)] Made it apply Π to invariants and other cases.
\item[Issue 1.76 (1997/08/01)] Added dummy cases for functions using $Z\_TM$, $Z\_PARA$, $Z\_EXP$.
		  Changes to allow compilation with zed.db.
\item[Issue 1.77 (1999/02/10)] Changes to allow compilation with hol.db.
\item[Issue 1.78 (1999/02/10)] Changes to allow compilation with just poly.db.
\item[Issue 1.79 (1999/02/10)-1.83 (1999/02/25)] Changes for NJML port and cut-down tool.
\item[Issues 1.84 (1999/03/02),1.85 (2000/05/24)] Enhancement R5: Initial Variables in Conditionals.
The main change is that the {\it Stmt} and {\it Statement} data types are merged.
This removes the need for various special cases and type conversion functions.
\item[Issue 1.86 (2000/05/25)] Enhancement R4: Frame Abbreviations.
\item[Issue 1.87 (2000/06/14)] Enhancement R2: Multiple Logical Constants.
\item[Issue 1.88 (2000/10/17)] CTLE II R1/7: empty package specifications.
\item[Issue 1.89 (2000/10/17)-1.92 (2000/10/24)] CTLE II R1/10: multiple with clauses.
\item[Issue 1.93 (2000/10/25)] CTLE II R2/1: global variable unsoundness.
\item[Issue 1.94 (2000/10/26)] CTLE II R1/11: nested packages.
\item[Issues 1.95 (2000/10/29),1.96 (2000/10/30)] CTLE II R1/1: real types.
\item[Issue 1.97 (2001/12/11)] Fixed {\LaTeX} error.
\item[Issue 1.98 (2001/12/15)] R0037: support for named numbers.
\item[Issue 1.99 (2002/01/24)--1.102 (2002/01/28)] R0006: free use of subtype indications and ranges.
\item[Issue 1.103 (2002/03/13)] R0056: default parameter modes supported properly.
\item[Issue 1.104 (2002/03/19)] Fixing bug when terms have to be type-checked without a cache theory.
\item[Issue 1.105 (2002/05/02),1.106 (2002/05/03)] Spring 2002 enhancements: syntax changes for interim release.
\item[Issue1.107 (2002/05/08)] Some functions moved elsewhere for better modularity and ease of system build.
\item[Issue 1.108 (2002/05/11)] fixed bug in reduction function for exit when statements.
\item[Issue 1.109 (2002/05/11)] fixed bug in reduction function for use type clauses.
\item[Issue 1.110 (2002/07/24), 1.111 (2002/07/24)] R0079: assertions (added new reduction functions and accommodated changed data types).
\item[Issue 1.112 (2002/08/07)] R0051/R0052: default parameters and block statements.
\item[Issue 1.113 (2002/08/08)] Now support renaming of operator symbol with no package name prefix.
\item[Issue 1.114 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.115 (2002/10/17), 1.116 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.117 (2002/11/10)] Uniform treatment of block statements.
\item[Issue 1.118 (2002/12/10)] Package initialization now optional even when there are using declarations.
\item[Issue 1.119 (2002/12/16)] Improved coverage of checks against ranges as expressions.
\item[Issue 1.120 (2003/05/20)] Support for NOTHING statement form.
\item[Issue 1.121 (2003/06/18)] R0096: improved formatting of nothing statement form in web clauses
\item[Issue 1.122 (2003/07/14), 1.123 (2003/07/16)]  Improved error messages for syntax errors generally .
\item[Issue 1.124 (2004/02/07)] The name at the end of a package specification or a proper body is now optional.
\item[Issue 1.125 (2004/02/11)] Packages with empty private parts.
\item[Issue 1.126 (2004/08/29)] Implemented distinction between empty private part and omitted private part.
\item[Issue 1.127 (2004/08/29)] Error messages now sensitive to case of input.
\item[Issue 1.128 (2004/10/09)] Using clauses now allowed anywhere in package body.
\item[Issue 1.129 (2004/12/08)] Support for labelled statements and goto statements.
\item[Issue 1.130 (2005/04/22)] Allowed for change in HOL name of Π.
\item[Issue 1.131 (2005/09/09)] Enhancement 115: support for implicitly declared subprograms.
\item[Issue 1.132 (2005/12/07)] Removed historical binding of {\em z\_predexp\_of\_z\_tm}.
\item[Issue 1.133 (2006/03/18)] Allowed for rationalised data type for subunits.
\item[Issue 1.134 (2006/05/31)] Expanded names now allowed in use type clauses.
\item[Issue 1.135 (2006/07/20)] Multiple auxiliary variables are now allowed in one Z declaration.
\item[Issue 1.136 (2006/08/10)] Added support for deferred subprograms.
\item[Issue 1.137 (2006/09/17)] Now have syntax to allow anonymous Ada blocks and loops to be given names in the Compliance Notation.
\item[Issue 1.138 (2007/05/12)] Made checking of loop names uniform with checking of block names.
\item[Issues 1.139 (2007/05/13), 1.140 (2007/05/18)] Revised syntax for naming anonymous blocks and rationalised data types that represent loop statements.
\item[Issue 1.141 (2007/05/21)] Tidied error handling for logical constants and similar.
\item[Issue 1.142 (2007/05/28)--1.144 (2008/03/24)] Child packages.
\item[Issue 1.145 (2008/05/05)] Modular types.
\item[Issue 1.146 (2010/02/11)] Removed obsolete CUTDOWNVERSION option.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported daz source documents onto the Lemma 1 document template
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
None.

\pagebreak
\section{GENERAL}
\subsection{Scope}
This document contains the implementation for the Compliance Notation parser for
HOL/Z. It covers the parsing of Compliance Notation Web Clauses. For Web clauses constituting Z paragraphs, the {\Product} Z Parser is used.

The detailed design for this implementation and the BNF form of the implemented grammar is in \cite{ISS/HAT/DAZ/DTD503}.

\subsection{Introduction}

\subsection{Purpose and Background}

This document introduces the structure $CNParser$. This provides an implementation of a parser which corresponds to the language definition in \cite{ISS/HAT/DAZ/DTD502} which itself seeks to comply with DRA's specification of the concrete syntax of Compliance Notation.

\subsection{Known Deficencies}

This implementation aims to fully support the language definition of \cite{ISS/HAT/DAZ/DTD502}.

\subsection{Possible Enhancements}

None known.

\section{MISCELLANEOUS FUNCTIONS}\label{MISCELLANEOUSFUNCTIONS}

First we introduce the structure wrapping. The structure is developed
in stages and the official signature constraint is only applied at the
last stage.
=SML
structure ⦏CNParser⦎ (* stage 1 *) = struct
=TEX
=TEX
We need to include the SLRP driver code at this point:
=INCLUDE
imp018.sml
=TEX

=SML
    open SlrpDriver CNTypes ZLex CNBasicDeclsAndExprs;
    open ZParser ZUserInterfaceSupport;
=TEX

\subsection{Miscellanea}
$stack\_error$ is for use during context-free parsing when the parsing stack
is corrupt.
=SML
fun ⦏stack_error⦎ (insert : string) : 'a = (
    diag_string(get_error_message 503202 []);
    BasicError.error "CN-Parser"  503203 [fn() => insert]
    );
=TEX
=TEX

To give error reports which are closely related to the actual input,
the following two variables are set up by the functions
$HOL\_parser$ and $HOL\_reader$. At any time during parsing $input\_toks$
can be expected to contain the totality of the token stream being parsed
and $toks\_read$ contains the offset in it of the token most recently
read (or is
=INLINEFT
~1
=TEX
\ if nothing has been read yet).
=SML
val input_toks : CN_LEX_ITEM list ref = ref [];
val cur_tok : int ref = ref ~1;
=TEX
=SML
val ⦏label_lex_classes⦎  = [
	LCCompLabel,
	LCPPartLabel,
	LCVPartLabel,
	LCDecLabel,
	LCStmtLabel,
	LCSpecLabel,
	LCAnnotationLabel,
	LCUndeclaredLabel];
=TEX
=SML
fun ⦏format_lex_item⦎  ((lc, tok) : CN_LEX_ITEM) : string =(
	let	fun bracket_label s = (
			if	lc mem label_lex_classes
			then	"(" ^ s ^ ")"
			else	s
		);
	in	bracket_label (case tok of
			CNZ _ => " <Z-Quotation> "
		|  CNText s => CaseIndependence.get_external_name s
		|  CNString s => s
		|  CNKSlot s => "K-Slot"
		|  CNEos => "<End-of-Input>")
	end
);
=TEX

=SML
fun ⦏format_input_items⦎  ((ip::rest) : Lex.INPUT list) : string = (
    let val s = (case ip
        of Lex.Char c => "`"^c^"`"
        |  Lex.Error s => "ERROR__"^(string_of_int s)
        |  Lex.Separator s => s
        |  Lex.String s => "\""^s^"\""
        |  Lex.Term t => string_of_term t
        |  Lex.Text s => s
        |  Lex.Type t => string_of_type t
        );
    in
        s^(format_input_items rest)
    end)
|   format_input_items _ = "";
=TEX

=SML
fun ⦏parse_error_hdr⦎ () : unit = (
	let	val ok_toks =
			format_list format_lex_item ((!input_toks) to (!cur_tok-1)) " ";
		val bad_tok =
			if !cur_tok >= 0 andalso !cur_tok < length (!input_toks)
			then " <?> " ^ format_lex_item (nth (!cur_tok) (!input_toks))
			else "";
	in	diag_string (get_error_message 503005 [ok_toks ^ bad_tok])	
	end
);
=TEX

The following function produces the error reports for the unexpected
token type of error:
=SML
fun ⦏parse_error⦎ (msg : int) (insert : string) : 'a = (
    parse_error_hdr();
    diag_string (get_error_message msg [insert]);
    raise SYNTAX_ERROR
    );
=TEX

\subsection{Support for Processing Z Fragments}

=SML
fun ⦏z_tm_of_z_para⦎ (msg : string) (zp : Z_PARA) : Z_TM =
(   case zp
    of ZParaTerm (_, z_tm, _) => z_tm
    |  _ => parse_error 503001 msg
);
=TEX

=SML
fun ⦏z_tm_of_z_tokens⦎ (msg : string) (tokens : Z_TOKEN list) : Z_TM =
(
    (z_tm_of_z_para msg o (z_parser {is_quot = true})) tokens
);
=TEX

=SML
fun ⦏process_con_z_decl⦎ (ztokens : ZLex.Z_TOKEN list) : (Z_ID * Z_TM) list =
(
let	val schtoks =
		ZTLsqbrack::((rev o tl o rev) ztokens)@[ZTRsqbrack, ZTEos];
	fun do1 (ZDDec (vs, tm, _)) = (
		map (fn v => (string_of_ident v, tm)) vs
	) | do1 _ = (
		 parse_error 503001
		"a schema-as-declaration is not allowed in a logical constant statement"
	);
	val msg = "badly formed declaration in logical constant statement";
in
	case z_tm_of_z_tokens msg schtoks of
		ZTmHorizSchema(decs,_, _) => flat (map do1 decs)
        |  _ => parse_error 503001 msg
end);
=TEX


=SML
fun ⦏process_aux_z_decl⦎ (ztokens : ZLex.Z_TOKEN list) : (Z_ID list * Z_TM) =
(
let	val schtoks =
        ZTLsqbrack::((rev o tl o rev) ztokens)@[ZTRsqbrack, ZTEos];
	val msg = "badly formed auxiliary variable";
in
	case z_tm_of_z_tokens msg schtoks of
		ZTmHorizSchema([ZDDec (tmpls,ty, _)],_, _) => (
		map string_of_ident tmpls, ty
	) |  _ => parse_error 503001 msg
end);
=TEX
=SML
fun ⦏process_frame⦎ ([] : ZLex.Z_TOKEN list) : Z_ID list = []
|   process_frame [ZTEos] = []
|   process_frame ztokens =
(
let	val tuptoks = ZTLbrack::((rev o tl o rev) ztokens)@[ZTRbrack, ZTEos];
	val msg = "badly formed frame";
	fun get_name (ZTmLVar (id, _, _)) = string_of_ident id
	|   get_name _ = parse_error 503001 msg;
	val z_tm = z_tm_of_z_tokens msg tuptoks;
    in
        case z_tm
            of ZTmBracketed z_tm' => [get_name z_tm']
            |  ZTmTuple tml => map get_name tml
            |  _ => parse_error 503001 msg
    end);

=TEX
=SML
fun process_predicate (ztokens : ZLex.Z_TOKEN list) : Z_TM =
(
let	val pi_tm = (
		case ZParserInternals.z_parser_pass_1 ztokens of
		ParGeneralTerm(tm, Nil) =>
			ParGeneralTerm (PredFancyFix(TmplPre
              	      (("Π", Nil), StubUSQ), "", [[tm]]),Nil)
		|  _ => parse_error 503001 "unexpected Z construct");
	fun aux parsed = (
		(z_tm_of_z_para "badly formed Z predicate" o (ZParserInternals.z_parser_pass_2
			{is_quot = true})) parsed
	);
in	
  aux pi_tm
end);
=SML

fun ⦏process_pre_and_post_conditions⦎
    (ztokens : ZLex.Z_TOKEN list) : Z_TM OPT * Z_TM =
(   let val genitoks =
            ZTLsqbrack::((rev o tl o rev) ztokens)@[ZTRsqbrack, ZTEos];
        val zpara = ZParserInternals.z_parser_pass_1 genitoks;
        fun apply_pi p = (
            case p
            of ParGeneralTerm (PredGenInst [pp], Nil) => (
                (Nil, ParGeneralTerm (PredFancyFix(TmplPre
                    (("Π", Nil), StubUSQ), "", [[pp]]),Nil)))
            |  ParGeneralTerm (PredGenInst [p1,p2], Nil) => (
                (Value (ParGeneralTerm (PredFancyFix(TmplPre
                    (("Π", Nil), StubUSQ), "", [[p1]]),Nil)),
                    ParGeneralTerm (PredFancyFix(TmplPre
                    (("Π", Nil), StubUSQ), "", [[p2]]),Nil)))
            |  _ => parse_error 503001
                    "unexpected input after the post-condition"
        );
        val (pretm_opt, posttm) = apply_pi zpara;
        fun aux parsed = (
            (z_tm_of_z_para "badly formed Z predicate" o (ZParserInternals.z_parser_pass_2
            {is_quot = true})) parsed
        );
    in

        case pretm_opt
        of Value pre => (Value (aux pre), aux posttm)
        |Nil => (Nil, aux posttm)

    end);
=TEX


=SML
end (* of structure CNParser stage 1*);
=TEX

\section{REDUCTION FUNCTIONS}\label{REDUCTIONFUNCTIONS}
=SML
structure ⦏CNParser⦎ (* stage 2 *) = struct
=TEX

=SML
open CNParser;
open CaseIndependence;
=TEX

We give the reduction functions in the order of their appearance
in the grammar of \cite{ISS/HAT/DAZ/DTD503}. When several reduction
functions would be the same, we use $val$ bindings for the various
instances.

=SML
type ⦏AGG⦎ = {tm : TMARK OPT,
                named_assocs : (AGG_CHOICE,EXP) NAMED_ASSOC list,
                others : EXP OPT};

datatype ⦏PPARSED⦎ =
		⦏PPAgg⦎ of AGG
	|	⦏PPAggregateChoices⦎ of (AGG_CHOICE list * bool)
	|	⦏PPAnnotation⦎ of ANNOTATION
	|	⦏PPBasicDecls⦎ of SI_BASIC_DECL list
	|	⦏PPBinaryOp⦎ of BIN_OP
	|	⦏PPBinOpTail⦎ of (BIN_OP * EXP) list
	|	⦏PPCaseAlternatives⦎ of STATEMENT CASE_ALTERNATIVE list
	|	⦏PPCaseChoices⦎ of CASE_CHOICE list
	|	⦏PPCompilationUnit⦎ of COMPILATION_UNIT
	|	⦏PPComponentClauses⦎ of COMPONENT_CLAUSE list
	|	⦏PPConstraint⦎ of SI_CONSTRAINT
	|	⦏PPContextItem⦎ of CONTEXT_ITEM
	|	⦏PPContextClause⦎ of
			CONTEXT_ITEM list *
			EXPANDED_NAME list *
			ANNOTATION
	|	⦏PPContextCompilationUnit⦎ of CONTEXT_COMPILATION_UNIT
	|	⦏PPDeclarations⦎ of DECLARATION list
	|	⦏PPElsIf⦎ of (EXP * STATEMENT) list
	|	⦏PPExp⦎ of EXP
	|	⦏PPExps⦎ of EXP list
	|	⦏PPFor⦎ of (ID * ID OPT * LOOP_DIRECTION * EXP RANGE OPT)
	|	⦏PPFormals⦎ of PARAMETER_SPECIFICATION list
	|	⦏PPFunctionSpecification⦎ of FUNCTION_SPECIFICATION
	|	⦏PPId⦎ of ID
	|	⦏PPIdExp⦎ of (ID * EXP)
	|	⦏PPIds⦎ of ID list
	|	⦏PPExpandedNames⦎ of EXPANDED_NAME list
	|	⦏PPLoopOrBlockName⦎ of LOOP_OR_BLOCK_NAME
	|	⦏PPKSlot⦎ of K_SLOT
	|	⦏PPKSlotCUList⦎ of KSLOT_COMPILATION_UNIT list
	|	⦏PPMode⦎ of MODE
	|	⦏PPPackageSpecification⦎ of DECLARATION PACKAGE_DECLARATION
	|	⦏PPPragma⦎ of (AGG_CHOICE, EXP) PRAGMA
	|	⦏PPPragmaArgs⦎ of (AGG_CHOICE OPT * EXP) list
	|	⦏PPPragmaList⦎ of (AGG_CHOICE, EXP) PRAGMA list
	|	⦏PPPrimedIdentifier⦎ of (ID * ID)
	|	⦏PPProcedureSpecification⦎ of PROCEDURE_SPECIFICATION
	|	⦏PPProcedureSpecificationStatement⦎ of ID list * STATEMENT
	|	⦏PPProperBody⦎ of PROPER_BODY
	|	⦏PPReltail⦎ of (BIN_OP * EXP)
	|	⦏PPRepresentationClause⦎ of REPRESENTATION_CLAUSE
	|	⦏PPStatement⦎ of STATEMENT
	|	⦏PPSubInds⦎ of (EXP * SI_CONSTRAINT) list
	|	⦏PPSubprogram⦎ of (DECLARATION list * STATEMENT * ID list)
	|	⦏PPSubprogramSpec⦎ of SUBPROGRAM_SPECIFICATION
	|	⦏PPSubtypeIndication⦎ of (EXP * SI_CONSTRAINT)
	|	⦏PPTypeDef⦎ of SI_TYPE_DEF
	|	⦏PPUnaryOp⦎ of UNARY_OP
	|	⦏PPUseClause⦎ of USE_CLAUSE
	|	⦏PPVarDecls⦎ of SI_VAR_DECL list
	|	⦏PPWebClause⦎ of WEB_CLAUSE;
=TEX
In the following, the list will have at most 2 elements (it is always the concatenation of the simple names
found at the beginning and end of a subprogram body or a block.
=SML
fun ⦏different_simple_names⦎ ([id1, id2] : ID list) : bool = (
    (id1 <> id2)
) | different_simple_names _ = false;
=TEX
In the following, the arguments are the expanded names
found at the beginning and end of a package declaration or a package body.
=SML
fun ⦏different_expanded_names⦎ (id1 : ID list, (id2 as _::_) : ID list) : bool = (
    (id1 <> id2)
) | different_expanded_names _ = false;
=TEX
In the following, the list will have at most 1 element (it always represents an optional construct)
=SML
fun ⦏opt_of_list⦎ ([x] : 'a list) : 'a OPT = Value x
| opt_of_list _ = Nil;
=TEX
In the following, the grammar will have specified an optional non-empty list:
=SML
fun ⦏opt_non_empty_list_of_list⦎ ([] : 'a list) : 'a list OPT = Nil
| opt_non_empty_list_of_list x = Value x;
=TEX
=SML
fun ⦏mk_expanded_name⦎ (e : EXP) : ID list = (
	let	fun aux acc e = (
			case e of
				EId id => id :: acc
			|	ESelectedComp {prefix, selector} => aux (selector::acc) prefix
			|	_ => parse_error 503001 "a simple or expanded name is expected here"
		);
	in	aux [] e
	end
);
=TEX
=SML
fun ⦏mk_type_mark⦎ (e : EXP) : TMARK = (
	format_list Combinators.I (mk_expanded_name e) "o"
);
=TEX


=SML
fun ⦏si_to_discrete_range⦎ (e : EXP, con : SI_CONSTRAINT)
	: EXP = (
	case con of
		SINoCon => (
		case e of
			EDiscreteRange _ => e
		|	_ =>
			if	is_range_attribute e
			then	EDiscreteRange(DRRange(RRangeAttr e))
 		 	else	e
	) |	SIRangeCon range =>
		EDiscreteRange(DRConstrained{tmark = mk_type_mark e, range = range})
	|	_ => parse_error 503001
			"a DISCRETE SUBTYPE INDICATION or a RANGE is expected here"
);
=TEX
=SML
fun ⦏exp_to_dr⦎ (e : EXP) : SI_DISCRETE_RANGE = (
	exp_to_discrete_range e handle Fail _ =>
	parse_error 503001 "Invalid DISCRETE RANGE"
);

val ⦏si_to_constraint⦎ : EXP * SI_CONSTRAINT -> SI_DISCRETE_RANGE =
	exp_to_dr o si_to_discrete_range;
=TEX
=SML
fun ⦏si_to_tmark⦎ (e : EXP, con : SI_CONSTRAINT) : TMARK = (
	case con of
		SINoCon => mk_type_mark e
	|	_ => parse_error 503001
			"a DISCRETE SUBTYPE INDICATION or a RANGE is not allowed here"
);
=SML
fun ⦏exp_to_range⦎ (EDiscreteRange (DRRange range) : EXP) : EXP RANGE = (
    range
) | exp_to_range e = (
    if is_range_attribute e
    then
        RRangeAttr e
    else
        parse_error 503001 "a RANGE is expected here"
);
=TEX
=SML
fun ⦏is_range⦎ (EDiscreteRange (DRRange range) : EXP) : bool = (
    true
) | is_range e = (
    is_range_attribute e
);
=SML
fun ⦏exp_to_loop_params⦎ (EDiscreteRange (DRConstrained{tmark, range}) : EXP)
	: ID OPT * EXP RANGE OPT= (
	(Value tmark, Value range)
) | exp_to_loop_params (EDiscreteRange (DRRange range)) = (
	(Nil, Value range)
) | exp_to_loop_params e = (
	if	is_range_attribute e
	then	(Nil, Value(RRangeAttr e))
  	else	(Value (mk_type_mark e), Nil)
);
=TEX
The following is the identity function combined with a check that an expression is not one of
the types that is allowed in our extended grammar but is not valid Ada.
=SML
fun ⦏mk_exp_of_exp⦎ (e : EXP) : EXP = (
    case e of
    	EDiscreteRange _ => (
        		parse_error
		503001 "a RANGE or CONSTRAINED SUBTYPE INDICATION is not permitted here"
    ) |	EArrayAggPos{tmark = tm,comps = es} => (
		EArrayAggPos{tmark = tm, comps = map mk_exp_of_exp es}
     ) |	EIndexedComp{
		index = EArrayAggPos{tmark = tm,comps = [EDiscreteRange _]},
		prefix = _} => (
        		parse_error
		503001 "ARRAY SLICES are not supported"
     ) |	EIndexedComp{
		index = EArrayAggPos{tmark = tm,comps = es},
		prefix = pfx} => (
		EIndexedComp{
		index = EArrayAggPos{tmark = tm,comps =map mk_exp_of_exp  es},
		prefix = mk_exp_of_exp pfx}
    ) | _ => e
);
=TEX
=SML
fun ⦏mk_exp_of_sub_ind⦎ ((e, con) : EXP * SI_CONSTRAINT) : EXP = (
    case con of
    	SINoCon => (e
    ) | _ => (	parse_error
		503001 "a CONSTRAINED SUBTYPE INDICATION is not permitted here"
    )
);
=TEX
=SML
fun ⦏mk_sub_ind⦎ ((e, con) : EXP * SI_CONSTRAINT) : SI_SUB_IND =(
	let	val (tmark, constr) = (
		case e of
			EIndexedComp{prefix=prefix,index=index} => (
				case con of
					SINoCon =>
					(mk_type_mark prefix, SIDiscriminantCon[index])
				| _ => (mk_type_mark e, con)
		) |  _ => (mk_type_mark e, con));
	in	{tmark = tmark, con = constr}
	end
);
=TEX
=SML
fun ⦏par_spec_to_disc_spec⦎
	({idlist, mode as MSparkIn false, name, default as Nil} : PARAMETER_SPECIFICATION)
	: DISCRIMINANT_SPECIFICATION = (
	{vars = idlist, tmark = name}
) | par_spec_to_disc_spec {mode as _,  default as Nil, ...} = (
	parse_error 503001
		"a parameter mode is not allowed in a discriminant specification"
) | par_spec_to_disc_spec {default as Value _, ...} = (
	parse_error 503001
		"default expressions for discriminants are not supported"
);
=TEX
\subsection{Support for Unlabelled KSlots and Specification Statements}

The following reference variable keeps a note of the last unlabelled kslot or specification statement.

=SML
val ⦏unlabelled_stack⦎ : string OPT ref = ref Nil;
val ⦏unlabelled_provisional⦎ : string OPT ref = ref Nil;
val ⦏unlabelled_counter⦎ : int ref = ref 1;
val ⦏last_label⦎ : LABEL ref = ref "";
=TEX

=SML
type ⦏CN_PARSER_STATE⦎ = {
    unlabelled_stack : string OPT,
    unlabelled_provisional : string OPT,
    unlabelled_counter : int,
    last_label : LABEL
    };
=TEX

=SML
fun ⦏implicit_label_of_int⦎ (i : int) = (
    (!last_label) ^ "_" ^ (string_of_int i)
    );
=TEX

=SML
fun ⦏get_cn_parser_state⦎ (() : unit) : CN_PARSER_STATE = (
    {
        unlabelled_stack = !unlabelled_stack,
        unlabelled_provisional = !unlabelled_provisional,
        unlabelled_counter = !unlabelled_counter,
        last_label = !last_label
    }
    );
=TEX

=SML
fun ⦏set_cn_parser_state⦎ (cnps : CN_PARSER_STATE) : unit = (
    unlabelled_stack := #unlabelled_stack cnps;
    unlabelled_provisional := #unlabelled_provisional cnps;
    unlabelled_counter := #unlabelled_counter cnps;
    last_label := #last_label cnps
    );
=TEX
=SML
fun ⦏reset_cn_parser_state⦎ () : unit = (
    unlabelled_stack := Nil;
    unlabelled_counter := 1;
    unlabelled_provisional := Nil;
    last_label := ""
    );
=TEX

When we encounter a k-slot or a specification statement with no label on the rhs, we give it a provisional label. The check that there is no outstanding unlabelled k-slot or specification statement happens later, at which point if all is OK, the provisional label becomes the actual label for expansion.
For assertions, we just generatea a new label without any checks.
=SML
fun ⦏push_label⦎ (is_assertion : bool) : string = (
	let	val label = implicit_label_of_int (!unlabelled_counter);
		val _ = unlabelled_counter := (!unlabelled_counter) + 1;
	in	if	is_assertion
		then	label
		else if	!unlabelled_provisional = Nil
		then	(unlabelled_provisional := Value label;  label)
		else    (
			unlabelled_provisional := Nil;
			parse_error 503001
			"There is already an unlabelled, \
			\unexpanded K-Slot or Specification Statement in the script"
		)
	end
);
=TEX

The following function should be called when a refinement or replaced-by has been parsed. It updates the label stack with a newly generated label. This caters for a specification statement which is unlabelled, and is itself intended to be expanded with an unlabelled expansion.

=SML
fun ⦏update_unlabelled_stack⦎ (() : unit) : unit = (
    if !unlabelled_stack <> Nil
    then    if !unlabelled_provisional <> Nil
        then    (
            unlabelled_provisional := Nil;
            parse_error 503001
            "There is already an unlabelled, unexpanded K-Slot or Specification Statement in the script"
        )
        else    ()
    else    (
        unlabelled_stack := !unlabelled_provisional;
        unlabelled_provisional := Nil
    )
    );
=TEX

=SML
fun ⦏pop_label⦎ (() : unit) : string = (
case !unlabelled_stack
    of Nil => parse_error 503001
        "there is no unlabelled k-slot or specification statement to expand"
    |Value label => (
        unlabelled_stack := Nil;
        label
    )
    );
=TEX

\subsection{Reduction Functions}
=SML
fun ⦏red_accept⦎ (Parsed pp) = (pp)
|   red_accept (Token ((l,CNText t),_)) = (
    stack_error ("red_accept [Token("
=POLYML
        ^(PolyML.makestring l)^", Text "^(PolyML.makestring t)^")]"))
=NJML
        ^"... )]"))
=SML
|   red_accept (Token ((l,t),_)) = (
    stack_error ("red_accept ["
=POLYML
        ^(PolyML.makestring l)^", "^(PolyML.makestring t)^"]"));
=NJML
        ^"... )]"))
=TEX

=SML
fun ⦏red_web_clause1⦎ (Parsed (PPKSlotCUList cul)) = (
    update_unlabelled_stack();
    PPWebClause (WCCompilation cul))
|   red_web_clause1 _ =
        stack_error "red_web_clause1";

fun ⦏red_web_clause2⦎
        (Token ((_, CNText lab), _)) _ (Parsed (PPKSlotCUList cul)) = (
    update_unlabelled_stack();
    PPWebClause (WCReplacedByCompilation {label=lab,comp=cul}))
|   red_web_clause2 _ _ _ =
        stack_error "red_web_clause2";

fun ⦏red_web_clause3⦎
        (Token ((_,CNText lab), _)) _ (Parsed (PPDeclarations d)) = (
    update_unlabelled_stack();
    PPWebClause (WCReplacedByPrivatePart {label=lab, private=d}))
|   red_web_clause3 _ _ _ =
        stack_error "red_web_clause3";

fun ⦏red_web_clause4⦎
        (Token ((_,CNText lab), _)) _ (Parsed (PPDeclarations d)) = (
    update_unlabelled_stack();
    PPWebClause (WCReplacedByVisiblePart {label=lab, visible=d}))
|   red_web_clause4 _ _ _ =
        stack_error "red_web_clause4";

fun ⦏red_web_clause5⦎
        (Token ((_,CNText lab), _)) _ (Parsed (PPDeclarations d)) = (
    update_unlabelled_stack();
    PPWebClause (WCReplacedByDecl {label=lab, decls=d}))
|   red_web_clause5 _ _ _ =
        stack_error "red_web_clause5";

fun ⦏red_web_clause6⦎
        (Token ((_,CNText lab), _)) _ (Parsed (PPStatement s)) = (
    update_unlabelled_stack();
    PPWebClause (WCReplacedBy {label=lab, statement= s})
) |   red_web_clause6 _ _ _ =
        stack_error "red_web_clause6";

fun ⦏red_web_clause7⦎
        (Token ((_,CNText lab), _)) _ (Parsed (PPStatement s)) = (
    update_unlabelled_stack();
    PPWebClause (WCRefinedBy {label=lab, statement= s})
) |   red_web_clause7 _ _ _ =
        stack_error "red_web_clause7";

fun ⦏red_web_clause8⦎ _ (Parsed (PPStatement s)) = (
let val lab = pop_label();
    val side = update_unlabelled_stack();
in
    PPWebClause (WCRefinedBy {label=lab, statement = s})
end
) |   red_web_clause8 _ _ =
        stack_error "red_web_clause8";

fun ⦏red_web_clause9⦎
        (Token ((_,CNText lab), _)) _ (Parsed (PPStatement s)) = (
    update_unlabelled_stack();
    PPWebClause (WCReplacedBy {label=lab, statement= s})
) |   red_web_clause9 _ _ _ =
        stack_error "red_web_clause9";

fun ⦏red_web_clause10⦎  _ (Parsed (PPStatement s)) = (
let val lab = pop_label();
    val side = update_unlabelled_stack();
in
    PPWebClause (WCReplacedBy {label=lab, statement= s})
end
) |   red_web_clause10 _ _ =
        stack_error "red_web_clause10";

fun ⦏red_web_clause11⦎ (Parsed(PPId lab)) (Token ((LCArbitraryAda,CNText aa), _)) = (
    update_unlabelled_stack();
    PPWebClause (WCReplacedByArbitraryAda {label=lab, replacement=aa})
)|   red_web_clause11 _ _ =
        stack_error "red_web_clause11";

fun ⦏red_web_clause12⦎ (Token ((LCArbitraryAda,CNText aa), _)) = (
let val lab = pop_label();
    val side = update_unlabelled_stack();
in
    PPWebClause (WCReplacedByArbitraryAda {label=lab, replacement=aa})
end
)|   red_web_clause12 _ =
        stack_error "red_web_clause12";

fun ⦏red_web_clause13⦎
        (Token ((_,CNText lab), _))  _ (Parsed (PPAnnotation ann)) = (
    update_unlabelled_stack();
    PPWebClause (WCReplacedByAnnotation {label=lab, replacement=ann})
)|   red_web_clause13 _ _ _ =
        stack_error "red_web_clause13";

fun ⦏red_web_clause14⦎
        (Token ((_, CNText lab), _)) _ (Parsed (PPProperBody pb)) = (
    update_unlabelled_stack();
    PPWebClause (WCReplacedByCompilation {label=lab,
	comp=[KCUUnit{comp_unit = CUProperBody pb, context = [], references = [], annotation = []}]}))
|   red_web_clause14 _ _ _ =
        stack_error "red_web_clause14";

=TEX
=SML
fun ⦏red_any_label⦎ (Token ((_,CNText lab), _)) =
    PPId lab
|   red_any_label _ = stack_error "red_any_label";
=TEX
=SML
val ⦏red_basic_declaration1⦎ = red_accept;
val ⦏red_basic_declaration2⦎ = red_accept;
val ⦏red_basic_declaration3⦎ = red_accept;
val ⦏red_basic_declaration4⦎ = red_accept;

fun ⦏red_basic_declaration5⦎ (Parsed (PPPragma e)) =
	PPBasicDecls[SIPragma e]
|   red_basic_declaration5 _ = stack_error "red_basic_declaration5";

fun ⦏red_basic_declaration6⦎ (Token ((LCAnnotation,CNText ann), _)) =
	PPBasicDecls[SIAnnotation [ANString ann]]
|   red_basic_declaration6 _ = stack_error "red_basic_declaration6";

val ⦏red_object_declaration1⦎ = red_accept;
val ⦏red_object_declaration2⦎ = red_accept;
=TEX

=SML
fun ⦏red_constant_declaration1⦎
        (Parsed(PPIds ids)) _ _ (Parsed(PPSubtypeIndication si)) _ (Parsed(PPExp e)) _ = (
    PPBasicDecls[SIConstDecl{consts=ids, t=Value (mk_sub_ind si), expr=mk_exp_of_exp e}])
|   red_constant_declaration1 _ _ _ _ _ _ _ =
        stack_error "red_constant_declaration1";

fun ⦏red_constant_declaration2⦎
        (Parsed(PPIds ids)) _ _ _ (Parsed(PPExp e)) _ = (
    PPBasicDecls[SIConstDecl{consts=ids, t=Nil, expr=mk_exp_of_exp e}])
|   red_constant_declaration2 _ _ _ _ _ _ =
        stack_error "red_constant_declaration2";

fun ⦏red_variable_declaration⦎ (Parsed(PPIds ids)) _ (Parsed(PPSubtypeIndication si)) _ = (
    PPBasicDecls[SIVarDecl{vars=ids, t=mk_sub_ind si}])
|   red_variable_declaration _ _ _ _ =
        stack_error "red_variable_declaration";

fun ⦏red_variable_declaration2⦎ (Parsed(PPIds ids)) _ (Parsed(PPSubtypeIndication si)) _
	(Parsed(PPExp init)) _ = (
    PPBasicDecls[SIVarDeclInit({vars=ids, t=mk_sub_ind si}, mk_exp_of_exp init)])
|   red_variable_declaration2 _ _ _ _ _ _ =
        stack_error "red_variable_declaration2";
=TEX
=SML
fun ⦏red_identifier_list1⦎ (Token ((_,CNText id), _)) = (
    PPIds [id])
|   red_identifier_list1 _ =
        stack_error "red_identifier_list1";
=TEX
In the following we deliberately do not insist that the separator be a comma so that we can reuse this for reducing expanded names.
=SML

fun ⦏red_identifier_list2⦎ (Token ((_,CNText id), _)) _ (Parsed(PPIds ids)) = (
    PPIds (id::ids))
|   red_identifier_list2 _ _ _ =
        stack_error "red_identifier_list2";
=TEX

=SML
val ⦏red_type_declaration1⦎ = red_accept;
val ⦏red_type_declaration2⦎ = red_accept;
=TEX

=SML
fun ⦏red_full_type_declaration1⦎
        _ (Token ((_,CNText id), _)) _ (Parsed(PPTypeDef td)) _ = (
    PPBasicDecls[SITypeDecl{name=id, type_def=td}])
|   red_full_type_declaration1 _ _ _ _ _ =
        stack_error "red_full_type_declaration1";
=TEX

=SML
fun ⦏red_full_type_declaration2⦎
        _ (Token ((_,CNText id), _)) (Parsed (PPFormals fps)) _ (Parsed(PPTypeDef td)) _ = (
	case td of
		SIRecordTypeDef {decl, ...} => (
    			PPBasicDecls[SITypeDecl{
				name=id,
				type_def = SIRecordTypeDef {
					decl = decl,
					disc = map par_spec_to_disc_spec fps}}])
	|	_ => parse_error 503001
	"A discriminant part is only allowed in a private or record type declaration"
) | red_full_type_declaration2 _ _ _ _ _ _ =
        stack_error "red_full_type_declaration2";
=TEX

=SML
val ⦏red_type_definition1⦎ = red_accept;
val ⦏red_type_definition2⦎ = red_accept;
val ⦏red_type_definition3⦎ = red_accept;
val ⦏red_type_definition4⦎ = red_accept;
val ⦏red_type_definition5⦎ = red_accept;
val ⦏red_type_definition6⦎ = red_accept;
=TEX

=SML
fun ⦏red_subtype_declaration⦎ _ (Token ((_,CNText id), _)) _
        (Parsed(PPSubtypeIndication si)) _ = (
    PPBasicDecls[SISubtypeDecl{name=id, type_def=mk_sub_ind si}])
|   red_subtype_declaration _ _ _ _ _ =
        stack_error "red_subtype_declaration";

fun ⦏red_subtype_indication1⦎ (Parsed(PPExp e)) (Parsed(PPConstraint c)) = (
        PPSubtypeIndication(e, c))
|   red_subtype_indication1 _ _ =
        stack_error "red_subtype_indication1";

fun ⦏red_subtype_indication2⦎ (Parsed(PPExp n))  = (
    PPSubtypeIndication(n, SINoCon))
|   red_subtype_indication2 _ =
        stack_error "red_subtype_indication2";
=TEX

=SML
fun ⦏red_constraint1⦎ (Parsed(PPExp e)) = (
    PPConstraint (SIRangeCon (exp_to_range e)))
|   red_constraint1 _ =
        stack_error "red_constraint1";

val ⦏red_constraint2⦎ = red_accept;
val ⦏red_constraint3⦎ = red_accept;
=TEX
=SML
fun ⦏red_range_constraint⦎ _ (Parsed (PPExp e)) = (
    PPExp(EDiscreteRange (DRRange (exp_to_range e)))
) | red_range_constraint _ _ =
        stack_error "red_range_constraint";
=TEX

=SML
fun ⦏red_derived_type_definition⦎ _  (Parsed(PPSubtypeIndication si)) = (
    PPTypeDef(SIDerivedTypeDef (mk_sub_ind si))
) | red_derived_type_definition _ _  =
        stack_error "red_derived_type_definition";

fun ⦏red_enumeration_type_definition⦎ _ (Parsed(PPIds ids)) _ = (
    PPTypeDef(SIEnumTypeDef{vals = ids}))
|   red_enumeration_type_definition _ _ _ =
        stack_error "red_enumeration_type_definition";
=TEX

=SML
fun ⦏red_integer_type_definition1⦎ (Parsed (PPExp e)) = (
    PPTypeDef(SIIntTypeDef (exp_to_range e)))
|   red_integer_type_definition1 _ =
        stack_error "red_integer_type_definition";
=TEX

=SML
fun ⦏red_integer_type_definition2⦎ (Parsed (PPExp e)) = (
    PPTypeDef(SIModularTypeDef {modulus = e}))
|   red_integer_type_definition2 _ =
        stack_error "red_integer_type_definition";
=TEX

=SML
fun ⦏red_modulus⦎ _ x = red_accept x;
=TEX

=SML
fun ⦏red_real_type_definition1⦎ (Parsed(PPConstraint(SIFloatingCon c))) = (
    PPTypeDef(SIFloatingTypeDef c))
|   red_real_type_definition1 _ =
        stack_error "red_real_type_definition1";

fun ⦏red_real_type_definition2⦎ (Parsed(PPConstraint (SIFixedCon c))) = (
    PPTypeDef(SIFixedTypeDef c))
|   red_real_type_definition2 _ =
        stack_error "red_real_type_definition2";
=TEX

SPARK manual 3.5.7:
=SML
fun ⦏red_floating_point_constraint1⦎ (Parsed(PPExp e)) = (
    PPConstraint(SIFloatingCon{exp=mk_exp_of_exp e, range=Nil}))
|   red_floating_point_constraint1 _ =
        stack_error "red_floating_point_constraint1";

fun ⦏red_floating_point_constraint2⦎
        (Parsed(PPExp e)) (Parsed (PPExp re)) = (
    PPConstraint(SIFloatingCon{exp=mk_exp_of_exp e, range=Value (exp_to_range re)}))
|   red_floating_point_constraint2 _ _ =
        stack_error "red_floating_point_constraint2";

fun ⦏red_floating_accuracy_definition⦎ _ (Parsed p) = (p)
|   red_floating_accuracy_definition _ _ =
        stack_error "red_floating_accuracy_definition";
=TEX

=SML
fun ⦏red_fixed_point_constraint1⦎ (Parsed(PPExp e)) = (
    PPConstraint(SIFixedCon{exp=mk_exp_of_exp e, range=Nil}))
|   red_fixed_point_constraint1 _ =
        stack_error "red_fixed_point_constraint1";

fun ⦏red_fixed_point_constraint2⦎ (Parsed(PPExp e)) (Parsed(PPExp re)) = (
        PPConstraint(SIFixedCon{exp=mk_exp_of_exp e, range=Value (exp_to_range re)}))
|   red_fixed_point_constraint2 _ _ =
        stack_error "red_fixed_point_constraint2";

fun ⦏red_fixed_accuracy_definition⦎ _ (Parsed p) = (p)
|   red_fixed_accuracy_definition _ _ =
        stack_error "red_fixed_accuracy_definition";
=TEX

=SML
val ⦏red_array_type_definition1⦎ = red_accept;
val ⦏red_array_type_definition2⦎ = red_accept;
=TEX

=SML
fun ⦏red_unconstrained_array_definition⦎ _ _ (Parsed(PPSubInds nl)) _ _
	(Parsed(PPSubtypeIndication si)) = (
    PPTypeDef(SIUnconArrayDef{
		index=map si_to_constraint nl,
		comp=mk_sub_ind si}))
|   red_unconstrained_array_definition _ _ _ _ _ _ =
        stack_error "red_unconstrained_array_definition";

fun ⦏red_constrained_array_definition⦎ _ (Parsed(PPSubInds nl)) _
		(Parsed(PPSubtypeIndication si)) = (
    PPTypeDef(SIConArrayDef{
		index=map si_to_constraint nl,
		comp=mk_sub_ind si}))
|   red_constrained_array_definition _ _ _ _ =
        stack_error "red_constrained_array_definition";
=TEX

=SML
fun ⦏red_index_subtype_definition_list1⦎ (Parsed(PPExp n)) = (
    PPSubInds [(n, SINoCon)])
|   red_index_subtype_definition_list1 _ =
        stack_error "red_index_subtype_definition_list1";
=TEX

=SML
fun ⦏red_index_subtype_definition_list2⦎ (Parsed(PPExp n)) _ (Parsed(PPSubInds nl)) = (
    PPSubInds ((n, SINoCon)::nl))
|   red_index_subtype_definition_list2 _ _ _ =
        stack_error "red_index_subtype_definition_list2";

fun ⦏red_index_subtype_definition⦎ (Parsed p) _ _ = (
    p)
|   red_index_subtype_definition _ _ _ =
        stack_error "red_index_subtype_definition";
fun ⦏red_index_constraint⦎ _ (Parsed p) _ = (
    p    )
|   red_index_constraint _ _ _ =
        stack_error "red_index_constraint";

fun ⦏red_discrete_range_list1⦎ (Parsed(PPSubtypeIndication si)) = (
    PPSubInds [si])
|   red_discrete_range_list1 _ =
        stack_error "red_discrete_range_list1";

fun ⦏red_discrete_range_list2⦎ (Parsed(PPSubtypeIndication si)) _
	(Parsed(PPSubInds sil)) = (
    PPSubInds (si::sil))
|   red_discrete_range_list2 _ _ _ =
        stack_error "red_discrete_range_list2";
=TEX

=SML
fun ⦏red_discrete_range1⦎
	(Parsed (PPExp e))
	(Parsed (PPExp (EDiscreteRange (DRRange range)))) = (
    PPExp(EDiscreteRange(DRConstrained{
	tmark = mk_type_mark e,
	range = range}))
) |   red_discrete_range1 (Parsed _) (Parsed _) = (
	parse_error 503001 "a DISCRETE RANGE was expected here"
) |   red_discrete_range1 _ _ =
        stack_error "red_discrete_range1";
=TEX
=SML
val ⦏red_discrete_range2⦎ = red_accept;

fun ⦏red_record_type_definition⦎ _ (Parsed(PPVarDecls vs)) _ _ = (
    PPTypeDef(SIRecordTypeDef{decl=vs, disc = []}))
|   red_record_type_definition _ _ _ _ =
        stack_error "red_record_type_definition";
=TEX


=SML
val ⦏red_component_list1⦎ = red_accept;

fun ⦏red_component_list2⦎ (Parsed(PPVarDecls[v])) (Parsed(PPVarDecls vs)) = (
    PPVarDecls (v::vs))
|   red_component_list2 _ _ =
        stack_error "red_component_list2";

fun ⦏red_component_declaration⦎ (Parsed(PPIds ids)) _ (Parsed(PPSubtypeIndication si)) _ = (
    PPVarDecls [{vars=ids, t=mk_sub_ind si}])
|   red_component_declaration _ _ _ _ =
        stack_error "red_component_declaration";
=TEX

SPARK manual 3.9:
=TEX

=SML
val ⦏red_declarative_part1⦎ = PPDeclarations [];

fun ⦏red_declarative_part2⦎ (Parsed (PPDeclarations d1)) (Parsed (PPDeclarations d2)) = (
    PPDeclarations (d1@d2))
|   red_declarative_part2 _ _ =
        stack_error "red_declarative_part2";
=TEX

=SML
fun ⦏red_dec1⦎ (Parsed(PPKSlot k)) = (
    PPDeclarations [DDeclarationKSlot (k, DKDeclaration)])
|   red_dec1 _ =
        stack_error "red_dec1";

val ⦏red_dec2⦎ = red_accept;
val ⦏red_dec3⦎ = red_accept;
val ⦏red_dec4⦎ = red_accept;
val ⦏red_dec5⦎ = red_accept;
val ⦏red_dec6⦎ = red_accept;
=TEX

=SML
fun ⦏red_basic_declarative_item1⦎ (Parsed(PPBasicDecls bds)) = (
    PPDeclarations(map (fn x => DBasicDecl x) bds))
|   red_basic_declarative_item1 _ =
        stack_error "red_basic_declarative_item1";

fun ⦏red_basic_declarative_item2⦎ (Parsed(PPRepresentationClause rc)) = (
    PPDeclarations [DRepresentationClause rc])
|   red_basic_declarative_item2 _ =
        stack_error "red_basic_declarative_item2";

fun ⦏red_basic_declarative_item3⦎ (Parsed(PPUseClause uc)) = (
    PPDeclarations [DUseClause uc])
|   red_basic_declarative_item3 _ =
        stack_error "red_basic_declarative_item2";

fun ⦏red_body1⦎ (Parsed(PPProperBody p)) = (
    PPDeclarations[DProperBody p])
|   red_body1 _ =
        stack_error "red_body1";
val ⦏red_body2⦎ = red_accept;

val ⦏red_proper_body⦎ = red_accept;
=TEX

=SML
fun ⦏red_name1⦎ (Token ((_,CNText name), _)) = (
    PPExp(EId name))
|   red_name1 _ =
        stack_error "red_name1";

val ⦏red_name2⦎ = red_accept;
val ⦏red_name3⦎ = red_accept;
val ⦏red_name4⦎ = red_accept;
=TEX

SPARK manual 4.1.1:
=SML
fun ⦏red_indexed_component⦎ (Parsed(PPExp n)) (Parsed(PPExp index)) = (
    case (n, index)
    of (EAttribute {prefix=prefix,attribute_desig=ADAttrib ad}, _) => (
        case index of
            EArrayAggPos{comps = [e], ...} => (
                   PPExp(EAttribute
                      {prefix=prefix,attribute_desig=ADAttribArg(ad,e)})
        ) | _ => parse_error 503001
                 "this form of parameter list is not allowed with an attribute"
    ) |  (_, EArrayAggNamedOthers _) => (
        parse_error 503001 "OTHERS is not allowed here"
    ) |  (_, EArrayAggPosOthers _) => (
        parse_error 503001 "OTHERS is not allowed here"
    ) |  (_, EArrayAggOthers _) => (
        parse_error 503001 "OTHERS is not allowed here"
    ) |_ => (
        PPExp(EIndexedComp{prefix=mk_exp_of_exp n, index=index})
    ))
|   red_indexed_component _ _ =
        stack_error "red_indexed_component";
=TEX

SPARK manual 4.1.3:
=SML
fun ⦏red_selected_component⦎ (Parsed(PPExp n)) _ (Parsed(PPId id)) = (
    PPExp(ESelectedComp{prefix=mk_exp_of_exp n, selector=id}))
|   red_selected_component _ _ _ =
        stack_error "red_selected_component";

fun ⦏red_selector⦎ (Token ((_,CNText id), _)) = (
    PPId id)
|   red_selector _ =
        stack_error "red_selector";
=TEX

SPARK manual 4.1/4.1.1:
=SML
fun ⦏red_expression_list1⦎ (Parsed(PPExp e)) = (
    PPExps [e])
|   red_expression_list1 _ =
        stack_error "red_expression_list1";

fun ⦏red_expression_list2⦎ (Parsed(PPExps es)) _ (Parsed(PPExp e)) = (
    PPExps (es@[e]))
|   red_expression_list2 _ _ _ =
        stack_error "red_expression_list2";
=TEX

=SML
fun ⦏red_attribute1⦎ (Parsed(PPExp n)) (Token ((_,CNText primedid), _)) = (
    PPExp(EAttribute{prefix=mk_exp_of_exp n, attribute_desig=ADAttrib
    ((implode o tl o explode) primedid)}))
|   red_attribute1 _ _ =
        stack_error "red_attribute1";

fun ⦏red_attribute2⦎ (Token ((CharacterLiteral,CNString id), _))
    (Token ((_,CNText primedid), _)) = (
    PPExp(EAttribute{prefix=ECharacterLiteral id, attribute_desig=ADAttrib
    ((implode o tl o explode) primedid)}))
|   red_attribute2 _ _ =
        stack_error "red_attribute2";

fun ⦏red_aggregate⦎ _ (Parsed p) _ = (
    p)
|   red_aggregate _ _ _ =
        stack_error "red_aggregate";
=TEX

=SML
fun ⦏red_component_association1⦎ (Parsed(PPAgg{named_assocs=na,others=ot,...})) = (
    case (ot, na)
    of (Value oe, _::_) => (
        PPExp (EArrayAggNamedOthers{
            agg_named={tmark=Nil, named_assocs=na},others={others=oe}})
    )|  (Value oe, _) => (
        PPExp (EArrayAggOthers{tmark=Nil, others={others=oe}})
    )|(Nil, _) => (
        PPExp (EArrayAggNamed{tmark=Nil, named_assocs=na})
    ))
|   red_component_association1 _ =
        stack_error "red_component_association1";

val ⦏red_component_association2⦎ = red_accept;

=TEX

=SML
fun ⦏red_named_association1⦎ (Parsed(PPAggregateChoices v)) _ (Parsed(PPExp e)) = (
    case v
    of ([],true) => PPAgg{tm=Nil, named_assocs=[], others=Value (mk_exp_of_exp e)}
    |(c, false) => PPAgg{tm=Nil, named_assocs =[{choice=c, comp=e}],others=Nil}
    |_ => parse_error 503001 "OTHERS is not allowed here")
|   red_named_association1 _ _ _ =
        stack_error "red_named_association1";

fun ⦏red_named_association2⦎ (Parsed(PPAggregateChoices v)) _
    (Parsed(PPExp e)) _ (Parsed(PPAgg {named_assocs=na,others=ot,...})) = (
    case v
    of (c as _::_, false) =>
        PPAgg{tm=Nil,named_assocs={choice=c,comp=mk_exp_of_exp e}::na,others=ot}
    |_ => parse_error 503001 "OTHERS is not allowed here")
|   red_named_association2 _ _ _ _ _ =
        stack_error "red_named_association2";

fun ⦏red_aggregate_choice_list1⦎ (Token ((LCOthers,_), _)) = (
    PPAggregateChoices ([], true))
|   red_aggregate_choice_list1 _ =
        stack_error "red_aggregate_choice_list1";

val ⦏red_aggregate_choice_list2⦎ = red_accept;

fun ⦏red_aggregate_choice_list3⦎ (Parsed(PPAggregateChoices v)) _
    (Parsed(PPAggregateChoices (acl, true))) = (
    parse_error 503001 "OTHERS is not allowed here")
|   red_aggregate_choice_list3 (Parsed(PPAggregateChoices v)) _
    (Parsed(PPAggregateChoices (acl, false))) = (
    case v
    of ([ac], false) => PPAggregateChoices((ac::acl), false)
    |_ => parse_error 503001 "OTHERS is not allowed here")
|   red_aggregate_choice_list3 _ _ _ =
        stack_error "red_aggregate_choice_list3";
=TEX

=SML
fun ⦏red_aggregate_choice⦎ (Parsed(PPExp e)) = (
    case  e of
       EDiscreteRange (DRConstrained{tmark, range}) => (
        PPAggregateChoices([ACAggChoiceRange(DRConstrained
                {tmark=tmark, range=range})],false)
    ) | EDiscreteRange (DRRange range) => (
        PPAggregateChoices([ACAggChoiceRange
            (DRRange range)],false)
    ) | _ => (
        if is_range_attribute e
        then
            PPAggregateChoices([ACAggChoiceRange
                (DRRange(exp_to_range e))],false)
        else
            PPAggregateChoices([ACAggChoiceSingle (mk_exp_of_exp e)],false)
    )
) |   red_aggregate_choice _ =
        stack_error "red_aggregate_choice";

fun ⦏red_positional_association1⦎ (Parsed(PPExps es)) = (
    PPExp(EArrayAggPos{tmark=Nil,comps = map mk_exp_of_exp es}))
|   red_positional_association1 _ =
        stack_error "red_positional_association1";

fun ⦏red_positional_association2⦎ (Parsed(PPExps es)) _ _ _ (Parsed(PPExp e)) = (
    PPExp(EArrayAggPosOthers{agg_pos={tmark=Nil,comps=map mk_exp_of_exp es},
        others={others=mk_exp_of_exp e}}))
|   red_positional_association2 _ _ _ _ _ =
        stack_error "red_positional_association2";
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
=SML
val ⦏red_ranged_expression1⦎ = red_accept;

fun ⦏red_ranged_expression2⦎ (Parsed (PPExp e)) (Parsed (PPExp re)) = (
	PPExp(EDiscreteRange(DRConstrained{
		tmark=mk_type_mark e,
		range=exp_to_range re}))
) | red_ranged_expression2 _ _ =
	stack_error "red_ranged_expression2";

val ⦏red_expression1⦎ = red_accept;

fun ⦏red_expr⦎ (Parsed (PPExp exp1)) (Parsed (PPReltail(binop, exp2))) = (
	PPExp (EBinExp {bop = binop, left = mk_exp_of_exp exp1, right = mk_exp_of_exp exp2})
) |   red_expr _ _ = stack_error "red_expr";

val ⦏red_expression2⦎ = red_expr;
val ⦏red_expression3⦎ = red_expr;
val ⦏red_expression4⦎ = red_expr;
val ⦏red_expression5⦎ = red_expr;
val ⦏red_expression6⦎ = red_expr;
=TEX

=SML
fun ⦏red_logrel1⦎ binop (Parsed(PPExp exp)) = (
    PPReltail(binop, mk_exp_of_exp exp))
|   red_logrel1 _ _ =
        stack_error "red_logrel1";

fun ⦏red_logrel2⦎ binop (Parsed(PPExp exp1)) (Parsed(PPReltail(_,exp2))) = (
    PPReltail(binop, EBinExp{bop=binop, left=mk_exp_of_exp exp1,
	right=mk_exp_of_exp exp2}))
|   red_logrel2 _ _ _ =
        stack_error "red_logrel2";

fun ⦏red_and_relation1⦎ _ x2 =(red_logrel1 BOSparkAnd x2);
fun ⦏red_and_relation2⦎ _ x2 x3 =(red_logrel2 BOSparkAnd x2 x3);
fun ⦏red_and_then_relation1⦎ _ _ x3 =(red_logrel1 BOSparkAndThen x3);
fun ⦏red_and_then_relation2⦎ _ _ x3 x4 =(red_logrel2 BOSparkAndThen x3 x4);
fun ⦏red_or_relation1⦎ _ x2 =(red_logrel1 BOSparkOr x2);
fun ⦏red_or_relation2⦎ _ x2 x3 =(red_logrel2 BOSparkOr x2 x3);
fun ⦏red_or_else_relation1⦎ _ _ x3 =(red_logrel1 BOSparkOrElse x3);
fun ⦏red_or_else_relation2⦎ _ _ x3 x4 =(red_logrel2 BOSparkOrElse x3 x4);
fun ⦏red_xor_relation1⦎ _ x2 =(red_logrel1 BOSparkXor x2);
fun ⦏red_xor_relation2⦎ _ x2 x3 =(red_logrel2 BOSparkXor x2 x3);
=TEX

=SML
fun ⦏red_relation1⦎ (Parsed(PPExp sr)) = (
    PPExp sr)
|   red_relation1 _ =
        stack_error "red_relation1";

fun ⦏red_relation2⦎ (Parsed(PPExp sr1)) (Parsed(PPBinaryOp b))
    (Parsed(PPExp sr2)) = (
    PPExp(EBinExp{left=mk_exp_of_exp sr1,bop=b,
                right=mk_exp_of_exp sr2}))
|   red_relation2 _ _ _ =
        stack_error "red_relation2";

fun ⦏red_relation3⦎ (Parsed(PPExp sr1)) _
    (Parsed(PPExp sr2)) = (
	if	is_range sr2
    	then	PPExp(EMemRange{left=mk_exp_of_exp sr1, mop=BOSparkMem,
                range=exp_to_range sr2})
	else	PPExp(EBinExp{left=mk_exp_of_exp sr1,
        bop=BOSparkMem, right=mk_exp_of_exp sr2}))
|   red_relation3 _ _ _ =
        stack_error "red_relation3";

fun ⦏red_relation4⦎ (Parsed(PPExp sr1)) _ _
    (Parsed(PPExp sr2)) = (
	if	is_range sr2
    	then	PPExp(EMemRange{left=mk_exp_of_exp sr1, mop=BOSparkNotMem,
                range=exp_to_range sr2})
	else	PPExp(EBinExp{left=mk_exp_of_exp sr1,
        bop=BOSparkNotMem, right=mk_exp_of_exp sr2}))
|   red_relation4 _ _ _ _ =
        stack_error "red_relation4";
=TEX

=SML
val ⦏red_sr_expression1⦎ = red_accept;

fun ⦏red_sr_expression2⦎ (Parsed(PPExp e1)) _ (Parsed(PPExp e2)) = (
    PPExp(EDiscreteRange (DRRange (RRange{lo=mk_exp_of_exp e1, hi=mk_exp_of_exp e2})))
) | red_sr_expression2 _ _ _ =
        stack_error "red_sr_expression2";
=TEX

=SML
fun do_binarytail left ((b,right)::(rest as (_::_))) = (
   do_binarytail (EBinExp{left=mk_exp_of_exp left, bop=b, right=mk_exp_of_exp right}) rest)
|   do_binarytail left [(b,right)] = (
    EBinExp{left=mk_exp_of_exp left, bop=b, right=mk_exp_of_exp right})
|   do_binarytail left [] = left;

fun ⦏red_simple_expression1⦎ (Parsed(PPExp e)) (Parsed(PPBinOpTail tl)) = (
    PPExp (do_binarytail e tl))
|   red_simple_expression1 _ _ =
        stack_error "red_simple_expression1";

fun ⦏red_simple_expression2⦎ (Parsed(PPUnaryOp uop)) (Parsed(PPExp e))
    (Parsed(PPBinOpTail tl)) = (
    PPExp (do_binarytail (EUnaryExp{uop=uop,right=mk_exp_of_exp e}) tl))
|   red_simple_expression2 _ _ _ =
        stack_error "red_simple_expression2";

val ⦏red_binoptail1⦎ = PPBinOpTail [];

fun ⦏red_binoptail2⦎ (Parsed(PPBinaryOp b)) (Parsed(PPExp e))
    (Parsed(PPBinOpTail tl)) = (
    PPBinOpTail((b,e)::tl))
|   red_binoptail2 _ _ _ =
        stack_error "red_binoptail2";

val ⦏red_term1⦎ = red_accept;

fun ⦏red_term2⦎ (Parsed(PPExp e1)) (Parsed(PPBinaryOp m)) (Parsed(PPExp e2)) = (
    PPExp(EBinExp{left=mk_exp_of_exp e1,bop=m,right=mk_exp_of_exp e2}))
|   red_term2 _ _ _ =
        stack_error "red_term2";
=TEX

=SML
val ⦏red_factor1⦎ = red_accept;
fun ⦏red_factor2⦎ (Parsed(PPExp e1)) _ (Parsed(PPExp e2)) = (
    PPExp(EBinExp{left=mk_exp_of_exp e1,bop=BOSparkExpon,right=mk_exp_of_exp e2}))
|   red_factor2 _ _ _ =
        stack_error "red_factor2";

fun ⦏red_factor3⦎ _ (Parsed(PPExp e)) = (
    PPExp(EUnaryExp{uop=UOSparkAbs, right=mk_exp_of_exp e}))
|   red_factor3 _ _ =
        stack_error "red_factor3";

fun ⦏red_factor4⦎ _ (Parsed(PPExp e)) = (
    PPExp(EUnaryExp{uop=UOSparkNot, right=mk_exp_of_exp e}))
|   red_factor4 _ _ =
        stack_error "red_factor4";
=TEX

=SML
fun ⦏red_primary1⦎ (Token ((LCNumericLiteral,CNText n), _)) = (
    PPExp (EIntReal n))
|   red_primary1 _ =
        stack_error "red_primary1";

fun ⦏red_primary2⦎ (Token ((LCCharacterLiteral,CNString c), _)) = (
    PPExp (ECharacterLiteral c))
|   red_primary2 _ =
        stack_error "red_primary2";

fun ⦏red_primary3⦎ (Token ((LCStringLiteral,CNString s), _)) = (
    PPExp (EStringLiteral s))
|   red_primary3 _ =
        stack_error "red_primary3";

val ⦏red_primary4⦎ = red_accept;
val ⦏red_primary5⦎ = red_accept;
fun ⦏red_primary6⦎ (Parsed (PPExp (EArrayAggPos{tmark=Nil,comps = [e]}))) = (
    PPExp (EBracketed (mk_exp_of_exp e)))
|   red_primary6 (Parsed pagg) = pagg
|   red_primary6 _ = stack_error "red_primary6";

val ⦏red_primary7⦎ = red_accept;
=TEX

=SML
fun ⦏red_relational_operator1⦎ _ = PPBinaryOp BOSparkEq;
fun ⦏red_relational_operator2⦎ _ = PPBinaryOp BOSparkNotEq;
fun ⦏red_relational_operator3⦎ _ = PPBinaryOp BOSparkLess;
fun ⦏red_relational_operator4⦎ _ = PPBinaryOp BOSparkLessEq;
fun ⦏red_relational_operator5⦎ _ = PPBinaryOp BOSparkGreater;
fun ⦏red_relational_operator6⦎ _ = PPBinaryOp BOSparkGreaterEq;
fun ⦏red_binary_adding_operator1⦎ _ = PPBinaryOp BOSparkAdd;
fun ⦏red_binary_adding_operator2⦎ _ = PPBinaryOp BOSparkMinus;
fun ⦏red_binary_adding_operator3⦎ _ = PPBinaryOp BOSparkConcat;
=TEX

=SML
fun ⦏red_unary_adding_operator1⦎ x1 = PPUnaryOp UOSparkUnaryAdd;
fun ⦏red_unary_adding_operator2⦎ x1 = PPUnaryOp UOSparkUnaryMinus;
fun ⦏red_multiplying_operator1⦎ x1 = PPBinaryOp BOSparkTimes;
fun ⦏red_multiplying_operator2⦎ x1 = PPBinaryOp BOSparkDiv;
fun ⦏red_multiplying_operator3⦎ x1 = PPBinaryOp BOSparkMod;
fun ⦏red_multiplying_operator4⦎ x1 = PPBinaryOp BOSparkRem;
=TEX

=SML
fun ⦏red_qualified_expression⦎ (Parsed(PPExp n)) _ (Parsed(PPExp e)) = (
    PPExp(EQualifiedExp{tmark=mk_type_mark n, exp=mk_exp_of_exp e}))
|   red_qualified_expression _ _ _ =
        stack_error "red_qualified_expression";
=TEX

=SML
val ⦏red_sequence_of_statements1⦎ = red_accept;

fun ⦏red_sequence_of_statements2⦎ (Parsed (PPStatement st1)) (Parsed(PPStatement st2)) = (
    PPStatement(STSemicolon(st1, st2))
) | red_sequence_of_statements2 _ _ =
        stack_error "red_sequence_of_statements2";

fun ⦏red_statement1⦎ (Parsed(PPKSlot k)) = (
    PPStatement(STKSlot k))
|   red_statement1 _ =
        stack_error "red_statement1";

fun ⦏red_statement2⦎ (Parsed(PPStatement(STSpecNoIvars{spec=spec, is_assertion, ...}))) = (
    PPStatement(STSpecNoIvars{spec=spec, label=push_label is_assertion, is_assertion = is_assertion}))
|   red_statement2 _ = stack_error "red_statement2";

fun ⦏red_statement3⦎ (Parsed(PPStatement(STSpecNoIvars{spec=spec, is_assertion, ...})))
			(Parsed(PPId label)) = (
    last_label := label;
    PPStatement(STSpecNoIvars{spec=spec, label=label, is_assertion = is_assertion}))
|   red_statement3 _ _ = stack_error "red_statement3";

fun ⦏red_statement4⦎ _ (Token ((LCZ,CNZ z1), _)) _
    (Parsed(PPStatement(STSpecNoIvars {spec=s, is_assertion, ...}))) = (
let	val ns_ts = process_con_z_decl z1;
	fun mk_log_con_def (n, t) = {x = n, t = t, e = mk_z_true};
in
    if is_assertion
   then parse_error 503001 "an assertion is not allowed in a logical constant statement"
   else  PPStatement(SLogCon{defs = map mk_log_con_def ns_ts, spec=s,
		pre1 = mk_z_true, label=push_label false})
end)
|   red_statement4 _ _ _ _ =
        stack_error "red_statement4";

fun ⦏red_statement5⦎ _ (Token ((LCZ,CNZ z1), _)) _
		(Parsed(PPStatement(STSpecNoIvars {spec=s, is_assertion, ...})))
		(Parsed(PPId label)) = (
let	val ns_ts = process_con_z_decl z1;
	fun mk_log_con_def (n, t) = {x = n, t = t, e = mk_z_true};
in
    if is_assertion
   then parse_error 503001 "an assertion is not allowed in a logical constant statement"
   else	(last_label := label;
	PPStatement(SLogCon{defs = map mk_log_con_def ns_ts, spec=s,
		pre1 = mk_z_true, label=label}))
end)
|   red_statement5 _ _ _ _ _ =
        stack_error "red_statement5";

val ⦏red_statement6⦎ = red_accept;
val ⦏red_statement7⦎ = red_accept;
fun ⦏red_statement8⦎ (Parsed (PPPragma e)) =
	PPStatement(STPragma e)
|   red_statement8 _ = stack_error "red_statement8";

fun ⦏red_statement9⦎ (Token ((LCAnnotation,CNText ann), _)) =
	PPStatement(STAnnotation [ANString ann])
|   red_statement9 _ = stack_error "red_statement9";

fun ⦏red_statement10⦎ (Parsed (PPId id)) (Parsed (PPStatement st)) =
	PPStatement(STLabelled{label = id, statement = st})
|   red_statement10 _ _ = stack_error "red_statement10";

=TEX

=SML
fun ⦏red_specification_statement1⦎ _ (Token ((LCZ,CNZ z1), _)) _
    (Token ((LCZ,CNZ z2), _)) _ = (
    let val (pre, post) =
            case process_pre_and_post_conditions z2
            of (Value pre', post') => (pre', post')
            |  (Nil, post') => (z_tm_true, post');
        val w=process_frame z1;
in
    PPStatement(STSpecNoIvars{spec={w=w, w0=[], pre=pre, post=post},
			label="", is_assertion = false})
end)
|   red_specification_statement1 _ _ _ _ _ =
        stack_error "red_specification_statement1";

fun ⦏red_specification_statement2⦎ _ (Token ((LCZ,CNZ z1), _)) _
    (Token ((LCZ,CNZ z2), _)) _ = (
let val (pre, post) =
    (process_predicate z2, z_tm_true);
    val w=process_frame z1;
in
    PPStatement(STSpecNoIvars{spec={w=w, w0=[], pre=pre,post=post},
			label="", is_assertion = false})
end)
|   red_specification_statement2 _ _ _ _ _ =
        stack_error "red_specification_statement2";
=TEX
=SML
fun ⦏red_specification_statement3⦎ _ _ (Token ((LCZ,CNZ z1), _)) _ = (
    let val (pre, post) =
            case process_pre_and_post_conditions z1
            of (Value pre', post') => (pre', post')
            |  (Nil, post') => (z_tm_true, post');
in
    PPStatement(STSpecNoIvars{spec={w=[], w0=[], pre=pre, post=post},
			label="", is_assertion = false})
end)
|   red_specification_statement3 _ _ _ _ =
        stack_error "red_specification_statement3";

fun ⦏red_specification_statement4⦎ _ _ (Token ((LCZ,CNZ z1), _)) _ = (
let val (pre, post) =
    (process_predicate z1, z_tm_true);
in
    PPStatement(STSpecNoIvars{spec={w=[], w0=[], pre=pre,post=post},
			label="", is_assertion = false})
end)
|   red_specification_statement4 _ _ _ _ =
        stack_error "red_specification_statement4";

fun ⦏red_specification_statement5⦎ _ _ (Token ((LCZ,CNZ z1), _)) _ = (
let val (pre, post) =
    (process_predicate z1, z_tm_true);
in
    PPStatement(STSpecNoIvars{spec={w=[], w0=[], pre=pre,post=post},
			label="", is_assertion = true})
end)
|   red_specification_statement5 _ _ _ _ =
        stack_error "red_specification_statement5";
=TEX
=SML
fun ⦏red_label1⦎ _ (Token ((LCNumericLiteral,CNText n), _)) _ = (
    if is_all_decimal n
    then
        PPId n
    else
        parse_error 503001 "numeric label may only contain digits")
|   red_label1 _ _ _ = stack_error "red_label1";

fun ⦏red_label2⦎ _ (Parsed (PPExp n)) _ = (
       PPId (mk_type_mark n))
|   red_label2 _ _ _ = stack_error "red_label2";

fun ⦏red_k_slot1⦎ _ (Token ((LCKSlot,CNKSlot lx), _)) _ = (
    PPKSlot{content=format_input_items lx, label=push_label false})
|   red_k_slot1 _ _ _ =
        stack_error "red_k_slot1";

fun ⦏red_k_slot2⦎ _ (Token ((LCKSlot,CNKSlot lx), _)) _ (Parsed(PPId lab)) = (
    last_label := lab;
    PPKSlot{content=format_input_items lx, label= lab})
|   red_k_slot2 _ _ _ _ =
        stack_error "red_k_slot2";
=TEX
=SML
fun ⦏red_ada_label1⦎  _ (Token ((_,CNText id), _)) _ = (
    PPId id
) |  red_ada_label1 _ _ _ = stack_error "red_ada_label1";
=TEX
=SML
val ⦏red_simple_statement1⦎ = red_accept;
val ⦏red_simple_statement2⦎ = red_accept;
val ⦏red_simple_statement3⦎ = red_accept;
val ⦏red_simple_statement4⦎ = red_accept;
val ⦏red_simple_statement5⦎ = red_accept;
val ⦏red_simple_statement6⦎ = red_accept;
val ⦏red_compound_statement1⦎ = red_accept;
val ⦏red_compound_statement2⦎ = red_accept;
val ⦏red_compound_statement3⦎ = red_accept;
val ⦏red_compound_statement4⦎ = red_accept;
=TEX

=SML
fun ⦏red_null_statement1⦎ _ _ = PPStatement (STNull SNNull);
fun ⦏red_null_statement2⦎ _ _ = PPStatement (STNull SNNothing);

fun ⦏red_assignment_statement⦎ (Parsed(PPExp n)) _ (Parsed(PPExp e)) _ = (
    PPStatement(STAssign{name=mk_exp_of_exp n, e=mk_exp_of_exp e}))
|   red_assignment_statement _ _ _ _ =
        stack_error "red_assignment_statement";
=TEX

=SML
fun ⦏red_if_statement⦎ _ (Parsed(PPExp exp)) _ (Parsed(PPStatement st))
    (Parsed(PPElsIf ei)) (Parsed(PPStatement el)) _ _ _ = (
let val css = (mk_exp_of_exp exp, st)::ei;
    fun aux ((c,s)::(rest as (_::_))) = (
        (STIfThenElse{g=c,p=s,q=aux rest,elsif=true})
    ) |  aux [(c,s)] = (
        (STIfThenElse{g=c,p=s,q=el,elsif=false})
    ) |  aux _ = (STNull SNImplicit);
in
    PPStatement (aux css)
end)
|   red_if_statement _ _ _ _ _ _ _ _ _ =
        stack_error "red_if_statement";
=TEX

=SML
val ⦏red_elsif_part1⦎ = PPElsIf [];
fun ⦏red_elsif_part2⦎ _ (Parsed (PPExp exp)) _ (Parsed(PPStatement st))
    (Parsed(PPElsIf ei)) = (
    PPElsIf ((mk_exp_of_exp exp, st)::ei))
|   red_elsif_part2 _ _ _ _ _ =
        stack_error "red_elsif_part2";
=TEX

=SML
val ⦏red_else_part1⦎ = PPStatement (STNull SNImplicit);

fun ⦏red_else_part2⦎ _ (Parsed p) = p
|   red_else_part2 _ _ =
        stack_error "red_else_part2";

val ⦏red_condition⦎ = red_accept;
=TEX

=SML
fun ⦏red_case_statement⦎ _ (Parsed(PPExp e)) _ (Parsed(PPCaseAlternatives cs))
    (Parsed(PPStatement others)) _ _ _ = (
    PPStatement(STCase{e=mk_exp_of_exp e, s=cs, others=others}))
|   red_case_statement _ _ _ _ _ _ _ _ =
        stack_error "red_case_statement";

val ⦏red_case_statement_alternative_list1⦎ = red_accept;

fun ⦏red_case_statement_alternative_list2⦎ (Parsed(PPCaseAlternatives cs))
    (Parsed(PPCaseAlternatives [c])) = (
    PPCaseAlternatives (cs@[c]))
|   red_case_statement_alternative_list2 _ _ =
    stack_error "red_case_statement_alternative_list2";

fun ⦏red_case_statement_alternative⦎ _ (Parsed(PPCaseChoices c)) _
    (Parsed(PPStatement st)) = (
    PPCaseAlternatives[{choices=c, p=st}])
|   red_case_statement_alternative _ _ _ _ =
    stack_error "red_case_statement_alternative";
=TEX

=SML
val ⦏red_case_choice_list1⦎ = red_accept;

fun ⦏red_case_choice_list2⦎ (Parsed(PPCaseChoices [ac])) _
    (Parsed(PPCaseChoices acl)) = (
    PPCaseChoices(ac::acl))
|   red_case_choice_list2 _ _ _ =
        stack_error "red_acase_choice_list2";
=TEX
=SML
fun ⦏red_case_choice⦎ (Parsed(PPExp e)) = (
    case e of
     EDiscreteRange (DRConstrained{tmark, range}) => (
        PPCaseChoices[CCCaseRange(DRConstrained
                {tmark=tmark,range=range})]
    ) |EDiscreteRange (DRRange range) => (
        PPCaseChoices[CCCaseRange(DRRange range)]
    ) |_ => (
        if is_range_attribute e
        then
            PPCaseChoices[CCCaseRange(DRRange(exp_to_range e))]
        else
            PPCaseChoices[CCCaseExp(mk_exp_of_exp e)]
    ))
|   red_case_choice _ =
        stack_error "red_case_choice";

val ⦏red_others_part1⦎ = PPStatement (STNull SNImplicit);

fun ⦏red_others_part2⦎ _ _ _ (Parsed p) = p
|   red_others_part2 _ _ _ _ =
        stack_error "red_others_part2";

=TEX

SPARK manual 5.5:
=SML
fun ⦏red_loop_statement⦎ (Parsed (PPLoopOrBlockName bn1)) (Parsed p) (Parsed(PPExps es))
    (Parsed(PPStatement st)) (Parsed (PPLoopOrBlockName bn2)) _ = (
let	val _ =
		if bn1 <> bn2
		then	parse_error 503001
			"in a loop statement the loop names must either both be present and be the same or both be absent"
		else	();
	val till =
		case es of
			[EAuxiliaryExp tm] => Value tm
		|	_ => Nil;
in
	case p of
		PPExp c => (
	PPStatement(STWhile{name=bn1, g=c, loop= {t=till, stmt=st}})
	) |	PPFor(id, tm, dir, opr) => (
		case opr of
			Value range => (
			PPStatement(STForStatic{name=bn1, tmark=tm, i=id,
				range=range, dir=dir,loop={t=till, stmt=st}})
		) |	Nil => (
		PPStatement(STForTmark{name=bn1,i=id, tmark=force_value tm, dir=dir,
				loop={t=till, stmt=st}})
        		)
	) |	PPId "__no_scheme" => (
		PPStatement(STLoop{name=bn1, loop = {t=till, stmt=st}})
	) |  _ => stack_error"red_loop_statement_a"
end)
|   red_loop_statement _ _ _ _ _ _ = stack_error "red_loop_statement";
=TEX
=SML
fun ⦏red_loop_body⦎ _ (Parsed(pst as PPStatement _)) _ _ = pst
|   red_loop_body _ _ _ _  = stack_error "red_loop_body";
=TEX
=SML
val ⦏red_name_colon_opt1⦎ = PPLoopOrBlockName LBNoName;

fun ⦏red_name_colon_opt2⦎ (Token ((_,CNText id), _)) _ = (
	PPLoopOrBlockName (LBAdaName id)
) | red_name_colon_opt2 _ _ =
        stack_error "red_name_colon_opt2";
fun ⦏red_name_colon_opt3⦎ _ (Token ((_,CNText id), _)) _ = (
	PPLoopOrBlockName (LBCNName id)
) | red_name_colon_opt3 _ _ _ =
        stack_error "red_name_colon_opt3";
=TEX
=SML
val ⦏red_cn_name_opt1⦎ = PPLoopOrBlockName LBNoName;

fun ⦏red_cn_name_opt2⦎ (Token ((_,CNText id), _)) = (
	PPLoopOrBlockName (LBAdaName id)
) | red_cn_name_opt2 _ =
        stack_error "red_cn_name_opt2";

fun ⦏red_cn_name_opt3⦎ _ (Token ((_,CNText id), _)) = (
	PPLoopOrBlockName (LBCNName id)
) | red_cn_name_opt3 _ _ =
        stack_error "red_cn_name_opt2";
=TEX
=SML
val ⦏red_name_opt1⦎ = PPIds [];

fun ⦏red_name_opt2⦎ (Token ((_,CNText id), _)) = (
    PPIds [id])
|   red_name_opt2 _ =
        stack_error "red_name_opt2";

val ⦏red_iteration_scheme_opt1⦎ = PPId "__no_scheme";

val ⦏red_iteration_scheme_opt2⦎ = red_accept;

fun ⦏red_iteration_scheme1⦎ _ (Parsed p) = (p)
|   red_iteration_scheme1 _ _ =
        stack_error "red_iteration_scheme1";
=SML
fun ⦏red_iteration_scheme2⦎ _ (Parsed p) = (p)
|   red_iteration_scheme2 _ _ =
        stack_error "red_iteration_scheme2";
=TEX
=SML

fun ⦏red_loop_parameter_specification1⦎ (Token ((_,CNText id), _)) _
    (Parsed(PPExp e)) =
	let	val (opt_tm, opt_range) = exp_to_loop_params e;
	in	PPFor(id, opt_tm, LDForwards, opt_range)
	end
|   red_loop_parameter_specification1 _ _ _ =
    stack_error "red_loop_parameter_specification1";

fun ⦏red_loop_parameter_specification2⦎ (Token ((_,CNText id), _)) _ _
    (Parsed(PPExp e)) =
	let	val (opt_tm, opt_range) = exp_to_loop_params e;
	in	PPFor(id, opt_tm, LDReverse, opt_range)
	end
|   red_loop_parameter_specification2 _ _ _ _ =
     stack_error "red_loop_parameter_specification2";

val ⦏red_till_opt1⦎ = PPExps [];
fun ⦏red_till_opt2⦎ _ (Parsed(PPExp(EAuxiliaryExp z))) = (
    PPExps[EAuxiliaryExp z])
|   red_till_opt2 _ _ =
        stack_error "red_till_opt2";
=TEX

=SML
fun ⦏red_auxiliary_expression⦎ _ (Token ((LCZ,CNZ z), _)) _ = (
    PPExp(EAuxiliaryExp (z_tm_of_z_tokens "badly formed Z expression" z )))
|   red_auxiliary_expression _ _ _ =
        stack_error "red_auxiliary_expression";
=TEX
=SML
fun ⦏red_block_statement1⦎ (Parsed (PPLoopOrBlockName bn1)) _ (Parsed (PPDeclarations decls))
	_ (Parsed(PPStatement s)) _ (Parsed (PPLoopOrBlockName bn2)) _ = (
	if bn1 <> bn2
	then	parse_error 503001
		"in a block statement the block names must either both be present and be the same or both be absent"
	else	PPStatement(SBlockStatement {name = bn1, declarative_part = Value decls, statement = s})
) | red_block_statement1 _ _ _ _ _ _ _ _=
	stack_error "red_block_statement1";

fun ⦏red_block_statement2⦎ (Parsed (PPLoopOrBlockName bn1))
	_ (Parsed(PPStatement s)) _ (Parsed (PPLoopOrBlockName bn2)) _ = (
	if bn1 <> bn2
	then	parse_error 503001
		"in a block statement the block names must either both be present and be the same or both be absent"
	else	PPStatement(SBlockStatement {name = bn1, declarative_part = Nil, statement = s})
) | red_block_statement2 _ _ _ _ _  _=
	stack_error "red_block_statement2";

=SML

=TEX

=SML

fun ⦏red_exit_statement1⦎ _ (Parsed(PPIds [])) _ = (
    PPStatement (STExit { n = Nil })
) | red_exit_statement1 _ (Parsed(PPIds [id])) _ = (
    PPStatement (STExit { n = Value id })
) | red_exit_statement1 _ _ _ =
    stack_error "red_exit_statement1";

fun ⦏red_exit_statement2⦎ _ (Parsed(PPIds [])) _ (Parsed(PPExp exp)) _ = (
    PPStatement(STExitWhen{ g = mk_exp_of_exp exp, n = Nil })
) | red_exit_statement2 _ (Parsed(PPIds [id])) _ (Parsed(PPExp exp)) _ = (
    PPStatement(STExitWhen{ g = mk_exp_of_exp exp, n = Value id })
) | red_exit_statement2 _ _ _ _ _ =
        stack_error "red_exit_statement2";
=TEX
=SML
fun ⦏red_return_statement1⦎ _ _ = (
    PPStatement (STRet{ e = Nil })
);

fun ⦏red_return_statement2⦎ _ (Parsed(PPExp exp)) _ = (
    PPStatement (STRet{ e = Value (mk_exp_of_exp exp) }))
|   red_return_statement2 _ _ _ =
        stack_error "red_return_statement2";
=TEX
=SML
fun ⦏red_goto_statement1⦎ _ (Parsed(PPExp exp)) _ = (
    PPStatement (STGoto { label = mk_type_mark exp })
) | red_goto_statement1 _ _ _ = stack_error "red_goto_statement1";
=TEX

=SML
fun ⦏red_subprogram_declaration1⦎ (Parsed(PPProcedureSpecification p)) _ = (
    PPDeclarations[DProcedureDeclaration {implicit = false, spec = p}])
|   red_subprogram_declaration1 _ _ =
        stack_error "red_subprogram_declaration1";

fun ⦏red_subprogram_declaration2⦎ (Parsed(PPFunctionSpecification f)) _ = (
    PPDeclarations[DFunctionDeclaration {implicit = false, spec = f}])
|   red_subprogram_declaration2 _ _ =
        stack_error "red_subprogram_declaration2";

fun ⦏red_subprogram_declaration3⦎ _ (Parsed(PPProcedureSpecification p)) _ = (
    PPDeclarations[DProcedureDeclaration {implicit = true, spec = p}])
|   red_subprogram_declaration3 _ _ _ =
        stack_error "red_subprogram_declaration1";

fun ⦏red_subprogram_declaration4⦎ _ (Parsed(PPFunctionSpecification f)) _ = (
    PPDeclarations[DFunctionDeclaration {implicit = true, spec = f}])
|   red_subprogram_declaration4 _ _ _ =
        stack_error "red_subprogram_declaration2";

=TEX

=SML
fun ⦏red_subprogram_specification1⦎ (Parsed(PPProcedureSpecification p)) = (
    PPSubprogramSpec(SSProcedure p))
|   red_subprogram_specification1 _ =
        stack_error "red_subprogram_specification1";

fun ⦏red_subprogram_specification2⦎ (Parsed(PPFunctionSpecification p)) = (
    PPSubprogramSpec(SSFunction p))
|   red_subprogram_specification2 _ =
        stack_error "red_subprogram_specification2";
=TEX

=SML
fun ⦏red_procedure_specification_1_1⦎ _ (Token ((_,CNText id), _)) = (
    PPProcedureSpecification{name=id, formal_part=[], spec=Nil, annotation = [], globals=[]})
|   red_procedure_specification_1_1 _ _ =
        stack_error "red_procedure_specification_1_1";

fun ⦏red_procedure_specification_1_2⦎ _ (Token ((_,CNText id), _))
    (Parsed(PPProcedureSpecificationStatement(deps, STSpecNoIvars {spec=s, is_assertion, ...}))) = (
    if is_assertion
   then parse_error 503001 "an assertion is not allowed as a subprogram specification statement"
   else  PPProcedureSpecification{name=id,formal_part=[],spec=Value s, annotation = [], globals = deps})
|   red_procedure_specification_1_2 _ _ _ =
        stack_error "red_procedure_specification_1_2";

fun ⦏red_procedure_specification_1_3⦎ _ (Token ((_,CNText id), _))
    (Parsed (PPFormals f)) = (
    PPProcedureSpecification{name=id,formal_part=f,spec=Nil, annotation = [], globals = []})
|   red_procedure_specification_1_3 _ _ _ =
        stack_error "red_procedure_specification_1_3";

fun ⦏red_procedure_specification_1_4⦎ _ (Token ((_,CNText id), _))
    (Parsed (PPFormals f))
	(Parsed(PPProcedureSpecificationStatement(deps, STSpecNoIvars {spec=s, is_assertion, ...}))) = (
    if is_assertion
   then parse_error 503001 "an assertion is not allowed as a subprogram specification statement"
   else  PPProcedureSpecification{name=id,formal_part=f,spec=Value s, annotation = [], globals = deps})
|   red_procedure_specification_1_4 _ _ _ _=
        stack_error "red_procedure_specification_1_4";

fun ⦏red_procedure_specification⦎
    (Parsed(PPProcedureSpecification{name=id,formal_part=f,spec=s, globals=g, annotation=_}))
    (Parsed (PPAnnotation ann)) = (
	PPProcedureSpecification{name=id, formal_part=f, spec=s, annotation=ann, globals=g}
) |   red_procedure_specification _ _ =
        stack_error "red_procedure_specification";
=TEX
=SML
fun ⦏red_procedure_specification_statement1⦎ _ (Token ((LCZ,CNZ z1), _))
	(Parsed(PPStatement(STSpecNoIvars{spec={w=deps, w0=_, pre=pre, post=post},
			label="", is_assertion}))) = (
    let         val w=process_frame z1;
in
    if is_assertion
   then parse_error 503001 "an assertion is not allowed as a subprogram specification statement"
   else  PPProcedureSpecificationStatement
	(deps, STSpecNoIvars{spec={w=w, w0=[], pre=pre, post=post}, label="", is_assertion = false})
end)
|   red_procedure_specification_statement1 _ _ _ =
        stack_error "red_procedure_specification_statement1";
=TEX
=SML
fun ⦏red_procedure_specification_statement2⦎ _
	(Parsed(PPStatement(STSpecNoIvars{spec={w=deps, w0=_, pre=pre, post=post},
			label="", is_assertion}))) = (
    if is_assertion
   then parse_error 503001 "an assertion is not allowed as a subprogram specification statement"
   else   PPProcedureSpecificationStatement
	(deps, STSpecNoIvars{spec={w=[], w0=[], pre=pre, post=post}, label="", is_assertion = false})
) |   red_procedure_specification_statement2 _ _ =
        stack_error "red_procedure_specification_statement2";
=TEX
=SML
fun ⦏red_procedure_specification_statement3⦎
	(Parsed(PPStatement spc)) = (
    PPProcedureSpecificationStatement
	([], spc)
) |   red_procedure_specification_statement3 _ =
        stack_error "red_procedure_specification_statement3";
=TEX
=SML
val ⦏red_function_specification_statement1⦎ = red_specification_statement1;
val ⦏red_function_specification_statement2⦎ = red_specification_statement2;
val ⦏red_function_specification_statement3⦎ = red_specification_statement3;
val ⦏red_function_specification_statement4⦎ = red_specification_statement4;
=TEX
=SML
fun ⦏red_function_specification_1_1⦎ _ (Token((_,CNText des), _)) _
    (Parsed(PPExp n)) = (
    PPFunctionSpecification{designator=des,
        return=mk_type_mark n,
	formal_part=[],spec=Nil,globals=[],annotation=[]})
|   red_function_specification_1_1 _ _ _ _ =
        stack_error "red_function_specification_1_1";

fun ⦏red_function_specification_1_2⦎ _ (Token((_,CNText des), _)) _
    (Parsed(PPExp n))
	(Parsed(PPStatement(STSpecNoIvars {spec={w, w0, pre, post}, is_assertion, ...}))) = (
   if is_assertion
   then parse_error 503001 "an assertion is not allowed as a subprogram specification statement"
   else  PPFunctionSpecification{designator=des,
	return=mk_type_mark n,
	formal_part=[],spec=Value {w=[], w0=[], pre=pre, post=post},
	globals=w,annotation=[]})
|   red_function_specification_1_2 _ _ _ _ _ =
        stack_error "red_function_specification_1_2";

fun ⦏red_function_specification_1_3⦎ _ (Token((_,CNText des), _))
    (Parsed(PPFormals f)) _ (Parsed(PPExp n)) = (
    PPFunctionSpecification{designator=des,
	return=mk_type_mark n,
	formal_part=f,spec=Nil,globals=[],annotation=[]})
|   red_function_specification_1_3 _ _ _ _ _ =
        stack_error "red_function_specification_1_3";

fun ⦏red_function_specification_1_4⦎ _ (Token((_,CNText des), _))
    (Parsed(PPFormals f)) _ (Parsed(PPExp n))
    (Parsed(PPStatement(STSpecNoIvars {spec={w, w0, pre, post}, is_assertion, ...}))) = (
    if is_assertion
   then parse_error 503001 "an assertion is not allowed as a subprogram specification statement"
   else  PPFunctionSpecification{designator=des,
        return=mk_type_mark n,
	formal_part=f,spec=Value {w=[], w0=[], pre=pre, post=post},
	globals=w,annotation=[]})
|   red_function_specification_1_4 _ _ _ _ _ _ =
        stack_error "red_function_specification_1_4";

fun ⦏red_function_specification⦎
    (Parsed(PPFunctionSpecification{designator=des,return=tm,
			formal_part=f,spec=s,globals=g, ...}))
    (Parsed (PPAnnotation ann)) = (
	PPFunctionSpecification{designator=des,return=tm,
			formal_part=f,spec=s,globals=g,annotation = ann}
) |   red_function_specification _ _ =
        stack_error "red_function_specification";
=TEX
=SML
val ⦏red_annotation_list1⦎ = PPAnnotation [];

fun ⦏red_annotation_list2⦎ (Token ((LCAnnotation,CNText ann), _))
	(Parsed (PPAnnotation anns)) = (
	PPAnnotation (ANString ann :: anns)
)|  red_annotation_list2 _ _ = stack_error "red_annotation_list2";

fun ⦏red_annotation_list3⦎ (Parsed (PPKSlot ks))
	(Parsed (PPAnnotation anns)) = (
	PPAnnotation (ANKSlot ks :: anns)
)|  red_annotation_list3 _ _ = stack_error "red_annotation_list3";
=TEX
SPARK manual 6.1:
=SML
fun ⦏red_operator_symbol⦎ (Token((StringLiteral,CNString opsym), _)) = (
    PPId opsym)
|   red_operator_symbol _ =
        stack_error "red_operator_symbol";

fun ⦏red_formal_part⦎ _ (Parsed p) _ = (p)
|   red_formal_part _ _ _ =
        stack_error "red_formal_part";

val ⦏red_parlist1⦎ = red_accept;

fun ⦏red_parlist2⦎ (Parsed (PPFormals f1)) _ (Parsed(PPFormals f2)) = (
    PPFormals (f1@f2))
|   red_parlist2 _ _ _ =
        stack_error "red_parlist2";
=TEX
=SML
fun ⦏red_parameter_specification1⦎ (Parsed(PPIds ids)) _ (Parsed(PPMode m))
    (Parsed(PPExp n)) = (
    PPFormals[{idlist=ids,mode=m,name=mk_type_mark n, default = Nil}])
|   red_parameter_specification1 _ _ _ _ =
        stack_error "red_parameter_specification1";

fun ⦏red_parameter_specification2⦎ (Parsed(PPIds ids)) _ (Parsed(PPMode m))
    (Parsed(PPExp n)) _ (Parsed(PPExp e)) = (
    PPFormals[{idlist=ids,mode=m,name=mk_type_mark n, default = Value e}])
|   red_parameter_specification2 _ _ _ _ _ _ =
        stack_error "red_parameter_specification2";

val ⦏red_mode1⦎ = PPMode (MSparkIn false);
fun ⦏red_mode2⦎ _ = PPMode (MSparkIn true);
fun ⦏red_mode3⦎ _ = PPMode MSparkOut;
fun ⦏red_mode4⦎ _ _ = PPMode MSparkInOut;
=TEX

SPARK manual 6.3:
=SML
fun ⦏red_subprogram_body1⦎
	(Parsed (PPProcedureSpecification ps)) _
    (Parsed (PPSubprogram (d, s, ido))) = (
let	val {name=id',...} = ps;
	val side =
	if    different_simple_names (id' :: ido)
	then    parse_error 503001 "PROCEDURE identifiers do not match"
	else    ();
in	PPProperBody (PBProcedure {deferred = false,
		procedure_spec = ps,declarative_part = d,
		statement = s, end_name = opt_of_list ido})
end
) | red_subprogram_body1 _ _ _ =
        stack_error "red_subprogram_body1";
=TEX
=SML
fun ⦏red_subprogram_body2⦎ _
	(Parsed (PPProcedureSpecification ps)) _
    (Parsed (PPSubprogram (d, s, ido))) = (
let val {name=id',...} = ps;
    val side =if    different_simple_names (id' :: ido)
            then    parse_error 503001 "PROCEDURE identifiers do not match"
            else    ();
in
    PPProperBody (PBProcedure {deferred = true,
	procedure_spec = ps,declarative_part = d,
	statement = s, end_name = opt_of_list ido})
end)
|   red_subprogram_body2 _ _ _ _ =
        stack_error "red_subprogram_body2";
=TEX
=SML
fun ⦏red_subprogram_body3⦎
		(Parsed (PPFunctionSpecification fs)) _
    (Parsed (PPSubprogram (d, s, ido))) = (
let val {designator=id',...} = fs;
    val side =if    different_simple_names (id' :: ido)
            then    parse_error 503001 "FUNCTION designators do not match"
            else    ();
in
    PPProperBody (PBFunction {deferred = false,
		function_spec = fs,declarative_part = d,
		statement = s, end_name=opt_of_list ido})
end)
|   red_subprogram_body3 _ _ _ =
        stack_error "red_subprogram_body3";

fun ⦏red_subprogram_body4⦎ _
		(Parsed (PPFunctionSpecification fs)) _
    (Parsed (PPSubprogram (d, s, ido))) = (
let val {designator=id',...} = fs;
    val side =if    different_simple_names (id' :: ido)
            then    parse_error 503001 "FUNCTION designators do not match"
            else    ();
in
    PPProperBody (PBFunction {deferred = true,
		function_spec = fs,declarative_part = d,
		statement = s, end_name=opt_of_list ido})
end)
|   red_subprogram_body4 _ _ _ _ =
        stack_error "red_subprogram_body4";
=TEX
=SML
fun ⦏red_subprogram_implementation⦎ (Parsed(PPDeclarations d)) _
    (Parsed(PPStatement s)) _ (Parsed(PPIds ido)) _ = (
    PPSubprogram (d, s, ido))
|   red_subprogram_implementation _ _ _ _ _ _ =
        stack_error "red_subprogram_implementation";
=TEX

=SML
fun ⦏red_procedure_call_statement⦎ (Parsed (p as (PPExp e))) _ = (
    case e
    of EIndexedComp{prefix=prefix,index=EArrayAggPos{comps = comps,...}} => (
        PPStatement (STProcNoIvars{name=mk_type_mark prefix,
            actuals=APositional comps})
    )|  EIndexedComp{prefix=prefix,index=EArrayAggNamed
		{tmark=_,named_assocs=na}} => (
        PPStatement (STProcNoIvars{name=mk_type_mark prefix,
            actuals=ANamed na})
    )|  EIndexedComp{index=EArrayAggNamedOthers _,...} => (
        parse_error 503001 "OTHERS is not allowed in a parameter association"
    )|  EIndexedComp{index=EArrayAggPosOthers _,...} => (
        parse_error 503001 "OTHERS is not allowed in a parameter association"
    )|  EIndexedComp{index=EArrayAggOthers _,...} => (
        parse_error 503001 "OTHERS is not allowed in a parameter association"
    )|_ => (
        PPStatement (STProcNoIvars{name=mk_type_mark e, actuals=APositional[]})
    ))
|   red_procedure_call_statement _ _ =
        stack_error "red_procedure_call_statement";

fun ⦏red_actual_parameter_part⦎ _ (Parsed p) _ = (
    p)
|   red_actual_parameter_part _ _ _ =
        stack_error "red_actual_parameter_part";

fun ⦏red_parameter_association1⦎
    (Parsed(PPAgg{tm=tm,named_assocs=na,others=ot})) = (
    case ot
    of Value oe => PPExp (EArrayAggNamedOthers
            {agg_named={tmark=Nil,named_assocs=na},
            others={others=oe}})
    |  Nil => PPExp (EArrayAggNamed{tmark=Nil,named_assocs=na}))
|   red_parameter_association1 _ =
        stack_error "red_parameter_association1";

fun ⦏red_parameter_association2⦎ (Parsed(PPExps es)) = (
    PPExp(EArrayAggPos{tmark=Nil,comps = es}))
|   red_parameter_association2 _ =
        stack_error "red_parameter_association2";

fun ⦏red_positional_parameter_association1⦎ (Parsed(PPExp e)) = (
    PPExps [e])
|   red_positional_parameter_association1 _ =
        stack_error "red_positional_parameter_association1";

fun ⦏red_positional_parameter_association2⦎ (Parsed(PPExp e)) _
    (Parsed(PPExps es)) = (
    PPExps (e::es))
|   red_positional_parameter_association2  _ _ _ =
        stack_error "red_positional_parameter_association2";
=TEX

=SML
fun red_actual_parameter (Parsed(PPSubtypeIndication si)) = (
	PPExp (si_to_discrete_range si)
) | red_actual_parameter  _ =
        stack_error "red_actual_parameter";
=TEX

SPARK manual 7.1:
=SML
fun ⦏red_package_declaration⦎ (Parsed (PPPackageSpecification p)) _ = (
    PPDeclarations[DPackageDeclaration p])
|   red_package_declaration _ _ =
        stack_error "red_package_declaration";

fun ⦏red_package_specification1⦎ _ (Parsed (PPIds en))
	(Parsed (PPAnnotation ann)) _
    (Parsed(PPDeclarations v)) _ (Parsed(PPIds enol)) = (
let	val side =
		if    different_expanded_names (en, enol)
		then    parse_error 503001 "PACKAGE names do not match"
		else    ();
	val eno = opt_non_empty_list_of_list enol;
in	PPPackageSpecification
	{name=en,visible_decs = v,private_decs = Nil,
		annotation = ann, end_name = eno}
end
) | red_package_specification1 _ _ _ _ _ _ _ =
        stack_error "red_package_specification1";

fun ⦏red_package_specification2⦎ _ (Parsed (PPIds en))
	(Parsed (PPAnnotation ann))  _
    (Parsed(PPDeclarations v)) _  (Parsed(PPDeclarations p)) _
    (Parsed(PPIds enol)) = (
let	val side =
		if    different_expanded_names (en, enol)
           	then    parse_error 503001 "PACKAGE names do not match"
		else    ();
	val eno = opt_non_empty_list_of_list enol;
in	PPPackageSpecification
		{name = en, visible_decs = v, private_decs = Value p,
			annotation = ann, end_name = eno}
end
) | red_package_specification2 _ _ _ _ _ _ _ _ _ =
        stack_error "red_package_specification2";

val ⦏red_visible_part1⦎ = PPDeclarations [];

fun ⦏red_visible_part2⦎ (Parsed (PPDeclarations d1))
    (Parsed (PPDeclarations d2)) = (
    PPDeclarations (d1@d2))
|   red_visible_part2 _ _ =
        stack_error "red_visible_part2";

=TEX
=SML
val ⦏red_expanded_name_opt1⦎ = PPIds [];
val ⦏red_expanded_name_opt2⦎ = red_accept;
val ⦏red_expanded_name1⦎ = red_identifier_list1;
val ⦏red_expanded_name2⦎ = red_identifier_list2;
=TEX

SPARK manual 7.1:
=SML
fun ⦏red_visdec1⦎ (Parsed (PPKSlot k)) = (
    PPDeclarations [DDeclarationKSlot (k, DKVisible)])
|   red_visdec1 _ =
        stack_error "red_visdec1";

val ⦏red_visdec2⦎ = red_accept;

val ⦏red_visdec3⦎ = red_accept;

fun ⦏red_visdec4⦎ _ (Token ((LCZ,CNZ z1), _)) _ = (
let	val (ns, ty) =
                        process_aux_z_decl z1
in
    PPDeclarations [DAuxiliary{aux=ns, t=ty}]
end)
|   red_visdec4 _ _ _ = stack_error "red_visdec4";

val ⦏red_visdec5⦎ = red_accept;

val ⦏red_private_part⦎ = red_accept;

=TEX

=SML
fun ⦏red_package_body⦎ _ _ (Parsed (PPIds en))
	(Parsed (PPAnnotation ann)) _
    (Parsed(PPSubprogram (d,s, _))) _ (Parsed(PPIds enol)) _ = (
let	val side =
		if    different_expanded_names (en, enol)
		then    parse_error 503001 "PACKAGE names do not match"
		else    ();
	val eno = opt_non_empty_list_of_list enol;
in	PPProperBody(PBPackage
		{name=en,decls=d,statement=s,
			annotation=ann, end_name = eno})
end
) | red_package_body _ _ _ _ _ _ _ _ _ =
        stack_error "red_package_body";

fun ⦏red_package_implementation1⦎ (Parsed (PPDeclarations d)) = (
    PPSubprogram (d, (STNull SNImplicit), []))
|   red_package_implementation1 _ =
        stack_error "red_package_implementation1";

fun ⦏red_package_implementation2⦎ (Parsed (PPDeclarations d)) _
    (Parsed(PPStatement s)) = (
    PPSubprogram (d, s, []))
|   red_package_implementation2 _ _ _ =
        stack_error "red_package_implementation2";

fun is_k_slot (DDeclarationKSlot _ : DECLARATION) : bool = true
|   is_k_slot _ = false;


fun ⦏red_package_implementation3⦎ (Parsed (PPDeclarations using))
		(Parsed (PPDeclarations d)) = (
	if      any d is_k_slot
	then    parse_error 503001
		"a k-slot is not allowed after the using declarations"
	else    PPSubprogram (using@d, (STNull SNImplicit), []))
|   red_package_implementation3 _ _  =
        stack_error "red_package_implementation3";

fun ⦏red_package_implementation4⦎ (Parsed (PPDeclarations using))
		(Parsed (PPDeclarations d)) _ (Parsed(PPStatement s)) = (
	if      any d is_k_slot
	then    parse_error 503001
		"a k-slot is not allowed after the using declarations"
	else    PPSubprogram (using@d, s, []))
|   red_package_implementation4 _ _ _ _ =
        stack_error "red_package_implementation4";

val ⦏red_package_initialization⦎ = red_accept;
=TEX
=SML
fun ⦏check_basic_dec_list⦎ ((bd::more) : SI_BASIC_DECL list) : bool = (
	case bd of
		SIDeferredConstDecl _ => false
	|	SIPrivateTypeDecl _ => false
	|	_ => check_basic_dec_list more
) | check_basic_dec_list _ = true;
=TEX
=SML
fun ⦏red_using_dec⦎ _ (Parsed(PPBasicDecls bds)) _
	(Token ((LCZ,CNZ z1), _)) _ (Token ((LCZ,CNZ zpred), _)) _ = (
	if check_basic_dec_list bds
	then	PPDeclarations[DUsing{
			aux=z_tm_of_z_tokens "badly formed Z expression" z1,
			basic_decls=bds,
			invariant=process_predicate zpred}]
	else	parse_error 503001
		"private types and deferred constants are not allowed in a USING declaration"
) |   red_using_dec _ _ _ _ _ _ _ =
        stack_error "red_using_dec";
=TEX
=SML
fun ⦏red_basic_dec_list1⦎ (Parsed(PPBasicDecls bds)) = (
	PPBasicDecls bds)
|   red_basic_dec_list1 _ =
        stack_error "red_basic_dec_list1";

fun ⦏red_basic_dec_list2⦎ (Parsed(PPBasicDecls bds1))
		(Parsed(PPBasicDecls bds2)) = (
    PPBasicDecls(bds1@bds2))
|   red_basic_dec_list2 _ _ =
        stack_error "red_basic_dec_list2";

=TEX
=SML
=TEX
SPARK manual 7.4:
=SML
fun ⦏red_private_type_declaration1⦎ _ (Token ((_,CNText id), _)) _ _ _ = (
    PPBasicDecls[SIPrivateTypeDecl{id=id, disc=[], limited=false}])
|   red_private_type_declaration1 _ _ _ _ _ =
        stack_error "red_private_type_declaration1";

fun ⦏red_private_type_declaration2⦎ _ (Token ((_,CNText id), _))
	(Parsed (PPFormals fps)) _ _ _ = (
    PPBasicDecls[SIPrivateTypeDecl{
		id=id,
		disc=map par_spec_to_disc_spec fps,
		limited=false}])
|   red_private_type_declaration2 _ _ _ _ _ _ =
        stack_error "red_private_type_declaration2";

fun ⦏red_private_type_declaration3⦎ _ (Token ((_,CNText id), _)) _ _ _ _ = (
    PPBasicDecls[SIPrivateTypeDecl{id=id, disc=[], limited=true}])
|   red_private_type_declaration3 _ _ _ _ _ _ =
        stack_error "red_private_type_declaration3";

fun ⦏red_private_type_declaration4⦎ _ (Token ((_,CNText id), _))
	(Parsed (PPFormals fps)) _ _ _ _ = (
    PPBasicDecls[SIPrivateTypeDecl{
		id=id,
		disc=map par_spec_to_disc_spec fps,
		limited=true}])
|   red_private_type_declaration4 _ _ _ _ _ _ _ =
        stack_error "red_private_type_declaration4";
=TEX

=SML
fun ⦏red_deferred_constant_declaration⦎ (Parsed(PPIds ids)) _ _
    (Parsed(PPSubtypeIndication n)) _ = (
    PPBasicDecls[SIDeferredConstDecl{consts=ids,tmark=si_to_tmark n}])
|   red_deferred_constant_declaration p _ _ q _ =
        stack_error "red_deferred_constant_declaration";
=TEX
=SML
val ⦏red_use_clause1⦎ = red_accept;
val ⦏red_use_clause2⦎ = red_accept;
fun ⦏red_use_package_clause⦎ _ (Parsed (PPExpandedNames ens)) _ = PPUseClause (UCUse ens)
|   red_use_package_clause _ _ _ =
	stack_error "red_use_package_clause";
fun ⦏red_use_type_clause⦎ _ _ (Parsed (PPExps ns)) _ = PPUseClause (UCUseType(map mk_type_mark ns))
|   red_use_type_clause _ _ _ _ =
	stack_error "red_use_type_clause";
=TEX
=SML
fun ⦏red_renaming_declaration1⦎
	(Parsed (PPIds [id])) _ (Parsed (PPExp tm))
	_ (Parsed (PPExp n)) _ = (
	PPDeclarations[DRenamingDeclaration(RDObject
	{new_name = id, tmark = mk_type_mark tm, old_name = mk_type_mark n})]
) | red_renaming_declaration1 (Parsed (PPIds _)) _ _ _ _ _ = (
        parse_error 503001
       "A renaming declaration may declare only one new identifier"
) | red_renaming_declaration1 _ _ _ _ _ _ =
	stack_error "red_renaming_declaration1";
	
fun ⦏red_renaming_declaration2⦎
	_ (Parsed (PPIds new_en)) _
	_ (Parsed (PPIds old_en)) _ = (
	PPDeclarations[DRenamingDeclaration(RDPackage
	{new_name = new_en, old_name = old_en})]
) | red_renaming_declaration2 _ _ _ _ _ _ =
	stack_error "red_renaming_declaration2";
	

fun ⦏red_renaming_declaration3⦎ _ (Parsed (PPId opsym1))
    (Parsed(PPFormals f)) _ (Parsed(PPExp n1)) _
    (Parsed(PPExp n2)) _ (Parsed (PPId opsym2)) _ = (
    if opsym1 = opsym2
    then
        PPDeclarations[DRenamingDeclaration(RDOpsym
        {new_name=Nil,formal_part=f,tmark=mk_type_mark n1,
           name1=Value (mk_type_mark n2), name2=opsym2})]
    else
        parse_error 503001
       "The two operator symbols in a renaming declaration must be the same")
|   red_renaming_declaration3 _ _ _ _ _ _ _ _ _ _ =
        stack_error "red_renaming_declaration3";

fun ⦏red_renaming_declaration4⦎ (Parsed (PPSubprogramSpec ss)) _
    (Parsed(PPExp n)) _ = (
   let val (id1, id2) = case n of
		ESelectedComp {prefix, selector} => (Value (mk_type_mark prefix), selector)
	|	_ => (Nil, mk_type_mark n);
	val res = PPDeclarations[DRenamingDeclaration(RDSubprogram
          		{subprogram_specification=ss,name1=id1,name2=id2})];
   in  case ss of
          SSProcedure {spec = Nil, ...} => res
       |  SSFunction {spec = Nil, ...} => res
       |  _ => parse_error 503001
         "A specification statement is not allowed in a renaming declaration"
   end)
|   red_renaming_declaration4 _ _ _ _  =
        stack_error "red_renaming_declaration4";


fun ⦏red_renaming_declaration5⦎ (Parsed (PPSubprogramSpec (SSFunction
	{designator=id,formal_part=f, return=tm, spec=Nil, ...})))
    _ (Parsed(PPExp n2)) _ (Parsed (PPId opsym2)) _ = (
        PPDeclarations[DRenamingDeclaration(RDOpsym
        {new_name=Value id,formal_part=f,tmark=tm,
           name1=Value(mk_type_mark n2), name2=opsym2})])
|   red_renaming_declaration5 (Parsed (PPSubprogramSpec (SSFunction _))) _ _ _ _ _ =
	parse_error 503001
         "A specification statement is not allowed in a renaming declaration"
|   red_renaming_declaration5 (Parsed (PPSubprogramSpec (SSProcedure _))) _ _ _ _ _ =
	parse_error 503001
         "A return type is required in an operator symbol renaming declaration"
|   red_renaming_declaration5 _ _ _ _ _ _ =
        stack_error "red_renaming_declaration5";

fun ⦏red_renaming_declaration6⦎ (Parsed (PPSubprogramSpec (SSFunction
	{designator=id,formal_part=f, return=tm, spec=Nil, ...})))
    _ (Parsed (PPId opsym2)) _ = (
        PPDeclarations[DRenamingDeclaration(RDOpsym
        {new_name=Value id,formal_part=f,tmark=tm,
           name1=Nil, name2=opsym2})])
|   red_renaming_declaration6 (Parsed (PPSubprogramSpec (SSFunction _))) _ _ _  =
	parse_error 503001
         "A specification statement is not allowed in a renaming declaration"
|   red_renaming_declaration6 (Parsed (PPSubprogramSpec (SSProcedure _))) _ _ _  =
	parse_error 503001
         "A return type is required in an operator symbol renaming declaration"
|   red_renaming_declaration6 _ _ _ _  =
        stack_error "red_renaming_declaration6";

=TEX

=SML
fun ⦏red_compilation1⦎ (Parsed (PPKSlot k)) = (
    PPKSlotCUList [KCUKSlot k])
|   red_compilation1 _ =
        stack_error "red_compilation1";

fun ⦏red_compilation2⦎ (Parsed (PPContextCompilationUnit ccu)) =
    PPKSlotCUList [KCUUnit ccu]
|   red_compilation2 (Parsed (PPPragma p)) =
    PPKSlotCUList [KCUPragma p]
|   red_compilation2 _ =
        stack_error "red_compilation2";

fun ⦏red_compilation3⦎ (Parsed (PPContextCompilationUnit ccu))
    (Parsed (PPKSlotCUList cl)) = (
    PPKSlotCUList ((KCUUnit ccu)::cl))
|   red_compilation3 (Parsed (PPPragma p))
    (Parsed (PPKSlotCUList cl)) = (
    PPKSlotCUList ((KCUPragma p)::cl))
|   red_compilation3 _ _ =
        stack_error "red_compilation3";

=TEX

=SML
fun ⦏red_compilation_unit1⦎
    (Parsed (PPContextClause (cis, rids, ann)))
    (Parsed (PPCompilationUnit cu)) = (
    PPContextCompilationUnit
	{context=cis, references=rids, comp_unit=cu, annotation=ann}
) | red_compilation_unit1 _ _ =
        stack_error "red_compilation_unit1";

val ⦏red_compilation_unit2⦎ = red_compilation_unit1;
val ⦏red_compilation_unit3⦎ = red_accept;
=TEX

=SML
fun ⦏red_library_unit1⦎ (Parsed(PPDeclarations [DPackageDeclaration p])) = (
    PPCompilationUnit (CUPackageDeclaration {private = false, pack_decl = p}))
|   red_library_unit1 _ =
        stack_error "red_library_unit1";

fun ⦏red_library_unit2⦎ _ (Parsed(PPDeclarations [DPackageDeclaration p])) = (
    PPCompilationUnit (CUPackageDeclaration {private = true, pack_decl = p}))
|   red_library_unit2 _ _ =
        stack_error "red_library_unit2";

fun ⦏red_library_unit3⦎ (Parsed(PPProperBody p)) = (
    PPCompilationUnit (CUProperBody p))
|   red_library_unit3 _ =
        stack_error "red_library_unit3";

=TEX

SPARK manual 10.1:
=SML
val ⦏red_secondary_unit1⦎ = red_accept;
val ⦏red_secondary_unit2⦎ = red_accept;

fun ⦏red_library_unit_body⦎ (Parsed(PPProperBody p)) = (
    PPCompilationUnit(CUProperBody p))
|   red_library_unit_body _ =
        stack_error "red_library_unit_body";

val ⦏red_main_program⦎ = red_accept;
=TEX

SPARK manual 10.1.1:
=SML
val ⦏red_context_clause1⦎ = PPContextClause ([], [], []);

fun ⦏red_context_clause2⦎ (Parsed(PPContextItem ci))
		(Parsed(PPPragmaList ps))
		(Parsed (PPContextClause (cis, refls, ann))) =
		PPContextClause (ci :: (map CIPragma ps) @ cis, refls, ann)
|   red_context_clause2 _ _ _ = stack_error "red_context_clause2";

fun ⦏red_context_clause3⦎ (Parsed(PPExpandedNames refs))
		(Parsed (PPContextClause (idps, refs1, ann))) =
		PPContextClause (idps, refs @ refs1, ann)
|   red_context_clause3 _ _ = stack_error "red_context_clause3";

fun ⦏red_context_clause4⦎ (Token ((LCAnnotation,CNText ann), _))
	(Parsed (PPAnnotation anns)) =
		PPContextClause ([], [], ANString ann::anns)
|   red_context_clause4 _ _ = stack_error "red_context_clause3";

fun ⦏red_context_clause5⦎ (Parsed (PPAnnotation ann)) = PPContextClause ([], [], ann)
|   red_context_clause5 _ = stack_error "red_context_clause5";;
=TEX
=SML
fun ⦏red_with_or_use_clause1⦎ (Parsed (PPExpandedNames ens)) = (
	PPContextItem (CIWith ens)
) | red_with_or_use_clause1 _ = stack_error "red_with_or_use_clause1";
fun ⦏red_with_or_use_clause2⦎ (Parsed (PPUseClause uc)) = (
	PPContextItem (CIUse uc)
) | red_with_or_use_clause2 _ = stack_error "red_with_or_use_clause1";

=TEX
=SML
val ⦏red_pragma_list1⦎ = PPPragmaList [];

fun ⦏red_pragma_list2⦎ (Parsed (PPPragma p)) (Parsed(PPPragmaList ps)) =
	PPPragmaList (p :: ps)
|   red_pragma_list2 _ _ = stack_error "red_pragma_list2";

fun ⦏red_pragma1⦎ _ (Token ((_,CNText id), _)) _ = (
	PPPragma {id = id, args = []}
) | red_pragma1 _ _ _ = stack_error "red_pragma1";

fun ⦏red_pragma2⦎ _ (Token ((_,CNText id), _)) _ (Parsed(PPPragmaArgs args)) _ _ = (
	PPPragma {id = id, args = args}
) | red_pragma2 _ _ _ _ _ _ = stack_error "red_pragma2";

val ⦏red_arg_ass_list1⦎ = red_accept;

fun ⦏red_arg_ass_list2⦎ (Parsed(PPPragmaArgs [arg])) _ (Parsed(PPPragmaArgs args)) = (
	PPPragmaArgs (arg::args)
) | red_arg_ass_list2 _ _ _ = stack_error "red_arg_ass_list2";

fun ⦏red_argument_association1⦎ (Parsed(PPAggregateChoices (acl, true)))
      _ _ = (
    parse_error 503001 "OTHERS cannot be used in a pragma argument list"
) | red_argument_association1 (Parsed(PPAggregateChoices (_::_::_, _)))
      _ _ = (
    parse_error 503001 "`|' cannot be used in a pragma argument list"
) | red_argument_association1 (Parsed(PPAggregateChoices ([ac], _)))
      _ (Parsed (PPExp e)) = (
    PPPragmaArgs [(Value ac, e)]
) | red_argument_association1 _ _ _ = stack_error "red_argument_association1";

fun ⦏red_argument_association2⦎ (Parsed(PPExp e)) = (
    PPPragmaArgs [(Nil, e)]
) | red_argument_association2 _ = stack_error "red_argument_association2";

=TEX
=SML
fun ⦏red_with_clause⦎ _ (Parsed pens) _ = pens
|   red_with_clause _ _ _ = stack_error "red_with_clause";
=TEX
=SML
val ⦏red_references_clause⦎ = red_with_clause;
=TEX
=SML
fun ⦏red_expanded_name_list1⦎ (Parsed (PPIds en)) = (
	PPExpandedNames [en]
) | red_expanded_name_list1 _ = stack_error "red_expanded_name_list1";

fun ⦏red_expanded_name_list2⦎ (Parsed (PPIds en)) _ (Parsed(PPExpandedNames ens)) = (
	PPExpandedNames (en::ens)
) | red_expanded_name_list2 _ _ _ = stack_error "red_expanded_name_list2";

=TEX
SPARK manual 10.2:
=SML
fun ⦏red_body_stub1⦎ (Parsed (PPProcedureSpecification ps)) _ _ _ = (
    PPDeclarations [DProcedureStub ps])
|   red_body_stub1 _ _ _ _ = stack_error "red_body_stub1";

fun ⦏red_body_stub2⦎ (Parsed (PPFunctionSpecification fs)) _ _ _ = (
    PPDeclarations [DFunctionStub fs])
|   red_body_stub2 _ _ _ _ =
        stack_error "red_body_stub2";

fun ⦏red_body_stub3⦎ _ _ (Parsed (PPIds en))
	(Parsed (PPAnnotation ann)) _ _ _ = (
	case ann of
	[] =>	PPDeclarations [DPackageStub en]
	| _ => parse_error 503001"annotations are not allowed in a package stub"
) | red_body_stub3 _ _ _ _ _ _ _ =
        stack_error "red_body_stub3";

fun ⦏red_body_stub4⦎ (Parsed (PPProcedureSpecification ps)) _ = (
    PPDeclarations [DExternalProcedureStub {implicit = false, spec = ps}])
|   red_body_stub4 _ _ = stack_error "red_body_stub4";

fun ⦏red_body_stub5⦎ (Parsed (PPFunctionSpecification fs)) _ = (
    PPDeclarations [DExternalFunctionStub {implicit = false, spec = fs}])
|   red_body_stub5 _ _ = stack_error "red_body_stub5";

fun ⦏red_body_stub6⦎ _ (Parsed (PPProcedureSpecification ps)) _ = (
    PPDeclarations [DExternalProcedureStub {implicit = true, spec = ps}])
|   red_body_stub6 _ _ _ = stack_error "red_body_stub6";

fun ⦏red_body_stub7⦎ _ (Parsed (PPFunctionSpecification fs)) _ = (
    PPDeclarations [DExternalFunctionStub {implicit = true, spec = fs}])
|   red_body_stub7 _ _ _ = stack_error "red_body_stub7";

fun ⦏red_subunit⦎ _ _ (Parsed(PPExp n)) _ (Parsed (PPProperBody p)) = (
    PPCompilationUnit(CUSubUnit{name = mk_expanded_name n, proper_body=p}))
|   red_subunit _ _ _ _ _ =
        stack_error "red_subunit";
=TEX

=SML
val ⦏red_representation_clause1⦎ = red_accept;

val ⦏red_representation_clause2⦎ = red_accept;

val ⦏red_type_representation_clause1⦎ = red_accept;
val ⦏red_type_representation_clause2⦎ = red_accept;
val ⦏red_type_representation_clause3⦎ = red_accept;

fun ⦏red_length_clause⦎ _ (Parsed(PPExp a)) _ (Parsed(PPExp e)) _ = (
    PPRepresentationClause(RCLength{attribute=a, exp=mk_exp_of_exp e}))
|   red_length_clause _ _ _ _ _ =
        stack_error "red_length_clause";
=TEX

SPARK manual 13.3:
=SML
fun ⦏red_enumeration_representation_clause⦎ _ (Token ((_,CNText id), _)) _
    (Parsed(PPExp e)) _ = (
    PPRepresentationClause(RCEnumeration{name=id, exp=mk_exp_of_exp e}))
|   red_enumeration_representation_clause _ _ _ _ _ =
        stack_error "red_enumeration_representation_clause";
=TEX

SPARK manual 13.4:
=SML
fun ⦏red_record_representation_clause⦎ _ (Token ((_,CNText id), _)) _ _
    (Parsed(PPExps [e])) (Parsed(PPComponentClauses c)) _ _ _ = (
    PPRepresentationClause(RCRecord{name=id, alignment_opt=Value (mk_exp_of_exp e),
    component_pack=c}))
|   red_record_representation_clause _ (Token ((_,CNText id), _)) _ _
    (Parsed(PPExps [])) (Parsed(PPComponentClauses c)) _ _ _ = (
    PPRepresentationClause(RCRecord{name=id,alignment_opt=Nil,
    component_pack=c}))
|   red_record_representation_clause _ _ _ _ _ _ _ _ _ =
        stack_error "red_record_representation_clause";
=TEX

SPARK manual 13.4:
=SML
val ⦏red_alignment_opt1⦎ = PPExps [];
fun ⦏red_alignment_opt2⦎ _ _ (Parsed(PPExp e)) _ = (
    PPExps [mk_exp_of_exp e])
|   red_alignment_opt2 _ _ _ _ =
        stack_error "red_alignment_opt2";

val ⦏red_component_pack1⦎ = red_accept;

fun ⦏red_component_pack2⦎ (Parsed(PPComponentClauses [c]))
    (Parsed(PPComponentClauses cs)) = (
    PPComponentClauses (c::cs))
|   red_component_pack2 _ _ =
        stack_error "red_component_pack2";
=TEX

SPARK manual 13.4:
=SML
fun ⦏red_component_clause⦎ (Parsed(PPExp n)) _ (Parsed(PPExp e)) _
    (Parsed(PPExp sr)) _ = (
    PPComponentClauses[{name=mk_type_mark n, exp=mk_exp_of_exp e,
        range=exp_to_range sr}])
|   red_component_clause _ _ _ _ _ _ =
        stack_error "red_component_clause";
=TEX

SPARK manual 13.5:
=SML
fun ⦏red_address_clause⦎ _ (Token ((_,CNText id), _)) _ _
    (Parsed (PPExp exp)) _ = (
    PPRepresentationClause(RCAddress {name=id, exp=mk_exp_of_exp exp}))
|   red_address_clause _ _ _ _ _ _ =
        stack_error "red_address_clause";
=TEX

=SML
end (* of structure CNParser stage 2 *);
=TEX

\section{PARSER}\label{PARSER}
=SML
structure ⦏CNParser⦎ : CNParser (* final stage *) = struct
=TEX

=SML
=TEX

We can now load the code generated by SLRP from the grammar
of 'cite{ISS/HAT/DAZ/DTD503}'.
=SML
    open CNParser ;
=TEX

=INCLUDE
dtd503.grm.sml
=TEX

\subsection{Conversion of Names to Type Marks}
The implementation of this function is at the beginning of section \ref{REDUCTIONFUNCTIONS}.
=SML
type ⦏CN_PARSER_STATE⦎ = CN_PARSER_STATE;
val ⦏get_cn_parser_state⦎ = get_cn_parser_state;
val ⦏set_cn_parser_state⦎ = set_cn_parser_state;
val ⦏reset_cn_parser_state⦎ = reset_cn_parser_state;
=TEX

\subsection{The Parser Function Proper}

=SML
fun ⦏cn_reader⦎ (ip : CN_LEX_ITEM list) : CN_LEX_ITEM * (CN_LEX_ITEM list) = (
    case ip
    of (h :: more) => (cur_tok := !cur_tok + 1; (h, more))
    |  [] => ((LCEos, CNEos), [])
    );
=TEX

=SML
val ⦏label_descs⦎ : (CN_LEX_CLASS * string) list = [
	(LCCompLabel, "the label of a compilation unit k-slot"),
	(LCPPartLabel, "the label of a private part declaration k-slot"),
	(LCVPartLabel, "the label of a visible part declaration k-slot"),
	(LCDecLabel, "the label of a declaration k-slot"),
	(LCStmtLabel, "the label of a statement k-slot"),
	(LCSpecLabel, "the label of a specification statement"),
	(LCAnnotationLabel, "the label of an annotation k-slot")
];
=TEX

=SML
val ⦏cn_error⦎ : (CN_LEX_ITEM, 'b, 'c, 'd) ERROR_ROUTINE =
    (fn (tok, stk, _, _) => (
	parse_error_hdr();
	diag_string (get_error_message 503004
		[format_lex_item tok, format_stack format_lex_item stk]);
	(case tok of
		(LCUndeclaredLabel, _) => (
			diag_string (get_error_message 503002 [format_lex_item tok])
	) |	_ => ());
	(case stk of
		[Token (li as (lc, _), _)] => (
			if	any label_descs (fn (lc', _) => lc' = lc)
			then	diag_string (get_error_message 503003
					[format_lex_item li, lassoc3 label_descs lc])
			else	()
	) |	_ => ());
	raise SYNTAX_ERROR
));
=TEX

The following is adapted from the HOL parser in \cite{DS/FMU/IED/IMP019} q.v.
for explanation.
=SML
fun ⦏cn_parser⦎ (ip : CN_LEX_ITEM list) : WEB_CLAUSE  = (
    let val se1 = (input_toks := ip; cur_tok := ~1);
        val save_cn_parser_state = get_cn_parser_state();
        val res = (((slrp'gen_parser
                default_resolver
                fst
                cn_error
                cn_reader) ip
            handle ex => (
                set_cn_parser_state save_cn_parser_state;
                raise ex
            ))		handle	SYNTAX_ERROR =>
				fail "cn_parser" 503204 []
			|	PARSER_ERROR msg =>
					error "cn_parser" 503205 [fn()=>msg]
	);
        val se2 = (input_toks := []);
    in    case res
    of PPWebClause wc => wc
        |_ => stack_error "cn_parser - weird result from parser"
    end
    );
=TEX

\section{EPILOGUE}
=SML
end (* of structure CNParser final stage *);
=TEX

\small
\twocolumn[\section{INDEX}]
\printindex
\end{document}
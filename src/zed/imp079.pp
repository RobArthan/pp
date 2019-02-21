=IGN
********************************************************************************
imp079.doc: this file is part of the PPZed system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% imp079.doc   ℤ $Date: 2011/07/11 11:44:45 $ $Revision: 1.42 $ $RCSfile: imp079.doc,v $
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

\def\Title{Implementation for Z User Interface Support}

\def\AbstractText{This document contains the implementation for the Z User Interface Support module.}

\def\Reference{DS/FMU/IED/IMP079}

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
%% LaTeX2e port: \TPPtitle{Implementation for Z User Interface Support}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP079}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.42 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2011/07/11 11:44:45 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{R.D.~Arthan & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.B.~Jones & HAT Manager}
%% LaTeX2e port: \TPPabstract{
%% LaTeX2e port: This document contains the implementation for the
%% LaTeX2e port: Z User Interface Support module.}
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
\subsection{Contents list}
\tableofcontents
\subsection{Document cross references}
\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes history}  % to get section number `0.3'
\begin{description}
\item [Issue 1.3 (1992/06/18)~(\FormatDate{92/06/18
})]
First draft.
\item [Issue 1.4 (1992/07/10)~(\FormatDate{92/07/10
})]
Improved pretty-printing.
\item [Issue 1.5 (1992/07/13)]
Fixed problem arising from changes at issue 1.4.
Fixed a bug in $format\_z\_tm$.
Amended  $format\_z\_tm$ so that schema projection, composition and hiding
operators are printed with the appropriate subscript-s.
Added $format\_z\_type$ and $z\_type\_of$ to the signature.
$ZTypesAndTerms$ is now open in the structure.
\item [Issue 1.14 (1992/08/13) (13th August 1992)]
Corrected error handling for interrupts.
\item [Issue 1.15 (1992/10/28) (27th October 1992)]
Changes to treatment of term quotations.
\item[Issue 1.16 (1992/12/10)  (10th December 1992)]
Global rename from wrk038.doc issue 1.9.
\item[Issue 1.17 (1993/02/17)  (16th February 1993)]
Added comments concerning stopping printing ``Totality'' in $format\_z\_tm$.
\item[Issue 1.18 (1999/02/16)]
Removed dependency on PolyML.makestring.
\item[Issue 1.19 (1999/03/07)] Update for new INTEGER type.
\item[Issue 1.20 (2002/01/23)] Support for left associative operators.
\item[Issue 1.21 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.22 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.23 (2004/01/19)] The Z universal set is now called 𝕌.
\item[Issue 1.24 (2005/09/09)] Support for new forms of stubs in templates.
\item[Issue 1.25 (2005/09/11)] Allowed for new scheme for type names (and general tidy-up) in {\em format\_z\_type}.
\item[Issue 1.14 (1992/08/13)] Option to require distinguishing subscripts on all schema operations.
\item[Issue 1.15 (1992/10/28)] Private names are now prefixed with $pp'$ rather than $icl'$.
\item[Issue 1.16 (1992/12/10)] {\em string\_of\_template} now allows for the new \verb!$"..."! syntax.
\item[Issue 1.17 (1993/02/17)] Allowed for correction to syntax of let-expressions.
\item[Issue 1.18 (1999/02/16)] Support for decorated fancyfix identifiers.
\item[Issue 1.19 (1999/03/07)] Tidy-up of {\em format\_pred}.
\item[Issue 1.33 (2006/04/20),1.34 (2006/04/20)] Added support for floating point literals.
\item[Issue 1.35 (2006/06/12)] Fixed {\em string\_of\_float}.
\item[Issue 1.36 (2006/06/16)] Made it work with SML/NJ.
\item[Issue 1.37 (2006/12/02)] {\em string\_of\_float} renamed as {\em z\_string\_of\_float}.
\item[Issue 1.38 (2007/08/04)] Tidied error handling in {\em template\_of\_string}.
\item[Issue 1.39 (2010/04/01)] Support for empty schemas.
\item[Issue 1.40 (2011/07/10)] {\em PRED} component of {\em PredLambda} no longer optional.
\item[Issue 1.41 (2011/07/11)] Added constructor for the parser to flag predicate contexts to the type-checker.
\item[Issue 1.42 (2011/07/11)] Support for empty schemas in paragraphs.
\item[Issue 1.43 (2011/08/04)] Fixed bug with decorations in forming characteristic tuples.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported PPZed to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes forecast}
\pagebreak
\section{GENERAL}
\subsection{Scope}
This document contains the implementation for the User Interface Support module for HOL/Z.
The detailed design for this material is given in \cite{DS/FMU/IED/DTD079}.
\subsection{Introduction}
\subsection{Dependencies}

\section{PREAMBLE}
=SML
structure ZUserInterfaceSupport : ZUserInterfaceSupport = struct
open Unification ZTypesAndTerms;
=TEX
\section{MISCELLANEA}
=SML
fun ⦏words⦎ (s : string) : string list = (
	let	fun state1 acc (ch :: chs) = (
			if ch = " " orelse ch = "\t" orelse ch = "\n"
			then state1 acc chs
			else state2 (ch :: acc) chs
		) | state1 acc [] = acc
		and state2 (acc as (h :: t)) (ch :: chs) = (
			if ch = " " orelse ch = "\t" orelse ch = "\n"
			then state1 acc chs
			else state2 ((h ^ ch) :: t) chs
		) | state2 [] chs = (state2 [""] chs
		) | state2 acc [] = acc;
	in	rev(state1 [] (explode s))
	end
);
=TEX
\section{TYPES}\label{TYPES}
In this section we give the Standard ML types provided by this module.

We require data types to be used in \cite{DS/FMU/IED/IMP061}
to represent the result of a context-free parse
using the grammar of \cite{DS/FMU/IED/DTD061}. The result is used to
generate a value of type $Z\_TM$ as required by the type inferrer.

The following types are used for identifiers and decoration:
=SML
type ⦏ID⦎		= string;
type ⦏DECOR⦎		= string;
=TEX
We represent precedences using
the integers:
=SML
type ⦏PREC⦎		= int;
datatype ⦏ASSOC⦎ = ⦏LeftAssoc⦎ | ⦏RightAssoc⦎;
datatype ⦏CLASS⦎	=	⦏ZClFun⦎ of int * ASSOC
			|	⦏ZClRel⦎
			|	⦏ZClGen⦎ of int * ASSOC;
=TEX
=SML
datatype ⦏FANCYFIX⦎	=	⦏ZFFBeginOp⦎
			|	⦏ZFFEndOp⦎
			|	⦏ZFFInOp⦎
			|	⦏ZFFPostBeginOp⦎
			|	⦏ZFFThenOp⦎
			|	⦏ZFFPostOp⦎
			|	⦏ZFFPreEndOp⦎
			|	⦏ZFFPreOp⦎;
=TEX
=SML
type ⦏ZFIXITY⦎ 	= FANCYFIX * CLASS;
=TEX
=TEX
The following types are used for the templates which
record information about fancy-fix operators:
=SML
datatype ⦏STUB⦎		= 	⦏StubUS⦎		(* _ *)
			|	⦏StubEll⦎		(* ... *)
			|	⦏StubUSQ⦎		(* _? *)
			|	⦏StubUSE⦎		(* _! *);

type ⦏CORE⦎		=	ID * ((STUB * ID) list * (STUB * ID)) OPT;

datatype ⦏TEMPLATE⦎	=	⦏TmplNon⦎ of	CORE
					(* id, {stub, id} *)
			|	⦏TmplIn⦎ of	(STUB * CORE * STUB)
					(* stub, id, {stub, id}, stub *)	
			|	⦏TmplPre⦎ of	(CORE * STUB)
					(* id, {stub, id}, stub *)
			|	⦏TmplPost⦎ of	(STUB * CORE)
					(* {stub, id}, stub, id *);
=TEX
Logical and schema operators are represented using the following
data types:
=SML
datatype ⦏Z_LOG_IN_OP⦎	= ZLogInOp∧ of bool
			| ZLogInOp∨ of bool
			| ZLogInOp⇒ of bool
			| ZLogInOp⇔ of bool
			| ZLogInOpSemi;


datatype ⦏SCH_IN_OP⦎	= ⦏Pipe⦎ | ⦏Filter⦎ | ⦏Comp⦎;

datatype ⦏SCH_PRE_OP⦎	= ⦏Pre⦎ | ⦏Delta⦎ | ⦏Xi⦎;

datatype ⦏Z_QUANT⦎	= ZQuant∀ of bool
			| ZQuant∃ of bool
			| ZQuant∃⋎1 of bool;
=TEX
Most of the complexity of the parsing process arises in the treatment of
predicates, schemas and expressions. These are all mapped onto the
data type $PRED$. The type contains a constructor corresponding to
each of the alternatives for $Pred$, $Pred1$, $Pred2$, $Pred3$,
$Schema2$, $Schema3$, $Schema4$, $Expr0$, $Expr1$, $Expr2$, $Expr3$
and $Expr4$, with the exceptions that (i) no constructor is required
for alternatives comprising a single non-terminal, and (ii) in most cases
where one alternative may be obtained from another by omitting part of it,
the data type has a single constructor with optional components in its
operand type.

=SML
datatype ⦏PRED⦎	= ⦏PredQuantifier⦎ of Z_QUANT * SCH_TEXT * PRED
			| ⦏PredLet⦎ of EQ_DEF list * PRED
			| ⦏PredLogInOp⦎ of PRED * Z_LOG_IN_OP * PRED
			| ⦏PredNot⦎ of bool * PRED
			| ⦏PredSchInOp⦎ of PRED * SCH_IN_OP * PRED
			| ⦏PredSchPreOp⦎ of SCH_PRE_OP * PRED
			| ⦏PredSchemaHiding⦎ of PRED * (PRED list)
			| ⦏PredMu⦎ of SCH_TEXT * (PRED OPT)
			| ⦏PredLambda⦎ of SCH_TEXT * PRED
			| ⦏PredFancyFix⦎ of TEMPLATE * DECOR * ((PRED list) list)
			| ⦏PredCrossProduct⦎ of PRED list
			| ⦏PredPow⦎ of PRED
			| ⦏PredApplication⦎ of PRED * PRED
			| ⦏PredTheta⦎ of PRED
			| ⦏PredSelection⦎ of PRED * PRED
			| ⦏PredIdDec⦎ of ID * DECOR
			| ⦏PredQuotation⦎ of TERM
			| ⦏PredPlaceHolder⦎ of STUB
			| ⦏PredNumber⦎ of INTEGER
			| ⦏PredString⦎ of string
			| ⦏PredFloat⦎ of INTEGER * INTEGER * INTEGER
			| ⦏PredTuple⦎ of PRED list
			| ⦏PredBinding⦎ of EQ_DEF list
			| ⦏PredSetDisplay⦎ of PRED list
			| ⦏PredSeqDisplay⦎ of PRED list
			| ⦏PredSetComp⦎ of SCH_TEXT * (PRED OPT)
			| ⦏PredHorizSchema⦎ of SCH_TEXT
			| ⦏PredGenInst⦎ of PRED list
			| ⦏PredRenameList⦎ of (PRED * PRED) list
			| ⦏PredBracketed⦎ of PRED * DECOR
=TEX
The above definition uses the following type abbreviations which correspond
to the non-terminals $Decl$ and $EqDef$ in the grammar. Note that
a declaration is much simpler here than in the grammar (which is
complicated by a need to single out declarations consisting of a single
schema expression as a special case).
=SML
withtype ⦏DECL⦎	= (PRED list * PRED) list
and ⦏SCH_TEXT⦎	= (PRED list * PRED) list * (PRED OPT) (* = DECL * (PRED OPT) *)
and ⦏EQ_DEF⦎		= PRED * PRED;
=TEX
The following type abbreviations and data types correspond to the
various sorts of paragraph:
=SML
type ⦏FIXITY⦎		= CLASS * (TEMPLATE list);

type ⦏GENERAL_TERM⦎	= PRED * (PRED OPT);

datatype ⦏ABB_DEF⦎	= ⦏ADEqDef⦎ of EQ_DEF
			| ⦏ADSchemaBox⦎ of PRED * SCH_TEXT;

type ⦏FREE_TYPE_DEF⦎	= (PRED * (PRED list)) list;

type ⦏AX_DES⦎		= (PRED list) * SCH_TEXT;

type ⦏CONJECTURE⦎		= (ID OPT) * PRED;
=TEX
The overall result of a context-free parse of a single Z paragraph
is then represented by the following data type:
=SML
datatype ⦏PARAGRAPH⦎	= ⦏ParFixity⦎ of FIXITY
			| ⦏ParGeneralTerm⦎ of GENERAL_TERM
			| ⦏ParAbbDef⦎ of ABB_DEF
			| ⦏ParFreeTypeDef⦎ of FREE_TYPE_DEF
			| ⦏ParAxDes⦎ of AX_DES
			| ⦏ParConjecture⦎ of CONJECTURE;
=TEX
The result of the parser of \cite{DS/FMU/IED/DTD062}
for use by the paragraph processor and \cite{DS/FMU/IED/DTD062}
the type inferrer \cite{DS/FMU/IED/DTD062}
are given using the following datatypes:
=TEX
The following types are the ones used to communicate with
the type inferrer as required by \cite{DS/FMU/IED/DTD061}.
=SML
type ⦏IDENT⦎	=	TEMPLATE * DECOR;
=TEX
=SML
datatype ⦏Z_TM⦎	=	ZTm⟨⟩ of EXTYPE OPT * Z_TM list
		|	ZTmSetd of EXTYPE OPT * Z_TM list
		|	ZTmSeta1 of Z_SCH_TEXT
		|	ZTmSeta2 of Z_SCH_TEXT * Z_TM
		|	ZTmℙ of Z_TM
		|	ZTmTuple of Z_TM list
		|	ZTmBinding of Z_EQ_DEF list
		|	ZTm× of Z_TM list
		|	ZTmθ of Z_TM * DECOR
		|	ZTmSel⋎B of Z_TM * IDENT
		|	ZTmSel⋎T of Z_TM * int
		|	ZTmApp of Z_TM * Z_TM
		|	ZTmFancyApp of IDENT * Z_TM
		|	ZTmλ of Z_SCH_TEXT * Z_TM
		|	ZTmμ1 of Z_SCH_TEXT
		|	ZTmμ2 of Z_SCH_TEXT * Z_TM
		|	ZTmPredContext of Z_TM
		|	ZTmTruth of bool
		|	ZTm¬⋎F of Z_TM
		|	ZTmLogInOp⋎F of Z_LOG_IN_OP * Z_TM * Z_TM
		|	ZTmSchemaPred of Z_TM
		|	ZTmQuant⋎F of Z_QUANT * Z_SCH_TEXT * Z_TM
		|	ZTmHorizSchema of Z_SCH_TEXT
		|	ZTmDecor of Z_TM * DECOR * Unification.EXTYPE OPT
		|	ZTmPre of Z_TM
		|	ZTm¬⋎S of Z_TM
		|	ZTmLogInOp⋎S of Z_LOG_IN_OP * Z_TM * Z_TM
		|	ZTm↾ of Z_TM * Z_TM
		|	ZTmHide of Z_TM * IDENT list
		|	ZTmQuant⋎S of Z_QUANT * Z_SCH_TEXT * Z_TM
		|	ZTmΔ of Z_TM
		|	ZTmΞ of Z_TM
		|	ZTmEq of Z_TM * Z_TM
		|	ZTm∈ of Z_TM * Z_TM
		|	ZTm⨾ of Z_TM * Z_TM
		|	ZTmPipe of Z_TM * Z_TM
		|	ZTmℤ of INTEGER
		|	ZTmString of string
		|	ZTmFloat of INTEGER * INTEGER * INTEGER
		|	ZTmLVar of IDENT * EXTYPE OPT * Z_TM list
		|	ZTmGVar of IDENT * EXTYPE OPT * Z_TM list
		|	ZTmLet of Z_EQ_DEF list * Z_TM
		|	ZTmRename of Z_TM * ((IDENT * IDENT) list)
		|	ZTmBracketed of Z_TM
		|	ZTmQuotation of TERM * EXTYPE OPT
=TEX
=SML
and ⦏Z_DEC⦎	=	ZDDec of IDENT list * Z_TM * EXTYPE OPT
		|	ZDSchemaDec of Z_TM * EXTYPE OPT
=TEX
=SML
withtype ⦏Z_SCH_TEXT⦎ =	Z_DEC list * Z_TM OPT * EXTYPE OPT
and	⦏Z_EQ_DEF⦎ =	IDENT * Z_TM;

=SML
datatype ⦏Z_PARA⦎ =	ZParaFixity of FIXITY
|	ZParaAbbDef of IDENT * IDENT list * Z_TM * EXTYPE OPT
|	ZParaSchBox of IDENT * IDENT list * Z_SCH_TEXT * EXTYPE OPT
|	ZParaAxDes of IDENT list * Z_SCH_TEXT * (((IDENT * EXTYPE) list) OPT)
|	ZParaFreeType of (IDENT * (IDENT * EXTYPE OPT * Z_TM OPT) list) list
|	ZParaGivenSet of IDENT list * ((IDENT list * Z_TM) OPT)
|	ZParaConstraint of IDENT list * Z_TM
|	ZParaConjecture of IDENT OPT * IDENT list * Z_TM
|	ZParaTerm of IDENT list * Z_TM * EXTYPE OPT;
=TEX
\section{TEMPLATE FUNCTIONS}\label{TEMPLATEFUNCTIONS}
We need various functions for operating on templates.
These are collected together in this section.

=TEX
We maintain a dictionary mapping names onto templates and
the $ZFIXITY$s.
=TEX
Given a template the following function returns its first identifier component.
=SML
fun ⦏first_tmpl_id⦎  (tmpl : TEMPLATE) : ID = (
	case tmpl of
		TmplNon(id, _) => id
	|	TmplIn (_, (id, _), _) => id
	|	TmplPre((id,_), _) => id
	|	TmplPost(_, (id, _)) => id
);
=TEX
=SML
fun ⦏last_tmpl_id⦎  (tmpl : TEMPLATE) : ID = (
	case tmpl of
		TmplNon(id, Nil) => id
	|	TmplNon(_, Value(_, (_, id))) => id
	|	TmplIn (_, (id, Nil), _) => id
	|	TmplIn (_, (_, Value(_, (_, id))), _) => id
	|	TmplPre((id, Nil), _) => id
	|	TmplPre((_, Value(_, (_, id))), _) => id
	|	TmplPost(_, (id, Nil)) => id
	|	TmplPost(_, (_, Value(_, (_, id)))) => id
);
=TEX
Given a template the following function returns
the corresponding list of name-$ZFIXITY$ pairs. The list is in
the same order as the ids in the template,
so allowing its use in the $check\_template$ function in
phase~2 of~\cite{DS/FMU/IED/IMP061}
and in the Z~pretty printer~\cite{DS/FMU/IED/DTD064}.
=SML
fun ⦏tmpl_ids⦎ (tmpl : TEMPLATE) (cl : CLASS): (ID * ZFIXITY) list = (
	let	val aux = map (fn (_, id) => (id, (ZFFThenOp, cl)));
	in	case tmpl of
			TmplNon (id, Nil) => (
			[]
		) |	TmplNon (id1, Value (stids, (_, id2))) =>(
			(id1, (ZFFBeginOp, cl)) :: (aux stids) @ [(id2, (ZFFEndOp, cl))]
		) |	TmplIn (_, (id, Nil), _) => (
			[(id, (ZFFInOp, cl))]
		) |	TmplIn (_, (id1, Value (stids, (_, id2))), _) => (
			(id1, (ZFFPostBeginOp, cl)) :: (aux stids) @ [(id2, (ZFFPreEndOp, cl))]
		) |	TmplPre ((id, Nil), _) => (
			[(id, (ZFFPreOp, cl))]
		) |	TmplPre ((id1, Value (stids, (_, id2))), _) => (
			(id1, (ZFFBeginOp, cl)) :: (aux stids) @ [(id2, (ZFFPreEndOp, cl))]
		) |	TmplPost (_, (id, Nil)) =>(
			[(id, (ZFFPostOp, cl))]
		) |	TmplPost (_, (id1, Value (stids, (_, id2)))) => (
			(id1, (ZFFPostBeginOp, cl)) :: (aux stids) @ [(id2, (ZFFEndOp, cl))]
		)
	end
);
=TEX
Given a template the following function returns
the corresponding list of stubs. The list is in the
order of appearance in the template.
=SML
fun ⦏tmpl_stubs⦎ (tmpl : TEMPLATE) : STUB list = (
	let	fun aux(_, Nil) = []
		|   aux(_, (Value (stids, (stn, _)))) = (map fst stids) @ [stn];
	in	case tmpl of
			TmplNon c => (aux c
		) |	TmplIn (st1, c, st2) => (st1 :: aux c @  [st2]
		) |	TmplPre (c, st) => (aux c @ [st]
		) |	TmplPost (st, c) => (st :: aux c
		)
	end
);
=TEX
\section{FORMATTING FUNCTIONS}\label{FORMATTINGFUNCTIONS}
If errors are detected during the transformation to $ZTM$, then values
of type $PARAGRAPH$ etc. have to be printed in the diagnostic report.
The following functions are used to do this:
=TEX
=SML
fun ⦏format_stub⦎ StubUS = "_"
|    format_stub StubEll = "..."
|    format_stub StubUSQ = "_?"
|    format_stub StubUSE = "_!";
=TEX
=SML
fun ⦏format_core⦎ ( (first, Value (middle, last)) : CORE ) : string = (
	let	fun format_stub_id (stub, id) = (
			format_stub stub ^ " " ^ id
		);
	in		first
		^	" "
		^	(
			case middle of
				[] => ""
			|	_ => (format_list format_stub_id middle " ") ^ " "
		) ^	format_stub_id last
	end
) | format_core ( (first, Nil) ) = (
	first
);
=TEX
\ShowBoxes
\let\crossbar=\BigTurnstile
=SML
fun ⦏string_of_ident⦎ ((TmplNon core, d) : IDENT) : string =
	format_core core ^ d
|   string_of_ident (TmplIn (st1, core, st2), d) =
	format_stub st1 ^ " " ^ format_core core ^ d ^ " " ^ format_stub st2
|   string_of_ident (TmplPre (core, st), d) =
	format_core core ^ d ^ " " ^ format_stub st
|   string_of_ident (TmplPost (st, core), d) =
	format_stub st ^ " " ^ format_core core ^ d;
=TEX
=SML
fun ⦏format_template⦎ (tmpl : TEMPLATE) = (
	string_of_ident(tmpl, "")
);
=TEX
=SML
fun ⦏format_z_in_op⦎ (ZLogInOp∧ false: Z_LOG_IN_OP) : string = "∧"
|   format_z_in_op (ZLogInOp∨ false) = "∨"
|   format_z_in_op (ZLogInOp⇒ false) = "⇒"
|   format_z_in_op (ZLogInOp⇔ false) = "⇔"
|   format_z_in_op (ZLogInOpSemi) = ";"
|   format_z_in_op (ZLogInOp∧ true) = "∧⋎s"
|   format_z_in_op (ZLogInOp∨ true) = "∨⋎s"
|   format_z_in_op (ZLogInOp⇒ true) = "⇒⋎s"
|   format_z_in_op (ZLogInOp⇔ true) = "⇔⋎s";
=TEX
=SML
fun ⦏format_sch_in_op⦎ (Pipe : SCH_IN_OP) = ">>"
|   format_sch_in_op (Filter : SCH_IN_OP) = "↾"
|   format_sch_in_op (Comp : SCH_IN_OP) = "⨾";
=TEX
=SML
fun ⦏format_sch_pre_op⦎ (Pre : SCH_PRE_OP) = "pre "
|   format_sch_pre_op (Delta : SCH_PRE_OP) = "Δ"
|   format_sch_pre_op (Xi : SCH_PRE_OP) = "Ξ";
=TEX
=SML
fun ⦏format_quant⦎ (ZQuant∀ false: Z_QUANT) = "∀"
|   format_quant (ZQuant∃ false) = "∃"
|   format_quant (ZQuant∃⋎1 false) = "∃⋎1"
|   format_quant (ZQuant∀ true) = "∀⋎s"
|   format_quant (ZQuant∃ true) = "∃⋎s"
|   format_quant (ZQuant∃⋎1 true) = "∃⋎1⋎s"
;
=TEX
=SML
fun ⦏format_fancy_fix⦎
	(format_item : 'a -> string)
	(tmpl : TEMPLATE)
	(decor : DECOR)
	(items : 'a list) = (
	let	
		val rids = rev (map fst (tmpl_ids tmpl ZClRel));
		val ids = rev (hd rids ^ decor :: tl rids);
		fun aux1 ns its = (
			(format_list
			Combinators.I
			(map (fn (a,b) => a ^ " " ^ b)(combine ns (map format_item its)))
			" ")
		);
		fun aux2 ns its = (
			(format_list
			Combinators.I
			(map (fn (a,b) => a ^ " " ^ b)(combine (map format_item its) ns))
			" ")
		);
	in	case tmpl of
			TmplNon _ => (
				hd ids ^ aux2 (tl ids) items
		) |	TmplIn _ => (
				format_item (hd items)  ^ " " ^ aux1 ids (tl items)
		) |	TmplPre _ => (
				aux1 ids items
		) |	TmplPost _ => (
				aux2 ids items
		)
	end
	handle (Fail _) => fail "format_fancy_fix" 79001 [get_current_theory_name]
);
=TEX
The following function formats a triple of number representing a floating point number.
=SML
fun ⦏z_string_of_float⦎ ((x, p, e): INTEGER * INTEGER * INTEGER) : string = (
	let	fun add_point acc [] 0 = ("0." ^ implode acc)
		|   add_point acc ds 0 = (implode (rev ds) ^ "." ^ implode acc)
		|   add_point acc [] i = add_point ("0"::acc) [] (i-1)
		|   add_point acc (d::ds) i = add_point (d::acc) ds (i-1);
		val (pi, overflow) = (int_of_integer p, false)
			handle Fail _ => (0, true);
	in	if	x @< zero
		orelse	p @<= zero
		orelse	overflow
		then	let	val xs = if x @< zero
					then "~" ^ string_of_integer (@~x)
					else string_of_integer x;
				val ps = if p @< zero
					then "~" ^ string_of_integer (@~p)
					else string_of_integer p;
				val es = if e @< zero
					then "~" ^ string_of_integer (@~e)
					else string_of_integer e;
			in	"⌜Z'Float ⓩ" ^ xs ^ "⌝ ⓩ" ^ ps ^ "⌝ ⓩ" ^ es ^ "⌝⌝"
			end
		else	let	val xs = string_of_integer x;
				val es = if e = zero
					then ""
					else if e @< zero
					then "e~" ^ string_of_integer (@~e)
					else "e" ^ string_of_integer e;
				val (xr, p') = if p = zero
					then ("0"::rev(explode xs), 1)
					else (rev(explode xs), int_of_integer p);
			in	add_point [] xr p' ^ es
			end
	end
);
=IGN
z_string_of_float(@@"0", @@"1", @@"0");
z_string_of_float(@@"0", @@"1", @@"1");
z_string_of_float(@@"0", @@"1", @@"~1");
z_string_of_float(@@"0", @@"1", @@"100");
z_string_of_float(@@"0", @@"1", @@"~100");
z_string_of_float(@@"1", @@"1", @@"0");
z_string_of_float(@@"1", @@"1", @@"1");
z_string_of_float(@@"201", @@"1", @@"0");
z_string_of_float(@@"201", @@"2", @@"0");
z_string_of_float(@@"201", @@"3", @@"0");
z_string_of_float(@@"201", @@"4", @@"0");
z_string_of_float(@@"201", @@"5", @@"0");
z_string_of_float(@@"201", @@"1", @@"2");
z_string_of_float(@@"201", @@"2", @@"2");
z_string_of_float(@@"201", @@"3", @@"2");
z_string_of_float(@@"201", @@"4", @@"2");
z_string_of_float(@@"201", @@"5", @@"2");
z_string_of_float(@@"201", @@"1", @@"~2");
z_string_of_float(@@"201", @@"2", @@"~2");
z_string_of_float(@@"201", @@"3", @@"~2");
z_string_of_float(@@"201", @@"4", @@"~2");
z_string_of_float(@@"201", @@"5", @@"~2");
z_string_of_float(@@"~1", @@"0", @@"0");
z_string_of_float(@@"0", @@"~1", @@"0");
z_string_of_float(@@"~1", @@"~2", @@"0");
z_string_of_float(@@"~1", @@"~2", @@"3");
z_string_of_float(@@"~1", @@"~2", @@"~3");

=TEX
The following function formats a $PRED$. It marks the $Error$ alternative
by prefixing the erroneous sub-term with `$<?>$' and postfixing it with
a newline. Since none of the other alternatives can cause a newline to
appear in the string, the output may safely be truncated after this
newline if desired.
=SML
fun ⦏format_pred⦎ (pred : PRED) : string = (
	case pred of
		PredQuantifier (q, sch_text, pred) =>
			format_quant q ^ format_sch_text_dot_pred (sch_text, pred)
	|	PredLet (eqdefs, pred) =>
			format_list format_eq_def eqdefs "; " ^ format_pred pred
	|	PredLogInOp (pred1, rator, pred2) =>
			format_pred pred1 ^ " " ^ format_z_in_op rator ^ " " ^ format_pred pred2
	|	PredNot (false, pred) => "¬ " ^ format_pred pred
	|	PredNot (true, pred) => "¬⋎s " ^ format_pred pred
	|	PredSchInOp (pred1, rator, pred2) =>
			format_pred pred1 ^ " " ^ format_sch_in_op rator ^ " " ^ format_pred pred2
	|	PredSchPreOp (rator, pred) =>
			format_sch_pre_op rator ^ format_pred pred
	|	PredSchemaHiding (pred, preds) =>
			format_pred pred ^ "\\[" ^ format_list format_pred preds ", " ^ "]"
	|	PredMu body => "μ " ^ format_sch_text_dot_pred_opt body
	|	PredLambda body => "λ " ^ format_sch_text_dot_pred body
	|	PredFancyFix (tmpl, decor, args) =>
			format_fancy_fix
			(fn ps => format_list format_pred ps ", ")
			 tmpl decor args
	|	PredCrossProduct preds => format_list format_pred preds " × "
	|	PredPow pred => "ℙ " ^ format_pred pred
	|	PredApplication (pred1, pred2) => format_pred pred1 ^ " " ^ format_pred pred2
	|	PredTheta pred => "θ " ^ format_pred pred
	|	PredSelection (pred1, pred2) =>  format_pred pred1 ^ "." ^ format_pred pred2
	|	PredIdDec (id, decor) => id ^ decor
	|	PredQuotation _ => "<term-quotation>"
	|	PredPlaceHolder st => format_stub st
	|	PredNumber n => string_of_integer n
	|	PredString s => "\"" ^ s ^ "\""
	|	PredFloat xpe => z_string_of_float xpe
	|	PredTuple preds => "(" ^ format_list format_pred preds ", " ^ ")"
	|	PredBinding eqdefs =>
			"(" ^ format_list format_eq_def eqdefs ", " ^ ")"
	|	PredSetDisplay preds  => "{" ^ format_list format_pred preds ", " ^ "}"
	|	PredSeqDisplay preds  => "⟨" ^ format_list format_pred preds ", " ^ "⟩"
	|	PredSetComp body => "{" ^ format_sch_text_dot_pred_opt body ^ "}"
	|	PredHorizSchema sch_text =>
			"[" ^ format_sch_text sch_text ^ "]"
	|	PredGenInst preds => "[" ^ format_list format_pred preds ", " ^ "]"
	|	PredRenameList renames =>
			"["
		^	format_list
			(fn (pred1, pred2) => format_pred pred1 ^ " / " ^ format_pred pred2)
			renames
			", "
		^	"]"
	|	PredBracketed (pred, decor) => "(" ^ format_pred pred ^ ")" ^ decor
)
and ⦏format_sch_text⦎ ((decl, predopt) : SCH_TEXT) : string = (
	case predopt of
		Value pred	=> format_decl decl ^ " | " ^ format_pred pred
	|	Nil		=> format_decl decl
)
and ⦏format_decl⦎ (decs : DECL) : string = (
	let	fun format_dec ([],		pred)	= format_pred pred
		|   format_dec (preds as _::_,	pred)	=
			format_list format_pred preds ", "
			 ^ " : " ^ format_pred pred;
	in	format_list format_dec decs "; "
	end
)
=TEX
=SML
and ⦏format_eq_def⦎ ((pred1, pred2) : EQ_DEF) : string = (
	format_pred pred1 ^ " ≜ " ^ format_pred pred2
)
=TEX
=SML
and ⦏format_sch_text_dot_pred_opt⦎
	(body : SCH_TEXT * (PRED OPT))
	: string = (
	case body of
		(sch_text, Value pred)	=> format_sch_text_dot_pred (sch_text, pred)
	|	(sch_text, Nil)		=> format_sch_text sch_text
)
=TEX
=SML
and ⦏format_sch_text_dot_pred⦎ (sch_text, pred) : string = (
	format_sch_text sch_text ^ " ⦁ " ^ format_pred pred
);
=TEX
=SML
fun ⦏format_vert_sch_text⦎ ((decl, predopt) : SCH_TEXT) : string = (
	case predopt of
		Value pred	=> format_decl decl ^ " ├ " ^ format_pred pred
	|	Nil		=> format_decl decl
);
=TEX
=SML
fun ⦏format_assoc⦎ LeftAssoc = "leftassoc"
|    format_assoc RightAssoc = "rightassoc";
=TEX
=SML
fun ⦏format_class⦎ ((ZClFun (n, assoc)) : CLASS) : string =
	"fun " ^ string_of_int n ^ " " ^ format_assoc assoc
|   format_class  (ZClGen (n, assoc)) =
	"gen " ^ string_of_int n ^ " " ^ format_assoc assoc
|   format_class  (ZClRel) =
	"rel";
=TEX
=SML
fun ⦏format_fixity⦎ ((cl, tmpls) : FIXITY) : string = (
	format_class cl ^ " " ^ format_list format_template tmpls ", "
);
=TEX
=SML
fun ⦏format_general_term⦎ ((pred1, Value pred2) : GENERAL_TERM) : string = (
	format_pred pred1 ^ " & " ^ format_pred pred2
) | format_general_term (pred1, Nil) = format_pred pred1;
=TEX
=SML
fun ⦏format_abb_def⦎ (ADEqDef eqdef : ABB_DEF) : string = format_eq_def eqdef
=SMLLITERAL
|   format_abb_def (ADSchemaBox (pred, st)) = (
	"┌ " ^ format_pred pred ^ " ─ " ^ format_vert_sch_text st ^ " └"
);
=TEX
=SML
fun ⦏format_free_type_def⦎ (ftd : FREE_TYPE_DEF) : string = (
	let	fun aux (pred, preds) = (
			format_pred pred ^ " ::= " ^
			format_list format_pred preds " | "
		);
	in 	format_list aux ftd " & "
	end
);
=TEX
=SML
fun ⦏format_ax_des⦎ ((preds as _::_, st) : AX_DES) : string = (
=SMLLITERAL
	"╒[ " ^ format_list format_pred preds ", " ^ " ]═ " ^
	format_vert_sch_text st ^ " └"
) | format_ax_des ([], st) = (
	"ⓈZAX"  ^ format_vert_sch_text st ^ " ■"
);
=TEX
=SML
fun ⦏format_conjecture⦎ ((Value id, pred) : CONJECTURE) : string = (
	id ^ " ⊢ " ^ format_pred pred
) | format_conjecture (Nil, pred) = (
	"⊢ " ^ format_pred pred
);

=SML
fun ⦏format_paragraph⦎ (para : PARAGRAPH) : string = (
	case para of
		ParFixity f => format_fixity f
	|	ParGeneralTerm gt => format_general_term gt
	|	ParAbbDef ad => format_abb_def ad
	|	ParFreeTypeDef ftd => format_free_type_def ftd
	|	ParAxDes ab => format_ax_des ab
	|	ParConjecture c => format_conjecture c
);
=TEX
Formatting functions for $Z\_TM$ etc. follow:
=SML
val ⦏format_ident⦎ : IDENT -> string = string_of_ident;
=TEX
=SML
fun ⦏format_ident_list⦎ idl = (
	case idl of
		[] => ""
	|	_ => " [" ^ format_list format_ident idl ", " ^ "] "
);
=TEX
=SML
fun ⦏format_z_dec⦎ (dec : Z_DEC) = (
	case dec of
		ZDDec (idl, tm, _) => (format_list format_ident idl ", ")^" : "^(format_z_tm tm)
	|	ZDSchemaDec (tm, _) => format_z_tm tm
)
=TEX
=SML
and ⦏format_z_decl⦎ (decl : Z_DEC list) = (
	format_list format_z_dec decl "; "
)
=TEX
=SML
and ⦏format_z_schtext⦎ (sch as (decl, Value tm, _) : Z_SCH_TEXT) = (
	(format_z_decl decl)^" | "^(format_z_tm tm)
) | format_z_schtext (sch as (decl, Nil, _)) = (
	format_z_decl decl
)
=TEX
=SML
and ⦏format_eqdef⦎ (eqdef as (id, tm)) = (format_ident id)^" ≜ "^(format_z_tm tm)
=TEX
=SML
and ⦏format_z_tm⦎ (tm : Z_TM) : string = (
	case tm of
		ZTm⟨⟩ (_, tml) => "⟨"^(format_list format_z_tm tml ", ")^"⟩"
	|	ZTmSetd (_, tml) => "{"^(format_list format_z_tm tml ", ")^"}"
	|	ZTmSeta1 sch => "{"^(format_z_schtext sch)^"}"
	|	ZTmSeta2 (sch,tm) => "{"^(format_z_schtext sch)^" ⦁ "^(format_z_tm tm)^"}"
	|	ZTmℙ tm => "ℙ "^(format_z_tm tm)
	|	ZTmTuple tml => "("^(format_list format_z_tm tml ", ")^")"
	|	ZTmBinding eqdefl => "("^format_list format_eqdef eqdefl ", "^")"
	|	ZTm× tml => (format_list format_z_tm tml " × ")
	|	ZTmθ (tm, d) => "θ "^(format_z_tm tm)^d
	|	ZTmSel⋎T (tm, i) => (format_z_tm tm)^" . "^(string_of_int i)
	|	ZTmSel⋎B (tm, id) => (format_z_tm tm)^" . "^(format_ident id)
	|	ZTmApp (tm1, tm2) => (format_z_tm tm1)^" "^(format_z_tm tm2)
	|	ZTmFancyApp ((n, d), ZTmTuple tml) => (
			format_fancy_fix format_z_tm n d tml)
	|	ZTmFancyApp ((n, d), tm) => "("^(format_ident (n,d))^")"^(format_z_tm tm)
	|	ZTmλ (sch, tm) => "λ "^(format_z_schtext sch)^"⦁ "^(format_z_tm tm)
	|	ZTmμ1 sch => "μ "^(format_z_schtext sch)
	|	ZTmμ2 (sch, tm) => "μ "^(format_z_schtext sch)^"⦁ "^(format_z_tm tm)
	|	ZTmPredContext tm => format_z_tm tm
	|	ZTmTruth true => "true"
	|	ZTmTruth false => "false"
	|	ZTmLogInOp⋎F (inop, tm1, tm2) => (format_z_tm tm1)^ " " ^ format_z_in_op inop ^ " " ^(format_z_tm tm2)
	|	ZTmQuant⋎F (q, sch, tm) => format_quant q ^ format_z_schtext sch ^ " ⦁ " ^ format_z_tm tm
	|	ZTm¬⋎F tm => "¬ "^(format_z_tm tm)
	|	ZTmSchemaPred tm => format_z_tm tm
	|	ZTmHorizSchema sch => "["^(format_z_schtext sch)^"]"
	|	ZTmDecor (tm, d, _) => (format_z_tm tm)^d
	|	ZTmPre tm => "pre "^(format_z_tm tm)
	|	ZTm¬⋎S tm => "¬ "^(format_z_tm tm)
=TEX
=SML
	|	ZTmLogInOp⋎S (inop, tm1, tm2) => (format_z_tm tm1)^ " " ^ format_z_in_op inop ^ " " ^(format_z_tm tm2)
	|	ZTm↾ (tm1, tm2) => (format_z_tm tm1)^" ↾⋎s "^(format_z_tm tm2)
	|	ZTmHide (tm, idl) => (format_z_tm tm)^"\\⋎s ("^
			(format_list format_ident idl ", ")^")"
	|	ZTmQuant⋎S (q, sch, tm) => format_quant q ^ format_z_schtext sch ^ " ⦁ " ^ format_z_tm tm

	|	ZTmΔ tm => "Δ "^(format_z_tm tm)
	|	ZTmΞ tm => "Ξ "^(format_z_tm tm)
	|	ZTmEq (tm1, tm2) => (format_z_tm tm1)^" = "^(format_z_tm tm2)
	|	ZTm∈ (tm1, tm2) => (format_z_tm tm1)^" ∈ "^(format_z_tm tm2)
	|	ZTm⨾ (tm1, tm2) => (format_z_tm tm1)^" ⨾⋎s "^(format_z_tm tm2)
	|	ZTmPipe (tm1, tm2) => (format_z_tm tm1)^" >> "^(format_z_tm tm2)
	|	ZTmℤ n => string_of_integer n
	|	ZTmString s => "\""^s^"\""
	|	ZTmFloat xpe => z_string_of_float xpe
	|	ZTmLVar (id, _, tml) => (format_ident id)^(
			case tml of
			[] => ""
			|_ => "["^(format_list format_z_tm tml ", ")^"]"
			)
	|	ZTmGVar (id, _, tml) => (format_ident id)^(
		case tml of
		[] => ""
=TEX
The following could be enabled if you don't want this
function to print $Totality$.
=GFT
		| [poss_total] => (
			case id of
			(TmplNon ("𝕌", Nil), "") => (
			case poss_total of
			(ZTmGVar((TmplNon ("Totality", Nil), ""),_,_)) => ""
			|_ => ("["^(format_list format_z_tm tml ", ")^"]")
			)
			|_ => ("["^(format_list format_z_tm tml ", ")^"]"))
=TEX
=SML
		|_ => "["^(format_list format_z_tm tml ", ")^"]"
		)
=TEX
=SML
	|	ZTmLet (eqdefl, tm) => "let "^(format_list format_eqdef eqdefl "; ")^"⦁ "
							^(format_z_tm tm)
	|	ZTmRename (tm, ididl) => (format_z_tm tm)^(
			case ididl of
			[] => ""
			|_ => " ["^(format_list (fn (id1, id2) => (format_ident id1)^"/"^
				(format_ident id2)) ididl ", ")^"]"
			)
	|	ZTmBracketed tm => "("^(format_z_tm tm)^")"
	|	ZTmQuotation (holterm, _) => string_of_term holterm
);
=TEX
=SML
fun ⦏format_z_parafreetype⦎
		(id : IDENT, idotml : (IDENT * EXTYPE OPT * Z_TM OPT) list)
		: string = (
let	fun aux (id, oty, otm) =
		(format_ident id)^(
			case otm of
			Nil => ""
			|Value tm => " "^(format_z_tm tm));
in
	(format_ident id)^" ::= "^(format_list aux idotml " | ")
end);
=TEX
=SML
fun ⦏format_z_vertschtext⦎ (sch as (decl, Value tm, _) : Z_SCH_TEXT) = (
	(format_z_decl decl)^"├"^(format_z_tm tm)
) | format_z_vertschtext (sch as (decl, Nil, _)) = (
	format_z_decl decl
)
=TEX
=SML
fun ⦏format_z_para⦎ (p : Z_PARA) : string = (
=SMLLITERAL
	case p of
	ZParaAbbDef (id, idl, tm, oty) =>
		(format_ident id)^(format_ident_list idl)
			^" ≜ "^(format_z_tm tm)
	|ZParaSchBox (id, idl, sch, oty) =>
		"┌"^(format_ident id)^(format_ident_list idl)^"─"^
		(format_z_vertschtext sch)^
		"└"
	|ZParaAxDes (idl, sch, _) => (
		case idl of
		  [] =>
			"ⓈZAX"^
			(format_z_vertschtext sch)^
			"■"
		| _::_ =>
			"╒"^(format_ident_list idl)^"═"^
			(format_z_vertschtext sch)^
			"└"
	)
	|ZParaFreeType ftl => (format_list format_z_parafreetype ftl " & ")
	|ZParaGivenSet (idl, oidltm) =>
		(format_ident_list idl)^(
			case oidltm of
			Nil => ""
			|Value (idl', tm) => (format_ident_list idl')^" & "^(format_z_tm tm)
		)
	|ZParaConstraint (idl, tm) =>
		(format_ident_list idl)^(format_z_tm tm)
	|ZParaConjecture (oid, idl, tm) =>
		(case oid of
		Nil => ""
		|Value id => (format_ident id)^" "
		)^(format_ident_list idl)^" ?⊢ "^(format_z_tm tm)
	|ZParaTerm (idl, tm, oty) =>
		"ⓩ"^(format_ident_list idl)^(format_z_tm tm)^"⌝"
	|ZParaFixity fix => (
		format_fixity fix
	)
);
=TEX

=SML
local
val pc_constraint = 0;
val pc_schema = 10;
val pc_tuple = 20;
val pc_rel = 30;
val pc_power = 50;
=TEX
=SML
fun do_z_brkt (prec1:int) prec2 s = (
	if prec1 >= prec2
	then
		case s of
		"" => ""
		|_ => "(" ^ s ^ ")"
	else
		s
);
=TEX
=SML
fun do_z_given_type ty = (
	let	val n = dest_z_given_type ty;
	in	ZTypesAndTermsSupport.unbind_gvar_name n
		handle Fail _ => (
			case n of
				"BOOL" => "𝔹"
			|	"CHAR" => "𝕊"
			|	_ => n
		)
	end
);
=TEX
=SML
fun do_z_var_type ty = (
	"'" ^ (dest_z_var_type ty)
);
=TEX
=SML
fun do_z_tuple_type prec ty = (
let	val tyl = dest_z_tuple_type ty;
	fun 	f [] = ""
	|	f [ty] = do_z_t pc_tuple ty
	|	f (h::t) = (do_z_t pc_tuple h) ^ " × " ^ (f t);
in
	do_z_brkt prec pc_tuple (f tyl)
end)
=TEX
=SML
and do_z_power_type prec ty = (
let	val pty = dest_z_power_type ty;
	val tyl = dest_z_tuple_type pty handle Fail _ => [];
	fun do_z_rel ty1 ty2 =
		do_z_brkt prec pc_rel
		((do_z_t pc_rel ty1) ^ " ↔ "
		^ (do_z_t pc_rel ty2))
=TEX
=SML
	fun f [ty1, ty2] = (
		do_z_brkt prec pc_rel (do_z_rel ty1 ty2))
	|   f _ = do_z_brkt prec pc_power ("ℙ " ^ (do_z_t pc_power pty));
in
	f tyl
end)
=TEX
=SML
and do_z_schema_type prec ty = (
let	val tym = dest_z_schema_type ty;
	fun f [] = ""
	  | f [(s,ty)] = s ^ " : " ^ (do_z_t pc_constraint ty)
	  | f ((s,ty)::rest) = s ^ " : " ^ (do_z_t pc_constraint ty) ^ "; " ^ (f rest)
in
	"[" ^ (f tym) ^ "]"
end)
=TEX
=SML
and do_z_t prec ty = (
	if is_z_given_type ty
	then	do_z_given_type ty
	else if is_z_var_type ty
	then	do_z_var_type ty
	else if is_z_power_type ty
	then	do_z_power_type prec ty
	else if is_z_tuple_type ty
	then	do_z_tuple_type prec ty
	else if is_z_schema_type ty
	then	do_z_schema_type prec ty
	else	string_of_type ty
);
=TEX
=SML
in
fun ⦏format_z_type⦎ (ty : TYPE) : string = do_z_t 0 ty;
fun ⦏z_type_of⦎ (tm : TERM) : string = format_z_type  (type_of tm);
end (* of local ... in ... *);
=TEX

\section{THE TEMPLATE CACHE}
In this section we define the cache in which the Z fixity information
is held. We also define the
functions which read and write this cache.
=TEX
=SML
val zfixity_info_cache : (ZFIXITY * (TEMPLATE list)) E_DICT ref = ref initial_e_dict;
=TEX
=SML
fun ⦏get_zfixity_info⦎ (id : ID) : (ZFIXITY * (TEMPLATE list)) OPT = (
	e_lookup id (!zfixity_info_cache)
);
=TEX
$template\_checks$ makes the checks on a template to be added to the
cache.
=SML
fun ⦏cache_zfixity_info⦎ (cltmpl as (cl, tmpl) : CLASS * TEMPLATE) :  unit  = (
	let	fun mapper (id, zfix) = (
			zfixity_info_cache
			:=
			e_enter
			id
			(case e_lookup id (!zfixity_info_cache) of
				Nil => (zfix, [tmpl])
			|	Value (zfix, tmpls) => (zfix, (tmpl :: tmpls)))
			(!zfixity_info_cache)
		);
	in	map mapper (tmpl_ids tmpl cl); ()
	end
);
=TEX
=SML
fun ⦏uncache_zfixity_info⦎ (cltmpl as (cl, tmpl) : CLASS * TEMPLATE) :  unit  = (
	let	fun mapper (id, zfix) = (
			case e_lookup id (!zfixity_info_cache) of
				Nil => ()
			|	Value (zfix, [tmpl]) => (
					zfixity_info_cache :=
					e_delete id (!zfixity_info_cache)
			) |	Value (zfix, tmpls) => (
					zfixity_info_cache :=
					e_enter id (zfix, tmpls less tmpl)(!zfixity_info_cache)
			)
		);
	in	map mapper (tmpl_ids tmpl cl); ()
	end
);
=TEX
=SML
fun ⦏clear_cache⦎ (():unit) : unit = (
	zfixity_info_cache := initial_e_dict
);
=TEX
\section{THEORY DATABASE ACCESS FUNCTIONS}
The symbol table module uses a single slot in the theory user data
under the key ``pp'z'' to hold the declarations which apply
to the theory. The declarations are held as a fairly direct encoding
of a list of $DECL$s.

In this section we define the functions we use to fetch and store the
lists of $USER\_DATUM$s belonging to the symbol table held in theories.
=SML
val ud_key = "pp'z";
=TEX
The following function is the only place at which we pass an unknown
theory name to the kernel interface.
=SML
fun fetch_sym_tab_data (thy : string) : USER_DATUM list = (
	if thy mem theory_names () orelse thy = "-"
	then	case get_user_datum thy ud_key handle Fail _ => UD_Int(0, []) of
			(UD_Int(0, uds)) => uds
		|	_ => fail "fetch_sym_tab_data" 20001 [fn()=>thy]
	else	fail "fetch_sym_tab_data" 79014 [fn()=>thy]
);
=TEX
The theory name argument to $store\_sym\_tab\_datum$ and
$delete\_sym\_tab\_datum$ are only used in error messages.
=SML
fun store_sym_tab_datum (ud : USER_DATUM) : unit = (
	let	val uds = (
			case get_user_datum "-" ud_key handle Fail _ => UD_Int(0, []) of
				(UD_Int(0, uds)) => uds
			|	_ => fail "store_sym_tab_datum" 79001
					[get_current_theory_name]);
	in 	set_user_datum(ud_key, UD_Int(0, ud :: uds))
	end
);
=TEX
We sometimes need to delete entries. $delete\_sym\_tab\_datum$
does this (and does nothing if the entry to be deleted is not there).
=SML
local

fun list_eq eq (a :: x) (b :: y) = eq (a,b) andalso list_eq eq x y
| list_eq eq [] [] = true
| list_eq eq _ _ = false;

fun ud_equals (UD_Term (tm,udl):USER_DATUM) : USER_DATUM -> bool = (fn ud2 =>
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
in
fun delete_sym_tab_datum (ud : USER_DATUM) : unit = (
	let	val uds = (
			case get_user_datum "-" ud_key handle Fail _ => UD_Int(0, []) of
				(UD_Int(0, uds)) => uds
			|	_ => fail "fetch_sym_tab_data" 20001 [fn()=>"-"]);
		val ud_equals_ud = ud_equals ud;
	in 	set_user_datum(ud_key, UD_Int(0, uds drop ud_equals_ud))
	end
);
end;
=TEX
\subsection{Encoding and Decoding Functions}
First of all we give the encoding for templates.
Plain identifiers are taken verbatim (allowing for the special syntax \verb!$"..."! that allows an arbitrary string to be used as an identifier).
We encode the templates as strings using the template formatting routine
using the words function to protect against any extra spacing that might insert.
=SML
fun ⦏string_of_template⦎ (tmpl : TEMPLATE) : string = (
	case tmpl of
		TmplNon(str, Nil) => str
	|	_ =>
		let	val bits = words (format_template tmpl);
		in	format_list Combinators.I bits " "
		end
);
=TEX
=SML
fun ⦏stub_of_string⦎ (orig_s : string) (s : string) : STUB = (
	case s of
		"..." => StubEll
	|	"_" => StubUS
	|	"_?" => StubUSQ
	|	"_!" => StubUSE
	|	_ => fail "template_of_string" 79003 [fn () => orig_s]
);
=TEX
=SML
fun ⦏core_of_strings⦎ (orig_s : string)
	((s :: ss) : string list) : CORE = (
	let	fun aux (s1 :: s2 :: more) = (stub_of_string orig_s s1, s2) :: aux more
		|   aux [s1] = fail "template_of_string"  79003 [fn () => orig_s]
		|   aux [] = [];
	in	(	s,
			case rev(aux ss) of
				[] => Nil
			|	stid::stids => Value (rev stids, stid))
	end
) | core_of_strings orig_s [] = fail "template_of_string"  79003 [fn () => orig_s];
=TEX

=SML
fun ⦏template_of_string⦎ (s : string) : TEMPLATE = (
	let	val sz = size s;
	in	if	sz > 0
		andalso	String.sub(s, sz - 1) = #"\""
		then	TmplNon(s, Nil)
		else
	let	val (h, r) = (
			case words s of
				"..." :: more => ("...", more)
			|	"_" :: more => ("_", more)
			|	"_?" :: more => ("_?", more)
			|	"_!" :: more => ("_!", more)
			|	other => ("", other));
		val (l, c) = (
			case rev r of
					"..." :: more => ("...", rev more)
			|	"_" :: more => ("_", rev more)
			|	"_?" :: more => ("_?", rev more)
			|	"_!" :: more => ("_!", rev more)
			|	other => ("", r));
		val core = core_of_strings s c;
	in	case (h, l) of
			("", "") => TmplNon core
		|	(_, "") => TmplPost(stub_of_string s h, core)
		|	("", _) => TmplPre(core, stub_of_string s l)
		|	(_, _) => TmplIn (stub_of_string s h, core, stub_of_string s l)
	end
	end
);
=TEX
=SML
fun ⦏int_of_class⦎ (ZClFun (i, LeftAssoc) : CLASS) : int = 5 * i
|   int_of_class (ZClFun (i, RightAssoc) : CLASS) : int = 5 * i + 1
|   int_of_class (ZClGen (i, LeftAssoc) : CLASS) : int = 5 * i + 2
|   int_of_class (ZClGen (i, RightAssoc) : CLASS) : int = 5 * i + 3
|   int_of_class (ZClRel : CLASS) : int = 4;
=TEX
=SML
fun ⦏class_of_int⦎ (i : int) : CLASS = (
	case i mod 5 of
		0 => ZClFun (i div 5, LeftAssoc)
	|	1 => ZClFun (i div 5, RightAssoc)
	|	2 => ZClGen (i div 5, LeftAssoc)
	|	3 => ZClGen (i div 5, RightAssoc)
	|	_ => ZClRel
);
=TEX
=SML
fun ⦏encode_zfixity_info⦎ ((cl, tmpl): CLASS * TEMPLATE) : USER_DATUM = (
	UD_Int(int_of_class cl, [UD_String(string_of_template tmpl, [])])
);
=TEX
=SML
fun ⦏decode_zfixity_info⦎ (thy : string) (ud : USER_DATUM)
		: CLASS * TEMPLATE = (
	(case ud of
		UD_Int(c, [UD_String(t, [])]) => (class_of_int c, template_of_string t)
	|	_ => fail "decode_decl" 79001 [fn()=> thy])
	handle Fail _ => fail "decode_decl" 79001 [fn()=> thy]
);
=TEX
\subsection{Theory Access Functions}
The following function is used to extract fixity records from
a theory.
=SML
fun ⦏get_zfixity_infos⦎ (thy : string) : (CLASS * TEMPLATE) list = (
	(map (decode_zfixity_info thy) (fetch_sym_tab_data thy))
	handle ex => reraise ex "get_zfixity_infos"
);
=TEX
The following function is used to add fixity records to
the current theory.
=SML
fun ⦏store_zfixity_info⦎ (cltmpl : CLASS * TEMPLATE) : unit = (
	store_sym_tab_datum (encode_zfixity_info cltmpl)
);
=TEX
The following function is used to remove a fixity record from
the current theory.
=SML
fun ⦏unstore_zfixity_info⦎ (cltmpl : CLASS * TEMPLATE) : unit = (
	delete_sym_tab_datum (encode_zfixity_info cltmpl)
);
=TEX
=SML

=TEX
\subsection{Update Functions}
When a fixity paragraph is encountered
by the paragraph processor \cite{DS/FMU/IED/DTD049}, the function
$set\_zfixity\_info$ is used to enter the fixity information in the
cache and the theory database. It is necessary to make the checks
on the uniqueness of the template identifiers
from \cite{DS/FMU/IED/DEF007} at this point.
These checks amount to saying that

\begin{enumerate}
\item
the new fixity entry must not
change the $ZFIXITY$ value for any identifier
\item
if there is
already a fixity entry for an identifier with
$ZFIXITY$ other than $ZFFThenOP$, then the existing fixity entry must
be identical with the new one.
\item
the first and last identifiers in the template must be distinct and
must each be different from every other identifier in the template.
\end{enumerate}

If the template is invalid the function raises an exception, otherwise
it returns true iff. the entry is already present.

(Note that the local function check checks $f$ and $c$ rather more often
than is strictly necessary, however this considerably simplifies the code,
which is highly unlikely to be critical for performance.)
=SML
fun ⦏template_check⦎ ((cl, tmpl) : CLASS * TEMPLATE) : bool = (
	let	val idfixes = tmpl_ids tmpl cl;
		val ids = map fst idfixes;
		val ids_entries = combine idfixes (map get_zfixity_info ids);
		fun moan t = (
			fail "cache_zfixity_info" 79010
			[fn()=>format_template tmpl, fn()=>format_template t]
		);
		fun check ((id, (fx, cl)), Value ((f, c), ts)) = (
			let	fun aux t = (
					if fx <> f orelse
					(fx <> ZFFThenOp andalso (t <> tmpl orelse cl <> c))
					then	fail "set_zfixity_info" 79012
						[fn()=>id,
						 fn()=>format_template tmpl,
						 fn()=>format_template t]
					else fx <> ZFFThenOp
				);
			in	any ts aux
			end
		) | check _ = false;
	in	any  ids_entries check
	end
);
=TEX
=SML
fun ⦏set_zfixity_info⦎ ((cl, tmpls) : CLASS * (TEMPLATE list)) : unit = (
	let	val cltmpls_todo = (map (fn tmpl => (cl, tmpl)) tmpls)
			drop template_check;
	in	map cache_zfixity_info cltmpls_todo;
		map store_zfixity_info cltmpls_todo; ()
	end
);
=TEX
=SML
fun ⦏delete_zfixity_info⦎ (cltmpl as (cl, tmpl) : CLASS * TEMPLATE) : unit = (
	if cltmpl mem (get_zfixity_infos "-")
	then	(
		uncache_zfixity_info cltmpl;
		unstore_zfixity_info cltmpl
	) else	fail "delete_zfixity_info" 79013
		[fn()=>format_template tmpl, fn()=>format_class cl]
);
=TEX
\section{HANDLING CONTEXT CHANGES}
When a theory is opened, we rebuild the cache from scratch, this being
by far the most straightforward scheme.
=TEX
$cache\_theory$ loads the symbol table information
contained in a theory and all its ancestors into the caches:
=SML
fun ⦏cache_theory⦎ (current : string) : unit = (
	let	fun aux1 thy (cltmpl :: more) = (
			(if (template_check cltmpl)
				handle Fail msg =>
					(comment "Z User Interface" 79002
					[fn()=>thy, fn()=>get_message msg]; true)
			then ()
			else cache_zfixity_info cltmpl);
			aux1 thy more
		) | aux1 _ [] = ();
		fun aux2 thy = aux1 thy (get_zfixity_infos thy);
	in	clear_cache();
		map aux2 (get_ancestors current);
		()
	end
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
val _ = on_kernel_state_change
	(fn	OpenTheory (current, (_, _)) => cache_theory current
	|	NewParent _ => cache_theory(get_current_theory_name())
	|	_ => ()
);
=TEX
\section{FLAG FOR THE PARSER AND PRETTY-PRINTER}
=SML
val ⦏subscript_z_schema_ops_ref⦎ = ref false;
val _ = new_flag{name = "subscript_z_schema_ops",
	check = fun_true,
	control = subscript_z_schema_ops_ref,
	default = (fn () => false)}
	handle (Fail _) => ();
=TEX
=SML
fun ⦏subscript_z_schema_ops⦎ (():unit) : bool = (
	!subscript_z_schema_ops_ref
);
=TEX
\section{EPILOGUE}
=SML
end; (* of structure ZUserInterfaceSupport *)
=TEX
\small
\twocolumn[\section{INDEX}]
\printindex

\end{document}



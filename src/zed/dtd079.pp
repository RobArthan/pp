=IGN
********************************************************************************
dtd079.doc: this file is part of the PPZed system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% dtd079.doc   ℤ $Date: 2011/07/11 11:44:45 $ $Revision: 1.30 $ $RCSfile: dtd079.doc,v $
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

\def\Title{Detailed Design for Z User Interface Support}

\def\AbstractText{This document contains the detailed design for the Z User Interface Support module.}

\def\Reference{DS/FMU/IED/DTD079}

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
%% LaTeX2e port: \TPPtitle{Detailed Design for Z User Interface Support}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/DTD079}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.30 $%
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
%% LaTeX2e port: This document contains the detailed design for the
%% LaTeX2e port: Z User Interface Support module.}
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

\subsection{Changes History}
\begin{description}
\item [Issue 1.3 (1992/06/18)~(\FormatDate{92/06/18
})]
First draft.
\item [Issue 1.10 (1992/08/06)~(\FormatDate{%92/08/06%%
})]
Reworded error message 79001 (which is sometimes used in circumstances where
it is not certain in which theory the problem arose).
Order of result of $tmpl\_ids$ now defined.
Added $format\_z\_type$ and $z\_type\_of$ to the signature.
\item [Issue 1.12 (1992/10/28)]
Changed treatment of term quotations.
\item [Issue 1.13 (1994/10/31)]
Corrected narrative.
\item [Issue 1.14 (1999/02/16)]
Update for SML'97.
\item [Issue 1.15 (1999/03/07)] Update for new INTEGER type.
\item [Issue 1.16 (2001/12/12)] local declarations removed for Poly/ML port.
\item [Issue 1.17 (2002/01/23)] Support for left associative operators.
\item[Issue 1.18 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.19 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.20 (2005/09/08)] Corrected {\LaTeX} errors.
\item[Issue 1.21 (2005/09/09)] Added new kinds of stub in templates.
Changed comments on the types into type abbreviations.
\item[Issue 1.22 (2005/09/13)] Option to require distinguishing subscripts on all schema operations.
\item[Issue 1.23 (2006/01/25)] Now support decoration of fancyfix identifiers.
\item[Issue 1.24 (2006/04/20)] Added support for floating point literals
\item[Issue 1.25 (2006/12/02)] {\em string\_of\_float} renamed as {\em z\_string\_of\_float}.
\item[Issue 1.26 (2007/08/04)] Improved error message for {\em template\_of\_string}.
\item[Issue 1.27 (2010/04/01)] Support for empty schemas.
\item[Issue 1.28 (2011/07/10)] {\em PRED} component of {\em PredLambda} no longer optional.
\item[Issue 1.29 (2011/07/11)] Added constructor for the parser to flag predicate contexts to the type-checker.
\item[Issue 1.30 (2011/07/11)] Support for empty schemas in paragraphs.
\item[Issue 1.31 (2011/08/04)] Fixed bug with decorations in forming characteristic tuples.
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
This document contains the implementation for the Z User Interface Support module.
The high level design for this material is given in \cite{DS/FMU/IED/HLD018}.
\subsection{Introduction}
\subsubsection{Purpose and Background}
See \cite{DS/FMU/IED/HLD018}.
\subsection{Dependencies}
This module depends on the {\ProductHOL} facilities of \cite{DS/FMU/IED/DTD012}.
\subsubsection{Possible Enhancements}
Support for the user to delete fixity declarations has not been provided.
\subsubsection{Deficiencies}
None known.
\section{PREAMBLE}
=DOC
signature ⦏ZUserInterfaceSupport⦎ = sig
=DESCRIBE
This is the signature of a structure which provides various services
to the Z User Interface.
This structure contains certain private functions which are invoked as one
navigates around the theory database.
These private functions may give rise to error 79001 if the
theory database user data has been corrupted (e.g. by explicit and incorrect use
of lower level interfaces). The most straightforward way of clearing this
corruption is to delete the theory and reload the specification.

The comment messages 79002 and 79010 are printed
out when $new\_parent$ has been used to introduce
an ancestor theory containing a fixity paragraph which is incompatible
with the current context or when one opens a theory which has ancestors containing
incompatible fixity paragraphs.
This condition is not fatal, however it
will not be possible to use the Z parser to enter one of the
incompatible names.
=FAILURE
79001	A Z fixity entry, apparently from theory ?0, is corrupt
79002	A Z fixity entry from theory ?0 could not be loaded (?1)
79003	?0 is not a valid template
79010	The template ?0 clashes with the template ?1 which is already in scope
=ENDDOC
\section{INTERFACE}
\subsection{Data Types}
{\scriptsize
=DOC
type ⦏ID⦎		= string;
type ⦏DECOR⦎		= string;
type ⦏PREC⦎		= int;
datatype ⦏ASSOC⦎ = ⦏LeftAssoc⦎ | ⦏RightAssoc⦎;
datatype ⦏CLASS⦎	=	⦏ZClFun⦎ of int * ASSOC
			|	⦏ZClRel⦎
			|	⦏ZClGen⦎ of int * ASSOC;
datatype ⦏FANCYFIX⦎	=	⦏ZFFBeginOp⦎
			|	⦏ZFFEndOp⦎
			|	⦏ZFFInOp⦎
			|	⦏ZFFPostBeginOp⦎
			|	⦏ZFFThenOp⦎
			|	⦏ZFFPostOp⦎
			|	⦏ZFFPreEndOp⦎
			|	⦏ZFFPreOp⦎;
type ⦏ZFIXITY⦎ 		= FANCYFIX * CLASS;
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
=DESCRIBE
These types are used by the Z parser and type inferrer to represent
various aspects of the Z syntax.
=ENDDOC
=DOC
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
=DESCRIBE
The type $TEMPLATE$ is used by the Z parser and type inferrer to represent
Z names
=ENDDOC
=DOC
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
withtype ⦏DECL⦎		= (PRED list * PRED) list
and ⦏SCH_TEXT⦎		= (PRED list * PRED) list * (PRED OPT) (* = DECL * (PRED OPT) *)
and ⦏EQ_DEF⦎		= PRED * PRED;

=DESCRIBE
These types is used by the Z parser and type inferrer to represent
various aspects of the Z syntax.
=ENDDOC
=DOC
type ⦏FIXITY⦎		= CLASS * (TEMPLATE list);
type ⦏GENERAL_TERM⦎	= PRED * (PRED OPT);
datatype ⦏ABB_DEF⦎	= ⦏ADEqDef⦎ of EQ_DEF
			| ⦏ADSchemaBox⦎ of PRED * SCH_TEXT;
type ⦏FREE_TYPE_DEF⦎	= (PRED * (PRED list)) list;
type ⦏AX_DES⦎		= (PRED list) * SCH_TEXT;
type ⦏CONJECTURE⦎		= (ID OPT) * PRED	;
datatype ⦏PARAGRAPH⦎	= ⦏ParFixity⦎ of FIXITY
			| ⦏ParGeneralTerm⦎ of GENERAL_TERM
			| ⦏ParAbbDef⦎ of ABB_DEF
			| ⦏ParFreeTypeDef⦎ of FREE_TYPE_DEF
			| ⦏ParAxDes⦎ of AX_DES
			| ⦏ParConjecture⦎ of CONJECTURE;
=DESCRIBE
These types are used by the Z parser and type inferrer to represent
various aspects of the Z syntax.
=ENDDOC
=DOC
type ⦏IDENT⦎		= TEMPLATE * DECOR;
datatype ⦏Z_TM⦎	=	⦏ZTm⟨⟩⦎ of Unification.EXTYPE OPT * Z_TM list
		|	⦏ZTmSetd⦎ of Unification.EXTYPE OPT * Z_TM list
		|	⦏ZTmSeta1⦎ of Z_SCH_TEXT
		|	⦏ZTmSeta2⦎ of Z_SCH_TEXT * Z_TM
		|	⦏ZTmℙ⦎ of Z_TM
		|	⦏ZTmTuple⦎ of Z_TM list
		|	⦏ZTmBinding⦎ of Z_EQ_DEF list
		|	⦏ZTm×⦎ of Z_TM list
		|	⦏ZTmθ⦎ of Z_TM * DECOR
		|	⦏ZTmSel⋎B⦎ of Z_TM * IDENT
		|	⦏ZTmSel⋎T⦎ of Z_TM * int
		|	⦏ZTmApp⦎ of Z_TM * Z_TM
		|	⦏ZTmFancyApp⦎ of IDENT * Z_TM
		|	⦏ZTmλ⦎ of Z_SCH_TEXT * Z_TM
		|	⦏ZTmμ1⦎ of Z_SCH_TEXT
		|	⦏ZTmμ2⦎ of Z_SCH_TEXT * Z_TM
		|	⦏ZTmPredContext⦎ of Z_TM
		|	⦏ZTmTruth⦎ of bool
		|	⦏ZTm¬⋎F⦎ of Z_TM
		|	⦏ZTmLogInOp⦎⋎F of Z_LOG_IN_OP * Z_TM * Z_TM
		|	⦏ZTmSchemaPred⦎ of Z_TM
		|	⦏ZTmQuant⋎F⦎ of Z_QUANT * Z_SCH_TEXT * Z_TM
		|	⦏ZTmHorizSchema⦎ of Z_SCH_TEXT
		|	⦏ZTmDecor⦎ of Z_TM * DECOR * Unification.EXTYPE OPT
		|	⦏ZTmPre⦎ of Z_TM
		|	⦏ZTm¬⋎S⦎ of Z_TM
		|	⦏ZTmLogInOp⋎S⦎ of Z_LOG_IN_OP * Z_TM * Z_TM
		|	⦏ZTm↾⦎ of Z_TM * Z_TM
		|	⦏ZTmHide⦎ of Z_TM * IDENT list
		|	⦏ZTmQuant⋎S⦎ of Z_QUANT * Z_SCH_TEXT * Z_TM
		|	⦏ZTmΔ⦎ of Z_TM
		|	⦏ZTmΞ⦎ of Z_TM
		|	⦏ZTmEq⦎ of Z_TM * Z_TM
		|	⦏ZTm∈⦎ of Z_TM * Z_TM
		|	⦏ZTm⨾⦎ of Z_TM * Z_TM
		|	⦏ZTmPipe⦎ of Z_TM * Z_TM
		|	⦏ZTmℤ⦎ of INTEGER
		|	⦏ZTmString⦎ of string
		|	⦏ZTmFloat⦎ of INTEGER * INTEGER * INTEGER
		|	⦏ZTmLVar⦎ of IDENT * Unification.EXTYPE OPT * Z_TM list
		|	⦏ZTmGVar⦎ of IDENT * Unification.EXTYPE OPT * Z_TM list
		|	⦏ZTmLet⦎ of Z_EQ_DEF list * Z_TM
		|	⦏ZTmRename⦎ of Z_TM * ((IDENT * IDENT) list)
		|	⦏ZTmBracketed⦎ of Z_TM
		|	⦏ZTmQuotation⦎ of TERM * Unification.EXTYPE OPT
and ⦏Z_DEC⦎	=	⦏ZDDec⦎ of IDENT list * Z_TM * Unification.EXTYPE OPT
		|	⦏ZDSchemaDec⦎ of Z_TM * Unification.EXTYPE OPT
withtype ⦏Z_SCH_TEXT⦎ 	= Z_DEC list * Z_TM OPT * Unification.EXTYPE OPT
and ⦏Z_EQ_DEF⦎ 		= IDENT * Z_TM;
=DESCRIBE
These types are used by the Z parser and type inferrer to represent
various aspects of the Z syntax.
=ENDDOC
=DOC
datatype ⦏Z_PARA⦎
	= ⦏ZParaFixity⦎ of FIXITY
	| ⦏ZParaAbbDef⦎ of IDENT * IDENT list * Z_TM * Unification.EXTYPE OPT
	| ⦏ZParaSchBox⦎ of IDENT * IDENT list * Z_SCH_TEXT * Unification.EXTYPE OPT
	| ⦏ZParaAxDes⦎ of IDENT list * Z_SCH_TEXT * (((IDENT * Unification.EXTYPE) list) OPT)
	| ⦏ZParaFreeType⦎ of (IDENT * (IDENT * Unification.EXTYPE OPT * Z_TM OPT) list) list
	| ⦏ZParaGivenSet⦎ of IDENT list * ((IDENT list * Z_TM) OPT)
	| ⦏ZParaConstraint⦎ of IDENT list * Z_TM
	| ⦏ZParaConjecture⦎ of IDENT OPT * IDENT list * Z_TM
	| ⦏ZParaTerm⦎ of IDENT list * Z_TM * Unification.EXTYPE OPT;
=DESCRIBE
These types are used by the Z parser and type inferrer to represent
various aspects of the Z syntax.
=ENDDOC
} % end of \scriptsize
\subsection{Template Functions}
=DOC
val	⦏first_tmpl_id⦎ : TEMPLATE -> ID
=DESCRIBE
Given a template this function returns the first identifier in it.
The result may then be used in a call of $get\_zfixity\_info$ to
access the relevant information from the corresponding fixity paragraph.
=ENDDOC
=DOC
val	⦏tmpl_ids⦎ : TEMPLATE -> CLASS -> (ID * ZFIXITY) list
=DESCRIBE
Given a template this function returns
the corresponding list of name-$ZFIXITY$ pairs. The list is in
the same order as the ids in the template.
=ENDDOC
=DOC
val	⦏tmpl_stubs⦎ : TEMPLATE -> STUB list
=DESCRIBE
Given a template this function returns
the corresponding list of stubs. The list is in the
order of appearance in the template.
=ENDDOC
=DOC
val	⦏string_of_template⦎ : TEMPLATE -> string
val	⦏template_of_string⦎ : string -> TEMPLATE
=DESCRIBE
$string\_of\_template$ and $template\_of\_string$ are used to encode (resp. decode)
templates as strings.
=ENDDOC
=DOC
val	⦏string_of_ident⦎ : IDENT -> string
=DESCRIBE
The function $string\_of\_ident$ makes a string from an identifier.
=ENDDOC
=DOC
val	⦏z_string_of_float⦎ : INTEGER * INTEGER * INTEGER -> string
=DESCRIBE
The function $z\_string\_of\_float$ converts three integers $(x, p, e)$ representing the real number $x\times10^{e-p}$ into a string denoting the corresponding floating point literal.
If $x < 0$ or $p < 1$, the string takes the form of an HOL quotation (since the Z parser will always produce floating point literals with $x \ge 0$ and $p \ge 1$).
=ENDDOC
\subsection{Fixity}
=DOC
val	⦏set_zfixity_info⦎ : CLASS * TEMPLATE list -> unit
=DESCRIBE
This is the interface for use by the Z paragraph processor when a fixity
paragraph is encountered. After checking that the fixity paragraph
obeys the syntactic rules, it enters a record of the fixity
paragraph in the current theory and updates the cache of fixity
information used by $get\_zfixity\_info$.

=FAILURE
79010	The template ?0 clashes with the template ?1 which is already in scope
79011	A Z fixity entry associated with the template ?0 is corrupt
79012	?0 in the template ?1 clashes with its use in the template ?2 which is
	already in scope
=ENDDOC
=DOC
val	⦏get_zfixity_info⦎ : ID -> (ZFIXITY * TEMPLATE list) OPT
=DESCRIBE
This is the interface for use by the parser and type inferrer when
the fixity information associated with a name is required.
The information is extracted from a cache which is updated
by the functions $set\_zfixity\_info$ and $delete\_zfixity\_info$
and also when the current theory changes or a new parent is added.
=ENDDOC
=DOC
val	⦏delete_zfixity_info⦎ : CLASS * TEMPLATE -> unit
=DESCRIBE
This is the interface for use by the Z paragraph processor when the
effect of a fixity paragraph is to be deleted.
=FAILURE
79013	There is no fixity entry for ?1 ?0 in the current theory
=ENDDOC
=DOC
val	⦏get_zfixity_infos⦎ : string -> (CLASS * TEMPLATE) list
=DESCRIBE
This is the interface for use by the theory lister to extract the fixity
information for a Z theory. The argument is the name of the theory.
=FAILURE
79014	There is no theory called ?0
=ENDDOC
\subsection{Flag for the Parser and Pretty-Printer}
=DOC
	(* ⦏subscript_z_schema_ops⦎  - boolean flag declared by new_flag, default: false *)
	val ⦏subscript_z_schema_ops⦎ : unit -> bool
=DESCRIBE
{\ProductZ} supports a non-standard extension allowing schema operators that overload logical operators to be distinguished with a subscript ``s''.

The flag determines whether this feature is enforced or not: if the flag has its default value of false, schema operators may be given a subscript, but unsubscripted forms will be interpreted as schema operators according to the context, as in ISO Standard Z;
if the flag is true, the forms without a subscript will not be interpreted as schema operators.
The form with a subscript is only used in pretty-printing if the flag is true.

The function is used in the parser and pretty-printer to access the value of the flag.
=ENDDOC

\subsection{Formatting Functions}
=DOC
val ⦏format_class⦎ : CLASS -> string;
val ⦏format_decl⦎ : DECL -> string;
val ⦏format_eq_def⦎ : EQ_DEF -> string;
val ⦏format_fixity⦎ : FIXITY -> string;
val ⦏format_ident⦎ : IDENT -> string;
val ⦏format_paragraph⦎ : PARAGRAPH -> string;
val ⦏format_pred⦎ : PRED -> string;
val ⦏format_sch_text⦎ : SCH_TEXT -> string;
val ⦏format_quant⦎ : Z_QUANT -> string;
val ⦏format_template⦎ : TEMPLATE -> string;
val ⦏format_z_in_op⦎ : Z_LOG_IN_OP -> string;
val ⦏format_z_dec⦎ : Z_DEC -> string;
val ⦏format_z_para⦎ : Z_PARA -> string;
val ⦏format_z_schtext⦎ : Z_SCH_TEXT -> string;
val ⦏format_z_tm⦎ : Z_TM -> string;
val ⦏format_z_type⦎ : TYPE -> string;
val ⦏z_type_of⦎ : TERM -> string;
=DESCRIBE
These functions are used by the Z parser and type inferrer to format
fragments of the data types they use to represent Z syntax for inclusion
in diagnostic messages.

=ENDDOC
\section{EPILOGUE}
=SML
end (* of signature ZUserInterfaceSupport *);
=TEX
\section{TEST POLICY}
The tests should follow the standards and guidelines laid down in
\cite{DS/FMU/IED/PLN008}.
\small
\twocolumn[\section{INDEX}]
\printindex

\end{document}



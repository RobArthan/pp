=IGN
********************************************************************************
dtd502.doc: this file is part of the PPDaz system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  dtd502.doc ℤ $Date: 2008/05/05 11:28:14 $ $Revision: 1.154 $ $RCSfile: dtd502.doc,v $
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

\def\Title{Compliance Notation Lexis and Abstract Syntax}

\def\AbstractText{This document contains the detailed design for the lexis and abstract syntax for Compliance Notation}

\def\Reference{ISS/HAT/DAZ/DTD502}

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
%% LaTeX2e port: % TQtemplate.tex
%% LaTeX2e port: \documentstyle[hol1,11pt,TQ]{article}
%% LaTeX2e port: \ftlinepenalty=9999
\def\Hide#1{}
\def\Bool{``$\it{:}bool\,$''}
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{DAZ PROJECT}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \def\TPPheadtitle{Compliance Notation Lexis and Abstract Syntax}  %% Mandatory field
%% LaTeX2e port: \TPPtitle{Compliance Notation Lexis and Abstract Syntax}  %% Mandatory field
%% LaTeX2e port: \TPPref{ISS/HAT/DAZ/DTD502}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.154 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2008/05/05 11:28:14 $%
%% LaTeX2e port: }}
%% LaTeX2e port: %\TPPstatus{Approved}
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: %\TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{D.J.~King&WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan&HAT Team}
%% LaTeX2e port: \TPPabstract{
%% LaTeX2e port: This document contains the detailed design for the lexis and abstract syntax for Compliance Notation}
%% LaTeX2e port: %\TPPabstractB{}
%% LaTeX2e port: %\TPPabstractC{}
%% LaTeX2e port: %\TPPabstractD{}
%% LaTeX2e port: %\TPPabstractE{}
%% LaTeX2e port: %\TPPabstractF{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	A.~Smith, DRA \\
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
%% LaTeX2e port: \bf Copyright \copyright\ : Lemma 1 Ltd \number\year
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
\bibliography{daz,fmu}

\subsection{Changes History}  % to get section number `0.3'
\begin{description}
\item[Issue 1.1 (1994/01/30)-1.37 (1994/07/21)] Initial Drafts.
\item[Issue 1.38 (1994/09/22)] Reworked according to desk check report 006.
\item[Issue 1.39 (1994/10/07))] Added lexical tokens for auxiliary expressions.
\item[Issue 1.40 (1994/10/07)] Corrected abstract syntax for specification statements w.r.t. labels.
\item[Issue 1.44 (1994/10/13)] Re-organised material and applied DRA's suggested corrections documented in \cite{ISS/HAT/DAZ/MIN004}.
\item[Issue 1.45 (1994/10/13)] Few minor changes in checking the rework.
\item[Issue 1.46 (1994/10/13)-1.51 (1994/11/09)] Bug fixes.
\item[Issue 1.52 (1994/12/01)] Updated document references.
\item[Issue 1.53 (1994/12/02)] Changed the text in the Test Policy section. Fixed a Z problem in the definition of Z\_PRED.
\item[Issue 1.54 (1994/12/06)] Reworded the test policy section.
\item[Issue 1.55 (1995/09/18)] Added pragmas, annotations and arbitrary replacements.
\item[Issue 1.60 (1995/10/13)] Added Z Bindings and updated free type def. of Z\_EXP.
\item[Issue 1.61 (1995/10/17)] Added qualified expressions and type conversions to the Z.
\item[Issue 1.62 (1995/10/20)] Added short-circuit conditionals to Z syntax for SPARK.
\item[Issue 1.63 (1995/10/25)] Documentary corrections prior to review of recent changes.
\item[Issue 1.64 (1995/11/23)] Multi-dimensional arrays now part of the specification.
\item[Issue 1.65 (1995/11/29)] Enhancement 3.
\item[Issue 1.66 (1995/12/14) (14th December 1995)] Changes according to desk check report 024.
\item[Issue 1.67 (1996/02/22)] Typo corrected.
\item[Issue 1.68 (1996/07/14)-1.69 (1996/07/15)] Syntax changes for k-slots as annotations.
\item[Issue 1.70 (1997/05/29)] WP 7 implementation.
\item[Issue 1.71 (1997/06/03)] Changes for IUCT WP 2.
\item[Issue 1.72 (1997/06/17)] IUCT WP 3 changes.
\item[Issue 1.73 (1997/07/18)] IUCT WP 4 changes.
\item[Issue 1.73 (1997/07/18)] Corrected Z syntax and type errors.
\item[Issue 1.74 (1997/07/29)] Updated references.
\item[Issue 1.75 (1997/08/18)] Added dummy defs for $Z\_TM$ and $Z\_PARA$ and $Z\_EXP$.
		Changes to allow compilation with zed.db
\item[Issue 1.77 (1999/02/10)] Changes to allow compilation with hol.db
\item[Issue 1.78 (1999/02/15)-1.79 (1999/02/16)] Changes to allow compilation with just polyml.
\item[Issue 1.80 (1999/03/02)] Update for SML 97.
\item[Issue 1.81 (2000/05/17)] Typechecking enhancement ref. R5 from \cite{LEMMA1/DAZ/HLD506}
At this version only the Z and a few of the ML types have been changed.
The main ML changes will come later.
\item[Issue 1.82 (2000/05/23)] Typechecking other enhancements from \cite{LEMMA1/DAZ/HLD506}.
\item[Issue 1.83 (2000/05/24)] Prototyping enhancement R5: Initial Variables in Conditionals.
\item[Issue 1.84 (2000/05/29)] Typechecking corrected approach to enhancement R2 --- Multiple Logical Constant Definitions.
\item[Issues 1.85 (2000/06/14), 1.86 (2000/06/16)] Enhancement R2: Multiple Logical Constants.
\item[Issue 1.87 (2000/06/16)] Enhancement R1: Multidimensional Arrays.
\item[Issue 1.88 (2000/10/17)] CTLE II R1/2: ``Others'' in case statements.
\item[Issue 1.89 (2000/10/17)] CTLE II R1/3: reverse loops.
\item[Issue 1.90 (2000/10/17)] CTLE II R1/10: multiple with clauses.
\item[Issue 1.91 (2000/10/18)] CTLE II R1/4 --- logical operators on arrays
of booleans, including overloading, and some parts of R1/1 (reals) and R1/8 (characters and strings).
\item[Issue 1.92 (2000/10/18)] CTLE II R1/8 --- remainder of characters and strings.
\item[Issue 1.93 (2000/10/24)] CTLE II R1/9 --- SPARK 83 attributes.
\item[Issue 1.94 (2000/10/25)] CTLE II R2/1 --- global variable unsoundness.
\item[Issues 1.95 (2000/10/29),1.96 (2000/10/30)] CTLE II R1/1 --- real types.
\item[Issue 1.97 (2000/12/21)] Final adjustments to the Z specs.
\item[Issue 1.98 (2001/11/08)] R0021: new treatment of AND THEN and OR ELSE.
\item[Issue 1.99 (2001/12/12)] Removed local declarations for Poly/ML port.
\item[Issues 1.100 (2001/12/15)-1.102 (2001/12/16)] R0037: support for named numbers.
\item[Issue 1.103 (2002/01/02)] Corrected error in use of the generic schema {\it Range}.
\item[Issue 1.104 (2002/01/14)] Index brackets added.
\item[Issue 1.105 (2002/01/22)--1.108 (2002/01/26)] R0006: free use of subtype indications and ranges
\item[Issue 1.109 (2002/01/29)] Moved CN\_ENV type here to simplify life with IMP508 etc.
\item[Issue 1.110 (2002/01/30)] Fixed {\LaTeX} errors.
\item[Issue 1.111 (2002/02/14)] Applying specification changes from HLD508.
\item[Issue 1.112 (2002/02/18)] Fixing {\LaTeX} problems for SPC502 and SPC503.
\item[Issue 1.113 (2002/03/01)] R0056: default parameter modes supported properly.
\item[Issues 1.114 (2002/03/13)-1.116 (2002/05/03)] Spring 2002 enhancements: syntax changes for interim release.
\item[Issues 1.117 (2002/05/04)-1.119 (2002/05/10)]  Support for R0047: renaming.
\item[Issues 1.120 (2002/05/14), 1.121 (2002/05/17)] Formal spec updates for interim release.
\item[Issue 1.122 (2002/05/30)] Fixed {\LaTeX} errors.
\item[Issue 1.123 (2002/07/24)] R0079: assertions ({\it SPEC\_NO\_IVARS} now has a flag to indicate an assertion.
\item[Issue 1.124 (2002/08/07), 1.125 (2002/08/08)] R0051/R0052: default parameters and block statements.
\item[Issue 1.126 (2002/08/08)] Now support renaming of operator symbol with no package name prefix.
\item[Issue 1.127 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue2 1.128 (2002/10/17), 1.129 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.130 (2002/11/10)] Block statements now treated uniformly with other statement forms.
\item[Issue 1.131 (2002/11/25)] Schemas-as-declarations now catered for in specification of Z syntax.
\item[Issue 1.132 (2002/12/05)] $\theta$-expressions  now catered for in  specification of Z syntax.
\item[Issue 1.133 (2003/05/19)] Support for NOTHING statement form.
\item[Issue 1.134 (2003/06/18)] R0096: improved formatting of nothing statement form in web clauses
\item[Issue 1.135 (2003/07/14)] Added lexical class for undeclared labels (for use in lexer and parser to
improve error messagaes).
\item[Issue 1.136 (2004/02/07)] The name at the end of a proper body or a package declaration is now optional.
\item[Issues 1.137 (2004/06/20)-1.139 (2004/07/10)] Reform of the Environments.
\item[Issue 1.140 (2004/08/29)] Implemented distinction between empty private part and omitted private part.
\item[Issue 1.141 (2004/10/25)] Improved environment representation for procedures.
\item[Issue 1.142 (2004/11/02)] Corrected out-of-date comment.
\item[Issue 1.143 (2004/12/08)] Adjustments to lexical class data type (for syntax of Ada labels and goto statements).
\item[Issue 1.144 (2005/04/22)] Added support for derived types.
\item[Issue 1.145 (2005/12/07)] Added support for implicit subprogram declarations.
\item[Issue 1.146 (2006/04/07)] Removed unnecessary alternative from environment info data type.
\item[Issue 1.147 (2006/05/31)] Adjusted type for subunits to give the expanded name of the parent unit as a list.
\item[Issue 1.148 (2006/08/10)] Multiple auxiliary variables are now allowed in one Z declaration.
\item[Issue 1.149 (2006/09/17)] Added support for deferred subprograms.
\item[Issues 1.150 (2007/05/18), 1.151 (2007/05/21)] New lexical token for naming anonymous blocks.
Rationalisation of data types for loops.
\item[Issue 1.152 (2008/03/23), 1.153 (2008/03/24)] Child packages.
\item[Issue 1.154 (2008/05/05)] Modular types.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported daz source documents onto the Lemma 1 document template
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
None.
\section{GENERAL}
\subsection{Scope}
This document contains the detailed design for the lexis and abstract syntax for the Compliance Notation.

The lexis corresponds to that specified in \cite{pvl90}. The abstract syntax is based on the abstract syntax for basic declarations and expressions in \cite[volume 3]{DRA/CIS/CSE3/TR/94/27/3.0} and the abstract syntax for SPARK statements in \cite[volume 2]{DRA/CIS/CSE3/TR/94/27/3.0}. The abstract syntax for SPARK subprograms and packages has been derived from the concrete syntax for compliance notation in \cite[volume 1]{DRA/CIS/CSE3/TR/94/27/3.0}.

\subsection{Introduction}
\subsubsection{Purpose and Background}

The lexis is required to carry the lexical information of the input which has been computed by the lexical analyser. The grammar in \cite{ISS/HAT/DAZ/DTD503} is closely related to this lexis since the terminals in the grammar correspond to the lexemes in the datatype $CN\_LEX\_CLASS$. The lexical classes are themselves derived from the list of terminal symbols in \cite[volume 1, appendix A]{DRA/CIS/CSE3/TR/94/27/3.0}.

The abstract syntax for compliance notation constitutes the internal representation for web clauses. All web clauses and fragments of SPARK programs are represented using the abstract syntax type $WEB\_CLAUSE$. The representation is used by the basic declaration and expression generator \cite[volume 3]{DRA/CIS/CSE3/TR/94/27/3.0}, the verification condition generator \cite[volume 2]{DRA/CIS/CSE3/TR/94/27/3.0} and the SPARK output function which creates a human-readable form of the abstract representation corresponding to the input.

Web clauses of type $WEB\_CLAUSE$ are generated by the compliance notation parser \cite{ISS/HAT/DAZ/DTD503} from the literate script being processed.


\subsection{Compliance}

This document contains the signature for compliance notation lexis and compliance notation abstract syntax.

The correspondance between the lexis and that in \cite[volume 1, appendix A]{DRA/CIS/CSE3/TR/94/27/3.0} can be seen by simply comparing the list of type constructors of $CN\_LEX\_CLASS$ with the terminal symbols in \cite[volume 1, appendix A]{DRA/CIS/CSE3/TR/94/27/3.0}.


The correspondence between the Z specification of the abstract syntax in DRA's specification and the implementation is aided by the reproduction of the relevant Z of \cite{DRA/CIS/CSE3/TR/94/27/3.0} in this document. The implementation of each of the schemas is done using a Standard ML type. The details of this type do not appear in the Standard ML signature; the ML syntax does not allow it; but only in the structure. In order to maintain traceability, the information which appears in the structure is contained in this document. During the building of the tool, the {\Product} document processing facility $sieve$ filters out the implementation details into a separate file. The signature can then be processed, and the corresponding structure can be automatically generated from the filtered implementation details. The machinery to do this is very small and can be found in the companion implementation document to this \cite{ISS/HAT/DAZ/IMP503}.

It is intended that the compliance of the Z to the implementation can be done with a visual check in this document.

There are various points in the abstract syntax where the data types are ``wider'' than the corresponding Z. This is generally because it is necessary to carry some syntactic information which would otherwise be lost, in order to reproduce the SPARK program when all the web clauses have been entered. These points are identified by descriptive text later in this document.

Note also that Z expressions are stored as HOL terms in {\ProductZ}. The HOL terms which represent Z expressions are a subset of all HOL terms. This constitutes a ``widening''. This does not introduce any problem for the Compliance Tool.


\section{PREAMBLE}
\subsection{For Z Type-Checking}
The following initialises the theory database when performing a syntax and type check on the Z paragraphs in this document. (This preamble is not processed when building the compliance tool.)

=SMLZ
open_theory"z_library";
push_pc "z_library";
force_delete_theory"dtd502" handle Fail _ => ();
val _ = set_flag ("z_type_check_only", true);
new_theory"dtd502";
fun show_progress recogniser args = (
	recogniser args;
	(hd o get_consts) "-" handle Fail _ => ⓩNo progress⌝
);
val z_axbox_recogniser = show_progress ZParagraphRecognizers.z_axbox_recogniser;
val z_genbox_recogniser = show_progress ZParagraphRecognizers.z_genbox_recogniser;
val z_schbox_recogniser = show_progress ZParagraphRecognizers.z_schbox_recogniser;
val z_other_recogniser = show_progress ZParagraphRecognizers.z_other_recogniser;
=TEX

=TEX

\subsection{The Signature}
=DOC
signature ⦏CNTypes⦎ = sig
=DESCRIBE
This is the signature for the structure containing the types required for Compliance Notation.
=ENDDOC
\section{LEXIS}
=DOC
datatype ⦏CN_LEX_CLASS⦎
			= ⦏LCAbs⦎ | ⦏LCAmpersand⦎ | ⦏LCAnd⦎
			| ⦏LCAnnotation⦎ | ⦏LCAnnotationLabel⦎ | ⦏LCArbitraryAda⦎
			| ⦏LCArray⦎ | ⦏LCAt⦎ | ⦏LCAuxiliary⦎
			| ⦏LCBar⦎ |⦏LCBlock⦎ |⦏LCBBody⦎ | ⦏LCBecomes⦎ | ⦏LCBegin⦎ | ⦏LCBy⦎
			| ⦏LCCase⦎| ⦏LCCharacterLiteral⦎
			| ⦏LCColon⦎ | ⦏LCComma⦎ | ⦏LCComment⦎
			| ⦏LCCompLabel⦎ | ⦏LCConstant⦎
			| ⦏LCCon⦎
			| ⦏LCDecLabel⦎  | ⦏LCDeclare⦎
			| ⦏LCDeferred⦎ | ⦏LCDelta⦎ | ⦏LCDigits⦎ | ⦏LCDiv⦎
			| ⦏LCDotDot⦎ | ⦏LCDot⦎
			| ⦏LCElse⦎ | ⦏LCElsIf⦎ | ⦏LCEnd⦎ | ⦏LCEos⦎ | ⦏LCEquals⦎ | ⦏LCExit⦎
			| ⦏LCFatDot⦎ | ⦏LCFor⦎ | ⦏LCFunction⦎
			| ⦏LCGoesTo⦎ | ⦏LCGoto⦎
			| ⦏LCGreaterEquals⦎ | ⦏LCGreaterThan⦎
			| ⦏LCGrkGamma⦎ | ⦏LCGrkDelta⦎ | ⦏LCGrkXi⦎
			| ⦏LCIdentifier⦎ | ⦏LCIf⦎ | ⦏LCImplement⦎ | ⦏LCImplementedBy⦎
			| ⦏LCImplicit⦎ | ⦏LCIn⦎ | ⦏LCIs⦎
			| ⦏LCKSlot⦎
			| ⦏LCLBrace⦎ | ⦏LCLBracket⦎ | ⦏LCLChevron⦎ | ⦏LCLessEquals⦎
			| ⦏LCLessGreat⦎ | ⦏LCLessThan⦎
			| ⦏LCLimited⦎ | ⦏LCLLabel⦎ | ⦏LCLoop⦎
			| ⦏LCLSqBrack⦎ | ⦏LCLStrachey⦎
			| ⦏LCMinus⦎ | ⦏LCMod⦎
			| ⦏LCNew⦎ | ⦏LCNothing⦎
			| ⦏LCNotEquals⦎ | ⦏LCNot⦎ | ⦏LCNull⦎ | ⦏LCNumericLiteral⦎
			| ⦏LCOf⦎ | ⦏LCOr⦎ | ⦏LCOthers⦎ | ⦏LCOut⦎
			| ⦏LCPackage⦎ | ⦏LCPlus⦎ | ⦏LCPPartLabel⦎ | ⦏LCPrime⦎
			| ⦏LCPrimedIdentifier⦎ | ⦏LCPragma⦎ | ⦏LCPrivate⦎
			| ⦏LCProcedure⦎
			| ⦏LCRBrace⦎ | ⦏LCRBracket⦎ | ⦏LCRChevron⦎ | ⦏LCRecord⦎
			| ⦏LCReferences⦎ | ⦏LCRefinedBy⦎ | ⦏LCRem⦎
			| ⦏LCRenames⦎ | ⦏LCReplacedBy⦎ | ⦏LCReturn⦎
			| ⦏LCReverse⦎ | ⦏LCRLabel⦎
			| ⦏LCRRange⦎ | ⦏LCRSqBrack⦎ | ⦏LCRStrachey⦎
			| ⦏LCSemi⦎ | ⦏LCSeparate⦎ | ⦏LCSpecLabel⦎ | ⦏LCStarStar⦎
			| ⦏LCStar⦎ | ⦏LCStmtLabel⦎ | ⦏LCStringLiteral⦎
			| ⦏LCSubtype⦎ | ⦏LCThen⦎ | ⦏LCTill⦎ | ⦏LCType⦎
			| ⦏LCUndeclaredLabel⦎
			| ⦏LCUse⦎| ⦏LCUsing⦎ | ⦏LCVPartLabel⦎
			| ⦏LCWhen⦎ | ⦏LCWhile⦎ | ⦏LCWith⦎
			| ⦏LCXor⦎ | ⦏LCZ⦎;
=DESCRIBE
CN\_LEX\_CLASS is the datatype used to represent the lexical classes of tokens in compliance notation.
=DESCRIBE
=ENDDOC


=DOC
datatype ⦏CN_TOKEN⦎	=	⦏CNZ⦎ of ZLex.Z_TOKEN list
			|	⦏CNText⦎ of string
			|	⦏CNString⦎ of string
			|	⦏CNKSlot⦎ of Lex.INPUT list
			|	⦏CNEos⦎;

type ⦏CN_LEX_ITEM⦎
=TYPESTRUCT
	= CN_LEX_CLASS * CN_TOKEN;
=DESCRIBE
CN\_TOKEN is the datatype used to represent the lexical tokens required in compliance notation. CN\_LEX\_ITEM is a type used by the lexical analyser for communicating to the parser the lexical information. The class (the first of the pair) is the classification of the token (the second of the pair).
=ENDDOC

\subsection{Notes on Compliance}

The specification of the concrete syntax in \cite[Volume 1]{DRA/CIS/CSE3/TR/94/27/3.0} does not spell out the syntax for specification statements. Hence the terminal $specification statement$ is not represented in the list of lexical classes, but the syntactic components are instead provided, viz: $LCGrkDelta$, $LCLSqBrack$, $LCRSqBrack$, $LCLBrace$, $LCRBrace$.

Similarly for k-slots, $LCLChevron$ and $LCRChevron$; and auxiliary expressions, $LCLStrachey$ and $LCRStrachey$.

There is no need for an lexical class for a type mark as it is lexically equivalent to an identifier.

A consequence of an ambiguity in handling primes, documented in \cite{ISS/HAT/DAZ/DTD503}, is the necessity of a lexical class to represent an identifier immediately followed by a prime; hence $LCPrimedIdentifier$. An end-of-input has also been added, $LCEos$.

Other consequences of changes to the grammar (also documented in \cite{ISS/HAT/DAZ/DTD503}) result in no requirement for lexical classes corresponding to $commagoesto$, $commaothers$, $whenothers$, $functionname$, $procedurename$, $z\_decl$, $z\_pred$ and $na$ of \cite[Volume 1]{DRA/CIS/CSE3/TR/94/27/3.0}.
\newpage

\section{Z ABSTRACT SYNTAX}
The following is implemented by the type
=INLINEFT
'a OPT
=TEX
\ with its constructors
=INLINEFT
Value
=TEX
\ and
=INLINEFT
Nil
=TEX
\ in ML.
ⓈZ
│ ⦏OPT⦎[X] ≜ {A : ℙX | ∀x, y: A⦁ x = y}
■
╒[ X ]═══════════
│ ⦏Value⦎ : X → OPT[X];
│ ⦏Nil⦎ : OPT[X]
├──────
│ ∀x: X⦁ Value x = {x} ;
│ Nil = {}
└──────────────

Since Z abstract syntax is already supported in {\ProductZ}, there is no requirement to provide specific implementations of most of the Z in this section. It is provided here mainly for the purpose of allowing the Z in this and other detailed design documents to type-check correctly.

\subsection{Z Declarations}

=DOC
type ⦏Z_ID⦎
=TYPESTRUCT
	= string;
=DESCRIBE
ⓈZ
│	[⦏Z_ID⦎]
■
=ENDDOC

=DOC
type ⦏Z_DECL⦎
=TYPESTRUCT
      = TERM;
=DESCRIBE
A Z declaration is represented as a HOL term using the primitive Z abstract machine constructor $mk\_z\_dec$. e.g. the Z declaration $x : ℤ$ is represented in {\Product} as the HOL term $ⓩⓜmk\_z\_dec([ⓩx⌝], ⓩℤ⌝)⌝⌝$ : TERM

┌⦏Z_Decl⦎[Z_EXP]────────
│	zvar : OPT[Z_ID];
│	zexp : Z_EXP
└────────────
=ENDDOC

\subsection{Z Unary Expressions}

ⓈZ
│	⦏Z_UNARY_OP⦎ ::=
│		z_unary_minus
│	|	z_real_unary_minus
│	|	z_bool_not
│	|	z_abs
│	|	z_real_abs
│	|	z_char_lit
│	|	z_string_lit
│	|	z_array_not
■


┌⦏Z_Unary_Exp⦎[Z_EXP]────────
│	zop : Z_UNARY_OP;
│	zright : Z_EXP
└───────────

\subsection{Z Binary Expressions}

ⓈZ
│	⦏Z_BIN_OP⦎ ::=
│		z_bool_and
│	|	z_bool_or
│	|	z_bool_xor
│	|	z_bool_and_then
│	|	z_bool_or_else
│	|	z_bool_eq
│	|	z_bool_noteq
│	|	z_bool_less
│	|	z_bool_less_eq
│	|	z_bool_greater
│	|	z_bool_greater_eq
│	|	z_add
│	|	z_minus
│	|	z_times
│	|	z_intdiv
│	|	z_mod
│	|	z_rem
│	|	z_expon
│	|	z_bool_mem
│	|	z_bool_notmem
│	|	z_real_add
│	|	z_real_minus
│	|	z_real_times
│	|	z_real_over
│	|	z_real_expon
│	|	z_bool_real_less
│	|	z_bool_real_less_eq
│	|	z_bool_real_greater
│	|	z_bool_real_greater_eq
│	|	z_array_and
│	|	z_array_or
│	|	z_array_xor
│	|	z_array_greater
│	|	z_array_greater_eq
│	|	z_array_less
│	|	z_array_less_eq
│	|	z_array_array_cat
│	|	z_array_elem_cat
│	|	z_elem_array_cat
■

┌⦏Z_Bin_Exp⦎[Z_EXP]─────
│	zop : Z_BIN_OP;
│	zleft, zright : Z_EXP
└───────────


\subsection{Z Function Calls}

┌⦏Z_Fun_Call⦎[Z_EXP]─────
│	zfun : Z_EXP;
│	zargs : seq Z_EXP
└───────────

\subsection{Z Binding Selections}

┌⦏Z_Selection⦎[Z_EXP]────
│	zbinding : Z_EXP;
│	zselector : Z_ID
└───────────

\subsection{Z Bindings}

┌⦏Z_Binding⦎[Z_EXP]────
│	zbinds : ℙ (Z_Decl[Z_EXP])
└───────────

\subsection{Z Expressions and Predicates}
ⓈZ
│	[⦏Z_REAL⦎]
■

ⓈZ
│	[⦏Z_STRING⦎]
■


ⓈZ
│	[⦏OTHER_Z_EXP⦎]
■

ⓈZ
│	[⦏OTHER_Z_PRED⦎]
■
=DOC
type ⦏Z_EXP⦎
=TYPESTRUCT
	= TERM;
=ENDDOC

=DOC
type ⦏Z_PRED⦎
=TYPESTRUCT
	= TERM;
=ENDDOC

ⓈZ
│	⦏Z_EXP⦎ ::=
│	z_id Z_ID | z_num ℤ | z_tfun (Z_EXP × Z_EXP) |
│	z_pfun (Z_EXP × Z_EXP) |
│	z_int_rng (Z_EXP × Z_EXP)  | z_real_rng (Z_EXP × Z_EXP)|
│	z_dom Z_EXP | z_dom_res (Z_EXP × Z_EXP) | z_inv Z_EXP |
│	z_id_rel Z_EXP | z_size Z_EXP | z_set (ℙ Z_EXP) |
│	z_set_minus (Z_EXP × Z_EXP) |
│	z_set_comp (Z_Decl[Z_EXP] × Z_PRED) | z_power (Z_EXP × Z_EXP) |
│	z_rel_comp (Z_EXP × Z_EXP) |  z_seq (seq Z_EXP) |
│	z_cross (Z_EXP × Z_EXP) | z_many_cross (seq Z_EXP) |
│	z_override (Z_EXP × Z_EXP) | z_many_union (ℙ Z_EXP) |
│	z_unary_exp (Z_Unary_Exp[Z_EXP]) | z_bin_exp (Z_Bin_Exp[Z_EXP]) |
│	z_fun_call (Z_Fun_Call[Z_EXP]) | z_selection (Z_Selection[Z_EXP]) |
│	z_maplet (Z_EXP × Z_EXP) | z_powerset Z_EXP |
│	z_binding (Z_Binding[Z_EXP]) | z_tuple (seq⋎1 Z_EXP) |
│	z_real (Z_REAL) | z_real_to_integer (Z_EXP) | z_integer_to_real (Z_EXP) |
│	z_string (Z_STRING) | z_succ | z_theta (Z_EXP) |
│	other_z_exp (OTHER_Z_EXP)
│& 	(*
■
ⓈZ
	*)	
│	⦏Z_PRED⦎ ::=
│	z_true | z_eq (Z_EXP × Z_EXP) | z_and (Z_PRED × Z_PRED) |
│	z_many_and (ℙ Z_PRED) |
│	z_elem (Z_EXP × Z_EXP) | z_notelem (Z_EXP × Z_EXP) |
│	z_noteq (Z_EXP × Z_EXP) | z_less_eq (Z_EXP × Z_EXP) |
│	z_greater (Z_EXP × Z_EXP) | z_forall ((seq Z_Decl[Z_EXP]) × Z_PRED) |
│	z_exists (ℙ Z_Decl[Z_EXP] × Z_PRED) | z_imp (Z_PRED × Z_PRED) |
│	z_mem (Z_EXP × Z_EXP) | other_z_pred (OTHER_Z_PRED)
│
■
ⓈZAX
│ ⦏zid⦎ : Z_ID ↣ Z_EXP
■


\subsection{Z Modules}

┌ ⦏Z_MODULE⦎ ───────────
│ mod_name : Z_ID
└──────────────

\subsection{Z Parents}

┌ ⦏Z_PARENTS⦎ ───────────
│ parents : ℙZ_ID
└──────────────

\subsection{Z Schemas}

┌⦏Z_Schema⦎─────
│	z_sname : Z_ID;
│	z_decls : ℙ Z_Decl[Z_EXP];
│	z_pred : Z_PRED
└─────────────
┌⦏Z_Constrained_Schema⦎─────
	z_sname : Z_ID;
│	z_decl  : Z_ID;
│	z_pred : Z_PRED
└─────────────

\subsection{Z Axiomatic Descriptions}

┌⦏Z_Ax⦎────────
│	decls : ℙ Z_Decl[Z_EXP];
│	preds : ℙ Z_PRED
└─────────────

\subsection{Verification Conditions}

┌⦏Sequent⦎────────
│	H : ℙ Z_PRED;
│	c : Z_PRED
└─────────────

ⓈZ
│	⦏VC⦎ ≜ (ℙ Z_Decl[Z_EXP] × Sequent)
■

\subsection{Z Paragraphs}

ⓈZ
│	[⦏OTHER_Z⦎]
■
ⓈZ
│	⦏Z_PARA⦎ ::=
│	z_given (Z_ID) | z_module (Z_MODULE) | z_parents (Z_PARENTS) |
│	z_eq_eq (Z_ID × Z_EXP) | z_schema (Z_Schema) |
│	z_constrained_schema(Z_Constrained_Schema) | z_ax (Z_Ax) |
│	z_vcs (ℙ VC) | other_z (OTHER_Z)
│
■
\subsection{Z Types}

┌⦏Z_Schema_Type⦎ [ Z_TYPE ] ────────
│	z_sig : seq (Z_ID × Z_TYPE)
└─────────────

ⓈZ
│	[⦏OTHER_Z_TYPE⦎]
■

ⓈZ
│	⦏Z_TYPE⦎ ::=
│	z_int_type |
│	z_real_type |
│	z_power_type (Z_TYPE) |
│	z_sch_type (Z_Schema_Type[Z_TYPE]) |
│	other_z_type (OTHER_Z_TYPE)
│
■
ⓈZAX
│	⦏z_type_of⦎ : Z_EXP → Z_TYPE
■

\newpage
\section{SPARK ABSTRACT SYNTAX}

\subsection{Expressions}

\subsubsection{Identifiers}

ID is the set of Ada Identifiers.

=DOC
type ⦏ID⦎
=TYPESTRUCT
	= string;
=DESCRIBE
ⓈZ
│	[⦏ID⦎]
■
=ENDDOC
{\em EXPANDED\_NAME} is the set of expanded names in Ada (``package.item'' etc.).
=DOC
type ⦏EXPANDED_NAME⦎
=TYPESTRUCT
	= ID list;
=ENDDOC

\subsubsection{Aggregates (positional array)}

TMARK is the set of type marks in the literate script.

=DOC
type ⦏TMARK⦎
=TYPESTRUCT
	= ID;
=DESCRIBE
ⓈZAX
│	⦏TMARK⦎ : ℙ ID
■
=ENDDOC

=DOC
type ⦏OPT_TMARK⦎
=TYPESTRUCT
      = TMARK OPT;
=DESCRIBE
ⓈZ
│ ⦏OPT_TMARK⦎ ::= opt_tmark_tmark (TMARK) | opt_tmark_none
■
=ENDDOC

Agg\_Pos is a positional array aggregate.

=DOC
type ('EXP) ⦏AGG_POS⦎
=TYPESTRUCT
      = {
	tmark : OPT_TMARK,
	comps : 'EXP list
	};
=DESCRIBE

┌⦏Agg_Pos⦎[EXP]─────────────────
│	tmark : OPT_TMARK;
│	comps : seq EXP
└─────────────────────
=ENDDOC

\subsubsection{Aggregates (positional array with others)}
Agg\_Pos\_Others is a positional array with an others part.


=DOC
type ('EXP) ⦏OTHERS⦎
=TYPESTRUCT
      = {
	others : 'EXP
	};
=DESCRIBE
┌⦏Others⦎[EXP]─────────────────
│	others : EXP
└─────────────────────
=ENDDOC


=DOC
type 'EXP ⦏AGG_POS_OTHERS⦎
=TYPESTRUCT
      = {
	agg_pos : 'EXP AGG_POS,
	others : 'EXP OTHERS
	};
=DESCRIBE
┌⦏Agg_Pos_Others⦎[EXP]─────────────
│	Agg_Pos[EXP];
│	Others[EXP]
└─────────────────────
=ENDDOC

\subsubsection{Aggregates (positional array with just others)}
Agg\_Others is an array aggregate with just an others part.
In ML, the type mark is optional (the aggregate can
only be translated into Z without it when it is contained within an enclosing
aggregate which does have a type mark).


=DOC
type 'EXP ⦏AGG_OTHERS⦎
=TYPESTRUCT
      = {
	tmark : OPT_TMARK,
	others : 'EXP OTHERS
	};
=DESCRIBE
┌⦏Agg_Others⦎[EXP]─────────────
│	tmark : OPT_TMARK;
│	Others[EXP]
└─────────────────────
=ENDDOC

\subsubsection{Aggregates (named array)}

A range can be just a range attribute which can be represented by one expression. To support this, we introduce a type constructor for a range attribute.

=DOC
type 'EXP ⦏RANGELOHI⦎
=TYPESTRUCT
      = {
	lo : 'EXP,
	hi : 'EXP
	};
=DESCRIBE
┌⦏Range⦎[EXP]────────────
│	lo, hi : EXP
└─────────────────────
=ENDDOC
=SML
datatype 'EXP ⦏RANGE⦎ =
			⦏RRange⦎ of 'EXP RANGELOHI
		|	⦏RRangeAttr⦎ of 'EXP;
=TEX

Agg\_Choice is an aggregate choice with terms separated by vertical bars.

The datatype for AGG\_CHOICE is introduced in section \ref{datatypedefs}.

ⓈZ
│	[⦏AGG_CHOICE⦎]
■

Generic free type definitions are not permitted in Z, so for AGG\_CHOICE we write the following (as per \cite{Spivey92}).

╒[EXP]════════════════════════════
│	⦏agg_choice_range⦎ : Range[EXP] ↣ AGG_CHOICE;
│	⦏agg_choice_single⦎ : EXP ↣ AGG_CHOICE
├─────────────────────
│	disjoint ⟨ran agg_choice_range, ran agg_choice_single⟩ ∧
│
│	(∀ W : ℙ AGG_CHOICE ⦁
│	agg_choice_range ⦇Range[EXP]⦈ ∪ agg_choice_single ⦇EXP⦈ ⊆ W
│	⇒ AGG_CHOICE ⊆ W)
└──────────────────────

A discrete range can be a type mark with an optional range constraint. The abstract syntax is modified to cover this.
=DOC
type 'EXP ⦏DISCRETE_RANGE_CONSTRAINED⦎
=TYPESTRUCT
      = {
	tmark : TMARK,
	range : 'EXP RANGE
	};
=DESCRIBE
=ENDDOC

=DOC
type ('AGG_CHOICE, 'EXP) ⦏NAMED_ASSOC⦎
=TYPESTRUCT
      = {
	choice : 'AGG_CHOICE list,
	comp : 'EXP
	};
=DESCRIBE
┌⦏Named_Assoc⦎[EXP]─────────────────
│	choices : ℙ AGG_CHOICE;
│	comp : EXP
└─────────────────────
=ENDDOC

Agg\_Named models a named array aggregate.
In ML, the type mark is optional (the aggregate cannot be translated into Z without it).


=DOC
type ('AGG_CHOICE, 'EXP) ⦏AGG_NAMED⦎
=TYPESTRUCT
      = {
	tmark : OPT_TMARK,
	named_assocs : ('AGG_CHOICE, 'EXP) NAMED_ASSOC list
	};
=DESCRIBE
┌⦏Agg_Named⦎[EXP]─────────────
│	tmark : OPT_TMARK;
│	named_assocs : ℙ Named_Assoc[EXP]
└─────────────────────
=ENDDOC
\subsubsection{Aggregates (named array with others)}

Agg\_Named\_Others is a named array aggregate with an others part.
In ML, the type mark (if present) is inside the $agg\_named$ component.

=DOC
type ('AGG_CHOICE, 'EXP) ⦏AGG_NAMED_OTHERS⦎
=TYPESTRUCT
      = {
	agg_named : ('AGG_CHOICE, 'EXP) AGG_NAMED,
	others : ('EXP) OTHERS
	};
=DESCRIBE
┌⦏Agg_Named_Others⦎[EXP]──────────────
│	tmark : OPT_TMARK;
│	Agg_Named[EXP];
│	Others[EXP]
└─────────────────────
=ENDDOC
\subsubsection{Aggregates (positional record)}

Rec\_Agg\_Pos is a positional record aggregate.

In ML, the type mark is optional (the aggregate cannot be translated into Z without it).

=DOC
type ('EXP) ⦏REC_AGG_POS⦎
=TYPESTRUCT
      = {
	tmark : OPT_TMARK,
	comps : 'EXP list
	};
=DESCRIBE
┌⦏Rec_Agg_Pos⦎[EXP]─────────────────
│	tmark : TMARK;
│	comps : seq EXP
└─────────────────────
=ENDDOC
\subsubsection{Aggregates (named record)}
Rec\_Agg\_Named is a named record aggregate.
The type of $named\_assocs$ is replaced with that used in named array aggregates to support the full syntax.

In ML, the type mark is optional (the aggregate cannot be translated into Z without it).

=DOC
type ('AGG_CHOICE,'EXP) ⦏REC_AGG_NAMED⦎
=TYPESTRUCT
      = {
	tmark : OPT_TMARK,
	named_assocs : ('AGG_CHOICE, 'EXP) NAMED_ASSOC list
	};
=DESCRIBE
┌⦏Rec_Agg_Named⦎[EXP]─────────────────
│	tmark : TMARK;
│	named_assocs : ℙ (ID × EXP)
└─────────────────────
=ENDDOC


\subsubsection{Unary Operations}

=DOC
datatype ⦏UNARY_OP⦎ =
			⦏UOSparkUnaryAdd⦎
		|	⦏UOSparkUnaryMinus⦎
		|	⦏UOSparkNot⦎
		|	⦏UOSparkAbs⦎;
=DESCRIBE
ⓈZ
│	⦏UNARY_OP⦎ ::=
│	spark_unary_add | spark_unary_minus | spark_not | spark_abs
■
=ENDDOC



=DOC
type ('EXP) ⦏UNARY_EXP⦎
=TYPESTRUCT
      = {
	uop : UNARY_OP,
	right : 'EXP
	};
=DESCRIBE
┌⦏Unary_Exp⦎[EXP]─────────────────
│	op : UNARY_OP;
│	right : EXP
└─────────────────────
=ENDDOC


\subsubsection{Binary Expressions}


The binary operators $BOSparkAndThen$, $BOSparkOrElse$ and $BOSparkConcat$ have been added.
=DOC
datatype ⦏BIN_OP⦎ =
			⦏BOSparkAnd⦎ | ⦏BOSparkAndThen⦎
		|	⦏BOSparkOr⦎ | ⦏BOSparkOrElse⦎ | ⦏BOSparkXor⦎
		|	⦏BOSparkEq⦎ | ⦏BOSparkNotEq⦎
		|	⦏BOSparkLess⦎ | ⦏BOSparkLessEq⦎
		|	⦏BOSparkGreater⦎ | ⦏BOSparkGreaterEq⦎
		|	⦏BOSparkAdd⦎ | ⦏BOSparkMinus⦎ | ⦏BOSparkTimes⦎
		|	⦏BOSparkDiv⦎ | ⦏BOSparkMod⦎ | ⦏BOSparkRem⦎
		|	⦏BOSparkExpon⦎
		|	⦏BOSparkMem⦎ | ⦏BOSparkNotMem⦎
		|	⦏BOSparkConcat⦎;
=DESCRIBE
ⓈZ
│	⦏BIN_OP⦎ ::=
│	spark_and | spark_or | spark_xor | spark_and_then | spark_or_else |
│	spark_eq | spark_noteq | spark_less | spark_less_eq | spark_greater |
│	spark_greater_eq | spark_add | spark_minus | spark_times | spark_intdiv |
│	spark_mod | spark_rem | spark_expon | spark_mem | spark_notmem |
│	spark_over | spark_cat
■
=ENDDOC


=DOC
type 'EXP ⦏BIN_EXP⦎
=TYPESTRUCT
      = {
	bop : BIN_OP,
	left : 'EXP,
	right : 'EXP
	};
=DESCRIBE
┌⦏Bin_Exp⦎[EXP]─────────────────
│	op : BIN_OP;
│	left, right : EXP
└─────────────────────
=ENDDOC

Mem\_Range is the membership (or non-membership) of a range.


=DOC
type ⦏MEM_OP⦎
=TYPESTRUCT
	= BIN_OP;
=DESCRIBE
ⓈZ
│	⦏MEM_OP⦎ ≜ {spark_mem, spark_notmem}
■
=ENDDOC


$op$ is a reserved word in Standard ML; hence we rename $op$ to $mop$.

=DOC
type ('EXP) ⦏MEM_RANGE⦎
=TYPESTRUCT
      = {
	left : 'EXP,
	mop : MEM_OP,
	range : 'EXP RANGE
	};
=DESCRIBE
┌⦏Mem_Range⦎[EXP]─────────────────
│	left : EXP;
│	op : MEM_OP;
│	Range[EXP]
└─────────────────────
=ENDDOC


\subsubsection{Attributes}
Attribute models Ada attributes.

ATTRIB denotes the attribute designators FIRST, LAST, SUCC, PRED, POS, VAL, LENGTH and RANGE.


=DOC
type ⦏ATTRIB⦎
=TYPESTRUCT
	= ID;
=DESCRIBE
ⓈZAX
│	⦏fst⦎, ⦏lst⦎, ⦏suc⦎, ⦏pred⦎, ⦏pos⦎, ⦏val⦎, ⦏length⦎, ⦏range⦎, ⦏digits⦎, ⦏delta⦎ : ID
■
ⓈZ
│	⦏ATTRIB⦎ ≜ {fst, lst, suc, pred, pos, val, length, range, digits, delta}
■
ⓈZAX
│ ⦏aft⦎, ⦏base⦎, ⦏emax⦎, ⦏epsilon⦎,
│ ⦏fore⦎, ⦏large⦎, ⦏machine_emax⦎, ⦏machine_emin⦎,
│ ⦏machine_mantissa⦎, ⦏machine_overflows⦎,
│ ⦏machine_radix⦎, ⦏machine_rounds⦎,
│ ⦏mantissa⦎, ⦏safe_emax⦎, ⦏safe_large⦎, ⦏safe_small⦎,
│ ⦏size⦎, ⦏small⦎ : ID
■
ⓈZ
│ ⦏OTHER_ATTRIB⦎ ≜ {
│  aft, base, emax, epsilon,
│  fore, large, machine_emax, machine_emin,
│  machine_mantissa, machine_overflows, machine_radix, machine_rounds,
│  mantissa, safe_emax, safe_large, safe_small,
│  size, small}
■
=ENDDOC

ATTRIB\_DESIG models the attribute designators.

Generic free type definitions are not permitted in Z, so for ATTRIB\_DESIG we write the following (as per \cite{Spivey92}).

ⓈZ
│	[⦏ATTRIB_DESIG⦎]
■

╒[EXP]════════════════════════════
│	⦏attrib⦎ : ATTRIB ∪ OTHER_ATTRIB ↣ ATTRIB_DESIG;
│	⦏attrib_arg⦎ : (ATTRIB × EXP) ↣ ATTRIB_DESIG
├─────────────────────
│	disjoint ⟨ran attrib, ran attrib_arg⟩ ∧
│
│	(∀ W : ℙ ATTRIB_DESIG ⦁
│	attrib ⦇ATTRIB ∪ OTHER_ATTRIB⦈ ∪ attrib_arg ⦇ATTRIB × EXP⦈ ⊆ W
│	⇒ ATTRIB_DESIG ⊆ W)
└──────────────────────



The datatype for ATTRIB\_DESIG is declared in section \ref{TypeDefExpr}.


The prefix can in fact be a name (i.e., an expression).
=DOC
type ('EXP,'ATTRIB_DESIG) ⦏ATTRIBUTE⦎
=TYPESTRUCT
      = {
	prefix : 'EXP,
	attribute_desig : 'ATTRIB_DESIG
	};
=DESCRIBE
┌⦏Attribute⦎─────────────────
│	prefix : ID;
│	attrib_desig : ATTRIB_DESIG
└─────────────────────
=ENDDOC

\subsubsection{Indexed Component}
Indexed\_Comp models an array component.


=DOC
type ('EXP) ⦏INDEXED_COMP⦎
=TYPESTRUCT
      = {
	prefix : 'EXP,
	index : 'EXP
	};
=DESCRIBE
┌⦏Indexed_Comp⦎[EXP]─────────────────
│	prefix : EXP;
│	index : seq⋎1 EXP
└─────────────────────
Due to the overloading of round brackets in the Ada concrete syntax,
the sequence of expressions is represented by the parser as a positional
array aggregate ---  a single expression. The sequence given in the
specification by {\it index} is then the sequence of components of
this aggregate.
=ENDDOC

\subsubsection{Selected Component}
Selected\_Comp is a record component.


=DOC
type ('EXP) ⦏SELECTED_COMP⦎
=TYPESTRUCT
      = {
	prefix : 'EXP,
	selector : ID
	};
=DESCRIBE
┌⦏Selected_Comp⦎[EXP]─────────────────
│	prefix : EXP;
│	selector : ID
└─────────────────────
=ENDDOC

\subsubsection{Function Calls}
Fun\_Call is a function call.


=DOC
type ('EXP) ⦏FUN_CALL⦎
=TYPESTRUCT
      = {
	fun_name : ID,
	args : 'EXP list
	};
=DESCRIBE
┌⦏Fun_Call⦎[EXP]─────────────────
│	fun_name : ID;
│	args : seq EXP
└─────────────────────
=ENDDOC

\subsubsection{Qualified Expressions}


=DOC
type 'EXP ⦏QUALIFIED_EXPRESSION⦎
=TYPESTRUCT
      = {
	tmark : TMARK,
	exp : 'EXP
	};
=DESCRIBE
┌⦏Qualified_Exp⦎[EXP]─────────────────
│	ex : EXP
└─────────────────────
The ML formulation preserves the type mark for inclusion in the SPARK program.
=ENDDOC
\subsubsection{Type Conversions}


=DOC
type 'EXP ⦏TYPE_CONVERSION⦎
=TYPESTRUCT
      = {
	tmark : TMARK,
	exp : 'EXP
	};
=DESCRIBE
┌⦏Type_Conv⦎[EXP]─────────────────
│	tm : TMARK;
│	ex : EXP
└─────────────────────
The ML names are slightly less terse than the Z ones for historical reasons.
=ENDDOC
\subsubsection{Numeric Literals}
INT\_LIT comprises the integer literals
and REAL\_LIT comprises the real literals.



=DOC
type ⦏INT_REAL_LIT⦎
=TYPESTRUCT
	= string;
=DESCRIBE
We use strings to represent numeric literals, either integer or real,
so that the precise lexical form of the input can be reproduced in the SPARK program.
Thus the above type NUM\_LIT is the ML representation of both integer and
real literals.
The string is converted into a number when an expression containing a literal
is converted into Z.
ⓈZ
│	[⦏INT_LIT⦎]
■
ⓈZ
│	[⦏REAL_LIT⦎]
■
=ENDDOC

\subsubsection{Character Literals}
CHAR\_LIT comprises the character literals.


=DOC
type ⦏CHAR_LIT⦎
=TYPESTRUCT
	= string;
=DESCRIBE
ⓈZ
│	[⦏CHAR_LIT⦎]
■
=ENDDOC


\subsubsection{String Literals}
STRING\_LIT comprises the string literals.


=DOC
type ⦏STRING_LIT⦎
=TYPESTRUCT
	= string;
=DESCRIBE
ⓈZ
│	[⦏STRING_LIT⦎]
■
=ENDDOC


\subsubsection{Auxiliary Expressions}
In the Compliance Notation, a SPARK expression can also be a Z expression (auxiliary expression).

In their use, they are expressions so appear as a branch of expressions.

\subsubsection{Type Definition for Expressions}\label{TypeDefExpr}

In order to reproduce the SPARK program as the user entered it, it is necessary to store bracketing information in the abstract syntax. Also qualified expressions, type conversions, string and character literals have been added.

The Auxiliary expression is represented as a parsed (but not type-checked) Z term. The type inference occurs during VC generation. (Note {\it id} is a toolkit operator in Z, therefore
{\it Id} is used instead.)

The datatype for EXP is introduced in section \ref{datatypedefs}.

ⓈZ
│	[⦏OTHER_EXP⦎]
■

ⓈZ
│	⦏EXP⦎ ::=	
│		Id ID | int INT_LIT | array_agg_pos (Agg_Pos[EXP]) |
│		array_agg_pos_others (Agg_Pos_Others[EXP]) |
│		array_agg_others (Agg_Others[EXP]) |
│		array_agg_named (Agg_Named[EXP]) |
│		array_agg_named_others (Agg_Named_Others[EXP]) |
│		rec_agg_pos (Rec_Agg_Pos[EXP]) |
│		rec_agg_named (Rec_Agg_Named[EXP]) |
│		unary_exp (Unary_Exp[EXP]) | bin_exp (Bin_Exp[EXP]) |
│		mem_range (Mem_Range[EXP]) | attribute Attribute |
│		indexed_comp (Indexed_Comp[EXP]) |
│		selected_comp (Selected_Comp[EXP]) |
│		fun_call (Fun_Call[EXP]) |
│		qualified_exp (Qualified_Exp[EXP]) |
│		type_conv (Type_Conv[EXP]) |
│		char (CHAR_LIT) | string (STRING_LIT) | real (REAL_LIT) |
│		auxiliary_exp (Z_EXP) | other_exp (OTHER_EXP)
■

\subsection{Basic Declarations}

The Z specification of the abstract syntax uses a given set declaration to act as a forward declaration of the free type $EXP$, permitting the free type to involve recursion through schema constructions.
Unfortunately, this style is not considered to be type correct in \ProductZ; this is readily circumvented by making the schema constructions generic where necessary.



\subsubsection{Constants}
Const\_Decl models constant declarations.


It is useful to keep a list of the constants declared in the same constant declaration for reproducibility. The const component is therefore implemented as a list.
The type mark is optional to support named number declarations.
=DOC
type 'EXP ⦏CONST_DECL⦎
=TYPESTRUCT
      = {
	consts : ID list,
	tm : TMARK OPT,
	expr : 'EXP
	};
=DESCRIBE
┌⦏Const_Decl⦎[EXP]─────────────────
│	const : ID;
│	tm : OPT[TMARK];
│	expr : EXP
└─────────────────────
=ENDDOC

\subsubsection{Enumerated Types}
Enum\_Type\_Def models enumerated types.


=DOC
type ⦏ENUM_TYPE_DEF⦎
=TYPESTRUCT
      = {
	vals : ID list
	};
=DESCRIBE
┌⦏Enum_Type_Def⦎────────────
│	vals : seq ID
└─────────────────────
=ENDDOC

\subsubsection{Array Types}
Array\_Def models array types.

=DOC
type ⦏ARRAY_DEF⦎
=TYPESTRUCT
      = {
	index : TMARK list,
	comp : TMARK
	};
=DESCRIBE
┌⦏Array_Def⦎────────────
│	index : seq⋎1 TMARK;
│	comp : TMARK
└─────────────────────
=ENDDOC


\subsubsection{Record Types}

Var\_Decl is an Ada variable declaration.

In order to maintain the reproducability of the input, it is necessary to include all the identifiers together in a VAR\_DECL.
=DOC
type ⦏VAR_DECL⦎
=TYPESTRUCT
      = {
	vars : ID list,
	tmark : TMARK
	};
=DESCRIBE
┌⦏Var_Decl⦎────────────
│	var : ID;
│	tmark : TMARK
└─────────────────────
=ENDDOC


Record\_Type\_Def models record types.

=DOC
datatype 'EXP ⦏COMP_CONSTRAINT⦎ =
		⦏CCNoCon⦎
	|	⦏CCIndexCon⦎ of 'EXP list
	|	⦏CCDiscCon⦎ of 'EXP list;
type 'EXP ⦏COMP_DECL⦎
=TYPESTRUCT
      = VAR_DECL * 'EXP COMP_CONSTRAINT;
=DESCRIBE
ⓈZ
⦏COMP_SUB_IND⦎ ::=
		comp_sub_ind_tmark (TMARK)
	|	comp_sub_ind_range (EXP × EXP)
■
ⓈZ
⦏COMP_CONSTRAINT⦎ ::=
		comp_no_con
	|	comp_index_con (seq COMP_SUB_IND)
	|	comp_disc_con (ID ⇸ EXP)
■
┌ ⦏Comp_Decl⦎ ───────────
│ 	Var_Decl;
│	constraint : COMP_CONSTRAINT
└──────────────
In the implementation, the type {\it EXP} is wide enough to carry the semantics
of a {\it COMP\_SUB\_IND}.
=ENDDOC
=DOC
type ⦏DISCRIMINANT_SPECIFICATION⦎
=TYPESTRUCT
      = VAR_DECL;
=DESCRIBE
=ENDDOC
=DOC
type 'EXP ⦏RECORD_TYPE_DEF⦎
=TYPESTRUCT
      = {
	decl : 'EXP COMP_DECL list,
	disc : DISCRIMINANT_SPECIFICATION list
	};
=DESCRIBE
┌⦏Record_Type_Def⦎────────────
│	decl : seq Comp_Decl;
│	disc : seq Var_Decl
└─────────────────────
The ML representation covers both schemas (the first corresponding
to an empty list in the {\it disc} component).
=ENDDOC

\subsubsection{Integer and Modular Types}

An integer type is characterised by its range.
Ranges are already catered for.
A modular type is characterised by its modulus.

=DOC
type 'EXP ⦏MODULUS⦎
=TYPESTRUCT
      = {
	modulus: 'EXP
	};
=DESCRIBE
┌⦏Modulus⦎────────────
│	modulus : EXP
└─────────────────────
=ENDDOC

\subsubsection{Real Types}
=DOC
type 'EXP ⦏FLOATING_POINT_CONSTRAINT⦎
=TYPESTRUCT
      = {
	exp : 'EXP,
	range : 'EXP RANGE OPT
	};
=DESCRIBE
┌⦏Floating_Type_Def_Range⦎────────────
│	digits : EXP;
│	Range[EXP]
└─────────────────────

┌⦏Floating_Type_Def_No_Range⦎────────────
│	digits : EXP
└─────────────────────
=ENDDOC
=DOC
type 'EXP ⦏FIXED_POINT_CONSTRAINT⦎
=TYPESTRUCT
	= 'EXP FLOATING_POINT_CONSTRAINT;
=DESCRIBE
┌⦏Fixed_Type_Def⦎────────────
│	delta : EXP;
│	Range[EXP]
└─────────────────────
=ENDDOC

=DOC
type 'EXP ⦏FLOATING_TYPE_DEF⦎
=TYPESTRUCT
	= 'EXP FLOATING_POINT_CONSTRAINT;
=DESCRIBE
=ENDDOC

=DOC
type 'EXP ⦏FIXED_TYPE_DEF⦎
=TYPESTRUCT
	= 'EXP FIXED_POINT_CONSTRAINT;
=DESCRIBE
=ENDDOC


\subsubsection{Type Definitions}

The datatype for TYPE\_DEF is introduced in section \ref{datatypedefs}.
ⓈZ
⦏TYPE_DEF⦎ ::= enum_type_def Enum_Type_Def | int_type_def (Range[EXP]) |
		modular_type_def Modulus
		uncon_array_def Array_Def | con_array_def Array_Def |
		record_type_def Record_Type_Def |
		fixed_type_def Fixed_Type_Def |
		floating_type_def_range Floating_Type_Def_Range |
		floating_type_def_no_range Floating_Type_Def_No_Range
■

An additional constructor is provided for private types and for reals to support the complete syntax.

\subsubsection{Type Declarations}
Type\_Decl is a type declaration, that is a type definition together with its name.
=DOC
type 'TYPE_DEF ⦏TYPE_DECL⦎
=TYPESTRUCT
      = {
	name : ID,
	type_def : 'TYPE_DEF
	};
=DESCRIBE
┌⦏Type_Decl⦎────────────
│	name : ID;
│	type_def : TYPE_DEF
└─────────────────────
=ENDDOC

\subsubsection{Subtypes}
Subtype\_Decl models subtype declarations.

The datatype for CONSTRAINT is introduced in section \ref{datatypedefs}.

ⓈZ
⦏CONSTRAINT⦎ ::= range_con (Range[EXP])
	| floating_con Floating_Type_Def_Range
	| fixed_con Fixed_Type_Def
	| index_con (seq TMARK)
	| discriminant_con (ID ⇸ EXP)
	| no_con
■

Sub\_Ind is a subtype indication.


=DOC
type 'CONSTRAINT ⦏SUB_IND⦎
=TYPESTRUCT
      = {
	tmark : TMARK,
	con : 'CONSTRAINT
	};
=DESCRIBE
┌⦏Sub_Ind⦎─────────────────
│	tmark : TMARK;
│	con : CONSTRAINT
└─────────────────────
=ENDDOC


=DOC
type 'CONSTRAINT ⦏SUBTYPE_DECL⦎
=TYPESTRUCT
      = {
	name : ID,
	sub_ind : 'CONSTRAINT SUB_IND
	};
=DESCRIBE
┌⦏Subtype_Decl⦎─────────────────
│	name : ID;
│	Sub_Ind
└─────────────────────
=ENDDOC


\subsubsection{Deferred Constants}

Abstract syntax is also required for deferred constants.
=DOC
type ⦏DEFERRED_CONST_DECL⦎
=TYPESTRUCT
      = {
	consts : ID list,
	tmark : TMARK
	};
=DESCRIBE
=ENDDOC
\subsubsection{Private Types}
Private types are part of the syntax.
=DOC
type ⦏PRIVATE_TYPE_DECL⦎
=TYPESTRUCT
      = {
	id : ID,
	disc : DISCRIMINANT_SPECIFICATION list,
	limited : bool
	};
=DESCRIBE
=ENDDOC

\subsubsection{Pragma}\label{pragma}
=DOC
type ('AGG_CHOICE, 'EXP) ⦏PRAGMA⦎
=TYPESTRUCT
      = {id : ID,
	  args : ('AGG_CHOICE OPT * 'EXP) list};
=DESCRIBE
This type gives the abstract syntax of SPARK pragmas (which are just treated as data to be written out to the SPARK program by the compliance tool).
=ENDDOC
\subsubsection{Labels}\label{labels}
Labels can appear next to k-slots or specification statements.
=DOC
type ⦏LABEL⦎
=TYPESTRUCT
      = string;
=DESCRIBE
=ENDDOC
\subsubsection{K-Slots}\label{kslots}
K-Slots are required in the abstract syntax as place markers so that when the SPARK program is reproduced from the abstract syntax, the expansions can be put back into the correct places.
=DOC
type ⦏K_SLOT⦎
=TYPESTRUCT
      = {
	content : string,
	label : LABEL
	};
=DESCRIBE
=ENDDOC
\subsubsection{Annotation}\label{annotation}
=DOC
datatype ⦏ANN⦎
      = ⦏ANString⦎ of string | ⦏ANKSlot⦎ of K_SLOT;
type ⦏ANNOTATION⦎
=TYPESTRUCT
      = ANN list;
=DESCRIBE
These types gives the abstract syntax of SPARK annotations (which are just treated as data to be written out to the SPARK program by the compliance tool).
A k-slot can be used to defer presentation of the text of an annotation.
=ENDDOC
\subsubsection{Basic Declarations}

The datatype for BASIC\_DECL is introduced in section \ref{datatypedefs}.

ⓈZ
⦏BASIC_DECL⦎ ::= const_decl (Const_Decl[EXP]) | type_decl Type_Decl |
		subtype_decl Subtype_Decl
■

\subsection{Datatypes for Free Type Definitions}\label{datatypedefs}

=SML
datatype ⦏CONSTRAINT⦎ =
			⦏CRange⦎ of EXP RANGE
		|	⦏CFloating⦎ of EXP FLOATING_POINT_CONSTRAINT
		|	⦏CFixed⦎ of EXP FIXED_POINT_CONSTRAINT
		|	⦏CIndex⦎ of EXP list
		|	⦏CDiscriminant⦎ of EXP list
		|	⦏CNoCon⦎
and ⦏CASE_CHOICE⦎ =
				⦏CCCaseExp⦎ of EXP
			|	⦏CCCaseRange⦎ of DISCRETE_RANGE
and ⦏BASIC_DECL⦎ =
			⦏BDConstDecl⦎ of (EXP) CONST_DECL
		|	⦏BDDeferredConstDecl⦎ of DEFERRED_CONST_DECL
		|	⦏BDTypeDecl⦎ of (TYPE_DEF) TYPE_DECL
		|	⦏BDVarDecl⦎ of VAR_DECL
		|	⦏BDVarDeclInit⦎ of (VAR_DECL * EXP)
		|	⦏BDSubtypeDecl⦎ of (CONSTRAINT) SUBTYPE_DECL
		|	⦏BDPrivateTypeDecl⦎ of PRIVATE_TYPE_DECL
		|	⦏BDPragma⦎ of (AGG_CHOICE, EXP) PRAGMA
		|	⦏BDAnnotation⦎ of ANNOTATION
and ⦏ATTRIB_DESIG⦎ =
			⦏ADAttrib⦎ of ATTRIB
		|	⦏ADAttribArg⦎ of (ATTRIB * EXP)
and ⦏DISCRETE_RANGE⦎ =
			⦏DRRange⦎ of EXP RANGE
		|	⦏DRConstrained⦎ of EXP DISCRETE_RANGE_CONSTRAINED
and ⦏AGG_CHOICE⦎ =
			⦏ACAggChoiceRange⦎ of DISCRETE_RANGE
		|	⦏ACAggChoiceSingle⦎ of EXP

and ⦏TYPE_DEF⦎ =
			⦏TDEnumTypeDef⦎ of ENUM_TYPE_DEF
		|	⦏TDIntTypeDef⦎ of EXP RANGE
		|	⦏TDModularTypeDef⦎ of EXP MODULUS
		|	⦏TDFloatingTypeDef⦎ of EXP FLOATING_TYPE_DEF
		|	⦏TDFixedTypeDef⦎ of EXP FIXED_TYPE_DEF
		|	⦏TDUnconArrayDef⦎ of ARRAY_DEF
		|	⦏TDConArrayDef⦎ of ARRAY_DEF
		|	⦏TDRecordTypeDef⦎ of EXP RECORD_TYPE_DEF

and ⦏EXP⦎ =
		⦏EId⦎ of ID
	|	⦏EIntReal⦎ of INT_REAL_LIT
	|	⦏EArrayAggPos⦎ of EXP AGG_POS
	|	⦏EArrayAggPosOthers⦎ of EXP AGG_POS_OTHERS
	|	⦏EArrayAggOthers⦎ of EXP AGG_OTHERS
	|	⦏EArrayAggNamed⦎ of (AGG_CHOICE,EXP) AGG_NAMED
	|	⦏EArrayAggNamedOthers⦎ of
			(AGG_CHOICE,EXP) AGG_NAMED_OTHERS
	|	⦏ERecAggPos⦎ of EXP AGG_POS
	|	⦏ERecAggNamed⦎ of (AGG_CHOICE,EXP) REC_AGG_NAMED
	|	⦏EUnaryExp⦎ of EXP UNARY_EXP
	|	⦏EBinExp⦎ of EXP BIN_EXP
	|	⦏EMemRange⦎ of EXP MEM_RANGE
	|	⦏EAttribute⦎ of (EXP,ATTRIB_DESIG) ATTRIBUTE
	|	⦏EIndexedComp⦎ of EXP INDEXED_COMP
	|	⦏ESelectedComp⦎ of EXP SELECTED_COMP
	|	⦏EFunCall⦎ of EXP FUN_CALL
	|	⦏EAuxiliaryExp⦎ of ZUserInterfaceSupport.Z_TM
	|	⦏EQualifiedExp⦎ of EXP QUALIFIED_EXPRESSION
	|	⦏ETypeConversion⦎ of EXP TYPE_CONVERSION
	|	⦏EBracketed⦎ of EXP
	|	⦏EStringLiteral⦎ of STRING_LIT
	|	⦏ECharacterLiteral⦎ of CHAR_LIT
	|	⦏EDiscreteRange⦎ of DISCRETE_RANGE;
=TEX
The constructor {\it EDiscreteRange} above is introduced for the convenience
of the parser. It will never appear in an expression formed from syntactically
correct Ada.
\subsection{Derived Abstract Syntax for Basic Declarations}
=DOC
datatype ⦏SI_DISCRETE_RANGE⦎ =
		⦏SIDiscreteRangeSubInd⦎ of CONSTRAINT SUB_IND
	|	⦏SIDiscreteRangeRange⦎ of EXP RANGE;
=DESCRIBE
ⓈZ
│ ⦏SI_Discrete_Range⦎ ::=
│	⦏si_discrete_range_subind⦎ Sub_Ind
│ |	⦏si_discrete_range_range⦎ (Range[EXP])
■
=ENDDOC
=DOC
datatype ⦏SI_CONSTRAINT⦎ =
		⦏SIRangeCon⦎ of EXP RANGE
	|	⦏SIFixedCon⦎ of EXP FIXED_POINT_CONSTRAINT
	|	⦏SIFloatingCon⦎ of EXP FLOATING_POINT_CONSTRAINT
	|	⦏SIIndexCon⦎ of SI_DISCRETE_RANGE list
	|	⦏SIDiscriminantCon⦎ of EXP list
	|	⦏SINoCon⦎;
=DESCRIBE
ⓈZ
│ ⦏SI_CONSTRAINT⦎ ::=
│ 	⦏si_range_con⦎ (Range[EXP]) |  ⦏si_fixed_con Fixed_Type_Def⦎ |
│	⦏si_floating_con⦎ Floating_Type_Def_Range |
│	⦏si_index_con⦎ (seq SI_Discrete_Range) |
│	⦏si_discriminant_con⦎ (ID ⇸ EXP) | ⦏si_no_con⦎
■
The context free parser is unable to distinguish between index constraints and discriminant
constraints, nor can it disentangle named parameter associations in discriminant
constraints. It produces a discriminant constraint containing a single expression which
is an aggregate representing the construct in brackets that was the concrete syntax encountered
as the constraint.
=ENDDOC
=DOC
type ⦏SI_SUB_IND⦎
=TYPESTRUCT
	= {	tmark : TMARK,
		con : SI_CONSTRAINT
	};
=DESCRIBE
┌⦏SI_Sub_Ind⦎──
│  tmark : TMARK;
│  con  : SI_CONSTRAINT
└─
=ENDDOC
=DOC
type ⦏SI_CONST_DECL⦎
=TYPESTRUCT
	= {	consts : ID list,
		t : SI_SUB_IND OPT,
		expr : EXP
	};
=DESCRIBE
┌⦏SI_Const_Decl⦎───
│ const : ID;
│ t : OPT[SI_Sub_Ind];
│ expr : EXP
└──────────
=ENDDOC
=DOC
type ⦏SI_ARRAY_DEF⦎
=TYPESTRUCT
	= {	index : SI_DISCRETE_RANGE list,
		comp : SI_SUB_IND
	};
=DESCRIBE
┌⦏SI_Array_Def⦎──
│ index : seq⋎1 SI_Discrete_Range;
│ comp : SI_Sub_Ind
└──
=ENDDOC
=DOC
type ⦏SI_VAR_DECL⦎
=TYPESTRUCT
	= {	vars : ID list,
		t : SI_SUB_IND
	};
=DESCRIBE
┌⦏SI_Var_Decl⦎───
│ var : ID;
│ t : SI_Sub_Ind
└──
=ENDDOC
=DOC
type ⦏SI_RECORD_TYPE_DEF⦎
=TYPESTRUCT
	= {
	decl : SI_VAR_DECL list,
	disc : DISCRIMINANT_SPECIFICATION list
	};
=DESCRIBE

┌⦏SI_Record_Type_Def⦎───
│ decl : seq SI_Var_Decl;
│ disc : seq Var_Decl
└
=ENDDOC

=DOC
datatype ⦏SI_TYPE_DEF⦎ =
		⦏SIEnumTypeDef⦎ of ENUM_TYPE_DEF
	|	⦏SIIntTypeDef⦎ of EXP RANGE
	|	⦏SIModularTypeDef⦎ of EXP MODULUS
	|	⦏SIUnconArrayDef⦎ of SI_ARRAY_DEF
	|	⦏SIConArrayDef⦎ of SI_ARRAY_DEF
	|	⦏SIRecordTypeDef⦎ of SI_RECORD_TYPE_DEF
	|	⦏SIFloatingTypeDef⦎ of EXP FLOATING_TYPE_DEF
	|	⦏SIFixedTypeDef⦎ of EXP FIXED_TYPE_DEF	
	|	⦏SIDerivedTypeDef⦎ of SI_SUB_IND;

=DESCRIBE
ⓈZ
│  ⦏SI_TYPE_DEF⦎ ::=
│    ⦏si_enum_type_def⦎ Enum_Type_Def | ⦏si_int_type_def⦎ (Range[EXP]) |
│    ⦏si_modular_type_def⦎ Modulus |
│    ⦏si_uncon_array_def⦎ SI_Array_Def | ⦏si_con_array_def⦎ SI_Array_Def |
│    ⦏si_record_type_def⦎ SI_Record_Type_Def |
│    ⦏si_fixed_type_def⦎ Fixed_Type_Def |
│    ⦏si_floating_type_def_range⦎ Floating_Type_Def_Range |
│    ⦏si_floating_type_def_no_range⦎ Floating_Type_Def_No_Range
■
=ENDDOC
=DOC
type ⦏SI_TYPE_DECL⦎
=TYPESTRUCT
	= {	name : ID,
		type_def : SI_TYPE_DEF
};
=DESCRIBE
┌⦏SI_Type_Decl⦎──
│ name : ID;
│ type_def : SI_TYPE_DEF
└──
=ENDDOC
=DOC
type ⦏SI_SUBTYPE_DECL⦎
=TYPESTRUCT
	= {	name : ID,
		type_def : SI_SUB_IND
};
=DESCRIBE
┌⦏SI_Subtype_Decl⦎──
│  name : ID;
│  SI_Sub_Ind
└──
=ENDDOC
=DOC
datatype ⦏SI_BASIC_DECL⦎ =
		⦏SIConstDecl⦎ of SI_CONST_DECL
	|	⦏SIDeferredConstDecl⦎ of DEFERRED_CONST_DECL
	|	⦏SITypeDecl⦎ of SI_TYPE_DECL
	|	⦏SIVarDecl⦎ of SI_VAR_DECL
	|	⦏SIVarDeclInit⦎ of (SI_VAR_DECL * EXP)
	|	⦏SISubtypeDecl⦎ of SI_SUBTYPE_DECL
	|	⦏SIPrivateTypeDecl⦎ of PRIVATE_TYPE_DECL
	|	⦏SIPragma⦎ of (AGG_CHOICE, EXP) PRAGMA
	|	⦏SIAnnotation⦎ of ANNOTATION;
=DESCRIBE
ⓈZ
│  ⦏SI_BASIC_DECL⦎ ::=
│    ⦏si_const_decl⦎ SI_Const_Decl | ⦏si_type_decl⦎ SI_Type_Decl |
│    ⦏si_subtype_decl⦎ SI_Subtype_Decl
■
=ENDDOC


\subsection{Statements}

The Z specification of the abstract syntax uses a given set declaration to act as a forward declaration of the free type $Statement$, permitting the free type to involve recursion through schema constructions.
Unfortunately, this style is not considered to be type correct in \ProductZ; this is readily circumvented by making the schema constructions generic where necessary.
For example, see section \ref{if-then-else} below.

Following this convention we may now work through the abstract syntax for SPARK statements following \cite[volume 2]{DRA/CIS/CSE3/TR/94/27/3.0}.

\subsubsection{Null}\label{null}

The abstract syntax for null is provided as a data constructor within the type $Statement$ (see section \ref{statement}).

\subsubsection{Assignment}\label{assignment}


=DOC
type ⦏ASSIGN⦎
=TYPESTRUCT
      = {
	name : EXP,
	e : EXP
	};
=DESCRIBE
┌⦏Assign⦎─────────────────
│	name, E : EXP
└─────────────────────
=ENDDOC

\subsubsection{Specification Statements}


=DOC
(* type ⦏Z_PRED⦎ *)
=TYPESTRUCT
(*	= Z_PRED; *)
=DESCRIBE
ⓈZAX
│	⦏Z_PRED⋎0⦎ : ℙ Z_PRED
■
=ENDDOC

The pre- and post-conditions in the specification are represented as parsed but not type-checked Z terms. This is so that type inference can be performed in the correct environment during VC generation. Note that in the Z, $pre$ is a reserved word, and so we use $Pre$.
=DOC
type ⦏SPEC⦎
=TYPESTRUCT
      = {
	w : Z_ID list,
	w0 : Z_ID list,
	pre : ZUserInterfaceSupport.Z_TM,
	post : ZUserInterfaceSupport.Z_TM
	};
=DESCRIBE
┌⦏Spec⦎─────────────────
│	w, w⋎0 : ℙ Z_ID;
│	Pre, post : Z_PRED
├───────────────
│	Pre ∉ Z_PRED⋎0
└─────────────────────
=ENDDOC
A specification statement may be labelled. It also has a boolean attribute indicating whether or
not it is an assertion (i.e., a specification statement introduced using $\Gamma$ rather than $\Delta$
and refined by no code).
=DOC
type ⦏SPEC_NO_IVARS⦎
=TYPESTRUCT
      = {
	spec : SPEC,
	label : LABEL,
	is_assertion : bool
	};
=DESCRIBE
┌⦏Spec_No_Ivars⦎────────────
│	Spec
├───────────────
│	post ∉ Z_PRED⋎0
└─────────────────────
=ENDDOC
\subsubsection{Semicolon}\label{semicolon}

The abstract syntax for semicolon is provided as a data constructor within the type $STATEMENT$ (see section \ref{statement}).

\subsubsection{If-then-else}\label{if-then-else}


In a nested if statement

=GFT SPARK Fragment
IF	<cond>	THEN	<stmt>;
ELSIF	<cond>	THEN	<stmt>;
...
ELSIF	<cond>	THEN	<stmt>;
END IF;
=TEX
is equivalent to
=GFT SPARK Fragment
IF	<cond>	THEN	<stmt>;
ELSE IF	<cond>	THEN	<stmt>;
...
ELSE IF	<cond>	THEN	<stmt>; END IF; ... END IF;
END IF;
=TEX

I.e., ELSIF is the same as writing ELSE IF. In order to make the input reproducable in the SPARK program to be generated, a flag is stored with each abstract representation of the if statement indicating whether the else condition was input as an ELSIF or not.
=DOC
type ⦏COND⦎
=TYPESTRUCT
	= EXP;
=DESCRIBE
ⓈZAX
│	⦏COND⦎ : ℙ EXP
■
=ENDDOC

=DOC
type ('STATEMENT) ⦏IF_THEN_ELSE⦎
=TYPESTRUCT
      = {
	g : COND,
	p : 'STATEMENT,
	q : 'STATEMENT,
	elsif : bool
	};
=DESCRIBE
┌⦏If_Then_Else⦎[Statement]─────────────────
│	G : COND;
│	P, Q : Statement
└─────────────────────
=ENDDOC
\subsubsection{Case}\label{case}


The case choice can be a discrete range. It is added to support the full syntax.
The type definition is introduced in section \ref{datatypedefs}.

ⓈZ
│	⦏CASE_CHOICE⦎ ::= case_exp EXP | case_range (Range[EXP])
■


=DOC
type 'STATEMENT ⦏CASE_ALTERNATIVE⦎
=TYPESTRUCT
      = {
	choices : CASE_CHOICE list,
	p : 'STATEMENT
	};
=DESCRIBE
┌⦏Case_Alternative⦎[Statement]─────────────────
│	choices : ℙ CASE_CHOICE;
│	P : Statement
└───────────────────────────
=ENDDOC
=DOC
type 'STATEMENT ⦏CASE⦎
=TYPESTRUCT
      = {
	e : EXP,
	s : ('STATEMENT) CASE_ALTERNATIVE list,
	others : 'STATEMENT
	};
=DESCRIBE
A Case statement can have an others part.
In the implementation the same ML record type is used for case
statements with and without others, using a special dummy others
part where the concrete syntax has no others part.
For historical reasons, and to emphasise the difference in
the representation, ``{\it others}'' is used rather than ``{\it q}''
for this component in the ML.

┌⦏Case⦎[Statement]────────────────────
│	E : EXP;
│	s : seq⋎1 Case_Alternative[Statement]
└───────────────────────────
┌⦏Case_Others⦎[Statement]────────────────────
│	Case;
│	Q : Statement
└───────────────────────────
=ENDDOC

\subsubsection{Loop}\label{loop}


As with the translation of $Spec\_No\_Ivars$, we have a choice of how to translate the schema inclusion.
This case is a little more complicated, however, but as there is no overlap between the signature of the included schema and other signature variables, we can adopt the following simple translation.

The till clause may not be present in which case the t component will be true. However we make t optional to reflect the concrete syntax so that the SPARK program can be reproduced authentically.

A loop body may be a sequence of statements in which case the treatment of the loop can only be informal with respect to generating verification conditions: hence $'STATEMENT$ rather than $SPEC_NO_IVARS$.

Loops can have names, so a name is introduced into the abstract representation.
The name can be omitted or it can be a Compliance Notation name that does not appear in the Ada.
The data type used to represent the three possibilities is also used for block statements.

=DOC
datatype ⦏LOOP_OR_BLOCK_NAME⦎ =
				⦏LBNoName⦎
			|	⦏LBAdaName⦎ of ID
			|	⦏LBCNName⦎ of ID;
type 'STATEMENT ⦏LOOP_BODY⦎
=TYPESTRUCT
      = {
	t : ZUserInterfaceSupport.Z_TM OPT,
	stmt : 'STATEMENT
	};
=SML
type 'STATEMENT ⦏LOOP⦎
=TYPESTRUCT
      = {
	name : LOOP_OR_BLOCK_NAME,
	loop : 'STATEMENT LOOP_BODY
	};
=DESCRIBE
The till part is represented as a parsed (but not type-checked) Z term to enable type inference to happen in the correct environment during VC generation.
┌⦏Loop⦎─────────────────
│	T : Z_PRED;
│	Spec_No_Ivars
├──────
│	T ∉ Z_PRED⋎0
└───────────────────────────
=ENDDOC

\subsubsection{While Loop}\label{while-loop}
=DOC
type 'STATEMENT ⦏WHILE⦎
=TYPESTRUCT
      = {
	name : LOOP_OR_BLOCK_NAME,
	g : COND,
	loop : 'STATEMENT LOOP_BODY
	};
=DESCRIBE
┌⦏While⦎─────────────────
│	G : COND;
│	Loop
└───────────────────────────
=ENDDOC
\subsubsection{For Loop (Static Bounds)}\label{for-static}


Loops can have names so a field in the abstract representation is reserved for name. Also we record in the abstract syntax the direction of the loop and the type mark for the purposes of reproducing the SPARK program.

=DOC
type ⦏STATIC_EXP⦎
=TYPESTRUCT
	= EXP;
=ENDDOC
ⓈZAX
│	⦏STATIC_EXP⦎ : ℙ EXP
■
=DOC
datatype ⦏LOOP_DIRECTION⦎ =
				⦏LDForwards⦎
			|	⦏LDReverse⦎;
=DESCRIBE
ⓈZ
│ ⦏LOOP_DIRECTION⦎ ::= Forwards | Reverse
■
=ENDDOC
A range component is used rather than a lo-hi pair in order to support the possibility of representing a range attribute.
Also the optional loop name and the type mark have to be recorded.
=DOC
type 'STATEMENT ⦏FOR⦎
=TYPESTRUCT
      = {
	name : LOOP_OR_BLOCK_NAME,
	i : ID,
	tmark : ID OPT,
	range : EXP RANGE,
	dir : LOOP_DIRECTION,
	loop : 'STATEMENT LOOP_BODY
	};
=DESCRIBE
┌⦏For⦎─────────────────
│	i : ID;
│	lo, hi : EXP;
│	dir : LOOP_DIRECTION;
│	Loop
└───────────────────────────
=ENDDOC
=DOC
type 'STATEMENT ⦏FOR_STATIC⦎
=TYPESTRUCT
	= 'STATEMENT FOR;
=DESCRIBE
┌⦏For_Static⦎─────────────────
│	For
├───────────────
│ 	{lo, hi} ⊆ STATIC_EXP
└───────────────────────────
=ENDDOC
\subsubsection{For Loop (Type Mark as Range)}\label{for-typemark}


FOR\_TMARK is augmented in the same way as for FOR\_STATIC.

=DOC
type 'STATEMENT ⦏FOR_TMARK⦎
=TYPESTRUCT
      = {
	name : LOOP_OR_BLOCK_NAME,
	i : ID,
	tmark : TMARK,
	dir : LOOP_DIRECTION,
	loop : 'STATEMENT LOOP_BODY
	};
=DESCRIBE
┌⦏For_Tmark⦎─────────────────
│	i : ID;
│	tmark : TMARK;
│	dir : LOOP_DIRECTION;
│	Loop
└───────────────────────────
=ENDDOC
=DOC
type 'STATEMENT ⦏LABELLED⦎
=TYPESTRUCT
      = {
	label : ID,
	statement : 'STATEMENT
	};
=DESCRIBE
A labelled statement.
=ENDDOC
\subsubsection{Exit Statement (with condition)}\label{exit}


=DOC
type ⦏EXIT_WHEN⦎
=TYPESTRUCT
      = {
	g : COND,
	n : ID OPT
	};
=DESCRIBE
┌⦏Exit_When⦎─────────────────
│	G : COND;
│	N : OPT[ID]
└───────────────────────────
=ENDDOC
\subsubsection{Exit Statement}\label{exit-stmt}
=DOC
type ⦏EXIT⦎
=TYPESTRUCT
      = {
	n : ID OPT
	};
=DESCRIBE
┌⦏Exit⦎─────────────────
│	N : OPT[ID]
└───────────────────────────
=ENDDOC

\subsubsection{Return}\label{return}


=DOC
type ⦏RETURN⦎
=TYPESTRUCT
      = {
	e : EXP OPT
	};
=DESCRIBE
┌⦏Return⦎─────────────────
│	E : OPT[EXP]
└───────────────────────────
=ENDDOC
\subsubsection{Procedure Call}\label{procedure-call}


The actual part can be a positional parameter association or a named parameter association.

=DOC
datatype ('AGG_CHOICE, 'EXP) ⦏ACTUALS⦎ =
			⦏APositional⦎ of EXP list
		|	⦏ANamed⦎ of ('AGG_CHOICE, 'EXP) NAMED_ASSOC list;
=DESCRIBE
=ENDDOC
=DOC
type ('AGG_CHOICE,'EXP) ⦏PROC_CALL⦎
=TYPESTRUCT
      = {
	name : ID,
	actuals : ('AGG_CHOICE,'EXP) ACTUALS
	};
=DESCRIBE
┌⦏Proc_Call⦎─────────────────
│	name : ID;
│	actuals : seq EXP
└───────────────────────────
=ENDDOC



=DOC
type ('AGG_CHOICE,'EXP) ⦏PROC_CALL_NO_IVARS⦎
=TYPESTRUCT
	= ('AGG_CHOICE,'EXP) PROC_CALL;
=DESCRIBE
ⓈZAX
│	⦏retrieve_spec_stmt⦎ : ID ⇸ Spec
■
┌⦏Proc_Call_No_Ivars⦎─────────────────
│	Proc_Call
├────────────────
│	(retrieve_spec_stmt name).post ∉ Z_PRED⋎0
└───────────────────────────
=ENDDOC



\subsubsection{Specification (with initial variables)}\label{specification-ivars}

A specification statement may be labelled.
=DOC
type ⦏SPEC_IVARS⦎
=TYPESTRUCT
      = {
	spec :SPEC,
	label : LABEL
	};
=DESCRIBE
┌⦏Spec_Ivars⦎────────────
│	Spec
├───────────────
│	post ∈ Z_PRED⋎0
└─────────────────────
=ENDDOC
\subsubsection{For Loop (Non-Static Bounds)}\label{for-non-static-bounds}


A loop may have an optional name.

A range component is used rather than a lo-hi pair in order to support the possibility of representing a range attribute.
=DOC
type 'STATEMENT ⦏FOR_NON_STATIC⦎
=TYPESTRUCT
      = 'STATEMENT FOR;
=DESCRIBE
┌⦏For_Non_Static⦎─────────────────
│	For
├────────────────
│	¬{lo, hi} ⊆ STATIC_EXP
└───────────────────────────
=ENDDOC
\subsubsection{Logical Constants}\label{logical-constants}


The function $free\_id$ may readily and realistically be implemented using existing \Product\
syntax functions.
In a {\it LOG\_CON\_DEF},
$t$ represents the set of which $x$ is a member and
is represented as a parsed Z term. Type inference occurs during VC generation when the appropriate $Z\_EXP$ is generated.
The values for $e$ and $pre1$ are filled in at this time (replacing dummy values planted by
the parser).
Logical constants also have a label.
=DOC
type ⦏LOG_CON_DEF⦎
=TYPESTRUCT
      = {
	x : Z_ID,
	t : ZUserInterfaceSupport.Z_TM,
	e : Z_EXP
	};
=DESCRIBE
ⓈZAX
│	⦏free_ids⦎ : Z_EXP → ℙ Z_ID
■
┌ ⦏Log_Con_Def⦎ ───────────
│	X : Z_ID;
│	T : Z_EXP;
│	E : Z_EXP
└──────────────
=ENDDOC
=DOC
type ⦏LOG_CON⦎
=TYPESTRUCT
      = {
	defs : LOG_CON_DEF list,
	spec : SPEC,
	pre1 : Z_EXP,
	label : LABEL
	};
=DESCRIBE
┌⦏Log_Con⦎────────────
│	defs : seq⋎1 Log_Con_Def;
│	Spec;
│	pre⋎1 : Z_PRED
├───────────────
│∀i, n : dom defs⦁ i ≤ n ⇒ (defs n).X ∉ free_ids((defs i).E);
│Pre = z_and(z_many_and {d: ran defs⦁z_eq(zid(d.X), d.E)}, pre⋎1)
└─────────────────────
=ENDDOC
\subsubsection{Procedure Calls (initial variables in spec)}\label{procedure-calls}


=DOC
type ('AGG_CHOICE,'EXP) ⦏PROC_CALL_IVARS⦎
=TYPESTRUCT
	= ('AGG_CHOICE,'EXP) PROC_CALL;
=DESCRIBE
┌⦏Proc_Call_Ivars⦎────────────
│	Proc_Call
├───────────────
│	(retrieve_spec_stmt name).post ∈ Z_PRED⋎0
└─────────────────────
=ENDDOC

\subsubsection{Goto Statement}\label{goto-stmt}
=DOC
type ⦏GOTO⦎
=TYPESTRUCT
      = {
	label : ID
	};
=DESCRIBE
A goto statement.
=ENDDOC

\subsubsection{Statement}\label{statement}

\ProductZ\ is currently non-standard in that it neither requires nor
allows the chevrons around the operands in a free type definition.
This mismatch with the Z standard is planned to be remedied in a future release of the system.


ⓈZ
	⦏Statement⦎
		::= 	null
		|	assign Assign
		|	spec_no_ivars Spec_No_Ivars
		|	semicolon (Statement × Statement)
		|	if_then_else (If_Then_Else[Statement])
		|	case (Case[Statement])
		|	case_others (Case_Others[Statement])
		|	loop Loop
		|	while While
		|	for_static For_Static
		|	for_tmark For_Tmark
		|	exit_when Exit_When
		|	exit Exit
		|	ret Return
		|	proc_no_ivars Proc_Call_No_Ivars
		|	spec_ivars Spec_Ivars
		|	for_non_static For_Non_Static
		|	log_con Log_Con
		|	proc_ivars Proc_Call_Ivars
■

To support the full syntax for block statements, the ML datatype for statements is declared
later on in mutual recursion with the syntax for declarations.

\subsection{Subprogram Declarations}
The abstract syntax in this section and in the rest of the document is constructed from an abstraction of the concrete syntax of SPARK. It is not specified formally in \cite{DRA/CIS/CSE3/TR/94/27/3.0}, hence there is no transcribed Z specification here.

An Ada formal parameter mode is represented by the following data type, in which
the boolean flag for an {\tt in} mode parameter indicates whether or not the
parameter mode was supplied explicitly ({\tt true}) or just omitted ({\tt false})
in the Ada source.
=DOC
datatype ⦏MODE⦎ =	MSparkIn of bool
		|	MSparkOut
		|	MSparkInOut;
=DESCRIBE
=ENDDOC
=DOC
type ⦏PARAMETER_SPECIFICATION⦎
=TYPESTRUCT
      = {
	idlist : ID list,
	mode : MODE,
	name : TMARK,
	default : EXP OPT
	};
=DESCRIBE
=ENDDOC
=DOC
type ⦏PROCEDURE_SPECIFICATION⦎
=TYPESTRUCT
      = {
	name : ID,
	formal_part : PARAMETER_SPECIFICATION list,
	spec : SPEC OPT,
	annotation : ANNOTATION,
	globals : Z_ID list
	};
=DESCRIBE
=ENDDOC
=DOC
type ⦏FUNCTION_SPECIFICATION⦎
=TYPESTRUCT
      = {
	designator : ID,
	return : TMARK,
	formal_part : PARAMETER_SPECIFICATION list,
	spec : SPEC OPT,
	annotation : ANNOTATION,
	globals : Z_ID list
	};
=DESCRIBE
=ENDDOC
=DOC
datatype ⦏SUBPROGRAM_SPECIFICATION⦎ =
			⦏SSProcedure⦎ of PROCEDURE_SPECIFICATION
		|	⦏SSFunction⦎ of FUNCTION_SPECIFICATION;
=DESCRIBE
=ENDDOC
=DOC
type ⦏PROCEDURE_DECLARATION⦎
=TYPESTRUCT
	= {implicit : bool, spec : PROCEDURE_SPECIFICATION};
=DESCRIBE
=ENDDOC
=DOC
type ⦏FUNCTION_DECLARATION⦎
=TYPESTRUCT
	= {implicit : bool, spec : FUNCTION_SPECIFICATION};
=DESCRIBE
=ENDDOC
=DOC
type ⦏SUBPROGRAM_DECLARATION⦎
=TYPESTRUCT
	= SUBPROGRAM_SPECIFICATION;
=DESCRIBE
=ENDDOC
\subsection{Procedure and Function Calls}
=DOC
type ⦏NAMED_PARAM⦎
=TYPESTRUCT
      = {
	formal : ID,
	actual : EXP
	};
=DESCRIBE
=ENDDOC
=DOC
type ⦏NAMED_PARAMETER_ASSOC⦎
=TYPESTRUCT
      = {
	params: NAMED_PARAM list
	};
=DESCRIBE
=ENDDOC
=DOC
type ⦏POS_PARAMETER_ASSOC⦎
=TYPESTRUCT
      = {
	params : EXP list
	};
=DESCRIBE
=ENDDOC
=DOC
datatype ⦏ACTUAL_PARAMETER_PART⦎ =
			⦏APPNamed⦎ of NAMED_PARAMETER_ASSOC
		|	⦏APPPositional⦎ of POS_PARAMETER_ASSOC;
=DESCRIBE
=ENDDOC
\subsection{enaming Declaration}
=DOC
type ⦏OBJECT_RENAMING⦎
=TYPESTRUCT
	= {
		new_name : ID,
		tmark : TMARK,
		old_name : ID
	};
=DESCRIBE
=ENDDOC
=DOC
type ⦏PACKAGE_RENAMING⦎
=TYPESTRUCT
	= {
		new_name : EXPANDED_NAME,
		old_name : EXPANDED_NAME
	};
=DESCRIBE
This allows for an expanded name as the new name although this is not supported formally.
=ENDDOC
=DOC
type ⦏OPERATOR_SYMBOL⦎
=TYPESTRUCT
	= string;
=DESCRIBE
=ENDDOC
=DOC
type ⦏OPSYM_RENAMING⦎
=TYPESTRUCT
      = {
	new_name : ID OPT,
	formal_part : PARAMETER_SPECIFICATION list,
	tmark : TMARK,
	name1 : ID OPT,
	name2 : OPERATOR_SYMBOL
	};
=DESCRIBE
This is the case where the original name is an operator symbol, in which case
the Compliance Notation requires the new name to be the same operator
symbol or an ordinary function name. In the former case, we leave out the new
name in the abstract syntax.
{\it name1} is the package name part of the original operator symbol name, if any.
=ENDDOC
=DOC
type ⦏SUBPROGRAM_RENAMING⦎
=TYPESTRUCT
      = {
	subprogram_specification : SUBPROGRAM_SPECIFICATION,
	name1 : ID OPT,
	name2 : ID
	};
=DESCRIBE
This includes the case where {\it name2} is an operator symbol
but not the case where {\it name1} is.
=ENDDOC
=DOC
datatype ⦏RENAMING_DECLARATION⦎ =
			⦏RDObject⦎ of OBJECT_RENAMING
		|	⦏RDPackage⦎ of PACKAGE_RENAMING
		|	⦏RDOpsym⦎ of OPSYM_RENAMING
		|	⦏RDSubprogram⦎ of SUBPROGRAM_RENAMING;
=DESCRIBE
=ENDDOC
=DOC
type ⦏LENGTH_CLAUSE⦎
=TYPESTRUCT
      = {
	attribute : EXP,
	exp : EXP
	};
=DESCRIBE
=ENDDOC
=DOC
type ⦏ENUMERATION_REPRESENTATION_CLAUSE⦎
=TYPESTRUCT
      = {
	name : ID,
	exp : EXP
	};
=DESCRIBE
=ENDDOC
=DOC
type ⦏COMPONENT_CLAUSE⦎
=TYPESTRUCT
      = {
	name : ID,
	exp : EXP,
	range : EXP RANGE
	};
=DESCRIBE
=ENDDOC
=DOC
type ⦏RECORD_REPRESENTATION_CLAUSE⦎
=TYPESTRUCT
      = {
	name : ID,
	alignment_opt : EXP OPT,
	component_pack : COMPONENT_CLAUSE list
	};
=DESCRIBE
=ENDDOC
=DOC
type ⦏ADDRESS_CLAUSE⦎
=TYPESTRUCT
      = {
	name : ID,
	exp : EXP
	};
=DESCRIBE
=ENDDOC
=DOC
datatype ⦏REPRESENTATION_CLAUSE⦎ =
		⦏RCLength⦎ of LENGTH_CLAUSE
	|	⦏RCEnumeration⦎ of ENUMERATION_REPRESENTATION_CLAUSE
	|	⦏RCRecord⦎ of RECORD_REPRESENTATION_CLAUSE
	|	⦏RCAddress⦎ of ADDRESS_CLAUSE;
=DESCRIBE
=ENDDOC
=DOC
datatype ⦏USE_CLAUSE⦎ =
		⦏UCUse⦎ of EXPANDED_NAME list
	|	⦏UCUseType⦎ of ID list;
=DESCRIBE
=ENDDOC

The types for function, procedure and package bodies are declared later with the mutually recursive
datatype definitions for statements and declarations.


=DOC
type 'DECLARATION ⦏PACKAGE_DECLARATION⦎
=TYPESTRUCT
      = {
	name : EXPANDED_NAME,
	end_name : EXPANDED_NAME OPT,
	visible_decs : 'DECLARATION list,
	private_decs : 'DECLARATION list OPT,
	annotation : ANNOTATION
	};

=DESCRIBE
=ENDDOC
Auxiliary expressions are resolved by the presence of a using declaration. This is specified in \cite[volume 1]{DRA/CIS/CSE3/TR/94/27/3.0}. It is necessary to extend the abstract syntax to include ``using'' declarations.

Note that the component $basic\_decls$ is added in case we need to reproduce the user's input. The component $concrete\_vars$ is a subset of the basic declarations which are variables.

$t$ represents the set of which $aux$ is a member.

As a convenience to the user, we allow a list of auxiliary variables to be declared in one declaration.

=DOC
type ⦏AUX_VAR⦎
=TYPESTRUCT
      = {
	aux : Z_ID list,
	t : ZUserInterfaceSupport.Z_TM
	};
=DESCRIBE
┌⦏AUX_VAR⦎─────────────────
│	aux : Z_Decl[Z_EXP]
└─────────────────────
=ENDDOC

=DOC
type ⦏USING_DEC⦎
=TYPESTRUCT
      = {
	aux : ZUserInterfaceSupport.Z_TM,
	concrete_vars : VAR_DECL list,
	basic_decls : BASIC_DECL list,
	invariant : ZUserInterfaceSupport.Z_TM
	};
=DESCRIBE
┌⦏USING_DEC⦎─────────────────
│	aux : Z_ID;
│	concrete_vars : ℙ Var_Decl;
│	invariant : Z_PRED
└─────────────────────
=ENDDOC
=DOC
type ⦏SI_USING_DEC⦎
=TYPESTRUCT
      = {
	aux : ZUserInterfaceSupport.Z_TM,
	basic_decls : SI_BASIC_DECL list,
	invariant : ZUserInterfaceSupport.Z_TM
	};
=DESCRIBE
This is the form delivered by the parser. The Z Generator separates out
the variable declarations as required by the specification.
=ENDDOC


=DOC
datatype ⦏DEC_K_SLOT_TYPE⦎ =
			⦏DKPrivate⦎
		|	⦏DKVisible⦎
		|	⦏DKDeclaration⦎;
=DESCRIBE
This datatype is used in the datatype $DECLARATION$s to destinguish between the three types of k-slot which can occur as a declaration.
=ENDDOC
=DOC
datatype ⦏ST_NULL_TYPE⦎ =
			⦏SNNull⦎
		|	⦏SNImplicit⦎
		|	⦏SNNothing⦎;
=DESCRIBE
This datatype is used to distinguish between the three different concrete forms that can result in
a null statement in the abstract syntax:  an  explicit null statement, an implicit null statement
arising from a form such as an if statement with no else part, and an explicit nothing statement.
=ENDDOC

=DOC
datatype ⦏DECLARATION⦎ =
		⦏DDeclarationKSlot⦎ of (K_SLOT * DEC_K_SLOT_TYPE)
	|	⦏DRenamingDeclaration⦎ of RENAMING_DECLARATION
	|	⦏DBasicDecl⦎ of SI_BASIC_DECL
	|	⦏DRepresentationClause⦎ of REPRESENTATION_CLAUSE
	|	⦏DUseClause⦎ of USE_CLAUSE
	|	⦏DProperBody⦎ of PROPER_BODY
	|	⦏DProcedureDeclaration⦎ of PROCEDURE_DECLARATION
	|	⦏DFunctionDeclaration⦎ of FUNCTION_DECLARATION
	|	⦏DPackageDeclaration⦎ of DECLARATION PACKAGE_DECLARATION
	|	⦏DProcedureStub⦎ of PROCEDURE_SPECIFICATION
	|	⦏DFunctionStub⦎ of FUNCTION_SPECIFICATION
	|	⦏DPackageStub⦎ of EXPANDED_NAME
	|	⦏DExternalProcedureStub⦎ of PROCEDURE_DECLARATION
	|	⦏DExternalFunctionStub⦎ of FUNCTION_DECLARATION
	|	⦏DAuxiliary⦎ of AUX_VAR
	|	⦏DUsing⦎ of SI_USING_DEC
=DESCRIBE
=ENDDOC
=DOC
and ⦏PROPER_BODY⦎ =	⦏PBProcedure⦎ of PROCEDURE_BODY
		|	⦏PBFunction⦎ of FUNCTION_BODY
		|	⦏PBPackage⦎ of PACKAGE_BODY
=DESCRIBE
=ENDDOC

The datatype for statements is now given in mutual recursion with the above.

Note that $STImplicitNull$ has been introduced because there are cases where a null statement is required in the syntax (e.g., in $SSpecIvars$ of \ref{statement}) which might not have been present in the input. Therefore such a statement is recorded in the abstract syntax as an implicit null statement, denoting that it should not appear subsequently in the SPARK program.

\pagebreak
=DOC
and ⦏STATEMENT⦎ =
		 	⦏STNull⦎ of ST_NULL_TYPE
		|	⦏STAssign⦎ of ASSIGN
		|	⦏STSpecNoIvars⦎ of SPEC_NO_IVARS
		|	⦏STSemicolon⦎ of (STATEMENT * STATEMENT)
		|	⦏STIfThenElse⦎ of  STATEMENT IF_THEN_ELSE
		|	⦏STCase⦎ of STATEMENT CASE
		|	⦏STLoop⦎ of STATEMENT LOOP
		|	⦏STWhile⦎ of STATEMENT WHILE
		|	⦏STForStatic⦎ of STATEMENT FOR_STATIC
		|	⦏STForTmark⦎ of STATEMENT FOR_TMARK
		|	⦏STLabelled⦎ of STATEMENT LABELLED
		|	⦏STExitWhen⦎ of EXIT_WHEN
		|	⦏STExit⦎ of EXIT
		|	⦏STRet⦎ of RETURN
		|	⦏STProcNoIvars⦎ of (AGG_CHOICE,EXP) PROC_CALL_NO_IVARS
		|	⦏STKSlot⦎ of K_SLOT
		|	⦏STPragma⦎ of (AGG_CHOICE, EXP) PRAGMA
		|	⦏STAnnotation⦎ of ANNOTATION
		|	⦏STGoto⦎ of GOTO
		|	⦏SSpecIvars⦎ of SPEC_IVARS
		|	⦏SForNonStatic⦎ of STATEMENT FOR_NON_STATIC
		|	⦏SLogCon⦎ of LOG_CON
		|	⦏SProcIvars⦎ of
				(AGG_CHOICE,EXP) PROC_CALL_IVARS
		|	⦏SBlockStatement⦎ of BLOCK_STATEMENT
=DESCRIBE
In the ML, there is just one category for case statements, which covers
both of the Z categories.
=ENDDOC
=DOC
withtype ⦏BLOCK_STATEMENT⦎
	= {
		name : LOOP_OR_BLOCK_NAME,
		declarative_part : DECLARATION list OPT,
		statement : STATEMENT
	}
=DESCRIBE
=ENDDOC
=DOC
and ⦏PROCEDURE_BODY⦎
      = {
	deferred : bool,
	procedure_spec : PROCEDURE_SPECIFICATION,
	declarative_part : DECLARATION list,
	statement : STATEMENT,
	end_name : ID OPT
	}
=DESCRIBE
=ENDDOC
=DOC
and ⦏FUNCTION_BODY⦎
      = {
	deferred : bool,
	function_spec : FUNCTION_SPECIFICATION,
	declarative_part : DECLARATION list,
	statement : STATEMENT,
	end_name : ID OPT
	}
=DESCRIBE
=ENDDOC
=DOC
and ⦏PACKAGE_BODY⦎
      = {
	name : EXPANDED_NAME,
	decls : DECLARATION list,
	statement : STATEMENT,
	annotation : ANNOTATION,
	end_name : EXPANDED_NAME OPT
	};
=DESCRIBE
=ENDDOC

=DOC
type ⦏COMP_SUBUNIT⦎
=TYPESTRUCT
      = {
	name : EXPANDED_NAME,
	proper_body : PROPER_BODY
	};
=DESCRIBE
=ENDDOC
=DOC
datatype ⦏COMPILATION_UNIT⦎ =
		⦏CUPackageDeclaration⦎ of LIBRARY_PACKAGE_DECLARATION
	|	⦏CUProperBody⦎ of PROPER_BODY
	|	⦏CUSubUnit⦎ of COMP_SUBUNIT
withtype ⦏LIBRARY_PACKAGE_DECLARATION⦎ = {
	private : bool,
	pack_decl : DECLARATION PACKAGE_DECLARATION
};
=DESCRIBE
=ENDDOC
=DOC
type ⦏REFINED_BY⦎
=TYPESTRUCT
      = {
	label : LABEL,
	statement : STATEMENT
	};
=DESCRIBE
=ENDDOC
=DOC
type ⦏REPLACED_BY⦎
=TYPESTRUCT
      = {
	label : LABEL,
	statement : STATEMENT
	};
=DESCRIBE
=ENDDOC
=DOC
type ⦏REPLACED_BY_DECL⦎
=TYPESTRUCT
      = {
	label : LABEL,
	decls : DECLARATION list
	};
=DESCRIBE
=ENDDOC
=DOC
type ⦏REPLACED_BY_VISIBLE_PART⦎
=TYPESTRUCT
      = {
	label : LABEL,
	visible : DECLARATION list
	};
=DESCRIBE
=ENDDOC
=DOC
type ⦏REPLACED_BY_PRIVATE_PART⦎
=TYPESTRUCT
      = {
	label : LABEL,
	private : DECLARATION list
	};
=DESCRIBE
=ENDDOC
=DOC
datatype ⦏CONTEXT_ITEM⦎ =
		⦏CIWith⦎ of EXPANDED_NAME list
	|	⦏CIUse⦎ of USE_CLAUSE
	|	⦏CIPragma⦎ of (AGG_CHOICE, EXP) PRAGMA;
=DESCRIBE
=ENDDOC
=DOC
type ⦏CONTEXT_COMPILATION_UNIT⦎
=TYPESTRUCT
      = {
	context : CONTEXT_ITEM list,
	references : EXPANDED_NAME list,
	comp_unit : COMPILATION_UNIT,
	annotation : ANNOTATION
	};
=DESCRIBE
The pragmas are kept together with the context
clauses they followed so that the SPARK program can be
assembled in the proper order.
=ENDDOC
=DOC
datatype ⦏KSLOT_COMPILATION_UNIT⦎ =
			⦏KCUKSlot⦎ of K_SLOT
		|	⦏KCUUnit⦎ of CONTEXT_COMPILATION_UNIT
		|	⦏KCUPragma⦎ of (AGG_CHOICE, EXP) PRAGMA;
=DESCRIBE
=ENDDOC
=DOC
type ⦏REPLACED_BY_COMP⦎
=TYPESTRUCT
      = {
	label : LABEL,
	comp : KSLOT_COMPILATION_UNIT list
	};
=ENDDOC
=DOC
type ⦏REPLACED_BY_ARBITRARY_ADA⦎
=TYPESTRUCT
      = {
	label : LABEL,
	replacement : string
	};
=DESCRIBE
This is the type for an arbitrary Ada replacement, which for the compliance tool,  is just textual data to be passed into the output SPARK program.
=ENDDOC
=DOC
type ⦏REPLACED_BY_ANNOTATION⦎
=TYPESTRUCT
      = {
	label : LABEL,
	replacement : ANNOTATION
	};
=DESCRIBE
This is the type for an annotation replacement.
It is used in the syntactic positions where an annotation is not just treated as an option for some other sort of construct (e.g., a declaration).
=ENDDOC
=DOC
datatype ⦏WEB_CLAUSE⦎ =
			⦏WCCompilation⦎ of KSLOT_COMPILATION_UNIT list
		|	⦏WCReplacedByCompilation⦎ of REPLACED_BY_COMP
		|	⦏WCReplacedByPrivatePart⦎ of REPLACED_BY_PRIVATE_PART
		|	⦏WCReplacedByVisiblePart⦎ of REPLACED_BY_VISIBLE_PART
		|	⦏WCReplacedByDecl⦎ of REPLACED_BY_DECL
		|	⦏WCReplacedByArbitraryAda⦎ of
						REPLACED_BY_ARBITRARY_ADA
		|	⦏WCReplacedByAnnotation⦎ of
						REPLACED_BY_ANNOTATION
		|	⦏WCRefinedBy⦎ of REFINED_BY
		|	⦏WCReplacedBy⦎ of REPLACED_BY;
=DESCRIBE
=ENDDOC
=TEX
\section{CUSTOMIZED ENVIRONMENT HANDLING}

The {\em IN\_SCOPE} data type that features in the various environments in the specification is represented using a data refinement
Instead of having separate tables for different kinds of entity (variables, parameters etc.), there is a single table which maps identifiers to a data type representing the different types of entity and including both the information defined in the specification and any additional information needed by the implementation.
This approach also gives a convenient and uniform way of storing useful information about names in general.
This section defines the types that make up this representation.


The types in this section are not part of the syntax {\it per se}. However,
they are needed in the implementation of \cite[Volume 3]{DRA/CIS/CSE3/TR/94/27/3.0}
and it is a convenience in building the system to define them here rather
than in \cite{ISS/HAT/DAZ/DTD508}.

=DOC
type ⦏PAR_INFO⦎
=TYPESTRUCT
	= {
		id : ID,
		tmark : TMARK,
		default : Z_EXP OPT};
=SML
type ⦏FUNCTION_INFO⦎
=TYPESTRUCT
	= {
		spec : SPEC OPT,
		deps : Z_ID list,
		pars : PAR_INFO list,
		return_tmark : TMARK};
=DESCRIBE
The information for functioins is what is needed {\em(a)} to translate a call of the function into Z, {\em(b)} to set up a type inference context appropriate for the body of the function and {\em(c)} to process renaming declarations for the function.
The information for a function includes a flag indicating whether this is a formal function the list of global dependencies, the list of formal
parameter names and corresponding type marks and defaults and the type mark for the return value of the
function.
=ENDDOC

=DOC

=SML
type ⦏PARAM_SPEC⦎
=TYPESTRUCT
      = {
	var_decl : VAR_DECL,
	mode : MODE
	};
=SML
type ⦏FORMAL_PROC⦎
=TYPESTRUCT
      = {
	name : ID,
	formal_ids : PARAM_SPEC list,
	par_names_defs : (ID * Z_EXP OPT) list,
	globals : Z_ID list,
	spec : SPEC
	};
=SML
type ⦏PROCEDURE_INFO⦎
=TYPESTRUCT
	= {
		formal_proc : FORMAL_PROC OPT};
=DESCRIBE
The type {\em FORMAL\_PROC} is defined here rather than in \cite{ISS/HAT/DAZ/DTD514}.

For a procedure, we have an optional {\em FORMAL\_PROC} that gives the necessary information if the procedure is formal and is omitted if the procedure is informal.
=ENDDOC
=DOC
datatype ⦏VAR_KIND⦎ = ⦏VKVar⦎ | ⦏VKPar⦎ of MODE | ⦏VKOutOfScope⦎
type ⦏VAR_INFO⦎
=TYPESTRUCT
	= {
		kind : VAR_KIND,
		tmark : TMARK};
=DESCRIBE
For a variable or formal parameter we have the type mark plus a marker distinguishing between variables proper, parameters (for which we also have the mode), and variables which are in scope in the Ada sense but not in scope in the Compliance Notation sense.
This is intended to allow improved error messages (the user can be told that the variable is not in scope as far as the Compliance Notation is concerned because it hasn't been cited in a frame or a global dependency list).
=ENDDOC
=DOC
type ⦏AUX_VAR_INFO⦎
=TYPESTRUCT
	= {
		in_scope : bool,
		decl : Z_EXP};
=SML
type ⦏LOG_CON_INFO⦎
=TYPESTRUCT
	= AUX_VAR_INFO;
=DESCRIBE
For an auxiliary variable or a logical constant we have the theZ declaration plus a flag indicating whether this variable is in scope in fhe Compliance Notation sense (just as for program variables, see above).
=ENDDOC
=DOC
type RECORD_TYPE_INFO
=TYPESTRUCT
	= {
		comp_names :  ID list,
		num_discs : int};
=DESCRIBE
For a record type we have the component names in their Ada order and the number of components that are discriminants of the type.
=ENDDOC
=DOC
type ⦏CONSTANT_INFO⦎
=TYPESTRUCT
	= {tmark : TMARK};
=DESCRIBE
For a constant we just need the Ada type mark.
=ENDDOC
=DOC
datatype ⦏ENTITY_INFO⦎ =
			⦏EIEnvFunction⦎ of FUNCTION_INFO
		|	⦏EIEnvProcedure⦎ of PROCEDURE_INFO
		|	⦏EIEnvVar⦎ of VAR_INFO
		|	⦏EIEnvAuxVar⦎ of AUX_VAR_INFO
		|	⦏EIEnvLogCon⦎ of LOG_CON_INFO
		|	⦏EIEnvRecordType⦎ of RECORD_TYPE_INFO
		|	⦏EIEnvOtherType⦎
		|	⦏EIEnvConstant⦎ of CONSTANT_INFO
		|	⦏EIEnvOther⦎;
type ENV_INFO
=TYPESTRUCT
	 = {
	tipe : TYPE OPT,
	canon_name : Z_ID,
	info : ENTITY_INFO,
	private : bool};
=DESCRIBE
The data type collects together the different types of information held in the implementation of an {\em IN\_SCOPE}.
The ``other type'' alternative is for names corresponding to Ada types that are not record types.
The ``other'' alternative is for Z global variables that do not represent Ada entities, e.g., user-defined schemas.

Putting this all together, we get the new {\em ENV\_INFO} record type giving the information associated with a name, namely its HOL type (or a dummy type for a procedure), its canonical name (as happens as a result of renamings, use clauses and nested packages), the entity info as above and a flag which is true if this entity was declared in the private part of a package.

This will be what is stored in the dictionaries and returned by the {\em CN\_ENV} function.
=ENDDOC
=DOC
type ⦏CN_ENV⦎
=TYPESTRUCT
	= Z_ID ->  ENV_INFO OPT;
=DESCRIBE
$CN\_ENV$ is the type of a function which maps an identifier onto its type and yields contextual information about the identifier.
Such functions returns $Nil$ if the identifier is not in scope at the point at which the function is called.

=USES
A function of type $CN\_ENV$ is passed recursively into the generator for basic declarations and expressions so that the contextual information about an identifier is available at the point it is needed.
=ENDDOC


\section{EPILOGUE}
=SML
end (* of signature CNTypes *);
=TEX

\section{TEST POLICY}
There are no module tests for the design in this document since it specifies no functions.

\small
\twocolumn[\section{INDEX}]
\printindex

\end{document}




=IGN
********************************************************************************
dtd508.doc: this file is part of the PPDaz system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% dtd508.doc ℤ $Date: 2008/07/24 12:12:34 $ $Revision: 1.120 $ $RCSfile: dtd508.doc,v $
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

\def\Title{Detailed Design: Declaration and Expression Generator}

\def\AbstractText{This is the detailed design for the Declaration and Expression Generator as specified in volume 3 of DRA/CIS/CSE3/TR/94/27/3.0.}

\def\Reference{ISS/HAT/DAZ/DTD508}

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
%% LaTeX2e port: \TPPproject{DAZ PROJECT}	%% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Detailed Design: Declaration and Expression Generator} %% Mandatory field
%% LaTeX2e port: \TPPref{ISS/HAT/DAZ/DTD508}	%% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.120 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}	%% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2008/07/24 12:12:34 $%
%% LaTeX2e port: }}
%% LaTeX2e port: %\TPPstatus{Approved}
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: %\TPPkeywords{SPARK}
%% LaTeX2e port: \TPPauthor{D.J.~King&WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & HAT Team}
%% LaTeX2e port: \TPPabstract{This is the detailed design for the Declaration and Expression Generator as specified in volume 3 of DRA/CIS/CSE3/TR/94/27/3.0.
%% LaTeX2e port: }
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

\subsection{Changes History}		% to get section number `0.3'
\begin{description}
\item[Issue 1.1 (1994/03/29)-1.12 (1994/06/06)] Initial Drafts.
\item[Issue 1.13 (1994/06/16) (9th June 1994)] First draft for review.
\item[Issue 1.14 (1994/06/20)-1.16 (1994/06/20)] Bug fixing.
\item[Issues 1.17 (1994/07/14),1.18 (1994/08/03) (14th July 1994)] Minor typographical corrections.
\item[Issue 1.19 (1994/09/26) (22nd Sept 1994)] Changed according to desk check report 008.
\item[Issue 1.23 (1994/10/31) (31 October 1994)] Added $z\_true$ and $z\_exists$ as per version 1.1 of Volume 3 of DRA's specification.
\item[Issue 1.24 (1994/11/03) (9th November 1994)]
Adjusted $ENV\_INFO$ and allowed for type conversions.
\item[Issues 1.25 (1994/11/09)-1.26 (1994/11/25)] Bug fixing.
\item[Issue 1.27 (1994/12/01)] Updated document references.
\item[Issue 1.28 (1995/10/13)] Updated the Z for DRA enhancements 13 and 14.
\item[Issue 1.29 (1995/10/17)] Enhancment 11.
\item[Issue 1.30 (1995/10/19)] Enhancements 13 and 14.
\item[Issue 1.31 (1995/10/25)] Enhancement 15.
\item[Issues 1.32 (1995/11/23)-1.35 (1995/11/28)] Enhancements to translation of basic declarations
(enhancements number, 2, 3, 8).
\item[Issues 1.36 (1995/11/29)-1.37 (1995/12/01)] Enhancements 3 and 18.
\item[Issue 1.38 (1995/12/14) (14th December 1995)] Changes according to desk check report 024.
\item [Issue 1.39 (1996/02/12)] Improved error reporting.
\item[Issue 1.40 (1997/05/29)] IUCT WP 7 changes.
\item[Issue 1.41 (1997/07/18)] IUCT WP 4 changes.
\item[Issue 1.42 (1997/07/29)] Corrected Z syntax and type errors.
\item[Issue 1.43 (1997/07/31)] Improved some error messages.
\item[Issue 1.44 (1997/08/18)] Updated references.
\item[Issue 1.45 (1999/02/25),1.46 (1999/02/26)] Update for SML97. Fixed broken error message.
\item[Issue 1.47 (1999/03/07)] Update for new INTEGER type.
\item[Issue 1.48 (2000/05/23)] Trial of enhancements from \cite{LEMMA1/DAZ/HLD506}.
\item[Issue 1.49 (2000/05/31),1.50 (2000/06/01)] Typechecking new approach to enhancement R3 --- Assignment to Record Components.
\item[Issue 1.51 (2000/06/16)] Enhancement R2 --- Multiple Logical Constants.
\item[Issues 1.52 (2000/06/16)-1.54 (2000/06/20)] Enhancement R1 --- Multidimensional Arrays.
\item[Issue 1.55 (2000/10/17)] CTLE II R1/2 --- ``Others'' in case statements.
\item[Issue 1.55 (2000/10/17)] CTLE II R1/2 --- ``Others'' in case statements.
\item[Issue 1.56 (2000/10/18)] CTLE II R1/4 --- logical operators on arrays
of booleans, including overloading, and some parts of R1/1 (reals) and R1/8 (characters and strings).
\item[Issue 1.57 (2000/10/18),1.58 (2000/10/19)] CTLE II R1/8 --- characters and strings.
\item[Issue 1.59 (2000/10/20)] CTLE II R1/5 --- range attributes as ranges.
\item[Issue 1.60 (2000/10/24)] CTLE II R1/9 --- SPARK 83 attributes.
\item[Issue 1.61 (2000/10/26)] CTLE II R1/11 --- nested packages.
\item[Issues 1.62 (2000/10/29),1.63 (2000/10/30)] CTLE II R1/11 --- real types.
\item[Issue 1.64 (2000/12/21)] Fixed omission in spec of {\it Exp\_Type\_Conv}.
\item[Issue 1.65 (2001/09/15)] Fixed {\LaTeX} errors.
\item[Issue 1.66 (2001/11/07)] Fixed incorrect description of {\it CN\_ENV}.
\item[Issue 1.67 (2001/11/08)] Improved error message 508081
\item[Issue 1.68 (2001/11/08)] R0021: new treatment of AND THEN and OR ELSE.
\item[Issue 1.69 (2001/11/09), 1.70 (2001/11/10)] R0021: domain condition generation.
\item[Issue 1.71 (2001/12/12)] Removed local declarations for Poly/ML port.
\item[Issues 1.72 (2001/12/15), 1.73 (2001/12/16)] R0037: support for named numbers.
\item[Issue 1.74 (2002/01/14)] Index brackets added.
\item[Issue 1.75 (2002/01/24)] R0006: spec updates.
\item[Issue 1.76 (2002/01/25),1.77 (2002/01/26)] R0006: code added.
\item[Issue 1.78 (2002/01/29)] R0044: checks on array ranges.
\item[Issue 1.79 (2002/01/30)] Fixed {\LaTeX} errors.
\item[Issue 1.80 (2002/02/14)] Fixed missing index brackets.
\item[Issue 1.80 (2002/02/14)] Fixing {\LaTeX} problems for SPC503.
\item[Issue 1.81 (2002/02/15)] New error message for error in array aggregates.
\item[Issue 1.81 (2002/02/15)] Fixed misleading (but probably impossible) error message.
\item[Issue 1.82 (2002/02/18)-1.84 (2002/05/02)] Spring 2002 enhancements: accommodating new syntax for interim release.
\item[Issue 1.85 (2002/05/03), 1.86 (2002/05/04)]  New functionality for discriminants.
\item[Issue 1.87 (2002/05/07). 1.88 (2002/05/08)] Renaming
\item[Issue 1.89 (2002/05/14), 1.90 (2002/05/17)] Spec updates for interim release.
\item[Issue 1.91 (2002/05/25)] Removed redundant error message.
\item[Issue 1.92 (2002/05/30)] Fixed {\LaTeX} errors.
\item[Issue 1.93 (2002/07/09)] R0078: ada constant declarations now translated into axiomatic descriptions (which
introduces a new error case when the type mark is not compatible with the expression).
\item[Issue 1.94 (2002/07/15)] Moved {\it init\_var} here from DTD505 to give a bit more commonality.
\item[Issue 1.95 (2002/08/08)] R0051: default parameters.
\item[Issue 1.96 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.97 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.98 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.99 (2002/11/25)] Schemas-as-declarations now catered for in output Z syntax.
\item[Issue 1.100 (2002/12/05)] Spec and signature changes for schema references in function $\Xi$-lists.
\item[Issue 1.101 (2003/02/06)] Updates to the Z specs after GMP's preliminary review.
\item[Issue 1.102 (2003/02/18)] Fixed {\LaTeX} error.
\item[Issues 1.103 (2004/06/20)-1.104 (2004/06/21)] Reform of the Environments.
\item[Issue 1.105 (2005/07/26)] New error message for use in translating function calls.
\item[Issue 1.106 (2005/07/29)] Added interface so the VC generator can find out whether we are generating domain conditions.
\item[Issue 1.107 (2005/09/08)] Allowed for new scheme for type names in Z.
\item[Issue 1.108 (2005/09/14),1.109 (2005/09/15)] Added new error message.
\item[Issue 1.110 (2005/12/07)] Aggregates inside aggregates no longer need to be in qualified expressions.
\item[Issue 1.111 (2006/01/16)] Use of term ``in scope'' in error messages is now consistent with other modules.
\item[Issue 1.112 (2006/03/17)] First clean compile for enhancement 117.
\item[Issue 1.113 (2006/03/24)] More adjustments for enhancement 117.
\item[Issue 1.114 (2006/04/11)] Under enhancement 117, checks on use of names in Z are now given a uniform treatment.
\item[Issue 1.115 (2006/04/20)] Ada real literals are now translated into Z floating point literals.
\item[Issue 1.116 (2006/05/04)] Improved error messages for numeric literals.
\item[Issues 1.117 (2006/06/12),1.118 (2008/03/23)] Child packages.
\item[Issue 1.119 (2008/05/05)] Modular types.
\item[Issue 1.120 (2008/07/24)] Support for modular types temporarily withdrawn.
\item[Issue 1.121 (2010/02/11)] Removed obsolete CUTDOWNVERSION option.
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
This document contains the detailed design for the Basic Declaration and Expression Generator. The design is in response to the high level design for compliance notation processing \cite{ISS/HAT/DAZ/HLD503}.

The document provides a design which implements DRA's specification for Basic Declaration and Expression Generation described in \cite[volume 3]{DRA/CIS/CSE3/TR/94/27/3.0}.
Specifically, the implementation corresponds to the specification in sections 5 and 6 of \cite[volume 3]{DRA/CIS/CSE3/TR/94/27/3.0}.

Free type definitions in the specification of the Abstract Syntax for Z in \cite[volume 3]{DRA/CIS/CSE3/TR/94/27/3.0} are implemented as functions corresponding to the type constructors of the type definitions. The design of these is covered by this document.

\subsection{Introduction}

\subsubsection{Purpose and Background}
The declaration and expression generator is called by the VC generator \cite{ISS/HAT/DAZ/IMP505} and the Z document generator \cite{ISS/HAT/DAZ/IMP507} to translate SPARK basic declarations and expressions into Z according to the algorithms specified in \cite[volume 3]{DRA/CIS/CSE3/TR/94/27/3.0}.

The Z of \cite[volume 3]{DRA/CIS/CSE3/TR/94/27/3.0} is reproduced in this document (suitable for type-checking with {\Product}) adjacent to the signature declarations of the functions which implement the Z. The corresponding implementatation is in \cite{ISS/HAT/DAZ/IMP508}.

\subsection{Compliance}

This detailed design contains signatures for Standard ML functions with the Z specification of these functions, transcribed from \cite[volume 3]{DRA/CIS/CSE3/TR/94/27/3.0}. The names of these functions corresponds to the names used in the Z, and where they differ, justification has been provided.

The implementation of this design can be found in \cite{ISS/HAT/DAZ/IMP508} where the style of coding is intended to make the compliance with the Z specification evident by a visual comparison.

%\subsubsection{Possible Enhancements}
%\subsubsection{Deficiencies}

\section{PREAMBLE}
The following literate script is used for type checking the Z in this document with {\Product}. It is not processed when building the Compliance Tool.

=SMLZ
open_theory"dtd502";
push_pc "z_library";
force_delete_theory"dtd508" handle Fail _ => ();
val _ = set_flag ("z_type_check_only", true);
new_theory "dtd508";
=TEX

\section{THE SIGNATURE $CNBasicDeclsAndExprs$}
=DOC
signature ⦏CNBasicDeclsAndExprs⦎ = sig
=DESCRIBE
This is the signature for the Basic Declaration and Expression Generator.
=ENDDOC
It would be much nicer if the following signature inclusion could
be replaced by a local declaration of the corresponding structure
but that is not supported in strict SML '97.
=SML
include CNTypes;
=TEX
\section{SUPPORT FOR Z ABSTRACT SYNTAX}

\subsection{Z Unary Expressions}

=DOC
val ⦏z_unary_minus⦎ : Z_EXP
val ⦏z_bool_not⦎ : Z_EXP
val ⦏z_abs⦎ : Z_EXP
=DESCRIBE
\raggedright{This corresponds to the abstract syntax of Z for unary expressions in ISS/HAT/DAZ/DTD502.}
=ENDDOC

\subsection{Z Binary Expressions}

=DOC
val ⦏z_bool_and⦎ : Z_EXP
val ⦏z_bool_or⦎ : Z_EXP
val ⦏z_bool_xor⦎ : Z_EXP
val ⦏z_bool_eq⦎ : Z_EXP
val ⦏z_bool_noteq⦎ : Z_EXP
val ⦏z_bool_less⦎ : Z_EXP
val ⦏z_bool_less_eq⦎ : Z_EXP
val ⦏z_bool_greater⦎ : Z_EXP
val ⦏z_bool_greater_eq⦎ : Z_EXP
val ⦏z_add⦎ : Z_EXP
val ⦏z_minus⦎ : Z_EXP
val ⦏z_times⦎ : Z_EXP
val ⦏z_intdiv⦎ : Z_EXP
val ⦏z_mod⦎ : Z_EXP
val ⦏z_rem⦎ : Z_EXP
val ⦏z_expon⦎ : Z_EXP
val ⦏z_bool_mem⦎ : Z_EXP
val ⦏z_bool_notmem⦎ : Z_EXP
=DESCRIBE
\raggedright{This corresponds to the abstract syntax of Z for binary expressions in ISS/HAT/DAZ/DTD502.}
=ENDDOC

\subsection{Z Expressions}
=DOC
val ⦏z_succ⦎ : Z_EXP
val ⦏zid⦎ : CN_ENV -> Z_ID -> Z_EXP
val ⦏z_num⦎ : INTEGER -> Z_EXP
val ⦏z_string⦎ : string -> Z_EXP
val ⦏z_tfun⦎ : (Z_EXP * Z_EXP) -> Z_EXP
val ⦏z_pfun⦎ : (Z_EXP * Z_EXP) -> Z_EXP
val ⦏z_rng⦎ : (Z_EXP * Z_EXP) -> Z_EXP
val ⦏z_dom⦎ : Z_EXP -> Z_EXP
val ⦏z_dom_res⦎ : (Z_EXP * Z_EXP) -> Z_EXP
val ⦏z_inv⦎ : Z_EXP -> Z_EXP
val ⦏z_id_rel⦎ : Z_EXP -> Z_EXP
val ⦏z_size⦎ : Z_EXP -> Z_EXP
val ⦏z_set⦎ : Z_EXP list -> Z_EXP
val ⦏z_set_minus⦎ : (Z_EXP * Z_EXP) -> Z_EXP
val ⦏z_set_comp⦎ : (Z_DECL * Z_EXP) -> Z_EXP
val ⦏z_power⦎ : (Z_EXP * Z_EXP) -> Z_EXP
val ⦏z_rel_comp⦎ : (Z_EXP * Z_EXP) -> Z_EXP
val ⦏z_seq⦎ : Z_EXP list -> Z_EXP
val ⦏z_cross⦎ : (Z_EXP * Z_EXP) -> Z_EXP
val ⦏z_many_cross⦎ : (Z_EXP list) -> Z_EXP
val ⦏z_override⦎ : (Z_EXP * Z_EXP) -> Z_EXP
val ⦏z_many_union⦎ : Z_EXP list -> Z_EXP
val ⦏z_unary_exp⦎ : (Z_EXP * Z_EXP) -> Z_EXP
val ⦏z_bin_exp⦎ : (Z_EXP * Z_EXP * Z_EXP) -> Z_EXP
val ⦏z_fun_call⦎ : (Z_EXP * Z_EXP list) -> Z_EXP
val ⦏z_selection⦎ : (Z_EXP * Z_ID) -> Z_EXP
val ⦏z_maplet⦎ : (Z_EXP * Z_EXP) -> Z_EXP
val ⦏z_powerset⦎ : Z_EXP -> Z_EXP
val ⦏z_binding⦎ : (string * Z_EXP) list -> Z_EXP
val ⦏z_tuple⦎ : Z_EXP list -> Z_EXP
val ⦏other_z_exp⦎ : Z_EXP -> Z_EXP
=DESCRIBE
\raggedright{This corresponds to the abstract syntax of Z for expressions in ISS/HAT/DAZ/DTD502,
with one exception, namely {\it z\_rng}:}
ⓈZAX
│ ⦏z_rng⦎ : Z_EXP × Z_EXP → Z_EXP
■

=ENDDOC

\subsection{Z Predicates}

=DOC
val ⦏z_true⦎ : Z_PRED
val ⦏z_eq⦎ : (Z_EXP * Z_EXP) -> Z_PRED
val ⦏z_and⦎ : (Z_PRED * Z_PRED) -> Z_PRED
val ⦏z_many_and⦎ : Z_PRED list -> Z_PRED
val ⦏z_elem⦎ : (Z_EXP * Z_EXP) -> Z_EXP
val ⦏z_notelem⦎ : (Z_EXP * Z_EXP) -> Z_EXP
val ⦏z_noteq⦎ : (Z_EXP * Z_EXP) -> Z_PRED
val ⦏z_less_eq⦎ : (Z_EXP * Z_EXP) -> Z_PRED
val ⦏z_greater⦎ : (Z_EXP * Z_EXP) -> Z_PRED
val ⦏z_forall⦎ : (Z_DECL list * Z_PRED) -> Z_PRED
val ⦏z_exists⦎ : (Z_DECL list * Z_PRED) -> Z_PRED
val ⦏z_imp⦎ : (Z_PRED * Z_PRED) -> Z_PRED
val ⦏z_mem⦎ : (Z_EXP * Z_EXP) -> Z_PRED
val ⦏other_z_pred⦎ : Z_PRED -> Z_PRED
=DESCRIBE
\raggedright{This corresponds to  the abstract syntax of Z for predicates in ISS/HAT/DAZ/DTD502.}
=ENDDOC
=DOC
val ⦏z_predexp_of_z_tm⦎ :
		CN_ENV ->
		ZUserInterfaceSupport.Z_TM -> Z_PRED;
val ⦏init_var⦎ : Z_ID -> Z_ID;
val ⦏z_free_var_report⦎ : int -> TERM OPT -> string list -> unit;
=DESCRIBE
The function $z\_predexp\_of\_z\_tm$ type-checks a parsed Z term and generates the corresponding term. This can be either a $Z\_PRED$ or an $Z\_EXP$ which in fact are aliases for $TERM$.
The first argument gives a compliance notation environment used to construct error messages.

$init\_var$ decorates a string with a subscript 0 as used to indicate an initial variable
in a post-condition.

In the following, 508012 is a fallback error message that should not occur in normal operation.
$z\_free\_var\_report$ produces an error message following the same format as $z\_predexp\_of\_z\_tm$ using the specified error number as the fallback.

=FAILURE
508010	Z variables used in the Compliance Notation must be
	in scope. The following variable?0 ?1 not in scope:
508011	Ada names in Z expressions must be given in canonical
	form. The following name?0 ?1 not in canonical form:
508012	The Z term contained the following name?0 that ?1
	not allowed here:
508018	The Z term ?0 is not valid here because
508019	Illegal Z term
=ENDDOC
=DOC
val ⦏z_tm_true⦎ : ZUserInterfaceSupport.Z_TM;
=DESCRIBE
The value $z\_tm\_true$ is a value true represented as a $Z\_TM$.
=ENDDOC
=DOC
val ⦏name_to_tmark⦎ : EXP -> TMARK;
=DESCRIBE
This function converts an expression in compliance notation (identical to a SPARK expression) to a type mark. Only valid identifiers result in a valid type mark.
otherwise the type-mark ``\_\_invalid'' is generated.
=ENDDOC
=DOC
val ⦏exp_to_discrete_range⦎ : EXP -> SI_DISCRETE_RANGE;
=DESCRIBE
This function converts an Ada expression (represented in the abstract syntax output by
the parser) to a discrete range.
=FAILURE
508091	Missing TYPE MARK
=ENDDOC
=DOC
 val ⦏is_range_attribute⦎ : EXP -> bool
=DESCRIBE
This function tests whether an expression is a range attribute.
=ENDDOC
\subsection{Z Paragraphs}

=DOC
val ⦏z_eq_eq⦎ : string -> (Z_ID * Z_EXP) -> ZParagraphs.PARAINFO
val ⦏z_ax⦎ : string -> (Z_ID * Z_EXP * Z_PRED list) -> ZParagraphs.PARAINFO
val ⦏z_schema⦎ : (Z_ID * Z_DECL list * Z_PRED) -> ZParagraphs.PARAINFO
val ⦏z_constrained_schema⦎ : (Z_ID * Z_EXP * Z_PRED) -> ZParagraphs.PARAINFO
=DESCRIBE
\raggedright{This corresponds to the abstract syntax of Z for some of the Z paragraphs in ISS/HAT/DAZ/DTD502.}
The first parameter of each function names the kind (constant, type or subtype)
of declaration being processed and is used to fill in ?0
in the following error message:
=FAILURE
508106	The expressions in ?0 declarations must be static and static
	expressions must not contain variables.
	This declaration contains the variable?2 ?1
=ENDDOC

\subsection{Failure Messages}
The following error messages can be reported by the functions which support the Z abstract syntax.

=FAILURE
508021	The variable ?0 is not in scope in the Ada program
	and is not declared as an auxiliary variable or
	logical constant
508023	Internal error: ?0 is a badly formed Z declaration
508024	Internal error: The expression list argument must not be empty
508077	The variable ?0 is in scope in the Ada program
	but cannot be used here because it has not been
	listed in the frame or global dependency list of the
	containing subprogram
508078	The environment entry for ?0 is corrupt (no type information)
=TEX

\section{TRANSLATING SPARK EXPRESSIONS}

The following corresponds to the specification in \cite[volume 3]{DRA/CIS/CSE3/TR/94/27/3.0}.

The signature for $trans\_exp$ is in section \ref{transexp}.

ⓈZAX
│	⦏trans_exp⦎ : EXP ⇸ Z_EXP
■

┌⦏Exp_Pars⦎──────────────────
│	expr : EXP;
│	zexpr : Z_EXP
└──────────────────

\subsection{Translating Identifiers}
=DOC
val ⦏trans_id⦎ : ID -> Z_ID;
val ⦏prefix_trans_id⦎ : Z_ID list -> ID -> Z_ID;
val ⦏trans_expanded_name⦎ : EXPANDED_NAME -> Z_ID
=DESCRIBE
ⓈZAX
│	⦏trans_id⦎ : ID → Z_ID
■
=ENDDOC

Note {\it Id} in the following paragraph rather than $id$ because $id$ is a reserved word in the Z library of {\ProductZ}.

┌⦏Exp_Id⦎──────────────────
│	Exp_Pars
├────────
│	∃ ident : ID ⦁ expr = Id ident ∧ zexpr = zid(trans_id ident)
└──────────────────

\subsection{Translating Aggregates (Positional Array)}
=DOC
val ⦏zfst⦎ : Z_ID
val ⦏zlst⦎ : Z_ID
val ⦏zsuc⦎ : Z_ID
val ⦏zpred⦎ : Z_ID
val ⦏zpos⦎ : Z_ID
val ⦏zval⦎ : Z_ID
val ⦏zlength⦎ : Z_ID
val ⦏zrange⦎ : Z_ID
=DESCRIBE
ⓈZ
│	⦏zfst⦎ ≜ trans_id fst
■
ⓈZ
│	⦏zlst⦎ ≜ trans_id lst
■
ⓈZ
│	⦏zsuc⦎ ≜ trans_id suc
■
ⓈZ
│	⦏zpred⦎ ≜ trans_id pred
■
ⓈZ
│	⦏zpos⦎ ≜ trans_id pos
■
ⓈZ
│	⦏zval⦎ ≜ trans_id val
■
ⓈZ
│	⦏zlength⦎ ≜ trans_id length
■
ⓈZ
│	⦏zrange⦎ ≜ trans_id range
■
ⓈZ
│	⦏zdelta⦎ ≜ trans_id delta
■
ⓈZ
│	⦏zdigits⦎ ≜ trans_id digits
■
=ENDDOC

=DOC
(* infix 3 ^^; *)

val ⦏^^⦎ : Z_ID * Z_ID -> Z_ID
=DESCRIBE
ⓈZ
│	fun 3	_ ⦏^⦎ _
■
ⓈZAX
│	_ ⦏^⦎ _ : (Z_ID × Z_ID) → Z_ID
■
=ENDDOC

=DOC
val ⦏dest_range⦎ : EXP RANGE -> EXP RANGELOHI
=DESCRIBE
Given a range of either of the forms {\it x .. y}
or {\it t'range}, this function gives upper and lower
bounds for the range (either {\it x} and {\it y}
or {\it t'first} and {\it t'last}. It also handles
the case {\it t.range(n)} by mapping to {\it t'first(n)} and {\it t'last(n)}.
It is exposed here so that it can be used in the verification condition generation
for case and loop statements.
=ENDDOC
The function $map$ already exists in {\Product} and already corresponds to this specification.

╒[X, Y]════════════════════════════
│	⦏map⦎ : (X → Y) → seq X → seq Y
├─────────────────────
│	∀ f : X → Y; s : seq X ⦁
│	map f s = { i : ℤ; x : X | (i, x) ∈ s ⦁ (i, f x)}
└──────────────────────
=DOC
val ⦏dimen⦎ : Z_ID * int -> Z_ID
=DESCRIBE
ⓈZAX
│ ⦏dimen⦎ : (Z_ID × ℕ) → Z_ID
■
=ENDDOC
=DOC
type ⦏ARRAY_AGG_ENV⦎ (* = {tname : TMARK, this : int, max : int} *);
=DESCRIBE
┌ ⦏Array_Agg_Env⦎ ───────────
│	tname : TMARK;
│	this, max  : ℕ
├──────
│	 1 ≤ this ≤ max + 1
└──────────────
=ENDDOC
=DOC
val ⦏trans_array_agg_exp⦎ : CN_ENV -> ARRAY_AGG_ENV -> EXP -> Z_EXP
=DESCRIBE
ⓈZAX
│	⦏trans_array_agg_exp⦎ : Array_Agg_Env → EXP ⇸ Z_EXP
├──────
│	∀ Array_Agg_Env
│	|	this = max + 1
│	⦁	trans_array_agg_exp (θArray_Agg_Env) = trans_exp
■
=ENDDOC
┌ ⦏Array_Agg_Pars⦎ ───────────
│ 	Array_Agg_Env;
│ 	expr : EXP;
│	zexpr : Z_EXP
└──────────────
=DOC
val ⦏array_first⦎ : CN_ENV -> ARRAY_AGG_ENV -> Z_EXP;
=DESCRIBE
ⓈZAX
│	⦏array_first⦎ : Array_Agg_Env  → Z_EXP
├──────
│	∀ Array_Agg_Env
│	⦁ max = 1 ∧
│		array_first(θArray_Agg_Env) = zid(trans_id tname ^ zfst)
│	∨ max ≠ 1 ∧
│		array_first(θArray_Agg_Env) = zid(dimen(trans_id tname ^ zfst, this))
■
=ENDDOC
=DOC
val ⦏exp_array_agg_pos⦎ : CN_ENV -> ARRAY_AGG_ENV -> EXP AGG_POS -> Z_EXP
=DESCRIBE
┌⦏Exp_Array_Agg_Pos⦎──────────────────
│	Array_Agg_Pars
├────────
│	∃ Agg_Pos; Z_Bin_Exp; zseq : seq Z_EXP; Array_Agg_Env' ⦁
│	expr = array_agg_pos (θAgg_Pos) ∧
│	ran comps ⊆ dom (trans_array_agg_exp (θArray_Agg_Env')) ∧
│	zop = z_minus ∧ zleft = z_num 1 ∧
│	zright = array_first(θArray_Agg_Env) ∧
│	tname' = tname ∧ this' = this+1 ∧ max' = max ∧
│	zseq = map (trans_array_agg_exp (θArray_Agg_Env')) comps ∧
│	zexpr =
│	z_rel_comp(z_power(z_succ, z_bin_exp(θZ_Bin_Exp)), z_seq zseq)
└──────────────────
=ENDDOC

\subsection{Translating Aggregates (Positional Array with Others)}
=DOC
val ⦏exp_array_agg_pos_others⦎ : CN_ENV -> ARRAY_AGG_ENV -> EXP AGG_POS_OTHERS -> Z_EXP
=DESCRIBE
┌⦏Exp_Array_Agg_Pos_Others⦎──────────────────
│	Array_Agg_Pars
├────────
│	∃ Agg_Pos_Others; oth, posit : EXP; Array_Agg_Env' ⦁
│	expr = array_agg_pos_others (θ Agg_Pos_Others) ∧
│	oth = array_agg_others (θ Agg_Others) ∧
│	posit = array_agg_pos (θ Agg_Pos) ∧
│	oth ∈ dom (trans_array_agg_exp (θArray_Agg_Env)) ∧
│	posit ∈ dom (trans_array_agg_exp (θArray_Agg_Env')) ∧
│	tname' = tname ∧ this' = this+1 ∧ max' = max ∧
│	zexpr =
│	z_override
│	(trans_array_agg_exp (θArray_Agg_Env) oth,
│	 trans_array_agg_exp (θArray_Agg_Env') posit)
└──────────────────
=ENDDOC

\subsection{Translating Aggregates (Positional Array with Just Others)}
=DOC
val ⦏array_range⦎ : CN_ENV -> ARRAY_AGG_ENV -> Z_EXP;
=DESCRIBE
ⓈZAX
│	⦏array_range⦎ : Array_Agg_Env  → Z_EXP
├──────
│∀ Array_Agg_Env⦁
│	max = 1 ∧
│	array_range(θArray_Agg_Env) = zid(trans_id tname ^ zrange)
│ ∨	max ≠ 1 ∧
│	array_range(θArray_Agg_Env) = zid(dimen(trans_id tname ^ zrange, this))
■
=ENDDOC
=DOC
val ⦏exp_array_agg_others⦎ : CN_ENV -> ARRAY_AGG_ENV -> EXP AGG_OTHERS -> Z_EXP
=DESCRIBE
┌⦏Exp_Array_Agg_Others⦎──────────────────
│	Array_Agg_Pars
├────────
│	∃ Agg_Others; Array_Agg_Env' ⦁
│	expr = array_agg_others (θ Agg_Others) ∧
│	others ∈ dom (trans_array_agg_exp (θArray_Agg_Env')) ∧
│	tname' = tname ∧ this' = this+1 ∧ max' = max ∧
│	zexpr =
│	z_cross(array_range(θArray_Agg_Env),
│	 z_set {trans_array_agg_exp (θArray_Agg_Env') others} )
└──────────────────
=ENDDOC

\subsection{Translating Aggregates (Named Array)}
=DOC
val ⦏trans_named_assoc⦎ : CN_ENV -> ARRAY_AGG_ENV ->
	(AGG_CHOICE,EXP) NAMED_ASSOC -> Z_EXP
=DESCRIBE
ⓈZAX
│	⦏trans_named_assoc⦎ : Array_Agg_Env → Named_Assoc ⇸ Z_EXP
├────────
│∀ Array_Agg_Env; Array_Agg_Env'⦁
│	tname' = tname ∧ this' = this+1 ∧ max' = max ∧
│	dom (trans_named_assoc (θArray_Agg_Env)) =
│	{ Named_Assoc |
│	(∀ Range | agg_choice_range (θ Range) ∈ choices ⦁
│		{lo, hi} ⊆ dom trans_exp) ∧
│	(∀ ex : EXP | agg_choice_single ex ∈ choices ⦁ ex ∈ dom trans_exp) ∧
│	comp ∈ dom (trans_array_agg_exp(θArray_Agg_Env'))} ∧
│	(∀ Named_Assoc
│	| θNamed_Assoc ∈ dom (trans_named_assoc (θArray_Agg_Env))⦁
│	∃ zranges : ℙ Z_EXP; zsingles : Z_EXP ⦁
│	zranges =
│	{ Range | agg_choice_range (θ Range) ∈ choices ⦁
│		z_rng(trans_exp lo, trans_exp hi)} ∧
│	zsingles =
│	z_set
│	{ ex : EXP | agg_choice_single ex ∈ choices ⦁ trans_exp ex} ∧
│	trans_named_assoc (θArray_Agg_Env) (θ Named_Assoc) =
│	z_cross
│	(z_many_union(zranges ∪ {zsingles}),
│	 z_set {trans_array_agg_exp (θArray_Agg_Env') comp} ))
■
=ENDDOC

=DOC
val ⦏exp_array_agg_named⦎ : CN_ENV ->
	ARRAY_AGG_ENV -> (AGG_CHOICE, EXP) AGG_NAMED -> Z_EXP
=DESCRIBE
┌⦏Exp_Array_Agg_Named⦎──────────────────
│	Array_Agg_Pars
├────────
│	∃ Agg_Named ⦁
│	expr = array_agg_named (θ Agg_Named) ∧
│	named_assocs ⊆ dom (trans_named_assoc (θArray_Agg_Env)) ∧
│	zexpr =
│	z_many_union
│	(trans_named_assoc (θArray_Agg_Env) ⦇ named_assocs ⦈ )
└──────────────────
=ENDDOC

\subsection{Translating Aggregates (Named Array with Others)}
=DOC
val ⦏exp_array_agg_named_others⦎ : CN_ENV
		-> ARRAY_AGG_ENV -> (AGG_CHOICE, EXP) AGG_NAMED_OTHERS -> Z_EXP
=DESCRIBE
┌⦏Exp_Array_Agg_Named_Others⦎──────────────────
│	Array_Agg_Pars
├────────
│	∃ Agg_Named_Others; oth, nam : EXP ⦁
│	expr = array_agg_named_others (θ Agg_Named_Others) ∧
│	oth = array_agg_others (θ Agg_Others) ∧
│	nam = array_agg_named (θ Agg_Named) ∧
│	{ oth, nam } ⊆ dom (trans_array_agg_exp(θArray_Agg_Env)) ∧
│	zexpr =
│	z_override
│	(trans_array_agg_exp(θArray_Agg_Env) oth,
│	 trans_array_agg_exp(θArray_Agg_Env) nam)
└──────────────────
=ENDDOC

{\def\PrNL#1\PrNN{\relax}
ⓈZ
│ ∀Array_Agg_Pars | this ≤ max ⦁
│	expr ↦ zexpr ∈ trans_array_agg_exp (θArray_Agg_Env) ⇔
│		 Exp_Array_Agg_Pos ∨ Exp_Array_Agg_Pos_Others ∨
│		 Exp_Array_Agg_Others ∨ Exp_Array_Agg_Named ∨
│	  	 Exp_Array_Agg_Named_Others ⦏(*⦎⦏taaeconstraint⦎⦏*)⦎		
■
}
=DOC
val ⦏array_dim⦎ : CN_ENV -> TMARK -> int;
=DESCRIBE
ⓈZAX
│ ⦏array_dim⦎ : TMARK ⇸ ℕ⋎1
■
=ENDDOC
=DOC
val z_array_agg : int -> Z_ID;
val ⦏mk_array_agg⦎ : int * Z_EXP -> Z_EXP;
=DESCRIBE
ⓈZAX
│ ⦏z_array_agg⦎ : ℕ → Z_ID
■

ⓈZAX
│ ⦏mk_array_agg⦎ : ℕ × Z_EXP → Z_EXP
├──────
│∀ max_dim : ℕ; zex : Z_EXP; Z_Fun_Call ⦁
│	max_dim = 1 ∧ mk_array_agg(max_dim, zex) = zex
│∨	zfun = zid(z_array_agg max_dim) ∧ zargs = ⟨zex⟩ ∧
│	mk_array_agg(max_dim, zex) = z_fun_call(θZ_Fun_Call)
■
=FAILURE
508058	type error detected while attempting to make a multidimensional aggregate from ?0
=ENDDOC
=DOC
val ⦏exp_array_agg⦎ : CN_ENV -> EXP -> Z_EXP
=DESCRIBE
┌⦏Exp_Array_Agg⦎ ──────────────────
│	Exp_Pars
├────────
│∃ Array_Agg_Env ⦁
│( (∃ Agg_Pos ⦁
│	expr = array_agg_pos (θ Agg_Pos)
│  ∧	opt_tmark_tmark tname = tmark) ∨
│  (∃ Agg_Pos_Others ⦁
│	expr = array_agg_pos_others (θ Agg_Pos_Others)
│  ∧	opt_tmark_tmark tname = tmark) ∨
│  (∃ Agg_Named ⦁
│	expr = array_agg_named (θ Agg_Named)
│  ∧	opt_tmark_tmark tname = tmark) ∨
│  (∃ Agg_Named_Others ⦁
│	expr = array_agg_named_others (θ Agg_Named_Others)
│  ∧	opt_tmark_tmark tname = tmark))
│∧ tname ↦ max ∈ array_dim
│∧ this = 1
│∧ expr ∈ dom (trans_array_agg_exp(θArray_Agg_Env))
│∧ zexpr = mk_array_agg (max, trans_array_agg_exp(θArray_Agg_Env) expr)
└──────────────────
=ENDDOC
=TEX

\subsection{Translating Aggregates (Positional Record)}

=DOC
val ⦏exp_rec_agg_pos⦎ : CN_ENV -> TMARK OPT * EXP list -> Z_EXP
=DESCRIBE
┌⦏Exp_Rec_Agg_Pos⦎──────────────────
│	Exp_Pars
├────────
│	∃ Rec_Agg_Pos; Z_Schema_Type; Z_Binding; tm : TMARK ⦁
│	expr = rec_agg_pos (θ Rec_Agg_Pos) ∧ ran comps ⊆ dom trans_exp ∧
│	z_type_of (zid (trans_id tmark)) =
│		z_power_type (z_sch_type (θ Z_Schema_Type)) ∧
│	zexpr = z_binding (θ Z_Binding) ∧
│	zbinds =
│	{ i : dom z_sig; Z_Decl |
│		zvar = Value (first (z_sig i)) ∧ zexp = trans_exp (comps i) ⦁ θ Z_Decl}
└──────────────────
=FAILURE
508026	The type ?0 is not a record type
508027	The number of components in the record aggregate
	does not match the declaration of ?0
=ENDDOC

\subsection{Translating Aggregates (Named Record)}
=DOC
val ⦏exp_rec_agg_named⦎ : CN_ENV
	-> (AGG_CHOICE, EXP) REC_AGG_NAMED -> Z_EXP
=DESCRIBE
┌⦏Exp_Rec_Agg_Named⦎──────────────────
│	Exp_Pars
├────────
│	∃ Rec_Agg_Named; Z_Binding ⦁
│	expr = rec_agg_named (θ Rec_Agg_Named) ∧
│	{ ident : ID; ex : EXP | (ident, ex) ∈ named_assocs ⦁ ex } ⊆
│		dom trans_exp ∧ zexpr = z_binding (θ Z_Binding) ∧
│	zbinds =
│	{ ident : ID; ex : EXP; Z_Decl |
│		(ident, ex) ∈ named_assocs ∧ zvar = Value(trans_id ident) ∧
│		zexp = trans_exp ex ⦁ θ Z_Decl }
└──────────────────
=ENDDOC

\subsection{Translating Unary Expressions}
=DOC
val ⦏unary_ops⦎ : UNARY_OP -> Z_EXP list;
val ⦏trans_unary_op⦎ : UNARY_OP * Z_EXP -> Z_EXP
=DESCRIBE
ⓈZAX
│	⦏unary_ops⦎ : UNARY_OP ⇸ ℙZ_UNARY_OP
├───────────────────
│	unary_ops =
│	{spark_unary_minus ↦ {z_unary_minus, z_real_unary_minus},
│	 spark_not ↦ {z_bool_not, z_array_not},
│	 spark_abs ↦ {z_abs, z_real_abs} }
■
ⓈZAX
│	⦏trans_unary_op⦎ : UNARY_OP × Z_EXP ⇸ Z_UNARY_OP
├───────────────────
│∀ op: UNARY_OP; zright : Z_EXP⦁
│	trans_unary_op(op, zright) ∈ unary_ops op
■
=FAILURE
508079	?0 is not a valid operand for this expression
508089	?0 and ?1 are not a valid pair of operands for this expression
=ENDDOC

=DOC
val ⦏exp_unary_exp⦎ : CN_ENV -> EXP UNARY_EXP -> Z_EXP
=DESCRIBE
┌⦏Exp_Unary_Exp⦎──────────────────
│	Exp_Pars
├────────
│	∃ Unary_Exp; Z_Unary_Exp ⦁
│	expr = unary_exp (θ Unary_Exp) ∧ right ∈ dom trans_exp ∧
│	(op = spark_unary_add ∧ zexpr = trans_exp right ∨
│	op ≠ spark_unary_add ∧ zop = trans_unary_op (op, zright) ∧
│	zright = trans_exp right ∧ zexpr = z_unary_exp (θ Z_Unary_Exp))
└──────────────────
=ENDDOC

\subsection{Translating Binary Expressions}
=DOC
val ⦏bin_ops⦎ : BIN_OP -> Z_EXP list
val ⦏trans_bin_op⦎ : BIN_OP * Z_EXP * Z_EXP -> Z_EXP
=DESCRIBE

=FAILURE
508031	Internal error: unsupported SPARK operator
=ENDDOC
ⓈZAX
│	⦏bin_ops⦎ : BIN_OP ⇸ ℙZ_BIN_OP
├───────────────────
│	bin_ops =
│	{spark_and ↦ { z_bool_and, z_array_and },
│	 spark_or ↦ { z_bool_or, z_array_or },
│	 spark_and_then ↦ { z_bool_and_then },
│	 spark_or_else ↦ { z_bool_or_else },
│	 spark_xor ↦ { z_bool_xor },
│	 spark_eq ↦ { z_bool_eq },
│	 spark_noteq ↦ { z_bool_noteq },
│	 spark_less ↦ { z_bool_less, z_array_less, z_bool_real_less },
│	 spark_less_eq ↦ { z_bool_less_eq, z_array_less_eq, z_bool_real_less_eq },
│	 spark_greater ↦ { z_bool_greater, z_array_greater, z_bool_real_greater },
│	 spark_greater_eq ↦ { z_bool_greater_eq, z_array_greater_eq,
│				z_bool_real_greater_eq },
│	 spark_add ↦ { z_add, z_real_add },
│	 spark_minus ↦ { z_minus, z_real_minus },
│	 spark_times ↦ { z_times, z_real_times },
│	 spark_intdiv ↦ { z_intdiv },
│	 spark_mod ↦ { z_mod },
│	 spark_over ↦ { z_real_over },
│	 spark_rem ↦ { z_rem },
│	 spark_expon ↦ { z_expon, z_real_expon },
│	 spark_mem ↦ { z_bool_mem },
│	 spark_notmem ↦ { z_bool_notmem },
│	 spark_cat ↦ { z_array_array_cat, z_array_elem_cat, z_elem_array_cat } }
■
ⓈZAX
│	⦏trans_bin_op⦎ : BIN_OP × Z_EXP × Z_EXP ⇸ Z_BIN_OP
├───────────────────
│∀ op: BIN_OP; zleft, zright : Z_EXP⦁
│	trans_bin_op(op, zleft, zright) ∈ bin_ops op
■
=DOC
val ⦏exp_bin_exp⦎ : CN_ENV -> EXP BIN_EXP -> Z_EXP
=DESCRIBE
┌⦏Exp_Bin_Exp⦎──────────────────
│	Exp_Pars
├────────
│	∃ Bin_Exp; Z_Bin_Exp ⦁
│	expr = bin_exp (θ Bin_Exp) ∧ { left, right } ⊆ dom trans_exp ∧
│	zop = trans_bin_op(op, zleft, zright) ∧ zleft = trans_exp left ∧
│	zleft ∈ {trans_exp left, z_integer_to_real (trans_exp left),
│		z_real_to_integer(trans_exp left)} ∧
│	zright ∈ {trans_exp right, z_integer_to_real (trans_exp right),
│		z_real_to_integer(trans_exp right)}
└──────────────────
=ENDDOC

\subsection{Translating Membership of a Range}
=DOC
val ⦏exp_mem_range⦎ : CN_ENV -> EXP MEM_RANGE -> Z_EXP
=DESCRIBE
┌⦏Exp_Mem_Range⦎──────────────────
│	Exp_Pars
├────────
│	∃ Mem_Range; Z_Bin_Exp ⦁
│	expr = mem_range (θ Mem_Range) ∧
│	{ left, lo, hi } ⊆ dom trans_exp ∧ zop = trans_bin_op(op, zleft, zright) ∧
│	zleft = trans_exp left ∧ zright = z_rng (trans_exp lo, trans_exp hi) ∧
│	zexpr = z_bin_exp (θ Z_Bin_Exp)
└──────────────────
=ENDDOC

\subsection{Translating Attributes}
=DOC
val ⦏tmark_of_prefix⦎ : CN_ENV -> Z_EXP -> TMARK
(* val ⦏trans_attr_prefix⦎ : (EXP, ATTRIB_DESIG) ATTRIBUTE -> ZID *)
val ⦏exp_attrib⦎ : CN_ENV -> (EXP, ATTRIB_DESIG) ATTRIBUTE -> Z_EXP
=DESCRIBE
The Z declaration of
{\it tmark\_of\_prefix} is in \cite[volume 2]{DRA/CIS/CSE3/TR/94/27/3.0}.
The function is used here in the (informally specified aspects of the) translation
of attributes.

ⓈZAX
│ ⦏trans_attr_prefix⦎ : Attribute → Z_ID
■
┌⦏Exp_Attrib⦎──────────────────
│	Exp_Pars
├────────
│	∃ Attribute; att : ATTRIB ⦁
│	expr = attribute (θ Attribute) ∧ attrib_desig = attrib[EXP] att ∧
│	zexpr = zid (trans_attr_prefix(θAttribute) ^ trans_id att)
└──────────────────
=FAILURE
508028	The attribute cannot be translated into Z
=ENDDOC

The implementations of {\it Exp\_Nonarray\_Attrib\_Arg}
and {\it Exp\_Array\_Attrib\_Arg} are covered by the interface for $exp\_attrib$ and a separate functional interface has therefore not been provided.
ⓈZ
│	⦏ARRAY_ATTRIB⦎ ≜ {fst, lst, length, range}
■

┌⦏Exp_Nonarray_Attrib_Arg⦎──────────────────
│	Exp_Pars
├────────
│	∃ Attribute; att : ATTRIB; arg : EXP; Z_Fun_Call ⦁
│	expr = attribute (θ Attribute) ∧
│	att ∉ ARRAY_ATTRIB ∧
│	attrib_desig = attrib_arg(att,arg) ∧ arg ∈ dom trans_exp ∧
│	zexpr = z_fun_call (θ Z_Fun_Call) ∧
│	zfun = zid (trans_attr_prefix(θAttribute) ^ trans_id att) ∧
│	zargs = ⟨ trans_exp arg ⟩
└──────────────────
=DOC
val ⦏eval_attr_arg⦎ : Z_EXP -> int
=DESCRIBE
ⓈZAX
│	⦏eval_attr_arg⦎ : EXP ⇸ ℕ⋎1
■
The implementation takes a Z expression to simplify the organisation of the
code.
=FAILURE
508029	Invalid attribute argument: ?0 cannot be statically evaluated to give an integer value
508030	Invalid attribute argument: ?0 is less than or equal to zero
=ENDDOC
┌⦏Exp_Array_Attrib_Arg⦎──────────────────
│	Exp_Pars
├────────
│	∃ Attribute; att : ATTRIB; arg : EXP ⦁
│	expr = attribute (θ Attribute) ∧
│	att ∈ ARRAY_ATTRIB ∧
│	attrib_desig = attrib_arg(att,arg) ∧ arg ∈ dom eval_attr_arg ∧
│	zexpr =
│	zid (dimen(trans_attr_prefix(θAttribute) ^ trans_id att, eval_attr_arg arg))
└──────────────────

ⓈZ
│ ⦏Exp_Attrib_Arg⦎ ≜ Exp_Nonarray_Attrib_Arg ∨ Exp_Array_Attrib_Arg
■

\subsection{Translating Indexed Components}
=DOC
val ⦏exp_indexed_comp⦎ : CN_ENV -> EXP INDEXED_COMP -> Z_EXP
=DESCRIBE
┌⦏Exp_Indexed_Comp⦎──────────────────
│	Exp_Pars
├────────
│	∃ Indexed_Comp; Z_Fun_Call ⦁
│	expr = indexed_comp (θ Indexed_Comp) ∧
│	{ prefix } ∪ ran index ⊆ dom trans_exp ∧ zfun = trans_exp prefix ∧
│	zargs = map trans_exp index ∧ zexpr = z_fun_call (θ Z_Fun_Call)
└──────────────────
=FAILURE
508071	type error: cannot apply ?0 to ?1
=ENDDOC

\subsection{Translating Selected Components}
=DOC
val ⦏exp_selected_comp⦎ : CN_ENV -> EXP SELECTED_COMP -> Z_EXP
=DESCRIBE
┌⦏Exp_Selected_Comp⦎──────────────────
│	Exp_Pars
├────────
│	∃ Selected_Comp; Z_Selection ⦁
│	expr = selected_comp (θ Selected_Comp) ∧ prefix ∈ dom trans_exp ∧
│	zbinding = trans_exp prefix ∧ zselector = trans_id selector ∧
│	zexpr = z_selection (θ Z_Selection)
└──────────────────
=ENDDOC

\subsection{Translating Functions Calls}
=DOC
val ⦏global_dep_par⦎ : CN_ENV -> ID -> Z_EXP;
val ⦏fun_globals⦎ : CN_ENV -> ID -> Z_EXP list;
val ⦏trans_fun_name⦎ : CN_ENV -> ID -> Z_EXP;
=DESCRIBE
ⓈZAX
│ ⦏fun_globals⦎ : ID → seq Z_EXP
■
ⓈZAX
│ ⦏fun_param_tmarks⦎ : ID → seq TMARK
■
ⓈZAX
│ ⦏trans_fun_name⦎ : ID → Z_EXP
├────────
│ ∀n : ID⦁
│ fun_globals n = ⟨⟩ ∧ trans_fun_name n = zid(trans_id n) ∨
│ (∃Z_Fun_Call ⦁ zargs = fun_globals n ∧
│  zfun = zid(trans_id n) ∧
│  trans_fun_name n = z_fun_call(θZ_Fun_Call))
■
{\it fun\_param\_tmarks} is implemented via the CN environment mechanism
and does not need an explicit ML function.
=FAILURE
508081	`?0' is not a valid function
508082	Incorrect number of actual parameters to function `?0'
=ENDDOC
The preprocessing of function calls actually means that these errors should never happen now.
=DOC
val ⦏slide⦎ : Z_EXP * Z_EXP -> Z_EXP;
val ⦏con_array_range_from_tmark⦎ : Z_EXP -> Z_EXP OPT;
val ⦏slide_to_tmark⦎ : CN_ENV -> Z_EXP * TMARK -> Z_EXP;
=DESCRIBE
ⓈZAX
│ ⦏slide_to_tmark⦎ : Z_EXP × TMARK → Z_EXP
■
These functions support the treatment of array sliding.
Given the translation into Z of a type mark denoting a constrained
array subtype, {\it con\_array\_range\_from\_tmark} returns
an expression denoting the range of the arrays in the subtype.
When this succeeds with result {\it r} for an expression
{\it a} denoting an element of some other constrained array type with the
same base type, {\it slide(a, r)} denotes the value obtained by sliding
{\it a} so its range becomes {\it r}.

{\it slide\_to\_tmark} fits these pieces together in a way which is
a little more convenient for other modules (and this is the formulation
used in the Z specifications). It is given a translated
expression and a type mark. If the type mark denotes a constrained
array subtype, then it returns the expression denoting the slided value
otherwise it returns the original expression.
The caller may test for whether sliding has occurred by checking whether
the result is equal to the supplied parameter or by observing that
sliding results in a Z function call.
=FAILURE
508090	Cannot construct the sliding expression for ?0
=ENDDOC
=DOC
val ⦏exp_fun_call⦎ : CN_ENV -> EXP FUN_CALL -> Z_EXP
=DESCRIBE
┌⦏Exp_Fun_Call⦎──────────────────
│	Exp_Pars
├────────
│ ∃ Fun_Call ⦁
│ expr = fun_call (θ Fun_Call) ∧ ran args ⊆ dom trans_exp ∧
│ (args = ⟨⟩ ∧ zexpr = trans_fun_name fun_name ∨
│ args ≠ ⟨⟩ ∧
│ (∃Z_Fun_Call; es_ts : seq (Z_EXP × TMARK)⦁
│  zfun = trans_fun_name fun_name ∧
│  map first es_ts = map trans_exp args ∧
│  map second es_ts = fun_param_tmarks fun_name ∧
│  zargs = map slide_to_tmark es_ts ∧
│  zexpr = z_fun_call(θ Z_Fun_Call)))
└──────────────────
=ENDDOC
\subsection{Translating Qualified Expressions}
=DOC
val ⦏exp_qualified⦎ : CN_ENV -> EXP QUALIFIED_EXPRESSION -> Z_EXP
=DESCRIBE
┌⦏Exp_Qualified⦎──────────────────
│	Exp_Pars
├────────
│	∃ Qualified_Exp ⦁
│	expr = qualified_exp (θ Qualified_Exp) ∧ ex ∈ dom trans_exp ∧
│	zexpr = trans_exp ex
└──────────────────
=ENDDOC

\subsection{Translating Type Conversions}
=DOC
val ⦏exp_type_conv⦎ : CN_ENV -> EXP TYPE_CONVERSION -> Z_EXP
=DESCRIBE
┌⦏Exp_Type_Conv⦎──────────────────
│	Exp_Pars
├────────
│ ∃ Type_Conv ⦁
│ expr = type_conv (θ Type_Conv) ∧ ex ∈ dom trans_exp ∧ ((
│	z_type_of(zid(trans_id tm)) = z_power_type z_int_type ∧
│	z_type_of zexpr = z_int_type ∧ zexpr = trans_exp ex
│ ) ∨ (
│	z_type_of(zid(trans_id tm)) = z_power_type z_real_type ∧
│	z_type_of zexpr = z_real_type ∧ zexpr = trans_exp ex
│ ) ∨ (
│	z_type_of(zid(trans_id tm)) = z_power_type z_real_type ∧
│	z_type_of zexpr = z_int_type ∧ zexpr = z_integer_to_real (trans_exp ex)
│ ) ∨ (
│	z_type_of(zid(trans_id tm)) = z_power_type z_int_type ∧
│	z_type_of zexpr = z_real_type ∧ zexpr = z_real_to_integer (trans_exp ex)
│ ))
└──────────────────
=FAILURE
508053	Type conversions for types other than scalar types
	cannot be handled formally
=ENDDOC

\subsection{Translating Integer Literals}
=DOC
val ⦏trans_int⦎ : INT_REAL_LIT -> INTEGER
=DESCRIBE
ⓈZAX
│	⦏trans_int⦎ : INT_LIT → ℤ
■
=FAILURE
508110	?0 is not a valid exponent
508111	The character ?0 is not allowed here in a numeric literal
508112	An integer literal with no digits is not allowed
508113	?0 is not a valid base ?1 digit
508114	?0 is not a valid decimal number
508115	Negative exponents are not allowed in integer literals
508116	An exponent part with no digits is not allowed
508117	The base in a based literal must be between 2 and 16;
	?0 is not a valid base
508025	Cannot translate ?0; this form of literal is not handled formally
=ENDDOC
=DOC
val ⦏exp_int_lit⦎ : INT_REAL_LIT -> Z_EXP
=DESCRIBE
┌⦏Exp_Int_Lit⦎──────────────────
│	Exp_Pars
├────────
│	∃ n : INT_LIT ⦁
│	expr = int n ∧ zexpr = z_num (trans_int n)
└──────────────────
=ENDDOC

\subsection{Translating Real Literals}
=DOC
val ⦏exp_real_lit⦎ : INT_REAL_LIT -> Z_EXP
=DESCRIBE
ⓈZAX
│	⦏trans_real⦎ : REAL_LIT → Z_REAL
■
┌⦏Exp_Real_Lit⦎──────────────────
│	Exp_Pars
├────────
│	∃ r : REAL_LIT ⦁
│	expr = real r ∧ zexpr = z_real (trans_real r)
└──────────────────
=ENDDOC


\subsection{Translating Character Literals}
=DOC
val ⦏exp_char_lit⦎ : CHAR_LIT -> Z_EXP
=DESCRIBE
ⓈZAX
│	⦏trans_char⦎ : CHAR_LIT → Z_STRING
■
┌⦏Exp_Char_Lit⦎──────────────────
│	Exp_Pars
├────────
│	∃ c : CHAR_LIT; Z_Unary_Exp ⦁
│	expr = char c ∧ zop = z_char_lit ∧ zright = z_string(trans_char c) ∧
│	zexpr = z_unary_exp (θZ_Unary_Exp)
└──────────────────

{\it trans\_char} is the identity function in this implementation, and so
no ML is needed for it.
=ENDDOC


\subsection{Translating String Literals}
=DOC
val ⦏exp_string_lit⦎ : CHAR_LIT -> Z_EXP

=DESCRIBE
ⓈZAX
│	⦏trans_string⦎ : STRING_LIT → Z_STRING
■
┌⦏Exp_String_Lit⦎──────────────────
│	Exp_Pars
├────────
│	∃ s : STRING_LIT; Z_Unary_Exp ⦁
│	expr = string s ∧ zop = z_string_lit ∧ zright = z_string(trans_string s) ∧
│	zexpr = z_unary_exp (θZ_Unary_Exp)
└──────────────────
{\it trans\_string} is the identity function in this implementation, and so
no ML is needed for it.
=ENDDOC

\subsection{Translating Auxiliary Expressions}
=DOC
val ⦏exp_auxiliary_exp⦎ : CN_ENV -> ZUserInterfaceSupport.Z_TM -> Z_EXP
=DESCRIBE
┌⦏Exp_Auxiliary_Exp⦎──────────────────
│	Exp_Pars
├────────
│	∃ ze : Z_EXP ⦁
│	expr = auxiliary_exp ze ∧ zexpr = ze
└──────────────────
=ENDDOC

\subsection{The Function $trans\_exp$}\label{transexp}
=DOC
val ⦏trans_exp⦎ : CN_ENV -> EXP -> Z_EXP
val ⦏trans_exp1⦎ : CN_ENV -> EXP -> Z_EXP OPT
=DESCRIBE
$trans\_exp$ translates a Compliance Notation (SPARK) expression into Z according to the algorithm specification in Volume 3 of DRA/CIS/CSE3/TR/94/27/3.0. following the Z specification below.

$trans\_exp1$ is just like $trans\_exp$ except that it returns an optional Z expression. If the SPARK expression can only be handled informally then a warning message is printed out and $Nil$ is returned.

{\def\PrNL#1\PrNN{\relax}
ⓈZ
│	∀ Exp_Pars ⦁
│	trans_exp expr = zexpr ⇔
│		Exp_Id ∨ Exp_Int_Lit ∨ Exp_Array_Agg ∨
│		Exp_Rec_Agg_Pos ∨ Exp_Rec_Agg_Named ∨ Exp_Unary_Exp ∨
│		Exp_Bin_Exp ∨ Exp_Mem_Range ∨ Exp_Attrib ∨ Exp_Attrib_Arg ∨
│		Exp_Indexed_Comp ∨ Exp_Selected_Comp ∨ Exp_Fun_Call ∨
│		Exp_Qualified ∨ Exp_Type_Conv ∨ Exp_Auxiliary_Exp ∨
│		Exp_Real_Lit ∨ Exp_Char_Lit ∨ Exp_String_Lit ⦏(*⦎⦏trans_expconstraint⦎⦏*)⦎
■
}
=FAILURE
508020	This form of expression cannot be handled formally here
508032	Internal error: unexpected use of a qualified expression constructor
508050	?0
508052	Ranges are not handled formally here
508054	An aggregate that is not the operand of a qualified expression
	and is not a subaggregate cannot be handled formally
508062	A subaggregate is required here
=ENDDOC
=TEX
\subsection{External Interface to Overload Resolution}
=DOC
val ⦏resolve_opsym⦎:
		CN_ENV ->
		OPERATOR_SYMBOL ->
		PARAMETER_SPECIFICATION list ->
		TMARK ->
		 (Z_EXP * TMARK list * TMARK) OPT;
=DESCRIBE
See \cite{ISS/HAT/DAZ/DTD507} for the formal specification.
The implementation also checks the return type and returns the information needed to
check further renamings of the new name.
=ENDDOC

\section{TRANSLATING SPARK BASIC DECLARATIONS}

The design in this section corresponds to the specification in section 6 of \cite[volume 3]{DRA/CIS/CSE3/TR/94/27/3.0}.


ⓈZAX
│	⦏trans_basic_decl⦎ : BASIC_DECL → seq Z_PARA
■

The following schema denotes the input and output parameters to basic declaration-handling functions.
┌⦏Basic_Decl_Pars⦎─────────────────
│	basic_decl : BASIC_DECL;
│	z : seq Z_PARA
└────────────────────

\subsection{Translating Constants}
=DOC
val ⦏basic_decl_const⦎ : CN_ENV * Z_ID list ->
		EXP CONST_DECL -> ZParagraphs.PARAINFO list
=DESCRIBE
┌⦏Basic_Decl_Const_1⦎─────────────────
│	Basic_Decl_Pars
├─────────────
│ ∃ Const_Decl; ze : Z_EXP; tmark : TMARK; Z_Decl; Z_Ax ⦁
│	basic_decl = const_decl (θ Const_Decl) ∧ expr ↦ ze ∈ trans_exp ∧
│	( 	tm = Value tmark ∧
│		zvar = Value(trans_id const) ∧ zexp = zid(trans_id tmark) ∧
│		decls = {θZ_Decl} ∧
│		preds = {z_eq(zid (trans_id const), slide_to_tmark(ze, tmark)) }  ∧
│		 z = ⟨z_ax(θZ_Ax)⟩
│	∨	tm = Nil ∧
│		z = ⟨z_eq_eq(trans_id const, ze)⟩)
└────────────────────
┌⦏Basic_Decl_Const_2⦎─────────────────
│	Basic_Decl_Pars
├─────────────
│ ∃ Const_Decl; Z_Ax; Z_Decl; tmark : TMARK ⦁
│	basic_decl = const_decl (θ Const_Decl) ∧ expr ∉ dom trans_exp ∧
│	zvar = Value(trans_id const) ∧ zexp = zid(trans_id tmark) ∧ tm = Value tmark ∧
│	decls = {θZ_Decl} ∧ preds = { } ∧ z = ⟨z_ax(θZ_Ax)⟩
│ ∨	tm = Nil ∧ z = ⟨⟩
└────────────────────
Note: the implementation of these is via a single function which takes
the appropriate action according as $expr$ is or is not translatable.
I.e. $basic\_decl\_const$ implements the schema disjunction of the above two schemas (which is what is required where they are used in $trans\_basic\_decl$).
=FAILURE
508067	The expression in the named number declaration for ?0 cannot be translated into Z
508068	The expression in the declaration for ?0 is incompatible with the type mark ?1
=ENDDOC

\subsection{Translating Enumeration Types}
=DOC
val ⦏enum_attrib⦎ : CN_ENV -> (Z_ID * Z_ID * Z_ID)
			-> ZParagraphs.PARAINFO list
=DESCRIBE
The name $Z\_PARA$ is already used in {\ProductZ} for something else, but $ZParagraphs.PARAINFO$ of {\ProductZ} actually corresponds in semantics to DRA's use of $Z\_PARA$.

ⓈZAX
│	⦏enum_attrib⦎ : (Z_ID × Z_ID × Z_ID) → seq Z_PARA
├─────────────
│ ∀ zid⋎1, zid⋎2, zid⋎3 : Z_ID ⦁
│ ∃ zexp : Z_EXP ⦁
│	zexp = z_set_minus(zid zid⋎1, z_set {zid (zid⋎1 ^ zlst)}) ∧
│	enum_attrib (zid⋎1, zid⋎2, zid⋎3) =
│		⟨z_eq_eq(zid⋎1 ^ zfst, zid zid⋎2),
│		z_eq_eq(zid⋎1 ^ zlst, zid zid⋎3),
│		z_eq_eq(zid⋎1 ^ zsuc, z_dom_res(zexp, z_succ)),
│		z_eq_eq(zid⋎1 ^ zpred, z_inv(zid (zid⋎1 ^ zsuc))),
│		z_eq_eq(zid⋎1 ^ zpos, z_id_rel (zid zid⋎1)),
│		z_eq_eq(zid⋎1 ^ zval, z_inv(zid(zid⋎1 ^ zpos)))⟩
■
=ENDDOC

=DOC
val ⦏basic_decl_enum⦎ : CN_ENV * Z_ID list ->
		ID -> ENUM_TYPE_DEF -> ZParagraphs.PARAINFO list
=DESCRIBE
┌⦏Basic_Decl_Enum⦎─────────────────
│	Basic_Decl_Pars
├─────────────
│ 	∃ Type_Decl; Enum_Type_Def; zname : Z_ID;
│	zvals : seq Z_ID ⦁
│	basic_decl = type_decl (θ Type_Decl) ∧
│	type_def = enum_type_def (θ Enum_Type_Def) ∧
│	zname = trans_id name ∧ zvals = map trans_id vals ∧
│	z =
│	{ i : dom vals ⦁ i ↦ z_eq_eq(zvals i, z_num(i-1))} ⁀
│		⟨z_eq_eq(zname, z_rng(zid(head zvals), zid(last zvals)))⟩ ⁀
│		enum_attrib(zname, head zvals, last zvals)
└────────────────────
=ENDDOC

\subsection{Translating Array Types}

=DOC
val ⦏array_attrib_aux⦎ : CN_ENV -> Z_ID -> (Z_ID * int) -> ZParagraphs.PARAINFO list
val ⦏array_attrib⦎ : CN_ENV -> (Z_ID * Z_ID list) -> ZParagraphs.PARAINFO list
=DESCRIBE
ⓈZAX
│	⦏array_attrib_aux⦎ : (Z_ID × Z_ID × ℕ) → seq Z_PARA
├─────────────
│ ∀ zid⋎1, zid⋎2 : Z_ID; i : ℕ ⦁
│	array_attrib_aux (zid⋎1, zid⋎2, i) =
│		⟨z_eq_eq(dimen(zid⋎1 ^ zfst, i), zid (zid⋎2 ^ zfst)),
│		z_eq_eq(dimen(zid⋎1 ^ zlst, i), zid (zid⋎2 ^ zlst)),
│		z_eq_eq(dimen(zid⋎1 ^ zlength, i), z_size (zid zid⋎2)),
│		z_eq_eq(dimen(zid⋎1 ^ zrange, i), zid zid⋎2)⟩
■

ⓈZAX
│	⦏array_attrib⦎ : (Z_ID × seq⋎1 Z_ID) → seq Z_PARA
├─────────────
│ ∀ zid : Z_ID; zids : seq⋎1 Z_ID ⦁
│	array_attrib (zid, zids) =
│		array_attrib_aux(zid, head zids, 0) ⁀
│		(λi : dom zids⦁ array_attrib_aux(zid, zids i, i))
■
{\it array\_attrib\_aux} is curried in ML to make the coding of
{\it array\_attrib} simpler.
=FAILURE
508035	Internal error: parser has generated a 0-dimensional array ?0
=ENDDOC

\newpage

=DOC
val ⦏basic_decl_con_array⦎ : CN_ENV * Z_ID list ->
		ID -> ARRAY_DEF -> ZParagraphs.PARAINFO list
=DESCRIBE
┌⦏Basic_Decl_Con_Array⦎─────────────────
│	Basic_Decl_Pars
├─────────────
│ ∃ Type_Decl; Array_Def; zname, zcomp : Z_ID; zindex : seq⋎1 Z_ID ⦁
│	basic_decl = type_decl (θ Type_Decl) ∧
│	type_def = con_array_def (θ Array_Def) ∧
│	zname = trans_id name ∧ zindex = map trans_id index ∧
│	zcomp = trans_id comp ∧
│	z =
│	⟨z_eq_eq (zname, z_tfun(z_many_cross(map zid zindex), zid zcomp))⟩ ⁀
│		array_attrib(zname, zindex)
└────────────────────

=ENDDOC

=DOC
val ⦏basic_decl_uncon_array⦎ : CN_ENV * Z_ID list ->
		ID -> ARRAY_DEF -> ZParagraphs.PARAINFO list
=DESCRIBE
┌⦏Basic_Decl_Uncon_Array⦎─────────────────
│	Basic_Decl_Pars
├─────────────
│ ∃ Type_Decl; Array_Def; Z_Ax; Z_Decl;
│		zname, zcomp : Z_ID; zindex : Z_EXP⦁
│	basic_decl = type_decl (θ Type_Decl) ∧
│	type_def = uncon_array_def (θ Array_Def) ∧
│	zname = trans_id name ∧
│	zindex = z_many_cross(map (zid o trans_id) index) ∧
│	zcomp = trans_id comp ∧ zvar = Value zname ∧
│	zexp = z_powerset(z_pfun(zindex, zid zcomp)) ∧
│	decls ={θZ_Decl} ∧ preds = { } ∧ z= ⟨z_ax(θ(Z_Ax))⟩
└────────────────────
=ENDDOC

\subsection{Translating Record Types}
=DOC
val ⦏trans_decl⦎ : CN_ENV -> VAR_DECL -> Z_DECL
val ⦏record_update_defs⦎ : (Z_ID * Z_ID list list) -> ZParagraphs.PARAINFO
=DESCRIBE
ⓈZAX
│	⦏trans_decl⦎ : Var_Decl → Z_Decl
├─────────────
│ ∀ Var_Decl; Z_Decl ⦁
│	trans_decl (θ Var_Decl) = θ Z_Decl ⇔
│		zvar = Value(trans_id var) ∧ zexp = zid (trans_id tmark)
│		
■
ⓈZAX
│ ⦏record_update_defs⦎ : ID × Record_Type_Def → seq Z_PARA
■
The {\Product} implementation uses {\it Z\_ID}s to save multiple calls of {\it trans\_id}
and returns a single paragraph, because that is all that is needed.
=ENDDOC
ⓈZAX
│ ⦏trans_comp_sub_ind⦎ : COMP_SUB_IND → Z_EXP
├──────
│ ∀ t : TMARK; lo, hi : EXP⦁
│	trans_comp_sub_ind (comp_sub_ind_tmark t) = zid (trans_id t)
│ ∧	trans_comp_sub_ind(comp_sub_ind_range (lo, hi)) = z_rng(trans_exp lo, trans_exp hi)
■

ⓈZAX
│ ⦏trans_comp_decl⦎ : Comp_Decl → Z_PRED
├──────
│ ∀ Comp_Decl; ssi : seq COMP_SUB_IND; dc : ID ⇸ EXP; zv : Z_EXP
│ |	zv = zid(trans_id var)
│ ⦁	(constraint = comp_no_con ⇒ trans_comp_decl (θComp_Decl) = z_true)
│ ∧	(constraint = comp_index_con ssi ⇒
│		(∃Z_Decl; zp : Z_PRED⦁
│		zexp = zid(trans_id tmark) ∧
│		 zp = z_eq(z_dom(zid ((Value↗~↕) zvar)), z_many_cross(trans_comp_sub_ind o ssi)) ∧
│		trans_comp_decl (θComp_Decl) =
│		z_mem(zv, z_set_comp(θZ_Decl, zp))))
│ ∧	(constraint = comp_disc_con dc ⇒
│		trans_comp_decl (θComp_Decl) =
│		z_many_and
│		{	s : dom dc; Z_Selection
│		|	zbinding = zv ∧ zselector = trans_id s
│		⦁	z_eq(z_selection(θZ_Selection), trans_exp (dc s)) })
■

=DOC
val ⦏basic_decl_record⦎ : CN_ENV * Z_ID list ->
		ID -> EXP RECORD_TYPE_DEF -> ZParagraphs.PARAINFO list
=DESCRIBE
┌⦏Basic_Decl_Record⦎─────────────────
│	Basic_Decl_Pars
├─────────────
│	∃ Type_Decl; rec : Record_Type_Def; Z_Schema ⦁
│	basic_decl = type_decl (θ Type_Decl) ∧
│	type_def = record_type_def rec ∧ z_sname = trans_id name ∧
│	z_decls = trans_decl ⦇ ran (rec.decl ⨾ (λComp_Decl⦁θVar_Decl)) ∪ ran rec.disc ⦈ ∧
│	z_pred = z_many_and(trans_comp_decl⦇ran rec.decl⦈) ∧
│	z = ⟨z_schema (θ Z_Schema)⟩ ⁀ record_update_defs (name, rec)
└────────────────────
=FAILURE
508103	A discriminant constraint can only be applied to a record type
	In the declaration for record component ?0, ?1 is not a record type.
508104	In the declaration for record component ?0, the discriminant constraint
	has the wrong number of discriminants (?1 rather than the expected ?2)
=ENDDOC

\subsection{Translating Integer Types}

=DOC
val ⦏int_type_attrib⦎ : CN_ENV -> (Z_ID * EXP RANGE) -> ZParagraphs.PARAINFO list
=DESCRIBE
ⓈZAX
│	⦏z_ints⦎ : Z_ID
■
ⓈZAX
│	⦏int_type_attrib⦎ : (Z_ID × Range) → seq Z_PARA
├─────────────
│	∀ zid⋎1 : Z_ID; Range ⦁
│	∃ Z_Ax'; Z_Ax''; Z_Ax'''; Z_Ax'''' ⦁
│		decls' = {Z_Decl | zvar = Value(zid⋎1 ^ zsuc) ∧
│					zexp = z_pfun(zid z_ints, zid z_ints) }
│	∧	decls'' = {Z_Decl | zvar = Value(zid⋎1 ^ zpred) ∧
│					zexp = z_pfun(zid z_ints, zid z_ints) }
│	∧	decls''' = {Z_Decl | zvar = Value(zid⋎1 ^ zpos) ∧
│					zexp = z_pfun(zid z_ints, zid z_ints) }
│	∧	decls'''' = {Z_Decl | zvar = Value(zid⋎1 ^ zval) ∧
│					zexp = z_pfun(zid z_ints, zid z_ints) }
│	∧	(preds' = preds'' = preds''' = preds'''')
│	∧	int_type_attrib (zid⋎1, θ Range) =
│			⟨z_eq_eq(zid⋎1 ^ zfst, trans_exp lo),
│			z_eq_eq(zid⋎1 ^ zlst, trans_exp hi),
│			z_ax(θZ_Ax'), z_ax(θZ_Ax''),
│			z_ax(θZ_Ax'''), z_ax(θZ_Ax'''') ⟩
■
=ENDDOC

=DOC
val ⦏basic_decl_int_type⦎ : CN_ENV * Z_ID list ->
		ID -> EXP RANGE -> ZParagraphs.PARAINFO list;
val ⦏is_modular_type⦎ : TMARK -> bool;
=DESCRIBE
┌⦏Basic_Decl_Int_Type⦎─────────────────
│	Basic_Decl_Pars
├─────────────
│ ∃ Type_Decl; Range; zname : Z_ID ⦁
│	basic_decl = type_decl (θ Type_Decl) ∧
│	type_def = int_type_def (θ Range) ∧
│	zname = trans_id name ∧
│	z =
│	⟨z_eq_eq(zname, z_rng(trans_exp lo, trans_exp hi))⟩ ⁀
│		int_type_attrib(zname, θ Range)
└────────────────────
=FAILURE
508066	The bounds of an integer type must be integers:
	?0 is not an integer
508074	The modulus of a modular type must be an integer
	?0 is not an integer
=ENDDOC

\subsection{Translating Real Types}
=DOC
val ⦏basic_decl_fixed_type⦎ : CN_ENV * Z_ID list ->
		ID -> EXP FIXED_TYPE_DEF -> ZParagraphs.PARAINFO list
=DESCRIBE
┌⦏Basic_Decl_Fixed_Type⦎─────────────────
│	Basic_Decl_Pars
├─────────────
│ ∃ Type_Decl; Fixed_Type_Def; zname : Z_ID ⦁
│	basic_decl = type_decl (θ Type_Decl) ∧
│	type_def = fixed_type_def (θ Fixed_Type_Def) ∧
│	zname = trans_id name ∧
│	z =
│	⟨z_eq_eq(zname, z_rng(trans_exp lo, trans_exp hi)),
│		z_eq_eq(zname ^ zdelta, trans_exp delta),
│		z_eq_eq(zname ^ zfst, trans_exp lo),
│		z_eq_eq(zname ^ zlst, trans_exp hi) ⟩
└────────────────────
=FAILURE
508065	A fixed point constraint without a range constraint is not allowed here
=ENDDOC
=DOC
val ⦏basic_decl_floating_type⦎ : CN_ENV * Z_ID list ->
		ID -> EXP FLOATING_TYPE_DEF -> ZParagraphs.PARAINFO list
=DESCRIBE
┌⦏Basic_Decl_Floating_Type_Range⦎─────────────────
│	Basic_Decl_Pars
├─────────────
│ ∃ Type_Decl; Floating_Type_Def_Range; zname : Z_ID ⦁
│	basic_decl = type_decl (θ Type_Decl) ∧
│	type_def = floating_type_def_range (θ Floating_Type_Def_Range) ∧
│	zname = trans_id name ∧
│	z =
│	⟨z_eq_eq(zname, z_rng(trans_exp lo, trans_exp hi)),
│		z_eq_eq(zname ^ zdigits, trans_exp digits),
│		z_eq_eq(zname ^ zfst, trans_exp lo),
│		z_eq_eq(zname ^ zlst, trans_exp hi) ⟩
└────────────────────
ⓈZAX
│	⦏z_reals⦎ : Z_ID
■
┌⦏Basic_Decl_Floating_Type_No_Range⦎─────────────────
│	Basic_Decl_Pars
├─────────────
│ ∃ Type_Decl; Floating_Type_Def_No_Range; zname : Z_ID; Z_Ax'; Z_Ax'' ⦁
│	basic_decl = type_decl (θ Type_Decl) ∧
│	type_def = floating_type_def_no_range (θ Floating_Type_Def_No_Range) ∧
│	zname = trans_id name ∧
│	decls' =
│	{ Z_Decl |
│	  zvar = Value (zname ^ zfst) ∧ zexp = zid z_reals } ∧
│	decls'' =
│	{ Z_Decl |
│	  zvar = Value (zname ^ zlst) ∧ zexp = zid z_reals } ∧
│	z =
│	⟨ z_ax(θZ_Ax'),
│	  z_ax(θZ_Ax''),
│	  z_eq_eq(zname, z_rng(zid(zname ^ zfst), zid(zname ^ zlst))),
│		z_eq_eq(zname ^ zdigits, trans_exp digits) ⟩
└────────────────────

=ENDDOC

\subsection{Translating Subtypes}

=DOC
val ⦏range_con_attrib⦎ : CN_ENV ->
	(Z_ID * Z_ID * {lo : Z_EXP, hi : Z_EXP})
				-> ZParagraphs.PARAINFO list
=DESCRIBE
ⓈZAX
│	⦏range_con_attrib⦎ : (Z_ID × Z_ID × Range) → seq Z_PARA
├─────────────
│ ∀ zid⋎1, zid⋎2 : Z_ID; Range ⦁
│	range_con_attrib (zid⋎1, zid⋎2, θ Range) =
│		⟨z_eq_eq(zid⋎1 ^ zfst, trans_exp lo),
│		z_eq_eq(zid⋎1 ^ zlst, trans_exp hi),
│		z_eq_eq(zid⋎1 ^ zsuc, zid(zid⋎2 ^ zsuc)),
│		z_eq_eq(zid⋎1 ^ zpred, zid(zid⋎2 ^ zpred)),
│		z_eq_eq(zid⋎1 ^ zpos, zid (zid⋎2 ^ zpos)),
│		z_eq_eq(zid⋎1 ^ zval, zid(zid⋎2 ^ zval))⟩
■
Caller has already had to translate the bounds of the range into Z,
so the ML function has the translated expressions as its arguments.
=ENDDOC
ⓈZAX
│ ⦏type_attrs⦎ : ID → seq ID
■


=DOC
val ⦏basic_decl_subtype_range_con⦎ : CN_ENV * Z_ID list ->
		ID -> TMARK -> EXP RANGE -> ZParagraphs.PARAINFO list
=DESCRIBE
┌⦏Basic_Decl_Subtype_Range_Con_1⦎─────────────────
│	Basic_Decl_Pars
├─────────────
│ ∃ Subtype_Decl; Range; zname, ztmark : Z_ID ⦁
│	basic_decl = subtype_decl (θ Subtype_Decl) ∧
│	con = range_con (θ Range) ∧
│	z_type_of(zid ztmark) = z_power_type z_int_type ∧
│	lo ∈ dom trans_exp ∧ hi ∈ dom trans_exp ∧
│	zname = trans_id name ∧
│	ztmark = trans_id tmark ∧
│	z =
│	⟨z_eq_eq (zname, z_rng (trans_exp lo, trans_exp hi)) ⟩ ⁀
│		range_con_attrib(zname, ztmark, θ Range)
└────────────────────
┌⦏Basic_Decl_Subtype_Range_Con_2⦎─────────────────
│	Basic_Decl_Pars
├─────────────
│ ∃ Subtype_Decl; Range; zname, ztmark : Z_ID; Z_Ax; Z_Decl ⦁
│	basic_decl = subtype_decl (θ Subtype_Decl) ∧
│	con = range_con (θ Range) ∧
│	(z_type_of(zid ztmark) ≠ z_power_type z_int_type ∨
│	lo ∉ dom trans_exp ∨ hi ∉ dom trans_exp) ∧
│	zname = trans_id name ∧ ztmark = trans_id tmark ∧ zvar = Value zname ∧
│	zexp = z_powerset(zid ztmark) ∧ decls = {θZ_Decl} ∧
│	preds = {} ∧ z = ⟨z_ax(θZ_Ax)⟩
└────────────────────
┌⦏Basic_Decl_Subtype_Range_Con_3⦎─────────────────
│	Basic_Decl_Pars
├─────────────
│ ∃ Subtype_Decl; Range; zname, ztmark : Z_ID ⦁
│	basic_decl = subtype_decl (θ Subtype_Decl) ∧
│	con = range_con (θ Range) ∧
│	z_type_of(zid ztmark) = z_power_type z_real_type ∧
│	lo ∈ dom trans_exp ∧ hi ∈ dom trans_exp ∧
│	zname = trans_id name ∧
│	ztmark = trans_id tmark ∧
│	z =
│	⟨z_eq_eq (zname, z_rng (trans_exp lo, trans_exp hi)) ⟩ ⁀
│        ((type_attrs tmark ↾ (ID \ {fst, lst})) ⨾ trans_id ⨾
│	 (λa: Z_ID⦁(z_eq_eq(zname ^ a, zid(ztmark ^ a))))) ⁀
│	⟨z_eq_eq(zname ^ zfst, trans_exp lo),
│	 z_eq_eq(zname ^ zlst, trans_exp hi) ⟩
└────────────────────
Note: the implementation of these is via a single function which takes
the appropriate action according to the number of indices.
I.e. $basic\_decl\_subtype\_range_con$ implements the schema disjunction of the above two schemas (which is what is required where they are used in $trans\_basic\_decl$).
=FAILURE
508051	?0 is not a valid type mark
508060	The range constraint would give an empty type:
	the lower bound ?0 is greater than the upper bound ?1
508061	The range constraint for the type ?0 could not be evaluated;
	a VC has been generated for this type
508072	The modulus of a modular type must be positive:
	?0 is not positive
508073	The modulus for the type ?0 could not be evaluated;
	a VC has been generated for this type
=ENDDOC
=DOC
val ⦏basic_decl_subtype_fixed_con⦎ : CN_ENV * Z_ID list ->
		ID -> EXP FIXED_POINT_CONSTRAINT -> ZParagraphs.PARAINFO list
=DESCRIBE
┌⦏Basic_Decl_Subtype_Fixed_Con⦎─────────────────
│	Basic_Decl_Pars
├─────────────
│ ∃ Subtype_Decl; Type_Decl; Fixed_Type_Def ⦁
│	basic_decl = subtype_decl (θ Subtype_Decl) ∧
│	con = fixed_con (θ Fixed_Type_Def) ∧
│	type_def = fixed_type_def(θ Fixed_Type_Def) ∧
│	Basic_Decl_Fixed_Type
└────────────────────
=ENDDOC
=DOC
val ⦏basic_decl_subtype_floating_con⦎ : CN_ENV * Z_ID list ->
		ID -> EXP FLOATING_POINT_CONSTRAINT -> ZParagraphs.PARAINFO list
=DESCRIBE
┌⦏Basic_Decl_Subtype_Floating_Con⦎─────────────────
│	Basic_Decl_Pars
├─────────────
│ ∃ Subtype_Decl; Type_Decl; Floating_Type_Def_Range⦁
│	basic_decl = subtype_decl (θ Subtype_Decl) ∧
│	con = floating_con (θ Floating_Type_Def_Range) ∧
│	type_def = floating_type_def_range(θ Floating_Type_Def_Range) ∧
│	Basic_Decl_Floating_Type_Range
└────────────────────
=ENDDOC

=DOC
val ⦏basic_decl_subtype_index_con⦎ : CN_ENV * Z_ID list ->
		ID -> TMARK -> EXP list -> ZParagraphs.PARAINFO list
=DESCRIBE
┌⦏Basic_Decl_Subtype_Index_Con⦎─────────────────
│	Basic_Decl_Pars
├─────────────
│	∃ Subtype_Decl; index : seq TMARK; Z_Decl;
│	zname : Z_ID; zindex : seq⋎1 Z_ID; zp : Z_PRED ⦁
│	basic_decl = subtype_decl (θ Subtype_Decl) ∧
│	con = index_con index ∧ zname = trans_id name ∧
│	zindex = map trans_id index ∧
│	zexp = zid (trans_id tmark) ∧
│	zp = z_eq (z_dom (zid ((Value↗~↕) zvar)), z_many_cross(map zid zindex)) ∧
│	z =
│	⟨z_eq_eq (zname, z_set_comp (θ Z_Decl, zp)) ⟩ ⁀
│		array_attrib(zname, zindex)
└────────────────────
=FAILURE
508075	A subtype of STRING must have a lower index bound of 1; the lower bound
	for the subtype ?0 is not equal to 1
508076	The lower index bound for the type ?0 could not be evaluated;
	a VC has been generated for this type
=ENDDOC
=DOC
val ⦏base_type⦎ : Z_EXP -> TMARK OPT
=DESCRIBE
Given an Ada type mark, {\it tm}, translated into a Z expression,
{\it base\_type tm} is the Z type for the base type of {\it tm}, if any.
The returned value is {\it Nil} for Ada integer and real types (since
these are subtyped from compiler-dependent pre-defined types) or if
for some reason the base type cannot be determined.
Ada enumeration types and their subtypes are represented in Z as integer types, but
{\it base\_type} can distinguish them from Ada integer types by checking on
the form of the definition of the successor attribute (which will not have
a defining equation for an Ada integer type).

It is also used in the implementation of attributes containing {\it 'BASE}.

=ENDDOC
=DOC
val ⦏basic_decl_subtype_disc_con⦎ : CN_ENV * Z_ID list ->
		ID -> TMARK -> EXP list -> ZParagraphs.PARAINFO list;
=DESCRIBE

┌ ⦏Basic_Decl_Subtype_Disc_Con⦎ ───────────
│ Basic_Decl_Pars
├──────
│ ∃Subtype_Decl; Z_Constrained_Schema; dc : ID ⇸ EXP ⦁
│ 	con = discriminant_con dc ∧ z_sname = trans_id name ∧ z_decl = trans_id tmark ∧
│	z_pred = z_many_and { s : dom dc ⦁ z_eq(zid(trans_id s), trans_exp(dc s)) } ∧
│ 	z = ⟨z_constrained_schema(θZ_Constrained_Schema)⟩
└──────────────
=FAILURE
508100	A discriminant constraint can only be applied to a record type
	In the subtype declaration for ?0, ?1 is not a record type.
508101	In the subtype declaration for ?0, the discriminant constraint
	has the wrong number of discriminants (?1 rather than the expected ?2)
508102	Internal error: corrupt environment entry for type ?0
=ENDDOC
=DOC
val ⦏basic_decl_subtype_no_con⦎ : CN_ENV * Z_ID list ->
		ID -> TMARK -> ZParagraphs.PARAINFO list;
val ⦏ada_attributes_list⦎ : ID list;
val ⦏type_attrs⦎ : ID list -> ID -> ID list;
=DESCRIBE
$ada\_attributes\_list$ is based on material taken from the Ada Reference Manual.
It is based on all Ada attributes, not just those mentioned in the list in
Volume 3, section 3.13 of the specification of the Compliance Notation.
However, it does not list attributes of attributes, such as attributes of the $BASE$ attribute.

$type\_attrs$ $l$ $t$ then returns all the members of this list that are used to form
constants that are attributes of type $t$ in the theory in which $t$ is declared and
whose attribute identifiers are not in the list $l$.

┌ ⦏Basic_Decl_Subtype_No_Con⦎ ───────────
│ Basic_Decl_Pars
├──────
│ ∃Subtype_Decl; zname, ztmark : Z_ID ⦁
│   con = no_con ∧ zname = trans_id name ∧ ztmark = trans_id tmark ∧
│   z = ⟨z_eq_eq(zname, zid ztmark)⟩ ⁀
│   (type_attrs tmark ⨾ trans_id ⨾ (λa: Z_ID⦁(z_eq_eq(zname ^ a, zid(ztmark ^ a)))))
└──────────────
=ENDDOC

\subsection{The Function $trans\_basic\_decl$}
=DOC
val ⦏trans_basic_decl⦎ : CN_ENV * Z_ID list -> BASIC_DECL -> ZParagraphs.PARAINFO list
val ⦏trans_basic_decl1⦎ : CN_ENV * Z_ID list -> BASIC_DECL -> ZParagraphs.PARAINFO list OPT
=DESCRIBE

$trans\_basic\_decl$ takes a basic declaration in Compliance Notation (SPARK) and translates it into Z according to the algorithm specified in Volume 3 of DRA/CIS/CSE3/TR/94/27/3.0, and follows the Z specification below.

$trans\_basic\_decl1$ is similar to $trans\_basic\_decl$ except that it returns an optional Z list of Z paragraphs. If the SPARK basic declaration can only be handled informally then a warning message is printed out and $Nil$ is returned.

The first parameter is the CN environment for use in translating Ada expressions into Z.
The second parameter is a list of identifiers to be used as a prefix to form an expanded
name when translating the Ada identifiers introduced by the basic declaration into Z.

{\def\PrNL#1\PrNN{\relax}
ⓈZ
│ ∀ Basic_Decl_Pars ⦁
│	trans_basic_decl basic_decl = z ⇔
│	Basic_Decl_Const_1 ∨ Basic_Decl_Const_2 ∨ Basic_Decl_Enum ∨
│	Basic_Decl_Int_Type ∨ Basic_Decl_Con_Array ∨
│	Basic_Decl_Uncon_Array ∨ Basic_Decl_Record ∨
│	Basic_Decl_Fixed_Type ∨ Basic_Decl_Floating_Type_Range ∨
│	Basic_Decl_Floating_Type_No_Range ∨
│	Basic_Decl_Subtype_Range_Con_1 ∨
│	Basic_Decl_Subtype_Range_Con_2 ∨
│	Basic_Decl_Subtype_Range_Con_3 ∨
│	Basic_Decl_Subtype_Fixed_Con ∨ Basic_Decl_Subtype_Floating_Con ∨
│	Basic_Decl_Subtype_Index_Con ∨
│	Basic_Decl_Subtype_Disc_Con ∨
│	Basic_Decl_Subtype_No_Con ⦏(*⦎⦏tbdconstraint⦎⦏*)⦎
■
}
=FAILURE
508039	Deferred constants are not handled formally
508040	Internal error: unexpected variable declaration
508041	Private types are not handled formally
=ENDDOC
\section{ADJUSTMENT OF ABSTRACT SYNTAX FOR EXPRESSIONS}

During parsing, there were several cases where it was not possible to determine the actual abstract syntax which should be generated because of the lack of contextual information at the time of parsing. The design of this module is such that all the information needed to adjust the abstract syntax for expressions can be derived from the environment information in $CN\_ENV$. The function $adjust\_exp$ is provided to carry out those adjustments to expressions which the parser produced so that the abstract syntax is correct by the time the algorithms for generating Z from expressions, (and ultimately VCs) are invoked.


The function carries out the following adjustments to expressions:

\begin{description}

\item[Identifiers]
An identifier of the form $x.y$ can either be a package selection or a record selection. Which kind of selection is determined by the kind of object $x$ is. It is necessary to distinguish between the two because the names of the identifiers translated into Z by the expression generator would be different. In the example, where $x$ is in scope as a record, then $x.y$ is treated as a record selection; otherwise is assumed to be a package selection.

\item[Aggregates]
The parser represents record aggregates as array aggregates (this is the case both for positional and named aggregates). $adjust\_exp$ determines whether to convert an array aggregate into a record aggregate by checking whether a record aggregate with the corresponding name to the array aggregate has been declared and is in scope. If so, the adjustment is made.

\item[Indexed Components]
Function calls and type constraints are represented as indexed components by the parser. An indexed component is converted to a type constraint or a function by $adjust\_exp$ depending the functions and types which are in scope at the time.

\item[Qualified Expressions]
In SPARK record aggregates have to appear within qualified expressions.
Thus, the representation of aggregates contains a component which is the type mark of the aggregate. A qualified expression representation contains an aggregate part and a type mark part. Since the algorithms for generating Z assume that aggregates have associated with them the correct type mark, it is necessary in the case of a qualified expression to push its type mark into the appropriate type mark component of the aggregate and throw away the qualified expression data constructor. Since the aggregate part of a qualified expression may be either a record or an array, it is itself subject to possible adjustment for aggregates (see above). Thus, a qualified expression can be changed by $adjust\_exp$ into any one of the types of array aggregate or record aggregate.

During the analysis of the various forms of operand of the qualified expression to handle record aggregates, the form where the operand is not an aggregate is handled simply by replacing the qualified expression by the operand.
This implements the formal treatment of qualified expressions as defined by the Z schema $Exp\_Qualified$.
\end{description}


=DOC
val ⦏named_assocs_to_exps⦎ : (ID * Z_EXP OPT) list ->
	(AGG_CHOICE,EXP) NAMED_ASSOC list -> EXP list
val ⦏positional_assocs_to_exps⦎ : (ID * Z_EXP OPT) list ->
	EXP list -> EXP list
=DESCRIBE
These function convert a named association parameter list or a positional association parameter list
into an expression list based upon knowledge of names
and default expressions, if any, of the parameters/components of a function/record for
which the named association list is the parameter.
=USES
It is required by $adjust\_exp$ (see below) and also used in the VC generator.
=FAILURE
508043	More than one actual parameter associations have been given for formal parameter ?0
508044	No actual parameter has been supplied for formal parameter ?0 and there is no default expression for it
508045	Syntax error: a parameter name in a subprogram call must be a simple name
508063	The subprogram has no formal parameter named ?0
508064	The subprogram call has too many actual parameters
508069	The subprogram call has too few positional parameters and a default expression is not available for
	one of the missing parameters
=ENDDOC

=DOC
val ⦏adjust_exp⦎ : CN_ENV -> EXP -> EXP
val ⦏adjust_exp1⦎ : CN_ENV -> EXP -> EXP OPT
=DESCRIBE
$adjust\_exp$ transforms an expression into its correct representation, determined by information in the environment. For example, array aggregates are used by the parser to carry both function applications and arrays indexed by positional aggregates. This function determines from the environment whether the object is a function application or an indexed component and applies the appropriate transformation to the abstract expression.

$adjust\_exp1$ is similar to $adjust\_exp$ but it returns $Nil$ if the expression cannot be handled formally; otherwise it returns a value which is the same as that had $adjust\_exp$ been called.
=FAILURE
508048	Internal error: badly formed indexed component found near ?0
508035	Internal error: parser has generated a 0-dimensional array ?0
508055	Internal error: parser has generated a qualified expression as an index for ?0
508056	Internal error: the expression adjuster has generated an ill-formed indexed selection
508046	Syntax error: OTHERS part is not allowed in a record aggregate
508047	Syntax error: cannot index ?0 using a named association
508049	Informal functions cannot be handled formally; ?0 cannot be used here
508057	Syntax error: a discrete range is not a valid expression
=ENDDOC
=TEX
\section{SUPPORT FOR MULTIDIMENSIONAL ARRAYS}
=DOC
val ⦏array_agg_def⦎ : int -> unit
=DESCRIBE
=FAILURE
508059	the argument to array_agg_def must be at least 2
=ENDDOC
\section{GENERATING DOMAIN CONDITIONS}
=DOC
val ⦏domain_conds⦎ : CN_ENV -> Z_EXP -> Z_PRED list;
(* cn_domain_conds: integer control; 3 values allowed as follows *)
val ⦏cn_no_domain_conds⦎ : int;
val ⦏cn_standard_domain_conds⦎ : int;
val ⦏cn_all_domain_conds⦎ : int;
val ⦏get_domain_conds_control⦎ : unit -> int;
=DESCRIBE
ⓈZAX
│	⦏domain_conds⦎ : Z_EXP → ℙZ_PRED
■
This function generates the domain conditions for a Z expression
obtained by translating a SPARK expression.
The function is controlled by the integer control variable called
{\it cn\_domain\_conds}. This should be given one of the three
integer values given by the three ML bindings above. The effect
of the control is shown in the following table:
The current value of the control can be accessed using {\it get\_domain\_conds\_control}.
\begin{center}
\begin{tabular}{|l|p{3in}|}\hline
=INLINEFT
cn_no_domain_conds
=TEX
& No domain conditions are generated.\\\hline
=INLINEFT
cn_standard_domain_conds
=TEX
& Only domain conditions corresponding to exceptions that are guaranteed by ALRM are generated \\\hline
=INLINEFT
cn_all_domain_conds
=TEX
& Domain conditions are generated as for
=INLINEFT
cn_standard_domain_conds
=TEX
\ together with domain conditions corresponding to real arithmetic exceptions.\\\hline
\end{tabular}
\end{center}


The error message below is one which should never be seen unless the
input includes auxiliary expressions that have been maliciously constructed
using ML to fool the algorithm.
=FAILURE
508070	Invalid Z expression (?0) encountered while calculating domain conditions
=ENDDOC
\section{ADJUSTING DECLARATIONS}
\subsection{Basic Declarations}
=DOC
val ⦏universal_discrete_type⦎ : TMARK (* = "universal_discrete" *);
=DESCRIBE
ⓈZAX
│  ⦏universal_discrete_type⦎ : TMARK
■
=ENDDOC
ⓈZAX
│ ⦏generate_id⦎ :  Sub_Ind ↣ TMARK
■
ⓈZAX
│ ⦏si_generate_id⦎ :  SI_Sub_Ind ↣ TMARK
■
┌⦏adjust_subtype⦎──
│ Sub_Ind; name : ID; newdecl : seq BASIC_DECL
├──
│ (con = no_con ∧ name = tmark ∧ newdecl = ⟨⟩)
│∨
│ (con ≠ no_con ∧
│  (∃ Subtype_Decl' ⦁
│    name = name' = generate_id (θSub_Ind) ∧
│    θSub_Ind = θSub_Ind' ∧
│    newdecl = ⟨subtype_decl(θ Subtype_Decl')⟩))
└─
┌⦏adjust_discrete_range_subind⦎──
│ s : SI_Discrete_Range; adjust_subtype
├
│ s = si_discrete_range_subind (θ Sub_Ind)
└──
┌⦏adjust_discrete_range_range⦎──
│  s : SI_Discrete_Range; adjust_subtype
├
│ ∃ r : Range[EXP]; d : BASIC_DECL ⦁
│    s = si_discrete_range_range(r) ∧
│    tmark = universal_discrete_type ∧ con = range_con(r)
└
ⓈZ
│  ⦏adjust_discrete_range⦎  ≜
│      adjust_discrete_range_subind ∨ adjust_discrete_range_range
■
┌⦏adjust_constraint⦎──
│  si_con : SI_CONSTRAINT;
│  con : CONSTRAINT;
│  newdecl : seq BASIC_DECL
├
│  (si_con = si_no_con ∧ con = no_con ∧ newdecl = ⟨⟩)   ∨
│  ({con} = range_con⦇si_range_con↗~↕ ⦇{si_con}⦈ ⦈  ∧ newdecl = ⟨⟩)  ∨
│  ({con} = fixed_con⦇si_fixed_con↗~↕ ⦇{si_con}⦈ ⦈ ∧ newdecl = ⟨⟩)  ∨
│  ({con} = floating_con⦇si_floating_con↗~↕ ⦇{si_con}⦈ ⦈ ∧ newdecl = ⟨⟩)  ∨
│  ({con} = discriminant_con⦇si_discriminant_con↗~↕ ⦇{si_con}⦈ ⦈ ∧ newdecl = ⟨⟩)  ∨
│  (∃ sdr : seq SI_Discrete_Range; si:seq ID ⦁ si_con = si_index_con(sdr) ∧
│     con = index_con(si) ∧
│     {adjust_discrete_range ⦁ s ↦ name} o sdr = si ∧
│     ({adjust_discrete_range ⦁ s ↦ newdecl} o sdr) = newdecl
│  )
└──
┌⦏adjust_general_subtype⦎──
│ SI_Sub_Ind;
│ name : ID;
│ newdecl : seq BASIC_DECL
├──
│ ∃ adjust_constraint' ⦁ si_con' = con ∧
│ (  ( con = si_no_con ∧ name = tmark ∧ newdecl = ⟨⟩) ∨
│    ( con ≠ si_no_con ∧ name = generate_id(tmark≜tmark, con≜con') ) ∧
│    newdecl = newdecl'⁀⟨subtype_decl(name≜name, tmark≜tmark, con≜con')⟩
│ )
└
ⓈZAX
│ ⦏add_tmark⦎ : EXP × TMARK → EXP
■
┌⦏adjust_const_decl⦎──
│ basic_decl : SI_BASIC_DECL;
│ adjusted_decls: seq BASIC_DECL
├──
│ ∃ adjust_general_subtype'; SI_Const_Decl; Const_Decl'' ⦁
│   basic_decl = si_const_decl(θ SI_Const_Decl) ∧ const=const'' ∧
│   ( ( t = Value(θ SI_Sub_Ind') ∧ Value(name') = tm'' ∧
│       expr'' = add_tmark(expr, name') ∧
│       adjusted_decls = newdecl' ⁀⟨const_decl(θ Const_Decl'')⟩
│     ) ∨
│     ( t = Nil  ∧ tm'' = Nil ∧ expr'' = expr ∧
│       adjusted_decls = ⟨const_decl(θ Const_Decl'')⟩
│     )
│   )
└
ⓈZAX
│ ⦏adjust_elementary_types⦎ : SI_TYPE_DEF ⇸ TYPE_DEF
├──
│ adjust_elementary_types =
│    enum_type_def o si_enum_type_def↗~↕  ∪
│    int_type_def o si_int_type_def↗~↕ ∪
│    fixed_type_def o si_fixed_type_def↗~↕ ∪
│    floating_type_def_range o si_floating_type_def_range↗~↕ ∪
│    floating_type_def_no_range o si_floating_type_def_no_range↗~↕
■
┌⦏adjust_elementary_type_decl⦎──
│ basic_decl : SI_BASIC_DECL;
│ adjusted_decls : seq BASIC_DECL
├──
│ ∃ SI_Type_Decl'; t : TYPE_DEF ⦁
│ basic_decl = si_type_decl(θ SI_Type_Decl') ∧
│ type_def'↦ t ∈ adjust_elementary_types ∧
│ adjusted_decls = ⟨type_decl(name ≜ name', type_def ≜ t)⟩
└
┌⦏adjust_uncon_array_type_decl⦎──
│ basic_decl : SI_BASIC_DECL;
│ adjusted_decls : seq BASIC_DECL
├──
│ ∃ a : SI_Array_Def; Array_Def; adjust_general_subtype'; SI_Type_Decl ⦁
│     basic_decl = si_type_decl(θ SI_Type_Decl) ∧
│     type_def = si_uncon_array_def (a)∧
│     θ SI_Sub_Ind' = a.comp ∧ name' = comp ∧
│     ({i:ID ⦁ i ↦ si_discrete_range_subind(tmark≜i,con≜no_con)} o index) =
│	a.index ∧
│       adjusted_decls =
│       newdecl' ⁀⟨type_decl(name≜name, type_def≜uncon_array_def(θ Array_Def))⟩
└
┌⦏adjust_con_array_type_decl⦎──
│ basic_decl : SI_BASIC_DECL;
│ adjusted_decls : seq BASIC_DECL
├──
│ ∃ a : SI_Array_Def; Array_Def; adjust_general_subtype'; SI_Type_Decl ⦁
│	basic_decl = si_type_decl(θSI_Type_Decl) ∧
│	type_def =  si_con_array_def (a) ∧
│	θSI_Sub_Ind' = a.comp ∧ name' = comp  ∧
│	index = { adjust_discrete_range ⦁ s ↦ name} o (a.index) ∧
│	adjusted_decls =
│	({adjust_discrete_range ⦁ s ↦ newdecl} o (a.index)) ⁀
│		⟨type_decl(name≜name, type_def≜con_array_def(θArray_Def))⟩
└
┌ ⦏dependent_range⦎ ───────────
│ ⦏disc⦎ : seq Var_Decl;
│ ⦏r⦎ : SI_Discrete_Range
├──────
│ (∃Range[EXP]; Sub_Ind; vd : ran disc⦁
│	con = range_con(θRange) ∧
│	r = si_discrete_range_subind(θSub_Ind) ∧
│	(lo = Id(vd.var) ∨ hi = Id(vd.var))) ∨
│ (∃Range[EXP]; vd : ran disc⦁
│	r = si_discrete_range_range(θRange) ∧
│	(lo = Id(vd.var) ∨ hi = Id(vd.var)))
└──────────────

┌ ⦏dependent_constraint⦎ ───────────
│ ⦏disc⦎ : seq Var_Decl;
│ ⦏con⦎ : SI_CONSTRAINT
├──────
│ (∃sr : seq SI_Discrete_Range; r : SI_Discrete_Range⦁
│	con = si_index_con sr ∧ r ∈ ran sr ∧ dependent_range) ∨
│ (∃dc : ID → EXP; vd : ran disc⦁
│	con = si_discriminant_con dc ∧ Id(vd.var) ∈ ran dc)
└──────────────

┌ ⦏dependent_var_decl⦎ ───────────
│ ⦏disc⦎ : seq Var_Decl;
│  SI_Var_Decl
├──────
│  ∃SI_Sub_Ind⦁
│	t = θSI_Sub_Ind ∧  dependent_constraint
└──────────────

ⓈZAX
│ ⦏adjust_comp_sub_ind⦎ : SI_Discrete_Range → COMP_SUB_IND
├──────
│ ∀ Sub_Ind; Range[EXP]
│ |	con = range_con(θRange)
│ ⦁	 adjust_comp_sub_ind(si_discrete_range_subind(θSub_Ind)) = comp_sub_ind_range(lo, hi);
│ ∀ Sub_Ind
│ |	con = no_con
│ ⦁	adjust_comp_sub_ind(si_discrete_range_subind(θSub_Ind)) = comp_sub_ind_tmark tmark;
│ ∀ Range[EXP]
│ ⦁	adjust_comp_sub_ind(si_discrete_range_range(θRange)) = comp_sub_ind_range(lo, hi)
■
ⓈZAX
│ ⦏adjust_comp_constraint⦎ : SI_CONSTRAINT → COMP_CONSTRAINT
├──────
│ 	adjust_comp_constraint si_no_con = comp_no_con;
│ ∀sdr : seq SI_Discrete_Range⦁
│	adjust_comp_constraint (si_index_con sdr) = comp_index_con (adjust_comp_sub_ind o sdr);
│ ∀ dc : ID ⇸ EXP⦁
│	adjust_comp_constraint(si_discriminant_con dc) = comp_disc_con dc
■

┌ ⦏adjust_comp_decl⦎ ───────────
│  disc : seq Var_Decl;
│ SI_Var_Decl;
│ Comp_Decl;
│ newdecl : seq BASIC_DECL
├──────
│  (dependent_var_decl ∧  tmark = t.tmark ∧ constraint = adjust_comp_constraint t.con ∧ newdecl = ⟨⟩)
│ ∨
│ (¬dependent_var_decl ∧ (∃SI_Sub_Ind; name : ID⦁
│	t = θSI_Sub_Ind ∧ constraint = comp_no_con ∧ tmark = name ∧ adjust_general_subtype))
│
└──────────────


┌⦏adjust_record_type_decl⦎──
│ basic_decl : SI_BASIC_DECL;
│ adjusted_decls : seq BASIC_DECL
├──
│ ∃ r : SI_Record_Type_Def; Record_Type_Def;  d : BASIC_DECL; SI_Type_Decl ⦁
│     basic_decl = si_type_decl(θ SI_Type_Decl) ∧
│     type_def = si_record_type_def (r) ∧
│     decl = {adjust_comp_decl ⦁
│              θSI_Var_Decl ↦θComp_Decl} o r.decl ∧
│     adjusted_decls =
│      ({adjust_comp_decl ⦁
│	  θSI_Var_Decl ↦ newdecl} o r.decl) ⁀
│           ⟨type_decl(name≜name, type_def≜record_type_def(θRecord_Type_Def))⟩
└


┌⦏adjust_subtype_decl⦎──
│ basic_decl : SI_BASIC_DECL;
│ adjusted_decls : seq BASIC_DECL
├──
│ ∃ adjust_constraint'; i:ID; tmark:TMARK ⦁
│     basic_decl = si_subtype_decl(name≜i, tmark≜tmark, con≜si_con'  ) ∧
│     adjusted_decls = newdecl'⁀⟨subtype_decl(name≜i, tmark≜tmark, con≜con')⟩
└
=DOC
val ⦏adjust_basic_decls⦎ : CN_ENV * Z_ID list -> SI_BASIC_DECL list -> BASIC_DECL list;
=DESCRIBE
ⓈZ
│  ⦏adjust_basic_decl⦎ ≜
│  { ( adjust_const_decl ∨ adjust_elementary_type_decl ∨
│      adjust_uncon_array_type_decl ∨ adjust_con_array_type_decl ∨
│      adjust_subtype_decl
│    )  ⦁   basic_decl ↦ adjusted_decls
│  }
■
The ML interface deals with lists of declarations for convenience in managing
machine-generated type names. The declarations produced by a call should be
translated into Z and stored in the appropriate theory before making another call,
otherwise duplicated names may be returned.
=FAILURE
508080	Syntax error: type mark expected in unconstrained array definition
508105	Invalid index constraint in declaration of record component ?0
508120	Modular types are not yet supported
=ENDDOC
\subsection{Variable Declarations}

ⓈZ
│ ⦏OPT_INIT⦎ ::= ⦏no_init⦎ | ⦏init_val⦎ EXP
■


┌⦏SI_VAR_DECL⦎──
│ si_vars: ℙ SI_Var_Decl;
│ si_init: OPT_INIT
└─
┌⦏VAR_DECL⦎──
│ vars: ℙ Var_Decl;
│ init: OPT_INIT
└─
┌⦏adjust_var_decl_no_subtype⦎──
│ SI_VAR_DECL; VAR_DECL
├
│ (∀ x : si_vars ⦁ x.t.con = si_no_con)  ∧
│   (∃i: EXP; vd : vars⦁
│	init = si_init = no_init ∨
│	si_init = init_val i ∧ init = init_val (add_tmark(i, vd.tmark))) ∧
│  vars = {SI_Var_Decl⦁ θSI_Var_Decl ↦ (var≜var, tmark≜t.tmark)}⦇si_vars⦈
└──
┌⦏adjust_var_decl_subtype⦎──
│ SI_VAR_DECL; VAR_DECL; basic_decl : SI_BASIC_DECL
├
│ ∃ SI_Sub_Ind; name:ID; i : EXP ⦁
│   (∀ x : si_vars ⦁ x.t = θ SI_Sub_Ind ∧ x.t.con ≠ si_no_con) ∧
│   name = si_generate_id(θ SI_Sub_Ind) ∧
│   basic_decl = si_subtype_decl( θSI_Subtype_Decl ) ∧
│   (init = si_init = no_init ∨
│     si_init = init_val i ∧ init = init_val (add_tmark(i, name)))∧
│   vars = {SI_Var_Decl⦁ θSI_Var_Decl ↦ (var≜var, tmark≜name)}⦇si_vars⦈
└──
=DOC
val ⦏adjust_var_decls⦎ : CN_ENV * Z_ID list -> SI_VAR_DECL list -> (BASIC_DECL list * VAR_DECL list);
=DESCRIBE
ⓈZAX
│ ⦏adjust_var_decl⦎ : SI_VAR_DECL → (OPT[SI_BASIC_DECL] × VAR_DECL)
├──────
│ adjust_var_decl =
│ {adjust_var_decl_subtype⦁ θSI_VAR_DECL ↦ (Value(basic_decl), θVAR_DECL)} ∪
│ {adjust_var_decl_no_subtype⦁ θSI_VAR_DECL ↦ (Nil, θVAR_DECL)}
■
The ML interface deals with lists of declarations for convenience in managing
machine-generated type names. It also recursively process any generated {SI\_BASIC\_DECL}s
for the same reason. The declarations produced by a call should be
translated into Z and stored in the appropriate theory before making another call,
otherwise duplicated names may occur.
=ENDDOC

\section{EPILOGUE}

=SML
end (* signature CNBasicDeclsAndExprs *);
=TEX
\section{TEST POLICY}
The functions in this document are to be tested according to the
criteria identified in \cite{ISS/HAT/DAZ/PLN003}.

\small
\twocolumn[\section{INDEX}]
\printindex

\end{document}

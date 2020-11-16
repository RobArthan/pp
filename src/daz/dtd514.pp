=IGN
********************************************************************************
dtd514.doc: this file is part of the PPDaz system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  dtd514.doc ℤ $Date: 2007/05/13 14:55:58 $ $Revision: 1.46 $ $RCSfile: dtd514.doc,v $
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

\def\Title{Compliance Notation (Volume II) Types}

\def\AbstractText{This document contains the detailed design for the data types used in Volume 2 of the compliance notation specification (``VC Generation'').}

\def\Reference{ISS/HAT/DAZ/DTD514}

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
%% LaTeX2e port: \TPPtitle{Compliance Notation (Volume II) Types}  %% Mandatory field
%% LaTeX2e port: \TPPref{ISS/HAT/DAZ/DTD514}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.46 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2007/05/13 14:55:58 $%
%% LaTeX2e port: }}
%% LaTeX2e port: %\TPPstatus{Approved}
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: %\TPPkeywords{Compliance Notation}
%% LaTeX2e port: \TPPauthor{D.J.~King&WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & HAT Team}
%% LaTeX2e port: \TPPabstract{
%% LaTeX2e port: This document contains the detailed design for the data types used in Volume 2 of the compliance notation specification (``VC Generation'').}
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
%% LaTeX2e port: \def\TPPheadlhs{Lemma 1 Ltd.}
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
\item[Issues 1.1 (1994/04/27)-1.5 (1994/08/10)] Initial Drafts.
\item[Issue 1.6 (1994/10/13) (13th October 1994) ] Added support for auxiliary variables.
\item[Issues 1.6 (1994/10/13)-1.9 (1994/12/01)] Bug fixing.
\item[Issue 1.10 (1994/12/05)] Carried out document rework according to desk check report 013.
\item[Issue 1.11 (1994/12/06)] Reworded the test policy section.
\item[Issue 1.12 (1995/10/27)] Updated the distribution list.
\item[Issues 1.13 (1995/12/14)-1.14 (1996/02/22)] Updated DRA specification references.
\item[Issue 1.15 (1997/07/29),1.16 (1997/08/18)] Updated references.
\item[Issue 1.17 (1999/02/10)-1.21 (2000/05/24)]  Changes for lightweight tool and NJML port.
\item[Issue 1.22 (2000/10/25)] CTLE II R2/1: global variable unsoundness.
\item[Issue 1.23 (2001/12/12)] Removed local declarations for Poly/ML port.
\item[Issue 1.24 (2002/01/14)] Index brackets added.
\item[Issue 1.25 (2002/05/06)] R0053:  return and exit statements.
\item[Issue 1.26 (2002/05/07)]  Support for R0047: renaming.
\item[Issue 1.27 (2002/05/14)] {\it renamings} is now called {\it var\_renamings} in the specs.
\item[Issue 1.28 (2002/07/13)] R0054: reworked treatment of use clauses.
\item[Issue 1.29 (2002/08/08)] R0051: default parameters.
\item[Issue 1.30 (2002/08/23)] Removed use of ICL logo font.
\item[Issue 1.25 (2002/05/06)] R0053: exits from named loops.
\item[Issue 1.26 (2002/05/07)] Spring 2002 enhancements: return and exit statements.
\item[Issue 1.27 (2002/05/14)]]  Support for R0047: renaming.
\item[Issue 1.28 (2002/07/13)] {\it renamings} is now called {\it var\_renamings} in the specs.
\item[Issue 1.29 (2002/08/08)] Declare type  \textit{ ROUTE} for VC derivation information.
\item[Issue 1.30 (2002/08/23)] Merged in changes for R0062.
\item[Issue 1.32 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.33 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.34 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.35 (2002/11/25)] Schemas-as-declarations now catered for in output Z syntax.
\item[Issues 1.36 (2004/06/20)-1.38 (2004/07/03)] Reform of the Environments.
\item[Issue 1.39 (2004/07/13)] Support for multiple use clauses for the same package.
\item[Issue 1.40 (2004/09/01)] Data types to support new treatment of initial variables in side conditions.
\item[Issue 1.41 (2005/02/20)] Fixed problem with object renamings in package specifications.
\item[Issue 1.42 (2005/02/26)] Added variant of {\em env\_of\_env\_dict}.
\item[Issue 1.45 (2006/04/12)] Support for general expanded names.
\item[Issue 1.46 (2007/05/13)] Elements of a block name are now optional so that anonymous blocks and loops can be represented.
\item[Issue 1.47 (2010/02/11)] Removed obsolete CUTDOWNVERSION option.
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
This document contains the detailed design for the Standard ML types representing the data structures used in \cite[Volume 2]{DRA/CIS/CSE3/TR/94/27/3.0}; it is called for in \cite{ISS/HAT/DAZ/HLD503}.

\subsection{Introduction}

As discussed in \cite{ISS/HAT/DAZ/HLD503}, it is convenient in the Standard ML implementation for the definitions of types used in the Compliance Notation Processing to be placed in a separate structure (i.e., module) from the functions which act on those types.
This document gives the structure (i.e., module) containing the types used in implementing \cite[Volume 2]{DRA/CIS/CSE3/TR/94/27/3.0}.
As usual it also includes a transcription into {\ProductZ} of the relevant parts of the DRA specification.

\subsubsection{Purpose and Background}

See \cite{ISS/HAT/DAZ/HLD503}.


\subsubsection{Dependencies}
See \cite{ISS/HAT/DAZ/HLD503}.

\subsection{Compliance}
For a justification of the style of presenting Z types used in this document, see \cite[section 1.3]{ISS/HAT/DAZ/DTD502}.

It is intended that the compliance of the Z to the implementation can be done with a visual check in this document.

\section{PREAMBLE}
\subsection{Preamble for Z Type-Checking}

The following initialises the theory database when performing a syntax and type check on the Z paragraphs in this document. (This preamble is not processed when building the compliance tool.)

=SMLZ
open_theory"dtd502";
push_pc "z_library";
force_delete_theory"dtd514" handle Fail _ => ();
val _ = set_flag ("z_type_check_only", true);
new_theory "dtd514";
=TEX
\subsection{The Signature}
=TEX

=DOC
signature ⦏CNTypes2⦎ = sig
=DESCRIBE
=ENDDOC
It would be much nicer if the following signature inclusions could
be replaced by local declarations of the corresponding structures
but that is not supported in strict SML '97. (N.b. both structures
would be in the local declaration if they were available since
the second signature would not include the first).
=SML
include	CNBasicDeclsAndExprs;
=TEX



\section{WEAKEST PRECONDITIONS}

This is taken from \cite[volume 2, sect. 4.1]{DRA/CIS/CSE3/TR/94/27/3.0}.

ⓈZ
│	⦏MODE⦎ ::= inn | in_out | out
■
The design for mode, parameter specification and formal procedures is specified in \cite{ISS/HAT/DAZ/DTD502}.

┌⦏Param_Spec⦎─────────────────
│	Var_Decl;
│	mode : MODE
└────────────────────
=TEX

┌⦏Formal_Proc⦎─────────────────
│	name : ID;
│	formal_ids : seq Param_Spec;
│	globals : seq Z_ID;
│	Spec
└────────────────────

=TEX

┌⦏Informal_Fun⦎─────────────────
│	name : ID;
│	formal_pars : seq Param_Spec;
│	return_type : TMARK
└───────────────────


=SML
type ⦏INFORMAL_FUN⦎
=TYPESTRUCT
      = {
	name : ID,
	formal_pars : PARAM_SPEC list,
	par_names_defs : (ID * Z_EXP OPT) list,
	return_type : TMARK
};
=TEX

┌⦏Wp_Env⦎─────────────────
│	fun_header : Informal_Fun;
│	return, till : Z_PRED;
│	named_tills : ID → Z_PRED;
│	formal_procs : ℙ Formal_Proc
└────────────────────

=SML
(*
=SML
type CN_ENV
=TYPESTRUCT
  = unit;
=SML
*)
=SML
type ⦏WP_ENV⦎
=TYPESTRUCT
      = {
	fun_header : INFORMAL_FUN,
	return : Z_PRED,
	till : Z_PRED,
	named_tills : (ID * Z_PRED) list,
	env : CN_ENV
	};
=TEX

┌⦏Result⦎─────────────────
│	WP : ℙ Sequent;
│	SIDE : ℙ (Sequent × ℙZ_ID);
│	MODIFIES : ℙZ_ID
└────────────────────

ⓈZAX
│	⦏wp⦎ : (Statement × ℙ Sequent × Wp_Env) ⇸ Result
■

=SML
type ⦏SEQUENT⦎
=TYPESTRUCT
	= SEQ;
=SML
type ⦏RESULT⦎
=TYPESTRUCT
      = {
	wp : SEQUENT list,
	side : (SEQUENT * Z_ID list) list,
	modifies : Z_ID list
	};
=TEX

┌⦏Pars⦎─────────────────
│	st : Statement;
│	A : ℙ Sequent;
│	Wp_Env;
│	Result
└────────────────────
The schema $Pars$ is used to define the arguments and result of the weakest precondition function for the free type $Stmt$.
The function is in effect formed as the union of a family of partial functions which are actually given as sets of bindings of type $Pars$.
To implement this in Standard ML, we use functions parameterised by the function $wp$ which we are defining.
It is also more convenient in Standard ML to pass the constituent of an arm of the free type rather than the free type value itself.
The following Standard ML types assist in all this.
=SML
type ⦏WP_TYPE⦎
=TYPESTRUCT
	= (STATEMENT * SEQUENT list * WP_ENV) -> RESULT;
=SML
type ⦏WP_PARS⦎
=TYPESTRUCT
      = {
	wp : WP_TYPE,
	a: SEQUENT list,
	wp_env : WP_ENV
	};
=TEX
\section{VERIFICATION CONDITIONS}

=SML
type ⦏VC⦎
=TYPESTRUCT
      = Z_DECL list * SEQUENT;
=TEX


This is taken from \cite[volume 2, sect. 5.1]{DRA/CIS/CSE3/TR/94/27/3.0}
ⓈZ
│	⦏FLAG⦎ ::= True | False
■

=SML
type ⦏FLAG⦎
=TYPESTRUCT
	= bool;
=TEX

ⓈZ
│	[⦏LABEL⦎]
■

The type of LABEL is declared in the structure CNTypes in \cite{ISS/HAT/DAZ/DTD502}.

┌⦏In_Scope⦎─────────────────
│	vc_vars : ℙ Var_Decl;
│	vc_pars : ℙ Param_Spec;
│	vc_log_cons, vc_aux_vars : ℙ Z_Decl[Z_EXP];
│	obj_renamings : Z_ID ⇸ Z_ID;
│	use_clause_subs : Z_ID ⇸ Z_ID;
│	formal_procs : ℙ Formal_Proc;
│	dec_labels : ℙ LABEL
└────────────────────
=TEX
=DOC
type ⦏LOCAL_VARS⦎
=TYPESTRUCT
	=  {
		vc_vars : Z_ID list,
		vc_pars : Z_ID list,
		vc_aux_vars : Z_ID list,
		vc_log_cons : Z_ID list};
=SML
type ⦏ENV_DICT⦎;
val ⦏initial_env_dict⦎ : ENV_DICT;
val ⦏add_to_env_dict⦎ : ENV_DICT -> ENV_INFO S_DICT -> ENV_DICT;
val ⦏delete_from_env_dict⦎ : ENV_DICT -> Z_ID list-> ENV_DICT;
val ⦏set_cn_scope⦎ : ENV_DICT -> Z_ID list -> ENV_DICT;
val ⦏get_cn_scope⦎ : ENV_DICT -> Z_ID list OPT;
val ⦏env_of_env_dict⦎ : ENV_DICT ->  CN_ENV;
val ⦏env_of_env_dict1⦎ : ENV_DICT ->  CN_ENV;
val ⦏flatten_env_dict⦎ : ENV_DICT ->  ENV_INFO S_DICT;
val ⦏ti_context_of_env_dict⦎ : ENV_DICT -> TYPE E_DICT;
val ⦏new_scope_env_dict⦎ : ENV_DICT -> ENV_DICT;
val ⦏get_local_vars⦎ : ENV_DICT -> LOCAL_VARS;
val ⦏get_used_packages⦎ : ENV_DICT -> ID list;
val ⦏add_used_package⦎ : ENV_DICT -> ID -> ENV_DICT;
=DESCRIBE
This type and associated functions form an abstract data type encapsulating the functionality requried of the part of an  {\em IN\_SCOPE} that maps entity names to their environment information.
The new scope function clears out the information on {vc\_vars}, {vc\_pars} etc. as required when one enters a new scope.

The functions also manage a corresponding type inference context adding entries for program variables, parameters, auxiliary variables and logical constants as necessary.
Entries for entities of these sorts must include the HOL type.
Note that the functions do not actually set the type inference context, they just maintain it for caller to set as required.

{\em env\_of\_env\_dict1} differs from {\em env\_of\_env\_dict} in not trying to use {\em get\_const\_type} if the name has not been recorded in the environment, but returning {\em Nil} in that case.

=FAILURE
514001	Internal error: invalid entry for ?0: a type must be supplied with this kind of entry
514002	The name ?0 is not in scope here
=ENDDOC
=SML
type ⦏IN_SCOPE⦎
=TYPESTRUCT
      = {
	dict : ENV_DICT,
	dec_labels : LABEL list
	};
=TEX
┌⦏Speclab⦎─────────────────
│	Spec;
│	formal_body_flag, fun_flag, till_flag : FLAG;
│	Wp_Env;
│	In_Scope
└────────────────────

=SML
type ⦏SPECLAB⦎
=TYPESTRUCT
      = {
	spec : SPEC,
	formal_body_flag : FLAG,
	fun_flag : FLAG,
	till_flag : FLAG,
	wp_env : WP_ENV,
	in_scope : IN_SCOPE,
	block_name : ID OPT list
	};
=TEX


=SML
type ROUTE
=TYPESTRUCT
	= TERM;
=TEX

\section{EPILOGUE}
=SML
end; (* signature CNTypes2 *)
=TEX
\section{TEST POLICY}
There are no module tests for the design in this document since it specifies no functions.

\small
\twocolumn[\section{INDEX}]
\printindex

\end{document}




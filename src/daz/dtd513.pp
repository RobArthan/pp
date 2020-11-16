=IGN
********************************************************************************
dtd513.doc: this file is part of the PPDaz system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  dtd513.doc ℤ $Date: 2008/12/14 16:17:44 $ $Revision: 1.86 $ $RCSfile: dtd513.doc,v $
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

\def\Title{Compliance Notation (Volume I) Types}

\def\AbstractText{This document contains the detailed design for the data types used in Volume 1 of the compliance notation specification (``Obtaining the Z Document'').}

\def\Reference{ISS/HAT/DAZ/DTD513}

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
%% LaTeX2e port: \TPPtitle{Compliance Notation (Volume I) Types}  %% Mandatory field
%% LaTeX2e port: \TPPref{ISS/HAT/DAZ/DTD513}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.86 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2008/12/14 16:17:44 $%
%% LaTeX2e port: }}
%% LaTeX2e port: %\TPPstatus{Approved}
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPauthor{D.J.~King&WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & HAT Team}
%% LaTeX2e port: \TPPabstract{
%% LaTeX2e port: This document contains the detailed design for the data types used in Volume 1 of the compliance notation specification (``Obtaining the Z Document'').}
%% LaTeX2e port: %\TPPabstractB{}
%% LaTeX2e port: %\TPPabstractC{}
%% LaTeX2e port: %\TPPabstractD{}
%% LaTeX2e port: %\TPPabstractE{}
%% LaTeX2e port: %\TPPabstractF{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	A.~Smith, DRA \\
%% LaTeX2e port: 	Library}}
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
\item[Issue 1.1 (1994/03/24)-1.15 (1994/06/13)] Initial Drafts.
\item[Issues 1.16 (1994/10/13), 1.17 (1994/11/03), 1.18 (1994/11/08)] Added support for auxiliary variables.
\item[Issue 1.19 (1994/11/15)] Replacement environment now distinguishes refinements from replacements.
\item[Issue 1.20 (1994/11/21)] Bug fixing.
\item[Issue 1.21 (1994/12/01)] Updated document references.
\item[Issue 1.22 (1994/12/05)] Carried out document rework according to desk check report 012.
\item[Issue 1.23 (1994/12/06)] Reworked the test policy section.
\item[Issue 1.24 (1994/12/12)] Corrected the type of $toolkit$ and $extend$ in the Z to $Z\_MODULE$.
\item[Issue 1.25 (1995/01/05)] Renamed $CN\_STATE$ to be $Z\_GENERATOR\_STATE$.
\item[Issue 1.26 (1995/10/03)] Batch A enhancements (just requires an extra component in the $PACKAGE$ type)
\item[Issue 1.27 (1995/10/25)] Tidy-up for review.
\item[Issue 1.28 (1995/12/14)] Syntax changes.
\item[Issue 1.29 (1996/07/15)-30] IUCT WP 7 changes.
\item[Issue 1.31 (1997/06/03)] Changes for IUCT WP 2.
\item[Issue 1.32 (1997/07/18),1.33 (1997/07/23)] Changes for IUCT WP 4.
\item[Issue 1.34 (1997/07/29)] Corrected Z syntax and type errors.
\item[Issue 1.35 (1997/08/13)] Updated Z for HLD504 Appendix Material.
\item[Issue 1.36 (1997/08/18)] Updated references.
\item[Issue 1.37 (1997/08/19)] Tidying.
\item[Issue 1.38 (1999/02/10)] Added conditional compilation labels FULLVERSION and CUTDOWNVERSION for
open of CNBasicDeclsAndExprs.
\item[Issue 1.39 (1999/02/17)] Changes for NJML port.
\item[Issues 1.40 (2000/10/17), 1.41 (2000/10/17)] Brought into line with latest specifications.
\item[Issue 1.42 (2000/10/25)] CTLE II R2/1: global variable unsoundness.
\item[Issue 1.43 (2000/10/26),1.44 (2000/10/27)] CTLE II R1/11: nested packages.
\item[Issue 1.45 (2001/12/12)] Removed local declarations for Poly/ML port.
\item[Issue 1.46 (2002/01/14)] Index brackets added.
\item[Issue 1.47 (2002/01/30)] Type mark now required in variable initialisers.
\item[Issue 1.48 (2002/02/14)] Applying specification changes from HLD508.
\item[Issue 1.49 (2002/02/18)] Fixing {\LaTeX} errors for SPC501.
\item[Issue 1.50 (2002/04/26)] Fixed error in spec of {\it subprog\_flatten\_env}.
\item[Issue 1.51 (2002/05/06)] Spring 2002 enhancements: return and exit statements.
\item[Issue 1.52 (2002/05/07)]  Support for R0047: renaming.
\item[Issue 1.53 (2002/05/10)] {\it renamings} is now called {\it var\_renamings} in the specs.
\item[Issue 1.54 (2002/05/14), 1.55 (2002/05/17)] Spec updates for interim release.
\item[Issue 1.56 (2002/07/13)] R0054: reworked treatment of use clauses.
\item[Issue 1.57 (2002/08/23)] Removed use of ICL logo font.
\item[Issue 1.58 (2002/10/14)] Merged in changes for R00962. Add type for VC info used in browser.
\item[Issue 1.59 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.60 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.61 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.62 (2002/11/18)] Script deletion
\item[Issue 1.63 (2002/11/25)] Schemas-as-declarations now catered for in output Z syntax.
\item[Issue 1.64 (2002/12/07), 1.65 (2002/12/07)] Schemas in function $\Xi$-lists.
\item[Issue 1.66 (2003/02/05)] Updates to the Z after GMP's preliminary review.
\item[Issue 1.67 (2003/05/27)] Package environment now includes the complete compiltation unit for each package.
(to support R0091, which requires us to record the context clause for the package).
\item[Issue 1.68 (2004/07/10)-1.70 (2004/07/17)] Environment reform.
\item[Issue 1.71 (2004/10/09)] Using clauses now allowed anywhere in package body.
\item[Issue 1.72 (2004/10/26)] Added to package data type to enable fix to informal procedure unsoundness problem.
\item[Issue 1.73 (2004/11/18)] Added field to the FORAML\_FUN data type so that renamings of functions in package specifications can be handled more nicely.
\item[Issue 1.74 (2005/09/22)] Fixed problem with object renamings in package specifications.
\item[Issue 1.75 (2006/03/17)] First clean compile for enhancement 117.
\item[Issue 1.76 (2006/04/12)] Support for general expanded names.
\item[Issue 1.77 (2006/09/16)] Added the SCOPE\_ENV.
\item[Issue 1.78 (2007/05/13)] Elements of a block name are now optional so that scopes within anonymous blocks and loops can be represented.
\item[Issue 1.79 (2007/11/11)] Added information required to support deletion of deferred subprograms.
\item[Issue 1.80 (2008/03/23), 1.81 (2008/03/24)] Child packages.
\item[Issue 1.82 (2008/11/29)] Made {\em FORMAL\_FUN} type match current treatment of function renaming.
\item[Issues 1.83 (2008/12/06)--1.86 (2008/12/14)] Added data types for the evaluation report generator.
\item[Issue 1.87 (2010/02/11)] Removed obsolete CUTDOWNVERSION option.
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
This document contains the detailed design for the Standard ML types representing the data structures used in \cite[Volume 1]{DRA/CIS/CSE3/TR/94/27/3.0}; it is called for in \cite{ISS/HAT/DAZ/HLD503}.

\subsection{Introduction}
As discussed in \cite{ISS/HAT/DAZ/HLD503}, it is convenient in the Standard ML implementation for the definitions of types used in the Compliance Notation Processing to be placed in a separate structure (i.e., module) from the functions which act on those types.
This document gives the structure (i.e., module) containing the types used in implementing \cite[Volume 1]{DRA/CIS/CSE3/TR/94/27/3.0}.
As usual it also includes a transcription into {\ProductZ} of the relevant parts of the DRA specification.

The SPARK Program Extractor is also largely implemented as a by-product of the processing which extracts the Z.
A Z specification of the relevant data structures is also given here in section \ref{SPARKProgramEnvironment}.

\subsubsection{Purpose and Background}
See \cite{ISS/HAT/DAZ/HLD503}.

\subsubsection{Dependencies}
See \cite{ISS/HAT/DAZ/HLD503}.
\subsection{Compliance}
For a justification of the style of presenting Z types used in this document, see \cite[section 1.3]{ISS/HAT/DAZ/DTD502}.

It is intended that the compliance of the Z to the implementation can be done with a visual check in this document.

\section{DESIGN ISSUES}
\subsection{Representation of the State}
\cite[Volume 1]{DRA/CIS/CSE3/TR/94/27/3.0} identifies several environments and some global variables which are modelled as being the subject of assignments during the Compliance Notation Processing.
It turns out that what are referred to as global variables are all used to hold fragments of abstract syntax which will be directly available in the implementation (and so these variables are not mentioned further in this document).

It is convenient in the implementation to bring the various environments together into a single ML record which acts as the state.
The type of this state record is given in section \ref{STATERECORD} below.

\subsection{Representation of Z Functions in the Environnments}
The environments in \cite[Volume 1]{DRA/CIS/CSE3/TR/94/27/3.0} make some use of (finite) Z functions, e.g., for the package specification environment.
The domains of these functions are (subsets of) the type $ID$ of identifiers (which are represented as ML strings, see \cite{ISS/HAT/DAZ/DTD502}).
{\Product} provides some ML library support for string-indexed look-up tables called dictionaries and these are convenient for representing the Z finite functions.

\subsection{Component Update Functions}

In order not to fragment the DRA specifications, the Z signatures of the component update functions ($Package\_vc\_vars$) are given here.
These functions are implemented as private functions in the ML structure $CNZGenerator$ of \cite{ISS/HAT/DAZ/IMP507}.


\section{PREAMBLE}
\subsection{Preamble for Z Type-Checking}

The following initialises the theory database when performing a syntax and type check on the Z paragraphs in this document. (This preamble is not processed when building the compliance tool.)

=SMLZ
open_theory"dtd508";
push_pc "z_library";
force_delete_theory"dtd513" handle Fail _ => ();
val _ = set_flag ("z_type_check_only", true);
new_theory "dtd513";
new_parent"dtd514";
=TEX
\subsection{The Signature}
=TEX

=DOC
signature ⦏CNTypes1⦎ = sig
=DESCRIBE
=ENDDOC

As in the other signatures that define types, it would
be much nicer to use local declarations rather than includes,
but SML '97 doesn't support that.
=SML
include	(* CNTypes CNBasicDeclsAndExprs *) CNTypes2;
=TEX
\section{Z DOCUMENT}
For completeness, we give the Z from section 2 of \cite[Volume 1]{DRA/CIS/CSE3/TR/94/27/3.0} here.
However, the implementation of this
 is provided by the existing {\Product} support for Z.

┌⦏Z_DOC⦎───────────────────
│	z : seq Z_PARA
└────────────────────────

ⓈZAX
│ ⦏Z_toolkit⦎, ⦏SPARK_toolkit⦎ : Z_ID
■
┌ ⦏SCRIPT_NAME⦎ ───────────
│ script_name? : Z_ID
└──────────────
┌ ⦏INIT_Z_DOC⦎ ───────────
│ SCRIPT_NAME;
│ Z_DOC
├──────
│	∃ mod_name : Z_ID; parents : ℙZ_ID
│	| mod_name = script_name? ∧ {Z_toolkit, SPARK_toolkit} ⊆ parents
│ 	⦁ z = ⟨z_module(θZ_MODULE), z_parents(θZ_PARENTS)⟩
└──────────────

\section{COMPLIANCE NOTATION ENVIRONMENTS}
\subsection{Handling of Expanded Names}
=DOC
type ⦏PREFIX_INFO⦎
=TYPESTRUCT
	= {
	    canon : Z_ID list,
	    aliases : Z_ID list list
	};
=DESCRIBE
This type is used to represent a set of prefixes to be applied to the name of
an Ada entity when it is stored in an environment.
=ENDDOC

\subsection{Package Specification Environment}


=DOC
type ⦏FORMAL_FUN⦎
=TYPESTRUCT
      = {
	informal_fun : INFORMAL_FUN,
	spec : SPEC,
	globals : Z_ID list
	};
=DESCRIBE
┌⦏Formal_Fun⦎─────────────────
│	Informal_Fun;
│	Spec;
│	globals : seq Z_ID
├─────────────
│	w = {}
└────────────────────
=ENDDOC

In the following the context compilation unit is used to carry the package declaration
for use in checking whether the package declaration contains any unexpanded k-slots
together with its with and use clauses for use in processing the corresponding package body.
=DOC
type ⦏PACKAGE⦎
=TYPESTRUCT
      = {
	vc_vars : VAR_DECL list,
	consts_types : BASIC_DECL list,
	formal_procs : FORMAL_PROC list,
	informal_procs : ID list,
	informal_funs : INFORMAL_FUN list,
	formal_funs : FORMAL_FUN list,
	aux_vars : Z_DECL list,
	obj_renamings : (Z_ID * Z_ID OPT) list,
	zmod : ID,
	decl : CONTEXT_COMPILATION_UNIT,
	local_dict : ENV_DICT,
	private_dict : ENV_DICT,
	with_dict : ENV_DICT
	};
=DESCRIBE
┌⦏Package⦎─────────────────
│	vc_vars : ℙ Var_Decl;
│	consts_types : seq BASIC_DECL;
│	formal_procs : ℙ Formal_Proc;
│	informal_funs : seq Informal_Fun;
│	formal_funs : seq Formal_Fun;
│	aux_vars : ℙ Z_Decl[Z_EXP];
│	obj_renamings : Z_ID ⇸ Z_ID;
│	zmod : Z_MODULE
└────────────────────
The extra component {\it decl} in the ML allows us to check, where necessary, that formal
development of the package is complete.
=ENDDOC


=DOC
type ⦏PACK_ENV⦎
=TYPESTRUCT
      =  PACKAGE S_DICT;
=DESCRIBE
ⓈZAX
│	⦏Package_vc_vars⦎ : (Package × ℙ Var_Decl) → Package;
│	⦏Package_consts_types⦎ :
│		(Package × seq BASIC_DECL) → Package;
│	⦏Package_formal_procs⦎ : (Package × ℙ Formal_Proc) → Package;
│	⦏Package_informal_funs⦎ :
│		(Package × seq Informal_Fun) → Package;
│	⦏Package_formal_funs⦎ : (Package × seq Formal_Fun) → Package;
│	⦏Package_aux_vars⦎ : (Package × ℙ Z_Decl[Z_EXP]) → Package;
│	⦏Package_obj_renamings⦎ : (Package × (Z_ID ⇸ Z_ID)) → Package
■

┌⦏PACK_ENV⦎─────────────────
│	pack_env : ID ⇸ Package
└────────────────────
ⓈZ
│	⦏PACK_ENV0⦎ ≜ [PACK_ENV | pack_env = {}]
■
=ENDDOC


\subsection{Subunit Environment}


The z module is represented simply as an identifier.
=DOC
type ⦏SUBUNIT⦎
=TYPESTRUCT
      = {
	zmod : ID,
	specif_flag : FLAG,
	specif : SPEC,
	in_scope : IN_SCOPE,
	globs : Z_ID list
	};
=DESCRIBE
┌⦏Subunit⦎─────────────────
│	zmod : Z_MODULE;
│	specif_flag : FLAG;
│	specif : Spec;
│	globs : seq Z_ID;
│	In_Scope
└────────────────────
=ENDDOC


The pair of identifiers used to index the subunit environment will be represented by a single string. E.g., if `child' is a subunit of `parent', the string will be `parent\_\_child'. (C.f. the construction of a theory name for a subunit as described in \cite{ISS/HAT/DAZ/HLD501}).

=DOC
type ⦏SUBUNIT_ENV⦎
=TYPESTRUCT
      = SUBUNIT S_DICT;
=DESCRIBE
ⓈZAX
│	⦏Subunit_vc_vars⦎ : (Subunit × ℙ Var_Decl) → Subunit;
│	⦏Subunit_formal_procs⦎ : (Subunit × ℙ Formal_Proc) → Subunit;
│	⦏Subunit_dec_labels⦎ : (Subunit × ℙ LABEL) → Subunit
■

┌⦏SUBUNIT_ENV⦎─────────────────
│	subunit_env : (ID × ID) ⇸ Subunit
└────────────────────
ⓈZ
│	⦏SUBUNIT_ENV0⦎ ≜ [SUBUNIT_ENV | subunit_env = {}]
■
=ENDDOC


\subsection{Dec Label Environment}


=DOC
type ⦏FLAGS⦎
=TYPESTRUCT
      = {
	pack_spec_flag : FLAG,
	pack_body_flag : FLAG,
	stub_flag : FLAG,
	subunit_flag : FLAG,
	body_flag : FLAG,
	formal_body_flag : FLAG,
	fun_flag : FLAG,
	declabel_flag : FLAG,
	speclabel_flag : FLAG,
	till_flag : FLAG,
	private_flag : FLAG
	};
=DESCRIBE
┌⦏Flags⦎─────────────────
│	pack_spec_flag, pack_body_flag, stub_flag, subunit_flag, body_flag,
│	formal_body_flag, fun_flag, declabel_flag, speclabel_flag, till_flag :
│		FLAG
└────────────────────
=ENDDOC

=DOC
type ⦏DECLAB⦎
=TYPESTRUCT
      = {
	block_name : ID OPT list,
	flags : FLAGS,
	using_decs : (Z_ID * (VAR_DECL list * Z_PRED)) list,
	in_scope : IN_SCOPE
	};
=DESCRIBE
┌⦏Declab⦎─────────────────
│	block_name : ID;
│	Flags;
│	In_Scope
└────────────────────
=ENDDOC


A $LABEL$ is either a string or a special marker for an implicit label  (see \cite{ISS/HAT/DAZ/DTD502}).
The latter form will be mapped into an internally generated string here and so we can still use the string-indexed dictionaries for the dec label environment.

=DOC
type ⦏DEC_ENV⦎
=TYPESTRUCT
      = DECLAB S_DICT;
=DESCRIBE
ⓈZAX
│	⦏Declab_declabel_flag⦎ : (Declab × FLAG) → Declab;
│	⦏Declab_vc_vars⦎ : (Declab × ℙ Var_Decl) → Declab;
│	⦏Declab_formal_procs⦎ : (Declab × ℙ Formal_Proc) → Declab;
│	⦏Declab_dec_labels⦎ : (Declab × ℙ LABEL) → Declab
■

┌⦏DEC_ENV⦎─────────────────
│	dec_env : LABEL ⇸ Declab
└────────────────────
ⓈZ
│	⦏DEC_ENV0⦎ ≜ [DEC_ENV | dec_env = {}]
■
=ENDDOC


\subsection{Spec Label Environment}


The remarks above concerning labels and $DEC\_ENV$ also apply to $SPEC\_ENV$.

=DOC
type ⦏SPEC_ENV⦎
=TYPESTRUCT
      = SPECLAB S_DICT;
=DESCRIBE
ⓈZAX
│	⦏Speclab_w⦎ : (Speclab × ℙ Z_ID) → Speclab;
│	⦏Speclab_vc_vars⦎ : (Speclab × ℙ Var_Decl) → Speclab;
│	⦏Speclab_formal_procs⦎ : (Speclab × ℙ Formal_Proc) → Speclab;
│	⦏Speclab_dec_labels⦎ : (Speclab × ℙ LABEL) → Speclab;
│	⦏Speclab_pre⦎ : Speclab × Z_PRED → Speclab;
│	⦏Speclab_in_scope⦎ : Speclab × In_Scope → Speclab
■

┌⦏SPEC_ENV⦎─────────────────
│	spec_env : LABEL ⇸ Speclab
└────────────────────
ⓈZ
│	⦏SPEC_ENV0⦎ ≜ [SPEC_ENV | spec_env = {}]
■
=ENDDOC


\subsection{Running Environment}

The components $current\_for\_vars$ and $current\_log\_cons$ are required to add the for loop variables and logical constants to the scope of the block. This constitutes part of the implementation for \cite[volume 1, section 16.4.1]{DRA/CIS/CSE3/TR/94/27/3.0}.
=DOC
type ⦏BLOCK⦎
=TYPESTRUCT
      = {
	declab : DECLAB,
	current_formal_proc : FORMAL_PROC,
	current_formal_fun : FORMAL_FUN,
	current_for_vars : PARAM_SPEC list,
	current_log_cons : Z_DECL list,
	current_loop_name : ID OPT,
	dec_lab : LABEL,
	spec_lab : LABEL,
	till : Z_PRED,
	var_inits : (EXP * TMARK) S_DICT
	};
=DESCRIBE
┌⦏Block⦎─────────────────
│	Declab;
│	current_formal_proc : Formal_Proc;
│	current_formal_fun : Formal_Fun;
│	current_loop_name : OPT[ID];
│	dec_lab, spec_lab : LABEL;
│	till : Z_PRED;
│	using_decs : Z_ID ⇸ (ℙ Var_Decl × Z_PRED);
│	var_inits : ID ⇸ (EXP × TMARK)
└────────────────────
=ENDDOC


=DOC
type ⦏ENV⦎
=TYPESTRUCT
      = BLOCK list;
=DESCRIBE
ⓈZAX
│	⦏Block_stub_flag⦎,
│	⦏Block_body_flag⦎,
│	⦏Block_till_flag⦎ : (Block × FLAG) → Block;
│	⦏Block_vc_vars⦎ : (Block × ℙ Var_Decl) → Block;
│	⦏Block_vc_pars⦎ : (Block × ℙ Param_Spec) → Block;
│	⦏Block_vc_log_cons⦎ : (Block × ℙ Z_Decl[Z_EXP]) → Block;
│	⦏Block_formal_procs⦎ : (Block × ℙ Formal_Proc) → Block;
│	⦏Block_dec_labels⦎ : (Block × ℙ LABEL) → Block;
│	⦏Block_current_formal_proc⦎ : (Block × Formal_Proc) → Block;
│	⦏Block_current_formal_fun⦎ : (Block × Formal_Fun) → Block;
│	⦏Block_current_loop_name⦎ : (Block × ID) → Block;
│	⦏Block_till⦎ : (Block × Z_PRED) → Block;
│	⦏Block_using_decs⦎ :
│		(Block × (Z_ID ⇸ (ℙ Var_Decl × Z_PRED))) → Block;
│	⦏Block_var_inits⦎ : (Block × (ID ⇸ EXP × TMARK)) → Block;
│ 	⦏Block_vc_aux_vars⦎ : (Block × ℙ Z_Decl) → Block;
│ 	⦏Block_obj_renamings⦎ : (Block × (Z_ID ⇸ Z_ID)) → Block;
│	⦏Block_use_clause_subs⦎ : (Block × (Z_ID ⇸ Z_EXP)) → Block;
│ 	⦏Block_in_scope⦎ : (Block × In_Scope) → Block
■

┌⦏ENV⦎─────────────────
│	blocks : seq⋎1 Block
└────────────────────
=ENDDOC

ⓈZAX
│ ⦏flatten_env⦎ : ENV → In_Scope
├──────
│ ∀ ENV; In_Scope; n : ID | n = (blocks 1).block_name⦁
│ flatten_env(θENV) = θIn_Scope ⇔
│ 	vc_vars = ⋃{b:ran blocks ⦁ b.vc_vars}
│ ∧	vc_pars = ⋃{b:ran blocks ⦁ b.vc_pars}
│ ∧	vc_log_cons = ⋃{b:ran blocks ⦁ b.vc_log_cons}
│ ∧	vc_aux_vars = ⋃{b:ran blocks ⦁ b.vc_aux_vars}
│ ∧	formal_procs = ⋃{b:ran blocks ⦁ b.formal_procs}
│ ∧	dec_labels = ⋃{b:ran blocks | b.block_name = n ⦁ b.dec_labels}
■

ⓈZAX
│ ⦏merge_in_scopes⦎ : In_Scope × In_Scope → In_Scope
├
│ ∀ In_Scope; In_Scope'; In_Scope''⦁
│   θIn_Scope'' = merge_in_scopes (θIn_Scope', θIn_Scope)
│ ⇔	vc_vars'' = vc_vars ∪ vc_vars'
│   ∧	vc_pars'' = vc_pars ∪ vc_pars'
│   ∧	vc_log_cons'' = vc_log_cons ∪ vc_log_cons'
│   ∧	vc_aux_vars'' = vc_aux_vars ∪ vc_aux_vars'
│   ∧	formal_procs'' = formal_procs ∪ formal_procs'
│   ∧	dec_labels'' = dec_labels ∪ dec_labels'
■

ⓈZAX
│ ⦏expand_schema_sigs⦎ : ℙZ_ID → ℙZ_ID
■
ⓈZAX
│ ⦏subprog_flatten_env⦎ : ENV → In_Scope
├──────
│ ∀ ENV; Block' | θBlock' = blocks 1⦁
│ formal_body_flag' = False ∧
│	subprog_flatten_env(θENV) = flatten_env(θENV) ∨
│ formal_body_flag' = True ∧
│ 	(∃globs : ℙZ_ID; ENV''; In_Scope'''; In_Scope''''; In_Scope'''''; name : ID
│	⦁  subprog_flatten_env (θENV) = θIn_Scope'''''
│	∧ (	fun_flag' = True
│		∧	globs = expand_schema_sigs(ran(current_formal_fun'.globals))
│		∧	name = current_formal_fun'.name
│	∨	fun_flag' = False
│		∧	globs = expand_schema_sigs(ran(current_formal_proc'.globals))
│		∧	name = current_formal_proc'.name)
│	∧ blocks'' = blocks ↾ { Block | block_name = name ⦁ θBlock }
│	∧ θIn_Scope''' = flatten_env(θENV)
│	∧ θIn_Scope'''' = flatten_env(θENV'')
│	∧ vc_vars''''' = vc_vars'''' ∪ {v : vc_vars''' | (trans_id v.var) ∈ globs}
│	∧ vc_pars''''' = vc_pars'''' ∪ {p : vc_pars''' | (trans_id p.var) ∈ globs}
│	∧ vc_log_cons''''' = vc_log_cons''''
│	∧ vc_aux_vars''''' = vc_aux_vars'''' ∪ {a : vc_aux_vars''' | (Value↗~↕)a.zvar ∈ globs}
│	∧ formal_procs'''''  = formal_procs'''
│	∧ dec_labels''''' = dec_labels'''')
■

┌⦏Empty_Block⦎─────────────────
│	Block
├─────────────
│	vc_vars = {};
│	vc_pars = {};
│	vc_log_cons = {};
│	vc_aux_vars = {};
│	formal_procs = {};
│	dec_labels = {};
│	var_inits = {};
│	current_loop_name = Nil
└────────────────────

┌⦏ENV0⦎─────────────────
│	ENV;
│	Empty_Block
├─────────────
│	blocks =  ⟨ θ Block ⟩;
│	pack_spec_flag =
│	pack_body_flag =
│	stub_flag =
│	subunit_flag =
│	formal_body_flag =
│	fun_flag = declabel_flag = speclabel_flag = till_flag = False
└────────────────────

\subsection{SPARK Program Environment}\label{SPARKProgramEnvironment}
As the literate script is processed, a data structure is maintained which enables the SPARK Program to be extracted.
This data structure is in two parts: {\em(i)}, $SPARK\_PROG$: a list of the compilation units, or compilation unit k-slots which will eventually make up the top-level parts of the program, and {\em(ii)}, $REPL\_ENV$: a table giving the association of k-slot labels with program fragments determined by the refinement and replacement web clauses contained in the literate script.
The intention is that when processing of a literate script is complete these two data structures will enable a pretty-printing function to use $REPL\_ENV$ to expand all the k-slots in $SPARK\_PROG$ (both at the top-level and inside any constituent compilation units) and so output the required SPARK program.

To describe the data structures in Z, we first need given sets to stand for the necessary parts of the abstract syntax which have not been formally specified before.

=DOC
type ⦏SPARK_PROG⦎
=TYPESTRUCT
	= KSLOT_COMPILATION_UNIT list;
=DESCRIBE
ⓈZ
│	[	⦏Compilation_Unit⦎,
│		⦏Private_Part⦎,
│		⦏Visible_Part⦎,
│		⦏Declarative_Part⦎,
│		⦏Annotation⦎]
■

ⓈZ
│	⦏K_Slot_Compilation_Unit⦎	::=	⦏kcu_k_slot⦎ (LABEL)
│					|	⦏kcu_unit⦎ (Compilation_Unit)
■

┌⦏SPARK_Prog⦎─────────────────
│	spark : seq K_Slot_Compilation_Unit
└─────────────────────────
=ENDDOC

ⓈZ
│	⦏Replacement⦎	::=	⦏replace_comp⦎ (seq Compilation_Unit)
│			|	⦏replace_ppart⦎ (Private_Part)
│			|	⦏replace_vpart⦎ (Visible_Part)
│			|	⦏replace_decl⦎ (Declarative_Part)
│			|	⦏refine_stat⦎ (seq Statement)
│			|	⦏replace_stat⦎ (seq Statement)
│			|	⦏replace_annotation⦎ (seq Annotation)
■
┌⦏REPL_ENV⦎─────────────────
│	repl_env : LABEL ⇸ Replacement
└─────────────────────────

Some of the ML types which help to implement the above are already available from \cite{ISS/HAT/DAZ/DTD502}.

For the branches of the data type for $Replacement$ we can use the $REPLACED\_BY\_XXX$ types  (which contain the label as well as the replacement, but that is no hardship).
In addition, we extend the replacement environment to allow for some error detection which is not catered for in the above Z.
When a k-slot is encountered an entry is made in the replacement environment indicating what sort of replacement is later to be expected for this object and giving the name of the {\Product} theory to be made current for type inference purposes when the replacement (or refinement) is made.

=SML
datatype ⦏REPL_SORT⦎		=	⦏RSCompilation⦎
				|	⦏RSPrivatePart⦎
				|	⦏RSVisiblePart⦎
				|	⦏RSDeclaration⦎
				|	⦏RSSpecStatement⦎
				|	⦏RSStatement⦎
				|	⦏RSAnnotation⦎;
=TEX
=SML
datatype ⦏REPLACEMENT⦎	=	⦏ReplaceComp⦎ of REPLACED_BY_COMP
				|	⦏ReplacePPart⦎ of REPLACED_BY_PRIVATE_PART
				|	⦏ReplaceVPart⦎ of REPLACED_BY_VISIBLE_PART
				|	⦏ReplaceDecl⦎ of REPLACED_BY_DECL
				|	⦏ReplaceStat⦎ of REPLACED_BY
				|	⦏ReplaceArbitrary⦎ of REPLACED_BY_ARBITRARY_ADA
				|	⦏RefineStat⦎ of REPLACED_BY
				|	⦏ReplaceAnnotation⦎ of REPLACED_BY_ANNOTATION
				|	⦏UnReplaced⦎ of (REPL_SORT * string);
=TEX
Replacments are tagged with the name of the immediately enclosing scope in order
to support deletion of deferred subprograms.
=SML
type ⦏SCOPED_REPLACEMENT⦎ = {
	scope_name : ID OPT list,
	repl : REPLACEMENT};
=TEX
=SML
type ⦏REPL_ENV⦎
=TYPESTRUCT
      = SCOPED_REPLACEMENT S_DICT;
=TEX
The SCOPE\_ENV maps a subprogram name (translated into Z) to a pair comprising
the name of the theory in which the body of the subprogram (or package) and a an indicator
of the state of a possibly deferred subprogram.
=SML
datatype ⦏DEFERRED_STATE⦎ =
		⦏DSNotDeferred⦎
	|	⦏DSPendingIntroduction⦎
	|	⦏DSIntroduced⦎;
type ⦏SCOPE_ENV⦎
=TYPESTRUCT
      = {
	theory : string,
	deferred : DEFERRED_STATE,
	body_labels : (DECLAB S_DICT * (LABEL * SPECLAB)) OPT} E_DICT;
=TEX
\section{STATE RECORD}\label{STATERECORD}
The state of the Compliance Notation Processing is recorded in the following type.
The Z Generator maintains a database of states one for each Compliance Notation script.
Here, in addition to the five environments required by the DRA specifications, we have the SPARK program and replacement environment discussed in section \ref{SPARKProgramEnvironment}, a slot for the name of the literate script being processed and the information needed to restore the environments if this script
is subsequently deleted.
=SML
type ⦏Z_GENERATOR_STATE⦎
=TYPESTRUCT
	= {
		pack_env : PACK_ENV,
		subunit_env : SUBUNIT_ENV,
		dec_env : DEC_ENV,
		spec_env : SPEC_ENV,
		blocks : ENV,
		repl_env : REPL_ENV,
		scope_env : SCOPE_ENV,
		spark_prog : SPARK_PROG,
		script_name : string,
		deletion_info : SUBUNIT_ENV		
	};
=TEX
\subsection{Browser VC Info Type}
=TEX
This is the type used to distinguish different cases of VC generation.
=SML
datatype ⦏VC_GEN_CONTEXT⦎  =
		VCG_refinement
	|	VCG_subprogram_body
	|	VCG_subprogram_spec
	|	VCG_subunit_spec
	|	VCG_package_init
	|	VCG_basic_declaration
	|	VCG_unknown
=TEX
The next two types are used to hand information relating to VCs as stored and
retrieved by Volume 1 functions to other parts.
=SML
type ⦏vc_clause_context⦎
=TYPESTRUCT
	= {
		w : ID list,
		pre : Z_PRED,
		post : Z_PRED,
		till : Z_PRED,
		return : Z_PRED,
		named_tills : ( ID * Z_PRED ) list
	  }
=SML
type ⦏vc_context_route⦎
=TYPESTRUCT
	= {	
		route : ROUTE OPT,
		blockids : ID list,
		context : vc_clause_context OPT,
		vcg_context : VC_GEN_CONTEXT
	};
=TEX
This is the type used in deconstructing routes.
=SML
datatype ⦏vc_route_arg⦎ = 	  VRA_unit of unit
			| VRA_rte of ROUTE 	
			| VRA_bool_rte  of bool * ROUTE
			| VRA_int_rte of int * ROUTE 	
			| VRA_str of string;
=TEX
\subsection{Evaluation Report Data Types}
A scope is the expanded name of a package, subprogram, block or loop
together with an indicator of the type of declarative region.
As a special case, we may have a ``context'' scope representing
what is in scope at the head of the declarative region.
Anonymous elements of the name are omitted:
e.g., "SUBPROG.BLOCK1..LOOP2." might be the name of
an anoymous block inside a named loop inside an anonymous loop.
=SML
datatype ⦏SCOPE_TYPE⦎ =
		⦏STSpec⦎
	|	⦏STBody⦎
	|	⦏STProc⦎
	|	⦏STFunc⦎
	|	⦏STBlock⦎
	|	⦏STContext⦎;
type ⦏SCOPE⦎ = {
	name : CNTypes.EXPANDED_NAME,
	scope_type : SCOPE_TYPE};
=TEX
Theories are classified as one of: HOL, Z, The theory ``cn'', CN context theory or CN scope theory (either a script theory or the theory for a subprogram, block or loop, or the corresponding context theory).
=SML
datatype ⦏EV_THEORY_TYPE⦎ =
		⦏ETTHol⦎
	|	⦏ETTZed⦎
	|	⦏ETTCn⦎
	|	⦏ETTScope⦎ of SCOPE;
=TEX
The information we associate with a theory is its name, its type (as above) and the lists of axioms, of proved and unproved VCs and of defining theorems that have not been proved consistent.
=SML
type ⦏EV_THEORY_INFO⦎ = {
	name : string,
	parents : string list,
	theory_type : EV_THEORY_TYPE,
	proved_vcs : (string * THM) list,
	unproved_vcs : (string * TERM) list,
	axioms : (string list * THM) list};
=TEX
The report data structure is essentially a forest whose trees are given by the following ML type.
We treat stubs and subunits differently from ordinary nested scopes: a stub corresponds to a leaf in the forest
containing a scope name that will appear as a root if the corresponding subunit is included in the report.
For a nested scope we have its name and type, the info for the scope theory and the context theory if any
and the infos for any descendant scopes.
(The scope attribute duplicates information that will also
be inside the type attribute of the scope theory, but that
is harmless and convenient.)
=SML
datatype ⦏EV_INNER_SCOPE_INFO⦎ =
		⦏EvNestedScope⦎ of EV_SCOPE_INFO
	|	⦏EvStub⦎ of string * SCOPE
withtype ⦏EV_SCOPE_INFO⦎  = {
	scope : SCOPE,
	scope_theory_info : EV_THEORY_INFO,
	context_theory_info : EV_THEORY_INFO OPT,
	scopes : EV_INNER_SCOPE_INFO list};
=TEX
The exception log is a dictionary mapping script names to
a list of strings, each string comprising an error or warning message.
=SML
type ⦏CN_EXCEPTION_LOG⦎ = string list S_DICT;
=TEX
Associated with a script we have the scope info
and the exception messages.
=SML
type ⦏EV_SCRIPT_INFO⦎ = {
	exceptions : string list,
	scope_info : EV_SCOPE_INFO};
=TEX
For a script theory we have the script info, for a theory associated with a scope we have the scope info, while for
other theories we have just the theory info.
=SML
datatype ⦏EV_INFO⦎ =
		⦏EIScriptInfo⦎ of EV_SCRIPT_INFO
	|	⦏EIScopeInfo⦎ of EV_SCOPE_INFO
	|	⦏EITheoryInfo⦎ of EV_THEORY_INFO;
=TEX
\section{EPILOGUE}
=SML
end; (* signature CNTypes1 *)
=TEX
\section{TEST POLICY}
There are no module tests for the design in this document since it specifies no functions.

\small
\twocolumn[\section{INDEX}]
\printindex

\end{document}




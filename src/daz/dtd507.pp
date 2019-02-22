=IGN
********************************************************************************
dtd507.doc: this file is part of the PPDaz system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  ℤ $Revision: 1.184 $ $RCSfile: dtd507.doc,v $ $Date: 2008/12/10 13:06:21 $
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

\def\Title{Detailed Design: Z Generator}

\def\AbstractText{This document contains the detailed design for the Compliance Notation Z Generation.}

\def\Reference{ISS/HAT/DAZ/DTD507}

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
%% LaTeX2e port: % TQtemplate.tex
%% LaTeX2e port: \documentstyle[hol1,11pt,TQ]{article}
%% LaTeX2e port: \ftlinepenalty=9999
\def\Hide#1{}
\def\Bool{``$\it{:}bool\,$''}
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{DAZ PROJECT}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Detailed Design: Z Generator}  %% Mandatory field
%% LaTeX2e port: \TPPref{ISS/HAT/DAZ/DTD507}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.184 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2008/12/10 13:06:21 $%
%% LaTeX2e port: }}
%% LaTeX2e port: %\TPPstatus{Approved}
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: %\TPPkeywords{SPARK}
%% LaTeX2e port: \TPPauthor{R.D.~Arthan&WIN01}
%% LaTeX2e port: \TPPauthorisation{D.J.~King & DAZ Team Leader}
%% LaTeX2e port: \TPPabstract{
%% LaTeX2e port: This document contains the detailed design for the
%% LaTeX2e port: Compliance Notation Z Generation.}
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

\subsection{Changes History}  % to get section number `0.3'
\begin{description}
\item[Issue 1.1 (1994/03/24)-1.21 (1994/09/20)] Initial drafts.
\item[Issue 1.22 (1994/09/21) (21th September 1994) ] Rework done according to deck-check report reference 0010 and checked by KB.
\item[Issues 1.22 (1994/09/21)-1.34 (1994/11/15)] Phase 3 rework.
\item[Issues 1.35 (1994/11/18)-1.43 (1994/12/18)] Fixed to the Z during type-checking.
\item[Issue 1.44 (1995/01/03)] Final version for issue.
\item[Issue 1.45 (1995/01/05)-1.47 (1995/03/31)] Bug fixes.
\item[Issue 1.48 (1995/10/10)] Enhancements 1, 5, 6, 7 and 20; bug fix 17 (batch 2).
\item[Issue 1.49 (1995/10/11)] Enhancement 10.
\item[Issue 1.50 (1995/10/24)] Issue for review.
\item[Issue 1.51 (1995/12/06)] Exposed $add\_type\_info$.
\item[Issue 1.52 (1995/12/14) (14th December 1995)] Changes according to desk check report 024.
\item[Issue 1.53 (1996/02/15)] Fixed bug 6 (V0.6).
\item[Issue 1.54 (1996/02/16)] New error message for resolution of issue 1 (V0.6).
\item[Issue 1.55 (1996/02/22)] Updated reference to DRA spec.
\item[Issue 1.56 (1997/04/11)] Added $new\_script1$ for IUCT project WP 1.
\item[Issue 1.57 (1997/05/29) - 1.58 (1997/05/30)] Changes for IUCT WP 7.
\item[Issue 1.59 (1997/06/03)-1.60 (1997/06/04)] Changes for IUCT WP 2.
\item[Issue 1.61 (1997/06/05)] Further changes for IUCT WP 7.
\item[Issue 1.62 (1997/06/11)-1.65 (1997/06/17)] Additional error messages.
\item[Issue 1.66 (1997/06/18)] IUCT WP 5.
\item[Issue 1.68 (1997/06/30)] IUCT WP 9.
\item[Issue 1.69 (1997/07/18)] Removed $pack\_spec\_with\_modules$ as per new spec.
\item[Issue 1.70 (1997/07/23)] Corrected Z syntax and type errors.
\item[Issue 1.71 (1997/07/29)] First round of syntax/type error correction for IUCT.
\item[Issue 1.72 (1997/08/08)] Typos.
\item[Issue 1.73 (1997/08/13)] Updated Z for HLD504 Appendix Material.
\item[Issue 1.74 (1997/08/18)] Updated references.
\item[Issue 1.75 (1997/08/19)] Tidying.
\item[Issue 1.76 (1999/02/25)] Update for SML97.
\item[Issue 1.77 (2000/05/17)] Enhancement R5 (initial variables in conditionals).
\item{Issue 1.78 (2000/10/17),1.79 (2000/10/17)} Brought {\it vcs\_body\_fun} and {\it add\_log\_con\_env}
into line with latest specifications.
\item[Issue 1.80 (2000/10/17)] CTLE II R1/3: reverse loops.
\item[Issue 1.81 (2000/10/24)] CTLE II R1/9: SPARK 83 attributes.
\item[Issue 1.82 (2000/10/25)] CTLE II R2/1: global variable unsoundness.
\item[Issue 1.83 (2000/10/26),1.84 (2000/10/27)] CTLE II R1/11: nested packages.
\item[Issue 1.85 (2000/10/30)] CTLE II R1/1: real types.
\item[Issue 1.86 (2000/12/21)] Fixes to Z spec of {\it update\_envs\_pack\_spec}.
\item[Issue 1.87 (2001/05/28)] Perfomance enhancement for type-checking of specification statements.
\item[Issue 1.88 (2001/09/15)] Fixed {\LaTeX} error.
\item[Issue 1.89 (2001/11/06)] Corrected out-of-date narrative about type-checking.
\item[Issue 1.90 (2001/12/12)] Removed local declarations for Poly/ML port.
\item[Issue 1.91 (2002/01/14)] Index brackets added.
\item[Issues 1.92 (2002/01/24), 1.93 (2002/01/26)] R0006: spec updates.
\item[Issue 1.94 (2002/01/29)] R0044: checks on array ranges.
\item[Issue 1.95 (2002/01/29)] Support for new SPARK output functions.
\item[Issue 1.96 (2002/02/14)] Applying specification changes from HLD508.
\item[Issue 1.97 (2002/02/15)] Fixing {\LaTeX} and other minor problems for SPC501.
\item[Issue 1.99 (2002/03/02)] R0065: duplicates in context clauses now allowed.
\item[Issue 1.100 (2002/05/02)] Spring 2002 enhancements: syntax changes for interim release.
\item[Issue 1.101 (2002/05/05)] Spring 2002 enhancements: Forward declarations for subprograms.
\item[Issue 1.101 (2002/05/05)--1.107 (2002/05/11)] Spring 2002 enhancements: renaming
\item[Issue 1.108 (2002/05/12), 1.109 (2002/05/14)] Spring 2002 enhancements: more on named loops.
\item[Issue 1.110 (2002/05/17)] Duplicate renamings and use clauses are now errors.
\item[Issue 1.111 (2002/05/17)] Fixed mismatched type.
\item[Issue 1.112 (2002/05/25)] Full syntax-check-only now implemented.
\item[Issue 1.113 (2002/05/31)] Changed signature of {\it renames\_proc\_common}.
\item[Issue 1.114 (2002/07/14)] More on renaming.
\item[Issue 1.115 (2002/07/15)] Exposed {\it current\_cn\_env} in the signature for diagnostic purposes.
\item[Issue 1.116 (2002/07/15)] New error message for revised treatment of renaming.
\item[Issue 1.117 (2002/07/24)] Error message for misplaced assertions.
\item[Issue 1.118 (2002/08/08), 1.119 (2002/08/08)] R0051: default parameters (new and modified error messages).
\item[Issue 1.120 (2002/10/14)] Merged in changes for R0062. Error messages for VC browser info get and set.
\item[Issue 1.121 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.122 (2002/10/17), 1.123 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.124 (2002/11/11)] Uniform treatment of block statements.
\item[Issue 1.125 (2002/11/18)--1.126 (2002/11/19)] Script deletion.
\item[Issue 1.127 (2002/11/25)] Schemas-as-declarations now catered for in output Z syntax.
\item[Issues 1.128 (2002/12/05), 1.129 (2002/12/07)] R0067: specification changes for schema references in $\Xi$-lists.
\item[Issues 1.130 (2002/12/08)--1.133 (2002/12/15)] R0066: specification changes for auxiliary variables in $\Xi$-lists.
\item[Issue 1.134 (2002/12/17)] Added exception logging.
\item[Issue 1.135 (2002/12/17)] New error messages for the rationalised error system.
\item[Issues 1.136 (2003/02/05), 1.137 (2003/02/06)] Updates to the Z specifications after GMP's preliminary review.
\item[Issue 1.138 (2003/05/27)] R0091: the implementation entailed a new internal error message.
\item[Issue 1.139 (2003/07/17)] Improved error messages for type-checking of specification statements.
\item[Issue 1.140 (2004/02/07)] The SPARK program is now referred to as the Ada program.
\item[Issues 1.141 (2004/06/20)-1.145 (2004/07/11)] Reform of the Environments.
\item[Issues 1.146 (2004/10/09)]  New error messages for using clauses
\item[Issue 1.147 (2004/10/25)] Renaming informal procedures no longer causes an error.
\item[Issue 1.148 (2004/10/26)] Adjustments for fix to informal procedure unsoundness problem.
\item[Issue 1.149 (2004/11/17)] New error message for case when an informal function clashes with \item[Issue 1.150 (2005/04/19)] Now exports {\em ti\_context\_of\_in\_scope} and {\em cn\_env\_of\_in\_scope}.
\item[Issue 1.151 (2005/05/10)] Added {\em create\_package\_spec\_theory}.
\item[Issue 1.152 (2005/09/13)] Enhanced error reports for free variables in specification statements.
\item[Issue 1.153 (2005/09/14)] Adjusted error reports after comments from QinetiQ.
\item[Issue 1.154 (2005/09/15)] VC soundness warnings for informal development steps.
\item[Issue 1.155 (2005/09/21)] Fixed problem with object renamings in package specifications.
\item[Issue 1.156 (2005/09/22)] Enhancement 115: support for implicitly declared subprograms.
\item[Issue 1.157 (2005/12/07)] Minor adjustments to error messages.
\item[Issue 1.158 (2005/12/07)] First clean compile for enhancement 117.
\item[Issue 1.159 (2006/01/16)] Debugging enhancement 117.
\item[Issue 1.160 (2006/03/17)] Beginnings of enhancement 118.
\item[Issue 1.161 (2006/03/17)] Automated state management.
\item[Issue 1.162 (2006/03/22)] Added message needed for testing enhancement 117.
\item[Issue 1.165 (2006/04/11)] Under enhancement 117, checks on use of names in Z are now given a uniform treatment.
\item[Issue 1.166 (2006/04/12)] Support for general expanded names.
\item[Issue 1.167 (2006/04/13)] Clarified error message 507137.
\item[Issue 1.168 (2006/05/31)] Signature changes to allow for rationalised data type for subunits.
\item[Issue 1.169 (2006/06/01)] Issue 139: ``1 theory per subprogram''.
\item[Issue 1.170 (2006/06/13)] Exposed string constants for use in the Z output function.
\item[Issue 1.171 (2006/06/14)] Added {\em get\_script\_theories}.
\item[Issue 1.172 (2006/07/21)] Removed {\em trans\_subunit\_name} from the ML signature (it can always go back if the specifications when revised for recent enhancements still need it).
\item[Issue 1.173 (2006/08/09)] Added error message for {\em new\_scope\_with}.
\item[Issue 1.174 (2006/09/16)] Added {\em open\_scope}.
\item[Issue 1.175 (2006/09/17)] Added support for deferred subprograms.
\item[Issue 1.176 (2006/09/19)] Change to parametrisation of {\em new\_script} etc.
\item[Issue 1.177 (2007/01/23)] The Z output module now gives the ML bindings for {\em cn\_subprog\_ud\_key} etc.
\item[Issue 1.178 (2007/05/18)] Allowed for rationalisation to abstract syntax of loops.
\item[Issue 1.179 (2007/05/20)] New error messages for enhancement 192 (theory per block).
\item[Issue 1.180 (2007/11/11)] New error messages and signature changes for deletion of deferred subprograms.
\item[Issue 1.181 (2008/02/24)] Improved error message 507143.
\item[Issue 1.182 (2008/03/23), 1.183 (2008/12/06)] Minor changes to support evaluation report generator development.
\item[Issue 1.184 (2008/12/10)] Added new error message for unexpected pattern matches.
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
This document contains the detailed design for the functions whose Z specification is given in \cite[Volume 1]{DRA/CIS/CSE3/TR/94/27/3.0}; it is called for in \cite{ISS/HAT/DAZ/HLD503}.
Sections \ref{BASICDECLARATIONS}-\ref{WEBCLAUSES} contain the design and correspond directly with sections 4-16 of the DRA specification.

\subsection{Introduction}
This document gives the structure (i.e., module) containing the functions defined \cite[Volume 1]{DRA/CIS/CSE3/TR/94/27/3.0}.
This covers the main semantic processing involved in the extraction of a Z document from a Compliance Notation script.
As usual it also includes a transcription into {\ProductZ} of the relevant parts of the DRA specification.

The overall effect of the processing defined here is to update the {\Product} theory database as if the Z document had been loaded into it and to update internal state representing the environments of  \cite[Volume 1]{DRA/CIS/CSE3/TR/94/27/3.0} as implemented in \cite{ISS/HAT/DAZ/DTD513}.
The internal state also includes additional information defined in \cite{ISS/HAT/DAZ/DTD513} and used to record the association of k-slot labels with SPARK program fragments.
This gives all the information required to reduce extraction of the Z document and of the SPARK program to straightforward pretty-printing tasks.



\subsubsection{Purpose and Background}
See \cite{ISS/HAT/DAZ/HLD503}.


\subsubsection{Dependencies}
See \cite{ISS/HAT/DAZ/HLD503}.
%\subsubsection{Possible Enhancements}
\subsubsection{Deficiencies}
None known.


\subsection{Compliance}
For the description of the Z in this document see \cite[Volume 1]{DRA/CIS/CSE3/TR/94/27/3.0}. Where the Z differs from that in \cite[Volume 1]{DRA/CIS/CSE3/TR/94/27/3.0}, justification has been provided.

In \cite[Volume 1]{DRA/CIS/CSE3/TR/94/27/3.0} where names contain double underscores, the implementation has chosen to use only single underscores (no ambiguity results from this).

In {\ProductZ}, subscripts are not decoration. In order to achieve the effect required by \cite[Volume 1]{DRA/CIS/CSE3/TR/94/27/3.0}, multiple priming has been used and generally, the number of primes in a decoration corresponds to the numeric value of the subscript in \cite[Volume 1]{DRA/CIS/CSE3/TR/94/27/3.0}.

In a number of places, the Z in \cite[Volume 1]{DRA/CIS/CSE3/TR/94/27/3.0} (and hence in this document) is recognised to be deficient. In specific cases, agreed with DRA, the implementation has been discussed and agreed, but the Z has not been brought into line with the implementation. Where this is the case, there is a note to draw attention to this fact.







\section{PREAMBLE}
\subsection{Preamble for Z Type-Checking}

The following initialises the theory database when performing a syntax and type check on the Z paragraphs in this document. (This preamble is not processed when building the compliance tool.)

=SMLZ
open_theory"dtd505";
push_pc "z_library";
force_delete_theory"dtd507" handle Fail _ => ();
val _ = set_flag ("z_type_check_only", true);
new_theory "dtd507";
new_parent "dtd513";
=TEX

\subsection{The Signature}
=DOC
signature ⦏CNZGenerator⦎ = sig
=DESCRIBE
=ENDDOC
As with other signatures, the following would be local declarations
rather than includes if that were allowed.
=SML
include	(* CNTypes CNTypes2 CNBasicDeclsAndExprs *) CNTypes1;
(*	ZParagraphs ZUserInterfaceSupport; *)
=TEX
\section{TYPE-CHECKING}
Type-checking the Z that occurs in specification statements is a somewhat
thorny problem, since some care has to be taken to ensure that
the current theory and the type inference context are appropriate.

At DERA's request, the implementation endeavours to type-check every
Z fragment as soon as it is processed by the Z Generator. Unfortunately,
a simple implementation of this following the structure of the formal
specification of the tool causes each Z fragment to be type-checked
several times. This inefficiency has proved to be very significant
in actual examples.

The checking is most safely done by simulating a call
to the VC generator. To improve performance, the function {\it vcs}
that is the entry point to the VC generator returns a type-checked
specification statement in addition to the VCs. The Z Generator
is then able to store the type-checked specification statement in
its data structures and so avoid repeated type-checking.

In the current implementation, the performance enhancement has
been implemented for specification statements and logical
constant statements as statements but not for other uses of
specification statements. To facilitate future improvements,
the type-checked specification statement is propagated up
the calling tree until it can either be stored for future
reference or until the logic of the formal specification
makes it difficult to pass the value up.

The following SID functions now return a type-checked specification
statement for the caller's benefit:

\begin{tabular}{l}
{\it form\_proc\_pack\_body}\\
{\it form\_proc\_pack\_body\_aux}\\
{\it k\_slot\_stmt}\\
{\it vcs\_aux\_initial}\\
{\it vcs\_body\_proc}\\
{\it vcs\_body\_fun}\\
{\it vcs\_speclabel}
\end{tabular}

The following functions are the ones that are forced to discard a type-checked
specification statement passed up by a supporting function. (I.e., these
are the candidates for future performance enhancements).

\begin{tabular}{l}
{\it form\_proc\_subunit}\\
{\it check\_stub\_spec\_proc}\\
{\it form\_proc}\\
{\it form\_fun\_pack\_body}\\
{\it form\_fun\_subunit}\\
{\it vcs\_body}\\
{\it do\_proper\_body}
\end{tabular}

=TEX
\section{BASIC DECLARATIONS}\label{BASICDECLARATIONS}
\subsection{The SID Function basic\_declaration}
┌⦏BASIC_DEC⦎─────────────────────
│	basic_decl : SI_BASIC_DECL
└────────────────────────────
=DOC
val ⦏basic_decl_pack_spec⦎ : BASIC_DECL -> unit;
=DESCRIBE
┌⦏basic_decl_pack_spec⦎──────────────
│	ΔPACK_ENV;
│	ΔZ_DOC;
│	BASIC_DEC;
│	ENV;
│	Package;
│	Block'
├───────────────
│	pack_spec_flag' = True;
│	θBlock' = blocks 1;
│	pack_env block_name' = θPackage;
│	∃adjusted_decls : seq BASIC_DECL ⦁
│		pack_env' =
│		pack_env ⊕
│		{ block_name' ↦
│			Package_consts_types(θPackage, consts_types ⁀ adjusted_decls)} ∧
│		z' = z ⁀ (trans_basic_decl o adjusted_decls)
└───────────────────────────
=ENDDOC
=DOC
val ⦏basic_decl_otherwise⦎ : BASIC_DECL -> unit;
=DESCRIBE
┌⦏basic_decl_otherwise⦎──────────────
│	ΔZ_DOC;
│	BASIC_DEC;
│	ENV;
│	Block'
├───────────────
│	pack_spec_flag' = False;
│	θBlock' = blocks 1;
│	z' = z ⁀ (trans_basic_decl o adjust_basic_decl(basic_decl))
└───────────────────────────
=FAILURE
507041	Unsupported language feature encountered in a basic declaration
=ENDDOC
=DOC
val ⦏basic_declaration⦎ : BASIC_DECL -> unit;
=DESCRIBE
ⓈZ
│	⦏basic_declaration⦎ ≜ basic_decl_pack_spec ∨ basic_decl_otherwise
■
=FAILURE
507001	Internal error: running environment contains a non-existent
	package name (?0)
=ENDDOC
\subsection{The SID Function var\_pack\_spec}
=DOC
val ⦏var_pack_spec⦎ : VAR_DECL -> unit;
=DESCRIBE
In the implementation, variable declarations contain lists of identifiers, rather than single identifiers (i.e., they are as in the concrete syntax rather than the Z abstract syntax).
We therefore only deal with a single $VAR\_DECL$ here.
┌⦏var_pack_spec⦎──────────────
│	ΔPACK_ENV;
│	VAR_DECL;
│	ENV;
│	Package;
│	Block'
├───────────────
│	pack_spec_flag' = True;
│	θBlock' = blocks 1;
│	pack_env block_name' = θPackage;
│	pack_env' =
│	pack_env ⊕
│	{ block_name' ↦
│		Package_vc_vars(θPackage, vc_vars ∪ vars) }
└───────────────────────────
=FAILURE
507001	Internal error: running environment contains a non-existent
	package name
=ENDDOC
\subsection{The SID Function update\_envs\_var}
=DOC
val ⦏update_subunit_env_var⦎ : PREFIX_INFO -> VAR_DECL -> unit;
=DESCRIBE
┌⦏update_subunit_env_var⦎──────────────
│	ΔSUBUNIT_ENV;
│	ENV;
│	VAR_DECL;
│	Block'
├───────────────
│	declabel_flag' = True;
│	θBlock' = blocks 1;
│	#subunit_env = #subunit_env';
│	∀id⋎1, id⋎2 : ID; s, s' : Subunit |
│		subunit_env(id⋎1, id⋎2) = s ∧ subunit_env'(id⋎1, id⋎2) = s' ⦁
│		dec_lab' ∈ s.dec_labels ∧
│		s' = Subunit_vc_vars(s, s.vc_vars ∪ vars) ∨
│		dec_lab' ∉ s.dec_labels ∧ s' = s
└───────────────────────────
=FAILURE
507001	Internal error: running environment contains a non-existent
	package name
=ENDDOC
=DOC
val ⦏update_dec_env_var⦎ : PREFIX_INFO * bool -> VAR_DECL -> unit;
=DESCRIBE
┌⦏update_dec_env_var⦎──────────────
│	ΔDEC_ENV;
│	ENV;
│	VAR_DECL;
│	Block'
├───────────────
│	declabel_flag' = True;
│	θBlock' = blocks 1;
│	#dec_env = #dec_env';
│	∀dec_label : LABEL; d, d' : Declab |
│		dec_env dec_label = d ∧ dec_env' dec_label = d'⦁
│		dec_lab' ∈ d.dec_labels ∧
│		d' = Declab_vc_vars(d, d.vc_vars ∪ vars) ∨
│		dec_lab' ∉ d.dec_labels ∧ d' = d
└───────────────────────────
=FAILURE
507001	Internal error: running environment contains a non-existent
	package name
=ENDDOC
=DOC
val ⦏update_spec_env_var⦎ : PREFIX_INFO -> VAR_DECL -> unit;
=DESCRIBE
┌⦏update_spec_env_var⦎──────────────
│	ΔSPEC_ENV;
│	ENV;
│	VAR_DECL;
│	Block'
├───────────────
│	declabel_flag' = True;
│	θBlock' = blocks 1;
│	#spec_env = #spec_env';
│	∀spec_label : LABEL; s, s' : Speclab |
│		spec_env spec_label = s ∧ spec_env' spec_label = s'⦁
│		dec_lab' ∈ s.dec_labels ∧
│		s' = Speclab_w
│		(Speclab_vc_vars(s, s.vc_vars ∪ vars),
│		s.w ∪ {v : vars⦁ trans_id v.var}) ∨
│		dec_lab' ∉ s.dec_labels ∧ s' = s
└───────────────────────────
=FAILURE
507001	Internal error: running environment contains a non-existent
	package name
=ENDDOC
=DOC
val ⦏update_envs_var⦎ : VAR_DECL -> unit;
=DESCRIBE
ⓈZ
│		⦏update_envs_var⦎
│	≜	update_subunit_env_var
│	∧	update_dec_env_var
│	∧	update_spec_env_var
■
=FAILURE
507001	Internal error: running environment contains a non-existent
	package name
=ENDDOC
\subsection{The SID Function add\_var\_env}
=DOC
val ⦏add_var_env⦎ : VAR_DECL -> unit;
=DESCRIBE
┌⦏add_var_env⦎──────────────
│	ΔENV;
│	VAR_DECL;
│	Block'
├───────────────
│	θBlock' = blocks 1;
│	blocks' = blocks ⊕ {1 ↦ Block_vc_vars(blocks 1, vc_vars' ∪ vars)}
└───────────────────────────
=ENDDOC
\subsection{The SID Function add\_var\_init\_env}
=DOC
val ⦏add_var_init_env⦎ : (VAR_DECL * EXP) -> unit;
=DESCRIBE
┌⦏add_var_init_env⦎──────────────
│ ΔENV;
│ VAR_DECL;
│ Block'
├──────
│ θBlock' = blocks 1;
│ init = no_init ∧
│ blocks' = blocks ∨
│ (∃e: EXP⦁ init=init_val e ∧
│   blocks' = blocks ⊕ {1 ↦
│              Block_var_inits
│		(blocks 1, var_inits' ∪ {v: vars⦁v.var ↦ (e, v.tmark)})})
└───────────────────────────
=FAILURE
507043	Attempting to give variable initialisation for ?0 when it is already initialised
=ENDDOC
\subsection{The SID Function adj\_var\_decl}
This SID function is implemented implicitly via direct use
of {\it adjust\_var\_decl}.
┌⦏adj_var_decl⦎──
│ ΔPACK_ENV;
│ ΔZ_DOC;
│ ENV;
│ Package;
│ Block';
│ SI_VAR_DECL;
│ VAR_DECL;
│ od : OPT[SI_BASIC_DECL]
├
│ adjust_var_decl(θ SI_VAR_DECL) = (od,θVAR_DECL) ∧
│ ( (od = Nil ∧ ΞPACK_ENV ∧ ΞZ_DOC)
│   ∨
│   ( ∃ BASIC_DEC ⦁ od = Value basic_decl ∧ basic_declaration )
│ )
└──
\section{DECLARATIONS}\label{DECLARATIONS}
\subsection{The SID function k\_slot\_dec}
┌⦏LAB⦎────────────
│	label : LABEL
└──────────────
ⓈZAX
│	⦏no_label⦎ : LABEL
■
ⓈZ
fun 6 _⦏dot⦎_
■
ⓈZAX
│	_⦏dot⦎_: (ID × ID) → ID
■
=DOC
val ⦏k_slot_dec⦎ : LABEL -> unit;
=DESCRIBE
┌⦏k_slot_dec⦎──────────────
│	ΔDEC_ENV;
│	ΔENV;
│	LAB;
│	ENV;
│	Declab;
│	Block';
│	Block''
├───────────────
│	θBlock' = blocks 1;
│	θBlock'' = blocks 2;
│	dec_env' = dec_env ∪ {label ↦ θDeclab};
│	subunit_flag'' = True ∧ block_name = block_name'' dot block_name' ∨
│	subunit_flag'' = False ∧ block_name = block_name';
│	θFlags = θFlags';
│	θIn_Scope = flatten_env(θENV);
│	blocks' =
│	blocks ⊕ {1 ↦ Block_dec_labels (blocks 1, dec_labels' ∪ {label})}
└───────────────────────────
Note: As agreed with DRA, $ENV$ should be $ΔENV$ and the $blocks'$ component is also updated. (See Implementation.)
=FAILURE
507006	Internal error: running environment stack unexpectedly empty
507010	?0 is already in use as a declaration label
=ENDDOC
\subsection{The SID function update\_envs\_k\_slot}
=DOC
(* local function ⦏update_subunit_env_k_slot⦎ *)
=DESCRIBE
┌ ⦏update_subunit_env_k_slot⦎──────────────
│	ΔSUBUNIT_ENV;
│	ENV;
│	LAB;
│	Block'
├───────────────
│	declabel_flag' = True;
│	θBlock' = blocks 1;
│	#subunit_env = #subunit_env';
│	∀id⋎1, id⋎2 : ID; s, s' : Subunit |
│		subunit_env(id⋎1, id⋎2) = s ∧ subunit_env'(id⋎1, id⋎2) = s' ⦁
│		dec_lab' ∈ s.dec_labels ∧
│		s' = Subunit_dec_labels(s, s.dec_labels ∪ {label}) ∨
│		dec_lab' ∉ s.dec_labels ∧ s' = s
└───────────────────────────
=ENDDOC
=DOC
(* local function ⦏update_dec_env_k_slot⦎ *)
=DESCRIBE
┌ ⦏update_dec_env_k_slot⦎──────────────
│	ΔDEC_ENV;
│	LAB;
│	ENV;
│	Block'
├───────────────
│	declabel_flag' = True;
│	θBlock' = blocks 1;
│	#dec_env = #dec_env';
│	∀dec_label : LABEL; d, d' : Declab |
│		dec_env dec_label = d ∧ dec_env' dec_label = d'⦁
│		dec_lab' ∈ d.dec_labels ∧
│		d' = Declab_dec_labels(d, d.dec_labels ∪ {label}) ∨
│		dec_lab' ∉ d.dec_labels ∧ d' = d
└───────────────────────────
=ENDDOC
=DOC
(* local function ⦏update_spec_env_k_slot⦎ *)
=DESCRIBE
┌ ⦏update_spec_env_k_slot⦎──────────────
│	ΔSPEC_ENV;
│	ENV;
│	LAB;
│	Block'
├───────────────
│	declabel_flag' = True;
│	θBlock' = blocks 1;
│	#spec_env = #spec_env';
│	∀spec_label : LABEL; s, s' : Speclab |
│		spec_env spec_label = s ∧ spec_env' spec_label = s'⦁
│		dec_lab' ∈ s.dec_labels ∧
│		s' = Speclab_dec_labels(s, s.dec_labels ∪ {label}) ∨
│		dec_lab' ∉ s.dec_labels ∧ s' = s
└───────────────────────────
=ENDDOC
=DOC
val ⦏update_envs_k_slot⦎ : LABEL -> unit;
=DESCRIBE
ⓈZ
│		⦏update_envs_k_slot⦎
│	≜	update_subunit_env_k_slot
│	∧	update_dec_env_k_slot
│	∧	update_spec_env_k_slot
■
=ENDDOC
\section{STATEMENTS}\label{STATEMENTS}
\subsection{The SID function spec\_stmt}
┌⦏SPEC_STMT⦎────────────
│	specification : Spec
└──────────────
┌⦏spec_stmt_common⦎──────────────
│	ΔSPEC_ENV;
│	SPEC_STMT;
│	LAB;
│	ENV;
│	Speclab;
│	Block';
│	named_tills' : ID → Z_PRED
├───────────────
│	θBlock' = blocks 1;
│	spec_env' = spec_env ∪ {label ↦ θSpeclab};
│	θSpec = specification;
│	formal_body_flag = formal_body_flag';
│	till_flag = till_flag';
│	(∃n:ID⦁ current_loop_name' = Value n ∧ till_flag' = True ∧ named_tills' = {n ↦ till'}) ∨
│	(till_flag' = False ∨ current_loop_name' = Nil) ∧ named_tills' = ∅;
│	till = till'
└───────────────────────────
=DOC
val ⦏spec_stmt_speclabel⦎ : {spec :SPEC, label : LABEL} -> unit;
=DESCRIBE
┌⦏spec_stmt_speclabel⦎──────────────
│	spec_stmt_common;
│	Speclab''
├───────────────
│	speclabel_flag' = True;
│	θSpeclab'' = spec_env spec_lab';
│	formal_body_flag = formal_body_flag'';
│	fun_flag = fun_flag'';
│	fun_header = fun_header'';
│	named_tills = named_tills' ∪ named_tills'';
│	return = return'';
│	vc_vars = vc_vars'';
│	vc_pars = vc_pars'' ∪ (flatten_env(θENV)).vc_pars;
│	vc_log_cons = vc_log_cons'' ∪ vc_log_cons';
│	vc_aux_vars = vc_aux_vars'';
│	formal_procs = formal_procs'';
│	dec_labels = dec_labels''
└───────────────────────────
=FAILURE
507014	specification label ?0 has not been introduced
507015	label ?0 has already been introduced
507033	badly formed logical constant encountered
=ENDDOC
=DOC
val ⦏spec_stmt_otherwise⦎ : {spec : SPEC, label : LABEL} -> unit;
=DESCRIBE
┌⦏spec_stmt_otherwise⦎──────────────
│	spec_stmt_common;
│	Formal_Fun'
├───────────────
│	speclabel_flag' = False;
│	formal_body_flag = formal_body_flag';
│	fun_flag = fun_flag';
│	current_formal_fun' = θFormal_Fun';
│	fun_header = θInformal_Fun';
│	named_tills = named_tills';
│	return =post';
│	θIn_Scope = flatten_env(θENV)
└───────────────────────────
ⓈZ
│	⦏spec_stmt⦎ ≜ spec_stmt_speclabel ∨ spec_stmt_otherwise
■
=FAILURE
507015	label ?0 has already been introduced
=ENDDOC
\subsection{The SID function k\_slot\_stmt}
=DOC
val ⦏k_slot_stmt⦎ : LABEL -> SPEC;
=DESCRIBE
ⓈZ
│	⦏k_slot_stmt⦎ ≜ spec_stmt
■
=FAILURE
507015	label ?0 has already been introduced
=ENDDOC
\subsection{The SID function add\_log\_con\_env}
┌⦏LOGICAL_CON⦎─────────
│	logical_con : ℙZ_Decl
└────────────────
=DOC
val ⦏add_log_con_env⦎ : LOG_CON_DEF list -> unit;
=DESCRIBE
┌⦏add_log_con_env⦎───────────
│	ΔENV;
│	LOGICAL_CON
├───────
│	blocks' = blocks ⊕ {1 ↦ Block_vc_log_cons(blocks 1, logical_con)}
└─────────────────────────
Note: As agreed with DRA, this specification is insufficient. See implementation.
=FAILURE
507032	Declaration of ?0 has already been introduced
=ENDDOC
\subsection{The SID function remove\_log\_con\_env}
=DOC
val ⦏remove_log_con_env⦎ : unit -> unit;
=DESCRIBE
┌⦏remove_log_con_env⦎───────────
│	ΔENV
├───────
│	blocks' = blocks ⊕ {1 ↦ Block_vc_log_cons(blocks 1, {})}
└─────────────────────────
=ENDDOC
\subsection{The SID function new\_block}
=TEX
=DOC
	val ⦏new_scope_block⦎ : LOOP_OR_BLOCK_NAME -> unit;
=DESCRIBE
┌⦏new_scope_block⦎────────
│	ΔENV;
│	ΔBlock
├───────────────
│	θBlock = blocks 1;
│	θBlock' = Block_body_flag (θBlock, True);
│	blocks' = ⟨θ Block⟩ ⁀ blocks;
└─────────────────
=ENDDOC
\subsection{The SID function update\_spec\_env\_block}
=TEX
=DOC
	val ⦏update_spec_env_block⦎ : unit -> unit;
=DESCRIBE
┌⦏update_spec_env_block⦎────────
│	ΔSPEC_ENV;
│	ENV;
│	Block'; Block'';
│	ΔSpeclab'''
├───────────────
│	θBlock' = blocks 1;
│	θBlock'' = blocks 2;
│	θSpeclab''' = spec_env spec_lab';
│	w'''' = w''' ∪ {v : vc_vars' ⦁ trans_id v.var};
│	Pre'''' = z_many_and({Pre'''} ∪
│	⋃ {v : dom var_inits'; ze : Z_EXP; tm : TMARK
│	 | ze = trans_exp(first(var_inits' v)) ∧ tm = second(var_inits' v)⦁
│		{z_eq(zid(trans_id v), slide_to_tmark(ze, tm))} ∪ domain_conds ze});
│	θIn_Scope'''' = merge_in_scopes (θIn_Scope''', θIn_Scope');
│	θSpeclab'''' = Speclab_in_scope(
│			Speclab_w(Speclab_pre (θSpeclab''', Pre''''), w''''),
│			θIn_Scope'''');
│	spec_env' = spec_env ⊕ {spec_lab' ↦ θSpeclab''''}
└─────────────────
=ENDDOC
\section{LOOPS}\label{LOOPS}
\subsection{The SID function new\_scope\_loop}
=DOC
	val ⦏new_scope_loop⦎ : LOOP_OR_BLOCK_NAME -> unit;
=DESCRIBE
┌ ⦏LOOP_NAME⦎ ───────────
│ loop_name : OPT[ID]
└──────────────

┌⦏new_scope_loop⦎────────
│	ΔENV;
│	Empty_Block;
│	LOOP_NAME;
│	Block'
├───────────────
│	blocks' = ⟨θ Block⟩ ⁀ blocks;
│	θBlock' = blocks 1;
│	pack_spec_flag = stub_flag = subunit_flag =
│		declabel_flag = till_flag = body_flag = False;
│	formal_body_flag = formal_body_flag';
│	fun_flag = fun_flag';
│	speclabel_flag = speclabel_flag';
│	current_formal_proc = current_formal_proc';
│	current_formal_fun = current_formal_fun';
│	current_loop_name = loop_name;
│	spec_lab = spec_lab'
└─────────────────
=ENDDOC

\subsection{The SID function end\_scope}

=DOC
val ⦏end_scope⦎ : unit -> unit;
=DESCRIBE
┌⦏end_scope⦎───────────
│	ΔENV
├───────
│	blocks' = tail blocks
└─────────────────────────
=FAILURE
507006	Internal error: running environment stack unexpectedly empty
=ENDDOC
\subsection{The SID function for\_param}
┌⦏FOR_PARAM⦎───────────
│	Param_Spec
├───────
│	mode = inn
└─────────────────────────
=DOC
	val ⦏for_param⦎ : ID * TMARK -> unit;
=DESCRIBE
┌⦏for_param⦎─────────────
│	ΔENV;
│	FOR_PARAM
├───────────────
│	blocks' = blocks ⊕ {1 ↦ Block_vc_pars(blocks 1, {θParam_Spec})}
└─────────────────
Note: As agreed with DRA, this specification is insufficient. See implementation.
=ENDDOC
\subsection{The SID function till\_pred}
┌⦏TILL_PRED⦎───────────
│	till : Z_PRED
└─────────────────────────
=DOC
	val ⦏till_pred⦎ : ZUserInterfaceSupport.Z_TM -> unit;
=DESCRIBE
┌⦏till_pred⦎─────────────
│	ΔENV;
│	TILL_PRED
├───────────────
│	blocks' = blocks ⊕ {1 ↦ Block_till(Block_till_flag(blocks 1, True), till)}
└─────────────────
=ENDDOC

\section{SUBPROGRAM DECLARATIONS}\label{SUBPROGRAMDECLARATIONS}
The SID function $end\_scope$ used in processing these has already been defined in section \ref{LOOPS}.
\section{PROCEDURES}\label{PROCEDURES}
\subsection{The SID function subunit\_form}
┌⦏IDENT⦎─────────────────────
│	ident : ID
└────────────────────────────
=DOC
	val ⦏subunit_form⦎ : ID -> unit;
=DESCRIBE
┌⦏subunit_form⦎────────
│	ΔZ_DOC;
│	ΔENV;
│	Z_PARENTS;
│	SUBUNIT_ENV;
│	IDENT;
│	ΔBlock;
│	Subunit''
├───────────────
│	subunit_flag = True;
│	θBlock = head blocks;
│	blocks' = blocks ⊕ {1 ↦ θBlock'};
│	parents = {zmod''.mod_name};
│	z' = z ⁀ ⟨z_parents(θZ_PARENTS)⟩;
│	θSubunit'' = subunit_env(block_name, ident);
│	block_name' = block_name;
│	θFlags' = θFlags;
│	θIn_Scope' = θIn_Scope''
└─────────────────
=FAILURE
507011	A unit ?0 containing subunit ?1 has not been introduced
=ENDDOC
\subsection{The SID function subunit\_inf}
=DOC
	val ⦏subunit_inf⦎ : ID -> unit;
=DESCRIBE
┌⦏subunit_inf⦎────────
│	ΔSUBUNIT_ENV;
│	subunit_form
├───────────────
│	subunit_env' = {(block_name, ident)} ⩤ subunit_env
└─────────────────
=FAILURE
507011	A subunit ?0 containing ?1 has not been introduced
=ENDDOC
\subsection{The SID function new\_scope\_proc\_inf}
=DOC
	val ⦏new_scope_proc_inf⦎ : ID -> unit;
=DESCRIBE
┌⦏new_scope_proc_inf⦎────────
│	ΔENV;
│	IDENT;
│	Empty_Block
├───────────────
│	blocks' = ⟨θ Block⟩ ⁀ blocks;
│	block_name = ident;
│	pack_spec_flag = pack_body_flag = stub_flag = subunit_flag =
│	formal_body_flag = fun_flag = declabel_flag = speclabel_flag =
│	till_flag = body_flag = False
└─────────────────
=ENDDOC
\subsection{The SID function new\_scope\_proc\_form}
=DOC
	val ⦏new_scope_proc_form⦎ : ID -> unit;
=DESCRIBE
┌⦏new_scope_proc_form⦎────────
│	ΔENV;
│	IDENT;
│	Empty_Block
├───────────────
│	blocks' = ⟨θ Block⟩ ⁀ blocks;
│	block_name = ident;
│	formal_body_flag = True;
│	pack_spec_flag = pack_body_flag = stub_flag = subunit_flag =
│	fun_flag = declabel_flag = speclabel_flag = till_flag = body_flag = False
└─────────────────
=ENDDOC
\subsection{The SID function stub}
ⓈZAX
│	⦏make_module⦎ : Z_ID × seq Z_PARA → seq Z_PARA
■
ⓈZAX
│	⦏trans_subunit_name⦎ : ID × ID → Z_ID
■
=DOC
val ⦏make_module⦎ : int -> string -> Z_ID -> unit;
val ⦏stub⦎ : unit -> unit;
val ⦏get_script_theories⦎ : string -> string list;
=DESCRIBE
┌⦏stub⦎──────────────
│	ΔSUBUNIT_ENV;
│	ΔZ_DOC;
│	ENV;
│	Subunit;
│	id1, id2 : ID;
│	Block';
│	Block'';
│	Block'''
├───────────────
│	stub_flag'' = True;
│	θBlock' = blocks 1;
│	θBlock'' = blocks 2;
│	θBlock''' = blocks 3;
│ 	∃mod_name : Z_ID⦁
│		mod_name = trans_subunit_name(id1, id2) ∧
│		z' = make_module(mod_name, z) ⁀ z ∧
│ 		zmod = θZ_MODULE;
│	subunit_env' = subunit_env  ∪ {(id1, id2) ↦ θSubunit};
│		subunit_flag''' = True ∧ id1 = block_name''' dot block_name''
│	∨	subunit_flag''' = False ∧ id1 = block_name'';
│	id2 = block_name';
│	specif_flag = False;
│	θIn_Scope = flatten_env(θENV)
└───────────────────────────
The extra parameters to {\em make\_module} are for error reporting.
=FAILURE
507013	A stub called ?0 has already been introduced
507140	The Compliance Notation theory information is corrupt
	(there is an infinite cycle through theory ?0)
507141	The theory ?0 is not a Compliance Notation script theory
=ENDDOC
\subsection{The SID function stub\_spec\_proc}
┌⦏FORM_PROC⦎─────────────────────
│	Formal_Proc
└────────────────────────────
=DOC
val ⦏stub_spec_proc⦎ : FORMAL_PROC -> unit;
=DESCRIBE
┌⦏stub_spec_proc⦎──────────────
│	ΔSUBUNIT_ENV;
│	ENV;
│	FORM_PROC;
│	ΔSubunit;
│	id⋎1, id⋎2 : ID;
│	Block';
│	Block'';
│	Block'''
├───────────────
│	stub_flag'' = True;
│	θBlock' = blocks 1;
│	θBlock'' = blocks 2;
│	θBlock''' = blocks 3;
│	subunit_env(id⋎1, id⋎2) = θSubunit;
│	subunit_env' = subunit_env ⊕ {(id⋎1, id⋎2) ↦ θSubunit'};
│		subunit_flag''' = True ∧ id⋎1 = block_name''' dot block_name''
│	∨	subunit_flag''' = False ∧ id⋎1 = block_name'';
│	id⋎2 = block_name';
│	specif_flag' = True;
│	specif' = θSpec;
│	zmod' = zmod;
│	globs' = globals;
│	θIn_Scope' = subprog_flatten_env(θENV)
└───────────────────────────
=FAILURE
507011	A subunit ?0 containing ?1 has not been introduced
=ENDDOC
\subsection{The SID function form\_proc}
=DOC
val ⦏form_proc_pack_spec⦎ : FORMAL_PROC -> unit;
=DESCRIBE
┌⦏form_proc_pack_spec⦎──────────────
│	ΔPACK_ENV;
│	FORM_PROC;
│	ENV;
│	Package;
│	Block''
├───────────────
│	pack_spec_flag'' = True;
│	θBlock'' = blocks 2;
│	pack_env block_name'' = θPackage;
│	pack_env' =
│	pack_env ⊕
│	{block_name'' ↦
│		Package_formal_procs(θPackage, formal_procs ∪ {θFormal_Proc})}
└───────────────────────────
=FAILURE
507012	Internal error: entry for ?0 missing from package environment
507076	Internal error: data structure for formal procedure is invalid
=ENDDOC
=DOC
val ⦏form_proc_pack_body_common⦎ : bool -> FORMAL_PROC ->
			(BLOCK * FORMAL_PROC * PACKAGE * SPECLAB * ID list) OPT
=DESCRIBE
┌ ⦏form_proc_pack_body_common⦎──────────
│	ΔZ_DOC; PACK_ENV; FORM_PROC; ENV;
│	Package'''';
│	Speclab''''';
│	Formal_Proc''';
│	Block';
│	Block'';
│	st : Statement;
│	pack_body_vars : ℙ Var_Decl
├───────────────
│	pack_body_flag'' = True;
│	θBlock' = blocks 1;
│	θBlock'' = blocks 2;
│	θPackage'''' = pack_env block_name'';
│	block_name' ∈ {p : formal_procs'''' ⦁ p.name};
│	z' = z ⁀ ⟨z_vcs(vcs(θSpeclab''''', st))⟩;
│	θFormal_Proc''' ∈ formal_procs''''; name''' = block_name';
│	fun_flag''''' = False;
│	vc_pars''''' = vc_pars'; vc_log_cons''''' = {};
│	vc_aux_vars''''' = (subprog_flatten_env(θENV)).vc_aux_vars \ aux_vars'''';
│	expand_schema_sigs (ran globals) \ w ⊆ expand_schema_sigs (ran globals''');
│	pack_body_vars = vc_vars'' \ vc_vars'''';
│	(		(st = spec_no_ivars(θSpec))
│		∨	(st = spec_ivars(θSpec))
│	)
└───────────────────────────
=FAILURE
507012	Internal error: entry for ?0 missing from package environment
507058	When a procedure is implemented, each variable in the list of global dependencies
	must be in the frame or global dependencies in the specification.
	?0 is not contained in ?1 in the specification of ?2
=ENDDOC
=DOC
val ⦏form_proc_pack_body⦎ :
	(BLOCK * FORMAL_PROC * PACKAGE * SPECLAB * ID list) ->FORMAL_PROC ->
		SPEC;
=DESCRIBE
┌ ⦏form_proc_pack_body⦎──────────────
│	form_proc_pack_body_common
├───────────────
│	(w'''  ∪ expand_schema_sigs(ran globals''')) ∩ {a : aux_vars'''' ⦁ (Value↗~↕) a.zvar} = ∅;
│	w''''' = w''' ∪ {v : pack_body_vars ⦁ trans_id v.var};
│	Pre''''' = Pre''';
│	post''''' = post''';
│	vc_vars''''' = (flatten_env(θENV)).vc_vars
└───────────────────────────
=FAILURE
507012	Internal error: entry for ?0 missing from package environment
=ENDDOC
=DOC
val ⦏form_proc_pack_body_aux⦎ :
	(BLOCK * FORMAL_PROC * PACKAGE * SPECLAB * ID list) ->
	TERM list -> FORMAL_PROC -> SPEC;
=DESCRIBE
┌  ⦏form_proc_pack_body_aux⦎──────────────
│	form_proc_pack_body_common;
│	ENV;
│	aux_vars, aux_vars0 : ℙ Z_Decl;
│	conc_vars : ℙ Var_Decl;
│	invs : ℙ Z_PRED;
│	Spec'''''';
│	frame_aux_conc, frame_aux_conc0, add_aux, add_aux0 : ℙ Z_ID;
│	seq_aux : seq Z_Decl
├───────────────
│	(w'''  ∪ expand_schema_sigs(ran globals''')) ∩ {a : aux_vars'''' ⦁ (Value↗~↕) a.zvar} ≠ ∅;
│	add_aux = {a : aux_vars'''' ⦁ (Value↗~↕) a.zvar} \ w''';
│	w'''''' = w''' ∪ add_aux;
│	Pre'''''' = Pre''';
│	post'''''' =
│	z_many_and ({post'''} ∪
│	  {a : add_aux ⦁ z_eq(zid a, subs_exp(zid a, add_aux, add_aux0))});
│	aux_vars = {a : aux_vars'''' | (Value↗~↕) a.zvar ∈ w''''''};
│	conc_vars = ⋃ {x : using_decs'' ⦇ w''''''⦈ ⦁ first x};
│	invs = {x : using_decs'' ⦇ w''''''⦈ ⦁ second x};
│	frame_aux_conc = w'''''' ∪ {c : conc_vars ⦁ trans_id c.var};
│	# seq_aux = # aux_vars;
│	ran seq_aux = aux_vars0;
│	w''''' = frame_aux_conc ∪ {v : pack_body_vars ⦁ trans_id v.var} \
│	  {a : aux_vars ⦁ (Value↗~↕) a.zvar};
│	Pre''''' = z_exists (aux_vars, z_many_and ({Pre''''''} ∪ invs));
│	post''''' =
│	 z_forall (seq_aux, z_imp (subs_pred (z_many_and
│	  ({Pre''''''} ∪ invs), frame_aux_conc, frame_aux_conc0),
│	  z_exists (aux_vars, z_many_and ({post''''''} ∪ invs))));
│	vc_vars''''' = (subprog_flatten_env(θENV)).vc_vars ∪ conc_vars
└───────────────────────────
=FAILURE
507012	Internal error: entry for ?0 missing from package environment
=ENDDOC
=DOC
val ⦏form_proc_subunit⦎ : FORMAL_PROC -> unit;
=DESCRIBE
┌  ⦏form_proc_subunit⦎──────────────
│	ΔZ_DOC;
│	ΔSUBUNIT_ENV;
│	FORM_PROC;
│	ENV;
│	Subunit''';
│	Speclab'''';
│	Block';
│	Block'';
│	st : Statement
├───────────────
│	subunit_flag'' = True;
│	θBlock' = blocks 1;
│	θBlock'' = blocks 2;
│	θSubunit''' = subunit_env (block_name'', block_name');
│	subunit_env' = {(block_name'', block_name')} ⩤ subunit_env;
│	specif_flag''' = True;
│	z' = z ⁀ ⟨z_vcs(vcs(θSpeclab'''', st))⟩;
│	θSpec'''' = specif''';
│	fun_flag'''' = False;
│	vc_vars'''' = vc_vars''';
│	vc_pars'''' = vc_pars' ∪ vc_pars''';
│	vc_log_cons'''' = {}
│	vc_aux_vars'''' = vc_aux_vars''';
│	expand_schema_sigs(ran globals) \ w ⊆ expand_schema_sigs (ran globs''');
│	(	(st = spec_no_ivars(θSpec))
│	  ∨ 	(st = spec_ivars(θSpec))
│	)
└───────────────────────────
=FAILURE
507012	Internal error: entry for ?0 missing from package environment
=ENDDOC
=DOC
val ⦏form_proc⦎ : bool -> FORMAL_PROC -> unit;
=DESCRIBE
ⓈZ
│	⦏form_proc⦎ ≜ 	form_proc_pack_spec ∨ form_proc_pack_body ∨
│			form_proc_pack_body_aux ∨ form_proc_subunit
■
=ENDDOC
\subsection{The SID function curr\_form\_proc}
=DOC
	val ⦏curr_form_proc⦎ : FORMAL_PROC -> unit;
=DESCRIBE
┌⦏curr_form_proc⦎─────────────
│	ΔENV;
│	FORM_PROC
├───────────────
│	blocks' =
│	blocks ⊕ {1 ↦ Block_current_formal_proc(blocks 1, θFormal_Proc)}
└─────────────────
=ENDDOC
\section{FUNCTIONS}\label{FUNCTIONS}
\subsection{The SID function new\_scope\_fun\_inf}
=DOC
	val ⦏new_scope_fun_inf⦎ : ID -> unit;
=DESCRIBE
┌⦏new_scope_fun_inf⦎────────
│	ΔENV;
│	IDENT;
│	Empty_Block
├───────────────
│	blocks' = ⟨θ Block⟩ ⁀ blocks;
│	block_name = ident;
│	fun_flag = True;
│	pack_spec_flag = pack_body_flag = stub_flag = subunit_flag =
│	formal_body_flag = declabel_flag = speclabel_flag =
│	till_flag = body_flag = False
└─────────────────
=ENDDOC
\subsection{The SID function new\_scope\_fun\_form}
=DOC
	val ⦏new_scope_fun_form⦎ : ID -> unit;
=DESCRIBE
┌⦏new_scope_fun_form⦎────────
│	ΔENV;
│	IDENT;
│	Empty_Block
├───────────────
│	blocks' = ⟨θ Block⟩ ⁀ blocks;
│	block_name = ident;
│	formal_body_flag = fun_flag = True;
│	pack_spec_flag = pack_body_flag = stub_flag = subunit_flag =
│	fun_flag = declabel_flag = speclabel_flag = till_flag = body_flag = False
└─────────────────
=ENDDOC
\subsection{The SID function stub\_spec\_fun}
┌⦏FORM_FUN⦎─────────────────────
│	Formal_Fun
└────────────────────────────
=DOC
val ⦏stub_spec_fun⦎ : FORMAL_FUN -> unit;
=DESCRIBE
┌  ⦏stub_spec_fun⦎──────────────
│	ΔSUBUNIT_ENV;
│	ENV;
│	FORM_FUN;
│	ΔSubunit;
│	id⋎1, id⋎2 : ID;
│	Block';
│	Block'';
│	Block'''
├───────────────
│	stub_flag'' = True;
│	θBlock' = blocks 1;
│	θBlock'' = blocks 2;
│	θBlock''' = blocks 3;
│	subunit_env(id⋎1, id⋎2) = θSubunit;
│	subunit_env' = subunit_env ⊕ {(id⋎1, id⋎2) ↦ θSubunit'};
│		subunit_flag''' = True ∧ id⋎1 = block_name''' dot block_name''
│	∨	subunit_flag''' = False ∧ id⋎1 = block_name'';
│	id⋎2 = block_name';
│	specif_flag' = True;
│	specif' = θSpec;
│	zmod' = zmod;
│	θIn_Scope' = θIn_Scope;
│	globs' = globals
└───────────────────────────
=FAILURE
507011	A subunit ?0 containing ?1 has not been introduced
=ENDDOC
\subsection{The SID function inf\_fun}
┌⦏INF_FUN⦎─────────────────────
│	Informal_Fun
└────────────────────────────
=DOC
=DESCRIBE
ⓈZAX
│ ⦏informal_function⦎ : Z_ID
■
ⓈZAX
│	⦏inf_fun_decl⦎ : Informal_Fun → Z_Decl
├─────────────
│	∀ Informal_Fun; Z_Decl⦁
│	inf_fun_decl (θ Informal_Fun) = θZ_Decl ⇔
│		zvar = Value(trans_id name) ∧
│		zexp = zid(informal_function)
■
Since it is needed in $trans\_informal\_fun$, the ML coding of the
function returns the Z name as well as just the declaration.
=FAILURE
507096	?0 has already been declared;
	it cannot be used as the name of an informal function here
=ENDDOC
=DOC
val ⦏inf_fun_pack_spec⦎ : INFORMAL_FUN -> unit;
=DESCRIBE
┌⦏inf_fun_pack_spec⦎──────────────
│	ΔPACK_ENV;
│	INF_FUN;
│	ENV;
│	Package;
│	Block''
├───────────────
│	pack_spec_flag'' = True;
│	θBlock'' = blocks 2;
│	pack_env block_name'' = θPackage;
│	pack_env' =
│	pack_env ⊕
│	{block_name'' ↦
│		Package_informal_funs(θPackage, informal_funs ⁀ ⟨θInformal_Fun⟩)}
└───────────────────────────
=FAILURE
507012	Internal error: entry for ?0 missing from package environment
=ENDDOC
=DOC
val ⦏trans_informal_fun⦎ : PREFIX_INFO -> INFORMAL_FUN -> ZParagraphs.PARAINFO;
=DESCRIBE
ⓈZAX
│	⦏trans_informal_fun⦎ : Informal_Fun → Z_Ax
├─────────────
│	∀f: Informal_Fun; Z_Ax⦁
│	trans_informal_fun f = θZ_Ax ⇔ decls = {inf_fun_decl f} ∧ preds = {}
■
=ENDDOC
ⓈZAX
│ ⦏add_fun_ax⦎ : (seq Z_PARA) × Z_PARA → seq Z_PARA
├──────
│ ∀z : seq Z_PARA; para : Z_PARA⦁
│	para ∈  ran z ∧ add_fun_ax(z, para) = z
│ ∨	para ∉ ran z ∧ add_fun_ax(z, para) = z ⁀ ⟨para⟩
■

=DOC
val ⦏inf_fun_otherwise⦎ : PREFIX_INFO * bool -> INFORMAL_FUN -> unit;
=DESCRIBE
┌⦏inf_fun_otherwise⦎──────────────
│	ΔZ_DOC;
│	INF_FUN;
│	ENV;
│	Block''
├───────────────
│	pack_spec_flag'' = False;
│	θBlock'' = blocks 2;
│	z' = add_fun_ax(z, z_ax(trans_informal_fun(θInformal_Fun)))
└───────────────────────────
=ENDDOC
=DOC
val ⦏inf_fun⦎ : INFORMAL_FUN -> unit;
=DESCRIBE
ⓈZ
│	⦏inf_fun⦎ ≜ inf_fun_pack_spec ∨ inf_fun_otherwise
■
=ENDDOC
\subsection{The SID function form\_fun}
=DOC
val ⦏form_fun_pack_spec⦎ : FORMAL_FUN -> unit;
=DESCRIBE
┌⦏form_fun_pack_spec⦎──────────────
│	ΔPACK_ENV;
│	FORM_FUN;
│	ENV;
│	Package;
│	Block''
├───────────────
│	pack_spec_flag'' = True;
│	θBlock'' = blocks 2;
│	pack_env block_name'' = θPackage;
│	pack_env' =
│	pack_env ⊕
│	{block_name'' ↦
│		Package_formal_funs(θPackage, formal_funs ⁀ ⟨θFormal_Fun⟩)}
└───────────────────────────
=FAILURE
507012	Internal error: entry for ?0 missing from package environment
=ENDDOC
=DOC
val ⦏z_forall_opt⦎ : (Z_DECL list * Z_PRED) -> Z_PRED;
=DESCRIBE
ⓈZAX
│	⦏z_forall_opt⦎ : (seq Z_Decl) × Z_PRED → Z_PRED
├─────────────
│	∀ zdecs: seq Z_Decl; zpred : Z_PRED; zres : Z_PRED⦁
│	z_forall_opt (zdecs, zpred) = zres ⇔
│		zdecs = ⟨⟩ ∧ zres = zpred ∨
│		zdecs ≠ ⟨⟩ ∧ zres = z_forall(zdecs, zpred)
■
=ENDDOC
=DOC
val ⦏fun_sig⦎ : (Z_EXP list * Z_EXP) -> Z_EXP;
val ⦏par_tmark⦎ : CN_ENV -> PARAM_SPEC -> Z_ID list;
val ⦏var_sig⦎ : CN_ENV -> Z_ID -> Z_EXP;
val ⦏fun_decl⦎ : CN_ENV -> FORMAL_FUN -> Z_DECL;
=DESCRIBE
ⓈZAX
│	⦏fun_sig⦎ : (seq Z_EXP) × Z_EXP → Z_EXP
├─────────────
│	∀ zpars : seq Z_EXP; zret : Z_EXP; zsig : Z_EXP⦁
│	fun_sig (zpars, zret) = zsig ⇔
│		zpars = ⟨⟩ ∧ zsig = zret ∨
│		zpars ≠ ⟨⟩ ∧ zsig = z_tfun(z_many_cross zpars, zret)
■
ⓈZAX
│	⦏par_tmark⦎ : Param_Spec → Z_ID
■
ⓈZAX
│	⦏var_sig⦎ : ENV → Z_ID → Z_EXP
■
ⓈZAX
│	⦏fun_decl⦎ : ENV → Formal_Fun → Z_Decl
├─────────────
│	∀ env : ENV;  Formal_Fun; Z_Decl⦁
│	fun_decl env (θ Formal_Fun) = θZ_Decl ⇔
│		zvar = Value(trans_id name) ∧
│		zexp = fun_sig(map (var_sig env) globals,
│				fun_sig(map (zid o par_tmark) formal_pars,
│					zid(trans_id return_type)))
■
The implementation of these functions are included as part of the VC generator as a) they are required there and b) this module depends on the VC generator. The names are included in this signature for traceability purposes.

$par\_tmark$ returns a list of type marks one for each parameter declared
in the $PARAM\_SPEC$ argument.
=ENDDOC
=DOC
val ⦏z_par_decl⦎ : PARAM_SPEC -> Z_DECL;
=DESCRIBE
ⓈZAX
│	⦏z_par_decl⦎ : Param_Spec → Z_Decl
■
=ENDDOC
=DOC
val ⦏z_vars_of_env⦎ : CN_ENV -> Z_ID -> bool;
val ⦏z_var_decl⦎ : CN_ENV -> Z_ID -> Z_DECL;
=DESCRIBE
ⓈZAX
│	⦏z_vars_of_env⦎ : ENV → ℙZ_ID
├
│ ∀ENV; zi : Z_ID⦁ zi ∈ z_vars_of_env (θENV) ⇔
│	(∃i: dom blocks; Var_Decl⦁
│	θVar_Decl ∈ (blocks i).vc_vars ∧ trans_id var = zi)
│ ∨	(∃i: dom blocks; Param_Spec⦁
│	θParam_Spec ∈ (blocks i).vc_pars ∧ trans_id var = zi)
│ ∨	(∃i: dom blocks; Z_Decl[Z_EXP]⦁
│	θZ_Decl ∈ (blocks i).vc_aux_vars ∧ zvar = Value zi)
■
ⓈZAX
│	⦏z_var_decl⦎ : ENV → Z_ID → Z_Decl
├──────────────────
│ ∀env: ENV; zname : Z_ID; Z_Decl⦁
│	z_var_decl env zname = θZ_Decl ⇔
│	(zname ∈ z_vars_of_env env ∧
│	zvar = Value zname ∧  zexp = var_sig env zname)
│	∨
│	(zname ∉ z_vars_of_env env ∧
│	zvar = Nil ∧  zexp = zid zname)
■
=ENDDOC
=DOC
val ⦏trans_formal_fun⦎ : PREFIX_INFO -> CN_ENV -> FORMAL_FUN -> ZParagraphs.PARAINFO * Z_PRED * Z_PRED * Z_ID;
=DESCRIBE
ⓈZAX
│	⦏trans_formal_fun⦎ : ENV → Formal_Fun ⇸ Z_Ax
├─────────────
│	∀env : ENV; Formal_Fun; Z_Ax⦁
│	trans_formal_fun env (θFormal_Fun) = θZ_Ax ⇔
│		decls = {fun_decl env (θFormal_Fun)} ∧
│		preds = {z_forall_opt(map (z_var_decl env) globals,
│				z_forall_opt(map z_par_decl formal_pars,
│					z_imp(Pre, post)))}
■
The ML function also returns the type-checked pre- and post-conditions.
=FAILURE
507067	Internal error: unexpected return value from trans_formal_fun
507068	The Z global variable ?0 has already been introduced and the
	declaration of function ?1 clashes with it
=ENDDOC
=DOC
val ⦏trans_formal_fun_name⦎ : PREFIX_INFO -> CN_ENV ->  PACKAGE OPT -> FORMAL_FUN -> Z_EXP;
=DESCRIBE
ⓈZAX
│	⦏trans_formal_fun_name⦎ : Formal_Fun ⇸ Z_EXP
■
ⓈZAX
│	⦏subs_exp_for_exp_in_pred⦎ : Z_PRED × Z_EXP × Z_EXP → Z_PRED
■
=ENDDOC
=DOC
val ⦏form_fun_pack_body_common⦎ : bool -> FORMAL_FUN ->
			(BLOCK * FORMAL_FUN * PACKAGE * SPECLAB) OPT
=DESCRIBE
┌⦏form_fun_pack_body_common⦎──────────────
│	ΔZ_DOC;
│	PACK_ENV;
│	FORM_FUN;
│	ENV;
│	Package'''';
│	Speclab''''';
│	ref : seq Z_PARA;
│	Formal_Fun''';
│	Block';
│	Block'';
│	st : Statement
├───────────────
│	pack_body_flag'' = True;
│	θBlock' = blocks 1;
│	θBlock'' = blocks 2;
│	z' =add_fun_ax(z, z_ax(trans_formal_fun(θENV)(θFormal_Fun))) ⁀ ref;
│	θPackage'''' = pack_env block_name'';
│	(
│		block_name' ∈ {f : ran formal_funs'''' ⦁ f.name}
│	∧	ref = ⟨z_vcs(vcs(θSpeclab''''', st))⟩
│	∧	(st = spec_no_ivars(θSpec) ∨ st = spec_ivars(θSpec))
│	∧	θFormal_Fun''' ∈ ran formal_funs'''' ∧ name''' = block_name'
│	∧	formal_body_flag''''' = True
│	∧	fun_flag''''' = True
│	∧	fun_header''''' = θInformal_Fun
│	∧	vc_pars''''' = vc_pars' ∧ vc_log_cons''''' = {}
│	∧	vc_vars''''' = (subprog_flatten_env(θENV)).vc_vars
│	∧	vc_aux_vars''''' = (subprog_flatten_env(θENV)).vc_aux_vars \ aux_vars''''
│	)
│	∨
│		(block_name' ∉ {f : ran formal_funs'''' ⦁ f.name} ∧ ref = ⟨⟩)
└───────────────────────────
=FAILURE
507012	Internal error: entry for ?0 missing from package environment
=ENDDOC
=DOC
val ⦏form_fun_pack_body⦎ :
	(BLOCK * FORMAL_FUN * PACKAGE * SPECLAB) -> FORMAL_FUN ->  unit;
=DESCRIBE
┌⦏form_fun_pack_body⦎──────────────
│	form_fun_pack_body_common
├───────────────
│	expand_schema_sigs(ran globals''') ∩ Value ↗~↕ ⦇{ a : aux_vars''''⦁a.zvar}⦈ = ∅;
│	globals = globals''';
│	Pre''''' = Pre''';
│	post''''' = post'''
└───────────────────────────
=FAILURE
507050	When a function is implemented in a package body,
	unless the formal function in the package specification ontains auxiliary variables,
	the list of global dependencies in the package body
	must be the same as in the package specification. ?0 does not agree with
	?1 in the specification of ?2
=ENDDOC
=DOC
val ⦏form_fun_pack_body_aux⦎ :
	(BLOCK * FORMAL_FUN * PACKAGE * SPECLAB) ->
	TERM list -> FORMAL_FUN ->  unit;
=DESCRIBE
┌⦏form_fun_pack_body_aux⦎──────────────
│	form_fun_pack_body_common;
│	aux_vars : ℙZ_Decl;
│	invs : ℙZ_PRED;
│	seq_aux : seq Z_Decl;
│	afunc, cfunc : Z_EXP;
│	conc_ids : ℙID
├───────────────
│	expand_schema_sigs(ran globals''') ∩ Value ↗~↕ ⦇{ a : aux_vars''''⦁a.zvar}⦈ = ∅;
│	aux_vars = {a : aux_vars'''' | (Value↗~↕) a.zvar ∈ expand_schema_sigs(ran globals''')};
│	invs = {x : using_decs'' ⦇  expand_schema_sigs(ran globals''') ⦈ ⦁ second x};
│	conc_ids =  {d : ⋃ {x : using_decs'' ⦇  expand_schema_sigs(ran globals''') ⦈ ⦁ first x} ⦁ d.var} ∪
│		trans_id  ↗~↕ ⦇expand_schema_sigs(ran globals''') \ Value ↗~↕ ⦇ {a : aux_vars⦁ a.zvar}⦈ ⦈;
│	#seq_aux = #aux_vars;
│	ran seq_aux = aux_vars;
│	afunc = trans_formal_fun_name(θFormal_Fun''');
│	cfunc = trans_formal_fun_name(θFormal_Fun);
│	Pre''''' = z_exists (aux_vars, z_many_and ({Pre'''} ∪ invs));
│	post''''' =
│	 z_forall (seq_aux, z_imp (z_many_and ({Pre'''} ∪ invs),
│	  z_exists (aux_vars,
│	    z_many_and ({subs_exp_for_exp_in_pred(post''', afunc, cfunc)} ∪ invs))))
└───────────────────────────
=FAILURE
507012	Internal error: entry for ?0 missing from package environment
507095	When a function is implemented in a package body, if the
	formal function in the package specification contains auxiliary variables,
	then each variable in the list of global dependencies in the package body
	must either appear in the global dependency list in the package specification or must be a using
	variable implementing one of the auxiliary variables in the specification.
	?0 in the specification of ?1 violates this rule.
=ENDDOC
=DOC
val ⦏form_fun_subunit⦎ : FORMAL_FUN -> unit;
=DESCRIBE
┌ ⦏form_fun_subunit⦎──────────────
│	ΔZ_DOC;
│	ΔSUBUNIT_ENV;
│	FORM_FUN;
│	ENV;
│	Subunit''';
│	Speclab'''';
│	ref : seq Z_PARA;
│	Block';
│	Block'';
│	st : Statement
├───────────────
│	subunit_flag'' = True;
│	θBlock' = blocks 1;
│	θBlock'' = blocks 2;
│	z' = add_fun_ax(z, z_ax(trans_formal_fun(θENV)(θFormal_Fun))) ⁀ ref;
│	θSubunit''' = subunit_env (block_name'', block_name');
│	subunit_env' = {(block_name'', block_name')} ⩤ subunit_env;
│		specif_flag''' = True
│	∧	ref = ⟨z_vcs(vcs(θSpeclab'''', st))⟩
│	∧	(st = spec_no_ivars(θSpec) ∨ st = spec_ivars(θSpec))
│	∧	θSpec'''' = specif''' ∧ formal_body_flag'''' = True
│	∧	fun_flag'''' = True
│	∧	fun_header'''' = θInformal_Fun ∧ vc_vars'''' = {}
│	∧	vc_pars'''' = vc_pars' ∪ vc_pars''' ∧ vc_log_cons'''' = {}
│	∧	vc_aux_vars''' = {} ∧ globals = globs'''
│	∨
│		specif_flag''' = False ∧ ref = ⟨⟩
└───────────────────────────
=FAILURE
507012	Internal error: entry for ?0 missing from package environment
=ENDDOC
=DOC
val ⦏form_fun_otherwise⦎ : FORMAL_FUN -> unit;
=DESCRIBE
┌⦏form_fun_otherwise⦎──────────────
│	ΔZ_DOC;
│	FORM_FUN;
│	ENV;
│	Block''
├───────────────
│	pack_spec_flag'' = pack_body_flag'' = subunit_flag'' = False;
│	θBlock'' = blocks 2;
│	z' = add_fun_ax(z, z_ax(trans_formal_fun(θENV)(θFormal_Fun)))
└───────────────────────────
=ENDDOC
=DOC
val ⦏form_fun⦎ : bool -> FORMAL_FUN -> unit;
=DESCRIBE
ⓈZ
│	⦏form_fun⦎ ≜ 	form_fun_pack_spec ∨ form_fun_pack_body ∨
│			form_fun_pack_body_aux ∨ form_fun_subunit ∨ form_fun_otherwise
■
=ENDDOC
\subsection{The SID function curr\_form\_fun}
=DOC
	val ⦏curr_form_fun⦎ : FORMAL_FUN -> unit;
=DESCRIBE
┌⦏curr_form_fun⦎─────────────
│	ΔENV;
│	FORM_FUN
├───────────────
│	blocks' = blocks ⊕ {1 ↦ Block_current_formal_fun(blocks 1, θFormal_Fun)}
└─────────────────
=ENDDOC
\section{FORMAL PARAMETERS}\label{FORMALPARAMETERS}
┌⦏FORMALS⦎─────────────
│	formals : ℙ Param_Spec
└─────────────────
\subsection{The SID function formal\_part}
=DOC
	val ⦏fformal_part⦎ : PARAMETER_SPECIFICATION list -> unit;
=DESCRIBE
┌⦏formal_part⦎─────────────
│	ΔENV;
│	FORMALS
├───────────────
│	blocks' = blocks ⊕ {1 ↦ Block_vc_pars(blocks 1, formals)}
└─────────────────
=ENDDOC
\section{SUBPROGRAM BODIES}\label{SUBPROGRAMBODIES}
\subsection{The SID function update\_envs\_proc}
=DOC
	val ⦏update_subunit_env_proc⦎ : PREFIX_INFO -> unit;
=DESCRIBE
┌⦏update_subunit_env_proc⦎───────
│	ΔSUBUNIT_ENV;
│	ENV;
│	Block';
│	Block''
├────────
│	declabel_flag'' = formal_body_flag' = True;
│	θBlock' = blocks 1;
│	θBlock'' = blocks 2;
│	#subunit_env = #subunit_env';
│	∀id⋎1, id⋎2 : ID; s, s' : Subunit |
│		subunit_env(id⋎1, id⋎2) = s ∧ subunit_env'(id⋎1, id⋎2) = s'
│	⦁	dec_lab'' ∈ s.dec_labels ∧
│		s' =
│		Subunit_formal_procs(s, s.formal_procs ∪ {current_formal_proc'})
│	∨	dec_lab'' ∉ s.dec_labels ∧ s' = s
└───────────────
=ENDDOC
=DOC
	val ⦏update_dec_env_proc⦎ : PREFIX_INFO -> unit;
=DESCRIBE
┌⦏update_dec_env_proc⦎───────
│	ΔDEC_ENV;
│	ENV;
│	Block';
│	Block''
├────────
│	declabel_flag'' = formal_body_flag' = True;
│	θBlock' = blocks 1;
│	θBlock'' = blocks 2;
│	#dec_env = #dec_env';
│	∀dec_label : LABEL; d, d' : Declab |
│		dec_env dec_label = d ∧ dec_env' dec_label = d'
│	⦁	dec_lab'' ∈ d.dec_labels ∧
│		d' =
│		Declab_formal_procs(d, d.formal_procs ∪ {current_formal_proc'})
│	∨	dec_lab'' ∉ d.dec_labels ∧ d' = d
└───────────────
=ENDDOC
=DOC
	val ⦏update_spec_env_proc⦎ : PREFIX_INFO ->  unit;
=DESCRIBE
┌⦏update_spec_env_proc⦎───────
│	ΔSPEC_ENV;
│	ENV;
│	Block';
│	Block''
├────────
│	declabel_flag'' = formal_body_flag' = True;
│	θBlock' = blocks 1;
│	θBlock'' = blocks 2;
│	#spec_env = #spec_env';
│	∀spec_label : LABEL; s, s' : Speclab |
│		spec_env spec_label = s ∧ spec_env' spec_label = s'
│	⦁	dec_lab'' ∈ s.dec_labels ∧
│		s' =
│		Speclab_formal_procs(s, s.formal_procs ∪ {current_formal_proc'})
│	∨	dec_lab'' ∉ s.dec_labels ∧ s' = s
└───────────────
=ENDDOC
=DOC
	val ⦏update_envs_proc⦎ : PROCEDURE_SPECIFICATION -> unit;
=DESCRIBE
ⓈZ
│ ⦏update_envs_proc⦎ ≜ update_subunit_env_proc ∧ update_dec_env_proc
│			∧ update_spec_env_proc
■
=ENDDOC
\subsection{The SID function add\_proc\_env}
=DOC
	val ⦏add_proc_env⦎ : ID -> unit;
=DESCRIBE
┌⦏add_proc_env⦎───────
│	ΔENV;
│	Block';
│	Block''
├────────
│	formal_body_flag' = True;
│	θBlock' = blocks 1;
│	θBlock'' = blocks 2;
│	blocks' =
│	blocks ⊕ {2 ↦ Block_formal_procs(θBlock'',
│			formal_procs'' ∪ {current_formal_proc'})}
└───────────────
=FAILURE
507066	A declaration for formal procedure ?0 has already been processed;
	the specification statements in the two declarations do not agree
507051	A declaration for procedure ?0 has already been processed;
=ENDDOC
\subsection{The SID function subprogram\_implementation}
=DOC
	val ⦏subprogram_implementation⦎ : {is_proc: bool, deferred : bool} ->
	{	old_cur_thy : string,
		subprog_thy : string,
		full_name : Z_ID} ;
=DESCRIBE
┌⦏subprogram_implementation⦎─────────────
│	ΔENV;
│	FORMALS
├───────────────
│	blocks' = blocks ⊕ {1 ↦ Block_body_flag(blocks 1, True)}
└─────────────────
The ML function creates the new theory for the subprogram and makes it current and returns the name of the theory that was current previously, so that caller can revert to it when the subprogram body has been processed.

=ENDDOC

\subsection{The SID function vcs\_body}
┌⦏SEQ_STMTS⦎────
│	st : Statement
└───────────
=DOC
	val ⦏vcs_body_proc⦎ : STATEMENT -> SPEC;
=DESCRIBE
┌ ⦏vcs_body_proc⦎───────
│	ΔZ_DOC;
│	ENV;
│	SEQ_STMTS;
│	Speclab;
│	Formal_Proc';
│	Block';
│	Block''
├────────
│	formal_body_flag' = True;
│	fun_flag' = False;
│	θBlock' = blocks 1;
│	θBlock'' = blocks 2;
│	z' = z ⁀ ⟨z_vcs(vcs(θSpeclab, st))⟩;
│	current_formal_proc' = θFormal_Proc';
│	Pre = z_many_and({Pre'} ∪
│	⋃{v : dom var_inits'; ze : Z_EXP; tm : TMARK
│	 | ze = trans_exp(first(var_inits' v)) ∧ tm = second(var_inits' v)⦁
│		{z_eq(zid(trans_id v), slide_to_tmark(ze, tm))} ∪ domain_conds ze});
│	post = post';
│	fun_flag = False;
│	return = post';
│	θIn_Scope = subprog_flatten_env(θENV);
│	w = w' ∪ {v : vc_vars' ⦁ trans_id v.var}
└───────────────
=ENDDOC
=DOC
	val ⦏vcs_body_fun⦎ : STATEMENT -> SPEC;
=DESCRIBE
┌⦏vcs_body_fun⦎───────
│	ΔZ_DOC;
│	ENV;
│	SEQ_STMTS;
│	Speclab;
│	Formal_Fun';
│	Block'
├────────
│	formal_body_flag' = True;
│	fun_flag' = True;
│	θBlock' = blocks 1;
│	z' = z ⁀ ⟨z_vcs(vcs(θSpeclab, st))⟩;
│	current_formal_fun' = θFormal_Fun';
│	w = {v : vc_vars' ⦁ trans_id (v.var)};
│	Pre = z_many_and({Pre'} ∪
│	⋃{v : dom var_inits'; ze : Z_EXP; tm : TMARK
│	 | ze = trans_exp(first(var_inits' v)) ∧ tm = second(var_inits' v)⦁
│		{z_eq(zid(trans_id v), slide_to_tmark(ze, tm))} ∪ domain_conds ze});
│	post = post';
│	formal_body_flag = fun_flag = True;
│	fun_header= θInformal_Fun';
│	return = post';
│	θIn_Scope = subprog_flatten_env(θENV)
└───────────────
Note: As agreed with DRA, this specification is insufficient. See implementation.
=ENDDOC
=DOC
	val ⦏vcs_body⦎ : STATEMENT -> unit;
=DESCRIBE
ⓈZ
│	⦏vcs_body⦎ ≜ vcs_body_proc ∨ vcs_body_fun
■
=ENDDOC
\section{PACKAGES}\label{PACKAGES}
\subsection{The SID function new\_scope\_pack\_spec}
=DOC
	val ⦏empty_package⦎ : DECLARATION PACKAGE_DECLARATION -> PACKAGE;
=DESCRIBE
┌⦏Empty_Package⦎───────
│	Package
├────────
│	vc_vars = {};
│	consts_types = ⟨⟩;
│	formal_procs = {};
│	informal_funs = ⟨⟩;
│	formal_funs = ⟨⟩;
│	aux_vars = {}
└───────────────
=ENDDOC
=DOC
	val ⦏new_scope_pack_spec⦎ : EXPANDED_NAME -> DECLARATION PACKAGE_DECLARATION -> unit;
=DESCRIBE
┌⦏new_scope_pack_spec⦎───────
│	ΔENV;
│	ΔPACK_ENV;
│	IDENT;
│	Empty_Block;
│	Empty_Package
├────────
│	blocks' = ⟨θ Block⟩ ⁀ blocks;
│	block_name = ident;
│	pack_spec_flag = True;
│	pack_body_flag = stub_flag = subunit_flag = formal_body_flag =
│	fun_flag = declabel_flag = speclabel_flag = till_flag = body_flag = False;
│	pack_env' = pack_env ∪ {ident ↦ θPackage}
└───────────────
=FAILURE
507007	The name ?0 has already been used for a package
=ENDDOC
\subsection{The SID function new\_scope\_pack\_body}
=DOC
	val ⦏new_scope_pack_body⦎ : EXPANDED_NAME -> unit;
=DESCRIBE
┌⦏new_scope_pack_body⦎───────
│	ΔZ_DOC;
│	ΔENV;
│	Z_PARENTS;
│	IDENT;
│	PACK_ENV;
│	Block;
│	Block';
│	Package'
├────────
│	θBlock' = blocks 1;
│	(subunit_flag' = False ∧
│		parents = {zmod'.mod_name} ∧ z' = z ⁀ ⟨z_parents(θZ_PARENTS)⟩ ∨
│	 subunit_flag' = True ∧ z' = z);
│	blocks' = ⟨θ Block⟩ ⁀ blocks;
│	θPackage' = pack_env ident;
│	block_name = ident;
│	pack_body_flag = body_flag = True;
│	pack_spec_flag = stub_flag = subunit_flag = formal_body_flag =
│	fun_flag = declabel_flag = speclabel_flag = till_flag = False;
│	vc_vars = vc_vars';
│	vc_pars = {};
│	vc_log_cons = {};
│	vc_aux_vars = {};
│	formal_procs = {};
│	dec_labels = {};
│	using_decs = {}
└───────────────
=FAILURE
=ENDDOC
\pagebreak
\subsection{The SID function new\_scope\_with}
ⓈZAX
│	⦏new_ids⦎ : Package → ℙ ID
├──────────────
│∀Package⦁
│	new_ids(θPackage) =
│	{v : vc_vars ⦁ v.var} ∪
│	{c : Const_Decl | const_decl c ∈ ran consts_types ⦁ c.const} ∪
│	{t : Type_Decl | type_decl t ∈ ran consts_types ⦁ t.name} ∪
│	{ident : ID; Type_Decl; Enum_Type_Def |
│		type_decl(θType_Decl) ∈ ran consts_types ∧
│		type_def = enum_type_def(θEnum_Type_Def) ∧
│		ident ∈ ran vals ⦁ ident} ∪
│	{s : Subtype_Decl | subtype_decl s ∈ ran consts_types ⦁ s.name} ∪
│	{p : formal_procs ⦁ p.name} ∪
│	{f : ran informal_funs ⦁ f.name} ∪
│	{f : ran formal_funs⦁ f.name}
■
ⓈZAX
│	⦏prefix⦎ : (ID × ℙID × Package) → Package
■
ⓈZAX
│	⦏z_prefix⦎ : (ID × ℙID × Z_MODULE) → seq Z_PARA
■
=DOC
	val ⦏new_scope_with⦎ : EXPANDED_NAME -> unit;
=DESCRIBE
┌ ⦏new_scope_with⦎───────
│	ΔZ_DOC;
│	ΔENV;
│	Z_MODULE;
│	Z_PARENTS;
│	IDENT;
│	PACK_ENV;
│	Block;
│	Package';
│	Z_DOC''
├────────
│	ident ∈ dom pack_env;
│	z_module(θ Z_MODULE) ∉ ran z;
│	z' = z'' ⁀ z ⁀ ⟨z_parents(θ Z_PARENTS)⟩;
│	z'' = z_prefix(ident, new_ids(pack_env ident), (pack_env ident).zmod) ⁀
│		map (trans_informal_fun ⨾ z_ax) informal_funs'⁀
│		map (trans_formal_fun (θENV)⨾ z_ax) formal_funs';
│	head z'' = z_module(θ Z_MODULE);
│	parents = {mod_name};
│	blocks' = ⟨θ Block⟩ ⁀ blocks;
│	θPackage' = prefix(ident, new_ids(pack_env ident), pack_env ident);
│	pack_body_flag = pack_spec_flag = stub_flag = subunit_flag =
│	formal_body_flag = fun_flag = declabel_flag =
│	speclabel_flag = till_flag = body_flag = False;
│	vc_vars = vc_vars';
│	vc_pars = {};
│	vc_log_cons = {};
│	vc_aux_vars = aux_vars';
│	formal_procs = formal_procs';
│	dec_labels = {}
└───────────────
=FAILURE
507142	The package ?0 cannot be brought into scope here because
	it contains an auxiliary variable ?1 that clashes
	with a name that is already in scope
=ENDDOC
=DOC
val ⦏package_ids⦎ : ID -> ID list;
=DESCRIBE
This is the composite of a look-up in the package environment and {\it new\_ids}
for the convenience of checking use clauses in the SPARK output function.
If there is no package environment entry, an empty list is returned (and checks
made in the Z Generator will have raised an exception unless the package was
introduced via an arbitrary replacement).
=ENDDOC
\subsection{The SID function update\_envs\_pack\_spec}
=DOC
=DESCRIBE
┌ ⦏update_envs_pack_spec⦎ ───────
│	ΔZ_DOC;
│	ΔENV;
│	Block';
│	In_Scope;
│	IDENT;
│	PACK_ENV;
│	Package''
├────────
│	body_flag' = True;
│	θBlock' = blocks 1;
│	blocks' = blocks ⊕ {1 ↦ Block_in_scope(θBlock', θIn_Scope)};
│	z' = z ⁀ z_prefix(ident, new_ids(pack_env ident), (pack_env ident).zmod) ;
│	θPackage'' = prefix(ident, new_ids(pack_env ident), pack_env ident);
│	vc_vars = vc_vars' ∪ vc_vars'';
│	vc_pars = vc_pars';
│	vc_log_cons = vc_log_cons';
│	vc_aux_vars = vc_aux_vars' ∪ aux_vars'';
│	formal_procs = formal_procs' ∪ formal_procs'';
│	dec_labels = dec_labels'
└───────────────
=FAILURE
507060	Internal error: the package environment entry for ?0 has gone missing
=ENDDOC
\subsection{The SID function end\_scope\_comp\_unit}
=DOC
val ⦏end_scope_comp_unit⦎ : unit -> unit;
=DESCRIBE
┌⦏end_scope_comp_unit⦎───────────
│	ΔENV
├───────
│	blocks' = ⟨blocks 1⟩
└─────────────────────────
=ENDDOC
\subsection{The SID function aux\_var}
$AUX\_VAR$ is declared in \cite{ISS/HAT/DAZ/DTD502}.
=DOC
val ⦏aux_var⦎ : AUX_VAR -> unit;
=DESCRIBE
┌ ⦏aux_var⦎ ───────────
│	ΔPACK_ENV;
│	AUX_VAR;
│	ΔENV;
│	Package;
│	Block'
├───────
│	θBlock' = blocks 1;
│	pack_env block_name' = θPackage;
│	pack_env' =
│	 pack_env ⊕
│	 {block_name' ↦ Package_aux_vars(θPackage, aux_vars ∪ {aux})};
│	blocks' =
│	blocks ⊕ {1 ↦ Block_vc_aux_vars(θBlock', vc_aux_vars' ∪ {aux})}
└─────────────────────────
=FAILURE
507032	Declaration of ?0 has already been introduced
=ENDDOC
\subsection{The SID function using\_dec}
$USING\_DEC$ is declared in \cite{ISS/HAT/DAZ/DTD502}.
=DOC
val ⦏using_dec⦎ : USING_DEC -> unit;
=DESCRIBE
┌⦏using_dec⦎───────────
│	ΔENV;
│	USING_DEC;
│	Block'
├───────
│	θBlock' = blocks 1;
│	blocks' =
│	 blocks ⊕
│	 {1 ↦
│	  Block_using_decs
│	   (blocks 1, using_decs' ∪ {aux ↦ (concrete_vars, invariant)})}
└─────────────────────────
=FAILURE
507031	A usng declaration for the auxiliary variable ?0 has already been processed
507037	Usng declarations are only allowed  in package bodies
=ENDDOC
\subsection{The SID function vcs\_aux\_initial}
=DOC
val ⦏vcs_aux_initial⦎ : STATEMENT -> SPEC;
=DESCRIBE
┌⦏vcs_aux_initial⦎───────────
│	ΔZ_DOC;
│	ENV;
│	SEQ_STMTS;
│	PACK_ENV;
│	Block';
│	Speclab
├───────
│	θBlock' = blocks 1;
│	z' = z ⁀ ⟨ z_vcs (vcs (θSpeclab, st))⟩;
│	vc_vars = vc_vars';
│	vc_pars = {};
│	vc_log_cons = {};
│	vc_aux_vars = {};
│	formal_procs = formal_procs';
│	fun_flag = False;
│	w = {v : vc_vars' ⦁ trans_id v.var};
│ 	Pre = z_many_and(
│        {v : dom var_inits'; ze : Z_EXP; tm : TMARK
│	 | ze = trans_exp(first(var_inits' v)) ∧ tm = second(var_inits' v)
│	 ⦁ z_eq(zid(trans_id v), slide_to_tmark(ze, tm))});
│	post =
│	 z_exists
│	 ((pack_env block_name').aux_vars,
│	 z_many_and {x : ran using_decs' ⦁ second x})
└─────────────────────────
=ENDDOC
\section{RENAMING DECLARATIONS AND USE CLAUSES}\label{RENAMINGDECLARATIONS}
\subsection{The SID function renames\_proc}
┌⦏RENAMES_NEW⦎───────────
│	new:ID;
│	formal_pars : seq Param_Spec
└─────────────────────────
┌⦏RENAMES_OLD⦎───────────
│	pack : OPT[ID];
│	old:ID
└─────────────────────────

=DOC
val ⦏renames_proc_common⦎ : FORMAL_PROC list -> SUBPROGRAM_RENAMING -> FORMAL_PROC OPT;
=DESCRIBE
┌⦏renames_proc_common⦎───────────
│	ENV;
│	PACK_ENV;
│	RENAMES_NEW;
│	RENAMES_OLD;
│	Package;
│	Block';
│	Formal_Proc'';
│	Formal_Proc'''
├───────
│	θBlock' = blocks 1;
│	(∃n: ID⦁ pack = Value n ∧
│		name'' = n dot old ∧
│		θPackage = prefix(n, new_ids(pack_env n), pack_env n))
│ ∨	(pack = Nil ∧
│		name'' = old ∧ formal_procs = (flatten_env(θENV)).formal_procs);
│	θFormal_Proc'' ∈ formal_procs;
│	name''' = new;
│	formal_ids''' = formal_ids'';
│	globals''' = globals'';
│	θSpec''' = θSpec''
└─────────────────────────
=ENDDOC
=DOC
val ⦏renames_proc_pack_spec⦎ : SUBPROGRAM_RENAMING -> unit;
val ⦏renames_proc_otherwise⦎ : SUBPROGRAM_RENAMING -> unit;
val ⦏renames_proc⦎ : SUBPROGRAM_RENAMING -> unit;
=DESCRIBE
┌ ⦏renames_proc_pack_spec⦎ ───────────
│ ΔPACK_ENV;
│ renames_proc_common;
│ Package''
├──────
│ pack_spec_flag' = True;
│ pack_env block_name' = θPackage'';
│ pack_env' =
│ pack_env ⊕  { block_name' ↦
│   Package_formal_procs(θPackage'', formal_procs'' ∪ {θFormal_Proc'''})}
└──────────────

┌ ⦏renames_proc_otherwise⦎ ───────────
│ ΔENV;
│ renames_proc_common
├──────
│ pack_spec_flag' = False;
│ blocks' = blocks ⊕ { 1 ↦
│    Block_formal_procs(θBlock', formal_procs' ∪ {θFormal_Proc'''})}
└──────────────
ⓈZ
│ ⦏renames_proc⦎ ≜ renames_proc_pack_spec ∨ renames_proc_otherwise
■

=FAILURE
507059	The renaming declaration for ?0 as ?1  cannot be handled formally
	(the renaming declaration is not consistent with the declaration of ?0)
507052	The renaming declaration for ?0 as ?1  cannot be handled formally
	(?0 is already defined as a formal procedure)
507061	The renaming declaration for ?0 as ?1  cannot be handled formally
	(package ?1 has already been processed)
507062	The renaming declaration for ?0 as ?1  cannot be handled formally
	(package ?0 has not been processed)
507063	The use clause for package ?0 cannot be handled formally
	(package ?0 has not been processed)
507064	The renaming declaration for ?0 as ?1  cannot be handled formally
	(either ?0 has not been processed formally or ?1 is already in scope in the Ada program
	or the declaration for ?1 is not compatible with that of ?0)
507073	The use clause for package ?0 cannot be handled formally (?1)
507074	The renaming declaration for package ?0 as ?1 cannot be handled formally (?2)
507075	The required abbreviation definition ?0 = ?1 is incompatible with the existing definition
=ENDDOC
\subsection{The SID function renames\_fun}

=DOC
val ⦏renames_fun⦎ : SUBPROGRAM_RENAMING -> unit;
=DESCRIBE
┌⦏renames_fun⦎───────────
│	ΔZ_DOC;
│	RENAMES_NEW;
│	RENAMES_OLD
├───────
│	(∃n: ID⦁ pack = Value n ∧
│		z' = z ⁀ ⟨z_eq_eq(trans_id new, zid(trans_id(n dot old)))⟩)
│ ∨	(pack = Nil ∧
│		z' = z ⁀ ⟨z_eq_eq(trans_id new, zid(trans_id old))⟩)
└─────────────────────────
=ENDDOC
\subsection{The SID function renames\_opsym}
=DOC
val ⦏renames_opsym⦎ : OPSYM_RENAMING -> unit;
=DESCRIBE
ⓈZAX
│ ⦏resolve_opsym⦎ : ID × seq Param_Spec → Z_EXP
■

┌⦏renames_opsym⦎───────────
│	ΔZ_DOC;
│	RENAMES_NEW;
│	RENAMES_OLD
├───────
│	z' = z ⁀ ⟨z_eq_eq(trans_id new, resolve_opsym (new, formal_pars))⟩
└─────────────────────────
=ENDDOC
\subsection{The SID function renames\_object}
┌⦏renames_var_common⦎───────────
│	ΔENV;
│	PACK_ENV;
│	RENAMES_NEW;
│	RENAMES_OLD;
│	zname' : Z_ID;
│	Block'
├───────
│	θBlock' = blocks 1;
│ ∃In_Scope; n : ID; zname : Z_ID ⦁ θIn_Scope = flatten_env(θENV)
│ ∧	(	pack = Nil ∧ zname = trans_id old
│	∨	pack = Value n ∧ zname  = trans_id (n dot old) )
│ ∧	(	zname' ∈ {v : vc_vars⦁ trans_id (v.var)} ∪ {a : vc_aux_vars⦁ (Value↗~↕) a.zvar}
│	∧	zname = zname'
│	∨	zname ↦ zname' ∈ obj_renamings )
│ ∧	blocks' =
│	blocks ⊕ {1 ↦  Block_obj_renamings(blocks 1, obj_renamings ∪ {trans_id new ↦ zname'})}
└─────────────────────────

┌ ⦏renames_var_pack_spec⦎ ───────────
│ ΔPACK_ENV;
│ renames_var_common;
│ Package''
├──────
│ pack_spec_flag' = True;
│ pack_env block_name' = θPackage'';
│ pack_env' =
│ pack_env ⊕  { block_name' ↦
│   Package_obj_renamings(θPackage'', obj_renamings'' ∪ {trans_id new ↦ zname'})}
└──────────────

┌ ⦏renames_var_otherwise⦎ ───────────
│ renames_var_common
├──────
│ pack_spec_flag' = False
└──────────────
ⓈZ
│ ⦏renames_var⦎ ≜  renames_var_pack_spec ∨ renames_var_otherwise
■

┌⦏renames_const⦎───────────
│	ΔZ_DOC;
│	ENV;
│	PACK_ENV;
│	RENAMES_NEW;
│	RENAMES_OLD
├───────
│ ∃In_Scope; n : ID; zname : Z_ID ⦁ θIn_Scope = flatten_env(θENV)
│ ∧	(	pack = Nil ∧ zname = trans_id old
│	∨	pack = Value n ∧ zname  = trans_id (n dot old) )
│ ∧	(	zname ∉ {v : vc_vars⦁ trans_id (v.var)} ∪ {a : vc_aux_vars⦁ (Value↗~↕) a.zvar}
│	∧	zname ∉ dom obj_renamings )
│ ∧	z' = z ⁀ ⟨z_eq_eq(trans_id new, zid zname)⟩
└─────────────────────────
ⓈZ
│ ⦏renames_object⦎ ≜ renames_var_pack_spec ∨ renames_var
■
\subsection{The SID function renames\_pack}
ⓈZAX
│ ⦏rename_basic_decl⦎ : ID → BASIC_DECL → Z_PARA
├──────
│ ∀pack : ID; Const_Decl⦁
│	rename_basic_decl pack (const_decl(θConst_Decl)) =
│	z_eq_eq(trans_id const, zid(trans_id(pack dot const)));
│ ∀pack : ID; Type_Decl⦁
│	rename_basic_decl pack (type_decl(θType_Decl)) =
│	z_eq_eq(trans_id name, zid(trans_id(pack dot name)));
│ ∀pack : ID; Subtype_Decl⦁
│	rename_basic_decl pack (subtype_decl(θSubtype_Decl)) =
│	z_eq_eq(trans_id name, zid(trans_id(pack dot name)))
■
ⓈZAX
│ ⦏rename_formal_fun⦎ : ID → Formal_Fun → Z_PARA
├──────
│ ∀pack : ID; Formal_Fun⦁
│	rename_formal_fun pack (θFormal_Fun) =
│	z_eq_eq(trans_id name, zid(trans_id(pack dot name)))
■

┌⦏renames_pack_consts_types_funs⦎───────────
│	ΔZ_DOC;
│	IDENT;
│	Package
├───────
│	z' =
│	z ⁀ rename_basic_decl ident o consts_types ⁀ rename_formal_fun ident o formal_funs
└─────────────────────────

┌⦏renames_pack_procs⦎───────────
│	ΔENV;
│	ΔPACK_ENV;
│	IDENT;
│	Package;
│	envs : seq ℙENV;
│	pack_envs : seq ℙPACK_ENV;
│	fps : seq Formal_Proc
├───────
│	envs 1 = {θENV};
│	θENV' ∈ envs(#envs) ;
│	pack_envs 1 = {θPACK_ENV};
│	θPACK_ENV' ∈ pack_envs(#pack_envs);
│	#envs = #pack_envs = #fps + 1 = #formal_procs + 1;
│	ran fps = formal_procs;
│∀ i : dom fps⦁∃ envs i; (envs(i+1))'; pack_envs i; (pack_envs(i+1))'; renames_proc⦁
│	pack = Value ident ∧ old = (fps i).name ∧ new = (fps i).name
└─────────────────────────
┌⦏renames_pack_vars⦎───────────
│	ΔENV;
│	ΔPACK_ENV;
│	IDENT;
│	Package;
│	envs : seq ℙENV;
│	pack_envs : seq ℙPACK_ENV;
│	vds : seq Var_Decl
├───────
│	envs 1 = {θENV};
│	θENV' ∈ envs(#envs) ;
│	pack_envs 1 = {θPACK_ENV};
│	θPACK_ENV' ∈ pack_envs(#pack_envs);
│	#envs = #pack_envs = #vds + 1 = #formal_procs + 1;
│	ran vds = vc_vars;
│∀ i : dom vds⦁∃ envs i; (envs(i+1))'; pack_envs i; (pack_envs(i+1))'; renames_var[opack/pack]⦁
│	opack = Value ident ∧ old = (vds i).var ∧ new = (vds i).var
└─────────────────────────
ⓈZAX
│ ⦏untrans_id⦎ : Z_ID → ID
├──────
│  ∀zi : Z_ID⦁ trans_id(untrans_id zi) = zi
■
┌⦏renames_pack_aux_vars⦎───────────
│	ΔENV;
│	ΔPACK_ENV;
│	IDENT;
│	Package;
│	envs : seq ℙENV;
│	pack_envs : seq ℙPACK_ENV;
│	avs : seq Z_Decl
├───────
│	envs 1 = {θENV};
│	θENV' ∈ envs(#envs) ;
│	pack_envs 1 = {θPACK_ENV};
│	θPACK_ENV' ∈ pack_envs(#pack_envs);
│	#envs = #pack_envs = #avs + 1 = #formal_procs + 1;
│	ran avs = aux_vars;
│∀ i : dom avs⦁∃ envs i; (envs(i+1))'; pack_envs i; (pack_envs(i+1))'; renames_var[opack/pack]⦁
│	opack = Value ident ∧
│	old =untrans_id((Value↗~↕)(avs i).zvar) ∧
│	new = untrans_id((Value↗~↕)(avs i).zvar)
└─────────────────────────
┌⦏renames_pack⦎───────────
│	renames_pack_consts_types_funs⨾⋎s
│	renames_pack_procs⨾⋎s
│	renames_pack_vars⨾⋎s
│	renames_pack_aux_vars
├───────
│	θPackage = pack_env ident
└─────────────────────────
ⓈZ
│ ⦏use_pack⦎ ≜ renames_pack
■

\section{STUBS AND SUBUNITS}\label{STUBSANDSUBUNITS}

\subsection{The SID function begin\_stub}
=DOC
val ⦏begin_stub⦎ : unit -> unit;
=DESCRIBE
┌⦏begin_stub⦎───────────
│	ΔENV
├───────
│	blocks' = blocks ⊕ {1 ↦ Block_stub_flag(blocks 1, True)}
└─────────────────────────
=ENDDOC
\subsection{The SID function end\_stub}
=DOC
val ⦏end_stub⦎ : unit -> unit;
=DESCRIBE
┌⦏end_stub⦎───────────
│	ΔENV
├───────
│	blocks' = blocks ⊕ {1 ↦ Block_stub_flag(blocks 1, False)}
└─────────────────────────
=ENDDOC
\subsection{The SID function new\_scope\_subunit}
=DOC
val ⦏new_scope_subunit⦎ : ID list -> unit;
=DESCRIBE
┌⦏new_scope_subunit⦎───────────
│	ΔENV;
│	IDENT;
│	Empty_Block
├───────
│	blocks' = ⟨θ Block⟩ ⁀ blocks;
│	block_name = ident;
│	subunit_flag = body_flag = True;
│	pack_spec_flag = pack_body_flag = stub_flag = formal_body_flag =
│	fun_flag = declabel_flag = speclabel_flag = till_flag = False
└─────────────────────────
=ENDDOC
\subsection{The SID function pack\_stub}
=DOC
val ⦏pack_stub⦎ : EXPANDED_NAME -> unit;
=DESCRIBE
┌ ⦏pack_stub⦎ ──────────────
│	ΔSUBUNIT_ENV;
│	ΔZ_DOC;
│	ENV;
│	Subunit;
│	id1 : ID;
│	Block';
│	Block'';
│	IDENT
├───────────────
│	θBlock' = blocks 1;
│	θBlock'' = blocks 2;
│ 	∃mod_name : Z_ID⦁
│		mod_name = trans_subunit_name(id1, ident) ∧
│		z' = make_module(mod_name, z) ⁀ z ∧
│ 		zmod = θZ_MODULE;
│	subunit_env' = subunit_env  ∪ {(id1, ident) ↦ θSubunit};
│		subunit_flag'' = True ∧ id1 = block_name'' dot block_name'
│	∨	subunit_flag'' = False ∧ id1 = block_name';
│	subunit_env' = subunit_env  ∪ {(id1, ident) ↦ θSubunit};
│	specif_flag = False;
│	θIn_Scope = flatten_env(θENV)
└───────────────────────────

=ENDDOC

\section{WEB CLAUSES}\label{WEBCLAUSES}
\subsection{The SID function z\_copy}
┌⦏ZPARA⦎───────────
│	zpara : Z_PARA
└───────────────
┌⦏z_copy⦎───────────
│	ΔZ_DOC;
│	ZPARA
├───────
│	z' = z ⁀ ⟨zpara⟩
└───────────────
\subsection{The SID function new\_scope\_dec\_replace}
=DOC
val ⦏new_scope_dec_replace⦎ : REPLACED_BY_DECL -> unit;
=DESCRIBE
┌⦏new_scope_dec_replace⦎───────────
│	ΔENV;
│	ΔDEC_ENV;
│	LAB;
│	Block
├───────
│	blocks' = ⟨θBlock⟩ ⁀ blocks;
│	θDeclab = Declab_declabel_flag(dec_env label, True);
│	dec_lab = label;
│	dec_env' = {label} ⩤ dec_env
└─────────────────────────
=FAILURE
507002	?0 has not been introduced as a declaration label
=ENDDOC

\subsection{The SID function update\_envs\_remove\_declabel}
=DOC
	val ⦏update_subunit_env_remove_declabel⦎: REPLACED_BY_DECL -> unit
=DESCRIBE
┌⦏update_subunit_env_remove_declabel⦎──────────────
│	ΔSUBUNIT_ENV;
│	ENV;
│	Block'
├───────────────
│	θBlock' = blocks 1;
│	#subunit_env = #subunit_env';
│	∀id⋎1, id⋎2 : ID; s, s' : Subunit |
│		subunit_env(id⋎1, id⋎2) = s ∧ subunit_env'(id⋎1, id⋎2) = s' ⦁
│		s' = Subunit_dec_labels (s, s.dec_labels \ {dec_lab'})
└───────────────────────────
=ENDDOC
=DOC
	val ⦏update_dec_env_remove_declabel⦎: REPLACED_BY_DECL -> unit
=DESCRIBE
┌⦏update_dec_env_remove_declabel⦎──────────────
│	ΔDEC_ENV;
│	ENV;
│	Block'
├───────────────
│	θBlock' = blocks 1;
│	#dec_env = #dec_env';
│	∀dec_label : LABEL; d, d' : Declab |
│		dec_env dec_label = d ∧ dec_env' dec_label = d'⦁
│		d' = Declab_dec_labels(d, d.dec_labels \ {dec_lab'})
└───────────────────────────
=ENDDOC
=DOC
	val ⦏update_spec_env_remove_declabel⦎: REPLACED_BY_DECL -> unit
=DESCRIBE
┌⦏update_spec_env_remove_declabel⦎──────────────
│	ΔSPEC_ENV;
│	ENV;
│	Block'
├───────────────
│	θBlock' = blocks 1;
│	#spec_env = #spec_env';
│	∀spec_label : LABEL; s, s' : Speclab |
│		spec_env spec_label = s ∧ spec_env' spec_label = s'⦁
│		s' = Speclab_dec_labels(s, s.dec_labels \ {dec_lab'})
└───────────────────────────
=ENDDOC
=DOC
	val ⦏update_envs_remove_declabel⦎: REPLACED_BY_DECL -> unit
=DESCRIBE
ⓈZ
│		⦏update_envs_remove_declabel⦎
│	≜	update_subunit_env_remove_declabel
│	∧	update_dec_env_remove_declabel
│	∧	update_spec_env_remove_declabel
■
=ENDDOC
\subsection{The SID function new\_scope\_speclabel}
=DOC
	val ⦏new_scope_speclabel⦎: LABEL -> unit
=DESCRIBE
┌⦏new_scope_speclabel⦎──────────────
│	ΔENV;
│	LAB;
│	SPEC_ENV;
│	Empty_Block
├───────────────
│	blocks' = ⟨θBlock⟩ ⁀ blocks;
│	speclabel_flag = True;
│	till_flag = (spec_env label).till_flag;
│	pack_spec_flag = pack_body_flag = stub_flag =
│	subunit_flag = formal_body_flag = fun_flag =
│	declabel_flag = body_flag = False;
│	spec_lab = label;
│	till = (spec_env label).till
└───────────────────────────
=FAILURE
507003	label ?0 has not been introduced
=ENDDOC
\subsection{The SID function vcs\_speclabel}
=DOC
	val ⦏vcs_speclabel⦎: REFINED_BY -> SPEC
=DESCRIBE
┌⦏vcs_speclabel⦎──────────────
│	ΔZ_DOC;
│	SEQ_STMTS;
│	SPEC_ENV;
│	ENV;
│	Block'
├───────────────
│	θBlock' = blocks 1;
│	z' = z ⁀ ⟨z_vcs(vcs(spec_env spec_lab', st))⟩	
└───────────────────────────

=ENDDOC
\subsection{The SID function end\_scope\_speclabel}
=DOC
	val ⦏end_scope_speclabel⦎: unit -> unit
=DESCRIBE
┌⦏end_scope_speclabel⦎──────────────
│	ΔSPEC_ENV;
│	end_scope;
│	Block'
├───────────────
│	θBlock' = blocks 1;
│	spec_env' = {spec_lab'} ⩤ spec_env
└───────────────────────────
=ENDDOC
\subsection{The SID functions new\_scope\_stmtlabel and end\_scope\_stmt\_label}
=DOC
	val ⦏new_scope_stmt_label⦎: LABEL -> unit
	val ⦏end_scope_stmt_label⦎: unit -> unit
=DESCRIBE
ⓈZ
│	⦏new_scope_stmt_label⦎ ≜ new_scope_speclabel
■
ⓈZ
│	⦏end_scope_stmt_label⦎ ≜ end_scope_speclabel
■
=ENDDOC

\newpage
\section{SPARK PROGRAM ENVIRONMENT}
The SPARK program environment enables the SPARK program to be recovered.
The relevant data structures are described in \cite{ISS/HAT/DAZ/DTD513}.

To describe the manipulation of this environment, we use some additional SID functions.

\subsection{The SID Function update\_replacement\_env}

This is called at the following points in the syntax.

=GFT
web_clause =
	z,
	compilation <update_spark_prog>,
	comp_label replacedby compilation <update_replacement_env>,
	ppart_label replacedby private_part <update_replacement_env>,
	vpart_label replacedby visible_part <update_replacement_env>,
	dec_label replacedby dec dp1 <update_replacement_env>,
	stmt_label replacedby sequence_of_statements <update_replacement_env>,
	spec_label refinedby sequence_of_statements <update_replacement_env>,
	refinedby sequence_of_statements <update_replacement_env>,
	spec_label replacedby sequence_of_statements <update_replacement_env>,
	replacedby sequence_of_statements <update_replacement_env>;
=TEX
(The manipulation of the replacement environment does not interact with the other SID functions, and so the interleaving of calls to $update\_replacement\_env$ and the other SID functions is immaterial).

The global variable $REPL$ holds the right-hand side of the current replacement or refinement web clause:

┌REPL──────────────
│	repl : Replacement
└─────────────────
The global variable $COMP$ holds the current k-slot or compilation unit web clause:

┌COMP──────────────
│	comp : K_Slot_Compilation_Unit
└─────────────────

$update\_replacement\_env$ adds the maplet mapping the current label (in the global variable $LAB$) to $REPL$ to the replacement environment.
=DOC
val ⦏update_replacement_env⦎ : LABEL * REPLACEMENT -> unit
=DESCRIBE
┌update_replacement_env──────────────
│	ΔREPL_ENV;
│	LAB;
│	REPL
├───────────────
│	repl_env' = repl_env ⊕ {label ↦ repl}
└───────────────────────────
=ENDDOC
=DOC
val ⦏update_spark_prog⦎ : KSLOT_COMPILATION_UNIT list -> unit
=DESCRIBE
$update\_spark\_prog$ appends the current compilation to the sequence of same held in the SPARK program environment.

┌update_spark_prog──────────────
│	ΔSPARK_Prog;
│	COMP
├───────────────
│	spark' = spark ⁀ ⟨comp⟩
└───────────────────────────
=FAILURE
507003	label ?0 has not been introduced
507004	label ?0 has already been refined or replaced
507005	label ?0 has already been used
=ENDDOC
\newpage
\section{INTERFACE}
=DOC
val ⦏get_z_generator_state⦎ : unit -> Z_GENERATOR_STATE;
val ⦏set_z_generator_state⦎ : Z_GENERATOR_STATE -> unit;
val ⦏diag_z_generator_state⦎ : Z_GENERATOR_STATE ref;
val ⦏get_saved_z_generator_state⦎ : string -> Z_GENERATOR_STATE;
val ⦏get_state_db⦎ : unit -> Z_GENERATOR_STATE E_DICT;
val ⦏is_cn_theory⦎ : string -> bool;
val ⦏diag_web_clause⦎ : WEB_CLAUSE ref;
val ⦏diag_basic_decl_list⦎ : BASIC_DECL list ref;
val ⦏diag_vc_args⦎ : (SPECLAB * STATEMENT) list ref;
val ⦏kslot_compilation_unit_name⦎ : KSLOT_COMPILATION_UNIT -> string;
val ⦏get_exception_logs⦎ : unit ->  CN_EXCEPTION_LOG;
val ⦏delete_exception_log⦎ : string -> unit;
val ⦏log_message⦎ : string -> unit;
val ⦏log_exception⦎ : exn -> string;
val ⦏current_cn_env⦎ : CN_ENV;
val ⦏ti_context_of_in_scope⦎ : IN_SCOPE -> TYPE E_DICT;
val ⦏cn_env_of_in_scope⦎ : IN_SCOPE -> CN_ENV;
val ⦏open_scope⦎ : string -> unit;
val ⦏delete_deferred_subprogram⦎ : string -> unit;
=DESCRIBE
=ENDDOC
=DOC
val ⦏classify_label⦎ : string -> REPL_SORT OPT
val ⦏get_replacement⦎ : string -> REPLACEMENT OPT
val ⦏do_web_clause⦎ : CNTypes.WEB_CLAUSE -> unit
=DESCRIBE
=ENDDOC
=DOC
val ⦏block_tag⦎ : string ;
val ⦏context_tag⦎ : string;
val ⦏fun_tag⦎ : string;
val ⦏pack_spec_tag⦎ : string;
val ⦏pack_body_tag⦎ : string;
val ⦏proc_tag⦎ : string;
=DESCRIBE
The tags appended to Ada scope names to give theory names.
=ENDDOC

=DOC
type ⦏CN_STATE⦎
val ⦏get_cn_state⦎ : unit -> CN_STATE
val ⦏set_cn_state⦎ : CN_STATE -> unit
val ⦏new_script⦎ : {name : string, unit_type : string} -> unit
val ⦏new_script1⦎ :
	{name : string, unit_type : string,
		library_theories : string list} -> unit
val ⦏new_continuation_script⦎ : {name : string, unit_type : string} -> unit
val ⦏new_continuation_script1⦎ :
	{name : string, unit_type : string,
		library_theories : string list} -> unit
val ⦏cn_z_generator⦎ : CNTypes.WEB_CLAUSE -> unit
val ⦏sco_z_generator⦎ : CNTypes.WEB_CLAUSE -> unit
val ⦏restart_cn_z_generator⦎ : unit -> unit
val ⦏get_saved_cn_state⦎ : string -> CN_STATE;
val ⦏delete_script⦎ : {name : string, unit_type : string} -> unit;
=DESCRIBE
$new\_script1$ acts the same as $new\_script$ except that its list
of library theories will be made the parents of the script theory,
and any theory produced during processing the script.	
=ENDDOC

\section{VC Browser Information Interface}
=DOC
val ⦏get_vc_context_route⦎ : string * (string -> string) -> vc_context_route;
val ⦏dest_route⦎ : ROUTE -> (TERM * vc_route_arg);
=DESCRIBE
Information about VCs is stored as a \textit{\slshape USER\_DATUM} and extracted with
\textit{\slshape get\_vc\_context\_route}.
=FAILURE
507085	Unexpected term in VC route.
507086	Case branch count out of int range.
507087	Unexpected term when elsf indicator expected.
507088	Unexpected structure of contexts and routes.
=ENDDOC
\section{Additional Error Messages}
=DOC
(* additional error messages *)
=DESCRIBE
This long list of error messages is split over several pages:
=FAILURE
507017	Representation clauses are not handled formally and may affect the meaning of the program
507018	Pragmas are not handled formally and may affect the meaning of the program
507019	Internal error: unexpected abstract syntax category encountered
507021	Deferred constant declarations are not handled formally
507023	Cannot introduce theory ?0; a declaration for package
	?1 has probably already been processed
507024	Cannot introduce theory ?0; a body for package
	?1 has probably already been processed
507025	Cannot introduce theory ?0; a main program called
	?1 may already have been processed
507026	Cannot introduce theory ?0; a stub for the subunit
	?1 may already have been processed
507027	Cannot open theory ?0; a stub for the subunit
	?1 has not been processed
507028	Cannot open theory ?0; a declaration for the package
	?1 has not been processed
507029	Design error: information required for package ?0 has vanished
507030	Cannot introduce package body: a specification for package ?0 has not been processed
507034	Cannot make theory ?0 a parent of theory ?1: ?2
507035	Cannot make theory ?0 a parent of theory ?1: theory ?0 does not exist
507036	This renaming declaration cannot be handled formally
	(?0 is not a formal procedure)
507038	A specification for package ?0 has not been processed
507039	An arbitrary Ada replacement is an informal development step.
507070	There is no script called ?0 in the current state database
507071	When a package is referred to in a USE clause or a RENAMING clause
	its declaration must be complete;
	package ?0 is not complete; it contains the following unexpanded label?1
507072	Unable to check package ?0 (missing or corrupt table entry for script ?1)
507079	Internal error: corrupt table entry for script ?1
507089	The declarations in a block statement can only be handled formally
	if the block statement appears on its own on the right-hand side of
	a refinement or replacement step.
=ENDDOC
=DOC
(* additional error messages *)
=DESCRIBE
Continuation of the long list of error messages split over several pages:
=FAILURE
507040	A specification for package ?0 is not allowed here because the
	theory ?1 already exists (perhaps because a specification for
	the package has already been processed)
507042	Library theory ?0 cannot be made a parent of the script theory: ?1
507044	This renaming declaration cannot be handled formally
	(?0 not successfully processed because ?1)
507045	A script may not contain more than one compilation unit:
	cannot add compilation unit ?0 to script ?1 as it already contains
	compilation unit ?2.
507046	DESIGN ERROR: Corrupt compilation unit data for theory ?0
507047	DESIGN ERROR: Should be called in theory ?0 but currently in ?1
507048	?0 appear to be one or more SPARK functions from the same package
	specification that specifies function ?1, which may not be used
	in the specification of that function
507053	Free variable ?0 found in checking predicate ?1 of formal procedure
507054	Free variables ?0 found in checking predicate ?1 of formal procedure
507055	Formal parameter ?0 in package ?1 clashes with a name declared in
	package that must be prefixed.
507056	Compilation units may only be added to theories created for that purpose:
	compilation unit ?0 cannot be added to theory ?1
507057	Unable to provide prefixed specifications for ?0
507065	?0 is not a valid label here
507069	Internal error: unexpected environment renaming entry (old name: ?0, new name: ?1)
507077	An assertion may only appear in a refinement step or in the body of a formal subprogram
507078	Internal error: corrupt default parameter information
507081	To be handled formally, default expressions in parameter specifications must be constant expressions.
	The Z expression ?0 contains the free variable ?1
507082	To be handled formally, default expressions in parameter specifications must be constant expressions.
	The Z expression ?0 contains the free variables ?1
507090	The theory ?0 is locked and so cannot be deleted
507091	Deleting script ?0 has caused the following to be deleted:
507092	Script theories:?0Other theories:?1Subunits?2Packages:?3
507093	The theory ?0 is an ancestor of the current theory and so cannot be deleted
507094	The theory ?0 is in an ancestor database and so cannot be deleted
507100	*** SOUNDNESS WARNING : ?2 [?1.?0]
507101	*** Z GENERATION FAILURE: ?0
=ENDDOC
=DOC
(* additional error messages *)
=DESCRIBE
Continuation of the long list of error messages split over several pages:
=FAILURE
507121	Ada variables in pre- and post-conditions must appear in
	an enclosing frame or Ξ-list.
	The following variable?0 ?1 not in an enclosing frame or Ξ-list:
507122	Invalid pre-condition
507123	Invalid post-condition
507124	VCs must not contain free variables.
	The following variable?0 ?1 would appear free:
507125	Invalid VC
507127	?0 is not a valid type mark
507128	Internal error: invalid Z type associated with type mark ?0
507129	The identifier ?0 is not in scope in the Ada program
507130	Internal error: attempt to look up ?0 in an empty environment
507131	Internal error: inconsistent use of environment dictionary entry for ?0
507132	Procedure ?0 has not been declared
507133	Package ?0 has not been processed formally
507134	A statement replacement is an informal development step
507135	?0 is not formally specified here but is
	formally specified in the specification of package ?1.
	This is an informal development step
507136	?0 is not formally specified here but is
	formally specified in its stub in unit ?1.
	This is an informal development step
507137	$IMPLICIT may only be used in a package body to
	introduce a formal subprogram that has been declared in
	the package specification.
507138	The theory name ?0 does not follow conventions;
	the expected name is ?1
507139	Cannot introduce theory ?0; the body of the subprogram
	?1 may already have been processed
507143	A subprogram, block or package  named ?0 has already been processed
507144	Label ?0 must be processed in the scope of the
	program unit ?1 that it belongs to.
	Use open_scope to go into the appropriate scope
507145	The theory ?0 associated with program unit ?1 cannot
	be opened
507146	The body for the program unit named ?0 has not been processed
507147	The declarative part in a deferred subprogram must
	only contain k-slots. The deferred subprogram ?0
	contains a declaration that is not a k-slot
507148	A deferred subprogram must be a formal subprogram.
	The subprogram ?0 is not formal
507149	The statement in a deferred subprogram must
	comprise a single k-slot. The statement part
	of subprogram ?0 is not allowed in a deferred subprogram
507150	Internal error: deferred package bodies are not
	supported
507151	The unit type must be "spec", "body", "proc" or "func".
	?0 is not a valid unit type.
507152	Cannot introduce theory ?0; another block named
	?1 may already have been processed in the current scope
507153	Cannot introduce theory ?0; another anonymous block
	may already have been processed in the current scope
507154	Internal error: missing or corrupt scope environment entry
507155	?0 is not a deferred subprogram
507156	There is nothing to be deleted for deferred subprogram ?0
507157	Internal error: missing environment entry for ?0
507158	Unexpected error (?1) deleting deferred subprogram ?0
507159	A renaming declaration can only be handled formally
	if the new name is a simple name.
	The renaming of ?0 as ?1 cannot be handled formally
507160	Internal error: unexpected value returned by ?0
=ENDDOC
\section{EPILOGUE}
=SML
end; (* signature CNZGenerator *)
=TEX
\section{TEST POLICY}
The functions in this document do not lend themselves to module testing (as discussed in \cite{ISS/HAT/DAZ/HLD503}). Testing of the design and implementation of the Z document generator will be done using suitable integration tests.

Testing will be in accordance with the criteria identified in \cite{ISS/HAT/DAZ/PLN003}.

\small
\twocolumn[\section{INDEX}]
\printindex

\end{document}




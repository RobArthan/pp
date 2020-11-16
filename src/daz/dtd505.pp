=IGN
********************************************************************************
dtd505.doc: this file is part of the PPDaz system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  ℤ $Revision: 1.107 $ $RCSfile: dtd505.doc,v $ $Date: 2007/02/18 17:03:43 $
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

\def\Title{Detailed Design: Verification Condition Generator}

\def\AbstractText{This document contains the detailed design for the Verification Condition Generator for the Compliance Tool.}

\def\Reference{ISS/HAT/DAZ/DTD505}

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
%% LaTeX2e port: \TPPtitle{Detailed Design: Verification Condition Generator}  %% Mandatory field
%% LaTeX2e port: \TPPref{ISS/HAT/DAZ/DTD505}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.107 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2007/02/18 17:03:43 $%
%% LaTeX2e port: }}
%% LaTeX2e port: %\TPPstatus{Approved}
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: %\TPPkeywords{SPARK}
%% LaTeX2e port: \TPPauthor{D.J.~King&WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & HAT Team}
%% LaTeX2e port: \TPPabstract{This document contains the detailed design for the Verification Condition Generator for the Compliance Tool.
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

\subsection{Changes History}  % to get section number `0.3'
\begin{description}
\item[Issue 1.1 (1994/04/27)-1.11 (1994/07/14)] Initial Drafts.
\item[Issue 1.12 (1994/09/26) (26th September 1994)] Reworked according to desk check report 009.
\item[Issues 1.13 (1994/11/03)-1.23 (1994/12/07)] Bug fixing, added support for checks.
\item[Issue 1.24 (1994/12/12)] Added new error message for $check\_1\_a$.
\item[Issue 1.25 (1994/12/13)] Improved error messages for checks 1b, 1c and 1d.
\item[Issue 1.26 (1994/12/16)] Changed signature of $check\_new\_z\_id$.
\item[Issue 1.26 (1994/12/16)] Changed signature of $check\_new\_z\_id$.
\item[Issue 1.27 (1995/04/03)-1.29 (1995/04/05)] Batch 1 bug fixing.
\item[Issue 1.30 (1995/10/19)] Enhancements 13 and 14.
\item[Issue 1.31 (1995/10/23),1.32 (1995/10/25)] Bug fixing (batch 2 bug 13); also improved wording of many error messages.
\item[Issue 1.33 (1995/12/14)] Corrected spelling mistake in error message.
\item[Issue 1.34 (1996/02/26)] Fixed DRA bug 15 (V0.6).
\item[Issue 1.36 (1997/04/21)-1.37 (1997/04/21)] Fixing $analyse\_log\_con$.
\item[Issue 1.38 (1997/06/05)] Improved message 505063.
\item[Issue 1.39 (1997/07/18)] IUCT WP 4 changes.
\item[Issue 1.40 (1997/07/29)] Corrected Z syntax and type errors.
\item[Issue 1.41 (1997/08/04)] Slight improvement to error message 505080.
\item[Issue 1.42 (1997/08/04)] Check 1(a) now applies to procedure calls to. This changes
the signature and description of some of the checks.
\item[Issue 1.43 (1997/08/05)] Added new check 16.
\item[Issue 1.44 (1997/08/18)] Updated references.
\item[Issue 1.45 (1997/08/19)] Tidying.
\item[Issue 1.46 (1999/02/25),1.47 (1999/02/26)] Update for SML97. Fixed broken error messages.
\item[Issue 1.48 (2000/05/17)]
Trialling enhancement ref. R5 from \cite{LEMMA1/DAZ/HLD506}
At this version only the Z and a few of the ML types have been changed.
The main ML changes will come later.
\item[Issue 1.49 (2000/05/23)] Trialling remaining enhancements from \cite{LEMMA1/DAZ/HLD506}.
\item[Issue 1.50 (2000/05/24)] Prototyping enhancement R5 --- Initial Variables in Conditionals.
\item[Issue 1.51 (2000/05/30)] Typechecking corrected approach to enhancement R2 --- Multiple Logical Constant Definitions.
\item[Issue 1.52 (2000/05/31)] Typechecking new approach to enhancement R3 --- Assignment to Record Components.
\item[Issue 1.53 (2000/06/02),1.54 (2000/06/14),1.55 (2000/06/16)] Prototyping enhancement R2 --- Multiple Logical Constant Definitions
(adjusted error messages for new syntax).
\item[Issue 1.56 (2000/06/21)] Check on initial variables in pre-conditions added.
\item[Issue 1.57 (2000/10/17)] CTLE II R1/2: ``others'' in case statements.
\item[Issues 1.58 (2000/10/17)-1.60 (2000/10/17)] CTLE II R1/3: reverse loops.
\item[Issues 1.61 (2000/10/24)] CTLE II R1/9: SPARK 83 attributes.
\item[Issue 1.62 (2000/10/25)] CTLE II R2/1 --- global variable unsoundness.
\item[Issue 1.63 (2000/12/21)] Fixed typo in Z spec of {\it FOR\_STATIC}.
\item[Issue 1.64 (2001/05/28)] Perfomance enhancement for type-checking of specification statements.
\item[Issue 1.65 (2001/07/06)] Added option to compactify pre- and post-conditions.
\item[Issues 1.66 (2001/11/06)-1.69 (2001/11/07)] Enhancement R0003 --- record and array components as exported parameters.
\item[Issue 1.70 (2001/12/12)] Removed local declarations for Poly/ML port.
\item[Issue 1.71 (2002/01/14)] Index brackets added.
\item[Issue 1.72 (2002/01/29)] R0044: checks on array ranges.
\item[Issue 1.73 (2002/02/14)] Applying specification changes from HLD508.
\item[Issue 1.74 (2002/02/15)] Fixed missing index brackets.
\item[Issue 1.75 (2002/02/18)] Fixed {\LaTeX} problems in SPC502.
\item[Issue 1.76 (2002/03/19)] Removed dead code from old anti-aliasing checks.
\item[Issue 1.77 (2002/05/02)] Spring 2002 enhancements: adjustments for syntax for interim release.
\item[Issue 1.78 (2002/05/06), 1.79 (2002/05/11)] Spring 2002 enhancements: return and exit statements (ML)
\item[Issue 1.78 (2002/05/06), 1.79 (2002/05/11)] Spring 2002 enhancements: return and exit statements (Z)
\item[Issue 1.80 (2002/05/17)] Formal spec updates for interim release.
\item[Issue 1.81 (2002/05/22) -- 1.83 (2002/07/14)] Changed signature of \textit{\slshape case\_base}, \textit{\slshape case\_step}
   to accomodate a branch count.
\item[Issue 1.82 (2002/07/13)] R0054: reworked treatment of use clauses.
\item[Issue 1.83 (2002/07/14)] {\it get\_proc\_spec} made available for use elsewhere.
\item[Issue 1.84 (2002/08/08)] Revised signature {\it proc\_call\_spec} (to bring in line with spec and allow bug-fix).
\item[Issue 1.85 (2002/10/14)] Merged in changes for R0062 (origin of VCs).
\item[Issue 1.86 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.87 (2002/10/17), 1.88 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.89 (2002/11/11)] Uniform treatment of block statements.
\item[Issue 1.90 (2002/11/25)] Schemas-as-declarations now catered for in output Z syntax.
\item[Issues 1.91 (2003/07/18)-1.92 (2004/06/20)] Reform of the Environments.
\item[Issues 1.93 (2004/07/03)] Reintroduced a missing error message (for {\em get\_proc\_spec}). This wasn't causing a problem, but was untidy.
\item[Issue 1.94 (2004/07/10)] Added error message for attempt to use initial values of out mode parameters.
\item[Issue 1.95 (2004/10/25)] Informal support for goto statements requires a new error message.
\item[Issue 1.96 (2004/11/24)] Updated the specifications for the new treatment of side conditions.
\item[Issue 1.97 (2004/12/08)] Improved domain condition generation for for-loops following a suggestion of Alf Smith.
\item[Issue 1.98 (2005/02/20)] New treatment of initial variables in side conditions.
\item[Issue 1.99 (2005/02/22)] Allowed for changes to the Z library (which now assigns precedences following the ISO standard).
\item[Issue 1.100 (2005/02/26)] Adjusted Z after comments from Alf Smith.
\item[Issue 1.101 (2005/02/28)] Now use Z let-expressions.
\item[Issue 1.102 (2005/03/03)] Minor adjustments to error messages.
\item[Issue 1.105 (2006/04/11)] Under enhancement 117, checks on use of names in Z are now given a uniform treatment.
\item[Issue 1.145] New error messages for {\em check\_1\_b}.
\item[Issue 1.146] Error messages for check 21.
\item[Issue 1.147] Allowed for rationalisation to abstract syntax of loops.
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

This document contains the detailed design for the Verification Condition (VC) Generator. The design is in response to the high level design for compliance notation processing \cite{ISS/HAT/DAZ/HLD503}.

The document provides a design which implements DRA's specification for VC Generation described in \cite[volume 2]{DRA/CIS/CSE3/TR/94/27/3.0}.

\subsection{Introduction}

\subsubsection{Purpose and Background}

The VC generator is called by the Z document generator \cite{ISS/HAT/DAZ/IMP507} to generate VCs for inclusion into the generated Z document according to the algorithms specified in \cite[volume 2]{DRA/CIS/CSE3/TR/94/27/3.0}.

The Z of \cite[volume 2]{DRA/CIS/CSE3/TR/94/27/3.0} is reproduced in this document (suitable for type-checking with {\Product}) adjacent to the signature declarations of the functions which implement the Z. The corresponding implementatation is in \cite{ISS/HAT/DAZ/IMP505}.

\subsection{Compliance}

This detailed design contains signatures for Standard ML functions with the Z specification of these functions, transcribed from \cite[volume 2]{DRA/CIS/CSE3/TR/94/27/3.0}. The names of these functions corresponds to the names used in the Z, and where they differ, justification has been provided.

The implementation of this design can be found in \cite{ISS/HAT/DAZ/IMP505} where the style of coding is intended to make the compliance with the Z specification evident by a visual comparison.

In {\ProductZ}, subscripts are not decoration. In order to achieve the effect required by \cite[Volume 2]{DRA/CIS/CSE3/TR/94/27/3.0}, multiple priming has been used and generally, the number of primes in a decoration corresponds to the numeric value of the subcript in \cite[Volume 2]{DRA/CIS/CSE3/TR/94/27/3.0}.

The checks which have been implemented are introduced in section \ref{APPLICATIONOFCHECKS} and are listed in table \ref{ImplementedChecks}.

\begin{table}
\center
\begin{tabular}{||l|l||}\hline\hline
Volume 1: & 17.1.1: 1. (a), (b), (c) \& (d) \\
      & 17.1.1: 2. \\
      & 17.1.1: 3. \\
      & 17.1.1: 4. \\
      & 17.1.1: 12. \\
      & 17.1.1: 16. \\ \hline
Volume 2: & 5.2 (aliasing) \& 5.3 (variable capture) \\
\hline\hline
\end{tabular}
\caption{Implemented Checks}\label{ImplementedChecks}
\end{table}

The implementation of the function {\it domain\_conds} that calculates the domain conditions
of an expression fits much more naturally into the implementation of the expression
translator in \cite{ISS/HAT/DAZ/IMP508}. Consequently the Z specification and ML
signature of {\it domain\_conds} is in \cite{ISS/HAT/DAZ/DTD508} rather than in this
document.

%\subsubsection{Dependencies}
%\subsubsection{Possible Enhancements}
%\subsubsection{Deficiencies}

\section{PREAMBLE FOR Z TYPE CHECKING}

The following initialises the theory database when performing a syntax and type check on the Z paragraphs in this document. (This preamble is not processed when building the compliance tool.)

=SMLZ
open_theory"dtd508";
push_pc "z_library";
force_delete_theory"dtd505" handle Fail _ => ();
val _ = set_flag ("z_type_check_only", true);
new_theory"dtd505";
new_parent"dtd514";
=TEX

\section{THE SIGNATURE $CNVCGenerator$}

=DOC
signature ⦏CNVCGenerator⦎ = sig
=DESCRIBE
=FAILURE
505001	?0
=ENDDOC
As in several other signatures, local declarations would be much nicer
than inclusion:
=SML
include (* CNTypes CNBasicDeclsAndExprs CNTypes2 *) CNTypes1;
=TEX

\section{STRUCTURE OF VERIFICATION CONDITIONS}\label{VCSTRUCTURE}

This section implements section 2 of \cite[volume 2]{DRA/CIS/CSE3/TR/94/27/3.0}.

\subsection{Sequents}

=DOC
val ⦏⊢⦎ : Z_PRED list * Z_PRED -> SEQUENT;
=DESCRIBE
ⓈZ
function 30 _ ⦏⊢⦎ _
■

ⓈZAX
│	_ ⦏⊢⦎ _ : (ℙ Z_PRED × Z_PRED) → Sequent
├────────────────────
│	∀ Sequent ⦁ H ⊢ c = θ Sequent
■
=ENDDOC

=DOC
val ⦏⟹⦎ : Z_PRED * SEQUENT list -> SEQUENT list;
=DESCRIBE
ⓈZ
function 40 _ ⦏⟹⦎ _
■

ⓈZAX
│	_ ⦏⟹⦎ _ : (Z_PRED × ℙ Sequent) → ℙ Sequent
├────────────────────
│	∀ h : Z_PRED; S : ℙ Sequent ⦁
│	h ⟹ S = { Sequent | H ⊢ c ∈ S ⦁ ({h} ∪ H) ⊢ c }
■
=ENDDOC
ⓈZAX
│ ⦏add_hyps⦎ : ℙZ_PRED × ℙSequent → ℙSequent
├──────
│∀ new:ℙZ_PRED; S : ℙSequent⦁
│	add_hyps (new, S) =
│	{old: ℙZ_PRED; c : Z_PRED | old ⊢ c ∈ S⦁ (old ∪ new) ⊢ c}
■
ⓈZAX
│	⦏add_domain_conds⦎ : ℙZ_EXP × ℙSequent → ℙSequent
├
│ ∀zes : ℙZ_EXP; S : ℙSequent⦁
│	add_domain_conds(zes, S) = add_hyps(⋃(domain_conds⦇zes⦈), S)
■
ⓈZAX
│ ⦏add_hyps_to_side⦎ : ℙZ_PRED × ℙ(Sequent × ℙZ_ID)→ ℙ(Sequent × ℙZ_ID)
├──────
│∀ new:ℙZ_PRED; S : ℙ(Sequent × ℙZ_ID)⦁
│	add_hyps_to_side (new, S) =
│	{old: ℙZ_PRED; c : Z_PRED; w : ℙZ_ID | (old ⊢ c, w) ∈ S⦁ ((old ∪ new) ⊢ c, w)}
■

\subsection{Substitutions}

=DOC
val ⦏sub⦎ : Z_PRED * Z_ID * Z_EXP -> Z_PRED;
=DESCRIBE
ⓈZAX
│	⦏sub⦎ : (Z_PRED × Z_ID × Z_EXP) → Z_PRED
■
=ENDDOC

=DOC
val ⦏subs_exp⦎ : Z_EXP * Z_ID list * Z_ID list -> Z_EXP;
=DESCRIBE
ⓈZAX
│	⦏subs_exp⦎ : (Z_EXP × ℙ Z_ID × ℙ Z_ID) → Z_EXP
■
=ENDDOC

=DOC
val ⦏subs_pred⦎ : Z_PRED * Z_ID list * Z_ID list -> Z_PRED;
=DESCRIBE
ⓈZAX
│	⦏subs_pred⦎ : (Z_PRED × ℙ Z_ID × ℙ Z_ID) → Z_PRED
■
=ENDDOC

=DOC
val ⦏subseq⦎ : SEQUENT list * Z_ID * Z_EXP -> SEQUENT list;
=DESCRIBE
ⓈZAX
│	⦏subseq⦎ : (ℙ Sequent × Z_ID × Z_EXP) → ℙ Sequent
├───────────────
│	∀ S : ℙ Sequent; x : Z_ID; E : Z_EXP ⦁
│	   subseq (S,x,E) =
│		{ Sequent | H ⊢ c ∈ S ⦁ { h : H ⦁ sub (h,x,E)} ⊢ sub (c,x,E) }
■
=ENDDOC
=DOC
(* Flag ⦏cn_use_let_in_vcs⦎ - boolean control, default false *)
=DESCRIBE
This flag controls the way substitution of expressions for variables is treated during VC generation.

If the flag is false (the default), then the substitution is carried out using the HOL $subst$ function and then conversions are used to transform the result into Z: this results in a Z term in which the variables have actually been replaced by their substitutes, and declarations and other constructs have been adjusted as necessary to avoid variable capture.

If the flag is set true (using $set\_flag$), then a Z $let$ construct is used to give the semantics of substitution without actually replacing any variables with their substitutes.
This can help to abbreviate the VC and make its structure clearer.
=ENDDOC

\section{WEAKEST PRECONDITIONS}
This section implements section 4 of \cite[volume 2]{DRA/CIS/CSE3/TR/94/27/3.0}.
Note that the design for the datatypes is in \cite{ISS/HAT/DAZ/DTD514}. The type $RESULT$ is defined in that document.

\subsection{Null Statement}\label{wp-null}
=DOC
val ⦏null⦎ : WP_PARS -> RESULT
=DESCRIBE
┌⦏NULL⦎─────────────────
│	Pars
├───────────────
│	st = null;
│	WP = A;
│	SIDE = ∅;
│	MODIFIES = ∅
└─────────────────────
=ENDDOC

\subsection{Assignment Statement}\label{wp-assignment}


=DOC
val ⦏simple_assign⦎ : WP_PARS -> ID -> Z_EXP -> RESULT
=DESCRIBE
ⓈZAX
│ ⦏tmark_of_prefix⦎ : Z_EXP ⇸ TMARK
■
{\it tmark\_of\_prefix} is provided in \cite{ISS/HAT/DAZ/DTD508}, since
it is used in the translation of attributes.
ⓈZAX
│ ⦏slide_assign⦎ : Statement → Statement
├──────
│  slide_assign = (id Statement) ⊕
│ {st : Statement; Assign; Assign'; tm : TMARK
│  |	st = assign(θAssign) ∧ E ∉ ran auxiliary_exp ∧
│	tm = tmark_of_prefix(trans_exp name) ∧
│	name' = name ∧ E' = auxiliary_exp(slide_to_tmark(trans_exp E, tm))
│  ⦁	st ↦ assign(θAssign')}
■
{\it slide\_assign} is implicit in the implementation.
┌⦏SIMPLE_ASSIGN⦎────────────
│	Pars
├──────────────
│  ∃ Assign; x : ID; ze : Z_EXP ⦁
│	slide_assign st = assign(θ Assign) ∧ name = Id x ∧ ze = trans_exp E ∧
│	WP = add_domain_conds({ze}, subseq(A, trans_id x, ze)) ∧ SIDE = ∅ ∧
│	MODIFIES = {trans_id x}
└─────────────────────
=ENDDOC

=DOC
val ⦏array_assign⦎ : WP_PARS -> EXP INDEXED_COMP -> Z_EXP -> RESULT
=DESCRIBE
┌⦏ARRAY_ASSIGN⦎────────────
│	Pars
├──────────────
│   ∃ Assign; Indexed_Comp; Assign' ⦁
│		slide_assign st = assign(θ Assign) ∧
│		name = indexed_comp (θ Indexed_Comp) ∧
│		θ Result = wp (assign(θ Assign'), A, θWp_Env) ∧
│		name' = prefix ∧
│		E' =
│		auxiliary_exp
│		(z_override
│		   (trans_exp prefix,
│		    z_set {z_maplet(z_tuple(map trans_exp index), trans_exp E)} ))
└─────────────────────
=ENDDOC


=DOC
val ⦏z_record_update⦎ : TMARK * ID * Z_EXP * Z_EXP -> Z_EXP;
=DESCRIBE
ⓈZAX
│ ⦏z_record_update⦎ : TMARK × ID × Z_EXP × Z_EXP → Z_EXP
■
=ENDDOC


=DOC
val ⦏record_assign⦎ : WP_PARS -> EXP SELECTED_COMP -> Z_EXP -> RESULT;
=DESCRIBE
┌⦏RECORD_ASSIGN⦎────────
│	Pars
├─────
│   ∃ Assign; Selected_Comp; Assign'; zprefix : Z_EXP ⦁
│	slide_assign st = assign(θ Assign) ∧
│	name = selected_comp (θ Selected_Comp) ∧
│	θ Result = wp (assign (θ Assign'), A, θWp_Env) ∧
│	name' = prefix ∧
│	zprefix = trans_exp prefix ∧
│	E' = auxiliary_exp(z_record_update(tmark_of_prefix zprefix, selector,
│		zprefix, trans_exp E))
└────────────────
=FAILURE
505027	The operand of the component selection is not a record
505028	Type error on left-hand side of assignment statement
=ENDDOC

=DOC
val ⦏assign⦎ : WP_PARS -> EXP * Z_EXP -> RESULT
=DESCRIBE
$assign$ recognises the kind of assignment statement by looking at the LHS supplied as $EXP$, and calls the appropriate function, i.e., $simple\_assign$, $array\_assign$ or $record\_assign$, to generate the wp.
=FAILURE
505029	the lhs of the assignment statement is not an assignable identifier
=ENDDOC

\subsection{Specification Statement (No initial variables)} \label{wp-specification-no-ivars}

=DOC
(* val ⦏spec_no_ivars⦎ : WP_PARS -> Z_EXP * Z_EXP -> RESULT   *)
=DESCRIBE
┌⦏SPEC_NO_IVARS⦎────────────
│	Pars
├──────────────
│   ∃ Spec_No_Ivars ⦁
│	st = spec_no_ivars (θ Spec_No_Ivars) ∧ w ≠ ∅ ∧
│	WP = { ∅ ⊢ Pre } ∧
│	SIDE = {s : post ⟹ A ⦁ (s, w)} ∧
│	MODIFIES = w
└─────────────────────
=ENDDOC

=DOC
val ⦏spec_no_ivars_empty⦎ : WP_PARS -> Z_EXP * Z_EXP -> RESULT
=DESCRIBE
┌⦏SPEC_NO_IVARS_EMPTY⦎────────────
│	Pars
├──────────────
│   ∃ Spec_No_Ivars ⦁
│	st = spec_no_ivars (θ Spec_No_Ivars) ∧ w = ∅ ∧
│	WP = { ∅ ⊢ Pre } ∪ post ⟹ A ∧ SIDE = ∅ ∧
│	MODIFIES = ∅
└─────────────────────
=ENDDOC

=DOC
val ⦏spec_no_ivars_either⦎ :
	WP_PARS -> Z_ID list -> Z_EXP * Z_EXP -> RESULT
=DESCRIBE
$spec\_no\_ivars\_either$ calls $spec\_no\_ivars\_empty$ or $spec\_no\_ivars$ depending on whether the frame is empty.
=ENDDOC

\subsection{Semicolon}\label{wp-semicolon}

=DOC
val ⦏semicolon⦎ : WP_PARS -> STATEMENT * STATEMENT -> RESULT
=DESCRIBE
┌⦏Results⦎────────────
│	Result';
│	Result''
└─────────────────────
┌⦏SEMICOLON⦎────────────
│	Pars
├──────────────
│   ∃ P, Q : Statement; Results ⦁
│	st = semicolon (P, Q) ∧ WP = WP' ∧
│	SIDE = SIDE' ∪ {sw : SIDE''⦁(sw.1, sw.2 ∪ MODIFIES')} ∧
│	MODIFIES = MODIFIES' ∪ MODIFIES'' ∧
│	θ Result' = wp (P, WP'', θ Wp_Env) ∧
│	θ Result'' = wp (Q, A, θ Wp_Env)
└─────────────────────
=ENDDOC

\subsection{If Statement}\label{wp-if-then-else}


=DOC
val ⦏if_then_else⦎ : WP_PARS -> STATEMENT IF_THEN_ELSE -> RESULT
=DESCRIBE
ⓈZAX
│	⦏TRUE⦎, ⦏FALSE⦎ : Z_ID
■
┌⦏IF_THEN_ELSE⦎────────────
│	Pars
├──────────────
│   ∃ If_Then_Else; Results; ze : Z_EXP ⦁
│	st = if_then_else (θ If_Then_Else) ∧
│	ze = trans_exp G ∧
│	WP = add_domain_conds({ze},
│		z_eq (ze, zid TRUE) ⟹ WP' ∪
│	 	z_eq (ze, zid FALSE) ⟹ WP'') ∧
│	SIDE = SIDE' ∪ SIDE'' ∧
│	MODIFIES = MODIFIES' ∪ MODIFIES'' ∧
│	θ Result' = wp (P, A, θWp_Env) ∧
│	θ Result'' = wp (Q, A, θWp_Env)
└─────────────────────
=ENDDOC

\subsection{Case Statement}\label{wp-case}


=DOC
val ⦏trans_case_choices⦎ : CN_ENV -> CASE_CHOICE list -> Z_EXP
=DESCRIBE
ⓈZAX
│	⦏trans_case_choices⦎ : ℙ CASE_CHOICE → Z_EXP
├────────────────────────────
│ ∀ choices : ℙ CASE_CHOICE ⦁
│   ∃ zranges : ℙ Z_EXP; zsingles : Z_EXP ⦁
│	zranges =
│	{ Range | case_range (θ Range) ∈ choices ⦁
│		z_rng (trans_exp lo, trans_exp hi) } ∧
│	zsingles =
│	z_set {ex : EXP | case_exp ex ∈ choices ⦁ trans_exp ex } ∧
│	trans_case_choices choices = z_many_union (zranges ∪ {zsingles} )
■
=FAILURE
505020	VCs cannot be generated for a statement containing a range attribute
=ENDDOC



=DOC
val ⦏case_base⦎ :
	WP_PARS -> EXP -> int -> STATEMENT CASE_ALTERNATIVE ->
	RESULT * Z_EXP
=DESCRIBE
The implementation returns the translated case choices to save having
to recompute it in {\it case\_others}.
┌⦏Case_Base⦎────────────
│	Case;
│	Case_Alternative[Statement]
├──────────────
│	s = ⟨ θ(Case_Alternative[Statement]) ⟩
└─────────────────────
┌⦏CASE_BASE⦎────────────
│	Pars
├──────────────
│   ∃ Case_Base; Result'; ze, zcs : Z_EXP⦁
│	st = case (θ Case) ∧
│	ze = trans_exp E ∧ zcs = trans_case_choices choices ∧
│	WP = add_domain_conds({ze, zcs},
│		z_elem (ze, zcs) ⟹ WP') ∧
│	SIDE = SIDE' ∧ MODIFIES = MODIFIES' ∧
│	θ Result' = wp (P, A, θ Wp_Env)
└─────────────────────
=ENDDOC

=DOC
val ⦏case_step⦎ : WP_PARS -> int -> STATEMENT CASE -> RESULT * Z_EXP list

=DESCRIBE
┌⦏Case_Step⦎────────────
│	Case;
│	Case_Alternative[Statement];
│	Case'
├──────────────
│	E = E';
│	s = ⟨ θ(Case_Alternative[Statement]) ⟩ ⁀ s'
└─────────────────────
┌⦏CASE_STEP⦎────────────
│	Pars
├──────────────
│ ∃ Case_Step; Results; ze, zcs : Z_EXP ⦁
│	st = case (θ Case)
│ ∧	ze = trans_exp E ∧ zcs = trans_case_choices choices
│ ∧	WP = add_domain_conds({ze, zcs},
│		z_elem (trans_exp E, trans_case_choices choices) ⟹ WP') ∪ WP''
│ ∧	SIDE = SIDE' ∪ SIDE''
│ ∧	MODIFIES = MODIFIES' ∪ MODIFIES''
│ ∧	θ Result' = wp (P, A, θ Wp_Env)
│ ∧	θ Result'' = wp (case (θ Case'), A, θWp_Env)
└─────────────────────
=FAILURE
505030	Internal error: case statement with no alternatives found
=ENDDOC

=DOC
val ⦏case_others⦎ : WP_PARS -> STATEMENT CASE -> RESULT
=DESCRIBE
The implementation
of {\it case\_others} is analogous to {\it spec\_no\_ivars\_either} in that it is sensitive to the input and processes a case statement with or without an others part
using {\it case\_step} to do the work directly that the first recursive
call in the Z would do less directly.
┌⦏CASE_OTHERS⦎────────────
│	Pars
├──────────────
│   ∃ Case_Others; Results; ze : Z_EXP; exps : ℙZ_EXP ⦁
│	st = case_others (θ Case_Others) ∧
│	WP = WP' ∪ add_domain_conds({ze} ∪ exps,
│		z_notelem(ze, z_many_union exps) ⟹ WP'') ∧
│	SIDE = SIDE' ∪ SIDE'' ∧
│	MODIFIES = MODIFIES' ∪ MODIFIES'' ∧
│	ze = trans_exp E ∧
│	exps = {alt : ran s⦁ trans_case_choices(alt.choices)} ∧
│	θ Result' = wp (case (θ Case), A, θWp_Env) ∧
│	θ Result'' = wp (Q, A, θ Wp_Env)
└─────────────────────
=FAILURE
505030	Internal error: case statement with no alternatives found
=ENDDOC


\subsection{Undecorated Loop}\label{wp-loop}

$named\_loop$ below is required to handle named loops. Its semantics are the same as for $loop$.
=DOC
val ⦏loop⦎ : WP_PARS -> STATEMENT LOOP -> RESULT
=DESCRIBE
┌⦏LOOP⦎────────────
│	Pars
├──────────────
│   ∃ Loop ⦁
│	st = loop (θ Loop) ∧ WP = {∅ ⊢ Pre} ∧
│	SIDE = {s : { {post} ⊢ Pre } ∪ T ⟹ A⦁ (s, w)} ∧
│	MODIFIES = w
└─────────────────────
=FAILURE
505022	VCs cannot be generated for a loop whose body is not a
	specification statement
=ENDDOC

\subsection{While Loop}\label{wp-while-loop}

$while$ is a reserved word in Standard ML; hence we use the name $cn\_while$.

=DOC
val ⦏cn_while⦎ : WP_PARS -> STATEMENT WHILE -> RESULT
=DESCRIBE
┌⦏WHILE⦎────────────
│	Pars
├──────────────
│   ∃ While; ze : Z_EXP ⦁
│	st = while (θ While) ∧
│	WP = add_domain_conds({ze},
│		{ {z_eq(trans_exp G, zid TRUE)} ⊢ Pre} ∪
│		z_eq(trans_exp G, zid FALSE) ⟹ A) ∧
│	SIDE = {s : post ⟹ WP ∪ T ⟹ A⦁ (s, w)} ∧
│	MODIFIES = w ∧
│	ze = trans_exp G
└─────────────────────
=FAILURE
505022	VCs cannot be generated for a loop whose body is not a
	specification statement
=ENDDOC


=TEX
\subsection{For Loop (Static Bounds)}\label{wp-for-value}

=DOC
val ⦏for_static⦎ : WP_PARS -> STATEMENT FOR_STATIC -> RESULT
=DESCRIBE
If the loop does not contain a $till$ predicate, then $T ⟹ A$ is removed from $SIDE$.

┌⦏FOR_STATIC⦎────────────
│	Pars
├──────────────
│   ∃ For_Static; Z_Bin_Exp; zi : Z_ID; zlo, zhi, zinitial, zfinal : Z_EXP;
│	zran : Z_PRED ⦁
│	st = for_static (θ For_Static) ∧
│	WP = add_domain_conds({zlo, zhi},
│		{ { z_less_eq (zlo, zhi)} ⊢ sub (Pre, zi, zinitial) } ∪
│			z_greater (zlo, zhi) ⟹ A) ∧
│	SIDE = {s : add_domain_conds({zlo, zhi},
│		{ { zran, z_noteq(zid zi, zfinal), post } ⊢
│			sub(Pre, zi, z_bin_exp (θ Z_Bin_Exp))} ∪
│			sub(post, zi, zfinal) ⟹ A ∪
│			zran ⟹ (T ⟹ A))⦁ (s, w)} ∧
│	zran = z_elem (zid zi, z_rng (zlo, zhi)) ∧
│	zi = trans_id i ∧ zlo = trans_exp lo ∧ zhi = trans_exp hi ∧
│	(dir = Forwards ∧ zinitial = zlo ∧ zfinal = zhi ∧ zop = z_add ∨
│	 dir = Reverse ∧ zinitial = zhi ∧ zfinal = zlo ∧ zop = z_minus) ∧
│	zleft = zid zi ∧ zright = z_num 1 ∧
│	MODIFIES =  w
└─────────────────────
=FAILURE
505020	VCs cannot be generated for a statement containing a range attribute
505022	VCs cannot be generated for a loop whose body is not a
	specification statement
=ENDDOC

\subsection{For Loop (Type Mark as Range)}\label{wp-for-tmark}


=DOC
val ⦏for_tmark⦎ : WP_PARS -> STATEMENT FOR_TMARK -> RESULT
=DESCRIBE
┌⦏FOR_TMARK⦎────────────
│	Pars
├──────────────
│   ∃ For_Tmark; Z_Bin_Exp; zi : Z_ID; zlo, zhi, zinitial, zfinal : Z_EXP;
│	zran : Z_PRED ⦁
│	st = for_tmark (θ For_Tmark) ∧
│	WP =
│	{ { z_less_eq (zlo, zhi)} ⊢ sub (Pre, zi, zinitial) } ∪
│	z_greater (zlo, zhi) ⟹ A ∧
│	SIDE =
│	{s : { { z_noteq(zid zi, zfinal), post } ⊢
│		sub(Pre, zi, z_bin_exp (θ Z_Bin_Exp))} ∪
│		sub(post, zi, zfinal) ⟹ A ∪
│		T ⟹ A⦁ (s, w)} ∧
│	zi = trans_id i ∧ zlo = zid (trans_id tmark ^ zfst) ∧
│	zhi = zid (trans_id tmark ^ zlst) ∧
│	(dir = Forwards ∧ zinitial = zlo ∧ zfinal = zhi ∧ zop = z_add ∨
│	 dir = Reverse ∧ zinitial = zhi ∧ zfinal = zlo ∧ zop = z_minus) ∧
│	zleft = zid zi ∧ zright = z_num 1 ∧
│	MODIFIES =  w
└─────────────────────
=FAILURE
505022	VCs cannot be generated for a loop whose body is not a
	specification statement
=ENDDOC

\subsection{Exit Statement (with Condition)}\label{wp-exit-with-cond}



=DOC
val ⦏exit_when⦎ : WP_PARS -> EXIT_WHEN -> RESULT
=DESCRIBE
┌⦏EXIT_WHEN⦎──────
│	Pars
├──────────────
│   ∃ Exit_When; ze : Z_EXP; till_pred : Z_PRED⦁
│	st = exit_when (θ Exit_When) ∧
│	(	(∃n:ID⦁ N = Value n ∧ n ↦ till_pred ∈ named_tills)
│	 ∨	(N = Nil ∧ till_pred = till)) ∧
│	WP = add_domain_conds({ze},
│		{ { z_eq (trans_exp G, zid TRUE) } ⊢ till_pred} ∪
│		z_eq (ze, zid FALSE)  ⟹ A) ∧
│	ze = trans_exp G ∧
│	SIDE = ∅ ∧ MODIFIES = ∅
└─────────────────
=FAILURE
505069	An EXIT statement with a loop name is only allowed inside a LOOP
	with that name and with a TILL predicate; there is no
	TILL predicate associated with the loop name ?0
=ENDDOC

\subsection{Exit Statement}\label{wp-exit}

$exit$ is already bound in {\Product}; hence we use $cn\_exit$.
=DOC
val ⦏cn_exit⦎ : WP_PARS -> EXIT -> RESULT
=DESCRIBE
┌⦏EXIT⦎────────────
│	Pars
├──────────────
│   ∃ Exit; till_pred : Z_PRED⦁
│	st = exit (θ Exit) ∧
│	(	(∃n:ID⦁ N = Value n ∧ n ↦ till_pred ∈ named_tills)
│	 ∨	(N = Nil ∧ till_pred = till)) ∧
│	WP = { ∅ ⊢ till_pred} ∧
│	SIDE= ∅ ∧ MODIFIES = ∅
└─────────────────────
=ENDDOC

\subsection{Return Statement}\label{wp-return}

$return$ was formerly throught to be bound elsewhere in {\Product}; hence we use $cn\_return$.
=DOC
val ⦏cn_return⦎ : WP_PARS -> RETURN -> RESULT
=DESCRIBE
┌⦏FUN_RETURN⦎────────────
│	Pars
├──────────────
│   ∃ Return; Z_Fun_Call; Informal_Fun; ze : Z_EXP; e : EXP ⦁
│	E = Value e ∧
│	st = ret (θ Return) ∧
│	WP = add_domain_conds({ze},
│		{ { z_eq (z_fun_call (θ Z_Fun_Call), ze) } ⊢ return }) ∧
│	SIDE = ∅ ∧ MODIFIES = ∅ ∧
│	fun_header = θ Informal_Fun ∧
│	ze = slide_to_tmark(trans_exp e, return_type) ∧
│	zfun = zid (trans_id name) ∧
│	zargs = { i : dom formal_pars ⦁ i ↦zid (trans_id (formal_pars i).var) }
└─────────────────────
┌⦏PROC_RETURN⦎────────────
│	Pars
├──────────────
│   ∃ Return; Z_Fun_Call; Informal_Fun; ze : Z_EXP; e : EXP ⦁
│	E = Nil ∧
│	st = ret (θ Return) ∧
│	WP = {  ∅ ⊢ return } ∧
│	SIDE = ∅ ∧ MODIFIES = ∅
└─────────────────────
ⓈZ
│ ⦏RETURN⦎ ≜ FUN_RETURN ∨ PROC_RETURN
■


=ENDDOC

\subsection{Procedure Call (No Initial Variables in Spec)} \label{wp-proc-call-no-ivars}


=DOC
val ⦏proc_call_spec⦎ : CN_ENV -> (AGG_CHOICE, EXP) PROC_CALL -> FORMAL_PROC ->
		SPEC * STATEMENT * Z_PRED list * Z_PRED list;
val ⦏ti_context_of_formal_proc⦎ : CN_ENV -> FORMAL_PROC -> TERM list;
val ⦏get_proc_spec⦎ : string -> CN_ENV ->  ID -> FORMAL_PROC;
=DESCRIBE
ⓈZAX
│	⦏proc_call_spec⦎ :
│		(Proc_Call × Formal_Proc) ⇸ Spec × Statement × ℙZ_PRED
■
ⓈZAX
│	⦏proc_call_range_checks⦎ : (Proc_Call × Formal_Proc) ⇸ ℙSequent
■
In the implementation, the functionality of {\it proc\_call\_range\_checks}
is carried out by {\it proc\_call\_spec}.

{\it ti\_context\_of\_formal\_proc} and {get\_proc\_spec} are utilities which this module exports
for the convenience of the Z Generator.
=FAILURE
505026	Call to ?0 does not match its declaration
505031	?0 has not been declared as a formal procedure
=ENDDOC

=DOC
val ⦏proc_call_no_ivars⦎ : WP_PARS -> (AGG_CHOICE, EXP) PROC_CALL
							-> RESULT
=DESCRIBE
┌⦏PROC_CALL_NO_IVARS⦎────────────
│	Pars
├──────────────
│   ∃ pc : Proc_Call; fp : Formal_Proc; Result';
│	Spec; asgns : Statement; dcs : ℙZ_PRED; rng_vcs : ℙSequent ⦁
│	st = proc_no_ivars pc ∧
│	fp ∈ formal_procs ∧ fp.name = pc.name ∧
│	(θSpec, asgns, dcs) = proc_call_spec (pc, fp) ∧
│	rng_vcs = proc_call_range_checks (pc, fp) ∧
│	θ Result' =
│	wp (semicolon(spec_no_ivars (θSpec), asgns), A, θ Wp_Env) ∧
│	WP = add_hyps(dcs, WP') ∧
│	SIDE = add_hyps_to_side(dcs, SIDE') ∪
│		{s : add_hyps(dcs, rng_vcs)⦁ (s, ∅)} ∧
│	MODIFIES = w
└─────────────────────
=ENDDOC

\subsection{Specification (With Initial Variables)}\label{wp-spec-ivars}

=DOC
(* val ⦏spec_ivars⦎ : WP_PARS -> (Z_EXP * Z_EXP) -> RESULT  *)
=DESCRIBE
┌⦏SPEC_IVARS⦎────────────
│	Pars
├──────────────
│   ∃ Spec_Ivars ⦁
│	st = spec_ivars (θ Spec_Ivars) ∧ WP = {∅ ⊢ Pre} ∧
│	SIDE = {s : post ⟹ A⦁ (s, w)} ∧
│	MODIFIES = w
└─────────────────────
=ENDDOC

\subsection{For Loop (Non-Static Bounds)}\label{wp-for-var}

=DOC
val ⦏for_non_static⦎ : WP_PARS -> STATEMENT FOR_NON_STATIC -> RESULT
=DESCRIBE
┌⦏FOR_NON_STATIC⦎────────────
│	Pars
├──────────────
│ ∃ For_Non_Static; Z_Bin_Exp; zi : Z_ID;
│   zlo, zhi, zlo⋎0, zhi⋎0, zinitial⋎0, zfinal⋎0 : Z_EXP; zran : Z_PRED ⦁
│	st = for_non_static (θ For_Non_Static) ∧
│	WP = add_domain_conds({zlo, zhi},
│		{ {z_less_eq (zlo, zhi)} ⊢  sub (Pre, zi, zlo)} ∪
│		z_greater (zlo, zhi) ⟹ A) ∧
│	SIDE = {s : add_domain_conds({zlo⋎0, zhi⋎0},
│		{ { zran, z_noteq (zid zi, zfinal⋎0), post} ⊢
│			sub (Pre, zi, z_bin_exp (θ Z_Bin_Exp))} ∪
│			sub(post, zi, zfinal⋎0) ⟹ A) ∪
│		add_domain_conds({zlo⋎0, zhi⋎0},
│			zran ⟹ (T ⟹ A))⦁ (s, w)} ∧
│	zi = trans_id i ∧ zlo = trans_exp lo ∧ zhi = trans_exp hi ∧
│	(dir = Forwards ∧ zinitial⋎0 = zlo⋎0 ∧ zfinal⋎0 = zhi⋎0 ∧ zop = z_add ∨
│	 dir = Reverse ∧  zinitial⋎0 = zhi⋎0 ∧ zfinal⋎0 = zlo⋎0 ∧ zop = z_minus) ∧
│	zleft = zid zi ∧ zright = z_num 1 ∧
│	zlo⋎0 = subs_exp (zlo, w, w⋎0) ∧
│	zhi⋎0 = subs_exp (zhi, w, w⋎0) ∧
│	zran = z_elem (zid zi, z_rng (zlo⋎0, zhi⋎0)) ∧
│	MODIFIES = w
└─────────────────────
=FAILURE
505020	VCs cannot be generated for a statement containing a range attribute
505022	VCs cannot be generated for a loop whose body is not a
	specification statement
=ENDDOC

\subsection{Logical Constant}\label{wp-log-con}


=DOC
val ⦏analyse_log_con⦎ :
	LOG_CON_DEF list -> Z_PRED -> LOG_CON_DEF list * Z_PRED
=DESCRIBE
$analyse\_log\_con$ $c$ $pre$ breaks down a precondition, $pre$ associated with a logical constant specification statement and returns the constituent parts.
It takes the information from the declarations of the logical constants
(with dummy defining terms inserted by the parser)
together with a pre-conditions of the form
=INLINEFT
x1 = E1 ∧ x2 = E2 ∧ ... pre1
=TEX
and yields an updated set of {\it LOG\_CON\_DEF}s with
the proper defining terms in the proper order
together with a predicate containing $pre1$.
It will fail if $pre$ is not of the right form or if the declarations don't agree in
number and names with the defining equations or if the equations violate the definition
before use rule.
=USES
It is used by the $log\_con$ function in the process of generating VCs for logical constants.
=FAILURE
505024	Logical constant statement with precondition ?0 does not have the required form
	CON x1 : t1; x2 : t2; ... ⦁ Δ w [x1 = E1 ∧ x2 = E2 ∧ ... ∧ pre1, post]
505025	In a logical constant statement:
	CON x1 : t1; x2 : t2; ... ⦁ Δ w [x1 = E1 ∧ x2 = E2 ∧ ... ∧ pre1, post]
	x1 must not appear free in E1, x2 must not appear free
	in E1 or E2 and so on; here ?0 appears free in ?1
=ENDDOC
ⓈZAX
│ ⦏z_log_con_def⦎ : ℙZ_ID × ℙZ_ID → Log_Con_Def → Z_PRED
├──────
│ ∀ u, v : ℙZ_ID; Log_Con_Def⦁
│	z_log_con_def(u,v)(θLog_Con_Def) = z_eq(zid X, subs_exp(E, u, v))
■

=DOC
val ⦏log_con⦎ : WP_PARS -> LOG_CON -> RESULT
=DESCRIBE
┌⦏LOG_CON⦎────────────
│	Pars
├──────────────
│∃ Log_Con ⦁
│	st = log_con (θ Log_Con) ∧
│	WP = { z_log_con_def(∅, ∅)⦇ ran defs ⦈ ⊢ pre⋎1}  ∪
│		{  i : 1 .. #defs
│		⦁  z_log_con_def(∅, ∅)⦇ defs ⦇1..i-1⦈ ⦈
│		 ⊢ z_mem((defs i).E, (defs i).T) }
│ ∧	SIDE = {s : add_hyps(z_log_con_def(w, w⋎0)⦇ran defs⦈,
│			post ⟹ A)⦁ (s, w)}
│ ∧	MODIFIES = w
└─────────────────────
=ENDDOC

\subsection{Procedure Call (Initial Variables in Spec)} \label{wp-proc-call-ivars}

=DOC
val ⦏proc_call_ivars⦎ : WP_PARS -> (AGG_CHOICE, EXP) PROC_CALL
							-> RESULT
=DESCRIBE
┌⦏PROC_CALL_IVARS⦎────────────
│	Pars
├──────────────
│   ∃ pc : Proc_Call; fp : Formal_Proc; Result';
│	Spec; asgns : Statement; dcs : ℙZ_PRED; rng_vcs : ℙSequent ⦁
│	st = proc_ivars pc ∧
│	fp ∈ formal_procs ∧ fp.name = pc.name ∧
│	(θSpec, asgns, dcs) = proc_call_spec (pc, fp) ∧
│	rng_vcs = proc_call_range_checks (pc, fp) ∧
│	θ Result' =
│	wp (semicolon(spec_ivars (θSpec), asgns), A, θ Wp_Env) ∧
│	WP = add_hyps(dcs, WP') ∧
│	SIDE = add_hyps_to_side(dcs, SIDE') ∪
│		{s : add_hyps(dcs, rng_vcs)⦁ (s, ∅)} ∧
│	MODIFIES = w
└─────────────────────
=ENDDOC

\subsection{The Function $wp$}\label{wp}

=DOC
val ⦏wp⦎ : STATEMENT * SEQUENT list * WP_ENV -> RESULT
=DESCRIBE
{\def\PrNL#1\PrNN{\relax}
ⓈZ
│   ∀Pars⦁
│	wp (st, A, θWp_Env) = θ Result
│⇔	NULL ∨ SIMPLE_ASSIGN ∨ ARRAY_ASSIGN ∨ RECORD_ASSIGN ∨
│	SPEC_NO_IVARS ∨ SPEC_NO_IVARS_EMPTY ∨ SEMICOLON ∨
│	IF_THEN_ELSE ∨ CASE_BASE ∨ CASE_STEP ∨ CASE_OTHERS ∨
│	LOOP ∨ WHILE ∨ FOR_STATIC ∨ FOR_TMARK ∨
│	EXIT_WHEN ∨ EXIT ∨ RETURN ∨
│	PROC_CALL_NO_IVARS ∨ FOR_NON_STATIC ∨ SPEC_IVARS ∨
│	LOG_CON ∨ PROC_CALL_IVARS ⦏(*⦎⦏wpconstraint⦎⦏*)⦎
■
}
=FAILURE
505040	VCs cannot be generated for a k-slot statement
=ENDDOC

\section{ADJUSTING STATEMENTS}

=DOC
val ⦏adjust_statement⦎ : WP_ENV -> STATEMENT -> STATEMENT
=DESCRIBE
$adjust\_statement$ takes a statement (represented as abstract syntax) and transforms the data representation according to the following rules depending on the data constructor of the statement within the outermost $SStmt$.
{\raggedright
\begin{description}
\item[STSpecNoIVars]
If the statement is a specification statement then it checks if there are any initial variables used in the post-condition. If so the statement is converted to a $SpecIVars$.
\item[STForStatic]
If the for-loop is non-static then the abstract syntax is converted to a $STForNonStatic$.
\item[STProcNoIvars]
If the procedure contains initial variables, then the statement is transformed into a SProcIvars.
\item[STSemicolon]
If the statement comprises a sequence of statements, then the tree of statements is traversed until the first actual statement is found, this is adjusted.
\end{description}}

The function also makes the checks which detect the following error conditions
(corresponding to the new check 17.1.1.20, and the check implicit in
the predicate of the schema {\it Spec} in \cite[volume 2]{DRA/CIS/CSE3/TR/94/27/3.0}).
=FAILURE
505091	A specification statement containing initial variables may only
	appear as the first statement in a sequence of statements and may
	not be used as the body of a loop
505092	A for loop with non-static bounds may only
	appear as the first statement in a sequence of statements
505093	A call to a procedure whose specification statement contains initial
	variables may only appear as the first statement in a
	sequence of statements
505094	A logical constant statement may only appear as the first statement in a
	sequence of statements
505095	The pre-condition of a specification statement must not contain initial variables
505096	A block statement can only appear in a refinement step as the
	only statement in the step
505097	Initial variables corresponding to out mode parameters are not allowed.
	?0 is not allowed here
505098	Goto statements cannot be handled formally
=ENDDOC
=TEX
\pagebreak
\section{APPLICATION OF CHECKS}\label{APPLICATIONOFCHECKS}

In \cite[volume 1]{DRA/CIS/CSE3/TR/94/27/3.0} various checks are specified. The checks appropriate to VC generation are carried out by the functions described below:

=DOC
val ⦏checking_error⦎ : string -> int -> (unit -> string) list -> unit
=DESCRIBE
This is the error handling function which is called when a violation of one of the checks is detected.
=FAILURE
505050	VC Soundness Check failed:
=ENDDOC

=DOC
val ⦏check_1_a⦎ : CN_ENV -> (ID list * SPECLAB) -> unit
=DESCRIBE
This implements check 17.1.1.1 (a).
=FAILURE
505060	Each variable whose value could be changed by a refinement step
	must appear (implicitly or explicitly) in the frame
	of the specification statement being refined.
	This refinement step refines a specification statement with no
	variables in its frame but could change the value of ?0.
505064	Each variable whose value could be changed by a refinement step
	must appear (implicitly or explicitly) in the frame
	of the specification statement being refined.
	This refinement step refines a specification statement with a frame
	comprising ?0 but could change the value of ?1.
505065	The statement contains the variable?0 ?1 that is not
	in scope in the Ada program
505080	An invalid expression has been encountered on the left-hand side
	of an assignment or as an out or in out mode parameter
=ENDDOC

=DOC
val ⦏check_1_b⦎ : SPECLAB * EXP OPT -> unit
=DESCRIBE
This implements check 17.1.1.1 (b)
=FAILURE
505058	A RETURN statement that does not return a value
	may only appear in the body of a procedure
505059	A RETURN statement that returns a value may only
	appear in the body of a function
505061	To be handled formally a RETURN statement
	can only appear in the body of a subprogram
	with a formal specification.
=ENDDOC

=DOC
val ⦏check_1_c⦎ : SPECLAB -> unit;
=DESCRIBE
This implements check 17.1.1.1 (c)
=FAILURE
505062	An EXIT statement can only appear in a LOOP whose exit condition is
	expressed within a TILL clause.
=ENDDOC

=DOC
val ⦏check_1_d⦎ : (ID * SPECLAB) -> unit;
=DESCRIBE
This implements check 17.1.1.1 (d)
=FAILURE
505063	For ?0: a procedure call can only appear if the procedure has a formal
	specification.
=ENDDOC

=DOC
val ⦏check_19⦎ : CN_ENV ->
	{globals : Z_ID list, pars : Z_ID list, name : ID} OPT -> SPEC -> unit;
=DESCRIBE
This implements check 17.1.1.19.
The second argument is the global dependencies list to be checked, if any.
=FAILURE
505082	The variables in the frame of a specification statement
	must be in scope.
	The following variable?0 ?1 not in scope:
505083	Ada names in the frame of a specification statement
	must be given in the canonical form.
	The following name?0 ?1 not in canonical form:
505084	The names in the frame of a specification statement
	must be variables.
	The following names?0 ?1 are not variables:
505085	Invalid frame
505086	The variables in the global dependency list of
	a subprogram must be in scope.
	The following variable?0 ?1 not in scope:
505087	Ada names in the global dependency list of
	a subprogram must be given in the canonical form.
	The following name?0 ?1 not in canonical form:
505088	The names in the global dependency list of
	a subprogram must be variables.
	The following names?0 ?1 are not variables:
505089	Invalid global dependency list
505090	The formal parameters of a subprogram must not appear in
	its global dependency list. The global dependency list of ?2
	contains the formal parameter?0 ?1
=ENDDOC
=DOC
val ⦏check_21⦎ : CN_ENV -> FORMAL_PROC -> unit;
=DESCRIBE
This implements check 21.
=FAILURE
505042	In a procedure call, each variable in the global dependency
	list of the called procedure must appear in the frame of
	the specification statement being refined or in the
	global dependency list of the calling subprogram.
	The global dependency list of procedure ?2 contains
	the variable?0 ?1 violating this rule
505043	The variable ?0 appearing in the global dependency list
	of the procedure ?1 is not in scope.
=ENDDOC


\subsection{Anti-Aliasing Checks}
=DOC
val ⦏anti_aliasing_pars⦎ : FORMAL_PROC -> (AGG_CHOICE,EXP) PROC_CALL ->
					ID list * ID list
=DESCRIBE
ⓈZAX
│	⦏free_vars_zpred⦎ : Z_PRED → ℙ Z_ID
■
┌⦏Anti_Aliasing_Pars⦎────────
│	Formal_Proc;
│	Proc_Call;
│	formals : ℙ ID
├─────────────
│	formals = {par : ran formal_ids ⦁ par.var}
└────────────────────
=FAILURE
505067	There is no specification statement for the procedure ?0
505068	The number of actuals provided does not match those in the declaration of ?0
=ENDDOC

=DOC
val ⦏vars_exp⦎ : CN_ENV -> EXP -> ID list
=DESCRIBE
ⓈZAX
│	⦏entire_var_exp⦎ : EXP ⇸ ID
■
ⓈZAX
│	⦏other_vars_exp⦎ : EXP → ℙ ID
■
ⓈZAX
│	⦏vars_exp⦎ : EXP → ℙ ID
├
│	∀e : EXP⦁ vars_exp e = other_vars_exp e ∪  entire_var_exp⦇{e}⦈
■
Only {\it vars\_exp} is exposed in the interface to
the structure since that is sufficient for testing.
=ENDDOC

=DOC
val ⦏anti_aliasing_check_1⦎ :
	SPECLAB -> FORMAL_PROC -> (AGG_CHOICE, EXP) PROC_CALL ->
	(EXP * MODE) list -> unit
=DESCRIBE
┌⦏Anti_Aliasing_Check_1⦎────────
│	Anti_Aliasing_Pars
├─────────────
│	( ran globals \ trans_id ⦇ formals ⦈ ) ∩
│	{i : dom actuals | (formal_ids i).mode ∈ {in_out, out}
│		⦁ trans_id(entire_var_exp (actuals i))} = ∅
└────────────────────
=FAILURE
505070	In a procedure call each actual parameter of mode OUT or IN OUT must
	be a variable or be formed from a variable using array indexing
	and/or record component selection.
	Procedure ?0 has been passed an invalid actual parameter
505071	In a procedure call, a variable in the frame or global dependencies list
	of the procedure must not appear as the entire variable in an actual parameter
	of mode OUT or IN OUT.
	The variable?0 ?1 in a call of the procedure ?2 violated this rule
=ENDDOC

=DOC
val ⦏anti_aliasing_check_2⦎ :
	SPECLAB -> FORMAL_PROC -> (AGG_CHOICE, EXP) PROC_CALL ->
	(EXP * MODE) list -> unit
=DESCRIBE
┌⦏Anti_Aliasing_Check_2⦎────────
│	Anti_Aliasing_Pars
├─────────────
│	( w \ trans_id ⦇ formals ⦈ ) ∩
│	trans_id ⦇ ⋃(vars_exp⦇ran actuals⦈) ⦈ = ∅
└────────────────────
=FAILURE
505072	In a procedure call, a variable that appears in the frame of the
	procedure must not appear anywhere in the actual parameter list.
	The variable?0 ?1 in a call of the procedure ?2 violated this rule
=ENDDOC

=DOC
val ⦏anti_aliasing_check_3⦎ :
		SPECLAB -> FORMAL_PROC ->
		(AGG_CHOICE, EXP) PROC_CALL ->
		(EXP * MODE) list -> unit
=DESCRIBE
┌⦏Anti_Aliasing_Check_3⦎────────
│	Anti_Aliasing_Pars
├─────────────
│	∀i : dom actuals
│	|	(formal_ids i). mode  ∈ {in_out, out}
│	⦁	entire_var_exp(actuals i) ∉ other_vars_exp(actuals i) ∧
│		(∀j : dom actuals | i ≠ j ⦁
│		entire_var_exp (actuals i) ∉ vars_exp (actuals j))
└────────────────────
=FAILURE
505073	In a procedure call, the entire variable of an actual parameter
	of mode OUT or IN OUT must not occur anywhere else in the parameter list.
	The variable ?0 in a call of the procedure ?1 violated this rule
=ENDDOC

=DOC
val ⦏anti_aliasing_check⦎ :
	 (SPECLAB * (AGG_CHOICE,EXP)PROC_CALL) -> unit
=DESCRIBE
ⓈZ
│ ⦏Anti_Aliasing_Check⦎ ≜
│   Anti_Aliasing_Check_1 ∧ Anti_Aliasing_Check_2 ∧
│   Anti_Aliasing_Check_3
■
This invokes each of the anti-aliasing checks 1 to 4.
It also invokes that part of check 1(a) concerned with procedure calls.
=FAILURE
505068	The number of actuals provided does not match those in the declaration of ?0
=ENDDOC

\subsection{Variable Capture Checks}

┌⦏ID_ENV⦎───────────────
│	spark_ids : ℙ ID;
│	z_log_aux, z_attribs : ℙ Z_ID
└───────────────────

=DOC
val ⦏check_new_spark_ids⦎ : CN_ENV -> ID list -> unit
=DESCRIBE
┌⦏New_Spark_Id⦎───────────────
│	ID_ENV;
│	Id? : ID
├──────────
│	trans_id Id? ∉
│		(trans_id ⦇ spark_ids ⦈) ∪ z_log_aux ∪ z_attribs
└───────────────────
=FAILURE
505074	A declaration of ?0 has already been introduced
505075	Variable declaration contains repeated instances of the same name
=ENDDOC
=DOC
val ⦏check_new_z_id⦎ : CN_ENV * Z_ID list -> Z_ID -> unit
=DESCRIBE
┌⦏New_Z_Id⦎───────────────
│	ID_ENV;
│	z_id? : Z_ID
├──────────
│	z_id? ∉
│		(trans_id ⦇ spark_ids ⦈) ∪ z_log_aux ∪ z_attribs
└───────────────────
In the ML implementation, the information content of the ID\_ENV is represented by a pair comprising an environment and a list of any extra names that should be disallowed. This allows for a more efficient calculation of the information in the Z Generator.

[Note: the ML function is defined here for traceability, since New\_Z\_Id is defined in volume II of the specification. The function is actually only used in the Z Generator (Volume I).]
=FAILURE
505074	A declaration of ?0 has already been introduced
=ENDDOC

=DOC
val ⦏do_soundness_checks⦎ : SPECLAB * STATEMENT -> unit
=DESCRIBE
This function applies those soundness checks which can be called directly from the VC generator.
=ENDDOC

\pagebreak
\section{VERIFICATION CONDITIONS}

=DOC
val ⦏fun_sig⦎ : (Z_EXP list * Z_EXP) -> Z_EXP;
val ⦏par_tmark⦎ : CN_ENV -> PARAM_SPEC -> Z_ID list;
val ⦏var_sig⦎ : CN_ENV -> Z_ID -> Z_EXP;
val ⦏fun_decl⦎ : CN_ENV -> FORMAL_FUN -> Z_DECL;
=DESCRIBE
The Z specifications of these functions can be found in ISS/HAT/DAZ/DTD507.
=FAILURE
505041	The global dependencies of a function must be variables: ?0
	is neither a program variable nor an auxiliary variable
=ENDDOC

=DOC
val ⦏vc_local_decls⦎ : SEQUENT list * SPECLAB -> VC list
=DESCRIBE
ⓈZAX
│	⦏vc_local_decls⦎ : (ℙ Sequent × Speclab) → ℙ VC
■
=ENDDOC

=DOC
val ⦏vcs⦎ : SPECLAB * STATEMENT -> (VC * ROUTE OPT) list * SPEC
=DESCRIBE
ⓈZAX
│	⦏vcs⦎ : (Speclab × Statement) ⇸ ℙ VC
├────────────────────
│∀ Speclab; st : Statement ⦁
│	∃ Result; s⋎1, s⋎2, s : ℙ Sequent ⦁
│		vcs (θ Speclab, st) = vc_local_decls (s, θ Speclab) ∧
│		s = s⋎1 ∪ s⋎2
│ ∧		θResult = wp (st, {∅ ⊢ post}, θ Wp_Env)
│ ∧		s⋎1 =
│		{ Sequent | H ⊢ c ∈ WP ⦁ ({Pre} ∪ H) ⊢ subs_pred (c, w⋎0, w)}
│ ∧		s⋎2 =
│		{ Sequent; t : ℙZ_ID | (H ⊢ c, t) ∈ SIDE ⦁
│			({subs_pred(Pre, t, w⋎0)} ∪ H) ⊢ subs_pred (c, w⋎0, w \ t)}
■
In addition to the list of VCs, the implementation also returns the specification
statement being refined with its pre- and post-condition type-checked.
This is used in \cite{ISS/HAT/DAZ/IMP507} when specification statements are
first processed so that pre- and post-conditions do not get type-checked
unnecessarily.
=ENDDOC

\section{STORAGE OF Z TERMS}
=DOC
(* Flag ⦏cn_compactify_terms⦎ - boolean control, default true *)
=DESCRIBE
The Compliance Tool has an feature which attempts to reduce the memory space
occupied by the Z terms stored in its internal data structures.
The feature is optional, but is enabled by default.
This feature can be disabled by
setting the flag {\it cn\_compactify\_terms} to {\it false} and
enabled by setting it to {\it true}.
=ENDDOC

=DOC
val ⦏z_quote⦎ : TERM * Unification.EXTYPE OPT -> ZUserInterfaceSupport.Z_TM
=DESCRIBE
This function is logically equivalent to the constructor
function {\it ZTmQuotation}. It implements the feature for
reducing the space used for the Z terms in internal data structures
by optionally applying {\it compact\_term} to the term argument before
applying {\it ZTmQuotation}.
This optional feature can be enabled and disabled using the flag
{\it cn\_compactify\_terms}.
=ENDDOC


\section{EPILOGUE}

=SML
end (* local...in *);
=TEX

=TEX
\section{TEST POLICY}
The functions in this document are to be tested according to the
criteria identified in \cite{ISS/HAT/DAZ/PLN003}.

\small
\twocolumn[\section{INDEX}]
\printindex

\end{document}




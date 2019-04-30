=IGN
********************************************************************************
dtd509.doc: this file is part of the PPDaz system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  dtd509.doc ℤ $Date: 2008/02/10 15:59:51 $ $Revision: 1.63 $ $RCSfile: dtd509.doc,v $
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

\def\Title{Detailed Design: Z Toolkit Extensions}

\def\AbstractText{This document defines a theory containing the extensions to the Z toolkit required for the DAZ Compliance Tool. It also defines theorems and proof procedures to assist in reasoning about the objects defined in the theory.}

\def\Reference{ISS/HAT/DAZ/DTD509}

\def\Author{D.J. King, R.D. Arthan}


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
%% LaTeX2e port: 
\def\DRASpecs{\cite{DRA/CIS/CSE3/TR/94/27/3.0}}
\def\Volume#1{\cite[volume #1]{DRA/CIS/CSE3/TR/94/27/3.0}\/}
\def\VolumeOne{\Volume 1}
\def\VolumeTwo{\Volume 2}
\def\VolumeThree{\Volume 3}
%% LaTeX2e port: 
\def\Hide#1{}
\def\Bool{``$\it{:}bool\,$''}
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{DAZ PROJECT}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Detailed Design: Z Toolkit Extensions}  %% Mandatory field
%% LaTeX2e port: \TPPref{ISS/HAT/DAZ/DTD509}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.63 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2008/02/10 15:59:51 $%
%% LaTeX2e port: }}
%% LaTeX2e port: %\TPPstatus{Approved}
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: %\TPPkeywords{SPARK}
%% LaTeX2e port: \TPPauthors{D.J.~King&WIN01\\R.D.~Arthan&WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & DAZ Team}
%% LaTeX2e port: \TPPabstract{
%% LaTeX2e port: This document defines a theory containing the extensions to the Z toolkit required for the DAZ Compliance Tool.
%% LaTeX2e port: It also defines theorems and proof procedures to assist in reasoning about the objects defined in the theory.}
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
\bibliography{daz,fmu}

\subsection{Changes History}  % to get section number `0.3'
\begin{description}
\item[Issue 1.1 (1994/03/05)-1.6 (1994/12/01)] Initial Drafts.
\item[Issue 1.7 (1994/12/02)] Carried out rework according to desk check report 011.
\item[Issue 1.8 (1994/12/06)] Added statement that there is no corresponding implementation document for this design.
\item[Issues 1.9 (1994/12/14)] Theorems added; definition of $rem$ etc. revised.
\item[Issue 1.10 (1994/12/14)] Proof context and signatures of proof procedures added.
\item[Issue 1.11 (1994/12/14)] Responded to comments.
\item[Issue 1.12 (1994/12/22)] Corrections after module testing the implementation.
\item[Issue 1.13 (1994/12/22)] Amendments after further review.
\item[Issue 1.14 (1995/01/03)] Updated document references.
\item[Issue 1.15 (1995/09/19)] Updates for enhancements contract (enhancement no. 4).
\item[Issue 1.16 (1995/10/24)] Corrected indexing of new definitions.
\item[Issue 1.17 (1995/12/07)] Removed $DummyVC$ --- a variable can be used instead where this is needed.
\item[Issue 1.18 (1995/12/14)] Updated document references.
\item[Issue 1.19 (1996/02/15)] Fixed omissions which caused bug 13 (V0.6).
\item[Issue 1.20 (1996/02/22)] Added theorems for reasoning about $intdiv$, $intmod$ and $rem$.
\item[Issue 1.21 (1996/03/07)] Added variants to cn proof context.
\item[Issue 1.22 (1996/03/12)] Added further results about $Boolean$.
\item[Issue 1.23 (1996/03/20)] Improved proof context $cn1$.
\item[Issue 1.24 (1996/03/21)] Removed $cn1$ and renamed and exposed a useful theorem.
\item[Issue 1.25 (1996/03/21)] Added $z\_succ↗n↕\_⨾\_thm$.
\item[Issue 1.26 (1996/03/26)] Added $z\_size\_dot\_dot\_conv$ to $cn1$.
\item[Issue 1.27 (1997/07/18)] Changes for IUCT WP 4.
\item[Issue 1.28 (1997/08/14)] Adding indexing characters.
\item[Issue 1.29 (1997/08/18)] Updated references to the DERA specifications.
\item[Issue 1.30 (2000/10/18)] CTLE II R1/4: support for logical operators on boolean arrays.
\item[Issue 1.31 (2000/10/18)] CTLE II R1/8: characters and strings.
\item[Issues 1.32 (2000/10/29),1.33 (2000/10/30)] CTLE II R1/1: real types (interim solution with Z reals declared here).
\item[Issues 1.34 (2000/12/10),1.35 (2000/12/13)] CTLE II R1/1: real types (using the official Z reals).
\item[Issues 1.36 (2000/12/14)] Fixed typo in theory checking.
\item[Issues 1.37 (2001/05/29)--1.39 (2001/11/08)] R0021: new treatment of AND THEN and OR ELSE.
\item[Issues 1.40 (2002/01/14)] R0032: Compliance Notation specification maintenance (added index brackets for Z global variables).
\item[Issues 1.41 (2002/01/24)--1.43 (2002/01/27)] R0006: free use of subtype indications and ranges.
\item[Issues 1.44 (2002/01/29)] R0044: checks on array ranges.
\item[Issues 1.45 (2002/02/18)] Fixing overfull hboxes for SPC501.
\item[Issues 1.46 (2002/02/28)] Changed {\it INFORMAL\_FUNCTION} to {\it Informal\_Function}
to avoid possible clash with an Ada name.
\item[Issue  1.47 (2002/05/22)] Added {\it Sequent\_Route} Z type for sequent provenance information in VCs.
                      This is in reponse to an operational and not a formal requirement.
\item[Issue 1.48 (2002/05/22)] Added missing fixity paragraph for {\it SR\_proc\_call\_end}.
\item[Issue 1.49 (2002/07/09)] R0081: added defining property for {\it real\_to\_integer}.
\item[Issue 1.50 (2002/08/23)] Removed use of ICL logo font.
\item[Issue 1.51 (2002/10/14)] Merged changes for R0062. Remove unusable (subprogram context) constructors from {\it Sequent\_Route}.
			Name changes {\it Sequent\_Route} to {\it VC\_Route} and
			constructor names become PP compatible e.g. {\it VCExitTillToSide}.
\item[Issue 1.52 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.53 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.54 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.55 (2004/01/19)] The Z universal set is now called 𝕌
\item[Issue 1.56 (2005/02/26)] Allowed for ISO Z precedences and associativities that {\Product} now uses.
\item[Issue 1.57 (2005/03/03)] Tidy-up of the operator precedences.
\item[Issue 1.58 (2005/09/01)] Corrected precedence of logical negation.
\item[Issue 1.59 (2005/09/09)] Allowed for introduction of 𝔹 and 𝕊.
\item[Issue 1.60 (2006/02/02)] Allowed for new symbol for functional composition.
\item[Issue 1.61 (2006/04/20)] Ada real literals are now translated into Z floating point literals.
\item[Issue 1.62 (2006/04/21)] Removed fixity declaration for $e$.
\item[Issue 1.63 (2008/02/10)] Allowed for change to lexical rules for underscores in Z.
\item[Issue 1.64 (2008/05/05)] Support for modular types.
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
This document responds to a requirement for a design of toolkit extensions in Z in \cite{ISS/HAT/DAZ/HLD503}. The specification of the toolkit extensions is provided in {\VolumeOne}.
The document also responds to the requirement for tools supporting proof of propositions expressed using the toolkit extensions also expressed in \cite{ISS/HAT/DAZ/HLD503}.

\subsection{Introduction}

\subsubsection{Purpose and Background}

This document provides the Z toolkit extensions required for the Compliance Tool and specified in {\VolumeOne}.
The toolkit extensions are implemented as a {\ProductZ} specification.

It also specifies the basic proof support tools for the toolkit extensions.
These tools comprise theorems, conversions and a proof context and are defined here in the same style as is used for {\Product} proof facilities.

In more detail, the structure of this document is as follows:

\begin{description}
\item[Section \ref{DESIGNISSUES}] discusses design issues and decisions which have been taken here;
\item[Section \ref{SPARKTOOLKIT}] gives the toolkit extensions as defined in {\VolumeOne};
\item[Section \ref{OTHERZDEFINITIONS}] contains some additional Z definitions which support the operation of the Compliance Tool;
\item[Section \ref{THESTRUCTURE}] defines the ML structure which gives the interface for the theorems, proof procedures etc. provided.
\end{description}

\subsubsection{Compliance}

The function $abs$ specified in {\VolumeOne} is not provided here because the {\ProductZ} toolkit already supplies an appropriate implementation.

The Z name for an attribute in {\VolumeOne} is denoted by a pair of underscore characters. {\Product-Z}'s lexical rules does not permit this. A lowercase ``v'' is used to denote an attribute instead.

\subsubsection{Dependencies}
The theory defined in this document is a child of the theory $z\_library$ defined in {\Product}.
The document is therefore dependent on {\Product} but not on any module of the Compliance Tool.
%\subsubsection{Possible Enhancements}

\section{DESIGN ISSUES}\label{DESIGNISSUES}

\subsection{Theory Hierarchy}
The theory created by this document is called ``$cn$''.
Its parent is the theory ``$z\_library$'' which gives access to the Z toolkit as provided in {\Product}.
When the compliance tool is invoked, the current theory should be ``$cn$'', and the function which introduces a new literate script should arrange for this.

\subsection{Proof Facilities}
The proof facilities follow a pattern which is common in {\Product}.
First of all, in section \ref{Theorems}, theorems are presented which allow basic semi-automatic reasoning about the objects defined in a theory.

Secondly, in section \ref{ProofProcedures}, proof procedures which cannot be captured as theorems are given as derived inference rules, typically conversions (i.e. proof rules which support equational reasoning by taking a term $tm$ as argument and proving a theorem of the form
=INLINEFT
⊢ tm = tm'
=TEX
.
E.g., the theorem schemata corresponding to the evaluation of expressions with constant operands are given as conversions which prove theorems such as
=INLINEFT
⊢ 12 intdiv 5 = 2
=TEX
.

Finally, in section \ref{ProofContexts} the more generally applicable theorems and proof procedures are packaged together in one or more proof contexts which make it convenient for a user to access a general purpose collection of simplifications customised for the theory.
These proof contexts typically come in two flavours: component proof contexts containing only the simplifications for this theory for use in combination with other proof contexts; and complete proof contexts which contain a comprehensive collection of simplifications for the theory and its ancestors.

=TEX
\newpage

=TEX
\pagebreak
\section{SPARK TOOLKIT}\label{SPARKTOOLKIT}
Sections \ref{Booleans} to \ref{CharactersandStrings} give the {\ProductZ} analogues of the toolkit extensions essentially as defined by DRA in {\VolumeOne}.
Any disparities with the DRA are discussed in the accompanying narrative.

\subsection{Preamble}

The following preamble creates the theory ``cn'' as a child of ``z\_library''
and makes the theory ``z\_reals'' a parent.

=SML
force_delete_theory"cn" handle Fail _ => ();
open_theory"z_library";
push_pc "z_library";
val _ = set_flag ("z_type_check_only", false);
val _ = set_flag ("z_use_axioms", true);
new_theory"cn";
new_parent"z_reals";
=TEX

The following paragraphs are required by {\Product} to determine the fixity of some of the names defined in the toolkit extensions.

\HOLindexOff

ⓈZ
function 0 ⦏char_lit⦎ _
■

ⓈZ
function 0 ⦏string_lit⦎ _
■

ⓈZ
function 0 _ ⦏and⦎ _, _ ⦏or⦎ _, _ ⦏xor⦎ _
■

ⓈZ
function 0 _ ⦏and_then⦎ _, _ ⦏or_else⦎ _
■

ⓈZ
function 0 _ ⦏array_and⦎ _, _ ⦏array_or⦎ _, _ ⦏array_xor⦎ _
■

ⓈZ
function 0 _ ⦏mod_and⦎ _, _ ⦏mod_or⦎ _, _ ⦏mod_xor⦎ _
■

ⓈZ
function 10 _ ⦏mem⦎ _, _ ⦏notmem⦎ _, _ ⦏eq⦎ _, _ ⦏noteq⦎ _
■

ⓈZ
function 20 _ ⦏less⦎ _, _ ⦏less_eq⦎ _, _ ⦏greater⦎ _, _ ⦏greater_eq⦎ _
■

ⓈZ
function 20 _ ⦏real_less⦎ _, _ ⦏real_less_eq⦎ _, _ ⦏real_greater⦎ _, _ ⦏real_greater_eq⦎ _
■

ⓈZ
function 20 _ ⦏array_less⦎ _, _ ⦏array_less_eq⦎ _,
      _ ⦏array_greater⦎ _, _ ⦏array_greater_eq⦎ _
■

ⓈZ
function 30 _ ⦏&⋎0⦎ _, _ ⦏&⋎1⦎ _, _ ⦏&⋎2⦎ _
■

ⓈZ
function 40 _ ⦏intdiv⦎ _, _ ⦏rem⦎ _, _ ⦏intmod⦎ _
■

ⓈZ
function 50 _ ⦏**⦎ _, ⦏not⦎ _, ⦏array_not⦎ _, ⦏mod_not⦎ _
■

\HOLindexOn

\subsection{Booleans}\label{Booleans}

ⓈZ
⦏FALSE⦎ ≜ 0
■

ⓈZ
⦏TRUE⦎ ≜ 1
■

ⓈZ
⦏BOOLEAN⦎ ≜ FALSE..TRUE
■

ⓈZ
⦏BOOLEANvFIRST⦎ ≜ FALSE
■

ⓈZ
⦏BOOLEANvLAST⦎ ≜ TRUE
■

ⓈZ
⦏BOOLEANvSUCC⦎ ≜ (BOOLEAN \ {BOOLEANvLAST}) ◁ succ
■

ⓈZ
⦏BOOLEANvPRED⦎ ≜ BOOLEANvSUCC↗~↕
■

ⓈZ
⦏BOOLEANvPOS⦎ ≜ id BOOLEAN
■

ⓈZ
⦏BOOLEANvVAL⦎ ≜ BOOLEANvPOS↗~↕
■

\subsection{Boolean Operators}

ⓈZAX
│ ⦏not⦎ _ : BOOLEAN → BOOLEAN;
│ _ ⦏and⦎ _, _ ⦏or⦎ _, _ ⦏xor⦎ _ : (BOOLEAN × BOOLEAN) → BOOLEAN
├─────────────────────
│ ∀ b : BOOLEAN ⦁
│	not FALSE = TRUE ∧ not TRUE = FALSE ∧
│	(b and FALSE = FALSE ∧ b and TRUE = b) ∧
│	(b or FALSE = b ∧ b or TRUE = TRUE) ∧
│	(b xor FALSE = b ∧ b xor TRUE = not b)
■
ⓈZAX
│ _ ⦏and_then⦎ _, _ ⦏or_else⦎ _: (BOOLEAN × BOOLEAN) → BOOLEAN
├─────────────────────
│ (_ and_then _) = (_ and _) ∧ (_ or_else _) = (_ or _)
■

\subsection{Relational Operators returning Booleans}

╒[X]════════════════
│ _ ⦏mem⦎ _, _ ⦏notmem⦎ _ : (X × ℙ X) → BOOLEAN;
│ _ ⦏eq⦎ _, _ ⦏noteq⦎ _ : (X × X) → BOOLEAN
├──────────────────
│ ∀ x, y : X; S : ℙ X; b : BOOLEAN ⦁
│	(b = x mem S ⇔ (b = TRUE ⇔ x ∈ S)) ∧
│	(b = x notmem S ⇔ (b = TRUE ⇔ x ∉ S)) ∧
│	(b = x eq y ⇔ (b = TRUE ⇔ x = y)) ∧
│	(b = x noteq y ⇔ (b = TRUE ⇔ x ≠ y))
└────────────────────

╒[X]════════════════
│ ⦏array_not⦎ _ : (X ⇸ BOOLEAN) → (X ⇸ BOOLEAN);
│ _ ⦏array_and⦎ _,
│ _ ⦏array_or⦎ _,
│ _ ⦏array_xor⦎ _ : ((X ⇸ BOOLEAN) × (X ⇸ BOOLEAN)) → (X ⇸ BOOLEAN)
├─────────────────────
│ ∀ a, b : X ⇸ BOOLEAN ⦁
│	array_not a = (λi : dom a⦁ not (a i)) ∧
│	a array_and b = (λi : dom a ∩ dom b⦁ a i and b i) ∧
│	a array_or b = (λi : dom a ∩ dom b⦁ a i or b i) ∧
│	a array_xor b = (λi : dom a ∩ dom b⦁ a i xor b i)
└────────────────────

ⓈZAX
│ _ ⦏less⦎ _, _ ⦏less_eq⦎ _, _ ⦏greater⦎ _,
│ _ ⦏greater_eq⦎ _ : (ℤ × ℤ) → BOOLEAN
├─────────────────────
│ ∀ x, y : ℤ; b : BOOLEAN ⦁
│	(b = x less y ⇔ (b = TRUE ⇔ x < y)) ∧
│	(b = x less_eq y ⇔ (b = TRUE ⇔ x ≤ y)) ∧
│	(b = x greater y ⇔ (b = TRUE ⇔ x > y)) ∧
│	(b = x greater_eq y ⇔ (b = TRUE ⇔ x ≥ y))
■
ⓈZAX
│ _ ⦏real_less⦎ _, _ ⦏real_less_eq⦎ _, _ ⦏real_greater⦎ _,
│ _ ⦏real_greater_eq⦎ _ : (ℝ × ℝ) → BOOLEAN
├─────────────────────
│ ∀ x, y : ℝ; b : BOOLEAN ⦁
│	(b = x real_less y ⇔ (b = TRUE ⇔ x <⋎R y)) ∧
│	(b = x real_less_eq y ⇔ (b = TRUE ⇔ x ≤⋎R y)) ∧
│	(b = x real_greater y ⇔ (b = TRUE ⇔ x >⋎R y)) ∧
│	(b = x real_greater_eq y ⇔ (b = TRUE ⇔ x ≥⋎R y))
■


ⓈZAX
│ _ ⦏array_less⦎ _,
│ _ ⦏array_less_eq⦎ _,
│ _ ⦏array_greater⦎ _,
│ _ ⦏array_greater_eq⦎ _ : ((ℤ ⇸ ℤ) × (ℤ ⇸ ℤ)) → BOOLEAN
├─────────────────────
│ ∀ a, b : ℤ ⇸ ℤ ⦁
│	(a array_less b = TRUE ⇔
│	(∃i, j, k : ℤ⦁
│		{i, j} ⊆ dom b ∧ i - 1 ∉ dom b ∧ i + k - 1 ∉ dom a
│	∧	(∀t : i .. j - 1⦁ t + k ∈ dom a ∧ b t = a(t + k))
│	∧	j + k ∈ dom a ⇒ a(j + k) < b j)) ∧
│	a array_less_eq b = a array_less b or a eq b ∧
│	a array_greater b = b array_less a ∧
│	a array_greater_eq b = b array_less_eq a
■

\subsection{Numeric Operators}
The definitions of division etc. in {\VolumeOne} rely on the definitions of the analogous operations for Z in \cite{Spivey92}.
This part of the Z toolkit is in a state of flux in the standardisation activity and the {\ProductZ} toolkit differs from \cite{Spivey92}.
The following formulation defines division, remainder and modulo for SPARK using only Z division with non-negative operands.
It should therefore be independent of the final choice made in the Z standards work.
ⓈZAX
│ _ ⦏intdiv⦎ _, _ ⦏rem⦎ _, _ ⦏intmod⦎ _ : (ℤ × ℤ \ {0}) → ℤ
├─────────────────────
│ ∀ x, y : ℤ | y ≠ 0 ⦁
│	(x*y ≥ 0 ⇒ x intdiv y = abs x div abs y )
│∧	(x*y < 0 ⇒ x intdiv y = ~(abs x div abs y))
│∧	x rem y = x - (x intdiv y) * y
│∧	(x*y ≥ 0 ∨ x rem y = 0 ⇒ x intmod y = x rem y )
│∧	(x*y < 0 ∧ x rem y ≠ 0 ⇒ x intmod y = x rem y + y)
■
That the above definition agree with the Ada definitions is supported by
the result of a simple experiment with {\Product}.
The following list of theorems has been derived from the above definition and corresponds to parts of the table in section 4.5.5 of the Ada LRM.
=GFT ProofPower Output
val it = [⊢ (10 intdiv 5, 10 rem 5, 10 intmod 5) = (2, 0, 0),
   ⊢ (12 intdiv 5, 12 rem 5, 12 intmod 5) = (2, 2, 2),
   ⊢ (14 intdiv 5, 14 rem 5, 14 intmod 5) = (2, 4, 4),
   ⊢ (10 intdiv ~ 5, 10 rem ~ 5, 10 intmod ~ 5) = (~ 2, 0, 0),
   ⊢ (12 intdiv ~ 5, 12 rem ~ 5, 12 intmod ~ 5) = (~ 2, 2, ~ 3),
   ⊢ (14 intdiv ~ 5, 14 rem ~ 5, 14 intmod ~ 5) = (~ 2, 4, ~ 1),
   ⊢ (~ 10 intdiv 5, ~ 10 rem 5, ~ 10 intmod 5) = (~ 2, 0, 0),
   ⊢ (~ 12 intdiv 5, ~ 12 rem 5, ~ 12 intmod 5) = (~ 2, ~ 2, 3),
   ⊢ (~ 14 intdiv 5, ~ 14 rem 5, ~ 14 intmod 5) = (~ 2, ~ 4, 1),
   ⊢ (~ 10 intdiv ~ 5, ~ 10 rem ~ 5, ~ 10 intmod ~ 5) = (2, 0, 0),
   ⊢ (~ 12 intdiv ~ 5, ~ 12 rem ~ 5, ~ 12 intmod ~ 5) = (2, ~ 2, ~ 2),
   ⊢ (~ 14 intdiv ~ 5, ~ 14 rem ~ 5, ~ 14 intmod ~ 5) = (2, ~ 4, ~ 4)] : THM list
ⓈZAX
│ _ ⦏**⦎ _ : (ℤ × ℕ) → ℤ
├─────────────────────
│ ∀ x : ℤ; y : ℕ ⦁ x ** 0 = 1 ∧ x ** (y + 1) = x * x ** y
■

ⓈZAX
│ ⦏integer_to_real⦎: ℤ → ℝ
├─────────────────────
│ ∀ i : ℤ ⦁ integer_to_real i = real i
■
ⓈZAX
│ ⦏real_to_integer⦎ : ℝ → ℤ
├─────────────────────
│ ∀ x : ℝ ⦁ ~⋎R 0.5 ≤⋎R x -⋎R real (real_to_integer x) ≤⋎R 0.5
■

The $abs$ function is already provided in the {\ProductZ} mathematical toolkit and therefore does not need to be defined here.

\subsection{Operations for Modular Types}

ⓈZAX
│ ⦏_ mod_and _⦎, ⦏_ mod_or _⦎, ⦏_ mod_xor _⦎ : ℕ × ℕ → ℕ
├──────
│ ∀i : ℕ⦁ i mod_and 0 = 0;
│ ∀i : ℕ; j : ℕ⋎1⦁
│	i mod_and j = 2*(i div 2 mod_and j div 2) + (i mod 2)*(j mod 2);
│ ∀i : ℕ⦁ i mod_or 0 = i;
│ ∀i : ℕ; j : ℕ⋎1⦁
│	i mod_or j = 2*(i div 2 mod_or j div 2) + max{i mod 2, j mod 2};
│ ∀i : ℕ⦁ i mod_xor 0 = i;
│ ∀i : ℕ; j : ℕ⋎1⦁
│	i mod_xor j = 2*(i div 2 mod_xor j div 2) + (i + j) mod 2
■


ⓈZAX
│ ⦏mod_not _⦎ : ℤ × ℤ → ℤ
├──────
│ ∀i, modulus : ℤ⦁ mod_not(i, modulus) = modulus - (i + 1)
■


\subsection{Integers}\label{Integers}

ⓈZAX
│ ⦏INTEGER⦎ : ℙ ℤ
■
ⓈZAX
│ ⦏INTEGERvFIRST⦎, ⦏INTEGERvLAST⦎ : ℤ ;
│ ⦏INTEGERvSUCC⦎, ⦏INTEGERvPRED⦎,
│ ⦏INTEGERvPOS⦎, ⦏INTEGERvVAL⦎ : ℤ ⇸ ℤ
■
\subsection{Natural Numbers}\label{NaturalNumbers}
ⓈZ
│ ⦏NATURAL⦎ ≜ 0 .. INTEGERvLAST
■
ⓈZ
│ ⦏NATURALvFIRST⦎ ≜ 0
■
ⓈZ
│ ⦏NATURALvLAST⦎ ≜ INTEGERvLAST
■
ⓈZ
│ ⦏NATURALvSUCC⦎ ≜ INTEGERvSUCC
■
ⓈZ
│ ⦏NATURALvPRED⦎ ≜ INTEGERvPRED
■
ⓈZ
│ ⦏NATURALvPOS⦎ ≜ INTEGERvPOS
■
ⓈZ
│ ⦏NATURALvVAL⦎ ≜ INTEGERvVAL
■

\subsection{Positive Numbers}\label{PositiveNumbers}
ⓈZ
│ ⦏POSITIVE⦎ ≜ 1 .. INTEGERvLAST
■
ⓈZ
│ ⦏POSITIVEvFIRST⦎ ≜ 1
■
ⓈZ
│ ⦏POSITIVEvLAST⦎ ≜ INTEGERvLAST
■
ⓈZ
│ ⦏POSITIVEvSUCC⦎ ≜ INTEGERvSUCC
■
ⓈZ
│ ⦏POSITIVEvPRED⦎ ≜ INTEGERvPRED
■
ⓈZ
│ ⦏POSITIVEvPOS⦎ ≜ INTEGERvPOS
■
ⓈZ
│ ⦏POSITIVEvVAL⦎ ≜ INTEGERvVAL
■
\subsection{Long Integers}\label{LongIntegers}

ⓈZAX
│ ⦏LONG_INTEGER⦎ : ℙ ℤ
■
ⓈZAX
│ ⦏LONG_INTEGERvFIRST⦎, ⦏LONG_INTEGERvLAST⦎ : ℤ ;
│ ⦏LONG_INTEGERvSUCC⦎, ⦏LONG_INTEGERvPRED⦎,
│ ⦏LONG_INTEGERvPOS⦎,  ⦏LONG_INTEGERvVAL⦎ : ℤ ⇸ ℤ
■
\subsection{Short Integers}\label{ShortIntegers}

ⓈZAX
│ ⦏SHORT_INTEGER⦎ : ℙ ℤ
■
ⓈZAX
│ ⦏SHORT_INTEGERvFIRST⦎, ⦏SHORT_INTEGERvLAST⦎ : ℤ ;
│ ⦏SHORT_INTEGERvSUCC⦎, ⦏SHORT_INTEGERvPRED⦎,
│ ⦏SHORT_INTEGERvPOS⦎, ⦏SHORT_INTEGERvVAL⦎ : ℤ ⇸ ℤ
■
ⓈZAX
│ ⦏universal_discrete⦎ : ℙℤ
■
ⓈZAX
│ ⦏universal_discretevFIRST⦎, ⦏universal_discretevLAST⦎ : ℤ ;
│ ⦏universal_discretevSUCC⦎, ⦏universal_discretevPRED⦎,
│ ⦏universal_discretevPOS⦎, ⦏universal_discretevVAL⦎ : ℤ ⇸ ℤ
■

\subsection{Float}\label{Float}

ⓈZAX
│ ⦏FLOAT⦎ : ℙ ℝ
■
ⓈZAX
│ ⦏FLOATvFIRST⦎, ⦏FLOATvLAST⦎ : ℝ ;
│ ⦏FLOATvDIGITS⦎ : ℤ
■
\subsection{Short Float}\label{ShortFloat}

ⓈZAX
│ ⦏SHORT_FLOAT⦎ : ℙ ℝ
■
ⓈZAX
│ ⦏SHORT_FLOATvFIRST⦎, ⦏SHORT_FLOATvLAST⦎ : ℝ ;
│ ⦏SHORT_FLOATvDIGITS⦎ : ℤ
■
\subsection{Long Float}\label{LongFloat}

ⓈZAX
│ ⦏LONG_FLOAT⦎ : ℙ ℝ
■
ⓈZAX
│ ⦏LONG_FLOATvFIRST⦎, ⦏LONG_FLOATvLAST⦎ : ℝ ;
│ ⦏LONG_FLOATvDIGITS⦎ : ℤ
■

\subsection{Characters and Strings}\label{CharactersandStrings}
ⓈZ
│ ⦏CHARACTERvFIRST⦎ ≜ 0
■
ⓈZAX
│ ⦏CHARACTERvLAST⦎ : ℤ
├──────
│ CHARACTERvLAST ≥ 127
■
ⓈZ
│ ⦏CHARACTER⦎ ≜ CHARACTERvFIRST .. CHARACTERvLAST
■
ⓈZ
│ ⦏CHARACTERvSUCC⦎ ≜ (CHARACTER \ {CHARACTERvLAST}) ◁ succ
■
ⓈZ
│ ⦏CHARACTERvPRED⦎ ≜ CHARACTERvSUCC↗~↕
■
ⓈZ
│ ⦏CHARACTERvPOS⦎ ≜ id CHARACTER
■
ⓈZ
│ ⦏CHARACTERvVAL⦎ ≜ CHARACTERvPOS↗~↕
■

ⓈZAX
│ ⦏STRING⦎ : ℙ (POSITIVE ⇸ CHARACTER)
■
Characters in Z are represented by singleton strings:
ⓈZ
│ ⦏Z_CHAR⦎ ≜ seq 𝕊
■
ⓈZ
│ ⦏Z_STRING⦎ ≜ seq 𝕊
■
We have to resort to a HOL quotation to define a function
to return the integer code for a character. This should
perhaps be included as part of {\ProductZ}.


=SML
set_flag("standard_z_paras", false);
ⓈZAX
│ ⦏dest_char⦎ : 𝕊 → ℤ
├──────
│ ∀ch : 𝕊⦁ dest_char ch = ⌜ℕℤ (RepChar ch)⌝
■
=SML
reset_flag("standard_z_paras");
=TEX
A string is then obtained by mapping {\it dest\_char} over the characters
of the string. Since the string is a Z sequence, mapping a function over
it amounts to functional composition of the function with the string.
ⓈZAX
│ ⦏string_lit⦎ _ : Z_STRING → seq CHARACTER
(*
■
ⓈZ
*)
├──────
│ ∀str : Z_STRING⦁ string_lit str = dest_char ∘ str
■
And then a character code is obtained from a singleton
string by taking the head of the sequence obtained from {\it string\_lit}.

ⓈZAX
│ ⦏char_lit⦎ _ : Z_CHAR → CHARACTER
(*
■
ⓈZ
*)
├──────
│ (char_lit _) = head ∘ (string_lit _)
■

=TEX
\subsection{Informal Functions}\label{InformalFunctions}
ⓈZ
│ [ ⦏Informal_Function⦎ ]
■
\subsection{Support for Arrays}\label{Arrays}
The definitions to support array aggregate definitions
are introduced using the ML function {\it array\_agg\_def}.
This is done in \cite{ISS/HAT/DAZ/IMP516}, since during
system build, {\it array\_agg\_def} has not yet been compiled
at the point when the Z in this document is loaded into the tool.

╒[X]════════════════
│ _⦏&⋎0⦎_ : (ℤ ⇸ X) × (ℤ ⇸ X) → (ℤ ⇸ X);
│ _⦏&⋎1⦎_ : (ℤ ⇸ X) × X → (ℤ ⇸ X);
│ _⦏&⋎2⦎_ : X  × (ℤ ⇸ X) → (ℤ ⇸ X)
├─────────────────────
│ ∀ a, b : ℤ ⇸ X; m, n : ℤ
│ | dom a ↦ m ∈ max ∧ dom b ↦ n ∈ min ⦁
│	a &⋎0 b = a ⊕ {i : dom b⦁ i + m + 1 - n ↦ b i};
│
│ ∀ a : ℤ ⇸ X⦁ a &⋎0 ∅ = a;
│
│ ∀ a : ℤ ⇸ X; x : X⦁ a &⋎1 x = a &⋎0 ⟨x⟩;
│
│ ∀ a : ℤ ⇸ X; x : X⦁ x &⋎2 a = ⟨x⟩ &⋎0 a
└────────────────────
╒[X, Y]═══════════
│ ⦏slide⦎ : (X ⇸ Y) × ℙX → (X ⇸ Y)
├──────
│ ∀f : X ⇸ Y; r : ℙX | dom f = r ⦁ slide(f, r) = f
└──────────────

\pagebreak
\section{OTHER Z DEFINITIONS}\label{OTHERZDEFINITIONS}

\subsection{Interface with Z Predicates}\label{InterfacewithZPredicates}

For the purposes of proof, a function is needed to convert a Z predicate
into a $BOOLEAN$.
Since this requires the higher-order features of {\ProductZ}, we
must set up the system to allow these features before defining this function:

=SML
set_flag("standard_z_paras", false);
=TEX
ⓈZAX
│	⦏Boolean⦎ : 𝔹 → BOOLEAN
├────────────────────
│	Boolean true = TRUE
│∧	Boolean false = FALSE
■
=SML
reset_flag("standard_z_paras");
=TEX
\subsection{Sequent Provenance Information}
We provide a Z type (\textit{\slshape VC\_Route}) that can carry information on the introduction, transformation and siding of sequents as they pass backwards up the SPARK abstract syntax tree.


The bracketed constructs are semicolon with \verb+semi+ and \verb+semi+,
 if-then-elsec, \verb+if-then+, \verb+if-else+ and \verb+end-if+ and case with
  \verb+case+, \verb+case-others+ and \verb+end-case+, webclause or subprogram body with \verb+refinement+, \verb+refinement_intro+
 (these outer constructs exist to hold the specification statements from which initial post-conditions are derived). Other constructs are atoms and
 describe introduction, passage and transition to side condition of the sequent in various
 statement forms.  The atoms that describe introduction always terminate such a string.

In carrying side conditions through statements we need just show that a statement has been
passed so we use \verb+any_statement+.

To be able to reproduce the skeleton independently of the actual abstract syntax tree
we need to remember whether an \textbf{if} clause was introduced implicitly for the
clause following \textbf{elsf} or not.

ⓈZ
│   ⦏VRElsfInd⦎ ::= VRElsfTrue | VRElsfFalse
■

We now describe the free type for the route which describes the path recursively out of unary and nullary constructors. Some compression would of course be possible. Additionally, data replication would be saved
at the cost of processing time if the new information were appended to the list since then address prefixes would be in common.

ⓈZ
fun ⦏VRAny⦎ _
■

ⓈZ
fun ⦏VRNull⦎ _
■

ⓈZ
fun ⦏VRAssign⦎ _
■

ⓈZ
fun ⦏VRSpecVia⦎ _
■

ⓈZ
fun ⦏VRSpecToSide⦎ _
■

ⓈZ
fun ⦏VRSemi⦎ _
■

ⓈZ
fun ⦏VREndSemi⦎ _
■

ⓈZ
fun ⦏VRIfThen⦎ _
■

ⓈZ
fun ⦏VRIfElse⦎ _
■

ⓈZ
fun ⦏VREndIf⦎ _
■

ⓈZ
fun ⦏VRCaseBranch⦎ _
■

ⓈZ
fun ⦏VRCaseOthers⦎ _
■

ⓈZ
fun ⦏VREndCase⦎ _
■

ⓈZ
fun ⦏VRLoopUndecVia⦎ _
■

ⓈZ
fun ⦏VRLoopUndecToSide⦎ _
■

ⓈZ
fun ⦏VRWhileVia⦎ _
■

ⓈZ
fun ⦏VRWhileWPToSide⦎ _
■

ⓈZ
fun ⦏VRWhileToSide⦎ _
■

ⓈZ
fun ⦏VRForVia⦎ _
■

ⓈZ
fun ⦏VRForToSide⦎ _
■

ⓈZ
fun ⦏VRForExitToSide⦎ _
■

ⓈZ
fun ⦏VRExitVia⦎ _
■

ⓈZ
fun ⦏VRProcCall⦎ _
■

ⓈZ
fun ⦏VRProcCallEnd⦎ _
■

ⓈZ
fun ⦏VRLogConToSide⦎ _
■

ⓈZ
fun ⦏VRRefinementBegin⦎ _
■

ⓈZ
│  ⦏VC_Route⦎ ::=
│ (*
■

The short-circuit along descriptor which is used only for side conditions is \textit{\slshape VRAny}.

ⓈZ
│  *)
│    VRAny(VC_Route) |
│ (*
■

The rest of the constructors describe the effects of given statements. Some are decorated with
information allowing a fuller skeleton of the tree to be drawn. This could be discarded in favour
of walking the path using the abstract syntax tree.

ⓈZ
│  *)
│    VRNull( VC_Route) |
│    VRAssign( VC_Route) |
│ (*
■

In a specification statement we see several possible treatments of sequents: they can pass from
post-condition to pre-condition (often with additional hypotheses), this is described by
\textit{\slshape SR\_spec\_via}, they can pass from the post-condition to a side condition, shown by \textit{\slshape SR\_spec\_to\_side}, they can be introduced where the pre-condition of the specification
is injected as a pre-condition without hypotheses, shown by \textit{\slshape SR\_spec\_intro\_pre}.

ⓈZ
│  *)
│    VRSpecVia( VC_Route) | VRSpecToSide( VC_Route) |
│    VRSpecPreIntro |
│ (*
■

Sequential composition is represented in the abstract syntax as a binary operator and handled accordingly by \textit{\slshape wp} so we use that representation.

ⓈZ
│  *)
│    VRSemi( VC_Route) | VREndSemi( VC_Route) |
│ (*
■

For \textbf{if} and \textbf{case} clauses where control flow divides we need to know (not for side conditions!)  down which path a sequent was transformed;  for \textbf{if} clauses we can just use alternative constructors, for \textbf{case} clauses we separate out the \textbf{others} case and
then use an integer to identify the branch traversed.

ⓈZ
│  *)
│    VRIfThen( VRElsfInd × VC_Route) | VRIfElse( VRElsfInd × VC_Route) |
│    VREndIf( VC_Route) |
│    VRCaseBranch( ℕ⋎1 × VC_Route) | VRCaseOthers( VC_Route) |
│    VREndCase( VC_Route) |
│ (*
■

With an undecorated loop we have a new possibility, that a precondition of the specification statement which is the body of the loop is immediately turned into a side condition.

ⓈZ
│  *)
│    VRLoopUndecVia( VC_Route) |
│    VRLoopUndecPreIntro |
│    VRLoopUndecPreToSide |
│    VRLoopUndecToSide( VC_Route) |
│ (*
■

For a \textbf{while} loop  \textit{\slshape wp} first computes the pre-condition and then derives a
side condition from it. This means that in this case we may have TWO constructors relating to
the single construct when a sequent becomes a side condition.

ⓈZ
│  *)
│    VRWhileVia( VC_Route) |
│    VRWhilePreIntro|
│    VRWhileWPToSide( VC_Route) |
│    VRWhileToSide( VC_Route) |
│ (*
■

We don't see a requirement to distinguish the semantically different kinds of \textbf{for} loops
for this purpose - we use one set of constructors. There are two ways in which the post-condition
can become a side condition: either requiring that the body post-condition must achieve the
required post-condition on the final iteration or requiring (in the presence of a till clause)
that the till condition imply the required post-condition.

ⓈZ
│  *)
│    VRForVia( VC_Route) |
│    VRForPreIntro |
│    VRForPreToSide |
│    VRForToSide( VC_Route ) |
│    VRForExitToSide( VC_Route) |
│ (*
■

Exit clauses can be conditional or unconditional (only \textit{\slshape SR\_exit\_till\_intro} occurs)  and may exit a named loop or the enclosing loop. A Return clause imposes the return condition under hypotheses expressing the parameter context.
ⓈZ
│  *)
│    VRExitTillIntro(Z_STRING) |
│    VRExitVia( VC_Route) |
│    VRReturnIntro |
│ (*
■

With procedure call \textit{wp} finds the specification statement and may add write-back
assignments. These will decorate the sequents as they are processed. It is easiest initially
to consider the procedure call as a nested construct so that we can identify the write-back
assignments and specification statments. Side conditions are also added for range checks on the
parameters.

ⓈZ
│  *)
│    VRProcCall( VC_Route) |
│    VRProcCallEnd( VC_Route) |
│    VRProcCallRngIntro |
│ (*
■

Logical constants statements produce side conditions from the required post-condition and
introduce new sequents from the specification pre-condition and the type membership tests.

ⓈZ
│  *)
│    VRLogConToSide( VC_Route) |
│    VRLogConPreIntro |
│    VRLogConTypeMemIntro |
│ (*
■



At the outer level we can have a refinement or a subprogram body. We mark these both as refinement as we can't tell the difference here, noting that
sequents are introduced at the bottom of these constructs.


ⓈZ
│  *)
│   VRRefinementBegin VC_Route |
│   VRRefinementIntro
■


\pagebreak
\section{THE STRUCTURE}\label{THESTRUCTURE}
\subsection{Preamble}
=DOC
signature ⦏CNToolkitExtensions⦎ = sig
=DESCRIBE
This is the signature for the toolkit extensions required by the Compliance Tool. It is specified in DRA/CIS/CSE3/TR/94/27/3.0.
=ENDDOC
=THDOC
req_name ⦏"cn"⦎ (Value "z_library");
req_language "Z";
set_flag("tc_thms_only",true);
=DESCRIBE
The theory $cn$ contains definitions specified in DRA/CIS/CSE3/TR/94/27/3.0.
It is created in structure $CNToolkitExtensions$.
The specification of the theory name, and the language of the theory is defined using $req\_name$ and $req\_language$. This conforms to the technique used in the rest of the {\Product} design documentation for specifying the requirement for theories.
=ENDDOC
\subsection{Theorems}\label{Theorems}
Theorems are provided which allow systematic expansion of the objects in the theory in terms of the Z toolkit operations.
These theorems serve to support the proof procedures defined in section \ref{ProofProcedures} below and may also be directly applied by the user.
\subsubsection{Booleans}
=THDOC
req_thm(⦏"cn_boolean_thm"⦎, ([], ⓩBOOLEAN = {FALSE, TRUE}⌝));
req_thm(⦏"cn_boolean_succ_thm"⦎, ([], ⓩBOOLEANvSUCC = {FALSE ↦ TRUE}⌝));
req_thm(⦏"cn_boolean_pred_thm"⦎, ([], ⓩBOOLEANvPRED = {TRUE ↦ FALSE}⌝));
req_thm(⦏"cn_boolean_pos_thm"⦎, ([], ⓩBOOLEANvPOS = id BOOLEAN⌝));
req_thm(⦏"cn_boolean_val_thm"⦎, ([], ⓩBOOLEANvVAL = id BOOLEAN⌝));
=DESCRIBE
These theorems, together with the definitions of:
=GFT
FALSE, TRUE, BOOLEANvFIRST, BOOLEANvLAST
=TEX
\ permit the values, sets and functions associated with the type $BOOLEAN$ to be simplified away.

To maintain the understandability of intermediate results, expansion of
$TRUE$ and $FALSE$ as the numbers $0$ and $1$ is avoided in
the proof procedures.
This approach is reflected in these theorems.
The definitions of $TRUE$ and $FALSE$ may always be used directly to translate them into $0$ and $1$ by the user, when (rarely) required.
=ENDDOC
=THDOC
req_thm(⦏"cn_¬_true_eq_false_thm"⦎, ([], ⓩ¬TRUE = FALSE⌝));
req_thm(⦏"cn_boolean_cases_thm"⦎, ([], ⓩ∀x:BOOLEAN⦁ x = TRUE ∨ x = FALSE⌝));
req_thm(⦏"cn_boolean_∈_boolean_thm"⦎, ([], ⓩ∀ x : 𝕌 ⦁ Boolean x ∈ BOOLEAN⌝));
=DESCRIBE
These theorems give basic facts about the type $BOOLEAN$ which are required to justify the translation of Compliance Notation boolean expressions into Z predicates.
=ENDDOC
\subsubsection{Boolean Operators}
=THDOC
req_thm(⦏"cn_boolean_clauses"⦎, ([], ⓩ
	TRUE = Boolean true
∧	FALSE = Boolean false
∧	(∀ p : 𝕌 ⦁ not Boolean p = Boolean (Π(¬p)))
∧	(∀ p, q : 𝕌 ⦁ Boolean p and Boolean q = Boolean (Π(p ∧ q)))
∧	(∀ p, q : 𝕌 ⦁ Boolean p or Boolean q = Boolean (Π(p ∨ q)))
∧	(∀ p, q : 𝕌 ⦁ Boolean p xor Boolean q = Boolean (Π(¬(p ⇔ q))))
∧	(∀ p, q : 𝕌 ⦁ Boolean p = Boolean q ⇔ (p ⇔ q))
⌝));
=DESCRIBE
The strategy for handling the boolean operators is to convert an expression
in $not$, $and$, $or$, and $xor$, into an expression of the form
$Boolean\,p$, where $p$ is constructed using the Z propositional operators.
When such expressions appear as the operands of an equality, the whole predicate can be converted to a Z predicate not involving $Boolean$.

These theorems support this strategy.
They use the universal set $𝕌$ to make them easier to instantiate.
The cast $Π$ is a purely syntactic device used to allow a propositional connective in a function argument (see \cite{DS/FMU/IED/USR005}).
=SEEALSO
$cn\_boolean\_clauses1$, $cn\_boolean\_clauses2$.
=ENDDOC

=THDOC
req_thm(⦏"cn_boolean_clauses1"⦎, ([], ⓩ
	(∀ x : BOOLEAN ⦁ (not x = Boolean (Π(¬ x = Boolean true)))) ∧
	(∀ x, y : BOOLEAN ⦁
		(x and y) = Boolean (Π((x = Boolean true) ∧ (y = Boolean true)))) ∧
	(∀ x, y : BOOLEAN ⦁
		(x or y) = Boolean (Π((x = Boolean true) ∨ (y = Boolean true)))) ∧
	(∀ x, y : BOOLEAN ⦁
		(x xor y) = Boolean (Π(¬ (x = Boolean true) ⇔ (y = Boolean true))))
⌝));
=DESCRIBE
The strategy for handling the boolean operators is to convert an expression
in $not$, $and$, $or$, and $xor$, into an expression of the form
$Boolean\,p$, where $p$ is constructed using the Z propositional operators.
When such expressions appear as the operands of an equality, the whole predicate can be converted to a Z predicate not involving $Boolean$ (except applied to $true$).

This theorem, with $cn\_boolean\_clauses2$, support this strategy when one or both of the arguments of a boolean
operator are not of the form $Boolean\ x$ for some $x$.
In these cases, if the argument is known to be of type $BOOLEAN$
these theorems can be used.

One way to use the theorems in a tactic proof is if the leaves of a term created from the boolean operators are all associated with assumptions of the form $leaf ∈ BOOLEAN$.
In this case the tactic:
=GFT
a(ALL_FC_T  (rewrite_tac) [cn_boolean_clauses1, cn_boolean_clauses2]);
=TEX
in a proof context also containing $cn\_boolean\_clauses$ as a rewrite rule,
will rewrite the term into one using Z boolean operators and predicates with the arguments equated to $Boolean\ true$, and with a single, outer, $Boolean$.
=EXAMPLE
E.g.
=GFT
(*  3 *)  ⓩa ∈ BOOLEAN⌝
(*  2 *)  ⓩb ∈ BOOLEAN⌝
(*  1 *)  ⓩc ∈ BOOLEAN⌝
(* ?⊢ *)  ⓩ... a and (b or c) ...⌝
with the above tactic applied becomes:
(*  3 *)  ⓩa ∈ BOOLEAN⌝
(*  2 *)  ⓩb ∈ BOOLEAN⌝
(*  1 *)  ⓩc ∈ BOOLEAN⌝
(* ?⊢ *)  ⓩ...Boolean((a = Boolean true) ∧ (b = Boolean true ∨ c = Boolean true))...⌝
=TEX
=ENDDOC
=THDOC
req_thm(⦏"cn_boolean_clauses2"⦎, ([], ⓩ
	(∀ x : BOOLEAN ; p : 𝕌 ⦁
		(x and Boolean p) = Boolean (Π((x = Boolean true) ∧ p))) ∧
	(∀ x : BOOLEAN ; p : 𝕌 ⦁
		(Boolean p and x) = Boolean (Π(p ∧ (x = Boolean true)))) ∧
	(∀ x : BOOLEAN ; p : 𝕌 ⦁
		(x or Boolean p) = Boolean (Π((x = Boolean true) ∨ p))) ∧
	(∀ x : BOOLEAN ; p : 𝕌 ⦁
		(Boolean p or x) = Boolean (Π(p ∨ (x = Boolean true)))) ∧
	(∀ x : BOOLEAN ; p : 𝕌 ⦁
		(x xor Boolean p) = Boolean (Π(¬ (x = Boolean true) ⇔ p))) ∧
	(∀ x : BOOLEAN ; p : 𝕌 ⦁
		(Boolean p xor x) = Boolean (Π(¬ p ⇔ (x = Boolean true))))
⌝));
=DESCRIBE
See $cn\_boolean\_clauses1$ for use.
=ENDDOC
=THDOC
req_thm(⦏"cn_and_then_or_else_clauses"⦎, ([], ⓩ
	∀x, y:𝕌⦁	(x and_then y) = (x and y) ∧ (x or_else y) = (x or y)
⌝));
=DESCRIBE
The operators {\it and\_then} and {\it or\_else} are dealt
with by rewriting them in terms of {\it and} and {\it or}.
=ENDDOC
\subsubsection{Relational Operators returning BOOLEANs}
=THDOC
req_thm(⦏"cn_relational_clauses"⦎, ([], ⓩ
	(∀ x : 𝕌; S : 𝕌 ⦁ x mem S = Boolean (x ∈ S))
∧	(∀ x : 𝕌; S : 𝕌 ⦁ x notmem S = Boolean (Π(¬x ∈ S)))
∧	(∀ x, y : 𝕌 ⦁ x eq y = Boolean (x = y))
∧	(∀ x, y : 𝕌 ⦁ x noteq y = Boolean (Π(¬x = y)))
∧	(∀ x, y : 𝕌 ⦁ x less y = Boolean (x < y))
∧	(∀ x, y : 𝕌 ⦁ x less_eq y = Boolean (x ≤ y))
∧	(∀ x, y : 𝕌 ⦁ x greater y = Boolean (x > y))
∧	(∀ x, y : 𝕌 ⦁ x greater_eq y = Boolean (x ≥ y))
⌝));
=DESCRIBE
The strategy for handling the relational operators is to convert them into expressions of the form
$Boolean\,p$, where $p$ is an atomic Z predicate or the negation of one.

These theorems support this strategy.
They use the universal set $𝕌$ to make them easier to instantiate.
The cast $Π$ is a purely syntactic device used to allow a propositional connective in a function argument (see \cite{DS/FMU/IED/USR005}).
=ENDDOC
=THDOC
req_thm(⦏"cn_relational_clauses1"⦎, ([], ⓩ
	(∀ x, y : 𝕌 ⦁ x real_less y = Boolean (x <⋎R y))
∧	(∀ x, y : 𝕌 ⦁ x real_less_eq y = Boolean (x ≤⋎R y))
∧	(∀ x, y : 𝕌 ⦁ x real_greater y = Boolean (x >⋎R y))
∧	(∀ x, y : 𝕌 ⦁ x real_greater_eq y = Boolean (x ≥⋎R y))
⌝));
=DESCRIBE
These theorems support the strategy for handling the relational operators withe real operands.
=ENDDOC


The effect of rewriting with the theorems presented in this section
and the previous section is shown in the following example,
in which we show how the expression ``%
=INLINEFT
N eq 0 or not N less 4 = TRUE
=TEX
'' is rewritten as ``%
=INLINEFT
N = 0 ∨ ¬ N < 4
=TEX
''.
=GFT Rewriting Example
N eq 0 or not N less 4 = TRUE
1)	===> Boolean (N = 0) or not Boolean (N < 4) = Boolean true
2)	===> Boolean (N = 0) or Boolean (¬ N < 4) = Boolean true
3)	===> Boolean (N = 0 ∨ ¬ N < 4) = Boolean true
4)	===> N = 0 ∨ ¬ N < 4 ⇔ true
5)	===> N = 0 ∨ ¬ N < 4
=TEX
Here in step 1 the theorem of this section starts thing off by turning the
Compliance Notation atomic predicates into Z expressions involving $Boolean$.
In steps 2 and 3, the theorems of the previous section turn
the vocabulary of the theory $cn$ into the Z toolkit vocabulary using the argument of $Boolean$ to accumulate the result.
At step 4 $Boolean$ is eliminated.
Finally a standard {\ProductZ} simplification removes the unnecessary ``%
=INLINEFT
⇔ true
=TEX
''.
\subsubsection{Numeric Operators}
=THDOC
req_thm(⦏"cn_intdiv_0_thm"⦎,([], ⓩ∀ j: ℤ | ¬j = 0 ⦁
	0 intdiv j = 0 ∧ 0 rem j = 0 ∧ 0 intmod j = 0⌝));
req_thm(⦏"cn_intdiv_thm"⦎,([], ⓩ∀ i,j,k : ℤ | ¬j = 0 ⦁ (i intdiv j = k) ⇔
	(∃ m : ℤ ⦁ i = k * j + m ∧ abs m < abs j
	∧ ((0 ≤ i ∧ 0 ≤ m ) ∨ (i < 0 ∧ m ≤ 0)) )⌝));
req_thm(⦏"cn_rem_thm"⦎,([], ⓩ∀ i,j,k : ℤ | ¬j = 0 ⦁ (i rem j = k) ⇔
	(∃ d : ℤ ⦁ i = d * j + k ∧ abs k < abs j
	∧ ((0 ≤ i ∧ 0 ≤ k ) ∨ (i < 0 ∧ k ≤ 0)) )⌝));
req_thm(⦏"cn_intmod_thm"⦎,([], ⓩ∀ i,j,k : ℤ | ¬j = 0 ⦁ (i intmod j = k) ⇔
	(∃ d : ℤ ⦁ i = d * j + k ∧ abs k < abs j
	∧ ((0 ≤ j ∧ 0 ≤ k ) ∨ (j < 0 ∧ k ≤ 0)) )⌝));
=DESCRIBE
These theorems provide support for reasoning about $intmod$, $intdiv$ and $rem$.
=ENDDOC
=THDOC
req_thm(⦏"z_succ↗n↕_⨾_thm"⦎, ([], ⓩ∀ x : 𝕌; y : 𝕌 ⦁
	(succ ↗ x ↕ ⨾ y) =
		{ a : 𝕌; b : 𝕌 |
		((1 ≤ x ∧ 0 ≤ a) ∨ (¬ (0 ≤ x) ∧ ((0 - x) ≤ a)) ∨ (x = 0));
		(a + x, b) ∈ y ⦁
		(a, b)}
	⌝));
=DESCRIBE
This is useful for handling array aggregate definitions.
=ENDDOC
=THDOC
req_thm(⦏"cn_integer_to_real_thm"⦎, ([], ⓩ
	∀ x : ℤ ⦁ integer_to_real x = real x
⌝));
=DESCRIBE
This theorems act as a rewrite rule to
recast a compliance notation global variable
in terms of the underlying Z ones.
=ENDDOC
\subsubsection{Integers}
Since there are no defining properties for the $INTEGER$ etc., no useful theorems can be provided.
Such theorems would have to be derived from additional axioms asserted by the user, perhaps representing the relevant parameters for a particular Ada compiler.
\subsection{ML Bindings for Theorems}
=DOC
val ⦏cn_boolean_cases_thm⦎ : THM;
val ⦏cn_boolean_clauses⦎ : THM;
val ⦏cn_boolean_clauses1⦎ : THM;
val ⦏cn_boolean_clauses2⦎ : THM;
val ⦏cn_and_then_or_else_clauses⦎ : THM;
val ⦏cn_boolean_pos_thm⦎ : THM;
val ⦏cn_boolean_pred_thm⦎ : THM;
val ⦏cn_boolean_succ_thm⦎ : THM;
val ⦏cn_boolean_thm⦎ : THM;
val ⦏cn_boolean_∈_boolean_thm⦎ : THM;
val ⦏cn_boolean_val_thm⦎ : THM;
val ⦏cn_relational_clauses⦎ : THM;
val ⦏cn_relational_clauses1⦎ : THM;
val ⦏cn_¬_true_eq_false_thm⦎ : THM;
val ⦏cn_intdiv_0_thm⦎ : THM;	
val ⦏cn_intdiv_thm⦎ : THM;
val ⦏cn_rem_thm⦎ : THM;
val ⦏cn_intmod_thm⦎ : THM;
val ⦏z_succ↗n↕_⨾_thm⦎ : THM;
val ⦏cn_integer_to_real_thm⦎ : THM;
=DESCRIBE
These are the ML names for the theorems in the theory ``$cn$'', which contains
extensions to the Z toolkit required to support the Compliance Notation.
=ENDDOC
\subsection{Proof Procedures}\label{ProofProcedures}
\subsubsection{Syntax Manipulation}
In coding proof procedures such as constant expression evaluators it is sometimes convenient to have functions to manipulate the syntax of the expressions in question.
The rewrite rules of section \ref{Theorems} are such that customised syntax functions will only be required for the numeric operators.
The boolean and relational operators are turned fairly directly into Z and will not need detailed syntax manipulation.

=DOC
val ⦏mk_cn_intdiv⦎ : TERM * TERM -> TERM;
val ⦏mk_cn_rem⦎ : TERM * TERM -> TERM;
val ⦏mk_cn_intmod⦎ : TERM * TERM -> TERM;
val ⦏mk_cn_star_star⦎ : TERM * TERM -> TERM;
val ⦏dest_cn_intdiv⦎ : TERM -> TERM * TERM;
val ⦏dest_cn_rem⦎ : TERM -> TERM * TERM;
val ⦏dest_cn_intmod⦎ : TERM -> TERM * TERM;
val ⦏dest_cn_star_star⦎ : TERM -> TERM * TERM;
val ⦏is_cn_intdiv⦎ : TERM -> bool;
val ⦏is_cn_rem⦎ : TERM -> bool;
val ⦏is_cn_intmod⦎ : TERM -> bool;
val ⦏is_cn_star_star⦎ : TERM -> bool;
=DESCRIBE
These are constructor, destructor and discriminator functions for the operators which support the numeric operations of the Compliance Notation.
=FAILURE
509001	?0 does not have type ℤ
509002	?0 is not of the form ⓩi intdiv j⌝
509003	?0 is not of the form ⓩi rem j⌝
509004	?0 is not of the form ⓩi intmod j⌝
509005	?0 is not of the form ⓩi ** j⌝
=ENDDOC
\subsubsection{Constant Expression Evaluation}
The rewrite rules of section \ref{Theorems} reduce everything except the numeric operators to a form where the facilities for evaluating Z constant expressions will do what is required.
=DOC
val ⦏cn_intdiv_conv⦎ : CONV;
val ⦏cn_rem_conv⦎ : CONV;
val ⦏cn_intmod_conv⦎ : CONV;
val ⦏cn_star_star_conv⦎ : CONV;
=DESCRIBE
These conversions  perform evaluation of expressions with constant operands formed using the operators which support the numeric operations of the Compliance Notation.

Each conversion expects an
expression of the form $i\,op\,j$ where $op$ is
one of $intdiv$, $rem$, $intmod$, or $**$, and where $i$
and $j$ are signed integer literals (i.e., either numeric literals or of the form
=INLINEFT
~k
=TEX
, where $k$ is a numeric literal).
The resulting theorem has conclusion $i\,op\,j\,=\,r$, where $r$ is the signed literal resulting from evaluating the expression.

=FAILURE
509011	?0 is not of the form ⓩi intdiv j⌝ where ⓩi⌝ and ⓩj⌝ are numeric literals
509012	?0 is not of the form ⓩi rem j⌝ where ⓩi⌝ and ⓩj⌝ are numeric literals
509013	?0 is not of the form ⓩi intmod j⌝ where ⓩi⌝ and ⓩj⌝ are numeric literals
509014	?0 is not of the form ⓩi ** j⌝ where ⓩi⌝ and ⓩj⌝ are numeric literals
=ENDDOC
=DOC
val ⦏cn_mod_and_conv⦎ : CONV;
val ⦏cn_mod_or_conv⦎ : CONV;
val ⦏cn_mod_xor_conv⦎ : CONV;
val ⦏cn_mod_not_conv⦎ : CONV;
=DESCRIBE
These conversions  perform evaluation of expressions with constant operands formed using the operators which support the numeric operations of the Compliance Notation.

Each conversion expects an
expression of the form $i\,op\,j$ or $mod\_not\,i$, where $op$ is
one of $mod\_and$, $mod\_or$, $mod\_xor$ and where $i$
and $j$ are signed integer literals (i.e., either numeric literals or of the form
=INLINEFT
~k
=TEX
, where $k$ is a numeric literal).
The resulting theorem has conclusion $i\,op\,j\,=\,r$, where $r$ is the signed literal resulting from evaluating the expression.

=FAILURE
509021	?0 is not of the form ⓩi mod_and j⌝ where ⓩi⌝ and ⓩj⌝ are numeric literals
509022	?0 is not of the form ⓩi mod_or j⌝ where ⓩi⌝ and ⓩj⌝ are numeric literals
509023	?0 is not of the form ⓩi mod_xor j⌝ where ⓩi⌝ and ⓩj⌝ are numeric literals
509024	?0 is not of the form ⓩmod_not i⌝ where ⓩi⌝ is a numeric literal
=ENDDOC
\subsubsection{Proof Contexts}\label{ProofContexts}

NOTE: The proof contexts $cn1'$ etc. are actually defined in \cite{ISS/HAT/DAZ/IMP518}. They are described here for convenience of
the user reading reference documentation derived from this document.
=DOC
(* Proof Context: ⦏'cn⦎ *)
(* Proof Context: ⦏'cn1⦎ *)
=DESCRIBE
Component proof context for the theory $cn$ which supports the Compliance Notation.
$'cn1$ is a slightly improved version of the original $'cn$.

The main purpose of these proof contexts is to automate the elimination of the vocabulary of the theory $cn$ in favour of plain Z toolkit constructs wherever this is possible without introducing excessive complexity.

Expressions and predicates treated by the proof contexts are constructs formed from:
=GFT
not _, _ and _, _ or _, _ xor _, , _ and_then _, _ or_else _,
_ mem _, _ notmem _, _ eq _, _ noteq _,
_ less _, _ less_eq _, _ greater _, _ greater_eq _,
_ intdiv _, _ rem _, _ ** _, _ mod_and _, _ mod_or _,
_ mod_xor _, _mod_not
=TEX

\paragraph{Contents}\

Rewriting:
=GFT
cn_boolean_thm (cn only), cn_boolean_succ_thm, cn_boolean_pred_thm,
cn_boolean_pos_thm, cn_boolean_val_thm,
cn_boolean_clauses, cn_relational_clauses,
cn_intdiv_conv, cn_rem_conv, cn_intmod_conv, cn_star_star_conv
cn_boolean_∈_boolean_thm (cn1 only)
z_size_dot_dot_conv (cn1 only)
cn_and_then_or_else_clauses
=TEX
Stripping theorems:
(none)
=SEEALSO
$cn$, $cn\_ext$
=ENDDOC
=DOC
(* Proof Context: ⦏'cn_reals⦎ *)
=DESCRIBE
Component proof context for the theory $cn$ which supports the Compliance Notation
treatment of Ada fixed and floating point types.

The purpose of the proof context is to automate the elimination of the vocabulary of the theory $cn$ concerned with real numbers
in favour of plain Z toolkit constructs wherever this is possible without introducing excessive complexity.

Expressions and predicates treated by the proof contexts are constructs formed from
the Z real arithmetic operators and the Compliance Notation operators
=INLINEFT
_e_, integer_to_real
=TEX
\ and
=INLINEFT
integer_to_real
=TEX
.

This proof context will typically be used in conjunction with one of the other Compliance Notation
proof contexts and the proof context for the Z real numbers. E.g.,
=GFT
set_merge_pcs["'cn_reals", "'z_reals", "cn"];
=TEX
\paragraph{Contents}\

Rewriting:
=GFT
cn_e_0_thm
cn_relational_clauses1
cn_integer_to_real_thm
=TEX
Stripping theorems:
=GFT
cn_relational_clauses1
=SEEALSO
$'cn$, $'cn1$
=ENDDOC
=DOC
(* Proof Context: ⦏cn⦎ *)
(* Proof Context: ⦏cn_ext⦎ *)
(* Proof Context: ⦏cn1⦎ *)
(* Proof Context: ⦏cn1_ext⦎ *)
=DESCRIBE
Complete proofs context for the theory $cn$ which supports the Compliance Notation.
$cn1$ is the recommended proof context for normal use while reasoning about VCs generated  by the compliance tool.
$cn$ is still provided for backwards compatibility.

$cn1$ is the merge of the component proof contexts $'cn1$ and $z\_library1$.
$cn1\_ext$ is the merge of the component proof contexts $'cn$ and $z\_library1\_ext$.

$cn$ is the merge of the component proof contexts $'cn$ and $z\_library$.
$cn\_ext$ is the merge of the component proof contexts $'cn$ and $z\_library\_ext$.
=SEEALSO
$'cn1$, $'cn$, $z\_library1$, $z\_library1\_ext$
=ENDDOC

\subsection{Epilogue}
=SML
end (* end of signature CNToolkitExtensions *);
=TEX
=SML
reset_flag ("z_type_check_only");
reset_flag ("z_use_axioms");
reset_flag("standard_z_paras");
=TEX


=TEX
\section{TEST POLICY}

The module tests for this module are to follow the guidelines
identified in the quality plan~\cite{ISS/HAT/DAZ/PLN003}.
There are no special testing considerations.

\small
\twocolumn[\section{INDEX}]
\printindex

\end{document}




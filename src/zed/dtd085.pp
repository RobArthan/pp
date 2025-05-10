=IGN
********************************************************************************
dtd085.doc: this file is part of the PPZed system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  dtd085.doc  ℤ $Date: 2004/02/02 12:47:40 $ $Revision: 1.15 $ $RCSfile: dtd085.doc,v $
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

\def\Title{Detailed Design of the Z Library Functions}

\def\AbstractText{This document contains the detailed design of the Z Library Functions and their proof support.}

\def\Reference{DS/FMU/IED/DTD085}

\def\Author{D.J. King, K. Blackburn}


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
%% LaTeX2e port: \def\Bool{``$\it{:}bool\,$''}
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{FST PROJECT}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Detailed Design of the Z Library Functions}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/DTD085}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.15 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2004/02/02 12:47:40 $%
%% LaTeX2e port: }}
%% LaTeX2e port: %\TPPstatus{Approved}
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: % \TPPauthor{D.J.~King & WIN01}  %% Mandatory field
%% LaTeX2e port: \TPPauthors{D.J.~King & WIN01\\K.~Blackburn & WIN01}
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document contains the detailed design of
%% LaTeX2e port: the Z Library Functions and their proof support.}
%% LaTeX2e port: %\TPPabstractB{}
%% LaTeX2e port: %\TPPabstractC{}
%% LaTeX2e port: %\TPPabstractD{}
%% LaTeX2e port: %\TPPabstractE{}
%% LaTeX2e port: %\TPPabstractF{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port:       Project Library}}
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

\subsection{Changes History}  % to get section number `0.3'
\begin{description}
\item [Issue 1.1 (1992/10/28) (22nd October 1992)]
First version, derived from 078 and 083.
\item [Issue 1.2 (1992/10/30) (30th October 1992)]
Tidying up.
\item [Issue 1.3 (1992/11/12), 12th November 1992]
Changes as a consequence of changes in dependences.
\item [Issue 1.4 (1992/11/16), 16th November 1992]
Added additional theorems for reasoning about applications.
\item[Issue 1.5 (1992/12/11) (11th December 1992)]
Global rename from wrk038.doc issue 1.9.
\item[Issue 1.6 (1992/12/17) (17th December 1992)]
Removed spurious ML bindings.
\item[Issue 1.7 (1993/02/10)-1.9 (1993/02/12) (8th-12th February 1993)]
Rearranging proof contexts.
\item[Issue 1.10 (1993/02/16) (16th February 1993)]
Added function clauses.
\item[Issue 1.11 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.12 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.13 (2003/07/16)] Cured theorems that used to have free variables.
\item[Issue 1.14 (2004/01/19)] The Z universal set is now called 𝕌.
\item[Issue 1.15 (2004/02/02)] Addressed comments on USR030 from QinetiQ.
\item[Issue 1.16 (2005/02/26)] Precedences and associativity of toolkit operators now follow \cite{ISO02}.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported PPZed to Lemma 1 document template.

\item[2025/03/05]
Added theorem for pushing function application through a conditional.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
None.
\pagebreak
\section{GENERAL}
\subsection{Scope}
This document contains the detailed design
of the mathematical toolkit for HOL/Z.
The high level design for this material is given in \cite{DS/FMU/IED/HLD017}.
\subsection{Introduction}

\subsection{Purpose and Background}
See \cite{DS/FMU/IED/HLD017}.
\subsection{Dependencies}
Loading this document and its implementation requires that
\cite{DS/FMU/IED/IMP083} has been loaded.
\subsection{Possible Enhancements}
The only current proof context expands out memberships of Z functions, which
is too brutal for a general-purpose mild proof context. The only alternative,
which is interesting, but still doesn't fit the bill, is:
=GFT
x ⇸ y   ---> unchanged
x → y   ---> (x ⇸ y) ∩ {f:𝕌 | dom f = x}
x ⤔ y   ---> (x ⇸ y) ∩ {f:𝕌 | ∀x1,x2:dom f⦁ f x1 = f x2 ⇒ x1 = x2}
x ↣ y   ---> (x ⇸ y) ∩ {f:𝕌 | dom f = x} ∩
			{f:𝕌 | ∀x1,x2:dom f⦁ f x1 = f x2 ⇒ x1 = x2}
x ⤀ y   ---> (x ⇸ y) ∩ {f:𝕌 | ran f = y}
x ↠ y   ---> (x ⇸ y) ∩ {f:𝕌 | dom f = x} ∩ {f:𝕌 | ran f = y}
x ⤖ y   ---> (x ⇸ y) ∩ {f:𝕌 | dom f = x} ∩ {f:𝕌 | ran f = y} ∩
			{f:𝕌 | ∀x1,x2:dom f⦁ f x1 = f x2 ⇒ x1 = x2}
=TEX
This normalises onto $⇸$, which seems a potentially interesting idea.
A variant of the idea would "protect" the set comprehensions against
expansion becase of a membership, by introducing 3 appropriate constants.

\subsection{Deficiencies}
None known.
\section{PROLOGUE}

=SML
open_theory"z_relations";
push_pc "z_sets_ext";
delete_theory"z_functions" handle Fail _ => ();
val _ = set_flag ("z_type_check_only", false);
val _ = set_flag ("z_use_axioms", true);
new_theory"z_functions";
=TEX
\section {DEFINITION OF FIXITY}

The following fixity information is taken from \cite{ISO02}.



ⓈZ
generic 5 rightassoc _ ⇸ _, _ ⤔ _, _ ↣ _, _ ⤀ _, _ ↠ _
■

ⓈZ
generic 5 rightassoc _ ⤖ _
■

\section{FUNCTIONS}
Note that $→$ is defined in \cite{DS/FMU/IED/DTD078},
as it is required to define the Z Library set material.

\subsection{Partial Functions}

ⓈZ
X ⦏⇸⦎ Y ≜ {f : X ↔ Y |
	(∀ x : X; y1, y2 : Y ⦁ (x ↦ y1) ∈ f ∧ (x ↦ y2) ∈ f ⇒ (y1 = y2))}
■

\subsection{Injections}

ⓈZ
X ⦏⤔⦎ Y ≜ {f : X ⇸ Y | (∀ x1, x2 : dom f ⦁ f (x1) = f (x2) ⇒ x1 = x2)}
■

ⓈZ
X ⦏↣⦎ Y ≜ (X ⤔ Y) ∩ (X → Y)
■

\subsection{Surjections}

ⓈZ
X ⦏⤀⦎ Y ≜ {f : X ⇸ Y | ran f = Y}
■

ⓈZ
X ⦏↠⦎ Y ≜ (X ⤀ Y) ∩ (X → Y)
■

\subsection{Bijection}

ⓈZ
X ⦏⤖⦎ Y ≜ (X ↠ Y) ∩ (X ↣ Y)
■
\section{START OF STRUCTURE}
=DOC
signature ⦏ZFunctions⦎ = sig
=DESCRIBE
This provides the basic proof support for the Z library functions.
It creates the theory $z\_functions$.
=ENDDOC
=THDOC
req_name ⦏"z_functions"⦎ (Value "z_relations");
req_language "Z";
set_flag("tc_thms_only",true);
=DESCRIBE
The theory $z\_functions$ contains various definitions of function operators, and ``defining theorems'' derived from these definitions.
It is created in structure $ZFunctions$.
=ENDDOC

=THDOC
req_thm(⦏"z_⇸_thm"⦎, ([],ⓩ∀ f: 𝕌;
	X: 𝕌; Y: 𝕌⦁
	f ∈ X ⇸ Y
      ⇔ f ∈ X ↔ Y
	∧ (∀ x : X; y1, y2 : Y⦁ (x, y1) ∈ f ∧ (x, y2) ∈ f ⇒ y1 = y2)⌝));
req_thm(⦏"z_⇸_thm1"⦎, ([],ⓩ∀ f : 𝕌; X : 𝕌; Y : 𝕌
          ⦁ f ∈ (X ⇸ Y)
            ⇔ f ∈ (X ↔ Y)
              ∧ (∀ x : 𝕌; y1, y2 : 𝕌 |
		x ∈ X ∧ y1 ∈ Y ∧ y2 ∈ Y
                ⦁ (x, y1) ∈ f ∧ (x, y2) ∈ f ⇒ y1 = y2)⌝));
req_thm(⦏"z_→_thm"⦎, ([],ⓩ∀ f: 𝕌;
	X: 𝕌; Y: 𝕌⦁
	f ∈ X → Y ⇔ f ∈ X ⇸ Y ∧ dom f = X⌝));
req_thm(⦏"z_→_app_thm"⦎, ([],ⓩ∀ X: 𝕌; Y: 𝕌;
	f: 𝕌; x: 𝕌⦁
	f ∈ X → Y ∧ x ∈ X ⇒ f x ∈ Y ∧ (x, f x) ∈ f⌝));
req_thm(⦏"z_⇸_clauses"⦎, ([], ⓩ∀ Y:𝕌 ⦁
	{} ⇸ Y = {{}} ∧
	Y ⇸ {} = {{}}⌝));
req_thm(⦏"z_→_clauses"⦎, ([], ⓩ∀ Y:𝕌 ⦁
	{} → Y = {{}} ∧
	Y → {} = {x:𝕌| x = {} ∧ Y = {}}⌝));

=DESCRIBE
Partial and total functions.
$z\_⇸\_thm$ is compact, but $z\_⇸\_thm1$ is better for
rewriting.
=ENDDOC
Spivey Ed 1. page 105

=THDOC
req_thm(⦏"z_⤔_thm"⦎, ([],ⓩ∀ f: 𝕌;
	X: 𝕌; Y: 𝕌⦁
	f ∈ X ⤔ Y
      ⇔ f ∈ X ⇸ Y ∧ (∀ x1, x2 : 𝕌 |
		x1 ∈ dom f ∧ x2 ∈ dom f ⦁ f x1 = f x2 ⇒ x1 = x2)⌝));
req_thm(⦏"z_↣_thm"⦎, ([],ⓩ∀ f: 𝕌;
	X: 𝕌; Y: 𝕌⦁
	f ∈ X ↣ Y
      ⇔ f ∈ X → Y ∧ (∀ x1, x2 : 𝕌 |
		x1 ∈ dom f ∧ x2 ∈ dom f⦁
		f x1 = f x2 ⇒ x1 = x2)⌝));
req_thm(⦏"z_⤔_clauses"⦎, ([], ⓩ∀ Y:𝕌 ⦁
	{} ⤔ Y = {{}} ∧
	Y ⤔ {} = {{}}⌝));
req_thm(⦏"z_↣_clauses"⦎, ([], ⓩ∀ Y:𝕌 ⦁
	{} ↣ Y = {{}} ∧
	Y ↣ {} = {x:𝕌| x = {} ∧ Y = {}}⌝));
=DESCRIBE
Partial and total injections.
=ENDDOC
Spivey Ed 1. page 106

=THDOC
req_thm(⦏"z_⤀_thm"⦎, ([], ⓩ∀ f: 𝕌;
	X: 𝕌; Y: 𝕌⦁
	f ∈ X ⤀ Y ⇔ f ∈ X ⇸ Y ∧ ran f = Y⌝));
req_thm(⦏"z_↠_thm"⦎, ([],ⓩ∀ f: 𝕌;
	X: 𝕌; Y: 𝕌⦁
	f ∈ X ↠ Y ⇔ f ∈ X → Y ∧ ran f = Y⌝));
req_thm(⦏"z_⤖_thm"⦎, ([],ⓩ∀ f: 𝕌;
	X: 𝕌; Y: 𝕌⦁
	f ∈ X ⤖ Y
	⇔ f ∈ X → Y
	 ∧ ran f = Y
	 ∧ (∀ x1, x2 : 𝕌 |
		x1 ∈ dom f ∧ x2 ∈ dom f ⦁
		f x1 = f x2 ⇒ x1 = x2)⌝));
req_thm(⦏"z_⤀_clauses"⦎, ([], ⓩ∀ Y:𝕌 ⦁
	{} ⤀ Y = {x:𝕌| x = {} ∧ Y = {}} ∧
	Y ⤀ {} = {{}}⌝));
req_thm(⦏"z_↠_clauses"⦎, ([], ⓩ∀ Y:𝕌 ⦁
	{} ↠ Y = {x:𝕌| x = {} ∧ Y = {}} ∧
	Y ↠ {} = {x:𝕌| x = {} ∧ Y = {}}⌝));
req_thm(⦏"z_⤖_clauses"⦎, ([], ⓩ∀ Y:𝕌 ⦁
	{} ⤖ Y = {x:𝕌| x = {} ∧ Y = {}} ∧
	Y ⤖ {} = {x:𝕌| x = {} ∧ Y = {}}⌝));

=DESCRIBE
Partial and total surjections, and bijections.
=ENDDOC
Spivey Ed 1. page 106

=THDOC
req_thm(⦏"z_→_app_∈_rel_thm"⦎, ([],
	ⓩ∀X: 𝕌; Y : 𝕌⦁∀f : X → Y; x : X⦁(x, f x) ∈ f⌝));
req_thm(⦏"z_→_app_eq_⇔_∈_rel_thm"⦎, ([],
	ⓩ∀X: 𝕌; Y : 𝕌⦁∀f : X → Y; x : X; z : 𝕌⦁f x = z ⇔ (x, z) ∈ f⌝));
req_thm(⦏"z_→_∈_rel_⇔_app_eq_thm"⦎, ([],
	ⓩ∀X: 𝕌; Y : 𝕌⦁∀f : X → Y; x : X; z : 𝕌⦁(x, z) ∈ f ⇔ f x = z⌝));
=DESCRIBE
These theorems are convenient for use in a forward or backwards
chaining style to reason about function application.
=ENDDOC

The following are here because they rely on functional
reasoning in their implementation.
=THDOC
req_thm(⦏"z_∈_first_thm"⦎, ([],ⓩ∀ x: 𝕌 ⦁
	x ∈ first ⇔ x.1.1 = x.2⌝));
req_thm(⦏"z_∈_second_thm"⦎, ([],ⓩ∀ x: 𝕌 ⦁
	x ∈ second ⇔ x.1.2 = x.2⌝));
=DESCRIBE
Projections from pairs considered as relations.
=SEEALSO
$z\_first\_thm$, $z\_second\_thm$.
=ENDDOC
These theorems reflect a preference for the
general tuple selection functions.
Spivey Ed 1. page 89.

=THDOC
req_thm("⦏z_fun_app_clauses⦎", ([],
ⓩ∀ f:𝕌; x:𝕌;y:𝕌; X:𝕌;Y:𝕌 ⦁
	(f ∈ X ⇸ Y ∨ f ∈ X ⤔ Y ∨ f ∈ X ⤀ Y ∨
	 f ∈ X → Y ∨ f ∈ X ↣ Y ∨ f ∈ X ↠ Y ∨ f ∈ X ⤖ Y)
	∧ (x,y) ∈ f
	⇒ f x = y⌝));
=DESCRIBE
A portmanteau theorem for deriving an equation about an application.
For instance, used by:
=GFT
a(all_fc_tac[fun_app_clauses]);
=TEX
=ENDDOC
=THDOC
req_thm("⦏z_fun_∈_clauses⦎", ([],
ⓩ∀ f:𝕌; x:𝕌; X:𝕌;Y:𝕌 ⦁
	((f ∈ X → Y ∨ f ∈ X ↣ Y ∨ f ∈ X ↠ Y ∨ f ∈ X ⤖ Y)
	∧ x ∈ X
	⇒ f x ∈ Y)
	∧
	((f ∈ X ⇸ Y ∨ f ∈ X ⤔ Y ∨ f ∈ X ⤀ Y)
	∧ x ∈ dom f
	⇒ f x ∈ Y)⌝));
=DESCRIBE
A portmanteau theorem for deriving an equation about an the membership of an application of a function.
For instance, used by:
=GFT
a(all_fc_tac[fun_∈_clauses]);
=TEX
=ENDDOC
=THDOC
req_thm("⦏z_fun_dom_clauses⦎", ([],
ⓩ∀ f:𝕌; X:𝕌;Y:𝕌 ⦁
	((f ∈ X ⇸ Y ∨ f ∈ X ⤔ Y ∨ f ∈ X ⤀ Y)
	⇒ dom f ⊆ X)
 	∧
	((f ∈ X → Y ∨ f ∈ X ↣ Y ∨ f ∈ X ↠ Y ∨ f ∈ X ⤖ Y)
	⇒ dom f = X)⌝));
=DESCRIBE
A portmanteau theorem for deriving an equation about the domains of functions.
For instance, used by:
=GFT
a(all_fc_tac[z_fun_dom_clauses]);
=TEX
=ENDDOC
=THDOC
req_thm("⦏z_fun_ran_clauses⦎", ([],
ⓩ∀ f:𝕌; X:𝕌;Y:𝕌 ⦁
	((f ∈ X → Y ∨ f ∈ X ⇸ Y ∨ f ∈ X ⤔ Y ∨ f ∈ X ↣ Y)
	⇒ ran f ⊆ Y)
	∧
	((f ∈ X ⤀ Y ∨ f ∈ X ↠ Y ∨ f ∈ X ⤖ Y)
	⇒ ran f = Y)⌝));
=DESCRIBE
A portmanteau theorem for deriving an equation about the range of functions.
For instance, used by:
=GFT
a(all_fc_tac[z_fun_ran_clauses]);
=TEX
=ENDDOC

=THDOC
req_thm("⦏z_fun_app_if_thm⦎", ([],
ⓩ∀f : 𝕌; c : 𝕌; x, y : 𝕌⦁
	f(if c then x else y) = if c then f x else f y⌝));
=DESCRIBE
A useful fact about applying a function to a conditional.
=ENDDOC

\subsection{Definitions of the Theory}

=DOC
val ⦏z_⇸_def⦎ : THM;				val ⦏z_⤔_def⦎ : THM;
val ⦏z_↣_def⦎ : THM;				val ⦏z_⤀_def⦎ : THM;
val ⦏z_↠_def⦎ : THM;				val ⦏z_⤖_def⦎ : THM;	
=DESCRIBE
These are the ML bindings of the defining theorems in the theory $z\_functions$.
=ENDDOC
=DOC
val ⦏z_⇸_thm⦎ : THM;			val ⦏z_⇸_thm1⦎ : THM;
val ⦏z_→_thm⦎ : THM;			val ⦏z_→_app_thm⦎ : THM;
val ⦏z_⤔_thm⦎ : THM;			val ⦏z_↣_thm⦎ : THM;
val ⦏z_⤀_thm⦎ : THM;			val ⦏z_↠_thm⦎ : THM;
val ⦏z_⤖_thm⦎ : THM;			val ⦏z_∈_first_thm⦎ : THM;
val ⦏z_∈_second_thm⦎ : THM;		val ⦏z_→_app_∈_rel_thm⦎ : THM;
val ⦏z_→_app_eq_⇔_∈_rel_thm⦎ : THM;	val ⦏z_→_∈_rel_⇔_app_eq_thm⦎ : THM;
val ⦏z_⇸_clauses⦎ : THM; 			val ⦏z_→_clauses⦎ : THM;
val ⦏z_⤔_clauses⦎ : THM;			val ⦏z_↣_clauses⦎ : THM;
val ⦏z_⤀_clauses⦎ : THM;			val ⦏z_↠_clauses⦎ : THM;
val ⦏z_⤖_clauses⦎ : THM; 			val ⦏z_fun_app_clauses⦎ : THM;
val ⦏z_fun_∈_clauses⦎ : THM;		val ⦏z_fun_app_if_thm⦎ : THM;
val ⦏z_fun_ran_clauses⦎ : THM;		val ⦏z_fun_dom_clauses⦎ : THM;
=DESCRIBE
These are the ML bindings of the theorems in the theory $z\_functions$.
=ENDDOC
\section{PROOF CONTEXTS}
We provide the following proof contexts to reason about the above:

\begin{tabular}{l p{4in}}
$'z\_∈\_fun$ & Membership of Z functions (e.g. $⇸$). \\
\end{tabular}
=DOC
(* Proof Context: ⦏'z_∈_fun⦎ *)
=DESCRIBE
A component proof context for handling the membership of Z functions created by Z library operations.
Expressions and predicates treated by this proof context are constructs formed from:
=GFT
⤀, ↠, ⤖, ⤔, ↣, ⇸, →
=TEX

\paragraph{Contents}\

Rewriting:
=GFT
=TEX

Stripping theorems:
=GFT
=TEX

Stripping conclusions:
=GFT
=TEX
All three of the above also have theorems concerning the membership of terms generated by the following operators:
=GFT
⤀, ↠, ⤖, ⤔, ↣, ⇸, →
=TEX
Stripping also contains the above in negated forms.

Rewriting canonicalisation:
=GFT
=TEX

Automatic proof procedures are respectively $z\-\_basic\-\_prove\-\_tac$,
$z\-\_basic\-\_prove\-\_conv$,
and
no existence prover.
\paragraph{Usage Notes}
It requires theory $z\-\_sets$.
It is intended to be used with proof context ``$'$z$\_∈\_$rel''.
It is not intended to be mixed with HOL proof contexts.
=ENDDOC
=DOC
(* Proof Context: ⦏'z_fun_alg⦎ *)
=DESCRIBE
A component proof context for handling the simplification of Z functions created by Z library operations.
Expressions and predicates treated by this proof context are constructs formed from:
=GFT
⇸, →, ⤔, ↣, ⤀, ↠, ⤖
=TEX

\paragraph{Contents}\

Rewriting:
=GFT
z_⇸_clauses, z_→_clauses, z_⤔_clauses,
z_↣_clauses, z_↠_clauses, z_⤀_clauses, z_⤖_clauses
=TEX

Stripping theorems:
=GFT
z_⇸_clauses, z_→_clauses, z_⤔_clauses,
z_↣_clauses, z_↠_clauses, z_⤀_clauses, z_⤖_clauses
Expressed as membership statements as necessary, using ∈_C.
All also pushed through ¬.
=TEX

Stripping conclusions:
=GFT
z_⇸_clauses, z_→_clauses, z_⤔_clauses,
z_↣_clauses, z_↠_clauses, z_⤀_clauses, z_⤖_clauses
Expressed as membership statements as necessary, using ∈_C.
All also pushed through ¬.
=TEX

Rewriting canonicalisation:
=GFT
=TEX

Automatic proof procedures are respectively $z\-\_basic\-\_prove\-\_tac$,
$z\-\_basic\-\_prove\-\_conv$,
and
no existence prover.
\paragraph{Usage Notes}
It requires theory $z\-\_sets$.
The proof context ensures that its simplifications will
be attempted before more general rules concerned membership
of set operators are used (including extensionality rules).

It is not intended to be mixed with HOL proof contexts.
=ENDDOC
=DOC
(* Proof Context: ⦏z_fun_ext⦎ *)
=DESCRIBE
An aggressive complete proof context for reasoning about
Z functions. When stripping or rewriting it attempts to
reduce any predicate concerning function constructs to predicate calculus. As a side effect relational and set constructs
are also reduced to predicate calculus.
The proof context is a merge of:
=GFT
z_rel_ext - extensional reasoning about relations (and sets)
'z_∈_fun - membership of function constructs
'z_fun_alg - simplifications of function constructs
=TEX
It requires the theory ``z$\_$functions''.
=ENDDOC
\section{EPILOGUE}
=SML
end; (* of signature ZFunctions *)
=SML
reset_flag ("z_type_check_only");
reset_flag ("z_use_axioms");
=TEX

\section{TEST POLICY}
The module tests for this module are to follow the guidelines
laid down in the quality plan~\cite{DS/FMU/IED/PLN008}.

\twocolumn[\section{INDEX}]
\small
\printindex

\end{document}




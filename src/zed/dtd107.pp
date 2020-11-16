=IGN
********************************************************************************
dtd107.doc: this file is part of the PPZed system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  ℤ $Date: 2006/02/02 20:54:05 $ $Revision: 1.26 $ $RCSfile: dtd107.doc,v $
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

\def\Title{Detailed Design: Z Finiteness and Sequences}

\def\AbstractText{This document contains the detailed design of the theories $z\_functions1$, $z\_numbers1$, and $z\_sequences1$ and their proof support.}

\def\Reference{DS/FMU/IED/DTD107}

\def\Author{K. Blackburn}


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
%% LaTeX2e port: \TPPtitle{Detailed Design: Z Finiteness and Sequences}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/DTD107}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.26 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2006/02/02 20:54:05 $%
%% LaTeX2e port: }}
%% LaTeX2e port: %\TPPstatus{Draft}
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{K.~Blackburn & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & HAT Team Leader}
%% LaTeX2e port: \TPPabstract{This document contains the detailed design of
%% LaTeX2e port: the theories $z\_functions1$, $z\_numbers1$, and $z\_sequences1$ and their proof support.}
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
\item [Issue 1.1 (1996/01/16), 1.2 (1996/01/19) (15th January 1995)]
First versions, derived from wrk056.
\item[Issue 1.3 (1996/01/24) (24th January 1995)]
Corrected duplicate namings.
\item[Issue 1.4 (1996/02/22) (20th February 1996)]
Added $abs$, $mod$ and $div$ theorems.
\item[Issue 1.5 (1996/03/13)]
Added material about $⊕$.
\item [Issue 1.6 (1996/03/21)]
Added material about $succ$.
\item [Issues 1.8 (1996/03/26)-1.10 (1996/03/27)]
Added $z\_size\_dot\_dot\_conv$.
\item [Issue 1.11 (1996/03/29)]
Documented sequence induction.
\item [Issue 1.12 (1997/07/28)]
Documented finite set induction.
\item [Issue 1.13 (2001/07/05)]
Added material on sequence displays.
\item[Issue 1.14 (2002/07/10)]
Added new induction tactic and some theorems for sequences;
added new error messages for induction tactics.
\item[Issue 1.15 (2002/07/10)]
{\LaTeX} tidy-up.
\item[Issue 1.16 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.17 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.18 (2003/04/17)] Corrected examples of {\it z\_size\_dot\_dot\_conv}.
\item[Issues 1.19 (2003/04/28), 1.20 (2003/04/28)] {\it z\_size\_seq\_thm1} had a free variable that is now universally quantified.
\item[Issue 1.21 (2003/04/30)] Added conversion for equality of sequence displays.
\item[Issue 1.22 (2004/01/19)] The Z universal set is now called 𝕌.
\item[Issue 1.23 (2004/02/02)] Addressed comments on USR030 from QinetiQ.
\item[Issue 1.24 (2005/02/26)] Precedences and associativity of toolkit operators now follow \cite{ISO02}.
\item[Issue 1.25 (2005/08/03)] Added new theorems from mutilated chessboard proof.
\item[Issue 1.26 (2006/02/02)] Functional composition is now called ``∘''.
\item[Issue 1.27 (2007/05/28)] Added {\em z\_dot\_dot\_conv}.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported PPZed to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
None.
\pagebreak
\section{GENERAL}
\subsection{Scope}
This document contains the detailed design of
the theories $z\_functions1$, $z\_numbers1$, and $z\_sequences1$ and their proof support, parts
of the mathematical toolkit for HOL/Z.
The high level design for this material is given in \cite{DS/FMU/IED/HLD017}.
\subsection{Introduction}

\subsection{Purpose and Background}
See \cite{DS/FMU/IED/HLD017}.
\subsection{Dependencies}
Loading this document and its implementation requires that
\cite{DS/FMU/IED/IMP088} has been loaded.
\subsection{Possible Enhancements}
None known.

\subsection{Deficiencies}
None known.
\section{ZFunctions1}
\subsection{PROLOGUE FOR ZFunctions1}

=SML
open_theory"z_functions";
force_delete_theory"z_functions1" handle Fail _ => ();
force_delete_theory"z_numbers1" handle Fail _ => ();
force_delete_theory"z_sequences1" handle Fail _ => ();
new_theory"z_functions1";
push_pc "z_fun_ext";
val _ = set_flag ("z_type_check_only", false);
val _ = set_flag ("z_use_axioms", true);
=TEX
\subsection{START OF STRUCTURE ZFunctions1}
=DOC
signature ⦏ZFunctions1⦎ = sig
=DESCRIBE
This provides additional proof support for the Z library functions.
It creates the theory $z\_functions1$.
=ENDDOC
=THDOC
req_name ⦏"z_functions1"⦎ (Value "z_functions");
req_language "Z";
set_flag("tc_thms_only",true);
=DESCRIBE
The theory $z\_functions1$ contains various theorems about functions.
It is created in structure $ZFunctions1$.
=ENDDOC

=THDOC
req_thm(⦏"z_◁_→_thm"⦎,([], ⓩ[Y, Z](∀X:𝕌; f:Y → Z⦁ X ⊆ Y
	⇒ 	(X ◁ f) ∈ X → (ran (X ◁ f)))⌝));
req_thm(⦏"z_ran_◁_thm"⦎,([], ⓩ[Y, Z](∀X:𝕌; f:Y → Z⦁
	ran(X ◁ f) = ran f \ {y : 𝕌 | ∀x : 𝕌 | (x, y) ∈ f ⦁ ¬x ∈ X})⌝));
req_thm(⦏"z_∈_→_thm"⦎,([], ⓩ(∀X:𝕌; Y:𝕌⦁ ∀ f:X → Y; x:𝕌; y:𝕌 | (x, y) ∈ f ⦁
	x ∈ X ∧ y ∈ Y)⌝));
req_thm(⦏"z_→_ran_eq_↠_thm"⦎,([], ⓩ(∀A:𝕌; B : 𝕌⦁ (∃f : A → B⦁ ran f = B)
	⇔ 	(∃f : A ↠ B⦁ true))⌝));
req_thm(⦏"z_↣_ran_eq_⤖_thm"⦎,([], ⓩ(∀A:𝕌; B : 𝕌⦁ (∃f : A ↣ B⦁ ran f = B)
	⇔ 	(∃f : A ⤖ B⦁ true))⌝));
req_thm(⦏"z_ran_mono_thm"⦎,([], ⓩ∀X:𝕌; Y, Z:𝕌; f:𝕌 | f ∈ X → Y ∧ ran f ⊆ Z ⦁
	f ∈ X → Z⌝));
req_thm(⦏"z_⇸_thm2"⦎,([], ⓩ∀A:𝕌; B:𝕌; f:𝕌⦁ f ∈  A ⇸ B
	⇔ 	f ∈ dom f → B ∧ dom f ⊆ A⌝));
req_thm(⦏"z_↠_thm1"⦎,([], ⓩ∀A:𝕌; B:𝕌; f:𝕌⦁ f ∈ A ↠ B
	⇔ f ∈ A → B ∧ B ⊆ ran f⌝));
req_thm(⦏"z_⤔_thm1"⦎,([], ⓩ [X, Y]
	(X ⤔ Y =
	{f : X ⇸ Y | ∀ x1, x2 : 𝕌; y:𝕌⦁ (x1, y) ∈ f ∧ (x2, y) ∈ f⇒ x1 = x2})⌝));
req_thm(⦏"z_→_dom_thm"⦎,([], ⓩ∀A:𝕌; B:𝕌; f:𝕌⦁
		f ∈ A → B
	⇒	f ∈ dom f → B⌝));
req_thm(⦏"z_↣_thm1"⦎,([], ⓩ∀A:𝕌; B:𝕌; f:𝕌⦁
		f ∈ A ↣ B
	⇔	f ∈ A → B ∧ (∀x, y:𝕌; z:𝕌⦁ (x, z) ∈ f ∧ (y, z) ∈ f ⇒ x = y)⌝));
req_thm(⦏"z_∪_↔_thm"⦎,([], ⓩ∀A:𝕌; B:𝕌; C:𝕌; D:𝕌; f:𝕌; g:𝕌⦁
			f ∈ A ↔ B ∧ g ∈ C ↔ D
		⇒	f ∪ g ∈ (A ∪ C) ↔ (B ∪ D)⌝));
req_thm(⦏"z_ran_∪_thm"⦎,([], ⓩ∀f:𝕌; g:𝕌⦁ran (f ∪ g) = ran f ∪ ran g⌝));
req_thm(⦏"z_∪_→_thm"⦎,([], ⓩ∀A:𝕌; B:𝕌; C:𝕌; D:𝕌; f:𝕌; g:𝕌⦁
		f ∈ A → B ∧ g ∈ C → D ∧ A ∩ C = {}
	⇒	f ∪ g ∈ (A ∪ C) → (B ∪ D)⌝));
req_thm(⦏"z_∪_↣_thm"⦎,([], ⓩ∀A:𝕌; B:𝕌; C:𝕌; D:𝕌; f:𝕌; g:𝕌⦁
		f ∈ A ↣ B ∧ g ∈ C ↣ D ∧ A ∩ C = {} ∧ B ∩ D = {}
	⇒	f ∪ g ∈ (A ∪ C) ↣ (B ∪ D)⌝));
req_thm(⦏"z_∪_↠_thm"⦎,([], ⓩ∀A:𝕌; B:𝕌; C:𝕌; D:𝕌; f:𝕌; g:𝕌⦁
		f ∈ A ↠ B ∧ g ∈ C ↠ D ∧ A ∩ C = {}
	⇒	f ∪ g ∈ (A ∪ C) ↠ (B ∪ D)⌝));
req_thm(⦏"z_∪_⤖_thm"⦎,([], ⓩ∀A:𝕌; B:𝕌; C:𝕌; D:𝕌; f:𝕌; g:𝕌⦁
		f ∈ A ⤖ B ∧ g ∈ C ⤖ D ∧ A ∩ C = {} ∧ B ∩ D = {}
	⇒	f ∪ g ∈ (A ∪ C) ⤖ (B ∪ D)⌝));
=ENDDOC

=THDOC
req_thm(⦏"z_∘_→_thm"⦎,([], ⓩ∀A:𝕌; B:𝕌; C:𝕌; f:𝕌; g:𝕌⦁
		f ∈ A → B ∧ g ∈ B → C
	⇒	g ∘ f ∈ A → C⌝));
req_thm(⦏"z_∘_↠_thm"⦎,([], ⓩ∀A:𝕌; B:𝕌; C:𝕌; f:𝕌; g:𝕌⦁
		f ∈ A ↠ B ∧ g ∈ B ↠ C
	⇒	g ∘ f ∈ A ↠ C⌝));
req_thm(⦏"z_∘_↣_thm"⦎,([], ⓩ∀A:𝕌; B:𝕌; C:𝕌; f:𝕌; g:𝕌⦁
		f ∈ A ↣ B ∧ g ∈ B ↣ C
	⇒	g ∘ f ∈ A ↣ C⌝));
req_thm(⦏"z_∘_⤖_thm"⦎,([], ⓩ∀A:𝕌; B:𝕌; C:𝕌; f:𝕌; g:𝕌⦁
		f ∈ A ⤖ B ∧ g ∈ B ⤖ C
	⇒	g ∘ f ∈ A ⤖ C⌝));
req_thm(⦏"z_rel_inv_⤖_thm"⦎,([], ⓩ∀A:𝕌; B:𝕌; f:𝕌⦁
		f ∈ A ⤖ B  ⇒ f ↗~↕ ∈ B ⤖ A⌝));
req_thm(⦏"z_id_thm1"⦎,([], ⓩ∀X:𝕌; x, y:𝕌⦁ (x, y) ∈ id X ⇔ x ∈ X ∧ x = y⌝));
req_thm(⦏"z_id_⤖_thm"⦎,([], ⓩ∀X:𝕌⦁ id X ∈ X ⤖ X⌝));
req_thm(⦏"z_simple_swap_⤖_thm"⦎,([], ⓩ∀x, y:𝕌⦁ {(x, y), (y, x)} ∈ {x, y} ⤖ {x, y}⌝));
req_thm(⦏"z_swap_⤖_thm"⦎,([], ⓩ∀X:𝕌⦁ ∀x, y:X⦁ ∃g : X ⤖ X⦁ (x, y) ∈ g ∧ (y, x) ∈ g⌝));
req_thm(⦏"z_⤖_trans_thm"⦎,([], ⓩ∀X:𝕌⦁ ∀x, y:X⦁ ∃g : X ⤖ X⦁ (x, y) ∈ g⌝));
req_thm(⦏"z_dom_f_↔_f_thm"⦎,([], ⓩ∀A:𝕌; B:𝕌; f:𝕌⦁
		f ∈ A ↔ B
	⇒	{x : A; y : B | (x, y) ∈ f⦁ (x, (x, y)) } ∈ dom f ↔ f⌝));
req_thm(⦏"z_dom_f_→_f_thm"⦎,([], ⓩ∀A:𝕌; B:𝕌; f:𝕌⦁
		f ∈ A → B
	⇒	{x : A; y : B | (x, y) ∈ f⦁ (x, (x, y)) } ∈ dom f → f⌝));
req_thm(⦏"z_dom_f_↠_f_thm"⦎,([], ⓩ∀A:𝕌; B:𝕌; f:𝕌⦁
		f ∈ A → B
	⇒	{x : A; y : B | (x, y) ∈ f⦁ (x, (x, y)) } ∈ dom f ↠ f⌝));
req_thm(⦏"z_dom_f_↣_f_thm"⦎,([], ⓩ∀A:𝕌; B:𝕌; f:𝕌⦁
		f ∈ A → B
	⇒	{x : A; y : B | (x, y) ∈ f⦁ (x, (x, y)) } ∈ dom f ↣ f⌝));
=ENDDOC

=THDOC
req_thm(⦏"z_dom_f_⤖_f_thm"⦎,([], ⓩ∀A:𝕌; B:𝕌; f:𝕌⦁
		f ∈ A → B
	⇒	{x : A; y : B | (x, y) ∈ f⦁ (x, (x, y)) } ∈ dom f ⤖ f⌝));
req_thm(⦏"z_∩_↔_thm"⦎,([], ⓩ∀X:𝕌; Y:𝕌; f, g:𝕌 | f ∈ X ↔ Y ⦁
		(f ∩ g) ∈ dom (f ∩ g) ↔ ran(f ∩ g)⌝));
req_thm(⦏"z_↔_ran_thm"⦎,([], ⓩ∀X:𝕌; f:𝕌 ⦁ f ∈ X ↔ ran f ⇔ f ∈ X ↔ 𝕌⌝));
req_thm(⦏"z_→_ran_thm"⦎,([], ⓩ∀X:𝕌; f:𝕌 ⦁ f ∈ X → ran f ⇔ f ∈ X → 𝕌⌝));
req_thm(⦏"z_∩_→_thm"⦎,([], ⓩ∀X:𝕌; Y:𝕌; f, g:𝕌 | f ∈ X → Y ⦁
		(f ∩ g) ∈ dom (f ∩ g) → ran(f ∩ g)⌝));
req_thm(⦏"z_∩_↣_thm"⦎,([], ⓩ∀X:𝕌; Y:𝕌; f, g:𝕌 | f ∈ X ↣ Y ⦁
		(f ∩ g) ∈ dom (f ∩ g) ↣ ran(f ∩ g)⌝));
req_thm(⦏"z_↠_ran_thm"⦎,([], ⓩ∀X:𝕌; Y:𝕌; f:𝕌 | f ∈ X → Y ⦁
		f ∈ dom f ↠ ran f⌝));
req_thm(⦏"z_∩_↠_thm"⦎,([], ⓩ∀X:𝕌; Y:𝕌; f, g:𝕌 | f ∈ X ↠ Y ⦁
		(f ∩ g) ∈ dom (f ∩ g) ↠ ran(f ∩ g)⌝));
req_thm(⦏"z_∩_⤖_thm"⦎,([], ⓩ∀X:𝕌; Y:𝕌; f, g:𝕌 | f ∈ X ⤖ Y ⦁
		(f ∩ g) ∈ dom (f ∩ g) ⤖ ran(f ∩ g)⌝));

req_thm(⦏"z_→_diff_singleton_thm"⦎,([], ⓩ∀X:𝕌; Y:𝕌⦁ ∀ f:X → Y; x:𝕌; y:𝕌⦁
	(x, y) ∈ f ⇒
	(f \ {(x, y)}) ∈ (X \ {x}) → Y ⌝));
req_thm(⦏"z_⤖_diff_singleton_thm"⦎,([], ⓩ∀X:𝕌; Y:𝕌⦁ ∀ f:X ⤖ Y; x:X; y:Y⦁
	(x, y) ∈ f ⇒
	(f \ {(x, y)}) ∈ (X \ {x}) ⤖ (Y \ {y})⌝));
req_thm(⦏"z_singleton_app_thm"⦎,([], ⓩ∀x : 𝕌; y: 𝕌⦁ {(x, y)} x = y⌝));
req_thm(⦏"z_empty_↠_thm"⦎,([], ⓩ∀X: 𝕌⦁ (∃f: {} ↠ X⦁ true) ⇔ X = {}⌝));
req_thm(⦏"z_→_empty_thm"⦎,([], ⓩ∀X: 𝕌⦁ (∃f: X → {}⦁ true) ⇔ X = {}⌝));
=DESCRIBE

=ENDDOC

=THDOC
req_thm(⦏"z_⊕_↦_app_thm"⦎,
	([], ⓩ(∀f : 𝕌; x : 𝕌; y : 𝕌 ⦁ (f ⊕ {x ↦ y}) x = y)⌝));
req_thm(⦏"z_⊕_↦_app_thm1"⦎,
	([], ⓩ[X, Y](∀f : X → Y; x2 : X; x1 : 𝕌; y : 𝕌 |
	¬ x2 = x1 ⦁
	(f ⊕ {x1 ↦ y}) x2 = f x2)⌝));
req_thm(⦏"z_dom_⊕_↦_thm"⦎,
	([], ⓩ∀f : 𝕌; x : 𝕌; y : 𝕌 ⦁
	dom(f ⊕ {x ↦ y}) = dom f ∪ {x}⌝));
req_thm(⦏"z_⊕_↦_∈_→_thm"⦎,
	([], ⓩ[X, Y](∀f : X → Y; x : X; y : Y ⦁
	f ⊕ {x ↦ y} ∈ X → Y)⌝));
=DESCRIBE

=ENDDOC

\subsubsection{Theorems of the Theory}

=DOC
val ⦏z_◁_→_thm⦎ : THM;				val ⦏z_ran_◁_thm⦎ : THM;
val ⦏z_∈_→_thm⦎ : THM;				val ⦏z_→_ran_eq_↠_thm⦎ : THM;
val ⦏z_↣_ran_eq_⤖_thm⦎ : THM;			val ⦏z_ran_mono_thm⦎ : THM;
val ⦏z_⇸_thm2⦎ : THM;				val ⦏z_↠_thm1⦎ : THM;
val ⦏z_⤔_thm1⦎ : THM;				val ⦏z_→_dom_thm⦎ : THM;
val ⦏z_↣_thm1⦎ : THM;				val ⦏z_∪_↔_thm⦎ : THM;
val ⦏z_ran_∪_thm⦎ : THM;				val ⦏z_∪_→_thm⦎ : THM;
val ⦏z_∪_↣_thm⦎ : THM;				val ⦏z_∪_↠_thm⦎ : THM;
val ⦏z_∪_⤖_thm⦎ : THM;				val ⦏z_∘_→_thm⦎ : THM;
val ⦏z_∘_↠_thm⦎ : THM;				val ⦏z_∘_↣_thm⦎ : THM;
val ⦏z_∘_⤖_thm⦎ : THM;				val ⦏z_rel_inv_⤖_thm⦎ : THM;
val ⦏z_id_thm1⦎ : THM;				val ⦏z_id_⤖_thm⦎ : THM;
val ⦏z_simple_swap_⤖_thm⦎ : THM;		val ⦏z_swap_⤖_thm⦎ : THM;
val ⦏z_⤖_trans_thm⦎ : THM;			val ⦏z_dom_f_↔_f_thm⦎ : THM;
val ⦏z_dom_f_→_f_thm⦎ : THM;			val ⦏z_dom_f_↠_f_thm⦎ : THM;
val ⦏z_dom_f_↣_f_thm⦎ : THM;			val ⦏z_dom_f_⤖_f_thm⦎ : THM;
val ⦏z_∩_↔_thm⦎ : THM;				val ⦏z_↔_ran_thm⦎ : THM;
val ⦏z_→_ran_thm⦎ : THM;				val ⦏z_∩_→_thm⦎ : THM;
val ⦏z_∩_↣_thm⦎ : THM;				val ⦏z_↠_ran_thm⦎ : THM;
val ⦏z_∩_↠_thm⦎ : THM;				val ⦏z_∩_⤖_thm⦎ : THM;
val ⦏z_→_diff_singleton_thm⦎ : THM;		val ⦏z_⤖_diff_singleton_thm⦎ : THM;
val ⦏z_singleton_app_thm⦎ : THM;			val ⦏z_empty_↠_thm⦎ : THM;
val ⦏z_→_empty_thm⦎ : THM;			val ⦏z_⊕_↦_app_thm⦎ : THM;
val ⦏z_⊕_↦_app_thm1⦎ : THM;			val ⦏z_dom_⊕_↦_thm⦎ : THM;
val ⦏z_⊕_↦_∈_→_thm⦎ : THM;
=DESCRIBE
These are the ML bindings of the theorems in the theory $z\_functions1$.
=ENDDOC

\subsection{EPILOGUE OF ZFunctions1}
=SML
end; (* of signature ZFunctions1 *)
=SML
reset_flag ("z_type_check_only");
reset_flag ("z_use_axioms");
=TEX
=THSML
summarize_td_results ();
val z_functions1_success = theory_check_success ();
initialise_td_results();
=TEX
\section{ZNumbers1}
\subsection{PROLOGUE FOR ZNumbers1}
=SML
open_theory"z_functions1";
delete_theory"z_numbers1" handle Fail _ => ();
new_theory"z_numbers1";
new_parent"z_numbers";
new_parent"z_arithmetic_tools";
push_pc "z_fun_ext";
val _ = set_flag ("z_type_check_only", false);
val _ = set_flag ("z_use_axioms", true);
=TEX
\subsection{START OF STRUCTURE ZNumbers1}
=DOC
signature ⦏ZNumbers1⦎ = sig
=DESCRIBE
This provides additional proof support for the Z library functions.
It creates the theory $z\_functions1$.
=ENDDOC
=THDOC
req_name ⦏"z_numbers1"⦎ (Value "z_numbers");
req_parent "z_arithmetic_tools";
req_language "Z";
set_flag("tc_thms_only",true);
=DESCRIBE
The theory $z\_numbers1$ contains various theorems about numbers.
It is created in structure $ZNumbers1$.
=ENDDOC

=THDOC
req_thm(⦏"z_dot_dot_clauses"⦎,([], ⓩ∀i, i1, i2, j1, j2:𝕌⦁
	(i ∈ i1 .. i2 ⇔ i1 ≤ i ≤ i2)
∧	(i1 .. i2 = {} ⇔ i2 < i1)
∧	(i1 .. i2 ⊆ j1 .. j2 ⇔ i2 < i1 ∨ (j1 ≤ i1 ∧ i2 ≤ j2))⌝));
req_thm(⦏"z_dot_dot_plus_thm"⦎,([], ⓩ∀n, i1, i2 : 𝕌⦁
	{i : i1 .. i2 ⦁ i + n} = i1 + n .. i2 + n⌝));
req_thm(⦏"z_less_cases_thm"⦎,([], ⓩ∀i, j:𝕌⦁ i < j ∨ i = j ∨ j < i⌝));
req_thm(⦏"z_≤_≤_plus1_thm"⦎,([], ⓩ∀i, j:𝕌⦁ i ≤ j ≤ i + 1 ⇔ j = i ∨ j = i + 1⌝));
req_thm(⦏"z_dot_dot_diff_thm"⦎,([], ⓩ∀i:ℕ⦁ (1 .. i + 1) \ {i + 1} = 1 .. i⌝));
req_thm(⦏"z_dot_dot_∪_thm"⦎,([], ⓩ∀i:ℕ⦁ (1 .. i) ∪ {i + 1} = 1 .. i + 1⌝));
req_thm(⦏"z_dot_dot_∩_thm"⦎,([], ⓩ∀i:ℕ⦁ (1 .. i) ∩ {i + 1} = {}⌝));
req_thm(⦏"z_empty_𝔽_thm"⦎,([], ⓩ[X]({} ∈ 𝔽 X)⌝));
req_thm(⦏"z_𝔽_∪_singleton_thm"⦎,([], ⓩ[X](∀x : X; a : 𝔽 X⦁ (a ∪ {x}) ∈ 𝔽 X)⌝));
req_thm(⦏"z_𝔽_thm1"⦎,([], ⓩ[X](𝔽 X = ⋂{u : ℙ ℙ X| {} ∈ u
	∧ (∀ x:X; a:u⦁ (a ∪ {x}) ∈ u)})⌝));
req_thm(⦏"z_𝔽_induction_thm"⦎,([], ⌜∀ X p ⦁
		p ⓩ{}⌝
	∧	(∀ x a⦁ p ⓩa⌝ ∧ ⓩa ∈ 𝔽 X⌝ ∧ ⓩx ∈ X⌝ ∧ ⓩ¬x ∈ a⌝ ⇒ p ⓩa ∪ {x}⌝)
      ⇒ (∀ a⦁ ⓩa ∈ 𝔽 X⌝ ⇒ p a)⌝));
req_thm(⦏"z_𝔽_ℙ_thm"⦎,([], ⓩ[X](𝔽 X = ℙ X ∩ (𝔽_))⌝));
req_thm(⦏"z_𝔽_size_thm"⦎,([], ⓩ∀A:𝕌; f:𝕌; n:ℕ| f ∈ 1 .. n ⤖ A⦁ A ∈ (𝔽 _) ∧ # A = n⌝));
req_thm(⦏"z_𝔽_size_thm1"⦎,([], ⓩ∀a: (𝔽_) ⦁ ∃f:1 .. #a ⤖ a ⦁true⌝));
req_thm(⦏"z_⊆_𝔽_thm"⦎,([], ⓩ∀a:(𝔽_); b: 𝕌 | b ⊆ a ⦁ b ∈ (𝔽_)⌝));
req_thm(⦏"z_size_empty_thm"⦎,([], ⓩ({} ⦂ ℙ X) ∈ (𝔽_) ∧ # ({} ⦂ ℙ X) = 0⌝));
req_thm(⦏"z_size_singleton_thm"⦎,([], ⓩ∀x : 𝕌⦁ {x} ∈ (𝔽_) ∧ # {x} = 1⌝));
req_thm(⦏"z_size_dot_dot_thm"⦎,([], ⓩ∀n:ℕ⦁ 1 .. n ∈ (𝔽 _) ∧ # (1 .. n) = n⌝));
req_thm(⦏"z_size_⇻_thm"⦎,([], ⓩ∀X:𝕌; Y:𝕌; f:𝕌 | f ∈ X ⇻ Y ⦁ f ∈ (𝔽_)
	∧ #f = #(dom f)⌝));
req_thm(⦏"z_size_seq_thm"⦎,([], ⓩ∀X:𝕌; f:𝕌; n : ℕ | f ∈ 1 .. n → X ⦁ #f = n⌝));
req_thm(⦏"z_size_∪_singleton_thm"⦎,([], ⓩ∀a : (𝔽_); x: 𝕌 | ¬x ∈ a ⦁
	# (a ∪ {x}) = #a + 1⌝));
req_thm(⦏"z_𝔽_∩_thm"⦎,([], ⓩ∀a, b : 𝕌 | a ∈ (𝔽_) ∨ b ∈ (𝔽_) ⦁ (a ∩ b) ∈ (𝔽_)⌝));
req_thm(⦏"z_𝔽_diff_thm"⦎,([], ⓩ∀a, b : 𝕌 | a ∈ (𝔽_) ⦁ (a \ b) ∈ (𝔽_)⌝));
req_thm(⦏"z_size_∪_thm"⦎,([], ⓩ∀a, b : (𝔽_)⦁ (a ∪ b) ∈ (𝔽_)
	∧ # (a ∪ b) + #(a ∩ b) = #a + #b⌝));
req_thm(⦏"z_⋃_𝔽_thm"⦎,([], ⓩ∀u : 𝔽(𝔽_)⦁ ⋃u ∈ (𝔽_)⌝));
req_thm(⦏"z_size_diff_thm"⦎,([], ⓩ∀ a : (𝔽 _); b: 𝕌 ⦁ a \ b ∈ (𝔽 _)
	∧  # (a \ b) + # (a ∩ b) = # a⌝));
=ENDDOC

=THDOC
req_thm(⦏"z_size_ℕ_thm"⦎,([], ⓩ∀a : (𝔽_) ⦁ # a ∈ ℕ⌝));
req_thm(⦏"z_size_mono_thm"⦎,([], ⓩ∀a : (𝔽_); b: 𝕌 | b ⊆ a ⦁ #b ≤ #a⌝));
req_thm(⦏"z_size_∪_≤_thm"⦎,([], ⓩ∀a, b : (𝔽_)  ⦁ #(a ∪ b) ≤ #a + #b⌝));
req_thm(⦏"z_size_eq_thm"⦎,([], ⓩ∀a, b:(𝔽_) | a ⊆ b ∧ #a = #b ⦁ a = b⌝));
req_thm(⦏"z_size_0_thm"⦎,([], ⓩ∀a : (𝔽_) ⦁ # a = 0 ⇔ a = {}⌝));
req_thm(⦏"z_size_1_thm"⦎,([], ⓩ∀a : (𝔽_) ⦁ # a = 1 ⇔ (∃x:𝕌⦁ a = {x})⌝));
req_thm(⦏"z_size_2_thm"⦎,([], ⓩ∀a:(𝔽_) ⦁ #a = 2 ⇔ (∃x, y:𝕌⦁¬x = y ∧ a = {x, y})⌝));
req_thm(⦏"z_size_pair_thm"⦎,([], ⓩ∀x, y:𝕌 | ¬x = y ⦁ {x, y} ∈ (𝔽_) ∧ #{x, y} = 2⌝));
req_thm(⦏"z_size_×_thm"⦎,([], ⓩ∀a : (𝔽_); b:(𝔽_) ⦁ a × b ∈ (𝔽_) ∧ #(a × b) = #a * #b⌝));
=ENDDOC

=THDOC
req_thm(⦏"z_size_≤_1_thm"⦎,([], ⓩ∀a : (𝔽_) | # a ≤ 1 ⦁ a = {} ∨ (∃x:𝕌⦁a = {x})⌝));
req_thm(⦏"z_size_dot_dot_thm1"⦎,([], ⓩ∀i,j : ℤ ⦁ i .. j ∈ (𝔽_) ∧
		(i ≤ j ⇒ # (i .. j) = (j + ~ i) + 1) ∧
		(j < i ⇒ # (i .. j) = 0)⌝));
req_thm(⦏"z_pigeon_hole_thm"⦎,([], ⓩ∀u : 𝔽 (𝔽_) | # (⋃u) > # u ⦁ ∃a:u⦁ #a > 1⌝));
req_thm(⦏"z_div_thm"⦎,([], ⓩ∀ i,j,k : ℤ | ¬j = 0 ⦁ (i div j = k) ⇔
		(∃ m : ℤ ⦁ i = k * j + m ∧ 0 ≤ m ∧ m < abs j)⌝));
req_thm(⦏"z_mod_thm"⦎,([], ⓩ∀ i,j,k : ℤ | ¬j = 0 ⦁ (i mod j = k) ⇔
		(∃ d : ℤ ⦁ i = d * j + k ∧ 0 ≤ k ∧ k < abs j)⌝));
req_thm(⦏"z_abs_pos_thm"⦎,([], ⓩ∀ i:ℤ| 0 < i ⦁ abs i = i ∧ abs ~ i = i⌝));
req_thm(⦏"z_abs_neg_thm"⦎,([], ⓩ∀ i:ℤ| i < 0 ⦁ abs i = ~i ∧ abs ~ i = ~i⌝));
req_thm(⦏"z_abs_≤_times_thm"⦎,([], ⓩ∀ i,j:ℤ| ¬ i = 0 ∧ ¬ j = 0 ⦁ abs j ≤ abs (i * j)⌝));
req_thm(⦏"z_abs_0_less_thm"⦎,([], ⓩ∀ i:ℤ| ¬ i = 0 ⦁ 0 < abs i⌝));
req_thm(⦏"z_0_less_times_thm"⦎,([], ⓩ∀ i,j : ℤ ⦁
	0 < i * j ⇔ (0 < i ∧ 0 < j) ∨ (i < 0 ∧ j < 0)⌝));
req_thm(⦏"z_times_less_0_thm"⦎,([], ⓩ∀ i,j : ℤ  ⦁
	i * j < 0 ⇔ (0 < i ∧ j < 0) ∨ (i < 0 ∧ 0 < j)⌝));
=DESCRIBE

=ENDDOC

=THDOC
req_thm(⦏"z_∈_succ_thm"⦎,([], ⌜∀ i j ⦁
	ⓩ(i, j) ∈ succ ⇔ (0 ≤ i) ∧ (j = i + 1)⌝⌝));
req_thm(⦏"z_succ↗0↕_thm"⦎,([], ⓩsucc ↗ 0 ↕  = id ℤ⌝));
req_thm(⦏"z_succ↗n↕_thm"⦎,
	([], ⓩ∀ n : ℤ | 1 ≤ n ⦁ succ ↗ n ↕  = {m : ℕ ⦁ (m ↦ m + n)}⌝));
req_thm(⦏"z_succ↗minus_n↕_thm"⦎,([], ⓩ∀ n : ℕ | 1 ≤ n ⦁ succ ↗ ~ n ↕  = {m : ℕ  ⦁ (m + n ↦ m)}⌝));
=DESCRIBE
Some additional material on $succ$.
=ENDDOC
=DOC
val ⦏z_𝔽_induction_tac⦎ : TERM -> TACTIC;
=DESCRIBE
An induction tactic for Z finite sets.  To prove
=INLINEFT
s ∈ 𝔽 A ⇒ t
=TEX
, it suffices to prove
=INLINEFT
t[{}/s]
=TEX
\ and to prove
=INLINEFT
t[s ∪ {x}/s]
=TEX
\ on the
assumptions $t$,
=INLINEFT
s ∈ 𝔽 A
=TEX
,
=INLINEFT
x ∈ A
=TEX
\ and
=INLINEFT
¬x ∈ s
=TEX
.  The term argument must be a variable
of the same type as a Z set and must appear free in the conclusion of the goal.
It must also appear once, and only once, in an
assumption of the form
=INLINEFT
s ∈ 𝔽 A
=TEX
.
=FRULE 2 Tactic
z_𝔽_induction_tac ⓩs⌝
├
{ Γ, s ∈ 𝔽 A} t[s]
├
{ Γ } t[{}/s] ;
strip {t, s ∈ 𝔽 A, x ∈ A, ¬x ∈ s, Γ} t[s ∪ {x}/s]
=TEX
=FAILURE
107033	A term of the form ⓩs ∈ 𝔽 A⌝ where s is the induction variable
	could not be found in the assumptions
=ENDDOC

=DOC
val ⦏z_size_dot_dot_conv⦎ : CONV;
=DESCRIBE
This conversion will calculate the size of a range between two integer
literals, including the empty range case when the end of the range is less than the start.
=EXAMPLE
z_size_dot_dot_conv ⓩ# (1 .. 5) ⌝ gives
	⊢ # (1 .. 5) = 5

z_size_dot_dot_conv ⓩ# (10 .. 1) ⌝ gives
	⊢ # (10 .. 1) = 0
=TEX
=FAILURE
107001	?0 is not of the form ⓩ#(a .. b)⌝ where ⓩa⌝ and ⓩb⌝ are integer literals
=ENDDOC
=DOC
val ⦏z_dot_dot_conv⦎ : CONV;
=DESCRIBE
This conversion expands a range between two integer
literals into a set display:
=EXAMPLE
z_dot_dot_conv ⓩ1 .. 5⌝ gives
	⊢ 1 .. 5 = {1, 2, 3, 4, 5}
=TEX
=FAILURE
107002	?0 is not of the form ⓩa .. b⌝ where ⓩa⌝ and ⓩb⌝ are integer literals
=ENDDOC

\subsubsection{Theorems of the Theory}

=DOC
val ⦏z_dot_dot_clauses⦎ : THM;			val ⦏z_dot_dot_plus_thm⦎ : THM;
val ⦏z_less_cases_thm⦎ : THM;			val ⦏z_≤_≤_plus1_thm⦎ : THM;
val ⦏z_dot_dot_diff_thm⦎ : THM;			val ⦏z_dot_dot_∪_thm⦎ : THM;
val ⦏z_dot_dot_∩_thm⦎ : THM;			val ⦏z_empty_𝔽_thm⦎ : THM;
val ⦏z_𝔽_∪_singleton_thm⦎ : THM;			val ⦏z_𝔽_thm1⦎ : THM;
val ⦏z_𝔽_induction_thm⦎ : THM;			val ⦏z_𝔽_size_thm⦎ : THM;
val ⦏z_𝔽_size_thm1⦎ : THM;				val ⦏z_⊆_𝔽_thm⦎ : THM;
val ⦏z_size_empty_thm⦎ : THM;			val ⦏z_size_singleton_thm⦎ : THM;
val ⦏z_size_dot_dot_thm⦎ : THM;			val ⦏z_size_⇻_thm⦎ : THM;
val ⦏z_size_seq_thm⦎ : THM;				val ⦏z_size_∪_singleton_thm⦎ : THM;
val ⦏z_𝔽_∩_thm⦎ : THM;				val ⦏z_𝔽_diff_thm⦎ : THM;
val ⦏z_size_∪_thm⦎ : THM;				val ⦏z_⋃_𝔽_thm⦎ : THM;
val ⦏z_size_diff_thm⦎ : THM;			val ⦏z_size_ℕ_thm⦎ : THM;
val ⦏z_size_mono_thm⦎ : THM;			val ⦏z_size_∪_≤_thm⦎ : THM;
val ⦏z_size_eq_thm⦎ : THM;				val ⦏z_size_0_thm⦎ : THM;
val ⦏z_size_1_thm⦎ : THM;				val ⦏z_size_2_thm⦎ : THM;
val ⦏z_size_pair_thm⦎ : THM;			val ⦏z_size_×_thm⦎ : THM;
val ⦏z_size_≤_1_thm⦎ : THM;			val ⦏z_size_dot_dot_thm1⦎ : THM;
val ⦏z_pigeon_hole_thm⦎ : THM;			val ⦏z_𝔽_ℙ_thm⦎ : THM;
val ⦏z_div_thm⦎ : THM;				val ⦏z_mod_thm⦎ : THM;
val ⦏z_abs_pos_thm⦎ : THM;				val ⦏z_abs_neg_thm⦎ : THM;
val ⦏z_abs_≤_times_thm⦎ : THM;			val ⦏z_abs_0_less_thm⦎ : THM;
val ⦏z_0_less_times_thm⦎ : THM;			val ⦏z_times_less_0_thm⦎ : THM;
val ⦏z_∈_succ_thm⦎ :THM;				val ⦏z_succ↗0↕_thm⦎ :THM;
val ⦏z_succ↗n↕_thm⦎ :THM;				val ⦏z_succ↗minus_n↕_thm⦎ :THM;
=DESCRIBE
These are the ML bindings of the theorems in the theory $z\_numbers1$.
=ENDDOC

\subsection{EPILOGUE OF ZNumbers1}
=SML
end; (* of signature ZNumbers1 *)
=SML
reset_flag ("z_type_check_only");
reset_flag ("z_use_axioms");
=TEX
=THSML
summarize_td_results ();
val z_numbers1_success = theory_check_success ();
initialise_td_results();
=TEX
\section{ZSequences1}
\subsection{PROLOGUE FOR ZSequences1}
=SML
open_theory"z_numbers1";
delete_theory"z_sequences1" handle Fail _ => ();
new_theory"z_sequences1";
new_parent "z_sequences";
push_pc "z_fun_ext";
val _ = set_flag ("z_type_check_only", false);
val _ = set_flag ("z_use_axioms", true);
=TEX
\subsection{START OF STRUCTURE ZSequences1}
=DOC
signature ⦏ZSequences1⦎ = sig
=DESCRIBE
This provides additional proof support for the Z library sequences.
It creates the theory $z\_sequences1$.
=ENDDOC
=THDOC
req_name ⦏"z_sequences1"⦎ (Value "z_sequences");
req_language "Z";
set_flag("tc_thms_only",true);
=DESCRIBE
The theory $z\_sequences1$ contains various theorems about functions.
It is created in structure $ZSequences1$.
=ENDDOC

=THDOC
req_thm(⦏"z_seq_thm"⦎,([], ⓩ∀X:𝕌⦁ seq X = ⋃{n : ℕ⦁ 1 .. n → X}⌝));
req_thm(⦏"z_prim_seq_induction_thm"⦎,([], ⌜∀ X p ⦁
		p ⓩ{}⌝
	∧	(∀ x n s⦁
			ⓩx ∈ X⌝ ∧ ⓩn ∈ ℕ⌝ ∧ ⓩs ∈ 1 .. n → X⌝ ∧ p ⓩs⌝
		⇒	p ⓩs ∪ {(n + 1, x)}⌝)
      ⇒ (∀ s⦁ ⓩs ∈ (seq X)⌝ ⇒ p s)⌝));
req_thm(⦏"z_seq_thm1"⦎,([], ⓩ∀X:𝕌; n:𝕌⦁ seq X = {s:𝕌 | ∃n: ℕ⦁ s ∈ 1 .. n → X}⌝));
req_thm(⦏"z_size_seq_thm1"⦎,([], ⓩ∀X:𝕌; s:𝕌; n:ℕ⦁ s ∈ seq X ∧ #s = n ⇔ s ∈ 1 .. n → X⌝));
req_thm(⦏"z_size_seq_thm2"⦎,([], ⓩ∀n:ℕ; s : (seq _)⦁ #s = n ⇔ dom s = 1 .. n⌝));
req_thm(⦏"z_size_seq_ℕ_thm"⦎,([], ⓩ∀s : (seq _)⦁ #s ∈ ℕ⌝));
req_thm(⦏"z_singleton_seq_thm"⦎,([], ⓩ∀x : 𝕌⦁
	⟨x⟩ ∈ (seq _) ∧ dom ⟨x⟩ = {1} ∧ ran ⟨x⟩ = {x} ∧ ⟨x⟩ 1 = x⌝));
req_thm(⦏"z_seq_u_thm"⦎,([], ⓩ∀X:𝕌⦁ ∀ s:seq X⦁s ∈ (seq _)⌝));
req_thm(⦏"z_⁀_thm"⦎,([], ⓩ∀X, Y:𝕌⦁ ∀ s:seq X; t:seq Y⦁
	s ⁀ t  = s ∪ {n : dom t ⦁ n + # s ↦ t n}⌝));
req_thm(⦏"z_⁀_∈_seq_thm"⦎,([], ⓩ∀X, Y:𝕌⦁ ∀ s:seq X; t:seq Y⦁s ⁀ t ∈ (seq _)⌝));
req_thm(⦏"z_⁀_∈_seq_thm1"⦎,([], ⓩ∀ s : (seq _); t : (seq _) ⦁ s ⁀ t ∈ (seq _)⌝));
req_thm(⦏"z_⁀_def_thm"⦎,([], ⓩ∀i : 𝕌; t : (seq _)⦁
		{n : dom t ⦁ n + i ↦ t n}
	=	{n : 𝕌; x : 𝕌 | (n, x) ∈ t ⦁ (n + i, x)}⌝));
req_thm(⦏"z_⁀_singleton_thm"⦎,([], ⓩ[X](∀s : seq X; x: X⦁ s ⁀ ⟨x⟩ = s ∪ {(#s + 1, x)})⌝));
req_thm(⦏"z_⁀_singleton_thm1"⦎,([], ⓩ∀ s : (seq _); x : 𝕌 ⦁ s ⁀ ⟨x⟩ = s ∪ {(# s + 1, x)}⌝));
req_thm(⦏"z_⟨⟩_thm"⦎,([], ⓩ⟨⟩ = {}⌝));
req_thm(⦏"z_⟨⟩_seq_thm"⦎,([], ⓩ∀X:𝕌⦁ ⟨⟩ ∈ seq X⌝));
req_thm(⦏"z_seq_induction_thm"⦎,([], ⌜∀ X p ⦁
		p ⓩ⟨⟩⌝
	∧	(∀ x s⦁
			ⓩx ∈ X⌝ ∧ ⓩs ∈ seq X⌝ ∧ p ⓩs⌝
		⇒	p ⓩs ⁀ ⟨x⟩⌝)
      ⇒ (∀ s⦁ ⓩs ∈ (seq X)⌝ ⇒ p s)⌝));
req_thm(⦏"z_⁀_⟨⟩_thm"⦎,([], ⓩ∀ X : 𝕌
    ⦁ ∀ s : seq X ⦁
		s ⁀ ⟨⟩ = s⌝));
req_thm(⦏"z_⟨⟩_⁀_thm"⦎,([], ⓩ∀ X : 𝕌
    ⦁ ∀ s : seq X ⦁
		⟨⟩ ⁀ s = s⌝));
req_thm(⦏"z_dom_seq_thm"⦎,([], ⓩ∀ s : (seq _) ⦁ dom s = 1 .. #s⌝));
req_thm(⦏"z_seq_seq_x_thm"⦎,([], ⓩ∀ X : 𝕌; s : (seq _) ⦁ s ∈ seq X ⇔ ran s ⊆ X⌝));
req_thm(⦏"z_singleton_seq_x_thm"⦎,([], ⓩ∀ X : 𝕌 ⦁ ∀ x : 𝕌 ⦁ ⟨x⟩ ∈ seq X ⇔ x ∈ X⌝));
req_thm(⦏"z_⁀_seq_x_thm"⦎,([], ⓩ∀ X : 𝕌; s1, s2 : (seq _) ⦁ s1 ⁀ s2 ∈ seq X ⇔ s1 ∈ seq X ∧ s2 ∈ seq X⌝));
=DESCRIBE

=ENDDOC

=THDOC
req_thm(⦏"z_dom_⁀_thm"⦎,([], ⓩ∀ s : (seq _); t : (seq _) ⦁ dom(s ⁀ t) = 1 .. (#s + #t)⌝));
req_thm(⦏"z_size_⁀_thm"⦎,([], ⓩ∀ s, t : (seq _); x:𝕌 ⦁#(s ⁀ t) = #s + #t⌝));
req_thm(⦏"z_size_singleton_seq_thm"⦎,([], ⓩ∀ x:𝕌 ⦁#⟨x⟩ = 1⌝));
req_thm(⦏"z_seq_cases_thm"⦎,([], ⓩ∀ s : (seq _)⦁
		s = ⟨⟩ ∨ (∃s1 : (seq _); x:𝕌⦁ s = s1 ⁀ ⟨x⟩)⌝));
req_thm(⦏"z_¬_⁀_empty_thm"⦎,([], ⓩ∀ s : (seq _); x:𝕌⦁ ¬s ⁀ ⟨x⟩ = ⟨⟩⌝));
req_thm(⦏"z_⁀_one_one_thm"⦎,([], ⓩ∀ s : (seq _); t : (seq _); x, y:𝕌 ⦁
		s ⁀ ⟨x⟩ = t ⁀ ⟨y⟩ ⇔ s = t ∧ x = y⌝));
req_thm(⦏"z_⁀_assoc_thm"⦎,([], ⓩ∀ s1, s2, s3 : (seq _)⦁ (s1 ⁀ s2) ⁀ s3 = s1 ⁀ (s2 ⁀ s3)⌝));
req_thm(⦏"z_⁀_assoc_thm1"⦎,([], ⓩ∀ s1, s2, s3 : (seq _)⦁ s1 ⁀ (s2 ⁀ s3) = (s1 ⁀ s2) ⁀ s3⌝));
=DESCRIBE

=ENDDOC
=THDOC
req_thm(⦏"z_seq_induction_thm1"⦎,([], ⌜∀ X p ⦁
		p ⓩ⟨⟩⌝
	∧	(∀ x s⦁
			ⓩx ∈ X⌝ ∧ ⓩs ∈ seq X⌝ ∧ p ⓩs⌝
		⇒	p ⓩ⟨x⟩ ⁀ s⌝)
      ⇒ (∀ s⦁ ⓩs ∈ (seq X)⌝ ⇒ p s)⌝));
=ENDDOC

=THDOC
req_thm("z_num_list_thm", ([], ⌜∀ l n⦁
	ⓩ⌜Z'NumList (l, n)⌝⌝ =
	ⓩ{i : 𝕌; x : 𝕌 | (i, x) ∈ ⌜$"Z'⟨⟩" l⌝ ⦁ (i + ⌜Z'Int n⌝, x)}⌝⌝));
req_thm("z_seqd_∈_seq_thm", ([], ⌜∀ l⦁ ⓩ⌜$"Z'⟨⟩" l⌝⌝ ∈ ⓩ(seq _)⌝⌝));
req_thm("z_seqd_⁀_thm", ([], ⌜∀ a l⦁ ⓩ⌜$"Z'⟨⟩" (Cons a l)⌝⌝ = ⓩ⟨a⟩ ⁀ ⌜$"Z'⟨⟩" l⌝⌝⌝));
req_thm("z_seqd_⁀_rw_thm", ([], ⌜∀ a b l⦁
	ⓩ⌜$"Z'⟨⟩" (Cons a (Cons b l))⌝⌝ = ⓩ⟨a⟩ ⁀ (⟨b⟩ ⁀ ⌜$"Z'⟨⟩" l⌝)⌝⌝));
req_thm("z_∈_seq_app_eq_thm", ([], ⓩ∀ s : (seq _); m : 𝕌; x : 𝕌 ⦁ (m, x) ∈ s ⇒ s m = x⌝));
req_thm("z_∈_seqd_app_eq_thm", ([], ⌜∀ l m x⦁ ⓩ(m, x)⌝ ∈ ⓩ⌜$"Z'⟨⟩" l⌝⌝ ⇒ ⓩ⌜$"Z'⟨⟩" l⌝ m⌝ = x⌝));
req_thm("z_size_seqd_thm", ([], ⌜
	ⓩ#⟨⟩ = 0⌝
∧	∀a :'a; l⦁ⓩ#⌜$"Z'⟨⟩" (Cons a l)⌝⌝ = ⓩ1 + #⌜$"Z'⟨⟩" l⌝⌝⌝));
req_thm("z_size_seqd_length_thm", ([], ⌜∀ l⦁ ⓩ# ⌜$"Z'⟨⟩" l⌝⌝ = ⓩ⌜Z'Int (Length l)⌝⌝⌝));
req_thm("z_dom_seqd_thm", ([], ⌜∀ l⦁ ⓩdom ⌜$"Z'⟨⟩" l⌝⌝ = ⓩ1 .. # ⌜$"Z'⟨⟩" l⌝⌝⌝));
req_thm("z_ran_seqd_thm", ([], ⌜∀ l⦁ ⓩran ⌜$"Z'⟨⟩" l⌝⌝ = ⓩ⌜Z'Setd l⌝⌝⌝));
req_thm("z_seqd_⁀_⟨⟩_clauses", ([], ⌜∀ l⦁
		ⓩ⌜$"Z'⟨⟩" l⌝ ⁀ ⟨⟩⌝ = ⓩ⌜$"Z'⟨⟩" l⌝⌝
	∧	ⓩ⟨⟩ ⁀ ⌜$"Z'⟨⟩" l⌝⌝ = ⓩ⌜$"Z'⟨⟩" l⌝⌝⌝));
req_thm("z_seqd_eq_thm", ([], ⌜∀ x y l1 l2⦁
	$"Z'⟨⟩" (Cons x l1) = $"Z'⟨⟩" (Cons y l2) ⇔ x = y ∧ $"Z'⟨⟩" l1 = $"Z'⟨⟩" l2⌝));
=DESCRIBE

=ENDDOC

\subsubsection{Theorems of the Theory}

=DOC
val ⦏z_¬_⁀_empty_thm⦎ : THM;		val ⦏z_dom_⁀_thm⦎ : THM;
val ⦏z_dom_seqd_thm⦎ : THM;		val ⦏z_dom_seq_thm⦎ : THM;
val ⦏z_⁀_assoc_thm1⦎ : THM;		val ⦏z_⁀_assoc_thm⦎ : THM;
val ⦏z_⁀_def_thm⦎ : THM;			val ⦏z_⁀_one_one_thm⦎ : THM;
val ⦏z_⁀_∈_seq_thm1⦎ : THM;		val ⦏z_⁀_∈_seq_thm⦎ : THM;
val ⦏z_⁀_seq_x_thm⦎ : THM;		val ⦏z_⁀_singleton_thm1⦎ : THM;
val ⦏z_⁀_singleton_thm⦎ : THM;		val ⦏z_⟨⟩_⁀_thm⦎ : THM;
val ⦏z_⁀_⟨⟩_thm⦎ : THM;			val ⦏z_⁀_thm⦎ : THM;
val ⦏z_prim_seq_induction_thm⦎ : THM;	val ⦏z_ran_seqd_thm⦎ : THM;
val ⦏z_∈_seq_app_eq_thm⦎ : THM;		val ⦏z_seq_cases_thm⦎ : THM;
val ⦏z_∈_seqd_app_eq_thm⦎ : THM;	val ⦏z_seqd_⁀_⟨⟩_clauses⦎ : THM;
val ⦏z_seqd_⁀_rw_thm⦎ : THM;		val ⦏z_seqd_⁀_thm⦎ : THM;
val ⦏z_seqd_∈_seq_thm⦎ : THM;		val ⦏z_seq_induction_thm1⦎ : THM;
val ⦏z_seq_induction_thm⦎ : THM;		val ⦏z_seq_seq_x_thm⦎ : THM;
val ⦏z_seq_thm1⦎ : THM;			val ⦏z_⟨⟩_seq_thm⦎ : THM;
val ⦏z_seq_thm⦎ : THM;			val ⦏z_seq_u_thm⦎ : THM;
val ⦏z_singleton_seq_thm⦎ : THM;		val ⦏z_singleton_seq_x_thm⦎ : THM;
val ⦏z_size_⁀_thm⦎ : THM;			val ⦏z_size_seqd_length_thm⦎ : THM;
val ⦏z_size_seqd_thm⦎ : THM;		val ⦏z_size_seq_ℕ_thm⦎ : THM;
val ⦏z_size_seq_thm1⦎ : THM;		val ⦏z_size_seq_thm2⦎ : THM;
val ⦏z_size_singleton_seq_thm⦎ : THM;	val ⦏z_⟨⟩_thm⦎ : THM;
val ⦏z_seqd_eq_thm⦎ : THM;
=DESCRIBE
These are the ML bindings of the theorems in the theory $z\_sequences1$.
=ENDDOC

=DOC
val ⦏z_seq_induction_tac⦎ : TERM -> TACTIC;
val ⦏z_seq_induction_tac1⦎ : TERM -> TACTIC;
=DESCRIBE
Induction tactics for Z sequences.  To prove
=INLINEFT
s ∈ seq A ⇒ t
=TEX
, it suffices to prove
=INLINEFT
t[⟨⟩/s]
=TEX
\ and to prove
=INLINEFT
t[s ⁀ ⟨x⟩/s]
=TEX
(or
=INLINEFT
t[⟨x⟩ ⁀ s/s]
=TEX
)
\ on the
assumptions $t$,
=INLINEFT
s ∈ seq A
=TEX
\ and
=INLINEFT
x ∈ A
=TEX
.  The term argument must be a variable
of the same type as a Z sequence and must appear free in the conclusion of the goal.
It must also appear once, and only once, in an
assumption of the form
=INLINEFT
s ∈ seq A
=TEX
.
=FRULE 2 Tactic
z_seq_induction_tac ⓩs⌝
├
{ Γ, s ∈ seq A} t[s]
├
{ Γ } t[⟨⟩/s] ;
strip {t, s ∈ seq A, x ∈ A, Γ} t[s ⁀ ⟨x⟩/s]
=TEX
=FRULE 2 Tactic
z_seq_induction_tac1 ⓩs⌝
├
{ Γ, s ∈ seq A} t[s]
├
{ Γ } t[⟨⟩/s] ;
strip {t, s ∈ seq A, x ∈ A, Γ} t[⟨x⟩ ⁀ s/s]
=TEX
=FAILURE
107031	A term of the form ⓩs ∈ seq A⌝ where s is the induction variable
	could not be found in the assumptions
107032	?0 is not a variable
=ENDDOC
=DOC
	val ⦏z_seqd_app_conv⦎ : CONV;
	val ⦏z_size_seqd_conv⦎ : CONV;
	val ⦏z_seqd_eq_conv⦎ : CONV;
=DESCRIBE
Conversions for sequence displays.

=INLINEFT
z_seqd_app_conv
=TEX
\ applies to terms of the form $s m$, where $s$ is a sequence display and $m$ is
a numeric literal.

=INLINEFT
z_size_seqd_conv
=DESCRIBE
=TEX
\ applies to terms of the form $\# s$, where $s$ is a sequence display.

=INLINEFT
z_seqd_eq_conv
=DESCRIBE
=TEX
\ applies to terms of the form $s_1 = s_2$, where $s_1$ and $s_2$ are sequence displays.

=FAILURE
107011	?0 is not of the form ⌜⟨t1, ...⟩ m⌝
107012	?0 is not a positive integer literal
107013	?0 is not a valid index for the sequence ?1
107020	?0 is not of the form ⌜⟨t1, ...⟩ = ⟨u1, ...⟩⌝
107021	?0 is not of the form ⌜#⟨t1, ...⟩⌝
=ENDDOC


\subsection{EPILOGUE OF ZSequences1}
=SML
end; (* of signature ZSequences1 *)
=SML
reset_flag ("z_type_check_only");
reset_flag ("z_use_axioms");
=THSML
summarize_td_results ();
val z_sequences1_success = theory_check_success ();
=TEX
\section{TEST POLICY}
The module tests for these modules are to follow the guidelines
laid down in the quality plan~\cite{DS/FMU/IED/PLN008}.

\twocolumn[\section{INDEX}]
\small
\printindex

\end{document}



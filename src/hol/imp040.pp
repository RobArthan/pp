=IGN
********************************************************************************
imp040.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
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

\def\Title{Implementation of the Theory of Characters and Strings}

\def\AbstractText{This document contains the implementation of the theory of characters and strings for ICL HOL.}

\def\Reference{DS/FMU/IED/IMP040}

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
%% LaTeX2e port: \documentstyle[hol1,11pt,TQ]{article}
%% LaTeX2e port: \ftlinepenalty=9999
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{FST PROJECT}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Implementation of the Theory of Characters and Strings}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Implementation of the \cr
%% LaTeX2e port: Theory of Characters and Strings}
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP040}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.13 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2002/10/17 16:20:01 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{D.J.~King & WIN01}  %% Mandatory field
%% LaTeX2e port: \TPPauthorisation{R.B.~Jones & FMU Manager}
%% LaTeX2e port: \TPPabstract{This document contains the implementation of the theory of characters and strings for ICL HOL.}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	    Library
%% LaTeX2e port: }}
%% LaTeX2e port: \begin{document}
%% LaTeX2e port: \makeTPPfrontpage
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
\pagebreak
\section{DOCUMENT CONTROL}
\subsection{Contents List}
\tableofcontents
\subsection{Document Cross References}
\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes History}
\begin{description}
\item [Issue 1.1 (1991/10/07) (7 September 1991)] First draft.
\item [Issue 1.2 (1991/10/08) (25 November 1991)] Draft for review.

\item[Issue 1.4 (1992/01/20), \FormatDate{92/01/20} ] Updated to use new fonts.
\item[Issue 1.5 (1992/01/27) (23rd January 1992)]
$new\_axiom$, $simple\_new\_type\_defn$, $new\_type\_defn$
all changed to take lists of keys, rather than single ones.
\item[Issue 1.6 (1992/01/27),1.7 (1992/01/28) (27th January 1992)]
Corrected arithmetic theorem names, and other typos.
\item [Issue 1.8 (1992/04/14) (13th April 1992)]
Changes due to CR0017.
\item [Issue 1.9 (1992/05/14) (14th May 1992)]
Tidying up proof contexts.
\item[Issue 1.11 (1992/06/24) (24th June 1992)]
Renamings from issue 1.6 of \cite{DS/FMU/IED/WRK038},
mostly proof context name changes.
\item[Issue 1.12 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.13 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.14 (2014/04/14)] Now uses $new\_spec$ rather than $new\_spec1$.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
None.
\pagebreak
\section{GENERAL}
\subsection{Scope}
This document contains parts of the ICL HOL
proof development system called for in \cite{DS/FMU/IED/HLD011} and \cite{DS/FMU/IED/DTD040}.
\subsection{Introduction}

\section{PROLOGUE}
In this section we create the new theory and begin the structure which
contains the theory.

=SML
structure ⦏Char⦎ : Char = struct
=TEX
=SML
val _ = open_theory "list";
val _ = new_theory "char";
val _ = push_merge_pcs ["'propositions",
		"'simple_abstractions"];
=TEX
\section{INTRODUCING THE TYPE ``CHAR''}
In this section,we define the type $CHAR$.
First we prove the existence of a function mapping
a concrete representation of characters to bool.

=SML
val ⦏is_char_rep_thm⦎ = (
push_goal ([],⌜∃ IsCharRep: ℕ→BOOL ⦁ ∀x ⦁ IsCharRep x = x < 256⌝);
a(simple_∃_tac⌜λx⦁x < 256⌝);
a(rewrite_tac[]);
pop_thm()
);
=TEX
=SML
val ⦏is_char_rep_def⦎ = new_spec1(["IsCharRep","is_char_rep_def"], ["IsCharRep"], is_char_rep_thm);
=TEX
In order to use $IsCharRep$ to define the new type,
we need to show that the subset of representation
type which it determines is non-empty.
=SML
val ⦏char_∃_thm⦎ = (
push_goal([],⌜∃x ⦁ IsCharRep x⌝);
a(strip_asm_tac is_char_rep_def);
a(simple_∃_tac⌜0⌝ THEN asm_rewrite_tac[less_clauses, plus1_conv⌜256⌝]);
pop_thm()
);
=TEX
Now we can introduce the new type:
=SML
val ⦏char_def⦎ = new_type_defn(["CHAR","char_def"],"CHAR",[],char_∃_thm);
=TEX
\section{BASIC DEFINITIONS}
The names of $AbsChar$ is known by
the HOL kernel. We show that functions exist
with the required properties for the abstract type $CHAR$.

=SML
val ⦏char_abs_rep_thm⦎ = (
push_goal([],⌜∃ AbsChar : ℕ→CHAR; RepChar : CHAR→ℕ ⦁
	(∀a ⦁ AbsChar (RepChar a) = a) ∧
	(∀r ⦁ IsCharRep r ⇔
		RepChar (AbsChar r) = r)⌝);
a(strip_asm_tac (simple_∀_elim ⌜IsCharRep:ℕ→BOOL⌝
	(inst_type_rule[(ⓣℕ⌝,ⓣ'b⌝),(ⓣCHAR⌝,ⓣ'a⌝)]type_lemmas_thm)));
(* *** Goal "1" *** *)
a(contr_tac);
a(strip_asm_tac char_def);
a(POP_ASM_T ante_tac THEN asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(MAP_EVERY simple_∃_tac [⌜abs⌝,⌜rep⌝]);
a(asm_rewrite_tac[]);
pop_thm()
);
=TEX
=SML
val ⦏abs_char_rep_char_def⦎ = new_spec1(["AbsChar","RepChar","abs_char_rep_char_def"],
	["AbsChar","RepChar"], char_abs_rep_thm);
=TEX
\section{THE TYPE ABBREVIATION ``STRING''}
Strings are represented as lists of characters.

=SML
val _ = declare_type_abbrev("STRING",[],ⓣCHAR LIST⌝);
=TEX
\section{EPILOGUE}
This completes the implementation of the theory for characters
and strings.
=SML
val _ = pop_pc();
end (* structure Char *);
=TEX
=SML
open Char;
=TEX
{\twocolumn[\section{INDEX OF DEFINED TERMS}]
{\makeatletter
\printindex}}
\end{document}





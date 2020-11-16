=IGN
********************************************************************************
dtd072.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  ℤ $Date: 2002/10/17 16:20:01 $ $Revision: 1.13 $ $RCSfile: dtd072.doc,v $
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

\def\Title{Detailed Design for the Theory of Functional Relations}

\def\AbstractText{This document gives a detailed design for the theory of relations.}

\def\Reference{DS/FMU/IED/DTD072}

\def\Author{R.B.Jones}


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
%% LaTeX2e port: %  ℤ $Date: 2002/10/17 16:20:01 $ $Revision: 1.13 $ $RCSfile: dtd072.doc,v $
%% LaTeX2e port: \documentstyle[hol1,11pt,TQ]{article}
%% LaTeX2e port: \ftlinepenalty=9999
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{FST Project}
%% LaTeX2e port: \TPPtitle{Detailed Design for the Theory of Functional Relations}
%% LaTeX2e port: \def\TPPheadtitle{Detailed Design for the Theory of\cr
%% LaTeX2e port: Functional Relations}
%% LaTeX2e port: \TPPref{DS/FMU/IED/DTD072}
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.13 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}
%% LaTeX2e port: \def\SCCSdate{\FormatDate{$Date: 2002/10/17 16:20:01 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPdate{\SCCSdate}
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{R.B.Jones & WIN01}
%% LaTeX2e port: %\TPPauthors{R.D. Arthan & WIN01\\K. Blackburn & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D. Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document gives a detailed design for the
%% LaTeX2e port: theory of relations.}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	    Library
%% LaTeX2e port: }}
%% LaTeX2e port: \begin{document}
%% LaTeX2e port: \makeTPPfrontpage
%% LaTeX2e port: \vfill
%% LaTeX2e port: \begin{center}
%% LaTeX2e port: \bf Copyright \copyright\ : Lemma 1 Ltd. 1992
%% LaTeX2e port: \end{center}

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
\item[Issue 1.4 (1992/05/28) (\FormatDate{92/05/28
})]
This is the first draft of the document.
\item[Issue 1.6 (1992/06/16) (\FormatDate{92/06/16
})]
Spec now in this document not the implementation.
\item[Issue 1.7 (1992/06/26)~(\FormatDate{92/06/26
})]
Corrected definition of $At$ and added a theorem about it.


\item[Issue 1.8 (1992/10/07)~(\FormatDate{92/10/07%
})]
	First real issue.


\item[Issue 1.9 (1992/10/23)~(\FormatDate{92/10/23%
})]
Added $at\_at\_eq\_thm$.
\item[Issue 1.10 (1993/02/02)~(\FormatDate{93/02/01}%
)]
Proof context name changes.
\item[Issue 1.11 (1997/08/12)] Typo.
\item[Issue 1.12 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.13 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.14 (2005/05/07)] HOL now supports left-associative operators.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}

\section{GENERAL}
\subsection{Scope}
This document contains a detailed design
for the theory ``fun\_rel''.
The design is implemented in \cite{DS/FMU/IED/IMP072}.

\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains the detailed design for the theory ``relation''.

\subsubsection{Dependencies}
This document depends on \cite{DS/FMU/IED/IMP071}, and the theory design tools of \cite{DS/FMU/IED/DTD035}.
\subsubsection{Deficiencies}
None known.
\subsubsection{Possible Enhancements}
\section{THE THEORY ``fun\_rel''}
\subsection{Design of the theory ``fun\_rel''}
\subsubsection{Preamble}
=IGN
req_flag := Declare;
initialise_td_results ();
=THDOC
set_flag("tc_thms_only", true);
=DESCRIBE
We set the theorem check only flag since the definitions in the theory are
to be made via constant specification boxes.
=ENDDOC
=THDOC
req_name ⦏"fun_rel"⦎ (Value "bin_rel");
=DESCRIBE
The theory ``$fun\_rel$'' contains the definitions of various
functional (i.e. many-one) subsets of the set of relations.
=ENDDOC
=SML
val _ = open_theory "bin_rel";
val _ = push_merge_pcs["'bin_rel","hol1"];
val _ = new_theory "fun_rel";
=TEX
\subsection{The Theory Contents}

The various ``arrowed'' constants may be defined as the intersection of
another arrowed constant with one of the properties of relations
defined in~\cite{DS/FMU/IED/DTD071}, however for effiency reasons (both
space and time) the definitions below are expanded into a more
primitive form.  One of the module tests, see also
section~\ref{TestPolicy}, shows that these expansions are correct.

=SML
val _ = declare_infix(240,"⇸");
ⓈHOLCONST
│	$⦏⇸⦎:'a ℙ → 'b ℙ → ('a ↔ 'b) ℙ
├───────────────────
│	∀ (a : 'a ℙ) (b : 'b ℙ)
│	⦁ (a ⇸ b) = (a ↔ b) ∩ Functional
■
Note that $→$ is already infix.

ⓈHOLCONST
│	$⦏→⦎:'a ℙ → 'b ℙ → ('a ↔ 'b) ℙ
├───────────────────
│	∀ (a : 'a ℙ) (b : 'b ℙ)
│	⦁ (a → b) = (a ↔ b) ∩ Functional ∩ (Total a)
■
=SML
val _ = declare_infix(240,"⤔");
ⓈHOLCONST
│	$⦏⤔⦎:'a ℙ → 'b ℙ → ('a ↔ 'b) ℙ
├───────────────────
│	∀ (a : 'a ℙ) (b : 'b ℙ)
│	⦁ (a ⤔ b) = (a ↔ b) ∩ Functional ∩ Injective
■
=SML
val _ = declare_infix(240,"↣");
ⓈHOLCONST
│	$⦏↣⦎:'a ℙ → 'b ℙ → ('a ↔ 'b) ℙ
├───────────────────
│	∀ (a : 'a ℙ) (b : 'b ℙ)
│	⦁ (a ↣ b) = (a ↔ b) ∩ Functional ∩ Injective ∩ (Total a)	
■

=SML
val _ = declare_infix(240,"⤀");
ⓈHOLCONST
│	$⦏⤀⦎:'a ℙ → 'b ℙ → ('a ↔ 'b) ℙ
├───────────────────
│	∀ (a : 'a ℙ) (b : 'b ℙ)
│	⦁ (a ⤀ b) = (a ↔ b) ∩ Functional ∩ (Surjective b)
■
=SML
val _ = declare_infix(240,"↠");
ⓈHOLCONST
│	$⦏↠⦎:'a ℙ → 'b ℙ → ('a ↔ 'b) ℙ
├───────────────────
│	∀ (a : 'a ℙ) (b : 'b ℙ)
│	⦁ (a ↠ b) = (a ↔ b) ∩ Functional ∩ (Surjective b) ∩ (Total a)	
■
=SML
val _ = declare_infix(240,"⤖");
ⓈHOLCONST
│	$⦏⤖⦎:'a ℙ → 'b ℙ → ('a ↔ 'b) ℙ
├───────────────────
│	∀ (a : 'a ℙ) (b : 'b ℙ)
│	⦁ (a ⤖ b) = (a ↔ b) ∩ Functional ∩ Injective ∩ (Surjective b) ∩ (Total a)	
■
$At$ is the operation of applying a relation to an argument.
We define it so that $f\,At\,x$ has the desired property (i.e. loosely
speaking ``is well defined'') providing the restriction of $f$ to
$\{x\}$ is functional. Thus one can reason about $f\,At\,x$ without
having to prove that $f$ is functional everywhere.
=SML
val _ = declare_left_infix(600,"At");
ⓈHOLCONST
│	$⦏At⦎:('a ↔ 'b) → 'a → 'b
├───────────────────
│	∀ (f : ('a ↔ 'b)) (x : 'a) (y : 'b)
│	⦁  (x, y) ∈ f ∧ (∀z ⦁ (x, z) ∈ f ⇒ z = y) ⇒ f At x = y	
■
We provide the alias $⦏@⦎$ for $At$ which reads fairly well.
=SML
val _ = declare_alias(⦏"@"⦎,⌜$At⌝);
=TEX
\subsection{Theorems}
=THDOC
req_consistency_thm⌜$At⌝;
=DESCRIBE
This theorem is intended to give some confidence in the definition of
application of a partial function.
=ENDDOC
=THDOC
req_thm("graph_at_thm", ([], ⌜∀ f x⦁ Graph f @ x = f x⌝));
=DESCRIBE
This theorem is intended to give some confidence in the definition of
application of a partial function.
=ENDDOC

=THDOC
req_thm("at_at_eq_thm", ([], ⌜
	∀ f X Y x y ⦁
		f ∈ (X ⇸ Y) ∧ x ∈ Dom f ∧ y ∈ Dom f
	⇒	(f @ x = f @ y ⇔ ∃ z ⦁ (x, z) ∈ f ∧ (y, z) ∈ f) ⌝));
=DESCRIBE
This theorem shows when two function applications are equal.
=ENDDOC

=THDOC
req_thm("inv_rel_∈_arrow_thm", ([], ⌜
∀ f a b ⦁
(	f↗~↕ ∈ (b ↔ a) ⇔ f ∈ (a ↔ b) )
∧ (	f↗~↕ ∈ (b ⇸ a) ⇔ f ∈ (a ↔ b) ∩ Injective )
∧ (	f↗~↕ ∈ (b → a) ⇔ f ∈ (a ↔ b) ∩ Injective ∩ (Surjective b) )
∧ (	f↗~↕ ∈ (b ⤔ a) ⇔ f ∈ (a ↔ b) ∩ Injective ∩ Functional )
∧ (	f↗~↕ ∈ (b ⤀ a) ⇔ f ∈ (a ↔ b) ∩ Injective ∩ (Total a) )
∧ (	f↗~↕ ∈ (b ↠ a) ⇔ f ∈ (a ↔ b) ∩ Injective ∩ (Total a) ∩ (Surjective b) )
∧ (	f↗~↕ ∈ (b ⤖ a) ⇔ f ∈ (a ↔ b) ∩ Injective ∩ Functional ∩ (Surjective b) ∩ (Total a) )
∧ (	f↗~↕ ∈ (b ↣ a) ⇔ f ∈ (a ↔ b) ∩ Injective ∩ Functional ∩ (Surjective b) )
⌝));
=DESCRIBE
This theorem is intended to simplify expressions involving the inverse
of a function being a member of a functional set.
=ENDDOC
=TEX
\subsection{Signature of the theory ``fun\_rel''}
=DOC
signature ⦏FunRelTheory⦎ = sig
	val ⦏⇸_def⦎ : THM;
	val ⦏→_def⦎ : THM;
	val ⦏⤔_def⦎ : THM;
	val ⦏↣_def⦎ : THM;
	val ⦏⤀_def⦎ : THM;
	val ⦏↠_def⦎ : THM;
	val ⦏⤖_def⦎ : THM;
	val ⦏at_def⦎ : THM;
	val ⦏graph_at_thm⦎ : THM;
	val ⦏inv_rel_∈_arrow_thm⦎ : THM;
	val ⦏at_at_eq_thm⦎ : THM;
=DESCRIBE
This is the signature in which we declare theory ``fun\_rel''.
=ENDDOC
\section{PROOF CONTEXTS}
=DOC
(* proof context key ⦏"'fun_rel_ext"⦎ *)
=DESCRIBE
This proof context extends $'bin\_rel\_ext$ by:
\begin{description}
\item [Name]\

Becomes ``fun\_rel\_ext''.
\item [Stripping Goals and Theorems]\

Adding in ? applied at the top level or under a single negation.
\item [Rewriting Context]\

Adding in ?.
\end{description}
=ENDDOC
=DOC
(* proof context key ⦏"fun_rel_alg"⦎ *)
=DESCRIBE
$fun\_rel\_alg$ extends $relation\_alg$ by:
\begin{description}
\item [Name]\

Becomes ``fun\_rel\_alg''.
\item [Stripping Goals and Theorems]\

Adding in ? applied at the top level or under a single negation.
\item [Rewriting Context]\

Adding in ?.
\end{description}
=ENDDOC
=SML
end;(* of signature FunRelTheory *)
=TEX
\section{TEST POLICY}
Any functions given in this document should be tested according to the general criteria set out in \cite{DS/FMU/IED/PLN008}, using the tests in \cite{DS/FMU/IED/MDT072}.
In \cite{DS/FMU/IED/MDT072} the theory produced is checked by the theory design tools of \cite{DS/FMU/IED/DTD035}, against the theory design provided.

The module tests should include automatic proof of all the ``rules''
in~\cite{Spivey92} expressible in this part of the theory of functional
relations.

\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}



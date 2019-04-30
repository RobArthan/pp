=IGN
********************************************************************************
mdt011.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  mdt011.doc  ℤ $Date: 2002/10/17 15:10:58 $ $Revision: 2.5 $ $RCSfile: mdt011.doc,v $
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

\def\Title{Module Tests for Antiunification}

\def\AbstractText{This document comprises test cases and test data for Antiunification}

\def\Reference{DS/FMU/IED/MDT011}

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
%% LaTeX2e port: \def\Bool{``$\it{:}bool\,$''}
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{FST PROJECT}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Module Tests for Antiunification}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/MDT011}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 2.5 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2002/10/17 15:10:58 $%
%% LaTeX2e port: }}  %% Mandatory field (with sensible default)
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: %\TPPstatus{Approved}
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{D.J.~King & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{
%% LaTeX2e port: This document comprises test cases and test data for
%% LaTeX2e port: Antiunification}
%% LaTeX2e port: %\TPPabstractB{}
%% LaTeX2e port: %\TPPabstractC{}
%% LaTeX2e port: %\TPPabstractD{}
%% LaTeX2e port: %\TPPabstractE{}
%% LaTeX2e port: %\TPPabstractF{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port:       Library \\ R.D. Arthan\\ D.J. King}}
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

\pagebreak
\section{DOCUMENT CONTROL}
\subsection{Contents List}
\tableofcontents
\subsection{Document Cross References}
\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes History}  % to get section number `0.3'
\begin{description}
\item[Issue 1.1 (1991/04/24) - 1.9 (1991/10/01)]
Initial Drafts.
\item[Issue 2.1 (1991/10/07)]
This is an approved version of issue 1.9 (desk check report is
ID088).


\item[Issue 2.2 (1992/01/20), \FormatDate{92/01/20} ] Updated to use new fonts.
\item [Issue 2.3 (1992/04/09) (8th April 1992)]
Changes required by CR0016.
\item [Issue 2.4 (1992/04/14) (14th April 1992)]
Changes required by CR0017.
\item[Issue 2.5 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 2.6 (2002/10/17)] PPHol-specific updates for open source release
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

This document comprises tests of the function antiunify
which is specified in \cite{DS/FMU/IED/IMP011}.

\subsection{Introduction}

\subsubsection{Background and Purpose}

This document is the first document to use the module test harness
described in \cite{DS/FMU/IED/DTD013}. Its purpose is to test fully
the function antiunify in accordance with the test policy in
\cite{DS/FMU/IED/DTD011} and the guidelines laid out in the
quality plan, \cite{DS/FMU/IED/PLN008}.

\subsubsection{Dependencies}

This document depends on the signature Antiunify specified
in \cite{DS/FMU/IED/DTD011}, and the structure Antiunify
specified in \cite{DS/FMU/IED/IMP011}. It makes use of the
module test harness described in \cite{DS/FMU/IED/DTD013} and
\cite{DS/FMU/IED/IMP013}.

\subsubsection{Possible Enhancements}

None.

\subsubsection{Deficiencies}

None Known.

\section{TEST CASES}

\begin{description}

\item[antiunify.1] that the antiunification of any two identical
type variables is the type variable.

\item[antiunify.2] that the antiunification of any two identical
types is that same type

\item[antiunify.3] that the antiunification of the following
produces a new type variable:

\begin{enumerate}

\item two different type variables

\item a type variable and a type

\item two different types with different construct

\item two different types with same constructors but
different length type lists.

\end{enumerate}

\item[antiunify.4] that the antiunification of a non-easy pair
which differ in all list types produces a type with
the same constructor but a list containing new type
variables.

\item[antiunify.5] that when more than one new type variable is
generated in a list, that they are unique.

\item[antiunify.6] that the order of the arguments supplied
to antiunify does not matter.

\item[antiunify.7] that a new type variable will not
clash with a type variable present in either of the
two types.

\end{description}

\section{INITIALISATION}

=SML
use_file "dtd013.sml";
use_file "imp013.sml";

init_mt_results ();
=TEX



\section{TEST DATA AND TEST CODE}

=SML
let
open Antiunify;
val va = mk_vartype "VA";
val vb = mk_vartype "VB";
val vc = mk_vartype "VC";
val vd = mk_vartype "VD";
val ve = mk_vartype "VE";
val vf = mk_vartype "VF";
val vg = mk_vartype "VG";
val vh = mk_vartype "VH";
=TEX

=SML
val ta0  = mk_ctype ("TA",[]);
val tb0  = mk_ctype ("TB",[]);
val taq = mk_ctype ("'X",[]);
val ta1 = mk_ctype ("TA",[ta0]);
val ta1b= mk_ctype ("TA",[tb0]);
val tb1 = mk_ctype ("TB",[tb0]);
val ta2 = mk_ctype ("TA",[ta0,ta1]);
val ta2b = mk_ctype ("TA",[ta0,tb1]);
val ta3 = mk_ctype ("TA",[ta0,ta1,ta0]);
val ta3b = mk_ctype ("TA",[ta0,tb1,tb0]);
val ta3c = mk_ctype ("TA",[ta0,taq,tb0]);
val ta3d = mk_ctype ("TA",[ta1,ta1b,taq]);
val ANY = mk_ctype ("ANY",[]);
val EQ  = mk_ctype ("EQ", [ANY,ANY]);
val IFF = mk_ctype ("IFF",[BOOL,BOOL]);
val EQB = inst_type [(ANY,mk_vartype"BOOL")] IFF;
=TEX

=SML
val res0 = mk_vartype ("'0");
val res00 = mk_vartype ("''0");
val res0a = mk_vartype ("'1");
val res00a = mk_vartype ("''1");
val res00b = mk_vartype ("''2");
val res1 = mk_ctype ("TA",[res0]);
val res2 = mk_ctype ("TA",[ta0,res0]);
val res3 = mk_ctype ("TA",[ta0,res0,res0a]);
val res4 = mk_ctype ("TA",[ta0,res00,res00a]);
val res5 = mk_ctype ("TA",[res00,res00a,res00b]);
=TEX

=SML
in
store_mt_results (mt_runf (op =:))
[
("antiunify.1",   antiunify, (va,va),		va),
("antiunify.2.1", antiunify, (ta0,ta0),		ta0),
("antiunify.2.2", antiunify, (ta1,ta1),		ta1),
("antiunify.3.1", antiunify, (va,vb),		res0),
("antiunify.3.2", antiunify, (va,ta0),		res0),
("antiunify.3.3", antiunify, (ta0,tb0),		res0),
("antiunify.3.4", antiunify, (ta0,ta1),		res0),
("antiunify.4.1", antiunify, (ta1,ta1b),	res1),
("antiunify.4.2", antiunify, (ta3b,ta3d),	res5),
("antiunify.5.1", antiunify, (ta2,ta2b),	res2),
("antiunify.5.2", antiunify, (ta3,ta3b),	res3),
("antiunify.6.1", antiunify, (ta3b,ta3),	res3),
("antiunify.6.2", antiunify, (ta2,ta2b),	res2),
("antiunify.6.3", antiunify, (ta0,va),		res0),
("antiunify.7.1", antiunify, (va,taq),		res00),
("antiunify.7.2", antiunify, (ta3,ta3c),	res4),
("antiunify.7.3", antiunify, (ta3c,ta3d),	res5),
("antiunify.8.1", antiunify, (IFF,EQ),		res0),
("antiunify.8.2", antiunify, (IFF,EQB),		IFF)
]
end;
=TEX

=SML
diag_string(summarize_mt_results());
=TEX

%\newpage
%\twocolumn[\section{INDEX OF DEFINED TERMS}]
%\printindex
\end{document}




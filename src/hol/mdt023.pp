=IGN
********************************************************************************
mdt023.doc: this file is part of the PPHol system

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

\def\Title{Module Tests for the General Purpose Theories}

\def\AbstractText{A set of module tests are given for the theories ``min'', ``log'' and ``misc''.}

\def\Reference{DS/FMU/IED/MDT023}

\def\Author{K.Blackburn}


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
%% LaTeX2e port: \TPPtitle{Module Tests for the General Purpose Theories}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Module Tests for the \cr Basic Definitions and Axioms}
%% LaTeX2e port: \TPPref{DS/FMU/IED/MDT023}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.4 $ %
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2002/10/17 15:10:58 $ %
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{ML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.Blackburn & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{K.Blackburn & WIN01\\D.J.~King & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{A set of module tests are given for the
%% LaTeX2e port: theories ``min'', ``log'' and ``misc''.}
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
\section{Document Control}
\subsection{Contents List}
\tableofcontents
\subsection{Document Cross References}
\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes History}
\begin{description}
\item [Issue 1.1 (1991/10/18)]
First draft version.

\item[Issue 1.2 (1992/01/20), \FormatDate{92/01/20} ] Updated to use new fonts.
\item [Issue 1.3 (1992/04/14) (14th April 1992)]
Changes required by CR0017.

\item[Issue 1.4 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.5 (2002/10/17)] PPHol-specific updates for open source release
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
Additions, as required by the additions of theorems to
the theories.
\section{GENERAL}
\subsection{Scope}
This document contains the module testing of the functions (conversions ,etc) associated with the
general purpose theories, required by \cite{DS/FMU/IED/DTD023}:
currently none.
It then checks the theory designs via the tools of \cite{DS/FMU/IED/DTD035}.
The design is in \cite{DS/FMU/IED/DTD023}
and it is
implemented in \cite{DS/FMU/IED/IMP023}.

\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains the module testing of the function material given a design in \cite{DS/FMU/IED/DTD023},
currently none,
following the test policy given in that document and the general policy given in \cite{DS/FMU/IED/PLN008}.
It then checks the theory implementation meets the theory
design.

\subsubsection{Dependencies}
The testing uses material from \cite{DS/FMU/IED/DTD013}.
This document is derived from the detailed design in \cite{DS/FMU/IED/DTD023},
and is further influenced by the implementation, in  \cite{DS/FMU/IED/IMP023}.
It also requires a theory check file, ``dtd023.tch'', created
by \[doc4thcheck\ dtd023\]
as described in
\cite{DS/FMU/IED/DTD035}.

\subsubsection{Deficiencies}
None known.
\section{INITIALISATION}
Initialise the test package:
=SML
use_file "dtd013.sml";
use_file "imp013.sml";
init_mt_results();
=TEX
\section{TESTING FUNCTIONS OF THE DESIGN}
There are currently no functions provided for the
starting theories.
\section{CHECK THE THEORY DESIGN}
=SML
use_file "dtd023.tch";
store_mt_results mt_run[("theory design of min",
	Combinators.K min_success,
	(),
	true),
	("theory design of log",
	Combinators.K log_success,
	(),
	true),
	("theory design of init",
	Combinators.K init_success,
	(),
	true),
	("theory design of misc",
	Combinators.K misc_success,
	(),
	true)];
=TEX
\section{END OF TESTS}
=SML
diag_string(summarize_mt_results());
=TEX
\end{document}




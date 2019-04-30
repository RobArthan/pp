=IGN
********************************************************************************
mdt092.doc: this file is part of the PPHol system

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

\def\Title{Theory of Sets II}

\def\AbstractText{A set of module tests are given for the theory material defined in DS/FMU/IED/DTD092.}

\def\Reference{DS/FMU/IED/MDT092}

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
%% LaTeX2e port: \TPPtitle{Theory of Sets II}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/MDT092}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision$ %
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date$ %
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{ML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.Blackburn & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{K.Blackburn & WIN01\\D.J.~King & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{A set of module tests are given for the
%% LaTeX2e port: theory material defined in DS/FMU/IED/DTD092.}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	    Library
%% LaTeX2e port: }}
%% LaTeX2e port: \begin{document}
%% LaTeX2e port: \makeTPPfrontpage
%% LaTeX2e port: \vfill
%% LaTeX2e port: \begin{centering}
%% LaTeX2e port: 
%% LaTeX2e port: \bf Copyright \copyright\ : International Computers Ltd \number\year
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
\item [Issue 1.1 (1993/02/07)]
First draft version.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
Additions, as required by any extensions
to \cite{DS/FMU/IED/DTD092}.
\section{GENERAL}
\subsection{Scope}
This document contains the module testing of the material
whose detailed design is given in \cite{DS/FMU/IED/DTD092}.
and it is implemented in \cite{DS/FMU/IED/IMP092}.

\subsection{Introduction}
\subsubsection{Purpose and Background}
See the test policy given in \cite{DS/FMU/IED/IMP092} and the general policy given in \cite{DS/FMU/IED/PLN008}.

\subsubsection{Dependencies}
The testing uses material from \cite{DS/FMU/IED/DTD013}.
This document is derived from the detailed design in \cite{DS/FMU/IED/DTD092},
and is further influenced by the implementation, in  \cite{DS/FMU/IED/IMP092}.
It also requires a theory check file, ``dtd092.tch'', created
by \[doc4thcheck\ dtd092\]
described in
\cite{DS/FMU/IED/DTD035}.

\subsubsection{Deficiencies}
None known.
\section{DISCUSSION OF TEST CASES}
Since the detailed design requires only theories, HOL definitions and theorems
there are no metalanguage functions to test. All that is required is to
exercise the theory design checker for each of the theories required.
\section{INITIALISATION}
Initialise the test package:
=SML
use_file "dtd013.sml";
use_file "imp013.sml";
init_mt_results();
=TEX
\section{CHECK THE THEORY DESIGNS}
=SML
use_file "dtd092.tch";
store_mt_results mt_run[("theory design of set_thms",
	Combinators.K set_thms_success,
	(),
	true),
	("theory design of bin_rel_thms",
	Combinators.K fun_rel_thms_success,
	(),
	true)];
=TEX
\section{END OF TESTS}
=SML
diag_string(summarize_mt_results());
=TEX
\end{document}




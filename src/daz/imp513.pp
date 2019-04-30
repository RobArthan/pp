=IGN
********************************************************************************
imp513.doc: this file is part of the PPDaz system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% imp513.doc   ℤ $Date: 2002/10/17 16:04:45 $ $Revision: 1.8 $ $RCSfile: imp513.doc,v $
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

\def\Title{Implementation: Compliance Notation (Volume I) Types}

\def\AbstractText{This document contains the implementation for the automatic generation of a structure containing the Compliance Notation Types defined in Volume I of DRA/CIS/CSE3/TR/94/27/3.0.}

\def\Reference{ISS/HAT/DAZ/IMP513}

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
\def\Hide#1{}
\def\Bool{``$\it{:}bool\,$''}
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{DAZ PROJECT}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Implementation: Compliance Notation (Volume I) Types}  %% Mandatory field
%% LaTeX2e port: \TPPref{ISS/HAT/DAZ/IMP513}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.8 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2002/10/17 16:04:45 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: %\TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{D.J.~King & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & HAT Team}
%% LaTeX2e port: \TPPabstract{This document contains the implementation for the automatic generation of a structure containing the Compliance Notation Types defined in Volume I of DRA/CIS/CSE3/TR/94/27/3.0.}
%% LaTeX2e port: %\TPPabstractB{}
%% LaTeX2e port: %\TPPabstractC{}
%% LaTeX2e port: %\TPPabstractD{}
%% LaTeX2e port: %\TPPabstractE{}
%% LaTeX2e port: %\TPPabstractF{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
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

\item[Issue 1.1 (1994/03/24)] Initial Draft.
\item[Issue 1.2 (1994/05/27) (27th May 1994)] First draft for comment.
\item[Issue 1.4 (1997/08/18)] Updated references.
\item[Issue 1.5 (2001/12/12)] Accommodated use of signature inclusion for Poly/ML port.
\item[Issue 1.6 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.7 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.8 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.9 (2010/02/11)] Now uses same sieveview file as HOL and Z.
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
This document contains the implementation for automatically generating the structure for Volume I types.

The detailed design for this material is in \cite{ISS/HAT/DAZ/DTD513}.
\subsection{Introduction}
\subsection{Purpose and Background}
See \cite{ISS/HAT/DAZ/DTD513}.
\subsection{Possible Enhancements}
None.
=TEX
\section{GENERATING THE STRUCTURE}
=TEX
=SH
sieve -u -f hol.svf imp <dtd513.pp | \
	sed \
	-e '/^signature/s/signature\(.*\)=[ 	]*sig/structure\1:\1= struct/' \
	-e '/include/s/include/open/' \
	-e '/^end.*signature/s/signature/structure/' \
		>imp513.inc
=TEX
=INCLUDE
imp513.inc
=TEX
\small
\twocolumn[\section{INDEX}]
\printindex
\end{document}


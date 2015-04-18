=IGN
********************************************************************************
hld502.doc: this file is part of the PPDaz system

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

\def\Title{High Level Design: HCI}

\def\AbstractText{This document contains the high level design for the custom HCI facilities to be supplied to DRA as part of the DAZ project.}

\def\Reference{ISS/HAT/DAZ/HLD502}

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
%% LaTeX2e port: 
\def\DRASpecs{\cite{DRA/CIS/CSE3/TR/94/27/3.0}}
\def\Volume#1{\cite[volume #1]{DRA/CIS/CSE3/TR/94/27/3.0}\/}
\def\VolumeOne{\Volume 1}
\def\VolumeTwo{\Volume 2}
\def\VolumeThree{\Volume 3}
%% LaTeX2e port: 
\def\Hide#1{}
%% LaTeX2e port: \def\Note#1{[Note:\ {\small #1}]}
\def\Bool{``$\it{:}bool\,$''}
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{DAZ PROJECT}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{High Level Design: HCI}  %% Mandatory field
%% LaTeX2e port: \TPPref{ISS/HAT/DAZ/HLD502}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.10 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: %\TPPdate{}  %% Mandatory field (with sensible default)
%% LaTeX2e port: \TPPstatus{Approved}			%% Mandatory field
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: %\TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{D.J.~King & WIN01}  %% Mandatory field
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & HAT Team}
%% LaTeX2e port: \TPPabstract{
%% LaTeX2e port: This document contains the high level design for the custom HCI facilities to be supplied to DRA as part of the DAZ project.}
%% LaTeX2e port: %\TPPabstractB{}
%% LaTeX2e port: %\TPPabstractC{}
%% LaTeX2e port: %\TPPabstractD{}
%% LaTeX2e port: %\TPPabstractE{}
%% LaTeX2e port: %\TPPabstractF{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	C.~O'Halloran, DRA \\
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
%% LaTeX2e port: %\TPPclass{CLASSIFICATION}
%% LaTeX2e port: \def\TPPheadlhs{Lemma 1 Ltd.}
%% LaTeX2e port: %\def\TPPheadcentre{}
%% LaTeX2e port: %\def\TPPheadcentreproject{}
%% LaTeX2e port: %\def\TPPheadrhs{}
%% LaTeX2e port: \let\TPPfootlhs=\TPPfootrhs
%% LaTeX2e port: \def\TPPfootcentre{$\vcenter{\halign{\hfil\strut##\hfil\cr
%% LaTeX2e port: COPYRIGHT  \copyright\ Lemma 1 Ltd. \number\year\cr}}$}
%% LaTeX2e port: 
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
\listoftables
\pagebreak
\subsection{Document Cross References}
\bibliographystyle{fmu}
\bibliography{fmu,daz}

\subsection{Changes History}
\begin{description}
\item[Issue 1.1 (1994/11/04)] First draft.
\item[Issue 1.2 (1994/12/01)] Updated document references.
\item[Issue 1.3 (1994/12/05)] Reworked according to desk check report 014.
\item[Issue 1.6 (1997/08/18)] Updated references.
\item[Issue 1.7 (1997/08/19)] Tidying.
\item[Issue 1.8 (2002/08/23)] Removed use of ICL logo font.
\item[Issue 1.9 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.10 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.11 (2002/10/17)] DAZ-specific updates to banner for open source release
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

This document gives an overview of the design of those parts of the Compliance Notation Tool which provides customised HCI facilities.
It is written in response to \cite{ISS/HAT/DAZ/HLD501}, and provides a documentation link between that document and the detailed designs of the various modules which implement these facilities.


This document is intended to conform to all relevant local standards for designs identified in \cite{ISS/HAT/DAZ/PLN003}.

\subsection{Introduction}

The requirements document \cite{ISS/HAT/DAZ/DEF501} identifies the following custom HCI facilities for the Compliance Notation Tool:

\begin{description}
\item[REQ.812.1.1] `Automatic templates for easy entry of the top-level constructs of the Compliance Notation and Z
\item[REQ.812.1.2] A help system describing the syntax and use of the constructs
\item[REQ.812.2.1] A menu-driven facility supporting navigation back and forth between any  label (or unlabelled specification statement) and the object which replaces or refines it, and it facilitates easy inspection of the VCs for a refinement step.
\end{description}

The first two of these are largely covered by the user-customisable functionality of the {\tt xpp} interface to {\Product}.
This is further discussed in section {\ref{TemplatesTool}} below.
The name `Templates Tool' is used in this document to cover both these items.

The navigation tool, or `VC Browser', requires closer integration with the Compliance Notation processing proper as described in \cite{ISS/HAT/DAZ/HLD503}.
It is discussed in section\ref{VCBrowser} below.

\subsubsection{Background and Requirements}

See \cite{ISS/HAT/DAZ/DEF501} and \cite{ISS/HAT/DAZ/HLD501}.

\subsection{Compliance}

The functionality whose design is discussed in this document lies outside the scope of the compliance argument.

\section{DESIGN ISSUES}

\subsection{Templates Tool}\label{TemplatesTool}
The design of {\tt xpp} is such that the templates tool and its help system can be implemented by providing a customised version of the application defaults file which defines resource settings used by {\tt xpp}.

\subsection{VC Browser}\label{VCBrowser}
\subsubsection{Implementation Issues}
For uniformity with {\tt xpp}, the VC Browser is implemented using the Motif look and feel.
This could naturally be done in either of two ways: by extending the C code of {\tt xpp} itself; or by using the PolyML Motif interface.
For various reasons, the latter approach has been adopted.
In particular, implementing the VC Browser in ML gives it direct access to the data structures set up by the Compliance Notation Processing, whereas a C implementation would have to access the data structures indirectly (via issuing ML commands and processing the responses).
The ML implementation is therefore believed to be simpler and more robust and to deliver the key functionality to the user with better interactive response.
The main disadvantage is that the VC Browser is not so well integrated with {\tt xpp}, e.g., it cannot share the {\tt xpp} help system;
as the VC Browser is a relatively simple free-standing tool, it is felt that this will not be a serious impediment to the user.

Implementation in Standard ML is also very conducive to a clean split between the interface and the functionality it accesses.
The implementation is therefore split into a Motif-dependent part which implements a parameterised ``Browser Front End'' meeting the general interface requirements of the VC Browser, and the VC Browser itself which configures the Correlation Tool to give the desired functionality.

\subsubsection{HCI Issues}
The VC Browser is required to help the user correlate two lists of information: the list of Compliance Notation clauses constituting the (non-commentary parts of the) input script;
and the VCs which these clauses have given rise to.
Both the VCs and the Compliance Notation clauses are assigned names according to a scheme discussed in \cite{ISS/HAT/DAZ/HLD503,ISS/HAT/DAZ/DTD507} and it is sensible to use these names as handles on the information in the two lists.

The VC Browser can therefore be viewed as two coupled subcomponents each of which performs the task of browsing a list of named syntactic objects.
Each component is implemented as a scrollable list of names combined with a text area for display of the object corresponding to a selected name.
The coupling between the two components is implemented by push-buttons which cause a selected name in one list to be used to filter out those names in the other list which do not correspond to it.

\pagebreak
\section{SUBSYSTEM STRUCTURE}

The Templates Tool and its Help System are not implemented in Standard ML.
Instead a custom version of the {\tt xpp} applications defaults file \verb"~daz/app-defaults/Xpp" together with supporting bitmap files will provide the required functionality.

The division of the VC Browser into Standard ML structures is shown in table \ref{SubsystemStructure}, which also indicates the detailed design document defining the structure and whether or not the structure is to be open.




\begin{table}
\center
\begin{tabular}{||l|l|l|l||}\hline
Functional Unit & Document & Open & Description \\\hline\hline
Browser Front End & dtd506\cite{ISS/HAT/DAZ/DTD506} & No & \ref{VCBrowser} \\ \hline
VC Browser & dtd506\cite{ISS/HAT/DAZ/DTD506} & Yes & \ref{VCBrowser} \\ \hline

\end{tabular}
\caption{Subsystem Structure}\label{SubsystemStructure}
\end{table}

The relationship of the above breakdown with the Standard ML structures is given in the table \ref{SubsystemsAndStandardMLStructures}

\begin{table}
\center
\begin{tabular}{||l|l|l|l||}\hline
Subsystems & Structures \\\hline\hline
Browser Front End & $CNBrowserFrontEnd$ \\ \hline
VC Browser & $CNVCBrowser$ \\ \hline
\end{tabular}
\caption{Subsystems and Standard ML Structures}\label{SubsystemsAndStandardMLStructures}
\end{table}

\section{DATA STORAGE AND FORMATS}\label{DataStorageAndFormats}

The HCI systems do not maintain any externally accessible state.
\section{ERROR REPORTING AND RECOVERY}\label{ErrorReporting}

The presentation of any error messages to the user when the VC Browser is invoked is via the normal {\Product} error handling facilities.
Messages produced during operation of the VC Browser should be handled using Motif facilities.

\section{TEST SPECIFICATION}
The integration tests for this subsystem are to comprise interactive tests which will use the HCI facilities to load a Compliance Notation script and then exercise the various facilities of the Templates Tool VC Browser.


\end{document}


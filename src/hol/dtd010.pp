=IGN
********************************************************************************
dtd010.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  dtd010.doc  ℤ $Date: 2002/10/17 15:10:58 $ $Revision: 2.3 $ $RCSfile: dtd010.doc,v $
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

\def\Title{Detailed Design for Warning Message Subsystem}

\def\AbstractText{This document gives the detailed design of the facility for reporting recoverable error conditions to the user in the ICL HOL system.}

\def\Reference{DS/FMU/IED/DTD010}

\def\Author{R.D. Arthan}


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
%% LaTeX2e port: \TPPtitle{Detailed Design for Warning Message Subsystem}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/DTD010}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 2.3 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2002/10/17 15:10:58 $%
%% LaTeX2e port: }}  %% Mandatory field (with sensible default)
%% LaTeX2e port: %\TPPstatus{Approved}
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{R.D.~Arthan & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{
%% LaTeX2e port: This document gives the detailed design of the
%% LaTeX2e port: facility for reporting recoverable error conditions
%% LaTeX2e port: to the user in the ICL HOL system.}
%% LaTeX2e port: %\TPPabstractB{}
%% LaTeX2e port: %\TPPabstractC{}
%% LaTeX2e port: %\TPPabstractD{}
%% LaTeX2e port: %\TPPabstractE{}
%% LaTeX2e port: %\TPPabstractF{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port:       Library}}
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
\subsection{Contents list}
\tableofcontents
\subsection{Document cross references}
\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes history}  % to get section number `0.3'
\begin{description}
\item[Issues 1.1 (1991/05/21) to 1.4 (1991/08/30) ] Drafts.

\item[Issue 2.1 (1991/08/30), 30 August 1991 ] First approved version.


\item[Issue 2.2, \FormatDate{92/01/20} ] Updated to use new fonts.

\item[Issue 2.3 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 2.4 (2002/10/17)] PPHol-specific updates for open source release
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
%\subsection{Changes forecast}
\section{GENERAL}
\subsection{Scope}
This document contains part of the detailed design of the
ICL HOL system. The high-level design for this document is in
\cite{DS/FMU/IED/HLD006}.
\subsection{Introduction}
\subsubsection{Background and Purpose}
The desired attributes of the warning message subsystem
are defined in \cite{DS/FMU/IED/HLD002} and further elaborated
in \cite{DS/FMU/IED/HLD006}.
\subsubsection{Dependencies}
This document depends on \cite{DS/FMU/IED/IMP002}.
The (non-standard) $ExtendedIO$ structure or some similar
library facility is required to detect whether or not the session
is interactive.
\subsubsection{Interface}
The document defines a signature $Warning$.
\subsubsection{Possible Enhancements}
More sophisticated control of whether or not to continue when running
off-line might be desirable (e.g. a system of severity levels).

\subsubsection{Deficiencies}\label{Deficiencies}
None known.

\section{PREAMBLE}
=DOC
signature ⦏Warning⦎ = sig
=DESCRIBE
This is the signature of the structure containing the function $warn$
which is used to report recoverable error conditions.
It also contains the function $comment$ which is used to pass comments from
the system to the user.
=ENDDOC
\section{THE FUNCTION $warn$}
=DOC
	val ⦏warn⦎ : string -> int -> (unit -> string) list -> unit
=DESCRIBE
$warn$ is used to report on recoverable error conditions. The parameters
are exactly as for $fail$ and $error$ (q.v.).
The behaviour of $warn$ depends on the system control flag
$ignore\_warnings$ and on whether or not the system is running
interactively, as shown in the following table:

\begin{centering}
\begin{tabular}{|l|l|p{3.5in}|}\hline
$interactive$ & $ignore\_warnings$ & Effect \\ \hline
yes & false &
the message is reported; the system asks the user whether to continue;
if the answer is `yes' then control returns to the caller of $warn$
otherwise an exception is raised.
\\ \hline
yes & true &
the message is reported and control returns to the caller of $warn$
\\ \hline
no & false &
the message is reported and an exception is raised
\\ \hline
no & true &
the message is reported and control returns to the caller of $warn$
\\ \hline
\end{tabular}
\end{centering}
=FAILURE
10001	*** WARNING ?0 raised by ?1:
10002	Do you wish to continue (y/n)?
10003	execution of ?0 abandoned
=ENDDOC

\section{THE FUNCTION $comment$}
=DOC
	val ⦏comment⦎ : string -> int -> (unit -> string) list -> unit
=DESCRIBE
$comment$ is used to report messages to the user.  The parameters
are exactly as for $fail$ and $error$ (q.v.).

=FAILURE
10010	*** COMMENT ?0 raised by ?1:
=ENDDOC

=SML
end; (* of signature Warning *)
=TEX
\section{TEST POLICY}
Ordinary module testing will only be able to check out the off-line cases
which must be tested according to the criteria of
\cite{DS/FMU/IED/PLN008}.
The interactive cases will be tested as part of the integration tests.

\section{INDEX OF DEFINED TERMS}
%\twocolumn[\section{INDEX OF DEFINED TERMS}]
\printindex
\end{document}




=IGN
********************************************************************************
dtd512.doc: this file is part of the PPDaz system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  dtd512.doc ℤ $Date: 2002/10/17 16:04:45 $ $Revision: 1.11 $ $RCSfile: dtd512.doc,v $
%
% use the following to make the .dvi file:
%
% make -f daz.mkf dtd512.dvi
%
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

\def\Title{Detailed Design: Compliance Notation Reader/Writer}

\def\AbstractText{This document contains the detailed design for the Compliance Notation Reader/Writer.}

\def\Reference{ISS/HAT/DAZ/DTD512}

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
\def\Bool{``$\it{:}bool\,$''}
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{DAZ PROJECT}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Detailed Design: Compliance Notation Reader/Writer}  %% Mandatory field
%% LaTeX2e port: \TPPref{ISS/HAT/DAZ/DTD512}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.11 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2002/10/17 16:04:45 $%
%% LaTeX2e port: }}
%% LaTeX2e port: %\TPPstatus{Approved}
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: %\TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{D.J.~King&WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & DAZ Team}
%% LaTeX2e port: \TPPabstract{
%% LaTeX2e port: This document contains the detailed design for the Compliance Notation Reader/Writer.}
%% LaTeX2e port: %\TPPabstractB{}
%% LaTeX2e port: %\TPPabstractC{}
%% LaTeX2e port: %\TPPabstractD{}
%% LaTeX2e port: %\TPPabstractE{}
%% LaTeX2e port: %\TPPabstractF{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	A.~Smith, DRA \\
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
\item[Issue 1.1 (1994/02/21)-1.4 (1994/02/22)] Initial Drafts.

\item[Issue 1.5 (1994/05/27) (27th May 1994)]
First draft for comment.

\item[Issue 1.7 (1994/09/21) (21th Sept 1994)]
Rework done according to desk check report 005, and checked by KB.

\item[Issue 1.8 (1995/10/27)] Updated the distribution list.

\item[Issue 1.9 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.10 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.11 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.12 (2008/10/26)] SPARK annotations are now recognised in the reader/writer.
Related error message is now here rather than in \cite{ISS/HAT/DAZ/DTD501}.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported daz source documents onto the Lemma 1 document template
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
None.
\section{GENERAL}
\subsection{Scope}

This document responds to the requirement for a reader/writer for compliance notation identified in \cite{ISS/HAT/DAZ/HLD503} which covers compliance notation processing. The implementation of this detailed design can be found in \cite{ISS/HAT/DAZ/IMP512}.

\subsection{Introduction}

\subsubsection{Purpose and Background}

This document contains the detailed design for the reader/writer for recognising compliance notation. It covers recognition of web clauses which are not Z paragraphs.

The compliance notation reader is made available to the compliance tool by specifying it in the recogniser function. The recogniser function is called directly by the {\Product} reader/writer and this invokes the compliance notation reader $cn\_reader$. The design for the recogniser function is to be found in \cite{ISS/HAT/DAZ/DTD504} and its implementation in \cite{ISS/HAT/DAZ/IMP504}.

A specific Compliance Notation writer is not required since the existing {\Product} facilities for displaying strings is suitable without any modifications.

%\subsubsection{Dependencies}
%\subsubsection{Possible Enhancements}
\subsubsection{Deficiencies}
None known.

\section{DESIGN ISSUES}

\subsection{Strings in SPARK}

SPARK has a requirement to support strings delimited by double quotation characters. The more general requirement in Ada for use of other delimiters (e.g., \%), is explicitly forbidden in SPARK. Escape sequences using backslash are not a feature of SPARK (although they are provided both in {\ProductHOL} and {\ProductZ}). Likewise percent keywords are a feature of {\Product} and cannot appear in SPARK strings.

The only escape sequence in SPARK strings is the use of two consecutive double quotation characters {``\ '\ '\ ''} to denote a single occurrence of a double quotation character {``\ "\ ''}.

The compliance notation reader supports SPARK strings. When a string is recognised, the reader generates the string using the data constructor $Lex.String : string\  -> Lex.INPUT$.

\subsection{SPARK Comments}

SPARK comments are denoted by two consecutive hyphens. Everything to the end of the line is then ignored. The reader is responsible for stripping the input of SPARK comments.

\subsection{SPARK Text}

Compliance notation comprises not only the SPARK lexemes but also Z lexemes since Z fragments appear in compliance notation (e.g. in specification statement pre- and post-conditions and in auxiliary variables). Therefore the reader must accept a more general class of input than that defined for SPARK. The lexical analyser and the parser have the responsibility of checking the classes of input; this is possible because at that point in processing the input, more contextual information is known.

Specifically, the textual input can comprise extended characters and percent keywords. Note that this aspect of the implementation is very similar to that already available for {\ProductZ}.

\section{THE SIGNATURE $CNReaderWriter$}
=DOC
signature ⦏CNReaderWriter⦎ = sig
=DESCRIBE
This structure holds the reader code specification for recognising compliance notation. A specification writer for compliance notation is not required.
=FAILUREC
All the errors that the basic reader/writer may raise may also be raised
by the compliance notation reader/writer.
=ENDDOC
\section{THE READER FUNCTION}
=DOC
val ⦏cn_reader⦎ : string -> ReaderWriterSupport.READER_FUNCTION;
=DESCRIBE
This is the Compliance Notation reader function; its argument is the name of the recogniser for compliance notation.
This function is provided to allow specialised versions of the CN language
to be read, it is not intended to be called directly called by any user
code.
=FAILUREC
All the errors that the {\Product} reader may raise may also be raised
by the CN reader.
=FAILURE
512005	The string control cn_spark_annotation_char must contain exactly one
	character
512006	The annotation character must be a printable non-space character.
=ENDDOC

=TEX
%--------------------------------------------------------------------

\section{EPILOGUE}
=SML
end; (* signature CNReaderWriter *)
=TEX
\section{TEST POLICY}
The functions in this document are to be tested according to the
criteria identified in \cite{ISS/HAT/DAZ/PLN003} and the testing strategy outlined in \cite{ISS/HAT/DAZ/HLD503}.

\small
\twocolumn[\section{INDEX}]
\printindex

\end{document}




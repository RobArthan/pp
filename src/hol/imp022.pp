=IGN
********************************************************************************
imp022.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% imp022.doc   ℤ $Date: 2002/10/17 16:20:01 $ $Revision: 1.9 $ $RCSfile: imp022.doc,v $
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

\def\Title{Implementation of Parser Interface}

\def\AbstractText{This contains the Standard ML implementation of the parser interface for ICL HOL.}

\def\Reference{DS/FMU/IED/IMP022}

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
%% LaTeX2e port: \TPPtitle{Implementation of Parser Interface}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP022}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.9 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2002/10/17 16:20:01 $%
%% LaTeX2e port: }}  %% Mandatory field (with sensible default)
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{D.J.~King & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{
%% LaTeX2e port: This contains the Standard ML implementation of the
%% LaTeX2e port: parser interface for ICL HOL.}
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
\subsection{Contents list}
\tableofcontents
\subsection{Document cross references}
\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes history}  % to get section number `0.3'
\begin{description}
\item[Issue 1.1 (1991/05/23)-1.3 (1991/07/25)]
Initial versions .

\item[Issue 1.4 (1991/07/25) (25 July 1991)] Lexical analyser now uses $get_fixity$ for token clasification.
\item[Issue 1.5 (1991/09/13) (13 September 1991)] Document prepared
for desk checking.


\item[Issue 1.6 (1992/01/20) (20 January 1992)] Updated to use new fonts.
\item[Issue 1.7 (1992/01/28) (27 January 1992)]
The HOL term recogniser checks that the delimiters of the
term match.

\item[Issue 1.8 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.9 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.10 (2008/02/22)] HOL term reader should allow language name to be ``HOL''.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes forecast}
None.
\pagebreak
\section{GENERAL}
\subsection{Scope}

This document contains the Standard ML code for implementing
the parser interface for the ICL product HOL.
It corresponds to the
detailed design of the parser interface
as specified in \cite{DS/FMU/IED/DTD022}.

\subsection{Introduction}

\subsubsection{Background and Purpose}

The implementation of the parser interface has been done
in response to its detailed design \cite{DS/FMU/IED/DTD022}
and its purpose is to provide the code which connects the
reader-writer \cite{DS/FMU/IED/DTD005} with the
parser and type inferrer.

\subsubsection{Dependencies}

The Standard ML code in this document depends on the literate script
contained in \cite{DS/FMU/IED/DTD022} for the signature of
$ParserInterface$, on \cite{DS/FMU/IED/IMP015} for the
structure $Lex$, on \cite{DS/FMU/IED/IMP020} for the
structure $SymbolTable$ and on \cite{DS/FMU/IED/IMP016}
for the structure $TypeInference$.

\subsubsection{Possible Enhancements}

None are envisaged at present.

\subsubsection{Deficiencies}

None.

\section{THE STANDARD ML CODE FOR THE PARSER INTERFACE}

First, the structure is declared:

=SML
structure ⦏ParserInterface⦎ : ParserInterface = struct
=TEX

The implementation comprises two functions. The function
$HOL\_term\_recogniser$ takes a term from the reader-writer
and calls the lexical analyser, the parser and the type inferrer
to produce a HOL term.

The function $HOL\_type\_recogniser$ does a similar thing for
types.

=SML
local
	open Lex Parser ReaderWriterSupport SymbolTable TypeInference;
	fun ⦏HOL_type_parser⦎ tokens = (
	let	val tokens' = HTName " "::HTColon::tokens
	in
		(type_of o make_term o HOL_parser) tokens'
	end);
in
	fun ⦏HOL_term_recogniser⦎ (start:string, lang:string, value:INPUT list, finish:string) : TERM = (
	if	PrettyNames.is_same_symbol(start, "<")
	andalso	PrettyNames.is_same_symbol(finish, ">")
	andalso	lang = ""
	orelse	lang = "HOL"
	then
		(make_term o HOL_parser o lex (get_current_terminators()) get_fixity) value
	else
		fail "HOL_term_recogniser" 22010 [fn () => start, fn () => lang, fn () => finish]
);

	fun ⦏HOL_type_recogniser⦎ (_, _, x, _) =
		(HOL_type_parser o lex (get_current_terminators()) get_fixity) x;
end;
=TEX

=SML
end; (* of structure ParserInterface *)
=TEX

The reader-writer which compiles these functions expects
the structure to be open.

=SML
open ParserInterface;
=TEX

\twocolumn[\section{INDEX OF DEFINED TERMS}]
\printindex
\end{document}
=IGN





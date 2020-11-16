=IGN
********************************************************************************
dtd501.doc: this file is part of the PPDaz system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  dtd501.doc ℤ $Date: 2006/08/09 11:50:28 $ $Revision: 1.32 $ $RCSfile: dtd501.doc,v $
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

\def\Title{Detailed Design: Compliance Notation Lexical Analyser}

\def\AbstractText{This document contains the detailed design for the Compliance Notation Lexical Analyser.}

\def\Reference{ISS/HAT/DAZ/DTD501}

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
%% LaTeX2e port: \TPPtitle{Detailed Design: Compliance Notation Lexical Analyser}  %% Mandatory field
%% LaTeX2e port: \TPPref{ISS/HAT/DAZ/DTD501}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.32 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2006/08/09 11:50:28 $%
%% LaTeX2e port: }}
%% LaTeX2e port: %\TPPstatus{Approved}
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: %\TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{D.J.~King&WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & HAT Team}
%% LaTeX2e port: \TPPabstract{
%% LaTeX2e port: This document contains the detailed design for the
%% LaTeX2e port: Compliance Notation Lexical Analyser.}
%% LaTeX2e port: %\TPPabstractB{}
%% LaTeX2e port: %\TPPabstractC{}
%% LaTeX2e port: %\TPPabstractD{}
%% LaTeX2e port: %\TPPabstractE{}
%% LaTeX2e port: %\TPPabstractF{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	A.~Smith, DRA \\
%% LaTeX2e port: 	Library}}
%% LaTeX2e port: %\TPPclass{CLASSIFICATION}
%% LaTeX2e port: %\def\TPPheadlhs{}
%% LaTeX2e port: %\def\TPPheadcentre{}
%% LaTeX2e port: %def\TPPheadrhs{}
%% LaTeX2e port: \def\TPPheadlhs{Lemma 1 Ltd.}
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
\item[Issue 1.1 (1994/01/30)-1.17 (1994/12/01)] Initial Drafts.
\item[Issue 1.18 (1994/12/06)] Reworked according to desk check report 015.
\item[Issue 1.19 (1995/10/18)-1.20 (1995/10/24)] Added support for Hypertext link generation.
\item[Issue 1.21 (1995/10/25)] Tidy up prior to review. RDA
\item[Issue 1.22 (1995/12/14)] Updated references.
\item[Issue 1.24 (2002/08/23)] Removed use of ICL logo font.
\item[Issue 1.25 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issues 1.26 (2002/10/17), 1.27 (2002/10/17)] DAZ-specific updates to banner for open source release
item[Issue 1.28] Dollar escapes for Compliance Notation reserved words.
\item[Issue 1.29 (2003/07/01)] Now exports list of Compliance Notation reserved words for use in
the SPARK output code.
\item[Issue 1.30 (2004/10/27)] Now have an option to ignore SPARK annotations.
\item[Issue 1.31 (2005/05/28)] Dollar prefix now required on Compliance Notation reserved words.
\item[Issue 1.32 (2006/08/09)] New error message for invalid setting of {\em cn\_spark\_annotation\_char}.
\item[Issue 1.33 (2008/10/26)] Message for invalid setting of {\em cn\_spark\_annotation\_char} now belongs
in \cite{ISS/HAT/DAZDTD512}.
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

This document contains the detailed design for the compliance notation lexical analyser. It supports the lexis defined in the SPARK Manual \cite{pvl90} required to support the Compliance Tool as specified by DRA in \cite{DRA/CIS/CSE3/TR/94/27/3.0}.

\subsection{Introduction}

\subsubsection{Purpose and Background}

Two signatures are introduced in this document. The first is $CaseIndependence$ and provides a couple of useful utilities for the conversion of lowercase strings to uppercase and vice-versa. The second is called $CNLex$ and contains one function $cn\_lex$ which converts the input (from the Compliance Notation Reader/Writer) and lexically analyses it according to the SPARK lexis to produce a list of lexical items.

\subsubsection{Dependencies}

The function $cn\_lex$ in $CNLex$ depends on data types introduced in the structure $CNTypes$ which is defined in \cite{ISS/HAT/DAZ/DTD502}.

\subsection{Compliance}

The functions in this document provide a means of lexically analysing the user's input. The target data type can be found in \cite{ISS/HAT/DAZ/DTD502}.

All Spark names are stored in the Compliance Tool internally in upper case in a dictionary. This enables issues relating to case sensitivity to be factored out, and by ensuring that the implementation calls $get\_internal\_names$ to convert Spark names to their upper-case equivalent at the appropriate points, no other part of the implementation need be concerned with case sensitivity.

\section{THE SIGNATURES}
\subsection{The Signature $CaseIndependence$}
=DOC
signature ⦏CaseIndependence⦎ = sig
=DESCRIBE
This is the signature of a structure containing utilities to assist
in implementing support for languages where equality of identifiers
is independent of the case of letters.
=ENDDOC
=DOC
val ⦏to_lower⦎ : string -> string
val ⦏to_upper⦎ : string -> string
=DESCRIBE
$to\_lower\,s$ is $s$ with all upper-case letters replaced by their
lower-case equivalents.

$to\_upper\,s$ is $s$ with all lower-case letters replaced by their
upper-case equivalents.
=ENDDOC
=IGNORE
=DOC
val ⦏get_internal_name⦎ : string -> string
val ⦏get_external_name⦎ : string -> string
val ⦏reset_names⦎ : unit -> unit
=DESCRIBE
$get\_internal\_name$ stores its argument in a dictionary whose key is the capitalised form of the argument. If there is already an entry in the table whose capitalisation differs from that of the argument provided, a warning message is generated stating the inconsistent use of case. Otherwise no message is produced and the table is not updated. $get\_internal\_name$ always returns the capitalised form of the argument.

$get\_external\_name$ looks up in the dictionary the entry corresponding whose key is the capitalised form of the argument. If an entry is found, it is returned; otherwise $get\_external\_name$ is the identity function and just returns its argument.

$reset\_names$ clears the dictionary of all the entries.
=USES
These functions are used by the lexical analyser to convert SPARK names to a uniform internal form and facilitating the detection inconsistent case usage.

=FAILURE
501100	Inconsistent use of case: "?0", "?1"
=ENDDOC
=SML
end; (* of signature CaseIndependence *)
=TEX

\subsection{The Signature $CNLex$}
=DOC
signature ⦏CNLex⦎ = sig
=DESCRIBE
This is the signature for the structure containing the lexical analyser for Compliance Notation.
=ENDDOC

=TEX
\subsection{The Lexical Analyser Function}
It is necessary for the Compliance Tool to be able to annotate the a Compliance Script with hypertext link macros (as defined in the $hyperbasics.sty$ style).
The function $cn\_lex$ returns a list of relative line numbers corresponding to the location of any k-slots or specification statements.
=DOC
val ⦏cn_lex⦎ : (CNTypes.CN_LEX_ITEM list -> CNTypes.CN_LEX_ITEM list)
			-> Lex.INPUT list
			-> (CNTypes.CN_LEX_ITEM list * int list);

=DESCRIBE
$cn\_lex$ is the function which lexically analyses a list of items and produces a list of lexemes corresponding to the SPARK Lexis.

The first argument of $cn\_lex$ is a function which transforms recognises a list of items which begin with an open-parenthesis character followed by a number and converts this into a lexical token corresponding to a particular type of web-clause. This enables labelled web-clauses to be classified prior to parsing and this serves to reduce the size of the grammar for web-clauses significantly.

The second argument to $cn\_lex$ is a list of input items which is the output of the reader/writer when a web-clause is recognised.

The function $cn\_lex$ returns a pair whose second item is a list of relative line numbers corresponding to the location of any k-slots or specification statements.

=USES
$cn\_lex$ is not called by the user directly; it is intended to be called by the web-clause processor.
=FAILURE
501001	Lexical analysis error: ?0 is not allowed here in Compliance Notation
501002	Parser internal error: ?0
501003	error code ?0 reported by reader/writer
501004	Lexical analysis error: $ is only allowed before a Compliance Notation reserved word
=ENDDOC
=TEX
=DOC
(* Flag ⦏cn_ignore_spark_annotations⦎ - boolean control, default false *)
=DESCRIBE
This flag controls the treatment of Ada comments having the form of SPARK annotations,
i.e., comments beginning with ``\verb|--#|''.
If the flag is false, the default, then such comments are treated as SPARK annotations and
may only appear in syntactic positions where the SPARK syntax accepts an annotation.
The annotations are remembered for inclusion in the output when the program is printed.
If the flag is true, then such comments are treated as ordinary Ada comments and ignored.

=ENDDOC



=SML
end; (* of signature CNLex *)
=TEX

\section{TEST POLICY}
The functions in this document are to be tested according to the
criteria identified in \cite{ISS/HAT/DAZ/PLN003}.

\small
\twocolumn[\section{INDEX}]
\printindex

\end{document}




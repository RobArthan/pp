=IGN
********************************************************************************
dtd008.doc: this file is part of the PPHol system

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

\def\Title{Detailed Design for Discrimination Nets}

\def\AbstractText{This document gives a detailed design for the discrimination net tools in ICL HOL. These allow the rapid selection of a subset of values, based on a term's form.}

\def\Reference{DS/FMU/IED/DTD008}

\def\Author{K. Blackburn}


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
%% LaTeX2e port: \TPPtitle{Detailed Design for Discrimination Nets}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Detailed Design for Discrimination Nets}
%% LaTeX2e port: \TPPref{DS/FMU/IED/DTD008}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 2.5 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2002/10/17 16:20:01 $ %
%% LaTeX2e port: }}  %% Mandatory field
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: %\TPPstatus{Approved}
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.~Blackburn & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document gives a detailed design for the discrimination net tools in ICL HOL.
%% LaTeX2e port: These allow the rapid selection of a subset of values, based
%% LaTeX2e port: on a term's form.}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	    Project Library
%% LaTeX2e port: }}
%% LaTeX2e port: %\TPPclass{CLASSIFICATION}
%% LaTeX2e port: %\def\TPPheadlhs{}
%% LaTeX2e port: %\def\TPPheadcentre{}
%% LaTeX2e port: %def\TPPheadrhs{}
%% LaTeX2e port: %\def\TPPfootlhs{}
%% LaTeX2e port: %\def\TPPfootcentre{}
%% LaTeX2e port: %\def\TPPfootrhs{}
%% LaTeX2e port: \begin{document}
%% LaTeX2e port: \makeTPPfrontpage
%% LaTeX2e port: \vfill
%% LaTeX2e port: \begin{centering}
%% LaTeX2e port: \bf Copyright \copyright\ : Lemma 1 Ltd. \number\year
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
\item [Issue 2.1 (1991/08/16) (16th August 1991)]
Approved version of issue 1.3.
\item [Issue 2.2 (1991/10/30)]
Renamed various functions in preparation for the structure
to be opened during the system build.

\item[Issue 2.3, \FormatDate{92/01/20} ] Updated to use new fonts.

\item[Issue 2.4 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 2.5 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 2.6 (2013/11/24)] Added {\em net\_flatten}.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
None.
\section{GENERAL}
\subsection{Scope}
This document contains a detailed design for the
discrimination net tools.
These will support the implementation of the rewriting and stripping tools.
This is called for in the high level design of \cite{DS/FMU/IED/HLD009}.
The design is
implemented in \cite{DS/FMU/IED/IMP008}.
\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains a detailed design for the
discrimination net tools in Release 001 of ICL HOL.
These tools are concerned with the rapid choice of
a subset of a set of values based on a term's structure.
They will be used, among other places, in implementing efficient rewriting utilities,
by selecting various rewriting conversions, based on
the term to which the conversion will be applied.
In this case they will be used to process ``equational contexts'' as described in \cite{DS/FMU/IED/DTD028}.
They will also be applicable anywhere else we want an efficient choice of values based on term forms.

The tools have been derived from the
Cambridge HOL code by reverse engineering. The reference
given there for the algorithm is the book `Artificial Intelligence
Programming' \cite{Charniak87}.

\subsubsection{Dependencies}
Loading this document is dependent on \cite{DS/FMU/IED/IMP003}, but is non-critical code and therefore need not be installed until after \cite{DS/FMU/IED/IMP012}.

\subsubsection{Deficiencies}
None known.
\subsubsection{Possible Enhancements}
None known.
\section{THE NET TOOLS}
=DOC
signature ⦏NetTools⦎ = sig
=DESCRIBE
This provides the discrimination net tools that will be used to maintain and use
databases of values indexed by term form.
=ENDDOC
The following design error messages are for functions not visible in this
document, and will be given the ``area'' $NetTools$.
The user should never see them: they are present as an act of ``defensive programming''.
=FAILURE
8001	DESIGN_ERROR : get_edge given invalid discrimination net
8002	DESIGN_ERROR : update given invalid discrimination net
=TEX
=DOC
type 'a ⦏NET⦎;
=DESCRIBE
This is the type of a discrimination net, its type parameter being the type of values
that are handled by the net.
=ENDDOC
=DOC
val ⦏empty_net⦎ : 'a NET;
=DESCRIBE
This is the starting discrimination net, which returns an empty list of values,
regardless of term form.
=ENDDOC
=DOC
val ⦏net_enter⦎ : (TERM * 'a) -> ('a NET) -> ('a NET);
=DESCRIBE
This enters a value and its indexing term into a discrimination net, returning the
resulting net.
=ENDDOC
=DOC
val ⦏list_net_enter⦎ : (TERM * 'a) list -> ('a NET) -> ('a NET);
=DESCRIBE
This enters a list of values and indexing terms into a discrimination net, returning the
resulting net.
=ENDDOC
=DOC
val ⦏make_net⦎ : (TERM * 'a) list -> ('a NET);
=DESCRIBE
This enters a list of values and indexing terms into an empty discrimination net, returning the
resulting net.
=ENDDOC
=DOC
val ⦏net_lookup⦎ : 'a NET -> TERM -> 'a list;
=DESCRIBE
$net\_lookup$ $net$ $term$ will return a list of {\bf at least} all the values entered into $net$
that were indexed by terms which can be  matched
(by $term\_match$, q.v.) to $term$.
I.e. $term$ can be produced by type and term variable instantiation
from the indexing term.

A principal purpose of $net\_lookup$ is to make the process of
rewriting a term using a list of equations and conversions more efficient
by quickly filtering out items which are not applicable.
Consequently speed is more important than accuracy:
to use the wrong metaphor,
it is not important if some inapplicable equations
``slip through the net'' provided all the applicable
ones do as well.

The discrimination net actually returns all values whose indexing terms have the same
structure as the term matched, ignoring types and variables. Thus only the pattern
of constant names, combinations and abstractions will be considered, with variables in the indexing term being presumed to match any term form, regardless of type.

If $net\_lookup$ returns more than one value, then the only
ordering on the resulting values specified is that if two entries are made into the net with the same index term, then if the $net\_lookup$ term matches the index term then the second entered value will be returned before the first in the list of matches.
=ENDDOC
=DOC
val ⦏net_flatten⦎ : 'a NET -> 'a list;
=DESCRIBE
This function returns a list comprising all the entries in the specified discrimination net.
The order of the entries in the list is unspecified.
=ENDDOC
\section{END OF THE SIGNATURE}
=SML
end; (* signature of NetTools *)
=TEX
\section{TEST POLICY}
The functions in this document should be tested according to the general criteria in
\cite{DS/FMU/IED/PLN008}.

\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}




=IGN
********************************************************************************
dtd024.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% dtd024.doc   ℤ $Date: 2002/10/17 15:10:58 $ $Revision: 2.4 $ $RCSfile: dtd024.doc,v $

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

\def\Title{Detailed Design of `Oppen' Formatting Routines}

\def\AbstractText{This document contains the detailed design of the Oppen-style formatting routines for Release 1 of ICL HOL.}

\def\Reference{DS/FMU/IED/DTD024}

\def\Author{A.J. Hammon}


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
%% LaTeX2e port: % dtd024.doc   ℤ $Date: 2002/10/17 15:10:58 $ $Revision: 2.4 $ $RCSfile: dtd024.doc,v $
%% LaTeX2e port: \documentstyle[hol1,11pt,TQ]{article}
%% LaTeX2e port: 
%% LaTeX2e port: \TPPtitle{Detailed Design of `Oppen' Formatting Routines}
%% LaTeX2e port: \TPPref{DS/FMU/IED/DTD024}
%% LaTeX2e port: \def\SCCSissue{$Revision: 2.4 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSissue}
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2002/10/17 15:10:58 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPproject{FST PROJECT}
%% LaTeX2e port: 
%% LaTeX2e port: =IGN
%% LaTeX2e port: 
%% LaTeX2e port: Commands to process this document in various ways.
%% LaTeX2e port: 
%% LaTeX2e port: doc4errors dtd024
%% LaTeX2e port: use_file "dtd024.sml";
%% LaTeX2e port: 
%% LaTeX2e port: make -f rel001.mkf dtd024.dvi
%% LaTeX2e port: doc4tex dtd024
%% LaTeX2e port: tex4dvi dtd024
%% LaTeX2e port: bibtex dtd024
%% LaTeX2e port: doc4tex dtd024 ; tex4dvi dtd024
%% LaTeX2e port: dvipage dtd024 &
%% LaTeX2e port: 
%% LaTeX2e port: 
%% LaTeX2e port: doc4errors dtd024
%% LaTeX2e port: use_file "dtd024.sml";
%% LaTeX2e port: 
%% LaTeX2e port: lasp -s dtd024.doc > zz1
%% LaTeX2e port: lasp -s -u dtd024.OKwords dtd024.doc > zz1
%% LaTeX2e port: 
%% LaTeX2e port: =TEX
%% LaTeX2e port: %\TPPstatus{Approved}
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{A.J. Hammon & WIN01}  %% Mandatory field
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document contains the detailed design of the
%% LaTeX2e port: 	Oppen-style formatting routines for
%% LaTeX2e port: 	Release~1 of ICL~HOL.}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	Library
%% LaTeX2e port: }}
%% LaTeX2e port: 
%% LaTeX2e port: %\ftlinepenalty=9999
%% LaTeX2e port: \makeindex
%% LaTeX2e port: 
%% LaTeX2e port: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LaTeX2e port: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LaTeX2e port: 
\catcode`\_=\active
\def\_{\kern.06em\vbox{\hrule height.1ex width.3em}\hskip0.1em\relax}
%% LaTeX2e port: 
%% LaTeX2e port: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LaTeX2e port: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LaTeX2e port: 
%% LaTeX2e port: \begin{document}
%% LaTeX2e port: \makeTPPfrontpage
%% LaTeX2e port: 
%% LaTeX2e port: \vfill
%% LaTeX2e port: \begin{center}
%% LaTeX2e port: \bf Copyright \copyright\ : Lemma 1 Ltd. \number\year
%% LaTeX2e port: \end{center}

\begin{document}

\headsep=0mm
\FrontPage
\headsep=10mm

\setcounter{section}{-1}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
\section{DOCUMENT CONTROL}

%********************************************************************

\subsection{Contents List}
\tableofcontents
% \listoftables

%********************************************************************

\subsection{Document Cross References}

\bibliographystyle{fmu}
\bibliography{fmu}

%********************************************************************

\subsection{Changes History}

\begin{description}

\item[Issue 1.1 (1991/05/31)  to 1.3 (1991/08/15)]  Initial drafts.

\item[28 August 1991, issue 2.1 ] First approved issue.

\item[20 January 1992, Issue 2.2 (1992/01/20)] Updated to use new fonts.

\item [Issue 2.3 (1992/04/14) (13th April 1992)]
Changes due to CR0017.

%\item[\FormatDate{$Date: 2002/10/17 15:10:58 $%
%}, issue $Revision: 2.4 $

\item[Issue 2.4 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 2.5 (2002/10/17)] PPHol-specific updates for open source release
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}

%********************************************************************

\subsection{Changes Forecast} \label{ChangesForecast}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%\newpage
\section{GENERAL}

%********************************************************************

\subsection{Scope}

This document contains the detailed design of the Oppen-style
formatting routines for Release~1 of the ICL HOL system.  These
routines are required by the high level design~\cite{DS/FMU/IED/HLD008}
as part of the pretty printing capabilities of the system.

The Oppen-style formatting routines are based on D.C.~Oppen's
paper~\cite{Oppen80}.

%********************************************************************

\subsection{Introduction}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\section{SIGNATURE} \label{StartSignature}

=DOC
signature ⦏OppenFormatting⦎ = sig
=DESCRIBE
This structure contains the Oppen-style formatting routines.
=ENDDOC


%--------------------------------------------------------------------
=DOC
type ⦏OPPEN_FUNS⦎	(*
		(    (string -> unit)		(* addstring *)
		*   (int * bool -> unit)		(* beginb *)
		*   (int * int -> unit)		(* space *)
		*   (unit -> unit)		(* endb *)		*);
=DESCRIBE
The routines that form the interface to an Oppen style
layout system, see {\em Prettyprinting\/} by D.C.~Oppen in
{\em ACM Transactions on Programming Languages and Systems,}
October 1980.
=FAILURE
24002	DESIGN ERROR Failed to empty scan buffer
=FAILUREC
Error 24002 denotes an internal fault in the formatting routines.
=SEEALSO
Function $oppen_format$.
=ENDDOC
%--------------------------------------------------------------------

The style of the interface to functions $oppen_format$ and
$oppen_print$ is designed to be close to that of function
$PolyML.install_pp$ so that the same printer function may be used
each of them.  Function $PolyML.install_pp$ is an interface to the
pretty printing system of the PolyML compiler.

=DOC
val ⦏oppen_format⦎ :
		(unit -> int)			(* width *)
	->	(OPPEN_FUNS -> 'a -> unit)	(* printer *)
	->	'a				(* arg *)
	->	string list
=DESCRIBE
In the call `$oppen_format\;\;width\;\;printer\;\;arg$' the
string representation of the value of $arg$ is produced by the side
effects of function $printer$ which uses the Oppen-style printing
routines passed to it.  A complex value may be split across several
lines of text, one line per list element, the head element of the list
being the first line of the output.  The function $width$ yields the
maximum number of characters desired per line.  Longer lines may be
produced when an argument to the $addstring$ printing routine exceeds
the desired width.
=SEEALSO
Type $OPPEN_FUNS$ for function $addstring$.
=FAILURE
24001	Line width ?0 is too small, minimum is ?1
=ENDDOC
%--------------------------------------------------------------------
=DOC
val ⦏oppen_print⦎ :
		(unit -> int)			(* width *)
	->	(OPPEN_FUNS -> 'a -> unit)	(* printer *)
	->	'a				(* arg *)
	->	unit
=DESCRIBE
In the call `$oppen_print\;\;width\;\;printer\;\;arg$' the
the value of $arg$ is printed on the standard output by the side
effects of function $printer$ which uses the Oppen-style printing
routines passed to it.  A complex value may be split across several
lines of text.  The function $width$ yields the
maximum number of characters desired per line.  Longer lines may be
produced when an argument to the $addstring$ printing routine exceeds
the desired width.
=SEEALSO
Type $OPPEN_FUNS$ for function $addstring$.
=FAILURE
24001	Line width ?0 is too small, minimum is ?1
=ENDDOC
%--------------------------------------------------------------------

=SML
end (* of signature OppenFormatting *);
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\section{TEST POLICY}

The Oppen formatting functions are to be tested according to the
general criteria laid down in the quality
plan~\cite{DS/FMU/IED/PLN008}.

A number of tests are required, these basically exercise all the
interfaces to the routines supplied by this structure.  Most of the
tests will exercise function $oppen_format$ on the grounds that it may
be tested by examining its results.  Function $oppen_print$ is small
and very similar to $oppen_format$ but its results are printed by side
effect, testing of it will be by observing that a few test cases give
the correct output.

Particular tests required include the following.

\begin{itemize}

\item Variations of line length with the same streams.

\item Basic confidence tests with short well-formed streams.  These use
	various combinations of the functions from type $OPPEN_FUNS$.

\item Nested streams, with both consistent and inconsistent line
	breaking.

\item Long strings and long sequences of strings, to check the long
	line processing.

\item Various indentation values (the integer argument to $beginb$ and
	the second argument to $space$).

\end{itemize}


\end{document}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%********************************************************************
%--------------------------------------------------------------------

\newpage

\makeatletter
\def\refstepcounter#1{\stepcounter{#1}\global\edef\@currentlabel{\csname
	p@#1\endcsname\csname the#1\endcsname}}
\makeatother

\twocolumn[\section{INDEX}] \label{Index}

\footnotesize
\printindex

\onecolumn

\end{document}




=IGN
********************************************************************************
dtd019.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  dtd019.doc ℤ $Date: 2002/10/17 16:20:01 $ $Revision: 2.10 $ $RCSfile: dtd019.doc,v $
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

\def\Title{Detailed Design for ICL HOL Parser}

\def\AbstractText{This document contains the detailed design for the parser for ICL HOL.}

\def\Reference{DS/FMU/IED/DTD019}

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
%% LaTeX2e port: \TPPtitle{Detailed Design for ICL HOL Parser}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/DTD019}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 2.10 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2002/10/17 16:20:01 $%
%% LaTeX2e port: }}
%% LaTeX2e port: %\TPPstatus{Approved}
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{R.D.~Arthan & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.B. Jones & HAT Manager}
%% LaTeX2e port: \TPPabstract{
%% LaTeX2e port: This document contains the detailed design for the
%% LaTeX2e port: parser for ICL HOL.}
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
\bibliography{fmu}

\subsection{Changes History}  % to get section number `0.3'
\begin{description}
\item[Issues 1.1 (1991/05/15) to 1.7 (1991/09/11) ] Initial drafts.
\item[Issue 2.1 (1991/09/11) (\FormatDate{91/09/11}) ] First approved version.

\item[Issue 2.2 (1992/01/20) \FormatDate{92/01/20}) ] Updated to use new fonts.
\item[Issue 2.3 (1992/02/21) \FormatDate{92/02/21}) ] Improved error messages.
\item[Issue 2.4 (1992/02/24) \FormatDate{99/02/11}) ] Update for SML'97.
\item[Issue 2.4 (1992/02/24)] Varstructs now checked in type inferrer.
\item[Issue 2.5 (1992/02/26)] Error message improvements.
\item[Issue 2.6 (1999/02/11)] Update for SML97.
\item[Issue 2.7 (1999/03/07)] Use of new INTEGER type.
\item[Issue 2.9 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 2.10 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 2.11 (2006/12/02)] Added support for floating point literals.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
None.
\pagebreak
\section{GENERAL}
\subsection{Scope}
This document contains the detailed design for the parser for ICL HOL
as required in \cite{DS/FMU/IED/HLD008}.

\subsection{Introduction}

\subsubsection{Purpose and Background}

This document gives the detailed design for the parser for ICL HOL.
Of course, the interface specification is quite simple. The parser is
essentially a complex black box. It is actually to be implemented using
the SLRP parser generator, see \cite{DS/FMU/IED/DTD017} using a grammar
based on that specified in \cite{DS/FMU/IED/DEF001}.

\subsubsection{Dependencies}
The parser is dependent on the lexical analyser, \cite{DS/FMU/IED/DTD015},
and on the symbol table, \cite{DS/FMU/IED/DTD020}.
%\subsubsection{Possible Enhancements}
\subsubsection{Deficiencies}
None known.
\subsection{PREAMBLE}
=DOC
signature ⦏Parser⦎ = sig
=DESCRIBE
This is the signature for the structure containing the parser for ICL HOL.
=ENDDOC
=TEX
\section{DATA TYPES}
The first phase of the parser will return a value of type $TM$ defined
as follows
(in which we remember fixity and bracketing solely for the purposes of error messages).
=DOC
datatype ⦏TY⦎	=	⦏TyAtom⦎ of string
		|	⦏TyCompound⦎ of (TY list) * string * Lex.FIXITY
		|	⦏TyAq⦎ of TYPE;

datatype ('ty) ⦏TM⦎	=	⦏Binder⦎ of string * ('ty)TM * ('ty)TM
		|	⦏Let⦎ of (('ty)TM * ('ty)TM) list * ('ty)TM
		|	⦏Cond⦎ of  ('ty)TM * ('ty)TM * ('ty)TM
		|	⦏App⦎ of ('ty)TM * ('ty)TM * Lex.FIXITY
		|	⦏TmTyped⦎ of ('ty)TM * 'ty
		|	⦏TmAq⦎ of TERM
		|	⦏SetDisplay⦎ of ('ty)TM list
		|	⦏SetComprehension⦎ of ('ty)TM * ('ty)TM
		|	⦏ListDisplay⦎ of ('ty)TM list
		|	⦏Id⦎ of string
		|	⦏CharLit⦎ of string
		|	⦏StringLit⦎ of string
		|	⦏NatLit⦎ of INTEGER
		|	⦏Float⦎ of INTEGER * INTEGER * INTEGER;
=DESCRIBE
These datatypes are used for communication between the parser and the
type checker.
=ENDDOC

The $Lex.FIXITY$ fields help to preserve a little more of the structure
of the input HOL text for purposes of error messages.

=TEX
\section{FORMATTING UTILITIES}
=DOC
	val ⦏format_tm⦎  : ('ty -> string) -> ('ty) TM -> string
	val ⦏format_ty⦎  : TY -> string
=DESCRIBE
These utilities are used to format the datatypes $('ty)TM$ and
$TY$ which are used to communicate between the parser and the
type checker.
=ENDDOC
\section{INTERFACE}
The parser and type inferrer are among the special cases for error
handling and reporting whose possibility is admitted in
the policy for errors in \cite{DS/FMU/IED/DTD002}. Since they
print out a formatted error report, and since it is quite unusual to
want to trap their errors they raise an exception $QuotationError$
rather than calling $fail$ when an error is encountered. This considerably
improves the signal-to-noise ratio in the diagnostics, since for an error
in a small fragment of input, the red tape around the report from $fail$
dominates the diagnostic output.
=DOC
	val ⦏HOL_parser⦎ : Lex.HOL_TOKEN list -> (TY)TM;
=DESCRIBE
This is the context-free parser for HOL. It maps the lists of
tokens output by the lexical analyser onto the datatype used as input
to the type inferrer.

If an error is detected in the parsed input
error message 19001 is printed out.
The insert in message 19001 comprises the tokens up to and including
the one at which the error was detected.
The string `$<?>$' is placed in the insert just before the last token to
highlight it.
Note that in the case of an invalid local definition the `$<?>$' is
printed just after the failing $let$-term, since the check is not made
until the entire $let$-term has been read.
After this first line is printed one of message 19003 or 19004 is printed with
appropriate inserts and
error 19000 is raised.

Messages 19005, 19006 and 19007 indicate
an error in the parser itself.

=FAILURE
19000	Syntax error
19001	Syntax error in: ⌜ ?0
19003	?0 is not expected after ⌜ ?1
19004	?0 is not a valid local definition
19005	Parser error: corrupt parsing stack detected in ?0
19006	Parser error: unexpected return value from slrp'gen_parser
19007	Parser error: ?0
=ENDDOC
=SML
end; (* of signature Parser *)
=TEX
\section{TEST POLICY}
The functions in this document are to be tested according to the
criteria identified in \cite{DS/FMU/IED/PLN008}.

\small
\twocolumn[\section{INDEX}]
\printindex

\end{document}




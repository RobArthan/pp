=IGN
********************************************************************************
dtd503.doc: this file is part of the PPDaz system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  $Header: /home/rda/daz/RCS/dtd503.doc,v 2.60 2008/03/24 14:33:48 rda Exp rda $
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This document has these percent lines dotted throughout to help the author
% with getting the formal text to fit within the page.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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

\def\Title{Detailed Design: Compliance Notation Parser}

\def\AbstractText{This document contains the detailed design for the DAZ parser.}

\def\Reference{ISS/HAT/DAZ/DTD503}

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
\def\Source{\cite{DRA/CIS/CSE3/TR/94/27/3.1}}
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{DAZ PROJECT}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Detailed Design: Compliance Notation Parser}  %% Mandatory field
%% LaTeX2e port: \TPPref{ISS/HAT/DAZ/DTD503}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 2.60 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2008/03/24 14:33:48 $%
%% LaTeX2e port: }}
%% LaTeX2e port: %\TPPstatus{Approved}
%% LaTeX2e port: \TPPstatus{Approved}
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: %\TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{D.J.~King&WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & HAT Member}
%% LaTeX2e port: \TPPabstract{
%% LaTeX2e port: This document contains the detailed design for the
%% LaTeX2e port: DAZ parser.}
%% LaTeX2e port: %\TPPabstractB{}
%% LaTeX2e port: %\TPPabstractC{}
%% LaTeX2e port: %\TPPabstractD{}
%% LaTeX2e port: %\TPPabstractE{}
%% LaTeX2e port: %\TPPabstractF{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	A.~Smith, DRA, Malvern \\
%% LaTeX2e port: 	Library}}
%% LaTeX2e port: 
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
\item[Issue 1.1 (1994/01/28)-1.27 (1994/05/23)] Initial Drafts.
\item[Issue 1.30 (1994/07/28) (28th July 1994)] First draft for review.
\item[Issue 1.31 (1994/10/07) (07th Oct 1994)] Rework done according to desk check report 007.
\item[Issues 1.32 (1994/10/07)-1.39 (1994/10/18)] Added auxiliary variable support.
\item[Issue 1.40 (1994/12/01)] Updated document references.
\item[Issues 1.41 (1994/12/07)] Extended type of $CN\_PARSER\_STATE$ to contain the last label encountered.
\item[Issue 1.42 (1994/12/08)] Added $reset\_cn\_parser\_state$.
\item[Issue 1.43 (1995/03/31)-1.44 (1995/04/04)] Various fixes.
\item[Issue 1.45 (1995/10/02)-1.48 (1995/10/10)] Added annotations and pragmas.
\item[Issue 1.45 (1995/10/02)-1.51 (1995/10/25)] Improved commentary.
\item[Issue 1.52 (1995/10/27)] Changed the Authorisation for issue.
\item[Issue 1.53 (1995/11/29)] Enhancement 3.
\item[Issues 1.54 (1995/12/14),1.55 (1996/07/14)] Enhancement to allow k-slots wherever annotations are allowed (CSM/452).
\item[Issue 2.1 (1996/07/17)] Approved issue for CSM/452
\item[Issue 2.2 (1997/05/02)] CSM/677 WP7 syntax changes (initialisation of variables at declaration; renames clauses in package specifications; unconstrained subtype declarations (which only requires commentary here --- the work being done in the reduction functions))
\item[Issue 2.3 (1997/06/17)] IUCT WP 3 changes.
\item[Issue 2.4 (1997/07/18)] IUCT WP 4 changes.
\item[Issue 2.5 (1997/08/08)] Corrected references to flags.
\item[Issue 2.6 (1997/08/18)] Updated references.
\item[Issue 2.7 (1999/02/10)] 8 Feb 1999 HOL.DB Version
\item[Issues 2.8 (1999/02/15)-2.10 (1999/02/16)] Added code for NJML port.
\item[Issues 2.11 (1999/02/16)-2.13 (1999/02/24)] Added code for light-weight tool.
\item[Issues 2.14 (1999/02/25)] Corrected broken error messages.
\item[Issues 2.15 (1999/04/21)] Made run of SLRP more portable.
\item[Issues 2.16 (1999/04/23)] Tuned for SML-NJ.
\item[Issues 2.17 (2000/06/20)] Fixed {\LaTeX} error.
\item[Issues 2.18 (2000/08/02)] Now uses shell script to drive the parser generator.
\item[Issue 2.19 (2000/10/17)] CTLE II R1/8: empty package specifications.
\item[Issue 2.20 (2000/10/17)-2.22 (2000/10/24)] CTLE II R1/10: multiple with clauses.
\item[Issue 2.23 (2000/10/25)] CTLE II R2/1: global variable unsoundness.
\item[Issues 2.24 (2000/10/26),2.25 (2000/10/26)] CTLE II R1/11: nested packages.
\item[Issue 2.26 (2001/12/15)] R0037: support for named numbers.
\item[Issue 2.27 (2002/01/24)--2.29 (2002/01/28)] R0006: free use of subtype indications and ranges (first cut).
\item[Issue 2.30 (2002/03/01),2.31 (2002/05/02)] Spring 2002 enhancements: syntax changes for interim release.
\item[Issue 2.32 (2002/05/03)] R0047: object renaming
\item[Issue 2.33 (2002/05/08)] Some functions moved elsewhere for better modularity and ease of system build.
\item[Issue 2.34 (2002/05/11)] fixed bug in call of reduction function for use type clauses.
\item[Issue 2.35 (2002/07/24), 2.36 (2002/07/24)] R0079: assertions (added new alternative for {\it specification\_statement}).
\item[Issue 2.37 (2002/07/24)] Fixed changes history.
\item[Issue 2.38 (2002/08/07)] R0051/R0052: default parameters and block statements.
\item[Issue 2.39 (2002/08/08)] Now support renaming of operator symbol with no package name prefix.
\item[Issue 2.40 (2002/08/23)] Removed use of ICL logo font.
\item[Issue 2.41 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 2.42 (2002/10/17), 2.43 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 2.44 (2002/11/10)] Block statements now treated uniformly with other statement forms.
\item[Issue 2.45 (2002/12/10)] Package initialization now optional even when there are using declarations.
\item[Issue 2.46 (2003/05/19)] Support for NOTHING statement form.
\item[Issue 2.47 (2003/07/14), 2.48 (2003/07/16)] Improved error messages for syntax errors generally.
\item[Issue 2.49 (2004/02/07)] The name at the end of a package specification or a proper body is now optional.
\item[Issue 2.50 (2004/02/11)] Packages with empty private parts.
\item[Issue 2.51 (2004/10/09)] Using clauses now allowed anywhere in package body.
\item[Issue 2.52 (2004/12/08)] Now have support for Ada labels and (in informal code) goto statements.
\item[Issue 2.53 (2005/04/22)] Support for derived types.
\item[Issue 2.54 (2005/12/07)] Enhancement 115: support for implicitly declared subprograms.
\item[Issue 2.55 (2006/07/20)] Enhancement 170: use type clauses may now contain expanded names.
\item[Issue 2.56 (2006/09/17)] Added support for deferred subprograms.
\item[Issues 2.57 (2007/05/12), 2.58 (2007/05/18)] Added syntax to allow anonymous Ada blocks and loops to be given names in the Compliance Notation.
\item[Issue 2.59 (2008/03/23), 2.60 (2008/03/24)] Child packages.
\item[Issue 2.61 (2008/05/05)] Modular types.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported daz source documents onto the Lemma 1 document template
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
The discussion in section \ref{CompatibilityFeatures} may be removed or rationalised in the light of comments from DRA on what will be said in the final specifications.
\pagebreak
\section{GENERAL}
\subsection{Scope}
This document contains the detailed design for the Compliance Notation parser.

It includes the Compliance Notation grammar in the format required by the {\tt SLRP} parser generator.

This document reponds to the requirement for a parser identified in \cite{ISS/HAT/DAZ/HLD503}.

\subsection{Introduction}
The DRA document {\Source} gives the grammar for the  Compliance Notation.
This document re-expresses that grammar in the format required by the {\tt SLRP} parser generator.
For easy comparison, cross-references with the SPARK Manual (\cite[part 3]{pvl92}) (and hence with the Ada Language Reference Manual) have been added where appropriate.

\subsubsection{Purpose and Background}

A parser is required to generate an abstract syntax representation of a correct compliance notation literate script and to generate helpful diagnostics for a syntactically incorrect literate script.

The input to the parser are lexical tokens generated by the lexical analyser (see \cite{ISS/HAT/DAZ/DTD501}) and the output of the parser is an parsed web clause of type $WEB\_CLAUSE$, defined in \cite{ISS/HAT/DAZ/DTD502}.

The abstract syntax which the parser can produce is in fact a subset of the possible abstract syntax which could be represented by a $WEB\_CLAUSE$. This is due to the fact that to distinguish one syntactic category from another requires contextual information which is not available at the time of parsing. The adjustment to the syntax is carried out by the functions $adjust\_exp$ (see \cite{ISS/HAT/DAZ/IMP508}) and $adjust\_statement$ (see \cite{ISS/HAT/DAZ/IMP505}).

This detailed design contains the grammatical rules for compliance notation. There are differences between what is specified here and that specified by DRA. The differences and some justification are documented in the section \ref{COMPLIANCE} of this document.

The implementation of the parser is provided in \cite{ISS/HAT/DAZ/IMP503}\  which when compiled invokes the parser generator to build parsing tables from the grammar provided in this document. \cite{ISS/HAT/DAZ/IMP503}\  contains the reduction functions which determine the abstract syntax produced when each grammatical rule is fired.

\subsubsection{Dependencies}
The signature for the Compliance Notation Parser is called $CNParser$ and it depends on the structure $CNTypes$ whose signature is defined in \cite{ISS/HAT/DAZ/DTD502}.


%\subsubsection{Possible Enhancements}
\subsubsection{Deficiencies}
None known.

\section{COMPLIANCE}\label{COMPLIANCE}
This section describes the changes made to the grammar defined in {\Source}. The changes have been are grouped as follows:
\begin{description}
\item[Changes to Remove Ambiguity]{The grammar implemented here accepts a wider language. To make the language accepted the same as that in {\Source}  it is necessary to make various checks in the reduction functions.}
\item[Changes to Increase Efficiency.]{In this case the language accepted by this grammar is the same as that specified in {\Source}.}
\item[Minor Changes]{Typically comprising small localised changes to the grammar.}
\end{description}

\subsection{Changes to Remove Ambiguity}
\subsubsection{Ranges}\label{Ranges}

In the grammar in {\Source} there is a conflict which arises between expressions and ranges. In order to remove the conflict an new production has been introduced called $sr\_expression$ which can be either a simple expression or a two simple expressions separated by two dots (which is just like a range). A check needs to be made in the reduction functions for the cases where ranges are not permitted and a syntax error raised.

The changes are listed in table \ref{CPR}.

\begin{table}
\center
\begin{tabular}{||l|p{3.0in}|l||}\hline
Id &  Affected Production & Action\\\hline\hline
RA/1 & range & Deleted \\\hline
RA/2 & sr expression & New \\\hline
RA/3 & relation & Changed \\\hline
RA/4 & loop parameter specification & Changed \\\hline
RA/5 & range constraint & Changed \\\hline
RA/6 & discrete range & Changed \\\hline
RA/7 & component clause & Changed \\\hline
\end{tabular}
\caption{Changed Productions for Ranges}
\label{CPR}
\end{table}

\subsubsection{Aggregates}\label{Aggregates}

The ``others'' part of an aggregate in the grammar of {\Source} is disambiguated in {\Source} by introducing a token called $commaothers$. This solution is inappropriate for the approach taken in DAZ.

The grammar for aggregates is disambiguated by pushing the others clause down into the productions for named association and positional association. This makes the grammar slightly wider than that in {\Source} because it allows the others part to appear anywhere in an aggregate choice. The parser therefore needs to check for this case and raise an syntax error if it occurs.

For the positional association, this is not a problem, but in order to make the grammar work properly, the production for an expression list has been adjusted to be left-associative.

The changes are listed in table \ref{CPA}.

For compatibility with the SPARK syntax, an aggregate is permitted as a form of primary, although such a primary can only be handled formally under special circumstances.
Because of the treatment of aggregates and function calls (see section \ref{FunctionCalls}), it is convenient to treat a bracketed expression as a special case of an aggregate.
The reduction functions detect the special case when the aggregate is just a single expression in brackets and take the appropriate action.


\begin{table}
\center
\begin{tabular}{||l|p{3.0in}|l||}\hline
Id &  Affected Production & Action\\\hline\hline
AG/1 & aggregate & Changed \\\hline
AG/2 & component association & Changed \\\hline
AG/3 & aggregate choice list & Changed \\\hline
AG/4 & positional association & Changed \\\hline
AG/5 & parameter association & Changed \\\hline
AG/6 & named parameter association & Deleted \\\hline
AG/7 & formal parameter & Deleted \\\hline
AG/8 & primary & Changed \\\hline
\end{tabular}
\caption{Changed Productions for Aggregates}
\label{CPA}
\end{table}

\subsubsection{Names}\label{Names}

The production for ``name'' is that specified in the SPARK Manual. The production specified in {\Source} has not been used since it is based on that in the SPARK Manual but changed to work with the SID parser generator.

The changes are listed in table \ref{CPN}.
\begin{table}
\center
\begin{tabular}{||l|p{3.0in}|l||}\hline
Id &  Affected Production & Action\\\hline\hline
NA/1 & name & Changed \\\hline
NA/2 & indexed component & New \\\hline
NA/3 & selected component & Changed \\\hline
NA/4 & select & Deleted \\\hline
\end{tabular}
\caption{Changed Productions for Names}
\label{CPN}
\end{table}

\subsubsection{Constraints}\label{Constraints}

The constraint production in {\Source} gives an ambiguity with SLRP.  To overcome this, the following has been done:
\begin{itemize}
\item The alternative allowing an index constraint as a constraint has been removed.
(Constraint only appears in a subtype indication.)

\item Subtype indication has been changed to comprise a name followed by an optional constraint.

\item If the optional constraint is not supplied and the name comprises an indexed component, then the constituent indexed component is used by the reduction functions to derive the required index constraint.
(This needs no contextual information).

\item An unconstrained subtype indication is parsed as a subtype indication with no optional constraint and a plain identifier for the name.

\end{itemize}


The changes are listed in table \ref{CPC}.

\begin{table}
\center
\begin{tabular}{||l|p{3.0in}|l||}\hline
Id &  Affected Production & Action\\\hline\hline
IC/1 & subtype indication & Changed \\\hline
IC/2 & constraint & Changed \\\hline
\end{tabular}
\caption{Changed Productions for Constraints}
\label{CPC}
\end{table}

\subsubsection{Function and Procedure Calls}\label{FunctionCalls}

Function and procedure calls look identical to indexed components and so our grammar is changed in this area to remove what would otherwise have been ambiguous. A check needs to be made later to determine whether an indexed component should be transformed into a function or procedure call.

The changes are listed in table \ref{CPFC}.

\begin{table}
\center
\begin{tabular}{||l|p{3.0in}|l||}\hline
Id &  Affected Production & Action\\\hline\hline
FC/1 & function call & Deleted \\\hline
FC/2 & prefix & Deleted \\\hline
FC/3 & primary (function call branch) & Deleted \\\hline
FC/4 & type conversion & Deleted \\\hline
FC/5 & procedure call statement & Changed \\\hline
\end{tabular}
\caption{Changed Productions for Function Calls}
\label{CPFC}
\end{table}
\subsubsection{Subtype Indications and Ranges}\label{SubtypeIndications}

The grammar was enhanced beyond the SPARK Examiner syntax
to allow free use of subtype indications
and ranges, e.g., in index constraints, in January 2002.
To achieve this without introducing conflicts, involves using
the syntactic category for subtype indications to carry the meaning
of a discrete range (otherwise the production for index constraint
clashes with many other places in the grammar involving comma-separated
lists of expressions in brackets).
To achieve this, the name in a subtype indication is generalised to expression
(which include ranges, see section ~\ref{Ranges} above).
The reduction functions for productions containing subtype indications
coerce the expression to a name where the syntax requires it.

Note that as a result of this enhancement, the syntax for loop
parameter specification becomes identical with the syntax of ALRM.
As in ALRM subtype indications are used in place of the previous type marks
in constant, variable and component declarations. To avoid a conflict, a
subtype indication is also used in a deferred constant declaration,
although ALRM requires a type mark there.

The changes to avoid the conflicts are listed in table \ref{CPSI}.


\begin{table}
\center
\begin{tabular}{||l|p{3.0in}|l||}\hline
Id &  Affected Production & Action\\\hline\hline
SI/1 & subtype indication & Changed \\\hline
SI/2 & discrete range list & Changed \\\hline
SI/3 & deferred constant declaration  & Changed \\\hline
SI/4 & ranged expression & New \\\hline
\end{tabular}
\caption{Changed Productions for Function Calls}
\label{CPSI}
\end{table}

\subsection{Changes to Increase Efficiency}\label{Elision}

In ALRM there are several productions of the form:

=GFT SPARK Manual section 3.2:
identifier_list ::= identifier {, identifier}
=TEX

For this kind of grammatical rule, {\Source} has systematically introduced a new production which specifically handles the option, as shown in the following example.
=GFT BNF Example

identifier_list =	`LCIdentifier`, id_list;

id_list	=
		|	`LCComma`, identifier_list;
=TEX
It is equally possible to elide the new production and accept the same grammar by writing:
=GFT BNF Example

identifier_list =	`LCIdentifier`
		|	`LCIdentifier`, `LCComma`, identifier_list;
=TEX

In the implemented grammar, the latter form has been used where possible since a) it is more efficient and b) it is LR(1).

The productions elided in this way are listed in table \ref{ElidedProductions}.
In the case of $multoptail$, the production used here also reflects the fact that Ada multiplying operators associate left to right, which is not evident from the grammar --- the other cases where the grammar suggests the wrong associativity are resolved in the reduction functions.
\begin{table}
\center
\begin{tabular}{||l|l|l||}\hline
Id & Elided Production	& Affected Productions\\\hline\hline
EP/1 & id list & identifier list \\\hline
EP/2 & dp1 & web clause, declarative part \\\hline
EP/3 & exp list & expression list\\\hline
EP/4 & rel2 & relation\\\hline
EP/5 & reltail & expression\\\hline
EP/6 & ass list & named association\\\hline
EP/7 & ag list & aggregate choice list\\\hline
EP/8 & multoptail & term\\\hline
EP/9 & statement list & sequence of statements\\\hline
EP/10 & subtype list & index subtype definition list\\\hline
EP/11 & designator & function specification, subprogram implementation\\\hline
\end{tabular}
\caption{Elided Productions}
\label{ElidedProductions}
\end{table}

\subsection{Minor Changes}
\subsubsection{Simple Names}
Simple names are lexically equivalent to identifiers, and where there are occurrences of simple name in {\Source}, identifier has been used here. The productions affected are listed in table \ref{RemovalofSimpleName}.
\begin{table}
\center
\begin{tabular}{||l|p{3.0in}|l||}\hline
Id &  Affected Productions\\\hline\hline
SN/1 & simple name \\\hline
SN/2 & selector \\\hline
SN/3 & name opt1 \\\hline
SN/4 & name opt2 \\\hline
SN/5 & package body \\\hline
SN/6 & renaming declaration \\\hline
SN/7 & enumeration representation clause \\\hline
SN/8 & address clause \\\hline
SN/10 & with clause \\\hline
SN/11 & body stub \\\hline
SN/12 & record representation clause \\\hline
\end{tabular}
\caption{Removal of Simple Name}
\label{RemovalofSimpleName}
\end{table}
\subsubsection{Type Mark}
Type marks are terminals in {\Source}. They are lexically indistinguishable from names. The grammar has been adjusted throughout to use names where type marks are to be found in {\Source}. The productions affected are listed in table \ref{RemovalofTypeMark}.
\begin{table}
\center
\begin{tabular}{||l|p{3.0in}|l||}\hline
Id &  Affected Production & Action\\\hline\hline
TM/1 & constant declaration & Changed \\\hline
TM/2 & variable declaration & Changed \\\hline
TM/3 & subtype indication & Changed \\\hline
TM/4 & unconstrained array definition & Changed \\\hline
TM/5 & constrained array definition & Changed \\\hline
TM/6 & index subtype definition & Changed\\\hline
TM/7 & index constraint & Changed \\\hline
TM/8 & type mark list & Deleted \\\hline
TM/9 & type list & Deleted \\\hline
TM/10 & name list & New \\\hline
TM/11 & component declaration & Changed \\\hline
TM/13 & qualified expression & Changed \\\hline
TM/14 & loop parameter specification & Changed \\\hline
TM/15 & function specification & Changed \\\hline
TM/16 & parameter specification & Changed \\\hline
TM/17 & deferred constant declaration & Changed \\\hline
TM/18 & renaming declaration & Changed \\\hline
\end{tabular}
\caption{Removal of Type Mark}
\label{RemovalofTypeMark}
\end{table}

\subsubsection{K-Slots, Specification Statements and Labels}\label{KSSL}
A Production for labels for specification statements and K-Slots has been added. A classifier function is provided to recognise a `Ord'...`NumericLiteral'...`Crd'... sequence at the beginning of a web clause and turn it into a label terminal (e.g., `LCSpecLabel`, `LCDecLabel`) depending on environment information. This means that the grammar does not have to be changed from {\Source}.

However, labels which can appear optionally after a specification statement or a k-slot appear in the grammar as `Ord`...`NumericLiteral`...`Crd` since the embedding of the labels in the grammar (and their equivalence to a primary) makes it impossible to classify them as either a `DecLabel` or a `StmtLabel` prior to parsing the input. A new production is provided for labels.

The grammar for specification statements is simple if the Z which it can contain is expressed as a terminal symbol. There are new productions for specification statements,
procedure specification statements and function specification statements (all of which
are treated as tokens in {\Source}).

The pbody\_kslot alternative of {\Source} causes an ambiguity with other forms
of k-slot once the syntax of k-slots is spelt out in the grammar.
This kind of k-slot is treated in the grammar here in the same way as any
other k-slot, leaving it to the Z Generator to resolve the difference.

K-Slots have an optional label which is semantically important. Therefore the body of the k-slot (including the chevrons) appear in the grammar as a terminal, a new production for a k-slot is provided which allows an optional label to be appended. The changes are listed in table \ref{NPKSLSS}.
\begin{table}
\center
\begin{tabular}{||l|p{3.0in}|l||}\hline
Id &  Affected Production & Action\\\hline\hline
KS/1 & k slot & New \\\hline
LA/1 & label & New \\\hline
SS/1 & specification statement & New \\\hline
FS/1 & function specification statement & New \\\hline
PS/1 & procedure specification statement & New \\\hline
PB/1 & package body k slot & New \\\hline
\end{tabular}

(Here  ``label'' refers to a Compliance Notation label on a k-slot or specification statements.
Where necessary, we use the term ``Ada label'' to talk about labels in Ada (i.e., the targets of goto statements).

\caption{New Productions for K-Slots Labels and Specification Statements}
\label{NPKSLSS}
\end{table}

\subsubsection{Primed Identifiers}\label{PrimedIdentifiers}
Attribute designators may be reserved words (e.g., P'RANGE) in Ada. In order to avoid the problem of having to accept either a `Range` token for example, and an `Identifier`, it is more convenient to arrange for the lexical analyser to regard a Prime followed by an alpha-numeric literal as a separate kind of token. Thus P'RANGE is tokenised as [`Identifier`, `LCPrimedIdentifier`] rather than the more problematic [`Identifier`,`Prime`,`Range`]. The production affected is shown in table \ref{CPPI}.

\begin{table}
\center
\begin{tabular}{||l|p{3.0in}|l||}\hline
Id &  Affected Production & Action\\\hline\hline
AT/1 & attribute & Changed \\\hline
AT/2 & attribute designator & Deleted \\\hline
AT/3 & namexp list & Deleted \\\hline
AT/4 & namexp & Deleted \\\hline
AT/5 & primary & Changed \\\hline
\end{tabular}
\caption{Changed Productions for Primed Identifiers}
\label{CPPI}
\end{table}

\subsubsection{Case Statements}\label{CaseStatements}
The token $whenothers$ of {\Source} has been replaced with two tokens, $when$ and $others$. In order for the grammar to work (without having to look two tokens ahead), the production for case statement alternative list has been changed to be left-associative. The changes are listed in table \ref{CPCS}.

\begin{table}
\center
\begin{tabular}{||l|p{3.0in}|l||}\hline
Id &  Affected Production & Action\\\hline\hline
CS/1 & case statement alternative list & Changed \\\hline
CS/2 & others part & Changed \\\hline
\end{tabular}
\caption{Changed Productions for Case Statements}
\label{CPCS}
\end{table}

\subsubsection{Auxiliary Expressions}\label{Auxiliary Expressions}
Auxiliary expressions appear in {\Source} as a terminal symbol. An auxiliary expression comprises some Z enclosed in Strachey brackets. A new production is provided to reflect this. The till clause is changed to accept an auxiliary expression rather than the terminal z\_decl.

$basic\_declaration$ is used in the production for $basic\_dec\_list$. This effectively widens the grammar by allowing deferred constant declarations as part of a $basic\_dec\_list$, and the parser needs to later reject this happening during the reduction functions for example.

$declarative\_part\_1$ is specified in terms of $dec$ rather than $dec\_1$ of {\Source}. This allows k-slots to appear in a $declarative\_part\_1$, which need to be rejected in the reduction functions. For simpliciy
we just have one production for declarative parts and make the check at the point of use.

The change is listed in table \ref{NCPAE}.
\begin{table}
\center
\begin{tabular}{||l|p{3.0in}|l||}\hline
Id &  Affected Production & Action\\\hline\hline
AE/1 & auxiliary expression & New \\\hline
AE/2 & till opt & Changed \\\hline
AE/3 & primary & Changed \\\hline
AE/4 & basic dec list & Changed \\\hline
AE/5 & declarative part 1 &  Deleted \\\hline
AE/6 & dec 1 & Deleted \\\hline
AE/7 & basic dec & Deleted \\\hline
\end{tabular}
\caption{New/Changed Productions for Auxiliary Expressions}
\label{NCPAE}
\end{table}

\subsubsection{Declarations}

A declaration need not always be present. This is an amendment to {\Source} which is documented in \cite{ISS/HAT/DAZ/MIN002}.

\subsubsection{Z and Web Clauses}

Z paragraphs are supported by {\Product} and a production branch in
the $web\_clause$ is not required.


\subsubsection{Loop Statements}

To avoid an apparent difficulty with the parser generator, a new production $loop\_body$ has been introduced for the inner part of a loop statement. See table \ref{NCPLS}

\subsubsection{Pragma Argument Associations}\label{PragmaArgAss}

To avoid a difficulty with the parser generator, the grammar for an argument association in a pragma has been widened to allow an aggregate choice rather than just a name to the left of the \verb"=>"; the restriction can be implemented in the reduction functions. See table \ref{CPAA}

\subsubsection{Renaming Declaration}

Specification statements are not permitted in a procedure or function specifications within a renaming declaration.
This is expressed in the grammar in \cite{DRA/CIS/CSE3/TR/94/27/3.0}.
Here we reuse the productions for procedure and function specifications and implement the restriction by a check in the reduction functions.
See table \ref{CPRD}


\subsubsection{Web Clauses}
Z paragraphs as web clauses are supported directly by the underlying {\Product} system
and so do not need to be included in the grammar here.

The special form of replacement web clause for nested package bodies is treated
as a compilation unit replacement and so the production is not needed.

See table \ref{CPWC}
\begin{table}
\center
\begin{tabular}{||l|p{3.0in}|l||}\hline
Id &  Affected Production & Action\\\hline\hline
WC/1 & web clause/z & Deleted \\\hline
WC/2 & web clause/nested package body & Deleted \\\hline
\end{tabular}
\caption{Changed Productions for Web Clauses}
\label{CPWC}
\end{table}


\begin{table}
\center
\begin{tabular}{||l|p{3.0in}|l||}\hline
Id &  Affected Production & Action\\\hline\hline
LS/1 & loop statement & Changed \\\hline
LS/2 & loop body & New \\\hline
\end{tabular}
\caption{New/Changed Productions for Loop Statements}
\label{NCPLS}
\end{table}

\begin{table}
\center
\begin{tabular}{||l|p{3.0in}|l||}\hline
Id &  Affected Production & Action\\\hline\hline
AA/1 & argument association & Changed \\\hline
\end{tabular}
\caption{Changed Productions for Argument Association}
\label{CPAA}
\end{table}

\begin{table}
\center
\begin{tabular}{||l|p{3.0in}|l||}\hline
Id &  Affected Production & Action\\\hline\hline
RD/1 & renaming declaration & Changed \\\hline
\end{tabular}
\caption{Changed Productions for Renaming Declaration}
\label{CPRD}
\end{table}

\section{SPARK and Ada Compatibility Features}\label{CompatibilityFeatures}
These features were added to the grammar as part of the work on enhancements to the original prototype tool.
The features are specified in \cite{DRA/CIS/CSE3/TR/94/27/3.0}.
The discussion here is intended to amplify and motivate the description given in the specifications.

They serve {\em(a)} to make it feasible to process the Ada programs output by the tool with the SPARK Examiner, and {\em(b)} to make it possible to include arbitrary Ada code fragments in the Ada program (e.g., assembly language code insertions).

Part {\em(a)} is achieved by allowing pragmas and SPARK annotations in the syntax as discussed in sections \ref{Pragmas} and \ref{Annotations} below.
Part {\em(b)} is achieved by the arbitrary replacements feature described in section \ref{ArbitraryReplacements}.

\subsection{Pragmas}\label{Pragmas}

Pragmas are treated as described in the syntax given in \cite{DRA/CIS/CSE3/TR/94/27/3.0} (with the slight adjustment documented in section \ref{PragmaArgAss} above).
The SPARK rules for pragmas as given in  \cite{pvl92}, are as follows:

\begin{quotation}
Pragmas are only allowed at the following places in a SPARK program:

\begin{enumerate}
\item at any place where a declaration or a statement would be allowed;
\item where a body would be allowed in a declarative part;
\item between a context clause and its following library unit or secondary unit;
\item at any place where a compilation unit would be allowed.
\end{enumerate}
\end{quotation}

We take ``declaration'' in item 1 here to mean basic declaration.
This also allows pragmas to appear in the Compliance Notation's ``using'' construct.
Since we follow \cite{DRA/CIS/CSE3/TR/94/27/3.0} in using a grammar for declarative parts which does not insist that all the basic declarations must come before any bodies, items 1 and 2 are covered by including pragma as an alternative for a basic declaration or for a statement.

Note the SPARK grammar in \cite{pvl92} also gives a specific rule for the INTERFACE pragma, immediately after a procedure or function specification acting as a body stub.
Unfortunately, implementing this as written in \cite{pvl92} would require a significant adjustment to the grammar to avoid conflicts.
Instead, we follow full Ada in permitting a subprogram declaration to appear in a declarative part (although we follow SPARK in giving the grammar rules in the production for body stub).

In Ada, a subprogram declaration in a declarative part is typically either a forward declaration of a subprogram to be defined by mutual recursion or it defines an interface to a non-Ada routine (using the INTERFACE pragma).
The SID functions in \cite{DRA/CIS/CSE3/TR/94/27/3.0} give appropriate semantics for such a construct (essentially, they are processed just like a subprogram stub but without generating the Z required to process the corresponding subunit --- since there cannot be one).
The upshot is that the Compliance Notation will support the general Ada syntax for accessing non-Ada routines.
Since, as will be seen in section \ref{Annotations} below, the syntax will allow an annotation to follow the subprogram declaration, the SPARK syntax is a special case of the syntax defined by the grammar here.

Item 3 is handled by allowing a possibly empty list of pragmas
after a with-clause and item 4 is handled by allowing a pragma to appear as a form of compilation unit.

Pragmas themselves have the syntax defined in \cite{DRA/CIS/CSE3/TR/94/27/3.0}, widened to avoid an SLRP conflict. Since the pragmas are essentially just data to be passed out into the SPARK program, this is harmless.

\subsection{Annotations}\label{Annotations}

Annotations are required (see \cite{ISS/HAT/DAZ/PLN007}) but are described informally in the specification (\cite{DRA/CIS/CSE3/TR/94/27/3.0}).
It has been agreed that the hidden part facility will not be implemented in the Compliance Tool (users who need it can use the arbitrary Ada replacement feature instead).
The hide directive is treated just like any other annotation; however, its use instead of a body or a package initialisation requires annotations to be allowed where statements or declarations may appear.
This causes a clash with the inherit clause at the beginning of a package specification.
To resolve this, we make room for the inherit clause annotation at the point of use of the production for package declarations.
There is also a conflict between body stubs and procedure/function specification (with the interface pragma), to resolve this we allow an annotation after any procedure or function specification.
The annotation allowed at the end of a subprogram declaration also causes a conflict; this is resolved simply by considering the annotation to constitute the next declaration in the list containing the subprogram declaration.
To avoid an SLR(1) parsing problem, we allow an annotation in a body stub for a package in the same position as in a proper body, and require the reduction functions to detect this error (since there is no point in having abstract syntax for such a construct).

The positions occupied by the various kinds of annotations as given in  \cite{pvl92} subject to the above remarks are described in table \ref{SPA}.
In the table, the ``Ids'' identify the changed productions; these may
be compared with the indicated sections of \cite{pvl92} to check that the grammar provided here is liberal enough to allow the relevant annotations.

Wherever an annotation is permitted, one may also use a k-slot to defer giving the text of the annotation.
For annotations standing as declarations or statements, this comes for free from the standard k-slot mechanism for these constructs.
The other positions in which annotations are allowed is handled by a production for annotation list, which allows a sequence of k-slots or annotations.

The SPARK Examiner supports some annotations (such as assertions and proof functions) which are not given in the syntax of \cite{pvl92}.
These are supported by the tool since they appear as declarations or statements.

\begin{table}
\center
\begin{tabular}{||l|l|l|l|p{3.0in}||}\hline
Id & Annotation & SPARK Manual & Productions \\\hline\hline
ANN/1 & Procedure annotation & 6.1 & basic declaration\\\hline
ANN/2 & Procedure annotation & 6.3 & procedure specification\\\hline
ANN/2 & Procedure annotation & 10.2 & procedure specification\\\hline
ANN/1 & Function annotation & 6.1 & basic declaration\\\hline
ANN/3 & Function annotation & 6.3 & function specification\\\hline
ANN/3 & Function annotation & 10.2 & function specification\\\hline
ANN/4,1 & Inherit clause & 7.1 & compilation unit, basic declaration\\\hline
ANN/4 & Inherit clause & 10.1 & compilation unit\\\hline
ANN/5 & Package annotation & 7.1 & package specification\\\hline
ANN/6 & Refinement definition & 7.1 & package body \\\hline
ANN/4 & Main program annotation & 10.1 & compilation unit \\\hline
ANN/1 & Hide directive & 6.3 & basic declaration\\\hline
ANN/7 & Hide directive & 7.1 & statement\\\hline
\end{tabular}
\caption{Syntactic Positions for Annotations}
\label{SPA}
\end{table}

\subsection{Arbitrary Replacements}\label{ArbitraryReplacements}
This facility is provided by adding to the production for web clauses alternatives allowing a labelled or unlabelled block of text introduced by the arbitrary replacement symbol to serve as a web clause.
\newpage
\section{GRAMMAR}
Section \ref{GENERATINGTABLES} invokes the parser generator. The following subsections contain the grammar which is dumped to a file and serves as input to the parser generator.
\subsection{Web Clause}
The entry point to the grammar (sentence symbol) is placed first, because that is where {\tt SLRP} expects to find it.

=DUMP dtd503.grm.txt

(* WC/1 *)
(* WC/2 *)
(* EP/2 *)
⦏web_clause⦎ =		compilation
					(red_web_clause1 x1)
		|	`LCCompLabel`, `LCReplacedBy`, compilation
					(red_web_clause2 x1 x2 x3)
		|	`LCPPartLabel`, `LCReplacedBy`, private_part
					(red_web_clause3 x1 x2 x3)
		|	`LCVPartLabel`, `LCReplacedBy`, visible_part
					(red_web_clause4 x1 x2 x3)
		|	`LCDecLabel`, `LCReplacedBy`, declarative_part
					(red_web_clause5 x1 x2 x3)
		|	`LCStmtLabel`, `LCImplementedBy`, sequence_of_statements
					(red_web_clause6 x1 x2 x3)
		|	`LCSpecLabel`, `LCRefinedBy`, sequence_of_statements
					(red_web_clause7 x1 x2 x3)
		|	`LCRefinedBy`, sequence_of_statements
					(red_web_clause8 x1 x2)
		|	`LCSpecLabel`, `LCImplementedBy`, sequence_of_statements
					(red_web_clause9 x1 x2 x3)
		|	`LCImplementedBy`, sequence_of_statements
					(red_web_clause10 x1 x2)
		|	any_label, `LCArbitraryAda`
					(red_web_clause11 x1 x2)
		|	`LCArbitraryAda`
					(red_web_clause12 x1)
		|	`LCAnnotationLabel`, `LCReplacedBy`, annotation_list
					(red_web_clause13 x1 x2 x3)
		|	`LCUndeclaredLabel`, `LCReplacedBy`, package_body
					(red_web_clause14 x1 x2 x3);
=TEX
=DUMPMORE dtd503.grm.txt
⦏any_label⦎ =		`LCCompLabel`		(red_any_label x1)
		|	`LCPPartLabel`		(red_any_label x1)
		|	`LCVPartLabel`		(red_any_label x1)
		|	`LCDecLabel`		(red_any_label x1)
		|	`LCStmtLabel`		(red_any_label x1)
		|	`LCSpecLabel`		(red_any_label x1)
		|	`LCAnnotationLabel`	(red_any_label x1);
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection{Declarations and Types}

SPARK Manual section 3.1:
=DUMPMORE dtd503.grm.txt

⦏basic_declaration⦎ =		object_declaration
					(red_basic_declaration1 x1)
			|	type_declaration
					(red_basic_declaration2 x1)
			|	subtype_declaration
					(red_basic_declaration3 x1)
			|	deferred_constant_declaration
					(red_basic_declaration4 x1)
			|	pragma (red_basic_declaration5 x1)
(* ANN/1 *)
			|	`LCAnnotation`  (red_basic_declaration6 x1);
=TEX

SPARK Manual section 3.2:
=DUMPMORE dtd503.grm.txt

⦏object_declaration⦎ =	constant_declaration
					(red_object_declaration1 x1)
			|	variable_declaration
					(red_object_declaration2 x1);
=TEX
The production id list of {\Source} has been elided (see section \ref{Elision}).

SPARK Manual section 3.2:
=DUMPMORE dtd503.grm.txt
(* TM/1 *)
⦏constant_declaration⦎ =	identifier_list, `LCColon`, `LCConstant`, subtype_indication,
					`LCBecomes`, expression, `LCSemi`
					(red_constant_declaration1 x1 x2 x3 x4 x5 x6 x7)
		|	identifier_list, `LCColon`, `LCConstant`,
					`LCBecomes`, expression, `LCSemi`
					(red_constant_declaration2 x1 x2 x3 x4 x5 x6);
(* TM/2 *)
⦏variable_declaration⦎ =	identifier_list, `LCColon`, subtype_indication, `LCSemi`
					(red_variable_declaration x1 x2 x3 x4)
		|		identifier_list, `LCColon`, subtype_indication,
				`LCBecomes`, expression, `LCSemi`
					(red_variable_declaration2 x1 x2 x3 x4 x5 x6);

(* EP/1 *)
⦏identifier_list⦎ =	`LCIdentifier`
					(red_identifier_list1 x1)
		|	`LCIdentifier`, `LCComma`, identifier_list
					(red_identifier_list2 x1 x2 x3);
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SPARK Manual section 3.3.1:
=DUMPMORE dtd503.grm.txt

⦏type_declaration⦎ =	full_type_declaration
					(red_type_declaration1 x1)
		|	private_type_declaration
					(red_type_declaration2 x1);

⦏full_type_declaration⦎ =	`LCType`, `LCIdentifier`, `LCIs`, type_definition, `LCSemi`
					(red_full_type_declaration1 x1 x2 x3 x4 x5)
		|	`LCType`, `LCIdentifier`, formal_part, `LCIs`, type_definition, `LCSemi`
					(red_full_type_declaration2 x1 x2 x3 x4 x5 x6);

⦏type_definition⦎ =	enumeration_type_definition
					(red_type_definition1 x1)
		|	integer_type_definition
					(red_type_definition2 x1)
		|	real_type_definition
					(red_type_definition3 x1)
		|	array_type_definition
					(red_type_definition4 x1)
		|	record_type_definition
					(red_type_definition5 x1)
		|	derived_type_definition
					(red_type_definition6 x1);
=TEX
SPARK Manual section 3.3.2:
=DUMPMORE dtd503.grm.txt
⦏subtype_declaration⦎ =	`LCSubtype`, `LCIdentifier`, `LCIs`,
					subtype_indication, `LCSemi`
					(red_subtype_declaration x1 x2 x3 x4 x5);

(* IC/1 *)
(* TM/3 *)
⦏subtype_indication⦎ =	expression, constraint
					(red_subtype_indication1 x1 x2)
		|	expression
					(red_subtype_indication2 x1);
=TEX
SPARK Manual section 3.3.2:
=DUMPMORE dtd503.grm.txt
(* IC/2 *)
⦏constraint⦎	=	range_constraint
					(red_constraint1 x1)
		|	floating_point_constraint
					(red_constraint2 x1)
		|	fixed_point_constraint
					(red_constraint3 x1);
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

=TEX
SPARK Manual section 3.4:
=DUMPMORE dtd503.grm.txt
⦏derived_type_definition⦎
		=	`LCNew`, subtype_indication
					(red_derived_type_definition x1 x2);
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

SPARK Manual section 3.5:
=DUMPMORE dtd503.grm.txt
(* RA/5 *)
⦏range_constraint⦎ =	`LCRRange`, sr_expression
					(red_range_constraint x1 x2);
=TEX

SPARK Manual section 3.5.1:
=DUMPMORE dtd503.grm.txt

⦏enumeration_type_definition⦎ =	`LCLBracket`, identifier_list, `LCRBracket`
					(red_enumeration_type_definition x1 x2 x3);

=TEX

SPARK Manual section 3.5.4:
=DUMPMORE dtd503.grm.txt

⦏integer_type_definition⦎ =	range_constraint
					(red_integer_type_definition1 x1)
			|	modulus
					(red_integer_type_definition2 x1);

⦏modulus⦎ =		`LCMod`, expression
					(red_modulus x1 x2);

=TEX

SPARK Manual section 3.5.6:
=DUMPMORE dtd503.grm.txt

⦏real_type_definition⦎ =	floating_point_constraint
					(red_real_type_definition1 x1)
			|	fixed_point_constraint
					(red_real_type_definition2 x1);
=TEX
SPARK Manual section 3.5.7:
=DUMPMORE dtd503.grm.txt

⦏floating_point_constraint⦎ =	floating_accuracy_definition
					(red_floating_point_constraint1 x1)
				|	floating_accuracy_definition, range_constraint
					(red_floating_point_constraint2 x1 x2);

⦏floating_accuracy_definition⦎ =	`LCDigits`, simple_expression
					(red_floating_accuracy_definition x1 x2);
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SPARK Manual section 3.5.9:
=DUMPMORE dtd503.grm.txt

⦏fixed_point_constraint⦎ =	fixed_accuracy_definition
					(red_fixed_point_constraint1 x1)
			|	fixed_accuracy_definition, range_constraint
					(red_fixed_point_constraint2 x1 x2);

⦏fixed_accuracy_definition⦎ =	`LCDelta`, simple_expression
					(red_fixed_accuracy_definition x1 x2);
=TEX
SPARK Manual section 3.6:
=DUMPMORE dtd503.grm.txt

⦏array_type_definition⦎ =	unconstrained_array_definition
					(red_array_type_definition1 x1)
			|	constrained_array_definition
					(red_array_type_definition2 x1);

(* TM/4 *)
⦏unconstrained_array_definition⦎ =
			`LCArray`, `LCLBracket`, index_subtype_definition_list,
				`LCRBracket`, `LCOf`, subtype_indication
					(red_unconstrained_array_definition x1 x2 x3 x4 x5 x6);

(* TM/5 *)
⦏constrained_array_definition⦎ =
			`LCArray`, index_constraint, `LCOf`, subtype_indication
					(red_constrained_array_definition x1 x2 x3 x4);

(* EP/10 *)
⦏index_subtype_definition_list⦎ =
			index_subtype_definition
					(red_index_subtype_definition_list1 x1)
		|	index_subtype_definition, `LCComma`, index_subtype_definition_list
					(red_index_subtype_definition_list2 x1 x2 x3);

(* TM/6 *)
⦏index_subtype_definition⦎ =	expression, `LCRRange`, `LCLessGreat`
					(red_index_subtype_definition x1 x2 x3);

(* TM/7 *)
⦏index_constraint⦎ =	`LCLBracket`, discrete_range_list, `LCRBracket`
					(red_index_constraint x1 x2 x3);

(* TM/10 *)
⦏discrete_range_list⦎ =		subtype_indication
					(red_discrete_range_list1 x1)
		|	subtype_indication, `LCComma`, discrete_range_list
					(red_discrete_range_list2 x1 x2 x3);

(* RA/6 *)
⦏discrete_range⦎ =	expression, range_constraint
					(red_discrete_range1 x1 x2)
		|	expression
					(red_discrete_range2 x1);
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SPARK Manual section 3.7:
=DUMPMORE dtd503.grm.txt

⦏record_type_definition⦎ =	`LCRecord`, component_list, `LCEnd`, `LCRecord`
					(red_record_type_definition x1 x2 x3 x4);
=TEX
=DUMPMORE dtd503.grm.txt

⦏component_list⦎ =	component_declaration
					(red_component_list1 x1)
				|	component_declaration, component_list
					(red_component_list2 x1 x2);

(* TM/11 *)
⦏component_declaration⦎ =	identifier_list, `LCColon`, subtype_indication, `LCSemi`
					(red_component_declaration x1 x2 x3 x4);

=TEX
SPARK Manual section 3.9:
=DUMPMORE dtd503.grm.txt
(* EP/2 *)
(* PB/1 *)
⦏declarative_part⦎ =
					(red_declarative_part1)
		|	dec, declarative_part
					(red_declarative_part2 x1 x2);

⦏dec⦎ =		k_slot
					(red_dec1 x1)
	|	renaming_declaration
					(red_dec2 x1)
	|	basic_declarative_item
					(red_dec3 x1)
	|	package_declaration
					(red_dec4 x1)
	|	body
					(red_dec5 x1)
	|	using_dec	
					(red_dec6 x1);

⦏basic_declarative_item⦎ =	basic_declaration
					(red_basic_declarative_item1 x1)
			|	representation_clause
					(red_basic_declarative_item2 x1)
			|	use_clause
					(red_basic_declarative_item3 x1);

⦏body⦎ =	proper_body
					(red_body1 x1)
	|	body_stub
					(red_body2 x1);

⦏proper_body⦎ =	subprogram_body
					(red_proper_body x1);
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection{Names and Expressions}

The production rules in SPARK Manual section 4.1 have been used since the grammar in {\Source} is probably too wide (see \ref{Names}).

SPARK Manual section 4.1:
=DUMPMORE dtd503.grm.txt
(* NA/1 *)
⦏name⦎ =		`LCIdentifier`
					(red_name1 x1)
		|	indexed_component
					(red_name2 x1)
		|	selected_component
					(red_name3 x1)
		|	attribute
					(red_name4 x1);
=TEX
SPARK Manual section 4.1.1:
=DUMPMORE dtd503.grm.txt
(* NA/2 *)
⦏indexed_component⦎ =	name, actual_parameter_part
					(red_indexed_component x1 x2);
=TEX
SPARK Manual section 4.1.3:
=DUMPMORE dtd503.grm.txt
(* NA/3 *)
⦏selected_component⦎ =	name, `LCDot`, selector
					(red_selected_component x1 x2 x3);
(* SN/2 *)
⦏selector⦎ =		`LCIdentifier`
					(red_selector x1);
=TEX
SPARK Manual section 4.1/4.1.1:
=DUMPMORE dtd503.grm.txt
(* EP/3 *)
(* AG/8 *)
⦏expression_list⦎ =	expression
					(red_expression_list1 x1)
		|	expression_list, `LCComma`, expression
					(red_expression_list2 x1 x2 x3);

=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SPARK Manual section 4.1.4:
=DUMPMORE dtd503.grm.txt
(* AT/1 *)
⦏attribute⦎ =		name, `LCPrimedIdentifier`
					(red_attribute1 x1 x2)
		|	`LCCharacterLiteral`, `LCPrimedIdentifier`
					(red_attribute2 x1 x2);
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
For aggregates, in {\Source} a lookahead symbol $na$ was introduced in order to ensure that the grammar could be processed by the SID parser generator. The SLRP parser generator does not require the lookahead symbol, hence the grammar below differs from that in {\Source}.

SPARK Manual section 4.3:
=DUMPMORE dtd503.grm.txt
(* AG/1 *)
⦏aggregate⦎ =		`LCLBracket`, component_association, `LCRBracket`
					(red_aggregate x1 x2 x3);

(* AG/2 *)
⦏component_association⦎ =	named_association
					(red_component_association1 x1)
			|	positional_association
					(red_component_association2 x1);

(* EP/6 *)
(* AG/6 *)
⦏named_association⦎ =	aggregate_choice_list, `LCGoesTo`, expression
					(red_named_association1 x1 x2 x3)
			|	aggregate_choice_list, `LCGoesTo`, expression, `LCComma`,
				named_association
					(red_named_association2 x1 x2 x3 x4 x5);

(* EP/7 *)
(* AG/3 *)
⦏aggregate_choice_list⦎ =	`LCOthers`
					(red_aggregate_choice_list1 x1)
			|	aggregate_choice
					(red_aggregate_choice_list2 x1)
			|	aggregate_choice, `LCBar`, aggregate_choice_list
					(red_aggregate_choice_list3 x1 x2 x3);

=TEX
=DUMPMORE dtd503.grm.txt

⦏aggregate_choice⦎ =	discrete_range
					(red_aggregate_choice x1);

(* AG/4 *)
⦏positional_association⦎ =	expression_list
					(red_positional_association1 x1)
			|	expression_list, `LCComma`, `LCOthers`, `LCGoesTo`,
					 	expression
					(red_positional_association2 x1 x2 x3 x4 x5);
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SPARK Manual section 4.4:
=DUMPMORE dtd503.grm.txt
(* EP/5 *)
⦏expression⦎ =		relation
					(red_expression1 x1)
		|	relation, and_relation
					(red_expression2 x1 x2)
		|	relation, and_then_relation
					(red_expression3 x1 x2)
		|	relation, or_relation
					(red_expression4 x1 x2)
		|	relation, or_else_relation
					(red_expression5 x1 x2)
		|	relation, xor_relation
					(red_expression6 x1 x2);

⦏and_relation⦎ =	`LCAnd`, relation
					(red_and_relation1 x1 x2)
		|	`LCAnd`, relation, and_relation
					(red_and_relation2 x1 x2 x3);

⦏and_then_relation⦎ =	`LCAnd`, `LCThen`, relation
					(red_and_then_relation1 x1 x2 x3)
		|	`LCAnd`, `LCThen`, relation, and_then_relation
					(red_and_then_relation2 x1 x2 x3 x4);

⦏or_relation⦎ =	`LCOr`, relation
					(red_or_relation1 x1 x2)
		|	`LCOr`, relation, or_relation
					(red_or_relation2 x1 x2 x3);

⦏or_else_relation⦎ =	`LCOr`, `LCElse`, relation
					(red_or_else_relation1 x1 x2 x3)
		|	`LCOr`, `LCElse`, relation, or_else_relation
					(red_or_else_relation2 x1 x2 x3 x4);

⦏xor_relation⦎ =	`LCXor`, relation
					(red_xor_relation1 x1 x2)
		|	`LCXor`, relation, xor_relation
					(red_xor_relation2 x1 x2 x3);
=TEX
The introduction of an intermediate production for $sr\_expression$ is to support ranges as expressions and is described in section \ref{Ranges}.

SPARK Manual section 4.4:
=DUMPMORE dtd503.grm.txt
(* RA/3 *)
(* EP/4 *)
⦏relation⦎ =		sr_expression
					(red_relation1 x1)
		|	sr_expression, relational_operator, sr_expression
					(red_relation2 x1 x2 x3)
		|	sr_expression, `LCIn`, sr_expression
					(red_relation3 x1 x2 x3)
		|	sr_expression, `LCNot`, `LCIn`, sr_expression
					(red_relation4 x1 x2 x3 x4);

(* RA/2 *)
⦏sr_expression⦎ =	simple_expression
					(red_sr_expression1 x1)
		|	simple_expression, `LCDotDot`, simple_expression
					(red_sr_expression2 x1 x2 x3);

⦏simple_expression⦎ =	term, binoptail
					(red_simple_expression1 x1 x2)
			|	unary_adding_operator, term, binoptail
					(red_simple_expression2 x1 x2 x3);

⦏binoptail⦎ =
					(red_binoptail1)
	|	binary_adding_operator, term, binoptail
					(red_binoptail2 x1 x2 x3);

(* EP/8 *)
⦏term⦎ =	factor
					(red_term1 x1)
	|	term, multiplying_operator, factor
					(red_term2 x1 x2 x3);

⦏factor⦎ =	primary
					(red_factor1 x1)
	|	primary, `LCStarStar`, primary
					(red_factor2 x1 x2 x3)
	|	`LCAbs`, primary
					(red_factor3 x1 x2)
	|	`LCNot`, primary
					(red_factor4 x1 x2);
=TEX

The production for primary (function call branch) is not necessary because a function call appear as an indexed component. Similarly for type conversions. (See \ref{FunctionCalls}).
=DUMPMORE dtd503.grm.txt
(* FC/3 *)
(* AT/5 *)
(* AE/3 *)
(* AG/8 *)
⦏primary⦎ =		`LCNumericLiteral`
					(red_primary1 x1)
		|	`LCCharacterLiteral`
					(red_primary2 x1)
		|	`LCStringLiteral`
					(red_primary3 x1)
		|	name
					(red_primary4 x1)
		|	qualified_expression
					(red_primary5 x1)
		|	aggregate
					(red_primary6 x1)
		|	auxiliary_expression
					(red_primary7 x1);
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

SPARK Manual section 4.5:
=DUMPMORE dtd503.grm.txt
⦏relational_operator⦎ =	`LCEquals`
					(red_relational_operator1 x1)
			|	`LCNotEquals`
					(red_relational_operator2 x1)
			|	`LCLessThan`
					(red_relational_operator3 x1)
			|	`LCLessEquals`
					(red_relational_operator4 x1)
			|	`LCGreaterThan`
					(red_relational_operator5 x1)
			|	`LCGreaterEquals`
					(red_relational_operator6 x1);

⦏binary_adding_operator⦎ =	`LCPlus`
					(red_binary_adding_operator1 x1)
			|	`LCMinus`
					(red_binary_adding_operator2 x1)
			|	`LCAmpersand`
					(red_binary_adding_operator3 x1);

⦏unary_adding_operator⦎ =	`LCPlus`
					(red_unary_adding_operator1 x1)
			|	`LCMinus`
					(red_unary_adding_operator2 x1);

⦏multiplying_operator⦎ =	`LCStar`
					(red_multiplying_operator1 x1)
			|	`LCDiv`
					(red_multiplying_operator2 x1)
			|	`LCMod`
					(red_multiplying_operator3 x1)
			|	`LCRem`
					(red_multiplying_operator4 x1);
=TEX

Type conversions appear as indexed components in this grammar and are identified as type conversions by the $adjust\_exp$ function (see \cite{ISS/HAT/DAZ/DTD508}).
SPARK Manual section 4.7:
=DUMPMORE dtd503.grm.txt
(* TM/13 *)
⦏qualified_expression⦎ =	name, `LCPrime`, aggregate
					(red_qualified_expression x1 x2 x3);
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\subsection{Statements}
A production for specification statements has been added as a further refinement to {\Source} in which a specification statement is a terminal.
A label appended to a specification statement is parsed as a number in brackets. A subsequent check is required to ensure that the number comprises only digits.

A Z declaration in the statement/Con production appears as Z tokens. The parser then has to construct a Z declaration by placing the tokens in a context where a declaration could appear (i.e., a schema) and parse as a Z term using the Z parser. The term is then broken apart to yield the parsed Z declaration.

SPARK Manual section 5:
=DUMPMORE dtd503.grm.txt
(* EP/9 *)
⦏sequence_of_statements⦎ =		statement
					(red_sequence_of_statements1 x1)
				|	statement, sequence_of_statements
					(red_sequence_of_statements2 x1 x2);

⦏statement⦎ =		k_slot
					(red_statement1 x1)
		|	specification_statement
					(red_statement2 x1)
		|	specification_statement, label
					(red_statement3 x1 x2)
		|	`LCCon`, `LCZ`, `LCFatDot`, specification_statement
					(red_statement4 x1 x2 x3 x4)
		|	`LCCon`, `LCZ`, `LCFatDot`,
					specification_statement, label
					(red_statement5 x1 x2 x3 x4 x5)
		|	simple_statement
					(red_statement6 x1)
		|	compound_statement
					(red_statement7 x1)
		|	pragma
					(red_statement8 x1)
(* ANN/7 *)
		|	`LCAnnotation`
					(red_statement9 x1)
		|	ada_label, statement
					(red_statement10 x1 x2);

(* SS/1 *)
⦏specification_statement⦎ =	`LCGrkDelta`, `LCZ`, `LCLSqBrack`, `LCZ`, `LCRSqBrack`
					(red_specification_statement1 x1 x2 x3 x4 x5)
			|	`LCGrkDelta`, `LCZ`, `LCLBrace`, `LCZ`, `LCRBrace`
					(red_specification_statement2 x1 x2 x3 x4 x5)
			|	`LCGrkDelta`, `LCLSqBrack`, `LCZ`, `LCRSqBrack`
					(red_specification_statement3 x1 x2 x3 x4)
			|	`LCGrkDelta`, `LCLBrace`, `LCZ`, `LCRBrace`
					(red_specification_statement4 x1 x2 x3 x4)
			|	`LCGrkGamma`, `LCLBrace`, `LCZ`, `LCRBrace`
					(red_specification_statement5 x1 x2 x3 x4);

(* LA/1 *)
⦏label⦎ =	`LCLBracket`, `LCNumericLiteral`, `LCRBracket`
					(red_label1 x1 x2 x3)
	|	`LCLBracket`, name, `LCRBracket`
					(red_label2 x1 x2 x3);

(* KS/1 *)
⦏k_slot⦎ =	`LCLChevron`, `LCKSlot`, `LCRChevron`
					(red_k_slot1 x1 x2 x3)
	|	`LCLChevron`, `LCKSlot`, `LCRChevron`, label
					(red_k_slot2 x1 x2 x3 x4);
=TEX
=DUMPMORE dtd503.grm.txt
⦏ada_label⦎ =	`LCLLabel`, `LCIdentifier`, `LCRLabel`
					(red_ada_label1 x1 x2 x3);
=TEX
SPARK Manual section 5.1:
=DUMPMORE dtd503.grm.txt

⦏simple_statement⦎ =		null_statement
					(red_simple_statement1 x1)
			|	assignment_statement
					(red_simple_statement2 x1)
			|	procedure_call_statement
					(red_simple_statement3 x1)
			|	exit_statement
					(red_simple_statement4 x1)
			|	return_statement
					(red_simple_statement5 x1)
			|	goto_statement
					(red_simple_statement6 x1);

⦏compound_statement⦎ =		if_statement
					(red_compound_statement1 x1)
				|	case_statement
					(red_compound_statement2 x1)
				|	loop_statement
					(red_compound_statement3 x1)
				|	block_statement
					(red_compound_statement4 x1);

⦏null_statement⦎ =	`LCNull`, `LCSemi`
					(red_null_statement1 x1 x2)
		|	`LCNothing`, `LCSemi`
					(red_null_statement2 x1 x2);

=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SPARK Manual section 5.2:
=DUMPMORE dtd503.grm.txt
⦏assignment_statement⦎ =	name, `LCBecomes`, expression, `LCSemi`
					(red_assignment_statement x1 x2 x3 x4);
=TEX
SPARK Manual section 5.3:
=DUMPMORE dtd503.grm.txt

⦏if_statement⦎ = 	`LCIf`, condition,
			`LCThen`, sequence_of_statements,
				elsif_part,
				else_part,
			`LCEnd`, `LCIf`, `LCSemi`
					(red_if_statement
						x1 x2 x3 x4 x5 x6 x7 x8 x9);

⦏elsif_part⦎ =
					(red_elsif_part1)
		|	`LCElsIf`, condition,
			`LCThen`, sequence_of_statements,
			elsif_part
					(red_elsif_part2 x1 x2 x3 x4 x5);

⦏else_part⦎ =
					(red_else_part1)
		|	`LCElse`, sequence_of_statements
					(red_else_part2 x1 x2);

⦏condition⦎ =		expression
					(red_condition x1);
=TEX
SPARK Manual section 5.4:
=DUMPMORE dtd503.grm.txt

⦏case_statement⦎ =	`LCCase`, expression,
			`LCIs`,
				case_statement_alternative_list,
				others_part,
			`LCEnd`, `LCCase`, `LCSemi`
					(red_case_statement x1 x2 x3 x4 x5 x6 x7 x8);

(* CS/1 *)
⦏case_statement_alternative_list⦎ =
			case_statement_alternative
					(red_case_statement_alternative_list1 x1)
		|	case_statement_alternative_list, case_statement_alternative
					(red_case_statement_alternative_list2 x1 x2);

⦏case_statement_alternative⦎ =
			`LCWhen`, case_choice_list, `LCGoesTo`, sequence_of_statements
					(red_case_statement_alternative x1 x2 x3 x4);

⦏case_choice_list⦎ =	case_choice
					(red_case_choice_list1 x1)
		|	case_choice, `LCBar`, case_choice_list
					(red_case_choice_list2 x1 x2 x3);

⦏case_choice⦎ =	discrete_range
					(red_case_choice x1);

(* CS/2 *)
⦏others_part⦎ =
					(red_others_part1)
		|	`LCWhen`, `LCOthers`, `LCGoesTo`, sequence_of_statements
					(red_others_part2 x1 x2 x3 x4);
=TEX

SPARK Manual section 5.5:
=DUMPMORE dtd503.grm.txt

(* LS/1 *)
⦏loop_statement⦎ =	name_colon_opt, iteration_scheme_opt,
			till_opt, loop_body, cn_name_opt, `LCSemi`
					(red_loop_statement x1 x2 x3 x4 x5 x6);
(* LS/2 *)
⦏loop_body⦎ = 		`LCLoop`, sequence_of_statements,
			`LCEnd`, `LCLoop` (red_loop_body x1 x2 x3 x4);

(* SN/3 *)
⦏name_colon_opt⦎ =
					(red_name_colon_opt1)
		|	`LCIdentifier`, `LCColon`
					(red_name_colon_opt2 x1 x2)
		|	`LCBlock`, `LCIdentifier`, `LCColon`
					(red_name_colon_opt3 x1 x2 x3);

(* SN/4 *)
⦏cn_name_opt⦎ =		
					(red_cn_name_opt1)
		|	`LCIdentifier`
					(red_cn_name_opt2 x1)
		|	`LCBlock`, `LCIdentifier`
					(red_cn_name_opt3 x1 x2);
(* SN/4 *)
⦏name_opt⦎ =
					(red_name_opt1)
		|	`LCIdentifier`
					(red_name_opt2 x1);

⦏iteration_scheme_opt⦎ =
					(red_iteration_scheme_opt1)
		|	iteration_scheme
					(red_iteration_scheme_opt2 x1);

⦏iteration_scheme⦎ =	`LCWhile`, condition
					(red_iteration_scheme1 x1 x2)
		|	`LCFor`, loop_parameter_specification
					(red_iteration_scheme2 x1 x2);
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Range has been replaced with a more general $sr\_expression$ in loop parameter specification. A later check will be required to ensure that the sr expression is a range. See section \ref{Ranges} for further information.

Auxiliary Expressions comprise a ``⟦'' followed by some Z followed by ``⟧''.

SPARK Manual section 5.5:
=DUMPMORE dtd503.grm.txt
(* RA/4 *)
(* TM/14 *)
⦏loop_parameter_specification⦎ =
			`LCIdentifier`, `LCIn`, discrete_range
					(red_loop_parameter_specification1 x1 x2 x3)
		|	`LCIdentifier`, `LCIn`, `LCReverse`, discrete_range
					(red_loop_parameter_specification2 x1 x2 x3 x4);

(* AE/2 *)
⦏till_opt⦎ =
					(red_till_opt1)
		|	`LCTill`, auxiliary_expression
					(red_till_opt2 x1 x2);

(* AE/1 *)
⦏auxiliary_expression⦎ =	`LCLStrachey`, `LCZ`, `LCRStrachey`
					(red_auxiliary_expression x1 x2 x3);
=TEX
SPARK Manual section 5.6:
=DUMPMORE dtd503.grm.txt
⦏block_statement⦎ = name_colon_opt,  `LCDeclare`, declarative_part,
			`LCBegin`, sequence_of_statements,
			`LCEnd`,  cn_name_opt, `LCSemi`
					(red_block_statement1 x1 x2 x3 x4 x5 x6 x7 x8)
		|	name_colon_opt, `LCBegin`, sequence_of_statements,
			`LCEnd`,  cn_name_opt, `LCSemi`
					(red_block_statement2 x1 x2 x3 x4 x5 x6);
=TEX
SPARK Manual section 5.7:
=DUMPMORE dtd503.grm.txt

⦏exit_statement⦎ =	`LCExit`, name_opt, `LCSemi`
					(red_exit_statement1 x1 x2 x3)
		|	`LCExit`, name_opt, `LCWhen`, condition, `LCSemi`
					(red_exit_statement2 x1 x2 x3 x4 x5);
=TEX
SPARK Manual section 5.8:
=DUMPMORE dtd503.grm.txt

⦏return_statement⦎ =	`LCReturn`, `LCSemi`
					(red_return_statement1 x1 x2)
		|	`LCReturn`, expression, `LCSemi`
					(red_return_statement2 x1 x2 x3);
=TEX
=TEX
SPARK Manual section 5.9:
=DUMPMORE dtd503.grm.txt
⦏goto_statement⦎ =	`LCGoto`, name, `LCSemi`
					(red_goto_statement1 x1 x2 x3);
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection{Subprograms}
SPARK Manual section 6.1:
=DUMPMORE dtd503.grm.txt

⦏subprogram_declaration⦎ =
			procedure_specification, `LCSemi`
					(red_subprogram_declaration1 x1 x2)
		|	function_specification, `LCSemi`
					(red_subprogram_declaration2 x1 x2)
		|	`LCImplicit`, procedure_specification, `LCSemi`
					(red_subprogram_declaration3 x1 x2 x3)
		|	`LCImplicit`, function_specification, `LCSemi`
					(red_subprogram_declaration4 x1 x2 x3);

⦏subprogram_specification⦎ =
			procedure_specification
					(red_subprogram_specification1 x1)
		|	function_specification
					(red_subprogram_specification2 x1);
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

SPARK Manual section 6.1:
=DUMPMORE dtd503.grm.txt
(* ANN/2 *)
⦏procedure_specification_1⦎ =
			`LCProcedure`, `LCIdentifier`
					(red_procedure_specification_1_1 x1 x2)
		|	`LCProcedure`, `LCIdentifier`, procedure_specification_statement
					(red_procedure_specification_1_2 x1 x2 x3)
		|	`LCProcedure`, `LCIdentifier`, formal_part
					(red_procedure_specification_1_3 x1 x2 x3)
		|	`LCProcedure`, `LCIdentifier`, formal_part,
					procedure_specification_statement
					(red_procedure_specification_1_4 x1 x2 x3 x4);

⦏procedure_specification⦎ = procedure_specification_1, annotation_list

					(red_procedure_specification x1 x2);
=DUMPMORE dtd503.grm.txt
(* PS/1 *)
⦏procedure_specification_statement⦎ =
				`LCGrkDelta`, `LCZ`, function_specification_statement
					(red_procedure_specification_statement1 x1 x2 x3)
			|	`LCGrkDelta`, function_specification_statement
					(red_procedure_specification_statement2 x1 x2)
			|	specification_statement
					(red_procedure_specification_statement3 x1);
=DUMPMORE dtd503.grm.txt
(* FS/1 *)
⦏function_specification_statement⦎ =
				`LCGrkXi`, `LCZ`, `LCLSqBrack`, `LCZ`, `LCRSqBrack`
					(red_function_specification_statement1 x1 x2 x3 x4 x5)
			|	`LCGrkXi`, `LCZ`, `LCLBrace`, `LCZ`, `LCRBrace`
					(red_function_specification_statement2 x1 x2 x3 x4 x5)
			|	`LCGrkXi`, `LCLSqBrack`, `LCZ`, `LCRSqBrack`
					(red_function_specification_statement3 x1 x2 x3 x4)
			|	`LCGrkXi`, `LCLBrace`, `LCZ`, `LCRBrace`
					(red_function_specification_statement4 x1 x2 x3 x4);
=DUMPMORE dtd503.grm.txt
(* ANN/3 *)
(* TM/15 *)
(* EP/11 *)
⦏function_specification_1⦎ =
			`LCFunction`, `LCIdentifier`, `LCReturn`, name
					(red_function_specification_1_1 x1 x2 x3 x4)
		|	`LCFunction`, `LCIdentifier`, `LCReturn`, name,
			function_specification_statement
					(red_function_specification_1_2 x1 x2 x3 x4 x5)
		|	`LCFunction`, `LCIdentifier`, formal_part, `LCReturn`, name
					(red_function_specification_1_3 x1 x2 x3 x4 x5)
		|	`LCFunction`, `LCIdentifier`, formal_part, `LCReturn`, name,
			function_specification_statement
					(red_function_specification_1_4 x1 x2 x3 x4 x5 x6);
=DUMPMORE dtd503.grm.txt
⦏function_specification⦎ = function_specification_1, annotation_list

					(red_function_specification x1 x2);
=TEX
=DUMPMORE dtd503.grm.txt
⦏annotation_list⦎ =		(red_annotation_list1)
		|	`LCAnnotation`, annotation_list
				(red_annotation_list2 x1 x2)
		|	k_slot, annotation_list
				(red_annotation_list3 x1 x2);
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

SPARK Manual section 6.1:
=DUMPMORE dtd503.grm.txt

⦏operator_symbol⦎ =	`LCStringLiteral`
					(red_operator_symbol x1);

⦏formal_part⦎ =	`LCLBracket`, parlist, `LCRBracket`
					(red_formal_part x1 x2 x3);

⦏parlist⦎ =		parameter_specification
					(red_parlist1 x1)
		|	parameter_specification, `LCSemi`, parlist
					(red_parlist2 x1 x2 x3);

(* TM/16 *)
⦏parameter_specification⦎ =	identifier_list, `LCColon`, mode, name
					(red_parameter_specification1 x1 x2 x3 x4)
		|	identifier_list, `LCColon`, mode, name,
			`LCBecomes`, expression
					(red_parameter_specification2 x1 x2 x3 x4 x5 x6);

⦏mode⦎ =
					(red_mode1)
	|	`LCIn`
					(red_mode2 x1)
	|	`LCOut`
					(red_mode3 x1)
	|	`LCIn`, `LCOut`
					(red_mode4 x1 x2);
=TEX
SPARK's annotations have been dropped.

SPARK's code insertions have been dropped.

SPARK's hidden parts have been dropped.

SPARK Manual section 6.3:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
=DUMPMORE dtd503.grm.txt

⦏subprogram_body⦎ =	procedure_specification,
				`LCIs`, subprogram_implementation
					(red_subprogram_body1 x1 x2 x3)
			|	LCDeferred,
				procedure_specification,
				`LCIs`, subprogram_implementation
					(red_subprogram_body2 x1 x2 x3 x4)
			|	function_specification,
				`LCIs`, subprogram_implementation
					(red_subprogram_body3 x1 x2 x3)
			|	LCDeferred,
				function_specification,
				`LCIs`, subprogram_implementation
					(red_subprogram_body4 x1 x2 x3 x4);

(* EP/11 *)
⦏subprogram_implementation⦎ =	declarative_part,
				`LCBegin`,
					sequence_of_statements,
				`LCEnd`, name_opt, `LCSemi`
					(red_subprogram_implementation x1 x2 x3 x4 x5 x6);
=TEX
SPARK Manual section 6.4:
=DUMPMORE dtd503.grm.txt
(* FC/5 *)
⦏procedure_call_statement⦎ =	name, `LCSemi`
					(red_procedure_call_statement x1 x2);

⦏actual_parameter_part⦎ =	`LCLBracket`, parameter_association, `LCRBracket`
					(red_actual_parameter_part x1 x2 x3);

(* AG/5 *)
⦏parameter_association⦎ =	named_association
					(red_parameter_association1 x1)
			|	positional_parameter_association
					(red_parameter_association2 x1);

⦏positional_parameter_association⦎ =	actual_parameter
					(red_positional_parameter_association1 x1)
				|	actual_parameter, `LCComma`,
						positional_parameter_association
					(red_positional_parameter_association2 x1 x2 x3);
=TEX
=DUMPMORE dtd503.grm.txt
⦏actual_parameter⦎ =		subtype_indication
					(red_actual_parameter x1);
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection{Packages}

SPARK Manual section 7.1:
=DUMPMORE dtd503.grm.txt
⦏package_declaration⦎ =	package_specification, `LCSemi`
					(red_package_declaration x1 x2);
(* ANN/5 *)
⦏package_specification⦎ = `LCPackage`, expanded_name,
			annotation_list, `LCIs`,
				visible_part,
			`LCEnd`, expanded_name_opt
			(red_package_specification1 x1 x2 x3 x4 x5 x6 x7)
		|	`LCPackage`, expanded_name,
			annotation_list, `LCIs`,
				visible_part,
			`LCPrivate`,
				private_part,
			`LCEnd`, expanded_name_opt
			(red_package_specification2 x1 x2 x3 x4 x5 x6 x7 x8 x9);

⦏visible_part⦎ =
					(red_visible_part1)
		|	visdec, visible_part
					(red_visible_part2 x1 x2);

⦏expanded_name_opt⦎ =
					(red_expanded_name_opt1)
		|	expanded_name	(red_expanded_name_opt2 x1);

⦏expanded_name⦎ = 	`LCIdentifier`	(red_expanded_name1 x1)
		|	`LCIdentifier`, `LCDot`, expanded_name
				(red_expanded_name2 x1 x2 x3);

=TEX

SPARK Manual section 7.1:
=DUMPMORE dtd503.grm.txt
⦏visdec⦎ =		k_slot
					(red_visdec1 x1)
		|	basic_declarative_item
					(red_visdec2 x1)
		|	subprogram_declaration
					(red_visdec3 x1)
		|	`LCAuxiliary`, `LCZ`, `LCSemi`
					(red_visdec4 x1 x2 x3)
		|	renaming_declaration
					(red_visdec5 x1);

⦏private_part⦎ =	visible_part
				(red_private_part x1);

=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
=DUMPMORE dtd503.grm.txt
(* ANN/6 *)
(* SN/5 *)
⦏package_body⦎ =	`LCPackage`, `LCBBody`, expanded_name,
			annotation_list, `LCIs`,
				package_implementation,
			`LCEnd`, expanded_name_opt, `LCSemi`
				(red_package_body x1 x2 x3 x4 x5 x6 x7 x8 x9);

⦏package_implementation⦎ =	declarative_part
					(red_package_implementation1 x1)
				|	declarative_part, `LCBegin`, package_initialization
					(red_package_implementation2 x1 x2 x3);
=TEX
The following is specified by DRA in {\Source}. It is required to support auxiliary expressions. The grammar has been widened by using $basic\_declaration$ in the production for $basic\_dec\_list$. This allows deferred constant declarations as part of a $basic\_dec\_list$, and the reduction functions detect and reject this case.

$declarative\_part\_1$ is specified in terms of $dec$ rather than $dec\_1$ of {\Source}. This allows k-slots to appear in a $declarative\_part\_1$, which need to be rejected in the reduction functions.

=DUMPMORE dtd503.grm.txt
⦏using_dec⦎ =		`LCUsing`, basic_dec_list,
			`LCImplement`, `LCZ`,
			`LCBy`, `LCZ`, `LCSemi`
				(red_using_dec x1 x2 x3 x4 x5 x6 x7);

(* AE/4 *)
⦏basic_dec_list⦎ =	basic_declaration
				(red_basic_dec_list1 x1)
		|	basic_declaration, basic_dec_list
				(red_basic_dec_list2 x1 x2);

=TEX
=DUMPMORE dtd503.grm.txt

⦏package_initialization⦎ =	sequence_of_statements
					(red_package_initialization x1);
=TEX
SPARK Manual section 7.4:
=DUMPMORE dtd503.grm.txt

⦏private_type_declaration⦎ =	`LCType`, `LCIdentifier`, `LCIs`, `LCPrivate`, `LCSemi`
					(red_private_type_declaration1 x1 x2 x3 x4 x5)
			|	`LCType`, `LCIdentifier`, formal_part, `LCIs`,
					`LCPrivate`, `LCSemi`
					(red_private_type_declaration2 x1 x2 x3 x4 x5 x6)
			|	`LCType`, `LCIdentifier`, `LCIs`,
						`LCLimited`, `LCPrivate`, `LCSemi`
					(red_private_type_declaration3 x1 x2 x3 x4 x5 x6)
			|	`LCType`, `LCIdentifier`, formal_part, `LCIs`,
						`LCLimited`, `LCPrivate`, `LCSemi`
					(red_private_type_declaration4 x1 x2 x3 x4 x5 x6 x7);

(* TM/17 *)
⦏deferred_constant_declaration⦎ =	identifier_list, `LCColon`, `LCConstant`,
						subtype_indication, `LCSemi`
					(red_deferred_constant_declaration x1 x2 x3 x4 x5);
=TEX
\subsection{Visibility Rules}
SPARK Manual section 8.1:
=DUMPMORE dtd503.grm.txt
⦏use_clause⦎ =		use_package_clause
				 (red_use_clause1 x1)
		|	use_type_clause
				 (red_use_clause2 x1);

⦏use_package_clause⦎ =	`LCUse`, expanded_name_list, `LCSemi`
				 (red_use_package_clause x1 x2 x3);

⦏use_type_clause⦎ =	`LCUse`, `LCType`, expression_list, `LCSemi`
				 (red_use_type_clause x1 x2 x3 x4);
=TEX
SPARK Manual section 8.5:
=DUMPMORE dtd503.grm.txt
(* TM/18 *)
(* SN/6 *)
⦏renaming_declaration⦎ =	identifier_list, `LCColon`, name, `LCRenames`, name, `LCSemi`
					(red_renaming_declaration1
						x1 x2 x3 x4 x5 x6)
			|	`LCPackage`, expanded_name, annotation_list,
					`LCRenames`, identifier_list, `LCSemi`
					(red_renaming_declaration2 x1 x2 x3 x4 x5 x6)
			|	`LCFunction`, operator_symbol, formal_part,
					`LCReturn`, name, `LCRenames`,
					name, `LCDot`, operator_symbol, `LCSemi`
					(red_renaming_declaration3
						x1 x2 x3 x4 x5 x6 x7 x8 x9 x10)
			|	subprogram_specification,
					`LCRenames`, name, `LCSemi`
					(red_renaming_declaration4 x1 x2 x3 x4)
			|	subprogram_specification, `LCRenames`,
					name, `LCDot`, operator_symbol, `LCSemi`
				(red_renaming_declaration5 x1 x2 x3 x4 x5 x6)
			|	subprogram_specification, `LCRenames`,
					operator_symbol, `LCSemi`
				(red_renaming_declaration6 x1 x2 x3 x4);

=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\subsection{Program Structure and Compilation Issues}
SPARK Manual section 10.1:
=DUMPMORE dtd503.grm.txt

⦏compilation⦎ =	k_slot
					(red_compilation1 x1)
		|	compilation_unit
					(red_compilation2 x1)
		|	compilation_unit, compilation
					(red_compilation3 x1 x2);
=TEX
SPARK Manual section 10.1:
=DUMPMORE dtd503.grm.txt
(* ANN/4 *)
⦏compilation_unit⦎ =	context_clause, library_unit
						(red_compilation_unit1 x1 x2)
		|	context_clause, secondary_unit
						(red_compilation_unit2 x1 x2)
		|	pragma		(red_compilation_unit3 x1);


⦏library_unit⦎ =		package_declaration
					(red_library_unit1 x1)
		|	`LCPrivate`, package_declaration					
					(red_library_unit2 x1 x2)
		|	main_program
					(red_library_unit3 x1);

⦏secondary_unit⦎ =	library_unit_body
					(red_secondary_unit1 x1)
		|	subunit
					(red_secondary_unit2 x1);

⦏library_unit_body⦎ =	package_body
					(red_library_unit_body x1);

⦏main_program⦎ =	subprogram_body
					(red_main_program x1);
=TEX
SPARK Manual section 10.1.1:
=DUMPMORE dtd503.grm.txt
⦏context_clause⦎ =
					(red_context_clause1)
		|	with_or_use_clause, pragma_list, annotated_context_clause
					(red_context_clause2 x1 x2 x3)
		|	references_clause, annotated_context_clause
					(red_context_clause3 x1 x2)
		|	`LCAnnotation`, annotation_list
					(red_context_clause4 x1 x2);
=TEX
The following auxiliary productions are used here:
=DUMPMORE dtd503.grm.txt
⦏annotated_context_clause⦎ =
			with_or_use_clause, pragma_list, annotated_context_clause
					(red_context_clause2 x1 x2 x3)
		|	references_clause, annotated_context_clause
					(red_context_clause3 x1 x2)
		|	annotation_list	(red_context_clause5 x1);

⦏with_or_use_clause⦎ =	with_clause
					(red_with_or_use_clause1 x1)
		|	use_clause
					(red_with_or_use_clause2 x1);
=DUMPMORE dtd503.grm.txt
⦏pragma_list⦎ =			(red_pragma_list1)
		|	pragma, pragma_list
					(red_pragma_list2 x1 x2);

⦏pragma⦎ =		`LCPragma`, `LCIdentifier`, `LCSemi`
					(red_pragma1 x1 x2 x3)
		|	`LCPragma`, `LCIdentifier`,
			`LCLBracket`, arg_ass_list, `LCRBracket`, `LCSemi`
					(red_pragma2 x1 x2 x3 x4 x5 x6);

⦏arg_ass_list⦎ =	argument_association	(red_arg_ass_list1 x1)
		|	argument_association, `LCComma`, arg_ass_list
						(red_arg_ass_list2 x1 x2 x3);
(* AA/1 *)
⦏argument_association⦎
		=	aggregate_choice_list, `LCGoesTo`, expression
				(red_argument_association1 x1 x2 x3)
		|	expression
				(red_argument_association2 x1);
=TEX
In {\Source}, the $with\_clause$ production refers to a $simple\_name\_list$. Since simple names are identifiers, here an identifier list is used instead. The production for $simple\_name\_list$ is dispensed with.

SPARK Manual section 10.1.1:
=DUMPMORE dtd503.grm.txt
(* SN/10 *)
⦏with_clause⦎ =	`LCWith`, expanded_name_list, `LCSemi`
					(red_with_clause x1 x2 x3);
⦏references_clause⦎ =	`LCReferences`, expanded_name_list, `LCSemi`
					(red_references_clause x1 x2 x3);

⦏expanded_name_list⦎ =	expanded_name	(red_expanded_name_list1 x1)
		|	expanded_name, `LCComma`, expanded_name_list
					(red_expanded_name_list2 x1 x2 x3);
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SPARK Manual section 10.2:
=DUMPMORE dtd503.grm.txt
⦏body_stub⦎ =		procedure_specification, `LCIs`, `LCSeparate`, `LCSemi`
					(red_body_stub1 x1 x2 x3 x4)
		|	function_specification, `LCIs`, `LCSeparate`, `LCSemi`
					(red_body_stub2 x1 x2 x3 x4)
		|	`LCPackage`, `LCBBody`, expanded_name, annotation_list,
				 `LCIs`, `LCSeparate`, `LCSemi`
					(red_body_stub3 x1 x2 x3 x4 x5 x6 x7)
		|	procedure_specification, `LCSemi`
					(red_body_stub4 x1 x2)
		|	function_specification, `LCSemi`
					(red_body_stub5  x1 x2)
		|	`LCImplicit`, procedure_specification, `LCSemi`
					(red_body_stub6 x1 x2 x3)
		|	`LCImplicit`, function_specification, `LCSemi`
					(red_body_stub7  x1 x2 x3);

⦏subunit⦎ =	`LCSeparate`, `LCLBracket`, name, `LCRBracket`, proper_body
					(red_subunit x1 x2 x3 x4 x5)
	|	`LCSeparate`, `LCLBracket`, name, `LCRBracket`, package_body
					(red_subunit x1 x2 x3 x4 x5);
=TEX
\subsection{Representation Clauses}
SPARK Manual section 13.1:
=DUMPMORE dtd503.grm.txt

⦏representation_clause⦎ =	type_representation_clause
					(red_representation_clause1 x1)
			|	address_clause
					(red_representation_clause2 x1);

⦏type_representation_clause⦎ =	length_clause
					(red_type_representation_clause1 x1)
				|	enumeration_representation_clause
					(red_type_representation_clause2 x1)
				|	record_representation_clause
					(red_type_representation_clause3 x1);
=TEX
SPARK Manual section 13.2:
=DUMPMORE dtd503.grm.txt
⦏length_clause⦎ =	`LCFor`, attribute, `LCUse`, simple_expression, `LCSemi`
					(red_length_clause x1 x2 x3 x4 x5);
=TEX
SPARK Manual section 13.3:
=DUMPMORE dtd503.grm.txt
(* SN/7 *)
⦏enumeration_representation_clause⦎ =	`LCFor`, `LCIdentifier`, `LCUse`,
							aggregate, `LCSemi`
					(red_enumeration_representation_clause x1 x2 x3 x4 x5);
=TEX
SPARK Manual section 13.4:
=DUMPMORE dtd503.grm.txt

⦏record_representation_clause⦎ =
			`LCFor`, `LCIdentifier`,
			`LCUse`,
			`LCRecord`,
				alignment_opt, component_pack,
			`LCEnd`, `LCRecord`, `LCSemi`
					(red_record_representation_clause
						x1 x2 x3 x4 x5 x6 x7 x8 x9);
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SPARK Manual section 13.4:
=DUMPMORE dtd503.grm.txt
⦏alignment_opt⦎ =
					(red_alignment_opt1)
		|	`LCAt`, `LCMod`, simple_expression, `LCSemi`
					(red_alignment_opt2 x1 x2 x3 x4);
=TEX
=DUMPMORE dtd503.grm.txt
⦏component_pack⦎ =	component_clause
					(red_component_pack1 x1)
		|	component_clause, component_pack
					(red_component_pack2 x1 x2);
=TEX
SPARK Manual section 13.4:
=DUMPMORE dtd503.grm.txt
(* RA/7 *)
⦏component_clause⦎ =	name, `LCAt`, simple_expression, `LCRRange`,
				 sr_expression, `LCSemi`
					(red_component_clause x1 x2 x3 x4 x5 x6);
=TEX
SPARK Manual section 13.5:
=DUMPMORE dtd503.grm.txt
(* SN/8 *)
⦏address_clause⦎ =	`LCFor`, `LCIdentifier`, `LCUse`, `LCAt`,
				simple_expression, `LCSemi`
					(red_address_clause x1 x2 x3 x4 x5 x6);
=TEX

\section{GENERATING THE TABLES}\label{GENERATINGTABLES}
The following script invokes the parser generator to generate the parsing tables. It is invoked automatically when this document is processed with the $sieve$ command using the $sml$ view (which happens when the tool is built).
=SH
slrp -e LCEos -f dtd503.grm.txt >dtd503.grm.run 2>&1
=TEX

\section{THE SIGNATURE $CNParser$}
=DOC
signature ⦏CNParser⦎ = sig
=DESCRIBE
This is the signature for the structure containing the parser for SPARK.
=ENDDOC


=DOC
val ⦏cn_parser⦎ : CNTypes.CN_LEX_ITEM list -> CNTypes.WEB_CLAUSE;
=DESCRIBE
This is the context-free parser for the Compliance Notation. It maps the lists of
tokens output by the lexical analyser $CNLex.cn\_lex$ into abstract syntax for web clauses; incorrect input causes a syntax error to be reported to the user.
=FAILURE
503001	?0
503002	?0 has not been introduced as the label of a specification statement or a k-slot
503003	?0 is ?1
503004	?0 is not expected after ⓈCN ?1
503005	Syntax error in: ⓈCN ?0
503202	Internal error in CN-Parser
503203	Corrupt parsing stack detected in ?0
503204	Syntax error
503205	Internal error (?0)
=ENDDOC


=DOC
type ⦏CN_PARSER_STATE⦎ (* = {
		unlabelled_stack : string OPT,
		unlabelled_provisional : string OPT
		unlabelled_counter : int,
		last_label : CNTypes.LABEL
		} *);
val ⦏reset_cn_parser_state⦎ : unit -> unit
val ⦏set_cn_parser_state⦎ : CN_PARSER_STATE -> unit
val ⦏get_cn_parser_state⦎ : unit -> CN_PARSER_STATE
=DESCRIBE
These ML objects give control over internal state of the parser.
=ENDDOC

=DOC
(* Flag ⦏cn_show_typing_context⦎ - boolean control, default false *)
=DESCRIBE
When true this will cause the typing context used in type checking a parsed Z expression to be printed to the screen.
This flag should only be used under supplier's guidance, as the results may well be unintelligible (though not dangerous).
=ENDDOC

\section{EPILOGUE}
=SML
end; (* of signature CNParser *)
=TEX
\section{TEST POLICY}
The functions in this document are to be tested according to the
criteria identified in \cite{ISS/HAT/DAZ/PLN003}.

\small
\twocolumn[\section{INDEX}]
\printindex

\end{document}


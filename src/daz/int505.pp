=IGN
********************************************************************************
int505.doc: this file is part of the PPDaz system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% ℤ $Date: 2006/03/28 16:48:35 $ $Revision: 1.12 $ $RCSfile: int505.doc,v $
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

\def\Title{Aliasing Test Material}

\def\AbstractText{This document gives a number of compliance notation scripts. The Z documents generated by these scripts are checked against the original scripts.}

\def\Reference{ISS/HAT/DAZ/INT505}

\def\Author{A.C. Hayward}


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
%% LaTeX2e port: 
%% LaTeX2e port: \documentstyle[hol1,11pt,TQ]{article}
%% LaTeX2e port: \ftlinepenalty=9999
\def\Hide#1{}
\def\Bool{``$\it{:}bool\,$''}
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{DAZ PROJECT}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Aliasing Test Material}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Aliasing Test Material}
%% LaTeX2e port: \TPPref{ISS/HAT/DAZ/INT505}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.12 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2006/03/28 16:48:35 $%
%% LaTeX2e port: }}  %% Mandatory field (with sensible default)
%% LaTeX2e port: \TPPstatus{Informal}
%% LaTeX2e port: %\TPPstatus{Informal}
%% LaTeX2e port: \TPPtype{Technical}
%% LaTeX2e port: %\TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{A.C.~Hayward & HAT Team}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & WIN01}
%% LaTeX2e port: 
%% LaTeX2e port: \TPPabstract{%
%% LaTeX2e port: This document gives a number of compliance notation scripts.  The Z documents generated by these scripts are checked against the original scripts.
%% LaTeX2e port: }
%% LaTeX2e port: %\TPPabstractB{}
%% LaTeX2e port: %\TPPabstractC{}
%% LaTeX2e port: %\TPPabstractD{}
%% LaTeX2e port: %\TPPabstractE{}
%% LaTeX2e port: %\TPPabstractF{}
%% LaTeX2e port: 
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port:       Library}}
%% LaTeX2e port: %\TPPclass{CLASSIFICATION}
%% LaTeX2e port: \def\TPPheadlhs{Lemma 1 Ltd.}
%% LaTeX2e port: %\def\TPPheadlhs{}
%% LaTeX2e port: %\def\TPPheadcentre{}
%% LaTeX2e port: %def\TPPheadrhs{}
%% LaTeX2e port: %\def\TPPfootlhs{}
%% LaTeX2e port: %\def\TPPfootcentre{}
%% LaTeX2e port: %\def\TPPfootrhs{}
%% LaTeX2e port: \begin{document}
%% LaTeX2e port: \TPPsetsizes
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
\newpage

\section{DOCUMENT CONTROL}

\subsection{Contents List}
\tableofcontents

\pagebreak

\subsection{Document Cross References}
\bibliographystyle{fmu}
\bibliography{fmu,daz}

\subsection{Changes History}  % to get section number `0.3'
\begin{description}
\item[Issue 1.5 (2000/10/25)] CTLE II R2/1: global variable unsoundness.
\item[Issue 1.6 (2001/11/07)] CR0003: record and array components as exported parameters.
\item[Issue 1.7 (2002/08/23)] Removed use of ICL logo font.
\item[Issue 1.8 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.9 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.10 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.11 (2006/03/28)] Allowed for automated state management.
\item[Issue 1.13 (2006/09/19)] Allowed for enhancement 165.
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
This document contains test data for the Compliance Tool as specified in \cite{ISS/HAT/DAZ/HLD501}.
It is based on the examples in \cite{DRA/CIS/CSE3/SWI/WP/12/1}.

\subsection{Introduction}
This document contains four compliance notation scripts.  These are loaded into the compliance tool and Z documents generated.  The Z documents are then reloading into the tool and compared with the original scripts.

\section{Setting up of the enivronment}
Set up flags so the compilance tool works correctly .

=SML
set_flags [("z_type_check_only", false),("z_use_axioms", true)];
=TEX

Load the test harness.

=SML
use_file "dtd013";
use_file "imp013";
=TEX
\section{LITERATE SCRIPT 1}

=SML
new_script {name="MAIN1", unit_type="proc"};
=TEX

ⓈCN
procedure MAIN1 is
   subtype SUB is INTEGER range 1 .. 1;
   type ARR is array (SUB) of INTEGER;
   A, B : ARR;
   procedure P(X : in INTEGER; Y : out INTEGER)
   Δ Y Ξ B [Y = B(X) + 7]
   is
   begin
      Y := B(X) + 7;
   end P;
begin
   Δ A [B(1) = 29]
end MAIN1;
■
=SML
fun check_1a () =
ⓈCN
⊑ A(1) := 1;
   B(1) := 2;
   P(A(1), B(A(1)));
■

=SML
store_mt_results mt_run_fail [
	("check.1a", check_1a, (), gen_fail_msg "check_1_a" 505064 ["A", "B"])
];
=TEX

\section{LITERATE SCRIPT 2}

=SML
new_script{name="MAIN2", unit_type="proc"};
=TEX

ⓈCN
procedure MAIN2 is
   A : INTEGER;
   procedure P (Y : out INTEGER)
   Δ Y Ξ A [Y = A + 9]
   is
   begin
      Y := A + 9;
   end P;
begin
   Δ A [A = 25]
end MAIN2;
■
=SML
fun alias_1 () =
ⓈCN
⊑ A := 1;
   P(A);
■

=SML
store_mt_results mt_run_fail [
	("alias.1", alias_1, (), gen_fail_msg "anti_aliasing_check_1" 505071 ["", "A", "P"])
];
=TEX

\section{LITERATE SCRIPT 3}

=SML
new_script{name="MAIN3", unit_type="proc"};
=TEX

ⓈCN
procedure MAIN3 is
   A : INTEGER;
   procedure P (X : in INTEGER)
   Δ A [A = X + 9]
   is
   begin
      A := X + 8;
   end P;
begin
   Δ A [A = 40]
end MAIN3;
■
=SML
fun alias_2 () =
ⓈCN
⊑ A := 1;
   P(A);
■

=SML
store_mt_results mt_run_fail [
	("alias.2", alias_2, (), gen_fail_msg "anti_aliasing_check_2" 505072 ["", "A", "P"])
];
=TEX

\section{LITERATE SCRIPT 4}

=SML
new_script{name="MAIN4", unit_type="proc"};
=TEX

ⓈCN
procedure MAIN4 is
   A : INTEGER;
   procedure P (X : in INTEGER; Y : out INTEGER)
   Δ Y [Y = X + 16]
   is
   begin
      Y := X + 16;
   end P;
begin
   Δ A [A = 100]
end MAIN4;
■
=SML
fun alias_3 () =
ⓈCN
⊑ A := 1;
   P(A, A);
■

=SML
store_mt_results mt_run_fail [
	("alias.3", alias_3, (), gen_fail_msg "anti_aliasing_check_3" 505073 ["A", "P"])
];
=TEX


\section{EPILOGUE}

=SML
diag_line (summarize_mt_results());
=TEX

\twocolumn[
\section{INDEX OF DEFINED TERMS}]
\printindex
\end{document}
=IGN
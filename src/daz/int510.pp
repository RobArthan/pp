=IGN
********************************************************************************
int510.doc: this file is part of the PPDaz system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% ℤ $Date: 2006/09/16 14:05:32 $ $Revision: 1.28 $ $RCSfile: int510.doc,v $
=IGN

use_file"zz";

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

\def\Title{Hypertext Facilities Test Material}

\def\AbstractText{This document contains the test material for the hypertext link generation facility provided by the function $output\_hypertext\_edit\_script$.}

\def\Reference{ISS/HAT/DAZ/INT510}

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
%% LaTeX2e port: \documentstyle[hol1,11pt,TQ,hyperbasics]{article}
%% LaTeX2e port: \ftlinepenalty=9999
\def\Hide#1{}
\def\Bool{``$\it{:}bool\,$''}
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{DAZ PROJECT}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Hypertext Facilities Test Material}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Hypertext Facilities Test Material}
%% LaTeX2e port: \TPPref{ISS/HAT/DAZ/INT510}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.28 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2006/09/16 14:05:32 $%
%% LaTeX2e port: }}  %% Mandatory field (with sensible default)
%% LaTeX2e port: \TPPstatus{Informal}
%% LaTeX2e port: %\TPPstatus{Informal}
%% LaTeX2e port: \TPPtype{Technical}
%% LaTeX2e port: %\TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{D.J.~King & HAT Team}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & WIN01}
%% LaTeX2e port: \TPPabstract{%
%% LaTeX2e port: This document contains the test material for the hypertext link generation facility provided by the function $output\_hypertext\_edit\_script$.}
%% LaTeX2e port: %\TPPabstractB{}
%% LaTeX2e port: %\TPPabstractC{}
%% LaTeX2e port: %\TPPabstractD{}
%% LaTeX2e port: %\TPPabstractE{}
%% LaTeX2e port: %\TPPabstractF{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port:       Library}}
%% LaTeX2e port: 
%% LaTeX2e port: %\TPPclass{CLASSIFICATION}
%% LaTeX2e port: \def\TPPheadlhs{Lemma 1 Ltd.}
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
\pagebreak
\subsection{Document Cross References}
\bibliographystyle{fmu}
\bibliography{fmu,daz}

\subsection{Changes History}  % to get section number `0.3'

\begin{description}

\item[Issues 1.1 (1995/11/02) - 1.5 (1995/11/07)] Initial Drafts.
\item[Issue 1.6 (1995/11/21)-1.9 (1997/05/29)]
Changing to have one compilation unit per script.
\item[Issue 1.10 (1997/06/03)] Better marking of steps still to do.
\item[Issue 1.11 (1997/07/21)-1.14 (1997/07/24)] IUCT WP 4 syntax changes.
\item[Issue 1.15 (2000/09/07)] Removed dependency on ICL font.
\item[Issue 1.16 (2000/10/27)] CTLE II 1/11:
the formal treatment of nested packages invalidated some of the examples.
\item[Issue 1.17 (2000/10/29)]
further corrections to nested package and other examples;
introduced more page breaks to make the checking of the hyperlinks
easier; changed the shell script it generates to use {\tt xdvi}
rather than {\tt xhdvi} (the latter is obsolete now --- its hyperlink features
have been incorporated in {\tt xdvi}).
\item[Issue 1.18 (2002/03/01)]
New symbol for expansion of statement labels.
\item[Issue 1.20 (2002/08/23)] Removed use of ICL logo font.
\item[Issue 1.21 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.22 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.23 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.24 (2005/05/28)] Allowing for enhancement 117.
\item[Issue 1.26 (2006/03/28)] Allowed for automated state management.
\item[Issue 1.27 (2006/03/28)] Allowed for new {\em open\_scope} command.
\item[Issue 1.29 (2006/09/19)] Allowed for enhancement 165.
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

\subsection{Introduction}

This document contains compliance notation scripts to test the hypertext linking facilities.

\section{LITERATE SCRIPTS}


=SML
use_file "dtd013";
use_file "imp013";
=TEX
Function to clean up before doing a test.
=SML
fun clean_up () = (
	let	val thys = get_descendants "cn" less "cn"
					diff get_cache_theories();
		fun del_thy thy = (force_delete_theory thy handle Fail _ => ());
	in	map del_thy thys
	end;	()
);
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
=TEX
\newpage
\section{TESTING FOR ALL TYPES OF EXPANSION}

=SML
clean_up();
new_script{name = "P", unit_type="spec"};
=TEX


\newpage
\subsection{Compilation Unit}

ⓈCN
│	⟨ compilation unit ⟩					(101)	
■
\newpage
\subsubsection{Replaced by Compilation Unit}

ⓈCN
│  (101) ≡	⟨ compilation unit 1 ⟩			(102)
■

ⓈCN
│  (102) ≡
│  package P is
│
│  	procedure PROC1 (X : INTEGER)
│  	Δ X [X = 0];
│  	
│  	function FUNC1 (X : INTEGER) return INTEGER
│  	Ξ [PoFUNC1 X = X * 2];
│
│  	⟨ kslot ⟩						(103)
│  private
│
│  	PRIV : INTEGER;
│
│  	⟨ kslot ⟩						(104)
│  end P;
■

\newpage
\subsubsection{Replaced by Private Part}

ⓈCN
│  (104) ≡
│
│  	PP : INTEGER;
■

\newpage
\subsubsection{Replaced by Visible Part}

ⓈCN
│
│
│  (103) ≡
│  	X, Y : INTEGER;
│
■


=SML
output_hypertext_edit_script{out_file="int510a1.ex"};
new_script{name = "proc0", unit_type="PROC"};
=TEX
\newpage
\subsection{No k-slots}
ⓈCN
│  procedure PROC0
│  -- an example with no k-slots or spec. statements
│  is
│  	DUMMY: INTEGER;
│  begin
│  	null;
│  end PROC0;
■
=SML
output_hypertext_edit_script{out_file="int510a2.ex"};
=TEX
\newpage
\subsection{k-slot and Specification Statement}
=SML
new_script{name = "proc1", unit_type="PROC"};

ⓈCN
│  procedure PROC1 (X : INTEGER)
│  -- An example with a k-slot and a specification statement
│  is
│  	⟨ PROC1 declarations ⟩				(201)
│  begin
│  	Δ X [X = X⋎0 * 2]					(202)
│  end PROC1;
■

\newpage
\subsubsection{Replaced by Declaration}

ⓈCN
│  (201)
│  	≡	K : INTEGER;
│   		⟨ more PROC1 declarations ⟩			(203)
■

ⓈCN
│  (203)
│  	≡	L : INTEGER;
│   		⟨ more PROC1 declarations ⟩			(204)
■

\newpage
\subsection{Replaced by Statements}

ⓈCN
│  (202) !⊑	⟨ statements ⟩					(205)
■

ⓈCN
│  (205) !⊑	⟨ statements ⟩					(206)
│   		L := X * 4;
│		K := L / 2 + L / 2;
│		X := K / 2;
■
\newpage
\subsection{String and Character Literals}
ⓈCN
│  (204) ≡
│			STR : STRING;
■
ⓈCN
│  (206) !⊑		⟨ more statements ⟩			(207)
│			STR := "This is a string literal";
■

ⓈCN
│  (207) !⊑		⟨ more statements ⟩			(208)
│			CH := "X";
■


ⓈCN
│   (208) !⊑		K :=  ⟦first ⟨3,4,5⟩⟧;
■

=SML
output_hypertext_edit_script{out_file="int510a3.ex"};
=TEX

\newpage
\subsection{2nd Example of k-slot and specification}
=SML
new_script{name = "FUNC1", unit_type="func"};

ⓈCN
│  function FUNC1 (X : INTEGER) return INTEGER
│  -- An example function with a k-slot and a spec. statement
│  is
│    Y : INTEGER;
│  begin
│  	Δ [Y > 99 ∧ X = Y]				(301)
│  end FUNC1;
■
\newpage
\subsection{Refined by Statement}


ⓈCN
│  (301)
│	⊑	Δ [	Y =
│				100
│				* 2 ∧ Y =
│			X
│				]				(302)
■

ⓈCN
│  (302) ⊑	null;
■

=SML
output_hypertext_edit_script{out_file="int510a4.ex"};

=TEX
\newpage
\subsection{No k-slots, but with specifications}
=SML
new_script{name = "PACK1", unit_type="spec"};

ⓈCN
│  package PACK1
│  is
│  	procedure PROC2 (X : INTEGER)
│  	Δ X [X = 0];
│  	
│  	function FUNC2 (X : INTEGER) return INTEGER
│  	Ξ [PACK1oFUNC2 X = X * 2];
│
│  end PACK1;
■
=SML
output_hypertext_edit_script{out_file="int510a5.ex"};
=TEX
\newpage
\subsection{2nd Example of No k-slots, but with specifications}
=SML
new_script{name = "PACK2", unit_type="spec"};

ⓈCN
│	package  PACK2
│	is
│  		procedure PROC21 (X : INTEGER)
│  		Δ X [X = 21];
│
│  	end PACK2;
■
=SML
output_hypertext_edit_script{out_file="int510a6.ex"};
=TEX
\newpage
\subsection{A Longer Example}
=SML
new_script{name = "PACK1", unit_type="body"};

ⓈCN
│  package body PACK1
│  is
│	package PACK3 is
│
│  		procedure PROC21 (X : INTEGER)
│  			Δ X [X = 21];
│	end PACK3;
│       ⟨ body of PACK3 ⟩			( PACK3 )
│  	procedure PROC2 (X : IN OUT INTEGER)
│  	is
│		⟨ PROC2 declarations ⟩			(501)
│  	begin
│  		Δ X [X ≥ 0]					(502)
│  	end PROC2;
│  	
│  	function FUNC2 (X : INTEGER) return INTEGER
│  	Ξ [FUNC2 X = X * 2]
│  	is
│		Y : INTEGER;
│  	begin
│  		Δ Y [Y = X * 2]			(503)
│		return Y;
│  	end FUNC2;
│
│  	procedure PROC3 (X, Y : INTEGER)
│  	Δ Y {
│				Y = 0
│			∨	Y ≥ X
│	     }
│  	is separate;
│
│  	function FUNC3 (X : INTEGER) return INTEGER
│  	Ξ [FUNC3 X = X * 3]
│  	is separate;
│
│  end PACK1;
■
\newpage
\subsubsection{Replaced by Declaration}
=SML
open_scope "PACK1.PROC2";
ⓈCN
│  (501)
│  	≡
│   		M : INTEGER;
■
\newpage
\subsubsection{Refined by Statement}
=SML
open_scope "PACK1.FUNC2";
ⓈCN
│  (503) ⊑
│   		Δ [Y = X + X]	(504)
│   		-- some statements to be added here
│		
■

\newpage
\subsubsection{Replaced by Arbitrary Ada}

ⓈCN
│   (504) !≡
│		IO.OUTPUT ("Diagnostic message");
│   		-- Some Comment or other.
■

\newpage
\subsubsection{Z fragments in Specification Statements}

Expansion for $PACK1.PROC2$.
=SML
open_scope "PACK1.PROC2";
ⓈCN
│  (502) ⊑
│		$CON P : ℤ
│			⦁ Δ X
│				 [P=1, X=P]			(505)
■

ⓈCN
│  (505) -- some general comment
│          ⊑
│		 Δ X
│			 [X=1]					(506)
■

ⓈCN
│  (506) ⊑
│		 Δ X
│			 {true}					(507)
│
│			X := 1;
■

\newpage
\subsubsection{Annotations}
ⓈCN
│  (507) ⊑
│		--# xyz
│		 Δ
│			 [true]					(508)
■

=SML
output_hypertext_edit_script{out_file="int510a7.ex"};
=TEX
\newpage
\subsection{Nested Package}
=SML
new_continuation_script{name = "PACK1.PACK3", unit_type="body"};
ⓈCN
│  (PACK1)
│  	≡
│	package body PACK3 is
│
│  		procedure PROC21 (X : INTEGER)
│  			Δ X [X = 21]
│		is
│		begin
│			Δ X [ X = 21]				(510)
│		end PROC21;
│	begin	COMP := 0;
│  	end PACK3;
■


=SML
output_hypertext_edit_script{out_file="int510a8.ex"};

=TEX
\newpage
\section{TESTING FOR MULTIPLE SCRIPTS}

=SML
new_script {name="PACK1.proc3", unit_type="PROC"};
=TEX

ⓈCN
│  separate (PACK1)
│  procedure PROC3 (X, Y : INTEGER)
│  	Δ {Y = 0
│			∨	Y ≥ X
│	     }
│  is
│  begin
│  	Δ {Y = 0
│			∨	Y ≥ X
│	     }							(601)
│  end PROC3;
■


\newpage
ⓈCN
│  (601) ⊑	null;
■

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


=SML
output_hypertext_edit_script{out_file="int510b.ex"};

=TEX

=DUMP int510.sh
docdvi -e int510a1.ex -e int510a2.ex -e int510a3.ex \
	-e int510a4.ex -e int510a5.ex -e int510a6.ex \
	-e int510a7.ex -e int510a8.ex -e int510b.ex int510
xdvi int510
=TEX
=SML
diag_line(summarize_mt_results());
diag_line("TODO: make & view int510.dvi, by 'sh int510.sh'.");
=TEX


%%\twocolumn[\section{INDEX OF DEFINED TERMS}]
%%\printindex
\end{document}
=IGN


=IGN
********************************************************************************
int512.doc: this file is part of the PPDaz system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% ℤ $Date: 2006/03/28 16:48:35 $ $Revision: 1.18 $ $RCSfile: int512.doc,v $
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

\def\Title{Tests for Annotations}

\def\AbstractText{This document gives Compliance Notation scripts which test the treatment of SPARK annotations.}

\def\Reference{ISS/HAT/DAZ/INT512}

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
%% LaTeX2e port: \documentstyle[hol1,11pt,TQ]{article}
%% LaTeX2e port: \ftlinepenalty=9999
\def\Hide#1{}
\def\Bool{``$\it{:}bool\,$''}
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{DAZ PROJECT}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Tests for Annotations}  %% Mandatory field
%% LaTeX2e port: \TPPref{ISS/HAT/DAZ/INT512}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.18 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2006/03/28 16:48:35 $%
%% LaTeX2e port: }}  %% Mandatory field (with sensible default)
%% LaTeX2e port: \TPPstatus{Approved}
%% LaTeX2e port: %\TPPstatus{Informal}
%% LaTeX2e port: \TPPtype{Technical}
%% LaTeX2e port: %\TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{R.D.~Arthan & HAT Team}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{K.~Blackburn & WIN01}
%% LaTeX2e port: \TPPabstract{%
%% LaTeX2e port: This document gives Compliance Notation scripts which test the treatment of SPARK annotations.
%% LaTeX2e port: }
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
\item[Issue 1.1 (1996/07/10)-1.4 (1996/07/16)] Initial Drafts.
\item[Issue 1.5 (1996/07/17)] Addressed comments from DRA and Praxis.
\item[Issue 1.6 (1997/05/23)] Allowed for one-compilation-unit-per-script rule.
Added a line length test.
\item[Issue 1.7 (2000/06/24)] Made it defensive about the absence of the SPARK examiner.
\item[Issue 1.8 (2000/09/07)] Allowed for bizarre behaviour of {\tt which} on Solaris.
\item[Issue 1.9 (2002/02/21)] Made life a bit easier for running the MS Windows demo copy
\item[Issue 1.10 (2002/03/01)] New symbol for expansion of statement labels.
\item[Issue 1.11 (2002/03/14)] {\it ExtendedIO.execute} has been withdrawn.
\item[Issue 1.12 (2002/08/23)] Removed use of ICL logo font.
\item[Issue 1.13 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.14 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.15 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.16 (2004/02/07)] The SPARK program is now referred to as the Ada program.
\item[Issue 1.17 (2006/03/28)] Allowed for automated state management.
\item[Issue 1.19 (2006/09/19)] Allowed for enhancement 165.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.
\item[2014/09/07]
Now uses ``.sml'' suffix for temporary ML source files.

\item[2015/04/17]
Ported daz source documents onto the Lemma 1 document template
%%%% END OF CHANGES HISTORY %%%%
\end{description}

\subsection{Changes Forecast}
None.

\pagebreak
\section{GENERAL}

\subsection{Scope}

This document contains test data for the Compliance Tool.
It exemplifies the enhancements required under contract ref. CSM/452 (see \cite{ISS/HAT/DAZ/PLN013}).

\subsection{Introduction}

From version 0.6 on, the Compliance Tool has supported the use of SPARK annotations in all places where the SPARK definition requires or permits them.
The method used to implement annotations at version 0.6 allows k-slots to be used in place of annotations in some, but not all, places where an annotation is permitted.
Under contract ref. CSM/452, an enhancement is implemented permitting k-slots to appear wherever an annotation may appear.

This document provides examples of each syntactic position in which an annotation may appear.
This is intended as a cross-check on the enhancement carried out under CSM/452.


\newpage
\section{TEST CASES}
The following list identifies the syntactic positions where the definition of SPARK \cite{PVL92} permits or requires annotations to appear.
The numeric references (6.1, 6.3 etc.) below refer to the sections of the Ada Language Reference Manual \cite{AJPO83} as used to organise the syntax in \cite{PVL92}.

\begin{description}
\item[1. Procedure/function annotations (6.1)]
immediately after the semi-colon which terminates a subprogram declaration.
\item[2. Procedure/function annotations (6.3)]
between the subprogram specification and the reserved word ``{\tt is}'' at the head of a subprogram body.
\item[3. Hide directive (6.3)]
as a substitute for part of a subprogram body.
In the Compliance Tool, hide directives do {\em not} suppress processing of the subprogram body; an arbitrary Ada replacement must be used to achieve that effect.
The Compliance Tool treats the hide directive as an annotation standing as a declaration in the declarative part of the subprogram.
\item[4. Inherit clause (7.1)]
Immediately before a package specification.
\item[5. Package annotation (7.1)]
Immediately after the package name at the head of a package specification.
\item[6. Refinement Definition (7.1)]
Immediately after the package name at the head of a package body.
\item[7.Hide directive (7.1)]
as a substitute for part of a package body or for the private part of package specification.
Much as for hide directives in subprogram bodies, the Compliance Tool treats the hide directive as an annotation standing as a declaration in the declarative part of the package body.
\item[8. Inherit clause (10.1)]
Immediately before a main program annotation.
\item[9. Main program annotation (10.1)]
Immediately before the subprogram body for the main program.
\item[10.  Procedure/function annotations (10.2)]
immediately after the semi-colon which terminates a subprogram declaration considered as a body stub in SPARK.
(These are treated identically with the procedure/function annotations of section 6.1 in the Compliance Tool.)
\end{description}

The SPARK Examiner supports a few other annotations; procedure and function constraints, assert and check predicates and proof functions.
These appear in positions where the annotations above are allowed, and are tried at convenient points in the test below.

The remainder of this document is organised around the above test cases as follows:

\begin{description}
\item[Section \ref{NOKSLOTS}] exhibits each of the test cases not using k-slots
\item[Section \ref{OKKSLOTS}] exhibits the cases where k-slots are already supported at V0.6
\item[Section \ref{BADKSLOTS}] exhibits the cases where k-slots are not supported at V0.6
\end{description}

The Ada files produced by processing this document are intended to be valid input for the SPARK Examiner.
The files intended for the SPARK Examiner are named ``int512??.ada'' where the
first question mark is a letter in the range `a-d'  and the second one is a digit.
Each of these files is intended to be a self-contained piece of input for
a run of the SPARK Examiner. Processing more than one of the files in a run
may cause unintended errors.

The demo version of the SPARK Examiner runs under MS Windows or MS-DOS.
DOS is most convenient for batch processing. This document generates a .BAT file
``int512.bat'' which
will run the tests after shipping the files ``int512??.ada'' and ``int512.wrn''
into a suitable DOS directory.
The necessary files are packed into a zip archive ``int512.zip'' for shipping
to the DOS machine (or ``int512.tar'' if zip is not available).
Unpacking the archive on DOS and running ``int512.bat'' will run the SPARK
Examiner on all the test files and produce an archive of reports and listings
in ``results.zip''.

Currently two test files, ``int512a6.ada'' and ``int512B4.ada''
result in an error under demo version 5.01 of the SPARK Examiner.
This is because SPARK'95 insists on the IMPORT pragma rather than the older
INTERFACE pragma and the documented command-line options to select SPARK'83
do not appear to work.

The tests for the HIDE directive are expected to generate SPARK Examiner warnings.
The options used in the .BAT file help avoid confusing these with errors.


\subsection{Test Setup}
This section gives some ML preliminaries to help run the tests.

Load the test harness:
=SML
use_file "dtd013";
use_file "imp013";
=TEX
Define a function to initialise system for a test case.
=SML
fun test_case {name : string, unit_type:string} = (
        let     val thys = (get_descendants "cn" less "cn")
                                        diff get_cache_theories();
                fun del_thy thy = (force_delete_theory thy handle Fail _ => ());
        in      map del_thy thys
        end;
	new_script{name=name, unit_type=unit_type}
);

=TEX
\newpage
\section{EXAMPLES WITHOUT K-SLOTS}\label{NOKSLOTS}
This section exhibits each of the test cases without using k-slots.
Since this material is only for regression testing, the test cases are grouped together sa convenient.

\subsection{Cases 1 and 5}
This is a convenient point to check proof functions.
=SML
test_case{name="INT512A_1", unit_type="spec"};
=TEX

ⓈCN
  package INT512A_1
    --# own A ;			-- package annotation (case 5)
  is
    procedure P (X : in INTEGER; Y : out INTEGER) ;
   --# derives Y from X ;		-- procedure annotation (case 1)
   A : INTEGER;
   function F return INTEGER ;
   --# global A ;			-- function annotation (case 1)
   --# function H ( X : INTEGER ) return INTEGER ;
					-- proof function
  end INT512A_1 ;
■
=TEX
=SML
output_ada_program{script="-", out_file="int512a1.ada"};
=TEX
\subsection{Cases 1, 2, 5, 8 and 9}\label{CASES12589}
Note: when the SPARK Examiner with VC Generator is used, procedure and function annotations may be immediately followed by procedure and function constraints.
These give pre- and post-conditions for the subprogram and are syntactically just annotations.
For completeness, this facility is tested here, as are assert predicates.
=SML
test_case{name="INT512A_2", unit_type="spec"};
=TEX


ⓈCN
 package INT512A_2
 --# own G ;			-- package annotation (case 5)
 --# initializes G ;			-- package annotation (case 5)
 is
    procedure Q (A : in INTEGER; B : out INTEGER) ;
   --# derives B from A ;		-- procedure annotation (case 1)
   --# pre true ;			-- procedure constraint
   --# post B = 2 * A ;		-- procedure constraint
    G : INTEGER;
 end INT512A_2 ;
■
=SML
output_ada_program{script="-", out_file="int512a2a.ada"};
new_script{name="INT512A_2", unit_type="body"};
ⓈCN
 package body INT512A_2 is
  procedure Q(A : in INTEGER; B : out INTEGER)
  is
   procedure P (X : in INTEGER; Y : out INTEGER)
   --# derives Y from X ;		-- procedure annotation (case 2)
   is
   begin
       Y := X + X;
	--# assert Y = X + X ;
   end P ;
 begin
   P(A, B);
 end Q ;
 begin
   G := 1001;
 end INT512A_2 ;
■
=SML
output_ada_program{script="-", out_file="int512a2b.ada"};
new_script{name="INT512AB", unit_type="func"};
ⓈCN
 with INT512A_2;
 --# inherit INT512A_2 ;		-- inherit clause (case 8)
 --# main_program			-- main program annotation (case 9)
 function INT512AB return INTEGER
 --# global INT512A_2.G ;		-- function annotation (case 2)
 --# return INT512A_2.G ;		-- function constraint
 is
 begin
    return INT512A_2.G ;
 end INT512AB ;
■

=SML
output_ada_program{script="-", out_file="int512a2c.ada"};
ExtendedIO.system"cat int512a2a.ada int512a2b.ada int512a2c.ada > int512a2.ada";
=TEX
\subsection{Cases 3 and 9}
=SML
test_case{name="INT512A3", unit_type="proc"};
=TEX

ⓈCN
 --# main_program			-- main program annotation (case 9)
 procedure INT512A3
 --# derives ;
 is
 --# hide INT512A3				-- hide directive (case 3)
 begin
    null;
 end INT512A3 ;
■
=TEX
=SML
output_ada_program{script="-", out_file="int512a3.ada"};
=TEX
\subsection{Cases 2 and 4}
=SML
test_case{name="INT512A_4_A", unit_type="spec"};
=TEX


ⓈCN
 package INT512A_4_A
 is
   type T is range 1 .. 10 ;
 end INT512A_4_A ;
■
=SML
output_ada_program{script="-", out_file="int512a4a.ada"};
new_script{name="INT512A_4_B", unit_type="spec"};
ⓈCN
 with INT512A_4_A;
 --# inherit INT512A_4_A ;		-- inherit clause (case 4)
 package INT512A_4_B
 is
   procedure P (X : in INT512A_4_A.T; Y : OUT INT512A_4_A.T) ;
   --# derives Y from X ;			-- procedure annotation (case 2)
 end INT512A_4_B ;
■

=SML
output_ada_program{script="-", out_file="int512a4b.ada"};
ExtendedIO.system"cat int512a4a.ada int512a4b.ada > int512a4.ada";
=TEX
\subsection{Cases 1, 5 and 6}
=SML
test_case{name="INT512A_5", unit_type="spec"};
=TEX


ⓈCN
 package INT512A_5
 --# own G ;			-- package annotation (case 5)
 --# initializes G ;			-- package annotation (case 5)
 is
    procedure Q (B : out INTEGER) ;
    --# global G ;			-- procedure annotation (case 1)
    --# derives B from G ;		-- procedure annotation (case 1)
 end INT512A_5 ;
■
=SML
output_ada_program{script="-", out_file="int512a5a.ada"};
new_script{name="INT512A_5", unit_type="body"};
ⓈCN
 package body INT512A_5
 --# own G is X, Y ;			-- refinement definition (case 6)
 is
  X : INTEGER ;
  Y : INTEGER ;
  procedure Q(B : out INTEGER)
   --# global X, Y ;			-- procedure annotation (case 1)
   --# derives B from X, Y ;		-- procedure annotation (case 1)
  is
 begin
   B := X + Y ;
 end Q ;
 begin
   X := 1001;
   Y := 999;
 end INT512A_5 ;
■

=SML
output_ada_program{script="-", out_file="int512a5b.ada"};
ExtendedIO.system"cat int512a5a.ada int512a5b.ada > int512a5.ada";
=TEX
\subsection{Cases 1, 6 and 10}
=SML
test_case{name="INT512A_6", unit_type="spec"};
=TEX


ⓈCN
 package INT512A_6
 --# own G ;
 is
    procedure Q (B : out INTEGER) ;
   --# global G ;			-- procedure annotation (case 1)
    --# derives B from G;		-- procedure annotation (case 1)
 end INT512A_6 ;
■
=SML
output_ada_program{script="-", out_file="int512a6a.ada"};
new_script{name="INT512A_6", unit_type="body"};
ⓈCN
 package body INT512A_6
 --# own G is X ;			-- refinement definition (case 6)
 is
  X : INTEGER;
  procedure Q(B : out INTEGER) ;
  --# global X ;			-- procedure annotation (case 10)
  --# derives B from X ;		-- procedure annotation (case 10)
  pragma INTERFACE(FORTRAN, Q) ;
 end INT512A_6 ;
■

=SML
output_ada_program{script="-", out_file="int512a6b.ada"};
ExtendedIO.system"cat int512a6a.ada int512a6b.ada > int512a6.ada";
=TEX
\subsection{Cases 1 and 7}
=SML
test_case{name="INT512A_7", unit_type="spec"};
=TEX


ⓈCN
 package INT512A_7
 is
    type T is private ;
    procedure Q (B : out INTEGER) ;
    --# derives B from ;		-- procedure annotation (case 1)
 private
--# hide INT512A_7			-- hide directive (case 7)
    type T is range 1 .. 10 ;
 end INT512A_7 ;
■
=SML
output_ada_program{script="-", out_file="int512a7a.ada"};
new_script{name="INT512A_7", unit_type="body"};
ⓈCN
 package body INT512A_7
 is
  --# hide INT512A_7			-- hide directive (case 7)
  procedure Q(B : out INTEGER) ;
  pragma INTERFACE(FORTRAN, Q) ;
 end INT512A_7 ;
■

=SML
output_ada_program{script="-", out_file="int512a7b.ada"};
ExtendedIO.system"cat int512a7a.ada int512a7b.ada > int512a7.ada";
=TEX
\newpage
\section{EXAMPLES WITH K-SLOTS (WORKING AT V0.6)}\label{OKKSLOTS}
This section tests the cases of k-slots as annotations which are already supported at V0.6.
The examples are generally based on the ones in section \ref{NOKSLOTS}.
However, in this section we give a single test for each case, rather than grouping the test cases.

\subsection{Case 1}
This is a convenient point to check procedure and function constraints as well as proof functions.

=SML
test_case{name="INT512B_1", unit_type="spec"};
=TEX

ⓈCN
  package INT512B_1
    --# own A ;			-- package annotation (case 5)
  is
    procedure P (X : in INTEGER; Y : out INTEGER) ;
  ⟨ procedure annotation (case 1) ⟩			( 1001 )

   A : INTEGER;
   function F return INTEGER ;
  ⟨ function annotation (case 1) ⟩			( 1002 )
  end INT512B_1 ;
■
ⓈCN
 (1001) ≡
  --# derives Y from X ;		-- procedure annotation (case 1)
  --# pre true ;			-- procedure constraint
  --# post Y = 2 * X ;		-- procedure constraint
■
ⓈCN
 (1002) ≡
   --# global A ;			-- function annotation (case 1)
   --# return 1000 ;			-- function constraint
   --# function H ( X : INTEGER ) return INTEGER ;
					-- proof function
■
=TEX
=SML
output_ada_program{script="-", out_file="int512b1.ada"};
=TEX
\subsection{Case 3}
For completeness, we also try the assert annotation here.
=SML
test_case{name="INT512B2", unit_type="proc"};
=TEX

ⓈCN
 --# main_program			-- main program annotation (case 9)
 procedure INT512B2
 --# derives ;
 is
 ⟨ hide directive (case 3) ⟩			( 1011 )

 begin
 ⟨ assert annotation ⟩			( 1012 )
    null ;
 end INT512B2 ;
■
ⓈCN
 (1011) ≡ --# hide INT512B2		-- hide directive (case 3)
■
ⓈCN
  (1012) !⊑ --# assert true ;
■

=TEX
=SML
output_ada_program{script="-", out_file="int512b2.ada"};
=TEX
\subsection{Case  7}
=SML
test_case{name="INT512B_3", unit_type="spec"};
=TEX

ⓈCN
 package INT512B_3
 is
    type T is private ;
    procedure Q (B : out INTEGER) ;
    --# derives B from ;		-- procedure annotation (case 1)
 private
 ⟨ hide directive (case 7) ⟩			( 1021 )

    type T is range 1 .. 10 ;
 end INT512B_3 ;
■
ⓈCN
 (1021) ≡ --# hide INT512B_3	-- hide directive (case 7)
■
=SML
output_ada_program{script="-", out_file="int512b3a.ada"};
new_script{name="INT512B_3", unit_type="body"};
ⓈCN
 package body INT512B_3
 is
 ⟨ hide directive (case 7) ⟩			( 1022 )
  procedure Q(B : out INTEGER) ;
  pragma INTERFACE(FORTRAN, Q) ;
 end INT512B_3 ;
■
ⓈCN
 (1022) ≡ --# hide INT512B_3	-- hide directive (case 7)
■
=SML
output_ada_program{script="-", out_file="int512b3b.ada"};
ExtendedIO.system"cat int512b3a.ada int512b3b.ada > int512b3.ada";
=TEX
=TEX
\subsection{Case 10}
=SML
test_case{name="INT512B_4", unit_type="spec"};
=TEX


ⓈCN
 package INT512B_4
 --# own G ;
 is
    procedure Q (B : out INTEGER) ;
   --# global G ;			-- procedure annotation (case 1)
   --# derives B from G;		-- procedure annotation (case 1)
 end INT512B_4 ;
■
=SML
output_ada_program{script="-", out_file="int512b4a.ada"};
new_script{name="INT512B_4", unit_type="body"};
ⓈCN
 package body INT512B_4
 --# own G is X ;			-- refinement definition (case 6)
 is
  X : INTEGER;
  procedure Q(B : out INTEGER) ;
 ⟨ procedure annotations (case 10) ⟩			( 1031 )
  pragma INTERFACE(FORTRAN, Q) ;
 end INT512B_4 ;
■
ⓈCN
 (1031) ≡
  --# global X ;			-- procedure annotation (case 10)
  --# derives B from X ;		-- procedure annotation (case 10)
■

=SML
output_ada_program{script="-", out_file="int512b4b.ada"};
ExtendedIO.system"cat int512b4a.ada int512b4b.ada > int512b4.ada";
=TEX
=TEX
\newpage
\section{EXAMPLES WITH K-SLOTS (NOT WORKING AT V0.6)}\label{BADKSLOTS}
This section tests the cases of k-slots as annotations which are not supported at V0.6.
As in section \ref{OKKSLOTS}, the examples are based on the ones in section \ref{NOKSLOTS} and each case is given a test of its own.
=TEX
\subsection{Case 2}
=SML
diag_line"**** REMAINING TESTS WILL FAIL AT V0.6/V0.7 ****";
test_case{name="INT512C_1", unit_type="spec"};
=TEX


ⓈCN
 package INT512C_1
 --# own G ;			-- package annotation (case 5)
 --# initializes G ;			-- package annotation (case 5)
 is
    procedure Q (A : in INTEGER; B : out INTEGER) ;
   --# derives B from A ;		-- procedure annotation (case 1)
    G : INTEGER;
 end INT512C_1 ;
■
=SML
output_ada_program{script="-", out_file="int512c1a.ada"};
new_script{name="INT512C_1", unit_type="body"};
ⓈCN
 package body INT512C_1 is
  procedure Q(A : in INTEGER; B : out INTEGER)
  is
   procedure P (X : in INTEGER; Y : out INTEGER)
 ⟨ procedure annotation (case 2) ⟩			( 3001 )
   is
   begin
       Y := X + X;
   end P ;
 begin
   P(A, B);
 end Q ;
 begin
   G := 1001;
 end INT512C_1 ;
■
ⓈCN
 (3001) ≡
    --# derives Y from X ;		-- procedure annotation (case 2)
■
=SML
output_ada_program{script="-", out_file="int512c1b.ada"};
new_script{name="INT512C1", unit_type="func"};
ⓈCN
 with INT512C_1;
 --# inherit INT512C_1 ;		-- inherit clause (case 8)
 --# main_program			-- main program annotation (case 9)
 function INT512C1 return INTEGER
 ⟨ function annotation (case 2) ⟩			( 3002 )
 is
 begin
    return INT512C_1.G ;
 end INT512C1 ;
■
ⓈCN
 (3002) ≡
 --# global INT512C_1.G ;	-- function annotation (case 2)
■

=SML
output_ada_program{script="-", out_file="int512c1c.ada"};
ExtendedIO.system"cat int512c1a.ada int512c1b.ada int512c1c.ada > int512c1.ada";
=TEX
\subsection{Case 4}
=SML
test_case{name="INT512C_2_A", unit_type="spec"};
=TEX


ⓈCN
 package INT512C_2_A
 is
   type T is range 1 .. 10 ;
 end INT512C_2_A ;
■
=SML
output_ada_program{script="-", out_file="int512c2a.ada"};
new_script{name="INT512C_2_B", unit_type="spec"};
ⓈCN
 with INT512C_2_A;
 ⟨ inherit clause (case 4) ⟩			( 3011 )
 package INT512C_2_B
 is
   procedure P (X : in INT512C_2_A.T; Y : OUT INT512C_2_A.T) ;
   --# derives Y from X ;		-- procedure annotation (case 2)
 end INT512C_2_B ;
■
ⓈCN
 (3011) ≡ --# inherit INT512C_2_A ;	-- inherit clause (case 4)
■
=SML
output_ada_program{script="-", out_file="int512c2b.ada"};
ExtendedIO.system"cat int512c2a.ada int512c2b.ada > int512c2.ada";
=TEX
\subsection{Case 5}
=SML
test_case{name="INT512C_3", unit_type="spec"};
=TEX


ⓈCN
 package INT512C_3
 ⟨ package annotations (case 5) ⟩			( 3021 )
 is
    procedure Q (B : out INTEGER) ;
    --# global G ;			-- procedure annotation (case 1)
    --# derives B from G ;		-- procedure annotation (case 1)
 end INT512C_3 ;
■
ⓈCN
 (3021) ≡
 --# own G ;				-- package annotation (case 5)
 --# initializes G ;			-- package annotation (case 5)
■

=SML
output_ada_program{script="-", out_file="int512c3.ada"};
=TEX
\subsection{Case 6}
=SML
test_case{name="INT512C_4", unit_type="spec"};
=TEX


ⓈCN
 package INT512C_4
 --# own G ;			-- package annotation (case 5)
 --# initializes G ;			-- package annotation (case 5)
 is
    procedure Q (B : out INTEGER) ;
    --# global G ;		-- procedure annotation (case 1)
    --# derives B from G ;		-- procedure annotation (case 1)
 end INT512C_4 ;
■
=SML
output_ada_program{script="-", out_file="int512c4a.ada"};
new_script{name="INT512C_4", unit_type="body"};
ⓈCN
 package body INT512C_4
 ⟨ refinement definition (case 6) ⟩			( 3031 )
 is
  X : INTEGER ;
  Y : INTEGER ;
  procedure Q(B : out INTEGER)
   --# global X, Y ;			-- procedure annotation (case 1)
   --# derives B from X, Y ;		-- procedure annotation (case 1)
  is
 begin
   B := X + Y ;
 end Q ;
begin
   X := 1001;
   Y := 999;
 end INT512C_4 ;
■
ⓈCN
 (3031) ≡
 --# own G is X, Y ;			-- refinement definition (case 6)
■

=SML
output_ada_program{script="-", out_file="int512c4b.ada"};
ExtendedIO.system"cat int512c4a.ada int512c4b.ada > int512c4.ada";
=TEX

=TEX
\subsection{Cases 8 and 9}
=SML
test_case{name="INT512C_5", unit_type="spec"};
=TEX

ⓈCN
 package INT512C_5
 is
    procedure Q (B : out INTEGER) ;
    --# derives B from ;		-- procedure annotation (case 1)
 end INT512C_5 ;
■
=SML
output_ada_program{script="-", out_file="int512c5a.ada"};
new_script{name="INT512C5A", unit_type="func"};
ⓈCN
 with INT512C_5;
 ⟨ inherit clause etc. (cases 8 and 9) ⟩			( 3041 )
 function INT512C5A return INTEGER
 is
 begin
    return 99 ;
 end INT512C5A ;
■
ⓈCN
 (3041) ≡
 --# inherit INT512C_5 ;	-- inherit clause (case 8)
 --# main_program			-- main program annotation (case 9)
■
=SML
output_ada_program{script="-", out_file="int512c5b.ada"};
ExtendedIO.system"cat int512c5a.ada int512c5b.ada > int512c5.ada";
=TEX
\section{LINES TOO LONG}
If the output line length was not controlled, the following would cause an
SPARK error.
=SML
test_case{name="INT512D_1", unit_type="spec"};
=TEX

ⓈCN
  package INT512D_1
    --# own A ,		-- package annotation (case 5)
    --#  A11111111, B11111111, C11111111,
     --#  D11111111, E11111111, F11111111,
     --#  G11111111, H11111111, I11111111,
     --# J11111111, K11111111, L11111111, M11111111,
      --# N11111111, O11111111, P11111111, Q11111111,
      --# R11111111, S11111111, T11111111,
      --# U11111111, V11111111, W11111111,
      --# X11111111, Y11111111, Z11111111, AA11111111,
      --# BB11111111, CC11111111, DD11111111,
      --# EE11111111, FF11111111, GG11111111,
      --# HH11111111, II11111111;
  is
    procedure P (X : in INTEGER; Y : out INTEGER) ;
   --# derives Y from X ;
     A, A11111111, B11111111, C11111111,
     D11111111, E11111111, F11111111,
     G11111111, H11111111, I11111111,
     J11111111, K11111111, L11111111, M11111111,
     N11111111, O11111111, P11111111, Q11111111,
     R11111111, S11111111, T11111111,
     U11111111, V11111111, W11111111,
     X11111111, Y11111111, Z11111111, AA11111111,
     BB11111111, CC11111111, DD11111111,
     EE11111111, FF11111111, GG11111111,
     HH11111111, II11111111 : INTEGER;
function F return INTEGER ;
   --# global A ,
      --#  A11111111, B11111111, C11111111,
      --#  D11111111, E11111111, F11111111,
      --#  G11111111, H11111111, I11111111,
      --# J11111111, K11111111, L11111111, M11111111,
      --# N11111111, O11111111, P11111111, Q11111111,
      --# R11111111, S11111111, T11111111,
      --# U11111111, V11111111, W11111111,
      --# X11111111, Y11111111, Z11111111, AA11111111,
      --# BB11111111, CC11111111, DD11111111,
      --# EE11111111, FF11111111, GG11111111,
      --# HH11111111, II11111111;
   --# function H ( X : INTEGER ) return INTEGER ;
					-- proof function
  end INT512D_1 ;
■
=TEX
=SML
output_ada_program{script="-", out_file="int512d1.ada"};
=TEX

\section{EPILOGUE}
The main check on the tests here is that the generated SPARK code is acceptable input for the SPARK examiner.
The shell script created by the following runs the SPARK examiner and generates an ML file which can be used to pass the names of any problematic source files back to the test harness.

We use {\tt test} to test the standard output from {\tt findfile} below
to see if {\tt gnatchop} is on the path. This is because {\tt which}
(a) returns 0 (success) when it cannot find the program on Solaris
and (b) behaves strangely (e.g., hangs) when not called from {\tt csh}.

=DUMP int512.sh
MLFILE=int512.errorfiles.sml
echo hidden_parts >int512.wrn
echo pragma interface >>int512.wrn
echo "==== Test Report from INT512 ====" > int512.run.log
BAD=
if	test -f `findfile spark $PATH`
then	for source in int512??.ada
	do
		spark -noecho -warning_file=int512.wrn $source
		echo "=== "$source" ===" >> int512.run.log
		cat spark.rep >> int512.run.log
		egrep -s 'No errors found' spark.rep || BAD=$BAD" "$source
	done
	{	echo 'val error_files = '
		for i in $BAD
		do	echo '"'$i'"::'
		done
		echo 'nil;' ; } >$MLFILE
else	cat int512??.ada > int512.ada
	echo '***' The module test generated a warning: SPARK Examiner is not available
	echo '***' Please inspect the file int512.ada for errors
	echo 'val error_files = [];' >$MLFILE
fi
# The following is a desperate attempt to work on Solaris (with mostly naff echo)
# and Linux (which often doesn't come with dos2unix).
if	test "`echo -e`" != ""
then	ECHO='echo'
else	ECHO='echo -e'
fi
for f in int512??.ada
do
	$ECHO '\\winspark\\examiner\\dosspark /w=int512.wrn /r='`basename $f .ada` $f'\r'
done	> int512.bat
	$ECHO 'zip results.zip *.lst *.rep\r' >>int512.bat
if	test -f `findfile zip $PATH`
then	zip int512.zip int512??.ada int512.wrn int512.bat
else	tar -f int512.tar int512??.ada int512.wrn int512.bat
fi
=TEX
The following ML executes the shell script and then loads the ML file it generates.

=SML
fun go () =
let	val _ = ExtendedIO.system"sh int512.sh >int512.sml 2>&1";
	val s = open_in "int512.sml";
	val buf :string ref = ref "";
in	while (buf := ExtendedIO.input_line s; !buf <> "")
		do  BasicIO.output(std_out, !buf);
	close_in s
end;
go();
val error_files = ["int512.sh"];
use_file"int512.errorfiles.sml";
store_mt_results (fn _ => (map (fn x => (x, false)) error_files)) ();
=TEX

The following command reports on the results.

=SML
diag_line (summarize_mt_results());
=TEX

\pagebreak
%\HOLindexOff
\let\oldsection=\section
\let\oldsubsection=\subsection
\def\section{\pagebreak\oldsubsection}
\def\subsection{\subsubsection}
%\HOLindexOn
%\twocolumn[\section{INDEX OF DEFINED TERMS}]
%\printindex
\end{document}


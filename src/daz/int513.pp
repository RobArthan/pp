=IGN
********************************************************************************
int513.doc: this file is part of the PPDaz system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% ℤ $Date: 2006/09/19 11:24:22 $ $Revision: 1.37 $ $RCSfile: int513.doc,v $
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

\def\Title{IUCT: Tests for Enhancements}

\def\AbstractText{This document gives scripts to test the new features implemented under the industrial upgrades contract (CSM/677).}

\def\Reference{ISS/HAT/DAZ/INT513}

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
%% LaTeX2e port: 
%% LaTeX2e port: % TQtemplate.tex
%% LaTeX2e port: % use_file "daz_init";
%% LaTeX2e port: % use_file "int502";
%% LaTeX2e port: % z_print_theory"-";
%% LaTeX2e port: % open CNZGenerator;
%% LaTeX2e port: % print_ada_program();
%% LaTeX2e port: \documentstyle[hol1,11pt,TQ]{article}
%% LaTeX2e port: \ftlinepenalty=9999
\def\Hide#1{}
\def\Bool{``$\it{:}bool\,$''}
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{DAZ PROJECT}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{IUCT: Tests for Enhancements}  %% Mandatory field
%% LaTeX2e port: \TPPref{ISS/HAT/DAZ/INT513}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.37 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2006/09/19 11:24:22 $%
%% LaTeX2e port: }}  %% Mandatory field (with sensible default)
%% LaTeX2e port: \TPPstatus{Informal}
%% LaTeX2e port: %\TPPstatus{Informal}
%% LaTeX2e port: \TPPtype{Technical}
%% LaTeX2e port: %\TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{R.D.~Arthan & BRA01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{K.Blackburn & BRA01}
%% LaTeX2e port: \TPPabstract{%
%% LaTeX2e port: This document gives scripts to test the new features implemented under the industrial upgrades contract (CSM/677).
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
\item[Issue 1.1 (1997/07/03)] First Draft
\item[Issues 1.2 (1997/07/07),1.3 (1997/07/07)] Stage 1 WPs being filled in.
\item[Issue 1.4 (1997/07/21)] IUCT WP 4 syntax change.
\item[Issue 1.5 (1997/08/01)] IUCT WP 3, 5, and 7 material added.
\item[Issue 1.6 (1997/08/01)] IUCT WP 4 material added from RDA work.
\item[Issue 1.7 (1997/08/12)] Tests for IUCT additional changes.
\item[Issue 1.8 (1999/02/24)] Modified for CUTDOWNVERSION.
\item[Issue 1.9 (2000/06/24)] Modified for June 2000 enhancements.
\item[Issue 1.10 (2000/10/25)] CTLE II R2/1: global variable unsoundness.
\item[Issue 1.11 (2000/10/26)] CTLE II R1/11: nested packages.
\item[Issue 1.12 (2002/03/14)] {\it ExtendedIO.execute} has been withdrawn.
\item[Issue 1.13 (2002/05/22)] {\it cn\_automatic\_line\_splitting} must now be at least 20.
\item[Issue 1.14 (2002/08/23)] Removed use of ICL logo font.
\item[Issue 1.15 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.16 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.17 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.18 (2003/03/17)] Allowed for improved type-checking error messages.
\item[Issue 1.19 (2003/07/17)] Allowed for slight changes to checks on frames and checks on global dependencies lists.
\item[Issue 1.21 (2004/02/07)] The SPARK program is now referred to as the Ada program.
\item[Issue 1.22 (2004/07/17)] Allowed for ISO Z precedences and associativities that {\Product} now uses.
\item[Issue 1.23 (2005/02/26)] Compliance Notation reserved words are now prefixed by a dollar sign.
\item[Issue 1.24 (2005/05/28)] Allowed for various changes to error handling.
\item[Issue 1.25 (2006/01/16), 1.26 (2006/03/23)] Allowed for enhancement 117.
\item[Issues 1.28 (2006/03/28), 1.29 (2006/03/28)] Allowed for automated state management.
\item[Issue 1.31 (2006/04/07)] Allowed for insistence on canonical names in Z under enhancement 117
\item[Issue 1.32 (2006/04/11)] Allowed for new uniform checks on Z names
\item[Issue 1.33 (2006/06/01)] accommodated enhancement 139 - 1-theory-per-subprogram.
\item[Issue 1.34 (2006/09/16)] Allowed for new {\em open\_scope} command.
\item[Issue 1.35 (2006/09/18)] Allowed for changed source of error messages (arising from issue 189).
\item[Issue 1.36 (2006/09/18)] Tidied usage of {\em new\_script}.
\item[Issue 1.37 (2006/09/19)] Allowed for enhancement 165.
\item[Issue 1.38 (2010/02/11)] Removed obsolete CUTDOWNVERSION option.
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
This document contains test data for the Industrial Upgrades to the Compliance Tool being carried out for DERA under contract CSM/677.
The specification changes for the upgrades are given in \cite{ISS/HAT/DAZ/HLD504}.

\subsection{Introduction}
This document contains specific tests for each of the 10 changes to the Compliance Tool identified as WP1 to WP10 in \cite{ISS/HAT/DAZ/PLN017}.
Note that in the changes to the specifications given in \cite{ISS/HAT/DAZ/HLD504}, WP2 and WP10 are identified, giving only 9 packages of  specification and implementation;
however, it is felt appropriate to provide independent tests for WP10 reflecting the spirit of the requirement.

Sections \ref{WP1} to \ref{WP10} define the tests for changes WP1 to WP10 respectively.
In some cases (e.g., the bug-fix work package, WP8), the module tests give adequate coverage and so a reference to the module test document suffices.

Section \ref{Appendix} contains tests for the additional changes specified in the appendix of \cite{ISS/HAT/DAZ/HLD504}.
\newpage
\subsection{Preliminaries}

=SML
use_file "dtd013";
use_file "imp013";
=TEX
Function to clean up before doing a test.
=SML
val reset_cn = pending_reset_cn_state();
fun clean_up () = (
	let	val thys = get_descendants "z_library"
					less "cn" less "z_library"
					diff get_cache_theories();
		fun del_thy thy =
  (force_delete_theory thy handle Fail _ => ());
=SML
	in	
  map del_thy thys; reset_cn()
	end;	()
);
=TEX
Sometimes the success of a test just depends on whether or not
a computation fails:
=SML
fun check_fail (f: unit -> 'a) : bool = (
		(f (); false)
	handle Fail msg => (
		diag_line (get_message_text msg);
		true
	)
);
(*val check_ok : (unit -> 'a) -> bool = not o check_fail;*)
fun check_ok(f) = not (check_fail f);
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{WP 1. Z schemas in Ada specifications}\label{WP1}
\subsubsection{Test Objectives}
The test is required to exercise the new function
{\em new\_script1}.
.
This function allows a library of Z declarations (given as a list
of {\Product} theory names) to be accessed by a literate scripts.
The test script is in 5 parts as follows:

\begin{tabular}{|l|l|}\hline
{\bf Part} & {\bf Description}\\\hline\hline
1.1 & We check a simple case of normal operation \\\hline

1.2 & Check what happens if the list of theories is empty \\\hline

1.3 & Check that all members of the list are brought into scope \\\hline

1.4 & Check what happens with duplicates in the list \\\hline

1.5 & Check what happens with non-existent theories in the list \\\hline
\end{tabular}

\subsubsection{Test Script}
\paragraph{Part 1.1}\

First we introduce a new theory as a child of the theory ``cn'' to be used as the library theory in the rest of the test.
=SML
clean_up();
open_theory"z_library";
new_theory "int513.1.1.A";
=TEX
┌ Swap ───────────
│ X⋎0, X, Y⋎0, Y : ℤ
├──────
│ X = Y⋎0 ∧ Y = X⋎0
└──────────────
Now we define a package containing a procedure defined in terms of the schema in the library theory.
=SML
new_script1{name="INT513_1_1_B", unit_type="spec",
	library_theories=["int513.1.1.A"]};
=TEX
ⓈCN
 package INT513_1_1_B
 is
    procedure SWAP (X, Y : in out INTEGER)
     Δ X, Y [ Swap ];
 end INT513_1_1_B;
■
Now we should be able to use the package in another compilation unit:
=SML
new_script1{name="INT513_1_1_C", unit_type="proc",
	library_theories=["int513.1.1.A"]};
=TEX
ⓈCN
 with INT513_1_1_B;
 procedure INT513_1_1_C
 is
    A, B : INTEGER;
 begin
    Δ A, B [ Swap[A⋎0/X⋎0, A/X, B⋎0/Y⋎0, B/Y] ] (1)
 end INT513_1_1_C;
■
ⓈCN
 (1) ⊑ INT513_1_1_B.SWAP(A, B);
■
The resulting VCs should be provable.
=SML
fun int513_1_1_prove_vcs () = (
	(map (fn (_, (_, t)) => tac_proof(([], t), cn_vc_simp_tac[])))
	(get_conjectures "-")
);
=TEX
=SML
store_mt_results_show
mt_run [
    ("int513.1.1", check_ok, int513_1_1_prove_vcs, true)
];
=TEX
\paragraph{Part 1.2}\

An empty list of library theories should just work.
=SML
fun int513_1_2() = (
	new_script1{name="INT513_2_1", unit_type="proc",
		library_theories=[]}
);
=TEX
=SML
clean_up();
store_mt_results_show
mt_run [
    ("int513.1.2", check_ok, int513_1_2, true)
];
=TEX
\paragraph{Part 1.3}\

This just double checks that it does look at all of the list by
creating 10 library theories and checking that they all become parents of the
script theory.
=SML
fun int513_1_3_make_theory (i : int) : string = (
	let	val x = "int513_1_3_" ^ string_of_int i;
	in	open_theory "z_library";
		new_theory x;
		x
	end
);
clean_up();
val int513_1_3_thys = map int513_1_3_make_theory (interval 1 10);
=SML
new_script1{name="INT513_1_3", unit_type="proc",
	library_theories=int513_1_3_thys};
fun int513_1_3_chk () = (
	int513_1_3_thys diff get_parents"-" = []
);
=TEX
=SML
store_mt_results_show
mt_run [
    ("int513.1.3", int513_1_3_chk, (), true)
];
=TEX
\paragraph{Part 1.4}\

Duplicates are accepted.
=SML
clean_up();
open_theory"z_library";
new_theory"int513.1.4.A";
fun int513_1_4() = (
	new_script1{name="INT513_1_4", unit_type="proc",
		library_theories=["int513.1.4.A", "int513.1.4.A"]}
);
=TEX
=SML
store_mt_results_show
mt_run [
    ("int513.1.4", check_ok, int513_1_4, true)
];
=TEX
=TEX
\paragraph{Part 1.5}\

Non-existent theories are not accepted.
=SML
clean_up();
open_theory"z_library";
fun int513_1_5() = (
	new_script1{name="INT513_1_5", unit_type="proc",
		library_theories=["No Such Theory!"]}
);
=TEX
=SML
store_mt_results_show
mt_run [
    ("int513.1.5", check_fail, int513_1_5, true)
];
=TEX

\subsection{WP 2. Earlier type checking of package specifications}\label{WP2}

\subsubsection{Test Objectives}
The cases to be tested are shown in the following table.
In each case, the test must exhibit an error either by using a name
that has not been declared or by using a declared name in a fashion
incompatible with its type.

\begin{tabular}{|l|l|}\hline
{\bf Part} & {\bf Description}\\\hline\hline
2.1 & Right-hand side of type declaration \\\hline
2.2 & Right-hand side of auxiliary variable declaration \\\hline
2.3 & Subprogram specification statement \\\hline
2.4 & Subprogram parameter specification \\\hline
\end{tabular}

\subsubsection{Test Script}
\paragraph{Part 2.1}\
=SML
fun int513_2_1_A () =
ⓈCN
package INT513_2_1_A is
 type T2_1_A is range 1 .. UNDEFINED_UPPER_BOUND;
end INT513_2_1_A;
■
=SML
clean_up();
new_script{name="INT513_2_1_A", unit_type="spec"};
=TEX
=SML
store_mt_results_show
mt_run [
    ("int513.2.1.A", check_fail, int513_2_1_A, true)
];
=TEX
=SML
fun int513_2_1_B () =
ⓈCN
package INT513_2_1_B is
 subtype T2_1_B is UNDEFINED_TYPE range 1 .. 10;
end INT513_2_1_B;
■
=SML
clean_up();
new_script{name="INT513_2_1_B", unit_type="spec"};
=TEX
=SML
store_mt_results_show
mt_run [
    ("int513.2.1.B", check_fail, int513_2_1_B, true)
];
=TEX
\paragraph{Part 2.2}\

=SML
fun int513_2_2_A () =
ⓈCN
package INT513_2_2_A is
  $auxiliary AuxVar : ℙ UNDEFINED_Z_SET ;
  procedure P
  Δ AuxVar [ AuxVar = ∅ ];
end INT513_2_2_A;
■
=SML
clean_up();
new_script{name="INT513_2_2_A", unit_type="spec"};
=TEX
=SML
store_mt_results_show
mt_run [
    ("int513.2.2.A", check_fail, int513_2_2_A, true)
];
=TEX
=SML
fun int513_2_2_B () =
ⓈCN
package INT513_2_2_B is
  $auxiliary AuxVar : { X : ℕ | X.1 > 0 } ;
  procedure P
  Δ AuxVar [ AuxVar = ∅ ];
end INT513_2_2_B;
■
=SML
clean_up();
new_script{name="INT513_2_2_B", unit_type="spec"};
=TEX
=SML
store_mt_results_show
mt_run [
    ("int513.2.2.B", check_fail, int513_2_2_B, true)
];
=TEX
\paragraph{Part 2.3}\

=SML
fun int513_2_3_A () =
ⓈCN
package INT513_2_3_A is
  procedure P
  Δ UndefinedVar [ UndefinedVar = 0 ];
end INT513_2_3_A;
■
=SML
clean_up();
new_script{name="INT513_2_3_A", unit_type="spec"};
=TEX
=SML
store_mt_results_show
mt_run [
    ("int513.2.3.A", check_fail, int513_2_3_A, true)
];
=TEX
=SML
fun int513_2_3_B () =
ⓈCN
package INT513_2_3_B is
  function f return UNDEFINED_TYPE
  Ξ  [ true ];
end INT513_2_3_B;
■
=SML
clean_up();
new_script{name="INT513_2_3_B", unit_type="spec"};
=TEX
=SML
store_mt_results_show
mt_run [
    ("int513.2.3.B", check_fail, int513_2_3_B, true)
];
=TEX
\paragraph{Part 2.4}\

=SML
fun int513_2_4_A () =
ⓈCN
package INT513_2_4_A is
  procedure P (X : UNDEFINED_TYPE)
  Δ X [ X = 0 ];
end INT513_2_4_A;
■
=SML
clean_up();
new_script{name="INT513_2_4_A", unit_type="spec"};
=TEX
=SML
store_mt_results_show
mt_run [
    ("int513.2.4.A", check_fail, int513_2_4_A, true)
];
=TEX
=SML
fun int513_2_4_B () =
ⓈCN
package INT513_2_4_B is
  function F (X : UNDEFINED_TYPE) return BOOLEAN
  Ξ X [ F(X) > X ];
end INT513_2_4_B;
■
=SML
clean_up();
new_script{name="INT513_2_4_B", unit_type="spec"};
=TEX
=SML
store_mt_results_show
mt_run [
    ("int513.2.4.B", check_fail, int513_2_4_B, true)
];
=TEX
\subsection{WP 3. Variable scope and specification statements}\label{WP3}

\subsubsection{Test Objectives}
\begin{enumerate}
\item
The primary objective is to demonstrate that a variable from one package may be
referred to in a specification statement in another package without
affecting the resulting Ada program text.
This is done using a references clause.
\item
One secondary objective is to demonstrate that a references clause is not required for a package mentioned in a with clause.
\item
Another secondary objective is to demonstrate that context clauses do not have a transitive effect.
That is if package A refers to package B, and B to C, then, even so, if package A wishes to mention a variable from package C it must directly mention it.
\end{enumerate}

Note that the solution to the problem actually makes more than just Ada variables visible.
\subsubsection{Test Script}

First we address objectives 1 and 2:
=SML
clean_up();
new_script{name="INT513_3_1", unit_type="spec"};
ⓈCN
package int513_3_1 is
X : INTEGER;
end int513_3_1;
■
=SML
new_script{name="INT513_3_2", unit_type="spec"};
ⓈCN
package int513_3_2 is
Y : INTEGER;
end int513_3_2;
■
=SML
new_script{name="INT513_3_3", unit_type="spec"};
ⓈCN
with int513_3_2;
package int513_3_3 is
Z : INTEGER;
procedure P
 Δ INT513_3_3oZ [ true ];
end int513_3_3;
■
=SML
output_ada_program{script="-", out_file="int513.3.2_1.ada"};
=SML
clean_up();
new_script{name="INT513_3_1", unit_type="spec"};
ⓈCN
package int513_3_1 is
X : INTEGER;
end int513_3_1;
■
=SML
new_script{name="INT513_3_2", unit_type="spec"};
ⓈCN
package int513_3_2 is
Y : INTEGER;
end int513_3_2;
■
=SML
new_script{name="INT513_3_3", unit_type="spec"};
ⓈCN
with int513_3_2;
$references int513_3_1;
package int513_3_3 is
Z : INTEGER;
procedure P
 Δ INT513_3_3oZ Ξ INT513_3_1oX, INT513_3_2oY [ INT513_3_1oX = INT513_3_2oY ];
end int513_3_3;
■
=SML
output_ada_program{script="-", out_file="int513.3.2_2.ada"};
=TEX
=SML
fun get_diff () = (
	let	val  _ = ExtendedIO.system
			"diff int513.3.2_1.ada int513.3.2_2.ada >int513.diff 2>&1";
		val s = open_in "int513.diff";
		val res = ExtendedIO.input_line s;
	in 	close_in s;
		res
	end
);
store_mt_results_show
mt_run [
    ("int513.3.1", get_diff, (), "")
];
=TEX

Then objective 3:
=SML
clean_up();
new_script{name="INT513_3_5", unit_type="spec"};
ⓈCN
package int513_3_5 is
X : INTEGER;
end int513_3_5;
■
=SML
new_script{name="INT513_3_6", unit_type="spec"};
ⓈCN
$references int513_3_5;
package int513_3_6 is
Y : INTEGER;
procedure P
 Δ INT513_3_6oY Ξ INT513_3_5oX [ INT513_3_5oX = INT513_3_6oY ];
end int513_3_6;
■
=SML
new_script{name="INT513_3_7", unit_type="spec"};
fun int513_3_6_fail () =
ⓈCN
$references int513_3_6;
package int513_3_7 is
Z : INTEGER;
procedure P
 Δ INT513_3_7oZ Ξ INT513_3_5oX, INT513_3_6oY [ INT513_3_5oX = INT513_3_6oY, INT513_3_7oZ = INT513_3_5oX];
end int513_3_7;
■
=SML
fun int513_3_6_succ () =
ⓈCN
$references int513_3_5, int513_3_6;
package int513_3_7 is
Z : INTEGER;
procedure P
 Δ INT513_3_7oZ Ξ INT513_3_6oY, INT513_3_5oX[ INT513_3_5oX = INT513_3_6oY, INT513_3_7oZ = INT513_3_5oX];
end int513_3_7;
■
=SML
store_mt_results_show
mt_run_fail [
    ("int513.3.2", int513_3_6_fail, (),
	gen_fail_msg "set_cn_scope" 514002 ["INT513_3_5oX"])
];
store_mt_results_show
mt_run [
    ("int513.3.3", int513_3_6_succ, (), ())
];
=TEX

% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{WP 4. Ada functions with global dependencies}\label{WP4}

\subsubsection{Test Objectives}
This enhancement introduces new syntax for function specifications allowing the user to say what global variables the function depends upon.
The test script is in 5 parts as follows:

\begin{tabular}{|l|l|}\hline
{\bf Part} & {\bf Description}\\\hline\hline
4.1 & Regression test: check that a function without global dependencies can be developed as before. \\\hline

4.2 & Check functions with 0, 1 and many global dependencies and 0, 1 and many parameters. \\\hline

4.3 & Check that access to outer local variables works OK. \\\hline

4.4 & Check that functions may not access variables other than those indicated. \\\hline
\end{tabular}
\subsubsection{Test Script}
\paragraph{4.1}\

For the regression test, we show specification and implementation of a function in a package and its use in a main program.
=SML
clean_up();
new_script{name= "INT513_4_1_A", unit_type="spec"};
ⓈCN
package INT513_4_1_A is
  function F(X, Y:INTEGER) return INTEGER
  Ξ [ X + 1 < Y, X < INT513_4_1_AoF(X, Y) < Y ];
end INT513_4_1_A;
■
=SML
new_script{name= "INT513_4_1_A", unit_type="body"};
ⓈCN
package body INT513_4_1_A is
  function F(X, Y:INTEGER) return INTEGER
  Ξ [ X + 1 < Y, X < F(X, Y) < Y ]
  is
  begin
    return X + 1;
  end F;
end INT513_4_1_A;
■

This should produce a number of easily-provable VCs:
=SML
fun int513_4_1_prove_vcs () = (
	(map (fn (_, (_, t)) => tac_proof(([], t),
		cn_vc_simp_tac[] THEN REPEAT strip_tac THEN asm_rewrite_tac[])))
	(get_conjectures "-")
);
=TEX
=SML
store_mt_results_show
mt_run [
    ("int513.4.1.1", check_ok, int513_4_1_prove_vcs, true)
];
=TEX
=SML
new_script{name= "INT513_4_1_B", unit_type="proc"};
ⓈCN
with INT513_4_1_A;
procedure INT513_4_1_B
is
 A, B, C : INTEGER;
begin
 Δ B [A + 1 < B] (1)
 Δ C [A + 1 < B, A < C < B] (2)
end INT513_4_1_B;
■
ⓈCN
 (1) ⊑ B := A + 2;
■
ⓈCN
 (2) ⊑ C := INT513_4_1_A.F(A, B);
■
=SML
set_goal([], get_conjecture"-""vc1_1");
a(PC_T1 "z_lin_arith" prove_tac[]);
store_mt_results_show mt_run [("int513.4.1.2", check_ok, pop_thm, true)];
=TEX
=SML
set_goal([], get_conjecture"-""vc2_1");
a(z_strip_tac THEN z_strip_tac);
a(all_fc_tac[z_get_specⓩINT513_4_1_AoF⌝]);
a(REPEAT strip_tac);
store_mt_results_show mt_run [("int513.4.1.3", check_ok, pop_thm, true)];
=TEX
\paragraph{4.2}\

For this test, we interpret ``many'' as 3 and specify, implement and use a package of functions with the specified numbers of global dependencies and parameters.
=SML
clean_up();
new_script{name= "INT513_4_2_A", unit_type="spec"};
ⓈCN
package INT513_4_2_A is
  A, B, C : INTEGER;
  function F00 return INTEGER
  Ξ [ INT513_4_2_AoF00 > 10 ];
  function F10 return INTEGER
  Ξ INT513_4_2_AoA [ INT513_4_2_AoF10 INT513_4_2_AoA = INT513_4_2_AoA ];
  function F01 (X : INTEGER) return INTEGER
  Ξ [ INT513_4_2_AoF01 X = X ];
  function F11 (X : INTEGER) return INTEGER
  Ξ INT513_4_2_AoA [ INT513_4_2_AoF11 INT513_4_2_AoA X = INT513_4_2_AoA - X ];
  function F30  return INTEGER
  Ξ INT513_4_2_AoA, INT513_4_2_AoB, INT513_4_2_AoC [ INT513_4_2_AoF30 (INT513_4_2_AoA, INT513_4_2_AoB, INT513_4_2_AoC) = INT513_4_2_AoA + INT513_4_2_AoB + INT513_4_2_AoC ];
  function F03 (X, Y, Z : INTEGER) return INTEGER
  Ξ [ INT513_4_2_AoF03 (X, Y, Z) = X + Y + Z ];
  function F33 (X, Y, Z : INTEGER)  return INTEGER
  Ξ INT513_4_2_AoA, INT513_4_2_AoB, INT513_4_2_AoC [ INT513_4_2_AoF33 (INT513_4_2_AoA, INT513_4_2_AoB, INT513_4_2_AoC) (X, Y, Z) = INT513_4_2_AoA + INT513_4_2_AoB + INT513_4_2_AoC - (X + Y + Z) ];
end INT513_4_2_A;
■
=SML
new_script{name= "INT513_4_2_A", unit_type="body"};
ⓈCN
package body INT513_4_2_A is
  function F00 return INTEGER
  Ξ [ F00 > 10 ] is begin return 11; end F00;
  function F10 return INTEGER
  Ξ INT513_4_2_AoA [ F10 INT513_4_2_AoA = INT513_4_2_AoA ] is begin return A; end F10;
  function F01 (X : INTEGER) return INTEGER
  Ξ [ F01 X = X ] is begin return X; end F01;
  function F11 (X : INTEGER) return INTEGER
  Ξ INT513_4_2_AoA [ F11 INT513_4_2_AoA X = INT513_4_2_AoA - X ] is begin return A - X; end F11;
  function F30  return INTEGER
  Ξ INT513_4_2_AoA, INT513_4_2_AoB, INT513_4_2_AoC [ F30 (INT513_4_2_AoA, INT513_4_2_AoB, INT513_4_2_AoC) = INT513_4_2_AoA + INT513_4_2_AoB + INT513_4_2_AoC ] is begin return A + B + C; end F30;
  function F03 (X, Y, Z : INTEGER) return INTEGER
  Ξ [ F03 (X, Y, Z) = X + Y + Z ] is begin return X + Y + Z; end F03;
  function F33 (X, Y, Z : INTEGER)  return INTEGER
  Ξ INT513_4_2_AoA, INT513_4_2_AoB, INT513_4_2_AoC [ F33 (INT513_4_2_AoA, INT513_4_2_AoB, INT513_4_2_AoC) (X, Y, Z) = INT513_4_2_AoA + INT513_4_2_AoB + INT513_4_2_AoC - (X + Y + Z) ]
  is begin return A + B + C - (X + Y + Z); end F33;
end INT513_4_2_A;
■
This should produce a number of easily-provable VCs:
=SML
fun int513_4_2_prove_vcs () = (
	(map (fn (_, (_, t)) => tac_proof(([], t),
		cn_vc_simp_tac[] THEN REPEAT strip_tac THEN asm_rewrite_tac[])))
	(get_conjectures "-")
);
=TEX
=SML
store_mt_results_show
mt_run [
    ("int513.4.2.1", check_ok, int513_4_2_prove_vcs, true)
];
=TEX
=SML
new_script{name= "G", unit_type="func"};
ⓈCN
with INT513_4_2_A;
function G return INTEGER
Ξ INT513_4_2_AoA, INT513_4_2_AoB, INT513_4_2_AoC
 [ G(INT513_4_2_AoA, INT513_4_2_AoB, INT513_4_2_AoC) > 10 ]
is
begin
 return
  INT513_4_2_A.F00 +
  INT513_4_2_A.F10 -
  INT513_4_2_A.F01(INT513_4_2_A.A) +
  INT513_4_2_A.F11(INT513_4_2_A.A) +
  INT513_4_2_A.F30 -
  INT513_4_2_A.F03(INT513_4_2_A.A, INT513_4_2_A.B, INT513_4_2_A.C) +
  INT513_4_2_A.F33(INT513_4_2_A.A, INT513_4_2_A.B, INT513_4_2_A.C) ;
end G;
■
=TEX
=SML
val thms4_2 = map z_get_spec [
	ⓩINT513_4_2_AoF00⌝, ⓩINT513_4_2_AoF10⌝,
	ⓩINT513_4_2_AoF01⌝, ⓩINT513_4_2_AoF11⌝,
	ⓩINT513_4_2_AoF30⌝, ⓩINT513_4_2_AoF03⌝,
	ⓩINT513_4_2_AoF33⌝];
set_goal([], get_conjecture"-""vcG_1");
a(cn_vc_simp_tac[] THEN REPEAT strip_tac);
a(POP_ASM_T rewrite_thm_tac);
a(ALL_FC_T rewrite_tac thms4_2);
a(strip_asm_tac (hd thms4_2));
store_mt_results_show mt_run [("int513.4.2.2", check_ok, pop_thm, true)];
=TEX
\paragraph{4.3}\

For this test, we have a function inside another function:
=SML
clean_up();
new_script{name= "G", unit_type="func"};
=TEX
ⓈCN
function G(Y : INTEGER) return INTEGER
Ξ [ G Y > Y ]
is
  X: INTEGER;
  function F10 return INTEGER
  Ξ X [ F10 X = X ]
  is begin return X; end F10;
begin
  X := Y;
  return F10 + 1;
end G;
■
=SML
set_pc "cn" ;
set_goal([], get_conjecture"-""vcG_1");
a(REPEAT strip_tac THEN ALL_FC_T asm_rewrite_tac[z_get_specⓩF10⌝]);
store_mt_results_show mt_run [("int513.4.3.1", check_ok, pop_thm, true)];
=TEX
=SML
open_theory "GoF10'func";
set_pc "cn" ;
set_goal([], get_conjecture"-""vcGoF10_1");
a(REPEAT strip_tac);
store_mt_results_show mt_run [("int513.4.3.2", check_ok, pop_thm, true)];
=TEX
\paragraph{4.4}\

For this test, we try various approaches to accessing variables that we shouldn't
=SML
clean_up();
new_script{name= "G", unit_type="func"};
=TEX
=SML
fun test_4_4_1() =
ⓈCN
function G(Y : INTEGER) return INTEGER
Ξ [ G Y > Y ]
is
  X: INTEGER;
  function F10 return INTEGER
  Ξ [ F10 = X ] -- shouldn't read X here
  is begin return X; end F10;
begin
  X := Y;
  return F10 + 1;
end G;
■
=SML
store_mt_results_show mt_run [("int513.4.4.1", check_fail, test_4_4_1, true)];
=SML
clean_up();
new_script{name= "G", unit_type="func"};
=TEX
ⓈCN
function G(Y : INTEGER) return INTEGER
Ξ [ G Y > Y ]
is
  X: INTEGER;
  function F10 return INTEGER
  Ξ [ F10 = 42 ] -- shouldn't read X here
  is A : INTEGER;
  begin
   Δ A [ A = 42 ]
   return A;
  end F10;
begin
  X := Y;
  return F10 + 1;
end G;
■
=SML
fun test_4_4_2 () =
ⓈCN
 ⊑  A := X;
■
=SML
store_mt_results_show mt_run [("int513.4.4.2", check_fail, test_4_4_2, true)];
=TEX

\subsection{WP 5. Scope of auxiliaries}\label{WP5}
\subsubsection{Test Objectives}
The tests should demonstrate that the use of auxiliaries from other packages should not limit the ability to refine the specification statements in a package specification to those in the package body.

\subsubsection{Test Script}
The change proposal for this work package provided two sets of scripts that demonstrated
the problems to be addressed.
These scripts are replicated in \cite{ISS/HAT/DAZ/MDT507}, and the results
tested for the correctness of meeting the test objectives.

\subsection{WP 6. Long Lines in generated Ada}\label{WP6}

\subsubsection{Test Objectives}
We exercise the line-breaking facility on an example containing
a number of convoluted and long Ada constructs.
\subsubsection{Test Script}
=SML
clean_up();
new_script{name="MAIN", unit_type="proc"};
ⓈCN
procedure MAIN
is
  type LONG_RECORD is record
    FIELD_WITH_LONG_NAME01 : INTEGER;
    FIELD_WITH_LONG_NAME02 : INTEGER;
    FIELD_WITH_LONG_NAME03 : INTEGER;
    FIELD_WITH_LONG_NAME04 : INTEGER;
    FIELD_WITH_LONG_NAME05 : INTEGER;
    FIELD_WITH_LONG_NAME06 : INTEGER;
    FIELD_WITH_LONG_NAME07 : INTEGER;
    FIELD_WITH_LONG_NAME08 : INTEGER;
    FIELD_WITH_LONG_NAME09 : INTEGER;
    FIELD_WITH_LONG_NAME10 : INTEGER;
    FIELD_WITH_LONG_NAME11 : INTEGER;
    FIELD_WITH_LONG_NAME12 : INTEGER;
    FIELD_WITH_LONG_NAME13 : INTEGER;
    FIELD_WITH_LONG_NAME14 : INTEGER;
    FIELD_WITH_LONG_NAME15 : INTEGER;
    FIELD_WITH_LONG_NAME16 : INTEGER;
    FIELD_WITH_LONG_NAME17 : INTEGER;
    FIELD_WITH_LONG_NAME18 : INTEGER;
    FIELD_WITH_LONG_NAME19 : INTEGER;
    FIELD_WITH_LONG_NAME20 : INTEGER;
  end record;
  VARIABLE_WITH_LONG_NAME : LONG_RECORD
  := LONG_RECORD'(
    FIELD_WITH_LONG_NAME01 => 881 ,
    FIELD_WITH_LONG_NAME02 => 882 ,
    FIELD_WITH_LONG_NAME03 => 883 ,
    FIELD_WITH_LONG_NAME04 => 884 ,
    FIELD_WITH_LONG_NAME05 => 885 ,
    FIELD_WITH_LONG_NAME06 => 886 ,
    FIELD_WITH_LONG_NAME07 => 887 ,
    FIELD_WITH_LONG_NAME08 => 888 ,
    FIELD_WITH_LONG_NAME09 => 889 ,
    FIELD_WITH_LONG_NAME10 => 890 ,
    FIELD_WITH_LONG_NAME11 => 891 ,
    FIELD_WITH_LONG_NAME12 => 892 ,
    FIELD_WITH_LONG_NAME13 => 893 ,
    FIELD_WITH_LONG_NAME14 => 894 ,
    FIELD_WITH_LONG_NAME15 => 895 ,
    FIELD_WITH_LONG_NAME16 => 896 ,
    FIELD_WITH_LONG_NAME17 => 897 ,
    FIELD_WITH_LONG_NAME18 => 898 ,
    FIELD_WITH_LONG_NAME19 => 899 ,
    FIELD_WITH_LONG_NAME20 => 900);
begin
  VARIABLE_WITH_LONG_NAME :=
    VARIABLE_WITH_LONG_NAME.FIELD_WITH_LONG_NAME01 / (
    VARIABLE_WITH_LONG_NAME.FIELD_WITH_LONG_NAME02 / (
    VARIABLE_WITH_LONG_NAME.FIELD_WITH_LONG_NAME03 / (
    VARIABLE_WITH_LONG_NAME.FIELD_WITH_LONG_NAME04 / (
    VARIABLE_WITH_LONG_NAME.FIELD_WITH_LONG_NAME05 / (
    VARIABLE_WITH_LONG_NAME.FIELD_WITH_LONG_NAME06 / (
    VARIABLE_WITH_LONG_NAME.FIELD_WITH_LONG_NAME07 / (
    VARIABLE_WITH_LONG_NAME.FIELD_WITH_LONG_NAME08 / (
    VARIABLE_WITH_LONG_NAME.FIELD_WITH_LONG_NAME09 / (
    VARIABLE_WITH_LONG_NAME.FIELD_WITH_LONG_NAME10 / (
    VARIABLE_WITH_LONG_NAME.FIELD_WITH_LONG_NAME11 / (
    VARIABLE_WITH_LONG_NAME.FIELD_WITH_LONG_NAME12 / (
    VARIABLE_WITH_LONG_NAME.FIELD_WITH_LONG_NAME13 / (
    VARIABLE_WITH_LONG_NAME.FIELD_WITH_LONG_NAME14 / (
    VARIABLE_WITH_LONG_NAME.FIELD_WITH_LONG_NAME15 / (
    VARIABLE_WITH_LONG_NAME.FIELD_WITH_LONG_NAME16 / (
    VARIABLE_WITH_LONG_NAME.VARIABLE_WITH_LONG_NAME.FIELD_WITH_LONG_NAME17 / (
    VARIABLE_WITH_LONG_NAME.FIELD_WITH_LONG_NAME18 / (
    VARIABLE_WITH_LONG_NAME.FIELD_WITH_LONG_NAME19 / (
    VARIABLE_WITH_LONG_NAME.FIELD_WITH_LONG_NAME20
    ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) );
end MAIN;
■
=SML
set_int_control("cn_automatic_line_splitting", 20);
output_ada_program{script="-", out_file="int513.5.1.ada"};
set_int_control("cn_automatic_line_splitting", 72);
output_ada_program{script="-", out_file="int513.5.2.ada"};
set_int_control("cn_automatic_line_splitting", 10000000);
output_ada_program{script="-", out_file="int513.5.3.ada"};
=DUMP int513.5.sh
for i in int513.5.*.ada
do
	b=`basename $i .ada`
	sed <$i >$b.sml -e '1i\
\ⓈCN
' -e '$a\
\■
'
done
=TEX
The following code just ensures that errors from running the shell script
show up in the test log.
=SML
val _ = (
	let	val  _ = ExtendedIO.system"sh int513.5.sh >int513.5.txt 2>&1";
		val s = open_in "int513.5.txt";
		val buf :string ref = ref "";
	in 	while (buf := ExtendedIO.input_line s; !buf <> "")
		do  BasicIO.output(std_out, !buf);
		close_in s
	end
);
=TEX
=SML
fun int513_reload (file : string) {name : string, unit_type:string} = (
	clean_up();
	new_script{name = name, unit_type = unit_type};
	use_file (file ^ ".sml") handle _ => ();
	output_ada_program{script="-", out_file= file ^ ".cmp"}
);
int513_reload "int513.5.1" {name="MAIN", unit_type="proc"};
int513_reload "int513.5.2" {name="MAIN", unit_type="proc"};
int513_reload "int513.5.3" {name= "MAIN", unit_type="proc"};
fun int513_cmp (file1 : string, file2 : string) : bool = (
	let	val ch1 = BasicIO.open_in file1;
		val ch2 = BasicIO.open_in file2;
		val contents1 = BasicIO.input(ch1, 1000000);
		val contents2 = BasicIO.input(ch2, 1000000);
	in	close_in ch1; close_in ch2; contents1 = contents2
	end
);
=TEX
=SML
store_mt_results_show
mt_run [
    ("int513.5.3.1", int513_cmp, ("int513.5.3.ada", "int513.5.1.cmp"), true),
    ("int513.5.3.2", int513_cmp, ("int513.5.3.ada", "int513.5.2.cmp"), true),
    ("int513.5.3.3", int513_cmp, ("int513.5.3.ada", "int513.5.3.cmp"), true)
];

=TEX

\subsection{WP 7. SPARK language omissions}\label{WP7}
\subsubsection{Test Objectives}
Three language extensions have been made, and these each give an objective:
\begin{enumerate}
\item
Demonstrate that variables can be initialised in package specifications, package bodies and program bodies, and that these initialisation can be properly used in
proving VCs.
\item
Demonstrate that functions can be renamed in package specifications, and that the renamings can be used in subsequent development of the packages, and proof
about those packages.
\item
Demonstrate that unconstrained subtypes, and their attributes, can be used in package specifications, package bodies and program bodies, and that these subtype declarations can be properly used in
proving VCs.
\end{enumerate}

\subsubsection{Test Script}
\paragraph{Variable Initialisation}
Note that initialisation of variables in a package specification has
no formal effect, and in a package body only within an ``implements''
clause.

The effect of the initialisation of a package body variable can be seen by VC $vcINT513\_7\_1\_1body\_5$.

The effect of the initialisation of a subprograms variable can be seen by VC $vcINT513\_7\_1\_1body\_4$.

=SML
clean_up();
new_script{name="INT513_7_1_1", unit_type="spec"};
ⓈCN
package int513_7_1_1 is
X : INTEGER := 1;
$auxiliary s : ℕ;
procedure P
 Δ s, INT513_7_1_1oX [ INT513_7_1_1oX = s + INT513_7_1_1oX⋎0 + 3 ∧ s = s⋎0];
end int513_7_1_1;
■
=SML
new_script{name="INT513_7_1_1", unit_type="body"};
ⓈCN
package body int513_7_1_1 is
$using
	Z : INTEGER := 2;
$implement s $by (s = Z);

procedure P
Δ INT513_7_1_1oX, Z [Z ∈ ℕ, INT513_7_1_1oX = Z + INT513_7_1_1oX⋎0 + 3 ∧ Z = Z⋎0]
is
Y : INTEGER := 3;
begin
	 Δ INT513_7_1_1oX, Y, Z [Z ∈ ℕ, INT513_7_1_1oX = Z + INT513_7_1_1oX⋎0 + Y ∧ Y = Y⋎0 ∧ Z = Z⋎0] (1)
end P;

begin
	null;
end int513_7_1_1;
■
=SML
open_scope "INT513_7_1_1.P";
ⓈCN
 (1) ⊑
	X := Z + X + Y;
■
=SML
open_scope "INT513_7_1_1";
set_goal([],get_conjecture "-" "vcINT513_7_1_1_1");
a(REPEAT strip_tac);
a(all_var_elim_asm_tac1);
store_mt_results_show mt_run [("int513.7.1.1", check_ok, pop_thm, true)];
=TEX
=SML
set_goal([],get_conjecture "-" "vcINT513_7_1_1_2");
a(REPEAT strip_tac);
a(all_var_elim_asm_tac1);
a(z_∃_tac ⓩZ⋎0⌝);
a(REPEAT strip_tac);
store_mt_results_show mt_run [("int513.7.1.2", check_ok, pop_thm, true)];
=TEX
=SML
set_goal([],get_conjecture "-" "vcINT513_7_1_1_3");
a(REPEAT strip_tac);
a(z_∃_tac ⓩ2⌝);
a(asm_rewrite_tac[]);
store_mt_results_show mt_run [("int513.7.1.3", check_ok, pop_thm, true)];
=TEX
=SML
open_scope "INT513_7_1_1.P";
set_pc"cn";
set_goal([],get_conjecture "-" "vcINT513_7_1_1oP_1");
a(REPEAT strip_tac);
store_mt_results_show mt_run [("int513.7.1.4", check_ok, pop_thm, true)];
=TEX
=SML
set_goal([],get_conjecture "-" "vcINT513_7_1_1oP_1");
a(REPEAT strip_tac);
store_mt_results_show mt_run [("int513.7.1.5", check_ok, pop_thm, true)];
=TEX
=SML
set_goal([],get_conjecture "-" "vc1_1");
a(REPEAT strip_tac);
store_mt_results_show mt_run [("int513.7.1.6", check_ok, pop_thm, true)];
=TEX
=SML
store_mt_results_show mt_run [("int513.7.1.7", length, get_conjectures "-", 3)];
=TEX

=TEX
\paragraph{Function Renaming}
=SML
clean_up();
new_script{name="INT513_7_2_1", unit_type="spec"};
ⓈCN
package int513_7_2_1 is
function f return INTEGER
Ξ [INT513_7_2_1oF = 3];

function g(x : INTEGER) return INTEGER
Ξ [INT513_7_2_1oG X = X + 2];
end int513_7_2_1;
■
=SML
new_script{name="INT513_7_2_2", unit_type="spec"};
ⓈCN
with int513_7_2_1;
package int513_7_2_2 is
function f1 return INTEGER
renames int513_7_2_1.f;

function g1(x : INTEGER) return INTEGER
renames int513_7_2_1.g;
end int513_7_2_2;
■
Now try using this in a package body:
=SML
new_script{name="INT513_7_2_2", unit_type="body"};
ⓈCN
with int513_7_2_1;
package body int513_7_2_2 is

procedure P (Y : out INTEGER)
 Δ Y [1 ∈ INTEGER, Y = 6 ]
is
begin
	Y := F1 + G1(1);
end P;
end int513_7_2_2;
■
=SML
open_theory"INT513_7_2_2oP'proc";
set_goal([],get_conjecture "-" "vcINT513_7_2_2oP_1");
a(REPEAT strip_tac);
a(ALL_FC_T rewrite_tac[z_get_spec ⓩINT513_7_2_1oG⌝]);
a(rewrite_tac[z_get_spec ⓩINT513_7_2_1oF⌝]);
store_mt_results_show mt_run [("int513.7.2.1", check_ok, pop_thm, true)];
=TEX
\paragraph{Unconstrained Subtypes}
=SML
clean_up();
new_script{name="INT513_7_3_1", unit_type="spec"};
ⓈCN
package int513_7_3_1 is
type RNG is range 1 .. 5;
subtype RRNG is RNG;

procedure P (X : in out RRNG)
 Δ X [ X > INT513_7_3_1oRRNGvFIRST ];
end int513_7_3_1;
■
=SML
new_script{name="INT513_7_3_2", unit_type="spec"};
ⓈCN
with int513_7_3_1;
package int513_7_3_2 is
Y : int513_7_3_1.RRNG;

procedure Q (X : in out int513_7_3_1.RRNG)
 Δ X [ X > INT513_7_3_1oRRNGvFIRST ];
end int513_7_3_2;
■
=SML
new_script{name="INT513_7_3_2", unit_type="body"};
ⓈCN
with INT513_7_3_1;
package body int513_7_3_2 is

procedure Q (X : in out INT513_7_3_1.RRNG)
 Δ X [  X > INT513_7_3_1oRRNGvFIRST  ]
is
begin
	if (X = INT513_7_3_1.RRNG'LAST)
	then null;
	else INT513_7_3_1.P(X);
	end if;
end Q;
end int513_7_3_2;
■
=SML
get_conjectures "-";
set_pc "cn1";
fun simple_proof ((name) :: x) = (
	tac_proof(([], get_conjecture "-" name), prove_tac[]);
	simple_proof x
) | simple_proof [] = ();

store_mt_results_show mt_run
	[("int513.7.3.1", simple_proof,
		["vcINT513_7_3_2_1",
		"vcINT513_7_3_2_2"], ())];
open_theory "INT513_7_3_2oQ'proc";
set_pc "cn1";
store_mt_results_show mt_run
	[("int513.7.3.2.1", simple_proof,
		["vcINT513_7_3_2oQ_2",
		"vcINT513_7_3_2oQ_3"], ())];

=TEX
=SML
set_goal([], get_conjecture "-" "vcINT513_7_3_2oQ_1");
a(REPEAT strip_tac);
a(DROP_NTH_ASM_T 1 ante_tac);
a(rewrite_tac[cn_relational_clauses, cn_boolean_clauses]);
a(rewrite_tac[z_get_spec ⓩINT513_7_3_1oRRNGvLAST⌝,
	z_get_spec ⓩINT513_7_3_1oRRNGvFIRST⌝]);
a(rewrite_tac[z_get_spec ⓩINT513_7_3_1oRNGvLAST⌝,
	z_get_spec ⓩINT513_7_3_1oRNGvFIRST⌝]);
a(PC_T1 "z_lin_arith" prove_tac[]);
store_mt_results_show mt_run [("int513.7.3.2.2", check_ok, pop_thm, true)];
=TEX
\subsection{WP 8. DAZ bugs}\label{WP8}
Tests for the bugs fixed under WP8 are given in \cite{ISS/HAT/DAZ/INT502}.

\subsection{WP 9. Knuth slots}\label{WP9}
TBA (Project stage 3)
\subsubsection{Test Objectives}
There are three things to be demonstrated:
\begin{enumerate}
\item
That K-Slots can be used in package specifications such that the results
appear in the formal treatment of the specification.
\item
That K-Slots can be nested within package bodies, such that the results
appear in the formal treatment of the body.
\item
That K-Slots can be nested within package specifications, such that the results
appear in the formal treatment of the specification.
\end{enumerate}

\subsubsection{Test Script}
The original Praxis material demonstrating the need for the change,
is processed and the correct behaviour tested in \cite{ISS/HAT/DAZ/INT516}.
This is essentially the same material as is used to explain the
problem in \cite{ISS/HAT/DAZ/HLD504}.
This integration test document is sufficient to demonstrate that the test objectives have been met.

\subsection{WP 10. Type Generation}\label{WP10}
\subsubsection{Test Objectives}
The requirement here was to allow the Z translation
of the types of a package to be made available for use
in Z paragraphs before a with clause for the package
has been processed. These Z paragraphs should also
be available in prefixed form for use in the scope
of a with clause for the package.
The enhancement has required quite a lot of rework (and bug-fixing)
in the handling of package spec theories.

The test script is in 3 parts as follows:

\begin{tabular}{|l|l|}\hline
{\bf Part} & {\bf Description}\\\hline\hline
10.1 & Test usability of Z in the package spec theory in client of package\\\hline

10.3 & Check prefixing of various constructs in package (program variables) \\\hline

10.3 & Check prefixing of various constructs in package (auxiliary variables) \\\hline
\end{tabular}

\subsubsection{Test Script}
\paragraph{Part 10.1}\

=SML
clean_up();
new_script{name="INT513_10_1_A", unit_type="spec"};
ⓈCN
package INT513_10_1_A is
  type CRUMB is range 0 .. 3;
end INT513_10_1_A;
■
ⓈZAX
│ oo, oi, io, ii : INT513_10_1_AoCRUMB
├──────
│	oo = INT513_10_1_AoCRUMBvFIRST
│∧	oi = INT513_10_1_AoCRUMBvSUCC oo
│∧	io = INT513_10_1_AoCRUMBvPRED ii
│∧	ii = INT513_10_1_AoCRUMBvLAST
■
=SML
new_script{name="INT513_10_1_B", unit_type="func"};
ⓈCN
with INT513_10_1_A;
function INT513_10_1_B (X : INT513_10_1_A.CRUMB) return INT513_10_1_A.CRUMB
Ξ [INT513_10_1_B X = ii - X]
is
   ⟨ variables ⟩ (1)
begin
 return 3 - X;
end INT513_10_1_B;
■
=TEX
We should be able to proved the resulting VC (because we
should have a copy of the definition of $ii$ available in
the package spec theory):
=SML
delete_pc"int513.10.1" handle Fail _ => ();
val _ = all_cn_make_script_support"int513.10.1";
fun int513_10_1_prove_vcs () = (
	(map (fn (_, (_, t)) => tac_proof(([], t),
	PC_T1 "int513.10.1"cn_vc_simp_tac[])))
	(get_conjectures "-")
);
=TEX
=SML
store_mt_results_show
mt_run [
    ("int513.10.1", check_ok, int513_10_1_prove_vcs, true)
];
=TEX
\paragraph{Part 10.2}\

=SML
clean_up();
new_script{name="INT513_10_2_A", unit_type="spec"};
ⓈZAX
│ sum : seq ℤ → ℤ;
│ average : seq⋎1 ℤ → ℤ
├──────
│ sum ⟨⟩ = 0 ;
│ ∀x:ℤ; s:seq ℤ⦁ sum (⟨x⟩⁀s) = x + sum s ;
│ ∀s:seq⋎1 ℤ⦁ average s = (sum s + 1) div #s
■

ⓈCN
package INT513_10_2_A
is
  type BIT is range 0 .. 1;
  type BYTE is range 0 .. 255;
  OFF : constant BYTE := 0;
  ON  : constant BYTE := 1;
  R, G, B : BYTE;
  function AVERAGE (X, Y, Z : in BYTE) return BYTE
  Ξ [ INT513_10_2_AoAVERAGE (X, Y, Z) = average ⟨X, Y, Z⟩ ];
  procedure SET_AVERAGE
  Δ INT513_10_2_AoR, INT513_10_2_AoG, INT513_10_2_AoB [ INT513_10_2_AoR = INT513_10_2_AoG = INT513_10_2_AoB = average ⟨INT513_10_2_AoR⋎0, INT513_10_2_AoG⋎0, INT513_10_2_AoB⋎0⟩ ];
end INT513_10_2_A;
■
=SML
new_script{name="INT513_10_2_B", unit_type="proc"};
ⓈCN
with INT513_10_2_A;
procedure INT513_10_2_B(RR, GG, BB : INT513_10_2_A.BYTE)
Δ INT513_10_2_AoR, INT513_10_2_AoB, INT513_10_2_AoG
[ INT513_10_2_AoR = INT513_10_2_AoB = INT513_10_2_AoB =
  average⟨RR, GG, BB⟩]
is
begin
Δ INT513_10_2_AoR, INT513_10_2_AoB, INT513_10_2_AoG
[ INT513_10_2_AoR = INT513_10_2_AoB = INT513_10_2_AoB =
  average⟨RR, GG, BB⟩]
end INT513_10_2_B;
■
We implement this two ways: first using the procedure and then using
the function.
ⓈCN
 ⊑
 INT513_10_2_A.R := RR;
 INT513_10_2_A.G := GG;
 INT513_10_2_A.B := BB;
 Δ INT513_10_2_AoR, INT513_10_2_AoB, INT513_10_2_AoG
 [ INT513_10_2_AoR = RR ∧ INT513_10_2_AoG = GG ∧ INT513_10_2_AoB = BB,
   INT513_10_2_AoR = INT513_10_2_AoB = INT513_10_2_AoB =
   average⟨RR, GG, BB⟩]
■
ⓈCN
 ⊑ INT513_10_2_A.SET_AVERAGE;
■
=SML
fun int513_10_2_B_prove_vcs () = (
	(map (fn (_, (_, t)) => tac_proof(([], t),
	cn_vc_simp_tac[]
	THEN REPEAT strip_tac THEN asm_rewrite_tac[])))
	(get_conjectures "-")
);
=TEX
=SML
store_mt_results_show
mt_run [
    ("int513.10.2.1", check_ok, int513_10_2_B_prove_vcs, true)
];
=TEX
We now do the version with the function:
=SML
clean_up();
new_script{name="INT513_10_2_A", unit_type="spec"};
ⓈZAX
│ sum : seq ℤ → ℤ;
│ average : seq⋎1 ℤ → ℤ
├──────
│ sum ⟨⟩ = 0 ;
│ ∀x:ℤ; s:seq ℤ⦁ sum (⟨x⟩⁀s) = x + sum s ;
│ ∀s:seq⋎1 ℤ⦁ average s = (sum s + 1) div #s
■

ⓈCN
package INT513_10_2_A
is
  type BIT is range 0 .. 1;
  type BYTE is range 0 .. 255;
  OFF : constant BYTE := 0;
  ON  : constant BYTE := 1;
  R, G, B : BYTE;
  function AVERAGE (X, Y, Z : in BYTE) return BYTE
  Ξ [ INT513_10_2_AoAVERAGE (X, Y, Z) = average ⟨X, Y, Z⟩ ];
  procedure SET_AVERAGE
  Δ INT513_10_2_AoR, INT513_10_2_AoG, INT513_10_2_AoB [ INT513_10_2_AoR = INT513_10_2_AoG = INT513_10_2_AoB = average ⟨INT513_10_2_AoR⋎0, INT513_10_2_AoG⋎0, INT513_10_2_AoB⋎0⟩ ];
end INT513_10_2_A;
■
=SML
new_script{name="INT513_10_2_B", unit_type="proc"};
new_script{name="INT513_10_2_C", unit_type="proc"};
ⓈCN
with INT513_10_2_A;
procedure INT513_10_2_C(RR, GG, BB : INT513_10_2_A.BYTE)
Δ INT513_10_2_AoR, INT513_10_2_AoB, INT513_10_2_AoG
[ INT513_10_2_AoR = INT513_10_2_AoB = INT513_10_2_AoB =
  average⟨RR, GG, BB⟩]
is
begin
Δ INT513_10_2_AoR, INT513_10_2_AoB, INT513_10_2_AoG
[ INT513_10_2_AoR = INT513_10_2_AoB = INT513_10_2_AoB =
  average⟨RR, GG, BB⟩]
end INT513_10_2_C;
■
ⓈCN
 ⊑
 INT513_10_2_A.R := INT513_10_2_A.AVERAGE(RR, GG, BB);
 INT513_10_2_A.G := INT513_10_2_A.R;
 INT513_10_2_A.B := INT513_10_2_A.R;
■
=SML
fun int513_10_2_C_prove_vcs () = (
	(map (fn (_, (_, t)) => tac_proof(([], t),
	cn_vc_simp_tac[]
	THEN REPEAT strip_tac THEN
	ALL_ASM_FC_T rewrite_tac[z_get_specⓩINT513_10_2_AoAVERAGE⌝])))
	(get_conjectures "-")
);
=TEX
=SML
store_mt_results_show
mt_run [
    ("int513.10.2.2", check_ok, int513_10_2_C_prove_vcs, true)
];

=TEX
\paragraph{Part 10.3}\
=SML
clean_up();
new_script{name="INT513_10_3_A", unit_type="spec"};
ⓈCN
package INT513_10_3_A
is
  type DATA is range 0 .. 9;
  $auxiliary DataSet : ℙ INT513_10_3_AoDATA;
  procedure ADD(X : DATA)
  Δ DataSet [ X ∉ DataSet, DataSet = DataSet⋎0 ∪ {X} ] ;
  procedure REMOVE(X : DATA)
  Δ DataSet [ X ∈ DataSet, DataSet = DataSet⋎0 \ {X} ] ;
  procedure IS_THERE(X : DATA; B : out BOOLEAN)
  Δ Ξ DataSet [ X ∈ DataSet ∧ B = TRUE ∨ X ∉ DataSet ∧ B = FALSE] ;
end INT513_10_3_A;
■
=SML
new_script{name="INT513_10_3_B", unit_type="proc"};
ⓈCN
with INT513_10_3_A;
procedure INT513_10_3_B
Δ DataSet
[ DataSet = ∅ ]
is
 ⟨ local variables ⟩ (1)
begin
  for I in INT513_10_3_A.DATA
  loop
    Δ DataSet[
       ∀j : INT513_10_3_AoDATAvFIRST .. (I - 1)⦁ j ∉ DataSet,
       ∀j : INT513_10_3_AoDATAvFIRST .. I⦁ j ∉ DataSet ] (2)
  end loop;
end INT513_10_3_B;
■
ⓈCN
 (1) ≡ B : BOOLEAN;
■
ⓈCN
 (2) ⊑
    $con S: ℙ INT513_10_3_AoDATA⦁ Δ DataSet [
       S = DataSet, DataSet = S \ {I} ] (3)
■

ⓈCN
 (3) ⊑
    INT513_10_3_A.IS_THERE(I, B);
    if B
    then
    Δ DataSet[
       S = DataSet ∧ I ∈ DataSet,
       DataSet = S \ {I} ] (4)
    end if;
■
ⓈCN
 (4) ⊑
    INT513_10_3_A.REMOVE(I);
■
=TEX
=SML
delete_pc"int513.10.3" handle Fail _ => ();
val _ = all_cn_make_script_support"int513.10.3";
set_pc"cn1";
=TEX
=SML
set_goal([], get_conjecture"-""vcINT513_10_3_B_1");
a(PC_T1"int513.10.3" cn_vc_simp_tac[]);
a(REPEAT strip_tac THEN PC_T1 "z_lin_arith" asm_prove_tac[]);
val vcINT513_10_3_B_1 = save_pop_thm "vcINT513_10_3_B_1";
=TEX
=SML
set_goal([], get_conjecture"-""vcINT513_10_3_B_2");
a(PC_T1"int513.10.3" cn_vc_simp_tac[]);
val vcINT513_10_3_B_2 = save_pop_thm "vcINT513_10_3_B_2";
=TEX
=SML
set_goal([], get_conjecture"-""vcINT513_10_3_B_3");
a(PC_T1"int513.10.3" cn_vc_simp_tac[]);
val vcINT513_10_3_B_3 = save_pop_thm "vcINT513_10_3_B_3";
=TEX
=SML
set_goal([], get_conjecture"-""vcINT513_10_3_B_4");
a(PC_T1"int513.10.3" cn_vc_simp_tac[]);
a(PC_T1"z_library_ext" REPEAT strip_tac);
a(all_asm_fc_tac[] THEN all_asm_fc_tac[]);
val vcINT513_10_3_B_4 = save_pop_thm "vcINT513_10_3_B_4";
=TEX
=SML
set_goal([], get_conjecture"-""vc2_1");
a(cn_vc_simp_tac[]);
val vc2_1 = save_pop_thm "vc2_1";
=TEX
=SML
set_goal([], get_conjecture"-""vc2_2");
a(PC_T1"int513.10.3" cn_vc_simp_tac[] THEN REPEAT strip_tac);
val vc2_2 = save_pop_thm "vc2_2";

set_goal([], get_conjecture"-""vc2_3");
a(PC_T1"int513.10.3" cn_vc_simp_tac[] THEN REPEAT strip_tac);
a(all_var_elim_asm_tac1);
a(cases_tac ⓩj ≤ I + ~ 1⌝);
(* *** Goal "1" *** *)
a(all_asm_fc_tac[] THEN POP_ASM_T ante_tac
	THEN PC_T1 "z_library_ext" prove_tac[]);
(* *** Goal "2" *** *)
a(lemma_tacⓩj = I⌝ THEN1 PC_T1 "z_lin_arith" asm_prove_tac[]);
a(all_var_elim_asm_tac1 THEN PC_T1 "z_library_ext" prove_tac[]);
val vc2_3 = save_pop_thm "vc2_3";
=TEX
=SML
set_goal([], get_conjecture"-""vc3_1");
a(cn_vc_simp_tac[]);
val vc3_1 = save_pop_thm "vc3_1";
=TEX
=SML
set_goal([], get_conjecture"-""vc3_2");
a(cn_vc_simp_tac[] THEN REPEAT strip_tac);
a(all_var_elim_asm_tac1);
a(POP_ASM_T ante_tac THEN rewrite_tac[]);
val vc3_2 = save_pop_thm "vc3_2";
=TEX
=SML
set_goal([], get_conjecture"-""vc3_3");
a(PC_T1"int513.10.3" cn_vc_simp_tac[] THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(all_var_elim_asm_tac1);
a(POP_ASM_T ante_tac THEN rewrite_tac[]);
(* *** Goal "2" *** *)
a(all_var_elim_asm_tac1);
a(POP_ASM_T ante_tac THEN PC_T1 "z_sets_ext" REPEAT strip_tac);
a(contr_tac THEN all_var_elim_asm_tac1);
val vc3_3 = save_pop_thm "vc3_3";
=TEX
=SML
set_goal([], get_conjecture"-""vc3_4");
a(cn_vc_simp_tac[]);
val vc3_4 = save_pop_thm "vc3_4";
=TEX
=SML
set_goal([], get_conjecture"-""vc4_1");
a(REPEAT strip_tac);
val vc4_1 = save_pop_thm "vc4_1";
=TEX
=SML
set_goal([], get_conjecture"-""vc4_2");
a(REPEAT strip_tac THEN all_var_elim_asm_tac1 THEN strip_tac);
val vc4_2 = save_pop_thm "vc4_2";
=TEX
=SML
fun int513_10_3_check_thms () = (
	let	val names = flat (map fst (get_conjectures"-"));
		fun do1 (name : string) = (
			let	val cnj = get_conjecture "-" name;
				val (h, t) = dest_thm (get_thm "-" name);
			in	is_nil h andalso cnj ~=$ t
			end
		);
	in	all (map do1 names) Combinators.I
	end
);
=TEX
=SML
store_mt_results_show
mt_run [
    ("int513.10.3.1", int513_10_3_check_thms, (), true)
];
=TEX
\appendix
\section{Additional Changes}\label{AdditionalChanges}
\subsection{Specification Narrative}\label{A1}
These changes result in no change to the implementation and so no tests are required.

\subsection{Frame Widening}\label{A2}
\subsubsection{Test Objectives}
The requirement here was to implement a new check and to change the treatment of
auxiliary and using variables.
The new check requires that all variables in the frame of a specification statement be in scope.
Auxiliary variables and using variables are brought into scope at the point of declaration and to restrict the propagation of declarations introduced by expanding k-slots.

The test script is in 3 parts as follows:

\begin{tabular}{|l|l|}\hline
{\bf Part} & {\bf Description}\\\hline\hline
A.2.1 & Test incorrect code against the check;
the check must be tested in all places where specification statements may appear. \\\hline

A.2.2 & Test correct code against the check;
this is covered by previous tests except for using variables
(e.g., by the tests in section~\ref{WP10}). \\\hline

A.2.3 & Test propagation of declarations introduced by expanding k-slots (correct and error cases). \\\hline
\end{tabular}

\subsubsection{Test Script}
\paragraph{Part A.2.1}\

Try different places where specification statements may appear:

1) Procedure specification in main program :
=SML
clean_up();
new_script{name="INT513_A_2_1_1", unit_type="proc"};
=SML
fun int513_A_2_1_1 () =
ⓈCN
procedure int513_A_2_1_1
Δ X [true]
is
begin
 null;
end int513_A_2_1_1;
■
=SML
store_mt_results_show
mt_run_fail [("int513.A.2.1.1", int513_A_2_1_1, (), gen_fail_msg "set_cn_scope" 514002 ["X"])];
=TEX
2) Procedure specification in package spec
=SML
clean_up();
new_script{name="INT513_A_2_1_2", unit_type="spec"};
=SML
fun int513_A_2_1_2 () =
ⓈCN
package int513_A_2_1_2 is
 procedure P Δ Y [ true ];
end int513_A_2_1_2;
■
=SML
store_mt_results_show
mt_run_fail [("int513.A.2.1.2", int513_A_2_1_2, (), gen_fail_msg "set_cn_scope" 514002 ["Y"])];
=TEX
3) Procedure specification in package body
=SML
clean_up();
new_script{name="INT513_A_2_1_3", unit_type="spec"};
=SML
ⓈCN
package int513_A_2_1_3 is
 X : INTEGER;
end int513_A_2_1_3;
■
=TEX
=SML
new_script{name="INT513_A_2_1_3", unit_type="body"};
=TEX
=SML
ⓈCN
package body int513_A_2_1_3 is
 ⟨ decs ⟩ (1)
end int513_A_2_1_3;
■
=TEX
=SML
fun int513_A_2_1_3 () =
ⓈCN
 (1) ≡ procedure Q Δ Z [ true ] is begin null; end Q;
■
=TEX
=SML
store_mt_results_show
mt_run_fail [("int513.A.2.1.3", int513_A_2_1_3, (), gen_fail_msg "set_cn_scope" 514002 ["Z"])];
=TEX
4) Statement: 2 cases: (a) at start of chain of formality; (b)
in midst of chain of formality.
=SML
clean_up();
new_script{name="INT513_A_2_1_4_A", unit_type="proc"};
fun int513_A_2_1_4_A () =
ⓈCN
procedure int513_A_2_1_4_A is
 X : INTEGER;
begin
 Δ A [ true ] (1)
end int513_A_2_1_4_A;
■
=SML
store_mt_results_show
mt_run_fail [("int513.A.2.1.4.A", int513_A_2_1_4_A, (), gen_fail_msg "check_19" 505085[])];
=TEX
=SML
clean_up();
new_script{name="INT513_A_2_1_4_B", unit_type="proc"};
ⓈCN
procedure int513_A_2_1_4_B is
 X : INTEGER;
begin
 Δ X [ true ] (1)
end int513_A_2_1_4_B;
■
=SML
fun int513_A_2_1_4_B () =
ⓈCN
 (1) ⊑ Δ A, X [ true ]
■
=TEX
=SML
store_mt_results_show
mt_run_fail [("int513.A.2.1.4.B", int513_A_2_1_4_B, (), gen_fail_msg "check_19" 505085 [])];
=TEX
\paragraph{Part A.2.2}\
For this, we just need to look at procedures in a package body that manipulate using variables:
=SML
clean_up();
new_script{name="INT513_A_2_2", unit_type="spec"};
ⓈCN
package int513_A_2_2 is
 $auxiliary X : ℕ;
 procedure INC Δ X [ X = X⋎0+ 1 ] ;
end int513_A_2_2;
■
=SML
new_script{name="INT513_A_2_2", unit_type="body"};
ⓈCN
package body int513_A_2_2 is
 $using C : INTEGER; $implement X $by X = C;
 procedure INC
 Δ C [ C = C⋎0+ 1 ]
 is begin C := C + 1; end INC ;
 procedure PRIV
 Δ C [ C = C⋎0 ]
 is begin null; end PRIV;
begin
 C := 0;
end int513_A_2_2;
■

=TEX
=SML
set_pc"cn1";
set_goal([],get_conjecture "-" "vcINT513_A_2_2_1");
a(REPEAT strip_tac THEN prove_∃_tac);
store_mt_results_show mt_run [("int513.A.2.2.1", check_ok, pop_thm, true)];
=TEX
=SML
set_goal([],get_conjecture "-" "vcINT513_A_2_2_2");
a(REPEAT strip_tac THEN prove_∃_tac);
a(rewrite_tac[get_spec⌜Z'Dec⌝]);
a(rewrite_tac[get_spec⌜Z'Decl⌝]);
a(all_var_elim_asm_tac1);
a(PC_T1"z_lin_arith" asm_prove_tac[]);
store_mt_results_show mt_run [("int513.A.2.2.2", check_ok, pop_thm, true)];
=TEX
=SML
set_goal([],get_conjecture "-" "vcINT513_A_2_2_3");
a(REPEAT strip_tac);
a(z_∃_tac ⓩ0⌝ THEN REPEAT strip_tac);
store_mt_results_show mt_run [("int513.A.2.2.3", check_ok, pop_thm, true)];
=TEX
=SML
open_theory "INT513_A_2_2oINC'proc";
set_pc "cn";
set_goal([],get_conjecture "-" "vcINT513_A_2_2oINC_1");
a(REPEAT strip_tac);
store_mt_results_show mt_run [("int513.A.2.2.4", check_ok, pop_thm, true)];
=TEX
=SML
open_theory "INT513_A_2_2oPRIV'proc";
set_pc "cn";
set_goal([],get_conjecture "-" "vcINT513_A_2_2oPRIV_1");
a(REPEAT strip_tac);
store_mt_results_show mt_run [("int513.A.2.2.5", check_ok, pop_thm, true)];
=TEX
\paragraph{Part A.2.3}\
Propagation of frame variables:

1) Weird case: frame widening in package initialisation:
=SML
clean_up();
new_script{name="T1", unit_type="spec"};
ⓈCN
package T1
is
 X : INTEGER;
end T1;
■
=TEX
=SML
new_script{name="T1", unit_type="body"};
ⓈCN
package body T1
is
 ⟨ Local decls ⟩			(1)

begin
 Δ T1oX [ T1oX > 1 ]
end T1;
■
=SML
fun int513_A_2_3_1 () =
ⓈCN
   ⊑ X := 2; Y := 0;
■
=TEX
Assigning to $Y$ shouldn't be allowed (yet)
=SML
store_mt_results_show
mt_run_fail [("int513.A.2.3.1", int513_A_2_3_1, (), gen_fail_msg "check_1_a" 505065["", "Y"])];
=TEX
Now introduce $Y$:
ⓈCN
 (1) ≡ Y : INTEGER;
■
=TEX
=SML
store_mt_results_show
mt_run [("int513.A.2.3.2", check_fail, int513_A_2_3_1, false)];
=TEX
=TEX
=SML
map (pc_rule1 "cn1" prove_rule[]) (map (snd o snd) (get_conjectures"-"));
=TEX

2) Now the usual sort of example:
=SML
clean_up();
new_script{name="SWAP", unit_type="proc"};
ⓈCN
procedure SWAP (X, Y : in out INTEGER)
ΔX, Y[ X = Y⋎0 ∧ Y = X⋎0 ]
is
 ⟨ decs ⟩			(1)
begin
ΔX, Y[ X = Y⋎0 ∧ Y = X⋎0 ] (2)
end SWAP;
■
=SML
fun int513_A_2_3_2 () =
ⓈCN
 (2) ⊑ T := X; X := Y; Y := T;
■
=TEX
Assigning to $T$ shouldn't be allowed (yet)
=SML
store_mt_results_show
mt_run_fail [("int513.A.2.3.3", int513_A_2_3_2, (), gen_fail_msg "check_1_a" 505065["", "T"])];
=TEX
ⓈCN
 (1) ≡ T : INTEGER;
■
=TEX
=SML
store_mt_results_show
mt_run [("int513.A.2.3.4.1", check_fail, int513_A_2_3_2, false)];
=TEX
=SML
fun int513_A_2_3_2_prove_vcs() = (
	map (pc_rule1 "cn1" prove_rule[])
	(map (snd o snd) (get_conjectures"-"));
	()
);
store_mt_results_show
mt_run [("int513.A.2.3.4.2", check_fail, int513_A_2_3_2_prove_vcs, false)];
=TEX

3) Now check that frame-widening doesn't occur from one subprogram into a local subprogram.
This is one of the examples from the issues list.
=SML
clean_up();
new_script{name="P", unit_type="proc"};
ⓈCN
procedure P ( X : out INTEGER )
Δ X [ X = 0 ]
is
  ⟨ Var Y ⟩                   (1)
  procedure Q
  Δ [ true ]
  is
  begin
    Δ [ true ]                    (2)
  end Q;
begin
Δ X [ X = 0 ]                     (3)
end P;
■
ⓈCN
 (1) ≡ Y : INTEGER;
■
=TEX
=SML
open_scope "P.Q";
fun int513_A_2_3_3 () =
ⓈCN
 (2) ⊑ Y := 1;
■
=SML
store_mt_results_show
mt_run_fail [("int513.A.2.3.4", int513_A_2_3_3, (), gen_fail_msg "check_1_a" 505065["", "Y"])];
=TEX

\subsection{Checks on Procedure Calls}\label{A3}
\subsubsection{Test Objectives}
The requirement here was to introduce a new check ensuing that procedure calls are not used to change variables that should not be changed in a refinement step.
That correct cases pass the check will be verified by existing tests (e.g. those in section~\ref{WP10} above).
The test script here is therefore in just one part as follows:

\begin{tabular}{|l|l|}\hline
A.3.1 & Check efficacy of test on incorrect cases. \\\hline
\end{tabular}

\subsubsection{Test Script}
\paragraph{Part A.3.1}\

Given that other tests (particularly those in sections~\ref{WP10} and~\ref{A2}) exercise the tools notions of what is and is not in scope, it suffices to check a few simple cases:
=SML
clean_up();
new_script{name="Q", unit_type="proc"};
ⓈCN
procedure Q(A : in out INTEGER)
Δ A [ A > A⋎0 ]
is
 X, Y : INTEGER;
 procedure P1
 Δ X [true]
 is begin Δ [true] (1) end P1;
 procedure P2 (Y : in out INTEGER)
 Δ Y [ true ]
 is begin Δ [true] (2) end P2;
 procedure P3 (Z : in out INTEGER)
  Δ X, Z [ true ]
 is begin Δ [true] (3) end P3;
begin
 Δ A, Y [ A > A⋎0 ] (4)
end Q;
■
=SML
fun int513_A_3_1_1() =
ⓈCN
 (4) ⊑ A:= A + 1; P1; -- should fail P1 can change X
■
=SML
fun int513_A_3_1_2() =
ⓈCN
 (4) ⊑ A:= A + 1; P2(X); -- should fail P2(X) can change X
■
=SML
fun int513_A_3_1_3() =
ⓈCN
 (4) ⊑ A:= A + 1; P3(A); -- should fail P3(A) can change X
■
=SML
fun int513_A_3_1_4() =
ⓈCN
 (4) ⊑ Y := A; P2(A); A := Y + 1; -- should be OK
■
=SML
store_mt_results_show
mt_run_fail
[("int513.A.3.1.1", int513_A_3_1_1, (), gen_fail_msg "check_1_a" 505064["A, Y", "X"]),
("int513.A.3.1.2", int513_A_3_1_2, (), gen_fail_msg "check_1_a" 505064["A, Y", "X"]),
("int513.A.3.1.3", int513_A_3_1_3, (), gen_fail_msg "check_1_a" 505064["A, Y", "X, A"])];
=TEX
=SML
store_mt_results_show
mt_run [("int513.A.3.1.4", check_fail, int513_A_3_1_4, false)];
=TEX
\section{EPILOGUE}
=SML
diag_line (summarize_mt_results());
=TEX
\pagebreak
\end{document}
=IGN
=IGN
********************************************************************************
int525.doc: this file is part of the PPDaz system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
=TEX
%%%%% YOU MAY WANT TO CHANGE POINT SIZE IN THE FOLLOWING:
\documentclass[a4paper,12pt]{article}

%%%%% YOU CAN ADD OTHER PACKAGES AS NEEDED BELOW:
\usepackage{A4}
\usepackage{Lemma1}
\usepackage{ProofPower}
\usepackage{epsf}

%%%%% YOU WILL USUALLY WANT TO CHANGE THE FOLLOWING TO SUIT YOU AND YOUR DOCUMENT:

\def\Title{ Compliance Tool --- 2.7.4--2.7.6 Enhancement Tests}

\def\Abstract{\begin{center}
{\bf Abstract}\par\parbox{0.7\hsize}
{\small This document provides integration tests to support the enhancements developed
for versions 2.7.4 to 2.7.7 of the Compliance Tool during 2004--2006.}
\end{center}}

\def\Reference{LEMMA1/DAZ/INT525}

\def\Author{R.D. Arthan}

\def\EMail{{\tt rda@lemma-one.com}}

\def\Phone{+44 118 948 4409}

\def\Fax{+44 118 946 1920}

%%%%% YOU MAY WANT TO CHANGE THE FOLLOWING TO GET A NICE FRONT PAGE:
\def\FrontPageTitle{ {\huge \Title } }
\def\FrontPageHeader{\raisebox{16ex}{\begin{tabular}[t]{c}
\bf Copyright \copyright\ : Lemma 1 Ltd \number\year\\\strut\\
\end{tabular}}}
\begin{centering}



\end{centering}

%%%%% THE FOLLOWING DEFAULTS WILL GENERALLY BE RIGHT:


\def\Version{\VCVersion}
\def\Date{\FormatDate{\VCDate}}

%%%%% NOW BEGIN THE DOCUMENT AND MAKE THE FRONT PAGE

\begin{document}
\underscoreoff
\headsep=0mm
\FrontPage
\headsep=10mm

%%%%% STANDARD RED-TAPE SECTIONS (MAY WANT TO INTERLEAVE SOME \newpage COMMANDS IN THESE)

%%%%% CONTENTS:

\subsection{Contents}

\tableofcontents

%%%%% REFERENCES:

\subsection{References}

\bibliographystyle{fmu}

%%%%% CHANGE THE FOLLOWING AS NECESSARY (E.G., TO PICK UP daz.bib):
h{\raggedright
\bibliography{fmu,daz}
}
%%%%% CHANGES HISTORY:
\subsection{Changes History}
\begin{description}
\item[Issues 1.1 (2004/10/07)]  Test for PC61
\item[Issues 1.2 (2004/10/07)]  Test for PC63
\item[Issues 1.3 (2004/10/09)]  Test for MA37
\item[Issue 1.4 (2004/10/26)] Test for liberalised renaming and for fix to informal procedure unsoundness problem.
\item[Issue 1.5 (2004/10/27)] Test for option to ignore SPARK annotations (QQ52).
\item[Issue 1.6 (2004/11/03)] Improved coverage of tests for renaming.
\item[Issue 1.7 (2004/11/18)] Test treatment of forward declarations of informal functions.
\item[Issue 1.8 (2004/11/24)] Test that initial variables corresponding to out mode parameters give an error.
\item[Issue 1.9 (2004/12/08)] Test that labelled statements and goto statements are handled correctly.
\item[Issue 1.10 (2005/02/26)] Added tests for QQ73.
\item[Issues 1.11 (2005/04/22),1.12 (2005/04/22)] Added tests for QQ85.
\item[Issue 1.13 (2005/05/12)] Added tests for QQ74.
\item[Issue 1.14 (2005/05/28)] Compliance Notation reserved words are now prefixed by a dollar sign.
\item[Issue 1.15 (2005/06/02)] Added test to show that results of {\em fmt\_web\_clause} can be processed back into the tool.
\item[Issues 1.16 (2005/07/26), 1.17 (2005/08/01)] Added tests for QQ94 and QQ95.
\item[Issue 1.18 (2005/08/16)] Tests for QQ98.
\item[Issues 1.19 (2005/09/14)--1.21 (2005/09/15)] Tests adjusted added for enhanced error messages when formal material invalidly contains free variables.
\item[Issue 1.22 (2005/09/21)] Added tests for new VC soundness warnings.
\item[Issue 1.23 (2005/09/22)] Allowed for fix to problem with object renamings in package specifications.
\item[Issue 1.24 (2005/12/07)] Added tests for enhancements 114 (allow unqualified aggregates inside other aggregates) and 115 (implicit subprogram declarations).
\item[Issue 1.25 (2005/12/07)] Tests for enhancement 122 (left-associative set unions).
\item[Issue 1.26 (2006/01/13)] Allowed for fix to analysis of free variables in VCs.
\item[Issue 1.27 (2006/01/14)] Allowed for various changes to error handling.
\item[Issue 1.28 (2006/01/16)] Added test for QQ130.
\item[Issue 1.31 (2006/03/28)] Allowed for automated state management.
\item[Issue 1.32 (2006/03/28)] Added test for QQ118.
\item[Issues 1.32 (2006/03/28), 1.33 (2006/03/28)] Fully allowed for enhancement 118.
\item[Issue 1.35 (2006/04/07)] Allowed for insistence on canonical names in Z under enhancement 117
\item[Issue 1.36 (2006/04/11)] Allowed for new uniform checks on Z names
\item[Issue 1.37 (2006/04/12)] Added tests for support for general expanded names.
\item[Issue 1.38 (2006/04/13)] More tests for implicit subprogram declarations.
\item[Issue 1.39 (2006/04/13)] Tests for bug-fix 144.
\item[Issue 1.40 (2006/05/04)] Tests changed to accommodate bug-fix 153.
\item[Issue 1.41 (2006/05/05), 1.42 (2006/05/05)] Allowed for and tested new handling of function and constant renamings.
\item[Issue 1.43 (2006/05/30)] Added test for bugfix (issue 155).
\item[Issue 1.44 (2006/05/31)] Added tests to check proper use of rationalised data type for subunits (part of issue 139).
\item[Issues 1.45 (2006/06/01), 1.46 (2006/06/01)] Accommodated enhancement 139 --- 1--theory--per--subprogram.
\item[Issues 1.47 (2006/06/13), 1.48 (2006/06/14)] Added tests for enhancement 157.
\item[Issue 1.49 (2006/06/26)] Made it set the current theory properly on start-up.
\item[Issue 1.50 (2006/07/21)] accommodated enhancement 139 - 1-theory-per-subprogram.
\item[Issue 1.51 (2006/08/02)] Tested fix to treatment of extended characters in Z strings.
\item[Issue 1.52 (2006/08/09)] Tests for new {\em cn\_spark\_annotation\_char} control.
\item[Issue 1.53 (2006/08/10)] Tests for auxiliary variables declarations with multiple variables.
\item[Issue 1.54 (2006/09/16), 1.55 (2006/09/16)] Tests for new {\em open\_scope} command.
\item[Issue 1.56 (2006/09/17)--1.58 (2006/09/18)] Tests for deferred subprograms.
\item[Issue 1.59 (2006/09/19)] Allowed for enhancement 165.
\item[Issue 1.60 (2007/01/23)] {\em cn\_subprog\_ud\_key} now defined in the Z output module.
\item[Issue 1.61 (2007/05/12)] Made a start on tests for issue 192.
\item[Issue 1.62 (2007/05/13)] Made it comply with Ada rules for loop names.
\item[Issue 1.63 (2007/05/18)] Made it work with agreed syntax for issue 192.
\item[Issues 1.64 (2007/05/22), 1.65 (2007/05/26)] Added real tests for issue 192.
\item[Issue 1.66 (2007/05/28)] Tests for range checks for real types.
\item[Issue 1.67 (2007/11/11)] Tests for deleting deferred subprograms.
\item[Issue 1.68 (2008/03/23)] Tests for child packages.
\item[Issue 1.69 (2008/03/24), 1.70 (2008/03/24)] Modular types.
\item[Issue 1.71 (2008/05/05)] Tests for modular types backed out temporarily.
\item[Issue 1.72 (2008/05/05)] Added tests for QQ306 and QQ309.
\item[Issue 1.73 (2008/07/24)] Adjustments for reworked implementation of SPARK annotations.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.
\item[2014/09/07]
Now uses ``.sml'' suffix for temporary ML source files.

%%%% END OF CHANGES HISTORY %%%%
\end{description}

%%%%%  CHANGES FORECAST:

\subsection{Changes Forecast}

None.

%%%%% DISTRIBUTION LIST

\subsection{Distribution}
\begin{center}
\begin{tabular}{ll}
Rob Arthan & Lemma 1
\end{tabular}
\end{center}


\section{INTRODUCTION}\label{INTRODUCTION}
This document is intended to provide integration tests to cover
the enhancements undertaken under the programme
of enhancements carried out in Autumn 2004 resutling in version 2.7.4 of the Compliance Tool.

Note the vast majority of the tests for 2.7.4 are actually distributed where they belong in other test docuemnts (and a few are misplaced in \cite{LEMMA1/DAZ/INT524} for historical reasons).

\section{PREAMBLE}
Load the test harness.

=SML
use_file "dtd013";
use_file "imp013";
=TEX
Function to clean up before doing a test.

=SML
open_theory "cn";
val reset_cn = pending_reset_cn_state();
fun clean_up () = (
        let     val thys = (get_descendants "cn" less "cn"
                                        diff get_cache_theories())
                fun del_thy thy = (force_delete_theory thy handle Fail _ => ());
	val err_scrs =map fst (CNZGenerator.get_exception_logs());
        in      map del_thy thys;
	map delete_exception_log err_scrs;
	reset_cn();
	open_theory"cn";
	set_pc "cn1"
        end;    ()
);
=TEX
For batch use turn off subgoal package output:
=SML
set_flag("subgoal_package_quiet", not(ExtendedIO.is_term_in std_in));
=TEX
Work in proof context cn1 by default:
=SML
set_pc "cn1";
=TEX
\section{THE TESTS}
\subsection{PC61: Data refinement in global dependencies of procedures}
=SML
clean_up();
new_script {name = "A", unit_type="spec"};

ⓈCN
package A is
  $auxiliary A : ℤ;
  procedure P (Y : out Integer)
    Δ Y Ξ A [ Y = A + 1 ]
  ;
end A;
■
=TEX
=SML
new_script {name = "A", unit_type="body"};
ⓈCN
package body A is
  $using C : Integer; $implement A $by C = ~A;
  procedure P (Y : out Integer)
    Δ Y Ξ C [ Y = ~C + 1 ]             -- should work now
  --Δ Y, C Ξ [ Y = ~C + 1 ∧ C = C⋎0 ]  -- ok
  is begin
    Y := 1 - C;
  end P;
end A;
■
=TEX
=SML
open_theory "cn";
set_pc"cn1";
open_theory "AoP'proc";
set_goal([], get_conjecture"-""vcAoP_1");
a(cn_vc_simp_tac[]);
store_mt_results
mt_run
 [("PC61.1.1", fun_true o pop_thm , (), true)];
open_theory "A'body";
set_goal([], get_conjecture"-""vcA_1");
a(REPEAT strip_tac THEN z_∃_tacⓩ~C⌝ THEN rewrite_tac[]);
store_mt_results
mt_run
 [("PC61.1.2", fun_true o pop_thm , (), true)];
set_goal([], get_conjecture"-""vcA_2");
a(REPEAT strip_tac THEN z_∃_tacⓩ~C⌝ THEN asm_rewrite_tac[]);
store_mt_results
mt_run
 [("PC61.1.3", fun_true o pop_thm , (), true)];
set_goal([], get_conjecture"-""vcA_3");
a(REPEAT strip_tac THEN z_∃_tacⓩ~C⌝ THEN asm_rewrite_tac[]);
store_mt_results
mt_run
 [("PC61.1.4", fun_true o pop_thm , (), true)];
=TEX
\subsection{PC63: Data refinement in global dependencies of procedures}
=SML
clean_up();
new_script {name = "A", unit_type="spec"};
ⓈCN
package A is
  procedure P;
end A;
■
=TEX
=SML
new_script {name = "A", unit_type="body"};
ⓈCN
package body A is

  X : Boolean;
  Y : Integer;

  ⟨ F ⟩		(1)

  ⟨ P ⟩		(2)

end A;
■
ⓈCN
 (1) ≡
  function F return Boolean Ξ X [ F X = X ] is begin return X; end F;
■
ⓈCN
 (2) ≡
  procedure P
    Δ Y Ξ X [ X = TRUE ∧ Y = 5 ∨ X = FALSE ∧ Y = 7 ]
  is begin
    if F
    then
      Y := 5;
    else
      Y := 7;
    end if;
  end P;
■
=TEX
=SML
open_theory"cn";
set_pc"cn1";
open_theory"AoF'func";
set_goal([], get_conjecture"-""vcAoF_1");
a(cn_vc_simp_tac[]);
store_mt_results
mt_run
 [("PC63.1.1", fun_true o pop_thm , (), true)];
=TEX
\subsection{MA37: More liberal treatment of using clauses}
Various cases to test.

1) General ability to introduce using clause in k-slot.
=SML
clean_up();
new_script {name = "A", unit_type="spec"};

ⓈCN
package A is
  $auxiliary A : ℤ;
  procedure P (Y : out Integer)
    Δ Y Ξ A [ Y = A + 1 ]
  ;
end A;
■
=TEX
=SML
new_script {name = "A", unit_type="body"};
ⓈCN
package body A is
 ⟨ using clause and procedure p ⟩			( 1 )
end A;
■

ⓈCN
 (1) ≡
  $using C : Integer; $implement A $by C = ~A;
  procedure P (Y : out Integer)
    Δ Y Ξ C [ Y = ~C + 1 ]             -- should work now
  --Δ Y, C Ξ [ Y = ~C + 1 ∧ C = C⋎0 ]  -- ok
  is begin
    Y := 1 - C;
  end P;
■
=TEX
=SML
open_theory "AoP'proc";
set_pc"cn1";
set_goal([], get_conjecture"-""vcAoP_1");
a(cn_vc_simp_tac[]);
store_mt_results
mt_run
 [("PC37.1.1", fun_true o pop_thm , (), true)];
=TEX
2) Propagation of using clause into other k-slot.
=SML
clean_up();
new_script {name = "A", unit_type="spec"};

ⓈCN
package A is
  $auxiliary A : ℤ;
  procedure P (Y : out Integer)
    Δ Y Ξ A [ Y = A + 1 ]
  ;
end A;
■
=TEX
=SML
new_script {name = "A", unit_type="body"};
ⓈCN
package body A is
 ⟨ using clause ⟩			( 1 )
 ⟨ procedure p ⟩			( 2 )
end A;
■

ⓈCN
 (1) ≡  $using C : Integer; $implement A $by C = ~A;
■
ⓈCN
 (2) ≡
  procedure P (Y : out Integer)
    Δ Y Ξ C [ Y = ~C + 1 ]             -- should work now
  --Δ Y, C Ξ [ Y = ~C + 1 ∧ C = C⋎0 ]  -- ok
  is begin
    Y := 1 - C;
  end P;
■
=TEX
=SML
open_theory "AoP'proc";
set_pc"cn1";
set_goal([], get_conjecture"-""vcAoP_1");
a(cn_vc_simp_tac[]);
store_mt_results
mt_run
 [("PC37.2.1", fun_true o pop_thm , (), true)];
=TEX
3) Error cases: using clause are only allowed in package body:
=SML
clean_up();
new_script {name = "P", unit_type="proc"};

=SML
fun check37_3() = (
ⓈCN
 procedure P (Y : out Integer)
    Δ Y [ Y = 42 ]
  is
  $using C : Integer; $implement A $by C = ~A;
 begin
    Y := 1 - C;
  end P;
■
=SML
false) handle Fail _ => true;
store_mt_results
mt_run
 [("PC37.3.1", check37_3 , (), true)];
=TEX
\subsection{QQ50: Liberalise renaming of informal procedures and functions}
Renaming declation of informal procedure should not give rise to error:
=SML
clean_up();
new_script {name = "P1", unit_type="proc"};
ⓈCN
 procedure p1
 Δ [ true ]
 is
  procedure q (x : in out integer)
  is begin x := 1; end q;
  procedure rq  (x : in out integer) renames q;
begin
 null; -- should not fail
end p1;
■
=TEX
Just need to get here to pass the first test:
=SML
store_mt_results
mt_run
 [("Renames.1.1", fun_true , (), true)];
=TEX
Attempt to use the procedure via the new name should fail:
=SML
clean_up();
new_script {name = "P1", unit_type="proc"};
=SML
fun renames2() =
ⓈCN
 procedure p1
 Δ [ true ]
 is
  procedure q (x : in out integer)
  is begin x := 1; end q;
  procedure rq  (x : in out integer) renames q;
begin
 rq; -- should fail
end p1;
■
=TEX
Check that it raises an exception
=SML
store_mt_results
mt_run
 [("Renames.2.1", (fn _ => (renames2 (); false) handle Fail _ => true) , (), true)];
=TEX
Check out renaming of functions in package specifications.
=SML
clean_up();
new_script {name = "A", unit_type="spec"};
=SML
ⓈCN
package A is

  function F return Integer;

  function G return Integer renames F;

  function F1 return Integer
   Ξ [AoF1 = 100] ;

end A;
■
=TEX
=SML
new_script {name = "B", unit_type="spec"};
=SML
ⓈCN
with A;
package B is

  function H return Integer renames A.F;
  function I return Integer renames A.G;
  function H1 return Integer renames A.F1;
end B;
■
=TEX
=SML
new_script {name = "P", unit_type="proc"};
=SML
ⓈCN
$references A;
with B;
use B;
procedure P(X : out Integer)
is
  function PF return Integer renames B.I;
begin
  Δ X [X > 0]
end P;
■
ⓈCN
  ⊑ X := H1;
■
=TEX
=SML
set_pc"cn1";

set_goal([], get_conjecture"-""vc_1_1");
a(rewrite_tac (map z_get_spec[ⓩAoF1⌝]));
store_mt_results
mt_run
 [("Renames.3.3", fun_true o pop_thm , (), true)];
=SML
=TEX
=TEX
\subsection{QQ51: Fix unsoundness caused by ignoring informal procedures}
Multiple informal procedures should not give rise to error:
=SML
clean_up();
new_script {name = "P1", unit_type="proc"};
=SML
fun check_inf_proc_1_1() =
ⓈCN
 procedure p1
 Δ [ true ]
 is
  procedure q (x : in out integer)
  is begin x := 1; end q;
  procedure q (y : in out integer)
  is begin x := 1; end q;
begin
 null; -- should not fail
end p1;
■
=TEX
=SML
store_mt_results
mt_run_fail
 [("InfProc.1.1", check_inf_proc_1_1 , (),
	gen_fail_msg "subprogram_implementation" 507143 ["P1oQ"])];
=TEX
Attempt to declare formal after informal  should fail:
=SML
clean_up();
new_script {name = "P1", unit_type="proc"};
=SML
fun inf_proc2() =
ⓈCN
 procedure p1
 Δ [ true ]
 is
  procedure q (x : in out integer)
  is begin x := 1; end q;
  procedure q (x : in out integer)
 Δ X [ X = 1 ]
  is begin x := 1; end q;
begin
 null;
end p1;
■
=TEX
Check that it raises an exception
=SML
store_mt_results
mt_run
 [("InfProc.2.1", (fn _ => (inf_proc2 (); false) handle Fail _ => true) , (), true)];
=TEX
Attempt to declare informal after formal  should fail:
=SML
clean_up();
new_script {name = "P1", unit_type="proc"};
=SML
fun inf_proc3() =
ⓈCN
 procedure p1
 Δ [ true ]
 is
  procedure q (x : in out integer)
 Δ X [ X = 1 ]
  is begin x := 1; end q;
  procedure q (x : in out integer)
  is begin x := 1; end q;
begin
 null;
end p1;
■
=TEX
Check that it raises an exception
=SML
store_mt_results
mt_run
 [("InfProc.3.1", (fn _ => (inf_proc3 (); false) handle Fail _ => true) , (), true)];
=TEX
\subsection{QQ52: Option to ignore SPARK annotations}
Renaming declation of informal procedure should not give rise to error:
=SML
clean_up();
new_script {name = "A", unit_type="spec"};
ⓈCN
package A is

end A;
■

=SML
new_script {name = "B", unit_type="spec"};
ⓈCN
package B is

end B;
■

=SML

new_script {name = "C", unit_type="spec"};

=SML
fun qq52_fail () =
ⓈCN

with A;

--# inherits A

$references B;

-- works here ok

package C is

end C;
■
=TEX
Check that the above raises an exception
=SML
store_mt_results
mt_run
 [("qq52.1.1", (fn _ => (qq52_fail (); false) handle Fail _ => true) , (), true)];
=TEX
Now change the flag and check that it works:
=SML
val was_i_s_a = set_flag("cn_ignore_spark_annotations", true);
store_mt_results
mt_run
 [("qq52.1.2", (fn _ => (qq52_fail (); false) handle Fail _ => true) , (), false)];
val _ = set_flag("cn_ignore_spark_annotations", was_i_s_a);
=TEX
=TEX
\subsection{QQ55: Support forward declaration of informal functions}
Multiple informal functions should not give rise to error:
=SML
clean_up();
new_script {name = "P1", unit_type="proc"};
=SML
fun check_inf_fun_1_1() =
ⓈCN
 procedure p1
 Δ [ true ]
 is
  function q (x : in out integer) return integer
  is begin x := 1; return x; end q;
  function q (y : in out integer) return integer
  is begin x := 1; return x; end q;
begin
 null; -- should not fail
end p1;
■
=TEX
Just need to get here to pass the first test:
=SML
store_mt_results
mt_run_fail
 [("InfFun.1.1", check_inf_fun_1_1 , (),
	gen_fail_msg "subprogram_implementation" 507143 ["P1oQ"])];
=TEX
Now try it with a forward declaration:
=SML
clean_up();
new_script {name = "P1", unit_type="proc"};
ⓈCN
 procedure p1
 Δ [ true ]
 is
  function q (x : in out integer) return integer;
  function q (x : in out integer) return integer
  is begin x := 1; return x; end q;
begin
 null; -- should not fail
end p1;
■
=TEX
Just need to get here to pass the second test:
=SML
store_mt_results
mt_run
 [("InfFun.1.2", fun_true , (), true)];
=TEX
Now try an error case:
=SML
clean_up();
new_script {name = "P1", unit_type="proc"};
fun inf_fun3() =
ⓈCN
 procedure p1
 Δ [ true ]
 is
  q : integer;
  function q (x : in out integer) return integer
  is begin x := 1; return x; end q;
begin
 null; -- should not fail
end p1;
■
=TEX
=SML
store_mt_results
mt_run
 [("InfFun.1.3", (fn () => (inf_fun3(); false) handle Fail _ => true) , (), true)];
=TEX
\subsection{QQxx: Disallow initial variables corresponding to out mode parameters}
=SML
clean_up();
new_script{name = "TEST1", unit_type="proc"};
fun init_var_err() =
ⓈCN
procedure TEST1
is
  procedure P (X : in INTEGER; Y : out INTEGER)
  Δ Y [X ≠ 2 ⇒ Y = Y⋎0]
  is
  begin
    if X = 2 then Y := 2; end if;
  end P;
  A : INTEGER;
  B : INTEGER;
begin
  Δ A, B [B = 99]				( 1 )
end TEST1;
■
=TEX
=SML
store_mt_results
mt_run
 [("Initvar.1.1", (fn () => (init_var_err(); false) handle Fail _ => true) , (), true)];
=TEX
\subsection{QQ68: Labelled statements and goto statements}
=SML
clean_up();
new_script{name = "TEST1", unit_type="proc"};
ⓈCN
procedure TEST1
is
 b : integer;
begin
  Δ B [B = 99]				( 1 )
end TEST1;
■
=SML
fun fail68_1() =
ⓈCN
 (1) ⊑ goto pack1.label;
■
=TEX
=SML
store_mt_results
mt_run
 [("LabelsAndGotos.1.1", (fn () => (fail68_1(); false) handle Fail _ => true) , (), true)];
ⓈCN
 (1) ⊑  <<label>> ΔB [B = 99] (2)
■
ⓈCN
 (2) ⊑  b := 99;
■
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"-""vc1_2");
a(cn_vc_simp_tac[]);
store_mt_results
mt_run
 [("LabelsAndGotos.1.2", fun_true o pop_thm , (), true)];
set_goal([], get_conjecture"-""vc2_1");
a(cn_vc_simp_tac[]);
store_mt_results
mt_run
 [("LabelsAndGotos.1.3", fun_true o pop_thm , (), true)];
=TEX
\subsection{QQ73: Improved handling of initial variables in side conditions}
First check Phil Clayton's original example.
=SML
clean_up();
new_script {name = "A", unit_type="spec"};
ⓈCN
package A is
  procedure Eg1;
  procedure Eg2;
end A;
■
=TEX
=SML
new_script {name = "A", unit_type="body"};
ⓈCN
package body A is
  A, X, Y : Integer;
  procedure Eg1
  is
  begin
    Δ A, Y [ A = A⋎0 + 1 ]		(1)
  end Eg1;
  procedure Eg2
  is
  begin
    Δ A, Y [ A = X, A = X + 1 ]		(2)
  end Eg2;
end A;
■

=SML
open_scope "A.Eg1";
ⓈCN
 (1) ⊑
  Δ Y [ true ]		(3)
  A := A + 1;
■
=SML
open_scope "A.Eg2";
ⓈCN
 (2) ⊑
  Δ Y [ true ]		(4)
  A := A + 1;
■
=SML
val vc_conjs1 = map (snd o snd) (get_conjectures "-");
fun vc_thms1 () = (map (pc_rule1 "cn1" prove_rule[]) vc_conjs1; ());
store_mt_results
mt_run
 [("qq73.1.1", vc_thms1 , (), ())];
=TEX
Now try the important example where a procedure updates just a part of an entire variable.
=SML
clean_up();
new_script {name = "P", unit_type="proc"};
ⓈCN
procedure p
is
  procedure q(x : in out integer; y : in integer)
  Δ X [ X = Y ]
  is begin x := y; end;
  type t is record a, b : integer; end record;
  rec : t;
begin
  Δ REC [ REC.A = REC⋎0.A ∧ REC.B = 1] (1)
end;
■
ⓈCN
 (1) ⊑
 q(rec.b, 1);
■
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"-""vc1_2");
a(cn_vc_simp_tac[] THEN REPEAT strip_tac THEN
	asm_rewrite_tac[z_gen_pred_elim[ⓩ𝕌⌝] (z_get_specⓩTuB⌝)]);
store_mt_results
mt_run
 [("qq73.1.2", fun_true o pop_thm , (), true)];
=TEX
\subsection{QQ85: Derived Types}
=SML
clean_up();
new_script{name = "MAIN", unit_type="proc"};

ⓈCN
 procedure main
 is
  type ty1 is new integer range 1 .. 15;
  x1 : ty1;
 begin
 Δ X1 [ X1 = 14 ]
 end main;
■


ⓈCN
  ⊑  x1 := ty1'last - x1'first;
■
=SML
val _ = cn_make_script_support "-" "MAIN'proc";
set_pc"MAIN'proc";
set_goal([], get_conjecture"-""vc_1_1");
a(cn_vc_simp_tac[]);
store_mt_results
mt_run
 [("85.1.1", fun_true o pop_thm , (), true)];
=TEX
=TEX
\subsection{QQ74: Early Creation of Package Spec Theory}
This facility has been completely superseded by enhancement 117
and has been withdrawn.

\subsection{QQ83: Prefix CN Keywords with a Dollar}
That the new syntax works is checked by test scripts passim.
We add some specific tests to show that the web clauses output by the tool can be read back in again (as happens in Phil Clayton's refinement calculator).

=SML
clean_up();
new_script{name = "FOURTH_ROOT", unit_type="proc"};
=TEX
=SML
val results : string list list ref = ref [];
fun record_last () = (
	let	open CNAdaOutput CNZGenerator;
		val wc = !diag_web_clause;
		val strs =
			strings_from_fmt1 fmt_web_clause wc;
	in	results := strs :: !results
	end
);
fun cn_recogniser x = (
	WebClauses.cn_recogniser x;
	record_last()
);
fun output_results (strm : outstream) = (
	let	fun  outln s = (
			output(strm, s);
			output(strm, "\n")
		);
		fun do1 (""::strs) = (
			app outln strs
		) | do1 strs = (
			outln (translate_for_output "ⓈCN");
			app outln strs;
			outln (translate_for_output "■")
		);
	in	map do1 (rev (!results))
	end
);
ⓈCN
procedure FOURTH_ROOT is
 N,F : INTEGER;
 ⟨ square root function ⟩			(1)
begin
 Δ F [N ≥ 0, F ** 4 ≤ (F + 1) ** 4]	(2)
end FOURTH_ROOT;
■
ⓈCN
(1) ≡
function SQRT (X : INTEGER) return INTEGER
 Ξ [X ≥ 0, (SQRT(X)) ** 2 ≤ X < (SQRT(X) + 1) ** 2]
is
 LO : INTEGER := 0;
 MID, HI : INTEGER;
begin
 LO := 0;
 HI := X + 1;
 while LO +1 /= HI
 loop
 Δ MID, LO, HI [LO ** 2 ≤ X < HI ** 2, LO ** 2 ≤ X < HI ** 2]	(4)
 end loop;
 return LO;
end SQRT;
■
ⓈCN
(2) ⊑
 F := SQRT(N);
 F := SQRT(F);
■
=SML
open_scope "FOURTH_ROOT.SQRT";
results := ["", translate_for_output "open_scope \"FOURTH_ROOT.SQRT\";"] :: !results;
ⓈCN
(4) ⊑
 MID := (LO + HI)/2;
 if X >= MID ** 2
 then LO := MID;
 else HI := MID;
 end if;
■
=SML
val cn_recogniser = WebClauses.cn_recogniser;
val strm = open_out "int525.A.sml";
output_results strm;
close_out strm;
clean_up();
new_script{name = "FOURTH_ROOT", unit_type="proc"};
store_mt_results
mt_run
 [("qq83.1.1", use_file , "int525.A.sml", ())];
=TEX
\subsection{QQ94: Generate Domain Conditions from Subtype Constraints in Procedure Call, Assignment and Return Statements}
=SML
val old_cdc = set_int_control("cn_domain_conds", cn_standard_domain_conds);
=TEX
The first example deals with procedure calls.
In the following, the call to {\tt q} from {\tt p} results in a domain condition asserting that  the array index {\tt i} is in range.
Without this, the correctness of {\tt p} would not be provable.
=SML
clean_up();
new_script {name = "MAIN", unit_type="proc"};
ⓈCN
 procedure main
 is
  type ind10 is range 1 .. 10;
  type int10 is array (ind10) of integer;
  procedure q (a : int10; i : ind10; r : out integer)
  Δ R [R = A I]
  is
  begin
   r := a(i);
  end;
  procedure p (a : int10; i : integer; r : out integer)
  Δ R [ ran A ⊆ ℕ, R ∈ ℕ]
  is
  begin
   q(a, i, r);
  end;
  x : integer;
 begin
  Δ [true]
 end;
■
=SML
open_theory "cn";
set_pc "cn1";
open_theory "MAINoQ'proc";
set_goal([], get_conjecture "-" "vcMAINoQ_1");
a(cn_vc_simp_tac[]);
val vcMAINoQ_1 = save_pop_thm "vcMAINoQ_1";
=TEX
=SML
open_theory "MAINoP'proc";
set_goal([], get_conjecture "-" "vcMAINoP_1");
a(cn_vc_simp_tac[]);
val vcMAINoP_1 = save_pop_thm "vcMAINoP_1";
=TEX
=SML
set_goal([], get_conjecture "-" "vcMAINoP_2");
a(cn_vc_simp_tac[z_get_specⓩINT10⌝] THEN REPEAT strip_tac
	THEN all_var_elim_asm_tac1);
a(all_fc_tac[z_fun_dom_clauses]);
a(all_fc_tac[z_→_dom_thm]);
a(all_fc_tac[z_→_app_∈_rel_thm]);
a(PC_T1 "z_library_ext" asm_prove_tac[]);
val vcMAINoP_2 = save_pop_thm "vcMAINoP_2";
=TEX
=SML
fun check_conjecture name = (
	let	val tm = get_conjecture "-" name;
		val thm = get_thm "-" name;
	in	is_nil (asms thm) andalso tm =$ concl thm
	end
);
open_theory"MAIN'proc";
store_mt_results
mt_run
 [("qq94.1.1.1", all (map (hd o fst) (get_conjectures "-")), check_conjecture, true)];
open_theory"MAINoQ'proc";
store_mt_results
mt_run
 [("qq94.1.1.2", all (map (hd o fst) (get_conjectures "-")), check_conjecture, true)];
open_theory"MAINoP'proc";
store_mt_results
mt_run
 [("qq94.1.1.3", all (map (hd o fst) (get_conjectures "-")), check_conjecture, true)];
=TEX
The second example deals with assignment statements.
The procedure {\tt p} only achieves its post-condition given the domain condition that asserts that the right-hand side of the assignment statement in the body of {\tt p} lies in the subtype of the left-hand side.
=SML
clean_up();
new_script {name = "A", unit_type="spec"};
ⓈCN
package A is
   type T is range -100 .. 100;
   subtype ST is T range -10 .. 10;
   procedure P (U : in ST; V : out ST);
end A;
■
=TEX
=SML
new_script {name = "A", unit_type="body"};
ⓈCN
package body A is
   X, Y : T;
   ⟨ procedure P ⟩	(2)
begin
   Δ Y [ Y ∈ AoST ]	(3)
end A;
■
ⓈCN
 (2) ≡
   procedure P (U : in ST; V : out ST)
      Δ V [ V ∈ AoST ]
   is
   begin
      V := U + 1;
   end P;
■
ⓈCN
 (3) ⊑
   P (U => X, V => Y);
■
=TEX
=SML
val thms_94_2 = map (fn name =>
	(set_goal ([], get_conjecture "-"  name);
	a (cn_vc_simp_tac []);
	save_pop_thm name))
	((rev o map (hd o fst) o get_conjectures) "-");
store_mt_results
mt_run
 [("qq94.2.1", all (map (hd o fst) (get_conjectures "-")), check_conjecture, true)];
=TEX
The third example deals with return statements.
It is essentially the same as the second example but using a function in place of a procedure with an {\tt out} mode parameter.
=SML
clean_up();
new_script {name = "A", unit_type="spec"};
ⓈCN
package A is
   type T is range -100 .. 100;
   subtype ST is T range -10 .. 10;
   procedure P (U : in ST; V : out ST);
end A;
■
=TEX
=SML
new_script {name = "A", unit_type="body"};
ⓈCN
package body A is
   X, Y : T;
   ⟨ function F ⟩	(2)
begin
   Δ Y [ Y ∈ AoST ]	(3)
end A;
■
ⓈCN
 (2) ≡
   function F (U : in ST) return ST
      Ξ [ F U ∈ AoST ]
   is
   begin
      return U + 1;
   end F;
■
ⓈCN
 (3) ⊑
   Y := F(X);
■
=TEX
=SML
open_theory "cn";
set_pc "cn1";
open_theory "AoF'func";
set_goal([], get_conjecture "-" "vcAoF_1");
a(REPEAT strip_tac THEN asm_rewrite_tac[]);
val _ = save_pop_thm "vcAoF_1";
=TEX
=SML
open_theory "A'body";
set_goal([], get_conjecture "-" "vc3_1");
a(REPEAT strip_tac);
a(strip_asm_tac (rewrite_rule[](z_get_specⓩF⌝)));
a(all_fc_tac[z_fun_dom_clauses]);
a(DROP_NTH_ASM_T 4 ante_tac THEN asm_rewrite_tac[]);
val _ = save_pop_thm "vc3_1";
=TEX
=SML
store_mt_results
mt_run
 [("qq94.3.1.1", all (map (hd o fst) (get_conjectures "-")), check_conjecture, true)];
open_theory "AoF'func";
mt_run
 [("qq94.3.1.2", all (map (hd o fst) (get_conjectures "-")), check_conjecture, true)];
=SML
val _ = set_int_control("cn_domain_conds", old_cdc);
=TEX
=TEX
\subsection{QQ95: Fix Inappropriate error 508081}
=SML
clean_up();
new_script {name = "B", unit_type="spec"};
ⓈCN
package B is
  procedure P;
end B;
■
=SML
new_script {name = "B", unit_type="body"};
fun chk95_1() =
ⓈCN
package body B is
   X, Y : Integer;
   function F (X : Integer) return Integer Ξ [ true ] is begin return X; end F;
   procedure P Δ X [ true ] is begin X := F(Y); end P;
end B;
■
=SML
store_mt_results
mt_run_fail
[
	("95.1.1", chk95_1, (),  gen_fail_msg "zid" 508077 ["Y"])
];
=TEX
=SML
fun chk95_2() =
ⓈCN
package body B is
   X, Y : Integer;
   function F (X : Integer) return Integer Ξ [ true ] is begin return X; end F;
   procedure P Δ X [ true ] is begin X := F(YYY); end P;
end B;
■
=SML
store_mt_results
mt_run_fail
[
	("95.2.1", chk95_2, (),  gen_fail_msg "zid" 508021 ["YYY"])
];
=TEX
=TEX
\subsection{QQ98: improve error messages for procedure specification statements}
=SML
clean_up();
new_script {name = "TEST", unit_type="spec"};
ⓈCN
package TEST is
  X : INTEGER;
  Y : FLOAT;
end TEST;
■
=TEX
=SML
new_script {name = "TEST", unit_type="body"};
ⓈCN
package body TEST is
  procedure P
    Δ TESToX, TESToY [ true ]
  is separate;
end TEST;
■
=TEX
=SML
new_script {name = "TEST.P", unit_type="proc"};
=TEX
=SML
fun check_98_1() =
ⓈCN
separate (TEST)
procedure P
  Δ TESToX, TESToY [ true, Some_Predicate ∧ true]
is
begin
  Δ TESToX, TESToY [ true ]
end P;
■
=TEX
=SML
store_mt_results
mt_run_fail
[
	("98.1.1", check_98_1, (),
	gen_fail_msg "z_predexp_of_z_tm" 508019 [])
];
=SML
clean_up();
new_script {name = "TEST", unit_type="spec"};
ⓈCN
package TEST is
  X : INTEGER;
  Y : FLOAT;
  procedure P
  Δ TESToX, TESToY [ true ];
end TEST;
■
=TEX
=SML
new_script {name = "TEST", unit_type="body"};
fun check_98_2() =
ⓈCN
package body TEST is
  procedure P
    Δ TESToX, TESToY [ true, Some_Predicate ∧ true ]
  is begin null; end;
end TEST;
■
=SML
store_mt_results
mt_run_fail
[
	("98.2.1", check_98_2, (),
		gen_fail_msg "z_predexp_of_z_tm" 508019 [])
];
=SML
clean_up();
new_script {name = "TEST", unit_type="spec"};
ⓈCN
package TEST is
  $auxiliary X : ℤ;
  Y : FLOAT;
  procedure P
  Δ X, TESToY [ true ];
end TEST;
■
=TEX
=SML
new_script {name = "TEST", unit_type="body"};
fun check_98_3() =
ⓈCN
package body TEST is
  $using c : integer; $implement X $by C = X;
  procedure P
    Δ C, TESToY [ true, Some_Predicate ∧ true ]
  is begin null; end;
end TEST;
■
=SML
store_mt_results
mt_run_fail
[
	("98.3.1", check_98_3, (),
		gen_fail_msg "z_predexp_of_z_tm" 508019 [])
];
=SML
clean_up();
new_script {name = "TEST", unit_type="proc"};
fun check_98_4() =
ⓈCN
procedure test
is
  X : integer;
  C : constant integer := X;
begin
  null;
end;
■
=SML
store_mt_results
mt_run_fail
[
	("98.4.1", check_98_4, (),
		gen_fail_msg "z_ax" 508106 [
		"constant", "ⓩX⌝", ""])
];
=TEX
=SML
clean_up();
new_script {name = "TEST", unit_type="proc"};
fun check_98_5() =
ⓈCN
procedure test
is
  X : integer;
  C : constant := X;
begin
  null;
end;
■
=SML
store_mt_results
mt_run_fail
[
	("98.5.1", check_98_5, (),
		gen_fail_msg "z_eq_eq" 508106 [
		"constant", "ⓩX⌝", ""])
];
=SML
clean_up();
new_script {name = "TEST", unit_type="spec"};
ⓈCN
package TEST is
  X, Y, Z : FLOAT;
  procedure P
  Δ TESToY [ true ];
end TEST;
■
=TEX
=SML
new_script {name = "TEST", unit_type="body"};
fun check_98_6() =
ⓈCN
package body TEST is
  procedure P
    Δ TESToY [ true, TESToX = TESToY ]
  is begin null; end;
end TEST;
■
=SML
store_mt_results
mt_run_fail
[
	("98.6.1", check_98_6, (),
		gen_fail_msg "term_of_vcs" 507123 [])
];
=SML
fun check_98_7() =
ⓈCN
package body TEST is
  procedure P
    Δ TESToY [ true, TESToX = TESToY ∧ TESToZ = TESToY]
  is begin null; end;
end TEST;
■
=SML
store_mt_results
mt_run_fail
[
	("98.7.1", check_98_7, (),
		gen_fail_msg "term_of_vcs" 507123 [])
];
=SML
fun check_98_8() =
ⓈCN
package body TEST is
  procedure P
    Δ TESToY [ TESToX = TESToY ∧ TESToZ = TESToY, true ]
  is begin null; end;
end TEST;
■
=SML
store_mt_results
mt_run_fail
[
	("98.8.1", check_98_8, (),
		gen_fail_msg "term_of_vcs" 507122 [])
];
=TEX
\subsection{QQ110: VC soundness warnings for informal development steps}
=SML
clean_up();
new_script {name = "P", unit_type="proc"};
ⓈCN
procedure P Δ [false] is begin Δ [false] end;
■
ⓈCN
 !⊑ Δ[true]
■
=SML
fun count_msgs thy = (
	case s_lookup thy (CNZGenerator.get_exception_logs()) of
		Value l => length l
	|	Nil => 0
);
=SML
diag_line "*** exception log: statement replacement soundness warning ...";
print_exception_log "-";
store_mt_results
mt_run
 [("qq110.1.1", count_msgs, get_current_theory_name(), 1)];
=TEX
=SML
clean_up();
new_script {name = "P110", unit_type="spec"};
ⓈCN
package P110 is
	procedure pb Δ [false];
	function fb return integer Ξ [false];
end;
■
=TEX
=SML
new_script {name = "P110", unit_type="body"};
ⓈCN
package body P110 is
	procedure pb is begin null; end;
	function fb return integer is begin return 0; end;
end;
■
=TEX
=SML
diag_line "*** exception log: informal subprograms in package body warnings ...";
print_exception_log "-";
store_mt_results
mt_run
 [("qq110.2.1", count_msgs, get_current_theory_name(), 2)];
=TEX
=SML
clean_up();
new_script {name = "P110", unit_type="spec"};
ⓈCN
package P110 is
	procedure pb Δ [false];
	function fb return integer Ξ [false];
end;
■
=TEX
=SML
new_script {name = "P110", unit_type="body"};
ⓈCN
package body P110 is
	procedure pb Δ[false] is separate;
	function fb return integer  Ξ [false] is separate;
end;
■
=TEX
=SML
new_script {name = "P110.PB", unit_type="proc"};
ⓈCN
separate (P110) procedure pb is begin null; end;
■
=TEX
=SML
diag_line "*** exception log: informal subunit warning ...";
print_exception_log "-";
store_mt_results
mt_run
 [("qq110.3.1", count_msgs, get_current_theory_name(), 1)];
=TEX
=SML
new_script {name = "P110.FB", unit_type="func"};
ⓈCN
separate (P110) function fb return integer is begin return 0; end;
■
=TEX
=SML
diag_line "*** exception log: informal subunit warning ...";
print_exception_log "-";
store_mt_results
mt_run
 [("qq110.3.2", count_msgs, get_current_theory_name(), 1)];
=TEX
\subsection{QQ114: Allow unqualified aggregates inside other aggregates}
=SML
clean_up();
new_script {name = "P", unit_type="spec"};
ⓈCN
package P is
  type Array_T is array (Integer range <>) of Boolean;
  type Record_T is
    record
      A : Array_T (2 .. 3);
      B : Integer;
    end record;
  C1 : constant Record_T := Record_T'(A => (2 => True, 3 => False), B => 999);
  C2 : constant Record_T := Record_T'((2 => False, 3 => True), 1000);
end P;
■
=SML
store_mt_results
mt_run
 [("qq114.1.1", (fn t => (z_get_spec t; true) handle Fail _ => false), ⓩPoC2⌝, true),
 ("qq114.1.2", (fn t => (z_get_spec t; true) handle Fail _ => false), ⓩPoC2⌝, true)];
=SML
clean_up();
new_script {name = "R", unit_type="spec"};
ⓈCN
package R is
  type Array_T1 is array (1 .. 3) of Integer;
  type Array_T2 is array (1 .. 2) of Array_T1;
  type Rec_T is record A : Integer; B : Boolean; end record;
  type Array_T3 is array (1 .. 2) of Rec_T;
  C2a : constant Array_T2 := ((1, 2, 3), Array_T1'(4, 5, 6));
  C2b : constant Array_T2 := (1 => (1, 2, 3),  2 => (4, 5, 6));
  C3a : constant Array_T3 := ((A => 1, B => False), (2, True));
  C3b : constant Array_T3 := (1 => Rec_T'(A => 1, B => False), 2 => (2, True));
end R;
■
=SML
store_mt_results
mt_run
 [("qq114.2.1", (fn t => (z_get_spec t; true) handle Fail _ => false), ⓩRoC2A⌝, true),
 ("qq114.2.2", (fn t => (z_get_spec t; true) handle Fail _ => false), ⓩRoC2B⌝, true),
("qq114.2.3", (fn t => (z_get_spec t; true) handle Fail _ => false), ⓩRoC3A⌝, true),
 ("qq114.2.4", (fn t => (z_get_spec t; true) handle Fail _ => false), ⓩRoC3B⌝, true)];
=TEX
=TEX
\subsection{QQ115: support use of implicitly declared subprograms}
=SML
clean_up();
new_script {name = "P", unit_type="spec"};
ⓈCN
package P is
  count : integer;
  procedure A(x : in integer)
  Δ  PoCOUNT [ PoCOUNT = PoCOUNT⋎0 + X ];
  procedure B(x : in integer)
  Δ  PoCOUNT [ PoCOUNT = PoCOUNT⋎0 - X];
  procedure C;
end;
■
=SML
new_script {name = "P", unit_type="body"};
=SML
fun fail115a() =
ⓈCN
package body P is
$implicit
  procedure D(x : in integer)
  Δ   [true];
 ⟨ other decs ⟩			( 1 )
end;
■
=SML
store_mt_results
mt_run_fail
[
	("115.1.1", fail115a, (),
		gen_fail_msg "check_not_implicit" 507137 [])
];
=TEX

ⓈCN
package body P is
$implicit
  procedure A(x : in integer)
  Δ  PoCOUNT [ PoCOUNT = PoCOUNT⋎0 + X ];
$implicit
  procedure C
  Δ PoCOUNT [PoCOUNT = 0];

  procedure B(x : in integer)
  Δ  PoCOUNT [ PoCOUNT = PoCOUNT⋎0 - X]
  is begin A(-x); end;
  procedure A(x : in integer)
  Δ  PoCOUNT [ PoCOUNT  = PoCOUNT⋎0 + X ]
  is begin count := count + x; end;
  procedure C
  Δ PoCOUNT [PoCOUNT = 0]
  is begin count := 0; end;
end;
■
=SML
val vcs115 = list_mk_∧(map (snd o snd) (get_conjectures "-"));
set_pc"cn1";
set_goal([], vcs115);
a(rewrite_tac[] THEN REPEAT strip_tac);
store_mt_results
mt_run
 [("qq115.2.1", fun_true o pop_thm , (), true)];
=TEX
=SML
clean_up();
new_script {name = "P", unit_type="proc"};
fun fail115b() =
ⓈCN
procedure P is
$implicit
  procedure A(x : in integer)
  Δ   [true];
begin null; end;
■
=SML
store_mt_results
mt_run_fail
[
	("115.3.1", fail115b, (),
		gen_fail_msg "check_not_implicit" 507137 [])
];
=TEX
=TEX
\subsection{QQ130: allow `\$' in pre- and post-conditions}
=SML
clean_up();
new_script {name = "P", unit_type="proc"};
ⓈZ
│ $"a/b/c" ≜ 457
■
ⓈCN
procedure p
is
  x : integer;
begin
 Δ X [X = $"a/b/c" + 1, X = $"a/b/c"]
end;
■
ⓈCN
  ⊑ x := x - 1;
■

=SML
set_pc"cn1";
set_goal([], get_conjecture"-" "vc_1_1");
a(REPEAT strip_tac THEN asm_rewrite_tac[z_plus_assoc_thm]);
store_mt_results
mt_run
 [("qq130.1.1", fun_true o pop_thm , (), true)];
=TEX
=TEX
\subsection{QQ122: generate left-associative unions}
=SML
clean_up();
new_script {name = "P", unit_type="spec"};
ⓈCN
package P is
   type arr10 is array (1 .. 10) of integer;
   c : constant arr10 := (
     1 => 99,
     2 => 98,
     3 .. 5 => 97,
     6 .. 10 => 96
  );
end;
■
=SML
val tm122_1 = snd(dest_eq(concl(∧_right_elim(z_get_specⓩPoC⌝))));
fun is_inst t1 t2 = (
	(term_match t1 t2; true)
	handle Fail _ => false
);
store_mt_results
mt_run
 [("qq122.1.1", is_inst tm122_1 , ⓩa ∪ b ∪ c ∪ d⌝, true)];
=TEX
\subsection{QQ117: canonical names for Ada entities in Z}
The test output from this needs to be inspected for grammatical correctness etc.
=SML
clean_up();
new_script {name = "PACK1", unit_type="spec"};
fun fail117a() =
ⓈCN
package PACK1 is
   x, y, z : integer;
  procedure A
  Δ X [true];
end;
■
=SML
fun fail117b() =
ⓈCN
package PACK1 is
   x, y, z : integer;
  procedure A
  Δ X, Y [true];
end;
■
=SML
fun fail117c() =
ⓈCN
package PACK1 is
   x, y, z : integer;
  procedure A
  Δ PACK1oX Ξ Y [true];
end;
■
=SML
fun fail117d() =
ⓈCN
package PACK1 is
   x, y, z : integer;
  procedure A
  Δ PACK1oX Ξ Y, Z [true];
end;
■
=SML
fun fail117e() =
ⓈCN
package PACK1 is
   x, y, z : integer;
  procedure A
  Δ PACK1oXX, YY, Z [true];
end;
■
=SML
store_mt_results
mt_run_fail
[
("117.1.1", fail117a, (),  gen_fail_msg "check_19" 505085 []),
("117.1.2", fail117b, (),  gen_fail_msg "check_19" 505085 []),
("117.1.3", fail117c, (),  gen_fail_msg "check_19" 505089 []),
("117.1.4", fail117d, (),  gen_fail_msg "check_19" 505089 []),
("117.1.5", fail117e, (),  gen_fail_msg "set_cn_scope" 514002 ["PACK1oXX"])
];
=TEX
=SML
clean_up();
new_script {name = "PACK2", unit_type="spec"};
ⓈCN
package PACK2 is
   x, y : integer;
  procedure A
  Δ PACK2oX, PACK2oY [PACK2oX = PACK2oY];
end;
■
=SML
new_script {name = "PACK2", unit_type="body"};
ⓈCN
package body PACK2 is
  t : integer;
  procedure A
  Δ PACK2oX, PACK2oY, T [PACK2oX = PACK2oY]
  is
    z : integer;
  begin
  Δ PACK2oX, PACK2oY, T, Z [PACK2oX = PACK2oY] (1)
  end;
end;
■
=SML
open_scope "PACK2.A";
ⓈCN
 (1) ⊑ Δ Z [Z = 1] (2)
  A.z := y; PACK2.t := PACK2.A.z; x := t;
■
=SML
open_theory"cn";
set_pc"cn1";
open_theory "PACK2oA'proc";
set_goal([], get_conjecture"-""vc1_2");
a(cn_vc_simp_tac[]);
store_mt_results
mt_run
 [("117.2.1", fun_true o pop_thm , (), true)];
ⓈCN
 (2) ⊑ loop_label:
   for i in 1 .. 10
   loop
   Δ Z [Z = I] (3)
   end loop loop_label;
   Δ Z[Z = 1] (4)
■
ⓈCN
 (3) ⊑ z := A.loop_label.i - i + loop_label.i;
■
=SML
set_goal([], get_conjecture"-""vc3_1");
a(cn_vc_simp_tac[]);
store_mt_results
mt_run
 [("117.2.2", fun_true o pop_thm , (), true)];
ⓈCN
 (4) ⊑ block_label:
    declare xx : integer := 1;
    begin z := standard.PACK2.A.block_label.xx - xx + A.block_label.xx; end block_label;
■
set_pc"cn1";
set_goal([], get_conjecture"-""vc4_1");
a(cn_vc_simp_tac[]);
store_mt_results
mt_run
 [("117.2.3", fun_true o pop_thm , (), true)];
=TEX
\subsection{QQ118: enforce a systematic naming scheme for scripts}
=SML
clean_up();
new_script {name = "P", unit_type="body"};
=SML
fun chk118() =
ⓈCN
package P is
  count : integer;
  procedure A(x : in integer)
  Δ  PoCOUNT [ PoCOUNT = PoCOUNT⋎0 + X ];
  procedure B(x : in integer)
  Δ  PoCOUNT [ PoCOUNT = PoCOUNT⋎0 - X];
end;
■
=SML
store_mt_results
mt_run_fail
[
	("118.1.1", chk118, (),  gen_fail_msg "do_web_clause" 507138 ["P'body", "P'spec"])
];
=TEX
\subsection{QQ144: bug in clash-checking}
=SML
clean_up();
new_script{name = "NAME_CLASH_BUG", unit_type="proc"};

ⓈCN
procedure NAME_CLASH_BUG
is
begin
  if false then
    null;
  else
    for I in INTEGER range 0 .. 10
    loop
      null;
    end loop;
  end if;
end NAME_CLASH_BUG;
■
=SML
store_mt_results
mt_run
[
	("144.1.1", output_ada_program, {script = "NAME_CLASH_BUG'proc", out_file = "/dev/null"}, ())
];

=SML
clean_up();
new_script{name = "P", unit_type="proc"};

ⓈCN
procedure P
is
begin
  if false then
    null;
  else
    for standard in INTEGER range 0 .. 10
    loop
      null;
    end loop;
  end if;
end;
■
=SML
store_mt_results
mt_run_fail
[
	("144.1.2", output_ada_program, {script = "P'proc", out_file = "/dev/null"},
	 gen_fail_msg "soundness_checks" 510003 [])
];
=TEX
\subsection{QQ153: Ada namespace bugs}
=SML
clean_up();
new_script {name = "A", unit_type="spec"};

ⓈCN
package A is
   V : INTEGER;
end A;
■
=SML
new_script {name="B", unit_type="spec"};

ⓈCN
with A;
package B is
   W : INTEGER renames A.V;
   V : INTEGER;
end B;
■
=SML
new_script {name="B", unit_type="body"};

ⓈCN
package body B is
begin
 Δ BoV [ BoV = AoV ]
end B;
■
ⓈCN
 ⊑ B.V := B.W;
■
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"-""vc_1_1");
a(cn_vc_simp_tac[]);
store_mt_results
mt_run
 [("QQ153.1.1", fun_true o pop_thm , (), true)];
=TEX
=SML
clean_up();
new_script {name="A", unit_type="spec"};

ⓈCN
package A is
   V : constant INTEGER := 1;
end A;
■
=SML
new_script {name="B", unit_type="spec"};

ⓈCN
with A;
package B is
   W : INTEGER renames A.V;
 end B;
■
=SML
new_script {name="C", unit_type="spec"};

ⓈCN
with B;
use B;
package C is
  X : INTEGER;
end C;
■
=SML
new_script {name="C", unit_type="body"};

ⓈCN
with B;
use B;
package body C is
begin
  Δ CoX [CoX = AoV]
end C;
■
ⓈCN
 ⊑ X := W;
■
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"-""vc_1_1");
a(cn_vc_simp_tac[]);
store_mt_results
mt_run
 [("QQ153.2.1", fun_true o pop_thm , (), true)];
=TEX
=SML
clean_up();

new_script {name = "P", unit_type="proc"};
=SML
fun check_153_3() =
ⓈCN
procedure P
  Δ [ true ]
is
  C : constant Integer := 2;
  function F return Integer
    Ξ [ F = 3 ]
  is
  begin
    return 3;
  end;
  C1 : Integer renames C;
  function F1 return Integer renames F;
begin
  Δ [ C1 = 2 ∧ F1 = 3 ]		(1)
end P;
■
=SML
store_mt_results
mt_run_fail
[
	("QQ153.3.1", check_153_3, (),  gen_fail_msg "z_predexp_of_z_tm" 508019 [])
];
=TEX
=SML
clean_up();
val old_dc = set_int_control("cn_domain_conds", cn_standard_domain_conds);
new_script {name = "P", unit_type="proc"};
ⓈCN
procedure P
is
  X : Integer;
  function F return Integer
    Ξ X [ F X = X + 1 ]
  is
  begin
    return X + 1;
  end;
  function F1 return Integer renames F;
  function pl (x, y : in Integer) return Integer renames "+";
  function mi (x, y : in Integer) return Integer renames "-";
begin
  Δ X [ F X = 1 ]		(1)
end P;
■
ⓈCN
(1) ⊑ X := pl(mi(X, F1), 1);
■
=TEX
=SML
val _ = set_int_control("cn_domain_conds", old_dc);
open_theory"cn";
set_pc "cn1";
open_theory "PoF'func";
set_goal([], get_conjecture"-""vcPoF_1");
a(cn_vc_simp_tac[]);
store_mt_results
mt_run
 [("QQ153.4.1", fun_true o pop_thm , (), true)];
=TEX
=SML
open_theory "P'proc";
set_goal([], get_conjecture"-""vc1_1");
a(rewrite_tac(map z_get_spec[ⓩPL⌝, ⓩMI⌝]));
a(REPEAT strip_tac);
a(ALL_FC_T rewrite_tac[z_get_specⓩF⌝]);
a(PC_T1 "z_lin_arith" prove_tac[]);
store_mt_results
mt_run
 [("QQ153.4.2", fun_true o pop_thm , (), true)];
=TEX
\subsection{QQ155: bug in restoring current theory after exception}
=SML
clean_up();
new_script{name="P", unit_type="proc"};

ⓈCN
procedure p
is
 x : integer;
 c : constant integer := 1;
begin
 Δ X[ X = C ]
end p;
■
=TEX
=SML
open_theory "hol";
val exn_raised = (
ⓈCN
 ⊑ x := cc;
■
=SML
false) handle Fail _ => true;
store_mt_results
mt_run
 [("QQ155.1.1", get_current_theory_name, (), "hol")];
=TEX
=TEX
\subsection{QQ139: 1 theory per subprogram}
=SML
clean_up();
new_script{name="A", unit_type="proc"};

ⓈCN
procedure a(x : integer; y : in out integer)
is
 procedure b Δ Y Ξ X [Y = X + 1] is separate;
begin
 Δ Y [ Y = X + 1 ]
end;
■
ⓈCN
 ⊑ b;
■
=SML
new_script{name="A.B", unit_type="proc"};
ⓈCN
separate (a)
 procedure b Δ Y Ξ X [Y = X + 1]
is
 procedure c Δ Y Ξ X [Y = X + 1] is separate;
begin
 c;
end;
■
=SML
new_script{name="A.B.C", unit_type="proc"};
ⓈCN
separate (a.b)
 procedure c Δ Y Ξ X [Y = X + 1]
is
 procedure d Δ Y Ξ X [Y = X + 1] is separate;
begin
 d;
end;
■
=SML
new_script{name="A.B.C.D", unit_type="proc"};
ⓈCN
separate (a.b.c)
 procedure d Δ Y Ξ X [Y = X + 1]
is
 procedure e Δ Y Ξ X [Y = X + 1] is separate;
begin
 e;
end;
■
=SML
new_script{name="A.B.C.D.E", unit_type="proc"};
ⓈCN
separate (a.b.c.d)
 procedure e Δ Y Ξ X [Y = X + 1]
is
begin
 y := x + 1;
end;
■
=SML
fun new_pars t = (
	let	val ts = (get_parents t less "cn") diff get_cache_theories();
		val fts = format_list Combinators.I ts ", ";
	in	diag_line (t ^ " has parents " ^ fts);
		fts
	end
);
=SML
store_mt_results
mt_run
 [("QQ139.1.1", new_pars, "AoB'proc", "AoB'context"),
 ("QQ139.1.2",  new_pars, "AoBoC'proc", "AoBoC'context"),
 ("QQ139.1.3",  new_pars, "AoBoCoD'proc", "AoBoCoD'context"),
 ("QQ139.1.4",  new_pars, "AoBoCoDoE'proc", "AoBoCoDoE'context")];
=TEX
=SML
fun qq139_prove_vc (t : TERM) : THM = (
	tac_proof(([], t),
		cn_vc_simp_tac[] THEN REPEAT strip_tac THEN asm_rewrite_tac[])
);
fun qq139_prove_vcs (thy : string) : bool = (
	open_theory thy;
	let	val cs = get_conjectures "-";
	in	length (mapfilter (qq139_prove_vc o snd o snd) cs) =
		length cs
	end
);
val qq139_thys = get_descendants "cn" less "cn";
=TEX
=SML
store_mt_results
mt_run
 [("QQ139.2.1", switch all qq139_prove_vcs, qq139_thys, true)];
=TEX
\subsection{QQ157: {\em print\_z\_document} to print all associated theories}
=SML
clean_up();
new_script{name="P", unit_type="proc"};
ⓈCN
procedure p
is
 p_c : constant integer := 1;
 procedure q
 is
  q_c : constant integer := 2;
  procedure r
  is
   r_c : constant integer := 3;
  begin
   null;
  end;
 begin
  null;
 end;
begin
 null;
end;
■
=SML
store_mt_results
mt_run
 [("QQ157.1.1", get_script_theories,  "P'proc", ["P'proc", "PoQ'context", "PoQ'proc", "PoQoR'context",
      "PoQoR'proc"] ),
("QQ157.1.2", get_script_theories,  "PoQ'proc", ["PoQ'proc", "PoQoR'context", "PoQoR'proc"] ),
("QQ157.1.3", get_script_theories,  "PoQoR'proc", ["PoQoR'proc"] ),
("QQ157.1.4", get_script_theories,  "cn", ["cn"] )
];
=SML
output_z_document{script = "-", out_file = "int525.B.sml"};
clean_up();
store_mt_results
mt_run
 [("QQ157.2.1", use_file, "int525.B.sml", ()),
("QQ157.2.2", open_theory, "P'proc", ()),
("QQ157.2.3", open_theory, "PoQ'proc", ()),
("QQ157.2.4", open_theory, "PoQoR'proc", ())
];
=TEX
=SML
store_mt_results
mt_run
 [("QQ157.3.1", (length o get_consts), "P'proc", 1),
("QQ157.3.2", (length o get_consts), "PoQ'context", 1),
("QQ157.3.3", (length o get_consts), "PoQ'proc", 1),
("QQ157.3.4", (length o get_consts), "PoQoR'context", 1),
("QQ157.3.5", (length o get_consts), "PoQoR'proc", 1)
];
=TEX
=SML
clean_up();
fun ⦏dest_ud_string⦎ (UD_String (n, uds)) = (n, uds)
|   dest_ud_string _ = fail "" 0 [] (* Caller MUST catch this *);
fun ⦏update_user_datum⦎ (key : string) (xs : USER_DATUM) =
let
    val old_datum = (snd o dest_ud_string o get_user_datum "-")
					key handle Fail _ => [];
    val new_datum = xs::old_datum;
in
    set_user_datum(key, UD_String ("",new_datum))
end;
val ⦏current_level⦎ : unit -> int =
	(#current_level o #contents o get_theory_info o
		get_current_theory_name);
new_theory "A";
┌ APPLE ───────────
│ x : ℤ
└──────────────
=TEX
=SML
update_user_datum CNZOutput.cn_subprog_ud_key
	(UD_String("B", [UD_Int (current_level(),
		[UD_Int (current_level(), [])])]));
duplicate_theory ("A", "B");
open_theory"B";
┌ BANANA ───────────
│ y : ℤ
└──────────────
=TEX
=SML
fun trap_error f a = f a handle Error x => raise Fail x;
store_mt_results
mt_run_fail
[
	("QQ157.4.1", trap_error print_z_document, "B",  gen_fail_msg "fmt_z_document" 511010 ["B"])
];
store_mt_results
mt_run_fail
[
	("QQ157.4.2", trap_error get_script_theories, "B",  gen_fail_msg "get_script_theories" 507140["B"])
];
=TEX
\subsection{QQ179: extended characters in CN Z strings}
=SML
clean_up();
new_script{name = "P", unit_type="proc"};
ⓈCN
 procedure p
 Δ [∃ $"x⋎1" : ℤ ⦁ $"x⋎1" = 1]
 is
 begin
  null;
 end;
■
=TEX
=SML
set_pc "cn1";
set_goal([], get_conjecture"-""vcP_1");
a(cn_vc_simp_tac[]);
a(z_∃_tacⓩ($"x⋎1" ≜ 1)⌝ THEN REPEAT strip_tac);
store_mt_results
mt_run
 [("QQ179.1.1", fun_true o pop_thm , (), true)];
=TEX
\subsection{QQ174: user-specifiable annotation character}
=SML
clean_up();
new_script{name = "P", unit_type="proc"};
store_mt_results
mt_run_fail
 [("QQ174.1.1", set_string_control , ("cn_spark_annotation_char", ""),
	gen_fail_msg "annotation_char_check" 512005 []),
("QQ174.1.2", set_string_control , ("cn_spark_annotation_char", "xx"),
	gen_fail_msg "annotation_char_check" 512005 []),
("QQ174.1.3", set_string_control , ("cn_spark_annotation_char", "\t"),
	gen_fail_msg "annotation_char_check" 512006 []),
("QQ174.1.4", set_string_control , ("cn_spark_annotation_char", "\127"),
	gen_fail_msg "annotation_char_check" 512006 []),
("QQ174.1.5", set_string_control , ("cn_spark_annotation_char", " "),
	gen_fail_msg "annotation_char_check" 512006 [])];
set_string_control("cn_spark_annotation_char", "$");
set_flag("cn_ignore_spark_annotations", false);
=TEX
=SML
ⓈCN
 procedure p
 --# NO!
 --$ YES!
 is
 begin
  null;
 end;
■
=TEX
=SML
output_ada_program{script="-", out_file = "int525.tmp"};
store_mt_results
mt_run
 [(	"QQ174.2.1",
	ExtendedIO.system,
	"test  `egrep \"YES\" int525.tmp | wc -l `  = 1",
	true),
(	"QQ174.2.2",
	ExtendedIO.system,
	"test  `egrep \"NO\" int525.tmp | wc -l `  = 0",
	true)];
=TEX
=SML
reset_string_control("cn_spark_annotation_char");
clean_up();
new_script{name = "P", unit_type="proc"};
=TEX
=SML
ⓈCN
 procedure p
 --$ NO!
 --# YES!
 is
 begin
  null;
 end;
■
=TEX
=SML
output_ada_program{script="-", out_file = "int525.tmp"};
store_mt_results
mt_run
 [(	"QQ174.3.1",
	ExtendedIO.system,
	"test  `egrep \"YES\" int525.tmp | wc -l `  = 1",
	true),
(	"QQ174.3.2",
	ExtendedIO.system,
	"test  `egrep \"NO\" int525.tmp | wc -l `  = 0",
	true)];
=TEX
\subsection{QQ178: multiple auxiliary variables in one declaration}
=SML
clean_up();
new_script{name = "P", unit_type="spec"};
ⓈCN
package p is
 $auxiliary x, y : ℤ × ℤ;
 procedure q
 Δ  x, y [ x = (0, 0) ∧ y = (1, 1) ];
end;
■
=TEX
The following is just for visual inspection:
=SML
CNAdaOutput.format_web_clause Nil (!CNZGenerator.diag_web_clause);
=SML
new_script{name = "P", unit_type="body"};
ⓈCN
package body p is
 $using a, b : integer;
 $implement x
 $by x = (A, B);
 $using c, d : integer;
 $implement y
 $by y = (C, D);
 procedure q
 Δ A, B, C, D [A = 0 ∧ B = 0 ∧ C = 1 ∧ D = 1 ]
 is
 begin
   a := 0; b := a; c := 1; d := c;
 end;
end;
■
=TEX
Again, just for visual inspection:
=SML
CNAdaOutput.format_web_clause Nil (!CNZGenerator.diag_web_clause);
=TEX
Now see if we can prove the VCs:
=IGN
print_z_document "-";
=SML
open_theory "PoQ'proc";
set_pc "cn1";
set_goal([], get_conjecture"-""vcPoQ_1");
a(cn_vc_simp_tac[]);
store_mt_results
mt_run
 [("QQ178.1.1", fun_true o save_pop_thm , "vcPoQ_1", true)];
=TEX
=SML
open_theory "P'body";
set_pc "cn1";
set_goal([], get_conjecture"-""vcP_1");
a(cn_vc_simp_tac[]);
store_mt_results
mt_run
 [("QQ178.1.2", fun_true o save_pop_thm , "vcP_1", true)];
=TEX
=SML
set_goal([], get_conjecture"-""vcP_2");
a(cn_vc_simp_tac[] THEN REPEAT strip_tac
	THEN all_var_elim_asm_tac1);
a(z_∃_tacⓩ(x ≜ (0, 0), y ≜ (1, 1))⌝ THEN rewrite_tac[]);
store_mt_results
mt_run
 [("QQ178.1.3", fun_true o save_pop_thm , "vcP_2", true)];
=TEX
=SML
set_goal([], get_conjecture"-""vcP_3");
a(cn_vc_simp_tac[] THEN REPEAT strip_tac);
a(z_∃_tacⓩ(x ≜ (A, B), y ≜ (C, D))⌝ THEN rewrite_tac[]);
store_mt_results
mt_run
 [("QQ178.1.4", fun_true o save_pop_thm , "vcP_3", true)];
=TEX
=SML
val unproved = flat(map (fn thy => (open_theory thy; get_unproved_conjectures thy)) (get_descendants "cn" less "cn"));
store_mt_results
mt_run
 [("QQ178.2.1", Combinators.I , unproved, [])];
=TEX
=SML
clean_up();
new_script{name = "P", unit_type="spec"};
fun check178_3_1 () =
ⓈCN
package p is
 $auxiliary x, x : ℤ × ℤ;
 procedure q
 Δ  x [ x = (0, 0) ];
end;
■
=TEX
=SML
store_mt_results
mt_run_fail
 [("178.3.1", check178_3_1 , (),
	gen_fail_msg "check_new_z_id" 505074["x"])];
=TEX
\subsection{QQ163: {\em open\_scope} command}
=TEX
Only error behaviour needs to be checked explicitly, the main
functionality having been checked out in tests passim.
=TEX
=SML
clean_up();
new_script{name = "P", unit_type="proc"};
ⓈCN
 procedure p
 is
 begin
  Δ[true] (1)
 end;
■
=TEX
=SML
store_mt_results
mt_run_fail
 [("QQ163.1.1", open_scope , "banana",
	gen_fail_msg "open_scope" 507146 ["banana"])];
=TEX
=SML
open_theory "cn";
fun check_163_1_2 () =
ⓈCN
 (1) ⊑ null;
■
=TEX
=SML
store_mt_results
mt_run_fail
 [("QQ163.1.2", check_163_1_2, (),
	gen_fail_msg "check_label_theory" 507144 ["1", "P"])];
=TEX
delete_theory "P'proc";
store_mt_results
mt_run_fail
 [("QQ163.1.3", open_scope , "P",
	gen_fail_msg "open_scope" 507145 ["P'proc", "P"])];
=TEX
=SML
clean_up();
new_script{name = "P", unit_type="proc"};
new_theory "PoQ'proc";
open_theory "P'proc";
fun check_163_1_4 () =
ⓈCN
 procedure p
 is
  procedure q
  is
  begin
   null;
  end;
 begin
  Δ[true] (1)
 end;
■
=TEX
=SML
store_mt_results
mt_run_fail
 [("QQ163.1.4", check_163_1_4, (),
	gen_fail_msg "make_subprog_module" 507139 ["PoQ'proc", "PoQ"])];
=TEX
\subsection{QQ164 \& QQ171: deferred subprograms}
=TEX
=TEX
=SML
clean_up();
fun cn_descs () = Sort.sort Sort.string_order (get_descendants "cn" less "cn");
store_mt_results
mt_run
 [("QQ164.1.1", cn_descs, (), [])];
=TEX
=SML
new_script{name = "P", unit_type="proc"};
store_mt_results
mt_run
 [("QQ164.1.2", cn_descs, (), ["P'proc"])];
=TEX
ⓈCN
procedure p
is
 x : integer;
 c : constant integer := 1001;
 $deferred procedure q(y : out integer)
 Δ Y [ Y = 1001 ]
 is
 begin
    ⟨ body of q ⟩			( 10 )
 end;
begin
 Δ X [X = C]		(1)
end;
■
=SML
store_mt_results
mt_run
 [("QQ164.1.3", cn_descs, (), ["PoQ'context", "P'proc"])];
ⓈCN
 (1) ⊑ q(x);
■
=SML
set_pc "cn1";
set_goal([], get_conjecture"-" "vc1_1");
a(REPEAT strip_tac);
val _ = save_pop_thm "vc1_1";
set_goal([], get_conjecture"-" "vc1_2");
a(rewrite_tac[z_get_specⓩC⌝] THEN REPEAT strip_tac);
val _ = save_pop_thm "vc1_2";
store_mt_results
mt_run
 [("QQ164.1.4", get_unproved_conjectures, "-", [])];
=TEX
=SML
open_scope "p.q";
store_mt_results
mt_run
 [("QQ164.1.5", cn_descs, (), ["PoQ'context", "PoQ'proc", "P'proc"])];
ⓈCN
 (10) ⊑ y := c;
■
=SML
set_goal([], get_conjecture"-" "vc10_1");
a(rewrite_tac[z_get_specⓩC⌝] THEN REPEAT strip_tac);
val _ = save_pop_thm "vc10_1";
store_mt_results
mt_run
 [("QQ164.1.6", get_unproved_conjectures, "-", [])];
=TEX
Now try deleting ``p.q'':
=SML
delete_deferred_subprogram "p.q";
store_mt_results
mt_run
 [("QQ171.1.1", cn_descs, (), ["PoQ'context", "P'proc"])];
open_scope "p.q";
store_mt_results
mt_run
 [("QQ171.1.2", cn_descs, (), ["PoQ'context", "PoQ'proc", "P'proc"])];
ⓈCN
 (10) ⊑ y := c;
■
=SML
set_goal([], get_conjecture"-" "vc10_1");
a(rewrite_tac[z_get_specⓩC⌝] THEN REPEAT strip_tac);
val _ = save_pop_thm "vc10_1";
store_mt_results
mt_run
 [("QQ171.1.3", get_unproved_conjectures, "-", [])];

=TEX
Now do it all over again with a function:
=SML
clean_up();
set_int_control("cn_domain_conds", cn_all_domain_conds);
store_mt_results
mt_run
 [("QQ164.2.1", cn_descs, (), [])];
=TEX
=SML
new_script{name = "P", unit_type="proc"};
store_mt_results
mt_run
 [("QQ164.2.2", cn_descs, (), ["P'proc"])];
ⓈCN
procedure p
is
 x : integer;
 c : constant integer := 1001;
 $deferred function q(y : in integer) return integer
 Ξ [ Q(Y) = Y + 1001 ]
 is
 begin
    ⟨ body of q ⟩			( 10 )
 end;
begin
 Δ X [X = C]		(1)
end;
■
=SML
store_mt_results
mt_run
 [("QQ164.2.3", cn_descs, (), ["PoQ'context", "P'proc"])];
ⓈCN
 (1) ⊑ x := q(0);
■
=SML
set_pc "cn1";
set_goal([], get_conjecture"-" "vc1_1");
a(rewrite_tac[z_get_specⓩC⌝] THEN REPEAT strip_tac);
a(POP_ASM_T ante_tac);
a(strip_asm_tac(z_get_specⓩQ⌝));
a(ALL_FC_T rewrite_tac[z_fun_dom_clauses]);
a(REPEAT strip_tac THEN LIST_DROP_NTH_ASM_T [2] (ALL_FC_T rewrite_tac));
val _ = save_pop_thm "vc1_1";
store_mt_results
mt_run
 [("QQ164.2.4", get_unproved_conjectures, "-", [])];
=TEX
=SML
open_scope "p.q";
store_mt_results
mt_run
 [("QQ164.2.5", cn_descs, (), ["PoQ'context", "PoQ'func", "P'proc"])];
ⓈCN
 (10) ⊑ return y + c;
■
=SML
set_goal([], get_conjecture"-" "vc10_1");
a(rewrite_tac[z_get_specⓩC⌝] THEN REPEAT strip_tac);
val _ = save_pop_thm "vc10_1";
store_mt_results
mt_run
 [("QQ164.2.6", get_unproved_conjectures, "-", [])];
=TEX
Now try deleting ``p.q'':
=SML
delete_deferred_subprogram "p.q";
store_mt_results
mt_run
 [("QQ171.2.1", cn_descs, (), ["PoQ'context", "P'proc"])];
open_scope "p.q";
store_mt_results
mt_run
 [("QQ171.2.2", cn_descs, (), ["PoQ'context", "PoQ'func", "P'proc"])];
ⓈCN
 (10) ⊑ return y + c;
■
=SML
set_goal([], get_conjecture"-" "vc10_1");
a(rewrite_tac[z_get_specⓩC⌝] THEN REPEAT strip_tac);
val _ = save_pop_thm "vc10_1";
store_mt_results
mt_run
 [("QQ171.2.3", get_unproved_conjectures, "-", [])];
=TEX
Now try one with a few declarations:
=TEX
=SML
clean_up();
store_mt_results
mt_run
 [("QQ164.3.1", cn_descs, (), [])];
=TEX
=SML
new_script{name = "P", unit_type="proc"};
store_mt_results
mt_run
 [("QQ164.3.2", cn_descs, (), ["P'proc"])];
ⓈCN
procedure p
is
 x : integer;
 c : constant integer := 1001;
 $deferred procedure q(y : in out integer)
 Δ Y [ Y = 1001 ]
 is
     ⟨ decs 1 ⟩			( 100 )
     ⟨ decs 2 ⟩			( 200 )
 begin
    ⟨ body of q ⟩			( 10 )
 end;
begin
 Δ X [X = C]		(1)
end;
■
=SML
store_mt_results
mt_run
 [("QQ164.3.3", cn_descs, (), ["PoQ'context", "P'proc"])];
ⓈCN
 (1) ⊑ q(x);
■
=SML
set_pc "cn1";
set_goal([], get_conjecture"-" "vc1_1");
a(REPEAT strip_tac);
val _ = save_pop_thm "vc1_1";
set_goal([], get_conjecture"-" "vc1_2");
a(rewrite_tac[z_get_specⓩC⌝] THEN REPEAT strip_tac);
val _ = save_pop_thm "vc1_2";
store_mt_results
mt_run
 [("QQ164.3.4", get_unproved_conjectures, "-", [])];
=TEX
=SML
open_scope "p.q";
store_mt_results
mt_run
 [("QQ164.3.5", cn_descs, (), ["PoQ'context", "PoQ'proc", "P'proc"])];
ⓈCN
 (100) ≡ d : constant integer := 2 * c;
■
ⓈCN
 (200) ≡ t : integer;
■
ⓈCN
 (10) ⊑ t := 0; t := t + d - c; y := t;
■
=IGN
=SML
set_goal([], get_conjecture"-" "vc10_1");
a(rewrite_tac[z_get_specⓩC⌝, z_get_specⓩD⌝] THEN REPEAT strip_tac);
val _ = save_pop_thm "vc10_1";
store_mt_results
mt_run
 [("QQ164.3.6", get_unproved_conjectures, "-", [])];
=TEX
Now try some error cases:
=TEX
=SML
clean_up();
new_script{name = "P", unit_type="proc"};
=SML
fun check_164_4_1() =
ⓈCN
procedure p
is
 $deferred procedure q(y : in out integer)
 Δ Y [ Y = 1001 ]
 is
     c : constant integer;
     ⟨ decs 2 ⟩			( 200 )
 begin
    ⟨ body of q ⟩			( 10 )
 end;
begin
 Δ X [X = 100]		(1)
end;
■
=SML
fun check_164_4_2() =
ⓈCN
procedure p
is
 $deferred procedure q(y : in out integer)
 Δ Y [ Y = 1001 ]
 is
     ⟨ decs 1 ⟩			( 200 )
 begin
    y := 1001;
 end;
begin
 Δ X [X = 100]		(1)
end;
■
=SML
store_mt_results
mt_run_fail
 [("QQ164.4.1", check_164_4_1, (),
	gen_fail_msg "deferred_body" 507147 ["Q"]),
  ("QQ164.4.2", check_164_4_2, (),
	gen_fail_msg "deferred_body" 507149 ["Q"])];
=TEX
\subsection{QQ192: theory per block etc.}
=TEX
=SML
clean_up();
new_script{name = "P", unit_type="proc"};
=TEX
=SML
fun check_192_1_1 () =
ⓈCN
procedure p
is
begin
 xyz: declare i : int; begin null; end xyzt;
end;
■
=SML
fun check_192_1_2 () =
ⓈCN
procedure p
is
begin
 xyz: declare i : int; begin null; end $block xyz;
end;
■
=SML
fun check_192_1_3 () =
ⓈCN
procedure p
is
begin
 xyz: declare i : int; begin null; end;
end;
■
=TEX
=SML
store_mt_results
mt_run_fail
[("QQ192.1.1", check_192_1_1, (),
	gen_fail_msg "cn_parser" 503204 []),
("QQ192.1.2", check_192_1_2, (),
	gen_fail_msg "cn_parser" 503204 []),
("QQ192.1.3", check_192_1_3, (),
	gen_fail_msg "cn_parser" 503204 [])];
=SML
clean_up();
new_script{name = "P", unit_type="spec"};
=TEX
ⓈCN
package p
is
 $auxiliary xyz : ℕ × ℕ × ℕ;
 procedure action(x, y, z : out integer)
 Δ X, Y, Z, xyz [ (X, Y, Z) = xyz⋎0 ∧ xyz = (0, 0, 0) ] ;
end;
■
=SML
new_script{name = "P", unit_type="body"};
=TEX
ⓈCN
package body p
is
  $using p, q, r : integer;
  $implement xyz
  $by xyz = (P, Q, R);
  procedure action(x, y, z : out integer)
  Δ X, Y, Z, P, Q, R [ (X, Y, Z) = (P⋎0, Q⋎0, R⋎0) ∧ (P, Q, R) = (0, 0, 0) ]
  is
  begin
    x := p;
    y := q;
    z := r;
    p := 0;
    q := 0;
    r := 0;
  end;
begin
 Δ P, Q, R [ (P, Q, R) ∈ ℕ × ℕ × ℕ ]
end;
■
ⓈCN
 ⊑
init:
  declare
    a : constant integer := 99;
    b : constant integer := a + 10;
    c : constant integer := b + 10;
  begin
    p := a;
    q := b;
    r := c;
   end init;
■
=SML
open_theory "cn";
set_pc"cn1";
open_scope "p.init";
=TEX
=SML
set_goal([], get_conjecture"-""vc_1_1");
a(rewrite_tac(map z_get_spec[ⓩA⌝, ⓩB⌝, ⓩC⌝]));
store_mt_results
mt_run
 [("QQ192.2.1", fun_true o save_pop_thm , "vc_1_1", true)];
=SML
open_scope "p";
=TEX
=SML
set_goal([], get_conjecture"-""vcP_1");
a(prove_tac[]);
store_mt_results
mt_run
 [("QQ192.2.2", fun_true o save_pop_thm , "vcP_1", true)];

set_goal([], get_conjecture"-""vcP_2");
a(cn_vc_simp_tac[] THEN REPEAT strip_tac
	THEN all_var_elim_asm_tac1);
a(rewrite_tac[]);
a(z_∃_tacⓩ(xyz ≜ (0, 0, 0))⌝ THEN REPEAT strip_tac);
store_mt_results
mt_run
 [("QQ192.2.3", fun_true o save_pop_thm , "vcP_2", true)];

set_goal([], get_conjecture"-""vcP_3");
a(cn_vc_simp_tac[]);
store_mt_results
mt_run
 [("QQ192.2.4", fun_true o save_pop_thm , "vcP_3", true)];

set_goal([], get_conjecture"-""vcP_4");
a(REPEAT strip_tac);
a(z_∃_tacⓩ(xyz ≜ (P, Q, R))⌝ THEN REPEAT strip_tac);
store_mt_results
mt_run
 [("QQ192.2.5", fun_true o save_pop_thm , "vcP_4", true)];
=SML
open_scope "p.action";
=TEX
=SML
set_goal([], get_conjecture"-""vcPoACTION_1");
a(REPEAT strip_tac);
store_mt_results
mt_run
 [("QQ192.2.6", fun_true o save_pop_thm , "vcP_4", true)];
=TEX
\subsection{QQ134: Range checks for real types}
=TEX
=SML
clean_up();
new_script{name = "p", unit_type="spec"};
=TEX
Tool should detect and reject this empty type:
=SML
fun check_134_1 () =
ⓈCN
package p
is
 type empty_interval is digits 4 range -1.0 + 10.0 .. -2.0 ;
end;
■
=SML
store_mt_results
mt_run_fail
 [("QQ134.1.1", check_134_1, (),
	gen_fail_msg "basic_decl_pack_spec" 507041 [])];
=TEX
Tool should detect and allow this non-empty type.
=SML
ⓈCN
package p
is
 type non_empty_interval1 is digits 4 range -1.0 .. 2.0 ** 4;
 type non_empty_interval2 is delta 0.1 range 5.1 .. 10.0;
end;
■
=SML
store_mt_results
mt_run
[("QQ134.2.1", get_conjectures, "-", [])];
=TEX
Tool should generate a VC in the next case:
=SML
new_script{name = "p", unit_type="body"};
ⓈCN
package body p
is
 type unknown_interval is digits 4 range float'range;
end;
■
=SML
set_merge_pcs["'z_reals", "cn1"];
set_goal([ⓩFLOATvFIRST ≤⋎R FLOATvLAST⌝], get_conjecture "-" "vcUNKNOWN_INTERVAL_1");
a(PC_T1 "z_sets_ext" REPEAT strip_tac
	THEN rewrite_tac[z_get_specⓩUNKNOWN_INTERVAL⌝,
		z_ℝ_dot_dot_def]);
a(z_∃_tac ⓩ(FLOATvFIRST +⋎R FLOATvLAST) /⋎R real 2⌝
	THEN REPEAT strip_tac
	THEN PC_T1 "z_ℝ_lin_arith" asm_prove_tac[]);
store_mt_results
mt_run
 [("QQ134.3.1", fun_true o save_pop_thm , "vcUNKNOWN_INTERVAL", true)];
=SML

=TEX
=TEX
\subsection{QQ262: Child packages}
=TEX
A regression test for private types first:
=SML
clean_up();
new_script{name = "p1", unit_type="spec"};
ⓈCN
package p1 is
 type priv_t is limited private;
 ⟨ var dec ⟩			( 1 )
private
 type priv_t is range 1 .. 10;
end;
■
ⓈCN
 (1) ≡ x : priv_t;
■
=TEX
=SML
new_script{name = "p2", unit_type="spec"};
fun check_262 () = (
ⓈCN
with p1;
package p2 is
 y : p1.priv_t;
end;
■
=SML
true) handle Fail _ => false;
store_mt_results
mt_run
 [("QQ262.1.1", check_262 , (), true)];
=TEX
=SML
clean_up();
open_theory "cn";
set_pc "cn1";
new_script{name = "grandparent", unit_type="spec"};
ⓈCN
package grandparent is
 $auxiliary s : ℕ;
 procedure read_state(x : out natural)
 Δ X Ξ s [X = s];
private
 procedure set_state(x : in natural)
 Δ s [s = X];
end;
■
=SML
output_ada_program{script = "-", out_file = "int525_1.ads"};;
=TEX
=SML
new_script{name = "grandparent", unit_type="body"};
ⓈCN
package body grandparent is
 $using state : natural; $implement s $by s = STATE;
 procedure set_state(x : in natural)
 Δ STATE [STATE = X]
 is
 begin
  state := x;
 end;
 procedure read_state(x : out natural)
 Δ X Ξ STATE [X = STATE]
 is
 begin
  x := state;
 end;
end;
■
=TEX
=SML
open_scope "grandparent";

set_goal([], get_conjecture "-" "vcGRANDPARENT_1");
a(REPEAT strip_tac);
val _ = save_pop_thm "vcGRANDPARENT_1";

set_goal([], get_conjecture "-" "vcGRANDPARENT_2");
a(rewrite_tac[z_get_specⓩNATURAL⌝] THEN REPEAT strip_tac);
a(all_var_elim_asm_tac1);
a(z_∃_tacⓩSTATE⌝ THEN REPEAT strip_tac);
val _ = save_pop_thm "vcGRANDPARENT_2";

set_goal([], get_conjecture "-" "vcGRANDPARENT_3");
a(REPEAT strip_tac);
val _ = save_pop_thm "vcGRANDPARENT_3";

set_goal([], get_conjecture "-" "vcGRANDPARENT_4");
a(rewrite_tac[z_get_specⓩNATURAL⌝] THEN REPEAT strip_tac);
a(all_var_elim_asm_tac1);
a(z_∃_tacⓩSTATE⌝ THEN REPEAT strip_tac);
val _ = save_pop_thm "vcGRANDPARENT_4";

set_goal([], get_conjecture "-" "vcGRANDPARENT_5");
a(rewrite_tac[z_get_specⓩNATURAL⌝] THEN REPEAT strip_tac);
a(z_∃_tacⓩSTATE⌝ THEN REPEAT strip_tac);
val _ = save_pop_thm "vcGRANDPARENT_5";
=TEX
=SML
store_mt_results
mt_run
[ ("QQ262.2.1", get_unproved_conjectures, "-", []) ];
=TEX
=SML
open_scope "grandparent.read_state";

set_goal([], get_conjecture "-" "vcGRANDPARENToREAD_STATE_1");
a(REPEAT strip_tac);
val _ = save_pop_thm "vcGRANDPARENToREAD_STATE_1";
=TEX
=SML
store_mt_results
mt_run
[ ("QQ262.2.1.1", get_unproved_conjectures, "-", []) ];
=TEX
=SML
open_scope "grandparent.set_state";

set_goal([], get_conjecture "-" "vcGRANDPARENToSET_STATE_1");
a(REPEAT strip_tac);
val _ = save_pop_thm "vcGRANDPARENToSET_STATE_1";
=TEX
=SML
store_mt_results
mt_run
[ ("QQ262.2.1.2", get_unproved_conjectures, "-", []) ];
=SML
output_ada_program{script = "-", out_file = "int525_1.adb"};;
=TEX
=SML
new_script{name = "grandparent.parent", unit_type="spec"};
ⓈCN
package grandparent.parent is
 procedure increment_state
 Δ s [s = s⋎0 + 1];
private
 procedure add_to_state(x : in natural)
 Δ s [s = s⋎0 + X];
end;
■
=SML
output_ada_program{script = "-", out_file = "int525_2.ads"};;
=TEX
=SML
new_script{name = "grandparent.parent", unit_type="body"};
ⓈCN
package body grandparent.parent is
 procedure add_to_state(x : in natural)
 Δ s [s = s⋎0 + X]
 is
  t : natural;
 begin
 $con s0 : ℤ⦁ Δ s, T [s0 = s, s = s0 + X] (1)
 end;
 procedure increment_state
 Δ s [s = s⋎0 + 1]
 is
 begin
  add_to_state(1);
 end;
end;
■
=TEX
=SML
open_scope "grandparent.parent";
set_goal([], get_conjecture "-" "vcGRANDPARENToPARENT_1");
a(REPEAT strip_tac);
val _ = save_pop_thm "vcGRANDPARENToPARENT_1";

set_goal([], get_conjecture "-" "vcGRANDPARENToPARENT_2");
a(REPEAT strip_tac);
val _ = save_pop_thm "vcGRANDPARENToPARENT_2";

set_goal([], get_conjecture "-" "vcGRANDPARENToPARENT_3");
a(REPEAT strip_tac);
val _ = save_pop_thm "vcGRANDPARENToPARENT_3";

set_goal([], get_conjecture "-" "vcGRANDPARENToPARENT_4");
a(REPEAT strip_tac);
val _ = save_pop_thm "vcGRANDPARENToPARENT_4";
=TEX
=SML
store_mt_results
mt_run
[ ("QQ262.2.2", get_unproved_conjectures, "-", []) ];
=TEX
=SML
open_scope "grandparent.parent.add_to_state";

ⓈCN
 (1) ⊑
   Δ T [s0 = s, T = s0 ] (11)
   Δ s [T = s0, s = s0 + X ] (12)
■

ⓈCN
 (11) ⊑
   read_state(t);
■

ⓈCN
 (12) ⊑
   set_state(t + x);
■

=TEX
=SML

set_goal([], get_conjecture "-" "vcGRANDPARENToPARENToADD_TO_STATE_1");
a(REPEAT strip_tac);
val _ = save_pop_thm "vcGRANDPARENToPARENToADD_TO_STATE_1";

set_goal([], get_conjecture "-" "vcGRANDPARENToPARENToADD_TO_STATE_2");
a(REPEAT strip_tac);
val _ = save_pop_thm "vcGRANDPARENToPARENToADD_TO_STATE_2";

set_goal([], get_conjecture "-" "vcGRANDPARENToPARENToADD_TO_STATE_3");
a(REPEAT strip_tac THEN all_var_elim_asm_tac1 THEN REPEAT strip_tac);
val _ = save_pop_thm "vcGRANDPARENToPARENToADD_TO_STATE_3";

set_goal([], get_conjecture "-" "vc1_1");
a(REPEAT strip_tac);
val _ = save_pop_thm "vc1_1";

set_goal([], get_conjecture "-" "vc1_2");
a(REPEAT strip_tac);
val _ = save_pop_thm "vc1_2";

set_goal([], get_conjecture "-" "vc1_3");
a(REPEAT strip_tac);
val _ = save_pop_thm "vc1_3";

set_goal([], get_conjecture "-" "vc11_1");
a(REPEAT strip_tac);
val _ = save_pop_thm "vc11_1";

set_goal([], get_conjecture "-" "vc11_2");
a(REPEAT strip_tac THEN all_var_elim_asm_tac1 THEN strip_tac);
val _ = save_pop_thm "vc11_2";

set_goal([], get_conjecture "-" "vc12_1");
a(REPEAT strip_tac);
val _ = save_pop_thm "vc12_1";

set_goal([], get_conjecture "-" "vc12_2");
a(REPEAT strip_tac THEN all_var_elim_asm_tac1 THEN strip_tac);
val _ = save_pop_thm "vc12_2";
=TEX
=SML
store_mt_results
mt_run
[ ("QQ262.2.2.1", get_unproved_conjectures, "-", []) ];
=TEX
=SML
open_scope "grandparent.parent.increment_state";

set_goal([], get_conjecture "-" "vcGRANDPARENToPARENToINCREMENT_STATE_1");
a(REPEAT strip_tac);
val _ = save_pop_thm "vcGRANDPARENToPARENToINCREMENT_STATE_1";

set_goal([], get_conjecture "-" "vcGRANDPARENToPARENToINCREMENT_STATE_2");
a(REPEAT strip_tac);
val _ = save_pop_thm "vcGRANDPARENToPARENToINCREMENT_STATE_2";
=TEX
=SML
store_mt_results
mt_run
[ ("QQ262.2.2.2", get_unproved_conjectures, "-", []) ];
=SML
output_ada_program{script = "-", out_file = "int525_2.adb"};;
=TEX
=SML
new_script{name = "grandparent.parent.child", unit_type="spec"};
ⓈCN
package grandparent.parent.child is
 procedure double_state
 Δ s [s = 2 * s⋎0];
end;
■
=SML
output_ada_program{script = "-", out_file = "int525_3.ads"};;
=TEX
=SML
new_script{name = "grandparent.parent.child", unit_type="body"};
ⓈCN
package body grandparent.parent.child is
 procedure double_state
 Δ s [s = 2 * s⋎0]
 is
   t : natural;
 begin
 $con s0 : ℤ⦁ Δ s, T [s0 = s, s = 2*s0] (2)
 end;
end;
■
=TEX
=SML
open_scope "grandparent.parent.child";

set_goal([], get_conjecture "-" "vcGRANDPARENToPARENToCHILD_1");
a(REPEAT strip_tac);
val _ = save_pop_thm "vcGRANDPARENToPARENToCHILD_1";

set_goal([], get_conjecture "-" "vcGRANDPARENToPARENToCHILD_2");
a(REPEAT strip_tac);
val _ = save_pop_thm "vcGRANDPARENToPARENToCHILD_2";
=TEX
=SML
store_mt_results
mt_run
[ ("QQ262.2.3", get_unproved_conjectures, "-", []) ];
=TEX
=SML
open_scope "grandparent.parent.child.double_state";
ⓈCN
 (2) ⊑
   Δ T [s0 = s, T = s0 ] (21)
   Δ s [T = s0, s = 2*s0 ] (22)
■

ⓈCN
 (21) ⊑
   read_state(t);
■

ⓈCN
 (22) ⊑
  set_state(2*t);
■
=TEX
=SML
set_goal([], get_conjecture "-" "vcGRANDPARENToPARENToCHILDoDOUBLE_STATE_1");
a(REPEAT strip_tac);
val _ = save_pop_thm "vcGRANDPARENToPARENToCHILDoDOUBLE_STATE_1";

set_goal([], get_conjecture "-" "vcGRANDPARENToPARENToCHILDoDOUBLE_STATE_2");
a(REPEAT strip_tac);
val _ = save_pop_thm "vcGRANDPARENToPARENToCHILDoDOUBLE_STATE_2";

set_goal([], get_conjecture "-" "vcGRANDPARENToPARENToCHILDoDOUBLE_STATE_3");
a(REPEAT strip_tac THEN all_var_elim_asm_tac1 THEN strip_tac);
val _ = save_pop_thm "vcGRANDPARENToPARENToCHILDoDOUBLE_STATE_3";

set_goal([], get_conjecture "-" "vc2_1");
a(REPEAT strip_tac);
val _ = save_pop_thm "vc2_1";

set_goal([], get_conjecture "-" "vc2_2");
a(REPEAT strip_tac THEN all_var_elim_asm_tac1);
val _ = save_pop_thm "vc2_2";

set_goal([], get_conjecture "-" "vc2_3");
a(REPEAT strip_tac);
val _ = save_pop_thm "vc2_3";

set_goal([], get_conjecture "-" "vc21_1");
a(REPEAT strip_tac);
val _ = save_pop_thm "vc21_1";

set_goal([], get_conjecture "-" "vc21_2");
a(REPEAT strip_tac THEN all_var_elim_asm_tac1 THEN strip_tac);
val _ = save_pop_thm "vc21_2";

set_goal([], get_conjecture "-" "vc22_1");
a(REPEAT strip_tac);
val _ = save_pop_thm "vc22_1";

set_goal([], get_conjecture "-" "vc22_2");
a(REPEAT strip_tac THEN PC_T1 "z_lin_arith" asm_prove_tac[]);
val _ = save_pop_thm "vc22_2";
=TEX
=SML
store_mt_results
mt_run
[ ("QQ262.2.3.1", get_unproved_conjectures, "-", []) ];
=TEX
=SML
fun guc thy = (open_theory thy; get_unproved_conjectures"-");
store_mt_results
mt_run
[ ("QQ262.2.4", flat o map guc, (get_descendants"cn"), []) ];
=SML
output_ada_program{script = "-", out_file = "int525_3.adb"};;
=TEX
=TEX
\subsection{QQ267: Modular Types}
=TEX
=SML

(* TBS - THESE TESTS TO BE REINSTATED IN A LATER ISSUE **** ****

clean_up();
new_script{name = "mt1", unit_type="proc"};
ⓈCN
procedure mt1
Δ [true]
is
 type mod5 is mod 5;
 subtype mod_cinque is mod5;
 subtype ttf is mod5 range 2 .. 4;
 type arr_mod5 is array (1..2) of mod5;
 x, y, z : mod5;
 a : constant arr_mod5 := (mod5(2), mod5(3));
 b : constant arr_mod5 := arr_mod5'(1, 4);
 c : constant mod5 := mod5(2);
begin
 Δ X, Y, Z [ MOD5vPOS X = (2 * MOD5vPOS Y) mod 5] (10)
end;
■
=SML
store_mt_results
mt_run
 [("QQ267.1.1", concl o ∧_left_elim o z_get_spec , ⓩB⌝, ⓩB ∈ ARR_MOD5⌝),
 ("QQ267.1.2", concl o z_get_spec , ⓩTTFvSUCC⌝, ⓩTTFvSUCC = MOD5vSUCC⌝),
 ("QQ267.1.3", concl o z_get_spec , ⓩMOD_CINQUE⌝, ⓩMOD_CINQUE = MOD5⌝)
];
=TEX
ⓈCN
 (10) ⊑ y := mod5(1) + mod5(2); z := mod5(2); x:= y xor z;
■
ⓈZ
│ ∀x:𝕌⦁MOD5vPOS(MOD5_of_int x) = x mod 5
■
ⓈZ
│ ∀x:𝕌⦁ MOD5_of_int x ∈ MOD5
■
=SML
val mod5_ax1 = get_axiom "-" "Constraint 1";
val mod5_ax2 = get_axiom "-" "Constraint 2";
set_goal([], get_conjecture "-" "vcMT1_1");
a(REPEAT strip_tac);
val _ = save_pop_thm "vcMT1_1";
set_goal([], get_conjecture "-" "vcMT1_2");
a(REPEAT strip_tac);
val _ = save_pop_thm "vcMT1_2";

set_goal([], get_conjecture "-" "vc10_1");
a(rewrite_tac[mod5_ax1, mod5_ax2]);
val _ = save_pop_thm "vc10_1";
=SML
store_mt_results
mt_run
 [("QQ267.2,1", get_unproved_conjectures , "-", [])];
=TEX
=SML
clean_up();
new_script{name = "mt2", unit_type="proc"};
ⓈCN
procedure mt2
is
 type byte is mod 256;
 subtype nybble is byte range 0 .. 15;
 type cubit is array (1..4) of byte;
 b0  : constant byte := 0;
 b1  : constant byte := byte'succ(b0);
 b2  : constant byte := -b1;
 b3  : constant byte := not b2;
 b4  : constant byte := abs b3;
 b5  : constant byte := +b4;
 b6  : constant byte := b2 and b3;
 b7  : constant byte := b2 or b3;
 b8  : constant byte := b2 xor b3;
 c1  : constant boolean := b2 = b3;
 c2  : constant boolean := b2 /= b3;
 c3  : constant boolean := b2 < b3;
 c4  : constant boolean := b2 > b3;
 c5  : constant boolean := b2 <= b3;
 c6  : constant boolean := b2 >= b3;
 b9  : constant byte := b2 + b3;
 b10 : constant byte := b2 - b3;
 b11 : constant byte := b2 * b3;
 b12 : constant byte := b2 / b3;
 b13 : constant byte := b2 mod b3;
 b14 : constant byte := b2 rem b3;
 c7  : constant boolean := b2 in nybble;
 c8  : constant boolean := b2 not in nybble;

 a1  : constant cubit := (1, 2, 3, 4);
 a2  : constant cubit := (4, 3, 2, 1);
 c10 : constant boolean := a1 < a2;
begin
 null;
end;
■
store_mt_results
mt_run
 [("QQ267.3.1", concl o z_get_spec , ⓩC4⌝, ⓩC4 ∈ BOOLEAN ∧ C4 = BYTEvPOS B2 greater BYTEvPOS B3⌝),
 ("QQ267.3.2", concl o z_get_spec , ⓩB5⌝, ⓩB5 ∈ BYTE ∧ B5 = B4⌝),
 ("QQ267.3.3", concl o z_get_spec , ⓩC10⌝, ⓩC10 ∈ BOOLEAN ∧ C10 = A1 ⨾ BYTEvPOS array_less A2 ⨾ BYTEvPOS⌝)
];
=TEX
=SML
clean_up();
new_script{name = "mt3", unit_type="proc"};
ⓈCN
procedure mt3
is
 type mod1001 is mod 1001;
 n1 : constant mod1001 := 1;
 n2 : constant mod1001 := 1 + 2;
 n3 : constant mod1001 := mod1001(3) + 4;
 n4 : constant mod1001 := 5 + mod1001(6);
begin
 null;
end;
■
=SML
store_mt_results
mt_run
 [("QQ267.4.1", concl o z_get_spec , ⓩN1⌝, ⓩN1 ∈ MOD1001 ∧ N1 = MOD1001_of_int 1⌝),
 ("QQ267.4.2", concl o z_get_spec , ⓩN2⌝, ⓩN2 ∈ MOD1001 ∧ N2 = MOD1001_of_int (1 + 2) ⌝),
 ("QQ267.4.3", concl o z_get_spec , ⓩN3⌝, ⓩN3 ∈ MOD1001 ∧ N3 = MOD1001_of_int (MOD1001vPOS (MOD1001_of_int 3) + 4)⌝),
 ("QQ267.4.3", concl o z_get_spec , ⓩN4⌝, ⓩN4 ∈ MOD1001 ∧ N4 = MOD1001_of_int (5 + MOD1001vPOS (MOD1001_of_int 6))⌝)
];

**** **** TBS - THESE TESTS TO BE REINSTATED IN A LATER ISSUE *)
=TEX

=TEX
\section{EPILOGUE}
=SML
diag_line(summarize_mt_results());
=TEX
\end{document}
%%%%    %%%%    %%%%    %%%%    %%%%    %%%%    %%%%    %%%%
    %%%%    %%%%    %%%%    %%%%    %%%%    %%%%    %%%%    %%%%
%%%%    %%%%    %%%%    %%%%    %%%%    %%%%    %%%%    %%%%
    %%%%    %%%%    %%%%    %%%%    %%%%    %%%%    %%%%    %%%%
%%%%    %%%%    %%%%    %%%%    %%%%    %%%%    %%%%    %%%%
    %%%%    %%%%    %%%%    %%%%    %%%%    %%%%    %%%%    %%%%
%%%%    %%%%    %%%%    %%%%    %%%%    %%%%    %%%%    %%%%
    %%%%    %%%%    %%%%    %%%%    %%%%    %%%%    %%%%    %%%%
%%%%    %%%%    %%%%    %%%%    %%%%    %%%%    %%%%    %%%%
    %%%%    %%%%    %%%%    %%%%    %%%%    %%%%    %%%%    %%%%
The following just captures a useful piece of ML that
is used for an informal test that deferred subprograms
do what they were supposed to do.
=SML
(* COMMENT IT ALL OUT:

(*
Manually run test that deferred subprogram feature
does allow subprograms to be developed in child databases.

Session 1:

(to be run in database "xxx" say).

*)
new_script{name = "P", unit_type="proc"};
ⓈCN
procedure p
is
 x : integer;
 c : constant integer := 1001;
 $deferred procedure q(y : out integer)
 Δ Y [ Y = 1001 ]
 is
   ⟨ decs ⟩			( 100 )
 begin
    ⟨ body of q ⟩			( 10 )
 end;
 procedure r (y : out integer)
 Δ Y [ Y = 0 ]
 is
 begin
  Δ Y [ Y = 0 ]
 end;
begin
 Δ X [X = C]		(1)
end;
■
ⓈCN
 (1) ⊑ q(x);
■
set_pc "cn1";
set_goal([], get_conjecture"-" "vc1_1");
a(REPEAT strip_tac);
val _ = save_pop_thm "vc1_1";
set_goal([], get_conjecture"-" "vc1_2");
a(rewrite_tac[z_get_specⓩC⌝] THEN REPEAT strip_tac);
val _ = save_pop_thm "vc1_2";
val [] = get_unproved_conjectures "-";
save_and_quit();

(*

Now in a shell do:

pp_make_database -f -p xxx yyy

And start up again in database yyy:

Session 2:

*)

open_scope "p.q";
ⓈCN
 (100) ≡
 d : constant integer := 2*c;
 procedure r
 Δ Y [ Y = D - C ]
 is
   procedure s
   Δ Y [ Y = C ]
   is separate;
 begin
  s;
 end;
■
ⓈCN
 (10) ⊑ r;
■
=SML
set_goal([], get_conjecture"-" "vc10_1");
a(REPEAT strip_tac);
val _ = save_pop_thm "vc10_1";
set_goal([], get_conjecture"-" "vc10_2");
a(rewrite_tac[z_get_specⓩC⌝, z_get_specⓩD⌝] THEN REPEAT strip_tac);
val _ = save_pop_thm "vc10_2";
val [] = get_unproved_conjectures "-";
get_script_theories "P'proc";

(*
delete_deferred_subprogram "p.q";
*)

new_script{name = "P.Q.R.S", unit_type="proc"};
ⓈCN
 separate(p.q.r) procedure s
 Δ Y [ Y = D - C ]
 is
 begin
   y := 1001;
 end;
■
set_goal([], get_conjecture"-" "vcPoQoRoS_1");
a(REPEAT strip_tac);
val _ = save_pop_thm "vcPoQoRoS_1";
set_goal([], get_conjecture"-" "vcPoQoRoS_2");
a(rewrite_tac[z_get_specⓩC⌝, z_get_specⓩD⌝] THEN REPEAT strip_tac);
val _ = save_pop_thm "vcPoQoRoS_2";
set_goal([], get_conjecture"-" "vcPoQoRoS_3");
a(rewrite_tac[z_get_specⓩC⌝, z_get_specⓩD⌝] THEN REPEAT strip_tac);
val _ = save_pop_thm "vcPoQoRoS_3";
val [] = get_unproved_conjectures "-";
=TEX
=SML
 (* END OF COMMENTED OUT MATERIAL *) *)
=TEX
\subsection{QQ306: Erroneous Scope Names}
=TEX
=SML
clean_up();
new_script {name = "A", unit_type = "spec"};
ⓈCN
package A is

end A;
■
=SML
new_script {name = "A", unit_type = "body"};
ⓈCN
package body A is

  procedure P is separate;

end A;
■
=SML
new_script {name = "A.P", unit_type = "proc"};
ⓈCN
separate (A)
procedure P
is
  ⟨ procedure Q ⟩    (1)
begin
  null;
end P;
■
ⓈCN
 (1) ≡
  procedure Q
  is
  begin
    ⟨ body ⟩    (2)
  end Q;
■
=SML
store_mt_results
mt_run
 [("QQ306.1", open_scope , "A.P.Q", ())];
=TEX
\subsection{QQ309: Output Valid Compliance Notation}
First load code supplied by QinetiQ.
=SML
(*
 * code for generating refinements, roughly as we would have it...
 *  (this example does not generate open_scope comamnds)
 *)

local

fun flatmap f = flat o (map f);

open TextIO;
open CNAdaOutput;
open CNZGenerator;

fun output_web_clause ostream wc = (
	let
		val outf = make_output_fun ostream;
		val outft = outf o translate_for_output
	in	outft "ⓈCN"; outf "\n";
		fmt_web_clause {outf = outf, fmt_repl = Nil} wc;
		outft "■";
		outf "\n";
		outf "\n"
	end
);

open WebClauses.LabelUtilities;

in

fun output_replacement ostream label = case get_replacement label of
	Value repl	=> (case repl of
		ReplaceComp (x as {comp, ...})		=> (
			output_web_clause ostream (WCReplacedByCompilation x);
			app (output_replacement ostream) (flatmap extract_labels_from_kslot_comp_unit comp)
		)
	|	ReplacePPart (x as {private, ...})		=> (
			output_web_clause ostream (WCReplacedByPrivatePart x);
			app (output_replacement ostream) (flatmap extract_labels_from_declaration private)
		)
	|	ReplaceVPart (x as {visible, ...})		=> (
			output_web_clause ostream (WCReplacedByVisiblePart x);
			app (output_replacement ostream) (flatmap extract_labels_from_declaration visible)
		)
	|	ReplaceDecl (x as {decls, ...})		=> (
			output_web_clause ostream (WCReplacedByDecl x);
			app (output_replacement ostream) (flatmap extract_labels_from_declaration decls)
		)
	|	ReplaceStat (x as {statement = s, ...})     => (
			output_web_clause ostream (WCReplacedBy x);
			app (output_replacement ostream) (extract_labels_from_statement s)
		)
	|	ReplaceArbitrary x						=> (
			output_web_clause ostream (WCReplacedByArbitraryAda x)
		)
	|	RefineStat (x as {statement = s, ...})	=> (
			output_web_clause ostream (WCRefinedBy x);
			app (output_replacement ostream) (extract_labels_from_statement s)
		)
	|	ReplaceAnnotation (x as {replacement, ...})	=> (
			output_web_clause ostream (WCReplacedByAnnotation x);
			app (output_replacement ostream) (extract_labels_from_annotation replacement)
		)
	|	UnReplaced _				=> ()
	)
|	Nil		=> ();

fun output_spark_prog ostream : unit =
	let
		val kcus = #spark_prog (get_z_generator_state ());

	in	output_web_clause ostream (WCCompilation kcus);
		app (output_replacement ostream) (flatmap extract_labels_from_kslot_comp_unit kcus)
	end;

end (* of local ... in ... *);
=TEX
Now test it out by outputting various web clauses, reading them back in
=SML
clean_up();
new_script {name = "A", unit_type = "spec"};
ⓈCN
package A is
  $auxiliary v : ℤ;
  procedure P (N : Integer)
    Δ v [ v = N ];
  function F (N : Integer) return Integer
    Ξ v [ AoF v N = v + N ];
end A;
■
=SML
val strm = open_out "int525_1_a_ads.sml";
output_spark_prog strm;
val _ = close_out strm;
=SML
clean_up();
new_script {name = "A", unit_type = "spec"};
store_mt_results
mt_run
 [("QQ309.1.1", use_file , "int525_1_a_ads.sml", ())];
val strm = open_out "int525_2_a_ads.sml";
output_spark_prog strm;
val _ = close_out strm;
=TEX
=SML
fun get_diff f1 f2 = (
	let	val  _ = ExtendedIO.system
			("diff " ^ f1 ^ " " ^ f2 ^ " 2>&1");
		val s = open_in "int513.diff";
		val res = ExtendedIO.input_line s;
	in 	close_in s;
		res
	end
);
store_mt_results_show
mt_run [
    ("QQ309.2,1", get_diff"int525_1_a_ads.sml" , "int525_2_a_ads.sml", "")
];
=TEX
=SML
new_script {name = "A", unit_type = "body"};
ⓈCN
package body A is
  $using V : Integer; $implement v $by V = v;
  $implicit
  procedure P (N : Integer)
    Δ V [ V = N ];
  procedure P (N : Integer)
    Δ V [ V = N ]
  is
  begin
   while false
   $till ⟦ true ⟧
   loop
     Δ[true] (1)
   end loop;
   V := N;
  end P;
  $deferred
  procedure local_proc
   Δ V[V < 0 ]
  is
  begin
     ⟨ deferred body ⟩			( 2 )
  end;
  function F (N : Integer) return Integer
    Ξ V [ AoF V N = V + N ]
  is
  begin
   return V + N;
  end F;
end A;
■
=SML
val strm = open_out "int525_1_a_adb.sml";
output_spark_prog strm;
val _ = close_out strm;
=SML
clean_up();
new_script {name = "A", unit_type = "spec"};
use_file "int525_2_a_ads.sml";
new_script {name = "A", unit_type = "body"};
store_mt_results
mt_run
 [("QQ309.3.1", use_file , "int525_1_a_adb.sml", ())];
val strm = open_out "int525_2_a_adb.sml";
output_spark_prog strm;
val _ = close_out strm;
store_mt_results_show
mt_run [
    ("QQ309.4.1", get_diff"int525_1_a_adb.sml" , "int525_2_a_adb.sml", "")
];
=TEX
=SML
clean_up();
new_script {name = "Q", unit_type = "proc"};
ⓈCN
procedure Q(x : integer; y : in out integer)
Δ Y [ Y = 2*X ]
is
 t : integer;
begin
 ΔT[T = X + 1] (1)
 ΔT[T = X + 1, T = 2*X + 2] (2)
 ΔY[T = 2*X + 2, Y = T - 2] (3)
end;
■
ⓈCN
 (1) ⊑
 $block anonymous:
 declare
   s : integer;
 begin
   s := x-1;
   t := s + 2;
  end $block anonymous;
■
ⓈCN
 (2) ⊑
  named:
  declare
      s : integer;
  begin
    s := t;
    t := s + s;
  end named;
■
ⓈCN
 (3) ⊑
  $nothing;
  y := t - 2;
■
=SML
val strm = open_out "int525_1_q_adb.sml";
output_spark_prog strm;
val _ = close_out strm;
=SML
clean_up();
new_script {name = "Q", unit_type = "proc"};
store_mt_results
mt_run
 [("QQ309.5.1", use_file , "int525_1_q_adb.sml", ())];
val strm = open_out "int525_2_q_adb.sml";
output_spark_prog strm;
val _ = close_out strm;
store_mt_results_show
mt_run [
    ("QQ309.6.1", get_diff"int525_1_q_adb.sml" , "int525_2_q_adb.sml", "")
];
val _ = ExtendedIO.system "rm int525_[12]_[aq]_ad[bs].sml";
=TEX
\section{EPILOGUE}
=SML
diag_line(summarize_mt_results());
=TEX
\end{document}
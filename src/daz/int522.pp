=IGN
********************************************************************************
int522.doc: this file is part of the PPDaz system

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

\def\Title{ Spring 2002 Enhancement Tests }

\def\Abstract{\begin{center}
{\bf Abstract}\par\parbox{0.7\hsize}
{\small This document provides integration tests to support the enhancements developed
under the enhancements programme carried out inspring 2002.}
\end{center}}

\def\Reference{LEMMA1/DAZ/INT522}

\def\Author{R.D. Arthan}

\def\EMail{{\tt rda@lemma-one.com}}

\def\Phone{+44 118 958 4409}

\def\Fax{+44 118 956 1920}

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
\item[Issues 1.1 (2002/05/10)-1.2 (2002/05/11)] First drafts
\item[Issue 1.3 (2002/05/12)] 2.5.4 bug 7 has been withdrawn.
\item[Issue 1.4 (2002/05/12)] interim release tests.
\item[Issue 1.5 (2002/05/14)] improved recursion examples.
\item[Issue 1.6 (2002/05/21)] more tests for renaming.
\item[Issue 1.7 (2002/05/21)] more tests for subprogram renaming; fix to test of use clauses.
\item[Issue 1.8 (2002/05/31)] Tested relaxation of restriction on aggregates.
\item[Issue 1.9 (2002/05/31), 1.10 (2002/06/01)] Tests for more liberal treatment of use clauses.
\item[Issue 1.11 (2002/07/09)] Test for pp259-bug3 fix.
\item[Issue 1.12 (2002/07/09)] Test for R0076 bug fix.
\item[Issue 1.13 (2002/07/13)] R0054: reworked treatment of use clauses.
\item[Issue 1.14 (2002/07/14)] More bug fix tests.
\item[Issue 1.15 (2002/07/15)] Further tests for interactions between renaming and use clauses.
\item[Issue 1.16 (2002/07/24)] Tests for assertions.
\item[Issue 1.17 (2002/08/01)] Test for bug fix (pp2510-bug0).
\item[Issue 1.18 (2002/08/14)] Tests for block statements.
\item[Issue 1.19 (2002/08/15)] Tests for default parameters; accommodated fix to VC generation for procedure calls;
more tests for renaming (distributed through the document).
\item[Issue 1.20 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.21 (2002/10/17), 1.22 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.23 (2002/11/11), 1.24 (2002/11/11)] Uniform treatment of block statements.
\item[Issues 1.25 (2002/11/13)--1.27 (2002/11/14)] Tests for non-SPARK warnings.
\item[Issue 1.28 (2002/11/14)] Tests for R0078 (new scheme for translating constant declarations).
\item[Issue 1.29 (2002/11/15)] Corrected test for non-SPARK warnings.
\item[Issue 1.30 (2002/11/19)] Added tests for {\it delete\_script}.
\item[Issue 1.31 (2002/12/07)] Added tests for schemas in function $\Xi$-lists.
\item[Issue 1.32 (2002/12/09)] Added tests for auxiliary variables in function $\Xi$-lists.
\item[Issue 1.33 (2002/12/10)] No longer get non-SPARK warning for named number declarations.
\item[Issues 1.34 (2002/12/16), 1.35 (2002/12/17)] Tests for new error reporting and error recovery.
\item[Issue 1.36 (2002/12/17)] Added test on free variables in theorems.
\item[Issue 1.37 (2003/04/28)] Allowed for slight changes to checks on frames and checks on global dependencies lists.
Reinstated some tests that had accidentally been commented out.
\item[Issue 1.39 (2004/01/19)] The Z universal set is now called 𝕌
\item[Issue 1.40 (2004/02/07)] The SPARK program is now referred to as the Ada program.
\item[Issue 1.41 (2004/08/11)] Non-SPARK checks now include check on identifier at end of a proper body or package declaration.
\item[Issue 1.42 (2004/10/10)] Non-SPARK checks now include check on empty private part.
\item[Issue 1.43 (2004/11/18)] Allowed for better treatment of function renamings in package specs.
\item[Issue 1.44 (2004/12/08)] Now have non-SPARK checks for labelled statements and goto statements.
\item[Issue 1.45 (2005/05/28)] Compliance Notation reserved words are now prefixed by a dollar sign.
\item[Issue 1.46 (2006/03/23), 1.47 (2006/03/24)] Allowances for enhancement 117.
\item[Issue 1.48 (2006/03/28)] Allowed for automated state management.
\item[Issue 1.50 (2006/04/07)] Allowed for insistence on canonical names in Z under enhancement 117
\item[Issue 1.51 (2006/04/20)] Ada real literals are now translated into Z floating point literals.
\item[Issue 1.52 (2006/05/05)] Allowed for new handling of function and constant renamings.
\item[Issue 1.53 (2006/06/01)] accommodated enhancement 139 --- 1-theory-per-subprogram.
\item[Issue 1.54 (2006/07/21)] accommodated enhancement 162 --- context theories.
\item[Issue 1.55 (2006/09/16)] Allowed for new {\em open\_scope} command.
\item[Issue 1.56 (2006/09/18)] Tidied usage of {\em new\_script}.
\item[Issue 1.57 (2006/09/19)] Allowed for enhancement 165.
\item[Issue 1.58 (2007/05/20)] Allowed for enhancement 192 (theory-per-block).
\item[Issue 1.59 (2008/02/10)] Allowed for change to lexical rules for underscores in Z.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

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
of enhancements carried out in Spring 2002. See \cite{LEMMA1/DAZ/HLD509}
for the detailed specification of the enhancements.

The interim releases of the Compliance Tool have been
fully regression-tested and the new features have been module-
and integration-tested to a certain extent by the existing tests.
This document provides specific integration tests to
complete the coverage.
\section{PREAMBLE}
Load the test harness.

=SML
use_file "dtd013";
use_file "imp013";
=TEX
Function to clean up before doing a test.

=SML
val reset_cn = pending_reset_cn_state();
fun clean_up () = (
        let     val thys = (get_descendants "cn" less "cn"
                                        diff get_cache_theories())
                fun del_thy thy = (force_delete_theory thy handle Fail _ => ());
	val err_scrs =map fst (CNZGenerator.get_exception_logs());
        in      map del_thy thys;
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
\section{THE TESTS}
\subsection{R0002: Spring 2002 Efficiency Issues} \label{ROne}
\subsection{R0031/R0069: {\tt Xpp} enhancements} \label{RTwo}
\subsection{R0047/R0054: Renaming declarations and use clauses} \label{RThree}
=SML
clean_up();
new_script{name = "P", unit_type="proc"};

ⓈCN
procedure p
is
  a, b : integer;
  y : integer renames a;
  z : integer renames b;
begin
  Δ A, B [A = 42 ∧ B = A]
end p;
■
ⓈCN
  ⊑  a := 42; z := y;
■
=SML
set_pc"cn1";
set_goal([], get_conjecture"-""vc_1_1");
a(REPEAT_UNTIL is_∧ strip_tac);
a(strip_tac THEN accept_tac(refl_convⓩ42⌝));
store_mt_results
mt_run
 [("r3.1.1", fun_true o pop_thm , (), true)];

=SML
clean_up();
new_script{name = "P", unit_type="spec"};

ⓈCN
package p
is
  a, b : integer;
  y : integer renames a;
  z : integer renames b;
end p;
■

=SML
new_script{name = "Q", unit_type="proc"};

ⓈCN
with p;
procedure q
is
begin
  Δ PoA, PoB[PoA = 42 ∧ PoB = PoA]
end q;
■

ⓈCN
  ⊑  p.a := 42; p.z := p.y;
■
=SML
set_pc"cn1";
set_goal([], get_conjecture"-""vc_1_1");
a(REPEAT_UNTIL is_∧ strip_tac);
a(strip_tac THEN accept_tac(refl_convⓩ42⌝));
store_mt_results
mt_run
 [("r3.2.1", fun_true o pop_thm , (), true)];

=SML
new_script{name = "R", unit_type="proc"};

ⓈCN
with p;
use p;
procedure r
is
begin
  Δ PoA, PoB[PoA = 42 ∧ PoB = PoA]
end r;
■

ⓈCN
  ⊑  p.a := 42; p.z := p.y;
■
=SML
set_pc"cn1";
set_goal([], get_conjecture"-""vc_1_1");
a(REPEAT_UNTIL is_∧ strip_tac);
a(strip_tac THEN accept_tac(refl_convⓩ42⌝));
store_mt_results
mt_run
 [("r3.2.2", fun_true o pop_thm , (), true)];

=SML
new_script{name = "S", unit_type="proc"};

ⓈCN
with p;
procedure s
is
package REN renames p;
begin
  Δ PoA, PoB[PoB = 42 ∧ PoB = PoA]
end s;
■

ⓈCN
  ⊑  REN.a := 42; p.z := REN.y;
■

=SML
set_pc"cn1";
set_goal([], get_conjecture"-""vc_1_1");
a(REPEAT_UNTIL is_∧ strip_tac);
a(strip_tac THEN accept_tac(refl_convⓩ42⌝));
store_mt_results
mt_run
 [("r3.2.3", fun_true o pop_thm , (), true)];
=SML
clean_up();
new_script{name = "P1", unit_type="spec"};

ⓈCN
package p1
is
  a, b : integer;
   ⟨more decs ⟩			( decs )
end p1;
■

=SML
new_script{name = "S", unit_type="proc"};
fun do_it() =
ⓈCN
with p1;
use p1;
procedure s
Δ P1oA [ P1oA  = 0]
is
begin
 a := 0;
end s;
■
=SML
store_mt_results
mt_run_fail
[
	("r3.3.1", do_it, (),  gen_fail_msg "check_pack_complete" 507071 ["P1", ": DECS"])
];

=SML
clean_up();
new_script{name = "S", unit_type="proc"};
=SML
store_mt_results
mt_run_fail
[
	("r3.3.2", do_it, (), gen_fail_msg "use_pack"  507063 ["P1"])
];

=SML
clean_up();
new_script{name = "P1", unit_type="spec"};

ⓈCN
package p1
is
  a, b : integer;
   ⟨more decs ⟩			( decs )
end p1;
■

ⓈCN
 (decs) ≡   y : integer renames a;
■
=SML
new_script{name = "S", unit_type="proc"};

=SML
store_mt_results
mt_run
[
	("r3.3.3", do_it, (), ())
];
=TEX
=SML
fun dupl1 () = (
clean_up();
new_script{name = "P", unit_type="spec"};
ⓈCN
package p
is
  a, b : integer;
  y : integer renames a;
  y : integer renames a;
end p;
■
=SML
());
=TEX
=SML
fun dupl2 () = (
clean_up();
new_script{name = "P", unit_type="spec"};
ⓈCN
package p
is
  a, b : integer;
  b : integer renames a;
end p;
■
=SML
());
=TEX
=SML
store_mt_results
mt_run_fail
[
	("r3.4.1", dupl2, (), gen_fail_msg "renames_object_common"  507064 ["A", "B"])
];
=TEX
=SML
clean_up();
new_script{name = "P", unit_type="proc"};
ⓈCN
procedure p
is
  x : integer;
  procedure p1
  Δ X [ X = 1 ]
  is begin x := 1; end p1;
  procedure r1 renames p1;
begin
 Δ X [X = 1]
end p;
■
ⓈCN
  ⊑ r1;
■
=SML
set_pc"cn1";
set_goal([], get_conjecture"-""vc_1_2");
a(REPEAT strip_tac);
store_mt_results
mt_run
 [("P'proc.1", fun_true o pop_thm , (), true)];
=TEX
=SML
clean_up();
new_script{name = "P", unit_type="proc"};
fun do_it() =
ⓈCN
procedure p
is
  x : integer;
  function p1 return integer
  Ξ X [ P1 X = X ]
  is begin return x; end p1;
  function r1(x : integer) return integer renames p1;
begin
 Δ X [X = 1]
end p;
■
=SML
store_mt_results
mt_run_fail
[
	("P'proc.2", do_it, (), gen_fail_msg "renames_fun_otherwise"  507064["P1", "R1"])
];
=SML
clean_up();
new_script{name = "P", unit_type="spec"};

ⓈCN
package p
is
  a : integer;
  function read_a return integer Ξ PoA [ PoREAD_A  PoA = PoA ];
  procedure set_a (x : integer) Δ PoA [ PoA = X ];
  c : constant integer := 1;
  type enum is (l1, l2, l3, l4);
  type interval is range 1 .. 10;
  type real_interval is delta 0.001 range 0.1 .. 1.0;
end p;
■

=SML
new_script{name = "Q", unit_type="proc"};

ⓈCN
with p;
use p;
procedure q
is
  x, y, z : interval;
begin
  Δ PoA, X, Y, Z [X = PoC ∧ Y = PoC + PoC ∧ PoA = PoC]
end q;
■
ⓈCN
  ⊑ a:= p.c; x := read_a; y := 2*read_a;
   Δ PoA [X = PoC ∧ Y = 2*X, X = PoC ∧ Y = PoC + PoC ∧ PoA = PoC]
■
ⓈCN
  ⊑ set_a(c);
■

=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"-""vc_1_1");
a(strip_asm_tac(z_get_specⓩPoC⌝) THEN ALL_FC_T rewrite_tac[z_get_specⓩPoREAD_A⌝]);
store_mt_results
mt_run
 [("r3.6.1", fun_true o pop_thm , (), true)];

set_goal([], get_conjecture"-""vc_1_2");
a(cn_vc_simp_tac[]);
store_mt_results
mt_run
 [("r3.6.2", fun_true o pop_thm , (), true)];

set_goal([], get_conjecture"-""vc_2_2");
a(PC_T1 "z_lin_arith" prove_tac[]);
store_mt_results
mt_run
 [("r3.6.3", fun_true o pop_thm , (), true)];
=TEX
=SML
new_script{name = "R", unit_type="spec"};

ⓈCN
with p;
package r
is
use p;
  z : constant integer := 2*c;
  procedure p1
  Δ PoA [ PoA = PoA⋎0 + RoZ];
end r;
■
=TEX
=SML
new_script{name = "S", unit_type="spec"};

ⓈCN
with p;
with r;
package s
is
use p;
use r;
  c1 : constant integer := 2*c + z;
  c2 : constant enum := l1;
  procedure p2
  Δ PoA [ PoA = PoA⋎0 + RoZ];
end s;
■
=SML
set_pc"cn1";
set_goal([], ⓩSoC1 = 4 ∧ SoC2 = 0⌝);
a(rewrite_tac(map z_get_spec[ⓩSoC1⌝, ⓩSoC2⌝, ⓩPoC⌝, ⓩRoZ⌝, ⓩPoL1⌝]));
store_mt_results
mt_run
 [("r3.6.d.2", fun_true o pop_thm , (), true)];
=SML
new_script{name = "S", unit_type="body"};

ⓈCN
with p;
with r;
package body s
is
use p;
use r;
  procedure p2
  Δ PoA [ 2*PoA = 2*PoA⋎0 + RoZ]
  is
     x : integer;
  begin
   x := read_a; p.a := x + 1;
  end p2;
end s;
■
=TEX
=SML
open_theory "SoP2'proc";
set_pc"cn1";
set_goal([], get_conjecture"-""vcSoP2_1");
a(rewrite_tac(map z_get_spec[ⓩPoREAD_A⌝, ⓩPoC⌝, ⓩRoZ⌝]) THEN REPEAT strip_tac);
a(ALL_FC_T rewrite_tac[z_get_specⓩPoREAD_A⌝]);
a(PC_T1"z_lin_arith" prove_tac[]);
store_mt_results
mt_run
 [("r3.6.d.3", fun_true o pop_thm , (), true)];

=SML
store_mt_results
mt_run
 [
	("r3.6.4", print_ada_program, "P'spec", ()),
	("r3.6.5", print_ada_program, "Q'proc", ()),
	("r3.6.6", print_ada_program, "R'spec", ()),
	("r3.6.7", print_ada_program, "S'spec", ()),
	("r3.6.8", print_ada_program, "S'body", ())
];
=SML
clean_up();
new_script { name = "S", unit_type="spec"};
ⓈCN
package S is
  type T is digits 6 range -1.0 .. +1.0;
end S;
■
=SML
new_script { name = "P", unit_type="spec"};
ⓈCN
with S;
use S;
package P is
  function FUNCT56 (LEFT : in T; RIGHT : in T) return T
    Ξ [ PoFUNCT56 (LEFT, RIGHT) = RIGHT -⋎R LEFT ];
  function F56 (LEFT : in T; RIGHT : in T) return T renames FUNCT56;
  procedure P56 (X : out T)
  Δ X [ X = real 0 ];
end P;
■
=SML
new_script { name = "Q", unit_type="spec"};
ⓈCN
with p;
with s;
use p;
use s;
package q
is
	x : T;
	function f(L : in T) return T
	Ξ QoX [QoF QoX L =  PoFUNCT56(QoX, L)];
	procedure q56 (Y : out T) renames p56;
end q;
■
=SML
new_script { name = "R", unit_type="proc"};
ⓈCN
with s;
use s;
with q;
use q;
procedure r
is
  y : T;
begin
 Δ QoX, Y [ Y ≤⋎R real 1 ] (1)
 Δ Y [ Y ≤⋎R real 1 ] (2)
end r;
■
ⓈCN
(1)  ⊑ q.x := T(0); y := 0.0; y := q.f(y);
■
ⓈCN
(2)  ⊑ q56(y);
■
=SML
all_cn_make_script_support "spqr";
set_merge_pcs["'z_reals", "'cn_reals", "spqr"];
=TEX
=SML
set_goal([], get_conjecture "-" "vc1_1");
a(cn_vc_simp_tac[]);
a(lemma_tac ⓩreal 0 ∈ SoT ∧ 0.0 ∈ SoT⌝ THEN1
	(rewrite_tac[z_get_specⓩ(_ ..⋎R _)⌝] THEN PC_T1 "z_ℝ_lin_arith" prove_tac[]));
a(ALL_FC_T rewrite_tac [cn_QoF_thm]);
a(ALL_FC_T rewrite_tac [z_get_specⓩPoFUNCT56⌝]);
a(PC_T1 "z_ℝ_lin_arith" prove_tac[]);
store_mt_results
(mt_runf (op =$))
 [("r.3.7.1", snd o dest_thm o pop_thm , (), get_conjecture"-""vc1_1")];
=TEX
=SML
set_goal([], get_conjecture "-" "vc2_2");
a(REPEAT strip_tac THEN asm_rewrite_tac[]);
store_mt_results
(mt_runf (op =$))
 [("r.3.7.2", snd o dest_thm o pop_thm , (), get_conjecture"-""vc2_2")];
=TEX
\subsection{R0048: {\tt Use type} clauses} \label{RFour}
=SML
clean_up();
new_script{name = "P1", unit_type="spec"};
ⓈCN
package p1
is
  type byte is range 0 .. 255;
end p1;
■
=SML
new_script{name = "S", unit_type="proc"};
ⓈCN
with p1;
use type p1;
procedure s
is
 a : p1.byte;
begin
  null;
end s;
■
=SML
store_mt_results
mt_run [("r4.1.1", fun_true , "just have to get here", true)];
=SML
new_script{name = "S2", unit_type="proc"};
ⓈCN
with p1, undefined1;
with undefined2;
use type p1, undefined1, undefined2;
procedure s2
is
 a : p1.byte;
begin
  null;
end s2;
■
=SML
store_mt_results
mt_run [("r4.1.2", fun_true , "just have to get here", true)];
=TEX
\subsection{R0049: Generic Packages and Subprograms} \label{RFive}
\subsection{R0050: Discriminants} \label{RSix}
=SML
clean_up();
new_script{name = "MAIN", unit_type="proc"};

ⓈCN
 procedure main
 is
  type disc_rec1 (size : integer) is
   record
    pos : integer;
    buf : string( 1 .. size );
   end record;
  procedure p Δ[true] is begin null; end p;
  c2 : disc_rec1(42);
  c3 : disc_rec1 := disc_rec1'(2,  1, "ab");
  type disc_rec2 (size1 : integer; size2 : integer) is
   record
    pos2 : integer;
    buf1 : disc_rec1( size1 );
    buf2 :  string( 1 .. size2 );
   end record;
  type uncon2 is array(integer range <>, integer range <>) of character;
  subtype sub_ty1 is integer range 1 .. 10;
  subtype sub_ty2 is integer range 1 .. 15;
  type disc_rec3 (lo1, hi1, lo2, hi2 : integer) is
   record
    buf1 : uncon2(lo1 .. hi1, lo2 .. hi2);
    buf2 : uncon2(sub_ty1, lo2 .. hi2);
    buf3 : uncon2(lo1 .. hi1, sub_ty2 range lo2 .. hi2);
    buf4 : uncon2(sub_ty1, sub_ty2);
   end record;
 begin
 Δ C3 [ C2.SIZE = 42 ∧ C3 = (SIZE ≜  1, POS ≜ 1, BUF ≜ string_lit "X")]
 end main;
■

ⓈCN
  ⊑  c3 := disc_rec1'(1,  1, "X");
■
=SML
val _ = cn_make_script_support "-" "MAIN'proc";
set_pc"MAIN'proc";
set_goal([], get_conjecture"-""vc_1_1");
a(cn_vc_simp_tac[] THEN REPEAT strip_tac);
store_mt_results
mt_run
 [("r6.1.1", fun_true o pop_thm , (), true)];
=TEX
\subsection{R0051: Default parameters} \label{RSeven}
=SML
clean_up();
new_script{name="P", unit_type="proc"};

ⓈCN
 procedure p
 is
   x, y : integer;
   c : constant integer := 99;
   procedure q (a : in integer := c)
  Δ X [X = A]
  is begin x := a; end q;
 begin
 Δ X, Y [ X = 99 ]
 end p;
■
ⓈCN
  ⊑ q;
■

=SML
store_mt_results
(mt_runf (op =$))
 [("r7.1.1", get_conjecture "-" , "vc_1_2", ⓩ∀ X : INTEGER | true ∧ X = C ⦁ X = 99⌝)];
=SML
clean_up();
new_script{name="P", unit_type="proc"};

ⓈCN
 procedure p
 is
   x, y : integer;
   c : constant integer := 99;
   procedure q (a : in integer := c)
  Δ X [X = A]
  is begin x := a; end q;
  procedure r (y : in integer := 2*c) renames q;
 begin
 Δ X [ X = 198 ]
 end p;
■
ⓈCN
  ⊑ r;
■
=SML
store_mt_results
(mt_runf (op =$))
 [("r7.2.1", get_conjecture "-" , "vc_1_2", ⓩ∀ X : INTEGER | true ∧ X = 2*C ⦁ X = 198⌝)];
=TEX
=SML
clean_up();
new_script{name="P", unit_type="proc"};

ⓈCN
 procedure p
 is
   type interval is range 1 .. 1000;
   x, y : interval;
   c : constant interval := 99;
   function q (a : in interval := c) return interval
  Ξ X [Q X A = X + A]
  is begin return x + a; end q;
  function r (y : in interval := 2*c)  return interval renames q;
 begin
 Δ X, Y [ Y = 5 * 99 ]
 end p;
■
ⓈCN
  ⊑  x := c; y := q + r;
■
=TEX
=SML
all_cn_make_script_support "P'proc";
set_pc "P'proc";
set_goal([], get_conjecture"-""vc_1_1");
a(cn_vc_simp_tac[]);
a(PC_T1 "cn1" lemma_tacⓩ99 ∈ INTERVAL ∧ 198 ∈ INTERVAL⌝ THEN1 REPEAT strip_tac);
a(PC_T1 "cn1" (ALL_FC_T rewrite_tac)[z_get_specⓩQ⌝]);
store_mt_results
mt_run
 [("r7.3.1", fun_true o pop_thm , (), true)];
=SML
clean_up();
new_script{name="P", unit_type="proc"};

ⓈCN
 procedure p
 is
   type interval is range 1 .. 1000;
   x, y : interval;
   c : constant interval := 99;
   procedure q (a, b : in interval := c; m : interval; y, z : interval := 2*c)
  Δ X [X = A + B + M + Y + Z]
  is begin x := a + b + m + y + z; end q;
 begin
 Δ X [ X = 7 * 99 - 1 ]
 end p;
■
ⓈCN
  ⊑  q(m => c - 1);
■

=SML
all_cn_make_script_support "P'proc";
set_pc "P'proc";
set_goal([], get_conjecture"-""vc_1_2");
a(cn_vc_simp_tac[] THEN REPEAT strip_tac THEN asm_rewrite_tac[]);
store_mt_results
mt_run
 [("r7.4.1", fun_true o pop_thm , (), true)];
=TEX
=SML
clean_up();
new_script{name="P", unit_type="proc"};

ⓈCN
 procedure p
 is
   type interval is range 1 .. 1000;
   m : interval;
  function add (x : interval := 1; y : in interval := 2)  return interval renames "+";
 begin
 Δ M [ M = 13 ]
 end p;
■
ⓈCN
  ⊑  m := add(add(add(3), add(y => 4)), add); --   ((3+2) + (1+4)) + (1+2)
■
=SML
set_pc "cn1";
set_goal([], get_conjecture"-""vc_1_1");
a(cn_vc_simp_tac[z_get_specⓩADD⌝]);
store_mt_results
mt_run
 [("r7.5.1", fun_true o pop_thm , (), true)];
=TEX
\subsection{R0052: Block statements} \label{REight}
=SML
clean_up();
new_script{name="P", unit_type="proc"};

ⓈCN
 procedure p
 is
   x : integer;
 begin
 Δ X [ X = 0 ]
 end p;
■

ⓈCN
  ⊑ begin x := 0; end;
■
=SML
store_mt_results
(mt_runf (op =$))
 [("r8.1.1", get_conjecture "-" , "vc_1_1", ⓩtrue ⇒ 0 = 0⌝)];
=SML
clean_up();
new_script{name="P", unit_type="proc"};

ⓈCN
 procedure p
 is
   x : integer;
 begin
 Δ X [ X = 0 ]
 end p;
■

ⓈCN
  ⊑ declare begin x := 0; end;
■
=SML
open_scope "p.";
store_mt_results
(mt_runf (op =$))
 [("r8.2.1", get_conjecture "-" , "vc_1_1", ⓩtrue ⇒ 0 = 0⌝)];
=SML
clean_up();
new_script{name="P", unit_type="proc"};

ⓈCN
 procedure p
 is
   x : integer;
 begin
 Δ X [ X = 0 ]
 end p;
■

ⓈCN
  ⊑ x := 4;
    Δ X [ X = 4, X = 0]
■
ⓈCN
  ⊑ declare y : integer := x; begin x := x - y; end;
■
The VC from the last step will be unprovable unless the initialisation of y has been looked after
properly.
=SML
open_scope"p.";
set_pc"cn1";
set_goal([], get_conjecture"-""vc_2_1");
a(REPEAT strip_tac THEN asm_rewrite_tac[]);
store_mt_results
mt_run
 [("r8.3.1", fun_true o pop_thm , (), true)];
=TEX
Now check that more complicated things in a block declarative part are OK.
=SML
clean_up();
new_script{name="P", unit_type="proc"};

ⓈCN
 procedure p
 is
   x : integer;
 begin
 Δ X [ X = 0 ]
 end p;
■

ⓈCN
  ⊑
  declare
   type t is range 1 .. 10;
    y : t := t(x);
    c : constant integer := 5;
   function f (x : in t) return integer
  Ξ [ F X = X + C ]
   is begin  return integer(x) + c; end f;
  begin
    x := f(y) - x - 5;
  end;
■
=SML
open_scope"p.";
set_pc"cn1";
set_goal([], get_conjecture"-""vc_1_1");
a(cn_vc_simp_tac[] THEN REPEAT strip_tac);
a(ALL_FC_T rewrite_tac[z_get_specⓩF⌝]);
a(asm_rewrite_tac[z_get_specⓩC⌝]);
a(PC_T1"z_lin_arith" prove_tac[]);
store_mt_results
mt_run
 [("r8.4.1", fun_true o pop_thm , (), true)];
=TEX
Check that the syntax of blocks inside other statements is supported.
=SML
clean_up();
new_script{name="P", unit_type="proc"};

ⓈCN
 procedure p
 is
   x : integer;
 begin
 $block anon: begin x := 99; end $block anon;
 if true then declare  t : integer; begin t := x; x := 0; end; end if;
 end p;
■
=SML
store_mt_results
mt_run
 [("r8.5.1", fun_true o print_ada_program , "-", true)];
=TEX
Check that the declarations in a block on the right-hand side of an replacement step are processed:

=SML
clean_up();
new_script{name="P", unit_type="proc"};

ⓈCN
 procedure p
 is
   x : integer;
 begin
⟨ statement k-slot ⟩			( 1 )
 end p;
■
ⓈCN
 (1) !⊑
declare
  y : integer;
  c : constant integer := 45;
begin
 Δ X, Y [ X = Y  = 89 ]
end;
■
=SML
open_scope "p.";
ⓈCN
 ⊑
 y := c - 1;
 x := c + y;
 y := x;
■
=SML
set_pc"cn1";
set_goal([], get_conjecture"-""vc1_1_1");
a(cn_vc_simp_tac[z_get_spec ⓩC⌝]);
store_mt_results
mt_run
 [("r8.6.1", fun_true o pop_thm , (), true)];
=TEX
Check that variable declarations in a block on the right-hand side of a refinement step are processed:

=SML
clean_up();
new_script{name="P", unit_type="proc"};

ⓈCN
 procedure p
 is
   x : integer;
 begin
Δ X [ X = 99 ]	(1)
 end p;
■
ⓈCN
 (1) ⊑
declare
  y : integer;
begin
 Δ X, Y [ X = Y  = 99 ]
end;
■
=SML
open_scope"p.";
ⓈCN
 ⊑
 y := 100;
 x := y - 1;
 y := x;
■
=SML
set_pc"cn1";
set_goal([], get_conjecture"-""vc1_1_1");
a(cn_vc_simp_tac[]);
store_mt_results
mt_run
 [("r8.7.1", fun_true o pop_thm , (), true)];

=TEX
\subsection{R0053/R0073: Loop names, exits from named loops, return statements} \label{RNine}

=SML
clean_up();
new_script{name="SET", unit_type="proc"};

ⓈCN
 procedure set(a : in boolean; x : in out boolean)
 ΔX [A = X, X = TRUE]
 is
 begin
  if a then return; end if;
  x := true;
 end set;
■
=SML
set_pc"cn1";
set_goal([], get_conjecture"-""vcSET_1");
a(prove_tac[]);
store_mt_results
mt_run
 [("r9.1.1", fun_true o pop_thm , (), true)];

set_goal([], get_conjecture"-""vcSET_2");
a(prove_tac[]);
store_mt_results
mt_run
 [("r9.1.2", fun_true o pop_thm , (), true)];
=SML
clean_up();
new_script{name="MAIN", unit_type="proc"};

ⓈCN
 procedure main
 is
  type table is array(1..10) of boolean;
  procedure find_true(flags : table; i : in out integer; not_found : out boolean)
  Δ I, NOT_FOUND [FLAGS I = TRUE ∨ NOT_FOUND = TRUE]
  is
  begin
   i := 1;
-- Optimist's approach: guess it's there, return from proc when found, exit loop when none found.
   not_found := false;
  L1:
  $till ⟦I = 11⟧
  loop
   Δ I [NOT_FOUND = FALSE, NOT_FOUND = FALSE]
  end loop L1;
  not_found := true;
  end find_true;
 begin
   null;
 end main;
■
=SML
open_scope "MAIN.FIND_TRUE";
ⓈCN
  ⊑
   if flags(i) then return; end if;
     i := i + 1;
    exit L1 when i = 11;
■
=SML
set_pc"cn1";
val r9_2_vcs = map (snd o snd) (get_conjectures"-");

fun r9_2_tp conj = tac_proof(([], conj), cn_vc_simp_tac[] THEN prove_tac[]);

store_mt_results
mt_run
 [("r9.2.1", length o map (dest_thm o r9_2_tp o switch nth r9_2_vcs) , interval 0 5, length r9_2_vcs)];


=SML
clean_up();
new_script{name="MAIN", unit_type="proc"};

ⓈCN
 procedure main
 is
  type table is array(1..10) of boolean;
  procedure find_true(flags : table; i : in out integer; not_found : out boolean)
  Δ I, NOT_FOUND [FLAGS I = TRUE ∨ NOT_FOUND = TRUE]
  is
  begin
   i := 1;
-- Pessimist's approach: guess it's not there, return from proc when not found, exit loop when found.
   not_found := true;
  L1:
  $till ⟦FLAGS I = TRUE⟧
  loop
   Δ I [NOT_FOUND = TRUE, NOT_FOUND = TRUE]
  end loop L1;
  not_found := false;
  end find_true;
 begin
   null;
 end main;
■
=SML
open_scope "MAIN.FIND_TRUE";
ⓈCN
  ⊑
    exit L1 when flags(i);
     i := i + 1;
    if  i = 11 then return; end if;
■

=SML
set_pc"cn1";
val r9_3_vcs = map (snd o snd) (get_conjectures"-");

fun r9_3_tp conj = tac_proof(([], conj), cn_vc_simp_tac[] THEN prove_tac[]);

store_mt_results
mt_run
 [("r9.3.1", length o map (dest_thm o r9_3_tp o switch nth r9_3_vcs) , interval 0 5, length r9_3_vcs)];

=SML
clean_up();
new_script{name="MAIN", unit_type="proc"};

ⓈCN
 procedure main
 is
  type table is array(1..10, 1..10) of boolean;
  procedure find_true(flags : table; i, j : in out integer; not_found : out boolean)
  Δ I, J, NOT_FOUND [FLAGS(I, J) = TRUE ∨ NOT_FOUND = TRUE]
  is
  begin
   i := 1;
   not_found := true;
  L1:
  $till ⟦FLAGS(I, J) = TRUE⟧
  loop
   Δ I, J [NOT_FOUND = TRUE, NOT_FOUND = TRUE]
  end loop L1;
 not_found := false;
  end find_true;
 begin
   null;
 end main;
■
=SML
open_scope "MAIN.FIND_TRUE";
ⓈCN
  ⊑
      j := 1;
     $till ⟦FLAGS(I, J) = TRUE ∨ J = 11⟧
      loop
     Δ J [NOT_FOUND = TRUE, NOT_FOUND = TRUE]
     end loop;
     i := i + 1;
     if i = 11
    then
      return;
    end if;
■

=TEX

ⓈCN
  ⊑
       exit L1 when flags(i, j);
       j := j + 1;
      exit when j = 11;
■


=SML
set_pc"cn1";
val r9_4_vcs = map (snd o snd) (get_conjectures"-");

fun r9_4_tp conj = tac_proof(([], conj), cn_vc_simp_tac[] THEN prove_tac[]);

store_mt_results
mt_run
 [("r9.4.1", length o map (dest_thm o r9_4_tp o switch nth r9_4_vcs) , interval 0 9, length r9_4_vcs)];

=TEX
\subsection{R0055: Warnings for non-SPARK constructs} \label{RTen}
=SML
clean_up();
new_script{name="R10_1", unit_type="spec"};

ⓈCN
 package r10_1 is
  v : integer range 1 .. 10;				-- 1) anonymous subtype 510101
  c : constant integer range 1 .. 10 := 5;			-- 2) anonymous subtype 510102
  n : constant integer range 1 .. 10 := 0;			-- 3) anonymous subtype 510102
  type buf is array (integer range <>) of string(1 .. 10);	-- 4, 5) anonymous subtype * 2 510110, 510111
  type disc(x :  integer) is record b : buf(1 .. x); end record;	-- 6) discriminant 510104
						-- 7, 8) anonymous subtype * 2  510112, 510111
  subtype buf8 is buf(1..8);				-- 9) anonymous subtype 510111
  type index8a is range buf8'range;			-- 10) attribute as range 510107
  subtype index8b is integer range buf8'range;		-- OK
  type buf5 is array(integer range 1 .. 5) of character;	-- 11) anonymous subtype 510111
  y : integer renames v;				-- 12) renames after other declarations
  type d4 is digits 4 range float'range;			-- 13) attribute as range 510108
  subtype disc4 is disc(4);
  subtype float1 is float digits 3 range 1.0 .. 2.0;		-- 14) reduced accuracy subtype 510106
  type fixed is delta 0.1 range 1.0 .. 10.0;
  subtype fixed1 is fixed delta 0.2 range 1.0 .. 2.0;		-- 15) reduced accuracy subtype 510105
 private						-- 16) empty private part 510126
 end;						-- 17) Omitted identifier 510123
■

=SML
set_flag("cn_spark_syntax_warnings", true);
print_ada_program"-";
output_ada_program{script="-", out_file = "int522.tmp"};
store_mt_results
mt_run
 [(	"R10_1'spec",
	ExtendedIO.system,
	"test  `egrep \"WARNING\" int522.tmp | wc -l `  = 17",
	true)];
ExtendedIO.system "rm int522.tmp";
=SML
new_script{name="R10_2", unit_type="proc"};

ⓈCN
with r10_1;
use r10_1;						-- 1) use clause 510114
procedure r10_2 (x : in out integer := 99)			-- 2) default parameter 510120
is
	function "+" (lop, rop : in index8a) return index8a
		renames r10_1."+";				-- OK
	package p renames r10_1;				-- 3) package renaming 510113
	function f (lop, rop: in integer) return integer renames "*";	-- 4) renaming 510113
--	xyz : integer renames v;
	abc : constant r10_1.buf5 := ('1', '2', '3', '4', '5');		-- 5) aggregate 510115
begin
	 begin null; end;					-- 6) block 510117
	lab: loop
		exit lab;					-- 7) named exit 510118
		exit lab when true;				-- 8) named exit 510118
	end loop lab;
	return;						-- 9) return 510120
	for i in 1 .. 10					-- 10) anonymous subtype 51016
 	loop
		null;
	end loop;
	<<label>> null;					--11) labelled statement
	goto label;					--12) goto statement
end;							--13) omitted identifier 510124
■
=SML
print_ada_program"-";
output_ada_program{script="-", out_file = "int522.tmp"};
store_mt_results
mt_run
 [(	"R10_2'proc",
	ExtendedIO.system,
	"test  `egrep \"WARNING\" int522.tmp | wc -l `  = 13",
	true)];
ExtendedIO.system "rm int522.tmp";
=TEX
=SML
set_flag("cn_spark_syntax_warnings", false);
=TEX
\subsection{R0056: Default parameter modes} \label{REleven}
Tested by eyeballing the results of the SPARK output tests (in INT511).
\subsection{R0057: Script management facilities} \label{RTwelve}
=SML
clean_up();

fun ps () = (
new_script{name = "P", unit_type="spec"};
ⓈCN
 package p is
   x : integer;
   c : constant integer := 99;
   procedure p1 Δ PoX [ PoX = 100];
   procedure p2;
   procedure p3;
end p;
■
=TEX
=SML
()
);
=TEX
=SML
fun pb () = (
new_script{name = "P", unit_type="body"};
ⓈCN
  ⟨ cu kslot 1⟩			( 1 )
■
ⓈCN
 (1) ≡   ⟨ cu kslot 2⟩			( 2 )
■
ⓈCN
 (2) ≡
package body p is
  type t is range 1 .. 10;
   procedure p1 Δ PoX [ PoX = 100] is separate;
   procedure p2 is separate;
   procedure p3 is separate;
end p;
■
=TEX
=SML
()
);
=TEX
=SML
fun p1 () = (
new_script{name = "P.P1", unit_type="proc"};
ⓈCN
 separate (p) procedure p1 Δ PoX [ PoX = 100 ] is  c1 : constant t := 1 ;  begin x := c + c1; end p1;
■
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"-""vcPoP1_3");
a(cn_vc_simp_tac(map z_get_spec[ⓩPoC⌝, ⓩC1⌝]));
save_pop_thm "vcPoP1_3";
()
);
=TEX
=SML
fun p2 () = (
new_script{name = "P.P2", unit_type="proc"};
ⓈCN
 separate (p) procedure p2 is  c2 : constant t := 2;  begin null; end p2;
■
=TEX
=SML
()
);
=TEX
=SML
fun p3 () = (
new_script{name = "P.P3", unit_type="proc"};
ⓈCN
 separate (p) procedure p3 is  c3 : constant t := 3;  procedure p4 is separate; begin null; end p3;
■
=TEX
=SML
()
);
=TEX
=SML
fun p4 () = (
new_script{name = "P.P3.P4", unit_type="proc"};
ⓈCN
 separate (p.p3) procedure p4 is  c4 : constant t := 4;  begin null; end p4;
■
=TEX
=SML
()
);
=TEX
=SML
fun p5 () = (
new_script{name = "P5", unit_type="proc"};
ⓈCN
procedure p5
is
   package p5_pack is c : constant integer := 42; procedure q; end p5_pack;
 ⟨ body of p5_pack ⟩			( p5_pack )
begin
   q;
end p5;
■
=TEX
=SML
()
);
=TEX
=SML
fun p5_pack () = (
new_continuation_script{name = "P5.p5_pack", unit_type ="body"};
ⓈCN
 (P5) ≡ package body p5_pack is procedure q is begin null; end q; end p5_pack;
■
=TEX
=SML
()
);
=TEX
=SML
fun p5_proc () = (
new_script{name = "P6", unit_type="proc"};
ⓈCN
with p; procedure p6 is begin null; end p6;
■
=TEX
=SML
()
);
=TEX
=SML
fun lib1 () = (
open_theory "cn";
new_theory"lib1";
ⓈZ
│ xyz ≜  99
■
=TEX
=SML
()
);
fun p7 () = (
new_script1{name = "P7", unit_type="proc", library_theories = ["lib1"]};
ⓈCN
with p; use p; procedure p7 is begin Δ PoX [ PoX = xyz] end p7;
■
ⓈCN
  ⊑ x := c;
■
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"-""vc_1_1");
a(cn_vc_simp_tac(map z_get_spec[ⓩPoC⌝, ⓩxyz⌝]));
save_pop_thm "vc_1_1";
()
);
=TEX
Now try various combinations of deleting things and reloading them.
The test criterion here is that none of this should raise any exceptions.
=SML
ps();
pb();
p1();
p2();
p3();
p4();
p5();
p5_pack();
p5_proc();
lib1();
p7();
=TEX
Get rid of the lot and do it all again:
=SML
clean_up();
ps();
pb();
p1();
p2();
p3();
p4();
p5();
p5_pack();
p5_proc();
lib1();
p7();
=TEX
Now try some finer-grained deletions (taking care to get the starting point state variable up-to-date):
=SML
delete_script{name="P5", unit_type="proc"};
p5();
p5_pack();
=TEX
When we get rid of the package body, the package spec should persist.
=SML
delete_script{name="P", unit_type="body"};
pb();
p1();
p2();
p3();
p4();
=TEX
=SML
force_delete_theory"lib1";
lib1();
p7();
=TEX
OK if we get here
=SML
store_mt_results
mt_run
 [("r12.1.1", fun_true , (), true)];
=TEX
Now try a few things that shouldn't work:
=SML
lock_theory "PoP3'context";
val cn_descs = get_descendants "cn";
store_mt_results
mt_run_fail
[
	("r12.1.2", delete_script, {name="P", unit_type="body"}, gen_fail_msg "delete_script"  507090 ["PoP3'context"])
];
store_mt_results
mt_run
 [("r12.1.3", (curry (op=) cn_descs) o get_descendants , "cn", true)];
unlock_theory"PoP3'context";
store_mt_results
mt_run
 [("r12.1.6", (curry (op=) cn_descs) o get_descendants , "cn", true)];
=TEX
\subsection{R0058: Forward declarations of subprograms} \label{RThirteen}
=SML
clean_up();
new_script{name="MAIN", unit_type="proc"};
ⓈCN
 procedure main
 is
  x : integer := 0;
  procedure increment(a : in out integer)
  Δ A [ A = A⋎0 + 1];
 function add1(a : in integer) return integer
 Ξ [ADD1 A = A + 1];
 function add1(a : in integer) return integer
 Ξ [ADD1 A = A + 1]
 is
  t : integer;
 begin
  t := a;
  Δ T [T = A,  T = A + 1 ]  (add1)
  return t;
 end add1;
  procedure increment(a : in out integer)
  Δ A [ A = A⋎0 + 1]
  is
  begin
   a := a + 1;
  end increment;
 begin
   Δ X [ X = 0,  X = 2 ] (main)
 end main;
■
=SML
open_scope "main.add1";
ⓈCN
(add1) ⊑
  increment(t);
■
=SML
open_scope "main";
ⓈCN
(main) ⊑
  increment(x); x := add1(x);
■
=SML
set_pc"cn1";
set_goal([], get_conjecture"-""vcMAIN_1");
a(prove_tac[]);
store_mt_results
mt_run
 [("r13.1.1", fun_true o pop_thm , (), true)];

set_goal([], get_conjecture"-""vcMAIN_2");
a(REPEAT strip_tac THEN all_var_elim_asm_tac1);
a(ALL_FC_T rewrite_tac[z_get_specⓩADD1⌝]);
store_mt_results
mt_run
 [("r13.1.2", fun_true o pop_thm , (), true)];
=TEX
=SML
open_scope "MAIN.ADD1";
set_pc "cn1";
set_goal([], get_conjecture"-""vcMAINoADD1_1");
a(REPEAT strip_tac);
store_mt_results
mt_run
 [("r13.1.3", fun_true o pop_thm , (), true)];

set_goal([], get_conjecture"-""vcMAINoADD1_2");
a(REPEAT strip_tac THEN asm_rewrite_tac[]);
store_mt_results
mt_run
 [("r13.1.4", fun_true o pop_thm , (), true)];

set_goal([], get_conjecture"-""vcADD1_1");
a(REPEAT strip_tac);
store_mt_results
mt_run
 [("r13.1.5", fun_true o pop_thm , (), true)];

set_goal([], get_conjecture"-""vcADD1_2");
a(REPEAT strip_tac THEN asm_rewrite_tac[]);
store_mt_results
mt_run
 [("r13.1.6", fun_true o pop_thm , (), true)];
=TEX
=SML
open_scope "MAIN.INCREMENT";
set_pc "cn1";

set_goal([], get_conjecture"-""vcMAINoINCREMENT_1");
a(REPEAT strip_tac);
store_mt_results
mt_run
 [("r13.1.7", fun_true o pop_thm , (), true)];


=TEX
=SML
clean_up();
new_script{name="MK_POS", unit_type="proc"};
ⓈCN
  procedure mk_pos(a : in out integer)
  Δ A [ A > 0]
 is
 begin
   if a <= 0 then a := a + 1; mk_pos(a); end if;
 end mk_pos;
■
=SML
set_pc"cn1";
set_goal([], get_conjecture"-""vcMK_POS_1");
a(prove_tac[]);
store_mt_results
mt_run
 [("r13.2.1", fun_true o pop_thm , (), true)];

set_goal([], get_conjecture"-""vcMK_POS_2");
a(prove_tac[]);
store_mt_results
mt_run
 [("r13.2.2", fun_true o pop_thm , (), true)];

set_goal([], get_conjecture"-""vcMK_POS_3");
a(cn_vc_simp_tac [] );
store_mt_results
mt_run
 [("r13.2.3", fun_true o pop_thm , (), true)];
=TEX


=SML
clean_up();
new_script{name="P", unit_type="proc"};
ⓈZAX
│	fact : ℤ → ℤ
├──────
│	fact 0 = 1 ;
│ 	∀m:ℕ⦁ fact(m+1) = (m + 1) * fact m
■
ⓈCN
procedure p
is
  type num is range 0 .. 1000000;
  function fact(a :  num) return num
  Ξ [∀x: NUM⦁ x <  A ⇒ FACT x = fact  x, FACT A = fact A]
 is
 begin
   if a = 0 then return 1; else return a * fact(a-1); end if;
 end fact;
begin
 null;
end p;
■
=SML
open_theory "PoFACT'func";
set_pc"cn1";
set_goal([], get_conjecture"-""vcPoFACT_1");
a(cn_vc_simp_tac[] THEN REPEAT strip_tac THEN asm_rewrite_tac[z_get_specⓩfact⌝]);
store_mt_results
mt_run
 [("r13.3.1", fun_true o pop_thm , (), true)];

set_goal([], get_conjecture"-""vcPoFACT_2");
a(cn_vc_simp_tac[z_get_specⓩNUM⌝] THEN REPEAT strip_tac);
a(lemma_tacⓩ∃B:ℕ⦁A = B + 1⌝  THEN1
	(z_∃_tacⓩA- 1⌝ THEN rewrite_tac[] THEN PC_T1"z_lin_arith" asm_prove_tac[]));
a(all_var_elim_asm_tac1);
a(z_spec_nth_asm_tac 4 ⓩB⌝ THEN1 PC_T1"z_lin_arith" asm_prove_tac[]);
a(ALL_FC_T asm_rewrite_tac[z_get_specⓩfact⌝]);
a(asm_rewrite_tac[z_plus_assoc_thm]);
store_mt_results
mt_run
 [("r13.3.2", fun_true o pop_thm , (), true)];

set_goal([], ⓩ∀A: NUM⦁ FACT A = fact A⌝);
a(ante_tac(z_get_specⓩFACT⌝));
a(rewrite_tac[z_get_specⓩNUM⌝] THEN REPEAT strip_tac);
a(POP_ASM_T ante_tac THEN z_cov_induction_tac ⓩA⌝);
a(z_spec_nth_asm_tac 3 ⓩA⌝ THEN REPEAT strip_tac);
a(z_spec_nth_asm_tac 6 ⓩx⌝ THEN REPEAT strip_tac);
store_mt_results
mt_run
 [("r13.3.3", fun_true o pop_thm , (), true)];
=TEX
\subsection{R0059: Enhanced syntax-check-only mode} \label{RFourteen}
Tested in INT511.

\subsection{R0060/R0064: Rationalised error reporting} \label{RFifteen}
The checks on the exception log print-out are mostly interactive.
=SML
clean_up();
new_script{name = "P", unit_type="proc"};
print_exception_log"-";
store_mt_results
mt_run
 [("r15.1.1", CNZGenerator.get_exception_logs , (), [])];

ⓈCN
procedure p
is
pragma MEMORY_SIZE(16#FFFF#);
sensor : integer;
for sensor use at 16#FFFE#;
 ⟨xxx ⟩			( 1 )
begin
null;
end p;
■
ⓈCN
 (1)  !≡ task handler is entry done; for done use at 16#40#; end handler;
■
=SML
fun exn_count () = (
	(length o force_value o s_lookup (get_current_theory_name() )  o CNZGenerator.get_exception_logs) ()
	handle Fail _ => 0
);
store_mt_results
mt_run
 [("r15.1.2", exn_count , (), 3)];
print_exception_log "-";
delete_script{name="P", unit_type="proc"};
mt_run
 [("r15.1.1", CNZGenerator.get_exception_logs , (), [])];
=TEX
=SML
set_flag("cn_stop_on_exceptions", false);
clean_up();
new_script{name = "P", unit_type="proc"};
store_mt_results
mt_run
 [("r15.2.1", print_exception_log , "-", false)];

ⓈCN
procedure p
is
c : constant integer := 99;
c : constant integer := 99;
v, v : integer;
pragma LIST(ON);
begin
Δ X [ X = Y] (1)
Δ Y [ Y = 1] (2)
end p;
■
=SML
store_mt_results
mt_run
 [("r15.2.2", exn_count , (), 5)];
store_mt_results
mt_run
 [("r15.2.3", print_exception_log , "-", true)];
delete_exception_log "P'proc";
store_mt_results
mt_run
 [("r15.2.4", print_exception_log , "-", false)];
ⓈCN
procedure p
is
c : constant integer := 99;
begin
 null;
end p;
■
=TEX
=SML
clean_up();
new_script{name = "P", unit_type="spec"};
ⓈCN
package p
is
v :  integer := 99;
end p;
■
=TEX
=SML
new_script{name = "Q", unit_type="proc"};
=TEX
Want to demonstrate that error recovery allows the package to be referenced in an erroneous
procedure and then in a fixed version.
There is a similar test involving package bodies in section~\ref{RTwentyThree}.
ⓈCN
with p;
procedure q
Δ V [ V= 0] -- error should be PoV
is
begin
 p.v := 0;
end q;
■
=SML
=SML
store_mt_results
mt_run
 [("P'spec", print_exception_log , "-", true)];
delete_exception_log "Q'proc";

ⓈCN
with p;
procedure q
Δ PoV [ PoV= 0]
is
begin
 p.v := 0;
end q;
■
=SML
store_mt_results
mt_run
 [("Q'proc", print_exception_log , "-", false)];
=TEX
=SML
clean_up();
new_script{name = "P", unit_type="proc"};

ⓈCN
procedure p
is
 ⟨ force v in ⟩			( 1 )
begin
 Δ [true]
end p;
■

ⓈCN
  ⊑
 declare
   v : integer;
 begin
   null;
 end;
■
ⓈCN
 (1) ≡ v : integer;
■
=TEX
=SML
print_ada_program"-" handle Fail _ => ();
store_mt_results
mt_run
 [("r15.4.1", print_exception_log , "-", true)];
=TEX
=SML
reset_flag("cn_stop_on_exceptions");
=TEX

\subsection{R0061: Change symbol for statement replacement} \label{RSixteen}
Tested in MDT503 and elsewhere.
\subsection{R0062: Origin of VCs} \label{RSeventeen}
Interactive tests for VC Browser carried out informally.
\subsection{R0063: Unexpanded specification statements} \label{REighteen}
=SML
clean_up();
new_script{name = "P", unit_type="proc"};

ⓈCN
procedure p
is
begin
 Δ [true]
end p;
■
=SML
print_ada_program"-";
output_ada_program{script="-", out_file = "int522.tmp"};
store_mt_results
mt_run
 [(	"r18.1",
	ExtendedIO.system,
	"test  `LC_ALL=C egrep \"Δ\" int522.tmp | wc -l `  = 1",
	true)];
ExtendedIO.system "rm int522.tmp";
=TEX
\subsection{R0065: Duplicated names in context clauses} \label{RNineteen}
Explicitly tested here.
=SML
clean_up();
new_script{name = "P", unit_type="spec"};

ⓈCN
package p
is
  a, b : integer;
  y : integer renames a;
  z : integer renames b;
end p;
■

=SML
new_script{name = "R", unit_type="proc"};

ⓈCN
with p, p;
use p;
procedure r
is
begin
  Δ PoA, PoB[PoB = 42 ∧ PoB = PoA]
end r;
■

ⓈCN
  ⊑  p.a := 42; p.z := p.y;
■
=SML
set_pc"cn1";
set_goal([], get_conjecture"-""vc_1_1");
a(REPEAT_UNTIL is_∧ strip_tac);
a(strip_tac THEN accept_tac(refl_convⓩ42⌝));
store_mt_results
mt_run
 [("r19.2.1", fun_true o pop_thm , (), true)];



=TEX
\subsection{R0066: Auxiliary variables in function $\Xi $-lists} \label{RTwenty}
Explicitly tested here.

The first test case is the simple example from the change proposal document:
=SML
clean_up();
new_script{name = "NUM_SETS", unit_type="spec"};

ⓈCN
package num_sets
is
 $auxiliary astate : 𝔽ℤ;
 procedure add(x : natural)
 Δ astate [X ∉ astate, astate = astate⋎0 ∪ {X}];
 procedure remove(x : natural)
 Δ astate [X ∈ astate, astate = astate⋎0 \ {X}];
 function est_size return natural
 Ξ astate [astate ≠ ∅, #astate ≤ NUM_SETSoEST_SIZE astate < #astate + 10];
end num_sets;
■
=SML
new_script{name = "NUM_SETS", unit_type="body"};
ⓈCN
package body num_sets
is
 $using cstate : integer;  $implement astate $by CSTATE = #astate;
 procedure add(x : natural)
 Δ CSTATE [CSTATE = CSTATE⋎0 + 1]
 is begin cstate := cstate + 1; end add;
 procedure remove(x : natural)
 Δ CSTATE [CSTATE > 0, CSTATE = CSTATE⋎0 - 1]
 is begin cstate := cstate - 1; end remove;
 function est_size return natural
 Ξ CSTATE [CSTATE ≥ 0, EST_SIZE CSTATE = CSTATE]
  is begin return cstate; end est_size;
begin
 cstate := 0;
end num_sets;
■
=SML
open_theory "NUM_SETS'body";
set_pc"cn1";
set_goal([], get_conjecture"-""vcNUM_SETS_5");
a(cn_vc_simp_tac[z_get_specⓩℤ⌝] THEN REPEAT strip_tac THEN all_var_elim_asm_tac1);
a(strip_asm_tac(∧_left_elim(∀_elimⓩ𝕌⦂(ℙℤ)⌝(z_get_specⓩ#⌝))));
a(all_fc_tac[z_→_app_∈_rel_thm]);
a(all_fc_tac[z_fun_∈_clauses]);
store_mt_results
mt_run
 [("r20.1.1", fun_true o pop_thm , (), true)];
=SML
set_goal([], get_conjecture"-""vcNUM_SETS_6");
a(cn_vc_simp_tac[z_get_specⓩℤ⌝] THEN REPEAT strip_tac THEN all_var_elim_asm_tac1);
a(z_∃_tac ⓩastate⌝ THEN asm_rewrite_tac[]);
store_mt_results
mt_run
 [("r20.1.2", fun_true o pop_thm , (), true)];
=TEX
Now an example to check, inter alia, that the package initialization is now optional.
=SML
clean_up();
new_script{name = "REGISTER", unit_type="spec"};

ⓈCN
package register
is
 $auxiliary astate : ℕ;
 procedure set(x : natural)
 Δ astate [astate = X];
 function get return natural
 Ξ astate [REGISTERoGET astate = astate];
end register;
■
=SML
new_script{name = "REGISTER", unit_type="body"};
ⓈCN
package body register
is
 $using cstate : natural; $implement astate $by astate = CSTATE;
 procedure set(x : natural)
 Δ CSTATE [CSTATE = X];
 function get return natural
 Ξ CSTATE [GET CSTATE = CSTATE];
end register;
■
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"-""vcREGISTER_1");
a(cn_vc_simp_tac[]);
store_mt_results
mt_run
 [("r20.2.1", fun_true o pop_thm , (), true)];
=TEX
=SML
set_goal([ⓩNATURAL ⊆ ℕ⌝], get_conjecture"-""vcREGISTER_2");
a(cn_vc_simp_tac[] THEN POP_ASM_T ante_tac THEN
	PC_T1 "z_library_ext" REPEAT strip_tac THEN all_var_elim_asm_tac);
a(z_∃_tacⓩCSTATE⌝ THEN asm_prove_tac[]);
store_mt_results
mt_run
 [("r20.2.2", fun_true o pop_thm , (), true)];
=TEX
=SML
set_goal([], get_conjecture"-""vcREGISTER_3");
a(cn_vc_simp_tac[] );
store_mt_results
mt_run
 [("r20.2.3", fun_true o pop_thm , (), true)];
=TEX
=SML
set_goal([], get_conjecture"-""vcREGISTER_4");
a(cn_vc_simp_tac[] THEN REPEAT strip_tac THEN all_var_elim_asm_tac);
a(z_∃_tacⓩCSTATE⌝ THEN REPEAT strip_tac);
store_mt_results
mt_run
 [("r20.2.4", fun_true o pop_thm , (), true)];
=TEX
=SML
set_goal([ⓩNATURAL ⊆ ℕ⌝], get_conjecture"-""vcREGISTER_5");
a(cn_vc_simp_tac[] THEN POP_ASM_T ante_tac THEN
	PC_T1 "z_library_ext" REPEAT strip_tac);
a(z_∃_tacⓩCSTATE⌝ THEN asm_prove_tac[]);
store_mt_results
mt_run
 [("r20.2.5", fun_true o pop_thm , (), true)];
=TEX
The next example is intended to check that the dependency of auxiliary variables on
the concrete variables that implement them is being tracked correctly.
=SML
clean_up();
new_script{name = "REGISTERS", unit_type="spec"};

ⓈCN
package registers
is
 $auxiliary astate1 : ℤ;
 procedure set_get1(x : integer; y : out integer)
 Δ astate1, Y [astate1 = X ∧ Y = astate1⋎0];
 $auxiliary astate2 : ℤ;
 procedure set_get2(x : integer; y : out integer)
 Δ astate2, Y [astate2 = X ∧ Y = astate2⋎0];
end registers;
■
=SML
new_script{name = "REGISTERS", unit_type="body"};
ⓈCN
package body registers
is
 $using cstate1 : integer; $implement astate1 $by CSTATE1 = astate1;
 $using cstate2 : integer; $implement astate2 $by CSTATE2 = astate2;
 procedure set_get1(x : integer; y : out integer)
 Δ CSTATE1, Y [CSTATE1 = X ∧ Y = CSTATE1⋎0]
 is begin y := cstate1; cstate1 := x; end set_get1;
 procedure set_get2(x : integer; y : out integer)
 Δ CSTATE2, Y [CSTATE2 = X ∧ Y = CSTATE2⋎0]
 is begin y := cstate2; cstate2 := x; end set_get2;
end registers;
■
=SML
val var_names1 = (map fst o term_vars o get_conjecture"-") "vcREGISTERS_2";
val var_names2 = (map fst o term_vars o get_conjecture"-") "vcREGISTERS_4";
fun absent str strs = not (str mem strs) andalso not ((str ^ "⋎0") mem strs);
store_mt_results
mt_run
 [("r20.3.1", absent "CSTATE2" , var_names1, true),
  ("r20.3.2", absent "CSTATE1" , var_names2, true)];
=TEX
Now error cases: first the error when we're doing data refinement and the concrete
function tries to read things that it shouldn't.
=SML
clean_up();
new_script{name = "REGISTER", unit_type="spec"};
ⓈCN
package register
is
 $auxiliary astate : ℤ;
 call_count : integer := 0;
 function get return integer
 Ξ astate [REGISTERoGET astate > astate];
end register;
■
=SML
new_script{name = "REGISTER", unit_type="body"};
fun do_it() =
ⓈCN
package body register
is
 $using cstate : integer; $implement astate $by CSTATE = astate;
 function get return integer
 Ξ CSTATE, REGISTERoCALL_COUNT [GET (CSTATE, REGISTERoCALL_COUNT) > CSTATE]
 is begin return astate + call_count + 1; end get;
end register;
■
=SML
store_mt_results
mt_run_fail
[
	("r20.5.1", do_it, (), gen_fail_msg "form_fun_pack_body_aux"  507095 ["REGISTERoCALL_COUNT", "GET"])
];
=TEX
The other error case is when we are not doing data refinement and the dependency list
in the package body is not the same as the one in the package specification.
=SML
clean_up();
new_script{name = "XX", unit_type="spec"};
ⓈCN
package xx
is
 A, B : integer := 0;
 function get return integer
 Ξ XXoA, XXoB [XXoGET (XXoA, XXoB) > XXoA + XXoB];
end xx;
■
=SML
new_script{name = "XX", unit_type="body"};
fun do_it() =
ⓈCN
package body xx
is
 function get return integer
 Ξ XXoB, XXoA [GET (XXoB,  XXoA) > XXoA + XXoB]
 is begin return a + b + 1; end get;
end xx;
■
=SML
store_mt_results
mt_run_fail
[
	("r20.6.1", do_it, (), gen_fail_msg "form_fun_pack_body"  507050 ["XXoB, XXoA", "XXoA, XXoB", "GET"])
];


=TEX
\subsection{R0067: Schema references in function $\Xi $-lists} \label{RTwentyOne}
=SML
clean_up();
new_script{name = "P", unit_type="proc"};
┌ Locals ───────────
│ X, Y, Z : INTEGER
└──────────────
ⓈCN
 procedure p is
   x, y, z : integer;
   function f return integer
   Ξ Locals [F (θLocals) = X + Y + Z]
  is begin return x + y + z; end f;
 begin ΔX, Y, Z[X = 3]
 end p;
■
ⓈCN
  ⊑ x := 1; y := 1; z := 1; x := f;
■
=SML
set_pc"cn1";
set_goal([ⓩ1 ∈ INTEGER⌝], get_conjecture"-" "vc_1_1");
val thm1 = ∧_right_elim (rewrite_rule[z_get_specⓩLocals⌝](z_get_specⓩF⌝));
val thm2 =rewrite_rule[] ( z_∀_elimⓩ(X ≜ 1, Y ≜ 1, Z ≜ 1)⌝ thm1);
a(ALL_FC_T rewrite_tac[thm2]);
store_mt_results
mt_run
 [("r21.1.1", fun_true o pop_thm , (), true)];
=TEX
=SML
clean_up();
new_script{name = "P", unit_type="proc"};
┌ Locals  ───────────
│ X, Y : INTEGER
└──────────────
ⓈCN
 procedure p is
   x, y : integer;
   function f (a, b : integer) return integer
   Ξ Locals [F (θLocals) (A, B) = (X - A) + (Y - B)]
  is begin return x - a + y - b; end f;
 begin ΔX, Y[X = 0]
 end p;
■
ⓈCN
  ⊑ x := 1; y := 1; x := f(0, 2);
■
=SML
set_pc"cn1";
set_goal([ⓩ1 ∈ INTEGER⌝, ⓩ0 ∈ INTEGER⌝, ⓩ 2 ∈ INTEGER⌝], get_conjecture"-" "vc_1_1");
val thm1 = ∧_right_elim (rewrite_rule[z_get_specⓩLocals⌝](z_get_specⓩF⌝));
val thm2 =rewrite_rule[] ( z_∀_elimⓩ(X ≜ 1, Y ≜ 1)⌝ thm1);
a(ALL_FC_T rewrite_tac[thm2]);
store_mt_results
mt_run
 [("r21.2.1", fun_true o pop_thm , (), true)];
=TEX
\subsection{R0071: Multiple underscores in Z identifiers} \label{RTwentyTwo}
Tested in the module tests for PPZed.
=TEX
\subsection{R0076: Residual Global Variable Unsoundness}\label{RTwentyThree}
Explicitly tested here using a test based on an example From Alf Smith.
This also exposed a bug in a development version of the rationalised error reporting
so we reproduce the conditions for that bug.
=SML
clean_up();
set_flag("cn_stop_on_exceptions", false);
new_script{name = "STACK", unit_type="spec"};
ⓈCN
package Stack is
  $auxiliary v : ℤ;
  procedure Pop (X : out Integer)
  Δ X Ξ v [ X = v ];
end Stack;
■
=SML
new_script{name = "STACK", unit_type="body"};
ⓈCN
package body Stack is
  $using V : Integer; $implement v $by V = v;
  procedure Pop (X : out Integer)
  Δ X [ X = V ∧ V = V⋎0 ]
  is
  begin
    X := V;
  end Pop;
begin
  null;
end Stack;
■
=SML
store_mt_results
mt_run
 [("r0076.1", exn_count , (), 1)];
ⓈCN
package body Stack is
  $using V : Integer; $implement v $by V = v;
  procedure Pop (X : out Integer)
  Δ X, V [ X = V ∧ V = V⋎0 ]
  is
  begin
    X := V;
  end Pop;
begin
  null;
end Stack;
■
=SML
reset_flag("cn_stop_on_exceptions");
=TEX
\subsubsection{pp2.5.9-bug0}
Explicitly tested here.
=SML
clean_up();
new_script { name = "P", unit_type="spec"};

ⓈCN
package P is
  type T is range 1 .. 10;
  function FUNCT56 (LEFT : in T; RIGHT : in T) return T
    Ξ [ PoFUNCT56(LEFT, RIGHT) = LEFT * RIGHT ];
  function F56 (LEFT : in T; RIGHT : in T) return T renames FUNCT56;
end P;
■
=SML
new_script { name = "Q", unit_type="proc"};
ⓈCN
with p;
procedure q
is
 x : p.T;
begin
 Δ X[ X = 4 ]
end q;
■
ⓈCN
  ⊑ x := p.f56(2, 2);
■
=SML
set_pc"cn1";
set_goal([], get_conjecture "-" "vc_1_1");
a(REPEAT strip_tac);
a(lemma_tac ⓩ2 ∈ PoT⌝ THEN1 rewrite_tac[z_get_specⓩPoT⌝]);
a(ALL_FC_T rewrite_tac[z_get_specⓩPoFUNCT56⌝]);
store_mt_results
mt_run
 [("bug.23.0.1", fun_true o pop_thm , (), true)];
=TEX
\subsection{R0077:  Unqualified aggregates as initial values} \label{RTwentyFour}
=SML
clean_up();
new_script{name = "P", unit_type="proc"};

ⓈCN
procedure p(x, y : out integer)
Δ X, Y [ X = 1 ∧ Y = 2]
is
  type pair is record a, b : integer; end record;
  cp : constant pair := (a => 1, b => 2);
  vp : pair := (3, 2);
begin
Δ X, Y, VP [VP = (A ≜ 3, B ≜ 2), X = 1 ∧ Y = 2]
end p;
■
ⓈCN
  ⊑
  y := vp.b;
  x := cp.a;
■


=SML
set_pc"cn1";
set_goal([], get_conjecture"-""vcP_1");
a(REPEAT strip_tac);
store_mt_results
mt_run
 [("r24.1.1", fun_true o pop_thm , (), true)];

set_goal([], get_conjecture"-""vcP_2");
a(REPEAT strip_tac);
store_mt_results
mt_run
 [("r24.1.2", fun_true o pop_thm , (), true)];

set_goal([], get_conjecture"-""vc_1_1");
a(REPEAT strip_tac THEN asm_rewrite_tac[z_get_specⓩCP⌝]);
store_mt_results
mt_run
 [("r24.1.3", fun_true o pop_thm , (), true)];
=TEX
\subsection{R0078: Translation of Ada Constant Declarations} \label{RTwentyFive}
=SML
clean_up();
new_script{name = "P", unit_type="proc"};
ⓈCN
procedure p
is
  type colour is (r, g, b);
  x : constant colour := b;
begin
  null;
end p;
■
=SML
set_goal([], ⓩX ∈ COLOUR ∧ X = 2⌝);
a(rewrite_tac[z_get_specⓩX⌝, z_get_specⓩB⌝]);
store_mt_results
mt_run
 [("r25.1.1", fun_true o pop_thm , (), true)];
=TEX
Check that the new form doesn't interfere with static evaluation:
=SML
clean_up();
new_script{name = "P", unit_type="proc"};
ⓈCN
procedure p
is
  c : constant integer := 100;
  type t is range 1 .. c;
begin
  null;
end p;
■
=SML
store_mt_results
mt_run
 [("r25.2.1", length o get_conjectures , "-", 0)];


=TEX
\subsection{R0079: Assertions}\label{RTwentySix}
=SML
clean_up();
new_script{name = "P", unit_type="proc"};
ⓈCN
procedure p
Δ [ true ]
is
 x : integer;
begin
 x := 2;
 Γ{X ≠ 0}
end p;
■
=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"-""vcP_1");
a(REPEAT strip_tac);
store_mt_results
(mt_runf (op =$))
 [("r26.1.1", concl o pop_thm , (), ⓩtrue ⇒ 2 ≠ 0⌝)];
=TEX
=SML
clean_up();
new_script{name = "P", unit_type="proc"};
ⓈCN
procedure p( y : integer)
is
 x : integer;
begin
Δ X [ Y ≥ 0, true ]
end p;
■
ⓈCN
⊑ x := y + 1;
  Γ{X > 0}
■

=TEX
=SML
set_pc"cn1";
set_goal([], get_conjecture"-""vc_1_1");
a(cn_vc_simp_tac[] THEN PC_T1 "z_lin_arith" prove_tac[]);
store_mt_results
(mt_runf (op =$))
 [("r26.2.1", concl o pop_thm , (), ⓩ∀ Y : INTEGER | Y ≥ 0 ⦁ Y + 1 > 0⌝)];
=TEX
=SML
clean_up();
new_script{name = "P", unit_type="spec"};
ⓈCN
package p
is
 x : integer;
end p;
■
=SML
new_script{name = "P", unit_type="body"};
fun do_it () =
ⓈCN
package body p
is
begin
 x := 1;
 Γ {PoX > 0}
end p;
■
=TEX
=SML
store_mt_results
mt_run_fail
[
	("P'spec.1", do_it, (), gen_fail_msg "do_statement"  507077 [])
];
=TEX
=SML
clean_up();
new_script{name = "P", unit_type="spec"};
ⓈCN
package p
is
 x : integer;
end p;
■
=SML
new_script{name = "P", unit_type="body"};
ⓈCN
package body p
is
begin
Δ PoX[ true ]
end p;
■
ⓈCN
⊑
 x := 1;
 Γ {PoX > 0}
■
=SML
set_pc"cn1";
set_goal([], get_conjecture"-""vc_1_1");
a(REPEAT strip_tac);
store_mt_results
(mt_runf (op =$))
 [("P'spec.2", concl o pop_thm , (), ⓩtrue ⇒ 1 > 0⌝)];
=TEX
\subsection{R0080: Sequence Induction}\label{RTwentySeven}
Tested in the PPZed module tests.
=TEX
\subsection{R0081: Defining Property for {\it real\_to\_integer}}\label{RTwentyEight}
Explicitly tested here.
=SML
clean_up();
new_theory"t";
set_merge_pcs["cn1", "'z_reals"];
set_goal([],
ⓩreal_to_integer ∈ ℝ → ℤ ∧
 (∀x:𝕌⦁  x -⋎R ( 1 /⋎Z 2) ≤⋎R real(real_to_integer x) ≤⋎R x +⋎R (1 /⋎Z 2))⌝);
a(rewrite_tac[z_get_specⓩreal_to_integer⌝] THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(strip_asm_tac(rewrite_rule[](z_∀_elim ⓩx⌝ (∧_right_elim (z_get_specⓩreal_to_integer⌝)))));
a(PC_T1 "z_ℝ_lin_arith" asm_prove_tac[]);
(* *** Goal "2" *** *)
a(strip_asm_tac(rewrite_rule[](z_∀_elim ⓩx⌝ (∧_right_elim (z_get_specⓩreal_to_integer⌝)))));
a(PC_T1 "z_ℝ_lin_arith" asm_prove_tac[]);
store_mt_results
mt_run
 [("r28.1.1", fun_true o pop_thm , (), true)];
=TEX
\subsection{R0068: Poly/ML problems and other bug-fixing} \label{RTwentyNine}
=TEX
\subsubsection{pp2.5.4-bug1/R0042}
There are specific tests for the detailed changes to the treatment of aliases in {\ProductHOL}
in the relevant HOL module tests.
We give an explicit test here for the problem as reported by QinetiQ.
=SML
clean_up();
new_theory"t";
val b1_thm = (hd o rev o strip_∧_rule o z_get_spec)ⓩ(abs⋎R _)⌝;
=SML
store_mt_results
mt_run
 [("bugs.1.1", (PrettyPrinter.format_term true o concl), b1_thm,
	["ⓩ∀ x : ℝ ⦁ abs⋎R x = ⌜Abs x⌝⌝"])];
=TEX
\subsubsection{pp2.5.4-bug2}
Explicitly tested here:
=SML
clean_up();
new_script{name = "PACK", unit_type="spec"};
ⓈCN
package Pack is
  type Rec is record A, B : Integer; end record;
  procedure P (X : in out Integer);
  procedure Q (X : in out Rec);
end Pack;
■
=SML
new_script{name = "PACK", unit_type="body"};
ⓈCN
package body Pack is
  procedure P (X : in out Integer)
  Δ X [ X = 22 ]
  is separate;
  procedure Q (X : in out Rec)
  is separate;
end Pack;
■
=SML
new_script{name = "PACK.P", unit_type="proc"};
ⓈCN
separate (Pack)
procedure P (X : in out Integer)
Δ X [ X = 22 ]
is
begin
  X := 22;
end P;
■
=SML
new_script{name = "PACK.Q", unit_type="proc"};
ⓈCN
separate (Pack)
procedure Q (X : in out Rec)
Δ X [ X.A = 22 ]
is
  V : Integer;
begin
  P(V);
  X.A := V;
end Q;
■
With the bug the last web clause made the tool raise an exception.
=SML
set_pc"cn1";
set_goal([], get_conjecture"-""vcPACKoQ_2");
a(rewrite_tac[z_gen_pred_elim[ⓩ𝕌⌝](z_get_specⓩPACKoRECuA⌝)]);
a(cn_vc_simp_tac[]);
store_mt_results
(mt_runf (op =$))
 [("bug.254.2.1", snd o dest_thm o pop_thm , (), get_conjecture"-""vcPACKoQ_2")];
=TEX
\subsubsection{pp2.5.4-bug4}
Tested in INT511.
\subsubsection{pp2.5.4-bug5}
Tested in INT511.
\subsubsection{pp2.5.4-bug6}
=SML
clean_up();
new_script{name = "TEST", unit_type="proc"};
ⓈCN
procedure Test is
  C1 : constant Float := Float(55);
  C2 : constant Float := Float(55.7);
begin
  null;
end Test;
■
=SML
set_pc"cn1";
set_goal([], ⓩC1 = real 55 ∧ C2 = 55.7⌝);
a(rewrite_tac(map z_get_spec[ⓩC1⌝,ⓩC2⌝, ⓩinteger_to_real⌝]));
store_mt_results
(mt_runf (op =$))
 [("bug.254.6.1", snd o dest_thm o pop_thm , (), ⓩC1 = real 55 ∧ C2 = 55.7⌝)];
=TEX
\subsubsection{pp2.5.4-bug7}
At release 2.5.7 and later this bug becomes irrelevant --- the syntactic restrictions
on return statements have been dropped.
=TEX
\subsubsection{pp2.5.9-bug1}
Explicitly tested here.
=SML
clean_up();
new_script { name = "P", unit_type="spec"};

ⓈCN
package P is
  type T is range 1 .. 10;
  x : T;
  procedure PROC121 (LEFT : in T; RIGHT : in out T)
   Δ PoX [ PoX  = 1] ;
  procedure P121 (LEFT : in T; RIGHT : in out T) renames PROC121;
end P;
■
=SML
new_script { name = "Q", unit_type="proc"};
ⓈCN
with p;
use p;
procedure q
is
 y : p.T;
begin
 Δ PoX, Y[ Y = 1 ]
end q;
■
ⓈCN
  ⊑ p.p121(1, y); y := x;
■
=SML
set_pc"cn1";
set_goal([], get_conjecture"-""vc_1_2");
a(cn_vc_simp_tac[]);
store_mt_results
(mt_runf (op =$))
 [("bug.259.1.1", snd o dest_thm o pop_thm , (), get_conjecture"-""vc_1_2")];
=TEX
\subsubsection{pp2.5.9-bug2}
Explicitly tested here.
=SML
clean_up();
new_script { name = "P", unit_type="spec"};
ⓈCN
package P is
  type T is (A, B, C);
end P;
■
=SML
new_script { name = "R", unit_type="spec"};
ⓈCN
with P;
use P;
package R is
 x : T;
end R;
■
=SML
new_script { name = "S", unit_type="spec"};
ⓈCN
with P;
use P;
package S is
 y : T;
end S;
■
=SML
new_script { name = "V", unit_type="spec"};
ⓈCN
with R;
with S;
package V is
  use R;
  use S;
  procedure mk_a
  Δ RoX, SoY[RoX = SoY = PoA];
end V;
■
=SML
new_script { name = "V", unit_type="body"};
ⓈCN
with R;
with S;
package body V is
  use R;
  use S;
  procedure mk_a
  Δ RoX, SoY[RoX = SoY = PoA]
  is begin x := p.a; y := p.a; end mk_a;
end V;
■
=SML
set_pc"cn1";
set_goal([], get_conjecture"-" "vcV_2");
a(cn_vc_simp_tac[]);
store_mt_results
(mt_runf (op =$))
 [("bug.259.2.1", snd o dest_thm o pop_thm , (), get_conjecture"-""vcV_2")];
=TEX
=SML
clean_up();
new_script { name = "P", unit_type="spec"};
ⓈCN
package P is
  type T is (A, B, C);
end P;
■
=SML
new_script { name = "R", unit_type="spec"};
ⓈCN
with P;
package R is
  use P;
end R;
■
=SML
new_script { name = "S", unit_type="spec"};
ⓈCN
with P;
package S is
  use P;
end S;
■
=SML
new_script { name = "V", unit_type="spec"};
fun doit() =
ⓈCN
with R;
with S;
package V is
  use R;
  use S;
end V;
■
=SML
store_mt_results
mt_run
 [("bug.259.2.2", doit , (), ())];
=TEX
\subsubsection{pp2.5.9-bug3}
Explicitly tested here.
=SML
clean_up();
new_script { name = "A", unit_type="spec"};
ⓈCN
package A is
  type T is record
    I : INTEGER;
  end record;
  V : T;
end A;
■
=SML
new_script { name = "B", unit_type="proc"};
ⓈCN
with A;
procedure B
is
  W : INTEGER;
  procedure P (X : in INTEGER)
    Δ W [ W = X ]
  is begin
   W := X;
  end P;
begin
 Δ W [ W = AoV.I]
end B;
■
=SML
fun b259_3() =
ⓈCN
  ⊑   P (X => A.V.I);      -- fails at 2.5.9 and earlier if procedure B has formal spec
■
=SML
store_mt_results
mt_run
 [("bug.259.3.1", fun_true o b259_3 , (), true)];
set_pc"cn1";
set_goal([], get_conjecture"-""vc_1_2" handle Fail _ => mk_t);
a(cn_vc_simp_tac[]);
store_mt_results
mt_run
 [("bug.259.3.2", fun_true o pop_thm , (), true)];
=TEX
\subsubsection{pp2.5.10-bug0}
Explicitly tested here.
=SML
clean_up();
new_script { name = "A", unit_type="spec"};

ⓈCN
package A is

  type T is record
    I : INTEGER;
  end record;

end A;
■
=SML
new_script { name = "B", unit_type="spec"};

ⓈCN
with A;
package B is

  use A;

  Y0 : constant A.T := T'(I => 543);	-- used to fail
  Y1 : constant T := T'(I => 543);	-- used to fail
  Y2 : constant T := (I => 543);	-- used to fail

end B;
■
=SML
set_pc"cn1";
set_goal([], ⓩBoY0.I = BoY1.I = BoY2.I = 543⌝);
a(cn_vc_simp_tac(map z_get_spec[ⓩBoY0⌝, ⓩBoY1⌝, ⓩBoY2⌝]));
store_mt_results
mt_run
 [("bug.2510.0.1", fun_true o pop_thm , (), true)];
=TEX
\subsubsection{R0046}
\subsubsection{R0075}
\subsection{Test Theorems for Free Variables}
=SML
clean_up();
local
val thys = get_descendants "cn";
fun check_thm (_, th) = (
	case frees (concl th) of
		[] => true
	|	_ => false
);
val bad = flat (map get_thms thys) drop check_thm;
in
val _ = case bad of
	[] => (	diag_line "*** All theorems passed the free variable test ***"
) |	some => (
	let	fun aux (names, thm) = (
			diag_line ("\t" ^ thm_theory thm ^ ": " ^ hd names)
		);
	in
		diag_line "*** The module test generated a warning: some saved theorems had free variables ***";
		diag_line "The following theorems failed the test (theory name: theorem name):";
		map aux bad; ()
	end
);
end;
=TEX
\section{EPILOGUE}
=SML
diag_line(summarize_mt_results());
=TEX
\end{document}

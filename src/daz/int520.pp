=IGN
********************************************************************************
int520.doc: this file is part of the PPDaz system

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

\def\Title{ Autumn 2001 Enhancement Tests }

\def\Abstract{\begin{center}
{\bf Abstract}\par\parbox{0.7\hsize}
{\small This document provides integration tests to support the enhancements developed
under the enhancements programme carried out in late 2001.}
\end{center}}

\def\Reference{LEMMA1/DAZ/INT520}

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
\item[Issues 1.1 (2001/11/07), 1.2 (2001/11/08)] First drafts
\item[Issues 1.3 (2001/11/12)] Live version for V2.5.3.
\item[Issues 1.4 (2001/12/15), 1.5 (2001/12/17)] R0037: support for named numbers.
\item[Issue 1.6 (2001/12/17)] R0034: formal procedures as stubs
\item[Issue 1.6 (2001/12/17)] R0040: scope of formal parameter names
\item[Issues 1.7 (2001/12/18) - 1.10 (2002/01/30)] R0006: Free use of subtype indications and ranges. Module tests complete.
\item[Issue 1.11 (2002/03/22)] R0044: array bounds compatibility not checked
\item[Issue 1.12 (2002/03/26)] Added missing `=SML'.
\item[Issue 1.13 (2002/05/05)] Fixed duplicated test identities.
\item[Issue 1.14 (2002/07/09)] Allowed for new translation of Ada constants (as axiomatic descriptions).
\item[Issue 1.15 (2002/08/08)] Fixed tests for record and array components (which were accidentally
exploiting a bug in the VC generator).
\item[Issue 1.16 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.17 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.18 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.19 (2004/01/19)] The Z universal set is now called 𝕌
\item[Issue 1.20 (2004/07/18)] Updates for reformed environments.
\item[Issue 1.21 (2005/05/28)] Made it reset domain condition control.
\item[Issue 1.22 (2005/07/29)] Rework for enhancement 117.
\item[Issue 1.24 (2006/03/28)] Allowed for automated state management.
\item[Issue 1.26 (2006/04/20)] Ada real literals are now translated into Z floating point literals.
\item[Issue 1.27 (2006/06/01)] accommodated enhancement 139 - 1-theory-per-subprogram.
\item[Issue 1.28 (2006/09/19)] Allowed for enhancement 165.
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
Rob Arthan & Lemma 1\\
Gill Prout & Home \\
Roger Jones & Home
\end{tabular}
\end{center}


\section{INTRODUCTION}\label{INTRODUCTION}
This document is intended to provide integration tests to cover
the enhancements undertaken under the programme
of enhancements carried out in late 2001. See \cite{LEMMA1/DAZ/HLD508}
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
        let     val thys = (get_descendants "cn" less "cn")
                                        diff get_cache_theories();
                fun del_thy thy = (force_delete_theory thy handle Fail _ => ());
        in 	map del_thy thys;
		reset_cn()
        end;	()
);
=TEX
=TEX
For batch use turn off subgoal package output:
=SML
set_flag("subgoal_package_quiet", not(ExtendedIO.is_term_in std_in));
=TEX
\section{THE TESTS}
\subsection{R0003: Record and array components as exported parameters}\label{ROne}

Some test coverage in INT513 (which fully tests the anti-aliasing checks).
The following tests the new functionality.

=SML
clean_up();
new_script{name = "P", unit_type="proc"};
=TEX

ⓈCN
procedure p is
  type index is range 1 .. 4;
  type arr1 is array(index) of integer;
  type rec1 is record arr : arr1; num : integer; end record;
  type arr2 is array(index) of rec1;
  a : integer;
  a1 : arr1;
  r1 : rec1;
  a2 : arr2;
  procedure q (x : out integer)
  Δ X Ξ A [ X = A ] is begin x := a; end q;
begin
   Δ A2 [ (A2 1).NUM = A ] (10)
end p;
■
ⓈCN
 (10) ⊑ q(a2(1).num);
■
=SML
open_theory "PoQ'proc";
set_pc"cn1";
set_goal([], get_conjecture"-""vcPoQ_1");
a(cn_vc_simp_tac[]);
store_mt_results
(mt_runf (op =$))
 [("r1.1.1", snd o dest_thm o pop_thm , (), get_conjecture"-""vcPoQ_1")];
=TEX

=SML
open_theory "P'proc";
set_pc"cn1";
set_goal([], get_conjecture"-""vc10_1");
a(cn_vc_simp_tac[]);
store_mt_results
(mt_runf (op =$))
 [("r1.1.2", snd o dest_thm o pop_thm , (), get_conjecture"-""vc10_1")];
=TEX

=SML
set_goal([], get_conjecture"-""vc10_2");
a(cn_vc_simp_tac[]);
a(REPEAT strip_tac THEN asm_rewrite_tac[z_⊕_↦_app_thm]);
a(rewrite_tac[z_gen_pred_elim(dest_z_tupleⓩ(𝕌, 𝕌)⌝) (z_get_specⓩREC1uNUM⌝)]);
store_mt_results
(mt_runf (op =$))
 [("r1.1.3", snd o dest_thm o pop_thm , (), get_conjecture"-""vc10_2")];
=TEX
=SML
clean_up();
new_script{name = "P", unit_type="proc"};
=TEX

ⓈCN
procedure p is
  type index is range 1 .. 4;
  type arr1 is array(index) of integer;
  type rec1 is record arr : arr1; num : integer; end record;
  type arr2 is array(index) of rec1;
  a : integer;
  a1 : arr1;
  r1 : rec1;
  a2 : arr2;
  procedure q (x : in out integer; y : out integer)
  Δ X, Y Ξ A [ X = A ∧ Y = 100] is begin y := 100; x := a; end q;
begin
   Δ A2, R1 [ (A2 1).NUM = A ∧ R1.NUM = 100] (10)
end p;
■
ⓈCN
 (10) ⊑ q(a2(1).num, r1.num);
■
=SML
open_theory "PoQ'proc";
set_pc"cn1";
set_goal([], get_conjecture"-""vcPoQ_1");
a(cn_vc_simp_tac[]);
store_mt_results
(mt_runf (op =$))
 [("r1.2.1", snd o dest_thm o pop_thm , (), get_conjecture"-""vcPoQ_1")];
=TEX

=SML
open_theory "P'proc";
set_pc"cn1";
set_goal([], get_conjecture"-""vc10_1");
a(cn_vc_simp_tac[]);
store_mt_results
(mt_runf (op =$))
 [("r1.2.2", snd o dest_thm o pop_thm , (), get_conjecture"-""vc10_1")];
=TEX

=SML
set_goal([], get_conjecture"-""vc10_2");
a(cn_vc_simp_tac[]);
a(REPEAT strip_tac THEN asm_rewrite_tac[z_⊕_↦_app_thm]);
(* *** Goal "1" *** *)
a(rewrite_tac[z_gen_pred_elim(dest_z_tupleⓩ(𝕌, 𝕌)⌝) (z_get_specⓩREC1uNUM⌝)]);
(* *** Goal "2" *** *)
a(rewrite_tac[z_gen_pred_elim(dest_z_tupleⓩ(𝕌, 𝕌)⌝) (z_get_specⓩREC1uNUM⌝)]);
store_mt_results
(mt_runf (op =$))
 [("r1.3", snd o dest_thm o pop_thm , (), get_conjecture"-""vc10_2")];
=TEX
\subsection {R0006: Free use of subtype indications and ranges}\label{RThree}
Tests new usages. Tests in INT519 cover ranges and subtypes in loop iteration control except for new syntax.
=SML
clean_up();
fun conjecture_∀_quant_decs (name, inds) =
  let val(decl, _, _) = dest_z_∀(get_conjecture "-" name)
  in
     foldl (fn(n,sofar) =>
              let val (nmlst, typ) = (dest_z_dec o nth n o dest_z_decl) decl
              in
                 sofar @ [(hd nmlst,typ)]
              end
            )
     [] inds
  end;

fun term_pair_list_eq ([],[]) = true
|   term_pair_list_eq ((a,x)::aa, (b,y)::bb) =
     (op =$)(a,b) andalso (op =$)(x,y) andalso term_pair_list_eq (aa,bb)
|   term_pair_list_eq _ = false;

fun term_list_eq ([],[]) = true
|   term_list_eq (a::aa, b::bb) =
     (op =$)(a,b) andalso term_list_eq (aa,bb)
|   term_list_eq _ = false;

fun term_to_range_first  term =
(( nth 0 o dest_z_tuple o  snd o dest_z_app o  snd o  dest_eq o snd o dest_thm o z_get_spec) term);

fun term_list_to_range_first_list tl = map term_to_range_first tl;

=TEX
=SML
fun types_state1() = (
	clean_up();
	new_script{name="R3_TYPES_ETC", unit_type="spec"};
ⓈCN
package r3_types_etc is
  type small_nat is range 0  .. 9_999;
  type index is range 1 .. 4;
  type colour is (RED, BLUE, GREEN);
  type float_no_range is digits 6;
  type fix is delta 0.1 range 1.0 .. 10.9;
  type uncon_arr_1d is array(colour range <>) of small_nat;
  type uncon_arr_2d is array(colour range <>, index range <>) of index;
  type con_arr_1d is array(colour range RED .. BLUE) of small_nat;
  type con_arr_2d is array(colour range RED .. BLUE, index range 2 .. 3 ) of index;
  a_con_arr_1d, another_con_arr_1d : con_arr_1d;
  a_con_arr_2d, another_con_arr_2d : con_arr_2d;
end r3_types_etc;
■
=SML
	()
);

=SML
val _ = types_state1();

store_mt_results
(mt_runf (op =$))
 [("r3.types.1", snd o dest_thm o z_get_spec , ⓩR3_TYPES_ETCoCON_ARR_2DvRANGEv2⌝,
                 ⓩR3_TYPES_ETCoCON_ARR_2DvRANGEv2 = R3_TYPES_ETCoINDEXs1⌝)];
=TEX
=SML
val _ = types_state1();
new_script{name="PSR", unit_type="proc"};


ⓈCN
with r3_types_etc;
procedure psr(i : in r3_types_etc.small_nat; result : out r3_types_etc.small_nat)
Δ RESULT [RESULT * RESULT > I ∨ RESULT = 100]
is
begin
   result := 100;
   for k in  reverse 1 .. 99 loop
      Δ  RESULT [ RESULT = 100 ∨ RESULT * RESULT > I]            (1)
   end loop;
end psr;
■

ⓈCN
     (1) ⊑ if k * k > i then result := k; end if;
■
=SML
store_mt_results
(mt_runf (op =$))
 [("PSR'proc", get_conjecture "-" ,  "vc1_2",
   ⓩ∀ I, RESULT : R3_TYPES_ETCoSMALL_NAT; K : universal_discrete
     | true ∧ K * K greater I = FALSE
     ⦁ RESULT = 100 ∨ RESULT * RESULT > I⌝)];
=SML
val _ = types_state1();
new_script{name="PNR", unit_type="proc"};

ⓈCN
with r3_types_etc;
procedure pnr(i,klo,khi : in r3_types_etc.small_nat; result : out r3_types_etc.small_nat)
Δ RESULT [RESULT * RESULT > I ∨ RESULT = 100]
is
begin
   for k in  reverse klo .. khi loop
      Δ  RESULT [ RESULT = 100 ∨ RESULT * RESULT > I]            (2)
   end loop;
end pnr;
■

ⓈCN
     (2) ⊑ if k * k > i then result := k; else result:= 100; end if;
■
=SML
store_mt_results
(mt_runf (op =$))
 [("PNR'proc", get_conjecture "-" ,  "vc2_2",
     ⓩ∀ I : R3_TYPES_ETCoSMALL_NAT; K : universal_discrete
     | true ∧ K * K greater I = FALSE
     ⦁ 100 = 100 ∨ 100 * 100 > I⌝)];
=SML
val _ = types_state1();
new_script{name="PS", unit_type="proc"};

ⓈCN
with r3_types_etc;
procedure ps(i : in r3_types_etc.small_nat; result : out r3_types_etc.small_nat)
Δ RESULT [RESULT * RESULT < I ∨ RESULT = 0]
is
begin
   result := 0;
   for k in   1 .. 99 loop
      Δ  RESULT [ RESULT = 0 ∨ RESULT * RESULT < I]            (3)
   end loop;
end ps;
■

ⓈCN
     (3) ⊑ if k * k <  i then result := k; end if;
■
=SML
store_mt_results
(mt_runf (op =$))
 [("PS'proc", get_conjecture "-" ,  "vc3_2",
       ⓩ∀ I, RESULT : R3_TYPES_ETCoSMALL_NAT; K : universal_discrete
     | true ∧ K * K less I = FALSE
     ⦁ RESULT = 0 ∨ RESULT * RESULT < I⌝)];
=SML
val _ = types_state1();
new_script{name="PN", unit_type="proc"};

ⓈCN
with r3_types_etc;
procedure pn(i,klo,khi : in r3_types_etc.small_nat; result : out r3_types_etc.small_nat)
Δ RESULT [RESULT * RESULT < I ∨ RESULT = 0]
is
begin
   for k in   klo .. khi loop
      Δ  RESULT [ RESULT = 0 ∨ RESULT * RESULT < I]            (4)
   end loop;
end pn;
■

ⓈCN
     (4) ⊑ if k * k <  i then result := k; else result := 100; end if;
■

=SML
store_mt_results
(mt_runf (op =$))
 [("PN'proc", get_conjecture "-" ,  "vc4_2",
         ⓩ∀ I : R3_TYPES_ETCoSMALL_NAT; K : universal_discrete
     | true ∧ K * K less I = FALSE
     ⦁ 100 = 0 ∨ 100 * 100 < I⌝)];
=SML
val _ = types_state1();
new_script{name="QSR", unit_type="proc"};

ⓈCN
with r3_types_etc;
procedure qsr(i : in r3_types_etc.colour; result : out r3_types_etc.colour)
Δ RESULT [RESULT = I ∨ RESULT = R3_TYPES_ETCoGREEN ]
is
begin
   result := r3_types_etc.GREEN;
    for k in  reverse r3_types_etc.RED .. r3_types_etc.BLUE loop
      Δ  RESULT [RESULT = R3_TYPES_ETCoGREEN ∨ RESULT = I]            (5)
   end loop;
end qsr;
■

ⓈCN
     (5) ⊑ if k =  i then result := k; end if;
■
=SML
store_mt_results
(mt_runf (op =$))
 [("QSR'proc", get_conjecture "-" ,  "vc5_2",
           ⓩ∀ I, RESULT : R3_TYPES_ETCoCOLOUR; K : universal_discrete
     | true ∧ K eq I = FALSE
     ⦁ RESULT = R3_TYPES_ETCoGREEN ∨ RESULT = I⌝)];
=SML
val _ = types_state1();
new_script{name="QS", unit_type="proc"};

ⓈCN
with r3_types_etc;
procedure qs(i : in r3_types_etc.colour; result : out r3_types_etc.colour)
Δ RESULT [RESULT = I ∨ RESULT = R3_TYPES_ETCoGREEN ]
is
begin
   result := r3_types_etc.GREEN;
   for k in  r3_types_etc.RED .. r3_types_etc.BLUE loop
      Δ  RESULT [ RESULT = R3_TYPES_ETCoGREEN ∨ RESULT = I]            (6)
   end loop;
end qs;
■

ⓈCN
     (6) ⊑ if k =  i then result := k; end if;
■

=SML
store_mt_results
(mt_runf (op =$))
 [("QS'proc", get_conjecture "-" ,  "vc6_2",
             ⓩ∀ I, RESULT : R3_TYPES_ETCoCOLOUR; K : universal_discrete
     | true ∧ K eq I = FALSE
     ⦁ RESULT = R3_TYPES_ETCoGREEN ∨ RESULT = I⌝)];
=SML
val _ = types_state1();
new_script{name="QNR", unit_type="proc"};

ⓈCN
with r3_types_etc;
procedure qnr(i,klo,khi : in r3_types_etc.colour; result : out r3_types_etc.colour)
Δ RESULT [RESULT = I ∨ RESULT = R3_TYPES_ETCoGREEN ]
is
begin
   for k in  reverse klo .. khi loop
      Δ  RESULT [ RESULT = R3_TYPES_ETCoGREEN ∨ RESULT = I]            (7)
   end loop;
end qnr;
■

ⓈCN
     (7) ⊑ if k =  i then result := k; end if;
■

=SML
store_mt_results
(mt_runf (op =$))
 [("QNR'proc", get_conjecture "-" ,  "vc7_2",
                ⓩ∀ I, RESULT : R3_TYPES_ETCoCOLOUR; K : universal_discrete
     | true ∧ K eq I = FALSE
     ⦁ RESULT = R3_TYPES_ETCoGREEN ∨ RESULT = I⌝)];
=SML
val _ = types_state1();
new_script{name="QN", unit_type="proc"};

ⓈCN
with r3_types_etc;
procedure qn(i, klo, khi : in r3_types_etc.colour; result : out r3_types_etc.colour)
Δ RESULT [RESULT = I ∨ RESULT = R3_TYPES_ETCoGREEN ]
is
begin
   for k in  klo .. khi loop
      Δ  RESULT [ RESULT = R3_TYPES_ETCoGREEN ∨ RESULT = I]            (8)
   end loop;
end qn;
■

ⓈCN
     (8) ⊑ if k =  i then result := k; else result := r3_types_etc.GREEN; end if;
■
=SML
store_mt_results
(mt_runf (op =$))
 [("QN'proc", get_conjecture "-" ,  "vc8_2",
                ⓩ∀ I : R3_TYPES_ETCoCOLOUR; K : universal_discrete
     | true ∧ K eq I = FALSE
     ⦁ R3_TYPES_ETCoGREEN = R3_TYPES_ETCoGREEN ∨ R3_TYPES_ETCoGREEN = I⌝)];
=TEX
\subsubsection{Overview of tests for declarations with subtype indications}

 Declarations of objects using subtype indication using each constraint kind (integer range, non-integer discrete range,
    floating digits and range constraints, fixed delta and range constraints, array index constraints defined by subtype indications, integer and non-integer discrete ranges including
  range attributes of 1-D and multi-dimensional array types and objects.

Use of subtype indications, explicit ranges and range attributes of 1-D and multi-dimensional arrays  in index positions in constrained array definitions, within type definitions and object definitions.

\subsubsection{Non-Array Object Declarations With Subtype Indications}

These examples exercise handling of subtype indications in object declarations
and also use object and type ranges  in these positions.

=SML

val _ = types_state1();
new_script{name="OBJDECLS_A", unit_type="proc"};
ⓈCN
│ with r3_types_etc;
│ procedure objdecls_a( ri : out r3_types_etc.small_nat; rc, rca : out r3_types_etc.colour;
│            rf : out r3_types_etc.float_no_range; rx : out r3_types_etc.fix )
│ Δ RI,RC,RCA,RF,RX  [RI = 10 ∧ RC = R3_TYPES_ETCoRED  ∧ RCA = R3_TYPES_ETCoRED  ∧
│      RF = 9.9  ∧ (RX = 9.9) ]
│ is
│   ten_or_eleven, another_ten_or_eleven : r3_types_etc.small_nat range 10 ..11 := 10;
│   red_only : r3_types_etc.colour range r3_types_etc.RED .. r3_types_etc.RED :=
│                                                         r3_types_etc.RED;
│   red_blue : r3_types_etc.colour range r3_types_etc.a_con_arr_1d'RANGE := r3_types_etc.RED;
│   neufcommaneuf : r3_types_etc.float_no_range digits 4 range 0.0E0 .. 100.0E0 := 9.9E0;
│   ninepointnine : r3_types_etc.fix delta 0.4 range 2.0 .. 10.5 := 9.9;
│ begin
│     ri := ten_or_eleven;
│     rc := red_only;
│     rca:= red_blue;
│     rf := neufcommaneuf;
│     rx := ninepointnine;
│ end objdecls_a;
■
=SML
set_pc "cn1";
set_goal([], get_conjecture"-""vcOBJDECLS_A_1");
a(cn_vc_simp_tac[] THEN REPEAT strip_tac);
store_mt_results
(mt_runf (op =$))
 [("OBJDECLS_A'proc", snd o dest_thm o pop_thm , (), get_conjecture"-""vcOBJDECLS_A_1")];


=TEX
\subsubsection{Array Object Declarations with Subtype Indications}

=SML
val _ = types_state1();
new_script{name="OBJDECLS_B", unit_type="proc"};
ⓈCN
│ with r3_types_etc;
│ procedure objdecls_b( ra_green : out r3_types_etc.small_nat ;
│                       rb_green_3 : out r3_types_etc.small_nat )
│ Δ RA_GREEN, RB_GREEN_3 [RA_GREEN = 10 ∧ RB_GREEN_3 = 20 ]
│ is
│    subtype bga is r3_types_etc.uncon_arr_1d
│                                (r3_types_etc.BLUE ..  r3_types_etc.GREEN);
│    blue_green_array : r3_types_etc.uncon_arr_1d
│                                (r3_types_etc.BLUE ..  r3_types_etc.GREEN)
│                          := bga'( 8, 10 );
│    subtype bg23a is r3_types_etc.uncon_arr_2d
│        (r3_types_etc.BLUE ..  r3_types_etc.GREEN, r3_types_etc.index range 2 .. 3);
│    blue_green_23_array : r3_types_etc.uncon_arr_2d
│           ( r3_types_etc.colour range r3_types_etc.BLUE ..  r3_types_etc.GREEN,
│             (index'(2)) .. (index'(3))
│            )
│                          := bg23a'( (8, 10), (16, 20));
│    another_bg23_array : r3_types_etc.uncon_arr_2d
│           ( r3_types_etc.colour range r3_types_etc.BLUE ..  r3_types_etc.GREEN,
│             r3_types_etc.con_arr_2d'RANGE(2)
│            )
│                          := bg23a'( (8, 10), (16, 20));
│ begin
│     ra_green := blue_green_array(r3_types_etc.GREEN);
│     rb_green_3 := blue_green_23_array(r3_types_etc.GREEN, 3);
│ end objdecls_b;
■
store_mt_results
(mt_runf term_pair_list_eq)
 [("OBJDECLS_B'proc", conjecture_∀_quant_decs , ("vcOBJDECLS_B_1",[1,2]),
   [(ⓩBLUE_GREEN_23_ARRAY⦂R3_TYPES_ETCoUNCON_ARR_2Ds1⌝,ⓩR3_TYPES_ETCoUNCON_ARR_2Ds1⌝),
    (ⓩBLUE_GREEN_ARRAY⦂R3_TYPES_ETCoUNCON_ARR_1Ds1⌝,ⓩR3_TYPES_ETCoUNCON_ARR_1Ds1⌝) ])];
=TEX
\subsubsection{Type Indications with Internal Subtype Indications }

The main case is for arrays with subtype indications in the subscript and
component positions - records are handled in the next test.

=SML
val _ = types_state1();
new_script{name="TYPEDECLS_B", unit_type="proc"};
ⓈCN
│ with r3_types_etc;
│ procedure typedecls_b ( result : out r3_types_etc.small_nat )
│ Δ RESULT [ RESULT = 10 ]
│ is
│    subtype my_index is r3_types_etc.small_nat range r3_types_etc.a_con_arr_2d'RANGE(2);
│    subtype my_colour is r3_types_etc.colour range r3_types_etc.BLUE .. r3_types_etc.GREEN;
│    subtype my_float is float_no_range digits 3 range 0.1E0 .. 0.10000001E0;
│    subtype my_fix is fix delta 0.5 range 0.0 .. 87.5;
│
│    type  bga is array (r3_types_etc.BLUE ..  r3_types_etc.GREEN) of r3_types_etc.small_nat;
│    type bg23a is  array  (r3_types_etc.BLUE ..  r3_types_etc.GREEN,
│                                r3_types_etc.index range 2 .. 3) of
│                          r3_types_etc.small_nat range 1 .. 24;
│    type another_bg23a is array
│           ( r3_types_etc.colour range r3_types_etc.BLUE ..  r3_types_etc.GREEN,
│             r3_types_etc.con_arr_2d'RANGE(2)
│            ) of r3_types_etc.small_nat;
│ begin
│    result := 10;
│ end typedecls_b;
■

store_mt_results
(mt_runf term_list_eq)
 [("TYPEDECLS_B'proc", term_list_to_range_first_list ,
   [ⓩMY_INDEX⌝,ⓩMY_COLOUR⌝,ⓩuniversal_discretes3⌝,ⓩR3_TYPES_ETCoSMALL_NATs1⌝],

    [ⓩR3_TYPES_ETCoCON_ARR_2DvFIRSTv2⦂ R3_TYPES_ETCoINDEX⌝,
     ⓩR3_TYPES_ETCoBLUE⦂ R3_TYPES_ETCoCOLOUR⌝,
     ⓩR3_TYPES_ETCoCON_ARR_2DvFIRSTv2⦂ R3_TYPES_ETCoINDEX⌝,
     ⓩ1⦂R3_TYPES_ETCoSMALL_NAT⌝
    ])
  ];

=TEX
\subsubsection{Subtype indications as components in records}

Including some which have nested subtype indications.

=SML
val _ = types_state1();
new_script{name="RECORDS_A", unit_type="proc"};
ⓈCN
│ with r3_types_etc;
│ procedure records_a ( result : out r3_types_etc.small_nat )
│ Δ RESULT [ RESULT = 10 ]
│ is
│   type recreation is
│      record  talk, read : r3_types_etc.small_nat range 1 .. 2;
│              paint : r3_types_etc.colour range
│                          r3_types_etc.BLUE .. r3_types_etc.GREEN;
│              swim : r3_types_etc.float_no_range range 1.0 .. 1000.0;
│              diy : r3_types_etc.fix delta 0.3 range -3.0 .. 10.0;
│              line_dance : r3_types_etc.uncon_arr_1d
│                          (r3_types_etc.BLUE .. r3_types_etc.GREEN);
│              square_dance, barn_dance : r3_types_etc. uncon_arr_2d
│                 (r3_types_etc.colour range r3_types_etc.BLUE .. r3_types_etc.GREEN,
│                  r3_types_etc.index range  2 .. 3);
│      end record;
│      what_i_did_in_my_summer_hols : recreation;
│
│ begin
│    result := 10;
│ end records_a;
■
=SML
store_mt_results
(mt_runf term_list_eq)
 [("RECORDS_A'proc", term_list_to_range_first_list ,
   [
     ⓩR3_TYPES_ETCoINDEXs2⌝, ⓩR3_TYPES_ETCoCOLOURs4⌝, ⓩuniversal_discretes1⌝,
     ⓩR3_TYPES_ETCoFIXs1⌝, ⓩR3_TYPES_ETCoFLOAT_NO_RANGEs1⌝, ⓩR3_TYPES_ETCoSMALL_NATs1⌝
   ],

    [ⓩ2⦂R3_TYPES_ETCoINDEX⌝, ⓩR3_TYPES_ETCoBLUE⦂R3_TYPES_ETCoCOLOUR⌝,
     ⓩR3_TYPES_ETCoBLUE⦂ R3_TYPES_ETCoCOLOUR⌝,
     ⓩ (~⋎R 3.0) ⦂ R3_TYPES_ETCoFIX⌝,
     ⓩ(1.0) ⦂ R3_TYPES_ETCoFLOAT_NO_RANGE⌝,
     ⓩ1 ⦂ R3_TYPES_ETCoSMALL_NAT⌝
    ])
  ];


=TEX
\subsection {R0021: domain condition generation}\label{RTwo}
Tested explicitly here.
=SML
fun types_state2() = (
	clean_up();
	new_script{name="TYPES", unit_type="spec"};
ⓈCN
package types is
  type small_nat is range 0 .. 9_999;
  type interval is digits 4 range -1.0 .. +1.0;
  type index is range 1 .. 4;
  type colour is (RED, BLUE, GREEN);
  type arr is array(colour) of small_nat;
end types;
■
=SML
	()
);
=SML
val _ = types_state2();
new_script{name="P", unit_type="proc"};
val old_dcs = set_int_control("cn_domain_conds", cn_standard_domain_conds);

ⓈCN
with types;
procedure p(i : in types.small_nat; result : out types.small_nat)
Δ RESULT [RESULT = 99 + I]
is
  x : types.small_nat;
  c : constant types.small_nat := 10;
begin
  if    i > 0 and then c mod i = 0
  then  x := c mod i;
  else  x := i;
  end if;
  x := x + 1;
  x := 99 / x;
  x := x rem x;
  result := x + 99 + i;
end p;
■

=SML
set_goal([], get_conjecture"-""vcP_1");
a(cn_vc_simp_tac[] THEN REPEAT strip_tac);
a(asm_rewrite_tac[]);
store_mt_results
(mt_runf (op =$))
 [("r2.a.1", snd o dest_thm o pop_thm , (), get_conjecture"-""vcP_1")];
=TEX
=SML
set_goal([ⓩ∀x:𝕌 | ¬x = 0 ⦁ x rem x = 0⌝], get_conjecture"-""vcP_2");
a(cn_vc_simp_tac[z_get_specⓩTYPESoSMALL_NAT⌝] THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(DROP_ASM_T ⓩ¬I+1=0⌝ discard_tac THEN LEMMA_T ⓩI = 0⌝ rewrite_thm_tac
	THEN PC_T1 "z_lin_arith" asm_prove_tac[]);
(* *** Goal "2" *** *)
a(DROP_ASM_T ⓩ¬I+1=0⌝ discard_tac THEN LEMMA_T ⓩI = 0⌝ rewrite_thm_tac
	THEN PC_T1 "z_lin_arith" asm_prove_tac[]);
(* *** Goal "3" *** *)
a(DROP_ASM_T ⓩ¬I+1=0⌝ discard_tac THEN LEMMA_T ⓩI = 0⌝ rewrite_thm_tac
	THEN PC_T1 "z_lin_arith" asm_prove_tac[]);
(* *** Goal "4" *** *)
a(ALL_ASM_FC_T rewrite_tac[]);
store_mt_results
(mt_runf (op =$))
 [("r2.a.2", snd o dest_thm o pop_thm , (), get_conjecture"-""vcP_2")];
=TEX
=SML
val _ = types_state2();
new_script{name="P", unit_type="proc"};
set_int_control("cn_domain_conds", cn_all_domain_conds);

ⓈCN
with types;
procedure p(i : in types.small_nat)
Δ [¬I < 0]
is
  x : types.interval := 0.0;
begin
 x := x ** i;
end p;
■

=SML
set_goal([], get_conjecture"-""vcP_1");
a(cn_vc_simp_tac[] THEN REPEAT strip_tac);
store_mt_results
(mt_runf (op =$))
 [("r2.b.1", snd o dest_thm o pop_thm , (), get_conjecture"-""vcP_1")];
=TEX
=SML
val _ = types_state2();
new_script{name="P", unit_type="proc"};
set_int_control("cn_domain_conds", cn_standard_domain_conds);

ⓈCN
with types;
procedure p(i, j : in types.colour;  a : in types.arr)
Δ [I ∈ dom TYPESoCOLOURvSUCC ∧ J ∈ dom A]
is
  x : boolean;
begin
  x := a(j) = 0 and types.colour'succ(i) > 0;
end p;
■

=SML
set_goal([], get_conjecture"-""vcP_1");
a(cn_vc_simp_tac[] THEN REPEAT strip_tac);
store_mt_results
(mt_runf (op =$))
 [("r2.c.1", snd o dest_thm o pop_thm , (), get_conjecture"-""vcP_1")];
=TEX
=SML
val _ = set_int_control("cn_domain_conds", old_dcs);
=TEX
\subsection {R0034: Formal procedures as stubs}\label{RTwelve}
Regression tests {\it passim}. New feature tested explicitly here.
=SML
clean_up();
new_script{name="TEST", unit_type="spec"};
=TEX

ⓈCN
package TEST is
  procedure R;
  procedure P;
end TEST;
■

=SML
new_script { name = "TEST", unit_type="body"};
=TEX

ⓈCN
package body TEST is
  x : Integer;
  ⟨ R ⟩	(0)
  ⟨ P ⟩	(1)
end TEST;
■

ⓈCN
 (0) ≡
  procedure R
    Δ X [ X = X⋎0 - 7 ]
  is separate;
■

ⓈCN
 (1) ≡
  procedure P
    Δ X [ X = X⋎0 + 1 ]
  is separate;
■

=SML
new_script { name = "TEST.R", unit_type="proc"};
=TEX

ⓈCN
separate(TEST)
procedure R
  Δ X [ X = X⋎0 - 7 ]
is
begin
  x := x - 7;
end R;
■

=SML
new_script { name = "TEST.P", unit_type="proc"};
=TEX

ⓈCN
separate(TEST)
procedure P
  Δ X [ X = X⋎0 + 1 ]
is
begin
  R;
  x := x + 8;
end P;
■
=SML
fun check_r12_proof cnj = (
	set_goal([], get_conjecture"-" cnj);
	a(cn_vc_simp_tac[] THEN REPEAT strip_tac THEN asm_rewrite_tac[]
		THEN PC_T1 "z_lin_arith" asm_prove_tac[]);
	store_mt_results
	(mt_runf (op =$))
	 [("r12." ^ cnj , snd o dest_thm o pop_thm , (), get_conjecture"-" cnj)]
);
open_theory"TESToR'proc";
val vcs_subunit_r = map (hd o fst) (get_conjectures"-");
val _ = map check_r12_proof vcs_subunit_r;
open_theory"TESToP'proc";
val vcs_subunit_p = map (hd o fst) (get_conjectures"-");
val _ = map check_r12_proof vcs_subunit_p;
=TEX
\subsection {R0044: array bounds compatibility not checked}\label{RFour}
Tested explicitly here:
=SML
clean_up();
new_script {name = "SLIDING_ISSUE", unit_type="proc"};
ⓈCN
procedure sliding_issue
is
    type array_ab is array(integer range <>) of character;
    subtype index_a is integer range 1 .. 3;
    subtype index_b is integer range 2 .. 4;
    subtype array_a is array_ab(index_a);
    subtype array_b is array_ab(index_b);
    x_a : array_a := array_a'('1', '2', '3');
    x_b : array_b := array_b'('2', '3', '4');
begin
 Δ X_B [ X_B 2 = X_A 2] (10)
end sliding_issue;
■
ⓈCN
 (10) ⊑ x_b := x_a;
■
=SML
set_goal([ⓩ∀ X_A : ARRAY_A ⦁ slide (X_A, INDEX_B) 2 = X_A 2⌝],
	get_conjecture"-" "vc10_1");
a(POP_ASM_T accept_tac);
store_mt_results
(mt_runf (op =$))
 [("r4.1.1", snd o dest_thm o pop_thm , (), get_conjecture"-""vc10_1")];
=TEX
=SML
clean_up();
new_script {name = "STRING_ISSUE", unit_type="proc"};
ⓈCN
procedure string_issue
is
    subtype index is integer range 2 .. 4;
    type uac is array(positive range <>) of character;
    subtype triglyph is uac(index);
    xyz : constant triglyph := "XYZ";
    x : character;
begin
 Δ X [ X = char_lit "Y"] (10)
end string_issue;
■
=SML
set_goal([], ⓩXYZ ∈ TRIGLYPH ∧ XYZ = slide (string_lit "XYZ", INDEX)⌝);
a(accept_tac(z_get_specⓩXYZ⌝));
store_mt_results
(mt_runf (op =$))
 [("r4.1.2", snd o dest_thm o pop_thm , (), ⓩXYZ ∈ TRIGLYPH ∧ XYZ = slide (string_lit "XYZ", INDEX)⌝)];
=TEX
=SML
clean_up();
new_script {name = "AGG_ISSUE", unit_type="proc"};
ⓈCN
procedure agg_issue
is
    subtype index is integer range 2 .. 4;
    type uac is array(positive range <>) of character;
    subtype trig1 is uac(index);
    type arr_trig1s is array(1 .. 3) of trig1;
    xyz1 : constant arr_trig1s := arr_trig1s'(1 => "ABC", others => "XYZ");
    type rec_trig1s is record a : trig1; b : trig1; end record;
    ab1 : constant rec_trig1s := rec_trig1s'(a => "ABC", b => "DEF");
    type trig2 is array(index) of character;
    type arr_trig2s is array(1 .. 3) of trig2;
    xyz2 : constant arr_trig2s := arr_trig2s'(1 => "ABC", others => "XYZ");
    type rec_trig2s is record a : trig2; b : trig2; end record;
    ab2 : constant rec_trig2s := rec_trig2s'(a => "ABC", b => "DEF");
begin
 null;
end agg_issue;
■
print_z_document"-";

=SML
store_mt_results
(mt_runf (fn (strs, str:string) => str mem strs))
 [("r4.2.1", map fst o term_consts o concl o z_get_spec , ⓩAB1⌝, "z'slide"),
 ("r4.2.2", map fst o term_consts o concl o z_get_spec , ⓩXYZ1⌝, "z'slide")
];
store_mt_results
(mt_runf (fn (strs, str:string) => not (str mem strs)))
 [("r4.2.3", map fst o term_consts o concl o z_get_spec , ⓩAB2⌝, "z'slide"),
 ("r4.2.4", map fst o term_consts o concl o z_get_spec , ⓩXYZ2⌝, "z'slide")
];
=TEX
\subsection{R0037: Support for named numbers}
\label{RThirteen}
The SPARK output functionality is covered in INT511.
We test the Z generation here.
=SML
clean_up();
new_script{name = "P", unit_type="proc"};
=TEX
In addition to the basic functionality,
the following also tests the use of mixed real/integer multiplication
and division for universal expressions as per ALRM section 4.10.
ⓈCN
procedure p is
  c1 : constant := 999;
  c2 : constant := 1.5;
  c3 : constant := 1.5 * 3 + 3 * 1.5;
  c4 : constant := (2.0 * (3.0 * 3.0)) / 2;
  v1 : integer;
  v2 : float;
  v3 : float;
begin
   Δ V1, V2, V3 [ V1 = 1998 ∧ V2 = 3.0 ∧ V3 = 0.0 ∧ V2 *⋎R V2 = C4] (10)
end p;
■
ⓈCN
 (10) ⊑ v1 := (c1 - 997)*c1; v2 := (c2 + 15.0E-1); v3 := c3 - c4;
■
=SML
set_goal([ⓩ∀x:ℤ⦁integer_to_real x = real x⌝], get_conjecture"-""vc10_1");
a(cn_vc_simp_tac(z_float_thm::map z_get_spec[ⓩC1⌝, ⓩC2⌝, ⓩC3⌝, ⓩC4⌝]));
a(asm_rewrite_tac[]);
a(MERGE_PCS_T1 ["'z_reals", "z_library"]prove_tac[]);
store_mt_results
(mt_runf (op =$))
 [("r13.1.1", snd o dest_thm o pop_thm , (), get_conjecture"-""vc10_1")];
=TEX
\subsection{Bug fixes}
\label{REleven}
\subsubsection{R0038: Bug in processing auxiliary variables in global dependency lists}
\label{RElevenOne}
Tested explicitly here:
=SML
clean_up();
new_script {name="AUX_VAR", unit_type="spec"};

ⓈCN
package aux_var is
$auxiliary x : ℤ ;
function f return integer
Ξ x [AUX_VARoF x = x];
end aux_var;
■
With the current (November 2001) treatment of data refinement, we cannot
expect to be able to implement the above package. However, we should
be able to use it:
=SML
new_script {name="READ_X", unit_type="proc"};

ⓈCN
with aux_var;
procedure read_x (result : out integer)
Δ RESULT Ξ x [ RESULT = x ]
is
begin
	result := aux_var.f;
end read_x;
■
=SML
set_goal([], get_conjecture"-""vcREAD_X_1");
a(cn_vc_simp_tac[z_get_specⓩAUX_VARoF⌝]);
store_mt_results
(mt_runf (op =$))
 [("r11.1.1", snd o dest_thm o pop_thm , (), get_conjecture"-""vcREAD_X_1")];
=TEX

\subsubsection{R0040: Scope of formal parameter names}
\label{RElevenTwo}
Tested explicitly here:
=SML
clean_up();
new_script {name="PACK", unit_type="spec"};
ⓈCN
package Pack is
  type Rec is
  record
    A, B : Integer;
  end record;
  procedure S (X : in out Integer);
  procedure T (X : in out Rec);
end Pack;
■
=SML
new_script{name = "PACK", unit_type="body"};
ⓈCN
package body Pack is
  procedure S (X : in out Integer)
  Δ X [ true ]
  is separate;
  procedure T (X : in out Rec)
  is separate;
end Pack;
■
=SML
new_script{name = "PACK.T", unit_type="proc"};
ⓈCN
separate (Pack)
procedure T (X : in out Rec)
Δ X [ true ]
is
  V : Integer;
begin
  V := X.A + X.B;
  S(X => V);
  X.A := V;
  X.B := V;
end T;
■
Just to get here is enough --- the problem was that the above raised
an exception:
=SML
store_mt_results
mt_run
 [("r11.2.1", Combinators.I , (), ())];
=TEX
\section{EPILOGUE}
=SML
diag_line(summarize_mt_results());
=TEX
\end{document}

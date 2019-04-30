=IGN
********************************************************************************
int519.doc: this file is part of the PPDaz system

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

\def\Title{ CTLE II Integration Tests }

\def\Abstract{\begin{center}
{\bf Abstract}\par\parbox{0.7\hsize}
{\small This document provides integration tests to support the enhancements developed
under the second round of Compliance
Tool Language Enhancements (CTLE II). }
\end{center}}

\def\Reference{LEMMA1/DAZ/INT519}

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
{\raggedright
\bibliography{fmu,daz}
}
%%%%% CHANGES HISTORY:
\subsection{Changes History}
\begin{description}
\item[Issues 1.1 (2000/10/31)] First draft.
\item[Issues 1.2 (2000/11/23)] Minor corrections. New tests added.
\item[Issue 1.4 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.5 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.6 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.7 (2004/01/19)] The Z universal set is now called 𝕌
\item[Issue 1.8 (2005/08/16)] Allowed for improvements to Z proof contexts.
\item[Issue 1.9 (2005/09/15)] Improved test for nested packages.
\item[Issue 1.10 (2006/03/23)] Allowed for enhancement 117.
\item[Issue 1.11 (2006/03/28)] Allowed for automated state management.
\item[Issue 1.13 (2006/04/07)] Allowed for insistence on canonical names in Z under enhancement 117
\item[Issue 1.15 (2006/04/20)] Ada real literals are now translated into Z floating point literals.
\item[Issue 1.16 (2006/06/01)] accommodated enhancement 139 - 1-theory-per-subprogram.
\item[Issue 1.17 (2006/07/07)] Made tests compatible with current treatment of nested packages.
\item[Issue 1.18 (2006/09/19)] Allowed for enhancement 165.
\item[Issue 1.19 (2008/02/10)] Allowed for change to lexical rules for underscores in Z.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

%%%% END OF CHANGES HISTORY %%%%
\end{description}

%%%%%  CHANGES FORECAST:

\subsection{Changes Forecast}

This is an interim draft and will be completed later.
See section~\ref{INTRODUCTION}.

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
the enhancements undertaken under the second round of Compliance
Tool Language Enhancements (CTLE II). See \cite{LEMMA1/DAZ/HLD507}
for the detailed specification of the enhancements.

The interim release of the Compliance Tool under CTLE II has been
fully regression-tested and the new features have been module-
and integration-tested to a certain extent. This document records
what has been done and provides specific integration tests to
complete the interim coverage. The material here will be grown into
a full integration test set for the new features during the second
phase of the CTLE II project.

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
\section{SPARK 83 FEATURES}
\subsection{Fixed and Floating Point Types}\label{ROneOne}

Interim test coverage in MDT508, INT509 and MDT517. The following supplements the test for Real Types in INT509.

=SML
clean_up();
new_script{name = "P", unit_type="proc"};
=TEX

ⓈCN
procedure P is
   type FIX is delta 0.1 range 5.1 .. 10.0;
   type FLOAT1 is digits 4  range -5.1 .. 10.0;
   type FLOAT2 is digits 6 ;
   subtype SUBFIX is FIX range 7.0 .. 9.0;
   subtype SUBFLOAT1 is FLOAT1 digits 4 range -0.8 .. 0.8;
begin
   null;
end P;
■

The following conjectures assert that the translation of {\it FIX}, {\it FLOAT1},
{\it FLOAT2}, {\it SUBFIX} and {\it SUBFLOAT1} meet their specifications:

=SML
ⓈZ
│ Conj1_1_1 ?⊢
│	FIX = 5.1 ..⋎R 10.0
■

=SML
set_pc"cn1";
set_goal([], get_conjecture"-""Conj1_1_1");
a(rewrite_tac[z_get_specⓩFIX⌝]);
store_mt_results
(mt_runf (op =$))
 [("r1.1.1", snd o dest_thm o pop_thm , (), get_conjecture"-""Conj1_1_1")];
=TEX

=SML
ⓈZ
│ Conj1_1_2 ?⊢
│	FLOAT1 = ~⋎R 5.1 ..⋎R 10.0
■

=SML
set_pc"cn1";
set_goal([], get_conjecture"-""Conj1_1_2");
a(rewrite_tac[z_get_specⓩFLOAT1⌝]);
store_mt_results
(mt_runf (op =$))
 [("r1.1.2", snd o dest_thm o pop_thm , (), get_conjecture"-""Conj1_1_2")];
=TEX

=SML
ⓈZ
│ Conj1_1_3 ?⊢
│	FLOAT2 = FLOAT2vFIRST ..⋎R FLOAT2vLAST
■

=SML
set_pc"cn1";
set_goal([], get_conjecture"-""Conj1_1_3");
a(rewrite_tac[z_get_specⓩFLOAT2⌝]);
store_mt_results
(mt_runf (op =$))
 [("r1.1.3", snd o dest_thm o pop_thm , (), get_conjecture"-""Conj1_1_3")];
=TEX

=SML
ⓈZ
│ Conj1_1_4 ?⊢
│	SUBFIX = 7.0 ..⋎R 9.0
■

=SML
set_pc"cn1";
set_goal([], get_conjecture"-""Conj1_1_4");
a(rewrite_tac[z_get_specⓩSUBFIX⌝]);
store_mt_results
(mt_runf (op =$))
 [("r1.1.4", snd o dest_thm o pop_thm , (), get_conjecture"-""Conj1_1_4")];
=TEX
=SML
ⓈZ
│ Conj1_1_5 ?⊢
│	SUBFLOAT1 = ~⋎R 0.8 ..⋎R 0.8
■

=SML
set_pc"cn1";
set_goal([], get_conjecture"-""Conj1_1_5");
a(rewrite_tac[z_get_specⓩSUBFLOAT1⌝]);
store_mt_results
(mt_runf (op =$))
 [("r1.1.5", snd o dest_thm o pop_thm , (), get_conjecture"-""Conj1_1_5")];
=TEX

\subsection{``Others'' in Case Statements}\label{ROneTwo}

Interim test coverage in MDT505. Below is the test from INT509 for the translation of a Spark Case Statement amended to cover ``others''.

=SML
clean_up();
new_script{name = "P", unit_type="proc"};
=TEX
ⓈCN
procedure P is
    type DAY is (MON,TUE,WED,THU,FRI,SAT,SUN);
    subtype WEEKEND is DAY range SAT..SUN;
    D : DAY;
begin
 Δ D [D = SAT ∨ D = SUN]	
end P;
■

ⓈCN
 ⊑
	case D is
		when MON => D := SAT;
		when TUE => D := SAT;
		when WED => D := SAT;
		when THU => D := SAT;
		when FRI => D := SAT;
		when others => null;
	end case;
■

We validate the above by proving the VCs we get:

=SML
set_pc"cn";
set_goal([], get_conjecture"-""vc_1_1");
a(REPEAT strip_tac);
store_mt_results
(mt_runf (op =$))
 [("r1.2.1", snd o dest_thm o pop_thm , (), get_conjecture"-""vc_1_1")];
=TEX
=SML
set_pc"cn";
set_goal([], get_conjecture"-""vc_1_2");
a(REPEAT strip_tac);
store_mt_results
(mt_runf (op =$))
 [("r1.2.2", snd o dest_thm o pop_thm , (), get_conjecture"-""vc_1_2")];
=TEX
=SML
set_pc"cn";
set_goal([], get_conjecture"-""vc_1_3");
a(REPEAT strip_tac);
store_mt_results
(mt_runf (op =$))
 [("r1.2.3", snd o dest_thm o pop_thm , (), get_conjecture"-""vc_1_3")];
=TEX
=SML
set_pc"cn";
set_goal([], get_conjecture"-""vc_1_4");
a(REPEAT strip_tac);
store_mt_results
(mt_runf (op =$))
 [("r1.2.4", snd o dest_thm o pop_thm , (), get_conjecture"-""vc_1_4")];
=TEX
=SML
set_pc"cn";
set_goal([], get_conjecture"-""vc_1_5");
a(REPEAT strip_tac);
store_mt_results
(mt_runf (op =$))
 [("r1.2.5", snd o dest_thm o pop_thm , (), get_conjecture"-""vc_1_5")];
=TEX
=SML
set_pc"cn";
set_goal([], get_conjecture"-""vc_1_6");
a(rewrite_tac(map z_get_spec[ⓩDAY⌝,ⓩMON⌝,ⓩTUE⌝,ⓩWED⌝,ⓩTHU⌝,ⓩFRI⌝,ⓩSAT⌝,ⓩSUN⌝]));
a(PC_T1"z_lin_arith"prove_tac[]);
store_mt_results
(mt_runf (op =$))
 [("r1.2.6", snd o dest_thm o pop_thm , (), get_conjecture"-""vc_1_6")];
=TEX

\subsection{Reverse Loops}\label{ROneThree}

Interim test coverage in MDT505. In addition the test from INT509 for the translation of a Spark For Loop is amended to cover reverse loops. This covers the For Loop with static bounds. Finally we give a test for the For Loop with type mark as range.

=SML
clean_up();
new_script{name = "P", unit_type="proc"};
=TEX
ⓈCN
procedure P is
   subtype INDEX is INTEGER range 1 .. 10;
   type ARR is array (INDEX) of INTEGER;
   I : INTEGER;	
   A : ARR;
begin
 Δ A,I [∀ j : 1 .. 10  ⦁ A j = 0]
end P;
■

ⓈCN
 ⊑
	for I in reverse INDEX loop
	Δ A,I [∀ j : I+1 .. 10  ⦁ A j = 0, (∀ j : I+1 .. 10  ⦁ A j = 0) ∧ A I = 0]
	end loop;
■

ⓈCN
 ⊑
	A(I) := 0;
■

We validate the above by proving the VCs we get:

=SML
set_pc"cn";
set_goal([], get_conjecture"-""vc_1_1");
a(rewrite_tac[z_get_specⓩINDEXvLAST⌝]THEN REPEAT strip_tac);
store_mt_results
(mt_runf (op =$))
 [("r1.3.1.1", snd o dest_thm o pop_thm , (), get_conjecture"-""vc_1_1")];
=TEX
=SML
set_pc"cn";
set_goal([], get_conjecture"-""vc_1_2");
a(rewrite_tac[z_get_specⓩINDEXvFIRST⌝,z_get_specⓩINDEXvLAST⌝]);
store_mt_results
(mt_runf (op =$))
 [("r1.3.1.2", snd o dest_thm o pop_thm , (), get_conjecture"-""vc_1_2")];
=TEX
=SML
set_pc"cn";
set_goal([], get_conjecture"-""vc_1_3");
a(REPEAT strip_tac);
a(lemma_tacⓩj > I ∨ j = I⌝ THEN1 PC_T1 "z_lin_arith" asm_prove_tac[]);
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 5 ⓩj⌝ THEN PC_T1 "z_lin_arith" asm_prove_tac[]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[]);
store_mt_results
(mt_runf (op =$))
 [("r1.3.1.3", snd o dest_thm o pop_thm , (), get_conjecture"-""vc_1_3")];
=TEX
=SML
set_goal([], get_conjecture"-""vc_1_4");
a(rewrite_tac[z_get_specⓩINDEXvFIRST⌝]THEN REPEAT strip_tac);
a(lemma_tacⓩ2 ≤ j ∨ j = 1⌝ THEN1 PC_T1 "z_lin_arith" asm_prove_tac[]);
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 5 ⓩj⌝ THEN PC_T1 "z_lin_arith" asm_prove_tac[]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[]);
store_mt_results
(mt_runf (op =$))
 [("r1.3.1.4", snd o dest_thm o pop_thm , (), get_conjecture"-""vc_1_4")];
=TEX
=SML
set_goal([], get_conjecture"-""vc_2_1");
a(rewrite_tac[z_get_specⓩARR⌝]THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 3 ⓩj⌝ THEN_TRY PC_T1 "z_lin_arith" asm_prove_tac[]);
a(lemma_tacⓩ¬ j = I ∧ j∈ INDEX⌝THEN1 GET_NTH_ASM_T 5 ante_tac THEN1
	rewrite_tac[z_get_specⓩINDEX⌝]THEN1 PC_T1 "z_lin_arith"asm_prove_tac[]);
a(ALL_ASM_FC_T asm_rewrite_tac [z_⊕_↦_app_thm1]);
(* *** Goal "2" *** *)
a(rewrite_tac[z_⊕_↦_app_thm]);
store_mt_results
(mt_runf (op =$))
 [("r1.3.1.5", snd o dest_thm o pop_thm , (), get_conjecture"-""vc_2_1")];
=TEX

Now the For Loop with type mark as range:

=SML
clean_up();
new_script{name = "P", unit_type="proc"};
=TEX
ⓈCN
procedure P is
   type DAY is (MON, TUE, WED, THU, FRI, SAT, SUN);
   type ARR is array (DAY) of INTEGER;
   D : DAY;
   A : ARR;

begin
 Δ A,D [∀ c : MON .. SUN  ⦁ A c = 0]
end P;
■

ⓈCN
 ⊑
	for D in reverse DAY loop
	Δ A,D [∀ c : D+1 .. SUN  ⦁ A c = 0, (∀ c : D+1 .. SUN  ⦁ A c = 0) ∧ A D = 0]
	end loop;
■

ⓈCN
 ⊑
	A(D) := 0;
■

We validate the above by proving the VCs we get:

=SML
set_pc"cn";
set_goal([], get_conjecture"-""vc_1_1");
a(rewrite_tac[z_get_specⓩDAYvLAST⌝,z_get_specⓩSUN⌝]THEN REPEAT strip_tac);
store_mt_results
(mt_runf (op =$))
 [("r1.3.2.1", snd o dest_thm o pop_thm , (), get_conjecture"-""vc_1_1")];
=TEX
=SML
set_pc"cn";
set_goal([], get_conjecture"-""vc_1_2");
a(rewrite_tac(map z_get_spec[ⓩDAYvFIRST⌝,ⓩDAYvLAST⌝,ⓩMON⌝,ⓩSUN⌝]));
store_mt_results
(mt_runf (op =$))
 [("r1.3.2.2", snd o dest_thm o pop_thm , (), get_conjecture"-""vc_1_2")];
=TEX
=SML
set_pc"cn";
set_goal([], get_conjecture"-""vc_1_3");
a(REPEAT strip_tac);
a(lemma_tacⓩc > D ∨ c = D⌝ THEN1 PC_T1 "z_lin_arith" asm_prove_tac[]);
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 5 ⓩc⌝ THEN PC_T1 "z_lin_arith" asm_prove_tac[]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[]);
store_mt_results
(mt_runf (op =$))
 [("r1.3.2.3", snd o dest_thm o pop_thm , (), get_conjecture"-""vc_1_3")];
=TEX
=SML
set_goal([], get_conjecture"-""vc_1_4");
a(rewrite_tac[z_get_specⓩDAYvFIRST⌝,z_get_specⓩMON⌝,z_get_specⓩSUN⌝]THEN REPEAT strip_tac);
a(lemma_tacⓩ1 ≤ c ∨ c = 0⌝ THEN1 PC_T1 "z_lin_arith" asm_prove_tac[]);
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 5 ⓩc⌝ THEN PC_T1 "z_lin_arith" asm_prove_tac[]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[]);
store_mt_results
(mt_runf (op =$))
 [("r1.3.2.4", snd o dest_thm o pop_thm , (), get_conjecture"-""vc_1_4")];
=TEX
=SML
set_goal([], get_conjecture"-""vc_2_1");
a(rewrite_tac[z_get_specⓩARR⌝]THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 3 ⓩc⌝ THEN_TRY PC_T1 "z_lin_arith" asm_prove_tac[]);
a(lemma_tacⓩ¬ c = D ∧ c ∈ DAY⌝THEN1 GET_NTH_ASM_T 5 ante_tac THEN1
	rewrite_tac[z_get_specⓩDAY⌝]THEN1 PC_T1 "z_lin_arith"asm_prove_tac[]);
a(ALL_ASM_FC_T asm_rewrite_tac [z_⊕_↦_app_thm1]);
(* *** Goal "2" *** *)
a(rewrite_tac[z_⊕_↦_app_thm]);
store_mt_results
(mt_runf (op =$))
 [("r1.3.2.5", snd o dest_thm o pop_thm , (), get_conjecture"-""vc_2_1")];
=TEX

\subsection{Logical Operators on Arrays of Booleans}\label{ROneFour}

Interim test coverage in MDT508. Additional material here serves as an integration test for this feature.

=SML
clean_up();
new_script{name = "P", unit_type="proc"};
=TEX

ⓈCN
procedure P is
   subtype INDEX is INTEGER range 1 .. 2;
   type FLAGS is array(INDEX) of BOOLEAN;	
   flags1: constant FLAGS := FLAGS'( true, false);
   flags2: constant FLAGS := FLAGS'( true, true );
   flagsand: constant FLAGS := flags1 and flags2;
   flagsor : constant FLAGS := flags1 or flags2;
   flagsxor : constant FLAGS := flags1 xor flags2;
begin
   null;
end P;
■

The following conjectures assert that the translation of {\it flagsands}, {\it flagsor} and
{\it flagsxor} meet their specifications:

ⓈZ
│ Conj1_4_1 ?⊢
│	FLAGSAND = FLAGS1 array_and FLAGS2
■

=SML
set_pc"cn1";
set_goal([], get_conjecture"-""Conj1_4_1");
a(rewrite_tac[z_get_specⓩFLAGSAND⌝]);
store_mt_results
(mt_runf (op =$))
 [("r1.4.1", snd o dest_thm o pop_thm , (), get_conjecture"-""Conj1_4_1")];
=TEX

ⓈZ
│ Conj1_4_2 ?⊢
│	FLAGSOR = FLAGS1 array_or FLAGS2
■

=SML
set_pc"cn1";
set_goal([], get_conjecture"-""Conj1_4_2");
a(rewrite_tac[z_get_specⓩFLAGSOR⌝]);
store_mt_results
(mt_runf (op =$))
 [("r1.4.2", snd o dest_thm o pop_thm , (), get_conjecture"-""Conj1_4_2")];
=TEX

ⓈZ
│ Conj1_4_3 ?⊢
│	FLAGSXOR = FLAGS1 array_xor FLAGS2
■

=SML
set_pc"cn1";
set_goal([], get_conjecture"-""Conj1_4_3");
a(rewrite_tac[z_get_specⓩFLAGSXOR⌝]);
store_mt_results
(mt_runf (op =$))
 [("r1.4.3", snd o dest_thm o pop_thm , (), get_conjecture"-""Conj1_4_3")];
=TEX

\subsection{Range Attributes as Ranges}\label{ROneFive}

Interim test coverage in MDT508, but not covering use of range attributes
in aggregates and case statements; these are covered below:


=SML
clean_up();
new_script{name = "DATA", unit_type="spec"};
=TEX
ⓈCN
package Data is
   type DAY is (MON, TUE, WED, THU, FRI, SAT, SUN);
   subtype WEEK_DAY is DAY range MON .. FRI;
   subtype WEEKEND_DAY is DAY range SAT .. SUN;
   subtype PAY is INTEGER range 1 .. 100;
   type SALARY is array (DAY) of PAY;
   base_rate : constant PAY := 50;
   rates : constant SALARY := SALARY'(
      WEEK_DAY'range => base_rate,
      WEEKEND_DAY'range => 2*base_rate);
end Data;
■
The following conjecture asserts that the translation of {\it rates}
meets the specification:
=SML
ⓈZ
│ Conj1_5_1 ?⊢
│	DATAoRATES
│ =	(DATAoWEEK_DAYvFIRST .. DATAoWEEK_DAYvLAST × {DATAoBASE_RATE})
│ ∪	(DATAoWEEKEND_DAYvFIRST .. DATAoWEEKEND_DAYvLAST × {2 * DATAoBASE_RATE})
■
=SML
set_pc"cn1";
set_goal([], get_conjecture"-""Conj1_5_1");
a(rewrite_tac[z_get_specⓩDATAoRATES⌝]);
store_mt_results
(mt_runf (op =$))
 [("r1.5.1", snd o dest_thm o pop_thm , (), get_conjecture"-""Conj1_5_1")];
=TEX
=SML
new_script{name = "ADJUSTED_RATE", unit_type="func"};
=TEX
ⓈCN
with Data;
function adjusted_rate(which_day : Data.DAY; rise : Data.PAY) return Data.PAY
Ξ [	WHICH_DAY ∈ DATAoWEEK_DAYvFIRST .. DATAoWEEK_DAYvLAST
		∧ ADJUSTED_RATE(WHICH_DAY, RISE) = DATAoRATES(WHICH_DAY) + RISE
∨	WHICH_DAY ∈ DATAoWEEKEND_DAYvFIRST .. DATAoWEEKEND_DAYvLAST
		∧ ADJUSTED_RATE(WHICH_DAY, RISE) = DATAoRATES(WHICH_DAY) + 2*RISE]
is
begin
  case which_day is
    when Data.WEEK_DAY'range => return Data.rates(which_day) + rise;
    when Data.WEEKEND_DAY'range => return Data.rates(which_day) + 2*rise;
  end case;
end adjusted_rate;
■
=TEX
We validate the above by proving the VCs we get:
=SML
set_pc"cn1";
set_goal([], get_conjecture"-""vcADJUSTED_RATE_1");
a(cn_vc_simp_tac[] THEN REPEAT strip_tac);
store_mt_results
(mt_runf (op =$))
 [("r1.5.2.1", snd o dest_thm o pop_thm , (), get_conjecture"-""vcADJUSTED_RATE_1")];

=SML
set_pc"cn1";
set_goal([], get_conjecture"-""vcADJUSTED_RATE_2");
a(cn_vc_simp_tac[] THEN REPEAT strip_tac);
store_mt_results
(mt_runf (op =$))
 [("r1.5.2.2", snd o dest_thm o pop_thm , (), get_conjecture"-""vcADJUSTED_RATE_2")];
=TEX
\subsection{Subtype Indications in Case Statements and Aggregates}\label{ROneSix}

Interim test coverage in MDT508, but not covering use of subtype indications
in case statements and aggregates; these are covered below:

=SML
clean_up();
new_script{name = "DATA", unit_type="spec"};
=TEX
ⓈCN
package Data is
   type DAY is (MON, TUE, WED, THU, FRI, SAT, SUN);
   subtype WEEK_DAY is DAY range MON .. FRI;
   subtype WEEKEND_DAY is DAY range SAT .. SUN;
   subtype PAY is INTEGER range 1 .. 100;
   type SALARY is array (DAY) of PAY;
   base_rate : constant PAY := 50;
   rates : constant SALARY := SALARY'(
      DAY range MON .. FRI => base_rate,
      WEEKEND_DAY => 2*base_rate);
end Data;
■
The following conjecture asserts that the translation of {\it rates}
meets the specification:
=SML
ⓈZ
│ Conj1_6_1 ?⊢
│	DATAoRATES
│ =	(DATAoMON .. DATAoFRI × {DATAoBASE_RATE})
│ ∪	(DATAoWEEKEND_DAYvFIRST .. DATAoWEEKEND_DAYvLAST × {2 * DATAoBASE_RATE})
■
=SML
set_pc"cn1";
set_goal([], get_conjecture"-""Conj1_6_1");
a(rewrite_tac[z_get_specⓩDATAoRATES⌝]);
store_mt_results
(mt_runf (op =$))
 [("r1.6.1", snd o dest_thm o pop_thm , (), get_conjecture"-""Conj1_6_1")];
=TEX
=SML
new_script{name = "ADJUSTED_RATE", unit_type="func"};
=TEX
ⓈCN
with Data;
function adjusted_rate(which_day : Data.DAY; rise : Data.PAY) return Data.PAY
Ξ [	WHICH_DAY ∈ DATAoMON .. DATAoFRI
		∧ ADJUSTED_RATE(WHICH_DAY, RISE) = DATAoRATES(WHICH_DAY) + RISE
∨	WHICH_DAY ∈ DATAoWEEKEND_DAYvFIRST .. DATAoWEEKEND_DAYvLAST
		∧ ADJUSTED_RATE(WHICH_DAY, RISE) = DATAoRATES(WHICH_DAY) + 2*RISE]
is
begin
  case which_day is
    when Data.DAY range Data.MON .. Data.FRI => return Data.rates(which_day) + rise;
    when Data.WEEKEND_DAY => return Data.rates(which_day) + 2*rise;
  end case;
end adjusted_rate;
■
=TEX
We validate the above by proving the VCs we get:
=SML
set_pc"cn1";
set_goal([], get_conjecture"-""vcADJUSTED_RATE_1");
a(cn_vc_simp_tac[] THEN REPEAT strip_tac);
store_mt_results
(mt_runf (op =$))
 [("r1.6.2.1", snd o dest_thm o pop_thm , (), get_conjecture"-""vcADJUSTED_RATE_1")];

=SML
set_pc"cn1";
set_goal([], get_conjecture"-""vcADJUSTED_RATE_2");
a(cn_vc_simp_tac[] THEN REPEAT strip_tac);
store_mt_results
(mt_runf (op =$))
 [("r1.6.2.2", snd o dest_thm o pop_thm , (), get_conjecture"-""vcADJUSTED_RATE_2")];
=TEX

\subsection{Empty Package Specifications}\label{ROneSeven}
=TEX
We have to test that processing an empty package specification does not fail.

=SML
clean_up();
new_script{name = "EMPTY", unit_type="spec"};
=TEX
The following defines a function that will execute the compliance notation
fragment and return {\it true} if that succeeds, and {\it false} if it fails.
=SML
fun go1_7() = (
ⓈCN
package empty is

end empty;
■
=SML
true) handle Fail _ => false;
=TEX
=SML
store_mt_results
mt_run [("r1.7", go1_7, (), true)];
=TEX
\subsection{Character and String Literals and String Type}\label{ROneEight}

Interim test coverage in MDT508 and INT509. Character and string literals added explicitly to the integration test.

=SML
clean_up();
new_script{name = "P", unit_type="proc"};
ⓈCN
procedure P is
   subtype INDEX is INTEGER range 1..2;
   type STRING_ARRAY is array(INDEX) of STRING;
   x : constant CHARACTER := 'x';
   s : constant STRING := "hello world";	
   A : constant STRING_ARRAY := STRING_ARRAY'("abc", "xyz");
begin
   null;
end P;
■

The following conjectures assert that the constants {\it X}, {\it S} and {\it A} have their expected values.
=SML
ⓈZ
│ Conj1_8_1 ?⊢
│	X = char_lit "x"
■

=SML
set_pc"cn1";
set_goal([], get_conjecture"-""Conj1_8_1");
a(rewrite_tac[z_get_specⓩX⌝]);
store_mt_results
(mt_runf (op =$))
 [("r1.8.1", snd o dest_thm o pop_thm , (), get_conjecture"-""Conj1_8_1")];
=TEX

=SML
ⓈZ
│ Conj1_8_2 ?⊢
│	S = string_lit "hello world"
■

=SML
set_pc"cn1";
set_goal([], get_conjecture"-""Conj1_8_2");
a(rewrite_tac[z_get_specⓩS⌝]);
store_mt_results
(mt_runf (op =$))
 [("r1.8.2", snd o dest_thm o pop_thm , (), get_conjecture"-""Conj1_8_2")];
=TEX

=SML
ⓈZ
│ Conj1_8_3 ?⊢
│	A = ⟨string_lit "abc", string_lit "xyz"⟩
■

=SML
set_pc"cn1";
set_goal([], get_conjecture"-""Conj1_8_3");
a(rewrite_tac(
	pc_rule1 "z_library_ext" prove_rule[] ⓩ∀r:𝕌⦁(id _) ⨾ r  = r⌝::
	z_succ↗0↕_thm::
	map z_get_spec[ⓩA⌝, ⓩSTRING_ARRAYvFIRST⌝, ⓩINDEXvFIRST⌝, ⓩℤ⌝]));
store_mt_results
(mt_runf (op =$))
 [("r1.8.3", snd o dest_thm o pop_thm , (), get_conjecture"-""Conj1_8_3")];
=TEX

\subsection{SPARK 83 Attributes}\label{ROneNine}

Interim test coverage in MDT508. The following test shows the base attribute
in action (covered in MDT508, but included here for historical reasons, and
for use when this document is finalised).

=SML
clean_up();
new_script{name = "R1_9", unit_type="proc"};
ⓈCN
 procedure r1_9
 is
   type DAY is (MON, TUE, WED, THU, FRI, SAT, SUN);
   subtype WEEKDAY is DAY range MON..FRI;
   x : DAY;
 begin
 Δ X [X = MON]
 end r1_9;
■
ⓈCN
 ⊑ x := DAY'base'first;
■
=SML
set_goal([], get_conjecture"-""vc_1_1");
a(pure_rewrite_tac[z_get_specⓩDAYvFIRST⌝]);
a(REPEAT strip_tac);
store_mt_results
(mt_runf (op =$))
 [("r1.9", snd o dest_thm o pop_thm , (), get_conjecture"-""vc_1_1")];
=TEX

\subsection{Multiple ``With'' Clauses}\label{ROneTen}

=SML
clean_up();
new_script{name = "A", unit_type="spec"};
ⓈCN
 package A is
   type a_float is digits 6 range 1.0 .. 10.0;
 end A;
■
=SML
new_script{name = "B", unit_type="spec"};
ⓈCN
 package B is
   type b_fixed is delta 1.0e-4 range 1.0 .. 10.0;
 end B;
■
=SML
new_script{name = "C", unit_type="spec"};
ⓈCN
 package C is
   type c_integer is range 1 .. 10;
 end C;
■
=SML
new_script{name = "D", unit_type="spec"};
ⓈCN
 with A, B;
 pragma LIST(ON);
 with C;
 --#inherit A;
 package D is
   a_var : A.a_float;
   b_var : B.b_fixed;
   c_var : C.c_integer;
   procedure init
   Δ DoA_VAR, DoB_VAR, DoC_VAR[ DoA_VAR = DoB_VAR = 1.0 ∧ DoC_VAR = 10];
 end D;
■
=SML
new_script{name = "D", unit_type="body"};
ⓈCN
 with A, B, C;
 package body D is
   procedure init
   Δ DoA_VAR, DoB_VAR, DoC_VAR[ DoA_VAR = DoB_VAR = 1.0 ∧ DoC_VAR = 10]
   is
   begin
     A_VAR := A.a_float'first;
     B_VAR := B.b_fixed'first;
     C_VAR := C.c_integer'last;
   end init;
 end D;
■
=TEX
If we get this far and can use the definitions of the attributes for
the types in the first three packages to prove the VC that
actuall requires knowledge of the attribute values, then the
multiple with-clause must have been handled properly.
For completeness we do all three VCs:
=SML
set_pc"cn1";
set_goal([], get_conjecture"-""vcD_1");
a(REPEAT strip_tac);
store_mt_results
(mt_runf (op =$))
 [("r1.10.1", snd o dest_thm o pop_thm , (), get_conjecture"-""vcD_1")];
=TEX
=SML
set_goal([], get_conjecture"-""vcD_2");
a(REPEAT strip_tac);
store_mt_results
(mt_runf (op =$))
 [("r1.10.2", snd o dest_thm o pop_thm , (), get_conjecture"-""vcD_2")];
=TEX
The third VC is the one where the values of the attributes are needed
(and the rewriting below would fail if the specification theories were
out of scope or if the VC did not involve some constants defined in
those theories).
=SML
open_theory "DoINIT'proc";
set_pc "cn1";
set_goal([], get_conjecture"-""vcDoINIT_1");
a(pure_rewrite_tac((map z_get_spec o flat o map get_consts) ["A'spec", "B'spec", "C'spec"]));
a(REPEAT strip_tac);
store_mt_results
(mt_runf (op =$))
 [("r1.10.3", snd o dest_thm o pop_thm , (), get_conjecture"-""vcDoINIT_1")];
=TEX
\subsection{Packages In Packages}\label{ROneEleven}

Additional material to the interim test coverage in INT510.

Note:
In the Specification Change Proposal document, \cite{LEMMA1/DAZ/HLD507}, it states that inner packages refer to entities in the outer package by their prefixed names.
=SML
clean_up();
new_script{name = "A", unit_type="spec"};
=TEX

First the outer package specification:

ⓈCN
│  package A is
│  	subtype MYINT is INTEGER range -1000 .. 1000;
│	in_a: constant MYINT := 4;
│	function addtwo (X,Y:MYINT) return MYINT
│		Ξ [AoADDTWO (X,Y) = X + Y];
│
│  end A;
■

Then the package body:

=SML
new_continuation_script{name = "A", unit_type = "body"};
ⓈCN
│  package body A
│  is
│	subtype LOCAL is INTEGER range 1 .. 10;
│	before_b : constant MYINT := 1;
│	function addtwo (X,Y:MYINT) return MYINT
│		Ξ [ADDTWO (X,Y) = X + Y]
│	is   RESULT : MYINT;
│    	begin
│       		RESULT := X + Y;
│       		return RESULT;
│    	end addtwo;
│	package B is
│		in_b1 : constant MYINT := before_b;
│		in_b2 : constant A.MYINT := A.before_b;
│  		procedure p(X : in out integer)
│		Δ X [X = 0];
│	end B;
│
│       ⟨ body of B ⟩			( B )
│  	
│  end A;
■



We first prove the vcs generated by the package body spec.
=SML
set_pc"cn1";
set_goal([], get_conjecture"-""vcA_1");
a strip_tac;
store_mt_results
(mt_runf (op =$))
 [("r1.11.B.1", snd o dest_thm o pop_thm , (), get_conjecture"-""vcA_1")];
=TEX

=SML
set_pc"cn1";
set_goal([], get_conjecture"-""vcA_2");
a(REPEAT strip_tac);
store_mt_results
(mt_runf (op =$))
 [("r1.11.B.2", snd o dest_thm o pop_thm , (), get_conjecture"-""vcA_2")];
=TEX

=SML
open_theory"AoADDTWO'func";
set_pc"cn1";
set_goal([], get_conjecture"-""vcAoADDTWO_1");
a(REPEAT strip_tac);
store_mt_results
(mt_runf (op =$))
 [("r1.11.B.3", snd o dest_thm o pop_thm , (), get_conjecture"-""vcAoADDTWO_1")];
=TEX

The following conjecture asserts that the constant {\it IN_B1} has its expected value.
=SML
open_theory "A'body";

ⓈZ
│ Conj1_11_B_1 ?⊢
│	BoIN_B1 = 1
■

=SML
set_pc"cn1";
set_goal([], get_conjecture"-""Conj1_11_B_1");
a(rewrite_tac[z_get_specⓩBoIN_B1⌝,z_get_specⓩBEFORE_B⌝]);
store_mt_results
(mt_runf (op =$))
 [("r1.11.B.4", snd o dest_thm o pop_thm , (), get_conjecture"-""Conj1_11_B_1")];
=TEX

Finally the script for the nested package:

=SML
new_continuation_script{name = "A.B", unit_type = "body"};
ⓈCN
│  (A)
│  	≡
│	package body B is
│
│  		in_b_body : constant MYINT := in_a ;
││  		procedure p(X : in out integer)
│		Δ X [X = 0]
│		is begin X := 0; end;
│		
│		
│  	end B;
■


The following conjecture asserts that the constant {\it IN_B_BODY} has its expected value.

=SML
ⓈZ
│ Conj1_11_C_1 ?⊢
│	IN_B_BODY = 4
■

=SML
set_pc"cn1";
set_goal([], get_conjecture"-""Conj1_11_C_1");
a(rewrite_tac[z_get_specⓩIN_B_BODY⌝,z_get_specⓩAoIN_A⌝]);
store_mt_results
(mt_runf (op =$))
 [("r1.11.C.1", snd o dest_thm o pop_thm , (), get_conjecture"-""Conj1_11_C_1")];
=TEX

\section{EFFECTIVENESS OF THE TOOL}

\subsection{Global Variable Unsoundness}\label{RTwoOne}

Interim tests in INT508.

\section{EPILOGUE}
=SML
diag_line(summarize_mt_results());
=TEX


\end{document}

=IGN
********************************************************************************
mdt517.doc: this file is part of the PPDaz system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% ℤ
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

\def\Title{Module Tests for Script Proof Support}

\def\AbstractText{This document contains tests for the material defined in ISS/HAT/DAZ/DTD517\cite{ISS/HAT/DAZ/DTD517}.}

\def\Reference{ISS/HAT/DAZ/MDT517}

\def\Author{K. Blackburn}


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
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{DAZ PROJECT}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Module Tests for Script Proof Support}  %% Mandatory field
%% LaTeX2e port: \TPPref{ISS/HAT/DAZ/MDT517}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.36 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2006/09/19 11:24:22 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: %\TPPauthor{R.D.~Arthan & WIN01}  %% Mandatory field
%% LaTeX2e port: \TPPauthor{K.~Blackburn & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & DAZ Manager}
%% LaTeX2e port: \TPPabstract{This document contains tests for the material defined
%% LaTeX2e port: in ISS/HAT/DAZ/DTD517\cite{ISS/HAT/DAZ/DTD517}.}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	    Library
%% LaTeX2e port: }}
%% LaTeX2e port: \begin{document}
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
\pagebreak
\section{Document control}
\subsection{Contents list}
\tableofcontents
\subsection{Document cross references}
\bibliographystyle{fmu}
\bibliography{fmu,daz}

\subsection{Changes history}
\begin{description}
\item[Issue 1.1 (1996/03/08), 1.2 (1996/03/11)]
First drafts.
\item[Issue 1.3 (1996/03/12)]
To match issue 1.5 of dtd517.
\item[Issue 1.4 (1996/03/15) - 1.9 (1996/03/26)]
Fixing use of Q's.
\item[Issue 1.11 (1997/05/22)]
Changing to one compilation unit per script.
\item[Issue 1.12 (1997/05/29)]
\item[Issue 1.11 (1997/05/22)]
IUCT WP 7 changes.
\item[Issue 1.12 (1997/05/29)-1.15 (1997/07/25)]
Changes for IUCT WP3 and 4;
attempt to make it more robust in various build/test environments.
\item[Issue 1.16 (1999/05/05)]
test for fix to make it accomodate spaces in file names.
\item[Issue 1.17 (2000/06/20)]
Adjustments for June 2000 enhancements.
\item[Issues 1.18 (2000/10/24)-1.20 (2000/10/31)]
Adjustments for CTLE II enhancements;
linked in some tests that were not being run;
general tidy-up.
\item[Issue 1.21 (2001/11/08)]
Adjusted for definition of {\it and\_then} and {\it or\_else} in theory ``cn''.
\item[Issue 1.21 (2001/11/08)--1.23 (2002/01/27)]
Adjusted for definition of {\it universal\_discrete} and its attributes.
\item[Issue 1.24 (2002/01/27)]
Adjusted for definition of slide.
\item[Issue 1.25 (2002/01/29)]
Adjusted for introduction of VC route type in theory cn.
\item[Issue 1.26 (2002/05/23)]
Adjusted for new treatment of constants and introduction of defining property
for {\it real\_to\_integer}.
\item[Issue 1.27 (2002/07/09)] Merged in changes for R0062.
Adjusted for reduction in number of constructors of {\it VC\_Route}.
\item[Issue 1.29 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.30 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.31 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.32 (2004/01/19)] The Z universal set is now called 𝕌
\item[Issue 1.33 (2006/03/28)] Allowed for automated state management.
\item[Issue 1.35 (2006/04/20)] Ada real literals are now translated into Z floating point literals.
\item[Issue 1.36 (2006/09/19)] Allowed for enhancement 165.
\item[Issue 1.37 (2008/05/04)] Allowed for new definitions that support modular  types.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported daz source documents onto the Lemma 1 document template
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes forecast}
None.
\section{GENERAL}
\subsection{Scope}
This document contains module tests for the module defined
in \cite{ISS/HAT/DAZ/DTD517}.
\subsection{Introduction}
\subsubsection{Background and Purpose}
See \cite{ISS/HAT/DAZ/DTD517}. The tests are intended to meet
the requirements for module tests identified in the quality plan
\cite{ISS/HAT/DAZ/PLN002}.
\subsubsection{Dependencies}
These tests depend on
the test harness as implemented in DS/FMU/IED/IMP013, and
its corresponding detailed design document, DS/FMU/IED/DTD013.
\subsubsection{Possible Enhancements}
None known.
\subsubsection{Deficiencies}
Overriding of pre-existing theorems not tested.

\section{PREAMBLE}
=SML
use_file "dtd013.sml";
use_file "imp013.sml";
init_mt_results();
=TEX
\section{TEST POLICY}
Integration tests check some of the fine details of the script proof support functions.
The tests here have more of the flavour of ``soak'' tests, hitting the functions
with reasonably large and/or unusual input to see what happens. In this document
a frequent method of checking results is just to compare counts of the numbers
of constants, axioms, theorems
etc. that have been produced by processing some compliance notation and some Z paragraphs
and then calling the script proof support functions. Some or all of these counts
will change with the evolving design of the compliance tool. When changes to
the tool make the counts change, testers should do a visual spot check of the
actual constants, axioms, theorems etc. (e.g., using {\it ``print\_z\_document''}
to determine whether the results are as expected.
If the results are as expected, then the counts in the test criteria in this document
need to be adjusted accordingly.
=TEX
\section{THE TESTS}
=SML
val cu_name = "P";
val cu_type ="PROC";
val thy_name = "P'proc";
force_delete_theory thy_name handle Fail _ => ();
force_delete_theory "mdt517" handle _ => ();
open_theory "imp517" handle _ => open_theory "cn";
set_pc"z_library1";
new_theory"mdt517";
diag_string "Cache theory is: ";
force_get_cache_theory();
=TEX


=SML
set_flags [("z_type_check_only", false),("z_use_axioms", true)];
=TEX
Ready to start a new script for a test theory.
=SML
new_script{name=cu_name,  unit_type=cu_type};
new_parent "mdt517";
if (is_nil (cn_simplify_canon (z_get_spec ⓩBOOLEANvPOS⌝)))
then diag_string "*** THEORY SCOPE TROUBLES, THESE TESTS ARE NOT LIKELY TO BE RIGHT ***"
else();
=TEX
\subsection{Useful functions}
=SML
fun ⦏tac_solve⦎ tac (seqasms, goal) = (
	dest_thm (tac_proof ((seqasms,goal),tac))
	=#
	(seqasms, goal)
);
=TEX

Functions for recording some statistics of theories.

=SML
type theory_stats = {ng : int, na : int, nd : int, nc : int, nt : int};
local
    fun noof_global thy = (length o get_consts) thy;
    fun noof_axioms thy = (length o get_axioms) thy;
    fun noof_defns thy = (length o get_defns) thy;
    fun noof_conjectures thy = (length o get_conjectures) thy;
    fun noof_thms thy = (length o get_thms) thy;
in
    fun get_theory_stats (thy : string) : theory_stats = (
    let
        val ng = noof_global thy;
        val na = noof_axioms thy;
        val nd = noof_defns thy;
        val nc = noof_conjectures thy;
        val nt = noof_thms thy;
   in
        {ng = ng, na = na, nd = nd, nc = nc, nt = nt}
   end);
end;
=TEX
\pagebreak
\section{EXPRESSIONS} \label{EXP}
\subsection{Identifier}
ⓈCN
procedure P is
   C1 : constant INTEGER := 9;
   C2 : constant INTEGER := C1;


-- {Aggregates}
-- {Positional Array}
   type DAY is (MON, TUE, WED, THU, FRI, SAT, SUN);
   subtype INDEX is INTEGER range 2 .. 4;
   type ARR is array (INDEX) of DAY;
   C : constant ARR := ARR'(THU, FRI, SAT);
-- {Positional Array With Others}
   C3 : constant ARR := ARR'(THU, FRI, SAT, others => SUN);
-- {Positional Array With Just Others}
   C4 : constant ARR := ARR'(others => SUN);
-- {Named Array}
   type ARR1 is array (DAY) of DAY;
   C5 : constant ARR1 := ARR1'(MON .. THU | FRI => WED, SAT | SUN => TUE);
-- {Named Array With Others}
   C6 : constant ARR1 := ARR1'(1 .. 5 => WED, others => TUE);
-- {Positional Record}
   type REC is
	record
	   START		: DAY;
	   FINISH		: DAY;
	   YESTERDAY	: ARR;
	end record; 	
   type REC1 is
	record
	   START, FINISH		: DAY;
	   YESTERDAY	: ARR;
	end record; 	
   type REC2 is
	record
	   FINISH, START		: DAY;
	   YESTERDAY	: ARR;
	end record; 	
		
   C7 : constant REC := REC'(WED,SUN,ARR'(others => THU));
   Ca7 : constant REC1 := REC1'(WED,SUN,ARR'(others => THU));
   Cb7 : constant REC2 := REC2'(WED,SUN,ARR'(others => THU));
-- {Named Record}
   C8 : constant REC := REC'(START => THU,
				FINISH => FRI,
				YESTERDAY => ARR'(others => SUN));
-- {Unary}
   C9 : constant INTEGER := abs (-6);
   C10 : constant BOOLEAN := not FALSE;
-- {Binary}
   C11 : constant BOOLEAN := ((5<5 and 6<=4) or (2>1 and then -1>=0));
   C12 : constant INTEGER := 5-3+2*7;
   C13 : constant INTEGER := (17 / 3) * 3 + (17 rem 3);
   C14 : constant INTEGER := (-17 / 3) * 3 + (-17 mod 3);
   C15 : constant INTEGER := 2 ** 3;
   subtype WEEKDAY is DAY range MON..FRI;
   C16 : constant BOOLEAN := SUN in WEEKDAY or SUN not in WEEKDAY;
-- {Membership of a Range}
   C17 : constant BOOLEAN := 6 in 5..10 or 6 not in 5..10;
-- {Attributes}
   subtype WEEK is DAY range MON..SUN;
   C21 : constant DAY := WEEKDAY'FIRST;
   C22 : constant DAY := WEEKDAY'LAST;
   C23 : constant DAY := WEEKDAY'SUCC(FRI);
   C24 : constant DAY := WEEKDAY'PRED(WED);
   C25 : constant INTEGER := WEEKDAY'POS(TUE);
   C26 : constant DAY := WEEKDAY'VAL(6);
   C27 : constant DAY := ARR'FIRST;
   C28 : constant DAY := ARR'LAST;
   C29 : constant INTEGER := ARR'LENGTH;
-- {Indexed Components}
   TOMORROW : constant ARR := ARR'(TUE,WED,THU,FRI,SAT,SUN,MON);
   C30 : constant DAY := TOMORROW(DAY'FIRST);
-- {Selected Components}
   R : constant REC := REC'(WED,FRI,ARR'(others => SUN));		
   C31 : constant DAY := R.FINISH;
-- {Function Calls}
   function MAX (x,y: DAY) return DAY;
   R1 : constant REC := REC'(WED,FRI,ARR'(others => SUN)); 	
   C32 : constant DAY := MAX(THU,R.FINISH);
-- {Qualified Expressionss}
   C33 : constant DAY := DAY'(THU);
-- {Type Conversions}
   subtype COUNT is INTEGER range 1.. 10;
   subtype ALTCOUNT is COUNT;
   C34 : constant COUNT := COUNT(4);
   C34A : constant ALTCOUNT := ALTCOUNT(4);
-- {Integer Literals}
   C35 : constant INTEGER := 4;
-- {Auxiliary Expressions}
   C36 : constant INTEGER := ⟦6⟧;
-- {BASIC DECLARATIONS}
-- {Constants}
   subtype INDEX1 is INTEGER range 1..2;
   type STRING_ARRAY is array(INDEX1) of STRING;
   A : constant STRING_ARRAY := STRING_ARRAY'("abc", "xyz");
-- {Enumeration Types}
-- {Array Types}
   type HOURS is range 0..23;
   type ARR3 is array (DAY) of DAY;
   type ARR2 is array (DAY,HOURS) of DAY;
   type UNCON1 is array (DAY range <>) of DAY;
   type UNCON2 is array (DAY range <>,HOURS range <>) of DAY;
-- {Record Types}
-- {Integer Types}
-- {Real Types}
   type FIX is delta 0.1 range 5.1 .. 10.0;
-- {Subtypes}
   subtype SUBFIX1 is FIX range 7.0 .. 9.0;
   subtype SUB1 is INTEGER range INTEGER(7.2) .. 10;
   type FLOAT1 is digits 4  range -5.1 .. 10.0;
   subtype SUBFLOAT1 is FLOAT1 digits 4 range -0.8 .. 0.8;
   subtype SUBFIX2 is FIX delta 0.3 range 6.0 .. 10.0;
   type UNCON is array (DAY range <>) of DAY;
   subtype SUB is UNCON(WEEKDAY);
   type UNCON3 is array (DAY range <>,HOURS range<>) of DAY;
   subtype SUB2 is UNCON3(WEEKDAY,HOURS);
   subtype SUB3 is INTEGER;
   type Q is range 1 .. 1;
   type QQQQ is range 1 .. 3;
   type EQUAL_TEST is range 1 .. 4;
   type EQQQQUAL_TEST2 is range 1 .. 6;
begin
   null;
end P;
■
=TEX
Now we use some Z to add interest to the current theory:
=SML
set_flag("standard_z_paras", false);
open ZParagraphs;
val C_Q = chr(81);
val C_pc = chr(37);
val S_pQp = C_pc ^ C_Q ^ C_pc;
ⓈZ
│ START ≜ 1
■
ⓈZ
│ END ≜ 10
■
ⓈZAX
│ test1, test2 : ℤ
├──────
│ test1 > 0 ∧ test2 > 0
■
=TEX
To make things even more interesting, the following function
fakes up and loads some Z paragraphs that look like the
translations of Ada declarations:
=SML
fun fake_compliance_stuff (name_string : string) = (
update_theory_db_with_parainfo(AbbDefInfo (name_string, [], ⓩSTART .. END⌝));
(let
val local_gvar = mk_z_gvar(name_string, ⓣℤ SET⌝, []);
val local_gvarvlast = mk_z_gvar(name_string ^ "vLAST", ⓣℤ⌝, []);
in
update_theory_db_with_parainfo(AbbDefInfo (name_string ^ "vFIRST", [], ⓩSTART⌝));
update_theory_db_with_parainfo(AbbDefInfo (name_string ^ "vLAST", [], ⓩEND⌝));
update_theory_db_with_parainfo(AbbDefInfo (name_string ^ "vSUCC", [],
	ⓩ(ⓜlocal_gvar⌝ \ { ⓜlocal_gvarvlast⌝ }) ◁ succ⌝));
(let
val local_gvarvsucc = mk_z_gvar(name_string ^ "vSUCC", ⓣ(ℤ, ℤ) $"Z'T[2]" SET⌝, []);
in
update_theory_db_with_parainfo(AbbDefInfo (name_string ^ "vPRED", [],
	ⓩ (ⓜlocal_gvarvsucc⌝)  ↗~↕⌝));
update_theory_db_with_parainfo(AbbDefInfo (name_string ^ "vPOS", [],
	ⓩid ⓜlocal_gvar⌝⌝));
(let
val local_gvarvpos = mk_z_gvar(name_string ^ "vPOS", ⓣ(ℤ, ℤ) $"Z'T[2]" SET⌝, []);
in
update_theory_db_with_parainfo(AbbDefInfo (name_string ^ "vVAL", [],
	ⓩⓜlocal_gvarvpos⌝  ↗~↕⌝))
end)
end)
end)
);
=TEX
=SML
fake_compliance_stuff( "Q1");
fake_compliance_stuff( "B");
=SMLPLAIN
fake_compliance_stuff(C_Q);
fake_compliance_stuff( S_pQp);
fake_compliance_stuff( "E" ^ S_pQp ^ "UAL_TEST1");
fake_compliance_stuff( "E%%" ^ C_Q ^ "%%UAL_TEST3");
=TEX
Some more bits and bobs of Z:
ⓈZ
│ %calA% ≜ 1
■
ⓈZ
│ δ ≜ 1
■
ⓈZ
│ δ' ≜ 1
■
ⓈZ
│ stest1 ≜ "abcd"
■
ⓈZ
│ stest2 ≜ "Q"
■
ⓈZ
│ stest3 ≜ ⓜmk_z_string(C_Q)⌝
■
ⓈZ
│ stest4 ≜ "EQU"
■
ⓈZ
│ stest5 ≜ ⓜmk_z_string("E" ^ C_Q ^ "U")⌝
■
ⓈZ
│ stest6 ≜ "δ"
■
ⓈZ
│ stest7 ≜ "%calA%"
■
ⓈZ
│ rel ste _ st8
■
ⓈZ
│ ste X st8 ≜ ℙ (X × X)
■
=TEX
Now see what we've got --- or at least how many constants theorems etc. we've got.
=SML
val gts1 = get_theory_stats thy_name;
store_mt_results
mt_run [("create source theory", get_theory_stats, thy_name,
	{na = 70, nc = 1, nd = 234, ng = 311, nt = 0})];
=TEX
\section{Use of Test Theory}
=SML
force_delete_theory "test_517" handle _ => ();
open_theory thy_name;
new_theory "test_517";
fun my_show_length x = (diag_string ("Length is " ^ string_of_int (length x));
	length x);

store_mt_results
mt_run [("all_cn_make_script_support",
	my_show_length o all_cn_make_script_support, "test_517",
	383)];
push_pc "test_517";
=TEX
Have we created the sort of theorems we expected?
=SML
val gts2 = get_theory_stats "test_517";
store_mt_results
mt_run [("create support theory 1", get_theory_stats, "test_517",
	{na = 0, nc = 0, nd = 0, ng = 0, nt = 383})];
store_mt_results
(mt_runf (op =$)) [
	("cn_thm.1", snd o dest_eq o concl, cn_SUB2_thm, ⓩ(WEEKDAY × HOURS → DAY) ∩ UNCON3⌝),
	("cn_thm.2", snd o dest_eq o concl, cn_SUBvRANGE_thm, ⓩWEEKDAY⌝),
	("cn_thm.3", snd o dest_eq o concl, cn_SUB_thm, ⓩ(WEEKDAY → DAY) ∩ UNCON⌝),
	("cn_thm.4", concl, cn_FIX_thm, ⓩFIX = 5.1 ..⋎R 10.0⌝),
	("cn_thm.5", snd o dest_eq o concl, cn_R_thm, ⓩ(FINISH ≜ FRI, START ≜ WED, YESTERDAY ≜ ARRvRANGE × {SUN})⌝),
	("cn_thm.6", snd o dest_eq o concl, cn_REC_thm, ⓩ[FINISH : DAY; START : DAY; YESTERDAY : ARR]⌝),
	("cn_thm.7", snd o dest_eq o concl, cn_REC1_thm, ⓩ[FINISH : DAY; START : DAY; YESTERDAY : ARR]⌝),
	("cn_thm.8", snd o dest_eq o concl, cn_REC2_thm, ⓩ[FINISH : DAY; START : DAY; YESTERDAY : ARR]⌝),
	("cn_thm.9", concl, cn_DAYvVAL_thm, ⓩ∀ i : DAY ⦁ DAYvVAL i = i⌝),
	("cn_thm.10", concl, cn_DAYvPOS_thm, ⓩ∀ i : DAY ⦁ DAYvPOS i = i⌝),
	("cn_thm.11", concl, cn_DAYvVAL_sig_thm, ⓩDAYvVAL ∈ DAY → DAY⌝),
	("cn_thm.12", concl, cn_DAYvPOS_sig_thm, ⓩDAYvPOS ∈ DAY → DAY⌝),
	("cn_thm.13", concl, cn_DAYvPRED_thm, ⓩ∀ i : MON + 1 .. SUN ⦁ DAYvPRED i = i + ~ 1⌝),
	("cn_thm.14", concl, cn_DAYvPRED_sig_thm, ⓩDAYvPRED ∈ MON + 1 .. SUN → MON .. SUN + ~ 1⌝),
	("cn_thm.15", concl, cn_DAYvSUCC_thm, ⓩ∀ i : MON .. SUN + ~ 1 ⦁ DAYvSUCC i = i + 1⌝),
	("cn_thm.16", concl, cn_DAYvSUCC_sig_thm, ⓩDAYvSUCC ∈ MON .. SUN + ~ 1 → MON + 1 .. SUN⌝),
	("cn_thm.17", snd o dest_eq o concl, cn_C1_thm, ⓩ9⌝)
];
=TEX
The success of this indirectly tests:
=SML
z_norm_sig_h_schema_conv;
cn_simplify_canon;
list_cn_script_support_thms;
list_cn_make_script_support;
cn_spec_rule;
=TEX

Does the proof context perform properly?
=SML
rewrite_rule[] (asm_rule ⓩp ∈ SUB2⌝);
rewrite_rule[] (asm_rule ⓩp ∈ FLOAT1⌝);
rewrite_rule[] (asm_rule ⓩp ∈ STRING_ARRAYvRANGE⌝);
store_mt_results_show (mt_runf (op =$)) [
	("Proof 1", concl o prove_rule [],
		ⓩp ∈ DAY ⇒ DAYvVAL p = p⌝, ⓩp ∈ DAY ⇒ DAYvVAL p = p⌝),
	("Proof 2", concl o prove_rule [],
		ⓩp ∈ DAY ⇒ DAYvPOS p = p⌝, ⓩp ∈ DAY ⇒ DAYvPOS p = p⌝)
	];
=TEX
=SML
val goal_concl = ⓩWED ∈ MON + 1 .. SUN ⇒ DAYvPRED WED = WED - 1⌝;
set_goal([],goal_concl);
a strip_tac;
a(ALL_ASM_FC_T rewrite_tac [cn_DAYvPRED_thm]);
store_mt_results
(mt_runf (op =$))
	 [("Proof 3", concl o pop_thm, (), goal_concl)];
=TEX
=SML
val goal_concl = ⓩDAYvSUCC MON = TUE⌝;
set_goal([],goal_concl);
a(PC_T1 "z_sets_alg" lemma_tac ⓩMON ≤ MON ∧ MON ≤ SUN  + ~ 1⌝ THEN1 prove_tac[]);
a(ALL_ASM_FC_T rewrite_tac [cn_DAYvSUCC_thm]);
store_mt_results
(mt_runf (op =$))
	 [("Proof 4", concl o pop_thm, (), goal_concl)];
=TEX
=SML
val goal_concl = ⓩDAYvPRED WED = TUE⌝;
set_goal([],goal_concl);
a(lemma_tac ⓩWED ∈ MON + 1 .. SUN⌝ THEN1 prove_tac[]);
a(ALL_ASM_FC_T rewrite_tac [cn_DAYvPRED_thm]);
store_mt_results
(mt_runf (op =$))
	 [("Proof 5", concl o pop_thm, (), goal_concl)];
fc_canon cn_DAYvPRED_thm;
=TEX
=SML
val goal_concl = ⓩDAYvSUCC MON = TUE⌝;
set_goal([],goal_concl);
a(rewrite_tac[]);
a(PC_T1 "z_sets_alg" lemma_tac ⓩ0 ≤ 0 ∧ 0 ≤ 5⌝ THEN1 prove_tac[]);
a(ALL_ASM_FC_T rewrite_tac [rewrite_rule[]cn_DAYvSUCC_thm]);
store_mt_results
(mt_runf (op =$))
	 [("Proof 6", concl o pop_thm, (), goal_concl)];
=TEX
=SML
val goal_concl = ⓩDAYvPRED WED = TUE⌝;
set_goal([],goal_concl);
a(rewrite_tac[]);
a(PC_T1 "z_sets_alg" lemma_tac ⓩ1 ≤ 2 ∧ 2 ≤ 6⌝ THEN1 prove_tac[]);
a(ALL_ASM_FC_T rewrite_tac [rewrite_rule[]cn_DAYvPRED_thm]);
store_mt_results
(mt_runf (op =$))
	 [("Proof 7", concl o pop_thm, (), goal_concl)];
=SML
val goal_concl = ⓩALTCOUNTvFIRST = 1⌝;
set_goal([],goal_concl);
a(prove_tac[]);
store_mt_results
(mt_runf (op =$))
	 [("Proof 8", concl o pop_thm, (), goal_concl)];
=TEX
Check a few bindings:
=SML
cn_Q_thm;
cn_QQQQ_thm;
cn_EQUAL_TEST_thm;
cn_EQQQQUAL_TEST2_thm;
cn_δ_thm;
cn_δ_thm;
cn_δ'_thm;
cn__pc_calA_pc__thm;
fun prot_use_string s = (use_string s; 0) handle _ => 1;

store_mt_results_show mt_run [
	("bind_var1", prot_use_string,
	 "cn_E_pc_" ^ S_pQp ^ "_pc_UAL_TEST3_thm", 0),
	("bind_var2", prot_use_string,
	 "cn_E_pc_" ^ S_pQp ^ "_pc_UAL_TEST1_thm", 0),
	("bind_var3", prot_use_string, "cn_" ^ S_pQp ^ "_thm", 0),
	("bind_var4", prot_use_string, "cn_" ^ S_pQp ^ "vVAL_thm", 0),
	("bind_var5", prot_use_string, "absolute_rubbish", 1)
];

=TEX
Lets check the remaining items in a cursory manner:
=SML
pop_pc();
force_delete_theory "test_517" handle _ => ();
open_theory thy_name;
new_theory "test_517";
store_mt_results
mt_run [("cn_script_support_thms", my_show_length o
	cn_script_support_thms, thy_name,	383)];
=TEX
Have we created the sort of theorems we expected?
=SML
val gts3 = get_theory_stats "test_517";
store_mt_results
mt_run [("create support theory 2", get_theory_stats, "test_517",
	{na = 0, nc = 0, nd = 0, ng = 0, nt = 383})];
=TEX
=SML
force_delete_theory "test_517" handle _ => ();
open_theory thy_name;
new_theory "test_517";
store_mt_results
mt_run [("list_cn_spec_rule", my_show_length o
	list_cn_spec_rule,
	(map snd (get_defns thy_name @ get_axioms thy_name)),
	383)];
=TEX
Have we created the sort of theorems we expected?
=SML
val gts4 = get_theory_stats "test_517";
store_mt_results
mt_run [("create support theory 3", get_theory_stats, "test_517",
	{na = 0, nc = 0, nd = 0, ng = 0, nt = 383})];
=TEX
A simple test for $z\_norm\_sig\_h\_schema\_conv$:
=SML
┌T───────────
│ p : ℤ
├──────
│ p = 1
└──────────────
┌S───────────
│ q : ℤ
├──────
│ q = 1
└──────────────
=SML
val rhs = snd o dest_eq o snd o dest_thm;

store_mt_results
(mt_runf (op =$)) [("z_norm_sig_h_schema_conv 1",
	rhs o z_norm_sig_h_schema_conv, ⓩ[a,b : X; T ; S; f : Z]⌝,
	ⓩ[a : X; b : X; f : Z; T; S]⌝)];

store_mt_results
mt_run_fail [("z_norm_sig_h_schema_conv", z_norm_sig_h_schema_conv, ⓩ1⌝,
                gen_fail_msg "z_norm_sig_h_schema_conv" 47940 [string_of_term ⓩ1⌝])
];
=TEX
Nasty cases for $cn\_spec\_rule$:
=SML
ⓈZAX
│ S;
│ jjj : ℤ → ℤ
├──────
│ jjj 0 = 1;
│ q = 2
│
■
=SML
store_mt_results
mt_run [("cn_spec_rule_nasty 1", length,
	cn_spec_rule (get_spec ⓩq⌝), 4)];
=TEX
=SML
ⓈZ
│ CC1 ::= CC1Null | CC1A ( ℤ )
■
=SML
store_mt_results
mt_run [("cn_spec_rule_nasty 2", length,
	cn_spec_rule (get_spec ⓩCC1⌝), 1),
	("cn_spec_rule_nasty 3", length,
	cn_spec_rule (get_spec ⓩCC1A⌝), 4)];
=TEX
=SML
ⓈZ
│ [ AA, BB ]
■
=SML
store_mt_results
mt_run [("cn_spec_rule_nasty 4", length,
	cn_spec_rule (get_spec ⓩAA⌝), 1)];
=TEX
=SML
╒[X]═══════════
│ DD : X → X
├──────
│ DD = id X
└──────────────
=SML
store_mt_results
mt_run [("cn_spec_rule_nasty 5", length,
	cn_spec_rule (get_spec ⓩDD⌝), 2)];
store_mt_results
mt_run [("cn_spec_rule_nasty 6", length,
	cn_spec_rule (get_spec ⓩS⌝), 1)];
=TEX
=SML
ⓈZ
│ PP[X] ≜ id X
■
=SML
store_mt_results
mt_run [("cn_spec_rule_nasty 7", length,
	cn_spec_rule (get_spec ⓩ(PP[ℤ])⌝), 2)];
=TEX
Warnings:
=SML
store_mt_results_show mt_run [("cn_spec_rule 517001 a", length,
	list_cn_spec_rule [(get_spec ⓩ(PP[ℤ])⌝)], 2)];
val was = set_flag("ignore_warnings",true);
store_mt_results_show mt_run [("cn_spec_rule 517001 b", length,
	list_cn_spec_rule [(get_spec ⓩ(PP[ℤ])⌝)], 2)];
val was = set_flag("ignore_warnings",was);
=TEX
A few failure types:
=SML
val old_thy = get_current_theory_name();
open_theory "z_library";
new_theory"cn_not_in_scope";
set_cache_theories("cn_not_in_scope"::get_cache_theories());
store_mt_results_show mt_run_fail [("cn_spec_rule 517006",cn_spec_rule,
	get_spec ⓩ(_+_)⌝,
	gen_fail_msg "cn_spec_rule" 517006 [])];
set_cache_theories(tl(get_cache_theories()));
open_theory old_thy;
store_mt_results_show mt_run_fail [("cn_spec_rule 517004",cn_spec_rule,
	t_thm,
	gen_fail_msg "cn_spec_rule" 517004 [string_of_thm t_thm])];
=TEX
Just to see what theory cn looks like:
=SML
force_delete_theory "cn_cn" handle _ => ();
open_theory "imp517" handle _ => open_theory "cn";
new_theory "cn_cn";
delete_pc "cn_cn" handle _ => ();

store_mt_results_show mt_run [("cn_make_script_support cn",
	(fn x => let val tmp = cn_make_script_support "cn" x
		in my_show_length tmp
		end), "cn_cn",
	226)];
=TEX
Have we created the sort of theorems we expected?
=SML
val gts5 = get_theory_stats "cn_cn";
store_mt_results
mt_run [("create support theory 5", get_theory_stats, "cn_cn",
	{na = 0, nc = 0, nd = 0, ng = 0, nt = 226})];
=TEX
\subsection{Testing Material from DTD518}
=SML
open_theory "cn";
=TEX
=SML
force_delete_theory"TEST1'proc" handle Fail _ => ();
new_script{name="TEST1", unit_type="proc"};
ⓈCN
 procedure TEST1
 is
     type int4 is range 1 .. 4;
     type enum3 is (EINS, ZWEI, DREI);
     type arr3_4 is array(enum3) of int4;
     function func1 (x : enum3) return NATURAL
     is begin return NATURAL(x);
     end func1;
     function func2 (x : enum3) return int4 Ξ [ true ]
     is begin return int4(x);
     end func2;

 begin
   null;
 end TEST1;
■
=SML
force_delete_theory"TEST2'proc" handle Fail _ => ();
new_script{name="TEST2", unit_type="proc"};
ⓈCN
 procedure TEST2
 is
     type bit is (ZERO, ONE);
     function func3 (x : bit) return bit
     Ξ [FUNC3(X) = 1 - X]
     is begin return 1 - x;
     end func3;

 begin
   null;
 end TEST2;
■
=SML
force_delete_theory"TEST3'proc" handle Fail _ => ();
new_script{name="TEST3", unit_type="proc"};
ⓈCN
 procedure TEST3
 is
     type ABC is (A, B, C);
     type BYTE is range 0 .. 255;
     type MARKED_BYTE is record x : ABC; y : BYTE; z : BOOLEAN; end record;
     type AMB is array (BYTE) of MARKED_BYTE;
 begin
   null;
 end TEST3;
■
=TEX
=SML
force_delete_theory"test_proofs" handle Fail _ => ();
open_theory"TEST1'proc";
set_pc"cn1";
new_theory"test_proofs";
new_parent "TEST2'proc" handle Fail _ => ();
new_parent "TEST3'proc" handle Fail _ => ();
new_parent"imp518" handle Fail _ => ();
open_theory"test_proofs";
val test_proof_thms = all_cn_make_script_support "test_proofs";
=TEX
=SML
set_pc"cn1";
=TEX
First the native stuff in ``cn1'', then the new proof context.
=SML
store_mt_results
mt_run [
	("cn_∈_type_tac 1",
	tac_solve (REPEAT strip_tac THEN cn_∈_type_tac[]),
	([],ⓩX ∈ BOOLEAN ⇒ not X ∈ BOOLEAN⌝),
	true),
	("cn_∈_type_tac 2",
	tac_solve (REPEAT strip_tac THEN cn_∈_type_tac[]),
	([],ⓩX ∈ BOOLEAN ∧ Y ∈ BOOLEAN ⇒ not X and Y ∈ BOOLEAN⌝),
	true),
	("cn_∈_type_tac 3",
	tac_solve  (REPEAT strip_tac THEN PC_T1 "test_proofs" cn_∈_type_tac[]),
	([],ⓩX ∈ BOOLEAN ⇒ not X ∈ BOOLEAN⌝),
	true),
	("cn_∈_type_tac 4",
	tac_solve (REPEAT strip_tac THEN PC_T1 "test_proofs" cn_∈_type_tac[]),
	([],ⓩX ∈ BOOLEAN ∧ Y ∈ BOOLEAN ⇒ not X and Y ∈ BOOLEAN⌝),
	true),
	("cn_∈_type_tac 5",
	tac_solve (REPEAT strip_tac THEN PC_T1 "test_proofs" cn_∈_type_tac[]),
	([],ⓩx ∈ ENUM3 ⇒ FUNC2 x ∈ INT4⌝),
	true),
	("cn_∈_type_tac 6",
	tac_solve (REPEAT strip_tac THEN PC_T1 "test_proofs" cn_∈_type_tac[]),
	([],ⓩ∀x : AMB ⦁ (x(42)).Z ∈ BOOLEAN⌝),
	true),
	("cn_∈_type_tac 7",
	tac_solve (REPEAT strip_tac THEN PC_T1 "test_proofs" cn_∈_type_tac[]),
	([],ⓩ∀x : AMB ⦁ (x(42)).Y greater (x(43)).Y ∈ BOOLEAN⌝),
	true),
	("cn_∈_type_tac 8",
	tac_solve (REPEAT strip_tac THEN PC_T1 "test_proofs" cn_∈_type_tac[]),
	([],ⓩ∀x : AMB ⦁ x ⊕ {99 ↦ (X≜A, Y≜255, Z≜TRUE)} ∈ AMB⌝),
	true),
	("cn_∈_type_tac 9",
	tac_solve (REPEAT strip_tac THEN PC_T1 "test_proofs" cn_∈_type_tac[]),
	([],ⓩ∀x : AMB; i : BYTE⦁ (x i) ∈ MARKED_BYTE⌝),
	true),
	("cn_∈_type_tac 10",
	tac_solve (REPEAT strip_tac THEN PC_T1 "test_proofs" cn_∈_type_tac[]),
	([],ⓩ∀x : AMB; i : BYTE⦁ (x ⊕ {99 ↦ (X≜A, Y≜255, Z≜TRUE)})  ∈ AMB⌝),
	true),
	("cn_∈_type_tac 11",
	tac_solve (REPEAT strip_tac THEN PC_T1 "test_proofs" cn_∈_type_tac[]),
	([],ⓩ∀x : 𝕌; y : 𝕌; i : BYTE| x y ∈ AMB ⦁  x y i ∈ MARKED_BYTE ⌝),
	true),
	("cn_∈_type_tac 12",
	tac_solve (REPEAT strip_tac THEN PC_T1 "test_proofs" cn_∈_type_tac[]),
	([],ⓩ27 ∈ BYTE⌝),
	true),
	("cn_∈_type_tac 13",
	tac_solve (REPEAT strip_tac THEN PC_T1 "test_proofs" cn_∈_type_tac[]),
	([],ⓩ(1,2,3) ∈ BYTE × BYTE × BYTE⌝),
	true),
	("cn_∈_type_tac 14",
	tac_solve (REPEAT strip_tac THEN PC_T1 "test_proofs" cn_∈_type_tac[]),
	([],ⓩ(X≜A,Y≜2,Z≜TRUE) ∈ MARKED_BYTE⌝),
	true),
	("cn_∈_type_tac 15",
	tac_solve (REPEAT strip_tac THEN PC_T1 "test_proofs" cn_∈_type_tac[]),
	([],ⓩ(X≜A,Y≜2,Z≜TRUE).Z and TRUE ∈ BOOLEAN⌝),
	true),
	("cn_∈_type_tac 16",
	tac_solve (REPEAT strip_tac THEN PC_T1 "test_proofs" cn_∈_type_tac[]),
	([],ⓩ(FALSE,2,3,4,5).1 and FALSE ∈ BOOLEAN⌝),
	true),
	("cn_∈_type_tac 17",
	tac_solve (REPEAT strip_tac THEN PC_T1 "test_proofs" cn_∈_type_tac[]),
	([],ⓩINT4vFIRST ∈ BIT⌝),
	true),
	("cn_∈_type_tac 18",
	tac_solve (REPEAT strip_tac THEN PC_T1 "test_proofs" cn_∈_type_tac[]),
	([],ⓩ3 ∈ INT4⌝),
	true)

];
=TEX


\section{SUMMARY OF RESULTS}
=SML
diag_string(summarize_mt_results());
=TEX

\end{document}


=IGN
********************************************************************************
int502.doc: this file is part of the PPDaz system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% ℤ $Date: 2006/09/18 17:02:29 $ $Revision: 1.61 $ $RCSfile: int502.doc,v $
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

\def\Title{Bugfix Tests}

\def\AbstractText{This document contains tests for fixes to bugs in the Compliance Tool.}

\def\Reference{ISS/HAT/DAZ/INT502}

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
%% LaTeX2e port: \TPPtitle{Bugfix Tests}  %% Mandatory field
%% LaTeX2e port: \TPPref{ISS/HAT/DAZ/INT502}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.61 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2006/09/18 17:02:29 $%
%% LaTeX2e port: }}  %% Mandatory field (with sensible default)
%% LaTeX2e port: \TPPstatus{Informal}
%% LaTeX2e port: %\TPPstatus{Informal}
%% LaTeX2e port: \TPPtype{Technical}
%% LaTeX2e port: %\TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{R.D.~Arthan & HAT Team}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{D.J.~King & WIN01}
%% LaTeX2e port: \TPPabstract{%
%% LaTeX2e port: This document contains tests for fixes to bugs in the Compliance Tool.
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
\item[Issues 1.1 (1994/11/25)-1.17 (1997/03/12)] Drafts as bugs are fixed.
\item[Issue 1.18 (1997/04/10)] Changes to allow changes of IUCT project WP6 to be used.
\item [Issue 1.19 (1997/04/11)] Added bug tests from dra290896.uue, and Praxis Enhancement 8.
\item[Issue 1.20 (1997/04/16)-1.23 (1997/04/23)] Bug fixing changes.
\item[Issue 1.24 (1997/05/01)] Added bug.6.1.
\item[Issue 1.26 (1997/05/22)] Changed to one compilation unit per script.
\item[Issue 1.27 (1997/05/30)] Test for renaming spec. problem.
\item[Issue 1.29 (1997/06/13)] Changes resulting from WP 2 and WP 7.
\item[Issue 1.30 (1997/07/07)] Corrected test of way warning VC messages are stored.
\item[Issue 1.31 (1997/07/09)] Added some tests of issues from DERA.
\item[Issue 1.32 (1997/07/21)] Changes for IUCT WP 4.
\item[Issue 1.33 (1997/08/05)] Corrected test for bug.5.6 now the issue has been resolved.
Clered up knock-on problems and added tests for fix to clash-checking.
\item[Issue 1.34 (1997/08/12)] Allowed for fix of bug 6.6 under additional IUCT changes.
\item[Issue 1.35 (2000/06/20)] Updates to allow for June 2000 enhancements (which change some
small details of error messages).
\item[Issue 1.36 (2000/10/25)] CTLE II R2/1: global variable unsoundness.
\item[Issue 1.37 (2000/10/31)] CTLE II R1/1: real types: tests 3.8 and 3.9 do not fail now.
\item[Issue 1.38 (2002/03/01)] New symbol for informal expansion of statement labels.
\item[Issues 1.39 (2002/03/21), 1.40 (2002/03/22)] Allowed for minor changes to the error handling in the SPARK output functions.
\item[Issue 1.41 (2002/05/05)] Allowed for new rules for redeclaration of procedures.
\item[Issue 1.42 (2002/08/23)] Removed use of ICL logo font.
\item[Issue 1.43 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.44 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.45 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.46 (2002/12/17)] Arbitrary Ada replacements no longer give rise to message VCs.
\item[Issue 1.47 (2003/07/17)] Allowed for fixes to treatment of global variabls in schema-as-predicates
in {\ProductZ}.
\item[Issue 1.48 (2004/02/07)] The SPARK program is now referred to as the Ada program.
\item[Issue 1.49 (2004/07/17)] Made last test (which is actually redundant and not checked) not fail with the new environments.
\item[Issue 1.50 (2004/09/06)] Accommodated change to treatment of subprogram declarations in Ada output function.
\item[Issue 1.51 (2004/10/09)] Bug 2.25 is no longer a bug: k-slots are allowed after using declarations now.
\item[Issue 1.52 (2005/05/28)] Compliance Notation reserved words are now prefixed by a dollar sign.
\item[Issue 1.53 (2006/03/22)] Allowing for enhancements 117 and 118.
\item[Issue 1.54 (2006/03/28)] Allowed for automated state management.
\item[Issue 1.55 (2006/03/28)] Further allowance for enhancement 118.
\item[Issue 1.56 (2006/04/07)] Allowed for insistence on canonical names in Z under enhancement 117
\item[Issue 1.57 (2006/04/11)] Allowed for new uniform checks on Z names
\item[Issue 1.58 (2006/06/01)] accommodated enhancement 139 - 1-theory-per-subprogram.
\item[Issue 1.59 (2006/09/16)] Allowed for new {\em open\_scope} command.
\item[Issue 1.60 (2006/09/18)] Removed test case that can no longer be reproduced.
\item[Issue 1.61 (2006/09/18)] Tidied usage of {\em new\_script}.
\item[Issue 1.62 (2006/09/19)] Allowed for enhancement 165.
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
This document contains test data for the Compliance Tool as specified in \cite{ISS/HAT/DAZ/HLD502} and \cite{ISS/HAT/DAZ/USR502}.
\subsection{Introduction}
This document contains specific tests to check fixes to bugs in the Compliance Tool.

Remark the ``batches'' mentioned here correspond to the bug lists which DRA maintain for each version of the tool they receive.

\section{PRELIMINARIES}

\section{BATCH 1 (V0.5) - 30/3/95}
See file {\tt drabugs300395.uue} in the project SCCS directory.

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
Functions for recording some statistics of theories.

=SML
type theory_stats = {np : int, ng : int, na : int, nd : int, nc : int};
local
    fun noof_parents thy = (length o get_parents) thy;
    fun noof_global thy = (length o get_consts) thy;
    fun noof_axioms thy = (length o get_axioms) thy;
    fun noof_defns thy = (length o get_defns) thy;
    fun noof_conjectures thy = (length o get_conjectures) thy;
in
    fun get_theory_stats (thy : string) : theory_stats =
    let
        val np = noof_parents thy;
        val ng = noof_global thy;
        val na = noof_axioms thy;
        val nd = noof_defns thy;
        val nc = noof_conjectures thy;
    in
        {np = np, ng = ng, na = na, nd = nd, nc = nc}
    end;
end;
=TEX
The following function is a convenience in cases where we just want to
test that something fails without working out exactly what the
error message is:
=SML
fun check_fail (f: unit -> unit) : bool = (
		(f (); false)
	handle Fail msg => (
		diag_line (get_message_text msg);
		true
	)
);
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 1.1}
Documentary --- no test.
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 1.2}
Tested in \cite{ISS/HAT/DAZ/INT504}
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 1.3}
This bug is essentially cosmetic.
The following script exhibits the two sorts of required behaviour, but
it can only be checked by examnining the log.
=SML
clean_up();
new_script{name = "P", unit_type="proc"};
ⓈCN
procedure P is
	procedure proc_without_spec is separate;
	procedure proc_with_spec Δ [true] is separate;
	function func_without_spec (x: integer) return integer is separate;
	function func_with_spec (x: integer) return integer Ξ [true] is separate;
begin
    null;
end P;
■
=SML
CNAdaOutput.print_ada_program1();
CNAdaOutput.print_web_clause (!CNZGenerator.diag_web_clause);
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 1.4}
Concerns wording of two error messages:
=SML
get_error_message 505060 ["X"];
get_error_message 505064 ["A, B, C", "X"];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 1.5}
The following should not give a syntax error:
=SML
clean_up();
new_script{name = "P", unit_type="proc"};
fun bug_1_5 () =
ⓈCN
procedure P is
   ⟨ Declarations ⟩          (1)
begin
   ⟨ Initialisation ⟩        (2)
   loop
      ⟨ Body ⟩          (3)
   end loop;
end P;
■
=SML
store_mt_results_show mt_run [
    ("bug.1.5.1", bug_1_5, (), ())
];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 1.6}
This test has been withdrawn, since it depended on
another bug, now fixed, to generate the test case.
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 1.7}
The following will need correcting if someone changes the ProofPower-Z misfeature
whereby use of the schema $T$ below as a predicate does not bind
the global variable $O$.
(In which event, the example should just work).
=SML
clean_up();
new_script{name = "P", unit_type="proc"};
ⓈCN
procedure P is
    ⟨ Declarations ⟩ (1)
begin
    ⟨ Initialisation ⟩ (2)
    ⟨ Loop ⟩ (3)
end P;
■
ⓈCN
(1) ≡
 type S is range 0 .. 7;
 I : constant S := 0;
 O : constant S := 4;
 STATE : S;
■
┌ T ───────────
│ STATE : S;
│ O : ℤ
├──────
│ STATE = I ∧ O > STATE
└─────────────

ⓈCN
(2) !⊑ Δ STATE [T]      (4)
■
ⓈCN
(4) ⊑ STATE := I;
■
=TEX
Now that the treatment of global variables appearing free in the signatures
of schemas-as-predicates has been done properly, we should get a provable
VC in this example.
=SML
set_pc"cn1";
set_goal([], get_conjecture "-" "vc4_1");
a(rewrite_tac[z_get_specⓩO⌝, z_get_specⓩT⌝, z_get_specⓩI⌝, z_get_specⓩS⌝]);
store_mt_results_show mt_run [
    ("bug.1.7.1",  (fn () => (pop_thm(); ())), (), ())
];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 1.8}
Tested in \cite{ISS/HAT/DAZ/INT503}
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 1.9}
=SML
clean_up();
new_script{name = "P", unit_type="proc"};
ⓈCN
procedure P is
    X : INTEGER;
    procedure Q (Y : in out INTEGER)
    Δ Y [ Y = Y⋎0 + 2 ]
    is
    begin
        Y := Y + 2;
    end Q;
begin
     Δ X [X = X⋎0 + 6] (1)
end P;
■
ⓈCN
 (1) ⊑
        Q(X);
        X := X + 4;
■
The following gives some evidence that the Xs have been substituted for the Ys.
=SML
fun ok_1_9 () = (
	let 	val vs = (map fst o term_vars o get_conjecture "P'proc") "vc1_2";
	in	not ("Y⋎0" mem vs orelse "Y" mem vs)
	end
);
=SML
store_mt_results_show mt_run [
    ("bug.1.9.1", ok_1_9, (), true)
];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 1.10}
Not fixed.
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 1.11}
=SML
clean_up();
new_script{name = "Q", unit_type="proc"};
ⓈCN
procedure Q is
    type D is (THU, FRI, SAT);
    type A1 is array (D) of D;
    type A2 is array (D) of A1;
    A : A2;
begin
    Δ A [A(THU)(SAT) = FRI]        (9)
end Q;
■
Following should not crash:
=SML
fun bug_1_11 () =
ⓈCN
(9) ⊑ A(THU)(SAT) := FRI;
■
=SML
store_mt_results_show mt_run [
    ("bug.1.11", bug_1_11, (), ())
];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 1.12}
=SML
clean_up();
new_script{name = "PACK", unit_type="spec"};

ⓈCN
package PACK is
     type REC is
     record
        X : INTEGER;
        Y : INTEGER;
     end record;
end PACK;
■
=SML
new_script{name = "P", unit_type="proc"};

fun bug_1_12 () =
ⓈCN
with PACK;
procedure P is
begin
   null;
end P;
■
=SML
store_mt_results_show mt_run [
    ("bug.1.12", bug_1_12, (), ())
];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 1.13}
=SML
clean_up();
new_script{name = "P", unit_type="proc"};

ⓈCN
procedure P is
   type DAY is (MON, TUE, WED, THU, FRI);
   D : DAY;
begin
   for I in DAY
   loop
      Δ D [D = I]            (1)
   end loop;
end P;
■
ⓈCN
(1) ⊑ D := I;
■
The following gives some evidence that the VC is as required.
=SML
fun ok_1_13 () = (
	let 	val vs = (map fst o term_consts o get_conjecture "P'proc") "vc1_1";
	in	"z'DAY" mem vs andalso not ("z'INTEGER" mem vs)
	end
);
=SML
store_mt_results_show mt_run [
    ("bug.1.13.1", ok_1_13, (), true)
];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 1.14}
Bug in xpp, not the Compliance Tool (check by inspection of templates help).
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 1.15}
Documentary.
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 1.16}
=SML
clean_up();
new_script{name = "XYZ", unit_type="proc"};
ⓈZ
│ [A]
■
Printing Z document should not crash:
=SML
store_mt_results_show mt_run [
    ("bug.1.16.1", output_z_document,
		{script="XYZ'proc", out_file="int502.1.16.zed"}, ())
];
=TEX
Reloading Z document should give similar theory:
=SML
val bug_1_16_stats = get_theory_stats "XYZ'proc";
clean_up();
use_file"int502.1.16.zed";
store_mt_results_show mt_run [
    ("bug.1.16.2", get_theory_stats ,"XYZ'proc", bug_1_16_stats)
];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 1.17}
The following test is a bit more demanding than the failure case supplied by DRA.
=SML
clean_up();
new_script{name = "XYZ", unit_type="proc"};
┌ S ───────────
│ a : ℕ
└──────────────

┌ T ───────────
│ S
└──────────────

┌ V ───────────
│ S!
└──────────────
ⓈZ
[A]
■
┌ W[X, Y] ───────────
│ x, x':X;
│ y, y' : Y;
│ S
├──────────
│ #{x, x'} ≤ a ∧ #{y, y'} ≥ a
└──────────────
╒[ X ]═══════════
│ x, y : X
├──────
│ (∃a, b: X ⦁ a ≠ b) ⇒ x ≠ y
└──────────────
┌ WW[X, Y] ───────────
│ x, x?:X;
│ y, y? : Y;
│ S!
├──────────
│ #{x, x?} ≤ a! ∧ #{y, y?} ≥ a!
└──────────────
┌ QQ[X, Y] ───────────
│ ab : X ; bc : Y
└──────────────
╒[ X , Y]═══════════
│ QQ[X, Y]
└──────────────
ⓈZAX
│ S
■
┌ RR[X, Y] ───────────
│ abc : X ; bcd : Y
└──────────────
ⓈZ
│ Tree ::= AA (ℕ) | BB (Tree × Tree)
■
Printing Z document should not crash:
=SML
store_mt_results_show mt_run [
    ("bug.1.17.1", output_z_document,
		{script="XYZ'proc", out_file="int502.1.17.zed"}, ())
];
=TEX
Reloading Z document should give similar theory:
=SML
val bug_1_17_stats = get_theory_stats "XYZ'proc";
clean_up();
use_file"int502.1.17.zed";
store_mt_results_show mt_run [
    ("bug.1.17.2", get_theory_stats ,"XYZ'proc", bug_1_17_stats)
];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 1.18}
=SML
clean_up();
new_script{name = "XYZ", unit_type="proc"};
╒[X]═══════════
│ x : X
└──────────────
Printing Z document should not crash:
=SML
store_mt_results_show mt_run [
    ("bug.1.18.1", output_z_document,
		{script="XYZ'proc", out_file="int502.1.18.zed"}, ())
];
=TEX
Reloading Z document should give similar theory:
=SML
val bug_1_18_stats = get_theory_stats "XYZ'proc";
clean_up();
use_file"int502.1.18.zed";
store_mt_results_show mt_run [
    ("bug.1.18.2", get_theory_stats ,"XYZ'proc", bug_1_18_stats)
];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 1.19}
=SML
clean_up();
new_script{name = "PACK", unit_type="spec"};

ⓈCN
package PACK is
   type INT_TYPE is range 5 .. 90;
   X : INT_TYPE;
end PACK;
■
The following should not crash:
=SML
new_script{name = "MAIN", unit_type="proc"};

fun bug_1_19 () =
ⓈCN
with PACK;
procedure MAIN
Δ PACKoX [PACKoX = 45]
is
begin
   PACK.X := 45;
end MAIN;
■
=IGN
PolyML.exception_trace bug_1_19;
=SML
store_mt_results_show mt_run [
    ("bug.1.19.1", bug_1_19, (), ())
];
=TEX
\section{BATCH 2 (V0.5.1) - 13/9/95}
See file {\tt drabugs201095.uue} in the project SCCS directory.
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 2.1}
=SML
clean_up();
new_script{name = "P", unit_type="proc"};
=TEX
The following should not crash:
=SML
ⓈCN
procedure P is
    function F (X : INTEGER; Y : INTEGER; Z : INTEGER) return INTEGER is
    begin
        return 5;
    end F;
begin
    null;
end P;
■
=SML
new_script{name = "Q", unit_type="proc"};

fun bug_2_1 () =
ⓈCN
procedure Q is
    type rec is record XYZ : INTEGER; ABC : INTEGER; end record;
begin
    null;
end Q;
■

=SML
store_mt_results_show mt_run [
    ("bug.2.1.1", bug_2_1, (), ())
];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 2.2}
=SML
clean_up();
new_script{name = "P", unit_type="proc"};
=TEX	
ⓈCN
procedure P is
    function F (X, Y : INTEGER) return INTEGER
    Ξ [F(X, Y) = F(X, Y)]
 is
    begin
        return 5;
    end F;
begin
    null;
end P;
■
=SML
fun chk_2_2 () = type_ofⓩF⌝ =: type_ofⓩ(_+_)⌝;
store_mt_results_show mt_run [
    ("bug.2.2.1", chk_2_2, (), true)
];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 2.3}
=SML
clean_up();
new_script{name = "PACK1", unit_type="spec"};
=TEX	
ⓈCN
package PACK1 is
    C: constant INTEGER := 20;
    procedure P (Y : out INTEGER)
    Δ Y [Y = PACK1oC];
    function F (X : INTEGER) return INTEGER
    Ξ [PACK1oF(X) = 99 + PACK1oC];
end PACK1;
■
=SML
new_script{name = "MAIN", unit_type="proc"};
ⓈCN
with PACK1;
procedure MAIN is
    X : INTEGER;
begin
    Δ X [ X = 20]
end MAIN;
■
=SML
fun bug_2_3_1 () =
ⓈCN
  ⊑ PACK1.P(X);
■
=SML
store_mt_results_show mt_run [
    ("bug.2.3.1", bug_2_3_1, (), ())
];
=TEX
=SML
set_goal([], get_conjecture"-" "vc_1_2");
a(rewrite_tac[get_specⓩPACK1oC⌝] THEN REPEAT strip_tac);
fun bug_2_3_2 () = (pop_thm(); ());
=SML
store_mt_results_show mt_run [
    ("bug.2.3.2", bug_2_3_2, (), ())
];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 2.4}
=SML
clean_up();
new_script{name = "PACK", unit_type="spec"};

ⓈCN
package PACK is
   type INT is range 10 .. 20;
end PACK;
■
=SML
output_z_document{script="-", out_file="int502a.zed"};
new_script{name = "MAIN", unit_type="proc"};

ⓈCN
with PACK;
procedure MAIN is
    function ">=" (left, right : PACK.INT) return BOOLEAN renames PACK.">=";
    I : PACK.INT;
begin
    Δ I [I ≥ 15]
end MAIN;
■

ⓈCN
⊑ if I >= 15
   then null;
   else I := 16;
   end if;
■
=SML
output_z_document{script="-", out_file="int502b.zed"};
clean_up();
fun bug_2_4 () = (use_file"int502a.zed"; use_file"int502b.zed");
=SML
store_mt_results_show mt_run [
    ("bug.2.4.1", bug_2_4, (), ())
];
=TEX

% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 2.5}
=SML
clean_up();
new_script{name = "P", unit_type="proc"};
=TEX	
ⓈCN
procedure P is
     type UNCON is array (INTEGER range <>) of INTEGER;
     subtype SUB is INTEGER range 1 .. 10;
     subtype ARR is UNCON (SUB);
begin
     null;
end P;
■
=SML
CNAdaOutput.print_ada_program1();
=TEX
Check that the brackets in the declaration of $ARR$ are present in the log.
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 2.6}
=SML
clean_up();
new_script{name = "P", unit_type="proc"};
=TEX
=SML	
fun bug_2_6 () =
ⓈCN
procedure P is
    type REC is
    record
        X : INTEGER;
        Y : INTEGER;
    end record;
    C : constant REC := REC'(67, 89);
    D : constant INTEGER := C.X + 9;
begin
    null;
end P;
■
=SML
store_mt_results_show mt_run [
    ("bug.2.6.1", bug_2_6, (), ())
];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 2.7}
=SML
clean_up();
new_script{name = "XYZ", unit_type="proc"};
=SML
ⓈZ
	true
■
=SML
fun bug_2_7 () = print_z_document"-";
store_mt_results_show mt_run [
    ("bug.2.7", bug_2_7, (), ())
];
=TEX	
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 2.8}
=SML
clean_up();
new_script{name = "P", unit_type="proc"};

=SML
fun bug_2_8 () =
ⓈCN
procedure P is
    type INT is range 8 .. 10;
    type CHAR_ARRAY is array (INT) of CHARACTER;
    C : CHAR_ARRAY;
begin
    C := CHAR_ARRAY'('e', 'j', 'f' );
    NULL;
end P;
■
=SML
store_mt_results_show mt_run [
    ("bug.2.8.1", bug_2_8, (), ())
];
=TEX	
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 2.9}
=SML
clean_up();
new_script{name = "P", unit_type="proc"};

=SML
ⓈCN
procedure P is
    type INT is range 8 .. 10;
    I : constant INT := INT'(9);
begin
    null;
end P;
■
=SML
fun bug_2_9 () = (prove_rule[z_get_specⓩI⌝] ⓩI = 9⌝; ());
store_mt_results_show mt_run [
    ("bug.2.9.1", bug_2_9, (), ())
];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 2.10}
=SML
clean_up();
new_script{name = "P", unit_type="proc"};
=TEX	
ⓈCN
procedure P is
begin
    for I in INTEGER range 1 .. 10
    $till ⟦ I = 7 ⟧
    loop
         Δ [true]         (1)
    end loop;
end P;
■

ⓈCN
(1) ⊑ exit when I = 8;
■
=SML
fun chk_2_10 () = (
	let val (_, _, tm) = dest_z_∀(get_conjecture "-" "vc1_1");
	in	tm =$ ⓩI = 7⌝
	end
);
store_mt_results_show mt_run [
    ("bug.2.10.1", chk_2_10, (), true)
];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 2.11}
=SML
clean_up();
new_script{name = "P", unit_type="proc"};
=TEX	
ⓈCN
procedure P is
begin
    for I in INTEGER range 1 .. 10
    $till ⟦ I = 7 ⟧
    loop
         Δ [true]         (1)
    end loop;
end P;
■

=SML
fun bug_2_11 () =
ⓈCN
(1) ⊑ if I = 8 then exit; end if;
■
=SML
store_mt_results_show mt_run [
    ("bug.2.11.1", bug_2_11, (), ())
];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 2.12}
Documentary errors in usr501, now fixed.

% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 2.13}
=SML
clean_up();
new_script{name = "P", unit_type="proc"};
=TEX	
ⓈCN
procedure P is
    X : INTEGER;
begin
    Δ X [X = 8]         (1)
end P;
■

=SML
fun bug_2_13 () = (
ⓈCN
(1) ⊑ X := 8;
 ⟨ statement ⟩			(2)
■
=SML
false
) handle Fail _ => true;
=SML
store_mt_results_show mt_run [
    ("bug.2.13.1", bug_2_13, (), true)
];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 2.14}
=SML
clean_up();
new_script{name = "P", unit_type="proc"};
ⓈCN
procedure P is
    type REC is record
        C : INTEGER;
        B : INTEGER;
        A : INTEGER;
    end record;
    R : REC;

begin
    Δ R [R.A = 11]
end P;
■

ⓈCN
 ⊑ R := REC'(11, 99, 5);
■
=SML
fun chk_2_14 () = (
	(snd o dest_eq o concl o rewrite_conv[] o get_conjecture"-")"vc_1_1"
	=$ mk_f
);
=SML
store_mt_results_show mt_run [
    ("bug.2.14.1", chk_2_14, (), true)
];
=TEX	
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 2.15}
=SML
clean_up();
new_script{name = "P", unit_type="proc"};
ⓈCN
procedure P is
     ⟨Decs⟩ (1)
     procedure Q is
      T1 : INTEGER;
     begin null; end Q;
begin
     null;
end P;
■
ⓈCN
 (1) ≡ T1 : INTEGER;
■
=SML
fun chk_2_15 () = (print_ada_program"-"; false) handle Fail _ => true;
=SML
store_mt_results_show mt_run [
    ("bug.2.15.1", chk_2_15, (), true)
];
=TEX
=SML
clean_up();
new_script{name = "P", unit_type="proc"};
ⓈCN
procedure P is
     ⟨Decs⟩ (1)
begin
    for i in INTEGER range 1 .. 3
    loop
	Δ [true] (2)
    end loop;
end P;
■
ⓈCN
 (2) ⊑ NULL;
■
ⓈCN
 (1) ≡ i : INTEGER;
■
=SML
store_mt_results_show mt_run [
    ("bug.2.15.2", chk_2_15, (), true)
];
=TEX
=SML
clean_up();
new_script{name = "P", unit_type="proc"};

ⓈCN
procedure P is
     type T1 is range 10 .. 20;
     type T2 is range 30 .. 40;
     X : T1;
     procedure Q (X : in out T2)
     Δ X [X = X⋎0 + 5]
     is
     begin
         X := X + 8;
     end Q;
begin
     null;
end P;
■
=SML
store_mt_results_show mt_run [
    ("bug.2.15.3", chk_2_15, (), true)
];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 2.16}
=SML
clean_up();
new_script{name = "PACK", unit_type="spec"};
ⓈCN
package PACK is
     V : INTEGER;
end PACK;
■
=SML
new_script{name = "MAIN", unit_type="proc"};

ⓈCN
with PACK;
procedure MAIN is
     A : INTEGER;
begin
     Δ A [A = 8]
end MAIN;
■
=SML
fun bug_2_16_1 () =
ⓈCN
⊑ A := PACK.V;
■
=SML
store_mt_results_show mt_run [
    ("bug.2.16.1", bug_2_16_1, (), ())
];
=SML
clean_up();
new_script{name = "PACK", unit_type="spec"};

ⓈCN
package PACK is
     V : INTEGER;
end PACK;
■
=SML
new_script{name = "MAIN", unit_type="proc"};

ⓈCN
with PACK;
procedure MAIN is
     A : INTEGER;
begin
     Δ A, PACKoV [A = 8]
end MAIN;
■

=SML
fun bug_2_16_2_1 () =
ⓈCN
⊑ PACK.V := 8;
   A := PACK.V;
■
=SML
fun bug_2_16_2_2() =
	(pc_rule1"cn" prove_rule[] (get_conjecture"-""vc_1_1"); ());
=TEX
=SML
store_mt_results_show mt_run [
    ("bug.2.16.2.1", bug_2_16_2_1, (), ()),
    ("bug.2.16.2.2", bug_2_16_2_2, (), ())
];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 2.17}
=SML
clean_up();
new_script{name = "F", unit_type="func"};
ⓈZAX
│ f : ℤ → ℤ
├──────
│ ∀i:ℤ⦁f i = 0
■

ⓈCN
 function F (X : INTEGER) return INTEGER
 Ξ  [F(X) = f(X)]
 is
  begin
    return 0;
  end F;
■
=SML
fun bug_2_17() =
	(pc_rule1"cn"prove_rule[z_get_specⓩf⌝](get_conjecture"-""vcF_1");());
=TEX
=SML
store_mt_results_show mt_run [
    ("F'func", bug_2_17, (), ())
];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 2.18}
=SML
clean_up();
new_script{name = "TEST", unit_type="proc"};
ⓈCN
 procedure TEST is
    X : INTEGER;
 begin
    for I in INTEGER
    loop
       Δ X [ X = 7 ]
    end loop;
 end TEST;
■

ⓈCN
 ⊑ X := X + 9;
■
=SML
fun chk_2_18 () = (
	let	val (decl, _,_) = dest_z_∀(get_conjecture"-""vc_1_1");
	in	length (dest_z_decl decl) = 1
	end
);
=TEX
=SML
store_mt_results_show mt_run [
    ("bug.2.18.1", chk_2_18, (), true)
];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 2.19}
=SML
clean_up();
new_script{name = "P", unit_type="proc"};

ⓈCN
procedure P is
   X : INTEGER;
begin
   Δ X [X = 7]
end P;
■

=SML
fun bug_2_19 () =
ⓈCN
⊑ X := INTEGER'PRED(8);
■
=TEX
=SML
store_mt_results_show mt_run [
    ("bug.2.19.1", bug_2_19, (), ())
];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 2.20}
=SML
clean_up();
new_script{name = "P", unit_type="proc"};
ⓈCN
 procedure P is
    type REC is
    record
        X : INTEGER;
        Y : INTEGER;
    end record;
    for REC use
    record at mod 2;
        X at 0 range 0 .. 7;
        Y at 1 range 0 .. 7;
    end record;
    R : REC;
begin
    null;
end P;
■
=SML
fun bug_2_20 () = CNAdaOutput.print_ada_program1();
=SML
store_mt_results_show mt_run [
    ("bug.2.20.1", bug_2_20, (), ())
];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 2.21}
=SML
clean_up();
new_script{name = "XYZ", unit_type="proc"};

┌ S ───────────
│ y : ℕ
├──────
│ y = 7
└──────────────

=SML
fun bug_2_21 () =
ⓈZAX
│ x : ℤ
├─────────────────
│ S
■
=SML
fun chk_2_21 () = (
	set_flag("standard_z_paras", true);
	(bug_2_21(); false) handle Fail _ => true
);
store_mt_results_show mt_run [
    ("bug.2.21", chk_2_21, (), true)
];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 2.22}
=SML
clean_up();
new_script{name = "PACK", unit_type="spec"};

ⓈCN
package PACK is
   type COLOUR is (RED, BLUE, GREEN);
   X : COLOUR;
   procedure P
   Δ PACKoX [∀ C : PACKoCOLOUR ⦁ true];
end PACK;
■
=SML
new_script{name = "P", unit_type="proc"};

ⓈCN
with PACK;
procedure P is
    Y : PACK.COLOUR;
begin
    Δ PACKoX, Y [Y = PACKoGREEN]         (1)
end P;
■

=SML
fun bug_2_22 () =
ⓈCN
(1) ⊑ PACK.P;
■
=SML
store_mt_results_show mt_run [
    ("bug.2.22.1", bug_2_22, (), ())
];
=TEX
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 2.23}
=SML
clean_up();
new_script{name = "STACKS", unit_type="spec"};
ⓈCN
package STACKS is

    subtype STACK_RANGE is INTEGER range 1 .. 10;
    type STACK_TYPE is array (STACK_RANGE) of INTEGER;
    subtype TOP_RANGE is INTEGER range 0 .. 10;
    type STACK is
    record
        ST : STACK_TYPE;
        TOP : TOP_RANGE;
    end record;

    procedure CLEAR_STACK (S : in out STACK)
    Δ S [S.TOP = 0];

end STACKS;
■
=SML
new_script{name = "MAIN", unit_type="proc"};
fun bug_2_23_1() =
ⓈCN
with STACKS;
procedure MAIN is
    S : STACKS.STACK;
begin
    Δ S [true]      (1)
end MAIN;
■
=SML
store_mt_results_show mt_run [
    ("STACKS'spec", bug_2_23_1, (), ())
];
=SML
clean_up();
new_script{name = "STACKS", unit_type="spec"};
ⓈCN
package STACKS is

    subtype STACK_RANGE is INTEGER range 1 .. 10;
    type STACK_TYPE is array (STACK_RANGE) of INTEGER;
    subtype TOP_RANGE is INTEGER range 0 .. 10;
    type STACK is
    record
        ST : STACK_TYPE;
        TOP : TOP_RANGE;
    end record;

    S : STACK;

    procedure CLEAR_STACK
    Δ STACKSoS [STACKSoS.TOP = 0];

end STACKS;
■

=SML
new_script{name = "P", unit_type="proc"};
fun bug_2_23_2_1() =
ⓈCN
with STACKS;
procedure P
Δ STACKSoS [ STACKSoS.TOP + 1 = 1 ]
is
begin
    STACKS.CLEAR_STACK;
end P;
■
=SML
fun bug_2_23_2_2 () = (
	map (pc_rule1 "cn" prove_rule[] o snd o snd) (get_conjectures"-"); ()
);
=SML
store_mt_results_show mt_run [
    ("bug.2.23.2.1", bug_2_23_2_1, (), ()),
    ("bug.2.23.2.2", bug_2_23_2_2, (), ())
];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 2.24}
(from {\tt drabugs061195.uue})
Cannot reproduce error.
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 2.25}
(Bugs 2.25 to 2.29 from {\tt drabugs141295.uue})
Fixed by changes elsewhere.

This is no longer a bug: k-slots are allowed after using declarations now.
=SML
clean_up();
new_script{name = "P", unit_type="spec"};

ⓈCN
package P is
   $auxiliary s : ℤ;
   X : INTEGER;
end P;
■

=SML
new_script{name = "P", unit_type="body"};
fun bug_2_25 () =
ⓈCN
package body P is
   $using A : INTEGER;
   $implement s $by true;
   ⟨ dec ⟩       (7)
begin
   A := 9;
end P;
■
=SML
fun chk_2_25 () = (
	(bug_2_25(); true) handle Fail _ => false
);
store_mt_results_show mt_run [
    ("bug.2.25.1", chk_2_25, (), true)
];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 2.26}
See Batch 3, bug 2.

=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 2.27}
=SML
clean_up();
new_script{name = "STACK", unit_type="spec"};
ⓈCN
package STACK is

   $auxiliary s : seq ℤ;

   procedure PUSH (X : in INTEGER)
   Δ s [s = s⋎0 ⁀ ⟨X⟩];

   procedure POP (X : out INTEGER)
   Δ X, s [s ≠ ⟨⟩, s⋎0 = s ⁀ ⟨X⟩];

end STACK;
■
=SML
new_script{name = "STACK", unit_type="body"};
fun bug_2_27() =
ⓈCN
package body STACK is

   $using
   subtype STACK_RANGE is INTEGER range 1..10;
   type STACK_TYPE is array (STACK_RANGE) of INTEGER;
   ST : STACK_TYPE;
   subtype TOP_RANGE is INTEGER range 0..10;
   TOP : TOP_RANGE;
   $implement
   s $by (1 .. TOP) ◁ ST = s;

   procedure PUSH (X : in INTEGER)
   Δ ST, TOP [TOP = TOP⋎0 + 1 ∧ ST = ST⋎0 ⊕ {TOP ↦ X}]
   is
   begin
      TOP := TOP + 1;
      ST(TOP) := X;
   end PUSH;

   procedure POP (X : out INTEGER)
   Δ X, ST, TOP [TOP ≠ 0, TOP = TOP⋎0 - 1 ∧ X = ST(TOP⋎0) ∧ ST = ST⋎0]
   is
   begin
      X := ST(TOP);
      TOP := TOP - 1;
   end POP;

begin
   TOP := 0;
end STACK;
■
=SML
store_mt_results_show mt_run [
    ("bug.2.27.1", bug_2_27, (), ())
];
=TEX

% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 2.28}
See Batch 3, bug 3.
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 2.29}
See Batch 3, bug 4.
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\section{Other Bugs Reported}
\subsection{Operator Associativity}
=SML
clean_up();
new_script{name = "P", unit_type="proc"};
ⓈCN
procedure P is
    C: constant INTEGER := 1 - 2 + 3;
    D: constant INTEGER := 1 / 1 * 3;
begin
    null;
end P;
■
=SML
fun chk_op_assoc_1 () = (
	pc_rule1 "cn" prove_rule[z_get_specⓩC⌝,z_get_specⓩD⌝]ⓩC = 2 ∧ D = 3⌝;
	()
);
=SML
store_mt_results_show mt_run [
    ("op.assoc.1",chk_op_assoc_1, (), ())
];
=TEX
\subsection{Overloaded Package Names}
As of issue 1.71, \cite{ISS/HAT/DAZ/IMP510} should reject attempts to declare entities (other than subprograms) whose names overload a package name.
=SML
clean_up();
new_script{name="P", unit_type="spec"};
ⓈCN
 package P is P : integer; end P;
■
=SML
store_mt_results_show mt_run_fail [
    ("bug.1.71.1",print_ada_program, "-",
	gen_fail_msg "soundness_checks" 510003 [])
];
=TEX
=SML
clean_up();
new_script{name="P", unit_type="spec"};
ⓈCN
 package P is procedure Q Δ[true]; end P;
■
=TEX
=SML
new_script{name="P", unit_type="body"};
ⓈCN
 package body P is P : INTEGER; procedure Q is begin null; end Q; end P;
■
=TEX
=SML
store_mt_results_show mt_run_fail [
    ("bug.1.71.2",print_ada_program, "-",
	gen_fail_msg "soundness_checks" 510003 [])
];
=TEX
\section{BATCH 3 (V0.6) - 25/1/96}
See file {\tt drabugs250196.uue} in the project SCCS directory.
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 3.1}
This bug is the same as bug number 8 carried over from batch 2.
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 3.2}
=SML
clean_up();
new_script{name = "TEST", unit_type="proc"};
=TEX
The following should not crash:
ⓈCN
 procedure TEST is
    A : INTEGER;
 begin
    Δ A [A = A⋎0 + 5]     (1)
 end TEST;
■

ⓈCN
 (1) ⊑
 $con A0 : ℤ ⦁ Δ A [A0 = A, A = A0 + 4]    (2)
 Δ A [A = 9]        (3)
■

=SML
fun bug_3_2 () =
ⓈCN
 (3) ⊑ A := 9;
■

=SML
store_mt_results_show mt_run [
    ("bug.3.2.1", bug_3_2, (), ())
];
=TEX
The bug report also says that a VC is wrong here. The fix is not yet tested.
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 3.3}
This was reported as a VC browser problem.
We detect the error here by calling the formatting functions used by the
VC browser.
=SML
clean_up();
new_script{name = "STACK", unit_type="spec"};
=TEX
ⓈCN
package STACK is

   $auxiliary stock : seq ℤ;

   procedure PUSH (X : in INTEGER)
   Δ stock [stock = stock⋎0 ⁀ ⟨X⟩];

   procedure POP (X : out INTEGER)
   Δ X, stock [stock⋎0 = stock ⁀ ⟨X⟩];

end STACK;
■
=SML
=IGN
browse_vcs();
=SML
val displayed_chars = explode (implode
	(CNAdaOutput.strings_from_fmt
		CNAdaOutput.fmt_web_clause
		(!CNZGenerator.diag_web_clause)
));
=TEX
There should be no dots in the above (``stock'' should not be turned into ``st.ck'').
=SML
fun chk_3_3 () = not("." mem displayed_chars);
=SML
store_mt_results_show mt_run [
    ("bug.3.3.1", chk_3_3, (), true)
];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 3.4}
=SML
clean_up();
new_script{name = "BUG3", unit_type="proc"};
=TEX
The following should not crash:

=SML
fun bug_3_4 () =
ⓈCN
procedure BUG3 is

  procedure P1 (X1,X2 : in out Integer)
  Δ X1,X2 [ X1 = X2 ]
  is
  begin
    null;
  end P1;

  procedure P2 (X3,X4 : in out Integer)
    Δ X3,X4
     [ X4 = X3 ]
  is
  begin
    P1 (X3,X4);
  end P2;

begin
  null;
end BUG3;
■
=SML
store_mt_results_show mt_run [
    ("BUG3'proc", bug_3_4, (), ())
];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 3.5}
=SML
clean_up();
new_script{name = "PACK1", unit_type="spec"};
=TEX
ⓈCN
package PACK1 is

  C : constant INTEGER := 10;

end PACK1;
■
=SML
output_z_document{script="-", out_file="int502.zed"};
new_script{name = "PACK2", unit_type="spec"};

ⓈCN
with PACK1;
package PACK2 is

  D : constant INTEGER := PACK1.C;

end PACK2;
■
=SML
output_z_document{script="-", out_file="int502a.zed"};
new_script{name = "P", unit_type="proc"};

ⓈCN
with PACK2;
procedure P is

  X : INTEGER;

begin
  null;
end P;
■
=SML
output_z_document{script="-", out_file="int502b.zed"};
clean_up();
fun bug_3_5 () = (use_file"int502.zed";
	use_file"int502a.zed";
	use_file"int502b.zed");
fun chk_3_5 () = "PACK1'spec" mem get_parents "PACK2'spec";
=SML
store_mt_results_show mt_run [
    ("bug.3.5.1", bug_3_5, (), ())
];
store_mt_results_show mt_run [
    ("bug.3.5.2", chk_3_5, (), true)
];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 3.6}
=SML
clean_up();
new_script{name = "ARBITRARY", unit_type="proc"};
store_mt_results_show mt_run [
    ("bug.3.6.1", print_exception_log, "-", false)
];
=TEX
ⓈCN
procedure ARBITRARY is

  ⟨ nonsense ⟩						(1)
  X : INTEGER;

begin
  null;
end ARBITRARY;
■

ⓈCN
(1) !≡  anything
■
=TEX
A simple check that the warning VC is there is to check for the free variable ``WARNING'' which should occur in it.
=SML
store_mt_results_show mt_run [
    ("bug.3.6.2", print_exception_log, "-", true)
];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 3.7}
This is not a coding error; the documentation should just say that the replacement text in an arbitrary Ada replacement must comprise a sequence of Ada tokens (so string quotes must match).
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 3.8}
=SML
clean_up();
new_script{name = "TEST", unit_type="proc"};
=TEX
ⓈCN
 procedure TEST is
     type REAL is digits 7;
     R : REAL;
     A : INTEGER;
 begin
     Δ A [ A = 9 ]
 end TEST;
■
The following should no longer fail now real types are supported.
=SML
ⓈCN
 ⊑ A := INTEGER(R);
■
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 3.9}
=SML
clean_up();
new_script{name = "PACK", unit_type="spec"};
ⓈCN
package PACK is
   type A is range -10 .. 9;
   type F is delta 0.1 range -100.0 .. 100.0;
   subtype CS is F range -8.0 .. 3.0;
   function CO (T : A) return CS;
end PACK;
■
=TEX
The following should no longer fail because the then-part of the if-statement is using a real number arithmetic operator.
=SML
new_script{name = "PACK", unit_type="body"};
ⓈCN
package body PACK is
   subtype CI is Integer range 0 .. 500;
   type CA is array (CI) of CS;
   CT : constant CA := CA'
     (  0 => 0.8, 500 => 0.0, others => 99.9 );
   function CO (T : A) return CS
   Ξ [ true ]
   is
      W : Natural;
      C : CS;
   begin
      W := Abs(Integer(T));
      if W = 5 then
         C := -CT(CI(17 - W));
      else
         C := CT(CI(W));
      end if;
      return C;
   end CO;
end PACK;
■
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 3.10}
=SML
clean_up();
new_script{name = "TEST", unit_type="proc"};
=TEX
The following should not fail:
=SML
fun bug_3_10 () =
ⓈCN
 procedure TEST is
    type ARR3 is array (INTEGER, INTEGER, INTEGER) of INTEGER;
 begin
    null;
 end TEST;
■
=SML
store_mt_results_show mt_run [
    ("bug.3.10.1", bug_3_10, (), ())
];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 3.11}
=SML
clean_up();
new_script{name = "BUG", unit_type="proc"};
=TEX
ⓈCN
procedure BUG is
   X : SHORT_INTEGER;
begin
   for I in SHORT_INTEGER
   loop
       null;
   end loop;
   for I in SHORT_INTEGER
   loop
       null;
   end loop;
end BUG;
■
No errors should be reported when the SPARK program is printed:
=SML
val bug_3_11 = print_ada_program;
store_mt_results_show mt_run [
    ("BUG'proc", bug_3_11, "-", ())
];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 3.12}
=SML
clean_up();
new_script{name = "THIRTY", unit_type="proc"};
ⓈCN
procedure THIRTY is
   X : INTEGER;
begin
   Δ X [ X = 30 ]    (1)
end THIRTY;
■

ⓈCN
(1) ⊑ X := 0;
       loop
          Δ X [ true ]    (2)
       end loop;
■
=TEX
The following should fail:
=SML
fun bug_3_12 () =
ⓈCN
(2) ⊑ X := X + 1;
       exit when X = 400;
■
=SML
store_mt_results_show mt_run_fail [
    ("THIRTY'proc", bug_3_12, (), gen_fail_msg"check_1_c" 505062 [])
];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 3.13}
From {\tt drabugs130296.doc}.
=SML
clean_up();
new_script{name = "Q", unit_type="proc"};
=TEX
The following should not fail:
=SML
fun bug_3_13() =
ⓈCN
procedure Q is
   subtype SUB is Natural range 0 .. 3;
begin
   null;
end Q;
■
=SML
store_mt_results_show mt_run [
    ("Q'proc", bug_3_13, (), ())
];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 3.14}
From {\tt drabugs130296.doc}.
The fix for this bug is tested in \cite{ISS/HAT/DAZ/INT511}.
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####

\section{BATCH 4 (V0.7) - 9/5/96}
See file {\tt drabugs090596.uue} in the project SCCS directory.
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 4.1}
=SML
clean_up();
new_script{name = "TEST4", unit_type="proc"};
ⓈCN
  procedure Test4
 is
    type Colour is (Red, Blue, Yellow);
    type Palette is array (Colour) of Boolean;
    White : constant Palette := Palette'(others => False);
    Result : Boolean;
    X : Palette;
 begin
  Δ RESULT [ true ]	(4)
 end Test4;
■
=SML
fun bug_4_1 () =
ⓈCN
 (4) ⊑     Result := (X = White);
■
=SML
store_mt_results_show mt_run [
    ("TEST4'proc", bug_4_1, (), ())
];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 4.2}
=SML
clean_up();
new_script{name = "FUN", unit_type="func"};
ⓈCN
function Fun (X : in Integer) return Integer
Ξ [ FUN(X) = 3 ]
is
begin
  Δ [ FUN(X) = 3 ]   (1)
end Fun;
■

ⓈCN
(1) ⊑ return 3;
■
=SML
fun bug_4_2 () = (map
	((fn x => tac_proof(([],x), REPEAT z_strip_tac)) o snd o snd)
	(get_conjectures "-");
	());

store_mt_results_show mt_run [
    ("FUN'func", bug_4_2, (), ())
];

=TEX
All the proofs should succeed if the bug is fixed.
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 4.3}
Also Bug 1 of \Product\ 0.7.1 DRA bugs list.
=SML
clean_up();
new_script{name = "PACK", unit_type="spec"};
ⓈCN
package Pack
is
  subtype SUB is Integer range 5 .. Integer'Last;
end Pack;
■
=SML
new_script{name = "FUN", unit_type="func"};

ⓈCN
with Pack;
function Fun (X : in Integer) return Integer
is
begin
  return 0;
end Fun;
■
=SML
fun bug_4_3 () = (length (get_conjectures "PACK'spec") = 1);
=SML
store_mt_results_show
mt_run [
    ("bug.4.3.1", bug_4_3, (), true)
];

=TEX
There should be a VC that states SUB is non-empty, but up to PP0.7.1 there is none.
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 4.4}
Also Bug 2 of \Product\ 0.7.1 DRA bugs list.
The problem here is that "x" is a free variable.
=SML
clean_up();
new_script{name = "P", unit_type="proc"};
fun bug_4_4 () =
ⓈCN
procedure P
is
  function Fun (X : in Integer) return Integer
  Ξ [ FUN(x) = 7 ]
  is separate;
begin
  null;
end P;
■
=SML
store_mt_results mt_run_fail [
    ("bug.4.4.1", bug_4_4, (),
	gen_fail_msg "z_predexp_of_z_tm" 508019 ["FUN",
	"x"])
];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 4.5}
=SML
clean_up();
new_script{name = "XYZ", unit_type="proc"};

┌ S ────────
│ X : ℤ
├─────────────────
│ X ≥ 0
└─────────────────
=SML
fun bug_4_5 () =
ⓈZ
│ vc4_1 ?⊢
│     ∀ X : ℤ | S ⦁ true
■
=SML
store_mt_results_show mt_run [
    ("bug.4.5", bug_4_5, (), ())
];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 4.6}
Also Bug 3 of \Product\ 0.7.1 DRA bugs list.
=SML
clean_up();
new_script{name = "PACK1", unit_type="spec"};
ⓈCN
package Pack1 is
  $auxiliary PACK1oy : ℤ;
  procedure Read (X : out Integer)
  Δ X Ξ PACK1oy [ X = PACK1oy ];
end Pack1;
■
=SML
new_script{name = "PACK2", unit_type="spec"};

ⓈCN
package Pack2 is
  procedure P (X : out Integer);
end Pack2;
■
=SML
new_script{name = "PACK2", unit_type="body"};

ⓈCN
with Pack1;
package body Pack2 is
  ⟨ ... ⟩			(1)
end Pack2;
■

ⓈCN
(1) ≡  procedure P (X : out Integer)
        Δ X ΞPACK1oy [ X = PACK1oy ]
        is
        begin
           Δ X [ X = PACK1oy ]       (2)
        end P;
■
=SML
open_scope "Pack2.P";
ⓈCN
(2) ⊑ Pack1.Read(X);
■
=SML
fun bug_4_6 () = not(any (mapfilter
		(all_distinct (op =$) o dest_z_decl o (fn (x,_,_) => x) o dest_z_∀ o snd o snd)
		(get_conjectures "-"))
	(not));
=TEX
=SML
store_mt_results_show mt_run [
    ("bug.4.6.1", bug_4_6, (), true)
];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####

\section{BATCH 5 (V0.7.1) - 29/8/96}
See file {\tt drabugs290896.uue} in the project SCCS directory.

Note that bugs 1 to 3 are repeats of bugs in batch 4, and are not restated.
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 5.4}
=SML
clean_up();
new_script{name = "TEST", unit_type="proc"};
ⓈCN
procedure Test is
   V : Integer;
begin
   Δ V [ V = V⋎0 + 2 ]	(1)
end Test;
■

=SML
fun bug_5_4_1 () =
ⓈCN
(1) ⊑  $con vstart : ℤ ⦁ Δ V [ V = vstart - 100, V = vstart + 2 ]	(2)
■
=SML
fun bug_5_4_2 () =
ⓈCN
(2) ⊑  V := V + 102;
■

=TEX
=IGN
The bug in question allowed all the conjectures produced to be provable,
which manifestly they should not be. The first refinement step should in
fact fail.

=SML
store_mt_results_show
mt_run_fail [
    ("bug.5.4.1", bug_5_4_1, (),
	gen_fail_msg "analyse_log_con" 505024 ["ⓩV = vstart - 100⌝"])
];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 5.5}
This is actually bug 1 from Praxis enhancement 8 in \cite{SHOLIS_CNER}.
=SML
clean_up();
new_script{name = "PACK1", unit_type="spec"};
=TEX
=SML
ⓈCN
package Pack1 is
  $auxiliary ava : ℤ;
  procedure Read (X : out Integer)
  Δ X Ξ ava [ X = ava ];
end Pack1;
■
=SML
new_script{name = "PACK2", unit_type="spec"};

ⓈCN
package Pack2 is
  procedure P (X : out Integer);
end Pack2;
■
=SML
new_script{name = "PACK2", unit_type="body"};

ⓈCN
with Pack1;
package body Pack2 is
  ⟨ ... ⟩			(1)
end Pack2;
■

ⓈCN
(1) ≡  procedure P (X : out Integer)
        Δ X Ξ ava [ X = ava ]
        is
        begin
           Δ X [ X = ava ]       (2)
        end P;
■
=TEX
From enhancement 117 (version 2.7.7) on, we expect ```PACK1oava'' not to be present in the first
conjecture, and for its prefixed form `ava'' to be present.
=SML
val thys_5_5 = ["PACK1'spec", "PACK2'spec", "PACK2'body", "PACK2oP'proc"];
val conjs_5_5 = list_mk_∧(map (snd o snd) (flat (map get_conjectures thys_5_5)));

fun bug_5_5 () = (let val names = map fst (term_vars conjs_5_5);
	in
		(not ("PACK1oava" mem names)) andalso ("ava" mem names)
	end);
=TEX
=SML
store_mt_results_show
mt_run [
    ("bug.5.5.1", bug_5_5, (), true)
];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 5.6}
This is actually issue 4, taken as a bug
=SML
clean_up();
new_script{name = "MAIN", unit_type="proc"};
=TEX
ⓈCN
 procedure Main is
   X, Y : Integer;
   procedure P
   Δ Y [ Y = 3 ]
   is
   begin
     Y := 3;
   end P;
   procedure Q
   Δ X, Y [ X = 88 ]
   is
   begin
     P;
     X := 88;
   end Q;
 begin
   Y := 100;
   Δ X [ Y = 100, Y = 100 ]      (1)
 end Main;
■
=SML
fun bug_5_6 () =
ⓈCN
 (1) ⊑ Q;
■

=TEX
=SML
store_mt_results_show
mt_run_fail [
    ("bug.5.6.1", bug_5_6, (),
	gen_fail_msg "check_1_a" 505064 ["X", "X, Y"])
];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 5.7}
This is actually issue 5, taken as a bug.
It is no longer a problem, as unconstrained subtypes are now
legal (WP 7, item 3).
Thus the following should just work (i.e. no parser error at all).
=SML
clean_up();
new_script{name = "MESSAGE", unit_type="proc"};
=TEX
=SML
fun bug_5_7 () =
ⓈCN
 procedure Message is
   subtype Sub is Integer;
 begin
   null;
 end Message;
■

=TEX
=SML
store_mt_results_show mt_run [
    ("MESSAGE'proc", bug_5_7, (),	())
];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 5.8}
This is a bug reported when considering the specification for the IUCT
work.
The problem is that if a procedure from another package is renamed,
then prior to issue 1.127 of \cite{ISS/HAT/DAZ/IMP507} its specification
would not refer to the right package.
=SML
clean_up();
new_script{name = "PACK1", unit_type="spec"};

ⓈCN
package Pack1 is
  type WEEK is range 1 .. 7;
  A : constant WEEK := WEEK'FIRST + 1;
  procedure Align (X : out WEEK)
  Δ X [ X = PACK1oA + 0 ];
end Pack1;
■

=SML
new_script{name = "PACK2", unit_type="spec"};

fun bug_5_8a () =
ⓈCN
with Pack1;
package Pack2 is
  procedure MyAlign (X : out PACK1oWEEK) renames Pack1.Align;
   procedure P (Y : out INTEGER)
   Δ Y [Y = 2 ∧ PACK1oWEEKvFIRST + 1 = PACK1oA ];
end Pack2;
■
=SML
store_mt_results_show mt_run [
    ("bug.5.8a.1", bug_5_8a, (), ())
];
=TEX

=SML
new_script{name = "PACK2", unit_type="body"};

fun bug_5_8b () =
ⓈCN
with Pack1;
package body Pack2 is
   procedure MyAlign (X : out INTEGER) renames Pack1.Align;
   procedure P (Y : out INTEGER)
        Δ Y [Y = 2 ∧ PACK1oWEEKvFIRST + 1 = PACK1oA ]
        is
        begin
           Y := 1 + 1;
	  MyAlign (Y);
        end P;
end Pack2;
■


=SML
store_mt_results_show mt_run [
    ("bug.5.8b.1", bug_5_8b, (), ())
];
open_theory "PACK2oP'proc" ;
set_pc "cn1";

set_goal([], get_conjecture "-" "vcPACK2oP_2");
a(cn_vc_simp_tac[z_get_specⓩPACK1oA⌝, z_get_specⓩPACK1oWEEKvFIRST⌝]);
store_mt_results_show mt_run [
    ("bug.5.8b.2", (fn _ => (pop_thm(); ())), (), ())
];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####

\section{BATCH 6 (V0.7.1) - 30/4/97}
See file {\tt drabugs300497.uue} in the project SCCS directory.

Note that bugs 1 to 4 are repeats of bugs in batch 5, and are not restated.
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 6.1}
Bug 5 in {\tt drabugs300497.uue}.
=SML
clean_up();
new_script{name = "MAIN", unit_type="proc"};
=TEX

ⓈCN
procedure Main
is
  A : Integer;
  C : constant Integer := 5;
  procedure P
  Δ A [ A = 5 ]
  is separate;
begin
  P;
end Main;
■

=SML
=TEX

=SML
new_script{name = "MAIN.P", unit_type="proc"};
=TEX

ⓈCN
separate(Main)
procedure P
Δ A [ A = 5 ]
is
  procedure Q
  Δ A [ A = 5 ]
  is separate;
begin
  Q;
end P;
■

=SML
=TEX

=SML
new_script{name = "MAIN.P.Q", unit_type="proc"};
=TEX
=SML
fun bug_6_1 () =
ⓈCN
separate(Main.P)
procedure Q
Δ A [ A = 5 ]
is
begin
  A := C;
end Q;
■

=TEX
The problem is this failing, rather than the detailed output so we just test that.

=SML
store_mt_results_show mt_run [
    ("bug.6.1.1", (fn x => (bug_6_1 x; true)), (), true)
];
=TEX
\subsection{Bug 6.2}
Bug 6 in {\tt drabugs300497.uue}.
=SML
clean_up();
new_script{name = "MAIN", unit_type="proc"};
=TEX
ⓈCN
procedure Main
is
  A : Integer;

  procedure P
  Δ A [ A = 12 ]
  is
  begin
    A := 12;
  end P;

  procedure Q
  Δ A [ A = 12 ]
  is
   ⟨ local P ⟩			(1)
  begin
   P;
  end Q;

begin
 Δ A [ A = 12 ]              (2)
end Main;
■
ⓈCN
 (2) ⊑ Q;
■
=SML
open_scope "Main.Q";
ⓈCN
 (1) ≡

  procedure P
  Δ A [ A = 12 ]
  is
  begin
    A := 50;
  end P;
■

=TEX
If the bug has been fixed we expect printing or outputting the SPARK program to raise the clash-check exception.
=TEX
=SML
store_mt_results
mt_run_fail [
	("bug.6.2.1", print_ada_program, "-", gen_fail_msg "soundness_checks" 510003 [])
];
store_mt_results
mt_run_fail [
	("bug.6.2.2", output_ada_program, {script="-", out_file="/dev/null"}, gen_fail_msg "soundness_checks" 510003 [])
];
=TEX


% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 6.3}
Issue 2 in {\tt dra970704.uue}.
=SML
clean_up();
new_script{name = "PACK", unit_type="spec"};
=TEX

┌ Schema ───────────
│ PACKoX : ℤ
├──────
│ PACKoX = 9
└──────────────

ⓈCN
package Pack is
  X : Integer;
  procedure P
  Δ PACKoX [ Schema ];
end Pack;
■
=SML
new_script{name = "MAIN", unit_type="proc"};

ⓈCN
with Pack;
procedure Main is
begin
  Δ PACKoX [ PACKoX = 9 ]     (1)
end Main;
■
=SML
fun bug_6_3 () =
ⓈCN
(1) ⊑ Pack.P;
■
=TEX
The problem is ensuring this is not failing, rather than the detailed output so we just test that.

=SML
store_mt_results_show mt_run [
    ("bug.6.3", (fn x => (bug_6_3 x; true)), (), true)
];
=TEX

% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 6.4}
Issue 3 in {\tt dra970704.uue}.
=SML
clean_up();
new_script{name = "PACK1", unit_type="spec"};
=TEX
ⓈCN
package Pack1 is
  $auxiliary PACK1oy : ℤ;
  procedure Read (X : out Integer)
  Δ X Ξ PACK1oy [ X = PACK1oy ];
end Pack1;
■
=SML
new_script{name = "PACK2", unit_type="spec"};
=TEX
ⓈCN
package Pack2 is
  $auxiliary PACK1oy : ℤ;
  procedure P (X : out Integer)
  Δ X Ξ PACK1oy [ X = PACK1oy ];
end Pack2;
■
=SML
new_script{name = "PACK2", unit_type="body"};
=TEX
ⓈCN
with Pack1;
package body Pack2 is
  procedure P (X : out Integer)
  is
  begin
     Δ X [ X = PACK1oy ]       (2)
  end P;
end Pack2;
■
=SML
fun bug_6_4()=
ⓈCN
(2) ⊑ Pack1.Read(X);
■
=TEX
The test is currently failed (it should indicate a scope clash of some
form).
=IGN
store_mt_results_show
=SML
 mt_run_fail [
    ("bug.6.4", bug_6_4, (), gen_fail_msg "scope_clash???" 0 [])
];
=TEX

% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 6.5}
Issue 7 in {\tt dra970704.uue}.
=SML
clean_up();
new_script{name = "PACK", unit_type="spec"};
=TEX
ⓈCN
package Pack is
  A : Integer;
  procedure P
  Δ PACKoA [ PACKoA = 77 ];
end Pack;
■
=SML
new_script{name = "MAIN", unit_type="proc"};
=TEX
ⓈCN
with Pack;
procedure Main
is
  procedure P renames Pack.P;
begin
  Δ PACKoA [ PACKoA = 77 ]		(1)
end Main;
■
=SML
fun bug_6_5 () =
ⓈCN
(1) ⊑ P;
■
=TEX
The problem is ensuring this is not failing, rather than the detailed output so we just test that, and that the correct number of VCs are generated.

=SML
store_mt_results_show mt_run [
    ("bug.6.5_1", (fn x => (bug_6_5 x; true)), (), true)
];
store_mt_results_show mt_run [
    ("bug.6.5_2", length, get_conjectures "-", 2)
];
=TEX


% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 6.6}
Issue 8 in {\tt dra970704.uue}.
=SML
clean_up();
new_script{name = "P", unit_type="proc"};
=TEX
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
=SML
fun bug_6_6_1() =
ⓈCN
 (1) ≡ Y : INTEGER;
■
=SML
fun bug_6_6_2() =
ⓈCN
 (2) ⊑ Y := 1;
■
=TEX
=SML
=IGN
store_mt_results_show
mt_run_fail [
    ("bug.6.6.1", bug_6_6_2,
   (), gen_fail_msg "check_1_a" 505060 ["Y"])
];
=TEX
=SML
clean_up();
new_script{name = "MAIN", unit_type="proc"};
=TEX

=SML
fun bug_6_6_4 () =
ⓈCN
procedure Main is
  ⟨ var A ⟩		(1)
begin
  Δ A [ A = 0 ]	(2)
end Main;
■

=TEX
=SML
store_mt_results_show
mt_run_fail [
    ("bug.6.6.2", bug_6_6_4
  , (), gen_fail_msg "check_19" 505085 [])
];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####
\subsection{Bug 6.7}
Issue 9 in {\tt dra970704.uue}.
=SML
clean_up();
new_script{name = "MAIN", unit_type="proc"};
=TEX
ⓈCN
procedure Main is
  type My_Integer is range -32768 .. 32767;
  function F (X : My_Integer) return My_Integer
  Ξ [ F(X) = X + 1 ]
  is
  begin
    return X + 1;
  end F;

  procedure P (X : out My_Integer)
  Δ X [ X = 0 ]
  is
  begin
    X := 1;
  end P;
begin
  null;
end Main;
■
If, having done this, we can prove false, we have a problem, but it is one that is accepted as part of the philosophy of the tool.
This is a non-issue.
A solution either has assumptions in the specification of $F$, or
a different axiom to that as of 9/7/97.
=SML
fun bug_6_7 () = (
let val bad1_thm = rewrite_rule[z_get_spec ⓩMY_INTEGER⌝]
	   (z_∀_elim ⓩ32767⌝ (∧_right_elim (z_get_spec ⓩF⌝)));
    val bad2_thm = ∧_left_elim
	(pc_rule1 "z_sets_alg" rewrite_rule[z_get_spec ⓩF⌝]
	 (z_∀_elim ⓩ(f ≜ F, x ≜ 32767, X ≜ MY_INTEGER, Y ≜ MY_INTEGER)⌝
		z_fun_∈_clauses));
    val bad3_thm = rewrite_rule[bad1_thm, z_get_spec ⓩMY_INTEGER⌝] bad2_thm;
in
	concl bad3_thm =$ ⓩfalse⌝ andalso is_nil (asms bad3_thm)
end
handle _ => false);
=TEX
=IGN
store_mt_results
=SML
mt_run [("bug.6.7", bug_6_7, (), false)];
=TEX
% #### #### #### #### #### #### #### #### #### #### #### #### #### ####

\section{EPILOGUE}
=SML
diag_line (summarize_mt_results());
=TEX
\pagebreak
\end{document}
=IGN
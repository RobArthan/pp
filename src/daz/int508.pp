=IGN
********************************************************************************
int508.doc: this file is part of the PPDaz system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% ℤ $Date: 2006/09/19 11:24:22 $ $Revision: 1.36 $ $RCSfile: int508.doc,v $
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

\def\Title{Compliance Tool Enhancement Integration Tests}

\def\AbstractText{This document gives a Compliance Notation script with examples of the enhancements.}

\def\Reference{ISS/HAT/DAZ/INT508}

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
%% LaTeX2e port: \TPPtitle{Compliance Tool Enhancement Integration Tests}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Compliance Tool Enhancement Integration Tests}
%% LaTeX2e port: \TPPref{ISS/HAT/DAZ/INT508}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.36 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2006/09/19 11:24:22 $%
%% LaTeX2e port: }}  %% Mandatory field (with sensible default)
%% LaTeX2e port: \TPPstatus{Informal}
%% LaTeX2e port: %\TPPstatus{Informal}
%% LaTeX2e port: \TPPtype{Technical}
%% LaTeX2e port: %\TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{R.D.~Arthan & HAT Team}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & WIN01}
%% LaTeX2e port: \TPPabstract{%
%% LaTeX2e port: This document gives a Compliance Notation script with examples of the enhancements.
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
\item[Issue 1.1 (1995/10/20)%
] Initial Draft.
\item[Issue 1.7 (1996/01/22)]
Clarifying diagnostic output.
\item[Issue 1.8 (1997/05/20)]
Corrected bug revealed by bug fixing elsewhere in code.
\item[Issue 1.9 (1997/05/23)]
Changed to one compilation unit per script.
\item[Issue 1.10 (1997/05/28)]
Removed a rogue $summarize\_mt\_results$.
\item[Issue 1.11 (1997/06/03) - 1.12 (1997/06/04)]
IUCT WP 2 changes.
\item[Issue 1.13 (1997/07/21)]
IUCT WP 4 changes.
\item[Issue 1.14 (1997/07/24)]
IUCT WP 3 corrections.
\item[Issue 1.15 (2000/06/24)]
Got old tests to work with June 2000 Enhancements.
\item[Issue 1.16 (2000/10/23)]
CTLE II --- characters and strings now supported formally, so tests need to be more careful.
\item[Issue 1.17 (2000/10/25)] CTLE II R2/1: global variable unsoundness.
\item[Issue 1.18 (2001/11/08)] Adjusted tests for new treatment of {\tt and then} and {\tt or else}.
\item[Issue 1.19 (2002/07/09)] Allowed for new translation of Ada constants (as axiomatic descriptions).
\item[Issue 1.20 (2002/08/23)] Removed use of ICL logo font and corrected {\LaTeX} errors.
\item[Issue 1.21 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.22 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.23 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.24 (2003/07/18)] Allowed for slight changes to checks on frames and checks on global dependencies lists.
\item[Issue 1.25 (2004/01/19)] The Z universal set is now called 𝕌
\item[Issue 1.26 (2004/02/07)] The SPARK program is now referred to as the Ada program.
\item[Issue 1.27 (2004/07/17)] Fixed error that was not previously detected.
\item[Issue 1.28 (2005/05/28)] Compliance Notation reserved words are now prefixed by a dollar sign.
\item[Issue 1.117] Allowing for enhancement 117.
\item[Issue 1.30 (2006/03/28)] Allowed for automated state management.
\item[Issues 1.31 (2006/03/28), 1.32 (2006/03/28)] Fully allowed for enhancement 118.
\item[Issue 1.33 (2006/05/05)] Allowed for new handling of function and constant renamings.
\item[Issue 1.34 (2006/06/01)] accommodated enhancement 139 - 1-theory-per-subprogram.
\item[Issue 1.35 (2006/09/18)] Tidied usage of {\em new\_script}.
\item[Issue 1.36 (2006/09/19)] Allowed for enhancement 165.
\item[Issue 1.37 (2008/02/10)] Allowed for change to lexical rules for underscores in Z.
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

This document contains test data for the Compliance Tool Enhancements as specified in \cite{ISS/HAT/DAZ/HLD501} and \cite{ISS/HAT/DAZ/USR501}.

\subsection{Introduction}


\section{THE LITERATE SCRIPTS}


\subsection{Setting up of the enivronment}

Set up flags so the compliance tool works correctly .

=SML
set_flags [("z_type_check_only", false),("z_use_axioms", true)];
=TEX

Load the test harness.

=SML
diag_line "These tests will generate loading, warning and error messages that can be ignored.";
diag_line "Only messages from the test harness should be considered.";
use_file "dtd013";
use_file "imp013";
=TEX

\subsection{Useful functions}

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
The following function is handy in cases where we can rely on the subgoal package to do all the checking needed.
=SML
fun thm_chk () = (
	let	val th = pop_thm();
	in	fn () => ((map diag_line o PrettyPrinter.format_thm) th; ())
	end
);
=TEX
\pagebreak
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection{Enhancement 1: Annotations}
=TEX
Mostly, the automatically checkable criteria for success in these tests are that the script should load without errors and the SPARK program generation should not fail.
=SML
clean_up();
new_script{name = "S", unit_type="proc"};
=TEX
\subsubsection{Annotation as Declaration}
ⓈCN
procedure S is
    X: INTEGER;
    procedure T is
    --# hide T
    begin
        X := 2 * X;
    end T;
begin
    null;
end S;
■
=SML
store_mt_results_show mt_run[
	("annotation.1.1a", print_ada_program, "-", ())
];
=TEX
\subsubsection{Annotation as Statement}
=SML
new_script{name = "Q", unit_type="spec"};
ⓈCN
package Q is
  A : INTEGER;
end Q;
=SML
new_script{name = "Q", unit_type="body"};
ⓈCN
package body Q is

begin
--# hide Q
	A := 0;
end Q;
■
=SML
store_mt_results_show mt_run[
	("annotation.1.1b", print_ada_program, "-", ())
];
=TEX
\subsubsection{Annotation in Subprogram Body}
=SML
new_script{name = "A", unit_type="proc"};
ⓈCN
procedure A is
    X: INTEGER;
    procedure B
    --# global X;
    --# derives X from X;
    is
    begin
        X := 2 * X;
    end B;
    function C return INTEGER
    --# global X;
    is
    begin
        return X;
    end C;
begin
    null;
end A;
■
=SML
store_mt_results_show mt_run[
	("annotation.1.1c", print_ada_program, "-", ())
];
=TEX
=TEX
\subsubsection{Annotation in Package Specification}
=SML
new_script{name = "PK", unit_type="spec"};
ⓈCN
package PK
--# own B;
is
    B : INTEGER;
    function f (x : INTEGER) return INTEGER;
end PK;
■
=SML
store_mt_results_show mt_run[
	("annotation.1.1d", print_ada_program, "-", ())
];
=TEX
\subsubsection{Annotation in Package Body}
=SML
new_script{name = "PK", unit_type="body"};
ⓈCN
package body PK
--# own B;
is
    function f (x : INTEGER) return INTEGER
    is begin return x; end f;
end PK;
■
=SML
store_mt_results_show mt_run[
	("annotation.1.1e", print_ada_program, "-", ())
];
=TEX
\subsubsection{Annotation in Compilation Units}
=SML
new_script{name = "PK1", unit_type="spec"};
ⓈCN
package PK1
is
    C : constant INTEGER := 8;
end PK1;
■
=SML
store_mt_results_show mt_run[
	("annotation.1.1f", print_ada_program, "-", ())
];
=TEX
=SML
new_script{name = "PK2", unit_type="spec"};
ⓈCN
with PK1;
--# inherit PK1;
package PK2
is
    D : constant INTEGER := PK1.C - 1;
end PK2;
■
=SML
store_mt_results_show mt_run[
	("annotation.1.1g", print_ada_program, "-", ())
];
=TEX
\subsubsection{Annotation in Package Body Stub}
This is allowed in the grammar (to remove an SLRP conflict) but should
be rejected by the parser:
=SML
new_script{name = "PP", unit_type="proc"};
=SML
fun ann_in_pack_body_stub () =
ⓈCN
procedure PP is
package body PK
--# own B;
is separate;
begin null; end PP;
■
=SML
store_mt_results_show mt_run_fail[
	("annotation.1.2", ann_in_pack_body_stub, (),
			gen_fail_msg "cn_parser" 503204[] )
];
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection{Enhancement 2: Real Types}
=SML
clean_up();
new_script{name = "SWAP_REALS", unit_type="proc"};
ⓈCN
procedure SWAP_REALS is
    type FIX is delta 0.1 range 5.1 .. 10.0;
    A, B, TEMP : FIX;
begin
 Δ A, B, TEMP [A = B⋎0 ∧ B = A⋎0]
end SWAP_REALS;
■
ⓈCN
 ⊑ TEMP := A; A := B; B := TEMP;
■
=SML
set_goal([], get_conjecture "-" "vc_1_1");
a(prove_tac[]);
val reals_1 = thm_chk();
store_mt_results_show mt_run[
	("SWAP_REALS'proc", reals_1, (), ())
];
=TEX
=SML
clean_up();
new_script{name = "SR", unit_type="spec"};
ⓈCN
package SR is
    type FIX is delta 0.1 range 5.1 .. 10.0;
    procedure SWAP_REALS (A, B : in out FIX)
     Δ A, B [A = B⋎0 ∧ B = A⋎0];
end SR;
■
=SML
new_script{name = "P", unit_type="proc"};
ⓈCN
with SR;
procedure P is
    X, Y : SR.FIX;
begin
 Δ X, Y [X = Y⋎0 ∧ Y = X⋎0]
end P;
■
ⓈCN
 ⊑ SR.SWAP_REALS(X, Y);
■
=SML
set_goal([], get_conjecture "-" "vc_1_2");
a(prove_tac[]);
val reals_2 = thm_chk();
store_mt_results_show mt_run[
	("SR'spec", reals_2, (), ())
];
=TEX
The following is an additional test on the volume I material which was affected by this enhancement.
Subsequent had to split into packages $P$ and $P1$ due to restrictions on
functions refering to each other in their specifications.
=SML
clean_up();
new_script{name = "P1", unit_type="spec"};
=TEX

ⓈCN
package P1 is
  function F (X : integer) return integer
  Ξ  [P1oF(X) = 2*X];
end P1;
■
=SML
new_script{name = "P", unit_type="spec"};
ⓈCN
with P1;
package P is
  function G(X:integer) return integer
  Ξ  [PoG(X) = 3*P1oF(X)]	;
end P;
■
=SML
new_script{name = "H", unit_type="func"};
ⓈCN
with P;
  function H (X : integer) return integer
  Ξ  [H(X) = 12*X]
  is begin
    return P.G(P1.F(X));
  end H;
■

=SML
set_goal([ⓩINTEGER = 𝕌⌝], get_conjecture "-" "vcH_1");
a(MAP_EVERY (ante_tac o z_get_spec)[ⓩPoG⌝, ⓩP1oF⌝]);
a(asm_rewrite_tac[] THEN REPEAT strip_tac);
a(asm_rewrite_tac[]);
a(PC_T1"z_lin_arith"prove_tac[]);
val reals_3 = thm_chk();
store_mt_results_show mt_run[
	("reals3.1", reals_3, (), ())
];
=TEX
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection{Enhancement 3: Multi-dimensional Arrays}
=SML
clean_up();
new_script{name = "P", unit_type="proc"};
ⓈCN
procedure P is
    type THREE is range 1 ..3;
    type ARR is array (THREE, THREE) of THREE;
    X: constant ARR := ARR'((1, 2, 3), (3, 4, 5), (5, 6, 7));
begin
    null;
end P;
■
=SML
print_ada_program"-";
set_goal([], ⓩX = array_agg2
	(succ ↗ 1 - ARRvFIRSTv1 ↕ ⨾
			⟨succ ↗ 1 - ARRvFIRSTv2 ↕ ⨾ ⟨1, 2, 3⟩,
			 succ ↗ 1 - ARRvFIRSTv2 ↕ ⨾ ⟨3, 4, 5⟩,
			 succ ↗ 1 - ARRvFIRSTv2 ↕ ⨾ ⟨5, 6, 7⟩⟩)⌝);
a(rewrite_tac (map z_get_spec(get_consts"-")));
val multi_dim_arrays_1 = thm_chk();
store_mt_results_show mt_run[
	("multi_dim.1", multi_dim_arrays_1, (), ())
];
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection{Enhancement 4: NATURAL Etc.}
=SML
clean_up();
new_script{name = "P", unit_type="proc"};
=SML
fun naturals_etc_1 () =
ⓈCN
procedure P is
    type THREE is range 1 ..3;
    type NAT_ARR is array (THREE) of NATURAL;
    type POS_ARR is array (THREE) of POSITIVE;
    type LONG_ARR is array (THREE) of LONG_INTEGER;
    type SHORT_ARR is array (THREE) of SHORT_INTEGER;
begin
    null;
end P;
■
=SML
store_mt_results_show mt_run[
	("naturals-etc.1", naturals_etc_1, (), ())
];
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection{Enhancement 5: Visibility Rules}
=SML
clean_up();
new_script{name = "P1", unit_type="spec"};
fun show_cn_thys () = (
	map (fn thy => (thy, get_parents thy)) (get_descendants "cn")
);
ⓈCN
package P1 is
 C1 : constant INTEGER := 1;
end P1;
■
=SML
new_script{name = "P2", unit_type="spec"};

=SML
fun visibility_1 () =
ⓈCN
with P1;
package P2 is
 C2 : constant INTEGER := 1;
 function F2 (X : INTEGER) return INTEGER
  Ξ [P2oF2(X) = X + 1];
end P2;
■
=TEX
=SML
store_mt_results_show mt_run[
	("visibility.1.1", visibility_1, (), ())
];
=SML
new_script{name = "P2", unit_type="body"};
fun visibility_2 () =
ⓈCN
package body P2 is
 function F2 (X : INTEGER) return INTEGER
   Ξ [F2(X) = X + 1]
 is  begin return X + P1.C1; end F2;
end P2;
■
=TEX
=SML
store_mt_results_show mt_run[
	("P2'body", visibility_2, (), ())
];
=SML
set_pc"cn";
set_goal([], get_conjecture"-" "vcP2_1");
a(REPEAT strip_tac);
val vis_2_1  = thm_chk();
set_goal([], get_conjecture"-" "vcP2_2");
a(REPEAT strip_tac);
val vis_2_2  = thm_chk();
=TEX
=SML
open_theory "P2oF2'func";
set_pc"cn";
set_goal([], get_conjecture"-" "vcP2oF2_1");
a(rewrite_tac[z_get_specⓩP1oC1⌝] THEN REPEAT strip_tac);
val vis_2_3  = thm_chk();
store_mt_results_show mt_run[
	("visibility.2.1", vis_2_1, (), ()),
	("visibility.2.2", vis_2_2, (), ()),
	("visibility.2.3", vis_2_3, (), ())
];
=TEX
=SML
clean_up();
new_script{name="A", unit_type="spec"};

ⓈCN
package A is
    V : INTEGER;
end A;
■

=SML
new_script{name = "B", unit_type="spec"};
ⓈCN
with A;
package B is
    procedure INIT
    Δ AoV [AoV = 0];
end B;
■

=SML
new_script{name = "B", unit_type="body"};
ⓈCN
$references A;
package body B is
    procedure INIT
    Δ AoV [AoV = 0]
    is
    begin
        A.V := 0;
    end INIT;
end B;
■
=SML
new_script{name = "C", unit_type="proc"};
ⓈCN
with A, B;
procedure C
Δ AoV [AoV = 0]
is
begin
    B.INIT;
end C;
■
=SML
set_goal([], (list_mk_∧ o map (snd o snd) o get_conjectures)"-");
a(PC_T1"cn" prove_tac[]);
val vis_3  = thm_chk();
store_mt_results_show mt_run[
	("A'spec", vis_3, (), ())
];
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection{Enhancement 6: Pragmas}
The automatically checkable criteria for success in these tests are that the script should load without errors and the SPARK program generation should not fail.
\subsubsection{Pragma as Compilation Unit}
=SML
clean_up();
new_script{name = "CONSTANTS", unit_type="spec"};
ⓈCN
pragma system_name("MIX");
■
=SML
store_mt_results_show mt_run[
	("CONSTANTS'spec", print_ada_program, "-", ())
];
=TEX
=TEX
\subsubsection{Pragma List inside Compilation Unit}
ⓈCN
pragma memory_size(4000);
pragma storage_unit(41);
package Constants
is
    bits_per_byte : constant INTEGER := 8;
    type BYTE is range 0 .. 255;
    type WORD is record sign : BOOLEAN; b1, b2, b3, b4, b5 : BYTE; end record;
    type INDEX is record sign : BOOLEAN; b1, b2 : BYTE; end record;
end Constants;
■
=SML
store_mt_results_show mt_run[
	("REGISTERS'spec", print_ada_program, "-", ())
];
=TEX
=SML
new_script{name = "REGISTERS", unit_type="spec"};
ⓈCN
with Constants;
use Constants;
pragma elaborate(Constants);
package Registers
is
    rA, rX : WORD;
    rI1, rI2, rI3, rI4, rI5, rI6, rJ : INDEX;
end Registers;
■
=SML
store_mt_results_show mt_run[
	("INIT'spec", print_ada_program, "-", ())
];
=TEX
=TEX
\subsubsection{Pragma as Declaration}
=SML
new_script{name = "INIT", unit_type="spec"};
ⓈCN
with Constants, Registers;
package Init
is
     procedure reset ;
     pragma inline(reset);
end Init;
■
=SML
store_mt_results_show mt_run[
	("INIT'body", print_ada_program, "-", ())
];
=TEX
=TEX
\subsubsection{Pragma as Statement}
=SML
new_script{name = "INIT", unit_type="body"};
ⓈCN
with Constants, Registers;
package body Init
is
     procedure reset
     is
     begin
         pragma list(off);
         rA := 0;
         rX := 0;
         rI1 := 0;
         rI2 := 0;
         rI3 := 0;
         rI4 := 0;
         rI5 := 0;
         rI6 := 0;
         rJ := 0;
         pragma list(on);
    end reset;
end Init;
■
=TEX
=SML
store_mt_results_show mt_run[
	("pragmas.1d", print_ada_program, "-", ())
];
=TEX
\subsubsection{Pragma in a Using Declaration}
=SML
clean_up();
new_script{name="PRC_IN_PCK_RFN", unit_type="spec"};
=TEX
ⓈZ
│ fun 100 sum _, size _
■

ⓈZAX
│	sum _ : bag ℤ → ℤ
├───────────
│	sum ⟦ ⟧ = 0 ∧
│	(∀ b : bag ℤ; n : ℤ ⦁ sum (b ⊎ ⟦n⟧) = sum b + n)
■
ⓈZAX
│	size _: bag ℤ → ℤ
├───────────
│	size ⟦ ⟧ = 0 ∧
│	(∀ b : bag ℤ; n : ℤ ⦁ size (b ⊎ ⟦n⟧) = size b + 1)
■
ⓈCN
package PRC_IN_PCK_RFN is

	$auxiliary B : bag ℤ;

	procedure MEAN (M : out INTEGER)
	Δ M Ξ B [B ≠ ⟦ ⟧, M = sum B intdiv size (B)];

end PRC_IN_PCK_RFN;
■
=SML
store_mt_results_show mt_run[
	("PRC_IN_PCK_RFN'body", print_ada_program, "-", ())
];
=TEX
=SML
new_script1{name = "PRC_IN_PCK_RFN", unit_type="body", library_theories=["PRC_IN_PCK_RFN'spec"]};
┌Bag_Inv────────────
│	B : bag ℤ;
│	S, N : INTEGER
├──────
│	S = sum B;
│	N = size B
└────────────────
ⓈCN
package body PRC_IN_PCK_RFN is

	$using
         pragma list (on);
           S, N : INTEGER;
         pragma list(off);
        $implement B $by Bag_Inv;

	procedure MEAN (M : out INTEGER)
	Δ M, S, N [N ≠ 0, M = S intdiv N ∧ S = S⋎0 ∧ N = N⋎0]
	is
	begin
		M := S / N;
	end MEAN;

begin
	S := 0;

end PRC_IN_PCK_RFN;
■
=TEX
=SML
store_mt_results_show mt_run[
	("PRC_IN_PCK_RFN'spec", print_ada_program, "-", ())
];
=TEX
\subsubsection{Interface Pragma}
=SML
clean_up();
new_script{name = "JIM", unit_type="proc"};
ⓈCN
procedure jim(X : IN OUT INTEGER)
     Δ X[X > 0]
is
     procedure fred (A : IN OUT INTEGER)
	Δ A[A = 1];
    pragma interface(C, fred);
begin
    fred(X);
end jim;
■
=SML
set_pc"cn";
set_goal([], get_conjecture"-" "vcJIM_2");
a(LEMMA_Tⓩ∀ X : INTEGER | true ∧ X = 1 ⦁ X > 0⌝ accept_tac
	THEN REPEAT strip_tac THEN asm_rewrite_tac[]);
val pragmas_3_1  = thm_chk();
store_mt_results_show mt_run[
	("pragmas.3.1", pragmas_3_1, (), ())
];
store_mt_results_show mt_run[
	("pragmas.3.2", print_ada_program, "-", ())
];
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection{Enhancement 7: With Clauses}
=SML
clean_up();
new_script{name = "PACK1", unit_type="spec"};
ⓈCN
package PACK1 is
 C : constant INTEGER := 10;
end PACK1;
■

=SML
new_script{name = "PACK2", unit_type="spec"};
ⓈCN
with PACK1;
package PACK2 is
 D : constant INTEGER := PACK1.C;
 procedure Q (X : out INTEGER)
  Δ X [X = 20];
end PACK2;
■
=SML
new_script{name = "P", unit_type="proc"};
ⓈCN
with PACK2;
procedure P (X : out INTEGER)
  Δ X [X = PACK2oD + 10]
 is begin PACK2.Q(X); end P;
■
=SML
set_pc"cn";
set_goal([], get_conjecture"-" "vcP_1");
a(REPEAT strip_tac);
val with_1_1  = thm_chk();
set_goal([], get_conjecture"-" "vcP_2");
a(rewrite_tac(map z_get_spec[ⓩPACK2oD⌝, ⓩPACK1oC⌝]) THEN REPEAT strip_tac);
val with_1_2  = thm_chk();
store_mt_results_show mt_run[
	("with-clauses.1.1", with_1_1, (), ()),
	("with-clauses.1.2", with_1_2, (), ())
];
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection{Enhancement 8: CHARACTER Etc.}
=SML
clean_up();
new_script{name = "P", unit_type="proc"};
=SML
fun character_etc_1 () =
ⓈCN
procedure P is
    subtype STRING_LENGTH is INTEGER range 1 .. 13;
    subtype MY_STRING is STRING(STRING_LENGTH);
begin
    null;
end P;
■
=SML
store_mt_results_show mt_run[
	("character-etc.1", character_etc_1, (), ())
];
=TEX
\subsection{Enhancement 9: VC Browser Mods}
This has to be tested interactively.
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection{Enhancement 10: Renaming}
\subsubsection{Renaming Operator Symbols}
=SML
clean_up();
new_script{name = "PACK", unit_type="spec"};
ⓈCN
package PACK is
    type INT is range 10 .. 20;
end PACK;
■
=SML
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
  ⊑ I := 16;
■
=SML
set_pc"cn";
set_goal([], get_conjecture"-" "vc_1_1");
a(REPEAT strip_tac);
val renaming_1_1  = thm_chk();
store_mt_results_show mt_run[
	("renaming.1.1", renaming_1_1, (), ())
];
=SML
new_script{name = "WRONG", unit_type="proc"};
=SML
fun renaming_err() =
ⓈCN
with PACK;
procedure WRONG is
     function "<" (left, right : PACK.INT) return BOOLEAN renames PACK.">=";
     I : PACK.INT;
begin
  Δ I [I ≥ 15]
end WRONG;
■
=SML
store_mt_results_show mt_run_fail[
	("renaming.1.2", renaming_err, (), gen_fail_msg"cn_parser" 503204 [])
];
=TEX
\subsubsection{Renaming Other Functions}
=SML
clean_up();
new_script{name = "PACK", unit_type="spec"};
ⓈCN
package PACK is
    function F (X : INTEGER) return INTEGER
      Ξ [PACKoF(X) = 5];
end PACK;
■
=SML
new_script{name = "MAIN", unit_type="proc"};
ⓈCN
with PACK;
procedure MAIN is
    function F (X : INTEGER) return INTEGER renames PACK.F;
    Z : INTEGER;
begin
    Δ Z [Z = 9]
end MAIN;
■
ⓈCN
  ⊑ Z := F(Z) + 4;
■

=SML
set_pc"cn";
set_goal([], get_conjecture"-" "vc_1_1");
a(REPEAT strip_tac);
a(ALL_FC_T rewrite_tac(map z_get_spec[ⓩPACKoF⌝]));
val renaming_2  = thm_chk();
store_mt_results_show mt_run[
	("PACK'spec", renaming_2, (), ())
];
=TEX
\subsubsection{Renaming Procedures}
=SML
clean_up();
new_script{name = "PACK", unit_type="spec"};
ⓈCN
package PACK is
    procedure P (X : out INTEGER)
      Δ X [5 ≤ X < 6];
end PACK;
■
=SML
new_script{name = "MAIN", unit_type="proc"};
ⓈCN
with PACK;
procedure MAIN is
    procedure P (X : out INTEGER) renames PACK.P;
    Z : INTEGER;
begin
    Δ Z [Z = 9]
end MAIN;
■
ⓈCN
  ⊑ P(Z); Z:= 3*Z - 6;
■

=SML
set_pc"cn";
set_goal([], get_conjecture"-" "vc_1_1");
a(REPEAT strip_tac);
val renaming_3_1  = thm_chk();
set_goal([], get_conjecture"-" "vc_1_2");
a(PC_T1 "z_lin_arith" prove_tac[]);
val renaming_3_2  = thm_chk();
store_mt_results_show mt_run[
	("renaming.3.1", renaming_3_1, (), ()),
	("renaming.3.2", renaming_3_2, (), ())
];
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection{Enhancement 11: Qualified Expressions}
=SML
clean_up();
new_script{name = "P", unit_type="proc"};
ⓈCN
procedure P is
 D : constant INTEGER := INTEGER'(42);
begin
 null;
end P;
■
=SML
set_pc"cn";
set_goal([], ⓩD ∈ INTEGER ∧ D = 42⌝);
a(accept_tac(z_get_specⓩD⌝));
val qual_exp_1  = thm_chk();
store_mt_results_show mt_run[
	("qualified-expressions.1", qual_exp_1, (), ())
];
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection{Enhancement 12: Type Conversions}
=SML
clean_up();
new_script{name = "TYPE_CONVS", unit_type="proc"};
ⓈCN
procedure TYPE_CONVS is
    type SHORT_INT is range -32768 .. 32767;
    type LONG_INT is range -2147483648  .. 2147483647;
    subtype SUB is INTEGER range 50 .. 100;
    X : LONG_INT;
    Y : INTEGER;
begin
 Δ X, Y [ Y = 75 ]
end TYPE_CONVS;
■

ⓈCN
  ⊑
    X := 70;
    Y := SHORT_INT(X);
    Y := SUB(SHORT_INT(5 + INTEGER(X)));
■
=SML
set_pc"cn";
set_goal([], get_conjecture"-""vc_1_1");
a(prove_tac[]);
val type_conv_1  = thm_chk();
store_mt_results_show mt_run[
	("TYPE_CONVS'proc", type_conv_1, (), ())
];
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection{Enhancement 13: Use Binding Displays}
=SML
clean_up();
new_script{name = "BD", unit_type="proc"};
ⓈCN
procedure BD is
    type REC1 is record A, B : INTEGER; end record;
    type REC2 is record X, Y : INTEGER; Z : REC1; end record;
    type REC3 is record W, V : REC1; U : REC2; end record;
    v1 : constant REC1 := REC1'(B=>42, A=>99);
    v2 : constant REC1 := REC1'(42, 99);
    v3 : constant REC2 := REC2'(1,2, REC1'(3, 4));
    v4 : constant REC3 := REC3'(W=>v1, U=>v3, V=>v2);
begin
    null;
end BD;
■
=SML
set_goal([], ⓩV4.U = V3 ∧ V4.V = V2 ∧ V4.W = V1⌝);
a(PC_T1 "cn" prove_tac(map z_get_spec[ⓩV1⌝, ⓩV2⌝, ⓩV3⌝, ⓩV4⌝]));
val binding_display_1  = thm_chk();
store_mt_results_show mt_run[
	("binding-display.1", binding_display_1, (), ())
];
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection{Enhancement 14: Record Assignments}
=SML
clean_up();
new_script{name = "P", unit_type="proc"};
ⓈCN
procedure P is
    type DAY is (MON, TUE, WED);
    type REC is record X : INTEGER; D : DAY; end record;
    type ARR is array(DAY) of REC;
    A : ARR;
begin
 Δ A [(A MON).D = TUE]
end P;
■
ⓈCN
 ⊑ A (MON).D := TUE;
■
=SML
set_pc"cn1";
set_goal([], get_conjecture"-""vc_1_1");
a(rewrite_tac[z_get_specⓩARR⌝] THEN REPEAT strip_tac);
a(rewrite_tac[z_⊕_↦_app_thm, (z_gen_pred_elim (dest_z_tupleⓩ(𝕌, 𝕌)⌝) o z_get_spec)ⓩRECuD⌝]);
val record_assign_1  = thm_chk();
store_mt_results_show mt_run[
	("record_assign.1",record_assign_1, (), ())
];
=TEX
=SML
clean_up();
new_script{name = "BD", unit_type="proc"};
ⓈCN
procedure BD is
    type REC1 is record A, B : INTEGER; end record;
    type REC2 is record X, Y : INTEGER; Z : REC1; end record;
    type REC3 is record W, V : REC1; U : REC2; end record;
    v1a : constant REC1 := REC1'(B=>42, A=>99);
    v1b : constant REC1 := REC1'(42, 99);
    v2 : constant REC2 := REC2'(1,2, REC1'(3, 4));
    v3 : constant REC3 := REC3'(W=>v1a, U=>v2, V=>v1b);
    a1 : REC1;
    a2 : REC2;
    a3 : REC3;
begin
    Δ A1, A2, A3[
		A1 = (A≜42, B≜42) ∧
		A2 = (X≜100, Y≜100, Z≜A1) ∧
		A3 = (W≜A1, V≜V1A, U≜A2)
   ]
end BD;
■
ⓈCN
 ⊑
    a1.A := v1a.B;
    a1.B := v1b.A;
    a2 := v2;
    a2.X := 100 * a2.X;
    a2.Y := 50 * a2.Y;
    a2.Z.A := 42;
    a2.Z.B := a2.Y - 58;
    a3.W.A := 42;
    a3.W.B := 42;
    a3.V.A := v1a.A;
    a3.V.B := a3.W.B;
    a3.U := a2;
■
=SML
val old_pp_f_d = set_int_control("pp_format_depth", 8);
val old_pp_tl_d = set_int_control("pp_top_level_depth", 8);
val def_thms = map ∧_right_elim[
	(z_gen_pred_elim [ⓩ𝕌⌝] o z_get_spec)ⓩREC1uA⌝,
	(z_gen_pred_elim (dest_z_tupleⓩ(𝕌, 𝕌)⌝) o z_get_spec)ⓩREC2uX⌝,
	(z_gen_pred_elim (dest_z_tupleⓩ(𝕌, 𝕌)⌝) o z_get_spec)ⓩREC3uW⌝] @
	map z_get_spec[ⓩV1A⌝, ⓩV1B⌝, ⓩV2⌝, ⓩV3⌝];
set_goal([], get_conjecture"-""vc_1_1");
a(rewrite_tac def_thms);
val record_assign_2 = thm_chk();
store_mt_results_show mt_run[
	("BD'proc",record_assign_2, (), ())
];
set_int_control("pp_format_depth", old_pp_f_d);
set_int_control("pp_top_level_depth", old_pp_tl_d);
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection{Enhancement 15: And-then/Or-else}
=SML
clean_up ();
new_script{name = "P", unit_type="proc"};
ⓈCN
procedure P
Δ [true]
is
	v1 : constant BOOLEAN := 1 = 2 and 2 = 3;
	v2 : constant BOOLEAN := 1 = 2 or 2 = 3;
	w1 : constant BOOLEAN := 1 = 2 and then 2 = 3;
	w2 : constant BOOLEAN := 1 = 2 or else 2 = 3;
begin
 null;
end P;
■
The proof below takes care not to exploit the fact that all four constants evaluate to false.
=SML
set_goal([], ⓩV1 = W1 ∧ V2 = W2⌝);
a(pure_rewrite_tac(map z_get_spec[ⓩV1⌝, ⓩV2⌝, ⓩW1⌝, ⓩW2⌝, ⓩ(_ and_then _)⌝, ⓩ(_ or_else _)⌝]));
a(PC_T1"hol" prove_tac[]);
val and_then_1 = thm_chk();
store_mt_results_show mt_run[
	("and_then.1", and_then_1, (), ())
];
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection{Enhancement 16: Hypertext Links}
Tested elsewhere.
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection{Enhancement 17: Subtype Attributes}
=SML
clean_up();
new_script{name = "P", unit_type="proc"};
ⓈCN
procedure P is
    type INT is range 9 .. 67;
    subtype SUB is INT range 16 .. 50;
    X: constant SUB := (SUB'LAST - SUB'FIRST) / 2;
begin
    null;
end P;
■
=SML
set_goal([], ⓩ
	SUBvSUCC = INTvSUCC ∧
	SUBvPRED = INTvPRED ∧
	SUBvPOS = INTvPOS ∧
	SUBvVAL = INTvVAL ∧
	16 < X < 50
⌝);
a(PC_T1 "cn" rewrite_tac (map z_get_spec(get_consts"-")));
val subtype_attrs_1 = thm_chk();
store_mt_results_show mt_run[
	("subtype-attrs.1",subtype_attrs_1, (), ())
];
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection{Enhancement 18: Subtype Range Checks}
=SML
clean_up();
new_script{name = "Q", unit_type="proc"};
=SML
fun range_checks_1 () =
ⓈCN
procedure Q is
    type INT is range 100 ..50;
    X: SUB;
begin
     Δ X [X = 200]
end Q;
■
=SML
store_mt_results_show mt_run_fail[
	("Q'proc", range_checks_1, (), gen_fail_msg
		"basic_decl_otherwise" 507041 [])
];
=TEX

=SML
new_script{name = "R", unit_type="proc"};
=SML
ⓈCN
procedure R is
    type THREE is (ZERO, ONE, TWO);
    subtype SUB2 is THREE range ONE .. TWO; -- OK; No VC
    type ARR is array (THREE) of SUB2;
    type INT3 is range 1 .. ARR'LENGTH; -- OK; No VC
    subtype SUB3 is THREE range ZERO .. THREE'SUCC(ONE); -- VC
begin
     NULL;
end R;
■
=IGN
z_print_theory"-";
=TEX
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection{Enhancement 19: Unconstrained Arrays}
=SML
clean_up();
new_script{name = "Q", unit_type="proc"};
=SML
ⓈCN
procedure Q is
    type UNCON is array(INTEGER range <>) of INTEGER;
begin
     NULL;
end Q;
■
=IGN
z_get_specⓩUNCON⌝;
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection{Enhancement 20: Arbitrary Replacements}
The automatically checkable criteria for success in these tests are that the script should load without errors and the SPARK program generation should not fail.
=SML
clean_up();
new_script{name = "P", unit_type="spec"};
ⓈCN
 ⟨ compilation unit ⟩ (1)
■
ⓈCN
 (1) !≡-- This is some commentary
        -- for inclusion at the head of the output file
        -- note the second two lines have 8 leading spaces
		 	-- and this one starts tab-tab-space-tab
■
ⓈCN
package  P is
    X:INTEGER;
private
 ⟨ private part ⟩ (2)
end P;
■
ⓈCN
 (2) !≡type T is access INTEGER;
■
=SML
store_mt_results_show mt_run[
	("arbitrary_replacements.1d", print_ada_program, "-", ())
];
=TEX
=SML
new_script{name = "Q", unit_type="spec"};
ⓈCN
package  Q is
 ⟨ visible part ⟩ (3)
end Q;
■
ⓈCN
 (3) !≡type Q is access P.T;
■
=SML
store_mt_results_show mt_run[
	("arbitrary_replacements.1c", print_ada_program, "-", ())
];
=TEX
=SML
new_script{name = "R", unit_type="proc"};
ⓈCN
procedure R is
 ⟨ declaration ⟩ (4)
begin null; end R;
■
ⓈCN
 (4) !≡type U is access Q.Q;
■
=SML
store_mt_results_show mt_run[
	("arbitrary_replacements.1b", print_ada_program, "-", ())
];
=TEX
=SML
new_script{name = "S", unit_type="proc"};
ⓈCN
procedure S is
begin
 ⟨ statement ⟩ (5)
end S;
■
ⓈCN
 (5) !≡<<LABEL>>
■
=SML
store_mt_results_show mt_run[
	("arbitrary_replacements.1a", print_ada_program, "-", ())
];
=TEX
=SML
new_script{name = "T", unit_type="proc"};
ⓈCN
procedure T is
begin
 Δ  [true, false]    (6)
end T;
■
ⓈCN
 (6) !≡ goto label;
■
=SML
store_mt_results_show mt_run[
	("arbitrary_replacements.1", print_ada_program, "-", ())
];
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\pagebreak
=TEX
\section{EPILOGUE}
=SML
diag_line (summarize_mt_results());
=TEX

\end{document}


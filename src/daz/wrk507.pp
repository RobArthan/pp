=IGN
********************************************************************************
wrk507.doc: this file is part of the PPDaz system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% ℤ $Date: 2010/02/11 17:10:59 $ $Revision: 1.30 $ $RCSfile: wrk507.doc,v $
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

\def\Title{Calculator Example}

\def\AbstractText{This document gives an example of the Compliance Notation.}

\def\Reference{ISS/HAT/DAZ/WRK507}

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
%% LaTeX2e port: % TQtemplate.tex
%% LaTeX2e port: % use_file "daz_init";
%% LaTeX2e port: % use_file "BASICS'spec";
%% LaTeX2e port: % z_print_theory"-";
%% LaTeX2e port: % open CNZGenerator;
%% LaTeX2e port: \documentstyle[hol1,11pt,TQ,hyperbasics,ifthen]{article}
%% LaTeX2e port: \ftlinepenalty=9999
\def\Hide#1{}
\def\Bool{``$\it{:}bool\,$''}
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{DAZ PROJECT}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Calculator Example}  %% Mandatory field
%% LaTeX2e port: \TPPref{ISS/HAT/DAZ/WRK507}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.30 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2010/02/11 17:10:59 $%
%% LaTeX2e port: }}  %% Mandatory field (with sensible default)
%% LaTeX2e port: \TPPstatus{Informal}
%% LaTeX2e port: %\TPPstatus{Informal}
%% LaTeX2e port: \TPPtype{Technical}
%% LaTeX2e port: %\TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{R.D.~Arthan & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: %\TPPauthorisation{R.D.~Arthan & HAT Team}
%% LaTeX2e port: \TPPabstract{%
%% LaTeX2e port: This document gives an example of the Compliance Notation.}
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
%% LaTeX2e port: \bf Copyright \copyright\ : Lemma 1 Ltd \number\year
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
\subsection{Document Cross References}
\bibliographystyle{fmu}
\bibliography{fmu,daz}

\pagebreak
\section{INTRODUCTION}
This document contains an example of the Compliance Notation.
The example is concerned with the computational aspects of a simple calculator.

Part of the purpose of this example is to demonstrate the insertion of hypertext links in the script by the compliance tool
(see \cite{ISS/HAT/DAZ/USR501}).
For this reason, the example adopts the rather unusual policy of giving proofs of VCs immediately after the Compliance Notation clause which generates them (so that the interleaving of refinement steps and proofs is fairly complicated).

This example has also been used in the {\em Compliance Tool --- Proving VCs}
tutorial, \cite{ISS/HAT/DAZ/USR503}. For reference purposes, a proof script
for all the VCs has been supplied in \cite{ISS/HAT/DAZ/WRK513}. These
proofs illustrate the techniques advocated in the tutorial, and differ slightly from those presented here.

\section{PREAMBLE}

The following Standard ML command sets up the Compliance Tool to process the rest of the script.
=SML
force_delete_theory"BASICS'spec" handle Fail _ => ();
new_script {name="BASICS", unit_type="spec"};
=TEX
\newpage
\section{BASIC DEFINITIONS}
In this section, we define types and constants which will be of use throughout the rest of the script.

The SPARK package $BASICS$ below helps record the following facts:

\begin{quotation}
The calculator deals with signed integers expressed using up to six decimal digits.
It has a numeric keypad and 6 operation buttons labelled $+$, $-$, $\times$, $+/-$, $!$, $\sqrt{ }$, and $=$.
\end{quotation}

ⓈCN
package BASICS is

    BASE : constant INTEGER := 10;
    PRECISION : constant INTEGER := 6;
    MAX_NUMBER : constant INTEGER := BASE ** PRECISION - 1;
    MIN_NUMBER : constant INTEGER := -MAX_NUMBER;

    subtype DIGIT is INTEGER range 0 .. BASE - 1;

    subtype NUMBER is INTEGER range MIN_NUMBER .. MAX_NUMBER;

    type OPERATION is
      (PLUS, MINUS, TIMES, CHANGE_SIGN, SQUARE_ROOT, FACTORIAL, EQUALS);

end BASICS;
■
=SML
output_ada_program{script="BASICS'spec", out_file="wrk507.ada"};
output_hypertext_edit_script{out_file="wrk507.ex"};
=TEX
\newpage
\section{THE STATE}
In this section, we define a package which contains all the state variables of the calculator.

The package $STATE$ below defines the variables we will use to implement the following informal description of part of the calculator's behaviour:

\begin{quotation}
The calculator has two numeric state variables: the display, which contains the number currently being entered, and the accumulator, which contains the last result calculated.

The user is considered to be in the process of entering a number whenever a digit button is pressed, and entry of a number is terminated by pressing one of the operation keys.

When a binary operation key is pressed, the operation is remembered so that it can be calculated when the second operand has been entered.
\end{quotation}

=SML
new_script {name="STATE", unit_type="spec"};
=TEX

ⓈCN
with BASICS;
package STATE is

    DISPLAY, ACCUMULATOR : BASICS.NUMBER;

    LAST_OP : BASICS.OPERATION;

    IN_NUMBER : BOOLEAN;

end STATE;
■
=TEX
=SML
output_ada_program{script="-", out_file="wrk507a.ada"};
output_hypertext_edit_script{out_file="wrk507a.ex"};
=TEX
\newpage
\section{THE OPERATIONS}

In this section, we define a package which contains procedures corresponding to pressing the calculator buttons.

\subsection{Package Specification}

We now want to introduce a package $OPERATIONS$ which implements the following informal description ofhow the calculator responds to button presses:

\begin{quotation}
The behaviour when a digit button is pressed depends on whether a number is currently being entered into the display. If a number is being entered, then the digit is taken as part of the number. If a number is not being entered (e.g., if an operation button has just been pressed), then the digit is taken as the most significant digit of a new number in the display.

When a binary operation button is pressed, any outstanding calculation is carried out and the answer (which will be the first operand of the operation) is  displayed; the calculator is then ready for the user to enter the other operand of the operation.

When a unary operation button is pressed, the result of performing that operation to the displayed number is computed and displayed; the accumulator is unchanged, but entry of the displayed number is considered to be complete.

When the button marked $=$ is pressed, any outstanding calculation is carried out and the answer is displayed.
\end{quotation}

The package implementing this is defined in section \ref{PackageOPERATIONS} below after we have dealt with some preliminaries.

\subsubsection{Z Preliminaries}
=SML
open_theory "BASICS'spec";
new_theory "preliminaries";
=TEX
To abbreviate the description of the package, we do some work in Z first, corresponding to the various sorts of button press.

Note that the use of
=INLINEFT
ℤ
=TEX
\ rather than
=INLINEFT
BASICSoNUMBER
=TEX
\ reflects the fact that we are ignoring questions of arithmetic overflow here.
If we used the Z set which accurately represents the SPARK type, then we would have to add in pre-conditions saying that the operations do not overflow.
The following schema defines what happens when a digit button is pressed.

┌ DO_DIGIT ───────────
│ DISPLAY⋎0, DISPLAY : ℤ;
│ IN_NUMBER⋎0, IN_NUMBER : BOOLEAN;
│ D : BASICSoDIGIT
├──────
│	IN_NUMBER⋎0 = TRUE ⇒ DISPLAY = DISPLAY⋎0*BASICSoBASE + D;
│	IN_NUMBER⋎0 = FALSE ⇒  DISPLAY = D;
│	IN_NUMBER = TRUE
└──────────────

We now define sets $UNARY$ and $BINARY$ which partition the two sorts of operation key.
Note that $=$ can be considered as a sort of binary operation (which given operands $x$ and $y$ returns $x$).
ⓈZ
│ UNARY ≜ {BASICSoCHANGE_SIGN, BASICSoFACTORIAL, BASICSoSQUARE_ROOT}
■

ⓈZ
│ BINARY ≜ BASICSoOPERATION \ UNARY
■
We need to define a function for computing factorials in order to define the response to the factorial operation button.

ⓈZAX
│	fact : ℕ → ℕ
├──────
│	fact 0 = 1 ;
│ 	∀m:ℕ⦁ fact(m+1) = (m + 1) * fact m
■
Unary operations behave as specified by the following schema.
In which we do specify explicitly  that the accumulator and last operation values are unchanged for clarity and for simplicity later on (when we group the unary and binary operations together).

┌ DO_UNARY_OPERATION ───────────
│ ACCUMULATOR⋎0, ACCUMULATOR : ℤ;
│ DISPLAY⋎0, DISPLAY : ℤ;
│ LAST_OP⋎0, LAST_OP : ℤ;
│ IN_NUMBER : BOOLEAN;
│ O : UNARY
├──────
│	IN_NUMBER = FALSE;
│	ACCUMULATOR = ACCUMULATOR⋎0;
│	LAST_OP = LAST_OP⋎0;
│	O = BASICSoCHANGE_SIGN ⇒ DISPLAY = ~DISPLAY⋎0;
│	O = BASICSoFACTORIAL ∧ DISPLAY⋎0 ≥ 0 ⇒ DISPLAY = fact DISPLAY⋎0;
│	O = BASICSoSQUARE_ROOT  ∧ DISPLAY⋎0 ≥ 0 ⇒
│			DISPLAY ** 2 ≤ DISPLAY⋎0 < (DISPLAY + 1) ** 2
└──────────────
The binary operations are specified by the following schema.
┌ DO_BINARY_OPERATION ───────────
│ ACCUMULATOR⋎0, ACCUMULATOR : ℤ;
│ DISPLAY⋎0, DISPLAY : ℤ;
│ LAST_OP⋎0, LAST_OP : ℤ;
│ IN_NUMBER : BOOLEAN;
│ O : BINARY
├──────
│	IN_NUMBER = FALSE;
│	DISPLAY = ACCUMULATOR;
│	LAST_OP = O;
│	LAST_OP⋎0 = BASICSoEQUALS ⇒
│			ACCUMULATOR = DISPLAY⋎0;
│	LAST_OP⋎0 = BASICSoPLUS ⇒
│			ACCUMULATOR = ACCUMULATOR⋎0 + DISPLAY⋎0;
│	LAST_OP⋎0 = BASICSoMINUS ⇒
│			ACCUMULATOR = ACCUMULATOR⋎0 - DISPLAY⋎0;
│	LAST_OP⋎0 = BASICSoTIMES ⇒
│			ACCUMULATOR = ACCUMULATOR⋎0 * DISPLAY⋎0
└──────────────
The disjunction of the schemas for the unary and binary operations is then what is needed to define the response to pressing an arbitrary button press.
ⓈZ
│ DO_OPERATION ≜ DO_UNARY_OPERATION ∨ DO_BINARY_OPERATION
■
\newpage
\subsection{The SPARK Package}\label{PackageOPERATIONS}
We will now use the schemas of the previous section to define the package $OPERATIONS$.
First we set up the script in which to develop the package.
=SML
new_script1 {name="OPERATIONS", unit_type="spec", library_theories=["preliminaries"]};
=TEX
Since we used the short forms of the SPARK names in the previous section, we need to rename the schema signature variables to prefix them with the appropriate package names.
ⓈCN
with BASICS, STATE;
package OPERATIONS is
procedure DIGIT_BUTTON (D : in BASICS.DIGIT)
        Δ STATEoDISPLAY, STATEoIN_NUMBER [
         DO_DIGIT [
           STATEoDISPLAY⋎0/DISPLAY⋎0,  STATEoDISPLAY/DISPLAY,
           STATEoIN_NUMBER⋎0/IN_NUMBER⋎0, STATEoIN_NUMBER/IN_NUMBER,
           D/D] ] ;
procedure OPERATION_BUTTON (O : in BASICS.OPERATION)
        Δ STATEoACCUMULATOR, STATEoDISPLAY,
                STATEoIN_NUMBER, STATEoLAST_OP [
         DO_OPERATION[
          STATEoACCUMULATOR⋎0/ACCUMULATOR⋎0,
          STATEoACCUMULATOR/ACCUMULATOR,
          STATEoDISPLAY⋎0/DISPLAY⋎0,  STATEoDISPLAY/DISPLAY,
          STATEoLAST_OP⋎0/LAST_OP⋎0,  STATEoLAST_OP/LAST_OP,
          STATEoIN_NUMBER⋎0/IN_NUMBER⋎0, STATEoIN_NUMBER/IN_NUMBER,
          D/D] ] ;
end OPERATIONS;
■
=TEX
=SML
output_ada_program{script="-", out_file="wrk507b.ada"};
output_hypertext_edit_script{out_file="wrk507b.ex"};
=TEX
\newpage
\subsection{Package Implementation}
\subsubsection{Package Body}
The following specification of the package body is derived from the package specification in the obvious way. We leave a k-slot for any extra declarations we may need.
=SML
new_script {name="OPERATIONS", unit_type="body"};
=TEX

ⓈCN
$references BASICS, STATE;
package body OPERATIONS is
procedure DIGIT_BUTTON (D : in BASICS.DIGIT)
        Δ STATEoDISPLAY, STATEoIN_NUMBER [
         DO_DIGIT [
           STATEoDISPLAY⋎0/DISPLAY⋎0, STATEoDISPLAY/DISPLAY,
           STATEoIN_NUMBER⋎0/IN_NUMBER⋎0, STATEoIN_NUMBER/IN_NUMBER,
           D/D] ]
    is begin
        Δ STATEoDISPLAY, STATEoIN_NUMBER [
         DO_DIGIT [ STATEoDISPLAY⋎0/DISPLAY⋎0, STATEoDISPLAY/DISPLAY,
           STATEoIN_NUMBER⋎0/IN_NUMBER⋎0, STATEoIN_NUMBER/IN_NUMBER,
           D/D] ]				(3001)
    end DIGIT_BUTTON;
procedure OPERATION_BUTTON (O : in BASICS.OPERATION)
        Δ STATEoACCUMULATOR, STATEoDISPLAY,
                 STATEoIN_NUMBER, STATEoLAST_OP [
         DO_OPERATION[
          STATEoACCUMULATOR⋎0/ACCUMULATOR⋎0,
          STATEoACCUMULATOR/ACCUMULATOR,
          STATEoDISPLAY⋎0/DISPLAY⋎0, STATEoDISPLAY/DISPLAY,
          STATEoLAST_OP⋎0/LAST_OP⋎0, STATEoLAST_OP/LAST_OP,
          STATEoIN_NUMBER⋎0/IN_NUMBER⋎0, STATEoIN_NUMBER/IN_NUMBER,
          D/D] ]
    is
       ⟨ Extra Declarations ⟩			( 500 )
    begin
        Δ STATEoACCUMULATOR, STATEoDISPLAY,
                STATEoIN_NUMBER, STATEoLAST_OP [
         DO_OPERATION[ STATEoACCUMULATOR⋎0/ACCUMULATOR⋎0,
          STATEoACCUMULATOR/ACCUMULATOR,
          STATEoDISPLAY⋎0/DISPLAY⋎0, STATEoDISPLAY/DISPLAY,
          STATEoLAST_OP⋎0/LAST_OP⋎0, STATEoLAST_OP/LAST_OP,
          STATEoIN_NUMBER⋎0/IN_NUMBER⋎0, STATEoIN_NUMBER/IN_NUMBER,
          D/D] ]			(3002)
    end OPERATION_BUTTON;
end OPERATIONS;
■
=TEX
Introducing the package body gives us 8 very trivial VCs to prove:
=SML
open_theory "cn";
set_pc"cn";
open_theory "OPERATIONS'body";
set_goal([], get_conjecture"-""vcOPERATIONS_1");
a(REPEAT strip_tac);
val _ = save_pop_thm "vcOPERATIONS_1";
=TEX
=SML
set_goal([], get_conjecture"-""vcOPERATIONS_2");
a(REPEAT strip_tac);
val _ = save_pop_thm "vcOPERATIONS_2";
=TEX
=SML
set_goal([], get_conjecture"-""vcOPERATIONS_3");
a(REPEAT strip_tac);
val _ = save_pop_thm "vcOPERATIONS_3";
=TEX
=SML
set_goal([], get_conjecture"-""vcOPERATIONS_4");
a(REPEAT strip_tac);
val _ = save_pop_thm "vcOPERATIONS_4";
=TEX
=SML
open_theory "OPERATIONSoDIGIT_BUTTON'proc";
set_goal([], get_conjecture"-""vcOPERATIONSoDIGIT_BUTTON_1");
a(REPEAT strip_tac);
val _ = save_pop_thm "vcOPERATIONSoDIGIT_BUTTON_1";
=TEX
=SML
set_goal([], get_conjecture"-""vcOPERATIONSoDIGIT_BUTTON_2");
a(REPEAT strip_tac);
val _ = save_pop_thm "vcOPERATIONSoDIGIT_BUTTON_2";
=TEX
=SML
open_theory "OPERATIONSoOPERATION_BUTTON'proc";
set_goal([], get_conjecture"-""vcOPERATIONSoOPERATION_BUTTON_1");
a(REPEAT strip_tac);
val _ = save_pop_thm "vcOPERATIONSoOPERATION_BUTTON_1";
=TEX
=SML
set_goal([], get_conjecture"-""vcOPERATIONSoOPERATION_BUTTON_2");
a(REPEAT strip_tac);
val _ = save_pop_thm "vcOPERATIONSoOPERATION_BUTTON_2";
=TEX
\subsubsection{Supporting Functions}
We choose to separate out the computation of factorials and square roots into separate functions which replace the k-slot labelled 500.
In both cases, we prepare for the necessary algorithms.
Our approach for both functions is to introduce and initialise appropriately a variable called $RESULT$, demand that this be set to the desired function return value and return that value.

=SML
open_scope "OPERATIONS.OPERATION_BUTTON";
ⓈCN
 (500) ≡
    function FACT (M : NATURAL) return NATURAL
        Ξ [ FACT(M) = fact(M) ]
    is
        RESULT : NATURAL;
    begin
        RESULT := 1;
        Δ RESULT [M ≥ 0 ∧ RESULT = 1, RESULT = fact M ]	(1001)
        return RESULT;
    end FACT;

    function SQRT (M : NATURAL) return NATURAL
        Ξ [SQRT(M) ** 2 ≤ M < (SQRT(M) + 1) ** 2]
    is
        RESULT : NATURAL;
       ⟨ other local vars ⟩		(2)
    begin
       RESULT := 0;
       Δ RESULT [RESULT = 0, RESULT ** 2 ≤ M < (RESULT + 1) ** 2]	(2001)
      return RESULT;
    end SQRT;
■
The above results in a number of VCs to show that the function bodies achieve what is demanded in the function specification.
We now prove these VCs, some of which require the following lemma about SPARK natural numbers.
=SML
open_theory "preliminaries";
set_goal([], ⓩ∀m : NATURAL⦁ m ≥ 0⌝);
a(rewrite_tac[z_get_specⓩNATURAL⌝] THEN REPEAT strip_tac);
val natural_thm = save_pop_thm"natural_thm";
open_scope "OPERATIONS.OPERATION_BUTTON.FACT";
=TEX
=SML
set_goal([], get_conjecture"-""vcOPERATIONSoOPERATION_BUTTONoFACT_1");
a(REPEAT strip_tac THEN all_fc_tac[natural_thm]);
val _ = save_pop_thm "vcOPERATIONSoOPERATION_BUTTONoFACT_1";
=TEX
=SML
set_goal([], get_conjecture"-""vcOPERATIONSoOPERATION_BUTTONoFACT_2");
a(REPEAT strip_tac THEN all_var_elim_asm_tac1);
val _ = save_pop_thm "vcOPERATIONSoOPERATION_BUTTONoFACT_2";
=TEX
=SML
open_scope "OPERATIONS.OPERATION_BUTTON.SQRT";
set_goal([], get_conjecture"-""vcOPERATIONSoOPERATION_BUTTONoSQRT_1");
a(REPEAT strip_tac);
val _ = save_pop_thm "vcOPERATIONSoOPERATION_BUTTONoSQRT_1";
=TEX
=SML
set_goal([], get_conjecture"-""vcOPERATIONSoOPERATION_BUTTONoSQRT_2");
a(REPEAT strip_tac THEN all_var_elim_asm_tac1);
val _ = save_pop_thm "vcOPERATIONSoOPERATION_BUTTONoSQRT_2";
=TEX
=SML
open_scope "OPERATIONS";
=TEX
\subsubsection{Algorithm for Factorial}
Factorial is implemented by a for-loop with loop-counter $J$ and an invariant requiring that as $J$ steps from $2$ up to $M$, $RESULT$ is kept equal to the factorial of $J$:
=SML
open_scope "OPERATIONS.OPERATION_BUTTON.FACT";
ⓈCN
  (1001) ⊑
    for J in INTEGER range 2 .. M
    loop
        Δ RESULT [J ≥ 1 ∧ RESULT = fact (J-1), RESULT = fact J] (1002)
    end loop;
■
This produces 4 VCs, which we proceed to prove, beginning with a lemma about the first two values of factorial (needed because our algorithm avoids the unnecessary pass through the loop with $J = 1$).

=TEX
=SML
set_goal([], ⓩfact 0 = 1 ∧ fact 1 = 1⌝);
a(rewrite_tac[z_get_specⓩfact⌝,
	(rewrite_rule[z_get_specⓩfact⌝] o z_∀_elimⓩ0⌝ o
			∧_right_elim o ∧_right_elim o z_get_spec)ⓩfact⌝
]);
val fact_thm  = save_pop_thm"fact_thm";
=TEX
=SML
set_goal([], get_conjecture"-""vc1001_1");
a(REPEAT strip_tac THEN asm_rewrite_tac[fact_thm]);
val _ = save_pop_thm "vc1001_1";
=TEX
=SML
set_goal([], get_conjecture"-""vc1001_2");
a(REPEAT strip_tac THEN all_var_elim_asm_tac1);
a(lemma_tacⓩM = 0 ∨ M = 1⌝);
(* *** Goal "1" *** *)
a(PC_T1 "z_lin_arith" asm_prove_tac[]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[fact_thm]);
(* *** Goal "3" *** *)
a(asm_rewrite_tac[fact_thm]);
val _ = save_pop_thm "vc1001_2";
=TEX
=SML
set_goal([], get_conjecture"-""vc1001_3");
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(asm_ante_tacⓩ2 ≤ J⌝ THEN PC_T1 "z_lin_arith" prove_tac[]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[z_plus_assoc_thm]);
val _ = save_pop_thm "vc1001_3";
=TEX
=SML
set_goal([], get_conjecture"-""vc1001_4");
a(REPEAT strip_tac THEN asm_rewrite_tac[]);
val _ = save_pop_thm "vc1001_4";
=TEX
Now we can complete the implementation of the factorial function by providing the loop body:

ⓈCN
  (1002) ⊑
       RESULT := J * RESULT;
■
Again this gives rise to a VC which we prove immediately, completing the implementation and verification of the factorial function:
=SML
set_goal([], get_conjecture"-""vc1002_1");
a(REPEAT strip_tac THEN all_var_elim_asm_tac1);
a(lemma_tacⓩ∃K:𝕌⦁ K + 1 = J⌝);
(* *** Goal "1" *** *)
a(z_∃_tacⓩJ - 1⌝ THEN PC_T1 "z_lin_arith" prove_tac[]);
(* *** Goal "2" *** *)
a(all_var_elim_asm_tac1);
a(rewrite_tac[z_plus_assoc_thm]);
a(ALL_FC_T rewrite_tac[z_get_specⓩfact⌝]);
val _ = save_pop_thm "vc1002_1";
=TEX
\subsubsection{Algorithm for Square Root}
For square root, we need two extra variables to implement a binary search for the square root.

=SML
open_scope"OPERATIONS.OPERATION_BUTTON.SQRT";
ⓈCN
(2) ≡
    MID, HI : INTEGER;
■
The following just says that we propose to achieve the desired effect on $RESULT$ using $MID$ and $HI$ as well.
ⓈCN
(2001) ⊑
        Δ RESULT, MID, HI
            [RESULT = 0, RESULT ** 2 ≤ M < (RESULT + 1) ** 2] (2002)
■
=TEX
This produces two very trivial VCs:
=SML
set_goal([], get_conjecture "-" "vc2001_1");
a(REPEAT strip_tac);
val _ = save_pop_thm "vc2001_1";
=TEX
=SML
set_goal([], get_conjecture "-" "vc2001_2");
a(REPEAT strip_tac);
val _ = save_pop_thm "vc2001_2";
=TEX
Now we give the initialisation for $HI$ and describe the loop which will find the square root:

ⓈCN
(2002) ⊑
       HI := M + 1;
       $till ⟦RESULT ** 2 ≤ M < (RESULT + 1) ** 2⟧
       loop
           Δ RESULT, MID, HI
               [RESULT ** 2 ≤ M < HI ** 2, RESULT ** 2 ≤ M < HI ** 2] (2003)
       end loop;
■
=TEX
This gives us 3 more VCs to prove, which depend on a few mathematical facts about the exponentiation operator:

=TEX
=SML
set_goal([], ⓩ∀x: ℤ⦁  x ** 1 = x⌝);
a(REPEAT strip_tac);
a(rewrite_tac[rewrite_rule[](
    z_∀_elimⓩ(x ≜ x, y ≜ 0)⌝ (∧_right_elim(z_get_specⓩ(_**_)⌝)))]);
val star_star_1_thm = pop_thm();
=TEX
=SML
set_goal([], ⓩ∀x: ℤ⦁  x ** 2 = x * x⌝);
a(REPEAT strip_tac);
a(rewrite_tac[star_star_1_thm, rewrite_rule[](
    z_∀_elimⓩ(x ≜ x, y ≜ 1)⌝ (∧_right_elim(z_get_specⓩ(_**_)⌝)))]);
val star_star_2_thm = pop_thm();
=TEX
=SML
set_goal([], get_conjecture "-" "vc2002_1");
a(REPEAT strip_tac THEN all_fc_tac[natural_thm]);
(* *** Goal "1" *** *)
a(asm_rewrite_tac[star_star_1_thm, star_star_2_thm]);
(* *** Goal "2" *** *)
a(POP_ASM_T ante_tac THEN DROP_ASMS_T discard_tac THEN strip_tac);
a(z_≤_induction_tacⓩM⌝);
(* *** Goal "2.1" *** *)
a(rewrite_tac[star_star_1_thm, star_star_2_thm]);
(* *** Goal "2.2" *** *)
a(POP_ASM_T ante_tac);
a(rewrite_tac[star_star_2_thm]);
a(PC_T1 "z_lin_arith" asm_prove_tac[]);
val _ = save_pop_thm "vc2002_1";
=TEX
=SML
set_goal([], get_conjecture "-" "vc2002_2");
a(REPEAT strip_tac);
val _ = save_pop_thm "vc2002_2";
=TEX
=SML
set_goal([], get_conjecture "-" "vc2002_3");
a(REPEAT strip_tac);
val _ = save_pop_thm "vc2002_3";
=TEX
Now we implement the exit for the loop and specify the next step:
ⓈCN
(2003) ⊑
       exit when RESULT + 1 = HI;
       Δ RESULT, MID, HI
            [RESULT ** 2 ≤ M < HI ** 2, RESULT ** 2 ≤ M < HI ** 2] (2004)
■
Again we get VCs which we now prove:

=TEX
=SML
set_goal([], get_conjecture "-" "vc2003_1");
a(rewrite_tac[]);
a(REPEAT strip_tac);
a(all_var_elim_asm_tac1);
val _ = save_pop_thm "vc2003_1";
=TEX
=SML
set_goal([], get_conjecture "-" "vc2003_2");
a(REPEAT strip_tac);
val _ = save_pop_thm "vc2003_2";
=TEX
=SML
set_goal([], get_conjecture "-" "vc2003_3");
a(REPEAT strip_tac);
val _ = save_pop_thm "vc2003_3";
=TEX
Now we can fill in the last part of the loop:
ⓈCN
(2004)    ⊑
    MID := (RESULT + HI + 1) / 2;
    if      MID ** 2 > M
    then    HI := MID;
    else    RESULT := MID;
    end if;
■
=TEX
We now prove the 2 VCs produced, which completes the implementation and verification of the square root function.

=SML
set_goal([], get_conjecture "-" "vc2004_1");
a(rewrite_tac[star_star_2_thm]);
a(REPEAT strip_tac);
val _ = save_pop_thm "vc2004_1";
=TEX
=SML
set_goal([], get_conjecture "-" "vc2004_2");
a(rewrite_tac[star_star_2_thm]);
a(REPEAT strip_tac);
val _ = save_pop_thm "vc2004_2";
=TEX
\subsubsection{Digit Button Algorithm}
We now continue with the body of the digit button procedure.
An if-statement handling the two cases for updating the display, followed by an assignment to the flag should meet the bill here.
=SML
open_scope"OPERATIONS.DIGIT_BUTTON";
ⓈCN
 (3001) ⊑
    if    STATE.IN_NUMBER
    then  STATE.DISPLAY := STATE.DISPLAY * BASICS.BASE + D;
    else  STATE.DISPLAY := D;
    end if;
    STATE.IN_NUMBER := true;
■
=TEX
This produces 2 VCs corresponding to the two branches of the if-statement.
Both are easy to prove:
=SML
set_goal([], get_conjecture"-""vc3001_1");
a(REPEAT strip_tac);
a(asm_rewrite_tac[z_get_specⓩDO_DIGIT⌝]);
a(REPEAT strip_tac);
val _ = save_pop_thm "vc3001_1";
=TEX
=SML
set_goal([], get_conjecture"-""vc3001_2");
a(REPEAT strip_tac);
a(asm_rewrite_tac[z_get_specⓩDO_DIGIT⌝]);
val _ = save_pop_thm "vc3001_2";
=TEX
\subsubsection{Operation Button Algorithm}
We now complete the implementation and verification of the package $OPERATIONS$ by giving the body of the procedure for handling the operation buttons.
=SML
open_scope "OPERATIONS.OPERATION_BUTTON";
ⓈCN
 (3002) ⊑
    if      O = BASICS.CHANGE_SIGN
    then    STATE.DISPLAY := -STATE.DISPLAY;
    elsif   O = BASICS.FACTORIAL
    then    STATE.DISPLAY := FACT(STATE.DISPLAY);
    elsif   O = BASICS.SQUARE_ROOT
    then    STATE.DISPLAY := SQRT(STATE.DISPLAY);
    else    if      STATE.LAST_OP = BASICS.EQUALS
            then    STATE.ACCUMULATOR := STATE.DISPLAY;
            elsif   STATE.LAST_OP = BASICS.PLUS
            then   STATE.ACCUMULATOR := STATE.ACCUMULATOR + STATE.DISPLAY;
            elsif   STATE.LAST_OP = BASICS.MINUS
            then   STATE.ACCUMULATOR := STATE.ACCUMULATOR - STATE.DISPLAY;
            elsif   STATE.LAST_OP = BASICS.TIMES
            then   STATE.ACCUMULATOR := STATE.ACCUMULATOR * STATE.DISPLAY;
            end if;
            STATE.DISPLAY := STATE.ACCUMULATOR;
            STATE.LAST_OP := O;
    end if;
    STATE.IN_NUMBER := false;
■
=TEX
=SML
open_theory "preliminaries";
val basics_defs = map z_get_spec(get_consts"BASICS'spec");
val op_defs = map z_get_spec(flat(
	map get_consts ["preliminaries", "OPERATIONS'body", "OPERATIONS'spec"]));
=TEX
The first three VCs are concerned with the unary operations.
=SML
open_scope "OPERATIONS.OPERATION_BUTTON";
set_goal([], get_conjecture"-""vc3002_1");
a(rewrite_tac op_defs);
a(z_∀_tac THEN ⇒_tac THEN asm_rewrite_tac basics_defs);
val _ = save_pop_thm "vc3002_1";
=TEX
For the next two VCs, it is necessary to make the (reasonable) assumption that a non-negative number of the precision handled by the calculator will fit in a SPARK $NATURAL$.
This amounts to the following axiom:
ⓈZ
│ BASICSoMAX_NUMBER ≤ INTEGERvLAST
■
=SML
val number_ax = snd(hd(get_axioms"-"));
=SML
set_goal([], get_conjecture"-""vc3002_2");
a(rewrite_tac op_defs);
a(z_∀_tac THEN ⇒_tac THEN asm_rewrite_tac basics_defs);
a(all_var_elim_asm_tac1 THEN strip_tac);
a(lemma_tac ⓩSTATEoDISPLAY ∈ NATURAL⌝);
(* *** Goal "1" *** *)
a(DROP_NTH_ASM_T 5 ante_tac);
a(ante_tac number_ax);
a(asm_rewrite_tac(z_get_specⓩNATURAL⌝ :: basics_defs));
a(PC_T1 "z_lin_arith" prove_tac[]);
(* *** Goal "2" *** *)
a(ALL_FC_T rewrite_tac[z_get_specⓩFACT⌝]);
val _ = save_pop_thm "vc3002_2";
=TEX
=SML
set_goal([], get_conjecture"-""vc3002_3");
a(rewrite_tac op_defs);
a(z_∀_tac THEN ⇒_tac THEN asm_rewrite_tac basics_defs);
a(all_var_elim_asm_tac1 THEN strip_tac);
a(lemma_tac ⓩSTATEoDISPLAY ∈ NATURAL⌝);
(* *** Goal "1" *** *)
a(DROP_NTH_ASM_T 6 ante_tac);
a(ante_tac number_ax);
a(asm_rewrite_tac(z_get_specⓩNATURAL⌝ :: basics_defs));
a(PC_T1 "z_lin_arith" prove_tac[]);
(* *** Goal "2" *** *)
a(all_fc_tac[z_get_specⓩSQRT⌝]);
a(REPEAT strip_tac);
val _ = save_pop_thm "vc3002_3";
=TEX
Because the binary operations only involve built-in arithmetic operators, they are a little easier to verify than the unary ones.
=SML
set_goal([], get_conjecture"-""vc3002_4");
a(rewrite_tac op_defs);
a(z_∀_tac THEN ⇒_tac THEN asm_rewrite_tac basics_defs);
val _ = save_pop_thm "vc3002_4";
=TEX
=SML
set_goal([], get_conjecture"-""vc3002_5");
a(rewrite_tac op_defs);
a(z_∀_tac THEN ⇒_tac THEN asm_rewrite_tac basics_defs);
val _ = save_pop_thm "vc3002_5";
=TEX
=SML
set_goal([], get_conjecture"-""vc3002_6");
a(rewrite_tac op_defs);
a(z_∀_tac THEN ⇒_tac THEN asm_rewrite_tac basics_defs);
val _ = save_pop_thm "vc3002_6";
=TEX
=SML
set_goal([], get_conjecture"-""vc3002_7");
a(rewrite_tac op_defs);
a(z_∀_tac THEN ⇒_tac THEN asm_rewrite_tac basics_defs);
val _ = save_pop_thm "vc3002_7";
=TEX
=SML
set_goal([], get_conjecture"-""vc3002_8");
a(rewrite_tac op_defs);
a(z_∀_tac THEN ⇒_tac THEN asm_rewrite_tac basics_defs);
val _ = save_pop_thm "vc3002_8";
=TEX
That completes the formal verification of the calculator packages.
=TEX
=SML
output_ada_program{script="OPERATIONS'body", out_file="wrk507c.ada"};
output_hypertext_edit_script{out_file="wrk507c.ex"};
=TEX
\section{EPILOGUE}
=TEX
The following {\ProductML} commands produce the various parts of the Z document and then print out a message for use when this script is used as part of the Compliance Tool test suite.
=SML
output_z_document{script="BASICS'spec", out_file="wrk507.zdoc"};
output_z_document{script="STATE'spec", out_file="wrk507a.zdoc"};
output_z_document{script="OPERATIONS'spec", out_file="wrk507b.zdoc"};
output_z_document{script="OPERATIONS'body", out_file="wrk507c.zdoc"};
=TEX
The following commands check that all the VCs have been proved.
=SML
val thys = get_descendants "cn" less "cn";
val unproved =
map (fn thy => (open_theory thy; (thy, get_unproved_conjectures thy))) thys drop (is_nil o snd);
val _ =
	if	is_nil unproved
	then	diag_line "All module tests passed"
	else	diag_line "Some VCs have not been proved";
=TEX
%\pagebreak
%\HOLindexOff
%\input{wrk507.th.tex}
%\HOLindexOn
%\twocolumn[\section{INDEX OF DEFINED TERMS}]
%\printindex
\end{document}
=IGN


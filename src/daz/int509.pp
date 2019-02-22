=IGN
********************************************************************************
int509.doc: this file is part of the PPDaz system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% ℤ $Date: 2006/09/19 11:24:22 $ $Revision: 1.25 $ $RCSfile: int509.doc,v $
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

\def\Title{SPARK Constructs}

\def\AbstractText{This document gives a Compliance Notation script with examples of each kind of SPARK expression, basic declaration and statement.}

\def\Reference{ISS/HAT/DAZ/INT509}

\def\Author{G.M. Prout}


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
%% LaTeX2e port: \TPPtitle{SPARK Constructs}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{SPARK Constructs}
%% LaTeX2e port: \TPPref{ISS/HAT/DAZ/INT509}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.25 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2006/09/19 11:24:22 $%
%% LaTeX2e port: }}  %% Mandatory field (with sensible default)
%% LaTeX2e port: \TPPstatus{Informal}
%% LaTeX2e port: %\TPPstatus{Informal}
%% LaTeX2e port: \TPPtype{Technical}
%% LaTeX2e port: %\TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{G.M.~Prout & HAT Team}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & WIN01}
%% LaTeX2e port: \TPPabstract{%
%% LaTeX2e port: This document gives a Compliance Notation script with examples of each kind of SPARK expression, basic declaration and statement.
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
\item[Issues 1.1 (1995/11/10) - 1.2 (1995/12/18)%
] Initial Drafts.
\item[Issues 1.3 (1995/12/19) - 1.4 (1995/12/21)%
] Enhancements added.
\item[Issue 1.5 (1996/02/16)] Accommodated fix to bug 12 (V0.6).
\item[Issue 1.6 (1997/05/29)-1.7 (1997/06/02)]
Updated for IUCT WP 7 changes.
\item[Issue 1.8 (1997/07/21)] Changes for IUCT WP 4.
\item[Issue 1.9 (2000/06/24)] Made it work with June 200 enhancements.
\item[Issue 1.10 (2000/10/23)] CTLE II --- characters and strings now supported formally, so tests need to be more careful.
\item[Issue 1.11 (2000/10/31)] CTLE II --- real types now supported formally.
\item[Issue 1.12 (2002/03/01)] More tests on type conversions.
\item[Issue 1.13 (2002/08/23)] Removed use of ICL logo font.
\item[Issue 1.14 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.15 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.16 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.17 (2004/01/19)] The Z universal set is now called 𝕌
\item[Issue 1.18 (2004/07/17)] Environment reforms change order of declarations.
\item[Issue 1.19 (2005/05/28)] Compliance Notation reserved words are now prefixed by a dollar sign.
\item[Issue 1.20 (2005/08/16)] Allowed for improvement to Z proof contexts.
\item[Issue 1.21 (2006/03/28)] Allowed for automated state management.
\item[Issue 1.23 (2006/04/20)] Ada real literals are now translated into Z floating point literals.
\item[Issue 1.24 (2006/06/01)] accommodated enhancement 139 - 1-theory-per-subprogram.
\item[Issue 1.25 (2006/09/19)] Allowed for enhancement 165.
\item[Issue 1.26 (2008/02/10)] Allowed for change to lexical rules for underscores in Z.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported daz source documents onto the Lemma 1 document template
%%%% END OF CHANGES HISTORY %%%%
\end{description}

\subsection{Changes Forecast}
Tests to be added as time permits.

\pagebreak
\section{GENERAL}

\subsection{Scope}

This document contains test data for the Compliance Tool as specified in \cite{ISS/HAT/DAZ/HLD501} and \cite{ISS/HAT/DAZ/USR501}.

\subsection{Introduction}

This document contains specific tests for the translation of Spark expressions, basic declarations and statements i.e., exercising each use of the expressions and basic declarations listed in sections 5 and 6 of volume 3 of \cite{DRA/CIS/CSE3/TR/94/27/2.1} and the statements listed in section 4 of volume 2 of \cite{DRA/CIS/CSE3/TR/94/27/2.1}. The test names correspond to the sections of \cite{DRA/CIS/CSE3/TR/94/27/2.1} in which the constructs are specified.

\section{THE LITERATE SCRIPTS}


\subsection{Setting up of the environment}

Set up flags so the compliance tool works correctly .

=SML
set_flags [("z_type_check_only", false),("z_use_axioms", true)];
=TEX

Load the test harness.

=SML
use_file "dtd013";
use_file "imp013";
=TEX

\subsection{Useful functions}

Function to clean up before doing a test.
=SML
fun clean_up () = (
        let     val thys = (get_descendants "cn" less "cn")
                                        diff get_cache_theories();
                fun del_thy thy = (force_delete_theory thy handle Fail _ => ());
        in      map del_thy thys
        end;    ()
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
Function for saving and naming theorems:
=SML
fun chk_thm () : unit = (
        let val thm = pop_thm();
                fun save th i = (
                        save_thm(string_of_int i, th)
                        handle Fail _ => save th (i+1)
                );
        in      save thm 1; ()
        end
);
=TEX
Function to check that number of vcs in a theory matches the number of proven theorems:
=SML
fun chk_vcs () : bool = (
        length (get_conjectures "-") = length (get_thms"-")
);
=TEX
\pagebreak
\section{EXPRESSIONS} \label{EXP}
\subsection{Identifier}
=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX
ⓈCN
procedure P is
   C1 : constant INTEGER := 9;
   C2 : constant INTEGER := C1;
begin
   null;
end P;
■
=SML
set_pc"cn";
set_goal([], ⓩC2 = C1⌝);
a(rewrite_tac[z_get_spec ⓩC2⌝]);
=TEX
=SML
store_mt_results mt_run [("5.2",chk_thm,(),())];
=TEX

\subsection{Aggregates}
\subsubsection{Positional Array}
=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX
ⓈCN
procedure P is
   type DAY is (MON, TUE, WED, THU, FRI, SAT, SUN);
   subtype INDEX is INTEGER range 2 .. 4;
   type ARR is array (INDEX) of DAY;
   C : constant ARR := ARR'(THU, FRI, SAT);
begin
   null;
end P;
■
=SML
set_pc"cn";
set_goal([], ⓩC = succ ↗ 1 - ARRvFIRST ↕ ⨾ ⟨THU, FRI, SAT⟩⌝);
a(rewrite_tac[z_get_spec ⓩC⌝]);
=TEX
=SML
store_mt_results mt_run [("5.3",chk_thm,(),())];
=TEX
\subsubsection{Positional Array With Others}

=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX
ⓈCN
procedure P is
   type DAY is (MON, TUE, WED, THU, FRI, SAT, SUN);
   subtype INDEX is INTEGER range 1 .. 7;
   type ARR is array (INDEX) of DAY;
   C : constant ARR := ARR'(THU, FRI, SAT, others => SUN);
begin
   null;
end P;
■
=SML
set_pc"cn";
set_goal([], ⓩC = (ARRvRANGE × {SUN}) ⊕ (succ ↗ 1 - ARRvFIRST ↕ ⨾ ⟨THU, FRI, SAT⟩)⌝);
a(rewrite_tac[z_get_spec ⓩC⌝]);
=TEX
=SML
store_mt_results mt_run [("5.4",chk_thm,(),())];
=TEX

\subsubsection{Positional Array With Just Others}

=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX
ⓈCN
procedure P is
   type DAY is (MON, TUE, WED, THU, FRI, SAT, SUN);
   subtype INDEX is INTEGER range 2 .. 4;
   type ARR is array (INDEX) of DAY;
   C : constant ARR := ARR'(others => SUN);
begin
   null;
end P;
■
=SML
set_pc"cn";
set_goal([], ⓩC = ARRvRANGE × {SUN}⌝);
a(rewrite_tac[z_get_spec ⓩC⌝]);
=TEX
=SML
store_mt_results mt_run [("5.5",chk_thm,(),())];
=TEX

\subsubsection{Named Array}

=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX
ⓈCN
procedure P is
   type DAY is (MON, TUE, WED, THU, FRI, SAT, SUN);
   type ARR is array (DAY) of DAY;
   C : constant ARR := ARR'(MON .. THU | FRI => WED, SAT | SUN => TUE);
begin
   null;
end P;
■
=SML
set_pc"cn";
set_goal([], ⓩC = ((MON .. THU) ∪ {FRI} × {WED}) ∪ ({SAT, SUN} × {TUE})⌝);
a(rewrite_tac[z_get_spec ⓩC⌝]);
=TEX
=SML
store_mt_results mt_run [("5.6",chk_thm,(),())];
=TEX

\subsubsection{Named Array With Others}

=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX

ⓈCN
procedure P is
   type DAY is (MON, TUE, WED, THU, FRI, SAT, SUN);
   subtype INDEX is INTEGER range 1 .. 7;
   type ARR is array (INDEX) of DAY;
   C : constant ARR := ARR'(1 .. 5 => WED, others => TUE);
begin
   null;
end P;
■
=SML
set_pc"cn";
set_goal([], ⓩC = (ARRvRANGE × {TUE}) ⊕ (1 .. 5 × {WED})⌝);
a(rewrite_tac[z_get_spec ⓩC⌝]);
=TEX
=SML
store_mt_results mt_run [("5.7",chk_thm,(),())];
=TEX
\subsubsection{Positional Record}

=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX

ⓈCN
procedure P is
   type DAY is (MON, TUE, WED, THU, FRI, SAT, SUN);
   type ARR is array (DAY) of DAY;
   type REC is
	record
	   START		: DAY;
	   FINISH		: DAY;
	   YESTERDAY	: ARR;
	end record; 	
		
   C : constant REC := REC'(WED,SUN,ARR'(others => THU));
begin
   null;
end P;
■
=SML
set_pc"cn";
set_goal([], ⓩC =
	(START ≜ WED, FINISH ≜ SUN, YESTERDAY ≜ ARRvRANGE × {THU})⌝);
a(rewrite_tac[z_get_spec ⓩC⌝]);
=TEX
=SML
store_mt_results mt_run [("5.8",chk_thm,(),())];
=TEX

\subsubsection{Named Record}

=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX
ⓈCN
procedure P is
   type DAY is (MON, TUE, WED, THU, FRI, SAT, SUN);
   type ARR is array (DAY) of DAY;
   type REC is
	record
	   START		: DAY;
	   FINISH		: DAY;
	   YESTERDAY	: ARR;
	end record; 	
		
   C : constant REC := REC'(START => THU,
				FINISH => FRI,
				YESTERDAY => ARR'(others => SUN));
begin
   null;
end P;
■
=SML
set_pc"cn";
set_goal([], ⓩC =
	(START ≜ THU, FINISH ≜ FRI, YESTERDAY ≜ ARRvRANGE × {SUN})⌝);
a(rewrite_tac[z_get_spec ⓩC⌝]);
=TEX
=SML
store_mt_results mt_run [("5.9",chk_thm,(),())];
=TEX

\subsection{Unary}
=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX
ⓈCN
procedure P is
   C1 : constant INTEGER := abs (-6);
   C2 : constant BOOLEAN := not FALSE;

begin
   null;
end P;
■
=SML
set_pc"cn";
set_goal([], ⓩC1 = abs ~ 6 ∧ C2 = not FALSE⌝);
a(rewrite_tac[z_get_spec ⓩC1⌝,z_get_spec ⓩC2⌝]);
=TEX
=SML
store_mt_results mt_run [("5.10", chk_thm,(),())];
=TEX

\subsection{Binary}
=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX
ⓈCN
procedure P is
   C : constant BOOLEAN := ((5<5 and 6<=4) or (2>1 and then -1>=0))
				or else (3=3 xor 2 /=3);
begin
   null;
end P;
■
=SML
set_pc"cn";
set_goal([], ⓩC = (5 less 5 and 6 less_eq 4)
			or (2 greater 1 and ~1 greater_eq 0)
			or (3 eq 3 xor 2 noteq 3)⌝);
a(rewrite_tac[z_get_spec ⓩC⌝]);
=TEX
=SML
store_mt_results mt_run [("5.11a",chk_thm,(),())];
=TEX
=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX
ⓈCN
procedure P is
   C : constant INTEGER := 5-3+2*7;
begin
   null;
end P;
■
=SML
set_pc"cn";
set_goal([], ⓩC = (5 - 3) + 2 * 7⌝);
a(rewrite_tac[z_get_spec ⓩC⌝]);
=TEX
=SML
store_mt_results mt_run [("5.11b", chk_thm,(),())];
=TEX
=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX
ⓈCN
procedure P is
   C1 : constant INTEGER := (17 / 3) * 3 + (17 rem 3);
   C2 : constant INTEGER := (-17 / 3) * 3 + (-17 mod 3);
begin
   null;
end P;
■
=SML
set_pc"cn";
set_goal([], ⓩC1 = (17 intdiv 3) * 3 + 17 rem 3 ∧
		C2 = ~ (17 intdiv 3) * 3 + ~ (17 intmod 3)⌝);
a(rewrite_tac[z_get_spec ⓩC1⌝,z_get_spec ⓩC2⌝]);
=TEX
=SML
store_mt_results mt_run [("5.11c", chk_thm,(),())];
=TEX
=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX
ⓈCN
procedure P is
   C : constant INTEGER := 2 ** 3;
begin
   null;
end P;
■
=SML
set_pc"cn";
set_goal([], ⓩC = 2 ** 3⌝);
a(rewrite_tac[z_get_spec ⓩC⌝]);
=TEX
=SML
store_mt_results mt_run [("5.11d",chk_thm,(),())];
=TEX
=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX
ⓈCN
procedure P is
   type DAY is (MON, TUE, WED, THU, FRI, SAT, SUN);
   subtype WEEKDAY is DAY range MON..FRI;
   C : constant BOOLEAN := SUN in WEEKDAY or SUN not in WEEKDAY;
begin
   null;
end P;
■
=SML
set_pc"cn";
set_goal([], ⓩC = SUN mem WEEKDAY or SUN notmem WEEKDAY⌝);
a(rewrite_tac[z_get_spec ⓩC⌝]);
=TEX
=SML
store_mt_results mt_run [("5.11e",chk_thm,(),())];
=TEX
\subsection{Membership of a Range}
=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX
ⓈCN
procedure P is
   C : constant BOOLEAN := 6 in 5..10 or 6 not in 5..10;
begin
   null;
end P;
■
=SML
set_pc"cn";
set_goal([], ⓩC = 6 mem 5 .. 10 or 6 notmem 5 .. 10⌝);
a(rewrite_tac[z_get_spec ⓩC⌝]);
=TEX
=SML
store_mt_results mt_run [("5.12", chk_thm,(),())];
=TEX
\subsection{Attributes}
=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX
ⓈCN
procedure P is
   type DAY is (MON, TUE, WED, THU, FRI, SAT, SUN);
   subtype WEEK is DAY range MON..SUN;
   subtype WEEKDAY is DAY range MON..FRI;
   subtype ALTWEEKDAY is WEEKDAY;
   subtype INDEX is INTEGER range 1 .. 4;
   type ARR is array (INDEX) of DAY;
   C1 : constant DAY := WEEKDAY'FIRST;
   C2 : constant DAY := WEEKDAY'LAST;
   C3 : constant DAY := WEEKDAY'SUCC(FRI);
   C4 : constant DAY := WEEKDAY'PRED(WED);
   C5 : constant INTEGER := WEEKDAY'POS(TUE);
   C6 : constant DAY := WEEKDAY'VAL(6);
   C7 : constant DAY := ARR'FIRST;
   C8 : constant DAY := ARR'LAST;
   C9 : constant INTEGER := ARR'LENGTH;
   C10 : constant DAY := ALTWEEKDAY'FIRST;
   C11 : constant DAY := ALTWEEKDAY'LAST;
begin
   null;
end P;
■
=SML
set_pc"cn";
set_goal([], ⓩC1=WEEKDAYvFIRST∧C2=WEEKDAYvLAST∧C3=WEEKDAYvSUCC(FRI)
	∧C4=WEEKDAYvPRED(WED)∧C5=WEEKDAYvPOS(TUE)
	∧C6=WEEKDAYvVAL(6)∧C7=ARRvFIRST∧C8=ARRvLAST∧C9=ARRvLENGTH ∧
	C10 = C1 ∧ C11 = C2⌝);
a(rewrite_tac(map z_get_spec[ⓩC1⌝,ⓩC2⌝,ⓩC3⌝,ⓩC4⌝,ⓩC5⌝,ⓩC6⌝,ⓩC7⌝,ⓩC8⌝,ⓩC9⌝,
	ⓩC10⌝, ⓩC11⌝, ⓩALTWEEKDAYvFIRST⌝, ⓩALTWEEKDAYvLAST⌝ ]));
=TEX
=SML
store_mt_results mt_run [("5.13",chk_thm,(),())];
=TEX

\subsection{Indexed Components}
=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX
ⓈCN
procedure P is
   type DAY is (MON, TUE, WED, THU, FRI, SAT, SUN);
   subtype INDEX is INTEGER range 1 .. 7;
   type ARR is array (INDEX) of DAY;
   TOMORROW : constant ARR := ARR'(TUE,WED,THU,FRI,SAT,SUN,MON);
   C : constant DAY := TOMORROW(DAY'FIRST);
begin
   null;
end P;
■
=SML
set_pc"cn";
set_goal([], ⓩC=TOMORROW(DAYvFIRST)⌝);
a(rewrite_tac[z_get_spec ⓩC⌝]);
=TEX
=SML
store_mt_results mt_run [("5.14",chk_thm,(),())];
=TEX
\subsection{Selected Components}
=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX
ⓈCN
procedure P is
   type DAY is (MON, TUE, WED, THU, FRI, SAT, SUN);
   type ARR is array (DAY) of DAY;
   type REC is
	record
	   START		: DAY;
	   FINISH		: DAY;
	   YESTERDAY	: ARR;
	end record; 	
   R : constant REC := REC'(WED,FRI,ARR'(others => SUN));		
   C : constant DAY := R.FINISH;
begin
   null;
end P;
■
=SML
set_pc"cn";
set_goal([], ⓩC=R.FINISH⌝);
a(rewrite_tac[z_get_spec ⓩC⌝]);
=SML
store_mt_results mt_run [("5.15",chk_thm,(),())];
=TEX
\subsection{Function Calls}
=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX
ⓈCN
procedure P is
   type DAY is (MON, TUE, WED, THU, FRI, SAT, SUN);
   type ARR is array (DAY) of DAY;
   function MAX (x,y: DAY) return DAY Ξ [ true ];
   type REC is
	record
	   START		: DAY;
	   FINISH		: DAY;
	   YESTERDAY	: ARR;
	end record;
   R : constant REC := REC'(WED,FRI,ARR'(others => SUN)); 	
   C : constant DAY := MAX(THU,R.FINISH);
begin
   null;
end P;
■
=SML
set_pc"cn";
set_goal([], ⓩC=MAX(THU,R.FINISH)⌝);
a(rewrite_tac[z_get_spec ⓩC⌝]);
=TEX
=SML
store_mt_results mt_run [("5.16",chk_thm,(),())];
=TEX
\subsection{Qualified Expressionss}
=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX
ⓈCN
procedure P is
   type DAY is (MON, TUE, WED, THU, FRI, SAT, SUN);
   C : constant DAY := DAY'(THU);
begin
   null;
end P;
■
=SML
set_pc"cn";
set_goal([], ⓩC=THU⌝);
a(rewrite_tac[z_get_spec ⓩC⌝]);
=TEX
=SML
store_mt_results mt_run [("5.17",chk_thm,(),())];
=TEX
\subsection{Type Conversions}
=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX
ⓈCN
procedure P is
   subtype COUNT is INTEGER range 1.. 10;
   type SLICE is digits 6 range 1.0 .. 10.0;
   C1 : constant COUNT := COUNT(4);
   C2 : constant INTEGER := INTEGER(4);
   C3 : constant SLICE := SLICE(C1);
   C4 : constant FLOAT := FLOAT(C1);
   C5 : constant COUNT := COUNT(C3);
begin
   null;
end P;
■
=SML
set_pc"cn";
set_goal([], ⓩC1=4 ∧ C2 = 4 ∧ C3 = real 4 ∧ C4 = real 4 ∧ C5 = real_to_integer(real 4)⌝);
a(rewrite_tac(z_get_specⓩinteger_to_real⌝::map z_get_spec (get_consts"-")));
=TEX
=SML
store_mt_results mt_run [("5.18", chk_thm,(),())];
=TEX
\subsection{Integer Literals}
=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX
ⓈCN
procedure P is
   C : constant INTEGER := 4;
begin
   null;
end P;
■
=SML
set_pc"cn";
set_goal([], ⓩC=4⌝);
a(rewrite_tac[z_get_spec ⓩC⌝]);
=TEX
=SML
store_mt_results mt_run [("5.19",chk_thm,(),())];
=TEX
\subsection{Auxiliary Expressions}
=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX
ⓈCN
procedure P is
   C : constant INTEGER := ⟦6⟧;
begin
   null;
end P;
■
=SML
set_pc"cn";
set_goal([], ⓩC=6⌝);
a(rewrite_tac[z_get_spec ⓩC⌝]);
=TEX
=SML
store_mt_results mt_run [("5.20",chk_thm,(),())];
=TEX
\section{BASIC DECLARATIONS}
\subsection{Constants}
These have been extensively tested in  Section \ref{EXP}. An explicit example of a constant of type string array, part of the enhanced Compliance Notation, is tested here.

=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX

ⓈCN
procedure P is
   subtype INDEX is INTEGER range 1..2;
   type STRING_ARRAY is array(INDEX) of STRING;
   A : constant STRING_ARRAY := STRING_ARRAY'("abc", "xyz");
begin
   null;
end P;
■
=SML
set_pc"cn";
set_goal([], ⓩA = ⟨string_lit "abc", string_lit "xyz"⟩⌝);
a(rewrite_tac(
	pc_rule1 "z_library_ext" prove_rule[] ⓩ∀r: 𝕌⦁(id _) ⨾ r  = r⌝::
	z_succ↗0↕_thm::
	map z_get_spec[ⓩA⌝, ⓩSTRING_ARRAYvFIRST⌝, ⓩINDEXvFIRST⌝, ⓩℤ⌝]));
=TEX
=SML
store_mt_results mt_run [("6.2",chk_thm,(),())];
=TEX

\subsection{Enumeration Types}
=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX
ⓈCN
procedure P is
   type DAY is (MON, TUE, WED, THU, FRI, SAT, SUN);
begin
   null;
end P;
■
=SML
set_pc"cn";
set_goal([], ⓩMON = 0 ∧ TUE = 1 ∧ WED = 2 ∧ THU = 3
	∧ FRI = 4 ∧ SAT = 5 ∧ SUN = 6
	∧ DAY  = MON .. SUN ∧ DAYvFIRST = MON ∧ DAYvLAST = SUN
	∧ DAYvSUCC = (DAY \ {DAYvLAST}) ◁ succ ∧ DAYvPRED = DAYvSUCC ↗~↕
	∧ DAYvVAL = DAYvPOS ↗~↕⌝);
a(rewrite_tac(map z_get_spec (get_consts"P'proc")));
=TEX
=SML
store_mt_results mt_run [("6.3",chk_thm,(),())];
=TEX
\subsection{Array Types}
=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX
ⓈCN
procedure P is
   type DAY is (MON, TUE, WED, THU, FRI, SAT, SUN);
   type HOURS is range 0..23;
   type ARR1 is array (DAY) of DAY;
   type ARR2 is array (DAY,HOURS) of DAY;
   type UNCON1 is array (DAY range <>) of DAY;
   type UNCON2 is array (DAY range <>,HOURS range <>) of DAY;
begin
   null;
end P;
■
=SML
set_pc"cn";
set_goal([], ⓩARR1 = DAY → DAY ∧
		ARR1vFIRST = DAYvFIRST ∧ ARR1vLAST = DAYvLAST ∧
		ARR1vLENGTH = # DAY ∧ ARR1vRANGE = DAY ∧
		UNCON1 ∈ ℙ (DAY ⇸ DAY) ∧ UNCON2 ∈ ℙ (DAY × HOURS ⇸ DAY)⌝);
a(rewrite_tac(map z_get_spec (get_consts"P'proc")));
=TEX
=SML
store_mt_results mt_run [("6.4",chk_thm,(),())];
=TEX
\subsection{Record Types}
=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX
ⓈCN
procedure P is
   type DAY is (MON, TUE, WED, THU, FRI, SAT, SUN);
   type ARR is array (DAY) of DAY;
   type REC is
	record
	   START		: DAY;
	   FINISH		: DAY;
	   YESTERDAY	: ARR;
	end record; 	
begin
   null;
end P;
■
=SML
set_pc"cn";
set_goal([], ⓩREC = [START : DAY; FINISH : DAY; YESTERDAY : ARR]⌝);
a(rewrite_tac(map z_get_spec (get_consts"P'proc")));
=TEX
=SML
store_mt_results mt_run [("6.5",chk_thm,(),())];
=TEX
\subsection{Integer Types}
=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX
ⓈCN
procedure P is
   type HOURS is range 0..23;
begin
   null;
end P;
■
=SML
set_pc"cn";
set_goal([], ⓩHOURS = 0..23 ∧ HOURSvFIRST = 0 ∧ HOURSvLAST = 23
	∧ HOURSvSUCC ∈ ℤ ⇸ ℤ ∧ HOURSvPRED ∈ ℤ ⇸ ℤ
	∧ HOURSvPOS ∈ ℤ ⇸ ℤ ∧ HOURSvVAL ∈ ℤ ⇸ ℤ⌝);
a(rewrite_tac(map z_get_spec (get_consts"P'proc")));
=TEX
=SML
store_mt_results mt_run [("6.6",chk_thm,(),())];
=TEX
\subsection{Real Types}
=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX
ⓈCN
procedure P is
   type FIX is delta 0.1 range 5.1 .. 10.0;
begin
   null;
end P;
■
=SML
set_pc"cn";
set_goal([], ⓩFIX = 5.1 ..⋎R 10.0⌝);
a(rewrite_tac[z_get_specⓩFIX⌝]);
=TEX
=SML
store_mt_results mt_run [("6.7",chk_thm,(),())];
=TEX
\subsection{Subtypes}
=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX
ⓈCN
procedure P is
   type DAY is (MON, TUE, WED, THU, FRI, SAT, SUN);
   subtype WEEKDAY is DAY range MON..FRI;
begin
   null;
end P;
■
=SML
set_pc"cn";
set_goal([], ⓩWEEKDAY = MON .. FRI
		∧ WEEKDAYvFIRST = MON ∧ WEEKDAYvLAST = FRI
		∧ WEEKDAYvSUCC = DAYvSUCC ∧ WEEKDAYvPRED = DAYvPRED
		∧ WEEKDAYvPOS = DAYvPOS ∧ WEEKDAYvVAL = DAYvVAL⌝);
a(rewrite_tac(map z_get_spec (get_consts"P'proc")));
=TEX
=SML
store_mt_results mt_run [("6.8.1",chk_thm,(),())];
=TEX
=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX
ⓈCN
procedure P is
   type FIX is delta 0.1 range 5.1 .. 10.0;
   subtype SUBFIX1 is FIX range 7.0 .. 9.0;
   subtype SUB1 is INTEGER range INTEGER(7.2) .. 10;
begin
   null;
end P;
■
=SML
set_pc"cn";
set_goal([], ⓩ
	SUBFIX1 = 7.0 ..⋎R 9.0
∧	SUBFIX1vFIRST = 7.0
∧	SUB1 = real_to_integer 7.2 .. 10
∧	SUB1vLAST = 10
∧	SUBFIX1vDELTA = 0.1⌝);
a(rewrite_tac(map z_get_spec (get_consts"P'proc")));
=TEX
=SML
store_mt_results mt_run [("6.8.2",chk_thm,(),())];
=TEX
=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX
ⓈCN
procedure P is
   type FLOAT1 is digits 4  range -5.1 .. 10.0;
   type FIX is delta 0.3 range 0.0 .. 10.0;
   subtype SUBFLOAT1 is FLOAT1 digits 4 range -0.8 .. 0.8;
   subtype SUBFIX2 is FIX delta 0.3 range 6.0 .. 10.0;
begin
   null;
end P;
■
=SML
set_pc"cn";
set_goal([], ⓩ
	SUBFLOAT1 = ~⋎R 0.8 ..⋎R 0.8
∧	SUBFIX2 = 6.0 ..⋎R 10.0
∧	FLOAT1vDIGITS = SUBFLOAT1vDIGITS = 4
∧	FIXvDELTA = SUBFIX2vDELTA = 0.3⌝);
a(rewrite_tac(map z_get_spec (get_consts"P'proc")));
=TEX
=SML
store_mt_results mt_run [("6.8.3",chk_thm,(),())];
=TEX
=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX
ⓈCN
procedure P is
   type DAY is (MON, TUE, WED, THU, FRI, SAT, SUN);
   subtype WEEKDAY is DAY range MON..FRI;
   type UNCON is array (DAY range <>) of DAY;
   subtype SUB is UNCON(WEEKDAY);
begin
   null;
end P;
■
=SML
set_pc"cn";
set_goal([], ⓩSUB = {array : UNCON | dom array = WEEKDAY}
		∧ SUBvFIRST = WEEKDAYvFIRST ∧ SUBvLAST = WEEKDAYvLAST
		∧ SUBvLENGTH = # WEEKDAY ∧ SUBvRANGE = WEEKDAY⌝);
a(rewrite_tac(map z_get_spec (get_consts"P'proc")));
=TEX
=SML
store_mt_results mt_run [("6.8.4",chk_thm,(),())];
=TEX
=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX
ⓈCN
procedure P is
   type HOURS is range 0..23;
   type DAY is (MON, TUE, WED, THU, FRI, SAT, SUN);
   subtype WEEKDAY is DAY range MON..FRI;
   type UNCON2 is array (DAY range <>,HOURS range<>) of DAY;
   subtype SUB2 is UNCON2(WEEKDAY,HOURS);
begin
   null;
end P;
■

=SML
set_pc"cn";
set_goal([], ⓩSUB2 = {array : UNCON2 | dom array = WEEKDAY × HOURS}⌝);
a(rewrite_tac[z_get_spec ⓩSUB2⌝]);
=TEX
=SML
store_mt_results mt_run [("6.8.5",chk_thm,(),())];
=TEX

\pagebreak
\section{STATEMENTS} \label{STA}
\subsection{Null}
=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX
ⓈCN
procedure P is
begin
   	Δ [true]	
end P;
■

ⓈCN
 ⊑
	null;
■

=SML
print_z_document"-";
set_pc"cn";
set_goal([], get_conjecture"-""vc_1_1");
a(LEMMA_T ⓩtrue ⇒ true⌝ accept_tac);
a strip_tac;
=TEX
=SML
store_mt_results mt_run [("4.2",chk_thm,(),())];
=TEX
=SML
store_mt_results mt_run [("4.2vcs",chk_vcs,(),true)];
=TEX
\subsection{Assignment}
=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX
ⓈCN
procedure P is
	X : INTEGER;
begin
   	Δ X[X=5]	
end P;
■

ⓈCN
 ⊑
	X := 5;
■

=SML
print_z_document"-";
set_pc"cn";
set_goal([], get_conjecture"-""vc_1_1");
a(LEMMA_T ⓩtrue ⇒ 5 = 5⌝ accept_tac);
a(REPEAT strip_tac);
=TEX
=SML
store_mt_results mt_run [("4.3.1",chk_thm,(),())];
=TEX
=SML
store_mt_results mt_run [("4.3.1vcs",chk_vcs,(),true)];
=TEX
=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX
ⓈCN
procedure P is
	subtype INDEX is INTEGER range 0..9;
	type ARR is array (INDEX) of INTEGER;
	A : ARR;
begin
   	Δ A[A(3)=6]	
end P;
■

ⓈCN
 ⊑
	A(3) := 6;
■

=SML
print_z_document"-";
set_pc"cn";
set_goal([], get_conjecture"-""vc_1_1");
a(LEMMA_Tⓩ∀ A : ARR ⦁ (A ⊕ {3 ↦ 6}) 3 = 6⌝ accept_tac);
a(rewrite_tac[z_get_specⓩARR⌝] THEN REPEAT strip_tac);
a(rewrite_tac[z_⊕_↦_app_thm]);
=TEX
=SML
store_mt_results mt_run [("4.3.2",chk_thm,(),())];
=TEX
=SML
store_mt_results mt_run [("4.3.2vcs",chk_vcs,(),true)];
=TEX
=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX
ⓈCN
procedure P is
    type DAY is (MON, TUE, WED);
    type REC is record A : INTEGER; B : DAY; C : DAY; end record;
    R : REC;
begin
 Δ R [R.B=WED]	
end P;
■

ⓈCN
 ⊑
	R.B := WED;
■

=SML
print_z_document"-";
set_pc"cn";
set_goal([], get_conjecture"-""vc_1_1");
a(rewrite_tac[z_gen_pred_elim (dest_z_tupleⓩ(𝕌, 𝕌, 𝕌)⌝) (z_get_specⓩRECuB⌝)]);
=TEX
=SML
store_mt_results mt_run [("4.3.3",chk_thm,(),())];
=TEX
=SML
store_mt_results mt_run [("4.3.3vcs",chk_vcs,(),true)];
=TEX
=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX
ⓈCN
procedure P is
    type DAY is (MON, TUE, WED);
    type REC is record X : INTEGER; Y : DAY; end record;
    type ARR is array(DAY) of REC;
    type REC1 is record X : INTEGER; Y: ARR; end record;
    A : ARR;
    R : REC1;
begin
 Δ A,R [(A MON).Y = TUE ∧ ((R.Y) WED).X = 3]	
end P;
■
ⓈCN
 ⊑
	 A(MON).Y := TUE;
	 R.Y(WED).X := 3;
■
=SML
print_z_document"-";
set_pc"cn";
set_goal([], get_conjecture"-""vc_1_1");
a(LEMMA_T ⓩ∀ A: ARR; R : REC1
             ⦁ ((A ⊕ {MON ↦ RECuY (A MON, TUE)}) MON).Y = TUE
               ∧ ((REC1uY (R, R.Y ⊕ {WED ↦ RECuX (R.Y WED, 3)})).Y WED).X = 3⌝ accept_tac);
a(rewrite_tac[z_gen_pred_elim (dest_z_tupleⓩ(𝕌, 𝕌)⌝) (z_get_specⓩRECuX⌝),
	z_gen_pred_elim (dest_z_tupleⓩ(𝕌, 𝕌)⌝) (z_get_specⓩREC1uY⌝),
	z_get_specⓩARR⌝,z_get_specⓩREC1⌝]);
a(REPEAT strip_tac THEN rewrite_tac[z_⊕_↦_app_thm]);
=TEX
=SML
store_mt_results mt_run [("4.3.4",chk_thm,(),())];
=TEX
=SML
store_mt_results mt_run [("4.3.4vcs",chk_vcs,(),true)];
=TEX
=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX
ⓈCN
procedure P is
	X : INTEGER := 1;
begin
   	Δ X[X =1, X=5]	
end P;
■

ⓈCN
 ⊑
	X := 5;
■

=SML
print_z_document"-";
set_pc"cn";
set_goal([], get_conjecture"-""vc_1_1");
a(LEMMA_T ⓩ∀ X : INTEGER | X = 1 ⦁ 5 = 5⌝ accept_tac);
a(REPEAT strip_tac);
=TEX
=SML
store_mt_results mt_run [("4.3.5",chk_thm,(),())];
=TEX
=SML
store_mt_results mt_run [("4.3.5vcs",chk_vcs,(),true)];
=TEX
\subsection{Specification} \label{SPEC}
=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX

ⓈCN
procedure P is
    X,Y : INTEGER;
begin
 Δ X,Y [X > 5 ∧ Y > 5]	
end P;
■

ⓈCN
 ⊑
	X := 10; Δ Y [X = 10, X = 10 ∧ Y > 5]	
■

=SML
print_z_document"-";
set_pc"cn";
set_goal([], get_conjecture"-""vc_1_1");
a(LEMMA_T ⓩtrue ⇒ 10=10⌝ accept_tac);
a(REPEAT strip_tac);
=TEX
=SML
store_mt_results mt_run [("4.4.1a",chk_thm,(),())];
=TEX
=SML
set_goal([], get_conjecture"-""vc_1_2");
a(LEMMA_T ⓩ∀ X, Y : INTEGER | true ∧ X = 10 ∧ Y > 5 ⦁ X > 5 ∧ Y > 5⌝
	 accept_tac);
a(PC_T1 "z_lin_arith" prove_tac[]);
=TEX
=SML
store_mt_results mt_run [("4.4.1b",chk_thm,(),())];
=TEX
=SML
store_mt_results mt_run [("4.4.1vcs",chk_vcs,(),true)];
=TEX
=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX

ⓈCN
procedure P is
    X,Y : INTEGER;
begin
 Δ X,Y [X > 5 ∧ Y > 5]	
end P;
■

ⓈCN
 ⊑
	Δ Y [Y > 5]
	X := 10;
■

=SML
print_z_document"-";
set_pc"cn";
set_goal([], get_conjecture"-""vc_1_1");
a(LEMMA_T ⓩtrue ⇒ true⌝ accept_tac);
a strip_tac;
=TEX
=SML
store_mt_results mt_run [("4.4.2a",chk_thm,(),())];
=TEX
=SML
set_goal([], get_conjecture"-""vc_1_2");
a(LEMMA_T ⓩ∀ Y : INTEGER | true ∧ Y > 5 ⦁ 10 > 5 ∧ Y > 5⌝ accept_tac);
a(REPEAT strip_tac);
=TEX
=SML
store_mt_results mt_run [("4.4.2b",chk_thm,(),())];
=TEX
=SML
store_mt_results mt_run [("4.4.2vcs",chk_vcs,(),true)];
=TEX
\subsection{Semicolon}
Semicolon statement has been comprehensibly tested in Section \ref{SPEC}.
\subsection{If}
=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX
ⓈCN
procedure P is
    type DAY is (MON, TUE, WED,THU,FRI,SAT,SUN);
    D : DAY;
begin
 Δ D [D = MON]	
end P;
■

ⓈCN
 ⊑
	if D > MON then D := MON;end if;
■

=SML
print_z_document"-";
set_pc"cn";
set_goal([], get_conjecture"-""vc_1_1");
a(LEMMA_T ⓩ∀ D : DAY | true ∧ D greater MON = TRUE ⦁ MON = MON⌝ accept_tac);
a(REPEAT strip_tac);
=TEX
=SML
store_mt_results mt_run [("4.6.1a",chk_thm,(),())];
=TEX
=SML
set_goal([], get_conjecture"-""vc_1_2");
a(LEMMA_T ⓩ∀ D : DAY | true ∧ D greater MON = FALSE ⦁ D = MON⌝ accept_tac);
a(rewrite_tac[z_get_specⓩMON⌝,z_get_specⓩDAY⌝]);
a(PC_T1 "z_lin_arith" prove_tac[]);
=TEX
=SML
store_mt_results mt_run [("4.6.1b",chk_thm,(),())];
=TEX
=SML
store_mt_results mt_run [("4.6.1vcs",chk_vcs,(),true)];
=TEX
=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX
ⓈCN
procedure P is
    type DAY is (MON, TUE, WED,THU,FRI,SAT,SUN);
    D : DAY;
begin
 Δ D [D > FRI]	
end P;
■

ⓈCN
 ⊑
	if D = SAT or D = SUN then null; else D := SAT;end if;
■

=SML
print_z_document"-";
set_pc"cn";
set_goal([], get_conjecture"-""vc_1_1");
a(LEMMA_T ⓩ∀ D : DAY | true ∧ D eq SAT or D eq SUN = TRUE ⦁ D > FRI⌝
	 accept_tac);
a(rewrite_tac[z_get_specⓩFRI⌝,z_get_specⓩSAT⌝,z_get_specⓩSUN⌝]);
a(PC_T1 "z_lin_arith" prove_tac[]);
=TEX
=SML
store_mt_results mt_run [("4.6.2a",chk_thm,(),())];
=TEX
=SML
set_goal([], get_conjecture"-""vc_1_2");
a(LEMMA_T ⓩ∀ D : DAY | true ∧ D eq SAT or D eq SUN = FALSE ⦁ SAT>FRI⌝
	accept_tac);
a(rewrite_tac[z_get_specⓩFRI⌝,z_get_specⓩSAT⌝]);
=TEX
=SML
store_mt_results mt_run [("4.6.2b",chk_thm,(),())];
=TEX
=SML
store_mt_results mt_run [("4.6.2vcs",chk_vcs,(),true)];
=TEX
=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX
ⓈCN
procedure P is
    type DAY is (MON, TUE, WED,THU,FRI,SAT,SUN);
    D : DAY;
begin
 Δ D [D > FRI]	
end P;
■

ⓈCN
 ⊑
	if D = SAT  then null; elsif D = SUN then null; else D := SAT;end if;
■

=SML
print_z_document"-";
set_pc"cn";
set_goal([], get_conjecture"-""vc_1_1");
a(LEMMA_T ⓩ∀ D : DAY | true ∧ D eq SAT = TRUE ⦁ D > FRI⌝ accept_tac);
a(rewrite_tac[z_get_specⓩFRI⌝,z_get_specⓩSAT⌝]);
a(PC_T1 "z_lin_arith" prove_tac[]);
=TEX
=SML
store_mt_results mt_run [("4.6.3a",chk_thm,(),())];
=TEX
=SML
set_goal([], get_conjecture"-""vc_1_2");
a(LEMMA_T ⓩ∀ D : DAY | true ∧ D eq SAT = FALSE ∧ D eq SUN = TRUE ⦁ D > FRI⌝
	 accept_tac);
a(rewrite_tac[z_get_specⓩFRI⌝,z_get_specⓩSAT⌝,z_get_specⓩSUN⌝]);
a(PC_T1 "z_lin_arith" prove_tac[]);
=TEX
=SML
store_mt_results mt_run [("4.6.3b",chk_thm,(),())];
=TEX
=SML
set_goal([], get_conjecture"-""vc_1_3");
a(LEMMA_T ⓩ∀ D : DAY | true ∧ D eq SAT = FALSE ∧ D eq SUN = FALSE ⦁
	SAT > FRI⌝ accept_tac);
a(rewrite_tac[z_get_specⓩFRI⌝,z_get_specⓩSAT⌝,z_get_specⓩSUN⌝]);
=TEX
=SML
store_mt_results mt_run [("4.6.3c",chk_thm,(),())];
=TEX
=SML
store_mt_results mt_run [("4.6.3vcs",chk_vcs,(),true)];
=TEX
\subsection{Case}
=SML
clean_up();
new_script{name="P", unit_type="proc"};
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
		when SAT => null;
		when SUN => null;
	end case;
■
=SML
print_z_document"-";
set_pc"cn";
set_goal([], get_conjecture"-""vc_1_1");
a(LEMMA_T ⓩ∀ D : DAY | true ∧ D ∈ {MON} ⦁ SAT = SAT ∨ SAT = SUN⌝ accept_tac);
a(REPEAT strip_tac);
=TEX
=SML
store_mt_results mt_run [("4.7.1a",chk_thm,(),())];
=TEX
=SML
set_goal([], get_conjecture"-""vc_1_2");
a(LEMMA_T ⓩ∀ D : DAY | true ∧ D ∈ {TUE} ⦁ SAT = SAT ∨ SAT = SUN⌝ accept_tac);
a(REPEAT strip_tac);
=TEX
=SML
store_mt_results mt_run [("4.7.1b",chk_thm,(),())];
=TEX
=SML
set_goal([], get_conjecture"-""vc_1_3");
a(LEMMA_T ⓩ∀ D : DAY | true ∧ D ∈ {WED} ⦁ SAT = SAT ∨ SAT = SUN⌝ accept_tac);
a(REPEAT strip_tac);
=TEX
=SML
store_mt_results mt_run [("4.7.1c",chk_thm,(),())];
=TEX
=SML
set_goal([], get_conjecture"-""vc_1_4");
a(LEMMA_T ⓩ∀ D : DAY | true ∧ D ∈ {THU} ⦁ SAT = SAT ∨ SAT = SUN⌝ accept_tac);
a(REPEAT strip_tac);
=TEX
=SML
store_mt_results mt_run [("4.7.1d",chk_thm,(),())];
=TEX
=SML
set_goal([], get_conjecture"-""vc_1_5");
a(LEMMA_T ⓩ∀ D : DAY | true ∧ D ∈ {FRI} ⦁ SAT = SAT ∨ SAT = SUN⌝ accept_tac);
a(REPEAT strip_tac);
=TEX
=SML
store_mt_results mt_run [("4.7.1e",chk_thm,(),())];
=TEX
=SML
set_goal([], get_conjecture"-""vc_1_6");
a(LEMMA_T ⓩ∀ D : DAY | true ∧ D ∈ {SAT} ⦁ D = SAT ∨ D = SUN⌝ accept_tac);
a(REPEAT strip_tac);
=TEX
=SML
store_mt_results mt_run [("4.7.1f",chk_thm,(),())];
=TEX
=SML
set_goal([], get_conjecture"-""vc_1_7");
a(LEMMA_T ⓩ∀ D : DAY | true ∧ D ∈ {SUN} ⦁ D = SAT ∨ D = SUN⌝ accept_tac);
a(REPEAT strip_tac);
=TEX
=SML
store_mt_results mt_run [("4.7.1g",chk_thm,(),())];
=TEX
=SML
store_mt_results mt_run [("4.7.1vcs",chk_vcs,(),true)];
=TEX
=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX
ⓈCN
procedure P is
    type DAY is (MON,TUE,WED,THU,FRI,SAT,SUN);
    D : DAY;
begin
 Δ D [D = SAT ∨ D = SUN]	
end P;
■

ⓈCN
 ⊑
	case D is
		when MON..FRI => D := SAT;
		when SAT..SUN => null;
	end case;
■
=SML
print_z_document"-";
set_pc"cn";
set_goal([], get_conjecture"-""vc_1_1");
a(LEMMA_T ⓩ∀ D : DAY | true ∧ D ∈ MON .. FRI ⦁ SAT = SAT ∨ SAT = SUN⌝
	 accept_tac);
a(REPEAT strip_tac);
=TEX
=SML
store_mt_results mt_run [("4.7.2a",chk_thm,(),())];
=TEX
=SML
set_goal([], get_conjecture"-""vc_1_2");
a(LEMMA_T ⓩ∀ D : DAY | true ∧ D ∈ SAT .. SUN ⦁ D = SAT ∨ D = SUN⌝ accept_tac);
a(rewrite_tac[z_get_specⓩSAT⌝,z_get_specⓩSUN⌝]);
a(PC_T1 "z_lin_arith" prove_tac[]);
=TEX
=SML
store_mt_results mt_run [("4.7.2b",chk_thm,(),())];
=TEX
=SML
store_mt_results mt_run [("4.7.2vcs",chk_vcs,(),true)];
=TEX
=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX
ⓈCN
procedure P is
    type DAY is (MON,TUE,WED,THU,FRI,SAT,SUN);
    D : DAY;
begin
 Δ D [D = SAT]	
end P;
■

ⓈCN
 ⊑
	case D is
		when SAT => null;
	end case;
■
=SML
print_z_document"-";
set_pc"cn";
set_goal([], get_conjecture"-""vc_1_1");
a(LEMMA_T ⓩ∀ D : DAY | true ∧ D ∈ {SAT} ⦁ D = SAT⌝ accept_tac);
a(REPEAT strip_tac);
=TEX
=SML
store_mt_results mt_run [("4.7.3",chk_thm,(),())];
=TEX
=SML
store_mt_results mt_run [("4.7.3vcs",chk_vcs,(),true)];
=TEX
\subsection{Undecorated Loop and Exit}
=SML
clean_up();
new_script{name="P", unit_type="proc"};
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
	I := 1;
	$till ⟦∀ j : 1 .. 10  ⦁ A j = 0⟧
	loop
	Δ A,I [I ≤ 11 ∧ (∀ j : 1 .. I-1  ⦁ A j = 0),I ≤ 11 ∧ (∀ j : 1 .. I-1  ⦁ A j = 0)]
	end loop;
■

ⓈCN
 ⊑
	exit when I = 11;

	Δ A,I [I ≤ 10 ∧ (∀ j : 1 .. I-1  ⦁ A j = 0),I ≤ 11 ∧ (∀ j : 1 .. I-1  ⦁ A j = 0)]
	
■

ⓈCN
 ⊑
	A(I) := 0;
	I := I+1;
■

=SML
print_z_document"-";
set_pc"cn";
set_goal([], get_conjecture"-""vc_1_1");
a(LEMMA_T ⓩ∀ A : ARR ⦁ 1 ≤ 11 ∧ (∀ j : 1 .. 1 - 1 ⦁ A j = 0)⌝accept_tac);
a(PC_T1 "z_lin_arith" prove_tac[]);
=TEX
=SML
store_mt_results mt_run [("4.8.1a",chk_thm,(),())];
=TEX
=SML
set_goal([], get_conjecture"-""vc_1_2");
a(LEMMA_T ⓩ∀ A : ARR; I : INTEGER
             | true ∧ I ≤ 11 ∧ (∀ j : 1 .. I - 1 ⦁ A j = 0)
             ⦁ I ≤ 11 ∧ (∀ j : 1 .. I - 1 ⦁ A j = 0)⌝accept_tac);
a(prove_tac[]);
=TEX
=SML
store_mt_results mt_run [("4.8.1b",chk_thm,(),())];
=TEX
=SML
set_goal([], get_conjecture"-""vc_1_3");
a(LEMMA_Tⓩ∀ A : ARR
             | true ∧ (∀ j : 1 .. 10 ⦁ A j = 0)
             ⦁ ∀ j : 1 .. 10 ⦁ A j = 0⌝accept_tac);
a(z_∀_tac THEN taut_tac);
=TEX
=SML
store_mt_results mt_run [("4.8.1c",chk_thm,(),())];
=TEX
=SML
set_goal([], get_conjecture"-""vc_2_1");
a(LEMMA_T ⓩ∀ A : ARR; I : INTEGER
             | (I ≤ 11 ∧ (∀ j : 1 .. I - 1 ⦁ A j = 0)) ∧ I eq 11 = TRUE
             ⦁ ∀ j : 1 .. 10 ⦁ A j = 0⌝	accept_tac);
a(rewrite_tac[] THEN REPEAT strip_tac);
a(all_var_elim_asm_tac1);
a(all_asm_ante_tac THEN rewrite_tac[] THEN REPEAT strip_tac);
a(all_asm_fc_tac[]);
=TEX
=SML
store_mt_results mt_run [("4.8.1d",chk_thm,(),())];
=TEX
=SML
set_goal([], get_conjecture"-""vc_2_2");
a(LEMMA_T ⓩ∀ A : ARR; I : INTEGER
             | (I ≤ 11 ∧ (∀ j : 1 .. I - 1 ⦁ A j = 0)) ∧ I eq 11 = FALSE
             ⦁ I ≤ 10 ∧ (∀ j : 1 .. I - 1 ⦁ A j = 0)⌝	accept_tac);
a(prove_tac[]);
a(PC_T1 "z_lin_arith" asm_prove_tac[]);
=TEX
=SML
store_mt_results mt_run [("4.8.1e",chk_thm,(),())];
=TEX
=SML
set_goal([], get_conjecture"-""vc_2_3");
a(LEMMA_T ⓩ∀ A, A⋎0 : ARR; I, I⋎0 : INTEGER
             | (I⋎0 ≤ 11
               ∧ (∀ j : 1 .. I⋎0 - 1 ⦁ A⋎0 j = 0))
               ∧ I ≤ 11
               ∧ (∀ j : 1 .. I - 1 ⦁ A j = 0)
             ⦁ I ≤ 11 ∧ (∀ j : 1 .. I - 1 ⦁ A j = 0)⌝	accept_tac);
a(z_∀_tac THEN taut_tac);
=TEX
=SML
store_mt_results mt_run [("4.8.1f",chk_thm,(),())];
=TEX
=SML
set_goal([], get_conjecture"-""vc_3_1");
a(LEMMA_T ⓩ∀ A : ARR; I : INTEGER
             | I ≤ 10 ∧ (∀ j : 1 .. I - 1 ⦁ A j = 0)
             ⦁ I + 1 ≤ 11 ∧ (∀ j : 1 .. (I + 1) - 1 ⦁ (A ⊕ {I ↦ 0}) j = 0)⌝	accept_tac);
a(rewrite_tac[z_get_specⓩARR⌝]THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(PC_T1 "z_lin_arith" asm_prove_tac[]);
(* *** Goal "2" *** *)
a(LEMMA_Tⓩj = I ∨ j ∈ 1 .. I + ~ 1 ⌝ (∨_THEN asm_tac));
(* *** Goal "2.1" *** *)
a(PC_T1 "z_lin_arith" asm_prove_tac[]);
(* *** Goal "2.2" *** *)
a(asm_rewrite_tac[]);
a(rewrite_tac[z_⊕_↦_app_thm]);
(* *** Goal "2.3" *** *)
a(z_spec_nth_asm_tac 4 ⓩj⌝);
(* *** Goal "2.3.1" *** *)
a(PC_T1 "z_lin_arith" asm_prove_tac[]);
(* *** Goal "2.3.2" *** *)
a(PC_T1 "z_lin_arith" asm_prove_tac[]);
(* *** Goal "2.3.3" *** *)
a(lemma_tacⓩ¬ j = I ∧ j∈INDEX⌝ THEN1 rewrite_tac[z_get_specⓩINDEX⌝]
	THEN1 PC_T1 "z_lin_arith"asm_prove_tac[]);
a(ALL_ASM_FC_T asm_rewrite_tac [z_⊕_↦_app_thm1]);
=TEX
=SML
store_mt_results mt_run [("4.8.1g",chk_thm,(),())];
=TEX
=SML
store_mt_results mt_run [("4.8.1vcs",chk_vcs,(),true)];
=TEX
\subsection{While Loop}
=SML
clean_up();
new_script{name="P", unit_type="proc"};
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
	I := 1;
	while (I <= 10)
	loop
	Δ A,I [I ≤ 10 ∧ (∀ j : 1 .. I-1  ⦁ A j = 0),
		 I ≤ 11 ∧ (∀ j : 1 .. I-1  ⦁ A j = 0)]
	end loop;
■

ⓈCN
 ⊑
	A(I) := 0;
	I := I + 1;
■

=SML
print_z_document"-";
set_pc"cn";
set_goal([], get_conjecture"-""vc_1_1");
a(LEMMA_T ⓩ∀ A : ARR
             | true ∧ 1 less_eq 10 = TRUE
             ⦁ 1 ≤ 10 ∧ (∀ j : 1 .. 1 - 1 ⦁ A j = 0)⌝accept_tac);
a(PC_T1 "z_lin_arith" prove_tac[]);
=TEX
=SML
store_mt_results mt_run [("4.9.1a",chk_thm,(),())];
=TEX
=SML
set_pc"cn";
set_goal([], get_conjecture"-""vc_1_2");
a(LEMMA_T ⓩ∀ A : ARR | true ∧ 1 less_eq 10 = FALSE ⦁ ∀ j : 1 .. 10 ⦁ A j = 0⌝
	accept_tac);
a(prove_tac[]);
=TEX
=SML
store_mt_results mt_run [("4.9.1b",chk_thm,(),())];
=TEX
=SML
set_pc"cn";
set_goal([], get_conjecture"-""vc_1_3");
a(LEMMA_T ⓩ∀ A : ARR; I : INTEGER
             | true
               ∧ (I ≤ 11
               ∧ (∀ j : 1 .. I - 1 ⦁ A j = 0))
               ∧ I less_eq 10 = TRUE
             ⦁ I ≤ 10 ∧ (∀ j : 1 .. I - 1 ⦁ A j = 0)⌝accept_tac);
a(z_∀_tac THEN ⇒_tac THEN ∧_tac THEN asm_prove_tac[]);
=TEX
=SML
store_mt_results mt_run [("4.9.1c",chk_thm,(),())];
=TEX
=SML
set_pc"cn";
set_goal([], get_conjecture"-""vc_1_4");
a(LEMMA_T ⓩ∀ A : ARR; I : INTEGER
             | true
               ∧ (I ≤ 11
               ∧ (∀ j : 1 .. I - 1 ⦁ A j = 0))
               ∧ I less_eq 10 = FALSE
             ⦁ ∀ j : 1 .. 10 ⦁ A j = 0⌝accept_tac);
a(prove_tac[]);
a(z_spec_nth_asm_tac 4 ⓩj⌝);
(* *** Goal "1" *** *)
a(PC_T1 "z_lin_arith" asm_prove_tac[]);
(* *** Goal "2" *** *)
a(lemma_tacⓩI = 11⌝ THEN_T PC_T1 "z_lin_arith" asm_prove_tac[]);
=TEX
=SML
store_mt_results mt_run [("4.9.1d",chk_thm,(),())];
=TEX
=SML
set_goal([], get_conjecture"-""vc_2_1");
a(LEMMA_T ⓩ∀ A : ARR; I : INTEGER
             | I ≤ 10 ∧ (∀ j : 1 .. I - 1 ⦁ A j = 0)
             ⦁ I + 1 ≤ 11 ∧ (∀ j : 1 .. (I + 1) - 1 ⦁ (A ⊕ {I ↦ 0}) j = 0)⌝
	accept_tac);
a(rewrite_tac[z_get_specⓩARR⌝]THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(PC_T1 "z_lin_arith" asm_prove_tac[]);
(* *** Goal "2" *** *)
a(LEMMA_Tⓩj = I ∨ j ∈ 1 .. I + ~ 1 ⌝ (∨_THEN asm_tac));
(* *** Goal "2.1" *** *)
a(PC_T1 "z_lin_arith" asm_prove_tac[]);
(* *** Goal "2.2" *** *)
a(asm_rewrite_tac[]);
a(rewrite_tac[z_⊕_↦_app_thm]);
(* *** Goal "2.3" *** *)
a(z_spec_nth_asm_tac 4 ⓩj⌝);
(* *** Goal "2.3.1" *** *)
a(PC_T1 "z_lin_arith" asm_prove_tac[]);
(* *** Goal "2.3.2" *** *)
a(PC_T1 "z_lin_arith" asm_prove_tac[]);
(* *** Goal "2.3.3" *** *)
a(lemma_tacⓩ¬ j = I ∧ j∈INDEX⌝ THEN1 rewrite_tac[z_get_specⓩINDEX⌝]
	THEN1 PC_T1 "z_lin_arith"asm_prove_tac[]);
a(ALL_ASM_FC_T asm_rewrite_tac [z_⊕_↦_app_thm1]);
=TEX
=SML
store_mt_results mt_run [("4.9.1e",chk_thm,(),())];
=TEX
=SML
store_mt_results mt_run [("4.9.1vcs",chk_vcs,(),true)];
=TEX
\subsection{For Loop}
=SML
clean_up();
new_script{name="P", unit_type="proc"};
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
	for I in INDEX loop
	Δ A,I [∀ j : 1 .. I-1  ⦁ A j = 0, (∀ j : 1 .. I-1  ⦁ A j = 0) ∧ A I = 0]
	end loop;
■

ⓈCN
 ⊑
	A(I) := 0;
■

=SML
print_z_document"-";
set_pc"cn";
set_goal([], get_conjecture"-""vc_1_1");
a(LEMMA_T ⓩ∀ A : ARR
             | true ∧ INDEXvFIRST ≤ INDEXvLAST
             ⦁ ∀ j : 1 .. INDEXvFIRST - 1 ⦁ A j = 0⌝accept_tac);
a(rewrite_tac[z_get_specⓩINDEXvFIRST⌝]THEN REPEAT strip_tac);
=TEX
=SML
store_mt_results mt_run [("4.10.1a",chk_thm,(),())];
=TEX
=SML
set_goal([], get_conjecture"-""vc_1_2");
a(LEMMA_T ⓩ∀ A : ARR
             | true ∧ INDEXvFIRST > INDEXvLAST
             ⦁ ∀ j : 1 .. 10 ⦁ A j = 0⌝accept_tac);
a(rewrite_tac[z_get_specⓩINDEXvFIRST⌝,z_get_specⓩINDEXvLAST⌝]
	THEN PC_T1 "z_lin_arith" REPEAT strip_tac);
=TEX
=SML
store_mt_results mt_run [("4.10.1b",chk_thm,(),())];
=TEX
=SML
set_goal([], get_conjecture"-""vc_1_3");
a(LEMMA_T ⓩ∀ A : ARR; I : INDEX
             | true ∧ I ≠ INDEXvLAST ∧ (∀ j : 1 .. I - 1 ⦁ A j = 0) ∧ A I = 0
             ⦁ ∀ j : 1 .. (I + 1) - 1 ⦁ A j = 0⌝accept_tac);
a(REPEAT strip_tac);
a(lemma_tacⓩj ≤ I - 1 ∨ j = I⌝ THEN1 PC_T1 "z_lin_arith" asm_prove_tac[]);
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 5 ⓩj⌝ THEN1 PC_T1 "z_lin_arith" asm_prove_tac[]);
a(asm_ante_tacⓩj ≤ I - 1⌝ THEN1 asm_ante_tacⓩI - 1 < j⌝ );
a(PC_T1 "z_lin_arith" prove_tac[]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[]);
=TEX
=SML
store_mt_results mt_run [("4.10.1c",chk_thm,(),())];
=TEX
=SML
set_goal([], get_conjecture"-""vc_1_4");
a(LEMMA_T ⓩ∀ A : ARR
             | true ∧ (∀ j : 1 .. INDEXvLAST - 1 ⦁ A j = 0) ∧ A INDEXvLAST = 0
             ⦁ ∀ j : 1 .. 10 ⦁ A j = 0⌝accept_tac);
a(rewrite_tac[z_get_specⓩINDEXvLAST⌝]THEN REPEAT strip_tac);
a(lemma_tacⓩj ≤ 9 ∨ j = 10⌝ THEN1 PC_T1 "z_lin_arith" asm_prove_tac[]);
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 5 ⓩj⌝ THEN_T PC_T1 "z_lin_arith" asm_prove_tac[]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[]);
=TEX
=SML
store_mt_results mt_run [("4.10.1d",chk_thm,(),())];
=TEX
=SML
set_goal([], get_conjecture"-""vc_2_1");
a(LEMMA_T ⓩ∀ A : ARR;  I : INDEX
             | ∀ j : 1 .. I - 1 ⦁ A j = 0
             ⦁ (∀ j : 1 .. I - 1 ⦁ (A ⊕ {I ↦ 0}) j = 0) ∧ (A ⊕ {I ↦ 0}) I = 0⌝
	accept_tac);
a(rewrite_tac[z_get_specⓩARR⌝]THEN REPEAT strip_tac);
(* *** Goal "1" *** *)
a(z_spec_nth_asm_tac 3 ⓩj⌝);
(* *** Goal "1.1" *** *)
a(PC_T1 "z_lin_arith" asm_prove_tac[]);
(* *** Goal "1.2" *** *)
a(PC_T1 "z_lin_arith" asm_prove_tac[]);
(* *** Goal "1.3" *** *)
a(lemma_tacⓩ¬ j = I ∧ j∈ INDEX⌝THEN1 GET_NTH_ASM_T 5 ante_tac THEN1
	rewrite_tac[z_get_specⓩINDEX⌝]THEN1 PC_T1 "z_lin_arith"asm_prove_tac[]);
a(ALL_ASM_FC_T asm_rewrite_tac [z_⊕_↦_app_thm1]);
(* *** Goal "2" *** *)
a(rewrite_tac[z_⊕_↦_app_thm]);
=TEX
=SML
store_mt_results mt_run [("4.10.1e",chk_thm,(),())];
=TEX
=SML
store_mt_results mt_run [("4.10.1vcs",chk_vcs,(),true)];
=TEX
\subsection{Procedure Call}
=SML
clean_up();
new_script{name="P", unit_type="proc"};
=TEX

ⓈCN
procedure P is
   I,J : INTEGER;	
	procedure PLUS_TEN (X : in INTEGER; Y : out INTEGER)
	Δ Y [Y = X + 10]
	is
	begin
	 	Y := X + 10;
	end PLUS_TEN;
begin
 Δ J [J = I + 10]
end P;
■

ⓈCN
⊑
PLUS_TEN(I,J);
■

=SML
set_pc"cn";
set_goal([], get_conjecture"-""vc_1_1");
a strip_tac;
=TEX
=SML
store_mt_results mt_run [("4.15.1.1",chk_thm,(),())];
=TEX
=SML
set_pc"cn";
set_goal([], get_conjecture"-""vc_1_2");
a(REPEAT strip_tac);
=TEX
=SML
store_mt_results mt_run [("4.15.1.2",chk_thm,(),())];
store_mt_results mt_run [("4.15.1.3",chk_vcs,(),true)];
=SML
open_theory "PoPLUS_TEN'proc";
set_pc"cn";
set_goal([], get_conjecture"-""vcPoPLUS_TEN_1");
a(REPEAT strip_tac);
=TEX
=SML
store_mt_results mt_run [("4.15.1.4",chk_thm,(),())];
=TEX
=SML
store_mt_results mt_run [("4.15.1.5",chk_vcs,(),true)];
=TEX
=TEX
\section{EPILOGUE}
=SML
diag_line (summarize_mt_results());
=TEX
\end{document}


=IGN
********************************************************************************
int515.doc: this file is part of the PPDaz system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% ℤ $Revision: 1.13 $ $RCSfile: int515.doc,v $ $Date: 2006/09/16 12:52:13 $
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

\def\Title{Praxis Issues Example}

\def\AbstractText{This document contains tests based on the Praxis Issues example.}

\def\Reference{ISS/HAT/DAZ/INT515}

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
%% LaTeX2e port: % TQtemplate.tex
%% LaTeX2e port: % use_file "daz_init";
%% LaTeX2e port: % use_file "int515";
%% LaTeX2e port: % z_print_theory"-";
%% LaTeX2e port: % open CNZGenerator;
%% LaTeX2e port: \documentstyle[hol1,11pt,TQ]{article}
%% LaTeX2e port: \ftlinepenalty=9999
\def\Hide#1{}
\def\Bool{``$\it{:}bool\,$''}
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{DAZ PROJECT}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Praxis Issues Example}  %% Mandatory field
%% LaTeX2e port: \TPPref{ISS/HAT/DAZ/INT515}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.13 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2006/09/16 12:52:13 $%
%% LaTeX2e port: }}  %% Mandatory field (with sensible default)
%% LaTeX2e port: \TPPstatus{Informal}
%% LaTeX2e port: %\TPPstatus{Informal}
%% LaTeX2e port: \TPPtype{Technical}
%% LaTeX2e port: %\TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{K.~Blackburn & IUCT Team}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & IUCT Team1}
%% LaTeX2e port: \TPPabstract{%
%% LaTeX2e port: This document contains tests based on the Praxis Issues example.
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
\item[Issues 1.1 (1997/06/20)] First drafts.
\item[Issue 1.2 (2002/08/23)] Removed use of ICL logo font.
\item[Issue 1.3 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.4 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.5 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.6 (2004/01/25)] Fixed dependency on proof context set-up.
\item[Issue 1.7 (2004/02/07)] The SPARK program is now referred to as the Ada program.
\item[Issue 1.8 (2005/05/28)] Compliance Notation reserved words are now prefixed by a dollar sign.
\item[Issue 1.9 (2006/03/28)] Allowed for automated state management.
\item[Issue 1.11 (2006/04/07)] Allowed for insistence on canonical names in Z under enhancement 117
\item[Issue 1.12 (2006/06/01)] accommodated enhancement 139 - 1-theory-per-subprogram.
\item[Issue 1.13 (2006/09/16)] Allowed for new {\em open\_scope} command.
\item[Issue 1.14 (2006/09/19)] Allowed for enhancement 165.
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
This document contains test data for the Compliance Tool.
\subsection{Introduction}
This document contains the Praxis Issues example from
\cite{SHOLIS_CNER}.

\section{PRELIMINARIES}

=SML
use_file "dtd013";
use_file "imp013";
init_mt_results();
=TEX
Function to clean up before doing a test.
=SML
fun clean_up () = (
	let	val thys = get_descendants "cn" less "cn"
					diff get_cache_theories();
		fun del_thy thy = (force_delete_theory thy handle Fail _ => ());
	in	map del_thy thys
	end;	()
);
=TEX

\section{EXAMPLE}
=SML
clean_up();
new_script{name="EG1", unit_type="spec"};
ⓈZAX
│ inc : INTEGER → INTEGER
├──────
│ ∀ X : INTEGER ⦁
│	X ≠ INTEGERvLAST ∧ inc(X) = X + 1
│	∨ X = INTEGERvLAST ∧ inc(X) = X
■
┌ IncTwo ───────────
│ A, A⋎0, B⋎0, B : INTEGER
├──────
│ A = inc(A⋎0) ∧ B = inc(B⋎0)
└──────────────

ⓈCN
package Eg1
is
   procedure IncTwo(A, B : in out INTEGER)
    Δ A, B [ IncTwo ];
end Eg1;
■

=SML
new_script{name="EG1", unit_type="body"};
ⓈCN
package body Eg1
is

   procedure Inc(X : in out INTEGER)
    Δ X [ X = inc(X⋎0) ]
   is
   begin
   Δ X [ X = inc(X⋎0) ] (11)
   end Inc;

   procedure IncTwo(A, B : in out INTEGER)
   Δ A, B [ IncTwo ]
   is
   begin
   Δ A, B [ IncTwo ] (12)
   end IncTwo;

end Eg1;
■
=SML
=TEX
\section{USES OF EXAMPLE}
\subsection{Using Z Schemas in Ada Specifications}
Section A.4 of \cite{SHOLIS_CNER}:
=SML
new_script{name="EG1_USEINCTWO", unit_type="proc"};
ⓈCN
with Eg1;
procedure Eg1_UseIncTwo
is
   A,B : INTEGER;
begin
   Δ A, B [ IncTwo ] (30)
end Eg1_UseIncTwo;
■
=SML
fun test_A4 () =
ⓈCN
 (30) ⊑
   Eg1.IncTwo(A, B);
■
=SML
store_mt_results_show mt_run [
   ("EG1_USEINCTWO'proc", test_A4, (), ())
];
=TEX
=SML
set_goal([],get_conjecture "-" "vc30_2");
a(REPEAT strip_tac);
store_mt_results_show (mt_runf (op =$)) [
   ("A4_proof", concl o pop_thm, (), get_conjecture "-" "vc30_2")
];
=TEX
\subsection{Variable Scope and Specification statements}
Section A.5 of \cite{SHOLIS_CNER}:
=SML
new_script{name="EG2_STORE", unit_type="spec"};
ⓈCN
package Eg2_store is
   Data : INTEGER;

   procedure Update( X : in INTEGER)
    Δ EG2_STOREoDATA [ EG2_STOREoDATA = X ];
   --# global Data;
   --# derives Data from X;

end Eg2_Store;

■
=SML
new_script{name="EG2", unit_type="spec"};
fun test_A5_1 () =
ⓈCN
$references Eg2_Store;
--# inherit Eg2_Store;
package Eg2 is

   procedure StoreMax (A, B : in INTEGER)
    Δ EG2_STOREoDATA [ EG2_STOREoDATA = max { A, B} ];
   --# global Eg2_Store.Data;
   --# derives Eg2_Store.Data from A, B;

end Eg2;
■
=SML
store_mt_results_show mt_run [
   ("EG2_STORE'spec", test_A5_1, (), ())
];
=TEX
=SML
new_script {name="EG2_TOP", unit_type="spec"};
fun test_A5_3 () =
ⓈCN
$references Eg2, Eg2_Store;
--# inherit Eg2, Eg2_Store;
package Eg2_Top is

   procedure Eg2_Store10
    Δ EG2_STOREoDATA [ EG2_STOREoDATA = 10 ];
   --# global Eg2_Store.data;
   --# derives Eg2_Store.Data from ;

end Eg2_Top;
■
=SML
store_mt_results_show mt_run [
   ("EG2_TOP'spec", test_A5_3, (), ())
];
=TEX
=SML
new_script{name="EG2_TOP", unit_type="body"};
fun test_A5_4 () =
ⓈCN
with Eg2;
$references Eg2_Store;
package body Eg2_Top is
   procedure Eg2_Store10
    Δ EG2_STOREoDATA [  EG2_STOREoDATA = 10 ]
   is
   begin
    Δ EG2_STOREoDATA [  EG2_STOREoDATA = 10 ] (21)
   end Eg2_Store10;
end Eg2_Top;
■
=SML
store_mt_results_show mt_run [
   ("EG2_TOP'body", test_A5_4, (), ())
];
=TEX
=SML
open_scope"Eg2_Top.Eg2_Store10";
fun test_A5_4 () =
ⓈCN
 (21) ⊑ Eg2.StoreMax(1, 10);
■
=SML
store_mt_results_show mt_run [
   ("A5_4_refine", test_A5_4, (), ())
];
=TEX
=SML
open_theory "EG2_TOPoEG2_STORE10'proc";
set_pc"z_library_ext";
set_goal([], get_conjecture "-" "vc21_2");
a(rewrite_tac[z_get_spec ⓩmax⌝]);
a(REPEAT strip_tac);
a(all_var_elim_asm_tac1);
a(z_app_eq_tac);
a(REPEAT strip_tac);
a(all_var_elim_asm_tac1);
a(asm_fc_tac []);
(* *** Goal "1.1" *** *)
a(all_var_elim_asm_tac1);
a(lemma_tac ⓩ10 ∈ S⌝);
(* *** Goal "1.1.1" *** *)
a(z_spec_nth_asm_tac 1 ⓩ10⌝);
(* *** Goal "1.1.2" *** *)
a(asm_fc_tac[]);
(* *** Goal "1.2" *** *)
a(all_var_elim_asm_tac1);
(* *** Goal "2" *** *)
a(z_∃_tac ⓩ(S ≜ {1, 10},m ≜ 10 )⌝);
a(REPEAT strip_tac);
(* *** Goal "2.1" *** *)
a(z_∃_tac ⓩ1⌝);
a(REPEAT strip_tac);
(* *** Goal "2.2" *** *)
a(all_var_elim_asm_tac1);
a(rewrite_tac[]);
(* *** Goal "2.3" *** *)
a(all_var_elim_asm_tac1);
a(rewrite_tac[]);
store_mt_results_show (mt_runf (op =$)) [
   ("A5_proof", concl o pop_thm, (), get_conjecture "-" "vc21_2")
];
=TEX
\section{EPILOGUE}
=SML
diag_line (summarize_mt_results());
=TEX
\pagebreak
\end{document}
=IGN

=IGN
********************************************************************************
int514.doc: this file is part of the PPDaz system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% ℤ $Date: 2006/09/19 11:24:22 $ $Revision: 1.25 $ $RCSfile: int514.doc,v $
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

\def\Title{Tests for Compliance Notation Environments}

\def\AbstractText{This document contains tests for the environments in the Compliance Notation Tool.}

\def\Reference{ISS/HAT/DAZ/INT514}

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
%% LaTeX2e port: % use_file "int514";
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
%% LaTeX2e port: \TPPtitle{Tests for Compliance Notation Environments}  %% Mandatory field
%% LaTeX2e port: \TPPref{ISS/HAT/DAZ/INT514}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{1.6%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{97/07/21%
%% LaTeX2e port: }}  %% Mandatory field (with sensible default)
%% LaTeX2e port: \TPPstatus{Informal}
%% LaTeX2e port: %\TPPstatus{Informal}
%% LaTeX2e port: \TPPtype{Technical}
%% LaTeX2e port: %\TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{K.~Blackburn & IUCT Team}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & IUCT Team1}
%% LaTeX2e port: \TPPabstract{%
%% LaTeX2e port: This document contains tests for the environments in the Compliance Notation Tool.
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
\item[Issues 1.1 (1997/06/06)-1.2 (1997/06/06)] First drafts.
\item[Issue 1.3 (1997/06/23)] Stopped any mention of $pack\_spec\_with\_modules$ in listing.
\item[Issue 1.4 (1997/06/25)] Added theory environment tests for prefixed theories.
\item[Issue 1.5 (1997/07/01)] Changes for WP 9.
\item[Issue 1.6 (1997/07/21),1.7 (1997/07/23)] IUCT WP 4 syntax changes.
\item[Issue 1.9 (2000/06/30)] Reinstated missing `=SML' that was suppressing some checks.
\item[Issue 1.10 (2000/10/27),1.11 (2000/10/30)] CTLE II changes invalidated a number of tests.
\item[Issue 1.12 (2002/06/05)] Constants and types in packages are now in reverse order.
\item[Issue 1.13 (2002/08/23)] Removed use of ICL logo font.
\item[Issue 1.14 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.15 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.16 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.17 (2004/02/07)] The SPARK program is now referred to as the Ada program.
\item[Issue 1.18 (2004/07/18)] Updates for reformed environments.
\item[Issue 1.19 (2005/05/28)] Fixed tests based on flawed assumptions about the Z Generator state after processing a compilation unit.
\item[Issue 1.20 (2006/02/10)] Allowed for enhancements 117 and 118.
\item[Issue 1.22 (2006/03/28)] Allowed for automated state management.
\item[Issue 1.23 (2006/04/07)] Allowed for insistence on canonical names in Z under enhancement 117
\item[Issue 1.24 (2006/06/01)] accommodated enhancement 139 - 1-theory-per-subprogram.
\item[Issue 1.25 (2006/09/19)] Allowed for enhancement 165.
\item[Issue 1.26 (2008/03/23)] Allowed for data type changes needed to support child packages.
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
This document contains specific tests to check the environments of the
Compliance Notation tool.
This mainly checks interactions between the modules defined
in \cite{ISS/HAT/DAZ/DTD507} and \cite{ISS/HAT/DAZ/DTD508}.

We are interested in two kinds of environments in these tests:
first the package and block environments, and second the theory environments.
The later is of concern when we prefix a theory as a result of processing a ``with'' clause - we need to determine whether everything has been properly
translated.


\section{PRELIMINARIES}

=SML
use_file "dtd013";
use_file "imp013";
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
=SML
val get_z_generator_state = CNZGenerator.get_z_generator_state;

open CNTypes CNTypes1 CNTypes2;
=TEX
=SML
fun pack_type_decls (pack : PACKAGE) = (
let	fun aux (BDTypeDecl {name = n,...} :: x) = aux x @ [n]
	| aux (_ :: x) = aux x
	| aux [] = [];
in
	aux (#consts_types pack)
end);
fun pack_const_decls (pack : PACKAGE) = (
let	fun aux (BDConstDecl {consts = cs,...} :: x) = aux x @ cs
	| aux (_ :: x) = aux x
	| aux [] = [];
in
	aux (#consts_types pack)
end);
=TEX
\section{Start of a new script}
=SML
clean_up();
new_script{name = "empty", unit_type="proc"};
local
val zgs_empty = get_z_generator_state();
in
val dummy = store_mt_results_show mt_run [
	("empty_length_blocks", Combinators.I, length (#blocks zgs_empty), 1),
	("empty_length_dec_env", Combinators.I, length (#dec_env zgs_empty), 0),
	("empty_length_pack_env", Combinators.I, length (#pack_env zgs_empty), 0),
	("empty_length_repl_env", Combinators.I, length (#repl_env zgs_empty), 0),
	("empty_length_spec_env", Combinators.I, length (#spec_env zgs_empty), 0),
	("empty_length_spark_prog", Combinators.I, length (#spark_prog zgs_empty), 0),
	("empty_length_subunit_env", Combinators.I, length (#subunit_env zgs_empty), 0)
];
val dummy = store_mt_results_show mt_run [
	("empty_script_name", (fn () => (#script_name zgs_empty)), (),
		"EMPTY'proc")
];
val dummy = let
val block1_empty = hd (#blocks zgs_empty);
in
store_mt_results_show mt_run [
	("empty_decflags", (fn () => (#flags(#declab block1_empty))), (),
		{fun_flag = false,
               stub_flag = false,
               till_flag = false,
               subunit_flag = false,
               declabel_flag = false,
               pack_body_flag = false,
               pack_spec_flag = false,
               speclabel_flag = false,
               formal_body_flag = false,
	       body_flag = false,
	       private_flag = false})
]
end;
end; (* zgs_empty *)
=TEX
\section{PACKAGE SPECIFICATION}
=SML
clean_up();
new_script{name = "PACK", unit_type="spec"};
ⓈCN
package PACK is
   ⟨ a k-slot ⟩ (1)
   type INT_TYPE is range 5 .. 90;
   X : INT_TYPE;
   Y : constant INT_TYPE := 5;
   procedure P(FX : out INTEGER);
   procedure P1(FX : out INTEGER)
   Δ FX Ξ PACKoX[ PACKoX > 10, FX > 0 ];
   function F(FY : in INTEGER) return INTEGER;
   function F1(FY : in INTEGER) return INTEGER
   Ξ PACKoX [PACKoF1 PACKoX (FY) > FY];
   $auxiliary s : seq ℕ;

   type AINT_TYPE is range 10 .. 80;
   X1, X2 : AINT_TYPE;
   Y1, Y2 : constant AINT_TYPE := 5;
   procedure Q;
   procedure Q1
   Δ PACKoX1 [ PACKoX1 > 20 ];
   function G return INTEGER;
   function G1 return INTEGER
   Ξ PACKoX [PACKoG1 PACKoX > 0];
    $auxiliary s1 : seq ℕ;

   ⟨ another k-slot ⟩ (2)
end PACK;
■
=SML
val zgs_ps = get_z_generator_state();
val dummy = store_mt_results_show mt_run [
	("ps_length_blocks", Combinators.I, length (#blocks zgs_ps), 1),
	("ps_length_dec_env", Combinators.I, length (#dec_env zgs_ps), 2),
	("ps_length_pack_env", Combinators.I, length (#pack_env zgs_ps), 1),
	("ps_length_repl_env", Combinators.I, length (#repl_env zgs_ps), 2),
	("ps_length_spec_env", Combinators.I, length (#spec_env zgs_ps), 0),
	("ps_length_spark_prog", Combinators.I, length (#spark_prog zgs_ps), 1),
	("ps_length_subunit_env", Combinators.I, length (#subunit_env zgs_ps), 0)
];
val dummy = store_mt_results_show mt_run [
	("ps_script_name", (fn () => (#script_name zgs_ps)), (),
		"PACK'spec")
];
val dummy = let
val block1_ps = hd (#blocks zgs_ps);
in
store_mt_results_show mt_run [
	("ps_decflags", (fn () => (#flags(#declab block1_ps))), (),
		{fun_flag = false,
               stub_flag = false,
               till_flag = false,
               subunit_flag = false,
               declabel_flag = false,
               pack_body_flag = false,
               pack_spec_flag = false,
               speclabel_flag = false,
               formal_body_flag = false,
	       body_flag = false,
	       private_flag = false})
]
end;
=TEX
=SML
val (name_ps, pack_ps) = hd(#pack_env zgs_ps);
=TEX
=SML
val dummy = store_mt_results_show mt_run [
	("ps_pack_name", Combinators.I,  name_ps, "PACK")
];
val dummy = store_mt_results_show mt_run [
	("ps_pack_vc_vars", flat o map (fn {vars = v,...}=> v),
		#vc_vars pack_ps, ["X", "X1", "X2"])
];
val dummy = store_mt_results_show mt_run [
	("ps_pack_consts", pack_const_decls, pack_ps,
		["Y", "Y1", "Y2"])
];
val dummy = store_mt_results_show mt_run [
	("ps_pack_types", pack_type_decls, pack_ps,
		["INT_TYPE", "AINT_TYPE"])
];
val dummy = store_mt_results_show mt_run [
	("ps_pack_fprocs", map (fn {name = v,...}=> v),
		#formal_procs pack_ps, ["P1", "Q1"])
];
val dummy = store_mt_results_show mt_run [
	("ps_pack_fprocs_w", map (fn {spec = {w=w,...},...}=> w),
		#formal_procs pack_ps, [["FX"], ["PACKoX1"]])
];
val dummy = store_mt_results_show mt_run [
	("ps_pack_fprocs_fids", map (fn {formal_ids=fids,...}=>
			map (fn {var_decl={vars=v,...},...} => v) fids),
		#formal_procs pack_ps, [[["FX"]], []])
];
val dummy = store_mt_results_show mt_run [
	("ps_pack_ffuns", map (fn {informal_fun = {name = v,...} ,...}=> v),
		#formal_funs pack_ps, ["F1", "G1"])
];
val dummy = store_mt_results_show mt_run [
	("ps_pack_ffuns_w", map (fn {spec = {w=w,...},...}=> w),
		#formal_funs pack_ps, [[], []])
];
val dummy = store_mt_results_show mt_run [
	("ps_pack_ffuns_g", map (fn {globals=globals, ...}=> globals),
		#formal_funs pack_ps, [["PACKoX"], ["PACKoX"]])
];
val dummy = store_mt_results_show mt_run [
	("ps_pack_ffuns_fids", map
		(fn {informal_fun = {formal_pars=fids,...},...} =>
			map (fn {var_decl={vars=v,...},...} => v) fids),
		#formal_funs pack_ps, [[["FY"]], []])
];
val dummy = store_mt_results_show mt_run [
	("ps_pack_ifuns", map (fn {name = v,...}=> v),
		#informal_funs pack_ps, ["F", "G"])
];
val dummy = store_mt_results_show mt_run [
	("ps_pack_ifuns_fids", map
		(fn {formal_pars=fids,...} =>
			map (fn {var_decl={vars=v,...},...} => v) fids),
		#informal_funs pack_ps, [[["FY"]], []])
];

=TEX
=SML
=TEX
\section{FILLING IN K-SLOTS}
=SML
ⓈCN
(1) ≡ Z : INTEGER;
■
ⓈCN
(2) ≡  procedure P2(FX : out INTEGER)
   Δ FX Ξ PACKoX [ PACKoX > 10, FX > 0 ];
■
=SML
val zgs_slabel = get_z_generator_state();
val dummy = store_mt_results_show mt_run [
	("slabel_length_blocks", Combinators.I, length (#blocks zgs_slabel), 1),
	("slabel_length_dec_env", Combinators.I, length (#dec_env zgs_slabel), 0),
	("slabel_length_pack_env", Combinators.I, length (#pack_env zgs_slabel), 1),
	("slabel_length_repl_env", Combinators.I, length (#repl_env zgs_slabel), 2),
	("slabel_length_spec_env", Combinators.I, length (#spec_env zgs_slabel), 0),
	("slabel_length_spark_prog", Combinators.I, length (#spark_prog zgs_slabel), 1),
	("slabel_length_subunit_env", Combinators.I, length (#subunit_env zgs_slabel), 0)
];
val dummy = store_mt_results_show mt_run [
	("slabel_script_name", (fn () => (#script_name zgs_slabel)), (),
		"PACK'spec")
];
val dummy = let
val block1_slabel = hd (#blocks zgs_slabel);
in
store_mt_results_show mt_run [
	("slabel_decflags", (fn () => (#flags(#declab block1_slabel))), (),
		{fun_flag = false,
               stub_flag = false,
               till_flag = false,
               subunit_flag = false,
               declabel_flag = false,
               pack_body_flag = false,
               pack_spec_flag = false,
               speclabel_flag = false,
               formal_body_flag = false,
               body_flag = false,
	       private_flag = false})
]
end;
=TEX
=SML
val (name_slabel, pack_slabel) = hd(#pack_env zgs_slabel);
=TEX
=SML
val dummy = store_mt_results_show mt_run [
	("slabel_pack_name", Combinators.I,  name_slabel, "PACK")
];
val dummy = store_mt_results_show mt_run [
	("slabel_pack_vc_vars", flat o map (fn {vars = v,...}=> v),
		#vc_vars pack_slabel, ["X", "X1", "X2", "Z"])
];
val dummy = store_mt_results_show mt_run [
	("slabel_pack_consts", pack_const_decls, pack_slabel,
		["Y", "Y1", "Y2"])
];
val dummy = store_mt_results_show mt_run [
	("slabel_pack_types", pack_type_decls, pack_slabel,
		["INT_TYPE", "AINT_TYPE"])
];
val dummy = store_mt_results_show mt_run [
	("slabel_pack_fprocs", map (fn {name = v,...}=> v),
		#formal_procs pack_slabel, ["P1", "Q1", "P2"])
];
val dummy = store_mt_results_show mt_run [
	("slabel_pack_fprocs_w", map (fn {spec = {w=w,...},...}=> w),
		#formal_procs pack_slabel, [["FX"], ["PACKoX1"], ["FX"]])
];
val dummy = store_mt_results_show mt_run [
	("slabel_pack_fprocs_fids", map (fn {formal_ids=fids,...}=>
			map (fn {var_decl={vars=v,...},...} => v) fids),
		#formal_procs pack_slabel, [[["FX"]], [], [["FX"]]])
];
val dummy = store_mt_results_show mt_run [
	("slabel_pack_ffuns", map (fn {informal_fun = {name = v,...} ,...}=> v),
		#formal_funs pack_slabel, ["F1", "G1"])
];
val dummy = store_mt_results_show mt_run [
	("slabel_pack_ffuns_w", map (fn {spec = {w=w,...},...}=> w),
		#formal_funs pack_slabel, [[], []])
];
val dummy = store_mt_results_show mt_run [
	("slabel_pack_ffuns_fids", map
		(fn {informal_fun = {formal_pars=fids,...},...} =>
			map (fn {var_decl={vars=v,...},...} => v) fids),
		#formal_funs pack_slabel, [[["FY"]], []])
];
val dummy = store_mt_results_show mt_run [
	("slabel_pack_ifuns", map (fn {name = v,...}=> v),
		#informal_funs pack_slabel, ["F", "G"])
];
val dummy = store_mt_results_show mt_run [
	("slabel_pack_ifuns_fids", map
		(fn {formal_pars=fids,...} =>
			map (fn {var_decl={vars=v,...},...} => v) fids),
		#informal_funs pack_slabel, [[["FY"]], []])
];
=TEX
=SML
val slabel_inscope = (#in_scope(#declab(hd(#blocks zgs_slabel))));
val dummy = store_mt_results_show mt_run [
	("slabel_inscope_vc_pars", Combinators.I,
		#vc_pars (get_local_vars (#dict slabel_inscope)), [])
];
val dummy = store_mt_results_show mt_run [
	("slabel_inscope_dec_labels", Combinators.I,
		#dec_labels slabel_inscope, [])
];
val dummy = store_mt_results_show mt_run [
	("slabel_inscope_vc_aux_vars", map
		Combinators.I,
		#vc_aux_vars (get_local_vars (#dict slabel_inscope)),
		[])
];
val dummy = store_mt_results_show mt_run [
	("slabel_inscope_vc_log_cons", Combinators.I,
		#vc_log_cons (get_local_vars (#dict slabel_inscope)), [])
];
=TEX
=SML
store_mt_results_show mt_run [
	("slabel_consts", map (fst o dest_const),
		(rev(get_consts "PACK'spec")), map (fn x => implode["z'", x]) [
"PACKoINT_TYPE", "PACKoINT_TYPEvFIRST", "PACKoINT_TYPEvLAST",
"PACKoINT_TYPEvSUCC", "PACKoINT_TYPEvPRED", "PACKoINT_TYPEvPOS",
"PACKoINT_TYPEvVAL", "PACKoY", "PACKoF", "PACKoF1", "PACKoAINT_TYPE", "PACKoAINT_TYPEvFIRST",
"PACKoAINT_TYPEvLAST", "PACKoAINT_TYPEvSUCC", "PACKoAINT_TYPEvPRED",
"PACKoAINT_TYPEvPOS", "PACKoAINT_TYPEvVAL", "PACKoY1", "PACKoY2", "PACKoG", "PACKoG1"])
];
=TEX

\section{AFTER WITH}
=SML
new_script{name="PACK1", unit_type="spec"};
ⓈCN
with PACK;
package PACK1 is
	X : INTEGER;
end PACK1;
■
=SML
val zgs_afterwith = get_z_generator_state();
val dummy = store_mt_results_show mt_run [
	("afterwith_length_blocks", Combinators.I, length (#blocks zgs_afterwith), 1),
	("afterwith_length_dec_env", Combinators.I, length (#dec_env zgs_afterwith), 0),
	("afterwith_length_pack_env", Combinators.I, length (#pack_env zgs_afterwith), 2),
	("afterwith_length_repl_env", Combinators.I, length (#repl_env zgs_afterwith), 0),
	("afterwith_length_spec_env", Combinators.I, length (#spec_env zgs_afterwith), 0),
	("afterwith_length_spark_prog", Combinators.I, length (#spark_prog zgs_afterwith), 1),
	("afterwith_length_subunit_env", Combinators.I, length (#subunit_env zgs_afterwith), 0)
];
val dummy = store_mt_results_show mt_run [
	("afterwith_script_name", (fn () => (#script_name zgs_afterwith)), (),
		"PACK1'spec")
];
val dummy = let
	val block1_afterwith = hd (#blocks zgs_afterwith);
in
store_mt_results_show mt_run [
	("afterwith_decflags", (fn () => (#flags(#declab block1_afterwith))), (),
		{fun_flag = false,
               stub_flag = false,
               till_flag = false,
               subunit_flag = false,
               declabel_flag = false,
               pack_body_flag = false,
               pack_spec_flag = false,
               speclabel_flag = false,
               formal_body_flag = false,
               body_flag = false,
	       private_flag = false})
]
end;
=TEX
=SML
val pack_afterwith = force_value(
	s_lookup "PACK1" (#pack_env zgs_afterwith));
=TEX
=SML
val dummy = store_mt_results_show mt_run [
	("afterwith_pack_vc_vars", flat o map (fn {vars = v,...}=> v),
		#vc_vars pack_afterwith, ["X"])
];
val dummy = store_mt_results_show mt_run [
	("afterwith_pack_consts", pack_const_decls, pack_afterwith,
		[])
];
val dummy = store_mt_results_show mt_run [
	("afterwith_pack_types", pack_type_decls, pack_afterwith,
		[])
];
val dummy = store_mt_results_show mt_run [
	("afterwith_pack_fprocs", map (fn {name = v,...}=> v),
		#formal_procs pack_afterwith, [])
];
val dummy = store_mt_results_show mt_run [
	("afterwith_pack_fprocs_w", map (fn {spec = {w=w,...},...}=> w),
		#formal_procs pack_afterwith, [])
];
val dummy = store_mt_results_show mt_run [
	("afterwith_pack_fprocs_fids", map (fn {formal_ids=fids,...}=>
			map (fn {var_decl={vars=v,...},...} => v) fids),
		#formal_procs pack_afterwith, [])
];
val dummy = store_mt_results_show mt_run [
	("afterwith_pack_ffuns", map (fn {informal_fun = {name = v,...} ,...}=> v),
		#formal_funs pack_afterwith, [])
];
val dummy = store_mt_results_show mt_run [
	("afterwith_pack_ffuns_w", map (fn {spec = {w=w,...},...}=> w),
		#formal_funs pack_afterwith, [])
];
val dummy = store_mt_results_show mt_run [
	("afterwith_pack_ffuns_fids", map
		(fn {informal_fun = {formal_pars=fids,...},...} =>
			map (fn {var_decl={vars=v,...},...} => v) fids),
		#formal_funs pack_afterwith, [])
];
val dummy = store_mt_results_show mt_run [
	("afterwith_pack_ifuns", map (fn {name = v,...}=> v),
		#informal_funs pack_afterwith, [])
];
val dummy = store_mt_results_show mt_run [
	("afterwith_pack_ifuns_fids", map
		(fn {formal_pars=fids,...} =>
			map (fn {var_decl={vars=v,...},...} => v) fids),
		#informal_funs pack_afterwith, [])
];
=TEX
=SML
val afterwith_inscope = (#in_scope(#declab(hd(#blocks zgs_afterwith))));
val dummy = store_mt_results_show mt_run [
	("afterwith_inscope_vc_pars", Combinators.I,
		#vc_pars (get_local_vars(#dict afterwith_inscope)), [])
];
val s = fn x => x;
val dummy = store_mt_results_show mt_run [
	("afterwith_inscope_vc_vars", s,
		#vc_vars (get_local_vars(#dict afterwith_inscope)),
		[])
];
val dummy = store_mt_results_show mt_run [
	("afterwith_inscope_dec_labels", Combinators.I,
		#dec_labels afterwith_inscope, [])
];
val dummy = store_mt_results_show mt_run [
	("afterwith_inscope_vc_aux_vars", s,
		#vc_aux_vars (get_local_vars(#dict afterwith_inscope)),
		[])
];
val dummy = store_mt_results_show mt_run [
	("afterwith_inscope_vc_log_cons", s,
		#vc_log_cons (get_local_vars(#dict afterwith_inscope)), [])
];
=TEX
=SML
store_mt_results_show mt_run [
	("afterwith_consts", map (fst o dest_const),
		(rev(get_consts "PACK'spec")), map (fn x => implode["z'", x]) [
"PACKoINT_TYPE", "PACKoINT_TYPEvFIRST", "PACKoINT_TYPEvLAST",
"PACKoINT_TYPEvSUCC", "PACKoINT_TYPEvPRED", "PACKoINT_TYPEvPOS",
"PACKoINT_TYPEvVAL", "PACKoY", "PACKoF", "PACKoF1", "PACKoAINT_TYPE", "PACKoAINT_TYPEvFIRST",
"PACKoAINT_TYPEvLAST", "PACKoAINT_TYPEvSUCC", "PACKoAINT_TYPEvPRED",
"PACKoAINT_TYPEvPOS", "PACKoAINT_TYPEvVAL", "PACKoY1", "PACKoY2", "PACKoG", "PACKoG1"])
];
=TEX
\section{PACKAGE BODY}
=IGN
force_delete_theory "PACK'body";
=SML
new_script{name = "PACK", unit_type="body"};
ⓈCN
package body PACK is
   ⟨ a k-slot ⟩ (3)
--   type INT_TYPE is range 5 .. 90;
   type BINT_TYPE is range 5 .. 90;
--   X : INT_TYPE;
   X3 : BINT_TYPE;
--   Y : constant INT_TYPE := 5;
   Y3 : constant INT_TYPE := 5;
   procedure P(FX : out INTEGER) is
   begin
	X := X3;
   end P;

   procedure P1(FX : out INTEGER)
   Δ FX Ξ PACKoX [ PACKoX > 10, FX > 0 ] is
   begin
	FX := X - 10;
   end P1;
   function F(FY : in INTEGER) return INTEGER is
   begin
	return (FY * Y3);
   end F;
   function F1(FY : in INTEGER) return INTEGER
   Ξ PACKoX [F1 PACKoX (FY) > FY] is
   begin
	return ((FY * FY) + Y3);
   end F1;

--   type AINT_TYPE is range 10 .. 80;
--   X1, X2 : AINT_TYPE;
--   Y1, Y2 : constant AINT_TYPE := 5;
   procedure Q is
   begin
	X2 := Y2;
   end Q;
   procedure Q1
   Δ PACKoX1 [ PACKoX1 > 20 ] is
   begin
	X1:= 20;
   end Q1;
   function G return INTEGER is
   begin
	return 5;
   end G;
   function G1 return INTEGER
   Ξ PACKoX [G1 PACKoX > 0] is
   begin
	return 5;
   end G1;

   ⟨ another k-slot ⟩ (4)
begin
   X2 := F(X2);
   P(X1);
end PACK;
■
=SML
val zgs_pb = get_z_generator_state();
val dummy = store_mt_results_show mt_run [
	("pb_length_blocks", Combinators.I, length (#blocks zgs_pb), 1),
	("pb_length_dec_env", Combinators.I, length (#dec_env zgs_pb), 2),
	("pb_length_pack_env", Combinators.I, length (#pack_env zgs_pb), 2),
	("pb_length_repl_env", Combinators.I, length (#repl_env zgs_pb), 2),
	("pb_length_spec_env", Combinators.I, length (#spec_env zgs_pb), 0),
	("pb_length_spark_prog", Combinators.I, length (#spark_prog zgs_pb), 1),
	("pb_length_subunit_env", Combinators.I, length (#subunit_env zgs_pb), 0)
];
val dummy = store_mt_results_show mt_run [
	("pb_script_name", (fn () => (#script_name zgs_pb)), (),
		"PACK'body")
];
val dummy = let
val block1_pb = hd (#blocks zgs_pb);
in
store_mt_results_show mt_run [
	("pb_decflags", (fn () => (#flags(#declab block1_pb))), (),
		{fun_flag = false,
               stub_flag = false,
               till_flag = false,
               subunit_flag = false,
               declabel_flag = false,
               pack_body_flag = false,
               pack_spec_flag = false,
               speclabel_flag = false,
               formal_body_flag = false,
               body_flag = false,
	       private_flag = false})
]
end;
=TEX
=SML
val pb_inscope = (#in_scope(#declab(hd(#blocks zgs_pb))));
val dummy = store_mt_results_show mt_run [
	("pb_inscope_vc_pars", Combinators.I,
		#vc_pars (get_local_vars(#dict pb_inscope)), [])
];
val dummy = store_mt_results_show mt_run [
	("pb_inscope_vc_vars", Combinators.I,
		#vc_vars (get_local_vars(#dict pb_inscope)), [])
];
val dummy = store_mt_results_show mt_run [
	("pb_inscope_dec_labels", Combinators.I,
		#dec_labels pb_inscope, [])
];
val dummy = store_mt_results_show mt_run [
	("pb_inscope_vc_aux_vars", map
		Combinators.I,
		#vc_aux_vars (get_local_vars(#dict pb_inscope)),
		[])
];
val dummy = store_mt_results_show mt_run [
	("pb_inscope_vc_log_cons", Combinators.I,
		#vc_log_cons (get_local_vars(#dict pb_inscope)), [])
];
=TEX
=SML
store_mt_results_show mt_run [
	("pb_consts", map (fst o dest_const),
		(rev(get_consts "PACK'body")), map (fn x => implode["z'", x]) [
"BINT_TYPE", "BINT_TYPEvFIRST", "BINT_TYPEvLAST",
"BINT_TYPEvSUCC", "BINT_TYPEvPRED", "BINT_TYPEvPOS",
"BINT_TYPEvVAL", "Y3", "F", "F1",
"G", "G1"])
];
=TEX
=SML
length(get_conjectures "PACK'body");
store_mt_results_show mt_run [
	("pb_conjectures", length, get_conjectures "PACK'body", 8)
];
=TEX
=SML
set_pc "cn";
store_mt_results_show mt_run [
	("pb_prove_conjectures", length o mapfilter (prove_rule [] o snd o snd), get_conjectures "PACK'body", 8)
];
=TEX
\section{AFTER FILLING IN BODY K-SLOTS}
ⓈCN
(3) ≡ Z1 : INTEGER;
■
ⓈCN
(4) ≡  procedure P2(FX : out INTEGER)
   Δ FX Ξ PACKoX [ PACKoX > 10, FX > 0 ] is
   begin
	FX := X + 1;
   end P2;
■
=SML
val zgs_pbk = get_z_generator_state();
val dummy = store_mt_results_show mt_run [
	("pbk_length_blocks", Combinators.I, length (#blocks zgs_pbk), 1),
	("pbk_length_dec_env", Combinators.I, length (#dec_env zgs_pbk), 0),
	("pbk_length_pack_env", Combinators.I, length (#pack_env zgs_pbk), 2),
	("pbk_length_repl_env", Combinators.I, length (#repl_env zgs_pbk), 2),
	("pbk_length_spec_env", Combinators.I, length (#spec_env zgs_pbk), 0),
	("pbk_length_spark_prog", Combinators.I, length (#spark_prog zgs_pbk), 1),
	("pbk_length_subunit_env", Combinators.I, length (#subunit_env zgs_pbk), 0)
];
val dummy = store_mt_results_show mt_run [
	("pbk_script_name", (fn () => (#script_name zgs_pbk)), (),
		"PACK'body")
];
val dummy = let
val block1_pbk = hd (#blocks zgs_pbk);
in
store_mt_results_show mt_run [
	("pbk_decflags", (fn () => (#flags(#declab block1_pbk))), (),
		{fun_flag = false,
               stub_flag = false,
               till_flag = false,
               subunit_flag = false,
               declabel_flag = false,
               pack_body_flag = false,
               pack_spec_flag = false,
               speclabel_flag = false,
               formal_body_flag = false,
               body_flag = false,
	       private_flag = false})
]
end;
=TEX
=SML
val  pack_pbk = force_value (s_lookup "PACK" (#pack_env zgs_pbk));
=TEX
=SML
val dummy = store_mt_results_show mt_run [
	("pbk_pack_vc_vars", flat o map (fn {vars = v,...}=> v),
		#vc_vars pack_pbk, ["X", "X1", "X2", "Z"])
];
val dummy = store_mt_results_show mt_run [
	("pbk_pack_fprocs", map (fn {name = v,...}=> v),
		#formal_procs pack_pbk, ["P1", "Q1", "P2"])
];
=TEX

=SML
val pbk_inscope = (#in_scope(#declab(hd(#blocks zgs_pbk))));
val dummy = store_mt_results_show mt_run [
	("pbk_inscope_vc_pars", Combinators.I,
		#vc_pars (get_local_vars(#dict pbk_inscope)), [])
];
val dummy = store_mt_results_show mt_run [
	("pbk_inscope_vc_vars", Combinators.I,
		#vc_vars (get_local_vars(#dict pbk_inscope)), [])
];
val dummy = store_mt_results_show mt_run [
	("pbk_inscope_dec_labels", Combinators.I,
		#dec_labels pbk_inscope, [])
];
val dummy = store_mt_results_show mt_run [
	("pbk_inscope_vc_aux_vars", map
		Combinators.I,
		#vc_aux_vars (get_local_vars(#dict pbk_inscope)),
		[])
];
val dummy = store_mt_results_show mt_run [
	("pbk_inscope_vc_log_cons", Combinators.I,
		#vc_log_cons (get_local_vars(#dict pbk_inscope)), [])
];
=TEX
=SML
store_mt_results_show mt_run [
	("pbk_consts", map (fst o dest_const),
		(rev(get_consts "PACK'body")), map (fn x => implode["z'", x]) [
"BINT_TYPE", "BINT_TYPEvFIRST", "BINT_TYPEvLAST",
"BINT_TYPEvSUCC", "BINT_TYPEvPRED", "BINT_TYPEvPOS",
"BINT_TYPEvVAL", "Y3", "F", "F1",
"G", "G1"])
];
=TEX
=SML
length(get_conjectures "PACK'body");
store_mt_results_show mt_run [
	("pbk_conjectures", length, get_conjectures "PACK'body", 10)
];
=TEX
=SML
set_pc "cn";
(length o mapfilter (prove_rule [] o snd o snd))( get_conjectures "PACK'body");
store_mt_results_show mt_run [
	("pbk_prove_conjectures", length o mapfilter (prove_rule [] o snd o snd), get_conjectures "PACK'body", 10)
];
=TEX
\section{PREFIXING THEORIES}
First the range of Ada type translations (primarily taken from Volume 3 of the
specs.):
=SML
clean_up();
new_script{name="PLAIN", unit_type="spec"};
ⓈCN
package plain is
type DAY is (MON, TUE, WED, THU, FRI, SAT, SUN);
subtype WEEKDAY is DAY range MON .. FRI;
PAY_DAY : constant WEEKDAY := FRI;
type STRING_ARRAY is array(DAY) of STRING;
A: constant STRING_ARRAY := STRING_ARRAY'("abc", "xyz");
V1: DAY;
V2 : INTEGER;
type ARR is array (DAY) of DAY;
type HOURS is range 0..23;
type ARR2 is array(DAY, HOURS) of DAY;
type UNCON is array(DAY range <>) of DAY;
type UNCON2 is array(DAY range<>, HOURS range<>) of DAY;
type REC is
record
	START : DAY;
	FINISH : DAY;
	YESTERDAY : ARR;
end record;
type FIX is delta 0.1 range 5.1 .. 10.0;
subtype SUBFIX1 is FIX range 7.0 .. 9.0;
subtype SUB is UNCON(WEEKDAY);
subtype SUB2 is UNCON2(WEEKDAY, HOURS);
end plain;
■
=SML
new_script {name="USES_PLAIN", unit_type="spec"};
ⓈCN
with PLAIN;
package uses_plain is
V1 : PLAIN.DAY := PLAIN.DAY'FIRST;
V2 : PLAIN.WEEKDAY:= PLAIN.WEEKDAY'FIRST;
V3 : PLAIN.WEEKDAY := PLAIN.PAY_DAY;
V4 : PLAIN.STRING_ARRAY := PLAIN.A;
V5 : PLAIN.ARR;
V6 : PLAIN.HOURS := PLAIN.HOURS'FIRST;
V7 : PLAIN.ARR2;
V8 : PLAIN.UNCON;
V9 : PLAIN.UNCON2;
V10: PLAIN.REC;
V11: PLAIN.FIX;
V12: PLAIN.SUBFIX1;
V13: PLAIN.SUB;
V14: PLAIN.SUB2;
procedure P
 Δ USES_PLAINoV5 Ξ USES_PLAINoV7, USES_PLAINoV8, USES_PLAINoV9, USES_PLAINoV10, USES_PLAINoV11, USES_PLAINoV12, USES_PLAINoV13, USES_PLAINoV14
[ USES_PLAINoV5(PLAINoMON) > 0 ∧
	 USES_PLAINoV7 (PLAINoTUE, PLAINoHOURSvLAST) > 0 ∧
	 USES_PLAINoV8 (PLAINoMON) = PLAINoMON ∧
	 USES_PLAINoV9 (PLAINoTUE, PLAINoHOURSvLAST) > 0 ∧
	 USES_PLAINoV10.START = PLAINoMON ∧
	 USES_PLAINoV11 = USES_PLAINoV12 ∧
	 USES_PLAINoV13(PLAINoMON) = PLAINoSUBvFIRST ∧
	 USES_PLAINoV14 (PLAINoMON, PLAINoHOURSvLAST) = USES_PLAINoV8(PLAINoMON)];
end uses_plain;
■
=TEX
Now for Z paragraphs:
=SML
clean_up();
new_script{name="PLAIN1", unit_type="spec"};
=TEX
ⓈZ
│ [ GIVEN ]
■
ⓈZ
│ [ GIVEN1, GIVEN2 ]
■
ⓈZAX
│ fn1 : GIVEN ⇸ GIVEN1;
│ fn2 : GIVEN ⇸ GIVEN2
├──────
│ dom fn1 = dom fn2
■
┌ SCH1 ───────────
│ a, b : ℤ
├──────
│ a = b
└──────────────
┌ SCH2[X] ───────────
│ a, b : X
├──────
│ a = b
└──────────────
╒[X]═══════════
│ fn3 : SCH2[X] ⇸ ℤ;
│ fn4 : SCH2[X] ⇸ ℕ
├──────
│ dom fn3 = dom fn4
└──────────────
ⓈZ
│ T1[X, Y] ≜ X × Y
■
ⓈZ
│ T2 ::= Con1 | Con2 ⟨ℤ⟩
■
ⓈZ
rel _ myinfix1 _
■
╒[X]═══════════
│ _ myinfix1 _ : X ↔ X
├──────
│ ∀ x, y : X ⦁ (x = y) ⇒ (x myinfix1 y)
└──────────────

ⓈCN
package plain1 is
X : INTEGER;
end plain1;
■
=SML
new_script{name="USING_PLAIN1", unit_type="spec"};
ⓈCN
with plain1;
package using_plain1 is
 ⟨Procedure P⟩			(100)
end using_plain1;
■
=TEX
Note that the fixity declaration caused by the $with$ does not take effect
``fast enough'' for the following text to be done in place, because
fixity instructions affect the ability to input the Z embedded in the Compliance
Notation.
ⓈCN
(100) ≡
procedure P
 Δ [∀ a : GIVEN; b : GIVEN1; c : GIVEN2; d : dom fn1; n : dom fn2;
	f : SCH1; g : SCH2[ℤ]; h : dom (fn3[ℤ]) ;
	i : dom (fn4[ℤ]); j : T1[ℤ, ℤ]; k : T2; l, m : { Con1, Con2 1} ⦁
	(l, m) ∈  (_ myinfix1 _)[T2]
   ];
■
=SML
fun p1_types() = (let val dummy = open_theory "PLAIN1'spec";
			val res = (map (fst o dest_ctype) o get_types) "PLAIN1'spec";
			val dummy1 = open_theory "USING_PLAIN1'spec";
		in
			res
		end);

store_mt_results_show mt_run [
("prefix2_types", p1_types,
	(), map (fst o dest_ctype) (get_types "PLAIN1'spec")
)
];
=TEX
=SML
fun p1_consts() = (let val dummy = open_theory "PLAIN1'spec";
			val res = (map ((fn(n,_,_) => n) o dest_z_gvar) o get_consts) "PLAIN1'spec";
			val dummy1 = open_theory "USING_PLAIN1'spec";
		in
			res
		end);

store_mt_results_show mt_run [
("prefix2_consts", p1_consts,
	(), map ((fn(n,_,_) => n) o dest_z_gvar) (get_consts "PLAIN1'spec")
)
];
=TEX
=SML
fun p1_axioms() = (let val dummy = open_theory "PLAIN1'spec";
			val res = (flat o map fst o get_axioms) "PLAIN1'spec";
			val dummy1 = open_theory "USING_PLAIN1'spec";
		in
			res
		end);
store_mt_results_show mt_run [
("prefix2_axioms",
	p1_axioms,
	(), (flat o map fst o get_axioms) "PLAIN1'spec")
];
=TEX
=SML
fun p1_defns() = (let val dummy = open_theory "PLAIN1'spec";
			val res = (flat o map fst o get_defns) "PLAIN1'spec";
			val dummy1 = open_theory "USING_PLAIN1'spec";
		in
			res
		end);
store_mt_results_show mt_run [
("prefix2_defns",
	p1_defns,
	(), (flat o map fst o get_defns) "PLAIN1'spec")
];
=TEX

=IGN
open_theory "USING_PLAIN1'spec";
open_theory "PLAIN1'spec";
z_print_theory "PLAIN1'spec";
=TEX
=SML
=TEX
Now for Z paragraphs:
=SML
clean_up();
new_script{name="MIX1", unit_type="spec"};
ⓈZAX
│ fn1 : ℤ ⇸ ℤ
├──────
│ dom fn1 = {1, 2, 3, 4, 5}
■
ⓈCN
package mix1 is
subtype T5 is INTEGER range 1 .. 5;
V5 : T5;
procedure F5
 Δ MIX1oV5 [ fn1 MIX1oV5 > 0 ];
end mix1;
■
ⓈZAX
│ fn2 : MIX1oT5 ⇸ ℤ
├──────
│ dom fn2 = {1, 2, 3, 4, 5}
■
=SML
new_script{name="MIX2", unit_type="spec"};
ⓈCN
with mix1;
package mix2 is
subtype T5 is MIX1.T5;
procedure F25 (X : in T5)
 Δ MIX1oV5 [ fn1 MIX1oV5 > 0, fn2 MIX1oV5 > 0 ];
end mix2;
■
=SML
new_script{name="MIX2", unit_type="body"};
=TEX
Simple success is all we require, so:
=SML
fun mix () =
ⓈCN
$references mix1;
package body mix2 is
procedure F25
 Δ MIX1oV5 [ fn1 MIX1oV5 > 0, fn2 MIX1oV5 > 0 ] is
begin
	MIX1.V5 := 1;
end F25;
end mix2;
■
=SML
store_mt_results_show mt_run [
("mix_body",
	mix, (), ())
];
=TEX
=SML
fun m1_types() = (let val dummy = open_theory "MIX1'spec";
			val res = (map (fst o dest_ctype) o get_types) "MIX1'spec";
			val dummy1 = open_theory "MIX2'body";
		in
			res
		end);

store_mt_results_show mt_run [
("prefix3_types", m1_types,
	(), map (fst o dest_ctype) (get_types "MIX1'spec")
)
];
=TEX
=SML
fun m1_consts() = (let val dummy = open_theory "MIX1'spec";
			val res = (map ((fn(n,_,_) => n) o dest_z_gvar) o get_consts) "MIX1'spec";
			val dummy1 = open_theory "MIX2'body";
		in
			res
		end);

store_mt_results_show mt_run [
("prefix3_consts", m1_consts,
	(), map ((fn(n,_,_) => n) o dest_z_gvar) (get_consts "MIX1'spec")
)
];
=TEX
=SML
fun m1_axioms() = (let val dummy = open_theory "MIX1'spec";
			val res = (flat o map fst o get_axioms) "MIX1'spec";
			val dummy1 = open_theory "MIX2'body";
		in
			res
		end);
store_mt_results_show mt_run [
("prefix3_axioms",
	m1_axioms,
	(), (flat o map fst o get_axioms) "MIX1'spec")
];
=TEX
=SML
fun m1_defns() = (let val dummy = open_theory "MIX1'spec";
			val res = (flat o map fst o get_defns) "MIX1'spec";
			val dummy1 = open_theory "MIX2'body";
		in
			res
		end);
store_mt_results_show mt_run [
("prefix3_defns",
	m1_defns,
	(), (flat o map fst o get_defns) "MIX1'spec")
];
=TEX

\section{EPILOGUE}
=SML
diag_line (summarize_mt_results());
=TEX
\pagebreak
\end{document}
=IGN

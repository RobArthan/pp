=IGN
********************************************************************************
mdt507.doc: this file is part of the PPDaz system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% ℤ $Revision: 1.49 $ $RCSfile: mdt507.doc,v $ $Date: 2006/09/19 11:24:22 $
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

\def\Title{Module Tests for Z Generator}

\def\AbstractText{This document contains tests for theory hierarchy material implemented in the Z Generator material.}

\def\Reference{ISS/HAT/DAZ/MDT507}

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
%% LaTeX2e port: \TPPtitle{Module Tests for Z Generator}  %% Mandatory field
%% LaTeX2e port: \TPPref{ISS/HAT/DAZ/MDT507}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.49 $
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
%% LaTeX2e port: \TPPabstract{This document contains tests for theory hierarchy material
%% LaTeX2e port: implemented in the Z Generator material.}
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
\bibliography{daz,fmu}

\subsection{Changes history}
\begin{description}
\item[Issue 1.1 (1997/04/14)-1.2 (1997/04/14)]
First drafts.
\item[Issue 1.3 (1997/05/22)]
Change to one compilation unit per script.
\item[Issue 1.4 (1997/06/03)]
IUCT WP 2 changes.
\item[Issue 1.5 (1997/06/04)]
Checking Check 17.
\item[Issue 1.6 (1997/06/05)]
Adding renaming in specifications material.
\item[Issue 1.7 (1997/06/10) - 1.9 (1997/06/12)]
Changes from IUCT WP 2 and WP 7.
\item[Issue 1.10 (1997/06/12)]
Clashes between formal parameters and variables or constants.
\item[Issue 1.11 (1997/06/17)-12]
IUCT WP 3 changes.
\item[Issue 1.13 (1997/06/19)]
IUCT WP 5 changes.
\item[Issue 1.14 (1997/06/30)]
IUCT WP 3 - references clauses package names must exist test.
\item[Issue 1.15 (1997/07/21),1.16 (1997/07/24)]
IUCT WP 3 - extra references clauses required now $pack\_spec\_with\_modules$
has gone away.
\item[Issue 1.17 (1997/08/05)]
Added tests for $print\_z\_document$ and $z\_prefix$ for non-axiomatic mode
definitions.
Added tests for references.
\item[Issue 1.18 (2000/10/25)] CTLE II R2/1: global variable unsoundness.
\item[Issue 1.19 (2002/03/02)] R0065: duplicate names now allowed in context clauses.
\item[Issue 1.20 (2002/03/14)] {\it ExtendedIO.execute} has now been withdrawn.
\item[Issue 1.21 (2002/05/07)] Allowed for slightly different error behavour as a result of spring 2002 enhancements..
\item[Issue 1.22 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.23 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.24 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.25 (2002/12/10)] No longer relies on default setting for case of Ada keywords.
\item[Issue 1.26 (2003/07/17)] Allowed for improved early type-checking of specification statements.
\item[Issue 1.27 (2004/01/19)] Fixed broken test ``refer1.11''.
\item[Issue 1.28 (2004/02/07)] The SPARK program is now referred to as the Ada program.
\item[Issues 1.29 (2004/07/13), 1.30 (2004/07/14)] Allowed for some changed error messages.
\item[Issue 1.31 (2004/07/18)] Fixed error in test on procedure renaming
\item[Issue 1.32 (2005/05/28)] Compliance Notation reserved words are now prefixed by a dollar sign.
\item[Issues 1.33 (2005/09/14), 1.34 (2005/09/15)] Allowed for enhanced error messages.
\item[Issues 1.35 (2006/01/14)] Allowed for corrections to error analysis.
\item[Issues 1.36 (2006/03/18), 1.37 (2006/03/22)] Allowing for enhancement 117.
\item[Issue 1.38 (2006/03/22)] Beginning on enhancement 118.
\item[Issue 1.39 (2006/03/24)] More on enhancement 117.
\item[Issue 1.40 (2006/03/28)] Allowed for automated state management.
\item[Issues 1.41 (2006/03/28), 1.42 (2006/03/29)] Fully allowed for enhancement 118.
\item[Issue 1.43 (2006/04/07)] Allowed for insistence on canonical names in Z under enhancement 117
\item[Issue 1.44 (2006/04/11)] Allowed for new uniform checks on Z names.
\item[Issue 1.45 (2006/06/01)] Allowed for ``1 theory per subprogram''.
\item[Issue 1.45 (2006/06/01)] accommodated enhancement 139 --- 1-theory-per-subprogram.
\item[Issue 1.45 (2006/06/01)] accommodated enhancement 162 ---
context theories.
\item[Issue 1.46 (2006/07/21)] {\em case\_of\_ada\_keywords} is now {\em cn\_case\_of\_ada\_keywords}.
\item[Issue 1.47 (2006/09/18)] Removed some obsolete test material.
\item[Issue 1.48 (2006/09/18)] Tidied usage of {\em new\_script}.
\item[Issue 1.49 (2006/09/19)] Allowed for enhancement 165.
\item[Issue 1.50 (2007/02/18)] Allowed for new rules on global dependency lists.
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
This document contains module tests for theory hierarchy
effects of the functions defined
in \cite{ISS/HAT/DAZ/DTD507}.
\subsection{Introduction}
\subsubsection{Background and Purpose}
See \cite{ISS/HAT/DAZ/DTD507}.
In general the material in this document is tested by the various
integration test documents in the DAZ project.
However, the changes in theory hierarchy structure caused by $new\_script1$
and other functions is not tested elsewhere.
\subsubsection{Dependencies}
These tests depend on
the test harness as implemented in DS/FMU/IED/IMP013, and
its corresponding detailed design document, DS/FMU/IED/DTD013.

The tests rely on ISS/HAT/DAZ/IMP516, or require the $CNZGenerator$
structure to be opened.

\subsubsection{Possible Enhancements}
None known.
\subsubsection{Deficiencies}
None known.

\section{PREAMBLE}
=SML
use_file "dtd013.sml";
use_file "imp013.sml";
init_mt_results();
=TEX
\section{THE TESTS}
We use upper case for Ada keywords in the tests:
=SML
set_string_control("cn_case_of_ada_keywords", "upper");
=TEX
\subsection{Useful functions}
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
=SML
fun sl_format (sl : string list) : string = format_list Combinators.I sl ", ";
=TEX

\subsection{$new\_script$}
First check that we really need to use $new\_script$:
=SML
clean_up();
fun cn_created1 () =
ⓈCN
package cn_created is
	VAR1 : INTEGER;
end cn_created;
■
=SML
store_mt_results_show mt_run_fail [
	("cn_created1", cn_created1, (),
		gen_fail_msg "check17" 507056 [
			"CN_CREATED",
			"cn"])
];
=SML
new_theory "temp";
fun cn_created2 () =
ⓈCN
package cn_created is
	VAR1 : INTEGER;
end cn_created;
■
=SML
store_mt_results mt_run_fail [
	("cn_created2", cn_created1, (),
		gen_fail_msg "check17" 507056 [
			"CN_CREATED",
			"temp"])
];
=SML
clean_up();
new_script{name = "MDT507NS_1_1", unit_type="spec"};
=TEX
ⓈCN
package mdt507NS_1_1 is
	VAR1 : INTEGER;

	procedure TEST1 (M : out INTEGER)
	Δ M Ξ MDT507NS_1_1oVAR1 [MDT507NS_1_1oVAR1 = 0, M = 0];

end mdt507NS_1_1;
■
=SML
store_mt_results mt_run [
	("ns_1_1a_gp", sl_format o get_parents, "MDT507NS_1_1'spec", "cn"),
	("ns_1_1a_gc", sl_format o get_children, "MDT507NS_1_1'spec", ""),
	("ns_1_1a_gc_cn", sl_format o get_children, "cn", "MDT507NS_1_1'spec")
	
];
=TEX
=SML
new_script{name = "TEST2", unit_type="proc"};
ⓈCN
 with mdt507NS_1_1;
  procedure TEST2
  is
  begin
       mdt507NS_1_1.VAR1 := 0;
  end TEST2;
■
=SML
store_mt_results_show mt_run [
	("ns_1_1b_gp", sl_format o get_parents, "TEST2'proc",
		"MDT507NS_1_1'spec, cn"),
	("ns_1_1b_gc", sl_format o get_children, "TEST2'proc", ""),
	("ns_1_1b_gc_cn", sl_format o get_children, "cn",
		"TEST2'proc, MDT507NS_1_1'spec")
];
=TEX
=SML
new_script{name = "MDT507NS_1_1", unit_type="body"};
ⓈCN
package body mdt507NS_1_1 is

	procedure TEST1 (M : out INTEGER)
	Δ M Ξ MDT507NS_1_1oVAR1 [MDT507NS_1_1oVAR1 = 0, M = 0]
	is
	begin
		M := VAR1;
	end TEST1;

begin
	VAR1 := 2;

end mdt507NS_1_1;
■
=SML
store_mt_results mt_run [
	("ns_1_1c_gp", sl_format o get_parents, "MDT507NS_1_1'body",
		"MDT507NS_1_1'spec, cn"),
	("ns_1_1c_gc", sl_format o get_children, "MDT507NS_1_1'body", ""),
	("ns_1_1c_gc_cn", sl_format o get_children, "cn",
		"MDT507NS_1_1oTEST1'context, MDT507NS_1_1'body, TEST2'proc, MDT507NS_1_1'spec"),
	("ns_1_1c_gc_cxt", sl_format o get_children, "MDT507NS_1_1oTEST1'context",
		"MDT507NS_1_1oTEST1'proc")	
];

=TEX
=SML
new_script{name = "TEST3", unit_type="proc"};
ⓈCN
 procedure TEST3 is
    VAR2 : INTEGER;
    procedure TEST4 is separate;
    function TEST5 (I : INTEGER) return INTEGER is separate;
 begin
    null;
    TEST4;
    VAR2 := TEST5( 0 );
 end TEST3;
■
=SML
store_mt_results mt_run [
	("ns_1_1d_gp", sl_format o get_parents, "TEST3'proc",
		"cn"),
	("ns_1_1d_gc", sl_format o get_children, "TEST3'proc", ""),
	("ns_1_1d_gc_cn", sl_format o get_children, "cn",
		"TEST3oTEST5'context, TEST3oTEST4'context, TEST3'proc, MDT507NS_1_1oTEST1'context, MDT507NS_1_1'body, TEST2'proc, MDT507NS_1_1'spec"),
	("ns_1_1d_gpcontext", sl_format o get_parents, "TEST3oTEST5'context",
		"cn"),
	("ns_1_1d_gccontext", sl_format o get_children, "TEST3oTEST5'context", "")
];
=TEX
=SML
new_script{name="TEST3.TEST4", unit_type="proc"};
ⓈCN
 separate (TEST3)
    procedure TEST4 is begin VAR2 := 1; end TEST4;
■
=SML
store_mt_results mt_run [
	("ns_1_1e_gp", sl_format o get_parents, "TEST3oTEST4'proc",
		"TEST3oTEST4'context, cn"),
	("ns_1_1e_gc", sl_format o get_children, "TEST3oTEST4'proc", ""),
	("ns_1_1e_gc_cn", sl_format o get_children, "cn",
"TEST3oTEST4'proc, TEST3oTEST5'context, TEST3oTEST4'context, TEST3'proc, MDT507NS_1_1oTEST1'context, MDT507NS_1_1'body, TEST2'proc, MDT507NS_1_1'spec"),
	("ns_1_1e_gpcontext", sl_format o get_parents, "TEST3oTEST4'context",
		"cn"),
	("ns_1_1e_gccontext", sl_format o get_children, "TEST3oTEST4'context",
		"TEST3oTEST4'proc")
];

=TEX
=SML
new_script{name="TEST3.TEST5", unit_type="func"};
ⓈCN
 separate (TEST3)
    function TEST5 (I : INTEGER) return INTEGER is
    begin return 0; end TEST5;
■
=SML
store_mt_results mt_run [
	("ns_1_1f_gp", sl_format o get_parents, "TEST3oTEST5'func",
		"TEST3oTEST5'context, cn"),
	("ns_1_1f_gc", sl_format o get_children, "TEST3oTEST5'func", ""),
	("ns_1_1f_gc_cn", sl_format o get_children, "cn",
"TEST3oTEST5'func, TEST3oTEST4'proc, TEST3oTEST5'context, TEST3oTEST4'context, TEST3'proc, MDT507NS_1_1oTEST1'context, MDT507NS_1_1'body, TEST2'proc, MDT507NS_1_1'spec"),
	("ns_1_1f_gpcontext", sl_format o get_parents, "TEST3oTEST5'context",
		"cn"),
	("ns_1_1f_gccontext", sl_format o get_children, "TEST3oTEST5'context",
		"TEST3oTEST5'func")
];
=TEX
\subsection{$new\_script1$ - No Library theories}
=SML
clean_up();
new_script1{name = "MDT507NS_1_1", unit_type="spec", library_theories=[]};
=TEX
ⓈCN
package mdt507NS_1_1 is
	VAR1 : INTEGER;

	procedure TEST1 (M : out INTEGER)
	Δ M Ξ MDT507NS_1_1oVAR1 [MDT507NS_1_1oVAR1 = 0, M = 0];

end mdt507NS_1_1;
■
=SML
store_mt_results mt_run [
	("ns1_1_1a_gp", sl_format o get_parents, "MDT507NS_1_1'spec", "cn"),
	("ns1_1_1a_gc", sl_format o get_children, "MDT507NS_1_1'spec", ""),
	("ns1_1_1a_gc_cn", sl_format o get_children, "cn", "MDT507NS_1_1'spec")
	
];
=TEX
=SML
new_script1{name = "TEST2", unit_type="proc", library_theories=[]};
ⓈCN
 with mdt507NS_1_1;
  procedure TEST2
  is
  begin
       mdt507NS_1_1.VAR1 := 0;
  end TEST2;
■
=SML
store_mt_results mt_run [
	("ns1_1_1b_gp", sl_format o get_parents, "TEST2'proc",
		"MDT507NS_1_1'spec, cn"),
	("ns1_1_1b_gc", sl_format o get_children, "TEST2'proc", ""),
	("ns1_1_1b_gc_cn", sl_format o get_children, "cn",
		"TEST2'proc, MDT507NS_1_1'spec")
	
];
=TEX
=SML
new_script1{name = "MDT507NS_1_1", unit_type="body", library_theories=[]};
ⓈCN
package body mdt507NS_1_1 is

	procedure TEST1 (M : out INTEGER)
	Δ M Ξ MDT507NS_1_1oVAR1 [MDT507NS_1_1oVAR1 = 0, M = 0]
	is
	begin
		M := VAR1;
	end TEST1;

begin
	VAR1 := 2;

end mdt507NS_1_1;
■
=SML
store_mt_results mt_run [
	("ns1_1_1c_gp", sl_format o get_parents, "MDT507NS_1_1'body",
		"MDT507NS_1_1'spec, cn"),
	("ns1_1_1c_gc", sl_format o get_children, "MDT507NS_1_1'body", ""),
	("ns1_1_1c_gc_cn", sl_format o get_children, "cn",
		"MDT507NS_1_1oTEST1'context, MDT507NS_1_1'body, TEST2'proc, MDT507NS_1_1'spec"),
	("ns1_1_1c_gc_cxt", sl_format o get_children, "MDT507NS_1_1oTEST1'context",
		"MDT507NS_1_1oTEST1'proc")		
];
=TEX
=SML
new_script1{name = "TEST3", unit_type="proc", library_theories=[]};
ⓈCN
 procedure TEST3 is
    VAR2 : INTEGER;
    procedure TEST4 is separate;
    function TEST5 (I : INTEGER) return INTEGER is separate;
 begin
    null;
    TEST4;
    VAR2 := TEST5( 0 );
 end TEST3;
■
=SML
store_mt_results mt_run [
	("ns1_1_1d_gp", sl_format o get_parents, "TEST3'proc",
		"cn"),
	("ns1_1_1d_gc", sl_format o get_children, "TEST3'proc", ""),
	("ns1_1_1d_gc_cn", sl_format o get_children, "cn",
		"TEST3oTEST5'context, TEST3oTEST4'context, TEST3'proc, MDT507NS_1_1oTEST1'context, MDT507NS_1_1'body, TEST2'proc, MDT507NS_1_1'spec"),
	("ns1_1_1d_gpcontext", sl_format o get_parents, "TEST3oTEST5'context",
		"cn"),
	("ns1_1_1d_gccontext", sl_format o get_children, "TEST3oTEST5'context", "")
];
=TEX
=SML
new_script1{name="TEST3.TEST4", unit_type="proc", library_theories=[]};
ⓈCN
 separate (TEST3)
    procedure TEST4 is begin VAR2 := 1; end TEST4;
■
=SML
store_mt_results mt_run [
	("ns1_1_1e_gp", sl_format o get_parents, "TEST3oTEST4'proc",
		"TEST3oTEST4'context, cn"),
	("ns1_1_1e_gc", sl_format o get_children, "TEST3oTEST4'proc", ""),
	("ns1_1_1e_gc_cn", sl_format o get_children, "cn",
"TEST3oTEST4'proc, TEST3oTEST5'context, TEST3oTEST4'context, TEST3'proc, MDT507NS_1_1oTEST1'context, MDT507NS_1_1'body, TEST2'proc, MDT507NS_1_1'spec"),
	("ns1_1_1e_gpcontext", sl_format o get_parents, "TEST3oTEST4'context",
		"cn"),
	("ns1_1_1e_gccontext", sl_format o get_children, "TEST3oTEST4'context",
		"TEST3oTEST4'proc")
];

=TEX
=SML
new_script1{name="TEST3.TEST5", unit_type="func", library_theories=[]};
ⓈCN
 separate (TEST3)
    function TEST5 (I : INTEGER) return INTEGER is
    begin return 0; end TEST5;
■
=SML
store_mt_results_show mt_run [
	("ns1_1_1f_gp", sl_format o get_parents, "TEST3oTEST5'func",
		"TEST3oTEST5'context, cn"),
	("ns1_1_1f_gc", sl_format o get_children, "TEST3oTEST5'func", ""),
	("ns1_1_1f_gc_cn", sl_format o get_children, "cn",
"TEST3oTEST5'func, TEST3oTEST4'proc, TEST3oTEST5'context, TEST3oTEST4'context, TEST3'proc, MDT507NS_1_1oTEST1'context, MDT507NS_1_1'body, TEST2'proc, MDT507NS_1_1'spec"),
	("ns1_1_1f_gpcontext", sl_format o get_parents, "TEST3oTEST5'context",
		"cn"),
	("ns1_1_1f_gccontext", sl_format o get_children, "TEST3oTEST5'context",
		"TEST3oTEST5'func")
];
=TEX
\subsection{$new\_script1$ - Two Library theories}
=SML
clean_up();
new_theory "A";
=TEX
ⓈZ
│ ABST1 ::= Abs1
■
=SML
open_theory "cn";
new_theory "B";
=TEX
ⓈZ
│ ABST2 ::= Abs2
■
=SML
open_theory "cn";
new_theory "C";
=TEX
ⓈZ
│ ABST3 ::= Abs3
■
=SML
new_script1{name = "MDT507NS1X2_1_1", unit_type="spec", library_theories=["A", "B"]};
=TEX
ⓈCN
package mdt507NS1X2_1_1 is
	VAR1 : INTEGER;

	procedure TEST1 (M : out INTEGER)
	Δ M Ξ MDT507NS1X2_1_1oVAR1 [MDT507NS1X2_1_1oVAR1 = 0, M = 0];

end mdt507NS1X2_1_1;
■
=SML
store_mt_results mt_run [
	("ns1x2_1_1a_gp", sl_format o get_parents, "MDT507NS1X2_1_1'spec", "B, A, cn"),
	("ns1x2_1_1a_gc", sl_format o get_children, "MDT507NS1X2_1_1'spec", ""),
	("ns1x2_1_1a_gc_cn", sl_format o get_children, "cn", "MDT507NS1X2_1_1'spec, C, B, A")	
];
=TEX
=SML
new_script1{name = "TEST2", unit_type="proc", library_theories=["A", "B"]};
ⓈCN
 with mdt507NS1X2_1_1;
  procedure TEST2
  is
  begin
       mdt507NS1X2_1_1.VAR1 := 0;
  end TEST2;
■
=SML
store_mt_results mt_run [
	("ns1x2_1_1b_gp", sl_format o get_parents, "TEST2'proc",
		"MDT507NS1X2_1_1'spec, B, A, cn"),
	("ns1x2_1_1b_gc", sl_format o get_children, "TEST2'proc", ""),
	("ns1x2_1_1b_gc_cn", sl_format o get_children, "cn",
		"TEST2'proc, MDT507NS1X2_1_1'spec, C, B, A")
];
=TEX
=SML
new_script1{name = "MDT507NS1X2_1_1", unit_type="body", library_theories=["A", "B"]};
ⓈCN
package body mdt507NS1X2_1_1 is

	procedure TEST1 (M : out INTEGER)
	Δ M Ξ MDT507NS1X2_1_1oVAR1 [MDT507NS1X2_1_1oVAR1 = 0, M = 0]
	is
	begin
		M := VAR1;
	end TEST1;

begin
	VAR1 := 2;

end mdt507NS1X2_1_1;
■
=SML
store_mt_results mt_run [
	("ns1x2_1_1c_gp", sl_format o get_parents, "MDT507NS1X2_1_1'body",
		"MDT507NS1X2_1_1'spec, B, A, cn"),
	("ns1x2_1_1c_gc", sl_format o get_children, "MDT507NS1X2_1_1'body", ""),
	("ns1x2_1_1c_gc_cn", sl_format o get_children, "cn",
	"MDT507NS1X2_1_1oTEST1'context, MDT507NS1X2_1_1'body, TEST2'proc, MDT507NS1X2_1_1'spec, C, B, A"),
	("ns1x2_1_1c_gc_cxt", sl_format o get_children, "MDT507NS1X2_1_1oTEST1'context",
		"MDT507NS1X2_1_1oTEST1'proc")	
];
=TEX
=SML
new_script1{name = "TEST3", unit_type="proc", library_theories=["A", "B"]};
ⓈCN
 procedure TEST3 is
    VAR2 : INTEGER;
    procedure TEST4 is separate;
    function TEST5 (I : INTEGER) return INTEGER is separate;
 begin
    null;
    TEST4;
    VAR2 := TEST5( 0 );
 end TEST3;
■
=SML
store_mt_results mt_run [
	("ns1x2_1_1d_gp", sl_format o get_parents, "TEST3'proc",
		"B, A, cn"),
	("ns1x2_1_1d_gc", sl_format o get_children, "TEST3'proc", ""),
	("ns1x2_1_1d_gc_cn", sl_format o get_children, "cn",
		"TEST3oTEST5'context, TEST3oTEST4'context, TEST3'proc, MDT507NS1X2_1_1oTEST1'context, MDT507NS1X2_1_1'body, TEST2'proc, MDT507NS1X2_1_1'spec, C, B, A"),
	("ns1x2_1_1d_gpcontext", sl_format o get_parents, "TEST3oTEST5'context",
		"B, A, cn"),
	("ns1x2_1_1d_gccontext", sl_format o get_children, "TEST3oTEST5'context", "")
];
=TEX
=SML
new_script1{name="TEST3.TEST4", unit_type="proc", library_theories=["C"]};
ⓈCN
 separate (TEST3)
    procedure TEST4 is begin VAR2 := 1; end TEST4;
■
=SML
store_mt_results mt_run [
	("ns1x2_1_1e_gp", sl_format o get_parents, "TEST3oTEST4'proc",
		"TEST3oTEST4'context, C, cn"),
	("ns1x2_1_1e_gc", sl_format o get_children, "TEST3oTEST4'proc", ""),
	("ns1x2_1_1e_gc_cn", sl_format o get_children, "cn",
"TEST3oTEST4'proc, TEST3oTEST5'context, TEST3oTEST4'context, TEST3'proc, MDT507NS1X2_1_1oTEST1'context, MDT507NS1X2_1_1'body, TEST2'proc, MDT507NS1X2_1_1'spec, C, B, A"),
	("ns1x2_1_1e_gpcontext", sl_format o get_parents, "TEST3oTEST4'context",
		"B, A, cn"),
	("ns1x2_1_1e_gccontext", sl_format o get_children, "TEST3oTEST4'context",
		"TEST3oTEST4'proc")
];
=TEX
=SML
new_script1{name="TEST3.TEST5", unit_type="func", library_theories=["C"]};
ⓈCN
 separate (TEST3)
    function TEST5 (I : INTEGER) return INTEGER is
    begin return 0; end TEST5;
■
=SML
store_mt_results mt_run [
	("ns1x2_1_1f_gp", sl_format o get_parents, "TEST3oTEST5'func",
		"TEST3oTEST5'context, C, cn"),
	("ns1x2_1_1f_gc", sl_format o get_children, "TEST3oTEST5'func", ""),
	("ns1x2_1_1f_gc_cn", sl_format o get_children, "cn",
"TEST3oTEST5'func, TEST3oTEST4'proc, TEST3oTEST5'context, TEST3oTEST4'context, TEST3'proc, MDT507NS1X2_1_1oTEST1'context, MDT507NS1X2_1_1'body, TEST2'proc, MDT507NS1X2_1_1'spec, C, B, A"),
	("ns1x2_1_1f_gpcontext", sl_format o get_parents, "TEST3oTEST5'context",
		"B, A, cn"),
	("ns1x2_1_1f_gccontext", sl_format o get_children, "TEST3oTEST5'context",
		"TEST3oTEST5'func")
];
=TEX
\subsection{Error Messages}
=IGN
new_error_message {id= 50742, text =
"Library theory ?0 cannot be made a parent of the script theory: ?1" };
=SML
clean_up();
store_mt_results mt_run_fail [
   ("ns1_fail_507042a", new_script1,
	{name="fail1", unit_type="proc", library_theories=["rubbish"]},
	 gen_fail_msg "new_script1" 507042
	 ["rubbish", "Theory rubbish is not present in the current hierarchy" ])
];
clean_up();
store_mt_results
mt_run_fail [
   ("ns1_fail_507042b", new_script1,
	{name="fail2", unit_type="proc", library_theories=["FAIL2'proc"]},
	 gen_fail_msg "new_script1" 507042
	 ["FAIL2'proc", "Suggested parent FAIL2'proc is a child of the current theory" ])
];
=TEX
\pagebreak
\section{CHECK 17}
This check concerns ensuring that a theory has not been used by a previous
compilation unit.
The compilation unit types are:
\begin{enumerate}
\item
Internal Form of Package Specification (*)
\item
Package Body (*)
\item
Subprogram (Function) (*)
\item
Subprogram (Procedure) (*)
\item
Subunit (*)
\item
External Form of Package Specification (i.e. prefixed)
\item
Stub theory
\end{enumerate}
Those annotated by ``(*)'' are placed in theories chosen by the user,
usually via $new\_script$.
Because of the iplementation approach if any combination of a compilation
unit with some other compilation unit demonstrates its correctness.
=SML
clean_up();
new_script{name="C17_1", unit_type="spec"};
ⓈCN
package c17_1 is
	VAR1 : INTEGER;
end c17_1;
■
=SML
fun c17_1_1 () =
ⓈCN
package c17_2 is
	VAR1 : INTEGER;
end c17_2;
■

=SML
store_mt_results mt_run_fail [
   ("c17_1_1", c17_1_1, (),
	 gen_fail_msg "check17" 507045
	 ["C17_2", "C17_1'spec","C17_1'spec"])
];
=TEX
=SML
clean_up();
new_script{name="C17_1", unit_type="spec"};
ⓈCN
package c17_1 is
	VAR1 : INTEGER;
end c17_1;
■
=SML
fun c17_1_2 () =
ⓈCN
package body c17_1 is
begin
	VAR1 := 2;
end c17_1;
■

=SML
store_mt_results mt_run_fail [
   ("c17_1_2", c17_1_2, (),
	 gen_fail_msg "check17" 507045
	 ["C17_1", "C17_1'spec","C17_1'spec"])
];
=TEX
=SML
clean_up();
new_script{name="C17_1", unit_type="spec"};
ⓈCN
package c17_1 is
	VAR1 : INTEGER;
end c17_1;
■
=SML
fun c17_1_3 () =
ⓈCN
  with c17_1;
  procedure c17_3
  is
  begin
       c17_1.VAR1 := 0;
  end c17_3;
■

=SML
store_mt_results mt_run_fail [
   ("c17_1_3", c17_1_3, (),
	 gen_fail_msg "check17" 507045
	 ["C17_3", "C17_1'spec","C17_1'spec"])
];
=TEX
=SML
clean_up();
new_script{name="C17_1", unit_type="spec"};
ⓈCN
package c17_1 is
	VAR1 : INTEGER;
end c17_1;
■
=SML
fun c17_1_4 () =
ⓈCN
    function c17_4 (I : INTEGER) return INTEGER is
    begin return 0; end c17_4;
■

=SML
store_mt_results mt_run_fail [
   ("c17_1_4", c17_1_4, (),
	 gen_fail_msg "check17" 507045
	 ["C17_4", "C17_1'spec","C17_1'spec"])
];
=TEX
=SML
clean_up();
new_script{name="C17_6", unit_type="proc"};
ⓈCN
  procedure c17_6
  is
	VAR1 : INTEGER;
	procedure c17_5 is separate;
  begin
       VAR1 := 0;
  end c17_6;
■
=SML
fun c17_1_5 () =
ⓈCN
 separate (c17_5)
    procedure c17_5 is begin VAR1 := 1; end c17_5;
■

=SML
store_mt_results mt_run_fail [
   ("c17_1_5", c17_1_5, (),
	 gen_fail_msg "check17" 507045
	 ["C17_5oC17_5", "C17_6'proc","C17_6'proc"])
];
=TEX
=SML
clean_up();
new_script{name="C17_6", unit_type="proc"};
ⓈCN
  procedure c17_6
  is
	VAR1 : INTEGER;
	procedure c17_5 is separate;
  begin
       VAR1 := 0;
  end c17_6;
■
=SML
open_theory "C17_6oC17_5'context";
fun c17_1_6 () =
ⓈCN
package c17_1 is
	VAR1 : INTEGER;
end c17_1;
■
=SML
store_mt_results mt_run_fail [
   ("c17_1_6", c17_1_6, (),
	 gen_fail_msg "check17" 507045
	 ["C17_1",
	  "C17_6oC17_5'context","C17_6oC17_5'context"])
];
=TEX
=SML
clean_up();
new_script{name="C17_1", unit_type="spec"};
ⓈCN
package c17_1 is
	VAR1 : INTEGER;
end c17_1;
■
=SML
new_script{name="C17_2", unit_type="spec"};

ⓈCN
with c17_1;
package c17_2 is
	VAR2 : INTEGER;
end c17_2;
■
=SML
fun c17_1_7 () =
ⓈCN
package body c17_1 is
begin
	VAR1 := 2;
end c17_1;
■

=SML
store_mt_results mt_run_fail [
   ("c17_1_7", c17_1_7, (),
	 gen_fail_msg "check17" 507045
	 ["C17_1", "C17_2'spec","C17_2'spec"])
];
=TEX
Now check that all the above combinations can be done properly.
=SML
clean_up();
new_script{name="C17_1", unit_type="spec"};
ⓈCN
package c17_1 is
	VAR1 : INTEGER;
end c17_1;
■
=SML
new_script{name="C17_2", unit_type="spec"};
fun c17_2_1 () =
ⓈCN
package c17_2 is
	VAR1 : INTEGER;
end c17_2;
■

=SML
store_mt_results mt_run [
   ("c17_2_1", c17_2_1, (),())
];
=TEX
=SML
clean_up();
new_script{name="C17_1", unit_type="spec"};
ⓈCN
package c17_1 is
	VAR1 : INTEGER;
end c17_1;
■
=SML
new_script{name="C17_1", unit_type="body"};
fun c17_2_2 () =
ⓈCN
package body c17_1 is
begin
	VAR1 := 2;
end c17_1;
■

=SML
store_mt_results mt_run [
   ("c17_2_2", c17_2_2, (),())
];
=TEX
=SML
clean_up();
new_script{name="C17_1", unit_type="spec"};
ⓈCN
package c17_1 is
	VAR1 : INTEGER;
end c17_1;
■
=SML
new_script{name="C17_3", unit_type="proc"};
fun c17_2_3 () =
ⓈCN
  with c17_1;
  procedure c17_3
  is
  begin
       c17_1.VAR1 := 0;
  end c17_3;
■

=SML
store_mt_results mt_run [
   ("c17_2_3", c17_2_3, (),())
];
=TEX
=SML
clean_up();
new_script{name="C17_1", unit_type="spec"};
ⓈCN
package c17_1 is
	VAR1 : INTEGER;
end c17_1;
■
=SML
new_script{name="C17_4", unit_type="func"};
fun c17_2_4 () =
ⓈCN
    function c17_4 (I : INTEGER) return INTEGER is
    begin return 0; end c17_4;
■

=SML
store_mt_results mt_run [
   ("c17_2_4", c17_2_4, (),())
];
=TEX
=SML
clean_up();
new_script{name="C17_6", unit_type="proc"};
ⓈCN
  procedure c17_6
  is
	VAR1 : INTEGER;
	procedure c17_5 is separate;
  begin
       VAR1 := 0;
  end c17_6;
■
=SML
new_script{name="C17_6.C17_5", unit_type="proc"};
fun c17_2_5 () =
ⓈCN
 separate (c17_6)
    procedure c17_5 is begin VAR1 := 1; end c17_5;
■

=SML
store_mt_results mt_run [
   ("c17_2_5", c17_2_5, (),())
];
=TEX
=SML
clean_up();
new_script{name="C17_6", unit_type="proc"};
ⓈCN
  procedure c17_6
  is
	VAR1 : INTEGER;
	procedure c17_5 is separate;
  begin
       VAR1 := 0;
  end c17_6;
■
=SML
new_script{name="C17_1", unit_type="spec"};
fun c17_2_6 () =
ⓈCN
package c17_1 is
	VAR1 : INTEGER;
end c17_1;
■
=SML
store_mt_results mt_run [
   ("c17_2_6", c17_2_6, (),())
];
=TEX
=SML
clean_up();
new_script{name="C17_1", unit_type="spec"};
ⓈCN
package c17_1 is
	VAR1 : INTEGER;
end c17_1;
■
=SML
new_script{name="C17_2", unit_type="spec"};

ⓈCN
with c17_1;
package c17_2 is
	VAR2 : INTEGER;
end c17_2;
■
=SML
new_script{name="C17_1", unit_type="body"};
fun c17_2_7 () =
ⓈCN
package body c17_1 is
begin
	VAR1 := 2;
end c17_1;
■

=SML
store_mt_results mt_run [
   ("c17_2_7", c17_2_7, (),())
];
=TEX
\section{FUNCTIONS IN PACKAGE SPECIFICATION}
A function declared in a package specification is now allowed to be mentioned in the
Z specification of another function in the same package (enhancement 117).
=SML
clean_up();
new_script{name = "P", unit_type="spec"};
ⓈCN
package P is
  function F (X : INTEGER) return INTEGER
  Ξ  [PoF(X) = 2*X];
  function G(X:INTEGER) return INTEGER
  Ξ  [PoG(X) = 3*PoF(X)]	;
end P;
■
=SML
store_mt_results (mt_runf (op =$)) [
   ("fun_pack_spec.1", z_type_of, ⓩPoG⌝, ⓩℤ ↔ ℤ⌝)
];
=TEX
\section{Renaming in Package Specifications}
=SML
clean_up();
new_script{name = "P", unit_type="spec"};
ⓈCN
package P is
  VAR1 : INTEGER;
  function F (X : INTEGER) return INTEGER
  Ξ  [PoF(X) = 2*X];
  procedure TEST1 (M : out INTEGER)
  Δ M Ξ PoVAR1 [M = PoVAR1];

end P;
■
=SML
new_script{name = "Q", unit_type="spec"};
ⓈCN
with P;
package Q is
	VAR2 : INTEGER;
	function G  (X : INTEGER) return INTEGER renames P.F;
	procedure TEST2 (M : out INTEGER) renames P.TEST1;
end Q;
■
=SML
new_script{name = "Q", unit_type="body"};
ⓈCN
$references P;
package body Q is
	procedure TEST2 (M : out INTEGER) renames P.TEST1;
begin
	Δ QoVAR2 [PoVAR1 = 0, QoVAR2 = 0] (1)
end Q;
■
=SML
ⓈCN
(1) ⊑ TEST2(VAR2);
   VAR2 := G(VAR2);
■
=SML
new_script{name = "R", unit_type="spec"};
ⓈCN
with Q;
package R is
	VAR3 : INTEGER;
end R;
■
=SML
new_script{name = "R", unit_type="body"};
ⓈCN
with P, Q;
package body R is
begin
	Δ RoVAR3 [PoVAR1 = 0, RoVAR3 = 0] (2)
end R;
■
ⓈCN
(2) ⊑ Q.TEST2(VAR3);
■
=TEX
=SML
set_pc "cn";
set_goal([], get_conjecture "-" "vc2_2");
a(REPEAT strip_tac);
a(all_var_elim_asm_tac1);
a(strip_tac);
store_mt_results (mt_runf (op =$)) [
	("rename_3", concl o pop_thm, (),
		get_conjecture "-" "vc2_2")
];
=TEX

Now demonstrate that need the renaming in the specification
to get the renamed procedure used in a future ``with'' clause.
=SML
clean_up();
new_script{name = "P", unit_type="spec"};
ⓈCN
package P is
  VAR1 : INTEGER;
  function F (X : INTEGER) return INTEGER
  Ξ  [PoF(X) = 2*X];
  procedure TEST1 (M : out INTEGER)
  Δ M Ξ PoVAR1 [M = PoVAR1];

end P;
■
=SML
new_script{name = "Q1", unit_type="spec"};
ⓈCN
with P;
package Q1 is
	VAR2 : INTEGER;
end Q1;
■
=SML
new_script{name = "Q1", unit_type="body"};
ⓈCN
$references P;
package body Q1 is
	procedure TEST2 (M : out INTEGER) renames P.TEST1;
	function G  (X : INTEGER) return INTEGER renames P.F;
begin
	Δ Q1oVAR2 [PoVAR1 = 0, Q1oVAR2 = 0] (1)
end Q1;
■
ⓈCN
(1) ⊑ TEST2(VAR2);
   VAR2 := G(VAR2);
■
=SML
new_script{name = "R", unit_type="spec"};
ⓈCN
with P, Q1;
package R is
	VAR3 : INTEGER;
end R;
■
=SML
new_script{name = "R", unit_type="body"};
ⓈCN
with P, Q1;
package body R is
begin
	Δ RoVAR3 [PoVAR1 = 0, RoVAR3 = 0] (3)
end R;
■
=SML
fun rename1_1 () =
ⓈCN
(3) ⊑ Q1.TEST2(VAR3);
■
=SML
store_mt_results mt_run_fail [
   ("rename1_1", rename1_1, (),
	 gen_fail_msg "check_1_d" 505063 ["Q1oTEST2"])
];
=TEX

Now with renamed items having no formal parts.
=SML
clean_up();
new_script{name = "P", unit_type="spec"};
ⓈCN
package P is
  VAR1 : INTEGER;
  function F (X : INTEGER) return INTEGER
  Ξ  [PoF(X) = 2*X];
  procedure TEST1 (M : out INTEGER)
  Δ M Ξ PoVAR1 [M = PoVAR1];

end P;
■
=SML
new_script{name = "Q", unit_type="spec"};
ⓈCN
with P;
package Q is
	VAR2 : INTEGER;
	function G (Y : INTEGER) return INTEGER renames P.F;
	procedure TEST2(X : out INTEGER)  renames P.TEST1;
end Q;
■
=SML
new_script{name = "Q", unit_type="body"};
ⓈCN
$references P;
package body Q is
	procedure TEST2 (M : out INTEGER) renames P.TEST1;
begin
	Δ QoVAR2 [PoVAR1 = 0, QoVAR2 = 0] (1)
end Q;
■
=SML
ⓈCN
(1) ⊑ TEST2(VAR2);
   VAR2 := G(VAR2);
■
=SML
set_pc "cn";
set_goal([], get_conjecture "-" "vc1_2");
a(REPEAT strip_tac);
a(ALL_FC_T rewrite_tac[z_get_spec ⓩPoF⌝]);
a(asm_rewrite_tac[]);
store_mt_results (mt_runf (op =$)) [
	("rename_2", concl o pop_thm, (),
		get_conjecture "-" "vc1_2")
];
=TEX
\section{Immediate Checking of Package Specifications}
=SML
clean_up();
new_script{name="F", unit_type="spec"};
fun immed1() =
ⓈCN
package F is
V : INTEGER;
procedure P1 (X: in INTEGER; Y: out INTEGER; Z: in out INTEGER)
 Δ Y [ X > Z , Y > Z + FoV ];
end F;
■
=SML
fun immed2() =
ⓈCN
package F is
procedure P1 (X: in INTEGER; Y: out INTEGER; Z: in out INTEGER)
 Δ Y [ X > Z + FoV, Y > Z];
end F;
■
=SML
fun immed1a() =
ⓈCN
package F is
V1, V2 : INTEGER;
procedure P1 (X: in INTEGER; Y: out INTEGER; Z: in out INTEGER)
 Δ Y [ X > Z , Y > Z + FoV1 + FoV2 ];
end F;
■
=SML
fun immed2a() =
ⓈCN
package F is
procedure P1 (X: in INTEGER; Y: out INTEGER; Z: in out INTEGER)
 Δ Y [ X > Z + FoV1 + FoV2, Y > Z];
end F;
■
=TEX
=SML
store_mt_results
mt_run_fail [
   ("immed1", immed1, (),
	 gen_fail_msg "term_of_vcs" 507123[]),
   ("immed2", immed2, (),
	 gen_fail_msg "z_predexp_of_z_tm" 508019 []),
   ("immed1a", immed1a, (),
	 gen_fail_msg "term_of_vcs" 507123 []),
   ("immed2a", immed2a, (),
	 gen_fail_msg "z_predexp_of_z_tm" 508019 [])
];
=TEX
=SML
fun immed3() =
ⓈCN
package F is
procedure P1 (X: in RUBBISH; Y: out INTEGER; Z: in out INTEGER)
 Δ Y [ Y > Z , Y > Z + FoV ];
end F;
■
=SML
store_mt_results_show mt_run_fail [
   ("immed3", immed3, (),
	 gen_fail_msg "type_of_tmark" 507127  ["RUBBISH"])
];
=TEX
=SML
fun immed4() =
ⓈCN
package F is
function F1 (X: in INTEGER; Y: in INTEGER; Z: in INTEGER) return INTEGER
 Ξ [ X > Z , FoF1 Y (X, Y, Z) > FoV ];
end F;
■
=SML
fun immed5() =
ⓈCN
package F is
function F1 (X: in INTEGER; Y: in INTEGER; Z: in INTEGER) return INTEGER
 Ξ [ X > FoV + Z , FoF1 Y (X, Y, Z) > X ];
end F;
■
=SML
store_mt_results_show mt_run_fail [
   ("immed4", immed4, (),
	 gen_fail_msg "z_predexp_of_z_tm" 508019 []),
   ("immed5", immed5, (),
	 gen_fail_msg "z_predexp_of_z_tm" 508019 [])
];
=TEX
=SML
fun immed6() =
ⓈCN
package F is
function F1 (X: in RUBBISH; Y: out INTEGER; Z: in out INTEGER) return INTEGER
 Ξ Y [ Y > Z , FoF1(X, Y, Z) > X ];
end F;
■
=SML
store_mt_results_show mt_run_fail [
   ("immed6", immed6, (),
	 gen_fail_msg "type_of_tmark" 507127  ["RUBBISH"])
];
=TEX
=SML
fun immed7() =
ⓈCN
package F is
function F1 (X: in INTEGER; Y: out INTEGER; Z: in out INTEGER) return INTEGER
 Ξ [ Y > Z , FoF1 (X, Y) > X ];
end F;
■
=SML
store_mt_results_show mt_run_fail [
   ("immed7", immed7, (), gen_fail_msg "z_predexp_of_z_tm" 508019 [])
];
=TEX
=SML
fun immed8() =
ⓈCN
package F is
procedure P1 (X: in INTEGER; Y: out INTEGER; Z: in out INTEGER)
 Δ Y [ Y + Z , Y > Z + FoV ];
end F;
■
=SML
store_mt_results_show mt_run_fail [
   ("immed8", immed8, (),
	 gen_fail_msg "z_predexp_of_z_tm" 508019 [])
];
=TEX
=SML
fun immed9() =
ⓈCN
package F is
function F1 (X: in INTEGER; Y: out INTEGER; Z: in out INTEGER) return INTEGER
 Ξ [ Y + Z , FoF1(X, Y, Z) > X ];
end F;
■
=SML
store_mt_results_show mt_run_fail [
   ("immed9", immed9, (), gen_fail_msg "z_predexp_of_z_tm" 508019 [])
];
=TEX
\section{Clashes between Formal Parameters and Others}
=SML
clean_up();
new_script{name="F", unit_type="spec"};
ⓈCN
package F is
X : INTEGER;
function F1 (X: in INTEGER; Y: out INTEGER; Z: in out INTEGER) return INTEGER
 Ξ [ X > Z , FoF1(X, Y, Z) > X ];
end F;
■
=SML
new_script{name="G", unit_type="spec"};
ⓈCN
package G is
X : INTEGER;
procedure P2 (X: in INTEGER; Y: out INTEGER; Z: in out INTEGER)
 Δ Y [ X > Z, Y > Z];
end G;
■
=SML
new_script{name="F1", unit_type="spec"};
fun fp_clash1 () =
ⓈCN
with F;
package F1 is
Y : INTEGER;
end F1;
■
=SML
fun fp_clash2 () =
ⓈCN
with G;
package G1 is
Y : INTEGER;
end G1;
■
=SML
(* 117-TBA - do we still need this??

store_mt_results_show mt_run_fail [
   ("fp_clash1", fp_clash1, (), gen_fail_msg "z_prefix" 507055
	["X", "F"]),
   ("fp_clash2", fp_clash2, (), gen_fail_msg "z_prefix" 507055
	["X", "G"])
];
*)

=TEX
\section{REFERENCES CLAUSES}
\subsection{Only ``references''}
=SML
clean_up();
new_script{name="MARK_F", unit_type="spec"};
ⓈCN
package MARK_F is
FX : INTEGER;
FY : constant INTEGER := 1;
end MARK_F;
■
=SML
new_script{name="MARK_G", unit_type="spec"};
ⓈCN
package MARK_G is
GX : INTEGER;
GY : constant INTEGER := 2;
end MARK_G;
■
=SML
new_script{name="H", unit_type="spec"};
ⓈCN
$references MARK_F, MARK_G;
package H is
procedure P(X : in out INTEGER)
 Δ X Ξ MARK_FoFX, MARK_GoGX[ X > MARK_FoFX + MARK_GoGY ,
	X > MARK_FoFY + MARK_GoGX ];
end H;
■
=TEX
Do the right theories exist, and have the right sort of constants:
=SML
store_mt_results_show mt_run [
   ("refer1.1", get_const_theory, "z'MARK_FoFY", "MARK_F'spec"),
   ("refer1.2", get_const_theory, "z'MARK_GoGY", "MARK_G'spec")
];
output_ada_program{script="-", out_file= "mdt507_refer1.ada"};
val _ = ExtendedIO.system "grep MARK_ mdt507_refer1.ada > mdt507.grep";
val is = open_in "mdt507.grep";
store_mt_results_show mt_run [
	("refer1.3", ExtendedIO.input_line, is, "")
];
val _ = close_in is;
=TEX

\subsection{Mix of ``with'' and ``references''}
=SML
clean_up();
new_script{name="MARK_F", unit_type="spec"};
ⓈCN
package MARK_F is
FX : INTEGER;
FY : constant INTEGER := 1;
end MARK_F;
■
=SML
new_script{name="MARK_G", unit_type="spec"};
ⓈCN
package MARK_G is
GX : INTEGER;
GY : constant INTEGER := 2;
end MARK_G;
■
=SML
new_script{name="I", unit_type="spec"};
ⓈCN
with MARK_F;
$references MARK_G;
package I is
procedure P(X : in out INTEGER)
 Δ X Ξ MARK_FoFX, MARK_GoGX [ X > MARK_FoFX + MARK_GoGY ,
	X > MARK_FoFY + MARK_GoGX ];
end I;
■
=TEX
=SML
output_ada_program{script="-", out_file= "mdt507_refer3.ada"};
val _ = ExtendedIO.system "grep MARK_ mdt507_refer3.ada > mdt507.grep";
val is = open_in "mdt507.grep";
store_mt_results_show mt_run [
	("refer1.5", ExtendedIO.input_line, is, "WITH MARK_F;\n")
];
val _ = close_in is;
=SML
new_script{name="I", unit_type="body"};
=TEX
The references below is required to bring the variables
$MARK_FoFX$ and $MARK_GoGX$ into scope (the reference clause of the package specification
only brings constants, types and functions into scope).
ⓈCN
$references MARK_F, MARK_G;
package body I is
procedure P(X : in out INTEGER)
 Δ X Ξ MARK_FoFX, MARK_GoGX[ X > MARK_FoFX + MARK_GoGY ,
	X > MARK_FoFY + MARK_GoGX ] is
   begin
	X := X + 10;
   end P;
end I;
■
=SML
output_ada_program{script="-", out_file= "mdt507_refer4.ada"};
val _ = ExtendedIO.system "grep MARK_ mdt507_refer4.ada > mdt507.grep";
val is = open_in "mdt507.grep";
store_mt_results_show mt_run [
	("refer1.6", ExtendedIO.input_line, is, "")
];
val _ = close_in is;
=TEX
\subsection{Only ``with''}
=SML
clean_up();
new_script{name="MARK_F", unit_type="spec"};
ⓈCN
package MARK_F is
FX : INTEGER;
FY : constant INTEGER := 1;
end MARK_F;
■
=SML
new_script{name="MARK_G", unit_type="spec"};
ⓈCN
package MARK_G is
GX : INTEGER;
GY : constant INTEGER := 2;
end MARK_G;
■
=SML
new_script{name="J", unit_type="spec"};
ⓈCN
with MARK_F, MARK_G;
package J is
procedure P(X : in out INTEGER)
 Δ X Ξ MARK_FoFX, MARK_GoGX[ X > MARK_FoFX + MARK_GoGY ,
	X > MARK_FoFY + MARK_GoGX ];
end J;
■
=TEX
=SML
output_ada_program{script="-", out_file= "mdt507_refer5.ada"};
val _ = ExtendedIO.system "grep MARK_ mdt507_refer5.ada > mdt507.grep";
val is = open_in "mdt507.grep";
store_mt_results_show mt_run [
	("refer1.7", ExtendedIO.input_line, is, "WITH MARK_F, MARK_G;\n")
];
val _ = close_in is;
=SML
new_script{name="J", unit_type="body"};
=TEX
The references below is required to bring the variables
$MARK_FoFX$ and $MARK_GoGX$ into scope (the reference clause of the package specification
only brings constants, types and functions into scope).
ⓈCN
$references MARK_F, MARK_G;
package body J is
procedure P(X : in out INTEGER)
 Δ X Ξ MARK_FoFX, MARK_GoGX[ X > MARK_FoFX + MARK_GoGY ,
	X > MARK_FoFY + MARK_GoGX ] is
   begin
	X := X + 10;
   end P;
end J;
■
=SML
output_ada_program{script="-", out_file= "mdt507_refer6.ada"};
val _ = ExtendedIO.system "grep MARK_ mdt507_refer6.ada > mdt507.grep";
val is = open_in "mdt507.grep";
store_mt_results_show mt_run [
	("refer1.10", ExtendedIO.input_line, is, "")
];
val _ = close_in is;
=TEX
\subsection{Duplicate names}
=SML
clean_up();
new_script{name="MARK_F", unit_type="spec"};
ⓈCN
package MARK_F is
FX : INTEGER;
FY : constant INTEGER := 1;
end MARK_F;
■
=SML
new_script{name="MARK_G", unit_type="spec"};
ⓈCN
package MARK_G is
GX : INTEGER;
GY : constant INTEGER := 2;
end MARK_G;
■
=SML
new_script{name="K", unit_type="spec"};
ⓈCN
$references MARK_F, MARK_G, MARK_F;
package K is
X : INTEGER;
end K;
■
=SML
store_mt_results_show
mt_run [
   ("refer2.1", get_parents, "K'spec", ["MARK_G'spec", "MARK_F'spec", "cn"])
];
new_script{name="L", unit_type="spec"};
ⓈCN
with MARK_F;
$references MARK_G, MARK_F;
package L is
X : INTEGER;
end L;
■
=SML
store_mt_results_show mt_run [
   ("refer3.1", get_parents, "L'spec", ["MARK_G'spec", "MARK_F'spec", "cn"])
];
=TEX
\subsection{Failure Conditions}
=SML
fun refer12() =
ⓈCN
$references MARK_F, RUBBISH, MARK_G;
package K is
X : INTEGER;
end K;
■
=SML
store_mt_results_show mt_run_fail [
   ("refer12.1", refer12, (), gen_fail_msg "context_clause_check"
	 507038 ["RUBBISH"])
];
=TEX
\section{WP 5 Checks}
=SML
clean_up();
new_script{name="BASIC", unit_type="spec"};
=TEX
ⓈCN
package BASIC
is
  type INDEX is range 1 .. 10;
  $auxiliary FLAGS : ℙ (1..10);
  procedure SET (I : in INDEX)
  Δ FLAGS [ FLAGS = FLAGS⋎0 ∪ {I} ] ;
end BASIC;
■
=SML
new_script{name="DERIVED", unit_type="spec"};
=TEX
ⓈCN
with BASIC;
package DERIVED
is
  procedure SET_ALL
  Δ FLAGS
  [ FLAGS = BASICoINDEX ] ;
end DERIVED;
■
=SML
new_script{name="MAIN", unit_type="proc"};
=TEX
ⓈCN
with BASIC;
procedure MAIN
Δ FLAGS
[ FLAGS = BASICoINDEX ]
is
begin
  for I in BASIC.INDEX
  loop
    Δ FLAGS
    [ 1.. I-1 ⊆ FLAGS,
      1 .. I ⊆ FLAGS ]
  end loop;
end MAIN;
■
ⓈCN
 ⊑
    BASIC.SET(I);
■
=SML
new_script{name="DERIVED", unit_type="body"};

fun wp5_test1 () =
ⓈCN
with BASIC;
package body DERIVED
is
  procedure SET_ALL
  Δ FLAGS
  [ FLAGS = BASICoINDEX ]
  is
  begin
    Δ FLAGS
    [ FLAGS = BASICoINDEX ]
  end SET_ALL;
end DERIVED;
■
We are only interested in success, so:
=SML
store_mt_results_show mt_run [
	("wp5_test1", wp5_test1, (), ())
];
=TEX
=SML
clean_up();
new_script{name="A", unit_type="spec"};
=TEX
ⓈCN
package A is
    V : INTEGER;
end A;
■
=SML
new_script{name="B", unit_type="spec"};
=TEX
ⓈCN
with A;
package B is
    procedure INIT
    Δ AoV [AoV = 0];
end B;
■
=SML
new_script{name="B", unit_type="body"};
=TEX
=SML
fun wp5_test2 () =
ⓈCN
with A;
package body B is
    procedure INIT
    Δ AoV [AoV = 0]
    is
    begin
        A.V := 0;
    end INIT;
end B;
■
We are only interested in success, so:
=SML
store_mt_results_show mt_run [
	("wp5_test2", wp5_test2, (), ())
];
=TEX
\section{Definitions with or without Axiomatic Mode}
=SML
clean_up();
new_script{name= "P", unit_type="spec"};
val orig_z_use_axioms = set_flag("z_use_axioms", false);
ⓈZAX
│ f : ℤ → ℤ
├──────
│ f 0 = 1
■
ⓈZAX
│ g,h : ℤ → ℤ
├──────
│ g 0 = 1 ∧ h 0 = 2
■
╒[ Y ]═══════════
│ j : Y → Y
├──────
│ ∃ x : Y ⦁ j x = x
└──────────────
ⓈZAX
│ k : ℤ → ℤ
■
╒[ Y ]═══════════
│ l : Y → Y
└──────────────
=SML
set_flag("z_use_axioms", true);
ⓈZAX
│ f1 : ℤ → ℤ
├──────
│ f1 0 = 1
■
ⓈZAX
│ g1,h1 : ℤ → ℤ
├──────
│ g1 0 = 1 ∧ h1 0 = 2
■
╒[ Y ]═══════════
│ j1 : Y → Y
├──────
│ ∃ x : Y ⦁ j1 x = x
└──────────────
ⓈZAX
│ k1 : ℤ → ℤ
■
╒[ Y ]═══════════
│ l1 : Y → Y
└──────────────

ⓈCN
package P is
X : INTEGER;
end P;
■
=SML

store_mt_results mt_run [("mdt507_axiom_1.output",
	output_z_document,
	{out_file="mdt507_axiom_temp1.zdoc", script="-"}, ())];
val temp1_consts = map (fst o dest_const) (get_consts "-");

new_script{name="Q", unit_type="spec"};
ⓈCN
with P;
package Q is
Y : INTEGER;
end Q;
■
=SML
store_mt_results mt_run [("mdt507_axiom_2.output",
	output_z_document,
	{out_file="mdt507_axiom_temp2.zdoc", script="-"},
	())];
val temp2_consts = map (fst o dest_const) (get_consts "Q'spec");
val Pspec_consts = map (fst o dest_const) (get_consts "P'spec");
=TEX
Now to read these back in:
=SML
clean_up();
store_mt_results mt_run [("mdt507_axiom_1.1",
	use_file, "mdt507_axiom_temp1.zdoc", ())];
store_mt_results_show (mt_runf (op ~=)) [("mdt507_axiom_1.2",
	map (fst o dest_const), (get_consts "P'spec"), temp1_consts)];
store_mt_results mt_run [("mdt507_axiom_2.1",
	use_file, "mdt507_axiom_temp2.zdoc", ())];
store_mt_results_show (mt_runf (op ~=)) [("mdt507_axiom_2.2",
	map (fst o dest_const), (get_consts "Q'spec"), temp2_consts)];
set_flag ("z_use_axioms",orig_z_use_axioms);
=TEX
\section{Tests of References}
=SML
clean_up();
new_script{name="REF1", unit_type="spec"};
ⓈCN
package REF1 is
function F1 return INTEGER
Ξ [ REF1oF1 = 1 ];
end REF1;
■
=SML
new_script{name="REF2", unit_type="spec"};
ⓈCN
$references REF1;
package REF2 is
function F2 return INTEGER
Ξ [ REF2oF2 = REF1oF1 ];
end REF2;
■
=SML
new_script{name="REF3", unit_type="spec"};
fun ref_test1 () =
ⓈCN
$references REF2;
package REF3 is
function F3 return INTEGER
Ξ [ REF3oF3 = REF2oF2 ];
end REF3;
■
=SML
store_mt_results mt_run[("ref_test1",ref_test1, (), ())];
=TEX
Now repeat the test, but use a ``with''.
=SML
clean_up();
new_script{name="REF1", unit_type="spec"};
ⓈCN
package REF1 is
function F1 return INTEGER
Ξ [ REF1oF1 = 1 ];
end REF1;
■
=SML
new_script{name="REF2", unit_type="spec"};
ⓈCN
with REF1;
package REF2 is
function F2 return INTEGER
Ξ [ REF2oF2 = REF1oF1 ];
end REF2;
■
=SML
new_script{name="REF3", unit_type="spec"};
fun ref_test2 () =
ⓈCN
$references REF2;
package REF3 is
function F3 return INTEGER
Ξ [ REF3oF3 = REF2oF2 ];
end REF3;
■
=SML
store_mt_results mt_run[("ref_test2",ref_test2, (), ())];
=TEX
Now using library theories:
=SML
clean_up();
new_script{name="REF1", unit_type="spec"};
ⓈCN
package REF1 is
function F1 return INTEGER
Ξ [ REF1oF1 = 1 ];
end REF1;
■
=SML
new_script{name="DUMMY", unit_type="spec"};
ⓈCN
with REF1;
package DUMMY is
X: INTEGER;
end DUMMY;
■
=SML
new_script1{name="REF2", unit_type="spec", library_theories = ["REF1'spec"]};
ⓈCN
package REF2 is
function F2 return INTEGER
Ξ [ REF2oF2 = REF1oF1 ];
end REF2;
■
=SML
new_script{name="REF3", unit_type="spec"};
fun ref_test3 () =
ⓈCN
$references REF2;
package REF3 is
function F3 return INTEGER
Ξ [ REF3oF3 = REF2oF2 ];
end REF3;
■
=SML
store_mt_results mt_run[("ref_test3",ref_test3, (), ())];
=TEX
=SML
clean_up();
new_theory "temp";
new_script{name="REF1", unit_type="spec"};
ⓈCN
package REF1 is
function F1 return INTEGER
Ξ [ REF1oF1 = 1 ];
end REF1;
■
=SML
new_script1{name="REF2", unit_type="spec", library_theories = ["temp"]};
ⓈCN
with REF1;
package REF2 is
function F2 return INTEGER
Ξ [ REF2oF2 = REF1oF1 ];
end REF2;
■
=SML
fun ref_test4 () = "temp" mem get_parents  "REF2'spec";
store_mt_results_show mt_run[("ref_test4",ref_test4, (), true)];
val _ = ExtendedIO.system "rm mdt507.grep";
=TEX
\section{SUMMARY OF RESULTS}
=SML
diag_string(summarize_mt_results());
=TEX

\end{document}

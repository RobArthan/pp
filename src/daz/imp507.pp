=IGN
********************************************************************************
imp507.doc: this file is part of the PPDaz system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% imp507.doc ℤ $Revision: 1.359 $ $RCSfile: imp507.doc,v $ $Date: 2009/11/25 17:11:33 $
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

\def\Title{Implementation: Z Generator}

\def\AbstractText{This document contains the implementation for the Z generation functions of Volume 1 of DRA's specification.}

\def\Reference{ISS/HAT/DAZ/IMP507}

\def\Author{D.J. King }


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
%% LaTeX2e port: \TPPtitle{Implementation: Z Generator}  %% Mandatory field
%% LaTeX2e port: \TPPref{ISS/HAT/DAZ/IMP507}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.359 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2009/11/25 17:11:33 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{D.J.~King & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{D.J.~King & DAZ Team Leader}
%% LaTeX2e port: \raggedright{\TPPabstract{This document contains the implementation for the Z generation functions of Volume 1 of DRA's specification.}}
%% LaTeX2e port: %\TPPabstractB{}
%% LaTeX2e port: %\TPPabstractC{}
%% LaTeX2e port: %\TPPabstractD{}
%% LaTeX2e port: %\TPPabstractE{}
%% LaTeX2e port: %\TPPabstractF{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	Library}}
%% LaTeX2e port: 
%% LaTeX2e port: %\TPPclass{CLASSIFICATION}
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
\subsection{Document Cross References}
\bibliographystyle{fmu}
\bibliography{fmu,daz}

\subsection{Changes History}  % to get section number `0.3'
\begin{description}

\item[Issues 1.1 (1994/03/24)-1.55 (1994/11/09) ] Initial Drafts.
\item[Issues 1.56 (1994/11/09)] First cut with code for auxiliary variables in the environments.
\item[Issue 1.57 (1994/11/09)] Corrected sequencing for some of the auxiliary variable SID functions.
\item[Issue 1.58 (1994/11/10)] Debugged auxiliary variable code.
\item[Issues 1.59 (1994/11/11)-1.61 (1994/11/15)] Updates for integration with VC browser.
\item[Issues 1.62 (1994/11/15)-1.87 (1995/04/05)] Various bug fixes
\item[Issues 1.87 (1995/04/05)-1.89 (1995/10/04)] Annotations and pragmas (enhancements 1 and 20)
\item[Issue 1.90 (1995/10/10)] Enhancements 5 and 7 plus fix of bug 17 (batch 2).
\item[Issue 1.91 (1995/10/11)] Enhancements 10.
\item[Issue 1.92 (1995/10/14)] Fixed bug 3 (batch 2).
\item[Issue 1.93 (1995/10/17)-1.94 (1995/10/17)] Fixed bug 4 (batch 2) and made $new\_parent\_aux$ less plaintive.
\item[Issue 1.95 (1995/10/17)] Fixed bugs 10 and 11 (batch 2).
\item[Issue 1.96 (1995/10/18)] Fixed bug 18 (batch 2).
\item[Issue 1.97 (1995/10/19)] Enhancement 13.
\item[Issue 1.98 (1995/10/19)-1.103 (1995/11/09)] Bug-fixing of enhancements.
\item[Issues 1.104 (1995/12/01),1.105 (1995/12/01)] Enhancements 3 and 18 (and a fairly major rework of the funcitons which support $new\_scope\_with$).
\item[Issues 1.106 (1995/12/05),1.107 (1995/12/07)] Tidy-up
\item[Issues 1.108 (1995/12/14)] fix to $form\_proc\_pack\_body\_common$.
\item[Issue 1.109 (1996/02/12)] made it include auxiliary variables in the type inference context.
\item[Issues 1.110 (1996/02/13)-1.113 (1996/02/14)] fixing context handling in $form\_proc$ $till\_pred$ etc.
\item[Issue 1.114 (1996/02/15)] bug 6 (V0.6).
\item[Issue 1.115 (1996/02/16)] Fixed omitted prefixing of parameter specifications (revealed by fixing bug 4 (V0.6) and running the integration tests (INT508).
Also implemented remedies for issues 1 and 4 (V0.6).
\item[Issue 1.116 (1996/02/26)] Fixed wrong error message in $do\_stmt$..
\item[Issue 1.117 (1996/07/15)] Syntax changes.
\item[Issue 1.118 (1996/07/17)] Fixed bug 2 (V0.7).
\item[Issue 1.119 (1997/04/11)] Correcting IUCT project WP8, bug 1.
\item[Issue 1.120 (1997/04/11)-1.121 (1997/04/14)] Added $new\_script1$ for IUCT project WP 1.
\item[Issue 1.122 (1997/04/16)] Fixing Bug 4.3 of INT502.
\item[Issue 1.123 (1997/05/01)] Fixing bug 6.1 of INT502.
\item[Issue 1.124 (1997/05/13)] Fixing $is\_id\_in\_package$.
\item[Issue 1.125 (1997/05/19)-126] Improved prefixing functions.
\item[Issue 1.127 (1997/05/29)-1.128 (1997/05/30)] IUCT WP7 changes.
\item[Issue 1.129 (1997/06/03) - 1.130 (1997/06/04)] Changes for IUCT WP 2.
\item[Issue 1.131 (1997/06/05)-1.132 (1997/06/09)] Further IUCT WP7 changes.
\item[Issue 1.133 (1997/06/10)] Fixing prefixing bugs.
\item[Issue 1.134 (1997/06/11)] Type checking procedures and functions at declaration.
\item[Issue 1.135 (1997/06/12)] Prefixing paramater specifications.
\item[Issue 1.136 (1997/06/17)-137] IUCT WP 3 changes and further use of update functions.
\item[Issue 1.138 (1997/06/18)] IUCT WP 5 changes and further use of update functions.
\item[Issue 1.139 (1997/06/20)] Improved handling of prefixing Z paragraphs.
\item[Issue 1.141 (1997/06/30)] References clauses package names must now be present, else a
failure (not comment) is raised).
\item[Issue 1.143 (1997/07/01)] Changed format of warning VC.
\item[Issue 1.144 (1997/07/04)] Corrected bug in prefixing of functions.
\item[Issue 1.145 (1997/07/09)] Typos affecting LaTeX only.
\item[Issue 1.146 (1997/07/15)-1.150 (1997/07/24)] Changes for IUCT WP 4 (and final removal
of $pack\_spec\_with\_modules$ for WP 3).
\item[Issue 1.151 (1997/07/31)] Fixed bug in $vcs\_aux\_initial$.
\item[Issue 1.152 (1997/08/04)] Addressing frame widening issue (issue 4, v0.7.3).
\item[Issue 1.153 (1997/08/06)] Adding calls to do check 16.
\item[Issue 1.154 (1997/08/12)] Included check 16 calls for specification statements as statements (to catch cases where formality has been broken).
\item[Issue 1.155 (1997/08/19)] Typo revealed by LaTeX.
\item[Issue 1.155 (1997/08/19)] Prototyping enhancement R5: Initial Variables in Conditionals.
\item[Issue 1.156 (2000/05/24)-1.160 (2000/06/16)] Prototyping enhancement R4: Frame Abbreviations.
\item[Issue 1.161 (2000/06/21)] Improving error-detection for specification statements: dummy
calls on the VC generator are made whenever a specification statement is processed
in a context where VC generation is not carried out immediately. This makes sure
that the checks on free variables etc. are made.
\item[Issue 1.162 (2000/06/24),1.163 (2000/06/24)] Fixed {\it is\_id\_in\_package} and many other related fixes
including a major rewrite of {\it store\_prefix\_const\_thms} to remove a flaw
in its treatment of generics. Improved approach to early checking of specification
statements in stubs.
\item[Issue 1.164 (2000/07/01)] Fixed {\it vcs\_speclabel\_aux}.
\item[Issue 1.165 (2000/07/05)] Fixed {\LaTeX} error.
\item[Issue 1.166 (2000/10/17)] CTLE II R1/2: reverse loops.
\item[Issue 1.167 (2000/10/17)] CTLE II R1/10: multiple with clauses (causes a minor change to syntax).
\item[Issue 1.168 (2000/10/24)] CTLE II R1/9: SPARK 83 attributes.
\item[Issues 1.169 (2000/10/25),1.170 (2000/10/26)] CTLE II R2/1: global variable unsoundness.
\item[Issue 1.171 (2000/10/26),1.172 (2000/10/27)] CTLE II R1/11: nested packages.
\item[Issue 1.173 (2001/05/28)] Perfomance enhancement for type-checking of specification statements.
\item[Issue 1.174 (2001/07/06)] R0021: domain condition generation.
\item[Issue 1.175 (2001/11/10)] Schema references now accepted in global dependencies of a function.
\item[Issue 1.176 (2001/11/26)] R0037: support for named numbers.
\item[Issue 1.177 (2001/12/15)-1.183 (2002/01/30)] Further work on Autumn 2001 enhancements programme.
\item[Issue 1.184 (2002/03/02)] R0065: duplicates in context clauses now allowed.
\item[Issue 1.185 (2002/03/13)] R0056: default parameter modes supported properly.
\item[Issue 1.186 (2002/05/02)-1.188 (2002/05/04)] new syntax for interim spring 2002 release.
\item[Issue 1.189 (2002/05/05)] R0058: forward declarations of subprograms.
\item[Issue 1.190 (2002/05/06)] Spring 2002 enhancements: return and exit statements.
\item[Issue 1.191 (2002/05/07)] Spring 2002 enhancements: subprogram renaming.
\item[Issue 1.192 (2002/05/08)] Spring 2002 enhancements: object renaming.
\item[Issues 1.193 (2002/05/09)-1.197 (2002/05/11)] Spring 2002 enhancements: package renaming and use clauses.
\item[Issue 1.198 (2002/05/12)] Spring 2002 enhancements: more on named loops.
\item[Issue 1.199 (2002/05/14)] Duplicate renamings and use clauses are now errors.
\item[Issue 1.200 (2002/05/14)] {\it renamings} is now called {\it var\_renamings} in the specs.
\item[Issue 1.201 (2002/05/17)] Fixed {\it renames\_proc\_pack\_spec} which can now rename a procedure in the same package.
\item[Issue 1.202 (2002/05/21)] Fixed {\it renames\_pack} which was botching functions altogether and
added the state database into the CN state.
in the same package.
\item[Issue 1.203 (2002/05/22)] Changed signature of vcs for sequent origins necessitates changed use.
\item[Issue 1.204 (2002/05/25)] Support for full syntax-check-only mode.
\item[Issue 1.205 (2002/05/29)] Now storing the {\it consts\_types} component of a package in reverse order.
\item[Issue 1.206 (2002/05/31), 1.207 (2002/05/31), 1.208 (2002/06/01)] Liberalising treatment of use clauses.
\item[Issue 1.209 (2002/06/03)] Allowed for changes to the type THEORY.
\item[Issue 1.210 (2002/07/09)] R0076: residual global variable unsoundness fixed.
\item[Issue 1.211 (2002/07/13)] R0054: reworked treatment of use clauses.
\item[Issue 1.212 (2002/07/14)] Got {\it renames\_fun} and {renames\_proc} to work in
a package specification when the subprogram
being renamed is defined in the same package specification.
\item[Issue 1.213 (2002/07/15), 1.214 (2002/07/15)] More fixes after further testing of use clauses.
\item[Issue 1.215 (2002/07/24), 1.216 (2002/07/24)] R0079: assertions (allowed for new syntax and generation of VCs)
\item[Issue 1.217 (2002/08/07)] R0052: block statements (and now tolerates syntax for default parameters).
\item[Issue 1.218 (2002/08/08), 1.219 (2002/08/08)] R0051: default parameters.
\item[Issue 1.220 (2002/08/23)] Fixed {\LaTeX} error.
\item[Issue 1.221 (2002/10/14)] Merged in changes for R0062. Store VC context and route as user data.
\item[Issue 1.222 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.223 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.224 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.225 (2002/10/20)] Fix to get it to compile with SML/NJ again.
\item[Issues 1.226 (2002/11/10)--1.228 (2002/11/11)] Uniform treatment of block statements.
\item[Issue 1.229 (2002/11/11)] Fixed wrong sequencing in {\it do\_refinement\_rhs}.
\item[Issue 1.230 (2002/11/15)] Fixing problem with subtypes of record types with discriminants.
\item[Issues 1.231 (2002/11/15)--1.233 (2002/11/19)] Script deletion.
\item[Issue 1.234 (2002/12/05)] Brought {\it form\_proc\_pack\_body\_aux} into line with latest change proposals.
\item[Issue 1.235 (2002/12/05), 1.236 (2002/12/07)] Schema references in function $\Xi$-lists.
\item[Issue 1.237 (2002/12/08)] Rationalisation of formal procedures in package bodies (part of R0066).
\item[Issues 1.238 (2002/12/08) -- 1.240 (2002/12/10)] Code changes for R0066.
\item[Issue 1.241 (2002/12/15)] Now takes a theory checkpoint before each web clause and rolls back if an exception is raised.
\item[Issue 1.242 (2002/12/15)] Added exception logging.
\item[Issue 1.243 (2002/12/17)] Fixed {\LaTeX} errors.
\item[Issue 1.244 (2002/12/17), 1.245 (2002/12/17)] Rationalised error reporting: now can continue after failure in declaration, statement etc.
Soundness warnings now distinctive,more systematic and logged.
\item[Issue 1.246 (2003/02/05)] Rationalised {\it vcs\_body\_proc} in line with latest specification.
\item[Issue 1.247 (2003/02/05)] Tidying as a result of work on the Z specification.
\item[Issue 1.248 (2003/05/27)] R0091: apply the context clauses for a package specfication to the corresponding
package body automatically.
\item[Issue 1.249 (2003/06/18)] R0096: improved formatting of nothing statement form in web clauses
\item[Issue 1.250 (2003/07/17)] Improved coverage of early type-checking of specification statements
by doing all the work of checking and generating the VC terms in {\it call\_vcs}.
\item[Issue 1.251 (2003/07/17)]  Improved error messages to do with type errors in specification statements.
\item[Issue 1.252 (2003/07/18)] We now apply check 19 to global dependency lists.
\item[Issue 1.253 (2004/02/02)] Fixed bug in use of error messages 507125 and 507126 (in call\_vcs).
\item[Issue 1.254 (2004/02/07)] The name at the end of a package specification or a proper body is now optional.
\item[Issue 1.255 (2004/02/12)] Fixed bug in {\it combine\_param\_specs}.
\item[Issue 1.256 (2004/02/21)] Fixed bug in {\it renames\_object\_common}.
\item[Issue 1.257 (2004/02/21)] Now allows duplicates in a use clause.
\item[Issues 1.258 (2004/06/20)-1.271 (2004/07/18)] Reform of the Environments.
\item[Issue 1.272 (2004/07/20)] Private type declarations are now put through {\em basic\_declaration} to set up their enviroment  entries.
\item[Issue 1.273 (2004/08/10)] Fixed anomaly in use of replacement environment.
\item[Issue 1.274 (2004/08/20)] Performance tweaks in type inference context handling to avoid list-based processing of the contexts.
\item[Issue 1.275 (2004/08/29)] Implemented distinction between empty private part and omitted private part.
\item[Issue 1.276 (2004/08/31)] Renamings and use clauses now propagate into subunit, dec and spec environments.
\item[Issue 1.277 (2004/09/01)] Multiple use clauses for the same package now allowed in full generality.
\item[Issue 1.278 (2004/09/06)] Forward declarations of suprograms now propagate into environments
\item[Issue 1.279 (2004/09/07)] Variable renamings no longer propagate into frames.
\item[Issue 1.280 (2004/10/07)] Data refinement for global dependencies of procedures now supported.
\item[Issue 1.281 (2004/10/07)] Fixed error in propagation of formal functions into the environments.
\item[Issue 1.282 (2004/10/09)] Using clauses now allowed anywhere in package body.
\item[Issue 1.283 (2004/10/10)] Performance improvements to handling of {\em new\_ids} when creating the package spec theory.
\item[Issue 1.284 (2004/10/10)] Enumeration literals now recorded in environments as constants.
\item[Issue 1.285 (2004/10/25)] Renaming declarations for informal procedures are now allowed.
\item[Issue 1.286 (2004/10/26)] Fix to informal procedure unsoundness problem. Informal procedures are tracked in the environments so that an informal procedure and a formal procedure of the same name cannot happen.
\item[Issue 1.287 (2004/11/03)] Made it allow renaming of informal functions in package specifications.
\item[Issues 1.288 (2004/11/17), 1.289 (2004/11/18)] Informal functions that have been forward declared no longer give rise to an error.
Use clauses in package specifications now propagate into the package body.
\item[Issue 1.290 (2004/11/18)] Added support for labelled statements and goto statements.
\item[Issues 1.291 (2004/12/08), 1.292 (2005/05/10)] Added {\em create\_package\_spec\_theory}.
\item[Issue 1.293 (2005/05/12)] Tidied checking in cases where one subprogram specification statement refines another.
\item[Issue 1.294 (2005/08/16)] Made checking of specification statements more uniform.
\item[Issue 1.295 (2005/09/08)] Allowed for new scheme for Z type names.
\item[Issues 1.296 (2005/09/13), 1.297 (2005/09/14)] More enhancements to the error reporting in {\em call\_vcs}.
\item[Issue 1.298 (2005/09/15)] Rationalised treatment of prefixed names in package bodies (giving a major performance improvement in environment lookups when the name is not in the environment).
\item[Issue 1.299 (2005/09/15)] Adjusted error reports after comments from QinetiQ.
\item[Issue 1.300 (2005/09/16)] Now uses {\em do\_in\_theory} to speed up {\em make\_module} and makes better use of {\em lazy\_open\_theory}
\item[Issue 1.301 (2005/09/21)] Now gives VC soundness warnings for informal development steps.
\item[Issue 1.302 (2005/09/22)] Fixed problem with object renamings in package specifications.
\item[Issues 1.303 (2005/12/07), 1.304 (2005/12/07)] Enhancement 115: support for implicitly declared subprograms.
\item[Issue 1.305 (2005/12/16)] Allowed for kernel interface reform.
\item[Issue 1.306 (2006/01/14)] Fixed foul-up in the analysis of VCs that contain free variables.
\item[Issue 1.307 (2006/01/26)] Now uses new kernel interface to step the current level rather than introducing a dummy type.
\item[Issue 1.308 (2006/02/10)] Fixed ancient flaw in {\em end\_scope\_comp\_unit}.
\item[Issue 1.309 (2006/03/17)] Towards enhancement 117: elimination of the ``internal theory'' for a package specification.
\item[Issue 1.310 (2006/03/17)] First clean compile for enhancement 117.
\item[Issue 1.311 (2006/03/18)] Debugging enhancement 117.
\item[Issue 1.312 (2006/03/22)] Beginnings of enhancement 118: systematic naming of scripts.
\item[Issues 1.313 (2006/03/22)--1.315 (2006/03/24)] More debugging of enhancement 117.
\item[Issue 1.316 (2006/03/28)] Automated state management.
\item[Issue 1.317 (2006/03/29)] Enhancement 118: it is now an error to misname a script.
\item[Issue 1.318 (2006/04/07)] Under enhancement 117, names of Ada entities used in Z must now be in the canonical form.
Adjusted treatment of frames and Ξ-lists accordingly.
Also some work towards improved error handling that will be required for this enhancement.
\item[Issue 1.319 (2006/04/11)] Under enhancement 117, checks on use of names in Z are now given a uniform treatment.
\item[Issue 1.320 (2006/04/12)] Support for general expanded names.
\item[Issue 1.321 (2006/04/13)] Implicit declarations are now allowed for subprograms that were informal in the package specification.
\item[Issue 1.322 (2006/05/04)] Fixing issues with renamings in package specifications.
\item[Issue 1.323 (2006/05/05)] Function and constant renamings are now handled in the environments rather than with abbreviation definitions.
\item[Issue 1.324 (2006/05/30)] Fixed problem where raising an exception can prevent the original current theory being restored (issue 155).
Some tidying in preparation for issue 139.
\item[Issue 1.325 (2006/05/31)] Allowed for rationalised data type for subunits.
\item[Issue 1.326 (2006/06/01)] ``1 theory per subprogram'' --- issue 139.
\item[Issue 1.327 (2006/06/13)] Removed redundant definitions relating to the late (unlamented) package spec theories.
\item[Issue 1.328 (2006/06/14)] Added {\em get\_script\_theories}.
\item[Issue 1.329 (2006/07/07)] Fixing problems with nested packages.
\item[Issue 1.330 (2006/07/19)] Improved error reporting in {\em trans\_formal\_fun}.
\item[Issue 1.331 (2006/07/20)] Fixed inappropriate processing of use type clauses in {\em do\_context\_compilation\_unit}.
\item[Issue 1.332 (2006/07/21)] Issue 162: stub theory mechanism now generalised to a context theory mechanism applying to all nested subprograms.
\item[Issue 1.333 (2006/08/08)] Fixed miscalculation of the frame for a formal procedure in a package body.
\item[Issue 1.334 (2006/08/09)] {\em new\_scope\_with} now checks that auxiliary variables do not clash with names that are already in scope.
\item[Issue 1.335 (2006/08/10)] Multiple auxiliary variables are now allowed in one Z declaration.
\item[Issue 1.336 (2006/08/25)] Fixed mistreatment of expanded names in {\em renames\_object\_comon}.
\item[Issue 1.337 (2006/09/16)] Added {\em SCOPE\_ENV} and the {\em open\_scope} command.
\item[Issue 1.338 (2006/09/17)] Added support for deferred subprograms.
\item[Issue 1.339 (2006/09/18)] Issue 189: early type-checking now carried out for all procedures to avoid unsoundness problem in {\em vc\_body\_proc}.
\item[Issue 1.340 (2006/09/19)] Change to parametrisation of {\em new\_script} etc.
\item[Issue 1.341 (2007/01/23)] The Z output module now gives the ML bindings for {\em cn\_subprog\_ud\_key} etc.
\item[Issue 1.342 (2007/02/18)] Implemented new checks on global dependency lists.
\item[Issue 1.343 (2007/05/13)] Elements of a block name are now optional.
\item[Issue 1.344 (2007/05/18)] Allowed for rationalised abstract syntax for loops.
\item[Issue 1.345 (2007/05/20)] Enhancement 192 (theory-per-block).
\item[Issue 1.346 (2007/05/21)] Further rationalisation of abstract syntax for loops.
\item[Issue 1.347 (2007/05/26)] Fixing bug in {\em update\_spec\_env\_block}.
\item[Issue 1.348 (2007/11/11)] Added support for deletion of deferred subprograms.
\item[Issue 1.349 (2008/02/24)] Fixed bugs in {\em update\_envs\_pack\_spec} and {\em new\_scope\_pack\_body}.
\item[Issue 1.350 (2008/03/23), 1.351 (2008/03/24)] Child packages.
\item[Issue 1.352 (2008/05/05)] Modular types (currently disabled).
\item[Issue 1.353 (2008/10/11)] Fixed bug in {\em k\_slot\_doc}.
\item[Issue 1.354 (2008/11/12)] {\em save\_z\_generator\_state} now does nothing if the script name is not yet known (fixing a problem with
{\em delete\_script}).
\item[Issue 1.355 (2008/11/29)] Allowed for rationalisation to {\em FORMAL\_FUN} type.
\item[Issue 1.356 (2008/11/29)] Added {\em get\_script\_names}.
\item[Issue 1.357 (2008/12/06)] Fixed all non-exhaustive matches.
\item[Issue 1.358 (2009/03/24)] Suppressed pretty-printing of the abstype.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported daz source documents onto the Lemma 1 document template

\item[2015/11/21]
Accommodated changes to the HOL rollback functionality.

%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
\pagebreak
\section{GENERAL}
\subsection{Scope}
The detailed design for this material is in \cite{ISS/HAT/DAZ/DTD507}.
\subsection{Introduction}
Sections \ref{BASICDECLARATIONS} to \ref{WEBCLAUSES} implement the material defined in the corresponding sections of \cite{ISS/HAT/DAZ/DTD507}. Section \ref{PREAMBLE} contains various material which supports this, e.g. the component update functions and initial environment values of \cite{ISS/HAT/DAZ/DTD513}. Because the implementations of the component update functions are rather long-winded, they are all given together and the other material is not interleaved with them.
\subsection{Purpose and Background}
See \cite{ISS/HAT/DAZ/DTD507}.
=TEX
\section{PREAMBLE AND AUXILIARIES}\label{PREAMBLE}
=SML
structure ⦏CNZGenerator⦎ : CNZGenerator = struct
=SML
open CNTypes CNTypes1 CNTypes2 CNBasicDeclsAndExprs ZParagraphs ZTermGenerator
	CNVCGenerator ZUserInterfaceSupport TypeInference CNParser
	ZTypesAndTermsSupport CNZOutput;
=TEX
The following function returns the current level for the specified theory.  This is used as an index to order objects being added to the theory.

=SML
val ⦏current_level⦎ : unit -> int =
	(#current_level o #contents o get_theory_info o
		get_current_theory_name);
=TEX
The following are the agreed tags for use in forming script names based on compilation unit names.
=SML
val ⦏block_tag⦎ : string = "'block";
val ⦏context_tag⦎ : string = "'context";
val ⦏fun_tag⦎ : string = "'func";
val ⦏pack_spec_tag⦎ : string = "'spec";
val ⦏pack_body_tag⦎ : string = "'body";
val ⦏proc_tag⦎ : string = "'proc";
=TEX
The following functions are used to identify names for web clauses, in the naming of VCs and to form script names.
=SML
fun ⦏k_slot_name⦎ ({content, label} : K_SLOT) : string = "kslot"^label;
=TEX
=SML
fun ⦏package_declaration_name⦎
	({name, ...} : DECLARATION PACKAGE_DECLARATION)
	: EXPANDED_NAME * string = (
	(name, pack_spec_tag)
);
=TEX
=SML
fun ⦏procedure_specification_name⦎
	({name, ...} : PROCEDURE_SPECIFICATION) : ID = (
	name
);
=TEX
=SML
fun ⦏function_specification_name⦎
	({designator, ...} : FUNCTION_SPECIFICATION) : ID = (
	designator
);
=TEX
=SML
fun ⦏procedure_body_name⦎ ({procedure_spec, ...} : PROCEDURE_BODY)
	: ID = (
	procedure_specification_name procedure_spec
);
=TEX
=SML
fun ⦏function_body_name⦎ ({function_spec,...} :  FUNCTION_BODY)
	: ID = (
	function_specification_name function_spec
);
=TEX
=SML
fun ⦏package_body_name⦎ ({name, ...} : PACKAGE_BODY) : EXPANDED_NAME = (
	name
);
=TEX
The {\it in\_z} flag on those functions that have it below allows them to be reused
to calculate indexes into the package and subunit environments.
=SML
fun ⦏proper_body_name⦎ (pb : PROPER_BODY)
	: EXPANDED_NAME * string = (
	case pb of
		PBProcedure prc => ([procedure_body_name prc], proc_tag)
	|	PBFunction fnc =>  ([function_body_name fnc], fun_tag)
	|	PBPackage pck => (package_body_name pck, pack_body_tag)
);
=TEX
=SML
fun ⦏subunit_name⦎ ({name, proper_body} : COMP_SUBUNIT)
	: EXPANDED_NAME * string = (
	let	val (body_name, tag) = proper_body_name proper_body;
	in	(name @ body_name, tag)
	end
);
=TEX
=SML
fun ⦏compilation_unit_name⦎ (cu : COMPILATION_UNIT)
	: Z_ID * string = (
	let	val (en, tag) =
		case cu of
			CUPackageDeclaration d => package_declaration_name (#pack_decl d)
		|	CUProperBody b => proper_body_name b
		|	CUSubUnit s => subunit_name s;
	in	(trans_expanded_name en, tag)
	end
);
=TEX
The following gives the list of proper non-empty suffixes of a list in order of increasing length.
I.e., $[1, 2, 3] \mapsto [[3], [2, 3]]$
(used to calculate the list of alias prefixes for an Ada entity).
Caller should add the empty suffix or the whole list as needed.
N.b., the accumulating argument here is to get the order right).
=SML
fun ⦏suffixes⦎ (xs : 'a list) : 'a list list = (
	let	fun aux _ [] = []
		|   aux acc [x] = acc
		|   aux acc (_ :: xs) = aux (xs::acc) xs;
	in	aux [] xs
	end
);
=TEX
The following gives the list of proper non-empty prefixes of a list (used to calculate the ancestors of a child package).
The order is shortest first, i.e., most distant ancestor first, reflecting the order of dependency.
=SML
fun ⦏prefixes⦎ (xs : 'a list) : 'a list list = (
	map rev (suffixes(rev xs))
);
=TEX
The following calculates the list of ancestors in the sense of a child compilation unit which is empty for a subunit.
=SML
fun ⦏compilation_unit_ancestors⦎ (cu : COMPILATION_UNIT) : EXPANDED_NAME list = (
	let	val (en, _) =
		case cu of
			CUPackageDeclaration d => package_declaration_name (#pack_decl d)
		|	CUProperBody b => proper_body_name b
		|	CUSubUnit s => ([], "");
	in	prefixes en
	end
);
=TEX
The following are used to set the bottom block name that may occasionally occur in VC names.
The name does not get the tag.
=SML
fun ⦏context_compilation_unit_name⦎
	({comp_unit, ...} : CONTEXT_COMPILATION_UNIT) : Z_ID = (
	fst(compilation_unit_name comp_unit)
);
=TEX
=SML
fun ⦏kslot_compilation_unit_name⦎ (kcu : KSLOT_COMPILATION_UNIT) : Z_ID = (
	case kcu of
		KCUKSlot ks => k_slot_name ks
	|	KCUUnit ccu => context_compilation_unit_name ccu
	|	KCUPragma ccu => "<pragma>"
);
=TEX
=SML
fun ⦏fmt_expanded_name⦎ ([] : EXPANDED_NAME) = ""
|   fmt_expanded_name [sn] = sn
|   fmt_expanded_name (sn::more) = sn ^ "." ^ fmt_expanded_name more;
=TEX
\subsection{Making Z Predicates}
In some places, we need to form the HOL term corresponding to a Z predicate.
This may require coercion of a schema into a predicate:
=SML
fun ⦏z_pred_of_z_tm⦎ (env : CN_ENV)  (zt : Z_TM) : Z_PRED = (
	case zt of
		ZTmQuotation (tm, _) => tm
	|	_ =>
	let	val tm = z_predexp_of_z_tm env zt;
	in	if	type_of tm =: BOOL
		then	tm
		else	mk_z_schema_pred (tm, "")
	end
);
=TEX
The following function is used here and elsewhere to find the HOL name corresponding to a Z one.
=SML
val ⦏hol_const_name⦎ : Z_ID -> string = bind_gvar_name;
=TEX
\subsection{Initial Values}
=SML
val ⦏pack_env0⦎ : PACK_ENV = initial_s_dict;
val ⦏subunit_env0⦎ : SUBUNIT_ENV = initial_s_dict;
val ⦏dec_env0⦎ : DEC_ENV = initial_s_dict;
val ⦏spec_env0⦎ : SPEC_ENV = initial_s_dict;
=TEX
$empty\_block$ is the initial value for a block, as loosely specified in \cite{ISS/HAT/DAZ/DTD513}.
Fields which are not specified there are given place-holder values.
All the flags are set false, for convenience in defining $env0$.
It is convenient to define some shared dummy values first:
=SML
val ⦏dummy_spec⦎ : SPEC = {
		w 		= 	[],
		w0		=	[],
		pre		=	ZUserInterfaceSupport.ZTmTruth true,
		post		=	ZUserInterfaceSupport.ZTmTruth true};
val ⦏dummy_informal_fun⦎ : INFORMAL_FUN = {
		name		=	"*dummy fun*",
		formal_pars	=	[],
		par_names_defs	=	[],
		return_type	=	"*dummy type*"};
val ⦏dummy_formal_fun⦎ : FORMAL_FUN = {
		informal_fun	=	dummy_informal_fun,
		spec		=	dummy_spec,
		globals		=	[]};
val ⦏dummy_formal_proc⦎ : FORMAL_PROC = {
		name		=	"*dummy formal proc*",
		formal_ids	=	[],
		par_names_defs	=	[],
		spec		=	dummy_spec,
		globals		=	[]};
val ⦏empty_in_scope⦎ : IN_SCOPE = {
		dict		=	initial_env_dict,
		dec_labels	=	[]};
val ⦏false_flags⦎ : FLAGS = {
		pack_spec_flag		=	false,
		pack_body_flag		=	false,
		stub_flag		=	false,
		subunit_flag		=	false,
		formal_body_flag	=	false,
		fun_flag		=	false,
		declabel_flag		=	false,
		speclabel_flag		=	false,
		till_flag		=	false,
		body_flag		=	false,
		private_flag		=	false};
val ⦏dummy_declab⦎ : DECLAB = {
		block_name	=	[],
		flags		=	false_flags,
		using_decs	=	[],
		in_scope	=	empty_in_scope};
=TEX
=SML
val ⦏empty_block⦎ : BLOCK = 	{
	declab		=	dummy_declab,
	current_formal_proc = dummy_formal_proc,
	current_formal_fun = dummy_formal_fun,
	current_for_vars = [],
	current_log_cons = [],
	current_loop_name = Nil,
	dec_lab = "",
	spec_lab = "",
	till = mk_z_true,
	var_inits = []
};
=TEX
Now we can define $env0$, exploiting the fact that all the flags are set to $false$ in $empty\_block$.
=SML
val ⦏env0⦎ : ENV = [empty_block];
=TEX
We also require initial values for the SPARK program and replacement environments discussed in \cite{ISS/HAT/DAZ/DTD513}
=SML
val ⦏repl_env0⦎ : REPL_ENV = initial_s_dict;
val ⦏scope_env0⦎ : SCOPE_ENV = initial_e_dict;
val ⦏spark_prog0⦎ : SPARK_PROG = [];
=TEX
For uniformity, we give the initial value for the theory name and deletion
information components of the global state here.
We use the string ``-'' for the script name which by convention in {\Product} means the current theory.
=SML
val ⦏script_name0⦎ : string = "-";
val ⦏deletion_info0⦎ : SUBUNIT_ENV = [];
=TEX
=SML
val ⦏init_z_generator_state⦎ : Z_GENERATOR_STATE = (
	 {	pack_env = pack_env0,
		subunit_env = subunit_env0,
		dec_env = dec_env0,
		spec_env = spec_env0,
		blocks = env0,
		repl_env = repl_env0,
		scope_env = scope_env0,
		spark_prog = spark_prog0,
		script_name = script_name0,
		deletion_info = deletion_info0}
);
=TEX
\subsection{The Global State}
For convenience in the implementation, each component of the state is held in an assignable variable.
=SML
val ⦏pack_env⦎ : PACK_ENV ref = ref pack_env0;
val ⦏subunit_env⦎ : SUBUNIT_ENV ref = ref subunit_env0;
val ⦏dec_env⦎ : DEC_ENV ref = ref dec_env0;
val ⦏spec_env⦎ : SPEC_ENV ref = ref spec_env0;
val ⦏blocks⦎ : ENV ref = ref env0;
val ⦏repl_env⦎ : REPL_ENV ref = ref repl_env0;
val ⦏scope_env⦎ : SCOPE_ENV ref = ref scope_env0;
val ⦏spark_prog⦎ : SPARK_PROG ref = ref spark_prog0;
val ⦏script_name⦎ : string ref = ref script_name0;
val ⦏deletion_info⦎ : SUBUNIT_ENV ref = ref deletion_info0;
=TEX
The global state may be set from a given value of type $CN\_STATE$ using the following function:
=SML
fun ⦏set_z_generator_state⦎ ({
		pack_env = new_pack_env,
		subunit_env = new_subunit_env,
		dec_env = new_dec_env,
		spec_env = new_spec_env,
		blocks = new_blocks,
		repl_env = new_repl_env,
		scope_env = new_scope_env,
		spark_prog = new_spark_prog,
		script_name = new_script_name,
		deletion_info = new_deletion_info
	} : Z_GENERATOR_STATE) : unit = (
		pack_env := new_pack_env;
		subunit_env := new_subunit_env;
		dec_env := new_dec_env;
		spec_env := new_spec_env;
		blocks := new_blocks;
		repl_env := new_repl_env;
		scope_env := new_scope_env;
		spark_prog := new_spark_prog;
		script_name := new_script_name;
		deletion_info := new_deletion_info
);
=TEX
=SML
fun ⦏get_z_generator_state⦎ (() : unit) : Z_GENERATOR_STATE = (
		{pack_env = !pack_env,
		subunit_env = !subunit_env,
		dec_env = !dec_env,
		spec_env = !spec_env,
		blocks = !blocks,
		repl_env = !repl_env,
		scope_env = !scope_env,
		spark_prog = !spark_prog,
		script_name = !script_name,
		deletion_info = !deletion_info}
);
=TEX
In addition to the above, we keep a database mapping script names to the corresponding
states.
=SML
val ⦏state_db⦎ : Z_GENERATOR_STATE E_DICT ref =
	ref initial_e_dict;
=TEX
The following function does nothing if the script name has not been set up, since we don't want entries associated with the dummy script name.
=SML
fun ⦏save_z_generator_state⦎ (() : unit) : unit = (
	let	val zgs as {script_name, ...} = get_z_generator_state();
	in	if	script_name <> script_name0
		then	state_db := e_enter script_name zgs (!state_db)
		else	()
	end
);
=TEX
=SML
fun ⦏get_saved_z_generator_state⦎ (s : string) : Z_GENERATOR_STATE = (
	let	val s' = case s of "-" => !script_name | _ => s;
	in	case e_lookup s' (!state_db) of
			Value st => st
		|	Nil => fail "get_saved_z_generator_state" 507070 [fn _ => s]
	end
);
=TEX
=SML
fun ⦏get_state_db⦎ (() : unit) : Z_GENERATOR_STATE E_DICT = (
	!state_db
);
=TEX
\subsection{The Environment for Volumes II and III}
=TEX
=SML
fun ⦏cn_env_of_in_scope⦎ (in_scope as{dict, ...} : IN_SCOPE) : CN_ENV  = (
	env_of_env_dict dict
);
=TEX
=SML
val ⦏current_cn_env⦎ : CN_ENV = (fn (n : Z_ID) =>
	cn_env_of_in_scope
	((#in_scope(#declab(hd(!blocks))))
		handle Fail _ => fail "current_cn_env" 507130 [fn _ => n])
	n
);
=TEX
=SML
fun ⦏speclab_wp_env_from_in_scope⦎  (
	{spec,
	formal_body_flag,
	fun_flag,
	till_flag,
	wp_env as {env, till, named_tills, return, fun_header},
	in_scope,
	block_name
	} : SPECLAB) : SPECLAB = (
	{spec 			=	spec,
	formal_body_flag	=	formal_body_flag,
	fun_flag		=	fun_flag,
	till_flag		=	till_flag,
	wp_env			= {
			env = cn_env_of_in_scope in_scope,
			till = till,
			named_tills = named_tills,
			return = return,
			fun_header = fun_header
			},
	in_scope		=	in_scope,
	block_name	=	block_name

	}
);
=TEX
\subsection{Component Update Functions}
We give various update functions that are not mentioned in the
specification, as well as the ones called for.
Some of the ones required by the spec are introduced later on to get the dictionary handling right.
=TEX
We will need to be able to convert an Ada type mark into the HOL type for elements of the Ada type:
=SML
fun ⦏type_of_tmark⦎ (dict : ENV_DICT) (tmark : TMARK) : TYPE * Z_ID = (
	let	val (set_ty, can_n) =
			case env_of_env_dict dict (trans_id tmark) of
				Value {tipe = Value ty, info = EIEnvRecordType _, canon_name, ...} => (ty, canon_name)
			|	Value {tipe = Value ty, info = EIEnvOtherType, canon_name, ...} => (ty, canon_name)
			|	_ => fail "type_of_tmark" 507127 [fn _ => tmark];
	in	(dest_z_power_type set_ty, can_n)
		handle Fail _ => fail "type_of_tmark" 507128 [fn _ => tmark]
	end
);
=TEX

=SML
fun ⦏in_scope_dict⦎
	({
		dict = _,
		dec_labels = dec_labels} : IN_SCOPE,
	new_dict : ENV_DICT) : IN_SCOPE = (
	{	dict = new_dict,
		dec_labels = dec_labels}
);
=TEX

=SML
fun ⦏in_scope_new_dict_entries⦎
	({
		dict = dict,
		dec_labels = dec_labels} : IN_SCOPE,
	new_entries : ENV_INFO S_DICT) : IN_SCOPE = (
	{	dict = add_to_env_dict dict new_entries,
		dec_labels = dec_labels}
);
=TEX
The following adds variables into an environment dictionary taking type information from some other (or maybe the same) dictionary.
In fact, the two dictionaries are the same except when we are updating package with-dictionaries.
=SML
fun ⦏dict_vc_vars1⦎
	(ty_dict : ENV_DICT)
	({canon, aliases} : PREFIX_INFO, private : bool)
	(dict : ENV_DICT,
	new_vc_vars : VAR_DECL list) : ENV_DICT = (
		let	fun mk_var_info zn tmark = (
				let	val (ty, can_tmark) = type_of_tmark ty_dict tmark;
				in
					{tipe = Value ty,
					canon_name = zn,
					info = EIEnvVar{kind = VKVar, tmark = can_tmark},
					private = private}
				end
			);
			fun aux1 {vars, tmark} = map (fn v => (v, prefix_trans_id canon v, tmark)) vars;
			val vars_tmarks = flat (map aux1 new_vc_vars);
			fun aux2 (v, zv, tmk) = (
				let	val inf = mk_var_info zv tmk;
				in	(zv, inf) ::
					map (fn ap => (prefix_trans_id ap v, inf)) aliases
				end
			);
			val vars_infos = flat(map aux2 vars_tmarks);
		in	add_to_env_dict dict vars_infos
		end
);
=TEX
=SML
fun ⦏dict_vc_vars⦎
	(pfx_priv : PREFIX_INFO * bool)
	(dict : ENV_DICT,
	new_vc_vars : VAR_DECL list) : ENV_DICT = (
	dict_vc_vars1 dict pfx_priv (dict, new_vc_vars)
);
=TEX
The following refines the specification by providing the ability to extend the existing dictionary rather than just replacing it.
If the optional first argument is non-nil, its value with the list of new variables entered into it replaces the dictionary.
If the optional first argument is nil, the new variables are entered into the existing dictionary.
=SML
fun ⦏in_scope_vc_vars⦎
	(Nil : ENV_DICT OPT)
	(pfx_priv : PREFIX_INFO * bool)
	(in_scope as {
		dict = dict,
		dec_labels = _} : IN_SCOPE,
	new_vc_vars : VAR_DECL list) : IN_SCOPE = (
		in_scope_dict(in_scope, dict_vc_vars pfx_priv (dict, new_vc_vars))
) | in_scope_vc_vars (Value dict) pfx_priv ({dict = _, dec_labels} , new_vc_vars)= (
	in_scope_vc_vars Nil pfx_priv ({dict = dict, dec_labels = dec_labels}, new_vc_vars)
);
=TEX

=SML
fun ⦏dict_vc_aux_vars⦎
	(dict : ENV_DICT,
	new_vc_aux_vars : TERM list) : ENV_DICT = (
		let	fun mk_aux_var_info ((zn, ty), zset) = (
				(zn,
				{tipe = Value ty,
				canon_name = zn,
				info = EIEnvAuxVar{
					in_scope = true,
					decl = mk_z_dec([mk_var(zn, ty)], zset)},
				private = false})
			);
			val compound_decs = map dest_z_dec new_vc_aux_vars;
			fun aux1 (zvs, zset) = map (fn zv => (dest_var zv, zset)) zvs;
			val simple_decs = flat (map aux1 compound_decs);
			val aux_vars_infos = map mk_aux_var_info simple_decs;
		in	add_to_env_dict dict aux_vars_infos
		end
);
=TEX
The following two can handle declarations containing more than one auxiliary variable or logical constant, but this feature is not currently used.
=SML
fun ⦏in_scope_vc_aux_vars⦎
	(Nil : ENV_DICT OPT)
	(in_scope as {
		dict = dict,
		dec_labels = _} : IN_SCOPE,
	new_vc_aux_vars : TERM list) : IN_SCOPE = (
	in_scope_dict(in_scope, dict_vc_aux_vars(dict, new_vc_aux_vars))
) | in_scope_vc_aux_vars (Value dict) ({dict = _, dec_labels} , new_vc_aux_vars)= (
	in_scope_vc_aux_vars Nil ({dict = dict, dec_labels = dec_labels}, new_vc_aux_vars)
);
=TEX
Logical constants appear in code, so they are never declared in the private part of a package.
=SML
fun ⦏in_scope_vc_log_cons⦎
	(Nil : ENV_DICT OPT)
	(in_scope as {
		dict = dict,
		dec_labels = _} : IN_SCOPE,
	new_vc_log_cons : TERM list) : IN_SCOPE = (
		let	fun mk_aux_var_info ((zn, ty), zset) = (
				(zn,
				{tipe = Value ty,
				canon_name = zn,
				info = EIEnvLogCon{
					in_scope = true,
					decl = mk_z_dec([mk_var(zn, ty)], zset)},
				private = false})
			);
			val compound_decs = map dest_z_dec new_vc_log_cons;
			fun aux1 (zvs, zset) = map (fn zv => (dest_var zv, zset)) zvs;
			val simple_decs = flat (map aux1 compound_decs);
			val log_cons_infos = map mk_aux_var_info simple_decs;
			val new_dict = add_to_env_dict dict log_cons_infos
		in	in_scope_dict(in_scope, new_dict)
		end
) | in_scope_vc_log_cons (Value dict) ({dict = _, dec_labels} , new_vc_log_cons)= (
	in_scope_vc_log_cons Nil ({dict = dict, dec_labels = dec_labels}, new_vc_log_cons)
);
=TEX
=SML
fun ⦏dict_vc_pars1⦎
	(ty_dict : ENV_DICT)
	({canon, aliases} : PREFIX_INFO)
	(dict : ENV_DICT,
	new_vc_pars : PARAM_SPEC list) : ENV_DICT = (
		let	fun mk_par_info zn tmark mode = (
				let	val (ty, can_tmark) = type_of_tmark ty_dict tmark;
				in
				{tipe = Value ty,
				canon_name = zn,
				info = EIEnvVar{kind = VKPar mode, tmark = can_tmark},
				private = false}
				end
			);
			fun aux1 {var_decl = {vars, tmark}, mode = mode} = (
				map (fn v => (v, prefix_trans_id canon v, tmark, mode)) vars
			);
			val pars_tmarks_modes = flat (map aux1 new_vc_pars);
			fun aux2 (v, zv, tmk, mode) = (
				let	val inf = mk_par_info zv tmk mode;
				in	(zv, inf) ::
					map (fn ap => (prefix_trans_id ap v, inf)) aliases
				end
			);
			val pars_infos = flat(map aux2 pars_tmarks_modes);
		in	add_to_env_dict dict pars_infos
		end
);
=TEX
=SML
fun ⦏dict_vc_pars⦎
	(pfx_info : PREFIX_INFO)
	(dict : ENV_DICT,
	new_vc_pars : PARAM_SPEC list) : ENV_DICT = (
	dict_vc_pars1 dict pfx_info (dict, new_vc_pars)
);
=TEX
=SML
fun ⦏in_scope_vc_pars⦎
	(Nil : ENV_DICT OPT)
	(pfx_info : PREFIX_INFO)
	(in_scope as {
		dict = dict,
		dec_labels = _} : IN_SCOPE,
	new_vc_pars : PARAM_SPEC list) : IN_SCOPE = (
	in_scope_dict(in_scope, dict_vc_pars pfx_info (dict, new_vc_pars))
) | in_scope_vc_pars (Value dict) pfx_info ({dict = _,  dec_labels} , new_vc_pars)= (
	in_scope_vc_pars Nil pfx_info ({dict = dict, dec_labels = dec_labels}, new_vc_pars)
);
=TEX
In the following, the first dictionary argument is the one that contains information about the names being aliased.
The two dictionaries will be the same except when a renaming in a package declaration is being added to the package with-dictionary.
=SML
fun ⦏dict_renamings⦎
	({canon, aliases} : PREFIX_INFO, private : bool)
	(dict2 : ENV_DICT,
		(renamings : (Z_ID * Z_ID OPT) list,
		 dict1 : ENV_DICT)) : ENV_DICT = (
		let	fun mk_renamed_info (new, orig) = (
				(new,
				case env_of_env_dict dict1 orig of
					Value {tipe, canon_name, info, ...} => {tipe = tipe, canon_name = canon_name, info = info, private = private}
				|	Nil => fail "dict_renamings" 507129
					[fn _ => orig])
			);
			val rens = mapfilter (Combinators.I ** force_value) renamings;
			val base_names_infos = map mk_renamed_info rens;
			fun prefix (new, inf) = (
				(prefix_trans_id canon new, inf)::
				map (fn ap => (prefix_trans_id ap new, inf)) aliases
			);
			val names_infos = flat(map prefix base_names_infos);
		in	add_to_env_dict dict2 names_infos
		end
);
=TEX
The additional optional environment dictionary does not make sense for the following update function:
=SML
fun ⦏in_scope_renamings⦎
	(pfx_priv : PREFIX_INFO * bool)
	(in_scope as {
		dict = dict,
		dec_labels = _} : IN_SCOPE,
	renamings : (Z_ID * Z_ID OPT) list) : IN_SCOPE = (
		let			val new_dict = dict_renamings pfx_priv (dict, (renamings, dict));
		in	in_scope_dict(in_scope, new_dict)
		end
);
=TEX
=SML
fun ⦏dict_formal_proc⦎
	({canon, aliases} : PREFIX_INFO, private : bool)
	(dict : ENV_DICT,
	new_formal_proc : FORMAL_PROC) : ENV_DICT = (
		let	fun aux1 (fp as {name, ...}) = (
				let	val zn = prefix_trans_id canon name;
				in	(name,
					 zn,
					{tipe = Nil,
					 canon_name = zn,
					 info = EIEnvProcedure{
						formal_proc = Value fp},
					 private = private})
				end
			);
			fun aux2 (n, zn, inf) = (
				(zn, inf) ::
				map (fn ap => (prefix_trans_id ap n, inf)) aliases
			);
			val list = aux2 (aux1 new_formal_proc);
		in	add_to_env_dict dict list
		end
);
=TEX
=SML
fun ⦏dict_informal_proc⦎
	({canon, aliases} : PREFIX_INFO, private : bool)
	(dict : ENV_DICT,
	new_informal_proc : ID) : ENV_DICT = (
		let	fun aux1 n = (
				let	val zn = prefix_trans_id canon n;
				in	(n,
					zn,
					{tipe = Nil,
					canon_name = zn,
					info = EIEnvProcedure{
						formal_proc = Nil},
					private = private})
				end
			);
			fun aux2 (n, zn, inf) = (
				(zn, inf) ::
				map (fn ap => (prefix_trans_id ap n, inf)) aliases
			);
			val list = aux2 (aux1 new_informal_proc);
		in	add_to_env_dict dict list
		end
);
=TEX
=SML
fun ⦏in_scope_formal_proc⦎
	(Nil : ENV_DICT OPT)
	(pfx_priv : PREFIX_INFO * bool)
	(in_scope as {
		dict = dict,
		dec_labels = _} : IN_SCOPE,
	new_formal_proc : FORMAL_PROC) : IN_SCOPE = (
		in_scope_dict(in_scope, dict_formal_proc pfx_priv (dict, new_formal_proc))
) | in_scope_formal_proc (Value dict) pfx_priv ({dict = _, dec_labels} , new_formal_proc)= (
	in_scope_formal_proc Nil pfx_priv ({dict = dict, dec_labels = dec_labels}, new_formal_proc)
);
=TEX
=SML
fun ⦏in_scope_informal_proc⦎
	(Nil : ENV_DICT OPT)
	(pfx_priv : PREFIX_INFO * bool)
	(in_scope as {
		dict = dict,
		dec_labels = _} : IN_SCOPE,
	new_informal_proc : ID) : IN_SCOPE = (
		in_scope_dict(in_scope, dict_informal_proc pfx_priv (dict, new_informal_proc))
) | in_scope_informal_proc (Value dict) pfx_priv ({dict = _, dec_labels} , new_informal_proc)= (
	in_scope_informal_proc Nil pfx_priv ({dict = dict, dec_labels = dec_labels}, new_informal_proc)
);
=TEX
To help with processing record types the following function takes a type definition and
for a record type returns the appropriate entity info giving the component names in order and the number of discriminants.
In accordance with the Ada rules, the discriminants are included, in order, as
the leading sublist of the components.
For other sorts of Ada type we need only record the fact that the Z global variable represents an Ada type.
=SML
fun ⦏entity_info_of_type_def⦎ (TDRecordTypeDef {decl, disc} : TYPE_DEF) : ENTITY_INFO = (
	let	val discs = flat (map #vars disc);
		val others = flat (map (#vars o fst) decl);
		val ty = force_value
	in	EIEnvRecordType{comp_names = discs @ others, num_discs = length discs}
	end
) | entity_info_of_type_def _ = EIEnvOtherType;
=TEX
... and when a record type with a discriminant is used in a subtype declaration, we
need to calculate the component names for the subtype.
=SML
fun ⦏entity_info_of_sub_ind⦎ ({tmark, ...} : CONSTRAINT SUB_IND)
	: ENTITY_INFO = (
	case current_cn_env (trans_id tmark) of
		Value {info = EIEnvRecordType{comp_names, ...}, ...}  => (
			EIEnvRecordType{comp_names =comp_names, num_discs =0}
	) |	_ => EIEnvOtherType
);
=TEX
... and for a private type declaration, we need to say it is an ``other type'' (since we don't know yet).
=SML
fun ⦏entity_info_of_private_type_decl⦎ (_ : PRIVATE_TYPE_DECL) : ENTITY_INFO = (
	 EIEnvOtherType
);
=TEX
... and for a constant declaration, we need to record the type mark (which may be omitted if this is a named number declaration).
=SML
fun ⦏entity_info_of_const_decl⦎ ({tm, ...} : EXP CONST_DECL) : ENTITY_INFO = (
	 case tm of
		Value tm => EIEnvConstant{tmark = tm}
	|	Nil => EIEnvOther
);
=TEX
Once we have the environment info, we can generate the environment info for it.
We do not need to provide the type here, but we do if it is available: subsequently, when the environment info is used,
{\em env\_of\_env\_dict} will fill it in from the HOL type of the constant if it is not in the environment info.
=SML
fun ⦏env_entries_of_entity_info⦎
	({canon, aliases} : PREFIX_INFO, private : bool)
	(n : ID, ent_inf : ENTITY_INFO) : (Z_ID * ENV_INFO) list = (
	let	val can_n = prefix_trans_id canon n;
		val env_inf = {tipe = get_const_type (hol_const_name can_n), info = ent_inf, canon_name = can_n, private = private};
	in	(can_n, env_inf) ::
		map (fn ap => (prefix_trans_id ap n, env_inf)) aliases
	end
);
=TEX
=SML
fun ⦏dict_basic_decl⦎
	(pfx_priv : PREFIX_INFO * bool)
	(dict : ENV_DICT, bd : BASIC_DECL) : ENV_DICT = (
	let	val	entries = flat(map
			(env_entries_of_entity_info pfx_priv)
		(case bd of
			BDTypeDecl {name, type_def as TDEnumTypeDef {vals}} => (
				(name, entity_info_of_type_def type_def)::
				map (fn e =>
				(e, EIEnvConstant{tmark=name}))
				vals
		) |	BDTypeDecl {name, type_def} => (
				[(name, entity_info_of_type_def type_def)]
		) |	BDSubtypeDecl ({name, sub_ind}) => (
				[(name, entity_info_of_sub_ind sub_ind)]
		) |	BDPrivateTypeDecl (ptd as{id, ...}) =>  (
				[(id, entity_info_of_private_type_decl ptd)]
		) |	BDConstDecl(cd as  {consts = cs, ...}) => (map (fn c =>
				(c, entity_info_of_const_decl cd)
			) cs)
		|	_ => []));
	in	add_to_env_dict dict entries
	end
);
=TEX
=SML
fun ⦏in_scope_consts_types⦎
	(pfx_priv : PREFIX_INFO * bool)
	(in_scope : IN_SCOPE, bd : BASIC_DECL) : IN_SCOPE = (
	let	val d = #dict in_scope;
		val new_d = dict_basic_decl pfx_priv (d, bd);
	in	in_scope_dict(in_scope, new_d)
	end
);
=TEX
=SML
fun ⦏env_entries_of_fun⦎
	({canon, aliases} : PREFIX_INFO, private : bool)
	(spec : SPEC OPT)
	(old_name : Z_ID OPT)
	(globals : Z_ID list)
	({name, formal_pars, par_names_defs, return_type} : INFORMAL_FUN)
	: (Z_ID * ENV_INFO) list = (
	let 	fun get_tmarks {vars, tmark} = (
			map (fn v =>  tmark) vars
		);
		val ts = flat (map (get_tmarks o #var_decl) formal_pars);
		fun mk_par_info (t, (n, d)) = (
			{id = n,
			tmark = t,
			default = d}
		);
		val par_infos = map mk_par_info (combine ts par_names_defs)
			handle Fail _ => error "fun_name_par_names" 507078[];
		val zn = prefix_trans_id canon name;
		val env_inf = {tipe = Nil,
			canon_name = case old_name of
				Value old_zn => old_zn
			|	Nil => zn,
			info = 	EIEnvFunction {
				 spec = spec,
				 deps = globals,
				 pars = par_infos,
				 return_tmark = return_type},
			private = private};
	in	(zn, env_inf)::
		map (fn ap => (prefix_trans_id ap name, env_inf)) aliases
	end
);
=TEX
=SML
fun ⦏dict_informal_fun⦎
	(pfx_priv : PREFIX_INFO * bool)
	(dict : ENV_DICT, inf_fun : INFORMAL_FUN) : ENV_DICT = (
	let	val entries = env_entries_of_fun pfx_priv Nil Nil [] inf_fun;
	in	add_to_env_dict dict entries
	end
);
=TEX
=SML
fun ⦏dict_formal_fun⦎
	(pfx_priv : PREFIX_INFO * bool)
	(dict : ENV_DICT,
		(form_fun as
			{informal_fun, globals, spec, ...}: FORMAL_FUN,
			old_zname : Z_ID OPT)) : ENV_DICT = (
	let	val entries = env_entries_of_fun pfx_priv (Value spec) old_zname globals informal_fun;
	in	add_to_env_dict dict entries
	end
);
=TEX
=SML
fun ⦏with_pack_prefix_info⦎ ({canon, ...} : PREFIX_INFO) : PREFIX_INFO = (
	{canon = canon, aliases = []}
);
=TEX
The following is used to update the with dictionary in a package conditionally:
=SML
fun ⦏if_public⦎
	(f : ('a * bool) -> ('b * 'c) -> 'b)
	(x : 'a, private : bool)
	(yz as (y, _) : 'b * 'c) : 'b = (
	if	private
	then	y
	else	f (x, false) yz
);
=TEX
Note that the following adds one basic declaration to the package, which is what is wanted where it is used.
=SML
fun ⦏package_consts_types⦎
	(pfx_priv as (pfx_info : PREFIX_INFO, private : bool))
	(pack_name : ID,
	{vc_vars, consts_types, formal_procs, informal_procs, informal_funs,
		formal_funs, aux_vars, obj_renamings, zmod, decl, local_dict, private_dict, with_dict}
	: PACKAGE,
	extra_const_type : BASIC_DECL) : PACKAGE = (
	{	vc_vars				=	vc_vars,
		consts_types			=	extra_const_type :: consts_types,
		formal_procs			=	formal_procs,
		informal_procs			=	informal_procs,
		informal_funs			=	informal_funs,
		formal_funs			=	formal_funs,
		aux_vars			=	aux_vars,
		obj_renamings			=	obj_renamings,
		zmod				=	zmod,
		decl				=	decl,
		local_dict				=	dict_basic_decl pfx_priv (local_dict, extra_const_type),
		private_dict				=	dict_basic_decl pfx_priv (private_dict, extra_const_type),
		with_dict				=	 if_public dict_basic_decl (with_pack_prefix_info pfx_info, private) (with_dict, extra_const_type)
	}
);
=TEX
=SML
fun ⦏in_scope_fun⦎
	(pfx_priv : PREFIX_INFO * bool)
	(spec : SPEC OPT)
	(old_zname : Z_ID OPT)
	(globals : Z_ID list)
	(in_scope as {
		dict = d,
		dec_labels = _} : IN_SCOPE,
	new_function: INFORMAL_FUN) : IN_SCOPE = (
	let	val entries = env_entries_of_fun pfx_priv spec old_zname globals new_function;
		val new_d = add_to_env_dict d entries;

	in	in_scope_dict(in_scope, new_d)
	end
);
=TEX
=SML
fun ⦏subunit_in_scope⦎
	 ({	zmod,
		specif_flag,
		specif,
		in_scope,
		globs
	} : SUBUNIT,
	new_in_scope : IN_SCOPE) : SUBUNIT = (
	{	zmod		=	zmod,
		specif_flag	=	specif_flag,
		specif		=	specif,
		in_scope	=	new_in_scope,
		globs		=	globs
	}
);
=TEX
In the following function the variable being made visible to the subunit cannot be in the private part of a package.
=SML
fun ⦏subunit_vc_vars⦎
	(pfx_info : PREFIX_INFO)
	 ({	zmod,
		specif_flag,
		specif,
		in_scope,
		globs
	} : SUBUNIT,
	new_vc_vars : VAR_DECL list) : SUBUNIT = (
	{	zmod		=	zmod,
		specif_flag	=	specif_flag,
		specif		=	specif,
		in_scope	=	in_scope_vc_vars Nil (pfx_info, false) (in_scope, new_vc_vars),
		globs		=	globs
	}
);
=TEX
In the following function the renaming being made visible to the subunit cannot be in the private part of a package.
=SML
fun ⦏subunit_renamings⦎
	(pfx_info : PREFIX_INFO)
	 ({	zmod,
		specif_flag,
		specif,
		in_scope,
		globs
	} : SUBUNIT,
	renamings : (Z_ID * Z_ID OPT) list) : SUBUNIT = (
	{	zmod		=	zmod,
		specif_flag	=	specif_flag,
		specif		=	specif,
		in_scope	=	in_scope_renamings (pfx_info, false) (in_scope, renamings),
		globs		=	globs
	}
);
=TEX
In the following two functions the formal procedure being made visible to the subunit cannot be in the private part of a package.
=SML
fun ⦏subunit_formal_proc⦎
	(pfx_info : PREFIX_INFO)
	({	zmod,
		specif_flag,
		specif,
		in_scope,
		globs
	} : SUBUNIT,
	new_formal_proc : FORMAL_PROC) : SUBUNIT = (
	{	zmod		=	zmod,
		specif_flag	=	specif_flag,
		specif		=	specif,
		in_scope		= 	in_scope_formal_proc Nil (pfx_info, false) (in_scope, new_formal_proc),
		globs		=	globs
	}
);
=TEX
=SML
fun ⦏subunit_informal_proc⦎
	(pfx_info : PREFIX_INFO)
	({	zmod,
		specif_flag,
		specif,
		in_scope,
		globs
	} : SUBUNIT,
	new_informal_proc : ID) : SUBUNIT = (
	{	zmod		=	zmod,
		specif_flag	=	specif_flag,
		specif		=	specif,
		in_scope		= 	in_scope_informal_proc Nil (pfx_info, false) (in_scope, new_informal_proc),
		globs		=	globs
	}
);
=TEX
=SML
fun ⦏subunit_dec_labels⦎  (
	{	zmod,
		specif_flag,
		specif,
		in_scope as {dict, dec_labels},
		globs
	} : SUBUNIT,
	new_dec_labels : LABEL list) : SUBUNIT = (
	{	zmod		=	zmod,
		specif_flag	=	specif_flag,
		specif		=	specif,
		in_scope		= {
			dict		=	dict,
			dec_labels		=	new_dec_labels
		},
		globs		=	globs
	}
);
=TEX
=SML
fun ⦏declab_declabel_flag⦎  (
	{	block_name,
		flags as
			{pack_spec_flag, pack_body_flag, stub_flag,
			subunit_flag, formal_body_flag, fun_flag,
			declabel_flag, speclabel_flag,
			till_flag, body_flag, private_flag},
		using_decs,
		in_scope
	} : DECLAB,
	new_declabel_flag : FLAG) : DECLAB = (
	{	block_name	=	block_name,
		flags		=	{
			pack_spec_flag		=	pack_spec_flag	,
			pack_body_flag		=	pack_body_flag,
			stub_flag		=	stub_flag,
			subunit_flag		=	subunit_flag,
			formal_body_flag	=	formal_body_flag,
			fun_flag		=	fun_flag,
			declabel_flag		=	new_declabel_flag,
			speclabel_flag		=	speclabel_flag,
			till_flag		=	till_flag,
			body_flag		=	body_flag,
			private_flag		=	private_flag
		},
	 	using_decs = using_decs,
		in_scope	=	in_scope
	}
);
=TEX
=SML
fun ⦏declab_in_scope⦎
	({	block_name,
		flags,
		using_decs,
		in_scope
	} : DECLAB,
	new_in_scope : IN_SCOPE) : DECLAB = (
	{	block_name	=	block_name,
		flags		=	flags,
		using_decs	=	using_decs,
		in_scope	= new_in_scope
	}
);
=TEX
=SML
fun ⦏declab_vc_vars⦎
	(dicto : ENV_DICT OPT)
	(pfx_priv : PREFIX_INFO * bool)
	(declab as {in_scope, ...} : DECLAB,
	new_vc_vars : VAR_DECL list) : DECLAB = (
	declab_in_scope(declab,  in_scope_vc_vars dicto pfx_priv (in_scope, new_vc_vars))
);
=TEX
=SML
fun ⦏declab_renamings⦎
	(pfx_priv: PREFIX_INFO * bool)
	(declab as {in_scope, ...} : DECLAB,
	renamings : (Z_ID * Z_ID OPT) list) : DECLAB = (
	declab_in_scope(declab,  in_scope_renamings pfx_priv (in_scope, renamings))
);
=TEX
Again, in the following two functions the formal procedure being made visible to the subunit cannot be in the private part of a package.
=SML
fun ⦏declab_formal_proc⦎
	(pfx_info : PREFIX_INFO)
	(declab as {in_scope, ...} : DECLAB,
	new_formal_proc : FORMAL_PROC) : DECLAB = (
	declab_in_scope(declab,  in_scope_formal_proc Nil (pfx_info, false) (in_scope, new_formal_proc))
);
=TEX
=SML
fun ⦏declab_informal_proc⦎
	(pfx_info : PREFIX_INFO)
	(declab as {in_scope, ...} : DECLAB,
	new_informal_proc : ID) : DECLAB = (
	declab_in_scope(declab,  in_scope_informal_proc Nil (pfx_info, false) (in_scope, new_informal_proc))
);
=TEX
=SML
fun ⦏declab_dec_labels⦎
	(declab as {in_scope as {dict, dec_labels}, ...} : DECLAB,
	new_dec_labels : LABEL list) : DECLAB = (
	declab_in_scope(declab,  {
			dict			=	dict,
			dec_labels		=	new_dec_labels})
);
=TEX
=SML
fun ⦏declab_using_dec⦎  (
	{	block_name,
		flags,
		using_decs,
		in_scope as {dict, dec_labels}
	} : DECLAB,
	extra_using_dec : Z_ID * (VAR_DECL list * Z_PRED)) : DECLAB = (
	{	block_name	=	block_name,
		flags		=	flags,
		using_decs	=	using_decs @ [extra_using_dec],
		in_scope		= {
			dict			=	dict,
			dec_labels		=	dec_labels
		}
	}
);
=TEX
=SML
fun ⦏speclab_w⦎  (
	{spec as {w, w0, pre, post},
	formal_body_flag,
	fun_flag,
	till_flag,
	wp_env,
	in_scope,
	block_name
	} : SPECLAB,
	new_w : Z_ID list) : SPECLAB = (
	{spec 			=	{w = new_w, w0 = w0, pre = pre,
						post = post},
	formal_body_flag	=	formal_body_flag,
	fun_flag		=	fun_flag,
	till_flag		=	till_flag,
	wp_env			=	wp_env,
	in_scope		=	in_scope,
	block_name	=	block_name
	}
);
=TEX
Yet again, the private flag must be false in the following:
=SML
fun ⦏speclab_vc_vars⦎
	(pfx_info : PREFIX_INFO)
	({spec,
	formal_body_flag,
	fun_flag,
	till_flag,
	wp_env,
	in_scope,
	block_name
	} : SPECLAB,
	new_vc_vars : VAR_DECL list) : SPECLAB = (
	{spec 			=	spec,
	formal_body_flag	=	formal_body_flag,
	fun_flag		=	fun_flag,
	till_flag		=	till_flag,
	wp_env			=	wp_env,
	in_scope		=	in_scope_vc_vars Nil (pfx_info, false) (in_scope, new_vc_vars),
	block_name	=	block_name
	}
);
=TEX
and again, the private flag must be false in the following:
=SML
fun ⦏speclab_renamings⦎
	(pfx_info : PREFIX_INFO)
	({spec,
	formal_body_flag,
	fun_flag,
	till_flag,
	wp_env,
	in_scope,
	block_name
	} : SPECLAB,
	renamings : (Z_ID * Z_ID OPT)  list) : SPECLAB = (
	{spec 			=	spec,
	formal_body_flag	=	formal_body_flag,
	fun_flag		=	fun_flag,
	till_flag		=	till_flag,
	wp_env			=	wp_env,
	in_scope		=	in_scope_renamings (pfx_info, false) (in_scope, renamings),
	block_name	=	block_name
	}
);
=TEX
and again, the private flag must be false in the following two:
=SML
fun ⦏speclab_formal_proc⦎
	(pfx_info : PREFIX_INFO)
	({spec,
	formal_body_flag,
	fun_flag,
	till_flag,
	wp_env,
	in_scope,
	block_name
	} : SPECLAB,
	new_formal_proc : FORMAL_PROC) : SPECLAB = (
	{spec 			=	spec,
	formal_body_flag	=	formal_body_flag,
	fun_flag		=	fun_flag,
	till_flag		=	till_flag,
	wp_env			=	wp_env,
	in_scope		=	in_scope_formal_proc Nil (pfx_info, false) (in_scope, new_formal_proc),
	block_name	=	block_name
	}
);
=TEX
=SML
fun ⦏speclab_informal_proc⦎
	(pfx_info : PREFIX_INFO)
	({spec,
	formal_body_flag,
	fun_flag,
	till_flag,
	wp_env,
	in_scope,
	block_name
	} : SPECLAB,
	new_informal_proc : ID) : SPECLAB = (
	{spec 			=	spec,
	formal_body_flag	=	formal_body_flag,
	fun_flag		=	fun_flag,
	till_flag		=	till_flag,
	wp_env			=	wp_env,
	in_scope		=	in_scope_informal_proc Nil (pfx_info, false) (in_scope, new_informal_proc),
	block_name	=	block_name
	}
);
=TEX
=SML
fun ⦏speclab_dec_labels⦎  (
	{spec,
	formal_body_flag,
	fun_flag,
	till_flag,
	wp_env,
	in_scope as {dict, dec_labels},
	block_name
	} : SPECLAB,
	new_dec_labels : LABEL list) : SPECLAB = (
	{spec 			=	spec,
	formal_body_flag	=	formal_body_flag,
	fun_flag		=	fun_flag,
	till_flag		=	till_flag,
	wp_env			=	wp_env,
	in_scope		=	{
			dict		=	dict,
			dec_labels	=	new_dec_labels
		},
	block_name	=	block_name
	}
);
=TEX
=SML
fun ⦏speclab_pre⦎  (
	{spec as {w, w0, pre, post},
	formal_body_flag,
	fun_flag,
	till_flag,
	wp_env,
	in_scope,
	block_name
	} : SPECLAB,
	new_pre : Z_TM) : SPECLAB = (
	{spec 			=	{w = w, w0 = w0, pre = new_pre,
						post = post},
	formal_body_flag	=	formal_body_flag,
	fun_flag		=	fun_flag,
	till_flag		=	till_flag,
	wp_env			=	wp_env,
	in_scope		=	in_scope,
	block_name	=	block_name
	}
);
=TEX
=SML
fun ⦏speclab_in_scope⦎  (
	{spec,
	formal_body_flag,
	fun_flag,
	till_flag,
	wp_env,
	in_scope,
	block_name
	} : SPECLAB,
	new_in_scope : IN_SCOPE) : SPECLAB = (
	{spec 			=	spec,
	formal_body_flag	=	formal_body_flag,
	fun_flag		=	fun_flag,
	till_flag		=	till_flag,
	wp_env			=	wp_env,
	in_scope		=	new_in_scope,
	block_name	=	block_name
	}
);
=TEX
=SML
fun ⦏package_vc_vars⦎
	(pfx_priv as (pfx_info , private) : PREFIX_INFO * bool)
	({vc_vars, consts_types, formal_procs, informal_procs, informal_funs,
		formal_funs, aux_vars, obj_renamings, zmod, decl, local_dict, private_dict, with_dict}
	: PACKAGE,
	new_vc_vars : VAR_DECL list) : PACKAGE = (
	{	vc_vars				=	vc_vars @ new_vc_vars,
		consts_types			=	consts_types,
		formal_procs			=	formal_procs,
		informal_procs			=	informal_procs,
		informal_funs			=	informal_funs,
		formal_funs			=	formal_funs,
		aux_vars			=	aux_vars,
		obj_renamings			=	obj_renamings,
		zmod				=	zmod,
		decl				=	decl,
		local_dict				=	dict_vc_vars pfx_priv (local_dict, new_vc_vars),
		private_dict				=	(dict_vc_vars1 local_dict) pfx_priv (private_dict, new_vc_vars),
		with_dict				=	 if_public (dict_vc_vars1 local_dict) (with_pack_prefix_info pfx_info, private) (with_dict, new_vc_vars)
	}
);
=TEX
=SML
fun ⦏package_aux_vars⦎ (
	{vc_vars, consts_types, formal_procs, informal_procs, informal_funs,
		formal_funs, aux_vars, obj_renamings, zmod, decl, local_dict, private_dict, with_dict}
	: PACKAGE,
	new_aux_vars : Z_DECL list) : PACKAGE = (
	{	vc_vars				=	vc_vars,
		consts_types			=	consts_types,
		formal_procs			=	formal_procs,
		informal_procs			=	informal_procs,
		informal_funs			=	informal_funs,
		formal_funs			=	formal_funs,
		aux_vars			=	aux_vars @ new_aux_vars,
		obj_renamings			=	obj_renamings,
		zmod				=	zmod,
		decl				=	decl,
		local_dict				=	dict_vc_aux_vars(local_dict, new_aux_vars),
		private_dict				=	dict_vc_aux_vars(private_dict, new_aux_vars),
		with_dict				=	 dict_vc_aux_vars(with_dict, new_aux_vars)
	}
);
=TEX
=SML
fun ⦏package_formal_proc⦎
	(pfx_priv as (pfx_info, private) : PREFIX_INFO * bool)
	({vc_vars, consts_types, formal_procs, informal_procs, informal_funs,
		formal_funs, aux_vars, obj_renamings, zmod, decl, local_dict, private_dict, with_dict}
	: PACKAGE,
	new_formal_proc : FORMAL_PROC) : PACKAGE = (
	{	vc_vars				=	vc_vars,
		consts_types			=	consts_types,
		formal_procs			=	formal_procs @ [new_formal_proc],
		informal_procs			=	informal_procs,
		informal_funs			=	informal_funs,
		formal_funs			=	formal_funs,
		aux_vars			=	aux_vars,
		obj_renamings			=	obj_renamings,
		zmod				=	zmod,
		decl				=	decl,
		local_dict				=	dict_formal_proc pfx_priv (local_dict, new_formal_proc),
		private_dict				=	dict_formal_proc pfx_priv (private_dict, new_formal_proc),
		with_dict				=	 if_public dict_formal_proc (with_pack_prefix_info pfx_info, private) (with_dict, new_formal_proc)
	}
);
=TEX
=SML
fun ⦏package_informal_proc⦎
	(pfx_priv as (pfx_info, private) : PREFIX_INFO * bool)
	({vc_vars, consts_types, formal_procs, informal_procs, informal_funs,
		formal_funs, aux_vars, obj_renamings, zmod, decl, local_dict, private_dict, with_dict}
	: PACKAGE,
	new_informal_proc : ID) : PACKAGE = (
	{	vc_vars				=	vc_vars,
		consts_types			=	consts_types,
		formal_procs			=	formal_procs,
		informal_procs			=	informal_procs @ [new_informal_proc],
		informal_funs			=	informal_funs,
		formal_funs			=	formal_funs,
		aux_vars			=	aux_vars,
		obj_renamings			=	obj_renamings,
		zmod				=	zmod,
		decl				=	decl,
		local_dict				=	dict_informal_proc pfx_priv (local_dict, new_informal_proc),
		private_dict				=	dict_informal_proc pfx_priv (private_dict, new_informal_proc),
		with_dict				=	 if_public dict_informal_proc (with_pack_prefix_info pfx_info, private) (with_dict, new_informal_proc)
	}
);
=TEX
=SML
fun ⦏package_informal_fun⦎
	(pfx_priv as (pfx_info, private) : PREFIX_INFO * bool)
	({vc_vars, consts_types, formal_procs, informal_procs, informal_funs,
		formal_funs, aux_vars, obj_renamings, zmod, decl, local_dict, private_dict, with_dict}
	: PACKAGE,
	new_informal_fun : INFORMAL_FUN) : PACKAGE = (
	{	vc_vars				=	vc_vars,
		consts_types			=	consts_types,
		formal_procs			=	formal_procs,
		informal_procs			=	informal_procs,
		informal_funs			=	informal_funs @ [new_informal_fun],
		formal_funs			=	formal_funs,
		aux_vars			=	aux_vars,
		obj_renamings			=	obj_renamings,
		zmod				=	zmod,
		decl				=	decl,
		local_dict				=	dict_informal_fun pfx_priv (local_dict, new_informal_fun),
		private_dict				=	dict_informal_fun pfx_priv (private_dict, new_informal_fun),
		with_dict				=	 if_public dict_informal_fun (with_pack_prefix_info pfx_info, private) (with_dict, new_informal_fun)
	}
);
=TEX
=SML
fun ⦏package_formal_fun⦎
	(pfx_priv as (pfx_info, private) : PREFIX_INFO * bool)
	({vc_vars, consts_types, formal_procs, informal_procs, informal_funs,
		formal_funs, aux_vars, obj_renamings, zmod, decl, local_dict, private_dict, with_dict}
	: PACKAGE,
	new_formal_fun : FORMAL_FUN,
	renames : Z_ID OPT)
	: PACKAGE = (
	{	vc_vars				=	vc_vars,
		consts_types			=	consts_types,
		formal_procs			=	formal_procs,
		informal_procs			=	informal_procs,
		informal_funs			=	informal_funs,
		formal_funs			=	formal_funs @ [new_formal_fun],
		aux_vars			=	aux_vars,
		obj_renamings			=	obj_renamings,
		zmod				=	zmod,
		decl				=	decl,
		local_dict				=	dict_formal_fun pfx_priv (local_dict, (new_formal_fun, renames)),
		private_dict				=	dict_formal_fun pfx_priv (private_dict, (new_formal_fun, renames)),
		with_dict				=	 if_public dict_formal_fun (with_pack_prefix_info pfx_info, private) (with_dict, (new_formal_fun, renames))
	}
);
=TEX
=SML
fun ⦏package_obj_renaming⦎
	(pfx_priv as (pfx_info, private) : PREFIX_INFO * bool)
	({vc_vars, consts_types, formal_procs, informal_procs, informal_funs,
		formal_funs, aux_vars, obj_renamings, zmod, decl, local_dict, private_dict, with_dict}
	: PACKAGE,
	new_obj_renaming : Z_ID * Z_ID OPT) : PACKAGE = (
	{	vc_vars				=	vc_vars,
		consts_types			=	consts_types,
		formal_procs			=	formal_procs,
		informal_procs			=	informal_procs,
		informal_funs			=	informal_funs,
		formal_funs			=	formal_funs,
		aux_vars			=	aux_vars,
		obj_renamings			= obj_renamings @ [new_obj_renaming],
		zmod				=	zmod,
		decl				=	decl,
		local_dict				=	dict_renamings pfx_priv (local_dict, ([new_obj_renaming], local_dict)),
		private_dict				=	dict_renamings pfx_priv (private_dict, ([new_obj_renaming], local_dict)),
		with_dict				=	 if_public dict_renamings (with_pack_prefix_info pfx_info, private)  (with_dict, ([new_obj_renaming], local_dict))	}
);
=TEX
=SML
fun ⦏package_decl⦎ (
	{vc_vars, consts_types, formal_procs, informal_procs, informal_funs,
		formal_funs, aux_vars, obj_renamings, zmod, decl, local_dict, private_dict, with_dict}
	: PACKAGE,
	new_decl : CONTEXT_COMPILATION_UNIT) : PACKAGE = (
	{	vc_vars				=	vc_vars,
		consts_types			=	consts_types,
		formal_procs			=	formal_procs,
		informal_procs			=	informal_procs,
		informal_funs			=	informal_funs,
		formal_funs			=	formal_funs,
		aux_vars			=	aux_vars,
		obj_renamings			= obj_renamings,
		zmod				=	zmod,
		decl				=	new_decl,
		local_dict				=	local_dict,
		private_dict				=	private_dict,
		with_dict				=	with_dict
	}
);
=TEX
=SML
fun ⦏package_local_dict⦎ (
	{vc_vars, consts_types, formal_procs, informal_procs, informal_funs,
		formal_funs, aux_vars, obj_renamings, zmod, decl, local_dict, private_dict, with_dict}
	: PACKAGE,
	new_local_dict : ENV_DICT) : PACKAGE = (
	{	vc_vars				=	vc_vars,
		consts_types			=	consts_types,
		formal_procs			=	formal_procs,
		informal_procs			=	informal_procs,
		informal_funs			=	informal_funs,
		formal_funs			=	formal_funs,
		aux_vars			=	aux_vars,
		obj_renamings			= obj_renamings,
		zmod				=	zmod,
		decl				=	decl,
		local_dict				=	new_local_dict,
		private_dict				=	private_dict,
		with_dict				=	with_dict
	}
);
=TEX
=SML
fun ⦏block_declab⦎  (
	{
	declab,
	current_formal_proc,
	current_formal_fun,
	current_for_vars,
	current_log_cons,
	current_loop_name,
	dec_lab,
	spec_lab,
	till,
	var_inits
	} : BLOCK,
	new_declab : DECLAB) : BLOCK = (
	{declab		=	new_declab,
	current_formal_proc = current_formal_proc,
	current_formal_fun = current_formal_fun,
	current_for_vars = current_for_vars,
	current_log_cons = current_log_cons,
	current_loop_name = current_loop_name,
	dec_lab = dec_lab,
	spec_lab = spec_lab,
	till = till,
	var_inits = var_inits
	}
);
=TEX
=SML
fun ⦏block_flags⦎  (blk as
	{
	declab as {block_name,
		flags,
		using_decs,
		in_scope},
	...
	} : BLOCK,
	new_flags : FLAGS) : BLOCK = (
	block_declab(blk,
		{block_name = block_name,
		flags = new_flags,
		using_decs = using_decs,
		in_scope = in_scope})
);
=TEX
=SML
fun ⦏block_stub_flag⦎  (blk as
	{
	declab as {flags as
			{pack_spec_flag, pack_body_flag, stub_flag,
			subunit_flag, formal_body_flag, fun_flag,
			declabel_flag, speclabel_flag,
			till_flag, body_flag, private_flag},
		...},
	...
	} : BLOCK,
	new_stub_flag : FLAG) : BLOCK = (
	block_flags(blk,
		 {
			pack_spec_flag		=	pack_spec_flag	,
			pack_body_flag		=	pack_body_flag,
			stub_flag		=	new_stub_flag,
			subunit_flag		=	subunit_flag,
			formal_body_flag	=	formal_body_flag,
			fun_flag		=	fun_flag,
			declabel_flag		=	declabel_flag,
			speclabel_flag		=	speclabel_flag,
			till_flag		=	till_flag,
			body_flag		=	body_flag,
			private_flag		= private_flag
		})
);
=TEX
=SML
fun ⦏block_body_flag⦎  (blk as
	{
	declab as {flags as
			{pack_spec_flag, pack_body_flag, stub_flag,
			subunit_flag, formal_body_flag, fun_flag,
			declabel_flag, speclabel_flag,
			till_flag, body_flag, private_flag},
		...},
	...
	} : BLOCK,
	new_body_flag : FLAG) : BLOCK = (
	block_flags(blk,
		 {
			pack_spec_flag		=	pack_spec_flag	,
			pack_body_flag		=	pack_body_flag,
			stub_flag		=	stub_flag,
			subunit_flag		=	subunit_flag,
			formal_body_flag	=	formal_body_flag,
			fun_flag		=	fun_flag,
			declabel_flag		=	declabel_flag,
			speclabel_flag		=	speclabel_flag,
			till_flag		=	till_flag,
			body_flag		=	new_body_flag,
			private_flag		= private_flag
		})
);
=TEX
=SML
fun ⦏block_till_flag⦎  (blk as
	{
	declab as {flags as
			{pack_spec_flag, pack_body_flag, stub_flag,
			subunit_flag, formal_body_flag, fun_flag,
			declabel_flag, speclabel_flag,
			till_flag, body_flag, private_flag},
		...},
	...
	} : BLOCK,
	new_till_flag : FLAG) : BLOCK = (
	block_flags(blk,
		 {
			pack_spec_flag		=	pack_spec_flag	,
			pack_body_flag		=	pack_body_flag,
			stub_flag		=	stub_flag,
			subunit_flag		=	subunit_flag,
			formal_body_flag	=	formal_body_flag,
			fun_flag		=	fun_flag,
			declabel_flag		=	declabel_flag,
			speclabel_flag		=	speclabel_flag,
			till_flag		=	new_till_flag,
			body_flag		=	body_flag,
			private_flag		= private_flag
		}
	)
);
=TEX
=SML
fun ⦏block_in_scope⦎
	(blk as {declab, ...} : BLOCK,
	new_in_scope : IN_SCOPE) : BLOCK = (
	block_declab(blk,  declab_in_scope(declab, new_in_scope))
);
=TEX
=SML
fun ⦏block_formal_proc⦎
	(dicto : ENV_DICT OPT)
	(pfx_priv : PREFIX_INFO * bool)
	(blk as {declab as {in_scope, ...}, ...}: BLOCK,
	new_formal_proc : FORMAL_PROC) : BLOCK = (
	block_in_scope (blk, in_scope_formal_proc dicto pfx_priv (in_scope, new_formal_proc))
);
=TEX
=SML
fun ⦏block_informal_proc⦎  (dicto : ENV_DICT OPT)
	(pfx_priv : PREFIX_INFO * bool)
	(blk as {declab as {in_scope, ...}, ...}: BLOCK,
	new_informal_proc : ID) : BLOCK = (
	block_in_scope (blk, in_scope_informal_proc dicto pfx_priv (in_scope, new_informal_proc))
);
=TEX
=SML
fun ⦏block_dict⦎
	(blk as {declab as {in_scope, ...}, ...}: BLOCK,
	new_dict :ENV_DICT) : BLOCK = (
	block_in_scope (blk, in_scope_dict (in_scope, new_dict))
);
=TEX
=SML
fun ⦏block_vc_vars⦎
	(dicto : ENV_DICT OPT)
	(pfx_priv : PREFIX_INFO * bool)
	(blk as {declab, ...} : BLOCK, new_vc_vars : VAR_DECL list) : BLOCK = (
	block_declab (blk, declab_vc_vars dicto pfx_priv (declab, new_vc_vars))
);
=TEX
=SML
fun ⦏block_vc_pars⦎
	(dicto : ENV_DICT OPT)
	(pfx_info : PREFIX_INFO)
	(blk as {declab as {in_scope, ...}, ...} : BLOCK,
		new_vc_pars : PARAM_SPEC list) : BLOCK = (
	block_declab(blk,
		declab_in_scope(declab, in_scope_vc_pars dicto pfx_info (in_scope, new_vc_pars)))
);
=TEX
=SML
fun ⦏block_vc_aux_vars⦎
	 (dicto : ENV_DICT OPT)
	 (blk as {declab as {in_scope, ... }, ...} : BLOCK,
		new_vc_aux_vars : TERM list) : BLOCK = (
	block_declab(blk,
		declab_in_scope(declab, in_scope_vc_aux_vars dicto (in_scope, new_vc_aux_vars)))
);
=TEX
=SML
fun ⦏block_vc_log_cons⦎
	 (dicto : ENV_DICT OPT)
	 (blk as {declab as { in_scope, ... }, ...} : BLOCK,
		new_vc_log_cons : TERM list) : BLOCK = (
	block_declab(blk,
		declab_in_scope(declab, in_scope_vc_log_cons dicto (in_scope, new_vc_log_cons)))
);
=TEX
=SML
fun ⦏block_renamings⦎
	(pfx_priv : PREFIX_INFO * bool)
	 (blk as {declab as {in_scope, ... }, ...} : BLOCK,
		new_renamings : (Z_ID * Z_ID OPT) list) : BLOCK = (
	block_declab(blk,
		declab_in_scope(declab, in_scope_renamings pfx_priv (in_scope, new_renamings)))
);
=TEX
=SML
fun ⦏block_current_formal_proc⦎  (
	{declab,
	current_formal_proc,
	current_formal_fun,
	current_for_vars,
	current_log_cons,
	current_loop_name,
	dec_lab,
	spec_lab,
	till,
	var_inits} : BLOCK,
	new_current_formal_proc : FORMAL_PROC) : BLOCK = (
	{declab	 = declab,
	current_formal_proc = new_current_formal_proc,
	current_formal_fun = current_formal_fun,
	current_for_vars = current_for_vars,
	current_log_cons = current_log_cons,
	current_loop_name = current_loop_name,
	dec_lab = dec_lab,
	spec_lab = spec_lab,
	till = till,
	var_inits = var_inits
	}
);
=TEX
=SML
fun ⦏block_current_formal_fun⦎  (
	{declab,
	current_formal_proc,
	current_formal_fun,
	current_for_vars,
	current_log_cons,
	current_loop_name,
	dec_lab,
	spec_lab,
	till,
	var_inits} : BLOCK,
	new_current_formal_fun : FORMAL_FUN) : BLOCK = (
	{declab	 = declab,
	current_formal_proc = current_formal_proc,
	current_formal_fun = new_current_formal_fun,
	current_for_vars = current_for_vars,
	current_log_cons = current_log_cons,
	current_loop_name = current_loop_name,
	dec_lab = dec_lab,
	spec_lab = spec_lab,
	till = till,
	var_inits = var_inits
	}
);
=TEX
=SML
fun ⦏block_till⦎  (
	{declab,
	current_formal_proc,
	current_formal_fun,
	current_for_vars,
	current_log_cons,
	current_loop_name,
	dec_lab,
	spec_lab,
	till,
	var_inits} : BLOCK,
	new_till : Z_PRED) : BLOCK = (
	{declab	 = declab,
	current_formal_proc = current_formal_proc,
	current_formal_fun = current_formal_fun,
	current_for_vars = current_for_vars,
	current_log_cons = current_log_cons,
	current_loop_name = current_loop_name,
	dec_lab = dec_lab,
	spec_lab = spec_lab,
	till = new_till,
	var_inits = var_inits
	}
);
=TEX
The following just supports what is actually needed: adding an extra using declaration to the existing list.
=SML
fun ⦏block_using_dec⦎  (
	{declab,
	current_formal_proc,
	current_formal_fun,
	current_for_vars,
	current_log_cons,
	current_loop_name,
	dec_lab,
	spec_lab,
	till,
	var_inits} : BLOCK,
	extra_using_dec : Z_ID * (VAR_DECL list * Z_PRED)) : BLOCK = (
	{declab	 = declab_using_dec(declab, extra_using_dec),
	current_formal_proc = current_formal_proc,
	current_formal_fun = current_formal_fun,
	current_for_vars = current_for_vars,
	current_log_cons = current_log_cons,
	current_loop_name = current_loop_name,
	dec_lab = dec_lab,
	spec_lab = spec_lab,
	till = till,
	var_inits = var_inits
	}
);
=TEX
=SML
fun ⦏block_var_inits⦎  (
	{declab,
	current_formal_proc,
	current_formal_fun,
	current_for_vars,
	current_log_cons,
	current_loop_name,
	dec_lab,
	spec_lab,
	till,
	var_inits} : BLOCK,
	new_var_inits : (EXP * TMARK) S_DICT) : BLOCK = (
	{declab	 = declab,
	current_formal_proc = current_formal_proc,
	current_formal_fun = current_formal_fun,
	current_for_vars = current_for_vars,
	current_log_cons = current_log_cons,
	current_loop_name = current_loop_name,
	dec_lab = dec_lab,
	spec_lab = spec_lab,
	till = till,
	var_inits = new_var_inits
	}
);
=TEX
=SML
fun ⦏block_spec_lab⦎  (
	{
	declab,
	current_formal_proc,
	current_formal_fun,
	current_for_vars,
	current_log_cons,
	current_loop_name,
	dec_lab,
	spec_lab,
	till,
	var_inits
	} : BLOCK,
	new_spec_lab : LABEL) : BLOCK = (
	{declab		=	declab,
	current_formal_proc = current_formal_proc,
	current_formal_fun = current_formal_fun,
	current_for_vars = current_for_vars,
	current_log_cons = current_log_cons,
	current_loop_name = current_loop_name,
	dec_lab = dec_lab,
	spec_lab = new_spec_lab,
	till = till,
	var_inits = var_inits
	}
);
=TEX
=SML
fun ⦏block_block_name⦎  (blk as
	{
	declab as {block_name,
		flags,
		using_decs,
		in_scope},
	...
	} : BLOCK,
	new_block_name : ID OPT list) : BLOCK = (
	block_declab(blk,
		{block_name = new_block_name,
				flags = flags,
				using_decs = using_decs,
				in_scope = in_scope})
);
=TEX
=SML
fun ⦏block_dec_labels⦎  (blk as
	{
	declab as {block_name,
		flags,
		using_decs,
		in_scope as {dict, dec_labels}},
	...
	} : BLOCK,
	new_dec_labels : LABEL list) : BLOCK = (
	block_declab(blk,
		{block_name = block_name,
				flags = flags,
				using_decs = using_decs,
				in_scope = {
			dict		=	dict,
			dec_labels	=	new_dec_labels
				}})
);
=TEX
=SML
fun ⦏block_current_for_vars⦎  (
	{
	declab,
	current_formal_proc,
	current_formal_fun,
	current_for_vars,
	current_log_cons,
	current_loop_name,
	dec_lab,
	spec_lab,
	till,
	var_inits
	} : BLOCK,
	new_current_for_vars : PARAM_SPEC list) : BLOCK = (
	{declab	 = declab,
	current_formal_proc = current_formal_proc,
	current_formal_fun = current_formal_fun,
	current_for_vars = new_current_for_vars,
	current_log_cons = current_log_cons,
	current_loop_name = current_loop_name,
	dec_lab = dec_lab,
	spec_lab = spec_lab,
	till = till,
	var_inits = var_inits
	}
);
=TEX
=SML
fun ⦏block_current_log_cons⦎  (
	{
	declab,
	current_formal_proc,
	current_formal_fun,
	current_for_vars,
	current_log_cons,
	current_loop_name,
	dec_lab,
	spec_lab,
	till,
	var_inits
	} : BLOCK,
	new_current_log_cons : Z_DECL list) : BLOCK = (
	{declab	 = declab,
	current_formal_proc = current_formal_proc,
	current_formal_fun = current_formal_fun,
	current_for_vars = current_for_vars,
	current_log_cons = new_current_log_cons,
	current_loop_name = current_loop_name,
	dec_lab = dec_lab,
	spec_lab = spec_lab,
	till = till,
	var_inits = var_inits
	}
);
=TEX
=SML
fun ⦏block_current_loop_name⦎  (
	{
	declab,
	current_formal_proc,
	current_formal_fun,
	current_for_vars,
	current_log_cons,
	current_loop_name,
	dec_lab,
	spec_lab,
	till,
	var_inits
	} : BLOCK,
	new_current_loop_name : ID OPT) : BLOCK = (
	{declab	 = declab,
	current_formal_proc = current_formal_proc,
	current_formal_fun = current_formal_fun,
	current_for_vars = current_for_vars,
	current_log_cons = current_log_cons,
	current_loop_name = new_current_loop_name,
	dec_lab = dec_lab,
	spec_lab = spec_lab,
	till = till,
	var_inits = var_inits
	}
);
=TEX
\subsection{Error Management}
=SML
val ⦏cn_stop_on_exceptions⦎ : bool ref = ref true;
val _ = new_flag{
	name="cn_stop_on_exceptions",
	check=fun_true,
	control=cn_stop_on_exceptions,
	default=fun_true} handle Fail _ => ();
type ⦏CN_EXCEPTION_LOG⦎ = string list S_DICT;
val ⦏exception_log⦎ : CN_EXCEPTION_LOG ref = ref initial_s_dict;
val ⦏exception_handled⦎ : bool ref = ref false;
=TEX
In the following, the special first two clauses are for SML/NJ (for which {\it string\_of\_exn} loses information).
=SML
fun ⦏text_of_exn⦎ (Fail msg : exn) : string = get_message msg
|   text_of_exn (Error msg) = get_message msg
|  text_of_exn ex = string_of_exn ex;
=TEX
=SML
fun ⦏log_message⦎ (msg : string)  : unit = (
	exception_log :=
	s_enter (!script_name)
	(case s_lookup (!script_name) (!exception_log) of
		Value msgs => msg::msgs
	|	Nil => [msg])
	(!exception_log)
);
=TEX
=SML
fun ⦏log_exception⦎ (ex : exn)  : string = (
	let	val msg1 = text_of_exn ex;
		val msg2 = get_error_message 507101 [ msg1];
	in	log_message msg2;
		msg2
	end
);
=TEX
=SML
fun ⦏check_fail⦎  (default : 'b) (f : 'a -> 'b) (x  : 'a) = (
	let	val saved_env = !blocks;
	in	f x handle ex as Fail _ => (
			let	val msg = log_exception ex;
			in	if	!cn_stop_on_exceptions
				then	raise ex
				else	(
					exception_handled := true;
					diag_line msg;
					blocks := saved_env;
					default)
			end
		)
	end
);
=TEX
=SML
fun ⦏cn_soundness_warning⦎ (area : string) (msg_no : int) (inserters : (unit -> string) list) : unit = (
	let	val msg1 = get_error_message msg_no (map (fn f => f()) inserters);
		val msg2 = get_error_message 507100 [string_of_int msg_no, area, msg1];
	in	log_message msg2;
		diag_line msg2
	end
);
=TEX
=SML
fun ⦏get_exception_logs⦎ (() : unit) : CN_EXCEPTION_LOG = !exception_log;
=TEX
=SML
fun ⦏delete_exception_log⦎ (script : string) : unit = (
	exception_log := !exception_log drop (fn (k, _) => k = script)
);
=TEX
\subsection{Accessing the Running Environment}
The function $block$ below implements the 1-based indexing of the running environment which is such a common feature of the Z spec.
=SML
fun ⦏block⦎ (index : int) : BLOCK = (
	(nth (index - 1) (!blocks))
	handle Fail _ => error "block" 507006 []
);
=TEX
The following function is convenient for accessing the flags in the running environment.
The first parameter is the functions to extract the flag value: it will always be one of the ML built-in selection functions, $\#pack\_spec\_flag$ etc.
The second parameter gives the block to get the flag from: with $1$ identifying the topmost block.
=SML
fun ⦏test_flag⦎ (selector : FLAGS -> bool) (index : int) : bool = (
	(selector o #flags o #declab o block) index
);
=TEX
The specification does not specify the block name to be used in the bottom block in the running environment.
It is convenient to use this to tell the code which stores VCs the name of the current web clause.
The following two functions assist in this.
=SML
fun ⦏set_bottom_block_name⦎ (n : ID) : unit = (
	let	fun aux [] = [block_block_name(empty_block, [Value n])]
		|   aux [blk] = [block_block_name(blk, [Value n])]
		|   aux (blk :: more) = blk :: aux more;
	in	blocks := aux (!blocks)
	end
);
=TEX
=SML
fun ⦏get_bottom_block_name⦎ (() : unit) : ID = (
	let	fun aux [] = ""
		|   aux [{declab = {block_name as [Value n], ...}, ...} :BLOCK] = n
		|   aux [{declab = {block_name as _, ...}, ...} :BLOCK] = ""
		|   aux (blk :: more) = aux more;
	in	aux (!blocks)
	end
);
=TEX
=SML
val ⦏empty_prefix_info⦎ : PREFIX_INFO = {canon = [], aliases = []};
=TEX
=SML
fun ⦏full_block_name⦎ (ns : ID OPT list) : ID list = (
	map  (fn Value n => n | Nil => "") ns
);
=TEX
=SML
fun ⦏ada_block_name⦎ (ns : ID OPT list) : ID list = (
	let	fun aux acc [] = map force_value acc
		|   aux acc (Nil :: more) = aux more more
		|   aux acc (Value _ :: more) = aux acc more;
	in	aux ns ns
	end
);
=TEX
=SML
fun ⦏pack_spec_prefix_info⦎ (pack_name : ID OPT list) : PREFIX_INFO = (
	let	val canon = map trans_id (ada_block_name pack_name);
		val aliases = [] :: suffixes canon;
	in	{canon = canon, aliases = aliases}
	end
);
=TEX
=SML
fun ⦏body_prefix_info⦎ (pack_name : ID OPT list) : PREFIX_INFO = (
	let	val base = map trans_id (ada_block_name pack_name);
		val aliases = base :: suffixes base;
	in	{canon = [], aliases = aliases}
	end
);
=TEX
=SML
fun ⦏current_prefix_info⦎ (n  : int) : PREFIX_INFO = (
	if	test_flag #pack_spec_flag n
	then	let	val pack = #block_name(#declab (block n));
		in	pack_spec_prefix_info pack
		end
	else if	test_flag #body_flag n
	then	let	val block_name = #block_name(#declab (block n));
		in	body_prefix_info block_name
		end
	else	empty_prefix_info
);
=TEX
=SML
fun ⦏find_pack_spec_prefix_info⦎ (():unit) : PREFIX_INFO = (
	let	fun aux [] = empty_prefix_info
		|   aux (blk as {declab as {block_name, flags, ...}, ...}
			:: blks : ENV) = (
			if	#pack_spec_flag flags
			then	pack_spec_prefix_info block_name
			else	aux blks
		);
	in	aux (!blocks)
	end
);
=TEX
=SML
fun ⦏simple_name⦎ ([] : ID OPT list) : ID = ""
|   simple_name [Value n] = n
|   simple_name (_::more) = simple_name more;
=TEX
=SML
fun ⦏expanded_name⦎ (ns : ID OPT list) : Z_ID = (
	format_list (fn Value n => n | Nil => "") ns "o"
);
=TEX
\subsection{$flatten\_env$}
To implement $flatten\_env$, we first need the function to combine two $IN\_SCOPE$s.
Since the environment dictionaries in the top-most block of the running environment includes the information from all lower blocks, we have only to collect together the declaration labels: the dictionary is just taken from the second block, which is expected to be the upper one.

To restrict the scope of frame widening, the block names are also passed in and $dec\_labels$ are not taken from the second $IN\_SCOPE$ when the two block names are different.

The treatment of the using declarations is the obvious one, but this is not relevant in the current usage of this function.
=SML
fun ⦏merge_declabs⦎
	(block_name1 : ID OPT list)
	({	dict=dict1,
		dec_labels = dec_labels1} : IN_SCOPE)
	(block_name2 : ID OPT list)
	({	dict = _,
		dec_labels = dec_labels2} : IN_SCOPE) : IN_SCOPE = (
	{	dict = dict1,
		dec_labels =
		if block_name1 = block_name2
		then dec_labels1 cup dec_labels2
		else dec_labels1
	}
);
=TEX
We also need a function to extract the name and global dependency list of
the current formal subprogram:
=SML
fun ⦏subprog_info⦎ (block : BLOCK) : ID * Z_ID list= (
	if	#fun_flag (#flags (#declab block))
	then	let	val formal_fun = #current_formal_fun block;
		in	(#name (#informal_fun(formal_fun)), #globals formal_fun)
		end
	else	let	val formal_proc = #current_formal_proc block;
			val globs = #globals formal_proc;
			val w = #w(#spec formal_proc);
		in	(#name formal_proc, globs @ w)
		end
);
=TEX
Now we define $flatten\_env$, which uses $merge\_in\_scopes$ to merge all the $in\_scope$ components of the blocks in a running environment.

=SML
fun ⦏flatten_env⦎ ([] : ENV) : IN_SCOPE = (
	empty_in_scope
) |  flatten_env [blk] = (
	#in_scope(#declab blk)
) |  flatten_env (blk1 :: (blks as (blk2 :: _))) = (
	merge_declabs
	(#block_name (#declab blk1))
	(#in_scope (#declab blk1))
	(#block_name  (#declab blk2))
	(flatten_env blks)
);
=TEX
Now we define $subprog\_flatten\_env$: the $filter\_XXX$ functions implement
the set comprehensions in the specification, with $filter_env$ fitting
the results together into an $IN\_SCOPE$.
=TEX
=SML
fun ⦏expand_schema_sigs⦎ (ns : Z_ID list) : Z_ID list = (
	let	fun aux n = (
			((map fst o dest_z_schema_type o dest_z_power_type o
			force_value o get_const_type) (hol_const_name n))
			handle Fail _ => [n]
		);
	in	flat (map aux ns)
	end
);
=SML
fun ⦏subprog_flatten_env_aux⦎ (_ : ID, _ : Z_ID list) ([] : ENV) : IN_SCOPE = (
	empty_in_scope
) |  subprog_flatten_env_aux (name, globals1) (blocks as (block1 ::_)) = (
	let	fun aux1 acc (b::bs:ENV) = (
			if simple_name(#block_name(#declab b)) <> name
			then rev acc
			else aux1 (b::acc) bs
		) | aux1 acc [] = rev acc;
		fun aux2 acc (b::bs:ENV) = (
			if simple_name(#block_name(#declab b)) = name
			then aux1 (b::acc) bs
			else aux2 (b::acc) bs
		) | aux2 acc [] = rev acc;
		val blocks2 = aux2 [] blocks;
		val {dict, dec_labels} = flatten_env blocks2;
		val {vc_vars, vc_pars, vc_aux_vars, vc_log_cons} = get_local_vars dict;
		val globals = expand_schema_sigs globals1;
		val cn_scope =
			globals cup
			vc_vars cup
			vc_pars cup
			vc_aux_vars cup
			vc_log_cons;
	in	{dict = set_cn_scope dict cn_scope,
		dec_labels = dec_labels}
	end
);
=TEX
=SML
fun ⦏subprog_flatten_env⦎ ([] : ENV) : IN_SCOPE = (
	empty_in_scope
) |  subprog_flatten_env (blocks : ENV) = (
	let	val block1 = hd blocks;
		val flags = #flags (#declab block1);
	in	if	not(#formal_body_flag flags)
		then	flatten_env blocks
		else	subprog_flatten_env_aux (subprog_info block1) blocks
	end
);
=TEX
\subsection{Theory User Data}
The so-called user data part of a ProofPower theory is used to hold various information about the literate scripts which have been or are being processed.
We collect together here those parts of the code concerned with this which do not depend on later material.

The following are some if the user data keys reserved for the Compliance Tool.
(Others are defined in the Z output module).
=SML
val ⦏cn_script_library_theories_ud_key⦎ = "CN'script_library_theories";
val ⦏cn_created_ud_key⦎ = "CN'created";
val ⦏cn_compilation_unit_ud_key⦎ = "CN'compilation_unit";
val ⦏cn_vc_context_and_origin_key⦎ = "CN'vc_context_origin";
val ⦏cn_stub_script_name_key⦎ = "CN'cn_stub_script_name";
val ⦏cn_continuation_script_key⦎ = "CN'cn_continuation_script_key";
=TEX

The following functions to open out theory user data
are used in several places;
callers must handle the exception they can raise.

=SML
fun ⦏dest_ud_string⦎ (UD_String (n, uds)) = (n, uds)
|   dest_ud_string _ = fail "" 0 [] (* Caller MUST catch this *);
=TEX
=SML
fun ⦏dest_ud_int⦎ (UD_Int (n, uds)) = (n, uds)
|   dest_ud_int _ = fail "" 0 [] (* Caller MUST catch this *);
=TEX
=SML
fun ⦏dest_ud_term⦎ (UD_Term (n, uds)) = (n, uds)
|   dest_ud_term _ = fail "" 0 [] (* Caller MUST catch this *);
=TEX

The following function updates the user data for the current theory.  Given a user data key and an item of data it retrieves any data currently stored under that key, adds the new data to it and then stores the result under the key.

=SML
fun ⦏update_user_datum⦎ (key : string) (xs : USER_DATUM) =
let
    val old_datum = (snd o dest_ud_string o get_user_datum "-")
					key handle Fail _ => [];
    val new_datum = xs::old_datum;
in
    set_user_datum(key, UD_String ("",new_datum))
end;
=TEX
The following sets a user data flag to indicate that the theory
was created by the compliance notation tool (e.g. by $new\_script$,
or perhaps as a stub or other supporting theory).
=SML
fun ⦏set_cn_theory⦎ () : unit = (
	set_user_datum (cn_created_ud_key, UD_String("CN created",[]))
);
=TEX
And the following checks for the flag:
=SML
fun ⦏is_cn_theory⦎ (thy : string) : bool = (
	(get_user_datum thy cn_created_ud_key; true)
	handle (Fail _) => false
);
=TEX
The following should be used when about to add material for
a compilation unit to a theory.
It raised a failure if a different compilation unit has already used the theory.
This function implements check 17.
The name is stored for the purposes of this check and to use
in the error message.
=SML
fun ⦏set_compilation_unit⦎ (cu_name: string, tag : string) : unit = (
let	val dummy = if (is_cn_theory "-")
			then ()
			else fail "check17" 507056 [fn () => cu_name,
				fn () => get_current_theory_name()];
	val (was, _) = dest_ud_string(get_user_datum "-"
				 cn_compilation_unit_ud_key)
			handle Fail _ => ("" ,[]);
	val exp_thyn = cu_name ^ tag;
	val act_thyn = get_current_theory_name ();
	val _ =
		if	was <> ""
		then	fail "check17" 507045 [fn () => cu_name,
			fn () => act_thyn,
			fn () => was]
		else if	exp_thyn <> act_thyn
		then	fail "do_web_clause" 507138 [
				fn () => act_thyn,
				fn () => exp_thyn]
		else	();
in	set_user_datum(cn_compilation_unit_ud_key, UD_String (act_thyn ,[]))
end);
=TEX
The following is necessary when the key has been set incorrectly.
In particular, $duplicate\_theory$ copies keys, which is not helpful
in this case.
To support script deletion, we remember the name of the theory in which the stub which
gave rise to the duplicate came from.
=SML
fun ⦏set_duplicate_keys⦎ (cu_name: string, stub_script_name) : unit = (
	set_user_datum(cn_compilation_unit_ud_key, UD_String (cu_name,[]));
	set_user_datum(cn_stub_script_name_key, UD_String (stub_script_name,[]))
);
=TEX
=SML
fun ⦏get_stub_script_name⦎ (thy: string) : string OPT = (
	Value(fst(dest_ud_string(get_user_datum thy cn_stub_script_name_key)))
	handle Fail _ => Nil
);
=TEX
=SML
fun ⦏set_continuation_flag⦎ (flag : bool) : unit = (
	set_user_datum(cn_continuation_script_key, UD_Int (if flag then 1 else 0, []))
);
=TEX
=SML
fun ⦏get_continuation_flag⦎ (thy: string) : bool = (
	fst(dest_ud_int(get_user_datum thy cn_continuation_script_key)) = 1
	handle Fail _ => false
);
=TEX
The following functions are used to maintain the list of library theories ``belonging'' to the current literate script.
=SML
fun ⦏get_library_theories⦎ (thy : string) : string list = (
	(map (fst o dest_ud_string) o snd o dest_ud_string o get_user_datum thy)
	cn_script_library_theories_ud_key
	handle Fail _ => []
);
=TEX
=SML
fun ⦏add_library_theory⦎ (thy : string) : unit = (
	do_in_theory (!script_name)
	(fn () => update_user_datum cn_script_library_theories_ud_key
			(UD_String(thy, []))) ()
);
=TEX

The next function adds a new parent to the current theory, and makes an entry of this fact in the current theory's user data.
If $allow\_fail$ is true, the function will not raise $Fail$: if the attempt to add the parent fails then the exception is caught and the error message is output as part of a comment.
=SML
fun ⦏new_parent_aux⦎ (allow_fail : bool) (thy : string) : unit = (
	if	not (thy mem get_parents "-")
	then	(	new_parent thy;
			update_user_datum cn_new_parent_ud_key
				(UD_String(thy, [UD_Int (current_level(),[])])) )
		handle ex as (Fail msg) =>
		if allow_fail
		then	 (
			if	thy mem get_descendants "min"
			then	comment "new_parent_aux" 507034
					[fn () => thy,
					 get_current_theory_name,
					fn () => get_message msg]
			else	comment "new_parent_aux" 507035
					[fn () => thy, get_current_theory_name]
		) else	reraise ex "new_parent_aux"
	else	()
);
=TEX
The following function creates a new theory (with a given list of theories to be made parents in addition to the current theory) and tries to make sure
it has the current cache theory in its ancestry. This circumvents
a misfeature in versions of ProofPower up to and including 0.5.
=SML
fun ⦏new_theory_aux⦎ (parents : string list) (thy : string) : unit = (
	new_theory thy;
	(case get_cache_theories () of
		cthy :: _ => (
			if	not(cthy mem get_ancestors thy)
			then	new_parent_aux true cthy
			else	()
	) | 	_ => ());
	map (new_parent_aux true) parents;
	()
);
=TEX
\subsection{ProofPower Type Inference Context}
=TEX
=SML
fun ⦏ti_context_of_in_scope⦎ (inscope : IN_SCOPE) : TYPE E_DICT = (
	ti_context_of_env_dict (#dict inscope)
);
=TEX
=SML
fun ⦏ti_context_of_subunit⦎ (subunit : SUBUNIT) : TYPE E_DICT = (
	ti_context_of_in_scope (#in_scope subunit)
);
=TEX
=SML
fun ⦏ti_context_of_declab⦎ (declab : DECLAB) :TYPE E_DICT = (
	ti_context_of_in_scope (#in_scope declab)
);
=TEX
=SML
fun ⦏ti_context_of_speclab⦎ (speclab : SPECLAB) : TYPE E_DICT = (
	if	#formal_body_flag speclab andalso #fun_flag speclab
	then	let 	val cxt = ti_context_of_in_scope (#in_scope speclab);
			val env = cn_env_of_in_scope (#in_scope speclab);
			val inf_fun = #fun_header(#wp_env speclab);
			val form_fun = {
				informal_fun = inf_fun,
				spec = dummy_spec,
				globals	 =
				case env (trans_id (#name inf_fun)) of
					Value{info =EIEnvFunction {deps = gs, ...}, ...} => gs
				|	_ =>
					fail "ti_context_of_speclab" 508081 [fn()=> #name inf_fun]};
		in	list_e_enter cxt (map dest_var(frees(fun_decl env form_fun)))
		end
	else	ti_context_of_in_scope (#in_scope speclab)
);
=TEX
=SML
fun ⦏ti_context_of_block⦎ (block : BLOCK) : TYPE E_DICT = (
	ti_context_of_declab (#declab block)
);
=TEX
=SML
fun ⦏current_ti_context⦎ (() : unit) : TYPE E_DICT = (
	ti_context_of_block (block 1)
);
=TEX
=SML
fun ⦏set_current_ti_context⦎ (ts : TERM list) : unit = (
	e_set_ti_context
	(list_e_enter (current_ti_context()) (map dest_var(flat(map frees ts))))
);
=TEX
=SML
fun ⦏set_in_scope_ti_context⦎ (in_scope : IN_SCOPE) : unit = (
	e_set_ti_context(ti_context_of_in_scope in_scope)
);
=TEX
=SML
fun ⦏set_in_scope_ti_context1⦎ (in_scope : IN_SCOPE, extras : TERM list) : unit = (
	e_set_ti_context(
		list_e_enter(ti_context_of_in_scope in_scope)
			(map dest_var (flat (map frees extras))))
);
=TEX
The following is used to add the typing context for a parameter list into the context temporarily. It returns the context which should be restored when the parameters are no longer needed.
In order to reuse earler code for handling the parameter specifications, we need to process
them using an IN\_SCOPE that contains all the type marks that may appear in them.
However, we don't want to flatten out the resulting type inference context, but only to add the entries for the parameters into it (if this is done in a context where the Z types are out of scope, caller is doomed in any case).
Hence we build a new efficient context for the parameters (and anything else that it's in the running environment) and then look the parameters up in it and add them to the new context that we are going to set up.
=SML
fun ⦏add_params_ti_context⦎ (pars : PARAM_SPEC list) : TYPE E_DICT = (
	let	val old_cxt = e_get_ti_context();
		val par_cxt = ti_context_of_in_scope (in_scope_vc_pars Nil (current_prefix_info 1)
				(#in_scope(#declab(block 1)), pars));
		val z_ids = map trans_id (flat (map (#vars o #var_decl) pars));
		fun aux acc (z_id ::more) = (
			case e_lookup z_id par_cxt of
				Value ty => aux (e_enter z_id ty acc) more
			|	Nil => aux acc more
		)  |  aux acc [] = acc;
		val new_cxt = aux old_cxt z_ids;
		val _ = e_set_ti_context new_cxt;
	in	old_cxt
	end
);
=TEX
=SML
fun ⦏z_names_of_z_dec⦎ (zd : Z_DECL) : Z_ID list = (
	(map (fn (x,_,_) => x) o map dest_z_lvar
				o fst o dest_z_dec) zd
			handle _ => fail "z_names_of_z_dec" 507033 []
);
=TEX

\subsection{Updating the Z Theory Database}
{\em open\_theory} has been highly optimised since the Compliance Tool was first implemented, but the following additional optimisation is retained:
=SML
fun ⦏lazy_open_theory⦎ (thy : string) : unit = (
	if	thy = "-" orelse thy = get_current_theory_name()
	then	()
	else	open_theory thy
);
=TEX
We first describe the addition of context and origin for VCs and then
the addition of the VCs themselves.

\subsubsection{Adding VC Context and Origin}
The VC context and origin are described by user data according to this abstract syntax ( where
\texttt{ROUTE} is actually \texttt{TERM}):

\begin{tabular}{ll}
rcud::	&	UDInt(1) [rud, cud]\\
rud::	&	UDInt(2)  pair(vcname, route) list\\
pair('a,'b)::&	UDInt(3) ['a,'b]\\
vcname::	 &	UDString(name) []\\
route::   &       pair(block\_names, route\_elems)\\
block\_names:: & 	vcnames \\
route\_elems::  & 	UDTerm(  ROUTE ) [])\\
VRElsfInd:: &	UDInt(constructor\_number) []\\
int::	&	UDInt(int) []\\
Z\_STRING:: &       UDString(string) []\\
&\\
cud::& 		UDInt(8) pair(vcnames,cud\_elem) list\\
vcnames::&  	UDInt(9) string list\\
cud\_elem::&	UDInt(5)[w,pre,post,till,return,named\_tills,vcg\_ctxt]\\
w::&		UDInt(6) string list\\
string::	&	UDString(string) []\\
term::	&	UDTerm(term) []\\
pre::	&	term\\
post::   &	term\\
till::	&	term\\
return::	 &	term\\
named\_tills::&	UDInt(7) pair(string,till) list\\
vcg\_ctxt:: &  UDInt(4) [ vcg\_val ]\\
\end{tabular}

=SML
val  ⦏vcco_rc⦎ = 1;
val  ⦏vcco_rud⦎ = 2;
val  ⦏vcco_pair⦎ = 3;
val  ⦏vcco_route⦎ = 4;
val  ⦏vcco_cud_elem⦎ = 5;
val  ⦏vcco_w⦎ = 6;
val  ⦏vcco_ntills⦎ = 7;
val  ⦏vcco_cud⦎ = 8;
val  ⦏vcco_names⦎ = 9;
val  ⦏vcco_elsf_true⦎ = 21;
val  ⦏vcco_elsf_false⦎ = 22;
val  ⦏vcco_any⦎ = 30;
val  ⦏vcco_null⦎ = 31;
val  ⦏vcco_assign⦎ = 32;
val  ⦏vcco_spec_via⦎ = 33;
val  ⦏vcco_spec_to_side⦎ = 34;
val  ⦏vcco_spec_pre_intro⦎ = 135;
val  ⦏vcco_semi⦎ =36;
val  ⦏vcco_end_semi⦎ = 37;
val  ⦏vcco_if_then⦎ = 38;
val  ⦏vcco_if_else⦎ = 39;
val  ⦏vcco_end_if⦎ = 40;
val  ⦏vcco_case_branch⦎ = 41;
val  ⦏vcco_case_others⦎ = 42;
val  ⦏vcco_end_case⦎ = 43;
val  ⦏vcco_loop_undec_via⦎ = 44;
val  ⦏vcco_loop_undec_pre_intro⦎ = 145;
val  ⦏vcco_loop_undec_pre_to_side⦎ = 146;
val  ⦏vcco_loop_undec_to_side⦎ = 47;
val  ⦏vcco_while_via⦎ = 48;
val  ⦏vcco_while_pre_intro⦎ = 149;
val  ⦏vcco_while_wp_to_side⦎ = 50;
val  ⦏vcco_while_to_side⦎ = 51;
val  ⦏vcco_for_via⦎ = 52;
val  ⦏vcco_for_pre_intro⦎ = 153;
val  ⦏vcco_for_pre_to_side⦎ = 154;
val  ⦏vcco_for_to_side⦎ = 55;
val  ⦏vcco_for_exit_to_side⦎ = 56;
val  ⦏vcco_exit_till_intro⦎ = 157;
val  ⦏vcco_exit_via⦎ = 58;
val  ⦏vcco_return_intro⦎ = 159;
val  ⦏vcco_proc_call⦎ = 60;
val  ⦏vcco_proc_call_end⦎ = 61;
val  ⦏vcco_proc_call_rng_intro⦎ = 162;
val  ⦏vcco_log_con_to_side⦎ = 63;
val  ⦏vcco_log_con_pre_intro⦎ = 164;
val  ⦏vcco_log_con_type_mem_intro⦎ = 165;
val  ⦏vcco_refinement_begin⦎ = 66;
val  ⦏vcco_refinement_intro⦎ = 167;
val  ⦏vcco_intros⦎ = 100;
=TEX
We introduce a data type to represent the constructs of this in the same sense as
\textit{\slshape dest\_z\_term} in HOL Z.
=SML
type ⦏VCCO_CONTEXT_TYPE⦎ = (USER_DATUM * USER_DATUM * USER_DATUM *
				USER_DATUM * USER_DATUM * USER_DATUM) OPT *
				USER_DATUM ;
=TEX
=SML
datatype ⦏VCCO_TERM⦎ =
		⦏VT_rcud⦎ of USER_DATUM * USER_DATUM 		(* 1 *)
	|	⦏VT_rud⦎ of USER_DATUM list			(* 2 *)
	|	⦏VT_pair⦎ of USER_DATUM * USER_DATUM		(* 3 *)
	|	⦏VT_name⦎ of string				(* UD_String *)
	|	⦏VT_vcnames⦎ of USER_DATUM list		(* 9 *)
	|	⦏VT_term⦎ of TERM				(* UD_Term *)
	|	⦏VT_cud⦎ of USER_DATUM list			(* 8 *)
	|	⦏VT_context⦎ of VCCO_CONTEXT_TYPE		(* 5 *)
	|	⦏VT_varnames⦎ of USER_DATUM list		(* 6 *)
	|	⦏VT_named_tills⦎ of USER_DATUM list		(* 7 *)
	|	⦏VT_vcg_context⦎ of VC_GEN_CONTEXT 		(* 4 *)
	|	⦏VT_vcg_refinement⦎ 			(* 1 *)
	|	⦏VT_vcg_subprogram_body⦎			(* 2 *)
	|	⦏VT_vcg_subprogram_spec⦎			(* 3 *)
	|	⦏VT_vcg_subunit_spec⦎			(* 4 *)
	|	⦏VT_vcg_package_init⦎			(* 5 *)
	|	⦏VT_vcg_basic_declaration⦎			(* 6 *)
	|	⦏VT_vcg_unknown⦎				(* 7 *)
;

=TEX
=SML
fun ⦏mk_vcco⦎ (VT_rcud(x,y) : VCCO_TERM ) : USER_DATUM
		      	= 	UD_Int(1,[x,y])
|   mk_vcco (VT_rud udl) = 		UD_Int(2,udl)
|   mk_vcco (VT_pair(x,y)) = 	UD_Int(3,[x,y])
|   mk_vcco (VT_name s) = 		( UD_String(s,[]))
|   mk_vcco (VT_vcnames vcnl) = 	UD_Int(9,vcnl)
|   mk_vcco (VT_term term) = 	UD_Term(term,[])
|   mk_vcco (VT_cud cudl) =		UD_Int(8,cudl)
|   mk_vcco(VT_context(Value(w,pre,post,till,return,named_tills),vcgc)) =
				UD_Int(5,[w,pre,post,till,return,named_tills,vcgc])
|   mk_vcco (VT_context(Nil,vcgc)) =	UD_Int(5,[vcgc])
|   mk_vcco (VT_varnames vnl) = 	UD_Int(6,vnl)
|   mk_vcco (VT_named_tills ntl) = 	UD_Int(7,ntl)
|   mk_vcco (VT_vcg_refinement)   =		UD_Int(4,[UD_Int(1,[])])
|   mk_vcco (VT_vcg_subprogram_body) = 	UD_Int(4,[UD_Int(2,[])])
|   mk_vcco (VT_vcg_subprogram_spec) = 	UD_Int(4,[UD_Int(3,[])])
|   mk_vcco (VT_vcg_subunit_spec)  = 	UD_Int(4,[UD_Int(4,[])])
|   mk_vcco (VT_vcg_package_init)  = 	UD_Int(4,[UD_Int(5,[])])
|   mk_vcco (VT_vcg_basic_declaration) = 	UD_Int(4,[UD_Int(6,[])])
|   mk_vcco (VT_vcg_unknown) = 		UD_Int(4,[UD_Int(7,[])])
|   mk_vcco (VT_vcg_context(VCG_refinement))   =	UD_Int(4,[UD_Int(1,[])])
|   mk_vcco (VT_vcg_context(VCG_subprogram_body)) = 	UD_Int(4,[UD_Int(2,[])])
|   mk_vcco (VT_vcg_context(VCG_subprogram_spec)) = 	UD_Int(4,[UD_Int(3,[])])
|   mk_vcco (VT_vcg_context(VCG_subunit_spec))  = 	UD_Int(4,[UD_Int(4,[])])
|   mk_vcco (VT_vcg_context(VCG_package_init))  = 	UD_Int(4,[UD_Int(5,[])])
|   mk_vcco (VT_vcg_context(VCG_basic_declaration)) = 	UD_Int(4,[UD_Int(6,[])])
|   mk_vcco (VT_vcg_context(VCG_unknown)) = 		UD_Int(4,[UD_Int(7,[])]);
=TEX
=SML
fun ⦏dest_vcg_vcco⦎ (UD_Int(1,[])) = VT_vcg_context(VCG_refinement)
|   dest_vcg_vcco (UD_Int(2,[])) = VT_vcg_context(VCG_subprogram_body)
|   dest_vcg_vcco (UD_Int(3,[])) = VT_vcg_context(VCG_subprogram_spec)
|   dest_vcg_vcco (UD_Int(4,[])) = VT_vcg_context(VCG_subunit_spec)
|   dest_vcg_vcco (UD_Int(5,[])) = VT_vcg_context(VCG_package_init)
|   dest_vcg_vcco( UD_Int(6,[])) = VT_vcg_context(VCG_basic_declaration)
|   dest_vcg_vcco (UD_Int(7,[])) = VT_vcg_context(VCG_unknown)
|   dest_vcg_vcco _ = fail "dest_vcg_vcco" 507160 [fn () => "caller"];
=TEX
=SML
fun ⦏dest_vcco⦎ (UD_String(s, ignorelist) : USER_DATUM ) : VCCO_TERM =
	if not(length ignorelist = 0) then fail "dest_vcco" 507085 []
	else VT_name s
|   dest_vcco (UD_Term(t, ignorelist)) =
	if not(length ignorelist = 0) then fail "dest_vcco" 507085 []
	else VT_term t
|   dest_vcco (UD_Int(1,[x,y]))  = VT_rcud(x,y)
|   dest_vcco (UD_Int(2,udl)) = VT_rud udl
|   dest_vcco (UD_Int(3,[x,y])) = VT_pair(x,y)
|   dest_vcco (UD_Int(4,[v])) = dest_vcg_vcco v
|   dest_vcco (UD_Int(5,[w,pre,post,till,return,named_tills,vcgc])) =
		VT_context(Value(w,pre,post,till,return,named_tills),vcgc)
|   dest_vcco (UD_Int(5,[vcgc])) = VT_context(Nil,vcgc)
|   dest_vcco (UD_Int(6,udl)) = VT_varnames udl
|   dest_vcco (UD_Int(7,udl)) = VT_named_tills udl
|   dest_vcco (UD_Int(8,udl)) = VT_cud udl
|   dest_vcco (UD_Int(9,udl)) = VT_vcnames udl
|   dest_vcco _ = fail "dest_vcco" 507085 [];
=TEX
=SML
fun ⦏vcco_match_error⦎ (caller : string) : 'a = (
	fail caller 507160 [fn () => "dest_vcco"]
);
=TEX
The source of functions were generated semi-automatically we relax the rules
about type casts on the parameters and results.
=SML
fun ⦏dest_vcco_rcud⦎ ud = case dest_vcco ud of VT_rcud x => x | _ => vcco_match_error "dest_vcco_rcud";
fun ⦏dest_vcco_rud⦎ ud = case dest_vcco ud of VT_rud x => x | _ => vcco_match_error "dest_vcco_rud";
fun ⦏dest_vcco_pair⦎ ud = case dest_vcco ud of VT_pair x => x | _ => vcco_match_error "dest_vcco_pair";
fun ⦏dest_vcco_name⦎ ud = case dest_vcco ud of VT_name x => x | _ => vcco_match_error "dest_vcco_name";
fun ⦏dest_vcco_vcnames⦎ ud = case dest_vcco ud of VT_vcnames x => x | _ => vcco_match_error "dest_vcco_vcnames";
fun ⦏dest_vcco_term⦎ ud = case dest_vcco ud of VT_term x => x | _ => vcco_match_error "dest_vcco_term";
fun ⦏dest_vcco_cud⦎ ud = case dest_vcco ud of VT_cud x => x | _ => vcco_match_error "dest_vcco_cud";
fun ⦏dest_vcco_context⦎ ud = case dest_vcco ud of VT_context x => x | _ => vcco_match_error "dest_vcco_context";
fun ⦏dest_vcco_varnames⦎ ud = case dest_vcco ud of VT_varnames x => x | _ => vcco_match_error "dest_vcco_varnames";
fun ⦏dest_vcco_named_tills⦎ ud = case dest_vcco ud of VT_named_tills x => x | _ => vcco_match_error "dest_vcco_named_tills";
fun ⦏dest_vcco_vcg_context⦎ ud = case dest_vcco ud of VT_vcg_context x => x | _ => vcco_match_error "dest_vcco_vcg_context";
=TEX
We need operations to recover information about the route and context of a
VC   \textit{\slshape get\_vc\_context\_route} delivering a pair of
 \textit{\slshape vc\_clause\_context} and \textit{\slshape ROUTE}. We also have a destructor
for \textit{\slshape ROUTE} structure.
=SML
fun ⦏get_z_constructor_name⦎ ( t : TERM ) : string =
(	case dest_z_term t of
		ZGVar(s,_,_) => s
	|	ZApp(r,_) =>
			( case dest_z_term r of
				ZGVar(s,_,_) => s
			  | 	_ => fail "get_z_constructor_name"
					507085 []
			)
	| 	_ => fail "get_z_constructor_name" 507085 []
);
=TEX
=SML
fun ⦏get_z_construct_args⦎ (t : TERM ) : TERM list =
(	case dest_z_term t of
		ZApp(_,zargs) =>
		(	case dest_z_term zargs of
				ZTuple args => args
			|	_ => fail "get_z_constructor_name"
					507085 []
		)
	| 	_ => fail "get_z_constructor_name" 507085 []
);
=TEX
=SML
fun ⦏get_z_construct_single_arg⦎ (t : TERM ) : TERM =
(	case dest_z_term t of
		ZApp(_,arg) => arg
	| 	_ => fail "get_z_constructor_name" 507085 []
);
=TEX
=SML
val ⦏vr_any⦎ =			ⓩ(VRAny _)⌝
val ⦏vr_null⦎ =			ⓩ(VRNull _)⌝
val ⦏vr_assign⦎ =			ⓩ(VRAssign _)⌝
val ⦏vr_spec_via⦎ =			ⓩ(VRSpecVia _)⌝
val ⦏vr_spec_to_side⦎ =		ⓩ(VRSpecToSide _)⌝
val ⦏vr_spec_pre_intro⦎ =		ⓩVRSpecPreIntro⌝
val ⦏vr_semi⦎ =			ⓩ(VRSemi _)⌝
val ⦏vr_end_semi⦎ =			ⓩ(VREndSemi _)⌝
val ⦏vr_if_then⦎ =			ⓩ(VRIfThen _)⌝
val ⦏vr_if_else⦎ =			ⓩ(VRIfElse _)⌝
val ⦏vr_end_if⦎ =			ⓩ(VREndIf _)⌝
val ⦏vr_case_branch⦎ =		ⓩ(VRCaseBranch _)⌝
val ⦏vr_case_others⦎ =		ⓩ(VRCaseOthers _)⌝
val ⦏vr_end_case⦎ =			ⓩ(VREndCase _)⌝
val ⦏vr_loop_undec_via⦎ =		ⓩ(VRLoopUndecVia _)⌝
val ⦏vr_loop_undec_pre_intro⦎ =	ⓩVRLoopUndecPreIntro⌝
val ⦏vr_loop_undec_pre_to_side⦎ =	ⓩVRLoopUndecPreToSide⌝
val ⦏vr_loop_undec_to_side⦎ =	ⓩ(VRLoopUndecToSide _)⌝
val ⦏vr_while_via⦎ =		ⓩ(VRWhileVia _)⌝
val ⦏vr_while_pre_intro⦎ =		ⓩVRWhilePreIntro⌝
val ⦏vr_while_wp_to_side⦎ =		ⓩ(VRWhileWPToSide _)⌝
val ⦏vr_while_to_side⦎ =		ⓩ(VRWhileToSide _)⌝
val ⦏vr_for_via⦎ =			ⓩ(VRForVia _)⌝
val ⦏vr_for_pre_intro⦎ =		ⓩVRForPreIntro⌝
val ⦏vr_for_pre_to_side⦎ =		ⓩVRForPreToSide⌝
val ⦏vr_for_to_side⦎ =		ⓩ(VRForToSide _)⌝
val ⦏vr_for_exit_to_side⦎ =		ⓩ(VRForExitToSide _)⌝
val ⦏vr_exit_till_intro⦎ =		ⓩVRExitTillIntro⌝
val ⦏vr_exit_via⦎ =			ⓩ(VRExitVia _)⌝
val ⦏vr_return_intro⦎ =		ⓩVRReturnIntro⌝
val ⦏vr_proc_call⦎ =		ⓩ(VRProcCall _)⌝
val ⦏vr_proc_call_end⦎ =		ⓩ(VRProcCallEnd _)⌝
val ⦏vr_proc_call_rng_intro⦎ =	ⓩVRProcCallRngIntro⌝
val ⦏vr_log_con_to_side⦎ =		ⓩ(VRLogConToSide _)⌝
val ⦏vr_log_con_pre_intro⦎ =		ⓩVRLogConPreIntro⌝
val ⦏vr_log_con_type_mem_intro⦎ =	ⓩVRLogConTypeMemIntro⌝
val ⦏vr_refinement_begin⦎ =		ⓩ(VRRefinementBegin _)⌝
val ⦏vr_refinement_intro⦎ =		ⓩVRRefinementIntro⌝;
=TEX
=SML
fun ⦏vcco_nullary⦎ (ct : TERM) : ( TERM * vc_route_arg ) =  (ct, VRA_unit () );
=TEX
=SML
fun ⦏vcco_unary⦎ (ct : TERM, r : ROUTE) : (TERM * vc_route_arg ) =
	(ct, VRA_rte (get_z_construct_single_arg r) );
=TEX
=SML
fun ⦏vcco_int_route⦎ ( ct : TERM, r : ROUTE) : (TERM * vc_route_arg) = (
	let 	val (argi,argr) = case get_z_construct_args r of
			[x, y] => (x, y)
		|	_ => fail "vcco_int_route" 507160 [fn()=>"get_z_construct_args"];
		val sn = case dest_z_term argi of
			ZInt x => x
		|	_ => fail "vcco_int_route" 507160 [fn()=>"dest_z_term"];
		val n = case Int.fromString sn of
				SOME x => x
		|	_ => fail "vcco_int_route" 507088 []
	in 	(ct, VRA_int_rte(n,argr))
	end
);
=TEX
=SML
fun ⦏vcco_bool_route⦎ ( ct : TERM, r : ROUTE) : (TERM * vc_route_arg) =
	let 	val (elsfind, argr) = case get_z_construct_args r of
			[x, y] => (x, y)
		|	_ => fail "vcco_bool_route" 507160 [fn()=>"get_z_construct_args"];
		val elsfindstr = get_z_constructor_name elsfind
		val elsfindb = 	case elsfindstr of
					"VRElsfTrue" => true
				|	"VRElsfFalse" => false
				|	_ => fail "vcco_elsf_ind_route" 507087 []
	in 	(ct, VRA_bool_rte(elsfindb,argr))
	end;
=TEX
=SML
fun vcco_zstring( ct : TERM, r : ROUTE) : (TERM * vc_route_arg) = (
	let 	val s = case dest_z_term (get_z_construct_single_arg r) of
			ZString x => x
		|	_ => fail "vcco_zstring" 507160 [fn()=>"get_z_construct_single_arg"];
	in	(ct, VRA_str s)
	end
);
=TEX
=SML
fun ⦏dest_route⦎ ( route : ROUTE ) : (TERM * vc_route_arg) =
case get_z_constructor_name route of
 	"VRAny _" =>   vcco_unary(vr_any,route)
|	"VRNull _" => vcco_unary(vr_null,route)
|	"VRAssign _" => vcco_unary(vr_assign,route)
|	"VRSpecVia _" => vcco_unary(vr_spec_via, route)
|	"VRSpecToSide _" => vcco_unary(vr_spec_to_side, route)
|	"VRSpecPreIntro" => vcco_nullary(vr_spec_pre_intro)
|	"VRSemi _" => vcco_unary(vr_semi, route)
|	"VREndSemi _" => vcco_unary(vr_end_semi, route)
|	"VRIfThen _" => vcco_bool_route(vr_if_then, route)
|	"VRIfElse _" => vcco_bool_route(vr_if_else, route)
|	"VREndIf _" => vcco_unary(vr_end_if, route)
|	"VRCaseBranch _" => vcco_int_route(vr_case_branch, route)
|	"VRCaseOthers _" => vcco_unary(vr_case_others, route)
|	"VREndCase _" => vcco_unary(vr_end_case, route)
|	"VRLoopUndecVia _" => vcco_unary(vr_loop_undec_via, route)
|	"VRLoopUndecPreIntro" => vcco_nullary(vr_loop_undec_pre_intro)
|	"VRLoopUndecPreToSide" => vcco_nullary(vr_loop_undec_pre_to_side)
|	"VRLoopUndecToSide _" => vcco_unary(vr_loop_undec_to_side, route)
|	"VRWhileVia _" => vcco_unary(vr_while_via, route)
|	"VRWhilePreIntro" => vcco_nullary(vr_while_pre_intro)
|	"VRWhileWPToSide _" => vcco_unary(vr_while_wp_to_side, route)
|	"VRWhileToSide _" => vcco_unary(vr_while_to_side, route)
|	"VRForVia _" => vcco_unary(vr_for_via, route)
|	"VRForPreIntro" => vcco_nullary(vr_for_pre_intro)
|	"VRForPreToSide" => vcco_nullary(vr_for_pre_to_side)
|	"VRForToSide _" => vcco_unary(vr_for_to_side, route)
|	"VRForExitToSide _" => vcco_unary(vr_for_exit_to_side, route)
|	"VRExitTillIntro" => vcco_zstring(vr_exit_till_intro, route)
|	"VRExitVia _" => vcco_unary(vr_exit_via, route)
|	"VRReturnIntro" => vcco_nullary(vr_return_intro)
|	"VRProcCall _" => vcco_unary(vr_proc_call, route)
|	"VRProcCallEnd _" => vcco_unary(vr_proc_call_end, route)
|	"VRProcCallRngIntro" => vcco_nullary(vr_proc_call_rng_intro)
|	"VRLogConToSide _" => vcco_unary(vr_log_con_to_side, route)
|	"VRLogConPreIntro" => vcco_nullary(vr_log_con_pre_intro)
|	"VRLogConTypeMemIntro" => vcco_nullary(vr_log_con_type_mem_intro)
|	"VRRefinementBegin _" => vcco_unary(vr_refinement_begin, route)
|	"VRRefinementIntro" => vcco_nullary(vr_refinement_intro)
|	_ => error "dest_route"507160  [fn () => "get_z_constructor_name"];

=TEX
When we want to use the origin and context we shall require a range of operations. We need to
find the context for a given vcname and unpack it.

=SML
fun ⦏get_vcco_data⦎ (() : unit) : USER_DATUM =
	get_user_datum "-" cn_vc_context_and_origin_key
	handle Fail _ =>
		mk_vcco(VT_rcud( mk_vcco(VT_rud []), mk_vcco(VT_cud []) ));

fun ⦏find_route⦎ ( vcname : ID, trans : ID -> ID,  [] : USER_DATUM list )
	: (ID list * (ROUTE OPT))  = ( [], Nil )
|   find_route( vcname, trans, ud :: udd ) =
	let 	val (udname, blockids_route ) = dest_vcco_pair ud
		val name = dest_vcco_name udname
	in	if trans name = vcname
		then 	let	val (bids,rte) = dest_vcco_pair blockids_route
				val udblockids = dest_vcco_vcnames bids
				val blockids =
					map dest_vcco_name udblockids
				val route = dest_vcco_term rte
			in	(blockids, Value ( route ))
			end
		else find_route ( vcname, trans, udd )
	end
	handle Fail x => raise Fail x | _ => fail "find_route" 507085 [];
=TEX
=SML
fun ⦏get_named_till⦎ nmtl =
	let 	val (udnm,udterm) = dest_vcco_pair nmtl
		val s = dest_vcco_name udnm
		val t = dest_vcco_term udterm
	in	(s,t)
	end
	handle Fail x => raise Fail x | _ => fail "get_named_till" 507085 [];
=TEX
=SML
fun ⦏get_clause_context_vcgc⦎ (udcontext : USER_DATUM )
		: vc_clause_context OPT * VC_GEN_CONTEXT =
let	val (opt_parts, udvcg_context) = 	dest_vcco_context udcontext
	val  (vcgc) = dest_vcco_vcg_context udvcg_context
in	case opt_parts of
		Nil => (Nil, vcgc)
	|	Value (udw, udpre, udpost, udtill, udreturn, udnamed_tills) =>
		let 	val udw = dest_vcco_varnames udw;
			val w = map dest_vcco_name udw;
			val pre = dest_vcco_term udpre;
			val post = dest_vcco_term udpost;
			val till = dest_vcco_term udtill;
			val return = dest_vcco_term udreturn;
			val ntls = dest_vcco_named_tills udnamed_tills;
			val named_tills = map get_named_till ntls;
		in	(Value (	{ w = w, pre = pre, post = post, till = till,
			  	  return = return, named_tills = named_tills
				}
			 ),
			 vcgc
			)
		end
end
handle Fail x => raise Fail x | _ => fail "get_clause_context" 507085 [];
=TEX
=SML
fun ⦏member_trans⦎ (trans: (ID -> ID))  (vcname:ID) ([]:USER_DATUM list) : bool  = false
|   member_trans trans vcname (s::ss)  = (
	let	val nm = dest_vcco_name s;
	in	trans nm = vcname orelse
			member_trans trans vcname ss
	end
);
=TEX
=SML
fun ⦏member⦎ (vcname : string) ([] : USER_DATUM list) : bool = false
|   member vcname (s::ss)  = (
	let	val nm = dest_vcco_name s;
	in	nm = vcname  orelse
		member vcname ss
	end
);
=TEX
=SML
fun ⦏find_context⦎ ( vcname : ID, trans : ID -> ID, [] : USER_DATUM list )
	: vc_clause_context OPT * VC_GEN_CONTEXT = (Nil, VCG_unknown)
|   find_context ( vcname, trans, cud_elem :: cud_elems ) = (
	let 	val (udnames, udcontext) = dest_vcco_pair cud_elem
		val udnamelist = dest_vcco_vcnames udnames
	in	if member_trans  trans vcname udnamelist
		then (get_clause_context_vcgc udcontext)
		else find_context( vcname, trans, cud_elems )
	end
);
=TEX
=SML
fun ⦏get_vc_context_route⦎ ( vcname : ID, trans : (ID -> ID) ) : vc_context_route = (
	let 	val rcud = get_vcco_data()
		val (rud,cud)  = dest_vcco_rcud rcud
		val (rud_pairs) = dest_vcco_rud rud
		val (blockids, route_opt) = find_route(vcname, trans, rud_pairs)
		val (cud_elems) = dest_vcco_cud cud
		val (context_opt, vcgc) = find_context(vcname, trans, cud_elems)
	in	{route = route_opt, blockids = blockids, context = context_opt,
		 vcg_context = vcgc
		}
	end
);
=TEX
 Then we shall need to find the origin of a
VC from its name and form an abbreviated abstract syntax tree from the true abstract syntax
of the clause and the recorded walk. We do this in a depth first left to right walk of the
tree in synchrony with a walk along the route.

Our unit of database atomicity is the web clause, so we can add one context and any number
of origins and then put the data back again.
=SML
fun ⦏set_vcco_data⦎ (vcd : USER_DATUM) : unit =
	set_user_datum(cn_vc_context_and_origin_key,vcd)
	handle Fail x => raise Fail x | _ => fail "set_vcco_data" 507085 [];
=TEX
=SML
fun ⦏mk_vcco_pair⦎ ( a: USER_DATUM, b : USER_DATUM ) : USER_DATUM =
	UD_Int(vcco_pair, [a, b]);
=TEX
=SML
fun ⦏mk_vcco_string⦎ ( s : string ) : USER_DATUM = UD_String(s,[]);

fun ⦏mk_vcco_names⦎ ( s : string list ) : USER_DATUM =
	UD_Int(vcco_names, map mk_vcco_string s);

fun ⦏mk_vcco_int⦎ (i : int ) : USER_DATUM = UD_Int(i,[]);

fun ⦏mk_vcco_term⦎ (t : TERM) : USER_DATUM = UD_Term(t,[]);

fun ⦏mk_vcco_elsfind⦎ (ei : int) : USER_DATUM = mk_vcco_int(ei);
=TEX
=SML
fun ⦏add_vc_rud⦎ (	vc_name : string, rud_elem : USER_DATUM,
		blockids : ID list, rcud : USER_DATUM) : USER_DATUM =
	let 	val (rud,cud) = dest_vcco_rcud rcud;
		val (rud_elems) = dest_vcco_rud rud;
		val udblockid_list = map (mk_vcco o VT_name) blockids
		val udblockids = mk_vcco(VT_vcnames(udblockid_list))
		val blocks_rud_elem = mk_vcco(VT_pair( udblockids, rud_elem));
		val name_rud = mk_vcco(VT_pair(mk_vcco(VT_name vc_name), blocks_rud_elem));
		val nrud = mk_vcco(VT_rud(name_rud :: rud_elems));
		val nrcud = mk_vcco(VT_rcud(nrud,cud));
	in	nrcud
	end
	handle Fail x => raise Fail x | _ => fail "add_vc_rud" 507085 [];
=TEX
=SML
fun ⦏add_vc_cud⦎ (vc_names : string list, cud_elem : USER_DATUM, rcud : USER_DATUM)
	: USER_DATUM =
	let 	val (rud,cud) = dest_vcco_rcud rcud;
		val (vcs_cud_elems) = dest_vcco_cud cud;
		val udvcnames = map (fn s => (mk_vcco o VT_name) s) vc_names;
		val vcns = mk_vcco( VT_vcnames(udvcnames));
		val np = mk_vcco(VT_pair(vcns, cud_elem));
		val ncud = mk_vcco(VT_cud(np::vcs_cud_elems));
		val nrcud = mk_vcco(VT_rcud(rud,ncud));
	in	nrcud
	end
	handle Fail x => raise Fail x | _ => fail "add_vc_cud" 507085 [];

=TEX
=SML

fun mk_vcco_route ( route : ROUTE ) : USER_DATUM =
	UD_Term( route , [])
=TEX
Now we specify how to translate the context into user data.

=SML
fun 	add_vcs_rcud( 	[] : string list, [] : ROUTE OPT list,
			blockids : ID list, rcud : USER_DATUM )
	: USER_DATUM 	= rcud
|   	add_vcs_rcud( [] , _ , _, rcud  ) =
		fail "add_vcs_rcud" 507088 []
|	add_vcs_rcud( _ , [] , _, rcud  ) =
		fail "add_vcs_rcud" 507088 []
|	add_vcs_rcud( s :: ss, r::rr, blockids, rcud ) =
	(	case r of
			Nil => ( add_vcs_rcud(ss,rr,blockids,rcud) )
		|	Value aroute =>
			add_vc_rud( s, mk_vcco_route aroute, blockids,
				add_vcs_rcud(ss,rr,blockids,rcud) )
	)
	handle Fail x => raise Fail x | _ => fail "add_vcs_rcud" 507085 [];

=TEX
This is used just to undo the effect of the \textit{\slshape z\_quote} at the end of
\textit{\slshape vcs}.
=SML
fun term_of_quote(zt : Z_TM) : TERM =
	case zt of
		ZTmQuotation(t,ty) => t
	|	_ => fail "term_of_quote" 507085 [];

fun mk_vcco_context
(	w : ID list, pre : TERM, post: TERM, till : TERM, return : TERM,
	named_tills :  (ID * Z_PRED) list, vcg_ctxt : VC_GEN_CONTEXT
) : USER_DATUM =
	let	val udws = map (fn s => (mk_vcco o VT_name) s) w
		val udw = mk_vcco(VT_varnames udws)
		val udpre = mk_vcco(VT_term pre)
		val udpost = mk_vcco(VT_term post)
		val udtill = mk_vcco(VT_term till)
		val udreturn = mk_vcco(VT_term return)
		val udnlts = map (fn( nm, t) =>
				( mk_vcco(VT_name nm), mk_vcco(VT_term t)) ) named_tills
		val udpairnlts = map (fn (x,y) => mk_vcco(VT_pair(x,y))) udnlts
		val udnamed_tills = mk_vcco(VT_named_tills udpairnlts)
	in	mk_vcco(VT_context(
			Value(
				udw,udpre,udpost,udtill,udreturn,udnamed_tills
			), mk_vcco(VT_vcg_context(vcg_ctxt)))
		)
	end
	handle Fail x => raise Fail x | _ => fail "mk_vcco_context" 507085 [];
=TEX
=SML
fun store_vc_context_and_origin
	(	osl : SPECLAB OPT, vc_names : string list, routes :ROUTE OPT list,
		blockids : ID list, vcg_ctxt : VC_GEN_CONTEXT )
	: unit =
	let	val rcud = get_vcco_data()
		val rcud1 = add_vcs_rcud(vc_names,routes,blockids,rcud);
		val rcud2 =
			case osl of
				Nil =>
				add_vc_cud(
					vc_names,
					mk_vcco(VT_context(Nil,
						mk_vcco(VT_vcg_context vcg_ctxt)
					)),
					rcud1
				)
			|	Value spclab =>

				add_vc_cud(
					vc_names,
					mk_vcco_context(
						#w(#spec spclab),
						term_of_quote(#pre(#spec spclab)),
						term_of_quote(#post(#spec spclab)),
						#till(#wp_env spclab),
						#return(#wp_env spclab),
						#named_tills(#wp_env spclab),
					 	vcg_ctxt
					),
					rcud1
				)
	in	set_vcco_data(rcud2)
	end
	handle Fail x => raise Fail x | _ => fail "store_vc_context_and_origin" 507085 []
;
=TEX
\subsubsection{Adding VCs}
=SML
=TEX
Usually, the distinctive label used in forming a
=SML
fun ⦏store_vc_term⦎ (opt_lab : LABEL OPT) (tm : TERM) : string = (
	let	fun ⦏make_label_prefix⦎ wcn = "vc" ^ wcn ^ "_";
		val vc_lab = make_label_prefix
			(case opt_lab of
				Value lab => lab
			|	Nil => get_bottom_block_name ());
		fun aux i = (
			let val vc_name = vc_lab ^ string_of_int i;
			in	if (get_conjecture "-" vc_name; false)
  						handle Fail _ => true
				then	(new_conjecture ([vc_name], tm); vc_name )
				else	aux (i + 1)
			end
		);
	in	aux 1
	end
);
=TEX
For various reasons, the underlying {\Product} operations of adding a new parent or saving a conjecture (e.g., a VC) do not increment the level counter.
In order for the Z document generator to be able to output the necessary commands in the right place, we step the current level before storing a VC.

=SML
fun ⦏store_vcs⦎ (opt_lab : LABEL OPT, vcs: TERM list, osl : SPECLAB OPT,
		routes : ROUTE OPT list, vcg_ctxt : VC_GEN_CONTEXT ) 					: unit = (
	let	val _ = pp'Kernel.pp'step_current_level();
		val vc_names = map (store_vc_term opt_lab)  vcs;
	in
		store_vc_context_and_origin(osl, vc_names, routes,
			map (expanded_name o #block_name o #declab) (!blocks), vcg_ctxt )
	end
);
=TEX
The processing of declarations can give rise to VCs.
These are delivered as conjecture paragraphs.
In order to handle these vcs uniformly with other VCs, we use
the following interface to the function for storing Z paragraphs.
Currently VCs cannot be generic, and so the interface below does not cater for generic VCs.
=SML
fun ⦏store_para⦎ (para : PARAINFO) : unit = (
	case para of
		ConjectureInfo(Value n, [], pred) => (
			store_vcs(Value n, [pred], Nil, [Nil],
				VCG_basic_declaration)
	) |	_ => update_theory_db_with_parainfo para
);
=TEX
The following attempts to store a paragraph, and then tidies everything
away again.
$delete\_top\_theory\_past\_level$ is taken verbatim from
\cite{DS/FMU/IED/DTD049}.
This is used when a function (formal or informal) is encountered in a package specification to check that
the function name does not clash with an existing Z global variable and, for a formal function, to
ensure that the pre- and post-conditions are well-typed. As currently coded, the function
would not check that a conjecture has no free variables, but that check is not required in the
current usage.
=SML
fun ⦏test_store_para⦎  (para : PARAINFO) : unit = (
	let	val cl = current_level();
		val dummy = update_theory_db_with_parainfo para;
		val _ = delete_to_level {
			do_warn = false,
			caller = "test_store_para",
			target = "<last extension>",
			level = cl + 1};
	in	()
	end
);
=TEX
The following creates a term formed from the variable initialisations and
the domain conditions for the initialising expressions
and combines it with a possible pre-existing pre-condition,
and returns a $Z\_TM$, as that is what a $SPEC$ wants.

(The list reversal in function {\it aux} is for backwards compatibility.
It puts the list in the same order as it was before the introduction of
domain conditions).
=SML
val bool_extype = Unification.type_to_extype ⓣBOOL⌝;
fun ⦏var_inits_pre⦎
	(opre : Z_TM OPT) ([] : (EXP * TMARK) S_DICT) (cn_env : CN_ENV) : Z_TM  = (
	case opre of
	Value pre => pre
	| Nil => ZTmTruth true
)
| var_inits_pre (opre : Z_TM OPT) (vi : (EXP * TMARK) S_DICT) (cn_env : CN_ENV) : Z_TM = (
let	fun aux acc ((id, (exp, tmark))::more) = (
		let	val exp1 =
				if	is_modular_type tmark
				then	ETypeConversion{tmark = tmark, exp = exp}
				else	exp;
			val ze = slide_to_tmark cn_env
				(trans_exp cn_env (adjust_exp cn_env exp1), tmark);
			val dc = domain_conds cn_env ze;
			val eqn = z_eq(zid cn_env (trans_id id), ze);
		in	aux (eqn::dc@acc) more
		end
	) | aux acc [] = rev acc;
	val vi_init_dcs = aux [] vi;
in
	case opre of
	Value pre => z_quote(z_many_and (z_pred_of_z_tm cn_env pre :: vi_init_dcs),
		Value(bool_extype))
	| Nil => z_quote(z_many_and vi_init_dcs, Value(bool_extype))
end
handle exn => pass_on exn "zid" "var_inits_pre"
);
=TEX

\subsection{Creating ProofPower Theories}
The material in this section uses the following function, which is also required for the DRA specs.
=SML
infix dot;
fun (x : ID) ⦏dot⦎ (y : ID) = x ^ "." ^ y;
=TEX
The following forms the index string for $subunit\_env$, which is simply the Z translation of the expanded name of the subprogram.
=SML
val ⦏subunit_env_index⦎ : ID OPT list -> ID -> Z_ID = prefix_trans_id o full_block_name;
=TEX
The following function returns the name of the parent of the script theory.
=SML
fun  ⦏get_parent_name⦎ ((): unit) : string = (
	(hd o rev o get_parents) (!script_name)
);
=TEX
{\em make\_module} creates a theory that duplicates the current theory, making a snapshot of the Ada scope, as required, for example, to deal with stubs.
The {\Product} function $duplicate\_theory$ is used to do this: it creates a new theory which is a copy of the current theory (without changing the current theory).

If the theory cannot be created, then the error message identified as the first argument is produced using the theory name as the first message insert and the string given by the second string as the second message insert.
=SML
fun ⦏make_module⦎ (err_no : int) (msg_insert : string)
	(thy : Z_ID) : unit = (
	let	fun delete_vc n = ((delete_conjecture n; ())
						handle Fail _ => ());
		val cur_thy = get_current_theory_name();
		val _ = pp'Kernel.pp'step_current_level();
		val _ = duplicate_theory (cur_thy, thy)
			handle Fail _ => (
				lazy_open_theory cur_thy;
				fail "make_module" err_no
				[fn()=>thy, fn()=>msg_insert]
			);
		fun make_adjustments () = (
			set_duplicate_keys (thy, !script_name);
			(map delete_vc o flat o map fst o get_conjectures) thy
		);
		val _ = do_in_theory thy make_adjustments ();
		val _ = lazy_open_theory cur_thy;
		val thy_level = current_level();
	in	(
			update_user_datum cn_context_ud_key
				(UD_String(thy, [UD_Int (thy_level, [])]));
			()
		)
		handle Fail _ => (
			lazy_open_theory cur_thy;
			fail "make_module" 507026
			[fn()=>thy, fn()=>thy]
		)
	end
);
=TEX
{\em make\_subprog\_module} creates a new theory as a child of the current theory, as required, for example, to represent the scope of a subprogram implementation or a block.
It reopens the current theory, so from caller's point of view the current theory will not change.
It follows the same convention in case of error as does {\em make\_module}, see above.
=SML
fun ⦏make_subprog_module⦎ (err_no : int) (msg_insert : string)
	(thy : Z_ID) : unit = (
	let	val cur_thy = get_current_theory_name();
		val _ = pp'Kernel.pp'step_current_level();
		val _ = new_theory thy
			handle Fail _ => (
				lazy_open_theory cur_thy;
				fail "make_subprog_module" err_no
				[fn()=>thy, fn()=>msg_insert]
			);
		val _ = set_cn_theory ();
		val _ = open_theory cur_thy;
		val thy_level = current_level();
	in	update_user_datum cn_subprog_ud_key
				(UD_String(thy, [UD_Int (thy_level, [])]))
		handle Fail _ => (
			lazy_open_theory cur_thy;
			fail "make_subprog_module" 507026
			[fn()=>thy, fn()=>thy]
		)
	end
);
=TEX
=SML
fun ⦏new_parent_subunit_theory⦎ (unit_name : EXPANDED_NAME, x : PROPER_BODY) : unit = (
	let	val (body_name, _) = proper_body_name x;
		val su_name = trans_expanded_name (unit_name @ body_name);
		val thy = su_name ^ context_tag;
	in	new_parent_aux false thy;
		()
	end
);
=TEX
=SML
fun get_script_theories (script : string) : string list = (
	let	fun get_branches (thy : string) : string list = (
			((map fst o mapfilter dest_ud_string o rev o snd o dest_ud_string o get_user_datum thy) cn_context_ud_key
			handle Fail _ => []) @
			((map fst o mapfilter dest_ud_string o rev o snd o dest_ud_string o get_user_datum thy) cn_subprog_ud_key
			handle Fail _ => [])
		);
		fun go route thy = (
			if	thy mem route
			then	error "get_script_theories" 507140 [fn () => thy]
			else	let	val branches = get_branches thy;
					val recur = go (thy::route);
					val subtrees = map recur branches;
				in	thy::flat subtrees
				end
		);
		val thyn = if script = "-" then get_current_theory_name() else script;
	in	(if	is_cn_theory thyn
		then	()
		else	comment "get_script_theories" 507141 [fn () => thyn]);
		go [] thyn
	end
);
=TEX
\subsection{Diagnostic Aids}
=SML
val ⦏diag_z_generator_state⦎ : Z_GENERATOR_STATE ref = (
	ref (get_z_generator_state())
);
val ⦏diag_web_clause⦎ : WEB_CLAUSE ref = ref (WCCompilation []);
val ⦏diag_vc_args⦎ : (SPECLAB * STATEMENT) list ref = ref [];
val ⦏diag_basic_decl_list⦎ : BASIC_DECL list ref = ref [];
=TEX
\subsection{Interface to VC Generator}
=TEX
=SML
fun ⦏add_init_vars_spec⦎ ({w, pre, post, w0} : SPEC) : SPEC = (
	{w = w,
	pre = pre,
	post = post,
	w0 = map (fn s => s ^ "⋎0") w}
);
=TEX
=SML
fun ⦏add_init_vars_speclab⦎ ({spec as {w, pre, post, ...},
		wp_env as {env,
			fun_header,
			named_tills,
			till, return}, fun_flag, in_scope as {dict, ...},
	block_name, till_flag, formal_body_flag} : SPECLAB)
	: SPECLAB = (
	let	fun v_v0 v = (v, v ^ "⋎0");
		val vs_v0s = map v_v0 w;
		fun aux acc ((v, v0) :: more) = (
			case env_of_env_dict dict v of
				Value {tipe, canon_name, info, private} => (
				if	v = canon_name
				then	aux
					((v0,
					{tipe = tipe,
					canon_name = v0,
					info = info,
					private = private})::acc)
					more
				else	aux acc more
			) |	Nil => aux acc more
		) | aux acc [] = acc;
		val dict' = add_to_env_dict dict (aux [] vs_v0s);
		val env' = env_of_env_dict dict';
	in	{spec = {w = w, w0 = map snd vs_v0s, pre = pre, post = post},
		wp_env = {env = env', fun_header = fun_header,
			named_tills = named_tills, till = till, return = return},
		fun_flag = fun_flag,
		in_scope = in_scope_dict (in_scope, dict'),
		block_name = block_name,
		till_flag = till_flag,
		formal_body_flag = formal_body_flag}
	end
);
=TEX
=SML
fun ⦏terms_of_vcs⦎
	(sl : SPECLAB)
	(acc : TERM list)
	(pre_post :  TERM * TERM)
	(vc as (decs, (asms, conc)) :: more : VC list) : TERM list = (
	let	val tm = (
		case (decs, asms) of
			([], []) => conc
		|	([], _) => mk_z_⇒ (list_mk_∧ asms, conc)
		|	(_, []) => mk_z_∀(mk_z_decl decs, mk_z_true, conc)
		|	(_, _) => mk_z_∀(mk_z_decl decs, list_mk_∧ asms, conc));
		val recur = terms_of_vcs sl;
	in	recur (tm :: acc) pre_post more
	end
) | terms_of_vcs sl acc (pre, post) [] = (
	let	fun report (env : CN_ENV) msg1 msg2 (term, vars) = (
			z_free_var_report msg1 (Value term) (map string_of_term vars);
			fail "term_of_vcs" msg2 []
		);
		val all_error_frees = list_term_union (map frees acc);
	in	case all_error_frees of
			[] => rev acc
		|	_ =>
		let	val pre_frees = frees pre;
			val post_frees = frees post;
			val pre_post_frees = pre_frees term_union post_frees;
			val other_error_frees = all_error_frees term_diff pre_post_frees;
			val pre_post_error_frees = all_error_frees term_diff other_error_frees;
			val post_error_frees = pre_post_error_frees term_diff pre_frees;
			val pre_error_frees = pre_post_error_frees term_diff post_error_frees;
		in	case post_error_frees of
				_::_ =>  report (#env(#wp_env sl)) 507121 507123 (post, post_error_frees)
			|	[] =>  (
				case pre_error_frees of
					_::_ => (
					report (#env(#wp_env sl)) 507121 507122 (pre, pre_error_frees)
				) |	[] =>  (
					map (report (#env(#wp_env sl)) 507124 507125)
					(map (fn t => (t, frees t)) (rev acc)
						drop (fn(_, vs) => is_nil vs))
				)
			)
		end
	end
);
=TEX
=SML
fun ⦏call_vcs⦎
	((sl, st) : SPECLAB * STATEMENT) : TERM list * ROUTE OPT list * SPEC = (
	let	val sl1 = add_init_vars_speclab sl;
		val sl1_st = (sl1, st);
		fun unquote (ZTmQuotation (tm, _)) = tm
		|   unquote _ = mk_t;
	in	diag_vc_args := sl1_st :: !diag_vc_args;
		e_set_ti_context (ti_context_of_speclab sl1);
		let 	val (vcs_routes, spc as {pre, post, ...}) = vcs sl1_st;
			val seqs = map fst vcs_routes;
			val routes = map snd vcs_routes;
		in	(terms_of_vcs sl [] (unquote pre, unquote post) seqs, routes, spc)
		end
	end
);
=TEX
The following is used where one subprogram specification statement refines another.
The refining specification statement is type-checked first which gives nicer error messages.
=SML
fun ⦏call_vcs_spec⦎
	((sl1, spc) : SPECLAB * SPEC) : TERM list * ROUTE OPT list * SPEC = (
	let	val sl0 : SPECLAB = {
			spec = spc,
			formal_body_flag = #formal_body_flag sl1,
			fun_flag = #fun_flag sl1,
			till_flag = #till_flag sl1,
			wp_env = #wp_env sl1,
			in_scope = #in_scope sl1,
			block_name = #block_name sl1
		};
		val st0 = STNull SNImplicit;
		val (_, _, spc1) = call_vcs (sl0, st0);
		val st1 = STSpecNoIvars{spec= spc1, label="", is_assertion = false};
	in	call_vcs (sl1, st1)
	end
);
=TEX
=SML
fun ⦏speclab_update_spec⦎
	( sl : SPECLAB, s : SPEC ) : SPECLAB = (
	let 	val {spec,formal_body_flag,
			fun_flag, till_flag,
			wp_env, in_scope, block_name} =
			sl
	in	{
			spec = s, formal_body_flag = formal_body_flag,
			fun_flag = fun_flag, till_flag = till_flag,
			wp_env = wp_env, in_scope = in_scope,
			block_name = block_name
		}
	end
);
=TEX
\section{BASIC DECLARATIONS}\label{BASICDECLARATIONS}
\subsection{The SID Function basic\_declaration}
We use a supporting function that attempts to store a Z paragraph.
If this fails, and if the paragraph is a (non-generic) abbreviation definition that is identical
with an existing one, then the failure is suppressed. It returns true if a paragraph was stored.
=SML
fun ⦏bd_store_para⦎ (info : PARAINFO) : bool = (
	let	fun  check_orig_def act_rhs rhs = (
			act_rhs =$ rhs orelse
			let	val rhs' = snd(dest_eq(concl(z_get_spec rhs)));
			in	check_orig_def act_rhs rhs'
			end	handle Fail _ => false
		);
	in	(store_para info; true)
		handle ex as (Fail _)  => (
			case info of
				AbbDefInfo(lhs, [], rhs) => (
				let	val t = mk_z_gvar(lhs, type_of rhs, []);
					val act_rhs =  snd(dest_eq(concl(z_get_spec t)))
						handle Fail _ => t;
				in	if	check_orig_def act_rhs rhs
					then	false
					else	term_fail "bd_store_para" 507075
						[t, rhs]
				end
			) |	_ => raise ex
		)
	end
);
=TEX
To keep the environment dictionaries up-to-date, we need to mimic for type and constant declarations the process for variables and procedures of going through the environments that my need updating to reflect the new declaration.
=SML
fun ⦏update_subunit_env_basic_decl⦎
	(pfx_priv : PREFIX_INFO * bool)
	(bd : BASIC_DECL) : unit = (
	let	val dec_lab1 = #dec_lab (block 1);
		fun do1_subunit
			(id1_id2_s as
				(id1_id2,
				s as {in_scope as {dec_labels, ...}, ...})
					: string * SUBUNIT) = (
			if	dec_lab1 mem dec_labels
			then	(id1_id2,
				subunit_in_scope (s, in_scope_consts_types pfx_priv (in_scope, bd)))
			else	id1_id2_s
		);
	in	subunit_env := map do1_subunit (!subunit_env)
	end
);
=TEX
=SML
fun ⦏update_dec_env_basic_decl⦎
	(pfx_priv : PREFIX_INFO * bool)
	(bd : BASIC_DECL) : unit = (
	let	val dec_lab1 = #dec_lab (block 1);
		fun do1_dec_label
			(dec_label_s as
				(dec_label,
				s as {in_scope as {dec_labels, ...}, ...})
					: string * DECLAB) = (
			if	dec_lab1 mem dec_labels
			then	(dec_label,
				declab_in_scope (s, in_scope_consts_types pfx_priv (in_scope, bd)))
			else	dec_label_s
		);
	in	dec_env := map do1_dec_label (!dec_env)
	end
);
=TEX
In the following, the local function, $do1\_spec\_label$ does the work specified in the Z spec for one spec label.
=SML
fun ⦏update_spec_env_basic_decl⦎
	(pfx_priv : PREFIX_INFO * bool)
	(bd : BASIC_DECL) : unit = (
	let	val dec_lab1 = #dec_lab (block 1);
		fun do1_spec_label
			(spec_label_s as
				(spec_label,
				s as {spec as {w, ...},
					in_scope as {dec_labels, ...}, ...})
					: string * SPECLAB) = (
			if	dec_lab1 mem dec_labels
			then	(spec_label,
				speclab_in_scope (s, in_scope_consts_types pfx_priv (in_scope, bd)))
			else	spec_label_s
		);
	in	spec_env := map do1_spec_label (!spec_env)
	end
);
=TEX
=SML
fun ⦏update_envs_basic_decl⦎
	(pfx_priv : PREFIX_INFO * bool)
	(bd : BASIC_DECL) : unit = (
	if	test_flag #declabel_flag 1
	then	(update_subunit_env_basic_decl pfx_priv bd;
		update_dec_env_basic_decl pfx_priv bd;
		update_spec_env_basic_decl pfx_priv bd)
	else	()
);
=TEX
=SML
fun ⦏add_consts_types_env⦎
	(pfx_priv : PREFIX_INFO * bool)
	(bd : BASIC_DECL) : unit = (
	let	val	block1 as {declab ={in_scope, ...}, ...} = block 1;
		val	block1a = block_in_scope
				(block1, in_scope_consts_types pfx_priv (in_scope, bd));
	in	blocks := block1a :: tl(!blocks)
	end
);
=TEX
The decision about which function to call is made in $basic\_declaration$ itself.
=SML
fun ⦏basic_decl_pack_spec⦎ (basic_decl : BASIC_DECL) : unit = (
	let	val block_name1 = #block_name(#declab (block 1));
		val bn1 = expanded_name block_name1;
		val package = case (s_lookup bn1 (!pack_env)) of
			Value p => p
		|	Nil => error "basic_decl_pack_spec" 507001 [fn () => bn1];
		val para_info_opt = trans_basic_decl1 (current_cn_env, full_block_name block_name1) basic_decl;
		val pfx_info = pack_spec_prefix_info block_name1;
		val private = test_flag #private_flag 1;
		val pfx_priv = (pfx_info, private);
		val _ = update_envs_basic_decl pfx_priv basic_decl;
	in	pack_env :=
		s_enter
		bn1
		(package_consts_types pfx_priv (bn1, package, basic_decl))
		(!pack_env);
		case para_info_opt of
			Value para_infos => (
				map bd_store_para para_infos;
				add_consts_types_env pfx_priv	basic_decl
		)|	Nil =>	fail "basic_decl_pack_spec" 507041 []
	end
);
=TEX
=SML
fun ⦏basic_decl_otherwise⦎ (basic_decl : BASIC_DECL) : unit = (
	let	val side = set_current_ti_context [];
		val para_info_opt = trans_basic_decl1 (current_cn_env, []) basic_decl;
		val pfx_info = current_prefix_info 1;
		val private = test_flag #private_flag 1;
		val pfx_priv = (pfx_info, private);
		val _ = update_envs_basic_decl pfx_priv basic_decl;
	in
		case para_info_opt of
			Value para_infos => (
				map bd_store_para para_infos;
				add_consts_types_env pfx_priv basic_decl
		)|	Nil =>	fail "basic_decl_otherwise" 507041 []
	end
);
=TEX
=SML
fun ⦏basic_declaration⦎ (basic_decl : BASIC_DECL) : unit = (
	if	test_flag #pack_spec_flag 1
	then	basic_decl_pack_spec basic_decl
	else	basic_decl_otherwise basic_decl
);
=TEX
\subsection{The SID Function var\_pack\_spec}
=SML
fun ⦏var_pack_spec⦎ (var_decl : VAR_DECL) : unit = (
	if	test_flag #pack_spec_flag 1
	then	let	val block_name1 = #block_name(#declab (block 1));
			val bn1 = expanded_name block_name1;
			val package = case (s_lookup bn1 (!pack_env)) of
				Value p => p
			|	Nil => error "var_pack_spec" 507001 [fn _=>bn1];
			val pfx_info = pack_spec_prefix_info block_name1;
			val private = test_flag #private_flag 1;
			val pfx_priv = (pfx_info, private);
		in	pack_env :=
			s_enter
			bn1
			(package_vc_vars pfx_priv (package, [var_decl]))
			(!pack_env)
		end
	else
		()
);
=TEX
\subsection{The SID Function update\_envs\_var}
The decision making as to whether to call the three support functions is done in $update\_envs\_var$ itself (since it is the same test in each case).

In the following, the local function, $do1\_subunit$ does the work specified in the Z spec for one unit-name-subunit-name pair.
=SML
fun ⦏update_subunit_env_var⦎
	(pfx_info : PREFIX_INFO)
	(var_decl : VAR_DECL) : unit = (
	let	val dec_lab1 = #dec_lab (block 1);
		fun do1_subunit
			(id1_id2_s as
				(id1_id2,
				s as {in_scope as {dec_labels, ...}, ...})
					: string * SUBUNIT) = (
			if	dec_lab1 mem dec_labels
			then	(id1_id2,
				subunit_vc_vars pfx_info (s,  [var_decl]))
			else	id1_id2_s
		);
	in	subunit_env := map do1_subunit (!subunit_env)
	end
);
=TEX
In the following, the local function, $do1\_dec\_label$ does the work specified in the Z spec for one dec label.
=SML
fun ⦏update_dec_env_var⦎
	(pfx_priv : PREFIX_INFO * bool)
	(var_decl : VAR_DECL) : unit = (
	let	val dec_lab1 = #dec_lab (block 1);
		fun do1_dec_label
			(dec_label_s as
				(dec_label,
				s as {in_scope as {dec_labels, ...}, ...})
					: string * DECLAB) = (
			if	dec_lab1 mem dec_labels
			then	(dec_label,
				declab_vc_vars Nil pfx_priv (s, [var_decl]))
			else	dec_label_s
		);
	in	dec_env := map do1_dec_label (!dec_env)
	end
);
=TEX
In the following, the local function, $do1\_spec\_label$ does the work specified in the Z spec for one spec label.
The identifiers in the variable declaration are translated first.
=SML
fun ⦏update_spec_env_var⦎
	(pfx_info : PREFIX_INFO)
	(var_decl : VAR_DECL) : unit = (
	let	val dec_lab1 = #dec_lab (block 1);
		val trans_vars = map trans_id (#vars var_decl);
		fun do1_spec_label
			(spec_label_s as
				(spec_label,
				s as {spec as {w, ...},
					in_scope as {dec_labels, ...}, ...})
					: string * SPECLAB) = (
			if	dec_lab1 mem dec_labels
			then	(spec_label,
				speclab_w(
					speclab_vc_vars pfx_info (s, [var_decl]),
					trans_vars cup w))
			else	spec_label_s
		);
	in	spec_env := map do1_spec_label (!spec_env)
	end
);
=TEX
The schema conjunction from the specification is implemented as sequential composition.
=SML
fun ⦏update_envs_var⦎ (var_decl : VAR_DECL) : unit = (
	if	test_flag #declabel_flag 1
	then	let	val pfx_info = current_prefix_info 1;
			val private = test_flag #private_flag 1;
			val pfx_priv = (pfx_info, private);
		in	update_subunit_env_var pfx_info var_decl;
			update_dec_env_var pfx_priv var_decl;
			update_spec_env_var pfx_info var_decl
		end
	else	()
);
=TEX
\subsection{The SID Function update\_envs\_k\_slot}
The decision making as to whether to call the three support functions is done in $update\_envs\_k\_slot$ itself (since it is the same test in each case).
=SML
fun ⦏update_subunit_env_k_slot⦎ (lab : LABEL) : unit = (
	let	val dec_lab1 = #dec_lab (block 1);
		fun do1_subunit
			(id1_id2_s as
				(id1_id2,
				s as {in_scope as {dec_labels, ...}, ...})
					: string * SUBUNIT) = (
			if	dec_lab1 mem dec_labels
			then	(id1_id2,
				subunit_dec_labels(s, dec_labels grab lab))
			else	id1_id2_s
		);
	in	subunit_env := map do1_subunit (!subunit_env)
	end
);
=TEX
=SML
fun ⦏update_dec_env_k_slot⦎ (lab : LABEL) : unit = (
	let	val dec_lab1 = #dec_lab (block 1);
		fun do1_dec_label
			(dec_label_s as
				(dec_label,
				s as {in_scope as {dec_labels, ...}, ...})
					: string * DECLAB) = (
			if	dec_lab1 mem dec_labels
			then	(dec_label,
				declab_dec_labels(s, dec_labels grab lab))
			else	dec_label_s
		);
	in	dec_env := map do1_dec_label (!dec_env)
	end
);
=TEX
=SML
fun ⦏update_spec_env_k_slot⦎ (lab : LABEL) : unit = (
	let	val dec_lab1 = #dec_lab (block 1);
		fun do1_spec_label
			(spec_label_s as
				(spec_label,
				s as {spec as {w, ...},
					in_scope as {dec_labels, ...}, ...})
					: string * SPECLAB) = (
			if	dec_lab1 mem dec_labels
			then	(spec_label,
					speclab_dec_labels(s, dec_labels grab lab))
			else	spec_label_s
		);
	in	spec_env := map do1_spec_label (!spec_env)
	end
);
=TEX
The schema conjunction from the specification is implemented as sequential composition.
=SML
fun ⦏update_envs_k_slot⦎ (lab : LABEL) : unit = (
	if	test_flag #declabel_flag 1
	then	(update_subunit_env_k_slot lab;
		update_dec_env_k_slot lab;
		update_spec_env_k_slot lab)
	else	()
);
=TEX
\subsection{The SID Function add\_var\_env}
=SML
fun ⦏add_var_env⦎ (var_decl : VAR_DECL) : unit = (
	let	val block1 = block 1
			handle Fail _ => error "add_var_env" 507006 [];
		val block_name1 = expanded_name (#block_name(#declab block1));
		val avs = #aux_vars (
			force_value(s_lookup block_name1 (!pack_env)))
			handle Fail _ => [];
		val av_names = flat (map z_names_of_z_dec avs);
		val vars = #vars var_decl;
		val zids_in_scope = (current_cn_env, av_names);
		val pfx_info = current_prefix_info 1;
		val private = test_flag #private_flag 1;
		val pfx_priv = (pfx_info, private);
	in	map (check_new_z_id zids_in_scope) vars;
		check_new_spark_ids current_cn_env vars;
		blocks :=
		block_vc_vars Nil pfx_priv (block1, [var_decl])
		:: tl (!blocks)
	end
);
=TEX
\subsection{The SID Function add\_var\_init\_env}
=SML
fun ⦏add_var_init_env⦎ (var_decl as {vars, tmark}: VAR_DECL, init : EXP) : unit = (
	let	val block1 = block 1
			handle Fail _ => error "add_var_init_env" 507006 [];
		val block_name1 = expanded_name(#block_name(#declab block1));
		val var_inits1 = #var_inits(block1);
		fun list_extend ((a :: x) : ID list) (s : (EXP * TMARK) S_DICT) = (
			list_extend x (s_extend a (init, tmark) s)
			handle (Fail _) =>
			fail "add_var_init_env" 507043 [fn _ => a]
		) | list_extend [] s = s;
		val new_var_inits = list_extend vars var_inits1 ;
	in	blocks :=
		block_var_inits(block1, new_var_inits):: tl (!blocks)
	end
);
=TEX
\section{DECLARATIONS}\label{DECLARATIONS}
In the following, $block2$ is bound first to catch possible errors with a corrupt environment.
=SML
fun ⦏current_using_decs⦎ (() : unit) = (
	flat (map (#using_decs o #declab) (!blocks))
);
=TEX
=SML
fun ⦏k_slot_dec⦎ (label : LABEL) : unit = (
	let	val block1 = block 1;
		val block_name1 = #block_name(#declab block1);
		val declab = {
			block_name 	=	block_name1,
			flags		=	#flags(#declab block1),
			using_decs 	=	current_using_decs(),
			in_scope		= 	flatten_env (!blocks)
		};
		val dec_labels1 = #dec_labels (#in_scope (#declab block1));
	in	(dec_env := s_extend label declab (!dec_env)
		handle Fail _ => fail "k_slot_dec" 507010 [fn () => label];
		blocks :=
			block_dec_labels (block1, dec_labels1 grab label)
								:: tl (!blocks)
		)
	end
);
=TEX
\section{STATEMENTS}\label{STATEMENTS}
\subsection{Support for Processing Specification Statement}
The code that follows is essentially the implementation of {\it vc\_speclabel}
with an option not to store the generated VCs. This facility is used to
make checks on a specification statement (as statement) as soon as it is encountered
rather than waiting until someone tries to refine it (which they may never do).

The code does not follow the specification in fishing the label out of the environment
but takes it from the argument (which will have the same value in the call that actually
generates VCs and can be chosen by caller in the call that just makes checks).
The speclab is augmented by any variables brought into scope by a for-loop.

=SML
fun ⦏vcs_speclabel_aux⦎ (just_checking : bool) ({label, statement = s} : REFINED_BY) : SPEC = (
	let	val block1 = block 1;
		val statement = case s of
			SBlockStatement{statement, ...} => statement
		|	_ => s;
		val spec_env_lab = force_value( s_lookup label (!spec_env) )
			handle Fail _ => fail "vcs_speclabel" 507003
				[fn () => label];
		val {wp_env as {env, till, named_tills, return, fun_header},
			spec, in_scope, formal_body_flag,
			fun_flag, till_flag, block_name}
			= spec_env_lab;
		val current_for_vars1 = #current_for_vars block1;
		val current_log_cons1 = #current_log_cons block1;
		val in_scope0 = in_scope_vc_pars Nil (current_prefix_info 1) (in_scope, current_for_vars1);
		val in_scope1 = in_scope_vc_log_cons Nil (in_scope0, current_log_cons1);
		val wp_env1 :WP_ENV = {
			env = cn_env_of_in_scope in_scope1,
			till = till,
			named_tills = named_tills,
			return = return,
			fun_header = fun_header
		};
		val speclab : SPECLAB = {
			spec = spec,
			formal_body_flag = formal_body_flag,
			fun_flag = fun_flag,
			till_flag = till_flag,
			wp_env = wp_env1,
			in_scope = in_scope1,
			block_name = block_name
		};
		val (vcs, routes, spec) = call_vcs (speclab, statement)
	in	if just_checking then ()
		else 	store_vcs (Value label, vcs,
				Value (speclab_update_spec(speclab,spec)), routes,
				VCG_refinement
			);
		spec
	end
);
=TEX
\subsection{The SID function spec\_stmt}
The following utilities are used here and in the sequel to convert plain Z identifiers (as stored in the locals part of an ENV\_DICT) into the data structures required by the spec:
=SML
fun ⦏log_con_of_env_dict⦎ (dict : ENV_DICT) (zn : Z_ID) : Z_EXP = (
	case env_of_env_dict dict zn of
		Value{info = EIEnvLogCon{decl, ...}, ...} => decl
	|	_ =>  fail "log_con_of_env_dict" 507131 [fn _ => zn]
);
fun ⦏par_of_env_dict⦎ (dict : ENV_DICT) (zn : Z_ID) : PARAM_SPEC = (
	case env_of_env_dict dict zn of
		Value{info = EIEnvVar{tmark = tm, kind = VKPar mode}, ...} =>
			 {var_decl = {vars = [zn], tmark = tm},
			  mode = mode}
	|	_ => 	fail "par_of_env_dict" 507131 [fn _ => zn]
);
=TEX
=SML
fun ⦏aux_var_of_env_dict⦎ (dict : ENV_DICT) (zn : Z_ID) : Z_EXP = (
	case env_of_env_dict dict zn of
		Value{info = EIEnvAuxVar{decl, ...}, ...} => decl
	|	_ =>  fail "aux_var_of_env_dict" 507131 [fn _ => zn]
);
=TEX
=SML
fun ⦏var_of_env_dict⦎ (dict : ENV_DICT) (zn : Z_ID) : VAR_DECL = (
	case env_of_env_dict dict zn of
		Value{info = EIEnvVar{kind = VKVar, tmark = tm}, ...} =>
			{vars = [zn], tmark = tm}
	|	_ =>  fail "var_of_env_dict" 507131 [fn _ => zn]
);
=TEX
The decision about which support function to call is made in $spec\_stmt$ itself.
=SML
fun ⦏spec_stmt_speclabel⦎ ({spec : SPEC, label : LABEL}) : unit = (
	let	val block1 = block 1;
		val spec_lab1 = #spec_lab block1;
		val speclab2 = force_value(s_lookup spec_lab1 (!spec_env))
			handle Fail _ =>
			fail "spec_stmt_speclabel" 507014 [fn ()=> spec_lab1];
		val {formal_body_flag, fun_flag,
			wp_env as {fun_header, return, named_tills, ...},
			in_scope = in_scope2 as {dict = dict2, ...},
			block_name, ...} = speclab2;
		val _ = set_in_scope_ti_context in_scope2;
		val till = #till block1;
		val till_flag = #till_flag (#flags (#declab block1));
		val env_pars = #vc_pars (get_local_vars(#dict(flatten_env(!blocks))));
		val dict1 = #dict(#in_scope(#declab block1));
		val {vc_log_cons = vc_log_con_ids1, ...} = get_local_vars dict1;
		val vc_log_cons1 = map (log_con_of_env_dict dict1) vc_log_con_ids1;
		val in_scope0 : IN_SCOPE =
			in_scope_vc_pars Nil (current_prefix_info 1) (
				in_scope_vc_log_cons Nil (in_scope2, vc_log_cons1),
				map (par_of_env_dict dict1) env_pars);
		val env = cn_env_of_in_scope in_scope0;
		val named_tills1 =
			if	till_flag
			then	case #current_loop_name block1 of
					Value n => (n, till) :: named_tills
				|	Nil => named_tills
			else	named_tills;
		val wp_env0 :WP_ENV = {
			env = env,
			till = till,
			named_tills = named_tills1,
			return = return,
			fun_header = fun_header
		};
		val speclab : SPECLAB = {
			spec = spec,
			formal_body_flag = formal_body_flag,
			fun_flag = fun_flag,
			till_flag = till_flag,
			wp_env = wp_env0,
			in_scope = in_scope0,
			block_name = block_name
		};
		val side = set_in_scope_ti_context in_scope0;
		val chk = check_19 env Nil spec;
	in	spec_env := s_extend label speclab (!spec_env)
		handle Fail _ =>
		fail "spec_stmt_speclabel" 507015 [fn ()=> label]
	end
);
=TEX
=SML
fun ⦏spec_stmt_otherwise⦎ ({spec : SPEC, label : LABEL}) : unit = (
	let	val block1 = block 1;
		val {declab as {flags =
			{formal_body_flag,
			fun_flag,
			till_flag, ...},
			block_name = block_name, ...},
			till,
			current_formal_fun = formal_fun1 as
					{informal_fun = fun_header,
					spec = spec1 as {post = return, ...}, ...},
			current_loop_name = current_loop_name1,
			...} = block1;
		val named_tills1 =
			if	till_flag
			then	case current_loop_name1 of
					Value n => [(n, till)]
				|	Nil => []
			else	[];
		val in_scope1 : IN_SCOPE = subprog_flatten_env(!blocks);
		val side = set_in_scope_ti_context in_scope1;
		val env = cn_env_of_in_scope in_scope1;
		val wp_env1 :WP_ENV = {
			env = env,
			till = till,
			named_tills =  named_tills1,
			return = z_pred_of_z_tm env return,
			fun_header = fun_header
		};
		val speclab : SPECLAB = {
			spec = spec,
			formal_body_flag = formal_body_flag,
			fun_flag = fun_flag,
			till_flag = till_flag,
			wp_env = wp_env1,
			in_scope = in_scope1,
			block_name = block_name
		};
		val chk = check_19 env Nil spec;
	in	spec_env := s_extend label speclab (!spec_env)
		handle Fail _ =>
		fail "spec_stmt_otherwise" 507015 [fn ()=> label]
	end
);
=TEX
After doing the work prescribed by the specification, we call {\it vcs\_spec\_label\_aux}
to check the specification statement for free variables or other oddities.
=SML
fun ⦏spec_stmt⦎ (specstmt as {spec : SPEC, label : LABEL}) : SPEC = (
	(if	test_flag #speclabel_flag 1
	then	spec_stmt_speclabel
	else	spec_stmt_otherwise) specstmt;
	vcs_speclabel_aux true {label = label, statement = STNull SNImplicit}
);
=TEX
\subsection{The SID function k\_slot\_stmt}
=SML
fun ⦏k_slot_stmt⦎ (label : LABEL) : SPEC = (
	spec_stmt {	spec=
			{w = [], w0 = [], pre = z_tm_true, post = z_tm_true},
			label = label}
);
=TEX
\subsection{The SID function add\_log\_con\_env}
Note that (fortunately!), this function makes no use of the pre- and post-conditions
in the logical constant statement. Thus it does not interfere with the
strategy for efficient, early, type-checking.
=SML
fun ⦏add_log_con_env⦎ (defs : LOG_CON_DEF list) : unit = (
	let	val xs_ts = map (fn {x, t, e} => (x, t)) defs;
		val block1 = block 1;
		val side = set_current_ti_context[];
		fun make_decl (x, t) = (
			let	val zt = z_predexp_of_z_tm current_cn_env t;
				val zvar = mk_z_lvar(x, (dest_z_power_type o type_of) zt, []);
			in	mk_z_dec([zvar], zt)
			end
		);
		val zdecls = map make_decl xs_ts;
		val current_log_cons1 = #current_log_cons block1;
		val zids_in_scope = (current_cn_env, []);
		val xs = map fst xs_ts;
	in	map (check_new_z_id zids_in_scope) xs;
		check_new_spark_ids current_cn_env xs;
		blocks := block_current_log_cons (
					block_vc_log_cons Nil (block1, zdecls),
					zdecls @ current_log_cons1)
				 :: tl (!blocks)
	end
);
=TEX
\subsection{The SID function remove\_log\_con\_env}
=SML
fun ⦏remove_log_con_env⦎ (() : unit) : unit = (
	let	val block1 = block 1;
		val dict = #dict(#in_scope(#declab block1));
		val vc_log_cons = #vc_log_cons(get_local_vars dict);
		val dict' = delete_from_env_dict dict vc_log_cons;
	in	blocks := block_vc_log_cons (Value dict') (block1, []) :: tl (!blocks)
	end
);
=TEX
\section{LOOPS}\label{LOOPS}
\subsection{The SID function new\_scope\_loop}
The following function does work that is common to several new\_scope functions.
A new block is assumed just to have been pushed onto the environment.
The first parameter indicates whether items from the private
parts of packages in the topmost block should be included in the result.
The second parameter gives the name of the new declarative region, e.g., a subprogram or loop name (which latter is optional) unless this has already been set in the top block by caller.
The block name is obtained by appending the supplied name, if any, to the name of the enclosing block.
The bottom block name is always treated as empty here.
=SML
fun ⦏new_scope_common⦎
	(no : ID OPT OPT)
	(blk1 :: (more as (blk2 :: _)) : BLOCK list) : BLOCK list = (
	let	val dict1 = #dict(#in_scope(#declab blk1));
		val dict2 = #dict(#in_scope(#declab blk2));
		val dict2' = new_scope_env_dict dict2;
		val fed = flatten_env_dict dict1;
		val dict1' = add_to_env_dict dict2' fed;
		fun aux1 d [] = d
		|   aux1 d (n::ns) = aux1 (add_used_package d n) ns;
		val dict1'' = aux1 dict1' (get_used_packages dict1);
		val block_name1 = #block_name(#declab blk1);
		val block_name2 = case more of
			[_] => []
		|	_ => #block_name(#declab blk2);
		val block_name1'' = case no of
			Nil => block_name1
		|	Value n => block_name2 @ [n];
	in	block_block_name(block_dict(blk1, dict1''), block_name1'')
		::more
	end
) | new_scope_common _ other = other;
=TEX
=SML
fun ⦏opt_name_of_loop_or_block_name⦎
	(LBNoName : LOOP_OR_BLOCK_NAME) : ID OPT = (
	Nil
) | opt_name_of_loop_or_block_name (LBAdaName id) = (
	Value id
) | opt_name_of_loop_or_block_name (LBCNName id) = (
	Value id
);
=TEX
=SML
fun ⦏new_scope_loop⦎ (loop_name  :  LOOP_OR_BLOCK_NAME) : unit = (
	let	val block1 = block 1;
		val {declab as {flags as
			{fun_flag, formal_body_flag, speclabel_flag, body_flag, ...},
			in_scope, block_name, ...},
			... } = block1;
		val flags = {
			pack_spec_flag = false,
			pack_body_flag = false,
			stub_flag = false,
			subunit_flag = false,
			formal_body_flag = formal_body_flag,
			fun_flag = fun_flag,
			declabel_flag = false,
			speclabel_flag = speclabel_flag,
			till_flag = false,
			body_flag = body_flag,
			private_flag = false
		};
		val ln = opt_name_of_loop_or_block_name loop_name;
		val block = block_declab(block1, {
					block_name = block_name,
					flags = flags,
					using_decs = [],
					in_scope = in_scope});
		val block1 = block_current_loop_name(block, ln);
	in	blocks := new_scope_common (Value ln) (block1 :: !blocks)
	end
);
=TEX

\subsection{The SID function end\_scope}
=SML
fun ⦏end_scope⦎ (():unit) : unit = (
	(blocks := tl (! blocks))
	handle Fail _ => error "end_scope" 507006 []
);
=TEX
\subsection{The SID function for\_param}
=SML
fun ⦏for_param⦎ (i : ID, tmark : TMARK) : unit = (
	let	val block1 = block 1;
		val block2 = block 2;
		val param_spec = {	mode = MSparkIn false,
					var_decl = {vars = [i], tmark = tmark}};
		val new_for_vars = #current_for_vars block2 grab param_spec;
	in	blocks := block_current_for_vars(
					block_vc_pars Nil (current_prefix_info 1) (block1, [param_spec]),
					new_for_vars)
				:: block_current_for_vars
					(block2, new_for_vars)
				:: (tl o tl) (!blocks)
	end
);
=TEX
\subsection{The SID function till\_pred}
In the following, in order to type-check the till-predicate correctly, we need to make sure that any variable declarations which should be in scope are in scope.
If the till-predicate occurs immediately inside a subprogram body, there is nothing much to do --- the processing of formal parameters and variable declarations will already have planted the necessary information in the running environment.
If the till-predicate is in a refinement step, then we must adjust the type inference context in much the same was as is done in $vcs\_speclabel$.
=SML
fun ⦏till_pred⦎ (t : Z_TM) : unit = (
	let	val block1 = block 1;
		val label = #spec_lab block1;
		fun set_cxt()  : CN_ENV = (
		if	test_flag #speclabel_flag 1
		then	let	val spec_env_lab =
				force_value( s_lookup label (!spec_env) );
				val {in_scope, ...} = spec_env_lab;
				val current_for_vars1 = #current_for_vars block1;
				val current_log_cons1 = #current_log_cons block1;
				val in_scope0 = in_scope_vc_pars Nil (current_prefix_info 1) (in_scope, current_for_vars1);
				val in_scope1 = in_scope_vc_log_cons Nil (in_scope0, current_log_cons1);
			in	(set_in_scope_ti_context in_scope1; cn_env_of_in_scope in_scope1)
			end	handle Fail _ => (set_current_ti_context[]; current_cn_env)
		else	(set_current_ti_context[]; current_cn_env)
		);
		val env = set_cxt();
		val till = z_pred_of_z_tm env t;
	in	blocks := block_till (block_till_flag(block1, true), till)
		:: tl (!blocks)
	end
);
=TEX
\section{BLOCKS}
=TEX
\subsection{The SID function new\_block}
=SML
fun ⦏new_scope_block⦎ (bn : LOOP_OR_BLOCK_NAME) : unit = (
	let	val block1 = block 1;
		val block_name1 = #block_name(#declab block1);
		val no = opt_name_of_loop_or_block_name bn;
		val block_name0 = block_name1 @ [no];
		val block0 = block_block_name(block1, block_name0);
		val _ = blocks := new_scope_common Nil (block0 :: !blocks);
		val en = expanded_name block_name0;
		val blk_thyn = en ^ block_tag;
		val scope_entry = {theory = blk_thyn, deferred = DSNotDeferred, body_labels = Nil};
		val _ = scope_env :=
			e_extend en scope_entry (!scope_env)
			handle Fail _ => (
				fail "new_scope_block" 507143
				[fn () => en]
			);
		val old_cur_thy = get_current_theory_name();
		val err_no = case bn of LBNoName => 507153 | _ => 507152;
		val _ = make_subprog_module err_no en blk_thyn;
	in	open_theory blk_thyn
	end
);
=TEX
\subsection{The SID function update\_spec\_env\_block}
In the intended uses of merge\_in\_scopes, we are in an inner scope and using declarations are neither allowed nor relevant.
=SML
fun ⦏merge_in_scopes⦎
	({	dict=dict1,
		dec_labels = dec_labels1} : IN_SCOPE)
	({	dict = dict2,
		dec_labels = dec_labels2} : IN_SCOPE) : IN_SCOPE = (
	{	dict = add_to_env_dict dict1 (flatten_env_dict dict2),
		dec_labels = dec_labels1 cup dec_labels2
	}
);
=TEX
=SML
fun ⦏update_spec_env_block⦎ (():unit) : unit = (
	let	val block1 = block 1;
		val label = #spec_lab block1;
		val speclab3 = force_value( s_lookup label (!spec_env) )
			handle Fail _ => fail "update_spec_env_block" 507003
				[fn () => label];
		val dict2 = #dict(#in_scope(#declab(block 2)));
		val vc_vars = #vc_vars(get_local_vars(#dict(#in_scope(#declab block1))));
		fun outer v = not(is_Nil (env_of_env_dict dict2 v));
		val block_vars = vc_vars drop outer;
		val vc_inits1 = #var_inits(block1);
		val w3 = #w(#spec speclab3);
		val w4 = w3 cup block_vars;
		val in_scope1 = #in_scope(#declab block1);
		val in_scope3 = #in_scope speclab3;
		val in_scope4 = merge_in_scopes in_scope3 in_scope1;
		val pre4 =  var_inits_pre
				(Value (#pre(#spec speclab3)))
				vc_inits1
				(cn_env_of_in_scope in_scope4)
			handle exn =>
			pass_on exn "var_inits_pre" "update_spec_env_block";
		val speclab4 = speclab_in_scope(speclab_w(speclab_pre(speclab3, pre4), w4), in_scope4);
	in	spec_env := s_enter label speclab4 (!spec_env)
	end
);
=TEX
\section{SUBPROGRAM DECLARATIONS}\label{SUBPROGRAMDECLARATIONS}
The SID function $end\_scope$ used in processing these has already been defined in section \ref{LOOPS}.
\section{PROCEDURES}\label{PROCEDURES}
\subsection{The SID function subunit\_form}
This SID function and the next are best handled by a common function with a parameter to determine what to do.
=SML
fun ⦏subunit_form_inf⦎ (ident : ID, is_inf : bool) : unit = (
	if	test_flag #subunit_flag 1
	then	let	val block = hd(!blocks);
			val block_name = #block_name(#declab block);
			val tbn_id = subunit_env_index block_name ident;
			val subunit1 = (force_value(s_lookup tbn_id (!subunit_env)))
				handle Fail _ =>
				fail "subunit_form_inf" 507011
						[fn()=>expanded_name block_name, fn()=>ident];
			val fbn = full_block_name block_name;
			val su_name = prefix_trans_id fbn ident;
			val _ = new_parent_aux false (su_name ^ context_tag);
			val in_scope' = #in_scope subunit1;
			val block' = block_in_scope(block, in_scope');
		in	blocks := new_scope_common Nil (block' :: tl (!blocks));
			if	is_inf
			then	(
				(if	#specif_flag subunit1
				 then	cn_soundness_warning "subunit_inf_form" 507136 [fn()=>ident, fn () => expanded_name block_name]
				 else	());
				subunit_env := s_delete tbn_id (!subunit_env);
				deletion_info := s_enter tbn_id subunit1 (!deletion_info))
			else	()
		end
	else	()
);
=TEX
=SML
fun ⦏subunit_form⦎ (ident : ID) : unit = (
	subunit_form_inf (ident, false)
);
=TEX
\subsection{The SID function subunit\_inf}
=SML
fun ⦏subunit_inf⦎ (ident : ID) : unit = (
	subunit_form_inf (ident, true)
);
=TEX
\subsection{The SID function new\_scope\_proc\_inf}
=SML
fun ⦏new_scope_proc_inf⦎ (ident : ID) : unit = (
	let	val block = block_flags(empty_block, false_flags);
	in	blocks := new_scope_common(Value(Value ident))(block :: !blocks)
	end
);
=TEX
\subsection{The SID function new\_scope\_proc\_form}
=SML
fun ⦏new_scope_proc_form⦎ (ident : ID) : unit = (
	let	val flags = {
			pack_spec_flag = false,
			pack_body_flag = false,
			stub_flag = false,
			subunit_flag = false,
			formal_body_flag = true,
			fun_flag = false,
			declabel_flag = false,
			speclabel_flag = false,
			till_flag = false,
			body_flag = false,
			private_flag = false
		};
		val block = block_flags(empty_block, flags);
	in	blocks := new_scope_common(Value(Value ident))(block :: !blocks)
	end
);
=TEX
\subsection{The SID function stub}
This corresponds to $make\_module$ as used in the Z spec.
=SML
fun ⦏stub⦎ (() : unit) : unit = (
	if	test_flag #stub_flag 2
	then	let	val block1 = block 1;
			val block2 = block 2;
			val block_name1 = #block_name (#declab block1);
			val block_name2 = #block_name (#declab block2);
			val id2 = simple_name block_name1;
			val id1 = block_name2;
			val id1_id2 = subunit_env_index id1 id2;
			val subunit = {
				in_scope	=	flatten_env(!blocks),
				specif		=	dummy_spec,
				specif_flag	=	false,
				zmod		=	id1_id2,
				globs		=	[]
			};
		in	make_module 507026 id1_id2 (id1_id2 ^ context_tag);
			subunit_env := s_enter id1_id2 subunit (!subunit_env)
		end
	else	()
);
=TEX
The following does all the work for $stub\_spec\_proc$ and $stub\_spec\_fun$.
=SML
fun ⦏stub_spec_proc_fun⦎
		(spec : SPEC) (globs : Z_ID list) : unit = (
	if	test_flag #stub_flag 2
	then	let	val block1 = block 1;
			val block2 = block 2;
			val block3 = block 3;
			val block_name1 = #block_name (#declab block1);
			val block_name2 = #block_name (#declab block2);
			val id2 = simple_name block_name1;
			val id1 = block_name2;
			val tid1_id2 = subunit_env_index id1 id2;
			val subunit = force_value(s_lookup tid1_id2(!subunit_env))
				handle Fail _ =>
				fail "stub_spec_proc_fun" 507011
						[fn()=>simple_name id1, fn()=>id2];
			val in_scope' = subprog_flatten_env (!blocks);
			val subunit' = {
				in_scope	= in_scope',
				specif		= spec,
				specif_flag	= true,
				zmod		= #zmod subunit,
				globs		= globs
			};
		in	subunit_env := s_enter tid1_id2 subunit' (!subunit_env)
		end
	else	()
);
=TEX
=SML
fun ⦏stub_spec_proc⦎ (form_proc : FORMAL_PROC) : unit = (
	stub_spec_proc_fun (#spec form_proc) (#globals form_proc)
);
=TEX
\subsection{The function update\_envs\_inf\_proc}

=SML
fun ⦏update_subunit_env_inf_proc⦎
	(pfx_info : PREFIX_INFO)
	(id : ID) : unit = (
	let	val dec_lab2 = #dec_lab (block 2);
		fun do1_subunit
			(id1_id2_s as
				(id1_id2,
				s as {in_scope as {dec_labels, ...}, ...})
					: string * SUBUNIT) = (
			if	dec_lab2 mem dec_labels
			then	(id1_id2,
				subunit_informal_proc pfx_info (s, id))
			else	id1_id2_s
		);
	in	subunit_env := map do1_subunit (!subunit_env)
	end
);
=TEX
In the following, the local function, $do1\_dec\_label$ does the work specified in the Z spec for one dec label.
=SML
fun ⦏update_dec_env_inf_proc⦎
	(pfx_info : PREFIX_INFO)
	(id : ID) : unit = (
	let	val dec_lab2 = #dec_lab (block 2);
		fun do1_dec_label
			(dec_label_d as
				(dec_label,
				d as {in_scope as {dec_labels, ...}, ...})
					: string * DECLAB) = (
			if	dec_lab2 mem dec_labels
			then	(dec_label,
				declab_informal_proc pfx_info (d, id))
			else	dec_label_d
		);
	in	dec_env := map do1_dec_label (!dec_env)
	end
);
=TEX
In the following, the local function, $do1\_spec\_label$ does the work specified in the Z spec for one spec label.
The identifiers in the variable declaration are translated first.
=SML
fun ⦏update_spec_env_inf_proc⦎
	(pfx_info : PREFIX_INFO)
	(id : ID) : unit = (
	let	val dec_lab2 = #dec_lab (block 2);
		fun do1_spec_label
			(spec_label_s as
				(spec_label,
				s as {spec as {w, ...},
					in_scope as {dec_labels, ...}, ...})
					: string * SPECLAB) = (
			if	dec_lab2 mem dec_labels
			then	(spec_label,
				speclab_informal_proc pfx_info (s, id))
			else	spec_label_s
		);
	in	spec_env := map do1_spec_label (!spec_env)
	end
);
=TEX
The schema conjunction from the specification is implemented as sequential composition.
=SML
fun ⦏update_envs_inf_proc⦎ (id : ID) : unit = (
	if	test_flag #declabel_flag 2 andalso test_flag #formal_body_flag 1
	then	let	val pfx_info = current_prefix_info 2;
		in	update_subunit_env_inf_proc pfx_info id;
			update_dec_env_inf_proc pfx_info id;
			update_spec_env_inf_proc pfx_info id
		end
	else	()
);
=TEX
\subsection{The SID function inf\_proc}
=SML
fun ⦏inf_proc_pack_body⦎ (name : ID) : unit = (
	if	test_flag #pack_body_flag 2
	then	let	val block2 = block 2;
			val block_name2 = expanded_name (#block_name(#declab block2));
			val package4 = (force_value(s_lookup block_name2 (!pack_env)))
				handle Fail _ =>
				error "inf_proc" 507012
						[fn()=>block_name2];
			val formal_procs4 = #formal_procs package4;
		in	if	any formal_procs4 (fn p => #name p = name)
			then	cn_soundness_warning "inf_proc" 507135 [fn()=>name, fn () => block_name2]
			else	()
		end
	else	()
);
=TEX
=SML
fun ⦏inf_proc⦎ (name : ID) : unit = (
	if	test_flag #pack_spec_flag 2
	then
		let	val block2 = block 2;
			val block_name2 = #block_name(#declab block2);
			val bn2 = expanded_name block_name2;
			val package =
				(force_value(s_lookup bn2 (!pack_env)))
				handle Fail _ =>
				error "inf_proc_pack_spec" 507012 [fn()=>bn2];
			val pfx_info = pack_spec_prefix_info block_name2;
			val private = test_flag #private_flag 2;
			val pfx_priv = (pfx_info, private);
		in	pack_env :=
			s_enter
			bn2
			(package_informal_proc pfx_priv (package, name))
			(!pack_env)
		end
	else	inf_proc_pack_body name
);
=TEX
\subsection{The SID function form\_proc}
The following is the meat of $vcs\_body\_proc$, placed here to allow
a check to be made of the VCs of a procedure specification in a package
specification.
=SML
fun ⦏vcs_body_proc_aux⦎ (st : STATEMENT)
			: (LABEL * (TERM list *ROUTE OPT list * SPEC) * SPECLAB ) = (
	let	val block1 = block 1;
		val block_name1 = #block_name(#declab block1);
		val block2 = block 2;
		val pack_body_flag2 = #pack_body_flag (#flags (#declab block2));
		val current_formal_proc1 = #current_formal_proc block1;
		val vc_vars1 = #vc_vars(get_local_vars(#dict(#in_scope(#declab block1))));
		val vc_inits1 = #var_inits(block1);
		val post1 = #post(#spec current_formal_proc1);
		val w1 = #w(#spec current_formal_proc1);
		val w = w1 cup vc_vars1;
		val in_scope = subprog_flatten_env (!blocks);
		val current_for_vars1 = #current_for_vars block1;
		val current_log_cons1 = #current_log_cons block1;
		val in_scope0 = in_scope_vc_pars Nil (current_prefix_info 1) (in_scope, current_for_vars1);
		val in_scope1 = in_scope_vc_log_cons Nil (in_scope0, current_log_cons1);
		val _ = set_current_ti_context
			(ti_context_of_formal_proc current_cn_env current_formal_proc1);
		val env  = cn_env_of_in_scope in_scope1;
		val wp_env :WP_ENV = {
			env = env,
			till = mk_z_true,
			named_tills = [],
			return = z_pred_of_z_tm env post1,
			fun_header = dummy_informal_fun
		};
		val pre1 =  var_inits_pre
				(Value (#pre(#spec current_formal_proc1)))
				vc_inits1
				env
			handle exn =>
			pass_on exn "var_inits_pre" "vcs_body_proc_aux";
		val spec : SPEC = add_init_vars_spec {
			w = w,
			w0 = [],
			pre = pre1,
			post = post1
		};
		val speclab : SPECLAB = {
			spec = spec,
			formal_body_flag = true,
			fun_flag = false,
			till_flag = false,
			wp_env = wp_env,
			in_scope = in_scope1,
			block_name = block_name1
		};
	in	(expanded_name block_name1,
		 call_vcs (speclab, st), speclab)
	end
);
=TEX
=SML
fun ⦏subs_formals_spec⦎ (
	pars : PARAM_SPEC list,
	spec as {
		w,
		w0,
		pre = ZTmQuotation(z_pre, tyo1),
		post = ZTmQuotation(z_post, tyo2)} : SPEC,
	ys : ID list) : PARAM_SPEC list * SPEC = (
	let	val xs = flat (map (#vars o #var_decl) pars);
	in	if	xs =  ys
		then	(pars, spec)
		else	let	val xs = flat (map (#vars o #var_decl) pars);
				val xs0 = xs @ map init_var xs;
				val ys0 = ys @ map init_var ys;
				val xs0_ys0 = combine xs0 ys0;
				fun subs_id n = lassoc1 xs0_ys0 n;
				fun do_param_spec {var_decl = {vars, tmark}, mode} = (
					{var_decl = {vars = map subs_id vars, tmark = tmark},
					 mode = mode}
				);
				val new_pars = map do_param_spec pars;
				val new_w = map subs_id w;
				val new_pre = z_quote(subs_pred (z_pre, xs0, ys0), tyo1);
				val new_post = z_quote(subs_pred (z_post, xs0, ys0), tyo2);
			in	(new_pars,
				add_init_vars_spec {w = new_w,
				w0 = [],
				pre = new_pre,
				post = new_post})
			end
	end
) | subs_formals_spec _ = fail "subs_formals_spec" 507076 [];
=TEX
=SML
fun ⦏form_proc_pack_spec⦎ (form_proc as {
		name,
		formal_ids,
		par_names_defs,
		globals,
		spec
	} : FORMAL_PROC) : unit = (
	let	val block2 = block 2;
		val block_name2 = #block_name(#declab block2);
		val bn2 = expanded_name block_name2;
		val package =
			(force_value(s_lookup bn2 (!pack_env)))
			handle Fail _ =>
			error "form_proc_pack_spec" 507012 [fn()=>bn2];
		val (formal_ids1, spec1) =
			subs_formals_spec(formal_ids, spec, map fst par_names_defs);
		val form_proc1 = {
			name = name,
			formal_ids = formal_ids1,
			par_names_defs = par_names_defs,
			globals = globals,
			spec = spec1};
		val pfx_info = pack_spec_prefix_info block_name2;
		val private = test_flag #private_flag 2;
		val pfx_priv = (pfx_info, private);
	in	pack_env :=
		s_enter
		bn2
		(package_formal_proc pfx_priv (package, form_proc1))
		(!pack_env)
	end
);
=TEX
The following function is common to {\it form\_proc\_pack\_body\_common},
{\it form\_proc\_subunit}.
=SML
fun ⦏expand_aux_vars_to_conc_vars⦎
	(using_decs : (Z_ID * (VAR_DECL list * Z_PRED)) list)
	(unex : Z_ID list) : Z_ID list = (
	let	fun aux zn = (
			map trans_id(flat(map #vars (fst(force_value(s_lookup zn using_decs)))))
			handle Fail _ => [zn]
		);
	in	flat (map aux unex)
	end
);
=TEX
The following function is common to {\it form\_proc\_pack\_body\_common},
{\it form\_proc\_subunit}.
=SML
fun ⦏check_globals_proc⦎ (block_name1 : string)
	(using_decs : (Z_ID * (VAR_DECL list * Z_PRED)) list)
	(fp : FORMAL_PROC) (globals3 : Z_ID list) : unit = (
	if	is_nil ((#globals fp diff #w (#spec fp)) diff expand_aux_vars_to_conc_vars using_decs globals3)
	then	()
	else	let	fun fmt_strs [] () = (
				"empty list of global dependencies"
			) | fmt_strs strs () = (
				format_list Combinators.I strs ", "
			);
		in	fail "check_globals_proc" 507058
			[fmt_strs (#globals fp diff #w (#spec fp)), fmt_strs globals3,
			fn()=>block_name1]
		end
);
=TEX
=SML
fun ⦏check_not_implicit⦎ (implicit : bool) : unit = (
	if 	implicit
	then	fail "check_not_implicit" 507137 []
	else	()
);
=TEX

=SML
fun ⦏form_proc_pack_body_common⦎
	(implicit : bool) (form_proc: FORMAL_PROC)
	: (BLOCK * FORMAL_PROC * PACKAGE * SPECLAB * ID list) OPT = (
	let	val block1 = block 1;
		val block2 = block 2;
		val block_name1 = #block_name(#declab block1);
		val bn1 = simple_name block_name1;
		val block_name2 = #block_name(#declab block2);
		val bn2 = expanded_name block_name2;
		val package4 = (force_value(s_lookup bn2 (!pack_env)))
			handle Fail _ =>
			error "form_proc_pack_body_common" 507012
					[fn()=>bn2];
		val formal_procs4 = #formal_procs package4;
	in	if	any
			formal_procs4
			(fn p => #name p = bn1)
		then
	let
		val formal_proc3 =
			find
			formal_procs4
			(fn p => #name p = bn1);
		val _ = check_globals_proc bn1
			(#using_decs (#declab block2))
			form_proc (#globals formal_proc3);
		val dict2 = #dict(#in_scope(#declab block2));
		val vc_vars2 = map (var_of_env_dict dict2) (#vc_vars(get_local_vars dict2));
		val vc_vars4 = #vc_vars package4;
		val dict1 = #dict(#in_scope(#declab block1));
		val vc_par_ids1 = #vc_pars(get_local_vars dict1);
		val in_scope5a = subprog_flatten_env(!blocks);
		val dict5a = #dict in_scope5a;
		val {vc_vars = vc_var_ids5, vc_aux_vars = vc_aux_var_ids5a, ...} =
			get_local_vars dict5a;
		val aux_var_ids4 = map (fst o dest_var)
				(flat (map (fst o dest_z_dec)(#aux_vars package4)));
		val vc_aux_var_ids5 = vc_aux_var_ids5a diff aux_var_ids4;
		val cn_scope = vc_par_ids1 cup vc_aux_var_ids5 cup vc_var_ids5;
		val dict5 = set_cn_scope dict5a cn_scope;
		val in_scope5 = {
			dec_labels = [],
			dict = dict5
		};
		val wp_env5 :WP_ENV = {
			env = cn_env_of_in_scope in_scope5,
			till = mk_z_true,
			named_tills = [],
			return = mk_z_true,
			fun_header = dummy_informal_fun
		};
		val fbn2 = full_block_name block_name2;
		val vc_var_names4 = map (prefix_trans_id fbn2)
			(flat (map #vars vc_vars4));
		val vc_var_names2 = map trans_id (flat (map #vars vc_vars2));
		val pack_body_var_names = vc_var_names2 diff vc_var_names4;
		val spec3 = #spec formal_proc3;
		val w5 = (#w spec3) cup pack_body_var_names;
		val spec5 : SPEC = add_init_vars_spec {
			w = w5,
			w0 = [],
			pre = #pre spec3,
			post = #post spec3
		};
		val speclab5 : SPECLAB = {
			spec = spec5,
			formal_body_flag = false,
			fun_flag = false,
			till_flag = false,
			wp_env = wp_env5,
			in_scope = in_scope5,
			block_name = block_name2
		};
		val abn2 = ada_block_name block_name2;
	in
		Value (block2, formal_proc3, package4, speclab5, abn2)
	end
		else if	implicit
		andalso	not(bn1 mem #informal_procs package4)
		then	(check_not_implicit true; Nil)
		else	Nil
	end
);
=TEX
The default values for the $speclab$ in the following function are set up by the common function above.
=SML
fun ⦏form_proc_pack_body⦎
	(block2 : BLOCK, formal_proc3 : FORMAL_PROC,
		package4 : PACKAGE, speclab5 : SPECLAB, _ : ID list)
	(form_proc: FORMAL_PROC) : SPEC = (
	let	val (vcs, routes, spec) = call_vcs_spec (speclab5, #spec form_proc);
	in	store_vcs (
			Nil, vcs,
			Value (speclab_update_spec(speclab5,spec)), routes,
			VCG_subprogram_spec
		);
		spec
	end
);
=TEX
In the following, the first parameter tuple is the information returned from $form\_proc\_pack\_body\_common$;
the second parameter is the list of auxiliary variables (as HOL terms) returned by $aux\_vars\_in\_fp\_frame$.
N.B. this function relies on the type inference context set up in $aux\_vars\_in\_fp\_frame$.
=SML
fun ⦏form_proc_pack_body_aux⦎
	(block2 : BLOCK, formal_proc3 : FORMAL_PROC,
	 package4 : PACKAGE, speclab5 : SPECLAB, pack_name : ID list)
	(avs : TERM list)
	(form_proc: FORMAL_PROC) : SPEC = (
	let	val block1 = block 1;
		val spec3 = #spec formal_proc3;
		val w3 = #w spec3;
		val add_aux = avs drop (fn v => fst(dest_var v) mem w3);
		val w6 = w3 cup map (fst o dest_var) add_aux;
		val pre6 = #pre spec3;
		val post3 = #post spec3;
		val add_aux0 = map ((fn (n, ty) => mk_var(n^"⋎0", ty)) o dest_var)
					add_aux;
		val post6 = z_quote (z_many_and
						([z_pred_of_z_tm current_cn_env post3] @
						 map z_eq (combine add_aux add_aux0)),
				Nil);
		val aux_vars4 = #aux_vars package4;
		val aux_vars_decs = map dest_z_dec aux_vars4;
		val aux_vars_newdecs = flat (map (fn (tml,ty) =>
						map (fn t => (t,ty)) tml)
							aux_vars_decs);
		val aux_vars_tab = map (fn (tm, ty) => (dest_z_lvar tm, ty))
								aux_vars_newdecs;
		val aux_vars_tab1 = aux_vars_tab drop
					(fn ((s, _, _), _) => not(s mem w6));
		val aux_vars = map (fn (lv,ty) => mk_z_dec([mk_z_lvar lv], ty))
					aux_vars_tab1;
		val aux_vars_tab0 = map (fn ((s,y,z),t) => ((s^"⋎0",y,z),t))
							aux_vars_tab1;
		val aux_vars0 = map (fn (lv,ty) => mk_z_dec([mk_z_lvar lv], ty))
					aux_vars_tab0;
		val seq_aux = aux_vars0;
		val using_decs2 = #using_decs(#declab block2);
		val ud2_rel_image = (using_decs2 drop
						(fn n => not (fst n mem w6)));
		val conc_vars = (list_cup o map fst o map snd) ud2_rel_image;
		val invs = (map snd o map snd) ud2_rel_image;
		val frame_aux_conc = w6 cup (list_cup (
					map (map trans_id o #vars) conc_vars));
		val frame_aux_conc0 = map (fn s => s^"⋎0") frame_aux_conc;

		val w5 = frame_aux_conc cup (#w (#spec speclab5));
		val block_name5 = #block_name speclab5;
		val in_scope5 = #in_scope speclab5;
		val pfx_info = body_prefix_info (map Value pack_name);
		val pfx_priv = (pfx_info, false);
		val in_scope5a = in_scope_vc_vars Nil pfx_priv (in_scope5,  conc_vars);
		val env5a = cn_env_of_in_scope in_scope5a;
		val wp_env5a :WP_ENV = {
			env = env5a,
			till = mk_z_true,
			named_tills = [],
			return = mk_z_true,
			fun_header = dummy_informal_fun
		};
		val pre5 = z_quote (z_exists (aux_vars,
				z_many_and(z_pred_of_z_tm  env5a pre6::invs)),
				Nil);
		val post5 = z_quote (z_forall (seq_aux, z_imp (subs_pred (
			  z_many_and (z_pred_of_z_tm  env5a pre6::invs),
					frame_aux_conc, frame_aux_conc0),
			    z_exists (aux_vars,
				z_many_and(z_pred_of_z_tm env5a post6::invs)))),
			Nil);
		val spec5 : SPEC = add_init_vars_spec {
			w = w5,
			w0 = [],
			pre = pre5,
			post = post5
		};
		val speclab5a : SPECLAB = {
			spec = spec5,
			formal_body_flag = false,
			fun_flag = false,
			till_flag = false,
			wp_env = wp_env5a,
			in_scope = in_scope5a,
			block_name = block_name5
		};
		val (vcs, routes, spec) = call_vcs_spec (speclab5a, #spec form_proc);
	in	store_vcs (
			Nil, vcs,
			Value (speclab_update_spec(speclab5a,spec)), routes,
			VCG_subprogram_spec
		);
		spec
	end
);
=TEX
=SML
fun ⦏form_proc_subunit⦎ (form_proc: FORMAL_PROC) : unit = (
	let	val block1 = block 1;
		val block2 = block 2;
		val block_name1 = #block_name(#declab block1);
		val bn1 = simple_name block_name1;
		val block_name2 = #block_name(#declab block2);
		val tbn1_bn2 = subunit_env_index block_name2 bn1
		val subunit3 = (force_value(s_lookup tbn1_bn2 (!subunit_env)))
			handle Fail _ => fail "form_proc_subunit" 507011
					[fn()=>simple_name block_name2, fn()=>bn1];
	in	subunit_env := s_delete tbn1_bn2 (!subunit_env);
		deletion_info := s_enter tbn1_bn2 subunit3 (!deletion_info);
		if	#specif_flag subunit3
		then
	let	val _ = check_globals_proc bn1 [] form_proc (#globs subunit3);
		val dict3 = #dict(#in_scope subunit3);
		val {vc_vars = vc_var_ids3, vc_pars = vc_par_ids3,
			vc_aux_vars = vc_aux_var_ids3, ...} = get_local_vars dict3;
		val dict1 = #dict(#in_scope(#declab block1));
		val vc_par_ids1 = #vc_pars(get_local_vars dict1);
		val vc_pars1 = map (par_of_env_dict dict1) vc_par_ids1;
		val cn_scope = vc_par_ids1 cup vc_par_ids3 cup
			vc_aux_var_ids3 cup vc_var_ids3;
		val in_scope4a ={
			dec_labels = [],
			dict = set_cn_scope dict3 cn_scope
		};
		val in_scope4 =in_scope_vc_pars Nil (current_prefix_info 1) (in_scope4a, vc_pars1);
		val wp_env4 :WP_ENV = {
			env = cn_env_of_in_scope in_scope4,
			till = mk_z_true,
			named_tills = [],
			return = mk_z_true,
			fun_header = dummy_informal_fun
		};
		val speclab4 : SPECLAB = {
			spec = #specif subunit3,
			formal_body_flag = false,
			fun_flag = false,
			till_flag = false,
			wp_env = wp_env4,
			in_scope = in_scope4,
			block_name = block_name2
		};
		val (resulting_vcs, routes, spec) = call_vcs_spec (speclab4, #spec form_proc)
	in	store_vcs (
			Nil, resulting_vcs,
			Value (speclab_update_spec(speclab4,spec)), routes,
			VCG_subunit_spec
		)
	end
		else	()
	end
);
=TEX
=SML
fun ⦏check_formal_proc⦎ (form_proc as
	{name, spec, globals, formal_ids, par_names_defs} : FORMAL_PROC) : FORMAL_PROC = (
	let	val block1 = block 1;
		val block_name1 = #block_name(#declab block1);
		val in_scope = subprog_flatten_env_aux (name, globals @ #w spec) (!blocks);
		val wp_env :WP_ENV = {
			env = cn_env_of_in_scope in_scope,
			till = mk_z_true,
			named_tills = [],
			return = mk_z_true,
			fun_header = dummy_informal_fun
		};
		val speclab : SPECLAB = {
			spec = #spec form_proc,
			formal_body_flag = false,
			fun_flag = false,
			till_flag = false,
			wp_env = wp_env,
			in_scope = in_scope,
			block_name = block_name1
		};
		val (_, _, tc_spec) = call_vcs (speclab, (STNull SNImplicit));
	in	{name = name, spec = tc_spec, globals = globals,
			formal_ids = formal_ids, par_names_defs = par_names_defs}
	end
);
=TEX
=SML
fun ⦏z_par_decl⦎ (par_spec : PARAM_SPEC) : Z_DECL = (
	let	fun aux1 ({vars, tmark} : VAR_DECL) : Z_DECL = (
			let	val e = (zid current_cn_env o trans_id) tmark;
				val ty = (dest_z_power_type o type_of) e;
				fun v var = mk_z_lvar(var, ty, []);
			in	mk_z_dec(map v vars, e)
			end
		);
	in	(aux1 o #var_decl) par_spec
	end
	handle exn => pass_on exn "zid" "z_par_decl"
);
=TEX
The following function is required to determine whether $form\_proc$ should call $form\_proc\_pack\_body$ or $form\_proc\_pack\_body\_aux$.
It computes a list of HOL terms representing the set of variables which is tested in the first clause in the predicate part of the corresponding Z schemas in the specification.
=SML
fun ⦏aux_vars_in_formal_proc⦎ (formal_proc3 as {formal_ids, ...} : FORMAL_PROC)
			(package4 : PACKAGE) : TERM list = (
	let	val spec3 = #spec formal_proc3;
		val w3 = #w (#spec formal_proc3);
		val w3globs = w3 cup #globals formal_proc3;
		val aux_vars4 = #aux_vars package4;
		val aux_vars4_tms = (flat o map fst o map dest_z_dec) aux_vars4;
	in
		aux_vars4_tms drop (fn v => not (fst (dest_var v) mem w3globs))
	end
);
=TEX
=SML
fun ⦏form_proc⦎ (implicit : bool)
	(frm_prc: FORMAL_PROC) : unit = (
	if		test_flag #pack_spec_flag 2
	then		(check_not_implicit implicit;
			form_proc_pack_spec frm_prc)
	else if		test_flag #pack_body_flag 2
	then
		case form_proc_pack_body_common implicit frm_prc of
		Value (info as (_, formal_proc3, package4, _, _)) => (
			case aux_vars_in_formal_proc formal_proc3 package4 of
				[]	 => (form_proc_pack_body info frm_prc; ())
			|	auxvars => (form_proc_pack_body_aux info auxvars frm_prc; ())
		) | Nil =>	()
	else if		test_flag #subunit_flag 2
	then		(check_not_implicit implicit;
			form_proc_subunit frm_prc)
	else		(check_not_implicit implicit)
);
=TEX
\subsection{The SID function curr\_form\_proc}
=SML
fun ⦏curr_form_proc⦎ (formal_proc : FORMAL_PROC) : unit = (
	let	val block1 = block 1;
	in	blocks :=
		block_current_formal_proc (block1, formal_proc) :: tl(!blocks)
	end
);
=TEX
\section{FUNCTIONS}\label{FUNCTIONS}
\subsection{The SID function new\_scope\_fun\_inf}
=TEX
=SML
fun ⦏new_scope_fun_inf⦎ (ident : ID) : unit = (
	let	val flags = {
			pack_spec_flag = false,
			pack_body_flag = false,
			stub_flag = false,
			subunit_flag = false,
			formal_body_flag = false,
			fun_flag = true,
			declabel_flag = false,
			speclabel_flag = false,
			till_flag = false,
			body_flag = false,
			private_flag = false
		};
		val block = block_flags(empty_block, flags);
	in	blocks := new_scope_common(Value(Value ident))(block :: !blocks)
	end
);
=TEX
\subsection{The SID function new\_scope\_fun\_form}
=TEX
=SML
fun ⦏new_scope_fun_form⦎ (ident : ID) : unit = (
	let	val flags = {
			pack_spec_flag = false,
			pack_body_flag = false,
			stub_flag = false,
			subunit_flag = false,
			formal_body_flag = true,
			fun_flag = true,
			declabel_flag = false,
			speclabel_flag = false,
			till_flag = false,
			body_flag = false,
			private_flag = false
		};
		val block = block_flags(empty_block, flags);
	in	blocks := new_scope_common(Value(Value ident))(block :: !blocks)
	end
);
=TEX
\subsection{Support for Functions in the Environment Dictionaries}
As for constant and type declarations, we need to keep the environment dictionaries up-to-date by mimicking for function the process for variables and procedures of going through the environments that may need updating to reflect the new declaration.

This is analogous to {\it update\_envs\_proc}, but as we need to distinguish formal and informal functions, it is called from the appropriate SID functions rather than as a SID function.
=SML
fun ⦏update_subunit_env_fun⦎
	(pfx_info : PREFIX_INFO)
	(spec : SPEC OPT)
	(old_zname : Z_ID OPT)
	(globals : Z_ID list)
	(inffun : INFORMAL_FUN) : unit = (
	let	val dec_lab1 = #dec_lab (block 1);
		val pfx_priv = (pfx_info, false);
		fun do1_subunit
			(id1_id2_s as
				(id1_id2,
				s as {in_scope as {dec_labels, ...}, ...})
					: string * SUBUNIT) = (
			if	dec_lab1 mem dec_labels
			then	(id1_id2,
				subunit_in_scope (s, in_scope_fun pfx_priv spec old_zname globals (in_scope, inffun)))
			else	id1_id2_s
		);
	in	subunit_env := map do1_subunit (!subunit_env)
	end
);
=TEX
=SML
fun ⦏update_dec_env_fun⦎
	(pfx_priv : PREFIX_INFO * bool)
	(spec : SPEC OPT)
	(old_zname : Z_ID OPT)
	(globals : Z_ID list)
	(inffun : INFORMAL_FUN) : unit = (
	let	val dec_lab1 = #dec_lab (block 1);
		fun do1_dec_label
			(dec_label_s as
				(dec_label,
				s as {in_scope as {dec_labels, ...}, ...})
					: string * DECLAB) = (
			if	dec_lab1 mem dec_labels
			then	(dec_label,
				declab_in_scope (s,  in_scope_fun pfx_priv spec old_zname globals (in_scope, inffun)))
			else	dec_label_s
		);
	in	dec_env := map do1_dec_label (!dec_env)
	end
);
=TEX
In the following, the local function, $do1\_spec\_label$ does the work specified in the Z spec for one spec label.
The identifiers in the variable declaration are translated first.
=SML
fun ⦏update_spec_env_fun⦎
	(pfx_info : PREFIX_INFO)
	(spec : SPEC OPT)
	(old_zname : Z_ID OPT)
	(globals : Z_ID list)
	(inffun : INFORMAL_FUN) : unit = (
	let	val dec_lab1 = #dec_lab (block 1);
		val pfx_priv = (pfx_info, false);
		fun do1_spec_label
			(spec_label_s as
				(spec_label,
				s as {in_scope as {dec_labels, ...}, ...})
					: string * SPECLAB) = (
			if	dec_lab1 mem dec_labels
			then	(spec_label,
				speclab_in_scope (s,  in_scope_fun pfx_priv spec old_zname globals (in_scope, inffun)))
			else	spec_label_s
		);
	in	spec_env := map do1_spec_label (!spec_env)
	end
);
=TEX
=SML
fun ⦏update_envs_fun⦎
	(pfx_priv as (pfx_info, _) : PREFIX_INFO * bool)
	(spec : SPEC OPT)
	(old_zname : Z_ID OPT)
	(globals : Z_ID list)
	(inffun : INFORMAL_FUN) : unit = (
	if	test_flag #declabel_flag 1
	then	(update_subunit_env_fun pfx_info spec old_zname globals inffun;
		 update_dec_env_fun pfx_priv spec old_zname globals inffun;
		 update_spec_env_fun pfx_info spec old_zname globals inffun)
	else	()
);
=TEX
=SML
fun ⦏update_envs_form_fun⦎
	(pfx_priv : PREFIX_INFO * bool)
	(formfun : FORMAL_FUN, renames : Z_ID OPT) : unit = (
	update_envs_fun pfx_priv (Value(#spec formfun))
	renames (#globals formfun) (#informal_fun formfun)
);
=TEX
\subsection{The SID function stub\_spec\_fun}
=SML
fun ⦏stub_spec_fun⦎ (form_fun : FORMAL_FUN) : unit = (
	stub_spec_proc_fun (#spec form_fun) (#globals form_fun);
	update_envs_form_fun (current_prefix_info 2, false) (form_fun, Nil)
);
=TEX
\subsection{The SID function inf\_fun}
=TEX
=SML
fun ⦏prefix_informal_fun⦎
	({canon, ...} : PREFIX_INFO)
	({name, formal_pars, par_names_defs, return_type}
		: INFORMAL_FUN) : INFORMAL_FUN = (
	let	val zname = prefix_trans_id canon name;
	in	{name = zname, formal_pars = formal_pars,
			par_names_defs = par_names_defs,
			return_type = return_type}
	end
);
=TEX
=SML
local
val ⦏informal_function_gvar⦎ : Z_EXP = ⓩ Informal_Function ⌝;
val ⦏informal_function_ty⦎ : TYPE = dest_z_power_type( snd(dest_const(informal_function_gvar)));
fun ⦏inf_fun_decl⦎
	(pfx_info : PREFIX_INFO)
	(f: INFORMAL_FUN) : (Z_DECL * Z_ID) = (
	let	val pf = prefix_informal_fun pfx_info f;
		val {name = zn, ...} = pf;
		val zexp = informal_function_gvar;
		val zvar = mk_z_lvar(zn, informal_function_ty, [])
	in	(mk_z_dec([zvar], zexp), zn)
	end
);
in
fun ⦏trans_informal_fun⦎
	(pfx_info : PREFIX_INFO)
	(f : INFORMAL_FUN) : PARAINFO = (
	let	val (dec, n) = inf_fun_decl pfx_info f;
	in	AxDesInfo([], mk_z_decl[dec], Nil, [(n, informal_function_ty)])
	end
);
end;
=TEX
=SML
fun ⦏add_fun_env⦎
	(pfx_priv : PREFIX_INFO * bool)
	(spec : SPEC OPT)
	(old_zname : Z_ID OPT)
	(globals : Z_ID list)
	(inf_fun : INFORMAL_FUN) : unit = (
	let	val	block1 as {declab ={in_scope as {dict, ...}, ...}, ...} = block 1;
		val entries = env_entries_of_fun pfx_priv spec old_zname globals inf_fun;
		val new_dict = add_to_env_dict dict entries;
		val	in_scope1a = in_scope_dict(in_scope, new_dict);
		val	block1a = block_in_scope(block1, in_scope1a)
	in	blocks := block1a :: tl(!blocks)
	end
);
=TEX
The decision of which of the following two functions to call is made in $inf\_fun$
=SML
fun ⦏inf_fun_pack_spec⦎ (inf_fun: INFORMAL_FUN) : unit = (
	let	val block2 = block 2;
		val block_name2 = #block_name(#declab block2);
		val bn2 = expanded_name block_name2;
		val package =
			(force_value(s_lookup bn2 (!pack_env)))
			handle Fail _ =>
			error "inf_fun_pack_spec" 507012 [fn()=>bn2];
		val pfx_info = pack_spec_prefix_info block_name2;
		val private = test_flag #private_flag 2;
		val pfx_priv = (pfx_info, private);
		val _ = store_para(trans_informal_fun pfx_info inf_fun);
	in	pack_env :=
		s_enter
		bn2
		(package_informal_fun pfx_priv (package, inf_fun))
		(!pack_env)
	end
);
=TEX
=SML
fun ⦏inf_fun_otherwise⦎
	(pfx_priv as(pfx_info, _) : PREFIX_INFO * bool)
	(inf_fun  as {name, ...}: INFORMAL_FUN): unit = (
	case current_cn_env (trans_id name) of
		Nil =>  (
			store_para(trans_informal_fun pfx_info inf_fun);
			add_fun_env pfx_priv Nil Nil [] inf_fun;
			update_envs_fun pfx_priv Nil Nil [] inf_fun
	) |	Value( {info = EIEnvFunction {spec = Nil, ...}, ...} ) => (
			()
	) |	Value _ =>  (
			fail "inf_fun" 507096 [fn () => name]
	)
);
=TEX
=SML
fun ⦏inf_fun_pack_body⦎ (name : ID) : PREFIX_INFO = (
	if	test_flag #pack_body_flag 2
	then	let	val block2 = block 2;
			val block_name2 = #block_name(#declab block2);
			val bn2 = expanded_name block_name2;
			val package4 = (force_value(s_lookup bn2 (!pack_env)))
				handle Fail _ =>
				error "inf_fun" 507012
						[fn()=>bn2];
			val formal_funs4 = #formal_funs package4;
			val pfx_info = body_prefix_info block_name2;
		in	(if	any formal_funs4
				(fn f => #name(#informal_fun f) = name)
			then	cn_soundness_warning "inf_fun" 507135 [fn()=>name, fn () => bn2]
			else	());
			pfx_info
		end
	else	(current_prefix_info 1)
);
=TEX
=SML
fun ⦏inf_fun⦎ (informal_fun as {name, ...}: INFORMAL_FUN): unit = (
	if	test_flag #pack_spec_flag 2
	then	inf_fun_pack_spec informal_fun
	else	let	val pfx_info = inf_fun_pack_body name;
			val private = test_flag #private_flag 2;
			val pfx_priv = (pfx_info, private);
		in	inf_fun_otherwise pfx_priv informal_fun
		end
);
=TEX
\subsection{The SID function form\_fun}
=TEX
=SML
fun ⦏prefix_formal_fun⦎
	(pfx_info : PREFIX_INFO)
	({spec, informal_fun, globals} : FORMAL_FUN)
		: FORMAL_FUN = (
	{spec = spec,
	 informal_fun = prefix_informal_fun pfx_info informal_fun,
	 globals = globals}
);
=TEX
=SML
fun ⦏z_forall_opt⦎ (decs : Z_DECL list, zpred : Z_PRED) : Z_PRED = (
	case decs of
		[] =>	zpred
	|	_ => z_forall(decs, zpred)
);
=TEX
=SML
fun ⦏z_vars_of_env⦎ (cnenv  :  CN_ENV )  (zi : Z_ID)  : bool = (
	case cnenv zi of
		Value{info = EIEnvVar _, ...} => true
	|	Value{info = EIEnvAuxVar _, ...} => true
	|	_  => false
);
=TEX
=SML
fun ⦏z_var_decl⦎ (cnenv : CN_ENV) (zname : Z_ID) : Z_DECL = (
	if	z_vars_of_env cnenv zname
	then	let	val zexp = var_sig cnenv zname;
			val ty = (dest_z_power_type o type_of) zexp;
		in	mk_z_dec([mk_z_lvar(zname, ty, [])], zexp)
		end
		handle exn => pass_on exn "var_sig" "z_var_decl"
	else	mk_z_schema_dec(var_sig cnenv zname, "")
);
=TEX
The environment set up in the following two functions is for local use only and the settings of the spec and private fields is immaterial.
=SML
fun ⦏trans_formal_fun⦎
	(pfx_info : PREFIX_INFO)
	(env : CN_ENV)
	(form_fun as {
		spec as {pre, post, ...},
		informal_fun as {formal_pars, name = simple_name, ...},
		globals} : FORMAL_FUN)
			: PARAINFO * Z_PRED * Z_PRED * Z_ID = (
	let	val pff = prefix_formal_fun pfx_info form_fun;
		val zn = #name(#informal_fun pff);
		val env' =
			if	zn = simple_name
			then env
			else	fn n =>
				if	n = simple_name
			then	Value{
					tipe = Nil,
					info = EIEnvFunction {
						spec = Nil,
						deps = [],
						pars = [],
						return_tmark = ""},
					canon_name = zn,
					private = false}
			else	env n;
		val dec = fun_decl env' pff;
		val pardecs = map z_par_decl formal_pars
			handle exn => pass_on exn "z_par_decl" "trans_formal_fun";
		val globdecs = map (z_var_decl env') globals
			handle exn => pass_on exn "z_var_decl" "trans_formal_fun";
		val ntys = (map dest_var o fst o dest_z_dec) dec;
		val new_ti_cxt = frees dec term_union flat
				(map frees (pardecs @ globdecs));
		val side = set_current_ti_context new_ti_cxt;
		val z_pre = z_pred_of_z_tm env' pre;
		val z_post = z_pred_of_z_tm env' post;
		val imp = z_imp(z_pre, z_post);
		val pred = z_forall_opt(globdecs, z_forall_opt(pardecs, imp));
	in	(AxDesInfo([], mk_z_decl[dec], Value pred, ntys), z_pre, z_post, zn)
	end
);
=TEX
=SML
fun  ⦏trans_formal_fun_name⦎
	(pfx_info : PREFIX_INFO)
	(env : CN_ENV) (packopt : PACKAGE OPT)
	(ff as {globals = globals, ...} :FORMAL_FUN) : Z_EXP = (
	let	val avs = case packopt of Value{aux_vars, ...} => aux_vars | Nil => [];
		fun   do_aux_vars [] _ = Nil
		|  do_aux_vars (dec :: more) n = (
			case s_lookup n (map dest_var (frees dec)) of
				Nil => do_aux_vars more n
			|	Value ty =>
				Value{
					tipe = Value ty,
					info  = EIEnvAuxVar {
						decl = dec,
						in_scope = true},
					canon_name = n,
					private = false}
		);
		fun env' n = (
			case do_aux_vars avs n of
				Nil => env n
			|	v => v
		);
		val pff = prefix_formal_fun pfx_info ff;
		val zn = #name(#informal_fun pff);
		val zf = hd (fst(dest_z_dec (fun_decl env' pff)));
	in	case map (global_dep_par env') globals of
			[] => zf
		 |	gs => z_fun_call(zf, gs)
	end
);
=TEX
=SML
fun ⦏subs_exp_for_exp_in_pred⦎ (pred : Z_PRED, e1 : Z_EXP, e2 : Z_EXP) : Z_PRED = (
	subst [(e2, e1)] pred
);
=TEX
=SML
fun ⦏store_trans_formal_fun⦎
	(pfx_info : PREFIX_INFO)
	(cnenv : CN_ENV)
		(ff : FORMAL_FUN) : unit = (
	let	val (para, _, _, cname) = trans_formal_fun pfx_info cnenv ff;
		val cty_opt = get_const_type (hol_const_name cname);
		val pred = case para of
			AxDesInfo(_, _, Value pred, _) => pred
		| _ => error "store_trans_formal_fun" 507067 [];
		fun clash_error () = (
			fail "store_trans_formal_fun" 507068
			[fn _ => cname, fn _ => #name(#informal_fun ff)]
		);
	in	case cty_opt of
			Nil => (
			store_para para
		) |	Value cty => (
			let	val cterm = mk_z_gvar(cname, cty, []);
				val cpred = snd (dest_∧(concl(z_get_spec cterm)))
					handle Fail _ => clash_error();
				val vterm = mk_var(cname, cty);
				val pred' = subst[(cterm, vterm)] pred;
			in	if	cpred ~=$ pred'
				then	()
				else	clash_error()
			end
		)
	end
);
=TEX
The decision of which of the four cases to apply is made in $form\_fun$

Note that {\em form\_fun\_pack\_body} and {\em form\_fun\_pack\_body\_aux} depend on {\em form\_fun\_pack\_spec} always producing type-checked pre- and post-conditions for the formal function that just need the term quotation stripped off with {\em term\_of\_quote}.
=TEX
=SML
fun ⦏form_fun_pack_spec⦎ (form_fun as {
	informal_fun,
	spec = {w, w0, pre, post},
	globals} : FORMAL_FUN) : unit = (
	let	val block2 = block 2;
		val block_name2 = #block_name(#declab block2);
		val bn2 = expanded_name block_name2;
		val package =
			(force_value(s_lookup bn2 (!pack_env)))
			handle Fail _ =>
			error "form_fun_pack_spec" 507012 [fn()=>bn2];
		val pfx_info = pack_spec_prefix_info block_name2;
		val private = test_flag #private_flag 1;
		val pfx_priv = (pfx_info, private);
		val (z_para, z_pre, z_post, _) =
			(trans_formal_fun pfx_info current_cn_env form_fun);
		val form_fun1 = {
			informal_fun = informal_fun,
			spec = {
				w = w,
				w0 = w0,
				pre = z_quote (z_pre, Nil),
				post = z_quote (z_post, Nil)},
			globals = globals};
		val _ = store_para z_para;
	in	pack_env :=
		s_enter
		bn2
		(package_formal_fun pfx_priv (package, form_fun1, Nil))
		(!pack_env)
	end
);
=TEX
=SML
fun ⦏form_fun_pack_body_common⦎ (implicit : bool)
	(form_fun: FORMAL_FUN)
	: (BLOCK * FORMAL_FUN * PACKAGE * SPECLAB) OPT = (
	let	val block1 = block 1;
		val block2 = block 2;
		val block_name1 = #block_name(#declab block1);
		val bn1 = simple_name block_name1;
		val block_name2 = #block_name(#declab block2);
		val bn2 = expanded_name block_name2;
		val package4 = (force_value(s_lookup bn2 (!pack_env)))
			handle Fail _ =>
			error "form_fun_pack_body" 507012 [fn()=>bn2];
		val formal_funs4 = #formal_funs package4;
		val pfx_info = body_prefix_info block_name2;
		val pfx_priv = (pfx_info, false);
		val spec = Value (#spec form_fun);
	in	store_trans_formal_fun pfx_info current_cn_env form_fun;
		add_fun_env pfx_priv spec Nil (#globals form_fun) (#informal_fun form_fun);
		update_envs_form_fun pfx_priv (form_fun, Nil);
		if	any
			formal_funs4
			(fn f => #name(#informal_fun f) = bn1)
		then
	let
		val formal_fun3 =
			find
			formal_funs4
			(fn f => #name(#informal_fun f) = bn1);
		val dict1 = #dict(#in_scope(#declab block1));
		val vc_par_ids1 = #vc_pars(get_local_vars dict1);
		val in_scope5a = subprog_flatten_env(!blocks);
		val dict5a = #dict in_scope5a;
		val {vc_vars = vc_var_ids5, vc_aux_vars = vc_aux_var_ids5a, ...} =
			get_local_vars dict5a;
		val aux_var_ids4 = map (fst o dest_var)
				(flat (map (fst o dest_z_dec)(#aux_vars package4)));
		val vc_aux_var_ids5 = vc_aux_var_ids5a diff aux_var_ids4;
		val cn_scope = vc_par_ids1 cup vc_aux_var_ids5 cup vc_var_ids5;
		val dict5 = set_cn_scope dict5a cn_scope;
		val in_scope5 = {
			dec_labels = [],
			dict = dict5
		};
		val wp_env5 :WP_ENV = {
			env = cn_env_of_in_scope in_scope5,
			till = mk_z_true,
			named_tills = [],
			return = mk_z_true,
			fun_header = dummy_informal_fun
		};
		val fun_header5 = prefix_informal_fun pfx_info
			(#informal_fun form_fun);
		val wp_env5 :WP_ENV = {
			env = cn_env_of_in_scope in_scope5,
			till = mk_z_true,
			named_tills = [],
			return = mk_z_true,
			fun_header = fun_header5
		};
		val speclab5 : SPECLAB = {
			spec = #spec formal_fun3,
			formal_body_flag = true,
			fun_flag = true,
			till_flag = false,
			wp_env = wp_env5,
			in_scope = in_scope5,
			block_name = block_name2
		};
		val st = STSpecNoIvars{spec= #spec form_fun, label="", is_assertion = false};
		val globals = #globals form_fun;
		val globals3 = #globals formal_fun3;
	in	Value(block2, formal_fun3, package4, speclab5)
	end
		else if	implicit
		andalso	not(any (#informal_funs package4) (fn {name, ...} => name = bn1))
		then	(check_not_implicit true; Nil)
		else	Nil
	end
);
=TEX
The VC generator is responsible for distinguishing between specification statements with and without initial variables.
Here, we follow the parser in generating the form without initial variables for it to modify as necessary.

=SML
fun ⦏form_fun_pack_body⦎
	(block2 : BLOCK, formal_fun3 : FORMAL_FUN,
			package4 : PACKAGE,
			speclab5 as {spec = spec5, ...} : SPECLAB)
		(form_fun: FORMAL_FUN) : unit = (
	let	val block1 = block 1;
		val block_name1 = #block_name(#declab block1);
		val block_name2 = #block_name(#declab block2);
		val st = STSpecNoIvars{spec= #spec form_fun, label="", is_assertion = false};
		val globals = #globals form_fun;
		val globals3 = #globals formal_fun3;
		val spec_pfx_info = pack_spec_prefix_info block_name2;
		val body_pfx_info = body_prefix_info block_name2;
		val afunc = trans_formal_fun_name spec_pfx_info current_cn_env (Value package4) formal_fun3;
		val cfunc = trans_formal_fun_name body_pfx_info current_cn_env Nil form_fun;
		val pre5 = term_of_quote (#pre spec5);
		val post5 = term_of_quote (#post spec5);
		fun subs5 p = subs_exp_for_exp_in_pred(p, afunc, cfunc);
		val spec5a : SPEC = {
			w = [],
			w0 = [],
			pre = z_quote(subs5 pre5, Nil),
			post = z_quote(subs5 post5, Nil)
		};
		val speclab5a = speclab_update_spec(speclab5, spec5a);
	in	if	globals = globals3
		then	let	val (vcs, routes, spec) = call_vcs (speclab5a, st);
			in	store_vcs (
					Nil, vcs,
					Value (speclab_update_spec(speclab5,spec)),
					routes, VCG_subprogram_spec)
			end
		else	let	fun fmt_strs [] () = (
					"empty list of global dependencies"
				) | fmt_strs strs () = (
					format_list Combinators.I strs ", "
				);
			in	fail "form_fun_pack_body" 507050
				[fmt_strs globals, fmt_strs globals3,
				fn()=>simple_name block_name1]
			end
	end
);
=TEX
=SML
fun ⦏form_fun_pack_body_aux⦎
	(block2 : BLOCK, formal_fun3 : FORMAL_FUN,
			package4 : PACKAGE, speclab5 : SPECLAB)
		(avs : TERM list)
		(form_fun: FORMAL_FUN) : unit = (
	let	val block1 = block 1;
		val spec3 = #spec formal_fun3;
		val block_name1 = #block_name(#declab block1);
		val block_name2 = #block_name(#declab block2);
		val st = STSpecNoIvars{spec= #spec form_fun, label="", is_assertion = false};
		val glob_vars = expand_schema_sigs (#globals formal_fun3);
		val aux_vars4 = #aux_vars package4;
		val aux_vars_decs = map dest_z_dec aux_vars4;
		val aux_vars_newdecs = flat (map (fn (tml,ty) =>
						map (fn t => (t,ty)) tml)
							aux_vars_decs);
		val aux_vars_tab = map (fn (tm, ty) => (dest_z_lvar tm, ty))
							aux_vars_newdecs;
		val aux_vars_tab1 = aux_vars_tab drop
					(fn ((s, _, _), _) => not(s mem glob_vars));
		val aux_vars = map (fn (lv,ty) => mk_z_dec([mk_z_lvar lv], ty))
					aux_vars_tab1;
		val using_decs2 = #using_decs(#declab block2);
		val ud2_rel_image = (using_decs2 drop
						(fn n => not (fst n mem glob_vars)));
		val invs = (map snd o map snd) ud2_rel_image;
		val aux_zids = map (fn ((s, _, _), _) => s) aux_vars_tab;
		val conc_zids =  (map  trans_id o flat o flat o map (map #vars) o map fst o map snd)
				ud2_rel_image cup (glob_vars diff aux_zids);
		val save_ti_context = e_get_ti_context();
		val pre3 = term_of_quote (#pre spec3);
		val post3 = term_of_quote (#post spec3);
		val pre5_matrix = z_many_and(z_pred_of_z_tm  current_cn_env (#pre spec3)::invs);
		val pre5 = z_quote (z_exists (aux_vars, pre5_matrix), Nil);
		val spec_pfx_info = pack_spec_prefix_info block_name2;
		val body_pfx_info = body_prefix_info block_name2;
		val afunc = trans_formal_fun_name spec_pfx_info current_cn_env (Value package4) formal_fun3;
		val cfunc = trans_formal_fun_name body_pfx_info current_cn_env Nil form_fun;
		val post5 = z_quote(z_forall(aux_vars, z_imp(pre5_matrix,
			z_exists(aux_vars,
				z_many_and(
					subs_exp_for_exp_in_pred(
						post3,
						afunc, cfunc)::invs)))),
			Nil);
		val spec5 : SPEC = {
			w = [],
			w0 = [],
			pre = pre5,
			post = post5
		};
		val block_name5 = #block_name speclab5;
		val in_scope5 = subprog_flatten_env(!blocks);
		val fun_header5 = prefix_informal_fun body_pfx_info
			(#informal_fun form_fun);
		val wp_env5 :WP_ENV = {
			env = cn_env_of_in_scope in_scope5,
			till = mk_z_true,
			named_tills = [],
			return = mk_z_true,
			fun_header = fun_header5
		};
		val speclab5a : SPECLAB = {
			spec = spec5,
			formal_body_flag = true,
			fun_flag = true,
			till_flag = false,
			wp_env = wp_env5,
			in_scope = in_scope5,
			block_name = block_name5
		};
		val globals = #globals form_fun;
		val (vcs, routes, spec) = call_vcs (speclab5a, st);
	in	case globals diff conc_zids of
			[] => (
			store_vcs (
				Nil, vcs,
				Value (speclab_update_spec(speclab5a,spec)),
				routes, VCG_subprogram_spec)
		) |	rogues => (
			let	fun fmt_strs strs () = (
					format_list Combinators.I strs ", "
				);
			in	fail "form_fun_pack_body_aux" 507095
				[fmt_strs rogues,  fn()=>simple_name block_name1]
			end
		)
	end
);
=TEX
=SML
fun ⦏check_globals_fun⦎ (block_name1 : string)
	(globals : Z_ID list) (globals3 : Z_ID list) : unit = (
	if	globals = globals3
	then	()
	else	let	fun fmt_strs [] () = (
				"no global dependencies"
			) | fmt_strs strs () = (
				format_list Combinators.I strs ", "
			);
		in	fail "check_globals_fun" 507050
			[fmt_strs globals, fmt_strs globals3,
			fn()=>block_name1]
		end
);
=TEX
=SML
fun ⦏form_fun_subunit⦎ (form_fun: FORMAL_FUN) : unit = (
	let	val block1 = block 1;
		val block2 = block 2;
		val block_name1 = #block_name(#declab block1);
		val bn1 = simple_name block_name1;
		val block_name2 = #block_name(#declab block2);
		val tbn1_bn2 = subunit_env_index block_name2 bn1
		val subunit3 = (force_value(s_lookup tbn1_bn2 (!subunit_env)))
			handle Fail _ =>
			fail "form_fun_subunit" 507011
	 			[fn()=>simple_name block_name2, fn()=>bn1];
		val pfx_info = current_prefix_info 2;
		val pfx_priv = (pfx_info, false);
		val spec = Value (#spec form_fun);
	in	store_trans_formal_fun pfx_info current_cn_env form_fun;
		add_fun_env pfx_priv spec Nil (#globals form_fun) (#informal_fun form_fun);
		update_envs_form_fun pfx_priv (form_fun, Nil);
		subunit_env := s_delete tbn1_bn2 (!subunit_env);
		deletion_info := s_enter tbn1_bn2 subunit3 (!deletion_info);
		if	#specif_flag subunit3
		then
	let
		val st = STSpecNoIvars{spec= #spec form_fun,
				label="", is_assertion = false};
		val in_scope4 = subprog_flatten_env(!blocks);
		val fun_header4 = prefix_informal_fun pfx_info
			(#informal_fun form_fun);
		val wp_env4 :WP_ENV = {
			env = cn_env_of_in_scope in_scope4,
			till = mk_z_true,
			named_tills = [],
			return = mk_z_true,
			fun_header = fun_header4
		};
		val speclab4 : SPECLAB = {
			spec = #specif subunit3,
			formal_body_flag = true,
			fun_flag = true,
			till_flag = false,
			wp_env = wp_env4,
			in_scope = in_scope4,
			block_name = block_name2
		};
		val globals = #globals form_fun;
		val globals3 = #globs subunit3;
		val _ = check_globals_fun bn1 globals globals3;
		val (vcs, routes, spec) = call_vcs (speclab4, st);
	in	store_vcs (
			Nil, vcs,
			Value (speclab_update_spec(speclab4,spec)), routes,
			VCG_subunit_spec
		)
	end
		else	()
	end
);
=TEX
=SML
fun ⦏form_fun_otherwise⦎ (form_fun: FORMAL_FUN) : unit = (
	let	val pfx_info = current_prefix_info 2;
		val private = test_flag #private_flag 2;
		val pfx_priv = (pfx_info, private);
		val spec = Value (#spec form_fun)
	in	store_trans_formal_fun pfx_info current_cn_env form_fun;
		add_fun_env pfx_priv spec Nil (#globals form_fun) (#informal_fun form_fun);
		update_envs_form_fun pfx_priv (form_fun, Nil)
	end
);
=TEX
The following function is required to determine whether $form\_fun$ should call $form\_fun\_pack\_body$ or $form\_proc\_fun\_body\_aux$.
It computes a list of HOL terms representing the set of variables which is tested in the first clause in the predicate part of the corresponding Z schemas in the specification.
=SML
fun ⦏aux_vars_in_formal_fun⦎ (formal_fun3 as {globals, ...} : FORMAL_FUN)
			(package4 : PACKAGE) : TERM list = (
	let	val aux_vars4 = #aux_vars package4;
		val glob_vars = expand_schema_sigs globals;
		val aux_vars4_tms = (flat o map fst o map dest_z_dec) aux_vars4;
	in
		aux_vars4_tms drop (fn v => not (fst (dest_var v) mem glob_vars))
	end
);
=TEX
=SML
fun ⦏form_fun⦎ (implicit : bool) (frm_fun: FORMAL_FUN) : unit = (
	if		test_flag #pack_spec_flag 2
	then		(check_not_implicit implicit;
			form_fun_pack_spec frm_fun)
	else if		test_flag #pack_body_flag 2
	then		case form_fun_pack_body_common implicit frm_fun of
				Value  (info as (_, formal_fun3, package4, _)) => (
				case aux_vars_in_formal_fun formal_fun3 package4 of
					[] => form_fun_pack_body info frm_fun
				|	avs => form_fun_pack_body_aux info avs frm_fun
			) |	Nil	=> ()
	else if		test_flag #subunit_flag 2
	then		(check_not_implicit implicit;
			form_fun_subunit frm_fun)
	else		(check_not_implicit implicit;
			form_fun_otherwise frm_fun)
);
=TEX
\subsection{The SID function curr\_form\_fun}
=SML
fun ⦏curr_form_fun⦎ (formal_fun : FORMAL_FUN) : unit = (
	let	val block1 = block 1;
	in	blocks :=
		block_current_formal_fun (block1, formal_fun) :: tl(!blocks)
	end
);
=TEX
\section{FORMAL PARAMETERS}\label{FORMALPARAMETERS}
\subsection{The SID function formal\_part}
=TEX
Note that under the new canonical naming scheme for the Z parts of compliance arguments, the following should not be used when processing Z variables (e.g., those in a frame).
=SML
fun ⦏curr_real_name⦎ (n : ID) : Z_ID = (
	let	val zn = trans_id n;
	in	case current_cn_env zn of
			Value {canon_name, ...} =>  canon_name
		|	_ => zn
	end
);
=TEX
=SML
fun ⦏mk_param_spec⦎ ({idlist, mode, name, default =_} : PARAMETER_SPECIFICATION)
		: PARAM_SPEC = (
	{mode = mode, var_decl = {vars = idlist, tmark = curr_real_name name}}
);
=TEX
=SML
fun ⦏fformal_part⦎ (par_specs : PARAMETER_SPECIFICATION list) : unit = (
	let	val block1 = block 1;
		val formals = map mk_param_spec par_specs;
		val pfx_info = (current_prefix_info 1);
	in	blocks := block_vc_pars Nil pfx_info (block1, formals) :: tl(!blocks)
	end
);
=TEX

\section{SUBPROGRAM BODIES}\label{SUBPROGRAMBODIES}
\subsection{The SID function update\_envs\_proc}
The decision whether to call the three auxiliary functions is made in $update\_envs\_proc$ itself (since the test is the same in each case).

In the following, the local function, $do1\_subunit$ does the work specified in the Z spec for one unit-name-subunit-name pair.
=SML
fun ⦏update_subunit_env_proc⦎
	(pfx_info : PREFIX_INFO) : unit = (
	let	val dec_lab2 = #dec_lab (block 2);
		val current_formal_proc1 = #current_formal_proc(block 1);
		fun do1_subunit
			(id1_id2_s as
				(id1_id2,
				s as {in_scope as {dec_labels, ...}, ...})
					: string * SUBUNIT) = (
			if	dec_lab2 mem dec_labels
			then	(id1_id2,
				subunit_formal_proc pfx_info (s, current_formal_proc1))
			else	id1_id2_s
		);
	in	subunit_env := map do1_subunit (!subunit_env)
	end
);
=TEX
In the following, the local function, $do1\_dec\_label$ does the work specified in the Z spec for one dec label.
=SML
fun ⦏update_dec_env_proc⦎
	(pfx_info : PREFIX_INFO) : unit = (
	let	val dec_lab2 = #dec_lab (block 2);
		val current_formal_proc1 = #current_formal_proc(block 1);
		fun do1_dec_label
			(dec_label_d as
				(dec_label,
				d as {in_scope as {dec_labels, ...}, ...})
					: string * DECLAB) = (
			if	dec_lab2 mem dec_labels
			then	(dec_label,
				declab_formal_proc pfx_info (d, current_formal_proc1))
			else	dec_label_d
		);
	in	dec_env := map do1_dec_label (!dec_env)
	end
);
=TEX
In the following, the local function, $do1\_spec\_label$ does the work specified in the Z spec for one spec label.
The identifiers in the variable declaration are translated first.
=SML
fun ⦏update_spec_env_proc⦎
	(pfx_info : PREFIX_INFO) : unit = (
	let	val dec_lab2 = #dec_lab (block 2);
		val current_formal_proc1 = #current_formal_proc(block 1);
		fun do1_spec_label
			(spec_label_s as
				(spec_label,
				s as {spec as {w, ...},
					in_scope as {dec_labels, ...}, ...})
					: string * SPECLAB) = (
			if	dec_lab2 mem dec_labels
			then	(spec_label,
				speclab_formal_proc pfx_info (s, current_formal_proc1))
			else	spec_label_s
		);
	in	spec_env := map do1_spec_label (!spec_env)
	end
);
=TEX
The schema conjunction from the specification is implemented as sequential composition.
=SML
fun ⦏update_envs_proc⦎ (procs_spec as {name, ...} : PROCEDURE_SPECIFICATION) : unit = (
	if	test_flag #declabel_flag 2 andalso test_flag #formal_body_flag 1
	then	let	val pfx_info = current_prefix_info 2;
		in	update_subunit_env_proc pfx_info;
			update_dec_env_proc pfx_info;
			update_spec_env_proc pfx_info
		end
	else if	test_flag #declabel_flag 2
	then	update_envs_inf_proc name
	else	()
);
=TEX
\subsection{The SID function add\_proc\_env}
The following function checks whether two formal procedures
contain the same specification statement. (Ada type-checking
guarantees conformance of the formal parameter parts).
=SML
fun ⦏conformant_specs⦎
	(fpA as {globals = gA, spec = {w = wA, w0 = w0A, pre = preA, post = postA}, ...}
		 : FORMAL_PROC)
	(fpB as {globals = gB, spec = {w = wB, w0 = w0B, pre = preB, post = postB}, ...}
		 : FORMAL_PROC)
		: bool = (
	let	val _ = set_current_ti_context(ti_context_of_formal_proc current_cn_env fpA);
		val tpreA = z_predexp_of_z_tm current_cn_env preA;
		val tpostA = z_predexp_of_z_tm current_cn_env postA;
		val _ = set_current_ti_context(ti_context_of_formal_proc current_cn_env fpB);
		val tpreB = z_predexp_of_z_tm current_cn_env preB;
		val tpostB = z_predexp_of_z_tm current_cn_env postB;
	in	gA = gB andalso wA = wB andalso w0A = w0B andalso
		tpreA ~=$ tpreB andalso tpostA ~=$ tpostB
	end
);
=TEX
In the following, we only need to look in the immediately surrounding declarative
part and not further out (the rules on redeclarations in inner scopes
will prevent there being any possibility of a clash with an outer procedure).
To be consistent with the handling of the environment dictionaries, the new entry in the immediately enclosing block is also added to the current block.
=SML
fun ⦏add_proc_env⦎ (name : ID) : unit = (
	if	test_flag #formal_body_flag 1
	then	let	val block1 = block 1;
			val current_formal_proc1 = #current_formal_proc(block 1);
			val block2 = block 2;
			val dict2 = #dict(#in_scope(#declab block2));
			val zn = trans_id (#name current_formal_proc1);
			val already_there = (
				case env_of_env_dict dict2 zn of
					Value{info = EIEnvProcedure{
						formal_proc = Value fp}, ...} => (
						if	conformant_specs
							fp
							current_formal_proc1
						then	true
						else	fail "add_proc_env" 507066
							[fn _ => zn]
				) |	Value{info = EIEnvProcedure{
						formal_proc = Nil}, ...} => (
							fail "add_proc_env" 507051
							[fn _ => zn]

				) |	_ => false
			);
		in	if	already_there
			then	()
			else	let	val pfx_info = current_prefix_info 2;
					val private = test_flag #private_flag 2;
					val pfx_priv = (pfx_info, private);
					val block1' = block_formal_proc Nil pfx_priv (block1,
							current_formal_proc1);
					val block2' = block_formal_proc Nil pfx_priv (block2,
							current_formal_proc1);
				in	blocks :=
					block1' :: block2' :: tl(tl(!blocks))
				end
		end
	else	let	val block1 = block 1;
			val block2 = block 2;
			val dict2 = #dict(#in_scope(#declab block2));
			val zn = trans_id name;
			val already_there = (
				case env_of_env_dict dict2 zn of
					Value{info = EIEnvProcedure{
						formal_proc = Value fp}, ...} => (
							fail "add_proc_env" 507051
							[fn _ => zn]
				) |	_ => false
			);
		in	if	already_there
			then	()
			else	let	val pfx_info = current_prefix_info 2;
					val private = test_flag #private_flag 2;
					val pfx_priv = (pfx_info, private);
					val block1' = block_informal_proc Nil pfx_priv (block1, zn);
					val block2' = block_informal_proc Nil pfx_priv (block2, zn);
				in	blocks :=
					block1' :: block2' :: tl(tl(!blocks))
				end
		end

);
=TEX
\subsection{The SID function subprogram\_implementation}
=SML
fun ⦏subprogram_implementation⦎ {is_proc : bool, deferred : bool}
	:  {old_cur_thy : string,
	    subprog_thy : string,
	    full_name : Z_ID} = (
	let	val old_cur_thy = get_current_theory_name();
		val block1 = block 1;
		val en = expanded_name (#block_name (#declab block1));
		val sp_thyn = en ^ (if is_proc then proc_tag else fun_tag);
		val scope_entry = {
			theory = sp_thyn,
			deferred =
			if	deferred
			then	DSPendingIntroduction
			else	DSNotDeferred,
			body_labels = Nil};
	in	(scope_env :=
		e_extend en scope_entry (!scope_env)
		handle Fail _ => (
			fail "subprogram_implementation" 507143
			[fn () => en]
		));
		(if	sp_thyn <> !script_name
		then	let	val cxt_thyn = en ^ context_tag;
			in	make_module 507139 en cxt_thyn;
				open_theory cxt_thyn;
				make_subprog_module 507139 en sp_thyn;
				open_theory sp_thyn
			end
		else	());
		blocks := (block_body_flag (block1, true) :: tl(!blocks));
		{old_cur_thy = old_cur_thy,
		 subprog_thy = sp_thyn,
		 full_name = en}
	end
);
=TEX
\subsection{The SID function vcs\_body}
The decision about which support function to call (if any) is made in $vcs\_body$ itself.

=SML
fun ⦏vcs_body_proc⦎ (st : STATEMENT) : SPEC = (
	let	val (lab, (vcs, routes, spec), speclab ) = vcs_body_proc_aux st;
	in	store_vcs (
			Value lab, vcs,
			Value (speclab_update_spec(speclab,spec)), routes,
			VCG_subprogram_body
		);
		spec
	end
);
=TEX
\subsection{The SID function deferred\_body}
=TEX
=SML
fun ⦏check_deferred_decls⦎ (acc : LABEL list)
	(_:ID) ([] : DECLARATION list) : LABEL list = acc
|  check_deferred_decls acc n (DDeclarationKSlot ({label, ...}, _) :: more) = (
	check_deferred_decls (label :: acc) n more
) | check_deferred_decls _ n (_::_) = (
	fail "deferred_body" 507147 [fn () => n]
);
=TEX
=SML
fun ⦏deferred_body_stmt⦎ (n:ID) (spec : SPEC) (stmt : STATEMENT) : STATEMENT * LABEL = (
	case stmt of
		STKSlot {label, ...} => (
			(STSpecNoIvars {spec = spec, label = label, is_assertion = false}, label)
	) |	_ => (
		fail "deferred_body" 507149 [fn () => n]
	)
);
=TEX
=SML
fun ⦏deferred_body_labels⦎
	(do_statement : STATEMENT -> STATEMENT)
	(full_name : Z_ID) (n : ID)
	(dl : DECLARATION list) (spec : SPEC) (stmt : STATEMENT)
	: unit = (
	let	val dlabs = check_deferred_decls [] n dl;
		val (stmt', slab) = deferred_body_stmt n spec stmt;
		val _ = do_statement stmt';
		fun get_declab dlab = (
			case s_lookup dlab (!dec_env) of
				Value dl => (dlab, dl)
			|	Nil => fail "deferred_body" 507157 [fn () => dlab]
		);
		fun get_speclab slab = (
			case s_lookup slab (!spec_env) of
				Value sl => (slab, sl)
			|	Nil => fail "deferred_body" 507157 [fn () => slab]
		);
		val des_se = (map get_declab dlabs, get_speclab slab);
	in	(case e_lookup full_name (!scope_env) of
			Value {theory, deferred, ...} => (
			scope_env :=
			e_enter full_name
			{theory = theory, deferred = deferred,
				body_labels = Value des_se}
			(!scope_env)
		) |	Nil => fail "deferred_body" 507154 [])
	end
);
=TEX
=SML

=TEX
The following assumes caller has checked that the deferred flag is indeed true
and that caller has already entered the declaration k-slots
into the dec env.
{\em do\_statement} is passed in as a parameter so that
the above functions can get the spec env right.
=SML
fun ⦏deferred_body⦎
	(do_statement : STATEMENT -> STATEMENT)
	(full_name : Z_ID,
	 PBProcedure {procedure_spec = {name = n, spec, ...},
		declarative_part = dl,
		statement, ...} : PROPER_BODY)
	: unit = (
	case spec of
		Nil => fail "deferred_body" 507148 [fn () => n]
	|	Value spc => (
		deferred_body_labels
		do_statement full_name n dl spc statement
	)
) | deferred_body do_statement (full_name, PBFunction{function_spec = {designator = n, spec, ...},
		declarative_part = dl,
		statement, ...}) = (
	case spec of
		Nil => fail "deferred_body" 507148 [fn () => n]
	|	Value spc => (
		deferred_body_labels
		do_statement full_name n dl spc statement
	)
) | deferred_body _ (_, PBPackage {statement, ...}) = (
	error "deferred_body" 507150 []
);
=TEX
=SML
fun ⦏vcs_body_fun⦎ (st : STATEMENT) : SPEC = (
	let	val block1 = block 1;
		val block_name1 = #block_name(#declab block1);
		val current_formal_fun1 = #current_formal_fun block1;
		val vc_vars1 = #vc_vars(get_local_vars(#dict(#in_scope(#declab block1))));
		val vc_inits1 = #var_inits block1;
		val post1 = #post(#spec current_formal_fun1);
		val w =vc_vars1;
		val in_scope = subprog_flatten_env (!blocks);
		val current_for_vars1 = #current_for_vars block1;
		val current_log_cons1 = #current_log_cons block1;
		val in_scope1 =
			in_scope_vc_log_cons Nil (
				in_scope_vc_pars Nil (current_prefix_info 1) (in_scope, current_for_vars1),
				current_log_cons1);
		val fun_dec = fun_decl current_cn_env current_formal_fun1;
		val _ = set_in_scope_ti_context1(in_scope, [fun_dec]);
		val env = cn_env_of_in_scope in_scope1;
		val pfx_info = current_prefix_info 2;
		val fun_header = prefix_informal_fun pfx_info
			(#informal_fun current_formal_fun1);
		val wp_env : WP_ENV = {
			env = env,
			till = mk_z_true,
			named_tills = [],
			return = z_pred_of_z_tm env post1,
			fun_header = fun_header
		};
		val pre1 =  var_inits_pre
				(Value (#pre(#spec current_formal_fun1)))
				vc_inits1
				env
			handle exn =>
			pass_on exn "var_inits_pre" "vcs_body_fun";
		val spec : SPEC = add_init_vars_spec {
			w = w,
			w0 = [],
			pre = pre1,
			post = post1
		};
		val speclab : SPECLAB = {
			spec = spec,
			formal_body_flag = true,
			fun_flag = true,
			till_flag = false,
			wp_env = wp_env,
			in_scope = in_scope1,
			block_name = block_name1
		};
		val (vcs, routes, spec) = call_vcs (speclab, st);
	in	store_vcs(
			Value (expanded_name block_name1), vcs,
			Value (speclab_update_spec(speclab,spec)), routes,
			VCG_subprogram_body
		);
		spec
	end
);
=TEX
=SML
fun ⦏vcs_body⦎ (st : STATEMENT) : unit = (
	if	test_flag #formal_body_flag 1
	then	if	test_flag #fun_flag 1
		then	(vcs_body_fun st; ())
		else	(vcs_body_proc st; ())
	else	()
);
=TEX
\section{PACKAGES}\label{PACKAGES}
\subsection{The SID function new\_scope\_pack\_spec}
=SML
fun ⦏empty_package⦎ (decl : DECLARATION PACKAGE_DECLARATION) : PACKAGE = (
	let	val dict  = #dict(#in_scope(#declab(block 1)));
		val ccu = {
			context = [],
			references = [],
			comp_unit = CUPackageDeclaration {private = false, pack_decl = decl},
			annotation = []};
	in
	{	vc_vars				=	[],
		consts_types			=	[],
		formal_procs			=	[],
		informal_procs			=	[],
		informal_funs			=	[],
		formal_funs			=	[],
		aux_vars			=	[],
		obj_renamings			=	[],
		zmod 				=	(!script_name),
		decl				=	ccu,
		local_dict				=	dict,
		private_dict				=	initial_env_dict,
		with_dict				=	initial_env_dict
	}
	end
);
=TEX
=SML
fun ⦏new_scope_pack_spec⦎
	(ident : EXPANDED_NAME)
	(decl : DECLARATION PACKAGE_DECLARATION): unit = (
	let	val flags = {
			pack_spec_flag = true,
			pack_body_flag = false,
			stub_flag = false,
			subunit_flag = false,
			formal_body_flag = false,
			fun_flag = false,
			declabel_flag = false,
			speclabel_flag = false,
			till_flag = false,
			body_flag = false,
			private_flag = false
		};
		val block = block_block_name(
				block_flags(empty_block, flags),
				map Value ident);
		val zn = trans_expanded_name ident;
		val scope_entry = {theory = zn ^ pack_spec_tag, deferred = DSNotDeferred, body_labels = Nil};
	in	(scope_env :=
		e_extend zn scope_entry (!scope_env)
		handle Fail _ => (
			fail "new_scope_pack_spec" 507143
			[fn () => fmt_expanded_name ident]));
		blocks := new_scope_common Nil (block :: !blocks);
		pack_env := s_extend zn (empty_package decl) (!pack_env)
	end	handle Fail _ => fail "new_scope_pack_spec" 507007 [fn () => fmt_expanded_name ident]
);
=TEX
=SML
fun ⦏private_part⦎
	((): unit) : unit = (
	let	val block1 = block 1;
		val flags = {
			pack_spec_flag = true,
			pack_body_flag = false,
			stub_flag = false,
			subunit_flag = false,
			formal_body_flag = false,
			fun_flag = false,
			declabel_flag = false,
			speclabel_flag = false,
			till_flag = false,
			body_flag = false,
			private_flag = true
		};
		val block1' = block_flags(block1, flags);
	in	blocks := block1' :: tl (!blocks)
	end
);
=TEX

\subsection{The SID functions new\_scope\_with and new\_scope\_ancestor}
N.B. $new\_scope\_pack\_body$ has been moved after this section.
=TEX
The handling of the theory hierarchy was rationalised considerably during
the IUCT project in 1997 and then again even more radically in 2006.
=TEX
=SML
fun ⦏new_scope_with_or_ancestor⦎
	(is_ancestor : bool)
	(ident : EXPANDED_NAME) : unit = (
	case s_lookup (trans_expanded_name ident) (!pack_env) of
		Nil => ()
	|	Value {with_dict, private_dict, zmod, ...} => (
		let	val block = block_flags(empty_block, false_flags);
			val the_dict =
				if	is_ancestor
				then	private_dict
				else	with_dict;
			val block = block_dict (block, the_dict);
			val avs = #vc_aux_vars(get_local_vars the_dict);
			fun check_av av = (
				case current_cn_env av of
					Value _ => fail "new_scope_with" 507142 [fn () => fmt_expanded_name ident, fn () => av]
				|	Nil => ()

			);
			val _ = app check_av avs;
		in	new_parent_aux true zmod;
			blocks := new_scope_common Nil (block :: !blocks)
		end
	)
);
=TEX
=SML
val ⦏new_scope_with⦎ : EXPANDED_NAME -> unit =
	new_scope_with_or_ancestor false;
=TEX
=SML
val ⦏new_scope_ancestor⦎ : EXPANDED_NAME -> unit =
	new_scope_with_or_ancestor true;
=TEX
\subsection{The SID function update\_envs\_pack\_spec}

In {\it update\_envs\_pack\_spec}, if we are processing a nested package we enter everything from the packages with-dictionary into the top block of the running environment and also propagate this information into the subunit, dec and spec environments.

=SML
fun ⦏update_subunit_env_pack_spec⦎
	(fed : ENV_INFO S_DICT) : unit = (
	let	val dec_lab1 = #dec_lab (block 1);
		fun do1_subunit
			(id1_id2_s as
				(id1_id2,
				s as {in_scope as {dec_labels, ...}, ...})
					: string * SUBUNIT) = (
			if	dec_lab1 mem dec_labels
			then	(id1_id2,
				subunit_in_scope (s, in_scope_new_dict_entries(in_scope, fed)))
			else	id1_id2_s
		);
	in	subunit_env := map do1_subunit (!subunit_env)
	end
);
=TEX
=SML
fun ⦏update_dec_env_pack_spec⦎
	(fed : ENV_INFO S_DICT) : unit = (
	let	val dec_lab1 = #dec_lab (block 1);
		fun do1_dec_label
			(dec_label_d as
				(dec_label,
				d as {in_scope as {dec_labels, ...}, ...})
					: string * DECLAB) = (
			if	dec_lab1 mem dec_labels
			then	(dec_label,
				declab_in_scope (d, in_scope_new_dict_entries(in_scope, fed)))
			else	dec_label_d
		);
	in	dec_env := map do1_dec_label (!dec_env)
	end
);
=TEX
=SML
fun ⦏update_spec_env_pack_spec⦎
	(fed : ENV_INFO S_DICT) : unit = (
	let	val dec_lab1 = #dec_lab (block 1);
		fun do1_spec_label
			(spec_label_s as
				(spec_label,
				s as {spec as {w, ...},
					in_scope as {dec_labels, ...}, ...})
					: string * SPECLAB) = (
			if	dec_lab1 mem dec_labels
			then	(spec_label,
				speclab_in_scope (s, in_scope_new_dict_entries(in_scope, fed)))
			else	spec_label_s
		);
	in	spec_env := map do1_spec_label (!spec_env)
	end
);
=TEX
Now the SID function bringing the above three together and adding the new information to the current environment.
=SML
fun ⦏update_envs_pack_spec⦎ (ident : EXPANDED_NAME) : unit = (
if	test_flag #body_flag 1
then	case s_lookup (trans_expanded_name ident) (!pack_env) of
		Nil => fail "update_envs_pack_spec" 507060 [fn _ => fmt_expanded_name ident]
	|Value {with_dict, ...} => (
		let	val block = block 1
			handle Fail _ => error "update_envs_pack_spec" 507006 [];
			val in_scope = #in_scope(#declab block);
			val fed = flatten_env_dict with_dict;
			val block = block_in_scope (block, in_scope_new_dict_entries(in_scope, fed));
		in	blocks := block :: tl(!blocks);
			if	test_flag #declabel_flag 1
			then	(update_subunit_env_pack_spec fed;
				 update_dec_env_pack_spec fed;
				 update_spec_env_pack_spec fed)
			else	()
		end
	)
else	()
);
=TEX
\subsection{The SID function new\_scope\_pack\_body}
=TEX
The method used below is to take the local dictionary for the package and filter out unwanted items from it.
The things to be filtered out comprise everything defined in the package (and therefore in the with-dictionary) except the types, constants and variables.
We use {\em env\_of\_env\_dict1} because we do not want to exclude things that are not actually declared in the with-dictionary (e.g., constants declared in withed packages).
=SML
fun ⦏init_pack_body_dict⦎ (name : Z_ID,
	package as {private_dict, local_dict, ...} : PACKAGE) : ENV_DICT = (
	let	fun wanted (zn, {canon_name, info, ...} : ENV_INFO)  = (
			case  info of
				EIEnvRecordType _ => true
			|	EIEnvOtherType => true
			|	EIEnvConstant _ => true
			|	EIEnvVar _ => true
			|	_ => (
				case env_of_env_dict1 private_dict canon_name of
					Value _  => false
				|	Nil => true
			)
		);
		val unwanted = map fst (flatten_env_dict local_dict drop wanted);
		val new_dict = delete_from_env_dict local_dict unwanted;
	in	new_dict
	end
);
=TEX
=SML
fun ⦏new_scope_pack_body⦎ (ident : EXPANDED_NAME) : unit = (
	let	val zn = trans_expanded_name ident;
		val package1 = force_value(s_lookup zn (!pack_env))
			handle Fail _ =>
			fail "new_scope_pack_body" 507030 [fn()=>fmt_expanded_name ident];
		val flags = {
			pack_spec_flag = false,
			pack_body_flag = true,
			stub_flag = false,
			subunit_flag = false,
			formal_body_flag = false,
			fun_flag = false,
			declabel_flag = false,
			speclabel_flag = false,
			till_flag = false,
			body_flag = true,
			private_flag = false
		};
		val old_subunit_flag = test_flag #subunit_flag 1;
		val pack_ident =
		if	old_subunit_flag
		then	prefix_trans_id
			(ada_block_name(#block_name(#declab(block 1))))
			zn
		else	(new_parent_aux false (#zmod package1);
			zn);
		val dict = init_pack_body_dict(zn, package1);
		val block = block_block_name(
				block_dict(block_flags(empty_block, flags), dict),
				(map Value ident));
		val scope_entry = {theory = pack_ident ^ pack_body_tag, deferred = DSNotDeferred, body_labels = Nil};
	in	(scope_env :=
		e_extend pack_ident scope_entry (!scope_env)
		handle Fail _ => (
			fail "new_scope_pack_body" 507143
			[fn () => fmt_expanded_name ident]));
		blocks := new_scope_common Nil (block :: !blocks)
	end
);
=TEX
\subsection{The SID function end\_scope\_comp\_unit}
=SML
fun ⦏end_scope_comp_unit⦎ ((): unit) : unit = (
	blocks := env0
);
=TEX
\subsection{The SID function aux\_var}
=SML
local
fun ⦏aux_var1⦎ (av as (aux, t) : Z_ID * Z_TM) : unit = (
	let	val block1 = block 1
			handle Fail _ => error "aux_var" 507006 [];
		val block_name1 = #block_name(#declab (block1));
		val bn1 = expanded_name block_name1;
		val package = case (s_lookup bn1 (!pack_env)) of
			Value p => p
		|	Nil => error "aux_var" 507001 [fn()=>bn1];
		val side = set_current_ti_context[];
		val zt = z_predexp_of_z_tm current_cn_env t;
		val zvar = mk_z_lvar(aux, (dest_z_power_type o type_of) zt, []);
		val zdecl = mk_z_dec([zvar], zt);
		val aux_vars1 = #aux_vars package drop (fn x => zdecl =$ x);
		val zids_in_scope = ((cn_env_of_in_scope o #in_scope o #declab)
				 block1, []);
	in	check_new_z_id zids_in_scope aux;
		check_new_spark_ids current_cn_env [aux];
		pack_env :=
		s_enter
		bn1
		(package_aux_vars(package, [zdecl]))
		(!pack_env);
		blocks :=
		block_vc_aux_vars Nil (block1, [zdecl]):: tl (!blocks)

	end
);
in
fun ⦏aux_var⦎ ({aux, t} : AUX_VAR) : unit = (
	app aux_var1 (map (fn n => (n, t)) aux)
);
end;
=TEX

\subsection{The SID function using\_dec}

=SML
fun ⦏ud_fun_of_using_dec⦎ (ud : USING_DEC)
		: Z_ID * (VAR_DECL list * CNTypes.Z_PRED)= (
	let	val {	aux,
			concrete_vars,
			invariant, ...}		= ud;
		val block1 = block 1
			handle Fail _ => error "ud_fun_of_using_dec" 507006 [];
		val block_name1 = (#block_name o #declab) block1;
		val bn1 = expanded_name block_name1;
		val package = (force_value(s_lookup bn1 (!pack_env)))
			handle Fail _ =>
			error "ud_fun_of_using_dec" 507012 [fn()=>bn1];
		val side = set_current_ti_context (#aux_vars package);
		val (id, _, _) = (dest_z_lvar o z_predexp_of_z_tm current_cn_env) aux;
	in	(id, (concrete_vars, z_pred_of_z_tm current_cn_env invariant))
	end
);
=TEX
=SML
fun ⦏update_dec_env_using_dec⦎ (ud_fn : Z_ID * (VAR_DECL list * Z_PRED)) : unit = (
	let	val dec_lab1 = #dec_lab (block 1);
		fun do1_dec_label
			(dec_label_s as
				(dec_label, declab as {in_scope = {dec_labels, ...}, ...})
					: string * DECLAB) = (
			if	dec_lab1 mem dec_labels
			then	(dec_label, declab_using_dec (declab, ud_fn))
			else	dec_label_s
		);
	in	dec_env := map do1_dec_label (!dec_env)
	end
);
=TEX
=SML
fun ⦏using_dec⦎ (ud: USING_DEC) : unit = (
	if	test_flag #pack_body_flag 1
	then	let	val block1 = block 1
				handle Fail _ => error "using_dec" 507006 [];
			val using_decs1 = #using_decs(#declab block1);
			val ud_fn as (id, _) = ud_fun_of_using_dec ud;
			fun ud_fun_check (id1, (bd1, tm1)) (id2, (bd2, tm2)) = (
				if	id1 = id2
				then	fail "using_dec" 507031 [fn () => id1]
				else	()
			);
			val _ = map (ud_fun_check ud_fn) using_decs1;
		in	blocks :=
			block_using_dec(block1, ud_fn):: tl (!blocks);
			update_dec_env_using_dec ud_fn
		end
	else	fail "using_dec" 507037 []
);
=TEX
\subsection{The SID function vcs\_aux\_initial}
=SML
fun ⦏vcs_aux_initial⦎ (st : STATEMENT) : SPEC = (
	let	val block1 = block 1;
		val block_name1 = #block_name(#declab (block1));
		val bn1 = expanded_name block_name1;
		val package = case (s_lookup bn1 (!pack_env)) of
			Value p => p
		|	Nil => error "vcs_aux_initial" 507001 [fn()=>bn1];
		val aux_vars1 = #aux_vars package;
		val vc_vars1 = #vc_vars(get_local_vars(#dict(#in_scope(#declab block1))));
		val w = vc_vars1;
		val in_scope = flatten_env (!blocks);
		val vc_vars = #vc_vars(get_local_vars(#dict in_scope));
		val using_decs1 = #using_decs(#declab block1);
		val vc_inits1 = #var_inits block1;
		val in_scope' = in_scope_dict(in_scope, set_cn_scope (#dict in_scope) vc_vars);
		val wp_env :WP_ENV = {
			env = cn_env_of_in_scope in_scope',
			till = mk_z_true,
			named_tills = [],
			return = mk_z_true,
			fun_header = dummy_informal_fun
		};
		val pre1 = var_inits_pre Nil vc_inits1 (#env wp_env)
			handle exn =>
			pass_on exn "var_inits_pre" "vcs_aux_initial";
		val invariants = (map snd o map snd) using_decs1;
		val post1 = z_exists (aux_vars1, z_many_and invariants);

		val spec : SPEC = add_init_vars_spec {
			w = w,
			w0 = [],
			pre = pre1,
			post = z_quote (post1, Nil)
		};
		val speclab : SPECLAB = {
			spec = spec,
			formal_body_flag = true,
			fun_flag = false,
			till_flag = false,
			wp_env = wp_env,
			in_scope = in_scope',
			block_name = block_name1
		};
		val (vcs, routes, res_spec) = call_vcs (speclab, st)
	in	store_vcs(
			Nil, vcs,
			Value (speclab_update_spec(speclab,res_spec)), routes,
			VCG_package_init
		);
		res_spec
	end
);
=TEX
\section{RENAMING DECLARATIONS}\label{RENAMINGDECLARATIONS}
\subsection{The SID function renames\_proc}
=TEX
=SML
fun ⦏get_par_names_defs⦎ (par_specs : PARAMETER_SPECIFICATION list) : (ID * Z_EXP OPT) list = (
	let	fun trans_def_exp e = (
			let	val tm = trans_exp current_cn_env (adjust_exp current_cn_env e);
			in	case frees tm of
					[] => Value tm
				|	[t] => (
						comment "get_par_names_defs" 507081
			[fn _ => string_of_term tm, fn _ => string_of_term t];
						Nil
				) |	fs =>  (
					comment "get_par_names_defs" 507082
			[fn () => string_of_term tm, fn () =>  format_list string_of_term fs ", "];
					Nil
				)
			end
		);
		fun aux acc ([] : PARAMETER_SPECIFICATION list) = flat (rev acc)
		|    aux acc ({idlist, default as Nil, ...}::more) = aux (map (fn n => (n, Nil)) idlist :: acc) more
		|    aux acc ({idlist, default as Value e, ...}::more) = (
			let	val def = trans_def_exp e;
			in	aux (map (fn n => (n, def)) idlist :: acc) more
			end
		);
	in	aux [] par_specs
	end
);
=TEX
=SML
fun ⦏get_name_and_par_names_defs⦎  (ss :  SUBPROGRAM_SPECIFICATION) : ID * (ID * Z_EXP OPT) list = (
	let	val (id, formal_part) = case ss of
			SSProcedure{formal_part, name, ...} => (name, formal_part)
		|	SSFunction{formal_part, designator, ...} => (designator,  formal_part);
	in	(id, get_par_names_defs formal_part)
	end
);
=TEX
=SML
fun ⦏get_package_proc_spec⦎ (caller : string)
	(fps : FORMAL_PROC list) (name : ID)  : FORMAL_PROC= (
let	val zn = trans_id name;
	fun is_it ({name = n, ...} : FORMAL_PROC) : bool = (zn = trans_id n);
in	find fps is_it
	handle Fail _ =>
	fail caller 507132 [fn()=>name]
end
);
=TEX
=SML
fun ⦏renames_proc_common⦎
	(pack_fps : FORMAL_PROC list)
	({subprogram_specification = ss, name1, name2}
		: SUBPROGRAM_RENAMING)
	 : FORMAL_PROC OPT = (
	let	val (new, par_names_defs) = get_name_and_par_names_defs ss;
		val old = trans_id(case name1 of Value pack => pack dot name2 | Nil => name2);
		val old_fp =
			Value(get_proc_spec "renames_proc_common" current_cn_env  old)
			handle Fail _ => (
				Value(get_package_proc_spec "renames_proc_common"  pack_fps old)
				handle Fail _ =>  Nil
			);
		val new_fp  =
			case current_cn_env new of
				Value{info = EIEnvProcedure{
					formal_proc = fp}, ...} => fp
			| _ => Nil;
	in	case (new_fp, old_fp) of
			(Nil,
			 Value {
				formal_ids,
				globals, spec,
				par_names_defs = old_par_names_defs, ...}) => (
				if	length par_names_defs = length old_par_names_defs
				then	Value{	name = new,
						par_names_defs = par_names_defs,
						formal_ids = formal_ids,
						globals = globals,
						spec = spec}
				else	fail "renames_proc_common" 507059
					[fn _ => old, fn _ => new]
		) |	(Value _, _) => (	fail "renames_proc_common" 507052
					[fn _ => old, fn _ => new]
		) |	(Nil, Nil) => (	Nil
		)
	end
);
=TEX
=SML
fun ⦏renames_proc_pack_spec⦎
	(sr as {subprogram_specification = ss, name1 =opack, name2=old}
		: SUBPROGRAM_RENAMING)
	: unit = (
let	val block1 = block 1;
	val block_name1 = #block_name(#declab (block1));
	val bn1 = expanded_name block_name1;
	val package2 = force_value(
		s_lookup bn1 (!pack_env))
		handle _ => fail "renames_proc_pack_spec" 507012 [fn ()=> bn1];
	val fps = #formal_procs package2;
 	val oformal_proc3 = renames_proc_common fps sr;
	fun un_mk_param_spec {var_decl = {vars, tmark}, mode} = (
		{idlist = vars, name = tmark, mode = mode, default = Nil}
	);
in
	case oformal_proc3 of
	Nil => ()
	| Value (formal_proc3 as {name, formal_ids, ...}) => (
		new_scope_proc_form name;
		curr_form_proc formal_proc3;
		fformal_part (map un_mk_param_spec formal_ids);
		form_proc_pack_spec formal_proc3;
		end_scope()
	)
end
);
=TEX
=SML
fun ⦏renames_proc_otherwise⦎
	(sr as {subprogram_specification = ss, name1 = opack, name2=old}
		: SUBPROGRAM_RENAMING)
	: unit = (
let	val oformal_proc3 = renames_proc_common [] sr;
in
	case oformal_proc3 of
	Nil => ()
	| Value formal_proc3 =>
(let	val block1 = block 1;
	val pfx_info = current_prefix_info 1;
	val private = test_flag #private_flag 2;
	val pfx_priv = (pfx_info, private);
in	blocks :=
		(block_formal_proc Nil pfx_priv (block1, formal_proc3)
		:: tl (!blocks))
end)
end
);
=TEX
=SML
fun ⦏renames_proc⦎ (sr : SUBPROGRAM_RENAMING)
	: unit = (
	if	test_flag #pack_spec_flag 1
	then	renames_proc_pack_spec sr
	else	renames_proc_otherwise sr
);
=TEX
\subsection{The SID function renames\_fun}
=TEX
=SML
fun ⦏combine_param_specs⦎ (old : PARAM_SPEC list) (new : PARAM_SPEC list) : PARAM_SPEC list OPT = (
	let	fun flat_param_spec acc [] =acc
		|    flat_param_spec acc  ({var_decl = {vars = v::vs, tmark}, mode} :: more)  = (
			flat_param_spec
			((v, tmark, mode)::acc)
			 ({var_decl = {vars = vs, tmark = tmark}, mode = mode} :: more)
		)  |  flat_param_spec acc ({var_decl = {vars=[], ...}, ...}::more) = flat_param_spec acc more;
		fun merge acc [] = acc
		|   merge acc (((_, tm1, m1), (v2, _, _))::more) = (
			merge ({var_decl = {vars =[v2], tmark = tm1}, mode = m1}::acc) more
		);
		val old' = flat_param_spec [] old;
		val new' = flat_param_spec [] new;
	in	Value (merge [] (combine old' new'))
	end	handle Fail _ => Nil
);
=TEX
=SML
fun ⦏renames_fun_pack_spec⦎
	({subprogram_specification = ss as SSFunction {formal_part, designator, return, ...},
		name1 = opack, name2=old}
		: SUBPROGRAM_RENAMING)
	: unit = (
	let	val block1 = block 1;
		val block_name1 = #block_name(#declab (block1));
		val bn1 = expanded_name block_name1;
		val package2 = force_value(
			s_lookup bn1 (!pack_env))
			handle _ => fail "renames_fun_pack_spec" 507012 [fn ()=> bn1];
		val pfx_info as {canon, ... } = pack_spec_prefix_info block_name1;
		val private = test_flag #private_flag 1;
		val pfx_priv = (pfx_info, private);
		val old_name = (case opack of  Value pack => pack dot old | Nil => old);
		val old_zname =  trans_id old_name;
		val new_zname  = prefix_trans_id canon designator;
		val new_pars = map mk_param_spec formal_part;
		val (_, new_par_names_defs) = get_name_and_par_names_defs ss;
	in	case current_cn_env old_zname of
			Value {	canon_name = can_n,
				info = EIEnvFunction {
					spec as (Value _),
					deps = old_deps,
					pars = old_pars,
					return_tmark = old_return_tmark}, ...}  => (
			let	val (_, par_names_defs) = get_name_and_par_names_defs ss;
				val old_tmarks = map #tmark old_pars;
				val (new_par_names, new_defs) = split par_names_defs;
				val new_pars_tmarks_defs = combine new_par_names
					(combine old_tmarks new_defs);
				fun mk_ps (name, (tmark, _)) : PARAM_SPEC = (
					{mode = MSparkIn true, var_decl = {vars = [name], tmark = tmark}}
				);

				val new_if = 					{name = designator,
					formal_pars = map mk_ps new_pars_tmarks_defs ,
					par_names_defs = par_names_defs,
					return_type = old_return_tmark};
				val _ = add_fun_env
pfx_priv spec (Value can_n)
					old_deps
					new_if;
				val _ = update_envs_fun pfx_priv spec (Value can_n) old_deps new_if;
				val new_ff = {
					informal_fun = new_if,
					spec = dummy_spec,
					globals = old_deps};
			in	pack_env :=
				s_enter
				bn1
				(package_formal_fun pfx_priv (package2, new_ff, Value can_n))
				(!pack_env)
			end
		) |	_ =>  ( (* missing or informal *)
			let	val (_, par_names_defs) = get_name_and_par_names_defs ss;
				val new_if = {
					name = designator,
					formal_pars =map mk_param_spec formal_part ,
					par_names_defs = par_names_defs,
					return_type = curr_real_name return};
				val ifs = #informal_funs package2;
			in	pack_env :=
				s_enter
				bn1
				(package_informal_fun pfx_priv (package2, new_if))
				(!pack_env)
			end
		)
	end
) | renames_fun_pack_spec _ = () (* Caller will never make this happen *);
=TEX
=SML
fun ⦏renames_fun_otherwise⦎
	({subprogram_specification = ss, name1 = opack, name2=old}
		: SUBPROGRAM_RENAMING)
	: unit = (
	let	val old_name = (case opack of  Value pack => pack dot old | Nil => old);
		val old_zname =  trans_id old_name;
		val (new, par_names_defs) = get_name_and_par_names_defs ss;
	in let	val (can_n, old_deps, old_pars, old_return_tmark, spec) = force_value(
		case current_cn_env old_zname of
			Value {	canon_name = can_n,
				info = EIEnvFunction {
					spec,
					deps,
					pars,
					return_tmark}, ...}  => (
				Value (can_n, deps, pars, return_tmark, spec)
			) | _ => Nil);
		val old_tmarks = map #tmark old_pars;
		val (new_par_names, new_defs) = split par_names_defs;
		val new_pars_tmarks_defs = combine new_par_names
				(combine old_tmarks new_defs);
		val new_zname = trans_id new;
		fun mk_ps (name, (tmark, _)) : PARAM_SPEC = (
			{mode = MSparkIn true, var_decl = {vars = [name], tmark = tmark}}
		);
		val inffun =
			{name = new_zname,
			formal_pars = map mk_ps new_pars_tmarks_defs,
			par_names_defs = par_names_defs,
			return_type = old_return_tmark};
		val pfx_info = current_prefix_info 1;
		val private = test_flag #private_flag 1;
		val pfx_priv = (pfx_info, private);
		val _ = add_fun_env pfx_priv spec (Value can_n) old_deps inffun;
		val _ = update_envs_fun pfx_priv spec (Value can_n) old_deps inffun;
	in	()
	end	handle Fail _ =>
			fail "renames_fun_otherwise" 507064
			[fn _ => old_name, fn _ => new]
	end
);
=TEX
=SML
fun ⦏renames_fun⦎ (sr : SUBPROGRAM_RENAMING)
	: unit = (
	if	test_flag #pack_spec_flag 1
	then	renames_fun_pack_spec sr
	else	renames_fun_otherwise sr
);
=TEX
\subsection{The SID function renames\_opsym}
=SML
fun ⦏renames_opsym⦎
	({new_name as Value new, formal_part, tmark, name1, name2}
		: OPSYM_RENAMING)
	: unit = (
	let	val par_names_defs =get_par_names_defs formal_part;
		val  (par_names, defs) = split par_names_defs;
		val (tm, tmks, res_tmark) =
			force_value (resolve_opsym current_cn_env name2 formal_part tmark);
		val new_pars_tmarks_defs = combine par_names (combine tmks defs);
		val new_zname = trans_id new;
		fun mk_ps (name, (tmark, _)) : PARAM_SPEC = (
			{mode = MSparkIn true, var_decl = {vars = [name], tmark = tmark}}
		);
		val inffun = {name = new_zname,
			formal_pars = map mk_ps new_pars_tmarks_defs ,
			par_names_defs = par_names_defs,
			return_type =res_tmark};
		val pfx_info = current_prefix_info 1;
		val private = test_flag #private_flag 1;
		val pfx_priv = (pfx_info, private);
		val spec = Value dummy_spec;
		val _ = add_fun_env pfx_priv spec Nil [] inffun;
		val _ = update_envs_fun pfx_priv spec Nil [] inffun;
		val parainfo = AbbDefInfo(new_zname, [], tm);
	in	bd_store_para parainfo; ()
	end	handle Fail msg =>
			fail "renames_opsym" 507064
			[fn _ => name2, fn _ => new]
) | renames_opsym _ = ();
=TEX
\subsection{Propagating renamings into the environments}
=SML
fun ⦏update_subunit_env_renamings⦎
	(pfx_info : PREFIX_INFO)
	(renamings :  (Z_ID * Z_ID OPT) list) : unit = (
	let	val dec_lab1 = #dec_lab (block 1);
		fun do1_subunit
			(id1_id2_s as
				(id1_id2,
				s as {in_scope as {dec_labels, ...}, ...})
					: string * SUBUNIT) = (
			if	dec_lab1 mem dec_labels
			then	(id1_id2,
				subunit_renamings pfx_info (s,  renamings))
			else	id1_id2_s
		);
	in	subunit_env := map do1_subunit (!subunit_env)
	end
);
=TEX
=SML
fun ⦏update_dec_env_renamings⦎
	(pfx_priv : PREFIX_INFO * bool)
	(renamings :  (Z_ID * Z_ID OPT) list) : unit = (
	let	val dec_lab1 = #dec_lab (block 1);
		fun do1_dec_label
			(dec_label_s as
				(dec_label,
				s as {in_scope as {dec_labels, ...}, ...})
					: string * DECLAB) = (
			if	dec_lab1 mem dec_labels
			then	(dec_label,
				declab_renamings pfx_priv (s, renamings))
			else	dec_label_s
		);
	in	dec_env := map do1_dec_label (!dec_env)
	end
);
=TEX
=SML
fun ⦏update_spec_env_renamings⦎
	(pfx_info : PREFIX_INFO)
	(renamings :  (Z_ID * Z_ID OPT) list) : unit = (
	let	val dec_lab1 = #dec_lab (block 1);
		fun do1_spec_label
			(spec_label_s as
				(spec_label,
				s as {spec as {w, ...},
					in_scope as {dec_labels, ...}, ...})
					: string * SPECLAB) = (
			if	dec_lab1 mem dec_labels
			then	(spec_label, speclab_renamings pfx_info (s, renamings))
			else	spec_label_s
		);
	in	spec_env := map do1_spec_label (!spec_env)
	end
);
=TEX
The schema conjunction from the specification is implemented as sequential composition.
=SML
fun ⦏update_envs_renamings⦎ (renamings :  (Z_ID * Z_ID OPT) list) : unit = (
	if	test_flag #declabel_flag 1
	then	let	val pfx_info = current_prefix_info 1;
			val private = test_flag #private_flag 1;
			val pfx_priv = (pfx_info, private);
		in	update_subunit_env_renamings pfx_info renamings;
			update_dec_env_renamings pfx_priv renamings;
			update_spec_env_renamings pfx_info renamings
		end
	else	()
);
=TEX
\subsection{The SID function renames\_object}
The implementation organises the logic a little differently from the specification but with the
same effect. It checks whether the renaming is a constant renaming simply by trying to
store the relevant abbreviation definition in the current theory (using {\it bd\_store\_para} so that
if the object renaming simply duplicates an earlier one it is accepted). This is guaranteed to
fail if the renaming is a legal variable renaming. If it succeeds, then we're done, otherwise
we do the appropriate work for variable renaming. Thus {\it renames\_object\_common}
below does the work of both {\it renames\_var\_common} and {\it renames\_const}, hence
the change of name. Likewise for {\it renames\_object\_pack\_spec}.
=SML
fun ⦏renames_object_common⦎
	(pfx : Z_ID list)
	({new_name, old_name, ...}
		: OBJECT_RENAMING) : (Z_ID * Z_ID OPT) OPT = (
	let	val old_zname =  trans_id old_name;
		val new_zname = trans_id new_name;
		val can_n  =
			case current_cn_env old_zname of
				Value {canon_name, ...} => canon_name
			|	Nil => fail "renames_object_common" 507129 [fn () => old_zname] (* caught immediately *);
	in	case current_cn_env new_zname of
			Value{canon_name = orig', ...} => (
				if	orig' = old_zname
				then	Nil
				else	fail "renames_object_common" 507064
				[fn _ =>old_name, fn _ => new_name]

		) |	Nil => (
		let	val renaming = (new_zname, Value can_n);
			val block1 = block 1
			handle Fail _ => error "add_var_env" 507006 [];
			val block_name1 = #block_name(#declab block1);
			val bn1 = expanded_name block_name1;
			val avs = #aux_vars (
				force_value(s_lookup bn1 (!pack_env)))
				handle Fail _ => [];
			val av_names = flat (map z_names_of_z_dec avs);
			val zids_in_scope = (current_cn_env, av_names);
			val pfx_info = current_prefix_info 1;
			val private = test_flag #private_flag 1;
			val pfx_priv = (pfx_info, private);
		in	map (check_new_z_id zids_in_scope) [new_zname];
			check_new_spark_ids current_cn_env [new_zname];
			blocks :=
			block_renamings pfx_priv (block1, [renaming]):: tl (!blocks);
			update_envs_renamings [renaming];
			Value renaming
		end
		)
	end
);
=TEX
=SML
fun ⦏renames_object_pack_spec⦎ (obj_ren : OBJECT_RENAMING) : unit = (
	let	val block_name1 = #block_name(#declab (block 1));
		val bn1 = expanded_name block_name1;
		val package = case (s_lookup bn1 (!pack_env)) of
			Value p => p
		|	Nil => error "renames_object_pack_spec" 507001 [fn _=>bn1];
		val pfx_info = pack_spec_prefix_info block_name1;
		val private = test_flag #private_flag 1;
		val pfx_priv = (pfx_info, private);
		val fbn1 = full_block_name block_name1;
	in	case renames_object_common fbn1 obj_ren of
			Nil => ()
		|	Value renaming =>
			pack_env :=
			s_enter
			bn1
			(package_obj_renaming pfx_priv (package, renaming))
			(!pack_env)
	end
);
=TEX
=SML
fun ⦏renames_object⦎ (obj_ren : OBJECT_RENAMING)
	: unit = (
	if	test_flag #pack_spec_flag 1
	then	renames_object_pack_spec obj_ren
	else	(renames_object_common [] obj_ren; ())
);
=TEX
=SML
fun ⦏check_pack_complete⦎
	({decl = {comp_unit = CUPackageDeclaration {pack_decl, ...}, ...},  zmod,...}: PACKAGE) : unit = (
	let	fun pack_name() = fmt_expanded_name (#name pack_decl);
		val re =
			if	zmod = !script_name
			then	!repl_env
			else	#repl_env (get_saved_z_generator_state zmod)
				handle Fail _ => fail "check_pack_complete" 507072
				[pack_name, fn _ => zmod];
		fun get_repl label = (
			case s_lookup label re of
				Nil => Nil
			|	Value {repl, ...} => Value repl
		);
		fun check_decls acc [] = rev acc
		|     check_decls acc (DDeclarationKSlot ({label, ...}, _) ::more) = (
			case get_repl label of
				Nil => check_decls (label::acc) more
			|	(Value (UnReplaced _)) => check_decls (label::acc) more
			|	(Value (ReplaceVPart {visible, ...})) => check_decls acc (visible@more)
			|	(Value (ReplacePPart {private, ...})) => check_decls acc (private@more)
			|	_ => check_decls acc more
		)  | check_decls acc (DPackageDeclaration  {visible_decs, private_decs as Value pds, ...}:: more) = (
			check_decls acc (pds@visible_decs@more)
		)  | check_decls acc (DPackageDeclaration  {visible_decs, private_decs as Nil, ...}:: more) = (
			check_decls acc (visible_decs@more)
		) | check_decls acc (_::more) = check_decls acc more;
	in	case check_decls [] [DPackageDeclaration pack_decl] of
			[] => ()
		|	[lab] =>
			fail "check_pack_complete" 507071
			[pack_name, fn _ =>  ": " ^ lab]
		|	labs as (_::_) =>
			fail "check_pack_complete" 507071
			[pack_name, fn _ =>  "s: " ^ format_list (fn s => s) labs ", "]

	end
) | check_pack_complete {zmod, ...} = error "check_pack_complete" 507079 [fn _ => zmod];
=TEX
\subsection{The SID function renames\_pack}
{\it renames\_pack} processes a package renaming effectively by replaying a set of renaming and
subtype declarations asserting that the new expanded names declared by each declaration in the
package are equal to the old expanded names as in:
\begin{verbatim}
	subtype ty is package_name.ty;
	NEW_NAMEoC :... renames package_name.c
	NEW_NAMEoV : ... renames package_name.v
\end{verbatim}

=SML
=TEX
=SML
fun ⦏renames_pack⦎ (old_en : EXPANDED_NAME, new_en : EXPANDED_NAME)  : unit = (
	let	val old_name =
			case old_en of
				[sn] => sn
			|	_ => fail "renames_pack" 507159
				[fn _ => fmt_expanded_name new_en,
				 fn _ => fmt_expanded_name old_en];
		val old_name = trans_expanded_name old_en;
		val new_name = trans_expanded_name new_en;
		fun prefix_id ident n = trans_id (ident dot n);
		val pack =
			case (s_lookup new_name (!pack_env), s_lookup old_name (!pack_env)) of
				(Nil, Value p) => (
					p
			) |	(Value _, _) => fail "renames_pack" 507061
					[fn _ => old_name, fn _ => new_name]
			|	(_, Nil) => fail "renames_pack" 507062
					[fn _ => old_name, fn _ => new_name];
		val _ = check_pack_complete pack;
		val {vc_vars, consts_types, formal_procs, informal_procs, informal_funs, formal_funs, obj_renamings,
			zmod, decl, aux_vars = _, local_dict, with_dict = _, private_dict = _} = pack;
		fun const_def id = (
			BDConstDecl{
				consts= [prefix_id new_name id],
				expr = EId (prefix_id old_name id),
				tm = Nil}
		);
		fun subtype_def id = (
			BDSubtypeDecl{
				name = prefix_id new_name id,
				sub_ind = {tmark = prefix_id old_name id, con = CNoCon}}
		);
		fun get_consts_types acc [] = acc
		|   get_consts_types acc (BDConstDecl{consts, ...}::more) = (
			get_consts_types
			(map const_def consts @acc) more
		) | get_consts_types acc  (BDTypeDecl{name, type_def as
			TDEnumTypeDef {vals}}::more) = (
			get_consts_types(subtype_def name::map const_def vals @ acc) more
		) | get_consts_types acc  (BDTypeDecl{name, ...}::more) = (
			get_consts_types(subtype_def name::acc) more
		) | get_consts_types acc (BDSubtypeDecl{name, ...}::more) = (
			get_consts_types (subtype_def name::acc) more
		) | get_consts_types acc (_::more) = (
			get_consts_types acc more
		);
		val bds_to_do = get_consts_types [] consts_types;
		val _ = map basic_declaration bds_to_do;
		fun do_renaming (new, old)   = (
			renames_object
			{new_name = prefix_id new_name new,
			 old_name = case env_of_env_dict local_dict old of
				Value {canon_name, ...} => canon_name
			|	Nil => old,
			 tmark = ""}
		);
		val vars = flat (map #vars vc_vars);
		val _ = (map do_renaming o (fn v => combine v v)) vars;
		val rens = mapfilter (Combinators.I ** force_value) obj_renamings;
		val _ = map do_renaming rens;
		fun untrans_par  (par_names_defs : (ID * Z_EXP OPT) list)
			({var_decl = {vars, tmark}, mode} : PARAM_SPEC)
			 : PARAMETER_SPECIFICATION = (
			{idlist = vars, mode = mode, name = tmark, default =
			Value (EAuxiliaryExp (z_quote(
				force_value(force_value (s_lookup (hd vars) par_names_defs)), Nil)))
			handle Fail _ => Nil}
		);
		fun untrans_ff ({
				informal_fun = {name, formal_pars, return_type, par_names_defs},
				globals, ...} : FORMAL_FUN)
			: SUBPROGRAM_SPECIFICATION = (SSFunction
				{designator = prefix_id new_name name,
				formal_part = map (untrans_par par_names_defs) formal_pars,
				 return = return_type,
				 spec = Nil, annotation = [], globals = globals}
		);
		fun do_formal_fun (ff as {informal_fun = {name, ...}, ...}) = (
			let	 val ss = untrans_ff ff;
			in	renames_fun{subprogram_specification = ss,
					name1 = Value old_name,
					name2 = name}
			end
		);
		val _ = map do_formal_fun formal_funs;
		fun untrans_fp ({name, formal_ids, globals, par_names_defs, ...} : FORMAL_PROC)
			: SUBPROGRAM_SPECIFICATION = (SSProcedure
				{name =  prefix_id new_name name,
				 formal_part = map (untrans_par par_names_defs) formal_ids,
				 spec = Nil, annotation = [], globals = globals}
		);
		fun do_formal_proc (fp as {name, ...}) = (
			let	 val ss = untrans_fp fp;
			in	renames_proc{subprogram_specification = ss,
					name1 = Value old_name,
					name2 = name}
			end
		);
		val _ = map do_formal_proc formal_procs;
	in	()
	end
);
=TEX
\subsection{The SID function use\_pack}
=TEX
=SML
fun ⦏update_subunit_env_used_package⦎ (name : ID) : unit = (
	let	val dec_lab1 = #dec_lab (block 1);
		fun do1_subunit
			(id1_id2_s as
				(id1_id2,
				s as {in_scope as {dec_labels, ...}, ...})
					: string * SUBUNIT) = (
			if	dec_lab1 mem dec_labels
			then	let	val dict' = add_used_package (#dict in_scope) name;
					val in_scope' = in_scope_dict(in_scope, dict');
				in	(id1_id2,
						subunit_in_scope (s,  in_scope'))
				end
			else	id1_id2_s
		);
	in	subunit_env := map do1_subunit (!subunit_env)
	end
);
=TEX
=SML
fun ⦏update_dec_env_used_package⦎ (name : ID)  : unit = (
	let	val dec_lab1 = #dec_lab (block 1);
		fun do1_dec_label
			(dec_label_s as
				(dec_label,
				s as {in_scope as {dec_labels, ...}, ...})
					: string * DECLAB) = (
			if	dec_lab1 mem dec_labels
			then	let	val dict' = add_used_package (#dict in_scope) name;
					val in_scope' = in_scope_dict(in_scope, dict');
				in	(dec_label,
						declab_in_scope (s,  in_scope'))
				end
			else	dec_label_s
		);
	in	dec_env := map do1_dec_label (!dec_env)
	end
);
=TEX
=SML
fun ⦏update_spec_env_used_package⦎ (name : ID) : unit = (
	let	val dec_lab1 = #dec_lab (block 1);

		fun do1_spec_label
			(spec_label_s as
				(spec_label,
				s as {spec as {w, ...},
					in_scope as {dec_labels, ...}, ...})
					: string * SPECLAB) = (
			if	dec_lab1 mem dec_labels
			then	let	val dict' = add_used_package (#dict in_scope) name;
					val in_scope' = in_scope_dict(in_scope, dict');
				in	(spec_label,
						speclab_in_scope (s,  in_scope'))
				end
			else	spec_label_s
		);
	in	spec_env := map do1_spec_label (!spec_env)
	end
);
=TEX
=SML
fun ⦏update_envs_used_package⦎ (name : ID)  : unit = (
	if	test_flag #declabel_flag 1
	then	(update_subunit_env_used_package name;
		update_dec_env_used_package name;
		update_spec_env_used_package name)
	else	()
);
=TEX
The following function returns the new identifiers that are introduced when a package is referenced in a use clause.
This does not include auxiliary variables as of version 2.7.7 (enhancement 117).
=SML
fun ⦏new_ids⦎ (p : PACKAGE) : ID list = (
	let	val {vc_vars, consts_types, formal_procs,
			informal_funs, formal_funs, obj_renamings, ...} = p;
		val v = flat (map #vars vc_vars);
		fun do_enums ({type_def,...} : TYPE_DEF TYPE_DECL) = (
			case type_def of
				TDEnumTypeDef etd =>		#vals etd
			|	_ =>				[]
		);
		val c_t_ident_s = flat (map (fn ct =>
				case ct of
					BDConstDecl cd =>	#consts cd
				|	BDTypeDecl td =>	#name td :: do_enums td
				|	BDSubtypeDecl std =>	[#name std]
				|	_ =>			[]
				) consts_types);
		val p = map #name formal_procs;
		val f1 = map #name informal_funs;
		val f2 = map (#name o #informal_fun) formal_funs;
		val rens = map fst obj_renamings;

	in
		list_cup [v, c_t_ident_s, p, f1, f2, rens]
	end
);
=TEX
=SML
fun ⦏package_ids⦎ (ident : ID) : ID list = (
	case s_lookup ident (!pack_env) of
	Nil =>  []
	|Value package =>  new_ids package
);
=TEX
{\it use\_pack} processes adds an entry $(unex, ex)$ into
the running environment for every type, object and subprogram in the package, where
$unex$ is the unexpanded name for the entity and $ex$ is the expanded name.
These entries are also propagated into the subunit, dec and spec environments if the
use clause appears in the expansion of a declaration label and into the local dictionary
of the package if we are in a package specification (so that the use clause is propagated to the package body).
=SML
fun ⦏use_pack⦎ (name : EXPANDED_NAME)  : unit = (
let	val zn = trans_expanded_name name;
in
	if	zn mem get_used_packages (#dict(#in_scope(#declab(block 1))))
	then	()
	else let	val pack =
			case s_lookup zn (!pack_env) of
				Value p  =>  p
			|	Nil  => fail "use_pack" 507063 [fn _ => fmt_expanded_name name];
		val _ = check_pack_complete pack;
		val {vc_vars, consts_types, formal_procs, informal_procs, informal_funs, formal_funs, obj_renamings,
			zmod, decl, ...} = pack;
		val newidl = new_ids pack;
		fun prefix_id ident n = trans_id (ident dot n);
		fun do_id id = (trans_id id, Value (prefix_id zn id));
		val new_subs = map do_id newidl;
		val block1 = block 1
			handle Fail _ => error "add_var_env" 507006 [];
		val block_name1 = #block_name(#declab block1);
		val bn1 = expanded_name block_name1;
		val package_opt = s_lookup bn1 (!pack_env);
		val zids_in_scope = (current_cn_env, []);
		val pfx_info = current_prefix_info 1;
		val private = test_flag #private_flag 1;
		val pfx_priv = (pfx_info, private);
		val block1' = block_renamings pfx_priv (block1, new_subs);
		val dict1' = #dict(#in_scope(#declab(block1')));
		val dict1'' = add_used_package dict1' zn;
		val block1'' = block_dict(block1', dict1'');
	in	map (check_new_z_id zids_in_scope) newidl;
		check_new_spark_ids current_cn_env newidl;
		blocks := block1'':: tl (!blocks);
		update_envs_renamings new_subs;
		update_envs_used_package zn;
		(if	test_flag #pack_spec_flag 1
		 then	case package_opt of
				Value (package as {local_dict, ...}) => (
					pack_env :=
					s_enter bn1
					(package_local_dict(
						package,
						add_used_package
						(dict_renamings (pfx_info, false) (local_dict, (new_subs, local_dict)))
						zn))
					(!pack_env)
			) |	_ => ()
		else	())
	end
end);
=TEX
=SML
fun ⦏use_clause⦎ (UCUse names : USE_CLAUSE) : unit = (
	map use_pack names; ()
) | use_clause _ = ();
=TEX
\section{STUBS AND SUBUNITS}\label{STUBSANDSUBUNITS}
\subsection{The SID function begin\_stub}
=SML
fun ⦏begin_stub⦎ (():unit) : unit = (
	let	val block1 = block 1;
	in	blocks :=  block_stub_flag (block1, true) :: tl (!blocks)
	end	handle Fail _ => error "begin_stub" 507006 []
);
=TEX
\subsection{The SID function end\_stub}
=SML
fun ⦏end_stub⦎ (():unit) : unit = (
	let	val block1 = block 1;
	in	blocks :=  block_stub_flag (block1, false) :: tl (!blocks)
	end	handle Fail _ => error "end_stub" 507006 []
);
=TEX
\subsection{The SID function new\_scope\_subunit}
=SML
fun ⦏new_scope_subunit⦎ (ident : ID list) : unit = (
	let	val flags = {
			pack_spec_flag = false,
			pack_body_flag = false,
			stub_flag = false,
			subunit_flag = true,
			formal_body_flag = false,
			fun_flag = false,
			declabel_flag = false,
			speclabel_flag = false,
			till_flag = false,
			body_flag = true,
			private_flag = false
		};
		val block = block_block_name(
			block_flags(empty_block, flags),
			map Value ident);
	in	blocks := new_scope_common Nil (block :: !blocks)
	end
);
=TEX
\subsection{The SID function pack\_stub}
=SML
=TEX
=SML
fun ⦏pack_stub⦎ (ident : EXPANDED_NAME) : unit = (
	let	val block1 = block 1;
		val block_name1 = #block_name (#declab block1);
		val id1 = block_name1;
		val zn = trans_expanded_name ident;
		val id1_ident = subunit_env_index id1 zn;
		val subunit = {
			in_scope	=	flatten_env(!blocks),
			specif		=	dummy_spec,
			specif_flag	=	false,
			zmod		=	id1_ident,
			globs		=	[]
		};
	in	make_module 507026 id1_ident (id1_ident ^ context_tag);
		subunit_env := s_enter id1_ident subunit (!subunit_env)
	end
);
=TEX
\section{WEB CLAUSES}\label{WEBCLAUSES}
=TEX
\subsection{THE SID function new\_scope\_dec\_replace}
In the following, those fields for the new block which are left undefined in the Z specification are borrowed from the empty block value.
=SML
fun ⦏new_scope_dec_replace⦎ ({label, decls} : REPLACED_BY_DECL) : unit = (
	case s_lookup label (!dec_env) of
		Value declab => (
			let	val block = {
		declab = declab_declabel_flag (declab, true),
		current_formal_proc = #current_formal_proc empty_block,
		current_formal_fun = #current_formal_fun empty_block,
		current_for_vars = #current_for_vars empty_block,
		current_log_cons = #current_log_cons empty_block,
		current_loop_name = #current_loop_name empty_block,
		dec_lab = label,
		spec_lab = #spec_lab empty_block,
		till = #till empty_block,
		var_inits = #var_inits empty_block};
			in	blocks := new_scope_common Nil (block :: !blocks);
				dec_env := s_delete label (!dec_env)
			end
	) |	Nil => fail "new_scope_dec_replace" 507002
			[fn () => label]
);
=TEX
\subsection{THE SID function update\_envs\_remove\_declabel}
In the following, the local function, $do1\_subunit$ does the work specified in the Z spec for one unit-name-subunit-name pair.
=SML
fun ⦏update_subunit_env_remove_declabel⦎
		({label, decls} : REPLACED_BY_DECL) : unit = (
	let	fun do1_subunit
			((id1_id2,
				s as {in_scope as {dec_labels, ...}, ...})
					: string * SUBUNIT) = (
			(id1_id2,
			subunit_dec_labels(s, dec_labels less label))
		);
	in	subunit_env := map do1_subunit (!subunit_env)
	end
);
=TEX
In the following, the local function, $do1\_dec\_label$ does the work specified in the Z spec for one dec label.
=SML
fun ⦏update_dec_env_remove_declabel⦎ ({label, decls} : REPLACED_BY_DECL) : unit = (
	let	fun do1_dec_label
			((dec_label,
				s as {in_scope as {dec_labels, ...}, ...})
					: string * DECLAB) = (
			(dec_label,
			declab_dec_labels(s, dec_labels less label))
		);
	in	dec_env := map do1_dec_label (!dec_env)
	end
);
=TEX
In the following, the local function, $do1\_spec\_label$ does the work specified in the Z spec for one spec label.
=SML
fun ⦏update_spec_env_remove_declabel⦎ ({label, decls} : REPLACED_BY_DECL) : unit = (
	let	fun do1_spec_label
			((spec_label,
				s as {in_scope as {dec_labels, ...}, ...})
					: string * SPECLAB) = (
			(spec_label,
			speclab_dec_labels(s, dec_labels less label))
		);
	in	spec_env := map do1_spec_label (!spec_env)
	end
);
=TEX
=SML
fun ⦏update_envs_remove_declabel⦎ (label_decls : REPLACED_BY_DECL) : unit = (
	update_subunit_env_remove_declabel label_decls;
	update_dec_env_remove_declabel label_decls;
	update_spec_env_remove_declabel label_decls
);
=TEX
\subsection{THE SID function new\_scope\_speclabel}
In this one, the use of {\em new\_scope\_common} is for future-proofing.
There won't be anything in {\em blocks}.
=SML
fun ⦏new_scope_speclabel⦎ (label : LABEL) : unit = (
	let	val spec_env_lab = force_value( s_lookup label (!spec_env) )
			handle Fail _ => fail "new_scope_speclabel" 507003
				[fn () => label];
		val till_flag = #till_flag spec_env_lab;
		val till = #till (#wp_env (spec_env_lab));
		val block_name = #block_name spec_env_lab;
		val flags = {
			pack_spec_flag = false,
			pack_body_flag = false,
			stub_flag = false,
			subunit_flag = false,
			formal_body_flag = false,
			fun_flag = false,
			declabel_flag = false,
			speclabel_flag = true,
			till_flag = till_flag,
			body_flag = true,
			private_flag = false
		};
		val block1 =
		block_block_name(
			block_till(
				block_spec_lab(
					block_flags(block_in_scope
						(empty_block, #in_scope spec_env_lab), flags),
				label),
			till),
			block_name);
	in	blocks := new_scope_common Nil (block1 :: !blocks)
	end
);
=TEX
\subsection{THE SID function vcs\_speclabel}
All the work of this SID function is done in {\it vcs\_speclabel\_aux} (see above).
=SML
val ⦏vcs_speclabel⦎ : REFINED_BY -> SPEC = vcs_speclabel_aux false;
=TEX
\subsection{THE SID function end\_scope\_speclabel}
=SML
fun ⦏end_scope_speclabel⦎ (():unit) : unit = (
	let	val label = #spec_lab(block 1);
	in	end_scope();
		spec_env := s_delete label (!spec_env)
	end
);
=TEX
\subsection{THE SID functions new\_scope\_stmtlabel and end\_scope\_stmt\_label}
=SML
val ⦏new_scope_stmt_label⦎: LABEL -> unit = new_scope_speclabel;
val ⦏end_scope_stmt_label⦎: unit -> unit = end_scope_speclabel;
=TEX
\section{SPARK PROGRAM ENVIRONMENT}
\subsection{The SID Function update\_replacement\_env}
=IGNORE
The error reporting here could usefully be made more sophisticated.
(By checking that $repl$ and the replacement environment entry are of the same sort.)
=SML
fun ⦏update_replacement_env⦎ ((label, repl) : LABEL * REPLACEMENT) : unit = (
	let	val sn =
			case s_lookup label (!repl_env) of
				Value{scope_name = sn, repl = UnReplaced _} => sn
			|	Value _ => fail "update_replacement_env" 507004 [fn () => label]
			|	Nil => fail "update_replacement_env" 507003 [fn () => label];
		val sr = {scope_name = sn, repl = repl}
	in	repl_env := s_enter label sr (!repl_env)
	end
);
=TEX
=SML
fun ⦏update_spark_prog⦎ (comp : KSLOT_COMPILATION_UNIT list) : unit = (
	spark_prog := !spark_prog @ comp
);
=TEX
=SML
fun ⦏new_k_slot⦎ (label : LABEL, sort : REPL_SORT) : unit = (
	let	val {declab = {block_name, ...}, ...} = block 1;
		val sr = {scope_name = block_name,
			repl = UnReplaced (sort, get_current_theory_name())};
	in	(repl_env := s_extend label sr (!repl_env))
		handle Fail _ =>
		fail "new_k_slot" 507005 [fn () => label]
	end
);
=TEX
\section{INVOKING THE SID FUNCTIONS}
=TEX
=SML
fun ⦏undot⦎ (name : string) : string list = (
	let	fun aux acc [] = rev(map (implode o rev) acc)
		|   aux acc ("." :: more) = aux ([]::acc) more
		|   aux acc ("o" :: more) = aux ([]::acc) more
		|   aux [] (ch :: more) = aux [[ch]] more
		|   aux (x::xs) (ch::more) = aux ((ch::x) :: xs) more;
	in	aux [] (explode name)
	end
);
=TEX
=SML
fun ⦏check_label_theory⦎ (lab : string) : unit = (
	let	fun subprog_name acc [] = implode(rev acc)
		|   subprog_name acc ("o"::more) = subprog_name ("."::acc) more
		|   subprog_name acc ("'"::_) = subprog_name acc []
		|   subprog_name acc (c::more) = subprog_name (c::acc) more;
	in	case s_lookup lab (!repl_env) of
		Value{repl = UnReplaced(_, thy), ...} => (
			if	get_current_theory_name() = thy
			then	()
			else	fail "check_label_theory" 507144
				[fn() => lab, fn() => subprog_name [] (explode thy)]
		) |	_ => ()
	end
);
=TEX
Except where an annotation occurs as a statement or a declaration, we need to record the k-slots in an annotation in the replacement environment:
=SML
fun ⦏do_annotation⦎ (anns : ANNOTATION) : unit = (
	let	fun do_ann (ANString _) = ()
		|   do_ann (ANKSlot {content, label}) = (
			new_k_slot(label, RSAnnotation)
		);
	in	map (check_fail () do_ann) anns; ()
	end
);
=TEX
{\it expand\_names} looks for schema names appearing in frames
or procedures global dependency lists and expands them
into the corresponding list of signature variables.
=SML
fun expand_names (ns : Z_ID list) : Z_ID list = (
	let	fun aux n = (
			((map fst o dest_z_schema_type o dest_z_power_type o
				force_value o get_const_type) (hol_const_name n))
			handle Fail _ => [n]
		);
	in	flat (map aux ns)
	end
);
=TEX
When the frame is expanded, {\it expand\_frame}
uses {\it expand\_names} to make the frame {\it w}
and the list {\it w0} of initial variables.
It is applied to any {\it SPEC} before passing it into the SID functions.
=SML
fun ⦏expand_frame⦎ ({w, w0, pre, post} : SPEC) : SPEC = (
	let	val new_w = expand_names w;
	in	add_init_vars_spec {w = new_w, w0 = [], pre = pre, post = post}
	end
);
=TEX
The following functions look
after the passage from {\it SI\_BASIC\_DECL}s to {\it BASIC\_DECL}s
in a using declaration.
=SML
=TEX
=SML
fun ⦏extract_vardecls⦎ ((bd::more) : BASIC_DECL list) : VAR_DECL list = (
	case bd of
		BDVarDecl vd => vd::extract_vardecls more
	|	BDVarDeclInit (vd, init) => vd::extract_vardecls more
	|	_ => extract_vardecls more
) | extract_vardecls _ = [];
=TEX
The following has to allow for the way the universal discrete type as a special (which will get prefixed with the package name).
=SML
fun ⦏check_adjust_basic_decls⦎ (bds : SI_BASIC_DECL list) : BASIC_DECL list = (
	let	val pfx_info as {canon, ...} = find_pack_spec_prefix_info();
		fun check1 (SIPragma _) = (
			cn_soundness_warning "check_adjust_basic_decls" 507018 []
		)  | check1 _ = ();
	in	map check1 bds;
		adjust_basic_decls (current_cn_env, canon) bds
	end
);
=TEX
=SML
fun ⦏adjust_using_dec⦎ ({aux, basic_decls, invariant} : SI_USING_DEC)
	: USING_DEC = (
	let	val basic_decls' = check_adjust_basic_decls basic_decls;
	in	{aux = aux,
		 concrete_vars = extract_vardecls basic_decls',
		 basic_decls = basic_decls',
		 invariant = invariant}
	end
);
=TEX
The following function does the common processing for the various sorts of for loop
in the abstract syntax.
It returns the inner statement of the loop (with frames expanded).
=SML
fun ⦏do_for_loop⦎ (t : Z_TM OPT, i : ID, stmt : STATEMENT,
			tmark : TMARK OPT, dir : LOOP_DIRECTION, loop_name : LOOP_OR_BLOCK_NAME)
		: STATEMENT = (
	new_scope_loop loop_name;
	for_param (i, case tmark of Value t => t | _ => universal_discrete_type);
	(case t of Value till => till_pred till | Nil => ());
	let val res = check_fail (STNull SNImplicit) do_statement stmt; in end_scope(); res end
)
(*
=TEX
The following reflects the SID functions for $statement$ (see also $loop\_statement$ and $loop\_parameter\_specification$.

To have the same order of invocation of the SID functions for for- and while- loop statements as in the specification, it is necessary to ``expand in line'' the processing for their constituent loops.

Note that the parser is not expected to produce the {\it SSpecIvars}, {\it SProcIvars} or {\it SForNonStatic} alternatives, since it cannot carry out the necessary analysis of free variables.
It uses the no-initial-variables or static forms to carry the information
on, since these forms are adequately general.
The $STATEMENT$ alternatives are produced where necessary in the VC generator.
=SML
*)
and ⦏do_statement⦎ (y as (STNull _) : STATEMENT) : STATEMENT = (y
) | do_statement (y as (STAssign x) : STATEMENT) = (y
) | do_statement (y as (STSpecNoIvars {spec, label, is_assertion}) : STATEMENT) = (
	if	not is_assertion
	then	let	val expanded = {spec = expand_frame spec, label = label};
			val _ = new_k_slot (label, RSSpecStatement);
			val spec' = spec_stmt expanded;
		in	STSpecNoIvars {spec = spec', label = label, is_assertion = false}
		end
	else	if	test_flag #formal_body_flag 1
		orelse	test_flag #speclabel_flag 1
		then	y
		else	fail "do_statement" 507077 []
) | do_statement (y as (STSemicolon (x1, x2)) : STATEMENT) = (
	let	val expanded1 = check_fail (STNull SNImplicit) do_statement x1;
		val expanded2 =  check_fail (STNull SNImplicit) do_statement x2;
	in	STSemicolon(expanded1, expanded2)
	end
) | do_statement (y as (STIfThenElse {p, q, g, elsif}) : STATEMENT) = (
	let	val expanded_p = check_fail (STNull SNImplicit)  do_statement p;
		val expanded_q =  check_fail (STNull SNImplicit) do_statement q;
	in	STIfThenElse {p = expanded_p, q = expanded_q, g = g, elsif = elsif}
	end
) | do_statement (y as (STCase {s, others, e}) : STATEMENT) = (
	let	fun expand_s {choices, p} = {choices = choices, p =  check_fail (STNull SNImplicit) do_statement p};
		val expanded_s = map expand_s s;
		val expanded_others =  check_fail (STNull SNImplicit) do_statement others;
	in	STCase{s = expanded_s, others = expanded_others, e = e}
	end
) | do_statement (y as (STLoop {loop = {t, stmt}, name}) : STATEMENT) = (
	new_scope_loop name;
	(case t of Value till => till_pred till | Nil => ());
	let	val expanded_stmt = check_fail (STNull SNImplicit)  do_statement stmt;
	in	end_scope();
		STLoop{loop = {t = t, stmt = expanded_stmt}, name = name}
	end
) | do_statement (y as (STWhile {loop as {t, stmt}, name, g}) : STATEMENT) = (
	new_scope_loop name;
	(case t of Value till => till_pred till | Nil => ());
	let	val expanded_stmt =  check_fail (STNull SNImplicit) do_statement stmt;
	in	end_scope();
		STWhile{loop = {t = t, stmt = expanded_stmt}, name = name, g = g}
	end
) | do_statement
	(y as (STForStatic {name, i, tmark, range, dir, loop as {stmt, t}}) : STATEMENT) = (
	let	val expanded_stmt = do_for_loop(t, i, stmt, tmark, dir, name);
	in	STForStatic {name = name, i = i, tmark = tmark, range = range, dir = dir,
			loop= {stmt=expanded_stmt, t = t}}
	end
) | do_statement
	(y as (STForTmark {name, i, tmark, dir, loop as {stmt, t}}) : STATEMENT) = (
	let	val expanded_stmt = do_for_loop(t, i, stmt, Value tmark, dir, name);
	in	STForTmark {name = name, i = i, tmark = tmark, dir = dir,
			loop= {stmt=expanded_stmt, t = t}}
	end
) | do_statement
	(y as STLabelled {label, statement} : STATEMENT) = (
	STLabelled{label = label, statement = do_statement statement}
) | do_statement (y as (STExitWhen x) : STATEMENT) = (y
) | do_statement (y as (STExit x): STATEMENT) = (y
) | do_statement (y as (STRet x) : STATEMENT)  = (y
) | do_statement (y as (STGoto x) : STATEMENT)  = (y
) | do_statement (y as (STProcNoIvars x) : STATEMENT) = (y
) | do_statement (y as (STKSlot {label, content}) : STATEMENT) = (
	new_k_slot(label, RSStatement);
	k_slot_stmt label;
	y
) | do_statement (y as (STPragma _) : STATEMENT) = (
	cn_soundness_warning "do_statement" 507018 [];
	y
) | do_statement (y as (STAnnotation _) : STATEMENT) = (y
) | do_statement (y as (SSpecIvars x) : STATEMENT) = (
	error "do_statement" 507019 []
) | do_statement (y as (SForNonStatic x) : STATEMENT) = (
	error "do_statement" 507019 []
) | do_statement (y as (SLogCon (log_con as {defs, spec, pre1, label})) : STATEMENT) = (
	let	val expanded_spec = expand_frame spec;
		val _ = new_k_slot(label, RSSpecStatement);
		val _ = add_log_con_env defs;
		val spec' = spec_stmt {spec = expanded_spec, label = label};
		val _ = remove_log_con_env();
	in	SLogCon {defs = defs, spec = spec', pre1 = pre1, label = label}
	end
) | do_statement (y as (SProcIvars x) : STATEMENT) = (
	error "do_statement" 507019 []
) | do_statement (SBlockStatement {declarative_part = dp, statement = s, name}) = (
	let	val old_cur_thy = get_current_theory_name();
		val _ = new_scope_block name;
		val res = SBlockStatement{
			declarative_part = Nil,
			statement = check_fail (STNull SNImplicit) do_statement s,
			name = name};
		val _ =	case dp of
			Nil => (
			()
		) |	Value decs => (
			comment "do_statement" 507089 []
		(* NOT: map do_declaration decs; *)
		);
		val _ = open_theory old_cur_thy;
		val _ = end_scope();
	in	res
	end
)
(*
=TEX
The following processes a single {\it BASIC\_DECL}.
=SML
*)
and ⦏do_basic_declaration⦎ (x : BASIC_DECL) : unit = (
	diag_basic_decl_list := x :: !diag_basic_decl_list;
	case x of
		BDTypeDecl _ => (basic_declaration x
	) |	BDSubtypeDecl _ => (basic_declaration x
	) |	BDConstDecl _ => (basic_declaration x
	) |	BDVarDecl v => (
			var_pack_spec v;
			update_envs_var v;
			add_var_env v
	) |	BDVarDeclInit (v, e) => (
			var_pack_spec v;
			update_envs_var v;
			add_var_init_env (v, e);
			add_var_env (v)
	) |	BDDeferredConstDecl _ =>
			(comment "do_declaration" 507021 []
	) |	BDPrivateTypeDecl _ => (basic_declaration x
	) |	BDPragma _ => (
			cn_soundness_warning "do_basic_declaration" 507018 []
	) |	BDAnnotation _ => (
			cn_soundness_warning "do_basic_declaration" 507017 []
	)
)
(*
=TEX
The following reflects the SID functions for $dec$, $basic\_declaration$, $renaming\_declaration$, $subprogram\_declaration$ and {\it pack\_stub}.
Note that the $with\_context$ is an argument used for package declarations so that when the package theories are created, the $with$ packages can become parents.

=SML
*)
and ⦏do_declaration⦎ (y as (DDeclarationKSlot (
	{label, content}, dkty)) : DECLARATION) = (
	let	val rsty = case dkty of
					DKDeclaration => RSDeclaration
				|	DKPrivate => RSPrivatePart
				|	DKVisible => RSVisiblePart;
		val ident = trans_id label;
	in	(case s_lookup ident (!pack_env) of
			Value _ => ( pack_stub (undot ident)
		) |	Nil => ());
		new_k_slot(ident, rsty);
		k_slot_dec ident;
		update_envs_k_slot ident
	end
) | do_declaration (y as (DRenamingDeclaration x) : DECLARATION) = (
	case x of
		RDSubprogram
		(y as {subprogram_specification = SSProcedure _, ...}) => (
				renames_proc y
	) |	RDSubprogram
		(y as {subprogram_specification = SSFunction _, ...}) => (
				renames_fun y
	) |	RDOpsym {new_name = Nil, ...} =>  (
		()  (* check on symbols made in parser *)
	) |	RDOpsym y => (
				renames_opsym y
	) |	RDObject y => (
				renames_object y
	) |	RDPackage (y as {old_name, new_name}) => (
			renames_pack (old_name, new_name)
	)
) | do_declaration (y as (DBasicDecl x) : DECLARATION) = (
	map (check_fail () do_basic_declaration) (check_adjust_basic_decls [x]); ()
) | do_declaration (y as (DRepresentationClause x) : DECLARATION) = (
	cn_soundness_warning "do_declaration" 507017 []
) | do_declaration (y as (DUseClause x) : DECLARATION) = (
	use_clause x
) | do_declaration (y as (DProperBody x) : DECLARATION) = (
	do_proper_body x
) | do_declaration (y as (DProcedureDeclaration {spec = x, implicit = implicit}) : DECLARATION) = (
	do_procedure_spec implicit x;
	end_scope()
) | do_declaration (y as (DFunctionDeclaration {spec = x, implicit = implicit}) : DECLARATION) = (
	let	val (spec, globals, inffun) =
			do_function_spec implicit x;
		val _ = end_scope();
		val pfx_info = current_prefix_info 1;
		val private = test_flag #private_flag 1;
		val pfx_priv = (pfx_info, private);
	in	add_fun_env pfx_priv spec Nil globals inffun;
		update_envs_fun pfx_priv spec Nil globals inffun
	end
) | do_declaration (y as (DPackageDeclaration x) : DECLARATION) = (
	do_package_spec x
) | do_declaration (y as (DProcedureStub x) : DECLARATION) = (
	do_procedure_stub x
) | do_declaration (y as (DFunctionStub x) : DECLARATION) = (
	do_function_stub x
) | do_declaration (y as (DPackageStub x) : DECLARATION) = (
	do_package_stub x
) | do_declaration (y as (DExternalProcedureStub x) : DECLARATION) = (
	do_external_procedure_stub x
) | do_declaration (y as (DExternalFunctionStub x) : DECLARATION) = (
	do_external_function_stub x
) | do_declaration (y as (DAuxiliary x) : DECLARATION) = (
	aux_var x
) | do_declaration (y as (DUsing x) : DECLARATION) = (
	let	val z as {basic_decls, ...} = adjust_using_dec x;
	in	map (check_fail () do_basic_declaration) basic_decls;
		using_dec z
	end
)
(*
=TEX
The following reflects the SID functions for $procedure\_specification$.
Primarily to improve error behaviour in the presence of renamings or use clauses
whcih clash with parameters, we make sure to call {\it fformal\_part}
before expanding the frame.
We call {\em curr\_form\_proc} twice: the first call is so that the formal procedure can be typechecked, the second call overwrites the current formal procedure in the environment with the typechecked one.
=SML
*)
and ⦏do_procedure_spec⦎ (implicit : bool) (
	proc_spec as {name, formal_part, globals, spec as Value sp, annotation, ...}
		: PROCEDURE_SPECIFICATION) = (
	subunit_form name;
	new_scope_proc_form name;
	do_annotation annotation;
	stub();
	fformal_part formal_part;
	let	val esp = expand_frame sp;
		val egs = expand_names globals;
		val par_names_defs = get_par_names_defs formal_part;
		val formal_proc : FORMAL_PROC =
		{name=name, spec=esp, globals = egs,
		 formal_ids = map mk_param_spec formal_part,
		 par_names_defs = par_names_defs};
		val _ = 	curr_form_proc formal_proc;
		val formal_proc1 = check_formal_proc formal_proc;
		val gpno = Value {
			globals = egs,
			pars = map fst par_names_defs,
			name = name};
	in	curr_form_proc formal_proc1;
		check_19 current_cn_env gpno esp;
		form_proc implicit formal_proc1;
		stub_spec_proc formal_proc1
	end
) | ⦏do_procedure_spec⦎ (implicit : bool) (
	{name, formal_part, spec as Nil, annotation, globals} : PROCEDURE_SPECIFICATION) = (
	check_not_implicit implicit;
	subunit_inf name;
	new_scope_proc_inf name;
	fformal_part formal_part;
	do_annotation annotation;
	stub();
	inf_proc name
)
(*
=TEX
The following reflects the SID functions for $function\_specification$.
As for procedures, we make sure to call {\it fformal\_part} before expanding the frame.
We do not expand schema names in the global dependency lists, since such a schema name
represent a single component of the first parameter of the Z translation of the function.
=SML
*)
and ⦏do_function_spec⦎ (implicit : bool) (
	func_spec as {designator, return, formal_part,
		spec = speco as Value sp, annotation, globals, ...}
			: FUNCTION_SPECIFICATION)
	: (SPEC OPT * Z_ID list * INFORMAL_FUN) = (
	subunit_form designator;
	new_scope_fun_form designator;
	do_annotation annotation;
	stub();
	fformal_part formal_part;
	let	val par_names_defs = get_par_names_defs formal_part;
		val informal_fun : INFORMAL_FUN =
		{name=designator,
		formal_pars = map mk_param_spec formal_part,
		par_names_defs = par_names_defs,
		return_type = curr_real_name return};
		val spec = expand_frame sp;
		val formal_fun : FORMAL_FUN =
		{spec = spec, informal_fun = informal_fun, globals = globals};
		val egs = expand_names globals;
		val gpno = Value {
			globals = egs,
			pars = map fst par_names_defs,
			name = designator};
	in	curr_form_fun formal_fun;
		stub_spec_fun formal_fun;
		check_19 current_cn_env gpno spec;
		form_fun implicit formal_fun;
		(speco, globals, informal_fun)
	end
) | ⦏do_function_spec⦎ (implicit : bool) (
	func_spec as {designator, return, formal_part, spec as Nil, annotation, ...}
			: FUNCTION_SPECIFICATION) = (
	let	val informal_fun : INFORMAL_FUN =
		{name=designator,
		formal_pars = map mk_param_spec formal_part,
		par_names_defs = snd(get_name_and_par_names_defs(SSFunction func_spec)),
		return_type = curr_real_name return};
	in	check_not_implicit implicit;
		subunit_inf designator;
		new_scope_fun_inf designator;
		do_annotation annotation;
		stub();
		fformal_part formal_part;
		inf_fun informal_fun;
		(Nil, [], informal_fun)
	end
)
(*
=TEX
The following reflects the SID functions for $package\_specification$:
=SML
*)
and ⦏do_package_spec⦎ (decl as {name, visible_decs, private_decs, annotation, ...}
			: DECLARATION PACKAGE_DECLARATION) = (
	new_scope_pack_spec name decl;
	do_annotation annotation;
	map (check_fail () do_declaration) visible_decs;
	private_part ();
	(case private_decs of
		Value pds =>  (map (check_fail () do_declaration) pds; ())
	|	Nil =>  ());
	end_scope();
	update_envs_pack_spec name
)
(*
=TEX
The following reflects the SID functions for $package\_body$:
=SML
*)
and ⦏do_procedure_stub⦎ (
	proc_spec as{name, ...}: PROCEDURE_SPECIFICATION) = (
	begin_stub();
	do_procedure_spec false proc_spec;
	update_envs_proc proc_spec;
	add_proc_env name;
	end_scope();
	end_stub()
)
and ⦏do_function_stub⦎ (
	fun_spec : FUNCTION_SPECIFICATION) = (
	begin_stub();
	let	val (spec, globals, inffun) =
			do_function_spec false fun_spec;
		val _ = end_scope();
		val pfx_info = current_prefix_info 1;
		val private = test_flag #private_flag 1;
		val pfx_priv = (pfx_info, private);
	in	add_fun_env pfx_priv spec Nil globals inffun;
		update_envs_fun pfx_priv spec Nil globals inffun
	end;
	end_stub()
)
and ⦏do_package_stub⦎ (name : EXPANDED_NAME) = (
	pack_stub name
)
(*
=TEX
The following reflects the agreed treatment of external procedure and function ``stubs''.
=SML
*)
and ⦏do_external_procedure_stub⦎ (
	{spec = proc_spec as {name, ...}, implicit = implicit} : PROCEDURE_DECLARATION) = (
	do_procedure_spec implicit proc_spec;
	add_proc_env name;
	update_envs_proc proc_spec;
	end_scope()
)
and ⦏do_external_function_stub⦎ (
	{spec = fun_spec, implicit = implicit} : FUNCTION_DECLARATION) = (
	let	val (spec, globals, inffun) =
			do_function_spec implicit fun_spec;
		val _ = end_scope();
		val pfx_info = current_prefix_info 1;
		val private = test_flag #private_flag 1;
		val pfx_priv = (pfx_info, private);
	in	add_fun_env pfx_priv spec Nil globals inffun;
		update_envs_fun pfx_priv spec Nil globals inffun
	end
)
(*
=TEX
The following reflects the SID functions for:

\begin{tabular}{c}
subprogram\_body\\
subprogram\_implementation\\
package\_body\\
\end{tabular}

=SML
*)
and ⦏do_proper_body⦎ (y as (PBProcedure
	{procedure_spec as {name,...}, declarative_part, statement, deferred, ...}) : PROPER_BODY)
	: unit = (
	do_procedure_spec false procedure_spec;
	add_proc_env name;
	let	val {old_cur_thy, subprog_thy, full_name} = subprogram_implementation {is_proc = true, deferred = deferred};
	in	map (check_fail () do_declaration) declarative_part;
		(if	not deferred
		then	vcs_body (check_fail (STNull SNImplicit) do_statement statement)
		else	(deferred_body do_statement (full_name, y)));
		update_envs_proc procedure_spec;
		end_scope();
		open_theory old_cur_thy;
		(if deferred then delete_theory subprog_thy else ())
	end
) | do_proper_body (y as (PBFunction
	{function_spec as {designator,...}, declarative_part, statement, deferred, ...}) : PROPER_BODY) = (
	let	val (spec, globals, inffun) =
			do_function_spec false function_spec;
		val {old_cur_thy, subprog_thy, full_name} = subprogram_implementation {is_proc = false, deferred = deferred};
	in
		map (check_fail () do_declaration) declarative_part;
		(if	not deferred
		then	vcs_body (check_fail (STNull SNImplicit) do_statement statement)
		else	(deferred_body do_statement (full_name, y)));
		end_scope();
		let	val pfx_info = current_prefix_info 1;
			val private = test_flag #private_flag 1;
			val pfx_priv = (pfx_info, private);
		in	add_fun_env pfx_priv spec Nil globals inffun;
			update_envs_fun pfx_priv spec Nil globals inffun
		end;
		open_theory old_cur_thy;
		(if deferred then delete_theory subprog_thy else ())
	end
) | do_proper_body (y as (PBPackage
	{name, decls, statement, annotation, ...}) : PROPER_BODY) = (
	new_scope_pack_body name;
	do_annotation annotation;
	map (check_fail () do_declaration) decls;
	(if any decls (fn d => case d of DUsing _ => true |_ => false)
	then	(vcs_aux_initial(check_fail (STNull SNImplicit) do_statement statement); ())
	else	(check_fail (STNull SNImplicit) do_statement statement; ()));
	end_scope()
);
=TEX
The following reflects the SID functions for $subunit$ (in its final clause).
=SML
fun ⦏do_compilation_unit⦎ (context : CONTEXT_ITEM list)
	(y as (CUPackageDeclaration {pack_decl = x as {name, ...}, ...}) : COMPILATION_UNIT)
	: unit = (
let	val zn = trans_expanded_name name;
in
	set_compilation_unit(compilation_unit_name y);
	(check_fail () do_declaration) (DPackageDeclaration x);
	(case s_lookup zn (!pack_env) of
		Value (pack as {decl = {references, comp_unit, annotation, ...}, ...}) =>
			let	val decl' = {
					context = context,
					references = references,
					comp_unit = comp_unit,
					annotation = annotation};
			in	pack_env := s_enter zn (package_decl (pack, decl')) (!pack_env)
			end
	|	NIl => ())
end
) | do_compilation_unit _ (y as (CUProperBody x)) = (
	(case x of
	PBProcedure _ => set_compilation_unit(compilation_unit_name y)
	| PBFunction _ => set_compilation_unit(compilation_unit_name y)
	| PBPackage _ => set_compilation_unit(compilation_unit_name y));
	(check_fail () do_declaration) (DProperBody x)
) | do_compilation_unit _ (y as (CUSubUnit {name, proper_body})) = (
	set_compilation_unit(compilation_unit_name y);
	new_parent_subunit_theory (name, proper_body);
	new_scope_subunit name;
	(check_fail () do_declaration) (DProperBody proper_body);
	end_scope()
);
=TEX
The following reflects the SID functions for the productions $compilation\_unit$ and $simple\_name\_list$ (occuring in a $with\_clause$). Note that the package specification theory and the package body theory are created when the package specification is processed and not when the $with$ or $references$ clause is encountered; i.e., $new\_scope\_with$ is called in those places.

Also note that a missing with clause package name only raises a comment,
whereas a references clause raises a failure.

The function returns the list of package names with any duplicates eliminated.
=SML
fun ⦏context_clause_check⦎
	(ancs : EXPANDED_NAME list)
	(ws : EXPANDED_NAME list)
	(rfs : EXPANDED_NAME list) : EXPANDED_NAME list = (
let	val chk_exists_r = map (fn w =>
	case s_lookup (trans_expanded_name w) (!pack_env) of
		Value _ => ()
	|	Nil => fail "context_clause_check" 507038
		[fn () => fmt_expanded_name w]) rfs;
	val chk_exists_w = map (fn w =>
	case s_lookup (trans_expanded_name w) (!pack_env) of
		Value _ => ()
	|	Nil => comment "context_clause_check" 507038
		[fn () => fmt_expanded_name w]) ws;
	fun aux acc (w::rest) = (
		if	w mem rest
		orelse	w mem ancs
		then	aux acc rest
		else	aux (w::acc) rest
	) | aux acc [] = acc;
in	aux [] (rev (ws @ rfs))
end);
=TEX
=SML
=TEX
=SML
fun ⦏do_context_compilation_unit⦎
	({context, references, comp_unit, annotation, ...}
		: CONTEXT_COMPILATION_UNIT) : unit = (
	let	fun get_withs_uses (wacc, uacc) [] =
			(flat (rev wacc), rev uacc)
		|   get_withs_uses (wacc, uacc) (CIWith ids::more) =
			get_withs_uses (ids::wacc, uacc) more
		|   get_withs_uses (wacc, uacc) (CIUse u::more) = (
			get_withs_uses (wacc, u::uacc) more
		) |   get_withs_uses accs (CIPragma _::more) = (
			cn_soundness_warning "do_context_compilation_unit" 507018 [];
			get_withs_uses accs more
		);
		fun get_pack_spec_withs_uses (comp_unit as CUProperBody(PBPackage {name , ...})) = (
			case s_lookup (trans_expanded_name name) (!pack_env) of
				Value {decl = {context, ...}, ...} =>  get_withs_uses ([], []) context
			|	Nil => ([], [])
		) | get_pack_spec_withs_uses _ = ([], []);
		val ancs = compilation_unit_ancestors comp_unit;
		fun filter_pack_spec_uses xs [] acc = rev acc
		|    filter_pack_spec_uses xs ((y as UCUse idl) :: more) acc = (
			let	fun unwanted id = any xs (fn UCUse idl' => id mem idl' orelse id mem ancs | _ => false);
			in	case idl drop unwanted of
				[] => filter_pack_spec_uses xs more acc
			|	some => filter_pack_spec_uses xs more (UCUse some :: acc)
			end
		)   | filter_pack_spec_uses xs ((y as UCUseType _) :: more) acc = (
			filter_pack_spec_uses xs more (y :: acc)
		);
		val (withed_packs1, use_clauses1) = get_withs_uses ([], []) context;
		val (withed_packs2, use_clauses2) = get_pack_spec_withs_uses comp_unit;
		val withed_packs3 = withed_packs2 cup withed_packs1;
		val use_clauses3 = filter_pack_spec_uses use_clauses1 use_clauses2 [] @ use_clauses1;
		val packs_to_with = context_clause_check ancs withed_packs3 references;
	in	map new_scope_with packs_to_with;
		map new_scope_ancestor ancs;
		map use_clause use_clauses3;
		do_annotation annotation;
		do_compilation_unit context comp_unit;
		end_scope_comp_unit()
	end
);
=TEX
The following reflects the need to register compilation k-slots .
=SML
fun ⦏do_kslot_compilation_unit⦎
	(y as (KCUKSlot {label, content}) : KSLOT_COMPILATION_UNIT) : unit = (
	set_bottom_block_name (kslot_compilation_unit_name y);
	new_k_slot (label, RSCompilation)
) | do_kslot_compilation_unit
	(y as (KCUUnit x) : KSLOT_COMPILATION_UNIT) = (
	set_bottom_block_name (kslot_compilation_unit_name y);
	do_context_compilation_unit x
) | do_kslot_compilation_unit
	(KCUPragma _ : KSLOT_COMPILATION_UNIT) = (
	cn_soundness_warning "do_kslot_compilation_unit" 507018 []
);
=TEX
The following checks whether a statement appearing in a refinement or replacement step
is a block statement and takes the appropriate actions.
=SML
fun ⦏do_refinement_rhs⦎
	(SBlockStatement {declarative_part = dp as Value decs, statement = s, name} : STATEMENT)
	: STATEMENT  = (
	let	val _ = new_scope_block name;
		val _ = map (check_fail () do_declaration) decs;
		val _ = update_spec_env_block();
		val st = SBlockStatement{
			declarative_part = dp,
		 	statement = check_fail (STNull SNImplicit) do_statement s,
			name  = name};
		val _ = end_scope();
	in	st
	end
) | ⦏do_refinement_rhs⦎ s = check_fail (STNull SNImplicit) do_statement s;
=TEX
The following reflects the SID functions for the production $web\_clause$.
(Note that we set up the label on the bottom block for possible use in generating VC names except in the first two cases, where the processing of the constituent k-slots or compilations units will do this.)
=SML
fun ⦏do_web_clause⦎ (y as (WCCompilation x) : WEB_CLAUSE) : unit = (
let	val current_theory = get_current_theory_name ();
in	update_spark_prog x;
	map (check_fail () do_kslot_compilation_unit) x;
	lazy_open_theory current_theory
end
) | do_web_clause (y as (WCReplacedByCompilation x) : WEB_CLAUSE) = (
let	val {label=label, comp=comp} = x;
in	case (s_lookup label (!repl_env), comp) of
		(Value {repl = UnReplaced _, ...}, _) => (
		let	val current_theory = get_current_theory_name ();
		in	check_label_theory label;
			update_replacement_env(label, ReplaceComp x);
			map (check_fail () do_kslot_compilation_unit) (#comp x);
			lazy_open_theory current_theory
		end
	) |	(Nil, [KCUUnit {comp_unit = CUProperBody (pb as PBPackage {name, ...}),
			context=[], references=[], ...}]) => (
		let	val zn = trans_expanded_name name;
		in
			case s_lookup zn (!repl_env) of
				Value {repl = UnReplaced _, ...} => (
					update_replacement_env
						(zn, ReplaceComp{label = zn, comp=comp});
					do_compilation_unit []
						(CUSubUnit {name=[label], proper_body=pb})
			) |	_ => (fail "do_web_clause" 507065 [fn _ => label])
		end
	) | _ => fail "do_web_clause" 507065 [fn _ => label]
end
) | do_web_clause (y as (WCReplacedByPrivatePart x) : WEB_CLAUSE) = (
let	val {label=label, private=private} = x;
	val current_theory = get_current_theory_name ();
in	check_label_theory label;
	update_replacement_env(label, ReplacePPart x);
	set_bottom_block_name label;
	new_scope_dec_replace
		((fn {label,private} => {label=label, decls=private}) x);
	map (check_fail () do_declaration) (#private x);
	update_envs_remove_declabel
		((fn {label,private} => {label=label, decls=private}) x);
	end_scope();
	lazy_open_theory current_theory
end
) | do_web_clause (y as (WCReplacedByVisiblePart x) : WEB_CLAUSE) = (
let	val {label=label,visible=visible} = x;
	val current_theory = get_current_theory_name ();
in	check_label_theory label;
	update_replacement_env(label, ReplaceVPart x);
	set_bottom_block_name label;
	new_scope_dec_replace
		((fn {label,visible} => {label=label, decls=visible}) x);
	map (check_fail () do_declaration) (#visible x);
	update_envs_remove_declabel
		((fn {label,visible} => {label=label, decls=visible}) x);
	end_scope();
	lazy_open_theory current_theory
end
) | do_web_clause (y as (WCReplacedByDecl x) : WEB_CLAUSE) = (
let	val {label=label,decls=decls} = x;
	val current_theory = get_current_theory_name ();
in	check_label_theory label;
	update_replacement_env(label, ReplaceDecl x);
	set_bottom_block_name label;
	new_scope_dec_replace x;
	map (check_fail () do_declaration) decls;
	update_envs_remove_declabel x;
	end_scope();
	lazy_open_theory current_theory
end
) | do_web_clause (y as (WCRefinedBy x) : WEB_CLAUSE) = (
let	val {label=label,statement=statement} = x;
	val current_theory = get_current_theory_name ();
in	check_label_theory label;
	set_bottom_block_name label;
	new_scope_speclabel label;
	let	val expanded_statement = do_refinement_rhs statement;
		val expanded_x = {label = label, statement = expanded_statement};
	in	update_replacement_env(label, RefineStat expanded_x);
		vcs_speclabel expanded_x
	end;
	end_scope_speclabel();
	lazy_open_theory current_theory
end
) | do_web_clause (y as (WCReplacedBy x) : WEB_CLAUSE) = (
let	val {label=label,statement=statement} = x;
	val current_theory = get_current_theory_name ();
in	cn_soundness_warning "do_web_clause" 507134 [];
	check_label_theory label;
	set_bottom_block_name label;
	new_scope_stmt_label label;
	let	val expanded_statement = do_refinement_rhs statement;
		val expanded_x = {label = label, statement = expanded_statement};
	in	update_replacement_env(label, ReplaceStat expanded_x)
	end;
	end_scope_stmt_label();
	lazy_open_theory current_theory
end
) | do_web_clause (y as (WCReplacedByArbitraryAda x) : WEB_CLAUSE) = (
let	val {label=label, ...} = x;
in	cn_soundness_warning "do_web_clause" 507039 [];
	update_replacement_env(label, ReplaceArbitrary x)
end
) | do_web_clause (y as (WCReplacedByAnnotation x) : WEB_CLAUSE) = (
let	val {label=label, replacement=ann} = x;
in	update_replacement_env(label, ReplaceAnnotation x);
	do_annotation ann
end
);
=TEX
\section{SYNTAX-CHECK-ONLY}
In this section we provide an adaptation of the {\it do\_XXX} functions of the previous section
to support the syntax-check-only mode. The adapted functions confine themselves
to the SID functions that deal with the replacement environment. No other SID functions
are called.
=SML
fun ⦏sco_statement⦎ (y as (STNull _) : STATEMENT) : unit = ( ()
) | sco_statement (y as (STAssign x) : STATEMENT) = ( ()
) | sco_statement (y as (STSpecNoIvars {spec, label, is_assertion}) : STATEMENT) = (
	new_k_slot(label, RSSpecStatement)
) | sco_statement (y as (STSemicolon (x1, x2)) : STATEMENT) = (
	sco_statement x1;
	sco_statement x2
) | sco_statement (y as (STIfThenElse {p, q, g, elsif}) : STATEMENT) = (
	sco_statement p;
	sco_statement q
) | sco_statement (y as (STCase {s, others, e}) : STATEMENT) = (
	map (sco_statement o #p) s;
	sco_statement others
) | sco_statement (y as (STLoop {loop = {t, stmt}, ...}) : STATEMENT) = (
	sco_statement stmt
) | sco_statement (y as (STWhile {loop as {t, stmt}, name, g}) : STATEMENT) = (
	sco_statement stmt
) | sco_statement
	(y as (STForStatic {name, i, tmark, range, dir, loop as {stmt, t}}) : STATEMENT) = (
	sco_statement stmt
) | sco_statement
	(y as (STForTmark {name, i, tmark, dir, loop as {stmt, t}}) : STATEMENT) = (
	sco_statement stmt
) | sco_statement
	(y as STLabelled {label, statement} : STATEMENT) = (
	sco_statement statement;
	()
) | sco_statement (y as (STExitWhen x) : STATEMENT) = ( ()
) | sco_statement (y as (STExit x): STATEMENT) = ( ()
) | sco_statement (y as (STRet x) : STATEMENT)  = ( ()
) | sco_statement (y as (STGoto x) : STATEMENT)  = ( ()
) | sco_statement (y as (STProcNoIvars x) : STATEMENT) = ( ()
) | sco_statement (y as (STKSlot {label, content}) : STATEMENT) = (
	new_k_slot(label, RSStatement)
) | sco_statement (y as (STPragma _) : STATEMENT) = ( ()
) | sco_statement (y as (STAnnotation _) : STATEMENT) = ( ()
) | sco_statement (y as (SSpecIvars x) : STATEMENT) = (
	error "sco_statement" 507019 []
) | sco_statement (y as (SForNonStatic x) : STATEMENT) = (
	error "sco_statement" 507019 []
) | sco_statement (y as (SLogCon (log_con as {defs, spec, pre1, label})) : STATEMENT) = (
	new_k_slot(label, RSSpecStatement)
) | sco_statement (y as (SProcIvars x) : STATEMENT) = (
	error "sco_statement" 507019 []
) | sco_statement (SBlockStatement {declarative_part = Nil, statement = s, name}) = (
	sco_statement s
) | sco_statement (SBlockStatement {declarative_part = dp as Value decs, statement = s, name}) = (
	map sco_declaration decs;
	sco_statement s
)
(*
=TEX
=SML
*)
and ⦏sco_declaration⦎ (y as (DDeclarationKSlot (
	{label, content}, dkty)) : DECLARATION) = (
	let	val rsty = case dkty of
					DKDeclaration => RSDeclaration
				|	DKPrivate => RSPrivatePart
				|	DKVisible => RSVisiblePart;
		val ident = trans_id label;
	in	new_k_slot(label, rsty)
	end
) | sco_declaration (y as (DProperBody x) : DECLARATION) = (
	sco_proper_body x
) | sco_declaration (y as (DPackageDeclaration x) : DECLARATION) = (
	sco_package_spec x
) | sco_declaration _ = ( ()
)
(*
=TEX
The following reflects the SID functions for $package\_specification$:
=SML
*)
and ⦏sco_package_spec⦎ (decl as {name, visible_decs, private_decs, annotation, ...}
			: DECLARATION PACKAGE_DECLARATION) = (
	map sco_declaration visible_decs;
	(case private_decs of
		Value pds => (map sco_declaration pds; ())
	|	Nil => ())
)
(*
=TEX
The following reflects the SID functions for $package\_body$:
=SML
*)
(*
=TEX
=SML
*)
and ⦏sco_proper_body⦎ (y as (PBProcedure
	{procedure_spec as {name,...}, declarative_part, statement, ...}) : PROPER_BODY)
	: unit = (
	map sco_declaration declarative_part;
	sco_statement statement
) | sco_proper_body (y as (PBFunction
	{function_spec as {designator,...}, declarative_part, statement, ...}) : PROPER_BODY) = (
	map sco_declaration declarative_part;
	sco_statement statement
) | sco_proper_body (y as (PBPackage
	{name, decls, statement, annotation, ...}) : PROPER_BODY) = (
	map sco_declaration decls;
	sco_statement statement
);
=TEX
=SML
fun ⦏sco_compilation_unit⦎
	(y as (CUPackageDeclaration {pack_decl = x as {name, ...}, ...}) : COMPILATION_UNIT)
	: unit = (
	sco_declaration (DPackageDeclaration x)
) | sco_compilation_unit (y as (CUProperBody x)) = (
	sco_declaration (DProperBody x)
) | sco_compilation_unit (y as (CUSubUnit {name, proper_body})) = (
	sco_declaration (DProperBody proper_body)
);
=TEX
=SML
fun ⦏sco_context_compilation_unit⦎
	({context, references, comp_unit, annotation, ...}
		: CONTEXT_COMPILATION_UNIT) : unit = (
	sco_compilation_unit comp_unit
);
=TEX
=SML
fun ⦏sco_kslot_compilation_unit⦎
	(y as (KCUKSlot {label, content}) : KSLOT_COMPILATION_UNIT) : unit = (
	new_k_slot (label, RSCompilation)
) | sco_kslot_compilation_unit
	(y as (KCUUnit x) : KSLOT_COMPILATION_UNIT) = (
	sco_context_compilation_unit x
) | sco_kslot_compilation_unit
	(KCUPragma _ : KSLOT_COMPILATION_UNIT) = ( ()
);
=TEX
=SML
fun ⦏sco_web_clause⦎ (y as (WCCompilation x) : WEB_CLAUSE) : unit = (
	update_spark_prog x;
	map sco_kslot_compilation_unit x; ()
) | sco_web_clause (y as (WCReplacedByCompilation x) : WEB_CLAUSE) = (
let	val {label=label, comp=comp} = x;
in	case (s_lookup label (!repl_env), comp) of
		(Value {repl = UnReplaced _, ...}, _) => (
			update_replacement_env(label, ReplaceComp x)
	) |	(Nil, [KCUUnit {comp_unit = CUProperBody (pb as PBPackage {name, ...}),
			context=[], references=[], ...}]) => (
		let	val str_name = trans_expanded_name name;
		in
			case s_lookup str_name (!repl_env) of
				Value {repl = UnReplaced _, ...} => (
					update_replacement_env
						(str_name, ReplaceComp{label = str_name, comp=comp});
					sco_compilation_unit
						(CUSubUnit {name=[label], proper_body=pb})
			) |	_ => (fail "sco_web_clause" 507065 [fn _ => label])
		end
	) | _ => fail "sco_web_clause" 507065 [fn _ => label]
end
) | sco_web_clause (y as (WCReplacedByPrivatePart x) : WEB_CLAUSE) = (
let	val {label=label, private=private} = x;
in	update_replacement_env(label, ReplacePPart x);
	map sco_declaration (#private x); ()
end
) | sco_web_clause (y as (WCReplacedByVisiblePart x) : WEB_CLAUSE) = (
let	val {label=label,visible=visible} = x;
in	update_replacement_env(label, ReplaceVPart x);
	map sco_declaration (#visible x); ()
end
) | sco_web_clause (y as (WCReplacedByDecl x) : WEB_CLAUSE) = (
let	val {label=label,decls=decls} = x;
in	update_replacement_env(label, ReplaceDecl x);
	map sco_declaration decls; ()
end
) | sco_web_clause (y as (WCRefinedBy x) : WEB_CLAUSE) = (
let	val {label=label,statement=statement} = x;
in	sco_statement statement;
	update_replacement_env(label, RefineStat x)
end
) | sco_web_clause (y as (WCReplacedBy x) : WEB_CLAUSE) = (
let	val {label=label,statement=statement} = x;
in	sco_statement statement;
	update_replacement_env(label, ReplaceStat x)
end
) | sco_web_clause (y as (WCReplacedByArbitraryAda x) : WEB_CLAUSE) = (
let	val {label=label, ...} = x;
in	update_replacement_env(label, ReplaceArbitrary x)
end
) | sco_web_clause (y as (WCReplacedByAnnotation x) : WEB_CLAUSE) = (
let	val {label=label, replacement=ann} = x;
in	update_replacement_env(label, ReplaceAnnotation x)
end
);
=TEX
\section{INTERFACE}
=TEX
=SML
fun ⦏open_scope⦎ (n: string) : unit = (
	let	val zn = trans_id (CaseIndependence.to_upper n);
	in	case e_lookup zn (!scope_env) of
			Value {theory, deferred, body_labels} => (
			if	deferred <> DSPendingIntroduction
			then	open_theory theory
				handle Fail _ =>
				fail "open_scope" 507145
				[fn()=>theory, fn()=>n]
			else	let	val cxt_thyn = zn ^ context_tag;
				val scope_entry = {theory = theory, deferred = DSIntroduced, body_labels = body_labels};
			in	(open_theory cxt_thyn
				handle Fail _ =>
				fail "open_scope" 507145
				[fn()=>cxt_thyn, fn()=>n]);
				(new_theory theory
					handle Fail _ => (
					fail "open_scope" 507139
					[fn()=>theory, fn()=>zn]
				));
				set_cn_theory ();
				scope_env :=
				e_enter zn scope_entry (!scope_env)
			end
		) |	Nil =>	fail "open_scope" 507146
				[fn()=>n]
	end
);
=TEX
=SML
fun ⦏split_scope_name⦎ (n : string) : ID OPT list = (
	let	val sz = size n;
		fun aux acc i = (
			if	i >= sz
			then	rev acc
			else case substring(n, i, 1) of
				"o" => aux (""::acc) (i+1)
			|	"'" => rev acc
			|	ch => aux ((hd acc ^ ch):: tl acc) (i+1)
		);
	in	map (fn "" => Nil | s => Value s) (aux [""] 0)
	end
);
=TEX
=SML
fun ⦏is_outer_scope⦎ (s1 : ID OPT list) (s2 : ID OPT list) : bool = (
	s1 = s2 to (length s1 - 1)
);
=TEX
=SML
fun ⦏delete_scope_from_pack_env⦎ (s : ID OPT list) : unit = (
	let	fun to_be_deleted (_, {zmod, ...} : PACKAGE) = (
			is_outer_scope s (split_scope_name zmod)
		);
	in	pack_env := !pack_env drop to_be_deleted
	end
);
=TEX
=SML
fun ⦏delete_scope_from_subunit_env⦎ (s : ID OPT list) : unit = (
	let	fun to_be_deleted (_, {zmod, ...} : SUBUNIT) = (
			is_outer_scope s (split_scope_name zmod)
		);
	in	subunit_env := !subunit_env drop to_be_deleted
	end
);
=TEX
=SML
fun ⦏delete_scope_from_dec_env⦎
	(restore : DECLAB S_DICT, s : ID OPT list) : unit = (
	let	fun to_be_deleted (lab, {block_name, ...} : DECLAB) = (
			any restore (fn (l, _) => l = lab) orelse
			is_outer_scope s block_name
		);
	in	dec_env :=
		s_merge restore (!dec_env drop to_be_deleted)
	end
);
=TEX
=SML
fun ⦏delete_scope_from_spec_env⦎
	((l, sl) : LABEL * SPECLAB, s : ID OPT list)
	: unit = (
	let	fun to_be_deleted (lab, {block_name, ...} : SPECLAB) = (
			is_outer_scope s block_name
		);
	in	spec_env :=
		s_enter l sl (!spec_env drop to_be_deleted)
	end
);
=TEX
=SML
fun ⦏delete_scope_from_repl_env⦎
	(dlabs : LABEL list, slab : LABEL)
	(s : ID OPT list) : unit = (
	let	fun to_be_deleted (l, {scope_name, ...} : SCOPED_REPLACEMENT) = (
			l = slab orelse l mem dlabs orelse
			is_outer_scope s scope_name
		);
		val restore = (slab, RSSpecStatement) ::
			map (fn dlab => (dlab, RSDeclaration)) dlabs;
	in	repl_env := !repl_env drop to_be_deleted;
		app new_k_slot restore
	end
);
=TEX
=SML
fun ⦏delete_scope_theories⦎ (zn : Z_ID)
		(s : ID OPT list) : unit = (
	let	val thys = get_script_theories (!script_name)
			less (zn ^ context_tag);
		fun aux thy = (
			if	is_outer_scope s (split_scope_name thy)
			then	force_delete_theory thy
				handle Fail _ => ()
			else	()
		);
	in	app aux thys
	end
);
=TEX
In the following note that the theory management is important to ensure that
the replacement environment entries are restored properly (the associated theory
has to be the theory for the deleted subprogram, which we then delete).
=SML
fun ⦏delete_deferred_subprogram⦎ (n: string) : unit = (
	let	val zn = trans_id (CaseIndependence.to_upper n);
		val s = split_scope_name zn;
		fun do_it (theory, bl as (des, se)) = (
		let	val parent = hd(get_parents theory)
			handle Fail _ => !script_name;
			val dls = map fst des;
			val sl = fst se;
		in	open_theory theory;
			delete_scope_from_pack_env s;
			delete_scope_from_subunit_env s;
			delete_scope_from_dec_env (des, s);
			delete_scope_from_spec_env (se, s);
			delete_scope_from_repl_env (dls, sl) s;
			scope_env := e_enter zn
				{theory = theory, deferred = DSPendingIntroduction,
					body_labels = Value bl} (!scope_env);
			delete_scope_theories zn s;
			open_theory parent
		end	handle ex as (Fail _) => comment "delete_deferred_subprogram" 507158 [fn () => n, fn _ => string_of_exn ex]);
	in	case e_lookup zn (!scope_env) of
			Value{theory, deferred = DSIntroduced, body_labels = Value bl} => (
			do_it (theory, bl)
		) |	Value{theory, deferred = DSIntroduced, body_labels = Nil} => (
			fail "delete_deferred_subprogram"
			507154 []
		) |	Value{theory, deferred = DSNotDeferred, body_labels = _} => (
			fail "delete_deferred_subprogram"
			507155 [fn () => n]
		) |	Value{theory, deferred = DSPendingIntroduction, body_labels = _} => (
			fail "delete_deferred_subprogram"
			507156 [fn () => n]
		) |	Nil => (
			fail "delete_deferred_subprogram"
			507146 [fn () => n]
		)
	end
);
=TEX
The following function is called from \cite{ISS/HAT/DAZ/IMP504} to classify a label.
=SML
fun ⦏classify_label⦎ (lab : string) : REPL_SORT OPT = (
	case s_lookup lab (!repl_env) of
		Value{repl = UnReplaced(rs, _), ...} => Value rs
	|	_ => (
			case (s_lookup (trans_id lab) (!pack_env)) of
				Value _ => Value RSCompilation
			|	Nil => Nil
	)
);
=TEX
=SML
fun ⦏get_replacement⦎ (lab : string) : REPLACEMENT OPT = (
	case s_lookup lab (!repl_env) of
		Value {repl = r, ...} => Value r
	|	Nil => Nil
);
=TEX
=SML
fun ⦏mk_thy_name⦎ (caller : string) (name : string, unit_type : string) : string = (
	let	val t = CaseIndependence.to_lower unit_type;
		val n = trans_id(CaseIndependence.to_upper name);
	in	if	not(t mem ["spec", "body", "proc", "func"])
		then	fail caller 507151 [fn() => unit_type]
		else	n ^ "'" ^ t
	end
);
=TEX
=SML
abstype ⦏CN_STATE⦎ =
	CNState of Z_GENERATOR_STATE *
	Z_GENERATOR_STATE E_DICT *
	CN_EXCEPTION_LOG
with
(*
=TEX
=SML
*)
(*
=TEX
It is now important not to save the state if an exception is raised.
The function {\em check\_fail} and this code communicate using the ref
variable {\em exception\_handled} so that this code can tidy up and restore
things if {\em check\_fail} has detected and then recovered from an error.
=SML
*)

	fun ⦏common_z_generator⦎ (sco : bool) (w : WEB_CLAUSE) : unit = (
		let	val save_zg_state = get_z_generator_state();
			val curr_thy = get_current_theory_name ();
			val pp_state = checkpoint "cn";
			val save_ti_cxt = e_get_ti_context();
			fun reset () = (
				diag_z_generator_state := get_z_generator_state();
				set_z_generator_state save_zg_state;
				e_set_ti_context save_ti_cxt;
				exception_handled := false;
				rollback1 pp_state;
				(lazy_open_theory curr_thy handle Fail _ => ())
			);
		in	diag_vc_args := [];
			diag_basic_decl_list := [];
			diag_web_clause := w;
			((if sco then sco_web_clause else do_web_clause) w)
			handle ex => (
				reset();
				log_exception ex;
				raise ex
			);
			(if	!exception_handled
			then	reset()
			else	());
			save_z_generator_state();
			e_set_ti_context save_ti_cxt
		end
	);

	fun ⦏cn_z_generator⦎ (w : WEB_CLAUSE) : unit = (
		common_z_generator false w
	);
	fun ⦏sco_z_generator⦎ (w : WEB_CLAUSE) : unit = (
		common_z_generator true w
	);
(*
=TEX
=SML
*)
	fun ⦏restart_cn_z_generator⦎ (():unit) : unit = (
		set_z_generator_state init_z_generator_state;
		exception_log := initial_s_dict;
		reset_cn_parser_state()
	);
(*
=TEX
The following initialisation function is called to set up the state when a new script is introduced.
This reflects the rules for initialising the environments stated informally at the end of
each section of chapter 3 of the specification.
=SML
*)
	fun ⦏init_cn_z_generator⦎
		(continue : bool)
		(script_name : string) : unit = (
		set_z_generator_state
		(if continue
		then	let	val {repl_env, spark_prog, ...} = get_z_generator_state();
			in	{	pack_env = !pack_env,
					subunit_env = !subunit_env,
					dec_env = dec_env0,
					spec_env = spec_env0,
					blocks = env0,
					repl_env = repl_env,
					scope_env = scope_env0,
					spark_prog = spark_prog,
					script_name = script_name,
					deletion_info = deletion_info0}
			end
		else	{	pack_env = !pack_env,
				subunit_env = !subunit_env,
				dec_env = dec_env0,
				spec_env = spec_env0,
				blocks = env0,
				repl_env = repl_env0,
				scope_env = scope_env0,
				spark_prog = spark_prog0,
				script_name = script_name,
				deletion_info = deletion_info0});
		save_z_generator_state();
		reset_cn_parser_state()
	);
(*
=TEX
{init\_cn\_z\_generator\_state} does the state-saving that one might have
expected to see in the following.
=SML
*)
(*
=TEX
Again, {init\_cn\_z\_generator\_state} does the state-saving that one might have
expected to see in the following.
=SML
*)
	fun ⦏do_new_script1⦎ (caller : string) (continue : bool)
		{	name : string, unit_type : string,
			library_theories : string list} : unit = (
		let	val thy_name = mk_thy_name caller (name, unit_type);
			val old_state = get_z_generator_state ();
			val old_state_db = !state_db;
			val old_exn_log = !exception_log;
			val thy = get_current_theory_name();
		in
		(	lazy_open_theory "cn";
			new_theory_aux [] thy_name;
			set_cn_theory();
			set_continuation_flag continue;
			CaseIndependence.reset_names ();
			init_cn_z_generator continue thy_name;
			(map (fn t => new_parent_aux false t
				handle (Fail m) =>
				fail "new_script1"
				507042 [fn ()=> t, fn () => get_message_text m])
				 library_theories);
			map add_library_theory library_theories;
			()
		) handle ex => (
			set_z_generator_state old_state;
			state_db := old_state_db;
			exception_log := old_exn_log;
			lazy_open_theory thy;
			reraise ex "new_script1"
			)
		end
	);
(*
=TEX
=SML
*)
	fun ⦏new_script⦎ {name : string, unit_type : string} : unit = (
	do_new_script1 "new_script" false
		{name = name, unit_type = unit_type, library_theories = []}
	);

	val ⦏new_script1⦎ :
		{name : string, unit_type : string, library_theories : string list} -> unit
		= do_new_script1 "new_script1" false;

	fun ⦏new_continuation_script⦎ {name : string, unit_type : string} : unit = (
	do_new_script1 "new_continuation_script" true
		{name = name, unit_type = unit_type, library_theories = []}
	);

	val ⦏new_continuation_script1⦎ :
		{name : string, unit_type : string, library_theories : string list} -> unit
		= do_new_script1 "new_continuation_script1" true;

	fun ⦏get_cn_state⦎ (() : unit) : CN_STATE = (
		CNState (get_z_generator_state(), !state_db, !exception_log)
	);

	fun ⦏set_cn_state⦎ (CNState (zg_state, st_db, exn_log) : CN_STATE) : unit = (
		set_z_generator_state zg_state;
		state_db := st_db;
		exception_log := exn_log;
		save_z_generator_state();
		(lazy_open_theory o #script_name) zg_state
			handle Fail _ => lazy_open_theory "cn"
	);

	fun ⦏get_saved_cn_state⦎ (script : string) : CN_STATE = (
		CNState (get_saved_z_generator_state script, !state_db, !exception_log)
		handle ex => reraise ex "get_saved_cn_state"
	);
(*
=TEX
We suppress pretty-printing of the type under Poly/ML.
=POLYML
*)
local
    fun pp _ _ (_: CN_STATE) = PolyML.PrettyString "?"
in
    val _ = PolyML.addPrettyPrinter pp
end;
(*
=SML
*)
end (* ... abstype *);
=TEX
The following returns the compilation unit (if any) associated with a given script.
In the case of a script containing the body of a nested package, this is correctly
given as the name of the containing compilation unit.
=SML
fun ⦏comp_unit_of_script⦎ (script : string) : COMPILATION_UNIT  OPT= (
	let	val {repl_env, spark_prog, ...} = get_saved_z_generator_state script;
		fun aux1 (KCUKSlot {label, ...}) = (
			case s_lookup label repl_env of
				Value{repl = ReplaceComp {comp = comp::_, ...}, ...} => aux1 comp
			|	_ => Nil
		) | aux1 (KCUUnit {comp_unit, ...}) = (
			Value  comp_unit
		) | aux1 (KCUPragma _) = Nil;
		fun aux2 [] = Nil
		|   aux2 (kcu :: more) = (
			case aux1 kcu of
				Nil => aux2 more
			|	value_n => value_n
		);
	in	aux2 spark_prog
	end	handle Fail _ => Nil
);
=TEX
GIven a compilation unit, the following function calculates the keys for the subunit
and package environments which need to be deleted if that compilation unit is being deleted.
=SML
fun ⦏subunits_and_packages_to_delete⦎ (cu : COMPILATION_UNIT) : ID list * ID list = (
	let	val cu_name = fst(compilation_unit_name cu);
		val name_elems = undot cu_name;
		val n_elems = length name_elems;
		fun is_pack name = (
			(force_value (s_lookup name (!pack_env)); true) handle Fail _ => false
		);
		fun do_sus accs [] = accs
		|   do_sus (accs as (sus, packs)) ((key, _)::more)  = (
			let	val key_elems = undot key;
				val accs' =
					if	key_elems to (n_elems - 1) = name_elems
					then	(
						key :: sus,
						case (key_elems from n_elems) of
							[n] => (
							if	is_pack n
							then	n::packs
							else	packs
						) | _ => packs
						)
					else	accs;
			in	do_sus accs' more
			end
		);
	in	case cu of
			CUPackageDeclaration _ => do_sus ([], [cu_name]) (!subunit_env)
		|	_ =>  do_sus ([], []) (!subunit_env)
	end
);
=TEX
Given a compiliation unit containing a package declaration, the following function finds the name of the
script if any containing the corresponding package body.  For convenience where this is used
the return value is a list of length 0 or 1.
=SML
fun ⦏package_body_script⦎ (cu : COMPILATION_UNIT) : ID list = (
	let	fun aux pack_name [] = []
		|     aux pack_name ((key, _) ::more) = (
			case comp_unit_of_script key of
				Value (cu' as (CUProperBody _) ) => (
					if	fst(compilation_unit_name cu') = pack_name
					then	[key]
					else	aux pack_name more
			) |	_ => aux pack_name more
		);
	in	case cu of
			CUPackageDeclaration _ => aux (fst(compilation_unit_name cu))
						(e_flatten (!state_db))
		|	_ =>  []
	end
);
=TEX
The following works out what needs to be deleted when a script is deleted. The quadruple returned
comprises the theory names, subunit environment keys and package environments keys that
need to be deleted.
=SML
fun ⦏delete_script_aux⦎ (script : string) : string list * string list * string list = (
	let	val cn_thys = get_descendants "cn" less "cn" drop (not o is_cn_theory);
		fun get_continuation_script_parents scr = (
			if	get_continuation_flag scr
			then	let	fun aux p = (
						case get_stub_script_name p of
							Value ss => [ss, p]
						|	_ => []
					);
				in	flat (map aux (get_parents scr))
				end
			else	[]
		);
		fun get_extras scr = (
		let	val subunit_thys = cn_thys drop (fn s => get_stub_script_name s <>  Value scr);
			val continue_thys = get_continuation_script_parents scr;
			val ((sus, packs), pack_body_scripts) =
				case comp_unit_of_script scr of
					Value cu =>  (subunits_and_packages_to_delete cu,
							package_body_script cu)
				|	_ => (([], []), []);
			val pack_thy_names = map (fn p =>  p ^ "spec") packs
					drop (fn n => not (n mem cn_thys));
			val desc_thys = get_descendants scr less scr;
		in	(pack_thy_names cup pack_body_scripts cup
				continue_thys cup subunit_thys cup desc_thys,
			(sus, packs))
		end);
		fun closure ts ss ps scrs = (
			let	val tsps = map get_extras scrs;
				val thys = flat (map fst tsps) diff ts;
				val sus = flat (map (fst o snd) tsps);
				val packs = flat(map (snd o snd) tsps);
			in	case thys of
					[] => (ts,sus cup ss, packs cup ps)
				|	_ => closure (thys @ ts) (sus cup ss) (packs cup ps) thys
			end
		);
	in	closure [script] [] [] [script]
	end	handle ex as (Fail _)  => reraise ex "delete_script"
);
=TEX
Caller of the following function must ensure that the current theory is not one of the
ones to be deleted.
=SML
fun ⦏delete_theories⦎ (thys : string list) : unit= (
	let	fun check thy = (
			case get_theory_status thy of
				TSNormal => (
					if	thy mem get_ancestors "-"
					then	fail "delete_script" 507093 [fn _ => thy]
					else	(map check (get_descendants thy less thy); ())
			) |	TSLocked => (
				fail "delete_script" 507090 [fn _ => thy]
			) |	_ => (
				fail "delete_script" 507094 [fn _ => thy]
			)
		);
		fun delete thy = (
			map delete (get_descendants thy less thy) handle Fail _ => [];
			(delete_theory thy handle Fail _ => ())
		);
	in	map check thys;
		map delete thys; ()
	end
);
=TEX
=SML
fun ⦏delete_script⦎ {name : string, unit_type : string} : unit = (
	let	val scr = mk_thy_name "delete_script" (name, unit_type);
		val saved_zg_state = get_z_generator_state();
	in let	val (thys, sus, packs) = delete_script_aux scr;
		fun restore_subunit_entry (k, x) = (
			subunit_env := s_enter k x (!subunit_env)
		);
		fun restore_subunit_env [] = ()
		|    restore_subunit_env (thy::more) = (
			(case e_lookup thy (!state_db) of
				Value {deletion_info, ...} =>  (
					map restore_subunit_entry deletion_info; ()
			) |	Nil => ());
			restore_subunit_env more
		);
		fun fmt_strs [] = "\n    " ^ "(none)"  ^ "\n"
		|   fmt_strs ss = "\n    " ^ format_list Combinators.I ss ", " ^ "\n";
		val scrs = Sort.sort Sort.string_order (thys drop
			(fn t => case e_lookup t (!state_db) of Value _ => false | _ => true));
		val other_thys = Sort.sort Sort.string_order (thys diff scrs);
		val sus = Sort.sort Sort.string_order sus;
		val packs = Sort.sort Sort.string_order packs;
	in	set_z_generator_state
		{	pack_env =  !pack_env drop (fn (k, _) => k mem packs),
			subunit_env = !subunit_env drop (fn (k, _) => k mem sus),
			dec_env = dec_env0,
			spec_env = spec_env0,
			blocks = env0,
			repl_env = repl_env0,
			scope_env = scope_env0,
			spark_prog = spark_prog0,
			script_name = !script_name,
			deletion_info = !deletion_info};
		restore_subunit_env thys;
		state_db := list_e_merge initial_e_dict
			(e_flatten (!state_db) drop (fn (k, _) => k mem scrs));
		map delete_exception_log scrs;
		lazy_open_theory "cn";
		delete_theories thys;
		comment "delete_script" 507091 [fn _ => scr];
		diag_line (get_error_message 507092 (map fmt_strs [scrs, other_thys, sus, packs]))
	end	handle ex => (
			set_z_generator_state saved_zg_state;
			reraise ex "delete_script"
		)
	end
);
=TEX
\section{EPILOGUE}
=SML
end (* of structure CNZGenerator *);
=TEX
\small
\twocolumn[\section{INDEX}]
\printindex
\end{document}
=IGN





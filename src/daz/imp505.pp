=IGN
********************************************************************************
imp505.doc: this file is part of the PPDaz system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% ℤ $Date: 2008/03/23 16:33:12 $ $Revision: 1.149 $ $RCSfile: imp505.doc,v $
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

\def\Title{Implementation: Verification Condition Generator}

\def\AbstractText{This is the implementation of the verification condition generator for the compliance tool.}

\def\Reference{ISS/HAT/DAZ/IMP505}

\def\Author{D.J. King,  R.D. Arthan}


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
%% LaTeX2e port: % pp -i zed505 -d zplay
%% LaTeX2e port: % pp_list -d zplay vc_gen >zed505.th.doc
%% LaTeX2e port: % doctex zed505 zed505.th
%% LaTeX2e port: % texdvi zed505
%% LaTeX2e port: % TQtemplate.tex
%% LaTeX2e port: \documentstyle[hol1,11pt,TQ]{article}
%% LaTeX2e port: \ftlinepenalty=9999
\def\Hide#1{}
\def\Bool{``$\it{:}bool\,$''}
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{DAZ PROJECT}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Implementation: Verification Condition Generator}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Verification Condition Generator}
%% LaTeX2e port: \TPPref{ISS/HAT/DAZ/IMP505}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.149 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{97/07/18%
%% LaTeX2e port: }}  %% Mandatory field (with sensible default)
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: %\TPPstatus{Informal}
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: %\TPPkeywords{HOL}
%% LaTeX2e port: %\TPPauthor{R.D.~Arthan & WIN01}  %% Mandatory field
%% LaTeX2e port: \TPPauthors{D.J.~King & WIN01\\R.D.~Arthan & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & HAT Team}
%% LaTeX2e port: \TPPabstract{This is the implementation of the verification condition generator for the compliance tool.}
%% LaTeX2e port: %\TPPabstractB{}
%% LaTeX2e port: %\TPPabstractC{}
%% LaTeX2e port: %\TPPabstractD{}
%% LaTeX2e port: %\TPPabstractE{}
%% LaTeX2e port: %\TPPabstractF{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port:       Library}}
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
\item[Issue 1.1 (1994/01/30)-1.28 (1994/12/14)] Initial Drafts.
\item[Issue 1.29 (1995/01/06)] Changed signature of $check\_new\_z\_id$.
\item[Issues 1.30 (1995/03/29)-1.34 (1995/04/04)] Fixes/palliatives for DRA bugs (batch 1) 8, 9, 10, 11, 19.
\item[Issue 1.35 (1995/04/05)] Palliative for bug 10 (batch 1)
\item[Issue 1.36 (1995/06/22)] Fixes for DRA bugs (batch 2) 1, 2.
\item[Issue 1.37 (1995/10/03)] Enhancements 1, 6 and 20 (annotations, pragmas and arbitrary replacements catered for).
\item[Issue 1.38 (1995/10/19)] New treatment of records.
\item[Issue 1.39 (1995/10/23)] Bug fixing (batch 2 bug 13).
\item[Issue 1.40 (1995/12/07)] Rationalised error reporting.
\item[Issue 1.41 (1995/12/12)] Fixed problem adjusting case selectors.
\item[Issue 1.42 (1995/12/14)] Update references.
\item[Issue 1.43 (1996/02/12)] Fixed DRA bug 12 (V0.6).
\item[Issue 1.44 (1996/02/13)] Fixed DRA bug 4 (V0.6).
\item[Issue 1.45 (1996/02/15)] Fixed DRA bug 2 (V0.6).
\item[Issue 1.46 (1996/03/29)] Fixed DRA bug 15 (V0.6).
\item[Issue 1.47 (1996/04/02)] Fixed \LaTeX{} error.
\item[Issue 1.48 (1996/07/17)] k-slots as annotations.
\item[Issue 1.49 (1997/04/21)] Fixing $analyse\_log\_con$.
\item[Issue 1.50 (1997/06/05)] Improved message 505063.
\item[Issue 1.51 (1997/07/07)] Improved use of substitutions and common  subterms.
\item[Issue 1.51 (1997/07/07)-1.54 (1997/07/24)] IUCT WP 4.
\item[Issue 1.55 (1997/08/04)] Check 1(a) now applies to procedure calls too.
\item[Issue 1.56 (1997/08/05)] Added new check 16.
\item[Issue 1.57 (1997/08/18)] Updated references.
\item[Issue 1.58 (1999/03/07)] Update for new INTEGER type.
\item[Issue 1.59 (2000/05/24)] Prototyping enhancement R5 --- Initial Variables in Conditionals.
\item[Issue 1.60 (2000/06/02)] Prototyping enhancement R3 --- Assignment to Record Components.
\item[Issue 1.61 (2000/06/14)-1.64 (2000/06/20)] Prototyping enhancement R2: Multiple Logical Constant Definitions.
\item[Issue 1.65 (2000/06/21)] Check on initial variables in pre-conditions added.
\item[Issue 1.66 (2000/10/17)] CTLE II enhancement R1/2 --- ``others'' in case statements.
\item[Issues 1.67 (2000/10/17), 1.68 (2000/10/17)] CTLE II enhancement R1/3 --- reverse loops.
\item[Issues 1.69 (2000/10/20)] CTLE II R1/5 --- range attributes as ranges.
\item[Issues 1.70 (2000/10/24)] CTLE II R1/9 --- SPARK 83 attributes.
\item[Issue 1.71 (2000/10/25)] CTLE II R1/9 --- SPARK 83 attributes.
\item[Issue 1.72 (2000/10/27)] CTLE II R1/11 --- nested packages.
\item[Issue 1.73 (2000/10/31)] Fixes to CTLE II R1/5 and R1/6.
\item[Issue 1.74 (2001/05/14)] Investigating performance problem.
\item[Issue 1.75 (2001/05/28)] Perfomance enhancement for type-checking of specification statements.
\item[Issue 1.76 (2001/07/06)] Added option to compactify pre- and post-conditions.
\item[Issues 1.77 (2001/11/07),1.78 (2001/11/07)] Enhancement R0003 --- record and array components as exported parameters.
\item[Issues 1.79 (2001/11/07)-1.82 (2001/11/07)] Fixed {\it var\_sig} and the use of {\it adjust\_exp} etc. in the anti-aliasing checks.
\item[Issue 1.83 (2001/11/10)] R0021: domain condition generation.
\item[Issue 1.84 (2001/11/26)] R0040: bug in treatment of type inference context in procedure calls.
\item[Issues 1.85 (2001/12/13),1.86 (2001/12/13)] Accommodated use of signature inclusion.
\item[Issue 1.87 (2002/01/28)] Fixed bug in treatment of expressions in for loops.
\item[Issue 1.88 (2002/01/29)--1.90 (2002/01/30)] Further fixes and R0044: checks on array ranges.
\item[Issue 1.91 (2002/01/30)] Fixed {\LaTeX} errors.
\item[Issues 1.92 (2002/02/13), 1.93 (2002/02/14)] Fixed bug in {\it proc\_call\_param}.
\item[Issue 1.94 (2002/03/13)] R0056: default parameter modes supported properly.
\item[Issue 1.95 (2002/03/19)] Fixing bug in type-checking during preprocessing of
procedure calls.
\item[Issue 1.96 (2002/03/21)] Fixing bug in check on case statement with omitted others part.
\item[Issue 1.97 (2002/05/02)] Spring 2002 enhancements: adjustments for syntax for interim release.
\item[Issue 1.98 (2002/05/06)] Spring 2002 enhancements: return and exit statements.
\item[Issue 1.99 (2002/05/07),1.100 (2002/05/08)] Spring 2002 enhancements: subprogram and object renaming.
\item[Issue 1.101 (2002/05/09),1.102 (2002/05/10)] Spring 2002 enhancements: package renaming.
\item[Issue 1.103 (2002/05/22)] Spring 2002 enhancements: VC derivations enquiries - adding information to sequents.
\item[Issue 1.104 (2002/05/23)] Fixed some slips in VC derivation code.
\item[Issue 1.105 (2002/05/27)] Fixed bug in check on statements that must come first in their sequence of statements.
\item[Issue 1.106 (2002/07/09)] Fixed bug in the anti-aliasing checks (which were applying {\it adjust\_exp} twice to
some expressions which is not appropriate in general).
\item[Issue 1.107 (2002/07/13)] R0054: reworked treatment of use clauses.
\item[Issue 1.108 (2002/07/15)] Moved {\it init\_var} to DTD508.
\item[Issue 1.109 (2002/07/24), 1.110 (2002/07/24)] R0079: assertions (allowed for new syntax).
\item[Issue 1.111 (2002/08/14)] Checks 1(a) and 19 now made for logical constant statements as well as
ordinary specification statements.
\item[Issue 1.112 (2002/08/15)] R0051: default parameters. Fixed bug in {\it proc\_call\_spec}.
\item[Issue 1.113 (2002/10/14)] Merged in changes for R0062.
More corrections to VC derivation code. Change names {\it Sequent\_Route} to
			{\it VC\_Route}, constructors PP-compatible e.g. {\it VRExitTillIntro}.
\item[Issue 1.114 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.115 (2002/10/17), 1.116 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.117 (2002/11/11)] Uniform treatment of block statements.
\item[Issues 1.118 (2002/12/05), 1.119 (2002/12/07)] Schema references in function $\Xi$-lists.
\item[Issue 1.120 (2003/06/18)] R0096: improved formatting of nothing statement form in web clauses
\item[Issue 1.121 (2003/07/18)] Fixed bug in error handling.
\item[Issues 1.122 (2004/02/04)-1.130 (2004/07/18)] Reform of the Environments.
\item[Issue 1.131 (2004/08/20)] Performance improvements in {|em z\_preds\_in\_callee\_cxt} and {\em param\_tmp\_name}.
\item[Issue 1.132 (2004/10/25)] Allowed for adjustment to representation of procedures in the environment.
\item[Issue 1.133 (2004/11/24)] Fixed unsoundness arising from use of initial values of out mode parameters.
\item[Issue 1.134 (2004/12/08)] Labelled statements are now supported formally and goto statements are supported informally.
\item[Issue 1.135 (2005/02/22)] Improved domain condition generation for for-loops following a suggestion of Alf Smith.
\item[Issue 1.136 (2005/02/26)] New treatment of initial variables in side-conditions.
\item[Issue 1.137 (2005/07/26)] New domain condition corresponding to (sub)type constraints in procedure call statements.
\item[Issue 1.138 (2005/07/29)] New domain conditions corresponding to (sub)type constraints in assignment statements and return statements.
\item[Issues 1.139 (2005/09/07),1.140 (2005/09/09)] Now use Z let-expressions.
\item[Issue 1.141 (2006/01/16)] Soundness checks now report out-of-scope variables nicely.
\item[Issue 1.142 (2006/04/07)] Under enhancement 117, names of Ada entities used in Z must now be in the canonical form.
Adjusted checks etc. accordingly.
\item[Issue 1.143 (2006/04/11)] Under enhancement 117, checks on use of names in Z are now given a uniform treatment.
\item[Issue 1.144 (2006/06/30)] Stopped {\em vcs} rebinding the name {\em wp}.
\item[Issue 1.145 (2006/09/18)] {\em check\_1\_b} now reports on return statements with values in procedures and return statements without values in functions.
\item[Issue 1.146 (2007/02/18)] Implemented new checks on global dependency lists.
\item[Issues 1.147 (2007/05/18), 1.148 (2007/05/21)] Allowed for rationalised abstract syntax for loops.
\item[Issue 1.149 (2008/03/23)] Child packages.
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
This document contains the implementation of the compliance tool verification condition generator. It is written in response to the detailed design to be found in \cite{ISS/HAT/DAZ/DTD505}.
\subsection{Introduction}
\subsection{Purpose and Background}
See \cite{ISS/HAT/DAZ/DTD505}.
\subsection{Possible Enhancements}
None.

\pagebreak

\section{THE STRUCTURE $CNVCGenerator$}
=SML
infix 3 ⊢;
infix 4 ⟹;
infix 5 cap;
=TEX
=SML
structure ⦏CNVCGenerator⦎ : CNVCGenerator = struct
	open CaseIndependence CNTypes1 CNTypes2 CNTypes CNBasicDeclsAndExprs
		ZUserInterfaceSupport ZGeneratedConstants TypeInference;
=TEX
\section{SUPPORTING FUNCTIONS}
In version 0.6 and onwards we follow the new policy of not attempting to recover when a construct cannot be handled formally.
The special exception $VCInformal$ and associated functions are therefore no longer required.
=TEX
The following functions are used to construct a type inference context for use when the specification statement of a procedure is type checked.
=SML
fun v_v0 (in_mode : bool) (ty : TYPE) (v : ID) : TERM list = (
		if	in_mode
		then	[mk_var(v, ty)]
		else	[mk_var(init_var v, ty), mk_var(v, ty)]
);
=TEX
=SML
fun ⦏ti_context_of_formal_ids⦎ (env : CN_ENV) ([] : PARAM_SPEC list)
		: TERM list = []
|  ti_context_of_formal_ids env ({var_decl as {vars, tmark}, mode} :: more) = (
	let	val ty = dest_z_power_type (type_of (zid env (trans_id tmark)))
			handle Fail _ => fail "vcs" 508051 [fn()=>tmark];
		val inmode = case mode of MSparkIn _ => true | _ => false;
	in	flat (map (v_v0 inmode ty) vars)
		@ ti_context_of_formal_ids env more
	end
);
=TEX
The following is exported as a convenience for use in the Z Generator.
=SML
fun ⦏ti_context_of_formal_proc⦎ (env : CN_ENV) ({formal_ids, ...} : FORMAL_PROC)
	: TERM list =  (
	ti_context_of_formal_ids env formal_ids
);
=TEX
The following are useful in forming error messages.
=SML
fun ⦏fmt_id⦎ (n : ID) : string = CaseIndependence.get_external_name n;
fun ⦏fmt_id_list⦎ ([] : ID list) = ""
  | fmt_id_list ([x] : ID list) = (fmt_id x)
  | fmt_id_list (x::xs: ID list) = (fmt_id x)^", "^(fmt_id_list xs);
=TEX
\section{STORAGE OF Z TERMS}
=TEX
First we introduce the new flag.
=SML
val ⦏cn_compactify_terms⦎ : bool ref = ref true;
val _ = new_flag
	{name = "cn_compactify_terms",
	control = cn_compactify_terms,
	check = fun_true,
	default = fun_true} handle Fail _ => ();
=TEX
Now we can define {\it z\_quote}:
=SML
val ⦏z_quote⦎ : TERM * Unification.EXTYPE OPT -> Z_TM = (fn (tm, ty_opt) =>
	ZTmQuotation(if !cn_compactify_terms then compact_term tm else tm, ty_opt)
);
=TEX
\pagebreak
\section{STRUCTURE OF VERIFICATION CONDITIONS}\label{VCSTRUCTURE}
\subsection{Sequents}
=SML
fun (h : Z_PRED list) ⊢ (c : Z_PRED) : SEQUENT = (h, c);

fun (h : Z_PRED) ⟹ (s : SEQUENT list) : SEQUENT list = (
	map (fn (h', c) => (h' term_grab h, c)) s
);
=TEX
=SML
fun ⦏add_hyps⦎ ([] : Z_PRED list, s : SEQUENT list) : SEQUENT list = s
|    add_hyps (h::more, s) = h ⟹ add_hyps (more, s);
=TEX
=SML
fun ⦏add_hyps_to_side⦎ (h : Z_PRED list, seqs : (SEQUENT * Z_ID list) list)
	: (SEQUENT * Z_ID list) list = (
	let	fun do1 (seq, w) = (hd(add_hyps (h, [seq])), w);
	in	map do1 seqs
	end
);
=TEX
=SML
fun ⦏add_domain_conds⦎ (env : CN_ENV)
	(zes : Z_EXP list, s : SEQUENT list) : SEQUENT list = (
	let	val zps = list_term_union (map (domain_conds env) zes);
	in	add_hyps (zps, s)
	end
);
=TEX
\subsubsection{Information on Sequent Provenance}
We have functions \textit{\slshape init\_sr}, \textit{\slshape cons\_sr},
  \textit{\slshape cons\_dec\_sr},
 \textit{\slshape cons\_srs}, \textit{\slshape cons\_dec\_srs}, \textit{\slshape extract\_routes}.

The constructors are nullary e.g.
=INLINEFT
vr_while_pre_intro
=TEX
\ or unary e.g.
=INLINEFT
vr_while_via
=TEX
\ in the \textit{\slshape VC\_Route} argument.

Supporting functions are: \textit{\slshape is\_route}, \textit{\slshape dest\_route},
  \textit{\slshape mk\_route}, \textit{\slshape extend\_path}, \textit{\slshape extend\_dec\_path}.

We use the type \textit{\slshape ROUTE} for the route information and form a \textit{\slshape Z\_PRED}
in order to include it in a sequent.

=SML
type ROUTE = TERM

val vc_route_set = ⓩVC_Route⌝

fun ⦏mk_route⦎ ( path : ROUTE ) : Z_PRED = mk_z_∈(path,vc_route_set)

fun ⦏is_route⦎  ( rpred : Z_PRED ) : bool =
	 case dest_term rpred of
            DApp(_, sr) =>  sr =$ vc_route_set
          | _ => false

fun ⦏dest_route⦎ ( rpred : Z_PRED ) : ROUTE = (
	let	val sr1  = fst(dest_app rpred);
	    	val sr2 = snd(dest_app sr1)   (* get first argument of curried eps *);
	in
		sr2
	end
);

fun ⦏extend_path⦎ ( constr : TERM ) ( p : ROUTE) : ROUTE = z_fun_call( constr, [p] )

fun ⦏extend_dec_path⦎ ( constr : TERM,  d : TERM list ) ( p : ROUTE ) : ROUTE =
	z_fun_call( constr,  rev(p::(rev d)) )
=SML


fun ⦏init_sr⦎ ( constr : ROUTE ) ( (h,c) : SEQUENT) : SEQUENT =
		(mk_route(constr)::h, c)

fun ⦏init_dec_sr⦎ ( constr : ROUTE, d : TERM list ) ( (h,c) : SEQUENT) : SEQUENT =
		(mk_route(z_fun_call(constr,d))::h, c)
=TEX
example:
=INLINEFT
init_sr vr_while_pre_intro s
=SML
fun ⦏cons_sr⦎  (constr : TERM ) ( (h,c) : SEQUENT ) : SEQUENT =
		( map (fn zp =>
			if is_route zp then mk_route(extend_path constr (dest_route zp))
			else zp
		      )  h,
		  c
);
=TEX
=SML
fun ⦏cons_dec_sr⦎  (constr : TERM, d : TERM list ) ( (h,c) : SEQUENT ) : SEQUENT =
		( map (fn zp =>
			if is_route zp then mk_route(extend_dec_path (constr,d) (dest_route zp))
			else zp
		      )  h,
		  c
);
=TEX
=SML
fun ⦏cons_srs⦎ (constr : TERM) ( hcs : SEQUENT list ) : SEQUENT list = (
	map (cons_sr constr) hcs
);
=TEX
=SML
fun ⦏cons_srs_side⦎ (constr : TERM) ( hcws : (SEQUENT * 'a) list )
	: (SEQUENT * 'a) list = (
	map (fn (hc, w) => (cons_sr constr hc, w)) hcws
);
=TEX
=SML
fun ⦏cons_dec_srs⦎ (constr_d : TERM * TERM list )
	( hcs : SEQUENT list ) : SEQUENT list = (
	map (cons_dec_sr constr_d) hcs
);
=TEX
=SML
fun ⦏cons_dec_srs_side⦎ (constr_d : TERM * TERM list )
	( hcws : (SEQUENT * 'a) list ) : (SEQUENT * 'a) list = (
	map (fn (hc, w) => (cons_dec_sr constr_d hc, w)) hcws
);
=TEX
=SML
fun ⦏extract_routes⦎  ( [] : SEQUENT list ) : (SEQUENT list * ROUTE OPT list) = ([],[])
|   extract_routes  ( hc :: hcs ) =
	let 	fun drop_get_routes ([],c) =  ( ([],c), Nil )
             	|   drop_get_routes (zp::zps,c) =
			let val ( (h,c), r ) = drop_get_routes(zps,c)
			in   	if is_route zp  then
					let val app_eps1 = fst(dest_app zp);
				    	    val rte = snd(dest_app app_eps1);
					in (  (h,c), Value rte )
					end
				else  ( (zp::h,c), r)
			end
	 	val ( seqs, routes ) = extract_routes hcs
		val (sequ, optrte) = drop_get_routes hc
	in	( sequ :: seqs, optrte :: routes )
	end


val vr_elsf_true =		ⓩVRElsfTrue⌝
val vr_elsf_false =		ⓩVRElsfFalse⌝

val vr_any =			ⓩ(VRAny _)⌝
val vr_null =			ⓩ(VRNull _)⌝
val vr_assign =			ⓩ(VRAssign _)⌝
val vr_spec_via =			ⓩ(VRSpecVia _)⌝
val vr_spec_to_side =		ⓩ(VRSpecToSide _)⌝
val vr_spec_pre_intro =		ⓩVRSpecPreIntro⌝
val vr_semi =			ⓩ(VRSemi _)⌝
val vr_end_semi =			ⓩ(VREndSemi _)⌝
val vr_if_then =			ⓩ(VRIfThen _)⌝
val vr_if_else =			ⓩ(VRIfElse _)⌝
val vr_end_if =			ⓩ(VREndIf _)⌝
val vr_case_branch =		ⓩ(VRCaseBranch _)⌝
val vr_case_others =		ⓩ(VRCaseOthers _)⌝
val vr_end_case =			ⓩ(VREndCase _)⌝
val vr_loop_undec_via =		ⓩ(VRLoopUndecVia _)⌝
val vr_loop_undec_pre_intro =	ⓩVRLoopUndecPreIntro⌝
val vr_loop_undec_pre_to_side =	ⓩVRLoopUndecPreToSide⌝
val vr_loop_undec_to_side =	ⓩ(VRLoopUndecToSide _)⌝
val vr_while_via =		ⓩ(VRWhileVia _)⌝
val vr_while_pre_intro =		ⓩVRWhilePreIntro⌝
val vr_while_wp_to_side =		ⓩ(VRWhileWPToSide _)⌝
val vr_while_to_side =		ⓩ(VRWhileToSide _)⌝
val vr_for_via =			ⓩ(VRForVia _)⌝
val vr_for_pre_intro =		ⓩVRForPreIntro⌝
val vr_for_pre_to_side =		ⓩVRForPreToSide⌝
val vr_for_to_side =		ⓩ(VRForToSide _)⌝
val vr_for_exit_to_side =		ⓩ(VRForExitToSide _)⌝
val vr_exit_till_intro =		ⓩVRExitTillIntro⌝
val vr_exit_via =			ⓩ(VRExitVia _)⌝
val vr_return_intro =		ⓩVRReturnIntro⌝
val vr_proc_call =		ⓩ(VRProcCall _)⌝
val vr_proc_call_end =		ⓩ(VRProcCallEnd _)⌝
val vr_proc_call_rng_intro =	ⓩVRProcCallRngIntro⌝
val vr_log_con_to_side =		ⓩ(VRLogConToSide _)⌝
val vr_log_con_pre_intro =		ⓩVRLogConPreIntro⌝
val vr_log_con_type_mem_intro =	ⓩVRLogConTypeMemIntro⌝
val vr_refinement_begin =		ⓩ(VRRefinementBegin _)⌝
val vr_refinement_intro =		ⓩVRRefinementIntro⌝
=TEX
\pagebreak
\section{Substitutions}
=TEX
First we introduce the new flag.
=SML
val ⦏cn_use_let_in_vcs⦎ : bool ref = ref false;
val _ = new_flag
	{name = "cn_use_let_in_vcs",
	control = cn_use_let_in_vcs,
	check = fun_true,
	default = fun_false} handle Fail _ => ();
=TEX
For convenience in coding, we introduce $list\_sub$, a general parallel substitution operator and use it to support the particular variants on substitution which are required.
=SML
fun ⦏list_sub⦎ ((p, xes) :Z_PRED * ((Z_ID * Z_EXP) list)) : Z_PRED = (
	if	!cn_use_let_in_vcs
	then	let	val fvs = frees p;
			fun not_wanted (x, e) = (
				let	val v = mk_var(x, type_of e);
				in	not (v term_mem fvs)
					orelse	v =$ e
				end
			);
			val defs = xes drop not_wanted;
		in	mk_z_let (defs, p)
		end
	else	let	fun mk_subs (x : Z_ID, e : Z_EXP) = (
				(e, mk_var(x, type_of e))
			);
			val isubs1 = (map mk_subs xes);
		val isubs2 = isubs1 drop (fn (a, b) => (a =$ b));
			val p' = var_subst isubs2 p;
			val back_to_z_conv = TRY_C(TOP_MAP_C (
				z_schema_pred_conv1 ORELSE_C
				z_θ_conv1 ORELSE_C
				z_dec_rename⋎s_conv));
		in	(snd o dest_eq o concl o back_to_z_conv) p'
		end
);
=TEX
=SML
fun ⦏sub⦎ ((p, x, e) :Z_PRED * Z_ID * Z_EXP) : Z_PRED = (
	list_sub(p, [(x, e)])
);
=TEX
=SML
fun ⦏subs_exp⦎ ((e, xs, ys) :Z_EXP * (Z_ID list) * (Z_ID list)) : Z_EXP = (
	let	val xys = combine xs ys;
		val ntys = map dest_var(frees e);
		fun s ((n, ty) :: more) (x, y) = (
			if	n = x
			then	(x, mk_var(y, ty)) :: s more (x, y)
			else	s more (x, y)
		) | s [] _ = [];
	in	list_sub(e, flat(map (s ntys) xys))
	end		
);
=TEX
=SML
fun ⦏subs_pred⦎ ((p, xs, ys) :Z_PRED * (Z_ID list) * (Z_ID list)) : Z_PRED = (
	subs_exp(p, xs, ys)
);
fun ⦏subseq⦎ ((seql, x, e) :SEQUENT list * Z_ID * Z_EXP) : SEQUENT list = (
	map (fn (H, c) => map (fn p => sub(p, x, e)) H ⊢ sub(c, x, e)) seql
);
=TEX
\pagebreak

\section{ABSTRACT SYNTAX OF SPARK STATEMENTS}\label{ASSPARK}

See \cite{ISS/HAT/DAZ/DTD502}.

\section{WEAKEST PRECONDITIONS}\label{WPS}
\subsection{Environments}\label{environments}
=TEX
\subsection{Other Preliminaries}\label{Preliminaries}
=TEX

\subsection{Null Statement}\label{wp-null}
=SML
fun ⦏null⦎ ({a, ...} : WP_PARS) : RESULT = (
	{wp = cons_srs vr_null a, side = [], modifies = []}
);
=TEX
\subsection{Assignment Statement}\label{wp-assignment}
=TEX
{\it z\_record\_update} has some tricky type instantiation
to do (the problem is that the order (and number) of the generic parameters
does not correspond one-to-one with the binding components, because
binding components that shared a type mark in the type declaration have just
one generic parameter).
=SML
fun ⦏z_record_update⦎ (ztmark : Z_ID, sel : ID, zpfx : Z_EXP, e : Z_EXP) : Z_EXP = (
	let	val fun_name = ztmark ^ "u" ^ sel;
		val ty = case get_const_type(ZTypesAndTermsSupport.bind_gvar_name fun_name) of
				Value t => t
			|	_ => fail "z_record_update" 505028 [];
		val (gty, rty) = dest_→_type ty;
		val us = map mk_u (dest_z_tuple_type gty);
		val fun_exp = mk_z_gvar(fun_name, rty, us);
		val arg_exp = mk_z_tuple[zpfx, e];
		val (arg_ty, res_ty) = case dest_z_tuple_type
					(dest_z_power_type (type_of fun_exp)) of
					[ty1, ty2] => (ty1, ty2)
				|	_ => fail "z_record_update" 505028 [];
		val ty_map = type_match (type_of arg_exp) arg_ty
				handle Fail _ => fail "z_record_update" 505028 [];
	in	mk_z_app(inst [] ty_map fun_exp, arg_exp)
	end
);
=TEX
The implementation of $simple\_assign$ works on an assignment where the expression on the rhs has already been converted to Z.
=SML
fun ⦏simple_assign⦎ ({wp_env={env,...}, a, ...} : WP_PARS)
		(x : ID) (ze : Z_EXP) : RESULT = (
	let	val zx = trans_id x;
		val orig = case env zx of
			Value{canon_name, ...} => canon_name
		|	_ => zx;
	in {	wp = add_domain_conds env ([ze], subseq(a, orig, ze)),
		side = [],
		modifies = [orig]	}
	end
);
=TEX
=SML
fun ⦏array_assign⦎ ({wp, a, wp_env as {env,...}} : WP_PARS)
			({prefix, index as EArrayAggPos{comps, tmark as Nil}} : EXP INDEXED_COMP) (ze : Z_EXP) : RESULT = (
let	val name' = prefix;
	val e' = (z_override
			(trans_exp env prefix, z_set
			   [z_maplet (z_tuple(map (trans_exp env) comps), ze)]));
in
	assign_rec {wp = wp, a = a, wp_env = wp_env} (name', e')
end
) | array_assign _ _ _ = (
	fail "array_assign" 508056 []
)
(*
=TEX
=SML
*)
and  ⦏record_assign⦎	({wp, a, wp_env as {env, ...}} : WP_PARS)
	({prefix, selector} : EXP SELECTED_COMP) (ze : Z_EXP) : RESULT = (
let	val zprefix = trans_exp env prefix;
	val side = dest_z_schema_type(type_of zprefix)
			handle Fail _ => fail "record_assign" 505027 [];
	val name' = prefix;
	val tmark = tmark_of_prefix env zprefix
			handle Fail _ => fail "record_assign" 505028 [];
	val ze' = z_record_update(tmark, selector, zprefix, ze);
in
	assign_rec {wp = wp, a = a, wp_env = wp_env} (name', ze')
end
)
(*
=TEX
=SML
*)
and ⦏assign_rec⦎ (wp_pars as {wp_env as {env, ...}, ...} : WP_PARS) ((name, ze) : EXP * Z_EXP)
			: RESULT = (
	case name of
	EId id => simple_assign wp_pars id ze
	|EIndexedComp ic => array_assign wp_pars ic ze
	|ESelectedComp sc => record_assign wp_pars sc ze
	|_ => fail "assign" 505029 []
);
=TEX
=SML
fun ⦏assign⦎ (wp_pars as {wp_env as {env, ...}, ...} : WP_PARS) ((name, ze) : EXP * Z_EXP)
			: RESULT = (
let	val tmark = tmark_of_prefix env(trans_exp env name);
	val ze1 =
		if	is_modular_type tmark
		then	trans_exp env
			(ETypeConversion
				{tmark = tmark,
				 exp = EAuxiliaryExp (z_quote(ze, Nil))})
		else	ze;
	val ze2 = slide_to_tmark env (ze1, tmark);
	val extra_dcs =
		if	get_domain_conds_control() = cn_no_domain_conds
		then	[]
		else	[z_mem(ze2, zid env (trans_id tmark))];
	val {wp = wp1, side = side1, modifies = modifies1} =
		assign_rec wp_pars (name, ze2);
in {	wp = add_hyps (extra_dcs, cons_srs vr_assign wp1),
	side = add_hyps_to_side (extra_dcs, cons_srs_side vr_any side1),
	modifies = modifies1	}
end
);
=TEX
\subsection{Specification Statement (No initial variables)}\label{wp-specification-no-ivars}
=SML
fun ⦏spec_no_ivars⦎ ({a, ...} : WP_PARS)
	(w : Z_ID list)
	((pre, post) : Z_EXP * Z_EXP)
			: RESULT = (
	let 	val wphd = [] ⊢ pre
		val side = map (fn s => (s, w)) (post ⟹ a)
	in {	wp = [ init_sr vr_spec_pre_intro wphd ],
		 side = cons_srs_side vr_spec_to_side side ,
		 modifies = w}
	end
);
=TEX
=SML
fun ⦏spec_no_ivars_empty⦎ ({a, ...} : WP_PARS) ((pre, post) : Z_EXP * Z_EXP)
			: RESULT = (
 {	wp = init_sr vr_spec_pre_intro  ([] ⊢ pre)::
		(cons_srs vr_spec_via  (post ⟹ a)),
	side = [],
	modifies = []	}
);
=TEX
=SML
fun ⦏spec_no_ivars_either⦎ (wp : WP_PARS) (w : Z_ID list) ((pre, post) : Z_EXP * Z_EXP)
		: RESULT = (
	if	w = []
	then	spec_no_ivars_empty wp (pre, post)
	else	spec_no_ivars wp w (pre, post)
);
=TEX
\subsection{Semicolon}\label{wp-semicolon}
=SML
fun ⦏semicolon⦎ ({wp, a, wp_env} : WP_PARS) ((p, q) : STATEMENT * STATEMENT)
			: RESULT = (
let	val {	wp = wp2,
		side = side2,
		modifies = modifies2} = wp (q, cons_srs vr_end_semi a, wp_env);
	val {	wp = wp1,
		side = side1,
		modifies = modifies1} = wp (p, wp2, wp_env);
	val side2' = map (fn (s, w) => (s, w cup modifies1)) side2;
in {	wp = cons_srs vr_semi  wp1,
	side = cons_srs_side vr_semi (side1 @ (cons_srs_side vr_any side2')),
	modifies = modifies1 cup modifies2	}
end
);
=TEX
=IGN
val (STSemicolon (p,q)) = exp;
val {wp = wp2, side = side2} = wp (SStmt q, a, wp_env);
val save_exp1 = exp;
val exp= q;
=TEX
\subsection{If Statement}\label{wp-if-then-else}
=SML
fun ⦏if_then_else⦎	({wp, a, wp_env as {env,...}} : WP_PARS)
			({g, p, q, elsif} : STATEMENT IF_THEN_ELSE) : RESULT = (
let	val sr_a = cons_srs vr_end_if a
	val {	wp = wp1,
		side = side1,
		modifies = modifies1} = wp (p, sr_a, wp_env);
	val {	wp = wp2,
		side = side2,
		modifies = modifies2} = wp (q, sr_a, wp_env);
         val sr_elsf = if elsif then vr_elsf_true else vr_elsf_false
	val sr_wp1 = cons_dec_srs (vr_if_then, [sr_elsf]) wp1
	val sr_wp2 = cons_dec_srs (vr_if_else, [sr_elsf]) wp2
	val ze = trans_exp env g;
	val wp = add_domain_conds env ([ze],
		(z_eq(ze, zid env "TRUE") ⟹ sr_wp1) @
		(z_eq(ze, zid env "FALSE") ⟹ sr_wp2));
	val sr_side1 = cons_dec_srs_side (vr_if_then,[sr_elsf]) side1
	val sr_side2 = cons_dec_srs_side (vr_if_else,[sr_elsf]) side2
	val side = sr_side1 @ sr_side2;
	val modifies = modifies1 cup modifies2;
in
	{wp = wp, side = side, modifies = modifies}
end
);
=TEX
\subsection{Case Statement}\label{wp-case}
=SML
fun ⦏adjust_choices⦎ (env : CN_ENV) (choices : CASE_CHOICE list) : CASE_CHOICE list = (
	case choices of
		[] => []
	|	(ch as CCCaseRange _)::rest => ch :: adjust_choices env rest
	|	(ch as CCCaseExp exp):: rest => (
			let	val n = name_to_tmark exp;
			in
				case env n of
					Value {info = EIEnvOtherType, ...} => (
			CCCaseRange(DRConstrained{range=RRange {
				lo=EAttribute {attribute_desig=ADAttrib "FIRST",prefix=exp},
				hi=EAttribute {attribute_desig=ADAttrib "LAST", prefix=exp}},
				tmark=n})
				) |	_ => CCCaseExp exp
			end :: adjust_choices env rest
	)
);
=TEX
=SML
fun ⦏trans_case_choices⦎ (env : CN_ENV) (in_choices : CASE_CHOICE list) : Z_EXP = (
let	val choices = adjust_choices env in_choices;
	val adjust_and_trans = (trans_exp env) o (adjust_exp env);
	fun aux_range (ch::rest) = (
		case ch of
		CCCaseRange (DRRange range) =>
			let	val {lo, hi} = dest_range range;
			in	z_rng(adjust_and_trans lo, adjust_and_trans hi)::aux_range rest
			end		
		|CCCaseRange (DRConstrained{range,...}) =>
			let	val {lo, hi} = dest_range range;
			in	z_rng(adjust_and_trans lo, adjust_and_trans hi)::aux_range rest
			end		
		|_ => aux_range rest
	) | aux_range _ = [];
	fun aux_singles (ch::rest) = (
		case ch of
		CCCaseExp exp =>
			adjust_and_trans exp::aux_singles rest
		|_ => aux_singles rest
	) | aux_singles _ = [];
	val zranges = aux_range choices;
	val zsingles = z_set (aux_singles choices);
in
	z_many_union(zranges @ [zsingles])
end
);
=TEX
=SML
fun ⦏case_base⦎ ({wp, a, wp_env as {env,...}} : WP_PARS) (e : EXP) (n : int)
			({choices, p} : STATEMENT CASE_ALTERNATIVE)
			 : RESULT * Z_EXP = (
let	val {	wp = wp1,
		side = side1,
		modifies = modifies1} = wp (p, a, wp_env);
	val ze = trans_exp env e;
	val zcs = trans_case_choices env choices;
	val sr_ops = (vr_case_branch, [mk_z_int (string_of_int n)] )
	val sr_wp1 = cons_dec_srs sr_ops wp1
	val sr_side1 =  cons_dec_srs_side sr_ops side1
	val wp' = z_elem (ze, zcs) ⟹ sr_wp1;
in 	({	wp = add_domain_conds env ([ze, zcs], wp'),
		side = sr_side1,
		modifies = modifies1}, zcs)
end
);
=TEX
{\it case\_step} expects to be called by {\it case\_others} and ignores
the ``others'' part.
=SML
fun ⦏case_step⦎ (pars as {wp, a, wp_env as {env,...}} : WP_PARS) (n : int)
		({e, s, others} : STATEMENT CASE) : RESULT * Z_EXP list = (
	case s of
	[] =>
		fail "case_step" 505030 []
	| [alt] =>
		let	val (res, ze) = case_base pars e n alt;
		in	(res, [ze])
		end
	| ({choices, p} :: s') =>
		let	val {wp = wp1, side = side1, modifies = modifies1} =
				wp (p, a, wp_env);
         		val sr_ops = (vr_case_branch, [mk_z_int (string_of_int n)] )
			val (sr_wp1, sr_side1) =
				(cons_dec_srs sr_ops wp1,
				 cons_dec_srs_side sr_ops side1)
			val ({wp = wp2, side = side2, modifies = modifies2}, rest) =
				case_step pars (n+1) {e=e, s=s', others=others};
			val ze = trans_exp env e;
			val zcs = trans_case_choices env choices;
			val wp3 = add_domain_conds env([ze, zcs],
				(z_elem (ze, zcs) ⟹ sr_wp1) @ wp2);
		in	({	wp = wp3 ,
				side = sr_side1 @ side2,
				modifies = modifies1 cup modifies2},
			 zcs :: rest)
		end
);
=TEX
Note that {\it case\_step} is recursive and does the full job for a case statement
without an others part.
{\it case\_others} then acts as the main entry point for case statements,
calling {\it case\_step} to do the non-others alternatives and then
handling the others part if present.

As agreed with QinetiQ, in the (unlikely) case where the others part is an explicit nothing statement,
we do not generate any VCs for the others part, since the program will not have an others part
and so, if it passes the compiler's checks on the exhaustive coverage of the case statement, the
VCs are guaranteed to be true. We do not attempt to suppress VC generation if the others
part comprises something like the sequential composition of two nothings (in general, it could
comprise a sequential compositioin of nothings and specifications statements that will later
be refined to nothings, but we cannot detect that case here).
=SML
fun ⦏case_others⦎ (pars as {wp, a, wp_env as {env,...}} : WP_PARS)
		(st as {e, others, ...} : STATEMENT CASE) : RESULT = (
	let	val a_in = cons_srs vr_end_case a
		val pars_in = {wp = wp, a = a_in, wp_env = wp_env}
		val (res as {wp = wp1, side = side1, modifies = modifies1}, exps)
			= case_step pars_in 1 st;
		val ze = trans_exp env e
	in	case others of
		(STNull SNImplicit) => res
	|	(STNull SNNothing) => res
	|	stmt =>
		let	val {	wp = wp2,
				side = side2,
				modifies = modifies2} = wp(others, a_in, wp_env);
			val wp2_g = (z_notelem(ze, z_many_union exps) ⟹ wp2);
			val sr_wp2_g = cons_srs vr_case_others wp2_g;
			val wp = wp1 @ sr_wp2_g;
                           val sr_side2 = cons_srs_side vr_case_others side2;
			val side = side1 @ sr_side2;
			val modifies = modifies1 cup modifies2;
		in {	wp = add_domain_conds env (ze::exps, wp),
			side = side,
			modifies = modifies}
		end
	end
);
=TEX

\subsection{Undecorated Loop}\label{wp-loop}
=SML
fun ⦏loop⦎ ({a, wp_env={env, ...}, ...} : WP_PARS) ({loop = {t, stmt}, ...} : STATEMENT LOOP)
			: RESULT = (
let	val (pre1, post1, w) = case stmt of
		STSpecNoIvars {spec={pre, post, w, ...}, ...} => (
			(z_predexp_of_z_tm env pre, z_predexp_of_z_tm env post, w)
		) |_ => fail "loop" 505022 [];
	val wp = [init_sr vr_loop_undec_pre_intro ([] ⊢ pre1)];
	val side_seqs = case t of
			Value till =>
			   [init_sr vr_loop_undec_pre_to_side ([post1] ⊢ pre1)] @
				(cons_srs vr_loop_undec_to_side
					((z_predexp_of_z_tm env till) ⟹ a))
			|Nil => [init_sr vr_loop_undec_pre_to_side ([post1] ⊢ pre1)];
	val side = map (fn s => (s, w)) side_seqs;
in
	{wp = wp, side = side, modifies = w}
end
);
=TEX
\subsection{While Loop}\label{wp-while-loop}
=SML
fun ⦏cn_while⦎	({a, wp_env={env, ...}, ...} : WP_PARS)
		({g, loop={t, stmt}, ...} : STATEMENT WHILE) : RESULT = (
let	val {w, pre, post, ...} = case stmt of
		STSpecNoIvars {spec, ...} => spec
		|_ => fail "loop" 505022 [];
	val pre1 = z_predexp_of_z_tm env pre;
	val post1 = z_predexp_of_z_tm env post;
	val ze = trans_exp env g;
         val pre_intro_seq = init_sr vr_while_pre_intro ([z_eq(ze, zid env "TRUE")] ⊢ pre1);
         val via_seqs = (z_eq(ze, zid env "FALSE") ⟹ a);
         val sr_via_seqs = cons_srs vr_while_via via_seqs
	val wp = add_domain_conds env([ze], pre_intro_seq :: sr_via_seqs );
         val wp_to_side = (post1 ⟹ wp);
	val sr_wp_to_side = cons_srs vr_while_wp_to_side wp_to_side;
	val till_part = case t of
			Value till => (z_predexp_of_z_tm env till) ⟹ a
					
			|Nil => [];
	val sr_till_part = cons_srs vr_while_to_side till_part;
	val side = map (fn s => (s, w)) (sr_wp_to_side @ sr_till_part);
in	{wp = wp, side = side, modifies = w}
end
);
=TEX
\subsection{For Loop (Static Bounds)}\label{wp-for-static}
=SML
fun ⦏for_static⦎ ({a, wp_env={env, ...}, ...} : WP_PARS)
	({i, tmark, range, dir, loop = {t, stmt}, ...} : STATEMENT FOR_STATIC) : RESULT = (
let	val adjust_and_trans = (trans_exp env) o (adjust_exp env);
	val {lo, hi} = dest_range range;
	val {pre, post, w, ...} = case stmt of
		STSpecNoIvars {spec, ...} => spec
		|_ => fail "for_static" 505022 [];
	val pre1 = z_predexp_of_z_tm env pre;
	val post1 = z_predexp_of_z_tm env post;
	val zi = trans_id i;
	val zlo = adjust_and_trans lo;
	val zhi = adjust_and_trans hi;
	val (zinitial, zfinal, zop) =
		if dir = LDForwards then (zlo, zhi, z_add) else (zhi, zlo, z_minus);
	val zleft = zid env zi;
	val zright = z_num one;
	val zid_zi = zid env zi;
	val zran = z_elem (zid_zi, z_rng (zlo, zhi));
	val z_bin_exp_theta = z_bin_exp (zleft, zop, zright);
	val pre_intro = [z_less_eq (zlo, zhi)] ⊢ sub(pre1, zi, zinitial);
	val sr_pre_intro = [init_sr vr_for_pre_intro pre_intro];
	val via = z_greater (zlo, zhi) ⟹ a;
	val sr_via = cons_srs vr_for_via via;
	val wp = add_domain_conds env ([zlo, zhi], sr_pre_intro @ sr_via );
	val till_part = case t of
			Value till => (
				zran ⟹ ((z_predexp_of_z_tm env till) ⟹ a)
			) | Nil => [];
         val sr_till_part = cons_srs vr_for_exit_to_side till_part;
	val go_round = [zran, z_noteq(zid_zi, zfinal), post1] ⊢
			sub(pre1, zi, z_bin_exp (zleft, zop, zright));
	val sr_go_round = [init_sr vr_for_pre_to_side  go_round];
	val dont_go = sub(post1, zi, zfinal) ⟹ a;
	val sr_dont_go = cons_srs vr_for_to_side dont_go;
	val side = map (fn s => (s, w))
			(add_domain_conds env ([zlo, zhi],
				sr_go_round @ sr_dont_go @ sr_till_part));
in	{wp = wp, side = side, modifies = w}
end
);
=TEX
\subsection{For Loop (Type Mark as Range)}\label{wp-for-tmark}
=SML
fun ⦏for_tmark⦎ ({a, wp_env={env, ...}, ...} : WP_PARS)
	({i, tmark, dir, loop = {t, stmt}, ...} : STATEMENT FOR_TMARK) : RESULT = (
let	val {pre, post, w, ...} = case stmt of
		STSpecNoIvars {spec, ...} => spec
		|_ => fail "for_tmark" 505022 [];
	val pre1 = z_predexp_of_z_tm env pre;
	val post1 = z_predexp_of_z_tm env post;
	val zi = trans_id i;
	val zlo = zid env (trans_id tmark ^^ zfst);
	val zhi = zid env (trans_id tmark ^^ zlst);
	val (zinitial, zfinal, zop) =
		if dir = LDForwards then (zlo, zhi, z_add) else (zhi, zlo, z_minus);
	val zleft = zid env zi;
	val zright = z_num one;
	val zran = z_elem (zid env zi, z_rng (zlo, zhi));
	val z_bin_exp_theta = z_bin_exp (zleft, zop, zright);
	val pre_intro = [z_less_eq (zlo, zhi)] ⊢ sub(pre1, zi, zinitial);
	val sr_pre_intro = [init_sr vr_for_pre_intro pre_intro];
	val via = z_greater (zlo, zhi) ⟹ a;
	val sr_via = cons_srs vr_for_via via;
 	val wp = sr_pre_intro @ sr_via;
	val till_part = case t of
			Value till => (
				(z_predexp_of_z_tm env till) ⟹ a
			) | Nil => [];
         val sr_till_part = cons_srs vr_for_to_side till_part;
	val go_round = [z_noteq(zid env zi, zfinal), post1] ⊢
			sub(pre1, zi, z_bin_exp (zleft, zop, zright));
	val sr_go_round = [init_sr vr_for_pre_to_side go_round];
	val dont_go = sub(post1, zi, zfinal) ⟹ a;
	val sr_dont_go = cons_srs vr_for_to_side dont_go;
	val side = map (fn s => (s, w)) (sr_go_round @ sr_dont_go @ sr_till_part);
in
	{wp = wp, side = side, modifies = w}
end
);
=TEX
\subsection{Exit Statement (with Condition)}\label{wp-exit-with-cond}
=SML
fun ⦏exit_when⦎ ({a, wp_env={till, env, ...}, ...} : WP_PARS)
		({g, n = Nil} : EXIT_WHEN)
			 : RESULT = (
let	val ze = trans_exp env g;
	val do_exit = ([z_eq(ze, zid env "TRUE")] ⊢ till);
	val sr_do_exit = [init_dec_sr (vr_exit_till_intro, [mk_z_string ""]) do_exit];
	val dont_exit = (z_eq(ze, zid env "FALSE") ⟹ a);
	val sr_dont_exit = cons_srs vr_exit_via dont_exit;
	val wp = add_domain_conds env ([ze], sr_do_exit @ sr_dont_exit);
in	{wp = wp, side = [], modifies = []}
end
) | exit_when ({a, wp_env={named_tills, env, ...}, ...})
	({g, n = Value name} : EXIT_WHEN) = (
let	val ze = trans_exp env g;
	val till = case s_lookup name named_tills of
		Value p => p
	|	Nil => fail "exit_when" 505069 [fn _ => name];
	val do_exit = ([z_eq(ze, zid env "TRUE")] ⊢ till);
	val sr_do_exit = [init_dec_sr (vr_exit_till_intro,  [mk_z_string name]) (do_exit)];
	val dont_exit = z_eq(ze, zid env "FALSE") ⟹ a;
	val sr_dont_exit = cons_srs vr_exit_via dont_exit;
	val wp = add_domain_conds env ([ze], sr_do_exit @ sr_dont_exit );
in	{wp = wp, side = [], modifies = []}
end
);
=TEX
\subsection{Exit}\label{wp-exit}
=SML
fun ⦏cn_exit⦎ ({wp_env={till, ...},...} : WP_PARS) ({n = Nil} : EXIT): RESULT = (
	{wp = [init_dec_sr (vr_exit_till_intro , [mk_z_string ""]) ([] ⊢ till)],
	 side = [], modifies = []}
) | cn_exit ({wp_env={named_tills, ...},...} : WP_PARS) ({n = Value name} : EXIT) = (
let	val till = case s_lookup name named_tills of
		Value p => p
	|	Nil => fail "exit_when" 505069 [fn _ => name]
in {	wp = [init_dec_sr(vr_exit_till_intro,[mk_z_string name]) ([] ⊢ till)],
	side = [],
	modifies = []	}
end
);
=TEX
\subsection{Return}\label{wp-return}
=TEX
$conv\_var\_decl$ is implemented in \cite{ISS/HAT/DAZ/IMP508}.
=SML
fun ⦏cn_return⦎ ({wp, a, wp_env= {env,
		fun_header={name, formal_pars, return_type, par_names_defs},
			return, ...}} : WP_PARS)
		({e = Value exp} : RETURN) : RESULT = (
let	val zfun = trans_fun_name env name;
	val var_decls = map (fn {var_decl, ...} => var_decl) formal_pars;
	val ids = flat (map (fn {vars, ...} => vars) var_decls);
	val zargs = map (fn id => zid env (trans_id id)) ids;
	val exp1 =
		if	is_modular_type return_type
		then	ETypeConversion{tmark = return_type, exp = exp}
		else	exp;
	val ze = slide_to_tmark env (trans_exp env exp1, return_type);
	val extra_dcs =
		if	get_domain_conds_control() = cn_no_domain_conds
		then	[]
		else	[z_mem(ze, zid env (trans_id return_type))];
	val do_return = [z_eq(z_fun_call(zfun, zargs), ze)] ⊢ return;
	val sr_do_return = [init_sr vr_return_intro do_return];
	val wp = add_hyps(extra_dcs, add_domain_conds env ([ze], sr_do_return ));
in	{wp = wp, side = [], modifies = []}
end
) | cn_return ({wp, a, wp_env= {env, return, ...}})
		({e = Nil} : RETURN) : RESULT = (
	{wp = [ init_sr vr_return_intro ([] ⊢ return) ], side = [], modifies = []}
);
=TEX
\subsection{Procedure Call (No Initial Variables in Spec)}\label{wp-proc-call-no-ivars}
We need a mechanism for generating the names for the new Z variables
that stand for record or array components as exported actual parameters.
The function {\it param\_tmp\_name} does this.
The function constructs a list of names to be avoided from the type inference context.
This relies on the function {\it call\_vcs} in \cite{ISS/HAT/DAZ/IMP507} which
always puts all variables (including auxiliary variables and logical constants)
that are in scope in the VCs being calculated into the type inference
context.
The new variables are themselves added to the type inference context to handle
the situation where several new variables are needed in one sequence of statements
(to enable the new variables to be added to the type inference context, the
appropriate type must be passed in).

To confirm this approach, note that: {\it store\_vcs} in \cite{ISS/HAT/DAZ/IMP507}
fails if any VC contains free variables; moreover {\it call\_vcs} sets up the
type inference context using the same {\it SPECLAB} that it passes to the
function {\it vcs} below, which in turn uses that {\it SPECLAB} to derive
the local declarations to be added when the universal closure of each VC
is formed; so every variable that can appear
in a VC and so might clash with a new variable name generated here
must be in the type inference context; also
\cite{ISS/HAT/DAZ/IMP507} arranges to type-check every post-condition
and this will ensuer that the new variable name cannot appear free in the
original sequent whose weakest pre-condition we are calculating.

=SML
val ⦏param_tmp_name_stem⦎ : Z_ID = "tmp_";
fun ⦏maybe_param_tmp_name⦎ (n : Z_ID) : bool = (
	let	val tmp_size = size param_tmp_name_stem;
	in	substring(n, 0, tmp_size) = param_tmp_name_stem handle _ => false
	end
);
fun ⦏param_tmp_name⦎ (ty : TYPE) : Z_ID = (
	let	val old_cxt = e_get_ti_context();
		fun find_next i = (
			let	val n = param_tmp_name_stem ^ string_of_int i;
			in	case e_lookup n old_cxt of
					Value _ => find_next (i+1)
				|	Nil => n
			end
		);
		val res = find_next 1;
		val new_cxt = e_enter res ty old_cxt;
		val _ = e_set_ti_context new_cxt;
	in	res
	end
);
=TEX
The work done for an individual parameter is sufficiently complicated to
merit a separate function.
This is passed the actual parameter expression together with the
all the information from the formal parameter specification for this parameter.
It returns two substitution lists: one to be applied to the pre-condition
and one to be applied to the post-condition.
It also returns, if necessary, a list of predicates giving
the domain conditions for the actual parameter and,
if this is a record or array component actual parameter being
exported, the membership constraint giving the declaration for
the new Z variable that represents the transformed parameter.
The actual parameter (i.e., after this transformation) is also returned so that caller can calculate the effective frame accurately.

The optional predicate is the VC that may be needed if an exported parameter
is being passed to a formal whose type is a constrained array subtype
and which therefore may be subject to sliding.
The control logic relies on the fact that a slid expression is not a variable
and so we will always end up in the exception handler in the case where a VC may be necessary.
In this case, if the parameter is an {\tt in} we can just use the (possibly) slid expression.
We therefore only have to test whether sliding has occurred in the handler in the
case of an exported parameter.

The final part of the return value gives the optional
assignment statement that gives the update to the actual parameter
to be considered as executed after the call.
=SML
fun ⦏proc_call_param⦎ (env : CN_ENV)
	(actual : EXP, formal : ID, tmark : TMARK, mode : MODE)
	: (Z_ID * Z_EXP) list * (Z_ID * Z_EXP) list * Z_PRED list * EXP * Z_PRED OPT * STATEMENT OPT = (
let	val	actual1 =
		case mode of
			MSparkIn _ => (
			if	is_modular_type tmark
			then	ETypeConversion{tmark = tmark, exp = actual}
			else	actual
		) |	_ => actual;
	val	ntm as (n, tm) = (trans_id formal, trans_exp env actual1);
	val	sl_tm = slide_to_tmark env (tm, tmark);
	val	cnstrnt = zid env (trans_id tmark);
	val	cnstrnt_dc =
			case mode of
				MSparkOut => []
			|	_ => (
				if	get_domain_conds_control() = cn_no_domain_conds
				then	[]
				else	[z_mem(sl_tm, cnstrnt)]
		);
	val	dcs = cnstrnt_dc @ domain_conds env tm;
in	let	val (v, ty) = dest_var sl_tm;
	in	([ntm], [ntm, (init_var n, mk_var(init_var v, ty))], dcs, actual1, Nil, Nil)
	end	handle Fail _ => (
			case mode of
				MSparkIn _ => ([(n, sl_tm)], [(n, sl_tm)], dcs, actual1, Nil, Nil)
			|	_ => (
				let	val (v, ty) = dest_var tm;
					val vc_opt = (
						case con_array_range_from_tmark cnstrnt of
							Nil => Nil
						|	Value r => Value (z_eq(z_dom tm, r))
					);
				in	([ntm],
					 [ntm, (init_var n, mk_var(init_var v, ty))],
					 dcs,
					 actual1,
					 vc_opt,
					 Nil)
				end handle Fail _ =>
				let	val ty = type_of tm;
					val nv = param_tmp_name (type_of tm);
					val cnstrnt = zid env (trans_id tmark);
					val nvtm = mk_z_lvar(nv, ty, []);
					val pred = z_mem(nvtm, cnstrnt);
					val vc_opt = (
							case con_array_range_from_tmark cnstrnt of
							Nil => Nil
						|	Value r => Value (z_eq(z_dom tm, r))
					);
					val e = EAuxiliaryExp(z_quote(nvtm, Nil));
					val stmt = Value (STAssign {
						name = actual,
						e = e});
				in	([ntm],
					 [(init_var n, tm), (n, nvtm)],
					 pred::dcs,
					 e,
					 vc_opt,
					 stmt)
				end
			)
		)
	end
);
=TEX
The following function type-checks the pre- and post-condition of a procedure
call in the appropriate context, restoring the original context afterwards.
=SML
fun ⦏z_preds_in_callee_cxt⦎
	(env : CN_ENV)
	({name, formal_ids, ...} : FORMAL_PROC)
	(ztms : Z_TM list)
			: Z_PRED list = (
	let	val old_cxt = e_get_ti_context();
		val extra_cxt = ti_context_of_formal_ids env formal_ids;
		val extra_ntys = map dest_var extra_cxt;
		val new_cxt = list_e_enter old_cxt extra_ntys;
		val side1 = e_set_ti_context new_cxt;
		val zps = map (z_predexp_of_z_tm env) ztms;
		val side2  = e_set_ti_context old_cxt;
	in	zps
	end
);
=TEX
The following function extracts the entire variable from an expression.
=SML
fun ⦏entire_var_exp⦎ (cn_env : CN_ENV) (e : EXP) : ID = (
	let	fun aux (EId id) = id
		|   aux (ESelectedComp {prefix, selector}) = aux prefix
		|   aux (EIndexedComp{prefix, index}) = aux prefix
		|   aux (EAuxiliaryExp (ZTmQuotation(t, _))) = (
			fst(dest_var t)
			handle Fail _ => fail "entire_var_exp" 505080 []
		) | aux _ = fail "entire_var_exp" 505080 [];
	in	aux (adjust_exp cn_env e)
	end
);
=TEX
=SML
fun ⦏name_to_entire_variable_name⦎ (cn_env : CN_ENV) (e : EXP) : Z_ID = (
	let	val zx = trans_id (entire_var_exp cn_env e);
		val orig = case cn_env zx of
			Value {canon_name, ...} => canon_name
		|	_ => zx;
	in	orig
	end	handle exn => reraise exn "name_to_entire_variable_name"

);
=TEX
The following function makes a pair-wise list of actual parameters (EXPs) with their modes (which are extracted from the corresponding $formal\_proc$).
The actuals are in the order given in the procedure specification.
The actual parameter expressions are not adjusted.
=SML
fun ⦏proc_call_actuals_modes⦎ (env : CN_ENV) (formal_proc as {par_names_defs, ...}: FORMAL_PROC)
				(proc : (AGG_CHOICE, EXP) PROC_CALL) :
			(EXP * MODE) list = (
	let	val name = #name proc;
		val formal_ids = #formal_ids formal_proc;
		val var_decls_modes = map (fn {var_decl, mode,...}
					=> (var_decl,mode)) formal_ids;
		val vars_modes = map
				(fn ({vars, ...},mode) => (vars,mode))
				 var_decls_modes;
		fun do_formals_modes (id::rest, m) = (
			(id, m)::do_formals_modes (rest, m)
		) | do_formals_modes _ = [];
		val (formals,modes) = (split o flat o map do_formals_modes)
						vars_modes;
		val actuals = (case #actuals proc of
				APositional exps => positional_assocs_to_exps par_names_defs exps
			|	ANamed nas => named_assocs_to_exps par_names_defs nas)
			handle Fail _ => fail "anti_aliasing_check_1" 505068
						[fn() => fmt_id name];
		val actuals_modes = combine actuals modes
			handle Fail _ => fail "anti_aliasing_check_1" 505068
						[fn() => fmt_id name];
	in	combine actuals modes
	end
);
=TEX
The following function computes the effective frame of a procedure call --- the frame that is obtained by substituting the entire variables of the actual parameters
for the formals in the original frame.
=SML
fun ⦏proc_frame⦎ (env : CN_ENV)
			({formal_ids, spec={w, ...}, ...} : FORMAL_PROC )
			(actuals_modes : (EXP * MODE) list)
				: Z_ID list = (
	let	val var_decls = map (fn {var_decl, ...} => var_decl) formal_ids;
		val formals = flat (map (fn {vars, ...} => vars) var_decls);
		val table = combine formals (map fst actuals_modes);
		fun aux (v :: vs) = (
			(case lassoc5 table v of
				Nil => v
			|	Value e =>
				name_to_entire_variable_name env e)
			:: aux vs
		) | aux [] = [];
	in	aux w
	end
);
=TEX
The following function combines the functionality of {\it proc\_call\_spec}
and {\it proc\_call\_range\_checks} from the specification.
The fourth part of the returned value gives the range checks.

Formerly, a very approximate treatment of the frame was acceptable in the following, but now the treatment of side conditions needs us to keep an accurate track of possible side effects.
=SML
fun ⦏proc_call_spec⦎ (env : CN_ENV)
		(pc as {actuals, name = n} : (AGG_CHOICE,EXP) PROC_CALL)
		(fp as {name, formal_ids, par_names_defs, spec={pre, post, ...}, ...} : FORMAL_PROC)
			: SPEC * STATEMENT * Z_PRED list * Z_PRED list = (
let	val names = map fst par_names_defs;
	val pre1_post1 = z_preds_in_callee_cxt env fp [pre, post];
	val pre1 = hd pre1_post1;
	val post1 = hd(tl pre1_post1);
	val var_decls = map #var_decl formal_ids;
	val adj_actuals = case actuals of
		APositional exps => map (adjust_exp env)
				(positional_assocs_to_exps par_names_defs exps)
	|	ANamed nas => map (adjust_exp env)
				(named_assocs_to_exps par_names_defs nas);
	fun do_params (acc as (presub, postsub, dc_preds, vc_preds, st, es))
		(acts as (act::more_acts) : EXP list)
		({var_decl = {vars = frm::more_frms, tmark}, mode}::more_pss : PARAM_SPEC list)
	: (Z_ID * Z_EXP) list * (Z_ID * Z_EXP) list *
		Z_PRED list * Z_PRED list * STATEMENT * EXP list = (
		let	val (prs, psts, prds, e, prd_opt, st_opt) =
			proc_call_param env (act, frm, tmark, mode);
		in	do_params
			(prs@presub, psts@postsub, prds term_union dc_preds,
			(case prd_opt of Nil => vc_preds
			| Value prd => vc_preds @ [prd]),
			(case st_opt of Nil => st
			 | Value asgn => STSemicolon(asgn, st)), e::es)
			more_acts
			({var_decl = {vars = more_frms, tmark = tmark},
			  mode = mode}::more_pss)
		end
	) | do_params acc acts ({var_decl = {vars = [], ...}, ...}::more_pss) = (
		do_params acc acts more_pss
	) | do_params (presub, postsub, dc_preds, vc_preds, st, es) [] [] = (
		(presub, postsub, dc_preds, vc_preds, st, rev es)
	) | do_params _ _ _ = (
		fail "proc_call_spec" 505026 [fn () => name]
	);
	val (presubs, postsubs, dc_preds, vc_preds, asgns, es) =
		do_params ([], [], [], [], STNull SNImplicit, []) adj_actuals formal_ids;
	val pre2 = list_sub(pre1, presubs);
	val post2 = list_sub(post1, postsubs);
	val actuals_modes = proc_call_actuals_modes env fp {name = n, actuals = APositional es};
	val w = proc_frame env fp actuals_modes;
	val w0 = map init_var w;
	val spec = {w = w, w0=w0,
				pre=z_quote(pre2, Nil),
				post=z_quote(post2, Nil)};

in	(spec, asgns, dc_preds, vc_preds)
end
);
=TEX
The following function, common to either kind of procedure call, looks for the formal specification
of a procedure.
=SML
fun ⦏get_proc_spec⦎ (caller : string)  (env : CN_ENV)
	 (name : ID)  : FORMAL_PROC= (
	case env (trans_id name) of
		Value {info = EIEnvProcedure{formal_proc = Value fp, ...}, ...} => fp
	|	_ => fail caller 505031 [fn()=>name]
);
=TEX
=SML
fun ⦏proc_call_no_ivars⦎ ({wp, a, wp_env as {env, ...}} : WP_PARS)
		(pc as {name, actuals} : (AGG_CHOICE,EXP) PROC_CALL)
			: RESULT = (
let	val fp as {spec = {w, ...}, ...} = get_proc_spec "proc_call_no_ivars" env name;
	val (spec as {w, ...}, asgns, dc_preds, vc_preds) =
		proc_call_spec env pc fp;
	val xform = STSemicolon(
			STSpecNoIvars{spec = spec,
				label = "", is_assertion = false}, asgns);
	val a_in = cons_srs vr_proc_call_end a;
	val {wp = wp1, side = side1, modifies = _} = wp (xform, a_in, wp_env);
	val side2_seqs = map (fn p => init_sr vr_proc_call_rng_intro ([] ⊢ p)) vc_preds;
         val sr_wp1 = cons_srs vr_proc_call wp1;
	val sr_side1 = cons_srs_side vr_proc_call side1;
	val side2 = map (fn s => (s, [])) side2_seqs;
in {	wp = add_hyps(dc_preds, sr_wp1),
	side = add_hyps_to_side (dc_preds, sr_side1@side2),
	modifies = w}
end
);
=TEX
\subsection{Specification Statement (with Initial Variables)}\label{wp-spec-ivars}
=SML
fun ⦏spec_ivars⦎ ({wp, a, wp_env as {env, ...}} : WP_PARS)
	(w : Z_ID list)
	(((pre, post)) : (Z_EXP * Z_EXP)) : RESULT = (
let	val sr_wp = [init_sr vr_spec_pre_intro ([] ⊢ pre)];
	val side = map (fn s => (s, w)) (post ⟹ a)
in {	wp = sr_wp,
	side = cons_srs_side vr_spec_to_side side,
	modifies = w	}
end
);
=TEX
\subsection{For Loop (Non-Static Bounds)}\label{wp-for-var}
=SML
fun ⦏for_non_static⦎ (pars as {wp, a, wp_env as {env, ...}} : WP_PARS)
			({i, range, loop = {t, stmt}, dir, ...} : STATEMENT FOR_NON_STATIC)
			 : RESULT = (
let	val adjust_and_trans = (trans_exp env) o (adjust_exp env);
	val {lo, hi} = dest_range range;
	val {pre, post, w, w0, ...} = case stmt of
		STSpecNoIvars {spec,  ...} => spec
		|_ => fail "for_non_static" 505022 [];
	val pre1 = z_predexp_of_z_tm env pre;
	val post1 = z_predexp_of_z_tm env post;
	val zi = trans_id i;
	val zlo = adjust_and_trans lo;
	val zhi = adjust_and_trans hi;
	val zleft = zid env zi;
	val zright = z_num one;
	val zlo0 = subs_exp (zlo, w, w0);
	val zhi0 = subs_exp(zhi, w, w0);
	val (zinitial0, zfinal0, zop) =
		if dir = LDForwards then (zlo0, zhi0, z_add) else (zhi0, zlo0, z_minus);
	val zran = z_elem(zid env zi, z_rng (zlo0, zhi0));
	val pre_intro = [z_less_eq (zlo, zhi)] ⊢ sub(pre1, zi, zinitial0);
	val sr_pre_intro = [init_sr vr_for_pre_intro pre_intro];
	val via = z_greater(zlo, zhi) ⟹ a;
	val sr_via = cons_srs vr_for_via via;
	val wp = add_domain_conds env ([zlo, zhi], sr_pre_intro @ sr_via);
	val till_part = case t of
			Value till => (
				zran ⟹ ((z_predexp_of_z_tm env till )⟹ a)
			) | Nil => [];
	val sr_till_part = cons_srs vr_for_exit_to_side till_part;
	val go_round = [zran, z_noteq(zid env zi, zfinal0), post1] ⊢
			sub(pre1, zi, z_bin_exp(zleft, zop, zright));
	val sr_go_round = [init_sr vr_for_pre_to_side go_round];
	val dont_go = sub(post1, zi, zfinal0) ⟹ a;
	val sr_dont_go = cons_srs vr_for_to_side dont_go;
	val side = map (fn s => (s, w))
			(add_domain_conds env ([zlo0, zhi0],
				sr_go_round @ sr_dont_go @ sr_till_part));
in
	{wp = wp, side = side, modifies = w}
end
);
=TEX
\subsection{Logical Constant}\label{wp-log-con}
{\it analyse\_log\_con} picks apart the precondition to set up the actual
list of {\it log\_con\_def}s required for the weakest precondition calculation.
It is essentially the implementation of the predicate of the schema {\it Log\_Con}
in \cite[volume 2]{DRA/CIS/CSE3/TR/94/27/3.0}.

=SML
fun ⦏analyse_log_con⦎ (defs : LOG_CON_DEF list) (pre : Z_PRED) : (LOG_CON_DEF list * Z_PRED) = (
let	fun moan () = term_fail "analyse_log_con" 505024 [pre];
	fun get_def eq_x eq_e acc ((def as {x, t, e=_})::more) = (
		if	x = eq_x
		then	(acc@more, {x = x, t = t, e = eq_e})
		else	get_def eq_x eq_e (def::acc) more
	) | get_def _ _ _ [] = moan();
	fun check xv {x=_, t=_, e=e} = (
		if	xv term_mem frees e
		then	term_fail "analyse_log_con" 505025 [xv, e]
		else	()
	);
	fun do_defs acc p [] = (rev acc, p)
	|   do_defs acc p defs = (
		let	val (eqtm, p') = (dest_z_∧ p) handle Fail _ => (p, mk_z_true);
			val (eq_xv, eq_e) = (dest_z_eq eqtm) handle Fail _ => moan();
			val (defs', new_def) = get_def (fst(dest_var eq_xv)) eq_e [] defs;
			val acc' = (new_def::acc);
			val _ = map (check eq_xv) acc';
		in	do_defs acc' p' defs'
		end
	);
in
	do_defs [] pre defs
end);
=TEX
=SML
fun ⦏z_log_con_def⦎ ((u, v): Z_ID list * Z_ID list) ({x, t=_, e} : LOG_CON_DEF) : Z_PRED = (
	let	val env' = fn id =>
			if id = x
			then Value {
				tipe = Value (type_of e),
				info = EIEnvVar {tmark = "__none", kind = VKVar},
				canon_name = id,
				private = false}
			else Nil;
	in	z_eq(zid env' x, subs_exp(e, u, v))
	end
);
=TEX
=SML
fun ⦏log_con⦎ ({wp, a, wp_env as {env, ...}} : WP_PARS)
	({defs, spec as {w, w0, pre, post}, ...} : LOG_CON)
		: RESULT = (

let	val (defs, pre1) = analyse_log_con defs (z_predexp_of_z_tm env pre);
	val hyps = map (z_log_con_def ([], [])) defs;
	fun aux acc ((hyp, {x, t, e})::more) = (
		(init_sr vr_log_con_type_mem_intro
		(acc ⊢ z_mem(e, z_predexp_of_z_tm env t))) :: aux (hyp::acc) more
	) | aux _ [] = [];
	val wp = [init_sr vr_log_con_pre_intro (hyps ⊢ pre1)] @ aux [] (combine hyps defs);
	val side = map (fn s => (s, w))
		(add_hyps (map (z_log_con_def(w, w0)) defs,
			cons_srs vr_log_con_to_side
			  (z_predexp_of_z_tm env post ⟹ a)));
in	{wp = wp, side = side, modifies = w}
end);
=TEX
\subsection{Procedure Call (Initial Variables in Spec)}\label{wp-proc-call-ivars}
=SML
fun ⦏proc_call_ivars⦎ ({wp, a, wp_env as {env, ...}} : WP_PARS)
	(pc as {name, actuals} : (AGG_CHOICE, EXP) PROC_CALL)
					: RESULT = (
let	val fp as {spec = {w, ...}, ...} = get_proc_spec "proc_call_ivars" env name;
	val (spec, asgns, dc_preds, vc_preds) = proc_call_spec env pc fp;
	val xform = STSemicolon(
			SSpecIvars{spec = spec,
				label = ""}, asgns);
	val a_in = cons_srs vr_proc_call_end a;
	val {wp = wp1, side = side1, modifies = _} = wp (xform, a_in, wp_env);
	val side2_seqs = map (fn p => init_sr vr_proc_call_rng_intro ([] ⊢ p)) vc_preds;
         val sr_wp1 = cons_srs vr_proc_call wp1;
	val sr_side1 = cons_srs_side vr_proc_call side1;
	val side2 = map (fn s => (s, [])) side2_seqs;
in	 {	wp = add_hyps(dc_preds, sr_wp1),
	side = add_hyps_to_side (dc_preds, sr_side1@side2),
	modifies = w}
end
);
=TEX
\subsection{Adjusting Statements}
=SMLPLAIN
fun ⦏initial_variables_of_z_pred⦎ (pred : Z_PRED) : Z_ID list = (
let	val names = map (fst o dest_var) (frees pred);
	fun is_init_var s =
		case (rev o explode) s of
			"0" :: "⋎" :: _ =>	true
		|	_ => 			false;
	
in	names drop (not o is_init_var)
end
);
=SML
fun ⦏any_initial_variables_z_pred⦎ (pred : Z_PRED) : bool = (
	not (is_nil(initial_variables_of_z_pred pred))
);
=TEX
In the following, the renaming substitution is not relevant to the test being made.
=SMLPLAIN
fun ⦏any_initial_variables_z_tm⦎ (env : CN_ENV) (z_tm : Z_TM) : bool = (
	any_initial_variables_z_pred (z_predexp_of_z_tm env z_tm)
);
=TEX
=SML
fun ⦏initial_variable_checks⦎ (caller : string)
	 (env : CN_ENV) (pre : Z_PRED,  post : Z_PRED) : unit = (
	let	fun do1 n = (
			case env n of
				Value {info = EIEnvVar
					{kind = VKPar MSparkOut, ...}, ...}  => (
						fail caller
						505097 [fn () => n]
				) |	_ => ()
		);
	in	if	any_initial_variables_z_pred pre
		then	fail caller 505095 []
		else	(map do1 (initial_variables_of_z_pred post); ())
	end	
);
=TEX
=SML
fun ⦏initial_variable_checks_z_tm⦎ (caller : string)
	(env : CN_ENV) (pre : Z_TM, post : Z_TM) : unit = (
	initial_variable_checks caller env
	(z_predexp_of_z_tm env  pre, z_predexp_of_z_tm env post)
);
=TEX
=SML
fun ⦏is_static_for_loop⦎ (wp as {env, ...}: WP_ENV) (fs : STATEMENT FOR_STATIC) : bool = (
let	val adjust_and_trans = (trans_exp env) o (adjust_exp env);
	fun no_vars_in_exp exp = (
		case (term_vars o adjust_and_trans) exp of
			[] =>	true
		|	_ =>	false
	);
	val {lo, hi} = dest_range(#range fs);
in	no_vars_in_exp lo andalso no_vars_in_exp hi
end
);
=TEX
In the following, most of the work is done in $adj\_stmt\_aux$.
Note that, $adj\_stmt\_aux$ always returns a statement which is just $SStmt\,s$ unless $is\_first$ is true.
$adj\_stmt\_aux$ calls itself recursively (via $check\_inner$) just to check the form of constituents of the various compound statement forms.

Initial variables may not appear in the pre-conditions of specifications
statements (see schema {\it Spec} in \cite[volume 2]{DRA/CIS/CSE3/TR/94/27/3.0}).
The check for this on a specification statement that refines some other
specification statement is made here.
The check on pre-conditions on specification statements being refined is made
in the function {\it vcs}.
The Z Generator (\cite{ISS/HAT/DAZ/IMP507}) makes dummy calls
to {\it vcs} as necessary to ensure that the check is then made on all specification
statements in the script.

In the following, an assertion will have a pre-condition and a default, vacuous post-condition.
=SML
fun ⦏adj_stmt_aux⦎ (wp as {env, ...} : WP_ENV)
			(is_first : bool)
				(s : STATEMENT)
					: STATEMENT = (
let	val check_inner = adj_stmt_aux wp false;
	val adj_first = adj_stmt_aux wp is_first;
in
	case s of
		STSpecNoIvars {spec, label, is_assertion}  => (
			initial_variable_checks_z_tm "adjust_statement"
				env (#pre spec, #post spec);
			if	any_initial_variables_z_tm env (#post spec)
			then	if	is_first
				then	SSpecIvars {spec = spec, label = label}
				else	fail "adjust_statement" 505091 []
			else	s
	) |	SLogCon lc => (
			initial_variable_checks_z_tm "adjust_statement"
				 env (#pre(#spec lc), #post(#spec lc));
			if	not is_first
			then	fail "adjust_statement" 505094 []
			else	s
	) |	STForStatic (fs as {name,i,range,loop as {stmt, ...}, dir, tmark}) => (
			check_inner stmt;
			if	is_static_for_loop wp fs
			then	s
			else	if	is_first
				then	SForNonStatic {	name=name,
							i=i,
							range=range,
							loop=loop,
							dir = dir,
							tmark = tmark
						}
				else	fail "adjust_statement" 505092 []
	) |	STProcNoIvars piv =>
		let	fun find_formal_proc id = (
				Value(get_proc_spec "adj_stmt_aux" env id)
				handle Fail _ => Nil
			);
		in
			case find_formal_proc (#name piv) of
			Value fp => (
				if	any_initial_variables_z_pred
					(hd(z_preds_in_callee_cxt env fp [#post(#spec fp)]))
				then	if	is_first
					then	SProcIvars piv
					else	fail "adjust_statement" 505093 []
				else	s
			) |	Nil => s
		end
	|	STSemicolon (st1, st2) =>
			STSemicolon (adj_first st1, check_inner st2)
	|	STIfThenElse {g, p, q, elsif} => (
			STIfThenElse {
				g = g,
				p = adj_first p,
				q = adj_first q,
				elsif = elsif}
	) |	STCase {s, others, e = e} => (
			STCase{
				s = map
				(fn {choices, p} => {choices = choices, p = adj_first p}) s,
				others = adj_first others,
				e = e}
	) |	STLoop {loop = {stmt, ...}, ...} => (
			check_inner stmt;
			s
	) |	STWhile {loop as {stmt, ...}, ...} => (	
			check_inner stmt;
			s
	) |	STForTmark {loop as {stmt, ...}, ...} => (
			check_inner stmt;
			s
	) |	STLabelled {label, statement} => (
			adj_first statement;
			s
	) |	_ => s
end
);
=TEX
=SML
fun ⦏adjust_statement⦎ (wp : WP_ENV) (st : STATEMENT) : STATEMENT = (
			adj_stmt_aux wp true st
);
=TEX
\subsection{$wp$}\label{wp}
The following does most of the expression adjustment for the expressions in
the top level structure of the statement.
However, there are one or two exceptions, notably, the ranges that appear for-loops
are adjusted by the support functions and the expressions in case choices.
=SML
fun ⦏wp⦎ ((st, a, wp_env) : STATEMENT * SEQUENT list * WP_ENV) : RESULT = (
let	val pars as {wp_env as {env, ...}, ...} : WP_PARS =
			{wp = wp, a = a, wp_env = wp_env};
	val adjust_and_trans = (trans_exp env) o (adjust_exp env);
	val adjust = adjust_exp env;
in	case adjust_statement wp_env st of
		STNull _ => null pars
	|	STAssign {name, e} =>
			assign pars (adjust name, adjust_and_trans e)
	|	STSpecNoIvars {spec={pre, post, w, ...}, ...} =>
			spec_no_ivars_either pars w
				(z_predexp_of_z_tm env pre, z_predexp_of_z_tm env post)
	|	STSemicolon x => semicolon pars x
	|	STIfThenElse {g, p, q, elsif} =>
			if_then_else pars {g=adjust g, p=p, q=q, elsif=elsif}
	|	STCase {e, s, others} =>
			case_others pars {e=adjust e, s=s, others=others}
	|	STLoop x => loop pars x
	|	STWhile {g, loop, name} =>
			cn_while pars {g=adjust g, loop=loop, name=name}
	|	STForStatic x => for_static pars x
	|	STForTmark x => for_tmark pars x
	|	STLabelled {label, statement} => wp(statement, a, wp_env)
	|	STExitWhen {g, n} => exit_when pars {g=adjust g, n = n}
	|	STExit x => cn_exit pars x
	|	STRet {e = Value exp} => cn_return pars {e=Value (adjust exp)}
	|	STRet x => cn_return pars x
	|	STProcNoIvars x => proc_call_no_ivars pars x
	|	STKSlot x => fail "wp" 505040 []
	|	STPragma _ => null pars
	|	STAnnotation _ => null pars
	|	STGoto _ => fail "wp" 505098 []
	|	SSpecIvars {spec={pre, post, w, ...}, ...} =>
			spec_ivars pars w (z_predexp_of_z_tm env pre, z_predexp_of_z_tm env  post)
	|	SForNonStatic x => for_non_static pars x
	|	SLogCon x => log_con pars x
	|	SProcIvars x => proc_call_ivars pars x
	|	SBlockStatement _ => fail "wp" 505096 []
end
);
=TEX
\pagebreak
\section{APPLICATION OF CHECKS}

=TEX
\subsection{The Error Printing Function}
=SML
fun ⦏checking_error⦎ (msg : string) (n : int) (ins) = (
	diag_line (get_error_message 505050 []);
	fail msg n ins
);
=TEX
\subsection{The Checks}
=TEX
=SML
fun ⦏opt_s⦎ ([_] : 'a list) (() : unit) : string = ""
|  opt_s _ () = "s";
=TEX
=SML
fun op ⦏cap⦎ (a, b) = (a cup b) diff (a diff b) diff (b diff a);
=TEX
=SML
fun ⦏check_1_a⦎ (env : CN_ENV) (idl : Z_ID list, speclab : SPECLAB) = (
	let	fun ada_id_or_aux_var v = (
				case env v of
				Value {info = EIEnvAuxVar _, ...} => true
			|	Value {info = EIEnvLogCon _, ...} => false
			|	Value _ => true
			|	Nil => false
		);
		val w = (#w o #spec) speclab;
		val out_of_scope = idl drop ada_id_or_aux_var;
	in
		if	out_of_scope <> []
		then	checking_error "check_1_a" 505065
			[	opt_s out_of_scope,
				fn () => fmt_id_list out_of_scope]
		else	if idl diff w = []
		then ()
		else	if w = []
		then	checking_error "check_1_a" 505060
			[	fn () => fmt_id_list idl]
		else	checking_error "check_1_a" 505064
			[	fn () => fmt_id_list w,
				fn () => fmt_id_list idl]
	end
);
=TEX
=SML
fun ⦏check_1_b⦎ (speclab : SPECLAB, Nil : EXP OPT) : unit = (
	if	not(#formal_body_flag speclab)
	then	checking_error "check_1_b" 505061 []
	else if	#fun_flag speclab
	then	checking_error "check_1_b" 505058 []
	else	()
) | check_1_b (speclab, Value _) = (
	if	not(#formal_body_flag speclab)
	then	checking_error "check_1_b" 505061 []
	else if	not(#fun_flag speclab)
	then	checking_error "check_1_b" 505059 []
	else	()
);
=TEX
=SML
fun ⦏check_1_c⦎ (speclab : SPECLAB) = (
	if #till_flag speclab
	then ()
	else checking_error "check_1_c" 505062 []
);
=TEX
=SML
fun ⦏check_1_d⦎ (p : ID, speclab as {wp_env = {env, ...}, ...}: SPECLAB) = (
	(get_proc_spec "check_1_d" env p; ())
	handle Fail _ => checking_error "check_1_d" 505063 [fn () => p]
);
=TEX
=SML
fun ⦏check_19⦎ (env : CN_ENV)
	(globs_opt : {globals : Z_ID list, pars : Z_ID list, name : ID} OPT) ({w, ...} : SPEC) : unit = (
let	fun aux (env:CN_ENV) (undec, noncanon, nonvar) (v::more) = (
		case env v of
			Value {info = EIEnvVar _, canon_name, ...} => (
				if	v = canon_name
				then	aux env (undec, noncanon, nonvar) more
				else	aux env (undec, (v^" ("^canon_name^")")::noncanon, nonvar) more
		) |	Value {info = EIEnvAuxVar _, ...}  =>  aux env (undec, noncanon, nonvar) more
		|	Value _ => aux env (undec, noncanon, v::nonvar) more
		|	Nil => aux env (v::undec, noncanon, nonvar) more
	) | aux _ accs [] = accs;
	fun report msg (undec, noncanon, nonvar) = (
		case undec of
			_::_ => (z_free_var_report (msg+0) Nil undec;
				fail "check_19" (msg+3) []
		) |	[] =>
		case noncanon of
			_::_ => (z_free_var_report (msg+1) Nil noncanon;
				fail "check_19" (msg+3) []
		) |	[] =>
		case nonvar of
			_::_ => (z_free_var_report (msg+2) Nil nonvar;
				fail "check_19" (msg+3) []
		) |	[] => ()
	);
in	report 505082 (aux env ([], [], []) w);
	(case globs_opt of
		Value {globals, pars, name} => (
			report 505086 (aux env ([], [], []) globals);
			(case globals cap pars of
				[] => ()
			|	some => fail "check_19" 505090
				[opt_s some,
				 fn () => format_list Combinators.I some ", ",
				 fn () => name])
	) |	Nil => ())
end
);
=SML
fun ⦏check_21⦎ (env : CN_ENV) ({name, globals, ...} : FORMAL_PROC) : unit  = (
	let	fun aux acc [] = rev acc
		|   aux acc (v::vs) = (
			case env v of
				Nil => (
				fail "check_21" 505043 [fn() => v, fn () => name]
			) |	Value{info as EIEnvVar{kind = VKOutOfScope, ...}, ...} => (
				aux (v::acc) vs
			) |	Value _ => aux acc vs
		);
		val bad_vs = aux [] globals;		
	in	case bad_vs of
			[] => ()
		|	_::_ => (
			fail "check_21" 505042
			[opt_s bad_vs,
			 fn() => format_list Combinators.I  bad_vs ", ",
			 fn() => name]
		)
	end
);
=TEX
\subsection{Anti-Aliasing Checks}

=SML
fun ⦏free_var_names⦎ (fv::rest : TERM list) : ID list = (
		if is_z_lvar fv
		then
			((fn (n,_, _) => n) o dest_z_lvar) fv::free_var_names rest
		else
			free_var_names rest
) | free_var_names _ = [];
=TEX
The following is slightly different from the specification.
We exploit the fact that {\it other\_vars\_exp} is only used
in anti-aliasing check 3 and there it is only applied to an expression
that must be formed from a variable by some combination of
indexed component and selected component constructs.
We can therefore happily let {\it other\_vars\_exp} fail on
expressions that are not of this form.
Note that as in \cite{ISS/HAT/DAZ/IMP508}, the index or indices in
an indexed component expression are always wrapped up as if they
were a positional array aggregate.
=SML
fun other_vars_exp (cn_env : CN_ENV) (e : EXP) : ID list = (
	let	fun get_index_exps acc (EId id) = acc
		|   get_index_exps acc (ESelectedComp {prefix, selector}) =
			get_index_exps acc prefix
		|   get_index_exps acc (EIndexedComp{prefix,
			index as EArrayAggPos{comps, ...}}) =
			get_index_exps (comps@acc) prefix
		|   get_index_exps acc _ = fail "other_vars_exp" 505080 [];
		val tm = mk_z_tuple(map (trans_exp cn_env)
				(get_index_exps [] (adjust_exp cn_env e)));
	in	(free_var_names o frees) tm
	end
);
=TEX
The above trickery with {\it other\_vars\_exp} means that we have to code
{\it vars\_exp} directly rather than the way the
specification describes it, but that's easier and faster in any case.
=SML
fun ⦏vars_exp⦎ (cn_env : CN_ENV) (exp : EXP) : ID list = (
	(free_var_names o frees o trans_exp cn_env o adjust_exp cn_env) exp
);
=TEX	
In the following, we rely on the fact that {\it zid} does not
change the name of the variable (any changes to the name, e.g., replacing
`.'s by `o's are done by {\it trans\_id}).
Thus we can get away with treating the {\it Z\_ID}s in the global
dependency list as {\it ID}s.
=SML
fun ⦏anti_aliasing_pars⦎ (fp : FORMAL_PROC) (pc : (AGG_CHOICE,EXP)PROC_CALL)
				: ID list * ID list = (
	let	val formal_ids = #formal_ids fp;
		val var_decls = map (fn {var_decl, ...} => var_decl) formal_ids;
		val formals = flat (map (fn {vars, ...} => vars) var_decls);
		val trans_formals = map trans_id formals;
	in
		(formals, #globals fp)
	end
);
=TEX
=SML

=TEX
=SML
fun ⦏anti_aliasing_check_1⦎  (speclab : SPECLAB)
				(formal_proc : FORMAL_PROC)
				(proc : (AGG_CHOICE,EXP)PROC_CALL)
				(actuals_modes : (EXP * MODE) list) : unit = (
	let	val name = #name proc;
		val cn_env = (#env o #wp_env) speclab;
		val (formals, trans_globals) = anti_aliasing_pars formal_proc proc;
		val set = map fst (actuals_modes drop
				(fn am => not (	snd am = MSparkInOut orelse
							snd am = MSparkOut)));
		val trans_set = map (fn
				e => entire_var_exp cn_env e
				handle Fail _ =>
				fail "anti_aliasing_check_1" 505070
				[fn()=>name]) set;
		val inter_set = trans_set cap (trans_globals diff formals);
		fun plural () = if length inter_set > 1 then "s" else "";
	in
		if inter_set = []
		then (* OK *) ()
		else	checking_error "anti_aliasing_check_1" 505071
				[	plural,
					fn()=> fmt_id_list inter_set,
					fn()=> fmt_id name]
	end
);
=TEX
=SML
fun ⦏anti_aliasing_check_2⦎ (speclab : SPECLAB)
				(formal_proc : FORMAL_PROC)
				(proc : (AGG_CHOICE,EXP)PROC_CALL)
				(actuals_modes : (EXP * MODE) list) : unit = (
	let	val name = #name proc;
		val (formals, _) = anti_aliasing_pars formal_proc proc;
		val w = (#w o #spec) formal_proc;
		val actuals = map fst actuals_modes;
		val ids = list_cup (map (vars_exp ((#env o #wp_env) speclab))
					actuals);
		val trans_ids = map trans_id ids;
		val inter_set = (w diff formals) cap trans_ids;
		val plural = if length inter_set > 1 then "s" else "";
	in	if inter_set = []
		then (* OK *) ()
		else checking_error "anti_aliasing_check_2" 505072
				[	fn()=> plural,
					fn()=> fmt_id_list inter_set,
					fn()=> fmt_id name]
	end
);
=TEX
=SML
fun ⦏anti_aliasing_check_3⦎ (speclab : SPECLAB)
				(formal_proc : FORMAL_PROC)
				(proc : (AGG_CHOICE,EXP)PROC_CALL)
				(actuals_modes : (EXP * MODE) list) : unit = (
	let	val name = #name proc;
		val cn_env = (#env o #wp_env) speclab;
		val var_sets = map (vars_exp cn_env o fst) actuals_modes;
		val acts_modes_vars = combine actuals_modes var_sets;
		fun do_check bef (((act, MSparkIn _), vars)::aft) = (
			do_check (vars::bef) aft
		) | do_check bef (((act, _), vars)::aft) = (
				let	val ent_var = entire_var_exp cn_env act;
				val other_vars = other_vars_exp cn_env act;
			in	if	not (ent_var mem other_vars)
				andalso	not (any bef (fn vs => ent_var mem vs))
				andalso	not (any aft (fn (_, vs) => ent_var mem vs))
				then	do_check (vars::bef) aft
				else	checking_error "anti_aliasing_check_3"
					505073 [	fn()=> fmt_id ent_var,
						fn()=> fmt_id name]
			end
		) | do_check _ [] = ();
	in	 do_check [] acts_modes_vars
	end
);
=TEX
=SML
fun ⦏anti_aliasing_check⦎ (speclab as {wp_env as {env, ...}, ...}: SPECLAB,
				proc as {name, ...}: (AGG_CHOICE,EXP)PROC_CALL) = (
	let	val formal_proc = get_proc_spec "anti_aliasing_check" env name;
		val actuals_modes =
			proc_call_actuals_modes env formal_proc proc
			handle Fail _ =>
			fail "anti_aliasing_check" 505068 [fn()=> #name proc];
	in
		anti_aliasing_check_1 speclab formal_proc proc actuals_modes;
		anti_aliasing_check_2 speclab formal_proc proc actuals_modes;
		anti_aliasing_check_3 speclab formal_proc proc actuals_modes;
		check_1_a env (proc_frame env formal_proc actuals_modes, speclab);
		check_21 env formal_proc
	end
);
=TEX
\subsection{Invoking the Checks}
=SML
fun ⦏do_soundness_checks⦎ (
	(speclab as {wp_env as {env, ...}, ...},
		statement): SPECLAB * STATEMENT) : unit = (

let	fun pass_over_statement (st : STATEMENT) = (

	case st of
			STNull _ => (
		)|	STAssign {name,e} => (
				check_1_a env
				([name_to_entire_variable_name env name],
					speclab)
		)|	STSpecNoIvars {spec as {w,w0,pre,post},label, is_assertion} => (
				check_1_a env (w, speclab);
				check_19 env Nil spec
		)|	STSemicolon (s1, s2) => (
					(pass_over_statement s1;
					pass_over_statement s2)
		)|	STIfThenElse  {p, q, ...} => (
					(pass_over_statement p;
					pass_over_statement q)
		)|	STCase {s, others, ...} => (
				map (fn st1 => pass_over_statement (#p st1)) s;
				pass_over_statement others
		)|	STLoop {loop = {stmt, ...}, ...} => (
				pass_over_statement stmt
		)|	STWhile {loop, ...} => (
				pass_over_statement (#stmt loop)
		)|	STForStatic {loop, ...} => (
				pass_over_statement (#stmt loop)
		)|	STForTmark {loop, ...} => (
				pass_over_statement (#stmt loop)
		)|	STLabelled {label, statement} => (
				pass_over_statement statement
		)|	STExitWhen {n = Nil, ...} => (
				check_1_c speclab
		)|	STExitWhen _ => (
		)|	STExit {n = Nil} => (
				check_1_c speclab
		)|	STExit _ => (
		)|	STRet {e} => (
				check_1_b (speclab, e)
		)|	STGoto _ => (
				fail "do_soundness_checks" 505098 []
		)|	STProcNoIvars (proc as {name,actuals}) => (
				check_1_d (name, speclab);
				anti_aliasing_check (speclab, proc)
		)|	STKSlot {content,label} => (
		)|	STPragma _ => (
		)|	STAnnotation _ => (
		)|	SSpecIvars _ => (
		)|	SLogCon {spec as {w, ...}, ...} => (
				check_1_a env (w, speclab);
				check_19 env Nil spec
		)|	SForNonStatic {loop, ...} => (
				pass_over_statement (#stmt loop)
		)|	SProcIvars (proc as {name,actuals}) => (
				check_1_d (name, speclab);
				anti_aliasing_check (speclab, proc)
		) |	SBlockStatement _ => fail "do_soundness_checks" 505096 []
	);
	in	pass_over_statement statement
	end
);
=TEX
\subsection{Variable Capture Checks}

The following function is called from $add\_var\_env$ in \cite{ISS/HAT/DAZ/IMP507}.

=SML
fun ⦏check_new_spark_ids⦎ (cn_env : CN_ENV) (ids : ID list) : unit= (
	let	fun aux id = (
			case cn_env id of
				Value _ => fail "check_new_spark_ids" 505074 [fn()=>id]
			|	Nil => ()
		);
	in	if	all_different ids
		then	(map aux ids; ())
		else	fail "check_new_spark_ids" 505075 []
	end
);
=TEX
=SML
fun ⦏check_new_z_id⦎ (env : CN_ENV, z_ids : Z_ID list) (z_id : Z_ID) : unit = (
	if z_id mem z_ids
	then
		fail "check_new_z_id" 505074 [fn()=>z_id]
	else	case env z_id of
			Value _ => fail "check_new_z_id" 505074 [fn()=>z_id]
		|	Nil => ()
);
=TEX
\section{VERIFICATION CONDITIONS}
$cart\_prod$ and $fun\_decl$ are specified in
\cite[volume 1]{DRA/CIS/CSE3/TR/94/27/3.0}.
=SML
fun ⦏fun_sig⦎ (zpars : Z_EXP list, zret : Z_EXP) : Z_EXP= (
	case zpars of
		[] => zret
	|	[zpar] => z_tfun(zpar, zret)
	|	_ => z_tfun(z_many_cross zpars, zret)
);
=TEX
=SML
fun ⦏par_tmark⦎ (env : CN_ENV)
	({var_decl = {vars, tmark, ...}, ...} : PARAM_SPEC) : Z_ID list = (
	let	val zi = trans_id tmark;
	in	map (Combinators.K zi) vars
	end
);
=TEX
=SML
fun ⦏var_sig⦎ (env : CN_ENV) (zn : Z_ID) : Z_EXP = (
	case env zn of
		Value {info = EIEnvVar {tmark, ...}, ...} => zid env(trans_id tmark)
	|	Value {info = EIEnvAuxVar {decl, ...}, ...} => snd(dest_z_dec decl)
	|	Value _ => zid env zn
	|	_ => fail "var_sig" 505041 [fn()=>zn]
);
=TEX
=SML
fun ⦏fun_decl_aux⦎
	((env, {name, formal_pars, return_type, par_names_defs}, globals)
	: CN_ENV * INFORMAL_FUN * Z_EXP list) : Z_DECL * TERM * TERM = (
	let	val zn = trans_id name;
		val z_ret_ty = zid env (trans_id return_type);
		fun dec_of v = (
			if	is_var v
			then	var_sig env (fst(dest_var v))
			else	v
		);
		val gdecs = map dec_of globals;
		val tmarks = flat (map (par_tmark env) formal_pars);
		val pdecs = map (zid env) tmarks;
		val zexp = fun_sig(gdecs, fun_sig(pdecs, z_ret_ty));
		val t_zexp = (dest_z_power_type o type_of) zexp;
		val lvar = mk_z_lvar(zn, t_zexp, []);
		val gvar = mk_z_gvar(zn, t_zexp, []);
	in	(mk_z_dec([lvar], zexp), lvar, gvar)
	end
);
=TEX
We can defined $fun\_decl$ in terms of $fun\_decl\_aux$ by throwing away the second and third parts of the result value and currying the function.
=SML
fun ⦏fun_decl⦎
	(env : CN_ENV)	({informal_fun, globals, ...} : FORMAL_FUN) : Z_DECL = (
	let	val (d, _, _) = fun_decl_aux(env, informal_fun, map (zid env) globals);
	in	d
	end
);
=TEX
The following originally followed the algorithm as suggested by the specification which would have us calculate the set of all variables and parameters that are in scope, add a few things to them and then remove unnecessary ones, i.e. the ones that don't appear free in the sequent.
However, this is inefficient and has been reworked to start from the free variables.
=SML
fun ⦏vc_local_decls1⦎
	({formal_body_flag, fun_flag,
		in_scope,
		wp_env = {fun_header, env, ...}, ...} : SPECLAB)
	(seq : SEQUENT)
		: VC = (
let
(*
=TEX
\raggedright{If $formal\_body\_flag$ and $fun\_flag$ are $true$ substitute the local variable version of the function name for the global variable version  (obtained from $fun\_header$).}
=SML
*)
	fun opt_dest_θ t = fst (dest_z_θ t) handle Fail _ => t;
	val (fun_dec, subs_fn) =
		if	formal_body_flag andalso fun_flag
			then	let 	val (d, l, g) = fun_decl_aux
		(env, fun_header, map opt_dest_θ (fun_globals env (#name fun_header)));
				in	([d], subst [(l, g)])
				end
			else	([], Combinators.I);

	val seq1 = (fn (h, c) => (map subs_fn h, subs_fn c)) seq;

(*
=TEX
Calculate the free variables of the resulting sequent.
=SML
*)
	fun frees_in_seq (seq as (h, c)) = (
		map (fst o dest_var) (flat(frees c :: map frees h))
	);

	val free_vs = frees_in_seq seq1;
(*
=TEX
For each free variable corresponding to a program variable, a parameter, an auxiliary variable or a logical constant add the (potentially) necessary declarations.
As specified in \cite[Volume 2, section 5.1.5]{DRA/CIS/CSE3/TR/94/27/3.0} program variables and parameters of mode other than `in'  need the initial version as well as the plain name if the iniitial version appears free in the sequent.
=SML
*)
	fun add_iv zid = (
		let	val iv = init_var zid;
		in	if	iv mem free_vs
			then	[zid, iv]
			else	[zid]
		end
	);

	fun add_iav zid decl = (
		let	val iv = init_var zid;
		in	if	iv mem free_vs
			then	let	val set = snd(dest_z_dec decl);
					val el_ty = dest_z_power_type (type_of set);
					val av = mk_z_lvar(zid, el_ty, []);
					val iav = mk_z_lvar(iv, el_ty, []);
				in	mk_z_dec([av, iav], set)
				end
			else	decl
		end
	);
	fun pass1 acc [] = acc
	|   pass1 acc (zid :: more) = (
		pass1
		(case env zid of
			Value {info = EIEnvVar {tmark, kind = VKVar}, ...} => (
				trans_decl env{vars = add_iv zid,  tmark = tmark}::acc
		) |	Value {info = EIEnvVar {tmark, kind = VKPar (MSparkIn _)}, ...} => (
				trans_decl env {vars = [zid], tmark = tmark}::acc
		) |	Value {info = EIEnvVar {tmark, kind = VKPar _}, ...} => (
				trans_decl env{vars = add_iv zid,  tmark = tmark}::acc
		) |	Value {info = EIEnvAuxVar {decl, ...}, ...} => (
				add_iav zid decl :: acc
		) |	Value {info = EIEnvLogCon {decl, ...}, ...} => (
				decl::acc
		) | _ => 	acc)
		more
	);

	val decls1 = pass1 (if #name fun_header mem free_vs then fun_dec else []) free_vs;
(*
=TEX
Add the declarations accrued so far to form a VC (which we will adjust shortly).
=SML
*)

	val vc1  = (decls1, seq1);
(*
=TEX
Add declarations for any new Z variables introduced in processing
procedure calls with record or array components as exported parameter
and remove the corresponding hypotheses from the sequent.
=SML
*)
	fun add_tmp_decls (decs, seq as (h, c)) = (
	let	fun strip_tmp_decs acc [] = acc
		|   strip_tmp_decs (acc as (new_ds, h)) (hyp::hyps) = (
			let	val (v, tm) = dest_z_∈ hyp;
				val (n, _, _) = dest_z_lvar v;
			in	if	maybe_param_tmp_name n
				andalso	not (any decs (is_free_in v))
				then	strip_tmp_decs
						(mk_z_dec([v], tm)::new_ds, h) hyps
				else	term_fail "" 0 []
			end	handle Fail _ => strip_tmp_decs (new_ds, hyp::h) hyps
		);
		val (new_ds, new_h) = (rev ** rev)(strip_tmp_decs ([], []) h);
	in	(decs @ new_ds, (new_h, c))
	end);

	val vc2 as (decs2, h_c2) = add_tmp_decls vc1;
(*
=TEX
Finally sort the declarations first by their RHS and then by their LHS and then merge
declarations that have the same RHS. (This will also eliminate any duplicates, not that there
should be any).
=SML
*)

	fun sort_and_merge decs =(
		let
			fun flatten_dec dec = (
				let	val (vs, rhs) = dest_z_dec dec;
				in	map (fn v => (v, rhs)) vs
				end
			);
			fun my_order (v1, rhs1) (v2, rhs2) = (
				case term_order rhs1 rhs2 of
					0 => term_order v1 v2
				|	non_zero => non_zero
			);
			fun merge acc (vs, rhs1) ((v, rhs2):: more) = (
				if	rhs1 =$ rhs2
				then	merge acc (v::vs, rhs1) more
				else	merge
					(mk_z_dec (rev vs, rhs1)::acc)
					([v], rhs2)
					more
			) | merge acc (vs, rhs) [] = (
				rev(mk_z_dec(rev vs, rhs)::acc)
			);
		in	case Sort.sort my_order (flat (map flatten_dec decs)) of
				[] => []
			|	(v, rhs)::more => merge [] ([v], rhs) more
		end
	);

	val vc3 = (sort_and_merge decs2, h_c2);

in	vc3
end
);

=TEX
=SML
fun ⦏vc_local_decls⦎ (seqs : SEQUENT list, speclab: SPECLAB) : VC list = (
	map (vc_local_decls1 speclab) seqs
);
=TEX
Initial variables may not appear in the pre-conditions of specifications
statements (see schema {\it Spec} in \cite[volume 2]{DRA/CIS/CSE3/TR/94/27/3.0}).

=SML
fun ⦏vcs⦎ ((sl, st): SPECLAB * STATEMENT)

			: (VC * ROUTE OPT) list * SPEC = (

let	val {spec as {w, w0, pre, post},
			wp_env as {env, ...}, ...} = sl;

	val _ = do_soundness_checks (sl, st);

	val pre1 = z_predexp_of_z_tm env pre;
	val post1 = z_predexp_of_z_tm env post;
	val {wp = wp0, side, modifies = _} =
		wp (st, [init_sr vr_refinement_intro ([] ⊢ post1)], wp_env);
	fun subs_wp (h, c) = (
		h ⊢ subs_pred(c, w0, w)
	);
	fun subs_side ((h, c), t) = (
		let	val v = w diff t;
			val v0 = map init_var v;
			val t0 = map init_var t;
		in	(h term_grab subs_pred(pre1, t, t0)) ⊢ subs_pred (c, v0, v)
		end
	);
	val wp1 = map subs_wp (cons_srs vr_refinement_begin wp0);
	val sr_side = cons_srs_side vr_refinement_begin side;
	val s = (pre1 ⟹ wp1) @
		(map subs_side sr_side);
         val (no_sr_s, routes) = extract_routes s
in
	initial_variable_checks "vcs" env (pre1, post1);
	(combine (vc_local_decls(no_sr_s, sl)) routes,
		 {	w = w,
			w0 = w0,
			pre = z_quote (pre1, Nil),
			post = z_quote (post1, Nil)})
end
);
=TEX
=TEX
\section{EPILOGUE}
=SML
end (* structure CNVCGenerator *);
=TEX
%\pagebreak
%\section{THEORY LISTING}
%\HOLindexOff
%\input{zed505.th.tex}
%\HOLindexOn
\twocolumn[\section{INDEX OF DEFINED TERMS}]
\printindex
\end{document}

=IGN

CNZGenerator.diag_vc_args;
CNVCGenerator.vcs (hd(!CNZGenerator.diag_vc_args));
use_file"wrk001";
val (sl as {spec as {w, w0, pre, post, ...},
			wp_env, ...}, st)= hd(! CNZGenerator.diag_vc_args);

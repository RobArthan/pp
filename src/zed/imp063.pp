=IGN
********************************************************************************
imp063.doc: this file is part of the PPZed system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% imp063.doc	ℤ 2004/01/19 12:44:00 1.26 imp063.doc,v
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

\def\Title{Implementation of the Z Term Generator}

\def\AbstractText{This document contains the implementation of the term generator for HOL/Z.}

\def\Reference{DS/FMU/IED/IMP063}

\def\Author{D.J. King}


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
%% LaTeX2e port: \documentstyle[hol1,11pt,TQ]{article}
%% LaTeX2e port: \ftlinepenalty=9999
\def\Hide#1{}
%% LaTeX2e port: \def\Bool{``$\it{:}bool\,$''}
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{FST PROJECT}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Implementation of the Z Term Generator}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP063}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{1.26%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{2004/01/19 12:44:00%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{D.J.~King & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document contains the implementation of
%% LaTeX2e port: the term generator for HOL/Z.}
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
\bibliography{fmu}

\subsection{Changes History}  % to get section number `0.3'
\begin{description}

\item[Issue 1.1 (1992/06/11), \FormatDate{92/03/19} ] Initial Draft.

\item [Issue 1.9 (1992/07/17) (17th July 1992)]
Now uses real $mk\_z\_rename⋎s$.
\item [Issue 1.10 (1992/07/20) (20th July 1992)] Added binding display.
\item [Issue 1.11 (1992/07/21) (21st July 1992)]
Activated $rename⋎s\_const\_spec$.
\item [Issue 1.12 (1992/07/27)-15 (31st July 1992)]
Added calls to a few more semantic constant generation functions. Tidied up the documentation side.
\item [Issue 1.18 (1992/10/28) (28th October 1992)]
Amended treatment of term quotations.
\item [Issue 1.19 (1992/10/29) (29th October 1992)]
Fixed bug in decoration in declarations.
\item [Issue 1.20 (1992/11/03) (3rd November 1992)]
Capture of free variables by global variables now handled.
\item[Issue 1.21 (1992/12/10) (10th December 1992)]
Global rename from wrk038.doc issue 1.9.
\item[Issue 1.22 (1994/05/07) (7th May 1994)]
Added the local function $type\_defn\_of\_z\_extype$ which is now used during term generation to ensure that all the types which are required are introduced into the current cache theory. Where the flag ``standard\_z\_paras'' is set to false, the following paragraph now correctly type checks.
ⓈIZAX
fruit :  (𝕌 ⦂ ℙ[apple, banana, crabapple : ℤ])
■
\item[1.23] Update for new INTEGER type.
\item[Issue 1.24 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.25 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.26 (2004/01/19)] The Z universal set is now called 𝕌.
\item[Issue 1.27 (2004/07/29)--1.29 (2004/08/08)] Performance enhancements.
\item[Issue 1.30 (2005/09/06)] Let expressions.
\item[Issue 1.31 (2005/09/13)] Option to require distinguishing subscripts on all schema operations.
\item[Issue 1.32 (2006/01/14)] Fixed missing semantic constant generation for the μ inside a let expression.
\item[Issue 1.33 (2006/01/25)] The name of the decoration operator is now based on the stem {\em decor} throughout, rather than {\em decor} in some places and {\em dec} in others.
\item[Issue 1.34 (2006/04/20)] Added support for floating point literals.
\item[Issue 1.35 (2011/07/11)] Allowed for the new predicate context constructor.
\item[Issue 1.36 (2011/08/04)] Fixed bug with decorations in forming characteristic tuples.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported PPZed to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
The function $do\_in\_theory$ will be moved into the
underlying HOL system in due course.
\section{GENERAL}
\subsection{Scope}
This document contains the implementation
of the term generator for HOL/Z meeting the detailed design
given in \cite{DS/FMU/IED/DTD063}.
\subsection{Introduction}
\subsection{Purpose and Background}
See \cite{DS/FMU/IED/DTD063}.
\subsection{Dependencies}
The structure $ZTermGenerator$ depends on the structure
$ZUserInterfaceSupport$ for the types of the Z abstract syntax
tree, $ZTypeInference$ for the function $type\_of\_z_extype$
amd $ZGeneratedConstants$ for the functions which introduce
generated semantic constants.
\subsection{Interface}
The structure $ZTermGenerator$ is constrained by the signature
$ZTermGenerator$ defined in \cite{DS/FMU/IED/DTD063}.
\subsection{Possible Enhancements}
None.
\subsection{Deficiencies}
None known.

\section{PREAMBLE}
=SML
structure ⦏ZTermGenerator⦎ : ZTermGenerator = struct
local
	open Unification ZUserInterfaceSupport
	open ZTypeInference ZGeneratedConstants;
in
=TEX

\section{CALLING THE GENERATED SEMANTIC CONSTANT INTERFACES}

=SML
fun ⦏new_seta_defn⦎ ((dec, pred, t) : (TERM * TERM * TERM)) : TERM = (
let	val res = mk_z_seta (dec, pred, t);
	val thm = seta_gen_semantic_const res;
in
	res
end);
=TEX
=SML
fun ⦏new_tuple_defn⦎ (tms : (TERM list)) : TERM = (
let	val tm = mk_z_tuple tms;
	val side = tuple_gen_semantic_const tm;
in
	tm
end);
=TEX
=SML
fun ⦏new_μ_defn⦎ ((dec, pred, t) : (TERM * TERM * TERM)) : TERM = (
let	val tm = mk_z_μ (dec, pred, t);
	val thm = μ_gen_semantic_const tm;
in
	tm
end);
=TEX
=SML
fun ⦏new_let_defn⦎ ((defs, body) : ((string * TERM) list * TERM)) : TERM = (
let	val tm = mk_z_let (defs, body);
	val mu_tm = snd(dest_app(tm));
	val thm = μ_gen_semantic_const mu_tm;
in	tm
end);
=TEX
=SML
fun ⦏new_×_defn⦎ (tms : (TERM list)) : TERM = (
let	val tm = mk_z_× tms;
	val side = ×_gen_semantic_const tm;
in
	tm
end);
=TEX
=SML
fun ⦏new_λ_defn⦎ ((dec, pred, t) : (TERM * TERM * TERM)) : TERM = (
let	val tm = mk_z_λ (dec, pred, t);
	val thm = λ_gen_semantic_const tm;
in
	tm
end);
=TEX
=SML
fun ⦏new_renaming_defn⦎ ((tm, ididl) : TERM * (string * string) list) : TERM = (
let	val tm' = mk_z_rename⋎s (tm, ididl);
	val thm = rename⋎s_gen_semantic_const tm';
in
	tm'
end);
=TEX
=SML
fun ⦏new_binding_defn⦎ (stl : (string * TERM) list) : TERM = (
let	val tm' = mk_z_binding stl;
	val thm = binding_gen_semantic_const tm';
in
	tm'
end);
=TEX
=SML
fun ⦏new_∃⋎1_defn⦎ ((dec, pred, t) : (TERM * TERM * TERM)) : TERM = (
let	val res = mk_z_∃⋎1 (dec, pred, t);
	val thm = ∃⋎1_gen_semantic_const res;
in
	res
end);
=TEX
=SML
fun ⦏new_⋎s_defn⦎ ((tm1, tm2) : (TERM * TERM)) : TERM = (
let	val tm' = mk_z_h_schema (tm1, tm2);
	val thm = schema_gen_semantic_const tm';
in
	tm'
end);
=TEX
=SML
fun ⦏new_decor⋎s_defn⦎ ((tm1, d) : (TERM * string)) : TERM = (
let	val tm' = mk_z_decor⋎s (tm1, d);
	val thm = decor⋎s_gen_semantic_const tm';
in
	tm'
end);
=TEX
=SML
fun ⦏new_pre⋎s_defn⦎ (tm : TERM) : TERM = (
let	val tm' = mk_z_pre⋎s tm;
	val thm = pre⋎s_gen_semantic_const tm';
in
	tm'
end);
=TEX
=SML
fun ⦏new_↾⋎s_defn⦎ ((tm1, tm2) : (TERM * TERM)) : TERM = (
let	val tm' = mk_z_↾⋎s (tm1, tm2);
	val thm = ↾⋎s_gen_semantic_const tm';
in
	tm'
end);
=TEX
=SML
fun ⦏new_hide⋎s_defn⦎ ((tm, idl) : (TERM * string list)) : TERM = (
let	val tm' = mk_z_hide⋎s (tm, idl);
	val thm = hide⋎s_gen_semantic_const tm';
in
	tm'
end);
=TEX
=SML
fun ⦏new_dyop⋎s_defn⦎ (inop : Z_LOG_IN_OP) ((tm1, tm2) : (TERM * TERM)) : TERM = (
let	val tm' = case inop of
		ZLogInOp∧ _ => mk_z_∧⋎s  (tm1, tm2)
		|ZLogInOp∨ _ => mk_z_∨⋎s (tm1, tm2)
		|ZLogInOp⇒ _ => mk_z_⇒⋎s (tm1, tm2)
		|ZLogInOp⇔ _ => mk_z_⇔⋎s (tm1, tm2)
		|ZLogInOpSemi => mk_z_∧⋎s (tm1, tm2);
	val thm = dyop⋎s_gen_semantic_const tm';
in
	tm'
end);
=TEX
=SML
fun ⦏new_quant⋎s_defn⦎ (quant : Z_QUANT)
	((dec, pred, t) : (TERM * TERM * TERM)) : TERM = (
let	val tm = case quant of
		ZQuant∃ _ => mk_z_∃⋎s (dec, pred, t)
		|ZQuant∀ _ => mk_z_∀⋎s (dec, pred, t)
		|ZQuant∃⋎1 _ => mk_z_∃⋎1⋎s (dec, pred, t);
	val thm = quant⋎s_gen_semantic_const tm;
in
	tm
end);
=TEX
=SML
fun ⦏new_Δ⋎s_defn⦎ (tm : TERM) : TERM = (
let	val tm' = mk_z_Δ⋎s tm;
	val thm = Δ⋎s_gen_semantic_const tm';
in
	tm'
end);
=TEX
=SML
fun ⦏new_Ξ⋎s_defn⦎ (tm : TERM) : TERM = (
let	val tm' = mk_z_Ξ⋎s tm;
	val thm = Ξ⋎s_gen_semantic_const tm';
in
	tm'
end);
=TEX
=SML
fun ⦏new_⨾⋎s_defn⦎ ((tm1, tm2) : (TERM * TERM)) : TERM = (
let	val tm' = mk_z_⨾⋎s (tm1, tm2);
	val thm = ⨾⋎s_gen_semantic_const tm';
in
	tm'
end);
=TEX

\section{UTILITIES}
=SML
local
val ℤ_ty = mk_ctype("ℤ", []);
val minus_ty = mk_z_power_type(mk_z_tuple_type[ℤ_ty, ℤ_ty]);
val zminus = mk_z_gvar("~ _", minus_ty, []);
in
fun ⦏mk_nat⦎ (n : INTEGER) : TERM = (
	mk_z_int(string_of_integer n)
);
fun ⦏mk_exp⦎ (e : INTEGER) : TERM = (
	if	e @>= zero
	then	mk_nat e
	else	mk_z_app(zminus, mk_nat(@~ e))
);
end;
=TEX

\section{GENERATING HOL TERMS}

\subsection{Z Declarations}

=SML
fun ⦏tm_of_z_dec⦎ (dec : Z_DEC) : TERM = (
	case dec of
	ZDDec (idl, tm, Value ty) =>
		let	val set = tm_of_z_tm tm;
			val holty = type_of_z_extype ty;
			val vars = map (fn id =>
				mk_z_lvar (string_of_ident id, holty, [])) idl;
		in
			mk_z_dec (vars, set)
		end
	|ZDDec (_, _, Nil) =>
		fail "tm_of_z_dec" 63001 []
	|ZDSchemaDec (ZTmDecor (tm, d, _), _) =>
		mk_z_schema_dec (tm_of_z_tm tm, d)
	|ZDSchemaDec (tm, _) =>
		mk_z_schema_dec (tm_of_z_tm tm, "")
)
=TEX
=SML
and ⦏list_tm_of_z_dec⦎ (decl : Z_DEC list) : TERM = (
	mk_z_decl (map (fn zd => tm_of_z_dec zd) decl)
)
=TEX

\subsection{Z Schema Texts}

=SML
and ⦏tm_of_z_schtext⦎ (sch as (dec, Value pred, Value ty)
	: Z_SCH_TEXT) : (TERM * TERM OPT) = (
	(list_tm_of_z_dec dec, Value (tm_of_z_tm pred))
) | tm_of_z_schtext (dec, _, _) = (
	(list_tm_of_z_dec dec, Nil)
)
=TEX

\subsection{Z Terms}

=SML
and ⦏tm_of_z_tm⦎ ((term as ZTm⟨⟩ (Value ty, tml)) : Z_TM) : TERM = (
let	val elty = hd (tl (dest_z_tuple_type (type_of_z_extype ty)));
in
	mk_z_⟨⟩ (elty, list_tm_of_z_tm tml)
end
) | tm_of_z_tm (ZTm⟨⟩ (Nil, _)) = (
		fail "tm_of_z_tm" 63001 []
) | tm_of_z_tm (term as ZTmSetd (Value ty, tml)) = (
let	val elty = type_of_z_extype ty;
in
	mk_z_setd (elty, list_tm_of_z_tm tml)
end
) | tm_of_z_tm (ZTmSetd (Nil, _)) = (
		fail "tm_of_z_tm" 63001 []
) | tm_of_z_tm (term as ZTmSeta1 sch) = (
	let	val (tm', ty') = make_chartuple sch;
		val (dec, opred) = tm_of_z_schtext sch;
		val pred = case opred of
			Nil => mk_z_true
			|Value zp => zp;
		val t = tm_of_z_tm tm';
	in
		new_seta_defn (dec, pred, t)
	end
) | tm_of_z_tm (term as ZTmSeta2 (sch, tm)) = (
	let	val (dec, opred) = tm_of_z_schtext sch;
		val pred = case opred of
			Nil => mk_z_true
			|Value zp => zp;
		val t = tm_of_z_tm tm;
	in
		new_seta_defn (dec, pred, t)
	end
) | tm_of_z_tm (term as ZTmℙ tm) = (
	mk_z_ℙ (tm_of_z_tm tm)
) | tm_of_z_tm (term as ZTmTuple tml) = (
	new_tuple_defn (list_tm_of_z_tm tml)
) | tm_of_z_tm (term as ZTmBinding stl) = (
	new_binding_defn (map (string_of_ident ** tm_of_z_tm) stl)
) | tm_of_z_tm (term as ZTm× tml) = (
	new_×_defn (list_tm_of_z_tm tml)
) | tm_of_z_tm (term as ZTmθ (tm, d)) = (
	mk_z_θ (tm_of_z_tm tm, d)
) | tm_of_z_tm (term as ZTmSel⋎T (tm, i)) = (
	mk_z_sel⋎t (tm_of_z_tm tm, i)
) | tm_of_z_tm (term as ZTmSel⋎B (tm, id)) = (
	mk_z_sel⋎s (tm_of_z_tm tm, string_of_ident id)
) | tm_of_z_tm (term as ZTmApp (tm1, tm2)) = (
	mk_z_app (tm_of_z_tm tm1, tm_of_z_tm tm2)
) | tm_of_z_tm (term as ZTmFancyApp (id, tm)) = (
	fail "tm_of_z_tm" 63003 []
=TEX
=SML
) | tm_of_z_tm (term as ZTmλ (sch, tm)) = (
	let	val (dec, opred) = tm_of_z_schtext sch;
		val pred = case opred of
			Nil => mk_z_true
			|Value zp =>  zp;
		val t = tm_of_z_tm tm;
	in
		new_λ_defn (dec, pred, t)
	end
) | tm_of_z_tm (term as ZTmμ1 sch) = (
	let	val (tm', ty') = make_chartuple sch;
		val (dec, opred) = tm_of_z_schtext sch;
		val pred = case opred of
			Nil => mk_z_true
			|Value zp => zp;
		val t = tm_of_z_tm tm';
	in
		new_μ_defn (dec, pred, t)
	end
) | tm_of_z_tm (term as ZTmμ2 (sch, tm)) = (
	let	val (dec, opred) = tm_of_z_schtext sch;
		val pred = case opred of
			Nil => mk_z_true
			|Value zp => zp;
		val t = tm_of_z_tm tm;
	in
		new_μ_defn (dec, pred, t)
	end
) | tm_of_z_tm (term as ZTmPredContext tm) = (
	tm_of_z_tm tm
) | tm_of_z_tm (term as ZTmTruth true) = (
	mk_z_true
) | tm_of_z_tm (term as ZTmTruth false) = (
	mk_z_false
) | tm_of_z_tm (term as ZTm¬⋎F tm) = (
	mk_z_¬ (tm_of_z_tm tm)
) | tm_of_z_tm (term as ZTmLogInOp⋎F (inop, tm1, tm2)) = (
	let	val htm1 = tm_of_z_tm tm1;
		val htm2 = tm_of_z_tm tm2;
	in
		case inop of
		ZLogInOp∧ _ => mk_z_∧ (htm1, htm2)
		|ZLogInOp∨ _ => mk_z_∨ (htm1, htm2)
		|ZLogInOp⇒ _ => mk_z_⇒ (htm1, htm2)
		|ZLogInOp⇔ _ => mk_z_⇔ (htm1, htm2)
		|ZLogInOpSemi => mk_z_∧ (htm1, htm2)
	end
) | tm_of_z_tm (term as ZTmQuant⋎F (quant, sch, tm)) = (
	let	val (dec, opred) = tm_of_z_schtext sch;
		val pred = case opred of
			Nil => mk_z_true
			|Value zp => zp;
		val t = tm_of_z_tm tm;
	in
		case quant of
		ZQuant∃ _ => mk_z_∃ (dec, pred, t)
		|ZQuant∀ _ => mk_z_∀ (dec, pred, t)
		|ZQuant∃⋎1 _ => new_∃⋎1_defn (dec, pred, t)
	end
=TEX
=SML
) | tm_of_z_tm (term as ZTmSchemaPred tm) = (
	mk_z_schema_pred (tm_of_z_tm tm, "")
) | tm_of_z_tm (term as ZTmHorizSchema sch) = (
	let	val (dec, opred) = tm_of_z_schtext sch;
		val pred = case opred of
			Nil => mk_z_true
			|Value zp => zp;
	in
		new_⋎s_defn (dec, pred)
	end
) | tm_of_z_tm (term as ZTmDecor (tm, d, _)) = (
	new_decor⋎s_defn (tm_of_z_tm tm, d)
) | tm_of_z_tm (term as ZTmPre tm) = (
	new_pre⋎s_defn (tm_of_z_tm tm)
) | tm_of_z_tm (term as ZTm¬⋎S tm) = (
	mk_z_¬⋎s (tm_of_z_tm tm)
) | tm_of_z_tm (term as ZTmLogInOp⋎S (inop, tm1, tm2)) = (
	let	val htm1 = tm_of_z_tm tm1;
		val htm2 = tm_of_z_tm tm2;
	in
		new_dyop⋎s_defn inop (htm1, htm2)
	end
) | tm_of_z_tm (term as ZTm↾ (tm1, tm2)) = (
	 new_↾⋎s_defn (tm_of_z_tm tm1, tm_of_z_tm tm2)
) | tm_of_z_tm (term as ZTmHide (tm, idl)) = (
	 new_hide⋎s_defn (tm_of_z_tm tm, map string_of_ident idl)
) | tm_of_z_tm (term as ZTmQuant⋎S (quant, sch, tm)) = (
	let	val (dec, opred) = tm_of_z_schtext sch;
		val pred = case opred of
			Nil => mk_z_true
			|Value zp => zp;
		val t = tm_of_z_tm tm;
	in
		new_quant⋎s_defn quant (dec,pred,t)
	end
=TEX
=SML
) | tm_of_z_tm (term as ZTmΔ tm) = (
	new_Δ⋎s_defn (tm_of_z_tm tm)
) | tm_of_z_tm (term as ZTmΞ tm) = (
	 new_Ξ⋎s_defn (tm_of_z_tm tm)
) | tm_of_z_tm (term as ZTmEq (tm1, tm2)) = (
	mk_z_eq (tm_of_z_tm tm1, tm_of_z_tm tm2)
) | tm_of_z_tm (term as ZTm∈ (tm1, tm2)) = (
	mk_z_∈ (tm_of_z_tm tm1, tm_of_z_tm tm2)
) | tm_of_z_tm (term as ZTm⨾ (tm1, tm2)) = (
	 new_⨾⋎s_defn (tm_of_z_tm tm1, tm_of_z_tm tm2)
) | tm_of_z_tm (term as ZTmPipe (tm1, tm2)) = (
	fail "tm_of_z_tm" 63002 [fn()=>"schema piping"]
) | tm_of_z_tm (term as ZTmℤ i) = (
	mk_z_int (string_of_integer i)
) | tm_of_z_tm (term as ZTmString s) = (
	mk_z_string s
) | tm_of_z_tm (term as ZTmFloat (x, p, e)) = (
	mk_z_float (mk_nat x, mk_nat p, mk_exp e)
) | tm_of_z_tm (term as ZTmLVar (id, Value ty, tml)) = (
	mk_z_lvar (string_of_ident id, type_of_z_extype ty, list_tm_of_z_tm tml)
) | tm_of_z_tm (ZTmLVar (_, Nil, _)) = (
		fail "tm_of_z_tm" 63001 []
) | tm_of_z_tm (term as ZTmGVar (id, Value ty, tml)) = (
let	val gv = string_of_ident id;
	val ty' = type_of_z_extype ty;
in
	case gv of
	"Totality" => mk_const (gv, ty')
	|_ =>
		mk_z_gvar (gv, ty', list_tm_of_z_tm tml)
end
) | tm_of_z_tm (ZTmGVar (_, Nil, _)) = (
	fail "tm_of_z_tm" 63001 []
) | tm_of_z_tm (term as ZTmLet (ds, b)) = (
	let	val defs = map (string_of_ident ** tm_of_z_tm) ds;
		val body = tm_of_z_tm b;
	in	new_let_defn (defs, body)
	end
) | tm_of_z_tm (term as ZTmRename (tm, ididl)) = (
let	val term = tm_of_z_tm tm;	
	val s = map (fn (id1, id2) =>
			(string_of_ident id1, string_of_ident id2)) ididl
in
	new_renaming_defn (term, s)
end
) | tm_of_z_tm (term as ZTmBracketed tm) = (
	tm_of_z_tm tm
) | tm_of_z_tm (term as (ZTmQuotation (tm, Value exty))) = (
	let	val nltyl = map dest_var (frees tm);
		val ty' = type_of_z_extype exty;
		val tyl = map snd nltyl;
		val ty = mk_ctype("", type_of tm :: tyl);
		val tm' = inst [] (type_match ty' ty) tm
			handle Fail msg => fail "tm_of_z_tm" 63004 [];
	in	tm'
	end
) | tm_of_z_tm (term as (ZTmQuotation (tm, Nil))) = (
		fail "tm_of_z_tm" 63001 [])
=TEX
=SML
and ⦏list_tm_of_z_tm⦎ ((tm::tml) : Z_TM list) : TERM list = (
	(tm_of_z_tm tm)::(list_tm_of_z_tm tml)
)
  | list_tm_of_z_tm [] = [];
=TEX
\subsection{Global Variable Capture}
=SML
fun ⦏do_gvar_subst⦎ (tm : TERM) : TERM = (
	subst (gvar_subst tm) tm
);
=TEX
\section{DEFINING TYPES INSERTED BY THE TYPE INFERRER}
=SML
fun ⦏type_defn_of_z_extype⦎ (ety as ExType(_, args) : EXTYPE) : unit = (
	gen_z_semantic_type ety;
	map type_defn_of_z_extype args;
	()
) | type_defn_of_z_extype _ = ();
=TEX
=SML
fun ⦏do_types_to_define⦎ (x : 'a) : 'a = (
	map type_defn_of_z_extype (get_types_to_define());
	x
);
=TEX
\section{INTERFACES}
=SML
val ⦏term_of_z_dec⦎ : Z_DEC -> TERM = do_gvar_subst o tm_of_z_dec o do_types_to_define;
val ⦏list_term_of_z_dec⦎ : Z_DEC list -> TERM = do_gvar_subst o list_tm_of_z_dec o do_types_to_define;
val ⦏term_of_z_schtext⦎ : Z_SCH_TEXT -> TERM * TERM OPT = (fn tm =>
	case tm_of_z_schtext tm of
		(t1, Nil) => (do_gvar_subst t1, Nil)
	|	(t1, Value t2) => (do_gvar_subst t1, Value(do_gvar_subst t2))
) o do_types_to_define;
val ⦏term_of_z_tm⦎ : Z_TM -> TERM = do_gvar_subst o tm_of_z_tm o do_types_to_define;
val ⦏list_term_of_z_tm⦎ : Z_TM list -> TERM list = map do_gvar_subst o list_tm_of_z_tm o do_types_to_define;
=TEX

\section{EPILOGUE}
=SML
end (* local ... in *);
end (* of structure ZTermGenerator *);
=TEX

\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}


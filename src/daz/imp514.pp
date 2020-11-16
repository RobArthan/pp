=IGN
********************************************************************************
imp514.doc: this file is part of the PPDaz system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% imp514.doc   ℤ $Date: 2010/02/11 17:10:59 $ $Revision: 1.26 $ $RCSfile: imp514.doc,v $
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

\def\Title{Implementation: Compliance Notation (Volume II) Types}

\def\AbstractText{This document contains the implementation for the automatic generation of a structure containing the Compliance Notation Types defined in Volume II of DRA/CIS/CSE3/TR/94/27/3.0.}

\def\Reference{ISS/HAT/DAZ/IMP514}

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
%% LaTeX2e port: \documentstyle[hol1,11pt,TQ]{article}
%% LaTeX2e port: \ftlinepenalty=9999
\def\Hide#1{}
\def\Bool{``$\it{:}bool\,$''}
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{DAZ PROJECT}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Implementation: Compliance Notation (Volume II) Types}  %% Mandatory field
%% LaTeX2e port: \TPPref{ISS/HAT/DAZ/IMP514}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.26 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2010/02/11 17:10:59 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: %\TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{D.J.~King & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & HAT Team}
%% LaTeX2e port: \TPPabstract{This document contains the implementation for the automatic generation of a structure containing the Compliance Notation Types defined in Volume II of DRA/CIS/CSE3/TR/94/27/3.0.}
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

\item[Issue 1.1 (1994/04/27)] Initial Draft.
\item[Issue 1.2 (1994/05/27) (27th May 1994)] First draft for comment.
\item[Issue 1.4 (1997/08/18)] Updated references.
\item[Issue 1.5 (2001/12/12)] Accommodated use of signature inclusion for Poly/ML port.
\item[Issue 1.6 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.7 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.8 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issues 1.9 (2004/06/20)-1.17 (2004/07/18)] Reform of the Environments.
\item[Issue 1.18 (2004/09/01)] Support for multiple use clauses for the same package.
\item[Issue 1.19 (2005/09/15)] Fix for type inference of aliases.
\item[Issue 1.20 (2006/03/17)] Fixed bug in getting types from the theory hierarchy.
\item[Issue 1.21 (2006/03/18)] Aliasing in pre- and post-conditions is now only supported for Ada variables (not constants etc.).
\item[Issue 1.22 (2006/03/24)] Added variant of {\em env\_of\_env\_dict}.
\item[Issue 1.23 (2006/04/07)] Fixed {\em set\_cn\_scope}.
\item[Issue 1.24 (2007/05/26)] Child packages.
\item[Issue 1.26 (2010/02/11)] Now uses same sieveview file as HOL and Z.
\item[Issue 1.27 (2012/02/05)] Fixed SML/NJ incompatibility.
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
This document contains the implementation for automatically generating the structure for Volume II types.

The detailed design for this material is in \cite{ISS/HAT/DAZ/DTD514}.
\subsection{Introduction}
\subsection{Purpose and Background}
See \cite{ISS/HAT/DAZ/DTD514}.
\subsection{Possible Enhancements}
None.
=TEX
\section{PREAMBLE}
=TEX
=SH
sieve -u -f holutf8.svf imp <dtd514.pp | \
	sed \
	-e '/^signature/d' \
	-e '/^include/d' \
	-e '/^type.*ENV_DICT/d' \
	-e '/^val/d' \
	-e '/^end.*signature/s/signature/structure/' \
		>imp514.inc
=TEX
=SML
structure CNTypes2 : CNTypes2 = struct
open    CNBasicDeclsAndExprs;
=TEX
=SML
datatype ⦏ENV_DICT⦎ = EnvDict of {
	infos : ENV_INFO E_DICT,
	ti_cxt : TYPE E_DICT,
	local_vars : {
		vc_vars : Z_ID list,
		vc_pars : Z_ID list,
		vc_aux_vars : Z_ID list,
		vc_log_cons : Z_ID list},
	cn_scope : unit E_DICT OPT,
	used_packages : ID list};
(*
=TEX
=SML
*)
val ⦏initial_infos⦎ : ENV_INFO E_DICT = list_e_enter initial_e_dict (
	open_theory "cn";
	let	fun not_a_basic_type t = not
			(type_of t =: type_of ⓩℤ⌝ orelse type_of t =: type_of ⓩℝ⌝);
		fun name_of t =  let val (n,_,_) = dest_z_gvar t in n end;
		val extras = [ⓩSTRING⌝];
		val tms_to_do = extras term_union (get_consts"cn" drop not_a_basic_type);
		fun do_1_tm t = (
			let	val n = name_of t;
			in	(n,
					{tipe = Value (type_of t),
					canon_name = n,
					info = EIEnvOtherType,
					private = false})
			end
		)
	in	map do_1_tm tms_to_do
	end
);
(*
=TEX
=SML
*)
val ⦏initial_env_dict⦎ : ENV_DICT = EnvDict {
	infos = initial_infos,
	ti_cxt = initial_e_dict,
	local_vars = {
		vc_vars = [],
		vc_pars = [],
		vc_aux_vars = [],
		vc_log_cons = []},
	cn_scope = Nil,
	used_packages = []
};
(*
=TEX
=SML
*)
fun ⦏add_to_env_dict⦎
	(EnvDict{infos, ti_cxt, local_vars, cn_scope, used_packages} : ENV_DICT)
	(new :ENV_INFO S_DICT) :  ENV_DICT = (
	let	val infos' = list_e_enter infos new;
		open ZTypesAndTermsSupport;
		fun mk_ti_cxt acc [] = acc
		|    mk_ti_cxt acc ((n, {tipe, info as EIEnvVar _, canon_name, ...} : ENV_INFO):: more) = (
			if	n = canon_name
			then	let	val ty = force_value tipe;
					val entries = [(n, ty), (n ^ "⋎0", ty)];
				in	mk_ti_cxt (list_e_enter acc entries) more
				end	handle Fail _ => fail "add_to_env_dict" 514001 [fn _ => n]
			else	mk_ti_cxt acc more
		) |  mk_ti_cxt acc ((n, {tipe, info as EIEnvAuxVar _, ...}):: more) = (
			let	val ty = force_value tipe;
				val entries = [(n, ty), (n ^ "⋎0", ty)];
			in	mk_ti_cxt (list_e_enter acc entries) more
			end	handle Fail _ => fail "add_to_env_dict" 514001 [fn _ => n]
		) |  mk_ti_cxt acc ((n, {tipe, info as EIEnvLogCon _, ...}):: more) = (
			mk_ti_cxt (e_enter n (force_value tipe) acc) more
			handle Fail _ => fail "add_to_env_dict" 514001 [fn _ => n]
		) |  mk_ti_cxt acc (_ :: more) = (
			mk_ti_cxt acc more
		);
		fun grow_scope _ Nil = Nil
		|     grow_scope n (Value dict) = Value (e_enter n () dict);
		fun add_local_vars scope acc ([] : ENV_INFO S_DICT) = (scope, acc)
		|     add_local_vars scope {vc_vars, vc_pars, vc_aux_vars, vc_log_cons}
				((n, {info as EIEnvVar {kind = VKPar _, ...}, canon_name, ...} : ENV_INFO):: more) = (
			add_local_vars (grow_scope n scope) {
				vc_vars = vc_vars,
				vc_pars =
				if	n = canon_name
				then	n :: vc_pars
				else	vc_pars,
				vc_aux_vars = vc_aux_vars,
				vc_log_cons = vc_log_cons} more
		) |  add_local_vars scope {vc_vars, vc_pars, vc_aux_vars, vc_log_cons}
				((n, {info as EIEnvVar _, canon_name, ...} : ENV_INFO):: more) = (
			add_local_vars (grow_scope n scope) {
				vc_vars =
				if	n = canon_name
				then	n :: vc_vars
				else	vc_vars,
				vc_pars = vc_pars,
				vc_aux_vars = vc_aux_vars,
				vc_log_cons = vc_log_cons} more
		) |   add_local_vars scope {vc_vars, vc_pars, vc_aux_vars, vc_log_cons}
				((n, {info as EIEnvAuxVar _, ...}):: more) = (
			add_local_vars (grow_scope n scope) {
				vc_vars = vc_vars,
				vc_pars =vc_pars,
				vc_aux_vars = n :: vc_aux_vars,
				vc_log_cons = vc_log_cons} more
		) |  add_local_vars scope {vc_vars, vc_pars, vc_aux_vars, vc_log_cons}
				((n, {info as EIEnvLogCon _, ...}):: more) = (
			add_local_vars (grow_scope n scope) {
				vc_vars = vc_vars,
				vc_pars =vc_pars,
				vc_aux_vars = vc_aux_vars,
				vc_log_cons = n :: vc_log_cons} more
		) | add_local_vars scope acc ((n, _)::more) = (
			add_local_vars (grow_scope n scope) acc more
		);
		val ti_cxt' = mk_ti_cxt ti_cxt new;
		val (cn_scope', local_vars') = add_local_vars cn_scope local_vars new;
	in	EnvDict {
			infos = infos',
			ti_cxt = ti_cxt',
			local_vars = local_vars',
			cn_scope = cn_scope',
			used_packages = used_packages}
	end
);
(*
=TEX
=SML
*)
fun ⦏delete_from_env_dict⦎
	(EnvDict ed: ENV_DICT)
	(zns : Z_ID list) :  ENV_DICT = (
	let	fun aux (zn, {
			infos,
			ti_cxt,
			local_vars = {vc_vars, vc_pars, vc_aux_vars, vc_log_cons},
			cn_scope,
			used_packages}) = (
			{infos = e_delete zn infos,
			ti_cxt = e_delete zn ti_cxt,
			local_vars = {
				vc_vars = vc_vars less zn,
				vc_pars = vc_pars less zn,
				vc_aux_vars = vc_aux_vars less zn,
				vc_log_cons = vc_log_cons less zn},
			cn_scope = (case cn_scope of
					Value d => Value(e_delete zn d)
				|	Nil => Nil),
			used_packages = used_packages}
		);
	in	EnvDict (fold aux zns ed)
	end
);
(*
=TEX
=SML
*)
fun ⦏set_cn_scope⦎
	(ed as EnvDict {ti_cxt, local_vars as {
			vc_vars, vc_pars, vc_aux_vars, vc_log_cons},
		used_packages, infos, cn_scope = _}: ENV_DICT)
	(zns : Z_ID list) : ENV_DICT = (
	let	val new_cn_scope = Value(list_e_enter initial_e_dict (map (fn zn => (zn, ())) zns));
		val new_zns = (((zns diff vc_vars) diff vc_pars)
				diff vc_aux_vars) diff vc_log_cons;
		fun aux zn = (
			(zn, force_value (e_lookup zn infos))
			handle Fail _ =>  fail "set_cn_scope" 514002 [fn () => zn]
		);
		val new_local_infos = map aux new_zns;
		val EnvDict{local_vars = {
				vc_vars = new_vc_vars,
				vc_pars = new_vc_pars,
				vc_aux_vars = new_vc_aux_vars,
				vc_log_cons = new_vc_log_cons
			}, ...} =
			add_to_env_dict initial_env_dict new_local_infos;
	in	EnvDict {
			infos = infos,
			ti_cxt = ti_cxt,
			local_vars = {
				vc_vars = vc_vars @ new_vc_vars,
				vc_pars = vc_pars @ new_vc_pars,
				vc_aux_vars = vc_aux_vars @ new_vc_aux_vars,
				vc_log_cons = vc_log_cons @ new_vc_log_cons},
			cn_scope = new_cn_scope,
			used_packages = used_packages}
	end
);
(*
=TEX
=SML
*)
fun ⦏get_cn_scope⦎
	(EnvDict{infos = _, ti_cxt = _, local_vars = _,
		cn_scope = Value g, used_packages = _} : ENV_DICT)
	: Z_ID list OPT = (
	Value(map fst (e_flatten g))
) | get_cn_scope _ = Nil;
(*
=TEX
In the following {\em aux} maps the {\em kind} into ``out of scope'' if the {|em cn\_scope} is not nil and doesn't contain the name we're looking for. This supports the {\em subprog\_flatten\_env} operation of the volume I of the specification.
If the name we're looking for isn't in the {\em infos} dictionary,
=SML
*)
fun ⦏env_of_env_dict_aux⦎ (use_gct : bool)
	(EnvDict{infos = infos, ti_cxt = _, local_vars = _,
		cn_scope = cn_scope, used_packages = _} : ENV_DICT)
	 : CN_ENV = (
let	fun aux (Value g) zn = (
		case e_lookup zn infos of
			res as (Value {canon_name, info as EIEnvVar {tmark, ...}, tipe, private}) => (
				case e_lookup canon_name g of
					Value _ => res
				|	Nil =>  Value {
						canon_name = canon_name,
						info = EIEnvVar{
							tmark = tmark,
							kind = VKOutOfScope
						},
						tipe = tipe,
						private = private}
		) |	res as (Value {canon_name, info as EIEnvAuxVar {decl, ...}, tipe, private}) => (
				case e_lookup canon_name g of
					Value _ => res
				|	Nil =>  Value {
						canon_name = canon_name,
						info = EIEnvAuxVar{
							decl = decl,
							in_scope = false
						},
						tipe = tipe,
						private = private}
		) |	other => other
	) | aux Nil zn = e_lookup zn infos;
	open ZTypesAndTermsSupport;
in	fn zn =>
	case aux cn_scope zn of
		res as (Value {tipe = Value _, ...}) => res
	|	res as (Value {tipe = Nil, canon_name, info, private = private}) => (
		let	val hol_name =  bind_gvar_name canon_name;
		in	Value{
				tipe = get_const_type hol_name,
				canon_name = canon_name,
				info = info,
				private = private}
		end		
	) |	Nil => (
		if	use_gct
		then	let	val hol_name =   bind_gvar_name zn;
			in	case get_const_type hol_name of
					Value ty => Value {
							tipe = Value ty,
							canon_name = zn,
							info = EIEnvOther,
							private = false}
				|	Nil => Nil
			end
		else	Nil
	)
end);
=TEX
=SML
val ⦏env_of_env_dict⦎ : ENV_DICT -> CN_ENV = env_of_env_dict_aux true;
val ⦏env_of_env_dict1⦎ : ENV_DICT -> CN_ENV = env_of_env_dict_aux false;
(*
=TEX
=SML
*)
fun ⦏flatten_env_dict⦎
	(EnvDict{infos = infos, ti_cxt = _, local_vars = _,
		cn_scope = _, used_packages = _} : ENV_DICT)
	: ENV_INFO S_DICT = (
	e_flatten infos
);
(*
=TEX
=SML
*)
fun ⦏ti_context_of_env_dict⦎
	(EnvDict{infos = _, ti_cxt = ti_cxt, local_vars = _,
		cn_scope = _, used_packages =_} : ENV_DICT)
	: TYPE E_DICT = (
	ti_cxt
);
(*
=TEX
=SML
*)
fun ⦏new_scope_env_dict⦎
	(EnvDict{infos, ti_cxt, local_vars = _, cn_scope, used_packages} : ENV_DICT)
	: ENV_DICT = (
	EnvDict{
		infos = infos,
		ti_cxt = ti_cxt,
		local_vars = {
			vc_vars = [],
			vc_pars = [],
			vc_aux_vars = [],
			vc_log_cons = []},
		cn_scope = cn_scope,
		used_packages = used_packages}
);
(*
=TEX
=SML
*)
fun ⦏get_local_vars⦎
	(EnvDict{infos = _, ti_cxt = _, local_vars = local_vars,
		cn_scope = _, used_packages = _} : ENV_DICT)
	:	{vc_vars : Z_ID list,
		vc_pars : Z_ID list,
		vc_aux_vars : Z_ID list,
		vc_log_cons : Z_ID list} = (
	local_vars
);
(*
=TEX
=SML
*)
fun ⦏get_used_packages⦎
	(EnvDict{infos = _, ti_cxt = _, local_vars =_,
		cn_scope = _, used_packages = used_packages} : ENV_DICT)
	:	ID list = (
	used_packages
);
(*
=TEX
=SML
*)
fun ⦏add_used_package⦎
	(EnvDict{infos, ti_cxt, local_vars, cn_scope, used_packages} : ENV_DICT)
	(pack_id : ID)
	:	ENV_DICT = (
	EnvDict {
		infos = infos,
		ti_cxt = ti_cxt,
		local_vars = local_vars,
		cn_scope = cn_scope,
		used_packages = used_packages grab pack_id}
);
=TEX
=INCLUDE
imp514.inc
=TEX
\small
\twocolumn[\section{INDEX}]
\printindex
\end{document}


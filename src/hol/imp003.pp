=IGN
********************************************************************************
imp003.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  imp003.doc  ℤ $Date: 2009/09/13 12:06:27 $ $Revision: 2.36 $ $RCSfile: imp003.doc,v $
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

\def\Title{Implementation for Types and Terms}

\def\AbstractText{}

\def\Reference{DS/FMU/IED/IMP003}

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
%% LaTeX2e port: \TPPproject{FST PROJECT}  %% Mandatory field
%% LaTeX2e port: \TPPtitle{Implementation for Types and Terms}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Implementation for Types and Terms}
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP003}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 2.36 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2009/09/13 12:06:27 $%
%% LaTeX2e port: }}  %% Mandatory field
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.~Blackburn & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	    Project Library
%% LaTeX2e port: }}
%% LaTeX2e port: %\TPPclass{CLASSIFICATION}
%% LaTeX2e port: %\def\TPPheadlhs{}
%% LaTeX2e port: %\def\TPPheadcentre{}
%% LaTeX2e port: %def\TPPheadrhs{}
%% LaTeX2e port: %\def\TPPfootlhs{}
%% LaTeX2e port: %\def\TPPfootcentre{}
%% LaTeX2e port: %\def\TPPfootrhs{}
%% LaTeX2e port: \begin{document}
%% LaTeX2e port: \makeTPPfrontpage
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
\pagebreak
\section{DOCUMENT CONTROL}
\subsection{Contents List}
\tableofcontents
\subsection{Document Cross References}
\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes History}
\begin{description}
\item [Issues 1.1 (1991/01/28) to 1.20 (1991/09/04)]
First drafts.
\item [Issue 1.21 (1991/11/07)]
Changes in reaction to deskcheck ID0090.
\item [Issue 2.1 (1991/11/11) (11th October 1991)]
Approved version of issue 1.21.
\item [Issue 2.2 (1991/12/11),2.3 (1991/12/11),2.4 (1991/12/12) (11th October 1991)]
Reimplemented some functions by ``failure''.

\item[Issue 2.5 (1992/01/20) \FormatDate{92/01/20} ] Updated to use new fonts.
\item [Issue 2.6 (1992/02/10)\FormatDate{92/02/10} ]
Put $translate\_for\_output$ around uses of $makestring$.
\item [Issue 2.7 (1992/04/09) (1st April 1992)]
Changes required by CR0016.
\item[Issue 2.8 (1992/06/01)]
	Do not do any calls of $translate\_for\_output$, undo change~2.6.
\item [Issue 2.9 (1992/07/02),2.10 (1992/07/03), 2.11 (1992/07/07) (2nd July 1992)]
Improve (?) $pp'subst$.
\item [Issue 2.12 (1992/08/12) (12th August 1992)]
Error handling bug in $pp'subst$.
\item [Issue 2.13 (1992/08/12)] Attempted optimisation of $pp'frees$.
\item [Issue 2.14 (1993/01/07) (7th January 1993)]
Removed incorrect description of $TYPE$.
\item [Issue 2.15 (1999/02/11) (11th February 1996)]
\item [Issue 2.16 (1999/03/06)] Use of new INTEGER type.
Updates for SML'97.
\item [Issue 2.17 (2001/07/24)] Optimised instantiation and substitution operations in cases where
the instantiation or substitution lists are effectively empty (as happens surprisingly
often, e.g., in the conversions that move negation through quantifiers).
\item [Issues 2.18 (2001/07/25), 2.19 (2001/07/26)] Addressed performance problem in {\it pp'subst}.
\item [Issue 2.20 (2001/07/28)] More minor performance upgrades.
\item [Issue 2.21 (2001/08/16)] Some tidying up and further optimisation of the term matching and
substitution functions.
\item [Issue 2.22 (2002/06/04)] Now uses a string store --- this makes it stateful, but the system
initialisation module can hide that from the user.
\item[Issue 2.23 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 2.24 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 2.25 (2005/03/20)] Fixed error in {\em inst}.
\item[Issue 2.26 (2005/04/27)] Minor tidy-up to string-handling.
\item[Issue 2.27 (2005/09/02)--2.29 (2005/09/05)] Now uses string table for long and short identifiers alike; versions of constructors and destructors for compound types and constants using keys instead of string names are now provided.
\item[Issue 2.30 (2005/12/16)] The prefix for private interfaces is now $pp'$ rather than $icl'$.
\item[Issue 2.31 (2006/11/14)] Performance experiment on $mk\_app$ and $unchecked\_mk\_app$.
\item[Issue 2.32 (2006/12/09)] The types of object language types and terms are now equality types.
\item[Issue 2.33 (2007/05/30)] Fixed SML/NJ incompatibility resulting from change to types of types and terms.
\item[Issue 2.34 (2007/09/06)] Decimal literals are no longer cached in the string store.
The state of the string store can now also be extracted for diagnostic purposes.
\item[Issue 2.35 (2008/11/18)] The algorithm for {\em pp'subst} now raises exceptions internally to avoid rebuilding parts of the term that are unchanged by the substitution.
\item[Issue 2.36 (2009/09/13)] Added $type\_match1$ (used in higher-order matching).
\item[Issue 2.37 (2012/02/21)] Added $list\_string\_variant$.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
% \subsection{Changes Forecast}
\section{GENERAL}
\subsection{Scope}
This document contains an implementation of the types and terms of ICL HOL.
The design is given in \cite{DS/FMU/IED/DTD003}.
\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains an implementation of the types and terms of ICL HOL, and functions to handle them.
\subsubsection{Dependencies}
This document takes its signature from \cite{DS/FMU/IED/DTD003}.
\subsubsection{Deficiencies}
None known.
\subsubsection{Possible Enhancements}
None known.
\section{TYPES AND TERMS}
=SML
=TEX
=SML
structure ⦏pp'TypesAndTerms⦎ : pp'TypesAndTerms = struct
=TEX
\newpage
\subsection{An Exception}
We want an arbitrary $Fail$ exception, to save on creating new
values at need.
Its use (by $raise$ $just\_fail$) breaks the conventions for error handling described in
\cite{DS/FMU/IED/IMP002}, which would have errors only raised by $fail$, $error$, etc.
The conventions are broken to assist in efficiently implementing, e.g., $pp'inst$
by propagating exceptions in the cases of ``no change'',
where we wish to raise an exception will be always be caught,
but are unbothered by the contents.
If we used $fail$ then time and store would be spent in creating an exception
that would never be examined.
We do however want the failure to match $(Fail$ $\_)$, as the
functions using this also see errors raised by, e.g. $lassoc3$.
=SML
val ⦏just_fail⦎ = fail "just_fail" 3064  [] handle complaint => complaint;
=TEX
\subsection{Utilities}
This section contains material required for the abstract data
types, but which don't need including within them.
=SML
local
	val ⦏variant_suffix⦎ : string ref = ref "'";
	val side_effect = (
		new_string_control
		{name="variant_suffix",
		control=variant_suffix,
		default = (fn () => "'"),
		check = (fn s => if s = ""
			then fail "variant_suffix" 3028 []
			else true)}
	);

in
fun ⦏set_variant_suffix⦎ (s : string) : string = (
	set_string_control("variant_suffix",s)
);

fun ⦏get_variant_suffix⦎ (():unit) : string = (
	!variant_suffix
);

fun ⦏string_variant⦎ (vars : string list) (s : string) : string = (
	if s mem vars
	then string_variant vars (s ^ (!variant_suffix))
	else s
);
end; (* of local *)
=TEX
=SML
fun ⦏list_string_variant⦎ (avoid : string list) (ss : string list) : string list = (
	let	fun aux (s, (av, res)) = (
			let	val s' = string_variant av s;
			in	(s'::av, s'::res)
			end
		);
	in	rev(snd (revfold aux ss (avoid, [])))
	end
);
=TEX
\subsection{Types}
The local type $ID$ is the internal representation of a type or constant name.
Names are represented as efficient dictionary keys.
=SML
type ⦏ID⦎ = E_KEY;
=TEX
If the compiler allows it, we use a {\tt local in end} block to enforce the
hiding of the constructors of the type of HOL types in addition to the signature
constraint.
(This doesn't work with SML/NJ which won't let you install a pretty-printer if you
expose the types via a type abbreviation).
=POLYML
local
=SML
datatype ⦏TYPE⦎ =
	⦏LVartype⦎ of string |
	⦏LCtype⦎ of ID * TYPE list |
	⦏L→Type⦎ of (TYPE * TYPE)
and ⦏TYPES_AND_TERMS_STATE⦎  =
	⦏State⦎ of E_KEY E_DICT ref;
=POLYML
in
=TEX
Expose the type if we are using a {\tt local in end} block to enforce the
hiding.
=POLYML
type ⦏TYPE⦎ = TYPE;
=SML
type ⦏TYPES_AND_TERMS_STATE⦎ = TYPES_AND_TERMS_STATE;
=TEX
Management of the state:
=SML
	val ⦏current_state⦎ : E_KEY E_DICT ref ref = ref (ref initial_e_dict);
	fun ⦏new_types_and_terms_state⦎ (() : unit) : TYPES_AND_TERMS_STATE = (
		let	val new_ref_dict = ref(!(!current_state));
		in	State new_ref_dict
		end
	);
	fun ⦏set_types_and_terms_state⦎ (State ref_dict : TYPES_AND_TERMS_STATE)  : unit = (
		current_state := ref_dict
	);
	fun ⦏get_types_and_terms_state⦎ (():unit) : E_KEY E_DICT = (
		!(!current_state)
	);
=TEX
It saves a test and is harmless to treat the empty string as all numeric.
=SML
	fun ⦏all_numeric⦎ (s : string) : bool  = (
		let	val sz = size s;
			fun aux i = (
				i = sz
			orelse	let	val ch = String.sub(s, i);
				in		#"0" <= ch
					andalso	ch <= #"9"
					andalso	aux (i+1)
				end

			);
		in	aux 0
		end
	);
=TEX
Conversion between the internal and external representation of names.

=SML
	fun ⦏id_of_key⦎ (k : E_KEY)  : ID = (
		let	val s = string_of_e_key k;
		in	if	all_numeric s
			then	k
			else case e_key_lookup k (!(!current_state)) of
				Nil =>  (
					!current_state := e_key_enter k k (!(!current_state));
					k
			) |	Value k => (
				k
			)
		end
	);
	fun ⦏id_of_string⦎ (s : string)  : ID = (
		id_of_key (e_get_key s)
	);
	fun ⦏key_of_id⦎ (k : ID) : E_KEY = (
		force_value(e_key_lookup k (!(!current_state)))			handle Fail _ => k
	);
	fun ⦏string_of_id⦎ (k  : ID) : string = (
		string_of_e_key (key_of_id k)
	);
=TEX
=SML						
datatype ⦏DEST_SIMPLE_TYPE⦎ = ⦏Vartype⦎ of string |
 	⦏Ctype⦎ of (string * TYPE list);
=TEX
\subsection{Functions for Types}
The following is just for backwards compatibility.
=SML
val op ⦏=:⦎ : (TYPE * TYPE) -> bool = fn (x, y) => x = y;
=TEX
=SML
val ⦏pp'string_of_type_ref⦎ : (TYPE -> string) ref =
	ref (fn _ : TYPE => "<TYPE>");
fun ⦏pp'set_string_of_type⦎ (f : TYPE -> string) : TYPE -> string = (
	let	val res = !pp'string_of_type_ref;
	in	pp'string_of_type_ref := f;
		res
	end
);
fun ⦏string_of_type⦎ (ty : TYPE) : string = (
	! pp'string_of_type_ref ty
);
=TEX
We use the following function to give error messages including types.
=SML
fun ⦏type_fail⦎ (area : string) (msg : int) (tyl : TYPE list) : 'a = (
	fail area msg (map (fn ty => (fn () => string_of_type ty)) tyl)
);
=TEX
We force $mk\_ctype$ to produce function types when appropriate -
this ensures a single form for equal types.
=SML
fun ⦏mk_ctype⦎ (("→",[t1,t2]): string * TYPE list) : TYPE = L→Type(t1,t2)
| mk_ctype (c, tl) = LCtype (id_of_string c, tl);
=SML
fun ⦏key_mk_ctype⦎ ((k,tl as [t1,t2]): E_KEY * TYPE list) : TYPE = (
	if	string_of_e_key k = "→"
	then	L→Type(t1,t2)
	else	LCtype(id_of_key k, tl)
) | key_mk_ctype (k, tl) = LCtype (id_of_key k, tl);
=TEX
=SML
val ⦏mk_vartype⦎ : string -> TYPE = LVartype;
=TEX
=SML
val ⦏mk_→_type⦎ : (TYPE * TYPE) -> TYPE = L→Type;
=TEX
=SML
fun ⦏dest_ctype⦎ (LCtype (i, tl) : TYPE): string * TYPE list = (string_of_id i, tl)
| dest_ctype (L→Type (t1, t2)) = ("→", [t1, t2])
| dest_ctype varty = type_fail "dest_ctype" 3001 [varty];
=TEX
=SML
val ⦏→_key⦎ = e_get_key "→";
fun ⦏key_dest_ctype⦎ (LCtype (i, tl) : TYPE): E_KEY * TYPE list = (key_of_id i, tl)
| key_dest_ctype (L→Type (t1, t2)) = (→_key, [t1, t2])
| key_dest_ctype varty = type_fail "key_dest_ctype" 3001 [varty];
=TEX
=SML
fun ⦏dest_vartype⦎ ((LVartype s):TYPE) : string = s
 | dest_vartype cty = type_fail "dest_vartype" 3019 [cty];
=TEX
=SML
fun ⦏dest_→_type⦎ (L→Type t1t2 : TYPE) : TYPE * TYPE = t1t2
| dest_→_type ty = type_fail "dest_→_type" 3022 [ty];
=TEX
=SML
fun ⦏is_vartype⦎ ((LVartype _):TYPE) : bool = true
| is_vartype _ = false;
=TEX
=SML
fun ⦏is_ctype⦎ ((LVartype _):TYPE) : bool = false
| is_ctype _ = true;
=TEX
Types formed by $LCtype$ are only formed by $mk\_type$,
and therefore cannot be function types, as $mk\_type$
coerces these to being formed by $L→Type$.
=SML
fun ⦏is_→_type⦎ ((L→Type _):TYPE) : bool = true
| is_→_type _ = false;
=TEX
\subsection{Destroyed Types}
=SML
fun ⦏mk_simple_type⦎ (Vartype nm : DEST_SIMPLE_TYPE) : TYPE = LVartype nm
| mk_simple_type (Ctype ("→",[ty1,ty2])) = L→Type(ty1,ty2)
| mk_simple_type (Ctype (nm, tyl)) = LCtype (id_of_string nm, tyl);

fun ⦏dest_simple_type⦎ (LVartype nm : TYPE) : DEST_SIMPLE_TYPE = Vartype nm
| dest_simple_type (LCtype (id, tyl)) = Ctype (string_of_id id, tyl)
| dest_simple_type (L→Type (ty1,ty2)) = Ctype("→",[ty1,ty2]);
=TEX
\subsection{The Type of Truth Values}
=SML
val ⦏BOOL⦎ : TYPE = mk_ctype("BOOL", []);
=TEX
\subsection{Well-Formedness and the Type of Well-Formed Terms}
There is some choice for the
representation for well-formed terms.
At one extreme, we need only to know types in the leaves
of the expression trees --- this means we must recompute
the type of the term from scratch whenever we need it.
At the opposite extreme, we could keep type information
for every node in the tree --- but this might take
up a lot of space. We use a compromise which allows
the type of a term and its immediate subterms to
be computed using only simple combinations of information
available at the corresponding node.

The root of a term tree is always annotated with the type of
the term.
At nodes of a term tree other than the root,
type information is only given for applications
for which we give the type of the operand.
The local type $pp'TERM$ is introduced to allow this approach.

=SML
local
datatype ⦏pp'TERM⦎	 =
	⦏pp'Var⦎ of string |
	⦏pp'Const⦎ of ID |
	⦏pp'App⦎ of pp'TERM * pp'TERM * TYPE |
	⦏pp'Simpleλ⦎ of string * pp'TERM;
in
=TEX
As for the type of types, we use a {\tt local in end} block to enforce the
hiding of the constructors of the type of HOL terms in addition to the signature
constraint. (See above).
=POLYML
local
=SML
datatype ⦏TERM⦎ = typed of pp'TERM * TYPE;
=POLYML
in
=TEX
Expose the type if we are using a {\tt local in end} block to enforce the
hiding.
=POLYML
type ⦏TERM⦎ = TERM;
=TEX
The type of destroyed terms, and functions upon it:
=SML
datatype ⦏DEST_SIMPLE_TERM⦎ = ⦏Var⦎ of string * TYPE |
	⦏Const⦎ of string * TYPE |
	⦏App⦎ of TERM * TERM |
	⦏Simpleλ⦎ of TERM * TERM;
=TEX
The following is just for backwards compatibility.
=SML
val op ⦏=$⦎ : (TERM * TERM) -> bool = fn (x, y) => x = y;
=TEX
=SML
val ⦏pp'string_of_term_ref⦎ : (TERM -> string) ref =
	ref (fn _ : TERM => "<TERM>");
fun ⦏pp'set_string_of_term⦎ (f : TERM -> string) : TERM -> string = (
	let	val res = !pp'string_of_term_ref;
	in	pp'string_of_term_ref := f;
		res
	end
);
fun ⦏string_of_term⦎ (tm : TERM) : string = (
	! pp'string_of_term_ref tm
);
=TEX
We use the following function for giving error messages including terms.
=SML
fun ⦏term_fail⦎ (area : string) (msg : int) (tml : TERM list) : 'a = (
	fail area msg (map (fn tm => (fn () => string_of_term tm)) tml)
);
=TEX
We provide default clauses to catch cases where no match is made,
even when apparently unnecessary because of the supposed well-formedness of the terms.
This avoids annoying messages from the compiler, and would be marginally more informative
for a user if disaster ever befell the code.
=SML
fun ⦏dest_simple_term⦎ (typed vl:TERM) : DEST_SIMPLE_TERM = (
	case vl of
	(pp'App(t1, t2, ty2), tyt1t2) => (
		App (typed(t1, L→Type (ty2, tyt1t2)), typed(t2, ty2))
	) | (pp'Const id, ty) => Const (string_of_id id, ty)
	| (pp'Var nm, ty) => Var (nm, ty)
	| (pp'Simpleλ(nm, tm), L→Type(ty1, ty2)) => (
		Simpleλ (typed(pp'Var nm, ty1), typed(tm, ty2))
	) | _ => error "dest_simple_term" 3064 []
);
=TEX
=SML
fun ⦏mk_simple_term⦎ ((Var (s, ty)): DEST_SIMPLE_TERM) : TERM = typed(pp'Var s, ty)
| mk_simple_term (Const (s, ty)) = typed(pp'Const (id_of_string s), ty)
| mk_simple_term (App (ftm1 as typed(tm1, L→Type (ty1,ty2)), ftm2 as typed(tm2,ty3))) = (
	if (ty1 = ty3)
	then typed(pp'App(tm1, tm2, ty3), ty2)
	else term_fail "mk_simple_term" 3005 [ftm1, ftm2]
) | mk_simple_term (Simpleλ (typed(pp'Var s, ty1), typed(bdy, ty2))) = (
	typed(pp'Simpleλ(s, bdy), L→Type(ty1, ty2))
) | mk_simple_term (App (tm1,_)) = term_fail "mk_simple_term" 3006 [tm1]
| mk_simple_term (Simpleλ (tm1,_)) = term_fail "mk_simple_term" 3007 [tm1];
=TEX
=SML
fun ⦏type_of⦎ ((typed (_, ty)):TERM):TYPE = ty;
=TEX
=SML
fun ⦏mk_var⦎ ((s, ty):string * TYPE): TERM = typed (pp'Var s, ty);

fun ⦏dest_var⦎ ((typed (pp'Var s, ty)):TERM) : string * TYPE = (s, ty)
| dest_var tm = term_fail "dest_var" 3007 [tm];

fun ⦏is_var⦎ ((typed (pp'Var _, _)): TERM) : bool = true
| is_var _ = false;
=TEX
The following relies on the fact that the names of the constants
for equality, implication, universal quantification and existential
quantification have single character names. This means that the
test that these constants have the right types can be done by
an array (or rather, vector) look-up.
=SML
fun ⦏eq_check⦎ (ty : TYPE) : unit = (
	case ty of
		L→Type(ty1, L→Type(ty2,ty3)) => (
			if (ty1 = ty2) andalso (ty3 = BOOL)
			then ()
			else fail "mk_const" 3002 []
		) | _ => fail "mk_const" 3002 []
);
=TEX
=SML
fun ⦏⇒_check⦎ (ty : TYPE) : unit = (
	case ty of
		L→Type(ty1, L→Type(ty2, ty3)) => (
			if (ty1 = BOOL) andalso (ty2 = BOOL) andalso (ty3 = BOOL)
			then ()
			else fail "mk_const" 3003 []
		) | _ => fail "mk_const" 3003 []
);
=TEX
=SML
fun ⦏∀_∃_check⦎ (which : string) (ty : TYPE) : unit = (
	case ty of
		L→Type(L→Type(ty1, ty2),ty3) => (
			if (ty2 = BOOL) andalso (ty3 = BOOL)
			then ()
			else fail "mk_const" 3004 [fn ()=>which]
		) | _ => fail "mk_const" 3004 [fn ()=>which]
);
=TEX
=SML
fun ⦏other_check⦎ (_ : TYPE) : unit = ();
=TEX
=SML
val ⦏mk_const_checks⦎ : (TYPE -> unit) PPVector.vector = (
	PPVector.vector
	let	fun the_check "=" = eq_check
		|   the_check "⇒" = ⇒_check
		|   the_check "∀" = ∀_∃_check "∀"
		|   the_check "∃" = ∀_∃_check "∃"
		|   the_check _ = other_check;
	in	map (the_check o chr) (interval 0 255)
	end
);
=TEX
=SML
fun ⦏mk_const⦎((v, ty):string * TYPE): TERM = (
	let	val side =
			if	size v = 1
			then	PPVector.sub(mk_const_checks, ord v) ty
			else	();
	in	typed (pp'Const (id_of_string v), ty)
	end
);
=TEX
=SML
fun ⦏key_mk_const⦎((k, ty):E_KEY * TYPE): TERM = (
	let	val v = string_of_e_key k;
		val side =
			if	size v = 1
			then	PPVector.sub(mk_const_checks, ord v) ty
			else	();
	in	typed (pp'Const (id_of_key k), ty)
	end	handle ex as (Fail _) => reraise ex "key_mk_const"
);
=TEX
=SML
fun ⦏dest_const⦎ (tm as (typed (pp'Const id, ty)): TERM):string * TYPE = (string_of_id id, ty)
| dest_const tm = term_fail "dest_const" 3009 [tm];
=TEX
=SML
fun ⦏key_dest_const⦎ (tm as (typed (pp'Const id, ty)): TERM):E_KEY * TYPE = (key_of_id id, ty)
| key_dest_const tm = term_fail "key_dest_const" 3009 [tm];
=TEX
=SML
fun ⦏is_const⦎ ((typed (pp'Const _, _)): TERM):bool = true
| is_const _ = false;
=TEX
=SML
fun ⦏mk_app⦎((tm1 as typed(f, L→Type(ty1, ty2)), tm2 as typed(atm, aty)):
		TERM * TERM) : TERM = (
	if ty1 = aty
	then typed(pp'App(f, atm, ty1), ty2)
	else term_fail "mk_app" 3005 [tm1, tm2]
) | mk_app (tm1,_) = term_fail "mk_app" 3006 [tm1];

fun ⦏dest_app⦎ ((typed(pp'App(ftm, atm, aty), faty)): TERM) : TERM * TERM = (
	typed(ftm, L→Type(aty, faty)), typed(atm, aty)
) | dest_app tm = term_fail "dest_app" 3010 [tm];

fun ⦏is_app⦎ (typed(pp'App _, _)) = true
| is_app _ = false;
=TEX
In substitution and type instantiation (of terms), there is no need to make
the check on types that {\it mk\_app} makes. {\it uncheck\_mk\_app} supports
this optimisation.
=SML
fun ⦏unchecked_mk_app⦎
	((tm1 as typed(f, L→Type(ty1, ty2)), tm2 as typed(atm, _)):
		TERM * TERM) : TERM = (
	typed(pp'App(f, atm, ty1), ty2)
) | ⦏unchecked_mk_app⦎ _ = error "unchecked_mk_app" 3064 [];

=TEX
=SML
fun ⦏mk_simple_λ⦎ ((typed(pp'Var v, ty), typed(btm, bty)):TERM * TERM):TERM = (
	typed(pp'Simpleλ(v, btm), L→Type (ty, bty))
) | mk_simple_λ (tm1,_) = term_fail "mk_simple_λ" 3007 [tm1];

fun ⦏dest_simple_λ⦎ ((typed(pp'Simpleλ (s, b), L→Type(ty1,ty2))): TERM)
	: TERM * TERM = (
	(typed(pp'Var s, ty1), typed(b, ty2))
) | dest_simple_λ tm = term_fail "dest_simple_λ" 3011 [tm];

fun ⦏is_simple_λ⦎ (typed(pp'Simpleλ _, _)) = true
| is_simple_λ _ = false;
=TEX
\section{CRITICAL FUNCTIONS}
The functions in this section are critical for performance of the system.
Consequently, they are implemented inside the abstract data type of
terms so that they can access the internal representations of terms.
Thus they become critical for correctness as well!

\subsection{Computing Free Variables}

=SML
local
	fun ⦏fvaux⦎
		(bvs : (string * TYPE) list)
		(fvs : (string * TYPE) list)
		(pp'App(tm1, tm2, ty2) : pp'TERM)
		(ty1 : TYPE) : (string * TYPE) list = (
		case tm1 of
			pp'Const _ => (
			fvaux bvs fvs tm2 ty2
		) | _ => (
			fvaux bvs (fvaux bvs fvs tm1 (L→Type(ty2, ty1)))
			tm2 ty2
		)
	) | fvaux bvs fvs (pp'Const _) _ = fvs
	| fvaux bvs fvs (pp'Var s) ty = (
		if (s, ty) mem bvs
		then fvs
		else fvs grab (s,ty)
	) | fvaux bvs fvs (pp'Simpleλ (s, bdy)) (L→Type(ty1, ty2)) = (
		fvaux ((s, ty1) :: bvs) fvs bdy ty2
	) | fvaux _ _ _ _ = error "pp'frees" 3064 [];
in
	fun ⦏pp'frees⦎ (( typed(tm, ty)):TERM) : (string * TYPE) list = (
		fvaux [] [] tm ty
	);
end;
=TEX
The following is needed later on in the abstract data type.
It could possibly be made a little bit more efficient by
using the internal representation rather than the destructor functions.
In any case, it is significantly more efficient in space and
speed than using {\it pp'frees} when it is applicable.
=SML
fun ⦏is_free_var_in⦎ (vsvty as (vs, vty): string * TYPE) (tm : TERM) : bool = (
let	fun ifvi  (t as typed(pp'App _, _)) = (
		let	val (f, a) = dest_app t;
		in	 ifvi f  orelse ifvi a
		end
	) | ifvi  (typed(pp'Const _, _)) = false
	| ifvi  (typed(pp'Var s, ty)) = s = vs andalso ty = vty
	| ifvi  (typed(pp'Simpleλ (s, bdy), L→Type(aty, bty))) =  (
		not(s = vs andalso aty = vty)
		andalso ifvi  (typed(bdy,bty))
	) | ifvi _ = error "is_free_in" 3064 [];
in	ifvi  tm
end);
=TEX
=TEX
\subsection{α-conversion}
The auxiliary function below can be written more compactly but probably less efficiently
by doing all the pattern matching in the function binding
(and earlier versions of this code did just that).
However this might encourage the compiler to do four tests on mismatched structures.
The following slightly longer formulation avoids this small performance risk.
=SML
fun (tm1 : TERM) ⦏~=$⦎ (tm2 : TERM) : bool = (
let	fun aux (tm1 as typed(pp'App _, _)) tm2 = (fn map2to1 =>
			let	val (tm11, tm12) = dest_app tm1;
				val (tm21, tm22) = dest_app tm2;
			in	aux tm11 tm21 map2to1
				andalso
				aux tm12 tm22 map2to1
			end	handle Fail _ => false
	) | aux (tm1 as typed(pp'Const _, _)) tm2 = (fn _ =>
		tm1 = tm2
	)  | aux (tm1 as typed(pp'Var v1, ty1)) tm2 = (fn map2to1 =>
		case tm2 of
			(typed(pp'Var v2, ty2)) =>
				lassoc1 map2to1 (v1, ty1) = (v2, ty2)
				andalso
				rassoc1 map2to1 (v2, ty2) = (v1, ty1)
		|	_ => false
	) | aux (typed(pp'Simpleλ(v1,b1), L→Type(aty1, bty1))) tm2 = (fn map2to1 =>
		case tm2 of
			(typed(pp'Simpleλ(v2, b2), L→Type(aty2, bty2))) => (
				aty1 = aty2
				andalso
				aux (typed(b1, bty1)) (typed(b2, bty2))
				(((v1, aty1), (v2, aty2)) :: map2to1)
		) | _ => false
	) | aux _ _ = error "~=$" 3064 [];
 	in
		(tm1 = tm2) orelse (aux tm1 tm2 [])
	end
);
=TEX
\subsection{Substitution}
In the following, $RF$ is the local substitution --- this is the original substitution
updated as bound variables that need renaming are encountered to record the renamings.
In addition $RF$ records the precomputed free variables of the substitute terms.
These free variables are only computed when necessary and this is done imperatively.

Earlier versions of this code called (the predecessor of) {\it blackbox2} which in turn called
{\it pp'frees} whenever a $\lambda$-abstraction was encountered.
This is very inefficient on large terms containing many nested binders.
To improve this situation, the current code uses the following data
type to allow the necessary information to be computed in one extra
pass over each outermost $\lambda$-abstraction.
=SML
datatype ⦏FV_MAP⦎ =
		⦏Leaf⦎
	|	⦏AppNode⦎ of FV_MAP * FV_MAP
	|	⦏ΛNode⦎ of (string * TYPE) list * FV_MAP;
=TEX
=SML
local
	fun	⦏mk_app_node⦎ (Leaf : FV_MAP, Leaf : FV_MAP) : FV_MAP = Leaf
	|	mk_app_node (fvm1, fvm2) = AppNode(fvm1, fvm2);
	fun ⦏fvmaux⦎
		(pp'App(tm1, tm2, ty2) : pp'TERM)
		(ty1 : TYPE) : (string * TYPE) list * FV_MAP = (
		case tm1 of
			pp'Const _ => (
			let	val (fvs1, fvm1) = fvmaux tm2 ty2;
			in	(fvs1, mk_app_node(Leaf, fvm1))
			end
		) | _ => (
			let	val (fvs1, fvm1) = fvmaux tm1 (L→Type(ty2, ty1));
				val (fvs2, fvm2) = fvmaux tm2 ty2;
			in	(fvs1 cup fvs2, mk_app_node(fvm1, fvm2))
			end
		)
	) | fvmaux (pp'Const _) _ = ([], Leaf)
	| fvmaux (pp'Var s) ty = (
		([(s,ty)], Leaf)
	) | fvmaux (pp'Simpleλ (s, bdy)) (L→Type(ty1, ty2)) = (
		let	val (fvs1, fvm1) = fvmaux bdy ty2;
		in	(fvs1 less (s, ty1), ΛNode(fvs1, fvm1))
		end
	) | fvmaux _ _ = error "subst" 3064 [];
in
	fun ⦏mk_fv_map⦎ (( typed(tm, ty)):TERM) : FV_MAP = (
		let	val (fvs, fvm) = fvmaux tm ty;
		in	ΛNode(fvs, fvm)
		end
	);
end;
=TEX
The two black boxes are used to avoid variable capture.
The first black box decides whether or not variable capture
would occur. The second black box builds the list of terms
needed by {\it string\_variant} to generate the new name for the bound
variable. The idea is that the cost in space and time of generating
the list in the second black box is avoided in the frequent case
where no renaming is needed.

The black boxes do the computation of the free variables of the
substitute terms as necessary.
The aim is to avoid having to do this computation in the common
case where the original term is quantifier free. E.g., this will
happen when {\it inst\_term\_rule} is used to specialise the
matrix of a rewrite rule such as
=INLINEFT
∀x y z⦁ (x + y) + z = x + (y + z)
=TEX
. Equally well, we should avoid computing the free variables more
than once. For simplicity, we use an imperative approach (i.e., we
assign to references inside the substitution data structure).
The applicative alternative would be to have the updated substitution be returned as
an additional component of the result of {do\_subst} and passed through
from subterm to subterm, but the additional complexity in the code would be unpleasant.

Another optimisation is that as we have checked that the substituends
and the substitutes have matching types, there is no need to check
that the types on applications are correct when they are formed, so
we use an unchecked version of {\it mk\_app}.
=SML
local
	fun ⦏blackbox1⦎
		(RF : ((TERM * (string list OPT ref)) * (string * TYPE)) list)
		(fvs : (string * TYPE) list)
		(s_ty as (s, _) : string * TYPE) : bool = (
		let fun bbaux (a :: x) = (
			if a = s_ty
			then bbaux x
			else case rassoc5 RF a of
				Value (_, ref (Value fvns)) => s mem fvns orelse bbaux x
			|	Value (tm, r as ref Nil) => (
					let	val fvns = map fst(pp'frees tm);
						val _ = r := Value fvns;
					in	s mem fvns orelse bbaux x
					end
			) | 	Nil => bbaux x
		) | bbaux [] = false;
		in	bbaux fvs
		end
	);
	fun ⦏blackbox2⦎
		(RF : ((TERM * (string list OPT ref)) * (string * TYPE)) list)
		(fvs : (string * TYPE) list)
		(s_ty : string * TYPE) : string list = (
		let fun bbaux (a :: x) = (
			if a = s_ty
			then bbaux x
			else case rassoc5 RF a of
				Value (_, ref (Value fvns)) => fvns @ bbaux x
			|	Value (tm, r as ref Nil) => (
					let	val fvns = map fst (pp'frees tm);
						val _ = r := Value fvns;
					in	fvns @ bbaux x
					end
			) |	Nil => (fst a :: bbaux x)
		) | bbaux [] = [];
		in	bbaux fvs
		end
	);
	fun ⦏dest_app_node⦎ (AppNode (fvm1, fvm2)) = (fvm1, fvm2)
	|   dest_app_node _ = (Leaf, Leaf);
	fun ⦏do_subst⦎
		(RF : ((TERM * (string list OPT ref)) * (string * TYPE)) list)
		(t as typed(pp'App _, _) : TERM, fvm : FV_MAP) : TERM = (
		let	val (fvm1, fvm2) = dest_app_node fvm;
			val (f, a) = dest_app t;
		in	let	val f' = do_subst RF (f, fvm1)
			in
				unchecked_mk_app(f',
					(do_subst RF (a, fvm2)
					handle (Fail _) =>
					a))
			end handle Fail _ =>
				unchecked_mk_app(f, do_subst RF (a, fvm2))
		end
	) | do_subst _ (typed(pp'Const _, _), _) = raise just_fail
	| do_subst RF (typed(pp'Var v, ty), _) = fst(rassoc3 RF (v, ty))
	| do_subst RF (tm as typed (pp'Simpleλ (_, _), _), Leaf) = (
		do_subst RF (tm, mk_fv_map (snd (dest_simple_λ tm)))
	) | do_subst RF (tm as typed (pp'Simpleλ (s, b), tty as L→Type(ty, bty)), ΛNode(fvs, fvm1)) = (
		let	val s_ty  = (s, ty);
		in
			if 	blackbox1 RF fvs s_ty
			then
			let	val new_frees = blackbox2 RF fvs s_ty;
				val s' = string_variant new_frees s;
				val vty' = typed(pp'Var s', ty);
				val RRF = (((vty',ref (Value[s'])), s_ty) :: RF);
			in	let	val typed(b', _) = do_subst RRF (typed(b, bty), fvm1);
				in	typed(pp'Simpleλ(s', b'), tty)
				end
			end
			else
			let
				val RRF = RF drop (fn (_,av) => av = s_ty);
				val typed(b', _) = do_subst RRF (typed(b, bty), fvm1);
			in
				typed(pp'Simpleλ(s, b'), tty)
			end
		end
	) | do_subst _ _ = error "subst" 3064 [];
=TEX
The very last (non-error) case would occur for:
=INLINEFT
⌜λ s : 'a ⦁ f [s : 'b]⌝
=TEX
where the current substitutions leave
=INLINEFT
⌜f [s : 'b]⌝
=TEX
unchanged.
=SML
in
fun ⦏pp'subst⦎ ([] : (TERM * (string * TYPE)) list) (tm : TERM) : TERM = tm
| pp'subst (R : (TERM * (string * TYPE)) list) (tm : TERM) : TERM = (
	let	val init_RF = (map
			(fn (tm,x as (v, ty)) =>
				if type_of tm = ty
				then ((tm, ref Nil),x)
				else term_fail "pp'subst" 3012 [tm, typed(pp'Var v, ty)])
			R);
	in
		do_subst init_RF (tm, Leaf)
		handle (Fail _) => tm
	end
);
end;
=TEX

\subsection{Instantiation of Types and Terms}
The following  will fail if it causes no type instantiation.
=SML
fun ⦏pp'inst_type⦎ ([] : (TYPE * string) list) (mty : TYPE) : TYPE = raise just_fail
| ⦏pp'inst_type⦎ (f : (TYPE * string) list) (mty : TYPE) : TYPE = (
let	fun aux (LVartype v) = (
		rassoc3 f v
	) |  aux (L→Type(ty1, ty2)) = (
		let	val ty1' = aux ty1;
			val ty2' = aux ty2 handle Fail _ => ty2;
		in	L→Type(ty1', ty2')
		end	handle Fail _ => L→Type(ty1, aux ty2)
	) | aux (LCtype(c, tyl)) = (
		let	fun aux1 [] = raise just_fail
			| aux1 (a :: x) = (
				let	val a' = aux a
				in
					a' :: map (fn t => aux t handle (Fail _) => t) x
				end handle (Fail _) => a :: aux1 x
			);
		in	LCtype(c, aux1 tyl)
		end
	);
in	aux mty
end);
=TEX
=SML
local
	exception Invalid of string * TYPE;
	fun	⦏inst_loc1⦎
		(tysubs : (TYPE * string) list)
		(tm as typed(pp'App _, _) : TERM)
		(vars : string list)
		(varmap : ((string * TYPE) * (string * TYPE)) list)
		(bvarmap : ((string * TYPE) * (string * TYPE)) list)
		: TERM = (
		let	val (f, a) = dest_app tm;
		in let	val fi = inst_loc1 tysubs f vars varmap bvarmap;
		in
			unchecked_mk_app(fi,
				(inst_loc1 tysubs a vars varmap bvarmap
				handle (Fail _) => a))
		end
		handle (Fail _) =>
		let	val ai = inst_loc1 tysubs a vars varmap bvarmap;
		in
			unchecked_mk_app(f,ai)
		end
		end
	) | inst_loc1 tysubs (typed(pp'Const s,ty)) vars varmap _ = (
		typed(pp'Const s, pp'inst_type tysubs ty)
	) | inst_loc1 tysubs (tm as typed(pp'Var s, ty)) vars varmap bvarmap = (
		let	val sty' = lassoc3 varmap (s, ty);
		in	let	val orig_bv =  rassoc3 bvarmap sty';
			in	if	(s, ty) = orig_bv
				then	mk_var sty'
				else	raise Invalid orig_bv
			end	handle Fail _ => mk_var sty'
		end
	) | inst_loc1 tysubs (tm as typed(pp'Simpleλ(s, b), L→Type(ty, bty))) vars varmap bvarmap = (
		(let	val s' = string_variant vars s;
		in
		let	val ty' = pp'inst_type tysubs ty;
			val typed (b', bty') = inst_loc1
				tysubs
				(typed(b, bty))
				(s' :: vars)
				(((s, ty), (s', ty')) :: varmap)
				(((s, ty), (s', ty')) :: bvarmap)
				handle Fail _ => typed(b, bty);
		in	typed(pp'Simpleλ (s', b'), L→Type(ty', bty'))
		end
		handle Fail _ =>
		if s = s'
		then	let	val typed (b', bty') = inst_loc1
					tysubs
					(typed(b, bty))
					(s :: vars)
					varmap
					(((s, ty), (s, ty)) :: bvarmap);
			in	 typed(pp'Simpleλ(s, b'), L→Type(ty, bty'))
			end
		else	let	val typed (b', bty') = inst_loc1
					tysubs
					(typed(b, bty))
					(s' :: vars)
					(((s, ty), (s',ty)) :: varmap)
					(((s, ty), (s',ty)) :: bvarmap)
					handle Fail _ => typed(b, bty);
			in	 typed(pp'Simpleλ(s', b'), L→Type(ty, bty'))
			end
		end)
		handle Invalid sty => (
			if	sty = (s, ty)
			then	inst_loc1 tysubs tm (s::vars) varmap bvarmap
			else	raise Invalid sty
		)
	) | inst_loc1 _ _ _ _ _ = error "pp'inst" 3064 [];
=TEX
The following could perhaps be improved by using an accumulating argument and
perhaps by more precomputation.
=SML
	fun ⦏rename_dups⦎ _ _ [] = []
	| rename_dups tysubs av ((s, ty) :: rest) = (
		let	val ty' = pp'inst_type tysubs ty;
		in	if ty = ty'
			then (s, ty) :: rename_dups tysubs av rest
			else
				let val s' = (string_variant
					(map fst(av less (s,ty))) s);
					val sty' = (s' , ty');
				in sty' :: rename_dups tysubs (sty' :: av) rest
				end
		end
		handle (Fail _) =>
		(s, ty) :: rename_dups tysubs av rest);
	fun	⦏inst_loc2⦎
		(avoid : (string * TYPE) list)
		(tysubs : (TYPE * string) list)
		(frees : (string * TYPE) list)
		:	((string * TYPE) * (string * TYPE)) list = (
			combine
			frees
			(rename_dups
			tysubs
			(frees @ avoid)
			frees)
	);
=TEX
=SML
in
	fun	⦏pp'inst⦎
		(avoid : (string * TYPE) list)
		(tysubs : (TYPE * string) list)
		(tm : TERM) : TERM = (
		inst_loc1
		tysubs
		tm
		[]
		(inst_loc2 avoid tysubs (pp'frees tm))
		[]
		handle Invalid (s, _) => error "pp'inst" 3020 [fn () => s]
	);
end; (* of local ... in ... end *)
=TEX
\subsection{$term\_match$ and $type\_match$}
We will need functions which attempt to determine
if one type (or term) is an instance of another.
$type\_match\;ty1\;ty2$ determines if the type $ty1$
is an instance of $ty2$.
If so it returns a list giving the correspondence between
types in $ty1$ with type variables in $ty2$.
If not it raises an exception.
Similarly $term\_match\;tm1\;tm2$ determines if the term
$tm1$ is an instance of $tm2$. If so it returns
a pair of lists, the first giving the correspondence
between types and the second the correspondence between
free variables of (the appropriate type instance of)
$tm2$ and corresponding subterms of $tm1$.
As with $type\_match$, an exception is raised if the
matching is unsuccessful.

The main work of the matching is done by
auxiliary functions ($tyaux1$ and $tmaux2$).
These
operate in a fairly straightforward way by a structural
recursion on their second type (or term) argument building
up the correspondence between leaves in the structure
and substructures of the first type (or term) argument.
$tmaux2$ uses $tyaux1$ to process types in the terms.

=SML
local
=TEX
$tyaux1$ is quite straightforward. It uses an auxiliary
$tyaux0$ to handle lists of types:
=SML
	fun ⦏tyaux1⦎ (match : (TYPE * string) list) (t1 : TYPE) (t2 : TYPE)
		: (TYPE * string) list = (
		if	is_vartype t2
		then	let	val s2 = dest_vartype t2
			in	case rassoc5 match s2 of
					Value t => (
						if	t = t1
						then	match
						else	fail "type_match" 3053 []
				) |	Nil => (t1, s2)::match
			end
		else if	is_ctype t1
		then	let	val (s1, tl1) = dest_ctype t1;
				val (s2, tl2) = dest_ctype t2;
				fun tyaux0 match [] [] = (match
				) | tyaux0 match (h1 :: t1) (h2 :: t2) = (
					tyaux0 (tyaux1 match h1 h2) t1 t2
				) | tyaux0 _ _ _ = fail "type_match" 3053 []
			in	if s1 = s2
				then tyaux0 match tl1 tl2
				else fail "type_match" 3053 []
			end
		else fail "type_match" 3053 []
	);
=TEX
The treatment of terms is more complex than that of types
because of bound variables.
As a result $tmaux2$ is supported by two auxiliary functions, $tmaux1$ and $tmaux0$.
The three functions work with two association lists:
$fvmatch$, which records the correspondence between subterms
of $tm1$ and free variables of $tm2$ and $bvmatch$,
which records the correspondence between
those bound variables of the two terms which are in
scope in the subterm being examined.
It is convenient for $fvmatch$ to have type
$TERM * (string * TYPE)$ and for $bvmatch$
to have type $(string * TYPE) * (string * TYPE)$,
since these choices facilitate the use of $rassoc5$ etc.

$tmaux0$ handles the case when we have encountered a
variable, $v2$ say, in $tm2$ alongside a subterm, $t1$ say, of
$tm1$ which is known not to be
bound variable of $tm1$ (by inspection of $bvmatch$).
We first check that $v2$ is not bound and that
no free variable of $t1$ is bound, if these conditions
are not satisfied the terms do not match.
Assuming all is well,
if we have encountered $v2$ before there
will be an entry for it in $fvmatch$ and
$t1$ must agree (up to $\alpha$-conversion) with that entry.
If we have not encountered $v2$ before,
there will be no entry in $fvmatch$ for it and now
is the time to make one, using $tyaux1$ to handle the
type matching.

This function is optimised for the very common case where no bound variables in $tm1$
have been encountered yet, as happens, for example, when matching the matrix of
a rewrite rule such as
=INLINEFT
∀x y z⦁ (x + y) + z = x + (y + z)
=TEX
. In this case, there is no need to examine the free variables of $t1$.
Less importantly, it is also optimised for the case of just one free variable,
in which case we can use {\it is\_free\_var\_in} rather than {\it pp'frees}.
=SML
	fun ⦏tmaux0⦎
		(tymatch : (TYPE * string) list, fvmatch : (TERM * (string * TYPE)) list)
		(bvmatch : ((string * TYPE) * (string * TYPE)) list)
		(tm1 : TERM)
		(v2ty2 : string * TYPE)
		: (TYPE * string) list * (TERM * (string * TYPE)) list = (
		case rassoc5 bvmatch v2ty2 of
			Nil => (
				if	case bvmatch of
						[] => false
					|	[(x1, _)] => (
						is_free_var_in x1 tm1
					) |	_ => (
						any
						(pp'frees tm1)
						(fn x => any bvmatch (fn (x1, _) => (x = x1)))
					)
				then fail "term_match" 3054 []

				else case rassoc5 fvmatch v2ty2 of
					Value tm1' => (
						if tm1 ~=$ tm1'
						then (tymatch, fvmatch)
						else fail "term_match" 3054 []
				) |	Nil => (
						let	val tymatch' =
						tyaux1 tymatch (type_of tm1) (snd v2ty2);
						in	(tymatch', (tm1, v2ty2) :: fvmatch)
						end
				)
			) |	Value _ => fail "term_match" 3054 []
	);
=TEX
$tmaux1$ handles the case when we have encountered a variable, $v2$ say,
in $tm2$.
If the corresponding subterm, $t1$ say, of $tm1$ is
a variable, then we must consult $bvmatch$ to see whether
it is a bound variable.
If it is, then all we must do is consult
$bvmatch$ again to ensure that $v2$ is the corresponding
bound variable of $tm2$, and fail if it is not.
The correspondence has to be checked carefully to avoid
problems with local redeclarations, e.g.,
=INLINEFT
λx⦁λy⦁x
=TEX
\ is not an instance of
=INLINEFT
λx⦁λx⦁x
=TEX
.
If $t1$ is either a free variable of $tm1$ or some
other sort of term then we just pass the problem
on to $tmaux0$.
=SML
	fun tmaux1 (tymatch, fvmatch) (bvmatch : ((string * TYPE) * (string * TYPE)) list)
			tm1 v2ty2 = (
		if is_var tm1
		then	(let	val v1ty1 = dest_var tm1;
			in case lassoc5 bvmatch v1ty1 of
				Value vty => (
					if	vty = v2ty2
					andalso	rassoc5 bvmatch v2ty2 = Value v1ty1
					then (tymatch, fvmatch)
					else fail "term_match" 3054 []
			) |	Nil => tmaux0 (tymatch, fvmatch) bvmatch tm1 v2ty2
			end)
		else 	tmaux0 (tymatch, fvmatch) bvmatch tm1 v2ty2
	);
=TEX
$tmaux2$ handles the general case. If the subterm, $t2$ say,
of $tm2$ is a variable, then $tmaux1$ is applied.
If $t2$ is a constant then the corresponding subterm
of $tm2$ must also be a constant with the same
name and we just use
$tyaux1$ to handle the type instantiation.
If $t2$ is an application, then the corresponding subterm
of $tm1$ must be too. The subterms of the
application are examined in turn, with matching information
gleaned from the operator passed on for use in examining
of the operand.
If $t2$ is an abstraction, then so must be the corresponding
subterm of $tm1$. The bodies of the abstractions
are examined with the bound variable matching information
in $bvmatch$ suitably adjusted.
Mismatched structures will result in an exception.
=SML
	fun tmaux2 (tymatch, fvmatch) bvmatch (App(f1, a1)) (App(f2, a2)) = (
		tmaux2 (tmaux2 (tymatch, fvmatch) bvmatch
				(dest_simple_term f1) (dest_simple_term f2))
			bvmatch
			(dest_simple_term a1)
			(dest_simple_term a2)
	) | tmaux2 (tymatch, fvmatch) bvmatch (Const(s1,ty1))(Const(s2,ty2)) = (
		if (s1 = s2)
		then (tyaux1 tymatch ty1 ty2, fvmatch)
		else fail "term_match" 3054 []
	) | tmaux2 (tymatch, fvmatch) bvmatch tm1 (Var v2) = (
		tmaux1 (tymatch, fvmatch) bvmatch (mk_simple_term tm1) v2
	) | tmaux2 (tymatch, fvmatch) bvmatch (Simpleλ(v1,b1))(Simpleλ(v2,b2)) = (
		
		let	val v1ty1 = dest_var v1;
			val v2ty2 = dest_var v2;
			val bvmatch' = (v1ty1, v2ty2) :: bvmatch;
			val tymatch' = tyaux1 tymatch (snd v1ty1) (snd v2ty2);
		in	tmaux2 (tymatch', fvmatch) bvmatch'
			(dest_simple_term b1) (dest_simple_term b2)
		end
	) | tmaux2 _ _ _ _ = fail "term_match" 3054 [];
in
=TEX
It will often be the case that identical subtypes or
subterms correspond.
For compactness, the result lists of the matching functions
do not contain trivial correspondences.
$type\_match$ and $term\_match$ therefore both work
by calling the relevant auxiliary and then
removing trivial correspondences from the result.
=SML
	fun ⦏type_match⦎ (ty1 : TYPE) (ty2 : TYPE) : (TYPE * TYPE) list = (
		map(Combinators.I ** mk_vartype)
		((tyaux1 [] ty1 ty2) drop
			(fn (x, y) => is_vartype x andalso (dest_vartype x = y)))
		handle complaint =>
		if area_of complaint = "type_match"
		then type_fail "type_match" 3053 [ty1,ty2]
		else reraise complaint (area_of complaint)
	);
	fun ⦏term_match⦎ (tm1 : TERM) (tm2 : TERM)
		: (TYPE * TYPE) list * (TERM * TERM) list = (
		(let	val (tym, tmm) = tmaux2 ([], []) []
				(dest_simple_term tm1)
				(dest_simple_term tm2);
			val tym' = tym drop
				(fn (x, y) => is_vartype x andalso
				(dest_vartype x = y));
			val tmm' = tmm drop
		(fn (x, (s, ty)) => is_var x andalso
			(dest_var x = (s, (pp'inst_type tym' ty handle (Fail _) => ty))));
			val tmm'' = map (fn(x, (s,_)) => (x, (s, type_of x))) tmm';
		in 	(map(Combinators.I ** mk_vartype)tym',
			 map(Combinators.I ** mk_var)tmm'')
		end)
		handle (Fail _) => term_fail "term_match" 3054 [tm1,tm2]
	);
=TEX
Also we need a variant of type matching that allows us to extend an existing partial match and that does not optimise the result by removing trivial matches.
=SML
	fun ⦏type_match1⦎ (m : (TYPE * TYPE) list) : TYPE -> TYPE -> (TYPE * TYPE) list = (
	let	val match = map(Combinators.I ** dest_vartype) m
			handle Fail _ => type_fail "type_match1" 3019 (map snd m drop is_vartype);
	in	fn ty1 => fn ty2 =>
		map(Combinators.I ** mk_vartype)
		((tyaux1 match ty1 ty2))
		handle complaint =>
		if area_of complaint = "type_match"
		then type_fail "type_match1" 3055 [ty1,ty2]
		else reraise complaint (area_of complaint)
	end);
=SML
end; (* of local ... in ... end for term_match, etc. *)
=POLYML
end; (* of local datatype ...  in ... end defining TERM *)
=SML
end; (* of local defining pp'TERM *)
=POLYML
end; (* of local datatype ...  in ... end defining TYPE *)
=TEX
\subsection{Functions derived from Abstract Data Type $TYPE$ Part}
Some of these functions could be improved by being placed within
the abstract data type.

The following function is used in {\it inst\_type} and {\it inst}
to process the type instantiation lists supplied as their
first argument. The purpose of the function is to convert to
the format needed by the {\it pp'\ldots} functions, dropping
superfluous entries but checking that each entry does indeed
have a type variable as its second component. If an error
is detected, the exception raised by {\it dest\_vartype}
will be raised.

=SML
fun ⦏mk_inst_type_args⦎ (f : (TYPE * TYPE) list) : (TYPE * string) list = (
	let	fun aux acc ((ty1, ty2)::more) = (
			let	val	tyv2 = dest_vartype ty2;
			in	if	ty1 =: ty2
				then	aux acc more
				else	aux ((ty1, tyv2)::acc) more
			end
		) | aux acc [] = rev acc;
	in	aux [] f
	end
);
=TEX
=SML
fun ⦏inst_type⦎ (f : (TYPE * TYPE) list) (ty : TYPE) : TYPE = (
	pp'inst_type (mk_inst_type_args f) ty
	handle complaint =>
	if area_of complaint = "dest_vartype"
	then pass_on complaint "dest_vartype" "inst_type"
	else ty
);
=TEX
This function extracts the type constructors contained
in a type.
=SML
fun ⦏type_tycons⦎ (ty : TYPE) : (string * int) list = (
	if	is_vartype ty
	then	[]
	else	let	val (s,tyl) = dest_ctype ty;
		in	list_cup (map type_tycons tyl) grab (s, length tyl)
		end
);
=TEX
This function extracts the type variables contained
in a type.
=SML
fun ⦏type_tyvars⦎ (ty : TYPE) : string list = (
	if	is_vartype ty
	then	[dest_vartype ty]
	else	let	val (_,tyl) = dest_ctype ty;
		in
		list_cup (map type_tyvars tyl)
		end
);
=TEX
=SML
fun ⦏type_any⦎ (p : TYPE -> bool) (ty : TYPE) : bool = (
let	fun aux ty = (
	let
		fun list_type_any (lty :: ltyl) = (
		p lty orelse aux lty orelse list_type_any ltyl
		) | list_type_any [] = false
	in
	is_ctype ty andalso (
		let	val (_,tyl) = dest_ctype ty
		in
		list_type_any tyl
		end)
	end)
in
	p ty orelse aux ty
end);	
=TEX
=SML
fun ⦏type_map⦎ (tyfun :TYPE -> TYPE) (ty : TYPE) : TYPE = (
let
	fun aux (ty : TYPE) = (
		tyfun ty
		handle (Fail _) =>
		if is_vartype ty
		then raise just_fail
		else (
		let	val (s,tyl) = dest_ctype ty;
			fun aux1 [] = raise just_fail
			| aux1 (a :: x) = (let	val a' = aux a
			in
				a' :: map (fn t => aux t handle (Fail _) => t) x
			end
			handle (Fail _) =>
			a :: aux1 x);
		in
			mk_ctype(s, aux1 tyl)
		end));
in
		(aux ty handle (Fail _) => ty)
end);
=TEX
\subsection{Functions derived from Abstract Data Type $TERM$ Part}
Some of these functions could be improved by being placed within
the abstract data type.
=SML
fun ⦏list_mk_simple_λ⦎ ((tml, f):TERM list * TERM): TERM = (
	fold mk_simple_λ tml f
);

fun ⦏list_mk_app⦎ ((f:TERM), ([]:TERM list)) : TERM = f
| list_mk_app (f, (a1 :: a2ton)) = list_mk_app(mk_app(f, a1), a2ton);

fun ⦏strip_app⦎ (tm : TERM) = (
	let	fun aux t args = (
			if is_app t
			then	let	val (f, a) = dest_app t;
				in	aux f (a::args)
				end
			else (t, args)
		);
	in	aux tm []
	end
);
=TEX
\subsection{Derived $TERM$ Functions}
A performance issue arises with the destructor functions for
derived term constructors: need they test the types of constants?
Here we do not make this test. It is not necessary if the
definition of two constants with the same name is
disallowed.
=SML
fun ⦏mk_bin_op⦎ (area_name : string) (msg1 : int) (msg2 : int)
	(rator : TYPE -> TYPE -> TERM)
	((lhs, rhs) : TERM * TERM) : TERM = (
	let	val app1 = (mk_app(rator(type_of lhs)(type_of rhs), lhs)
			handle (Fail _) =>
			term_fail area_name msg1 [lhs,rhs]);
	in
	(mk_app(app1, rhs))
	handle (Fail _) =>
		term_fail area_name msg2 [lhs,rhs]
	end
);

fun ⦏dest_bin_op⦎ (area_name : string) (msg : int) (op_name : string)
	(tm : TERM) : TERM * TERM = (
	let	val (Oplhs, rhs) = dest_app tm
		val (Op, lhs) = dest_app Oplhs
	in	if fst(dest_const Op) = op_name
		then (lhs, rhs)
		else term_fail area_name msg [tm]
	end
	handle (Fail _) => term_fail area_name msg [tm]
);

fun ⦏is_bin_op⦎ (op_name : string) (tm : TERM) : bool = (
	let	val (Oplhs, _) = dest_app tm
		val (Op, _) = dest_app Oplhs
	in	fst(dest_const Op) = op_name
	end
	handle (Fail _) => false
);

fun ⦏list_mk_bin_op⦎ (area_name : string) (msg1 : int) (msg2 : int)
	(rator : TYPE -> TYPE -> TERM)
	(tml : TERM list) = (
let
	val tol = type_of (hd tml);
	val rat = rator tol tol;
	fun aux [tm] = tm
	| aux (tm :: tmrest) = 	(
		let	val app1 = (mk_app(rat, tm)
			handle (Fail _) =>
			term_fail area_name msg1 [tm,aux tmrest]);
		in
			(mk_app(app1, aux tmrest))
			handle (Fail _) =>
			term_fail area_name msg2 [tm,aux tmrest]

		end
	) | aux [] = fail area_name 3017 [];
in
	aux tml
end
handle complaint =>
	divert complaint "hd" area_name 3017 []
);
	
fun ⦏strip_bin_op⦎ (op_name : string) (tm : TERM): TERM list = (
	let	val (Oplhs, rhs) = dest_app tm
		val (Op, lhs) = dest_app Oplhs
	in	if fst(dest_const Op) = op_name
		then (lhs :: strip_bin_op op_name rhs)
		else [tm]
	end
	handle (Fail _) => [tm]
);
=TEX
=SML
fun ⦏mk_mon_op⦎ (area_name : string) (msg : int)
	(rator : TYPE -> TERM)
	(rand : TERM) : TERM = (
	(mk_app(rator(type_of rand), rand))
	handle (Fail _) =>
	term_fail area_name msg [rand]
);

fun ⦏dest_mon_op⦎ (area_name : string) (msg : int) (op_name : string)
	(tm : TERM) : TERM = (
	let	val (rator, rand) = dest_app tm
	in	if fst(dest_const rator) = op_name
		then rand
		else term_fail area_name msg [tm]
	end
	handle (Fail _) => term_fail area_name msg [tm]
);

fun ⦏is_mon_op⦎ (op_name : string) (tm : TERM) : bool = (
	let	val (rator, _) = dest_app tm
	in	fst(dest_const rator) = op_name
	end
	handle (Fail _) => false
);
=TEX
=SML
fun ⦏mk_simple_binder⦎ (area_name : string) (msg : int)
	(binder : TYPE -> TYPE -> TERM)
	((var, body) : TERM * TERM) : TERM = (
	(mk_app(binder(type_of var)(type_of body), mk_simple_λ(var, body)))
	handle complaint =>
		case (area_of complaint) of
		"mk_app" => term_fail area_name msg [var,body]
		| "mk_simple_λ" => pass_on complaint "mk_simple_λ" area_name
		| _ => reraise complaint area_name
);

fun ⦏dest_simple_binder⦎ (area_name : string) (msg : int) (op_name : string)
	(tm : TERM) : TERM * TERM = (
	let	val (binder, abs) = dest_app tm;
		val (var, body) = dest_simple_λ abs;
	in	if fst (dest_const binder) = op_name
		then (var, body)
		else term_fail area_name msg [tm]
	end
	handle (Fail _) => term_fail area_name msg [tm]
);

fun ⦏is_simple_binder⦎ (op_name : string) (tm : TERM) : bool = (
	let	val (binder, bdy) = dest_app tm;
	in	is_simple_λ bdy
		andalso
		(fst (dest_const binder) = op_name)
	end
	handle (Fail _) => false
);
=TEX
=SML
fun ⦏bin_bool_op⦎ (name : string) (_:TYPE) (_:TYPE): TERM = (
	mk_const(name, mk_→_type (BOOL,(mk_→_type (BOOL, BOOL))))
);
=TEX
=SML
fun ⦏equality⦎ (ty : TYPE) (_ : TYPE) : TERM = (
	mk_const("=", mk_→_type (ty, (mk_→_type (ty, BOOL))))
);

val ⦏mk_eq⦎ : (TERM * TERM) -> TERM= mk_bin_op "mk_eq" 3012 3012 equality;

val ⦏dest_eq⦎ : TERM -> (TERM * TERM)= dest_bin_op "dest_eq" 3014 "=";

val ⦏is_eq⦎ : TERM -> bool = is_bin_op "=";
=TEX
=SML
val ⦏mk_⇒⦎ : (TERM * TERM) -> TERM =
	mk_bin_op "mk_⇒" 3031 3015 (bin_bool_op "⇒");

val ⦏dest_⇒⦎ : TERM -> (TERM * TERM) = dest_bin_op "dest_⇒" 3016 "⇒";

val ⦏is_⇒⦎ : TERM -> bool = is_bin_op "⇒";

val ⦏list_mk_⇒⦎ : TERM list -> TERM = (
	list_mk_bin_op "list_mk_⇒" 3031 3015 (bin_bool_op "⇒")
);

val ⦏strip_⇒⦎ : TERM -> TERM list = strip_bin_op "⇒";
=TEX
=SML
fun ⦏quantifier⦎ (name : string) (vty : TYPE) (_ : TYPE) : TERM = (
	mk_const(name, mk_→_type ((mk_→_type (vty, BOOL)), BOOL))
);

val ⦏mk_simple_∀⦎ : (TERM * TERM) -> TERM = (
	mk_simple_binder "mk_simple_∀" 3015 (quantifier "∀")
);

val ⦏dest_simple_∀⦎ : TERM -> (TERM * TERM) = (
	dest_simple_binder "dest_simple_∀" 3032 "∀"
);

val ⦏is_simple_∀⦎ : TERM -> bool = is_simple_binder "∀";

fun ⦏list_mk_simple_∀⦎ ((tml, f):TERM list * TERM): TERM = (
	fold mk_simple_∀ tml f
);

val ⦏mk_simple_∃⦎ : TERM * TERM -> TERM = (
	mk_simple_binder "mk_simple_∃" 3015 (quantifier "∃")
);

val ⦏dest_simple_∃⦎: TERM -> (TERM * TERM) = (
	dest_simple_binder "dest_simple_∃" 3034 "∃"
);

val ⦏is_simple_∃⦎ : TERM -> bool = is_simple_binder "∃";

fun ⦏list_mk_simple_∃⦎ ((tml, f):TERM list * TERM): TERM = (
	fold mk_simple_∃ tml f
);
=TEX
\subsection{Literals}
Types:
=SML
val ⦏ℕ⦎ = mk_ctype("ℕ",[]);
val ⦏CHAR⦎ = mk_ctype("CHAR",[]);
val ⦏STRING⦎ = mk_ctype("LIST",[CHAR]);
=TEX
Numerics:
=SML
fun ⦏is_ℕ⦎ (tm : TERM) : bool = (
let	val (tmn,tmty) = dest_const tm
in
	(tmty =: ℕ) andalso (is_all_decimal tmn)
end
handle Fail _ => false
);

fun ⦏mk_ℕ⦎ (n : INTEGER) : TERM = (
	if (n @>= zero)
	then mk_const(string_of_integer n,ℕ)
	else fail "mk_ℕ" 3021 [fn () => string_of_integer n]
);

fun ⦏dest_ℕ⦎ (tm : TERM) : INTEGER = (
let	val (tmn,tmty) = dest_const tm
in
	if (tmty =: ℕ)
	then natural_of_string tmn
	else term_fail "dest_ℕ" 3026 [tm]
end
handle (Fail _) =>
	term_fail "dest_ℕ" 3026 [tm]
);
=TEX
Characters:
=SML
local
	val ordquote = ord "`";
in

fun ⦏is_char⦎ (tm : TERM) : bool = (
let	val (tmn,tmty) = dest_const tm
in
	(tmty =: CHAR) andalso
	(tmn <> "") andalso
	(ordquote = ord tmn) andalso
	(size tmn = 2)
end
handle Fail _ => false
);

fun ⦏mk_char⦎ (str : string) : TERM = (
	if size str = 1
	then mk_const("`" ^ str, CHAR)
	else fail "mk_char" 3023 [fn () => str]
);

fun ⦏dest_char⦎ (tm : TERM) : string = (
let	val (tmn,tmty) = (dest_const tm
		handle (Fail _) =>
		term_fail "dest_char" 3024 [tm]);
in
	case	if tmty =: CHAR
		then	case explode tmn
			of "`"::c2::nil => Value c2
			| _ => Nil
		else Nil
	of Value c => c
	| Nil => term_fail "dest_char" 3024 [tm]
end);
end; (* local *)
=TEX
Strings:
=SML
local
	val orddquote = ord("\"");
in
fun ⦏is_string⦎ (tm : TERM) : bool = (
let	val (tmn,tmty) = dest_const tm
in
	(tmty =: STRING) andalso
	(tmn <> "") andalso
	(orddquote = ord tmn)
end
handle Fail _ => false
);

fun ⦏mk_string⦎ (str : string) : TERM = mk_const("\"" ^ str,STRING);

fun ⦏dest_string⦎ (tm : TERM) : string = (
let	val (tmn,tmty) = (dest_const tm
		handle (Fail _) =>
		term_fail "dest_string" 3025 [tm]);
in
	if (tmty =: STRING) andalso (tmn <> "")
		andalso (ord tmn = orddquote)
	then substring(tmn, 1, size tmn - 1)
	else term_fail "dest_string" 3025 [tm]
end);
end; (* local *)
=TEX
\subsection{Functions Upon Terms}
Now some functions viewing term lists as sets under $\alpha$-convertibility.
=SML
fun (tm : TERM) ⦏term_mem⦎ (tml : TERM list) : bool = (
let	fun test (h :: t) = (tm ~=$ h) orelse test t
	| test [] = false
in
	test tml
end);
=TEX
=SML
fun ((x :: xs) : TERM list) ⦏term_less⦎ (tm : TERM) : TERM list = (
	if tm ~=$ x
	then xs term_less tm
	else (x :: (xs term_less tm))
) | [] term_less _ = [];
=TEX
=SML
fun (tml : TERM list) ⦏term_grab⦎ (tm : TERM) : TERM list = (
	if tm term_mem tml
	then tml
	else (tm :: tml)
);
=TEX
=SML
fun ([] : TERM list) ⦏term_diff⦎ (tml2 : TERM list) : TERM list = []
| (tm :: rest) term_diff tml2 = (if tm term_mem tml2
	then rest term_diff tml2
	else( tm :: (rest term_diff tml2))
);
=TEX
=SML
fun (tml1 : TERM list) ⦏term_union⦎ (tml2 : TERM list) : TERM list = (
	let
		fun insert_it (what, lst) = (
			if what term_mem lst
			then lst
			else (what :: lst)
		);
	in
		fold insert_it tml1 tml2
	end
);
=TEX
=SML
fun ⦏list_term_union⦎ (lists : TERM list list) : TERM list = (
	fold (fn (l1, l2) => l1 term_union l2) lists []
);
=TEX
\subsubsection{Renaming}
=SML
fun ⦏rename⦎ ((v, ty) : string * TYPE) (w : string) (tm : TERM) : TERM = (
	if	v <> w
	then	pp'subst[(mk_var(w, ty), (v, ty))]tm
	else	tm
);
=TEX
\subsection{Viewing Functions}
=SML
fun ⦏term_types⦎ (tm : TERM) : TYPE list = (
let	fun aux (App (f, a)) = (
		union (op =:) (aux (dest_simple_term f)) (aux (dest_simple_term a))
	) | aux (Const (_, ty)) = [ty]
	  | aux (Var (_,ty)) = [ty]
	  | aux (Simpleλ (v, b)) = insert (op =:) (aux (dest_simple_term b)) (type_of v)
in
	aux(dest_simple_term tm)
end);
=TEX
=SML
fun ⦏term_any⦎ (p : TERM -> bool) (tm : TERM) : bool = (
let	fun aux (App (f, a)) = (
		p f orelse p a orelse
		aux (dest_simple_term f) orelse
		aux (dest_simple_term a)
	) | aux (Const _) = false
	  | aux (Var _) = false
	  | aux (Simpleλ (v, b)) = (
		p v orelse p b orelse
		aux (dest_simple_term b)
	)
in
	p tm orelse aux (dest_simple_term tm)
end);
=TEX
=SML
val ⦏term_tyvars⦎ = list_cup o (map type_tyvars) o term_types;
=TEX
=SML
fun ⦏term_tycons⦎ (tm : TERM) : (string * int) list = (
let
	fun aux (App (f, a)) = (
		aux (dest_simple_term f) cup aux (dest_simple_term a)
	) | aux (Const (_, ty)) = type_tycons ty
	  | aux (Var (_,ty)) = type_tycons ty
	  | aux (Simpleλ (v, b)) = aux (dest_simple_term b) cup (type_tycons(type_of v))
in
	aux(dest_simple_term tm)
end);
=TEX

This function extracts the subterms of a term which
are constants.
=SML
fun ⦏term_consts⦎ (tm : TERM) : (string * TYPE) list = (
let	fun aux (App(f, a)) =
		aux(dest_simple_term f) cup aux(dest_simple_term a)
	| aux (Var _) = []
	| aux (Const c) = [c]
	| aux (Simpleλ (v, b)) = aux (dest_simple_term b)
in
	aux (dest_simple_term tm)
end);
=TEX
This function extracts the subterms of a term which
are variables.
=SML
fun ⦏term_vars⦎ (tm : TERM) : (string * TYPE) list = (
let	fun aux (App(f, a)) =
		aux(dest_simple_term f) cup aux(dest_simple_term a)
	| aux (Var v) = [v]
	| aux (Const c) = []
	| aux (Simpleλ (v, b)) = aux (dest_simple_term b) grab (dest_var v)
in
	aux (dest_simple_term tm)
end);
=TEX
=SML
fun ⦏is_type_instance⦎ (ty1 : TYPE) (ty2 : TYPE) : bool = (
	(type_match ty1 ty2; true)
	handle (Fail _) => false
);
=TEX
\subsubsection{Functions Concerning Term Variables}
=SML
fun ⦏variant⦎ (vs : TERM list) (v : TERM) : TERM = (
let	val (s, ty) = dest_var v
		handle complaint =>
		pass_on complaint "dest_var" "variant";
	val vss = map (fst o dest_var) vs
		handle complaint =>
		pass_on complaint "dest_var" "variant";
	val s' = string_variant vss s;
in
	if s' = s
	then v
	else mk_var(s',ty)
end);

fun ⦏list_variant⦎ (av : TERM list) (tml: TERM list) : TERM list = (
let
	val av_vars = map (fst o dest_var) av
		handle complaint =>
		pass_on complaint "dest_var" "list_variant";

	fun aux avs (v :: rest) = (
	let	val (vnm,vty) = dest_var v
			handle complaint =>
			pass_on complaint "dest_var" "list_variant";
		val vnm' = string_variant avs vnm;
		val v' = if vnm = vnm'
			then v
			else mk_var(vnm',vty);
	in
		(v' :: aux (vnm' :: avs) rest)	
	end
	) | aux _ [] = [];
in
	aux av_vars tml
end);

=TEX
The following is a function to create a list of
machine generated variables known to be different
to any existing in a list of terms.
It is very heavily tweaked for efficiency, and its local declarations are as follows.
\begin{description}
\item[mgn\_prefix]
This is the starting prefix for all machine-generated variables,
and should the prefix change, then only this declaration need change.
\item[ord\_mgn\_prefix]
We hope that a fast if incomplete filter names is testing whether
the first character of any encountered name is the same as that
at the start of $mgn\_prefix$.
We do this by using $ord$ which gives the ascii value of the first
character in a string.
We precompute this value for $mgn\_prefix$.
\item[mg\_in\_term]
This gives the list of possible machine-generated names already
present in a single term, with no duplicates.
\item[mg\_in\_terms]
This gives the list of possible machine-generated names already
present in a list of terms, with no duplicates.
\item[mgs]
This is the list of possible machine-generated names present in
$gen\_vars$ term list.
\item[base\_mgns]
This is the list of names that will be used for our newly generated variables, if there are no conflicts already.
\item[create\_mgv]
This creates one variable per type, named $(mgn\_prefix)nnn$,
where $nnn$ is the first number (starting from 0) for which the name is not already
in the list.
The $nnn$ carries over to the name of each new variable, so that
previously rejected names, and previously generated names are not
tried once more.
This means we don't have to test the new names against themselves.
\end{description}
It replaces the very fast, if slightly uncertain $genvar$, of the prototype ICL HOL.
It is less fast, but should always meet its specification.
=SML
local
	val mgn_prefix = "@_";
	val ord_mgn_prefix = ord mgn_prefix
in
fun ⦏gen_vars⦎ (tyl : TYPE list) (tml : TERM list) : TERM list = (
let	fun mg_in_term acc (App(f, a)) = (
	let	val acc' = mg_in_term acc (dest_simple_term f)
	in mg_in_term acc' (dest_simple_term a) end
	) | mg_in_term acc (Var (s,_)) = if (s <> "") andalso
			(ord s = ord_mgn_prefix)
		then acc grab s
		else acc
	| mg_in_term acc (Const _) = acc
	| mg_in_term acc (Simpleλ(v, b)) =
		let	val vnm = fst(dest_var v) in
		(if (vnm <> "") andalso ord vnm = ord_mgn_prefix
		then mg_in_term (acc grab vnm) (dest_simple_term b)
		else mg_in_term acc (dest_simple_term b))
		end;

	fun mg_in_terms acc (ltm :: ltml) = (
	let	val acc' = mg_in_term acc (dest_simple_term ltm)
	in mg_in_terms acc' ltml end
	) | mg_in_terms acc [] = acc;

	val mgs = mg_in_terms [] tml;

	fun create_mgv n ((lty :: ltyl):TYPE list) : TERM list = (
		if (mgn_prefix ^ string_of_int n) mem mgs
		then create_mgv (n+1) (lty :: ltyl)
		else (mk_var(mgn_prefix ^ string_of_int n, lty) ::
			create_mgv (n+1) ltyl)
	) | create_mgv n [] = [];
in
	create_mgv 1 tyl
end);
end;
=TEX
=SML
fun ⦏is_free_in⦎ (tm : TERM) (tm1 : TERM): bool = (
	is_free_var_in(dest_var tm) tm1
	handle complaint =>
	pass_on complaint "dest_var" "is_free_in"
);
=TEX
=SML
val ⦏frees⦎ = map mk_var o pp'frees;
=TEX
$var\_subst$ is the direct interface to $pp'subst$.
Thus, unlike $subst$ (see below), it is only capable of
substituting for subterms of a term which are variables.
=SML
fun ⦏var_subst⦎
	(subs : (TERM * TERM) list)
	(tm : TERM) = (
	((pp'subst o map (Combinators.I ** dest_var)) (subs drop (op =)) tm)
	handle complaint =>
	pass_on complaint "dest_var" "var_subst"
	handle complaint =>
	pass_on complaint "pp'subst" "var_subst"
);
=TEX
\subsubsection{Mapping over Terms}
This function is a minor convenience.
In essence,
given a function, $tmfun$, and a term, $tm$, it traverses
$tm$ (breadth first) looking for subterms for which
the application $tmfun\,tm$ does not fail and replaces
such subterms with $tmfun\,tm$.
In fact, it is convenient
for $tmfun$ to have as an extra parameter a list giving
the bound variables which are in scope at the point of use.
=SML
fun ⦏term_map⦎ (tmfun :(TERM list) -> TERM -> TERM) (tm : TERM) : TERM = (
let
	fun aux
		(bvs : TERM list)
		(tm : TERM)
		(App(f, a)) = (
			(tmfun bvs tm)
			handle (Fail _) =>
			(let	val f' = aux bvs f (dest_simple_term f);
			in
			mk_app(f',
			(aux bvs a (dest_simple_term a) handle (Fail _) => a))
			end
			handle (Fail _) =>
			mk_app(f,aux bvs a (dest_simple_term a)))
	) | aux bvs tm (Const _) = (tmfun bvs tm)
	| aux bvs tm (Var _) = (tmfun bvs tm)
	| aux bvs tm (Simpleλ(v, b)) = (
		(tmfun bvs tm) handle (Fail _) =>
			mk_simple_λ(v, aux (v :: bvs) b (dest_simple_term b))
	);
in
	aux [] tm (dest_simple_term tm)
	handle (Fail _) => tm
end);
=TEX
\subsection{$subst$}
This is the more general interface to $pp'subst$ than $var\_subst$ which
can substitute for arbitrary subterms of a term, not just
variables.
It does however pass over the term twice.
=SML
local
	fun find2 (a :: x) (b :: y) cond = (
		if cond a
		then b
		else find2 x y cond
	) | find2 _ _ _ = raise just_fail;
in
fun ⦏subst⦎
	(subs : (TERM * TERM) list)
	(tm : TERM) = (
	case subs drop (op =) of
		[] => tm
	|	subs' =>
	let	val (xs, ys) = split subs';
		val terms = tm :: (xs @ ys);
		val Xs = gen_vars (map type_of ys) terms;
=TEX
Note that it is thought faster to fail on $find2$
rather than the bound variable check, and thus the presentation
of $aux$.
=SML
		fun aux bvs tm1 = (
			let val X = find2 ys Xs (fn u => u ~=$ tm1);
			in
			if all bvs (fn x => not(is_free_in x tm1))
			then X
			else raise just_fail
			end
		);
		val mediator = term_map aux tm;
	in
		pp'subst (combine xs (map dest_var Xs)) mediator
	end
	handle complaint =>
	(map (fn (x,y) => if type_of x =: type_of y
			then ()
			else term_fail "subst" 3012 [x,y])
		subs;
	reraise complaint "subst")
);
end;
=TEX
\subsection{$inst$}
=SML
fun	 ⦏inst⦎
	(avoid : TERM list)
	(tysubs : (TYPE * TYPE) list)
	: TERM -> TERM = (
let	val vs = (map dest_var avoid)
		handle complaint =>
		pass_on complaint "dest_var" "inst";
	val tys = (mk_inst_type_args tysubs)
		handle complaint =>
		pass_on complaint "dest_vartype" "inst";
in
	fn tm => (pp'inst vs tys tm) handle (Fail _) => tm
end);
=TEX
\subsection{Simple Diagnostic Printing}
=SML
fun ⦏pp'string_of_term⦎ (t : TERM) : string = (
	case dest_simple_term t of
		Var (n, _) => n
	|	Const (n, _) => n
	|	App (f, x) =>	"(" ^ pp'string_of_term f ^
					")(" ^ pp'string_of_term x ^ ")"
	|	Simpleλ (v, b) => "λ" ^ pp'string_of_term v ^ "⦁" ^
					pp'string_of_term b

);
=TEX
=SML
fun ⦏pp'string_of_type⦎ (t : TYPE) : string = (
	case dest_ctype t handle Fail _ => (dest_vartype t, []) of
		(c, []) => c
	|	(c, ts) => "(" ^ format_list pp'string_of_type ts "," ^ ")" ^ c
);
=TEX
=SML
end; (* of structure pp'TypesAndTerms *)
=TEX
We now open the structure for system build. The user will actually see
the items provided by the structure via the opening of structure
$TypesAndTerms$, in \cite{DS/FMU/IED/IMP004}.
=SML
open pp'TypesAndTerms;
val _ = pp'set_string_of_term pp'string_of_term;
val _ = pp'set_string_of_type pp'string_of_type;
=TEX
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}



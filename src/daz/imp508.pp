=IGN
********************************************************************************
imp508.doc: this file is part of the PPDaz system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% imp508.doc   ℤ $Date: 2008/07/24 12:12:34 $ $Revision: 1.150 $ $RCSfile: imp508.doc,v $
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

\def\Title{Implementation: Declaration and Expression Generator}

\def\AbstractText{This document contains the implementation for the Basic Declaration and Expression Generator for processing Compliance Notation.}

\def\Reference{ISS/HAT/DAZ/IMP508}

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
%% LaTeX2e port: \TPPtitle{Implementation: Declaration and Expression Generator}  %% Mandatory field
%% LaTeX2e port: \TPPref{ISS/HAT/DAZ/IMP508}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.150 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2008/07/24 12:12:34 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: %\TPPkeywords{CN}
%% LaTeX2e port: \TPPauthor{D.J.~King & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & HAT Team}
%% LaTeX2e port: \TPPabstract{
%% LaTeX2e port: This document contains the implementation for the Basic Declaration and Expression Generator for processing Compliance Notation.}
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

\item[Issue 1.1 (1994/03/29)-1.15 (1994/06/06)] Initial Drafts.
\item[Issue 1.16 (1994/06/07) (16th June 1994)] First draft for review.
\item[Issue 1.27 (1994/10/31) (31 October 1994)] Added $z\_true$ and $z\_exists$ as per version 1.1 of Volume 3 of DRA's specification.
\item[Issue 1.30 (1994/11/09) (9th November 1994)]
Adjusted $ENV\_INFO$ and allowed for type conversions.
\item[Issue 1.32 (1994/12/01)] Updated document references.
\item[Issue 1.33 (1994/12/22)] Accomodated changes to toolkit extensions agreed at the 4th critical review (see \cite{ISS/HAT/DAZ/min005}: $mod$ becomes $intmod$, $Abs$ becomes $abs$).
\item[Issue 1.34 (1995/10/14)] Fixed bug 6 (batch 2).
\item[Issue 1.35 (1995/10/16)] Accomodated changes to data types required for enhancements.
\item[Issue 1.36 (1995/10/17)] Enhancement 11 (and bug 9 (batch 2)).
\item[Issue 1.37 (1995/10/19)] Enhancements 13 and 14.
\item[Issue 1.38 (1995/10/20)] Enhancement 15.
\item[Issue 1.39 (1995/11/23)-1.41 (1995/11/23)] Enhancements to basic declarations.
\item[Issue 1.42 (1995/11/28)] Enhancement 12 (type conversions) and rejig of enhancement 11.
\item[Issues 1.43 (1995/11/29)-1.45 (1995/12/01)] Enhancements 3 and 18.
\item[Issue 1.46 (1995/12/14) (14th December 1995)] Changes according to desk check report 024.
\item[Issue 1.47 (1996/02/12) ] Fixes to bugs 8 and 10 (V0.6) and error reporting.
\item[Issue 1.48 (1996/07/18) ] Fixes to bug 1 (V0.7).
\item[Issue 1.49 (1997/05/29)] IUCT WP 7 changes.
\item[Issue 1.50 (1997/07/18)] IUCT WP 4 changes.
\item[Issue 1.51 (1997/07/30),1.52 (1997/07/31)] Fixing bugs in IUCT WP 4 changes.
\item[Issue 1.53 (1997/07/31)] Improved an error message.
\item[Issue 1.54 (1997/08/18)] Updated references.
\item[Issue 1.54 (1997/08/18)] Updates for SML97.
\item[Issue 1.55 (1999/02/25)] Updates for new INTEGER type.
\item[Issue 1.56 (1999/03/07)] Enhancement R3 --- Assignments to record components.
\item[Issue 1.57 (2000/06/01)] Enhancement R2 --- multiple logical constant definitions.
\item[Issues 1.58 (2000/06/14)-1.61 (2000/06/20)] Enhancement R1 --- multi-dimensional arrays.
\item[Issues 1.62 (2000/10/17)] Enhancement CTLE II R1/2 --- ``Others'' in case statements.
\item[Issues 1.63 (2000/10/18)] Enhancement CTLE II R1/4 --- logical operators on arrays of booleans, including all the basics of overload resolution.
\item[Issues 1.64 (2000/10/18), 1.65 (2000/10/19)] Enhancement CTLE II R1/8 --- characters and strings
\item[Issues 1.66 (2000/10/20)] Enhancement CTLE II R1/5 --- range attributes as ranges
\item[Issues 1.67 (2000/10/24)] Enhancement CTLE II R1/9 --- SPARK 83 attributes
\item[Issues 1.68 (2000/10/26)] Enhancement CTLE II R1/11 --- nested packages
\item[Issues 1.69 (2000/10/29),1.70 (2000/10/30)] Enhancement CTLE II R1/1 --- real types
\item[Issues 1.71 (2000/10/31),1.72 (2000/10/31)] Fixed logic errors in {\it exp\_attrib} and errors in CTLE II R1/5 and R1/6.
\item[Issues 1.73 (2000/12/13)-1.75 (2000/12/13)] Mixed integer/real operations now supported.
\item[Issues 1.76 (2001/11/07)] R0033 --- real number syntax corrected to allow underscores.
\item[Issues 1.77 (2001/11/07)] Made definition of {\it CN\_ENV} match use.
\item[Issue 1.78 (2001/11/08)] R0021: new treatment of AND THEN and OR ELSE.
\item[Issue 1.79 (2001/11/09)] R0021: domain condition generation.
\item[Issue 1.80 (2001/11/10)] R0037: support for named numbers.
\item[Issue 1.81 (2001/12/15)] Fixed {\LaTeX} error.
\item[Issue 1.82 (2001/12/17)--1.85 (2002/01/27)] Added code for R0006: free use of subtype indications and ranges.
\item[Issue 1.86 (2002/01/27)] R0021: domain condition generation --- revised specification does not
generate a domain condition for a $\Xi$ argument to a function.
\item[Issues 1.87 (2002/01/29),1.88 (2002/01/30)] R0044: array range sliding.
\item[Issue 1.89 (2002/02/28)] Changed {\it INFORMAL\_FUNCTION} to {\it Informal\_Function}
to avoid possible clash with an Ada name.
\item[Issues 1.90 (2002/03/21)] Sliding now handled properly in aggregates.
\item[Issues 1.91 (2002/05/02)-1.93 (2002/05/04)] Spring 2002 enhancements: allowing for new syntax for interim release.
\item[Issues 1.94 (2002/05/04)] R0050: discriminants now working.
\item[Issue 1.95 (2002/05/07), 1.96 (2002/05/08)]  Support for R0047: subprogram renaming.
\item[Issue 1.97 (2002/05/09)--1.98 (2002/05/10)]  R0047: object and package renaming.
\item[Issue 1.99 (2002/05/17)] {\it zsucc} is now called {\it z\_succ}.
\item[Issue 1.100 (2002/05/25)] Type marks in constant and variable declarations with initialisers
are now automatically used to qualify the initial expression.
\item[Issue 1.101 (2002/06/01)] Fixed bugs in {\it z\_predexp\_of\_z\_tm}.
\item[Issue 1.102 (2002/07/09)] R0078: ada constant declarations now translated into axiomatic descriptions.
\item[Issues 1.103 (2002/07/13), 1.104 (2002/07/15)] R0054: reworked treatment of use clauses.
\item[Issue 1.105 (2002/07/15)] moved {\it init\_var} in from IMP505.
\item[Issue 1.106 (2002/08/01)] Fixed bug in handling of environment when adjusting qualified expressions.
\item[Issue 1.107 (2002/08/08)] R0051: default parameters.
\item[Issue 1.108 (2002/08/08)] Fixed treatment of default parameters for parameterless calls.
\item[Issue 1.109 (2002/08/23)] Fixed {\LaTeX} error.
\item[Issue 1.110 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.111 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.112 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.113 (2002/11/14)] Made the static evaluation work with the new scheme for translating constants.
\item[Issue 1.114 (2002/12/05)] Schema references in function $\Xi$-lists.
\item[Issue 1.115 (2003/07/17)] It is no longer necessary (and was never correct) to move into
the cache theory before calling {\it term\_of\_z\_tm}.
\item[Issue 1.116 (2004/02/16)] Fixed bug with use clauses and aggregates.
\item[Issue 1.117 (2004/03/05)] Fixed bug with use clauses and selected components.
\item[Issues 1.118 (2004/06/20)-1.122 (2004/07/18)] Reform of the Environments.
\item[Issue 1.123 (2004/07/20)] Adjusting basic declarations now passes on private type declarations.
\item[Issue 1.124 (2004/11/19)] Support for attributes where the type name refers to a type in another package via a use clause.
\item[Issue 1.125 (2005/04/22)] Added support for derived types.
\item[Issue 1.126 (2005/07/26)] Improved error handling in translation of function calls.
\item[Issue 1.127 (2005/07/29)] Added interface so the VC generator can find out whether we are generating domain conditions.
\item[Issue 1.128 (2005/09/08)] Allowed for new scheme for type names in Z.
\item[Issue 1.129 (2005/09/14)] Enhanced error reporting for free variables in basic declarations.
\item[Issue 1.130 (2005/12/07)] Aggregates inside aggregates no longer need to be in qualified expressions.
\item[Issue 1.131 (2006/01/13)] Iterated set unions are now formed left-associatively.
\item[Issue 1.132 (2006/03/17)] Towards enhancement 117: support for expanded forms of type and constant names in Z translation of basic declarations.
\item[Issue 1.133 (2006/03/18)] Aliasing in pre- and post-conditions is now only supported for Ada variables (not constants etc.).
\item[Issue 1.134 (2006/03/23), 1.135 (2006/03/24)] Division of responsibility between adjustment
and translation of basic declarations is changed by enhancement 117.
Now, the translation stage must take care of most of the mapping
names to their canonical forms (since this must be done uniformly for both defining and applies occurrences of the names).
However, the adjustment stage needs to be generating new names properly in the light of what the translation stage will do with them.
\item[Issue 1.136 (2006/04/07)] Under enhancement 117, names of Ada entities used in Z must now be in the canonical form.
Removed code that supported use of aliases.
\item[Issue 1.137 (2006/04/11)] Under enhancement 117, checks on use of names in Z are now given a uniform treatment.
\item[Issue 1.138 (2006/04/12)] Support for general expanded names under enhancement 117.
\item[Issue 1.139 (2006/04/20)] Ada real literals are now translated into Z floating point literals.
\item[Issue 1.140 (2006/05/04)] Improved error messages for numeric literals.
\item[Issue 1.141 (2006/05/05)] Function renaming is now dealt with through the environment.
\item[Issue 1.142 (2006/06/12)] Further improvements to error messages for numeric literals.
\item[Issue 1.143 (2007/05/28)] Range checks for real types.
\item[Issue 1.144 (2007/08/04), 1.145 (2008/02/18)] Tidying error messages for empty integer and real types.
\item[Issue 1.146 (2008/03/23)] Child packages.
\item[Issues 1.147 (2008/05/05)--1.149 (2008/05/05)] Modular types.
\item[Issue 1.150 (2008/07/24)] Support for modular types temporarily withdrawn.
\item[Issue 1.151 (2010/02/11)] Removed obsolete CUTDOWNVERSION option.
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
The detailed design for this material is in \cite{ISS/HAT/DAZ/DTD508}.
\subsection{Introduction}
\subsection{Purpose and Background}
See \cite{ISS/HAT/DAZ/DTD508}.
\subsection{Algorithms}
The algorithms to generate the basic declarations and expressions are specified in \cite[volume 3]{DRA/CIS/CSE3/TR/94/27/3.0}.

%\subsection{Dependencies}
%\subsection{Known Deficencies}
%\subsection{Possible Enhancements}
=TEX

\section{PREAMBLE}

=SML
infix 3 ^^;
=TEX
=SML
structure ⦏CNBasicDeclsAndExprs⦎ : CNBasicDeclsAndExprs = struct
	open	CNTypes ZGeneratedConstants ZParagraphs
		ZUserInterfaceSupport ZTypesAndTermsSupport ZTermGenerator ZTypeInference;
=TEX
\section{SUPPORTING FUNCTIONS}
\subsection{Miscellaneous}
As discussed with DRA during the (first) enhancements programme, the treatment
of constructs which cannot be handled formally changed between releases 0.5 and 0.6.
Now that the user can bypass the formal processing of such a construct (as an arbitrary ada insertion), there is no need to attempt to continue processing when such a construct appears here, except in cases where failure to translate a construct is used to redirect the flow of control.
In order to encourage better messages, the exception $Informal$ and associated functions have been removed and the usual {\Product} error mechanisms are used instead.
=TEX
=SML
fun zid1 ⦏^^⦎ zid2 = (
	zid1^"v"^zid2
);
=TEX
=SML
fun ⦏dest_range⦎ ((RRange range) : EXP RANGE) : EXP RANGELOHI = (
	range
) | dest_range (RRangeAttr (EAttribute {prefix,
		attribute_desig = ADAttrib "RANGE"})) = (
	{lo = EAttribute {prefix = prefix, attribute_desig = ADAttrib "FIRST"},
	 hi = EAttribute {prefix = prefix, attribute_desig = ADAttrib "LAST"} }
) | dest_range (RRangeAttr (EAttribute {prefix,
		attribute_desig = ADAttribArg("RANGE", e)})) = (
	{lo = EAttribute {prefix = prefix, attribute_desig = ADAttribArg("FIRST", e)},
	 hi = EAttribute {prefix = prefix, attribute_desig = ADAttribArg("LAST", e)} }
) | dest_range _  = fail "dest_range" 508020 [];
=TEX
=TEX

The following were not asked for in the specification
but are convenient to have available at various points in the code.
=SML
val ⦏z_int_type⦎ = type_ofⓩ0⌝;
val ⦏z_int_set_type⦎ = type_of ⓩℤ⌝;
val ⦏z_int_int_rel_type⦎ = type_of ⓩℤ × ℤ⌝;
val ⦏ℤ_tm⦎ = ⓩℤ⌝;
=TEX
=SML
val ⦏z_real_type⦎ = type_ofⓩ0.0⌝;
val ⦏z_real_set_type⦎ = type_ofⓩ{0.0}⌝;
val ⦏ℝ_tm⦎ = ⓩℝ⌝;
=TEX
\section{Evaluation of Constant Expressions}
Constant expressions need to be evaluated in the translation of array attributes with
arguments and in deciding whether a VC needs to be generated
For various reasons, it has been agreed that attributes that are functions will not be statically evaluated.

=TEX
First of all we define a conversion which will expand the definition of a constant integral or real number or a set of integers providing the definition is a simple equation and providing the constant does not appear in the list provided as an extra argument (this is used to avoid looping in the presence of somewhat mailiciously conceived definitions).

=SML
fun ⦏cn_const_conv⦎ (consts : TERM list) : CONV = (fn tm =>
	(if	tm term_mem consts
	then	fail_conv
	else	COND_C
		(fn tm => is_const tm andalso
			let	val ty = type_of tm;
			in	ty = z_int_type
			orelse	ty = z_real_type
			orelse ty = z_int_set_type
			end)
		(fn tm =>
			let	val thm1 = z_get_spec tm;
				val thm2 = ∧_right_elim thm1 handle Fail _ => thm1;
			in	simple_eq_match_conv thm2 tm
			end)
		fail_conv
	) tm
);
=TEX
Now conversions to handle a few other cases which are not directly handled by available tools.
The conversion for \verb"#" is required for array length attributes.
=SML
val ⦏z_minus_minus_thm⦎ = pc_rule1 "z_library" prove_rule[] ⌜∀i ⦁ⓩ~ ~i = i⌝⌝;

val ⦏z_minus_minus_conv⦎ = simple_eq_match_conv z_minus_minus_thm;

val ⦏z_hash_thm⦎ = asm_rule ⌜∀i j⦁ⓩ#(i .. j) = (j - i) + 1⌝⌝;

val ⦏z_hash_conv⦎ : CONV = simple_eq_match_conv z_hash_thm;
=TEX
=SML
val ⦏z_ℝ_minus_minus_thm⦎ = pc_rule1 "'z_reals" prove_rule[] ⌜∀x ⦁ⓩ~⋎R ~⋎R x = x⌝⌝;

val ⦏z_ℝ_minus_minus_conv⦎ = simple_eq_match_conv z_ℝ_minus_minus_thm;

val ⦏z_ℝ_subtract_minus_thm⦎ = pc_rule1 "'z_reals" prove_rule[] ⌜∀x y⦁ⓩx -⋎R y = x +⋎R ~⋎R y⌝⌝;

val ⦏z_ℝ_subtract_minus_conv⦎ = simple_eq_match_conv z_ℝ_subtract_minus_thm;
=TEX
Now a conversional for propagating a conversion into the operands of a unary or binary Z function.
=SML
fun ⦏MY_Z_RANDS_C⦎ (c : CONV) : CONV = (fn tm =>
	(	((dest_z_tuple o snd o dest_z_app) tm;
			RAND_C (RAND_C c AND_OR_C RATOR_C(RAND_C c)))
				handle Fail _ => RAND_C c	) tm
	
);
=TEX
We put these pieces together to give the following conversion which does the required static evaluation of numeric expressions.
The parameter to the conversion is used to record which constants have had their definitions unwound somewhere in the branch of the expression tree currently being attacked and is used to avoid infinite recursion (e.g., if someone has used HOL to produce something which looks like a Z global variable with a definition like $X = X$ or $X = X + 0$).
=SML
fun ⦏cn_eval_conv⦎ (consts : TERM list) : CONV = (fn tm => (
		MY_Z_RANDS_C (cn_eval_conv consts)
		AND_OR_C
		(fn t => (cn_const_conv consts
			THEN_TRY_C cn_eval_conv (consts term_grab t)) t)
		AND_OR_C (FIRST_C [
				z_hash_conv,
				z_subtract_minus_conv,
				z_minus_minus_conv,
				z_ℝ_minus_minus_conv,
				z_ℝ_subtract_minus_conv]
			THEN_TRY_C cn_eval_conv consts)
		AND_OR_C FIRST_C [
			z_plus_conv,
			z_times_conv,
			cn_intmod_conv,
			cn_intdiv_conv,
			cn_rem_conv,
			cn_star_star_conv,
			z_abs_conv,
			z_float_conv,
			z_ℝ_eval_conv,
			z_ℝ_ℤ_exp_conv,
			z_ℝ_lit_norm_conv
		])	tm
);
=TEX
The handling of ranges uses the above function directly.
The following is the interface used in handling attributes.
=SML
fun ⦏eval_attr_arg⦎ (ze : Z_EXP) : int = (
	let	val n = (dest_z_signed_int o snd o dest_eq o
				snd o dest_thm o TRY_C(cn_eval_conv[])) ze;
	in	if 	n @> integer_of_int 0
		then	int_of_integer n
		else	term_fail "eval_attr_arg" 508030 [ze]
	end	handle	Fail _ => term_fail "eval_attr_arg" 508029 [ze]
);
=TEX
\section{SUPPORT FOR Z ABSTRACT SYNTAX}
\subsection{Z Unary Expressions}
=SML
val		⦏z_unary_minus⦎ =		ⓩ(~ _)⌝;
val		⦏z_bool_not⦎ =		ⓩ(not _)⌝;
val		⦏z_abs⦎ =		ⓩ(abs _)⌝;
val		⦏z_char_lit⦎ =		ⓩ(char_lit _)⌝;
val		⦏z_string_lit⦎ =		ⓩ(string_lit _)⌝;
val		⦏z_real_unary_minus⦎ =	ⓩ(~⋎R _)⌝;
val		⦏z_real_abs⦎ =		ⓩ(abs⋎R _)⌝;
val		⦏z_array_not⦎ =		ⓩ(array_not _)⌝;
val		⦏z_mod_not⦎ =		ⓩ(mod_not _)⌝;
=TEX
\subsection{Z Binary Expressions}
=SML
val 		⦏z_bool_and⦎ =		ⓩ(_ and _)⌝;
val		⦏z_bool_or⦎ =		ⓩ(_ or _)⌝;
val		⦏z_bool_xor⦎ =		ⓩ(_ xor _)⌝;
val 		⦏z_bool_and_then⦎ =	ⓩ(_ and_then _)⌝;
val 		⦏z_bool_or_else⦎ =	ⓩ(_ or_else _)⌝;
val		⦏z_bool_eq⦎ =		ⓩ(_ eq _)⌝;
val		⦏z_bool_noteq⦎ =		ⓩ(_ noteq _)⌝;
val		⦏z_bool_less⦎ =		ⓩ(_ less _)⌝;
val		⦏z_bool_less_eq⦎ =	ⓩ(_ less_eq _)⌝;
val		⦏z_bool_greater⦎ =	ⓩ(_ greater _)⌝;
val		⦏z_bool_greater_eq⦎ =	ⓩ(_ greater_eq _)⌝;
val		⦏z_add⦎ =		ⓩ(_ + _)⌝;
val		⦏z_minus⦎ =		ⓩ(_ - _)⌝;
val		⦏z_times⦎ =		ⓩ(_ * _)⌝;
val		⦏z_intdiv⦎ =		ⓩ(_ intdiv _)⌝;
val		⦏z_mod⦎ =		ⓩ(_ intmod _)⌝;
val		⦏z_rem⦎ =		ⓩ(_ rem _)⌝;
val		⦏z_expon⦎ =		ⓩ(_ ** _)⌝;
val		⦏z_bool_mem⦎ =		ⓩ(_ mem _)⌝;
val		⦏z_bool_notmem⦎ =		ⓩ(_ notmem _)⌝;
val		⦏z_array_and⦎ =		ⓩ(_ array_and _)⌝;
val		⦏z_array_or⦎ =		ⓩ(_ array_or _)⌝;
val		⦏z_array_xor⦎ =		ⓩ(_ array_xor _)⌝;
val		⦏z_array_greater⦎ =	ⓩ(_ array_greater _)⌝;
val		⦏z_array_greater_eq⦎ =	ⓩ(_ array_greater_eq _)⌝;
val		⦏z_array_less⦎ =		ⓩ(_ array_less _)⌝;
val		⦏z_array_less_eq⦎ =	ⓩ(_ array_less_eq _)⌝;
val		⦏z_array_array_cat⦎ =	ⓩ(_ &⋎0 _)⌝;
val		⦏z_array_elem_cat⦎ =	ⓩ(_ &⋎1 _)⌝;
val		⦏z_elem_array_cat⦎ =	ⓩ(_ &⋎2 _)⌝;
val		⦏z_mod_and⦎ =		ⓩ(_ mod_and _)⌝;
val		⦏z_mod_or⦎ =		ⓩ(_ mod_or _)⌝;
val		⦏z_mod_xor⦎ =		ⓩ(_ mod_xor _)⌝;
val		⦏z_real_add⦎ =		ⓩ(_ +⋎R _)⌝;
val		⦏z_real_minus⦎ =		ⓩ(_ -⋎R _)⌝;
val		⦏z_real_times⦎ =		ⓩ(_ *⋎R _)⌝;
val		⦏z_real_div⦎ =		ⓩ(_ /⋎R _)⌝;
val		⦏z_real_expon⦎ =		ⓩ(_ ^⋎Z _)⌝;
val		⦏z_bool_real_less⦎ =	ⓩ(_ real_less _)⌝;
val		⦏z_bool_real_less_eq⦎ =	ⓩ(_ real_less_eq _)⌝;
val		⦏z_bool_real_greater⦎ =	ⓩ(_ real_greater _)⌝;
val		⦏z_bool_real_greater_eq⦎ =	ⓩ(_ real_greater_eq _)⌝;
=TEX
\subsection{Attribute Names}
=SML
val		⦏zbase⦎ = "BASE";
val		⦏zfst⦎ = "FIRST";
val		⦏zlst⦎ = "LAST";
val		⦏zsuc⦎ = "SUCC";
val		⦏zpred⦎ = "PRED";
val		⦏zpos⦎ = "POS";
val		⦏zval⦎ = "VAL";
val		⦏zlength⦎ = "LENGTH";
val		⦏zrange⦎ = "RANGE";
val		⦏zdigits⦎ = "DIGITS";
val		⦏zdelta⦎ = "DELTA";
val		⦏zmodulus⦎ = "MODULUS";
=TEX

\subsection{Z Expressions}
The following function allows many of the Z constructor functions to be presented in a way which is visually appealing.
The {\it ts} argument represents a substitution, e.g.,
=INLINEFT
[(ⓩ1⌝, "a"), (ⓩ6⌝, "b")]
=TEX
; the second argument represents a template term containing an instance
of the Z term we want to construct using the variables from the substitution
as operands, e.g.,
=INLINEFT
ⓩa .. b⌝
=TEX
; the result is the desired term, e.g.,
=INLINEFT
ⓩ1 .. 6⌝
=TEX
.
The types of the template operator are instantiated as necessary
to match the type of the required actual operands.

=SML
fun ⦏cn_subst⦎ (ts : (TERM * string) list) (tm : TERM) : TERM = (
let	val freevars = frees tm;
	val fvs = map dest_var freevars;
	val newtys = map (fn (tm,c) => (c, type_of tm)) ts;
	val tymap = map (fn (n, ty) => (ty,lassoc3 fvs n)) newtys;
	val tymap' = (fn (t1,t2) => type_match
		(mk_ctype ("TYPE",t1)) (mk_ctype("TYPE",t2))) (split tymap);
	val tm_inst = inst [] tymap' tm;
	val namemap = map (fn (tm, s) => (tm, mk_var(s, lassoc3 newtys s))) ts;
in
	subst namemap tm_inst
end);
=TEX
=TEX
=SML
val ⦏z_slide_term⦎ : TERM = ⓩslide(f, r)⌝;
fun ⦏z_slide⦎ (exp1 : Z_EXP, exp2 : Z_EXP) : Z_EXP = (
	cn_subst [(exp1, "f"), (exp2, "r")] z_slide_term
);
=TEX
=SML
val ⦏z_succ⦎ : Z_EXP = ⓩsucc⌝;
=TEX
=SML
fun ⦏zid⦎ (env : CN_ENV) (id : Z_ID) : Z_EXP = (
	let	val {tipe, canon_name, info, private} = (
			case env id of
				Value tci => tci
			|	Nil => fail "zid" 508021 [fn()=>id]
		);
	in	case info of
			EIEnvVar {kind = VKOutOfScope, ...}  =>  fail "zid" 508077 [fn()=>id]
		|	EIEnvVar _ =>  mk_z_lvar(canon_name, force_value tipe, [])
		|	EIEnvAuxVar {in_scope = false, ...} =>    fail "zid" 508077 [fn()=>id]
		|	EIEnvAuxVar _ =>  mk_z_lvar(canon_name, force_value tipe, [])
		|	EIEnvLogCon _ =>  mk_z_lvar(canon_name, force_value tipe, [])
		|	_ => mk_z_gvar(canon_name, force_value tipe, [])
	end	handle ex as (Fail _) => (
		divert ex "force_value" "zid" 508078 [fn _ => id]
	)
);
=TEX
=SML
val ⦏z_num⦎ : INTEGER -> Z_EXP = mk_z_signed_int;
=TEX
=SML
val ⦏z_real_to_integer_term⦎ : TERM = ⓩreal_to_integer a⌝;
fun ⦏z_real_to_integer⦎ (exp : Z_EXP) : Z_EXP = (
	cn_subst [(exp, "a")] z_real_to_integer_term
);
=TEX
=SML
val ⦏z_integer_to_real_term⦎ : TERM = ⓩinteger_to_real a⌝;
fun ⦏z_integer_to_real⦎ (exp : Z_EXP) : Z_EXP = (
	cn_subst [(exp, "a")] z_integer_to_real_term
);
=TEX
=SML
val ⦏z_string⦎ : string -> Z_EXP = mk_z_string;
=TEX
=SML
val ⦏z_tfun_term⦎ : TERM = ⓩa → b⌝;
fun ⦏z_tfun⦎ (exp1 : Z_EXP, exp2 : Z_EXP) : Z_EXP = (
	cn_subst [(exp1, "a"), (exp2, "b")] z_tfun_term
);
=TEX
=SML
val ⦏z_pfun_term⦎ : TERM = ⓩa ⇸ b⌝;
fun ⦏z_pfun⦎ (exp1 : Z_EXP, exp2 : Z_EXP) : Z_EXP = (
	cn_subst [(exp1, "a"), (exp2, "b")] z_pfun_term
);
=TEX
=SML
val ⦏z_rng_term1⦎ : TERM = ⓩa .. b⌝;
val ⦏z_rng_term2⦎ : TERM = ⓩa ..⋎R b⌝;
fun ⦏z_rng⦎ (exp1 : Z_EXP, exp2 : Z_EXP) : Z_EXP = (
	cn_subst [(exp1, "a"),(exp2, "b")] z_rng_term1
	handle Fail _ =>
	cn_subst [(exp1, "a"),(exp2, "b")] z_rng_term2
);
=TEX
=SML
val ⦏z_dom_term⦎ : TERM = ⓩdom a⌝;
fun ⦏z_dom⦎ (exp : Z_EXP) : Z_EXP = (
	cn_subst [(exp, "a")] z_dom_term
);
=TEX
=SML
val ⦏z_dom_res_term⦎ : TERM = ⓩa ◁ b⌝;
fun ⦏z_dom_res⦎ (exp1 : Z_EXP, exp2 : Z_EXP) : Z_EXP = (
	cn_subst [(exp1, "a"),(exp2, "b")] z_dom_res_term
);
=TEX
=SML
val ⦏z_inv_term⦎ : TERM = ⓩa ↗~↕⌝;
fun ⦏z_inv⦎ (exp : Z_EXP) : Z_EXP = (
	cn_subst [(exp, "a")] z_inv_term
);
=TEX
=SML
val ⦏z_id_rel_term⦎ : TERM = ⓩid a⌝;
fun ⦏z_id_rel⦎ (exp : Z_EXP) : Z_EXP = (
	cn_subst [(exp, "a")] z_id_rel_term
);
=TEX
=SML
val ⦏z_size_term⦎ : TERM = ⓩ# a⌝;
fun ⦏z_size⦎ (exp : Z_EXP) : Z_EXP = (
	cn_subst [(exp, "a")] z_size_term
);
=TEX
=SML
val ⦏z_empty_set_term⦎ : TERM = ⓩ{}⌝;
fun ⦏z_set⦎ ((exps as e::rest) : Z_EXP list) : Z_EXP = (
	mk_z_setd(type_of e, exps)
) | z_set _ = z_empty_set_term;
=TEX
=SML
val ⦏z_set_minus_term⦎ : TERM = ⓩa \ b⌝;
fun ⦏z_set_minus⦎ (exp1 : Z_EXP, exp2 : Z_EXP) : Z_EXP = (
	cn_subst [(exp1, "a"), (exp2, "b")] z_set_minus_term
);
=TEX
=SML
fun ⦏z_set_comp⦎ (zdecl : Z_DECL, p : Z_EXP) : Z_EXP = (
let	val dec = (fst o dest_z_dec) zdecl
			handle _ =>
			  error "z_set_comp" 508023 [fn()=>string_of_term zdecl];
	val zdexp = case dec of
		[dec] => dec
		|_ => mk_z_tuple dec;
	val tm = mk_z_seta (mk_z_decl [zdecl], p, zdexp);
	val side = seta_gen_semantic_const tm;
in
	tm
end
);
=TEX
=SML
val ⦏z_power_term⦎ : TERM = ⓩa ↗ b ↕⌝;
fun ⦏z_power⦎ (exp1 : Z_EXP, exp2 : Z_EXP) : Z_EXP = (
	cn_subst [(exp1, "a"), (exp2, "b")] z_power_term
);
=TEX
=SML
val ⦏z_rel_comp_term⦎ : TERM = ⓩa ⨾ b⌝;
fun ⦏z_rel_comp⦎ (exp1 : Z_EXP, exp2 : Z_EXP) : Z_EXP = (
	cn_subst [(exp1, "a"), (exp2, "b")] z_rel_comp_term
);
=TEX
=SML
val ⦏z_empty_seq_term⦎ : TERM = ⓩ⟨⟩⌝;
fun ⦏z_seq⦎ ((exps as e::rest) : Z_EXP list) : Z_EXP = (
	mk_z_⟨⟩(type_of e, exps)
) | z_seq _ = z_empty_seq_term;
=TEX
=SML
val ⦏z_cross_term⦎ : TERM = ⓩa × b⌝;
fun ⦏z_cross⦎ (exp1 : Z_EXP, exp2 : Z_EXP) : Z_EXP = (
	cn_subst [(exp1, "a"), (exp2, "b")] z_cross_term
);
=TEX
=SML
fun ⦏z_many_cross⦎ (tms : Z_EXP list) : Z_EXP = (
	case	tms of
		[tm] => tm
	|	_ => (
		let	val prod = mk_z_× tms;
		in	×_gen_semantic_const prod;
			prod
		end
	)
);
=TEX
=SML
val ⦏z_override_term⦎ : TERM = ⓩa ⊕ b⌝;
fun ⦏z_override⦎ (exp1 : Z_EXP, exp2 : Z_EXP) : Z_EXP = (
	cn_subst [(exp1, "a"), (exp2, "b")] z_override_term
);
=TEX
=SML
val ⦏z_union_term⦎ : TERM = ⓩa ∪ b⌝;
fun ⦏z_many_union⦎ (exps : Z_EXP list) : Z_EXP = (
let	fun non_empty (e::rest) = (
		if (((length o snd o dest_z_setd) e) = 0 handle _ => false)
		then
			non_empty rest
		else
			e::non_empty rest
	) | non_empty _ = [];
	fun aux (exps as e1::e2::rest) = (
		aux
		(cn_subst [(e1, "a"), (e2, "b")] z_union_term::rest)
	) | aux [e] = e
	  | aux _ = error "z_many_union" 508024 [];
in
	(aux o non_empty) exps
end
);
=TEX
=SML
fun ⦏z_binding⦎ (cmpvals : (string * Z_EXP) list) : Z_EXP = (
	let	val bdg = mk_z_binding cmpvals;
	in	binding_gen_semantic_const bdg;
		bdg
	end
);
=TEX
=SML
fun ⦏z_tuple⦎ ([exp] : Z_EXP list) : Z_EXP = (
	exp
) | z_tuple (exps : Z_EXP list) : Z_EXP = (
	let	val tuple = mk_z_tuple exps;
	in	tuple_gen_semantic_const tuple;
		tuple
	end
);
=TEX
=SML
fun ⦏z_theta⦎ (exp : Z_EXP) : Z_EXP = (
	mk_z_θ (exp, "")
);
=TEX
The following function constructions a Z application given a function
and its argument (which will be a pair if we are constructing an application
of a binary operator).
If necesary, the type of the function is instantiated to match that of the argument.
=SML
fun mk_and_chk_z_app (fx as (f: Z_EXP, x : Z_EXP)) : Z_EXP = (
	mk_z_app fx handle Fail _ => (
		let	val ty = hd(dest_z_tuple_type
					(dest_z_power_type (type_of f)));
			val tysubs = type_match (type_of x) ty;
			val f' = inst [] tysubs f;
		in	mk_z_app (f', x)
		end
	) handle Fail _ => term_fail "trans_exp" 508071 [f, x]
);
=TEX
=SML
val ⦏z_unary_exp⦎ : (Z_EXP * Z_EXP) -> Z_EXP = mk_and_chk_z_app;
=TEX
=SML
fun ⦏z_bin_exp⦎ (left : Z_EXP, bop : Z_EXP, right : Z_EXP) : Z_EXP = (
	mk_and_chk_z_app (bop, mk_z_tuple[left, right])
);
=TEX
=SML
fun ⦏z_fun_call⦎ (exp :Z_EXP, exps : Z_EXP list) : Z_EXP = (
	case exps of
	[] =>	exp
	|[e] =>		mk_and_chk_z_app (exp, e)
	|_ => (
		let	val tup = mk_z_tuple exps;
			val side = tuple_gen_semantic_const tup;
		in
			mk_and_chk_z_app (exp, tup)
		end
	)
);
=TEX
=SML
val ⦏z_selection⦎ : (Z_EXP * Z_ID) -> Z_EXP = mk_z_sel⋎s;
=TEX
=SML
val ⦏z_maplet_term⦎ : TERM = ⓩa ↦ b⌝;
fun ⦏z_maplet⦎ (exp1 : Z_EXP, exp2 : Z_EXP) : Z_EXP = (
	cn_subst [(exp1, "a"), (exp2, "b")] z_maplet_term
);
=TEX
=SML
val ⦏z_powerset⦎ : Z_EXP -> Z_EXP = mk_z_ℙ;
=TEX
=SML
fun ⦏other_z_exp⦎ (exp : Z_EXP) : Z_EXP = exp;
=TEX

\subsection{Z Predicates}
=SML
val ⦏z_true⦎ : Z_PRED = mk_z_true;
=TEX
=SML
val ⦏z_eq⦎ : (Z_EXP * Z_EXP) -> Z_PRED = mk_z_eq;
=TEX
=SML
val ⦏z_and⦎ : (Z_PRED * Z_PRED) -> Z_PRED = mk_z_∧;
=TEX
=SML
fun ⦏z_many_and⦎ ((exps as e1::e2::rest) : Z_PRED list) : Z_PRED = (
	mk_z_∧ (e1, z_many_and (e2::rest))
) | z_many_and [e] = e
  | z_many_and _ = z_true;
=TEX
=SML
val ⦏z_elem⦎ : (Z_EXP * Z_EXP) -> Z_EXP = mk_z_∈;
=TEX
=SML
val ⦏z_notelem_term⦎ : TERM = ⓩa ∉ b⌝;
fun ⦏z_notelem⦎ (exp1 : Z_EXP, exp2 : Z_EXP) : Z_PRED = (
	cn_subst [(exp1, "a"), (exp2, "b")] z_notelem_term
);
=SML
val ⦏z_noteq_term⦎ : TERM = ⓩa ≠ b⌝;
fun ⦏z_noteq⦎ (exp1 : Z_EXP, exp2 : Z_EXP) : Z_PRED = (
	cn_subst [(exp1, "a"), (exp2, "b")] z_noteq_term
);
=TEX

=SML
val ⦏z_less_eq_term⦎ : TERM = ⓩa ≤ b⌝;
fun ⦏z_less_eq⦎ (exp1 : Z_EXP, exp2 : Z_EXP) : Z_PRED = (
	cn_subst [(exp1, "a"), (exp2, "b")] z_less_eq_term
);
=TEX

=SML
val ⦏z_greater_term⦎ : TERM = ⓩa > b⌝;
fun ⦏z_greater⦎ (exp1 : Z_EXP, exp2 : Z_EXP) : Z_PRED = (
	cn_subst [(exp1, "a"), (exp2, "b")] z_greater_term
);
=TEX

=SML
fun ⦏z_forall⦎ (zdecls : Z_DECL list, zp : Z_PRED) : Z_PRED = (
	mk_z_∀ (mk_z_decl zdecls, z_true, zp)
);
=TEX

=SML
fun ⦏z_exists⦎ (zdecls : Z_DECL list, zp : Z_PRED) : Z_PRED = (
	mk_z_∃ (mk_z_decl zdecls, z_true, zp)
);
=TEX

=SML
val ⦏z_imp⦎ : (Z_PRED * Z_PRED) -> Z_PRED = mk_z_⇒;
=TEX

=SML
val ⦏z_mem⦎ : (Z_EXP * Z_EXP) -> Z_PRED = mk_z_∈;
=TEX

=SML
fun ⦏other_z_pred⦎ (z_pred : Z_PRED) : Z_PRED = z_pred;
=TEX
=SML
val ⦏z_tm_true⦎ =
=SML
  ZUserInterfaceSupport.ZTmTruth true;
=TEX
The following functions support the external interface $z\_predexp\_of\_z\_tm$.
=SML
fun ⦏z_para_of_zinferred⦎ ((ZInferred p) : Z_INFERRED) : Z_PARA = (p)
|   z_para_of_zinferred (ZTypeError inf) = (print_z_error inf);

=TEX
The following is used to give diagnostics, which may sometimes be helpful.
=SML
val ⦏cn_show_typing_context⦎ : bool ref = ref false;
val _ = new_flag{
	name="cn_show_typing_context",
	check=fun_true,
	control=cn_show_typing_context,
	default=fun_false} handle Fail _ => ();
=TEX
=SML
fun ⦏show_typing_context⦎ (t : TERM OPT) = (
	if	!cn_show_typing_context
	then	let	val cur_thy = get_current_theory_name();
			val zlib = (get_ancestors "z_library" less "z_library")
						handle Fail _ => [];
			val ancs = Sort.sort Sort.string_order
					(get_ancestors cur_thy less cur_thy)
					diff zlib;
			val tic = map dest_var (TypeInference.get_ti_context());
			fun do1tici (n, ty) = "  " ^ n ^ ": " ^ string_of_type ty;
		in	diag_line ("Current theory: " ^ cur_thy);
			diag_line
			(case zlib of [] => "Ancestors:"
			| _ => "Ancestors (up to z_library):");
			app (diag_line o (curry (op^) "  ")) ancs;
			diag_line
			(case tic of [] => "No type inference context."
			| _ => "Type inference context:");
			app (diag_line o do1tici) tic;
			(case t of
				Value tm =>
			diag_line ("Type-checked term: " ^ string_of_term tm)
			|	Nil => ());
			()
		end
	else	()
);
=TEX
=SML
fun ⦏term_of_z_para⦎ ((ZParaTerm (gpars, tm, _)) : Z_PARA) : TERM = (
    let	val vns = map string_of_ident gpars;
	val vs = map (fn vn =>
		mk_var(vn, mk_z_power_type(mk_vartype ("'" ^ vn)))) vns;
    in	list_mk_∀(vs, term_of_z_tm tm)
    end
) | term_of_z_para _ = (fail "z_term_recogniser" 49001 []);
=TEX

=SML
=SML
val ⦏init_var_suffix⦎ : string = "⋎0";
=TEX
The following function decorates a string with a subscript ``0'' and is used to give the initial version of a variable name.
=SMLPLAIN
fun ⦏init_var⦎ (name : string) : string = name ^ init_var_suffix;
fun ⦏dest_init_var⦎ (n : string)  : string * string = (
	case rev (explode n) of
		"0" :: "⋎" ::  more => (implode(rev more), init_var_suffix)
	|	_ =>  (n, "")
);
=TEX
=SML
fun ⦏undeclared_ids⦎ (env : CN_ENV) (vs : Z_ID list) : Z_ID list = (
	vs drop (fn v =>
		case  env (fst(dest_init_var v)) of
		Value _ => true
	|	Nil => false)
);
=TEX
=SML
fun ⦏noncanonical_ids⦎ (env : CN_ENV) (vs : Z_ID list) : string list = (
	let	fun aux acc [] = rev acc
		|   aux acc (v :: more) = (
			let	val (n, sfx) = dest_init_var v;
			in	case  env n of
			Value {canon_name, ...} =>
				if	n = canon_name
				then	aux acc more
				else	aux (n ^ " (" ^  canon_name  ^ sfx ^ ")"::acc) more
			|	Nil => aux acc more
			end
		);
	in	aux [] vs
	end
);
=TEX
=SML
fun ⦏z_free_var_report⦎ (msg : int) (tmo : TERM OPT) (things : string list) : unit = (
	let	val opt_s = case things of [_] => "" |  _ => "s";
		val is_are = case things of [_] => "is" |  _ => "are";
		val hdr1 = case tmo of
			Nil => ""
		|	Value tm => get_error_message 508018 [string_of_term tm] ^ " ";
		val hdr2 = get_error_message msg [opt_s, is_are];
	in	diag_line(hdr1 ^ hdr2);
		app diag_line((Sort.sort Sort.string_order) things)
	end
);
=TEX
=SML
fun ⦏z_predexp_of_z_tm_report⦎ (env : CN_ENV) (tmo : TERM OPT) (vs : Z_ID list) : unit = (
	case undeclared_ids env vs of
		udvs as (_::_) => (
			z_free_var_report 508010 tmo udvs;
			fail "z_predexp_of_z_tm" 508019 []
	) |	[] => (
		case noncanonical_ids env vs of
			ncvs as (_::_) => (
				z_free_var_report 508011 tmo ncvs;
			fail "z_predexp_of_z_tm" 508019 []
		) |	[] => ()
	)
);
=TEX
=SML
fun ⦏z_predexp_of_z_tm⦎ (env : CN_ENV)  (z_tm : Z_TM) : Z_PRED = (
	 let	fun mk_tm () = (
			let	val standard = get_flag "standard_z_terms";
				val z_para = ZParaTerm ([], z_tm, Nil);
				val type_checked = type_check_z_para
					 {standard = standard, allow_frees = true} z_para;
				val para = z_para_of_zinferred type_checked;
				val tm = term_of_z_para para;
			in	Value tm
			end	handle Fail _ => Nil
		);
		val tmo = mk_tm();
	 in	show_typing_context tmo;
		(case diag_free_vars () of
			[] => ()
		|	fvs => z_predexp_of_z_tm_report env tmo fvs);
		(case tmo of
			Value tm => tm
		|	_ => fail "z_predexp_of_z_tm" 508019 [])
	 end
);
=TEX
=SML
fun ⦏name_to_tmark⦎ (e : EXP) : TMARK = (
    case e
    of EId id => id
    |  ESelectedComp {prefix, selector} => (name_to_tmark prefix)^"o"^selector
    |  _ => "__invalid"
);
=TEX
=SML
fun ⦏is_range_attribute⦎ (EAttribute{attribute_desig=ad,...} : EXP)  : bool = (
    case ad
    of ADAttrib attname => attname = "RANGE"
    |  ADAttribArg (attname,_) => attname = "RANGE")
    |  is_range_attribute _ = false;
=TEX
=SML
fun ⦏exp_to_discrete_range⦎ (EDiscreteRange (DRConstrained{tmark, range}) : EXP)
	: SI_DISCRETE_RANGE = (
	SIDiscreteRangeSubInd{tmark = tmark, con = CRange range}
) | exp_to_discrete_range (EDiscreteRange (DRRange range)) = (
	SIDiscreteRangeRange range
) | exp_to_discrete_range e = (
	if	is_range_attribute e
	then	SIDiscreteRangeRange(RRangeAttr e)
  	else	case name_to_tmark e of
			"__invalid"  =>  fail "exp_to_discrete_range" 508091 []
		|	tmk => SIDiscreteRangeSubInd{tmark = tmk, con = CNoCon}
);
=TEX


\subsection{Z Paragraphs}
=SML
fun ⦏z_ax⦎ (construct : string) (id : Z_ID, exp : Z_EXP, preds : Z_PRED list) : PARAINFO = (
	let	val ty = dest_z_power_type (type_of exp);
		val var = mk_var(id, ty);
		val decl = mk_z_decl[mk_z_dec([mk_var(id, ty)], exp)];
		val pred = case preds of
				[] => Nil
			|	_ => Value (list_mk_∧ preds);
		val vs = case pred of
				Nil => []
			|	Value p => frees p term_less var;
	in	case vs of
			[] => AxDesInfo([], decl, pred, [(id, ty)])
		|	_::_ =>
		let	fun s () = case vs of [_] => "" | _ => "s";
		in	fail "z_ax" 508106
			[fn () => construct,
			 fn () => format_list string_of_term vs ", ",
			 s]
		end

	end
);
=TEX
=SML
fun ⦏z_eq_eq⦎ (construct : string) (id : Z_ID, exp : Z_EXP) : PARAINFO = (
	case frees exp of
		[] => AbbDefInfo (id, [], exp)
	|	vs =>
		let	fun s () = case vs of [_] => "" | _ => "s";
		in	fail "z_eq_eq" 508106
			[fn () => construct,
			 fn () => format_list string_of_term vs ", ",
			 s]
		end
);
=TEX
=SML
fun ⦏z_simple_free_type⦎ (construct : string)
	(id : Z_ID, con : Z_ID, exp : Z_EXP) : PARAINFO = (
	case frees exp of
		[] => FreeTypeInfo [(id, [(con, Value exp)])]
	|	vs =>
		let	fun s () = case vs of [_] => "" | _ => "s";
		in	fail "z_simple_free_type" 508106
			[fn () => construct,
			 fn () => format_list string_of_term vs ", ",
			 s]
		end
);
=TEX
=SML
fun ⦏z_given⦎ (id : Z_ID) : PARAINFO = (
	GivenSetInfo ([id], Nil)
);
=TEX
=SML

fun ⦏z_schema⦎ (name : Z_ID, decls : Z_DECL list, pred : Z_PRED) : PARAINFO = (
let	val z_sch = mk_z_h_schema(mk_z_decl decls, pred);
	val side = schema_gen_semantic_const z_sch;
in
	AbbDefInfo (name, [], z_sch)
end
);
=TEX
=SML
fun ⦏z_constrained_schema⦎ (zname : Z_ID, dec : Z_EXP, pred : Z_PRED) : PARAINFO = (
let	val decl = mk_z_decl[mk_z_schema_dec (dec, "")];
	val z_sch = mk_z_h_schema(decl, pred);
	val side = schema_gen_semantic_const z_sch;
in
	AbbDefInfo (zname, [], z_sch)
end
);
=TEX
\section{SUPPORT FOR TRANSLATION OF EXPRESSIONS}
It is convenient to take some of the work for translation of
expressions first rather than interleaved the main  mutual recursion
for {\it trans\_exp}. This section contains this material.

\subsection{{\it tmark\_of\_prefix}}
{\it tmark\_of\_prefix} requires some auxiliary functions. The first batch
of these pick apart the defining axiom for a Z term
that is the translation of a SPARK type mark and return
the term that is the translation of a the type mark
for a component selected from the original SPARK type.
=SML
fun ⦏do_array_def⦎ (tm : Z_EXP) : Z_EXP = (
	let	val t1 = snd(dest_eq tm);
		val (_, _, ts) = dest_z_gvar t1;
	in	hd(tl ts)
	end
);
=TEX
=SML
fun ⦏do_uncon_array_def⦎ (tm : Z_EXP) : Z_EXP = (
	let	val t1 = dest_z_ℙ(snd(dest_z_∈(fst(dest_∧ tm))));
		val (_, _, ts) = dest_z_gvar t1;
	in	hd(tl ts)
	end
);
=TEX
=SML
fun ⦏do_subtype_con_def⦎ (tm : Z_EXP) : Z_EXP = (
	let	val t1 = snd(dest_eq tm);
		val (decl, _, _) = dest_z_seta t1;

	in	(snd o dest_z_dec o hd o dest_z_decl) decl
	end
);
=TEX
=SML
fun ⦏do_subtype_uncon_def⦎ (tm : Z_EXP) : Z_EXP = (
	snd(dest_eq tm)
);
=TEX
=SML
fun ⦏do_rec_def⦎ (tm : Z_EXP) (sel : string) : Z_EXP = (
	let	val t1 = snd(dest_eq tm);
		val decs = (dest_z_decl o fst o dest_z_h_schema) t1;
		fun do_decs decs = (
			let	val (ts, t) = dest_z_dec (hd decs);
			in	if	any ts (fn t => fst(dest_var t) = sel)
				then	t
				else	do_decs (tl decs)
			end
		)
	in	do_decs decs
	end
);
=TEX
The data type {\it SEL} represents a single component selection.
For arrays, the index value is not relevant to the type calculation
for a record selection, we need to know the component name:
=SML
datatype ⦏SEL⦎ = ArraySel | RecordSel of ID;
=TEX
The next auxiliary function takes a list of selectors and applies
them to a Z expression representing a base type to give the
Z expression for the selected type (as the translation of a type
mark --- if we don't get a global variable, then the SPARK program
is ill-formed in some way.)
=SML
fun ⦏indexed_type⦎ (base : Z_EXP) (sels : SEL list) : Z_EXP = (
	case sels of
	[] 	=>	(base
	) | ArraySel :: more
		=> (
		let	fun abb_def_rhs t = snd (dest_thm (z_get_spec t));
			fun go tm = (
				(do_array_def tm) handle Fail _ =>
				(do_uncon_array_def tm) handle Fail _ =>
				(go 	(abb_def_rhs (do_subtype_con_def tm) handle Fail _ =>
					 abb_def_rhs (do_subtype_uncon_def tm)))
			);
		in	indexed_type (go (abb_def_rhs base)) more
		end
	) | RecordSel s :: more
		=> (
		let	val def = snd (dest_thm (z_get_spec base));
			fun go tm = (
				(do_rec_def tm s) handle Fail _ =>
				(go (do_subtype_uncon_def tm))
			);
		in	indexed_type (go def) more
		end
	)
);
=TEX
Using {\it indexed\_type} we can now define {\it tmark\_of\_prefix}
as required by the formal specification.
=SML
fun ⦏tmark_of_prefix⦎ (env : CN_ENV) (pfx : Z_EXP) : Z_ID = (
	let	fun strip_prefix sels tm = (
			case dest_z_term tm of
				ZApp(t, _) => strip_prefix (ArraySel :: sels) t
			|	ZSel⋎s(t, s) => strip_prefix (RecordSel s :: sels) t
			|	ZLVar(s, _, _) => (s, sels)
			|	ZGVar(s, _, _) => (s, sels)
			|	_ => term_fail "tmark_of_prefix" 508028 [pfx]
		);
		val (var, sels) = strip_prefix [] pfx;
		val (base_tmark, sels') = case env var of
			Value{info = EIEnvVar {tmark = x, ...}, ...} => (x, sels)
		|	Value{info = EIEnvConstant {tmark = x}, ...} => (x, sels)
		|	Value{info = EIEnvFunction {return_tmark = x, ...}, ...} => (
				(x, tl sels)
				handle Fail _ => fail "tmark_of_prefix" 508028 []
		) |	_ => fail "tmark_of_prefix" 508028 [];
	in	case dest_z_term(indexed_type (mk_z_gvar(base_tmark, BOOL, [])) sels') of
			ZGVar(tmark, _, _) => tmark
		|	_ => fail "tmark_of_prefix" 508028 []
	end
);
=TEX
\subsection{Calculating Base Types}
=SML
local
val ⦏z_u⦎ = ⓩU⌝;
fun ⦏base_def⦎ (n : Z_EXP) : Z_EXP = (
	let	val rhs = snd(dest_z_eq(snd(dest_thm(z_get_spec n))));
	in	(term_match rhs z_u; n)
		handle Fail _ =>
	let	fun aux r = (
			let	val (decl, _, _) = dest_z_seta r;
			in	(snd o dest_z_dec o hd o dest_z_decl) decl
			end	handle Fail _ => r
		);
		val supertype = aux rhs;
	in	if	is_z_gvar supertype
		then	base_def supertype
		else	n
	end
	end	handle Fail _ => n
);
in
fun ⦏base_type⦎ (t : Z_EXP) : TMARK OPT = (
	let	val n = base_def t;
		val ty = dest_z_power_type (type_of n);
		val (v, _, _)  = dest_z_gvar n;
	in	if	is_z_power_type ty orelse is_z_schema_type ty
		then	Value v
		else	let	val vsucc = mk_z_gvar(v ^ "vSUCC", BOOL, []);
			in	if	is_eq(snd(dest_thm(z_get_spec vsucc)))
				then	Value v
				else	Nil
			end
	end	handle Fail _ => Nil

);
end;
=TEX
\subsection{Integer Literals}\label{IntegerLiterals}

The translation of integer literals is non-trivial and several supporting functions for the translation of integer literals are introduced in this section. The function $trans\_int$ is introduced at the end of this section.
=SML
local
=TEX
\subsubsection{Support for $trans\_int$}

=SML
open	CaseIndependence;
open	Lex;
type ⦏NUMBERS⦎ = string list;
type ⦏NUMERIC⦎ =
		{base : NUMBERS, m : NUMBERS, expon : NUMBERS};
=TEX

\subsubsection{Phase 1: Recognising Integer Literals}

Integer literals may not contain a point and must not have a minus sign in the exponent.

Failures in the supporting functions below are passed on by
{\it trans\_int}. (Previously, failures here were used to signal interpretation as a real literal, but that gave poor error reporting. The code now follows ALRM in using the presence of a point to distinguish real literals).

The code below assumes that the input provided by the lexical analyser will conform to the ALRM lexis,
with all alphabetics converted to upper case.
The based integer part of a based literal may contain letters in the range `G' to `Z' (and the code below will generate an appropriate error message).
The exponent part of a literal (of any kind) may have a sign (and the code below will generate an appropriate error message if the exponent of an integer literal has a minus sign).

In the exponent part when there is a sign, it is just copied into the number. The parser has already ensured that $+$ and $-$ can only appear at the start of an exponent, so a further check is not required here.
=SML
fun ⦏recog_exponent_part⦎ (dec as {base,m,expon} : NUMERIC, (c::rest) : NUMBERS)
		: (NUMERIC * NUMBERS) = (
	if is_digit c
	then	recog_exponent_part ({base=base,m=m, expon=expon@[c]}, rest)
	else case c of

		"_" =>	recog_exponent_part (dec, rest)
		|"+" => recog_exponent_part ({base=base,m=m, expon=expon@[c]}, rest)
		|_ =>	fail "trans_int" 508110 [fn _ => implode (c::rest)]

) | recog_exponent_part (other, []) = (
	(other, [])
);
=TEX
=SML
fun ⦏recog_based⦎ (nb as {base,m,expon} : NUMERIC, (c::rest) : NUMBERS)
		: (NUMERIC * NUMBERS) = (
	if is_alnum c
	then	recog_based ({base=base,m=m@[c], expon=expon}, rest)
	else case c of

		"_" =>	recog_based (nb, rest)
		|"#" => recog_numeric true (nb, rest)
		|_ =>	fail "trans_int" 508111 [(fn _ => c)]

) | recog_based (other, []) = (
	fail "recog_based" 508112 []
)
(*
=TEX
=SML
*)
and ⦏recog_numeric⦎ (have_base : bool) (num as {base,m,expon} : NUMERIC, (c::rest) : NUMBERS)
		: (NUMERIC * NUMBERS) = (
	if is_digit c
	then	recog_numeric have_base ({base=base,m=m@[c], expon=expon}, rest)
	else case c of

		"_" =>	recog_numeric have_base (num, rest)
		|"e" => recog_exponent_part (num, rest)
		|"E" => recog_exponent_part (num, rest)
		|_ =>	if not have_base andalso c = "#"
			then	recog_based ({base=m, m=[], expon=expon}, rest)
			else	fail "trans_int" 508111 [(fn _ => c)]
) | recog_numeric _ other = other;
=TEX
\subsubsection{Phase 2: Generating Integer Literals}

The following gives a lookup table for extended digits to values upto 16.

i.e., $[("0", 0), ("1", 1),...("F", 15)]$.
=SML
val ⦏extended_digits⦎ : (string * INTEGER) list = (
	combine
		(map string_of_int (interval 0 9)@["A","B","C","D","E","F"])
		(map integer_of_int (interval 0 15))
);
=TEX
=SML
fun ⦏based_to_integer⦎ (base:int) (sl:string list) : INTEGER = (
	let	val valid = extended_digits to (base-1);
		val sl' = map CaseIndependence.to_upper sl;
		fun f d = (
			lassoc3 valid d
			handle Fail _ =>
			fail "trans_int" 508113
			[(fn _ => d), (fn _ => string_of_int base)]
		);
		val ibase = integer_of_int base;
		fun aux (c::rest) = (
			f c @+ ibase @* aux rest
		) | aux [] = zero;
	in	(aux o rev) sl'
	end
);
=TEX
=SML
fun ⦏signed_nat_of_numbers⦎ (sl : NUMBERS) : int = (
	let	fun f n = (
			(nat_of_string o implode) n
			handle Fail _ =>
			fail "trans_int" 508114
			[fn _ => implode n]
		);
	in
		case sl of
		("+"::n) => f n
		|("-"::n) => ~(f n)
		|_ => f sl
	end
);
=TEX
=SML
fun ⦏basepow⦎ (base : int) (n : int) : INTEGER = (
	let	val ibase = integer_of_int base;
		fun aux n = (
			if	n = 0
			then	one
			else	ibase @* aux (n-1)
		);
	in	aux n
	end
);
=TEX
The failure case below is caught by $trans\_int$.
=SML
fun ⦏convert_base_exp⦎ ((base, m, expon) : (int*INTEGER*int)) : INTEGER = (
	if expon >= 0
	then	m @* basepow base expon
	else	fail "trans_int" 508115 [fn _ => string_of_int expon]
);
=TEX
=SML
=TEX
=SML
fun ⦏numeric_to_int_lit⦎ ({base,m,expon} : NUMERIC) : INTEGER = (
let	val nbase = case implode base of
		"" => 10
	|	b => (
		nat_of_string b handle _ =>
		fail "trans_int" 508117 [fn () => b]
	);
	val nm = based_to_integer nbase m;
	val nexpon = case expon of [] => 0 | _ => signed_nat_of_numbers expon;
in
	if	nbase = 10 andalso nexpon = 0
	then	nm
	else	if nbase >= 2 andalso nbase <= 16
	then	convert_base_exp (nbase,nm,nexpon)
	else	fail "trans_int" 508117 [fn () => implode base]
end);
=TEX
\subsubsection{The Function $trans\_int$}
=SML
in (* of local ... in *)
=TEX
=SML
fun ⦏trans_int⦎ (i : INT_REAL_LIT) : INTEGER = (
	( (numeric_to_int_lit o fst o recog_numeric false)
		({base=[], m=[], expon=[]}, explode i)
	)
);
=TEX
=SML
end (* of local ... in *);
=TEX
=TEX
\subsubsection{The Function $exp\_int\_lit$}
=SML
fun ⦏exp_int_lit⦎ (n : INT_REAL_LIT) : Z_EXP = (
	z_num (trans_int n)
);
=TEX
=TEX
\subsection{Real Literals}{\label{RealLiterals}
\subsubsection{The Function $trans\_real$}
=SML
local
	open Lex;
in
fun trans_real (r : INT_REAL_LIT) : Z_EXP * Z_EXP * Z_EXP = (
	let	fun exponent _ [] = (
			fail "trans_real" 508116 []
		) | exponent (bef, aft) chs = (
			let	val x = integer_of_string (bef^aft);
				val p = integer_of_int(size aft);
				val e = integer_of_string (implode chs);
			in	(x, p, e)
			end	handle Fail _ => fail "trans_real" 508110 [fn _ => implode chs]
		);
		fun  after_point (bef, aft) (ch :: chs) = (
			if	is_digit ch
			then	after_point (bef, ch::aft) chs
			else if	ch = "E" orelse ch = "e"
			then	exponent (bef, implode(rev aft)) chs
			else	fail "trans_real" 508111 [fn _ => ch]
		) | after_point (bef, aft) [] = (
			let	val afts = implode (rev aft);
				val x = integer_of_string (bef^afts);
				val p = integer_of_int(size afts);
				val e = zero;
			in	(x, p, e)
			end	handle Fail _ => fail "trans_real" 508025 [fn _ => r]
			(* shouldn't happen *)	
		);
		fun before_point bef ("." :: chs) = (
			after_point (implode(rev bef), []) chs
		) | before_point bef (ch :: chs) = (
			if	is_digit ch
			then	before_point (ch::bef) chs
			else	fail "trans_real" 508113 [(fn _ => ch), (fn _ => "10")]
		) | before_point bef [] = (
			after_point (implode(rev bef), []) []
		);
		val (x, p, e) = before_point [] (explode r less "_");
	in	(mk_z_signed_int x, mk_z_signed_int p, mk_z_signed_int e)
	end
);
end;
=TEX
\subsubsection{The Function $exp\_real\_lit$}
=SML
fun ⦏exp_real_lit⦎ (n : INT_REAL_LIT) : Z_EXP = (
	mk_z_float (trans_real n)
);
=TEX
\subsection{Character Literals}{\label{CharacterLiterals}
\subsubsection{The Function $exp\_char\_lit$}
=SML
fun ⦏exp_char_lit⦎ (n : CHAR_LIT) : Z_EXP = (
	z_unary_exp(z_char_lit, z_string n)
);
=TEX
\subsection{Global Dependency Parameters}{\label{GlobalDependencyParameters}
=SML
fun ⦏global_dep_par⦎ (env : CN_ENV)  (v : ID) : Z_EXP = (
	let	val e = zid env v;
	in	if	is_var e
		then	e
		else	mk_z_θ(e, "")
	end
);
=TEX
\subsection{String Literals}{\label{StringLiterals}
\subsubsection{The Function $exp\_string\_lit$}
=SML
fun ⦏exp_string_lit⦎ (n : STRING_LIT) : Z_EXP = (
	z_unary_exp(z_string_lit, z_string n)
);
=TEX
\subsection{Support for Modular Types}
=TEX
The following function
checks that the Val attribute exists and has Z type appropriate
for a modular type.
=SML
fun ⦏is_modular_type⦎ (tmark : TMARK) : bool = (
	let	val hol_tyn = bind_gvar_name tmark;
	in	case get_const_type (hol_tyn ^^ zval) of
			Nil => false
		|	Value ty => (
			dest_z_tuple_type (dest_z_power_type ty) =
			[z_int_type, mk_ctype(hol_tyn, [])]
		) handle Fail _ => false
	end
);
=TEX
The following function returns functions that convert
a modular type to and from an integer together with the expression
giving the modulus attribute.
=SML
fun ⦏modular_type_convs⦎ (ty : TYPE)
	: {	to_int : Z_EXP -> Z_EXP,
		from_int : Z_EXP -> Z_EXP,
		modulus : Z_EXP} OPT = (
	let	val tyn = fst(dest_ctype ty);
		val to_int_n = tyn ^^ zpos;
		val from_int_n = tyn ^ "_of_int";
		val modulus_n = tyn ^^ zmodulus;
	in	case (get_const_type to_int_n,
			get_const_type from_int_n,
				get_const_type modulus_n) of
			(Value to_int_ty, Value from_int_ty, Value modulus_ty) => (
				Value {
				to_int = curry mk_z_app (mk_const(to_int_n, to_int_ty)),
				from_int = curry mk_z_app (mk_const(from_int_n, from_int_ty)),
				modulus = mk_const(modulus_n, modulus_ty)}
		) | 	_ => Nil
	end	handle Fail _ => Nil
);
=TEX
\subsection{Unary Operators}
The empty list for unary addition means that no operator is required.
=SML
fun ⦏unary_ops⦎ (uop : UNARY_OP) : Z_EXP list = (
	case uop of
	UOSparkUnaryMinus => [z_unary_minus, z_real_unary_minus]
	|UOSparkNot => [z_bool_not, z_array_not]
	|UOSparkAbs => [z_abs, z_real_abs]
	|USSparkUnaryAdd => []
);
=TEX
=SML
=TEX
Once we are dealing with an operand of modular type, there is no further overload resolution.
=SML
fun ⦏trans_unary_op_modular⦎ (uop : UNARY_OP, zright : Z_EXP) : Z_EXP = (
	case modular_type_convs (type_of zright) of
		Value {to_int, from_int, modulus} => (
		let	fun apply c = (
				from_int(mk_z_app(c, to_int zright))
			);
			fun mod_not () = (
				from_int(
				mk_z_app(z_mod_not, mk_z_tuple[
					to_int zright,
					modulus]))
			);
		in	case uop of
			UOSparkUnaryMinus => apply z_unary_minus
		|	UOSparkNot => mod_not ()
		|	UOSparkAbs => apply z_abs
		|	USSparkUnaryAdd => zright
		end
	) | 	Nil => term_fail "trans_unary_op" 508079 [zright]
);
=TEX
The following implements overload resolution for unary operators.
Note that we let {\it z\_unary\_exp} report the error if
none of the alternatives is well-typed (the case of an empty operand
to {\it try\_it} is for the special case of unary addition).

Also note that the expression returned is the actual translation of
the whole unary operator application, not just the operator.

=SML
fun ⦏trans_unary_op⦎ (uop : UNARY_OP, zright : Z_EXP) : Z_EXP = (
	let	val ops = unary_ops uop;
		fun try_it [] = zright
		|   try_it [rator] = (
			z_unary_exp(rator, zright)
		) | try_it (rator::more) = (
			z_unary_exp(rator, zright)
			handle Fail _ => try_it more
		);
	in	try_it ops
		handle Fail _ => trans_unary_op_modular (uop, zright)
	end
);
=TEX

\subsection{Binary Operators}
=SML
fun ⦏bin_ops⦎ (bop : BIN_OP) : Z_EXP list = (
	case bop of
	BOSparkAnd => [z_bool_and, z_array_and]
	|BOSparkAndThen => [z_bool_and_then]
	|BOSparkOr => [z_bool_or, z_array_or]
	|BOSparkOrElse => [z_bool_or_else]
	|BOSparkXor => [z_bool_xor, z_array_xor]
	|BOSparkEq => [z_bool_eq]
	|BOSparkNotEq => [z_bool_noteq]
	|BOSparkLess => [z_bool_less, z_array_less, z_bool_real_less]
	|BOSparkLessEq => [z_bool_less_eq, z_array_less_eq, z_bool_real_less_eq]
	|BOSparkGreater => [z_bool_greater, z_array_greater, z_bool_real_greater]
	|BOSparkGreaterEq => [z_bool_greater_eq, z_array_greater_eq, z_bool_real_greater_eq]
	|BOSparkAdd => [z_add, z_real_add]
	|BOSparkMinus => [z_minus, z_real_minus]
	|BOSparkTimes => [z_times, z_real_times]
	|BOSparkDiv => [z_intdiv, z_real_div]
	|BOSparkMod => [z_mod]
	|BOSparkRem => [z_rem]
	|BOSparkExpon => [z_expon, z_real_expon]
	|BOSparkMem => [z_bool_mem]
	|BOSparkNotMem => [z_bool_notmem]
	|BOSparkConcat => [z_array_array_cat, z_array_elem_cat, z_elem_array_cat]
);
=TEX
For modular types, we also need to know which of the operands and the result need converting.
=SML
fun ⦏bin_ops_modular⦎ (bop : BIN_OP) :
	(Z_EXP * {left : bool, right : bool, result : bool}) OPT = (
let	fun yyy x = Value (x, {left = true, right = true, result = true});
	fun yyn x = Value (x, {left = true, right = true, result = false});
	fun yny x = Value (x, {left = true, right = false, result = true});
	fun nnn x = Value (x, {left = false, right = false, result = false});
in
	case bop of
		BOSparkAnd => yyy z_mod_and
	|BOSparkAndThen => Nil
	|BOSparkOr => yyy z_mod_or
	|BOSparkOrElse => Nil
	|BOSparkXor => yyy z_mod_xor
	|BOSparkEq => nnn z_bool_eq
	|BOSparkNotEq => nnn z_bool_noteq
	|BOSparkLess => yyn z_bool_less
	|BOSparkLessEq => yyn z_bool_less_eq
	|BOSparkGreater => yyn z_bool_greater
	|BOSparkGreaterEq => yyn z_bool_greater_eq
	|BOSparkAdd => yyy z_add
	|BOSparkMinus => yyy z_minus
	|BOSparkTimes => yyy z_times
	|BOSparkDiv => yyy z_intdiv
	|BOSparkMod => yyy z_mod
	|BOSparkRem => yyy z_rem
	|BOSparkExpon => yny z_expon
	|BOSparkMem => nnn z_bool_mem
	|BOSparkNotMem => nnn z_bool_notmem
	|BOSparkConcat => Nil
end);
=TEX
=SML
fun ⦏modular_pos_attr⦎ (ty : TYPE)
	: Z_EXP OPT = (
	let	val tyn = fst(dest_ctype ty);
		val to_int_n = tyn ^^ zpos;
	in	case get_const_type to_int_n of
			Value to_int_ty => (
				Value (mk_const(to_int_n, to_int_ty))
		) | 	_ => Nil
	end	handle Fail _ => Nil
);
=TEX
=SML
fun ⦏trans_bin_op_array_modular⦎ (bop : BIN_OP, zleft : Z_EXP, zright : Z_EXP) : Z_EXP = (
	let	val el_ty = hd(tl(dest_z_tuple_type(
			dest_z_power_type(type_of zleft))));
		val rator = case bop of
			BOSparkLess => z_array_less
		|	BOSparkLessEq => z_array_less_eq
		|	BOSparkGreater => z_array_greater
		|	BOSparkGreaterEq => z_array_greater_eq
		|	_ => term_fail "trans_bin_op" 508089 [zleft, zright];
		val pos_attr = force_value (modular_pos_attr el_ty);
		val zleft' = z_rel_comp(zleft, pos_attr);
		val zright' = z_rel_comp(zright, pos_attr);
	in	z_bin_exp(zleft', rator, zright')
	end
);
=TEX
=SML
fun ⦏trans_bin_op_modular⦎ (bop : BIN_OP, zleft : Z_EXP, zright : Z_EXP) : Z_EXP = (
	case Value (force_value(modular_type_convs(type_of zleft)))
		handle Fail _ => modular_type_convs(type_of zright) of
		Value {to_int, from_int, ...} => (
		let	fun cnv f b t = (
				if	b
				then	f t handle Fail _ => t
				else	t
			);
			fun apply (c, {left, right, result}) = (
				cnv from_int result
				(mk_z_app(c, mk_z_tuple [
					cnv to_int left zleft,
					cnv to_int right zright
				]))
			);
		in	case bin_ops_modular bop of
				Value clrr => apply clrr
			|	Nil => term_fail "trans_bin_op" 508089 [zleft, zright]
		end
	) |	Nil => trans_bin_op_array_modular (bop, zleft, zright)
);
=TEX
The following implements overload resolution for binary operators.

As for unary operators, the expression returned is the actual translation of
the whole binary operator application, not just the operator.

Combined integer/real operands are handled if all else fails by converting
the integer operand to a real. Note that recursion will never go more
than one call deep.
=SML
fun ⦏trans_bin_op⦎ (bop : BIN_OP, zleft : Z_EXP, zright : Z_EXP) : Z_EXP = (
	let	val ops = bin_ops bop;
		fun try_it [] = (
			if	type_of zleft =: z_int_type andalso
				type_of zright =: z_real_type
			then	trans_bin_op (bop, z_integer_to_real zleft, zright)
			else if	type_of zleft =: z_real_type andalso
				type_of zright =: z_int_type
			then	trans_bin_op (bop, zleft, z_integer_to_real zright)
			else	fail "trans_bin_op" 508031 []
		) | try_it (rator::more) = (
			z_bin_exp(zleft, rator, zright)
			handle Fail _ => try_it more
		);
	in	try_it ops
		handle Fail _ => trans_bin_op_modular(bop, zleft, zright)
	end
);
=TEX
\subsection{Support for Translating Attributes}
The following is based on material taken from the Ada Reference Manual.
It is based on all Ada attributes, not just those mentioned in the list in
Volume 3, section 3.13 of the specification of the Compliance Notation.
The second element gives the Z ``type'' of the translated attribute, for attributes
that are in category B. The second element is {\it Nil} for attributes
that are either supported in category A (in which case the type can be determined
from the definitions in the Z document) or are in category C (in
which case the attribute can only be translated into Z if the user has supplied
a Z paragraph to define it).
=SML
val ⦏ada_attribute_types⦎ : (ID * TERM OPT) list = [
	("ADDRESS", Nil ),
	("AFT", Value ℤ_tm ),
	("BASE", Nil ),
	("CALLABLE", Nil ),
	("CONSTRAINED", Nil ),
	("DELTA", Nil ),
	("DIGITS", Nil ),
	("EMAX", Value ℤ_tm ),
	("EPSILON", Nil ),
	("FIRST", Nil ),
	("FORE", Value ℤ_tm ),
	("IMAGE", Nil ),
	("LARGE", Nil ),
	("LAST", Nil ),
	("LENGTH", Nil ),
	("MACHINE_EMAX", Value ℤ_tm ),
	("MACHINE_EMIN", Value ℤ_tm ),
	("MACHINE_MANTISSA", Value ℤ_tm ),
	("MACHINE_OVERFLOWS", Value ℤ_tm ),
	("MACHINE_RADIX", Value ℤ_tm ),
	("MACHINE_ROUNDS", Value ℤ_tm ),
	("MANTISSA", Value ℤ_tm ),
	("MODULUS", Nil ),
	("POS", Nil ),
	("PRED", Nil ),
	("RANGE", Nil ),
	("SAFE_EMAX", Value ℤ_tm ),
	("SAFE_LARGE", Nil ),
	("SAFE_SMALL", Nil ),
	("SIZE", Value ℤ_tm ),
	("SMALL", Nil ),
	("STORAGE_SIZE", Nil ),
	("SUCC", Nil ),
	("TERMINATED", Nil ),
	("VAL", Nil ),
	("VALUE", Nil ),
	("WIDTH", Nil )
];
=TEX
=SML
val ⦏attr_type_dict⦎ : TERM S_DICT =
	map (fn (s, t) => (s, force_value t)) (
		ada_attribute_types drop (fn (_, Nil) => true | _ => false));
=TEX
The following function is used to dismantle the prefix in something like:
{\it P'BASE'FIRST}.
=SML
fun ⦏strip_attr_prefix⦎ (pfx : EXP) : EXP * ATTRIB list = (
	let	fun aux acc (EAttribute{prefix, attribute_desig=ADAttrib att}) = (
			aux (att::acc) prefix
		) | aux acc other = (other, acc);
	in	aux [] pfx
	end			
);
=TEX
\subsection{Array Sliding}
For array sliding, we first of all need a function to find the range type
of a constrained array subtype.
This is parameterised by a Z expression which is the Z translation of a type mark
and fails if the range type cannot be calculated.
=SML
val ⦏z_dom_f_eq⦎ : Z_EXP = ⓩdom array = X⌝;

fun ⦏con_array_range_from_tmarkf⦎ (tmark : Z_EXP) : Z_EXP = (
	let	fun do_array_con_def tm = (
			let	val t1 = (snd o dest_eq o snd o dest_thm o z_get_spec) tm;
				val (_, pred, _) = dest_z_seta t1;
			in	term_match pred z_dom_f_eq;
				snd(dest_eq pred)
			end
		);
		fun do_abbrev_def tm = (
			(snd o dest_eq o snd o dest_thm o z_get_spec) tm
		);
		fun go tm = (
			do_array_con_def tm
			handle Fail _ => (
				go (do_abbrev_def tm)
			)
		);
	in	go tmark
	end
);
=TEX
Now the external interfaces.
=SML
fun ⦏slide⦎ (arr_exp : Z_EXP, tmark_exp : Z_EXP) : Z_EXP = (
	z_slide(arr_exp, tmark_exp)
	handle Fail _ => term_fail "slide" 508090 [arr_exp]
);
fun ⦏con_array_range_from_tmark⦎ (tmark : Z_EXP) : Z_EXP OPT = (
	Value(con_array_range_from_tmarkf tmark)
	handle Fail _ => Nil
);
fun ⦏slide_to_component_tmark⦎ (ze : Z_EXP, comp_tmark : Z_EXP) : Z_EXP = (
	(case con_array_range_from_tmark comp_tmark of
		Nil => ze
	|	Value r => slide(ze, r))
	handle Fail _ => ze
);
=TEX
=SML
fun ⦏add_qualifier_or_convert⦎
	(env : CN_ENV) (e : EXP, t : ID) : EXP = (
	case e of
	EArrayAggPos{comps, tmark=Nil} => (
		case env t of
		Value {info = EIEnvRecordType _, ...} => (
			ERecAggPos{comps = comps, tmark = Value t}
		) | _ =>	EArrayAggPos{comps = comps, tmark = Value t}
	)| EArrayAggPosOthers{agg_pos={comps, tmark=Nil}, others} => (
		 EArrayAggPosOthers{agg_pos={comps=comps, tmark=Value t}, others = others}
	)| EArrayAggOthers{others, tmark=Nil} => (
		EArrayAggOthers{others=others, tmark=Value t}
	)| EArrayAggNamed {named_assocs = n, tmark=Nil} => (
		case env t of
		Value {info = EIEnvRecordType _, ...} => (
			ERecAggNamed{named_assocs = n, tmark = Value t}
		) | _ =>	EArrayAggNamed{named_assocs = n, tmark = Value t}
	)| EArrayAggNamedOthers
			{agg_named as {named_assocs = n, tmark =Nil}, others} => (
	EArrayAggNamedOthers
			{agg_named = {named_assocs = n, tmark = Value t}, others = others}
	)| ERecAggPos{comps, tmark=Nil} => (
		ERecAggPos{comps = comps, tmark = Value t}
	)| ERecAggNamed {named_assocs = n, tmark=Nil} => (
		EArrayAggNamed{named_assocs = n, tmark = Value t}
	)| e => (
		if	is_modular_type t
		then	ETypeConversion {tmark = t, exp = e}
		else	e
	)
);
=TEX
=SML
fun ⦏trans_component⦎
	(env : CN_ENV)
	(te : CN_ENV -> EXP -> Z_EXP)
	(e : EXP, base_tmark : Z_EXP, sel : SEL) : Z_EXP = (
	let	val comp_tmark_ze = indexed_type base_tmark [sel];
		val comp_tmark_id =
		case dest_z_term comp_tmark_ze of
			ZGVar(tmark, _, _) => tmark
		|	_ => fail "trans_component" 508028 [];
		val ze = te env (add_qualifier_or_convert env (e, comp_tmark_id));
	in	slide_to_component_tmark (ze, comp_tmark_ze)
	end
);
=TEX
\section{TRANSLATING SPARK EXPRESSIONS}

\subsection{Translating Identifiers}
=SML
fun ⦏trans_id⦎ (id : ID) : Z_ID = (

let	fun aux (c::rest) = (
		case c of
		"." => "o"::aux rest
		|"'" => "v"::aux rest
		|_ => c::aux rest	
	) | aux _ = []
in
	(implode o aux o explode) id
end
);
=TEX
=SML
fun ⦏trans_expanded_name⦎ (en : EXPANDED_NAME) : Z_ID = (
	format_list trans_id en "o"
);
=TEX
When we are translating names in basic declarations, we need to add a prefix to form an expanded name (the prefix may be empty).
In this case, caller must have done any other necessary transformations on the  names in the prefix.
=TEX
=SML
fun ⦏prefix_trans_id⦎ (pfx : Z_ID list) (id : ID) : Z_ID = (
	format_list Combinators.I (pfx @ [trans_id id]) "o"
);
=TEX
The treatment of renaming (and use clauses) sometimes means we just want
to map an identifier to the canonical name of the entity it refers to.
Note that this relies on the fact that the mapping of ID to Z\_ID results
in a string that can be used as an ID.
=SML
=TEX
=SML
fun ⦏canonical_id⦎ (env : CN_ENV) (n : ID) : Z_ID = (
	case env (trans_id n) of
		Value {canon_name = n', ...} =>  n'
	|	_ => n
);
=TEX
=SML
fun ⦏dimen⦎ (zid : Z_ID, n : int) : Z_ID  = (
	if n > 0 then zid ^ "v" ^ string_of_int n else zid
);
=TEX
=SML
fun ⦏exp_id⦎ (env : CN_ENV) (ident : ID) : Z_EXP = (
	zid env (trans_id ident)
);
=TEX
\subsection{Translating Aggregates (Positional Array)}
=SML
type ⦏ARRAY_AGG_ENV⦎ = {tname : TMARK, this : int, max : int};
=TEX
=SML
fun ⦏array_dim⦎ (env : CN_ENV) (tmark : TMARK) : int = (
	let	val ztmark = trans_id tmark;
		val ztype = type_of(zid env ztmark);
	in	(length o dest_z_tuple_type o hd o dest_z_tuple_type o
			dest_z_power_type o dest_z_power_type) ztype
	end	handle Fail _ => 1
);
=TEX
=SML
fun ⦏array_first⦎ (env : CN_ENV) ({this, max, tname} : ARRAY_AGG_ENV) : Z_EXP = (
	let	val(act_name, _, _) = dest_z_gvar(zid env tname);
	in	if	max = 1
		then	zid env (act_name ^^ zfst)
		else	zid env (dimen(act_name ^^ zfst, this))
	end
);
=TEX
=SML
fun ⦏array_range⦎ (env : CN_ENV) ({this, max, tname} : ARRAY_AGG_ENV) : Z_EXP = (
	let	val(act_name, _, _) = dest_z_gvar(zid env tname);
	in	if	max = 1
		then	zid env (act_name ^^ zrange)
		else	zid env (dimen(act_name ^^ zrange, this))
	end
);
=TEX
=SML
fun ⦏z_array_agg⦎ (num : int) : Z_ID = (
	"array_agg" ^ (string_of_int num)
);
=TEX
=SML
fun ⦏mk_array_agg⦎  (num : int, zex : Z_EXP) : Z_EXP = (
	if	num = 1
	then	zex
	else	let	val fun_name = z_array_agg num;
			val ty = force_value(get_const_type (bind_gvar_name fun_name));
			val (gty, rty) = dest_→_type ty;
			val us = map mk_u (dest_z_tuple_type gty);
			val fun_exp = mk_z_gvar(fun_name, rty, us);
			val (arg_ty, res_ty) = case dest_z_tuple_type
						(dest_z_power_type (type_of fun_exp)) of
					[ty1, ty2] => (ty1, ty2)
				|	_ => fail "" 0 [] (* caught immediately *);
			val ty_map = type_match (type_of zex) arg_ty;
		in	mk_z_app(inst [] ty_map fun_exp, zex)
		end	handle Fail _ => term_fail "mk_array_agg" 508058 [zex]
);
=TEX
=SML
fun ⦏exp_array_agg_pos⦎ (env : CN_ENV) (aa_env as {this, max, tname} : ARRAY_AGG_ENV)
	({tmark as _, comps} : EXP AGG_POS) : Z_EXP = (
let	val zop = z_minus;
	val zleft = z_num one;
	val zright = array_first env aa_env;
	val aa_env' = {this = this + 1, max = max, tname = tname};
	val zseq = map (trans_array_agg_exp env aa_env') comps;
in
	z_rel_comp(z_power(z_succ, z_bin_exp(zleft,zop, zright)), z_seq zseq)
end
)
=TEX
\subsection{Translating Aggregates (Positional Array with Others)}
=SML
and ⦏exp_array_agg_pos_others⦎ (env : CN_ENV) (aa_env as {this, max, tname} : ARRAY_AGG_ENV)
	({agg_pos as {tmark, comps},
		others} : EXP AGG_POS_OTHERS) : Z_EXP = (
	z_override(
		trans_array_agg_exp env aa_env (EArrayAggOthers {tmark=tmark,others=others}),
		trans_array_agg_exp env aa_env (EArrayAggPos agg_pos))
)
=TEX
\subsection{Translating Aggregates (Positional Array with Just Others)}
=SML
and ⦏exp_array_agg_others⦎ (env : CN_ENV) (aa_env as {this, max, tname} : ARRAY_AGG_ENV)
	({tmark as _, others={others=ot}} : EXP AGG_OTHERS) : Z_EXP = (
let	val aa_env' = {this = this + 1, max = max, tname = tname};
in
	z_cross(array_range env aa_env, z_set [trans_array_agg_exp env aa_env' ot])
end
)
=TEX
\subsection{Translating Aggregates (Named Array)}
=SML
and ⦏trans_named_assoc⦎	(env : CN_ENV) (aa_env as {this, max, tname} : ARRAY_AGG_ENV)
				({choice,comp} : (AGG_CHOICE,EXP) NAMED_ASSOC)
					: Z_EXP = (
let	fun aux_range (ch::rest) = (
		case ch of
		ACAggChoiceRange (DRRange range) =>
			let	val {lo, hi} = dest_range range;
			in	z_rng(trans_exp env lo, trans_exp env hi)::aux_range rest
			end
		|ACAggChoiceRange (DRConstrained{range=range,...}) =>
			let	val {lo, hi} = dest_range range;
			in	z_rng(trans_exp env lo, trans_exp env hi)::aux_range rest
			end
		|_ => aux_range rest
	) | aux_range _ = [];
	fun aux_singles (ch::rest) = (
		case ch of
		ACAggChoiceSingle exp =>
			trans_exp env exp::aux_singles rest
		|_ => aux_singles rest
	) | aux_singles _ = [];
	val zranges = aux_range choice;
	val zsingles = z_set (aux_singles choice);
	val aa_env' = {this = this + 1, max = max, tname = tname};
in
	z_cross (z_many_union(zranges @ [zsingles]), z_set[trans_array_agg_exp env aa_env' comp])
end
)
=TEX
=SML
and ⦏exp_array_agg_named⦎ (env : CN_ENV) (aa_env as {this, max, tname} : ARRAY_AGG_ENV)
	({tmark as _, named_assocs} : (AGG_CHOICE,EXP) AGG_NAMED) : Z_EXP = (
	z_many_union (map (trans_named_assoc env aa_env) named_assocs)
)
=TEX
\subsection{Translating Aggregates (Named Array with Others)}
=SML
and ⦏exp_array_agg_named_others⦎ (env : CN_ENV) (aa_env : ARRAY_AGG_ENV)
		({agg_named as {tmark, ...}, others}
		: (AGG_CHOICE,EXP) AGG_NAMED_OTHERS) : Z_EXP = (
	z_override(trans_array_agg_exp env aa_env (EArrayAggOthers {tmark=tmark, others=others}),
		trans_array_agg_exp env aa_env (EArrayAggNamed agg_named))
)
=TEX
\subsection{Translating Aggregates (Positional Record)}
=SML
and ⦏exp_rec_agg_pos⦎
		(env : CN_ENV) ((tmark as Value tm, comps) : TMARK OPT * EXP list)
		: Z_EXP = (
let	val record_components = (
		case env tm of
			Value {info = EIEnvRecordType {comp_names = cmps, ...}, ...} => cmps
		|	_ => fail "exp_rec_agg_pos" 508026 [fn()=>tm]
	);
	val comp_name_z_exps = combine record_components comps
		handle Fail _ => fail "exp_rec_agg_pos" 508027 [fn()=>tm];
	val tmark_zexp = trans_exp env (EId tm);
	val zbinds = map
		(fn (c, e) => (c, trans_component env trans_exp (e, tmark_zexp, RecordSel c)))
			comp_name_z_exps;
in
	z_binding zbinds
end
) | exp_rec_agg_pos _ _ = fail "trans_exp" 508054 []
=TEX
\subsection{Translating Aggregates (Named Record)}
=SML
and ⦏exp_rec_agg_named⦎ (env : CN_ENV) ({tmark as Value tm, named_assocs}
		: (AGG_CHOICE,EXP) REC_AGG_NAMED) : Z_EXP = (
let	fun named_assoc_to_ids_exp {choice, comp} = (
	let	fun aux (ch::rest) comp = (
			case ch of
			ACAggChoiceSingle exp => (
					(name_to_tmark exp, comp) ::
					aux rest comp
			) |_ => fail "exp_rec_agg_named" 508052 []
		) | aux _ _ = [];
	in
		aux choice comp
	end);
	val tmark_zexp = trans_exp env (EId tm);
	val zbinds = map
		(fn (c, e) => (c, trans_component env trans_exp (e, tmark_zexp, RecordSel c)))
			(flat (map named_assoc_to_ids_exp named_assocs));
in	z_binding zbinds
end
) | exp_rec_agg_named _ _ = fail "trans_exp" 508054 []
=TEX
\subsection{Translating Aggregates (Generally)}
Note that the failure case below will never happen, since caller must always
have looked inside the expression to get the type mark out.
The test using less-than rather than not-equals defends the code from
non-termination if something weird goes wrong in {\it array\_dim}.
=SML
and ⦏trans_array_agg_exp⦎ (env : CN_ENV)
	(aa_env as {this, max, tname} : ARRAY_AGG_ENV) (e : EXP) : Z_EXP = (
	if	this < max + 1
	then	case e of
		EArrayAggPos ap => exp_array_agg_pos env aa_env ap
	|	EArrayAggPosOthers apo =>  exp_array_agg_pos_others env aa_env apo
	|	EArrayAggOthers ao =>  exp_array_agg_others env aa_env ao
	|	EArrayAggNamed an =>  exp_array_agg_named env aa_env an
	|	EArrayAggNamedOthers ano => exp_array_agg_named_others env aa_env ano
	|	_ => fail "trans_array_agg_exp" 508062 []
	else	trans_component env trans_exp (e, trans_exp env (EId tname), ArraySel)
)
=TEX
\subsection{Translating Unary Expressions}
=SML
and ⦏exp_unary_exp⦎ (env : CN_ENV) ({uop, right} : EXP UNARY_EXP) : Z_EXP = (
	trans_unary_op(uop, trans_exp env right)
)
=TEX

\subsection{Translating Binary Expressions}
=SML
and ⦏exp_bin_exp⦎ (env : CN_ENV) ({left, bop, right} : EXP BIN_EXP) : Z_EXP = (
	 trans_bin_op(bop, trans_exp env left, trans_exp env right)
)
=TEX
\subsection{Translating Membership of a Range}
=SML
and ⦏exp_mem_range⦎ (env : CN_ENV) ({left, mop, range as RRange _} : EXP MEM_RANGE)
		: Z_EXP = (
let	val {lo=lo, hi=hi} = dest_range range;
	val zright = z_rng(trans_exp env lo, trans_exp env hi);
in
	trans_bin_op(mop, trans_exp env left, zright)
end
) | exp_mem_range (env : CN_ENV) ({left, mop, range as RRangeAttr e} : EXP MEM_RANGE)
		: Z_EXP = (
let	val  zright = trans_exp env e;
in
	trans_bin_op(mop, trans_exp env left, zright)
end
)
=TEX

\subsection{Translating Attributes}
=SML
and ⦏exp_attrib⦎ (env : CN_ENV) ({prefix, attribute_desig=ADAttrib att}
		: (EXP,ATTRIB_DESIG) ATTRIBUTE) : Z_EXP = (
let	val (p, atts) = strip_attr_prefix prefix;
in let	val result = (case atts of
		[]	 => (
		let	val pfx = name_to_tmark prefix;
			val (type_name, _, _) =
				dest_z_gvar (trans_exp env (EId pfx))
				handle Fail _ => (pfx, BOOL, []);
			val ze = zid env (type_name ^^ trans_id att);
		in	dest_z_gvar ze; ze
		end	handle Fail _ => (
		let	val zp = trans_exp env p;
			val tmk = tmark_of_prefix env zp;
			val ze = zid env (tmk ^^ trans_id att);
		in	dest_z_gvar ze; ze
		end	handle Fail _ => (
				fail "exp_attrib" 508028 []
			))
	)|	["BASE"] => (
		let	val ze = trans_exp env p;
			val tmk = force_value(base_type ze);
		in	zid env (tmk ^^ trans_id att)
		end	handle Fail _ => (
		let	val ze = zid env (trans_id (name_to_tmark p) ^^ zbase ^^ trans_id att);
		in	dest_z_gvar ze; ze
		end	handle Fail _ => (
				fail "exp_attrib" 508028 []
			))
	)|	_ => (fail "exp_attrib" 508028 []
	));
in	result
end	handle Fail _ => (
		let	val attr_ty = force_value (s_lookup att attr_type_dict);
			val zp = trans_exp env p;
			val (zn, _, _) = dest_z_gvar zp
				handle Fail _ => dest_z_lvar zp;
			val sfx = fold (op ^^) (map trans_id atts) (trans_id att);
			val za = zn ^^ sfx;
		in	update_theory_db_with_parainfo (z_ax "attribute" (za, attr_ty, []));
			zid env za
		end	handle Fail _ =>
				fail "exp_attrib" 508028 []
	)	
end)
=TEX
The following covers $Exp\_Attrib\_Arg$
=SML
  | ⦏exp_attrib⦎ env ({prefix, attribute_desig=ADAttribArg(att,arg)}
		: (EXP,ATTRIB_DESIG) ATTRIBUTE) : Z_EXP = (
	let	val no_arg = {prefix=prefix, attribute_desig=ADAttrib att};
		val zfun = exp_attrib env no_arg;
	in
	if	trans_id att mem [zfst, zlst, zlength, zrange]
	then
		let	val zarg = trans_exp env arg;
			val (tmk, _, _) = dest_z_gvar zfun;
		in
			zid env (dimen(trans_id tmk, eval_attr_arg zarg))
		end	handle Fail _ => (
			term_fail "exp_attrib" 508028 []
			)
	else
		let	val zargs = [trans_exp env arg];
		in
			z_fun_call (zfun, zargs)
		end
	end
)
=TEX
\subsection{Translating Indexed Components}
=SML
and ⦏exp_indexed_comp⦎ (env : CN_ENV)
	({prefix, index as EArrayAggPos{comps, tmark as Nil}} : EXP INDEXED_COMP)
		: Z_EXP = (
let	val zfun = trans_exp env prefix;
	val zargs = map (trans_exp env) comps;
in
	z_fun_call (zfun, zargs)
end
) |  ⦏exp_indexed_comp⦎ _ _ = (
	fail "exp_indexed_comp" 508056 []
)
=TEX
\subsection{Translating Selected Components}
=SML
and ⦏exp_selected_comp⦎ (env : CN_ENV) ({prefix, selector} : EXP SELECTED_COMP)
		: Z_EXP = (
	z_selection (trans_exp env prefix, trans_id selector)
)
=TEX
\subsection{Translating Functions Calls}
=SML
and ⦏fun_globals⦎ (env : CN_ENV) (zn : Z_ID) : Z_EXP list = (
	case env zn of
		Value{info = EIEnvFunction {deps = gs, ...}, ...} => map (global_dep_par env) gs
	| _ =>	fail "fun_globals" 508081 [fn()=>zn]
)
=TEX
=SML
and ⦏trans_fun_name⦎ (env : CN_ENV) (n : ID) : Z_EXP = (
	let	val zn = canonical_id env n;
		val ze = zid env zn;
	in	case fun_globals env zn of
			[] => ze
		|	gs => z_fun_call (ze, gs)
	end
)
=TEX
=SML
and ⦏exp_fun_call⦎ (env : CN_ENV) ({fun_name, args} : EXP FUN_CALL) : Z_EXP = (
	case args of
		[] => trans_fun_name env fun_name
	|	_ => (
		let	val trans_args = map (trans_exp env) args;
			val args_tmarks = case env fun_name of
					Value{info = EIEnvFunction {pars = psts, ...}, ...} => (
					combine trans_args (map #tmark psts)
					handle Fail _ => fail "exp_fun_call" 508082 [fn _ => fun_name]
				) | 	_ => fail "exp_fun_call" 508081 [fn _ => fun_name];
		in	z_fun_call (trans_fun_name env fun_name, map (slide_to_tmark env) args_tmarks)
		end
	)
)
=TEX
\subsection{Translating Qualified Expressions}
=SML
and ⦏exp_qualified⦎ (env : CN_ENV) ({tmark, exp} : EXP QUALIFIED_EXPRESSION)
	: Z_EXP = (
	trans_exp env exp
)
=TEX
=TEX
\subsection{Translating Type Conversions}
=SML
and ⦏exp_type_conv⦎ (env : CN_ENV) ({tmark, exp} : EXP TYPE_CONVERSION)
	: Z_EXP = (
	let	val ztmark = trans_id tmark;
		val ztype = type_of(zid env ztmark
			handle Fail _ =>
			fail "exp_type_conv" 508051 [fn () => tmark]);
		val te = trans_exp env exp;
		val to_type = dest_z_power_type ztype
			handle Fail _ =>
			fail "exp_type_conv" 508053 []
		val from_type = type_of te;
	in	if	to_type = z_int_type
		then	if	from_type = z_int_type
			then	te
			else if	from_type = z_real_type
			then	z_real_to_integer te
			else 	case modular_type_convs from_type of
				Value {to_int, ...} => to_int te
			|	Nil => fail "exp_type_conv" 508053 []
		else if	to_type = z_real_type
		then	if	from_type = z_real_type
			then	te
			else if	from_type = z_int_type
			then	z_integer_to_real te
			else 	case modular_type_convs from_type of
				Value {to_int, ...} => z_integer_to_real(to_int te)
			|	Nil => fail "exp_type_conv" 508053 []
		else if	from_type = z_int_type
		then	case  modular_type_convs to_type of
				Value {from_int, ...} =>
				from_int te
			|	_ => fail "exp_type_conv" 508053 []
		else	case (modular_type_convs from_type, modular_type_convs to_type) of
				(Value _, Value _) =>
				if	from_type = to_type
				then	te
				else	fail "exp_type_conv" 508053 []
			|	_ => fail "exp_type_conv" 508053 []
	end
)
=TEX
\subsection{Translating Integer Literals}
The function $exp\_int\_lit$ is defined in section \ref{IntegerLiterals}.
\subsection{Translating Character Literals}
The function $exp\_char\_lit$ is defined in section \ref{CharacterLiterals}.
\subsection{Translating String Literals}
The function $exp\_string\_lit$ is defined in section \ref{StringLiterals}.
\subsection{Translating Auxiliary Expressions}
=SML
and ⦏exp_auxiliary_exp⦎ (env : CN_ENV) (ae : Z_TM) : Z_EXP = (
	z_predexp_of_z_tm env ae
)
=TEX
\subsection{Translating Discrete Range Expressions}
These are not strictly speaking Ada expression; however, they are treated
very much as such in record component declarations.
=SML
and ⦏exp_discrete_range⦎ (env : CN_ENV) (dr : DISCRETE_RANGE) : Z_EXP = (
	case dr of
		DRRange(RRange{lo, hi}) => (
			z_rng(trans_exp env lo, trans_exp env hi)
	) |	DRRange(RRangeAttr e) => (
			trans_exp env e
	) |	DRConstrained {tmark, range = RRange{lo, hi}} => (
			z_rng(trans_exp env lo, trans_exp env hi)
	) |	DRConstrained {tmark, range = RRangeAttr e} => (
			trans_exp env e
	)
)
=TEX
\subsection{The Function $trans\_exp$}
=SML
and ⦏trans_exp⦎ (env : CN_ENV) ((EId id) : EXP) : Z_EXP = exp_id env id
  | trans_exp env (EIntReal n) = (
	if	"." mem explode n
	then	exp_real_lit n
	else	exp_int_lit n
) | trans_exp env (e as EArrayAggPos _) = exp_array_agg env e
  | trans_exp env (e as EArrayAggPosOthers _) = exp_array_agg env e
  | trans_exp env (e as EArrayAggOthers _) = exp_array_agg env e
  | trans_exp env (e as EArrayAggNamed _) = exp_array_agg env e
  | trans_exp env (e as EArrayAggNamedOthers _) = exp_array_agg env e
  | trans_exp env (ERecAggPos {tmark, comps}) =
		exp_rec_agg_pos env (tmark, comps)
  | trans_exp env (ERecAggNamed an) = exp_rec_agg_named env an
  | trans_exp env (EUnaryExp ue) = exp_unary_exp env ue
  | trans_exp env (EBinExp be) = exp_bin_exp env be
  | trans_exp env (EMemRange be) = exp_mem_range env be
  | trans_exp env (EAttribute at) = exp_attrib env at
  | trans_exp env (EIndexedComp ic) = exp_indexed_comp env ic
  | trans_exp env (ESelectedComp sc) = exp_selected_comp env sc
  | trans_exp env (EFunCall fc) = exp_fun_call env fc
  | trans_exp env (EAuxiliaryExp ae) = exp_auxiliary_exp env ae
  | trans_exp env (EQualifiedExp qe) = exp_qualified env qe
  | trans_exp env (ETypeConversion tc) = exp_type_conv env tc
  | trans_exp env (EBracketed e) = trans_exp env e
  | trans_exp env (ECharacterLiteral c) = exp_char_lit c
  | trans_exp env (EStringLiteral s) = exp_string_lit s
  | trans_exp env (EDiscreteRange dr) = exp_discrete_range env dr
and ⦏exp_array_agg⦎ (env : CN_ENV) (e : EXP) : Z_EXP = (
	let	val tname = (
			case e of
			EArrayAggPos {tmark as Value tmk, ...} => tmk
		|	EArrayAggPosOthers {agg_pos as {tmark as Value tmk, ...}, ...} => tmk
		|	EArrayAggOthers {tmark as Value tmk, ...} => tmk
		|	EArrayAggNamed {tmark as Value tmk, ...} => tmk
		|	EArrayAggNamedOthers {agg_named as {tmark as Value tmk, ...}, ...} => tmk
		|	_ => fail "exp_array_agg" 508054 []);
		val this = 1;
		val max = array_dim env tname;
	in	mk_array_agg
		(max, trans_array_agg_exp env {tname = tname, this = this, max = max} e)
	end
)
=TEX
\subsection{Sliding}
=SML
and ⦏slide_to_tmark⦎ (env : CN_ENV) (ze : Z_EXP, tm : TMARK) : Z_EXP = (
	case con_array_range_from_tmark (trans_exp env (EId tm)) of
		Nil => ze
	|	Value r => slide(ze, r)
);
=TEX
The following variant of $trans\_exp$ returns an optional Z expression. If the SPARK expression can only be handled informally then a comment message is printed out and $Nil$ is returned.
=SML
fun ⦏trans_exp1⦎ (env : CN_ENV) (exp : EXP) : Z_EXP OPT = (
	Value (trans_exp env exp)
	handle Fail msg  => (
		comment "trans_exp1" 508050 [fn _ => get_message msg];
		Nil
	)
);
=TEX
\subsection{External Interface to Overload Resolution}
=TEX
To handle renaming of an operator symbol by an ordinary function designator,
we need to map the operator symbols into abstract syntax and then carry
out overload resolution.
=SML
val unary_op_table : (OPERATOR_SYMBOL * UNARY_OP) list = [
	("+", UOSparkUnaryAdd),
	("-", UOSparkUnaryMinus),
	("NOT", UOSparkNot),
	("ABS", UOSparkAbs)
];
val ⦏binary_op_table⦎ : (OPERATOR_SYMBOL * BIN_OP) list = [
	("AND", BOSparkAnd),
	("AND THEN", BOSparkAndThen),
	("OR", BOSparkOr),
	("OR ELSE", BOSparkOrElse),
	("XOR", BOSparkXor),
	("=", BOSparkEq),
	("/", BOSparkNotEq),
	("<", BOSparkLess),
	("<=", BOSparkLessEq),
	(">", BOSparkGreater),
	(">=", BOSparkGreaterEq),
	("+", BOSparkAdd),
	("-", BOSparkMinus),
	("*", BOSparkTimes),
	("/", BOSparkDiv),
	("MOD", BOSparkMod),
	("REM", BOSparkRem),
	("**", BOSparkExpon),
	("IN", BOSparkMem),
	("NOT IN", BOSparkNotMem),
	("&", BOSparkConcat)
];
=TEX
=SML
fun ⦏resolve_opsym⦎
	(cn_env : CN_ENV)
	 (name : OPERATOR_SYMBOL)
	(fp : PARAMETER_SPECIFICATION list)
	 (tmark : TMARK) : (Z_EXP * TMARK list * TMARK) OPT = (
	let	fun get_ops n = case fp of
			[{idlist = [_, _], name, ...}] =>
				(bin_ops(force_value(s_lookup n binary_op_table)), [name, name])
		|	[{idlist = [_], name = tmk1, ...}, {idlist = [_], name = tmk2, ...}] =>
				(bin_ops(force_value(s_lookup n binary_op_table)), [tmk1, tmk2])
		|	[{idlist = [_], name, ...}] =>
				(unary_ops (force_value(s_lookup n unary_op_table)), [name])
		|	_ => ([], []);
		val (ops, tmks) = get_ops name handle Fail _ => ([], []);
		fun elem_type tmk = dest_z_power_type(type_of(zid cn_env(trans_id tmk)));
		val req_res_ty =elem_type tmark;
		val req_par_tys = map elem_type tmks;
		fun offered_res_ty tm = (hd o tl o dest_z_tuple_type o dest_z_power_type o type_of) tm;
		fun offered_par_tys tm = (dest_z_tuple_type o hd o
				dest_z_tuple_type o dest_z_power_type o type_of) tm;
		fun wanted tm = (
			offered_res_ty tm =: req_res_ty andalso
			all  (combine (offered_par_tys tm) req_par_tys)  (op =:)
		);
	in	Value (find ops wanted, tmks, tmark)
	end	handle Fail _ => Nil
);
=TEX
\section{ADJUSTMENT OF ABSTRACT SYNTAX FOR EXPRESSIONS}

=SML
fun ⦏named_assocs_to_exps⦎ (names_defs : (ID * Z_EXP OPT) list)
		(ns : (AGG_CHOICE,EXP) NAMED_ASSOC list) : EXP list = (
let	fun name_act_of_choice ({choice = [ACAggChoiceSingle (EId n)], comp = e}) = (
		(n, e)
	) | name_act_of_choice _ = (
		fail "named_assocs_to_exps" 508045 []
	);
	val names_acts = map name_act_of_choice ns;
	fun do1_formal (name, def) = (
		case s_lookup name names_acts of
			Value e => e
		|	Nil => (
			case def of
				Value e => EAuxiliaryExp(ZTmQuotation(e, Nil))
			|	Nil =>  fail "named_assocs_to_exps" 508044 [fn _ => name]
		)
	);
	fun check_acts ((name, _)::rest) = (
		if	any rest (fn (n, _) => n = name)
		then	fail "named_assocs_to_exps" 508043 [fn _ => name]
		else if	all names_defs (fn (n, _) => n <> name)
		then	fail "named_assocs_to_exps" 508063 [fn _ => name]
		else 	check_acts rest
	) | check_acts [] = ();
in	check_acts names_acts;
	map do1_formal names_defs
end);
=TEX

=SML
fun ⦏positional_assocs_to_exps⦎ (names_defs : (ID * Z_EXP OPT) list)
		(acts :  EXP list) : EXP list = (
let	val num_formals = length names_defs;
	val num_actuals = length acts;
in	if	num_actuals > num_formals
	then	fail "positional_assocs_to_exps" 508064 []
	else if	num_actuals = num_formals
	then	acts
	else	let	fun mk_exp t = EAuxiliaryExp(ZTmQuotation (t, Nil));
			val defs = map (mk_exp o force_value o snd) (names_defs from num_actuals)
				handle Fail _ => fail "positional_assocs_to_exps" 508069 [];
		in	acts @ defs
		end
end);
=TEX
=SML
val ⦏informal_function_ty⦎ : TYPE = dest_z_power_type(snd(dest_const( ⓩ Informal_Function ⌝)));
fun ⦏adjust_id⦎ (env : CN_ENV) (id : ID)  = (
	case (env (trans_id id)) of
		Value {	tipe = ty,
			info = EIEnvFunction { pars = names_tmarks_defs, ...},
			canon_name = cn,
			private = _} =>  (
			let	val names_defs = map (fn{id,  default, ...} => (id, default)) names_tmarks_defs;
				val args = positional_assocs_to_exps names_defs [];
			in	if	force_value ty =: informal_function_ty
				then	fail "adjust_id" 508049 [fn()=>id]
				else	EFunCall{fun_name=cn, args=args}
			end	handle ex as (Fail _) => (
				divert ex "force_value" "adjust_id" 508078 [fn _ => trans_id id]
			)

	) | _ => EId id
);
fun ⦏adjust_rangelohi⦎ (env : CN_ENV) ({lo=l, hi=h} : EXP RANGELOHI) = (
	{lo=adjust_exp env l, hi=adjust_exp env h}
)
and ⦏adjust_range⦎ (env : CN_ENV) (RRange x : EXP RANGE) = (
	RRange (adjust_rangelohi env x)
) | adjust_range env (RRangeAttr x : EXP RANGE) = (
	RRangeAttr (adjust_exp env x)
)
and ⦏adjust_discrete_range_constrained⦎ (env : CN_ENV) ({tmark=t, range=r} :
		EXP DISCRETE_RANGE_CONSTRAINED) = (
	{tmark=t, range=adjust_range env r}
)
and ⦏adjust_discrete_range⦎ (env : CN_ENV) (DRRange x : DISCRETE_RANGE) = (
	DRRange (adjust_range env x)
) | adjust_discrete_range env (DRConstrained x : DISCRETE_RANGE) = (
	DRConstrained(adjust_discrete_range_constrained env x)
)
and ⦏adjust_agg_choice⦎ (env : CN_ENV) (ACAggChoiceRange x : AGG_CHOICE) = (
	ACAggChoiceRange (adjust_discrete_range env x)
) | adjust_agg_choice env(ACAggChoiceSingle x : AGG_CHOICE) = (
	let	val n = name_to_tmark x;
	in
		case env n of
		Value {info = EIEnvOtherType, ...} => (
			ACAggChoiceRange(DRConstrained{range=RRange {
				lo=EAttribute {attribute_desig=ADAttrib "FIRST",prefix=x},
				hi=EAttribute {attribute_desig=ADAttrib "LAST", prefix=x}},
				tmark=n})
		) |	_ => ACAggChoiceSingle (adjust_exp env x)
	end
)
and ⦏adjust_named_assoc⦎ (env : CN_ENV) ({choice=c, comp=e}
		: (AGG_CHOICE, EXP) NAMED_ASSOC) = (
	{choice=map (adjust_agg_choice env) c, comp=adjust_exp env e}
)
and ⦏adjust_others⦎ (env : CN_ENV) ({others=oth} : EXP OTHERS) = (
	{others=adjust_exp env oth}
)
and ⦏adjust_agg_pos⦎ (env : CN_ENV)
		({tmark=tmark as Value t, comps=c} : EXP AGG_POS) = (
	case env t of
	Value {info = EIEnvRecordType _, canon_name, ...} => (
			ERecAggPos {tmark=Value canon_name, comps=map (adjust_exp env) c}
        ) |	Value {canon_name, ...} => (
			EArrayAggPos {tmark=Value canon_name, comps=map (adjust_exp env) c}
        ) |_ => (
			EArrayAggPos {tmark=tmark, comps=map (adjust_exp env) c}
	)
) | adjust_agg_pos  (env : CN_ENV)
		({tmark=Nil, comps=c} : EXP AGG_POS) = (
	EArrayAggPos {tmark=Nil, comps=map (adjust_exp env) c}
)
and ⦏adjust_agg_pos_others⦎ (env : CN_ENV) ({agg_pos = {tmark=t, comps=c} :
		EXP AGG_POS, others = oth} : EXP AGG_POS_OTHERS) = (
	EArrayAggPosOthers {	agg_pos={	tmark=t,
						comps=map (adjust_exp env) c},
				others=adjust_others env oth}
)
and ⦏adjust_agg_others⦎	(env : CN_ENV)
				({tmark=t, others=oth} : EXP AGG_OTHERS) = (
         EArrayAggOthers{tmark=t, others=adjust_others env oth}
)
and ⦏adjust_agg_named⦎ (env : CN_ENV) ({tmark=t, named_assocs=n}
		: (AGG_CHOICE, EXP) AGG_NAMED) = (
	EArrayAggNamed {tmark=t, named_assocs=map (adjust_named_assoc env) n}
)
and ⦏adjust_agg_named1⦎ (env : CN_ENV)
		({tmark=tmark as Value t, named_assocs=n}
		: (AGG_CHOICE, EXP) AGG_NAMED) = (
let	val n' = map (adjust_named_assoc env) n;
in
	case env t of
	Value {info = EIEnvRecordType _, canon_name, ...} => (
			ERecAggNamed {tmark=Value canon_name, named_assocs=n'}
        ) | _ => (
			EArrayAggNamed {tmark=tmark, named_assocs=n'}
	)
end
) | adjust_agg_named1 (env : CN_ENV)
		({tmark= Nil, named_assocs=n}
		: (AGG_CHOICE, EXP) AGG_NAMED) = (
let	val n' = map (adjust_named_assoc env) n;
in
	EArrayAggNamed {tmark=Nil, named_assocs=n'}
end
)
and ⦏adjust_agg_named_others⦎ (env : CN_ENV) ({agg_named=a, others=oth} :
		(AGG_CHOICE, EXP) AGG_NAMED_OTHERS) = (
let	val adjagg = case adjust_agg_named1 env a of
		EArrayAggNamed ag => (
			ag
		) | _ => fail "adjust_exp" 508046 []
in
	EArrayAggNamedOthers{agg_named=adjagg,others=adjust_others env oth}
end
)
and ⦏adjust_unary_exp⦎ (env : CN_ENV) ({uop=u, right=r} : EXP UNARY_EXP) = (
	EUnaryExp{uop=u, right=adjust_exp env r}
)
and ⦏adjust_bin_exp⦎ (env : CN_ENV) ({bop=b, left=l, right=r} : EXP BIN_EXP) = (
	EBinExp{left=adjust_exp env l, bop=b, right=adjust_exp env r}
)
and ⦏adjust_attrib_desig⦎ (env : CN_ENV) (ADAttrib x : ATTRIB_DESIG) = (
	ADAttrib x
) | adjust_attrib_desig env (ADAttribArg (a,e) : ATTRIB_DESIG) = (
	ADAttribArg (a, adjust_exp env e)
)
and ⦏adjust_mem_range⦎	(env : CN_ENV)
				({mop=m, left=l, range=r} : EXP MEM_RANGE) = (
	EMemRange{left=adjust_exp env l, mop=m, range=adjust_range env r}
)
and ⦏adjust_attribute⦎ (env : CN_ENV) ({prefix=p, attribute_desig=a} :
		(EXP, ATTRIB_DESIG) ATTRIBUTE) = (
	EAttribute{prefix=adjust_exp env p, attribute_desig=adjust_attrib_desig env a}
)
and ⦏adjust_indexed_comp⦎	(env : CN_ENV)
				({prefix=p, index=i} : EXP INDEXED_COMP) = (
let	val n = name_to_tmark p;
	val (prename, env_prename) =
		case env n of
			res as (Value {canon_name, ...}) =>
				if	canon_name <> n
				then	(canon_name, env canon_name)
				else	(n, res)
		|	Nil => (n, Nil);
in
	case (env_prename, i) of
=TEX
Is it a function call?
=SML
	(Value {	tipe = ty,
		info = EIEnvFunction {pars = names_tmarks_defs, ...}, ...},
		EArrayAggPos{comps,...}) => (
	let	val names_defs = map (fn {id, default, ...} => (id, default)) names_tmarks_defs;
		val args = positional_assocs_to_exps names_defs comps;
	in	if	force_value ty =: informal_function_ty
		then	fail "adjust_id" 508049 [fn()=>prename]
		else	EFunCall{fun_name=prename, args=map (adjust_exp env)  args}
	end	handle ex as (Fail _) => (
		divert ex "force_value" "adjust_indexed_comp" 508078 [fn _ => prename]
	)
	) |(Value {
		tipe = ty,
		info = EIEnvFunction {pars = names_tmarks_defs, ...}, ...},
		EArrayAggNamed{named_assocs, ...}) => (
	let	val names_defs = map (fn {id, default, ...} => (id, default)) names_tmarks_defs;
		val args = named_assocs_to_exps names_defs named_assocs;
	in	if	force_value ty =: informal_function_ty
		then	fail "adjust_id" 508049 [fn()=>prename]
		else	EFunCall
			{fun_name=prename, args=map (adjust_exp env) args}
	end	handle ex as (Fail _) => (
		divert ex "force_value" "adjust_indexed_comp" 508078 [fn _ => prename]
	)
=TEX
Is it a type conversion?
=SML
	) |(Value {info = EIEnvRecordType _, ...}, EArrayAggPos{comps=[comp],...}) => (
		ETypeConversion{tmark=prename, exp= (adjust_exp env) comp}
	) |(Value {info = EIEnvOtherType, ...}, EArrayAggPos{comps=[comp],...}) => (
		ETypeConversion{tmark=prename, exp= (adjust_exp env) comp}
=TEX
No... It must be an indexed component for real. So check for errors...
=SML
	) |(_, EArrayAggPos {comps=[], ...}) => (
		fail "adjust_indexed_comp" 508035 [fn()=> name_to_tmark p]

	) |(_, EArrayAggPos{comps=comps, tmark=Nil}) => (
		EIndexedComp{prefix=adjust_exp env p,
			index = EArrayAggPos{comps = map (adjust_exp env) comps, tmark = Nil}}

	) |(_, EArrayAggPos _) => (
		fail "adjust_indexed_comp" 508055 [fn()=> name_to_tmark p]

	) |(_, EArrayAggNamed _) => (
		fail "adjust_indexed_comp" 508047 [fn()=>name_to_tmark p]

	) |_ => (
		fail "adjust_indexed_comp" 508048 [fn()=>prename]

	)
end
)
and ⦏adjust_selected_comp⦎ env ({prefix=p, selector=s} : EXP SELECTED_COMP) = (
	case p of
	EId "STANDARD" => (
		EId s
	) | EId id => (
		let	val cid = canonical_id env id;
		in	case env cid of
			Value {tipe = ty, ...} => (
				(	(dest_z_schema_type (force_value ty));
					ESelectedComp{prefix=adjust_exp (env : CN_ENV) (EId cid),
								selector=s}	)
				handle Fail _ => adjust_exp env (EId (cid^"."^s))
			)| _ => adjust_exp env (EId (cid^"."^s))
		end
	) | _ => 	(
		case adjust_exp env p of
			p' as (EId _) =>
				adjust_selected_comp env
				{prefix=p', selector = s}
		|	p' =>
			ESelectedComp{prefix=p', selector=s}
	)
)
and ⦏adjust_qualified_expression⦎
				(env : CN_ENV)
				({tmark=t, exp=e} : EXP QUALIFIED_EXPRESSION) = (
	case e of
	EArrayAggPos{comps = [comp],...} => (
		EQualifiedExp{tmark = t, exp = adjust_exp env comp}
	)| EArrayAggPos{comps,...} => (
		adjust_agg_pos env {comps=comps, tmark=Value t}
	)| EArrayAggPosOthers{agg_pos={comps,...}, others} => (
		adjust_agg_pos_others env
			{agg_pos={comps=comps,tmark=Value t},others=others}
	)| EArrayAggOthers{others,...} => (
		adjust_agg_others env {others=others,tmark=Value t}
	)| EArrayAggNamed {named_assocs = n, tmark= _} => (
		 adjust_agg_named1 env {named_assocs = n, tmark = Value t}
	)| EArrayAggNamedOthers
			{agg_named as {named_assocs = n, tmark = _}, others} => (
		adjust_agg_named_others env
			{	agg_named={named_assocs = n, tmark = Value t},
				others=others}
	)| e' => (
		EQualifiedExp{tmark = t, exp = adjust_exp env e'}
	)
)
=TEX
The parser does not generate type conversions, but some of
the program transformations for modular types do, so
an adjuster for these is now needed.
=SML
and ⦏adjust_type_conversion⦎
				(env : CN_ENV)
				({tmark=t, exp=e} : EXP TYPE_CONVERSION) = (
	ETypeConversion {tmark = t, exp = adjust_exp env e}
)
=TEX
In the following, both named and positional record aggregates and function calls
need no adjustment since these constructs can only be produced by adjust\_exp.
If they occur in the input then it adjust\_exp will already have been called
and need not be called again.
=SML
and ⦏adjust_exp⦎ (env : CN_ENV) (exp as (EId id : EXP)) = (
	adjust_id env id
) | adjust_exp env (exp as (EIntReal _)) = (
	exp
) | adjust_exp env (exp as (EArrayAggPos x)) = (
	adjust_agg_pos env x
) | adjust_exp env (exp as (EArrayAggPosOthers x)) = (
	adjust_agg_pos_others env x
) | adjust_exp env (exp as (EArrayAggOthers x)) = (
	adjust_agg_others env x
) | adjust_exp env (exp as (EArrayAggNamed x)) = (
	adjust_agg_named env x
) | adjust_exp env (exp as (EArrayAggNamedOthers x)) = (
	adjust_agg_named_others  env x
) | adjust_exp env (exp as (ERecAggPos x)) = (
	exp
) | adjust_exp env (exp as (ERecAggNamed x)) = (
	exp
) | adjust_exp env (exp as (EUnaryExp x)) = (
	adjust_unary_exp env x
) | adjust_exp env (exp as (EBinExp x)) = (
	adjust_bin_exp env x
) | adjust_exp env (exp as (EMemRange x)) = (
	adjust_mem_range env x
) | adjust_exp env (exp as (EAttribute x)) = (
	adjust_attribute env x
) | adjust_exp env (exp as (EIndexedComp x)) = (
	adjust_indexed_comp env x
) | adjust_exp env (exp as (ESelectedComp x)) = (
	adjust_selected_comp env x
) | adjust_exp env (exp as (EFunCall _)) = (
	exp
) | adjust_exp env (exp as (EAuxiliaryExp _)) = (
	exp
) | adjust_exp env (exp as (EQualifiedExp x)) = (
	adjust_qualified_expression env x
) | adjust_exp env (exp as (ETypeConversion x)) = (
	adjust_type_conversion env x
) | adjust_exp env (exp as (EBracketed x)) = (
	adjust_exp env x
) | adjust_exp env (exp as (EStringLiteral _)) = (
	exp
) | adjust_exp env (exp as (ECharacterLiteral _)) = (
	exp
) | adjust_exp env (EDiscreteRange dr) = (
	EDiscreteRange (adjust_discrete_range env dr)
);
=TEX
The following variant of $adjust\_exp$ returns an optional Z expression. If the SPARK expression can only be handled informally then a comment message is printed out and $Nil$ is returned.
=SML
fun ⦏adjust_exp1⦎ (env : CN_ENV) (exp : EXP) : EXP OPT = (
	Value (adjust_exp env exp)
	handle Fail msg  => (
		comment "adjust_exp1" 508050 [fn _ => get_message msg];
		Nil
	)
);
=TEX

\section{CHECKING FOR EMPTY RANGES}
The code in this section implements check 14 from section 17.1 of volume I of the specifications.
This requires evaluation of static expressions which is most conveniently done using proof.

The following function generates the VC for checking that an integral type or subtype defined by a range constraint is non-empty.
=SML
val ⦏int_set_x_var⦎ = ⓩx ⦂ ℙ ℤ⌝;
val ⦏int_vc_pattern⦎ = ⓩⓜint_set_x_var⌝ ≠ ∅⌝;
fun ⦏int_range_check_vc⦎ (n : Z_ID) : Z_EXP = (
	subst[(mk_z_gvar(n, z_int_set_type, []), int_set_x_var)] int_vc_pattern
);
=TEX
The following function reports an error if the range bounds for an integral type can be evaluated and the range proves to be empty;
if the range can be evaluated and is non-empty then the function returns an empty list of paragraphs;
if the range cannot be evaluated a paragraph containing a VC is returned.

The somewhat strange way of expressing the decision-making arises from the desire to include the equations in the message in the error case, if they are non-trivial (i.e., if the evaluation has made some progress).
=SML
fun ⦏int_range_check_vcs⦎
	(n : ID) (lo : TERM) (hi : TERM) : PARAINFO list = (
	(let	val lo_eqn = (concl o TRY_C(cn_eval_conv[])) lo;
		val hi_eqn = (concl o TRY_C(cn_eval_conv[])) hi;
		val nlo = (dest_z_signed_int o snd o dest_eq) lo_eqn;
		val nhi = (dest_z_signed_int o snd o dest_eq) hi_eqn;
		fun show t () = (
			let	val (x, y) = dest_eq t;
			in	if	x = y
				then	string_of_term x
				else	string_of_term x ^ " (= " ^ string_of_term y ^ ")"
			end
		);
	in	if	nlo @<= nhi
		then	(fn _ => [])
		else	(fn _ =>
				fail  "trans_basic_decl"
					508060 [show lo_eqn, show hi_eqn])
	end	handle Fail _ => (fn _ =>
			(comment "trans_basic_decl"508061 [fn _ => n];
			[ConjectureInfo(Value n, [], int_range_check_vc (trans_id n))])
	))	()
);
=TEX
The following function generates the VC for checking that
the modulus of a modular type is positive.
=SML
val ⦏int_x_var⦎ = ⓩx ⦂ ℤ⌝;
val ⦏modulus_vc_pattern⦎ = ⓩⓜint_x_var⌝ > 0⌝;
fun ⦏modulus_check_vc⦎ (m : TERM) : Z_EXP = (
	subst[(m, int_x_var)] modulus_vc_pattern
);
=TEX
=TEX
The following function reports an error if the modulus for a modular type is positive;
if the modular cannot be evaluated a paragraph containing a VC is returned.

In the error case, as with the range checks above, if the evaluation has made some progress we show the result.
=SML
fun ⦏modulus_check_vcs⦎
	(n : ID) (m : TERM) : PARAINFO list = (
	(let	val m_eqn = (concl o TRY_C(cn_eval_conv[])) m;
		val ml_m = (dest_z_signed_int o snd o dest_eq) m_eqn;
		fun show t () = (
			let	val (x, y) = dest_eq t;
			in	if	x = y
				then	string_of_term x
				else	string_of_term x ^ " (= " ^ string_of_term y ^ ")"
			end
		);
	in	if	zero @< ml_m
		then	(fn _ => [])
		else	(fn _ =>
				fail  "trans_basic_decl"
					508072 [show m_eqn])
	end	handle Fail _ => (fn _ =>
			(comment "trans_basic_decl"508073 [fn _ => n];
			[ConjectureInfo(Value n, [], modulus_check_vc m)])
	))	()
);
=TEX
The following function generates the VC for checking that a real type or subtype defined by a range constraint is non-empty.
=SML
val ⦏real_set_x_var⦎ = ⓩ(x ⦂ ℙ ℝ)⌝;
val ⦏real_vc_pattern⦎ = ⓩⓜreal_set_x_var⌝ ≠ ∅⌝;
fun ⦏real_range_check_vc⦎ (n : Z_ID) : Z_EXP = (
	subst[(mk_z_gvar(n, z_real_set_type, []), real_set_x_var)] real_vc_pattern
);
=TEX
The following function is the analogue of {\em int\_range\_check\_vcs} for real types (see above).
=SML
fun ⦏real_range_check_vcs⦎
	(n : ID) (lo : TERM) (hi : TERM) : PARAINFO list = (
	(let	val lo_eqn = (concl o TRY_C(cn_eval_conv[])) lo;
		val hi_eqn = (concl o TRY_C(cn_eval_conv[])) hi;
		val nlo = (snd o dest_eq) lo_eqn;
		val nhi = (snd o dest_eq) hi_eqn;
		val thm = z_ℝ_≤_conv(mk_z_ℝ_≤(nlo, nhi));
		val ok = (⇔_t_elim thm; true)
			handle Fail _ => false;
		fun show t () = (
			let	val (x, y) = dest_eq t;
			in	if	x = y
				orelse	is_z_float x
				orelse	is_z_real x
				orelse	let	val x' = dest_z_ℝ_minus x;
					in	is_z_float x' orelse is_z_real x'
					end	handle Fail _ => false
				then	string_of_term x
				else	string_of_term x ^ " (= " ^ string_of_term y ^ ")"
			end
		);
	in	if	ok
		then	(fn _ => [])
		else	(fn _ =>
				fail  "trans_basic_decl"
					508060 [show lo_eqn, show hi_eqn])
	end	handle Fail _ => (fn _ =>
			(comment "trans_basic_decl" 508061 [fn _ => n];
			[ConjectureInfo(Value n, [], real_range_check_vc (trans_id n))])
	))	()
);
=TEX

\section{TRANSLATING SPARK BASIC DECLARATIONS}

\subsection{Translating Constants}

=SML
fun ⦏basic_decl_const⦎
		(env : CN_ENV, pfx : Z_ID list)
		({consts=consts, tm=tmo, expr=expr} : EXP CONST_DECL)
		: PARAINFO list= (
	let	val expr1 =
			case tmo of
				Value tm =>
				if	is_modular_type tm
				then	ETypeConversion{tmark = tm, exp = expr}
				else	expr
			|	Nil => expr;
		val ae = adjust_exp1 env expr1;
		val te = case ae of Value e => trans_exp1 env e | _ => Nil;
	in	case (te, tmo) of
			(Value te, Value tm) => (
			let	val sl_te = slide_to_tmark env (te, tm);
				val zexp = zid env (trans_id tm);
				val ty = type_of sl_te;
				val tm_ty = dest_z_power_type (type_of zexp);
				fun zpara const = (
					let	val zi = prefix_trans_id pfx  const;
						val zvar = mk_z_lvar(zi, ty, []);
					in	z_ax "constant" (zi, zexp, [z_eq(zvar, sl_te)])
					end
				);
			in	if	ty =: tm_ty
				then	map zpara consts
				else	fail "basic_decl_const" 508068
					[fn _ => format_list Combinators.I consts ", ",
					 fn _ => tm]
			end
		) |	(Value te, Nil) => (
			map (fn const => z_eq_eq "constant" (prefix_trans_id pfx const, te)) consts
		) |	(Nil, _) => (
			let	fun do1 const = (
					case tmo of Value tm => (
						let	val zexp = zid env (trans_id tm);
							val zvar = prefix_trans_id pfx const;
						in	z_ax "constant" (zvar, zexp, [])
						end
					) | Nil => (
						fail "basic_decl_const" 508067 [fn _ =>const]
					)
				);
			in	map do1 consts
			end	
		)
	end
);
=TEX
\subsection{Translating Enumeration Types}
The temporary environments set up in the following functions is only for internal use (in the calls to $zid$) and is not part of the return value.
The setting of the private component of the environment infos is a dummy.
=SML
fun ⦏enum_attrib⦎ (env : CN_ENV) (zid⋎1 : Z_ID, zid⋎2 : Z_ID, zid⋎3 : Z_ID) = (
let	fun env' id =
		if id = (zid⋎1 ^^ zlst)
		then	Value {
			tipe = Value z_int_type,
			info = EIEnvOther,
			canon_name = id,
			private = false}
		else if id mem [zid⋎1 ^^ zsuc, zid⋎1 ^^ zpos]
		then	Value {
			tipe =Value  z_int_int_rel_type,
			info = EIEnvOther,
			canon_name = id,
			private = false}
		else	env id;
	val zexp = z_set_minus (zid env' zid⋎1, z_set [zid env' (zid⋎1 ^^ zlst)]);
	val z_e_e = z_eq_eq "type";
in
	[z_e_e (zid⋎1 ^^ zfst, zid env' zid⋎2),
	z_e_e (zid⋎1 ^^ zlst, zid env' zid⋎3),
	z_e_e (zid⋎1 ^^ zsuc, z_dom_res (zexp, z_succ)),
	z_e_e(zid⋎1 ^^ zpred, z_inv(zid env' (zid⋎1 ^^ zsuc))),
	z_e_e(zid⋎1 ^^ zpos, z_id_rel (zid env' zid⋎1)),
	z_e_e(zid⋎1 ^^ zval, z_inv(zid env' (zid⋎1 ^^ zpos)))]
end);
=TEX
=SML
fun ⦏basic_decl_enum⦎ (env : CN_ENV, pfx : Z_ID list)
	(name : ID) (td : ENUM_TYPE_DEF) = (
let	val {vals} = td;
	val zname = prefix_trans_id pfx name;
	val zvals = map (prefix_trans_id pfx) vals;
	val znums = map (z_num o integer_of_int) (interval 0 ((length vals)-1));
	fun env' id = (
		if id mem zvals
		then
			Value {
				tipe = Value z_int_type,
				info = EIEnvOther,
				canon_name = id,
				private = false}
		else if id = zname
		then
			Value {
				tipe = Value z_int_set_type,
				info = EIEnvOther,
				canon_name = id,
				private = false}
		else
			env id
	);
	val z_e_e = z_eq_eq "type";
in
	map (fn j => z_e_e j) (combine zvals znums) @
	[z_e_e(zname, z_rng(zid env' (hd zvals), zid env' ((hd o rev) zvals)))] @
	enum_attrib env' (zname, hd zvals, (hd o rev) zvals)
end);
=TEX
\subsection{Translating Array Types}
=SML
fun ⦏real_name⦎ (env : CN_ENV) (tm : TMARK) : TMARK = (
	let	val ztm = trans_id tm;
	in	case env ztm of
			Value{canon_name, ...} => canon_name
		|	_ => ztm
	end
);
=TEX
=SML
fun ⦏array_attrib_aux⦎ (env : CN_ENV) (zid⋎1 : Z_ID) (zid⋎2 : Z_ID, i : int) : PARAINFO list = (
let	val z_e_e = z_eq_eq "type";
in
	[z_e_e(dimen(zid⋎1 ^^ zfst, i), zid env (zid⋎2 ^^ zfst)),
	z_e_e(dimen(zid⋎1 ^^ zlst, i), zid env (zid⋎2 ^^ zlst)),
	z_e_e(dimen(zid⋎1 ^^ zlength, i), z_size (zid env zid⋎2)),
	z_e_e(dimen(zid⋎1 ^^ zrange, i), zid env zid⋎2)]
end
);
=TEX
The handler below catches failures from {\it hd}.
=SML
fun ⦏array_attrib⦎ (env : CN_ENV) (zid : Z_ID, zids : Z_ID list) : PARAINFO list = (
	let	val aux = array_attrib_aux env zid;
		val zids_is = combine zids (interval 1 (length zids));
		val hd_zids = hd zids
		handle Fail _ => fail "array_attrib" 508035 [];
	in	aux (hd_zids, 0) @
		flat (map aux zids_is)
	end
);
=TEX
=SML
fun ⦏basic_decl_con_array⦎ (env : CN_ENV, pfx : Z_ID list) (name : ID)
		({index=index, comp=comp} : ARRAY_DEF) : PARAINFO list = (
	let	val zname = prefix_trans_id pfx name;
		val rindex = map (real_name env) index;
		val zindex = z_many_cross (map (zid env) rindex);
		val zcomp = trans_id comp;
		val z_e_e = z_eq_eq "type";
	in
		[z_e_e(zname, z_tfun(zindex, zid env zcomp))] @
		array_attrib env (zname, rindex)
	end
);
=TEX
=SML
=TEX
=SML
fun ⦏basic_decl_uncon_array⦎ (env : CN_ENV, pfx : Z_ID list) (name : ID)
		({index=[head_index], comp=comp} : ARRAY_DEF) : PARAINFO list = (
	let	val zname = prefix_trans_id pfx name;
		val zindex = trans_id head_index;
		val zcomp = trans_id comp;
		val zexp = z_powerset(z_pfun(zid env zindex, zid env zcomp));
	in
		[z_ax "type" (zname, zexp, [])]
	end
) | basic_decl_uncon_array (env, pfx) name
	({index=index, comp=comp} : ARRAY_DEF) = (
	let	val zname = prefix_trans_id pfx name;
		val zindex = z_many_cross (map (zid env o trans_id) index);
		val zcomp = trans_id comp;
		val zexp = z_powerset(z_pfun(zindex, zid env zcomp));
	in
		[z_ax "type" (zname, zexp, [])]
	end
);
=TEX

\subsection{Translating Record Types}
=SML
fun ⦏conv_var_decl⦎ ({vars=vs, tmark=t} : VAR_DECL)
		: {var : ID, tmark : TMARK} list = (
	 map (fn id => {var=id, tmark=t}) vs
);
=TEX
=SML
fun ⦏trans_decl_aux⦎ (env : CN_ENV) ({vars, tmark} : VAR_DECL) : Z_DECL * (Z_ID list) = (
let	val zvs = map trans_id vars;
	val zexp = zid env (trans_id tmark);
	val zvars = map (fn zv => mk_z_lvar (zv,
						(dest_z_power_type o type_of) zexp,
						[])) zvs;
in
	(mk_z_dec (zvars, zexp), zvs)
end);
fun ⦏trans_decl⦎ (env : CN_ENV) : VAR_DECL -> Z_DECL = fst o trans_decl_aux env;
=TEX
=SML
local
fun ⦏mk_update_defs⦎ (tyname : Z_ID) (comps : Z_ID list list) : PARAINFO = (
	let	val n_comps = length comps;
		val gen_formals = map (fn i => "g" ^ string_of_int i) (interval 1 n_comps);
		fun do_sch_decs [] _ = []
		|   do_sch_decs comps gen_formals = (
			let	val c = hd comps;
				val n = hd gen_formals;
				val ty = mk_z_var_type n;
				fun mk_v v = mk_z_lvar(v, ty, []);
			in	(map mk_v c, mk_z_lvar(n, mk_z_power_type ty, []))
			end	:: do_sch_decs (tl comps) (tl gen_formals)
		);
		val sch_decs = do_sch_decs comps gen_formals;
		val decl = mk_z_decl(map mk_z_dec sch_decs);
		val h_schema = mk_z_h_schema (decl, mk_t);
		val _ = schema_gen_semantic_const h_schema;
		fun upd_name c = tyname ^ "u" ^ c;
		fun do_sig_decs [] _ = []
		|   do_sig_decs comps decs = (
			let	val c = hd comps;
				val (_, x) = hd decs;
				val set = z_tfun(mk_z_×[h_schema, x], h_schema);
				val ty = dest_z_power_type (type_of set);
				fun mk_v v = mk_z_lvar(upd_name v, ty, []);
			in	(map mk_v c, set)
			end	:: do_sig_decs (tl comps) (tl decs)
		);
		val sig_decs = do_sig_decs comps sch_decs;
		val sig_decl = mk_z_decl(map mk_z_dec sig_decs);
		fun do_∀_decs _ [] = []
		|   do_∀_decs n ((_, x)::more) = (
			let	val ty = dest_z_power_type (type_of x);
				val v = mk_z_lvar("x" ^ string_of_int n, ty, []);
			in	([v], x)
			end	:: do_∀_decs (n+1) more
		);
		val r = mk_z_lvar("r", dest_z_power_type(type_of h_schema), []);
		val r_dec = ([r],	h_schema);
		val var_decs = do_∀_decs 1 sch_decs;
		val ∀_decl = mk_z_decl(map mk_z_dec (r_dec :: var_decs));
		fun bind_one sel var comp = (
			if	sel = comp
			then	(comp, var)
			else	(comp, mk_z_sel⋎s(r, comp))
		);
		fun do_binding _ _  [] = []
		|   do_binding var sel cmps = (
			let	val cmpl = hd cmps;
			in	map (bind_one sel var) cmpl
			end	@ do_binding var sel (tl cmps)
		);
		fun do_eq var arg (f, c) = (
			mk_z_eq(mk_z_app(f, arg), z_binding(do_binding var c comps))
		);
		fun do_eqs [] _ _ = []
		|   do_eqs sigdecs vardecs cmps = (
			let	val (fs, _) = hd sigdecs;
				val cs = hd cmps;
				val var = hd(fst(hd vardecs));
				val arg = mk_z_tuple[r, var];
			in	map (do_eq var arg) (combine fs cs)
			end	@ do_eqs (tl sigdecs) (tl vardecs) (tl cmps)
		);
		val eqs = list_mk_∧(do_eqs sig_decs var_decs comps);
		val pred = mk_z_∀(∀_decl, mk_t, eqs);
		val idtys = map dest_var (flat (map fst sig_decs));
	in	AxDesInfo(gen_formals, sig_decl, Value pred, idtys)
	end
);
in
fun ⦏record_update_defs⦎ (zname : Z_ID, zcomps : Z_ID list list) : PARAINFO = (
	mk_update_defs zname zcomps
);
end;
=TEX
=SML
fun ⦏index_con_set_comp⦎ (env : CN_ENV) (tmark : TMARK) (domain : Z_EXP) : Z_EXP = (
	let	val zexp = zid env (trans_id tmark);
		val zvar_ty = dest_z_power_type(type_of zexp)
			handle Fail _ => fail "index_con_set_comp" 508051 [fn () => tmark];
		val var =  "array";
		fun env' id = (
			if	id = "array"
			then	Value {tipe = Value zvar_ty,
					info = EIEnvVar {tmark = tmark, kind = VKVar},
					canon_name = id,
					private = false}
			else	env id
		);
		val zp = z_eq (z_dom (zid env' var), domain);
	in	z_set_comp (trans_decl env' {vars=[var],tmark=tmark}, zp)
	end
);
=TEX
In the following, {\it disc} is the list of formal discriminants for the record
type we are introducing; if the constraint on the component declaration is
a discriminant constraint, {\it exps} is the list of actual discriminants in
the constraint. When we translate the expressions in the constraint, we must
do so in an environment extended to map the formal discriminants to
the appropriate information.
The returned value is a list of predicates.
=SML
fun ⦏trans_comp_decl⦎ (env : CN_ENV) (disc : VAR_DECL list)
	( (comps as {vars, tmark}, con) : EXP COMP_DECL ) : Z_PRED list = (
	let	fun env_aux ([] : VAR_DECL list) (d : Z_ID) : ENV_INFO OPT = (
			env d
		) | env_aux ({vars = ds, tmark = tm}::more) d = (
			if	d mem (map trans_id ds)
			then	Value{
				tipe = Value ((dest_z_power_type o type_of o zid env o trans_id) tm),
				info = EIEnvVar {tmark = tm, kind = VKVar},
				canon_name = d,
				private = false}
			else	env_aux more d
		);
		val env' = env_aux disc;
		fun trans_comps {vars, tmark} = (
			let	val ty = (dest_z_power_type o type_of)
						(zid env (trans_id tmark));
				fun trans1 v = mk_z_lvar(trans_id v, ty, []);
			in	map trans1 vars
			end
		);
		fun mk_set_comp ranges = (
			index_con_set_comp
			env'
			tmark
			(z_many_cross(map (trans_exp env') ranges))			
		);
		fun do_index_constraint setcmp acc [] = rev acc
		|   do_index_constraint setcmp acc (v::more) = (
			do_index_constraint setcmp
			(z_mem(v, setcmp)::acc)
			more
		);
		fun do_disc_constraint _ acc [] _ = rev acc
		|   do_disc_constraint ses acc (vs as (v::_)) ((sel, ze)::more) = (
			do_disc_constraint ses
			(z_eq(z_selection(v, sel), ze)::acc) vs
			more
		) | do_disc_constraint ses acc (_::vs) [] = (
			do_disc_constraint ses acc vs ses
		);
	in	case con of
			CCNoCon => []
		|	CCIndexCon ranges => (
			let	val setcmp = mk_set_comp ranges;
			in	do_index_constraint setcmp [] (trans_comps comps)
			end
		) |	CCDiscCon exps => (
			case env tmark of
				Value{info = EIEnvRecordType {
					comp_names = all_sels, num_discs = i}, ...} => (
			if	length exps <> i
			then	fail "trans_comp_decl" 508104
				[fn _ => hd vars, fn _ => string_of_int(length exps),
				 fn _ => string_of_int i]
			else if	length all_sels < i
			then	fail "trans_comp_decl" 508102
				[fn _ => tmark]
			else	let	val sels = all_sels to (i - 1);
					val zes = map (trans_exp env') exps;
					val svs = combine sels zes;
					val cmps = trans_comps comps;
				in	do_disc_constraint svs [] cmps svs
				end
			) |	_ => (
				fail "trans_comp_decl" 508103
				[fn _ => hd vars, fn _ => tmark]
			)
		)
	end
);
=TEX
=SML
fun ⦏basic_decl_record⦎ (env : CN_ENV, pfx : Z_ID list) (name : ID)
		({decl, disc} : EXP RECORD_TYPE_DEF) : PARAINFO list = (
let	val z_sname = prefix_trans_id pfx name;
	val all_decls = disc @ map fst decl;
	val (z_decls, zcomps) = split(map (trans_decl_aux env) all_decls);
	val pred = (z_many_and o flat o map (trans_comp_decl env disc)) decl;
in
	[z_schema(z_sname, z_decls, pred), record_update_defs(z_sname, zcomps)]
end);
=TEX
\subsection{Translating Integer Types}

=SML
local
	val z_exp = z_pfun(ℤ_tm, ℤ_tm);
in
fun ⦏int_type_attrib⦎ (env : CN_ENV) (zid1, range) = (
	let	val {lo, hi} = dest_range (adjust_range env range);
		val zvar1 = zid1 ^^ zsuc;
		val zvar2 = zid1 ^^ zpred;
		val zvar3 = zid1 ^^ zpos;
		val zvar4 = zid1 ^^ zval;
		val z_e_e = z_eq_eq "type";
		val z_a = z_ax "type";
	in
		[z_e_e(zid1 ^^ zfst, trans_exp env lo),
		z_e_e(zid1 ^^ zlst, trans_exp env hi),
		z_a(zvar1, z_exp, []),
		z_a(zvar2, z_exp, []),
		z_a(zvar3, z_exp, []),
		z_a(zvar4, z_exp, [])]
	end
);
end;
=TEX
=SML
fun ⦏basic_decl_int_type⦎ (env : CN_ENV, pfx : Z_ID list)
	(name : ID) (range : EXP RANGE)
	: PARAINFO list = (
	let	val {lo, hi} = dest_range (adjust_range env range);
		val tlo = trans_exp env lo;
		val thi = trans_exp env hi;
		val zname = prefix_trans_id pfx name;
		fun mk_vcs () = int_range_check_vcs name tlo thi;
		val z_e_e = z_eq_eq "type";
	in	if	not(type_of tlo =: z_int_type)
		then	term_fail "basic_decl_int_type" 508066 [tlo]
		else if	not(type_of thi =: z_int_type)
		then	term_fail "basic_decl_int_type" 508066 [thi]
		else	((z_e_e(zname, z_rng(tlo, thi)) ::
			  int_type_attrib env (zname, RRange{lo=lo,hi=hi})) @ mk_vcs ())
	end
);
=TEX
\subsection{Translating Modular Types}
A modular type declarations introduce a new Z type defined with a free type definition.
To simplify the construction of terms involving the free type
we set up some polymorphic template expressions.
These are instantiated mapping the type variable $'a$ to the new type and mapping free variables by prefixing the names with the type name.
=SML
val ⦏alpha_type⦎  = mk_vartype "'a";
fun ⦏alphaize⦎ (tm : TERM) : TERM = (
	inst []
	(combine [alpha_type]
		(map mk_vartype (term_tyvars tm)))
	tm
);
val ⦏gen_mt_range⦎ : Z_EXP = ⓩ 0 .. vMODULUS - 1 ⌝;
val ⦏gen_mt_of_int_dec⦎ : Z_PRED = alphaize ⓩ ℤ → ⌜$""⌝ ⌝;
val ⦏gen_mt_of_int_pred⦎ : Z_PRED = alphaize
	ⓩ ∀i : ℤ⦁ _of_int i = vVAL (i mod vMODULUS) ⌝;
val ⦏gen_mt_first_def⦎ : Z_EXP = alphaize ⓩ vVAL 0 ⌝;
val ⦏gen_mt_last_def⦎ : Z_EXP = alphaize ⓩ vVAL (vMODULUS - 1) ⌝;
val ⦏gen_mt_pos_def⦎ : Z_EXP = alphaize ⓩ (vVAL ⦂ ℤ → X) ↗~↕ ⌝;
val ⦏gen_mt_succ_def⦎ : Z_EXP = alphaize
	ⓩ (vPOS ⦂ X → ℤ) ⨾ succ ⨾ (_of_int ⦂ ℤ → X) ⌝;
val ⦏gen_mt_pred_def⦎ : Z_EXP = alphaize ⓩ (vSUCC ⦂ X → X) ↗~↕ ⌝;
=TEX
The following function does the instantation:
=SML
fun ⦏inst_mt_term⦎
	(name : Z_ID)
	(subst_as_lvar : string list)
	(tm : TERM) : TERM = (
	let	val tvs = term_tyvars tm;
		val ty = mk_ctype(bind_gvar_name name, []);
		val tm1 =
		case tvs of
			[] => tm
		|	_ => inst [] [(ty, alpha_type)] tm;
 		fun var_subs v = (
			let	val (n, ty, _) = dest_z_lvar v;
				val mk = if n mem subst_as_lvar
					then mk_z_lvar
					else mk_z_gvar;
			in	(mk(name ^ n, ty, []), v)
			end
		);
		val subs = map var_subs (frees tm1);
	in	subst subs tm1
	end
);
=TEX
=SML
fun ⦏basic_decl_modular_type⦎ (env : CN_ENV, pfx : Z_ID list)
	(name : ID) ({modulus} : EXP MODULUS)
	: PARAINFO list = (
	let	val m = trans_exp env (adjust_exp env modulus);
		val _ =
			if	not(type_of m = z_int_type)
			then	term_fail "basic_decl_modular_type" 508074 [m]
			else	();
		val zname = prefix_trans_id pfx name;
		val z_e_e = z_eq_eq "type";
		val z_f_t = z_simple_free_type "type";
		val z_a = z_ax "type";
		val i_m_t = inst_mt_term zname;
		val mod_attr = zname ^^ zmodulus;
		val val_attr = zname ^^ zval;
		val of_int = zname ^ "_of_int";
		val first_attr = zname ^^ zfst;
		val last_attr = zname ^^ zlst;
		val pos_attr = zname ^^ zpos;
		val succ_attr = zname ^^ zsuc;
		val pred_attr = zname ^^ zpred;
		val para1 = z_e_e(mod_attr, m);
		val range = i_m_t [] gen_mt_range;
		val para2 = z_f_t (zname, val_attr, range);
		val para3 = z_a (of_int,
			i_m_t [] gen_mt_of_int_dec,
			[i_m_t ["of_int"] gen_mt_of_int_pred]);
		val paras4_to_8 = map z_e_e [
			(first_attr, i_m_t [] gen_mt_first_def),
			(last_attr, i_m_t [] gen_mt_last_def),
			(pos_attr, i_m_t [] gen_mt_pos_def),
			(succ_attr, i_m_t [] gen_mt_succ_def),
			(pred_attr, i_m_t [] gen_mt_pred_def)];

		val vcs = modulus_check_vcs name m;
	in	para1::para2::para3::(paras4_to_8 @ vcs);
		fail "basic_decl_modular_type" 508120 []
	end
);
=TEX
\subsection{Translating Real Types}

=TEX
=SML
fun ⦏basic_decl_fixed_type⦎ (env : CN_ENV, pfx : Z_ID list) (name : ID)
	({exp = delta, range = Value r} : EXP FIXED_TYPE_DEF)
	: PARAINFO list = (
	let	val {lo, hi} = dest_range (adjust_range env r);
		val tlo = trans_exp env lo;
		val thi = trans_exp env hi;
		val tdelta = trans_exp env delta;
		val zname = prefix_trans_id pfx name;
		val z_e_e = z_eq_eq "type";
		fun mk_vcs () = real_range_check_vcs name tlo thi;
	in	[ z_e_e(zname, z_rng(tlo, thi)),
		  z_e_e(zname ^^ zdelta, tdelta),
		  z_e_e(zname ^^ zfst, tlo),
		  z_e_e(zname ^^ zlst, thi) ] @ mk_vcs ()
	end
) | basic_decl_fixed_type _ _ _ = fail "basic_decl_fixed_type" 508065 [];
=TEX
=SML
fun ⦏basic_decl_floating_type⦎ (env : CN_ENV, pfx : Z_ID list) (name : ID)
	({exp = digits, range = Value r} : EXP FIXED_TYPE_DEF)
	: PARAINFO list = (
	let	val {lo, hi} = dest_range (adjust_range env r);
		val tlo = trans_exp env lo;
		val thi = trans_exp env hi;
		val tdigits = trans_exp env digits;
		val zname = prefix_trans_id pfx name;
		val z_e_e = z_eq_eq "type";
		fun mk_vcs () = real_range_check_vcs name tlo thi;
	in	[ z_e_e(zname, z_rng(tlo, thi)),
		  z_e_e(zname ^^ zdigits, tdigits),
		  z_e_e(zname ^^ zfst, tlo),
		  z_e_e(zname ^^ zlst, thi) ] @ mk_vcs ()
	end
) | basic_decl_floating_type (env, pfx) name {exp = digits, range = Nil} = (
	let	val tdigits = trans_exp env digits;
		val zname = prefix_trans_id pfx name;
		val tfst = zname ^^ zfst;
		val tlst = zname ^^zlst;
		val trng = z_rng(
			mk_z_gvar(tfst, z_real_type, []),
			mk_z_gvar(tlst, z_real_type, []));
		val z_e_e = z_eq_eq "type";
		val z_a = z_ax "type";
	in	[ z_a(tfst, ℝ_tm, []),
		  z_a(tlst, ℝ_tm, []),
		  z_e_e(zname, trng),
		  z_e_e(zname ^^ zdigits, tdigits)]
	end
);
=TEX

\subsection{Translating Subtypes}
=SML
fun ⦏range_con_attrib⦎ (env : CN_ENV)
	(zid⋎1 : Z_ID, zid⋎2 : Z_ID, {lo : Z_EXP, hi : Z_EXP}) : PARAINFO list = (
let	val z_e_e = z_eq_eq "subtype";
in
	[z_e_e (zid⋎1 ^^ zfst, lo),
	z_e_e (zid⋎1 ^^ zlst, hi),
	z_e_e (zid⋎1 ^^ zsuc, zid env (zid⋎2 ^^ zsuc)),
	z_e_e (zid⋎1 ^^ zpred, zid env (zid⋎2 ^^ zpred)),
	z_e_e (zid⋎1 ^^ zpos, zid env (zid⋎2 ^^ zpos)),
	z_e_e (zid⋎1 ^^ zval, zid env (zid⋎2 ^^ zval))]
end
);
=TEX
=SML
local
val ⦏l_var⦎ : Z_EXP = ⓩ L ⦂ ℤ ⌝;
val ⦏h_var⦎ : Z_EXP = ⓩ H ⦂ ℤ ⌝;
val ⦏gen_mt_subtype_def⦎ : Z_EXP = alphaize ⓩ vVAL ⦇ L .. H ⦈ ⌝;
val ⦏gen_mt_subtype_first_def⦎ : Z_EXP = alphaize ⓩ vVAL (L ⦂ ℤ) ⌝;
val ⦏gen_mt_subtype_last_def⦎ : Z_EXP = alphaize ⓩ vVAL (H ⦂ ℤ) ⌝;
in
fun ⦏modular_subtype_def⦎
	(zid⋎2 : Z_ID, {lo : Z_EXP, hi : Z_EXP}) : Z_EXP = (
	inst_mt_term (trans_id zid⋎2) []
	(subst [(lo, l_var), (hi, h_var)] gen_mt_subtype_def)
);
fun ⦏range_con_attrib_modular⦎
	(env : CN_ENV)
	(zid⋎1 : Z_ID, zid⋎2 : Z_ID,
		{lo : Z_EXP, hi : Z_EXP}) : PARAINFO list = (
let	val z_e_e = z_eq_eq "subtype";
	val first_def = inst_mt_term zid⋎2 []
		(subst[(lo, l_var)] gen_mt_subtype_first_def);
	val last_def = inst_mt_term zid⋎2 []
		(subst[(hi, h_var)] gen_mt_subtype_last_def);
in
	[z_e_e (zid⋎1 ^^ zfst, first_def),
	z_e_e (zid⋎1 ^^ zlst, last_def),
	z_e_e (zid⋎1 ^^ zmodulus, zid env (zid⋎2 ^^ zmodulus)),
	z_e_e (zid⋎1 ^^ zpos, zid env (zid⋎2 ^^ zpos)),
	z_e_e (zid⋎1 ^^ zsuc, zid env (zid⋎2 ^^ zsuc)),
	z_e_e (zid⋎1 ^^ zpred, zid env (zid⋎2 ^^ zpred)),
	z_e_e (zid⋎1 ^^ zval, zid env (zid⋎2 ^^ zval))]
end
);
end;
=TEX
The following function does the processing which is common to cases of
a subtype which gives rise to an axiomatic description rather than an abbreviation definition.
=SML
fun ⦏basic_decl_subtype_axdes⦎ (env : CN_ENV) (zvar : Z_ID) (tmark : TMARK)
	: PARAINFO list = (
	let	val zexp = z_powerset (zid env tmark)
			handle Fail _ =>
			fail "trans_basic_decl" 508051 [fn () => tmark];
		val z_a = z_ax "subtype";
	in	[z_a(zvar, zexp, [])]
	end
);
=TEX
Here and in the Z generator we need to know the names of the recognised attributes:
=SML
val ⦏ada_attributes_list⦎ : ID list = map fst ada_attribute_types;
=TEX
=SML
fun ⦏type_attrs⦎ (unwanted : ID list) (t : ID) : ID list = (
let	val tthy = get_const_theory (bind_gvar_name t);
	val tthyconsts = get_consts tthy;
	val tthyconsts_names = map (fst o dest_const) tthyconsts;
	val transt = trans_id t;
in
	(ada_attributes_list diff unwanted) drop
		(fn attr => not((bind_gvar_name transt ^^ attr) mem tthyconsts_names))
end
handle (Fail _) => [] (* presumably from get_const_theory *)
);
=IGN
type_attrs []"NATURAL";
=TEX
In the following, the two `then' parts in the first case alternative implements
=INLINEFT
Basic_Decl_Range_Con_1
=TEX
\ and
=INLINEFT
Basic_Decl_Range_Con_3
=TEX

\ and the final `else' part and the second case alternative implement
=INLINEFT
Basic_Decl_Range_Con_2
=TEX
.
=SML

fun ⦏basic_decl_subtype_range_con⦎ (env : CN_ENV, pfx : Z_ID list)
	(name : ID) (tmark : TMARK) (range : EXP RANGE) : PARAINFO list = (
	let	val {lo, hi} = dest_range (adjust_range env range);
		val zsubty = prefix_trans_id pfx name;
		val rtmark = real_name env tmark;
		val zsuperty = trans_id rtmark;
		val ztype = type_of(zid env rtmark
			handle Fail _ =>
			fail "trans_basic_decl" 508051 [fn () => tmark]);
		val te_lo = trans_exp1 env lo;
		val te_hi = trans_exp1 env hi;
		val z_e_e = z_eq_eq "subtype";
	in	case (te_lo, te_hi) of
			(Value l, Value h) =>
			if	ztype =: z_int_set_type
			then	let	val vcs = int_range_check_vcs name l h;
				in	z_e_e(zsubty, z_rng(l, h)) ::
					range_con_attrib env
					(zsubty, zsuperty, {lo=l,hi=h}) @ vcs
				end
			else if	ztype =: z_real_set_type
			then	let	val vcs = real_range_check_vcs name l h;
					val unwanted = ["FIRST", "LAST"];
					val tas = type_attrs unwanted rtmark;
					val tas_paras = map
						(fn attr =>
						z_e_e(zsubty ^^ attr,
						 zid env (rtmark ^^ attr))) tas;
				in	z_e_e(zsubty, z_rng(l, h)) ::
					tas_paras @
					[ z_e_e(zsubty ^^ zfst, l),
					  z_e_e(zsubty ^^ zlst, h) ] @ vcs
				end
			else if 	is_modular_type rtmark
			then	let	val vcs = int_range_check_vcs name l h;
				in	z_e_e(zsubty, modular_subtype_def(zsuperty, {lo = l, hi = h})) ::
					range_con_attrib_modular env
					(zsubty, zsuperty, {lo=l,hi=h}) @ vcs
				end
			else	basic_decl_subtype_axdes env zsubty tmark
		|	_ =>	basic_decl_subtype_axdes env zsubty tmark
	end
);
=TEX
=SML
val ⦏basic_decl_subtype_fixed_con⦎ : CN_ENV * Z_ID list -> ID
	-> EXP FIXED_POINT_CONSTRAINT -> PARAINFO list
	= basic_decl_fixed_type;
val ⦏basic_decl_subtype_floating_con⦎ : CN_ENV * Z_ID list -> ID
	-> EXP FLOATING_POINT_CONSTRAINT -> PARAINFO list
	= basic_decl_floating_type;
=TEX
=SML
fun ⦏basic_decl_subtype_index_con⦎ (env : CN_ENV, pfx : Z_ID list)
	(name : ID) (tmark : TMARK) (ci : EXP list) : PARAINFO list = (
let	val zname = prefix_trans_id pfx name;
	val index = map name_to_tmark ci;
	val rindex = map (real_name env) index;
	val domain = z_many_cross(map (zid env) rindex);
	val rtmark = real_name env tmark;
	val set_comp = index_con_set_comp env rtmark domain;
	val z_e_e = z_eq_eq "subtype";
	val abb_def = z_e_e (zname, set_comp);
in	abb_def :: array_attrib env (zname, rindex)
end
);
=TEX
=SML
fun ⦏basic_decl_subtype_disc_con⦎ (env : CN_ENV, pfx : Z_ID list)
	(name : ID) (tmark : TMARK) (disc : EXP list) : PARAINFO list = (
	case env tmark of
		Value{info = EIEnvRecordType {comp_names = comps, num_discs = i}, ...} => (
		if	length disc <> i
		then	fail "basic_decl_subtype_disc_con" 508101
			[fn _ => name, fn _ => string_of_int(length disc),
			 fn _ => string_of_int i]
		else if	length comps < i
		then	fail "basic_decl_subtype_disc_con" 508102
			[fn _ => tmark]
		else	let	val zs_name = prefix_trans_id pfx name;
				val vars = comps to (i - 1);
				val zes = map (trans_exp env) disc;
				fun gen_eq (v, e) = mk_z_eq(mk_var(v, type_of e), e);
				val eqs = map gen_eq (combine vars zes);
				val pred = z_many_and eqs;
				val sch_exp = zid env (trans_id tmark);
			in	[z_constrained_schema(zs_name, sch_exp, pred)]
			end
	) |	_ => (
		fail "basic_decl_subtype_disc_con" 508100
		[fn _ => name, fn _ => tmark]
	)
);
=TEX
=SML
fun ⦏basic_decl_subtype_no_con⦎ (env : CN_ENV, pfx : Z_ID list)
	(name : ID) (tmark : TMARK) : PARAINFO list = (
let	val zname = prefix_trans_id pfx name;
	val rtmark = real_name env tmark;
	val zexp = zid env rtmark;
	val zvar_ty = dest_z_power_type(type_of zexp)
		handle Fail _ => fail "trans_basic_decl" 508051 [fn () => tmark];
	val z_e_e = z_eq_eq "subtype";
	val abb_def = z_e_e (zname, zexp);
	val tas = type_attrs [] rtmark;
	val tas_paras = map (fn attr => z_e_e(zname ^^ attr,
		zid env (rtmark ^^ attr))) tas;
in	
	(abb_def :: tas_paras)
end);
=TEX
\subsection{The Function $trans\_basic\_decl$}
=SML
fun ⦏trans_basic_decl⦎
	(env_pfx : CN_ENV * Z_ID list)
	((BDConstDecl {consts,tm,expr}) : BASIC_DECL)
		: PARAINFO list = (
	basic_decl_const env_pfx {consts=consts, tm=tm, expr=expr}
) | trans_basic_decl env_pfx (BDTypeDecl {name,type_def=TDEnumTypeDef td,...}) = (
	basic_decl_enum env_pfx name td
) | trans_basic_decl env_pfx (BDTypeDecl {name,type_def=TDIntTypeDef range,...}) = (
	basic_decl_int_type env_pfx name range
) | trans_basic_decl env_pfx (BDTypeDecl {name,type_def=TDModularTypeDef modulus,...}) = (
	basic_decl_modular_type env_pfx name modulus
) | trans_basic_decl env_pfx (BDTypeDecl {name,type_def=TDConArrayDef td,...}) = (
	basic_decl_con_array env_pfx name td
) | trans_basic_decl env_pfx (BDTypeDecl {name,type_def=TDUnconArrayDef td,...}) = (
	basic_decl_uncon_array env_pfx name td
) | trans_basic_decl env_pfx (BDTypeDecl {name,type_def=TDRecordTypeDef td,...}) = (
	basic_decl_record env_pfx name td
) | trans_basic_decl env_pfx (BDSubtypeDecl {name,sub_ind={tmark,con=CRange cr},...}) = (
	basic_decl_subtype_range_con env_pfx name tmark cr
) | trans_basic_decl env_pfx (BDSubtypeDecl {name,sub_ind={tmark,con=CIndex ci},...}) = (
	basic_decl_subtype_index_con env_pfx name tmark ci
) | trans_basic_decl env_pfx (BDSubtypeDecl {name,sub_ind={tmark,con=CFixed cf},...}) = (
	basic_decl_subtype_fixed_con env_pfx name cf
) | trans_basic_decl env_pfx (BDSubtypeDecl {name,sub_ind={tmark,con=CFloating cf},...}) = (
	basic_decl_subtype_floating_con env_pfx name cf
) | trans_basic_decl env_pfx (BDSubtypeDecl {name,sub_ind={tmark,con=CDiscriminant cd},...}) = (
	basic_decl_subtype_disc_con env_pfx name tmark cd
) | trans_basic_decl env_pfx (BDSubtypeDecl {name,sub_ind={tmark,con=CNoCon},...}) = (
	basic_decl_subtype_no_con env_pfx name tmark
) | trans_basic_decl env_pfx (BDTypeDecl {name, type_def as TDFixedTypeDef td}) = (
	basic_decl_fixed_type env_pfx name td
) | trans_basic_decl env_pfx (BDTypeDecl {name, type_def as TDFloatingTypeDef td}) = (
	basic_decl_floating_type env_pfx name td
) | trans_basic_decl _ (BDDeferredConstDecl _) = (
	fail "trans_basic_decl" 508039 []
) | trans_basic_decl _ (BDVarDecl _) = (
	fail "trans_basic_decl" 508040 []
) | trans_basic_decl _ (BDVarDeclInit _) = (
	fail "trans_basic_decl" 508040 []
) | trans_basic_decl _ (BDPrivateTypeDecl _) = (
	[]
) | trans_basic_decl _ (BDPragma _) = (
	[]
) | trans_basic_decl _ (BDAnnotation _) = (
	[]
);
=TEX
=SML
fun ⦏trans_basic_decl1⦎
	(env_pfx : CN_ENV * Z_ID list)
	(bd : BASIC_DECL) : PARAINFO list OPT = (
	Value (trans_basic_decl env_pfx bd)
	handle ex as (Fail msg) => (
		if	area_of ex = "z_eq_eq"
		orelse	area_of ex = "z_ax"
		then	raise ex
		else	comment "trans_basic_decl1" 508050 [fn _ => get_message msg];
		Nil
	)
);
=TEX
\section{Support for Multidimensional Arrays}
=SML
fun ⦏array_agg_def⦎ (num : int) : unit = (
if	num >= 2
then
let	val fun_name = z_array_agg num;
in	case get_const_type (bind_gvar_name fun_name) of
		Value _ => ()
	|	Nil =>
	let	fun mk_gvar name = (
			let val ty = mk_z_power_type(mk_z_var_type name);
			in	mk_z_lvar(name, ty, [])
			end
		);
		val ns = map string_of_int (interval 1 num);
		val g_ns = map (mk_gvar o (fn n => "g" ^ n)) ns;
		val g = mk_gvar "g";
		val prod = z_many_cross g_ns;
		val uncurried_tm = z_tfun(prod, g);
		fun mk_curried_tm [] = g
		|   mk_curried_tm (g_n::more) = z_tfun(g_n, mk_curried_tm more);
		val curried_tm = mk_curried_tm g_ns;
		val sig_tm = z_tfun(curried_tm, uncurried_tm);
		val sig_ty = dest_z_power_type (type_of sig_tm);
		val fun_var = mk_z_lvar(fun_name, sig_ty, []);
		val sig_decl = mk_z_decl[mk_z_dec([fun_var], sig_tm)];
		val f = mk_z_lvar("f", dest_z_power_type(type_of curried_tm), []);
		fun mk_x_n (v, n) = (
			mk_z_lvar("x" ^ n, dest_z_power_type (type_of v), [])
		);
		val x_ns = map mk_x_n (combine g_ns ns);
		val tuple = mk_z_tuple x_ns;
		val lhs = mk_z_app(mk_z_app(fun_var, f), tuple);
		fun mk_rhs t [] = t
		|   mk_rhs t (x_n::more) = mk_rhs (mk_z_app(t, x_n)) more;
		val rhs = mk_rhs f x_ns;
		val eqn = mk_z_eq(lhs, rhs);
		fun dec_of_var (v, e) = mk_z_dec([v], e);
		val x_decs = map dec_of_var (combine x_ns g_ns);
		val pred = mk_z_∀(mk_z_decl(dec_of_var(f, curried_tm)::x_decs), mk_t, eqn);
		val idtys = [dest_var fun_var];
	in	update_theory_db_with_parainfo
		(AxDesInfo(map (fst o dest_var) (g_ns @ [g]), sig_decl, Value pred, idtys))
	end
end
else fail "array_agg_def" 508059 []
);
=TEX
\section{Domain Conditions}
=TEX
=SML
fun ⦏strip_z_app⦎ (ze : Z_EXP) : Z_EXP * Z_EXP list = (
	let	fun aux t acc = (
			let	val (f, a) = dest_z_app t;
			in	aux f (a::acc)
			end	handle Fail _ => (t, acc)
		);
	in	aux ze []
	end
);
=TEX
It is pleasant to make the function to calculate domain conditions largely table driven.
In fact, we use a table to handle Z applications, and the hard-wired logic
is just for things like sequence displays.
The table is a table of functions indexed by the name of the constant found
at the head of a stripped Z application.
The functions in the table are passed the function to calculate the
domain conditions for sub-expressions together with the stripped application.
The function is intended to combine the domain conditions for the sub-expressions
appropriately and to add in the domain conditions for the stripped application if
any.
=SML
type DOMAIN_COND_TABLE = ((Z_EXP -> Z_PRED list) -> (Z_EXP * Z_EXP list) -> Z_PRED list) E_DICT;
fun ⦏domain_conds_aux⦎
	(tab : DOMAIN_COND_TABLE)
	(env : CN_ENV)
	(ze : Z_EXP) : Z_PRED list = (
	let	val recur = domain_conds_aux tab env;
		fun list_recur zes = (
			list_term_union (map recur zes)
		);
		fun dom_aux has_xi acc ze = (
			let	val (f, x) = dest_z_app ze;
				val dcs =
					if has_xi andalso not (is_z_app f)
					then recur x
					else recur x term_grab z_mem(x, z_dom f);
			in	dom_aux has_xi (dcs term_union acc) f
			end	handle Fail _ => acc
		);
		fun is_type tn = (
			case env tn of
				Value{info = EIEnvOtherType, ...} => true
			|	_ => false
		);
		fun is_succ_pred n = (
			case rev(explode n) of
				"C"::"C"::"U"::"S"::"v"::more =>
					is_type (implode(rev more))
			|	"D"::"E"::"R"::"P"::"v"::more =>
					is_type (implode(rev more))
			|	_ => false
		);
	in	case dest_z_term ze of
		ZSetd(_, zes) => list_recur zes
	|	Z⟨⟩(_, zes) => list_recur zes
	|	ZTuple zes => list_recur zes
	|	ZBinding zes => list_recur (map snd zes)
	|	Z× zes => list_recur zes
	|	ZSel⋎s (ze, _) => recur ze
	|	ZApp _ => (
		let	val fargs as (f, args) = strip_z_app ze;
		in	let	val (n, _, _) = dest_z_gvar f;
			in	case e_lookup n tab of
					Value func => ( func recur fargs
					handle Fail _ =>
					term_fail "domain_conds" 508070 [ze]
				) |	Nil => (
					case #info(force_value (env n)) of
						EIEnvFunction {deps = [],...} => dom_aux false [] ze
					|	EIEnvFunction _ => dom_aux true [] ze
					|	EIEnvVar _ => dom_aux false [] ze
					|	EIEnvConstant _ => dom_aux false [] ze
					|	EIEnvOther => (
							if	is_succ_pred n
							then	dom_aux false [] ze
							else	list_recur args
					) |	_ => []
				)
			end	handle Fail _ =>
			let	val (n, _, _) = dest_z_lvar f;
			in	case #info(force_value (env n)) of
					EIEnvVar _ => dom_aux false [] ze
				|	_ => []
			end
		end handle Fail _ => []
	) |	_ => []
	end
);
=TEX
=SML
val ⦏cn_no_domain_conds⦎ : int = 0;
val ⦏cn_standard_domain_conds⦎ : int = 1;
val ⦏cn_all_domain_conds⦎ : int = 2;
val ⦏cn_domain_conds_control⦎ : int ref = ref cn_no_domain_conds;
val _ = new_int_control{
	name="cn_domain_conds",
	control=cn_domain_conds_control,
	default = (fn () => cn_no_domain_conds),
	check = (fn x => x mem [
		cn_no_domain_conds,
		cn_standard_domain_conds,
		cn_all_domain_conds
	])} handle (Fail _) => () (* for syntax/type checking in development *);
=TEX
=SML
fun ⦏get_domain_conds_control⦎ (():unit) : int = !cn_domain_conds_control;
=TEX
=SML
fun ⦏dc_operands_only⦎
	(dc : Z_EXP -> Z_PRED list)
	((_, args) : Z_EXP * Z_EXP list) : Z_PRED list = (
	list_term_union (map dc args)
);
=TEX
We now give the domain condition functions for the specific expressions
such as integer division etc.
These handle ``impossible'' combinations of
operators and operands by raising an exception.
To simplify the
coding, the exception is caught by the caller, which is in a better
position to include the invalid term in the error message.
In fact, these exceptions can be provoked by extremely malicious use of auxiliary
expressions, but that's acceptable, since a program containing
auxiliary expressions cannot be compiled.

E.g., in the following, the operator will be one of the operators {\it and\_then}
or {\it or\_else}, so
there must be exactly one operand which must be a pair (i.e., a 2-tuple).
The handler and the second clause of the function definition therefore
correspond to impossible conditions.
=SML
fun ⦏dc_and_then_or_else⦎
	(true_or_false : Z_EXP)
	(dc : Z_EXP -> Z_PRED list)
	((_, [arg]) : Z_EXP * Z_EXP list) : Z_PRED list = (
	let	val lhs_rhs = dest_z_tuple arg;
		val lhs = hd lhs_rhs;
		val rhs = hd(tl lhs_rhs);
		val lhs_dcs = dc lhs;
		val rhs_dcs = dc rhs;
		val cond = mk_eq(lhs, true_or_false);
		val cond_⇒_rhs_dcs = map (curry mk_⇒ cond) rhs_dcs;
	in	lhs_dcs term_union cond_⇒_rhs_dcs
	end	handle Fail _ => fail "domain_conds" 508070 []
) | dc_and_then_or_else _ _ fargs = fail "domain_conds" 508070 [];
=TEX
=SML
val ⦏z_int_zero⦎ : Z_EXP = z_num(trans_int "0");
fun ⦏dc_non_zero_int_rhs⦎
	(dc : Z_EXP -> Z_PRED list)
	((_, [arg]) : Z_EXP * Z_EXP list)  : Z_PRED list = (
	let	val rhs = hd(tl (dest_z_tuple arg));
	in	dc arg term_grab z_noteq(rhs, z_int_zero)
	end	handle Fail _ => fail "domain_conds" 508070 []
) | dc_non_zero_int_rhs _ fargs = fail "domain_conds" 508070 [];
=TEX

=SML
fun ⦏dc_int_expon⦎
	(dc : Z_EXP -> Z_PRED list)
	((_, [arg]) : Z_EXP * Z_EXP list) : Z_PRED list = (
	let	val rhs = hd(tl (dest_z_tuple arg));
	in	dc arg term_grab z_less_eq(z_int_zero, rhs)
	end	handle Fail _ => fail "domain_conds" 508070 []
) | dc_int_expon _ _ = fail "domain_conds" 508070 [];
=TEX
=SML
val ⦏z_real_zero⦎ = ⓩ0.0⌝;
fun ⦏dc_non_zero_real_rhs⦎
	(dc : Z_EXP -> Z_PRED list)
	((_, [arg]) : Z_EXP * Z_EXP list) : Z_PRED list = (
	if	!cn_domain_conds_control = cn_all_domain_conds
	then	let	val rhs = hd(tl (dest_z_tuple arg));
		in	dc arg term_grab z_noteq(rhs, z_real_zero)
		end	handle Fail _ => fail "domain_conds" 508070 []
	else	[]
) | dc_non_zero_real_rhs _ _ = fail "domain_conds" 508070 [];
=TEX
=SML
fun ⦏dc_real_expon⦎
	(dc : Z_EXP -> Z_PRED list)
	((_, [arg]) : Z_EXP * Z_EXP list) : Z_PRED list = (
	if	!cn_domain_conds_control = cn_all_domain_conds
	then	let	val lhs_rhs = dest_z_tuple arg;
			val lhs = hd lhs_rhs;
			val rhs = hd(tl lhs_rhs);
			val disj1 = z_noteq(lhs, z_real_zero);
			val disj2 = z_less_eq(z_int_zero, rhs);
		in	dc arg term_grab mk_∨(disj1, disj2)
		end	handle Fail _ => fail "domain_conds" 508070 []
	else	[]
) | dc_real_expon _ _ = fail "domain_conds" 508070 [];
=TEX
The table below is build in three sections: (i) operators that just need
the domain conditions for the operands to be calculated and united;
(ii) the three integer operators that require non-zero right-hand operands
(iii) other operators that need individual attention, viz.,
integer exponentiation, real division, real exponentiation,
AND THEN and OR ELSE.
=SML
val ⦏domain_cond_table⦎ : DOMAIN_COND_TABLE = list_e_merge initial_e_dict
	(map (fn (ztm, f) => let val (n, _, _) = dest_z_gvar ztm; in (n, f) end)
(map (fn t => (t, dc_operands_only))
[	z_unary_minus, z_abs,
	z_real_unary_minus, z_real_abs,
	z_bool_not, z_array_not, z_mod_not,
	z_bool_and, z_bool_or, z_bool_xor,
	z_bool_eq, z_bool_noteq,
	z_bool_less, z_bool_less_eq,
	z_bool_greater, z_bool_greater_eq,
	z_add, z_minus, z_times,
	z_array_and, z_array_or, z_array_xor,
	z_mod_and, z_mod_or, z_mod_xor,
	z_array_less, z_array_less_eq,
	z_array_greater, z_array_greater_eq,
	z_array_array_cat, z_array_elem_cat, z_elem_array_cat,
	z_real_add, z_real_minus, z_real_times,
	z_bool_real_less, z_bool_real_less_eq,
	z_bool_real_greater, z_bool_real_greater_eq	] @
map (fn t => (t, dc_non_zero_int_rhs))
[	z_intdiv, z_mod, z_rem	] @
[	(z_expon, dc_int_expon),
	(z_real_div, dc_non_zero_real_rhs),
	(z_real_expon, dc_real_expon),
	(z_bool_and_then, dc_and_then_or_else ⓩTRUE⌝),
	(z_bool_or_else, dc_and_then_or_else ⓩFALSE⌝	)	]	));
=TEX
=SML
val ⦏domain_conds⦎ : CN_ENV -> Z_EXP -> Z_PRED list = (fn env =>
	let	val dc = domain_conds_aux domain_cond_table env;
	in	fn ze =>
		if	!cn_domain_conds_control = cn_no_domain_conds
		then	[]
		else	dc ze
	end
);
=IGN
val dc = CNBasicDeclsAndExprs.domain_conds env;
set_int_control("cn_domain_conds", cn_standard_domain_conds);
dcⓩF 1⌝;
dcⓩF 1 (CON_REC.A)⌝;
dcⓩINDEXvSUCC 1⌝;
dcⓩINDEXvPRED 1⌝;
dcⓩINDEXvPREd 1⌝;
dcⓩ(1 intdiv 2)⌝;
dcⓩINDEXvPRED (1 intdiv 2)⌝;
dcⓩ (1 e 0 /⋎R 2 e 0)⌝;
set_int_control("cn_domain_conds", cn_all_domain_conds);
dcⓩ (1 e 0 /⋎R 2 e 0)⌝;
dcⓩx ^⋎Z y⌝;
dcⓩt ⊕ {x ↦ 1 intmod 2, y ↦ 2 rem 3}⌝;
dcⓩx greater 0 and_then y intmod x eq 0⌝;
dcⓩx less_eq 0 or_else y intmod x eq 0⌝;
dcⓩ1 e 0 /⋎R x real_less_eq 0 e 0 or_else y /⋎R x real_greater 10 e 0⌝;
=TEX
\section{ADJUSTING DECLARATIONS}
\subsection{Basic Declarations}
=SML
val ⦏universal_discrete_type⦎ : TMARK = "universal_discrete";
=SML
val ⦏gen_id_counters⦎ : int S_DICT ref = ref initial_s_dict;
val ⦏reset_gen_id_counters⦎ : unit -> unit = (fn () => gen_id_counters := initial_s_dict);
val ⦏generate_id_from_tmark⦎ : CN_ENV * Z_ID list -> TMARK -> TMARK = (
	fn	(_ , pfx) =>
	fn	tmark =>
	let	fun aux i = (
			let	val simple_name = tmark ^ "s" ^ string_of_int i;
				val name = prefix_trans_id pfx simple_name;
			in let	val (zname, _) = dest_const(mk_z_gvar(name, BOOL, []));
			in	get_const_theory zname;
				aux (i+1)
			end	handle Fail _ => (i, simple_name)
			end
		);
		val start = (
			case s_lookup tmark (!gen_id_counters) of
				Value j => j + 1
			|	Nil => 1);
		val (newi, res) = aux start;
	in	gen_id_counters := s_enter tmark newi (!gen_id_counters);
		res
	end
);
=TEX
=SML
fun ⦏generate_id⦎ (env_pfx : CN_ENV * Z_ID list)
	: CONSTRAINT SUB_IND -> TMARK = (
	generate_id_from_tmark env_pfx o #tmark
);
=TEX
=SML
fun ⦏si_generate_id⦎ (env_pfx : CN_ENV * Z_ID list)
	: SI_SUB_IND -> TMARK = (
	generate_id_from_tmark env_pfx o #tmark
);
=TEX
=SML
fun ⦏adjust_subtype⦎ (env_pfx : CN_ENV * Z_ID list)
	(si as {tmark, con} : CONSTRAINT SUB_IND) : BASIC_DECL list * TMARK = (
	case con of
		CNoCon => ([], tmark)
	|	_ => (
		let	val name = generate_id env_pfx si;
		in	([BDSubtypeDecl {
				name = name,
				sub_ind = si}], name)
		end
	)
);
=TEX
=SML
fun ⦏adjust_si_discrete_range⦎ (env_pfx : CN_ENV * Z_ID list)
	(s : SI_DISCRETE_RANGE) : BASIC_DECL list * TMARK = (
	case s of
		SIDiscreteRangeSubInd si => adjust_subtype env_pfx si
	|	SIDiscreteRangeRange r =>
		adjust_subtype env_pfx {
			tmark = universal_discrete_type,
			con = CRange r
		}
);
=TEX
In the following, it is caller's responsibility to have resolved any ambiguity
about the form of the constraint as produced by the context-free parser.
=SML
fun ⦏adjust_constraint⦎
	(env_pfx : CN_ENV * Z_ID list)
	(si_con : SI_CONSTRAINT) : BASIC_DECL list * CONSTRAINT = (
	case si_con of
		SIIndexCon sdr => (
			let	val (nds, nts) = split(map (adjust_si_discrete_range env_pfx) sdr);
				val newexps = map EId nts;
				val newdecl = flat nds;
			in	(newdecl, CIndex newexps)
			end
		)
	|	SIDiscriminantCon c => ([], CDiscriminant c)
	|	SIRangeCon c => ([], CRange c)
	|	SIFixedCon c => ([], CFixed c)
	|	SIFloatingCon c => ([], CFloating c)
	|	SINoCon => ([], CNoCon)
);
=TEX
The following function resolves the ambiguity in context-free parsing
between discriminant constraints and index constraints.
The parser maps either form onto a discriminant constraint with a single
expression, which will be an aggregate if the constraint comprised
a positional or named discriminant assocation of an index constraint
with more than one range.

=SML
fun ⦏resolve_constraint⦎ (env : CN_ENV) (tmark : TMARK)
	(c as SIDiscriminantCon[e] : SI_CONSTRAINT) : SI_CONSTRAINT = (
	case env tmark of
		Value{info = EIEnvRecordType {comp_names, num_discs}, ...}=> (
			case e of
				EArrayAggPos{comps,...} => (
					SIDiscriminantCon comps
			) |	EArrayAggNamed{named_assocs, ...} => (
				let	val names = comp_names to (num_discs-1);
					val discs = named_assocs_to_exps
							(map (fn n => (n, Nil)) names)
							 named_assocs;
				in	SIDiscriminantCon discs
				end
			) |	_ => c
	) |	_ => (
			case e of
				EArrayAggPos{comps,...} => (
					SIIndexCon (map exp_to_discrete_range comps)
			) |	_ => SIIndexCon [exp_to_discrete_range e]
	)
) | resolve_constraint _ _ c = c;
=TEX
Here and in the remaining adjusters, we must be careful to work
from left to right (with respect to the Ada concrete syntax), since that should
give a more intuitive sequence of generated names in the Z document.
=SML
fun ⦏adjust_general_subtype⦎ (env_pfx as (env, _) : CN_ENV * Z_ID list)
	(si as {tmark, con = con1} : SI_SUB_IND) : BASIC_DECL list * TMARK = (
	case con1 of
		SINoCon => ([], tmark)
	|	_ => (
		let	val con = resolve_constraint env tmark con1;
			val (newdecl', con') = adjust_constraint env_pfx con;
			val si' = {tmark = tmark, con = con'};
			val name = generate_id env_pfx si';
		in	(newdecl' @ [BDSubtypeDecl{name = name, sub_ind = si'}], name)
		end
	)
);
=TEX
=SML
fun ⦏adjust_const_decl⦎ (env_pfx : CN_ENV * Z_ID list)
	({consts, t, expr} : SI_CONST_DECL) : BASIC_DECL list = (
	case t of
		Nil => [BDConstDecl {consts = consts, tm = Nil, expr = expr}]
	|	Value si => (
		let	val (newdecl', name) = adjust_general_subtype env_pfx si;
			val expr' = EQualifiedExp{tmark = name, exp = expr};
		in	newdecl' @ [BDConstDecl {consts = consts, tm = Value name, expr = expr'}]
		end
	)
);
=TEX
The functions {\it adjust\_elementary\_type} and
{\it adjust\_elementary\_type\_decl} of the specification are implemented
implicitly in {\it adjust\_basic\_decl}.
=SML
fun ⦏adjust_uncon_array_type_decl⦎ (env_pfx : CN_ENV * Z_ID list)
	(name : ID, {index, comp} : SI_ARRAY_DEF) : BASIC_DECL list = (
	let	fun get_type_mark (dr : SI_DISCRETE_RANGE) : TMARK = (
			case dr of
				SIDiscreteRangeSubInd{tmark, con} => tmark
			|	_ => fail "adjust_uncon_array_type_decl" 508080 []
		);
		val (newdecl', name') = adjust_general_subtype env_pfx comp;
		val def' = TDUnconArrayDef{index = map get_type_mark index, comp = name'};
	in	newdecl' @ [BDTypeDecl {name = name, type_def = def'}]
	end
);
=TEX
=SML
fun ⦏adjust_con_array_type_decl⦎ (env_pfx : CN_ENV * Z_ID list)
	(name : ID, {index, comp} : SI_ARRAY_DEF) : BASIC_DECL list = (
	let	val (bds, index') = split(map (adjust_si_discrete_range env_pfx) index);
		val (newdecl', name') = adjust_general_subtype env_pfx comp;
		val def' = TDConArrayDef{index = index', comp = name'};
	in	flat bds @ newdecl' @ [BDTypeDecl {name = name, type_def = def'}]
	end
);
=TEX
=SML
fun ⦏adjust_comp_decl⦎ (env_pfx as (env, _) : CN_ENV * Z_ID list)
	(disc : DISCRIMINANT_SPECIFICATION list)
	({vars, t as {tmark, con}} : SI_VAR_DECL)
			: BASIC_DECL list * EXP COMP_DECL = (
	let	fun is_dep_exp [] _  = false
		|   is_dep_exp ({vars, tmark}::more) (e as (EId id)) = (
			id mem vars orelse is_dep_exp more e
		) | is_dep_exp _ _ = false;
		fun is_dep_range (SIDiscreteRangeRange(RRange {lo, hi})) = (
			is_dep_exp disc lo orelse is_dep_exp disc hi
		) | is_dep_range (SIDiscreteRangeSubInd{
			con = CRange (RRange{lo, hi}), ...}) = (
				is_dep_exp disc lo orelse is_dep_exp disc hi
		) | is_dep_range _ = false;
		fun default () = (
			let	val (ds, name) = adjust_general_subtype env_pfx t;
			in	(ds, ({vars = vars, tmark = name}, CCNoCon))
			end
		);
		fun adjust_range (SIDiscreteRangeRange rng) = (
			EDiscreteRange(DRRange rng)
		) | adjust_range (SIDiscreteRangeSubInd{
			con = CRange rng, ...}) = (
			EDiscreteRange(DRRange rng)
		) | adjust_range (SIDiscreteRangeSubInd{
			con = CNoCon, tmark}) = (
			EId tmark
		) | adjust_range _ = fail "adjust_comp_decl" 508105 [fn _ => hd vars];
	in	case resolve_constraint env tmark con of
			SIIndexCon ranges => (
			if	any ranges is_dep_range
				then	([],
					({vars = vars, tmark = tmark},
					 CCIndexCon(map adjust_range ranges)))
			else	default()
		) |	SIDiscriminantCon exps => (
			if	any exps (is_dep_exp disc)
			then	([],
				({vars = vars, tmark = tmark},
				 CCDiscCon exps))
			else default()
		) |	_ => default()
	end
);
=TEX
=SML
fun ⦏adjust_record_type_decl⦎  (env_pfx : CN_ENV * Z_ID list)
	(name : ID, {decl, disc} : SI_RECORD_TYPE_DEF) : BASIC_DECL list = (
	let	val (bds, decl') = split(map (adjust_comp_decl env_pfx disc) decl);
		val def' = TDRecordTypeDef{decl = decl', disc = disc};
	in	flat bds @ [BDTypeDecl {name = name, type_def = def'}]
	end
);
=TEX
=SML
fun ⦏adjust_subtype_decl⦎ (env_pfx as (env, _): CN_ENV * Z_ID list)
	(name : ID, {tmark, con = con1} : SI_SUB_IND) : BASIC_DECL list = (
	let	val con = resolve_constraint env tmark con1;
		val (newdecl', con') = adjust_constraint env_pfx con;
		val si' = {tmark = tmark, con = con'};
	in	newdecl' @ [BDSubtypeDecl {name = name, sub_ind = si'}]
	end
);
=TEX
=SML
fun ⦏adjust_basic_decl⦎  (env_pfx : CN_ENV * Z_ID list)
	(bd : SI_BASIC_DECL) : BASIC_DECL list = (
	case bd of
		SIConstDecl x =>
			adjust_const_decl env_pfx x
	|	SIDeferredConstDecl x =>
			[BDDeferredConstDecl x]
	|	SITypeDecl {name, type_def = SIUnconArrayDef x} =>
			adjust_uncon_array_type_decl env_pfx (name, x)
	|	SITypeDecl {name, type_def = SIConArrayDef x} =>
			adjust_con_array_type_decl env_pfx (name, x)
	|	SITypeDecl {name, type_def = SIRecordTypeDef x} =>
			adjust_record_type_decl env_pfx (name, x)
	|	SITypeDecl {name, type_def = SIEnumTypeDef x} =>
			[BDTypeDecl {name = name, type_def = TDEnumTypeDef x}]
	|	SITypeDecl {name, type_def = SIIntTypeDef x} =>
			[BDTypeDecl {name = name, type_def = TDIntTypeDef x}]
	|	SITypeDecl {name, type_def = SIModularTypeDef x} =>
			[BDTypeDecl {name = name, type_def = TDModularTypeDef x}]
	|	SITypeDecl {name, type_def = SIFixedTypeDef x} =>
			[BDTypeDecl {name = name, type_def = TDFixedTypeDef x}]
	|	SITypeDecl {name, type_def = SIFloatingTypeDef x} =>
			[BDTypeDecl {name = name, type_def = TDFloatingTypeDef x}]
	|	SITypeDecl {name, type_def = SIDerivedTypeDef x} =>
			adjust_subtype_decl env_pfx (name, x)
	|	SIVarDecl _ => []
	|	SIVarDeclInit _ => []
	|	SISubtypeDecl {name, type_def} =>
			adjust_subtype_decl env_pfx (name, type_def)
	|	SIPrivateTypeDecl ptd => [BDPrivateTypeDecl ptd]
	|	SIPragma _ => []
	|	SIAnnotation _ => []
);
=TEX
\subsection{Variable Declarations}
The three schemas of the specification (two cases plus a schema to combine them) all
merge into one here:
=SML
fun ⦏adjust_var_decl⦎ (env_pfx : CN_ENV * Z_ID list)
	 ({vars, t as {tmark, con}} : SI_VAR_DECL) : SI_BASIC_DECL list * VAR_DECL = (
	case con of
		SINoCon => ([], {vars = vars, tmark = tmark})
	|	_ => (
		let	val name = si_generate_id env_pfx t;
			val basic_decl = SISubtypeDecl{name = name, type_def = t};
		in	([basic_decl], {vars = vars, tmark = name})
		end
	)
);
=TEX
\subsection{External Interfaces}
=SML
fun ⦏adjust_var_decls⦎ (env_pfx : CN_ENV * Z_ID list)
	(vds : SI_VAR_DECL list)
	: BASIC_DECL list * VAR_DECL list = (
	reset_gen_id_counters();
	((flat o map (adjust_basic_decl env_pfx) o flat) ** Combinators.I)
		(split(map (adjust_var_decl env_pfx) vds))
);
=TEX
=SML
fun ⦏adjust_basic_decls⦎ (env_pfx : CN_ENV * Z_ID list)
	(bds : SI_BASIC_DECL list) : BASIC_DECL list = (
	reset_gen_id_counters();
	let	fun aux (SIVarDecl vd) = (
			let	val (bds, vd') = adjust_var_decl env_pfx vd;
			in	flat (map (adjust_basic_decl env_pfx) bds) @
					[BDVarDecl vd']
			end
		) | aux (SIVarDeclInit (vd, e)) = (
			let	val (bds, vd' as {tmark, ...}) = adjust_var_decl env_pfx vd;
				val e' = EQualifiedExp{tmark = tmark, exp = e};
			in	flat (map (adjust_basic_decl env_pfx) bds)
					@ [BDVarDeclInit (vd', e')]
			end
		) | aux d = (
			adjust_basic_decl env_pfx d
		);
	in	flat (map aux bds)
	end
);
=TEX
\section{EPILOGUE}

=SML
end (* structure CNBasicDeclsAndExprs *);
=TEX

\small
\twocolumn[\section{INDEX}]
\printindex
\end{document}
=IGN
********************************************************************************
dtd047.doc: this file is part of the PPZed system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  dtd047.doc  ℤ $Date: 2008/02/15 11:54:36 $ $Revision: 1.36 $ $RCSfile: dtd047.doc,v $

doctex dtd047 ; texdvi dtd047
bibtex dtd047

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

\def\Title{Detailed Design for Z Types and Terms}

\def\AbstractText{}

\def\Reference{DS/FMU/IED/DTD047}

\def\Author{G.T. Scullard}


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
%% LaTeX2e port: %  dtd047.doc  ℤ $Date: 2008/02/15 11:54:36 $ $Revision: 1.36 $ $RCSfile: dtd047.doc,v $
%% LaTeX2e port: \documentstyle[hol1,11pt,TQ]{article}
%% LaTeX2e port: \ftlinepenalty=9999
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{FST Project}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Detailed Design for Z Types and Terms}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Detailed Design for Z Types and Terms}
%% LaTeX2e port: \TPPref{DS/FMU/IED/DTD047}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.36 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2008/02/15 11:54:36 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{G.T.Scullard & MAN05}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.B.Jones & Project Manager}
%% LaTeX2e port: \TPPabstract{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	    Library
%% LaTeX2e port: }}
%% LaTeX2e port: \begin{document}
%% LaTeX2e port: \makeTPPfrontpage
%% LaTeX2e port: \vfill
%% LaTeX2e port: \begin{center}
%% LaTeX2e port: \bf Copyright \copyright\ : Lemma 1 Ltd. \number\year
%% LaTeX2e port: \end{center}

\begin{document}

\headsep=0mm
\FrontPage
\headsep=10mm

\setcounter{section}{-1}
\pagebreak
\section{Document Control}
\subsection{Contents List}
\tableofcontents
\subsection{Document Cross References}
\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes History}
\begin{description}
\item [Issue 1.10 (1992/03/03) ]
First draft version.

\item [Issue 1.11 (1992/06/17) to 1.17 (1992/07/17)]
	Add function $basic\_dest\_z\_term$ and type $BDZ$. {}
	Improve error message numbers and texts.
	Expand details of datatype $Z\_TERM$ with
		explanations of the constructors.
	Changed the interface to dest\_z\_name.
\item [Issue 1.18 (1992/07/20) (July 16th 1992)]
Added support for schema renaming.
\item [Issue 1.19 (1992/07/29) (\FormatDate{92/07/29})]
	Added support for binding display.
\item [Issue 1.20 (1992/11/03)~(\FormatDate{92/11/03
})]
	Removed references to ZED002 in reference material and adjusted form of descriptions of definitions.
\item [Issue 1.22 (1992/11/11)]
	Added treatment of $U$ and binding of global variables.
\item[Issue 1.23 (1992/12/10)  (10th December 1992)]
Global rename from wrk038.doc issue 1.9.
\item[Issue 1.24 (1996/02/15)] proper error-checking in $mk\_z\_app$
\item[Issue 1.25 (1997/04/23)] added notes concerning $dest\_z\_term1$ and $is\_z\_term$.
\item[Issue 1.26 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.27 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.28 (2004/01/19)] The Z universal set is now called 𝕌.
\item[Issue 1.29 (2005/09/06)] Added let-expressions.
\item[Issue 1.30 (2005/09/08)] Type constructors for given sets are now in Z namespace.
\item[Issue 1.31 (2006/01/25)] The name of the decoration operator is now based on the stem {\em decor} throughout, rather than {\em decor} in some places and {\em dec} in others.
\item[Issue 1.32 (2006/04/20)] Added support for floating point literals
\item[Issue 1.33 (2006/04/28)] Removed spurious ``SEE ALSO''.
\item[Issue 1.34 (2006/10/18)] Corrected typo.
\item[Issue 1.35 (2007/08/03)] Extra support for dollar-quoted identifiers.
\item[Issue 1.36 (2008/02/15)] Added discriminator function for dollar-quoted identifiers.
\item[Issue 1.37 (2010/04/01)] Support for empty schemas.  Added $dest\_z\_name1$ and $dest\_z\_name2$.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported PPZed to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
%\subsection{Changes Forecast}
\section{GENERAL}
\subsection{Scope}
This document contains a detailed design of the constructor, discriminator and destructor functions corresponding to the primitive constructors of Z.
The formal specification of these is found in \cite{DS/FMU/IED/ZED002} and \cite{DS/FMU/IED/ZED003}.
\subsection{Introduction}
\subsubsection{Purpose and Background}
This document gives a detailed design, in the form of signatures and informal descriptions,  of the functions mentioned above.
Some additional functions, e.g. those of sections \ref{U} and \ref{BINDING}, which are used in other parts of the Z system, are also be included here for convenience.
\subsubsection{Dependencies}
The functions in this document are dependent on the Release 1 HOL System.
\subsubsection{Deficiencies}
\section{ERROR REPORTING}
For performance reasons, the arguments of the various constructors below are not checked for well-formedness or suitability and
it will therefore be possible, indeed easy, to construct terms which are not legal in our extended Z syntax.
Such terms will be identified by the pretty
printer~\cite{DS/FMU/IED/DTD064} and will normally, though not
necessarily, be errors.
Of course, where the term construction fails due to some error detected in the underlying HOL or ML, it is intecepted and reported as helpfully as possible.
\section{INFIX DIRECTIVES}
A Standard ML $infix$ command must be given at the `top level'.
Thus we give the commands here for those functions declared in the following signatures.
=SML
=TEX
\section{SIGNATURE}
=DOC
signature ⦏ZTypesAndTerms⦎ = sig
=DESCRIBE
The Z Abstract Machine functions are packaged into this signature.
=ENDDOC
\section{DATATYPE FOR Z TYPES}
=DOC
datatype	⦏Z_TYPE⦎ = 	⦏ZGivenType⦎ of string
		|		⦏ZVarType⦎ of string
		|		⦏ZPowerType⦎ of TYPE
		|		⦏ZTupleType⦎ of TYPE list
		|		⦏ZSchemaType⦎ of (string * TYPE) list;
=DESCRIBE
This datatype is a representation of the abstract syntax of Z types.
It is used by the generalised mapping functions $mk\_z\_TYPE$, $is\_z\_type$ and $dest\_z\_type$ (q.v.).
The operand of {\em ZGivenType} is the HOL name of the type.
=ENDDOC
\section{DATATYPE FOR Z TERMS}
\ftlinepenalty=0
=DOC
datatype	⦏Z_TERM⦎ =
	  ⦏ZDec⦎ of TERM list * TERM		| ⦏ZSchemaDec⦎ of TERM * string
	| ⦏ZDecl⦎ of TERM list
	| ⦏ZEq⦎ of TERM * TERM			| ⦏Z∈⦎ of TERM * TERM
	| ⦏ZTrue⦎					| ⦏ZFalse⦎
	| ⦏Z¬⦎ of TERM				| ⦏Z¬⋎s⦎ of TERM
	| ⦏Z∧⦎ of TERM * TERM			| ⦏Z∧⋎s⦎ of TERM * TERM
	| ⦏Z∨⦎ of TERM * TERM			| ⦏Z∨⋎s⦎ of TERM * TERM
	| ⦏Z⇒⦎ of TERM * TERM			| ⦏Z⇒⋎s⦎ of TERM * TERM
	| ⦏Z⇔⦎ of TERM * TERM			| ⦏Z⇔⋎s⦎ of TERM * TERM
	| ⦏Z∃⦎ of TERM * TERM * TERM		| ⦏Z∃⋎s⦎ of TERM * TERM * TERM
	| ⦏Z∃⋎1⦎ of TERM * TERM * TERM		| ⦏Z∃⋎1⋎s⦎ of TERM * TERM * TERM
	| ⦏Z∀⦎ of TERM * TERM * TERM		| ⦏Z∀⋎s⦎ of TERM * TERM * TERM
	| ⦏ZSchemaPred⦎ of TERM * string
	| ⦏ZLVar⦎ of string * TYPE * TERM list	| ⦏ZGVar⦎ of string * TYPE * TERM list
	| ⦏ZInt⦎ of string				| ⦏ZString⦎ of string
	| ⦏ZFloat⦎ of TERM * TERM * TERM	| ⦏Z⟨⟩⦎ of TYPE * TERM list
	| ⦏ZSetd⦎ of TYPE * TERM list		| ⦏ZSeta⦎ of TERM * TERM * TERM
	| ⦏Zℙ⦎ of TERM
	| ⦏ZTuple⦎ of TERM list
	| ⦏ZBinding⦎ of (string * TERM) list
	| ⦏Z×⦎ of TERM list
	| ⦏Zθ⦎ of TERM * string
	| ⦏ZSel⋎s⦎ of TERM * string
	| ⦏ZSel⋎t⦎ of TERM * int			| ⦏Zμ⦎ of TERM * TERM * TERM
	| ⦏ZApp⦎ of TERM * TERM			| ⦏Zλ⦎ of TERM * TERM * TERM
	| ⦏ZLet⦎ of (string * TERM) list * TERM
	| ⦏ZHSchema⦎ of TERM * TERM
	| ⦏ZDecor⋎s⦎ of TERM * string		| ⦏ZPre⋎s⦎ of TERM
	| ⦏Z↾⋎s⦎ of TERM * TERM			| ⦏ZHide⋎s⦎ of TERM * string list
	| ⦏ZΔ⋎s⦎ of TERM				| ⦏ZΞ⋎s⦎ of TERM
	| ⦏Z⨾⋎s⦎ of TERM * TERM			
	| ⦏ZRename⋎s⦎ of TERM * (string * string) list
	;
=DESCRIBE
This datatype corresponds to a version of the abstract syntax of Z in which recursion has been removed and the distinction between declarations, predicates and terms ignored.
It is used by the generalised mapping functions $mk\_z\_TERM$, $is\_z\_term$ and $dest\_z\_term$ (q.v.).
=ENDDOC

\newpage

Whilst the names of the constructors of $Z\_TERM$ are intended to convey
their purpose, some are not immediately obvious.  The list below gives
brief explanations.  Each entry indicates the part of the Z~grammar that
it occurs within; namely: declarations, expressions, predicates or schemas.

{\def\ITEM#1{\item[$#1$ ] }

\begin{description}

\ITEM{ZDec} Declare several names with a given Z~type, $basic-decl$ in
	the grammar, declarations.  May only be used (after applying
	$mk\_z\_term$) as arguments of the $ZDecl$ constructor.

\ITEM{ZSchemaDec} Schema, with decoration, used as a declaration.  May
	only be used (after applying $mk\_z\_term$) as arguments of the
	$ZDecl$ constructor.  (Pronounce this constructor as ``Z~dec
	schema exp''.)

\ITEM{ZDecl} Declarations, $decl-part$ in the grammar, declarations.
	Applying $dest\_z\_term$ to the terms of this should yield only
	$ZDec$ and $ZSchemaDec$ values, correspondingly these two values
	may only be used (after applying $mk\_z\_term$) as arguments of
	this constructor.

\ITEM{ZEq} Equality, predicate.

\ITEM{Z∈} Membership, predicate.

\ITEM{ZTrue} Truth, predicate.

\ITEM{ZFalse} False, predicate.

\ITEM{Z¬} Negation, predicate.

\ITEM{Z¬⋎s} Negation, schema.

\ITEM{Z∧} Conjunction, predicate.

\ITEM{Z∧⋎s} Conjunction, schema.

\ITEM{Z∨} Disjunction, predicate.

\ITEM{Z∨⋎s} Disjunction, schema.

\ITEM{Z⇒} Implication, predicate.

\ITEM{Z⇒⋎s} Implication, schema.

\ITEM{Z⇔} Equivalence, predicate.

\ITEM{Z⇔⋎s} Equivalence, schema.

\ITEM{Z∃} Existential quantifier, predicate.

\ITEM{Z∃⋎s} Existential quantifier.

\ITEM{Z∃⋎1} Unique existence quantifier, predicate, schema.

\ITEM{Z∃⋎1⋎s} Unique existence quantifier, schema.

\ITEM{Z∀} For all quantifier, predicate.

\ITEM{Z∀⋎s} For all quantifier, schema.

\ITEM{ZSchemaPred} Use of a schema, with decoration, as a predicate.

\ITEM{ZLVar} Local variable with type, expression.
	(The ``$TERM\;list$'' component is thought to have no purpose
	and should, perhaps, be deleted.)

\ITEM{ZGVar} Global variable with type and generic parameters, expression.

\ITEM{ZInt} Decimal representation of a non-negative number, expression.

\ITEM{Z⟨⟩} Sequence display, expression.

\ITEM{ZSetd} Set display, expression.

\ITEM{ZSeta} Set comprehension, expression.  `%
=INLINEFT
{ D | P ⦁\; E }
=TEX
'

\ITEM{Zℙ} Power type, expression.

\ITEM{ZTuple} Tuple, expression.  `%
=INLINEFT
(Expression, ..., Expression)
=TEX
'
\ITEM{ZBinding} Binding display, expression.  `%
=INLINEFT
(name≜Expression, ..., name≜Expression)
=TEX
'

\ITEM{Z×} Cartesian product, expression.

\ITEM{Zθ} Binding formation of schema with decoration, expression.

\ITEM{ZSel} Selection of a component from a binding, expression.

\ITEM{Zμ} Mu-expression, unique choice, expression.

\ITEM{ZApp} Functional application, expression.

\ITEM{Zλ} Lambda-expression, a function, expression.

\ITEM{ZHSchema} Horizontal schema.  `%
=INLINEFT
[ D | P ]
=TEX
' where: $D$ is the declarations such that `$dest\_z\_term\;D$' yields
a $ZDecl$; and, $P$ is a predicate.

\ITEM{ZDecor⋎s} Use a schema, with decoration, as a schema.

\ITEM{ZPre⋎s} Precondition of a schema as a predicate.

\ITEM{Z↾⋎s} Schema projection, schema.

\ITEM{ZHide⋎s} Schema hiding, schema.

\ITEM{ZΔ⋎s} Delta-state, schema.

\ITEM{ZRename⋎s} Schema renaming, schema.

\ITEM{ZΞ⋎s} Xi-state, schema.

\ITEM{Z⨾⋎s} Composition of schemas.

\end{description}
}

\newpage

\section{NAME DESTRUCTION}
=DOC
val ⦏dest_z_name⦎ : string -> string * string list list * string OPT;
=DESCRIBE
Analyses the names of Z semantic constants, returning the basic name and lists of embedded component names. If the name is a projection, then the projection part is also returned.
=FAILURE
47000	?0 is not a Z constant name
=ENDDOC
=DOC
val ⦏dest_z_name1⦎ : string -> string * string OPT;
val ⦏dest_z_name2⦎ : string -> string OPT -> string list list * string OPT;
=DESCRIBE
Supplying $dest\_z\_name2$ with the result of $dest\_z\_name1$ gives the same overall result as $dest\_z\_name$ q.v.  These functions allow the destruction of the component names and projection part to be deferred for efficiency, in case they are not required.
=FAILURE
47000	?0 is not a Z constant name
=ENDDOC
=DOC
val ⦏mk_dollar_quoted_string⦎ : string -> string;
val ⦏dest_dollar_quoted_string⦎ : string -> string;
val ⦏is_dollar_quoted_string⦎ : string -> bool;
=DESCRIBE
The Z parser allows an arbitrary ML character string to be used to form an identifier.
These functions implement the encoding used to embed an arbitrary ML string in the name of a Z variable:
=GFT Example
mk_dollar_quoted_string"<ext-name>" = "$\"<ext-name>\""
dest_dollar_quoted_string"$\"<ext-name>\"" = "<ext-name>"
is_dollar_quoted_string"$\"<ext-name>\"" = true
is_dollar_quoted_string"\"<ext-name>\"" = false
=FAILURE
47001	?0 is not a valid dollar-quoted string
=ENDDOC
\section{Z TYPES}
The following sections describe the constructor, discriminator and destructor functions for each of the five Z type constructors.
\subsection{Given Sets}
=DOC
val ⦏mk_z_given_type⦎ : string -> TYPE;
val ⦏is_z_given_type⦎ : TYPE -> bool;
val ⦏dest_z_given_type⦎ : TYPE -> string
=DESCRIBE
These are the constructor, discriminator and destructor functions for the types of given sets.
The type names used by these functions are the HOL names.
=FAILURE
47010	?0 is not a Z given type
=ENDDOC
\subsection{Generic Variables}
=DOC
val ⦏mk_z_var_type⦎ : string -> TYPE;
val ⦏is_z_var_type⦎ : TYPE -> bool;
val ⦏dest_z_var_type⦎ : TYPE -> string;
=DESCRIBE
The type of generic parameters.
=FAILURE
47020	?0 is not a Z type variable
=ENDDOC
\subsection{Set Types}
=DOC
val ⦏mk_z_power_type⦎ : TYPE -> TYPE;
val ⦏is_z_power_type⦎ : TYPE -> bool;
val ⦏dest_z_power_type⦎ : TYPE -> TYPE;
=DESCRIBE
Set type constructor.
=GFT Definition
mk_z_power_type ty = ℙ ty
=TEX
=FAILURE
47030	?0 is not a Z set type
=ENDDOC
\subsection{Cartesian Product Types}
=DOC
val ⦏mk_z_tuple_type⦎ : TYPE list -> TYPE;
val ⦏is_z_tuple_type⦎ : TYPE -> bool;
val ⦏dest_z_tuple_type⦎ : TYPE -> TYPE list;
=DESCRIBE
Cartesian product type constructor.
=GFT Definition
mk_z_tuple_type [ty1,...,tyn] = ty1 × ... × tyn
=TEX
=FAILURE
47040	?0 is not a Z tuple type
=ENDDOC
\subsection{Binding Types}
=DOC
val ⦏mk_z_schema_type⦎ : (string * TYPE) list -> TYPE;
val ⦏is_z_schema_type⦎ : TYPE -> bool;
val ⦏dest_z_schema_type⦎ : TYPE -> (string * TYPE) list;
=DESCRIBE
Binding type constructor.
=GFT Definition
mk_z_schema_type [(c1,ty1),...,(cn,tyn)] = [c1:ty1 ; ... ; cn:tyn]
=TEX
=FAILURE
47050	?0 is not a Z binding type
=ENDDOC
\section{Z TERMS}
The following describes the constructor, discriminator and destructor functions for Z terms.
In each case, the description is for the constructor function; the destructor is simply the inverse and the discriminator returns true if its argument was made using the appropriate constructor, false otherwise.
\subsection{Declarations}
=DOC
val ⦏mk_z_dec⦎ : TERM list * TERM -> TERM;
val ⦏is_z_dec⦎ : TERM -> bool;
val ⦏dest_z_dec⦎ : TERM -> TERM list * TERM;
=DESCRIBE
Makes a simple declaration of one or more variables of the same type for use in the declaration part of a schema text.
=GFT Definition
mk_z_dec([ⓩv⋎1⌝,...,ⓩv⋎n⌝],ⓩS⌝) = ⓩv⋎1,...v⋎n : S⌝
=TEX
Where the $v⋎i$ and the members of $S$ must have the same type.
=USES
May only be used to make arguments for $mk\_z\_decl$.
=FAILURE
47060	?0 is not a Z set
3012	?0 and ?1 do not have the same types
3017	An empty list argument is not allowed
47061	?0 is not a Z simple declaration
=ENDDOC
=DOC
val ⦏mk_z_schema_dec⦎ : TERM * string -> TERM;
val ⦏is_z_schema_dec⦎ : TERM -> bool;
val ⦏dest_z_schema_dec⦎ : TERM -> TERM * string;
=DESCRIBE
Constructor, discriminator and destructor functions for the components of a schema (the first argument), systematically decorated with the second argument.
=USES
May only be used to make arguments for $mk\_z\_decl$.
=FAILURE
47940	?0 is not a Z schema
47071	?0 is not a Z schema as a declaration
=ENDDOC
=DOC
val ⦏mk_z_decl⦎ : TERM list -> TERM;
val ⦏is_z_decl⦎ : TERM -> bool;
val ⦏dest_z_decl⦎ : TERM -> TERM list;
=DESCRIBE
Constructor, discriminator and destructor functions for the declaration part of a schema text.  Its arguments must be made using $mk\_z\_dec$ or $mk\_z\_schema_dec$.
=GFT Definition
mk_z_decl [ⓩt1⌝,...,ⓩtn⌝] = ⓩt1;...;tn⌝
=TEX
=FAILURE
47912	?0 is not a Z declaration
3012	?0 and ?1 do not have the same types
=ENDDOC
\subsection{Terms}
=DOC
val ⦏mk_z_lvar⦎ : string * TYPE * TERM list -> TERM;
val ⦏is_z_lvar⦎ : TERM -> bool;
val ⦏dest_z_lvar⦎ : TERM -> string * TYPE * TERM list;
=DESCRIBE
Constructor, discriminator and destructor functions for local variables.
If the third argument is the empty list, this function is the same as the HOL $mk\_var$ function, otherwise a generic variable is created, the third argument being the generic actual parameters.
=FAILURE
47090	?0 is not a Z local variable
=ENDDOC
=DOC
val ⦏mk_z_gvar⦎ : string * TYPE * TERM list -> TERM;
val ⦏is_z_gvar⦎ : TERM -> bool;
val ⦏dest_z_gvar⦎ : TERM -> string * TYPE * TERM list;
=DESCRIBE
Constructor, discriminator and destructor functions for global variables.
If the third argument is the empty list, this function is the same as the HOL $mk\_const$ function, otherwise a generic constant is created, the third argument being the generic actual parameters.
=FAILURE
47100	?0 is not a Z global variable
=ENDDOC
=DOC
val ⦏mk_z_int⦎ : string -> TERM;
val ⦏is_z_int⦎ : TERM -> bool;
val ⦏dest_z_int⦎ : TERM -> string;
=DESCRIBE
Constructor, discriminator and destructor functions for integer literals.
The argument should be a numeral, the result is the corresponding positive integer.
=FAILURE
47105	?0 is not a Z integer
=ENDDOC
=DOC
val ⦏mk_z_string⦎ : string -> TERM;
val ⦏is_z_string⦎ : TERM -> bool;
val ⦏dest_z_string⦎ : TERM -> string;
=DESCRIBE
Constructor, discriminator and destructor functions for string literals.
The argument should be a string, the result is the corresponding string quotation.
=FAILURE
47106	?0 is not a Z string
=ENDDOC
=DOC
val ⦏mk_z_float⦎ : TERM * TERM * TERM -> TERM;
val ⦏is_z_float⦎ : TERM -> bool;
val ⦏dest_z_float⦎ : TERM -> TERM * TERM * TERM;
=DESCRIBE
Constructor, discriminator and destructor functions for floating point literals.
The argument is a triple of terms of type ℤ giving the mantissa, the number of digits after the decimal
point and the exponent in that order, i.e., the triple $(x, p, e)$ represents the real number
$x \times 10^{e - p}$.
=FAILURE
47107	?0 is not a Z floating point literal
47108	?0 does not have type ℤ
=ENDDOC
=DOC
val ⦏mk_z_⟨⟩⦎ : TYPE * TERM list -> TERM;
val ⦏is_z_⟨⟩⦎ : TERM -> bool;
val ⦏dest_z_⟨⟩⦎ : TERM -> TYPE * TERM list;
=DESCRIBE
Constructor, discriminator and destructor functions for finite sequences.
The result is the sequence made from the terms in the second argument, each of whose types must be the same as the first argument.
=GFT Definition
mk_z_⟨⟩(ty,[ⓩt⋎1⌝,...,ⓩt⋎n⌝]) = ⓩ⟨t⋎1,...,t⋎n⟩⌝
=TEX
Where the $t⋎i$ all have type $ty$.
=FAILURE
47110	?0 is not a Z sequence display
=ENDDOC
=DOC
val ⦏mk_z_setd⦎ : TYPE * TERM list -> TERM;
val ⦏is_z_setd⦎ : TERM -> bool;
val ⦏dest_z_setd⦎ : TERM -> TYPE * TERM list;
=DESCRIBE
Constructor, discriminator and destructor functions for finite set displays.
The result is the set made from the terms in the second argument, each of whose types must be the same as the first argument.
=GFT Definition
mk_z_setd(ty,[ⓩt⋎1⌝,...,ⓩt⋎n⌝]) = ⓩ{t⋎1,...,t⋎n}⌝
=TEX
Where the $t⋎i$ all have type $ty$.
=FAILURE
47120	?0 is not a Z set display
=ENDDOC
=DOC
val ⦏mk_z_seta⦎ : TERM * TERM * TERM -> TERM;
val ⦏is_z_seta⦎ : TERM -> bool;
val ⦏dest_z_seta⦎ : TERM -> TERM * TERM * TERM;
=DESCRIBE
Constructor, discriminator and destructor functions for set comprehension.
The three arguments represent the declaration, predicate and body parts of the set comprehension and so must have the appropriate types.
In particular, the first argument must be made using $mk\_z\_decl$.
=GFT Definition
mk_z_seta(ⓩd⌝,ⓩp⌝,ⓩv⌝) = ⓩ{d | p ⦁ v}⌝
=TEX
=FAILURE
47130	?0 is not a Z set comprehension
=ENDDOC
=DOC
val ⦏mk_z_ℙ⦎ : TERM -> TERM;
val ⦏is_z_ℙ⦎ : TERM -> bool;
val ⦏dest_z_ℙ⦎ : TERM -> TERM;
=DESCRIBE
The powerset constructor.
=GFT Definition
mk_z_ℙ t = ℙ t
=TEX
=FAILURE
47140	?0 is not a Z powerset
=ENDDOC
=DOC
val ⦏mk_z_tuple⦎ : TERM list -> TERM;
val ⦏is_z_tuple⦎ : TERM -> bool;
val ⦏dest_z_tuple⦎ : TERM -> TERM list;
=DESCRIBE
The tuple constructor.
=GFT Definition
mk_z_tuple [ⓩt⋎1⌝,...,ⓩt⋎n⌝] = ⓩ(t⋎1,...,t⋎n)⌝
=TEX
=FAILURE
47150	?0 is not a Z tuple
=ENDDOC
=DOC
val ⦏mk_z_binding⦎ : (string * TERM) list -> TERM;
val ⦏is_z_binding⦎ : TERM -> bool;
val ⦏dest_z_binding⦎ : TERM -> (string * TERM) list;
=DESCRIBE
The binding constructor.
=GFT Definition
mk_z_binding [("n⋎1",ⓩt⋎1⌝),...,("n⋎n",ⓩt⋎n⌝)] = ⓩ(n⋎1≜t⋎1,...,n⋎n≜t⋎n)⌝
=TEX
=FAILURE
47151	?0 is not a Z binding
47152	Cannot bind more than one value to ?0
=ENDDOC
=DOC
val ⦏mk_z_×⦎ : TERM list -> TERM;
val ⦏is_z_×⦎ : TERM -> bool;
val ⦏dest_z_×⦎ : TERM -> TERM list;
=DESCRIBE
The cartesian product constructor.
=GFT Definition
mk_z_× [ⓩt1⌝,...,ⓩtn⌝] = ⓩ(t1 × ... × tn)⌝
=TEX
=FAILURE
47160	?0 is not a Z cartesian product
=ENDDOC
=DOC
val ⦏mk_z_θ⦎ : TERM * string -> TERM;
val ⦏is_z_θ⦎ : TERM -> bool;
val ⦏dest_z_θ⦎ : TERM -> TERM * string;
=DESCRIBE
The theta term constructor.
The first argument must be a schema, the second is an optional decoration.
=GFT Definition
mk_z_θ(ⓩS⌝,"'") = ⓩθS'⌝
=TEX
=FAILURE
47170	?0 is not a Z θ term
=ENDDOC
=DOC
val ⦏mk_z_sel⋎s⦎ : TERM * string -> TERM;
val ⦏is_z_sel⋎s⦎ : TERM -> bool;
val ⦏dest_z_sel⋎s⦎ : TERM -> TERM * string;
=DESCRIBE
Selection of a component from a binding.
The type of the first argument must be a binding and the second argument must be a component of that type.
=GFT Definition
mk_z_sel(ⓩS⌝,"c") = ⓩS.c⌝
=TEX
=FAILURE
47180	?0 is not a Z selection
=ENDDOC
=DOC
val ⦏mk_z_sel⋎t⦎ : TERM * int -> TERM;
val ⦏is_z_sel⋎t⦎ : TERM -> bool;
val ⦏dest_z_sel⋎t⦎ : TERM -> TERM * int;
=DESCRIBE
Selection of a component from a tuple.
The type of the first argument must be a tuple and the second argument must be a component in that tuple.
=GFT Definition
mk_z_sel⋎t(ⓩTup⌝, i) = ⓩTup.i⌝
=TEX
=FAILURE
47185	?0 is not a Z tuple selection
=ENDDOC
=DOC
val ⦏mk_z_app⦎ : TERM * TERM -> TERM;
val ⦏is_z_app⦎ : TERM -> bool;
val ⦏dest_z_app⦎ : TERM -> TERM * TERM;
=DESCRIBE
Z function application.
The first argument must be a set of pairs, the second must have the same type as the first elements of the pairs.
=GFT Definition
mk_z_app(ⓩf⌝,ⓩa⌝) = ⓩ(f a)⌝
=TEX
=FAILURE
47190	?0 is not a Z function application
47191	?0 has the wrong type to be a Z function
47192	?0 has the wrong type to be applied to ?1
=ENDDOC
=DOC
val ⦏mk_z_λ⦎ : TERM * TERM * TERM -> TERM;
val ⦏is_z_λ⦎ : TERM -> bool;
val ⦏dest_z_λ⦎ : TERM -> TERM * TERM * TERM;
=DESCRIBE
The lambda constructor.
The arguments are a declaration (constructed using $mk\_z\_decl$ q.v.), a predicate and the body of the abstraction.
=GFT Definition
mk_z_λ(ⓩd⌝,ⓩp⌝,ⓩv⌝) = ⓩλd|p⦁v⌝
=TEX
=FAILURE
47200	?0 is not a Z λ abstraction
47201	?0, ?1 and ?2 are inconsistent in Z
=ENDDOC
=DOC
val ⦏mk_z_μ⦎ : TERM * TERM * TERM -> TERM;
val ⦏is_z_μ⦎ : TERM -> bool;
val ⦏dest_z_μ⦎ : TERM -> TERM * TERM * TERM;
=DESCRIBE
The definite description constructor.
The arguments are a declaration (constructed using $mk\_z\_decl$ q.v.), a predicate and the body of the definite description.
=GFT Definition
mk_z_μ(ⓩd⌝,ⓩp⌝,ⓩv⌝) = ⓩμd|p⦁v⌝
=TEX
=FAILURE
47210	?0 is not a Z μ term
=ENDDOC
=DOC
val ⦏mk_z_let⦎ : (string * TERM) list * TERM -> TERM;
val ⦏is_z_let⦎ : TERM -> bool;
val ⦏dest_z_let⦎ : TERM -> (string * TERM) list * TERM;
=DESCRIBE
The let-term constructor.
The arguments are list of pairs, each comprising  a local variable name and a defining term for that local variable, and a term giving the body of the let-expression.
=GFT Definition
mk_z_let([("v", ⓩdt⌝), ...], ⓩb⌝) = ⓩlet v ≜ dt; ... ⦁ t⌝
=TEX
=FAILURE
47211	?0 is not a Z let term
=ENDDOC
\subsection{Predicates}
=DOC
val ⦏mk_z_eq⦎ : TERM * TERM -> TERM;
val ⦏is_z_eq⦎ : TERM -> bool;
val ⦏dest_z_eq⦎ : TERM -> TERM * TERM;
=DESCRIBE
Equality.
For the moment this is the same as HOL equality, but this is likely to change in the future.
Both arguments must be of the same type.
=GFT Definition
mk_z_eq(ⓩa⌝,ⓩb⌝) = ⓩ(a = b)⌝
=TEX
=FAILURE
3012	?0 and ?1 do not have the same types
47220	?0 is not a Z equality
=ENDDOC
=DOC
val ⦏mk_z_∈⦎ : TERM * TERM -> TERM;
val ⦏is_z_∈⦎ : TERM -> bool;
val ⦏dest_z_∈⦎ : TERM -> TERM * TERM;
=DESCRIBE
Set membership.
The second argument must be a set, whose members have the same type as the first argument.
=GFT Definition
mk_z_∈(ⓩa⌝,ⓩb⌝) = ⓩ(a ∈ b)⌝
=TEX
=FAILURE
47230	?0 is not a Z set membership
=ENDDOC
=DOC
val ⦏mk_z_true⦎ : TERM;
val ⦏is_z_true⦎ : TERM -> bool;
=DESCRIBE
The Z constant $true$.
It is the same as the HOL constant $T$.
=ENDDOC
=DOC
val ⦏mk_z_false⦎ : TERM;
val ⦏is_z_false⦎ : TERM -> bool;
=DESCRIBE
The Z constant $false$.
It is the same as the HOL constant $F$.
=ENDDOC
=DOC
val ⦏mk_z_¬⦎ : TERM -> TERM;
val ⦏is_z_¬⦎ : TERM -> bool;
val ⦏dest_z_¬⦎ : TERM -> TERM;
=FAILURE
3031	?0 is not of type ⓣBOOL⌝
47240	?0 is not a Z negation
=DESCRIBE
Negation; the same as HOL $¬$.
Its argument must be $bool$ type.
=ENDDOC
=DOC
val ⦏mk_z_∧⦎ : TERM * TERM -> TERM;
val ⦏is_z_∧⦎ : TERM -> bool;
val ⦏dest_z_∧⦎ : TERM -> TERM * TERM;
=DESCRIBE
Conjunction; the same as HOL $∧$.
Its arguments must be $bool$ type.
=FAILURE
3015	?1 is not of type ⓣBOOL⌝
3031	?0 is not of type ⓣBOOL⌝
47250	?0 is not a Z conjunction
=ENDDOC
=DOC
val ⦏mk_z_∨⦎ : TERM * TERM -> TERM;
val ⦏is_z_∨⦎ : TERM -> bool;
val ⦏dest_z_∨⦎ : TERM -> TERM * TERM;
=DESCRIBE
Disjunction; the same as HOL $∨$.
Its arguments must be $bool$ type.
=FAILURE
3015	?1 is not of type ⓣBOOL⌝
3031	?0 is not of type ⓣBOOL⌝
47260	?0 is not a Z disjunction
=ENDDOC
=DOC
val ⦏mk_z_⇒⦎ : TERM * TERM -> TERM;
val ⦏is_z_⇒⦎ : TERM -> bool;
val ⦏dest_z_⇒⦎ : TERM -> TERM * TERM;
=DESCRIBE
Implication; the same as HOL $⇒$.
Its arguments must be $bool$ type.
=FAILURE
3015	?1 is not of type ⓣBOOL⌝
3031	?0 is not of type ⓣBOOL⌝
47270	?0 is not a Z implication
=ENDDOC
=DOC
val ⦏mk_z_⇔⦎ : TERM * TERM -> TERM;
val ⦏is_z_⇔⦎ : TERM -> bool;
val ⦏dest_z_⇔⦎ : TERM -> TERM * TERM;
=DESCRIBE
If and only if; the same as HOL $⇔$.
Its argument must be $bool$ type.
=FAILURE
3015	?1 is not of type ⓣBOOL⌝
3031	?0 is not of type ⓣBOOL⌝
47280	?0 is not a Z if and only if
=ENDDOC
=DOC
val ⦏mk_z_∃⦎ : TERM * TERM * TERM -> TERM;
val ⦏is_z_∃⦎ : TERM -> bool;
val ⦏dest_z_∃⦎ : TERM -> TERM * TERM * TERM;
=DESCRIBE
Constructor, discriminator and destructor functions for existential quantification.
Its arguments must be a declaration (constructed with $mk\_z\_decl$) and two predicates.
=GFT Definition
mk_z_∃(ⓩd⌝,ⓩp⌝,ⓩv⌝) = ⓩ∃d|p⦁v⌝
=TEX
=FAILURE
47912	?0 is not a Z declaration
47290	?0 is not a Z existential quantification
=ENDDOC
=DOC
val ⦏mk_z_∃⋎1⦎ : TERM * TERM * TERM -> TERM;
val ⦏is_z_∃⋎1⦎ : TERM -> bool;
val ⦏dest_z_∃⋎1⦎ : TERM -> TERM * TERM * TERM;
=DESCRIBE
Constructor, discriminator and destructor functions for unique existential quantification.
Its arguments must be a declaration (constructed with $mk\_z\_decl$) and two predicates.
=GFT Definition
mk_z_∃⋎1(ⓩd⌝,ⓩp⌝,ⓩv⌝) = ⓩ∃⋎1 d|p⦁v⌝
=TEX
=FAILURE
47912	?0 is not a Z declaration
47300	?0 is not a Z unique existential quantification
=ENDDOC
=DOC
val ⦏mk_z_∀⦎ : TERM * TERM * TERM -> TERM;
val ⦏is_z_∀⦎ : TERM -> bool;
val ⦏dest_z_∀⦎ : TERM -> TERM * TERM * TERM;
=DESCRIBE
Constructor, discriminator and destructor functions for universal quantification.
Its arguments must be a declaration (constructed with $mk\_z\_decl$) and two predicates.
=GFT Definition
mk_z_∀(ⓩd⌝,ⓩp⌝,ⓩv⌝) = ⓩ∀d|p⦁v⌝
=TEX
=FAILURE
47912	?0 is not a Z declaration
47310	?0 is not a Z universal quantification
=ENDDOC
=DOC
val ⦏mk_z_schema_pred⦎ : TERM * string -> TERM;
val ⦏is_z_schema_pred⦎ : TERM -> bool;
val ⦏dest_z_schema_pred⦎ : TERM -> TERM * string;
=DESCRIBE
The schema as predicate constructor.
The first argument must be a schema, the second is an optional decoration.
=FAILURE
47940	?0 is not a Z schema
47320	?0 is not a Z schema as a predicate expression
=ENDDOC
\subsection{Schema Calculus}
=DOC
val ⦏mk_z_h_schema⦎ : TERM * TERM -> TERM;
val ⦏is_z_h_schema⦎ : TERM -> bool;
val ⦏dest_z_h_schema⦎ : TERM -> TERM * TERM;
=DESCRIBE
The schema constructor.
The first argument is a declaration constructed using $mk\_z\_decl$, the second is a predicate.
=GFT Definition
mk_z_h_schema(ⓩd⌝,ⓩp⌝) = ⓩ[d | p]⌝
=TEX
=FAILURE
47940	?0 is not a Z schema
=ENDDOC
=DOC
val ⦏mk_z_decor⋎s⦎ : TERM * string -> TERM;
val ⦏is_z_decor⋎s⦎ : TERM -> bool;
val ⦏dest_z_decor⋎s⦎ : TERM -> TERM * string;
=DESCRIBE
Constructor, discriminator and destructor functions for systematic decoration of schemas.
The first argument must be a schema, the second a decoration.
=GFT Example
mk_z_decor⋎s(ⓩ[a,b,c:X | a = b]⌝,"'") = ⓩ[a',b',c':X | a' = b']⌝
=TEX
=FAILURE
47340	?0 is not a Z decorated schema
=ENDDOC
=DOC
val ⦏mk_z_pre⋎s⦎ : TERM -> TERM;
val ⦏is_z_pre⋎s⦎ : TERM -> bool;
val ⦏dest_z_pre⋎s⦎ : TERM -> TERM;
=DESCRIBE
The schema precondition constructor.
The argument must be a schema.
=GFT Definition
mk_z_pre⋎s ⓩS⌝ = ⓩpre S⌝
=TEX
=FAILURE
47350	?0 is not a Z schema precondition
=ENDDOC
=DOC
val ⦏mk_z_¬⋎s⦎ : TERM -> TERM;
val ⦏is_z_¬⋎s⦎ : TERM -> bool;
val ⦏dest_z_¬⋎s⦎ : TERM -> TERM;
=DESCRIBE
The schema negation constructor.
The argument must be a schema.
=GFT Definition
mk_z_¬⋎s ⓩS⌝ = ⓩ¬S⌝
=TEX
=FAILURE
47360	?0 is not a Z schema negation
=ENDDOC
=DOC
val ⦏mk_z_∧⋎s⦎ : TERM * TERM -> TERM;
val ⦏is_z_∧⋎s⦎ : TERM -> bool;
val ⦏dest_z_∧⋎s⦎ : TERM -> TERM * TERM;
=DESCRIBE
The schema conjunction constructor.
Both arguments must be schemas.
=GFT Definition
mk_z_∧⋎s(ⓩR⌝,ⓩS⌝) = ⓩR ∧ S⌝
=TEX
=FAILURE
47370	?0 is not a Z schema conjunction
=ENDDOC
=DOC
val ⦏mk_z_∨⋎s⦎ : TERM * TERM -> TERM;
val ⦏is_z_∨⋎s⦎ : TERM -> bool;
val ⦏dest_z_∨⋎s⦎ : TERM -> TERM * TERM;
=DESCRIBE
The schema disjunction constructor.
Both arguments must be schemas.
=GFT Definition
mk_z_∨⋎s(ⓩR⌝,ⓩS⌝) = ⓩR ∨ S⌝
=TEX
=FAILURE
47380	?0 is not a Z schema disjunction
=ENDDOC
=DOC
val ⦏mk_z_⇒⋎s⦎ : TERM * TERM -> TERM;
val ⦏is_z_⇒⋎s⦎ : TERM -> bool;
val ⦏dest_z_⇒⋎s⦎ : TERM -> TERM * TERM;
=DESCRIBE
The schema implication constructor.
Both arguments must be schemas.
=GFT Definition
mk_z_⇒⋎s(ⓩR⌝,ⓩS⌝) = ⓩR ⇒ S⌝
=TEX
=FAILURE
47390	?0 is not a Z schema implication
=ENDDOC
=DOC
val ⦏mk_z_⇔⋎s⦎ : TERM * TERM -> TERM;
val ⦏is_z_⇔⋎s⦎ : TERM -> bool;
val ⦏dest_z_⇔⋎s⦎ : TERM -> TERM * TERM;
=DESCRIBE
The schema equivalence constructor.
Both arguments must be schemas.
=GFT Definition
mk_z_⇔⋎s(ⓩR⌝,ⓩS⌝) = ⓩR ⇔ S⌝
=TEX
=FAILURE
47400	?0 is not a Z schema if and only if
=ENDDOC
=DOC
val ⦏mk_z_↾⋎s⦎ : TERM * TERM -> TERM;
val ⦏is_z_↾⋎s⦎ : TERM -> bool;
val ⦏dest_z_↾⋎s⦎ : TERM -> TERM * TERM;
=DESCRIBE
The schema projection constructor.
Both arguments must be schemas.
=GFT Definition
mk_z_↾⋎s(ⓩR⌝,ⓩS⌝) = ⓩR ↾ S⌝
=TEX
=FAILURE
47410	?0 is not a Z schema projection
=ENDDOC
=DOC
val ⦏mk_z_hide⋎s⦎ : TERM * string list -> TERM;
val ⦏is_z_hide⋎s⦎ : TERM -> bool;
val ⦏dest_z_hide⋎s⦎ : TERM -> TERM * string list;
=DESCRIBE
The schema hiding constructor.
The first argument must be a schema, the second is a list of components to be hidden.
=GFT Definition
mk_z_hide⋎s(ⓩS⌝,["c1",..."cn"]) = ⓩS \ (c1,...,cn)⌝
=TEX
=FAILURE
47420	?0 is not a Z schema hiding
=ENDDOC
=DOC
val ⦏mk_z_∃⋎s⦎ : TERM * TERM * TERM -> TERM;
val ⦏is_z_∃⋎s⦎ : TERM -> bool;
val ⦏dest_z_∃⋎s⦎ : TERM -> TERM * TERM * TERM;
=DESCRIBE
The schema existential quantifier constructor.
The arguments must be a declaration (constructed using $mk\_z\_decl$), a predicate and a schema.
=GFT Definition
mk_z_∃⋎s(ⓩd⌝,ⓩp⌝,ⓩS⌝) = ⓩ∃d | p ⦁ S⌝
=TEX
=FAILURE
47430	?0 is not a Z schema existential
=ENDDOC
=DOC
val ⦏mk_z_∃⋎1⋎s⦎ : TERM * TERM * TERM -> TERM;
val ⦏is_z_∃⋎1⋎s⦎ : TERM -> bool;
val ⦏dest_z_∃⋎1⋎s⦎ : TERM -> TERM * TERM * TERM;
=DESCRIBE
The schema unique existential quantifier constructor.
The arguments must be a declaration (constructed using $mk\_z\_decl$), a predicate and a schema.
=GFT Definition
mk_z_∃⋎1⋎s(ⓩd⌝,ⓩp⌝,ⓩS⌝) = ⓩ∃⋎1 d | p ⦁ S⌝
=TEX
=FAILURE
47440	?0 is not a Z schema unique existential
=ENDDOC
=DOC
val ⦏mk_z_∀⋎s⦎ : TERM * TERM * TERM -> TERM;
val ⦏is_z_∀⋎s⦎ : TERM -> bool;
val ⦏dest_z_∀⋎s⦎ : TERM -> TERM * TERM * TERM;
=DESCRIBE
The schema universal quantifier constructor.
The arguments must be a declaration (constructed using $mk\_z\_decl$), a predicate and a schema.
=GFT Definition
mk_z_∀⋎s(ⓩd⌝,ⓩp⌝,ⓩS⌝) = ⓩ∀d | p ⦁ S⌝
=TEX
=FAILURE
47450	?0 is not a Z schema universal
=ENDDOC
=DOC
val ⦏mk_z_Δ⋎s⦎ : TERM -> TERM;
val ⦏is_z_Δ⋎s⦎ : TERM -> bool;
val ⦏dest_z_Δ⋎s⦎ : TERM -> TERM;
=DESCRIBE
The delta constructor.
Its argument must be a schema.
=GFT Definition
mk_z_Δ⋎s ⓩS⌝ = ⓩΔS⌝
=TEX
=FAILURE
47460	?0 is not a Z Δ
=ENDDOC
=DOC
val ⦏mk_z_Ξ⋎s⦎ : TERM -> TERM;
val ⦏is_z_Ξ⋎s⦎ : TERM -> bool;
val ⦏dest_z_Ξ⋎s⦎ : TERM -> TERM;
=DESCRIBE
The xi constructor.
Its argument must be a schema.
=GFT Definition
mk_z_Ξ⋎s ⓩS⌝ = ⓩΞS⌝
=TEX
=FAILURE
47470	?0 is not a Z Ξ
=ENDDOC
=DOC
val ⦏mk_z_⨾⋎s⦎ : TERM * TERM -> TERM;
val ⦏is_z_⨾⋎s⦎ : TERM -> bool;
val ⦏dest_z_⨾⋎s⦎ : TERM -> TERM * TERM;
=DESCRIBE
The sequential composition constructor.
Its arguments must both be schemas.
=GFT Definition
mk_z_⨾⋎s(ⓩR⌝,ⓩS⌝) = ⓩR ⨾ S⌝
=TEX
=FAILURE
47480	?0 is not a Z schema composition
=ENDDOC
=DOC
val ⦏mk_z_rename⋎s⦎ : TERM * (string * string)list -> TERM;
val ⦏is_z_rename⋎s⦎ : TERM -> bool;
val ⦏dest_z_rename⋎s⦎ : TERM -> TERM * (string * string)list;
=DESCRIBE
The schema renaming construct.
Its argument must be a schema.
=GFT Definition
mk_z_rename⋎s (ⓩS⌝,[("x⋎1","y⋎1"),...]) =
	ⓩS[x⋎1/y⋎1,...]⌝
=TEX
=FAILURE
47461	?0 is not a Z schema renaming
47462	Cannot rename ?0 to more than one name
47463	Cannot rename more than one name to ?0
=ENDDOC
\section{GENERAL MAPPING FUNCTIONS}
These functions map HOL types and terms which represent valid Z types and terms to and from the intermediate datatypes $Z\_TYPE$ and $Z\_TERM$ q.v.
=DOC
val ⦏mk_z_type⦎ : Z_TYPE -> TYPE;
=DESCRIBE
Given any $Z\_TYPE$, $mk\_z\_type$ calls the appropriate abstract machine $mk\_$ function.
=ENDDOC
=DOC
val ⦏is_z_type⦎ : TYPE -> bool;
=DESCRIBE
Tests if a given HOL type represents a valid Z type.
=USES
Recursively in well-formedness checks.
=ENDDOC
=DOC
val ⦏dest_z_type⦎ : TYPE -> Z_TYPE;
=DESCRIBE
Converts a HOL type, which represents a valid Z type, to the appropriate $Z\_TYPE$.
=FAILURE
47800	?0 is not a Z type
=ENDDOC
=DOC
val ⦏mk_z_term⦎ : Z_TERM -> TERM;
=DESCRIBE
Given any $Z\_TERM$, $mk\_z\_TERM$ calls the appropriate abstract machine $mk\_$ function.
=ENDDOC
=DOC
val ⦏is_z_term⦎ : TERM -> bool;
=DESCRIBE
Tests if a given HOL term is valid Z in its top level structure.
=USES
Recursively in well-formedness checks.
=SEEALSO
$is\_z\_term1$ for a more complete check of top level structure,
$is\_z$ for a full traversal of the terms structure.
=ENDDOC
=DOC
val ⦏dest_z_term⦎ : TERM -> Z_TERM;
=DESCRIBE
Converts a HOL term, which represents a valid Z term, to the appropriate $Z\_TERM$.
=SEEALSO
$dest\_z\_term1$ which makes a more careful check, especially of schema constructs.
=FAILURE
47900	?0 is not a Z term
47901	?0 is not a Z package
47910	?0 is not a Z simple declaration
47911	?0 is not a Z schema declaration
47912	?0 is not a Z declaration
47920	?0 is not a Z existential quantification
47921	?0 is not a Z unique existential quantification
47922	?0 is not a Z universal quantification
47923	?0 is not a Z schema as a predicate
47110	?0 is not a Z sequence display
47120	?0 is not a Z set display
47130	?0 is not a Z set comprehension
47170	?0 is not a Z θ term
47190	?0 is not a Z function application
47200	?0 is not a Z λ abstraction
47936	?0 is not a Z definite description
47937	?0 is not a Z let expression
47940	?0 is not a Z schema
47941	?0 is not a Z schema existential quantification
47942	?0 is not a Z schema unique existential quantification
47943	?0 is not a Z schema universal quantification
=ENDDOC

=DOC
datatype ⦏BDZ⦎
	=	⦏BdzOk⦎	of Z_TERM
	|	⦏BdzNotZ⦎	of int
	|	⦏BdzFail⦎	of {
				⦏BdzFCode⦎	: int,
				⦏BdzFCompc⦎	: int,
				⦏BdzFArgc⦎	: int
				}
	;
=DESCRIBE
The return value from function $basic\_dest\_z\_term$.
The $BdzFail$ constructor gives information primarily intended
for use by the Z pretty printer.
=SEEALSO
Function $basic\_dest\_z\_term$.
=ENDDOC

=DOC
val ⦏basic_dest_z_term⦎ : TERM * TERM list -> BDZ;
=DESCRIBE
Function $basic\_dest\_z\_term$ does the work of destroying a term to
yield its Z~structure.  The arguments are in the result of applying
$strip\_app$ to a term.

A call of `$basic\_dest\_z\_term(strip\_app\;\;zt)$' will attempt to
destroy the Z~term $zt$, if successful (i.e., $zt$ is a valid Z~term)
then $BdzOk$ is returned with the appropriate $Z\_TERM$ value.  If $zt$
is not a valid Z~term then one of the other $BDZ$ constructors is
returned, these include an error code indicating what was wrong with
the term.  A~$BdzFail$ is returned when the term is similar to a
Z~term (i.e., it has a known constructor but the wrong number of
arguments).  In this case the $BdzFCompc$ and $BdzFArgc$ fields
tell how many component lists and arguments (respectively) are allowed
in a well formed Z~term.  A~$BdzNotZ$ is returned when the term is
not recognisable as a Z~term.  In cases where insufficient component
lists or arguments are given to a known constructor either $BdzFail$
or $BdzNotZ$ may be returned.

All of the error codes of function $dest\_z\_term$ may be returned by
this function.
=SEEALSO
Functions: $dest\_z\_term$ and $strip\_app$; and,
datatype $BDZ$.
=ENDDOC

\section{$U$}\label{U}

=DOC
val ⦏mk_u⦎ : TYPE -> TERM;
val ⦏is_u⦎ : TERM -> bool;
val ⦏dest_u⦎ : TERM -> TYPE;
=DESCRIBE
These functions create, test for, and destroy terms of the
form $𝕌[Totality]$ which are used by the Z type inferrer to
stand for elided generic actual parameters. The type parameter
to $mk\_u$ and the result of $dest\_u$ is the type of the $𝕌$-term
in question.
=FAILURE
47950	?0 is not of the form ⌜𝕌[Totality]⌝
47951	?0 is not an instance of ⓣ'a SET⌝
=ENDDOC
\section{BINDING OF GLOBAL VARIABLES}\label{BINDING}

=DOC
val ⦏gvar_subst⦎ : TERM -> (TERM * TERM) list;
=DESCRIBE
Given an arbitrary term, $t$, $gvar\_subst$ creates a substitution
mapping those free variables of $t$ (in the HOL sense) which have the
same names as Z global variables (i.e. HOL constants) in the current scope
to the appropriate instances of those global variables (with generic
instantiation using $𝕌$ as necessary). The resulting substitution may
then be used with $subst$, q.v., to ``bind'' the term into the
current scope.
=ENDDOC

\section{END OF SIGNATURE}
=SML
end (* end of ZTypesAndTerms signature *);
=TEX
\section{HOL REPRESENTATIONS OF Z TYPES}
\subsubsection{Given Types}
A Z given type is represented in HOL as a 0-ary type of the same name.
=GFT Definition
mk_z_given_type str = ()str
=TEX
\subsubsection{Generic Types}
The types of Z generic variables are represented as HOL type variables of the same name.
=GFT Definition
mk_vartT str = *str
=TEX
\subsubsection{Set Types}
A Z set type is represented by the unary HOL type ℙ.
=GFT Definition
mk_z_power_type ty = (ty)ℙ
=TEX
\subsubsection{Tuple Types}
A Z tuple type is represented by the corresponding HOL tuple type.
=GFT Definition
mk_z_tuple_type [ty1,...,tyk] = (ty1,...,tyk)Tn
=TEX
\subsubsection{Schema Types}
The type of a Z binding is represented in HOL as an n-ary type constructor, whose name is derived from the components of the binding.
=GFT Definition
mk_z_schema_type [("c1",ty1),...,("ck",tyk)] = (ty1,...,tyk)S_[c1,...,ck]
=TEX
Note that bindings which differ only in the order of their components map to identical types.
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}



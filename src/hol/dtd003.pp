=IGN
********************************************************************************
dtd003.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  dtd003.doc  ℤ $Date: 2009/09/13 12:06:27 $ $Revision: 2.22 $ $RCSfile: dtd003.doc,v $
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

\def\Title{Detailed Design for Types and Terms}

\def\AbstractText{This document gives a detailed design for the types of HOL terms and types, namely $TERM$ and $TYPE$. It then gives some functions upon these. There will be sufficient functions upon $TERM$ to define the type $THM$.}

\def\Reference{DS/FMU/IED/DTD003}

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
%% LaTeX2e port: \TPPtitle{Detailed Design for Types and Terms}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Detailed Design for Types and Terms}
%% LaTeX2e port: \TPPref{DS/FMU/IED/DTD003}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 2.22 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2009/09/13 12:06:27 $%
%% LaTeX2e port: }}  %% Mandatory field
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: %\TPPstatus{Approved}
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.~Blackburn & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document gives a detailed design for the types of HOL terms and types, namely $TERM$ and $TYPE$. It then gives some functions upon these.
%% LaTeX2e port: There will be sufficient functions upon $TERM$ to define the type $THM$.}
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
\item [Issue 2.1 (1991/08/16) (16th August 1991)]
Approved version of issue 1.25.
\item [Issue 2.2 (1991/11/07)]
Inserted notes about case of ML variables $BOOL$, $STRING$ and $CHAR$.

\item[Issue 2.3 (1992/01/20), \FormatDate{92/01/20} ] Updated to use new fonts.
\item [Issue 2.4 (1992/04/09) (1st April 1992)]
Changes required by CR0016.
\item [Issue 2.5 (1992/05/05) (5th May 1992)]
Changes to make processable by \LaTeX.
\item[Issue 2.6 (1992/05/14) (14 May 1992)] Use correct quotation symbols.
\item[Issue 2.7 (1992/05/22) (21st May 1992)]
Clarifying descriptions.
\item[Issue 2.8 (1992/07/14) (7th January 1993)]
Noting infix functions.
\item[Issue 2.10 (1999/02/11) (11th February 1999)]
Updates for SML'97.
\item[Issue 2.11 (1999/03/06)] Use of new INTEGER type.
\item[Issue 2.12 (2002/06/04)] New error message for string store error.
\item[Issue 2.13 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 2.14 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 2.15 (2005/03/20)] Added message for potential internal error.
\item[Issue 2.16 (2005/09/02)] Corrected typo in error message.
\item[Issue 2.18 (2005/12/16)] The prefix for private interfaces is now $pp'$ rather than $icl'$.
\item[Issue 2.19 (2006/10/18)] Corrected documentation for $subst$.
\item[Issue 2.20 (2006/12/09)] The types of object language types and terms are now equality types.
\item[Issue 2.21 (2007/09/06)] Added a function allowing the state of the string store to be examined.
\item[Issue 2.22 (2009/09/13)] Added $type\_match1$ (used in higher-order matching).
\item[Issue 2.23 (2012/02/21)] Added $list\_string\_variant$.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
\section{GENERAL}
\subsection{Scope}
This document contains a detailed design of the types and terms of ICL HOL, and functions to handle them, called for by the first point of section 4.2 of the Release 1 ICL HOL Product Requirement Specification \cite{DS/FMU/IED/DEF004},
and the high level design \cite{DS/FMU/IED/HLD007}.
The high-level specification for the code may be considered
to be given in \cite{DS/FMU/IED/SPC001}.
The design is
implemented in \cite{DS/FMU/IED/IMP003}.
\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains a detailed design of the types and terms of ICL HOL, and functions to handle them.
There will be sufficient functions provided to define the type $THM$.
\subsubsection{Dependencies}
The code in this document depends upon the material in
\cite{DS/FMU/IED/IMP001}.
\subsubsection{Deficiencies}
None known.
\subsubsection{Possible Enhancements}
None known.
\subsubsection{Terminology}
In may be necessary when using the following terminology to remove ambiguity by prefixing some of the following with the word ``term'' or ``HOL''. This will prevent confusions with
Standard ML terminology, or, for instance, theorems
whose conclusions are describable in the same terms.

\begin{tabular}{p{1.3in} p{4.9in}}
exception & By this we only mean an exception raised by Standard ML's $raise$, and functions derived from it:
we only touch on user interrupts, paging errors, etc,
when these are explicitly noted kinds of exceptions to be considered. \\
type variable & A HOL type formed by $mk\_vartype$. \\
compound type & A HOL type formed by $mk\_ctype$: a type constructor applied to sufficient types. \\
function type & A HOL type formed by $mk\_→\_type$: the
type of HOL functions. \\
constant & A term formed by $mk\_const$. \\
variable & A term formed by $mk\_var$. \\
application & A term of the form $⌜f\ t⌝$, as constructed by $mk\_app$
: the application of a function to an argument. \\
binder & A constant which has, in the current context, the
 status of ``binder'' (see, e.g., $declare\_binder$). In most contexts the class includes $⌜\$∀⌝$ and $⌜\$∃⌝$.\\
$λ$-abstraction & A term of the form $⌜λ\ x\ ⦁\ f[x]⌝$,
as constructed by $mk\_simple\_λ$ or $mk\_λ$,
or of the form $⌜λ\ (x,y)\ ⦁\ f[x,y]⌝$, as constructed by $mk\_λ$. \\
simple abstraction & A term of the form $⌜B\ x\ ⦁\ f[x]⌝$
where $B$ is a binder or $λ$, and $x$ a simple variable. \\
paired abstraction & Either a simple abstraction, or
a term of the form $⌜B\ (x,y)\ ⦁\ f[x,y]⌝$
where $B$ is a binder or $λ$, and $(x,y)$ any variable structure allowed by the concrete syntax. \\
abstraction & A paired abstraction, used where the word ``paired'' may be dropped without ambiguity. \\
equation & A term of the form $⌜x\ =\ y⌝$ or $⌜x\ ⇔\ y⌝$,
as constructed by $mk\_eq$. The class includes bi-implications. \\
implication & A term of the form $⌜x\ ⇒\ y⌝$, as constructed by $mk\_⇒$. \\
antecedent & the subterm to the left of the $⇒$ in an implication, e.g. $⌜x⌝$ in $⌜x\ ⇒\ y⌝$. \\
consequent & the subterm to the right of the $⇒$ in an implication, e.g. $⌜y⌝$ in $⌜x\ ⇒\ y⌝$. \\
$∀$-term & A universally quantified term of the form $⌜∀\ x\ ⦁\ P[x]⌝$, as constructed by $mk\_simple\_∀$ or $mk\_∀$,
or a term of the form $⌜∀\ (x,y)\ ⦁\ P[x,y]⌝$, as constructed by $mk\_∀$. \\
$∃$-term & An existentially quantified term of the form $⌜∃\ x\ ⦁\ P[x]⌝$, as constructed by $mk\_simple\_∃$ or $mk\_∃$,
or a term of the form $⌜∃\ (x,y)\ ⦁\ P[x,y]⌝$, as constructed by $mk\_∃$. \\
numeric literal & A constant from the list $⌜0⌝$, $⌜1⌝$,..., as constructed by $mk\_ℕ$. \\
character literal & A constant from the list  $⌜`a`⌝$, $⌜`b`⌝$,..., as constructed by $mk\_char$. \\
string literal & A constant from the list $⌜""⌝$, $⌜"a"⌝$, $⌜"b"⌝$, $⌜"ab"⌝$,..., as constructed by $mk\_string$. \\
\end{tabular}

\section{INFIX DIRECTIVES}
=SML
infix 3 =:;
infix 3 =$;
infix 3 ~=$;
infix 4 term_mem;
infix 4 term_less;
infix 4 term_diff;
infix 4 term_grab;
infix 4 term_union;
=TEX
\section{TYPES AND TERMS}
=DOC
signature ⦏pp'TypesAndTerms⦎ = sig
=DESCRIBE
This provides the type of HOL types: $TYPE$, of HOL terms: $TERM$, and some functions upon them.
A user should access all the elements of this signature through signature $DerivedTerms$ (q.v.).
=ENDDOC
The types and terms module is now stateful. It needs functions to allocate and restore its state
(which is a ref-ref to work properly under Poly/ML). These functions are stubbed once
the abstract data type of theorems has bound to them. The error message below is for use
when this is done.
=SML
type ⦏TYPES_AND_TERMS_STATE⦎
val ⦏new_types_and_terms_state⦎ : unit -> TYPES_AND_TERMS_STATE;
val ⦏set_types_and_terms_state⦎ : TYPES_AND_TERMS_STATE -> unit;
val ⦏get_types_and_terms_state⦎ : unit -> E_KEY E_DICT;
=FAILURE
3029	this function is only available during system build
=TEX
The following error message indicates that a term has been encountered that the abstract data type for $TERM$ thought incapable of formation.
A number of functions make use of this message to indicate this ``impossible'' condition.
=FAILURE
3064	DESIGN ERROR : ill-formed term encountered
=TEX
\subsection{The Type: $TYPE$}
=DOC
eqtype ⦏TYPE⦎;
=DESCRIBE
All HOL terms will be ``typed'', by associating them with
an object of type $TYPE$.
A type may either be a type variable or a compound type.

This is not an equality type (i.e. $=$ cannot be used in tests for equality - see $=:$ instead.).
=ENDDOC
=DOC
val ⦏=:⦎ : (TYPE * TYPE) -> bool
=DESCRIBE
This is the (infix) equality test for HOL types.
It is retained for backwards compatibility --- the type of HOL types is now an equality type.
=ENDDOC
\subsection{Constructors and Destructors of the Type $TYPE$}
\subsubsection{Simple Destroyed Types}
=DOC
datatype ⦏DEST_SIMPLE_TYPE⦎ =
	⦏Vartype⦎ of string
|	⦏Ctype⦎ of (string * TYPE list);
=DESCRIBE
This is the type of simple destroyed types, related to the type $TYPE$ by
$dest\_simple\_type$(q.v.) and $mk\_simple\_type$(q.v.).
The value constructors correspond to type variables and compound types.
=ENDDOC
=DOC
val ⦏dest_simple_type⦎ : TYPE -> DEST_SIMPLE_TYPE;
=DESCRIBE
This function destroys a HOL type into something of type $SIMPLE\-\_DEST\-\_TYPE$ (q.v.).
=ENDDOC
=DOC
val ⦏mk_simple_type⦎ : DEST_SIMPLE_TYPE -> TYPE;
=DESCRIBE
This function constructs a HOL type from something of type $SIMPLE\-\_DEST\-\_TYPE$ (q.v.).
=ENDDOC

\subsubsection{Compound Types}
=DOC
val ⦏mk_ctype⦎ : string * TYPE list -> TYPE;
=DESCRIBE
Create a compound type from a type constructor and sufficient
arguments.
The function makes no checks against the declaration or
arity of the type constructor or the type arguments: see $get\_type\_info$ (q.v.).
=GFT Definition
mk_ctype ("tc", [ⓣty1⌝,ⓣty2⌝,...]) = ⓣ(ty1,ty2,...)tc⌝
mk_ctype ("tc", [ⓣty⌝]) = ⓣty tc⌝
mk_ctype ("tc", []) = ⓣtc⌝
=TEX
=ENDDOC
=DOC
val ⦏dest_ctype⦎ : TYPE -> string * TYPE list;
=DESCRIBE
Extract the components of a compound type.
=GFT Definition
dest_ctype ⓣ(ty1,ty2,...)tc⌝ = ("tc", [ⓣty1⌝,ⓣty2⌝,...])
dest_ctype ⓣty tc⌝ = ("tc", [ⓣty⌝])
dest_ctype ⓣtc⌝ = ("tc", [])
=TEX
=FAILURE
3001	?0 is not a compound type
=ENDDOC
=DOC
val ⦏is_ctype⦎ : TYPE -> bool;
=DESCRIBE
Return true only when the type is a compound type, and false otherwise: no exceptions can be raised.
If the argument isn't a compound type then it must be a type variable.
=ENDDOC
=DOC
val ⦏key_mk_ctype⦎ : E_KEY * TYPE list -> TYPE;
val ⦏key_dest_ctype⦎ : TYPE -> E_KEY * TYPE list;
=DESCRIBE
Internally, the names of type constructors are represented using efficient dictionary keys.
These functions allow the creation and destruction of compound types by key rather than by name.
=ENDDOC
\subsubsection{Type Variables}
=DOC
val ⦏mk_vartype⦎ : string -> TYPE;
=DESCRIBE
Create a HOL type variable from a string:
=GFT Definition
mk_vartype "'tv" = ⓣ 'tv⌝
=TEX
=ENDDOC
=DOC
val ⦏dest_vartype⦎ : TYPE -> string;
=DESCRIBE
Extract the name of a type variable:
=GFT Definition
dest_vartype ⓣ 'tv⌝ = "'tv"
=TEX
=FAILURE
3019	?0 is not a type variable
3027	STRING STORE ERROR: cannot translate internal id (?0) to string
=ENDDOC
=DOC
val ⦏is_vartype⦎ : TYPE -> bool;
=DESCRIBE
Return true only when the type is a type variable, and false otherwise: no exceptions can be raised.
If the argument isn't a type variable then it must be a compound type.
=ENDDOC
\subsubsection{Function Types}
The following functions should be used in preference to
the ``ctype'' functions when handling function types.
=DOC
val ⦏mk_→_type⦎ : (TYPE * TYPE) -> TYPE;
=DESCRIBE
Create a function type from two types.
A function type is just a kind of compound type.
=GFT Definition
mk_→_type (ⓣty1⌝, ⓣty2⌝) =
	mk_ctype("→",[ⓣty1⌝,ⓣty2⌝]) = ⓣty1 → ty2⌝
=TEX
=ENDDOC
=DOC
val ⦏dest_→_type⦎ : TYPE -> (TYPE * TYPE);
=DESCRIBE
Extract the two constituent types of a function type.
=GFT Definition
dest_→_type ⓣty1 → ty2⌝ = (ⓣty1⌝, ⓣty2⌝)
=TEX
=FAILURE
3022	?0 is not of form: ⓣty1 → ty2⌝
=ENDDOC
=DOC
val ⦏is_→_type⦎ : TYPE -> bool;
=DESCRIBE
Return true only when the type is a function type, i.e. of form  $ⓣty1\ →\ ty2⌝$, and false otherwise: no exceptions can be raised.
=ENDDOC
\subsection{Functions Upon the Type $TYPE$}
=DOC
val ⦏inst_type⦎ : ((TYPE * TYPE) list) -> TYPE -> TYPE;
=DESCRIBE
$inst\_type$ $alist$ $type$ recursively descends through $type$, replacing any type variables by whatever the association list $alist$ associates with them.
If the association list does not contain a type variable found in $type$, then that type variable will not be changed.
Replaced types are {\bf not} recursively processed by this function.
=FAILURE
3019	?0 is not a type variable
=ENDDOC
=DOC
val ⦏type_tycons⦎ : TYPE -> (string * int) list;
=DESCRIBE
This returns a list of names of type constructors, and the arity of their use, within a type.
=ENDDOC
=DOC
val ⦏type_tyvars⦎ : TYPE -> string list;
=DESCRIBE
Returns the list of type variable names present in a type.
=ENDDOC
=DOC
val ⦏type_any⦎ : (TYPE -> bool) -> TYPE -> bool;
=DESCRIBE
Given a predicate on types, tests to see if any sub-type of some type (or the type itself) satisfies the predicate.
The search ceases on the first satisfaction, rather than all the
tests being done and the results combined.
=ENDDOC
=DOC
val ⦏type_map⦎ : (TYPE -> TYPE) -> TYPE -> TYPE;
=DESCRIBE
$type\_map$ $tyfun$ $ty$ traverses
$ty$ (breadth first) looking for subtypes, $st$, for which
the application $tyfun\,st$ does not fail and replaces
such subtypes with $tyfun\,st$.
It does not traverse the resulting subtypes.
=ENDDOC
We unconventionally use an upper case name for the following
to avoid confusion with the ML type constructor $bool$,
and match the HOL type constructor name.
=DOC
val ⦏BOOL⦎ : TYPE;
=DESCRIBE
The HOL type of truth values:
=GFT Definition
val BOOL = ⓣBOOL⌝;
=TEX
=SEEALSO
Theory ``min''.
=ENDDOC
=TEX
\subsection{The Types $TERM$ and $DEST\_SIMPLE\_TERM$}
=DOC
eqtype ⦏TERM⦎;
=DESCRIBE
This is the type of well-formed HOL terms.
Objects of this type are manipulated by term constructor, destructor and recogniser functions, such as $mk\_app$, $dest\_λ$ and $is\_var$.
=ENDDOC

=DOC
val ⦏=$⦎ : (TERM * TERM) -> bool;
=DESCRIBE
This is the (infix) equality test for HOL terms.
It is retained for backwards compatibility --- the type of HOL terms is now an equality type.

Instead of equality it is often preferable to test for
$α$-convertibility, using
=INLINEFT
~=$
=TEX
=ENDDOC
=DOC
datatype ⦏DEST_SIMPLE_TERM⦎ =
	⦏Var⦎ of string * TYPE
|	⦏Const⦎ of string * TYPE
|	⦏App⦎ of TERM * TERM
|	⦏Simpleλ⦎ of TERM * TERM;
=DESCRIBE
This is the simple type of destroyed terms, related to the type $TERM$ by
$dest\_simple\_term$(q.v.) and $mk\_simple\_term$(q.v.).
The four value constructors represented destroyed variables, constants, applications and simple $λ$-abstractions respectively.
=USES
In writing pattern-matching functions upon HOL terms.
=SEEALSO
$DEST\_TERM$.
=ENDDOC
\subsection{Primitive Functions Upon Terms}
=DOC
val ⦏dest_simple_term⦎ : TERM -> DEST_SIMPLE_TERM;
=DESCRIBE
An injective function, that destroys a term, returning its
top-level structure, and the associated constituent parts.
=SEEALSO
$DEST\_SIMPLE\_TERM$
=ENDDOC
=DOC
val ⦏mk_simple_term⦎ : DEST_SIMPLE_TERM -> TERM;
=DESCRIBE
Create a well-formed TERM from a statement of a top-level structure, and the associated constituent parts.

It makes the same checks as $mk\_const$, $mk\_app$, etc(q.v.),
and gives the same error messages as these if there is a failure.
=SEEALSO
$DEST\_SIMPLE\_TERM$
=FAILURE
3005	Cannot apply ?0 to ?1 as types are incompatible
3006	Type of ?0 not of form ⓣty1 → ty2⌝
3007	?0 is not a term variable
=ENDDOC
=DOC
val ⦏type_of⦎ : TERM -> TYPE;
=DESCRIBE
This gives the HOL type of a term.
=ENDDOC
\subsection{Primitive Constructors and Destructors of the type $TERM$}
\subsubsection{Term Variables}
=DOC
val ⦏mk_var⦎ : (string * TYPE) -> TERM;
=DESCRIBE
This produces a term variable.

The function makes no checks against the declaration of the subtypes of the type supplied.
=GFT Definition
mk_var("v",ⓣty⌝) = ⌜v : ty⌝
=TEX
=ENDDOC
=DOC
val ⦏dest_var⦎: TERM -> (string * TYPE);
=DESCRIBE
This destroys a term variable into its name and type.
=FAILURE
3007	?0 is not a term variable
=ENDDOC
=DOC
val ⦏is_var⦎ : TERM -> bool;
=DESCRIBE
Return true only when the term is a variable, and false otherwise: no exceptions can be raised.
=ENDDOC
\subsubsection{Constants}
=DOC
val ⦏mk_const⦎ : (string * TYPE) -> TERM;
=DESCRIBE
This produces a constant.
=GFT Definition
mk_const("c",ⓣty⌝) = ⌜c : ty⌝
=TEX

The function makes no checks against the declaration of the constant, the declaration of the type constructors of the type supplied, or the appropriateness of the type supplied: see $get\_const\_info$ (q.v.).
However it will not form constants whose types clash with those constants required by the implementation of the abstract data type $THM$ (q.v.).
These are $=$, $⇒$, $∀$, and $∃$.
=FAILURE
3002	Type of constant with name "=" must be of form:⌜ty1 → ty1 → BOOL⌝
3003	Type of constant with name "⇒" must be of form:⌜BOOL → BOOL → BOOL⌝
3004	Type of constant with name ?0 must be of form:⌜(ty1 → BOOL) → BOOL⌝
=ENDDOC
=DOC
val ⦏dest_const⦎: TERM -> (string * TYPE);
=DESCRIBE
This destroys a constant into its name and type.
=FAILURE
3009	?0 is not a constant
=ENDDOC
=DOC
val ⦏is_const⦎ : TERM -> bool;
=DESCRIBE
Return true only when the term is a constant, and false otherwise: no exceptions can be raised.
Note that even if the constant has not been declared,
or has an inappropriate type it will still satisfy this predicate.
=ENDDOC
=DOC
val ⦏key_mk_const⦎ : (E_KEY * TYPE) -> TERM;
val ⦏key_dest_const⦎ : TERM -> E_KEY * TYPE;
=DESCRIBE
Internally, the names of constants are represented using efficient dictionary keys.
These functions allow the creation and destruction of constants by key rather than by name.
=ENDDOC
\subsubsection{Applications}
=DOC
val ⦏mk_app⦎ : (TERM * TERM) -> TERM;
=DESCRIBE
This produces a function application.
=GFT Definition
mk_app (⌜f⌝, ⌜t⌝) = ⌜f t⌝
=TEX
Note that many derived term constructs, e.g. all quantifications,
are also applications.
Thus
=GFT Example
mk_app (⌜$∀⌝, ⌜λ x ⦁ t⌝) = ⌜∀ x ⦁ t⌝
=TEX
=FAILURE
3005	Cannot apply ?0 to ?1 as types are incompatible
3006	Type of ?0 not of form ⓣty1 → ty2⌝
=ENDDOC
The uses of this function in the parser, etc, should catch
this functions error messages, and give more meaningful ones.
=DOC
val ⦏dest_app⦎: TERM -> (TERM * TERM);
=DESCRIBE
Destroys a function application into the function and argument.
Note that many derived term constructs, e.g. all quantifications,
are also applications.
=GFT Definition
dest_app ⌜f t⌝ = (⌜f⌝, ⌜t⌝)
dest_app ⌜∀ x ⦁ t⌝ = (⌜$∀⌝, ⌜λ x ⦁ t⌝)
=TEX
=FAILURE
3010	?0 is not of form: ⌜t1 t2⌝
=ENDDOC
=DOC
val ⦏is_app⦎ : TERM -> bool;
=DESCRIBE
Return true only when the term is a function application
(i.e. of form
=INLINEFT
⌜f x⌝
=TEX
{}), and false otherwise: no exceptions can be raised.
Note that many derived term constructs, e.g. all quantifications,
are also applications.
Thus
=INLINEFT
is_app ⌜∀ x ⦁ t⌝
=TEX
{} will return $true$.
=ENDDOC
=DOC
val ⦏list_mk_app⦎ : (TERM * TERM list) -> TERM;
=DESCRIBE
Applies a function to multiple arguments.
=GFT Definition
list_mk_app (⌜t⌝, [⌜t1⌝,⌜t2⌝,⌜t3⌝,...]) = ⌜t t1 t2 t3 ...⌝
=TEX
=FAILUREC
\paragraph{Failure}
May give rise to the error message from $mk\_app$.
=ENDDOC
=DOC
val ⦏strip_app⦎ : TERM -> TERM * TERM list;
=DESCRIBE
Splits a term into a head term, that is not an application, and the list of argument terms, if any, to which that head term was applied.
=EXAMPLE
strip_app ⌜t t1 t2 t3 ...⌝ = (⌜t⌝, [⌜t1⌝,⌜t2⌝,⌜t3⌝,...])
strip_app ⌜T⌝ = (⌜T⌝,[])
=ENDDOC
\subsubsection{Simple λ-abstractions}
As noted in the terminology, ``simple'' is used to denote the
abstraction of a variable from a term.
=DOC
val ⦏mk_simple_λ⦎ : (TERM * TERM) -> TERM;
=DESCRIBE
This produces a simple $λ$-abstraction.
It may only abstract variables.
=GFT Definition
mk_simple_λ (⌜v⌝, ⌜t⌝) = ⌜λ v ⦁ t⌝
=TEX
=SEEALSO
$mk\_λ$
=FAILURE
3007	?0 is not a term variable
=ENDDOC
=DOC
val ⦏dest_simple_λ⦎: TERM -> (TERM * TERM);
=DESCRIBE
Destroys a simple $λ$-abstraction.
It cannot destroy paired $λ$-abstractions, being a inverse of $mk\_simple\_λ$.
=GFT Definition
dest_simple_λ ⌜λ v ⦁ t⌝ = (⌜v⌝, ⌜t⌝)
=TEX
=SEEALSO
$dest\_λ$
=FAILURE
3011	?0 is not of form: ⌜λ var ⦁ t⌝
=ENDDOC
=DOC
val ⦏is_simple_λ⦎ : TERM -> bool;
=DESCRIBE
Is the term a simple $λ$-abstraction
(i.e. of form
=INLINEFT
⌜λ x ⦁ t⌝
=TEX
{}).
=SEEALSO
$is\_λ$
=ENDDOC
=DOC
val ⦏list_mk_simple_λ⦎ : (TERM list * TERM) -> TERM;
=DESCRIBE
$λ$-abstract a list of variables from a term.
=GFT Definition
list_mk_simple_λ ([⌜x1⌝,⌜x2⌝,...],⌜t⌝) = ⌜λ x1 x2 ... ⦁ t⌝
=TEX
This function will be implemented using $mk\_simple\_λ$(q.v.), not $mk\_λ$.
=SEEALSO
$list\_mk\_λ$
=FAILUREC
\paragraph{Failure}
May give rise to the error message from $mk\_simple\_λ$.
=ENDDOC
\subsection{Functions Upon Terms}
=DOC
val ⦏frees⦎ : TERM -> TERM list;
=DESCRIBE
Extract the free term variables within the term argument.
The resulting variables will be in reverse order of first occurrence
(for a term viewed without fixity properties, such as infix variables).
=SEEALSO
$dest\_frees$
=ENDDOC
=DOC
val ⦏is_free_var_in⦎ : (string * TYPE) -> TERM -> bool;
=DESCRIBE
Given a destroyed term variable, return true only when it is free within the term supplied as a second argument, and false otherwise: no exceptions can be raised.
=ENDDOC
\subsection{Generic Derived Term Structure Functions}
The following functions are provided to give a standard, generic, approach
to implementing various derived term manipulation functions.
For instance, the functions of section \ref{SpecificFunctions} will usually
be implemented by just a call to one of these functions.

A performance issue arises with the destructor functions for
derived term constructors: need they test the types of constants?
We do not make this test, and thus might give the ``wrong''
results with ill-formed terms.
It is not necessary to worry about this if we are only concerned about
saved theorems, etc, as these are checked for well-formedness of their constituents.
In addition, the constants required to implement the abstract data type $THM$ cannot occur with incorrect types, by
the mechanism of $mk\_const$.
Apart from this, some misleading results on handling terms could occur,
but no inconsistency arises.

\subsubsection{Generic Binary Operators}
=DOC
val ⦏mk_bin_op⦎ : string -> int -> int -> (TYPE -> TYPE -> TERM) ->
	(TERM * TERM) -> TERM;
=DESCRIBE
$mk\_bin\_op$ $area$ $msg1$ $msg2$ $rator\_fn$ $(t_1, t_2)$ attempts to form $⌜t_1\ rator\ t_2⌝$.
$rator'$ is gained by applying $rator\-\_fn$ to the types of $t_1$ and $t_2$.
=EXAMPLE
mk_bin_op "mk_∧" 3031 3015 (fn _ => fn _ => ⌜$∧⌝) (⌜a⌝, ⌜b⌝) = ⌜a ∧ b⌝
=FAILUREC
\paragraph{Failure}
The failure message for failing to apply $rator$ to
the first term will be from area $area$, and will have the text indexed by $msg1$, with the two terms as strings for arguments.
If the failure is from applying the rators plus first term to the second term the error message will be from area $area$, and will have the text indexed by $msg2$, with the two terms as strings for arguments.
It is not unusual for one of these strings of terms to be thrown away by the message $msg2$ provided by the caller of this function.
=ENDDOC
=DOC
val ⦏dest_bin_op⦎ : string -> int -> string -> TERM -> (TERM * TERM);
=DESCRIBE
$dest\_bin\_op$ $area$ $msg$ $rator\_nm$ $term$ first assumes that $term$ is of the form $⌜rator\ t1\ t2⌝$, where $rator$ is
a constant with name $rator\_nm$, and attempts to return the pair $(t1, t2)$.
=EXAMPLE
dest_bin_op "dest_∧" 4032 "∧" ⌜a ∧ b⌝ = (⌜a⌝, ⌜b⌝)
=FAILUREC
If the function fails it will fail with message $msg$, area $area$ and with the string form of $term$.
=ENDDOC
=DOC
val ⦏is_bin_op⦎ : string -> TERM -> bool;
=DESCRIBE
$is\_bin\_op$ $rator\_nm$ $term$ returns true iff. $term$ is of the form ⌜rator\ t1\ t2⌝, and $rator$ is
a constant with name $rator\_nm$.
It cannot raise an exception.
=EXAMPLE
is_bin_op "∧" ⌜a ∧ b⌝ = true
=ENDDOC
=DOC
val ⦏list_mk_bin_op⦎ : string -> int -> int ->
	(TYPE -> TYPE -> TERM) -> TERM list -> TERM;
=DESCRIBE
This function combines a list of terms using the given operator, as if by $mk\_bin\_op$ (q.v.).
Notice the bracketing in the example.
=EXAMPLE
list_mk_bin_op area msg ∧_fun [⌜a⌝, ⌜b ∧ c⌝, ⌜d⌝] =
		⌜a ∧ ((b ∧ c) ∧ d)⌝
=TEX
where $∧\_fun$ takes two (dummy) arguments and returns ⌜\$∧⌝.
=FAILURE
3017	An empty list argument is not allowed
=FAILUREC
\paragraph{Failure}
The failure message for failing to combine its arguments will be as $mk\_bin\_op$ for the offending two arguments.
If given an empty list the error will be from area $area$, but with message 3017.
=ENDDOC
=DOC
val ⦏strip_bin_op⦎ : string -> TERM -> TERM list
=DESCRIBE
This function strips a binary operator, attempting to destroy its term argument, and recursively stripping to the right,
as if by $dest\_bin\_op$.
A term not formed from the operator is returned unchanged,
as a singleton list.
=EXAMPLE
strip_bin_op "∧" ⌜a ∧ (b ∧ c) ∧ d⌝ = [⌜a⌝, ⌜b ∧ c⌝, ⌜d⌝]
=ENDDOC
=DOC
val ⦏bin_bool_op⦎ : string -> TYPE -> TYPE -> TERM;
=DESCRIBE
Returns a constant with the given name, and type
\[ⓣBOOL\ →\ BOOL\ →\ BOOL⌝\]
The type arguments are dummies, present only to make the function
have an acceptable signature for certain other functions.
=ENDDOC
\subsubsection{Generic Unary Operator Functions}
=DOC
val ⦏mk_mon_op⦎ : string -> int -> (TYPE -> TERM) ->
	TERM -> TERM;
=DESCRIBE
$mk\_mon\_op$ $area$ $msg$ $rator\_fn$ $⌜rand⌝$ attempts to form the term $⌜rator\ rand⌝$.
$⌜rator⌝$ is gained by applying $rator\_fn$ to the type of $⌜rand⌝$.
=EXAMPLE
mk_mon_op "mk_¬" 3031 (fn _ => ⌜$¬⌝) ⌜t:BOOL⌝ = ⌜¬ t⌝
=FAILUREC
\paragraph{Failure}
The failure message for failing to apply $rator$ to its arguments will be from area $area$, and will have the text indexed by $msg$.
=ENDDOC
=DOC
val ⦏dest_mon_op⦎ : string -> int -> string -> TERM -> TERM;
=DESCRIBE
$dest\_mon\_op$ $area$ $msg$ $rator\_nm$ $term$ assumes that $term$ is of the form $⌜rator\ t⌝$, where
$rator$ is a constant with name $rator\_nm$, and the function attempts to return $t$.
=EXAMPLE
dest_mon_op "dest_¬" 4029 "¬" ⌜¬ t⌝ = ⌜t⌝
=FAILUREC
\paragraph{Failure}
The failure message for failing to destroy the term will be from area $area$, and will have the text indexed by $msg$, and will have as argument the string form of $term$.
=ENDDOC
=DOC
val ⦏is_mon_op⦎ : string -> TERM -> bool;
=DESCRIBE
$is\_mon\_op$ $rator\_nm$ $term$ returns true iff. $term$ is of the form $rator\ t$, where
$rator$ is a constant with name $rator\_nm$.
It cannot raise an exception.
=EXAMPLE
is_mon_op "¬" ⌜¬ t⌝ = ⌜t⌝
=ENDDOC
\subsubsection{Generic Simple Abstraction Functions}
=DOC
val ⦏mk_simple_binder⦎ : string -> int -> (TYPE -> TYPE -> TERM) ->
	(TERM * TERM) -> TERM;
=DESCRIBE
$mk\_simple\_binder$ $area$ $msg$ $binder\_fn$ $(var,\ body)$ generates the term:
\[⌜binder(λ var\ ⦁\ body)⌝\] where $binder$ is $binder\_fn$ applied to the types of $var$ and $body$.
$var$ must be a term variable.
=SEEALSO
$mk\_binder$
=FAILURE
3007	?0 is not a term variable
=FAILUREC
\paragraph{Failure}
If the term cannot be made, then the error will be from $area$, with a message indexed by $msg$, and the two terms as string arguments.
If the first of the pair of terms is not a variable then
error 3007 will be given from area $area$.
=ENDDOC
=DOC
val ⦏dest_simple_binder⦎ : string -> int -> string -> TERM -> TERM * TERM;
=DESCRIBE
Executing $dest\_simple\_binder$ $area$ $msg$ $binder\_nm$ $⌜binder(λ\ var\ ⦁\ body)⌝$, where $binder$ is a constant with the name $binder\_nm$,
will give $(⌜var⌝,\ ⌜body⌝)$.
=EXAMPLE
dest_simple_binder "dest_simple_∀" 3032  "∀" ⌜∀ x ⦁ t⌝ = (⌜x⌝,⌜t⌝)
=SEEALSO
$dest\_binder$
=FAILUREC
\paragraph{Failure}
If the term cannot be destroyed, then the error will be from $area$, with a message indexed by $msg$,
and argument the string form of $term$.
=ENDDOC
=DOC
val ⦏is_simple_binder⦎ : string -> TERM -> bool;
=DESCRIBE
$is\_simple\_binder$ $binder\_nm$ $term$ returns true iff. {} argument
$term$ is of the form $⌜binder(λ\ var\ ⦁\ body)⌝$, where $binder$ is a
constant with the name $binder\_nm$.
=SEEALSO
$is\_binder$
=ENDDOC
See \cite{DS/FMU/IED/DTD004} for a list binder constructor,
$list\_mk\_binder$ suitable for both simple and paired abstractions, and $strip\_simple\_binder$.
=DOC
val ⦏quantifier⦎ : string -> TYPE -> TYPE -> TERM;
=DESCRIBE
$quantifier$ $name$ $type$ $dummy$ returns a constant, with the given name, and type $ⓣ (type → BOOL) → BOOL⌝$,
This is an appropriate type for binders.
The dummy is present only to make the function
have an acceptable signature for certain other functions.
=ENDDOC
\subsection{Specific Derived Term Structure Functions}
\label{SpecificFunctions}
\subsubsection{Equations}
=DOC
val ⦏equality⦎ : TYPE -> TYPE -> TERM;
=DESCRIBE
Returns the constant $⌜\$=⌝$
 upon terms with the first type argument.
The second type is a dummy argument, present only to make the function
have an acceptable signature for certain other functions.
=ENDDOC
=DOC
val ⦏mk_eq⦎ : (TERM * TERM) -> TERM;
=DESCRIBE
A derived term constructor function for generating equations.
=GFT Definition
mk_eq (⌜a⌝,⌜b⌝) = ⌜a = b⌝
mk_eq (⌜a:BOOL⌝,⌜b:BOOL) = ⌜a ⇔ b⌝
=TEX
=FAILURE
3012	?0 and ?1 do not have the same types
=ENDDOC
=DOC
val ⦏dest_eq⦎ : TERM -> (TERM * TERM);
=DESCRIBE
A derived term destructor function for equations.
=GFT Definition
dest_eq ⌜a = b⌝ = (⌜a⌝,⌜b⌝)
dest_eq ⌜a ⇔ b⌝ = (⌜a⌝,⌜b⌝)
=TEX
=FAILURE
3014	?0 is not of form: ⌜t = u⌝
=ENDDOC
=DOC
val ⦏is_eq⦎ : TERM -> bool;
=DESCRIBE
Return true only when the term is an equation
(i.e. of form
=INLINEFT
⌜a = b⌝
=TEX
or
=INLINEFT
⌜a ⇔ b⌝
=TEX
{}), and false otherwise: no exceptions can be raised.
=ENDDOC
\subsubsection{Implications}
=DOC
val ⦏mk_⇒⦎ : (TERM * TERM) -> TERM;
=DESCRIBE
A derived term constructor function for generating implications.
It takes two arguments: the antecedent and the consequent.
=GFT Definition
mk_⇒ (⌜a⌝,⌜b⌝) = ⌜a ⇒ b⌝
=TEX
=FAILURE
3015	?1 is not of type ⓣBOOL⌝
3031	?0 is not of type ⓣBOOL⌝
=ENDDOC
Message 3015, when processed, throws away its first argument:
this is so because of the implementation of $mk\_bin\_op$.
Where it is used as a message elsewhere it will again be because of generic term construction functions.
=DOC
val ⦏dest_⇒⦎ : TERM -> (TERM * TERM);
=DESCRIBE
A derived term destructor function for implications,
returning the antecedent and consequent.
=GFT Definition
dest_⇒ ⌜a ⇒ b⌝ = (⌜a⌝,⌜b⌝)
=TEX
=FAILURE
3016	?0 is not of form: ⌜t ⇒ u⌝
=ENDDOC
=DOC
val ⦏is_⇒⦎ : TERM -> bool;
=DESCRIBE
Return true only when the term is an implication
(i.e. of form
=INLINEFT
⌜a ⇒ b⌝
=TEX
{}), and false otherwise: no exceptions can be raised.
=ENDDOC
The following could alternatively, and with equal merit, have the signature $:(TERM\ list)*\ TERM$ $->\ TERM$.
=DOC
val ⦏list_mk_⇒⦎ : TERM list -> TERM;
=DESCRIBE
Makes a multiple implication term, using $mk\_⇒$ (q.v.).
=GFT Definition
list_mk_⇒ [⌜t1⌝,⌜t2⌝,...,⌜tn⌝] = ⌜t1 ⇒ t2 ⇒ ... ⇒ tn⌝
=TEX
Note that giving a singleton list containing a non-boolean will return that term, rather than fail.
=FAILURE
3015	?1 is not of type ⓣBOOL⌝
3017	An empty list argument is not allowed
3031	?0 is not of type ⓣBOOL⌝
=ENDDOC
The following could alternatively have the signature $:TERM$ $->\ (TERM\ list)\ *\ TERM$, if it matched a change in $list\_mk\_⇒$.
=DOC
val ⦏strip_⇒⦎ : TERM -> TERM list;
=DESCRIBE
Strip a multiple implication into a list of antecedents appended to the singleton list of the innermost consequent.
=GFT Definition
strip_⇒  ⌜t1 ⇒ t2 ⇒ ... ⇒ tn⌝ = [⌜t1⌝,⌜t2⌝,...⌜tn⌝]
=TEX
Note that stripping a non-boolean will result in a singleton list containing that term, not a fail.
=ENDDOC
\subsubsection{Simple ∀-terms}
=DOC
val ⦏mk_simple_∀⦎ : (TERM * TERM) -> TERM;
=DESCRIBE
A derived term constructor function for generating simple $∀$-terms.
=GFT Definition
mk_simple_∀ (⌜var⌝, ⌜body⌝) = ⌜∀ var ⦁ body⌝
=TEX
$var$ must be a term variable.
=SEEALSO
$mk\_∀$
=FAILURE
3007	?0 is not a term variable
3015	?1 is not of type ⓣBOOL⌝
=ENDDOC
=DOC
val ⦏dest_simple_∀⦎ : TERM -> (TERM * TERM);
=DESCRIBE
A derived term destructor function for $∀$-terms.
It cannot destroy paired abstraction $∀$-terms, being the inverse of $mk\_simple\_∀$.
=GFT Definition
dest_simple_∀ ⌜∀ var ⦁ body⌝ = (⌜var⌝, ⌜body⌝)
=TEX
=SEEALSO
$dest\_∀$
=FAILURE
3032	?0 is not of form: ⌜∀ var ⦁ body⌝
=ENDDOC
=DOC
val ⦏is_simple_∀⦎ : TERM -> bool;
=DESCRIBE
A derived term test for simple $∀$-terms
(i.e. of form
=INLINEFT
⌜∀ x ⦁ t⌝
=TEX
{}), not formed with paired abstractions.
=SEEALSO
$is\_∀$
=ENDDOC
=DOC
val ⦏list_mk_simple_∀⦎ : TERM list * TERM -> TERM;
=DESCRIBE
Universally quantify a term with a list of variables.
=GFT Definition
list_mk_simple_∀ ([⌜x1⌝,⌜x2⌝,...], ⌜body⌝) = ⌜∀ x1 x2 ... ⦁ body⌝
=TEX
This uses $mk\_simple\_∀$ (q.v.) to generate its result.
Note that giving an empty list paired with a non-boolean will return that term, rather than fail.
=SEEALSO
$list\_mk\_∀$
=FAILUREC
\paragraph{Failure}
This may give $mk\_simple\_∀$ error messages.
=ENDDOC
\subsubsection{Simple ∃-terms}
=DOC
val ⦏mk_simple_∃⦎ : (TERM * TERM) -> TERM;
=DESCRIBE
A derived term constructor function for generating simple $∃$-terms.
=GFT Definition
mk_simple_∃ (⌜var⌝, ⌜body⌝) = ⌜∃ var ⦁ body⌝
=TEX
$var$ must be a term variable.
=SEEALSO
$mk\_∃$
=FAILURE
3007	?0 is not a term variable
3015	?1 is not of type ⓣBOOL⌝
=ENDDOC
=DOC
val ⦏dest_simple_∃⦎ : TERM -> (TERM * TERM);
=DESCRIBE
A derived term destructor function for $∃$-terms.
It cannot destroy paired abstraction $∃$-terms, being the inverse of $mk\_simple\_∃$.
=GFT Definition
dest_simple_∃ ⌜∃ var ⦁ body⌝ = (⌜var⌝, ⌜body⌝)
=TEX
=SEEALSO
$dest\_∃$
=FAILURE
3034	?0 is not of form: ⌜∃ var ⦁ body⌝
=ENDDOC
=DOC
val ⦏is_simple_∃⦎ : TERM -> bool;
=DESCRIBE
A derived term test for  $∃$-terms
(i.e. of form
=INLINEFT
⌜∃ x ⦁ t⌝
=TEX
{}), not formed with paired abstractions.
=SEEALSO
$is\_∃$
=ENDDOC
=DOC
val ⦏list_mk_simple_∃⦎ : TERM list * TERM -> TERM;
=DESCRIBE
Existentially quantify a term with a list of variables.
=GFT Definition
list_mk_simple_∃ ([⌜x1⌝,⌜x2⌝,...], ⌜body⌝) = ⌜∃ x1 x2 ... ⦁ body⌝
=TEX
This uses $mk\_simple\_∃$ (q.v.) to generate its result.
Note that giving an empty list paired with a non-boolean will return that term, rather than fail.
=SEEALSO
$list\_mk\_∃$
=FAILUREC
\paragraph{Failure}
This may give $mk\_simple\_∃$ error messages.
=ENDDOC
\subsection{Literals}
There are three types of literal: numbers, strings and characters.
\subsubsection{Numeric Literals}

The representation of numeric literals is by HOL constants whose type
is $ⓣℕ⌝$ and where the string component of the constant is entirely
decimal digits, the digits being the decimal representation of the
literal.

=DOC
val ⦏ℕ⦎ : TYPE;
=DESCRIBE
This is the HOL type of the natural numbers, $0, 1, \ldots$.
=GFT Definition
val ℕ = ⓣℕ⌝;
=TEX
=SEEALSO
Theory ``$ℕ$''.
=ENDDOC
=DOC
val ⦏mk_ℕ⦎ : INTEGER -> TERM;
=DESCRIBE
Construct a numeric literal: the argument may not be negative.
=EXAMPLE
mk_ℕ 5 = ⌜5⌝
=FAILURE
3021	?0 should be 0 or positive
=ENDDOC
=DOC
val ⦏dest_ℕ⦎ : TERM -> INTEGER;
=DESCRIBE
Destroy a numeric literal.
=EXAMPLE
dest_ℕ ⌜5⌝ = 5;
=FAILURE
3026	?0 is not a numeric literal
=ENDDOC
=DOC
val ⦏is_ℕ⦎ : TERM -> bool;
=DESCRIBE
Return true only when the term is a numeric literal (e.g. $⌜5⌝$), and false otherwise: no exceptions can be raised.
=ENDDOC
\subsubsection{Character Literals}

Character literals are represented by HOL constants of type $ⓣCHAR⌝$.
where the string component of the constant is exactly two characters
long, the first being the back-quotation~(~`~) and the second the
character itself.  The back-quotation~(~`~) is chosen as it is used in
the concrete syntax representation of character literals.

The construction and destruction functions have as argument and result
(respectively) a string holding a single character.  The back-quotation
is intended for use only in the internal representation of character
literals.  However, the internal representation will be returned by, e.g., a
call of $(simple\_)dest\_term$.

We unconventionally use an upper case name for the following
to match the treatment of ML variable $STRING$.
=DOC
val ⦏CHAR⦎ : TYPE;
=DESCRIBE
This is the HOL type of single characters.
=GFT Definition
val CHAR = ⓣCHAR⌝;
=TEX
=SEEALSO
Theory ``char''.
=ENDDOC
=DOC
val ⦏mk_char⦎ : string -> TERM;
=DESCRIBE
Construct a character literal.
=EXAMPLE
mk_char "a" = ⌜`a`⌝
=FAILURE
3023	String ?0 is not a single character
=ENDDOC
=DOC
val ⦏dest_char⦎ : TERM -> string;
=DESCRIBE
Destroy a character literal.
=EXAMPLE
dest_char ⌜`a`⌝ = "a"
=FAILURE
3024	?0 is not a character literal
=ENDDOC
=DOC
val ⦏is_char⦎ : TERM  -> bool;
=DESCRIBE
Return true only when the term is a character literal
(e.g.
=INLINEFT
⌜`a`⌝
=TEX
), and false otherwise: no exceptions can be raised.
=ENDDOC

\subsubsection{String Literals}

String literals are represented by HOL constants of type $ⓣSTRING⌝$
where the first character of string component of the constant is the
double-quote~(~{\tt"}~) and the remainder is the body of the string.
The double-quote~(~{\tt"}~) is chosen as it is used in the concrete
syntax representation of strings.

The construction and destruction functions have as argument and result
(respectively) the body of the string.  The double-quote is intended
for use only in the internal representation of strings.  However, the
internal representation will be returned by a call of,
e.g.
$(simple\_)dest\_term$.

We unconventionally use an upper case name for the following
to avoid confusion with the ML type constructor $string$,
and match the HOL type constructor name.
=DOC
val ⦏STRING⦎ : TYPE;
=DESCRIBE
This is the HOL type of strings, a type abbreviation for lists
of objects of type $CHAR$.
=GFT Definition
val STRING = ⓣCHAR LIST⌝;
=TEX
=SEEALSO
Theory ``char''.
=ENDDOC
=DOC
val ⦏mk_string⦎ : string -> TERM;
=DESCRIBE
Construct a string literal.
=EXAMPLE
mk_string "abc" = ⌜"abc"⌝
=ENDDOC
=DOC
val ⦏dest_string⦎ : TERM -> string;
=DESCRIBE
Destroy a string literal.
=EXAMPLE
dest_string ⌜"abc"⌝ = "abc"
=FAILURE
3025	?0 is not a string literal
=ENDDOC
=DOC
val ⦏is_string⦎ : TERM -> bool;
=DESCRIBE
Return true only when the term is a string literal
(e.g.
=INLINEFT
⌜"abc"⌝
=TEX
), and false otherwise: no exceptions can be raised.
=ENDDOC

\subsection{Other Term Functions}
=DOC
val ⦏~=$⦎ : (TERM * TERM) -> bool;
=DESCRIBE
An infix equality test that returns true only when its two term arguments are $α$-convertible, and false otherwise: no exceptions can be raised.
Equality of terms is gained by using
=INLINEFT
 =$
=TEX
=ENDDOC
=DOC
val ⦏set_variant_suffix⦎ : string -> string;
=DESCRIBE
Sets the string control $variant\-\_suffix$ used to create variant names in $string\-\_variant$ (q.v.) and its relatives.
The string is initially a single prime character.
The function returns the previous setting of the control.
=FAILURE
3028	string may not be empty
=ENDDOC
=DOC
val ⦏get_variant_suffix⦎ : unit -> string;
=DESCRIBE
Returns the string control $variant\_suffix$ used to create variant names in $string\_variant$ (q.v.) and its relatives.
The string is set by $set\_variant\_suffix$ (q.v.).
=ENDDOC
=DOC
val ⦏string_variant⦎ : string list -> string -> string;
val ⦏list_string_variant⦎ : string list -> string list -> string list;
=DESCRIBE
$string\_variant$ $vlist$ $name$ returns a string that is a different from any name in $vlist$.
Variants are formed by repeatedly appending the variant string(see $set\_variant\_string$) to the $name$.
Note that $string\_variant$ $[]$ $name$ gives $name$.

$list\_string\_variant$ $vlist$ $names$ returns a list of variants on the supplied $names$ that are different from each other and from any name in $vlist$. The variants are obtained by repeated use of $string\_variant$.
=USES
Somewhat faster than $variant$ if term variables are already destroyed, and their names and types are directly accessible.
=SEEALSO
$variant$
=ENDDOC
=DOC
val ⦏rename⦎ : (string * TYPE) -> string -> TERM -> TERM;
=DESCRIBE
$rename$ $(oname,\ type)$ $cname$ $term$ returns a term based on $term$, but with any free variables with name $oname$, and type $type$ renamed to $cname$.
=ENDDOC
=DOC
val ⦏term_types⦎ : TERM -> TYPE list;
=DESCRIBE
Gives a list of all the types of constants, variables or $λ$-abstraction variables within the term argument.
=ENDDOC
=DOC
val ⦏term_tyvars⦎ : TERM -> string list;
=DESCRIBE
Returns the list of type variable names present in types present within a term.
=ENDDOC
=DOC
val ⦏term_tycons⦎ : TERM -> (string * int) list;
=DESCRIBE
Returns the set of type constructors and their arity present in types present within a term
(represented as a list).
=ENDDOC
=DOC
val ⦏term_consts⦎ : TERM -> (string * TYPE) list;
=DESCRIBE
This function extracts the subterms of a term which
are constants, giving destroyed constants in each case
(duplicates are eliminated)
=ENDDOC
=DOC
val ⦏term_vars⦎ : TERM -> (string * TYPE) list;
=DESCRIBE
This function extracts the subterms of a term which
are variables (including abstraction variables), giving destroyed variables in each case.
=ENDDOC
=DOC
val ⦏type_match⦎ : TYPE -> TYPE -> (TYPE * TYPE)list;
=DESCRIBE
$type\_match$ $ty_1$ $ty_2$ attempts to match $ty_1$ with $ty_2$, i.e., to determine if $ty_1$ can be obtained from $ty_2$ by instantiating type variables.
If so, it returns a representation of the type
instantation as an association list suitable
for use as an argument to $inst\_type$ q.v.
Trivial (i.e. $(x,x)$) associations are not included.
For example:
=GFT
type_match ⓣ('a → ℕ) → 'b⌝ ⓣ'a → 'b⌝ = [(ⓣ'a → ℕ⌝, ⓣ'a⌝)];
=TEX
=SEEALSO
$ type\_match1$, $inst\_type$
=FAILURE
3053	?0 is not a type instance of ?1
=ENDDOC
=DOC
val ⦏type_match1⦎ : (TYPE * TYPE) list -> TYPE -> TYPE -> (TYPE * TYPE)list;
=DESCRIBE
$type\_match1$ is similar to $type\_match$, q.v., but has
an additional context parameter representing an instantiation; $type\_match1$ will fail unless the
supplied context can be extended to give the required match.
For example, the first line below evaluates true,
but the second fails.
=GFT
type_match1[(ⓣ'b⌝, ⓣ'b⌝)] ⓣ('a → ℕ) → 'b⌝ ⓣ'a → 'b⌝ = [(ⓣ'a → ℕ⌝, ⓣ'a⌝), (ⓣ'b⌝, ⓣ'b⌝)];
type_match1[(ⓣ'b → ℕ⌝, ⓣ'a⌝)] ⓣ('a → ℕ) → 'b⌝ ⓣ'a → 'b⌝;
=TEX
Trivial associations are included in the result so that they  can be passed as the context in subsequent calls.
The second element of each pair in the context must be a type variable.
=SEEALSO
$ type\_match$
=FAILURE
3055	?0 is not a type instance of ?1 in the supplied context
3019	?0 is not a type variable
=ENDDOC
=DOC
val ⦏term_match⦎ : TERM -> TERM -> (TYPE * TYPE) list * (TERM * TERM)list;
=DESCRIBE
$term\_match$ $tm_1$ $tm_2$ attempts to find if $tm_1$ is an instance of $tm_2$, up to $α$-convertibility.
If so, then it returns two lists.
The first gives the correspondence between types in $tm_1$ with type variables in $tm_2$.
The second gives the correspondence between (type instantiated) terms in $tm_1$ with free variables in $tm_2$.
Trivial (i.e. $(x,x)$) correspondences are not noted.
=FAILURE
3054	?0 is not a term instance of ?1
=ENDDOC
=DOC
val ⦏is_type_instance⦎ : TYPE -> TYPE -> bool;
=DESCRIBE
$is\_type\_instance$ $ty_1$ $ty_2$ returns true iff $ty_1$ is an instance of $ty_2$.
It cannot raise an exception.
=ENDDOC
=DOC
val ⦏gen_vars⦎ : TYPE list -> TERM list -> TERM list;
=DESCRIBE
$gen\_vars$ $tyl$ $tml$ generates a list of differently named term
variables, with the types in $tyl$, whose names are not present within any of the terms in $tml$ as variable names.

It will be much faster to make one call to this function with a list of types, than to make the equivalent number of individual calls.
=ENDDOC
=DOC
val ⦏variant⦎ : TERM list -> TERM -> TERM;
=DESCRIBE
$variant$ $stoplist$ $v$ returns a variant of variable $v$
whose name is not used for any variable in $stoplist$
(which must be only variables).
The variants are generated by sufficient appending of the variant string (see $set\_variant\_string$).
=FAILURE
3007	?0 is not a term variable
=SEEALSO
$string\_variant$, $list\_variant$
=ENDDOC
=DOC
val ⦏list_variant⦎ : TERM list -> TERM list -> TERM list;
=DESCRIBE
$list\_variant$ $stoplist$ $vlist$ returns a list of variants of the list of variables $vlist$, whose names are not present in the $stoplist$, which is also a list of term variables.
No names are duplicated, the function returning one new variable for each member of $vlist$.
The variants are generated by sufficient appending of the variant string (see $set\_variant\_string$).
=FAILURE
3007	?0 is not a term variable
=ENDDOC
=DOC
val ⦏is_free_in⦎ : TERM -> TERM -> bool;
=DESCRIBE
$is\_free\_in$ $v$ $term$ returns true iff. there is a free occurrence of $v$ in
$term$.
It will raise an exception if the first argument is not a term variable.
=FAILURE
3007	?0 is not a term variable
=ENDDOC
=DOC
val ⦏var_subst⦎ : (TERM * TERM) list -> TERM -> TERM;
=DESCRIBE
$var\_subst$ $alist$ $term$ returns the term formed by, for each pair in $alist$, substituting in $term$ all free instances of the term variable which is the second of the pair with the first of the pair.
The pair of the first matching term variable in the list will be used,
duplicates later in the list will be ignored.
Renaming may occur to prevent bound variable capture.

Note that the term variables must have the same types as the terms that are to replace them.
=GFT Definition
var_subst [(⌜t1⌝,⌜x1⌝),(⌜t2⌝,⌜x2⌝),...] ⌜t⌝ =
	⌜t[t1/x1, t2/x2,...]⌝
=TEX
=FAILURE
3007	?0 is not a term variable
3012	?0 and ?1 do not have the same types
=SEEALSO
$subst$
=ENDDOC
=DOC
val ⦏subst⦎ : (TERM * TERM) list -> TERM -> TERM;
=DESCRIBE
$subst$ $[(t_1, u_1), (t_2, u_2), \ldots]$ $t$ returns the term formed from $t$ by parallel substition of the $t_i$ for the $u_i$.
The $u_i$ can be variables or arbitrary terms but only ``free'' occurrences of a $u_i$ will be changed (i.e., only occurrences in which no free variable of $u_i$ becomes a bound variable in $t$).
Bound variables in $t$ are renamed as neccessary to prevent bound variable capture.

If some $u_i$ appears more than once in the substitution list, say $u_i = u_j$ for $i < j$, then the later pair $(t_j, u_j)$ is ignored.

$subst$ does not perform type instantiation: each $t_i$ must have the same type as the corresponding $u_i$..
=GFT Definition
subst [(⌜t⋎1⌝,⌜u⋎1⌝),(⌜t⋎2,⌜u⋎2⌝), ...] ⌜t⌝ = ⌜t[t⋎1/u⋎1, t⋎2/u⋎2, ...]⌝
=TEX
=SEEALSO
$var\_subst$
=FAILURE
3012	?0 and ?1 do not have the same types
=ENDDOC
=DOC
val ⦏term_map⦎ : ((TERM list) -> TERM -> TERM) -> TERM -> TERM;
=DESCRIBE
$term\_map$ $tmfun$ $tm$ traverses
$tm$ (breadth first) looking for subterms for which
the application $tmfun\,tm$ does not fail and replaces
such subterms with $tmfun\,tm$.
It does not traverse the resulting subterms.
$tmfun$ has as its first argument a list giving
the bound variables which are in scope at the point of use.
It does not attempt to apply $tmfun$ to a bound variable of an abstraction.
=ENDDOC
=DOC
val ⦏term_any⦎ : (TERM -> bool) -> TERM -> bool;
=DESCRIBE
Given a predicate on terms, tests to see if any sub-term of some term (or the term itself) satisfies the predicate.
The search ceases on the first satisfaction, rather than all the
tests being done and the results combined.
=ENDDOC
=DOC
val ⦏inst⦎ : TERM list -> (TYPE * TYPE) list -> TERM -> TERM;
=DESCRIBE
$inst$ $avlist$ $slist$ $term$ instantiates the type variables of $term$ with the associated types found in $slist$.
An element of $slist$ will be ($return$, $tv$),
where $tv$ is a type variable that is to be instantiated to $return$.
It will rename bound variables as necessary to prevent name capture problems.
It will also not allow free variables to become the same as those in the avoidance list, $avlist$, or to become bound.

It partially evaluates with two arguments.
=FAILURE
3007	?0 is not a term variable
3019	?0 is not a type variable
3020	Internal error in type instantiation (?0 would become bound)
=ENDDOC
\subsection{Sets of Terms Modulo α-convertibilty}.
=DOC
val ⦏term_mem⦎ : (TERM * TERM list) -> bool;
=DESCRIBE
Is the given term $α$-convertible to any term in the list?
An infix function.
=ENDDOC
=DOC
val ⦏term_less⦎ : (TERM list * TERM) -> TERM list;
=DESCRIBE
Remove any terms in the list that are $α$-convertible to the given term.
An infix function.
=ENDDOC
=DOC
val ⦏term_diff⦎ : (TERM list * TERM list) -> TERM list;
=DESCRIBE
Remove any terms in the first list that are $α$-convertible to any in the second.
An infix function.
=ENDDOC
=DOC
val ⦏term_grab⦎ : (TERM list * TERM) -> TERM list;
=DESCRIBE
If the given term is not $α$-convertible to any member of the list, then add it to the list.
An infix function.
=ENDDOC
=DOC
val ⦏term_union⦎ : (TERM list * TERM list) -> TERM list;
=DESCRIBE
Take the union of two term lists viewed as sets, removing any $α$-convertible duplicates.
An infix function.
=SEEALSO
$union$ for precise ordering of result.
=ENDDOC
=DOC
val ⦏list_term_union⦎ : (TERM list list) -> TERM list;
=DESCRIBE
Take the union of a number of lists of terms viewed as sets, removing any $α$-convertible duplicates.
=SEEALSO
$list\_union$ for precise ordering of result.
=ENDDOC

\subsection{Formatting and Failing With Terms and Types}
For SML'97, $makestring$ which supported $string\_of\_term$ and
$string\_of\_type$ is not available. We provide the following interfaces,
not intended for end user consumption to let us do without $makestring$.
$string\_of\_TTT$ picks up the function to do the printing from a variable
managed by $pp'set\_string\_of\_TTT$. This is initially set to
$pp'string\_of\_TTT$, which provides a very crude format. When the proper
pretty printer is available, it can be installed with $pp'set\_string\_of\_TTT$.
=SML
val ⦏pp'string_of_term⦎ : TERM -> string;
val ⦏pp'string_of_type⦎ : TYPE -> string;
val ⦏pp'set_string_of_term⦎ : (TERM -> string) -> (TERM -> string);
val ⦏pp'set_string_of_type⦎ : (TYPE -> string) -> (TYPE -> string);
=DOC
val ⦏string_of_term⦎ : TERM -> string;
=DESCRIBE
This returns a display of a term in the form of a string,
with no inserted new lines, suitable for use with $diag\_string$ and $fail$.
=SEEALSO
$format\_term$ is a formatted string display of a term.
=ENDDOC
=DOC
val ⦏string_of_type⦎ : TYPE -> string;
=DESCRIBE
This returns a display of a type in the form of a string,
with no inserted new lines, suitable for use with $diag\_string$ and $fail$.
=SEEALSO
$format\_type$ is a formatted string display of a type.
=ENDDOC
=DOC
val ⦏term_fail⦎ : string -> int -> TERM list -> 'a;
=DESCRIBE
$term\_fail$ $area$ $msg$ $tml$ first creates a list of functions from $unit$ to $string$, using $string\_of\_term$ (q.v.) providing displays of the list of terms.
It then calls $fail$ with the $area$, $msg$ and this list of functions.
This allows terms to be presented in error messages.
=ENDDOC
=DOC
val ⦏type_fail⦎ : string -> int -> TYPE list -> 'a;
=DESCRIBE
$type\_fail$ $area$ $msg$ $tyl$ first creates a list of functions from $unit$ to $string$, using $string\_of\_type$ (q.v.) providing displays of the list of types.
It then calls $fail$ with the $area$, $msg$ and this list of functions.
This allows types to be presented in error messages.
=ENDDOC

=SML
end(* signature of pp'TypesAndTerms *);
=TEX
\section{TEST POLICY}
In \cite{DS/FMU/IED/PLN008} there is a statement of the general principle of testing to be adopted.
This section gives some individual comments on special testing requirements for individual functions.

A key problem in the functions provided is to ensure that
free variable capture does not occur.
That is, due to some change, a variable that was free, becomes unintentionally bound.
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}



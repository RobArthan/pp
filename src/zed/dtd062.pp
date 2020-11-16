=IGN
********************************************************************************
dtd062.doc: this file is part of the PPZed system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
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

\def\Title{Detailed Design for the Z Type Inferrer}

\def\AbstractText{This document is the detailed design for a type inferrer for HOL/Z. It describes the type inference rules, and defines the data structure to which the rules apply.}

\def\Reference{DS/FMU/IED/DTD062}

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
%% LaTeX2e port: % TQtemplatetex
%% LaTeX2e port: \documentstyle[hol1,11pt,TQ]{article}
%% LaTeX2e port: %
%% LaTeX2e port: %	The following environment is used to
%% LaTeX2e port: %	display information required to compose error
%% LaTeX2e port: %	messages.
%% LaTeX2e port: %
%% LaTeX2e port: \newenvironment{designnote}{\paragraph{Design Note}\small\it\parindent 10pt
%% LaTeX2e port: \bgroup}{\egroup}
%% LaTeX2e port: 
%% LaTeX2e port: \makeindex
%% LaTeX2e port: % The following macro is used to insert temporary notes
%% LaTeX2e port: % in the document.
%% LaTeX2e port: \def\TempNote#1{{\tiny#1}}
%% LaTeX2e port: \TPPproject{FST PROJECT}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Detailed Design for the Z Type Inferrer}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/DTD062}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{1.31
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{2002/10/17 16:26:32
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}                    %% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{HOL, Z}
%% LaTeX2e port: \TPPauthor{D.J.~King&WIN01}
%% LaTeX2e port: %\TPPauthors{R.D.~Arthan&WIN01\\D.J.~King&WIN01\\G.T.~Scullard&MAN05}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & FMU Manager}
%% LaTeX2e port: \TPPabstract{This document is the detailed design for
%% LaTeX2e port: a type inferrer for HOL/Z. It describes the type inference
%% LaTeX2e port: rules, and defines the data structure to
%% LaTeX2e port: which the rules apply.}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: Library
%% LaTeX2e port: }}
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

\pagebreak
\section{DOCUMENT CONTROL}
\subsection{Contents List} \tableofcontents
\subsection{Document Cross References}\bibliographystyle{fmu}
\bibliography{fmu}
\subsection{Changes History}
\begin{description}
\item[Issue 1.19 (1992/07/24) (22 July 1992)] First draft since production of module tests.
\item[Issue 1.21 (1992/08/18)-23 (26 August 1992)] Added support for
sequences of binary relations.
\item[Issue 1.24 (1992/10/23) (23 October 1992)] Now sensitive to type inference context.
Fixed format of some messages.
\item[Issue 1.25 (1992/10/28) (27 October 1992)] New treatment of nested quotations.
\item[Issue 1.26 (1992/12/02),1.27 (1992/12/03) (2 December 1992)] New treatment of standard-ness.
Many minor fixes.
\item[Issue 1.28 (1999/02/16) (16th February 1999)] Update for SML'97.
\item[Issue 1.30 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.31 (2002/10/17)] PPZed-specific updates for open source release
\item[Issues 1.32 (2004/07/29), 1.33 (2004/08/08)] Added interface for term generation performance enhancements.
\item[Issue 1.34 (2005/08/05)] Liberalised schema quantification.
\item[Issue 1.35 (2005/09/09)] 𝔹 and 𝕊 now used in place of {\em BOOL} and {\em CHAR}..
\item[Issue 1.36 (2006/04/10)] Added {\em diag\_free\_vars} hook for the Compliance Tool.
\item[Issue 1.37 (2006/08/11)] Added error message for let expressions.
\item[Issue 1.38 (2010/04/01)] Support for empty schemas.
\item[Issue 1.39 (2011/07/11)] Error messages for predicate contexts.
\item[Issue 1.40 (2011/08/04)] Fixed bug with decorations in forming characteristic tuples.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported PPZed to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
None Known.
\pagebreak
\section{GENERAL}
\subsection{Scope}
This is the detailed design for a type inferrer for HOL/Z,
responding to the high level design for the Z user
interface \cite{DS/FMU/IED/HLD018}.
The implementation of this design is contained in
\cite{DS/FMU/IED/IMP062}.

\subsection{Introduction}

This document is organised as follows. The signature
declaration for the Z type inference module is introduced
at the end of the document.

In section \ref{InfRules}, the inference rules
are introduced and each is described in a fixed format:
\begin{description}
\item[Value Constructor]
The name and type of the value constructor describes the part of the
abstract syntax to which
the inference rule applies.
\item[Inference Rule(s)]
The type inference rules for each construct are expressed
in conventional notation.
\item[Description]
A description of the rules is provided, and any
issues relating to implementation are documented.
\item[Error Messages]
Example error messages which might be generated if application
of a particular rule fails, are shown as guidance to the
implementor.
\item[Error Codes]
The error codes, which correspond to parameterized
fragments of example error messages, are provided (They
are located deliberately in close proximity to their
respective examples to increase maintainability). This
subsection comprises another part of the
Standard ML literal script.
\end{description}

\subsubsection{Purpose and Background}

The type inferrer's job is to ensure that each of
these rules are obeyed in the process
of type checking a Z specification comprising
Z paragraphs interspersed with Z text.
A Correctly typed Z paragraph yields a paragraph decorated in the appropriate
places with types, and transformed according to the transformation rules described
in section \ref{transformations}.
An incorrectly typed Z paragraph yields error information in a datatype private
to the type inferrer. This can be displayed to the user in a formatted manner using
the interface $print\_z\_error$ provided by this module.

\subsubsection{Dependencies}
The signature for the Z type inferrer, $ZTypeInference$ requires
the signature $Unification$ and the modules which support the Z user
interface, $ZUserInterfaceSupport$
described in \cite{DS/FMU/IED/DTD014} and \cite{DS/FMU/IED/DTD079} respectively.

\subsubsection{Interface}
The interface to the Z type inferrer is intended to be
called only by the Z paragraph handling
routines, and is defined in the
signature $ZTypeInference$ introduced in section \ref{Signature}.

\subsubsection{Deficiencies}
There is no type variable representation of schemas, so that when a schema type is
inferred for some variable, other occurrences of that variable
do not acquire that type correctly since the information is not recorded in
the substitution function. For example, in the predicate, $p ∧ p = [x:ℤ]$, the type
of the first occurrence of $p$ is $'a$ and not $(ℤ) Z'S[x]$.

\subsubsection{Possible Enhancements}
Unification for binding types could be supported. This would be a costly to achieve
which is why this version of the type inferrer does not do it.

\section{DESIGN ISSUES}

\subsection{Interfaces Provided}

See section \ref{Signature}

\subsection{Error Handling}\label{ErrorHandling}

A key aspect of the success of the type inferrer is
the quality of error messages which are generated.
The type inferrer reports helpful messages which
are specific to the particular of inference rule which failed.
Error messages inserts are fragments of Z which should ideally
be easily understandable by the user.
It is the case that there are a variety of Z constructs
whose Z type written down, is very large. An approach to
this problem is to enable the type inferrer to look at
the type specified in the signatures of the component part
or parts of the term, and use this type in presenting
diagnostic fragments of Z.

When application of a typing rule fails, then
error information is returned. The details of this
information depend upon the particular inference rule.
A data type representing this information is
provided. This type is equated (in the implementation)
with an actual data structure which is private to the
implementation of the type inferrer.

It is desirable that type checking error messages
are consistent regarding style and format. Therefore all
error messages generated comprise the following components:

\begin{enumerate}
\item
the term being constructed when the error was detected
\item
a summary of the inference rule which was being applied
\item
the types of the sub-terms which comprise the erroneous term
\end{enumerate}

See section (\ref{FirstRule} ``Error Messages'') for
an example of an error message following this format.

\subsection{Standard Versus Extended Z}

Facilities for checking a specification against the
standard Z language \cite{DS/FMU/IED/DEF007} and
against extended Z are required.

The formal contents of a Z specification is
divided into two distinct categories for type
checking purposes.

Firstly, there is the Z which describes the specification
using Z paragraphs. The user is most likely to want to
check this against the standard Z language.

Secondly, there are fragments of Z which constitute
terms for use in proof scripts (e.g., goals, specializations), which are enclosed between the symbols `ⓩ' and `⌝'.
It is less likely that the user will want to check
this against the standard Z language, but will want
to check it against extended Z.

\subsection{Type Inference Context}
Like the HOL type inferrer described in \cite{DS/FMU/IED/DTD016}, the Z
type inferrer is sensitive to the type inference context maintained
by the function $set\_ti\_context$ and its relatives. Any variable in the
context whose name is a possible HOL representation of a Z name is used
to determine (precisely) the type of any corresponding free variable in
the term being inferred.

\subsection{Communication with Term Generator}

In the HOL type inferrer of \cite{DS/FMU/IED/DTD016}, type inference
and term generation is performed within one module. In the more complex
case of Z, term generation is performed in a separate module
\cite{DS/FMU/IED/DTDD063}. The two modules need to communicate the information
held in the substitution data structure built up by the unifications
performed during type inference. While the interface is functional, the
functions are actually accessing this imperative data structure; the calling
sequence is therefore important: if term generation is to take place after
a type inference call, then it must take place before any further type
inference is carried out (since that would overwrite the data structure).

\section{TRANSFORMATIONS APPLIED IN TYPE INFERENCE}\label{transformations}

\subsection{Variables}

All variables in terms and expressions which are received by the type inferrer
default to local, since the parser is unable to distinguish between local and
global variables.
During type inference, type inferrer builds up and environment which records
the names and types of variables and wgether they are locally bound variables,
global variables, or free variables. Those which are global, determined by their
presence in the current theory (or in its ancestry), are converted to global variables
in the abstract syntax tree ($ZTmGVar$). Free and locally bound variables are represented
in as local variables in the tree ($ZTmLVar$).


\subsection{True and False}

True and false are communicated to the type inferrer by the parser as
local variables which the type inferrer recognises and converts them to the
abstract syntax construct, $ZTmTruth true$ and $ZTmTruth false$ as appropriate.

\subsection{Membership and Equality}

The parser generates membership and equality constructs as functional application.
The type inferrer recognizes these as special cases of application and a term using
the membership or equality constructors ($ZTm∈$ or $ZTmEq$) as appropriate.

\subsection{Schemas as Predicates}

In places where schemas can appear as predicates, they default to being interpreted
(in the abstract syntax) as predicates. The constructor $ZTmSchemaPred$ is
inserted by the type inferrer to represent the coercion of a schema as a predicate.
This is done for example in implementation of the inference rule for predicate
negation and for logical infix operators for predicates.


\subsection{Relations}

A relation when applied to some argument or arguments is transformed into a statement
of membership of those arguments to the relation by the type inferrer.
For example, $R\  x⋎1$ is transformed into $x⋎1 ∈ (R\  \_)$; similarly
$x⋎1\  R\  x⋎2$ is transformed into $(x⋎1, x⋎2)\  ∈\  (\_\  R\  \_)$.

\subsection{Sequences of Binary Relations}\label{seqbinrel}

An expression of the form $x⋎1 R\  x⋎2\  ∧\  x⋎2 R\  x⋎3 ∧ ... ∧ s↘n-1↕\  R\  x⋎n$
where $R$ is a binary relation
can be written in the shorthand form $x⋎1\   R\   x⋎2\  R\  x⋎3 ... R x⋎n$
\cite{DS/FMU/IED/DEF007}.

The type inferrer infers the types of each $x$ from left to right remembering
the substitution as it goes. It also transforms an abbreviated binary relation
to the conjuntion of all the individual relational expressions.
The types of generics must not be instantiated
differently within a binary relation sequence.
e.g., ${"A"} = ∅ = {1,2,3}$ is invalid.

Given:

$x⋎0~r⋎1~x⋎1~r⋎2~x⋎2~r⋎3~...~r↘k-1↕~x↘k-1↕~r⋎k~x⋎k$.

where $r⋎i$ are infix relation symbols (declared
using $rel \_~r⋎i~\_$),
the transformation gives:

$(x⋎0,x⋎1)~∈~r⋎1~∧~(x⋎1,x⋎2)~∈~r⋎2~∧~...~∧~(x↘k-1↕,x⋎k)~∈~r⋎k$.

\subsection{Free Type Definition Arguments}

See section \ref{freetypedef}.

\section{ERROR MESSAGES}

The following error messages are general error messages which can result from
several kinds of typing error. They are grouped here for convenience.

=FAILURE
62001	Type error in ⓩ?0⌝
62002	Type error in Z paragraph
62003	   ⓩ?0:?1⌝
62004	   ⓩ?0⌝
62005	Type ⓩ?0⌝ inferred for the following element?1:
62006	The following type was inferred:
62007	The following types were inferred:
=TEX

=FAILURE
62700	The following sub-term is not a set
62701	The following sub-term is not a sequence
62702	The following sub-term is not a predicate
62703	The following sub-term is not a schema
62704	The following sub-term is not a binding
62705	The following sub-term is not a tuple
62706	The following sub-term is not a generic global variable
=TEX

=FAILURE
62601	In ⓩ?0⌝,
62602	In the declaration,
62603	In the current scope,
62611	The following identifier appears more than once
62612	The following identifiers appear more than once
62621	Encountered schemas which are incompatible
62622	The incompatibilities are as follows:
62623	Attempt to quantify over components not present in the schema
62631	Free variables are not permitted in Z paragraphs
62632	The following variable is free:
=TEX
=FAILURE
62901	Type inferrer internal error: ?0
=TEX

\section{INFERRING TYPES IN Z DECLARATIONS}
=GFTSHOW Value Constructor
ZDDec of IDENT list * Z_TM * EXTYPE OPT
ZDSchemaDec of Z_TM * EXTYPE OPT
=TEX

The algorithm for type inferring Z declarations is as follows:

1. Type infer all the schemas as declarations using the input environment. This
gives the names and types of each component in all the schemas.

2. Grow the environment with all these components together with all the
declarative instances on the left hand side of normal declarations, noting
any incompatibilities that arise.

3. Type infer the right hand side of each of the normal declarations using
the extended environment.


The following inference rule applies to typed declarations.
=FRULE 1 Rule
├
E ⊕ {x⋎1 ↦ τ⋎1, ..., x⋎n ↦ τ⋎n} ⊢ σ :: ℙ σ
├
E ⊢ x⋎1, ..., x⋎n : ℙ σ
=TEX
=DESCRIBE
The type on the right hand side of the declaration must be a set of something,
$ℙ σ$. The type of the $σ$ is
type-inferred in an environment in which the declarative instances on the left hand side
are in scope. This ensures conformance with the Z mapping described in
\cite{DS/FMU/IED/ZED002} and \cite{DS/FMU/IED/ZED003}.



The following rule applies to schemas as declarations.

=FRULE 1 Rule
├
├
E ⊢ S : ℙ [x1; ... ; xn]
=TEX
\paragraph{Error Messages}~
=EXAMPLE
ⓩ([x : 1])⌝;
Type error in ⓩ([x : 1])⌝
In a declaration of the form ⓩa : X⌝, ⓩX⌝ must be a set
The following sub-term is not a set
   ⓩ1:ℤ⌝
=TEX
=EXAMPLE
ⓩ([A])⌝;
Type error in ⓩ([A])⌝
In a declaration of the form ⓩX⌝, ⓩX⌝ must be a schema
The following sub-term is not a schema
   ⓩA:'a⌝
=TEX
\paragraph{Error Codes}~

=FAILURE
62501	In a declaration of the form ⓩa : X⌝, ⓩX⌝ must be a set
62502	In a declaration of the form ⓩX⌝, ⓩX⌝ must be a schema
62503	In a schema as a predicate ⓩS⌝, the components of S must be
62504	   compatible with the corresponding variables in scope
62505	In a declaration of a variable ⓩx⌝, all occurrences of ⓩx⌝
62506	   must be compatible
=TEX

\section{INFERRING TYPES IN Z SCHEMA TEXTS}\label{tischematext}
=GFTSHOW Type Definition
type Z_SCH_TEXT = Z_DEC list * Z_TM OPT * EXTYPE OPT
=TEX

=FRULE 1 Rule
x⋎is are the vars. introduced in D
├
E ⊕ {x⋎1 ↦ τ⋎1, ..., x⋎n ↦ τ⋎n} ⊢ P :: 𝔹
├
E ⊢ D | P
=TEX

=DESCRIBE
A schema text has no type as such; however, the part of the schema after
the bar must be a predicate in an environment extended
by all the variables introduced
by the declaration.

\paragraph{Error Messages}~

=EXAMPLE
ⓩ[x:ℤ|0]⌝;
Type error in ⓩx : ℤ | 0⌝
In a schema text ⓩ... D | P ...⌝, P must be a predicate
The following sub-term is not a predicate
   ⓩ0:ℤ⌝
=TEX

\paragraph{Error Codes}~

=FAILURE
62510	In a schema text ⓩ... D | P ...⌝, P must be a predicate
=TEX


\section{INFERRING TYPES IN Z TERMS}\label{InfRules}

In sections \ref{FirstRule} to \ref{LastRule}, the
typing rules are defined.



\subsection{Sequence Display}\label{FirstRule}


=GFTSHOW Value Constructor
ZTm⟨⟩ of EXTYPE OPT * Z_TM list
=TEX

=FRULE 1 Rule
unifiable[σ⋎1, ..., σ⋎n]
├
E ⊢ x⋎1::σ⋎1; ...; E ⊢ x⋎n::σ⋎n
├
E ⊢ ⟨x⋎1, ..., x⋎n⟩ :: ℙ(ℤ × σ⋎1)
=TEX

=FRULE 1 Rule
├
├
E ⊢ ⟨⟩ :: ℙ(ℤ × σ⋎?)
=TEX

=DESCRIBE
The rule for type inferring  types in a non-empty
list is as follows:

First, the types $ty1 \ldots tyk$, of the sub-terms
are inferred
(using the same environment $E$ for each one).
The types are then unified,
and the HOL type corresponding to the Z type $ℙ(ℤ× ty1)$
is computed.

The result is the term constructed from the
type checked sub-terms and the type we have just computed.
The substitution arising from the unification is modified
as a side effect.

The case of an empty list display is described by the second rule.
To type check an empty list
a new type unknown is invented. The result
is that type,
with an empty list display. The
substitution is unchanged by this rule.

\paragraph{Error Messages}~
=EXAMPLE
ⓩ⟨1,2,(3,4),5⟩⌝;
Type error in ⓩ⟨1,2,(3,4),5⟩⌝
Each element in a sequence must have the same type
Type ⓩℤ⌝ inferred for the following elements:
   ⓩ1⌝
   ⓩ2⌝
   ⓩ5⌝
Type ⓩℤ×ℤ⌝ inferred for the following element:
   ⓩ(3,4)⌝
=TEX
\paragraph{Error Codes}~

=FAILURE
62011	Each element in a sequence must have the same type
=TEX



\subsection{Set Display}

=GFTSHOW Value Constructor
ZTmSetd of EXTYPE OPT * Z_TM list
=TEX
=FRULE 1 Rule
unifiable[σ⋎1, ..., σ⋎n]
├
E ⊢ x1 :: σ⋎1; ...; E ⊢ x⋎n :: σ⋎n
├
E ⊢ {x⋎1, ..., x⋎n} :: ℙ σ⋎1
=TEX

=FRULE 1 Rule
├
├
E ⊢ {} :: ℙ σ⋎?
=TEX

=DESCRIBE
The types of each element in a set display must be
unifyable to some type, $ty$. The type of a set display is then
$ℙ ty$. If it is found that the elements are not unifiable, then
the error information produced lists each of the types
inferred, and the elements in the set corresponding to those
types. The elements are listed in lexicographic order.
This is the same as to be found in error reporting
for sequence display.
=TEX
\paragraph{Error Messages}~
=EXAMPLE
ⓩ{1,2,(3,4),5}⌝;
Type error in ⓩ{1,2,(3,4),5}⌝
Each element in a set must have the same type
Type ⓩℤ⌝ inferred for the following elements:
   ⓩ1⌝
   ⓩ2⌝
   ⓩ5⌝
Type ⓩℤ×ℤ⌝ inferred for the following element:
   ⓩ(3,4)⌝
=TEX
\paragraph{Error Codes}~
=FAILURE
62021	Each element in a set display must have the same type
=TEX



\subsection{Set Abstraction}

=GFTSHOW Value Constructor
ZTmSeta1 of Z_SCH_TEXT
ZTmSeta2 of Z_SCH_TEXT * Z_TM
=TEX

=FRULE 1 Rule
├
E ⊕ env(D | P) ⊢ chartuple(D | P) :: σ
├
E ⊢ {D | P} :: ℙ σ
=TEX

=FRULE 1 Rule
├
E ⊕ env(D | P) ⊢ x :: σ
├
E ⊢ {D | P ⦁ x} :: ℙ σ
=TEX
=DESCRIBE
We write $chartuple(D | P)$  for the characteristic tuple,
and $env(D | P)$ for the environment,
which arise from the type checked schema text $D | P$.

In a set abstration of the form ${D | P}$, the type of the
abstraction is the characteristic tuple of the schema text,
$D | P$.

In an abstration of the form ${D | P ⦁ x}$, the type of the
abstration is the type of $x$, inferred in an environment where the
declarations in $D$ are in scope.


\paragraph{Error Messages}~
=EXAMPLE
ⓩ{x:X | 0}⌝;
Type error in ⓩ{x : X | 0}⌝
In a term of the form  ⓩ{D | P}⌝, P must be a predicate
The following sub-term is not a predicate
   ⓩ0:ℤ⌝
=TEX
\paragraph{Error Codes}~
=FAILURE
62031	In a term of the form  ⓩ{D | P}⌝, P must be a predicate
62032	In a term of the form  ⓩ{D | P ⦁ S}⌝, P must be a predicate
=TEX



\subsection{Powerset}

=GFTSHOW Value Constructor
ZTmℙ of Z_TM
=TEX
=FRULE 1 Rule
├
E ⊢ x :: ℙ σ
├
E ⊢ ℙ x :: ℙ ℙ σ
=TEX
=DESCRIBE
The type of a powerset of some $x$ is the powerset of the powerset of
the type of $x$.

\paragraph{Error Messages}~
=EXAMPLE
ⓩℙ 1⌝;
Type error in ⓩℙ 1⌝
In a term of the form ⓩℙ X⌝, X must be a set
The following sub-term is not a set:
   ⓩ1:ℤ⌝
=TEX
\paragraph{Error Codes}~

=FAILURE
62041	In a term of the form ⓩℙ X⌝, X must be a set
=TEX



\subsection{Tuple Display}

=GFTSHOW Value Constructor
ZTmTuple of Z_TM list
=TEX
=FRULE 1 Rule
├
E ⊢ x⋎1 :: σ⋎1; ...; E ⊢ x⋎n :: σ⋎n
├
E ⊢ (x⋎1, ..., x⋎n) :: σ⋎1 × ... × σ⋎n
=TEX
=DESCRIBE
The type of a tuple is
a product type where each type corresponds to the
type of each element in the tuple.

\paragraph{Error Messages}~
There are no error conditions associated with this construct.


\subsection{Binding Display}

=GFTSHOW Value Constructor
ZTmBinding of Z_EQ_DEF list
=TEX
=FRULE 1 Rule
the x⋎is are pairwise distinct
├
E ⊢ t⋎1 :: σ⋎1; ...; E ⊢ t⋎n :: σ⋎n
├
E ⊢ (x⋎1 ≜ t⋎1, ..., x⋎n ≜ t⋎n)
	:: binding [x⋎1 : σ⋎1; ...; x⋎n : σ⋎n]
=TEX
=DESCRIBE
The type of a binding display is
a binding type each of whose components has
name and type equal to the name and the type of the corresponding
expression in the binding display.

\paragraph{Error Messages}~

=EXAMPLE
ⓩ(a≜1, b≜2, a≜2)⌝;
Type error in ⓩ(a≜1, b≜2, a≜2)⌝
In a binding display ⓩ(x⋎1 ≜ t⋎1, ..., x⋎n ≜ t⋎n)⌝
   no ⓩx⋎i⌝ may appear more than once
The following identifier appears more than once
   ⓩa⌝
=TEX

\paragraph{Error Codes}~

=FAILURE
62051	In a binding display ⓩ(x⋎1 ≜ t⋎1, ..., x⋎n ≜ t⋎n)⌝
62052	   no ⓩx⋎i⌝ may appear more than once
=TEX


\subsection{Product}

=GFTSHOW Value Constructor
ZTm× of Z_TM list
=TEX
=FRULE 1 Rule
├
E ⊢ x⋎1 :: ℙ σ⋎1; ...; E ⊢ x⋎n :: ℙ σ⋎n
├
E ⊢ x⋎1 × ... × x⋎n :: ℙ(σ⋎1 × ... × σ⋎n)
=TEX
=DESCRIBE
Each type in the product type must be a set. The type of
the product type is its powerset.
Those elements in the product type which are not sets
are reported in the error message.

\paragraph{Error Messages}~
=EXAMPLE
ⓩℤ×1⌝;
Type error in ⓩℤ×1⌝
In ⓩS⋎1 × ... × S⋎n⌝, S⋎1 to S⋎n must be sets
Type ⓩℤ⌝ inferred for the following elements:
   ⓩ1⌝
=TEX
\paragraph{Error Codes}~
=FAILURE
62071	In ⓩS⋎1 × ... × S⋎n⌝, S⋎1 to S⋎n must be sets
=TEX



\subsection{Theta}

=GFTSHOW Value Constructor
ZTmθ of Z_TM * DECOR
=TEX

=FRULE 1 Rule
├
E ⊢ x :: ℙ [x⋎1 : σ⋎1; ...; x⋎n : σ⋎n]
├
E ⊢ θ x :: [x⋎1 : σ⋎1; ...; x⋎n : σ⋎n]
=TEX

=FRULE 1 Rule
d is in {', ?, !} or a combination thereof
├
E ⊢ x :: ℙ [x⋎1 : σ⋎1; ...; x⋎n : σ⋎n]
├
E ⊢ θ x d :: [x⋎1 : σ⋎1; ...; x⋎n : σ⋎n]
=TEX

=DESCRIBE
The argument of a theta expression must be a schema (i.e., a set
of bindings), and the
resultant type of the expression is a binding from one of the set
denoted by the schema.

\paragraph{Error Messages}~
=EXAMPLE
ⓩθ 1⌝;
Type error in ⓩθ 1⌝
In a term of the form ⓩθ S⌝, S must be a schema
The following sub-term is not a schema:
   ⓩ1:ℤ⌝
=TEX
\paragraph{Error Codes}~

=FAILURE
62081	In a term of the form ⓩθ S⌝, S must be a schema
=TEX


\subsection{Tuple Selection}

=GFTSHOW Value Constructor
ZTmSel⋎T of Z_TM * int
=TEX
=FRULE 1 Rule
├
E ⊢ t :: σ⋎1 × ... × σ⋎n; E ⊢ i :: (1 .. n)
├
E ⊢ t.i :: σ⋎i
=TEX
=DESCRIBE
In a tuple selection where the $i'th$ element of the
tuple is selected, then the type of the tuple selection
is the type of the $i'th$ element in the tuple (where the
first element is numbered $1$.
The operand must be a tuple.
If an out-of-range element is selected, then an
error is reported.

=EXAMPLE
ⓩ(20,30,40).4⌝;
Type error in ⓩ(20,30,40).4⌝
In ⓩ(x⋎1, ..., x⋎n).i⌝, ⓩi⌝ must be in the range ⓩ1 .. n⌝
The selector ⓩ4⌝ is not in the range ⓩ1 .. 3⌝

ⓩ(θ [x : X]).1⌝;
Type error in ⓩ(θ [x : X]).1⌝
In a term of the form ⓩT.number⌝, T must be a tuple
The following sub-term is not a tuple:
   ⓩ(θ [x : X])⌝
=TEX

\paragraph{Error Codes}~
=FAILURE
62096	In ⓩ(x⋎1, ..., x⋎n).i⌝, ⓩi⌝ must be in the range ⓩ1 .. n⌝
62097	The selector ⓩ?0⌝ is not in the range ⓩ1 .. ?1⌝
62098	In a term of the form ⓩT.number⌝, T must be a tuple
=TEX



\subsection{Binding Selection}

=GFTSHOW Value Constructor
ZTmSel⋎B of Z_TM * IDENT
=TEX
=FRULE 1 Rule
├
E ⊢ t :: [x⋎1 : σ⋎1; ...; x⋎n : σ⋎n]
├
E ⊢ t.x⋎i :: σ⋎i
=TEX
=DESCRIBE
In a binding selection, the type of the first component
must be a binding type (which incidentally can only be formed using
a theta expression). The selector must be a component
in the binding.
The resultant type is that of the type of the selected
component.

\paragraph{Error Messages}~

=EXAMPLE
ⓩ(θ [x : X]).c⌝;
Type error in ⓩ(θ [x:X]).c⌝
The selected component must be present in the binding
    The component ⓩc⌝
is not present in ⓩ(θ [x:X])⌝
=TEX
=EXAMPLE
ⓩ1.c⌝;
Type error in ⓩ1.c⌝
In a term of the form ⓩB.c⌝, B must be a binding
The following sub-term is not a binding:
   ⓩ1:ℤ⌝
=TEX
\paragraph{Error Codes}~

=FAILURE
62101	The selected component must be present in the binding
62102	    The component ⓩ?0⌝
62103	is not present in ⓩ?0⌝
62104	In a term of the form ⓩB.c⌝, B must be a binding
=TEX


\subsection{Application}

=GFTSHOW Value Constructor
ZTmApp of Z_TM * Z_TM
ZTmFancyApp of IDENT * Z_TM
=TEX

=FRULE 1 Rule
unifiable(σ⋎1, ℙ(σ⋎2 × σ⋎?))
├
E ⊢ x⋎1 :: σ⋎1; E ⊢ x⋎2 :: σ⋎2
├
E ⊢ x⋎1 x⋎2 :: σ⋎?
=TEX

=DESCRIBE
The typing rules for application and for fancy-fix application are almost
the same. In fancy-fix application where the first argument is an identifier, the
type inferrer has to look up in the environment the type of the identifier.
Type inference then proceeds as for normal function application.

The typing rule
requires the argument to be in the domain of the operator. The resulting
type is unknown and will be resolved by the context of the application.

\paragraph{Error Messages}~
=EXAMPLE
ⓩ1 1⌝;
Type error in ⓩ1 1⌝
In ⓩf a⌝ where ⓩa:X⌝, ⓩf⌝ must have type ⓩX ↔ ?⌝
Cannot apply ⓩ1:ℤ⌝
          to ⓩ1:ℤ⌝
=TEX
\paragraph{Error Codes}~
=FAILURE
62111	In ⓩf a⌝ where ⓩa:X⌝, ⓩf⌝ must have type ⓩX ↔ ?⌝
62112	Cannot apply ⓩ?0:?1⌝
62113	          to ⓩ?0:?1⌝
=TEX



\subsection{λ-abstraction}\label{tilambda}

=GFTSHOW Value Constructor
ZTmλ of Z_SCH_TEXT * Z_TM
=TEX
=FRULE 1 Rule
├
E ⊕ env(D | P) ⊢ chartuple(D | P) :: σ⋎1;
E ⊕ env(D | P) ⊢ x :: σ⋎2;
├
E ⊢ λ D | P ⦁ x :: ℙ(σ⋎1 × σ⋎2)
=DESCRIBE
The sub-term $D | P$ is type inferred as a schema text, and therefore
error messages relating to failed type inference for schema texts
may be generated from applying this rule.
The type of a lambda abstration is the powerset of product type of the
characteristic tuple of the formed schema text, and the type of the
sub-term $t$.

\paragraph{Error Messages}~
See section \ref{tischematext}.


\subsection{Definite Description}

=GFTSHOW Value Constructor
ZTmμ1 of Z_SCH_TEXT
=TEX
=FRULE 1 Rule
├
E ⊕ env (D | P) ⊢ chartuple (D | P) :: σ;
├
E ⊢ μ D | P :: σ
=TEX

=GFTSHOW Value Constructor
ZTmμ2 of Z_SCH_TEXT * Z_TM

=FRULE 1 Rule
├
E ⊕ env (D | P) ⊢ x :: σ;
├
E ⊢ μ D | P ⦁ x :: σ
=TEX
=DESCRIBE
See description for lambda abstraction (section \ref{tilambda}).
\paragraph{Error Messages}~
See section \ref{tischematext}.


\subsection{Truth}

=GFTSHOW Value Constructor
ZTmTruth of bool
=DESCRIBE
The parser should not generate terms constructed with the constructor
$ZTmTruth$ since truth and falsity are communicated as local variables, whic
the type inferrer recognises and converts them into $ZTmTruth ...$ as
appropriate.

\subsection{Predicate Negation}

=GFTSHOW Value Constructor
ZTm¬⋎F of Z_TM
=TEX
=FRULE 1 Rule
├
E ⊢ x :: ℙ [y⋎1 : σ⋎1; ...; y⋎n : σ⋎n]
├
E ⊢ ¬ x :: 𝔹
=TEX
=FRULE 1 Rule
├
E ⊢ x :: 𝔹
├
E ⊢ ¬  x :: 𝔹
=TEX
=DESCRIBE
If the operand is a schema, then it is
coerced to be a predicate (using the constructor
$ZTmSchemaPred$). The arguments and the resulting
types are then both of type 𝔹.

\paragraph{Error Messages}~
=EXAMPLE
ⓩ¬ 1⌝;
Type error in ⓩ¬ 1⌝
In a term of the form ⓩ¬ P⌝, P must be a predicate
The following sub-term is not a predicate:
   ⓩ1:ℤ⌝
=TEX
\paragraph{Error Codes}~

=FAILURE
62151	In a term of the form ⓩ¬ P⌝, P must be a predicate
=TEX


\subsection{Logical Infix Operators for Predicates}


=GFTSHOW Value Constructor
ZTmLogInOp⋎F of Z_LOG_IN_OP * Z_TM * Z_TM
=TEX

=FRULE 1 Rule
├
E ⊢ x⋎1 :: 𝔹;E ⊢ x⋎2 :: 𝔹
├
E ⊢ x⋎1 Ω x⋎2 :: 𝔹
=TEX

=FRULE 1 Rule
├
E ⊢ x⋎1 :: ℙ [ y⋎1 : σ⋎1; ...; y⋎n : σ⋎n ]
E ⊕ {y⋎1 ↦ σ⋎1, ..., y⋎n ↦ σ⋎n} ⊢ x⋎2 :: 𝔹
├
E ⊕ {y⋎1 ↦ σ⋎1, ..., y⋎n ↦ σ⋎n}
	⊢ x⋎1 Ω x⋎2 :: 𝔹
=TEX

=FRULE 1 Rule
├
E ⊢ x⋎1 :: ℙ [y⋎1 : σ⋎1; ...; y⋎m : σ⋎m]
E ⊕ {y⋎1 ↦ σ⋎1, ..., y⋎n ↦ σ⋎n}
	⊢ x⋎2:: ℙ [z⋎1 : τ⋎1; ...; z⋎n : τ⋎n]
├
E ⊕ {y⋎1 ↦ σ⋎1, ..., y⋎n ↦ σ⋎n,
	z⋎1 ↦ τ⋎1, ..., z⋎n ↦ τ⋎n}
	⊢ x⋎1 Ω x⋎2 :: 𝔹
=TEX
=FRULE 1 Rule
├
E ⊢ x⋎1 :: 𝔹
E ⊢ x⋎2 :: ℙ [ y⋎1 : σ⋎1; ...; y⋎n : σ⋎n ]
├
E ⊕ {y⋎1 ↦ σ⋎1, ..., y⋎n ↦ σ⋎n}
	⊢ x⋎1 Ω x⋎2 :: 𝔹
=TEX
=DESCRIBE
The rules for conjunction, disjunction, bi-equivalence
and implication, and predicate composition are the same.
$Ω$ is one of `∧', `∨', `⇔', `⇒' or ";".

If either or both of the operands are schemas, then the appropriate
operand(s) are coerced to be predicates (using the constructor
$ZTmSchemaPred$). The arguments and the resulting
types are then both of type 𝔹.

If either of the operands are neither schemas nor predicates, then an
error is raised.
=TEX
\paragraph{Error Messages}~
=EXAMPLE
ⓩa ∧ 1⌝;
Type error in ⓩa ∧ 1⌝
In a term of the form ⓩp ∧ q⌝, p and q must be predicates
The following sub-term is not a predicate:
   ⓩ1:ℤ⌝
=TEX
\paragraph{Error Codes}~

=FAILURE
62161	In a term of the form ⓩp ?0 q⌝, p and q must be predicates
=TEX
=SEEALSO
Logical Infix Operators for Schemas (Section \ref{loginopschemas}).
=TEX


\subsection{Predicate Quantification}

=GFTSHOW Value Constructor
ZTmQuant⋎F of Z_QUANT * Z_SCH_TEXT * Z_TM
=TEX
=FRULE 1 Rule
├
E ⊕ env (D | P)
	⊢ x :: ℙ [y⋎1 : σ⋎1; ...; y⋎n : σ⋎n]
├
E ⊢ Q D | P ⦁ x :: 𝔹
=TEX
=FRULE 1 Rule
├
E ⊕ env (D | P) ⊢ x :: 𝔹
├
E ⊢ Q D | P ⦁ x :: 𝔹
=TEX
=DESCRIBE
Here $Q$ is one of `$∀$', `$∃$' or `$∃⋎1$'. If $x$ is a schema, then
it is coerced to be of type 𝔹 using the constructor $ZTmSchemaPred$.  $x$ is
then type-inferred in an environment in which the variables of $D$ are
in scope. The type of the quantified term is a predicate. This is the first rule.

If $x$ is a predicate, then no coercion is required
and the rule is similar to that for schemas.

=TEX
\paragraph{Error Messages}~

=EXAMPLE
ⓩ[X](∀ x : X | true ⦁ x)⌝;
Type error in ⓩ∀ x : X | true ⦁ x⌝
In an expression of the form ⓩ?0 D | P ⦁ x⌝, ⓩx⌝ must be a predicate
The following sub-term is not a predicate:
   ⓩx:X⌝
=TEX

=FAILURE
62171	In an expression of the form ⓩ?0 D | P ⦁ x⌝, ⓩx⌝ must be a predicate
=TEX



\subsection{Schemas as Predicates}

=GFTSHOW Value Constructor
ZTmSchemaPred of Z_TM
=TEX
=DESCRIBE
Schemas as predicates constructed with the above value constructor
are rejected by the type inferrer. Such things are only created
by the type inferrer.

\paragraph{Error Messages}~
None.

\subsection{Horizontal Schemas}

=GFTSHOW Value Constructor
ZTmHorizSchema of Z_SCH_TEXT
=TEX
=FRULE 1 Rule
├
E ⊢ x⋎1 :: σ⋎1; ...; E  ⊢ x⋎n :: σ⋎n
├
E ⊢ [x⋎1 : σ⋎1; ...; x⋎n : σ⋎n]
	:: ℙ [x⋎1 : σ⋎1; ...; x⋎n : σ⋎n]
=TEX
=FRULE 1 Rule
├
E ⊢ x⋎1 :: σ⋎1; ... E  ⊢ x⋎n :: σ⋎n
E ⊢ y : 𝔹
├
E ⊢ [x⋎1 : σ⋎1; ... x⋎n : σ⋎n | y]
	:: ℙ [x⋎1 : σ⋎1; ...; x⋎n : σ⋎n]
=TEX
=DESCRIBE
If the schema text which comprises the horizontal schema type-infers
correctly, then the type of the schema is a powerset of bindings
containin the components of the schema.
\paragraph{Error Messages}~
See section \ref{tischematext}


\subsection{Decoration}

=GFTSHOW Value Constructor
ZTmDecor of Z_TM * DECOR * EXTYPE OPT
=TEX
=FRULE 1 Rule
d is in {', ?, !} or a combination thereof
├
E ⊢ x :: ℙ [y⋎1 : σ⋎1; ...; y⋎n : σ⋎n]
├
E ⊢ x d :: ℙ [y⋎1 d : σ⋎1; ...; y⋎n d : σ⋎n]
=TEX
=DESCRIBE
The type of a decorated schema is the set of bindings whose components
are each decorated with the decoration applied to the schema.

Note that a variable which ends in one of the decoration characters
is treated as an identifier if the identifier stripped of its decoration
systematically, is not found to be a schema (see the rules for decoration
in \cite{DS/FMU/IED/DEF007}.

The type if present is the type of the undecorated term (to save recalculating
it when calculating characteristic tuples).
\paragraph{Error Messages}~
=EXAMPLE
ⓩ(a=b)'⌝;
Type error in ⓩ(a=b)'⌝
Only schemas may be decorated
The following sub-term is not a schema:
   ⓩ(a=b):ℤ⌝
=TEX
\paragraph{Error Codes}~

=FAILURE
62201	Only schemas may be decorated
=TEX

\subsection{Precondition}

=GFTSHOW Value Constructor
ZTmPre of Z_TM
=TEX
=FRULE 1 Rule
no σ⋎i = τ⋎j or σ⋎i = υ⋎j
├
E ⊢ w :: ℙ [x⋎1' : σ⋎1; ...; x⋎m' : σ⋎m;
	y⋎1! : τ⋎1; ...; y⋎n! : τ⋎n;
	z⋎1 : υ⋎1; ...; z⋎k : υ⋎k]
		
├
E ⊢ pre w :: ℙ [z⋎1 : υ⋎1; ...; z⋎k : υ⋎k]
=TEX
=DESCRIBE
A type of a precondition of a schema is the set of bindings which
result in removing components decorated with $!$ and $'$.
=TEX
\paragraph{Error Messages}~
=EXAMPLE
ⓩpre 1⌝;
Type error in ⓩpre 1⌝
In a schema expression of the form ⓩpre S⌝, ⓩS⌝ must be a schema
The following sub-term is not a schema:
   ⓩ1:ℤ⌝
=TEX
\paragraph{Error Codes}~

=FAILURE
62211	In a schema expression of the form ⓩpre S⌝, ⓩS⌝ must be a schema
=TEX



\subsection{Schema Negation}
=GFTSHOW Value Constructor
ZTm¬⋎S of Z_TM
=TEX
=FRULE 1 Rule
├
E ⊢ x :: ℙ [y⋎1 : σ⋎1; ...; y⋎n : σ⋎n]
├
E ⊢ ¬ x :: ℙ [y⋎1 : σ⋎1; ...; y⋎n : σ⋎n]
=TEX
=DESCRIBE
Negation is interpreted as schema negation only in those
contexts where the negated schema must also be a schema (and
not a schema as a predicate).
In a schema negation of the form ⓩ¬ S⌝, the type of the expression
is the same as the type of ⓩS⌝.

\paragraph{Error Messages}~

=EXAMPLE
ⓩ[(¬ 1)]⌝;
Type error in ⓩ¬ 1⌝
In a schema expression of the form ⓩ¬ S⌝, S must be a schema
The following sub-term is not a schema:
   ⓩ1:ℤ⌝
=TEX
\paragraph{Error Codes}~
=TEX
=FAILURE
62221	In a schema expression of the form ⓩ¬ S⌝, S must be a schema
=TEX



\subsection{Logical Infix Operators for Schemas}\label{loginopschemas}

=GFTSHOW Value Constructor
ZTmLogInOp⋎S of Z_LOG_IN_OP * Z_TM * Z_TM
=FRULE 1 Rule
no σ⋎i = τ⋎j or σ⋎i = υ⋎j
├
E ⊢ w⋎1 :: ℙ [x⋎1 : σ⋎1; ...; x⋎k : σ⋎k;
	y⋎1 : τ⋎1; ...; y⋎m : τ⋎m]

E ⊢ w⋎2 :: ℙ [x⋎1 : σ⋎1; ...; x⋎k : σ⋎k;
	z⋎1 : υ⋎1; ...; z⋎n : υ⋎n]
├
E ⊢ w⋎1 Ω x⋎2 :: ℙ [x⋎1 : σ⋎1; ...; x⋎i : σ⋎i;
	y⋎1 : τ⋎1; ...; y⋎m : τ⋎m;
	z⋎1 : υ⋎1; ...; z⋎n : υ⋎n]
=TEX

=DESCRIBE
$Ω$ is one of `∧', `∨', `⇔', `⇒' or `;'.

Logical infix operators for
schemas are interpreted as schema operators only in those
contexts where the result must also be a schema (and
not a schema as a predicate).

The rules for conjunction, disjunction, bi-equivalence
and implication are the same. The operands must be compatible.

=TEX
\paragraph{Error Messages}~
=EXAMPLE
ⓩ[[x:X] ∧ 1]⌝;
Type error in ⓩ[x:X] ∧ 1⌝
In a term of the form ⓩS ∧ T⌝, S and T must be schemas
The following sub-term is not a schema:
   ⓩ1:ℤ⌝
=TEX
=EXAMPLE
ⓩ[[x:X] ∧ [x: (X × X)]]⌝;
Type error in ⓩ[x : X] ∧ [x : (X × X)]⌝
In an expression of the form ⓩS ∧ T⌝, S and T must be compatible schemas
The incompatibilities are as follows:
In ⓩ[x : X]⌝,
   ⓩx:'a⌝
In ⓩ[x : (X × X)]⌝,
   ⓩx:('a × 'a)⌝
=TEX
\paragraph{Error Codes}~

=FAILURE
62231	In an expression of the form ⓩS ?0 T⌝, S and T must be schemas
62232	In an expression of the form ⓩS ?0 T⌝, S and T must be compatible schemas
=TEX


\subsection{Schema Projection}

=GFTSHOW Value Constructor
ZTm↾ of Z_TM * Z_TM
=TEX
=FRULE 1 Rule
no σ⋎i = τ⋎j or σ⋎i = υ⋎j
├
E ⊢ w⋎1 :: ℙ [x⋎1 : σ⋎1; ...; x⋎k : σ⋎k;
	y⋎1 : τ⋎1; ...; y⋎m : τ⋎m]
E ⊢ w⋎2 :: ℙ [x⋎1 : σ⋎1; ...; x⋎k : σ⋎k;
	z⋎1 : υ⋎1; ...; z⋎n : υ⋎n]
├
E ⊢ w⋎1 ↾⋎s w⋎2 :: ℙ [x⋎1 : σ⋎1; ...; x⋎k : σ⋎k;
	z⋎1 : υ⋎1; ...; z⋎n : υ⋎n]
=TEX
=DESCRIBE
Both the operands of the schema projection must be compatible schemas.
The type of the result is a schema.

=TEX
\paragraph{Error Messages}~
=EXAMPLE
ⓩ[x : X] ↾⋎s 1⌝;
Type error in ⓩ[x : X] ↾⋎s 1⌝
In a term of the form ⓩS ↾⋎s T⌝, S and T must be schemas
The following sub-term is not a schema:
   ⓩ1:ℤ⌝
=TEX
=EXAMPLE
ⓩ[X,Y] [x, y : X] ↾⋎s [x : Y]⌝;
Type error in ⓩ[x, y : X] ↾⋎s [x : Y]⌝
In a term of the form ⓩS ↾⋎s T⌝, S and T must be compatible schemas
The incompatibilities are as follows:
In ⓩ[x, y : X]⌝:
   ⓩx:X⌝
In ⓩ[x : Y]⌝:
   ⓩx:Y⌝

=TEX
\paragraph{Error Codes}~

=FAILURE
62241	In a term of the form ⓩS ↾⋎s T⌝, S and T must be schemas
62242	In a term of the form ⓩS ↾⋎s T⌝, S and T must be compatible schemas
=TEX

\subsection{Schema Hiding}

=GFTSHOW Value Constructor
ZTmHide of Z_TM * IDENT list
=TEX
=FRULE 1 Rule
no σ⋎i = τ⋎j
├
E ⊢ w :: ℙ [x⋎1 : σ⋎1; ...; x⋎k : σ⋎k;
	y⋎1 : τ⋎1; ...; y⋎m : τ⋎m]
├
E ⊢ w \⋎s (x⋎1, x⋎k)
	:: ℙ [y⋎1 : τ⋎1; ...; y⋎m : τ⋎m]
=TEX
=DESCRIBE
Both the operands of the schema hiding operator must be compatible schemas.
The type of the result is a schema.

\paragraph{Error Messages}~
=EXAMPLE
ⓩ1\⋎s(x,y)⌝;
Type error in ⓩ1\⋎s(x,y)⌝
In the schema expression ⓩS \⋎s (x⋎1,...,x⋎n)⌝, ⓩS⌝ must be a schema
The following sub-term is not a schema:
   ⓩ1:ℤ⌝
=TEX
\paragraph{Error Codes}~
=FAILURE
62251	In the schema expression ⓩS \⋎s (x⋎1, ..., x⋎n)⌝, ⓩS⌝ must be a schema
=TEX

\subsection{Schema Quantification}

=GFTSHOW Value Constructor
ZTmQuant⋎S of Z_QUANT * Z_SCH_TEXT * Z_TM
=FRULE 1 Rule
no σ⋎i = τ⋎j
├
E ⊢ [D | P] :: ℙ [y⋎1 : σ⋎1; ...; y⋎m : σ⋎m]
E ⊢ x :: ℙ [z⋎1 : τ⋎1; ...; z⋎n : τ⋎n]
├
E ⊢ Q D | P ⦁ t :: ℙ [z⋎1 : τ⋎1; ...; z⋎n : τ⋎n]
=TEX
=DESCRIBE
Where $Q$ is one of `$∀$', `$∃$' or `$∃⋎1$'.

A quantification defaults to a predicate quantification unless
the quantification occurs in a context which requires a schema or
is otherwise constrained by a type constraint.
=TEX
\paragraph{Error Messages}~
=EXAMPLE
ⓩ[(∃ x:X ⦁ true)]⌝;
Type error in ⓩ∃ x : X ⦁ true⌝
In a schema expression of the form ⓩ∃ D | P ⦁ S⌝, ⓩS⌝ must be a schema
The following sub-term is not a schema
   ⓩtrue:𝔹⌝
=TEX
=EXAMPLE
ⓩ[X] [(∀ x:X | true ⦁ [x : seq X])]⌝;
Type error in ⓩ∀ x : X | true ⦁ [x : seq X]⌝
In a schema expression of the form ⓩ∀ D | P ⦁ S⌝,
   the characteristic tuple of ⓩD | P⌝ must be compatible with ⓩS⌝
The incompatibilities are as follows:
In the declaration,
   ⓩx:'X⌝
In ⓩ[x : seq _[X]]⌝,
   ⓩx:ℤ ↔ 'X⌝
=TEX
\paragraph{Error Codes}~

=FAILURE
62261	In a schema expression of the form ⓩ?0 D | P ⦁ S⌝, ⓩS⌝ must be a schema
62262	In a schema expression of the form ⓩ?0 D | P ⦁ S⌝,
62263	   the characteristic tuple of ⓩD | P⌝ must be compatible with ⓩS⌝
62266	The following are not components of ⓩ?0⌝:
=TEX



\subsection{Δ and Ξ}

=GFTSHOW Value Constructor
ZTmΔ of Z_TM
ZTmΞ of Z_TM
=TEX
=FRULE 1 Rule
├
E ⊢ x :: ℙ [ y⋎1 : σ⋎1; ...; y⋎n : σ⋎n ]
├
E ⊢ Δ x :: ℙ [ y⋎1 : σ⋎1; ...; y⋎n : σ⋎n;
	y⋎1' : σ⋎1; ...; y⋎n' : σ⋎n ]
=TEX
=FRULE 1 Rule
├
E ⊢ x :: ℙ [ y⋎1 : σ⋎1; ...; y⋎n : σ⋎n ]
├
E ⊢ Ξ x :: ℙ [ y⋎1 : σ⋎1; ...; y⋎n : σ⋎n;
	y⋎1' : σ⋎1; ...; y⋎n' : σ⋎n ]
=TEX
=DESCRIBE
The type of the delta or a xi expression is the type of a set of
bindings with all the components present and the same components
decorated with $'$.

=TEX
\paragraph{Error Messages}~
=EXAMPLE
ⓩΔ 1⌝;
Type error in ⓩΔ 1⌝
In ⓩΔ S⌝, ⓩS⌝ must be a schema
The following sub-term is not a schema:
   ⓩ1:ℤ⌝
=TEX

=EXAMPLE
ⓩΞ 1⌝;
Type error in ⓩΞ 1⌝
In ⓩΞ S⌝, ⓩS⌝ must be a schema
The following sub-term is not a schema:
   ⓩ1:ℤ⌝
=TEX

\paragraph{Error Codes}~


=FAILURE
62270	In ⓩΔ S⌝, ⓩS⌝ must be a schema
62271	In ⓩΞ S⌝, ⓩS⌝ must be a schema
=TEX

\subsection{Set Membership and Equality}
=GFTSHOW Value Constructor
ZTmEq of Z_TM * Z_TM
ZTm∈ of Z_TM * Z_TM
=TEX
=FRULE 1 Rule
├
E ⊢ x⋎1 :: σ; E ⊢ x⋎2 :: σ
├
E ⊢ x⋎1 = x⋎2 :: 𝔹
=TEX
=FRULE 1 Rule
├
E ⊢ x⋎1 :: σ; E ⊢ x⋎2 :: ℙ σ
├
E ⊢ x⋎1 ∈ x⋎2 :: 𝔹
=TEX
=DESCRIBE
Set membership and equality both yield predicates. The typing
rules are simple and straightforward.
\paragraph{Error Messages}~
=EXAMPLE
ⓩ1 ∈ 1⌝;
Type error in ⓩ1 ∈ 1⌝
In a term of the form ⓩa ∈ X⌝, X must be a set
The following sub-term is not a set:
   ⓩ1:ℤ⌝
=TEX
=EXAMPLE
ⓩ⟨1,2,3⟩ ∈ {1, 2, 3}⌝;
Type error in ⓩ⟨1, 2, 3⟩ ∈ {1, 2, 3}⌝
In a term of the form ⓩa ∈ X⌝ where ⓩa:σ⌝, ⓩX⌝ must have type ⓩℙ σ⌝
The following types were inferred:
   ⓩ{1, 2, 3}:ℙ ℤ⌝
   ⓩ⟨1, 2, 3⟩:ℤ ↔ ℤ⌝
=TEX

=EXAMPLE
ⓩ⟨1,2,3⟩ = 1⌝;
Type error in ⓩ⟨1, 2, 3⟩ = 1⌝
The operands of ⓩ$=⌝ must have the same type
The following types were inferred:
   ⓩ⟨1, 2, 3⟩:ℤ ↔ ℤ⌝
   ⓩ1:ℤ⌝
=TEX

\paragraph{Error Codes}~

=FAILURE
62281	The operands of ⓩ$=⌝ must have the same type
62282	In a term of the form ⓩa ∈ X⌝, X must be a set
62283	In a term of the form ⓩa ∈ X⌝ where ⓩa:σ⌝, ⓩX⌝ must have type ⓩℙ σ⌝
=TEX

\subsection{Schema Composition}

=GFTSHOW Value Constructor
ZTm⨾ of Z_TM * Z_TM
=TEX
=FRULE 1 Rule
no σ⋎i = τ⋎j, σ⋎i = υ⋎j or σ⋎i = ξ⋎j
├
E ⊢ t⋎1 :: ℙ [w⋎1' : σ⋎1; ...; w⋎l' : σ⋎l;
	x⋎1 : τ⋎1; ...; x⋎k : τ⋎k;
	y⋎1 : υ⋎1; ...; y⋎m : υ⋎m]
E ⊢ t⋎2 :: ℙ [w⋎1 : σ⋎1; ...; w⋎l : σ⋎l;
	x⋎1 : τ⋎1; ...; x⋎k : τ⋎k;
	z⋎1 : ξ⋎1; ...; z⋎n : ξ⋎n]
├
E ⊢ t⋎1 ⨾⋎s t⋎2 :: ℙ [x⋎1 : τ⋎1; ...; x⋎k : τ⋎k;
	y⋎1 : υ⋎1; ...; y⋎m : υ⋎m;
	z⋎1 : ξ⋎1; ...; z⋎n : ξ⋎n]
=TEX

=DESCRIBE
In a schema composition, those components of the first schema,
decorated with $'$
are matched with the corresponding undecorated components
of the second schema. The resulting schema has only those
components for which no post-states of the first schema (decorated
with $'$) match
pre-states (undecorated) of the second.
All other components must be compatible.
=TEX
\paragraph{Error Messages}~
=EXAMPLE
ⓩ[X, Y] [x' : Y] ⨾⋎s [x : X]⌝;
Type error in ⓩ[X] [x' : Y] ⨾⋎s [x : X]⌝
In a schema expression ⓩS ⨾⋎s T⌝, the primed components of ⓩS⌝
   must be compatible with the corresponding components of ⓩT⌝
The other components of ⓩS⌝ and ⓩT⌝ must be compatible
The incompatibilities are as follows:
In ⓩ[x' : Y]⌝,
   ⓩx':Y⌝
In ⓩ[x : X]⌝,
   ⓩx:X⌝
=TEX

=EXAMPLE
ⓩ[X] 1 ⨾⋎s [x : X]⌝;
Type error in ⓩ[X] 1 ⨾⋎s [x : X]⌝
In a schema expression ⓩS ⨾⋎s T⌝, ⓩS⌝ and ⓩT⌝ must be schemas
The following sub-term is not a schema:
   ⓩ1:ℤ⌝
=TEX
\paragraph{Error Codes}~
=FAILURE
62290	In a schema expression ⓩS ⨾⋎s T⌝, ⓩS⌝ and ⓩT⌝ must be schemas
62291	In a schema expression ⓩS ⨾⋎s T⌝, the primed components of ⓩS⌝
62292	   must be compatible with the corresponding components of ⓩT⌝
62293	The other components of ⓩS⌝ and ⓩT⌝ must be compatible
=TEX


\subsection{Schema Piping}

=GFTSHOW Value Constructor
ZTmPipe of Z_TM * Z_TM
=TEX

=FRULE 1 Rule
no σ⋎i = τ⋎j, σ⋎i = υ⋎j or σ⋎i = ξ⋎j
├
E ⊢ t⋎1 :: ℙ [w⋎1! : σ⋎1; ...; w⋎l! : σ⋎l;
	x⋎1 : τ⋎1; ...; x⋎k : τ⋎k;
	y⋎1 : υ⋎1; ...; y⋎m : υ⋎m]
E ⊢ t⋎2 :: ℙ [w⋎1? : σ⋎1; ...; w⋎l? : σ⋎l;
	x⋎1 : τ⋎1; ...; x⋎k : τ⋎k;
	z⋎1 : ξ⋎1; ...; z⋎n : ξ⋎n]
├
E ⊢ t⋎1 >> t⋎2 :: ℙ [x⋎1 : τ⋎1; ...; x⋎k : τ⋎k;
	y⋎1 : υ⋎1; ...; y⋎m : υ⋎m;
	z⋎1 : ξ⋎1; ...; z⋎n : ξ⋎n]
=TEX
=DESCRIBE
In schema piping, the output components of the first schema,
are matched with the corresponding input components
of the second schema. The resulting schema has only those
components for which no outputs of the first schema (decorated
with $!$) match
the inputs (decorated with $?$) of the second schema.
All other components must be compatible.

\paragraph{Error Messages}~
=EXAMPLE
ⓩ[X,Y] [x!  : X] >> [x? : Y]⌝;
Type error in ⓩ[X] [x!  : X] >> [x? : Y]⌝
In a schema expression ⓩS >> T⌝, the output components of ⓩS⌝
   must be compatible with the input components of ⓩT⌝
The other components of ⓩS⌝ and ⓩT⌝ must be compatible
The incompatibilities are as follows:
In ⓩ[x! : X]⌝,
   ⓩx!:'X⌝
In ⓩ[x? : Y]⌝,
   ⓩx?:'Y⌝
=TEX

=EXAMPLE
ⓩ[X] 1 >> [x : X]⌝;
Type error in ⓩ[X] 1 >> [x : X]⌝
In a schema expression ⓩS >> T⌝, ⓩS⌝ and ⓩT⌝ must be schemas
The following sub-term is not a schema:
   ⓩ1:ℤ⌝
=TEX
\paragraph{Error Codes}~
=FAILURE
62300	In a schema expression ⓩS >> T⌝, ⓩS⌝ and ⓩT⌝ must be schemas
62301	In a schema expression ⓩS >> T⌝, the output components of ⓩS⌝
62302	   must be compatible with the input components of ⓩT⌝
62303	The other components of ⓩS⌝ and ⓩT⌝ must be compatible
=TEX


\subsection{Integers and String Quotation}

=GFTSHOW Value Constructor
ZTmℤ of int
ZTmString of string
=FRULE 1 Rule
├
├
E ⊢ x :: ℤ
=TEX
=FRULE 1 Rule
├
├
E ⊢ x :: ℙ (ℤ × 𝕊)
=DESCRIBE
The type of integers is the Z type, $ℤ$. The type of strings
is a sequence of characters, whose type is $ℙ (ℤ × 𝕊)$.
=TEX
\paragraph{Error Messages}~
None.



\subsection{Type Casts}
\subsubsection{Type Casts}

=FRULE 1 Rule
unifiable(ℙ ty1, ty2)
├
E ⊢ x⋎1 :: σ; E ⊢ x⋎2 :: ℙ σ
├
E ⊢ x⋎1 ⦂ x⋎2 :: ℙ σ
=TEX
=DESCRIBE
This is used when the term must belong to some set (the term on the right of the ⦂):
Moreover the term returned when a typed term is encountered
comprises just the left hand operand. The constraint
is represented in the abstract syntax as an
application of $(\_~⦂~\_)$.

\paragraph{Error Messages}~
=EXAMPLE
ⓩ⟨1,2⟩ ⦂ ℤ⌝;
Type error in ⓩ⟨1,2⟩ ⦂ ℤ⌝
In ⓩt⦂σ⌝, σ must be an instance of the type of ⓩt⌝
Cannot constrain ⓩ⟨1,2⟩:seq ℤ⌝
              to ⓩℤ⌝
=TEX

\paragraph{Error Codes}~

=FAILURE
62321	In ⓩt:σ⌝, σ must be an instance of the type of ⓩt⌝
62322	Cannot constrain ⓩ?0:?1⌝
62323	              to ⓩ?0⌝
62324	Casts are not permitted in Standard Z
=TEX

\subsubsection{Predicate Casts and Predicate Contexts}

=FRULE 1 Rule
├
E ⊢ x⋎1 :: ℙ [y⋎1 : σ⋎1; ...; y⋎m : σ⋎m]
├
E ⊕ {y⋎1 ↦ σ⋎1, ..., y⋎n ↦ σ⋎n,
	z⋎1 ↦ τ⋎1, ..., z⋎n ↦ τ⋎n}
	⊢ Π x⋎1 :: 𝔹
=TEX
=FRULE 1 Rule
├
E ⊢ x⋎1 :: 𝔹
├
	⊢ Π x⋎1 :: 𝔹
=TEX
=DESCRIBE
This is used when a term is required to be a predicate in positions where
standard Z does not allow predicates.
Moreover the term returned when a typed term is encountered
comprises just the operand. The constraint
is represented in the abstract syntax as an
application of $(Π\_)$.

The same rule applies to operands of fancy-fix applications corresponding
either to predicate stubs or to context stubs (when the application is in a
predicate context).

\paragraph{Error Messages}~
=EXAMPLE
ⓩ⟨1,2⟩ ⦂ ℤ⌝;
Type error in ⓩ⟨1,2⟩ ⦂ ℤ⌝
In ⓩt⦂σ⌝, σ must be an instance of the type of ⓩt⌝
Cannot constrain ⓩ⟨1,2⟩:seq ℤ⌝
              to ⓩℤ⌝
=TEX

\paragraph{Error Codes}~

=FAILURE
62325	In ⓩΠ(t:σ)⌝, σ must be a predicate
62327	A term in a predicate context must be a predicate
62326	Cannot make a predicate from ⓩ?0:?1⌝
62324	Casts are not permitted in Standard Z
=TEX


\subsection{Local Variables}

=GFTSHOW Value Constructor
ZTmLVar of IDENT * EXTYPE OPT * Z_TM list
=DESCRIBE
The parser passes all variables whether local or global as if they
were local variables. The type inferrer uses the context to determine
whether the variables are really local. Free variables may only occur
in extended Z and no local variables may have generic actual parameters.
=TEX



\subsection{Global Variables}

=GFTSHOW Value Constructor
ZTmGVar of (IDENT * EXTYPE OPT * Z_TM list)
=DESCRIBE
Global variables may have generic actual parameters if the variables
are declared with generic formal parameters. The number of
generic actuals must match the number of generic formals. The generic
actuals must each be sets. The
actuals can be omitted in which case the actuals default to
the set of all things (the Universe set, $U$).

\paragraph{Error Messages}~
=EXAMPLE
ⓩℤ [X]⌝;
Type error in ⓩℤ [X]⌝;
Only generic global variables can be instantiated
The following sub-term is not a generic global variable
   ⓩℤ⌝
=TEX
=EXAMPLE
ⓩ∅ [X, Y]⌝;
Type error in ⓩ∅ [X, Y]⌝;
The number of generic actual parameters supplied must match
   the number of generic formal parameters of the global variable
The global variable, ⓩ∅⌝ requires 1 generic actual parameter
=TEX
=FAILURE
62341	Only generic global variables can be instantiated
62342	The number of generic actual parameters supplied must match
62343	   the number of generic formal parameters of the global variable
62344	The global variable, ⓩ?0⌝ requires ?1 generic actual parameter?2
62345	Generic actual parameters must be sets
=TEX

\subsection{Let Expressions}

=GFTSHOW Value Constructor
ZTmLet of Z_EQ_DEF list * Z_TM
=TEX
=FRULE 1 Rule
├
E ⊢ y⋎1 :: σ⋎1; ...; y⋎n :: σ⋎n
E ⊕ {x⋎1 ↦ σ⋎1, ..., x⋎n ↦ σ⋎n} ⊢ z :: τ
├
E ⊢ let x⋎1 ≜ y⋎1, ..., x⋎n ≜ y⋎n ⦁ z :: τ
=TEX
=DESCRIBE
The let expression has the type of the $in$ clause inferred in the
context in which the variables defined in the $let$ clauses are
in scope.
\paragraph{Error Messages}~
=FAILURE
62351	The definition of the variable ?0 in this let-expression
	is not compatible with its use
=TEX


\subsection{Renaming}

=GFTSHOW Value Constructor
ZTmRename of ZTM * ((IDENT * IDENT) list)
=FRULE 1 Rule
no σ⋎i is in τ⋎i
├
E ⊢ w :: ℙ [x⋎1 : σ⋎1; ...; x⋎m : σ⋎m;
	y⋎1 : τ⋎1; ...; y⋎n : τ⋎n]
├
E ⊢ w [z⋎1/x⋎1, ..., z⋎m/x⋎m]
	:: ℙ [z⋎1 : σ⋎1; ...; z⋎m : σ⋎m;
		y⋎1 : τ⋎1, ... y⋎n : τ⋎n]
=TEX
=DESCRIBE
Each $x$ component mentioned a rename list $[x⋎1/y⋎1, ..., x⋎n/y⋎n]$
must be unique with respect to all the $x⋎is$; likewise for a
$y$ component and all the $y⋎is$.
The error examples below illustrate this.
=TEX
\paragraph{Error Messages}~
=EXAMPLE
ⓩ1 [a/b, c/d]⌝;
Type error in ⓩ1 [a/b, c/d]⌝
In the expression ⓩS [x⋎1/y⋎1, ..., x⋎n/y⋎n]⌝, ⓩS⌝ must be a schema
The following sub-term is not a schema:
   ⓩ1:ℤ⌝
=TEX

=EXAMPLE
ⓩ[a : X] [a/a, b/a]⌝;
Type error in ⓩ[a : X] [a/a, b/a]⌝
In a schema expression ⓩS [x⋎1/y⋎1, ..., x⋎n/y⋎n]⌝
   no ⓩy⋎i⌝ may appear more than once
The following identifier appears more than once
   ⓩa⌝
=TEX

=EXAMPLE
ⓩ[a : X] [a/a, a/b]⌝;
Type error in ⓩ[a : X] [a/a, a/b]⌝
In a schema expression ⓩS [x⋎1/y⋎1, ..., x⋎n/y⋎n]⌝,
   no ⓩx⋎i⌝ may appear more than once
The following identifier appears more than once
   ⓩa⌝
=TEX

\paragraph{Error Codes}~

=FAILURE
62361	In an expression ⓩS [x⋎1/y⋎1, ..., x⋎n/y⋎n⌝, ⓩS⌝ must be a schema
62362	In a schema expression ⓩS [x⋎1/y⋎1, ..., x⋎n/y⋎n]⌝,
62363	   no ⓩx⋎i⌝ may appear more than once
62364	   no ⓩy⋎i⌝ may appear more than once
=TEX



\subsection{Bracketed Terms}

=GFTSHOW Value Constructor
ZTmBracketed of ZTM
=FRULE 1 Rule
├
E ⊢ x :: σ
├
E ⊢ (x) :: σ
=TEX
=DESCRIBE
The type of a bracketed expression is the same as the type
of the expression without the brackets.

\paragraph{Error Messages}~
None.



\subsection{Term Quotation}\label{LastRule}
In a term quotation, the type of the term quoted must be instantiable
to a type compatible with the type inferred for the quotation. Moreover,
term as a whole must be capable of being instantiated so that the types
of its free variables are compatible with the context in which the
quotation appears.

=GFTSHOW Value Constructor
ZTmQuotation of TERM
=FRULE 1 Rule
├
E ⊢ v⋎1 → V⋎1:σ⋎1φ;
...
E ⊢ v⋎s → V⋎s:σ⋎sφ;
├
E ⊢ htm:σ :: σ'
=DESCRIBE
where $σ$ is the type of the term in the quotation,
=INLINEFT
⌜v⋎1:σ⋎1⌝, ..., ⌜v⋎s:σ⋎s⌝
=TEX
\ are the names and types of its free variables, $φ$ is some assignment
of types to type variables, and, for any type $τ$, $τφ$ denotes the
result of instantiating $τ$ according to $φ$.
Free variables which have the same names as constants in scope are
ignored.
It is an error if two distinct free variables of the term in the quotation
have the same name, i.e. there are repetitions in the list of names
=INLINEFT
v⋎1, ..., v⋎s
=TEX
.

=TEX
\paragraph{Error Messages}~
The following are examples of error messages which can
be generated by a typing error when applying this
inference rule.
=EXAMPLE
ⓩx = (1, 2) ∧ ⌜x = {}⌝⌝;
Type error in ⓩ⌜x = {}⌝⌝
A free variable in a nested quotation must be instantiable to have the same
type as it has in the surrounding term
In the nested quotation   ⌜x = {}⌝
the type of free variable ⓩx:ℙ 'a⌝
cannot be instantiated to ℤ × ℤ
=EXAMPLE
let val t1 = ⌜x:ℤ→ℤ⌝; val t2 = ⌜x:ℤ⌝
in	⌜ⓜmk_app(t1, t2)⌝⌝
end;
Type error in ⓩ⌜x x⌝⌝
In a nested quotation, no two distinct free variables may have the same name
⌜x x⌝ has the following free variables:
	ⓩx:ℤ→ℤ⌝
	ⓩx:ℤ⌝
=TEX
=FAILURE
62890	A free variable in a nested quotation must be instantiable to have the
	same type as it has in the surrounding term
62891	In the nested quotation   ?0
62892	the type of free variable ⓩ?0:?1⌝
62893	cannot be instantiated to ?0
62894	In a nested quotation, no two distinct free variables may have the
	same name
62895	?0  has the following free variables:
62896	   ⓩ?0:?1⌝
62897	Nested quotations are not permitted in Standard Z
=TEX
\section{INFERRING TYPES IN Z PARAGRAPHS}


\subsection{Abbreviation Definitions}
=GFTSHOW Value Constructor
|ZParaAbbDef of IDENT * IDENT list * Z_TM * EXTYPE OPT
|ZParaSchBox of IDENT * IDENT list * Z_SCH_TEXT * EXTYPE OPT
=FRULE 1 Rule
define {v :: σ}
├
E ⊕ {x⋎1 ↦ ℙ x⋎1, ... x⋎n ↦ ℙ x⋎n} ⊢ w :: σ
├
E ⊢ v [x⋎1, ... x⋎n] ≜ w :: σ
=TEX
=DESCRIBE
The right hand side of an abbreviation is type-inferred in an
environment in which the generic formal parameters are in
scope. Its type is adopted by the abbreviation for entry
(by the paragraph processor described in \cite{DS/FMU/IED/DTD049})
into the theory database.

Note also schbox is described by this rule.
=TEX

\subsection{Axiomatic Descriptions}
=GFTSHOW Value Constructor
|ZParaAxDes of IDENT list * Z_SCH_TEXT * (((IDENT * EXTYPE) list) OPT)
=FRULE 1 Rule
define {y⋎1 : σ⋎1; ...; y⋎n : σ⋎n}
├
E ⊕ {x⋎1 ↦ ℙ x⋎1, ... x⋎m ↦ P x⋎m}
	⊢ [y⋎1 : σ⋎1; ...; y⋎n : σ⋎n | p] :: 𝔹
├
E ⊢ [x⋎1, ... x⋎m]
	[y⋎1 : σ⋎1; ...; y⋎n : σ⋎n | p] :: 𝔹
=TEX
=DESCRIBE
The schema text comprising the
axiomatic description is type-inferred in an
environment in which the generic formal parameters are in
scope. The identifiers and types of introduced by the axiomatic
description are returned by the type inferrer in the identifier-type
list part of the $ZParaAxDes$ contructor function.
=TEX

\subsection{Free Type Definitions}\label{freetypedef}
=GFTSHOW Value Constructor
|ZParaFreeType of (IDENT * (IDENT * Z_TM OPT) list) list
=FRULE 1 Rule
define {w : ℙ w}
define {x⋎1 : w, ..., x⋎m :: w}
define {y⋎1 : σ⋎1 ↦ w, ..., y⋎n : σ⋎n ↦ w}
├
E ⊢ t⋎1 :: ℙ σ⋎1; ...; t⋎n :: ℙ σ⋎n
├
E ⊢ w ::= x⋎1 | ... | x⋎m
	| y⋎1 ⟨⟨t⋎1⟩⟩ | ... | y⋎n ⟨⟨t⋎n⟩⟩
=TEX
=DESCRIBE
If the arguments of type constructors (i.e. $z⋎1$ to $z⋎n$) are
expressions which are tuples, then the expressions are transformed
by the type inferred into cross products to reflect the actual semantics
of a free type definition.
The type of such a constructor is then the type of an instance of the
cross product onto the type of the specified free type.

For example in a free type definition:
ⓈIZ
[TY]
■
ⓈIZ
rel	_ Cons _
■
ⓈIZ
FTY	::=	TY Cons TY
■
$TY Cons TY$ as a function application is the same as writing
$(\_\  Cons\  \_) (TY,TY)$. In a free type definition,
the type inferrer transforms this into $(\_\  Cons\  \_) (TY × TY)$, whose
type is $ℙ (TY × TY)$. In the above example, the constant $(\_\  Cons\  \_)$ is given
the type $(TY × TY) → FTY$.

 $(TY × TY) → FTY$

\subsection{Given Sets}
=GFTSHOW Value Constructor
|ZParaGivenSet of IDENT list * ((IDENT list * Z_TM) OPT)
=FRULE 1 Rule
define {x⋎1 :: ℙ x⋎1, ..., x⋎n :: ℙ x⋎n}
├
├
[x⋎1, ..., x⋎n]
=TEX
=FRULE 1 Rule
define {x⋎1 : ℙ x⋎1, ... x⋎n : ℙ x⋎n}
├
E ⊕ {x⋎1 ↦ ℙ x⋎1, ..., x⋎n ↦ P x⋎n}
	⊢ w :: 𝔹
├
E ⊢ [x⋎1, ..., x⋎n] & w :: σ
=TEX
=DESCRIBE
The rule for given sets is that if a predicate part is present, it
must be unifiable with 𝔹.

\paragraph{Error Codes}~
=FAILURE
62801	In a given set paragraph of the form ⓈZ [S⋎1, ..., S⋎n] & P ■,
62802	   ⓩP⌝ must be a predicate
=TEX

\subsection{Constraints}
=GFTSHOW Value Constructor
|ZParaConstraint of IDENT list * Z_TM
=FRULE 1 Rule
├
E ⊕ {x⋎1 ↦ ℙ x⋎1, ..., x⋎n ↦ ℙ x⋎n}
	⊢ w :: 𝔹
├
E ⊢ [x⋎1, ..., x⋎n] w :: 𝔹
=TEX
=DESCRIBE
The constraint must be a predicate (unifiable with 𝔹).
=FAILURE
62803	In a constraint paragraph ⓈZ P ■, ⓩP⌝ must be a predicate
=TEX

\subsection{Conjectures}
=GFTSHOW Value Constructor
|ZParaConjecture of IDENT OPT * IDENT list * Z_TM
=FRULE 1 Rule
[X⋎1, ... X⋎k] & a :: ty
unifiable (ty, 𝔹)
├
E ⊕ {x⋎1 ↦ ℙ x⋎1, ..., x⋎n ↦ ℙ x⋎n}
	⊢ w :: 𝔹
├
E ⊢ [x⋎1, ..., x⋎n] ?⊢ w :: 𝔹
=TEX
=DESCRIBE
The conjecture must be a predicate (unifiable with 𝔹).
=FAILURE
62804	In a conjecture paragraph ⓈZ ?⊢ P ■, ⓩP⌝ must be a predicate
=TEX


\subsection{Terms}
=GFTSHOW Value Constructor
|ZParaTerm of IDENT list * Z_TM * EXTYPE OPT;
=FRULE 1 Rule
├
E ⊕ {x⋎1 ↦ ℙ x⋎1, ..., x⋎n ↦ ℙ x⋎n}
	⊢ w :: 𝔹
├
E ⊢ [x⋎1, ..., x⋎n] w :: 𝔹
=TEX
=FRULE 1 Rule
├
E ⊢ w :: σ
├
E ⊢ [] w :: σ
=TEX
=DESCRIBE
The term is type-inferred in a context where the generic formal parameters
are in scope, if there are any, in which case the term must be a predicate.
(The notation in the second rule is suggestive but not legal Z.)
The type of the inferred term is returned in the third
position of the $ZParaTerm$ contructor.
=FAILURE
62805	In a generic term ⓩ[x1, ...] P⌝, ⓩP⌝ must be a predicate
=TEX

\subsection{Fixity Paragraphs}
=GFTSHOW Value Constructor
|ZParaFixity of FIXITY
=TEX
=DESCRIBE
The type inferrer passes on fixity paragraphs unchecked and unchanged.
=TEX



\section{SIGNATURE FOR Z TYPE INFERENCE}\label{Signature}


=DOC
signature ⦏ZTypeInference⦎ = sig
=DESCRIBE
This is the signature for the type inferrer for HOL/Z.
=ENDDOC

=DOC
	type ⦏Z_ERROR_INFO⦎;
	datatype ⦏Z_INFERRED⦎ =
			⦏ZInferred⦎ of ZUserInterfaceSupport.Z_PARA
		|	⦏ZTypeError⦎ of Z_ERROR_INFO;
	val ⦏type_check_z_para⦎ : {standard : bool, allow_frees : bool}
				-> ZUserInterfaceSupport.Z_PARA -> Z_INFERRED;
	val ⦏print_z_error⦎ : Z_ERROR_INFO -> 'a;
=DESCRIBE

The data type $ERROR\_INFO$ is used to communicate error information
raised during type inference to the Z paragraph processor so that the
latter may print diagnostics to the user using the
function $print\_z\_error$.

The function $type\_check\_z\_para$ performs type inference
on a paragraph. The result is constructed with $ZInferred$ if
the paragraph is well-typed; otherwise it is constructed with
$ZTypeError$.

The argument indicates to the type inferrer
whether to type infer according to standard Z or extended Z
and whether or not free variables are permitted.

The function $print\_z\_error$ is intended to be called
via the Z paragraph processor to print type checking diagnostics.
The function always raises the exception ``Fail'' with the error
code 62000.
=FAILURE
62000	Type error
=ENDDOC

=DOC
	val ⦏make_chartuple⦎ : ZUserInterfaceSupport.Z_SCH_TEXT ->
			(ZUserInterfaceSupport.Z_TM * Unification.EXTYPE);
=DESCRIBE
This function makes a characteristic tuple from a Z schema
text. The types of the schema text must already have been inferred.
=USES
The function $make\_chartuple$ is intended to be called
by the term generator subsequent to the types in a Z paragraph having
been inferred.
=FAILURE
62903	The type of the schematext provided is not a schema type
62904	The types of the schematext must have already been inferred
=ENDDOC

=DOC
	val ⦏type_of_z_extype⦎ : Unification.EXTYPE -> TYPE;
	val ⦏get_types_to_define⦎ : unit -> Unification.EXTYPE list;
=DESCRIBE
These functions are for use in programming with the Z type inferrer.

The function $type\_of\_z\_extype$ converts
extended types (with which the
type inferrer decorates type-inferred paragraphs) to HOL types,
similar to $extype\_to\_type$ function in the $Unification$ module.
The difference is that here, the
free variable name map is not required as an argument.

The type inferrer has knowledge of type variable names which
are permitted (unique with respect to type variables occuring in
HOL quotations) and this knowledge is not public. $type\_of\_z\_extype$
uses this information to establish names of type variables
when type inferring paragraphs with free variables (permitted
in extended Z only).
This is why the interface is in the type inferrer module and not the
term generator module.

The type inferrer may insert binding or tuple types into its return value that may not have been declared.
The function $get\_types\_to\_define$ returns a list of extended types whose constructors need to be in scope to ensure that the output of the type inferrer can be converted into valid HOL terms.
The term generator must ensure that the constructors of all these types are declared.

=USES
The function $type\_of\_z\_extype$ is intended to be called
by the term generator subsequent to the types in a Z paragraph having
been inferred.
=ENDDOC
=DOC
	val ⦏diag_free_vars⦎ : unit -> string list;
=DESCRIBE
This function is for use in programming with the Z type inferrer.
After a call to the type inferrer, a call to this function will return the list of free variables (including generic formals) that were encountered in the Z paragraph (or term).
This enables the caller to supply additional information in the case of an error.
(If the $allow\_frees$ component of the parameter to $type\_check\_z\_para$ is $false$, the list returned by this function will contain the free variable named in the exception raised by the type inferrer, if any.)
=ENDDOC

=SML
end (* signature ZTypeInference *);
=TEX
\section{TEST POLICY}
The facilities in this document are to be tested according to the general
guidelines laid down in \cite{DS/FMU/IED/PLN008}. Correct operation
of the type inference for the term quotation construct is extremely hard
to test in the absence of the term generator; tests for this construct
are therefore included in \cite{DS/FMU/IED/MDT063}.
\pagebreak

\twocolumn[\section{INDEX}]
{	\footnotesize
	\printindex
}
\onecolumn

\end{document}

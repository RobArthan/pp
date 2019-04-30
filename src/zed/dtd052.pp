=IGN
********************************************************************************
dtd052.doc: this file is part of the PPZed system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% ℤ $Date: 2005/12/16 09:49:12 $ $Revision: 1.43 $ $RCSfile: dtd052.doc,v $
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

\def\Title{Detailed Design of Z Individual Semantic Constants}

\def\AbstractText{This document contains the detailed design of the Z primitive constants in the theory ``Z'' of the Z Proof Support Subsystem.}

\def\Reference{DS/FMU/IED/DTD052}

\def\Author{G.M.Prout}


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
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Detailed Design of Z Individual Semantic Constants}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Detailed Design of Z Individual Semantic Constants \cr in the Theory ``Z''}
%% LaTeX2e port: \TPPref{DS/FMU/IED/DTD052}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.43 $ %
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2005/12/16 09:49:12 $ %
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{G.M.Prout&WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{G.T.Scullard&WIN01\\G.M.Prout&WIN01 }
%% LaTeX2e port: \TPPauthorisation{R.B.Jones & Project Manager}
%% LaTeX2e port: \TPPabstract{This document contains the detailed design of the Z primitive constants in the theory ``Z'' of the Z Proof Support Subsystem.}
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
\section{DOCUMENT CONTROL}
\subsection{Contents List}
\tableofcontents
\subsection{Document Cross References}
\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes History}
\begin{description}
\item [Issue 1.1 (1991/11/22)]
First draft version.
\item [Issue 1.2 (1991/12/09)]
Constant names altered to comply with \cite{DS/FMU/IED/DTD047}.
\item [Issue 1.3 (1992/01/30)]
More alterations to names. Theorems removed from signature.
\item [Issue 1.4 (1992/01/30)]
Projection functions for tuple types included; definition of $U$ changed.
\item [Issue 1.5 (1992/06/09)]
Changed to new fonts
\item [Issue 1.11 (1992/06/30) (30th June 1992)]
Changed parent of theory $z\_language$.
\item [Issue 1.13 (1992/07/08), 8 July 1992 ]
Declare language associations for constants.
\item [Issue 1.18 (1992/07/27),1.19 (1992/07/28), 27th July 1992 ]
Corrected definition of $θ$.
\item [Issue 1.20 (1992/07/30), 30th July 1992 ]
Added the empty-binding constant.
\item [Issue 1.26 (1992/10/15), 12th October 1992 ]
Gained $⊆$ from \cite{DS/FMU/IED/DTD078}.
\item [Issue 1.27 (1992/10/19), 30th July 1992 ]
Corrected definition of $⊆$.
\item [Issue 1.28 (1992/12/03),1.29 (1992/12/04) 4th December 1992 ]
Added $BOOL$, corrected $CHAR$. HOL ∀ now in Z language.
\item[Issue 1.30 (1992/12/10)  (10th December 1992)]
Global rename from wrk038.doc issue 1.9.
\item[Issues 1.31 (1994/11/29),1.32 (1994/11/30),1.33 (1994/11/30),1.34 (1994/11/30)  (29th, 30th November 1994)]
Integer type now taken from HOL theory of integers.
\item[Issue 1.35 (1999/03/07)] Improved treatment of theory cache (no longer reliant on the makefile).
\item[Issue 1.36 (2002/03/09)] Stopped it undeclaring any HOL aliases.
\item[Issue 1.37 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.38 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.39 (2004/01/19)] The Z universal set is now called 𝕌.
\item[Issues 1.40 (2005/09/06),1.41 (2005/09/06)] Added let-expressions.
\item[Issue 1.42 (2005/09/09), 1.43 (2005/12/16)] Now using 𝔹 and 𝕊 instead of BOOL and CHAR.
\item[Issue 1.44 (2010/04/01)] Added $z'empty\_binding\_labelled\_product\_spec$ in support of empty schemas.
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
This document contains the detailed design for the
Z primitive constants in the theory ``Z'' of
the Z Proof Support System (see \cite{DS/FMU/IED/HLD015}).
This is called for in \cite{DS/FMU/IED/HLD017}.
The design is
implemented in \cite{DS/FMU/IED/IMP052}.
\subsection{Introduction}
\subsubsection{Purpose and Background}
In the Z Proof Support Subsystem, two types of constants have been identified:
\begin{enumerate}
\item
 Constants defined as primitive  in the system.
\item
Constants that belong to infinite families and thus cannot be defined as primitive, see \cite{DS/FMU/IED/DTD050}.
\end{enumerate}
This document gives the detailed design for the theory ``z\_language'' which contains the constants of type (1).

In addition it contains the definition of $⊆$, which is
part of the Z library, but is used to implement
the elimination of Z declarations in a way that preserves
the declarations structure.
\subsubsection{Dependencies}
The functions in this document are dependent on the Release 1 ICL HOL System and the theory design tools of \cite{DS/FMU/IED/DTD035}.
\subsubsection{Notation}
All constants that are used in the Z semantic mapping described in \cite{DS/FMU/IED/HLD015} are preceded by $Z'$. These constants should not be used by the user of the Z proof support system {\bf unless} the user is prepared to drop out of Z into HOL.


\section{THE THEORY ``z\_language''}

\subsection{Design of the Theory ``z\_language''}

=THDOC
req_name "z_language" (Value "hol");
=DESCRIBE
The theory z\_language defines the primitive constants of the Z Proof Support System.
=ENDDOC

Next, we declare the new theory.
It is a child of the cache theory $cache'zed$ which is created in
the build makefile itself (from \cite{DS/FMU/IED/IMP021}).
It has the HOL theory of integers as a parent, so that the Z theory of integers can exploit work done for HOL.
=SML
val _ = open_theory "hol";
val _ = push_pc "hol";
val _ = delete_theory"z_language" handle Fail _ => ();
val _ = new_theory "z_language" handle Fail _ => (
		delete_theory"z_language.test" handle Fail _ => ();
		new_theory"z_language.test"
	);
val _ = set_cache_theories ["z_language", "hol", "basic_hol"];
val _ = new_parent "ℤ";
val _ = set_current_language "Z";
=TEX

Certain constants are overloaded, they are used in both HOL and Z.

=SML
map (fn s => (declare_const_language(s, "Z"); Nil) handle _ => Value s)
	[	"T", "F", "∀",
		"=", "∈", "⇒",
		"¬", "∧", "∨"
	];
=TEX

\subsubsection{First of the family of Tuple Types}

The types Z'T[1] and Z'T[2] are tuple types. Their definitions are generated by $labelled\_product\_spec$,
described in \cite{DS/FMU/IED/DTD059}, and stored under $Z'T[1]$ and $Z'T[2]$ respectively. The constants
 Z'Mk\_T[1] and Z'Mk\_T[2] are the corresponding tuple constructors. The tuple projection Z'T[1]1
 for the one tuple is also required. These three constants are also  generated by $labelled\_product\_spec$.
The defining theorem for both Z'Mk\_T[1] and Z'T[1]1
is stored under the keys $Z'Mk\_T[1]$ and  $Z'T[1]1$.
The defining theorem for Z'Mk\_T[2] (and the projections
Z'T[2]1 and Z'T[2]2 ,although they are not needed here)
 is stored under the key $Z'Mk\_T[2]$ (and also the keys
 $Z'T[2]1$ and $Z'T[2]1$).
These types and their associated constants are required by some of the constants defined below.
∈ is the same as $∈$ in ICL HOL.

=SML
val _ = labelled_product_spec
	{tykey = "Z'T[1]",
	tyname = "Z'T[1]",
	labels = [("Z'T[1]1",⌜:'1⌝)],
	tyvars = Nil,
	constkeys = ["Z'Mk_T[1]","Z'T[1]1"],
	conname = "Z'Mk_T[1]"};
=TEX

=SML
val _ = labelled_product_spec
	{tykey = "Z'T[2]",
	tyname = "Z'T[2]",
	labels = [("Z'T[2]1",⌜:'1⌝),("Z'T[2]2",⌜:'2⌝)],
	tyvars = Nil,
	constkeys = ["Z'Mk_T[2]","Z'T[2]1","Z'T[2]2"],
	conname = "Z'Mk_T[2]"};
=TEX

\subsubsection{Empty Bindings}

We introduce the empty binding as a type which is
equivalent to the HOL type $ONE$.

=SML
val _ = unlabelled_product_spec
	{tyi = [⌜:ONE⌝],
	tykey = "Z'S[]",
	tyname = "Z'S[]",
	tyvars = Nil,
	conkeys = ["Z'Abs_S[]"],
	conname = "Z'Abs_S[]"};
=TEX

ⓈHOLCONST
│	⦏$"Z'Mk_S[]"⦎ : $"Z'S[]"
├───────────────────────────────
│	$"Z'Mk_S[]" = $"Z'Abs_S[]" One
■

We derive an alternative specification whose form is what one would
expect from $labelled\_product\_spec$ if it was
possible to supply an empty list of labels.

=THDOC
req_thm("⦏z'empty_binding_labelled_product_spec⦎", ([], ⌜
	∀ t ⦁ $"Z'Mk_S[]" = t
⌝));
=ENDDOC

\subsubsection{The Set of All Things}

The HOL constant Totality is the set of all members of a type. It is used by the type inference system and
its definition is stored under the key $Totality$.

ⓈHOLCONST
│	⦏Totality⦎ :'a SET
├───────────────────────────────
│	Totality = Universe
■

z'𝕌 represents the universal type; its definition is stored under the key $U$.

ⓈHOLCONST
│	⦏$"z'𝕌"⦎ : ('a)$"Z'T[1]" → 'a
├───────────────────────────────
│	$"z'𝕌" = $"Z'T[1]1"
■

Note that lowercase z is used, since the global variable
$U$ is required to be in the Z name space.


\subsubsection{Z declarations}

Z'SchemaDec has the same meaning as the constant ∈, except it is not declared as infix. It is required
for the invisible membership assertions which occur when a schema designator is used as a declaration. Its definition is stored under the key $Z'SchemaDec$.

ⓈHOLCONST
│	⦏Z'SchemaDec⦎ : 'a → 'a SET → BOOL
├───────────────────────────────
│	Z'SchemaDec = $∈
■

Z'Dec takes a list of variables and a set of the same type as the variables in the list and returns a simple declaration. Its definition is stored under the key $Z'Dec$.

ⓈHOLCONST
│	⦏Z'Dec⦎ : ('a LIST × 'a SET) → BOOL
├───────────────────────────────
│	∀ vs ⦁
│	Z'Dec ([], vs)
│	∧
│	(∀ v vl ⦁ Z'Dec ((Cons v vl), vs)
│			⇔ v ∈ vs ∧ Z'Dec (vl, vs))
■

Z'Decl takes a declaration list and returns a term of type $BOOL$, the conjuntion of the declarations in
the list. Its definition is stored under the key $Z'Decl$.

ⓈHOLCONST
│	⦏Z'Decl⦎ : BOOL LIST → BOOL
├───────────────────────────────
│	Z'Decl Nil
│	∧
│	∀ b bl ⦁
│		Z'Decl (Cons b bl) = (b ∧ (Z'Decl bl))
■


\subsubsection{Quantification}

ⓈHOLCONST
│	⦏$"Z'∀"⦎ : BOOL → BOOL
├───────────────────────────────
│∀ p ⦁
│	$"Z'∀" p = p
■

ⓈHOLCONST
	⦏$"Z'∀Body"⦎	: BOOL →  BOOL →  BOOL →  BOOL
├
∀ d p v ⦁
	$"Z'∀Body" d p v ⇔ (d ∧ p) ⇒ v
■

ⓈHOLCONST
	⦏$"Z'∃"⦎	:	BOOL → BOOL
├
∀ p ⦁
	$"Z'∃" p = p
■

ⓈHOLCONST
	⦏$"Z'∃Body"⦎	: BOOL →  BOOL →  BOOL →  BOOL
├
∀ d p v ⦁
	$"Z'∃Body" d p v ⇔ d ∧ p ∧ v
■


\subsubsection{Sets and Sequences}

The constants Z'ℙ and Z'Setd are the power set and set constructors.
Their definitions are stored under the keys $Z'ℙ$ and $Z'Setd$.

ⓈHOLCONST
│	⦏$"Z'Int"⦎ : ℕ → ℤ
├───────────────────────────────
│	Z'Int = ℕℤ
■
=TEX

ⓈHOLCONST
│	⦏$"Z'ℙ"⦎ :'a SET → ('a SET) SET
├───────────────────────────────
│	$"Z'ℙ" = ℙ
■

ⓈHOLCONST
│	⦏Z'Setd⦎ :'a LIST → 'a SET
├───────────────────────────────
│	Z'Setd Nil = {}
│	∧
│	∀ h t ⦁ Z'Setd (Cons h t) = (Z'Setd t) ∪ {h}
■

Z'NumList is an auxiliary constant used in the definition of Z'⟨⟩, the sequence constructor.
$Z'NumList$ is stored under the key $Z'NumList$, and $Z'⟨⟩$ under the key $Z'⟨⟩$.

ⓈHOLCONST
│	⦏Z'NumList⦎ : ('a LIST × ℕ) → (((ℤ, 'a)$"Z'T[2]") SET)
├───────────────────────────────
│	∀ n : ℕ ⦁
│	Z'NumList ([], n) = {}
│	∧
│	(∀ a list ⦁ Z'NumList  ((Cons a list), n) =
│		(Z'NumList (list, n + 1)) ∪
│			{$"Z'Mk_T[2]" (Z'Int (n + 1)) a})
■

ⓈHOLCONST
│	⦏$"Z'⟨⟩"⦎ : 'a LIST → ((ℤ, 'a)$"Z'T[2]") SET
├───────────────────────────────
│	∀ l ⦁
│	$"Z'⟨⟩" l =  Z'NumList (l, 0)
■

\subsubsection{Definite Description and Application}

Z'μ is the definite description constant. Its definition is stored under the key $Z'μ$.

ⓈHOLCONST
	⦏$"Z'μ"⦎ : 'a SET → 'a
├
	∀ x : 'a ⦁ $"Z'μ" {x} = x
■

=IGN
│	⦏$"Z'μ"⦎ : ('a → BOOL) → 'a
───────────────────────────────
│	∀ f t ⦁
│	((f = (λ x ⦁ x = t)) ⇒ ($"Z'μ" f = t))
=TEX

Z'App forms an application of one Z term to another. Its definition is stored under the key $Z'App$.
ⓈHOLCONST
│	⦏Z'App⦎ : (('a,'b)$"Z'T[2]") SET → 'a → 'b
├───────────────────────────────
│	∀ f (x : 'a) ⦁
│	Z'App f x =
│		$"Z'μ" {y : 'b | ($"Z'Mk_T[2]" x y) ∈ f}
■

\subsubsection{Theta}

The constant Z'θ has the same meaning as $CombK$, the deletion combinator in ICL HOL. Its definition is stored under the key $Z'θ$.

ⓈHOLCONST
│	⦏$"Z'θ"⦎ : 'a → 'b → 'a
├───────────────────────────────
│	∀ x y ⦁
│	$"Z'θ" x y = x
■

\subsubsection{Schemas as Predicates}


Z'SchemaPred has the same meaning as the constant ∈, except it is not declared as infix. It is required
for the invisible membership assertions which occur when a schema designator is used as a predicate.
Its definition is stored under the key $Z'SchemaPred$.

ⓈHOLCONST
│	⦏Z'SchemaPred⦎ : 'a → 'a SET → BOOL
├───────────────────────────────
│	Z'SchemaPred = $∈
■


The constant $Z'¬⋎s$ is schema negation. Its definition is stored under the key $Z'¬⋎s$.

ⓈHOLCONST
│	⦏$"Z'¬⋎s"⦎ : 'a SET → 'a SET
├───────────────────────────────
│	∀ x s ⦁
│	x ∈ $"Z'¬⋎s" s ⇔ ¬(x ∈ s)
■

\subsubsection{Support for the Z type of characters}

The Z type $𝕊$ is equated the set of all HOL characters.
It is intentional that $𝕊$ be in the name space of the Z user, in order
to support the user of string quotations which type-check to sequences of
$𝕊$.
The following box will make $𝕊$ behave very like a given set
in Z, in particular, $z\_get\_spec$ will return the same result as
if $𝕊$ were a given set.
Unlike a given set, the type of the elements of $𝕊$ is $CHAR$ rather than $z'𝕊$, but this is allowed for in the very few places where it matters (e.g., in $z\_type\_of$).

ⓈHOLCONST
│	⦏$"z'𝕊"⦎ : CHAR SET
├───────────────────────────────
│	$"z'𝕊" = $"z'𝕌" ($"Z'Mk_T[1]" Totality)
■

The constructor for strings is $Z'String$ which is defined
to be a mapping from a list of characters to a Z sequence.
The definition is the same as for Z sequences.

ⓈHOLCONST
│	⦏$"Z'String"⦎ : CHAR LIST → ((ℤ, CHAR)$"Z'T[2]") SET
├───────────────────────────────
│	$"Z'String" = $"Z'⟨⟩"
■
\subsubsection{Let-expression}
$Z'Let$ is just the identity function. It is applied to the $\mu$-expression carrying the semantics of the let-expression.
ⓈHOLCONST
│	⦏$"Z'Let"⦎ : 'a → 'a
├───────────────────────────────
│	∀x⦁ $"Z'Let" x = x
■

\subsection{Constants for Z Paragraph Constructs}

Each mapped Z paragraph is wrapped with an identity function so that information
about the form a paragraph was entered into the theory database is not lost.

\subsubsection{Abbreviation Definitions}

ⓈHOLCONST
	⦏Z'AbbDef⦎ : BOOL → BOOL
├
∀ p ⦁
	Z'AbbDef p = p
■

\subsubsection{Schema Boxes}

ⓈHOLCONST
	⦏Z'SchBox⦎ : BOOL → BOOL
├
∀ p ⦁
	Z'SchBox p = p
■

\subsubsection{Axiomatic Descriptions}

ⓈHOLCONST
	⦏Z'AxDes⦎ : BOOL → BOOL
├
∀ p ⦁
	Z'AxDes p = p
■

\subsubsection{Given Sets}

ⓈHOLCONST
	⦏Z'GivenSet⦎ : BOOL → BOOL
├
∀ p ⦁
	Z'GivenSet p = p
■

\subsubsection{Free Type Definitions}

ⓈHOLCONST
	⦏Z'FreeTypeDef⦎ : BOOL → BOOL
├
∀ p ⦁
	Z'FreeTypeDef p = p
■

\subsubsection{Constraints}

ⓈHOLCONST
	⦏Z'Constraint⦎ : BOOL → BOOL
├
∀ p ⦁
	Z'Constraint p = p
■

\subsection{Others}
\subsubsection{Interface to BOOL}
The following box will make $𝔹$ behave very like a given set
in Z, in particular, $z\_get\_spec$ will return the same result as
if $𝔹$ were a given set, and it will be provable (at least in extended
Z) that $BOOL$ is equal to the set with two members $true$ and $false$.
As with $𝕊$, the type of the elements of $𝔹$ is not as it would be if $𝔹$ were actually a given set, but this is not important.

ⓈHOLCONST
│	⦏$"z'𝔹"⦎ : BOOL SET
├───────────────────────────────
│	$"z'𝔹" = $"z'𝕌" ($"Z'Mk_T[1]" Totality)
■


\subsubsection{Proper Subsets}

ⓈHOLCONST
	⦏$"z'_ ⊆ _"⦎ : 'X SET $"Z'T[1]" → ('X SET, 'X SET) $"Z'T[2]" SET
├
∀ X : 'X SET ⦁
	$"z'_ ⊆ _" ($"Z'Mk_T[1]" X) =
		{st : ('X SET, 'X SET) $"Z'T[2]" |
		$"Z'T[2]1" st ∈ ℙ X ∧ $"Z'T[2]2" st ∈ ℙ X ∧
		(∀ x :'X ⦁ x ∈ X ⇒ x ∈ $"Z'T[2]1" st ⇒ x ∈ $"Z'T[2]2" st)}
■

\subsection{Fixity Definition for Equality and Membership}

The operators $=$ and $∈$ must be declared as infix relations for the
parser and the type checker to correctly parse and type check Z terms
and expressions which contain $=$ and $∈$.

=SML
local
	open ZUserInterfaceSupport;
	val tmpl = map template_of_string ["_ = _", "_ ∈ _", "_ ⊆ _"];
in
val _ = set_zfixity_info(ZClRel, tmpl)
end;
=TEX

\subsection{End of the Design of the Theory ``ZLanguage''}

\subsection{Signature of the theory ``ZLanguage''}
=DOC
signature ⦏ZLanguage⦎ = sig
   val ⦏z_totality_def⦎ : THM
   val ⦏z_u_def⦎ : THM
   val ⦏z'schema_dec_def⦎ : THM
   val ⦏z'dec_def⦎ : THM
   val ⦏z'decl_def⦎ : THM
   val ⦏z'∀_def⦎ : THM
   val ⦏z'∀_body_def⦎ : THM
   val ⦏z'∃_def⦎ : THM
   val ⦏z'∃_body_def⦎ : THM
   val ⦏z'ℙ_def⦎ : THM
   val ⦏z'setd_def⦎ : THM
   val ⦏z'num_list_def⦎ : THM
   val ⦏z'⟨⟩_def⦎ : THM
   val ⦏z'μ_def⦎ : THM
   val ⦏z'app_def⦎ : THM
   val ⦏z'empty_binding_def⦎ : THM
   val ⦏z'empty_binding_labelled_product_spec⦎ : THM
   val ⦏z'θ_def⦎ : THM
   val ⦏z'schema_pred_def⦎ : THM
   val ⦏z'¬⋎s_def⦎ : THM
   val ⦏z_char_def⦎ : THM
   val ⦏z_bool_def⦎ : THM
   val ⦏z'let_def⦎ : THM
   val ⦏z'string_def⦎ : THM
   val ⦏z'abb_def_def⦎ : THM
   val ⦏z'sch_box_def⦎ : THM
   val ⦏z'ax_des_def⦎ : THM
   val ⦏z'given_set_def⦎ : THM
   val ⦏z'free_type_def_def⦎ : THM
   val ⦏z'constraint_def⦎ : THM
   val ⦏z_⊆_def⦎ : THM
end (* end of signature ZLanguage *);
=ENDDOC
\section{TEST POLICY}
Any functions given in this document should be tested according to the
general criteria set out in \cite{DS/FMU/IED/PLN008}, using the
tests in \cite{DS/FMU/IED/MDT052}.
In \cite{DS/FMU/IED/MDT052} the theory produced is checked by the theory design tools
of \cite{DS/FMU/IED/DTD035}, against the theory design provided.
\newpage
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}



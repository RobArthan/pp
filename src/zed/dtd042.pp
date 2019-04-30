=IGN
********************************************************************************
dtd042.doc: this file is part of the PPZed system

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

\def\Title{Detailed Design for the Z Language Expressions}

\def\AbstractText{This document contains the detailed design for the derived rules of inference, conversions and theorems for the {\ProductZ} Language expressions, which includes set theory, tuples and cartesian products.}

\def\Reference{DS/FMU/IED/DTD042}

\def\Author{G. Prout, K. Blackburn}


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
%% LaTeX2e port: \TPPtitle{Detailed Design for the Z Language Expressions}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/DTD042}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.35 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2010/04/01 17:11:02 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPclass{}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: % \TPPauthor{G.~Prout  & WIN01}  %% Mandatory field
%% LaTeX2e port: \TPPauthors{G.~Prout  & WIN01\\K.~Blackburn&WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document contains the detailed design for the
%% LaTeX2e port: derived rules of inference, conversions and theorems for the \ProductZ{} Language expressions, which includes set theory, tuples and cartesian products.}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
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

\item [Issue 1.1 (1991/08/29)]  First draft.
\item [Issue 1.2 (1992/08/20) (19th August 1992)]
Taken over by K.Blackburn, and heavily reworked.
\item [Issue 1.3 (1992/09/10) (8th September 1992)]
Further development.
\item [Issue 1.4 (1992/09/10) (10th September 1992)]
Correcting text.
\item [Issue 1.5 (1992/09/14) (10th September 1992)]
Added $z\_→\_app\_thm$, $z\_setd\_⊆\_conv$.
Removed use of $↦$ from RHS of rewrite theorems.
\item [Issue 1.6 (1992/09/15),1.7 (1992/10/05) (29th September 1992)]
Changes after comments, removal of HOL $∀$'s where possible.
\item [Issue 1.8 (1992/10/07) (6th October 1992)]
Restructuring proof contexts again.
\item [Issue 1.9 (1992/10/09) (9th October 1992)]
Changed $z\_⋃/⋂\_thm$.
\item [Issue 1.10 (1992/10/19) (12th October 1992)]
Added $z'⊆_thm1$.
Removed Z Library material.
\item [Issue 1.11 (1992/10/22),1.12 (1992/10/28) (30th October 1992)]
Changes after comments - rearrangement of material
between 041, 042 and 043.
\item [Issue 1.13 (1992/10/30) (10th November 1992)]
Changes to reflect changes in issue 1.18 of dtd041.
Changes to $z\-\_∈\-\_seta\-\_conv$.
\item [Issue 1.14 (1992/11/12) (16th November 1992)]
Correction to $z\-\_∈\-\_seta\-\_conv$ (text display only).
\item[Issue 1.15 (1992/11/16) (2nd December 1992)]
Improved $𝕌$ simplification.
\item[Issue 1.16 (1992/12/03),1.17 (1992/12/03) (4th December 1992)]
Gained $∈\_C$, and $Z\-\_∈\-\_ELIM\-\_C$, handling of literals, sequences and $z\_∈\_λ\_conv$.
\item[Issue 1.19 (1992/12/10) (4th December 1992)]
Added string literals.
\item[Issue 1.20 (1992/12/11) (10th December 1992)]
Global rename from wrk038.doc issue 1.9.
\item[Issue 1.21 (1992/12/17) (17th December 1992)]
Extended treatment of bindings.
\item[Issue 1.23 (1993/02/10)-1.24 (1993/02/11) (10th February 1992)]
Changes to proof contexts, etc.
\item[Issue 1.25 (1993/02/12) (12th February 1992)]
Fixed $z\_μ\_rule$.
\item[Issue 1.26 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.27 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.28 (2004/01/19)] The Z universal set is now called 𝕌.
\item[Issue 1.29 (2004/02/02)] Addressed comments on USR030 from QinetiQ.
\item[Issues 1.30 (2005/09/06),1.31 (2005/09/07)] Support for let-expressions.
\item[Issue 1.32 (2006/04/20)] Added {\em Z\_RANDS\_C} etc.
\item[Issue 1.32 (2006/04/20)] Added support for floating point literals
\item[Issue 1.33 (2006/10/18)] Corrected typos.
\item[Issue 1.34 (2007/05/24)] Corrected more typos.
\item[Issue 1.35 (2010/04/01)] Support for empty schemas.  Various minor corrections/improvements to documentation.
\item[Issue 1.36 (2012/12/24)] Corrected description of $z\_∈\_seta\_conv1$.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported PPZed to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
None.
\pagebreak
\section{GENERAL}
\subsection{Scope}
This document contains a detailed design for some of the
derived rules of inference, conversions and theorems for
\ProductZ, described in \cite{DS/FMU/IED/HLD015}. The rules and theorems cover Z language expressions, which includes some set theory, cartesian products and tuples.
This is called for in \cite{DS/FMU/IED/HLD016}.
The design is
implemented in \cite{DS/FMU/IED/IMP042}.

\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains a detailed design for the
initial set of rules, conversions and theorems for language expressions of \ProductZ{}. This covers :
\begin{itemize}
\item
set abstractions
\item
set displays
\item
tuples and cartesian products
\item
function application
\end{itemize}
See \cite{DS/FMU/IED/DTD041}
for the Z predicate calculus.

See \cite{DS/FMU/IED/DTD043}
for the Z schema calculus.

See \cite{DS/FMU/IED/DTD078}
for the start of the Z Library material.
\subsubsection{Dependencies}
Loading this document is dependent on \cite{DS/FMU/IED/IMP041}.
\subsubsection{Deficiencies}
None known.
\section{LANGUAGE OVERLAP BETWEEN Z AND HOL}\label{ZCAVEAT}
Many of the functions below that generate results involving terms
are stated to ``remain within the Z language''
(indicated by their results being in $ⓩ...⌝$ or
left without any such brackets at all - this document assumes
Z as the default language, HOL terms are explicitly quoted).
This should be taken to mean that in so far as the original
input was within the Z language (i.e. the range of the Z mapping)
the results will also be
(except for certain renaming problems, etc).
This will be checked by some derivative of $is\_z$, unless
otherwise noted, informing the user
if Z has been left.
Later releases will use $α\_to\_z\_conv$ to correct
what problems it can.

By default all relevant functions in this document should
be assumed to remain within the Z language and to check this fact, unless otherwise stated.
\section{EXPRESSIONS}
=DOC
signature ⦏ZExpressions⦎ = sig
=DESCRIBE
This provides the rules of inference, conversions and theorems for Z language set theory, tuples and cartesian products in the Z proof support system.
=ENDDOC
=THDOC
req_name ⦏"z_language_ps"⦎ (Value "z_language");
req_language "Z";
=DESCRIBE
The theory ``$z\_language\_ps$'' contains various ``defining theorems'' of Z language constants, derived from the definitions of
those constants, and consistency theorems for those
constants where necessary.
It is created in structure $ZPredicateCalculus$,
but primarily added to in
structure $ZExpressions$.
=ENDDOC
\subsection{Conversionals for Z Function Applications}
=DOC
val ⦏Z_RAND_C⦎ : CONV -> CONV;
val ⦏Z_RANDS_C⦎ : CONV -> CONV;
val ⦏Z_LEFT_C⦎ : CONV -> CONV;
val ⦏Z_RIGHT_C⦎ : CONV -> CONV;
=DESCRIBE
$Z\_RAND\_C$ (resp. $Z\_RANDS\_C$, $Z\_LEFT\_C$, $Z\_RIGHT\_C$)
applies a conversional to the operand (resp. operands, left operand, right operand) of a Z function application.
=ENDDOC
\subsection{Conversionals for ∈}
=DOC
val ⦏∈_C⦎ : CONV -> CONV;
=DESCRIBE
$∈\_C$ $cnv$ $tm$ takes a conversion $cnv$,
that applies to set terms,
will check to see if its term argument,
$tm$ is a membership statement.
If so, it will apply its conversion to the set.
If not it will fail.
It does not check that its result remaining in Z
(and indeed is applicable to HOL membership terms as well).
=SEEALSO
$Z\_∈\_ELIM\_C$
=FAILURE
42028	?0 is not of the form ⓩv ∈ s⌝ or ⌜v ∈ s⌝
=FAILUREC
And as conversion argument upon the set, with the error
being passed through by the conversional untouched.
=ENDDOC
=DOC
val ⦏Z_∈_ELIM_C⦎ : CONV -> CONV;
=DESCRIBE
$Z\_∈\_ELIM\_C$ $cnv$ $tm$ takes a conversion $cnv$
that can be applied to set memberships, and a set term $tm$.
The conversion is then modified to make it applicable to the term.
The resulting conversion will check to see if its term argument,
$tm$ is a set.
If so it will form the term:
=INLINEFT
ⓩxi ∈ ⓜtm⌝⌝
=TEX
(where $xi$ is the first variable in $x1$, $x2$,... not
present in $tm$),
apply $cnv$ to the result,
gaining some equation:
=GFT
⊢ xi ∈ ⓜtm⌝ ⇔ f[xi]
=TEX
and then return the theorem
=GFT
⊢ ⓜtm⌝ = {xi : 𝕌 | f[xi]}
=TEX
=FAILURE
42027	?0 is not a Z set
42026	unable to convert ?0 to the form: ⓩx ∈ {x:𝕌|s}⌝
=FAILUREC
And as conversion argument upon the membership term, with the error
being passed through by the conversional untouched.
=ENDDOC

\subsection{Concerning μ}
=DOC
val ⦏z_μ_rule⦎ : TERM -> THM;
=DESCRIBE
This rule is given a Z $μ$ expression (i.e. a Z definite description), and returns a theorem
that states what is required for this $μ$ expression
to be equal to some value, $x$.
The requirement is
that if any value satisfies the schema text of the $μ$ expression
then it must equal $x$,
and that $x$ satisfies the schema text of the $μ$ expression.
=FRULE 1 Rule
z_μ_rule
ⓩμ D | P⦁ V⌝
├
├
⊢ ∀ x:𝕌⦁
  (∀ D' | P'⦁ V' = x) ∧
   (∃ D' | P'⦁ V' = x)
   ⇒
   (μ D | P⦁ V) = x
=TEX
The result may require bound variable renaming and thus the priming of $D$, etc.
=FAILURE
47210	?0 is not a Z μ term
=ENDDOC

\subsection{Concerning let-expressionss}
=DOC
val ⦏z_let_conv1⦎ : CONV;
=DESCRIBE
This conversion replaces a let-expression by an equivalent $\mu$-expression.
=FRULE 1 Rule
z_let_conv1
ⓩlet v1 ≜ t1; ... ⦁ b⌝
├
├
⊢ (let v1 ≜ t1; ... ⦁ b) = (μ v1 : {t1}; ...⦁ b)
=TEX
This is mainly intended for use in programming proof procedures.
$z\_let\_conv$ may be used simply to expand let-expressions
=SEEALSO
$z\_let\_conv$
=FAILURE
47211	?0 is not a Z let term
=ENDDOC
=DOC
val ⦏z_let_conv⦎ : CONV;
=DESCRIBE
This conversion expands the local definitions in a let-expression.
=FRULE 1 Rule
z_let_conv
ⓩlet v1 ≜ t1; ... ⦁ b⌝
├
├
⊢ (let v1 ≜ t1; ... ⦁ b) = b[t1/v1, ...]
=TEX
The conversion will fail with message 42029 given a let-expression such as
=INLINEFT
ⓩlet x ≜ 42; y ≜ 99; x ≜ 43 ⦁ x + y⌝
=TEX
\ that contains incompatible local definitions.
=SEEALSO
$z\_let\_conv1$
=FAILURE
47211	?0 is not a Z let term
42029	The local definitions in the let-expression ?0 cannot be expanded
=ENDDOC

\subsection{Concerning Function Application}
=DOC
val ⦏z_app_conv⦎ : CONV;
=DESCRIBE
A function to convert a Z application into the
corresponding $μ$ expression (i.e. definite description).
=FRULE 1 Conversion
z_app_conv
ⓩf a⌝
├
├
⊢ f a = (μ f_a :𝕌 | (a,f_a) ∈ f⦁ f_a)
=TEX
Remains within the Z language though this is not checked.
=SEEALSO
$z\_app\_thm$, $z\_app\_eq\_tac$
=FAILURE
47190	?0 is not a Z function application
=ENDDOC
=THDOC
req_thm("⦏z_app_thm⦎",
	([],inst [] [(ⓣ'b⌝,ⓣ'a⌝), (ⓣ'a⌝,ⓣ'b⌝)]
	ⓩ∀ a : 𝕌; f : 𝕌; x : 𝕌
    ⦁ (∀ f_a : 𝕌 | (a, f_a) ∈ f ⦁ f_a = x) ∧ (a, x) ∈ f ⇒ f a = x⌝));
=DESCRIBE
A theorem that states sufficient conditions to prove that a function application
is equal to a value.
=GFT
⊢ ∀ a : 𝕌; f : 𝕌; x : 𝕌
    ⦁ (∀ f_a : 𝕌 | (a, f_a) ∈ f ⦁ f_a = x) ∧ (a, x) ∈ f ⇒ f a = x
=TEX
=USES
In implementing methods of reasoning about applications.
=SEEALSO
$z\_app\_conv$, $z\_app\_eq\_tac$, $z\_app\_∈\_thm$, $z\_∈\_app\_thm$
=ENDDOC
=THDOC
req_thm("⦏z_app_∈_thm⦎", ([],
	ⓩ∀ a:𝕌; x:𝕌; f: 𝕌⦁
	(∃ f_x : 𝕌 ⦁ f_x ∈ a ∧ (x, f_x) ∈ f ∧
	(∀ f_x1 :𝕌 ⦁ (x, f_x1) ∈ f ⇒ f_x1 = f_x)) ⇒ f x ∈ a⌝));
req_thm("⦏z_∈_app_thm⦎", ([],
	ⓩ∀ a:𝕌; x:𝕌; f: 𝕌⦁
	(∃ f_x : 𝕌 ⦁ a ∈ f_x ∧ (x, f_x) ∈ f ∧
	(∀ f_x1 :𝕌 ⦁ (x, f_x1) ∈ f ⇒ f_x1 = f_x)) ⇒ a ∈ f x⌝));
=DESCRIBE
For reasoning about membership and function application.
=SEEALSO
$z\_app\_thm$
=ENDDOC
=DOC
val ⦏z_app_eq_tac⦎ : TACTIC;
=DESCRIBE
Reduces a subgoal that states a Z application is equal to
something to sufficient conditions for this to be provable.
The conditions are not ``necessary'' only because they
ignore the fact that in \ProductZ{} every predicate or expression is
equal to itself, and other vacuous variants of this.
=FRULE 2 Tactic
z_app_eq_tac
├
{Γ} f a = v
├
{Γ} (∀ f_a : 𝕌 | (a, f_a) ∈ f⦁ f_a = v)
	∧ (a,v) ∈ f
=TEX
If this does not match the pattern of the goal then
=FRULE 2 Tactic
z_app_eq_tac
├
{Γ} v = f a
├
{Γ} (∀ f_a : 𝕌 | (a, f_a) ∈ f⦁ f_a = v)
	∧ (a,v) ∈ f
=TEX
will be tried instead.
In addition an implicit ``$⇔\ true$'' will be used
if the conclusion of the goal is an application.
=SEEALSO
$z\_app\_thm$, $z\_app\_conv$
=FAILURE
42002	Conclusion of goal is not of the form: ⓩf a = v⌝, ⓩv = f a⌝ or ⓩf x⌝
=ENDDOC
There may be a flaw in the mapping that allows us to do these!
\subsection{Concerning λ}
=DOC
val ⦏z_λ_conv⦎ : CONV;
val ⦏z_∈_λ_conv⦎ : CONV;
=DESCRIBE
Convert a Z $λ$ abstraction into a set abstraction.
=FRULE 1 Conversion
z_λ_conv
ⓩλ D | P⦁ V⌝
├
├
⊢ (λ D | P⦁ V) = { D | P⦁ (charD,V)}
=TEX
Where $charD$ is the characteristic tuple of $D$.

=GFT Definition
val z_∈_λ_conv = ∈_C z_λ_conv;
=TEX
=SEEALSO
$z\_app\_λ\_rule$, $z\_β\_tac$
=FAILURE
47200	?0 is not a Z λ abstraction
=ENDDOC
=DOC
val ⦏z_app_λ_rule⦎ : TERM -> THM;
=DESCRIBE
Given a Z $β$ redex this function will return a theorem
stating sufficient conditions for this redex
to be proven equal to some arbitrary value.
=FRULE 1 Rule
z_app_λ_rule
ⓩ(λ D | P⦁ V) t⌝
├
├
⊢ ⓩ∀ x:𝕌 ⦁ (∀ f_a :𝕌 | (∃ D' | P'⦁
charD' = t ∧ V' = f_a) ⦁ f_a = x)
  ∧
  (∃ D' | P'⦁ (charD' = t) ∧ V' = x)
  ⇒
  (λ D | P⦁ V) t = x⌝
=TEX
Some renaming of bound variables may occur, thus the priming
of $D$, etc.
=FAILURE
42008	?0 is not of the form: ⓩ(λ D | P⦁ V) t⌝
=ENDDOC
=DOC
val ⦏z_β_conv⦎ : CONV;
=DESCRIBE
A conversion for a simple Z $β$ redex.
The $λ$-term of the redex must have only a single variable in its declaration
part.
=FRULE 1 Conversion
z_β_conv
ⓩ(λ x:X | P[x]⦁ V[x]) t⌝
├
├
t ∈ X,
P[t]
⊢  (λ x:X | P[x]⦁ V[x]) t = V'[t]
=TEX
The assumptions will be eliminated if trivial
(i.e. if the first assumption can be proven true by $z\_∈\_u\_conv$,
the second if the assumption is just $ⓩtrue⌝$).
Some renaming of bound variables may occur, thus the priming
of $V$.
=FAILURE
42012	?0 is not of the form ⓩ(λ x:X | P⦁ V) t⌝
=ENDDOC
Later releases could make this function more intelligent.

\subsection{Reflexivity, Symmetry, Transitivity of Equality}
The reflexivity of equality considered as a conversion is implemented by $refl\_conv$ in HOL, see \cite{DS/FMU/IED/DTD007}.
This conversion may also be used for Z terms.

Similarly $eq\_sym\_conv$ and $eq\_trans\_rule$ also apply in Z reasoning.
\subsection{Extensionality}
=THDOC
req_thm("⦏z_sets_ext_thm⦎", ([],ⓩ∀ x:𝕌; y: 𝕌 ⦁
	(x = y) ⇔
	(∀z: 𝕌⦁ ((z ∈ x) ⇔ (z ∈ y)))⌝));
=DESCRIBE
The extensionality theorem for the equality of two sets.
=SEEALSO
$z\_sets\_ext\_conv$
=ENDDOC
=DOC
val ⦏z_sets_ext_conv⦎ : CONV;
=DESCRIBE
Use the extensionality of sets in combination with
knowledge about tuples.
Given as input an equality of the form $v\ =\ w$ then:

If $v$ is of type $ty$ $SET$ where $ty$ is not a tuple type:
=FRULE 1 Conversion
z_sets_ext_conv
ⓩv = w⌝
├
├
⊢ (v = w) ⇔
	(∀ xn : 𝕌 ⦁ xn ∈ v ⇔ xn ∈ w)
=TEX
where $xn$ is the first variable in the list $x1$, $x2$,...
that doesn't appear in $v$ or $w$ (free or bound).

If $w$ is of type $ty$ $SET$ where $ty$ is an n-tuple type, or binding type, then sufficient $x_i$ will be introduced,
instead of just $xn$, to allow $xn$ to be replaced by a construct
of bindings and tuples of the $x_i$, such that no $x_i$ has a binding or tuple type and appears exactly once in the construct.
=EXAMPLE
z_sets_ext_conv ⓩ(r × [a,b:X] × x2) = d⌝ =
⊢ r × [a, b : X] × x2 = d
    ⇔ (∀ x1 : 𝕌; x3 : 𝕌; x4 : 𝕌
      ⦁ (x1, x3, x4) ∈ r × [a, b : X] × x2 ⇔ (x1, x3, x4) ∈ d)
=TEX
Notice how the introduced universal quantification ``skips''
$x2$ which is present in the input term.
=SEEALSO
$z\_sets\_ext\_thm$
=FAILURE
42010	?0 is not of the form: ⓩv = w⌝ where ⓩv⌝ has a set type
=ENDDOC

\subsection{Power Set}
=THDOC
req_thm("⦏z_∈_ℙ_thm1⦎", ([],ⓩ∀ t:𝕌; u: 𝕌⦁
	(t ∈ ℙ u) ⇔ (∀z: 𝕌⦁ ((z ∈ t) ⇒ (z ∈ u)))⌝));
=DESCRIBE
Power set.
=SEEALSO
$z\_∈\_ℙ\_conv$
=ENDDOC
=TEX
=DOC
val ⦏z_∈_ℙ_conv⦎ : CONV;
=DESCRIBE
Use $z\_∈\_ℙ\_thm1$ in combination with
knowledge about tuples.
Given as input a term of the form $v\ ∈ ℙ\ w$ then:

If $w$ is of type $ty$ $SET$ where $ty$ is not a tuple type:
=FRULE 1 Conversion
z_∈_ℙ_conv
ⓩv ∈ ℙ w⌝
├
├
⊢ (v ∈ ℙ w) ⇔
	(∀ xn : 𝕌 ⦁ xn ∈ v ⇒ xn ∈ w)
=TEX
where $xn$ is the first variable in the list $x1$, $x2$,...
that doesn't appear in $v$ or $w$ (free or bound).

If $w$ is of type $ty$ $SET$ where $ty$ is an n-tuple type, or binding type, then sufficient $x_i$ will be introduced,
instead of just $xn$, to allow $xn$ to be replaced by a construct
of bindings and tuples of the $x_i$, such that no $x_i$ has a binding or tuple type and appears exactly once in the construct.
=EXAMPLE
z_∈_ℙ_conv ⓩp ∈ ℙ (r × [a,b:X] × x2)⌝ =
⊢ p ∈ ℙ (r × [a, b : X] × x2)
    ⇔ (∀ x1 : 𝕌; x3 : 𝕌; x4 : 𝕌; x5 : 𝕌
      ⦁ (x1, (a ≜ x3, b ≜ x4), x5) ∈ p
        ⇒ (x1, (a ≜ x3, b ≜ x4), x5) ∈ r × [a, b : X] × x2)
=TEX
Notice how the introduced universal quantification ``skips''
$x2$ which is present in the input term.
=SEEALSO
$z\_∈\_ℙ\_thm1$, $z\_∈\_ℙ\_thm$, $z\_⊆\_conv$
=FAILURE
42016	?0 is not of the form ⓩv ∈ ℙ w⌝
=ENDDOC
=DOC
val ⦏z_setd_∈_ℙ_conv⦎ : CONV
=DESCRIBE
Expand out expressions that state that a set display
is a member of a power set.
=TEX
{}.
=FRULE 1 Conversion
z_setd_∈_ℙ_conv
ⓩ{x⋎1,...} ∈ ℙ X⌝
├
├
ⓩ{x⋎1,...} ∈ ℙ X ⇔
(x⋎1 ∈ X ∧ ...)
=TEX
and
=FRULE 1 Conversion
z_setd_∈_ℙ_conv
ⓩ{} ∈ ℙ X⌝
├
├
ⓩ{} ∈ ℙ X ⇔ true
=TEX
The conversion will all simplify certain subterms involving
$true$ or terms of the form $x\ =\ x$.
=SEEALSO
$z\_setd\_⊆\_conv$
=FAILURE
42019	?0 is not of the form: ⓩ{x⋎1,...} ∈ ℙ X⌝
=ENDDOC

\subsection{Set Abstraction}
=DOC
val ⦏z_∈_seta_conv⦎ : CONV;
val ⦏z_∈_seta_conv1⦎ : CONV;
=DESCRIBE
A conversion of membership of a Z set abstraction into a Z existential quantification. Bound variables in the existential quantification are renamed as necessary.
=FRULE 1 Conversion
z_∈_seta_conv
ⓩt ∈ { D | P⦁ T}⌝
├
├
⊢ (t ∈ { D | P⦁ T}) ⇔
  (∃ D' | P'⦁ T' = t)
=TEX
In the case of $z\_∈\_seta\_conv1$,
if $T$ is a tuple or simple variable
then the conversion will attempt to eliminate
the existential quantification by deriving equational constraints on
the variables declared in $D'$ from the equation $T' = t$.
This attempt will always succeed if $T$ is the characteristic tuple of $D$.

No simplification is attempted by $z\_∈\_seta\_conv$

Renaming of bound variables may be necessary, thus the priming in the RHS.
=FAILURE
42001	?0 is not of the form: ⓩt ∈ seta⌝ where seta is a set abstraction
=ENDDOC
=TEX
\subsection{Set Display}
=DOC
val ⦏z_∈_setd_conv1⦎ : CONV;
=DESCRIBE
A conversion proving membership of a Z set display where
the member is syntactically identical
(up to $α$-conversion) to a member of the set.
=FRULE 1 Conversion
z_∈_setd_conv1
ⓩt ∈ { ..., t, ...}⌝
├

├
⊢ t ∈ { ..., t, ...} ⇔ true
=TEX
=SEEALSO
$z\_∈\_setd\_conv$
=FAILURE
42009	?0 is not of the form: ⓩt ∈ {...,t,...}⌝
=ENDDOC

\section{TUPLES}
=DOC
val ⦏z_tuple_lang_eq_conv⦎ : CONV;
=DESCRIBE
A conversion for eliminating tuples over equality.
=FRULE 1 Conversion
z_tuple_lang_eq_conv
ⓩ(t⋎1,t⋎2,...) = (u⋎1,u⋎2,...)⌝
├
├
⊢ (t⋎1,t⋎2,...) = (u⋎1,u⋎2,...) ⇔
((t⋎1 = u⋎1) ∧ (t⋎2 = u⋎2) ∧ ...)
=TEX
=SEEALSO

=FAILURE
42003	?0 is not of the form: ⓩ(x1,...) = (y1,...)⌝
=ENDDOC
=DOC
val ⦏z_sel⋎t_lang_conv⦎ : CONV;
=DESCRIBE
This conversion carries out the
selection from a tuple display.
=FRULE 1 Conversion
z_sel⋎t_lang_conv
ⓩ(t⋎1,...,t⋎i,...,t⋎n).i⌝
├
├
⊢ (t⋎1,...,t⋎i,...,t⋎n).i = t⋎i
=TEX
=FAILURE
47185	?0 is not a Z tuple selection
42006	?0 is not of the form ⓩ(x,...).i⌝
=ENDDOC
=DOC
val ⦏z_tuple_lang_intro_conv⦎ : CONV;
=DESCRIBE
This conversion carries out the
elimination of a tuple display of tuple selections
from the same tuple.
=FRULE 1 Conversion
z_tuple_lang_intro_conv
ⓩ(t.1,...,t.n)⌝
├
├
⊢ (t.1,...,t.n) = t
=TEX
where $n$ is the arity of $t$.
=FAILURE
42005	?0 is not of the form: ⓩ(t.1,...,t.n)⌝
=ENDDOC
=DOC
val ⦏z_sel⋎t_intro_conv⦎ : CONV;
=DESCRIBE
This conversion carries out the
introduction of a tuple display of tuple selections
from the same tuple.
=FRULE 1 Conversion
z_sel⋎t_intro_conv
ⓩt⌝
├
├
⊢ t = (t.1,...,t.n)
=TEX
=FAILURE
42004	?0 does not have a Z tuple type
=ENDDOC

\section{CARTESIAN PRODUCTS}
=DOC
val ⦏z_×_conv⦎ : CONV;
=DESCRIBE
A conversion for eliminating cartesian products.
=FRULE 1 Conversion
z_×_conv
ⓩT⋎1 × T⋎2 × ...⌝
├
├
⊢ (T⋎1 × T⋎2 × ...) =
	{t⋎1:T⋎1; t⋎2:T⋎2; ...⦁(t⋎1, t⋎2,...)}
=TEX
The $t⋎i$ used are distinct from any variable names
in the $T⋎i$.
=SEEALSO
$z\_∈\_×\_conv$, which is a faster function, if appropriate.
=FAILURE
47160	?0 is not a Z cartesian product
=ENDDOC
=DOC
val ⦏z_∈_×_conv⦎ : CONV;
=DESCRIBE
A conversion for the membership of cartesian products.
=FRULE 1 Conversion
z_∈_×_conv
ⓩt ∈ (T⋎1 × T⋎2 × ...)⌝
├
├
⊢ t ∈ (T⋎1 × T⋎2 × ...) ⇔
	t.1 ∈ T⋎1 ∧ t.2 ∈ T⋎2 ∧ ...
=TEX
$z\_sel⋎t\_conv$, q.v., will be attempted on each of the
tuple selections.
=SEEALSO
$z\_×\_conv$
=FAILURE
42007	?0 is not of the form: ⓩt ∈ (T⋎1 × T⋎2 × ...)⌝
=ENDDOC
\section{BINDINGS}
=DOC
val ⦏z_binding_eq_conv⦎ : CONV;
val ⦏z_binding_eq_conv1⦎ : CONV;
val ⦏z_binding_eq_conv2⦎ : CONV;
=DESCRIBE
A conversion for eliminating equations of bindings.
=FRULE 1 Conversion
z_binding_eq_conv
ⓩb⋎1 = b⋎2⌝
├
├
⊢ (b⋎1 = b⋎2) ⇔ (b⋎1.s⋎1 = b⋎2.s⋎1) ∧
	(b⋎1.s⋎2 = b⋎2.s⋎2) ∧ ...
=TEX
where $b⋎1$ (and thus $b⋎2$) has a binding type equal
to the type of something of the form
=INLINEFT
ⓩ(s⋎1 ≜ ..., s⋎2 ≜ ..., ...)⌝
=TEX
{}.

$z\_binding\_eq\_conv1$ first applies conversion
$z\_binding\_eq\_conv$, and then, if either
or both of $b⋎1$ and $b⋎2$ are binding constructions it
eliminates the projection functions, in a manner
similar to $z\_sel⋎s\_conv$.

$z\_binding\_eq\_conv2$ requires both sides to be binding displays
or have the empty schema type:
=FRULE 1 Conversion
z_binding_eq_conv2
ⓩ(l⋎1 ≜ x⋎1,...) = (l⋎1 ≜ y⋎1,...)⌝
├
├
⊢ ((l⋎1 ≜ x⋎1,...) = (l⋎1 ≜ y⋎1,...)) ⇔
	(x⋎1 = y⋎2) ∧ ...
=TEX
=FRULE 1 Conversion
z_binding_eq_conv2
ⓩ(b⋎1 ⦂ []) = b⋎2⌝
├
├
⊢ ((b⋎1 ⦂ []) = b⋎2) ⇔ true
=TEX
=SEEALSO
$z\_sel⋎s\_conv$, $z\_binding\_eq\_conv3$
=FAILURE
42013	?0 is not of the form ⓩbinding = binding⌝
42021	?0 is not of the form ⓩb⋎1 = b⋎2⌝ where b⋎i has the form ⓩ(x⋎1 ≜ ..., ...)⌝ or has the empty schema type
=ENDDOC

=DOC
val ⦏z_sel⋎s_conv⦎ : CONV;
=DESCRIBE
A conversion for selecting a component from a binding.
=FRULE 1 Conversion
z_sel⋎s_conv
ⓩ(n⋎1 ≜ t⋎1,...).n⋎c⌝
├
├
⊢ (n⋎1 ≜ t⋎1,...).n⋎c = t⋎c
=SEEALSO
$z\_binding\_eq\_conv$
=FAILURE
42014	?0 is not of the form: ⓩ(n⋎1 ≜ t⋎1,...).n⋎c⌝
=ENDDOC
=DOC
val ⦏z_bindingd_intro_conv⦎ : CONV
=DESCRIBE
Given a value with a binding type, prove it equal to
a binding display.
=FRULE 1 Conversion
z_bindingd_intro_conv
ⓩb⌝
├
├
⊢ b = (x⋎1 ≜ b.x⋎1, ...)
=TEX
=FAILURE
42017	?0 does not have a binding type
=ENDDOC
=DOC
val ⦏z_bindingd_elim_conv⦎ : CONV
=DESCRIBE
Given a binding display, that binds labels to the
selection of that label to a single value,
return that single value.
=FRULE 1 Conversion
z_bindingd_elim_conv
ⓩ(x⋎1 ≜ b.x⋎1, ...)⌝
├
├
⊢ (x⋎1 ≜ b.x⋎1, ...) = b
=TEX
=FAILURE
42018	?0 is not of the form: ⓩ(x⋎1 ≜ b.x⋎1, ..., x⋎N ≜ b.x⋎N)⌝ where N ≥ 1
=ENDDOC
\section{SEQUENCE DISPLAYS}
=DOC
val ⦏z_⟨⟩_conv⦎ :CONV;
val ⦏z_∈_⟨⟩_conv⦎ :CONV;
=DESCRIBE
Convert a sequence display into a set display.
=FRULE 1 Conversion
z_⟨⟩_conv
ⓩ⟨x1,...,xn⟩⌝
├
├
⊢ ⟨x1,...,xn⟩ =
 {(1,x1),...,(n,xn)}
=TEX

=GFT Definition
val z_∈_⟨⟩_conv = ∈_C z_⟨⟩_conv;
=TEX
=FAILURE
42025	?0 is not of the form: ⓩ⟨ ... ⟩⌝
=ENDDOC
\section{STRING LITERALS}
=DOC
val ⦏z_string_conv⦎ : CONV;
val ⦏z_∈_string_conv⦎ : CONV;
=DESCRIBE
$z\_string\_conv$ changes a Z string into a Z sequence of
HOL characters.
It thus does not remain in Z.
=FRULE 1 Conversion
z_string_conv
ⓩ"abc..."⌝
├
├
⊢ "abc..." = ⟨⌜`a`⌝,⌜`b`⌝,⌜`c`⌝,...⟩
=TEX
=GFT Definition
val z_∈_string_conv = ∈_C z_string_conv;
=TEX
=SEEALSO
$char\_eq\_conv$ for the equality of HOL characters,
$z\-\_string\-\_eq\-\_conv$ for the equality of Z strings.
=FAILURE
42015	?0 is not of the form: ⓩ"abc..."⌝
=ENDDOC
\section{MISCELLANEOUS}
=DOC
val ⦏z_defn_simp_rule⦎ : THM -> THM;
=DESCRIBE
This rule is a method of processing a standard style
of specification into a simple rewriting theorem.
=FRULE 1 Rule
z_defn_simp_rule
├
⊢ x ∈ (ℙ y) ∧ (∀z:y⦁ z ∈ x ⇔ f[z])
├
⊢ ∀ z: 𝕌 ⦁ z ∈ x ⇔ z ∈ y ∧ f[z]
=TEX
The rule will also attempt to preprocess its input with $z\_para\_pred\_conv$.
This is on the basis that theorems that
are of an appropriate form for this
rule are often derived from a Z definition, and
this pre-processing is all the processing required to
convert the definition to acceptable input.
The rule can also handle generic parameters to the theorem.
=FAILURE
42011	?0 cannot be converted to the form:
	`Γ ⊢ x ∈ (ℙ y) ∧ (∀z:y⦁ z ∈ x ⇔ f[z])`
=ENDDOC
\section{PROOF CONTEXTS}
We provide the following proof contexts to reason about the above:

\begin{tabular}{l p{3in}}
$'z\_∈\_set\_lang$ & Simple algebraic reasoning about set theory of the Z language, especially $∈$. (e.g. $ℙ$) \\
$'z\_tuples\_lang$ & Reasoning about Z tuples and cartesian products within the Z language\\
$'z\_sets\_ext\_lang$ & Reasoning about Z set extensionality within the Z language\\
$'z\_bindings$ & Reasoning about Z binding displays\\
\end{tabular}

The above proof contexts
will allow $strip\_tac$ to remain within the Z language
on each of its steps, though with the caveat noted in \ref{ZCAVEAT}.

$step\_strip\_tac$ is able to
leave the Z language, which it does for
stripping
a Z existentially quantified antecedent to an implication.
However,
=INLINEFT
REPEAT step_strip_tac
=TEX
{} will remain within the Z language if its argument starts there.

Some stripping theorems (e.g., later, for $◁$)
raise the dilemma of how and whether to
avoid leaving terms of the forms $ⓩ(x,y).1⌝$
(a special case is $ⓩ(x\ ↦\ y).1⌝$)
and $ⓩ(p.1,p.2)⌝$.
The first form is bad because of functionality problems;
the second is primarily bad because it is verbose,
but also because it provides a less general term for,
e.g., rewriting with.
We currently address this by including three theorems for
each problem operator, and relying on the discrimination
net effect of choosing ``the best match'' (see \cite{DS/FMU/IED/DTD008})
to get results that avoid the forms $ⓩ(x,y).1⌝$ and $ⓩ(p.1,p.2)⌝$.
We include all three theorems in both rewriting and stripping,
without relying on $z\-\_sel⋎t\-\_conv$
during rewriting.
Thus for instance we include the theorems:
=GFT
⊢ ∀ p S R⦁ ⓩp ∈ S ◁ R ⇔ p.1 ∈ S ∧ p ∈ R⌝
⊢ ∀ p1 p2 S R⦁ ⓩ(p1,p2) ∈ S ◁ R ⇔ p1 ∈ S ∧ (p1,p2) ∈ R⌝
⊢ ∀ p1 p2 S R⦁ ⓩ(p1 ↦ p2) ∈ S ◁ R ⇔ p1 ∈ S ∧ (p1 ↦ p2) ∈ R⌝
=TEX
The latter two theorems are automatically generated from the first.
This is only one possible solution, and not even necessarily the best.
Others include addressing the introduction of extensionality
variables, or ``fall back'' conversions if nothing else
applies to a term of the form $ⓩp\ ∈\ q⌝$.
The operators affected (to date) are:
=INLINEFT
⩤, ⩥, ◁, ▷, and o
=TEX
{}.
=DOC
(* Proof Context: ⦏'z_∈_set_lang⦎ *)
=DESCRIBE
A component proof context for handling the membership of expressions created by Z language set operations.
It also provides some simplifications.

Set expressions treated by this proof context are constructs formed from:
=GFT
set displays, set comprehensions, ℙ, λ, μ, application,
sequence displays
=TEX
If there was proof context material for string literals, or bag displays, it would perhaps go here.
\paragraph{Contents}\

Rewriting:
=GFT
z_∈_seta_conv1, z_∈_setd_conv1, z_∈_λ_conv, z_∈_⟨⟩_conv,
z_β_conv if its resulting theorem has no assumptions.
=TEX

Stripping theorems:
=GFT
z_∈_seta_conv1, z_∈_setd_conv1, z_∈_λ_conv, z_∈_⟨⟩_conv,
plus these all pushed in through ¬,
and z_β_conv, ∈_C z_β_conv if the resulting theorem has no assumptions.
=TEX

Stripping conclusions:
=GFT
z_∈_seta_conv1, z_∈_setd_conv1, z_∈_λ_conv, z_∈_⟨⟩_conv,
plus these all pushed in through ¬,
and z_β_conv, ∈_C z_β_conv if the resulting theorem has no assumptions.
=TEX

Rewriting canonicalisation:
=GFT
=TEX

Automatic proof procedures are respectively $z\-\_basic\-\_prove\-\_tac$,
$z\-\_basic\-\_prove\-\_conv$,
and
no existence prover.
\paragraph{Usage Notes}
It requires theory $z\-\_sets$.
It is intended to be used with proof context ``z$\_$predicates''.
It is not intended to be mixed with HOL proof contexts.
=SEEALSO
$'z\_sets\_ext$
=ENDDOC
The universal set, $𝕌$, is processed by proof context
$z\_predicates$.
No aspect of the proof context concerns itself with function
application, other than the limited $β$-reduction,
nor with $μ$-terms.
This is because there is no ``usually good'' approach
that can be offered for these.
=DOC
(* Proof Context: ⦏'z_sets_ext_lang⦎ *)
=DESCRIBE
An aggressive component proof context for handling the manipulation of Z sets by breaking them into predicate calculus, within the Z language.
It is intended to always be used in conjunction with ``$'$z$\_$set$\_$lib''.

Set expressions treated by this proof context are constructs formed from:
=GFT
set displays, set comprehensions, ℙ, λ, μ, application,
equality of two set expressions, sequence displays
=TEX
\paragraph{Contents}\

Rewriting:
=GFT
z_sets_ext_conv, z_∈_ℙ_conv, z_setd_∈_ℙ_conv,
=TEX

Stripping theorems:
=GFT
z_sets_ext_conv, z_∈_ℙ_conv, z_setd_∈_ℙ_conv,
plus these all pushed in through ¬
=TEX

Stripping conclusions:
=GFT
z_sets_ext_conv, z_∈_ℙ_conv, z_setd_∈_ℙ_conv,
plus these all pushed in through ¬
=TEX

Rewriting canonicalisation:
=GFT
=TEX

Automatic proof procedures are respectively $z\-\_basic\-\_prove\-\_tac$,
$z\-\_basic\-\_prove\-\_conv$,
and
no existence prover (2-tuples are handled in proof
context ``z$\_$predicates'').
\paragraph{Usage Notes}
It requires theory $z\-\_sets$.
It is intended to always be used in conjunction with ``$'$z$\_$set$\_$lang''.

It is not intended to be mixed with HOL proof contexts.
=SEEALSO
$'z\_∈\_set$
=ENDDOC

=DOC
(* Proof Context: ⦏'z_tuples_lang⦎ *)
=DESCRIBE
A component proof context for handling the manipulation of Z tuples and cartesian products within the Z language.

Expressions and predicates treated by this proof context are constructs formed from:
=GFT
(membership of) ×, equations of tuple displays,
selection from tuple displays
=TEX

\paragraph{Contents}\

Rewriting:
=GFT
z_∈_×_conv,
z_tuple_lang_eq_conv, z_sel⋎t_lang_conv
=TEX

Stripping theorems:
=GFT
z_∈_×_conv, z_tuple_lang_eq_conv, ∈_C z_sel⋎t_lang_conv,
z_sel⋎t_lang_conv (for boolean compoents of tuples)
plus these all pushed in through ¬
=TEX

Stripping conclusions:
=GFT
z_∈_×_conv, z_tuple_lang_eq_conv, ∈_C z_sel⋎t_lang_conv,
z_sel⋎t_lang_conv (for boolean compoents of tuples)
plus these all pushed in through ¬
=TEX
Stripping also contains the above in negated forms.

Rewriting canonicalisation:
=GFT
=TEX

Automatic proof procedures are respectively $z\-\_basic\-\_prove\-\_tac$,
$\-\_basic\-\_prove\-\_conv$,
and
no existence prover (2-tuples are handled in proof
context ``z$\_$predicates'').
\paragraph{Usage Notes}
It requires theory $z\-\_sets$.
It is intended to be used with proof context ``z$\_$predicates''.
It should not be used with ``$'$z$\_$tuples$\_$lang''.
It is not intended to be mixed with HOL proof contexts.
=ENDDOC
Perhaps later releases will add rules such as
=GFT
(a,b,...) = p ⇔ (a = p.1 ∧ b = p.2 ∧ ...)
=TEX
perhaps into a separate $'z\_tuples\_ext$.
=DOC
(* Proof Context: ⦏'z_bindings⦎ *)
=DESCRIBE
A component proof context for handling the manipulation of Z bindings.

Expressions and predicates treated by this proof context are constructs formed from:
=GFT
equations of binding displays,
selection from binding displays
=TEX

\paragraph{Contents}\

Rewriting:
=GFT
z_binding_eq_conv2, z_sel⋎s_conv
=TEX

Stripping theorems:
=GFT
z_binding_eq_conv2, ∈_C z_sel⋎s_conv,
z_sel⋎s_conv (where component of binding is boolean).
plus this pushed in through ¬
=TEX

Stripping conclusions:
=GFT
z_binding_eq_conv2, ∈_C z_sel⋎s_conv,
z_sel⋎s_conv (where component of binding is boolean).
plus this pushed in through ¬
=TEX

Rewriting canonicalisation:
=GFT
=TEX

Automatic proof procedures are respectively $z\-\_basic\-\_prove\-\_tac$,
$z\-\_basic\-\_prove\-\_conv$,
and
no existence prover.
\paragraph{Usage Notes}
It requires theory $z\-\_language\-\_ps$.
It is intended to be used with proof context ``z$\_$predicates''.
It is not intended to be mixed with HOL proof contexts.
=ENDDOC
The question of whether to do the rewrites:
=GFT
(lab1 ≜ x.lab1, lab2 ≜ x.lab2) ---> x
(x.1, x.2) ---> x
=TEX
is controversial.
Thus they are not included in the basic proof contexts.
They interact with the treatment of equality on items with
tuple type and binding type, and other such things. One
can imagine two further component proof contexts, one
which does its best to expand all items of binding and tuple type into their respective displays (while avoiding looping),
the other which puts all such displays back together.
These may be better offered as conversions, based on mapping
the constuent conversions in an appropriate maner.

Further proof contexts could be more aggressive in
handling the equality of bindings.
=TEX
\section{Theorems in the Signature}
=DOC
val z_sets_ext_thm : THM;
val z_∈_ℙ_thm1 : THM;
val z_app_thm : THM;
val z_app_∈_thm : THM;
val z_∈_app_thm : THM;
=DESCRIBE
The ML bindings of the theorems (other than consistency ones)
in theory $z\-\_language\-\_ps$.
=ENDDOC
\section{END OF THE SIGNATURE}
=SML
end; (* signature of ZExpressions *)
=TEX
\section{TEST POLICY}
The functions in this document should be tested as described in
\cite{DS/FMU/IED/PLN008}.

\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}

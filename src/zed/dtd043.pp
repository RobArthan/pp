=IGN
********************************************************************************
dtd043.doc: this file is part of the PPZed system

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

\def\Title{Detailed Design for the Z Schema Calculus}

\def\AbstractText{This document contains the detailed design for the Z schema calculus in {\ProductZ}.}

\def\Reference{DS/FMU/IED/DTD043}

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
%% LaTeX2e port: \TPPtitle{Detailed Design for the Z Schema Calculus}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/DTD043}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.31 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2007/05/24 15:14:58 $
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPclass{}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: % \TPPauthor{G.~Prout & WIN01}  %% Mandatory field
%% LaTeX2e port: \TPPauthors{G.~Prout & WIN01\\K.~Blackburn & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.B.~Jones & FMU Manager}
%% LaTeX2e port: \TPPabstract{This document contains the detailed design for the
%% LaTeX2e port:  Z schema calculus in \ProductZ.}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	    Project Library
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
\item [Issue 1.1 (1991/12/09)] First issue.
\item [Issue 1.2 (1992/10/02)]
Heavily reworked by KB.
\item [Issue 1.3 (1992/10/06), 2nd October 1992]
Reworking.
\item [Issue 1.4 (1992/10/14), 7th October 1992]
Changes after comments.
\item [Issue 1.5 (1992/10/19), 14th October 1992]
Dependencies changed.
\item [Issue 1.5 (1992/10/19), 19th October 1992]
Notes on $schema\_ref\_conv$.
\item [Issue 1.6 (1992/10/21)-8, 29th October 1992]
Changes to reflect Z theory reorganisation.
\item [Issue 1.9 (1992/11/12), 11th November 1992]
Changes as a consequence of changes in dependences.
\item [Issue 1.10 (1992/11/24), 20th November 1992]
Completing the Schema Calculus.
\item [Issue 1.11 (1992/11/27), 25th November 1992]
Changes after comments.
\item [Issue 1.12 (1992/12/01), 1st December 1992]
Improved processing of schema quantification.
\item[Issue 1.13 (1992/12/03) (2nd December 1992)]
Improved $𝕌$ simplification.
\item[Issue 1.13 (1992/12/03) (3rd December 1992)]
Lost $∈\_C$, and $Z\-\_∈\-\_ELIM\-\_C$.
\item[Issue 1.14 (1992/12/03) (8th December 1992)]
Improvements to handling of schemas as predicates,
and bindings.
Removed proof context for extensional treatment of schemas.
\item[Issue 1.15 (1992/12/08) (9th December 1992)]
Added error 43033.
\item[Issue 1.17 (1992/12/11) (10th December 1992)]
Global rename from wrk038.doc issue 1.9.
\item[Issue 1.18 (1992/12/18) (20th January 1993)]
Gained $z\_strip\_tac$.
\item[Issue 1.20 (1993/02/10),1.21 (1993/02/11) (5th-11th February 1993)]
Rearranging proof contexts.
\item[Issue 1.22 (1993/09/22), 1.23 (1993/09/22) (22nd September 1993)]
Tidying up descriptions.
\item[Issue 1.24 (1994/11/04) (4th November 1994)]
Added new conversion for massaging ill-formed schemas-as-declarations back into Z.
\item[Issue 1.25 (1997/04/25) (25th April 1997)]
Added message 43035.
\item[Issue 1.26 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.27 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.28 (2004/01/19)] The Z universal set is now called 𝕌.
\item[Issue 1.29 (2005/04/16)] Corrected descriptions of the conversions for schema existentials and unique existentials.
\item[Issue 1.30 (2006/01/25)] The name of the decoration operator is now based on the stem {\em decor} throughout, rather than {\em decor} in some places and {\em dec} in others.
\item[Issue 1.31 (2007/05/24)] Corrected typos.
\item[Issue 1.32 (2010/04/01)] Support for empty schemas.  Various minor corrections/improvements to documentation.
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
This document contains a detailed design for the
derived rules of inference for
the Z Proof Support System schema calculus.
This is called for in \cite{DS/FMU/IED/HLD016}.
The design is
implemented in \cite{DS/FMU/IED/IMP043}.

\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains a detailed design for the
initial set of rules and conversions for the schema calculus of the Z Proof Support System. Section \ref{CONVANDRULE} describes the main conversions and rules for the Z schema calculus.
The extended Z language supported is documented in the
Z User Interface subsystem, \cite{DS/FMU/IED/HLD018}.

Where we provide conversions upon terms that have a Z set type
we provide at least one equivalent conversion upon membership
of such terms, and vice versa.
This may be done by, e.g., the conversional $∈\_C$ applied to
the original conversion,
or both of the pair may have custom implementations.

By default all relevant functions in this document should
be assumed to remain within the Z language and to check this fact, unless otherwise stated.
\subsubsection{Dependencies}
Loading this document is dependent on those
having loaded \cite{DS/FMU/IED/IMP042}.

\pagebreak
\section{Z SCHEMA CALCULUS}
=DOC
signature ⦏ZSchemaCalculus⦎ = sig
=DESCRIBE
This provides the rules of inference for schema calculus in the Z proof support system.
The material is implemented within the theory $z\-\_language\-\_ps$.
=ENDDOC
=FAILURE
43000	DESIGN ERROR: a check failed that should never fail
=TEX
\subsection{Stripping}
The following description could be made more Z-like at the
cost of introducing the aliases $z\_true\_tac$, etc.
=DOC
val ⦏z_strip_tac⦎ : TACTIC;
=DESCRIBE
z\_$strip\_tac$ is a general purpose tactic for simplifying away the outermost
connective of a Z goal.
It first attempts to apply $z\_∀\_tac$.
If that fails it then
tries to apply the current proof context's
conclusion stripping conversion,
to rewrite the outermost connective in the goal.
Failing that it tries to simplify the goal by applying an applicable
member of the following collection of tactics
(only one could possibly apply):
=GFT
simple_∀_tac,		∧_tac,			
⇒_T strip_asm_tac,	t_tac
=TEX
Failing either being successful, it tries $concl\-\_in\-\_asms\-\_tac$ to prove the goal,
and failing that, returns the error message below.

finally, it will attempt to make the goal a ``schema as predicate'',
if possible, by using $z\_schema\_pred\_intro\_conv$.

Note how new assumptions generated by the tactic are processed using
$strip\_asm\_tac$,
which uses the current proof context's theorem stripping conversion.
$z\_strip\_tac$ may produce several new
subgoals, or may prove the goal.

The tactic is defined as:
=GFT Definition
val z_strip_tac = (z_∀_tac ORELSE_T strip_tac)
		THEN_TRY_T conv_tac z_schema_pred_intro_conv;
=USES
This is the usual way of simplifying a goal involving Z predicate
calculus connectives,
and other functions ``understood'' by the current prof context.
=SEEALSO
$STRIP\-\_CONCL\_T$ and $STRIP\_THM\_THEN$ which are used
to implement this function.
$taut\_tac$ for an alternative simplifier.
$swap\_∨\_tac$ to rearrange the conclusion for tailored stripping.
=FAILURE
28003	There is no stripping technique for ?0 in the current proof context
=ENDDOC


\section{CONVERSIONS AND RULES}\label{CONVANDRULE}
\subsection{Horizontal Schemas}
=DOC
val ⦏z_∈_h_schema_conv1⦎ : CONV;
=DESCRIBE
A conversion from a predicate asserting  membership of a horizontal schema to an existential quantification.
=FRULE 1 Conversion
z_∈_h_schema_conv1
⌜v ∈ [D|P]⌝
├
├
⊢ v ∈ [D|P] ⇔ ∃D'|P'⦁θ[D'] = v
=TEX
Bound variable renaming may be necessary, and thus the priming in the RHS of the result.
Schemas as predicates will be treated as membership
statements by this conversion.
=SEEALSO
$z\_∈\_h\_schema\_conv$ for a faster, if more verbose result from simplifying the same category of terms,
$z\_h\_schema\_conv$ for a horizontal schema term  without and outer $∈$.
=FAILURE
43003	?0 is not of the form ⌜v ∈ [D|P]⌝
43033	Unable to prove ?0 equal to something of the form: ⓩ∃D'|P'⦁θ[D'] = v⌝
	use z_∈_h_schema_conv instead, and then work by hand
=FAILUREC
Error 43033 indicates that there is some sort of variable capture problem preventing the conversion from functioning
correctly. As indicated, $z\-\_∈\-\_h\-\_schema\-\_conv$
is a conversion that does apply to simplify the input term.
=ENDDOC
=DOC
val ⦏z_∈_h_schema_conv⦎ : CONV;
=DESCRIBE
A conversion from a predicate asserting  membership of a horizontal schema to a predicate.
=FRULE 1 Conversion
z_∈_h_schema_conv
⌜v ∈ [D|P]⌝
├
├
⊢ v ∈ [D|P] ⇔ D' ∧ P'
=TEX
where, if $D$ declares variables $x⋎1$, $x⋎2$,...,
then $D'$ is
=GFT
"predicate from D[x⋎1 \ v.x⋎1, ...]"
=TEX
as converted by $z\_decl\_pred\_conv$,
and $P'$ is
=GFT
P[x⋎1 \ v.x⋎1, ...]
=TEX
The execution of the conversion may also involve bound variable renaming.
If $v$ is a binding display then $v.x⋎i$ will be simplified.
Though this conversion gives a rather verbose result,
it evaluates faster than $z\_∈\_h\_schema\_conv1$,
and is probably of more practical value in a proof.
Schemas as predicates will be treated as membership
statements by this conversion.
=SEEALSO
$z\_∈\_h\_schema\_conv1$
=FAILURE
43003	?0 is not of the form ⌜v ∈ [D|P]⌝
=ENDDOC

=DOC
val ⦏z_h_schema_conv⦎ : CONV;
=DESCRIBE
A conversion from a horizontal schema to a set comprehension.
=FRULE 1 Conversion
z_h_schema_conv
ⓩ[D|P]⌝
├
├
⊢ [D|P] = {D|P⦁θD}
=SEEALSO
$z\_∈\_h\_schema\_conv1$ and $z\_∈\_h\_schema\_conv$, which are
more appropriate if the schema expression occurs as a
subterm of a membership expression.
=FAILURE
43004	?0 is not a horizontal schema
=ENDDOC
=DOC
val ⦏z_norm_h_schema_conv⦎ : CONV;
=DESCRIBE
A conversion for normalising horizontal schemas.
=FRULE 1 Conversion
z_norm_h_schema_conv
⌜[D|P]⌝
├
├
⊢ [D|P] = [DU|D1 ∧ P]
=TEX
D1 is the implicit predicate formed from D by
=INLINEFT
z_decl_pred_conv
=TEX
{},
and then simplified.
The simplification is that conjuncts of the predicate that are
provable by $z\_∈\_u\_conv$, q.v., are proven and then eliminated from $D1$.
$DU$ is the signature formed from the variables bound by $D$, all of type $𝕌$.
=EXAMPLE
z_norm_h_schema_conv ⓩ[w:W; x,y:X; z:𝕌 | p w x y z]⌝
 =
ⓩ[w:𝕌; x:𝕌; y:𝕌; z:𝕌 | (w ∈ W ∧ x ∈ X ∧ y ∈ X) ∧ p w x y z]⌝
=TEX
Notice how, since $z\ ∈\ 𝕌$ can be proven by $z\_∈\_u\_conv$,
it is not included in $D1$.
=FAILURE
43004	?0 is not a horizontal schema
=ENDDOC
The above is deliberately given no $∈$ analogue, against the convention in the introduction.

=DOC
val ⦏z_h_schema_pred_conv⦎ : CONV;
=DESCRIBE
A conversion for eliminating a horizontal schema as a predicate.
=FRULE 1 Conversion
z_h_schema_pred_conv
ⓩ[D|P]⌝
├
├
⊢ [D|P] ⇔ "D as Predicate" ∧ P
=TEX
Projections from bindings, which are likely to be introduced, are automatically expanded
out.
The user may do so with, e.g.,
=GFT
MAP_C z_sel⋎s_conv
=TEX

The horizontal schema may be decorated.
=SEEALSO
$z\_schema\_pred\_conv$ for a more general conversion.
=FAILURE
43012	?0 is not a horizontal schema as a predicate
=ENDDOC

\subsection{Ill-formed Schemas as Declarations}
=DOC
val ⦏z_dec_rename⋎s_conv⦎ : CONV;
=DESCRIBE
This conversion turns an ill-formed schema-as-declaration
into a well-formed one using renaming.
The ill-formed schemas-as-declarations in question are those of the form
=GFT
⌜Z'SchemaDec bind schema⌝;
=TEX
where $bind$ is not equal to $ⓩθ\ schema⌝$.

=FRULE 1 Conversion
z_dec_rename⋎s_conv
⌜Z'SchemaDec bind schema⌝
├
├
⊢ Z'SchemaDec bind schema ⇔
	schema[y1/x1, ..., yk/xk]
=TEX
=USES
In correcting the results of functions which produce results outside Z because of substitution within variable binding constructs.
=FAILURE
43060	?0 is not an ill-formed schema-as-declaration
=ENDDOC


\subsection{Schema References}
These should be handled by $z\_get\_spec$.

\subsection{Operators on Schemas}
=DOC
val ⦏z_θ_∈_schema_conv⦎ : CONV;
=DESCRIBE
A conversion from a predicate asserting that the $θ$-term of a schema is a member of the schema to that schema as a predicate.
=FRULE 1 Conversion
z_θ_∈_schema_conv
ⓩθS ∈ S⌝
├
├
⊢ θS ∈ S ⇔ S
=TEX
Note that the schemas cannot be decorated, as the type of
$ⓩθ\ S\ '⌝$ is the same as the type of $ⓩθ\ S⌝$.
Other than that $S$ may be any schema as a predicate, including schema references and horizontal schemas.
=SEEALSO
$z\_θ\_∈\_schema\_intro\_conv$; and
$z\_pred\_dec\_conv$, which subsumes this conversion.
=FAILURE
43002	?0 is not of the form ⌜θS ∈ S⌝ where ⌜S⌝ is an undecorated schema
=ENDDOC
=DOC
val ⦏z_schema_pred_conv⦎ : CONV;
val ⦏z_θ_∈_schema_intro_conv⦎ : CONV;
=DESCRIBE
$z\_schema\_pred\_conv$ is a conversion from a schema as a predicate to the predicate asserting that its $θ$-term is a member of the schema.
=FRULE 1 Conversion
z_θ_∈_schema_intro_conv
⌜S⌝
├
├
⊢ S ⇔ θS ∈ S
=TEX
$S$ is any schema as a predicate, including both schema
references and horizontal schemas.

$z\-\_schema\-\_pred\-\_conv$ is an alias for $z\_θ\_∈\_schema\_intro\_conv$.
=SEEALSO
$z\-\_h\-\_schema\-\_pred\-\_conv$ for alternative,
$z\-\_θ\-\_conv$, and
$z\-\_θ\-\_∈\-\_schema\-\_conv$.
=FAILURE
43014	?0 is not a schema as a predicate
=ENDDOC
=DOC
val ⦏z_schema_pred_intro_conv⦎ : CONV;
=DESCRIBE
This conversion attempts to convert a predicate that is a membership of a schema into a schema as a predicate.
=FRULE 1 Conversion
z_schema_pred_intro_conv
ⓩ(x⋎1 ≜ x⋎1, ...) ∈ S⌝
├
├
⊢ ((x⋎1 ≜ x⋎1, ...) ∈ S) ⇔ S
=TEX
The input term must have a binding display that binds
to each label a variable with the label's name (maintaining
decoration).
=FAILURE
43032	?0 cannot be converted to a schema as a predicate
=ENDDOC
=DOC
val ⦏z_θ_conv⦎ : CONV;
val ⦏z_θ_conv1⦎ : CONV;
=DESCRIBE
$z\_θ\_conv$ conversion from a $θ$-term to the binding constructor for the schema.
=FRULE 1 Conversion
z_θ_conv
ⓩθS⌝
├
├
⊢ θS = (n⋎1 ≜ n⋎1, n⋎2 ≜ n⋎2, ...)
=TEX
$z\_θ\_conv1$ is as $z\_θ\_conv$, except that the conversion
only succeeds if the $θ$ term is ill-formed (i.e. is not Z).
=FAILURE
43010	?0 is not a θ-term
43011	?0 is not an ill-formed θ-term
=ENDDOC
=DOC
val ⦏z_θ_eq_conv⦎ : CONV;
=DESCRIBE
A conversion from an equality of two $θ$-terms,
or a $θ$ term and a binding display, to an elementwise
equality condition.
=FRULE 1 Conversion
z_θ_eq_conv
ⓩθS = θT⌝
├
├
⊢ (θ S decS = θ T decT)
⇔ n⋎1decS = n⋎1decT ∧ ...
=TEX
where $decS$ and $decT$ are the decoration of the respective schemas.
Also:
=FRULE 1 Conversion
z_θ_eq_conv
ⓩθS = (n⋎1 ≜ x⋎1, ...)⌝
├
├
⊢ (θS = (n⋎1 ≜ x⋎1, ...))
⇔ (n⋎1 = x⋎1) ∧ ...
=TEX
=USES
Used in combination with $z\_binding\_eq\_conv2$
to give $η$-terms the same status as binding displays.
=FAILURE
43034	?0 is not of the form: ⓩθS = θT⌝ or ⓩθS = (n⋎1 ≜ x⋎1, ...)⌝
=ENDDOC
The above will work for ill-formed $θ$-terms (i.e. not Z).
=DOC
val ⦏z_decor⋎s_conv⦎ : CONV;
val ⦏z_∈_decor⋎s_conv⦎ : CONV;
=DESCRIBE
A conversion which expands a statement of membership
to a decorated schema.
=FRULE 1 Conversion
z_∈_decor⋎s_conv
ⓩv ∈ (S)'⌝
├
├
⊢ v ∈ (S)' ⇔
(x⋎1 ≜ v.x⋎1', ...) ∈ S
=TEX
where the type of $S$ is
=GFT
ℙ [x⋎1:𝕌;... ]
=TEX
$S$ may be a schema-reference, or (in extended Z) anything
of the stated type.
Schemas as predicates will be treated as membership
statements by this conversion.
If $v$ is a binding display then $v.x⋎i$ will be simplified.
=GFT Definition
val z_decor⋎s_conv = Z_∈_ELIM_C z_∈_decor⋎s_conv
=TEX
=FAILURE
43015	?0 not of the form: ⓩv ∈ ds⌝ where ds is a decorated
	schema expression
=ENDDOC
Later issues of \ProductZ{} should provide a general mechanism for turning conversions of
the above sort into a equality on a Z set abstraction.
E.g.
from results of the form:
=GFT Example
v ∈ s ⇔ p[v, s]
=TEX
to:
=GFT Example
s = {v | p[v, s]}
=TEX
=DOC
val ⦏z_pre⋎s_conv⦎ : CONV;
val ⦏z_∈_pre⋎s_conv⦎ : CONV;
=DESCRIBE
Schema precondition elimination.
=FRULE 1 Conversion
z_pre⋎s_conv
ⓩpre S⌝
├
├
⊢ pre S = [DI | (∃ DF ⦁ S1)]
=TEX
$DI$ is the declaration formed from the unprimed and input (`?') variables of $S$, given type $𝕌$.
$DF$ is the declaration formed from the primed and output (`!') variables of $S$, given type $𝕌$.
It is possible for one or both of $DI$ and $DF$ to be the empty declaration.
$S1$ is the schema $S$ as a predicate.
=GFT Definition
val z_∈_pre⋎s_conv = ∈_C z_pre⋎s_conv
=TEX
Schemas as predicates will be treated as membership
statements by this conversion.
=FAILURE
43007	?0 is not a schema precondition
=ENDDOC
The above could be expressed by existential quantification of a schema.

=DOC
val ⦏z_Δ⋎s_conv⦎ : CONV;
val ⦏z_∈_Δ⋎s_conv⦎ : CONV;
=DESCRIBE
A conversion concerning the delta schemas.
=FRULE 1 Conversion
z_Δ⋎s_conv
ⓩΔ S⌝
├
├
⊢ Δ S = [S; S']
=TEX

=GFT Definition
val z_∈_Δ⋎s_conv = ∈_C z_Δ⋎s_conv
=TEX
Schemas as predicates will be treated as membership
statements by this conversion.
=FAILURE
43022	?0 is not of the form: ⓩΔ S⌝ where S is a schema
=ENDDOC
=DOC
val ⦏z_Ξ⋎s_conv⦎ : CONV;
val ⦏z_∈_Ξ⋎s_conv⦎ : CONV;
=DESCRIBE
A conversion concerning $Ξ$ schemas.
=FRULE 1 Conversion
z_Ξ⋎s_conv
ⓩΞ S⌝
├
├
⊢ Ξ S = [S; S' | θS = θS']
=TEX
=GFT Definition
val z_∈_Ξ⋎s_conv = ∈_C z_Ξ⋎s_conv
=TEX
Schemas as predicates will be treated as membership
statements by this conversion.
=FAILURE
43023	?0 is not of the form: ⓩΞ S⌝ where S is a schema
=ENDDOC

\section{PROPOSITION CALCULUS WITH SCHEMAS}
=DOC
val ⦏z_∧⋎s_conv⦎ : CONV;
val ⦏z_∈_∧⋎s_conv⦎ : CONV;
=DESCRIBE
A conversion concerning the membership of a schema conjunction.
=FRULE 1 Conversion
z_∈_∧⋎s_conv
ⓩv ∈ (R ∧ S)⌝
├
├
⊢ v ∈ (R ∧ S) ⇔
	bind1 ∈ R ∧ bind2 ∈ S
=TEX
where $R$ and $S$ are schemas that have signature variables $r⋎1$, $r⋎2$, ... and $s⋎1$, $s⋎2$, ... respectively,
and
=GFT
bind1 = (r⋎1 ≜ v.r⋎1, ...)
bind2 = (s⋎1 ≜ v.s⋎1, ...)
=TEX
Schemas as predicates will be treated as membership
statements by this conversion.
If $v$ is a binding display then $v.x⋎i$ will be simplified.

=GFT Definition
val z_∧⋎s_conv = Z_∈_ELIM_C z_∈_∧⋎s_conv;
=TEX
=FAILURE
43001	?0 is not of the form: ⓩv ∈ (R ∧ S)⌝ where R and S are schemas
=ENDDOC
=DOC
val ⦏z_∨⋎s_conv⦎ : CONV;
val ⦏z_∈_∨⋎s_conv⦎ : CONV;
=DESCRIBE
A conversion concerning the membership of a schema disjunction.
=FRULE 1 Conversion
z_∈_∨⋎s_conv
ⓩv ∈ (R ∨ S)⌝
├
├
⊢ v ∈ (R ∨ S) ⇔
	bind1 ∈ R ∨ bind2 ∈ S
=TEX
where $R$ and $S$ are schemas that have signature variables $r⋎1$, $r⋎2$, ... and $s⋎1$, $s⋎2$, ... respectively,
and
=GFT
bind1 = (r⋎1 ≜ v.r⋎1, ...)
bind2 = (s⋎1 ≜ v.s⋎1, ...)
=TEX
Schemas as predicates will be treated as membership
statements by this conversion.
If $v$ is a binding display then $v.x⋎i$ will be simplified.
=GFT Definition
val z_∨⋎s_conv = Z_∈_ELIM_C z_∈_∨⋎s_conv;
=TEX
=FAILURE
43005	?0 is not of the form: ⓩv ∈ (R ∨ S)⌝ where R and S are schemas
=ENDDOC
=DOC
val ⦏z_⇒⋎s_conv⦎ : CONV;
val ⦏z_∈_⇒⋎s_conv⦎ : CONV;
=DESCRIBE
A conversion concerning the membership of a schema implication.
=FRULE 1 Conversion
z_∈_⇒⋎s_conv
ⓩv ∈ (R ⇒ S)⌝
├
├
⊢ v ∈ (R ⇒ S) ⇔
	(bind1 ∈ R ⇒ bind2 ∈ S)
=TEX
where $R$ and $S$ are schemas that have signature variables $r⋎1$, $r⋎2$, ... and $s⋎1$, $s⋎2$, ... respectively,
and
=GFT
bind1 = (r⋎1 ≜ v.r⋎1, ...)
bind2 = (s⋎1 ≜ v.s⋎1, ...)
=TEX
Schemas as predicates will be treated as membership
statements by this conversion.
If $v$ is a binding display then $v.x⋎i$ will be simplified.
=GFT Definition
val z_⇒⋎s_conv = Z_∈_ELIM_C z_∈_⇒⋎s_conv;
=TEX
=FAILURE
43006	?0 is not of the form: ⓩv ∈ (R ⇒ S)⌝ where R and S are schemas
=ENDDOC
=DOC
val ⦏z_⇔⋎s_conv⦎ : CONV;
val ⦏z_∈_⇔⋎s_conv⦎ : CONV;
=DESCRIBE
A conversion concerning the membership of a schema bi-implication.
=FRULE 1 Conversion
z_∈_⇔⋎s_conv
ⓩv ∈ (R ⇔ S)⌝
├
├
⊢ v ∈ (R ⇔ S) ⇔
	(bind1 ∈ R ⇔ bind2 ∈ S)
=TEX
where $R$ and $S$ are schemas that have signature variables $r⋎1$, $r⋎2$, ... and $s⋎1$, $s⋎2$, ... respectively,
and
=GFT
bind1 = (r⋎1 ≜ v.r⋎1, ...)
bind2 = (s⋎1 ≜ v.s⋎1, ...)
=TEX
Schemas as predicates will be treated as membership
statements by this conversion.
If $v$ is a binding display then $v.x⋎i$ will be simplified.
=GFT Definition
val z_⇔⋎s_conv = Z_∈_ELIM_C z_∈_⇔⋎s_conv;
=TEX
=FAILURE
43016	?0 is not of the form: ⓩv ∈ (R ⇔ S)⌝ where R and S are schemas
=ENDDOC
=DOC
val ⦏z_¬⋎s_conv⦎ : CONV;
val ⦏z_∈_¬⋎s_conv⦎ : CONV;
=DESCRIBE
A conversion concerning the membership of a schema negation.
=FRULE 1 Conversion
z_∈_¬⋎s_conv
ⓩv ∈ (¬ S)⌝
├
├
⊢ v ∈ (¬ S) ⇔ ¬ (v ∈ S)
=TEX
where $S$ is a schema.
Schemas as predicates will be treated as membership
statements by this conversion.
=GFT Definition
val z_¬⋎s_conv = Z_∈_ELIM_C z_∈_¬⋎s_conv;
=TEX
=FAILURE
43017	?0 is not of the form: ⓩv ∈ (¬ S)⌝ where S is a schema
=ENDDOC
\section{SCHEMA QUANTIFICATION}
=DOC
val ⦏z_∃⋎s_conv⦎ : CONV;
val ⦏z_∈_∃⋎s_conv⦎ : CONV;
=DESCRIBE
A conversion concerning membership of schema existentials.
=FRULE 1 Conversion
z_∈_∃⋎s_conv
ⓩv ∈ (∃ D | P⦁ S)⌝
├
├
⊢ v ∈ (∃ D | P⦁ S) =
∃ y : 𝕌 ⦁ ("predicate from D[y.y⋎1/y⋎1,...]"
	∧ P[y.y⋎1/y⋎1,...]) ∧
	(x⋎1 ≜ v.x⋎1,...,y⋎1 ≜ y.y⋎1,...) ∈ S
=TEX
where $S$ is a schema that has signature variables $x⋎1$, $x⋎2$, ... and $y⋎1$, $y⋎2$, ...
$D$ a declaration that declares $y⋎1$, $y⋎2$, ... .
The ``predicate from D'' will also have schemas as predicates
eliminated in favour of bindings being members of schemas.
Schemas as predicates will be treated as membership
statements by this conversion.
If $v$ is a binding display then $v.x⋎i$ will be simplified.
=GFT Definition
val z_∃⋎s_conv = Z_∈_ELIM_C z_∈_∃⋎s_conv;
=TEX
=FAILURE
43020	?0 is not of the form: ⓩv ∈ (∃ D | P⦁ S)⌝ where S is a schema
=ENDDOC
=DOC
val ⦏z_∀⋎s_conv⦎ : CONV;
val ⦏z_∈_∀⋎s_conv⦎ : CONV;
=DESCRIBE
A conversion concerning schema universals.
=FRULE 1 Conversion
z_∈_∀⋎s_conv
ⓩv ∈ (∀ D | P⦁ S)⌝
├
├
⊢ v ∈ (∃ D | P⦁ S) =
∀ y : 𝕌 ⦁ ("predicate from D[y.y⋎1/y⋎1,...]"
	∧ P[y.y⋎1/y⋎1,...]) ⇒
	(x⋎1 ≜ v.x⋎1,...,y⋎1 ≜ y.y⋎1,...) ∈ S
=TEX
where $S$ is a schema that has signature variables $x⋎1$, $x⋎2$, ... and $y⋎1$, $y⋎2$, ...
$D$ a declaration that declares $y⋎1$, $y⋎2$, ... .
The ``predicate from D'' will also have schemas as predicates
eliminated in favour of bindings being members of schemas.
Schemas as predicates will be treated as membership
statements by this conversion.
If $v$ is a binding display then $v.x⋎i$ will be simplified.
=GFT Definition
val z_∀⋎s_conv = Z_∈_ELIM_C z_∈_∀⋎s_conv;
=TEX
=FAILURE
43030	?0 is not of the form: ⓩv ∈ (∀ D | P⦁ S)⌝ where S is a schema
=ENDDOC
=DOC
val ⦏z_∃⋎1⋎s_conv⦎ : CONV;
val ⦏z_∈_∃⋎1⋎s_conv⦎ : CONV;
=DESCRIBE
A conversion concerning schema unique existentials.
=FRULE 1 Conversion
z_∈_∃⋎1⋎s_conv
ⓩv ∈ (∃⋎1 D | P⦁ S)⌝
├
├
⊢ v ∈ (∃⋎1 D | P⦁ S) =
∃⋎1 y : 𝕌 ⦁
	("predicate from D[y.y⋎1/y⋎1,...]"
	∧ P[y.y⋎1/y⋎1,...]) ∧
	(x⋎1 ≜ v.x⋎1,...,y⋎1 ≜ y.y⋎1,...) ∈ S
=TEX
where $S$ is a schema that has signature variables $x⋎1$, $x⋎2$, ... and $y⋎1$, $y⋎2$, ...
$D$ a declaration that declares $y⋎1$, $y⋎2$, ... .
The ``predicate from D'' will also have schemas as predicates
eliminated in favour of bindings being members of schemas.
Schemas as predicates will be treated as membership
statements by this conversion.
If $v$ is a binding display then $v.x⋎i$ will be simplified.
=GFT Definition
val z_∃⋎1⋎s_conv = Z_∈_ELIM_C z_∈_∃⋎1⋎s_conv;
=TEX
=FAILURE
43021	?0 is not of the form: ⓩv ∈ (∃⋎1 D | P⦁ S)⌝ where S is a schema
=ENDDOC

\section{OTHER SCHEMA CALCULUS OPERATORS}
=DOC
val ⦏z_↾⋎s_conv⦎ : CONV;
val ⦏z_∈_↾⋎s_conv⦎ : CONV;
=DESCRIBE
A conversion concerning the membership of a schema projection.
=FRULE 1 Conversion
z_↾⋎s_conv
ⓩ(R ↾⋎s S)⌝
├
├
⊢ (R ↾⋎s S) = (R ∧ S) \⋎s (x⋎1, x⋎2, ...)
=TEX
where $R$ and $S$ are schemas and $x⋎1$, $x⋎2$, ... are the signature variables of $R$ that are not signature variables of $S$.
=GFT Definition
val z_∈_↾⋎s_conv = ∈_C z_↾⋎s_conv
=TEX
Schemas as predicates will be treated as membership
statements by this conversion.
=FAILURE
43019	?0 is not of the form: ⓩR ↾⋎s S⌝ where R and S are schemas
=ENDDOC
=DOC
val ⦏z_hide⋎s_conv⦎ : CONV;
val ⦏z_∈_hide⋎s_conv⦎ : CONV;
=DESCRIBE
A conversion concerning the schema hiding.
=FRULE 1 Conversion
z_hide⋎s_conv
ⓩS \⋎s (x⋎1, ...)⌝
├
├
⊢ S \⋎s (x⋎1, ...) =
	[y⋎1 : 𝕌; ... | ∃ x⋎1 : 𝕌; ... ⦁ S]
=TEX
where $S$ is a schema that has signature variables $x⋎1$, $x⋎2$, ... and $y⋎1$, $y⋎2$, ... .
=GFT Definition
val z_∈_hide⋎s_conv = ∈_C z_hide⋎s_conv
=TEX
Schemas as predicates will be treated as membership
statements by this conversion.
=FAILURE
43018	?0 is not of the form: ⓩS \⋎s (x⋎1, ...)⌝ where S is a schema
=ENDDOC
=DOC
val ⦏z_⨾⋎s_conv⦎ : CONV;
val ⦏z_∈_⨾⋎s_conv⦎ : CONV;
=DESCRIBE
A conversion concerning schema sequential composition.
=FRULE 1 Conversion
z_⨾⋎s_conv
ⓩ(R ⨾⋎s S)⌝
├
├
⊢ (R ⨾⋎s S) =
  [x⋎1:𝕌; ...; z⋎1':𝕌; ...; v⋎1:𝕌; ...; w⋎1':𝕌; ... |
    ∃ x1:𝕌; ... ⦁
    (x⋎1 ≜ x⋎1, ..., y⋎1' ≜ x1, ..., z⋎1' ≜ z⋎1', ...) ∈ R
  ∧ (v⋎1 ≜ v⋎1, ..., w⋎1' ≜ w⋎1', ..., y⋎1 ≜ x1, ...) ∈ S]
=TEX
where $R$ and $S$ are schemas with signature variables as follows:
\begin{center}
\begin{tabular}{llp{.5in}ll}
\multicolumn{2}{c}{$R$}			& &
		\multicolumn{2}{c}{$S$}			\\
\multicolumn{1}{c}{unprimed}	&
	\multicolumn{1}{c}{primed}	& &
		\multicolumn{1}{c}{unprimed}	&
			\multicolumn{1}{c}{primed}	\\
$x⋎1$, $x⋎2$, ...		&
					& &
		($x⋎{c⋎1}$, $x⋎{c⋎2}$, ...)	&
			($x⋎{d⋎1}'$, $x⋎{d⋎2}'$, ...)	\\
($z⋎{a⋎1}$, $z⋎{a⋎2}$, ...)	&
	$z⋎1'$, $z⋎2'$, ...		& &
						&
			($z⋎{e⋎1}'$, $z⋎{e⋎2}'$, ...)	\\
($y⋎{b⋎1}$, $y⋎{b⋎2}$, ...)	&
	$y⋎1'$, $y⋎2'$, ...		& &
		$y⋎1$, $y⋎2$, ...		&
			($y⋎{f⋎1}'$, $y⋎{f⋎2}'$, ...)	\\
				&
					& &
		$v⋎1$, $v⋎2$, ...		&
			($v⋎{g⋎1}'$, $v⋎{g⋎2}'$, ...)	\\
				&
					& &
						&
			$w⋎1'$, $w⋎2'$, ...
\end{tabular}
\end{center}
and $x1$, $x2$, ... are variables whose names are not used for variables, or as labels for the binding types of $R$ or $S$.  The signature variables enclosed in parentheses in the table are not shown in the theorem returned by the conversion but, if present, may result in extra schema declarations of the form
=INLINEFT
v : 𝕌
=TEX
{} and binding maplets of the form
=INLINEFT
v ≜ v
=TEX
{} where $v$ is e.g. $z⋎{a⋎1}$.
=GFT Definition
val z_∈_⨾⋎s_conv = ∈_C z_⨾⋎s_conv
=TEX
Schemas as predicates will be treated as membership
statements by this conversion.
=FAILURE
43025	?0 is not of the form: ⓩR ⨾⋎s S⌝ where R and S are schemas
=ENDDOC
=DOC
val ⦏z_rename⋎s_conv⦎ : CONV;
val ⦏z_∈_rename⋎s_conv⦎ : CONV;
=DESCRIBE
A conversion concerning schema renaming.
=FRULE 1 Conversion
z_∈_rename⋎s_conv
ⓩv ∈ S[x⋎1/y⋎1,...]⌝
├
├
⊢ v ∈ S[x⋎1/y⋎1,...] ⇔
(y⋎1 ≜ v.x⋎1,...,z⋎1 ≜ v.z⋎1,...) ∈ S
=TEX
where $S$ has signature variables $y⋎1$, ... and $z⋎1$, ...
Schemas as predicates will be treated as membership
statements by this conversion.
If $v$ is a binding display then $v.x⋎i$ will be simplified.
The conversion will fail with error 43035 if applied to a renaming that renames one component
to an already existent, unrenamed, component.
=GFT Definition
val z_rename⋎s_conv = Z_∈_ELIM_C z_∈_rename⋎s_conv;
=TEX
=FAILURE
43031	?0 is not of the form: ⓩS[x⋎1/y⋎1,...]⌝ where S is a schema
43035	?0 is of the form ⓩS[...,x⋎i/y⋎i,...]⌝ where x⋎i is already an unrenamed component of S
=ENDDOC

\section{PROOF CONTEXTS}
We provide the following proof contexts to reason about the above:

\begin{tabular}{l p{4in}}
$'z\_schemas$ & For reasoning about Z schemas, other than bindings \\
\end{tabular}

=DOC
(* Proof Context: ⦏'z_schemas⦎ *)
=DESCRIBE
A component proof context for handling the manipulation of Z schemas. It ``understands'' the membership, or schema as predicate, properties of each of the schema calculus operators.
It will replace an appropriate $ⓩv\ ∈\ S⌝$ by a ``schema $S$ as predicate''.

Predicates and expressions treated by this proof context are constructs formed from:
=GFT
(selection from) horizontal schemas, schemas as predicates, (selection from) θ expressions,
¬⋎s, ∧⋎s, ∨⋎s, ⇒⋎s, ⇔⋎s, ∀⋎s, ∃⋎s, ∃⋎1⋎s, decor⋎s, pre⋎s, ↾⋎s, hide⋎s, Δ⋎s, Ξ⋎s, ⨾⋎s, rename⋎s,
=TEX
\paragraph{Contents}\

Rewriting:
=GFT
(RAND_C z_θ_conv THEN_C z_sel⋎s_conv)
	- which simplifies terms of the form: ⓩ(θ s).nm⌝
z_θ_eq_conv, z_θ_conv1,
z_∈_¬⋎s_conv, z_∈_∧⋎s_conv, z_∈_∨⋎s_conv,
z_∈_⇒⋎s_conv, z_∈_⇔⋎s_conv, z_∈_∃⋎s_conv,
z_∈_∃⋎1⋎s_conv, z_∈_∀⋎s_conv, z_∈_h_schema_conv,
z_∈_decor⋎s_conv, z_∈_pre⋎s_conv, z_∈_↾⋎s_conv,
z_∈_hide⋎s_conv, z_∈_Δ⋎s_conv, z_∈_Ξ⋎s_conv,
z_∈_⨾⋎s_conv, z_∈_rename⋎s_conv, z_schema_pred_intro_conv
=TEX

Stripping theorems and conclusions:
=GFT
(RAND_C z_θ_conv THEN_C z_sel⋎s_conv)
	- which simplifies boolean terms of the form: ⓩ(θ s).nm⌝
∈_C (RAND_C z_θ_conv THEN_C z_sel⋎s_conv)
	- which simplifies terms of the form: ⓩx ∈ (θ s).nm⌝
z_θ_eq_conv, z_∈_¬⋎s_conv, z_∈_∧⋎s_conv, z_∈_∨⋎s_conv,
z_∈_⇒⋎s_conv, z_∈_⇔⋎s_conv, z_∈_∃⋎s_conv,
z_∈_∃⋎1⋎s_conv, z_∈_∀⋎s_conv, z_∈_h_schema_conv,
z_∈_decor⋎s_conv, z_∈_pre⋎s_conv, z_∈_↾⋎s_conv,
z_∈_hide⋎s_conv, z_∈_Δ⋎s_conv, z_∈_Ξ⋎s_conv,
z_∈_⨾⋎s_conv, z_∈_rename⋎s_conv, z_schema_pred_intro_conv
plus these all pushed in through ¬
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
It is intended to be used with proof context ``z$\_$bindings''.
It is not intended to be mixed with HOL proof contexts.
=ENDDOC
\newpage
\section{PROOF RULES AND COVERAGE OF $Z\_TERM$}
In the following ``$pc+=$'' stands for
``predicate calculus plus equality''
which should be reasoned about by $strip\_tac$, $rewrite\_tac[]$ and the ``two-tactic'' method,
in the proof context $z\_predicates$.

All of the following have both $∈$ and ``straight'' forms
of reasoning rules if the constructor always constructs
items that are sets.
In these cases the proof rule given below will be called $z\_∈\_...$,
and operates on a term of the form $ⓩv\ ∈\ ...⌝$,
and there will also be a $z\_...$ equivalent that operates
directly on the set.
One of these two is likely to be derived in a trivial manner
from the other, by $∈\_C$ or $Z\_∈\_ELIM\_C$, as indicates
in the function's description.

\begin{tabular}{| p{1.3in} | p{4.7in} |}\hline
Constructor & Proof Rules \\ \hline
$ZDec$ & $z\_dec\_pred\_conv$ \\
$ZSchemaDec$ & $z\_dec\_pred\_conv$ \\
$ZDecl$ & $z\_decl\_pred\_conv$ \\
$ZEq$ & $pc+=$ \\
$Z∈$ & Various $z\_∈\_$ functions, e.g. $z\_∈\_seta\_conv$ \\
$ZTrue$ & $pc+=$ \\
$ZFalse$ & $pc+=$ \\
$Z¬$ & $pc+=$ \\
$Z¬⋎s$ & $z\_∈\_¬⋎s\_conv$ \\
$Z∧$ & $pc+=$ \\
$Z∧⋎s$ & $z\_∈\_∧⋎s\_conv$ \\
$Z∨$ & $pc+=$ \\
$Z∨⋎s$ & $z\_∈\_∨⋎s\_conv$ \\
$Z⇒$ & $pc+=$ \\
$Z⇒⋎s$ & $z\_∈\_⇒⋎s\_conv$ \\
$Z⇔$ & $pc+=$ \\
$Z⇔⋎s$ & $z\_∈\_⇔⋎s\_conv$ \\
$Z∃$ & $pc+=$ \\
$Z∃⋎s$ & $z\_∈\_∃⋎s\_conv$ \\
$Z∃⋎1$ & $pc+=$ \\
$Z∃⋎1⋎s$ & $z\_∈\_∃⋎1⋎s\_conv$ \\
$Z∀$ & $pc+=$ \\
$Z∀⋎s$ & $z\_∈\_∀⋎s\_conv$ \\ \hline
\end{tabular}

\begin{tabular}{| p{1.3in} | p{4.7in} |}\hline
Constructor & Proof Rules \\ \hline
$ZSchemaPred$ & $z\_schema\_pred\_conv$ and others \\
$ZLVar$ & $pc+=$ \\
$ZGVar$ & Rewriting with definition from $z\_get\_spec$ \\
$ZInt$ & Various, see \cite{DS/FMU/IED/DTD086} \\
$ZString$ & $z\-\_string\-\_conv$ \\
$Z⟨⟩$ & $z\_⟨⟩\_conv$ \\
$ZSetd$ & $z\_∈\_setd\_conv$ \\
$ZSeta$ & $z\_∈\_seta\_conv$ \\
$Zℙ$ & $z\_∈\_ℙ\_thm$ and others \\
$ZTuple$ & Various: $z\_sel⋎t\_...$, $z\_tuple\_eq\_conv$ \\
$ZBinding$ & Various: $z\_sel⋎s\_...$, $z\_binding\_eq\_conv$ \\
$Z×$ & $z\_∈\_×\_conv$ \\
$Zθ$ & $z\_θ\_conv$ \\
$ZSel⋎s$ & $z\_sel⋎s\_conv$ and others \\
$ZSel⋎t$ & $z\_sel⋎t\_conv$ and others \\
$Zμ$ & $z\_μ\_rule$ \\
$ZApp$ & $z\_app\_conv$ \\
$Zλ$ & $z\_∈\_λ\_conv$ and $z\_β\_conv$ \\
$ZHSchema$ & $z\_∈\_h\_schema\_conv$ \\
$ZDecor⋎s$ & $z\_∈\_decor⋎s\_conv$ \\
$ZPre⋎s$ & $z\_∈\_pre⋎s\_conv$ \\
$Z↾⋎s$ & $z\_∈\_↾⋎s\_conv$ \\
$ZHide⋎s$ & $z\_∈\_hide⋎s\_conv$ \\
$ZΔ⋎s$ & $z\_∈\_Δ⋎s\_conv$ \\
$ZΞ⋎s$ & $z\_∈\_Ξ⋎s\_conv$ \\
$Z⨾⋎s$ & $z\_∈\_⨾⋎s\_conv$ \\
$ZRename⋎s$ & $z\_∈\_rename⋎s\_conv$ \\ \hline
\end{tabular}

\section{END OF THE SIGNATURE}
=SML
end; (* signature of ZSchemaCalculus *)
=TEX
\section{TEST POLICY}
The functions in this document should be tested as described in
\cite{DS/FMU/IED/PLN008}.

\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}



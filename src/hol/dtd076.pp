=IGN
********************************************************************************
dtd076.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% $Id: dtd076.doc,v 1.20 2011/07/11 15:53:06 rda Exp rda $ ℤ
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

\def\Title{Detailed Design of the Proof Contexts I}

\def\AbstractText{This document contains the detailed design of the proof contexts supplied for theories up to theory ``hol''.}

\def\Reference{DS/FMU/IED/DTD076}

\def\Author{K.Blackburn}


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
%% LaTeX2e port: \TPPtitle{Detailed Design of the Proof Contexts I}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/DTD076}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.20 $ %
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2011/07/11 15:53:06 $ %
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.Blackburn & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D. Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document contains the detailed design
%% LaTeX2e port: of the proof contexts supplied for theories up to theory ``hol''.}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	    Library
%% LaTeX2e port: }}
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
\item[Issue 1.1 (1992/05/14),1.2 (1992/05/19)]
First versions.
\item [Issue 1.3 (1992/05/21) (20th May 1992)]
Removed $eta\_axiom$, other tidying.
\item [Issue 1.4 (1992/05/26) (26th May 1992)]
Extracted default existence prover into its own proof context.
\item [Issue 1.5 (1992/05/27) (27th May 1992)]
Added existence prover preprocessors for sets and characters.
\item [Issue 1.6 (1992/06/24) (24th June 1992)]
Changes after comments, some renamings
(as issue 1.6 of \cite{DS/FMU/IED/WRK038}).
\item [Issue 1.7 (1992/06/25) (25th June 1992)]
Changed title and some text.
\item [Issue 1.8 (1992/06/26) (26th June 1992)]
Added
=INLINEFT
⊢ ∀ x ⦁ x = x
=TEX
into $basic\-\_prove\-\_tac$ resolution.
\item [Issue 1.9 (1992/07/06) (5th July 1992)]
Added support for $IsL$ and $IsR$.
\item [Issue 1.10 (1992/08/11) (11th August 1992)]
Added partial evaluation note to $basic\_prove\_conv$.
\item [Issue 1.11 (1992/08/20) (20th August 1992)]
Correcting text.
\item [Issue 1.12 (1993/01/07) (7th January 1992)]
Typo.
\item [Issue 1.13 (1993/01/11) (11th January 1993)]
Changed $'ℕ$ to push theorems through $¬$.
\item [Issue 1.14 (1993/01/27) (27th January 1993)]
Added $sets\_ext1$ etc. to support sets of pairs using new conversions from
\item [Issue 1.15 (1993/02/02) (1st February 1993)]
Added variable elimination to $basic\_prove\_tac$.
\cite{DS/FMU/IED/DTD044}.
\item[Issue 1.16 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.17 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.18 (2006/12/10)] Added support for symmetric difference operator.
\item[Issue 1.19 (2011/02/06)] Added proof contexts to control forward chaining.
\item[Issue 1.20 (2011/07/11)] Added proof context to enable higher-order rewriting.
\item[Issue 1.21 (2012/03/27)] Extended
=INLINEFT
'pair
=TEX
\ to deal with the new constant
=INLINEFT
Pair
=TEX
.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
As experience with proof contexts improves.
\pagebreak
\section{GENERAL}
\subsection{Scope}
Various proof contexts are called for in Appendix A
of \cite{DS/FMU/IED/HLD011}.
This document provides a detailed design for these contexts.
\subsection{Introduction}
\subsubsection{Purpose and Background}
The mechanism of proof contexts is discussed in \cite{DS/FMU/IED/HLD009}, and is implemented in \cite{DS/FMU/IED/DTD051}.
There are however many proof contexts provided within
the HOL PDS, implemented in various subsystems.
The sum of these should provide a coherent set,
with some proof contexts being appropriate
to be pushed onto the proof context stack in their
own right, and others allowing detail in creating
proof contexts based in part on existing context material.

This document describes the proof contexts supplied for
theories up to ``hol''.
\subsubsection{Dependencies}
This documents proof contexts require
theories $hol$ and $sets$ (thus \cite{DS/FMU/IED/IMP044})
and structures $Resolution$ and $ExistenceProofs$
(thus \cite{DS/FMU/IED/IMP058} and \cite{DS/FMU/IED/IMP067}).
\subsubsection{Deficiencies}
The implementation of this document is the first place
we can usefully commit proof contexts that are
to be supplied to the user, as we need, e.g. the
resolution tool kit in place.
However, we need proof contexts during the system build
before this point,
and for module tests of partial builds (i.e. builds that failed
to build some dependency of this document and its implementation).
Thus uncommitted, incomplete proof contexts are introduced
earlier in the build, matching only some of the fields of
the proof context designs given in
this document.
Thus many implementation documents use
proof contexts that are incomplete versions of those described
here, and module tests requiring proof contexts
only use those proof contexts
that must be present, if perhaps incomplete, for their associated
implementation to have been possible.
\subsubsection{Possible Enhancements}
A helpful characterization of the problems that $prove\_tac$, etc, can be
usefully applied to
could be given for each proof context.
Unfortunately, a more detailed characterisation than ``does most of the obvious simplifications in that context of reasoning''
is difficult to provide without just stating the algorithm used by $prove\-\_tac$.

\section{DESIGN ISSUES}
A proof context is made visible to the user for one of
two reasons:
\begin{enumerate}
\item
It is a useful proof context to make the current proof context in its own right - a ``complete proof context''.
It provides appropriate material for reasoning in a particular ``place of work'' within the theory hierarchy.
For instance, the proof context set by the system build process as
the current one, ``hol'',
falls into this category.

A naive user will be first exposed to this kind of proof context.
\item
The proof context contains appropriate material for one subject
(characteristically a theory, and a way of reasoning within that theory), and is used in creating
custom proof contexts from the merge of pre-existing
ones  (and perhaps new material).
This is called a ``component proof context''.
\end{enumerate}
A supplied complete proof context will be primarily be result of  merging some component proof contexts,
with perhaps some additional material reflecting the completeness.
This additional material will be kept to a minimum in
supplied complete proof contexts.

By convention, component proof context names will start with a prime, and all proof context names will be lower case, with name atoms
separated by underscores.

There will not be a complete proof context for each possible ``place of work'',
but just sufficient to cover the ``places of work'' recommended to the naive user.

One distinction that can be drawn between proof contexts is their level of ``aggression'': they may be referred to as ``mild'' or ``aggressive''.
A ``mild'' proof context is designed to only do things
that are considered to be ``always'' wanted - e.g. standard
rewriting simplification for the subject of the proof context.
An aggressive proof context will be written with the aim of
``prove if possible'', and will not ``care'' about
the results upon items that cannot be proven by proof context alone.
This includes aggressive use of extensionality of functions and sets.

Roughly, the relationship in supplied proof contexts between stripping material and rewriting
material is that the stripping is a subset
of rewriting material that deals with boolean valued terms.
Other differences arise when precise forms of conclusion
are required to aid further stripping - this
is most apparent in proof context ``predicates''.
\section{THE SIGNATURE}
=DOC
signature ⦏ProofContexts1⦎ = sig
=DESCRIBE
This signature gives access to two functions used in
supplying the first group of proof contexts.
Proof contexts themselves have no entry in the signature,
however the contexts provided are:

\begin{centering}

\begin{tabular}{| l | l |} \hline
Component & Complete \\ \hline
$'simple\_abstractions$ & $predicates$ \\
$'paired\_abstractions$ & $predicates1$ \\
$'propositions$ & $basic\_hol$ \\
$'fun\_ext$ & $basic\_hol1$\\
$'pair$ & $sets\_ext$ \\
$'pair1$ & $hol$ \\
$'ℕ$ & $hol1$ \\
$'ℕ\_lit$ & \\
$'list$ & \\
$'char$ & \\
$'sum$ & \\
$'one$ & \\
$'combin$ & \\
$'sets\_alg$ & \\
$'sets\_ext$ & \\
$'basic\_prove\_∃\_conv$ & \\ \hline
\end{tabular}

\end{centering}

=ENDDOC
\subsection{Utilities}

The following provide useful default values
for two fields of a proof context.
=DOC
val ⦏basic_prove_tac⦎ : THM list -> TACTIC;
=DESCRIBE
This is the tactic used for the automated proof tactic (the $pr\_tac$ field) of most
supplied proof contexts,
and is a reasonable, general-purpose, automatic proof tactic.

In summary it will:
\begin{enumerate}
\item
Try $all\_var\_elim\_asm\_tac$ to do variable elimination.
\item
Extract the assumption list, rewrite each extracted assumption with the current
default rewrite rules and given theorems, and strip the results back into the assumption list.
\item
Attempt to rewrite the resulting goal's conclusions with the current
default rewrite rules and given theorems.
\item
Again try $all\_var\_elim\_asm\_tac$ to do variable elimination.
\item
Repeatedly apply $strip\_tac$ to the conclusions of the resulting goals.
\item
Attempt to prove each of the resulting goals with resolution for up to 3 resolution steps, with goal's negated conclusion
as a resolvant that must be used, and the assumptions as possible
other resolvants.
This has no effect on any resulting goal if it is unsolved.
\item
Attempt to prove each of the resulting goals with resolution for up to 3 resolution steps amongst
just the assumptions.
This has no effect on any resulting goal if it is unsolved.
\end{enumerate}

Note that either stripping step may result in more than one subgoal, and thus the plural ``resulting goals''.

Under the current interface to
resolution this is
=GFT
fun basic_prove_tac thms =
TRY_T all_var_elim_asm_tac THEN
DROP_ASMS_T (MAP_EVERY (strip_asm_tac o rewrite_rule thms) o rev) THEN
(TRY_T (rewrite_tac thms)) THEN
TRY_T all_var_elim_asm_tac THEN
REPEAT strip_tac THEN_TRY
(basic_res_tac2 3 [⊢ ∀ x ⦁ x = x]
 ORELSE_T basic_res_tac3 3 [⊢ ∀ x ⦁ x = x])
=TEX
=ENDDOC
The ``3 resolution steps'' is a fixed number of steps, chosen as a compromise between finding all possible resolution proofs
and the costs of such attempts.
For finer tuning, use the resolution package more directly.
=DOC
val ⦏basic_prove_conv⦎ : THM list -> CONV;
=DESCRIBE
This is the conversion used for the automatic proof conversion ($pr\_tac$ field) of most
supplied proof contexts,
and is a reasonable, general-purpose, automatic proof conversion.
It will either prove the theorem with the given conclusion, or fail.

In summary it will:
\begin{enumerate}
\item
Set the term as the goal of the subgoal package.
\item
Attempt to rewrite the term with the current
default rewrite rules and given theorems.
\item
Repeatedly apply $strip\_tac$ to the goal.
\item
Try $all\_var\_elim\_asm\_tac$ to do variable elimination.
\item
Attempt to prove the resulting goals with resolution for up to 3 resolution steps, with goal's negated conclusion
as a resolvant that must be used, and the assumptions as possible
other resolvants.
This has no effect on any resulting goal if it is unsolved.
\item
Attempt to prove the resulting goals with resolution for up to 3 resolution steps amongst
just the assumptions.
This has no effect on any resulting goal if it is unsolved.
\item
If the proof is successful, return
=INLINEFT
⊢ term ⇔ T
=TEX
{} and otherwise fail.
\end{enumerate}

Note that in the stripping step may result in more than one subgoal, and thus the plural ``resulting goals''.

Under the current interface to
resolution this equivalent to:
=GFT
fun basic_prove_conv thms tm =
⇔_t_intro (
tac_proof(([],tm),
	TRY_T (rewrite_tac thms)  THEN
	REPEAT strip_tac THEN_TRY
	(basic_res_tac2 3 [⊢ ∀ x ⦁ x = x]
	 ORELSE_T basic_res_tac3 3 [⊢ ∀ x ⦁ x = x]))
)
=TEX
In the implementation however, partial evaluation with just the theorems is allowed.
=FAILURE
76001	Could not prove theorem with conclusion ?0
=ENDDOC
\subsection{The Actual Proof Contexts}
In the following the initial paragraph indicates whether
the proof context is complete or a component,
and its ``place of work'' or subject;
the ``Contents'' paragraph indicates the contents, perhaps
with reference to previous component or complete proof contexts;
and the ``Usage'' paragraph indicates the minimum theories
required in scope, and interactions with other proof contexts.
In stating the contents of fields entered into discrimination
nets the index into the net will be,
unless otherwise stated, the least general index
that matches all applications of the item.
=DOC
(* Proof Context: ⦏'basic_prove_∃_conv⦎ *)
=DESCRIBE
A component proof context that adds the function
$basic\_prove\_∃\_conv$ as an automatic existence prover.
\paragraph{Contents}

Automatic proof procedures are respectively ``always fail tactic'', ``always fail conversion'',
 and $basic\-\_prove\-\_∃\-\_conv$.

\paragraph{Usage Notes}
Requires theory ``basic$\_$hol'', intended to be combined into
the merge of any component proof contexts that do not have
their own special existence prover.
It should usually be the first in the list of proof contexts
to be merged together, so that other proof contexts  may
introduce pre-processors, and then the final default
prover is invoked.
This is because the standard application of the list
of existence prover conversions is defined to be to apply them in a cumulative manner, in reverse order.
=ENDDOC

=DOC
(* Proof Context: ⦏'simple_abstractions⦎ *)
=DESCRIBE
A component proof context for handling only simple abstractions in stripping and canonicalisation.
\paragraph{Contents}

Rewriting:
=GFT
=TEX
Stripping theorems:
=GFT
simple_¬_in_conv
=TEX
Stripping conclusions:
=GFT
simple_¬_in_conv
=TEX
Rewriting canonicalisation:
=GFT
simple_∀_rewrite_canon, simple_¬_rewrite_canon
=TEX
Automatic proof procedures are respectively $basic\-\_prove\-\_tac$,
$basic\-\_prove\-\_conv$ and no existence prover.

\paragraph{Usage Notes}
Not to be used with proof context ``$'$paired$\_$abstractions'' as their ``domains'' overlap. It requires
theory $basic\_hol$.
=ENDDOC

=DOC
(* Proof Context: ⦏'paired_abstractions⦎ *)
=DESCRIBE
A component proof context for handling simple and paired abstractions in stripping and canonicalisation.
\paragraph{Contents}

Rewriting:
=GFT
β_conv
=TEX
Stripping theorems:
=GFT
¬_in_conv, ∃⋎1_conv,
∀_uncurry_conv, ∃_uncurry_conv
=TEX
Stripping conclusions:
=GFT
¬_in_conv, ∀_uncurry_conv
=TEX
Rewriting canonicalisation:
=GFT
∀_rewrite_canon, ¬_rewrite_canon
=TEX
Automatic proof procedures are respectively $basic\-\_prove\-\_tac$,
$basic\-\_prove\-\_conv$ and no existence prover.

\paragraph{Usage Notes}
Not to be used with proof context ``$'$simple\-$\_$abstractions'', as their ``domains'' overlap. It requires
theory $basic\_hol$.
=ENDDOC

=DOC
(* Proof Context: ⦏'propositions⦎ *)
=DESCRIBE
A component proof context for reasoning about propositions.
\paragraph{Contents}

Rewriting:
=GFT
eq_rewrite_thm, ⇔_rewrite_thm, ¬_rewrite_thm,
∧_rewrite_thm, ∨_rewrite_thm, ⇒_rewrite_thm,
if_rewrite_thm, ∀_rewrite_thm, ∃_rewrite_thm,
β_rewrite_thm, simple_β_conv
=TEX
Stripping theorems:
=GFT
⇒_thm, ⇔_thm, simple_∃⋎1_conv,
`⊢ ∀ x ⦁ ((x = x) ⇔ T)`,
`⊢ ∀ x ⦁ (¬(x = x) ⇔ F)`,
`⊢ ∀ a t1 t2⦁ (if a then t1 else t2) ⇔ (a ⇒ t1) ∧ (¬ a ⇒ t2)`
=TEX
Note these are intended to be used with $(simple\_)$ $¬\_\-in\_conv$
from ``$'$paired$\-\_$abstractions''
or ``$'$simple$\-\_$abstractions'',
which covers the cases of an outermost $¬$ for each operator.

Stripping conclusions:
=GFT
⇔_thm,
`⊢ ∀ x ⦁ ((x = x) ⇔ T)`,
`⊢ ∀ x ⦁ (¬(x = x) ⇔ F)`,
`⊢ ∀ a t1 t2⦁ (if a then t1 else t2) ⇔ (a ⇒ t1) ∧ (¬ a ⇒ t2)`
`⊢ ∀a b⦁(a ∨ ¬b) ⇔ (b ⇒ a)`
`⊢ ∀ a b⦁ ¬ a ∨ b ⇔ a ⇒ b`
`⊢ ∀ a b⦁ a ∨ b ⇔ ¬ a ⇒ b`
=TEX
Note that the above are intended to be used in combination with $(simple\_)$ $¬\_\-in\-\_conv$
from ``$'$paired$\-\_$abstractions''
or ``$'$simple$\-\_$abstractions'',
which covers the cases of an outermost $¬$ for each operator.

Rewriting canonicalisation:
=GFT
∧_rewrite_canon, f_rewrite_canon
=TEX
Automatic proof procedures are respectively $taut\-\_tac$,
$taut\-\_conv$ and
$basic\_prove\-\_∃\-\_conv$.
\paragraph{Usage Notes}
Usually used in conjunction with ``$'$paired$\-\_$abs\-trac\-tions''
or ``$'$simple$\-\_$abs\-trac\-tions'', requires theory $basic\_hol$.

=IGN
Perhaps also a new conversion embedding $type\_lemmas\_thm$
and then rewriting with representation function definition
could be embedded in the theorem stripper, to handle type definitions.
=TEX
=ENDDOC

=DOC
(* Proof Context: ⦏'fun_ext⦎ *)
=DESCRIBE
A component proof context for adding reasoning using
functional extensionality.
\paragraph{Contents}

Rewriting:
=GFT
ext_thm
=TEX
Stripping theorems:
=GFT
ext_thm
=TEX
Stripping conclusions:
=GFT
ext_thm
=TEX
Rewriting canonicalisation:
=GFT
=TEX
Automatic proof procedures are, respectively, $taut\-\_tac$,
$taut\-\_conv$ and
$basic\_prove\-\_∃\-\_conv$.
\paragraph{Usage Notes}
Normally used in conjunction with ``$'$propositions'', requires theory $basic\_hol$.
=ENDDOC

=DOC
(* Proof Context: ⦏predicates⦎ *)
=DESCRIBE
A ``mild'' complete proof context for reasoning about the predicate
calculus, including paired abstractions.
\paragraph{Contents}
Proof contexts ``$'$basic$\_$prove$\_∃\_$conv'', ``$'$paired$\-\_$abstractions'' and ``$'$propositions''.

Automatic proof procedures are respectively $basic\-\_prove\-\_tac$,
$basic\-\_prove\-\_conv$ and $basic\-\_prove\-\_∃\-\_conv$
(merged in from the proof context of the same name).

\paragraph{Usage Notes}
Requires theory $basic\_hol$.
=ENDDOC

=DOC
(* Proof Context: ⦏predicates1⦎ *)
=DESCRIBE
An ``aggressive'' complete proof context for reasoning about the predicate
calculus, including paired abstractions and functional extensionality.
\paragraph{Contents}
Proof contexts ``$'$basic$\-\_$prove$\_∃\_$conv'', ``$'$paired$\-\_$abstractions'', ``$'$propositions'' and ``$'$fun\_ext''.

Automatic proof procedures are, respectively, $basic\-\_prove\-\_tac$,
$basic\-\_prove\-\_conv$ and $basic\-\_prove\-\_∃\-\_conv$
(merged in from the proof context of the same name).
\paragraph{Usage Notes}
Requires theory $basic\_hol$.
=ENDDOC

=DOC
(* Proof Context: ⦏'pair⦎ *)
=DESCRIBE
A ``mild'' component proof context for theory $pair$.
\paragraph{Contents}

Rewriting (selected from $pair\_clauses$):
=GFT
`⊢ ∀ x y a b p fu fc fg
    ⦁ Fst (x, y) = x
      ∧ Snd (x, y) = y
      ∧ ((a, b) = (x, y) ⇔ a = x ∧ b = y)
      ∧ (Fst p, Snd p) = p
      ∧ Curry fc x y = fc (x, y)
      ∧ Uncurry fu (x, y) = fu x y
      ∧ Uncurry fu p = fu (Fst p) (Snd p)
      ∧ Pair fg x = (Fst fg x, Snd fg x)`
=TEX
Stripping theorems:
=GFT
`⊢ ∀ a b x y ⦁ ((a, b) = (x, y) ⇔ a = x ∧ b = y)`
=TEX
Stripping conclusions:
=GFT
`⊢ ∀ a b x y ⦁ ((a, b) = (x, y) ⇔ a = x ∧ b = y)`
=TEX
Existential variable structures:
=GFT
`⊢ ∀ x y p ⦁
	Fst (x, y) = x ∧
	Snd (x, y) = y ∧
	(Fst p, Snd p) = p`
=TEX
Automatic proof procedures are respectively $basic\-\_prove\-\_tac$,
$basic\-\_prove\-\_conv$ and no existence prover.

\paragraph{Usage Notes}
Requires theory $basic\_hol$.
=ENDDOC

=DOC
(* Proof Context: ⦏'pair1⦎ *)
=DESCRIBE
An ``aggressive'' component proof context for theory $pair$.
\paragraph{Contents}

Rewriting:
=GFT
`⊢ ∀ a b p
    ⦁ ((a, b) = p ⇔ a = Fst p ∧ b = Snd p)
      ∧ (p = (a, b) ⇔ Fst p = a ∧ Snd p = b)`
=TEX
Stripping theorems (selected from $pair\_clauses$):
=GFT
`⊢ ∀ a b p
    ⦁ ((a, b) = p ⇔ a = Fst p ∧ b = Snd p)
      ∧ (p = (a, b) ⇔ Fst p = a ∧ Snd p = b)`
=TEX
Stripping conclusions:
=GFT
`⊢ ∀ a b p
    ⦁ ((a, b) = p ⇔ a = Fst p ∧ b = Snd p)
      ∧ (p = (a, b) ⇔ Fst p = a ∧ Snd p = b)`
=TEX
Existential variable structures:
=GFT
=TEX
Automatic proof procedures are respectively $basic\-\_prove\-\_tac$,
$basic\-\_prove\-\_conv$ and no existence prover.

\paragraph{Usage Notes}
Requires theory $basic\_hol$, expected to be used in combination
with ``$'$pair''.
=ENDDOC

=DOC
(* Proof Context: ⦏'ℕ⦎ *)
=DESCRIBE
A ``mild'' component proof context for theory $ℕ$.
\paragraph{Contents}

Rewriting:
=GFT
≥_def, greater_def, plus_clauses, times_clauses,
≤_clauses, less_clauses, minus_clauses
=TEX
Stripping theorems:
=GFT
≥_def, greater_def, plus_clauses, times_clauses,
≤_clauses, less_clauses, minus_clauses,
and all boolean equations also pushed through $¬$
=TEX
Stripping conclusions:
=GFT
≥_def, greater_def, plus_clauses, times_clauses,
≤_clauses, less_clauses, minus_clauses,
and all boolean equations also pushed through $¬$
=TEX
Existential clausal definition theorems:
=GFT
prim_rec_thm
=TEX
Automatic proof procedures are respectively $basic\-\_prove\-\_tac$,
$basic\-\_prove\-\_conv$ and no existence prover.

\paragraph{Usage Notes}
Requires theory $basic\_hol$.
=ENDDOC

=DOC
(* Proof Context: ⦏'ℕ_lit⦎ *)
=DESCRIBE
A component proof context for theory $ℕ$,
that will, e.g., evaluate any arithmetic expression
involving only numeric literals and certain arithmetic operators,
namely
=INLINEFT
+, *, -, Div, Mod, ≤, <, >, ≥, and =
=TEX
{}.
\paragraph{Contents}

Rewriting:
=GFT
plus_conv, times_conv, minus_conv, div_conv,
mod_conv, ≤_conv, less_conv, greater_conv,
≥_conv, ℕ_eq_conv
=TEX
Stripping theorems:
=GFT
≤_conv, less_conv, greater_conv,
≥_conv, ℕ_eq_conv
=TEX
Stripping conclusions:
=GFT
≤_conv, less_conv, greater_conv,
≥_conv, ℕ_eq_conv
=TEX
Existential clausal definition theorems:
=GFT
=TEX
Automatic proof procedures are respectively $basic\-\_prove\-\_tac$,
$basic\-\_prove\-\_conv$ and no existence prover.

\paragraph{Usage Notes}
Requires theory $basic\_hol$, expected to be used with proof context ``$'ℕ$''.
It is separated from it as spotting the application of the conversions
is time consuming, and may be known to be irrelevant.
=ENDDOC

=DOC
(* Proof Context: ⦏'list⦎ *)
=DESCRIBE
A component proof context for the theory $list$.
\paragraph{Contents}

Rewriting:
=GFT
list_clauses
=TEX

Stripping theorems:
=GFT
` ⊢ ∀ x1 x2 list1 list2
    ⦁ ¬ Cons x1 list1 = []
      ∧ ¬ [] = Cons x1 list1
      ∧ (Cons x1 list1 = Cons x2 list2 ⇔ x1 = x2 ∧ list1 = list2)`
=TEX
Stripping conclusions:
=GFT
` ⊢ ∀ x1 x2 list1 list2
    ⦁ ¬ Cons x1 list1 = []
      ∧ ¬ [] = Cons x1 list1
      ∧ (Cons x1 list1 = Cons x2 list2 ⇔ x1 = x2 ∧ list1 = list2)`
=TEX
Existential clausal definition theorems:
=GFT
list_prim_rec_thm
=TEX
Automatic proof procedures are respectively $basic\-\_prove\-\_tac$,
$basic\-\_prove\-\_conv$ and no existence prover.

\paragraph{Usage Notes}
Requires theory $list$.
=ENDDOC

=DOC
(* Proof Context: ⦏'char⦎ *)
=DESCRIBE
A component proof context for theory $char$, for reasoning about character and string literals.
\paragraph{Contents}

Rewriting:
=GFT
char_eq_conv, string_eq_conv
=TEX
Stripping theorems:
=GFT
char_eq_conv, string_eq_conv
=TEX
Stripping conclusions:
=GFT
char_eq_conv, string_eq_conv
=TEX
Automatic proof procedures are respectively $basic\-\_prove\-\_tac$,
$basic\-\_prove\-\_conv$ and an existence prover
preprocessor that rewrites with
=INLINEFT
⊢ "" = []
=TEX
{} which assists using list's primitive induction on strings.

\paragraph{Usage Notes}
Requires theory $basic\_hol$.
=ENDDOC

=DOC
(* Proof Context: ⦏basic_hol⦎ *)
=DESCRIBE
A ``mild'' complete proof context for the ancestors of theory $basic\_hol$.
\paragraph{Contents}
Proof contexts ``predicates'', ``$'$pair, ``$'ℕ$'', ``$'$list'', and ``$'$char''.
Automatic proof procedures are respectively $basic\-\_prove\-\_tac$,
$basic\-\_prove\-\_conv$ and $basic\_prove\_∃\_conv$
(merged in from the proof context of the same name).
\paragraph{Usage Notes}
Requires theory $basic\_hol$.
=ENDDOC

=DOC
(* Proof Context: ⦏basic_hol1⦎ *)
=DESCRIBE
An ``aggressive'' complete proof context for the ancestors of theory $basic\_hol$.
\paragraph{Contents}
Proof contexts ``predicates1'', ``$'$pair'', ``$'$pair1'', ``$'ℕ$'', ``$'ℕ\-\_$lit'', ``$'$list'', and ``$'$char''.

Automatic proof procedures are respectively $basic\-\_prove\-\_tac$,
$basic\-\_prove\-\_conv$ and $basic\-\_prove\-\_∃\-\_conv$
(merged in from the proof context of the same name).
\paragraph{Usage Notes}
Requires theory $basic\_hol$.
=ENDDOC

=DOC
(* Proof Context: ⦏'mmp1⦎ *)
=DESCRIBE
A component proof context with the matching modus ponens rule set to
=INLINEFT
⇒_match_mp_rule1
=TEX
. All other fields are empty.
\paragraph{Usage Notes}
This makes forward chaining work as in releases prior to 2.9.1
(so that bound variables that are not constrained by the pattern matching
are specialised to themselves).
=ENDDOC


=DOC
(* Proof Context: ⦏'mmp2⦎ *)
=DESCRIBE
A component proof context with the matching modus ponens rule set to
=INLINEFT
⇒_match_mp_rule2
=TEX
. All other fields are empty.
\paragraph{Usage Notes}
Use this to ensure the default behaviour in forward chaining
(so that bound variables that are not constrained by the pattern matching
are specialised with new names as necessary to avoid variable capture).
=ENDDOC

=DOC
(* Proof Context: ⦏'sho_rw⦎ *)
=DESCRIBE
A component proof context with the equation matching rule set to
=INLINEFT
simple_higher_order_thm_eqn_cxt
=TEX
. All other fields are empty.
\paragraph{Usage Notes}
With this proof context, rewriting treats the rewriting theorems as
higher order rewrite rules. For example, rewriting with the theorem
$prenex\_clauses$ (q.v.) will convert a term into prenex normal form.
=ENDDOC


=DOC
(* Proof Context: ⦏'sum⦎ *)
=DESCRIBE
A ``mild'' component proof context for theory $sum$.
\paragraph{Contents}

Rewriting:
=GFT
` ⊢ ∀ x1 x2 y1 y2 z
    ⦁ (InL x1 = InL x2 ⇔ x1 = x2)
      ∧ (InR y1 = InR y2 ⇔ y1 = y2)
      ∧ ¬ InL x1 = InR y1
      ∧ ¬ InR y1 = InL x1
      ∧ OutL (InL x1) = x1
      ∧ OutR (InR y1) = y1`
      ∧ IsL(InL x1) ∧ IsR(InR y1)
      ∧ ¬ IsL(InR y1) ∧ ¬ IsR(InL x1)
=TEX
Stripping theorems:
=GFT
` ⊢ ∀ x1 x2 y1 y2 z
    ⦁ (InL x1 = InL x2 ⇔ x1 = x2)
      ∧ (InR y1 = InR y2 ⇔ y1 = y2)
      ∧ ¬ InL x1 = InR y1
      ∧ ¬ InR y1 = InL x1`
      ∧ IsL(InL x1) ∧ IsR(InR y1)
      ∧ ¬ IsL(InR y1) ∧ ¬ IsR(InL x1)
=TEX
Stripping conclusions:
=GFT
` ⊢ ∀ x1 x2 y1 y2 z
    ⦁ (InL x1 = InL x2 ⇔ x1 = x2)
      ∧ (InR y1 = InR y2 ⇔ y1 = y2)
      ∧ ¬ InL x1 = InR y1
      ∧ ¬ InR y1 = InL x1`
      ∧ IsL(InL x1) ∧ IsR(InR y1)
      ∧ ¬ IsL(InR y1) ∧ ¬ IsR(InL x1)
=TEX
Existential clausal definition theorems:
=GFT
`⊢ ∀ f g⦁ ∃⋎1 h⦁ (∀ x⦁ h (InL x) = f x) ∧ (∀ x⦁ h (InR x) = g x)`
=TEX
Automatic proof procedures are respectively $basic\-\_prove\-\_tac$,
$basic\-\_prove\-\_conv$ and no existence prover.

\paragraph{Usage Notes}
Requires theory $sum$.
=ENDDOC
This is ``mild'' in the sense that a possible proof context could
use theorem $sum\_clauses$ which will rewrite $IsL$ and $IsR$
to their definitions - which is opaque if further simplification
does not occur.
=DOC
(* Proof Context: ⦏'one⦎ *)
=DESCRIBE
A component proof context for  theory $one$
\paragraph{Contents}

Rewriting (these both have the problem that their discrimination
net entry will match anything):
=GFT
one_def, one_fns_thm
=TEX
Stripping theorems:
=GFT
` ⊢ ∀ x y : ONE ⦁ (x = y) ⇔ T`
` ⊢ ∀ x y : 'a → ONE ⦁ (x = y) ⇔ T`
and through ¬
=TEX
Stripping conclusions:
=GFT
` ⊢ ∀ x y : ONE ⦁ (x = y) ⇔ T`
` ⊢ ∀ x y : 'a → ONE ⦁ (x = y) ⇔ T`
and through ¬
=TEX
Automatic proof procedures are respectively $basic\-\_prove\-\_tac$,
$basic\-\_prove\-\_conv$ and no existence prover.

\paragraph{Usage Notes}
Requires theory $one$.
As when entered into the rewriting net the rewriting theorems will match any term presented to the net, this proof context will
slow down rewriting.
=ENDDOC

=DOC
(* Proof Context: ⦏'combin⦎ *)
=DESCRIBE
A component proof context for theory $combin$
\paragraph{Contents}

Rewriting:
=GFT
comb_i_def, comb_k_def, o_def, o_i_thm
=TEX

Stripping theorems:
=GFT
=TEX
Stripping conclusions:
=GFT
=TEX
Automatic proof procedures are, respectively, $basic\-\_prove\-\_tac$,
$basic\-\_prove\-\_conv$ and no existence prover.

\paragraph{Usage Notes}
Requires theory $combin$.
=ENDDOC
In the above $comb\_s\_def$ seems less appropriate as an ``always rewriter'' as the number of symbols after rewriting, even if the arguments to $CombS$
are variables, only remains the same.

=DOC
(* Proof Context: ⦏'sets_alg⦎ *)
=DESCRIBE
A ``mild'' component proof context for theory $set$.
\paragraph{Contents}

Rewriting:
=GFT
∈_comp_conv, ∈_enum_set_conv, complement_clauses,
∪_clauses, ∩_clauses, set_dif_clauses, ⊖_clauses,
⊆_clauses, ⊂_clauses, ⋃_clauses,
⋂_clauses, ℙ_clauses
` ⊢ ∀ x y
	⦁ ¬ x ∈ {}
        ∧ x ∈ Universe
        ∧ (x ∈ {y} ⇔ x = y)`
=TEX

Stripping theorems:
=GFT
∈_comp_conv, ∈_enum_set_conv, ∈_in_clauses
⊆_clauses, ⊂_clauses
plus these all pushed in through ¬
=TEX

Stripping conclusions:
=GFT
∈_comp_conv, ∈_enum_set_conv, ∈_in_clauses
⊆_clauses, ⊂_clauses
plus these all pushed in through ¬
=TEX

Automatic proof procedures are respectively $basic\-\_prove\-\_tac$,
$basic\-\_prove\-\_conv$ and
the existence prover preprocessor:
=GFT
TOP_MAP_C (all_∃_uncurry_conv AND_OR_C sets_simple_∃_conv)
=TEX
{}. The preprocessor causes set membership ($∈$) to be treated
as function application in some cases.
\paragraph{Usage Notes}
Should not be used with proof context ``$'$sets$\_$ext'', requires theory $sets$.
=ENDDOC
Theorem $∅\_clauses$ is covered by the other
$?\_clauses$ material, and anyway is not currently complete,
and so is not included.
$sets\_clauses$ has some overlap with other theorems in the proof context.

=DOC
(* Proof Context: ⦏'sets_ext⦎ *)
=DESCRIBE
A component proof context for theory $set$, ``aggressively'' using
the extensionality of sets.
\paragraph{Contents}

Rewriting:
=GFT
∈_comp_conv, ∈_enum_set_conv, ∈_in_clauses, sets_ext_clauses
=TEX
Stripping theorems:
=GFT
∈_comp_conv, ∈_enum_set_conv, ∈_in_clauses, sets_ext_clauses
plus these all pushed in through ¬
=TEX
Stripping conclusions:
=GFT
∈_comp_conv, ∈_enum_set_conv, ∈_in_clauses, sets_ext_clauses
plus these all pushed in through ¬
=TEX
Automatic proof procedures are respectively $basic\-\_prove\-\_tac$,
$basic\-\_prove\-\_conv$ and the existence prover preprocessor:
=GFT
TOP_MAP_C (all_∃_uncurry_conv AND_OR_C sets_simple_∃_conv)
=TEX
The preprocessor causes set membership ($∈$) to be treated
as function application in some cases.

\paragraph{Usage Notes}
Should not be used with proof context ``$'$sets$\_$alg'', requires theory $sets$.
=ENDDOC
=DOC
(* Proof Context: ⦏sets_ext⦎ *)
=DESCRIBE
A complete proof context for reasoning about sets within the
predicate calculus, ``aggressively'' using
the extensionality of sets.
\paragraph{Contents}
Proof contexts ``$'$sets$\_$ext'' and ``predicates''.
\paragraph{Usage Notes}
Requires theory $sets$.
The proof context ``$'$sets$\_$ext1'' offers a much more useful
treatment of sets of pairs.
=ENDDOC
=DOC
(* Proof Context: ⦏'sets_ext1⦎ *)
=DESCRIBE
A component proof context for theory $set$, including sets of pairs,
``aggressively'' using
the extensionality of sets.
\paragraph{Contents}

Rewriting:
=GFT
∈_comp_conv, ∈_enum_set_conv, ∈_in_clauses,
sets_eq_conv, ⊆_conv, ⊂_conv
=TEX
Stripping theorems:
=GFT
∈_comp_conv, ∈_enum_set_conv, ∈_in_clauses,
sets_eq_conv, ⊆_conv, ⊂_conv
plus these all pushed in through ¬
=TEX
Stripping conclusions:
=GFT
∈_comp_conv, ∈_enum_set_conv, ∈_in_clauses,
sets_eq_conv, ⊆_conv, ⊂_conv
plus these all pushed in through ¬
=TEX
Automatic proof procedures are respectively $basic\-\_prove\-\_tac$,
$basic\-\_prove\-\_conv$ and the existence prover preprocessor:
=GFT
TOP_MAP_C (all_∃_uncurry_conv AND_OR_C sets_simple_∃_conv)
=TEX
The preprocessor causes set membership ($∈$) to be treated
as function application in some cases.

\paragraph{Usage Notes}
Should not be used with proof context ``$'$sets$\_$alg'', requires theory $sets$.
=ENDDOC
=DOC
(* Proof Context: ⦏sets_ext⦎ *)
=DESCRIBE
A complete proof context for reasoning about sets within the
predicate calculus, ``aggressively'' using
the extensionality of sets.
\paragraph{Contents}
Proof contexts ``$'$sets$\_$ext'' and ``predicates''.
\paragraph{Usage Notes}
Requires theory $sets$.
=ENDDOC

=DOC
(* Proof Context: ⦏sets_ext1⦎ *)
=DESCRIBE
A complete proof context for reasoning about sets, including sets
of pairs, within the
predicate calculus, ``aggressively'' using
the extensionality of sets.
\paragraph{Contents}
Proof contexts ``$'$sets$\_$ext1'' and ``predicates''.
\paragraph{Usage Notes}
Requires theory $sets$.
The proof context ``sets$\_$ext1'' offers a much more useful
treatment of sets of pairs.
=ENDDOC

=DOC
(* Proof Context: ⦏hol⦎ *)
=DESCRIBE
A ``mild'' complete proof context for the ancestors of theory $hol$
\paragraph{Contents}
Proof contexts ``basic$\_$hol'', ``$'$sum'', ``$'$combin'', and ``$'$sets$\_$alg''.

Automatic proof procedures are respectively $basic\-\_prove\-\_tac$,
$basic\-\_prove\-\_conv$ and $basic\-\_prove\-\_∃\-\_conv$
(merged in from the proof context of the same name).

\paragraph{Usage Notes}
Requires theory $hol$.
=ENDDOC

=DOC
(* Proof Context: ⦏hol1⦎ *)
=DESCRIBE
An ``aggressive'' complete proof context for the ancestors of theory $hol$.
\paragraph{Contents}
Proof contexts ``basic$\_$hol1'', ``$'$one'', ``$'$sum'', ``$'$combin'', and ``$'$sets$\_$ext''.

Automatic proof procedures are respectively $basic\-\_prove\-\_tac$,
$basic\-\_prove\-\_conv$ and $basic\-\_prove\-\_∃\-\_conv$
(merged in from the proof context of the same name).
\paragraph{Usage Notes}
Requires theory $hol$.
The proof context $hol2$ offers a more useful treatment of sets of pairs.
=ENDDOC
=DOC
(* Proof Context: ⦏hol2⦎ *)
=DESCRIBE
An ``aggressive'' complete proof context for the ancestors of theory $hol$.
\paragraph{Contents}
Proof contexts ``basic$\_$hol1'', ``$'$one'', ``$'$sum'', ``$'$combin'', and ``$'$sets$\_$ext1''.

Automatic proof procedures are respectively $basic\-\_prove\-\_tac$,
$basic\-\_prove\-\_conv$ and $basic\-\_prove\-\_∃\-\_conv$
(merged in from the proof context of the same name).
\paragraph{Usage Notes}
Requires theory $hol$.
=ENDDOC

=IGN
SPARE COPY SPARE COPY SPARE COPY SPARE COPY SPARE COPY

 =DOC
(* Proof Context: ⦏⦎ *)
 =DESCRIBE
A component proof context for
\paragraph{Contents}

Rewriting:
 =GFT
 =TEX
Stripping theorems:
 =GFT
 =TEX
Stripping conclusions:
 =GFT
 =TEX

\paragraph{Usage Notes}
Requires theory $$.
 =ENDDOC
=TEX

\section{EPILOGUE}
=SML
end; (* of signature ProofContexts1 *)
=TEX
\subsection{TEST POLICY}
The integration tests for this subsystem are to follow the general
guidelines laid down in \cite{DS/FMU/IED/PLN008}.

Testing of proof contexts is done primarily to
demonstrate presence, rather than correct functioning.
This is because the proof contexts will be built from tools and theorems
that are better tested directly.
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}




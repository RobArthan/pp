=IGN
********************************************************************************
dtd119.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
=TEX
\documentclass[a4paper,12pt]{article}

%%%%% YOU CAN ADD OTHER PACKAGES AS NEEDED BELOW:
\usepackage{A4}
\usepackage{Lemma1}
\usepackage{ProofPower}
\usepackage{epsf}
\makeindex

\def\Title{ Quantifier Elimination Toolkit: Detailed Design }

\def\Abstract{\begin{center}
{\bf Abstract}\par\parbox{0.7\hsize}
{\small This document gives the detailed design for tools that assist in developing quantifier elimination procedures.}
\end{center}}

\def\Reference{LEMMA1/HOL/DTD119}

\def\Author{R.D. Arthan}

\def\EMail{{\tt rda@lemma-one.com}}

\def\Phone{+44 118 958 4409}

\def\Fax{+44 118 956 1920}

%%%%% YOU MAY WANT TO CHANGE THE FOLLOWING TO GET A NICE FRONT PAGE:
\def\FrontPageTitle{ {\huge \Title } }
\def\FrontPageHeader{\raisebox{16ex}{\begin{tabular}[t]{c}
\bf Copyright \copyright\ : Lemma 1 Ltd \number\year\\\strut\\
\end{tabular}}}
\begin{centering}



\end{centering}

%%%%% THE FOLLOWING DEFAULTS WILL GENERALLY BE RIGHT:

\def\Version{\VCVersion}
\def\Date{\FormatDate{\VCDate}}

%%%%% NOW BEGIN THE DOCUMENT AND MAKE THE FRONT PAGE

\begin{document}
\headsep=0mm
\FrontPage
\headsep=10mm

%%%%% STANDARD RED-TAPE SECTIONS (MAY WANT TO INTERLEAVE SOME \newpage COMMANDS IN THESE)

%%%%% CONTENTS:

\subsection{Contents}

\tableofcontents

%%%%% REFERENCES:

\newpage
\subsection{References}

\bibliographystyle{fmu}

%%%%% CHANGE THE FOLLOWING AS NECESSARY (E.G., TO PICK UP daz.bib):
{\raggedright
\bibliography{fmu}
}
%%%%% CHANGES HISTORY:
\subsection{Changes History}
\begin{description}
\item[Issue 1.1 (2007/08/31)] First draft.
\item[Issue 1.2 (2007/09/01)] First complete version after module testing.
\item[Issue 1.3 (2011/07/19)] Added {\em prenex\_clauses}.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.
\item[2015/04/15]
Now uses new date and version macros from doctex
%%%% END OF CHANGES HISTORY %%%%
\end{description}

%%%%%  CHANGES FORECAST:

\subsection{Changes Forecast}

None.

%%%%% DISTRIBUTION LIST

\subsection{Distribution}

Lemma 1 build system.

\newpage

\section{Introduction}
\subsection{Scope}
This document gives the detailed design for various tools that assist in developing quantifier elimination procedures.

\subsection{Purpose and Background}
See \cite{DS/FMU/IED/HLD011}.


\section{THE SIGNATURE}


=SML
signature ⦏QuantElimTools⦎ = sig
=TEX

=DOC
	val ⦏dest_quant⦎ : TERM -> TERM * TERM * TERM;
	val ⦏is_quant⦎ : TERM -> bool;
	val ⦏mk_quant⦎ : TERM * TERM * TERM -> TERM;
=DESCRIBE
These functions are the destructor, discriminator and constructor functions for quantified terms, i.e., boolean terms formed by applying a constant to a (possibly paired) $\lambda$-abstraction.
=FAILURE
119001	?0 is not a quantified term
119003	?0 is not a valid varstruct
119004	?0 is not of type ⓣBOOL⌝
=ENDDOC

%%%% %%%% %%%% %%%%

=DOC
	val ⦏FAIL_C⦎ : CONV -> CONV;
=DESCRIBE
Conversional that always fails: $ID\_C\,conv$ is the same as $fail\_conv$.
This is for use with other conversionals which take a conversional as an input.
=ENDDOC

%%%% %%%% %%%% %%%%

=DOC
	val ⦏find_in_∧_conv⦎ : (TERM -> bool) -> CONV;
=DESCRIBE
Given a function specifying a property of terms and an iterated conjunction,
=INLINEFT
a ∧ b ∧ ...
=TEX
, this conversion rearranges it in the form:
=INLINEFT
c ∧ a ∧ b ∧ ...
=TEX
\ where $c$ is the first conjunct satisfying the property.
It fails if there is nothing to do or if no conjunct satisfies the property.
=FAILURE
119008	?0 cannot be rearranged or is already in the required form
=ENDDOC

%%%% %%%% %%%% %%%%

=DOC
	val ⦏FIRST_THEN_C⦎ : (CONV * (CONV -> CONV)) list -> CONV;
=DESCRIBE
$FIRST\_THEN\_C$ takes a list of conversion-conversional pairs and gives which acts as follows:
the conversions in the list are tried one after the other, and the process only fails if none of the conversions is applicable;
when a conversion succeeds, $FIRST\_THEN\_C$ is applied recursively to the remainder of the list as if by $X\_C\,FIRST\_THEN\_C$, where $X\_C$ is the conversional associated with the successful conversion.
The conversionals are intended to allow the process to be diverted into subterms of the result of a transformation.
For example, one might transform a unique existential quantification into an existential whose matrix contains a universal and then divert attention to the universal.
=FAILURE
119010	None of the conversions was applicable to ?0
=ENDDOC

%%%% %%%% %%%% %%%%

=DOC
	val ⦏ID_C⦎ : CONV -> CONV;
=DESCRIBE
The identity conversional: $ID\_C\,conv$ is the same as $conv$.
This is for use with other conversionals such as $FIRST\_THEN\_C$, q.v.,
which take a conversional as an input.
=ENDDOC

%%%% %%%% %%%% %%%%

=DOC
	val ⦏INNERMOST_QUANT_C⦎ : CONV -> CONV;
=DESCRIBE
$INNERMOST\_QUANT\_C$ is a conversional that maps a conversion over the innermost quantified subterms of the first-order structure of a term.
It fails if the first-order structure of the term is quantifier-free.
=FAILURE
119011	No quantified subterms were found
=ENDDOC

%%%% %%%% %%%% %%%%

=DOC
	val ⦏nnf_conv⦎ : CONV;
=DESCRIBE
This conversion puts a propositional formula into negation normal form, i.e., a normal form in which ¬ is pushed through the other propositional connectives using the following rules:
=GFT
	¬(p1 ∧ p2) ⇔ ¬p1 ∨ ¬p2	¬(p1 ∨ p2) ⇔ ¬p1 ∧ ¬p2
	¬(p1 ⇒ p2) ⇔ p1 ∧ ¬p2	¬(p1 ⇔ p2) ⇔ p1 ∧ ¬p2 ∨ ¬p1 ∧ p2
	(p1 ⇔ p2) ⇔ p1 ∧ p2 ∨ ¬p1 ∧ ¬p2	¬(¬p) ⇔ p
=TEX
Propositional simplification using {\em prop\_simp\_conv} is attempted before and after the above rules.
=FAILURE
119007	?0 is not of type ⓣBOOL⌝ or is already in negation
	normal form
=ENDDOC

%%%% %%%% %%%% %%%%

=DOC
	val ⦏PROP_ATOM_C⦎ : CONV -> CONV;
	val ⦏PROP_LIT_C⦎ : CONV -> CONV;
=DESCRIBE
$PROP\_ATOM\_C$ is a conversional that maps its argument over the outermost propositional atoms in a term.
$PROP\_LIT\_C$ maps its argument over the outermost propositional literals in a term.
Here a propositional atom is any term other than one formed using one of the propositional connectives ∧, ∨, ⇒, ⇔ or ¬.
A propositional literal is either a propositional atom or the negation of a propositional atom.
=ENDDOC

%%%% %%%% %%%% %%%%

=DOC
	val ⦏prop_simp_conv⦎ : CONV;
=DESCRIBE
This conversion simplifies propositional formula using the following rules:
=GFT
	¬(¬p) ⇔ p		¬F ⇔ T		¬T ⇔ F
	F ∨ p ⇔ p		p ∨ F ⇔ p		T ∨ p ⇔ T		p ∨ T ⇔ T
	p ∧ F ⇔ F		F ∧ p ⇔ F		T ∧ p ⇔ p		p ∧ T ⇔ p
	p ⇒ T ⇔ T		T ⇒ p ⇔ p		F ⇒ p ⇔ T		p ⇒ F ⇔ ¬p
	(p ⇔ T) ⇔ p	(T ⇔ p) ⇔ p	(F ⇔ p) ⇔ ¬p	(p ⇔ F) ⇔ ¬p
	(p ∨ p) ⇔ p		p ∧ p ⇔ p		(p ⇒ p) ⇔ T	(p ⇔ p) ⇔ T
	(p ∨ ¬p) ⇔ T	p ∧ ¬p ⇔ F		(p ⇒ ¬p) ⇔ ¬p	(p ⇔ ¬p) ⇔ F
	(¬p ∨ p) ⇔ T	¬p ∧ p ⇔ F		(¬p ⇒ p) ⇔ p	(¬p ⇔ p) ⇔ F
=TEX
The conversion fails if no simplification is possible.
=FAILURE
119012	No simplifications apply to ?0
=ENDDOC

%%%% %%%% %%%% %%%%

=DOC
	val ⦏QUANT_C⦎ : CONV -> CONV;
=DESCRIBE
$QUANT\_C$ is a conversional that applies its argument to the matrix of a quantified term.
=ENDDOC

%%%% %%%% %%%% %%%%

=DOC
	val ⦏QUANT_MAP_C⦎ : CONV -> CONV;
=DESCRIBE
$QUANT\_MAP\_C$ is a conversional that maps a conversion over all the quantifiers in a term, innermost quantifiers first.
If the conversion succeeds it is retried, so it should fail if it cannot make any progress.
=ENDDOC

%%%% %%%% %%%% %%%%

=DOC
	val ⦏QUANTS_C⦎ : CONV -> CONV;
=DESCRIBE
$QUANTS\_C$ is a conversional that maps its argument conversion over a term formed by repeatedly applying quantifiers to a non-quantified term.
The conversion is applied to each quantified term obtained by stripping off a leading part of the prefix, the innermost being processed first.
=ENDDOC

%%%% %%%% %%%% %%%%

=DOC
	val ⦏simple_∀_¬_∃_¬_conv⦎ : CONV;
=DESCRIBE
This conversion proves theorems of the form
=INLINEFT
⊢ (∀x⦁t) ⇔ (¬(∃x⦁¬t))
=FAILURE
119005	?0 is not of the form ⌜∀x⦁t⌝ where ⌜x⌝ is a variable
=ENDDOC

%%%% %%%% %%%% %%%%

=DOC
	val ⦏simple_∃_const_elim_conv⦎ : CONV;
=DESCRIBE
This conversion proves all theorems of the form:
=INLINEFT
⊢ (∃x⦁p) ⇔ p
=TEX
\ where the variable $x$ does not appear free in $p$.
=FAILURE
119006	?0 is not of the form ⌜∃x⦁p⌝ where ⌜x⌝ is a variable
	that does not occur free in ⌜p⌝
=ENDDOC

%%%% %%%% %%%% %%%%

=DOC
	val ⦏simple_one_point_conv⦎ : CONV;
=DESCRIBE
This conversion proves all theorems of the forms
=INLINEFT
⊢ (∃x⦁x = t ∧ p) ⇔ p[t/x]
=TEX
\ and
=INLINEFT
⊢ (∃x⦁x = t) ⇔ T
=TEX
\ where $p[t/x]$ denotes the result of substituting the term $t$ for the variable $x$ in $p$.
In the second form, $t$ may be the same as $x$.
=FAILURE
119009	?0 is not of the form ⌜∃x⦁x = t ∧ p⌝ or ⌜∃x⦁x = t⌝
=ENDDOC

%%%% %%%% %%%% %%%%

=DOC
	val ⦏split_∧_conv⦎ : (TERM -> bool) -> CONV;
=DESCRIBE
Given a function specifying a property of terms and an iterated conjunction,
=INLINEFT
a ∧ b ∧ ...
=TEX
, this conversion rearranges the conjunction up into the form:
=INLINEFT
(d ∧ c ∧ ...) ∧ (e ∧ f ∧ ...)
=TEX
, where $c, d, \ldots$ satisfy the property and $e, f, \ldots$ do not.
It fails there is nothing to do, i.e., if all the conjuncts satisfy the property, if none of the conjuncts satisfy the property or if the first conjunct satisfies the property and the others do not.
=ENDDOC
=FAILURE
119002	?0 is not of type ⓣBOOL⌝ or does not need rearranging
=DOC
	val ⦏prenex_clauses⦎ : THM;
=DESCRIBE
Higher-order rewriting with this theorem carries out conversion to prenex normal form.
=ENDDOC


=SML
end (* of signature QuantElimTools *);
=TEX

\section{TEST POLICY}
There are no special module test requirements.
\twocolumn[\section{INDEX}]
\small
\printindex

\end{document}









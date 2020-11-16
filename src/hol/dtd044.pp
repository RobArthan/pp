=IGN
********************************************************************************
dtd044.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  ℤ 2002/10/17 16:20:01 1.19 dtd044.doc,v
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

\def\Title{Detailed Design for the Theory of Sets}

\def\AbstractText{This document gives a detailed design for the theory ``sets''.}

\def\Reference{DS/FMU/IED/DTD044}

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
%% LaTeX2e port: \TPPproject{FST Project}  %% Mandatory field
%% LaTeX2e port: \TPPtitle{Detailed Design for the Theory of Sets}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Detailed Design for the \cr
%% LaTeX2e port: Theory of Sets}
%% LaTeX2e port: \TPPref{DS/FMU/IED/DTD044}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{1.19 %
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \def\SCCSdate{\FormatDate{2002/10/17 16:20:01 %
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPdate{\SCCSdate}  %% Mandatory field
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K. Blackburn & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{R.D. Arthan & WIN01\\K. Blackburn & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D. Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document gives a detailed design for the
%% LaTeX2e port: theory ``sets''.}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	    Library
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
\item [Issue 1.1 (1991/09/27),1.2 (1991/09/27)]
First drafts.
\item [Issue 1.3 (1991/10/02)]
Correcting typos.
\item [Issue 1.4 (1991/10/16)]
Changed to match \cite{DS/FMU/IED/HLD011}.
\item [Issue 1.5 (1991/10/21)]
Changes following comments.
\item [Issue 1.6 (1991/10/21)]
Simplified requirement on $IsSetRep$.

\item[Issue 1.7 (1992/01/20), \FormatDate{92/01/20} ] Updated to use new fonts.
\item[Issue 1.8 (1992/01/27) (23rd January 1992)]
Definitional mechanisms have
been changed to take lists of keys, rather than single ones.
\item[Issue 1.9 (1992/02/07) (7th February 1992)]
Made $basic\_hol$ a parent.
\item[Issue 1.10 (1992/03/24) to 1.13 (1992/05/15)]

The main purpose of the changes at this issue is to introduce new proof contexts.
The contexts introduced are $sets\_ext$ and $sets\_alg$.
$sets\_ext$ is a proof context suitable for automatic proof of results in this theory using extensionality of sets and elementary reasoning.
$sets\_alg$ is a proof context suitable for automatic simplification when conducting proofs which involve but are not primarily concerned with set theory.

In order to be able to introduce these proof contexts we have also included the definitions of the conversions which they use (after renaming these are $∈\_comp\_conv$ and $∈\_enum\_set\_conv$), and various additional theorems which are used by the proof contexts.

Use of correct quotation symbols.
\item[Issue 1.14 (1992/05/18) (18th May 1992)]
Moved mention of proof contexts out of document.
\item [Issue 1.15 (1992/05/27) (27th May 1992)]
Added $sets\_simple\_∃\_conv$.

\item[\FormatDate{92/08/24}, issue 1.16]
	Add indexing characters.

%\item[\FormatDate{193/01/27}, issue 1.17]
	Added conversions for equality and inclusion.
\item[Issue 1.18 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.19 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.20 (2005/05/07)] HOL now supports left-associative operators.
\item[Issue 1.21 (2006/12/10)] Added symmetric difference operator.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
The proof contexts should perhaps be built from $basic\_hol$ proof contexts rather than $pair$.
An existence prover should be included.

\pagebreak
\section{GENERAL}
\subsection{Scope}
This document contains a detailed design
for the theory ``sets'',
called for in \cite{DS/FMU/IED/HLD011}.
The design is implemented in \cite{DS/FMU/IED/IMP044}.

\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains the detailed design for the theory ``sets''.
This defines the type $SET$, and the operators upon it.

\subsubsection{Dependencies}
This document depends on \cite{DS/FMU/IED/IMP040},
and the theory design tools of \cite{DS/FMU/IED/DTD035}.
\subsubsection{Deficiencies}
None known.
\subsubsection{Possible Enhancements}
The theory is missing some already obvious theorem
members, and it may be appropriate to add others
as development and application work progresses.
There should also be some tactics and inference rules.
However, when considering further theorems one should be aware of the power of just rewriting with definitions, $sets\_clauses$, and placing $(simple\_)∈\_comp\_conv$ in the list of basic conversions (see $sets\_rewrite\_convs$).
Many ``obvious'' theorems, such as $⊢\ ∀\ a\ ⦁a\ ⊆\ a$,
can be proved, and therefore bypassed with such an approach.
The approach only fails if one wishes to keep the derived
set operators ``present'' in the goal.
\section{THE THEORY ``sets''}
\subsection{Design of the theory ``sets''}
=THDOC
req_name "sets" (Value "basic_hol");
=DESCRIBE
The theory ``⦏sets⦎'' defines a type of sets, operators upon the type,
and some associated theories.
=ENDDOC
=THDOC
req_const(⦏"IsSetRep"⦎,ⓣ('a → BOOL) → BOOL⌝);
req_defn(["IsSetRep","is_set_rep_def"],([],⌜IsSetRep = λ x:'a → BOOL⦁ T⌝));
=DESCRIBE
The representation type of sets, as given by
$IsSetRep$ is just any function from
the type of objects of the set to ⓣBOOL⌝.
Its definition is saved under the key ``IsSetRep''.
=ENDDOC
=THDOC
req_type(⦏"SET"⦎,1);
req_defn(["SET","set_def"],([],⌜∃ f:'a SET → 'a → BOOL⦁ TypeDefn IsSetRep f⌝));
=DESCRIBE
The type of sets, $SET$ is given by the representation
function $IsSetRep$.
=ENDDOC
=THDOC
req_const(⦏"SetComp"⦎,ⓣ('a → BOOL) → 'a SET⌝);
req_binder "SetComp";
req_const(⦏"∈"⦎,ⓣ'a → 'a SET → BOOL⌝);
req_infix(230,"∈");
req_defn([⦏"SetComp"⦎,"∈","set_comp_def"],
	([],⌜∀ (x : 'a) (p:'a → BOOL) (a: 'a SET) (b : 'a SET)⦁
	(x ∈ {v | p v} ⇔ p x) ∧
	((a = b) ⇔ (∀ x:'a⦁ x ∈ a ⇔ x ∈ b))
	⌝));
=DESCRIBE
The HOL constant $SetComp$ is a binder for forming set comprehensions.
The HOL constant $∈$ is set membership.
=ENDDOC
=THDOC
req_const(⦏"Empty"⦎,ⓣ'a SET⌝);
req_const(⦏"Universe"⦎,ⓣ'a SET⌝);
req_const(⦏"Insert"⦎,ⓣ'a → 'a SET → 'a SET⌝);
req_defn(["Empty","Universe","Insert","insert_def"],
	([],⌜∀ (x : 'a) (y : 'a) (a: 'a SET) ⦁
		¬(x ∈ {})
	∧	(x ∈ Universe)
	∧	(x ∈ Insert y a ⇔ (x = y ∨ x ∈ a))⌝));
=DESCRIBE
The HOL constant $Empty$ is the empty set.
The HOL constant $Universe$ is the set of all values of a type.
The HOL constant $Insert$ inserts an object into a set.
=ENDDOC
=THDOC
req_thm(⦏"sets_clauses"⦎,([], ⌜
	∀ (x : 'a) (y : 'a) (p:'a → BOOL) (q : BOOL)⦁
		(x ∈ {} ⇔ F)
	∧	(x ∈ Universe ⇔ T)
	∧	((x ∈ {v | q}) ⇔ q)
	∧	(x ∈ {v | p v} ⇔ p x)
	∧	(x ∈ {v | v = y} ⇔ (x = y))
	∧	(x ∈ {y} ⇔ (x = y))⌝));
=DESCRIBE
``$sets\_clauses$'' is a miscellaneous collection of theorems about sets, all appropriate for rewriting, and some drawn from the definitions.
Note that we do not need a direct rule for $⌜\{v | y = v\}⌝$,
as other clauses will give it indirectly:
we provide the clause in the first place as a way of rewriting one form of expressing a singleton set.
The definition of $Insert$ is excluded as there will sometimes
be good reasons why its form of rewriting won't be desired.
=ENDDOC
=THDOC
req_const("⦏~⦎",ⓣ'a SET → 'a SET⌝);
req_defn(["~","complement_def"],
	([],⌜∀ (x : 'a) (a: 'a SET) ⦁
	(x ∈ ~ a ⇔ ¬ x ∈ a)⌝));
=DESCRIBE
The HOL constant $\verb+~+$ forms the complement of a set.
=ENDDOC
=THDOC
req_thm("complement_clauses",([], ⌜
	(∀ (x : 'a) (a: 'a SET) ⦁(x ∈ ~ a ⇔ ¬ x ∈ a)) ∧
		(~ Universe = {})
	∧	(~ {} = Universe)⌝));
=DESCRIBE
``$⦏complement\_clauses⦎$'' provides simplifying clauses arising the fact that the ``$Empty$'' set and the ``$Universe$'' set are complementary.
=ENDDOC
=THDOC
req_const("∪",ⓣ'a SET → 'a SET → 'a SET⌝);
req_infix(260, "∪");
req_defn(["∪","∪_def"],([],⌜∀ (x:'a) (a : 'a SET) (b : 'a SET) ⦁
	(x ∈ a ∪ b) ⇔ (x ∈ a ∨ x ∈ b)⌝));
=DESCRIBE
The HOL constant $⦏∪⦎$ represents set union.
=ENDDOC
=THDOC
req_thm("∪_clauses",([], ⌜
	∀ (a: 'a SET)⦁
		(a ∪ {} = a)
	∧	({} ∪ a = a)
	∧	(a ∪ Universe = Universe)
	∧	(Universe ∪ a = Universe)
	∧	(a ∪ a = a)⌝));
=DESCRIBE
``$⦏∪\_clauses⦎$'' provides simplifying clauses associated with ``$\$∪$''.
=ENDDOC
=THDOC
req_const("∩",ⓣ'a SET → 'a SET → 'a SET⌝);
req_infix(270, "∩");
req_defn(["∩","∩_def"],([],⌜∀ (x:'a) (a : 'a SET) (b : 'a SET) ⦁
	(x ∈ a ∩ b) ⇔ (x ∈ a ∧ x ∈ b)⌝));
=DESCRIBE
The HOL constant $⦏∩⦎$ represents set union.
=ENDDOC
=THDOC
req_thm(⦏"∩_clauses"⦎,([], ⌜
	∀ (a: 'a SET)⦁
		(a ∩ {} = {})
	∧	({} ∩ a = {})
	∧	(a ∩ Universe = a)
	∧	(Universe ∩ a = a)
	∧	(a ∩ a = a)⌝));
=DESCRIBE
``$∩\_clauses$'' provides simplifying clauses associated with ``$\$∩$''.
=ENDDOC
=THDOC
req_const(⦏"\\"⦎,ⓣ'a SET → 'a SET → 'a SET⌝);
	(* ⦏\⦎ *)
req_left_infix(265, "\\");
req_defn(["\\","set_dif_def"],([],⌜∀ (x:'a) (a : 'a SET) (b : 'a SET) ⦁
	(x ∈ a \ b) ⇔ (x ∈ a ∧ ¬ (x ∈ b))⌝));
=DESCRIBE
The HOL constant ``$\verb+\+$'' represents set difference.
=ENDDOC
=THDOC
req_thm("set_dif_clauses",([], ⌜
	∀ (a: 'a SET)⦁
		(a \ {} = a)
	∧	({} \ a = {})
	∧	(a \ Universe = {})
	∧	(Universe \ a = ~ a)
	∧	(a \ a = {})⌝));
=DESCRIBE
``$⦏set\_dif\_clauses⦎$'' provides simplifying clauses associated with ``$\$\verb+\+$''.
=ENDDOC
=THDOC
req_const("⊖",ⓣ'a SET → 'a SET → 'a SET⌝);
req_infix(250, "⊖");
req_defn(["⊖","⊖_def"],([],⌜∀ (x:'a) (a : 'a SET) (b : 'a SET) ⦁
	(x ∈ a ⊖ b) ⇔ ¬(x ∈ a ⇔ x ∈ b)⌝));
=DESCRIBE
The HOL constant $⦏⊖⦎$ represents symmetric difference of sets.
=ENDDOC
=THDOC
req_thm(⦏"⊖_clauses"⦎,([], ⌜
	∀ (a: 'a SET)⦁
		(a ⊖ {} = a)
	∧	({} ⊖ a = a)
	∧	(a ⊖ Universe = ~a)
	∧	(Universe ⊖ a = ~a)
	∧	(a ⊖ a = {})⌝));
=DESCRIBE
``$⊖\_clauses$'' provides simplifying clauses associated with ``$\$⊖$''.
=ENDDOC
=THDOC
req_const("⊆",ⓣ'a SET → 'a SET → BOOL⌝);
req_const("⊂",ⓣ'a SET → 'a SET → BOOL⌝);
req_infix(230, "⊆");
req_infix(230, "⊂");
req_defn(["⊆","⊆_def"],([],⌜∀ a b : 'a SET ⦁
	(a ⊆ b) ⇔ ∀ x ⦁ x ∈ a ⇒ x ∈ b⌝));
req_defn(["⊂","⊂_def"],([],⌜∀ a b : 'a SET ⦁
	(a ⊂ b) ⇔ ((a ⊆ b) ∧ (∃ x ⦁ ¬(x ∈ a) ∧ (x ∈ b)))⌝));
=DESCRIBE
The HOL constant $⦏⊆⦎$ represents set inclusion.
The HOL constant $⦏⊂⦎$ represents proper set inclusion.
=ENDDOC
=THDOC
req_thm("⊆_clauses",([], ⌜
	∀ (a: 'a SET)⦁
		(a ⊆ a)
	∧	({} ⊆ a)
	∧	(a ⊆ Universe)⌝));
=DESCRIBE
``$⦏⊆\_clauses⦎$'' provides simplifying clauses associated with ``$\$⊆$''.
=ENDDOC
=THDOC
req_thm("⊂_clauses",([], ⌜
	∀ (a: 'a SET)⦁
		¬ (a ⊂ a)
	∧	¬ (a ⊂ {})
	∧	({} ⊂ Universe)⌝));
=DESCRIBE
``$⦏⊂\_clauses⦎$'' provides simplifying clauses associated with ``$\$⊂$''.
=ENDDOC
=THDOC
req_const("⋃",ⓣ('a SET) SET → 'a SET⌝);
req_const("⋂",ⓣ('a SET) SET → 'a SET⌝);
req_defn(["⋃","⋃_def"],([],⌜∀ (x: 'a) (a: ('a SET) SET) ⦁
	(x ∈ ⋃ a) ⇔ ∃ s ⦁ x ∈ s ∧ s ∈ a⌝));
req_defn(["⋂","⋂_def"],([],⌜∀ (x: 'a) (a: ('a SET) SET) ⦁
	(x ∈ ⋂ a) ⇔ ∀ s ⦁ s ∈ a ⇒ x ∈ s⌝));
=DESCRIBE
The HOL constant $⦏⋃⦎$ represents generalised union.
The HOL constant $⦏⋂⦎$ represents generalised intersection.
=ENDDOC
=THDOC
req_thm("⋃_clauses",([], ⌜
		(⋃ ({}: 'a SET SET) = {})
	∧	(⋃ (Universe: 'a SET SET) = Universe)⌝));
=DESCRIBE
``$⦏⋃\_clauses⦎$'' provides simplifying clauses associated with ``$\$⋃$''.
=ENDDOC
=THDOC
req_thm("⋂_clauses",([], ⌜
		(⋂ ({}: 'a SET SET) = Universe)
	∧	(⋂ Universe = ({}: 'a SET SET))⌝));
=DESCRIBE
``$⦏⋂\_clauses⦎$'' provides simplifying clauses associated with ``$\$⋂$''.
=ENDDOC
=THDOC
req_const("ℙ",ⓣ'a SET → ('a SET) SET⌝);
req_defn(["ℙ","ℙ_def"],([],⌜∀ (x : 'a SET) (a: 'a SET) ⦁
	(x ∈ ℙ a) ⇔ x ⊆ a⌝));
=DESCRIBE
The HOL constant $⦏ℙ⦎$ represents the power set constructor.
=ENDDOC
=THDOC
req_thm("ℙ_clauses",([], ⌜
	∀ (a:'a SET)⦁
		(ℙ {} = {{}})
	∧	(ℙ Universe = Universe)
	∧	a ∈ ℙ a
	∧	{} ∈ ℙ a⌝));
=DESCRIBE
``$⦏ℙ\_clauses⦎$'' provides simplifying clauses associated with ``$\$ℙ$''.
=ENDDOC
=THDOC
req_thm("∅_clauses",([], ⌜∀ (x : 'a) (a:'a SET) ⦁
	{x | F} = {} ∧
	¬ x ∈ {} ∧
	{} ∪ a = a ∧
	a ∪ {} = a ∧
	{} ∩ a = {} ∧
	a ∩ {} = {} ∧
	a \ {} = a ∧
	{} \ a = {} ∧
	a ⊖ {} = a ∧
	{} ⊖ a = a ∧
	{} ⊆ a ∧
	(a ⊆ {} ⇔ a = {}) ∧
	({} ⊂ a ⇔ ¬ a = {}) ∧
	¬ a ⊂ {} ∧
	¬ x ∈ ⋃ {} ∧
	x ∈ ⋂ {} ∧
	{} ∈ ℙ a ∧
	(ℙ {} = {{}})⌝));
=DESCRIBE
The theorem ``$⦏∅\_clauses⦎$'' gives all the interactions of the empty set with the operators given in the theory ``sets''.
This will probably be dropped because the results are mostly in the other `clauses'.
=ENDDOC
=THDOC
req_thm("∈_in_clauses",([], ⌜
	(∀ (x : 'a) (y : 'a) (a: 'a SET) ⦁
		(x ∈ Universe ⇔ T)
	∧	(x ∈ {} ⇔ F)
	∧	(x ∈ Insert y a ⇔ (x = y ∨ x ∈ a)))
∧	(∀ (x:'a) (a : 'a SET) (b : 'a SET) ⦁
		(x ∈ a ∪ b ⇔ x ∈ a ∨ x ∈ b)
	∧	(x ∈ a ∩ b ⇔ x ∈ a ∧ x ∈ b)
	∧	(x ∈ a \ b ⇔ x ∈ a ∧ ¬ x ∈ b)
	∧	(x ∈ a ⊖ b ⇔ ¬(x ∈ a ⇔ x ∈ b)))
∧	(∀ (x:'a) (a : 'a SET SET) ⦁
		(x ∈ ⋃ a ⇔ ∃ s ⦁ x ∈ s ∧ s ∈ a)
	∧	((x ∈ ⋂ a) ⇔ ∀ s ⦁ s ∈ a ⇒ x ∈ s)
∧	(∀ (x : 'a SET) (a : 'a SET) ⦁(x ∈ ℙ a ⇔ x ⊆ a)))⌝));
=DESCRIBE
The theorem ``$⦏∈\_in\_clauses⦎$'' gives theorems which ``push in'' membership assertions.
=ENDDOC
=THDOC
req_thm("sets_ext_clauses",([], ⌜∀(a : 'a SET) (b : 'a SET) ⦁
	((a ⊂ b) ⇔ ((∀ x ⦁ x ∈ a ⇒ x ∈ b) ∧ (∃ x ⦁ ¬(x ∈ a) ∧ (x ∈ b))))
∧	((a ⊆ b) ⇔ ∀ x ⦁ x ∈ a ⇒ x ∈ b)
∧	((a = b) ⇔ (∀ x:'a⦁ x ∈ a ⇔ x ∈ b))⌝));
=DESCRIBE
The theorem ``$⦏sets\_ext\_clauses⦎$'' gives theorems which express extensionality of sets and closely related results.
They are for use when set theoretic results are to be obtained by reasoning about membership rather than by more algebraic means.
=ENDDOC
\subsection{Signature of the theory ``sets''}
=DOC
signature ⦏SetsTheory⦎ = sig
	val ⦏set_def⦎ : THM;
	val ⦏sets_clauses⦎ : THM;
	val ⦏∅_clauses⦎ : THM;
	val ⦏∈_in_clauses⦎ : THM;
	val ⦏sets_ext_clauses⦎ : THM;
	val ⦏complement_clauses⦎ : THM;
	val ⦏∪_clauses⦎ : THM;
	val ⦏∩_clauses⦎ : THM;
	val ⦏set_dif_clauses⦎ : THM;
	val ⦏⊖_clauses⦎ : THM;
	val ⦏⊆_clauses⦎ : THM;
	val ⦏⊂_clauses⦎ : THM;
	val ⦏⋃_clauses⦎ : THM;
	val ⦏⋂_clauses⦎ : THM;
	val ⦏ℙ_clauses⦎ : THM;
	val ⦏is_set_rep_def⦎ : THM;
	val ⦏set_comp_def⦎ : THM;
	val ⦏insert_def⦎ : THM;
	val ⦏complement_def⦎ : THM;
	val ⦏∪_def⦎ : THM;
	val ⦏∩_def⦎ : THM;
	val ⦏set_dif_def⦎ : THM;
	val ⦏⊖_def⦎ : THM;
	val ⦏⊆_def⦎ : THM;
	val ⦏⊂_def⦎ : THM;
	val ⦏⋃_def⦎ : THM;
	val ⦏⋂_def⦎ : THM;
	val ⦏ℙ_def⦎ : THM;
=DESCRIBE
This is the signature in which we declare theory ``sets''.
$sets\_clauses$ is bound the theorem saved with the same name as
key,
$insert\_def$ is bound to the definition of $Insert$, saved with key $Insert$, and the other $\_def$ follow the same pattern.
=ENDDOC
=DOC
val ⦏simple_∈_comp_conv⦎ : CONV;
=DESCRIBE
A conversion for set membership.
It cannot handle variable structures bound by the set comprehension.
=FRULE 1 Conversion
simple_∈_comp_conv
⌜x ∈ {v | p[v]}⌝
├
├
⊢ x ∈ {v | p[v]} ⇔ p[x]
=TEX
=SEEALSO
$∈\_comp\_conv$
=FAILURE
44001	?0 is not of the form:⌜x ∈ {v | p[v]}⌝
=ENDDOC
=DOC
val ⦏∈_comp_conv⦎ : CONV;
=DESCRIBE
A conversion for set membership.
It can handle variable structures bound by the set comprehension.
=FRULE 1 Conversion
∈_comp_conv
⌜t ∈ {v[x,y,...] | p[x,y,...]}⌝
├
├
⊢ t ∈ {vs[x,y,...] | p[x,y,...]}
⇔ p[x1,y1,...]
=TEX
where $x1$, $y1$, etc, are the appropriate components of
$t$, extracted via $Fst$ and $Snd$.
=SEEALSO
$simple\_∈\_comp\_conv$
=FAILURE
27002	?0 is not of form:⌜x ∈ {v | p[v]}⌝
=ENDDOC
=DOC
val ⦏∈_enum_set_rule⦎ : TERM -> TERM list -> THM;
=DESCRIBE
Give that something within an enumerated set is a member of that set.
=FRULE 1 Rule
∈_enum_set_rule
⌜ti⌝
[⌜t1⌝,...⌜tn⌝]
├
├
⊢ ti ∈ {t1,...,tn}
=TEX
where $ti$ is $α$-convertible to one of $t1,\ldots,tn$.
=FAILURE
3012	?0 and ?1 do not have the same types
27001	?0 not a member of list of terms
=FAILUREC
Message 3012 occurs when the term list cannot be made into
an enumerated set because of differing types.
=ENDDOC
=DOC
val ⦏∈_enum_set_conv⦎ : CONV;
=DESCRIBE
Give that something within an enumerated set is a member of that set.
=FRULE 1 Conversion
∈_enum_set_conv
⌜ti ∈ {t1,...,tn}⌝
├
├
⊢ ti ∈ {t1,...,tn} ⇔ T
=TEX
where $ti$ is $α$-convertible to one of $t1,\ldots,tn$.
=FAILURE
27005	?0 not a member of the enumerated set ?1
27006	?0 is not of the form: ⌜x ∈ {t1, ..., tn}⌝
=FAILUREC
Message 3012 occurs when the term list cannot be made into
an enumerated set because of differing types.
=ENDDOC
=DOC
val ⦏sets_simple_∃_conv⦎ : CONV;
=DESCRIBE
This conversion changes an existentially quantified term
in a (perhaps nullary) function whose range is a set to
an existentially quantified term
in a function whose range is a function from the type
of the set element to $⌜:BOOL⌝$.
It is only applicable if all instances of the bound function
 in the body of the term are applied to sufficent arguments and then tested
for set membership by $∈$.
=FRULE 2 Conversion
sets_simple_∃_conv
⌜∃ f : ... → ty SET ⦁
   P[ t1 ∈ f ...,
      t2 ∈ f ... , ...]⌝
├
├
⊢ ∃ f : ... → ty SET ⦁
   P[ t1 ∈ f, t2 ∈ f ...,  ...]
⇔
∃ f' : ... → ty SET ⦁
   P[ f' ... t1, f' ... t2, ...]⌝
=TEX
where the $t_i$ are arbitrary terms.
=EXAMPLE
sets_simple_∃_conv ⌜∃ S ⦁ ∀ x y ⦁ x ∈ S y ⇔ ¬(x = y)⌝ --->
 ⊢ (∃ S ⦁ ∀ x y ⦁ x ∈ S y ⇔ ¬(x = y)) ⇔
   (∃ S' ⦁ ∀ x y ⦁ S' y x ⇔ ¬(x = y))
=TEX
=USES
This function is used to implement a automated existence proof preprocessor
for the ``sets'' proof context.
=FAILURE
44010	?0 is not of the form: ⌜∃ x : ... → ty SET ⦁ ...⌝
44011	?0 is not of the form: ⌜∃ x ⦁ ... x ...⌝
44012	?0 has instances of ?1 not embedded in subterms of the
	form: ⌜t ∈ ?1 ...⌝
44013	Unable to prove ?0
=ENDDOC
=DOC
val ⦏sets_eq_conv⦎ : CONV;
val ⦏⊆_conv⦎ : CONV;
val ⦏⊂_conv⦎ : CONV;
=DESCRIBE
These conversions use the extensional property of sets to transform
terms of the form
=INLINEFT
⌜a = b⌝
=TEX
,
=INLINEFT
⌜a ⊆ b⌝
=TEX
\ or
=INLINEFT
⌜a ⊂ b⌝
=TEX
\ (where $a$ and $b$ are sets) into assertions about membership of $a$
and $b$. The conversions introduce variable structures in the membership
assertions if the elements of $a$ and $b$ are pairs (i.e. have types
of the form:
=INLINEFT
σ × τ
=TEX
).

If the elements are not pairs, the conversions behave as follows:
=FRULE 1 Conversion
sets_eq_conv
⌜a = b⌝
├
├
⊢ (a = b) ⇔ (∀ x ⦁ x ∈ a ⇔ x ∈ b)
=TEX
=FRULE 1 Conversion
⊆_conv
⌜a ⊆ b⌝
├
├
⊢ (a ⊆ b) ⇔ (∀ x ⦁ x ∈ a ⇒ x ∈ b)
=TEX
=FRULE 1 Conversion
⊂_conv
⌜a ⊂ b⌝
├
├
⊢ (a ⊂ b) ⇔ (∀ x ⦁ x ∈ a ⇒ x ∈ b)
		∧ (∃ x⦁ ¬ x ∈ a ∧ x ∈ b)
=TEX
where $x$ represents a variable whose name is ``$x$'' decorated to
avoid clashing with the free variables of $a$ or $b$.

If the elements of $a$ and $b$ are pairs, then a variable structure
(whose free variables have names chosen from the sequence ``$x1$'', ``$x2$'',
\ldots\ so as not to clash with any of the variables in $a$ or $b$)
is used instead of $x$ on the left hand side of each $∈$,
and the quantification is over the free variables of the variable structure.
For example:
=FRULE 1 Example
⊆_conv
⌜{(1,2),3} ⊆ x2⌝
├
├
⊢ {((1, 2), 3)} ⊆ x2
⇔ ∀ x1 x3 x4⦁
((x1, x3), x4) ∈ {((1, 2), 3)}
⇒ ((x1, x3), x4) ∈ x2
=TEX
Here, $x2$ has not been used in the variable structure
since it occurs in the input term.

(The distinction between the variable naming rules followed in the
simple case and the paired case has some mnemonic value
and makes the conversions compatible
with rewriting with the theorem $sets\_ext\_clauses$ as done, for example,
in the proof context $sets\_ext$.)
=SEEALSO
=FAILURE
44021	?0 is not of the form: ⌜a = b⌝ where ⌜a⌝ and ⌜b⌝ are sets
44022	?0 is not of the form: ⌜a ⊆ b⌝
44023	?0 is not of the form: ⌜a ⊂ b⌝
=ENDDOC

=SML
end;(* of signature SetsTheory *)
=TEX
\section{TEST POLICY}
Any functions given in this document should be tested according to the
general criteria set out in \cite{DS/FMU/IED/PLN008}, using the
tests in \cite{DS/FMU/IED/MDT044}.
In \cite{DS/FMU/IED/MDT044} the theory produced is checked by the theory design tools
of \cite{DS/FMU/IED/DTD035}, against the theory design provided.

The module tests should include automatic proof of all the ``rules'' in \cite{Spivey89} expressible in this part of set theory.
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}




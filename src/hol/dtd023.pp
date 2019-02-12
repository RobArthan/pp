=IGN
********************************************************************************
dtd023.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  dtd023.doc  ℤ $Date: 2005/12/16 10:34:27 $ $Revision: 1.29 $ $RCSfile: dtd023.doc,v $
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

\def\Title{Detailed Design for Basic Definitions and Axioms}

\def\AbstractText{This document contains the detailed design for the theories $min$, $init$, $log$ and $misc$. These provide the basic definitions and axioms for ICL HOL.}

\def\Reference{DS/FMU/IED/DTD023}

\def\Author{D.J. King, K. Blackburn}


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
%% LaTeX2e port: % TQtemplate.tex
%% LaTeX2e port: \documentstyle[hol1,11pt,TQ]{article}
%% LaTeX2e port: \ftlinepenalty=9999
\def\Hide#1{}
%% LaTeX2e port: \def\Bool{``$\it{:}bool\,$''}
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{FST PROJECT}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Detailed Design for Basic Definitions and Axioms}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/DTD023}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.29 $ %
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2005/12/16 10:34:27 $ %
%% LaTeX2e port: }}  %% Mandatory field (with sensible default)
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: %\TPPauthor{D.J.~King & WIN01}  %% Mandatory field
%% LaTeX2e port: \TPPauthors{D.J.~King & WIN01\\K.~Blackburn & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document contains the detailed design for
%% LaTeX2e port: the theories $min$, $init$, $log$ and $misc$.
%% LaTeX2e port: These provide the basic definitions and axioms for ICL HOL.
%% LaTeX2e port: }
%% LaTeX2e port: %\TPPabstractB{}
%% LaTeX2e port: %\TPPabstractC{}
%% LaTeX2e port: %\TPPabstractD{}
%% LaTeX2e port: %\TPPabstractE{}
%% LaTeX2e port: %\TPPabstractF{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port:       Project Library}}
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

\pagebreak
\section{DOCUMENT CONTROL}
\subsection{Contents List}
\tableofcontents
\subsection{Document Cross References}

\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes History}  % to get section number `0.3'

\begin{description}
\item[Issues 1.1 (1991/05/24) - 1.2 (1991/05/24)]
Initial versions.
\item[Issue 1.3 (1991/06/27)]
Changed $type\_definition\_def$ to $type\_defn\_def$.
\item[Issue 1.4 (1991/09/02) (2 September 1991)]
Added words to the document. This version has been
prepared in anticipation of a desk check.
\item[Issue 1.5 (1991/09/02) (2 September 1991)]
Few minor modifications to the wording.
\item[Issue 1.6 (1991/09/20) (18 September 1991)]
Added theory design material.
\item[Issue 1.7 (1991/09/20) (20 September 1991)]
Fixed authors field.
\item[Issue 1.8 (1991/09/23) (23 September 1991)]
Reacted to issue 1.3 of \cite{DS/FMU/IED/DTD035}.
\item[Issue 1.9 (1991/10/17) (17 October 1991)]
Added theorems added to ``misc'' by \cite{DS/FMU/IED/IMP037}.
\item[Issue 1.10 (1991/10/21) (21 October 1991)]
Changes after comments.
\item[Issue 1.11 (1991/10/31) (31 October 1991)]
Removed mention of $∨\_¬\_thm$.
\item[Issue 1.12 (1991/11/11) (11th November 1991)]
Changes after comments on circulated copy.
\item[Issue 1.13 (1991/11/22) (22th November 1991)]
Added constant specification material.
\item[Issue 1.14 (1991/11/25) (25th November 1991)]
Inserted a missing bracket.
\item[Issue 1.15 (1991/11/29) (29th November 1991)]
Put explicit typing on some theorem requirements.

\item[Issue 1.16 (1992/01/20) (\FormatDate{92/01/20})] Updated to use new fonts.
\item [Issue 1.17 (1992/01/27), 1.18 (1992/01/28)]
Reacted to changes in, e.g., $req\_defn$.
\item [Issue 1.19 (1992/02/07)]
Added $Arbitrary$ to theory ``misc''.
\item [Issue 1.20 (1992/03/18),1.21 (1992/03/19)]
Added $¬\_∀\_thm$ and $¬\_∃\_thm$.
\item [Issue 1.22 (1992/04/14) (13th April 1992)]
Changes due to CR0017.
\item[Issue 1.23 (1992/05/14) (14 May 1992)] Use correct quotation symbols.
\item [Issue 1.24 (1992/05/26)(26th May 1992)]
Renamings from version 1.5 of DS/FMU/IED/WRK038.
\item [Issue 1.25 (1992/06/03)(3rd June 1992)]
Removed constant specification material.

\item[Issue 1.26 (1992/08/24)]
	Add indexing characters.

%\item[\FormatDate{$Date: 2005/12/16 10:34:27 $%
%}, issue \SCCSversion~]

\item[Issue 1.27 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.28 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.29 (2005/12/16)] The prefix for private interfaces is now $pp'$ rather than $icl'$.
\item[Issue 1.30 (2011/07/11)] Added $∃\_intro\_thm$ to theory ``misc''.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}

None.

\pagebreak
\section{GENERAL}

\subsection{Scope}
This document contains the signatures for the basic
definitions and axioms which form part of the ICL HOL
system. It is provided in response to the requirements
stated in \cite{DS/FMU/IED/HLD011} and
\cite{DS/FMU/IED/PLN008}.

\subsection{Introduction}

\subsubsection{Background and Purpose}

The signatures for the basic definitions and axioms
each introduce the interfaces for the structures
of the same names. It is intended that the structures
will create the theories $min$, $log$, $init$ and $misc$,
using the interface to the abstract datatype $THM$,
see \cite{DS/FMU/IED/DTD012}.

The basic definitions and axioms for ICL HOL have
been adapted from those of the ICL HOL prototype
\cite{DS/FMU/IED/SML008}.

\subsubsection{Interface}

This document defines the signatures $MinTheory$,
$LogTheory$ and $InitTheory$ and $MiscTheory$.
All four Standard ML structures corresponding to these
signatures will be open on entry.

\subsubsection{Deficiencies}

Strings are not indexed in ``=THDOC'' sections, but in
``=DESCRIBE'' sections.

\subsubsection{Dependencies}

The theory design section relies on the theory design tools
of \cite{DS/FMU/IED/IMP035}, as well as a HOL parser.
The rest relies on, at least, \cite{DS/FMU/IED/IMP012}.

\section{THEORY ``min''}
The theory ``min'' introduces the primitive
types and constants.
\subsection{The Design of Theory ``min''}

=THDOC
req_name "min" Nil;
=DESCRIBE
The theory ``⦏min⦎'' introduces the primitive
types and constants.
=ENDDOC
=THDOC
req_type ("→",2);
req_infix (100,"→");
req_terminator "→";
=DESCRIBE
$⦏→⦎$ is the HOL function type constructor.
=ENDDOC
=THDOC
req_type ("BOOL",0);
=DESCRIBE
$⦏BOOL⦎$ is the type of booleans, a type with exactly two values.
=ENDDOC
=THDOC
req_type ("IND",0);
=DESCRIBE
$⦏IND⦎$ is a type with a countably infinite number of members.
It is intended for use as a foundation for
building the theory of integers.
=ENDDOC
=THDOC
req_binder "λ";
req_terminator "λ";
=DESCRIBE
$⦏λ⦎$ is parsed as a binder, though it corresponds to a method
of term formation, rather than a constant.
It is used to indicate $λ$-abstractions.
=ENDDOC
=THDOC
req_const("⇒",ⓣBOOL → BOOL → BOOL⌝);
req_infix (20,"⇒");
req_terminator "⇒";
=DESCRIBE
$⦏⇒⦎$ is the HOL constant for logical implication.
=ENDDOC
=THDOC
req_const("=",ⓣ'a → 'a → BOOL⌝);
req_infix(200,"=");
req_terminator "=";
=DESCRIBE
$⦏=⦎$ is the HOL constant for equalities.
=ENDDOC
=THDOC
req_const("ε",ⓣ('a → BOOL) → 'a⌝);
req_binder "ε";
req_terminator "ε";
=DESCRIBE
$⦏ε⦎$ is the HOL constant for the choice function.
=ENDDOC
Red tape to end theory design.
=THSML
summarize_td_results ();
val ⦏min_success⦎ = theory_check_success ();
initialise_td_results ();
=TEX

\subsection{The Signature $MinTheory$}

There are no interfaces to the structure
in which ``min'' is implemented
and hence the signature is ``empty''.

The HOL type $BOOL$ is assigned to an ML variable of the same name in \cite{DS/FMU/IED/DTD003}.

=DOC
signature ⦏MinTheory⦎ = sig end;
=DESCRIBE
The signature $MinTheory$ contains the definitions for
the theory $min$. This introduces the primitive types and
constants of HOL.
=ENDDOC

\newpage

\section{THE THEORY ``log''}
\subsection{The Design of Theory ``log''}
=THDOC
req_name "log" (Value "min");
=DESCRIBE
The theory ``⦏log⦎'' consists of definitions
for the basic constructors which constitute first
and second
order logic (e.g., $¬$, $∃$, $∀$) as well as definitions
of $true$, $false$, injective functions ($one\_one$), surjections ($onto$),
and a definition of sub-types ($type\_defn$).
=ENDDOC
=THDOC
req_const ("T",ⓣBOOL⌝);
req_defn (["T","t_def"], ([],⌜T = (λ x:BOOL⦁ x) = (λ x⦁ x)⌝));
=DESCRIBE
$⦏T⦎$ is the HOL constant for logical truth.
Its definition is bound to the ML variable $t\_def$.
=ENDDOC
=THDOC
req_const ("∀",ⓣ('a → BOOL) → BOOL⌝);
req_binder "∀";
req_terminator "∀";
req_defn (["∀","∀_def"], ([],⌜$∀ = (λ P⦁ P = (λ x:'a⦁ T))⌝));
=DESCRIBE
$⦏∀⦎$ is the HOL constant for universal quantification.
Its definition is bound to the ML variable $∀\_def$.
=ENDDOC
=THDOC
req_const ("∃",ⓣ('a → BOOL) → BOOL⌝);
req_binder "∃";
req_terminator "∃";
req_defn (["∃","∃_def"], ([],⌜$∃ = (λ P:'a → BOOL⦁ P ($ε P))⌝));
=DESCRIBE
$⦏∃⦎$ is the HOL constant for existential quantification.
Its definition is bound to the ML variable $∃\_def$.
=ENDDOC
=THDOC
req_const ("F",ⓣBOOL⌝);
req_defn (["F","f_def"], ([],⌜F = (∀ b:BOOL⦁ b)⌝));
=DESCRIBE
$⦏F⦎$ is the HOL constant for logical falsity.
Its definition is bound to the ML variable $f\_def$.
=ENDDOC
=THDOC
req_const ("¬",ⓣBOOL → BOOL⌝);
req_prefix (50,"¬");
req_terminator "¬";
req_defn (["¬","¬_def"], ([],⌜$¬ = (λ b⦁ b ⇒ F)⌝));
=DESCRIBE
$⦏¬⦎$ is the HOL constant for logical negation.
Its definition is bound to the ML variable $¬\_def$.
=ENDDOC
=THDOC
req_const ("∧",ⓣBOOL → BOOL → BOOL⌝);
req_infix (40,"∧");
req_terminator "∧";
req_defn (["∧","∧_def"], ([],⌜$∧ = (λ b1 b2⦁ ∀ b⦁ (b1 ⇒ b2 ⇒ b) ⇒ b)⌝));
=DESCRIBE
$⦏∧⦎$ is the HOL constant for logical conjunction.
Its definition is bound to the ML variable $∧\_def$.
=ENDDOC
=THDOC
req_const ("∨",ⓣBOOL → BOOL → BOOL⌝);
req_infix (30,"∨");
req_terminator "∨";
req_defn (["∨","∨_def"], ([],⌜$∨ = (λ b1 b2⦁ ∀ b⦁ (b1 ⇒ b) ⇒ (b2 ⇒ b) ⇒ b)⌝));
=DESCRIBE
$⦏∨⦎$ is the HOL constant for logical disjunction.
Its definition is bound to the ML variable $∨\_def$.
=ENDDOC
=THDOC
req_const("OneOne",ⓣ('a → 'b) → BOOL⌝);
req_defn(["OneOne","one_one_def"],([],
	⌜OneOne = (λ f:'a → 'b ⦁
	 ∀ x1 x2⦁ f x1 = f x2 ⇒ x1 = x2)⌝));
=DESCRIBE
$⦏OneOne⦎$ is the HOL constant for ``One-One'' functions,
i.e. injective functions.
Its definition is bound to the ML variable $one\_one\_def$.
=ENDDOC
=THDOC
req_const("Onto",ⓣ('a → 'b) → BOOL⌝);
req_defn(["Onto","onto_def"],([],
	⌜Onto = (λ f:'a → 'b⦁ ∀ y⦁ ∃ x⦁ y = f x)⌝));
=DESCRIBE
$⦏Onto⦎$ is the HOL constant for ``Onto'' functions,
i.e. surjective functions.
Its definition is bound to the ML variable $onto\_def$.
=ENDDOC
=THDOC
req_const("TypeDefn",ⓣ('b → BOOL) → ('a → 'b) → BOOL⌝);
req_defn(["TypeDefn","type_defn_def"],([],
	⌜TypeDefn =
	(λ (P : 'b → BOOL) (rep: 'a → 'b)⦁
	 OneOne rep ∧ (∀ x⦁ P x = (∃ y⦁ x = rep y)))⌝));
=DESCRIBE
$⦏TypeDefn⦎$ is the HOL constant used to express the fact that
a predicate and a representation function form
a suitable pair for a valid type definition.
It is used in $new\_type\_defn$(q.v.).
Its definition is bound to the ML variable $type\_defn\_def$.
=ENDDOC
Red tape to end theory design.
=THSML
summarize_td_results ();
val ⦏log_success⦎ = theory_check_success ();
initialise_td_results ();
=TEX

\subsection{The Signature $LogTheory$}

=DOC
signature ⦏LogTheory⦎ = sig
	val ⦏f_def⦎ : THM;
	val ⦏one_one_def⦎ : THM;
	val ⦏onto_def⦎ : THM;
	val ⦏t_def⦎ : THM;
	val ⦏type_defn_def⦎ : THM;
	val ⦏∃_def⦎ : THM;
	val ⦏¬_def⦎ : THM;
	val ⦏∧_def⦎ : THM;
	val ⦏∀_def⦎ : THM;
	val ⦏∨_def⦎ : THM;
end;
=DESCRIBE
The signature $LogTheory$ contains the definitions for
the theory $log$(q.v.). This defines the basic predicate calculus
connectives and other derived notions which are needed
to state the axioms for HOL.
=ENDDOC

\newpage
\section{THE THEORY ``init''}
\subsection{The Design of Theory ``init''}
=THDOC
req_name "init" (Value "log");
=DESCRIBE
The five primitive axioms of ICL HOL are introduced by
the theory ``⦏init⦎''.
=ENDDOC
=THDOC
req_axiom (["bool_cases_axiom"], ([],
	⌜∀ b⦁ b = T ∨ b = F⌝));
=DESCRIBE
The axiom $⦏bool\_cases\_axiom⦎$ expresses the fact
that booleans are true or false.
It is bound to the ML variable $bool\_cases\_axiom$.
=ENDDOC
=THDOC
req_axiom (["⇒_antisym_axiom"], ([],
	⌜∀ b1 b2⦁ (b1 ⇒ b2) ⇒ (b2 ⇒ b1) ⇒ b1 = b2⌝));
=DESCRIBE
The axiom $⦏⇒\_antisym\_axiom⦎$ expresses the fact
that $⇒$ is anti-symmetric.
It is bound to the ML variable $⇒\_antisym\_axiom$.
=ENDDOC
=THDOC
req_axiom (["η_axiom"], ([],
	⌜∀ f:'a → 'b⦁ (λ x⦁ f x) = f⌝));
=DESCRIBE
The axiom $⦏η\_axiom⦎$ expresses the presence of
eta-reduction in ICL HOL.
It is bound to the ML variable $η\_axiom$.
=ENDDOC
=THDOC
req_axiom (["ε_axiom"], ([],
	⌜∀ P (x:'a)⦁ P x ⇒ P ($ε P)⌝));
=DESCRIBE
The axiom $⦏ε\_axiom⦎$ expresses the fact that
if some value satisfies a predicate, then ``choice''
of that predicate satisfies the predicate.
It is bound to the ML variable $ε\_axiom$.
=ENDDOC
=THDOC
req_axiom (["infinity_axiom"], ([],
	⌜∃ f:IND → IND⦁ OneOne f ∧ ¬ Onto f⌝));
=DESCRIBE
The axiom $⦏infinity\_axiom⦎$ expresses the fact that
$IND$ is infinite.
It is bound to the ML variable $infinity\_axiom$.
=ENDDOC
Red tape to end theory design.
=THSML
summarize_td_results ();
val ⦏init_success⦎ = theory_check_success ();
initialise_td_results ();
=TEX

\subsection{The Signature $InitTheory$}
=DOC
signature ⦏InitTheory⦎ = sig
	val ⦏bool_cases_axiom⦎ : THM;
	val ⦏η_axiom⦎ : THM;
	val ⦏infinity_axiom⦎ : THM;
	val ⦏⇒_antisym_axiom⦎ : THM;
	val ⦏ε_axiom⦎ : THM;
end;
=DESCRIBE
The signature $InitTheory$ contains the definitions for
the theory $init$(q.v.). This contains the five primitive
axioms of HOL.
=ENDDOC

\newpage
\section{THE THEORY ``misc''}
\subsection{The Design of Theory ``misc''}
The following design records the total contents of
of ``misc'', rather than the initial
entries of \cite{DS/FMU/IED/IMP023}.
=THDOC
req_name "misc" (Value "init");
=DESCRIBE
The theory ``⦏misc⦎'' contains miscellaneous definitions
and theorems
that are useful in constructing the proof development system.
Note that the theory ``misc'' is extended by the
actions of more than one structure.
=ENDDOC
=THDOC
req_const ("∃⋎1",ⓣ('a → BOOL) → BOOL⌝);
req_binder "∃⋎1";
req_terminator "∃⋎1";
req_defn(["∃⋎1","∃⋎1_def"],([],
	⌜$∃⋎1 = (λ P:'a → BOOL⦁ ∃ t⦁ P t ∧ (∀ x⦁ P x ⇒ x = t))⌝));
=DESCRIBE
$⦏∃⋎1⦎$ is the HOL constant for unique existential quantification.
Its definition is bound to the ML variable $∃⋎1\_def$.
=ENDDOC
=THDOC
req_const ("Let", ⓣ('a → 'b) → 'a → 'b⌝);
req_defn (["Let","let_def"],([],⌜Let = (λ (f:'a → 'b) x⦁ f x)⌝));
=DESCRIBE
$⦏Let⦎$ is the HOL constant used to implement local definitions.
Its definition is bound to the ML variable $let\_def$.
=ENDDOC
=THDOC
req_const ("Cond", ⓣBOOL → 'a → 'a → 'a⌝);
req_defn (["Cond","cond_def"],([],⌜Cond =
	(λ b (x1:'a) (x2:'a) ⦁
	 ε x⦁ ((b ⇔ T) ⇒ x = x1) ∧ ((b ⇔ F) ⇒ x = x2))⌝));
=DESCRIBE
$⦏Cond⦎$ is the HOL constant used to implement conditionals.
Its definition is bound to the ML variable $cond\_def$.
=ENDDOC
=THDOC
req_const("pp'TS",ⓣBOOL → BOOL⌝);
req_defn(["pp'TS","pp'ts_def"],([],⌜∀ x⦁ pp'TS x ⇔ x⌝));
=DESCRIBE
$⦏pp'TS⦎$ is a HOL constant used to implement the subgoal
package
(see, e.g. $goal\_state\_thm$).
It is declared in the structure $SubgoalPackage$.
It should only be introduced by the user if they are
fully conversant with its role in the subgoal package.
It is bound to the ML variable $⦏pp'ts\_def⦎$.
=ENDDOC
=THDOC
req_alias ("⇔", ⌜$= : BOOL → BOOL → BOOL⌝);
req_infix (10,"⇔");
req_terminator "⇔";
=DESCRIBE
The alias $⦏⇔⦎$ represents boolean equality, ``if and only if''.
=ENDDOC
=THDOC
req_const("Arbitrary",ⓣ'a⌝);
=DESCRIBE
By its type, and lack of constraints, the constant $⦏Arbitrary⦎$ has a type instance that is a member of any type.
=USES
It is to be used when a fixed, but unknown value is required.
=ENDDOC
=THDOC
req_thm("⦏t_thm⦎",
	([],⌜T⌝));
req_thm("⦏¬_thm⦎",
	([],⌜∀ t⦁ ¬ t ⇔ t ⇒ F⌝));
req_thm("⦏¬_thm1⦎",
	([],⌜∀ t⦁ ¬ t ⇔ t ⇔ F⌝));
req_thm("⦏f_thm⦎",
	([],⌜¬ F⌝));
req_thm("⦏¬_t_thm⦎",
	([],⌜¬ T ⇔ F⌝));
req_thm("⦏¬_¬_thm⦎",
	([],⌜∀ a⦁ ¬ ¬ a ⇔ a⌝));
req_thm("⦏¬_∨_thm⦎",
	([],⌜∀ a b⦁ ¬ (a ∨ b) ⇔ ¬ a ∧ ¬ b⌝));
req_thm("⦏¬_⇒_thm⦎",
	([],⌜∀ a b⦁ ¬ (a ⇒ b) ⇔ a ∧ ¬ b⌝));
req_thm("⦏¬_⇔_thm⦎",
	([],⌜∀ a b⦁ ¬ (a ⇔ b) ⇔ a ∧ ¬ b ∨ b ∧ ¬ a⌝));
req_thm("⦏¬_f_thm⦎",
	([],⌜¬ F ⇔ T⌝));
req_thm("⦏¬_if_thm⦎",
	([],⌜∀ a b c⦁ ¬ (if a then b else c) ⇔ (if a then ¬ b else ¬ c)⌝));
req_thm("⦏¬_∧_thm⦎",
	([],⌜∀ a b⦁ ¬ (a ∧ b) ⇔ ¬ a ∨ ¬ b⌝));
=DESCRIBE
These theorems are assorted tautologies declared in structure $Tactics2$.
=ENDDOC
=THDOC
req_thm("⦏¬_∀_thm⦎",
	([],⌜∀ p:'a → BOOL⦁ ¬ $∀ p ⇔ (∃ x⦁ ¬ p x)⌝));
req_thm("⦏¬_∃_thm⦎",
	([],⌜∀ p:'a → BOOL⦁ ¬ $∃ p ⇔ (∀ x⦁ ¬ p x)⌝));
=DESCRIBE
The theorems ``$⦏¬_∀_thm⦎$'' and ``$⦏¬_∃_thm⦎$'' are
used in implementing $¬\-\_simple\-\_∀\_conv$ and $¬\-\_simple\-\_∃\_conv$
 or may also be used ``straight'' in rewriting,
declared in structure $DerivedRules1$.
=ENDDOC
=THDOC
req_thm("⦏∃_intro_thm⦎",
	([],⌜∀ P x⦁ P x ⇒ $∃ P⌝));
=DESCRIBE
The theorem $∃\_intro\_thm$ is
used in implementing $v\_∃\_intro$ in structure $DerivedRules2$.
=ENDDOC
=THDOC
req_thm("⦏∨_thm⦎",
	([],⌜∀ t1 t2⦁ t1 ∨ t2 ⇔ (∀ b⦁ (t1 ⇒ b) ⇒ (t2 ⇒ b) ⇒ b)⌝));
req_thm("⦏∧_thm⦎",
	([],⌜∀ t1 t2⦁ t1 ∧ t2 ⇔ (∀ b⦁ (t1 ⇒ t2 ⇒ b) ⇒ b)⌝));
req_thm("⦏cond_thm⦎",
	([],⌜∀ a⦁ ∀ t1 t2:'a⦁ (if a then t1 else t2) =
	 (ε x⦁ ((a ⇔ T) ⇒ x = t1) ∧ ((a ⇔ F) ⇒ x = t2))⌝));
req_thm("⦏∃⋎1_thm⦎",
	([],⌜∀ P:'a → BOOL⦁ $∃⋎1 P ⇔ (∃ t⦁ P t ∧ (∀ x⦁ P x ⇒ x = t))⌝));
req_thm("⦏⇒_thm⦎",
	([],⌜∀ a b⦁ a ⇒ b ⇔ ¬ a ∨ b⌝));
req_thm("⦏⇔_thm⦎",
	([],⌜∀ a b⦁ (a ⇔ b) ⇔ (a ⇒ b) ∧ (b ⇒ a)⌝));
req_thm("⦏if_thm⦎",
	([],⌜∀ a b c⦁ (if a then b else c) ⇔ a ∧ b ∨ ¬ a ∧ c⌝));
=DESCRIBE
These theorems
should be, as far as the user is concerned,
the defining theorems of their primary operators.
However, early definitions in the system require
a simplest form, so these intermediate theorems are required.
They are declared in structure $Tactics2$
=ENDDOC
\subsubsection{Material for Rewriting}
=THDOC
req_thm("⦏eq_rewrite_thm⦎",
	([],⌜∀ x:'a⦁ x = x ⇔ T⌝));
req_thm("⦏⇔_rewrite_thm⦎",
	([],⌜∀ t⦁ ((T ⇔ t) ⇔ t) ∧ ((t ⇔ T) ⇔ t) ∧ ((F ⇔ t) ⇔ ¬ t) ∧
	 ((t ⇔ F) ⇔ ¬ t)⌝));
req_thm("⦏¬_rewrite_thm⦎",
	([],⌜∀ t⦁ (¬ ¬ t ⇔ t) ∧ (¬ T ⇔ F) ∧ (¬ F ⇔ T)⌝));
req_thm("⦏∧_rewrite_thm⦎",
	([],⌜∀ t⦁ (T ∧ t ⇔ t) ∧ (t ∧ T ⇔ t) ∧ ¬ (F ∧ t) ∧ ¬ (t ∧ F) ∧
	 (t ∧ t ⇔ t)⌝));
req_thm("⦏∨_rewrite_thm⦎",
	([],⌜∀ t⦁ (T ∨ t) ∧ (t ∨ T) ∧ (F ∨ t ⇔ t) ∧ (t ∨ F ⇔ t) ∧
	 (t ∨ t ⇔ t)⌝));
req_thm("⦏⇒_rewrite_thm⦎",
	([],⌜∀ t⦁ (T ⇒ t ⇔ t) ∧ (F ⇒ t ⇔ T) ∧ (t ⇒ T ⇔ T) ∧ (t ⇒ t ⇔ T) ∧
	 (t ⇒ F ⇔ ¬ t)⌝));
req_thm("⦏if_rewrite_thm⦎",
	([],⌜∀ t1 t2:'a⦁ (if T then t1 else t2) = t1 ∧ (if F then t1 else t2)
	 = t2⌝));
req_thm("⦏∀_rewrite_thm⦎",
	([],⌜∀ t⦁ (∀ x:'a⦁ t) ⇔ t⌝));
req_thm("⦏∃_rewrite_thm⦎",
	([],⌜∀ t⦁ (∃ x:'a⦁ t) ⇔ t⌝));
req_thm("⦏β_rewrite_thm⦎",
	([],⌜∀ (t1:'a) (t2:'b)⦁ (λ x:'b⦁ t1) t2 = t1⌝));
=DESCRIBE
These theorems are the ``standard'' rewriting theorems for
their primary operators.
Added to ``misc'' during the creation of structure $Rewriting$.
=ENDDOC
=THDOC
req_thm("⦏type_lemmas_thm⦎",
	([],⌜∀ pred:'b → BOOL ⦁ (∃ f:'a → 'b⦁ TypeDefn pred f) ⇒
  (∃ abs rep⦁ (∀ a:'a⦁ abs (rep a) = a) ∧ (∀ r⦁ pred r ⇔ rep (abs r) = r))⌝));
req_thm("⦏one_one_thm⦎",
	([],⌜∀ f:'a→'b⦁ OneOne f ⇔ (∀ x y⦁ f x = f y ⇔ x = y)⌝));
req_thm("⦏ext_thm⦎",
	([],⌜∀ f g:'a → 'b⦁ f = g ⇔ (∀ x⦁ f x = g x)⌝));
req_thm("⦏fun_rel_thm⦎",
	([],⌜∀ r⦁ (∃ f⦁ ∀ x y⦁ f x = y ⇔ r x y) ⇔
     (∀ x⦁ ∃ y⦁ r x y ∧ (∀ z⦁ r x z ⇒ z = y))⌝));
=DESCRIBE
These theorems
are miscellaneous theorems saved in ``misc'' during the
creation of structure $PairTheory$.
=ENDDOC
Red tape to end theory design.
=THSML
summarize_td_results ();
val ⦏misc_success⦎ = theory_check_success ();
=TEX

\subsection{The Signature $MiscTheory$}

The signature $MiscTheory$ contains miscellaneous definitions
which are useful in constructing the proof development system.

=DOC
signature ⦏MiscTheory⦎ = sig
	val ⦏cond_def⦎ : THM;
	val ⦏let_def⦎ : THM;
	val ⦏∃⋎1_def⦎ : THM;
end;
=DESCRIBE
The signature $MiscTheory$ contains the initial definitions for
the theory $misc$. This contains miscellaneous definitions
and theorems required in constructing the proof development
system.
Further items may be saved in theory ``misc'', and bound
to ML variables in other signatures and structures.
=ENDDOC

\newpage

\section{TEST POLICY}
The tests should follow the standards and guidelines
laid down in \cite{DS/FMU/IED/PLN008}.
The theories declared should be checked using the theory design
tools of \cite{DS/FMU/IED/DTD035}.

\twocolumn[\section{INDEX OF DEFINED TERMS}]
\printindex
\end{document}




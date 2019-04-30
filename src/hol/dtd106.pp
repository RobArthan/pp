=IGN
********************************************************************************
dtd106.doc: this file is part of the PPHol system

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

\def\Title{Detailed Design of Arithmetic Proof Procedures For Z}

\def\AbstractText{This document contains the detailed design of proof procedures for integer arithmetic in Z. The main proof procedures provided are arithmetic normalisation and a linear arithmetic prover.}

\def\Reference{DS/FMU/IED/DTD106}

\def\Author{R.D. Arthan}


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
%% LaTeX2e port: \def\TPPheadtitle{Arithmetic Proof Procedures For Z}
%% LaTeX2e port: \TPPtitle{Detailed Design of Arithmetic Proof Procedures For Z}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/DTD106}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.11 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2003/09/30 11:57:27 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{R.D.~Arthan & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.B.~Jones & FMU Manager}
%% LaTeX2e port: \TPPabstract{This document contains the detailed design of proof
%% LaTeX2e port: procedures for integer arithmetic in Z.
%% LaTeX2e port: The main proof procedures provided are arithmetic normalisation and a linear arithmetic prover.}
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
\section{Document control}
\subsection{Contents list}
\tableofcontents
\subsection{Document cross references}
\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes history}
\begin{description}
\item[Issues 1.1 (1994/12/20)-1.3 (1994/12/21)] Author's drafts.
\item[Issue 1.4 (1994/12/21)] First attempt at integration.
\item[Issue 1.5 (1995/01/04)] Changed language of the theory to HOL.
This is only necessary, because the theory listing in the gives {\LaTeX} errors.
However, the definitions in the theory aren't Z, so this solution has some justification.
\item[Issue 1.6 (1996/03/07)]
Added $(')z\_lin\_arith1$ proof context.
\item[Issue 1.7 (1999/02/17)]
Correction for SML97.
\item[Issue 1.8 (2002/10/16)]
Fixed {\LaTeX} error.
\item[Issue 1.9 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.10 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.11 (2003/09/30)] Removed illegal character.
\item[Issue 1.12 (2004/01/19)] The Z universal set is now called 𝕌.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes forecast}
As determined by comments and use.
\newpage
\section{GENERAL}
\subsection{Scope}
This document contains the detailed design of part of the \ProductZ\ system.
The document responds to \cite{DS/FMU/IED/HLD016}.
\subsection{Introduction}
\subsubsection{Purpose and Background}
The purpose of this document is to provide facilities for the integers in Z analogous to those for the integers in HOL as described in \cite{DS/FMU/IED/DTD093}.
The main facilities are a conversion to put arithmetic expressions into a normal form and a decision procedure for zero-order linear arithmetic.

For simplicity of implementation, the facilities are provided by an interface to those for HOL.
This enables much better re-use of existing material than would be possible in a direct implementation (because the arithmetic

\subsubsection{Dependencies}
This document depends on the theory $z\_numbers$ defined in
\cite{DS/FMU/IED/DTD086}, on the conversions and other tools in  \cite{DS/FMU/IED/DTD105}.

\subsubsection{Algorithms}
For simplicity of implementation, the facilities are provided by an interface to those for HOL.
This enables much better re-use of existing material than would be possible in a direct implementation (at heart, because the generic support for arithmetic normalisation in \cite{DS/FMU/IED/DTD081} deals with curried HOL functions and adjusting it to work with Z infix operators would involve a relatively large amount of custom re-coding or interfacing).

For the arithmetic normalisation, the main interface here uses the HOL conversion and then converts back to Z.
As the linear arithmetic prover is a prove-or-fail black box, most users will be not need any understanding of the conversion to HOL behind the scenes.


\subsubsection{Possible Enhancements}
Several additions could be made.
E.g., more interfaces for the tactic programmer (e.g., see $and\_conv1$ in the implementation.
\newpage
\section{THE THEORY}
=SML
open_theory"z_numbers";
new_theory"z_arithmetic_tools";
set_current_language"HOL";
ⓈHOLCONST
│	z_ℤ ℤ_z: ℤ → ℤ
├
│	ℤ_z (ℕℤ 1) = ⓩ1⌝
│
│∧	(∀ i j⦁ ℤ_z (i +⋎Z j) = ⓩ⌜ℤ_z i⌝ + ⌜ℤ_z j⌝⌝)
│∧	(∀ i⦁ ℤ_z (~⋎Z i) = ⓩ~⌜ℤ_z i⌝⌝)
│
│∧	z_ℤ ⓩ1⌝ = ℕℤ 1
│
│∧	(∀ i j⦁ z_ℤ ⓩi + j⌝ = z_ℤ i +⋎Z z_ℤ j)
│∧	(∀ i⦁ z_ℤ ⓩ~ i⌝ = ~⋎Z(z_ℤ i))
│
│∧	(∀x⦁ z_ℤ(ℤ_z x) = x) ∧ (∀y⦁ ℤ_z(z_ℤ y) = y)
■
=TEX
\section{SIGNATURE}
=DOC
signature ⦏ZArithmeticTools⦎ = sig
=DESCRIBE
This is the signature of a structure containing arithmetic and an automatic linear
arithmetic prover for the integers in Z.
=ENDDOC
\subsection{Conversion of Z Arithmetic to HOL Arithmetic}

=DOC
	val ⦏z_ℤ_conv⦎ : CONV;
	val ⦏ℤ_z_conv⦎ : CONV;
=DESCRIBE
In the theory $z\_arithmetic\_tools$, isomorphisms, $z\_ℤ$ and $ℤ\_z$, are defined between the Z integers and the HOL integers.
These may be used to translate an arithmetic problem in Z into one in HOL.
These conversions implement this translation and its inverse.

The operators handled by the conversions are
=INLINEFT
+, *, ~
=TEX
\ and $-$.

The translation to HOL is carried out according to the following scheme:

=GFT
z_ℤⓩt1 + t2⌝	→	⌜z_ℤ t1 + z_ℤ  t2⌝
z_ℤⓩt1 * t2⌝	→	⌜z_ℤ t1 * z_ℤ  t2⌝
z_ℤⓩ~t1⌝	→	⌜~ z_ℤ t1⌝
z_ℤⓩℤ_z t1⌝	→	⌜t1⌝
z_ℤⓩZ'Int c⌝	→	⌜ℕℤ c⌝
=TEX

$z\_ℤ\_conv$ implements the above scheme recursively to translate the
result of applying $z\_ℤ$ to a Z arithmetic expression into HOL.

$ℤ\_z\_conv$ is the analogue of $z\_ℤ\_conv$, performing the translation of $ℤ\_z$ applied to a HOL integer arithmetic expression into Z.
=USES
Tactic programming.
=SEEALSO
=INLINEFT
z_anf_conv, z_lin_arith, 'z_lin_arith
=FAILURE
106001	?0 is not of the form ⌜z_ℤ ⓩt⌝⌝ where ⓩt⌝ is constructed from +, ~, -, * or
	integer constants
106002	?0 is not of the form ⌜ℤ_z ⌜t⌝⌝ where ⌜t⌝ is constructed from +, ~, -, * or
	integer constants
=ENDDOC
\subsection{Arithmetic Normalisation}

=DOC
	val ⦏z_anf_conv⦎ : CONV;
=DESCRIBE
=INLINEFT
z_anf_conv
=TEX
\ is a conversion which proves theorems of the form
=INLINEFT
⊢ t1 = t2
=TEX
\ where $t1$ is a Z expression formed from atoms of type ℤ and
$t2$ is in what we may call additive normal form, i.e. it has the form:
=INLINEFT
t⋎1 + t⋎2 + ...
=TEX
, where the
=INLINEFT
t⋎i
=TEX
\ have the form
=INLINEFT
s⋎1 * s⋎2 * ...
=TEX
where the
=INLINEFT
s⋎i
=TEX
\ are atoms.
Here, by atom
we mean an expression which is not of the form
=INLINEFT
t⋎1 + t⋎2 + ...
=TEX
or
=INLINEFT
s⋎1 * s⋎2 * ...
=TEX
.

The summands
=INLINEFT
t⋎i
=TEX
\ and,
within them,
the factors
=INLINEFT
s⋎j
=TEX
\ are given in increasing order with respect to the ordering
on terms analogous to that given by the function
=INLINEFT
z_term_order
=TEX
, q.v. Arithmetic computation is carried out on atoms to ensure
that at most one of the summands is a numeric literal and that, within
each summand, at most one factor is a numeric literal. Any literal appears
at the beginning of its factor or summand and addition of $0$
or multiplication by $1$ is simplified out.
Any signs are moved to the first factor in each summand.

The conversion fails with error number 106010 if there no changes can be
made to the term.

=FAILURE
106010	?0 is not of type ⓣℤ⌝ or is already in additive normal form
=ENDDOC


\section{PROOF CONTEXTS}
=DOC
(* Proof Context: ⦏z_lin_arith⦎ *)
(* Proof Context: ⦏z_lin_arith1⦎ *)
=DESCRIBE
``$z\_lin\_arith$'' is a proof context whose main purpose is to supply a decision procedure
for problems in linear arithmetic in Z.
``$z\_lin\_arith1$''  differs from it only by using ``$'z\_numbers1$''.
The proof context provides an interface to the proof context $'ℤ\_lin\_arith$ which provides the analogous facilities for the HOL integers.
\paragraph{Contents}
The proof context is the result of merging $z\_predicates$, $'z\_numbers(1)$ and $'z\_lin\_arith$.

\paragraph{Examples}
=INLINEFT
PC_T1"z_lin_arith"prove_tac[]
=TEX
\ will prove any of the following goals:
=GFT
	([], ⓩ∀a, b, c:ℤ⦁a ≤ b ∧ (a + b < c + a) ⇒ a < c⌝)
	([], ⓩ∀a, b, c:ℤ⦁a ≥ b ∧ ¬ b < c ⇒ a ≥ c⌝)
	([], ⓩ∀a, b, c:ℤ⦁a + 2*b < 2*a ⇒ b + b < a⌝)
	([], ⓩ∀ x, y:ℤ⦁ ¬ (2*x + y = 4 ∧ 4*x + 2*y = 7)⌝)
=TEX

In the following example, an induction reduces the problem to linear
arithmetic, and then the automatic proof tactic in $z\_lin\_arith$
completes the proof.
=GFT
set_goal([], ⓩ∀b:ℕ⦁(b + 1)*(b + 1) > 0⌝);
a(PC_T1 "z_library" REPEAT strip_tac);
a( z_≤_induction_tacⓩb⌝ THEN PC_T1 "z_lin_arith" asm_prove_tac[]);
pop_thm();
=TEX
=SEEALSO
=INLINEFT
'z_lin_arith
=FAILUREC
\paragraph{Errors}
The errors reported by the automatic proof tactic are as for $'ℤ\_lin\_arith$.
=ENDDOC
=DOC
(* Proof Context: ⦏'z_lin_arith⦎ *)
(* Proof Context: ⦏'z_lin_arith1⦎ *)
=DESCRIBE
``$'z\_lin\_arith$'' is a component proof context whose purpose is to supply a decision procedure
for problems in linear arithmetic for the integers in Z.
``$'z\_lin\_arith1$'' i a copy, only differing in using ``$'z_numbers1$''.
\paragraph{Contents}
The rewriting, theorem stripping and conclusion stripping components
are those from $'z_numbers$ augmented with the following
transformations:
=GFT
ⓩ(a ⦂ ℤ) = b⌝		→	ⓩa ≤ b ∧ b ≤ a⌝
ⓩa ≤ b⌝		→	⌜ⓜTRY_C z_ℤ_conv ⌜z_ℤ a⌝⌝ ≤ ⓜTRY_C z_ℤ_conv ⌜b⌝⌝⌝
ⓩa < b⌝		→	⌜ⓜTRY_C z_ℤ_conv ⌜a⌝⌝ < ⓜTRY_C z_ℤ_conv ⌜b⌝⌝⌝
ⓩx ∈ ℕ⌝		→	⌜0 ≤ x⌝
=TEX
(where all variables are of type ℤ).
The effect of the above scheme is to transformed any Z equation or inequality in ≤ or $<$ into an equivalent inequality over the HOL integers.
The automatic proof procedures for the proof context are (slight adaptations of) the ones in the proof context $ℤ\_lin\_arith$, which can then automatically prove the transformed form if it is a theorem of linear arithmetic.

The automatic proof components is an interface to the one for $'ℤ\_lin\_arith$.
Other components are as for $'z\_numbers$.

\paragraph{Examples}
A typical use of the proof context would be to solve problems containing
a mixture of (linear) arithmetic and set theory.

For example,
=INLINEFT
MERGE_PCS_T1["z_sets_ext", "'z_lin_arith"]prove_tac[]
=TEX
will prove any of the following goals:
=GFT
	([], ⓩ∀m:ℤ⦁ {i:ℤ | m ≤ i ∧ i < m+3} = {m, m+1, m+2}⌝)
	([], ⓩ{i, j : ℤ | 30*i = 105*j} = {i, j : ℤ | 2*i = 7*j}⌝)
	([], ⓩ{i : ℤ | 5*i = 6*i} = {0}⌝)
=SEEALSO
=INLINEFT
z_lin_arith, z_numbers, 'z_numbers
=FAILUREC
\paragraph{Errors}
The errors reported by the automatic proof tactic are as for $'ℤ\_lin\_arith$.
=ENDDOC
\section{THEOREMS}
=DOC
val ⦏z_ℤ_def⦎ : THM;
val ⦏ℤ_z_def⦎ : THM;
val ⦏z_ℤ_plus_thm⦎ : THM;
val ⦏z_ℤ_times_thm⦎ : THM;
val ⦏z_ℤ_subtract_thm⦎ : THM;
val ⦏z_ℤ_minus_thm⦎ : THM;
val ⦏ℤ_z_plus_thm⦎ : THM;
val ⦏ℤ_z_times_thm⦎ : THM;
val ⦏ℤ_z_subtract_thm⦎ : THM;
val ⦏ℤ_z_minus_thm⦎ : THM;
val ⦏z_ℤ_one_one_thm⦎ : THM;
val ⦏ℤ_z_one_one_thm⦎ : THM;
val ⦏z_≤_ℤ_≤_thm⦎ : THM;
val ⦏z_less_ℤ_less_thm⦎ : THM;
=DESCRIBE
These are the Standard ML bindings for the theorems saved in the theory $z\_arithmetic\_tools$ which provides isomorphisms between the ring of integers in HOL and the ring of integers in Z.
The main purpose of this theory is to allow proof procedures for HOL integers to be adapted to work with Z.
The most common way of using these isomorphisms is via the proof context $z\_lin\_arith$, q.v.
=ENDDOC
=THDOC
req_name ⦏"z_arithmetic_tools"⦎ (Value "z_numbers");
req_language "HOL";
set_flag("tc_thms_only",true);
=DESCRIBE
The theory $z\_arithmetic\_tools$ contains definitions allowing proof procedures for HOL integers to be adapted to work with Z.
=ENDDOC
=THDOC
req_consistency_thm⌜ℤ_z⌝;
req_consistency_thm⌜z_ℤ⌝;
req_thm("z_ℤ_plus_thm",
	([], ⌜∀ i j⦁ ⓩ⌜z_ℤ ⓩi + j⌝⌝⌝ = ⓩ⌜z_ℤ i⌝⌝ +⋎Z ⓩ⌜z_ℤ j⌝⌝⌝));
req_thm("z_ℤ_times_thm",
	([], ⌜∀ i j⦁ ⓩ⌜z_ℤ ⓩi * j⌝⌝⌝ = ⓩ⌜z_ℤ i⌝⌝ *⋎Z ⓩ⌜z_ℤ j⌝⌝⌝));
req_thm("z_ℤ_subtract_thm",
	([], ⌜∀ i j⦁ ⓩ⌜z_ℤ ⓩi - j⌝⌝⌝ = ⓩ⌜z_ℤ i⌝⌝ -⋎Z ⓩ⌜z_ℤ j⌝⌝⌝));
req_thm("z_ℤ_minus_thm",
	([], ⌜∀ i⦁ ⓩ⌜z_ℤ ⓩ~ i⌝⌝⌝ = ~⋎Z ⓩ⌜z_ℤ i⌝⌝⌝));
req_thm("ℤ_z_plus_thm",
	([], ⌜∀ i j⦁ ⓩ⌜ℤ_z (i +⋎Z j)⌝⌝ = ⓩ⌜ℤ_z i⌝ + ⌜ℤ_z j⌝⌝⌝));
req_thm("ℤ_z_times_thm",
	([], ⌜∀ i j⦁ ⓩ⌜ℤ_z (i *⋎Z j)⌝⌝ = ⓩ⌜ℤ_z i⌝ * ⌜ℤ_z j⌝⌝⌝));
req_thm("ℤ_z_subtract_thm",
	([], ⌜∀ i j⦁ ⓩ⌜ℤ_z (i -⋎Z j)⌝⌝ = ⓩ⌜ℤ_z i⌝ - ⌜ℤ_z j⌝⌝⌝));
req_thm("ℤ_z_minus_thm",
	([], ⌜∀ i⦁ ⓩ⌜ℤ_z (~⋎Z i)⌝⌝ = ⓩ~ ⌜ℤ_z i⌝⌝⌝));
req_thm("z_ℤ_one_one_thm",
	([], ⌜∀ i j⦁ ⓩ⌜z_ℤ i⌝⌝ = ⓩ⌜z_ℤ j⌝⌝ ⇔ i = j⌝));
req_thm("ℤ_z_one_one_thm",
	([], ⌜∀ i j⦁ ⓩ⌜ℤ_z i⌝⌝ = ⓩ⌜ℤ_z j⌝⌝ ⇔ i = j⌝));
req_thm("z_≤_ℤ_≤_thm",
	([], ⌜∀ i j⦁ ⓩ(i, j)⌝ ∈ ⓩ(_ ≤ _)⌝ ⇔ ⓩ⌜z_ℤ i⌝⌝ ≤⋎Z ⓩ⌜z_ℤ j⌝⌝⌝));
req_thm("z_less_ℤ_less_thm",
	([], ⌜∀ i j⦁ ⓩ(i, j)⌝ ∈ ⓩ(_ < _)⌝ ⇔ ⓩ⌜z_ℤ i⌝⌝ <⋎Z ⓩ⌜z_ℤ j⌝⌝⌝));
=DESCRIBE
These theorems are of use in programming with the isomorphisms $z\_ℤ$
and $ℤ\_z$ which relate the Z and HOL integers.
=ENDDOC
\section{EPILOGUE}
=SML
end (* of signature ZArithmeticTools *);
=TEX
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}


